#include scripts\codescripts\struct;
#include scripts\shared\_burnplayer;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\mechz;
#include scripts\shared\ai\systems\animation_state_machine_mocomp;
#include scripts\shared\ai\systems\animation_state_machine_notetracks;
#include scripts\shared\ai\systems\animation_state_machine_utility;
#include scripts\shared\ai\systems\behavior_tree_utility;
#include scripts\shared\ai\systems\blackboard;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_electroball_grenade;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_elemental_zombies;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_ef567265;

/*
	Name: __init__sytem__
	Namespace: namespace_ef567265
	Checksum: 0x74D16D49
	Offset: 0x1250
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 51
*/
function autoexec __init__sytem__()
{
	system::register("zm_ai_mechz", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_ef567265
	Checksum: 0x9EE4BCCF
	Offset: 0x1298
	Size: 0xC28
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function __init__()
{
	spawner::add_archetype_spawn_function("mechz", &mechz_setup);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zmMechzTargetService", &function_c28caf48);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("castleMechzTrapService", &function_b25360f);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("genesisVortexService", &function_8746ceea);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("genesisMechzOctobombService", &function_2ffb7337);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("castleMechzShouldMoveToTrap", &function_beb13c4b);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("castleMechzIsAtTrap", &function_fc277828);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("castleMechzShouldAttackTrap", &function_d1cb5cbc);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("genesisMechzShouldOctobombAttack", &function_4e06a982);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("casteMechzTrapMoveTerminate", &function_4210ca29);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("casteMechzTrapAttackTerminate", &function_910e57ee);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("genesisMechzDestoryOctobomb", &function_78198ba2);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzGetTankTagService", &function_b6ebb97d);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzGetJumpPosService", &function_4f9821c3);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzShouldJump", &function_c9cd5bdd);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzShouldShootFlameAtTank", &function_9ea85604);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzWasKnockedDownByTank", &function_b47192a9);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzWasRobotStomped", &function_4bbd0723);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzShouldShowPain", &mechzShouldShowPain);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzJumpUpActionStart", &function_6f434f2b);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzJumpUpActionTerminate", &function_e3577caa);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeAction("tombMechzJumpHoverAction", undefined, &function_9c28039a, undefined);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzJumpDownActionStart", &function_58e29f36);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzJumpDownActionTerminate", &function_647ea967);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzRobotStompActionStart", &function_13bab4e7);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeAction("tombMechzRobotStompActionLoop", undefined, &function_a833c7b2, undefined);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzRobotStompActionEnd", &function_e260a84c);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeAction("tombMechzShootFlameAtTankAction", &function_84bcf2d9, &MechzBehavior::mechzShootFlameActionUpdate, &function_f10762);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzTankKnockdownActionStart", &function_f7a84bd6);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeAction("tombMechzTankKnockdownActionLoop", undefined, &function_9dc92f99, undefined);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("tombMechzTankKnockdownActionEnd", &function_5276dd35);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zmMechzShouldShootClaw", &function_bdc90f38);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeAction("zmMechzShootClawAction", &function_86ac6346, &function_a94df749, &function_1b118e5);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zmMechzShootClaw", &function_456e76fa);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zmMechzUpdateClaw", &function_a844c266);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zmMechzStopClaw", &function_75278fab);
	AnimationStateNetwork::RegisterAnimationMocomp("mocomp_trap_attack@mechz", &function_45f397ee, undefined, &function_9da58a6f);
	AnimationStateNetwork::RegisterAnimationMocomp("mocomp_teleport_traversal@mechz", &function_74fd2ef2, undefined, undefined);
	AnimationStateNetwork::RegisterAnimationMocomp("mocomp_face_tank@mechz", &function_f5914854, undefined, undefined);
	AnimationStateNetwork::RegisterAnimationMocomp("mocomp_jump_tank@mechz", &function_6b174fa3, undefined, undefined);
	AnimationStateNetwork::RegisterAnimationMocomp("mocomp_tomb_mechz_traversal@mechz", &function_1de8a53d, undefined, &function_dbe1d29c);
	AnimationStateNetwork::RegisterNotetrackHandlerFunction("muzzleflash", &function_868cb9c0);
	AnimationStateNetwork::RegisterNotetrackHandlerFunction("start_ft", &function_7b7c7bf1);
	AnimationStateNetwork::RegisterNotetrackHandlerFunction("stop_ft", &function_727ae663);
	clientfield::register("scriptmover", "mechz_claw", 1, 1, "int");
	clientfield::register("actor", "mechz_wpn_source", 1, 1, "int");
	clientfield::register("toplayer", "mechz_grab", 1, 1, "int");
	clientfield::register("actor", "tomb_mech_eye", 1, 1, "int");
	level thread AAT::register_immunity("zm_aat_blast_furnace", "mechz", 0, 1, 1);
	level thread AAT::register_immunity("zm_aat_dead_wire", "mechz", 1, 1, 1);
	level thread AAT::register_immunity("zm_aat_fire_works", "mechz", 1, 1, 1);
	level thread AAT::register_immunity("zm_aat_thunder_wall", "mechz", 0, 1, 1);
	level thread AAT::register_immunity("zm_aat_turned", "mechz", 1, 1, 1);
	level.var_9f43bbe2 = 3062.5;
	level.mechz_points_for_killer = 250;
	level.mechz_points_for_team = 500;
	level.mechz_points_for_helmet = 100;
	level.mechz_points_for_powerplant = 100;
	level.mechz_base_health = 4800;
	level.mechz_health = level.mechz_base_health;
	level.var_fa14536d = 1500;
	level.MECHZ_FACEPLATE_HEALTH = level.var_fa14536d;
	level.var_f12b2aa3 = 500;
	level.MECHZ_POWERCAP_COVER_HEALTH = level.var_f12b2aa3;
	level.var_e12ec39f = 500;
	level.MECHZ_POWERCAP_HEALTH = level.var_e12ec39f;
	level.var_3f1bf221 = 250;
	level.mechz_armor_health = level.var_3f1bf221;
	level.mechz_health_increase = 1000;
	level.mechz_shotgun_damage_mod = 1.5;
	level.mechz_damage_percent = 0.1;
	level.mechz_helmet_health_percentage = 0.1;
	level.mechz_explosive_dmg_to_cancel_claw_percentage = 0.1;
	level.mechz_powerplant_destroyed_health_percentage = 0.025;
	level.mechz_powerplant_expose_health_percentage = 0.05;
	level.mechz_custom_goalradius = 48;
	level.mechz_tank_knockdown_time = 5;
	level.mechz_robot_knockdown_time = 10;
	level.mechz_claw_cooldown_time = 7000;
	level.mechz_flamethrower_cooldown_time = 7500;
	level.mechz_jump_delay = 3;
	level.num_mechz_spawned = 0;
	level.mechz_round_count = 0;
	level.mechz_min_round_fq = 3;
	level.mechz_max_round_fq = 4;
	level.mechz_min_round_fq_solo = 4;
	level.mechz_max_round_fq_solo = 6;
	level.mechz_zombie_per_round = 1;
	level.mechz_left_to_spawn = 0;
	level.mechz_spawners = GetEntArray("zombie_mechz_spawner", "script_noteworthy");
	level.mechz_locations = struct::get_array("mechz_location", "script_noteworthy");
	level._effect["mechz_death"] = "dlc1/castle/fx_mech_death";
	level.mechz_staff_damage_override = &mechz_staff_damage_override;
	level.mechz_flamethrower_ai_callback = &function_1ba0237a;
	level.mechz_left_arm_damage_callback = &function_671deda5;
	level flag::init("mechz_launching_claw");
	level flag::init("mechz_claw_move_complete");
	zm::register_player_damage_callback(&function_ed70c868);
	mechz_setup_armor_pieces();
	level thread mechz_spawning_logic();
}

/*
	Name: __main__
	Namespace: namespace_ef567265
	Checksum: 0xF68A1BFE
	Offset: 0x1EC8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 180
*/
function __main__()
{
	if(!isdefined(level.var_753038e8))
	{
		level.var_753038e8 = 80;
	}
	visionset_mgr::register_info("overlay", "mechz_player_burn", 5000, level.var_753038e8, 15, 1, &visionset_mgr::duration_lerp_thread_per_player, 0);
	level.var_87707547 = 1;
}

/*
	Name: function_c28caf48
	Namespace: namespace_ef567265
	Checksum: 0x6C4B5398
	Offset: 0x1F38
	Size: 0x260
	Parameters: 1
	Flags: None
	Line Number: 200
*/
function function_c28caf48(e_entity)
{
	if(isdefined(e_entity.ignoreall) && e_entity.ignoreall)
	{
		return 0;
	}
	if(isdefined(e_entity.destroy_octobomb))
	{
		return 0;
	}
	e_player = zm_utility::get_closest_valid_player(e_entity.origin, e_entity.ignore_player);
	e_entity.favoriteenemy = e_player;
	if(!isdefined(e_player) || e_player IsNoTarget())
	{
		if(isdefined(e_entity.ignore_player))
		{
			if(isdefined(level._should_skip_ignore_player_logic) && [[level._should_skip_ignore_player_logic]]())
			{
				return;
			}
			e_entity.ignore_player = [];
		}
		if(isdefined(level.no_target_override))
		{
			[[level.no_target_override]](e_entity);
			continue;
		}
		e_entity SetGoal(e_entity.origin);
		return 0;
	}
	else if(isdefined(level.enemy_location_override_func))
	{
		enemy_ground_pos = [[level.enemy_location_override_func]](e_entity, e_player);
		if(isdefined(enemy_ground_pos))
		{
			e_entity SetGoal(enemy_ground_pos);
			return 1;
		}
	}
	v_player_origin = e_player.origin;
	if(isdefined(e_player.last_valid_position))
	{
		v_player_origin = e_player.last_valid_position;
	}
	var_484a53d8 = GetClosestPointOnNavMesh(v_player_origin, 64, 30);
	if(isdefined(var_484a53d8))
	{
		e_entity SetGoal(var_484a53d8);
		return 1;
	}
	e_entity SetGoal(e_entity.origin);
	return 0;
}

/*
	Name: function_b25360f
	Namespace: namespace_ef567265
	Checksum: 0x56ED6F12
	Offset: 0x21A0
	Size: 0x338
	Parameters: 1
	Flags: None
	Line Number: 264
*/
function function_b25360f(e_entity)
{
	if(isdefined(e_entity.var_626a878a) && e_entity.var_626a878a || (isdefined(e_entity.var_8562a4cb) && e_entity.var_8562a4cb))
	{
		return 1;
	}
	a_traps = Array::get_all_closest(e_entity.origin, GetEntArray("zombie_trap", "targetname"), undefined, undefined, 240);
	if(!isdefined(a_traps) || !IsArray(a_traps) || a_traps.size <= 0)
	{
		return 0;
	}
	for(i = 0; i < a_traps.size; i++)
	{
		if(!(isdefined(a_traps[i]._trap_in_use) && a_traps[i]._trap_in_use) || (isdefined(a_traps[i]._trap_cooling_down) && a_traps[i]._trap_cooling_down))
		{
			continue;
		}
		var_9c0e9fd0 = Array::get_all_closest(e_entity.origin, a_traps[i]._trap_use_trigs);
		for(t = 0; t < var_9c0e9fd0.size; t++)
		{
			if(!e_entity CanPath(e_entity.origin, var_9c0e9fd0[t].origin))
			{
				continue;
			}
			if(!isdefined(e_entity.var_e99cd3bf) || (isdefined(e_entity.var_e99cd3bf) && PathDistance(e_entity.origin, var_9c0e9fd0[t].origin) <= PathDistance(e_entity.origin, e_entity.var_e99cd3bf.origin)))
			{
				e_entity.var_2f028852 = a_traps[i];
				e_entity.var_e99cd3bf = var_9c0e9fd0[t];
			}
		}
	}
	if(!isdefined(e_entity.var_e99cd3bf))
	{
		return 0;
	}
	e_entity.var_626a878a = 1;
	e_entity.ignoreall = 1;
	e_entity SetGoal(e_entity.var_e99cd3bf.origin);
	return 1;
}

