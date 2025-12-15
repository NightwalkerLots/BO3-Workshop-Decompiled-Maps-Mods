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

#namespace namespace_e59a0c22;

/*
	Name: __init__sytem__
	Namespace: namespace_e59a0c22
	Checksum: 0x66CD6A01
	Offset: 0x708
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("zm_soul_chest_wolf_howl", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_e59a0c22
	Checksum: 0x8CF2EFC1
	Offset: 0x748
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function __init__()
{
	level function_2852c402();
	function_aacd6833();
	thread function_b067a817();
}

/*
	Name: function_b067a817
	Namespace: namespace_e59a0c22
	Checksum: 0x3288F681
	Offset: 0x790
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_b067a817()
{
	var_23f017a9 = GetEntArray("harrybo21_mpd_wolf_howl", "script_noteworthy");
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
	Namespace: namespace_e59a0c22
	Checksum: 0x94FBE006
	Offset: 0x830
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 95
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
	Namespace: namespace_e59a0c22
	Checksum: 0xC11A8F47
	Offset: 0x8C8
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 115
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
	Namespace: namespace_e59a0c22
	Checksum: 0x2100F540
	Offset: 0xA88
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 144
*/
function function_1ca1fc6d(var_4fb6b147)
{
	fraction = 13.33333;
	trigger = spawn("trigger_radius_use", self.origin + VectorScale((0, 0, 1), 40), 0, 256, 128);
	trigger.angles = self.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_wolf_howl";
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
	Namespace: namespace_e59a0c22
	Checksum: 0x9ACF73B8
	Offset: 0xC88
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 183
*/
function function_5aed2bfc()
{
}

/*
	Name: function_efd67ce3
	Namespace: namespace_e59a0c22
	Checksum: 0xD1D664D7
	Offset: 0xC98
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 197
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
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_aacd6833
	Namespace: namespace_e59a0c22
	Checksum: 0x92068EDF
	Offset: 0xD68
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 224
*/
function function_aacd6833()
{
	var_ea3a4979 = function_afbe3b28();
	function_f02c22ff();
	for(i = 0; i < var_ea3a4979.size; i++)
	{
		function_903ba5e8(var_ea3a4979[i]);
	}
	zm_spawner::add_custom_zombie_spawn_logic(&function_a776e310);
}

/*
	Name: function_f02c22ff
	Namespace: namespace_e59a0c22
	Checksum: 0xE34DD780
	Offset: 0xE10
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 245
*/
function function_f02c22ff()
{
	zombie_utility::set_zombie_var("soulchest_initial_limit_wolf_howl", 25);
	zombie_utility::set_zombie_var("soulchest_limit_multiplier_wolf_howl", 2);
	zombie_utility::set_zombie_var("soulchest_timeout_wolf_howl", 600);
}

/*
	Name: function_903ba5e8
	Namespace: namespace_e59a0c22
	Checksum: 0x5E9D764A
	Offset: 0xE80
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 262
*/
function function_903ba5e8(struct)
{
	while(!level.var_125d500b)
	{
		wait(0.25);
	}
	struct.spawned = 1;
	trigger = spawn("trigger_radius_use", struct.origin, 0, 256, 128);
	trigger.angles = struct.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_wolf_howl";
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
}

/*
	Name: function_953b7886
	Namespace: namespace_e59a0c22
	Checksum: 0x39E5C695
	Offset: 0x1070
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 296
*/
function function_953b7886()
{
	self.collision connectpaths();
	self.collision delete();
	self.linked_model delete();
	self delete();
}

/*
	Name: function_e8f50557
	Namespace: namespace_e59a0c22
	Checksum: 0xCA55A8B5
	Offset: 0x10E0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 314
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
		zombies[i] thread function_a776e310();
	}
	wait(0.05);
}

/*
	Name: function_a776e310
	Namespace: namespace_e59a0c22
	Checksum: 0x3587EBA7
	Offset: 0x1180
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 339
*/
function function_a776e310()
{
	self endon("delete");
	self waittill("death");
	if(!isdefined(self.attacker) || !isPlayer(self.attacker))
	{
		return;
	}
	var_1ac81722 = function_6b81d7a9();
	var_1ac81722 = util::get_array_of_closest(self.origin, var_1ac81722, undefined, undefined, undefined);
	if(!isdefined(var_1ac81722) || var_1ac81722.size < 1)
	{
		return;
	}
	for(i = 0; i < var_1ac81722.size; i++)
	{
		if(!function_b96020b2(self, var_1ac81722[i]))
		{
			continue;
		}
		var_1ac81722[i] function_2f309495(self);
		break;
	}
}

/*
	Name: function_b96020b2
	Namespace: namespace_e59a0c22
	Checksum: 0x99905E08
	Offset: 0x12B0
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 374
*/
function function_b96020b2(zombie, trigger)
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
	Name: function_6ac98901
	Namespace: namespace_e59a0c22
	Checksum: 0xB0A77A53
	Offset: 0x1348
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 397
*/
function function_6ac98901()
{
	self.active = 1;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	self.var_8050ee01 = spawn("script_model", self.linked_model.origin);
	self.var_8050ee01.angles = self.linked_model.angles + VectorScale((0, 1, 0), 90);
	self.var_8050ee01 SetModel("tag_origin");
	self.var_8050ee01 PlayLoopSound("zmb_footprintbox_fire", 0.1);
	if(isdefined(self.var_afaa2468))
	{
		[[self.var_afaa2468]]();
		continue;
	}
	PlayFXOnTag("zombie/fx_ee_altar_mist_zod_zmb", self.var_8050ee01, "tag_origin");
	self function_fc59c0dd("p7_fxanim_zm_ori_challenge_box_open_anim");
	self thread function_7eeaf432();
}

/*
	Name: function_acecf69b
	Namespace: namespace_e59a0c22
	Checksum: 0x82A9C89B
	Offset: 0x14B0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 427
*/
function function_acecf69b()
{
	if(isdefined(self.var_8050ee01))
	{
		self.var_8050ee01 StopLoopSound(0.1);
		self.var_8050ee01 delete();
	}
	self function_fc59c0dd("p7_fxanim_zm_ori_challenge_box_close_anim");
	self.active = 0;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	return;
	ERROR: Bad function call
}

/*
	Name: function_7eeaf432
	Namespace: namespace_e59a0c22
	Checksum: 0x53CC9A35
	Offset: 0x1558
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 453
*/
function function_7eeaf432()
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
	while(self.timer < level.zombie_vars["soulchest_timeout_wolf_howl"])
	{
		self.timer++;
		wait(1);
	}
	self notify("hash_4dd2f7b6");
}

