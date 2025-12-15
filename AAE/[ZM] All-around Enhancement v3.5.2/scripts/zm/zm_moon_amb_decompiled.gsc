#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_audio_zhd;
#include scripts\zm\_zm_equip_gasmask;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_moon_amb;

#namespace zm_moon_amb;

/*
	Name: main
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0xB98
	Size: 0x2B8
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function main()
{
	level._audio_custom_weapon_check = &weapon_type_check_custom;
	level._custom_intro_vox = &no_intro_vox;
	level._do_player_or_npc_playvox_override = &do_player_playvox_custom;
	level.player_4_vox_override = 0;
	level.been_to_moon_before = 0;
	level.var_61f315ab = &function_3630300b;
	level.audio_get_mod_type = &get_mod_type;
	level.audio_zones_breached = [];
	level.audio_zones_breached["1"] = 0;
	level.audio_zones_breached["2a"] = 0;
	level.audio_zones_breached["2b"] = 0;
	level.audio_zones_breached["3a"] = 0;
	level.audio_zones_breached["3b"] = 0;
	level.audio_zones_breached["4a"] = 0;
	level.audio_zones_breached["4b"] = 0;
	level.audio_zones_breached["5"] = 0;
	level.quad_prespawn = &function_7b549eb;
	level thread setup_music_egg();
	level thread poweron_vox();
	level thread setup_moon_visit_vox();
	level thread intro_vox_or_skit();
	level thread eight_bit_easteregg();
	level thread radio_setup();
	level thread function_45b4acf2();
	level thread function_c844cebe();
	level thread function_d57508d0();
	callback::on_spawned(&function_10ffc7d7);
	clientfield::register("allplayers", "beam_fx_audio", 21000, 1, "counter");
	clientfield::register("world", "teleporter_audio_sfx", 21000, 1, "counter");
	return;
}

/*
	Name: get_mod_type
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0xE58
	Size: 0x380
	Parameters: 7
	Flags: None
	Line Number: 76
*/
function get_mod_type(impact, mod, weapon, zombie, instakill, dist, player)
{
	close_dist = 4096;
	far_dist = 160000;
	if(weapon.name == "hero_annihilator")
	{
		return "annihilator";
	}
	if(isdefined(zombie.animName))
	{
		if(zombie.animName == "astro_zombie")
		{
			return "astro";
		}
		if(zombie.animName == "quad_zombie")
		{
			return "quad";
		}
	}
	if(zm_utility::is_placeable_mine(weapon))
	{
		if(!instakill)
		{
			return "betty";
		}
		else
		{
			return "weapon_instakill";
		}
	}
	if(weapon.name == "ray_gun" || weapon.name == "raygun_mark2" && dist > far_dist)
	{
		if(!instakill)
		{
			return "raygun";
		}
		else
		{
			return "weapon_instakill";
		}
	}
	if(zm_utility::is_headshot(weapon, impact, mod) && dist >= far_dist)
	{
		return "headshot";
	}
	if(dist < close_dist)
	{
		return "close";
	}
	if(zm_utility::is_explosive_damage(mod) && weapon.name != "ray_gun" && weapon.name != "raygun_mark2" && (!(isdefined(zombie.is_on_fire) && zombie.is_on_fire)))
	{
		if(!instakill)
		{
			return "explosive";
		}
		else
		{
			return "weapon_instakill";
		}
	}
	if(weapon.doesFireDamage && (mod == "MOD_BURNED" || mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH"))
	{
		if(!instakill)
		{
			return "flame";
		}
		else
		{
			return "weapon_instakill";
		}
	}
	if(!isdefined(impact))
	{
		impact = "";
	}
	if(mod == "MOD_RIFLE_BULLET" || mod == "MOD_PISTOL_BULLET")
	{
		if(!instakill)
		{
			return "bullet";
		}
		else
		{
			return "weapon_instakill";
		}
	}
	if(instakill)
	{
		return "default";
	}
	if(mod != "MOD_MELEE" && zombie.missingLegs)
	{
		return "crawler";
	}
	if(mod != "MOD_BURNED" && dist < close_dist)
	{
		return "close";
	}
	return "default";
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d57508d0
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x11E0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 188
*/
function function_d57508d0()
{
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.FillBuffer(Int32 numBytes)
   at System.IO.BinaryReader.ReadInt32()
   at Cerberus.Logic.BlackOps3Script.LoadEndSwitch() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\BlackOps3Script.cs:line 24892
   at Cerberus.Logic.Decompiler.FindSwitchCase() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 377
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 218
}

/*
	Name: function_cad702de
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x1290
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 208
*/
function function_cad702de()
{
	var_53a95046 = soundgetplaybacktime("vox_xcomp_quest_step8_6");
	self thread namespace_cc012897::Send("vox_xcomp_quest_step8_6", "player", var_53a95046);
	self playlocalsound("vox_xcomp_quest_step8_6");
	wait(var_53a95046 / 1000);
	var_53a95046 = soundgetplaybacktime("vox_xcomp_quest_step8_8");
	self thread namespace_cc012897::Send("vox_xcomp_quest_step8_8", "player", var_53a95046);
	self playlocalsound("vox_xcomp_quest_step8_8");
}

/*
	Name: function_10ffc7d7
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x1388
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 229
*/
function function_10ffc7d7()
{
	if(!isdefined(self.var_626b83bf))
	{
		self.var_626b83bf = 1;
		level thread zm_audio::sndmusicsystem_playstate("none");
	}
}

/*
	Name: radio_setup
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x13D0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 248
*/
function radio_setup()
{
	var_1a5f0b42 = struct::get_array("egg_radios", "targetname");
	Array::thread_all(var_1a5f0b42, &play_radio_eastereggs);
	return;
}

/*
	Name: play_radio_eastereggs
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x1430
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 265
*/
function play_radio_eastereggs()
{
	self zm_unitrigger::create_unitrigger();
	/#
		self thread zm_utility::print3d_ent("Dev Block strings are not supported", (0, 1, 0), 3, VectorScale((0, 0, 1), 24));
	#/
	while(1)
	{
		self waittill("trigger_activated");
		if(isdefined(self.script_noteworthy))
		{
			Breakout = self checkfor_radio_override();
			if(Breakout)
			{
				break;
				continue;
			}
			break;
		}
	}
	/#
		self notify("end_print3d");
	#/
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
	var_53a95046 = soundgetplaybacktime("vox_story_1_log_" + self.script_int);
	thread namespace_cc012897::Send("vox_story_1_log_" + self.script_int, "all", var_53a95046);
	playsoundatposition("vox_story_1_log_" + self.script_int, self.origin);
}

/*
	Name: checkfor_radio_override
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x15A8
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 304
*/
function checkfor_radio_override()
{
	if(!isdefined(level.glass))
	{
		return 1;
	}
	for(i = 0; i < level.glass.size; i++)
	{
		if(level.glass[i].damage_state == 1)
		{
			for(j = 0; j < level.glass[i].fxpos_array.size; j++)
			{
				glass_origin = level.glass[i].fxpos_array[j].origin;
				if(DistanceSquared(glass_origin, self.origin) < 2500)
				{
					return 1;
				}
			}
		}
	}
	return 0;
}

/*
	Name: eight_bit_easteregg
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x16B8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 337
*/
function eight_bit_easteregg()
{
	structs = struct::get_array("8bitsongs", "targetname");
	Array::thread_all(structs, &waitfor_eightbit_use);
}

/*
	Name: waitfor_eightbit_use
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x1718
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 353
*/
function waitfor_eightbit_use()
{
	level flag::wait_till("power_on");
	self zm_unitrigger::create_unitrigger();
	/#
		self thread zm_utility::print3d_ent("Dev Block strings are not supported", (1, 0, 1), 3, VectorScale((0, 0, 1), 24));
	#/
	n_count = 0;
	while(1)
	{
		self waittill("trigger_activated");
		if(!namespace_52adc03e::function_8090042c())
		{
			continue;
		}
		playsoundatposition("zmb_8bit_button_" + n_count, self.origin);
		n_count++;
		if(n_count >= 3)
		{
			break;
		}
		wait(1);
	}
	/#
		self notify("end_print3d");
	#/
	level thread zm_audio::sndmusicsystem_playstate(self.script_string);
}

/*
	Name: no_intro_vox
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x1848
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 392
*/
function no_intro_vox()
{
}

/*
	Name: intro_vox_or_skit
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x1858
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 406
*/
function intro_vox_or_skit()
{
	wait(1);
	level flag::wait_till("start_zombie_round_logic");
	playsoundatposition("evt_warp_in", (0, 0, 0));
	wait(3);
	level.activePlayers[randomIntRange(0, level.activePlayers.size)] thread zm_audio::create_and_play_dialog("general", "start");
}

/*
	Name: poweron_vox
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x18F0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 425
*/
function poweron_vox()
{
	wait(3);
	level flag::wait_till("power_on");
	wait(20);
	level thread play_mooncomp_vox("vox_mcomp_power");
}

/*
	Name: audio_alias_override
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x1940
	Size: 0x698
	Parameters: 0
	Flags: None
	Line Number: 443
*/
function audio_alias_override()
{
	level.plr_vox["kill"]["explosive"] = "kill_explosive";
	level.plr_vox["kill"]["explosive_response"] = undefined;
	level.plr_vox["weapon_pickup"]["microwave"] = "wpck_microwave";
	level.plr_vox["weapon_pickup"]["microwave_response"] = undefined;
	level.plr_vox["weapon_pickup"]["quantum"] = "wpck_quantum";
	level.plr_vox["weapon_pickup"]["quantum_response"] = undefined;
	level.plr_vox["weapon_pickup"]["gasmask"] = "wpck_gasmask";
	level.plr_vox["weapon_pickup"]["gasmask_response"] = undefined;
	level.plr_vox["weapon_pickup"]["hacker"] = "wpck_hacker";
	level.plr_vox["weapon_pickup"]["hacker_response"] = undefined;
	level.plr_vox["kill"]["micro_dual"] = "kill_micro_dual";
	level.plr_vox["kill"]["micro_dual_response"] = undefined;
	level.plr_vox["kill"]["micro_single"] = "kill_micro_single";
	level.plr_vox["kill"]["micro_single_response"] = undefined;
	level.plr_vox["kill"]["quant_good"] = "kill_quant_good";
	level.plr_vox["kill"]["quant_good_response"] = undefined;
	level.plr_vox["kill"]["quant_bad"] = "kill_quant_bad";
	level.plr_vox["kill"]["quant_bad_response"] = undefined;
	level.plr_vox["digger"] = [];
	level.plr_vox["digger"]["incoming"] = "digger_incoming";
	level.plr_vox["digger"]["incoming_response"] = undefined;
	level.plr_vox["digger"]["breach"] = "digger_breach";
	level.plr_vox["digger"]["breach_response"] = undefined;
	level.plr_vox["digger"]["hacked"] = "digger_hacked";
	level.plr_vox["digger"]["hacked_response"] = undefined;
	level.plr_vox["general"]["astro_spawn"] = "spawn_astro";
	level.plr_vox["general"]["astro_spawn_response"] = undefined;
	level.plr_vox["kill"]["astro"] = "kill_astro";
	level.plr_vox["kill"]["astro_response"] = undefined;
	level.plr_vox["general"]["biodome"] = "location_biodome";
	level.plr_vox["general"]["biodome_response"] = undefined;
	level.plr_vox["general"]["jumppad"] = "jumppad";
	level.plr_vox["general"]["jumppad_response"] = undefined;
	level.plr_vox["general"]["teleporter"] = "teleporter";
	level.plr_vox["general"]["teleporter_response"] = undefined;
	level.plr_vox["perk"]["specialty_additionalprimaryweapon"] = "perk_arsenal";
	level.plr_vox["perk"]["specialty_additionalprimaryweapon_response"] = undefined;
	level.plr_vox["powerup"]["bonus_points_solo"] = "powerup_pts_solo";
	level.plr_vox["powerup"]["bonus_points_solo_response"] = undefined;
	level.plr_vox["powerup"]["bonus_points_team"] = "powerup_pts_team";
	level.plr_vox["powerup"]["bonus_points_team_response"] = undefined;
	level.plr_vox["powerup"]["lose_points"] = "powerup_antipts_zmb";
	level.plr_vox["powerup"]["lose_points_response"] = undefined;
	level.plr_vox["general"]["hack_plr"] = "hack_plr";
	level.plr_vox["general"]["hack_plr_response"] = undefined;
	level.plr_vox["general"]["hack_vox"] = "hack_vox";
	level.plr_vox["general"]["hack_vox_response"] = undefined;
	level.plr_vox["general"]["airless"] = "location_airless";
	level.plr_vox["general"]["airless_response"] = undefined;
	level.plr_vox["general"]["moonjump"] = "moonjump";
	level.plr_vox["general"]["moonjump_response"] = undefined;
	level.plr_vox["weapon_pickup"]["grenade"] = "wpck_launcher";
	level.plr_vox["weapon_pickup"]["grenade_response"] = undefined;
}

/*
	Name: force_player4_override
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x1FE0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 510
*/
function force_player4_override()
{
	wait(60);
	level thread player_4_override();
}

/*
	Name: player_4_override
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x2008
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 526
*/
function player_4_override()
{
	level.player_4_vox_override = 1;
	level.zmAnnouncerPrefix = "vox_zmbar_";
	foreach(player in level.players)
	{
		if(isdefined(player.characterindex) && player.characterindex == 2)
		{
			player.isSamantha = 1;
		}
	}
	return;
}

/*
	Name: do_player_playvox_custom
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x20E0
	Size: 0x138
	Parameters: 5
	Flags: None
	Line Number: 550
*/
function do_player_playvox_custom(sound_to_play, waittime, category, type, override)
{
	if(!isdefined(level.player_is_speaking))
	{
		level.player_is_speaking = 0;
	}
	if(isdefined(level.skit_vox_override) && level.skit_vox_override && (!(isdefined(override) && override)))
	{
		if(GetDvarString("vo_test") == "1")
		{
			iprintln("level.skit_vox_override && IS_TRUE( override )");
			return;
		}
	}
	if(level.player_is_speaking != 1)
	{
		level.player_is_speaking = 1;
		self play_futz_or_not_moonvox(sound_to_play);
		level.player_is_speaking = 0;
	}
	else if(GetDvarString("vo_test") == "1")
	{
		iprintln("player_is_speaking");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: play_futz_or_not_moonvox
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x2220
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 588
*/
function play_futz_or_not_moonvox(sound_to_play)
{
	self endon("disconnect");
	self endon("death");
	if(zombie_utility::is_player_valid(self) && self zm_equipment::is_active(level.var_f486078e))
	{
		self playsoundwithnotify(sound_to_play + "_f", "sound_done" + sound_to_play, "j_head");
		if(SoundExists(sound_to_play + "_f"))
		{
			level thread namespace_cc012897::Send(sound_to_play, "all");
		}
		for(i = 0; i < level.activePlayers.size; i++)
		{
			if(self != level.activePlayers[i] && level.activePlayers[i] zm_equipment::is_active(level.var_f486078e))
			{
				level.activePlayers[i] playsoundtoplayer(sound_to_play + "_f", level.activePlayers[i]);
			}
		}
	}
	else
	{
		self playsoundwithnotify(sound_to_play, "sound_done" + sound_to_play);
		level thread namespace_cc012897::Send(sound_to_play, "all");
	}
	self waittill("sound_done" + sound_to_play);
	return;
}

/*
	Name: weapon_type_check_custom
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x23F0
	Size: 0x2B0
	Parameters: 2
	Flags: None
	Line Number: 626
*/
function weapon_type_check_custom(weapon, magic_box)
{
	if(!isdefined(self.entity_num))
	{
		return "crappy";
	}
	switch(self.entity_num)
	{
		case 0:
		{
			if(weapon == GetWeapon("m16"))
			{
				return "favorite";
			}
			else if(weapon == GetWeapon("m16_gl_upgraded"))
			{
				return "favorite_upgrade";
				break;
			}
		}
		case 1:
		{
			if(weapon == GetWeapon("fnfal"))
			{
				return "favorite";
			}
			else if(weapon == GetWeapon("hk21_upgraded"))
			{
				return "favorite_upgrade";
				break;
			}
		}
		case 2:
		{
			if(weapon == GetWeapon("ak74u"))
			{
				return "favorite";
			}
			else if(weapon == GetWeapon("m14_upgraded"))
			{
				return "favorite_upgrade";
				break;
			}
		}
		case 3:
		{
			if(!(isdefined(level.player_4_vox_override) && level.player_4_vox_override))
			{
				if(weapon == GetWeapon("spectre"))
				{
					return "favorite";
				}
				else if(weapon == GetWeapon("g11_lps_upgraded"))
				{
					return "favorite_upgrade";
				}
			}
			else if(weapon == GetWeapon("spas"))
			{
				return "favorite";
			}
			else if(weapon == GetWeapon("mp40_upgraded"))
			{
				return "favorite_upgrade";
				break;
			}
		}
	}
	if(IsSubStr(weapon.name, "upgraded"))
	{
		return "upgrade";
	}
	w_root = weapon.rootweapon;
	return level.zombie_weapons[w_root].vox;
}

/*
	Name: setup_music_egg
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x26A8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 712
*/
function setup_music_egg()
{
	level thread namespace_52adc03e::function_e753d4f();
	level flag::wait_till("snd_song_completed");
	level thread zm_audio::sndmusicsystem_playstate("cominghome");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: waitfor_override
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x2710
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 731
*/
function waitfor_override()
{
	if(isdefined(level.music_override) && level.music_override)
	{
		return 0;
	}
	return 1;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: play_mooncomp_vox
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x2740
	Size: 0x108
	Parameters: 2
	Flags: None
	Line Number: 751
*/
function play_mooncomp_vox(alias, digger)
{
	if(!isdefined(alias))
	{
		return;
	}
	if(!level.on_the_moon)
	{
		return;
	}
	num = 0;
	if(isdefined(digger))
	{
		switch(digger)
		{
			case "hangar":
			{
				num = 1;
				break;
			}
			case "teleporter":
			{
				num = 0;
				break;
			}
			case "biodome":
			{
				num = 2;
				break;
			}
		}
	}
	else
	{
		num = "";
	}
	if(!isdefined(level.mooncomp_is_speaking))
	{
		level.mooncomp_is_speaking = 0;
	}
	if(level.mooncomp_is_speaking == 0)
	{
		level.mooncomp_is_speaking = 1;
		level do_mooncomp_vox(alias + num);
		level.mooncomp_is_speaking = 0;
	}
}

/*
	Name: do_mooncomp_vox
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x2850
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 809
*/
function do_mooncomp_vox(alias)
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] zm_equipment::is_active(level.var_f486078e))
		{
			thread namespace_cc012897::Send(alias);
			players[i] playsoundtoplayer(alias + "_f", players[i]);
		}
	}
	if(!isdefined(level.var_2ff0efb3))
	{
		return;
	}
	thread namespace_cc012897::Send(alias);
	foreach(speaker in level.var_2ff0efb3)
	{
		playsoundatposition(alias, speaker.origin);
		wait(0.05);
	}
}

/*
	Name: function_c844cebe
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x29E0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 842
*/
function function_c844cebe()
{
	level.var_2ff0efb3 = struct::get_array("sndMoonPa", "targetname");
	if(!isdefined(level.var_2ff0efb3))
	{
		return;
		return;
	}
}

/*
	Name: waitfor_forest_zone_entry
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x2A28
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 862
*/
function waitfor_forest_zone_entry()
{
	while(1)
	{
		players = zm_zonemgr::get_players_in_zone("forest_zone", 1);
		if(isdefined(players) && IsArray(players))
		{
			player = players[RandomInt(players.size)];
			if(isPlayer(player))
			{
				players[RandomInt(players.size)] zm_audio::create_and_play_dialog("general", "biodome");
				return;
			}
		}
		wait(0.5);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: setup_moon_visit_vox
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x2B20
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 892
*/
function setup_moon_visit_vox()
{
	level flag::wait_till("start_zombie_round_logic");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread play_delayed_first_time_vox();
	}
	level thread waitfor_first_player();
	level thread waitfor_forest_zone_entry();
	level thread function_6e8ce0ec();
}

/*
	Name: function_7b549eb
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x2BF8
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 915
*/
function function_7b549eb()
{
	self endon("death");
	if(isdefined(level.var_c394c316))
	{
		return;
	}
	while(level.player_is_speaking == 1 || level.mooncomp_is_speaking == 1)
	{
		wait(0.05);
	}
	if(isdefined(level.var_c394c316))
	{
		return;
	}
	while(1)
	{
		player = ArrayGetClosest(self.origin, level.activePlayers, 150);
		if(isdefined(player))
		{
			level notify("hash_323909e", player);
			level.var_c394c316 = 1;
			return;
		}
		wait(0.05);
	}
}

/*
	Name: function_6e8ce0ec
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x2CC8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 953
*/
function function_6e8ce0ec()
{
	for(;;)
	{
		level waittill("hash_323909e", player);
		player zm_audio::create_and_play_dialog("general", "quad_spawn");
		level waittill("end_of_round");
		level.var_c394c316 = undefined;
	}
}

/*
	Name: play_delayed_first_time_vox
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x2D30
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 974
*/
function play_delayed_first_time_vox()
{
	self endon("death");
	self endon("disconnect");
	self waittill("hash_237e9e73");
	self waittill("weapon_change_complete");
	var_53a95046 = soundgetplaybacktime("vox_mcomp_suit_on");
	self thread namespace_cc012897::Send("vox_mcomp_suit_on", "player", var_53a95046);
	self playsoundtoplayer("vox_mcomp_suit_on", self);
	wait(var_53a95046 / 1000);
	var_53a95046 = soundgetplaybacktime("vox_mcomp_start");
	self thread namespace_cc012897::Send("vox_mcomp_start", "player", var_53a95046);
	self playsoundtoplayer("vox_mcomp_start", self);
	wait(7);
	self thread play_maskon_vox();
	self thread play_warning_vox();
	level notify("first_player_vox", self);
}

/*
	Name: waitfor_first_player
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x2E98
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 1003
*/
function waitfor_first_player()
{
	level waittill("first_player_vox", who);
	who thread zm_audio::create_and_play_dialog("general", "teleporter");
	while(1)
	{
		players = zm_zonemgr::get_players_in_zone("airlock_east_zone", 1);
		if(isdefined(players) && IsArray(players))
		{
			player = players[RandomInt(players.size)];
			if(isPlayer(player))
			{
				player zm_audio::create_and_play_dialog("general", "moonbase");
				return;
			}
		}
		players = zm_zonemgr::get_players_in_zone("airlock_west_zone", 1);
		if(isdefined(players) && IsArray(players))
		{
			player = players[RandomInt(players.size)];
			if(isPlayer(player))
			{
				player zm_audio::create_and_play_dialog("general", "moonbase");
				return;
			}
		}
		wait(0.5);
	}
	return;
}

/*
	Name: play_maskon_vox
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x3060
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1044
*/
function play_maskon_vox()
{
	self endon("death");
	self endon("disconnect");
	while(1)
	{
		self waittill("hash_237e9e73");
		self waittill("weapon_change_complete");
		self stopsounds();
		wait(0.05);
		self playsoundtoplayer("vox_mcomp_suit_on", self);
	}
}

/*
	Name: play_warning_vox
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x30E8
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 1068
*/
function play_warning_vox()
{
	self endon("death");
	self endon("disconnect");
	while(1)
	{
		while(!self.in_low_gravity)
		{
			wait(0.1);
		}
		if(isdefined(self.in_low_gravity && self hasweapon(level.var_f486078e) && !self namespace_11fcf241::gasmask_active()) && self.in_low_gravity && self hasweapon(level.var_f486078e) && !self namespace_11fcf241::gasmask_active())
		{
			self stopsounds();
			wait(0.05);
			self playsoundtoplayer("vox_mcomp_suit_reminder", self);
			while(self.in_low_gravity)
			{
				if(self namespace_11fcf241::gasmask_active())
				{
					break;
				}
				wait(0.1);
			}
		}
		wait(8);
	}
}

/*
	Name: function_45b4acf2
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x3238
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 1106
*/
function function_45b4acf2()
{
	var_757351da = struct::get_array("zhdbuttons", "targetname");
	Array::thread_all(var_757351da, &function_1d6f553d);
	level thread function_e091daa4();
	var_22ee0088 = Array(1, 2, 2, 3, 3, 2, 3, 4, 3, 4, 3, 2, 2, 4, 1);
	var_c957db9f = 0;
	while(var_c957db9f < var_22ee0088.size)
	{
		level waittill("hash_351576b1", var_333c1c87);
		if(var_333c1c87 == var_22ee0088[var_c957db9f])
		{
			var_c957db9f++;
		}
		else
		{
			var_c957db9f = 0;
		}
	}
	level flag::set("snd_zhdegg_activate");
	return;
	var_c957db9f++;
}

/*
	Name: function_1d6f553d
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x3388
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1140
*/
function function_1d6f553d()
{
	level endon("hash_f9e823ac");
	self zm_unitrigger::create_unitrigger();
	while(1)
	{
		self waittill("trigger_activated");
		playsoundatposition("zmb_zhdmoon_button_" + self.script_int, self.origin);
		level notify("hash_351576b1", self.script_int);
		wait(0.5);
	}
}

/*
	Name: function_e091daa4
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x3418
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1163
*/
function function_e091daa4()
{
	level endon("hash_f9e823ac");
	var_924a65e5 = spawn("script_origin", (919, -303, -171));
	while(1)
	{
		wait(RandomFloatRange(60, 120));
		var_924a65e5 playsoundwithnotify("zmb_zhdmoon_voices", "sounddone");
		var_924a65e5 waittill("sounddone");
	}
}

/*
	Name: function_3630300b
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x34C0
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 1185
*/
function function_3630300b()
{
	var_d1f154fd = struct::get_array("s_ballerina_timed", "targetname");
	var_d1f154fd = Array::sort_by_script_int(var_d1f154fd, 1);
	level.n_ballerina_count = 0;
	wait(1);
	foreach(s_ballerina in var_d1f154fd)
	{
		s_ballerina thread function_b8227f87();
		wait(1);
	}
	while(level.n_ballerina_count < var_d1f154fd.size)
	{
		wait(0.1);
	}
	wait(1);
	return 1;
}

/*
	Name: function_b8227f87
	Namespace: zm_moon_amb
	Checksum: 0x424F4353
	Offset: 0x35E8
	Size: 0x124
	Parameters: 0
	Flags: None
	Line Number: 1214
*/
function function_b8227f87()
{
	self.mdl_ballerina = util::spawn_model(self.model, self.origin, self.angles);
	self.mdl_ballerina clientfield::set("snd_zhdegg", 1);
	self.mdl_ballerina PlayLoopSound("mus_musicbox_lp", 2);
	self thread namespace_52adc03e::function_9d55fd08();
	self thread namespace_52adc03e::function_2fdaabf3();
	self util::waittill_any("ballerina_destroyed");
	level.n_ballerina_count++;
	self.mdl_ballerina clientfield::set("snd_zhdegg", 0);
	util::wait_network_frame();
	self.mdl_ballerina delete();
}

