#include scripts\codescripts\struct;
#include scripts\shared\ai\archetype_mocomps_utility;
#include scripts\shared\ai\archetype_utility;
#include scripts\shared\ai\margwa;
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
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\util_shared;

#namespace MargwaBehavior;

/*
	Name: init
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0xBA8
	Size: 0x378
	Parameters: 0
	Flags: AutoExec
	Line Number: 34
*/
function autoexec init()
{
	InitMargwaBehaviorsAndASM();
	spawner::add_archetype_spawn_function("margwa", &ArchetypeMargwaBlackboardInit);
	spawner::add_archetype_spawn_function("margwa", &MargwaServerUtils::margwaSpawnSetup);
	clientfield::register("actor", "margwa_head_left", 1, 2, "int");
	clientfield::register("actor", "margwa_head_mid", 1, 2, "int");
	clientfield::register("actor", "margwa_head_right", 1, 2, "int");
	clientfield::register("actor", "margwa_fx_in", 1, 1, "counter");
	clientfield::register("actor", "margwa_fx_out", 1, 1, "counter");
	clientfield::register("actor", "margwa_fx_spawn", 1, 1, "counter");
	clientfield::register("actor", "margwa_smash", 1, 1, "counter");
	clientfield::register("actor", "margwa_head_left_hit", 1, 1, "counter");
	clientfield::register("actor", "margwa_head_mid_hit", 1, 1, "counter");
	clientfield::register("actor", "margwa_head_right_hit", 1, 1, "counter");
	clientfield::register("actor", "margwa_head_killed", 1, 2, "int");
	clientfield::register("actor", "margwa_jaw", 1, 6, "int");
	clientfield::register("toplayer", "margwa_head_explosion", 1, 1, "counter");
	clientfield::register("scriptmover", "margwa_fx_travel", 1, 1, "int");
	clientfield::register("scriptmover", "margwa_fx_travel_tell", 1, 1, "int");
	clientfield::register("actor", "supermargwa", 1, 1, "int");
	InitDirectHitWeapons();
}

/*
	Name: InitDirectHitWeapons
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0xF28
	Size: 0xE0
	Parameters: 0
	Flags: Private
	Line Number: 68
*/
function private InitDirectHitWeapons()
{
	if(!isdefined(level.dhWeapons))
	{
		level.dhWeapons = [];
	}
	level.dhWeapons[level.dhWeapons.size] = "ray_gun";
	level.dhWeapons[level.dhWeapons.size] = "ray_gun_upgraded";
	level.dhWeapons[level.dhWeapons.size] = "pistol_standard_upgraded";
	level.dhWeapons[level.dhWeapons.size] = "pistol_revolver38_upgraded";
	level.dhWeapons[level.dhWeapons.size] = "pistol_revolver38lh_upgraded";
	level.dhWeapons[level.dhWeapons.size] = "launcher_standard";
	level.dhWeapons[level.dhWeapons.size] = "launcher_standard_upgraded";
}

/*
	Name: AddDirectHitWeapon
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x1010
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 93
*/
function AddDirectHitWeapon(weaponName)
{
	foreach(weapon in level.dhWeapons)
	{
		if(weapon == weaponName)
		{
			return;
		}
	}
	level.dhWeapons[level.dhWeapons.size] = weaponName;
}

/*
	Name: InitMargwaBehaviorsAndASM
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x10C0
	Size: 0x658
	Parameters: 0
	Flags: Private
	Line Number: 115
*/
function private InitMargwaBehaviorsAndASM()
{
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaTargetService", &margwaTargetService);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaShouldSmashAttack", &margwaShouldSmashAttack);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaShouldSwipeAttack", &margwaShouldSwipeAttack);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaShouldShowPain", &margwaShouldShowPain);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaShouldReactStun", &margwaShouldReactStun);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaShouldReactIDGun", &margwaShouldReactIDGun);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaShouldReactSword", &margwaShouldReactSword);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaShouldSpawn", &margwaShouldSpawn);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaShouldFreeze", &margwaShouldFreeze);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaShouldTeleportIn", &margwaShouldTeleportIn);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaShouldTeleportOut", &margwaShouldTeleportOut);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaShouldWait", &margwaShouldWait);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaShouldReset", &margwaShouldReset);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeAction("margwaReactStunAction", &margwaReactStunAction, undefined, undefined);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeAction("margwaSwipeAttackAction", &margwaSwipeAttackAction, &margwaSwipeAttackActionUpdate, undefined);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaIdleStart", &margwaIdleStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaMoveStart", &margwaMoveStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaTraverseActionStart", &margwaTraverseActionStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaTeleportInStart", &margwaTeleportInStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaTeleportInTerminate", &margwaTeleportInTerminate);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaTeleportOutStart", &margwaTeleportOutStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaTeleportOutTerminate", &margwaTeleportOutTerminate);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaPainStart", &margwaPainStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaPainTerminate", &margwaPainTerminate);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaReactStunStart", &margwaReactStunStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaReactStunTerminate", &margwaReactStunTerminate);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaReactIDGunStart", &margwaReactIDGunStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaReactIDGunTerminate", &margwaReactIDGunTerminate);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaReactSwordStart", &margwaReactSwordStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaReactSwordTerminate", &margwaReactSwordTerminate);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaSpawnStart", &margwaSpawnStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaSmashAttackStart", &margwaSmashAttackStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaSmashAttackTerminate", &margwaSmashAttackTerminate);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaSwipeAttackStart", &margwaSwipeAttackStart);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("margwaSwipeAttackTerminate", &margwaSwipeAttackTerminate);
	AnimationStateNetwork::RegisterAnimationMocomp("mocomp_teleport_traversal@margwa", &mocompMargwaTeleportTraversalInit, &mocompMargwaTeleportTraversalUpdate, &mocompMargwaTeleportTraversalTerminate);
	AnimationStateNetwork::RegisterNotetrackHandlerFunction("margwa_smash_attack", &margwaNotetrackSmashAttack);
	AnimationStateNetwork::RegisterNotetrackHandlerFunction("margwa_bodyfall large", &margwaNotetrackBodyfall);
	AnimationStateNetwork::RegisterNotetrackHandlerFunction("margwa_melee_fire", &margwaNotetrackPainMelee);
	return;
}

