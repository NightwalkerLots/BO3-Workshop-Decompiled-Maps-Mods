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

#namespace namespace_849a76fd;

/*
	Name: __init__sytem__
	Namespace: namespace_849a76fd
	Checksum: 0x45A153C1
	Offset: 0x6C0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("zm_soul_chest_circle2", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_849a76fd
	Checksum: 0x1E060F15
	Offset: 0x700
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function __init__()
{
	level function_ce089f72();
	function_4544f09a();
	thread function_4f0d203e();
}

/*
	Name: function_4f0d203e
	Namespace: namespace_849a76fd
	Checksum: 0xA2B4255F
	Offset: 0x748
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_4f0d203e()
{
	var_23f017a9 = GetEntArray("harrybo21_mpd_circle2", "script_noteworthy");
	if(!isdefined(var_23f017a9) || var_23f017a9.size < 1)
	{
		return;
	}
	for(i = 0; i < var_23f017a9.size; i++)
	{
		var_23f017a9[i] function_e02b3458();
	}
	return;
}

/*
	Name: function_e02b3458
	Namespace: namespace_849a76fd
	Checksum: 0x26275BDE
	Offset: 0x7E8
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
	Namespace: namespace_849a76fd
	Checksum: 0x6680D3B9
	Offset: 0x880
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
	Namespace: namespace_849a76fd
	Checksum: 0x1659CA58
	Offset: 0xA40
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
	trigger.script_noteworthy = "harrybo21_soul_chest_circle2";
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
	Namespace: namespace_849a76fd
	Checksum: 0x9ACF73B8
	Offset: 0xC40
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
	Namespace: namespace_849a76fd
	Checksum: 0x66DF602D
	Offset: 0xC50
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
	Name: function_4544f09a
	Namespace: namespace_849a76fd
	Checksum: 0x3A57EC20
	Offset: 0xD20
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 223
*/
function function_4544f09a()
{
	var_69a184ee = function_e13a26ab();
	function_452b5cc();
	for(i = 0; i < var_69a184ee.size; i++)
	{
		function_e4552eeb(var_69a184ee[i]);
	}
	zm_spawner::add_custom_zombie_spawn_logic(&function_d3bdc3d3);
}

/*
	Name: function_452b5cc
	Namespace: namespace_849a76fd
	Checksum: 0x4BC8C2A9
	Offset: 0xDC8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 244
*/
function function_452b5cc()
{
	zombie_utility::set_zombie_var("soulchest_initial_limit_circle2", 10);
	zombie_utility::set_zombie_var("soulchest_limit_multiplier_circle2", 2);
	zombie_utility::set_zombie_var("soulchest_timeout_circle2", 600);
}

