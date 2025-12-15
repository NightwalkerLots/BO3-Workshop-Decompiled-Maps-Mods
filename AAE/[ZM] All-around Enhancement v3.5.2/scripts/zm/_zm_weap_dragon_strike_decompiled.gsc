#include scripts\codescripts\struct;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_placeable_mine;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_42aab40d;

/*
	Name: __init__sytem__
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x648
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 32
*/
function autoexec __init__sytem__()
{
	system::register("zm_weap_dragon_strike", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x690
	Size: 0x2F0
	Parameters: 0
	Flags: None
	Line Number: 47
*/
function __init__()
{
	clientfield::register("scriptmover", "dragon_strike_spawn_fx", 12000, 1, "int");
	clientfield::register("scriptmover", "dragon_strike_marker_on", 12000, 1, "int");
	clientfield::register("scriptmover", "dragon_strike_marker_fx", 12000, 1, "counter");
	clientfield::register("scriptmover", "dragon_strike_marker_upgraded_fx", 12000, 1, "counter");
	clientfield::register("scriptmover", "dragon_strike_marker_invalid_fx", 12000, 1, "counter");
	clientfield::register("scriptmover", "dragon_strike_marker_upgraded_invalid_fx", 12000, 1, "counter");
	clientfield::register("scriptmover", "dragon_strike_flare_fx", 12000, 1, "int");
	clientfield::register("scriptmover", "dragon_strike_marker_fx_fadeout", 12000, 1, "counter");
	clientfield::register("scriptmover", "dragon_strike_marker_upgraded_fx_fadeout", 12000, 1, "counter");
	clientfield::register("actor", "dragon_strike_zombie_fire", 12000, 2, "int");
	clientfield::register("vehicle", "dragon_strike_zombie_fire", 12000, 2, "int");
	clientfield::register("clientuimodel", "dragon_strike_invalid_use", 12000, 1, "counter");
	clientfield::register("clientuimodel", "hudItems.showDpadRight_DragonStrike", 12000, 1, "int");
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	level.func_custom_placeable_mine_round_replenish = &function_ff07e778;
	zm::register_player_damage_callback(&function_43b5419a);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __main__
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x988
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 81
*/
function __main__()
{
	zm_placeable_mine::add_mine_type("launcher_dragon_strike");
	zm_placeable_mine::add_mine_type("launcher_dragon_strike_upgraded");
	if(isdefined(level.retrieveHints["launcher_dragon_strike"]))
	{
		ArrayRemoveIndex(level.retrieveHints, "launcher_dragon_strike", 1);
	}
	if(isdefined(level.retrieveHints["launcher_dragon_strike_upgraded"]))
	{
		ArrayRemoveIndex(level.retrieveHints, "launcher_dragon_strike_upgraded", 1);
	}
	zm_spawner::register_zombie_death_event_callback(&function_22664e38);
}

/*
	Name: on_player_connect
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0xA58
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function on_player_connect()
{
	self thread function_2d8749cd();
	self thread on_player_disconnect();
	self thread function_1939853d();
}

/*
	Name: on_player_spawned
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0xAB0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 123
*/
function on_player_spawned()
{
	if(!self flag::exists("show_dragon_strike_reticule"))
	{
		self flag::init("show_dragon_strike_reticule");
	}
	if(!self flag::exists("dragon_strike_active"))
	{
		self flag::init("dragon_strike_active");
	}
	self thread function_d5acc054();
	self thread function_3e8c94e3();
}

/*
	Name: function_1939853d
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0xB70
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 147
*/
function function_1939853d()
{
	self endon("disconnect");
	self endon("death");
	self notify("hash_1939853d");
	self endon("hash_1939853d");
	for(;;)
	{
		self waittill("zmb_max_ammo");
		wait(0.05);
		self add_ammo();
	}
}

/*
	Name: add_ammo
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0xBD8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 171
*/
function add_ammo()
{
	var_5a0c399b = self zm_utility::get_player_placeable_mine();
	if(var_5a0c399b == GetWeapon("launcher_dragon_strike"))
	{
		var_7bf8ceb7 = 1;
	}
	else if(var_5a0c399b == GetWeapon("launcher_dragon_strike_upgraded"))
	{
		var_7bf8ceb7 = 2;
		return;
	}
	else
	{
	}
	if(self getammocount(var_5a0c399b) < var_7bf8ceb7)
	{
		if(Array::contains(level.var_163a43e4, self))
		{
			self waittill("hash_2e47bc4a");
		}
		self SetWeaponAmmoClip(var_5a0c399b, var_7bf8ceb7);
	}
}

/*
	Name: function_ff07e778
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0xCE0
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 206
*/
function function_ff07e778()
{
	a_players = GetPlayers();
	for(i = 0; i < a_players.size; i++)
	{
		foreach(w_mine in level.placeable_mines)
		{
			if(a_players[i] zm_utility::is_player_placeable_mine(w_mine))
			{
				if(w_mine == GetWeapon("launcher_dragon_strike") || w_mine == GetWeapon("launcher_dragon_strike_upgraded"))
				{
					a_players[i] add_ammo();
					continue;
					continue;
				}
				a_players[i] GiveWeapon(w_mine);
				a_players[i] zm_utility::set_player_placeable_mine(w_mine);
				a_players[i] SetActionSlot(4, "weapon", w_mine);
				a_players[i] SetWeaponAmmoClip(w_mine, 2);
				break;
			}
		}
	}
}

/*
	Name: on_player_disconnect
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0xEC8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 241
*/
function on_player_disconnect()
{
	self waittill("disconnect");
	if(isdefined(self.var_3929e8a2) && !self flag::get("dragon_strike_active"))
	{
		var_3929e8a2 = self.var_3929e8a2;
		var_3929e8a2 clientfield::set("dragon_strike_marker_on", 0);
		wait(0.3);
		var_3929e8a2 delete();
	}
}

/*
	Name: function_43b5419a
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0xF68
	Size: 0xD0
	Parameters: 11
	Flags: None
	Line Number: 263
*/
function function_43b5419a(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex)
{
	if(isdefined(eInflictor) && isdefined(eInflictor.item) && (eInflictor.item == GetWeapon("launcher_dragon_fire") || eInflictor.item == GetWeapon("launcher_dragon_fire_upgraded")))
	{
		return 0;
	}
	return -1;
}

/*
	Name: function_2d8749cd
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x1040
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 282
*/
function function_2d8749cd()
{
	self endon("disconnect");
	self endon("death");
	while(isdefined(self))
	{
		self waittill("weapon_change", weapon);
		if(weapon == GetWeapon("launcher_dragon_strike"))
		{
			break;
		}
	}
	zm_equipment::show_hint_text(&"ZM_STALINGRAD_DRAGON_STRIKE_USE");
}

/*
	Name: function_d5acc054
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x10D0
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 307
*/
function function_d5acc054()
{
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("weapon_change", weapon, previous_weapon);
		if(function_9e0c324b(weapon))
		{
			if(self.var_8660deae === 0)
			{
				self playsoundtoplayer("fly_dragon_strike_ui_error", self);
				self thread zm_equipment::show_hint_text(&"ZM_STALINGRAD_DRAGON_STRIKE_UNAVAILABLE");
				self function_6c8dfca2(previous_weapon);
				continue;
			}
			else
			{
				self thread function_8ad253d8(previous_weapon);
			}
		}
		else
		{
			self notify("hash_85e0a572");
			self flag::clear("show_dragon_strike_reticule");
		}
	}
}

/*
	Name: function_3e8c94e3
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x11F0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 346
*/
function function_3e8c94e3()
{
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("hash_937f376b", weapon);
		if(function_9e0c324b(weapon) && (self getammocount(weapon) == 0 || self.var_8660deae === 0))
		{
			self clientfield::increment_uimodel("dragon_strike_invalid_use");
		}
	}
}

/*
	Name: function_9e0c324b
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x1298
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 370
*/
function function_9e0c324b(f_interfacer)
{
	if(f_interfacer == GetWeapon("launcher_dragon_strike") || f_interfacer == GetWeapon("launcher_dragon_strike_upgraded"))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_8ad253d8
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x12F8
	Size: 0x230
	Parameters: 1
	Flags: None
	Line Number: 389
*/
function function_8ad253d8(previous_weapon)
{
	self endon("hash_85e0a572");
	self endon("disconnect");
	self endon("death");
	self flag::set("show_dragon_strike_reticule");
	self thread function_7fcb14a8();
	self waittill("weapon_fired");
	if(self flag::get("dragon_strike_active"))
	{
		self playsoundtoplayer("fly_dragon_strike_ui_error", self);
		self thread zm_equipment::show_hint_text(&"ZM_STALINGRAD_DRAGON_STRIKE_BUSY");
		self function_6c8dfca2(previous_weapon);
		return;
	}
	if(self function_f80cd2c9())
	{
		self flag::set("dragon_strike_active");
		self playsoundtoplayer("fly_dragon_strike_ui_activate", self);
		self zm_audio::create_and_play_dialog("dragon_strike", "call_in");
		self util::delay(0.5, "death", &function_6c8dfca2, previous_weapon);
		self thread function_a3b69ec0(self.var_5d020ece);
		self thread function_2864e2c1();
		return;
	}
	self playsoundtoplayer("fly_dragon_strike_ui_error", self);
	self thread zm_equipment::show_hint_text(&"ZM_STALINGRAD_DRAGON_STRIKE_INVALID");
	self thread function_8ad253d8(previous_weapon);
}

/*
	Name: function_f80cd2c9
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x1530
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 429
*/
function function_f80cd2c9()
{
	if(isdefined(self.var_be00572f))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_2864e2c1
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x1550
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 448
*/
function function_2864e2c1()
{
	self endon("disconnect");
	self endon("death");
	self.var_8660deae = 0;
	self flag::wait_till_clear("dragon_strike_active");
	self.var_8660deae = 1;
	if(isdefined(level.var_d4286019) && level.var_d4286019)
	{
		var_5a0c399b = self zm_utility::get_player_placeable_mine();
		self add_ammo();
	}
}

/*
	Name: function_42ab5fbb
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x15F8
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 472
*/
function function_42ab5fbb(var_5d020ece)
{
	self clientfield::set("dragon_strike_spawn_fx", 1);
	self thread animation::Play("ai_zm_dlc3_dragon_strike_1", self);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a3b69ec0
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x1650
	Size: 0x1F0
	Parameters: 1
	Flags: None
	Line Number: 490
*/
function function_a3b69ec0(var_5d020ece)
{
	self endon("disconnect");
	self endon("death");
	var_5a0c399b = self zm_utility::get_player_placeable_mine();
	if(var_5a0c399b == GetWeapon("launcher_dragon_strike_upgraded"))
	{
		var_2826b50 = 1;
		var_35ab0c48 = 400;
		var_825b87b9 = 800;
		w_fire = GetWeapon("launcher_dragon_fire_upgraded");
	}
	else
	{
		var_2826b50 = 0;
		var_35ab0c48 = 300;
		var_825b87b9 = 600;
		w_fire = GetWeapon("launcher_dragon_fire");
	}
	self SetWeaponAmmoClip(var_5a0c399b, self getammocount(var_5a0c399b) - 1);
	self flag::clear("show_dragon_strike_reticule");
	self.var_3929e8a2.angles = (0, 0, 0);
	self.var_3929e8a2 thread function_6efadb82(var_825b87b9, var_5a0c399b);
	level thread function_9af893e8(self, var_5d020ece, var_2826b50, var_35ab0c48, w_fire);
	level waittill("hash_d3a01285");
	self notify("hash_ddb84fad", self.var_8e17738c);
	self flag::clear("dragon_strike_active");
}

/*
	Name: function_9af893e8
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x1848
	Size: 0x248
	Parameters: 5
	Flags: None
	Line Number: 529
*/
function function_9af893e8(e_player, var_5d020ece, var_2826b50, var_35ab0c48, w_fire)
{
	mdl_dragon = util::spawn_anim_model("c_zom_dlc3_dragon_body_airstrike", var_5d020ece.var_53d81d57, var_5d020ece.angles + VectorScale((1, 0, 0), 25));
	mdl_dragon function_42ab5fbb(var_5d020ece);
	if(isdefined(e_player))
	{
		mdl_dragon.player = e_player;
		e_player.var_8e17738c = 0;
	}
	for(i = 0; i < 4; i++)
	{
		mdl_dragon waittill("fireball");
		mdl_dragon.v_mouth = mdl_dragon GetTagOrigin("tag_throat_fx");
		n_checks = 6;
		do
		{
			var_2410d5ad = var_5d020ece.v_loc + function_adac83c4();
			n_checks--;
		}
		while(!(BulletTracePassed(mdl_dragon.v_mouth, var_2410d5ad, 0, mdl_dragon) && n_checks > 0));
		var_aa911866 = MagicBullet(w_fire, mdl_dragon.v_mouth, var_2410d5ad, mdl_dragon);
		level thread function_a6d19957(var_2826b50, var_aa911866, var_5d020ece.v_loc, var_35ab0c48);
	}
	mdl_dragon thread function_604af93b();
	while(isdefined(var_aa911866))
	{
		wait(0.05);
	}
	level notify("hash_d67e330d");
}

/*
	Name: function_a6d19957
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x1A98
	Size: 0x180
	Parameters: 4
	Flags: None
	Line Number: 570
*/
function function_a6d19957(var_2826b50, var_aa911866, var_950f1cf3, n_range)
{
	while(isdefined(var_aa911866))
	{
		wait(0.05);
	}
	a_ai_zombies = Array::get_all_closest(var_950f1cf3, getaiarchetypearray("zombie"), undefined, undefined, n_range);
	if(var_2826b50)
	{
		n_clientfield = 2;
	}
	else
	{
		n_clientfield = 1;
	}
	foreach(ai_zombie in a_ai_zombies)
	{
		if(isdefined(ai_zombie) && (!(isdefined(ai_zombie.var_4cfc625d) && ai_zombie.var_4cfc625d)))
		{
			ai_zombie clientfield::set("dragon_strike_zombie_fire", n_clientfield);
			wait(RandomFloat(0.1));
		}
	}
}

/*
	Name: function_adac83c4
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x1C20
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 605
*/
function function_adac83c4()
{
	var_8eae13b3 = randomIntRange(-50, 50);
	var_68ab994a = randomIntRange(-50, 50);
	var_8d74b778 = (var_8eae13b3, var_68ab994a, 0);
	return var_8d74b778;
}

/*
	Name: function_6efadb82
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x1C98
	Size: 0x1B0
	Parameters: 2
	Flags: None
	Line Number: 623
*/
function function_6efadb82(var_825b87b9, var_5a0c399b)
{
	self clientfield::set("dragon_strike_flare_fx", 1);
	var_dc5fde65 = GetClosestPointOnNavMesh(self.origin, 128);
	mdl_attractor = util::spawn_model("tag_origin", var_dc5fde65);
	mdl_attractor zm_utility::create_zombie_point_of_interest(var_825b87b9, 64, 10000);
	level waittill("hash_d67e330d");
	if(isdefined(self))
	{
		self clientfield::set("dragon_strike_flare_fx", 0);
		if(var_5a0c399b == GetWeapon("launcher_dragon_strike_upgraded"))
		{
			self clientfield::increment("dragon_strike_marker_upgraded_fx_fadeout");
		}
		else
		{
			self clientfield::increment("dragon_strike_marker_fx_fadeout");
		}
	}
	mdl_attractor delete();
	wait(3.5);
	if(isdefined(self))
	{
		self clientfield::set("dragon_strike_marker_on", 0);
	}
	wait(0.3);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_22664e38
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x1E50
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 665
*/
function function_22664e38(e_attacker)
{
	if(isdefined(self) && (self.damageWeapon === GetWeapon("launcher_dragon_fire") || self.damageWeapon === GetWeapon("launcher_dragon_fire_upgraded")))
	{
		if(isdefined(e_attacker) && isdefined(e_attacker.player))
		{
			e_attacker.player.var_8e17738c++;
			return;
		}
	}
}

/*
	Name: function_604af93b
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x1EE8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 687
*/
function function_604af93b()
{
	self waittill("scriptedanim");
	level notify("hash_d3a01285");
	self delete();
}

/*
	Name: function_7fcb14a8
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x1F28
	Size: 0x408
	Parameters: 0
	Flags: None
	Line Number: 704
*/
function function_7fcb14a8()
{
	self notify("hash_26b100ad");
	self endon("hash_26b100ad");
	self endon("disconnect");
	self endon("death");
	var_b912cdaf = VectorScale((0, 0, 1), 8);
	if(!isdefined(self.var_3929e8a2))
	{
		player_num = self GetEntityNumber();
		player_num = player_num + 0.3;
		self.var_3929e8a2 = util::spawn_model("tag_origin", self.origin, (player_num, 1.3, 0));
	}
	util::wait_network_frame();
	self.var_3929e8a2 clientfield::set("dragon_strike_marker_on", 1);
	var_5a0c399b = self zm_utility::get_player_placeable_mine();
	if(var_5a0c399b == GetWeapon("launcher_dragon_strike_upgraded"))
	{
		str_marker = "dragon_strike_marker_upgraded_fx";
		var_854898eb = "dragon_strike_marker_upgraded_invalid_fx";
	}
	else
	{
		str_marker = "dragon_strike_marker_fx";
		var_854898eb = "dragon_strike_marker_invalid_fx";
	}
	while(self flag::get("show_dragon_strike_reticule"))
	{
		v_start = self GetEye();
		v_forward = self GetWeaponForwardDir();
		v_end = v_start + v_forward * 2500;
		a_trace = bullettrace(self GetEye(), self GetEye() + AnglesToForward(self getPlayerAngles()) * 2500, 0, self.var_3929e8a2, 1, 0, self.mdl_attractor);
		self.var_be00572f = a_trace["position"];
		if(isdefined(self.var_5d020ece))
		{
			self.var_5d020ece struct::delete();
		}
		self.var_5d020ece = self function_c7832a90(self.var_be00572f);
		if(!isdefined(self.var_5d020ece))
		{
			self function_5a9be7d8(var_854898eb);
			wait(0.1);
			continue;
		}
		self.var_3929e8a2 clientfield::increment(str_marker);
		self.var_3929e8a2 moveto(self.var_be00572f + var_b912cdaf, 0.2, 0.1, 0.1);
		self.var_3929e8a2 waittill("movedone");
	}
	if(self flag::get("dragon_strike_active"))
	{
		return;
	}
	self.var_3929e8a2 clientfield::set("dragon_strike_marker_on", 0);
	wait(0.3);
	self.var_3929e8a2 delete();
	return;
}

/*
	Name: function_c7832a90
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x2338
	Size: 0x2D0
	Parameters: 1
	Flags: None
	Line Number: 772
*/
function function_c7832a90(v_loc)
{
	var_feed8b5b = 0;
	v_forward = v_loc - self.origin;
	v_angles = VectorToAngles(v_forward);
	v_angles = (v_angles[0], v_angles[1], 0);
	var_1ccc854e = AnglesToForward(v_angles);
	var_53d81d57 = (v_loc[0] + var_1ccc854e[0] * 1000, v_loc[1] + var_1ccc854e[1] * 1000, v_loc[2] + 2000);
	while(var_feed8b5b < 360)
	{
		if(BulletTracePassed(var_53d81d57, v_loc + VectorScale((0, 0, 1), 96), 0, self.var_3929e8a2))
		{
			var_1914c03e = spawnstruct();
			var_1914c03e.origin = (v_loc[0] + var_1ccc854e[0] * 20000, v_loc[1] + var_1ccc854e[1] * 20000, v_loc[2] + 8000);
			var_1914c03e.angles = anglesToUp(VectorToAngles(v_loc - var_1914c03e.origin));
			var_1914c03e.v_loc = v_loc;
			var_1914c03e.var_53d81d57 = var_53d81d57;
			return var_1914c03e;
		}
		var_feed8b5b = var_feed8b5b + 90;
		var_d9f4bdfd = (v_angles[0], v_angles[1] + 90, 0);
		v_angles = var_d9f4bdfd;
		var_1ccc854e = AnglesToForward(var_d9f4bdfd);
		var_53d81d57 = (v_loc[0] + var_1ccc854e[0] * 1000, v_loc[1] + var_1ccc854e[1] * 1000, v_loc[2] + 2000);
	}
	return undefined;
}

/*
	Name: function_5a9be7d8
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x2610
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 810
*/
function function_5a9be7d8(var_854898eb)
{
	self.var_3929e8a2 clientfield::increment(var_854898eb);
	self.var_3929e8a2 moveto(self.var_be00572f, 0.05);
	self.var_be00572f = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_6c8dfca2
	Namespace: namespace_42aab40d
	Checksum: 0x424F4353
	Offset: 0x2678
	Size: 0xC4
	Parameters: 1
	Flags: None
	Line Number: 829
*/
function function_6c8dfca2(w_weapon)
{
	if(!isdefined(w_weapon) || zm_utility::is_hero_weapon(w_weapon))
	{
		if(isdefined(self.prev_weapon_before_equipment_change))
		{
			w_weapon = self.prev_weapon_before_equipment_change;
		}
		else if(isdefined(self.weapon_stowed))
		{
			w_weapon = self.weapon_stowed;
		}
		else
		{
			a_w_current = self getweaponslistprimaries();
			if(a_w_current.size > 0)
			{
				w_weapon = a_w_current[0];
				return;
			}
			else
			{
			}
		}
	}
	self SwitchToWeapon(w_weapon);
}

