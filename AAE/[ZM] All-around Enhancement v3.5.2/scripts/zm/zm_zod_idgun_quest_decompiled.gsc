#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_ai_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_raps;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_timer;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_idgun;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craftables;
#include scripts\zm\zm_zod_smashables;
#include scripts\zm\zm_zod_sword_quest;
#include scripts\zm\zm_zod_util;
#include scripts\zm\zm_zod_vo;

#namespace zm_zod_idgun_quest;

/*
	Name: __init__sytem__
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x750
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 41
*/
function autoexec __init__sytem__()
{
	system::register("zm_zod_idgun_quest", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x798
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function __init__()
{
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	clientfield::register("world", "add_idgun_to_box", 1, 4, "int");
	clientfield::register("world", "remove_idgun_from_box", 1, 4, "int");
	level flag::init("second_idgun_time");
	for(i = 0; i < 3; i++)
	{
		level flag::init("idgun_cocoon_" + i + "_found");
	}
	/#
		level thread function_1c946455();
		level thread function_e4e5cd30();
		return;
	#/
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __main__
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x8E8
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 85
*/
function __main__()
{
	var_fd261f68 = Array("idgun_0", "idgun_1", "idgun_2", "idgun_3");
	level function_436486f7();
	zm_spawner::register_zombie_death_event_callback(&function_101cc4e2);
	for(i = 0; i < 2; i++)
	{
		level.idgun[i] = spawnstruct();
		level.idgun[i].kill_count = 0;
		level.idgun[i].var_356fbd8b = i;
		var_fd261f68 = Array::randomize(var_fd261f68);
		level.idgun[i].var_e4be281f = Array::pop_front(var_fd261f68);
		zm_weapons::add_limited_weapon(level.idgun[i].var_e4be281f, 1);
		for(j = 0; j < level.idgun_weapons.size; j++)
		{
			if(level.idgun[i].var_e4be281f == level.idgun_weapons[j].name)
			{
				level.idgun[i].var_e787e99a = j;
				break;
			}
		}
	}
	wait(0.5);
	level thread function_b4c3b798();
}

/*
	Name: function_e1efbc50
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0xAF8
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 121
*/
function function_e1efbc50(var_9727e47e)
{
	if(var_9727e47e != level.weaponNone)
	{
		if(!isdefined(level.idgun_weapons))
		{
			level.idgun_weapons = [];
		}
		else if(!IsArray(level.idgun_weapons))
		{
			level.idgun_weapons = Array(level.idgun_weapons);
		}
		level.idgun_weapons[level.idgun_weapons.size] = var_9727e47e;
	}
}

/*
	Name: function_436486f7
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0xB90
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 147
*/
function function_436486f7()
{
	level.idgun_weapons = [];
	function_e1efbc50(GetWeapon("idgun_0"));
	function_e1efbc50(GetWeapon("idgun_1"));
	function_e1efbc50(GetWeapon("idgun_2"));
	function_e1efbc50(GetWeapon("idgun_3"));
	function_e1efbc50(GetWeapon("idgun_upgraded_0"));
	function_e1efbc50(GetWeapon("idgun_upgraded_1"));
	function_e1efbc50(GetWeapon("idgun_upgraded_2"));
	function_e1efbc50(GetWeapon("idgun_upgraded_3"));
}

/*
	Name: on_player_connect
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0xCF0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 170
*/
function on_player_connect()
{
	return;
}

/*
	Name: on_player_spawned
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0xD00
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function on_player_spawned()
{
}

/*
	Name: function_14e2eca6
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0xD10
	Size: 0x248
	Parameters: 1
	Flags: None
	Line Number: 199
*/
function function_14e2eca6(params)
{
	if(level.round_number < 12)
	{
		return;
	}
	if(self.does_not_count_to_round === 1)
	{
		return;
	}
	if(level flag::get("part_xenomatter" + "_found"))
	{
		return;
	}
	if(isdefined(level.var_689ff92e) && level.var_689ff92e)
	{
		return;
	}
	if(!isPlayer(params.eAttacker))
	{
		return;
	}
	n_rand = RandomFloatRange(0, 1);
	if(n_rand >= 0.1)
	{
		return;
	}
	level.var_689ff92e = 1;
	var_dad4b542 = self GetOrigin();
	var_72cd7c0a = GetClosestPointOnNavMesh(var_dad4b542, 500, 0);
	var_ca79e2ce = (var_dad4b542[0], var_dad4b542[1], 0);
	var_dcaa8f8e = (var_72cd7c0a[0], var_72cd7c0a[1], 0);
	if(var_ca79e2ce == var_dcaa8f8e)
	{
		function_f5469e1(var_72cd7c0a, "part_xenomatter");
	}
	if(!level flag::get("part_xenomatter" + "_found"))
	{
		var_71e3d70a = level zm_craftables::get_craftable_piece_model("idgun", "part_xenomatter");
		var_55d0f940 = struct::get("safe_place_for_items", "targetname");
		var_71e3d70a.origin = var_55d0f940.origin;
		level.var_689ff92e = 0;
	}
}

/*
	Name: function_c3ffc175
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0xF60
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 254
*/
function function_c3ffc175()
{
	if(level clientfield::get("bm_superbeast"))
	{
		function_6baaa92e();
	}
	else if(self.var_89905c65 !== 1)
	{
		function_44e0f6b4();
	}
}

/*
	Name: function_44e0f6b4
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0xFD0
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 276
*/
function function_44e0f6b4()
{
	if(GetDvarInt("splitscreen_playerCount") > 2 && (!(isdefined(level.var_5fadf2ff) && level.var_5fadf2ff)))
	{
		function_6893c200();
		return;
	}
	if(isdefined(level.var_359f6a1d) && level.var_359f6a1d)
	{
		return;
	}
	level.var_359f6a1d = 1;
	drop_point = self GetOrigin();
	drop_point = drop_point + VectorScale((0, 0, 1), 30);
	function_f5469e1(drop_point, "part_heart");
	if(!level flag::get("part_heart" + "_found"))
	{
		var_71e3d70a = level zm_craftables::get_craftable_piece_model("idgun", "part_heart");
		var_55d0f940 = struct::get("safe_place_for_items", "targetname");
		var_71e3d70a.origin = var_55d0f940.origin;
		level.var_359f6a1d = 0;
	}
}

/*
	Name: function_6893c200
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x1158
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 310
*/
function function_6893c200()
{
	level.var_5fadf2ff = 1;
	drop_point = self GetOrigin();
	drop_point = drop_point + VectorScale((0, 0, 1), 30);
	function_f5469e1(drop_point, "part_skeleton");
	if(!level flag::get("part_skeleton" + "_found"))
	{
		var_71e3d70a = level zm_craftables::get_craftable_piece_model("idgun", "part_skeleton");
		var_55d0f940 = struct::get("safe_place_for_items", "targetname");
		var_71e3d70a.origin = var_55d0f940.origin;
		level.var_5fadf2ff = 0;
	}
}

/*
	Name: function_6baaa92e
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x1278
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 335
*/
function function_6baaa92e()
{
	drop_point = self GetOrigin();
	drop_point = drop_point + VectorScale((0, 0, 1), 30);
	var_5404ad23 = spawn("script_model", drop_point);
	var_5404ad23 SetModel("p7_zm_zod_margwa_heart");
	function_a3712047(var_5404ad23);
	return;
	ERROR: Bad function call
}

/*
	Name: function_a3712047
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x1320
	Size: 0x198
	Parameters: 1
	Flags: None
	Line Number: 356
*/
function function_a3712047(var_5404ad23)
{
	width = 128;
	height = 128;
	length = 128;
	var_5404ad23.unitrigger_stub = spawnstruct();
	var_5404ad23.unitrigger_stub.origin = var_5404ad23.origin;
	var_5404ad23.unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	var_5404ad23.unitrigger_stub.cursor_hint = "HINT_NOICON";
	var_5404ad23.unitrigger_stub.script_width = width;
	var_5404ad23.unitrigger_stub.script_height = height;
	var_5404ad23.unitrigger_stub.script_length = length;
	var_5404ad23.unitrigger_stub.require_look_at = 0;
	var_5404ad23.unitrigger_stub.prompt_and_visibility_func = &function_12fffd19;
	zm_unitrigger::register_static_unitrigger(var_5404ad23.unitrigger_stub, &function_dd2f6fe3);
	wait(5);
	var_5404ad23 delete();
}

/*
	Name: function_12fffd19
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x14C0
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 385
*/
function function_12fffd19(player)
{
	b_is_invis = isdefined(player.beastmode) && player.beastmode;
	self setinvisibletoplayer(player, b_is_invis);
	return !b_is_invis;
	b_is_invis++;
}

/*
	Name: function_dd2f6fe3
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x1530
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 403
*/
function function_dd2f6fe3()
{
	for(;;)
	{
		self waittill("trigger", player);
		if(player zm_utility::in_revive_trigger())
		{
		}
		else if(player.IS_DRINKING > 0)
		{
		}
		else if(!zm_utility::is_player_valid(player))
		{
		}
		else
		{
			player thread zm_audio::create_and_play_dialog("margwa", "heart_pickup");
			level thread function_32d36516(self);
			return;
		}
	}
}

/*
	Name: function_32d36516
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x15F0
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 436
*/
function function_32d36516(var_5404ad23)
{
	foreach(player in level.activePlayers)
	{
		player reviveplayer();
	}
	var_5404ad23 delete();
}

/*
	Name: function_f5469e1
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x16A8
	Size: 0x1F0
	Parameters: 4
	Flags: None
	Line Number: 455
*/
function function_f5469e1(v_origin, str_part, var_1907d45e, var_6a2f1c3a)
{
	if(!isdefined(var_1907d45e))
	{
		var_1907d45e = 1;
	}
	if(!isdefined(var_6a2f1c3a))
	{
		var_6a2f1c3a = 0;
	}
	level endon("hash_14edc619");
	if(!var_6a2f1c3a)
	{
		var_71e3d70a = level zm_craftables::get_craftable_piece_model("idgun", str_part);
	}
	else
	{
		var_71e3d70a = level zm_craftables::get_craftable_piece_model("second_idgun", str_part);
	}
	var_71e3d70a.origin = v_origin;
	playable_area = GetEntArray("player_volume", "script_noteworthy");
	valid_drop = 0;
	for(i = 0; i < playable_area.size; i++)
	{
		if(var_71e3d70a istouching(playable_area[i]))
		{
			valid_drop = 1;
		}
	}
	if(!valid_drop)
	{
		var_71e3d70a SetInvisibleToAll();
		return;
	}
	var_71e3d70a setvisibletoall();
	if(!var_1907d45e)
	{
		return;
	}
	wait(10);
	level thread function_21ad8866(var_71e3d70a);
	wait(10);
	var_71e3d70a SetInvisibleToAll();
	level notify("hash_21ad8866");
}

/*
	Name: function_21ad8866
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x18A0
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 511
*/
function function_21ad8866(var_71e3d70a)
{
	level notify("hash_21ad8866");
	level endon("hash_21ad8866");
	level endon("hash_14edc619");
	for(;;)
	{
		var_71e3d70a SetInvisibleToAll();
		wait(0.5);
		var_71e3d70a setvisibletoall();
		wait(0.5);
	}
}

/*
	Name: function_e70e794e
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x1920
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 535
*/
function function_e70e794e(var_bd705d9a)
{
	if(isdefined(var_bd705d9a.is_speaking) && var_bd705d9a.is_speaking)
	{
		return;
	}
}

/*
	Name: function_101cc4e2
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x1960
	Size: 0x1A8
	Parameters: 1
	Flags: None
	Line Number: 553
*/
function function_101cc4e2(attacker)
{
	if(isdefined(self.damageWeapon) && zm::is_idgun_damage(self.damageWeapon))
	{
		if(level flag::get("second_idgun_time") || isdefined(self.var_30d78807))
		{
			return;
		}
		if(isdefined(level.var_e6d966e))
		{
			origin = beamtrace(level.var_e6d966e.origin, level.var_e6d966e.origin - VectorScale((0, 0, 1), 1000), 0, level.var_e6d966e, 1, 0)["position"];
			if(Distance(origin, self.origin) > 300)
			{
				return;
			}
			self.var_30d78807 = 1;
			level.var_e6d966e notify("hash_c340c785");
			self thread function_82e98236(level.var_e6d966e);
			level.var_e6d966e.kill_count++;
			if(level.var_e6d966e.kill_count >= 100)
			{
				level flag::set("second_idgun_time");
				self.attacker namespace_b8707f8e::function_1a180bd3("vox_idgun_upgrade_ready");
			}
		}
	}
}

/*
	Name: function_82e98236
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x1B10
	Size: 0x1A0
	Parameters: 1
	Flags: Private
	Line Number: 591
*/
function private function_82e98236(cocoon)
{
	v_start = self GetTagOrigin("J_SpineLower");
	e_fx = namespace_8e578893::function_6c995606(v_start, self.angles);
	e_fx clientfield::set("zod_egg_soul", 1);
	e_fx playsound("zmb_zod_soul_release");
	v_endpos = cocoon.origin - VectorScale((0, 0, 1), 20);
	e_fx moveto(v_endpos, 1);
	e_fx waittill("movedone");
	e_fx playsound("zmb_zod_soul_impact");
	if(isdefined(cocoon))
	{
		cocoon SetScale(LerpFloat(1, 1.45, cocoon.kill_count / 100));
	}
	wait(0.25);
	e_fx clientfield::set("zod_egg_soul", 0);
	e_fx namespace_8e578893::function_44a841();
}

/*
	Name: function_b9729f28
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x1CB8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 620
*/
function function_b9729f28(player)
{
	for(i = 0; i < 2; i++)
	{
		if(level.idgun[i].owner === player)
		{
			return level.idgun[i];
		}
	}
}

/*
	Name: function_b8a2afa3
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x1D28
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 641
*/
function function_b8a2afa3()
{
	self endon("disconnect");
	self HideViewModel();
	self waittill("weapon_change");
	self ShowViewModel();
}

/*
	Name: function_aa83def
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x1D78
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 659
*/
function function_aa83def()
{
	level waittill("hash_a0c94e0", player);
	eye = player GetEye();
	util::setClientSysState("aae_soulcounter", "&AAE_TIP_IDGUN_UPGRADED_TITLE&AAE_TIP_IDGUN_UPGRADED_CONTENT&" + eye[0] + "&" + eye[1] + "&" + eye[2]);
}

/*
	Name: function_b4c3b798
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x1E18
	Size: 0xA10
	Parameters: 0
	Flags: None
	Line Number: 676
*/
function function_b4c3b798()
{
	level flag::wait_till("initial_blackscreen_passed");
	level thread function_aa83def();
	var_e32d5cc9 = struct::get_array("idgun_cocoon_point", "targetname");
	var_af6e2bd6 = [];
	for(i = 0; i < var_e32d5cc9.size; i++)
	{
		if(var_e32d5cc9[i].origin != (2302.92, -4143.34, 388) && var_e32d5cc9[i].origin != (2000.2, -9665.41, 4) && var_e32d5cc9[i].origin != (952.57, -1973.92, 470))
		{
			var_af6e2bd6[var_af6e2bd6.size] = var_e32d5cc9[i];
		}
	}
	var_2ec0e30f = Array::random(var_af6e2bd6);
	level.var_e6d966e endon("death");
	level.var_e6d966e = spawn("script_model", var_2ec0e30f.origin);
	level.var_e6d966e SetModel("p7_zm_zod_cocoon");
	level.var_e6d966e setcandamage(1);
	level.var_e6d966e thread function_3bddbe74();
	level.var_e6d966e.kill_count = 0;
	level flag::wait_till("second_idgun_time");
	for(;;)
	{
		level.var_e6d966e waittill("damage", amount, attacker, direction_vec, point, type, tagName, modelName, partName, weapon);
		if(zm::is_idgun_damage(weapon) && isdefined(attacker) && isPlayer(attacker))
		{
			attacker thread function_b8a2afa3();
			attacker notify("weapon_take", weapon);
			attacker TakeWeapon(weapon);
			level.var_e6d966e.idgun = weapon;
			var_58ed85f4 = zm_utility::spawn_buildkit_weapon_model(attacker, weapon, undefined, attacker GetWeaponMuzzlePoint(), attacker getPlayerAngles());
			var_58ed85f4 playsound("zmb_zod_soul_release");
			var_58ed85f4 clientfield::set("shadowman_fx", 1);
			var_58ed85f4 clientfield::set("zod_egg_soul", 1);
			var_58ed85f4 moveto(level.var_e6d966e.origin - VectorScale((0, 0, 1), 20), 2, 0.8, 0.8);
			var_58ed85f4 RotateTo(VectorScale((-1, 0, 0), 90), 2, 0.8, 0.8);
			var_58ed85f4 waittill("movedone");
			var_58ed85f4 delete();
			level.var_e6d966e playsound("zmb_zod_soul_impact");
			level.var_e6d966e playsound("wpn_wwgrenade_cocoon_lp");
		}
	}
	else
	{
	}
	level waittill("end_of_round");
	for(;;)
	{
		level.var_e6d966e waittill("damage", amount, attacker, direction_vec, point, type, tagName, modelName, partName, weapon);
		if(isdefined(weapon) && weapon.type === "bullet")
		{
			level.var_e6d966e playsound("wpn_wwgrenade_explode");
			playFX(level._effect["idgun_cocoon_off"], level.var_e6d966e.origin - VectorScale((0, 0, 1), 20));
			var_58ed85f4 = zm_utility::spawn_buildkit_weapon_model(attacker, zm_weapons::get_upgrade_weapon(level.var_e6d966e.idgun), undefined, level.var_e6d966e.origin, VectorScale((-1, 0, 0), 90));
			var_58ed85f4 clientfield::set("shadowman_fx", 1);
			var_58ed85f4 clientfield::set("zod_egg_soul", 1);
			origin = bullettrace(level.var_e6d966e.origin, level.var_e6d966e.origin - VectorScale((0, 0, 1), 1000), 0, level.var_e6d966e, 0, 0)["position"];
			level.var_e6d966e Hide();
			var_58ed85f4 moveto(origin + VectorScale((0, 0, 1), 40), 2, 0.8, 0.8);
			var_58ed85f4 RotateTo((0, 0, 0), 2, 0.8, 0.8);
			var_58ed85f4 waittill("movedone");
		}
	}
	else
	{
	}
	while(isdefined(var_58ed85f4))
	{
		for(i = 0; i < level.activePlayers.size; i++)
		{
			if(level.activePlayers[i] useButtonPressed() && Distance(level.activePlayers[i] GetEye(), var_58ed85f4.origin) < 110)
			{
				if(zm_utility::is_player_valid(level.activePlayers[i], 0, 0) && !level.activePlayers[i] zm_utility::is_multiple_drinking())
				{
					weapon = level.activePlayers[i] GetCurrentWeapon();
					if(!zm_utility::is_placeable_mine(weapon) && !zm_equipment::is_equipment(weapon) && !level.activePlayers[i] zm_utility::is_player_revive_tool(weapon) && weapon.name != "syrette_quick" && !weapon.isHeroWeapon && !weapon.isgadget && !level.activePlayers[i] zm_utility::has_powerup_weapon() && weapon.inventoryType == "primary")
					{
						level.b_allow_idgun_pap = 1;
						var_58ed85f4 delete();
						level.activePlayers[i] zm_weapons::weapon_give(zm_weapons::get_upgrade_weapon(level.var_e6d966e.idgun), 1, 0, 0, 1);
						level.activePlayers[i] namespace_b8707f8e::function_1a180bd3("vox_idgun_upgrade_complete");
						level.var_e6d966e delete();
						util::setClientSysState("aae_soulcounter", "&AAE_TIP_IDGUN_UPGRADED_TITLE");
						return;
					}
				}
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_3bddbe74
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x2830
	Size: 0x410
	Parameters: 0
	Flags: None
	Line Number: 778
*/
function function_3bddbe74()
{
	self endon("death");
	self endon("hash_c340c785");
	targetOrigin = self.origin;
	var_76cf6eef = 262144;
	var_9d192e2d = 4096;
	var_2509d2fc = var_76cf6eef - var_9d192e2d;
	var_4a166ae5 = 0.7;
	var_f6b0cbe4 = undefined;
	var_ac3d0ec3 = undefined;
	n_scale = undefined;
	player = undefined;
	var_a0315d3d = "idgun_heartbeat";
	while(1)
	{
		player = undefined;
		for(i = 0; i < level.activePlayers.size; i++)
		{
			if(zm::is_idgun_damage(level.activePlayers[i] GetCurrentWeapon()))
			{
				player = level.activePlayers[i];
			}
		}
		if(!isdefined(player))
		{
			wait(0.1);
			continue;
		}
		var_553a797d = (targetOrigin[0], targetOrigin[1], player.origin[2]);
		var_30c97f9b = DistanceSquared(player.origin, var_553a797d);
		if(var_30c97f9b <= var_76cf6eef)
		{
			var_ac3d0ec3 = 1;
			v_eye_origin = player GetPlayerCameraPos();
			v_eye_direction = AnglesToForward(player getPlayerAngles());
			var_94091ebc = VectorNormalize(targetOrigin - v_eye_origin);
			n_dot = VectorDot(var_94091ebc, v_eye_direction);
			if(n_dot > 0.9)
			{
				var_ac3d0ec3 = 0.3;
				n_scale = 1;
			}
			else if(n_dot <= 0.5)
			{
				n_dot = 0.5;
				n_scale = n_dot / 0.9;
				var_f6b0cbe4 = n_scale * var_4a166ae5;
				var_ac3d0ec3 = 0.3 + var_f6b0cbe4;
			}
			else
			{
				n_scale = n_dot / 0.9;
				var_f6b0cbe4 = n_scale * var_4a166ae5;
				var_ac3d0ec3 = 0.3 + var_f6b0cbe4;
			}
		}
		else
		{
			var_ac3d0ec3 = undefined;
		}
		if(isdefined(var_ac3d0ec3))
		{
			wait(var_ac3d0ec3);
			if(!isdefined(player))
			{
				wait(0.1);
				continue;
			}
			player playsoundwithnotify(var_a0315d3d, var_a0315d3d, "tag_weapon_right");
			util::wait_network_frame();
			if(!isdefined(player))
			{
				wait(0.1);
				continue;
			}
			player playsoundwithnotify(var_a0315d3d, var_a0315d3d, "tag_weapon_right");
		}
		else
		{
			wait(0.05);
		}
	}
}

/*
	Name: function_1bfbfa4c
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x2C48
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 873
*/
function function_1bfbfa4c(e_entity, var_d42f02cf)
{
	if(!isdefined(e_entity.script_string) || e_entity.script_string != var_d42f02cf)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_47867b41
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x2C98
	Size: 0x248
	Parameters: 2
	Flags: None
	Line Number: 892
*/
function function_47867b41(var_3fbc06aa, str_part)
{
	for(;;)
	{
		self waittill("damage", amount, attacker, direction_vec, point, type, tagName, modelName, partName, weapon);
		level flag::set("idgun_cocoon_" + var_3fbc06aa + "_found");
		if(zm::is_idgun_damage(weapon))
		{
		}
		else
		{
			self show();
			v_origin = self GetOrigin();
			direction_vec = (0, 0, -1);
			scale = 8000;
			direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
			trace = bullettrace(v_origin, v_origin + direction_vec, 0, undefined);
			drop_point = trace["position"];
			drop_point = drop_point + VectorScale((0, 0, 1), 10);
			self moveto(drop_point, 1);
			wait(1);
			self Hide();
			playFX(level._effect["idgun_cocoon_off"], self.origin);
			function_f5469e1(drop_point, str_part, 0, 1);
			return;
		}
	}
}

/*
	Name: function_538643a3
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x2EE8
	Size: 0x3E0
	Parameters: 1
	Flags: None
	Line Number: 931
*/
function function_538643a3(var_3fbc06aa)
{
	self endon("bleed_out");
	self endon("death");
	self endon("disconnect");
	v_cocoon = level.var_a26610f1[var_3fbc06aa].origin;
	var_76cf6eef = 262144;
	var_9d192e2d = 4096;
	var_2509d2fc = var_76cf6eef - var_9d192e2d;
	var_4a166ae5 = 0.7;
	var_f6b0cbe4 = undefined;
	var_ac3d0ec3 = undefined;
	n_scale = undefined;
	n_rumble = undefined;
	while(1)
	{
		var_5cc8da3f = self GetCurrentWeapon();
		var_3262a5f7 = GetWeapon(level.idgun[0].var_e4be281f);
		if(var_5cc8da3f !== var_3262a5f7)
		{
			wait(0.1);
			break;
		}
		var_888da1cf = (v_cocoon[0], v_cocoon[1], self.origin[2]);
		var_30c97f9b = DistanceSquared(self.origin, var_888da1cf);
		if(var_30c97f9b <= var_76cf6eef)
		{
			var_ac3d0ec3 = 1;
			v_eye_origin = self GetPlayerCameraPos();
			v_eye_direction = AnglesToForward(self getPlayerAngles());
			var_744d3805 = VectorNormalize(v_cocoon - v_eye_origin);
			n_dot = VectorDot(var_744d3805, v_eye_direction);
			if(n_dot > 0.9)
			{
				var_ac3d0ec3 = 0.3;
				n_scale = 1;
				n_rumble = 2;
			}
			else if(n_dot <= 0.5)
			{
				n_dot = 0.5;
				n_scale = n_dot / 0.9;
				var_f6b0cbe4 = n_scale * var_4a166ae5;
				var_ac3d0ec3 = 0.3 + var_f6b0cbe4;
				n_rumble = 1;
			}
			else
			{
				n_scale = n_dot / 0.9;
				var_f6b0cbe4 = n_scale * var_4a166ae5;
				var_ac3d0ec3 = 0.3 + var_f6b0cbe4;
				n_rumble = 1;
			}
		}
		else
		{
			var_ac3d0ec3 = undefined;
		}
		if(level flag::get("idgun_cocoon_" + var_3fbc06aa + "_found"))
		{
			return;
		}
		if(isdefined(var_ac3d0ec3))
		{
			wait(var_ac3d0ec3);
			self namespace_8e578893::function_6edf48d5(2);
			util::wait_network_frame();
			self namespace_8e578893::function_6edf48d5(0);
		}
		else
		{
			wait(0.05);
		}
	}
}

/*
	Name: function_eaadff84
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x32D0
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 1017
*/
function function_eaadff84(var_f7cef040)
{
	if(var_f7cef040 == 0)
	{
		var_566556d8 = GetWeapon(level.idgun[0].var_e4be281f);
	}
	else
	{
		var_566556d8 = GetWeapon(level.idgun[0].var_e4be281f);
		var_566556d8 = zm_weapons::get_upgrade_weapon(var_566556d8, 0);
	}
	/#
		/#
			Assert(isdefined(var_566556d8));
		#/
	#/
	self zm_weapons::weapon_give(var_566556d8, 0, 0);
	self SwitchToWeapon(var_566556d8);
	if(!isdefined(level.idgun[0].owner))
	{
		var_6aa62cd2 = 0;
	}
	else if(!isdefined(level.idgun[1].owner))
	{
		var_6aa62cd2 = 1;
		return;
	}
	else
	{
	}
	level.idgun[var_6aa62cd2].owner = self;
	self namespace_b8707f8e::function_aca1bc0c(0);
	return;
}

/*
	Name: function_1c946455
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x3460
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1062
*/
function function_1c946455()
{
	/#
		level thread namespace_8e578893::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 0, &function_9e990d87);
		level thread namespace_8e578893::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_9e990d87);
		level thread namespace_8e578893::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_8c7ac1b9);
	#/
}

/*
	Name: function_e4e5cd30
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x3518
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 1081
*/
function function_e4e5cd30()
{
	/#
		level thread namespace_8e578893::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 0, &function_1f7b4ebf);
		return;
	#/
	ERROR: Bad function call
}

/*
	Name: function_9e990d87
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x3560
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 1100
*/
function function_9e990d87(n_value)
{
	/#
		foreach(e_player in level.players)
		{
			e_player function_eaadff84(n_value);
			util::wait_network_frame();
		}
	#/
}

/*
	Name: function_1f7b4ebf
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x3618
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 1121
*/
function function_1f7b4ebf(n_val)
{
	/#
		level flag::set("Dev Block strings are not supported");
		return;
	#/
}

/*
	Name: function_8c7ac1b9
	Namespace: zm_zod_idgun_quest
	Checksum: 0x424F4353
	Offset: 0x3650
	Size: 0x3C
	Parameters: 1
	Flags: None
	Line Number: 1139
*/
function function_8c7ac1b9(n_value)
{
	/#
		if(isdefined(level.idgun_draw_debug))
		{
			level.idgun_draw_debug = !level.idgun_draw_debug;
		}
		else
		{
			level.idgun_draw_debug = 1;
		}
	#/
}

