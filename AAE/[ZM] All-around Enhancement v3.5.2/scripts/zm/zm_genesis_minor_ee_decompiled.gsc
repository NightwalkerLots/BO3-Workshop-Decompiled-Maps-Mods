#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\challenges_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\weapons\_bouncingbetty;
#include scripts\shared\weapons\_weaponobjects;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_placeable_mine;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_octobomb;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_genesis_apothican;
#include scripts\zm\zm_genesis_ee_quest;
#include scripts\zm\zm_genesis_portals;
#include scripts\zm\zm_genesis_sound;
#include scripts\zm\zm_genesis_util;

#namespace namespace_df27fee4;

/*
	Name: __init__sytem__
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x938
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 50
*/
function autoexec __init__sytem__()
{
	system::register("zm_genesis_minor_ee", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x980
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 65
*/
function __init__()
{
	level flag::init("old_school_activated");
	level.func_override_wallbuy_prompt = &function_bc56f047;
}

/*
	Name: __main__
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x9C8
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 81
*/
function __main__()
{
	/#
		if(GetDvarInt("Dev Block strings are not supported") > 0)
		{
			level thread function_1d13619e();
		}
	#/
	level waittill("start_zombie_round_logic");
	if(GetDvarInt("splitscreen_playerCount") > 2)
	{
		return;
	}
	level thread function_f36f8cf();
	level thread function_be8c2f38();
	level thread function_5af98f35();
	level thread function_45bc2e15();
	level thread function_92b4b156();
	level thread function_b4448ecb();
	level flag::wait_till("all_power_on");
	level flag::set("power_on");
	return;
}

/*
	Name: function_b4448ecb
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0xB10
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 115
*/
function function_b4448ecb()
{
	level flag::wait_till("character_stones_done");
	while(!level flag::get("placed_audio1"))
	{
		if(isdefined(level.var_e7aa252c))
		{
			if(!level.var_e7aa252c.ignoreme)
			{
				start = 180;
				util::setClientSysState("aae_soulcounter", "ai_companion," + start + "," + 180);
				wait(1);
				while(isdefined(level.var_e7aa252c) && !level.var_e7aa252c.ignoreme)
				{
					start--;
					util::setClientSysState("aae_soulcounter", "ai_companion," + start + "," + 180);
					wait(1);
				}
				util::setClientSysState("aae_soulcounter", "ai_companion,0,0");
			}
		}
		wait(0.05);
	}
	util::setClientSysState("aae_soulcounter", "ai_companion,0,0");
	return;
	~;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_45bc2e15
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0xC80
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 154
*/
function function_45bc2e15()
{
	level flag::init("writing_on_the_wall_complete");
}

/*
	Name: function_92b4b156
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0xCB0
	Size: 0x7C8
	Parameters: 0
	Flags: None
	Line Number: 169
*/
function function_92b4b156()
{
	level flag::wait_till("writing_on_the_wall_complete");
	var_cb382f = struct::get("weapon_swapper_model", "targetname");
	var_cb382f.angles = VectorScale((0, 1, 0), 90);
	var_bf2da7b6 = struct::get("weapon_swapper_fx", "targetname");
	v_fx_pos = var_bf2da7b6.origin;
	var_c59a59e1 = 0;
	var_3bb6997f = undefined;
	var_81f963f4 = spawn("trigger_radius_use", var_cb382f.origin, 0, 100, 100);
	var_81f963f4 setHintString("");
	var_81f963f4 setcursorhint("HINT_NOICON");
	var_81f963f4 TriggerIgnoreTeam();
	var_81f963f4 UseTriggerRequireLookAt();
	exploder::exploder("fxexp_114 ");
	while(1)
	{
		switch(var_c59a59e1)
		{
			case 0:
			{
				var_81f963f4 waittill("trigger", trigPlayer);
				if(isPlayer(trigPlayer) && !trigPlayer laststand::player_is_in_laststand() && !trigPlayer.IS_DRINKING > 0)
				{
					var_3bb6997f = trigPlayer GetCurrentWeapon();
					if(!trigPlayer hasweapon(var_3bb6997f))
					{
						continue;
					}
					b_valid_weapon = trigPlayer function_a5a542a(var_3bb6997f, var_c59a59e1);
					if(!b_valid_weapon)
					{
						continue;
					}
					/#
						IPrintLnBold("Dev Block strings are not supported");
					#/
					var_f17eaf0 = trigPlayer GetWeaponAmmoStock(var_3bb6997f);
					var_5b3694f6 = trigPlayer GetWeaponAmmoClip(var_3bb6997f);
					var_be26f631 = trigPlayer GetWeaponAmmoClip(var_3bb6997f.dualWieldWeapon);
					var_c02edaaf = trigPlayer getbuildkitweaponoptions(var_3bb6997f);
					var_5c2e5267 = trigPlayer GetBuildKitAttachmentCosmeticVariantIndexes(var_3bb6997f);
					trigPlayer TakeWeapon(var_3bb6997f);
					trigPlayer zm_weapons::switch_back_primary_weapon(undefined);
					var_c59a59e1 = 1;
					var_81f963f4 setHintString("");
					if(isdefined(trigPlayer.var_fb11234e) && trigPlayer.var_fb11234e == zm_weapons::get_base_weapon(var_3bb6997f))
					{
						var_3bb6997f = trigPlayer.var_fb11234e;
					}
					level.var_3bb6997f = var_3bb6997f;
					e_model = zm_utility::spawn_buildkit_weapon_model(trigPlayer, var_3bb6997f, undefined, var_cb382f.origin, var_cb382f.angles);
					if(var_3bb6997f.isDualWield)
					{
						var_1166f70b = var_3bb6997f;
						if(isdefined(var_3bb6997f.dualWieldWeapon) && var_3bb6997f.dualWieldWeapon != level.weaponNone)
						{
							var_1166f70b = var_3bb6997f.dualWieldWeapon;
						}
						var_624e83a3 = zm_utility::spawn_buildkit_weapon_model(trigPlayer, var_1166f70b, undefined, var_cb382f.origin - VectorScale((1, 1, 1), 3), var_cb382f.angles);
						break;
					}
				}
			}
			case 1:
			{
				e_model RotateRoll(360, 1);
				if(isdefined(var_624e83a3))
				{
					var_624e83a3 RotateRoll(360, 1);
				}
				wait(1);
				var_c59a59e1 = 2;
				var_81f963f4 setHintString("");
				break;
			}
			case 2:
			{
				var_81f963f4 waittill("trigger", trigPlayer);
				if(isPlayer(trigPlayer) && !trigPlayer laststand::player_is_in_laststand() && !trigPlayer.IS_DRINKING > 0)
				{
					b_valid_weapon = trigPlayer function_a5a542a(var_3bb6997f, var_c59a59e1);
					if(!b_valid_weapon)
					{
						continue;
					}
					/#
						IPrintLnBold("Dev Block strings are not supported");
					#/
					weapon_limit = zm_utility::get_player_weapon_limit(trigPlayer);
					trigPlayer zm_weapons::weapon_give(var_3bb6997f);
					trigPlayer SetWeaponAmmoStock(var_3bb6997f, var_f17eaf0);
					trigPlayer SetWeaponAmmoClip(var_3bb6997f, var_5b3694f6);
					trigPlayer SetWeaponAmmoClip(var_3bb6997f.dualWieldWeapon, var_be26f631);
					level.var_3bb6997f = undefined;
					var_c59a59e1 = 3;
					var_81f963f4 setHintString("");
					e_model delete();
					if(isdefined(var_624e83a3))
					{
						var_624e83a3 delete();
						break;
					}
				}
			}
			case 3:
			{
				wait(1);
				var_c59a59e1 = 0;
				var_81f963f4 setHintString("");
				break;
			}
		}
		wait(0.05);
	}
	return;
	~var_c59a59e1;
}

/*
	Name: function_a5a542a
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x1480
	Size: 0x120
	Parameters: 2
	Flags: None
	Line Number: 298
*/
function function_a5a542a(var_3bb6997f, var_c59a59e1)
{
	if(self bgb::is_enabled("zm_bgb_disorderly_combat"))
	{
		return 0;
	}
	if(zm_utility::is_hero_weapon(var_3bb6997f))
	{
		return 0;
	}
	if(zm_equipment::is_equipment(var_3bb6997f))
	{
		return 0;
	}
	if(zm_utility::is_placeable_mine(var_3bb6997f))
	{
		return 0;
	}
	if(self zm_utility::has_powerup_weapon())
	{
		return 0;
	}
	var_26e1938e = self getweaponslistprimaries();
	if(var_c59a59e1 == 0 && var_26e1938e.size < 2)
	{
		return 0;
	}
	if(var_c59a59e1 == 2 && self zm_weapons::has_weapon_or_upgrade(var_3bb6997f))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_5af98f35
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x15A8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 342
*/
function function_5af98f35()
{
	var_38d3be2e = GetEnt("smg_thompson_wallbuy_chalk", "targetname");
	var_38d3be2e Hide();
	level function_a91f75d9();
	level thread function_ff9395ca();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e1963311
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x1628
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 362
*/
function function_e1963311()
{
	/#
		mdl_chalk = GetEnt("Dev Block strings are not supported", "Dev Block strings are not supported");
		if(!isdefined(mdl_chalk))
		{
			return;
		}
		mdl_chalk delete();
		iprintln("Dev Block strings are not supported");
		e_who = GetPlayers()[0];
		e_who.b_has_chalk = 1;
		level.var_6d7c54f9 = "Dev Block strings are not supported";
		level notify("hash_94556ac9");
	#/
}

/*
	Name: function_a91f75d9
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x1700
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 389
*/
function function_a91f75d9()
{
	level endon("hash_94556ac9");
	var_6fdae6db = struct::get("chalk_pickup", "targetname");
	var_6fdae6db zm_unitrigger::create_unitrigger(undefined, 128);
	var_6fdae6db waittill("trigger_activated", e_who);
	e_who playsound("zmb_minor_writing_chalk_pickup");
	mdl_chalk = GetEnt("chalk_model", "targetname");
	mdl_chalk ghost();
	/#
		iprintln("Dev Block strings are not supported");
	#/
	e_who.b_has_chalk = 1;
	e_who thread function_7367d2c6();
	if(!isdefined(level.var_6d7c54f9))
	{
		level.var_6d7c54f9 = "tag_origin";
	}
	level notify("hash_94556ac9");
}

/*
	Name: function_7367d2c6
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x1848
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 420
*/
function function_7367d2c6()
{
	level endon("hash_9abed81e");
	self waittill("disconnect");
	mdl_chalk = GetEnt("chalk_model", "targetname");
	mdl_chalk show();
	level thread function_a91f75d9();
}

/*
	Name: function_ff9395ca
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x18C8
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 439
*/
function function_ff9395ca()
{
	level.a_mdl_writing = [];
	var_eb751e53 = struct::get_array("writing_trigger", "targetname");
	foreach(var_2ac294d8 in var_eb751e53)
	{
		mdl_writing = GetEnt(var_2ac294d8.target, "targetname");
		Array::add(level.a_mdl_writing, mdl_writing);
		var_2ac294d8 thread function_a8fc7a77();
	}
}

/*
	Name: function_a8fc7a77
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x19E8
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 461
*/
function function_a8fc7a77()
{
	level endon("hash_9abed81e");
	self zm_unitrigger::create_unitrigger(undefined, 128);
	mdl_writing = GetEnt(self.target, "targetname");
	while(1)
	{
		self waittill("trigger_activated", e_player);
		if(isdefined(e_player.b_has_chalk) && e_player.b_has_chalk)
		{
			var_5d3ba118 = level.var_6d7c54f9;
			if(level.var_6d7c54f9 == "tag_origin")
			{
				e_player playsound("zmb_minor_writing_erase");
			}
			else
			{
				e_player playsound("zmb_minor_writing_write");
			}
			level.var_6d7c54f9 = mdl_writing.model;
			mdl_writing SetModel(var_5d3ba118);
			level thread function_d0f8a867();
		}
	}
}

/*
	Name: function_d0f8a867
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x1B40
	Size: 0x248
	Parameters: 0
	Flags: None
	Line Number: 497
*/
function function_d0f8a867()
{
	var_88b339cd = 1;
	foreach(mdl_writing in level.a_mdl_writing)
	{
		switch(mdl_writing.targetname)
		{
			case "verruckt_writing":
			{
				if(mdl_writing.model != "p7_zm_gen_writing_ver_wishing")
				{
					var_88b339cd = 0;
					break;
				}
			}
			case "ndu_writing_1":
			{
				if(mdl_writing.model != "p7_zm_gen_writing_nac_salvation")
				{
					var_88b339cd = 0;
					break;
				}
			}
			case "ndu_writing_2":
			{
				if(mdl_writing.model != "p7_zm_gen_writing_nac_ascend")
				{
					var_88b339cd = 0;
					break;
				}
			}
			case "undercroft_writing":
			{
				if(mdl_writing.model != "tag_origin")
				{
					var_88b339cd = 0;
					break;
				}
			}
			case "prison_writing":
			{
				if(mdl_writing.model != "p7_zm_gen_writing_mob_soul_alone")
				{
					var_88b339cd = 0;
					break;
				}
			}
			case "theatre_writing":
			{
				if(mdl_writing.model != "p7_zm_gen_writing_kin_scrawl_know")
				{
					var_88b339cd = 0;
					break;
				}
			}
		}
	}
	if(var_88b339cd)
	{
		playsoundatposition("zmb_minor_complete", (0, 0, 0));
		level flag::set("writing_on_the_wall_complete");
		var_38d3be2e = GetEnt("smg_thompson_wallbuy_chalk", "targetname");
		var_38d3be2e show();
	}
}

/*
	Name: function_bc56f047
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x1D90
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 573
*/
function function_bc56f047(e_player)
{
	if(self.weapon.name == "smg_thompson")
	{
		if(level flag::get("writing_on_the_wall_complete"))
		{
			return 1;
		}
		self.stub.hint_string = "";
		self setHintString("");
		self.stub.cursor_hint = "HINT_NOICON";
		self setcursorhint("HINT_NOICON");
		return 0;
	}
	return 1;
}

/*
	Name: function_f36f8cf
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x1E60
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 600
*/
function function_f36f8cf()
{
	level.var_f11300cd = 0;
	level flag::init("lil_arnie_prereq_done");
	level flag::init("lil_arnie_done");
	/#
		if(GetDvarInt("Dev Block strings are not supported") > 0)
		{
			level.var_f11300cd = 99;
		}
	#/
	zm_spawner::register_zombie_death_event_callback(&function_4a0f0038);
	level flag::wait_till("lil_arnie_prereq_done");
	zm_spawner::deregister_zombie_death_event_callback(&function_4a0f0038);
	level.check_b_valid_poi = &namespace_fdab22a5::function_5516baeb;
	level flag::wait_till("lil_arnie_done");
	foreach(player in level.activePlayers)
	{
		if(player hasweapon(level.w_octobomb))
		{
			player _zm_weap_octobomb::player_give_octobomb("octobomb_upgraded");
		}
	}
	level.zombie_weapons[level.w_octobomb].is_in_box = 0;
	level.zombie_weapons[level.w_octobomb_upgraded].is_in_box = 1;
}

/*
	Name: function_4a0f0038
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x2070
	Size: 0xD0
	Parameters: 3
	Flags: None
	Line Number: 637
*/
function function_4a0f0038(e_attacker, str_means_of_death, weapon)
{
	if(self.damageWeapon === level.w_octobomb)
	{
		level.var_f11300cd++;
		if(level.var_f11300cd >= 100)
		{
			util::setClientSysState("aae_soulcounter", "octobomb,0,0");
			level flag::set("lil_arnie_prereq_done");
		}
		else
		{
			util::setClientSysState("aae_soulcounter", "octobomb," + level.var_f11300cd + "," + 100);
		}
	}
}

/*
	Name: function_131a352c
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x2148
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 664
*/
function function_131a352c(b_valid_poi)
{
	s_target = struct::get("lil_arnie_upgrade", "targetname");
	if(DistanceSquared(self.origin, s_target.origin) < 7225)
	{
		self.origin = s_target.origin;
		self.angles = self.angles + VectorScale((1, 0, 1), 90);
		self.clone_model ghost();
		self.anim_model = util::spawn_model(level.mdl_octobomb, self.origin, (0, 0, 0));
		self.anim_model LinkTo(self.clone_model);
		self.anim_model clientfield::set("octobomb_fx", 3);
		wait(0.05);
		self.anim_model clientfield::set("octobomb_fx", 1);
		self thread _zm_weap_octobomb::animate_octobomb(0);
		wait(2);
		self.anim_model thread function_bf3603f7();
		return 0;
	}
	return b_valid_poi;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_bf3603f7
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x22F0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 696
*/
function function_bf3603f7()
{
	wait(1);
	self zm_utility::self_delete();
	level flag::set("lil_arnie_done");
}

/*
	Name: function_be8c2f38
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x2338
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 713
*/
function function_be8c2f38()
{
	level.var_aa421b74 = [];
	level.var_557b53fd = [];
	level.var_557b53fd[1] = 25;
	level.var_557b53fd[2] = 15;
	level.var_557b53fd[3] = 12;
	level.var_557b53fd[4] = 2;
	level.var_8091d507 = 0;
	a_s_switches = struct::get_array("old_school_switch");
	Array::thread_all(a_s_switches, &function_6e14903b);
	while(level.var_8091d507 < a_s_switches.size)
	{
		wait(0.05);
	}
	level thread function_77da8ee0();
	return;
}

/*
	Name: function_6e14903b
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x2438
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 742
*/
function function_6e14903b()
{
	level endon("hash_ac936347");
	level.var_c592ecc1 = 0;
	s_unitrigger = self zm_unitrigger::create_unitrigger(&"", 64, &function_b2869a31);
	s_unitrigger.require_look_at = 1;
	s_unitrigger.b_enabled = 1;
	Array::add(level.var_aa421b74, s_unitrigger);
	while(1)
	{
		self waittill("trigger_activated", e_player);
		if(s_unitrigger.b_enabled == 1)
		{
			playsoundatposition("zmb_minor_skool_button", s_unitrigger.origin);
			if(level.var_c592ecc1 == 0)
			{
				level thread function_2d1b88ec();
				level.var_c592ecc1 = 1;
			}
			s_unitrigger.b_enabled = 0;
			level.var_8091d507++;
		}
	}
}

/*
	Name: function_b2869a31
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x2588
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 777
*/
function function_b2869a31(e_player)
{
	if(self.stub.b_enabled)
	{
		foreach(e_player in level.players)
		{
			self setvisibletoplayer(e_player);
		}
		return 1;
	}
	foreach(e_player in level.players)
	{
		self setinvisibletoplayer(e_player);
	}
	return 0;
}

/*
	Name: function_2d1b88ec
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x26C0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 804
*/
function function_2d1b88ec()
{
	level endon("hash_b442f53");
	level endon("hash_ac936347");
	wait(level.var_557b53fd[level.players.size]);
	level.var_c592ecc1 = 0;
	level.var_8091d507 = 0;
	foreach(s_unitrigger in level.var_aa421b74)
	{
		s_unitrigger.b_enabled = 1;
	}
	level notify("hash_b442f53");
}

/*
	Name: function_77da8ee0
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x27A0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 828
*/
function function_77da8ee0()
{
	level flag::set("old_school_activated");
	playsoundatposition("zmb_minor_skool_complete", (0, 0, 0));
	foreach(s_unitrigger in level.var_aa421b74)
	{
		s_unitrigger.b_enabled = 0;
	}
	level thread namespace_42091091::function_b18c11d8();
}

/*
	Name: function_a1f4f500
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x2888
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 849
*/
function function_a1f4f500()
{
	level._bouncingBettyWatchForTrigger = &function_82df6cd4;
	level thread function_f227a0ab();
}

/*
	Name: function_f227a0ab
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x28C8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 865
*/
function function_f227a0ab()
{
}

/*
	Name: function_c1ccaae0
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x28D8
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 879
*/
function function_c1ccaae0()
{
	mdl_asteroid = GetEnt("gateworm_asteroid", "targetname");
	mdl_egg = util::spawn_model("gateworm", mdl_asteroid.origin);
	mdl_asteroid delete();
	var_2b641c49 = struct::get("egg_destination", "targetname");
	mdl_egg moveto(var_2b641c49.origin, 3);
	mdl_egg waittill("movedone");
	var_6d268157 = var_2b641c49 zm_unitrigger::create_unitrigger(undefined, 64);
	while(1)
	{
		var_2b641c49 waittill("trigger_activated", e_who);
		if(!e_who flag::get("holding_egg"))
		{
			break;
		}
	}
	e_who.var_7f70ccd5 = 1;
	zm_unitrigger::unregister_unitrigger(var_6d268157);
	mdl_egg delete();
	level thread activate_pot();
	return;
	continue;
}

/*
	Name: activate_pot
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x2A78
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 914
*/
function activate_pot()
{
	var_9c1e0e1a = struct::get("pot_trigger", "targetname");
	var_a0069a05 = var_9c1e0e1a zm_unitrigger::create_unitrigger(undefined, 64);
	while(1)
	{
		var_9c1e0e1a waittill("trigger_activated", e_who);
		if(isdefined(e_who.var_7f70ccd5) && e_who.var_7f70ccd5)
		{
			break;
		}
	}
	var_ed0817e0 = struct::get("egg_pot_location", "targetname");
	mdl_egg = util::spawn_model("gateworm", var_ed0817e0.origin);
	level waittill("start_of_round");
	level waittill("start_of_round");
	level waittill("start_of_round");
	while(1)
	{
		var_9c1e0e1a waittill("trigger_activated", e_who);
		if(isdefined(e_who.var_7f70ccd5) && e_who.var_7f70ccd5)
		{
			break;
		}
	}
	zm_unitrigger::unregister_unitrigger(var_a0069a05);
	level thread activate_ovary();
}

/*
	Name: activate_ovary
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x2C20
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 953
*/
function activate_ovary()
{
}

/*
	Name: function_82df6cd4
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x2C30
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 967
*/
function function_82df6cd4(watcher)
{
	self endon("death");
	self endon("hacked");
	self endon("kill_target_detection");
	e_trigger = GetEnt("gateworm_meteor_trigger", "targetname");
	while(1)
	{
		if(self istouching(e_trigger))
		{
			break;
		}
		wait(0.05);
	}
	level thread function_c1ccaae0();
}

/*
	Name: function_1d13619e
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x2CE0
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 994
*/
function function_1d13619e()
{
	/#
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_6cd2074);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_7c5650a5);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_c3100cb0);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_e1963311);
	#/
}

/*
	Name: function_7c5650a5
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x2DD8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 1014
*/
function function_7c5650a5(n_val)
{
	/#
		level flag::set("Dev Block strings are not supported");
		return;
	#/
}

/*
	Name: function_6cd2074
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x2E10
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 1032
*/
function function_6cd2074(n_val)
{
	/#
		level thread function_77da8ee0();
		return;
	#/
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c3100cb0
	Namespace: namespace_df27fee4
	Checksum: 0x424F4353
	Offset: 0x2E40
	Size: 0x2C
	Parameters: 1
	Flags: None
	Line Number: 1051
*/
function function_c3100cb0(n_val)
{
	/#
		level flag::set("Dev Block strings are not supported");
	#/
}

