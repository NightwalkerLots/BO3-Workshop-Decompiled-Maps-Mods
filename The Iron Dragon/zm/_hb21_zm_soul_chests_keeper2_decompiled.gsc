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

#namespace namespace_6ac4e853;

/*
	Name: __init__sytem__
	Namespace: namespace_6ac4e853
	Checksum: 0x87C71C
	Offset: 0x6E8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("zm_soul_chest_keeper2", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_6ac4e853
	Checksum: 0x126F2CE6
	Offset: 0x728
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function __init__()
{
	level function_f158bd4e();
	function_ca65893c();
	thread function_b469f428();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b469f428
	Namespace: namespace_6ac4e853
	Checksum: 0x271DA732
	Offset: 0x770
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_b469f428()
{
	var_23f017a9 = GetEntArray("harrybo21_mpd_keeper2", "script_noteworthy");
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
	Namespace: namespace_6ac4e853
	Checksum: 0xE373368D
	Offset: 0x810
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
	Namespace: namespace_6ac4e853
	Checksum: 0xB00A260E
	Offset: 0x8A8
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
	Namespace: namespace_6ac4e853
	Checksum: 0x24C0B8F7
	Offset: 0xA68
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
	trigger.script_noteworthy = "harrybo21_soul_chest_keeper2";
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
	Namespace: namespace_6ac4e853
	Checksum: 0x9ACF73B8
	Offset: 0xC68
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
	Namespace: namespace_6ac4e853
	Checksum: 0x4901DF8C
	Offset: 0xC78
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
	Name: function_ca65893c
	Namespace: namespace_6ac4e853
	Checksum: 0xDD2DC897
	Offset: 0xD48
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 228
*/
function function_ca65893c()
{
	var_2c23f070 = function_a8f8775d();
	function_a990c1ea();
	for(i = 0; i < var_2c23f070.size; i++)
	{
		function_271c319d(var_2c23f070[i]);
	}
	zm_spawner::add_custom_zombie_spawn_logic(&function_6eacec75);
}

