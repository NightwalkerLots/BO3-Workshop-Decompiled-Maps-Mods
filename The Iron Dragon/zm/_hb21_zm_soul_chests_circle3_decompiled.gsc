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

#namespace namespace_5e97fc94;

/*
	Name: __init__sytem__
	Namespace: namespace_5e97fc94
	Checksum: 0xC8CA3267
	Offset: 0x6C0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("zm_soul_chest_circle3", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_5e97fc94
	Checksum: 0xD9DA3204
	Offset: 0x700
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function __init__()
{
	level function_f40b19db();
	function_a3431159();
	thread function_941736ed();
}

/*
	Name: function_941736ed
	Namespace: namespace_5e97fc94
	Checksum: 0xE98FA281
	Offset: 0x748
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_941736ed()
{
	var_23f017a9 = GetEntArray("harrybo21_mpd_circle3", "script_noteworthy");
	if(!isdefined(var_23f017a9) || var_23f017a9.size < 1)
	{
		return;
	}
	for(i = 0; i < var_23f017a9.size; i++)
	{
		var_23f017a9[i] function_e02b3458();
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e02b3458
	Namespace: namespace_5e97fc94
	Checksum: 0x7922B06
	Offset: 0x7E8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function function_e02b3458()
{
	self thread function_14af7719();
	tubes = GetEntArray(self.targetname, "target");
	for(i = 0; i < tubes.size; i++)
	{
		tubes[i] thread function_1ca1fc6d(self);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_14af7719
	Namespace: namespace_5e97fc94
	Checksum: 0xC70923EE
	Offset: 0x880
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
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1ca1fc6d
	Namespace: namespace_5e97fc94
	Checksum: 0x6B32D093
	Offset: 0xA40
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 151
*/
function function_1ca1fc6d(var_4fb6b147)
{
	fraction = 13.33333;
	trigger = spawn("trigger_radius_use", self.origin + VectorScale((0, 0, 1), 40), 0, 256, 128);
	trigger.angles = self.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_circle3";
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
	Namespace: namespace_5e97fc94
	Checksum: 0x9ACF73B8
	Offset: 0xC40
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 190
*/
function function_5aed2bfc()
{
}

/*
	Name: function_efd67ce3
	Namespace: namespace_5e97fc94
	Checksum: 0x8E449B11
	Offset: 0xC50
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 204
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
	Name: function_a3431159
	Namespace: namespace_5e97fc94
	Checksum: 0x2D3CF014
	Offset: 0xD20
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 229
*/
function function_a3431159()
{
	var_8fa3ff57 = function_bb37ac42();
	function_2a553035();
	for(i = 0; i < var_8fa3ff57.size; i++)
	{
		function_be52b482(var_8fa3ff57[i]);
	}
	zm_spawner::add_custom_zombie_spawn_logic(&function_adbb496a);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2a553035
	Namespace: namespace_5e97fc94
	Checksum: 0x93B761E3
	Offset: 0xDC8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 252
*/
function function_2a553035()
{
	zombie_utility::set_zombie_var("soulchest_initial_limit_circle3", 10);
	zombie_utility::set_zombie_var("soulchest_limit_multiplier_circle3", 2);
	zombie_utility::set_zombie_var("soulchest_timeout_circle3", 600);
}

/*
	Name: function_be52b482
	Namespace: namespace_5e97fc94
	Checksum: 0xBF7C2F90
	Offset: 0xE38
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 269
*/
function function_be52b482(struct)
{
	while(!level.var_436987e6)
	{
		wait(0.25);
	}
	struct.spawned = 1;
	trigger = spawn("trigger_radius_use", struct.origin, 0, 256, 128);
	trigger.angles = struct.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_circle3";
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
	Name: function_4773c888
	Namespace: namespace_5e97fc94
	Checksum: 0x1EA6F8CF
	Offset: 0x1028
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 303
*/
function function_4773c888()
{
	self.collision connectpaths();
	self.collision delete();
	self.linked_model delete();
	self delete();
	return;
}

/*
	Name: function_e8f50557
	Namespace: namespace_5e97fc94
	Checksum: 0x4E600326
	Offset: 0x1098
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 322
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
		zombies[i] thread function_adbb496a();
	}
	wait(0.05);
}

/*
	Name: function_adbb496a
	Namespace: namespace_5e97fc94
	Checksum: 0xC195F536
	Offset: 0x1138
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 347
*/
function function_adbb496a()
{
	self endon("delete");
	self waittill("death");
	if(!isdefined(self.attacker) || !isPlayer(self.attacker))
	{
		return;
	}
	var_2e664f94 = function_f16d4b67();
	var_2e664f94 = util::get_array_of_closest(self.origin, var_2e664f94, undefined, undefined, undefined);
	if(!isdefined(var_2e664f94) || var_2e664f94.size < 1)
	{
		return;
	}
	for(i = 0; i < var_2e664f94.size; i++)
	{
		if(!function_a2929444(self, var_2e664f94[i]))
		{
			continue;
		}
		var_2e664f94[i] function_91523433(self);
		break;
	}
}

/*
	Name: function_a2929444
	Namespace: namespace_5e97fc94
	Checksum: 0xC7598016
	Offset: 0x1268
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 382
*/
function function_a2929444(zombie, trigger)
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
	Name: function_af5662df
	Namespace: namespace_5e97fc94
	Checksum: 0x17CDC881
	Offset: 0x1300
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 405
*/
function function_af5662df()
{
	self.active = 1;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	self.var_db83ffdf = spawn("script_model", self.linked_model.origin);
	self.var_db83ffdf.angles = self.linked_model.angles + VectorScale((0, 1, 0), 90);
	self.var_db83ffdf SetModel("tag_origin");
	self.var_db83ffdf PlayLoopSound("zmb_footprintbox_fire", 0.1);
	if(isdefined(self.var_afaa2468))
	{
		[[self.var_afaa2468]]();
		continue;
	}
	PlayFXOnTag("zombie/fx_ee_altar_mist_zod_zmb", self.var_db83ffdf, "tag_origin");
	self function_2363b8bb("p7_fxanim_zm_ori_challenge_box_open_anim");
	self thread function_dfc95bc4();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8a6f7261
	Namespace: namespace_5e97fc94
	Checksum: 0x945B23D2
	Offset: 0x1468
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 437
*/
function function_8a6f7261()
{
	if(isdefined(self.var_db83ffdf))
	{
		self.var_db83ffdf StopLoopSound(0.1);
		self.var_db83ffdf delete();
	}
	self function_2363b8bb("p7_fxanim_zm_ori_challenge_box_close_anim");
	self.active = 0;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dfc95bc4
	Namespace: namespace_5e97fc94
	Checksum: 0x2B01B287
	Offset: 0x1510
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 463
*/
function function_dfc95bc4()
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
	while(self.timer < level.zombie_vars["soulchest_timeout_circle3"])
	{
		self.timer++;
		wait(1);
	}
	self notify("hash_4dd2f7b6");
}

/*
	Name: function_2363b8bb
	Namespace: namespace_5e97fc94
	Checksum: 0x212B42A0
	Offset: 0x15B0
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 493
*/
function function_2363b8bb(animation)
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
	model function_6053558d();
	model AnimScripted(animation, model.origin, model.angles, animation);
	wait(getanimlength(animation));
	self.var_8a63adfb = undefined;
}

/*
	Name: function_6053558d
	Namespace: namespace_5e97fc94
	Checksum: 0x618CD5AE
	Offset: 0x16A0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 521
*/
function function_6053558d()
{
	if(!isdefined(self.model) || self.model != "tag_origin")
	{
		return;
	}
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_open_anim", 0);
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_close_anim", 0);
}

/*
	Name: function_91523433
	Namespace: namespace_5e97fc94
	Checksum: 0x5EEB9A54
	Offset: 0x1718
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 541
*/
function function_91523433(zombie)
{
	if(isdefined(self.var_95de7fae) && self.var_95de7fae)
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!(isdefined(self.active) && self.active))
	{
		self thread function_af5662df();
	}
	self function_f2171a04(zombie);
	if(isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= self.var_c29b85d1)
	{
		self function_6a0e5b4c();
	}
	else if(!isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= level.zombie_vars["soulchest_initial_limit_circle3"])
	{
		self function_6a0e5b4c();
	}
}

/*
	Name: function_f2171a04
	Namespace: namespace_5e97fc94
	Checksum: 0x81F4C2D0
	Offset: 0x1828
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 576
*/
function function_f2171a04(zombie)
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
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1a9ba74b
	Namespace: namespace_5e97fc94
	Checksum: 0x85353B2C
	Offset: 0x19B8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 605
*/
function function_1a9ba74b()
{
	level.zombie_vars["soulchest_initial_limit_circle3"] = level.zombie_vars["soulchest_initial_limit_circle3"] + level.zombie_vars["soulchest_limit_multiplier_circle3"];
}

/*
	Name: function_6a0e5b4c
	Namespace: namespace_5e97fc94
	Checksum: 0x8FFAF8DA
	Offset: 0x1A00
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 620
*/
function function_6a0e5b4c()
{
	if(isdefined(self.var_95de7fae) && self.var_95de7fae)
	{
		return;
	}
	self.var_95de7fae = 1;
	if(isdefined(self.var_385d7ee7))
	{
		return self [[self.var_385d7ee7]]();
	}
	function_1a9ba74b();
	self function_8a6f7261();
	model = self.linked_model;
	model function_6053558d();
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
	self function_4773c888();
	function_e2487c01(origin);
}

/*
	Name: function_e2487c01
	Namespace: namespace_5e97fc94
	Checksum: 0xF985622B
	Offset: 0x1DA0
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 675
*/
function function_e2487c01(origin)
{
	level notify("hash_d0450632", origin);
	chests = function_f16d4b67();
	if(!isdefined(chests) || chests.size < 1)
	{
		return function_4944af99(origin);
	}
}

/*
	Name: function_4944af99
	Namespace: namespace_5e97fc94
	Checksum: 0x88912BBB
	Offset: 0x1E20
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 695
*/
function function_4944af99(origin)
{
	level notify("hash_c90a903f", origin);
	function_57efd09c();
}

/*
	Name: function_bb37ac42
	Namespace: namespace_5e97fc94
	Checksum: 0x1FD402C9
	Offset: 0x1E60
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 711
*/
function function_bb37ac42()
{
	return struct::get_array("harrybo21_soul_chest_circle3", "script_noteworthy");
}

/*
	Name: function_f16d4b67
	Namespace: namespace_5e97fc94
	Checksum: 0x202C5C06
	Offset: 0x1E90
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 726
*/
function function_f16d4b67()
{
	return GetEntArray("harrybo21_soul_chest_circle3", "script_noteworthy");
}

/*
	Name: function_13381ab9
	Namespace: namespace_5e97fc94
	Checksum: 0x2E080E12
	Offset: 0x1EC0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 741
*/
function function_13381ab9()
{
	excluders = GetEntArray("harrybo21_chest_ignore_area_circle3", "targetname");
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
	Name: function_57efd09c
	Namespace: namespace_5e97fc94
	Checksum: 0x205A4241
	Offset: 0x1F68
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 768
*/
function function_57efd09c()
{
	level flag::init("elemental_circle3_upgraded");
	FX = spawn("script_model", (-409.25, 902.5, 865.25));
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["runecirclecomplete"], FX, "tag_origin");
	playsoundatposition("fill", (-406.25, 900.75, 916.75));
	level.var_3f94d37b = 1;
	wait(0.25);
	while(!level.var_3f94d37b)
	{
		wait(0.25);
	}
}

/*
	Name: function_f40b19db
	Namespace: namespace_5e97fc94
	Checksum: 0xEEA37F30
	Offset: 0x2078
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 793
*/
function function_f40b19db()
{
	level.var_3f94d37b = 0;
	thread function_9648febb();
}

/*
	Name: function_9648febb
	Namespace: namespace_5e97fc94
	Checksum: 0x2BAD843D
	Offset: 0x20A8
	Size: 0x64
	Parameters: 0
	Flags: None
	Line Number: 809
*/
function function_9648febb()
{
	self TriggerEnable(0);
	while(!level.var_3f94d37b)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
}

