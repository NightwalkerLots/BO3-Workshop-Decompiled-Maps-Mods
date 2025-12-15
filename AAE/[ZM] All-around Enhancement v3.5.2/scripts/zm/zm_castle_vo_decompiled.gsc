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
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_powerup_castle_demonic_rune;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_timer;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_elemental_bow;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craftables;
#include scripts\zm\zm_castle_ee;
#include scripts\zm\zm_castle_weap_quest_upgrade;

#namespace namespace_97ddfc0d;

/*
	Name: __init__sytem__
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x1DE8
	Size: 0xE0
	Parameters: 0
	Flags: AutoExec
	Line Number: 41
*/
function autoexec __init__sytem__()
{
	system::register("zm_castle_vo", &__init__, undefined, undefined);
	for(i = 0; i < GetDvarInt("com_maxclients"); i++)
	{
		clientfield::register("world", "player" + i + "wearableItem", 15000, 2, "int");
	}
	level.var_ee1b913a = &namespace_99cb5531::function_ab623d34;
	level.var_1d3b068e = &namespace_e581e076::function_5b767c2;
}

/*
	Name: __init__
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x1ED0
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function __init__()
{
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	level.a_e_speakers = [];
	level.var_82118499 = 0;
	level.var_169991e1 = 0;
	level thread function_7884e6b8();
	level thread function_65c13c89();
	level thread function_a1e1ab31();
	level thread function_8d44c804();
	level thread function_9f848cca();
	level thread function_7091d990();
	level thread function_cfd97735();
	level thread function_604361f();
	level thread function_68089900();
	level thread function_1bc76ea3();
	level thread function_fbe2f6cb();
	level.audio_get_mod_type = &function_642e6aef;
	level flag::init("story_playing");
	level thread function_6dece0fa();
}

/*
	Name: function_8e8c93f7
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x2098
	Size: 0x140
	Parameters: 0
	Flags: Private
	Line Number: 95
*/
function private function_8e8c93f7()
{
	storm = struct::get("quest_start_elemental_storm");
	fire = struct::get("quest_start_rune_prison");
	wolf = struct::get("quest_start_wolf_howl");
	var_6d9fbd9a = struct::get("quest_start_demon_gate");
	storm thread function_d6ff717e("elemental_bow_storm", "quest_state_storm");
	fire thread function_d6ff717e("elemental_bow_rune_prison", "quest_state_rune");
	wolf thread function_d6ff717e("elemental_bow_wolf_howl", "quest_state_wolf");
	var_6d9fbd9a thread function_d6ff717e("elemental_bow_demongate", "quest_state_demon");
}

/*
	Name: function_d6ff717e
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x21E0
	Size: 0x138
	Parameters: 2
	Flags: Private
	Line Number: 117
*/
function private function_d6ff717e(vox, cf)
{
	self.var_b275b6d9 = [];
	while(isdefined(self) && level clientfield::get(cf) < 1)
	{
		wait(0.05);
		if(isdefined(self.var_67b5dd94) && isdefined(self.var_67b5dd94.playertrigger) && self.var_67b5dd94.playertrigger.size > 0 && level clientfield::get(cf) < 1)
		{
			self thread function_3206c68b(vox, cf);
			while(isdefined(self.var_67b5dd94) && isdefined(self.var_67b5dd94.playertrigger) && self.var_67b5dd94.playertrigger.size > 0 && level clientfield::get(cf) < 1)
			{
				wait(0.05);
			}
		}
	}
	return;
}

/*
	Name: function_3206c68b
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x2320
	Size: 0xE8
	Parameters: 2
	Flags: Private
	Line Number: 145
*/
function private function_3206c68b(vox, cf)
{
	self notify("hash_3206c68b");
	self endon("hash_3206c68b");
	while(isdefined(self.var_67b5dd94) && isdefined(self.var_67b5dd94.playertrigger) && self.var_67b5dd94.playertrigger.size > 0 && level clientfield::get(cf) < 1)
	{
		self.var_67b5dd94 waittill("trigger", player);
		if(level clientfield::get(cf) < 1)
		{
			player thread function_82873c9c(vox);
		}
	}
}

/*
	Name: function_82873c9c
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x2410
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 169
*/
function function_82873c9c(vox)
{
	self notify("hash_82873c9c");
	self endon("hash_82873c9c");
	self endon("bled_out");
	self endon("death");
	self endon("disconnect");
	if(!isdefined(self.var_3b590f8d))
	{
		self.var_3b590f8d = [];
	}
	if(IsInArray(self.var_3b590f8d, vox))
	{
		return;
	}
	wait(1);
	if(vox == "elemental_bow_demongate")
	{
		wait(19);
	}
	while(isdefined(level.sndVoxOverride) && level.sndVoxOverride || (isdefined(self.isSpeaking) && self.isSpeaking && (!(isdefined(self.b_wait_if_busy) && self.b_wait_if_busy))))
	{
		wait(0.05);
	}
	self.var_3b590f8d[self.var_3b590f8d.size] = vox;
	self zm_audio::create_and_play_dialog("weapon_pickup", vox);
	return;
}

/*
	Name: function_6dece0fa
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x2550
	Size: 0x3B8
	Parameters: 0
	Flags: None
	Line Number: 208
*/
function function_6dece0fa()
{
	level flag::wait_till("initial_blackscreen_passed");
	level.zombie_weapons[GetWeapon("hero_gravityspikes_melee")].vox = "spikes";
	zm_audio::zmbVoxAdd("weapon_pickup", "dualwield", "box_dual", 100, 0);
	zm_audio::zmbVoxAdd("weapon_pickup", "wpck_ray", "box_raygun", 100, 0);
	zm_audio::zmbVoxAdd("perk", "specialty_armorvest", "der_perk_jugga", 100, 0);
	zm_audio::zmbVoxAdd("perk", "specialty_quickrevive", "der_perk_revive", 100, 0);
	zm_audio::zmbVoxAdd("perk", "specialty_fastreload", "der_perk_speed", 100, 0);
	zm_audio::zmbVoxAdd("perk", "specialty_doubletap2", "der_perk_double", 100, 0);
	level._audio_custom_weapon_check = &weapon_type_check_custom;
	level.var_dfc343e9 = 0;
	level thread function_ad2b4f8a();
	level thread function_effd840b(struct::get("upgraded_bow_struct_elemental_storm", "targetname"), "lighting", "elemental_storm_upgraded");
	level thread function_effd840b(struct::get("upgraded_bow_struct_wolf_howl", "targetname"), "wolf", "wolf_howl_upgraded");
	level thread function_effd840b(struct::get("upgraded_bow_struct_demon_gate", "targetname"), "void", "demon_gate_upgraded");
	level thread function_effd840b(struct::get("upgraded_bow_struct_rune_prison", "targetname"), "fire", "rune_prison_upgraded");
	level thread function_ffbf4520();
	level thread function_64629834();
	level thread function_55278301();
	level flag::wait_till("elemental_storm_wallrun");
	if(isdefined(level.var_f8d1dc16))
	{
		level.var_f8d1dc16 zm_audio::create_and_play_dialog("quest", "tornado");
	}
	level flag::wait_till_all(Array("elemental_storm_batteries", "elemental_storm_beacons_charged"));
	if(isdefined(level.var_f8d1dc16))
	{
		level.var_f8d1dc16 zm_audio::create_and_play_dialog("quest", "weathervane");
	}
}

