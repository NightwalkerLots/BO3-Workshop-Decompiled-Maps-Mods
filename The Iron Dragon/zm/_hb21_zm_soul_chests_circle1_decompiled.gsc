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

#namespace namespace_aa9cf166;

/*
	Name: __init__sytem__
	Namespace: namespace_aa9cf166
	Checksum: 0x33CB0A4F
	Offset: 0x6C0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("zm_soul_chest_circle1", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_aa9cf166
	Checksum: 0x91582CE5
	Offset: 0x700
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function __init__()
{
	level function_a8062509();
	function_81e281e7();
	thread function_16d8ea2b();
}

/*
	Name: function_16d8ea2b
	Namespace: namespace_aa9cf166
	Checksum: 0x254FC013
	Offset: 0x748
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_16d8ea2b()
{
	var_23f017a9 = GetEntArray("harrybo21_mpd_circle1", "script_noteworthy");
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
	Namespace: namespace_aa9cf166
	Checksum: 0x8B185317
	Offset: 0x7E8
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
	return;
}

/*
	Name: function_14af7719
	Namespace: namespace_aa9cf166
	Checksum: 0xCD8495E6
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
	Namespace: namespace_aa9cf166
	Checksum: 0x1B8A41B1
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
	trigger.script_noteworthy = "harrybo21_soul_chest_circle1";
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
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5aed2bfc
	Namespace: namespace_aa9cf166
	Checksum: 0x9ACF73B8
	Offset: 0xC40
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 186
*/
function function_5aed2bfc()
{
}

