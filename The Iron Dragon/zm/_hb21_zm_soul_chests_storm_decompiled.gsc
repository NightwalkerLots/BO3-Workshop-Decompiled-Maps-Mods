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

#namespace namespace_4256b380;

/*
	Name: __init__sytem__
	Namespace: namespace_4256b380
	Checksum: 0xC8516E32
	Offset: 0x720
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("zm_soul_chest_storm", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_4256b380
	Checksum: 0x54616CFA
	Offset: 0x760
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function __init__()
{
	level function_4e553e6b();
	function_d93b039d();
	thread function_c23e7939();
}

/*
	Name: function_c23e7939
	Namespace: namespace_4256b380
	Checksum: 0x5B829B77
	Offset: 0x7A8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_c23e7939()
{
	var_23f017a9 = GetEntArray("harrybo21_mpd_storm", "script_noteworthy");
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
	Namespace: namespace_4256b380
	Checksum: 0xAEFDFAB0
	Offset: 0x848
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
}

/*
	Name: function_14af7719
	Namespace: namespace_4256b380
	Checksum: 0x75B31D4B
	Offset: 0x8E0
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 117
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
	Namespace: namespace_4256b380
	Checksum: 0xDDDBC9AE
	Offset: 0xAA0
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
	trigger.script_noteworthy = "harrybo21_soul_chest_storm";
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
	Namespace: namespace_4256b380
	Checksum: 0x9ACF73B8
	Offset: 0xCA0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function function_5aed2bfc()
{
}

/*
	Name: function_efd67ce3
	Namespace: namespace_4256b380
	Checksum: 0xB15B75AA
	Offset: 0xCB0
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
	return;
}

/*
	Name: function_d93b039d
	Namespace: namespace_4256b380
	Checksum: 0x69CDD778
	Offset: 0xD80
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function function_d93b039d()
{
	var_46acd473 = function_fcb8ed7a();
	function_64d1d7d();
	for(i = 0; i < var_46acd473.size; i++)
	{
		function_69799a3a(var_46acd473[i]);
	}
	zm_spawner::add_custom_zombie_spawn_logic(&function_99e90c2);
	return;
}

/*
	Name: function_64d1d7d
	Namespace: namespace_4256b380
	Checksum: 0xCF3532F5
	Offset: 0xE28
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 247
*/
function function_64d1d7d()
{
	zombie_utility::set_zombie_var("soulchest_initial_limit_storm", 25);
	zombie_utility::set_zombie_var("soulchest_limit_multiplier_storm", 2);
	zombie_utility::set_zombie_var("soulchest_timeout_storm", 600);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_69799a3a
	Namespace: namespace_4256b380
	Checksum: 0xD8DCF76
	Offset: 0xE98
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 266
*/
function function_69799a3a(struct)
{
	while(!level.var_7ed3794d)
	{
		wait(0.25);
	}
	struct.spawned = 1;
	trigger = spawn("trigger_radius_use", struct.origin, 0, 256, 128);
	trigger.angles = struct.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_storm";
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
	Name: function_49ba18c
	Namespace: namespace_4256b380
	Checksum: 0xC8CAD831
	Offset: 0x1088
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 300
*/
function function_49ba18c()
{
	self.collision connectpaths();
	self.collision delete();
	self.linked_model delete();
	self delete();
	return;
}

/*
	Name: function_e8f50557
	Namespace: namespace_4256b380
	Checksum: 0x71B925FD
	Offset: 0x10F8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 319
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
		zombies[i] thread function_99e90c2();
	}
	wait(0.05);
}

/*
	Name: function_99e90c2
	Namespace: namespace_4256b380
	Checksum: 0x5D6C53DF
	Offset: 0x1198
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 344
*/
function function_99e90c2()
{
	self endon("delete");
	self waittill("death");
	if(!isdefined(self.attacker) || !isPlayer(self.attacker))
	{
		return;
	}
	var_46ea0e80 = function_f3b47ee3();
	var_46ea0e80 = util::get_array_of_closest(self.origin, var_46ea0e80, undefined, undefined, undefined);
	if(!isdefined(var_46ea0e80) || var_46ea0e80.size < 1)
	{
		return;
	}
	for(i = 0; i < var_46ea0e80.size; i++)
	{
		if(!function_bbd653d0(self, var_46ea0e80[i]))
		{
			continue;
		}
		var_46ea0e80[i] function_2f221507(self);
		break;
	}
}

/*
	Name: function_bbd653d0
	Namespace: namespace_4256b380
	Checksum: 0xF83BD194
	Offset: 0x12C8
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 379
*/
function function_bbd653d0(zombie, trigger)
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
	Name: function_3512a7db
	Namespace: namespace_4256b380
	Checksum: 0xEBC1BE0C
	Offset: 0x1360
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 402
*/
function function_3512a7db()
{
	self.active = 1;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	self.var_49bdbcdb = spawn("script_model", self.linked_model.origin);
	self.var_49bdbcdb.angles = self.linked_model.angles + VectorScale((0, 1, 0), 90);
	self.var_49bdbcdb SetModel("tag_origin");
	self.var_49bdbcdb PlayLoopSound("zmb_footprintbox_fire", 0.1);
	if(isdefined(self.var_afaa2468))
	{
		[[self.var_afaa2468]]();
		continue;
	}
	PlayFXOnTag("zombie/fx_ee_altar_mist_zod_zmb", self.var_49bdbcdb, "tag_origin");
	self function_7d79dd8f("p7_fxanim_zm_ori_challenge_box_open_anim");
	self thread function_8552ef50();
}

/*
	Name: function_95f728b1
	Namespace: namespace_4256b380
	Checksum: 0xA0C02792
	Offset: 0x14C8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 432
*/
function function_95f728b1()
{
	if(isdefined(self.var_49bdbcdb))
	{
		self.var_49bdbcdb StopLoopSound(0.1);
		self.var_49bdbcdb delete();
	}
	self function_7d79dd8f("p7_fxanim_zm_ori_challenge_box_close_anim");
	self.active = 0;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	return;
}

/*
	Name: function_8552ef50
	Namespace: namespace_4256b380
	Checksum: 0x9025CBBB
	Offset: 0x1570
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 457
*/
function function_8552ef50()
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
	while(self.timer < level.zombie_vars["soulchest_timeout_storm"])
	{
		self.timer++;
		wait(1);
	}
	self notify("hash_4dd2f7b6");
}

/*
	Name: function_7d79dd8f
	Namespace: namespace_4256b380
	Checksum: 0x73AAE6EB
	Offset: 0x1610
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 487
*/
function function_7d79dd8f(animation)
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
	model function_8f231c15();
	model AnimScripted(animation, model.origin, model.angles, animation);
	wait(getanimlength(animation));
	self.var_8a63adfb = undefined;
}

