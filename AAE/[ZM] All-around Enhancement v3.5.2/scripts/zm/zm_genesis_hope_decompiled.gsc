#include scripts\codescripts\struct;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_genesis_power;
#include scripts\zm\zm_genesis_util;

#namespace namespace_c30b09d6;

/*
	Name: __init__sytem__
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x5A8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 32
*/
function autoexec __init__sytem__()
{
	system::register("zm_genesis_hope", &__init__, &__main__, undefined);
	return;
	ERROR: Bad function call
}

/*
	Name: __init__
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x5F0
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function __init__()
{
	clientfield::register("world", "hope_state", 15000, GetMinBitCountForNum(4), "int");
	clientfield::register("clientuimodel", "zmInventory.super_ee", 15000, 1, "int");
	clientfield::register("toplayer", "hope_spark", 15000, 1, "int");
	clientfield::register("scriptmover", "hope_spark", 15000, 1, "int");
	level flag::init("hope_done");
	level.var_fa9755d7 = 0;
	/#
		if(GetDvarInt("Dev Block strings are not supported") > 0)
		{
			level thread function_dfd4e9f8();
		}
	#/
}

/*
	Name: __main__
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x730
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function __main__()
{
	wait(0.1);
}

/*
	Name: start
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x748
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function start()
{
	level waittill("start_zombie_round_logic");
	level clientfield::set("hope_state", 1);
	level thread function_bb1fbc7f();
	level.craftable_crafted_custom_func = &function_8ad194d1;
	level waittill("hash_1b9d7e45", player);
	eye = player GetEye();
	util::setClientSysState("aae_soulcounter", "&AAE_TIP_GENESIS_SHIELD_TITLE&AAE_TIP_GENESIS_SHIELD_CONTENT&" + eye[0] + "&" + eye[1] + "&" + eye[2]);
}

/*
	Name: function_8ad194d1
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x848
	Size: 0x628
	Parameters: 1
	Flags: None
	Line Number: 111
*/
function function_8ad194d1(var_94c6b1d7)
{
	if(var_94c6b1d7.craftable_name == "craft_shield_zm")
	{
		var_94c6b1d7.stub.model setcandamage(1);
		is_upgraded = 0;
		old_angles = var_94c6b1d7.stub.model.angles;
		player = undefined;
		while(1)
		{
			var_94c6b1d7.stub.model waittill("damage", amount, attacker, direction_vec, point, type, tagName, modelName, partName, weapon);
			if(zm::is_idgun_damage(weapon) && isdefined(attacker) && isPlayer(attacker))
			{
				util::setClientSysState("aae_soulcounter", "&AAE_TIP_GENESIS_SHIELD_TITLE");
				if(zm_weapons::is_weapon_upgraded(weapon))
				{
					is_upgraded = 1;
				}
				var_58ed85f4 = spawn("script_model", attacker GetWeaponMuzzlePoint());
				var_58ed85f4 UseWeaponModel(weapon, weapon.worldmodel, attacker GetWeaponOptions(weapon));
				var_58ed85f4.angles = attacker getPlayerAngles();
				attacker thread function_b8a2afa3();
				attacker notify("weapon_take", weapon);
				attacker TakeWeapon(weapon);
				var_58ed85f4 clientfield::set("shadowman_fx", 1);
				var_58ed85f4 moveto(var_94c6b1d7.stub.model.origin + VectorScale((0, 0, 1), 20), 2, 0.8, 0.8);
				var_58ed85f4 waittill("movedone");
				var_58ed85f4 delete();
				player = attacker;
				break;
			}
		}
		if(is_upgraded)
		{
			wait(8);
		}
		else
		{
			wait(3);
		}
		var_94c6b1d7.stub.model setcandamage(0);
		var_94c6b1d7.stub.model rotate(VectorScale((0, 1, 0), 10000));
		var_94c6b1d7.stub.model MoveZ(30, 2);
		var_94c6b1d7.stub.model waittill("movedone");
		var_94c6b1d7.stub.model SetModel("wpn_t7_zmb_dlc3_dragon_shield_dmg0_upg_world");
		if(isdefined(player))
		{
			MagicBullet(level.var_855a12ba, var_94c6b1d7.stub.model.origin - VectorScale((0, 0, 1), 200), var_94c6b1d7.stub.model.origin);
		}
		else
		{
			MagicBullet(level.var_855a12ba, var_94c6b1d7.stub.model.origin - VectorScale((0, 0, 1), 200), var_94c6b1d7.stub.model.origin, player);
		}
		var_94c6b1d7.stub.model MoveZ(-30, 0.1);
		var_94c6b1d7.stub.model RotateTo(old_angles, 0.1);
		var_94c6b1d7.stub.model waittill("movedone");
		var_94c6b1d7.stub.model clientfield::set("gravity_slam_fx", 1);
		var_94c6b1d7.stub.trigger_hintstring = &"ZOMBIE_DRAGON_SHIELD_UPGRADE_PICKUP";
		var_94c6b1d7.stub.craftableStub.str_taken = &"ZOMBIE_DRAGON_SHIELD_UPGRADE_TAKEN";
		var_94c6b1d7.stub.weaponName = GetWeapon("dragonshield_upgraded");
	}
}

