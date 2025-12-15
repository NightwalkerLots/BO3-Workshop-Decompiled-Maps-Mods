#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_audio_zhd;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_zonemgr;

#namespace zm_tomb_amb;

/*
	Name: init
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x4C0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 28
*/
function init()
{
	clientfield::register("toplayer", "sndEggElements", 21000, 1, "int");
	level.var_61f315ab = &function_3630300b;
	level.var_8229c449 = &function_231d9741;
	level.zmAnnouncerPrefix = "vox_zmbat_";
	return;
}

/*
	Name: main
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x540
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 47
*/
function main()
{
	level thread sndmusicegg();
	level thread snd115egg();
	level thread sndstingersetup();
	level thread sndmaelstrom();
	level thread function_45b4acf2();
}

/*
	Name: sndstingersetup
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x5C8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function sndstingersetup()
{
	level.sndroundwait = 1;
	level flag::wait_till("start_zombie_round_logic");
	level sndstingersetupstates();
	level thread sndstingerroundwait();
	level thread locationstingerwait();
	level thread snddoormusictrigs();
}

/*
	Name: sndstingersetupstates
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x660
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 86
*/
function sndstingersetupstates()
{
	zm_audio::musicState_Create("zone_nml_farm", 4, "location_farmhouse");
	zm_audio::musicState_Create("zone_village_0", 4, "location_graveyard");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: locationstingerwait
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x6C0
	Size: 0x198
	Parameters: 2
	Flags: None
	Line Number: 104
*/
function locationstingerwait(zone_name, type)
{
	Array = sndlocationsarray();
	sndnorepeats = 3;
	numCut = 0;
	level.sndLastZone = undefined;
	level.sndlocationplayed = 0;
	level thread sndlocationbetweenroundswait();
	while(1)
	{
		level waittill("newzoneActive", activeZone);
		wait(0.1);
		if(!sndLocationShouldPlay(Array, activeZone))
		{
			continue;
		}
		if(isdefined(level.sndroundwait) && level.sndroundwait)
		{
			continue;
		}
		level thread sndplaystinger(activeZone);
		level.sndlocationplayed = 1;
		Array = sndCurrentLocationArray(Array, activeZone, numCut, sndnorepeats);
		level.sndLastZone = activeZone;
		if(numCut >= sndnorepeats)
		{
			numCut = 0;
		}
		else
		{
			numCut++;
		}
		level waittill("between_round_over");
		while(isdefined(level.sndroundwait) && level.sndroundwait)
		{
			wait(0.1);
		}
		level.sndlocationplayed = 0;
	}
}

/*
	Name: sndlocationsarray
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x860
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 155
*/
function sndlocationsarray()
{
	Array = [];
	Array[0] = "zone_nml_18";
	Array[1] = "zone_nml_farm";
	Array[2] = "zone_village_0";
	Array[3] = "zone_village_2";
	Array[4] = "ug_bottom_zone";
	Array[5] = "zone_air_stairs";
	Array[6] = "zone_fire_stairs";
	Array[7] = "zone_bolt_stairs";
	Array[8] = "zone_ice_stairs";
	return Array;
}

/*
	Name: sndLocationShouldPlay
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x930
	Size: 0x1E0
	Parameters: 2
	Flags: None
	Line Number: 180
*/
function sndLocationShouldPlay(Array, activeZone)
{
	shouldPlay = 0;
	if(!namespace_52adc03e::function_8090042c())
	{
		return shouldPlay;
	}
	foreach(place in Array)
	{
		if(place == activeZone)
		{
			shouldPlay = 1;
		}
	}
	if(shouldPlay == 0)
	{
		return shouldPlay;
	}
	playersinlocal = 0;
	players = GetPlayers();
	foreach(player in players)
	{
		if(player zm_zonemgr::entity_in_zone(activeZone))
		{
			if(!(isdefined(player.afterlife) && player.afterlife))
			{
				playersinlocal++;
			}
		}
	}
	if(playersinlocal >= 1)
	{
		shouldPlay = 1;
	}
	else
	{
		shouldPlay = 0;
	}
	return shouldPlay;
}

/*
	Name: sndstingerroundwait
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0xB18
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 231
*/
function sndstingerroundwait()
{
	wait(25);
	level.sndroundwait = 0;
	while(1)
	{
		level waittill("end_of_round");
		level thread sndstingerroundwait_start();
	}
}

/*
	Name: sndstingerroundwait_start
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0xB60
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 252
*/
function sndstingerroundwait_start()
{
	level.sndroundwait = 1;
	wait(0.05);
	level thread sndstingerroundwait_end();
}

/*
	Name: sndstingerroundwait_end
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0xB98
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 269
*/
function sndstingerroundwait_end()
{
	level endon("end_of_round");
	level waittill("between_round_over");
	wait(28);
	level.sndroundwait = 0;
}

/*
	Name: sndCurrentLocationArray
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0xBD0
	Size: 0xF0
	Parameters: 4
	Flags: None
	Line Number: 287
*/
function sndCurrentLocationArray(current_array, activeZone, numCut, max_num_removed)
{
	if(numCut >= max_num_removed)
	{
		current_array = sndlocationsarray();
	}
	foreach(place in current_array)
	{
		if(place == activeZone)
		{
			ArrayRemoveValue(current_array, place);
			break;
		}
	}
	return current_array;
}

/*
	Name: sndlocationbetweenrounds
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0xCC8
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 314
*/
function sndlocationbetweenrounds()
{
	level endon("newzoneActive");
	activezones = zm_zonemgr::get_active_zone_names();
	foreach(zone in activezones)
	{
		if(isdefined(level.sndLastZone) && zone == level.sndLastZone)
		{
			continue;
		}
		players = GetPlayers();
		foreach(player in players)
		{
			if(player zm_zonemgr::entity_in_zone(zone))
			{
				wait(0.1);
				level notify("newzoneActive", zone);
				return;
			}
		}
	}
}

/*
	Name: sndlocationbetweenroundswait
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0xE58
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 347
*/
function sndlocationbetweenroundswait()
{
	while(isdefined(level.sndroundwait) && level.sndroundwait)
	{
		wait(0.1);
	}
	while(1)
	{
		level thread sndlocationbetweenrounds();
		level waittill("between_round_over");
		while(isdefined(level.sndroundwait) && level.sndroundwait)
		{
			wait(0.1);
		}
	}
}

/*
	Name: sndplaystinger
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0xED8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 374
*/
function sndplaystinger(state)
{
	if(!namespace_52adc03e::function_8090042c())
	{
		return;
	}
	level thread zm_audio::sndmusicsystem_playstate(state);
}

/*
	Name: sndplaystingerwithoverride
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0xF20
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 393
*/
function sndplaystingerwithoverride(state, var_70f98722)
{
	if(!namespace_52adc03e::function_8090042c())
	{
		return;
	}
	level thread zm_audio::sndmusicsystem_playstate(state);
}

/*
	Name: snddoormusictrigs
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0xF70
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 412
*/
function snddoormusictrigs()
{
	trigs = GetEntArray("sndMusicDoor", "script_noteworthy");
	foreach(trig in trigs)
	{
		trig thread snddoormusic();
	}
}

/*
	Name: snddoormusic
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x1030
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 431
*/
function snddoormusic()
{
	self endon("sndDoorMusic_Triggered");
	while(1)
	{
		self waittill("trigger");
		if(!namespace_52adc03e::function_8090042c())
		{
			wait(0.1);
			continue;
			break;
		}
		else
		{
		}
	}
	if(isdefined(self.target))
	{
		ent = GetEnt(self.target, "targetname");
		ent notify("sndDoorMusic_Triggered");
	}
	level thread sndplaystingerwithoverride(self.script_sound);
	return;
}

/*
	Name: sndmaelstrom
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x10F0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 466
*/
function sndmaelstrom()
{
	trig = GetEnt("sndMaelstrom", "targetname");
	if(!isdefined(trig))
	{
		return;
	}
	while(1)
	{
		trig waittill("trigger", who);
		if(isPlayer(who) && (!(isdefined(who.sndmaelstrom) && who.sndmaelstrom)))
		{
			who.sndmaelstrom = 1;
			who clientfield::set_to_player("sndMaelstrom", 1);
		}
		who thread sndmaelstrom_timeout();
		wait(0.1);
	}
}

/*
	Name: sndmaelstrom_timeout
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x11F0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 496
*/
function sndmaelstrom_timeout()
{
	self notify("sndmaelstrom_timeout");
	self endon("sndmaelstrom_timeout");
	self endon("disconnect");
	wait(2);
	self.sndmaelstrom = 0;
	self clientfield::set_to_player("sndMaelstrom", 0);
	return;
}

/*
	Name: sndmusicegg
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x1258
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 517
*/
function sndmusicegg()
{
	level thread namespace_52adc03e::function_e753d4f();
	level flag::wait_till("snd_song_completed");
	level thread zm_audio::sndmusicsystem_playstate("archangel");
}

/*
	Name: snd115egg
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x12C0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 534
*/
function snd115egg()
{
	n_count = 0;
	level.var_69a8687 = 0;
	var_8bd44282 = struct::get_array("mus115", "targetname");
	Array::thread_all(var_8bd44282, &function_89a607c3);
	while(n_count < 3)
	{
		level waittill("hash_34d7d690");
		n_count++;
	}
	level thread zm_audio::sndmusicsystem_playstate("aether");
	level notify("hash_c598ee9d");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_89a607c3
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x1390
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 561
*/
function function_89a607c3()
{
	level endon("hash_c598ee9d");
	self thread zm_sidequests::fake_use("115_trig_activated", &function_f36e092d);
	self waittill("hash_6a4b75fd");
	playsoundatposition("zmb_ee_mus_activate", self.origin);
	level.var_69a8687++;
	level notify("hash_34d7d690");
}

/*
	Name: function_f36e092d
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x1418
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 581
*/
function function_f36e092d()
{
	if(!namespace_52adc03e::function_8090042c())
	{
		return 0;
	}
	if(self GetStance() != "prone")
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_45b4acf2
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x1460
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 604
*/
function function_45b4acf2()
{
	level thread function_ada4c741();
	level thread function_87c575b6();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ada4c741
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x14A0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 622
*/
function function_ada4c741()
{
	level endon("hash_f9e823ac");
	while(1)
	{
		level waittill("player_zombie_blood", e_player);
		e_player clientfield::set_to_player("sndEggElements", 1);
		e_player thread function_42354338();
	}
}

/*
	Name: function_42354338
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x1518
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 643
*/
function function_42354338()
{
	self endon("death");
	self endon("disconnect");
	self waittill("zombie_blood_over");
	self clientfield::set_to_player("sndEggElements", 0);
}

/*
	Name: function_87c575b6
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x1568
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 661
*/
function function_87c575b6()
{
	var_e5e0779d = struct::get_array("s_zhdegg_elements", "targetname");
	if(var_e5e0779d.size <= 0)
	{
		return;
	}
	Array::thread_all(var_e5e0779d, &function_66aff463);
	for(var_f2633d7f = 0; var_f2633d7f < var_e5e0779d.size; var_f2633d7f++)
	{
		level waittill("hash_556250a8");
	}
	level flag::set("snd_zhdegg_activate");
}

/*
	Name: function_66aff463
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x1628
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 686
*/
function function_66aff463()
{
	var_8e7ce497 = spawn("trigger_damage", self.origin, 0, 15, 50);
	while(1)
	{
		var_8e7ce497 waittill("damage", amount, inflictor, direction, point, type, tagName, modelName, partName, weapon);
		if(isPlayer(inflictor) && IsSubStr(weapon.name, "staff_" + self.script_string))
		{
			level notify("hash_556250a8");
			level util::clientNotify("snd" + self.script_string);
			break;
		}
	}
	var_8e7ce497 delete();
}

/*
	Name: function_3630300b
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x1788
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 712
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
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x18B0
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 741
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
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_231d9741
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x19E0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 767
*/
function function_231d9741()
{
	playsoundatposition("zmb_sam_egg_success", (0, 0, 0));
	wait(3);
	var_2ba18547 = struct::get("s_ballerina_end", "targetname");
	var_2ba18547 thread function_69f032ca();
	var_2ba18547 waittill("hash_3a53ac43");
	zm_powerups::specific_powerup_drop("full_ammo", var_2ba18547.origin);
	level flag::set("snd_zhdegg_completed");
}

/*
	Name: function_69f032ca
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x1AB0
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 788
*/
function function_69f032ca()
{
	self endon("hash_34014bea");
	self.mdl_ballerina = util::spawn_model(self.model, self.origin, self.angles);
	self.mdl_ballerina clientfield::set("snd_zhdegg", 1);
	self thread namespace_52adc03e::function_9d55fd08();
	self.mdl_ballerina PlayLoopSound("mus_musicbox_lp", 2);
	var_209d26c2 = struct::get(self.target, "targetname");
	self thread function_bec55ee6();
	self.mdl_ballerina moveto(var_209d26c2.origin, 25, 10);
	self.mdl_ballerina waittill("movedone");
	self notify("hash_3a53ac43");
	self.mdl_ballerina clientfield::set("snd_zhdegg", 0);
	util::wait_network_frame();
	self.mdl_ballerina delete();
	return;
}

/*
	Name: function_bec55ee6
	Namespace: zm_tomb_amb
	Checksum: 0x424F4353
	Offset: 0x1C38
	Size: 0x1C4
	Parameters: 0
	Flags: None
	Line Number: 816
*/
function function_bec55ee6()
{
	self endon("hash_3a53ac43");
	self.mdl_ballerina setcandamage(1);
	self.mdl_ballerina.health = 1000000;
	while(1)
	{
		self.mdl_ballerina waittill("damage", damage, attacker, dir, loc, type, model, tag, part, weapon, flags);
		if(!isdefined(attacker) || !isPlayer(attacker))
		{
			continue;
		}
		if(type == "MOD_PROJECTILE" || type == "MOD_GRENADE_SPLASH" || type == "MOD_GRENADE" || type == "MOD_EXPLOSIVE")
		{
			continue;
		}
		self notify("hash_34014bea");
		self.mdl_ballerina clientfield::set("snd_zhdegg", 0);
		util::wait_network_frame();
		self.mdl_ballerina delete();
		self thread function_69f032ca();
		break;
	}
}