/*
	Name: function_a990c1ea
	Namespace: namespace_6ac4e853
	Checksum: 0x89BCD9E9
	Offset: 0xDF0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 249
*/
function function_a990c1ea()
{
	zombie_utility::set_zombie_var("soulchest_initial_limit_keeper2", 25);
	zombie_utility::set_zombie_var("soulchest_limit_multiplier_keeper2", 2);
	zombie_utility::set_zombie_var("soulchest_timeout_keeper2", 600);
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_271c319d
	Namespace: namespace_6ac4e853
	Checksum: 0xDC0958DF
	Offset: 0xE60
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 269
*/
function function_271c319d(struct)
{
	while(!level.var_6e989986)
	{
		wait(0.25);
	}
	struct.spawned = 1;
	trigger = spawn("trigger_radius_use", struct.origin, 0, 256, 128);
	trigger.angles = struct.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_keeper2";
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
	Name: function_8a67a1ef
	Namespace: namespace_6ac4e853
	Checksum: 0x45EDC26C
	Offset: 0x1050
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 303
*/
function function_8a67a1ef()
{
	self.collision connectpaths();
	self.collision delete();
	self.linked_model delete();
	self delete();
}

/*
	Name: function_e8f50557
	Namespace: namespace_6ac4e853
	Checksum: 0xB54D78FE
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
		zombies[i] thread function_6eacec75();
	}
	wait(0.05);
}

/*
	Name: function_6eacec75
	Namespace: namespace_6ac4e853
	Checksum: 0x76F37492
	Offset: 0x1160
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 346
*/
function function_6eacec75()
{
	self endon("delete");
	self waittill("death");
	if(!isdefined(self.attacker) || !isPlayer(self.attacker))
	{
		return;
	}
	var_3a933b53 = function_1d2bc0e0();
	var_3a933b53 = util::get_array_of_closest(self.origin, var_3a933b53, undefined, undefined, undefined);
	if(!isdefined(var_3a933b53) || var_3a933b53.size < 1)
	{
		return;
	}
	for(i = 0; i < var_3a933b53.size; i++)
	{
		if(!function_8fa086a3(self, var_3a933b53[i]))
		{
			continue;
		}
		var_3a933b53[i] function_4f4b1914(self);
		break;
	}
}

/*
	Name: function_8fa086a3
	Namespace: namespace_6ac4e853
	Checksum: 0x77301EC
	Offset: 0x1290
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 381
*/
function function_8fa086a3(zombie, trigger)
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
	Name: function_461be1c8
	Namespace: namespace_6ac4e853
	Checksum: 0x70F617AF
	Offset: 0x1328
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 404
*/
function function_461be1c8()
{
	self.active = 1;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	self.var_72497ec8 = spawn("script_model", self.linked_model.origin);
	self.var_72497ec8.angles = self.linked_model.angles + VectorScale((0, 1, 0), 90);
	self.var_72497ec8 SetModel("tag_origin");
	self.var_72497ec8 PlayLoopSound("zmb_footprintbox_fire", 0.1);
	if(isdefined(self.var_afaa2468))
	{
		[[self.var_afaa2468]]();
		continue;
	}
	PlayFXOnTag("zombie/fx_ee_altar_mist_zod_zmb", self.var_72497ec8, "tag_origin");
	self function_db90fc6c("p7_fxanim_zm_ori_challenge_box_open_anim");
	self thread function_ccd74e23();
}

/*
	Name: function_fc5c15fe
	Namespace: namespace_6ac4e853
	Checksum: 0x134D02C2
	Offset: 0x1490
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 434
*/
function function_fc5c15fe()
{
	if(isdefined(self.var_72497ec8))
	{
		self.var_72497ec8 StopLoopSound(0.1);
		self.var_72497ec8 delete();
	}
	self function_db90fc6c("p7_fxanim_zm_ori_challenge_box_close_anim");
	self.active = 0;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
}

/*
	Name: function_ccd74e23
	Namespace: namespace_6ac4e853
	Checksum: 0x3D5C55DE
	Offset: 0x1538
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 458
*/
function function_ccd74e23()
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
	while(self.timer < level.zombie_vars["soulchest_timeout_keeper2"])
	{
		self.timer++;
		wait(1);
	}
	self notify("hash_4dd2f7b6");
}

/*
	Name: function_db90fc6c
	Namespace: namespace_6ac4e853
	Checksum: 0xF213187D
	Offset: 0x15D8
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 488
*/
function function_db90fc6c(animation)
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
	model function_d28dddd2();
	model AnimScripted(animation, model.origin, model.angles, animation);
	wait(getanimlength(animation));
	self.var_8a63adfb = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d28dddd2
	Namespace: namespace_6ac4e853
	Checksum: 0xE45C4708
	Offset: 0x16C8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 518
*/
function function_d28dddd2()
{
	if(!isdefined(self.model) || self.model != "tag_origin")
	{
		return;
	}
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_open_anim", 0);
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_close_anim", 0);
}

/*
	Name: function_4f4b1914
	Namespace: namespace_6ac4e853
	Checksum: 0xCBD1AF6
	Offset: 0x1740
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 538
*/
function function_4f4b1914(zombie)
{
	if(isdefined(self.var_220e8a31) && self.var_220e8a31)
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!(isdefined(self.active) && self.active))
	{
		self thread function_461be1c8();
	}
	self function_ef572463(zombie);
	if(isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= self.var_c29b85d1)
	{
		self function_46be387b();
	}
	else if(!isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= level.zombie_vars["soulchest_initial_limit_keeper2"])
	{
		self function_46be387b();
	}
}

/*
	Name: function_ef572463
	Namespace: namespace_6ac4e853
	Checksum: 0xA6241403
	Offset: 0x1850
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 573
*/
function function_ef572463(zombie)
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
	Name: function_5b0de31c
	Namespace: namespace_6ac4e853
	Checksum: 0xFC9C23FB
	Offset: 0x19E0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 600
