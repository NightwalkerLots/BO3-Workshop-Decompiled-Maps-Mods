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

#namespace namespace_c76a2593;

/*
	Name: __init__sytem__
	Namespace: namespace_c76a2593
	Checksum: 0x22AD8F16
	Offset: 0x708
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("zm_soul_chest_demongate", &__init__, undefined, undefined);
	return;
	ERROR: Bad function call
}

/*
	Name: __init__
	Namespace: namespace_c76a2593
	Checksum: 0x957C0317
	Offset: 0x748
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function __init__()
{
	level function_93f71d2e();
	function_f0ad6964();
	thread function_e8dce2a8();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e8dce2a8
	Namespace: namespace_c76a2593
	Checksum: 0x2CEC07B7
	Offset: 0x790
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_e8dce2a8()
{
	var_23f017a9 = GetEntArray("harrybo21_mpd_demongate", "script_noteworthy");
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
	Namespace: namespace_c76a2593
	Checksum: 0x7BD7C648
	Offset: 0x830
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 99
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
	Namespace: namespace_c76a2593
	Checksum: 0x1BA3A311
	Offset: 0x8C8
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 119
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
	Namespace: namespace_c76a2593
	Checksum: 0x3ACB210C
	Offset: 0xA88
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 148
*/
function function_1ca1fc6d(var_4fb6b147)
{
	fraction = 13.33333;
	trigger = spawn("trigger_radius_use", self.origin + VectorScale((0, 0, 1), 40), 0, 256, 128);
	trigger.angles = self.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_demongate";
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
	Namespace: namespace_c76a2593
	Checksum: 0x9ACF73B8
	Offset: 0xC88
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 187
*/
function function_5aed2bfc()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_efd67ce3
	Namespace: namespace_c76a2593
	Checksum: 0x82A0C0E7
	Offset: 0xC98
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 203
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
	Name: function_f0ad6964
	Namespace: namespace_c76a2593
	Checksum: 0x3136DE81
	Offset: 0xD68
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 228
*/
function function_f0ad6964()
{
	var_b58b3c2c = function_36841e15();
	function_dbe49f86();
	for(i = 0; i < var_b58b3c2c.size; i++)
	{
		function_29f3e4d5(var_b58b3c2c[i]);
	}
	zm_spawner::add_custom_zombie_spawn_logic(&function_6f02b22d);
}

/*
	Name: function_dbe49f86
	Namespace: namespace_c76a2593
	Checksum: 0xCEBD9BB5
	Offset: 0xE10
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 249
*/
function function_dbe49f86()
{
	zombie_utility::set_zombie_var("soulchest_initial_limit_demongate", 25);
	zombie_utility::set_zombie_var("soulchest_limit_multiplier_demongate", 2);
	zombie_utility::set_zombie_var("soulchest_timeout_demongate", 600);
}

/*
	Name: function_29f3e4d5
	Namespace: namespace_c76a2593
	Checksum: 0x65BB5709
	Offset: 0xE80
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 266
*/
function function_29f3e4d5(struct)
{
	while(!level.var_c317b842)
	{
		wait(0.25);
	}
	struct.spawned = 1;
	trigger = spawn("trigger_radius_use", struct.origin, 0, 256, 128);
	trigger.angles = struct.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_demongate";
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
	Name: function_81a80ea7
	Namespace: namespace_c76a2593
	Checksum: 0x914C7626
	Offset: 0x1070
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 300
*/
function function_81a80ea7()
{
	self.collision connectpaths();
	self.collision delete();
	self.linked_model delete();
	self delete();
}

/*
	Name: function_e8f50557
	Namespace: namespace_c76a2593
	Checksum: 0x3EC89BA7
	Offset: 0x10E0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 318
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
		zombies[i] thread function_6f02b22d();
	}
	wait(0.05);
}

/*
	Name: function_6f02b22d
	Namespace: namespace_c76a2593
	Checksum: 0x4E7140A5
	Offset: 0x1180
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 343
*/
function function_6f02b22d()
{
	self endon("delete");
	self waittill("death");
	if(!isdefined(self.attacker) || !isPlayer(self.attacker))
	{
		return;
	}
	var_fc983093 = function_43757d1c();
	var_fc983093 = util::get_array_of_closest(self.origin, var_fc983093, undefined, undefined, undefined);
	if(!isdefined(var_fc983093) || var_fc983093.size < 1)
	{
		return;
	}
	for(i = 0; i < var_fc983093.size; i++)
	{
		if(!function_7cfab663(self, var_fc983093[i]))
		{
			continue;
		}
		var_fc983093[i] function_f13a3f28(self);
		break;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7cfab663
	Namespace: namespace_c76a2593
	Checksum: 0xB32827F1
	Offset: 0x12B0
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 380
*/
function function_7cfab663(zombie, trigger)
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
	Name: function_c8613d84
	Namespace: namespace_c76a2593
	Checksum: 0xD736F312
	Offset: 0x1348
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 403
*/
function function_c8613d84()
{
	self.active = 1;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	self.var_dde8a284 = spawn("script_model", self.linked_model.origin);
	self.var_dde8a284.angles = self.linked_model.angles + VectorScale((0, 1, 0), 90);
	self.var_dde8a284 SetModel("tag_origin");
	self.var_dde8a284 PlayLoopSound("zmb_footprintbox_fire", 0.1);
	if(isdefined(self.var_afaa2468))
	{
		[[self.var_afaa2468]]();
		continue;
	}
	PlayFXOnTag("zombie/fx_ee_altar_mist_zod_zmb", self.var_dde8a284, "tag_origin");
	self function_3a2bb100("p7_fxanim_zm_ori_challenge_box_open_anim");
	self thread function_428589e3();
}

/*
	Name: function_3293f932
	Namespace: namespace_c76a2593
	Checksum: 0x50B3E665
	Offset: 0x14B0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 433
*/
function function_3293f932()
{
	if(isdefined(self.var_dde8a284))
	{
		self.var_dde8a284 StopLoopSound(0.1);
		self.var_dde8a284 delete();
	}
	self function_3a2bb100("p7_fxanim_zm_ori_challenge_box_close_anim");
	self.active = 0;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
}

/*
	Name: function_428589e3
	Namespace: namespace_c76a2593
	Checksum: 0x607235BB
	Offset: 0x1558
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 457
*/
function function_428589e3()
{
	// Could not fully decompile function; skipped
}

/*
	Name: function_3a2bb100
	Namespace: namespace_c76a2593
	Checksum: 0x5D653242
	Offset: 0x15F8
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 472
*/
function function_3a2bb100(animation)
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
	model function_9cc259ce();
	model AnimScripted(animation, model.origin, model.angles, animation);
	wait(getanimlength(animation));
	self.var_8a63adfb = undefined;
	return;
}

/*
	Name: function_9cc259ce
	Namespace: namespace_c76a2593
	Checksum: 0xD94FFB92
	Offset: 0x16E8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 501
*/
function function_9cc259ce()
{
	if(!isdefined(self.model) || self.model != "tag_origin")
	{
		return;
	}
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_open_anim", 0);
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_close_anim", 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f13a3f28
	Namespace: namespace_c76a2593
	Checksum: 0xB340BC4D
	Offset: 0x1760
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 523
*/
function function_f13a3f28(zombie)
{
	if(isdefined(self.var_4aba0911) && self.var_4aba0911)
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!(isdefined(self.active) && self.active))
	{
		self thread function_c8613d84();
	}
	self function_ee31a3a3(zombie);
	if(isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= self.var_c29b85d1)
	{
		self function_65c6a3fb();
	}
	else if(!isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= level.zombie_vars["soulchest_initial_limit_demongate"])
	{
		self function_65c6a3fb();
	}
}

/*
	Name: function_ee31a3a3
	Namespace: namespace_c76a2593
	Checksum: 0x88DBA2C6
	Offset: 0x1870
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 558
*/
function function_ee31a3a3(zombie)
{
	self.timer = 0;
	self.var_21aeaaf7++;
	ent = spawn("script_model", zombie GetTagOrigin("j_spineupper"));
	ent SetModel("tag_origin");
	PlayFXOnTag("zombie/fx_trail_blood_soul_zmb_demongate", ent, "tag_origin");
	ent moveto(self.linked_model.origin + VectorScale((0, 0, 1), 50), 1.25, 0.5, 0.25);
	wait(1);
	playFX("harry/soul_chest/fx_soul_chest_collect", ent.origin);
	playsoundatposition("zmb_footprintbox_pulse", ent.origin);
	ent delete();
	self.kills++;
	self.var_21aeaaf7--;
	self notify("hash_abaab100");
	return;
	++;
}

/*
	Name: function_be9a66b0
	Namespace: namespace_c76a2593
	Checksum: 0x55344C63
	Offset: 0x1A00
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 587
*/
function function_be9a66b0()
{
	level.zombie_vars["soulchest_initial_limit_demongate"] = level.zombie_vars["soulchest_initial_limit_demongate"] + level.zombie_vars["soulchest_limit_multiplier_demongate"];
}

/*
	Name: function_65c6a3fb
	Namespace: namespace_c76a2593
	Checksum: 0x5D45FA92
	Offset: 0x1A48
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 602
*/
function function_65c6a3fb()
{
	if(isdefined(self.var_4aba0911) && self.var_4aba0911)
	{
		return;
	}
	self.var_4aba0911 = 1;
	if(isdefined(self.var_385d7ee7))
	{
		return self [[self.var_385d7ee7]]();
	}
	function_be9a66b0();
	self function_3293f932();
	model = self.linked_model;
	model function_9cc259ce();
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
	self function_81a80ea7();
	function_811bd452(origin);
	return;
}

/*
	Name: function_811bd452
	Namespace: namespace_c76a2593
	Checksum: 0x50A35397
	Offset: 0x1DE8
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 658
*/
function function_811bd452(origin)
{
	level notify("hash_835c5ea5", origin);
	chests = function_43757d1c();
	if(!isdefined(chests) || chests.size < 1)
	{
		return function_477acc1a(origin);
	}
}

/*
	Name: function_477acc1a
	Namespace: namespace_c76a2593
	Checksum: 0xF2584BCD
	Offset: 0x1E68
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 678
*/
function function_477acc1a(origin)
{
	level notify("hash_61efef64", origin);
	function_fe2c81ab();
}

/*
	Name: function_36841e15
	Namespace: namespace_c76a2593
	Checksum: 0x688B5C4A
	Offset: 0x1EA8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 694
*/
function function_36841e15()
{
	return struct::get_array("harrybo21_soul_chest_demongate", "script_noteworthy");
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_43757d1c
	Namespace: namespace_c76a2593
	Checksum: 0x99F334D8
	Offset: 0x1ED8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 710
*/
function function_43757d1c()
{
	return GetEntArray("harrybo21_soul_chest_demongate", "script_noteworthy");
}

/*
	Name: function_eb6bc3ba
	Namespace: namespace_c76a2593
	Checksum: 0x7CF45622
	Offset: 0x1F08
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 725
*/
function function_eb6bc3ba()
{
	excluders = GetEntArray("harrybo21_chest_ignore_area_demongate", "targetname");
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
	Name: function_fe2c81ab
	Namespace: namespace_c76a2593
	Checksum: 0x1E361DFA
	Offset: 0x1FB0
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 752
*/
function function_fe2c81ab()
{
	level flag::init("elemental_demongate_upgraded");
	FX = spawn("script_model", (-109.75, -2036, -540.5));
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["demonaura"], FX, "tag_origin");
	fx2 = spawn("script_model", (-109.75, -2036, -500));
	fx2 SetModel("tag_origin");
	PlayFXOnTag(level._effect["runeshaft"], fx2, "tag_origin");
	playsoundatposition("zmb_bow_ascend_base", (-129.5, -2020.75, -525.75));
	level.var_6ec350e8 = 1;
	wait(0.25);
	while(!level.var_6ec350e8)
	{
		wait(0.25);
	}
	namespace_2a78f3c::function_3abe66fd();
	wait(10);
	FX delete();
	fx2 delete();
}

/*
	Name: function_f2fea700
	Namespace: namespace_c76a2593
	Checksum: 0xA95BBA7B
	Offset: 0x2190
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 784
*/
function function_f2fea700()
{
	while(1)
	{
		self waittill("trigger", player);
	}
}

/*
	Name: function_93f71d2e
	Namespace: namespace_c76a2593
	Checksum: 0xB13AF60B
	Offset: 0x21C0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 802
*/
function function_93f71d2e()
{
	level.var_6ec350e8 = 0;
	key = GetEnt("elemental_bow_demongate_pickup", "targetname");
	key thread function_983c09ce();
	var_f3015743 = GetEntArray("key_door10", "targetname");
	foreach(door in var_f3015743)
	{
		door setcursorhint("HINT_NOICON");
		door setHintString("");
		door thread function_eadb216e();
	}
}

/*
	Name: function_983c09ce
	Namespace: namespace_c76a2593
	Checksum: 0x57F1ABE4
	Offset: 0x2310
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 826
*/
function function_983c09ce()
{
	self TriggerEnable(0);
	while(!level.var_6ec350e8)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
}

/*
	Name: function_eadb216e
	Namespace: namespace_c76a2593
	Checksum: 0xC3DC2142
	Offset: 0x2380
	Size: 0x144
	Parameters: 0
	Flags: None
	Line Number: 847
*/
function function_eadb216e()
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