/*
	Name: function_b8a2afa3
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0xE78
	Size: 0x48
	Parameters: 0
	Flags: Private
	Line Number: 184
*/
function private function_b8a2afa3()
{
	self endon("disconnect");
	self HideViewModel();
	self waittill("weapon_change");
	self ShowViewModel();
}

/*
	Name: function_bb1fbc7f
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0xEC8
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 202
*/
function function_bb1fbc7f()
{
	if(isdefined(level.var_e8bba4d1) && level.var_e8bba4d1)
	{
		return;
	}
	level.var_e8bba4d1 = 1;
	var_4ea80194 = struct::get("hope_spark", "targetname");
	var_4ea80194 zm_unitrigger::create_unitrigger("", 64, &function_4903bec6, &function_ed25d0f2, "unitrigger_radius_use");
	var_8dc2ea89 = struct::get("special_box", "targetname");
	var_8dc2ea89 zm_unitrigger::create_unitrigger("", 64, &function_2650d73f, &function_46cfcb01, "unitrigger_radius_use");
}

/*
	Name: function_4903bec6
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0xFF0
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 225
*/
function function_4903bec6(player)
{
	var_5d0b57e4 = level clientfield::get("hope_state");
	if(var_5d0b57e4 == 1)
	{
		self setHintString("");
		return 1;
	}
	return 0;
}

/*
	Name: function_ed25d0f2
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x1068
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 246
*/
function function_ed25d0f2()
{
	while(1)
	{
		self waittill("trigger", e_triggerer);
		if(e_triggerer zm_utility::in_revive_trigger())
		{
			continue;
		}
		if(!zm_utility::is_player_valid(e_triggerer, 1, 1))
		{
			continue;
		}
		var_5d0b57e4 = level clientfield::get("hope_state");
		if(var_5d0b57e4 != 1)
		{
			continue;
		}
		level thread function_b38baf01(e_triggerer);
	}
}

/*
	Name: function_b38baf01
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x1130
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 278
*/
function function_b38baf01(e_triggerer)
{
	level clientfield::set("hope_state", 2);
	e_triggerer thread function_ba9b0148();
	e_triggerer playsound("zmb_overachiever_spark_pickup");
}

/*
	Name: function_ba9b0148
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x11A0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 295
*/
function function_ba9b0148()
{
	level endon("hash_94736a8a");
	self clientfield::set_to_player("hope_spark", 1);
	self clientfield::set_player_uimodel("zmInventory.super_ee", 1);
	self waittill("damage");
	self clientfield::set_to_player("hope_spark", 0);
	self clientfield::set_player_uimodel("zmInventory.super_ee", 0);
	self playsound("zmb_overachiever_spark_lose");
	level clientfield::set("hope_state", 1);
	/#
		IPrintLnBold("Dev Block strings are not supported");
	#/
}

/*
	Name: function_2650d73f
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x12A0
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 320
*/
function function_2650d73f(player)
{
	var_5d0b57e4 = level clientfield::get("hope_state");
	b_has_spark = player clientfield::get_to_player("hope_spark");
	if(!b_has_spark)
	{
		return 0;
	}
	if(var_5d0b57e4 == 2)
	{
		self setHintString("");
		return 1;
	}
	if(var_5d0b57e4 == 3)
	{
		self setHintString("");
		return 1;
	}
	return 0;
}

/*
	Name: function_46cfcb01
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x1378
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 351
*/
function function_46cfcb01()
{
	while(1)
	{
		self waittill("trigger", e_triggerer);
		if(e_triggerer zm_utility::in_revive_trigger())
		{
			continue;
		}
		if(!zm_utility::is_player_valid(e_triggerer, 1, 1))
		{
			continue;
		}
		b_has_spark = e_triggerer clientfield::get_to_player("hope_spark");
		if(!b_has_spark)
		{
			continue;
		}
		var_5d0b57e4 = level clientfield::get("hope_state");
		if(var_5d0b57e4 != 2)
		{
			continue;
		}
		level thread function_6143b210(e_triggerer);
	}
}