/*
	Name: function_e4552eeb
	Namespace: namespace_849a76fd
	Checksum: 0x8C80727A
	Offset: 0xE38
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 261
*/
function function_e4552eeb(struct)
{
	while(!level.var_ccd05855)
	{
		wait(0.25);
	}
	struct.spawned = 1;
	trigger = spawn("trigger_radius_use", struct.origin, 0, 256, 128);
	trigger.angles = struct.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_circle2";
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
	Name: function_6d7642f1
	Namespace: namespace_849a76fd
	Checksum: 0xEF60B410
	Offset: 0x1028
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 295
*/
function function_6d7642f1()
{
	self.collision connectpaths();
	self.collision delete();
	self.linked_model delete();
	self delete();
}

/*
	Name: function_e8f50557
	Namespace: namespace_849a76fd
	Checksum: 0x50468C1
	Offset: 0x1098
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 313
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
		zombies[i] thread function_d3bdc3d3();
	}
	wait(0.05);
}

/*
	Name: function_d3bdc3d3
	Namespace: namespace_849a76fd
	Checksum: 0x40F7D57C
	Offset: 0x1138
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 338
*/
function function_d3bdc3d3()
{
	self endon("delete");
	self waittill("death");
	if(!isdefined(self.attacker) || !isPlayer(self.attacker))
	{
		return;
	}
	var_5468c9fd = function_cb6ad0fe();
	var_5468c9fd = util::get_array_of_closest(self.origin, var_5468c9fd, undefined, undefined, undefined);
	if(!isdefined(var_5468c9fd) || var_5468c9fd.size < 1)
	{
		return;
	}
	for(i = 0; i < var_5468c9fd.size; i++)
	{
		if(!function_c8950ead(self, var_5468c9fd[i]))
		{
			continue;
		}
		var_5468c9fd[i] function_6b4fb9ca(self);
		break;
	}
}

/*
	Name: function_c8950ead
	Namespace: namespace_849a76fd
	Checksum: 0x54F73ABC
	Offset: 0x1268
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 373
*/
function function_c8950ead(zombie, trigger)
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
	Name: function_8953e876
	Namespace: namespace_849a76fd
	Checksum: 0x440563B
	Offset: 0x1300
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 396
*/
function function_8953e876()
{
	self.active = 1;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	self.var_b5818576 = spawn("script_model", self.linked_model.origin);
	self.var_b5818576.angles = self.linked_model.angles + VectorScale((0, 1, 0), 90);
	self.var_b5818576 SetModel("tag_origin");
	self.var_b5818576 PlayLoopSound("zmb_footprintbox_fire", 0.1);
	if(isdefined(self.var_afaa2468))
	{
		[[self.var_afaa2468]]();
		continue;
	}
	PlayFXOnTag("zombie/fx_ee_altar_mist_zod_zmb", self.var_b5818576, "tag_origin");
	self function_fd613e52("p7_fxanim_zm_ori_challenge_box_open_anim");
	self thread function_5cbd62d();
}

/*
	Name: function_646cf7f8
	Namespace: namespace_849a76fd
	Checksum: 0xD5B5BF82
	Offset: 0x1468
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 426
*/
function function_646cf7f8()
{
	if(isdefined(self.var_b5818576))
	{
		self.var_b5818576 StopLoopSound(0.1);
		self.var_b5818576 delete();
	}
	self function_fd613e52("p7_fxanim_zm_ori_challenge_box_close_anim");
	self.active = 0;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
}

/*
	Name: function_5cbd62d
	Namespace: namespace_849a76fd
	Checksum: 0x34C486F6
	Offset: 0x1510
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 450
*/
function function_5cbd62d()
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
	while(self.timer < level.zombie_vars["soulchest_timeout_circle2"])
	{
		self.timer++;
		wait(1);
	}
	self notify("hash_4dd2f7b6");
}

/*
	Name: function_fd613e52
	Namespace: namespace_849a76fd
	Checksum: 0x7E59DC1E
	Offset: 0x15B0
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 480
*/
function function_fd613e52(animation)
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
	model function_3a50db24();
	model AnimScripted(animation, model.origin, model.angles, animation);
	wait(getanimlength(animation));
	self.var_8a63adfb = undefined;
}

/*
	Name: function_3a50db24
	Namespace: namespace_849a76fd
	Checksum: 0xE9AE5F3
	Offset: 0x16A0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 508
*/
function function_3a50db24()
{
	if(!isdefined(self.model) || self.model != "tag_origin")
	{
		return;
	}
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_open_anim", 0);
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_close_anim", 0);
}

/*
	Name: function_6b4fb9ca
	Namespace: namespace_849a76fd
	Checksum: 0x2474461F
	Offset: 0x1718
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 528
*/
function function_6b4fb9ca(zombie)
{
	if(isdefined(self.var_bbe0fa17) && self.var_bbe0fa17)
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!(isdefined(self.active) && self.active))
	{
		self thread function_8953e876();
	}
	self function_1819946d(zombie);
	if(isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= self.var_c29b85d1)
	{
		self function_9010d5b5();
	}
	else if(!isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= level.zombie_vars["soulchest_initial_limit_circle2"])
	{
		self function_9010d5b5();
	}
}