/*
	Name: function_8746ceea
	Namespace: namespace_ef567265
	Checksum: 0xAEBA41F4
	Offset: 0x24E0
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 315
*/
function function_8746ceea(e_entity)
{
	return 0;
}

/*
	Name: function_2ffb7337
	Namespace: namespace_ef567265
	Checksum: 0x2F394AA6
	Offset: 0x24F8
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 330
*/
function function_2ffb7337(e_entity)
{
	if(isdefined(e_entity.destroy_octobomb))
	{
		e_entity SetGoal(e_entity.destroy_octobomb.origin);
		return 1;
	}
	if(isdefined(level.octobombs))
	{
		foreach(var_187d070c in level.octobombs)
		{
			if(isdefined(var_187d070c))
			{
				n_dist_sq = DistanceSquared(var_187d070c.origin, e_entity.origin);
				if(n_dist_sq < 360000)
				{
					e_entity.destroy_octobomb = var_187d070c;
					e_entity SetGoal(var_187d070c.origin);
					return 1;
				}
			}
		}
	}
	return 0;
}

/*
	Name: function_beb13c4b
	Namespace: namespace_ef567265
	Checksum: 0x1842F8CF
	Offset: 0x2660
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 366
*/
function function_beb13c4b(e_entity)
{
	if(isdefined(e_entity.var_626a878a) && e_entity.var_626a878a)
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fc277828
	Namespace: namespace_ef567265
	Checksum: 0x387DE48F
	Offset: 0x26A8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 386
*/
function function_fc277828(e_entity)
{
	if(e_entity IsAtGoal())
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_d1cb5cbc
	Namespace: namespace_ef567265
	Checksum: 0x277D0D63
	Offset: 0x26E0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 405
*/
function function_d1cb5cbc(e_entity)
{
	if(isdefined(e_entity.var_8562a4cb) && e_entity.var_8562a4cb)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_4e06a982
	Namespace: namespace_ef567265
	Checksum: 0x4651F5EB
	Offset: 0x2728
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 424
*/
function function_4e06a982(e_entity)
{
	if(!isdefined(e_entity.destroy_octobomb))
	{
		return 0;
	}
	if(DistanceSquared(e_entity.origin, e_entity.destroy_octobomb.origin) > 16384)
	{
		return 0;
	}
	n_yaw = Abs(zombie_utility::GetYawToSpot(e_entity.destroy_octobomb.origin));
	if(n_yaw > 45)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_4210ca29
	Namespace: namespace_ef567265
	Checksum: 0x5366CFA7
	Offset: 0x27F0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 452
*/
function function_4210ca29(e_entity)
{
	e_entity.var_626a878a = 0;
	e_entity.var_8562a4cb = 1;
}

/*
	Name: function_910e57ee
	Namespace: namespace_ef567265
	Checksum: 0x50EB437D
	Offset: 0x2828
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 468
*/
function function_910e57ee(e_entity)
{
	e_entity.var_2f028852 notify("hash_6acbb429");
	e_entity.var_e99cd3bf = undefined;
	e_entity.var_2f028852 = undefined;
	e_entity.var_8562a4cb = undefined;
	e_entity.ignoreall = 0;
	MechzBehavior::mechzTargetService(e_entity);
}

/*
	Name: function_78198ba2
	Namespace: namespace_ef567265
	Checksum: 0x77B2C225
	Offset: 0x28A8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 488
*/
function function_78198ba2(e_entity)
{
	if(isdefined(e_entity.destroy_octobomb))
	{
		e_entity.destroy_octobomb detonate();
		e_entity.destroy_octobomb = undefined;
	}
	MechzBehavior::mechzStopFlame(e_entity);
}

/*
	Name: function_b6ebb97d
	Namespace: namespace_ef567265
	Checksum: 0xFBCD921
	Offset: 0x2918
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 508
*/
function function_b6ebb97d(e_entity)
{
	return 0;
}

/*
	Name: function_4f9821c3
	Namespace: namespace_ef567265
	Checksum: 0x72DCDD2
	Offset: 0x2930
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 523
*/
function function_4f9821c3(e_entity)
{
	return 0;
}

/*
	Name: function_c9cd5bdd
	Namespace: namespace_ef567265
	Checksum: 0xEED933F6
	Offset: 0x2948
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 538
*/
function function_c9cd5bdd(e_entity)
{
	if(isdefined(e_entity.force_jump) && e_entity.force_jump)
	{
		return 1;
	}
	if(!isdefined(e_entity.jump_pos))
	{
		return 0;
	}
	if(DistanceSquared(e_entity.origin, e_entity.jump_pos.origin) > 100)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_9ea85604
	Namespace: namespace_ef567265
	Checksum: 0xBDBB4783
	Offset: 0x29E8
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 565
*/
function function_9ea85604(e_entity)
{
	return 0;
}

/*
	Name: function_b47192a9
	Namespace: namespace_ef567265
	Checksum: 0xF87D77B3
	Offset: 0x2A00
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 580
*/
function function_b47192a9(e_entity, var_2bb8c91e)
{
	return 0;
}

/*
	Name: function_4bbd0723
	Namespace: namespace_ef567265
	Checksum: 0x8DA1E349
	Offset: 0x2A20
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 595
*/
function function_4bbd0723(e_entity, var_2bb8c91e)
{
	return isdefined(e_entity.robot_stomped) && e_entity.robot_stomped;
}

/*
	Name: mechzShouldShowPain
	Namespace: namespace_ef567265
	Checksum: 0x91628F2E
	Offset: 0x2A60
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 610
*/
function mechzShouldShowPain(e_entity)
{
	if(e_entity.partDestroyed === 1)
	{
		return 1;
	}
	if(e_entity.show_pain_from_explosive_dmg === 1)
	{
		return 1;
	}
}

/*
	Name: function_6f434f2b
	Namespace: namespace_ef567265
	Checksum: 0x43961462
	Offset: 0x2AB0
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 632
*/
function function_6f434f2b(e_entity, var_2bb8c91e)
{
	e_entity SetFreeCameraLockOnAllowed(0);
	e_entity thread mechz_jump_vo();
	e_entity PathMode("dont move");
}

/*
	Name: function_e3577caa
	Namespace: namespace_ef567265
	Checksum: 0xFFA4D637
	Offset: 0x2B20
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 649
*/
function function_e3577caa(e_entity, var_2bb8c91e)
{
}

/*
	Name: function_9c28039a
	Namespace: namespace_ef567265
	Checksum: 0x9428D5FA
	Offset: 0x2B40
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 663
*/
function function_9c28039a(e_entity, var_2bb8c91e)
{
	return 4;
}

/*
	Name: function_58e29f36
	Namespace: namespace_ef567265
	Checksum: 0x419CB06
	Offset: 0x2B60
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 678
*/
function function_58e29f36(e_entity, var_2bb8c91e)
{
}

/*
	Name: function_647ea967
	Namespace: namespace_ef567265
	Checksum: 0xE1AA62C
	Offset: 0x2B80
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 692
*/
function function_647ea967(e_entity, var_2bb8c91e)
{
	e_entity solid();
	e_entity SetFreeCameraLockOnAllowed(1);
	e_entity.force_jump = undefined;
	e_entity PathMode("move allowed");
}

/*
	Name: function_13bab4e7
	Namespace: namespace_ef567265
	Checksum: 0xD27D71D7
	Offset: 0x2BF8
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 710
*/
function function_13bab4e7(e_entity, var_2bb8c91e)
{
}

/*
	Name: function_a833c7b2
	Namespace: namespace_ef567265
	Checksum: 0x4EAD96EE
	Offset: 0x2C18
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 724
*/
function function_a833c7b2(e_entity, var_2bb8c91e)
{
	return 4;
}

/*
	Name: function_e260a84c
	Namespace: namespace_ef567265
	Checksum: 0x66DC0FEC
	Offset: 0x2C38
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 739
*/
function function_e260a84c(e_entity, var_2bb8c91e)
{
}

/*
	Name: function_84bcf2d9
	Namespace: namespace_ef567265
	Checksum: 0x5F5897E9
	Offset: 0x2C58
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 753
*/
function function_84bcf2d9(e_entity, var_2bb8c91e)
{
	e_entity.doing_tank_sweep = 1;
	return MechzBehavior::mechzShootFlameActionStart(e_entity, var_2bb8c91e);
}

/*
	Name: function_f10762
	Namespace: namespace_ef567265
	Checksum: 0xAED2563C
	Offset: 0x2CA8
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 769
*/
function function_f10762(e_entity, var_2bb8c91e)
{
	e_entity.doing_tank_sweep = undefined;
	return MechzBehavior::mechzShootFlameActionEnd(e_entity, var_2bb8c91e);
}

/*
	Name: function_f7a84bd6
	Namespace: namespace_ef567265
	Checksum: 0x9C124006
	Offset: 0x2CF0
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 785
*/
function function_f7a84bd6(e_entity, var_2bb8c91e)
{
}

/*
	Name: function_9dc92f99
	Namespace: namespace_ef567265
	Checksum: 0x661FDCBB
	Offset: 0x2D10
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 799
*/
function function_9dc92f99(e_entity, var_2bb8c91e)
{
	return 4;
}

/*
	Name: function_5276dd35
	Namespace: namespace_ef567265
	Checksum: 0xA8BA3BF1
	Offset: 0x2D30
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 814
*/
function function_5276dd35(e_entity, var_2bb8c91e)
{
}

/*
	Name: function_bdc90f38
	Namespace: namespace_ef567265
	Checksum: 0x257987C7
	Offset: 0x2D50
	Size: 0x2E0
	Parameters: 1
	Flags: None
	Line Number: 828
*/
function function_bdc90f38(e_entity)
{
	if(!e_entity zm_utility::in_playable_area())
	{
		return 0;
	}
	if(!isdefined(e_entity.var_3f56e604))
	{
		return 0;
	}
	if(!isdefined(e_entity.favoriteenemy))
	{
		return 0;
	}
	if(!(isdefined(e_entity.has_powercap) && e_entity.has_powercap))
	{
		return 0;
	}
	if(isdefined(e_entity.last_claw_time) && GetTime() - e_entity.last_claw_time < level.mechz_claw_cooldown_time)
	{
		return 0;
	}
	if(isdefined(e_entity.Berserk) && e_entity.Berserk)
	{
		return 0;
	}
	if(!e_entity MechzServerUtils::mechzCheckInArc())
	{
		return 0;
	}
	n_dist_sq = DistanceSquared(e_entity.origin, e_entity.favoriteenemy.origin);
	if(n_dist_sq < 40000 || n_dist_sq > 1000000)
	{
		return 0;
	}
	if(!e_entity.favoriteenemy player_can_be_grabbed())
	{
		return 0;
	}
	var_6a0de68a = zm_zonemgr::get_zone_from_position(e_entity.origin + VectorScale((0, 0, 1), 36));
	if(isdefined(var_6a0de68a) && "ug_bottom_zone" == var_6a0de68a)
	{
		return 0;
	}
	var_98c2659 = 9;
	v_claw_origin = e_entity.origin + VectorScale((0, 0, 1), 65);
	s_trace = PhysicsTrace(v_claw_origin, e_entity.favoriteenemy.origin + VectorScale((0, 0, 1), 30), (-15, -15, -20), (15, 15, 40), e_entity, var_98c2659);
	b_can_see = s_trace["fraction"] == 1 || (isdefined(s_trace["entity"]) && s_trace["entity"] == e_entity.favoriteenemy);
	if(!b_can_see)
	{
		return 0;
		return;
	}
}

/*
	Name: function_86ac6346
	Namespace: namespace_ef567265
	Checksum: 0x960F6371
	Offset: 0x3038
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 893
*/
function function_86ac6346(e_entity, var_2bb8c91e)
{
	AnimationStateNetworkUtility::RequestState(e_entity, var_2bb8c91e);
	function_456e76fa(e_entity);
	return 5;
}

/*
	Name: function_a94df749
	Namespace: namespace_ef567265
	Checksum: 0x64696CA3
	Offset: 0x3088
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 910
*/
function function_a94df749(e_entity, var_2bb8c91e)
{
	if(!(isdefined(e_entity.var_b4534ae0) && e_entity.var_b4534ae0))
	{
		return 4;
	}
	return 5;
}

/*
	Name: function_1b118e5
	Namespace: namespace_ef567265
	Checksum: 0x4EF268ED
	Offset: 0x30D8
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 929
*/
function function_1b118e5(e_entity, var_2bb8c91e)
{
	return 4;
}

/*
	Name: function_a844c266
	Namespace: namespace_ef567265
	Checksum: 0x87EA950C
	Offset: 0x30F8
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 944
*/
function function_a844c266(e_entity)
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_75278fab
	Namespace: namespace_ef567265
	Checksum: 0xCD8578C5
	Offset: 0x3110
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 960
*/
function function_75278fab(e_entity)
{
}

/*
	Name: function_45f397ee
	Namespace: namespace_ef567265
	Checksum: 0xEAD49E66
	Offset: 0x3128
	Size: 0x88
	Parameters: 5
	Flags: None
	Line Number: 974
*/
function function_45f397ee(e_entity, var_1f8893d4, var_eb4a8f8e, var_f4275004, var_77946b4c)
{
	e_entity OrientMode("face angle", e_entity.var_e99cd3bf.angles[1]);
	e_entity animmode("normal");
	return;
	++;
}

/*
	Name: function_9da58a6f
	Namespace: namespace_ef567265
	Checksum: 0xBAE7A667
	Offset: 0x31B8
	Size: 0x50
	Parameters: 5
	Flags: None
	Line Number: 992
*/
function function_9da58a6f(e_entity, var_1f8893d4, var_eb4a8f8e, var_f4275004, var_77946b4c)
{
	e_entity OrientMode("face default");
}

/*
	Name: function_74fd2ef2
	Namespace: namespace_ef567265
	Checksum: 0x14FE909A
	Offset: 0x3210
	Size: 0x30
	Parameters: 5
	Flags: None
	Line Number: 1007
*/
function function_74fd2ef2(e_entity, var_1f8893d4, var_eb4a8f8e, var_f4275004, var_77946b4c)
{
}

/*
	Name: function_f5914854
	Namespace: namespace_ef567265
	Checksum: 0x812A935F
	Offset: 0x3248
	Size: 0x30
	Parameters: 5
	Flags: None
	Line Number: 1021
*/
function function_f5914854(e_entity, var_1f8893d4, var_eb4a8f8e, var_f4275004, var_77946b4c)
{
}

/*
	Name: function_6b174fa3
	Namespace: namespace_ef567265
	Checksum: 0x443EDB12
	Offset: 0x3280
	Size: 0x50
	Parameters: 5
	Flags: None
	Line Number: 1035
*/
function function_6b174fa3(e_entity, var_1f8893d4, var_eb4a8f8e, var_f4275004, var_77946b4c)
{
	e_entity animmode("noclip", 0);
}

/*
	Name: function_1de8a53d
	Namespace: namespace_ef567265
	Checksum: 0x7B7D84DF
	Offset: 0x32D8
	Size: 0xF0
	Parameters: 5
	Flags: None
	Line Number: 1050
*/
function function_1de8a53d(e_entity, var_1f8893d4, var_eb4a8f8e, var_f4275004, var_77946b4c)
{
	e_entity animmode("noclip", 0);
	if(isdefined(e_entity.traverseStartNode))
	{
		e_entity OrientMode("face angle", e_entity.traverseStartNode.angles[1]);
	}
	e_entity SetRepairPaths(0);
	e_entity ForceTeleport(e_entity.traverseStartNode.origin, e_entity.traverseStartNode.angles, 0);
}

/*
	Name: function_dbe1d29c
	Namespace: namespace_ef567265
	Checksum: 0xE9482B41
	Offset: 0x33D0
	Size: 0x148
	Parameters: 5
	Flags: None
	Line Number: 1071
*/
function function_dbe1d29c(e_entity, var_1f8893d4, var_eb4a8f8e, var_f4275004, var_77946b4c)
{
	e_entity SetRepairPaths(1);
	if(isdefined(e_entity.traverseEndNode))
	{
		e_entity ForceTeleport(e_entity.traverseEndNode.origin, e_entity.traverseEndNode.angles, 0);
		continue;
	}
	var_feba5c63 = PositionQuery_Source_Navigation(e_entity.origin, 0, 64, 20, 4);
	if(var_feba5c63.data.size)
	{
		e_entity ForceTeleport(var_feba5c63.data[0].origin, e_entity.angles, 0);
	}
	e_entity finishtraversal();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_868cb9c0
	Namespace: namespace_ef567265
	Checksum: 0xE03994DA
	Offset: 0x3520
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 1099
*/
function function_868cb9c0(e_entity)
{
	self.var_b4534ae0 = 1;
	self.last_claw_time = GetTime();
	e_entity function_672f9804();
	e_entity function_90832db7();
	self.last_claw_time = GetTime();
}

/*
	Name: function_7b7c7bf1
	Namespace: namespace_ef567265
	Checksum: 0xA98D32B8
	Offset: 0x3588
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1118
*/
function function_7b7c7bf1(e_entity)
{
	e_entity notify("hash_9d450cdd");
	e_entity clientfield::set("mechz_ft", 1);
	e_entity.isShootingFlame = 1;
	e_entity thread function_a6480420();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_727ae663
	Namespace: namespace_ef567265
	Checksum: 0xDA49D5DF
	Offset: 0x35F8
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1138
*/
function function_727ae663(e_entity)
{
	e_entity notify("hash_9d450cdd");
	e_entity clientfield::set("mechz_ft", 0);
	e_entity.isShootingFlame = 0;
	e_entity.nextFlameTime = GetTime() + level.mechz_flamethrower_cooldown_time;
	e_entity.stopShootingFlameTime = undefined;
}

/*
	Name: mechz_setup
	Namespace: namespace_ef567265
	Checksum: 0xC09560A9
	Offset: 0x3678
	Size: 0x308
	Parameters: 0
	Flags: None
	Line Number: 1157
*/
function mechz_setup()
{
	self.ignorevortices = 1;
	self.ignore_round_robbin_death = 1;
	self.non_attack_func_takes_attacker = 1;
	self.completed_emerging_into_playable_area = 1;
	self.goalRadius = level.mechz_custom_goalradius;
	self.no_widows_wine = 1;
	self.no_damage_points = 1;
	self.b_ignore_cleanup = 1;
	self.is_mechz = 1;
	self.health = level.mechz_health;
	self.faceplate_health = level.MECHZ_FACEPLATE_HEALTH;
	self.powercap_cover_health = level.MECHZ_POWERCAP_COVER_HEALTH;
	self.powercap_health = level.MECHZ_POWERCAP_HEALTH;
	self.left_knee_armor_health = level.mechz_armor_health;
	self.right_knee_armor_health = level.mechz_armor_health;
	self.left_shoulder_armor_health = level.mechz_armor_health;
	self.right_shoulder_armor_health = level.mechz_armor_health;
	self.var_e35a4f5c = self.health;
	self.heroweapon_kill_power = 10;
	self.team = level.zombie_team;
	self.faceplate_health = level.mechz_health * level.mechz_helmet_health_percentage;
	self.mechz_explosive_dmg_to_cancel_claw = level.mechz_health * level.mechz_explosive_dmg_to_cancel_claw_percentage;
	self.powercap_cover_health = level.mechz_health * level.mechz_powerplant_expose_health_percentage;
	self.powercap_health = level.mechz_health * level.mechz_powerplant_destroyed_health_percentage;
	self.instakill_func = &mechz_instakill_override;
	self.thundergun_fling_func = &function_9bac2f00;
	self.thundergun_knockdown_func = &mechz_thundergun_knockdown;
	self.var_23340a5d = &function_9bac2f00;
	self.var_e1dbd63 = &mechz_thundergun_knockdown;
	self.var_ffbeafc0 = &function_ffbeafc0;
	self.actor_damage_func = &mechz_damage_override;
	self.damage_scoring_function = &mechz_damage_scoring;
	self.mechz_melee_knockdown_function = &function_92c58f12;
	self.zombie_lift_override = &function_271a1353;
	self function_a5d422ea();
	self function_7b541a9b();
	self thread zm_spawner::enemy_death_detection();
	self thread function_810201a6();
	level thread zm_spawner::zombie_death_event(self);
	self clientfield::set("tomb_mech_eye", 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a5d422ea
	Namespace: namespace_ef567265
	Checksum: 0x553EDCAC
	Offset: 0x3988
	Size: 0x2D8
	Parameters: 0
	Flags: None
	Line Number: 1213
*/
function function_a5d422ea()
{
	if(self.classname != "actor_spawner_zm_tomb_mechz")
	{
		return;
	}
	self.gun_attached = 0;
	self.var_3f56e604 = util::spawn_model("tag_origin", self GetTagOrigin("tag_claw"), self GetTagAngles("tag_claw"));
	self.var_3f56e604 notsolid();
	self.var_3f56e604 setcandamage(0);
	self.var_3f56e604.m_claw = util::spawn_model("c_t7_zm_dlchd_origins_mech_claw", self GetTagOrigin("tag_claw"), self GetTagAngles("tag_claw"));
	self.var_3f56e604.m_claw notsolid();
	self.var_3f56e604 LinkTo(self, "tag_claw");
	self.var_3f56e604.m_claw LinkTo(self.var_3f56e604, "tag_origin");
	self.var_3f56e604.m_claw useanimtree(-1);
	self.m_claw_damage_trigger = util::spawn_model("p7_chemistry_kit_large_bottle", self GetTagOrigin("tag_claw"), combineangles(VectorScale((-1, 0, 0), 90), self GetTagAngles("tag_claw")));
	self.m_claw_damage_trigger Hide();
	self.m_claw_damage_trigger setcandamage(1);
	self.m_claw_damage_trigger.health = 10000;
	self.m_claw_damage_trigger EnableLinkTo();
	self.m_claw_damage_trigger LinkTo(self, "tag_claw");
	self thread function_5dfc412a();
	self HidePart("tag_claw");
}

/*
	Name: mechz_spawning_logic
	Namespace: namespace_ef567265
	Checksum: 0x8D7DBFB
	Offset: 0x3C68
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 1248
*/
function mechz_spawning_logic()
{
	level thread enable_mechz_rounds();
	while(1)
	{
		level waittill("spawn_mechz");
		while(level.mechz_left_to_spawn)
		{
			s_loc = function_20278ca2();
			if(!isdefined(s_loc))
			{
				wait(RandomFloatRange(3, 6));
				continue;
			}
			ai = spawn_mechz(s_loc, 1);
			waittillframeend;
			level.mechz_left_to_spawn--;
			if(level.mechz_left_to_spawn == 0)
			{
				level thread response_to_air_raid_siren_vo();
			}
			wait(RandomFloatRange(3, 6));
		}
	}
}

/*
	Name: enable_mechz_rounds
	Namespace: namespace_ef567265
	Checksum: 0x6BBAD221
	Offset: 0x3D68
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1284
*/
function enable_mechz_rounds()
{
	level.mechz_rounds_enabled = 1;
	level flag::init("mechz_round");
	level thread mechz_round_tracker();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: mechz_round_tracker
	Namespace: namespace_ef567265
	Checksum: 0xDED3D9D6
	Offset: 0x3DB8
	Size: 0x320
	Parameters: 0
	Flags: None
	Line Number: 1303
*/
function mechz_round_tracker()
{
	function_da82dcec();
	mech_start_round_num = 12;
	if(isdefined(level.is_forever_solo_game) && level.is_forever_solo_game)
	{
		mech_start_round_num = 12;
	}
	while(level.round_number < mech_start_round_num)
	{
		level waittill("between_round_over");
	}
	level.next_mechz_round = level.round_number;
	while(1)
	{
		if(isdefined(level.dog_rounds_allowed) && level.dog_rounds_allowed && isdefined(level.next_dog_round) && level.next_mechz_round == level.next_dog_round)
		{
			level.next_mechz_round++;
			continue;
		}
		if(level.next_mechz_round <= level.round_number)
		{
			a_zombies = GetAISpeciesArray(level.zombie_team, "all");
			foreach(zombie in a_zombies)
			{
				if(isdefined(zombie.is_mechz) && zombie.is_mechz && isalive(zombie))
				{
					level.next_mechz_round++;
					break;
				}
			}
		}
		else if(level.mechz_left_to_spawn == 0 && level.next_mechz_round <= level.round_number)
		{
			mechz_health_increases();
			level.mechz_left_to_spawn = level.mechz_zombie_per_round;
			mechz_spawning = level.mechz_left_to_spawn;
			wait(RandomFloatRange(10, 15));
			level notify("spawn_mechz", a_zombies);
			if(isdefined(level.is_forever_solo_game) && level.is_forever_solo_game)
			{
				n_round_gap = randomIntRange(level.mechz_min_round_fq_solo, level.mechz_max_round_fq_solo);
				continue;
			}
			n_round_gap = randomIntRange(level.mechz_min_round_fq, level.mechz_max_round_fq);
			level.next_mechz_round = level.round_number + n_round_gap;
			level.mechz_round_count++;
			level.num_mechz_spawned = level.num_mechz_spawned + mechz_spawning;
			level.mechz_zombie_per_round++;
			if(level.mechz_zombie_per_round > 3)
			{
				level.mechz_zombie_per_round = 3;
			}
		}
		level waittill("between_round_over");
	}
}

/*
	Name: spawn_mechz
	Namespace: namespace_ef567265
	Checksum: 0x7047EA57
	Offset: 0x40E0
	Size: 0x320
	Parameters: 2
	Flags: None
	Line Number: 1371
*/
function spawn_mechz(s_location, var_5dd16a06)
{
	if(!(isdefined(var_5dd16a06) && var_5dd16a06))
	{
		var_5dd16a06 = 0;
	}
	if(!isdefined(level.mechz_spawners) || !isdefined(level.mechz_spawners[0]))
	{
		return undefined;
	}
	e_spawner = Array::random(level.mechz_spawners);
	if(isdefined(level.var_bcb154fa))
	{
		[[level.var_bcb154fa]]();
	}
	e_ai = zombie_utility::spawn_zombie(e_spawner, e_spawner.targetname, s_location);
	if(!isdefined(e_ai))
	{
		return undefined;
	}
	var_feba5c63 = PositionQuery_Source_Navigation(s_location.origin, 0, 32, 20, 4);
	if(var_feba5c63.data.size)
	{
		v_ground_position = Array::random(var_feba5c63.data).origin;
	}
	if(!isdefined(v_ground_position))
	{
		v_ground_position = bullettrace(s_location.origin, s_location.origin + VectorScale((0, 0, -1), 256), 0, s_location)["position"];
	}
	if(isdefined(level.var_e28ce515))
	{
		e_ai thread [[level.var_e28ce515]]();
	}
	e_ai ForceTeleport(v_ground_position, zm_utility::flat_angle(VectorToAngles(VectorNormalize(zm_utility::get_closest_player(s_location.origin).origin - s_location.origin))));
	if(isdefined(var_5dd16a06) && var_5dd16a06)
	{
		e_ai thread function_5c36c68c();
		e_ai thread scene::Play("cin_zm_castle_mechz_entrance", e_ai);
		e_ai thread function_95a04f38(v_ground_position);
		e_ai thread function_7ffe730c(v_ground_position);
		continue;
	}
	e_ai.b_flyin_done = 1;
	if(isdefined(level.var_58aeb363))
	{
		e_ai thread [[level.var_58aeb363]](s_location);
	}
	e_ai thread function_a980d56e();
	return e_ai;
}

/*
	Name: function_1ba0237a
	Namespace: namespace_ef567265
	Checksum: 0x2F46BA81
	Offset: 0x4408
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 1432
*/
function function_1ba0237a(e_mechz)
{
	var_67afacd7 = e_mechz.flameTrigger;
	a_zombies = Array::filter(getaiarchetypearray("zombie"), 0, &namespace_57695b4d::function_b804eb62);
	foreach(e_zombie in a_zombies)
	{
		if(e_zombie istouching(var_67afacd7) && e_zombie.var_89d9355e !== 1)
		{
			e_zombie namespace_57695b4d::function_f4defbc2();
		}
	}
}

/*
	Name: function_671deda5
	Namespace: namespace_ef567265
	Checksum: 0xC1B5830C
	Offset: 0x4540
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1455
*/
function function_671deda5()
{
	if(self.classname != "actor_spawner_zm_tomb_mechz")
	{
		return;
	}
	if(isdefined(self.e_grabbed))
	{
		self thread function_9bfd96c8(1);
		return;
	}
}

/*
	Name: mechz_staff_damage_override
	Namespace: namespace_ef567265
	Checksum: 0xA3F57C2F
	Offset: 0x4590
	Size: 0x68
	Parameters: 12
	Flags: None
	Line Number: 1478
*/
function mechz_staff_damage_override(e_inflictor, e_attacker, n_damage, n_flags, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_ed5eb273, var_22b92c8f, n_model_index)
{
	return 0;
	ERROR: Bad function call
}

/*
	Name: function_810201a6
	Namespace: namespace_ef567265
	Checksum: 0xA49790C8
	Offset: 0x4600
	Size: 0x648
	Parameters: 0
	Flags: None
	Line Number: 1494
*/
function function_810201a6()
{
	self waittill("death");
	if(isdefined(self.flameTrigger))
	{
		self.flameTrigger delete();
	}
	if(isPlayer(self.attacker))
	{
		if(!(isdefined(self.deathpoints_already_given) && self.deathpoints_already_given))
		{
			a_players = level.players;
			for(i = 0; i < a_players.size; i++)
			{
				if(zm_utility::is_player_valid(a_players[i]) && !a_players[i] laststand::player_is_in_laststand())
				{
					a_players[i] zm_score::add_to_player_score(level.mechz_points_for_team);
					if(isdefined(self.attacker) && a_players[i] == self.attacker)
					{
						a_players[i] zm_score::add_to_player_score(level.mechz_points_for_killer);
					}
				}
			}
		}
		else if(isdefined(level.hero_power_update))
		{
			[[level.hero_power_update]](self.attacker, self);
		}
		level notify("mechz_killed", self.origin);
		if(level flag::get("zombie_drop_powerups") && (!(isdefined(self.no_powerups) && self.no_powerups)))
		{
			str_type = Array::random(Array("double_points", "insta_kill", "full_ammo", "nuke"));
			zm_powerups::specific_powerup_drop(str_type, self.origin);
		}
	}
	self clientfield::set("tomb_mech_eye", 0);
	if(isdefined(self.has_faceplate) && self.has_faceplate)
	{
		self MechzServerUtils::hide_part("j_faceplate");
		if(self.classname == "actor_spawner_zm_tomb_mechz")
		{
			continue;
		}
		self clientfield::set("mechz_faceplate_detached", 1);
	}
	if(isdefined(self.powercap_covered) && self.powercap_covered)
	{
		self MechzServerUtils::hide_part("tag_powersupply");
		self clientfield::set("mechz_powercap_detached", 1);
	}
	if(self.classname == "actor_spawner_zm_tomb_mechz" && isdefined(self.var_3f56e604) && isdefined(self.var_3f56e604.m_claw))
	{
		self.var_3f56e604 Unlink();
		self.var_3f56e604.m_claw Unlink();
		self.var_3f56e604 delete();
		self.var_3f56e604.m_claw delete();
		self clientfield::set("mechz_claw_detached", 2);
	}
	else if(isdefined(self.gun_attached) && self.gun_attached)
	{
		self MechzServerUtils::hide_part("tag_gun_spin");
		self clientfield::set("mechz_claw_detached", 1);
	}
	if(isdefined(self.m_claw_damage_trigger))
	{
		self.m_claw_damage_trigger Unlink();
		self.m_claw_damage_trigger delete();
	}
	self MechzServerUtils::mechz_turn_off_headlamp(1);
	self waittill("hash_91c4205e");
	PlayFXOnTag(level._effect["mechz_death"], self, "tag_origin");
	self waittill("hash_46c1e51d");
	v_origin = self.origin;
	a_ai = GetAISpeciesArray(level.zombie_team);
	a_ai_kill_zombies = ArraySortClosest(a_ai, v_origin, 18, 0, 200);
	foreach(ai_enemy in a_ai_kill_zombies)
	{
		if(isdefined(ai_enemy))
		{
			if(ai_enemy.archetype === "mechz")
			{
				ai_enemy DoDamage(level.mechz_health * 0.25, v_origin);
				continue;
			}
			ai_enemy DoDamage(ai_enemy.health + 100, v_origin);
		}
		wait(0.05);
	}
	self ghost();
}

/*
	Name: function_ed70c868
	Namespace: namespace_ef567265
	Checksum: 0xF13875C4
	Offset: 0x4C50
	Size: 0x98
	Parameters: 10
	Flags: None
	Line Number: 1595
*/
function function_ed70c868(e_inflictor, e_attacker, var_b4340ddb, var_c3df9be7, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_6f732f99)
{
	if(isdefined(e_attacker) && e_attacker.archetype === "mechz" && str_means_of_death === "MOD_MELEE")
	{
		return 150;
	}
	return -1;
}

/*
	Name: mechz_damage_override
	Namespace: namespace_ef567265
	Checksum: 0x8D814941
	Offset: 0x4CF0
	Size: 0x688
	Parameters: 11
	Flags: None
	Line Number: 1614
*/
function mechz_damage_override(e_inflictor, e_attacker, n_damage, n_flags, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_ed5eb273, var_22b92c8f)
{
	if(isdefined(self.b_flyin_done) && (!(isdefined(self.b_flyin_done) && self.b_flyin_done)))
	{
		return 0;
	}
	var_17bb2876 = level.mechz_armor_info.size + 1;
	var_42770e0b = Int(var_17bb2876 * self.health / level.mechz_health);
	str_bone_name = GetPartName(self.model, var_22b92c8f);
	if(isdefined(e_attacker) && isalive(e_attacker) && isPlayer(e_attacker) && (level.zombie_vars[e_attacker.team]["zombie_insta_kill"] || (isdefined(e_attacker.personal_instakill) && e_attacker.personal_instakill)))
	{
		n_mechz_damage_percent = 1;
		n_mechz_headshot_modifier = 2;
		continue;
	}
	n_mechz_damage_percent = level.mechz_damage_percent;
	n_mechz_headshot_modifier = 1;
	if(isdefined(w_weapon) && w_weapon.weapClass == "spread")
	{
		n_mechz_damage_percent = n_mechz_damage_percent * level.mechz_shotgun_damage_mod;
		n_mechz_headshot_modifier = n_mechz_headshot_modifier * level.mechz_shotgun_damage_mod;
	}
	if(n_damage <= 10)
	{
		n_mechz_damage_percent = 1;
	}
	if(zm_utility::is_explosive_damage(str_means_of_death) || IsSubStr(w_weapon.name, "staff"))
	{
		if(n_mechz_damage_percent < 0.5)
		{
			n_mechz_damage_percent = 0.5;
		}
		if(!(isdefined(self.has_faceplate) && self.has_faceplate) && IsSubStr(w_weapon.name, "staff") && n_mechz_damage_percent < 1)
		{
			n_mechz_damage_percent = 1;
		}
		var_e286aafc = n_damage * n_mechz_damage_percent;
		if(!isdefined(self.explosive_dmg_taken))
		{
			self.explosive_dmg_taken = 0;
		}
		self.explosive_dmg_taken = self.explosive_dmg_taken + var_e286aafc;
		self MechzServerUtils::mechz_track_faceplate_damage(var_e286aafc);
		if(isdefined(level.mechz_explosive_damage_reaction_callback))
		{
			[[level.mechz_explosive_damage_reaction_callback]]();
		}
		e_attacker MechzServerUtils::show_hit_marker();
		continue;
	}
	var_e286aafc = n_damage * n_mechz_damage_percent;
	if(str_hit_loc === "torso_upper")
	{
		if(isdefined(self.has_faceplate) && self.has_faceplate)
		{
			var_47073b82 = self GetTagOrigin("j_faceplate");
			n_dist_sq = DistanceSquared(var_47073b82, v_point);
			if(n_dist_sq <= 144)
			{
				self MechzServerUtils::mechz_track_faceplate_damage(var_e286aafc);
			}
			var_ef69d46a = DistanceSquared(v_point, self GetTagOrigin("tag_headlamp_FX"));
			if(var_ef69d46a <= 9)
			{
				self MechzServerUtils::mechz_turn_off_headlamp(1);
			}
		}
		if(str_bone_name == "tag_powersupply" || str_bone_name == "tag_powersupply_hit")
		{
			if(isdefined(self.powercap_covered) && self.powercap_covered)
			{
				self MechzServerUtils::mechz_track_powercap_cover_damage(var_e286aafc);
			}
			else if(isdefined(self.has_powercap) && self.has_powercap)
			{
				self MechzServerUtils::mechz_track_powercap_damage(var_e286aafc);
			}
		}
	}
	else if(isdefined(self.e_grabbed) && (str_hit_loc === "left_hand" || str_hit_loc === "left_arm_lower" || str_hit_loc === "left_arm_upper"))
	{
		if(isdefined(self.e_grabbed))
		{
			self.show_pain_from_explosive_dmg = 1;
		}
		if(isdefined(level.mechz_left_arm_damage_callback))
		{
			self [[level.mechz_left_arm_damage_callback]]();
		}
	}
	else if(str_hit_loc == "head")
	{
		var_e286aafc = n_damage * n_mechz_headshot_modifier;
	}
	e_attacker MechzServerUtils::show_hit_marker();
	if(!isdefined(w_weapon) || w_weapon.name == "none")
	{
		if(!isPlayer(e_attacker))
		{
			var_e286aafc = 0;
		}
	}
	var_c91fc4e6 = Int(var_17bb2876 * self.health - var_e286aafc / level.mechz_health);
	if(var_42770e0b > var_c91fc4e6)
	{
		while(var_42770e0b > var_c91fc4e6)
		{
			if(var_42770e0b < var_17bb2876)
			{
				self mechz_launch_armor_piece();
			}
			var_42770e0b--;
		}
	}
	return var_e286aafc;
}

/*
	Name: function_9bac2f00
	Namespace: namespace_ef567265
	Checksum: 0x46B2D30A
	Offset: 0x5380
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 1741
*/
function function_9bac2f00(e_player, gib)
{
	self endon("death");
	self function_b8e0ce15(e_player);
	if(!(isdefined(self.stun) && self.stun) && self.stumble_stun_cooldown_time < GetTime())
	{
		self.stun = 1;
	}
}

/*
	Name: mechz_thundergun_knockdown
	Namespace: namespace_ef567265
	Checksum: 0xB265CA95
	Offset: 0x53F0
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 1761
*/
function mechz_thundergun_knockdown(e_player, gib)
{
	self endon("death");
	self function_b8e0ce15(e_player);
	if(!(isdefined(self.stun) && self.stun) && self.stumble_stun_cooldown_time < GetTime())
	{
		self.stun = 1;
	}
}

/*
	Name: function_ffbeafc0
	Namespace: namespace_ef567265
	Checksum: 0x1A2E9D86
	Offset: 0x5460
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1781
*/
function function_ffbeafc0()
{
	if(isdefined(self.customTraverseEndNode) && isdefined(self.customTraverseStartNode))
	{
		return self.customTraverseEndNode.script_noteworthy === "custom_traversal" && self.customTraverseStartNode.script_noteworthy === "custom_traversal";
	}
	return 0;
}

/*
	Name: mechz_instakill_override
	Namespace: namespace_ef567265
	Checksum: 0x3B49EA3C
	Offset: 0x54C0
	Size: 0x20
	Parameters: 3
	Flags: None
	Line Number: 1800
*/
function mechz_instakill_override(e_player, str_mod, str_hit_location)
{
	return 1;
}

/*
	Name: mechz_damage_scoring
	Namespace: namespace_ef567265
	Checksum: 0x6ABB51B0
	Offset: 0x54E8
	Size: 0x110
	Parameters: 12
	Flags: None
	Line Number: 1815
*/
function mechz_damage_scoring(inflictor, attacker, damage, dFlags, mod, weapon, point, dir, hitLoc, offsetTime, boneIndex, modelIndex)
{
	if(isdefined(attacker) && isPlayer(attacker))
	{
		if(zm_spawner::player_using_hi_score_weapon(attacker))
		{
			damage_type = "damage";
			continue;
		}
		damage_type = "damage_light";
		if(!(isdefined(self.no_damage_points) && self.no_damage_points))
		{
			attacker zm_score::player_add_points(damage_type, mod, hitLoc, self.isdog, self.team, weapon);
		}
	}
}

/*
	Name: function_da82dcec
	Namespace: namespace_ef567265
	Checksum: 0x40D1CF11
	Offset: 0x5600
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1842
*/
function function_da82dcec()
{
	while(!flag::exists("initial_blackscreen_passed"))
	{
		wait(0.05);
	}
	if(!flag::get("initial_blackscreen_passed"))
	{
		level flag::wait_till("initial_blackscreen_passed");
	}
}

/*
	Name: mechz_setup_armor_pieces
	Namespace: namespace_ef567265
	Checksum: 0x1FD5F2D8
	Offset: 0x5670
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 1864
*/
function mechz_setup_armor_pieces()
{
	level.mechz_armor_info = [];
	level.mechz_armor_info[0] = spawnstruct();
	level.mechz_armor_info[0].model = "c_zom_mech_armor_knee_left";
	level.mechz_armor_info[0].tag = "j_knee_attach_le";
	level.mechz_armor_info[0].clientfield = "mechz_lknee_armor_detached";
	level.mechz_armor_info[1] = spawnstruct();
	level.mechz_armor_info[1].model = "c_zom_mech_armor_knee_right";
	level.mechz_armor_info[1].tag = "j_knee_attach_ri";
	level.mechz_armor_info[1].clientfield = "mechz_rknee_armor_detached";
	level.mechz_armor_info[2] = spawnstruct();
	level.mechz_armor_info[2].model = "c_zom_mech_armor_shoulder_left";
	level.mechz_armor_info[2].tag = "j_shoulderarmor_le";
	level.mechz_armor_info[2].clientfield = "mechz_lshoulder_armor_detached";
	level.mechz_armor_info[3] = spawnstruct();
	level.mechz_armor_info[3].model = "c_zom_mech_armor_shoulder_right";
	level.mechz_armor_info[3].tag = "j_shoulderarmor_ri";
	level.mechz_armor_info[3].clientfield = "mechz_rshoulder_armor_detached";
}

/*
	Name: function_7b541a9b
	Namespace: namespace_ef567265
	Checksum: 0x7BA87D39
	Offset: 0x5880
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 1895
*/
function function_7b541a9b()
{
	self.var_ba00c27 = [];
	foreach(var_d67b360d in level.mechz_armor_info)
	{
		armor_state = spawnstruct();
		armor_state.index = self.var_ba00c27.size;
		armor_state.tag = var_d67b360d.tag;
		armor_state.clientfield = var_d67b360d.clientfield;
		if(!isdefined(self.var_ba00c27))
		{
			self.var_ba00c27 = [];
		}
		else if(!IsArray(self.var_ba00c27))
		{
			self.var_ba00c27 = Array(self.var_ba00c27);
		}
		self.var_ba00c27[self.var_ba00c27.size] = armor_state;
	}
	self.var_ba00c27 = Array::randomize(self.var_ba00c27);
}

/*
	Name: mechz_launch_armor_piece
	Namespace: namespace_ef567265
	Checksum: 0xAE6AF4DA
	Offset: 0x5A08
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 1927
*/
function mechz_launch_armor_piece()
{
	if(!isdefined(self.next_armor_piece))
	{
		self.next_armor_piece = 0;
	}
	if(!isdefined(self.var_ba00c27) || self.next_armor_piece >= self.var_ba00c27.size)
	{
		return;
	}
	self MechzServerUtils::hide_part(self.var_ba00c27[self.next_armor_piece].tag);
	self clientfield::set(self.var_ba00c27[self.next_armor_piece].clientfield, 1);
	self.next_armor_piece++;
}

/*
	Name: function_456e76fa
	Namespace: namespace_ef567265
	Checksum: 0x7BFBD7AF
	Offset: 0x5AC8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 1952
*/
function function_456e76fa(e_entity)
{
	e_entity thread function_31c4b972();
	level flag::set("mechz_launching_claw");
}

/*
	Name: player_can_be_grabbed
	Namespace: namespace_ef567265
	Checksum: 0x8C36FE3A
	Offset: 0x5B18
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1968
*/
function player_can_be_grabbed()
{
	if(self GetStance() == "prone")
	{
		return 0;
	}
	if(!zm_utility::is_player_valid(self))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_31c4b972
	Namespace: namespace_ef567265
	Checksum: 0xD8B3719B
	Offset: 0x5B70
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1991
*/
function function_31c4b972()
{
	self endon("claw_complete");
	self util::waittill_either("death", "kill_claw");
	self function_90832db7();
}

/*
	Name: function_672f9804
	Namespace: namespace_ef567265
	Checksum: 0x268A89B2
	Offset: 0x5BC8
	Size: 0xC98
	Parameters: 0
	Flags: None
	Line Number: 2008
*/
function function_672f9804()
{
	self endon("death");
	self endon("kill_claw");
	if(!isdefined(self.favoriteenemy))
	{
		return;
	}
	self.var_3f56e604.m_claw thread animation::Play("ai_zombie_mech_grapple_arm_open_idle", undefined, undefined, 1, 0);
	self.var_3f56e604 Unlink();
	self.var_3f56e604.angles = VectorToAngles(self.origin - self.favoriteenemy.origin);
	self.var_3f56e604.fx_ent = util::spawn_model("tag_origin", self.var_3f56e604.m_claw GetTagOrigin("tag_claw"), self.var_3f56e604.m_claw GetTagAngles("tag_claw"));
	self.var_3f56e604.fx_ent setcandamage(0);
	self.var_3f56e604.fx_ent notsolid();
	self.var_3f56e604.fx_ent LinkTo(self.var_3f56e604.m_claw, "tag_claw");
	self.var_3f56e604.fx_ent clientfield::set("mechz_claw", 1);
	self clientfield::set("mechz_wpn_source", 1);
	v_enemy_origin = self.favoriteenemy.origin + VectorScale((0, 0, 1), 36);
	n_dist = Distance(self GetTagOrigin("tag_claw"), v_enemy_origin);
	self playsound("zmb_ai_mechz_claw_fire");
	self.var_3f56e604 moveto(v_enemy_origin, n_dist / 1200);
	self.var_3f56e604 thread function_2998f2a1();
	self.var_3f56e604 PlayLoopSound("zmb_ai_mechz_claw_loop_out", 0.1);
	self.e_grabbed = undefined;
	do
	{
		a_players = GetPlayers();
		foreach(e_player in a_players)
		{
			if(!zm_utility::is_player_valid(e_player, 1, 1) || !e_player player_can_be_grabbed())
			{
				continue;
			}
			if(DistanceSquared(e_player.origin + VectorScale((0, 0, 1), 36), self.var_3f56e604.origin) < 2304)
			{
				var_b6504aeb = self.origin + VectorScale((0, 0, 1), 65);
				a_trace = PhysicsTrace(var_b6504aeb, e_player.origin + VectorScale((0, 0, 1), 30), (-15, -15, -20), (15, 15, 40), self, 9);
				if(a_trace["fraction"] == 1 || !isdefined(a_trace["entity"]) || a_trace["entity"] != e_player)
				{
					continue;
				}
				if(isdefined(e_player.hasRiotShield) && e_player.hasRiotShield && (isdefined(e_player.hasRiotShieldEquipped) && e_player.hasRiotShieldEquipped))
				{
					e_player riotshield::player_damage_shield(level.zombie_vars["riotshield_hit_points"] - 1, 1);
					wait(1);
					e_player riotshield::player_damage_shield(1, 1);
					continue;
				}
				self.e_grabbed = e_player;
				self.e_grabbed clientfield::set_to_player("mechz_grab", 1);
				self.e_grabbed PlayerLinkToDelta(self.var_3f56e604.m_claw, "tag_attach_player");
				self.e_grabbed SetPlayerAngles(VectorToAngles(self.origin - self.e_grabbed.origin));
				self.e_grabbed playsound("zmb_ai_mechz_claw_grab");
				self.e_grabbed SetStance("stand");
				self.e_grabbed AllowCrouch(0);
				self.e_grabbed allowprone(0);
				self.e_grabbed thread function_5f5eaf3a(self);
				if(!level flag::get("mechz_claw_move_complete"))
				{
					self.var_3f56e604 moveto(self.var_3f56e604.origin, 0.05);
					break;
				}
			}
		}
		wait(0.05);
	}
	while(!(!level flag::get("mechz_claw_move_complete") && !isdefined(self.e_grabbed)));
	if(!isdefined(self.e_grabbed))
	{
		foreach(ai_zombie in zombie_utility::get_round_enemy_array())
		{
			if(!isalive(ai_zombie) || (isdefined(ai_zombie.is_giant_robot) && ai_zombie.is_giant_robot) || (isdefined(ai_zombie.is_mechz) && ai_zombie.is_mechz))
			{
				continue;
			}
			if(DistanceSquared(ai_zombie.origin + VectorScale((0, 0, 1), 36), self.var_3f56e604.origin) < 2304)
			{
				self.e_grabbed = ai_zombie;
				self.e_grabbed LinkTo(self.var_3f56e604.m_claw, "tag_attach_player", (0, 0, 0));
				self.e_grabbed.mechz_grabbed_by = self;
				break;
			}
		}
	}
	self.var_3f56e604.m_claw StopAnimScripted(0.2);
	self.var_3f56e604.m_claw thread animation::Play("ai_zombie_mech_grapple_arm_closed_idle", undefined, undefined, 1, 0.2);
	wait(0.5);
	self function_7c33f4fb();
	if(isdefined(self.e_grabbed))
	{
		continue;
	}
	self.var_3f56e604 moveto(self GetTagOrigin("tag_claw"), max(0.05, n_dist / 1000));
	self.var_3f56e604 PlayLoopSound("zmb_ai_mechz_claw_loop_in", 0.1);
	self.var_3f56e604 waittill("movedone");
	v_claw_angles = self GetTagAngles("tag_claw");
	self.var_3f56e604 playsound("zmb_ai_mechz_claw_back");
	self.var_3f56e604 StopLoopSound(1);
	if(zm_audio::sndIsNetworkSafe())
	{
		self playsound("zmb_ai_mechz_vox_angry");
	}
	self.var_3f56e604.origin = self GetTagOrigin("tag_claw");
	self.var_3f56e604.angles = self GetTagAngles("tag_claw");
	self.var_3f56e604 LinkTo(self, "tag_claw", (0, 0, 0));
	self.var_3f56e604.fx_ent delete();
	self.var_3f56e604.fx_ent = undefined;
	self clientfield::set("mechz_wpn_source", 0);
	level flag::clear("mechz_launching_claw");
	if(isdefined(self.e_grabbed))
	{
		if(isPlayer(self.e_grabbed) && zm_utility::is_player_valid(self.e_grabbed))
		{
			self.e_grabbed thread mechz_unlink_on_laststand(self);
		}
		else if(isai(self.e_grabbed))
		{
			self.e_grabbed thread function_860f0461(self);
		}
		self thread function_4c31280d(self.e_grabbed);
		self AnimScripted("flamethrower_anim", self.origin, self.angles, "ai_zombie_mech_ft_burn_player");
		self zombie_shared::DoNoteTracks("flamethrower_anim");
	}
	level flag::clear("mechz_claw_move_complete");
}

/*
	Name: function_90832db7
	Namespace: namespace_ef567265
	Checksum: 0x2E325554
	Offset: 0x6868
	Size: 0x2D8
	Parameters: 0
	Flags: None
	Line Number: 2144
*/
function function_90832db7()
{
	self function_9bfd96c8();
	if(isdefined(self.var_3f56e604))
	{
		self.var_3f56e604.m_claw StopAnimScripted(0.2);
		if(isdefined(self.var_3f56e604.fx_ent))
		{
			self.var_3f56e604.fx_ent delete();
			self.var_3f56e604.fx_ent = undefined;
		}
		if(!(isdefined(self.has_powercap) && self.has_powercap))
		{
			self function_4208b4ec();
			level flag::clear("mechz_launching_claw");
		}
		else if(!self.var_3f56e604 islinkedto(self))
		{
			self.var_3f56e604 moveto(self GetTagOrigin("tag_claw"), max(0.05, Distance(self.var_3f56e604.origin, self GetTagOrigin("tag_claw")) / 1000));
			self.var_3f56e604 PlayLoopSound("zmb_ai_mechz_claw_loop_in", 0.1);
			self.var_3f56e604 waittill("movedone");
			self.var_3f56e604 playsound("zmb_ai_mechz_claw_back");
			self.var_3f56e604 StopLoopSound(1);
			self.var_3f56e604.origin = self GetTagOrigin("tag_claw");
			self.var_3f56e604.angles = self GetTagAngles("tag_claw");
			self.var_3f56e604.m_claw StopAnimScripted(0.2);
			self.var_3f56e604 LinkTo(self, "tag_claw", (0, 0, 0));
		}
	}
	self notify("claw_complete");
	self.var_b4534ae0 = 0;
}

/*
	Name: function_9bfd96c8
	Namespace: namespace_ef567265
	Checksum: 0x7D1EE45F
	Offset: 0x6B48
	Size: 0x1E0
	Parameters: 1
	Flags: None
	Line Number: 2187
*/
function function_9bfd96c8(var_f44713ee)
{
	self.explosive_dmg_taken_on_grab_start = undefined;
	if(isdefined(self.e_grabbed))
	{
		if(isPlayer(self.e_grabbed))
		{
			self.e_grabbed clientfield::set_to_player("mechz_grab", 0);
			self.e_grabbed AllowCrouch(1);
			self.e_grabbed allowprone(1);
		}
		if(!isdefined(self.e_grabbed._fall_down_anchor))
		{
			self.e_grabbed Unlink();
			self.e_grabbed SetOrigin(playerphysicstrace(self.e_grabbed.origin + VectorScale((0, 0, 1), 70), self.e_grabbed.origin + VectorScale((0, 0, -1), 500)) + VectorScale((0, 0, 1), 24));
		}
		self.e_grabbed = undefined;
		if(isdefined(var_f44713ee) && var_f44713ee)
		{
			self.var_3f56e604.m_claw thread animation::Play("ai_zombie_mech_grapple_arm_open_idle", undefined, undefined, 1, 0.2);
		}
		if(self IsPlayingAnimScripted())
		{
			self function_727ae663(self);
			self StopAnimScripted();
		}
	}
}

/*
	Name: function_4208b4ec
	Namespace: namespace_ef567265
	Checksum: 0xD96D80A6
	Offset: 0x6D30
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 2226
*/
function function_4208b4ec()
{
	if(isdefined(self.var_3f56e604))
	{
		self.var_3f56e604.m_claw thread animation::Play("ai_zombie_mech_grapple_arm_open_idle", undefined, undefined, 1, 0.2);
		if(isdefined(self.var_3f56e604.fx_ent))
		{
			self.var_3f56e604.fx_ent delete();
		}
		self.var_3f56e604.m_claw Unlink();
		self.var_3f56e604 Unlink();
		self.var_3f56e604.m_claw physicslaunch(self.var_3f56e604.m_claw.origin, (0, 0, -1));
		self.var_3f56e604 thread function_36db86b();
		self.var_3f56e604.m_claw thread function_36db86b();
		self.var_3f56e604 = undefined;
	}
	if(isdefined(self.m_claw_damage_trigger))
	{
		self.m_claw_damage_trigger Unlink();
		self.m_claw_damage_trigger delete();
		self.m_claw_damage_trigger = undefined;
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_36db86b
	Namespace: namespace_ef567265
	Checksum: 0x68D6272D
	Offset: 0x6EC0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 2262
*/
function function_36db86b()
{
	wait(30);
	self delete();
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: mechz_jump_vo
	Namespace: namespace_ef567265
	Checksum: 0x82A4FA66
	Offset: 0x6EE8
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 2281
*/
function mechz_jump_vo()
{
	a_players = GetPlayers();
	foreach(e_player in a_players)
	{
		if(DistanceSquared(self.origin, e_player.origin) < 1000000)
		{
			if(e_player zm_utility::is_player_looking_at(self.origin + VectorScale((0, 0, 1), 60), 0.5))
			{
				if(!(isdefined(e_player.dontspeak) && e_player.dontspeak))
				{
					e_player util::delay(3, undefined, &zm_audio::create_and_play_dialog, "general", "rspnd_mech_jump");
					return;
				}
			}
		}
	}
}

/*
	Name: function_4c31280d
	Namespace: namespace_ef567265
	Checksum: 0x3376BC34
	Offset: 0x7048
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 2310
*/
function function_4c31280d(e_player)
{
	e_player endon("death");
	e_player endon("disconnect");
	self endon("death");
	self endon("claw_complete");
	self endon("kill_claw");
	self thread function_b784353e(e_player);
	e_player thread function_111027fa(self);
	self.var_3f56e604.m_claw setcandamage(1);
	while(isdefined(self.e_grabbed))
	{
		self.var_3f56e604.m_claw waittill("damage", n_amount, e_inflictor, v_direction, v_point, str_mod, str_tag_name, str_model_name, str_part_name, w_weapon, n_flags);
		if(zm_utility::is_player_valid(e_inflictor))
		{
			self DoDamage(1, e_inflictor.origin, e_inflictor, e_inflictor, "left_hand", str_mod);
			self.var_3f56e604.m_claw setcandamage(0);
			self notify("claw_damaged");
			break;
		}
	}
}

/*
	Name: function_b784353e
	Namespace: namespace_ef567265
	Checksum: 0x22DED0F1
	Offset: 0x7218
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 2343
*/
function function_b784353e(e_player)
{
	self endon("claw_damaged");
	e_player endon("death");
	e_player endon("disconnect");
	self util::waittill_any("death", "claw_complete", "kill_claw");
	if(isdefined(self) && isdefined(self.var_3f56e604) && isdefined(self.var_3f56e604.m_claw))
	{
		self.var_3f56e604.m_claw setcandamage(0);
	}
}

/*
	Name: function_111027fa
	Namespace: namespace_ef567265
	Checksum: 0xFF624E5D
	Offset: 0x72C8
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 2365
*/
function function_111027fa(e_mechz)
{
	e_mechz endon("claw_damaged");
	e_mechz endon("death");
	e_mechz endon("claw_complete");
	e_mechz endon("kill_claw");
	self util::waittill_any("death", "disconnect");
	if(isdefined(e_mechz) && isdefined(e_mechz.var_3f56e604) && isdefined(e_mechz.var_3f56e604.m_claw))
	{
		e_mechz.var_3f56e604.m_claw setcandamage(0);
	}
}

/*
	Name: mechz_unlink_on_laststand
	Namespace: namespace_ef567265
	Checksum: 0x744BE220
	Offset: 0x7398
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 2388
*/
function mechz_unlink_on_laststand(e_mechz)
{
	self endon("death");
	self endon("disconnect");
	e_mechz endon("death");
	e_mechz endon("claw_complete");
	e_mechz endon("kill_claw");
	while(1)
	{
		if(isdefined(self) && self laststand::player_is_in_laststand())
		{
			e_mechz thread function_9bfd96c8();
			return;
		}
		wait(0.05);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_860f0461
	Namespace: namespace_ef567265
	Checksum: 0x5715FA40
	Offset: 0x7438
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 2418
*/
function function_860f0461(e_mechz)
{
	e_mechz waittillmatch("flamethrower_anim");
	if(isalive(self))
	{
		self DoDamage(self.health, self.origin, self);
		self zombie_utility::gib_random_parts();
		GibServerUtils::Annihilate(self);
	}
}

/*
	Name: function_2998f2a1
	Namespace: namespace_ef567265
	Checksum: 0xDCB9BF
	Offset: 0x74D0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 2439
*/
function function_2998f2a1()
{
	self waittill("movedone");
	wait(0.05);
	level flag::set("mechz_claw_move_complete");
}

/*
	Name: function_5f5eaf3a
	Namespace: namespace_ef567265
	Checksum: 0x79D9CA91
	Offset: 0x7510
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 2456
*/
function function_5f5eaf3a(e_mechz)
{
	self endon("disconnect");
	self zm_audio::create_and_play_dialog("general", "mech_grab");
	while(isdefined(self) && (isdefined(self.isSpeaking) && self.isSpeaking))
	{
		wait(0.1);
	}
	wait(1);
	if(isalive(e_mechz) && isdefined(e_mechz.e_grabbed))
	{
		e_mechz thread play_shoot_arm_hint_vo();
	}
}

/*
	Name: play_shoot_arm_hint_vo
	Namespace: namespace_ef567265
	Checksum: 0xDA4BECA
	Offset: 0x75C8
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 2481
*/
function play_shoot_arm_hint_vo()
{
	self endon("death");
	while(1)
	{
		if(!isdefined(self.e_grabbed))
		{
			return;
		}
		a_players = GetPlayers();
		foreach(e_player in a_players)
		{
			if(e_player == self.e_grabbed)
			{
				continue;
			}
			if(DistanceSquared(self.origin, e_player.origin) < 1000000)
			{
				if(e_player util::is_player_looking_at(self.origin + VectorScale((0, 0, 1), 60), 0.75))
				{
					if(!(isdefined(e_player.dontspeak) && e_player.dontspeak))
					{
						e_player zm_audio::create_and_play_dialog("general", "shoot_mech_arm");
						return;
					}
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_7c33f4fb
	Namespace: namespace_ef567265
	Checksum: 0xDB2DE876
	Offset: 0x7758
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 2523
*/
function function_7c33f4fb()
{
	if(!isdefined(self.explosive_dmg_taken))
	{
		self.explosive_dmg_taken = 0;
	}
	self.explosive_dmg_taken_on_grab_start = self.explosive_dmg_taken;
}

/*
	Name: function_a6480420
	Namespace: namespace_ef567265
	Checksum: 0x5B3BBD37
	Offset: 0x7790
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 2542
*/
function function_a6480420()
{
	self endon("death");
	self endon("hash_9d450cdd");
	while(1)
	{
		a_players = GetPlayers();
		foreach(e_player in a_players)
		{
			if(!(isdefined(e_player.is_burning) && e_player.is_burning))
			{
				if(e_player istouching(self.flameTrigger))
				{
					e_player thread MechzBehavior::playerFlameDamage(self);
				}
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_93a1d563
	Namespace: namespace_ef567265
	Checksum: 0xD3B3AEFF
	Offset: 0x78B0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 2573
*/
function function_93a1d563()
{
	if(!(isdefined(self.stun) && self.stun) && self.stumble_stun_cooldown_time < GetTime())
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_b8e0ce15
	Namespace: namespace_ef567265
	Checksum: 0x3FC0E84C
	Offset: 0x78F0
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 2592
*/
function function_b8e0ce15(e_player)
{
	var_a6efc579 = level.mechz_health;
	if(isdefined(level.var_9f43bbe2))
	{
		var_a6efc579 = math::clamp(var_a6efc579, 0, level.var_9f43bbe2);
	}
	n_damage = var_a6efc579 * 0.25 / 0.2;
	self DoDamage(n_damage, self GetCentroid(), e_player, e_player, undefined, "MOD_PROJECTILE_SPLASH", 0, GetWeapon("thundergun"));
}

/*
	Name: function_5dfc412a
	Namespace: namespace_ef567265
	Checksum: 0x3F011846
	Offset: 0x79C8
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 2613
*/
function function_5dfc412a()
{
	self endon("death");
	self.m_claw_damage_trigger endon("death");
	while(1)
	{
		self.m_claw_damage_trigger waittill("damage", amount, inflictor, direction, point, type, tagName, modelName, partName, weaponName, iDFlags);
		self.m_claw_damage_trigger.health = 10000;
		if(self.var_3f56e604 islinkedto(self))
		{
			continue;
		}
		if(zm_utility::is_player_valid(inflictor))
		{
			self DoDamage(1, inflictor.origin, inflictor, inflictor, "left_hand", type);
			self.var_3f56e604.m_claw setcandamage(0);
			self notify("claw_damaged");
		}
	}
}

/*
	Name: function_5c36c68c
	Namespace: namespace_ef567265
	Checksum: 0xB8D072BA
	Offset: 0x7B40
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 2644
*/
function function_5c36c68c()
{
	self endon("death");
	self.b_flyin_done = 0;
	self.bgbIgnoreFearInHeadlights = 1;
	self util::waittill_any("mechz_flyin_done", "scene_done");
	self.b_flyin_done = 1;
	self.bgbIgnoreFearInHeadlights = 0;
}

/*
	Name: function_95a04f38
	Namespace: namespace_ef567265
	Checksum: 0xDEED11A
	Offset: 0x7BB0
	Size: 0x318
	Parameters: 1
	Flags: None
	Line Number: 2664
*/
function function_95a04f38(var_a91f9b3a)
{
	self endon("death");
	var_356c1d0a = 2304;
	var_9327b879 = 2250000;
	self waittill("hash_f93797a6");
	a_zombies = getaiarchetypearray("zombie");
	foreach(e_zombie in a_zombies)
	{
		n_distance_sq = DistanceSquared(e_zombie.origin, var_a91f9b3a);
		if(n_distance_sq <= var_356c1d0a)
		{
			e_zombie kill();
		}
	}
	a_players = GetPlayers();
	foreach(e_player in a_players)
	{
		n_distance_sq = DistanceSquared(e_player.origin, var_a91f9b3a);
		if(n_distance_sq <= var_356c1d0a)
		{
			e_player DoDamage(100, var_a91f9b3a, self, self);
		}
		n_scale = var_9327b879 - n_distance_sq / var_9327b879;
		if(n_scale <= 0 || n_scale >= 1)
		{
			return;
		}
		var_4098ffc8 = n_scale * 0.15;
		Earthquake(var_4098ffc8, 0.1, var_a91f9b3a, 1500);
		if(n_scale >= 0.66)
		{
			e_player PlayRumbleOnEntity("shotgun_fire");
			continue;
		}
		if(n_scale >= 0.33)
		{
			e_player PlayRumbleOnEntity("damage_heavy");
			continue;
		}
		e_player PlayRumbleOnEntity("reload_small");
	}
}

/*
	Name: function_7ffe730c
	Namespace: namespace_ef567265
	Checksum: 0x67ABE30E
	Offset: 0x7ED0
	Size: 0x2A8
	Parameters: 1
	Flags: None
	Line Number: 2718
*/
function function_7ffe730c(var_a91f9b3a)
{
	self endon("death");
	self endon("hash_f93797a6");
	self waittill("hash_3d18ed4f");
	var_777eb205 = 9216;
	while(1)
	{
		a_players = GetPlayers();
		foreach(e_player in a_players)
		{
			n_distance_sq = DistanceSquared(e_player.origin, var_a91f9b3a);
			if(n_distance_sq <= var_777eb205)
			{
				if(!(isdefined(e_player.is_burning) && e_player.is_burning) && zombie_utility::is_player_valid(e_player, 0))
				{
					e_player function_b852ea97(self);
				}
			}
		}
		a_zombies = Array::filter(getaiarchetypearray("zombie"), 0, &namespace_57695b4d::function_b804eb62);
		foreach(e_zombie in a_zombies)
		{
			n_distance_sq = DistanceSquared(e_zombie.origin, var_a91f9b3a);
			if(n_distance_sq <= var_777eb205 && self.var_89d9355e !== 1)
			{
				self function_3efae612(e_zombie);
				e_zombie namespace_57695b4d::function_f4defbc2();
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_20278ca2
	Namespace: namespace_ef567265
	Checksum: 0xC00075BE
	Offset: 0x8180
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 2762
*/
function function_20278ca2()
{
	var_6b26ab7d = Array::randomize(level.mechz_locations);
	for(i = 0; i < var_6b26ab7d.size; i++)
	{
		if(isdefined(var_6b26ab7d[i].zone_name) && level.zones[var_6b26ab7d[i].zone_name].is_occupied)
		{
			return var_6b26ab7d[i];
		}
	}
	for(i = 0; i < var_6b26ab7d.size; i++)
	{
		if(isdefined(var_6b26ab7d[i].zone_name) && level.zones[var_6b26ab7d[i].zone_name].is_active)
		{
			return var_6b26ab7d[i];
		}
	}
	return undefined;
}

/*
	Name: function_b852ea97
	Namespace: namespace_ef567265
	Checksum: 0x6684B87F
	Offset: 0x82A0
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 2792
*/
function function_b852ea97(e_mechz)
{
	if(!(isdefined(self.is_burning) && self.is_burning) && zombie_utility::is_player_valid(self, 1))
	{
		self.is_burning = 1;
		if(!self hasPerk("specialty_armorvest"))
		{
			self burnplayer::SetPlayerBurning(1.5, 0.5, 30, e_mechz, undefined);
			continue;
		}
		self burnplayer::SetPlayerBurning(1.5, 0.5, 20, e_mechz, undefined);
		wait(1.5);
		self.is_burning = 0;
	}
}

/*
	Name: function_3efae612
	Namespace: namespace_ef567265
	Checksum: 0x537FF0B
	Offset: 0x8388
	Size: 0x2A8
	Parameters: 1
	Flags: None
	Line Number: 2818
*/
function function_3efae612(e_zombie)
{
	e_zombie.KNOCKDOWN = 1;
	e_zombie.knockdown_type = "knockdown_shoved";
	var_6f70d714 = self.origin - e_zombie.origin;
	var_62ab33fd = VectorNormalize((var_6f70d714[0], var_6f70d714[1], 0));
	v_zombie_forward = AnglesToForward(e_zombie.angles);
	v_zombie_forward_2d = VectorNormalize((v_zombie_forward[0], v_zombie_forward[1], 0));
	v_zombie_right = AnglesToRight(e_zombie.angles);
	v_zombie_right_2d = VectorNormalize((v_zombie_right[0], v_zombie_right[1], 0));
	n_dot = VectorDot(var_62ab33fd, v_zombie_right_2d);
	if(n_dot >= 0.5)
	{
		e_zombie.knockdown_direction = "front";
		e_zombie.getup_direction = "getup_back";
	}
	else if(n_dot < 0.5 && n_dot > -0.5)
	{
		n_dot = VectorDot(var_62ab33fd, v_zombie_right_2d);
		if(n_dot > 0)
		{
			e_zombie.knockdown_direction = "right";
			if(math::cointoss())
			{
				e_zombie.getup_direction = "getup_back";
				continue;
			}
			e_zombie.getup_direction = "getup_belly";
			continue;
		}
		e_zombie.knockdown_direction = "left";
		e_zombie.getup_direction = "getup_belly";
		continue;
	}
	e_zombie.knockdown_direction = "back";
	e_zombie.getup_direction = "getup_belly";
}

/*
	Name: function_92c58f12
	Namespace: namespace_ef567265
	Checksum: 0x524711F9
	Offset: 0x8638
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 2866
*/
function function_92c58f12()
{
	a_zombies = getaiarchetypearray("zombie");
	foreach(e_zombie in a_zombies)
	{
		n_distance_sq = DistanceSquared(self.origin, e_zombie.origin);
		if(e_zombie function_f2b52d85(self) && n_distance_sq <= 12544)
		{
			self function_3efae612(e_zombie);
		}
	}
}

/*
	Name: function_f2b52d85
	Namespace: namespace_ef567265
	Checksum: 0xCF843273
	Offset: 0x8750
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 2889
*/
function function_f2b52d85(e_mechz)
{
	v_origin = self.origin;
	var_516bd8ad = AnglesToForward(e_mechz.angles);
	var_68a8c007 = v_origin - e_mechz.origin;
	var_101ccef7 = (var_68a8c007[0], var_68a8c007[1], 0);
	var_4c0b083d = (var_516bd8ad[0], var_516bd8ad[1], 0);
	var_101ccef7 = VectorNormalize(var_101ccef7);
	var_4c0b083d = VectorNormalize(var_4c0b083d);
	var_64230ae0 = VectorDot(var_4c0b083d, var_101ccef7);
	if(var_64230ae0 < 0.7)
	{
		return 0;
	}
	var_16a1b9fb = VectorToAngles(var_68a8c007);
	if(Abs(AngleClamp180(var_16a1b9fb[0])) > 45)
	{
		return 0;
	}
	return 1;
}

/*
	Name: mechz_health_increases
	Namespace: namespace_ef567265
	Checksum: 0xFC87EC47
	Offset: 0x88E0
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 2921
*/
function mechz_health_increases()
{
	if(!isdefined(level.mechz_last_spawn_round) || level.round_number > level.mechz_last_spawn_round)
	{
		a_players = GetPlayers();
		n_player_modifier = 1;
		if(a_players.size > 1)
		{
			n_player_modifier = a_players.size * 0.75;
		}
		level.mechz_health = Int(n_player_modifier * level.mechz_base_health + level.mechz_health_increase * level.mechz_round_count);
		if(level.mechz_health >= 42500 * n_player_modifier)
		{
			level.mechz_health = Int(42500 * n_player_modifier);
		}
		level.mechz_last_spawn_round = level.round_number;
	}
}

/*
	Name: function_a980d56e
	Namespace: namespace_ef567265
	Checksum: 0x4BE02DB4
	Offset: 0x89F8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 2950
*/
function function_a980d56e()
{
	self endon("death");
	while(1)
	{
		wait(randomIntRange(9, 14));
		self playsound("zmb_ai_mechz_vox_ambient");
	}
}

/*
	Name: response_to_air_raid_siren_vo
	Namespace: namespace_ef567265
	Checksum: 0x3D651E50
	Offset: 0x8A58
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 2970
*/
function response_to_air_raid_siren_vo()
{
	wait(3);
	a_players = GetPlayers();
	if(a_players.size == 0)
	{
		return;
	}
	a_players = Array::randomize(a_players);
	foreach(e_player in a_players)
	{
		if(zombie_utility::is_player_valid(e_player))
		{
			if(!(isdefined(e_player.dontspeak) && e_player.dontspeak))
			{
				if(!isdefined(level.air_raid_siren_count))
				{
					e_player zm_audio::create_and_play_dialog("general", "siren_1st_time");
					level.air_raid_siren_count = 1;
					while(isdefined(e_player) && (isdefined(e_player.isSpeaking) && e_player.isSpeaking))
					{
						wait(0.1);
					}
					level thread start_see_mech_zombie_vo();
					continue;
				}
				if(level.mechz_zombie_per_round == 1)
				{
					e_player zm_audio::create_and_play_dialog("general", "siren_generic");
					continue;
				}
				e_player zm_audio::create_and_play_dialog("general", "multiple_mechs");
			}
		}
	}
}

/*
	Name: start_see_mech_zombie_vo
	Namespace: namespace_ef567265
	Checksum: 0x34156B22
	Offset: 0x8C50
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 3017
*/
function start_see_mech_zombie_vo()
{
	wait(1);
	a_zombies = GetAISpeciesArray(level.zombie_team, "all");
	foreach(e_zombie in a_zombies)
	{
		if(isdefined(e_zombie.is_mechz) && e_zombie.is_mechz)
		{
			var_4097245d = e_zombie;
		}
	}
	a_players = GetPlayers();
	if(a_players.size == 0)
	{
		return;
	}
	if(isalive(var_4097245d))
	{
		foreach(e_player in a_players)
		{
			e_player thread player_looking_at_mechz_watcher(var_4097245d);
		}
		return;
	}
}

/*
	Name: player_looking_at_mechz_watcher
	Namespace: namespace_ef567265
	Checksum: 0x9C15EEAB
	Offset: 0x8E10
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 3053
*/
function player_looking_at_mechz_watcher(var_4097245d)
{
	self endon("disconnect");
	var_4097245d endon("death");
	level endon("first_mech_zombie_seen");
	while(1)
	{
		if(DistanceSquared(self.origin, var_4097245d.origin) < 1000000)
		{
			if(self zm_utility::is_player_looking_at(var_4097245d.origin + VectorScale((0, 0, 1), 60), 0.75))
			{
				if(!(isdefined(self.dontspeak) && self.dontspeak))
				{
					self zm_audio::create_and_play_dialog("general", "discover_mech");
					level notify("first_mech_zombie_seen");
					break;
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_271a1353
	Namespace: namespace_ef567265
	Checksum: 0xBE955294
	Offset: 0x8F18
	Size: 0x2C0
	Parameters: 6
	Flags: None
	Line Number: 3086
*/
function function_271a1353(e_player, v_attack_source, n_push_away, n_lift_height, v_lift_offset, n_lift_speed)
{
	self endon("hash_f49a0cb");
	if(isdefined(self.in_gravity_trap) && self.in_gravity_trap && e_player.gravityspikes_state === 3)
	{
		if(isdefined(self.var_cfc4eb7a) && self.var_cfc4eb7a)
		{
			return;
		}
		self.var_33c27225 = 1;
		self.var_cfc4eb7a = 1;
		self DoDamage(10, self.origin);
		self.var_1d753cce = self.origin;
		self thread scene::Play("cin_zm_dlc1_mechz_dth_deathray_01", self);
		self clientfield::set("sparky_beam_fx", 1);
		self clientfield::set("death_ray_shock_fx", 1);
		self playsound("zmb_talon_electrocute");
		n_start_time = GetTime();
		for(n_total_time = 0; 10 > n_total_time && e_player.gravityspikes_state === 3; n_total_time = 0)
		{
			util::wait_network_frame();
		}
		self scene::stop("cin_zm_dlc1_mechz_dth_deathray_01");
		self thread function_efaeb55e(self);
		self clientfield::set("sparky_beam_fx", 0);
		self clientfield::set("death_ray_shock_fx", 0);
		self.var_33c27225 = undefined;
		while(e_player.gravityspikes_state === 3)
		{
			util::wait_network_frame();
		}
		self.var_cfc4eb7a = undefined;
		self.in_gravity_trap = undefined;
		continue;
	}
	self DoDamage(10, self.origin);
	if(!(isdefined(self.stun) && self.stun))
	{
		self.stun = 1;
	}
}

/*
	Name: function_efaeb55e
	Namespace: namespace_ef567265
	Checksum: 0x8DC59985
	Offset: 0x91E0
	Size: 0x19C
	Parameters: 1
	Flags: None
	Line Number: 3138
*/
function function_efaeb55e(mechz)
{
	mechz endon("hash_f49a0cb");
	if(isdefined(mechz))
	{
		mechz scene::Play("cin_zm_dlc1_mechz_dth_deathray_02", mechz);
	}
	if(isdefined(mechz) && isalive(mechz) && isdefined(mechz.var_1d753cce))
	{
		v_eye_pos = mechz GetTagOrigin("tag_eye");
		/#
			recordLine(mechz.origin, v_eye_pos, VectorScale((0, 1, 0), 255), "Dev Block strings are not supported", mechz);
		#/
		trace = bullettrace(v_eye_pos, mechz.origin, 0, mechz);
		if(trace["position"] !== mechz.origin)
		{
			point = GetClosestPointOnNavMesh(trace["position"], 64, 30);
			if(!isdefined(point))
			{
				point = mechz.var_1d753cce;
			}
			mechz ForceTeleport(point);
		}
	}
}