/*
	Name: ArchetypeMargwaBlackboardInit
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x1720
	Size: 0x150
	Parameters: 0
	Flags: Private
	Line Number: 169
*/
function private ArchetypeMargwaBlackboardInit()
{
	blackboard::CreateBlackBoardForEntity(self);
	self AiUtility::RegisterUtilityBlackboardAttributes();
	blackboard::RegisterBlackBoardAttribute(self, "_locomotion_speed", "locomotion_speed_walk", undefined);
	blackboard::RegisterBlackBoardAttribute(self, "_board_attack_spot", undefined, undefined);
	blackboard::RegisterBlackBoardAttribute(self, "_locomotion_should_turn", "should_not_turn", &BB_GetShouldTurn);
	blackboard::RegisterBlackBoardAttribute(self, "_zombie_damageweapon_type", "regular", undefined);
	self.___ArchetypeOnAnimscriptedCallback = &ArchetypeMargwaOnAnimscriptedCallback;
}

/*
	Name: ArchetypeMargwaOnAnimscriptedCallback
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x1878
	Size: 0x38
	Parameters: 1
	Flags: Private
	Line Number: 190
*/
function private ArchetypeMargwaOnAnimscriptedCallback(entity)
{
	entity.__blackboard = undefined;
	entity ArchetypeMargwaBlackboardInit();
}

/*
	Name: BB_GetShouldTurn
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x18B8
	Size: 0x30
	Parameters: 0
	Flags: Private
	Line Number: 206
*/
function private BB_GetShouldTurn()
{
	if(isdefined(self.should_turn) && self.should_turn)
	{
		return "should_turn";
	}
	return "should_not_turn";
}

/*
	Name: margwaNotetrackSmashAttack
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x18F0
	Size: 0x330
	Parameters: 1
	Flags: Private
	Line Number: 225
*/
function private margwaNotetrackSmashAttack(entity)
{
	players = GetPlayers();
	foreach(player in players)
	{
		smashPos = entity.origin + VectorScale(AnglesToForward(self.angles), 60);
		distSq = DistanceSquared(smashPos, player.origin);
		if(distSq < 20736)
		{
			if(!IsGodMode(player))
			{
				if(isdefined(player.hasRiotShield) && player.hasRiotShield)
				{
					damageShield = 0;
					attackDir = player.origin - self.origin;
					if(isdefined(player.hasRiotShieldEquipped) && player.hasRiotShieldEquipped)
					{
						if(player MargwaServerUtils::shieldFacing(attackDir, 0.2))
						{
							damageShield = 1;
						}
					}
					else if(player MargwaServerUtils::shieldFacing(attackDir, 0.2, 0))
					{
						damageShield = 1;
					}
					if(damageShield)
					{
						self clientfield::increment("margwa_smash");
						shield_damage = level.weaponRiotshield.weaponstarthitpoints;
						if(isdefined(player.weaponRiotshield))
						{
							shield_damage = player.weaponRiotshield.weaponstarthitpoints;
						}
						player [[player.player_shield_apply_damage]](shield_damage, 0);
						continue;
					}
				}
				if(isdefined(level.margwa_smash_damage_callback) && IsFunctionPtr(level.margwa_smash_damage_callback))
				{
					if(player [[level.margwa_smash_damage_callback]](self))
					{
						continue;
					}
				}
				self clientfield::increment("margwa_smash");
				player DoDamage(166, self.origin, self);
			}
		}
	}
	if(isdefined(self.smashAttackCB))
	{
		self [[self.smashAttackCB]]();
	}
}

/*
	Name: margwaNotetrackBodyfall
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x1C28
	Size: 0x50
	Parameters: 1
	Flags: Private
	Line Number: 291
*/
function private margwaNotetrackBodyfall(entity)
{
	if(self.archetype == "margwa")
	{
		entity ghost();
		if(isdefined(self.bodyfallCB))
		{
			self [[self.bodyfallCB]]();
		}
	}
}

/*
	Name: margwaNotetrackPainMelee
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x1C80
	Size: 0x28
	Parameters: 1
	Flags: Private
	Line Number: 313
*/
function private margwaNotetrackPainMelee(entity)
{
	entity melee();
}

/*
	Name: margwaTargetService
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x1CB0
	Size: 0x158
	Parameters: 1
	Flags: Private
	Line Number: 328
*/
function private margwaTargetService(entity)
{
	if(isdefined(entity.ignoreall) && entity.ignoreall)
	{
		return 0;
	}
	player = zombie_utility::get_closest_valid_player(self.origin, self.ignore_player);
	if(!isdefined(player))
	{
		if(isdefined(self.ignore_player))
		{
			if(isdefined(level._should_skip_ignore_player_logic) && [[level._should_skip_ignore_player_logic]]())
			{
				return;
			}
			self.ignore_player = [];
		}
		self SetGoal(self.origin);
		return 0;
	}
	else
	{
		targetPos = GetClosestPointOnNavMesh(player.origin, 64, 30);
		if(isdefined(targetPos))
		{
			entity SetGoal(targetPos);
			return 1;
		}
		else
		{
			entity SetGoal(entity.origin);
			return 0;
		}
	}
}

/*
	Name: margwaShouldSmashAttack
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x1E10
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 374
*/
function margwaShouldSmashAttack(entity)
{
	if(!isdefined(entity.enemy))
	{
		return 0;
	}
	if(!entity MargwaServerUtils::inSmashAttackRange(entity.enemy))
	{
		return 0;
	}
	yaw = Abs(zombie_utility::getYawToEnemy());
	if(yaw > 45)
	{
		return 0;
	}
	return 1;
}

/*
	Name: margwaShouldSwipeAttack
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x1EA8
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 402
*/
function margwaShouldSwipeAttack(entity)
{
	if(!isdefined(entity.enemy))
	{
		return 0;
	}
	if(DistanceSquared(entity.origin, entity.enemy.origin) > 16384)
	{
		return 0;
	}
	yaw = Abs(zombie_utility::getYawToEnemy());
	if(yaw > 45)
	{
		return 0;
	}
	return 1;
}

