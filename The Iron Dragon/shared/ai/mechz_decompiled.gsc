#include scripts\codescripts\struct;
#include scripts\shared\_burnplayer;
#include scripts\shared\ai\archetype_mocomps_utility;
#include scripts\shared\ai\archetype_utility;
#include scripts\shared\ai\systems\animation_state_machine_mocomp;
#include scripts\shared\ai\systems\animation_state_machine_notetracks;
#include scripts\shared\ai\systems\animation_state_machine_utility;
#include scripts\shared\ai\systems\behavior_tree_utility;
#include scripts\shared\ai\systems\blackboard;
#include scripts\shared\ai\systems\debug;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\shared\weapons\_weaponobjects;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_utility;

#namespace MechzBehavior;

/*
	Name: init
	Namespace: MechzBehavior
	Checksum: 0x8E054557
	Offset: 0xB28
	Size: 0x278
	Parameters: 0
	Flags: AutoExec
	Line Number: 39
*/
function autoexec init()
{
	InitMechzBehaviorsAndASM();
	spawner::add_archetype_spawn_function("mechz", &ArchetypeMechzBlackboardInit);
	spawner::add_archetype_spawn_function("mechz", &MechzServerUtils::mechzSpawnSetup);
	clientfield::register("actor", "mechz_ft", 5000, 1, "int");
	clientfield::register("actor", "mechz_faceplate_detached", 5000, 2, "int");
	clientfield::register("actor", "mechz_powercap_detached", 5000, 1, "int");
	clientfield::register("actor", "mechz_claw_detached", 5000, 2, "int");
	clientfield::register("actor", "mechz_115_gun_firing", 5000, 1, "int");
	clientfield::register("actor", "mechz_rknee_armor_detached", 5000, 1, "int");
	clientfield::register("actor", "mechz_lknee_armor_detached", 5000, 1, "int");
	clientfield::register("actor", "mechz_rshoulder_armor_detached", 5000, 1, "int");
	clientfield::register("actor", "mechz_lshoulder_armor_detached", 5000, 1, "int");
	clientfield::register("actor", "mechz_headlamp_off", 5000, 2, "int");
	clientfield::register("actor", "mechz_face", 1, 3, "int");
}

/*
	Name: InitMechzBehaviorsAndASM
	Namespace: MechzBehavior
	Checksum: 0xFEF18854
	Offset: 0xDA8
	Size: 0x478
	Parameters: 0
	Flags: Private
	Line Number: 67
*/
function private InitMechzBehaviorsAndASM()
{
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzTargetService", &mechzTargetService);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzGrenadeService", &mechzGrenadeService);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzBerserkKnockdownService", &mechzBerserkKnockdownService);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzShouldMelee", &mechzShouldMelee);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzShouldShowPain", &mechzShouldShowPain);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzShouldShootGrenade", &mechzShouldShootGrenade);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzShouldShootFlame", &mechzShouldShootFlame);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzShouldShootFlameSweep", &mechzShouldShootFlameSweep);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzShouldTurnBerserk", &mechzShouldTurnBerserk);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzShouldStun", &mechzShouldStun);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzShouldStumble", &mechzShouldStumble);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeAction("mechzStunLoop", &mechzStunStart, &mechzStunUpdate, &mechzStunEnd);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeAction("mechzStumbleLoop", &mechzStumbleStart, &mechzStumbleUpdate, &mechzStumbleEnd);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeAction("mechzShootFlameAction", &mechzShootFlameActionStart, &mechzShootFlameActionUpdate, &mechzShootFlameActionEnd);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzShootGrenade", &mechzShootGrenade);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzShootFlame", &mechzShootFlame);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzUpdateFlame", &mechzUpdateFlame);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzStopFlame", &mechzStopFlame);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzPlayedBerserkIntro", &mechzPlayedBerserkIntro);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzAttackStart", &mechzAttackStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzDeathStart", &mechzDeathStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzIdleStart", &mechzIdleStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzPainStart", &mechzPainStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("mechzPainTerminate", &mechzPainTerminate);
	AnimationStateNetwork::RegisterNotetrackHandlerFunction("melee_soldat", &mechzNotetrackMelee);
	AnimationStateNetwork::RegisterNotetrackHandlerFunction("fire_chaingun", &mechzNotetrackShootGrenade);
}

/*
	Name: ArchetypeMechzBlackboardInit
	Namespace: MechzBehavior
	Checksum: 0x87D5A545
	Offset: 0x1228
	Size: 0x158
	Parameters: 0
	Flags: Private
	Line Number: 107
*/
function private ArchetypeMechzBlackboardInit()
{
	blackboard::CreateBlackBoardForEntity(self);
	self AiUtility::RegisterUtilityBlackboardAttributes();
	blackboard::RegisterBlackBoardAttribute(self, "_locomotion_speed", "locomotion_speed_run", undefined);
	blackboard::RegisterBlackBoardAttribute(self, "_locomotion_should_turn", "should_not_turn", &BB_GetShouldTurn);
	blackboard::RegisterBlackBoardAttribute(self, "_zombie_damageweapon_type", "regular", undefined);
	blackboard::RegisterBlackBoardAttribute(self, "_mechz_part", "mechz_powercore", undefined);
	self.___ArchetypeOnAnimscriptedCallback = &ArchetypeMechzOnAnimscriptedCallback;
}

/*
	Name: ArchetypeMechzOnAnimscriptedCallback
	Namespace: MechzBehavior
	Checksum: 0x6948AF84
	Offset: 0x1388
	Size: 0x38
	Parameters: 1
	Flags: Private
	Line Number: 128
*/
function private ArchetypeMechzOnAnimscriptedCallback(entity)
{
	entity.__blackboard = undefined;
	entity ArchetypeMechzBlackboardInit();
	return;
}