/*
	Name: function_1819946d
	Namespace: namespace_849a76fd
	Checksum: 0x8E88983B
	Offset: 0x1828
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 563
*/
function function_1819946d(zombie)
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
	Name: function_f4992ce2
	Namespace: namespace_849a76fd
	Checksum: 0x62857D6C
	Offset: 0x19B8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 590
*/
function function_f4992ce2()
{
	level.zombie_vars["soulchest_initial_limit_circle2"] = level.zombie_vars["soulchest_initial_limit_circle2"] + level.zombie_vars["soulchest_limit_multiplier_circle2"];
	return;
}

/*
	Name: function_9010d5b5
	Namespace: namespace_849a76fd
	Checksum: 0xBE082200
	Offset: 0x1A00
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 606
*/
function function_9010d5b5()
{
	if(isdefined(self.var_bbe0fa17) && self.var_bbe0fa17)
	{
		return;
	}
	self.var_bbe0fa17 = 1;
	if(isdefined(self.var_385d7ee7))
	{
		return self [[self.var_385d7ee7]]();
	}
	function_f4992ce2();
	self function_646cf7f8();
	model = self.linked_model;
	model function_3a50db24();
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
	self function_6d7642f1();
	function_bc460198(origin);
	return;
	ERROR: Bad function call
}

/*
	Name: function_bc460198
	Namespace: namespace_849a76fd
	Checksum: 0x38E0A315
	Offset: 0x1DA0
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 663
*/
function function_bc460198(origin)
{
	level notify("hash_f647809b", origin);
	chests = function_cb6ad0fe();
	if(!isdefined(chests) || chests.size < 1)
	{
		return function_23423530(origin);
	}
}

/*
	Name: function_23423530
	Namespace: namespace_849a76fd
	Checksum: 0x64685025
	Offset: 0x1E20
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 683
*/
function function_23423530(origin)
{
	level notify("hash_a30815d6", origin);
	function_7df24b05();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e13a26ab
	Namespace: namespace_849a76fd
	Checksum: 0xD09925FA
	Offset: 0x1E60
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 701
*/
function function_e13a26ab()
{
	return struct::get_array("harrybo21_soul_chest_circle2", "script_noteworthy");
}

/*
	Name: function_cb6ad0fe
	Namespace: namespace_849a76fd
	Checksum: 0x605E9965
	Offset: 0x1E90
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 716
*/
function function_cb6ad0fe()
{
	return GetEntArray("harrybo21_soul_chest_circle2", "script_noteworthy");
}

/*
	Name: function_ed35a050
	Namespace: namespace_849a76fd
	Checksum: 0x361A326E
	Offset: 0x1EC0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 731
*/
function function_ed35a050()
{
	excluders = GetEntArray("harrybo21_chest_ignore_area_circle2", "targetname");
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
	Name: function_7df24b05
	Namespace: namespace_849a76fd
	Checksum: 0x17F985CE
	Offset: 0x1F68
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 758
*/
function function_7df24b05()
{
	level flag::init("elemental_circle2_upgraded");
	FX = spawn("script_model", (-361, -66.75, 528.75));
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["runecirclecomplete"], FX, "tag_origin");
	playsoundatposition("fill", (-357.5, -66.25, 584.25));
	level.var_efd85a2c = 1;
	wait(10);
	FX delete();
	while(!level.var_efd85a2c)
	{
		wait(0.25);
	}
}

/*
	Name: function_ce089f72
	Namespace: namespace_849a76fd
	Checksum: 0xC5C6B609
	Offset: 0x2090
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 784
*/
function function_ce089f72()
{
	level.var_efd85a2c = 0;
	thread function_70468452();
	return;
}

/*
	Name: function_70468452
	Namespace: namespace_849a76fd
	Checksum: 0xAF6A8783
	Offset: 0x20C0
	Size: 0x4C
	Parameters: 0
	Flags: None
	Line Number: 801
*/
function function_70468452()
{
	while(!level.var_efd85a2c)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
}

