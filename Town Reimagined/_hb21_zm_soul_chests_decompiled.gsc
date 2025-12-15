#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_845267ce;

/*
	Name: __init__sytem__
	Namespace: namespace_845267ce
	Checksum: 0xE04C5A0F
	Offset: 0x5A0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 31
*/
function autoexec __init__sytem__()
{
	system::register("zm_soul_chest", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_845267ce
	Checksum: 0x2EC8F539
	Offset: 0x5E0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 46
*/
function __init__()
{
	function_3ec7f667();
	thread function_315dd013();
}

/*
	Name: function_315dd013
	Namespace: namespace_845267ce
	Checksum: 0x2CE19917
	Offset: 0x610
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function function_315dd013()
{
	var_23f017a9 = GetEntArray("harrybo21_mpd", "script_noteworthy");
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
	Namespace: namespace_845267ce
	Checksum: 0x519062C1
	Offset: 0x6B0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 85
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
	Namespace: namespace_845267ce
	Checksum: 0xB1AA0FE4
	Offset: 0x748
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 107
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
	Namespace: namespace_845267ce
	Checksum: 0xCE156455
	Offset: 0x908
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 136
*/
function function_1ca1fc6d(var_4fb6b147)
{
	fraction = 13.33333;
	trigger = spawn("trigger_radius_use", self.origin + VectorScale((0, 0, 1), 40), 0, 256, 128);
	trigger.angles = self.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest";
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
	trigger.var_afaa2468++;
}

/*
	Name: function_5aed2bfc
	Namespace: namespace_845267ce
	Checksum: 0x9ACF73B8
	Offset: 0xB08
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 177
*/
function function_5aed2bfc()
{
}

/*
	Name: function_efd67ce3
	Namespace: namespace_845267ce
	Checksum: 0x1E193579
	Offset: 0xB18
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 191
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
	Name: function_3ec7f667
	Namespace: namespace_845267ce
	Checksum: 0x6BB11D70
	Offset: 0xBE8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 216
*/
function function_3ec7f667()
{
	structs = function_46eddbb0();
	function_f26a57();
	for(i = 0; i < structs.size; i++)
	{
		function_33cdcd70(structs[i]);
	}
	zm_spawner::add_custom_zombie_spawn_logic(&function_cf8cc928);
}

/*
	Name: function_f26a57
	Namespace: namespace_845267ce
	Checksum: 0xFFC760BE
	Offset: 0xC90
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 237
*/
function function_f26a57()
{
	zombie_utility::set_zombie_var("soulchest_initial_limit", 5);
	zombie_utility::set_zombie_var("soulchest_limit_multiplier", 2);
	zombie_utility::set_zombie_var("soulchest_timeout", 60);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_33cdcd70
	Namespace: namespace_845267ce
	Checksum: 0x29BBE53E
	Offset: 0xD00
	Size: 0x260
	Parameters: 1
	Flags: None
	Line Number: 256
*/
function function_33cdcd70(struct)
{
	struct.spawned = 1;
	trigger = spawn("trigger_radius_use", struct.origin, 0, 256, 128);
	trigger.angles = struct.angles;
	trigger.script_noteworthy = "harrybo21_soul_chest";
	trigger.kills = 0;
	trigger.timer = 0;
	trigger.var_21aeaaf7 = 0;
	trigger.active = 0;
	trigger.var_efa95399 = 1;
	trigger.var_7c0bd332 = struct;
	trigger.linked_model = spawn("script_model", struct.origin);
	trigger.linked_model.angles = struct.angles;
	trigger.linked_model SetModel("p7_zm_ori_challenge_box_soul_on");
	trigger.linked_model useanimtree(-1);
	trigger.linked_model.animName = "soul_box";
	trigger.collision = spawn("script_model", struct.origin, 1);
	trigger.collision.angles = struct.angles;
	trigger.collision SetModel("zm_collision_perks1");
	trigger.collision disconnectpaths();
}

/*
	Name: function_35de5e7a
	Namespace: namespace_845267ce
	Checksum: 0x95345102
	Offset: 0xF68
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 289
*/
function function_35de5e7a()
{
	self.collision connectpaths();
	self.collision delete();
	self.linked_model delete();
	self delete();
}

/*
	Name: function_cf8cc928
	Namespace: namespace_845267ce
	Checksum: 0x6097A658
	Offset: 0xFD8
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 307
*/
function function_cf8cc928()
{
	self endon("delete");
	self waittill("death");
	if(!isdefined(self.attacker) || !isPlayer(self.attacker))
	{
		return;
	}
	var_e0955ace = function_17efabb5();
	var_e0955ace = util::get_array_of_closest(self.origin, var_e0955ace, undefined, undefined, undefined);
	if(!isdefined(var_e0955ace) || var_e0955ace.size < 1)
	{
		return;
	}
	for(i = 0; i < var_e0955ace.size; i++)
	{
		if(!function_76d0389e(self, var_e0955ace[i]))
		{
			continue;
		}
		var_e0955ace[i] function_7ffc4839(self);
		break;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_76d0389e
	Namespace: namespace_845267ce
	Checksum: 0x22ACDE86
	Offset: 0x1108
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 344
*/
function function_76d0389e(zombie, trigger)
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
	Name: function_c64d85d
	Namespace: namespace_845267ce
	Checksum: 0x15CD214B
	Offset: 0x11A0
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 367
*/
function function_c64d85d()
{
	self.active = 1;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
	self.var_6a4fd55d = spawn("script_model", self.linked_model.origin);
	self.var_6a4fd55d.angles = self.linked_model.angles + VectorScale((0, 1, 0), 90);
	self.var_6a4fd55d SetModel("tag_origin");
	self.var_6a4fd55d PlayLoopSound("zmb_footprintbox_fire", 0.1);
	if(isdefined(self.var_afaa2468))
	{
		[[self.var_afaa2468]]();
		continue;
	}
	PlayFXOnTag("harry/soul_chest/fx_soul_chest_blue_fire", self.var_6a4fd55d, "tag_origin");
	self function_e0848a71("p7_fxanim_zm_ori_challenge_box_open_anim");
	self thread function_e4a3901e();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3d11f51b
	Namespace: namespace_845267ce
	Checksum: 0x1BA8EE06
	Offset: 0x1308
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 399
*/
function function_3d11f51b()
{
	if(isdefined(self.var_6a4fd55d))
	{
		self.var_6a4fd55d StopLoopSound(0.1);
		self.var_6a4fd55d delete();
	}
	self function_e0848a71("p7_fxanim_zm_ori_challenge_box_close_anim");
	self.active = 0;
	self.kills = 0;
	self.timer = 0;
	self.var_21aeaaf7 = 0;
}

/*
	Name: function_e4a3901e
	Namespace: namespace_845267ce
	Checksum: 0xF471A299
	Offset: 0x13B0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 423
*/
function function_e4a3901e()
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
	while(self.timer < level.zombie_vars["soulchest_timeout"])
	{
		self.timer++;
		wait(1);
	}
	self notify("hash_4dd2f7b6");
}

/*
	Name: function_e0848a71
	Namespace: namespace_845267ce
	Checksum: 0x296ECA93
	Offset: 0x1450
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 453
*/
function function_e0848a71(animation)
{
	if(!isdefined(self.model) || self.model != "p7_zm_ori_challenge_box_soul_on")
	{
		return;
	}
	while(isdefined(self.var_8a63adfb) && self.var_8a63adfb)
	{
		wait(0.05);
	}
	self.var_8a63adfb = 1;
	model = self.linked_model;
	model function_8b6bbcff();
	model AnimScripted(animation, model.origin, model.angles, animation);
	wait(getanimlength(animation));
	self.var_8a63adfb = undefined;
}

/*
	Name: function_8b6bbcff
	Namespace: namespace_845267ce
	Checksum: 0xB0786B78
	Offset: 0x1540
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 481
*/
function function_8b6bbcff()
{
	if(!isdefined(self.model) || self.model != "p7_zm_ori_challenge_box_soul_on")
	{
		return;
	}
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_open_anim", 0);
	self ClearAnim("p7_fxanim_zm_ori_challenge_box_close_anim", 0);
}

/*
	Name: function_7ffc4839
	Namespace: namespace_845267ce
	Checksum: 0xC04B4C39
	Offset: 0x15B8
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 501
*/
function function_7ffc4839(zombie)
{
	if(isdefined(self.var_f58abf44) && self.var_f58abf44)
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!(isdefined(self.active) && self.active))
	{
		self thread function_c64d85d();
	}
	self function_3bf69de(zombie);
	if(isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= self.var_c29b85d1)
	{
		self function_eb8edd36();
	}
	else if(!isdefined(self.var_c29b85d1) && self.kills + self.var_21aeaaf7 >= level.zombie_vars["soulchest_initial_limit"])
	{
		self function_eb8edd36();
	}
}

/*
	Name: function_3bf69de
	Namespace: namespace_845267ce
	Checksum: 0xBD14C659
	Offset: 0x16C8
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 536
*/
function function_3bf69de(zombie)
{
	self.timer = 0;
	self.var_21aeaaf7++;
	ent = spawn("script_model", zombie GetTagOrigin("j_spineupper"));
	ent SetModel("tag_origin");
	PlayFXOnTag("harry/soul_chest/fx_soul_chest_trail", ent, "tag_origin");
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
	Name: function_9577dae1
	Namespace: namespace_845267ce
	Checksum: 0x5037FFB4
	Offset: 0x1858
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 563
*/
function function_9577dae1()
{
	level.zombie_vars["soulchest_initial_limit"] = level.zombie_vars["soulchest_initial_limit"] + level.zombie_vars["soulchest_limit_multiplier"];
}

/*
	Name: function_eb8edd36
	Namespace: namespace_845267ce
	Checksum: 0xF206A30C
	Offset: 0x18A0
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 578
*/
function function_eb8edd36()
{
	if(isdefined(self.var_f58abf44) && self.var_f58abf44)
	{
		return;
	}
	self.var_f58abf44 = 1;
	if(isdefined(self.var_385d7ee7))
	{
		return self [[self.var_385d7ee7]]();
	}
	function_9577dae1();
	self function_3d11f51b();
	model = self.linked_model;
	model function_8b6bbcff();
	origin = model.origin;
	fake_model = spawn("script_model", origin);
	fake_model SetModel("p7_zm_ori_challenge_box_soul_on");
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
	self function_35de5e7a();
	function_ccf5cbfb(origin);
}

/*
	Name: function_ccf5cbfb
	Namespace: namespace_845267ce
	Checksum: 0x32E65401
	Offset: 0x1C40
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 633
*/
function function_ccf5cbfb(origin)
{
	level notify("hash_43400a40", origin);
	chests = function_17efabb5();
	if(!isdefined(chests) || chests.size < 1)
	{
		return function_126803c3(origin);
	}
	zm_powerups::special_powerup_drop(origin);
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::add_to_player_score(500);
	}
}

/*
	Name: function_126803c3
	Namespace: namespace_845267ce
	Checksum: 0x2F330DBB
	Offset: 0x1D40
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 659
*/
function function_126803c3(origin)
{
	level notify("hash_1d0dcafd", origin);
	zm_powerups::special_powerup_drop(origin);
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::add_to_player_score(1000);
	}
	function_d6a418a6();
}

/*
	Name: function_46eddbb0
	Namespace: namespace_845267ce
	Checksum: 0x865F61A5
	Offset: 0x1E00
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 681
*/
function function_46eddbb0()
{
	return struct::get_array("harrybo21_soul_chest", "script_noteworthy");
}

/*
	Name: function_17efabb5
	Namespace: namespace_845267ce
	Checksum: 0xA71A2789
	Offset: 0x1E30
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 696
*/
function function_17efabb5()
{
	return GetEntArray("harrybo21_soul_chest", "script_noteworthy");
}

/*
	Name: function_6121eb23
	Namespace: namespace_845267ce
	Checksum: 0x4898E391
	Offset: 0x1E60
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 711
*/
function function_6121eb23()
{
	excluders = GetEntArray("harrybo21_chest_ignore_area", "targetname");
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
	Name: function_d6a418a6
	Namespace: namespace_845267ce
	Checksum: 0x4B30250F
	Offset: 0x1F08
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 738
*/
function function_d6a418a6()
{
	location = struct::get("dg4_spawn", "targetname");
	model = spawn("script_model", location.origin);
	model SetModel(function_1c8adcb0(GetWeapon("hero_gravityspikes_melee")));
	model thread zm_powerups::powerup_wobble();
	trigger = spawn("trigger_radius_use", location.origin, 0, 80, 80);
	trigger TriggerIgnoreTeam();
	trigger setvisibletoall();
	trigger SetTeamForTrigger("none");
	trigger setcursorhint("HINT_NOICON");
	trigger setHintString("Press & hold ^3&&1^7 for Ragnarok DG4");
	trigger thread function_db125071();
	return;
}

/*
	Name: function_db125071
	Namespace: namespace_845267ce
	Checksum: 0x74496FE1
	Offset: 0x20A8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 764
*/
function function_db125071()
{
	while(1)
	{
		self waittill("trigger", player);
		if(player hasweapon(GetWeapon("hero_gravityspikes_melee")))
		{
			continue;
		}
		player zm_weapons::weapon_give(GetWeapon("hero_gravityspikes_melee"), 0, 0, 1, 0);
	}
}

