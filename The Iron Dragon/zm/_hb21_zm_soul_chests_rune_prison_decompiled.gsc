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

#namespace namespace_b43a11e1;

/*
	Name: __init__sytem__
	Namespace: namespace_b43a11e1
	Checksum: 0x1CE019C8
	Offset: 0x728
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("zm_soul_chest_rune_prison", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b43a11e1
	Checksum: 0x6B95745E
	Offset: 0x768
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function __init__()
{
	level function_b9f99797();
	function_a482185e();
	thread function_6a30692();
}

/*
	Name: function_6a30692
	Namespace: namespace_b43a11e1
	Checksum: 0x415328CD
	Offset: 0x7B0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_6a30692()
{
	var_23f017a9 = GetEntArray("harrybo21_mpd_rune_prison", "script_noteworthy");
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
	Namespace: namespace_b43a11e1
	Checksum: 0xCA12988D
	Offset: 0x850
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
	Namespace: namespace_b43a11e1
	Checksum: 0x346FF858
	Offset: 0x8E8
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
	return;
}

/*
	Name: function_1ca1fc6d
	Namespace: namespace_b43a11e1
	Checksum: 0x5D5BAE95
	Offset: 0xAA8
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
	trigger.script_noteworthy = "harrybo21_soul_chest_rune_prison";
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
	Namespace: namespace_b43a11e1
	Checksum: 0x9ACF73B8
	Offset: 0xCA8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 184
*/
function function_5aed2bfc()
{
	return;
}

/*
	Name: function_efd67ce3
	Namespace: namespace_b43a11e1
	Checksum: 0xC5D51621
	Offset: 0xCB8
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 199
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
	Name: function_a482185e
	Namespace: namespace_b43a11e1
	Checksum: 0x51A4F94D
	Offset: 0xD88
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 224
*/
function function_a482185e()
{
	var_99e2f872 = function_99f5fb();
	function_ea2c1784();
	for(i = 0; i < var_99e2f872.size; i++)
	{
		function_73d9e5bb(var_99e2f872[i]);
	}
	zm_spawner::add_custom_zombie_spawn_logic(&function_9f096693);
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_ea2c1784
	Namespace: namespace_b43a11e1
	Checksum: 0x3DD57AFA
	Offset: 0xE30
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 248
*/
function function_ea2c1784()
{
	zombie_utility::set_zombie_var("soulchest_initial_limit_rune_prison", 25);
	zombie_utility::set_zombie_var("soulchest_limit_multiplier_rune_prison", 2);
	zombie_utility::set_zombie_var("soulchest_timeout_rune_prison", 600);
}

/*
	Name: function_73d9e5bb
	Namespace: namespace_b43a11e1
	Checksum: 0x9EA6482
	Offset: 0xEA0
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 265
*/
function function_73d9e5bb(struct)
{
	while(!level.var_3984eb84)
	{
		wait(0.25);
	}
	struct.spawned = 1;
	trigger = spawn("trigger_radius_use", struct.origin, 0, 256, 128);
	trigger.angles = struct.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_rune_prison";
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
	ERROR: Bad function call
}

/*
	Name: function_2d616a65
	Namespace: namespace_b43a11e1
	Checksum: 0x3DA72D5F
	Offset: 0x1090
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 302
*/
function function_2d616a65()
{
	self.collision connectpaths();
	self.collision delete();
	self.linked_model delete();
	self delete();
}

/*
	Name: function_e8f50557
	Namespace: namespace_b43a11e1
	Checksum: 0xCE2F55BD
	Offset: 0x1100
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 320
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
		zombies[i] thread function_9f096693();
	}
	wait(0.05);
}

/*
	Name: function_9f096693
	Namespace: namespace_b43a11e1
	Checksum: 0xF31B821
	Offset: 0x11A0
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 345
*/
function function_9f096693()
{
	self endon("delete");
	self waittill("death");
	if(!isdefined(self.attacker) || !isPlayer(self.attacker))
	{
		return;
	}
	var_8b5a94e1 = function_b67bc702();
	var_8b5a94e1 = util::get_array_of_closest(self.origin, var_8b5a94e1, undefined, undefined, undefined);
	if(!isdefined(var_8b5a94e1) || var_8b5a94e1.size < 1)
	{
		return;
	}
	for(i = 0; i < var_8b5a94e1.size; i++)
	{
		if(!function_dbe7591(self, var_8b5a94e1[i]))
		{
			continue;
		}
		var_8b5a94e1[i] function_6edf6e6e(self);
		break;
	}
	return;
	var_8b5a94e1++;
}

/*
	Name: function_dbe7591
	Namespace: namespace_b43a11e1
	Checksum: 0x4C273D80
	Offset: 0x12D0
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 382
*/
function function_dbe7591(zombie, trigger)
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
	Name: function_ae61b18a
	Namespace: namespace_b43a11e1
	Checksum: 0xD037BEF6
	Offset: 0x1368
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 405
*/
function function_ae61b18a()
{
	self.active = 1;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	self.var_d30c1e8a = spawn("script_model", self.linked_model.origin);
	self.var_d30c1e8a.angles = self.linked_model.angles + VectorScale((0, 1, 0), 90);
	self.var_d30c1e8a SetModel("tag_origin");
	self.var_d30c1e8a PlayLoopSound("zmb_footprintbox_fire", 0.1);
	if(isdefined(self.var_afaa2468))
	{
		[[self.var_afaa2468]]();
		continue;
	}
	PlayFXOnTag("zombie/fx_ee_altar_mist_zod_zmb", self.var_d30c1e8a, "tag_origin");
	self function_dec4cf66("p7_fxanim_zm_ori_challenge_box_open_anim");
	self thread function_e37a3511();
}

/*
	Name: function_4498bd60
	Namespace: namespace_b43a11e1
	Checksum: 0x7AEDAF4F
	Offset: 0x14D0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 435
*/
function function_4498bd60()
{
	if(isdefined(self.var_d30c1e8a))
	{
		self.var_d30c1e8a StopLoopSound(0.1);
		self.var_d30c1e8a delete();
	}
	self function_dec4cf66("p7_fxanim_zm_ori_challenge_box_close_anim");
	self.active = 0;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	return;
}

/*
	Name: function_e37a3511
	Namespace: namespace_b43a11e1
	Checksum: 0x1E6978DD
	Offset: 0x1578
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 460
*/
function function_e37a3511()
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
	while(self.timer < level.zombie_vars["soulchest_timeout_rune_prison"])
	{
		self.timer++;
		wait(1);
	}
	self notify("hash_4dd2f7b6");
}

