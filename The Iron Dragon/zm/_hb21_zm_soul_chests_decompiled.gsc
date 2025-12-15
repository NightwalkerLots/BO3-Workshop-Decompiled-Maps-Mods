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
	Checksum: 0x7C7D690E
	Offset: 0x6A8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 31
*/
function autoexec __init__sytem__()
{
	system::register("zm_soul_chest", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_845267ce
	Checksum: 0xAFC6EAF2
	Offset: 0x6E8
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function __init__()
{
	clientfield::register("world", "summoning_key_pickup", 1, 1, "int");
	clientfield::register("scriptmover", "fx_skeyglow2", 1, 1, "int");
	clientfield::register("scriptmover", "fx_papwall", 1, 1, "int");
	level function_a46b8c1c();
	function_3ec7f667();
	thread function_315dd013();
	level thread function_743b3056();
}

/*
	Name: function_315dd013
	Namespace: namespace_845267ce
	Checksum: 0xEED79525
	Offset: 0x7D8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 69
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
	Checksum: 0xDFDF7A91
	Offset: 0x878
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 92
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
	Namespace: namespace_845267ce
	Checksum: 0xC28BF0D2
	Offset: 0x910
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 113
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
	Checksum: 0x596C82B1
	Offset: 0xAD0
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 142
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
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5aed2bfc
	Namespace: namespace_845267ce
	Checksum: 0x9ACF73B8
	Offset: 0xCD0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 183
*/
function function_5aed2bfc()
{
}

/*
	Name: function_efd67ce3
	Namespace: namespace_845267ce
	Checksum: 0xAE190D62
	Offset: 0xCE0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 197
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
	Checksum: 0x4046A9D8
	Offset: 0xDB0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 222
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
	Checksum: 0x8F77B348
	Offset: 0xE58
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 243
*/
function function_f26a57()
{
	zombie_utility::set_zombie_var("soulchest_initial_limit", 20);
	zombie_utility::set_zombie_var("soulchest_limit_multiplier", 2);
	zombie_utility::set_zombie_var("soulchest_timeout", 600);
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_33cdcd70
	Namespace: namespace_845267ce
	Checksum: 0x54F19A04
	Offset: 0xEC8
	Size: 0x230
	Parameters: 1
	Flags: None
	Line Number: 263
*/
function function_33cdcd70(struct)
{
	while(!level.var_7f6824f7)
	{
		wait(0.25);
	}
	while(!level.var_62c631a6)
	{
		wait(0.25);
	}
	while(!level.var_9af2440d)
	{
		wait(0.25);
	}
	while(!level.var_32a0bc0c)
	{
		wait(0.25);
	}
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
	trigger.linked_model SetModel("tag_origin");
	trigger.linked_model useanimtree(-1);
	trigger.linked_model.animName = "soul_box";
	thread function_e8f50557();
}

/*
	Name: function_35de5e7a
	Namespace: namespace_845267ce
	Checksum: 0x9F75EF06
	Offset: 0x1100
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 309
*/
function function_35de5e7a()
{
	self.collision connectpaths();
	self.collision delete();
	self.linked_model delete();
	self delete();
}

/*
	Name: function_e8f50557
	Namespace: namespace_845267ce
	Checksum: 0xB494A2FE
	Offset: 0x1170
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 327
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
		zombies[i] thread function_cf8cc928();
	}
	wait(0.05);
}

/*
	Name: function_cf8cc928
	Namespace: namespace_845267ce
	Checksum: 0x74FF630F
	Offset: 0x1210
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 352
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
}

/*
	Name: function_76d0389e
	Namespace: namespace_845267ce
	Checksum: 0xB98C5F3E
	Offset: 0x1340
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 387
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
	Checksum: 0xF3ED3729
	Offset: 0x13D8
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 410
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
	PlayFXOnTag("zombie/fx_ee_altar_mist_zod_zmb", self.var_6a4fd55d, "tag_origin");
	self function_e0848a71("p7_fxanim_zm_ori_challenge_box_open_anim");
	self thread function_e4a3901e();
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_3d11f51b
	Namespace: namespace_845267ce
	Checksum: 0x448F5984
	Offset: 0x1540
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 443
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
	Checksum: 0xDE49F0A4
	Offset: 0x15E8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 467
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
	Checksum: 0xD2FEBD41
	Offset: 0x1688
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 497
*/
function function_e0848a71(animation)
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
	model function_8b6bbcff();
	model AnimScripted(animation, model.origin, model.angles, animation);
	wait(getanimlength(animation));
	self.var_8a63adfb = undefined;
}

/*
	Name: function_8b6bbcff
	Namespace: namespace_845267ce
	Checksum: 0x9E8A80F
	Offset: 0x1778
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 525
*/
function function_8b6bbcff()
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
	Name: function_7ffc4839
	Namespace: namespace_845267ce
	Checksum: 0x7611A1F9
	Offset: 0x17F0
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 547
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
	Checksum: 0x76B19598
	Offset: 0x1900
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 582
*/
function function_3bf69de(zombie)
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
	Name: function_9577dae1
	Namespace: namespace_845267ce
	Checksum: 0x304B859C
	Offset: 0x1A90
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 609
*/
function function_9577dae1()
{
	level.zombie_vars["soulchest_initial_limit"] = level.zombie_vars["soulchest_initial_limit"] + level.zombie_vars["soulchest_limit_multiplier"];
	return;
}

/*
	Name: function_eb8edd36
	Namespace: namespace_845267ce
	Checksum: 0xF5CF7A7C
	Offset: 0x1AD8
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 625
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
	self function_35de5e7a();
	function_ccf5cbfb(origin);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ccf5cbfb
	Namespace: namespace_845267ce
	Checksum: 0x8C2B8065
	Offset: 0x1E78
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 682
*/
function function_ccf5cbfb(origin)
{
	level notify("hash_43400a40", origin);
	chests = function_17efabb5();
	if(!isdefined(chests) || chests.size < 1)
	{
		return function_126803c3(origin);
	}
}

/*
	Name: function_126803c3
	Namespace: namespace_845267ce
	Checksum: 0x5D73B4F6
	Offset: 0x1EF8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 702
*/
function function_126803c3(origin)
{
	level notify("hash_1d0dcafd", origin);
	function_d6a418a6();
}

/*
	Name: function_46eddbb0
	Namespace: namespace_845267ce
	Checksum: 0x8157DC5B
	Offset: 0x1F38
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 718
*/
function function_46eddbb0()
{
	return struct::get_array("harrybo21_soul_chest", "script_noteworthy");
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_17efabb5
	Namespace: namespace_845267ce
	Checksum: 0xCBE103B3
	Offset: 0x1F68
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 734
*/
function function_17efabb5()
{
	return GetEntArray("harrybo21_soul_chest", "script_noteworthy");
}

/*
	Name: function_6121eb23
	Namespace: namespace_845267ce
	Checksum: 0x77044C30
	Offset: 0x1F98
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 749
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
	Checksum: 0x138E6E5C
	Offset: 0x2040
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 776
*/
function function_d6a418a6()
{
	location = struct::get("skey1", "targetname");
	model = spawn("script_model", location.origin);
	model SetModel("p7_fxanim_zm_zod_summoning_key_mod2");
	model clientfield::set("fx_skeyglow2", 1);
	model useanimtree(-1);
	model AnimScripted("p7_fxanim_zm_summoning_key_idle", model.origin, model.angles, %p7_fxanim_zm_summoning_key_idle);
	playsoundatposition("challenge_medal_r3", (-711.75, 718.5, 531));
	trigger = spawn("trigger_radius_use", location.origin, 0, 80, 80);
	trigger TriggerIgnoreTeam();
	trigger setvisibletoall();
	trigger SetTeamForTrigger("none");
	trigger setcursorhint("HINT_NOICON");
	trigger setHintString("Press & hold ^3&&1^7 to Pick Up The Summoning Key");
	trigger thread function_db125071();
	while(!level.var_3ca3b3ec)
	{
		wait(0.25);
	}
	model clientfield::set("fx_skeyglow2", 0);
	model delete();
	trigger delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_db125071
	Namespace: namespace_845267ce
	Checksum: 0x96744B8C
	Offset: 0x22C0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 813
*/
function function_db125071()
{
	while(1)
	{
		self waittill("trigger", player);
		level.var_3ca3b3ec = 1;
		playsoundatposition("key_pickup", player.origin);
	}
}

/*
	Name: function_a46b8c1c
	Namespace: namespace_845267ce
	Checksum: 0xBB03B71E
	Offset: 0x2320
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 833
*/
function function_a46b8c1c()
{
	level.var_3ca3b3ec = 0;
	key = GetEnt("key_trigger7", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up The Summoning Key");
	key thread function_1a81b5bc();
	var_9ce0cb97 = GetEntArray("key_door7", "targetname");
	foreach(door in var_9ce0cb97)
	{
		door setcursorhint("HINT_NOICON");
		door thread function_a89b1edc();
	}
	return;
}

/*
	Name: function_1a81b5bc
	Namespace: namespace_845267ce
	Checksum: 0x4A2C5E1E
	Offset: 0x2490
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 859
*/
function function_1a81b5bc()
{
	self waittill("trigger", player);
	model = GetEnt(self.target, "targetname");
	model delete();
	self delete();
	level.var_3ca3b3ec = 1;
	playsoundatposition("key_pickup", player.origin);
	FX = spawn("script_model", (-348.5, 1823, 2));
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["orbyellow"], FX, "tag_origin");
	wait(5);
	FX delete();
}

/*
	Name: function_a89b1edc
	Namespace: namespace_845267ce
	Checksum: 0x6D7AA8B4
	Offset: 0x25E0
	Size: 0x388
	Parameters: 0
	Flags: None
	Line Number: 884
*/
function function_a89b1edc()
{
	level endon("intermission");
	while(!level.var_3ca3b3ec)
	{
		wait(0.25);
	}
	self setHintString("Press and Hold ^3&&1^7 to Place The Summoning Key");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	wait(0.25);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	self delete();
	location = struct::get("skey", "targetname");
	model = spawn("script_model", location.origin);
	model SetModel("p7_fxanim_zm_zod_summoning_key_mod2");
	model clientfield::set("fx_skeyglow2", 1);
	model useanimtree(-1);
	model AnimScripted("p7_fxanim_zm_summoning_key_idle", model.origin, model.angles, %p7_fxanim_zm_summoning_key_idle);
	playsoundatposition("key_poof", player.origin);
	wait(1);
	playsoundatposition("pap_wall_explode", player.origin);
	FX = spawn("script_model", (-434.5, 516.75, 546.5));
	FX.angles = VectorScale((0, 1, 0), 180);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_papwall", 1);
	foreach(model in models)
	{
		model delete();
	}
	wait(5);
	FX clientfield::set("fx_papwall", 0);
	FX delete();
}

/*
	Name: function_743b3056
	Namespace: namespace_845267ce
	Checksum: 0xCC0C31B6
	Offset: 0x2970
	Size: 0x3C
	Parameters: 0
	Flags: None
	Line Number: 931
*/
function function_743b3056()
{
	while(!level.var_3ca3b3ec)
	{
		wait(0.05);
	}
	clientfield::set("summoning_key_pickup", 1);
}

