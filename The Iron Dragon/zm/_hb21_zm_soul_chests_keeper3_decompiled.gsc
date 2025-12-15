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

#namespace namespace_44c26dea;

/*
	Name: __init__sytem__
	Namespace: namespace_44c26dea
	Checksum: 0xC60E408E
	Offset: 0x6E8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("zm_soul_chest_keeper3", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_44c26dea
	Checksum: 0xE97D16F3
	Offset: 0x728
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function __init__()
{
	level function_175b37b7();
	function_151223b3();
	thread function_86dd64bf();
}

/*
	Name: function_86dd64bf
	Namespace: namespace_44c26dea
	Checksum: 0x1C00874
	Offset: 0x770
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function function_86dd64bf()
{
	var_23f017a9 = GetEntArray("harrybo21_mpd_keeper3", "script_noteworthy");
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
	Namespace: namespace_44c26dea
	Checksum: 0xD15D8718
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
	Namespace: namespace_44c26dea
	Checksum: 0xEB2CC217
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
	return;
}

/*
	Name: function_1ca1fc6d
	Namespace: namespace_44c26dea
	Checksum: 0x5BF38DE1
	Offset: 0xA68
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 146
*/
function function_1ca1fc6d(var_4fb6b147)
{
	fraction = 13.33333;
	trigger = spawn("trigger_radius_use", self.origin + VectorScale((0, 0, 1), 40), 0, 256, 128);
	trigger.angles = self.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_keeper3";
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
	return;
}

