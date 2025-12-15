#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zm_castle_weap_quest;

#namespace namespace_f8bd7918;

/*
	Name: __init__sytem__
	Namespace: namespace_f8bd7918
	Checksum: 0xB1945A5
	Offset: 0x6E8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("zm_soul_chest_keeper1", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_f8bd7918
	Checksum: 0xD0233888
	Offset: 0x728
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function __init__()
{
	level function_cb5642e5();
	function_39363135();
	thread function_399d0211();
	return;
}

/*
	Name: function_399d0211
	Namespace: namespace_f8bd7918
	Checksum: 0xFB62A943
	Offset: 0x770
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function function_399d0211()
{
	var_23f017a9 = GetEntArray("harrybo21_mpd_keeper1", "script_noteworthy");
	if(!isdefined(var_23f017a9) || var_23f017a9.size < 1)
	{
		return;
	}
	for(i = 0; i < var_23f017a9.size; i++)
	{
		var_23f017a9[i] function_e02b3458();
	}
}

/*
	Name: function_e02b3458
	Namespace: namespace_f8bd7918
	Checksum: 0xDD33C3B6
	Offset: 0x810
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 96
*/
function function_e02b3458()
{
	self thread function_14af7719();
	tubes = GetEntArray(self.targetname, "target");
	for(i = 0; i < tubes.size; i++)
	{
		tubes[i] thread function_1ca1fc6d(self);
	}
}

/*
	Name: function_14af7719
	Namespace: namespace_f8bd7918
	Checksum: 0x2F8A0E6B
	Offset: 0x8A8
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 116
*/
function function_14af7719()
{
	self setHintString("The M.P.D must be charged...");
	tubes = GetEntArray(self.targetname, "target");
	for(i = 0; i < tubes.size; i++)
	{
		self waittill("hash_939e4518");
	}
	self setHintString("Press & hold ^3&&1^7 to activate M.P.D");
	self waittill("trigger", player);
	self setHintString("");
	model = GetEnt(self.target, "targetname");
	model useanimtree(-1);
	model.animName = "soul_box";
	model AnimScripted("p7_fxanim_zm_castle_pyramid_anim", model.origin, model.angles, "p7_fxanim_zm_castle_pyramid_anim");
	PlayFXOnTag("harry/mpd/fx_mpd_fire", model, "tag_origin");
	self delete();
}

/*
	Name: function_1ca1fc6d
	Namespace: namespace_f8bd7918
	Checksum: 0xB4AE3511
	Offset: 0xA68
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 145
*/
function function_1ca1fc6d(var_4fb6b147)
{
	fraction = 13.33333;
	trigger = spawn("trigger_radius_use", self.origin + VectorScale((0, 0, 1), 40), 0, 256, 128);
	trigger.angles = self.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_keeper1";
	trigger.var_c29b85d1 = 3;
	trigger.kills = 0;
	trigger.timer = 0;
	trigger.var_21aeaaf7 = 0;
	trigger.active = 0;
	trigger.linked_model = self;
	trigger setcursorhint("HINT_NOICON");
	origin = self.origin;
	trigger.var_385d7ee7 = &function_5aed2bfc;
	trigger.var_afaa2468 = &function_5aed2bfc;
	while(1)
	{
		if(trigger.kills >= trigger.var_c29b85d1)
		{
			break;
		}
		trigger waittill("hash_abaab100");
		self moveto(origin + (0, 0, trigger.kills * fraction), 0.5);
	}
	trigger delete();
	var_4fb6b147 notify("hash_939e4518");
}

/*
	Name: function_5aed2bfc
	Namespace: namespace_f8bd7918
	Checksum: 0x9ACF73B8
	Offset: 0xC68
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 184
*/
function function_5aed2bfc()
{
}

/*
	Name: function_efd67ce3
	Namespace: namespace_f8bd7918
	Checksum: 0x7758F8EC
	Offset: 0xC78
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 198
*/
function function_efd67ce3()
{
	while(1)
	{
		self waittill("trigger", player);
		tubes = GetEntArray(self.targetname, "target");
		for(i = 0; i < tubes.size; i++)
		{
			tubes[i] MoveZ(40, 10);
		}
		break;
	}
	self setHintString("");
}

/*
	Name: function_39363135
	Namespace: namespace_f8bd7918
	Checksum: 0xFD6FC5F2
	Offset: 0xD48
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 223
*/
function function_39363135()
{
	var_9e2b5fab = function_cefaf1c6();
	function_838e4781();
	for(i = 0; i < var_9e2b5fab.size; i++)
	{
		function_4d1eac06(var_9e2b5fab[i]);
	}
	zm_spawner::add_custom_zombie_spawn_logic(&function_94af66de);
}

