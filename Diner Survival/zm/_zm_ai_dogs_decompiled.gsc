#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\vk_script\_zm_vk_general;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;

#namespace zm_ai_dogs;

/*
	Name: __init__sytem__
	Namespace: zm_ai_dogs
	Checksum: 0x8D15AFB3
	Offset: 0x730
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 33
*/
function autoexec __init__sytem__()
{
	system::register("zm_ai_dogs", &__init__, undefined, "aat");
}

/*
	Name: __init__
	Namespace: zm_ai_dogs
	Checksum: 0xFE16344A
	Offset: 0x770
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function __init__()
{
	clientfield::register("actor", "dog_fx", 1, 1, "int");
	init_dog_fx();
	init();
}

/*
	Name: init
	Namespace: zm_ai_dogs
	Checksum: 0x41B1DBD6
	Offset: 0x7D0
	Size: 0x2F8
	Parameters: 0
	Flags: None
	Line Number: 65
*/
function init()
{
	level.dogs_enabled = 1;
	level.dog_rounds_enabled = 0;
	level.dog_round_count = 1;
	level.dog_spawners = [];
	level flag::init("dog_clips");
	if(GetDvarString("zombie_dog_animset") == "")
	{
		SetDvar("zombie_dog_animset", "zombie");
	}
	if(GetDvarString("scr_dog_health_walk_multiplier") == "")
	{
		SetDvar("scr_dog_health_walk_multiplier", "4.0");
	}
	if(GetDvarString("scr_dog_run_distance") == "")
	{
		SetDvar("scr_dog_run_distance", "2500");
	}
	level.melee_range_sav = GetDvarString("ai_meleeRange");
	level.melee_width_sav = GetDvarString("ai_meleeWidth");
	level.melee_height_sav = GetDvarString("ai_meleeHeight");
	zombie_utility::set_zombie_var("dog_fire_trail_percent", 50);
	level thread AAT::register_immunity("zm_aat_blast_furnace", "zombie_dog", 0, 1, 1);
	level thread AAT::register_immunity("zm_aat_dead_wire", "zombie_dog", 0, 1, 1);
	level thread AAT::register_immunity("zm_aat_fire_works", "zombie_dog", 1, 1, 1);
	level thread AAT::register_immunity("zm_aat_thunder_wall", "zombie_dog", 0, 0, 1);
	level thread AAT::register_immunity("zm_aat_turned", "zombie_dog", 1, 1, 1);
	level thread AAT::register_immunity("zm_aat_aethercollapse", "zombie_dog", 1, 1, 1);
	dog_spawner_init();
	level thread dog_clip_monitor();
	return;
}