/*
	Name: function_5aed2bfc
	Namespace: namespace_44c26dea
	Checksum: 0x9ACF73B8
	Offset: 0xC68
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 186
*/
function function_5aed2bfc()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_efd67ce3
	Namespace: namespace_44c26dea
	Checksum: 0x900BCF9E
	Offset: 0xC78
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 202
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
	Name: function_151223b3
	Namespace: namespace_44c26dea
	Checksum: 0x8E18B8FF
	Offset: 0xD48
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 227
*/
function function_151223b3()
{
	var_52266ad9 = function_82f5fcf4();
	function_cf933c53();
	for(i = 0; i < var_52266ad9.size; i++)
	{
		function_119b734(var_52266ad9[i]);
	}
	zm_spawner::add_custom_zombie_spawn_logic(&function_48aa720c);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: function_cf933c53
	Namespace: namespace_44c26dea
	Checksum: 0xEBC3A99A
	Offset: 0xDF0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 251
*/
function function_cf933c53()
{
	zombie_utility::set_zombie_var("soulchest_initial_limit_keeper3", 25);
	zombie_utility::set_zombie_var("soulchest_limit_multiplier_keeper3", 2);
	zombie_utility::set_zombie_var("soulchest_timeout_keeper3", 600);
	return;
}

/*
	Name: function_119b734
	Namespace: namespace_44c26dea
	Checksum: 0xAB96BAA8
	Offset: 0xE60
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 269
*/
function function_119b734(struct)
{
	while(!level.var_949b13ef)
	{
		wait(0.25);
	}
	struct.spawned = 1;
	trigger = spawn("trigger_radius_use", struct.origin, 0, 256, 128);
	trigger.angles = struct.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_keeper3";
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
	Name: function_64652786
	Namespace: namespace_44c26dea
	Checksum: 0x64A7AF55
	Offset: 0x1050
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 303
*/
function function_64652786()
{
	self.collision connectpaths();
	self.collision delete();
	self.linked_model delete();
	self delete();
}

/*
	Name: function_e8f50557
	Namespace: namespace_44c26dea
	Checksum: 0x3B6C396F
	Offset: 0x10C0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 321
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
		zombies[i] thread function_48aa720c();
	}
	wait(0.05);
}

/*
	Name: function_48aa720c
	Namespace: namespace_44c26dea
	Checksum: 0xD0CD6D68
	Offset: 0x1160
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 346
*/
function function_48aa720c()
{
	self endon("delete");
	self waittill("death");
	if(!isdefined(self.attacker) || !isPlayer(self.attacker))
	{
		return;
	}
	var_1490c0ea = function_432e3b49();
	var_1490c0ea = util::get_array_of_closest(self.origin, var_1490c0ea, undefined, undefined, undefined);
	if(!isdefined(var_1490c0ea) || var_1490c0ea.size < 1)
	{
		return;
	}
	for(i = 0; i < var_1490c0ea.size; i++)
	{
		if(!function_699e0c3a(self, var_1490c0ea[i]))
		{
			continue;
		}
		var_1490c0ea[i] function_754d937d(self);
		break;
	}
}

/*
	Name: function_699e0c3a
	Namespace: namespace_44c26dea
	Checksum: 0xE4C82F86
	Offset: 0x1290
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 381
*/
function function_699e0c3a(zombie, trigger)
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
	Name: function_6c1e5c31
	Namespace: namespace_44c26dea
	Checksum: 0xC8F74184
	Offset: 0x1328
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 404
*/
function function_6c1e5c31()
{
	self.active = 1;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	self.var_984bf931 = spawn("script_model", self.linked_model.origin);
	self.var_984bf931.angles = self.linked_model.angles + VectorScale((0, 1, 0), 90);
	self.var_984bf931 SetModel("tag_origin");
	self.var_984bf931 PlayLoopSound("zmb_footprintbox_fire", 0.1);
	if(isdefined(self.var_afaa2468))
	{
		[[self.var_afaa2468]]();
		continue;
	}
	PlayFXOnTag("zombie/fx_ee_altar_mist_zod_zmb", self.var_984bf931, "tag_origin");
	self function_19376d5("p7_fxanim_zm_ori_challenge_box_open_anim");
	self thread function_a6d4d3ba();
}

/*
	Name: function_225e9067
	Namespace: namespace_44c26dea
	Checksum: 0x4735A8CB
	Offset: 0x1490
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 434
*/
function function_225e9067()
{
	if(isdefined(self.var_984bf931))
	{
		self.var_984bf931 StopLoopSound(0.1);
		self.var_984bf931 delete();
	}
	self function_19376d5("p7_fxanim_zm_ori_challenge_box_close_anim");
	self.active = 0;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a6d4d3ba
	Namespace: namespace_44c26dea
	Checksum: 0xA0978C48
	Offset: 0x1538
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 460
*/
function function_a6d4d3ba()
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
	while(self.timer < level.zombie_vars["soulchest_timeout_keeper3"])
	{
		self.timer++;
		wait(1);
	}
	self notify("hash_4dd2f7b6");
}

/*
	Name: function_19376d5
	Namespace: namespace_44c26dea
	Checksum: 0x2BCB5DF
	Offset: 0x15D8
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 490
*/
function function_19376d5(animation)
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
	model function_f890583b();
	model AnimScripted(animation, model.origin, model.angles, animation);
	wait(getanimlength(animation));
	self.var_8a63adfb = undefined;
}

/*
	Name: function_f890583b
	Namespace: namespace_44c26dea
	Checksum: 0xA137FB57
	Offset: 0x16C8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 518
*/
function function_f890583b()
{
	if(!isdefined(self.model) || self.model != "tag_origin")
	{
		return;
	}
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_open_anim", 0);
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_close_anim", 0);
}

/*
	Name: function_754d937d
	Namespace: namespace_44c26dea
	Checksum: 0xD2645FA1
	Offset: 0x1740
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 538
*/
function function_754d937d(zombie)
{
	if(isdefined(self.var_fc0c0fc8) && self.var_fc0c0fc8)
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!(isdefined(self.active) && self.active))
	{
		self thread function_6c1e5c31();
	}
	self function_c954a9fa(zombie);
	if(isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= self.var_c29b85d1)
	{
		self function_20bbbe12();
	}
	else if(!isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= level.zombie_vars["soulchest_initial_limit_keeper3"])
	{
		self function_20bbbe12();
	}
}

/*
	Name: function_c954a9fa
	Namespace: namespace_44c26dea
	Checksum: 0xEF8E11E8
	Offset: 0x1850
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 573
*/
function function_c954a9fa(zombie)
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
	Name: function_81105d85
	Namespace: namespace_44c26dea
	Checksum: 0x9ED00E30
	Offset: 0x19E0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 600