/*
	Name: function_838e4781
	Namespace: namespace_f8bd7918
	Checksum: 0xC0975A6C
	Offset: 0xDF0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 244
*/
function function_838e4781()
{
	zombie_utility::set_zombie_var("soulchest_initial_limit_keeper1", 25);
	zombie_utility::set_zombie_var("soulchest_limit_multiplier_keeper1", 2);
	zombie_utility::set_zombie_var("soulchest_timeout_keeper1", 600);
}

/*
	Name: function_4d1eac06
	Namespace: namespace_f8bd7918
	Checksum: 0x91920D10
	Offset: 0xE60
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 261
*/
function function_4d1eac06(struct)
{
	while(!level.var_48961f1d)
	{
		wait(0.25);
	}
	struct.spawned = 1;
	trigger = spawn("trigger_radius_use", struct.origin, 0, 256, 128);
	trigger.angles = struct.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_keeper1";
	trigger.kills = 0;
	trigger.timer = 0;
	trigger.var_21aeaaf7 = 0;
	trigger.active = 0;
	trigger.var_efa95399 = 1;
	trigger.var_7c0bd332 = struct;
	trigger.linked_model = spawn("script_model", struct.origin);
	trigger.linked_model.angles = struct.angles;
	trigger.linked_model SetModel("tag_origin");
	trigger.linked_model useanimtree(-1);
	trigger.linked_model.animName = "soul_box";
	thread function_e8f50557();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_186032b4
	Namespace: namespace_f8bd7918
	Checksum: 0xE741A2DF
	Offset: 0x1050
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 297
*/
function function_186032b4()
{
	self.collision connectpaths();
	self.collision delete();
	self.linked_model delete();
	self delete();
	return;
}

/*
	Name: function_e8f50557
	Namespace: namespace_f8bd7918
	Checksum: 0x887CE2D2
	Offset: 0x10C0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 316
*/
function function_e8f50557()
{
	zombies = GetAISpeciesArray("axis");
	for(i = 0; i < zombies.size; i++)
	{
		if(isdefined(zombies[i].var_a07a45be))
		{
			continue;
			continue;
		}
		zombies[i] thread function_94af66de();
	}
	wait(0.05);
}

/*
	Name: function_94af66de
	Namespace: namespace_f8bd7918
	Checksum: 0x7B7F6C45
	Offset: 0x1160
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 341
*/
function function_94af66de()
{
	self endon("delete");
	self waittill("death");
	if(!isdefined(self.attacker) || !isPlayer(self.attacker))
	{
		return;
	}
	var_c88bcc18 = function_8f33301b();
	var_c88bcc18 = util::get_array_of_closest(self.origin, var_c88bcc18, undefined, undefined, undefined);
	if(!isdefined(var_c88bcc18) || var_c88bcc18.size < 1)
	{
		return;
	}
	for(i = 0; i < var_c88bcc18.size; i++)
	{
		if(!function_1d991768(self, var_c88bcc18[i]))
		{
			continue;
		}
		var_c88bcc18[i] function_c152884f(self);
		break;
	}
}

/*
	Name: function_1d991768
	Namespace: namespace_f8bd7918
	Checksum: 0xC8EA3589
	Offset: 0x1290
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 376
*/
function function_1d991768(zombie, trigger)
{
	if(!zombie istouching(trigger))
	{
		return 0;
	}
	if(isdefined(trigger.var_efa95399) && trigger.var_efa95399 && !SightTracePassed(zombie.origin, trigger.origin, 0, zombie))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_b8235103
	Namespace: namespace_f8bd7918
	Checksum: 0xDA9EE339
	Offset: 0x1328
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 399
*/
function function_b8235103()
{
	self.active = 1;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	self.var_e450ee03 = spawn("script_model", self.linked_model.origin);
	self.var_e450ee03.angles = self.linked_model.angles + VectorScale((0, 1, 0), 90);
	self.var_e450ee03 SetModel("tag_origin");
	self.var_e450ee03 PlayLoopSound("zmb_footprintbox_fire", 0.1);
	if(isdefined(self.var_afaa2468))
	{
		[[self.var_afaa2468]]();
		continue;
	}
	PlayFXOnTag("zombie/fx_ee_altar_mist_zod_zmb", self.var_e450ee03, "tag_origin");
	self function_4d986ba7("p7_fxanim_zm_ori_challenge_box_open_anim");
	self thread function_5acfdee8();
}

/*
	Name: function_d6599b95
	Namespace: namespace_f8bd7918
	Checksum: 0x23CD253E
	Offset: 0x1490
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 429
*/
function function_d6599b95()
{
	if(isdefined(self.var_e450ee03))
	{
		self.var_e450ee03 StopLoopSound(0.1);
		self.var_e450ee03 delete();
	}
	self function_4d986ba7("p7_fxanim_zm_ori_challenge_box_close_anim");
	self.active = 0;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
}

/*
	Name: function_5acfdee8
	Namespace: namespace_f8bd7918
	Checksum: 0x50229903
	Offset: 0x1538
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 453
*/
function function_5acfdee8()
{
	self endon("death");
	self endon("delete");
	self notify("hash_4dd2f7b6");
	self endon("disconnect");
	self endon("hash_4dd2f7b6");
	if(!isdefined(self))
	{
		return;
	}
	self.timer = 0;
	while(self.timer < level.zombie_vars["soulchest_timeout_keeper1"])
	{
		self.timer++;
		wait(1);
	}
	self notify("hash_4dd2f7b6");
	return;
	ERROR: Bad function call
}

/*
	Name: function_4d986ba7
	Namespace: namespace_f8bd7918
	Checksum: 0x72B14182
	Offset: 0x15D8
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 485
*/
function function_4d986ba7(animation)
{
	if(!isdefined(self.model) || self.model != "tag_origin")
	{
		return;
	}
	while(isdefined(self.var_8a63adfb) && self.var_8a63adfb)
	{
		wait(0.05);
	}
	self.var_8a63adfb = 1;
	model = self.linked_model;
	model function_ac8b6369();
	model AnimScripted(animation, model.origin, model.angles, animation);
	wait(getanimlength(animation));
	self.var_8a63adfb = undefined;
}

/*
	Name: function_ac8b6369
	Namespace: namespace_f8bd7918
	Checksum: 0x1552262D
	Offset: 0x16C8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 513
*/
function function_ac8b6369()
{
	if(!isdefined(self.model) || self.model != "tag_origin")
	{
		return;
	}
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_open_anim", 0);
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_close_anim", 0);
}

/*
	Name: function_c152884f
	Namespace: namespace_f8bd7918
	Checksum: 0x6D6D86AF
	Offset: 0x1740
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 533
*/
function function_c152884f(zombie)
{
	if(isdefined(self.var_4811049a) && self.var_4811049a)
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!(isdefined(self.active) && self.active))
	{
		self thread function_b8235103();
	}
	self function_7d4fb528(zombie);
	if(isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= self.var_c29b85d1)
	{
		self function_d4b6c940();
	}
	else if(!isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= level.zombie_vars["soulchest_initial_limit_keeper1"])
	{
		self function_d4b6c940();
	}
}

/*
	Name: function_7d4fb528
	Namespace: namespace_f8bd7918
	Checksum: 0x988669BB
	Offset: 0x1850
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 568
*/
function function_7d4fb528(zombie)
{
	self.timer = 0;
	self.var_21aeaaf7++;
	ent = spawn("script_model", zombie GetTagOrigin("j_spineupper"));
	ent SetModel("tag_origin");
	PlayFXOnTag("zombie/fx_trail_blood_soul_zmb_wolf_howl", ent, "tag_origin");
	ent moveto(self.linked_model.origin + VectorScale((0, 0, 1), 50), 1.25, 0.5, 0.25);
	wait(1);
	playFX("harry/soul_chest/fx_soul_chest_collect", ent.origin);
	playsoundatposition("zmb_footprintbox_pulse", ent.origin);
	ent delete();
	self.kills++;
	self.var_21aeaaf7--;
	self notify("hash_abaab100");
}

/*
	Name: function_cd155257
	Namespace: namespace_f8bd7918
	Checksum: 0x9D202E28
	Offset: 0x19E0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 595
*/
function function_cd155257()
{
	level.zombie_vars["soulchest_initial_limit_keeper1"] = level.zombie_vars["soulchest_initial_limit_keeper1"] + level.zombie_vars["soulchest_limit_multiplier_keeper1"];
	return;
}

/*
	Name: function_d4b6c940
	Namespace: namespace_f8bd7918
	Checksum: 0xFB7F6655
	Offset: 0x1A28
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 611
*/
function function_d4b6c940()
{
	if(isdefined(self.var_4811049a) && self.var_4811049a)
	{
		return;
	}
	self.var_4811049a = 1;
	if(isdefined(self.var_385d7ee7))
	{
		return self [[self.var_385d7ee7]]();
	}
	function_cd155257();
	self function_d6599b95();
	model = self.linked_model;
	model function_ac8b6369();
	origin = model.origin;
	fake_model = spawn("script_model", origin);
	fake_model SetModel("tag_origin");
	fake_model.angles = model.angles;
	wait(0.05);
	model Hide();
	wait(1);
	fake_model MoveZ(30, 1, 1);
	wait(0.5);
	n_rotations = randomIntRange(5, 7);
	v_start_angles = fake_model.angles;
	for(i = 0; i < n_rotations; i++)
	{
		v_rotate_angles = v_start_angles + (RandomFloatRange(-10, 10), RandomFloatRange(-10, 10), RandomFloatRange(-10, 10));
		n_rotate_time = RandomFloatRange(0.2, 0.4);
		fake_model RotateTo(v_rotate_angles, n_rotate_time);
		fake_model waittill("rotatedone");
	}
	fake_model RotateTo(v_start_angles, 0.3);
	fake_model MoveZ(-60, 0.5, 0.5);
	fake_model waittill("rotatedone");
	playFX(level._effect["poltergeist"], origin);
	playFX("harry/soul_chest/fx_soul_chest_collect", origin);
	playsoundatposition("zmb_footprintbox_disappear", origin);
	fake_model waittill("movedone");
	fake_model delete();
	self function_186032b4();
	function_d6b79cb5(origin);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: function_d6b79cb5
	Namespace: namespace_f8bd7918
	Checksum: 0x7817A6F9
	Offset: 0x1DC8
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 669
*/
function function_d6b79cb5(origin)
{
	level notify("hash_6ca553d6", origin);
	chests = function_8f33301b();
	if(!isdefined(chests) || chests.size < 1)
	{
		return function_d667ea9d(origin);
	}
}

/*
	Name: function_d667ea9d
	Namespace: namespace_f8bd7918
	Checksum: 0x4057B4B3
	Offset: 0x1E48
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 689
*/
function function_d667ea9d(origin)
{
	level notify("hash_5fd28c63", origin);
	function_1ec0a3f0();
}

/*
	Name: function_cefaf1c6
	Namespace: namespace_f8bd7918
	Checksum: 0x1DA94664
	Offset: 0x1E88
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 705
*/
function function_cefaf1c6()
{
	return struct::get_array("harrybo21_soul_chest_keeper1", "script_noteworthy");
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8f33301b
	Namespace: namespace_f8bd7918
	Checksum: 0xB9A829CF
	Offset: 0x1EB8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 721
*/
function function_8f33301b()
{
	return GetEntArray("harrybo21_soul_chest_keeper1", "script_noteworthy");
}

/*
	Name: function_f6f5853d
	Namespace: namespace_f8bd7918
	Checksum: 0x7B0759EB
	Offset: 0x1EE8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 736
*/
function function_f6f5853d()
{
	excluders = GetEntArray("harrybo21_chest_ignore_area_keeper1", "targetname");
	if(!isdefined(excluders) || excluders.size < 1)
	{
		return 0;
	}
	for(i = 0; i < excluders.size; i++)
	{
		if(self istouching(excluders[i]))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_1ec0a3f0
	Namespace: namespace_f8bd7918
	Checksum: 0xBEF2B0FB
	Offset: 0x1F90
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 763
*/
function function_1ec0a3f0()
{
	level flag::init("elemental_keeper1_upgraded");
	playsoundatposition("relic_pickup", (668.5, -1268.75, 29.25));
	level.var_f632c673 = 1;
	wait(0.25);
}

/*
	Name: function_3c58f1a7
	Namespace: namespace_f8bd7918
	Checksum: 0xC5976175
	Offset: 0x2000
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 781
*/
function function_3c58f1a7()
{
	while(1)
	{
		self waittill("trigger", player);
	}
}

/*
	Name: function_cb5642e5
	Namespace: namespace_f8bd7918
	Checksum: 0xD81B95B5
	Offset: 0x2030
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 799
*/
function function_cb5642e5()
{
	level.var_f632c673 = 0;
	thread function_1ffb0864();
	thread function_677d2287();
}

/*
	Name: function_1ffb0864
	Namespace: namespace_f8bd7918
	Checksum: 0x8FB709EB
	Offset: 0x2070
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 816
*/
function function_1ffb0864()
{
	self TriggerEnable(0);
	while(!level.var_f632c673)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
}

/*
	Name: function_677d2287
	Namespace: namespace_f8bd7918
	Checksum: 0xB2B783E3
	Offset: 0x20E0
	Size: 0x144
	Parameters: 0
	Flags: None
	Line Number: 837
*/
function function_677d2287()
{
	level endon("intermission");
	self setHintString("Press and Hold ^3&&1^7 to Place The Summoning Key");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
}