/*
	Name: init_dog_fx
	Namespace: zm_ai_dogs
	Checksum: 0x2D588104
	Offset: 0xAD0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 109
*/
function init_dog_fx()
{
	level._effect["lightning_dog_spawn"] = "zombie/fx_dog_lightning_buildup_zmb";
	level._effect["dog_eye_glow"] = "vk_fx/zm/_vk_zm_dog_eyes_samantha";
	level._effect["dog_gib"] = "zombie/fx_dog_explosion_zmb";
	level._effect["dog_trail_fire"] = "zombie/fx_dog_fire_trail_zmb";
	return;
	continue;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: enable_dog_rounds
	Namespace: zm_ai_dogs
	Checksum: 0xD461BE2F
	Offset: 0xB50
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 130
*/
function enable_dog_rounds()
{
	level.dog_rounds_enabled = 1;
	if(!isdefined(level.dog_round_track_override))
	{
		level.dog_round_track_override = &dog_round_tracker;
	}
	level thread [[level.dog_round_track_override]]();
}

/*
	Name: dog_spawner_init
	Namespace: zm_ai_dogs
	Checksum: 0x50344778
	Offset: 0xBA0
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 150
*/
function dog_spawner_init()
{
	level.dog_spawners = GetEntArray("zombie_dog_spawner", "script_noteworthy");
	later_dogs = GetEntArray("later_round_dog_spawners", "script_noteworthy");
	level.dog_spawners = ArrayCombine(level.dog_spawners, later_dogs, 1, 0);
	if(level.dog_spawners.size == 0)
	{
		return;
	}
	for(i = 0; i < level.dog_spawners.size; i++)
	{
		if(zm_spawner::is_spawner_targeted_by_blocker(level.dog_spawners[i]))
		{
			level.dog_spawners[i].is_enabled = 0;
			continue;
		}
		level.dog_spawners[i].is_enabled = 1;
		level.dog_spawners[i].script_forcespawn = 1;
	}
	/#
		Assert(level.dog_spawners.size > 0);
	#/
	level.DOG_HEALTH = 100;
	Array::thread_all(level.dog_spawners, &spawner::add_spawn_function, &dog_init);
	return;
}

/*
	Name: dog_round_spawning
	Namespace: zm_ai_dogs
	Checksum: 0xECFB58CF
	Offset: 0xD58
	Size: 0x4C8
	Parameters: 0
	Flags: None
	Line Number: 187
*/
function dog_round_spawning()
{
	level endon("intermission");
	level endon("end_of_round");
	level endon("restart_round");
	level.dog_targets = GetPlayers();
	for(i = 0; i < level.dog_targets.size; i++)
	{
		level.dog_targets[i].hunted_by = 0;
	}
	level endon("kill_round");
	if(level.intermission)
	{
		return;
	}
	level.dog_intermission = 1;
	level thread dog_round_aftermath();
	players = GetPlayers();
	Array::thread_all(players, &play_dog_round);
	wait(1);
	if(isdefined(level.var_60074393) && level.var_60074393 && (!(isdefined(level.var_f45e210e) && level.var_f45e210e)))
	{
		level.var_9ba4ad4a = 1;
		level notify("hash_6781e446");
	}
	var_15c5ec47 = 12;
	var_89453bb4 = 24;
	if(isdefined(level.var_4025bbc9) && level.var_4025bbc9)
	{
		var_15c5ec47 = 18;
		var_89453bb4 = 36;
	}
	wait(6);
	if(level.dog_round_count < 3)
	{
		max = players.size * var_15c5ec47;
		continue;
	}
	max = players.size * var_89453bb4;
	level.zombie_total = max;
	dog_health_increase();
	count = 0;
	while(1)
	{
		level flag::wait_till("spawn_zombies");
		while(zombie_utility::get_current_zombie_count() >= level.zombie_ai_limit || level.zombie_total <= 0)
		{
			wait(0.1);
		}
		num_player_valid = zm_utility::get_number_of_valid_players();
		var_ff96f31a = 3;
		if(isdefined(level.var_4025bbc9) && level.var_4025bbc9)
		{
			var_ff96f31a = 5;
		}
		while(zombie_utility::get_current_zombie_count() >= num_player_valid * var_ff96f31a)
		{
			wait(2);
			num_player_valid = zm_utility::get_number_of_valid_players();
		}
		players = GetPlayers();
		favorite_enemy = get_favorite_enemy();
		if(isdefined(level.dog_spawn_func))
		{
			spawn_loc = [[level.dog_spawn_func]](level.dog_spawners, favorite_enemy);
			ai = zombie_utility::spawn_zombie(level.dog_spawners[0]);
			if(isdefined(ai))
			{
				ai.favoriteenemy = favorite_enemy;
				spawn_loc thread dog_spawn_fx(ai, spawn_loc);
				level.zombie_total--;
				count++;
				level flag::set("dog_clips");
				continue;
			}
		}
		spawn_point = dog_spawn_factory_logic(favorite_enemy);
		ai = zombie_utility::spawn_zombie(level.dog_spawners[0]);
		if(isdefined(ai))
		{
			ai.favoriteenemy = favorite_enemy;
			spawn_point thread dog_spawn_fx(ai, spawn_point);
			level.zombie_total--;
			count++;
			level flag::set("dog_clips");
		}
		waiting_for_next_dog_spawn(count, max);
	}
}

/*
	Name: waiting_for_next_dog_spawn
	Namespace: zm_ai_dogs
	Checksum: 0x331F071D
	Offset: 0x1228
	Size: 0x188
	Parameters: 2
	Flags: None
	Line Number: 287
*/
function waiting_for_next_dog_spawn(count, max)
{
	default_wait = 1;
	if(isdefined(level.var_4025bbc9) && level.var_4025bbc9)
	{
		default_wait = 0.1;
	}
	if(level.dog_round_count == 1)
	{
		default_wait = 2.5;
		if(isdefined(level.var_4025bbc9) && level.var_4025bbc9)
		{
			default_wait = 1.25;
		}
	}
	else if(level.dog_round_count == 2)
	{
		default_wait = 2;
		if(isdefined(level.var_4025bbc9) && level.var_4025bbc9)
		{
			default_wait = 0.5;
		}
	}
	else if(level.dog_round_count == 3)
	{
		default_wait = 1.5;
		if(isdefined(level.var_4025bbc9) && level.var_4025bbc9)
		{
			default_wait = 0.25;
			continue;
		}
	}
	default_wait = 1;
	if(isdefined(level.var_4025bbc9) && level.var_4025bbc9)
	{
		default_wait = 0.1;
	}
	default_wait = default_wait - count / max;
	default_wait = max(default_wait, 0.05);
	wait(default_wait);
	return;
	waittillframeend;
}

/*
	Name: dog_round_aftermath
	Namespace: zm_ai_dogs
	Checksum: 0xB30D7B36
	Offset: 0x13B8
	Size: 0x2A0
	Parameters: 0
	Flags: None
	Line Number: 341
*/
function dog_round_aftermath()
{
	level waittill("last_ai_down", e_last);
	if(isdefined(level.var_60074393) && level.var_60074393 && isdefined(level.var_4011a94e))
	{
		var_53639068 = "vk_tra_snd_roundchange_dogs_" + level.var_4011a94e + "_end";
		foreach(player in GetPlayers())
		{
			player playlocalsound(var_53639068);
		}
		namespace_f56b53f0::function_dbe7e78b("Playing Sound '^3" + var_53639068 + "^7'");
		continue;
	}
	level thread zm_audio::sndmusicsystem_playstate("dog_end");
	power_up_origin = level.last_dog_origin;
	if(isdefined(e_last))
	{
		power_up_origin = e_last.origin;
	}
	if(isdefined(power_up_origin))
	{
		level thread zm_powerups::specific_powerup_drop("full_ammo", power_up_origin);
	}
	wait(2);
	util::clientNotify("dog_stop");
	wait(6);
	level.dog_intermission = 0;
	if(isdefined(level.var_60074393) && level.var_60074393)
	{
		level.var_9ba4ad4a = 0;
		level notify("hash_6781e446", GetPlayers());
		continue;
	}
	foreach(player in GetPlayers())
	{
		player SetWorldFogActiveBank(1);
	}
}

/*
	Name: dog_spawn_fx
	Namespace: zm_ai_dogs
	Checksum: 0xFC389CAC
	Offset: 0x1660
	Size: 0x340
	Parameters: 2
	Flags: None
	Line Number: 390
*/
function dog_spawn_fx(ai, ent)
{
	ai endon("death");
	ai SetFreeCameraLockOnAllowed(0);
	level thread namespace_f56b53f0::function_de45d812(level._effect["lightning_dog_spawn"], ent.origin, 9);
	playsoundatposition("zmb_hellhound_prespawn", ent.origin);
	wait(1.5);
	playsoundatposition("zmb_hellhound_bolt", ent.origin);
	Earthquake(0.5, 0.75, ent.origin, 1000);
	playsoundatposition("zmb_hellhound_spawn", ent.origin);
	if(isdefined(ai.favoriteenemy))
	{
		angle = VectorToAngles(ai.favoriteenemy.origin - ent.origin);
		angles = (ai.angles[0], angle[1], ai.angles[2]);
		continue;
	}
	angles = ent.angles;
	ai ForceTeleport(ent.origin, angles);
	/#
		Assert(isdefined(ai), "Dev Block strings are not supported");
	#/
	/#
		Assert(isalive(ai), "Dev Block strings are not supported");
	#/
	/#
		Assert(ai.isdog, "Dev Block strings are not supported");
	#/
	/#
		Assert(zm_utility::is_magic_bullet_shield_enabled(ai), "Dev Block strings are not supported");
	#/
	ai zombie_setup_attack_properties_dog();
	ai util::stop_magic_bullet_shield();
	wait(0.1);
	ai show();
	ai SetFreeCameraLockOnAllowed(1);
	ai.ignoreme = 0;
	ai notify("visible");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: dog_spawn_factory_logic
	Namespace: zm_ai_dogs
	Checksum: 0x271DC1A9
	Offset: 0x19A8
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 441
*/
function dog_spawn_factory_logic(favorite_enemy)
{
	dog_locs = Array::randomize(level.zm_loc_types["dog_location"]);
	for(i = 0; i < dog_locs.size; i++)
	{
		if(isdefined(level.old_dog_spawn) && level.old_dog_spawn == dog_locs[i])
		{
			continue;
		}
		if(!isdefined(favorite_enemy))
		{
			continue;
		}
		dist_squared = DistanceSquared(dog_locs[i].origin, favorite_enemy.origin);
		if(dist_squared > 160000 && dist_squared < 1000000)
		{
			level.old_dog_spawn = dog_locs[i];
			return dog_locs[i];
		}
	}
	return dog_locs[0];
}

/*
	Name: get_favorite_enemy
	Namespace: zm_ai_dogs
	Checksum: 0x6318770D
	Offset: 0x1AD8
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 474
*/
function get_favorite_enemy()
{
	dog_targets = GetPlayers();
	least_hunted = dog_targets[0];
	for(i = 0; i < dog_targets.size; i++)
	{
		if(!isdefined(dog_targets[i].hunted_by))
		{
			dog_targets[i].hunted_by = 0;
		}
		if(!zm_utility::is_player_valid(dog_targets[i]))
		{
			continue;
		}
		if(!zm_utility::is_player_valid(least_hunted))
		{
			least_hunted = dog_targets[i];
		}
		if(dog_targets[i].hunted_by < least_hunted.hunted_by)
		{
			least_hunted = dog_targets[i];
		}
	}
	if(!zm_utility::is_player_valid(least_hunted))
	{
		return undefined;
		continue;
	}
	least_hunted.hunted_by = least_hunted.hunted_by + 1;
	return least_hunted;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: dog_health_increase
	Namespace: zm_ai_dogs
	Checksum: 0x8F195877
	Offset: 0x1C40
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 518
*/
function dog_health_increase()
{
	players = GetPlayers();
	if(level.dog_round_count == 1)
	{
		level.DOG_HEALTH = 800;
		if(isdefined(level.var_4025bbc9) && level.var_4025bbc9)
		{
			level.DOG_HEALTH = 3200;
		}
	}
	else if(level.dog_round_count == 2)
	{
		level.DOG_HEALTH = 1800;
		if(isdefined(level.var_4025bbc9) && level.var_4025bbc9)
		{
			level.DOG_HEALTH = 7200;
		}
	}
	else if(level.dog_round_count == 3)
	{
		level.DOG_HEALTH = 3200;
		if(isdefined(level.var_4025bbc9) && level.var_4025bbc9)
		{
			level.DOG_HEALTH = 10400;
		}
	}
	else if(level.dog_round_count == 4)
	{
		level.DOG_HEALTH = 6400;
		if(isdefined(level.var_4025bbc9) && level.var_4025bbc9)
		{
			level.DOG_HEALTH = 12800;
		}
	}
	var_7c4a64af = 6400;
	if(isdefined(level.var_4025bbc9) && level.var_4025bbc9)
	{
		var_7c4a64af = 12800;
	}
	if(level.DOG_HEALTH > var_7c4a64af)
	{
		level.DOG_HEALTH = 6400;
		if(isdefined(level.var_4025bbc9) && level.var_4025bbc9)
		{
			var_7c4a64af = 12800;
			return;
		}
	}
}

/*
	Name: dog_round_wait_func
	Namespace: zm_ai_dogs
	Checksum: 0xEA14538E
	Offset: 0x1DE8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 579
*/
function dog_round_wait_func()
{
	if(level flag::get("dog_round"))
	{
		wait(7);
		while(level.dog_intermission)
		{
			wait(0.5);
		}
		zm::increment_dog_round_stat("finished");
	}
	level.sndMusicSpecialRound = 0;
}

/*
	Name: dog_round_tracker
	Namespace: zm_ai_dogs
	Checksum: 0xFE652832
	Offset: 0x1E58
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 603
*/
function dog_round_tracker()
{
	level.dog_round_count = 1;
	level.next_dog_round = level.round_number + 5;
	old_spawn_func = level.round_spawn_func;
	old_wait_func = level.round_wait_func;
	while(1)
	{
		level waittill("between_round_over");
		if(level.round_number == level.next_dog_round)
		{
			level.sndMusicSpecialRound = 1;
			old_spawn_func = level.round_spawn_func;
			old_wait_func = level.round_wait_func;
			dog_round_start();
			level.round_spawn_func = &dog_round_spawning;
			level.round_wait_func = &dog_round_wait_func;
			level.next_dog_round = level.round_number + 5;
		}
		else if(level flag::get("dog_round"))
		{
			dog_round_stop();
			level.round_spawn_func = old_spawn_func;
			level.round_wait_func = old_wait_func;
			level.dog_round_count = level.dog_round_count + 1;
		}
	}
}

/*
	Name: dog_round_start
	Namespace: zm_ai_dogs
	Checksum: 0xC0AEAFCD
	Offset: 0x1FC0
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 642
*/
function dog_round_start()
{
	level flag::set("dog_round");
	level flag::set("special_round");
	level flag::set("dog_clips");
	level notify("dog_round_starting");
	if(isdefined(level.var_60074393) && level.var_60074393 && isdefined(level.var_4011a94e))
	{
		var_53639068 = "vk_tra_snd_roundchange_dogs_" + level.var_4011a94e + "_start";
		foreach(player in GetPlayers())
		{
			player playlocalsound(var_53639068);
		}
		namespace_f56b53f0::function_dbe7e78b("Playing Music '^3" + var_53639068 + "^7'");
		thread function_e9b57a10();
		continue;
	}
	level thread zm_audio::sndmusicsystem_playstate("dog_start");
	util::clientNotify("dog_start");
	if(isdefined(level.dog_melee_range))
	{
		SetDvar("ai_meleeRange", level.dog_melee_range);
		continue;
	}
	SetDvar("ai_meleeRange", 100);
}

/*
	Name: function_e9b57a10
	Namespace: zm_ai_dogs
	Checksum: 0x60D9E849
	Offset: 0x21E8
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 679
*/
function function_e9b57a10()
{
	wait(3.25);
	if(isdefined(level.var_60074393) && level.var_60074393 && isdefined(level.var_4011a94e))
	{
		var_53639068 = "vk_zm_ann_" + level.var_4011a94e + "_dogstart";
		foreach(player in GetPlayers())
		{
			player playlocalsound(var_53639068);
		}
		namespace_f56b53f0::function_dbe7e78b("Playing Announcer '^3" + var_53639068 + "^7'");
	}
}

/*
	Name: dog_round_stop
	Namespace: zm_ai_dogs
	Checksum: 0x14D0FCDB
	Offset: 0x2310
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 703
*/
function dog_round_stop()
{
	level flag::clear("dog_round");
	level flag::clear("special_round");
	level flag::clear("dog_clips");
	level notify("dog_round_ending");
	util::clientNotify("dog_stop");
	SetDvar("ai_meleeRange", level.melee_range_sav);
	SetDvar("ai_meleeWidth", level.melee_width_sav);
	SetDvar("ai_meleeHeight", level.melee_height_sav);
}

/*
	Name: play_dog_round
	Namespace: zm_ai_dogs
	Checksum: 0x21B07E63
	Offset: 0x2408
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 725
*/
function play_dog_round()
{
	self playlocalsound("zmb_dog_round_start");
	variation_count = 5;
	wait(4.5);
	players = GetPlayers();
	num = randomIntRange(0, players.size);
	players[num] zm_audio::create_and_play_dialog("general", "dog_spawn");
}

/*
	Name: dog_init
	Namespace: zm_ai_dogs
	Checksum: 0x90C1ACA5
	Offset: 0x24C8
	Size: 0x410
	Parameters: 0
	Flags: None
	Line Number: 745
*/
function dog_init()
{
	self.targetname = "zombie_dog";
	self.script_noteworthy = undefined;
	self.animName = "zombie_dog";
	self.ignoreall = 1;
	self.ignoreme = 1;
	self.allowdeath = 1;
	self.allowPain = 0;
	self.force_gib = 1;
	self.is_zombie = 1;
	self.gibbed = 0;
	self.head_gibbed = 0;
	self.default_goalheight = 40;
	self.ignore_inert = 1;
	self.holdFire = 1;
	self.grenadeawareness = 0;
	self.badplaceawareness = 0;
	self.ignoreSuppression = 1;
	self.suppressionThreshold = 1;
	self.noDodgeMove = 1;
	self.dontShootWhileMoving = 1;
	self.pathenemylookahead = 0;
	self.badplaceawareness = 0;
	self.chatInitialized = 0;
	self.team = level.zombie_team;
	self.heroweapon_kill_power = 2;
	self AllowPitchAngle(1);
	self SetPitchOrient();
	self SetAvoidanceMask("avoid none");
	self PushActors(1);
	health_multiplier = 1;
	if(GetDvarString("scr_dog_health_walk_multiplier") != "")
	{
		health_multiplier = GetDvarFloat("scr_dog_health_walk_multiplier");
	}
	self.maxhealth = Int(level.DOG_HEALTH * health_multiplier);
	self.health = Int(level.DOG_HEALTH * health_multiplier);
	self.freezegun_damage = 0;
	self.zombie_move_speed = "sprint";
	self.a.nodeath = 1;
	self thread dog_run_think();
	self thread dog_stalk_audio();
	self thread zombie_utility::round_spawn_failsafe();
	self ghost();
	self thread util::magic_bullet_shield();
	self thread dog_death();
	level thread zm_spawner::zombie_death_event(self);
	self thread zm_spawner::enemy_death_detection();
	self thread zm_audio::zmbAIVox_NotifyConvert();
	self.a.disablePain = 1;
	self zm_utility::disable_react();
	self ClearGoalVolume();
	self.flame_damage_time = 0;
	self.meleeDamage = 40;
	self.thundergun_knockdown_func = &dog_thundergun_knockdown;
	self zm_spawner::zombie_history("zombie_dog_spawn_init -> Spawned = " + self.origin);
	if(isdefined(level.achievement_monitor_func))
	{
		self [[level.achievement_monitor_func]]();
	}
}

/*
	Name: dog_death
	Namespace: zm_ai_dogs
	Checksum: 0xE31656FA
	Offset: 0x28E0
	Size: 0x350
	Parameters: 0
	Flags: None
	Line Number: 818
*/
function dog_death()
{
	self waittill("death");
	if(zombie_utility::get_current_zombie_count() == 0 && level.zombie_total == 0)
	{
		level.last_dog_origin = self.origin;
		level notify("last_ai_down", self);
	}
	if(isPlayer(self.attacker))
	{
		event = "death";
		if(self.damageWeapon.isBallisticKnife)
		{
			event = "ballistic_knife_death";
		}
		if(!(isdefined(self.deathpoints_already_given) && self.deathpoints_already_given))
		{
			self.attacker zm_score::player_add_points(event, self.damageMod, self.damagelocation, 1);
		}
		if(isdefined(level.hero_power_update))
		{
			[[level.hero_power_update]](self.attacker, self);
		}
		if(randomIntRange(0, 100) >= 80)
		{
			self.attacker zm_audio::create_and_play_dialog("kill", "hellhound");
		}
		self.attacker zm_stats::increment_client_stat("zdogs_killed");
		self.attacker zm_stats::increment_player_stat("zdogs_killed");
	}
	if(isdefined(self.attacker) && isai(self.attacker))
	{
		self.attacker notify("killed", self);
	}
	self StopLoopSound();
	if(!(isdefined(self.a.nodeath) && self.a.nodeath))
	{
		trace = GroundTrace(self.origin + VectorScale((0, 0, 1), 10), self.origin - VectorScale((0, 0, 1), 30), 0, self);
		if(trace["fraction"] < 1)
		{
			pitch = ACos(VectorDot(trace["normal"], (0, 0, 1)));
			if(pitch > 10)
			{
				self.a.nodeath = 1;
			}
		}
	}
	if(isdefined(self.a.nodeath))
	{
		level thread dog_explode_fx(self.origin);
		self delete();
		continue;
	}
	self notify("bhtn_action_notify", "death");
}

/*
	Name: dog_explode_fx
	Namespace: zm_ai_dogs
	Checksum: 0xC0F68713
	Offset: 0x2C38
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 884
*/
function dog_explode_fx(origin)
{
	level thread namespace_f56b53f0::function_de45d812(level._effect["dog_gib"], origin, 6);
	playsoundatposition("zmb_hellhound_explode", origin);
}

/*
	Name: zombie_setup_attack_properties_dog
	Namespace: zm_ai_dogs
	Checksum: 0x335EA1D
	Offset: 0x2CA0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 900
*/
function zombie_setup_attack_properties_dog()
{
	self zm_spawner::zombie_history("zombie_setup_attack_properties()");
	self thread dog_behind_audio();
	self.ignoreall = 0;
	self.meleeAttackDist = 64;
	self.disableArrivals = 1;
	self.disableExits = 1;
	if(isdefined(level.dog_setup_func))
	{
		self [[level.dog_setup_func]]();
	}
}

/*
	Name: stop_dog_sound_on_death
	Namespace: zm_ai_dogs
	Checksum: 0xA392BDC3
	Offset: 0x2D30
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 924
*/
function stop_dog_sound_on_death()
{
	self waittill("death");
	self stopsounds();
}

/*
	Name: dog_behind_audio
	Namespace: zm_ai_dogs
	Checksum: 0xF5F904EA
	Offset: 0x2D60
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 940
*/
function dog_behind_audio()
{
	self thread stop_dog_sound_on_death();
	self endon("death");
	self util::waittill_any("dog_running", "dog_combat");
	self notify("bhtn_action_notify", "close");
	wait(3);
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			dogAngle = AngleClamp180(VectorToAngles(self.origin - players[i].origin)[1] - players[i].angles[1]);
			if(isalive(players[i]) && !isdefined(players[i].reviveTrigger))
			{
				if(Abs(dogAngle) > 90 && Distance2D(self.origin, players[i].origin) > 100)
				{
					self notify("bhtn_action_notify", "close");
					wait(3);
				}
			}
		}
		wait(0.75);
	}
}

/*
	Name: dog_clip_monitor
	Namespace: zm_ai_dogs
	Checksum: 0xA29F17A3
	Offset: 0x2F48
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 976
*/
function dog_clip_monitor()
{
	clips_on = 0;
	level.dog_clips = GetEntArray("dog_clips", "targetname");
	while(1)
	{
		for(i = 0; i < level.dog_clips.size; i++)
		{
			level.dog_clips[i] connectpaths();
		}
		level flag::wait_till("dog_clips");
		if(isdefined(level.no_dog_clip) && level.no_dog_clip == 1)
		{
			return;
		}
		for(i = 0; i < level.dog_clips.size; i++)
		{
			level.dog_clips[i] disconnectpaths();
			util::wait_network_frame();
		}
		dog_is_alive = 1;
		while(dog_is_alive || level flag::get("dog_round"))
		{
			dog_is_alive = 0;
			dogs = GetEntArray("zombie_dog", "targetname");
			for(i = 0; i < dogs.size; i++)
			{
				if(isalive(dogs[i]))
				{
					dog_is_alive = 1;
				}
			}
			wait(1);
		}
		level flag::clear("dog_clips");
		wait(1);
	}
}

/*
	Name: special_dog_spawn
	Namespace: zm_ai_dogs
	Checksum: 0x7A0C12FA
	Offset: 0x3158
	Size: 0xC0
	Parameters: 3
	Flags: None
	Line Number: 1025
*/
function special_dog_spawn(num_to_spawn, spawners, spawn_point)
{
	favorite_enemy = get_favorite_enemy();
	ai = zombie_utility::spawn_zombie(spawners, "zombie_dog", spawn_point);
	ai.targetname = "zombie_dog";
	if(isdefined(ai))
	{
		ai.favoriteenemy = favorite_enemy;
		spawn_point thread dog_spawn_fx(ai, spawn_point);
		return ai;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: dog_run_think
	Namespace: zm_ai_dogs
	Checksum: 0x5E777503
	Offset: 0x3220
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1050
*/
function dog_run_think()
{
	self endon("death");
	self waittill("visible");
	if(self.health > level.DOG_HEALTH)
	{
		self.maxhealth = level.DOG_HEALTH;
		self.health = level.DOG_HEALTH;
	}
	self clientfield::set("dog_fx", 1);
	self PlayLoopSound("zmb_hellhound_loop_fire");
	while(1)
	{
		if(!zm_utility::is_player_valid(self.favoriteenemy))
		{
			self.favoriteenemy = get_favorite_enemy();
		}
		if(isdefined(level.custom_dog_target_validity_check))
		{
			self [[level.custom_dog_target_validity_check]]();
		}
		wait(0.2);
	}
}

/*
	Name: dog_stalk_audio
	Namespace: zm_ai_dogs
	Checksum: 0x104112DD
	Offset: 0x3328
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 1085
*/
function dog_stalk_audio()
{
	self endon("death");
	self endon("dog_running");
	self endon("dog_combat");
	while(1)
	{
		self notify("bhtn_action_notify", "ambient");
		wait(RandomFloatRange(2, 4));
	}
}

/*
	Name: dog_thundergun_knockdown
	Namespace: zm_ai_dogs
	Checksum: 0x8BE0CE30
	Offset: 0x3390
	Size: 0x7C
	Parameters: 2
	Flags: None
	Line Number: 1107
*/
function dog_thundergun_knockdown(player, gib)
{
	self endon("death");
	damage = Int(self.maxhealth * 0.5);
	self DoDamage(damage, player.origin, player);
}