/*
	Name: function_dec4cf66
	Namespace: namespace_b43a11e1
	Checksum: 0x8661D3AB
	Offset: 0x1618
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 490
*/
function function_dec4cf66(animation)
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
	model function_376d07ec();
	model AnimScripted(animation, model.origin, model.angles, animation);
	wait(getanimlength(animation));
	self.var_8a63adfb = undefined;
}

/*
	Name: function_376d07ec
	Namespace: namespace_b43a11e1
	Checksum: 0xEE88F5F
	Offset: 0x1708
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 518
*/
function function_376d07ec()
{
	if(!isdefined(self.model) || self.model != "tag_origin")
	{
		return;
	}
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_open_anim", 0);
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_close_anim", 0);
}

/*
	Name: function_6edf6e6e
	Namespace: namespace_b43a11e1
	Checksum: 0x7930654D
	Offset: 0x1780
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 538
*/
function function_6edf6e6e(zombie)
{
	if(isdefined(self.var_14848b37) && self.var_14848b37)
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!(isdefined(self.active) && self.active))
	{
		self thread function_ae61b18a();
	}
	self function_87b9dfd1(zombie);
	if(isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= self.var_c29b85d1)
	{
		self function_b068e1a9();
	}
	else if(!isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= level.zombie_vars["soulchest_initial_limit_rune_prison"])
	{
		self function_b068e1a9();
	}
}