/*
	Name: margwaShouldShowPain
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x1F58
	Size: 0x100
	Parameters: 1
	Flags: Private
	Line Number: 430
*/
function private margwaShouldShowPain(entity)
{
	if(isdefined(entity.headDestroyed))
	{
		headInfo = entity.head[entity.headDestroyed];
		switch(headInfo.cf)
		{
			case "margwa_head_left":
			{
				blackboard::SetBlackBoardAttribute(self, "_margwa_head", "left");
				break;
			}
			case "margwa_head_mid":
			{
				blackboard::SetBlackBoardAttribute(self, "_margwa_head", "middle");
				break;
			}
			case "margwa_head_right":
			{
				blackboard::SetBlackBoardAttribute(self, "_margwa_head", "right");
				break;
			}
		}
		return 1;
	}
	return 0;
}

/*
	Name: margwaShouldReactStun
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2060
	Size: 0x40
	Parameters: 1
	Flags: Private
	Line Number: 468
*/
function private margwaShouldReactStun(entity)
{
	if(isdefined(entity.reactStun) && entity.reactStun)
	{
		return 1;
	}
	return 0;
}

/*
	Name: margwaShouldReactIDGun
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x20A8
	Size: 0x40
	Parameters: 1
	Flags: Private
	Line Number: 487
*/
function private margwaShouldReactIDGun(entity)
{
	if(isdefined(entity.reactIDGun) && entity.reactIDGun)
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: margwaShouldReactSword
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x20F0
	Size: 0x40
	Parameters: 1
	Flags: Private
	Line Number: 507
*/
function private margwaShouldReactSword(entity)
{
	if(isdefined(entity.reactSword) && entity.reactSword)
	{
		return 1;
	}
	return 0;
}

/*
	Name: margwaShouldSpawn
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2138
	Size: 0x40
	Parameters: 1
	Flags: Private
	Line Number: 526
*/
function private margwaShouldSpawn(entity)
{
	if(isdefined(entity.needSpawn) && entity.needSpawn)
	{
		return 1;
	}
	return 0;
}

/*
	Name: margwaShouldFreeze
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2180
	Size: 0x40
	Parameters: 1
	Flags: Private
	Line Number: 545
*/
function private margwaShouldFreeze(entity)
{
	if(isdefined(entity.isFrozen) && entity.isFrozen)
	{
		return 1;
	}
	return 0;
	ERROR: Bad function call
}

/*
	Name: margwaShouldTeleportIn
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x21C8
	Size: 0x40
	Parameters: 1
	Flags: Private
	Line Number: 565
*/
function private margwaShouldTeleportIn(entity)
{
	if(isdefined(entity.needTeleportIn) && entity.needTeleportIn)
	{
		return 1;
	}
	return 0;
}

/*
	Name: margwaShouldTeleportOut
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2210
	Size: 0x40
	Parameters: 1
	Flags: Private
	Line Number: 584
*/
function private margwaShouldTeleportOut(entity)
{
	if(isdefined(entity.needTeleportOut) && entity.needTeleportOut)
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: margwaShouldWait
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2258
	Size: 0x40
	Parameters: 1
	Flags: Private
	Line Number: 605
*/
function private margwaShouldWait(entity)
{
	if(isdefined(entity.waiting) && entity.waiting)
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: margwaShouldReset
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x22A0
	Size: 0xB0
	Parameters: 1
	Flags: Private
	Line Number: 625
*/
function private margwaShouldReset(entity)
{
	if(isdefined(entity.headDestroyed))
	{
		return 1;
	}
	if(isdefined(entity.reactIDGun) && entity.reactIDGun)
	{
		return 1;
	}
	if(isdefined(entity.reactSword) && entity.reactSword)
	{
		return 1;
	}
	if(isdefined(entity.reactStun) && entity.reactStun)
	{
		return 1;
	}
	return 0;
}

/*
	Name: margwaReactStunAction
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2358
	Size: 0xF0
	Parameters: 2
	Flags: Private
	Line Number: 656
*/
function private margwaReactStunAction(entity, asmStateName)
{
	AnimationStateNetworkUtility::RequestState(entity, asmStateName);
	stunActionAST = entity ASTSearch(istring(asmStateName));
	stunActionAnimation = AnimationStateNetworkUtility::SearchAnimationMap(entity, stunActionAST["animation"]);
	closeTime = getanimlength(stunActionAnimation) * 1000;
	entity MargwaServerUtils::margwaCloseAllHeads(closeTime);
	margwaReactStunStart(entity);
	return 5;
}

/*
	Name: margwaSwipeAttackAction
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2450
	Size: 0xE8
	Parameters: 2
	Flags: Private
	Line Number: 677
*/
function private margwaSwipeAttackAction(entity, asmStateName)
{
	AnimationStateNetworkUtility::RequestState(entity, asmStateName);
	if(!isdefined(entity.swipe_end_time))
	{
		swipeActionAST = entity ASTSearch(istring(asmStateName));
		swipeActionAnimation = AnimationStateNetworkUtility::SearchAnimationMap(entity, swipeActionAST["animation"]);
		swipeActionTime = getanimlength(swipeActionAnimation) * 1000;
		entity.swipe_end_time = GetTime() + swipeActionTime;
	}
	return 5;
}

/*
	Name: margwaSwipeAttackActionUpdate
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2540
	Size: 0x48
	Parameters: 2
	Flags: Private
	Line Number: 700
*/
function private margwaSwipeAttackActionUpdate(entity, asmStateName)
{
	if(isdefined(entity.swipe_end_time) && GetTime() > entity.swipe_end_time)
	{
		return 4;
	}
	return 5;
}

/*
	Name: margwaIdleStart
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2590
	Size: 0x48
	Parameters: 1
	Flags: Private
	Line Number: 719
*/
function private margwaIdleStart(entity)
{
	if(entity MargwaServerUtils::shouldUpdateJaw())
	{
		entity clientfield::set("margwa_jaw", 1);
	}
}

/*
	Name: margwaMoveStart
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x25E0
	Size: 0x90
	Parameters: 1
	Flags: Private
	Line Number: 737
*/
function private margwaMoveStart(entity)
{
	if(entity MargwaServerUtils::shouldUpdateJaw())
	{
		if(entity.zombie_move_speed == "run")
		{
			entity clientfield::set("margwa_jaw", 13);
		}
		else
		{
			entity clientfield::set("margwa_jaw", 7);
		}
	}
}

/*
	Name: margwaDeathAction
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2678
	Size: 0x10
	Parameters: 1
	Flags: Private
	Line Number: 762
*/
function private margwaDeathAction(entity)
{
}

/*
	Name: margwaTraverseActionStart
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2690
	Size: 0x150
	Parameters: 1
	Flags: Private
	Line Number: 776
*/
function private margwaTraverseActionStart(entity)
{
	blackboard::SetBlackBoardAttribute(entity, "_traversal_type", entity.traverseStartNode.animscript);
	if(isdefined(entity.traverseStartNode.animscript))
	{
		if(entity MargwaServerUtils::shouldUpdateJaw())
		{
			switch(entity.traverseStartNode.animscript)
			{
				case "jump_down_36":
				{
					entity clientfield::set("margwa_jaw", 21);
					break;
				}
				case "jump_down_96":
				{
					entity clientfield::set("margwa_jaw", 22);
					break;
				}
				case "jump_up_36":
				{
					entity clientfield::set("margwa_jaw", 24);
					break;
				}
				case "jump_up_96":
				{
					entity clientfield::set("margwa_jaw", 25);
					break;
				}
			}
			return;
		}
	}
}

/*
	Name: margwaTeleportInStart
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x27E8
	Size: 0x158
	Parameters: 1
	Flags: Private
	Line Number: 821
*/
function private margwaTeleportInStart(entity)
{
	entity Unlink();
	if(isdefined(entity.teleportPos))
	{
		entity ForceTeleport(entity.teleportPos);
	}
	entity show();
	entity PathMode("move allowed");
	entity.needTeleportIn = 0;
	blackboard::SetBlackBoardAttribute(self, "_margwa_teleport", "in");
	if(isdefined(self.traveler))
	{
		self.traveler clientfield::set("margwa_fx_travel", 0);
	}
	self clientfield::increment("margwa_fx_in", 1);
	if(entity MargwaServerUtils::shouldUpdateJaw())
	{
		entity clientfield::set("margwa_jaw", 17);
	}
}

/*
	Name: margwaTeleportInTerminate
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2948
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 853
*/
function margwaTeleportInTerminate(entity)
{
	if(isdefined(self.traveler))
	{
		self.traveler clientfield::set("margwa_fx_travel", 0);
	}
	entity.isTeleporting = 0;
}

/*
	Name: margwaTeleportOutStart
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x29A0
	Size: 0xD0
	Parameters: 1
	Flags: Private
	Line Number: 872
*/
function private margwaTeleportOutStart(entity)
{
	entity.needTeleportOut = 0;
	entity.isTeleporting = 1;
	entity.teleportStart = entity.origin;
	blackboard::SetBlackBoardAttribute(self, "_margwa_teleport", "out");
	self clientfield::increment("margwa_fx_out", 1);
	if(entity MargwaServerUtils::shouldUpdateJaw())
	{
		entity clientfield::set("margwa_jaw", 18);
	}
}

/*
	Name: margwaTeleportOutTerminate
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2A78
	Size: 0x138
	Parameters: 1
	Flags: Private
	Line Number: 895
*/
function private margwaTeleportOutTerminate(entity)
{
	if(isdefined(entity.traveler))
	{
		entity.traveler.origin = entity GetTagOrigin("j_spine_1");
		entity.traveler clientfield::set("margwa_fx_travel", 1);
	}
	entity ghost();
	entity PathMode("dont move");
	if(isdefined(entity.traveler))
	{
		entity LinkTo(entity.traveler);
	}
	if(isdefined(entity.margwaWait))
	{
		entity thread [[entity.margwaWait]]();
	}
	else
	{
		entity thread MargwaServerUtils::margwaWait();
	}
}

/*
	Name: margwaPainStart
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2BB8
	Size: 0x130
	Parameters: 1
	Flags: Private
	Line Number: 928
*/
function private margwaPainStart(entity)
{
	entity notify("stop_head_update");
	if(entity MargwaServerUtils::shouldUpdateJaw())
	{
		head = blackboard::GetBlackBoardAttribute(self, "_margwa_head");
		switch(head)
		{
			case "left":
			{
				entity clientfield::set("margwa_jaw", 3);
				break;
			}
			case "middle":
			{
				entity clientfield::set("margwa_jaw", 4);
				break;
			}
			case "right":
			{
				entity clientfield::set("margwa_jaw", 5);
				break;
			}
		}
	}
	entity.headDestroyed = undefined;
	entity.canStun = 0;
	entity.canDamage = 0;
}

/*
	Name: margwaPainTerminate
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2CF0
	Size: 0xA0
	Parameters: 1
	Flags: Private
	Line Number: 968
*/
function private margwaPainTerminate(entity)
{
	entity.headDestroyed = undefined;
	entity.canStun = 1;
	entity.canDamage = 1;
	entity MargwaServerUtils::margwaCloseAllHeads(5000);
	entity clearPath();
	if(isdefined(entity.margwaPainTerminateCB))
	{
		entity [[entity.margwaPainTerminateCB]]();
	}
}

/*
	Name: margwaReactStunStart
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2D98
	Size: 0x68
	Parameters: 1
	Flags: Private
	Line Number: 991
*/
function private margwaReactStunStart(entity)
{
	entity.reactStun = undefined;
	entity.canStun = 0;
	if(entity MargwaServerUtils::shouldUpdateJaw())
	{
		entity clientfield::set("margwa_jaw", 6);
	}
}

/*
	Name: margwaReactStunTerminate
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2E08
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 1011
*/
function margwaReactStunTerminate(entity)
{
	entity.canStun = 1;
}

/*
	Name: margwaReactIDGunStart
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2E30
	Size: 0x140
	Parameters: 1
	Flags: Private
	Line Number: 1026
*/
function private margwaReactIDGunStart(entity)
{
	entity.reactIDGun = undefined;
	entity.canStun = 0;
	isPacked = 0;
	if(blackboard::GetBlackBoardAttribute(entity, "_zombie_damageweapon_type") == "regular")
	{
		if(entity MargwaServerUtils::shouldUpdateJaw())
		{
			entity clientfield::set("margwa_jaw", 8);
		}
		entity MargwaServerUtils::margwaCloseAllHeads(5000);
	}
	else if(entity MargwaServerUtils::shouldUpdateJaw())
	{
		entity clientfield::set("margwa_jaw", 9);
	}
	entity MargwaServerUtils::margwaCloseAllHeads(10000);
	isPacked = 1;
	if(isdefined(entity.idgun_damage))
	{
		entity [[entity.idgun_damage]](isPacked);
		return;
	}
	ERROR: Bad function call
}

/*
	Name: margwaReactIDGunTerminate
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2F78
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 1063
*/
function margwaReactIDGunTerminate(entity)
{
	entity.canStun = 1;
	blackboard::SetBlackBoardAttribute(entity, "_zombie_damageweapon_type", "regular");
}

/*
	Name: margwaReactSwordStart
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x2FC8
	Size: 0x58
	Parameters: 1
	Flags: Private
	Line Number: 1079
*/
function private margwaReactSwordStart(entity)
{
	entity.reactSword = undefined;
	entity.canStun = 0;
	if(isdefined(entity.head_chopper))
	{
		entity.head_chopper notify("react_sword");
	}
}

/*
	Name: margwaReactSwordTerminate
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x3028
	Size: 0x20
	Parameters: 1
	Flags: Private
	Line Number: 1099
*/
function private margwaReactSwordTerminate(entity)
{
	entity.canStun = 1;
}

/*
	Name: margwaSpawnStart
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x3050
	Size: 0x20
	Parameters: 1
	Flags: Private
	Line Number: 1114
*/
function private margwaSpawnStart(entity)
{
	entity.needSpawn = 0;
}

/*
	Name: margwaSmashAttackStart
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x3078
	Size: 0x60
	Parameters: 1
	Flags: Private
	Line Number: 1129
*/
function private margwaSmashAttackStart(entity)
{
	entity MargwaServerUtils::margwaHeadSmash();
	if(entity MargwaServerUtils::shouldUpdateJaw())
	{
		entity clientfield::set("margwa_jaw", 14);
	}
}

/*
	Name: margwaSmashAttackTerminate
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x30E0
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 1148
*/
function margwaSmashAttackTerminate(entity)
{
	entity MargwaServerUtils::margwaCloseAllHeads();
	return;
}

/*
	Name: margwaSwipeAttackStart
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x3110
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 1164
*/
function margwaSwipeAttackStart(entity)
{
	if(entity MargwaServerUtils::shouldUpdateJaw())
	{
		entity clientfield::set("margwa_jaw", 16);
	}
}

/*
	Name: margwaSwipeAttackTerminate
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x3160
	Size: 0x28
	Parameters: 1
	Flags: Private
	Line Number: 1182
*/
function private margwaSwipeAttackTerminate(entity)
{
	entity MargwaServerUtils::margwaCloseAllHeads();
}

/*
	Name: mocompMargwaTeleportTraversalInit
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x3190
	Size: 0x148
	Parameters: 5
	Flags: Private
	Line Number: 1197
*/
function private mocompMargwaTeleportTraversalInit(entity, mocompAnim, mocompAnimBlendOutTime, mocompAnimFlag, mocompDuration)
{
	entity OrientMode("face angle", entity.angles[1]);
	entity animmode("normal");
	if(isdefined(entity.traverseEndNode))
	{
		entity.teleportStart = entity.origin;
		entity.teleportPos = entity.traverseEndNode.origin;
		self clientfield::increment("margwa_fx_out", 1);
		if(isdefined(entity.traverseStartNode))
		{
			if(isdefined(entity.traverseStartNode.speed))
			{
				self.margwa_teleport_speed = entity.traverseStartNode.speed;
			}
		}
	}
}

/*
	Name: mocompMargwaTeleportTraversalUpdate
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x32E0
	Size: 0x30
	Parameters: 5
	Flags: Private
	Line Number: 1226
*/
function private mocompMargwaTeleportTraversalUpdate(entity, mocompAnim, mocompAnimBlendOutTime, mocompAnimFlag, mocompDuration)
{
}

/*
	Name: mocompMargwaTeleportTraversalTerminate
	Namespace: MargwaBehavior
	Checksum: 0x424F4353
	Offset: 0x3318
	Size: 0x48
	Parameters: 5
	Flags: Private
	Line Number: 1240
*/
function private mocompMargwaTeleportTraversalTerminate(entity, mocompAnim, mocompAnimBlendOutTime, mocompAnimFlag, mocompDuration)
{
	margwaTeleportOutTerminate(entity);
}

#namespace MargwaServerUtils;

/*
	Name: margwaSpawnSetup
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x3368
	Size: 0x228
	Parameters: 0
	Flags: Private
	Line Number: 1257
*/
function private margwaSpawnSetup()
{
	self DisableAimAssist();
	self.disableAmmoDrop = 1;
	self.no_gib = 1;
	self.ignore_nuke = 1;
	self.ignore_enemy_count = 1;
	self.ignore_round_robbin_death = 1;
	self.zombie_move_speed = "walk";
	self.overrideActorDamage = &margwaDamage;
	self.canDamage = 1;
	self.headAttached = 3;
	self.headOpen = 0;
	self margwaInitHead("c_zom_margwa_chunks_le", "j_chunk_head_bone_le");
	self margwaInitHead("c_zom_margwa_chunks_mid", "j_chunk_head_bone");
	self margwaInitHead("c_zom_margwa_chunks_ri", "j_chunk_head_bone_ri");
	self.headHealthMax = 600;
	self margwaDisableStun();
	self.traveler = spawn("script_model", self.origin);
	self.traveler SetModel("tag_origin");
	self.traveler notsolid();
	self.travelerTell = spawn("script_model", self.origin);
	self.travelerTell SetModel("tag_origin");
	self.travelerTell notsolid();
	self thread margwaDeath();
	self.updateSight = 0;
	self.ignorerunAndgundist = 1;
}

/*
	Name: margwaDeath
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x3598
	Size: 0x80
	Parameters: 0
	Flags: Private
	Line Number: 1296
*/
function private margwaDeath()
{
	self waittill("death");
	if(isdefined(self.e_head_attacker))
	{
		self.e_head_attacker notify("margwa_kill");
	}
	if(isdefined(self.traveler))
	{
		self.traveler delete();
	}
	if(isdefined(self.travelerTell))
	{
		self.travelerTell delete();
	}
}

/*
	Name: margwaEnableStun
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x3620
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 1323
*/
function margwaEnableStun()
{
	self.canStun = 1;
}

/*
	Name: margwaDisableStun
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x3638
	Size: 0x10
	Parameters: 0
	Flags: Private
	Line Number: 1338
*/
function private margwaDisableStun()
{
	self.canStun = 0;
}

/*
	Name: margwaInitHead
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x3650
	Size: 0x458
	Parameters: 2
	Flags: Private
	Line Number: 1353
*/
function private margwaInitHead(Headmodel, headTag)
{
	model = Headmodel;
	model_gore = undefined;
	switch(Headmodel)
	{
		case "c_zom_margwa_chunks_le":
		{
			if(isdefined(level.margwa_head_left_model_override))
			{
				model = level.margwa_head_left_model_override;
				model_gore = level.margwa_gore_left_model_override;
				break;
			}
		}
		case "c_zom_margwa_chunks_mid":
		{
			if(isdefined(level.margwa_head_mid_model_override))
			{
				model = level.margwa_head_mid_model_override;
				model_gore = level.margwa_gore_mid_model_override;
				break;
			}
		}
		case "c_zom_margwa_chunks_ri":
		{
			if(isdefined(level.margwa_head_right_model_override))
			{
				model = level.margwa_head_right_model_override;
				model_gore = level.margwa_gore_right_model_override;
				break;
			}
		}
	}
	self Attach(model);
	if(!isdefined(self.head))
	{
		self.head = [];
	}
	self.head[model] = spawnstruct();
	self.head[model].model = model;
	self.head[model].tag = headTag;
	self.head[model].health = 600;
	self.head[model].canDamage = 0;
	self.head[model].open = 1;
	self.head[model].closed = 2;
	self.head[model].smash = 3;
	switch(Headmodel)
	{
		case "c_zom_margwa_chunks_le":
		{
			self.head[model].cf = "margwa_head_left";
			self.head[model].impactCF = "margwa_head_left_hit";
			self.head[model].gore = "c_zom_margwa_gore_le";
			if(isdefined(model_gore))
			{
				self.head[model].gore = model_gore;
			}
			self.head[model].killIndex = 1;
			self.head_left_model = model;
			break;
		}
		case "c_zom_margwa_chunks_mid":
		{
			self.head[model].cf = "margwa_head_mid";
			self.head[model].impactCF = "margwa_head_mid_hit";
			self.head[model].gore = "c_zom_margwa_gore_mid";
			if(isdefined(model_gore))
			{
				self.head[model].gore = model_gore;
			}
			self.head[model].killIndex = 2;
			self.head_mid_model = model;
			break;
		}
		case "c_zom_margwa_chunks_ri":
		{
			self.head[model].cf = "margwa_head_right";
			self.head[model].impactCF = "margwa_head_right_hit";
			self.head[model].gore = "c_zom_margwa_gore_ri";
			if(isdefined(model_gore))
			{
				self.head[model].gore = model_gore;
			}
			self.head[model].killIndex = 3;
			self.head_right_model = model;
			break;
		}
	}
	self thread margwaHeadUpdate(self.head[model]);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: margwaSetHeadHealth
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x3AB0
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 1457
*/
function margwaSetHeadHealth(health)
{
	self.headHealthMax = health;
	foreach(head in self.head)
	{
		head.health = health;
	}
}

/*
	Name: margwaResetHeadTime
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x3B58
	Size: 0x48
	Parameters: 2
	Flags: Private
	Line Number: 1476
*/
function private margwaResetHeadTime(min, max)
{
	time = GetTime() + randomIntRange(min, max);
	return time;
	ERROR: Bad function call
}

/*
	Name: margwaHeadCanOpen
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x3BA8
	Size: 0x40
	Parameters: 0
	Flags: Private
	Line Number: 1493
*/
function private margwaHeadCanOpen()
{
	if(self.headAttached > 1)
	{
		if(self.headOpen < self.headAttached - 1)
		{
			return 1;
		}
	}
	else
	{
		return 1;
	}
	return 0;
}

/*
	Name: margwaHeadUpdate
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x3BF0
	Size: 0x298
	Parameters: 1
	Flags: Private
	Line Number: 1519
*/
function private margwaHeadUpdate(headInfo)
{
	self endon("death");
	self endon("stop_head_update");
	headInfo notify("stop_head_update");
	headInfo endon("stop_head_update");
	while(1)
	{
		if(self IsPaused())
		{
			util::wait_network_frame();
			continue;
		}
		if(!isdefined(headInfo.closeTime))
		{
			if(self.headAttached == 1)
			{
				headInfo.closeTime = margwaResetHeadTime(500, 1000);
			}
			else
			{
				headInfo.closeTime = margwaResetHeadTime(1500, 3500);
			}
		}
		if(GetTime() > headInfo.closeTime && self margwaHeadCanOpen())
		{
			self.headOpen++;
			headInfo.closeTime = undefined;
		}
		else
		{
			util::wait_network_frame();
			continue;
		}
		self margwaHeadDamageDelay(headInfo, 1);
		self clientfield::set(headInfo.cf, headInfo.open);
		self PlaySoundOnTag("zmb_vocals_margwa_ambient", headInfo.tag);
		while(1)
		{
			if(!isdefined(headInfo.openTime))
			{
				headInfo.openTime = margwaResetHeadTime(3000, 5000);
			}
			if(GetTime() > headInfo.openTime)
			{
				self.headOpen--;
				headInfo.openTime = undefined;
				break;
			}
			else
			{
				util::wait_network_frame();
				continue;
			}
		}
		self margwaHeadDamageDelay(headInfo, 0);
		self clientfield::set(headInfo.cf, headInfo.closed);
	}
}

/*
	Name: margwaHeadDamageDelay
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x3E90
	Size: 0x40
	Parameters: 2
	Flags: Private
	Line Number: 1589
*/
function private margwaHeadDamageDelay(headInfo, canDamage)
{
	self endon("death");
	wait(0.1);
	headInfo.canDamage = canDamage;
}

/*
	Name: margwaHeadSmash
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x3ED8
	Size: 0x1C8
	Parameters: 0
	Flags: Private
	Line Number: 1606
*/
function private margwaHeadSmash()
{
	self notify("stop_head_update");
	headAlive = [];
	foreach(head in self.head)
	{
		if(head.health > 0)
		{
			headAlive[headAlive.size] = head;
		}
	}
	headAlive = Array::randomize(headAlive);
	open = 0;
	foreach(head in headAlive)
	{
		if(!open)
		{
			head.canDamage = 1;
			self clientfield::set(head.cf, head.smash);
			open = 1;
			continue;
		}
		self margwaCloseHead(head);
	}
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: margwaCloseHead
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x40A8
	Size: 0x50
	Parameters: 1
	Flags: Private
	Line Number: 1645
*/
function private margwaCloseHead(headInfo)
{
	headInfo.canDamage = 0;
	self clientfield::set(headInfo.cf, headInfo.closed);
}

/*
	Name: margwaCloseAllHeads
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x4100
	Size: 0x128
	Parameters: 1
	Flags: Private
	Line Number: 1661
*/
function private margwaCloseAllHeads(closeTime)
{
	if(self IsPaused())
	{
		return;
	}
	foreach(head in self.head)
	{
		if(head.health > 0)
		{
			head.closeTime = undefined;
			head.openTime = undefined;
			if(isdefined(closeTime))
			{
				head.closeTime = GetTime() + closeTime;
			}
			self.headOpen = 0;
			self margwaCloseHead(head);
			self thread margwaHeadUpdate(head);
		}
	}
}

/*
	Name: margwaKillHead
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x4230
	Size: 0x180
	Parameters: 2
	Flags: None
	Line Number: 1694
*/
function margwaKillHead(modelHit, attacker)
{
	headInfo = self.head[modelHit];
	headInfo.health = 0;
	headInfo notify("stop_head_update");
	if(isdefined(headInfo.canDamage) && headInfo.canDamage)
	{
		self margwaCloseHead(headInfo);
		self.headOpen--;
	}
	self margwaUpdateMoveSpeed();
	if(isdefined(self.destroyHeadCB))
	{
		self thread [[self.destroyHeadCB]](modelHit, attacker);
	}
	self clientfield::set("margwa_head_killed", headInfo.killIndex);
	self Detach(headInfo.model);
	self Attach(headInfo.gore);
	self.headAttached--;
	if(self.headAttached <= 0)
	{
		self.e_head_attacker = attacker;
		return 1;
	}
	else
	{
		self.headDestroyed = modelHit;
	}
	return 0;
}

/*
	Name: margwaCanDamageAnyHead
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x43B8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1735
*/
function margwaCanDamageAnyHead()
{
	foreach(head in self.head)
	{
		if(isdefined(head) && head.health > 0 && (isdefined(head.canDamage) && head.canDamage))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: margwaCanDamageHead
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x4480
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 1757
*/
function margwaCanDamageHead()
{
	if(isdefined(self) && self.health > 0 && (isdefined(self.canDamage) && self.canDamage))
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: show_hit_marker
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x44C8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1777
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
	Name: isDirectHitWeapon
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x4558
	Size: 0xF0
	Parameters: 1
	Flags: Private
	Line Number: 1798
*/
function private isDirectHitWeapon(weapon)
{
	foreach(dhWeapon in level.dhWeapons)
	{
		if(weapon.name == dhWeapon)
		{
			return 1;
		}
		if(isdefined(weapon.rootweapon) && isdefined(weapon.rootweapon.name) && weapon.rootweapon.name == dhWeapon)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: margwaDamage
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x4650
	Size: 0x730
	Parameters: 12
	Flags: None
	Line Number: 1824
*/
function margwaDamage(inflictor, attacker, damage, dFlags, mod, weapon, point, dir, hitLoc, offsetTime, boneIndex, modelIndex)
{
	should_die = 1;
	foreach(head in self.head)
	{
		if(self.health > 0)
		{
			should_die = 0;
		}
	}
	if(should_die)
	{
		return self.health;
	}
	if(isdefined(self.is_kill) && self.is_kill)
	{
		return damage;
	}
	if(isdefined(attacker) && isdefined(attacker.n_margwa_head_damage_scale))
	{
		damage = damage * attacker.n_margwa_head_damage_scale;
	}
	if(isdefined(level._margwa_damage_cb))
	{
		n_result = [[level._margwa_damage_cb]](inflictor, attacker, damage, dFlags, mod, weapon, point, dir, hitLoc, offsetTime, boneIndex, modelIndex);
		if(isdefined(n_result))
		{
			return n_result;
		}
	}
	damageOpen = 0;
	if(!(isdefined(self.canDamage) && self.canDamage))
	{
		self.health = self.health + 1;
		return 1;
	}
	if(isDirectHitWeapon(weapon))
	{
		headAlive = [];
		foreach(head in self.head)
		{
			if(head margwaCanDamageHead())
			{
				headAlive[headAlive.size] = head;
			}
		}
		if(headAlive.size > 0)
		{
			max = 100000;
			headClosest = undefined;
			foreach(head in headAlive)
			{
				distSq = DistanceSquared(point, self GetTagOrigin(head.tag));
				if(distSq < max)
				{
					max = distSq;
					headClosest = head;
				}
			}
			if(isdefined(headClosest))
			{
				if(max < 576)
				{
					if(isdefined(level.margwa_damage_override_callback) && IsFunctionPtr(level.margwa_damage_override_callback))
					{
						damage = attacker [[level.margwa_damage_override_callback]](damage);
					}
					headClosest.health = headClosest.health - damage;
					damageOpen = 1;
					self clientfield::increment(headClosest.impactCF);
					attacker show_hit_marker();
					if(headClosest.health <= 0)
					{
						if(isdefined(level.margwa_head_kill_weapon_check))
						{
							[[level.margwa_head_kill_weapon_check]](self, weapon);
						}
						if(self margwaKillHead(headClosest.model, attacker))
						{
							return self.health;
						}
					}
				}
			}
		}
		else
		{
			return self.health;
		}
	}
	partName = GetPartName(self.model, boneIndex);
	if(isdefined(partName))
	{
		/#
			if(isdefined(self.debugHitLoc) && self.debugHitLoc)
			{
				PrintTopRightln(partName + "Dev Block strings are not supported" + damage);
			}
		#/
		modelHit = self margwaHeadHit(self, partName);
		if(isdefined(modelHit))
		{
			headInfo = self.head[modelHit];
			if(headInfo margwaCanDamageHead())
			{
				if(isdefined(level.margwa_damage_override_callback) && IsFunctionPtr(level.margwa_damage_override_callback))
				{
					damage = attacker [[level.margwa_damage_override_callback]](damage);
				}
				if(isdefined(attacker))
				{
					attacker notify("margwa_headshot", self);
				}
				headInfo.health = headInfo.health - damage;
				damageOpen = 1;
				self clientfield::increment(headInfo.impactCF);
				attacker show_hit_marker();
				if(headInfo.health <= 0)
				{
					if(isdefined(level.margwa_head_kill_weapon_check))
					{
						[[level.margwa_head_kill_weapon_check]](self, weapon);
					}
					if(self margwaKillHead(modelHit, attacker))
					{
						return self.health;
					}
				}
			}
		}
	}
	if(damageOpen)
	{
		return 0;
	}
	self.health = self.health + 1;
	return 1;
}

/*
	Name: margwaHeadHit
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x4D88
	Size: 0x70
	Parameters: 2
	Flags: Private
	Line Number: 1973
*/
function private margwaHeadHit(entity, partName)
{
	switch(partName)
	{
		case "j_chunk_head_bone_le":
		case "j_jaw_lower_1_le":
		{
			return self.head_left_model;
		}
		case "j_chunk_head_bone":
		case "j_jaw_lower_1":
		{
			return self.head_mid_model;
		}
		case "j_chunk_head_bone_ri":
		case "j_jaw_lower_1_ri":
		{
			return self.head_right_model;
		}
	}
	return undefined;
}

/*
	Name: margwaUpdateMoveSpeed
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x4E00
	Size: 0xA0
	Parameters: 0
	Flags: Private
	Line Number: 2006
*/
function private margwaUpdateMoveSpeed()
{
	if(self.zombie_move_speed == "walk")
	{
		self.zombie_move_speed = "run";
		blackboard::SetBlackBoardAttribute(self, "_locomotion_speed", "locomotion_speed_run");
	}
	else if(self.zombie_move_speed == "run")
	{
		self.zombie_move_speed = "sprint";
		blackboard::SetBlackBoardAttribute(self, "_locomotion_speed", "locomotion_speed_sprint");
	}
}

/*
	Name: margwaForceSprint
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x4EA8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 2030
*/
function margwaForceSprint()
{
	self.zombie_move_speed = "sprint";
	blackboard::SetBlackBoardAttribute(self, "_locomotion_speed", "locomotion_speed_sprint");
}

/*
	Name: margwaDestroyHead
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x4EF0
	Size: 0x10
	Parameters: 1
	Flags: Private
	Line Number: 2046
*/
function private margwaDestroyHead(modelHit)
{
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: shouldUpdateJaw
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x4F08
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 2063
*/
function shouldUpdateJaw()
{
	if(!(isdefined(self.jawAnimEnabled) && self.jawAnimEnabled))
	{
		return 0;
	}
	if(self.headAttached < 3)
	{
		return 1;
	}
	return 0;
}

/*
	Name: margwaSetGoal
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x4F48
	Size: 0x90
	Parameters: 3
	Flags: None
	Line Number: 2086
*/
function margwaSetGoal(origin, radius, boundaryDist)
{
	pos = GetClosestPointOnNavMesh(origin, 64, 30);
	if(isdefined(pos))
	{
		self SetGoal(pos);
		return 1;
	}
	self SetGoal(self.origin);
	return 0;
}

/*
	Name: margwaWait
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x4FE0
	Size: 0x190
	Parameters: 0
	Flags: Private
	Line Number: 2108
*/
function private margwaWait()
{
	self endon("death");
	self.waiting = 1;
	self.needTeleportIn = 1;
	destPos = self.teleportPos + VectorScale((0, 0, 1), 60);
	dist = Distance(self.teleportStart, destPos);
	time = dist / 600;
	if(isdefined(self.margwa_teleport_speed))
	{
		if(self.margwa_teleport_speed > 0)
		{
			time = dist / self.margwa_teleport_speed;
		}
	}
	if(isdefined(self.traveler))
	{
		self thread margwaTell();
		self.traveler moveto(destPos, time);
		self.traveler util::waittill_any_ex(time + 0.1, "movedone", self, "death");
		self.travelerTell clientfield::set("margwa_fx_travel_tell", 0);
	}
	self.waiting = 0;
	self.needTeleportOut = 0;
	if(isdefined(self.margwa_teleport_speed))
	{
		self.margwa_teleport_speed = undefined;
	}
}

/*
	Name: margwaTell
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x5178
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 2148
*/
function margwaTell()
{
	self endon("death");
	self.travelerTell.origin = self.teleportPos;
	util::wait_network_frame();
	self.travelerTell clientfield::set("margwa_fx_travel_tell", 1);
}

/*
	Name: shieldFacing
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x51E8
	Size: 0x168
	Parameters: 3
	Flags: Private
	Line Number: 2166
*/
function private shieldFacing(vDir, limit, front)
{
	if(!isdefined(front))
	{
		front = 1;
	}
	orientation = self getPlayerAngles();
	forwardVec = AnglesToForward(orientation);
	if(!front)
	{
		forwardVec = forwardVec * -1;
	}
	forwardVec2D = (forwardVec[0], forwardVec[1], 0);
	unitForwardVec2D = VectorNormalize(forwardVec2D);
	toFaceeVec = vDir * -1;
	toFaceeVec2D = (toFaceeVec[0], toFaceeVec[1], 0);
	unitToFaceeVec2D = VectorNormalize(toFaceeVec2D);
	dotProduct = VectorDot(unitForwardVec2D, unitToFaceeVec2D);
	return dotProduct > limit;
}

/*
	Name: inSmashAttackRange
	Namespace: MargwaServerUtils
	Checksum: 0x424F4353
	Offset: 0x5358
	Size: 0xC8
	Parameters: 1
	Flags: Private
	Line Number: 2197
*/
function private inSmashAttackRange(enemy)
{
	smashPos = self.origin;
	heightOffset = Abs(self.origin[2] - enemy.origin[2]);
	if(heightOffset > 48)
	{
		return 0;
	}
	distSq = DistanceSquared(smashPos, enemy.origin);
	range = 25600;
	if(distSq < range)
	{
		return 1;
	}
	return 0;
}