/*
	Name: function_6143b210
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x1478
	Size: 0x2B8
	Parameters: 1
	Flags: None
	Line Number: 388
*/
function function_6143b210(e_triggerer)
{
	e_triggerer clientfield::set_to_player("hope_spark", 0);
	e_triggerer clientfield::set_player_uimodel("zmInventory.super_ee", 0);
	s_start = struct::get("hope_origin");
	mdl_hope = util::spawn_model("tag_origin", s_start.origin, s_start.angles);
	util::wait_network_frame();
	mdl_hope playsound("zmb_overachiever_spark_spawn");
	mdl_hope clientfield::set("hope_spark", 1);
	wait(2);
	s_target = struct::get(s_start.target);
	mdl_hope moveto(s_target.origin, 2);
	wait(3);
	s_target = struct::get(s_target.target);
	mdl_hope moveto(s_target.origin, 2);
	mdl_hope waittill("movedone");
	level clientfield::set("hope_state", 3);
	level flag::set("hope_done");
	playsoundatposition("zmb_overachiever_spark_success", (0, 0, 0));
	level.wallbuy_should_upgrade_weapon_override = &function_afddb902;
	level.magicbox_should_upgrade_weapon_override = &function_7e7eb906;
	award_item(200);
	level thread bgb::function_93da425("zm_bgb_crate_power", &function_f648c43);
	level thread bgb::function_93da425("zm_bgb_wall_power", &function_f648c43);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: award_item
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x1738
	Size: 0x280
	Parameters: 1
	Flags: None
	Line Number: 426
*/
function award_item(var_9b606949)
{
	if(var_9b606949 != 200 && level flag::get("hope_done"))
	{
		return;
	}
	switch(var_9b606949)
	{
		case 200:
		{
			str_weapon = "melee_katana";
			var_31fcdfe3 = 5;
			break;
		}
		case 5:
		{
			str_weapon = "melee_nunchuks";
			var_31fcdfe3 = 1;
			break;
		}
		case 10:
		{
			str_weapon = "melee_mace";
			var_31fcdfe3 = 2;
			break;
		}
		case 15:
		{
			str_weapon = "melee_improvise";
			var_31fcdfe3 = 3;
			break;
		}
		case 20:
		{
			str_weapon = "melee_boneglass";
			var_31fcdfe3 = 4;
			break;
		}
	}
	weapon = GetWeapon(str_weapon);
	level.var_b9f3bf28.zombie_weapon_upgrade = str_weapon;
	level.var_b9f3bf28.weapon = weapon;
	level.var_b9f3bf28.trigger_stub.weapon = weapon;
	level.var_b9f3bf28.trigger_stub.cursor_hint_weapon = weapon;
	clientfield::set(level.var_b9f3bf28.trigger_stub.clientFieldName, 0);
	level clientfield::set("time_attack_reward", var_31fcdfe3);
	util::wait_network_frame();
	clientfield::set(level.var_b9f3bf28.trigger_stub.clientFieldName, 2);
	util::wait_network_frame();
	clientfield::set(level.var_b9f3bf28.trigger_stub.clientFieldName, 1);
	level flag::set("time_attack_weapon_awarded");
}

/*
	Name: function_7e7eb906
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x19C0
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 489
*/
function function_7e7eb906(e_player, w_weapon)
{
	return 1;
}

/*
	Name: function_afddb902
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x19E0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 504
*/
function function_afddb902()
{
	return 1;
}

/*
	Name: function_f648c43
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x19F0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 519
*/
function function_f648c43()
{
	return 0;
	~;
}

/*
	Name: function_dfd4e9f8
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x1A00
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 535
*/
function function_dfd4e9f8()
{
	/#
	#/
}

/*
	Name: function_3246e71d
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x1A10
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 551
*/
function function_3246e71d(n_val)
{
	/#
		level clientfield::set("Dev Block strings are not supported", 1);
		level thread function_bb1fbc7f();
	#/
}

/*
	Name: function_3ff1131a
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x1A68
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 569
*/
function function_3ff1131a(n_val)
{
	/#
		level clientfield::set("Dev Block strings are not supported", 2);
		level thread function_bb1fbc7f();
	#/
}

/*
	Name: function_8070468
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x1AC0
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 587
*/
function function_8070468(n_val)
{
	/#
		level clientfield::set("Dev Block strings are not supported", 3);
		level thread function_bb1fbc7f();
		level flag::set("Dev Block strings are not supported");
	#/
}

/*
	Name: function_7ecb414e
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x1B38
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 606
*/
function function_7ecb414e(n_val)
{
}

/*
	Name: function_f29a5d3a
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x1B50
	Size: 0xB0
	Parameters: 0
	Flags: Private
	Line Number: 620
*/
function private function_f29a5d3a()
{
	level notify("hash_fb60eed2");
	a_pads = GetEntArray("power_volume", "targetname");
	level.var_eada0345 = 0;
	level thread function_79774b04();
	for(i = 0; i < a_pads.size; i++)
	{
		a_pads[i] thread namespace_4c9147::function_fec7f142();
	}
}

/*
	Name: function_79774b04
	Namespace: namespace_c30b09d6
	Checksum: 0x424F4353
	Offset: 0x1C08
	Size: 0xE
	Parameters: 0
	Flags: Private
	Line Number: 642
*/
function private function_79774b04()
{
	level endon("hash_fb60eed2");
}

