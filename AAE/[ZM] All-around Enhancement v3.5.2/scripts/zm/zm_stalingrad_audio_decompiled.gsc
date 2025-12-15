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
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_stalingrad_dragon;

#namespace namespace_b73d41a1;

/*
	Name: __init__sytem__
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x620
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 37
*/
function autoexec __init__sytem__()
{
	system::register("zm_stalingrad_audio", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x660
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __init__()
{
	clientfield::register("scriptmover", "ee_anthem_pa", 12000, 1, "int");
	clientfield::register("scriptmover", "ee_ballerina", 12000, 2, "int");
	level flag::init("ballerina_ready");
	level.var_bf88fef7 = 0;
	level.var_a31a784f = [];
	level.monkey_song_override = &function_24ff7a78;
}

/*
	Name: main
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x720
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function main()
{
	level thread function_af4c67d();
	level thread function_41f49ee8();
	level thread function_5c7f73da();
	level thread function_7584d453();
	level thread function_663128e3();
	level thread function_ae93bb6d();
}

/*
	Name: on_player_spawned
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x7C0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function on_player_spawned()
{
}

/*
	Name: function_af4c67d
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x7D0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_af4c67d()
{
	level.var_c128c3f5 = 0;
	level.var_9d74f1a7 = struct::get_array("side_ee_song_vodka", "targetname");
	Array::thread_all(level.var_9d74f1a7, &function_5583a127);
	while(1)
	{
		level waittill("hash_9727ab41");
		if(level.var_c128c3f5 == level.var_9d74f1a7.size)
		{
			break;
		}
	}
	level thread zm_audio::sndmusicsystem_playstate("dead_ended");
}

/*
	Name: function_5583a127
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x890
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 132
*/
function function_5583a127()
{
	e_origin = spawn("script_origin", self.origin);
	e_origin zm_unitrigger::create_unitrigger();
	e_origin PlayLoopSound("zmb_ee_mus_lp", 1);
	/#
		e_origin thread function_8faf1d24(VectorScale((0, 0, 1), 255), "Dev Block strings are not supported");
	#/
	while(!(isdefined(e_origin.b_activated) && e_origin.b_activated))
	{
		e_origin waittill("trigger_activated");
		if(isdefined(level.musicsystem.currentplaytype) && level.musicsystem.currentplaytype >= 4 || (isdefined(level.musicsystemoverride) && level.musicsystemoverride))
		{
			continue;
		}
		e_origin function_81b46338();
	}
	zm_unitrigger::unregister_unitrigger(e_origin.s_unitrigger);
	e_origin delete();
}

/*
	Name: function_81b46338
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0xA00
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 163
*/
function function_81b46338()
{
	if(!(isdefined(self.b_activated) && self.b_activated))
	{
		self.b_activated = 1;
		level.var_c128c3f5++;
		level notify("hash_9727ab41");
		self StopLoopSound(0.2);
	}
	self playsound("zmb_ee_mus_activate");
}

/*
	Name: function_41f49ee8
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0xA88
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function function_41f49ee8()
{
	level.var_62e63d78 = 0;
	level.var_68982832 = struct::get_array("side_ee_song_card", "targetname");
	Array::thread_all(level.var_68982832, &function_f021c688);
	while(1)
	{
		level waittill("hash_ce64d360");
		if(level.var_62e63d78 == level.var_68982832.size)
		{
			break;
		}
	}
	level thread zm_audio::sndmusicsystem_playstate("ace_of_spades");
}

/*
	Name: function_f021c688
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0xB48
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 211
*/
function function_f021c688()
{
	self zm_unitrigger::create_unitrigger();
	/#
		self thread function_8faf1d24(VectorScale((0, 0, 1), 255), "Dev Block strings are not supported");
	#/
	while(!(isdefined(self.b_activated) && self.b_activated))
	{
		self waittill("trigger_activated");
		if(isdefined(level.musicsystem.currentplaytype) && level.musicsystem.currentplaytype >= 4 || (isdefined(level.musicsystemoverride) && level.musicsystemoverride))
		{
			continue;
		}
		self.b_activated = 1;
		level.var_62e63d78++;
		level notify("hash_ce64d360");
		playsoundatposition("zmb_card_activate", self.origin);
	}
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
}

/*
	Name: function_8faf1d24
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0xC68
	Size: 0x108
	Parameters: 4
	Flags: None
	Line Number: 242
*/
function function_8faf1d24(v_color, str_print, n_scale, str_endon)
{
	/#
		if(!isdefined(v_color))
		{
			v_color = VectorScale((0, 0, 1), 255);
		}
		if(!isdefined(str_print))
		{
			str_print = "Dev Block strings are not supported";
		}
		if(!isdefined(n_scale))
		{
			n_scale = 0.25;
		}
		if(!isdefined(str_endon))
		{
			str_endon = "Dev Block strings are not supported";
		}
		if(GetDvarInt("Dev Block strings are not supported") == 0)
		{
			return;
		}
		if(isdefined(str_endon))
		{
			self endon(str_endon);
		}
		origin = self.origin;
		while(1)
		{
			print3d(origin, str_print, v_color, n_scale);
			wait(0.1);
		}
	#/
}

/*
	Name: function_ae93bb6d
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0xD78
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 288
*/
function function_ae93bb6d()
{
	var_8e47507d = struct::get_array("creepyyuse", "targetname");
	if(!isdefined(var_8e47507d))
	{
		return;
	}
	Array::thread_all(var_8e47507d, &function_d75eac4e);
}

/*
	Name: function_d75eac4e
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0xDE0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 308
*/
function function_d75eac4e()
{
	self zm_unitrigger::create_unitrigger(undefined, 50);
	while(1)
	{
		self waittill("trigger_activated");
		playsoundatposition(self.script_sound, self.origin);
		wait(200);
	}
}

/*
	Name: function_e01c1b04
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0xE48
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 329
*/
function function_e01c1b04(var_99ad39b9)
{
	if(var_99ad39b9.size <= 0)
	{
		return;
	}
	while(1)
	{
		var_4237d65e = randomIntRange(0, var_99ad39b9.size);
		var_99ad39b9[var_4237d65e] zm_unitrigger::create_unitrigger(undefined, 24);
		var_99ad39b9[var_4237d65e] waittill("trigger_activated");
		playsoundatposition(var_99ad39b9[var_4237d65e].script_sound, var_99ad39b9[var_4237d65e].origin);
		zm_unitrigger::unregister_unitrigger(var_99ad39b9[var_4237d65e].unitrigger);
		wait(150);
	}
}

/*
	Name: function_5c7f73da
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0xF40
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 356
*/
function function_5c7f73da()
{
	for(i = 1; i < 6; i++)
	{
		a_s_reels = struct::get_array("ee_sophia_reels_" + i, "targetname");
		if(a_s_reels.size <= 0)
		{
			return;
		}
		foreach(var_7b352087 in a_s_reels)
		{
			var_de6d4fc0 = util::spawn_model(var_7b352087.model, var_7b352087.origin, var_7b352087.angles);
			var_7b352087.var_de6d4fc0 = var_de6d4fc0;
			var_7b352087.var_de6d4fc0 thread function_e464aa51();
		}
		if(i == 5)
		{
			level thread function_8c75c164(a_s_reels, i);
			continue;
		}
		level thread function_ab32c346(a_s_reels, i);
	}
}

/*
	Name: function_ab32c346
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x10E8
	Size: 0xE0
	Parameters: 2
	Flags: None
	Line Number: 390
*/
function function_ab32c346(a_s_reels, var_bee8e45)
{
	a_s_reels[0] zm_unitrigger::create_unitrigger();
	while(1)
	{
		a_s_reels[0] waittill("trigger_activated", who);
		if(!who zm_utility::is_player_looking_at(a_s_reels[0].origin))
		{
			continue;
		}
		function_ccdb680e(a_s_reels, 1);
		a_s_reels[0].var_de6d4fc0 function_8e130ce5(var_bee8e45);
		function_ccdb680e(a_s_reels, 0);
	}
}

/*
	Name: function_8c75c164
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x11D0
	Size: 0x180
	Parameters: 2
	Flags: None
	Line Number: 416
*/
function function_8c75c164(a_s_reels, var_bee8e45)
{
	a_s_reels[0].var_de6d4fc0 setcandamage(1);
	while(1)
	{
		a_s_reels[0].var_de6d4fc0.health = 1000000;
		a_s_reels[0].var_de6d4fc0 waittill("damage", damage, attacker, dir, loc, type, model, tag, part, weapon, flags);
		if(!isdefined(attacker) || !isPlayer(attacker))
		{
			continue;
		}
		function_ccdb680e(a_s_reels, 1);
		a_s_reels[0].var_de6d4fc0 function_8e130ce5(var_bee8e45);
		function_ccdb680e(a_s_reels, 0);
	}
}

/*
	Name: function_8e130ce5
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x1358
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 443
*/
function function_8e130ce5(var_bee8e45)
{
	sound = "vox_soph_sophia_log_" + var_bee8e45;
	thread namespace_cc012897::Send(sound);
	self playsoundwithnotify(sound, "sounddone");
	if(var_bee8e45 == 2)
	{
		self playsound("zmb_sophia_log_2_sfx");
	}
	self waittill("sounddone");
}

/*
	Name: function_ccdb680e
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x13F0
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 465
*/
function function_ccdb680e(a_s_reels, b_on)
{
	foreach(var_7b352087 in a_s_reels)
	{
		if(isdefined(var_7b352087.var_de6d4fc0))
		{
			var_7b352087.var_de6d4fc0.var_a02b0d5a = b_on;
		}
	}
}

/*
	Name: function_e464aa51
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x14B0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 486
*/
function function_e464aa51()
{
	while(1)
	{
		if(isdefined(self.var_a02b0d5a) && self.var_a02b0d5a)
		{
			self RotateRoll(-30, 0.2);
		}
		wait(0.2);
	}
}

/*
	Name: function_7584d453
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x1508
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 508
*/
function function_7584d453()
{
	level waittill("hash_9b1cee4c");
	var_18b908ea = spawn("script_origin", (0, 0, 0));
	var_18b908ea PlayLoopSound("zmb_outro_battle_bg", 1);
	level waittill("hash_846351df");
	var_18b908ea StopLoopSound(1);
	var_18b908ea delete();
	return;
	ERROR: Bad function call
}

/*
	Name: function_f1ce2a9a
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x15B0
	Size: 0x158
	Parameters: 1
	Flags: None
	Line Number: 530
*/
function function_f1ce2a9a(state)
{
	if(!isdefined(state))
	{
		state = 0;
	}
	level endon("end_game");
	switch(state)
	{
		case 1:
		{
			level.musicsystemoverride = 1;
			music::setmusicstate("none");
			level thread function_61c5cb4e();
			break;
		}
		case 2:
		{
			level thread function_9fa22cf7();
			music::setmusicstate("ace_of_spades");
			level thread function_d0e8b85d();
			break;
		}
		case 3:
		{
			level thread function_9fa22cf7();
			music::setmusicstate("nikolai_fight");
			break;
		}
		case 4:
		{
			level thread function_9fa22cf7();
			music::setmusicstate("none");
			level.musicsystemoverride = 0;
			break;
		}
	}
}

/*
	Name: function_61c5cb4e
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x1710
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 579
*/
function function_61c5cb4e()
{
	level endon("hash_787a404e");
	var_4540293a = struct::get_array("s_anthem_array", "targetname");
	level.var_96d76bfc = 0;
	level.var_c9c5dfcc = var_4540293a.size;
	foreach(anthem_pa in var_4540293a)
	{
		anthem_pa thread function_3b8ba4e9();
	}
	wait(68.7);
	level thread function_f1ce2a9a(3);
}

/*
	Name: function_3b8ba4e9
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x1818
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 603
*/
function function_3b8ba4e9()
{
	level endon("hash_787a404e");
	self.var_1431218c = util::spawn_model(self.model, self.origin, self.angles);
	self.var_1431218c clientfield::set("ee_anthem_pa", 1);
	self.var_1431218c setcandamage(1);
	if(1)
	{
		for(;;)
		{
			self.var_1431218c.health = 1000000;
			self.var_1431218c waittill("damage", damage, attacker, dir, loc, type, model, tag, part, weapon, flags);
		}
		self.var_1431218c clientfield::set("ee_anthem_pa", 0);
		self.var_1431218c playsound("zmb_nikolai_mus_pa_destruct");
		util::wait_network_frame();
		self.var_1431218c delete();
		self.var_1431218c = undefined;
		level.var_96d76bfc++;
		if(level.var_96d76bfc >= level.var_c9c5dfcc)
		{
			level thread function_f1ce2a9a(2);
			return;
		}
	}
}

/*
	Name: function_9fa22cf7
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x1A28
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 640
*/
function function_9fa22cf7()
{
	level notify("hash_787a404e");
	var_4540293a = struct::get_array("s_anthem_array", "targetname");
	foreach(anthem_pa in var_4540293a)
	{
		if(isdefined(anthem_pa.var_1431218c))
		{
			anthem_pa.var_1431218c clientfield::set("ee_anthem_pa", 0);
			util::wait_network_frame();
			anthem_pa.var_1431218c delete();
			anthem_pa.var_1431218c = undefined;
		}
	}
}

/*
	Name: function_d0e8b85d
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x1B58
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 666
*/
function function_d0e8b85d()
{
	level endon("hash_787a404e");
	level endon("end_game");
	wait(170);
	music::setmusicstate("nikolai_fight");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_663128e3
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x1BA0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 686
*/
function function_663128e3()
{
	level flag::wait_till("ballerina_ready");
	wait(8);
	level function_6b495bd6();
	while(1)
	{
		success = level function_4c503dc7();
		if(!(isdefined(success) && success))
		{
			level function_6b495bd6(1);
			continue;
		}
		level function_d64d6d35();
		break;
	}
	level thread zm_audio::sndmusicsystem_playstate("sam");
}

/*
	Name: function_6b495bd6
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x1C80
	Size: 0x238
	Parameters: 1
	Flags: None
	Line Number: 715
*/
function function_6b495bd6(restart)
{
	if(!isdefined(restart))
	{
		restart = 0;
	}
	var_6175d76c = struct::get("s_ballerina_start", "targetname");
	if(!(isdefined(restart) && restart))
	{
		playsoundatposition("zmb_sam_egg_success", (0, 0, 0));
		mdl_ballerina = util::spawn_model(var_6175d76c.model, var_6175d76c.origin - VectorScale((0, 0, 1), 20), var_6175d76c.angles);
		mdl_ballerina clientfield::set("ee_ballerina", 2);
		mdl_ballerina moveto(var_6175d76c.origin, 2);
		mdl_ballerina waittill("movedone");
	}
	else
	{
		playsoundatposition("zmb_sam_egg_fail", (0, 0, 0));
		mdl_ballerina = util::spawn_model(var_6175d76c.model, var_6175d76c.origin, var_6175d76c.angles);
		mdl_ballerina clientfield::set("ee_ballerina", 1);
	}
	var_6175d76c zm_unitrigger::create_unitrigger(undefined, 24);
	var_6175d76c waittill("trigger_activated");
	zm_unitrigger::unregister_unitrigger(var_6175d76c.unitrigger);
	mdl_ballerina clientfield::set("ee_ballerina", 0);
	util::wait_network_frame();
	mdl_ballerina delete();
}

/*
	Name: function_4c503dc7
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x1EC0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 754
*/
function function_4c503dc7()
{
	var_d1f154fd = struct::get_array("s_ballerina_timed", "targetname");
	var_d1f154fd = Array::randomize(var_d1f154fd);
	for(i = 0; i < 5; i++)
	{
		success = var_d1f154fd[i] function_dc391fc3();
		if(!(isdefined(success) && success))
		{
			return 0;
		}
	}
	return 1;
	ERROR: Bad function call
}

/*
	Name: function_dc391fc3
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x1F80
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 780
*/
function function_dc391fc3()
{
	self.mdl_ballerina = util::spawn_model(self.model, self.origin, self.angles);
	self.mdl_ballerina clientfield::set("ee_ballerina", 1);
	self.mdl_ballerina PlayLoopSound("mus_stalingrad_musicbox_lp", 2);
	self.success = 0;
	self thread function_631d8c1();
	self thread function_75442852();
	self thread function_db914e();
	/#
		self.mdl_ballerina thread zm_utility::print3d_ent("Dev Block strings are not supported", (0, 1, 0), 3, VectorScale((0, 0, 1), 24));
	#/
	self util::waittill_any("ballerina_destroyed", "ballerina_timeout");
	/#
		self.mdl_ballerina notify("end_print3d");
	#/
	self.mdl_ballerina clientfield::set("ee_ballerina", 0);
	util::wait_network_frame();
	self.mdl_ballerina delete();
	return self.success;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_631d8c1
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x2128
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 813
*/
function function_631d8c1()
{
	self.mdl_ballerina endon("death");
	self endon("hash_636d801f");
	self endon("hash_72624b2b");
	self endon("hash_874b5073");
	while(1)
	{
		self.mdl_ballerina RotateYaw(360, 4);
		wait(4);
	}
}

/*
	Name: function_75442852
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x2198
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 836
*/
function function_75442852()
{
	self endon("hash_874b5073");
	self.mdl_ballerina setcandamage(1);
	self.mdl_ballerina.health = 1000000;
	while(1)
	{
		self.mdl_ballerina waittill("damage", damage, attacker, dir, loc, type, model, tag, part, weapon, flags);
		if(!isdefined(attacker) || !isPlayer(attacker))
		{
			continue;
		}
		self.success = 1;
		self notify("hash_72624b2b");
		break;
	}
}

/*
	Name: function_db914e
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x22C8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 864
*/
function function_db914e()
{
	self endon("hash_72624b2b");
	if(level.players.size > 1)
	{
		wait(90 - 15 * level.players.size);
	}
	else
	{
		wait(90);
	}
	self notify("hash_874b5073");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d64d6d35
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x2328
	Size: 0x528
	Parameters: 0
	Flags: None
	Line Number: 890
*/
function function_d64d6d35()
{
	playsoundatposition("zmb_sam_egg_success", (0, 0, 0));
	var_2ba18547 = struct::get("s_ballerina_end", "targetname");
	var_2ba18547.mdl_ballerina = util::spawn_model(var_2ba18547.model, var_2ba18547.origin, var_2ba18547.angles);
	var_2ba18547.mdl_ballerina clientfield::set("ee_ballerina", 1);
	var_2ba18547.mdl_ballerina PlayLoopSound("mus_stalingrad_musicbox_lp", 2);
	var_2ba18547 thread function_631d8c1();
	var_2ba18547 zm_unitrigger::create_unitrigger(undefined, 65);
	var_2ba18547 waittill("trigger_activated");
	zm_unitrigger::unregister_unitrigger(var_2ba18547.unitrigger);
	var_2ba18547 notify("hash_636d801f");
	var_2ba18547.mdl_ballerina StopLoopSound(0.5);
	var_2ba18547.mdl_ballerina playsound("zmb_challenge_skel_arm_up");
	var_f6c28cea = (2, 0, -6.5);
	var_e97ebb83 = (3.5, 0, -18.5);
	var_2ba18547.mdl_hand = util::spawn_model("c_zom_dlc1_skeleton_zombie_body_s_rarm", var_2ba18547.origin, var_2ba18547.angles);
	var_2ba18547.var_2a9b65c7 = util::spawn_model("p7_skulls_bones_arm_lower", var_2ba18547.origin + var_f6c28cea, VectorScale((1, 0, 0), 180));
	var_2ba18547.var_79dc7980 = util::spawn_model("p7_skulls_bones_arm_lower", var_2ba18547.origin + var_e97ebb83, VectorScale((1, 0, 0), 180));
	var_2ba18547.mdl_ballerina MoveZ(20, 0.5);
	var_2ba18547.mdl_hand MoveZ(20, 0.5);
	var_2ba18547.var_2a9b65c7 MoveZ(20, 0.5);
	var_2ba18547.var_79dc7980 MoveZ(20, 0.5);
	wait(0.05);
	var_2ba18547.mdl_hand clientfield::increment("challenge_arm_reveal");
	var_2ba18547.mdl_hand waittill("movedone");
	wait(1);
	var_2ba18547.mdl_ballerina PlayLoopSound("zmb_challenge_skel_arm_lp", 0.25);
	var_2ba18547.mdl_ballerina MoveZ(-30, 1.5);
	var_2ba18547.mdl_hand MoveZ(-30, 1.5);
	var_2ba18547.var_2a9b65c7 MoveZ(-30, 1.5);
	var_2ba18547.var_79dc7980 MoveZ(-30, 1.5);
	var_2ba18547.mdl_ballerina waittill("movedone");
	zm_powerups::specific_powerup_drop("full_ammo", var_2ba18547.origin);
	var_2ba18547.mdl_ballerina delete();
	var_2ba18547.mdl_hand delete();
	var_2ba18547.var_2a9b65c7 delete();
	var_2ba18547.var_79dc7980 delete();
}

/*
	Name: function_24ff7a78
	Namespace: namespace_b73d41a1
	Checksum: 0x424F4353
	Offset: 0x2858
	Size: 0x13C
	Parameters: 2
	Flags: None
	Line Number: 940
*/
function function_24ff7a78(owner, weapon)
{
	var_c4311d6f = dragon::function_69a0541c();
	if(isdefined(var_c4311d6f))
	{
		if(Array::contains(level.var_a31a784f, var_c4311d6f))
		{
			return 0;
		}
		var_12bd8497 = GetEnt(var_c4311d6f + "_1_damage", "targetname");
		if(isdefined(var_12bd8497.var_3eb19318) && var_12bd8497.var_3eb19318 && self istouching(var_12bd8497))
		{
			Array::add(level.var_a31a784f, var_c4311d6f);
			level.var_bf88fef7++;
			if(level.var_bf88fef7 >= 3)
			{
				level flag::set("ballerina_ready");
				level.monkey_song_override = undefined;
				return 1;
			}
			return 1;
		}
	}
	return 0;
}

