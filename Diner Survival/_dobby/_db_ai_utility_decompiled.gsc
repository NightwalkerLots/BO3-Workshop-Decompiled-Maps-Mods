#include scripts\_dobby\_db_utility;
#include scripts\codescripts\struct;
#include scripts\shared\ai\archetype_utility;
#include scripts\shared\ai\systems\ai_interface;
#include scripts\shared\ai\systems\animation_state_machine_utility;
#include scripts\shared\ai\systems\behavior_tree_utility;
#include scripts\shared\ai\systems\blackboard;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_behavior;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\gametypes\_globallogic_score;

#namespace namespace_298a9862;

/*
	Name: __init__sytem__
	Namespace: namespace_298a9862
	Checksum: 0x87D2A2D5
	Offset: 0x698
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 54
*/
function autoexec __init__sytem__()
{
	system::register("ai_util", &__init__, &__main__, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_298a9862
	Checksum: 0xBB710938
	Offset: 0x6E0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function __init__()
{
	level thread function_1a1b4aa1();
}

/*
	Name: function_1a1b4aa1
	Namespace: namespace_298a9862
	Checksum: 0x5CD0A1D0
	Offset: 0x708
	Size: 0xF8
	Parameters: 0
	Flags: Private
	Line Number: 86
*/
function private function_1a1b4aa1()
{
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("DefaultStunActionTerminate", &function_f641b367);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("DefaultTargetService", &function_110d1190);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("DefaultShouldMove", &function_71ca1b4e);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("DefaultShouldMelee", &function_b620869f);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("DefaultShouldStun", &function_a1db2b6d);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombieShouldTearHold", &function_276fdf14);
}

/*
	Name: __main__
	Namespace: namespace_298a9862
	Checksum: 0x9ACF73B8
	Offset: 0x808
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function __main__()
{
}

/*
	Name: play_ambient_zombie_vocals
	Namespace: namespace_298a9862
	Checksum: 0xFC503ACD
	Offset: 0x818
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function play_ambient_zombie_vocals()
{
	self endon("death");
	for(;;)
	{
		type = "ambient";
		float = 4;
		if(isdefined(self.zombie_move_speed))
		{
			switch(self.zombie_move_speed)
			{
				case "walk":
				{
					type = "ambient";
					float = 4;
					break;
				}
				case "run":
				{
					type = "sprint";
					float = 4;
					break;
				}
			}
		}
		if(self.animName === "zombie" && (isdefined(self.missingLegs) && self.missingLegs))
		{
			type = "crawler";
		}
		self notify("bhtn_action_notify", type);
		wait(RandomFloatRange(1, float));
	}
}

/*
	Name: function_b3f61b5b
	Namespace: namespace_298a9862
	Checksum: 0x52B95061
	Offset: 0x930
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 164
*/
function function_b3f61b5b()
{
	self.var_2026e30 = 1;
}

/*
	Name: function_43d8cd1c
	Namespace: namespace_298a9862
	Checksum: 0x8AE69EA9
	Offset: 0x948
	Size: 0x178
	Parameters: 2
	Flags: None
	Line Number: 179
*/
function function_43d8cd1c(var_c390c936, v_point)
{
	a_points = [];
	for(i = 0; i < var_c390c936.size; i++)
	{
		a_points[i] = self GetTagOrigin(var_c390c936[i]);
	}
	if(a_points.size > 0)
	{
		closest = a_points[0];
		closest_dist = DistanceSquared(v_point, a_points[0]);
		closest_index = 0;
		for(i = 1; i < a_points.size; i++)
		{
			if(DistanceSquared(v_point, a_points[i]) < closest_dist)
			{
				closest = a_points[i];
				closest_dist = DistanceSquared(v_point, a_points[i]);
				closest_index = i;
			}
		}
		return var_c390c936[closest_index];
		continue;
	}
	return undefined;
}

/*
	Name: function_e3f7c2df
	Namespace: namespace_298a9862
	Checksum: 0xE61B3C20
	Offset: 0xAC8
	Size: 0x178
	Parameters: 2
	Flags: None
	Line Number: 216
*/
function function_e3f7c2df(var_c390c936, v_point)
{
	a_points = [];
	for(i = 0; i < var_c390c936.size; i++)
	{
		a_points[i] = self GetTagOrigin(var_c390c936[i]);
	}
	if(a_points.size > 0)
	{
		closest = a_points[0];
		closest_dist = DistanceSquared(v_point, a_points[0]);
		closest_index = 0;
		for(i = 1; i < a_points.size; i++)
		{
			if(DistanceSquared(v_point, a_points[i]) < closest_dist)
			{
				closest = a_points[i];
				closest_dist = DistanceSquared(v_point, a_points[i]);
				closest_index = i;
			}
		}
		return closest;
		continue;
	}
	return undefined;
}

/*
	Name: function_8922e05b
	Namespace: namespace_298a9862
	Checksum: 0xCBF45E60
	Offset: 0xC48
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 253
*/
function function_8922e05b(entity)
{
	entity.__blackboard = undefined;
	entity [[entity.var_8120e4ca]]();
}

/*
	Name: BB_GetShouldTurn
	Namespace: namespace_298a9862
	Checksum: 0x7E31C99
	Offset: 0xC88
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 269
*/
function BB_GetShouldTurn()
{
	if(isdefined(self.should_turn) && self.should_turn)
	{
		return "should_turn";
	}
	return "should_not_turn";
}

/*
	Name: function_f641b367
	Namespace: namespace_298a9862
	Checksum: 0x26BB6B98
	Offset: 0xCC0
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 288
*/
function function_f641b367(entity)
{
	entity.var_2026e30 = 0;
	return 4;
}

/*
	Name: function_110d1190
	Namespace: namespace_298a9862
	Checksum: 0xDF9D056E
	Offset: 0xCE8
	Size: 0x238
	Parameters: 1
	Flags: None
	Line Number: 304
*/
function function_110d1190(entity)
{
	target = zm_utility::get_closest_valid_player(entity.origin, entity.ignore_player);
	if(isdefined(entity.var_ca43908c))
	{
		target = entity [[entity.var_ca43908c]](target);
	}
	if(isdefined(entity.ignoreall) && entity.ignoreall || !isdefined(target) || target === self || (entity flag::exists("spawn_complete") && !entity flag::get("spawn_complete")))
	{
		entity.favoriteenemy = undefined;
		entity SetGoal(entity.origin);
		return 0;
	}
	point = GetClosestPointOnNavMesh(target.origin, 64, 30);
	if(isdefined(point))
	{
		continue;
	}
	goalpos = target.origin;
	if(!entity CanPath(entity.origin, goalpos))
	{
		entity.favoriteenemy = undefined;
		entity SetGoal(entity.origin);
		return 0;
	}
	else if(isPlayer(target))
	{
		entity.favoriteenemy = target;
	}
	entity SetGoal(goalpos);
	return 1;
}

/*
	Name: function_71ca1b4e
	Namespace: namespace_298a9862
	Checksum: 0x7E4042B9
	Offset: 0xF28
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 347
*/
function function_71ca1b4e(entity)
{
	return entity HasPath();
}

/*
	Name: function_b620869f
	Namespace: namespace_298a9862
	Checksum: 0x44885822
	Offset: 0xF58
	Size: 0x198
	Parameters: 1
	Flags: None
	Line Number: 362
*/
function function_b620869f(entity)
{
	if(isdefined(entity.var_ec693591) && ![[entity.var_ec693591]](entity))
	{
		return 0;
	}
	if(!isdefined(entity.meleeDist))
	{
		entity.meleeDist = 32;
	}
	if(!isdefined(entity.var_732dbb28))
	{
		entity.var_732dbb28 = 45;
	}
	if(!isdefined(entity.favoriteenemy))
	{
		return 0;
	}
	if(DistanceSquared(entity.origin, entity.favoriteenemy.origin) > entity.meleeDist * entity.meleeDist)
	{
		return 0;
	}
	yawToEnemy = AngleClamp180(entity.angles[1] - VectorToAngles(entity.favoriteenemy.origin - entity.origin)[1]);
	if(Abs(yawToEnemy) > entity.var_732dbb28)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_a1db2b6d
	Namespace: namespace_298a9862
	Checksum: 0x74BF729C
	Offset: 0x10F8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 402
*/
function function_a1db2b6d(entity)
{
	return isdefined(entity.var_2026e30) && entity.var_2026e30;
}

/*
	Name: function_276fdf14
	Namespace: namespace_298a9862
	Checksum: 0xE8179F5E
	Offset: 0x1130
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 417
*/
function function_276fdf14(entity)
{
	if(isdefined(entity.first_node.zbarrier) && isdefined(entity.chunk))
	{
		if(isdefined(entity.first_node.zbarrier.chunk_health[entity.chunk]))
		{
			return entity.first_node.zbarrier.chunk_health[entity.chunk] > 0;
		}
	}
	return 0;
}