/*
	Name: function_efd67ce3
	Namespace: namespace_aa9cf166
	Checksum: 0xF0C8D50A
	Offset: 0xC50
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 200
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
	Name: function_81e281e7
	Namespace: namespace_aa9cf166
	Checksum: 0x2C804191
	Offset: 0xD20
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function function_81e281e7()
{
	var_439f0a85 = function_6f32b770();
	function_765a2507();
	for(i = 0; i < var_439f0a85.size; i++)
	{
		function_724dbfb0(var_439f0a85[i]);
	}
	zm_spawner::add_custom_zombie_spawn_logic(&function_61b65498);
}

/*
	Name: function_765a2507
	Namespace: namespace_aa9cf166
	Checksum: 0xD8E2CD99
	Offset: 0xDC8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 246
*/
function function_765a2507()
{
	zombie_utility::set_zombie_var("soulchest_initial_limit_circle1", 10);
	zombie_utility::set_zombie_var("soulchest_limit_multiplier_circle1", 2);
	zombie_utility::set_zombie_var("soulchest_timeout_circle1", 600);
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_724dbfb0
	Namespace: namespace_aa9cf166
	Checksum: 0xD44FC7E2
	Offset: 0xE38
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 266
*/
function function_724dbfb0(struct)
{
	while(!level.var_f3e7e488)
	{
		wait(0.25);
	}
	struct.spawned = 1;
	trigger = spawn("trigger_radius_use", struct.origin, 0, 256, 128);
	trigger.angles = struct.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_circle1";
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
	Name: function_9378bd5a
	Namespace: namespace_aa9cf166
	Checksum: 0x39273807
	Offset: 0x1028
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 300
*/
function function_9378bd5a()
{
	self.collision connectpaths();
	self.collision delete();
	self.linked_model delete();
	self delete();
}

/*
	Name: function_e8f50557
	Namespace: namespace_aa9cf166
	Checksum: 0xDDE88996
	Offset: 0x1098
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
		zombies[i] thread function_61b65498();
	}
	wait(0.05);
}

/*
	Name: function_61b65498
	Namespace: namespace_aa9cf166
	Checksum: 0x7D26E5FF
	Offset: 0x1138
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 343
*/
function function_61b65498()
{
	self endon("delete");
	self waittill("death");
	if(!isdefined(self.attacker) || !isPlayer(self.attacker))
	{
		return;
	}
	var_7a6b4466 = function_a5685695();
	var_7a6b4466 = util::get_array_of_closest(self.origin, var_7a6b4466, undefined, undefined, undefined);
	if(!isdefined(var_7a6b4466) || var_7a6b4466.size < 1)
	{
		return;
	}
	for(i = 0; i < var_7a6b4466.size; i++)
	{
		if(!function_ee978916(self, var_7a6b4466[i]))
		{
			continue;
		}
		var_7a6b4466[i] function_454d3f61(self);
		break;
	}
}

/*
	Name: function_ee978916
	Namespace: namespace_aa9cf166
	Checksum: 0x41A4FD7F
	Offset: 0x1268
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 378
*/
function function_ee978916(zombie, trigger)
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
	Name: function_63516e0d
	Namespace: namespace_aa9cf166
	Checksum: 0x6C8E00A0
	Offset: 0x1300
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 401
*/
function function_63516e0d()
{
	self.active = 1;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	self.var_8f7f0b0d = spawn("script_model", self.linked_model.origin);
	self.var_8f7f0b0d.angles = self.linked_model.angles + VectorScale((0, 1, 0), 90);
	self.var_8f7f0b0d SetModel("tag_origin");
	self.var_8f7f0b0d PlayLoopSound("zmb_footprintbox_fire", 0.1);
	if(isdefined(self.var_afaa2468))
	{
		[[self.var_afaa2468]]();
		continue;
	}
	PlayFXOnTag("zombie/fx_ee_altar_mist_zod_zmb", self.var_8f7f0b0d, "tag_origin");
	self function_d75ec3e9("p7_fxanim_zm_ori_challenge_box_open_anim");
	self thread function_2bce5096();
	return;
}

/*
	Name: function_d6746733
	Namespace: namespace_aa9cf166
	Checksum: 0x70353C3
	Offset: 0x1468
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 432
*/
function function_d6746733()
{
	if(isdefined(self.var_8f7f0b0d))
	{
		self.var_8f7f0b0d StopLoopSound(0.1);
		self.var_8f7f0b0d delete();
	}
	self function_d75ec3e9("p7_fxanim_zm_ori_challenge_box_close_anim");
	self.active = 0;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
}

/*
	Name: function_2bce5096
	Namespace: namespace_aa9cf166
	Checksum: 0xD7C6A1C7
	Offset: 0x1510
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 456
*/
function function_2bce5096()
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
	while(self.timer < level.zombie_vars["soulchest_timeout_circle1"])
	{
		self.timer++;
		wait(1);
	}
	self notify("hash_4dd2f7b6");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d75ec3e9
	Namespace: namespace_aa9cf166
	Checksum: 0xAD526540
	Offset: 0x15B0
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 488
*/
function function_d75ec3e9(animation)
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
	model function_ac584a5f();
	model AnimScripted(animation, model.origin, model.angles, animation);
	wait(getanimlength(animation));
	self.var_8a63adfb = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ac584a5f
	Namespace: namespace_aa9cf166
	Checksum: 0x8B4406B
	Offset: 0x16A0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 518
*/
function function_ac584a5f()
{
	if(!isdefined(self.model) || self.model != "tag_origin")
	{
		return;
	}
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_open_anim", 0);
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_close_anim", 0);
}

/*
	Name: function_454d3f61
	Namespace: namespace_aa9cf166
	Checksum: 0xE7F56599
	Offset: 0x1718
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 538
*/
function function_454d3f61(zombie)
{
	if(isdefined(self.var_49d98adc) && self.var_49d98adc)
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!(isdefined(self.active) && self.active))
	{
		self thread function_63516e0d();
	}
	self function_3e1c0ed6(zombie);
	if(isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= self.var_c29b85d1)
	{
		self function_b613501e();
	}
	else if(!isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= level.zombie_vars["soulchest_initial_limit_circle1"])
	{
		self function_b613501e();
	}
}

/*
	Name: function_3e1c0ed6
	Namespace: namespace_aa9cf166
	Checksum: 0x984FF255
	Offset: 0x1828
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 573
*/
function function_3e1c0ed6(zombie)
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
	Name: function_ce96b279
	Namespace: namespace_aa9cf166
	Checksum: 0x8671A4D6
	Offset: 0x19B8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 602
*/
function function_ce96b279()
{
	level.zombie_vars["soulchest_initial_limit_circle1"] = level.zombie_vars["soulchest_initial_limit_circle1"] + level.zombie_vars["soulchest_limit_multiplier_circle1"];
}

/*
	Name: function_b613501e
	Namespace: namespace_aa9cf166
	Checksum: 0xD480B7F4
	Offset: 0x1A00
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 617
*/
function function_b613501e()
{
	if(isdefined(self.var_49d98adc) && self.var_49d98adc)
	{
		return;
	}
	self.var_49d98adc = 1;
	if(isdefined(self.var_385d7ee7))
	{
		return self [[self.var_385d7ee7]]();
	}
	function_ce96b279();
	self function_d6746733();
	model = self.linked_model;
	model function_ac584a5f();
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
	self function_9378bd5a();
	function_2e4d70d3(origin);
}

/*
	Name: function_2e4d70d3
	Namespace: namespace_aa9cf166
	Checksum: 0xAAC3CFC6
	Offset: 0x1DA0
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 672
*/
function function_2e4d70d3(origin)
{
	level notify("hash_84401160", origin);
	chests = function_a5685695();
	if(!isdefined(chests) || chests.size < 1)
	{
		return function_9549a46b(origin);
	}
}

/*
	Name: function_9549a46b
	Namespace: namespace_aa9cf166
	Checksum: 0xB0DC4F77
	Offset: 0x1E20
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 692
*/
function function_9549a46b(origin)
{
	level notify("hash_7d059b6d", origin);
	function_a3f4c56e();
}

/*
	Name: function_6f32b770
	Namespace: namespace_aa9cf166
	Checksum: 0x4AEC1A02
	Offset: 0x1E60
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 708
*/
function function_6f32b770()
{
	return struct::get_array("harrybo21_soul_chest_circle1", "script_noteworthy");
}

/*
	Name: function_a5685695
	Namespace: namespace_aa9cf166
	Checksum: 0x71094769
	Offset: 0x1E90
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 723
*/
function function_a5685695()
{
	return GetEntArray("harrybo21_soul_chest_circle1", "script_noteworthy");
}

/*
	Name: function_5f3d0f8b
	Namespace: namespace_aa9cf166
	Checksum: 0x199A4667
	Offset: 0x1EC0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 738
*/
function function_5f3d0f8b()
{
	excluders = GetEntArray("harrybo21_chest_ignore_area_circle1", "targetname");
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
	Name: function_a3f4c56e
	Namespace: namespace_aa9cf166
	Checksum: 0xBEDCB2AA
	Offset: 0x1F68
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 765
*/
function function_a3f4c56e()
{
	level flag::init("elemental_circle1_upgraded");
	FX = spawn("script_model", (42.25, -2282.5, 12.5));
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["runecirclecomplete"], FX, "tag_origin");
	playsoundatposition("fill", (42.5, -2286.75, 65.25));
	level.var_84af1cd9 = 1;
	wait(10);
	FX delete();
	while(!level.var_84af1cd9)
	{
		wait(0.25);
	}
}

/*
	Name: function_a8062509
	Namespace: namespace_aa9cf166
	Checksum: 0x60CDDBFD
	Offset: 0x2090
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 791
*/
function function_a8062509()
{
	level.var_84af1cd9 = 0;
	thread function_4a4409e9();
	return;
	ERROR: Bad function call
}

/*
	Name: function_4a4409e9
	Namespace: namespace_aa9cf166
	Checksum: 0xCD4492A0
	Offset: 0x20C0
	Size: 0x64
	Parameters: 0
	Flags: None
	Line Number: 809
*/
function function_4a4409e9()
{
	self TriggerEnable(0);
	while(!level.var_84af1cd9)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
}

