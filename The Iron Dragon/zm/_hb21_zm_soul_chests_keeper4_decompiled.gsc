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

#namespace namespace_b6c9dd25;

/*
	Name: __init__sytem__
	Namespace: namespace_b6c9dd25
	Checksum: 0xE95B35E2
	Offset: 0x6E8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("zm_soul_chest_keeper4", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b6c9dd25
	Checksum: 0x6B796288
	Offset: 0x728
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function __init__()
{
	level function_d49ded8();
	function_874e9832();
	thread function_94817846();
}

/*
	Name: function_94817846
	Namespace: namespace_b6c9dd25
	Checksum: 0x7E2CB4C4
	Offset: 0x770
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_94817846()
{
	var_23f017a9 = GetEntArray("harrybo21_mpd_keeper4", "script_noteworthy");
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
	Namespace: namespace_b6c9dd25
	Checksum: 0x2EE6E6B2
	Offset: 0x810
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
	Namespace: namespace_b6c9dd25
	Checksum: 0x383B4625
	Offset: 0x8A8
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
	Namespace: namespace_b6c9dd25
	Checksum: 0x6247F9ED
	Offset: 0xA68
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
	trigger.script_noteworthy = "harrybo21_soul_chest_keeper4";
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
	Namespace: namespace_b6c9dd25
	Checksum: 0x9ACF73B8
	Offset: 0xC68
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
	Namespace: namespace_b6c9dd25
	Checksum: 0x4E295E02
	Offset: 0xC78
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
	Name: function_874e9832
	Namespace: namespace_b6c9dd25
	Checksum: 0x7494246
	Offset: 0xD48
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function function_874e9832()
{
	var_1032cee6 = function_5cf3828b();
	function_f595b6bc();
	for(i = 0; i < var_1032cee6.size; i++)
	{
		function_db173ccb(var_1032cee6[i]);
	}
	zm_spawner::add_custom_zombie_spawn_logic(&function_22a7f7a3);
}

/*
	Name: function_f595b6bc
	Namespace: namespace_b6c9dd25
	Checksum: 0x3BED5868
	Offset: 0xDF0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 246
*/
function function_f595b6bc()
{
	zombie_utility::set_zombie_var("soulchest_initial_limit_keeper4", 25);
	zombie_utility::set_zombie_var("soulchest_limit_multiplier_keeper4", 2);
	zombie_utility::set_zombie_var("soulchest_timeout_keeper4", 600);
}