/*
	Name: function_fc59c0dd
	Namespace: namespace_e59a0c22
	Checksum: 0xE918794B
	Offset: 0x15F8
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 483
*/
function function_fc59c0dd(animation)
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
	model function_1a0d89b7();
	model AnimScripted(animation, model.origin, model.angles, animation);
	wait(getanimlength(animation));
	self.var_8a63adfb = undefined;
}

/*
	Name: function_1a0d89b7
	Namespace: namespace_e59a0c22
	Checksum: 0xE215DF1A
	Offset: 0x16E8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 511
*/
function function_1a0d89b7()
{
	if(!isdefined(self.model) || self.model != "tag_origin")
	{
		return;
	}
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_open_anim", 0);
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_close_anim", 0);
}

/*
	Name: function_2f309495
	Namespace: namespace_e59a0c22
	Checksum: 0x6E78D360
	Offset: 0x1760
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 531
*/
function function_2f309495(zombie)
{
	if(isdefined(self.var_73d7144) && self.var_73d7144)
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!(isdefined(self.active) && self.active))
	{
		self thread function_6ac98901();
	}
	self function_d1ded0f2(zombie);
	if(isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= self.var_c29b85d1)
	{
		self function_cb045e1a();
	}
	else if(!isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= level.zombie_vars["soulchest_initial_limit_wolf_howl"])
	{
		self function_cb045e1a();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d1ded0f2
	Namespace: namespace_e59a0c22
	Checksum: 0xA8BDBD64
	Offset: 0x1870
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 568
*/
function function_d1ded0f2(zombie)
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
	Name: function_ee446c4d
	Namespace: namespace_e59a0c22
	Checksum: 0x9BF1B510
	Offset: 0x1A00
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 595
*/
function function_ee446c4d()
{
	level.zombie_vars["soulchest_initial_limit_wolf_howl"] = level.zombie_vars["soulchest_initial_limit_wolf_howl"] + level.zombie_vars["soulchest_limit_multiplier_wolf_howl"];
	return;
	ERROR: Bad function call
}

/*
	Name: function_cb045e1a
	Namespace: namespace_e59a0c22
	Checksum: 0x4DA61C4A
	Offset: 0x1A48
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 612
*/
function function_cb045e1a()
{
	if(isdefined(self.var_73d7144) && self.var_73d7144)
	{
		return;
	}
	self.var_73d7144 = 1;
	if(isdefined(self.var_385d7ee7))
	{
		return self [[self.var_385d7ee7]]();
	}
	function_ee446c4d();
	self function_acecf69b();
	model = self.linked_model;
	model function_1a0d89b7();
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
	self function_953b7886();
	function_bb6e8fb(origin);
}

/*
	Name: function_bb6e8fb
	Namespace: namespace_e59a0c22
	Checksum: 0xA0D24D5C
	Offset: 0x1DE8
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 667
*/
function function_bb6e8fb(origin)
{
	level notify("hash_aea60b78", origin);
	chests = function_6b81d7a9();
	if(!isdefined(chests) || chests.size < 1)
	{
		return function_8a418e73(origin);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8a418e73
	Namespace: namespace_e59a0c22
	Checksum: 0xFC09A9F4
	Offset: 0x1E68
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 689
*/
function function_8a418e73(origin)
{
	level notify("hash_3bde30a1", origin);
	function_eefb758a();
}

/*
	Name: function_afbe3b28
	Namespace: namespace_e59a0c22
	Checksum: 0x9FCCF5E5
	Offset: 0x1EA8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 705
*/
function function_afbe3b28()
{
	return struct::get_array("harrybo21_soul_chest_wolf_howl", "script_noteworthy");
}

/*
	Name: function_6b81d7a9
	Namespace: namespace_e59a0c22
	Checksum: 0xF84FC376
	Offset: 0x1ED8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 720
*/
function function_6b81d7a9()
{
	return GetEntArray("harrybo21_soul_chest_wolf_howl", "script_noteworthy");
}

/*
	Name: function_fa4034d3
	Namespace: namespace_e59a0c22
	Checksum: 0xDB2B7A3E
	Offset: 0x1F08
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 735
*/
function function_fa4034d3()
{
	excluders = GetEntArray("harrybo21_chest_ignore_area_wolf_howl", "targetname");
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
	Name: function_eefb758a
	Namespace: namespace_e59a0c22
	Checksum: 0x2592FAD8
	Offset: 0x1FB0
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 762
*/
function function_eefb758a()
{
	level flag::init("elemental_wolf_howl_upgraded");
	FX = spawn("script_model", (-835.445, -2038.61, -542));
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["wolfaura"], FX, "tag_origin");
	fx2 = spawn("script_model", (-835.445, -2038.61, -581));
	fx2 SetModel("tag_origin");
	PlayFXOnTag(level._effect["runeshaft"], fx2, "tag_origin");
	playsoundatposition("zmb_bow_ascend_base", (-835.445, -2038.61, -522.25));
	level.var_3ed5214e = 1;
	wait(0.25);
	while(!level.var_3ed5214e)
	{
		wait(0.25);
	}
	namespace_2a78f3c::function_7ead0560();
	wait(10);
	FX delete();
	fx2 delete();
}

/*
	Name: function_b52cb6dd
	Namespace: namespace_e59a0c22
	Checksum: 0x5DC8C4E6
	Offset: 0x2198
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 794
*/
function function_b52cb6dd()
{
	while(1)
	{
		self waittill("trigger", player);
	}
}

/*
	Name: function_2852c402
	Namespace: namespace_e59a0c22
	Checksum: 0xD11C83B3
	Offset: 0x21C8
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 812
*/
function function_2852c402()
{
	level.var_3ed5214e = 0;
	key = GetEnt("elemental_bow_wolf_howl_pickup", "targetname");
	key thread function_9e68eda2();
	var_88be19d9 = GetEntArray("key_door9", "targetname");
	foreach(door in var_88be19d9)
	{
		door setcursorhint("HINT_NOICON");
		door setHintString("");
		door thread function_2c8256c2();
	}
}

/*
	Name: function_9e68eda2
	Namespace: namespace_e59a0c22
	Checksum: 0xCD16E66D
	Offset: 0x2318
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 836
*/
function function_9e68eda2()
{
	self TriggerEnable(0);
	while(!level.var_3ed5214e)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
}

/*
	Name: function_2c8256c2
	Namespace: namespace_e59a0c22
	Checksum: 0xBE3FF757
	Offset: 0x2388
	Size: 0x144
	Parameters: 0
	Flags: None
	Line Number: 857
*/
function function_2c8256c2()
{
	level endon("intermission");
	self setHintString("");
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