*/
function function_5b0de31c()
{
	level.zombie_vars["soulchest_initial_limit_keeper2"] = level.zombie_vars["soulchest_initial_limit_keeper2"] + level.zombie_vars["soulchest_limit_multiplier_keeper2"];
}

/*
	Name: function_46be387b
	Namespace: namespace_6ac4e853
	Checksum: 0x7D47584D
	Offset: 0x1A28
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 615
*/
function function_46be387b()
{
	if(isdefined(self.var_220e8a31) && self.var_220e8a31)
	{
		return;
	}
	self.var_220e8a31 = 1;
	if(isdefined(self.var_385d7ee7))
	{
		return self [[self.var_385d7ee7]]();
	}
	function_5b0de31c();
	self function_fc5c15fe();
	model = self.linked_model;
	model function_d28dddd2();
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
	self function_8a67a1ef();
	function_fcba171e(origin);
}

/*
	Name: function_fcba171e
	Namespace: namespace_6ac4e853
	Checksum: 0x524D4A
	Offset: 0x1DC8
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 670
*/
function function_fcba171e(origin)
{
	level notify("hash_46a2d96d", origin);
	chests = function_1d2bc0e0();
	if(!isdefined(chests) || chests.size < 1)
	{
		return function_fc6a6506(origin);
	}
}

/*
	Name: function_fc6a6506
	Namespace: namespace_6ac4e853
	Checksum: 0xC234CE35
	Offset: 0x1E48
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 690
*/
function function_fc6a6506(origin)
{
	level notify("hash_edcb1d28", origin);
	function_90c8132b();
}

/*
	Name: function_a8f8775d
	Namespace: namespace_6ac4e853
	Checksum: 0xE36B52A1
	Offset: 0x1E88
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 706
*/
function function_a8f8775d()
{
	return struct::get_array("harrybo21_soul_chest_keeper2", "script_noteworthy");
}

/*
	Name: function_1d2bc0e0
	Namespace: namespace_6ac4e853
	Checksum: 0x5489B980
	Offset: 0x1EB8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 721
*/
function function_1d2bc0e0()
{
	return GetEntArray("harrybo21_soul_chest_keeper2", "script_noteworthy");
}

/*
	Name: function_1cf7ffa6
	Namespace: namespace_6ac4e853
	Checksum: 0x71C47D82
	Offset: 0x1EE8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 736
*/
function function_1cf7ffa6()
{
	excluders = GetEntArray("harrybo21_chest_ignore_area_keeper2", "targetname");
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
	Name: function_90c8132b
	Namespace: namespace_6ac4e853
	Checksum: 0xFF07C807
	Offset: 0x1F90
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 763
*/
function function_90c8132b()
{
	level flag::init("elemental_keeper2_upgraded");
	playsoundatposition("relic_pickup", (-700.75, -3296.75, 257.25));
	level.var_10be5a2 = 1;
	wait(0.25);
}

/*
	Name: function_ca51826c
	Namespace: namespace_6ac4e853
	Checksum: 0x1CE51343
	Offset: 0x2000
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 781
*/
function function_ca51826c()
{
	while(1)
	{
		self waittill("trigger", player);
	}
}

/*
	Name: function_f158bd4e
	Namespace: namespace_6ac4e853
	Checksum: 0xB7C882F5
	Offset: 0x2030
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 799
*/
function function_f158bd4e()
{
	level.var_10be5a2 = 0;
	thread function_9202779f();
	thread function_f575b34c();
}

/*
	Name: function_9202779f
	Namespace: namespace_6ac4e853
	Checksum: 0x49B73607
	Offset: 0x2070
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 816
*/
function function_9202779f()
{
	self TriggerEnable(0);
	while(!level.var_10be5a2)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
}

/*
	Name: function_f575b34c
	Namespace: namespace_6ac4e853
	Checksum: 0xA3DF36F2
	Offset: 0x20E0
	Size: 0x144
	Parameters: 0
	Flags: None
	Line Number: 837
*/
function function_f575b34c()
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