*/
function function_81105d85()
{
	level.zombie_vars["soulchest_initial_limit_keeper3"] = level.zombie_vars["soulchest_initial_limit_keeper3"] + level.zombie_vars["soulchest_limit_multiplier_keeper3"];
}

/*
	Name: function_20bbbe12
	Namespace: namespace_44c26dea
	Checksum: 0x95A4EA22
	Offset: 0x1A28
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 615
*/
function function_20bbbe12()
{
	if(isdefined(self.var_fc0c0fc8) && self.var_fc0c0fc8)
	{
		return;
	}
	self.var_fc0c0fc8 = 1;
	if(isdefined(self.var_385d7ee7))
	{
		return self [[self.var_385d7ee7]]();
	}
	function_81105d85();
	self function_225e9067();
	model = self.linked_model;
	model function_f890583b();
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
	self function_64652786();
	function_22bc9187(origin);
}

/*
	Name: function_22bc9187
	Namespace: namespace_44c26dea
	Checksum: 0x8E83B703
	Offset: 0x1DC8
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 670
*/
function function_22bc9187(origin)
{
	level notify("hash_20a05f04", origin);
	chests = function_432e3b49();
	if(!isdefined(chests) || chests.size < 1)
	{
		return function_226cdf6f(origin);
	}
}

/*
	Name: function_226cdf6f
	Namespace: namespace_44c26dea
	Checksum: 0x7DA74DA4
	Offset: 0x1E48
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 690
*/
function function_226cdf6f(origin)
{
	level notify("hash_13cd9791", origin);
	function_6ac598c2();
}

/*
	Name: function_82f5fcf4
	Namespace: namespace_44c26dea
	Checksum: 0xE98A56C0
	Offset: 0x1E88
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 706
*/
function function_82f5fcf4()
{
	return struct::get_array("harrybo21_soul_chest_keeper3", "script_noteworthy");
}

/*
	Name: function_432e3b49
	Namespace: namespace_44c26dea
	Checksum: 0xCB0332A2
	Offset: 0x1EB8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 721
*/
function function_432e3b49()
{
	return GetEntArray("harrybo21_soul_chest_keeper3", "script_noteworthy");
}

/*
	Name: function_42fa7a0f
	Namespace: namespace_44c26dea
	Checksum: 0xC85BE1CF
	Offset: 0x1EE8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 736
*/
function function_42fa7a0f()
{
	excluders = GetEntArray("harrybo21_chest_ignore_area_keeper3", "targetname");
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
	Name: function_6ac598c2
	Namespace: namespace_44c26dea
	Checksum: 0x94D66798
	Offset: 0x1F90
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 763
*/
function function_6ac598c2()
{
	level flag::init("elemental_keeper3_upgraded");
	playsoundatposition("relic_pickup", (155.25, 431.25, 333.25));
	level.var_4f4f1e91 = 1;
	wait(0.25);
}

/*
	Name: function_f053fcd5
	Namespace: namespace_44c26dea
	Checksum: 0x36A501FF
	Offset: 0x2000
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 781
*/
function function_f053fcd5()
{
	while(1)
	{
		self waittill("trigger", player);
	}
}

/*
	Name: function_175b37b7
	Namespace: namespace_44c26dea
	Checksum: 0x7B532CD0
	Offset: 0x2030
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 799
*/
function function_175b37b7()
{
	level.var_4f4f1e91 = 0;
	thread function_6bfffd36();
	thread function_1b782db5();
}

/*
	Name: function_6bfffd36
	Namespace: namespace_44c26dea
	Checksum: 0x8CBDD996
	Offset: 0x2070
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 816
*/
function function_6bfffd36()
{
	self TriggerEnable(0);
	while(!level.var_4f4f1e91)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
	return;
}

/*
	Name: function_1b782db5
	Namespace: namespace_44c26dea
	Checksum: 0xE7A82A42
	Offset: 0x20E0
	Size: 0x144
	Parameters: 0
	Flags: None
	Line Number: 838
*/
function function_1b782db5()
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

