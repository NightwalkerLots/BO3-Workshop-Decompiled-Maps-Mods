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
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_island_power;
#include scripts\zm\zm_island_util;

#namespace namespace_716ba43f;

/*
	Name: __init__sytem__
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x4A8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 36
*/
function autoexec __init__sytem__()
{
	system::register("zm_island_side_ee_song", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x4E8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function __init__()
{
}

/*
	Name: main
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x4F8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 65
*/
function main()
{
	/#
		level thread function_88ab6cf8();
	#/
	level thread function_553b8e23();
	level thread function_222dc6f4();
	level thread function_76bcb530();
	level thread function_ae93bb6d();
}

/*
	Name: on_player_spawned
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x580
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 86
*/
function on_player_spawned()
{
}

/*
	Name: function_553b8e23
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x590
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 100
*/
function function_553b8e23()
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
	level thread zm_audio::sndmusicsystem_playstate("dead_flowers");
	level thread audio::unlockfrontendmusic("mus_dead_flowers_intro");
	return;
	.var_0 = undefined;
}

/*
	Name: function_4b02c768
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x670
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 129
*/
function function_4b02c768()
{
	e_origin = spawn("script_origin", self.origin);
	e_origin zm_unitrigger::create_unitrigger();
	e_origin PlayLoopSound("zmb_ee_mus_lp", 1);
	/#
		e_origin thread namespace_8aed53c9::function_8faf1d24(VectorScale((0, 0, 1), 255), "Dev Block strings are not supported");
	#/
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
}

/*
	Name: activate_bear
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x7C8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 159
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
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_88ab6cf8
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x850
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 183
*/
function function_88ab6cf8()
{
	/#
		zm_devgui::function_4acecab5(&function_aed87222);
		AddDebugCommand("Dev Block strings are not supported");
		AddDebugCommand("Dev Block strings are not supported");
		AddDebugCommand("Dev Block strings are not supported");
	#/
}

/*
	Name: function_aed87222
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x8D0
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 203
*/
function function_aed87222(cmd)
{
	/#
		switch(cmd)
		{
			case "Dev Block strings are not supported":
			{
				level.var_c911c0a2[0] activate_bear();
				return 1;
			}
			case "Dev Block strings are not supported":
			{
				level.var_c911c0a2[1] activate_bear();
				return 1;
			}
			case "Dev Block strings are not supported":
			{
				level.var_c911c0a2[2] activate_bear();
				return 1;
			}
		}
		return 0;
	#/
}

/*
	Name: function_222dc6f4
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x990
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 238
*/
function function_222dc6f4()
{
	locations = Array((-114.98, 5300.02, -615.31), (1104, 4637.37, -493.965), (-1175.08, 2711.62, -379.708), (-2139.84, 633.162, 141), (2804.92, 798.876, -144.977));
	for(i = 0; i < locations.size; i++)
	{
		level thread function_4824fe93(locations[i], i + 1);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4824fe93
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0xA88
	Size: 0x108
	Parameters: 2
	Flags: None
	Line Number: 259
*/
function function_4824fe93(origin, num)
{
	s_origin = spawnstruct();
	s_origin.origin = origin;
	s_origin zm_unitrigger::create_unitrigger();
	/#
		s_origin thread namespace_8aed53c9::function_8faf1d24(VectorScale((0, 0, 1), 255), "Dev Block strings are not supported");
	#/
	s_origin waittill("trigger_activated");
	zm_unitrigger::unregister_unitrigger(s_origin.s_unitrigger);
	sound = "vox_maxis_maxis_radio_" + num;
	thread namespace_cc012897::Send(sound);
	playsoundatposition(sound, origin);
}

/*
	Name: function_76bcb530
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0xB98
	Size: 0x2D8
	Parameters: 0
	Flags: None
	Line Number: 284
*/
function function_76bcb530()
{
	level.var_eeab4a07 = 0;
	var_f59c3cb2 = GetEntArray("plantMusicPods", "targetname");
	if(!isdefined(var_f59c3cb2))
	{
		return;
	}
	var_f59c3cb2 = Array::sort_by_script_int(var_f59c3cb2, 1);
	foreach(POD in var_f59c3cb2)
	{
		POD thread function_69208549();
	}
	var_f918ed35 = struct::get("plantMusicPlay", "targetname");
	var_f918ed35 zm_unitrigger::create_unitrigger(undefined, 24);
	var_be2a0077 = Array(1, 3, 5, 6, 7, 5);
	while(1)
	{
		var_f918ed35 waittill("trigger_activated");
		playsoundatposition("zmb_pod_play", var_f918ed35.origin);
		level.var_eeab4a07 = 1;
		a_n_pattern = function_c5359566();
		match = 1;
		for(i = 0; i < a_n_pattern.size; i++)
		{
			if(a_n_pattern[i] != var_be2a0077[i])
			{
				match = 0;
				break;
			}
		}
		if(isdefined(match) && match)
		{
			level function_88572b8();
		}
		else
		{
			for(i = 0; i < var_f59c3cb2.size; i++)
			{
				var_f59c3cb2[i] playsound("mus_podegg_note_" + var_f59c3cb2[i].var_b3a7fe6c);
				wait(0.6);
			}
		}
		level.var_eeab4a07 = 0;
	}
}

/*
	Name: function_69208549
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0xE78
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 341
*/
function function_69208549()
{
	self.var_b3a7fe6c = 0;
	self thread function_cd6c47c5();
	self thread function_f86f94db();
}

/*
	Name: function_cd6c47c5
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0xEC0
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 358
*/
function function_cd6c47c5()
{
	self.unitrigger_stub = spawnstruct();
	self.unitrigger_stub.origin = self.origin;
	self.unitrigger_stub.angles = self.angles;
	self.unitrigger_stub.script_unitrigger_type = "unitrigger_radius_use";
	self.unitrigger_stub.cursor_hint = "HINT_NOICON";
	self.unitrigger_stub.radius = 16;
	self.unitrigger_stub.require_look_at = 1;
	self.unitrigger_stub.related_parent = self;
	zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &zm_unitrigger::unitrigger_logic);
	while(1)
	{
		self waittill("trigger_activated", who);
		if(isdefined(level.var_eeab4a07) && level.var_eeab4a07)
		{
			continue;
		}
		if(self.var_b3a7fe6c < 8 && (isdefined(who.var_6fd3d65c) && who.var_6fd3d65c) && isdefined(who.var_bb2fd41c) && who.var_bb2fd41c > 0)
		{
			who thread namespace_f3e3de78::function_a84a1aec();
			self.var_b3a7fe6c++;
			self playsound("zmb_pod_fill");
		}
	}
}

/*
	Name: function_f86f94db
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x1088
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 395
*/
function function_f86f94db()
{
	while(1)
	{
		self waittill("damage", damage, attacker, dir, loc, str_type, model, tag, part, weapon, flags);
		if(!isdefined(attacker) || !isPlayer(attacker))
		{
			continue;
		}
		if(isdefined(str_type) && str_type != "MOD_MELEE")
		{
			continue;
		}
		if(isdefined(level.var_eeab4a07) && level.var_eeab4a07)
		{
			continue;
		}
		self.var_b3a7fe6c = 0;
		self playsound("zmb_pod_empty");
	}
}

/*
	Name: function_c5359566
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x11B0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 427
*/
function function_c5359566()
{
	var_f59c3cb2 = GetEntArray("plantMusicPods", "targetname");
	var_5b979d9 = Array::sort_by_script_int(var_f59c3cb2, 1);
	var_6ec57f04 = Array();
	for(i = 0; i < var_5b979d9.size; i++)
	{
		Array::add(var_6ec57f04, var_5b979d9[i].var_b3a7fe6c);
	}
	return var_6ec57f04;
}

/*
	Name: function_88572b8
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x1290
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 449
*/
function function_88572b8()
{
	var_1d1c464d = Array(0, 1, 2, 3, 4, 5, 3, 4);
	var_5c996589 = Array(0, 1, 2, 3, 4, 3, 4);
	var_f59c3cb2 = GetEntArray("plantMusicPods", "targetname");
	var_f59c3cb2 = Array::sort_by_script_int(var_f59c3cb2, 1);
	n_repetitions = 3;
	n_waittime = 0.55;
	while(n_repetitions > 0)
	{
		for(i = 0; i < var_1d1c464d.size; i++)
		{
			var_f59c3cb2[var_1d1c464d[i]] playsound("mus_podegg_note_" + var_f59c3cb2[var_1d1c464d[i]].var_b3a7fe6c);
			wait(n_waittime);
			n_waittime = n_waittime - 0.01;
		}
		n_repetitions--;
	}
	for(i = 0; i < var_5c996589.size; i++)
	{
		var_f59c3cb2[var_5c996589[i]] playsound("mus_podegg_note_" + var_f59c3cb2[var_5c996589[i]].var_b3a7fe6c);
		wait(n_waittime);
		n_waittime = n_waittime - 0.01;
	}
	wait(n_waittime);
	var_f59c3cb2[3] playsoundwithnotify("mus_podegg_lullaby", "sounddone");
	wait(103);
}

/*
	Name: function_ae93bb6d
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x14E8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 488
*/
function function_ae93bb6d()
{
	var_8e47507d = struct::get_array("sndusescare", "targetname");
	var_f45614a = struct::get_array("sndusescareTube", "targetname");
	if(!isdefined(var_8e47507d))
	{
		return;
	}
	Array::thread_all(var_8e47507d, &function_d75eac4e);
	level thread function_e01c1b04(var_f45614a);
}

/*
	Name: function_d75eac4e
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x1598
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 510
*/
function function_d75eac4e()
{
	self zm_unitrigger::create_unitrigger(undefined, 24);
	while(1)
	{
		self waittill("trigger_activated");
		playsoundatposition(self.script_sound, self.origin);
		wait(200);
	}
}

/*
	Name: function_e01c1b04
	Namespace: namespace_716ba43f
	Checksum: 0x424F4353
	Offset: 0x1600
	Size: 0xEE
	Parameters: 1
	Flags: None
	Line Number: 531
*/
function function_e01c1b04(var_f45614a)
{
	if(var_f45614a.size <= 0)
	{
		return;
	}
	while(1)
	{
		var_4237d65e = randomIntRange(0, var_f45614a.size);
		var_f45614a[var_4237d65e] zm_unitrigger::create_unitrigger(undefined, 24);
		var_f45614a[var_4237d65e] waittill("trigger_activated");
		playsoundatposition(var_f45614a[var_4237d65e].script_sound, var_f45614a[var_4237d65e].origin);
		zm_unitrigger::unregister_unitrigger(var_f45614a[var_4237d65e].unitrigger);
		wait(150);
	}
}