/*
	Name: weapon_type_check_custom
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x2910
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 250
*/
function weapon_type_check_custom(weapon, magic_box)
{
	if(weapon.isDualWield)
	{
		return "dualwield";
		return;
	}
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_395c3b6
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x2950
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 273
*/
function function_395c3b6()
{
	var_e6989b8 = namespace_c93e4c32::function_f507c094();
	if(level.var_8bdb0713 >= namespace_c93e4c32::function_4400f882())
	{
		var_9fe4c285 = zombie_utility::get_current_zombie_count() + level.zombie_total + level.var_8bdb0713;
		if(var_9fe4c285 >= var_e6989b8)
		{
			return var_e6989b8;
		}
		return var_9fe4c285;
	}
	max_zombies = zm::get_zombie_count_for_round(level.round_number, level.players.size);
	var_1ead72fd = zm::get_zombie_count_for_round(level.round_number + 1, level.players.size);
	if(max_zombies >= var_e6989b8)
	{
		if(level.var_8bdb0713 >= var_e6989b8)
		{
			return level.var_8bdb0713;
		}
		return var_e6989b8;
	}
	if(max_zombies + var_1ead72fd >= var_e6989b8)
	{
		if(level.var_8bdb0713 >= var_e6989b8)
		{
			return level.var_8bdb0713;
		}
		return var_e6989b8;
	}
	return max_zombies + var_1ead72fd;
}

/*
	Name: function_a4de2f0f
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x2AB8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 316
*/
function function_a4de2f0f()
{
	level waittill("hash_6f831a91");
	a_zones = Array(1, 2, 3, 4);
	for(i = 0; i < a_zones.size; i++)
	{
		util::setClientSysState("aae_soulcounter", "keepers" + a_zones[i] + ",0,0");
		wait(0.2);
	}
}

/*
	Name: function_4f42cce0
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x2B68
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 337
*/
function function_4f42cce0()
{
	level endon("hash_6f831a91");
	level thread function_a4de2f0f();
	while(!isdefined(level.var_f1b0baba))
	{
		wait(0.05);
	}
	wait(0.5);
	var_1e7b35fa = GetEnt("keeper_archon_ai", "targetname");
	var_1e7b35fa endon("death");
	while(isdefined(var_1e7b35fa))
	{
		var_1e7b35fa.old_goal = level.var_f1b0baba;
		while(!isdefined(level.var_f1b0baba) || var_1e7b35fa.old_goal == level.var_f1b0baba)
		{
			wait(0.05);
		}
		util::setClientSysState("aae_soulcounter", "keepers" + var_1e7b35fa.old_goal + ",0,0");
	}
}

/*
	Name: function_64629834
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x2C78
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 369
*/
function function_64629834()
{
	level endon("hash_6f831a91");
	level waittill("hash_4619f71b");
	thread function_4f42cce0();
	level.var_f2080681 = 0;
	while(1)
	{
		while(!isdefined(level.var_f1b0baba) || !isdefined(level.var_8bdb0713))
		{
			wait(0.05);
		}
		wait(0.05);
		if(level.var_f2080681 != level.var_8bdb0713)
		{
			level.var_f2080681 = level.var_8bdb0713;
			if(!level.var_8bdb0713)
			{
				util::setClientSysState("aae_soulcounter", "keepers" + level.var_f1b0baba + "," + level.var_8bdb0713 + ",0");
				continue;
			}
			var_8e0737a3 = function_395c3b6();
			if(level.var_8bdb0713 >= var_8e0737a3)
			{
				var_8e0737a3 = 0;
			}
			util::setClientSysState("aae_soulcounter", "keepers" + level.var_f1b0baba + "," + level.var_8bdb0713 + "," + var_8e0737a3 + ",keeper_" + level.var_1f18338d);
		}
	}
}

/*
	Name: function_ffbf4520
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x2E00
	Size: 0x240
	Parameters: 0
	Flags: None
	Line Number: 410
*/
function function_ffbf4520()
{
	while(!isdefined(level.var_e6d07014))
	{
		wait(0.05);
	}
	level.var_e6d07014 endon("death");
	level.var_e6d07014.oldValue = 0;
	var_b0f0d742 = GetEntArray("aq_wh_dig_volume", "script_noteworthy");
	foreach(var_a2094333 in var_b0f0d742)
	{
		var_a2094333.oldValue = 0;
	}
	while(1)
	{
		wait(0.05);
		foreach(var_a2094333 in var_b0f0d742)
		{
			if(var_a2094333.oldVal != var_a2094333.var_252d000d)
			{
				var_a2094333.oldVal = var_a2094333.var_252d000d;
				if(var_a2094333.var_252d000d >= 10 || !var_a2094333.var_252d000d)
				{
					maxValue = 0;
				}
				else
				{
					maxValue = 10;
				}
				util::setClientSysState("aae_soulcounter", var_a2094333.target + "," + var_a2094333.var_252d000d + "," + maxValue);
			}
		}
	}
}

/*
	Name: function_9ba79446
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x3048
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 455
*/
function function_9ba79446(notify_string, var_ab7c0e1a)
{
	level waittill(notify_string);
	level notify(notify_string + "_end");
	util::setClientSysState("aae_soulcounter", var_ab7c0e1a + ",0,0");
}

/*
	Name: function_effd840b
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x30A8
	Size: 0x138
	Parameters: 3
	Flags: None
	Line Number: 472
*/
function function_effd840b(var_470760ce, var_ab7c0e1a, notify_string)
{
	level endon(notify_string + "_end");
	level thread function_9ba79446(notify_string, var_ab7c0e1a);
	var_470760ce.oldVal = 0;
	while(1)
	{
		wait(0.05);
		if(var_470760ce.oldVal != var_470760ce.var_ce58f456)
		{
			var_470760ce.oldVal = var_470760ce.var_ce58f456;
			if(var_470760ce.var_ce58f456 >= 20 || !var_470760ce.var_ce58f456)
			{
				maxValue = 0;
			}
			else
			{
				maxValue = 20;
			}
			util::setClientSysState("aae_soulcounter", var_ab7c0e1a + "," + var_470760ce.var_ce58f456 + "," + maxValue);
		}
	}
}

/*
	Name: function_8492571d
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x31E8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 506
*/
function function_8492571d()
{
	level waittill("soul_catchers_charged");
	for(i = 0; i < level.soul_catchers.size; i++)
	{
		util::setClientSysState("aae_soulcounter", "dragon" + i + ",0,0");
		wait(0.2);
	}
}

/*
	Name: function_ad2b4f8a
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x3260
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 526
*/
function function_ad2b4f8a()
{
	level thread function_8492571d();
	level endon("soul_catchers_charged");
	for(i = 0; i < level.soul_catchers.size; i++)
	{
		level.soul_catchers[i].oldVal = 0;
	}
	while(1)
	{
		wait(0.05);
		for(i = 0; i < level.soul_catchers.size; i++)
		{
			if(level.soul_catchers[i].oldVal != level.soul_catchers[i].var_98730ffa)
			{
				level.soul_catchers[i].oldVal = level.soul_catchers[i].var_98730ffa;
				if(level.soul_catchers[i].var_98730ffa >= 8)
				{
					maxValue = 0;
				}
				else
				{
					maxValue = 7;
				}
				util::setClientSysState("aae_soulcounter", "dragon" + i + "," + level.soul_catchers[i].var_98730ffa - 1 + "," + maxValue);
			}
		}
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x3418
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 566
*/
function on_player_spawned()
{
	self.isSpeaking = 0;
	self.n_vo_priority = 0;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: on_player_connect
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x3440
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 584
*/
function on_player_connect()
{
	self endon("disconnect");
	self endon("death");
	level flag::wait_till("ee_claw_hat");
	level clientfield::set("player" + self GetEntityNumber() + "wearableItem", 1);
}

/*
	Name: function_7884e6b8
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x34B8
	Size: 0x16A0
	Parameters: 0
	Flags: None
	Line Number: 602
*/
function function_7884e6b8()
{
	self endon("_zombie_game_over");
	level.var_4ea3bfd0 = [];
	level.var_4ea3bfd0[0][0] = Array("vox_plr_0_round1_start_0", "vox_plr_2_round1_start_0");
	level.var_4ea3bfd0[0][1] = Array("vox_plr_0_round1_end_0", "vox_plr_2_round1_end_0");
	level.var_4ea3bfd0[0][2] = Array("vox_plr_0_round2_end_0", "vox_plr_2_round2_end_0");
	level.var_4ea3bfd0[1][0] = Array("vox_plr_1_round1_start_0", "vox_plr_2_round1_start_0");
	level.var_4ea3bfd0[1][1] = Array("vox_plr_1_round1_end_0", "vox_plr_2_round1_end_0");
	level.var_4ea3bfd0[1][2] = Array("vox_plr_1_round2_end_0", "vox_plr_2_round2_end_0");
	level.var_4ea3bfd0[3][0] = Array("vox_plr_3_round1_start_0", "vox_plr_2_round1_start_0");
	level.var_4ea3bfd0[3][1] = Array("vox_plr_3_round1_end_0", "vox_plr_2_round1_end_0");
	level.var_4ea3bfd0[3][2] = Array("vox_plr_3_round2_end_0", "vox_plr_2_round2_end_0");
	level.var_f8331b71 = [];
	level.var_f8331b71[0] = Array(0, 0.5);
	level.var_f8331b71[1] = Array(0, 0.5);
	level.var_f8331b71[2] = Array(0, 0.5);
	level.var_524d2080 = [];
	level.var_524d2080[0][0] = "vox_grop_groph_2_0";
	level.var_524d2080[0][1][0] = Array("vox_plr_2_groph_2_response_0_0", "vox_grop_groph_2_response_1_0", "vox_plr_2_groph_2_response_2_0");
	level.var_524d2080[0][2][0] = Array("vox_plr_2_groph_2_response_0_pa_0", "vox_grop_groph_2_response_1_0", "vox_plr_2_groph_2_response_2_pa_0");
	level.var_524d2080[0][3] = undefined;
	level.var_524d2080[1][0] = "vox_grop_groph_1_0";
	level.var_524d2080[1][1][0] = Array("vox_plr_2_groph_1_response_0_0", "vox_grop_groph_1_response_1_0", "vox_plr_2_groph_1_response_2_0", "vox_grop_groph_1_response_3_0", "vox_plr_2_groph_1_response_4_0");
	level.var_524d2080[1][2][0] = Array("vox_plr_2_groph_1_response_0_pa_0", "vox_grop_groph_1_response_1_0", "vox_plr_2_groph_1_response_2_pa_0", "vox_grop_groph_1_response_3_0", "vox_plr_2_groph_1_response_4_pa_0");
	level.var_524d2080[1][3] = Array("vox_plr_", "_groph_1_response_5_0");
	level.var_524d2080[2][0] = "vox_grop_groph_3_0";
	level.var_524d2080[2][1][0] = Array("vox_plr_2_groph_3_response_0_0");
	level.var_524d2080[2][2][0] = Array("vox_plr_2_groph_3_response_0_pa_0");
	level.var_524d2080[2][3] = Array("vox_plr_", "_groph_3_response_1_0");
	level.var_956d74f = [];
	level.var_956d74f[4][0] = Array(0.5, 0.5, 0.5);
	level.var_956d74f[5][0] = Array(0.5, 0.5, 0.5, 0.5, 0.5);
	level.var_956d74f[6][0] = Array(0.5);
	var_38607083 = [];
	var_38607083[0] = Array("vox_plr_0_interaction_rich_demp_1_0", "vox_plr_2_interaction_rich_demp_1_1");
	var_38607083[1] = Array("vox_plr_2_interaction_rich_demp_2_0", "vox_plr_0_interaction_rich_demp_2_1");
	var_38607083[2] = Array("vox_plr_0_interaction_rich_demp_3_0", "vox_plr_2_interaction_rich_demp_3_1");
	var_38607083[3] = Array("vox_plr_2_interaction_rich_demp_4_0", "vox_plr_0_interaction_rich_demp_4_1");
	var_38607083[4] = Array("vox_plr_2_interaction_rich_demp_5_0", "vox_plr_0_interaction_rich_demp_5_1");
	var_7ff3a3c1 = [];
	var_7ff3a3c1[0] = Array(0, 0.5);
	var_7ff3a3c1[1] = Array(0, 0.5);
	var_7ff3a3c1[2] = Array(0, 0.5);
	var_7ff3a3c1[3] = Array(0, 0.5);
	var_7ff3a3c1[4] = Array(0, 0.5);
	var_98d3df13 = 0;
	var_69c11398 = [];
	var_69c11398[0] = Array("vox_plr_1_interaction_rich_niko_1_0", "vox_plr_2_interaction_rich_niko_1_1");
	var_69c11398[1] = Array("vox_plr_1_interaction_rich_niko_2_0", "vox_plr_2_interaction_rich_niko_2_1");
	var_69c11398[2] = Array("vox_plr_2_interaction_rich_niko_3_0", "vox_plr_1_interaction_rich_niko_3_1");
	var_69c11398[3] = Array("vox_plr_2_interaction_rich_niko_4_0", "vox_plr_1_interaction_rich_niko_4_1");
	var_69c11398[4] = Array("vox_plr_2_interaction_rich_niko_5_0", "vox_plr_1_interaction_rich_niko_5_1");
	var_3b4286c8 = [];
	var_3b4286c8[0] = Array(0, 0.5);
	var_3b4286c8[1] = Array(0, 0.5);
	var_3b4286c8[2] = Array(0, 0.5, 0.5);
	var_3b4286c8[3] = Array(0, 0.5);
	var_3b4286c8[4] = Array(0, 0.5);
	var_f5c2b1e8 = 0;
	var_e2b4828c = [];
	var_e2b4828c[0] = Array("vox_plr_3_interaction_rich_takeo_1_0", "vox_plr_2_interaction_rich_takeo_1_1");
	var_e2b4828c[1] = Array("vox_plr_3_interaction_rich_takeo_2_0", "vox_plr_2_interaction_rich_takeo_2_1");
	var_e2b4828c[2] = Array("vox_plr_3_interaction_rich_takeo_3_0", "vox_plr_2_interaction_rich_takeo_3_1");
	var_e2b4828c[3] = Array("vox_plr_3_interaction_rich_takeo_4_0", "vox_plr_2_interaction_rich_takeo_4_1");
	var_e2b4828c[4] = Array("vox_plr_2_interaction_rich_takeo_5_0", "vox_plr_3_interaction_rich_takeo_5_1");
	var_4cce0630 = [];
	var_4cce0630[0] = Array(0, 0.5);
	var_4cce0630[1] = Array(0, 0.5);
	var_4cce0630[2] = Array(0, 0.5);
	var_4cce0630[3] = Array(0, 0.5);
	var_4cce0630[4] = Array(0, 0.5);
	var_9589fa70 = 0;
	var_1f05f8f0 = [];
	var_1f05f8f0[0] = Array("vox_plr_0_interaction_demp_niko_1_0", "vox_plr_1_interaction_demp_niko_1_1");
	var_1f05f8f0[1] = Array("vox_plr_0_interaction_demp_niko_2_0", "vox_plr_1_interaction_demp_niko_2_1");
	var_1f05f8f0[2] = Array("vox_plr_1_interaction_demp_niko_3_0", "vox_plr_0_interaction_demp_niko_3_1");
	var_1f05f8f0[3] = Array("vox_plr_0_interaction_demp_niko_4_0", "vox_plr_1_interaction_demp_niko_4_1");
	var_1f05f8f0[4] = Array("vox_plr_0_interaction_demp_niko_5_0", "vox_plr_1_interaction_demp_niko_5_1");
	var_3993ba28 = [];
	var_3993ba28[0] = Array(0, 0.5);
	var_3993ba28[1] = Array(0, 0.5);
	var_3993ba28[2] = Array(0, 0.5);
	var_3993ba28[3] = Array(0, 0.5);
	var_3993ba28[4] = Array(0, 0.5);
	var_ea6d33c8 = 0;
	var_26887a74 = [];
	var_26887a74[0] = Array("vox_plr_0_interaction_demp_takeo_1_0", "vox_plr_3_interaction_demp_takeo_1_1");
	var_26887a74[1] = Array("vox_plr_0_interaction_demp_takeo_2_0", "vox_plr_3_interaction_demp_takeo_2_1");
	var_26887a74[2] = Array("vox_plr_3_interaction_demp_takeo_3_0", "vox_plr_0_interaction_demp_takeo_3_1");
	var_26887a74[3] = Array("vox_plr_3_interaction_demp_takeo_4_0", "vox_plr_0_interaction_demp_takeo_4_1");
	var_26887a74[4] = Array("vox_plr_0_interaction_demp_takeo_5_0", "vox_plr_3_interaction_demp_takeo_5_1");
	var_52697a10 = [];
	var_52697a10[0] = Array(0, 0.5);
	var_52697a10[1] = Array(0, 0.5);
	var_52697a10[2] = Array(0, 0.5);
	var_52697a10[3] = Array(0, 0.5);
	var_52697a10[4] = Array(0, 0.5);
	var_b4e2f9d0 = 0;
	var_aeae7aa1 = [];
	var_aeae7aa1[0] = Array("vox_plr_1_interaction_niko_takeo_1_0", "vox_plr_3_interaction_niko_takeo_1_1");
	var_aeae7aa1[1] = Array("vox_plr_1_interaction_niko_takeo_2_0", "vox_plr_3_interaction_niko_takeo_2_1");
	var_aeae7aa1[2] = Array("vox_plr_3_interaction_niko_takeo_3_0", "vox_plr_1_interaction_niko_takeo_3_1");
	var_aeae7aa1[3] = Array("vox_plr_3_interaction_niko_takeo_4_0", "vox_plr_1_interaction_niko_takeo_4_1");
	var_aeae7aa1[4] = Array("vox_plr_1_interaction_niko_takeo_5_0", "vox_plr_3_interaction_niko_takeo_5_1");
	var_d3757c7 = [];
	var_d3757c7[0] = Array(0, 0.5);
	var_d3757c7[1] = Array(0, 0.5);
	var_d3757c7[2] = Array(0, 0.5);
	var_d3757c7[3] = Array(0, 0.5);
	var_d3757c7[4] = Array(0, 0.5);
	var_e60d01d = 0;
	level.var_1d8d988e = 0;
	level waittill("all_players_spawned");
	level waittill("start_of_round");
	function_6b96bf38();
	while(1)
	{
		level waittill("end_of_round");
		if(level.round_number == 2)
		{
			function_ef84a69b();
		}
		else if(level.round_number == 3)
		{
			function_7d7d3760();
		}
		else if(level.var_1d8d988e < 3)
		{
			function_c5237c88();
		}
		else if(level.activePlayers.size > 1)
		{
			n_counter = 0;
			var_261100d2 = undefined;
			n_player_index = RandomInt(level.activePlayers.size);
			var_e8669 = level.activePlayers[n_player_index];
			while(!zm_utility::is_player_valid(var_e8669) && n_counter < level.activePlayers.size)
			{
				if(n_player_index + 1 < level.activePlayers.size)
				{
				}
				else
				{
				}
				n_player_index = 0;
				var_e8669 = level.activePlayers[n_player_index];
				n_counter++;
			}
			if(zm_utility::is_player_valid(var_e8669))
			{
				var_a68de872 = Array::remove_index(level.activePlayers, n_player_index);
				var_a68de872 = Array::get_all_closest(var_e8669.origin, var_a68de872, undefined, 4, 900);
				foreach(e_player in var_a68de872)
				{
					if(zm_utility::is_player_valid(e_player))
					{
						var_261100d2 = e_player;
						break;
					}
				}
			}
			else if(zm_utility::is_player_valid(var_e8669) && zm_utility::is_player_valid(var_261100d2))
			{
				var_3b5e4c24 = undefined;
				var_123bfae = Array(0, 0);
				if(var_e8669.characterindex == 0 && var_261100d2.characterindex == 2 || (var_261100d2.characterindex == 0 && var_e8669.characterindex == 2))
				{
					if(var_98d3df13 < var_38607083.size)
					{
						function_c23e3a71(var_38607083, var_98d3df13, var_7ff3a3c1, 1);
						var_98d3df13++;
					}
				}
				else if(var_e8669.characterindex == 2 && var_261100d2.characterindex == 1 || (var_261100d2.characterindex == 2 && var_e8669.characterindex == 1))
				{
					if(var_f5c2b1e8 < var_69c11398.size)
					{
						function_c23e3a71(var_69c11398, var_f5c2b1e8, var_3b4286c8, 1);
						var_f5c2b1e8++;
					}
				}
				else if(var_e8669.characterindex == 2 && var_261100d2.characterindex == 3 || (var_261100d2.characterindex == 2 && var_e8669.characterindex == 3))
				{
					if(var_9589fa70 < var_e2b4828c.size)
					{
						function_c23e3a71(var_e2b4828c, var_9589fa70, var_4cce0630, 1);
						var_9589fa70++;
					}
				}
				else if(var_e8669.characterindex == 1 && var_261100d2.characterindex == 0 || (var_261100d2.characterindex == 1 && var_e8669.characterindex == 0))
				{
					if(var_ea6d33c8 < var_1f05f8f0.size)
					{
						function_c23e3a71(var_1f05f8f0, var_ea6d33c8, var_3993ba28, 1);
						var_ea6d33c8++;
					}
				}
				else if(var_e8669.characterindex == 0 && var_261100d2.characterindex == 3 || (var_261100d2.characterindex == 0 && var_e8669.characterindex == 3))
				{
					if(var_b4e2f9d0 < var_26887a74.size)
					{
						function_c23e3a71(var_26887a74, var_b4e2f9d0, var_52697a10, 1);
						var_b4e2f9d0++;
					}
				}
				else if(var_e8669.characterindex == 1 && var_261100d2.characterindex == 3 || (var_261100d2.characterindex == 1 && var_e8669.characterindex == 3))
				{
					if(var_e60d01d < var_aeae7aa1.size)
					{
						function_c23e3a71(var_aeae7aa1, var_e60d01d, var_d3757c7, 1);
						var_e60d01d++;
					}
				}
			}
		}
	}
}

/*
	Name: function_218256bd
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x4B60
	Size: 0x170
	Parameters: 1
	Flags: None
	Line Number: 831
*/
function function_218256bd(var_eca8128e)
{
	foreach(player in level.activePlayers)
	{
		if(isdefined(player))
		{
			player.dontspeak = var_eca8128e;
			player clientfield::set_to_player("isspeaking", var_eca8128e);
		}
	}
	if(var_eca8128e)
	{
		foreach(player in level.activePlayers)
		{
			while(isdefined(player) && (isdefined(player.isSpeaking) && player.isSpeaking))
			{
				wait(0.1);
			}
		}
	}
}

/*
	Name: function_cf8fccfe
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x4CD8
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 863
*/
function function_cf8fccfe(var_eca8128e)
{
	self.dontspeak = var_eca8128e;
	self clientfield::set_to_player("isspeaking", var_eca8128e);
	if(var_eca8128e)
	{
		while(isdefined(self) && (isdefined(self.isSpeaking) && self.isSpeaking))
		{
			wait(0.1);
		}
	}
}

/*
	Name: function_ff6cc972
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x4D50
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 886
*/
function function_ff6cc972()
{
	for(e_responder = Array::random(level.activePlayers); level.activePlayers.size > 1 && e_responder.characterindex == 2; e_responder = Array::random(level.activePlayers))
	{
	}
	if(e_responder.characterindex == 2)
	{
		return undefined;
	}
	return e_responder;
}

/*
	Name: function_8b0b26a6
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x4DF0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 908
*/
function function_8b0b26a6()
{
	var_de84bd3f = [];
	e_responder = function_ff6cc972();
	if(isdefined(e_responder))
	{
		if(e_responder.characterindex == 1)
		{
			n_index = 2;
		}
		else
		{
			n_index = e_responder.characterindex;
		}
		var_49617378 = "vox_plr_" + e_responder.characterindex + "_time_1_" + n_index;
		if(!isdefined(var_de84bd3f))
		{
			var_de84bd3f = [];
		}
		else if(!IsArray(var_de84bd3f))
		{
			var_de84bd3f = Array(var_de84bd3f);
		}
		var_de84bd3f[var_de84bd3f.size] = var_49617378;
	}
	wait(1.5);
	if(var_de84bd3f.size > 0)
	{
		function_7aa5324a(var_de84bd3f, undefined, 1);
	}
	wait(2);
	level notify("hash_25d17403");
}

/*
	Name: function_55278301
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x4F40
	Size: 0x30
	Parameters: 0
	Flags: Private
	Line Number: 952
*/
function private function_55278301()
{
	level waittill("hash_25d17403");
	function_897246e4("vox_grop_groph_additional4_0", undefined, 1);
	return;
	ERROR: Bad function call
}

/*
	Name: function_6184b9c1
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x4F78
	Size: 0x460
	Parameters: 0
	Flags: None
	Line Number: 970
*/
function function_6184b9c1()
{
	var_8befc9c3 = [];
	var_83d10b6f = function_ff6cc972();
	if(isdefined(var_83d10b6f))
	{
		if(!isdefined(var_8befc9c3))
		{
			var_8befc9c3 = [];
		}
		else if(!IsArray(var_8befc9c3))
		{
			var_8befc9c3 = Array(var_8befc9c3);
		}
		var_8befc9c3[var_8befc9c3.size] = "vox_plr_" + var_83d10b6f.characterindex + "_time_1_response_4_0";
		if(level.has_richtofen)
		{
			if(!isdefined(var_8befc9c3))
			{
				var_8befc9c3 = [];
			}
			else if(!IsArray(var_8befc9c3))
			{
				var_8befc9c3 = Array(var_8befc9c3);
			}
			var_8befc9c3[var_8befc9c3.size] = "vox_plr_2_time_1_response_5_0";
			if(!isdefined(var_8befc9c3))
			{
				var_8befc9c3 = [];
			}
			else if(!IsArray(var_8befc9c3))
			{
				var_8befc9c3 = Array(var_8befc9c3);
			}
			var_8befc9c3[var_8befc9c3.size] = "vox_plr_" + var_83d10b6f.characterindex + "_time_1_response_6_0";
			if(!isdefined(var_8befc9c3))
			{
				var_8befc9c3 = [];
			}
			else if(!IsArray(var_8befc9c3))
			{
				var_8befc9c3 = Array(var_8befc9c3);
			}
			var_8befc9c3[var_8befc9c3.size] = "vox_plr_2_time_1_response_7_0";
		}
		else if(!isdefined(var_8befc9c3))
		{
			var_8befc9c3 = [];
		}
		else if(!IsArray(var_8befc9c3))
		{
			var_8befc9c3 = Array(var_8befc9c3);
		}
		var_8befc9c3[var_8befc9c3.size] = "vox_plr_2_time_1_response_5_pa_0";
		if(!isdefined(var_8befc9c3))
		{
			var_8befc9c3 = [];
		}
		else if(!IsArray(var_8befc9c3))
		{
			var_8befc9c3 = Array(var_8befc9c3);
		}
		var_8befc9c3[var_8befc9c3.size] = "vox_plr_" + var_83d10b6f.characterindex + "_time_1_response_6_0";
		if(!isdefined(var_8befc9c3))
		{
			var_8befc9c3 = [];
		}
		else if(!IsArray(var_8befc9c3))
		{
			var_8befc9c3 = Array(var_8befc9c3);
		}
		var_8befc9c3[var_8befc9c3.size] = "vox_plr_2_time_1_response_7_pa_0";
	}
	else if(!isdefined(var_8befc9c3))
	{
		var_8befc9c3 = [];
	}
	else if(!IsArray(var_8befc9c3))
	{
		var_8befc9c3 = Array(var_8befc9c3);
	}
	var_8befc9c3[var_8befc9c3.size] = "vox_plr_2_time_1_response_5_0";
	if(!isdefined(var_8befc9c3))
	{
		var_8befc9c3 = [];
	}
	else if(!IsArray(var_8befc9c3))
	{
		var_8befc9c3 = Array(var_8befc9c3);
	}
	var_8befc9c3[var_8befc9c3.size] = "vox_plr_2_time_1_response_7_0";
	if(!isdefined(var_8befc9c3))
	{
		var_8befc9c3 = [];
	}
	else if(!IsArray(var_8befc9c3))
	{
		var_8befc9c3 = Array(var_8befc9c3);
	}
	var_8befc9c3[var_8befc9c3.size] = "vox_grop_groph_additional3_0";
	if(var_8befc9c3.size > 0)
	{
		function_7aa5324a(var_8befc9c3, undefined, 1);
	}
}

/*
	Name: function_7520820b
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x53E0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1086
*/
function function_7520820b()
{
	level flag::wait_till_clear("time_travel_teleporter_ready");
	level flag::wait_till("spawn_zombies");
	wait(5);
	function_897246e4("vox_grop_groph_additional4_0", undefined, 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_44c11f63
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x5458
	Size: 0x2D0
	Parameters: 0
	Flags: None
	Line Number: 1106
*/
function function_44c11f63()
{
	level.sndVoxOverride = 1;
	var_2e6638a7 = [];
	var_e9d68101 = struct::get("death_ray_button", "targetname");
	var_d808cbab = spawn("script_model", var_e9d68101.origin);
	var_d808cbab playsoundwithnotify("vox_grop_cyro_1_0", "sounddone");
	var_53a95046 = soundgetplaybacktime("vox_grop_cyro_1_0");
	thread namespace_cc012897::Send("vox_grop_cyro_1_0", "all", var_53a95046);
	var_d808cbab waittill("sounddone");
	wait(0.75);
	level.sndVoxOverride = 0;
	e_responder = function_ff6cc972();
	if(isdefined(e_responder))
	{
		var_49617378 = "vox_plr_" + e_responder.characterindex + "_cyro_1_response_0_0";
		if(!isdefined(var_2e6638a7))
		{
			var_2e6638a7 = [];
		}
		else if(!IsArray(var_2e6638a7))
		{
			var_2e6638a7 = Array(var_2e6638a7);
		}
		var_2e6638a7[var_2e6638a7.size] = var_49617378;
	}
	if(level.has_richtofen)
	{
		if(!isdefined(var_2e6638a7))
		{
			var_2e6638a7 = [];
		}
		else if(!IsArray(var_2e6638a7))
		{
			var_2e6638a7 = Array(var_2e6638a7);
		}
		var_2e6638a7[var_2e6638a7.size] = "vox_plr_2_cyro_1_response_1_0";
	}
	else if(!isdefined(var_2e6638a7))
	{
		var_2e6638a7 = [];
	}
	else if(!IsArray(var_2e6638a7))
	{
		var_2e6638a7 = Array(var_2e6638a7);
	}
	var_2e6638a7[var_2e6638a7.size] = "vox_plr_2_cyro_1_response_1_pa_0";
	if(var_2e6638a7.size > 0)
	{
		function_7aa5324a(var_2e6638a7, undefined, 1);
	}
	var_d808cbab delete();
}

/*
	Name: function_70721c81
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x5730
	Size: 0x288
	Parameters: 0
	Flags: None
	Line Number: 1170
*/
function function_70721c81()
{
	s_speaker = struct::get("mpd_pos", "targetname");
	e_speaker = spawn("script_model", s_speaker.origin);
	function_8ac5430(1, s_speaker.origin);
	e_speaker playsound("vox_groph_keeper_intro_sfx");
	var_53a95046 = soundgetplaybacktime("vox_groph_keeper_intro_sfx");
	thread namespace_cc012897::Send("vox_groph_keeper_intro_sfx", "all", var_53a95046);
	e_speaker playsoundwithnotify("vox_grop_keeper_intro_0", "sounddone");
	var_53a95046 = soundgetplaybacktime("vox_grop_keeper_intro_0");
	thread namespace_cc012897::Send("vox_grop_keeper_intro_0", "all", var_53a95046);
	e_speaker waittill("sounddone");
	wait(0.5);
	e_speaker playsoundwithnotify("vox_grop_keeper_intro_1", "sounddone");
	var_53a95046 = soundgetplaybacktime("vox_grop_keeper_intro_1");
	thread namespace_cc012897::Send("vox_grop_keeper_intro_1", "all", var_53a95046);
	e_speaker waittill("sounddone");
	wait(1);
	e_speaker playsoundwithnotify("vox_grop_keeper_intro_2", "sounddone");
	var_53a95046 = soundgetplaybacktime("vox_grop_keeper_intro_2");
	thread namespace_cc012897::Send("vox_grop_keeper_intro_2", "all", var_53a95046);
	e_speaker waittill("sounddone");
	e_speaker delete();
	function_8ac5430();
}

/*
	Name: function_698d2c6b
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x59C0
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 1206
*/
function function_698d2c6b()
{
	var_707e85a7 = [];
	e_responder = function_ff6cc972();
	if(isdefined(e_responder))
	{
		var_49617378 = "vox_plr_" + e_responder.characterindex + "_keeper_1_0";
		if(!isdefined(var_707e85a7))
		{
			var_707e85a7 = [];
		}
		else if(!IsArray(var_707e85a7))
		{
			var_707e85a7 = Array(var_707e85a7);
		}
		var_707e85a7[var_707e85a7.size] = var_49617378;
	}
	if(level.has_richtofen)
	{
		if(!isdefined(var_707e85a7))
		{
			var_707e85a7 = [];
		}
		else if(!IsArray(var_707e85a7))
		{
			var_707e85a7 = Array(var_707e85a7);
		}
		var_707e85a7[var_707e85a7.size] = "vox_plr_2_keeper_1_response_0_0";
	}
	else if(!isdefined(var_707e85a7))
	{
		var_707e85a7 = [];
	}
	else if(!IsArray(var_707e85a7))
	{
		var_707e85a7 = Array(var_707e85a7);
	}
	var_707e85a7[var_707e85a7.size] = "vox_plr_2_keeper_1_response_0_pa_0";
	if(!level flag::get("boss_fight_begin"))
	{
		if(!isdefined(var_707e85a7))
		{
			var_707e85a7 = [];
		}
		else if(!IsArray(var_707e85a7))
		{
			var_707e85a7 = Array(var_707e85a7);
		}
		var_707e85a7[var_707e85a7.size] = "vox_grop_groph_additional5_0";
	}
	if(var_707e85a7.size > 0)
	{
		function_7aa5324a(var_707e85a7, undefined, 1);
	}
}

/*
	Name: function_cbf21c9d
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x5C00
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 1272
*/
function function_cbf21c9d()
{
	var_7060fdf2 = [];
	e_responder = function_ff6cc972();
	if(isdefined(e_responder))
	{
		var_49617378 = "vox_plr_" + e_responder.characterindex + "_keeper_2_0";
		if(!isdefined(var_7060fdf2))
		{
			var_7060fdf2 = [];
		}
		else if(!IsArray(var_7060fdf2))
		{
			var_7060fdf2 = Array(var_7060fdf2);
		}
		var_7060fdf2[var_7060fdf2.size] = var_49617378;
	}
	if(level.has_richtofen)
	{
		if(!isdefined(var_7060fdf2))
		{
			var_7060fdf2 = [];
		}
		else if(!IsArray(var_7060fdf2))
		{
			var_7060fdf2 = Array(var_7060fdf2);
		}
		var_7060fdf2[var_7060fdf2.size] = "vox_plr_2_keeper_2_response_0_0";
	}
	else if(!isdefined(var_7060fdf2))
	{
		var_7060fdf2 = [];
	}
	else if(!IsArray(var_7060fdf2))
	{
		var_7060fdf2 = Array(var_7060fdf2);
	}
	var_7060fdf2[var_7060fdf2.size] = "vox_plr_2_keeper_2_response_0_pa_0";
	if(var_7060fdf2.size > 0)
	{
		function_7aa5324a(var_7060fdf2, undefined, 1);
	}
}

/*
	Name: function_6b44bc05
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x5DC0
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 1326
*/
function function_6b44bc05()
{
	var_3da2c171 = [];
	e_responder = function_ff6cc972();
	if(isdefined(e_responder))
	{
		var_49617378 = "vox_plr_" + e_responder.characterindex + "_keeper_3_0";
		if(!isdefined(var_3da2c171))
		{
			var_3da2c171 = [];
		}
		else if(!IsArray(var_3da2c171))
		{
			var_3da2c171 = Array(var_3da2c171);
		}
		var_3da2c171[var_3da2c171.size] = var_49617378;
	}
	if(level.has_richtofen)
	{
		if(!isdefined(var_3da2c171))
		{
			var_3da2c171 = [];
		}
		else if(!IsArray(var_3da2c171))
		{
			var_3da2c171 = Array(var_3da2c171);
		}
		var_3da2c171[var_3da2c171.size] = "vox_plr_2_keeper_3_response_0_0";
	}
	else if(!isdefined(var_3da2c171))
	{
		var_3da2c171 = [];
	}
	else if(!IsArray(var_3da2c171))
	{
		var_3da2c171 = Array(var_3da2c171);
	}
	var_3da2c171[var_3da2c171.size] = "vox_plr_2_keeper_3_response_0_pa_0";
	if(var_3da2c171.size > 0)
	{
		function_7aa5324a(var_3da2c171, undefined, 1);
	}
}

/*
	Name: function_64505195
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x5F80
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1380
*/
function function_64505195()
{
	function_897246e4("vox_grop_groph_additional6_0", undefined, 1);
}

/*
	Name: function_3ed74336
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x5FB0
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 1395
*/
function function_3ed74336()
{
	var_3da2c171 = [];
	e_responder = function_ff6cc972();
	if(isdefined(e_responder))
	{
		if(e_responder.characterindex == 0)
		{
			var_49617378 = "vox_plr_0_keeper_4_0";
		}
		else
		{
			var_49617378 = "vox_plr_" + e_responder.characterindex + "_keeper_4_response_0_0";
		}
		if(!isdefined(var_3da2c171))
		{
			var_3da2c171 = [];
		}
		else if(!IsArray(var_3da2c171))
		{
			var_3da2c171 = Array(var_3da2c171);
		}
		var_3da2c171[var_3da2c171.size] = var_49617378;
	}
	if(level.has_richtofen)
	{
		if(!isdefined(var_3da2c171))
		{
			var_3da2c171 = [];
		}
		else if(!IsArray(var_3da2c171))
		{
			var_3da2c171 = Array(var_3da2c171);
		}
		var_3da2c171[var_3da2c171.size] = "vox_plr_2_keeper_4_response_0_0";
	}
	else if(!isdefined(var_3da2c171))
	{
		var_3da2c171 = [];
	}
	else if(!IsArray(var_3da2c171))
	{
		var_3da2c171 = Array(var_3da2c171);
	}
	var_3da2c171[var_3da2c171.size] = "vox_plr_2_keeper_4_response_0_pa_0";
	if(var_3da2c171.size > 0)
	{
		function_7aa5324a(var_3da2c171, undefined, 1);
	}
}

/*
	Name: function_f28fd307
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x6190
	Size: 0x4F8
	Parameters: 0
	Flags: None
	Line Number: 1456
*/
function function_f28fd307()
{
	var_180864bb = [];
	s_terminal = struct::get("lower_tower", "script_noteworthy");
	var_ff1ab13b = spawn("script_model", s_terminal.origin);
	function_8ac5430(1, s_terminal.origin);
	var_ff1ab13b playsoundwithnotify("vox_grop_moon_intro_0", "sounddone");
	var_53a95046 = soundgetplaybacktime("vox_grop_moon_intro_0");
	thread namespace_cc012897::Send("vox_grop_moon_intro_0", "all", var_53a95046);
	var_ff1ab13b waittill("sounddone");
	wait(0.5);
	var_ff1ab13b playsoundwithnotify("vox_grop_moon_intro_1", "sounddone");
	var_53a95046 = soundgetplaybacktime("vox_grop_moon_intro_1");
	thread namespace_cc012897::Send("vox_grop_moon_intro_1", "all", var_53a95046);
	var_ff1ab13b waittill("sounddone");
	wait(1);
	var_ff1ab13b playsoundwithnotify("vox_grop_moon_intro_2", "sounddone");
	var_53a95046 = soundgetplaybacktime("vox_grop_moon_intro_2");
	thread namespace_cc012897::Send("vox_grop_moon_intro_2", "all", var_53a95046);
	var_ff1ab13b waittill("sounddone");
	wait(1);
	var_ff1ab13b playsoundwithnotify("vox_grop_moon_intro_3", "sounddone");
	var_53a95046 = soundgetplaybacktime("vox_grop_moon_intro_3");
	thread namespace_cc012897::Send("vox_grop_moon_intro_3", "all", var_53a95046);
	var_ff1ab13b waittill("sounddone");
	wait(1);
	var_ff1ab13b playsoundwithnotify("vox_grop_moon_intro_4", "sounddone");
	var_53a95046 = soundgetplaybacktime("vox_grop_moon_intro_4");
	thread namespace_cc012897::Send("vox_grop_moon_intro_4", "all", var_53a95046);
	var_ff1ab13b waittill("sounddone");
	wait(2);
	function_8ac5430();
	e_responder = function_ff6cc972();
	if(isdefined(e_responder))
	{
		var_49617378 = "vox_plr_" + e_responder.characterindex + "_moon_1_response_0_0";
		if(!isdefined(var_180864bb))
		{
			var_180864bb = [];
		}
		else if(!IsArray(var_180864bb))
		{
			var_180864bb = Array(var_180864bb);
		}
		var_180864bb[var_180864bb.size] = var_49617378;
	}
	if(level.has_richtofen)
	{
		if(!isdefined(var_180864bb))
		{
			var_180864bb = [];
		}
		else if(!IsArray(var_180864bb))
		{
			var_180864bb = Array(var_180864bb);
		}
		var_180864bb[var_180864bb.size] = "vox_plr_2_moon_1_response_1_0";
	}
	else if(!isdefined(var_180864bb))
	{
		var_180864bb = [];
	}
	else if(!IsArray(var_180864bb))
	{
		var_180864bb = Array(var_180864bb);
	}
	var_180864bb[var_180864bb.size] = "vox_plr_2_moon_1_response_1_pa_0";
	if(var_180864bb.size > 0)
	{
		function_7aa5324a(var_180864bb, undefined, 1);
	}
	wait(1.5);
	level flag::set("rockets_to_moon_vo_complete");
	var_ff1ab13b delete();
}

/*
	Name: function_8ac5430
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x6690
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 1542
*/
function function_8ac5430(var_b20e186c, v_position)
{
	if(!isdefined(var_b20e186c))
	{
		var_b20e186c = 0;
	}
	if(!isdefined(v_position))
	{
		v_position = (0, 0, 0);
	}
	if(var_b20e186c)
	{
		level.sndVoxOverride = 1;
		level flag::set("story_playing");
		function_2426269b(v_position, 9999);
	}
	else
	{
		level flag::clear("story_playing");
		level.sndVoxOverride = 0;
	}
}

/*
	Name: function_5eded46b
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x6748
	Size: 0x110
	Parameters: 4
	Flags: None
	Line Number: 1575
*/
function function_5eded46b(str_vo_line, n_wait, b_wait_if_busy, var_a8564a44)
{
	if(!isdefined(n_wait))
	{
		n_wait = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	function_218256bd(1);
	for(i = 1; i < level.activePlayers.size; i++)
	{
		level.activePlayers[i] thread function_7b697614(str_vo_line, n_wait + 0.1, b_wait_if_busy, var_a8564a44);
	}
	level.activePlayers[0] function_7b697614(str_vo_line, n_wait, b_wait_if_busy, var_a8564a44);
	function_218256bd(0);
}

/*
	Name: function_7b697614
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x6860
	Size: 0x3E8
	Parameters: 5
	Flags: None
	Line Number: 1604
*/
function function_7b697614(var_96896ff5, n_delay, b_wait_if_busy, var_a8564a44, var_d1295208)
{
	if(!isdefined(n_delay))
	{
		n_delay = 0;
	}
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	self endon("death");
	self endon("disconnect");
	self endon("death");
	if(level flag::get("story_playing"))
	{
		return 0;
	}
	if(zm_audio::areNearbySpeakersActive(10000) && (!(isdefined(var_d1295208) && var_d1295208)))
	{
		return 0;
	}
	if(isdefined(self.isSpeaking) && self.isSpeaking || (isdefined(level.sndVoxOverride) && level.sndVoxOverride))
	{
		if(isdefined(b_wait_if_busy) && b_wait_if_busy)
		{
			while(isdefined(self.isSpeaking) && self.isSpeaking || (isdefined(level.sndVoxOverride) && level.sndVoxOverride))
			{
				wait(0.1);
			}
			wait(0.35);
		}
		else
		{
			return 0;
		}
	}
	if(n_delay > 0)
	{
		wait(n_delay);
	}
	if(isdefined(self.isSpeaking) && self.isSpeaking && (isdefined(self.b_wait_if_busy) && self.b_wait_if_busy))
	{
		while(isdefined(self.isSpeaking) && self.isSpeaking)
		{
			wait(0.1);
		}
	}
	else if(isdefined(self.isSpeaking) && self.isSpeaking && (!(isdefined(self.b_wait_if_busy) && self.b_wait_if_busy)) || (isdefined(level.sndVoxOverride) && level.sndVoxOverride))
	{
		return 0;
	}
	self notify(var_96896ff5 + "_vo_started");
	self.isSpeaking = 1;
	level.sndVoxOverride = 1;
	self thread function_b3baa665();
	self.n_vo_priority = var_a8564a44;
	self.str_vo_being_spoken = var_96896ff5;
	Array::add(level.a_e_speakers, self, 1);
	var_2df3d133 = var_96896ff5 + "_vo_done";
	if(IsActor(self) || isPlayer(self))
	{
		self playsoundwithnotify(var_96896ff5, var_2df3d133, "J_head");
		var_53a95046 = soundgetplaybacktime(var_96896ff5);
		thread namespace_cc012897::Send(var_96896ff5, "all", var_53a95046);
	}
	else
	{
		self playsoundwithnotify(var_96896ff5, var_2df3d133);
		var_53a95046 = soundgetplaybacktime(var_96896ff5);
		thread namespace_cc012897::Send(var_96896ff5, "all", var_53a95046);
	}
	self waittill(var_2df3d133);
	self function_8995134a();
	return 1;
}

/*
	Name: function_b3baa665
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x6C50
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 1698
*/
function function_b3baa665()
{
	self endon("hash_2f69a80e");
	self util::waittill_any("death", "disconnect");
	level.sndVoxOverride = 0;
}

/*
	Name: function_8995134a
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x6C98
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 1715
*/
function function_8995134a()
{
	self notify("hash_2f69a80e");
	self.str_vo_being_spoken = "";
	self.n_vo_priority = 0;
	self.isSpeaking = 0;
	level.sndVoxOverride = 0;
	b_in_a_e_speakers = 0;
	foreach(e_checkme in level.a_e_speakers)
	{
		if(e_checkme == self)
		{
			b_in_a_e_speakers = 1;
			break;
		}
	}
	if(isdefined(b_in_a_e_speakers) && b_in_a_e_speakers)
	{
		ArrayRemoveValue(level.a_e_speakers, self);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_502f946b
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x6DB0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 1749
*/
function function_502f946b()
{
	self endon("death");
	if(isdefined(self.str_vo_being_spoken) && self.str_vo_being_spoken != "")
	{
		self stopsound(self.str_vo_being_spoken);
	}
	function_8995134a();
}

/*
	Name: function_2426269b
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x6E18
	Size: 0x238
	Parameters: 2
	Flags: None
	Line Number: 1769
*/
function function_2426269b(v_pos, n_range)
{
	if(!isdefined(n_range))
	{
		n_range = 1000;
	}
	if(isdefined(level.a_e_speakers))
	{
		foreach(var_d211180f in level.a_e_speakers)
		{
			if(!isdefined(var_d211180f))
			{
				continue;
			}
			if(!isdefined(v_pos) || DistanceSquared(var_d211180f.origin, v_pos) <= n_range * n_range)
			{
				if(isdefined(var_d211180f.str_vo_being_spoken) && var_d211180f.str_vo_being_spoken != "")
				{
					var_d211180f stopsound(var_d211180f.str_vo_being_spoken);
				}
				var_d211180f.deleteme = 1;
				var_d211180f.str_vo_being_spoken = "";
				var_d211180f.n_vo_priority = 0;
				var_d211180f.isSpeaking = 0;
			}
		}
		i = 0;
		while(isdefined(level.a_e_speakers) && i < level.a_e_speakers.size)
		{
			if(isdefined(level.a_e_speakers[i].deleteme) && level.a_e_speakers[i].deleteme == 1)
			{
				ArrayRemoveValue(level.a_e_speakers, level.a_e_speakers[i]);
				i = 0;
			}
			else
			{
				i++;
			}
		}
	}
}

/*
	Name: function_897246e4
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x7058
	Size: 0x220
	Parameters: 5
	Flags: None
	Line Number: 1821
*/
function function_897246e4(var_96896ff5, n_wait, b_wait_if_busy, var_a8564a44, var_d1295208)
{
	if(!isdefined(n_wait))
	{
		n_wait = 0;
	}
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	var_942373f4 = 0;
	var_9689ca97 = 0;
	var_81132431 = StrTok(var_96896ff5, "_");
	if(var_81132431[1] === "grop")
	{
		var_942373f4 = 1;
	}
	else if(var_81132431[7] === "pa")
	{
		var_9689ca97 = 1;
	}
	else if(var_81132431[1] === "plr")
	{
		var_edf0b06 = Int(var_81132431[2]);
		e_speaker = zm_utility::get_specific_character(var_edf0b06);
	}
	else
	{
		e_speaker = undefined;
		/#
			/#
				Assert(0, "Dev Block strings are not supported" + var_96896ff5 + "Dev Block strings are not supported");
			#/
		#/
	}
	if(!var_942373f4 && !var_9689ca97)
	{
		if(zm_utility::is_player_valid(e_speaker))
		{
			e_speaker function_7b697614(var_96896ff5, n_wait, b_wait_if_busy, var_a8564a44);
		}
	}
	else
	{
		function_5eded46b(var_96896ff5, n_wait, b_wait_if_busy, var_a8564a44);
	}
}

/*
	Name: function_63c44c5a
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x7280
	Size: 0x120
	Parameters: 5
	Flags: None
	Line Number: 1887
*/
function function_63c44c5a(a_str_vo, var_e21e86b8, b_wait_if_busy, var_a8564a44, var_d1295208)
{
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	function_218256bd(1);
	for(i = 0; i < a_str_vo.size; i++)
	{
		if(isdefined(var_e21e86b8))
		{
			var_e27770b1 = var_e21e86b8[i];
		}
		else
		{
			var_e27770b1 = 0;
		}
		self function_7b697614(a_str_vo[i], var_e27770b1, b_wait_if_busy, var_a8564a44, var_d1295208);
	}
	function_218256bd(0);
}

/*
	Name: function_7aa5324a
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x73A8
	Size: 0x120
	Parameters: 5
	Flags: None
	Line Number: 1927
*/
function function_7aa5324a(a_str_vo, var_e21e86b8, b_wait_if_busy, var_a8564a44, var_d1295208)
{
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	function_218256bd(1);
	for(i = 0; i < a_str_vo.size; i++)
	{
		if(isdefined(var_e21e86b8))
		{
			var_e27770b1 = var_e21e86b8[i];
		}
		else
		{
			var_e27770b1 = 0.5;
		}
		function_897246e4(a_str_vo[i], var_e27770b1, b_wait_if_busy, var_a8564a44, var_d1295208);
	}
	function_218256bd(0);
}

/*
	Name: function_c23e3a71
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x74D0
	Size: 0x160
	Parameters: 6
	Flags: None
	Line Number: 1967
*/
function function_c23e3a71(var_49fefccd, n_index, var_f781d8ce, b_wait_if_busy, var_7e649f23, var_d1295208)
{
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_7e649f23))
	{
		var_7e649f23 = 0;
	}
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	/#
		/#
			Assert(isdefined(var_49fefccd), "Dev Block strings are not supported");
		#/
	#/
	/#
		/#
			Assert(n_index < var_49fefccd.size, "Dev Block strings are not supported");
		#/
	#/
	var_3b5e4c24 = var_49fefccd[n_index];
	var_123bfae = undefined;
	if(isdefined(var_f781d8ce))
	{
		/#
			/#
				Assert(n_index < var_f781d8ce.size, "Dev Block strings are not supported");
			#/
		#/
		var_123bfae = var_f781d8ce[n_index];
	}
	function_7aa5324a(var_3b5e4c24, var_123bfae, b_wait_if_busy, var_7e649f23, var_d1295208);
}

/*
	Name: function_642e6aef
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x7638
	Size: 0x3B8
	Parameters: 7
	Flags: None
	Line Number: 2015
*/
function function_642e6aef(impact, mod, weapon, zombie, instakill, dist, player)
{
	close_dist = 4096;
	med_dist = 15376;
	far_dist = 160000;
	if(zombie.damageWeapon.name == "sticky_grenade_widows_wine")
	{
		return "default";
	}
	if(function_b303f27c(weapon))
	{
		return undefined;
	}
	if(zm_utility::is_placeable_mine(weapon))
	{
		if(!instakill)
		{
			return "betty";
		}
		return "weapon_instakill";
	}
	if(zombie.damageWeapon.name == "cymbal_monkey")
	{
		if(instakill)
		{
			return "weapon_instakill";
		}
		return "monkey";
	}
	if(weapon.name == "ray_gun" || (weapon.name == "ray_gun_upgraded" && dist > far_dist))
	{
		if(!instakill)
		{
			return "raygun";
		}
		return "weapon_instakill";
	}
	if(zm_utility::is_headshot(weapon, impact, mod) && dist >= far_dist)
	{
		return "headshot";
	}
	if(mod == "MOD_MELEE" || (mod == "MOD_UNKNOWN" && dist < close_dist))
	{
		if(!instakill)
		{
			return "melee";
		}
		return "melee_instakill";
	}
	if(zm_utility::is_explosive_damage(mod) && weapon.name != "ray_gun" && weapon.name != "ray_gun_upgraded" && (!(isdefined(zombie.is_on_fire) && zombie.is_on_fire)))
	{
		if(!instakill)
		{
			return "explosive";
		}
		return "weapon_instakill";
	}
	if(weapon.doesFireDamage && (mod == "MOD_BURNED" || mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH"))
	{
		if(!instakill)
		{
			return "flame";
		}
		return "weapon_instakill";
	}
	if(!isdefined(impact))
	{
		impact = "";
	}
	if(mod != "MOD_MELEE" && zombie.missingLegs)
	{
		return "crawler";
	}
	if(mod != "MOD_BURNED" && dist < close_dist)
	{
		return "close";
	}
	if(mod == "MOD_RIFLE_BULLET" || mod == "MOD_PISTOL_BULLET")
	{
		if(!instakill)
		{
			return "bullet";
		}
		return "weapon_instakill";
	}
	if(instakill)
	{
		return "default";
	}
	return "default";
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b303f27c
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x79F8
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 2118
*/
function function_b303f27c(weapon)
{
	if(weapon.name == "elemental_bow" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_wolf_howl")
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_6b96bf38
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x7AA0
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2137
*/
function function_6b96bf38()
{
	function_218256bd(1);
	if(level.activePlayers.size == 1)
	{
		var_b48c1dda = "vox_plr_" + level.activePlayers[0].characterindex + "_round1_start_solo_0";
		level.activePlayers[0] function_7b697614(var_b48c1dda, 0, 1);
	}
	else
	{
		function_a272201f(0);
	}
	function_218256bd(0);
}

/*
	Name: function_ef84a69b
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x7B68
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2162
*/
function function_ef84a69b()
{
	function_218256bd(1);
	if(level.activePlayers.size == 1)
	{
		var_b48c1dda = "vox_plr_" + level.activePlayers[0].characterindex + "_round1_end_solo_0";
		level.activePlayers[0] function_7b697614(var_b48c1dda, 0, 1);
	}
	else
	{
		function_a272201f(1);
	}
	function_218256bd(0);
}

/*
	Name: function_7d7d3760
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x7C30
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2187
*/
function function_7d7d3760()
{
	function_218256bd(1);
	if(level.activePlayers.size == 1)
	{
		var_b48c1dda = "vox_plr_" + level.activePlayers[0].characterindex + "_round2_end_solo_0";
		level.activePlayers[0] function_7b697614(var_b48c1dda, 0, 1);
	}
	else
	{
		function_a272201f(2);
	}
	function_218256bd(0);
}

/*
	Name: function_a272201f
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x7CF8
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 2212
*/
function function_a272201f(var_3ef9e565)
{
	var_31408c0d = undefined;
	foreach(e_player in level.players)
	{
		if(e_player.characterindex == 2)
		{
			var_31408c0d = e_player;
			break;
		}
	}
	if(zm_utility::is_player_valid(var_31408c0d))
	{
		var_3cf0d54b = Array::get_all_closest(var_31408c0d.origin, level.activePlayers, Array(var_31408c0d), 4, 900);
		var_e4d5c0ab = undefined;
		foreach(e_player in var_3cf0d54b)
		{
			if(zm_utility::is_player_valid(e_player))
			{
				var_e4d5c0ab = e_player;
				break;
			}
		}
		if(zm_utility::is_player_valid(var_e4d5c0ab))
		{
			function_c23e3a71(level.var_4ea3bfd0[var_e4d5c0ab.characterindex], var_3ef9e565, level.var_f8331b71, 1);
		}
	}
}

/*
	Name: function_c5237c88
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x7F00
	Size: 0x360
	Parameters: 0
	Flags: None
	Line Number: 2252
*/
function function_c5237c88()
{
	var_245be316 = level.var_1d8d988e;
	var_31408c0d = undefined;
	if(level.round_number == level.next_dog_round)
	{
		return;
	}
	wait(3);
	function_5eded46b(level.var_524d2080[var_245be316][0]);
	if(level.has_richtofen)
	{
		foreach(e_player in level.activePlayers)
		{
			if(e_player.characterindex == 2)
			{
				var_31408c0d = e_player;
				break;
			}
		}
	}
	else if(zm_utility::is_player_valid(var_31408c0d))
	{
		function_c23e3a71(level.var_524d2080[var_245be316][1], 0, level.var_956d74f[var_245be316], 1);
	}
	else
	{
		function_c23e3a71(level.var_524d2080[var_245be316][2], 0, level.var_956d74f[var_245be316], 1);
	}
	if(isdefined(level.var_524d2080[var_245be316][3]))
	{
		var_238a1aba = undefined;
		if(isdefined(var_31408c0d))
		{
			var_ba724c3e = Array::exclude(level.activePlayers, var_31408c0d);
			var_a68de872 = Array::get_all_closest(var_31408c0d.origin, var_ba724c3e, undefined, 4, 900);
			foreach(e_player in var_a68de872)
			{
				if(zm_utility::is_player_valid(e_player))
				{
					var_238a1aba = e_player;
					break;
				}
			}
		}
		else
		{
			var_238a1aba = function_ff6cc972();
		}
		if(zm_utility::is_player_valid(var_238a1aba))
		{
			str_vo_line = level.var_524d2080[var_245be316][3][0] + var_238a1aba.characterindex + level.var_524d2080[var_245be316][3][1];
			var_238a1aba function_7b697614(str_vo_line, 1, 1);
		}
	}
	level.var_1d8d988e++;
}

/*
	Name: function_5803cf05
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x8268
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 2320
*/
function function_5803cf05(n_max, var_6e653641)
{
	/#
		/#
			Assert(!isdefined(var_6e653641) || var_6e653641 < n_max, "Dev Block strings are not supported");
		#/
	#/
	do
	{
		var_ee3cd374 = RandomInt(n_max);
	}
	while(!var_ee3cd374 === var_6e653641);
	return var_ee3cd374;
}

/*
	Name: function_b6633a79
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x82F8
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 2345
*/
function function_b6633a79()
{
	if(!isdefined(level.var_98e8620a) || !isdefined(level.var_98e8620a[self.characterindex]) || GetTime() - level.var_98e8620a[self.characterindex] > 45000)
	{
		var_70bd2a66 = RandomInt(5);
		if(isdefined(level.var_f9921c3e) && isdefined(level.var_f9921c3e[self.characterindex]))
		{
			while(var_70bd2a66 === level.var_f9921c3e[self.characterindex])
			{
				var_70bd2a66 = RandomInt(5);
			}
		}
		b_success = self function_7b697614("vox_plr_" + self.characterindex + "_need_fuse_" + var_70bd2a66, 4.6);
		if(isdefined(b_success) && b_success)
		{
			level.var_98e8620a[self.characterindex] = GetTime();
			level.var_f9921c3e[self.characterindex] = var_70bd2a66;
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_65c13c89
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x8458
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 2378
*/
function function_65c13c89()
{
	level.var_5307e651[0] = Array(2);
	level.var_5307e651[1] = Array(1);
	level.var_5307e651[2] = Array(0, 2);
	level.var_5307e651[3] = Array(1, 2);
	wait(1);
	Array::thread_all(level.bgb_machines, &function_1d8b909c);
}

/*
	Name: function_1d8b909c
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x8530
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 2398
*/
function function_1d8b909c()
{
	while(1)
	{
		self waittill("left");
		var_bbced690 = undefined;
		var_4b41add1 = Array::get_all_closest(self.origin, level.activePlayers, undefined, 4, 256);
		foreach(e_player in var_4b41add1)
		{
			if(zm_utility::is_player_valid(e_player) && e_player util::is_looking_at(self.origin, 0.9, 0, VectorScale((0, 0, 1), 50)))
			{
				var_bbced690 = e_player;
				break;
			}
		}
		if(isdefined(var_bbced690))
		{
			var_70bd2a66 = Array::random(level.var_5307e651[var_bbced690.characterindex]);
			b_success = var_bbced690 function_7b697614("vox_plr_" + var_bbced690.characterindex + "_gum_move_" + var_70bd2a66);
		}
	}
}

/*
	Name: function_a1e1ab31
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x86E8
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 2431
*/
function function_a1e1ab31()
{
	level waittill("start_zombie_round_logic");
	level.var_aea601e7[0] = 6;
	level.var_aea601e7[1] = 6;
	level.var_aea601e7[2] = 5;
	level.var_aea601e7[3] = 5;
	while(1)
	{
		level flag::wait_till("low_grav_on");
		zm_spawner::register_zombie_death_event_callback(&function_e58d3756);
		level flag::wait_till_clear("low_grav_on");
		zm_spawner::deregister_zombie_death_event_callback(&function_e58d3756);
	}
}

/*
	Name: function_e58d3756
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x87D8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 2457
*/
function function_e58d3756(e_attacker)
{
	e_attacker thread function_7254ce1d();
}

/*
	Name: function_7254ce1d
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x8808
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 2472
*/
function function_7254ce1d()
{
	self endon("death");
	self endon("bled_out");
	if(!zm_utility::is_player_valid(self))
	{
		return;
	}
	if(!(isdefined(self.var_7dd18a0) && self.var_7dd18a0))
	{
		return;
	}
	wait(1);
	if(!self IsOnGround() || self IsWallRunning())
	{
		if(!isdefined(level.var_7cad3440) || !isdefined(level.var_7cad3440[self.characterindex]) || GetTime() - level.var_7cad3440[self.characterindex] > 40000)
		{
			var_5959b8b8 = level.var_aea601e7[self.characterindex];
			var_70bd2a66 = RandomInt(var_5959b8b8);
			if(isdefined(level.var_3847cd08) && isdefined(level.var_3847cd08[self.characterindex]))
			{
				while(var_70bd2a66 === level.var_3847cd08[self.characterindex])
				{
					var_70bd2a66 = RandomInt(var_5959b8b8);
				}
			}
			b_success = self function_7b697614("vox_plr_" + self.characterindex + "_kill_low_grav_" + var_70bd2a66);
			if(isdefined(b_success) && b_success)
			{
				level.var_7cad3440[self.characterindex] = GetTime();
				level.var_3847cd08[self.characterindex] = var_70bd2a66;
			}
		}
	}
}

/*
	Name: function_7091d990
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x8A00
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 2518
*/
function function_7091d990()
{
	level.var_49365d20[0] = 7;
	level.var_49365d20[1] = 10;
	level.var_49365d20[2] = 8;
	level.var_49365d20[3] = 9;
	level.var_8ec9fe34[0] = Array(1, 2, 3, 4, 5, 6);
	level.var_8ec9fe34[1] = Array(2, 3, 4, 5, 6, 7, 9);
	level.var_8ec9fe34[2] = Array(0, 1, 2, 3, 4, 5, 6, 7);
	level.var_8ec9fe34[3] = Array(0, 1, 2, 3, 4, 5, 6, 7, 8);
	level thread function_24854f68();
	level thread function_5b684ae5();
}

/*
	Name: function_24854f68
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x8B78
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 2542
*/
function function_24854f68()
{
	while(1)
	{
		level waittill("hash_de71acc2", e_zombie, var_ecf98bb6);
		e_zombie function_52f36cdc("masher", var_ecf98bb6);
	}
}

/*
	Name: function_5b684ae5
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x8BD8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 2561
*/
function function_5b684ae5()
{
	while(1)
	{
		level waittill("trap_kill", e_zombie, var_f1c4d54d);
		if(isPlayer(var_f1c4d54d))
		{
		}
		else
		{
		}
		var_ecf98bb6 = var_f1c4d54d.activated_by_player;
		e_zombie function_52f36cdc("generic", var_ecf98bb6);
	}
}

/*
	Name: function_52f36cdc
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x8C70
	Size: 0x238
	Parameters: 2
	Flags: None
	Line Number: 2587
*/
function function_52f36cdc(str_type, var_ecf98bb6)
{
	var_ecf98bb6 endon("disconnect");
	var_ecf98bb6 endon("death");
	if(!isdefined(self))
	{
		return;
	}
	if(!zm_utility::is_player_valid(var_ecf98bb6))
	{
		return;
	}
	if(!isdefined(level.var_2038540a) || !isdefined(level.var_2038540a[var_ecf98bb6.characterindex]) || GetTime() - level.var_2038540a[var_ecf98bb6.characterindex] > 40000)
	{
		if(DistanceSquared(self.origin, var_ecf98bb6.origin) < 262144)
		{
			if(var_ecf98bb6 util::is_looking_at(self GetCentroid(), 0.85, 0))
			{
				var_70bd2a66 = function_73ee0fdd(str_type, var_ecf98bb6);
				if(isdefined(level.var_f590f5e2) && isdefined(level.var_f590f5e2[var_ecf98bb6.characterindex]))
				{
					while(var_70bd2a66 === level.var_f590f5e2[var_ecf98bb6.characterindex])
					{
						var_70bd2a66 = function_73ee0fdd(str_type, var_ecf98bb6);
					}
				}
				b_success = var_ecf98bb6 function_7b697614("vox_plr_" + var_ecf98bb6.characterindex + "_trap_kill_" + var_70bd2a66, 1);
				if(isdefined(b_success) && b_success)
				{
					level.var_2038540a[var_ecf98bb6.characterindex] = GetTime();
					level.var_f590f5e2[var_ecf98bb6.characterindex] = var_70bd2a66;
				}
			}
		}
	}
}

/*
	Name: function_73ee0fdd
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x8EB0
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 2634
*/
function function_73ee0fdd(str_type, var_ecf98bb6)
{
	switch(str_type)
	{
		case "masher":
		{
			return RandomInt(level.var_49365d20[var_ecf98bb6.characterindex]);
			break;
		}
		case "generic":
		{
			return Array::random(level.var_8ec9fe34[var_ecf98bb6.characterindex]);
			break;
		}
	}
	return;
}

/*
	Name: function_8d44c804
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x8F50
	Size: 0x3F8
	Parameters: 0
	Flags: None
	Line Number: 2662
*/
function function_8d44c804()
{
	level.var_e1855a03[0]["elemental_bow"] = 10;
	level.var_e1855a03[1]["elemental_bow"] = 9;
	level.var_e1855a03[2]["elemental_bow"] = 8;
	level.var_e1855a03[3]["elemental_bow"] = 9;
	level.var_e1855a03[0]["elemental_bow_demongate"] = 10;
	level.var_e1855a03[1]["elemental_bow_demongate"] = 9;
	level.var_e1855a03[2]["elemental_bow_demongate"] = 10;
	level.var_e1855a03[3]["elemental_bow_demongate"] = 10;
	level.var_e1855a03[0]["elemental_bow_demongate4"] = 10;
	level.var_e1855a03[1]["elemental_bow_demongate4"] = 9;
	level.var_e1855a03[2]["elemental_bow_demongate4"] = 10;
	level.var_e1855a03[3]["elemental_bow_demongate4"] = 9;
	level.var_e1855a03[0]["elemental_bow_rune_prison"] = 7;
	level.var_e1855a03[1]["elemental_bow_rune_prison"] = 7;
	level.var_e1855a03[2]["elemental_bow_rune_prison"] = 7;
	level.var_e1855a03[3]["elemental_bow_rune_prison"] = 7;
	level.var_e1855a03[0]["elemental_bow_rune_prison4"] = 6;
	level.var_e1855a03[1]["elemental_bow_rune_prison4"] = 7;
	level.var_e1855a03[2]["elemental_bow_rune_prison4"] = 6;
	level.var_e1855a03[3]["elemental_bow_rune_prison4"] = 6;
	level.var_e1855a03[0]["elemental_bow_storm"] = 8;
	level.var_e1855a03[1]["elemental_bow_storm"] = 7;
	level.var_e1855a03[2]["elemental_bow_storm"] = 9;
	level.var_e1855a03[3]["elemental_bow_storm"] = 8;
	level.var_e1855a03[0]["elemental_bow_storm4"] = 8;
	level.var_e1855a03[1]["elemental_bow_storm4"] = 10;
	level.var_e1855a03[2]["elemental_bow_storm4"] = 9;
	level.var_e1855a03[3]["elemental_bow_storm4"] = 9;
	level.var_e1855a03[0]["elemental_bow_wolf_howl"] = 10;
	level.var_e1855a03[1]["elemental_bow_wolf_howl"] = 8;
	level.var_e1855a03[2]["elemental_bow_wolf_howl"] = 10;
	level.var_e1855a03[3]["elemental_bow_wolf_howl"] = 9;
	level.var_e1855a03[0]["elemental_bow_wolf_howl4"] = 10;
	level.var_e1855a03[1]["elemental_bow_wolf_howl4"] = 7;
	level.var_e1855a03[2]["elemental_bow_wolf_howl4"] = 10;
	level.var_e1855a03[3]["elemental_bow_wolf_howl4"] = 8;
	zm_spawner::register_zombie_death_event_callback(&function_1d0c9f25);
}

/*
	Name: function_1d0c9f25
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x9350
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 2713
*/
function function_1d0c9f25(e_attacker)
{
	self thread function_2f2899c1(e_attacker);
}

/*
	Name: function_2f2899c1
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x9380
	Size: 0x410
	Parameters: 1
	Flags: None
	Line Number: 2728
*/
function function_2f2899c1(e_attacker)
{
	if(!zm_utility::is_player_valid(e_attacker))
	{
		return;
	}
	if(IsSubStr(self.damageWeapon.name, "elemental_bow"))
	{
		var_7cc997ac = zm_weap_elemental_bow::function_1796e73(self.damageWeapon.name);
		switch(var_7cc997ac)
		{
			case "elemental_bow":
			case "elemental_bow4":
			{
				var_25c1c42e = "bow_";
				var_7cc997ac = "elemental_bow";
				var_a1235bb2 = "bow";
				n_cooldown_time = 20000;
				break;
			}
			case "elemental_bow_demongate":
			case "elemental_bow_demongate4":
			{
				var_25c1c42e = "demongate_";
				if(isdefined(level.var_ecd0c077) && level.var_ecd0c077.size > 5)
				{
					var_25c1c42e = "demongate_charged_";
				}
				var_a1235bb2 = "demongate";
				n_cooldown_time = 20000;
				break;
			}
			case "elemental_bow_rune_prison":
			{
				var_25c1c42e = "rune_";
				var_a1235bb2 = "rune";
				n_cooldown_time = 20000;
				break;
			}
			case "elemental_bow_rune_prison4":
			{
				var_25c1c42e = "rune_charged_";
				var_a1235bb2 = "rune";
				n_cooldown_time = 20000;
				break;
			}
			case "elemental_bow_storm":
			{
				var_25c1c42e = "elemental_";
				var_a1235bb2 = "rune";
				n_cooldown_time = 20000;
				break;
			}
			case "elemental_bow_storm4":
			{
				var_25c1c42e = "elemental_charged_";
				var_a1235bb2 = "rune";
				n_cooldown_time = 20000;
				break;
			}
			case "elemental_bow_wolf_howl":
			{
				var_25c1c42e = "wolf_";
				var_a1235bb2 = "wolf";
				n_cooldown_time = 20000;
				break;
			}
			case "elemental_bow_wolf_howl4":
			{
				var_25c1c42e = "wolf_charged_";
				var_a1235bb2 = "wolf";
				n_cooldown_time = 20000;
				break;
			}
			default
			{
				var_25c1c42e = "bow_";
				var_a1235bb2 = "bow";
				n_cooldown_time = 20000;
				break;
			}
		}
		if(!isdefined(level.var_d4abd41) || !isdefined(level.var_d4abd41[var_a1235bb2]) || GetTime() - level.var_d4abd41[var_a1235bb2] > n_cooldown_time)
		{
			var_5959b8b8 = level.var_e1855a03[e_attacker.characterindex][var_7cc997ac];
			var_70bd2a66 = RandomInt(var_5959b8b8);
			if(isdefined(level.var_fc0c9427) && isdefined(level.var_fc0c9427[var_a1235bb2]))
			{
				while(var_70bd2a66 === level.var_fc0c9427[var_a1235bb2])
				{
					var_70bd2a66 = RandomInt(var_5959b8b8);
				}
			}
			b_success = e_attacker function_7b697614("vox_plr_" + e_attacker.characterindex + "_kill_" + var_25c1c42e + var_70bd2a66, 1);
			if(isdefined(b_success) && b_success)
			{
				level.var_d4abd41[var_a1235bb2] = GetTime();
				level.var_fc0c9427[var_a1235bb2] = var_70bd2a66;
			}
		}
	}
}

/*
	Name: function_9f848cca
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x9798
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 2841
*/
function function_9f848cca()
{
	level.var_a2636bd5[0] = 6;
	level.var_a2636bd5[1] = 5;
	level.var_a2636bd5[2] = 5;
	level.var_a2636bd5[3] = 5;
	level waittill("hash_71de5140");
	zm_spawner::register_zombie_death_event_callback(&function_1c7c6e63);
	return;
}

/*
	Name: function_1c7c6e63
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x9828
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 2862
*/
function function_1c7c6e63(e_attacker)
{
	self thread function_6b6a641f(e_attacker);
}

/*
	Name: function_6b6a641f
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x9858
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 2877
*/
function function_6b6a641f(e_attacker)
{
	if(!zm_utility::is_player_valid(e_attacker))
	{
		return;
	}
	if(self.damageWeapon.name === "hero_gravityspikes_melee" && (isdefined(self.b_melee_kill) && self.b_melee_kill))
	{
		if(!isdefined(level.var_d9cc186d) || !isdefined(level.var_d9cc186d[e_attacker.characterindex]) || GetTime() - level.var_d9cc186d[e_attacker.characterindex] > 10000)
		{
			var_5959b8b8 = level.var_a2636bd5[e_attacker.characterindex];
			var_70bd2a66 = RandomInt(var_5959b8b8);
			if(isdefined(level.var_209998ed) && isdefined(level.var_209998ed[e_attacker.characterindex]))
			{
				while(var_70bd2a66 === level.var_209998ed[e_attacker.characterindex])
				{
					var_70bd2a66 = RandomInt(var_5959b8b8);
				}
			}
			b_success = e_attacker function_7b697614("vox_plr_" + e_attacker.characterindex + "_spikes_kill_" + var_70bd2a66, 1);
			if(isdefined(b_success) && b_success)
			{
				level.var_d9cc186d[e_attacker.characterindex] = GetTime();
				level.var_209998ed[e_attacker.characterindex] = var_70bd2a66;
			}
		}
	}
}

/*
	Name: function_c166f48
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x9A60
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 2916
*/
function function_c166f48()
{
	if(!isdefined(level.var_89466e30) || !isdefined(level.var_89466e30[self.characterindex]) || GetTime() - level.var_89466e30[self.characterindex] > 6000)
	{
		var_70bd2a66 = RandomInt(5);
		if(isdefined(level.var_9e809414) && isdefined(level.var_9e809414[self.characterindex]))
		{
			while(var_70bd2a66 === level.var_9e809414[self.characterindex])
			{
				var_70bd2a66 = RandomInt(5);
			}
		}
		b_success = self function_7b697614("vox_plr_" + self.characterindex + "_rocketshield_kill_" + var_70bd2a66, 1);
		if(isdefined(b_success) && b_success)
		{
			level.var_89466e30[self.characterindex] = GetTime();
			level.var_9e809414[self.characterindex] = var_70bd2a66;
		}
	}
}

/*
	Name: function_cfd97735
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x9BB8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 2947
*/
function function_cfd97735()
{
	level.var_9966a45d[0] = 11;
	level.var_9966a45d[1] = 10;
	level.var_9966a45d[2] = 10;
	level.var_9966a45d[3] = 10;
	level.var_872326d2 = Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11);
	Array::randomize(level.var_872326d2);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_43b44df3
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x9C78
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 2969
*/
function function_43b44df3()
{
	if(!isdefined(level.var_fc09cfc9))
	{
		level.var_fc09cfc9 = 0;
	}
	var_70bd2a66 = level.var_fc09cfc9;
	if(var_70bd2a66 > level.var_9966a45d[self.characterindex])
	{
		var_70bd2a66 = level.var_9966a45d[self.characterindex];
	}
	b_success = self function_7b697614("vox_plr_" + self.characterindex + "_pickup_generic_" + var_70bd2a66, 1);
	if(isdefined(b_success) && b_success)
	{
		level.var_fc09cfc9++;
	}
}

/*
	Name: function_4e11dfdc
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x9D48
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 2997
*/
function function_4e11dfdc()
{
	self function_7b697614("vox_plr_" + self.characterindex + "_pickup_spikes_" + RandomInt(5), 1);
}

/*
	Name: function_604361f
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x9DA0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 3012
*/
function function_604361f()
{
	while(1)
	{
		level waittill("shield_built", e_player);
		e_player thread function_7b697614("vox_plr_" + e_player.characterindex + "_pickup_rocket_" + RandomInt(5), 1);
	}
}

/*
	Name: function_ad27f488
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x9E20
	Size: 0x1B0
	Parameters: 1
	Flags: None
	Line Number: 3031
*/
function function_ad27f488(var_c3426fee)
{
	level.var_82118499++;
	n_delay = var_c3426fee * 0.7;
	if(!zm_utility::is_player_valid(self))
	{
		return;
	}
	switch(level.var_82118499)
	{
		case 1:
		{
			self thread function_7b697614("vox_plr_" + self.characterindex + "_dragon_encounter_" + RandomInt(3), n_delay);
			break;
		}
		case 2:
		case 3:
		{
			var_70bd2a66 = RandomInt(5);
			if(isdefined(level.var_3ab1346f) && isdefined(level.var_3ab1346f[self.characterindex]))
			{
				while(var_70bd2a66 === level.var_3ab1346f[self.characterindex])
				{
					var_70bd2a66 = RandomInt(5);
				}
			}
			b_success = self function_7b697614("vox_plr_" + self.characterindex + "_dragon_generic_" + var_70bd2a66, n_delay);
			if(isdefined(b_success) && b_success)
			{
				level.var_3ab1346f[self.characterindex] = var_70bd2a66;
				break;
			}
		}
	}
}

/*
	Name: function_439c7159
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0x9FD8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 3077
*/
function function_439c7159()
{
	if(!zm_utility::is_player_valid(self))
	{
		return;
	}
	var_70bd2a66 = RandomInt(5);
	if(self.characterindex == 2)
	{
		var_56f8b764 = Array(1, 2, 4);
		var_70bd2a66 = Array::random(var_56f8b764);
	}
	self thread function_7b697614("vox_plr_" + self.characterindex + "_dragon_final_" + var_70bd2a66, 6);
}

/*
	Name: function_db92bdf2
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xA0B0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 3102
*/
function function_db92bdf2()
{
	if(!(isdefined(self.var_3f43dcf1) && self.var_3f43dcf1))
	{
		level notify("hash_db92bdf2");
		b_success = self function_7b697614("vox_plr_" + self.characterindex + "_pickup_bow_" + RandomInt(5), 0);
		if(isdefined(b_success) && b_success)
		{
			self.var_3f43dcf1 = 1;
		}
	}
}

/*
	Name: function_ce6b93fc
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xA150
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 3125
*/
function function_ce6b93fc()
{
	var_70bd2a66 = RandomInt(5);
	if(isdefined(level.var_a46c6d37) && isdefined(level.var_a46c6d37[self.characterindex]))
	{
		while(var_70bd2a66 === level.var_a46c6d37[self.characterindex])
		{
			var_70bd2a66 = RandomInt(5);
		}
	}
	b_success = self function_7b697614("vox_plr_" + self.characterindex + "_pap_teleport_" + var_70bd2a66, 1.4);
	if(isdefined(b_success) && b_success)
	{
		level.var_a46c6d37[self.characterindex] = var_70bd2a66;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_68089900
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xA258
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 3154
*/
function function_68089900()
{
	level.var_32435277[0] = Array(1, 2, 4);
	level.var_32435277[1] = Array(2, 4);
	level.var_32435277[2] = Array(3, 4);
	level.var_32435277[3] = Array(1, 2, 3, 4);
	level.var_b3bb5f5f = 0;
}

/*
	Name: function_894d806e
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xA320
	Size: 0x248
	Parameters: 1
	Flags: None
	Line Number: 3173
*/
function function_894d806e(s_spawn_loc)
{
	if(!isdefined(s_spawn_loc))
	{
		return;
	}
	a_speakers = Array::get_all_closest(s_spawn_loc.origin, level.activePlayers);
	e_speaker = a_speakers[0];
	while(!zm_utility::is_player_valid(e_speaker) || (isdefined(level.var_7eb6d8cb) && isdefined(level.var_7eb6d8cb[e_speaker.characterindex]) && GetTime() - level.var_7eb6d8cb[e_speaker.characterindex] < 20000))
	{
		a_speakers = Array::exclude(a_speakers, e_speaker);
		if(a_speakers.size)
		{
			e_speaker = a_speakers[0];
		}
		else
		{
			e_speaker = undefined;
			break;
		}
	}
	if(isdefined(e_speaker))
	{
		var_70bd2a66 = RandomInt(5);
		if(isdefined(level.var_c2a10a01) && isdefined(level.var_c2a10a01[e_speaker.characterindex]))
		{
			while(var_70bd2a66 === level.var_c2a10a01[e_speaker.characterindex])
			{
				var_70bd2a66 = RandomInt(5);
			}
		}
		b_success = e_speaker function_7b697614("vox_plr_" + e_speaker.characterindex + "_mechz_appear_" + var_70bd2a66, 2.8);
		if(isdefined(b_success) && b_success)
		{
			level.var_7eb6d8cb[e_speaker.characterindex] = GetTime();
			level.var_c2a10a01[e_speaker.characterindex] = var_70bd2a66;
		}
	}
}

/*
	Name: function_e8a09e6e
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xA570
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 3223
*/
function function_e8a09e6e()
{
	self endon("death");
	self endon("hash_fe8911ae");
	level.var_b3bb5f5f++;
	if(level.var_b3bb5f5f > 4)
	{
		return;
	}
	self thread function_6d7d2595();
	for(n_counter = 0; isdefined(self.has_faceplate) && self.has_faceplate && n_counter < 90; n_counter = 0)
	{
		wait(0.2);
	}
	if(!(isdefined(self.has_faceplate) && self.has_faceplate))
	{
		if(!zm_utility::is_player_valid(self.attacker))
		{
			return;
		}
		e_attacker = self.attacker;
	}
	else
	{
		e_attacker = undefined;
		while(!isdefined(e_attacker))
		{
			self waittill("damage", n_damage, e_attacker);
			if(!zm_utility::is_player_valid(e_attacker))
			{
				e_attacker = undefined;
			}
		}
		if(self.faceplate_health < level.MECHZ_FACEPLATE_HEALTH * 0.5)
		{
			return;
		}
	}
	var_70bd2a66 = RandomInt(5);
	if(isdefined(level.var_a45398c8) && isdefined(level.var_a45398c8[e_attacker.characterindex]))
	{
		while(var_70bd2a66 === level.var_a45398c8[e_attacker.characterindex])
		{
			var_70bd2a66 = RandomInt(5);
		}
	}
	self thread function_bdcf0afc(e_attacker, var_70bd2a66, "_panzer_hint_");
}

/*
	Name: function_6d7d2595
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xA790
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 3282
*/
function function_6d7d2595()
{
	self endon("death");
	self endon("hash_fe8911ae");
	while(isdefined(self.powercap_covered) && self.powercap_covered)
	{
		wait(0.2);
	}
	if(!zm_utility::is_player_valid(self.attacker))
	{
		return;
	}
	e_attacker = self.attacker;
	var_70bd2a66 = Array::random(level.var_32435277[e_attacker.characterindex]);
	if(isdefined(level.var_f63de82) && isdefined(level.var_f63de82[e_attacker.characterindex]))
	{
		while(var_70bd2a66 === level.var_f63de82[e_attacker.characterindex])
		{
			var_70bd2a66 = Array::random(level.var_32435277[e_attacker.characterindex]);
		}
	}
	self thread function_bdcf0afc(e_attacker, var_70bd2a66, "_disable_claw_");
}

/*
	Name: function_bdcf0afc
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xA8E8
	Size: 0xF0
	Parameters: 3
	Flags: None
	Line Number: 3316
*/
function function_bdcf0afc(e_attacker, var_70bd2a66, var_68c69747)
{
	b_success = e_attacker function_7b697614("vox_plr_" + e_attacker.characterindex + var_68c69747 + var_70bd2a66);
	if(isdefined(b_success) && b_success)
	{
		if(var_68c69747 == "_panzer_hint_")
		{
			level.var_a45398c8[e_attacker.characterindex] = var_70bd2a66;
		}
		else
		{
			level.var_f63de82[e_attacker.characterindex] = var_70bd2a66;
		}
		if(isdefined(self) && isalive(self))
		{
			self notify("hash_fe8911ae");
		}
	}
}

/*
	Name: function_5e426b67
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xA9E0
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 3346
*/
function function_5e426b67()
{
	self waittill("death");
	if(!zm_utility::is_player_valid(self.attacker))
	{
		return;
	}
	e_attacker = self.attacker;
	if(!isdefined(level.var_91f5abdc) || !isdefined(level.var_91f5abdc[e_attacker.characterindex]) || GetTime() - level.var_91f5abdc[e_attacker.characterindex] > 20000)
	{
		var_70bd2a66 = RandomInt(5);
		if(isdefined(level.var_4d539832) && isdefined(level.var_4d539832[e_attacker.characterindex]))
		{
			while(var_70bd2a66 === level.var_4d539832[e_attacker.characterindex])
			{
				var_70bd2a66 = RandomInt(5);
			}
		}
		b_success = e_attacker function_7b697614("vox_plr_" + e_attacker.characterindex + "_mechz_kill_" + var_70bd2a66, 2);
		if(isdefined(b_success) && b_success)
		{
			level.var_91f5abdc[e_attacker.characterindex] = GetTime();
			level.var_4d539832[e_attacker.characterindex] = var_70bd2a66;
		}
	}
}

/*
	Name: function_1bc76ea3
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xABA8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 3383
*/
function function_1bc76ea3()
{
	level.var_275b3aff = 0;
	var_9b37fac5 = struct::get_array("vo_room_intro", "targetname");
	Array::thread_all(var_9b37fac5, &function_59fdea16);
}

/*
	Name: function_59fdea16
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xAC18
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 3400
*/
function function_59fdea16()
{
	self.script_unitrigger_type = "unitrigger_radius";
	self.cursor_hint = "HINT_NOICON";
	self.require_look_at = 0;
	if(self.script_noteworthy === "zone_v10_pad_door")
	{
		self.origin = (4608, -2304, -2280);
		self.radius = 600;
	}
	zm_unitrigger::register_static_unitrigger(self, &function_88db2665);
}

/*
	Name: function_88db2665
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xACB0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 3423
*/
function function_88db2665()
{
	self endon("kill_trigger");
	while(1)
	{
		self waittill("trigger", e_player);
		self thread function_4b5f8d2e(e_player);
		wait(1);
	}
}

/*
	Name: function_4b5f8d2e
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xAD10
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 3444
*/
function function_4b5f8d2e(e_player)
{
	if(isdefined(level.var_275b3aff) && level.var_275b3aff)
	{
		return;
	}
	if(!isdefined(level.var_d5c00ec8) || GetTime() - level.var_d5c00ec8 > 50000)
	{
		level.var_275b3aff = 1;
		s_unitrigger_stub = self.stub;
		var_45d9d86 = s_unitrigger_stub.script_string;
		e_player thread function_91db1c0b("vox_plr_" + e_player.characterindex + "_room_" + var_45d9d86 + "_0", s_unitrigger_stub);
		b_success = e_player function_7b697614("vox_plr_" + e_player.characterindex + "_room_" + var_45d9d86 + "_0");
		if(isdefined(b_success) && b_success)
		{
			level.var_d5c00ec8 = GetTime();
		}
		level.var_275b3aff = 0;
	}
}

/*
	Name: function_91db1c0b
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xAE60
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 3475
*/
function function_91db1c0b(var_96896ff5, s_unitrigger_stub)
{
	self waittill(var_96896ff5 + "_vo_started");
	zm_unitrigger::unregister_unitrigger(s_unitrigger_stub);
}

/*
	Name: function_fbe2f6cb
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xAEA8
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 3491
*/
function function_fbe2f6cb()
{
	level waittill("start_zombie_round_logic");
	var_1b10157c = 0;
	while(1)
	{
		str_result = level util::waittill_any_return("pap_reformed", "base_bow_picked_up");
		if(str_result == "pap_reformed")
		{
			var_1b10157c++;
			if(level.round_number > 5)
			{
				level.var_169991e1++;
				while(function_68ee653())
				{
					util::wait_network_frame();
				}
				level function_5eded46b("vox_grop_groph_additional" + level.var_169991e1 + "_0");
			}
		}
		else if(str_result == "base_bow_picked_up")
		{
			var_1b10157c++;
			level.var_169991e1++;
			while(function_68ee653())
			{
				util::wait_network_frame();
			}
			level function_5eded46b("vox_grop_groph_additional" + level.var_169991e1 + "_0");
		}
		if(var_1b10157c >= 2)
		{
			return;
		}
	}
}

/*
	Name: function_68ee653
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xB028
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 3538
*/
function function_68ee653()
{
	for(i = 0; i < level.activePlayers.size; i++)
	{
		if(level.activePlayers[i].isSpeaking)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_f0b775a3
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xB088
	Size: 0x1B0
	Parameters: 3
	Flags: None
	Line Number: 3560
*/
function function_f0b775a3(str_label, var_ed01584, b_wait)
{
	if(!isdefined(var_ed01584))
	{
		var_ed01584 = 1;
	}
	if(!isdefined(b_wait))
	{
		b_wait = 1;
	}
	var_96896ff5 = "vox_arro_demongate_" + str_label + "_0";
	self thread function_c123b81c(str_label, var_96896ff5);
	var_b675d3f1 = self function_7b697614(var_96896ff5, 0, b_wait, 0, 1);
	if(!(isdefined(var_b675d3f1) && var_b675d3f1))
	{
		level notify(var_96896ff5 + "_vo_failed");
		return;
	}
	if(var_ed01584)
	{
		if(str_label == "name_incorrect")
		{
			if(isdefined(level.var_6e68c0d8))
			{
				level.var_6e68c0d8 thread function_7b697614("vox_plr_" + level.var_6e68c0d8.characterindex + "_demongate_" + str_label + "_response_0", 1);
				return;
			}
		}
		if(isdefined(level.var_6e68c0d8))
		{
			level.var_6e68c0d8 function_7b697614("vox_plr_" + level.var_6e68c0d8.characterindex + "_demongate_" + str_label + "_response_0");
			return;
		}
	}
	level.var_6e68c0d8.var_0 = undefined;
}

/*
	Name: function_7c63dd65
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xB240
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 3607
*/
function function_7c63dd65(str_crest, b_wait)
{
	if(!isdefined(b_wait))
	{
		b_wait = 1;
	}
	var_96896ff5 = "vox_arro_demongate_" + str_crest + "_0";
	self thread function_c123b81c(str_crest, var_96896ff5);
	return self function_7b697614(var_96896ff5, 0, b_wait, 0, 1);
}

/*
	Name: function_ebc3d584
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xB2D8
	Size: 0x118
	Parameters: 2
	Flags: None
	Line Number: 3628
*/
function function_ebc3d584(str_syllable, var_b5991f0e)
{
	if(!isdefined(var_b5991f0e))
	{
		var_b5991f0e = 0;
	}
	switch(str_syllable)
	{
		case "lor":
		{
			str_vox = "ust";
			break;
		}
		case "ulla":
		{
			str_vox = "mar";
			break;
		}
		case "oth":
		{
			str_vox = "ath";
			break;
		}
		case "zor":
		{
			str_vox = "gor";
			break;
		}
		case "mar":
		{
			str_vox = "yit";
			break;
		}
		case "uja":
		{
			str_vox = "iyel";
			break;
		}
	}
	if(isdefined(str_vox))
	{
		self function_7b697614("vox_spir_demongate_vowel_" + str_vox + "_0", 0, var_b5991f0e, 0, 1);
		return;
	}
}

/*
	Name: function_56c65986
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xB3F8
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 3684
*/
function function_56c65986(var_9c3510b2)
{
	if(var_9c3510b2)
	{
		self thread function_c123b81c("name_correct", "vox_arro_demongate_name_correct_0");
		self function_7b697614("vox_arro_demongate_name_correct_0", 0, 1, 0, 1);
	}
	else
	{
		var_ed01584 = 0;
		if(!(isdefined(level.var_6e68c0d8.var_a53f437d) && level.var_6e68c0d8.var_a53f437d))
		{
			level.var_6e68c0d8.var_a53f437d = 1;
			var_ed01584 = 1;
		}
		self function_f0b775a3("name_incorrect", var_ed01584);
	}
}

/*
	Name: function_c123b81c
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xB4E0
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 3713
*/
function function_c123b81c(str_label, var_96896ff5)
{
	self endon("death");
	level endon(var_96896ff5 + "_vo_failed");
	self waittill(var_96896ff5 + "_vo_started");
	if(isdefined(level.var_6e68c0d8))
	{
		level.var_6e68c0d8 clientfield::increment_to_player("demon_vo_" + str_label, 1);
	}
}

/*
	Name: function_21c9c75b
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xB568
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 3734
*/
function function_21c9c75b()
{
	self function_7b697614("vox_plr_" + self.characterindex + "_clock_chime_0");
}

/*
	Name: function_5fa306b6
	Namespace: namespace_97ddfc0d
	Checksum: 0x424F4353
	Offset: 0xB5A8
	Size: 0x104
	Parameters: 1
	Flags: None
	Line Number: 3749
*/
function function_5fa306b6(n_painting)
{
	str_alias = "vox_plr_" + self.characterindex + "_quest_wolf_" + n_painting + "_0";
	if(!isdefined(self.var_b89ed4e5))
	{
		self.var_b89ed4e5 = [];
	}
	if(!Array::contains(self.var_b89ed4e5, str_alias))
	{
		if(!isdefined(self.var_b89ed4e5))
		{
			self.var_b89ed4e5 = [];
		}
		else if(!IsArray(self.var_b89ed4e5))
		{
			self.var_b89ed4e5 = Array(self.var_b89ed4e5);
		}
		self.var_b89ed4e5[self.var_b89ed4e5.size] = str_alias;
		self function_7b697614(str_alias);
	}
}