/*
	Name: function_8f231c15
	Namespace: namespace_4256b380
	Checksum: 0x792601B3
	Offset: 0x1700
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 515
*/
function function_8f231c15()
{
	if(!isdefined(self.model) || self.model != "tag_origin")
	{
		return;
	}
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_open_anim", 0);
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_close_anim", 0);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2f221507
	Namespace: namespace_4256b380
	Checksum: 0x1E6B02ED
	Offset: 0x1778
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 538
*/
function function_2f221507(zombie)
{
	if(isdefined(self.var_29065fee) && self.var_29065fee)
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!(isdefined(self.active) && self.active))
	{
		self thread function_3512a7db();
	}
	self function_92c41110(zombie);
	if(isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= self.var_c29b85d1)
	{
		self function_94eb598();
	}
	else if(!isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= level.zombie_vars["soulchest_initial_limit_storm"])
	{
		self function_94eb598();
		return;
	}
}

/*
	Name: function_92c41110
	Namespace: namespace_4256b380
	Checksum: 0x8524E353
	Offset: 0x1888
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 574
*/
function function_92c41110(zombie)
{
	self.timer = 0;
	self.var_21aeaaf7++;
	ent = spawn("script_model", zombie GetTagOrigin("j_spineupper"));
	ent SetModel("tag_origin");
	PlayFXOnTag("zombie/fx_trail_blood_soul_zmb", ent, "tag_origin");
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
	Name: function_336ab67f
	Namespace: namespace_4256b380
	Checksum: 0xFE5F4E26
	Offset: 0x1A18
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 601
*/
function function_336ab67f()
{
	level.zombie_vars["soulchest_initial_limit_storm"] = level.zombie_vars["soulchest_initial_limit_storm"] + level.zombie_vars["soulchest_limit_multiplier_storm"];
}

/*
	Name: function_94eb598
	Namespace: namespace_4256b380
	Checksum: 0x9069FA48
	Offset: 0x1A60
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 616
*/
function function_94eb598()
{
	if(isdefined(self.var_29065fee) && self.var_29065fee)
	{
		return;
	}
	self.var_29065fee = 1;
	if(isdefined(self.var_385d7ee7))
	{
		return self [[self.var_385d7ee7]]();
	}
	function_336ab67f();
	self function_95f728b1();
	model = self.linked_model;
	model function_8f231c15();
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
	self function_49ba18c();
	function_94a8a5d1(origin);
}

/*
	Name: function_94a8a5d1
	Namespace: namespace_4256b380
	Checksum: 0xE8A68C68
	Offset: 0x1E00
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 671
*/
function function_94a8a5d1(origin)
{
	level notify("hash_93315e8a", origin);
	chests = function_f3b47ee3();
	if(!isdefined(chests) || chests.size < 1)
	{
		return function_4a40f449(origin);
	}
}

/*
	Name: function_4a40f449
	Namespace: namespace_4256b380
	Checksum: 0x241A9A9A
	Offset: 0x1E80
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 691
*/
function function_4a40f449(origin)
{
	level notify("hash_742936bb", origin);
	function_1b3efe48();
}

/*
	Name: function_fcb8ed7a
	Namespace: namespace_4256b380
	Checksum: 0xC20557
	Offset: 0x1EC0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 707
*/
function function_fcb8ed7a()
{
	return struct::get_array("harrybo21_soul_chest_storm", "script_noteworthy");
}

/*
	Name: function_f3b47ee3
	Namespace: namespace_4256b380
	Checksum: 0xEB1EBF2C
	Offset: 0x1EF0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 722
*/
function function_f3b47ee3()
{
	return GetEntArray("harrybo21_soul_chest_storm", "script_noteworthy");
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_906157e9
	Namespace: namespace_4256b380
	Checksum: 0x9BE4354E
	Offset: 0x1F20
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 738
*/
function function_906157e9()
{
	excluders = GetEntArray("harrybo21_chest_ignore_area_storm", "targetname");
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
	Name: function_1b3efe48
	Namespace: namespace_4256b380
	Checksum: 0x908E2973
	Offset: 0x1FC8
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 765
*/
function function_1b3efe48()
{
	level flag::init("elemental_storm_upgraded");
	FX = spawn("script_model", (-606.75, -2054.75, -542.25));
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["stormaura"], FX, "tag_origin");
	fx2 = spawn("script_model", (-606, -2055, -581));
	fx2 SetModel("tag_origin");
	PlayFXOnTag(level._effect["runeshaft"], fx2, "tag_origin");
	playsoundatposition("zmb_bow_ascend_base", (-604.75, -2058.75, -522.25));
	level.var_240dfb3d = 1;
	wait(0.25);
	while(!level.var_240dfb3d)
	{
		wait(0.25);
	}
	namespace_2a78f3c::function_f4b84c12();
	wait(10);
	FX delete();
	fx2 delete();
}

/*
	Name: function_b969738f
	Namespace: namespace_4256b380
	Checksum: 0x308CFDB7
	Offset: 0x21A8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 797
*/
function function_b969738f()
{
	while(1)
	{
		self waittill("trigger", player);
	}
}

/*
	Name: function_4e553e6b
	Namespace: namespace_4256b380
	Checksum: 0xB20FBA68
	Offset: 0x21D8
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 815
*/
function function_4e553e6b()
{
	level.var_240dfb3d = 0;
	key = GetEnt("elemental_bow_pickup", "targetname");
	key thread function_c46b680b();
	var_62bb9f70 = GetEntArray("key_door8", "targetname");
	foreach(door in var_62bb9f70)
	{
		door setcursorhint("HINT_NOICON");
		door setHintString("The Summoning Key Is Required");
		door thread function_5284d12b();
	}
}

/*
	Name: function_c46b680b
	Namespace: namespace_4256b380
	Checksum: 0x1EFBC7B4
	Offset: 0x2328
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 839
*/
function function_c46b680b()
{
	self TriggerEnable(0);
	while(!level.var_240dfb3d)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5284d12b
	Namespace: namespace_4256b380
	Checksum: 0xCFE576CA
	Offset: 0x2398
	Size: 0x144
	Parameters: 0
	Flags: None
	Line Number: 862
*/
function function_5284d12b()
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