/*
	Name: function_db173ccb
	Namespace: namespace_b6c9dd25
	Checksum: 0xFF168B86
	Offset: 0xE60
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 263
*/
function function_db173ccb(struct)
{
	while(!level.var_8a89bb10)
	{
		wait(0.25);
	}
	struct.spawned = 1;
	trigger = spawn("trigger_radius_use", struct.origin, 0, 256, 128);
	trigger.angles = struct.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest_keeper4";
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
	Name: function_a658c379
	Namespace: namespace_b6c9dd25
	Checksum: 0xC485036E
	Offset: 0x1050
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 297
*/
function function_a658c379()
{
	self.collision connectpaths();
	self.collision delete();
	self.linked_model delete();
	self delete();
}

/*
	Name: function_e8f50557
	Namespace: namespace_b6c9dd25
	Checksum: 0x7E811A14
	Offset: 0x10C0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 315
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
		zombies[i] thread function_22a7f7a3();
	}
	wait(0.05);
}

/*
	Name: function_22a7f7a3
	Namespace: namespace_b6c9dd25
	Checksum: 0xBA50561E
	Offset: 0x1160
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 340
*/
function function_22a7f7a3()
{
	self endon("delete");
	self waittill("death");
	if(!isdefined(self.attacker) || !isPlayer(self.attacker))
	{
		return;
	}
	var_86983025 = function_13a9f56();
	var_86983025 = util::get_array_of_closest(self.origin, var_86983025, undefined, undefined, undefined);
	if(!isdefined(var_86983025) || var_86983025.size < 1)
	{
		return;
	}
	for(i = 0; i < var_86983025.size; i++)
	{
		if(!function_dba57b75(self, var_86983025[i]))
		{
			continue;
		}
		var_86983025[i] function_3462442(self);
		break;
	}
}

/*
	Name: function_dba57b75
	Namespace: namespace_b6c9dd25
	Checksum: 0xA50E0330
	Offset: 0x1290
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 375
*/
function function_dba57b75(zombie, trigger)
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
	Name: function_2a2ac03e
	Namespace: namespace_b6c9dd25
	Checksum: 0x51569BDE
	Offset: 0x1328
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 398
*/
function function_2a2ac03e()
{
	self.active = 1;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	self.var_56585d3e = spawn("script_model", self.linked_model.origin);
	self.var_56585d3e.angles = self.linked_model.angles + VectorScale((0, 1, 0), 90);
	self.var_56585d3e SetModel("tag_origin");
	self.var_56585d3e PlayLoopSound("zmb_footprintbox_fire", 0.1);
	if(isdefined(self.var_afaa2468))
	{
		[[self.var_afaa2468]]();
		continue;
	}
	PlayFXOnTag("zombie/fx_ee_altar_mist_zod_zmb", self.var_56585d3e, "tag_origin");
	self function_8f8c079a("p7_fxanim_zm_ori_challenge_box_open_anim");
	self thread function_18dc42f5();
}

/*
	Name: function_184d3788
	Namespace: namespace_b6c9dd25
	Checksum: 0xE27F46A0
	Offset: 0x1490
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 428
*/
function function_184d3788()
{
	if(isdefined(self.var_56585d3e))
	{
		self.var_56585d3e StopLoopSound(0.1);
		self.var_56585d3e delete();
	}
	self function_8f8c079a("p7_fxanim_zm_ori_challenge_box_close_anim");
	self.active = 0;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
}

/*
	Name: function_18dc42f5
	Namespace: namespace_b6c9dd25
	Checksum: 0x609DB156
	Offset: 0x1538
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 452
*/
function function_18dc42f5()
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
	while(self.timer < level.zombie_vars["soulchest_timeout_keeper4"])
	{
		self.timer++;
		wait(1);
	}
	self notify("hash_4dd2f7b6");
}

/*
	Name: function_8f8c079a
	Namespace: namespace_b6c9dd25
	Checksum: 0xC0BA14F
	Offset: 0x15D8
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 482
*/
function function_8f8c079a(animation)
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
	model function_1e92d2a4();
	model AnimScripted(animation, model.origin, model.angles, animation);
	wait(getanimlength(animation));
	self.var_8a63adfb = undefined;
}

/*
	Name: function_1e92d2a4
	Namespace: namespace_b6c9dd25
	Checksum: 0xE65C8740
	Offset: 0x16C8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 510
*/
function function_1e92d2a4()
{
	if(!isdefined(self.model) || self.model != "tag_origin")
	{
		return;
	}
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_open_anim", 0);
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_close_anim", 0);
}

