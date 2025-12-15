#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\music_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_42091091;

/*
	Name: __init__sytem__
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x9C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 36
*/
function autoexec __init__sytem__()
{
	system::register("zm_genesis_sound", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0xA08
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __init__()
{
	level.sndPlayStateOverride = &function_de04b701;
}

/*
	Name: main
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0xA30
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 67
*/
function main()
{
	level thread function_ae93bb6d();
	level thread function_7624a208();
}

/*
	Name: function_de04b701
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0xA70
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 83
*/
function function_de04b701(state)
{
	if(!function_b01e339d(state))
	{
		return 0;
	}
	level thread function_69f1cd9e(state);
	return 1;
}

/*
	Name: function_69f1cd9e
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0xAC0
	Size: 0x180
	Parameters: 1
	Flags: None
	Line Number: 103
*/
function function_69f1cd9e(state)
{
	foreach(player in level.players)
	{
		location = player function_5d99d675();
		num = function_d6870cf0(state, location);
		num = randomIntRange(1, num + 1);
		if(!isdefined(location))
		{
			return;
		}
		if(state == "round_start_short")
		{
			state = "round_start";
		}
		stateName = state + "_" + location;
		if(state != "game_over")
		{
			stateName = stateName + "_" + num;
		}
		music::setmusicstate(stateName, player);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b01e339d
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0xC48
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 139
*/
function function_b01e339d(state)
{
	if(state == "round_start" || state == "round_start_short" || state == "round_end" || state == "game_over")
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_5d99d675
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0xCA8
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 158
*/
function function_5d99d675()
{
	str_player_zone = self zm_zonemgr::get_player_zone();
	if(!isdefined(str_player_zone))
	{
		return "genesis";
	}
	if(IsSubStr(str_player_zone, "zm_tomb"))
	{
		return "tomb";
	}
	if(IsSubStr(str_player_zone, "zm_prison"))
	{
		return "motd";
	}
	if(IsSubStr(str_player_zone, "zm_temple"))
	{
		if(str_player_zone == "zm_temple_undercroft_zone" || str_player_zone == "zm_temple_undercroft2_zone" || str_player_zone == "zm_temple_box_zone")
		{
			return "castle";
		}
		return "temple";
	}
	if(IsSubStr(str_player_zone, "zm_castle"))
	{
		return "castle";
	}
	if(IsSubStr(str_player_zone, "zm_theater"))
	{
		return "theater";
	}
	if(IsSubStr(str_player_zone, "zm_asylum"))
	{
		return "asylum";
	}
	if(IsSubStr(str_player_zone, "zm_prototype"))
	{
		return "prototype";
	}
	return "genesis";
}

/*
	Name: function_d6870cf0
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0xE48
	Size: 0x158
	Parameters: 2
	Flags: None
	Line Number: 210
*/
function function_d6870cf0(state, location)
{
	switch(location)
	{
		case "castle":
		{
			if(state == "round_start")
			{
				return 1;
			}
			if(state == "round_end")
			{
				return 3;
				break;
			}
		}
		case "motd":
		{
			if(state == "round_start")
			{
				return 4;
			}
			if(state == "round_end")
			{
				return 1;
				break;
			}
		}
		case "genesis":
		{
			if(state == "round_start")
			{
				return 3;
			}
			if(state == "round_end")
			{
				return 1;
				break;
			}
		}
		case "tomb":
		{
			if(state == "round_start")
			{
				return 4;
			}
			if(state == "round_end")
			{
				return 1;
			}
		}
		case "theater":
		{
			if(state == "round_start")
			{
				return 2;
			}
			if(state == "round_end")
			{
				return 1;
				break;
			}
		}
	}
	return 1;
}

/*
	Name: function_3fee3760
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0xFA8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 287
*/
function function_3fee3760()
{
	level util::clientNotify("stpThm");
}

/*
	Name: function_ae93bb6d
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0xFD8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 302
*/
function function_ae93bb6d()
{
	var_8e47507d = struct::get_array("sndusescare", "targetname");
	if(!isdefined(var_8e47507d))
	{
		return;
	}
	Array::thread_all(var_8e47507d, &function_d75eac4e);
}

/*
	Name: function_d75eac4e
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x1040
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 322
*/
function function_d75eac4e()
{
	if(self.script_sound == "zmb_usescare_sam_phono")
	{
		self thread function_44448bcb();
		return;
	}
	self zm_unitrigger::create_unitrigger(undefined, 35);
	while(1)
	{
		self waittill("trigger_activated");
		playsoundatposition(self.script_sound, self.origin);
		wait(200);
	}
}

/*
	Name: function_44448bcb
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x10D8
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 348
*/
function function_44448bcb()
{
	var_bc15748 = spawn("trigger_radius_use", self.origin, 0, 100, 100);
	var_bc15748 setHintString("");
	var_bc15748 setcursorhint("HINT_NOICON");
	var_bc15748 TriggerIgnoreTeam();
	var_bc15748 UseTriggerRequireLookAt();
	var_bc15748 waittill("trigger");
	var_bc15748 playsound(self.script_sound);
	wait(120);
	var_bc15748 delete();
}

/*
	Name: function_b18c11d8
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x11D0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 371
*/
function function_b18c11d8()
{
	level function_4b776d12();
	level thread function_8554d5da();
}

/*
	Name: function_8554d5da
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x1210
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 387
*/
function function_8554d5da()
{
	var_d0a6531d = struct::get("old_school_radio", "targetname");
	if(!isdefined(var_d0a6531d))
	{
		return;
	}
	var_99ff4537 = util::spawn_model(var_d0a6531d.model, var_d0a6531d.origin, var_d0a6531d.angles);
	var_99ff4537 setcandamage(1);
	var_99ff4537 thread function_2d4f4459();
	var_99ff4537 thread function_f184004e();
	while(1)
	{
		var_99ff4537.health = 1000000;
		var_99ff4537 waittill("damage", damage, attacker, dir, loc, type, model, tag, part, weapon, flags);
		if(!isdefined(attacker) || !isPlayer(attacker))
		{
			continue;
		}
		if(type == "MOD_GRENADE_SPLASH" || type == "MOD_PROJECTILE")
		{
			continue;
		}
		if(type == "MOD_MELEE")
		{
			var_99ff4537 notify("hash_dec13539");
		}
		else
		{
			var_99ff4537 notify("hash_34d24635");
		}
	}
}

/*
	Name: function_2d4f4459
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x1410
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 431
*/
function function_2d4f4459()
{
	self.Trackname = undefined;
	self.var_63f35de2 = 0;
	while(1)
	{
		self waittill("hash_34d24635");
		if(isdefined(self.var_175c09e5))
		{
			self stopsound(self.var_175c09e5);
			wait(0.05);
		}
		self playsoundwithnotify("zmb_minor_skool_radio_switch", "sounddone");
		self waittill("sounddone");
		self thread function_c62f1c37();
	}
}

/*
	Name: function_c62f1c37
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x14C0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 459
*/
function function_c62f1c37()
{
	self endon("hash_34d24635");
	self endon("hash_dec13539");
	self playsoundwithnotify(level.var_2ec01df2[self.var_63f35de2], "songdone");
	self.var_175c09e5 = level.var_2ec01df2[self.var_63f35de2];
	self.var_63f35de2++;
	if(self.var_63f35de2 >= level.var_2ec01df2.size)
	{
		self.var_63f35de2 = 0;
	}
	self waittill("hash_2e6aeba2");
	self notify("hash_34d24635");
}

/*
	Name: function_f184004e
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x1568
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 484
*/
function function_f184004e()
{
	while(1)
	{
		self waittill("hash_dec13539");
		self playsoundwithnotify("zmb_minor_skool_radio_off", "sounddone");
		if(isdefined(self.var_175c09e5))
		{
			self stopsound(self.var_175c09e5);
		}
	}
}

/*
	Name: function_4b776d12
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x15D8
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 507
*/
function function_4b776d12()
{
	level.var_2ec01df2 = Array("mus_genesis_radio_track_1", "mus_genesis_radio_track_2", "mus_genesis_radio_track_3", "mus_genesis_radio_track_4", "mus_genesis_radio_track_5", "mus_genesis_radio_track_6", "mus_genesis_radio_track_7", "mus_genesis_radio_track_8", "mus_genesis_radio_track_9", "mus_genesis_radio_track_10", "mus_genesis_radio_track_11", "mus_genesis_radio_track_12", "mus_genesis_radio_track_13", "mus_genesis_radio_track_14", "mus_genesis_radio_track_15", "mus_genesis_radio_track_16", "mus_genesis_radio_track_17", "mus_genesis_radio_track_18", "mus_genesis_radio_track_19", "mus_genesis_radio_track_20", "mus_genesis_radio_track_21", "mus_genesis_radio_track_22", "mus_genesis_radio_track_23", "mus_genesis_radio_track_24", "mus_genesis_radio_track_25", "mus_genesis_radio_track_26", "mus_genesis_radio_track_27", "mus_genesis_radio_track_28", "mus_genesis_radio_track_29", "mus_genesis_radio_track_30", "mus_genesis_radio_track_31", "mus_genesis_radio_track_33", "mus_genesis_radio_track_32");
}

/*
	Name: function_7624a208
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x1708
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 522
*/
function function_7624a208()
{
	level.var_51d5c50c = 0;
	level.var_c911c0a2 = struct::get_array("side_ee_song_bear", "targetname");
	Array::thread_all(level.var_c911c0a2, &function_4b02c768);
	while(1)
	{
		level waittill("hash_c3f82290");
		if(level.var_51d5c50c == level.var_c911c0a2.size)
		{
			break;
		}
	}
	level thread function_3fee3760();
	level thread zm_audio::sndmusicsystem_playstate("the_gift");
	wait(1);
	while(isdefined(level.musicsystem.currentstate))
	{
		wait(1);
	}
	level util::clientNotify("strtthm");
	return;
}

/*
	Name: function_4b02c768
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x1820
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 556
*/
function function_4b02c768()
{
	e_origin = spawn("script_origin", self.origin);
	e_origin zm_unitrigger::create_unitrigger();
	e_origin PlayLoopSound("zmb_ee_mus_lp", 1);
	while(!(isdefined(e_origin.b_activated) && e_origin.b_activated))
	{
		e_origin waittill("trigger_activated");
		if(isdefined(level.musicsystem.currentplaytype) && level.musicsystem.currentplaytype >= 4 || (isdefined(level.musicsystemoverride) && level.musicsystemoverride))
		{
			continue;
		}
		e_origin activate_bear();
	}
	zm_unitrigger::unregister_unitrigger(e_origin.s_unitrigger);
	e_origin delete();
}

/*
	Name: activate_bear
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x1960
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 584
*/
function activate_bear()
{
	if(!(isdefined(self.b_activated) && self.b_activated))
	{
		self.b_activated = 1;
		level.var_51d5c50c++;
		level notify("hash_c3f82290");
		self StopLoopSound(0.2);
	}
	self playsound("zmb_ee_mus_activate");
}

/*
	Name: function_936d084f
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x19E8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 606
*/
function function_936d084f()
{
	level.musicsystemoverride = 1;
	music::setmusicstate("bossrush");
}

/*
	Name: function_e9341208
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x1A20
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 622
*/
function function_e9341208()
{
	level.musicsystemoverride = 1;
	music::setmusicstate("finalfight_start");
}

/*
	Name: function_ecd49d9c
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x1A58
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 638
*/
function function_ecd49d9c()
{
	level.musicsystemoverride = 1;
	music::setmusicstate("finalfight");
}

/*
	Name: function_d73dcf42
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x1A90
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 654
*/
function function_d73dcf42()
{
	level.musicsystemoverride = 0;
	music::setmusicstate("none");
}

/*
	Name: function_c2fa1ebc
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x1AC8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 670
*/
function function_c2fa1ebc()
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	Array::thread_all(vending_triggers, &function_1d3f00e6);
	return;
}

/*
	Name: function_1d3f00e6
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x1B28
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 687
*/
function function_1d3f00e6()
{
	self endon("hash_55cf60a4");
	var_3628045a = function_692ac4e1(self.script_noteworthy);
	if(!isdefined(var_3628045a))
	{
		return;
	}
	var_326ccfe3 = self.bump;
	for(;;)
	{
		var_326ccfe3 waittill("trigger", e_player);
		if(isdefined(e_player) && isPlayer(e_player))
		{
			if(isdefined(e_player.perks_active) && e_player.perks_active.size == 9 && (isdefined(self.sndJingleActive) && self.sndJingleActive))
			{
				e_player thread function_97997a8c(self, var_326ccfe3, var_3628045a);
				while(e_player istouching(var_326ccfe3))
				{
					wait(0.05);
				}
				e_player notify("hash_56e16440");
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_97997a8c
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x1C68
	Size: 0x130
	Parameters: 3
	Flags: None
	Line Number: 725
*/
function function_97997a8c(perk_machine, var_326ccfe3, var_3628045a)
{
	self endon("death");
	self endon("disconnect");
	self endon("player_downed");
	self endon("hash_56e16440");
	while(!self meleeButtonPressed())
	{
		wait(0.05);
	}
	perk_machine notify("hash_55cf60a4");
	perk_machine.sndJingleCooldown = 1;
	perk_machine.var_1afc1154 = 1;
	perk_machine stopsound(perk_machine.str_jingle_alias);
	perk_machine playsound("vox_lyrics_bump");
	playsoundatposition(var_3628045a, var_326ccfe3.origin);
	wait(60);
	perk_machine.var_1afc1154 = 0;
	perk_machine.sndJingleCooldown = 0;
	return;
}

/*
	Name: function_692ac4e1
	Namespace: namespace_42091091
	Checksum: 0x424F4353
	Offset: 0x1DA0
	Size: 0x8A
	Parameters: 1
	Flags: None
	Line Number: 757
*/
function function_692ac4e1(perk)
{
	switch(perk)
	{
		case "specialty_doubletap2":
		{
			str_alias = "vox_lyrics_dt";
			break;
		}
		case "specialty_armorvest":
		{
			str_alias = "vox_lyrics_jugg";
			break;
		}
		case "specialty_quickrevive":
		{
			str_alias = "vox_lyrics_revive";
			break;
		}
		case "specialty_fastreload":
		{
			str_alias = "vox_lyrics_speed";
			break;
		}
	}
	return str_alias;
}