/*
	Name: BB_GetShouldTurn
	Namespace: MechzBehavior
	Checksum: 0x30F46BDE
	Offset: 0x13C8
	Size: 0x30
	Parameters: 0
	Flags: Private
	Line Number: 145
*/
function private BB_GetShouldTurn()
{
	if(isdefined(self.should_turn) && self.should_turn)
	{
		return "should_turn";
	}
	return "should_not_turn";
	~;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: mechzNotetrackMelee
	Namespace: MechzBehavior
	Checksum: 0x931BF6EA
	Offset: 0x1400
	Size: 0x50
	Parameters: 1
	Flags: Private
	Line Number: 166
*/
function private mechzNotetrackMelee(entity)
{
	if(isdefined(entity.mechz_melee_knockdown_function))
	{
		entity thread [[entity.mechz_melee_knockdown_function]]();
	}
	entity melee();
}

/*
	Name: mechzNotetrackShootGrenade
	Namespace: MechzBehavior
	Checksum: 0x97C42D2F
	Offset: 0x1458
	Size: 0x2D0
	Parameters: 1
	Flags: Private
	Line Number: 185
*/
function private mechzNotetrackShootGrenade(entity)
{
	if(!isdefined(entity.enemy))
	{
		return;
	}
	base_target_pos = entity.enemy.origin;
	v_velocity = entity.enemy getvelocity();
	base_target_pos = base_target_pos + v_velocity * 1.5;
	target_pos_offset_x = math::randomSign() * RandomInt(32);
	target_pos_offset_y = math::randomSign() * RandomInt(32);
	target_pos = base_target_pos + (target_pos_offset_x, target_pos_offset_y, 0);
	dir = VectorToAngles(target_pos - entity.origin);
	dir = AnglesToForward(dir);
	launch_offset = dir * 5;
	launch_pos = entity GetTagOrigin("tag_gun_barrel2") + launch_offset;
	dist = Distance(launch_pos, target_pos);
	velocity = dir * dist;
	velocity = velocity + VectorScale((0, 0, 1), 120);
	VAL = 1;
	oldVal = entity clientfield::get("mechz_115_gun_firing");
	if(oldVal === VAL)
	{
		VAL = 0;
	}
	entity clientfield::set("mechz_115_gun_firing", VAL);
	entity MagicGrenadeType(GetWeapon("electroball_grenade"), launch_pos, velocity);
	playsoundatposition("wpn_grenade_fire_mechz", entity.origin);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: mechzTargetService
	Namespace: MechzBehavior
	Checksum: 0xAEB14E29
	Offset: 0x1730
	Size: 0x268
	Parameters: 1
	Flags: None
	Line Number: 228
*/
function mechzTargetService(entity)
{
	if(isdefined(entity.ignoreall) && entity.ignoreall)
	{
		return 0;
	}
	if(isdefined(entity.destroy_octobomb))
	{
		return 0;
	}
	player = zombie_utility::get_closest_valid_player(self.origin, self.ignore_player);
	entity.favoriteenemy = player;
	if(!isdefined(player) || player IsNoTarget())
	{
		if(isdefined(entity.ignore_player))
		{
			if(isdefined(level._should_skip_ignore_player_logic) && [[level._should_skip_ignore_player_logic]]())
			{
				return;
			}
			entity.ignore_player = [];
		}
		/#
			if(isdefined(level.b_mechz_true_ignore) && level.b_mechz_true_ignore)
			{
				entity SetGoal(entity.origin);
				return 0;
			}
		#/
		if(isdefined(level.no_target_override))
		{
			[[level.no_target_override]](entity);
			continue;
		}
		entity SetGoal(entity.origin);
		return 0;
	}
	else if(isdefined(level.enemy_location_override_func))
	{
		enemy_ground_pos = [[level.enemy_location_override_func]](entity, player);
		if(isdefined(enemy_ground_pos))
		{
			entity SetGoal(enemy_ground_pos);
			return 1;
		}
	}
	targetPos = GetClosestPointOnNavMesh(player.origin, 64, 30);
	if(isdefined(targetPos))
	{
		entity SetGoal(targetPos);
		return 1;
		continue;
	}
	entity SetGoal(entity.origin);
	return 0;
}

/*
	Name: mechzGrenadeService
	Namespace: MechzBehavior
	Checksum: 0x7F27BBFC
	Offset: 0x19A0
	Size: 0x100
	Parameters: 1
	Flags: Private
	Line Number: 295
*/
function private mechzGrenadeService(entity)
{
	if(!isdefined(entity.burstGrenadesFired))
	{
		entity.burstGrenadesFired = 0;
	}
	if(entity.burstGrenadesFired >= 3)
	{
		if(GetTime() > entity.nextGrenadeTime)
		{
			entity.burstGrenadesFired = 0;
		}
	}
	if(isdefined(level.a_electroball_grenades))
	{
		level.a_electroball_grenades = Array::remove_undefined(level.a_electroball_grenades);
		a_active_grenades = Array::filter(level.a_electroball_grenades, 0, &mechzFilterGrenadesByOwner, entity);
		entity.activeGrenades = a_active_grenades.size;
		continue;
	}
	entity.activeGrenades = 0;
}

/*
	Name: mechzFilterGrenadesByOwner
	Namespace: MechzBehavior
	Checksum: 0x397BB905
	Offset: 0x1AA8
	Size: 0x38
	Parameters: 2
	Flags: Private
	Line Number: 328
*/
function private mechzFilterGrenadesByOwner(grenade, mechz)
{
	if(grenade.owner === mechz)
	{
		return 1;
	}
	return 0;
}

/*
	Name: mechzBerserkKnockdownService
	Namespace: MechzBehavior
	Checksum: 0xA4BAC406
	Offset: 0x1AE8
	Size: 0x440
	Parameters: 1
	Flags: Private
	Line Number: 347
*/
function private mechzBerserkKnockdownService(entity)
{
	velocity = entity getvelocity();
	predict_time = 0.3;
	predicted_pos = entity.origin + velocity * predict_time;
	move_dist_sq = DistanceSquared(predicted_pos, entity.origin);
	speed = move_dist_sq / predict_time;
	if(speed >= 10)
	{
		a_zombies = getaiarchetypearray("zombie");
		a_filtered_zombies = Array::filter(a_zombies, 0, &mechzZombieEligibleForBerserkKnockdown, entity, predicted_pos);
		if(a_filtered_zombies.size > 0)
		{
			foreach(zombie in a_filtered_zombies)
			{
				zombie.KNOCKDOWN = 1;
				zombie.knockdown_type = "knockdown_shoved";
				zombie_to_mechz = entity.origin - zombie.origin;
				zombie_to_mechz_2d = VectorNormalize((zombie_to_mechz[0], zombie_to_mechz[1], 0));
				zombie_forward = AnglesToForward(zombie.angles);
				zombie_forward_2d = VectorNormalize((zombie_forward[0], zombie_forward[1], 0));
				zombie_right = AnglesToRight(zombie.angles);
				zombie_right_2d = VectorNormalize((zombie_right[0], zombie_right[1], 0));
				dot = VectorDot(zombie_to_mechz_2d, zombie_forward_2d);
				if(dot >= 0.5)
				{
					zombie.knockdown_direction = "front";
					zombie.getup_direction = "getup_back";
					continue;
				}
				if(dot < 0.5 && dot > -0.5)
				{
					dot = VectorDot(zombie_to_mechz_2d, zombie_right_2d);
					if(dot > 0)
					{
						zombie.knockdown_direction = "right";
						if(math::cointoss())
						{
							zombie.getup_direction = "getup_back";
							continue;
						}
						zombie.getup_direction = "getup_belly";
						continue;
					}
					zombie.knockdown_direction = "left";
					zombie.getup_direction = "getup_belly";
					continue;
				}
				zombie.knockdown_direction = "back";
				zombie.getup_direction = "getup_belly";
			}
			return;
		}
	}
	~zombie.getup_direction;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: mechzZombieEligibleForBerserkKnockdown
	Namespace: MechzBehavior
	Checksum: 0x88835612
	Offset: 0x1F30
	Size: 0x1C8
	Parameters: 3
	Flags: Private
	Line Number: 415
*/
function private mechzZombieEligibleForBerserkKnockdown(zombie, mechz, predicted_pos)
{
	if(zombie.KNOCKDOWN === 1)
	{
		return 0;
	}
	knockdown_dist_sq = 2304;
	dist_sq = DistanceSquared(predicted_pos, zombie.origin);
	if(dist_sq > knockdown_dist_sq)
	{
		return 0;
	}
	if(zombie.is_immune_to_knockdown === 1)
	{
		return 0;
	}
	origin = mechz.origin;
	facing_vec = AnglesToForward(mechz.angles);
	enemy_vec = zombie.origin - origin;
	enemy_yaw_vec = (enemy_vec[0], enemy_vec[1], 0);
	facing_yaw_vec = (facing_vec[0], facing_vec[1], 0);
	enemy_yaw_vec = VectorNormalize(enemy_yaw_vec);
	facing_yaw_vec = VectorNormalize(facing_yaw_vec);
	enemy_dot = VectorDot(facing_yaw_vec, enemy_yaw_vec);
	if(enemy_dot < 0)
	{
		return 0;
	}
	return 1;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: mechzShouldMelee
	Namespace: MechzBehavior
	Checksum: 0x8A18FA58
	Offset: 0x2100
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 457
*/
function mechzShouldMelee(entity)
{
	if(!isdefined(entity.enemy))
	{
		return 0;
	}
	if(DistanceSquared(entity.origin, entity.enemy.origin) > 12544)
	{
		return 0;
	}
	if(isdefined(entity.enemy.usingvehicle) && entity.enemy.usingvehicle)
	{
		return 1;
	}
	yaw = Abs(zombie_utility::getYawToEnemy());
	if(yaw > 45)
	{
		return 0;
	}
	return 1;
}

/*
	Name: mechzShouldShowPain
	Namespace: MechzBehavior
	Checksum: 0xA2DBCA5F
	Offset: 0x21F0
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 489
*/
function private mechzShouldShowPain(entity)
{
	if(entity.partDestroyed === 1)
	{
		return 1;
	}
	return 0;
}

/*
	Name: mechzShouldShootGrenade
	Namespace: MechzBehavior
	Checksum: 0x6BE944A3
	Offset: 0x2228
	Size: 0x140
	Parameters: 1
	Flags: Private
	Line Number: 508
*/
function private mechzShouldShootGrenade(entity)
{
	if(entity.Berserk === 1)
	{
		return 0;
	}
	if(entity.gun_attached !== 1)
	{
		return 0;
	}
	if(!isdefined(entity.favoriteenemy))
	{
		return 0;
	}
	if(entity.burstGrenadesFired >= 3)
	{
		return 0;
	}
	if(entity.activeGrenades >= 9)
	{
		return 0;
	}
	if(!entity MechzServerUtils::mechzGrenadeCheckInArc())
	{
		return 0;
	}
	if(!entity cansee(entity.favoriteenemy))
	{
		return 0;
	}
	dist_sq = DistanceSquared(entity.origin, entity.favoriteenemy.origin);
	if(dist_sq < 62500 || dist_sq > 1440000)
	{
		return 0;
	}
	return 1;
}

/*
	Name: mechzShouldShootFlame
	Namespace: MechzBehavior
	Checksum: 0x640BBEFE
	Offset: 0x2370
	Size: 0x1F8
	Parameters: 1
	Flags: Private
	Line Number: 556
*/
function private mechzShouldShootFlame(entity)
{
	/#
		if(isdefined(entity.shoot_flame) && entity.shoot_flame)
		{
			return 1;
		}
	#/
	if(entity.Berserk === 1)
	{
		return 0;
	}
	if(isdefined(entity.isShootingFlame) && entity.isShootingFlame && GetTime() < entity.stopShootingFlameTime)
	{
		return 1;
	}
	if(!isdefined(entity.favoriteenemy))
	{
		return 0;
	}
	if(entity.isShootingFlame === 1 && entity.stopShootingFlameTime <= GetTime())
	{
		return 0;
	}
	if(entity.nextFlameTime > GetTime())
	{
		return 0;
	}
	if(!entity MechzServerUtils::mechzCheckInArc(26, "tag_flamethrower_fx"))
	{
		return 0;
	}
	dist_sq = DistanceSquared(entity.origin, entity.favoriteenemy.origin);
	if(dist_sq < 9216 || dist_sq > 50625)
	{
		return 0;
	}
	can_see = BulletTracePassed(entity.origin + VectorScale((0, 0, 1), 36), entity.favoriteenemy.origin + VectorScale((0, 0, 1), 36), 0, undefined);
	if(!can_see)
	{
		return 0;
	}
	return 1;
}

/*
	Name: mechzShouldShootFlameSweep
	Namespace: MechzBehavior
	Checksum: 0x62EBE458
	Offset: 0x2570
	Size: 0x158
	Parameters: 1
	Flags: Private
	Line Number: 611
*/
function private mechzShouldShootFlameSweep(entity)
{
	if(entity.Berserk === 1)
	{
		return 0;
	}
	if(!mechzShouldShootFlame(entity))
	{
		return 0;
	}
	if(RandomInt(100) > 10)
	{
		return 0;
	}
	near_players = 0;
	players = GetPlayers();
	foreach(player in players)
	{
		if(Distance2DSquared(entity.origin, player.origin) < 10000)
		{
			near_players++;
		}
	}
	if(near_players < 2)
	{
		return 0;
	}
	return 1;
}

/*
	Name: mechzShouldTurnBerserk
	Namespace: MechzBehavior
	Checksum: 0xB51B29F8
	Offset: 0x26D0
	Size: 0x48
	Parameters: 1
	Flags: Private
	Line Number: 651
*/
function private mechzShouldTurnBerserk(entity)
{
	if(entity.Berserk === 1 && entity.hasTurnedBerserk !== 1)
	{
		return 1;
	}
	return 0;
}

/*
	Name: mechzShouldStun
	Namespace: MechzBehavior
	Checksum: 0x78C337F8
	Offset: 0x2720
	Size: 0x40
	Parameters: 1
	Flags: Private
	Line Number: 670
*/
function private mechzShouldStun(entity)
{
	if(isdefined(entity.stun) && entity.stun)
	{
		return 1;
	}
	return 0;
}

/*
	Name: mechzShouldStumble
	Namespace: MechzBehavior
	Checksum: 0x7946B030
	Offset: 0x2768
	Size: 0x40
	Parameters: 1
	Flags: Private
	Line Number: 689
*/
function private mechzShouldStumble(entity)
{
	if(isdefined(entity.stumble) && entity.stumble)
	{
		return 1;
	}
	return 0;
}

/*
	Name: mechzShootGrenadeAction
	Namespace: MechzBehavior
	Checksum: 0x35B32C02
	Offset: 0x27B0
	Size: 0x48
	Parameters: 2
	Flags: Private
	Line Number: 708
*/
function private mechzShootGrenadeAction(entity, asmStateName)
{
	AnimationStateNetworkUtility::RequestState(entity, asmStateName);
	entity.grenadeStartTime = GetTime() + 3000;
	return 5;
}

/*
	Name: mechzShootGrenadeActionUpdate
	Namespace: MechzBehavior
	Checksum: 0xE40EA037
	Offset: 0x2800
	Size: 0x48
	Parameters: 2
	Flags: Private
	Line Number: 725
*/
function private mechzShootGrenadeActionUpdate(entity, asmStateName)
{
	if(!(isdefined(entity.shoot_grenade) && entity.shoot_grenade))
	{
		return 4;
	}
	return 5;
}

/*
	Name: mechzStunStart
	Namespace: MechzBehavior
	Checksum: 0x31A2FB3B
	Offset: 0x2850
	Size: 0x48
	Parameters: 2
	Flags: Private
	Line Number: 744
*/
function private mechzStunStart(entity, asmStateName)
{
	AnimationStateNetworkUtility::RequestState(entity, asmStateName);
	entity.stunTime = GetTime() + 500;
	return 5;
}

/*
	Name: mechzStunUpdate
	Namespace: MechzBehavior
	Checksum: 0x7A29BDC0
	Offset: 0x28A0
	Size: 0x38
	Parameters: 2
	Flags: Private
	Line Number: 761
*/
function private mechzStunUpdate(entity, asmStateName)
{
	if(GetTime() > entity.stunTime)
	{
		return 4;
	}
	return 5;
}

/*
	Name: mechzStunEnd
	Namespace: MechzBehavior
	Checksum: 0x80F1BB1C
	Offset: 0x28E0
	Size: 0x40
	Parameters: 2
	Flags: Private
	Line Number: 780
*/
function private mechzStunEnd(entity, asmStateName)
{
	entity.stun = 0;
	entity.stumble_stun_cooldown_time = GetTime() + 10000;
	return 4;
}

/*
	Name: mechzStumbleStart
	Namespace: MechzBehavior
	Checksum: 0x900ACA28
	Offset: 0x2928
	Size: 0x48
	Parameters: 2
	Flags: Private
	Line Number: 797
*/
function private mechzStumbleStart(entity, asmStateName)
{
	AnimationStateNetworkUtility::RequestState(entity, asmStateName);
	entity.stumbleTime = GetTime() + 500;
	return 5;
}

/*
	Name: mechzStumbleUpdate
	Namespace: MechzBehavior
	Checksum: 0x7F278096
	Offset: 0x2978
	Size: 0x38
	Parameters: 2
	Flags: Private
	Line Number: 814
*/
function private mechzStumbleUpdate(entity, asmStateName)
{
	if(GetTime() > entity.stumbleTime)
	{
		return 4;
	}
	return 5;
	ERROR: Bad function call
}

/*
	Name: mechzStumbleEnd
	Namespace: MechzBehavior
	Checksum: 0x7DDC85E2
	Offset: 0x29B8
	Size: 0x40
	Parameters: 2
	Flags: Private
	Line Number: 834
*/
function private mechzStumbleEnd(entity, asmStateName)
{
	entity.stumble = 0;
	entity.stumble_stun_cooldown_time = GetTime() + 10000;
	return 4;
}

/*
	Name: mechzShootFlameActionStart
	Namespace: MechzBehavior
	Checksum: 0xD17F51AF
	Offset: 0x2A00
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 851
*/
function mechzShootFlameActionStart(entity, asmStateName)
{
	AnimationStateNetworkUtility::RequestState(entity, asmStateName);
	mechzShootFlame(entity);
	return 5;
}

/*
	Name: mechzShootFlameActionUpdate
	Namespace: MechzBehavior
	Checksum: 0x17D7E85D
	Offset: 0x2A50
	Size: 0x130
	Parameters: 2
	Flags: None
	Line Number: 868
*/
function mechzShootFlameActionUpdate(entity, asmStateName)
{
	if(isdefined(entity.Berserk) && entity.Berserk)
	{
		mechzStopFlame(entity);
		return 4;
	}
	if(isdefined(mechzShouldMelee(entity)) && mechzShouldMelee(entity))
	{
		mechzStopFlame(entity);
		return 4;
	}
	if(isdefined(entity.isShootingFlame) && entity.isShootingFlame)
	{
		if(isdefined(entity.stopShootingFlameTime) && GetTime() > entity.stopShootingFlameTime)
		{
			mechzStopFlame(entity);
			return 4;
		}
		mechzUpdateFlame(entity);
	}
	return 5;
}

/*
	Name: mechzShootFlameActionEnd
	Namespace: MechzBehavior
	Checksum: 0x9B9DBC49
	Offset: 0x2B88
	Size: 0x30
	Parameters: 2
	Flags: None
	Line Number: 902
*/
function mechzShootFlameActionEnd(entity, asmStateName)
{
	mechzStopFlame(entity);
	return 4;
}

/*
	Name: mechzShootGrenade
	Namespace: MechzBehavior
	Checksum: 0x3E26CD02
	Offset: 0x2BC0
	Size: 0x50
	Parameters: 1
	Flags: Private
	Line Number: 918
*/
function private mechzShootGrenade(entity)
{
	entity.burstGrenadesFired++;
	if(entity.burstGrenadesFired >= 3)
	{
		entity.nextGrenadeTime = GetTime() + 6000;
	}
}

/*
	Name: mechzShootFlame
	Namespace: MechzBehavior
	Checksum: 0xAA242E78
	Offset: 0x2C18
	Size: 0x28
	Parameters: 1
	Flags: Private
	Line Number: 937
*/
function private mechzShootFlame(entity)
{
	entity thread mechzDelayFlame();
}

/*
	Name: mechzDelayFlame
	Namespace: MechzBehavior
	Checksum: 0xD48FE244
	Offset: 0x2C48
	Size: 0x70
	Parameters: 0
	Flags: Private
	Line Number: 952
*/
function private mechzDelayFlame()
{
	self endon("death");
	self notify("mechzDelayFlame");
	self endon("mechzDelayFlame");
	wait(0.3);
	self clientfield::set("mechz_ft", 1);
	self.isShootingFlame = 1;
	self.stopShootingFlameTime = GetTime() + 2500;
}

/*
	Name: mechzUpdateFlame
	Namespace: MechzBehavior
	Checksum: 0xE528E07F
	Offset: 0x2CC0
	Size: 0x178
	Parameters: 1
	Flags: Private
	Line Number: 973
*/
function private mechzUpdateFlame(entity)
{
	if(isdefined(level.mechz_flamethrower_player_callback))
	{
		[[level.mechz_flamethrower_player_callback]](entity);
		continue;
	}
	players = GetPlayers();
	foreach(player in players)
	{
		if(!(isdefined(player.is_burning) && player.is_burning))
		{
			if(player istouching(entity.flameTrigger))
			{
				if(isdefined(entity.mechzFlameDamage))
				{
					player thread [[entity.mechzFlameDamage]]();
					continue;
				}
				player thread playerFlameDamage(entity);
			}
		}
	}
	if(isdefined(level.mechz_flamethrower_ai_callback))
	{
		[[level.mechz_flamethrower_ai_callback]](entity);
	}
}

/*
	Name: playerFlameDamage
	Namespace: MechzBehavior
	Checksum: 0x7FC235E1
	Offset: 0x2E40
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 1012
*/
function playerFlameDamage(mechz)
{
	self endon("death");
	self endon("disconnect");
	if(!(isdefined(self.is_burning) && self.is_burning) && zombie_utility::is_player_valid(self, 1))
	{
		self.is_burning = 1;
		if(!self hasPerk("specialty_armorvest"))
		{
			self burnplayer::SetPlayerBurning(1.5, 0.5, 30, mechz, undefined);
			continue;
		}
		self burnplayer::SetPlayerBurning(1.5, 0.5, 20, mechz, undefined);
		wait(1.5);
		self.is_burning = 0;
	}
}

/*
	Name: mechzStopFlame
	Namespace: MechzBehavior
	Checksum: 0x99A9B4
	Offset: 0x2F40
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1040
*/
function mechzStopFlame(entity)
{
	self notify("mechzDelayFlame");
	entity clientfield::set("mechz_ft", 0);
	entity.isShootingFlame = 0;
	entity.nextFlameTime = GetTime() + 7500;
	entity.stopShootingFlameTime = undefined;
}

/*
	Name: mechzGoBerserk
	Namespace: MechzBehavior
	Checksum: 0x793DECB1
	Offset: 0x2FC0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1059
*/
function mechzGoBerserk()
{
	entity = self;
	g_time = GetTime();
	entity.berserkEndTime = g_time + 10000;
	if(entity.Berserk !== 1)
	{
		entity.Berserk = 1;
		entity thread mechzEndBerserk();
		blackboard::SetBlackBoardAttribute(entity, "_locomotion_speed", "locomotion_speed_sprint");
	}
}

/*
	Name: mechzPlayedBerserkIntro
	Namespace: MechzBehavior
	Checksum: 0x8CA6643
	Offset: 0x3070
	Size: 0x20
	Parameters: 1
	Flags: Private
	Line Number: 1082
*/
function private mechzPlayedBerserkIntro(entity)
{
	entity.hasTurnedBerserk = 1;
}

/*
	Name: mechzEndBerserk
	Namespace: MechzBehavior
	Checksum: 0xF63565C1
	Offset: 0x3098
	Size: 0xA8
	Parameters: 0
	Flags: Private
	Line Number: 1097
*/
function private mechzEndBerserk()
{
	self endon("death");
	self endon("disconnect");
	while(self.Berserk === 1)
	{
		if(GetTime() >= self.berserkEndTime)
		{
			self.Berserk = 0;
			self.hasTurnedBerserk = 0;
			self ASMSetAnimationRate(1);
			blackboard::SetBlackBoardAttribute(self, "_locomotion_speed", "locomotion_speed_run");
		}
		wait(0.25);
	}
}

/*
	Name: mechzAttackStart
	Namespace: MechzBehavior
	Checksum: 0xCC88BD61
	Offset: 0x3148
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 1124
*/
function private mechzAttackStart(entity)
{
	entity clientfield::set("mechz_face", 1);
}

/*
	Name: mechzDeathStart
	Namespace: MechzBehavior
	Checksum: 0x705FF939
	Offset: 0x3180
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 1139
*/
function private mechzDeathStart(entity)
{
	entity clientfield::set("mechz_face", 2);
	return;
}

/*
	Name: mechzIdleStart
	Namespace: MechzBehavior
	Checksum: 0x2F9EC1F6
	Offset: 0x31B8
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 1155
*/
function private mechzIdleStart(entity)
{
	entity clientfield::set("mechz_face", 3);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: mechzPainStart
	Namespace: MechzBehavior
	Checksum: 0xA432F3D4
	Offset: 0x31F0
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 1172
*/
function private mechzPainStart(entity)
{
	entity clientfield::set("mechz_face", 4);
}

/*
	Name: mechzPainTerminate
	Namespace: MechzBehavior
	Checksum: 0x2989EEE2
	Offset: 0x3228
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 1187
*/
function private mechzPainTerminate(entity)
{
	entity.partDestroyed = 0;
	entity.show_pain_from_explosive_dmg = undefined;
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
	ERROR: Exception occured: Stack empty.
}

#namespace MechzServerUtils;

/*
	Name: mechzSpawnSetup
	Namespace: MechzServerUtils
	Checksum: 0x9129CEA
	Offset: 0x3260
	Size: 0x1F8
	Parameters: 0
	Flags: Private
	Line Number: 1209
*/
function private mechzSpawnSetup()
{
	self DisableAimAssist();
	self.disableAmmoDrop = 1;
	self.no_gib = 1;
	self.ignore_nuke = 1;
	self.ignore_enemy_count = 1;
	self.ignore_round_robbin_death = 1;
	self.zombie_move_speed = "run";
	blackboard::SetBlackBoardAttribute(self, "_locomotion_speed", "locomotion_speed_run");
	self.ignorerunAndgundist = 1;
	self mechzAddAttachments();
	self.grenadeCount = 9;
	self.nextFlameTime = GetTime();
	self.stumble_stun_cooldown_time = GetTime();
	/#
		self.debug_traversal_ast = "Dev Block strings are not supported";
	#/
	self.flameTrigger = spawn("trigger_box", self.origin, 0, 200, 50, 25);
	self.flameTrigger EnableLinkTo();
	self.flameTrigger.origin = self GetTagOrigin("tag_flamethrower_fx");
	self.flameTrigger.angles = self GetTagAngles("tag_flamethrower_fx");
	self.flameTrigger LinkTo(self, "tag_flamethrower_fx");
	self thread weaponobjects::watchWeaponObjectUsage();
	self.pers = [];
	self.pers["team"] = self.team;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: mechzFlameWatcher
	Namespace: MechzServerUtils
	Checksum: 0xBE4F59DA
	Offset: 0x3460
	Size: 0x70
	Parameters: 0
	Flags: Private
	Line Number: 1249
*/
function private mechzFlameWatcher()
{
	self endon("death");
	while(1)
	{
		if(isdefined(self.favoriteenemy))
		{
			if(self.flameTrigger istouching(self.favoriteenemy))
			{
				/#
					PrintTopRightln("Dev Block strings are not supported");
				#/
			}
		}
		wait(0.05);
	}
}

/*
	Name: mechzAddAttachments
	Namespace: MechzServerUtils
	Checksum: 0x78386BC3
	Offset: 0x34D8
	Size: 0x110
	Parameters: 0
	Flags: Private
	Line Number: 1277
*/
function private mechzAddAttachments()
{
	self.has_left_knee_armor = 1;
	self.left_knee_armor_health = 50;
	self.has_right_knee_armor = 1;
	self.right_knee_armor_health = 50;
	self.has_left_shoulder_armor = 1;
	self.left_shoulder_armor_health = 50;
	self.has_right_shoulder_armor = 1;
	self.right_shoulder_armor_health = 50;
	org = self GetTagOrigin("tag_gun_spin");
	ang = self GetTagAngles("tag_gun_spin");
	self.gun_attached = 1;
	self.has_faceplate = 1;
	self.faceplate_health = 50;
	self.has_powercap = 1;
	self.powercap_covered = 1;
	self.powercap_cover_health = 50;
	self.powercap_health = 50;
}

/*
	Name: mechzDamageCallback
	Namespace: MechzServerUtils
	Checksum: 0xF805CF2F
	Offset: 0x35F0
	Size: 0x16B8
	Parameters: 12
	Flags: None
	Line Number: 1308
*/
function mechzDamageCallback(inflictor, attacker, damage, dFlags, mod, weapon, point, dir, hitLoc, offsetTime, boneIndex, modelIndex)
{
	if(isdefined(self.b_flyin_done) && (!(isdefined(self.b_flyin_done) && self.b_flyin_done)))
	{
		return 0;
	}
	if(isdefined(level.mechz_should_stun_override) && (!(isdefined(self.stun) && self.stun || (isdefined(self.stumble) && self.stumble))))
	{
		if(self.stumble_stun_cooldown_time < GetTime() && (!(isdefined(self.Berserk) && self.Berserk)))
		{
			self [[level.mechz_should_stun_override]](inflictor, attacker, damage, dFlags, mod, weapon, point, dir, hitLoc, offsetTime, boneIndex, modelIndex);
		}
	}
	if(IsSubStr(weapon.name, "elemental_bow") && isdefined(inflictor) && inflictor.classname === "rocket")
	{
		return 0;
	}
	damage = mechzWeaponDamageModifier(damage, weapon);
	if(isdefined(level.mechz_damage_override))
	{
		damage = [[level.mechz_damage_override]](attacker, damage);
	}
	if(!isdefined(self.next_pain_time) || GetTime() >= self.next_pain_time)
	{
		self thread mechz_play_pain_audio();
		self.next_pain_time = GetTime() + 250 + RandomInt(500);
	}
	if(isdefined(self.damage_scoring_function))
	{
		self [[self.damage_scoring_function]](inflictor, attacker, damage, dFlags, mod, weapon, point, dir, hitLoc, offsetTime, boneIndex, modelIndex);
	}
	if(isdefined(level.mechz_staff_damage_override))
	{
		staffDamage = [[level.mechz_staff_damage_override]](inflictor, attacker, damage, dFlags, mod, weapon, point, dir, hitLoc, offsetTime, boneIndex, modelIndex);
		if(staffDamage > 0)
		{
			n_mechz_damage_percent = 0.5;
			if(!(isdefined(self.has_faceplate) && self.has_faceplate) && n_mechz_damage_percent < 1)
			{
				n_mechz_damage_percent = 1;
			}
			staffDamage = staffDamage * n_mechz_damage_percent;
			if(isdefined(self.has_faceplate) && self.has_faceplate)
			{
				self mechz_track_faceplate_damage(staffDamage);
			}
			/#
				IPrintLnBold("Dev Block strings are not supported" + staffDamage + "Dev Block strings are not supported" + self.health - staffDamage);
			#/
			if(!isdefined(self.explosive_dmg_taken))
			{
				self.explosive_dmg_taken = 0;
			}
			self.explosive_dmg_taken = self.explosive_dmg_taken + staffDamage;
			if(isdefined(level.mechz_explosive_damage_reaction_callback))
			{
				self [[level.mechz_explosive_damage_reaction_callback]]();
			}
			return staffDamage;
		}
	}
	if(isdefined(level.mechz_explosive_damage_reaction_callback))
	{
		if(isdefined(mod) && mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH" || mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH" || mod == "MOD_EXPLOSIVE")
		{
			n_mechz_damage_percentage = 0.5;
			if(isdefined(attacker) && isPlayer(attacker) && isalive(attacker) && (level.zombie_vars[attacker.team]["zombie_insta_kill"] || (isdefined(attacker.personal_instakill) && attacker.personal_instakill)))
			{
				n_mechz_damage_percentage = 1;
			}
			explosive_damage = damage * n_mechz_damage_percentage;
			if(!isdefined(self.explosive_dmg_taken))
			{
				self.explosive_dmg_taken = 0;
			}
			self.explosive_dmg_taken = self.explosive_dmg_taken + explosive_damage;
			if(isdefined(self.has_faceplate) && self.has_faceplate)
			{
				self mechz_track_faceplate_damage(explosive_damage);
			}
			self [[level.mechz_explosive_damage_reaction_callback]]();
			/#
				IPrintLnBold("Dev Block strings are not supported" + explosive_damage + "Dev Block strings are not supported" + self.health - explosive_damage);
			#/
			return explosive_damage;
		}
	}
	if(hitLoc == "head")
	{
		attacker show_hit_marker();
		/#
			IPrintLnBold("Dev Block strings are not supported" + damage + "Dev Block strings are not supported" + self.health - damage);
		#/
		return damage;
	}
	if(hitLoc !== "none")
	{
		switch(hitLoc)
		{
			case "torso_upper":
			{
				if(self.has_faceplate == 1)
				{
					faceplate_pos = self GetTagOrigin("j_faceplate");
					dist_sq = DistanceSquared(faceplate_pos, point);
					if(dist_sq <= 144)
					{
						self mechz_track_faceplate_damage(damage);
						attacker show_hit_marker();
					}
					headlamp_dist_sq = DistanceSquared(point, self GetTagOrigin("tag_headlamp_FX"));
					if(headlamp_dist_sq <= 9)
					{
						self mechz_turn_off_headlamp(1);
					}
				}
				partName = GetPartName("c_zom_mech_body", boneIndex);
				if(self.powercap_covered === 1 && (partName === "tag_powersupply" || partName === "tag_powersupply_hit"))
				{
					self mechz_track_powercap_cover_damage(damage);
					attacker show_hit_marker();
					/#
						IPrintLnBold("Dev Block strings are not supported" + damage * 0.1 + "Dev Block strings are not supported" + self.health - damage * 0.1);
					#/
					return damage * 0.1;
				}
				else if(self.powercap_covered !== 1 && self.has_powercap === 1 && (partName === "tag_powersupply" || partName === "tag_powersupply_hit"))
				{
					self mechz_track_powercap_damage(damage);
					attacker show_hit_marker();
					/#
						IPrintLnBold("Dev Block strings are not supported" + damage + "Dev Block strings are not supported" + self.health - damage);
					#/
					return damage;
				}
				else if(self.powercap_covered !== 1 && self.has_powercap !== 1 && (partName === "tag_powersupply" || partName === "tag_powersupply_hit"))
				{
					/#
						IPrintLnBold("Dev Block strings are not supported" + damage * 0.5 + "Dev Block strings are not supported" + self.health - damage * 0.5);
					#/
					attacker show_hit_marker();
					return damage * 0.5;
				}
				if(self.has_right_shoulder_armor === 1 && partName === "j_shoulderarmor_ri")
				{
					self mechz_track_rshoulder_armor_damage(damage);
					/#
						IPrintLnBold("Dev Block strings are not supported" + damage * 0.1 + "Dev Block strings are not supported" + self.health - damage * 0.1);
					#/
					return damage * 0.1;
				}
				if(self.has_left_shoulder_armor === 1 && partName === "j_shoulderarmor_le")
				{
					self mechz_track_lshoulder_armor_damage(damage);
					/#
						IPrintLnBold("Dev Block strings are not supported" + damage * 0.1 + "Dev Block strings are not supported" + self.health - damage * 0.1);
					#/
					return damage * 0.1;
				}
				/#
					IPrintLnBold("Dev Block strings are not supported" + damage * 0.1 + "Dev Block strings are not supported" + self.health - damage * 0.1);
				#/
				return damage * 0.1;
				break;
			}
			case "left_leg_lower":
			{
				partName = GetPartName("c_zom_mech_body", boneIndex);
				if(partName === "j_knee_attach_le" && self.has_left_knee_armor === 1)
				{
					self mechz_track_lknee_armor_damage(damage);
				}
				/#
					IPrintLnBold("Dev Block strings are not supported" + damage * 0.1 + "Dev Block strings are not supported" + self.health - damage * 0.1);
				#/
				return damage * 0.1;
				break;
			}
			case "right_leg_lower":
			{
				partName = GetPartName("c_zom_mech_body", boneIndex);
				if(partName === "j_knee_attach_ri" && self.has_right_knee_armor === 1)
				{
					self mechz_track_rknee_armor_damage(damage);
				}
				/#
					IPrintLnBold("Dev Block strings are not supported" + damage * 0.1 + "Dev Block strings are not supported" + self.health - damage * 0.1);
				#/
				return damage * 0.1;
				break;
			}
			case "left_arm_lower":
			case "left_arm_upper":
			case "left_hand":
			{
				if(isdefined(level.mechz_left_arm_damage_callback))
				{
					self [[level.mechz_left_arm_damage_callback]]();
				}
				/#
					IPrintLnBold("Dev Block strings are not supported" + damage * 0.1 + "Dev Block strings are not supported" + self.health - damage * 0.1);
				#/
				return damage * 0.1;
				break;
			}
			default
			{
				/#
					IPrintLnBold("Dev Block strings are not supported" + damage * 0.1 + "Dev Block strings are not supported" + self.health - damage * 0.1);
				#/
				return damage * 0.1;
				break;
			}
		}
	}
	if(mod == "MOD_PROJECTILE")
	{
		hit_damage = damage * 0.1;
		if(self.has_faceplate !== 1)
		{
			head_pos = self GetTagOrigin("tag_eye");
			dist_sq = DistanceSquared(head_pos, point);
			if(dist_sq <= 144)
			{
				/#
					IPrintLnBold("Dev Block strings are not supported" + damage + "Dev Block strings are not supported" + self.health - damage);
				#/
				attacker show_hit_marker();
				return damage;
			}
		}
		if(self.has_faceplate === 1)
		{
			faceplate_pos = self GetTagOrigin("j_faceplate");
			dist_sq = DistanceSquared(faceplate_pos, point);
			if(dist_sq <= 144)
			{
				self mechz_track_faceplate_damage(damage);
				attacker show_hit_marker();
			}
			headlamp_dist_sq = DistanceSquared(point, self GetTagOrigin("tag_headlamp_FX"));
			if(headlamp_dist_sq <= 9)
			{
				self mechz_turn_off_headlamp(1);
			}
		}
		power_pos = self GetTagOrigin("tag_powersupply_hit");
		power_dist_sq = DistanceSquared(power_pos, point);
		if(power_dist_sq <= 25)
		{
			if(self.powercap_covered !== 1 && self.has_powercap !== 1)
			{
				/#
					IPrintLnBold("Dev Block strings are not supported" + damage + "Dev Block strings are not supported" + self.health - damage);
				#/
				attacker show_hit_marker();
				return damage;
			}
			if(self.powercap_covered !== 1 && self.has_powercap === 1)
			{
				self mechz_track_powercap_damage(damage);
				attacker show_hit_marker();
				/#
					IPrintLnBold("Dev Block strings are not supported" + damage + "Dev Block strings are not supported" + self.health - damage);
				#/
				return damage;
			}
			if(self.powercap_covered === 1)
			{
				self mechz_track_powercap_cover_damage(damage);
				attacker show_hit_marker();
			}
		}
		if(self.has_right_shoulder_armor === 1)
		{
			armor_pos = self GetTagOrigin("j_shoulderarmor_ri");
			dist_sq = DistanceSquared(armor_pos, point);
			if(dist_sq <= 64)
			{
				self mechz_track_rshoulder_armor_damage(damage);
			}
		}
		if(self.has_left_shoulder_armor === 1)
		{
			armor_pos = self GetTagOrigin("j_shoulderarmor_le");
			dist_sq = DistanceSquared(armor_pos, point);
			if(dist_sq <= 64)
			{
				self mechz_track_lshoulder_armor_damage(damage);
			}
		}
		if(self.has_right_knee_armor === 1)
		{
			armor_pos = self GetTagOrigin("j_knee_attach_ri");
			dist_sq = DistanceSquared(armor_pos, point);
			if(dist_sq <= 36)
			{
				self mechz_track_rknee_armor_damage(damage);
			}
		}
		if(self.has_left_knee_armor === 1)
		{
			armor_pos = self GetTagOrigin("j_knee_attach_le");
			dist_sq = DistanceSquared(armor_pos, point);
			if(dist_sq <= 36)
			{
				self mechz_track_lknee_armor_damage(damage);
			}
		}
		/#
			IPrintLnBold("Dev Block strings are not supported" + hit_damage + "Dev Block strings are not supported" + self.health - hit_damage);
		#/
		return hit_damage;
	}
	else if(mod == "MOD_PROJECTILE_SPLASH")
	{
		hit_damage = damage * 0.2;
		i_num_armor_pieces = 0;
		if(isdefined(level.mechz_faceplate_damage_override))
		{
			self [[level.mechz_faceplate_damage_override]](inflictor, attacker, damage, dFlags, mod, weapon, point, dir, hitLoc, offsetTime, boneIndex, modelIndex);
		}
		if(self.has_right_shoulder_armor === 1)
		{
			i_num_armor_pieces = i_num_armor_pieces + 1;
			right_shoulder_index = i_num_armor_pieces;
		}
		if(self.has_left_shoulder_armor === 1)
		{
			i_num_armor_pieces = i_num_armor_pieces + 1;
			left_shoulder_index = i_num_armor_pieces;
		}
		if(self.has_right_knee_armor === 1)
		{
			i_num_armor_pieces = i_num_armor_pieces + 1;
			right_knee_index = i_num_armor_pieces;
		}
		if(self.has_left_knee_armor === 1)
		{
			i_num_armor_pieces = i_num_armor_pieces + 1;
			left_knee_index = i_num_armor_pieces;
		}
		if(i_num_armor_pieces > 0)
		{
			if(i_num_armor_pieces <= 1)
			{
				i_random = 0;
				continue;
			}
			i_random = RandomInt(i_num_armor_pieces - 1);
			i_random = i_random + 1;
			if(self.has_right_shoulder_armor === 1 && right_shoulder_index === i_random)
			{
				self mechz_track_rshoulder_armor_damage(damage);
			}
			if(self.has_left_shoulder_armor === 1 && left_shoulder_index === i_random)
			{
				self mechz_track_lshoulder_armor_damage(damage);
			}
			if(self.has_right_knee_armor === 1 && right_knee_index === i_random)
			{
				self mechz_track_rknee_armor_damage(damage);
			}
			if(self.has_left_knee_armor === 1 && left_knee_index === i_random)
			{
				self mechz_track_lknee_armor_damage(damage);
			}
		}
		else if(self.powercap_covered === 1)
		{
			self mechz_track_powercap_cover_damage(damage * 0.5);
		}
		if(self.has_faceplate == 1)
		{
			self mechz_track_faceplate_damage(damage * 0.5);
		}
		/#
			IPrintLnBold("Dev Block strings are not supported" + hit_damage + "Dev Block strings are not supported" + self.health - hit_damage);
		#/
		return hit_damage;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: mechzWeaponDamageModifier
	Namespace: MechzServerUtils
	Checksum: 0x8AB9A10F
	Offset: 0x4CB0
	Size: 0x150
	Parameters: 2
	Flags: Private
	Line Number: 1703
*/
function private mechzWeaponDamageModifier(damage, weapon)
{
	if(isdefined(weapon) && isdefined(weapon.name))
	{
		if(IsSubStr(weapon.name, "shotgun_fullauto"))
		{
			return damage * 0.5;
		}
		if(IsSubStr(weapon.name, "lmg_cqb"))
		{
			return damage * 0.65;
		}
		if(IsSubStr(weapon.name, "lmg_heavy"))
		{
			return damage * 0.65;
		}
		if(IsSubStr(weapon.name, "shotgun_precision"))
		{
			return damage * 0.65;
		}
		if(IsSubStr(weapon.name, "shotgun_semiauto"))
		{
			return damage * 0.75;
		}
	}
	return damage;
}

/*
	Name: mechz_play_pain_audio
	Namespace: MechzServerUtils
	Checksum: 0xEC1FB074
	Offset: 0x4E08
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1741
*/
function mechz_play_pain_audio()
{
	self playsound("zmb_ai_mechz_destruction");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: show_hit_marker
	Namespace: MechzServerUtils
	Checksum: 0x43E9DE30
	Offset: 0x4E38
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1758
*/
function show_hit_marker()
{
	if(isdefined(self) && isdefined(self.hud_damagefeedback))
	{
		self.hud_damagefeedback SetShader("damage_feedback", 24, 48);
		self.hud_damagefeedback.alpha = 1;
		self.hud_damagefeedback fadeOverTime(1);
		self.hud_damagefeedback.alpha = 0;
	}
}

/*
	Name: hide_part
	Namespace: MechzServerUtils
	Checksum: 0xDE38AFF0
	Offset: 0x4EC8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1779
*/
function hide_part(strTag)
{
	if(self HasPart(strTag))
	{
		self HidePart(strTag);
	}
}

/*
	Name: mechz_track_faceplate_damage
	Namespace: MechzServerUtils
	Checksum: 0xB11C897
	Offset: 0x4F10
	Size: 0x170
	Parameters: 1
	Flags: None
	Line Number: 1797
*/
function mechz_track_faceplate_damage(damage)
{
	self.faceplate_health = self.faceplate_health - damage;
	if(self.faceplate_health <= 0)
	{
		self hide_part("j_faceplate");
		if(self.classname == "actor_spawner_zm_tomb_mechz")
		{
			continue;
		}
		self clientfield::set("mechz_faceplate_detached", 1);
		self.has_faceplate = 0;
		self mechz_turn_off_headlamp();
		self.partDestroyed = 1;
		blackboard::SetBlackBoardAttribute(self, "_mechz_part", "mechz_faceplate");
		self MechzBehavior::mechzGoBerserk();
		level notify("mechz_faceplate_detached", 2);
		if(isdefined(self.attacker) && zm_utility::is_player_valid(self.attacker) && !self.attacker laststand::player_is_in_laststand())
		{
			self.attacker zm_score::add_to_player_score(level.mechz_points_for_helmet);
		}
	}
}

/*
	Name: mechz_track_powercap_cover_damage
	Namespace: MechzServerUtils
	Checksum: 0x2F8197EA
	Offset: 0x5088
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 1831
*/
function mechz_track_powercap_cover_damage(damage)
{
	self.powercap_cover_health = self.powercap_cover_health - damage;
	if(self.powercap_cover_health <= 0)
	{
		self hide_part("tag_powersupply");
		self clientfield::set("mechz_powercap_detached", 1);
		self.powercap_covered = 0;
		self.partDestroyed = 1;
		blackboard::SetBlackBoardAttribute(self, "_mechz_part", "mechz_powercore");
		if(isdefined(self.attacker) && zm_utility::is_player_valid(self.attacker) && !self.attacker laststand::player_is_in_laststand())
		{
			self.attacker zm_score::add_to_player_score(level.mechz_points_for_powerplant);
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: mechz_track_powercap_damage
	Namespace: MechzServerUtils
	Checksum: 0xF8FCBDDC
	Offset: 0x51A8
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 1860
*/
function mechz_track_powercap_damage(damage)
{
	self.powercap_health = self.powercap_health - damage;
	if(self.powercap_health <= 0)
	{
		if(isdefined(level.mechz_powercap_destroyed_callback))
		{
			self [[level.mechz_powercap_destroyed_callback]]();
		}
		self hide_part("tag_gun_spin");
		self hide_part("tag_gun_barrel1");
		self hide_part("tag_gun_barrel2");
		self hide_part("tag_gun_barrel3");
		self hide_part("tag_gun_barrel4");
		self hide_part("tag_gun_barrel5");
		self hide_part("tag_gun_barrel6");
		if(self.classname == "actor_spawner_zm_tomb_mechz")
		{
			continue;
		}
		self clientfield::set("mechz_claw_detached", 1);
		self.has_powercap = 0;
		self.gun_attached = 0;
		self.partDestroyed = 1;
		blackboard::SetBlackBoardAttribute(self, "_mechz_part", "mechz_gun");
		level notify("mechz_gun_detached", 2);
	}
}

/*
	Name: mechz_track_rknee_armor_damage
	Namespace: MechzServerUtils
	Checksum: 0xA6353164
	Offset: 0x5378
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1899
*/
function mechz_track_rknee_armor_damage(damage)
{
	self.right_knee_armor_health = self.right_knee_armor_health - damage;
	if(self.right_knee_armor_health <= 0)
	{
		self hide_part("j_knee_attach_ri");
		self clientfield::set("mechz_rknee_armor_detached", 1);
		self.has_right_knee_armor = 0;
	}
}

/*
	Name: mechz_track_lknee_armor_damage
	Namespace: MechzServerUtils
	Checksum: 0xD6C0BF68
	Offset: 0x53F8
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1920
*/
function mechz_track_lknee_armor_damage(damage)
{
	self.left_knee_armor_health = self.left_knee_armor_health - damage;
	if(self.left_knee_armor_health <= 0)
	{
		self hide_part("j_knee_attach_le");
		self clientfield::set("mechz_lknee_armor_detached", 1);
		self.has_left_knee_armor = 0;
	}
}

/*
	Name: mechz_track_rshoulder_armor_damage
	Namespace: MechzServerUtils
	Checksum: 0xFF797725
	Offset: 0x5478
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1941
*/
function mechz_track_rshoulder_armor_damage(damage)
{
	self.right_shoulder_armor_health = self.right_shoulder_armor_health - damage;
	if(self.right_shoulder_armor_health <= 0)
	{
		self hide_part("j_shoulderarmor_ri");
		self clientfield::set("mechz_rshoulder_armor_detached", 1);
		self.has_right_shoulder_armor = 0;
	}
}

/*
	Name: mechz_track_lshoulder_armor_damage
	Namespace: MechzServerUtils
	Checksum: 0x3D8DD5A2
	Offset: 0x54F8
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1962
*/
function mechz_track_lshoulder_armor_damage(damage)
{
	self.left_shoulder_armor_health = self.left_shoulder_armor_health - damage;
	if(self.left_shoulder_armor_health <= 0)
	{
		self hide_part("j_shoulderarmor_le");
		self clientfield::set("mechz_lshoulder_armor_detached", 1);
		self.has_left_shoulder_armor = 0;
	}
}

/*
	Name: mechzCheckInArc
	Namespace: MechzServerUtils
	Checksum: 0x84A0C992
	Offset: 0x5578
	Size: 0x228
	Parameters: 2
	Flags: None
	Line Number: 1983
*/
function mechzCheckInArc(right_offset, aim_tag)
{
	origin = self.origin;
	angles = self.angles;
	if(isdefined(aim_tag))
	{
		origin = self GetTagOrigin(aim_tag);
		angles = self GetTagAngles(aim_tag);
	}
	if(isdefined(right_offset))
	{
		right_angle = AnglesToRight(angles);
		origin = origin + right_angle * right_offset;
	}
	facing_vec = AnglesToForward(angles);
	enemy_vec = self.favoriteenemy.origin - origin;
	enemy_yaw_vec = (enemy_vec[0], enemy_vec[1], 0);
	facing_yaw_vec = (facing_vec[0], facing_vec[1], 0);
	enemy_yaw_vec = VectorNormalize(enemy_yaw_vec);
	facing_yaw_vec = VectorNormalize(facing_yaw_vec);
	enemy_dot = VectorDot(facing_yaw_vec, enemy_yaw_vec);
	if(enemy_dot < 0.5)
	{
		return 0;
	}
	enemy_angles = VectorToAngles(enemy_vec);
	if(Abs(AngleClamp180(enemy_angles[0])) > 60)
	{
		return 0;
	}
	return 1;
}

/*
	Name: mechzGrenadeCheckInArc
	Namespace: MechzServerUtils
	Checksum: 0xEA43061F
	Offset: 0x57A8
	Size: 0x1C8
	Parameters: 1
	Flags: Private
	Line Number: 2026
*/
function private mechzGrenadeCheckInArc(right_offset)
{
	origin = self.origin;
	if(isdefined(right_offset))
	{
		right_angle = AnglesToRight(self.angles);
		origin = origin + right_angle * right_offset;
	}
	facing_vec = AnglesToForward(self.angles);
	enemy_vec = self.favoriteenemy.origin - origin;
	enemy_yaw_vec = (enemy_vec[0], enemy_vec[1], 0);
	facing_yaw_vec = (facing_vec[0], facing_vec[1], 0);
	enemy_yaw_vec = VectorNormalize(enemy_yaw_vec);
	facing_yaw_vec = VectorNormalize(facing_yaw_vec);
	enemy_dot = VectorDot(facing_yaw_vec, enemy_yaw_vec);
	if(enemy_dot < 0.5)
	{
		return 0;
	}
	enemy_angles = VectorToAngles(enemy_vec);
	if(Abs(AngleClamp180(enemy_angles[0])) > 60)
	{
		return 0;
	}
	return 1;
}

/*
	Name: mechz_turn_off_headlamp
	Namespace: MechzServerUtils
	Checksum: 0x8EE36A96
	Offset: 0x5978
	Size: 0x64
	Parameters: 1
	Flags: None
	Line Number: 2063
*/
function mechz_turn_off_headlamp(headlamp_broken)
{
	if(headlamp_broken !== 1)
	{
		self clientfield::set("mechz_headlamp_off", 1);
		continue;
	}
	self clientfield::set("mechz_headlamp_off", 2);
}