/*
	Name: function_87b9dfd1
	Namespace: namespace_b43a11e1
	Checksum: 0x49178873
	Offset: 0x1890
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 573
*/
function function_87b9dfd1(zombie)
{
	self.timer = 0;
	self.var_21aeaaf7++;
	ent = spawn("script_model", zombie GetTagOrigin("j_spineupper"));
	ent SetModel("tag_origin");
	PlayFXOnTag("zombie/fx_trail_blood_soul_zmb_rune_prison", ent, "tag_origin");
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
	Name: function_6d4290f6
	Namespace: namespace_b43a11e1
	Checksum: 0x2CBEFC8D
	Offset: 0x1A20
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 600
*/
function function_6d4290f6()
{
	level.zombie_vars["soulchest_initial_limit_rune_prison"] = level.zombie_vars["soulchest_initial_limit_rune_prison"] + level.zombie_vars["soulchest_limit_multiplier_rune_prison"];
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b068e1a9
	Namespace: namespace_b43a11e1
	Checksum: 0x8112A1E2
	Offset: 0x1A68
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 617
*/
function function_b068e1a9()
{
	if(isdefined(self.var_14848b37) && self.var_14848b37)
	{
		return;
	}
	self.var_14848b37 = 1;
	if(isdefined(self.var_385d7ee7))
	{
		return self [[self.var_385d7ee7]]();
	}
	function_6d4290f6();
	self function_4498bd60();
	model = self.linked_model;
	model function_376d07ec();
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
	self function_2d616a65();
	function_7ce894c0(origin);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7ce894c0
	Namespace: namespace_b43a11e1
	Checksum: 0x4EF49825
	Offset: 0x1E08
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 674
*/
function function_7ce894c0(origin)
{
	level notify("hash_edcb97ab", origin);
	chests = function_b67bc702();
	if(!isdefined(chests) || chests.size < 1)
	{
		return function_a14bb968(origin);
	}
}

/*
	Name: function_a14bb968
	Namespace: namespace_b43a11e1
	Checksum: 0x82CD9C7E
	Offset: 0x1E88
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 694
*/
function function_a14bb968(origin)
{
	level notify("hash_7ebcf72a", origin);
	function_17c069f9();
}

/*
	Name: function_99f5fb
	Namespace: namespace_b43a11e1
	Checksum: 0x554E13C4
	Offset: 0x1EC8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 710
*/
function function_99f5fb()
{
	return struct::get_array("harrybo21_soul_chest_rune_prison", "script_noteworthy");
}

/*
	Name: function_b67bc702
	Namespace: namespace_b43a11e1
	Checksum: 0x90055F9E
	Offset: 0x1EF8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 725
*/
function function_b67bc702()
{
	return GetEntArray("harrybo21_soul_chest_rune_prison", "script_noteworthy");
}

/*
	Name: function_a0b88348
	Namespace: namespace_b43a11e1
	Checksum: 0x22534523
	Offset: 0x1F28
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 740
*/
function function_a0b88348()
{
	excluders = GetEntArray("harrybo21_chest_ignore_area_rune_prison", "targetname");
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
	Name: function_17c069f9
	Namespace: namespace_b43a11e1
	Checksum: 0x458940F0
	Offset: 0x1FD0
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 767
*/
function function_17c069f9()
{
	level flag::init("elemental_rune_prison_upgraded");
	FX = spawn("script_model", (-341.5, -2055, -540.5));
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["runearrowglow"], FX, "tag_origin");
	fx2 = spawn("script_model", (-341.5, -2055, -500));
	fx2 SetModel("tag_origin");
	PlayFXOnTag(level._effect["runeshaft"], fx2, "tag_origin");
	playsoundatposition("zmb_bow_ascend_base", (-341.5, -2055, -540.5));
	level.var_ea692787 = 1;
	wait(0.25);
	while(!level.var_ea692787)
	{
		wait(0.25);
	}
	namespace_2a78f3c::function_41b003c3();
	wait(10);
	FX delete();
	fx2 delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2287b566
	Namespace: namespace_b43a11e1
	Checksum: 0x9633C541
	Offset: 0x21B0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 801
*/
function function_2287b566()
{
	while(1)
	{
		self waittill("trigger", player);
	}
}

/*
	Name: function_b9f99797
	Namespace: namespace_b43a11e1
	Checksum: 0xC8345FCD
	Offset: 0x21E0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 819
*/
function function_b9f99797()
{
	level.var_ea692787 = 0;
	key = GetEnt("elemental_bow_rune_prison_pickup", "targetname");
	key thread function_be3e8437();
	var_ccfedcda = GetEntArray("key_door11", "targetname");
	foreach(door in var_ccfedcda)
	{
		door setcursorhint("HINT_NOICON");
		door setHintString("");
		door thread function_10dd9bd7();
	}
}

/*
	Name: function_be3e8437
	Namespace: namespace_b43a11e1
	Checksum: 0xB734BA46
	Offset: 0x2330
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 843
*/
function function_be3e8437()
{
	self TriggerEnable(0);
	while(!level.var_ea692787)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
}

/*
	Name: function_10dd9bd7
	Namespace: namespace_b43a11e1
	Checksum: 0x7DB17B21
	Offset: 0x23A0
	Size: 0x144
	Parameters: 0
	Flags: None
	Line Number: 864
*/
function function_10dd9bd7()
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