/*
	Name: function_3462442
	Namespace: namespace_b6c9dd25
	Checksum: 0x549FBFD9
	Offset: 0x1740
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 530
*/
function function_3462442(zombie)
{
	if(isdefined(self.var_61d68a7) && self.var_61d68a7)
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!(isdefined(self.active) && self.active))
	{
		self thread function_2a2ac03e();
	}
	self function_3b5c1935(zombie);
	if(isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= self.var_c29b85d1)
	{
		self function_92c32d4d();
	}
	else if(!isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= level.zombie_vars["soulchest_initial_limit_keeper4"])
	{
		self function_92c32d4d();
		return;
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3b5c1935
	Namespace: namespace_b6c9dd25
	Checksum: 0x4848606D
	Offset: 0x1850
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 568
*/
function function_3b5c1935(zombie)
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
	Name: function_f08ee4a
	Namespace: namespace_b6c9dd25
	Checksum: 0xF6AAB32E
	Offset: 0x19E0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 595
*/
function function_f08ee4a()
{
	level.zombie_vars["soulchest_initial_limit_keeper4"] = level.zombie_vars["soulchest_initial_limit_keeper4"] + level.zombie_vars["soulchest_limit_multiplier_keeper4"];
}

/*
	Name: function_92c32d4d
	Namespace: namespace_b6c9dd25
	Checksum: 0xF4D600D
	Offset: 0x1A28
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 610
*/
function function_92c32d4d()
{
	if(isdefined(self.var_61d68a7) && self.var_61d68a7)
	{
		return;
	}
	self.var_61d68a7 = 1;
	if(isdefined(self.var_385d7ee7))
	{
		return self [[self.var_385d7ee7]]();
	}
	function_f08ee4a();
	self function_184d3788();
	model = self.linked_model;
	model function_1e92d2a4();
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
	self function_a658c379();
	function_18ab38a8(origin);
	return;
}

/*
	Name: function_18ab38a8
	Namespace: namespace_b6c9dd25
	Checksum: 0xB2A01AA7
	Offset: 0x1DC8
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 666
*/
function function_18ab38a8(origin)
{
	level notify("hash_fa9de49b", origin);
	chests = function_13a9f56();
	if(!isdefined(chests) || chests.size < 1)
	{
		return function_185b8690(origin);
		return;
	}
}

/*
	Name: function_185b8690
	Namespace: namespace_b6c9dd25
	Checksum: 0x73463997
	Offset: 0x1E48
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 687
*/
function function_185b8690(origin)
{
	level notify("hash_d1d9fb9e", origin);
	function_dccd07fd();
}

/*
	Name: function_5cf3828b
	Namespace: namespace_b6c9dd25
	Checksum: 0xD61ECAE7
	Offset: 0x1E88
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 703
*/
function function_5cf3828b()
{
	return struct::get_array("harrybo21_soul_chest_keeper4", "script_noteworthy");
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_13a9f56
	Namespace: namespace_b6c9dd25
	Checksum: 0xA219B88B
	Offset: 0x1EB8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 719
*/
function function_13a9f56()
{
	return GetEntArray("harrybo21_soul_chest_keeper4", "script_noteworthy");
}

/*
	Name: function_38e92130
	Namespace: namespace_b6c9dd25
	Checksum: 0xE6458FCA
	Offset: 0x1EE8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 734
*/
function function_38e92130()
{
	excluders = GetEntArray("harrybo21_chest_ignore_area_keeper4", "targetname");
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
	Name: function_dccd07fd
	Namespace: namespace_b6c9dd25
	Checksum: 0xA3FFBA17
	Offset: 0x1F90
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 761
*/
function function_dccd07fd()
{
	level flag::init("elemental_keeper4_upgraded");
	playsoundatposition("relic_pickup", (-432.75, -53.75, 117.25));
	level.var_ff850eb0 = 1;
	wait(0.25);
}

/*
	Name: function_7e4c8d9a
	Namespace: namespace_b6c9dd25
	Checksum: 0x377C0F33
	Offset: 0x2000
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 779
*/
function function_7e4c8d9a()
{
	while(1)
	{
		self waittill("trigger", player);
	}
}

/*
	Name: function_d49ded8
	Namespace: namespace_b6c9dd25
	Checksum: 0xC7B02FEC
	Offset: 0x2030
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 797
*/
function function_d49ded8()
{
	level.var_ff850eb0 = 0;
	thread function_adf39929();
	thread function_a970be7a();
}

/*
	Name: function_adf39929
	Namespace: namespace_b6c9dd25
	Checksum: 0xA894551B
	Offset: 0x2070
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 814
*/
function function_adf39929()
{
	self TriggerEnable(0);
	while(!level.var_ff850eb0)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
}

/*
	Name: function_a970be7a
	Namespace: namespace_b6c9dd25
	Checksum: 0x2D45C50
	Offset: 0x20E0
	Size: 0x144
	Parameters: 0
	Flags: None
	Line Number: 835
*/
function function_a970be7a()
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

