#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;

#namespace zm_aat_thunder_wall;

/*
	Name: __init__sytem__
	Namespace: zm_aat_thunder_wall
	Checksum: 0x424F4353
	Offset: 0x2B8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 25
*/
function autoexec __init__sytem__()
{
	system::register("zm_aat_thunder_wall", &__init__, undefined, "aat");
}

/*
	Name: __init__
	Namespace: zm_aat_thunder_wall
	Checksum: 0x424F4353
	Offset: 0x2F8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function __init__()
{
	if(!(isdefined(level.aat_in_use) && level.aat_in_use))
	{
		return;
	}
	AAT::register("zm_aat_thunder_wall", 0.2, 0, 7, 0, 1, &result, "t7_hud_zm_aat_thunderwall", "wpn_aat_thunder_wall_plr");
	level._effect["zm_aat_thunder_wall" + "_break_fx"] = "zombie/fx_aat_thunderwall_zmb";
	return;
}

/*
	Name: result
	Namespace: zm_aat_thunder_wall
	Checksum: 0x424F4353
	Offset: 0x388
	Size: 0x40
	Parameters: 4
	Flags: None
	Line Number: 61
*/
function result(death, attacker, mod, weapon)
{
	self thread thunder_wall_blast(attacker);
}

/*
	Name: thunder_wall_blast
	Namespace: zm_aat_thunder_wall
	Checksum: 0x424F4353
	Offset: 0x3D0
	Size: 0x518
	Parameters: 1
	Flags: None
	Line Number: 76
*/
function thunder_wall_blast(attacker)
{
	v_thunder_wall_blast_pos = self.origin;
	v_attacker_facing_forward_dir = VectorToAngles(v_thunder_wall_blast_pos - attacker.origin);
	v_attacker_facing = attacker GetWeaponForwardDir();
	v_attacker_orientation = attacker.angles;
	a_ai_zombies = Array::get_all_closest(v_thunder_wall_blast_pos, GetAITeamArray("axis"), undefined, undefined, 360);
	if(!isdefined(a_ai_zombies))
	{
		return;
	}
	f_thunder_wall_range_sq = 1000000;
	f_thunder_wall_effect_area_sq = 9000000;
	end_pos = v_thunder_wall_blast_pos + VectorScale(v_attacker_facing, 180);
	self playsound("wpn_aat_thunderwall_impact");
	level thread thunder_wall_blast_fx(v_thunder_wall_blast_pos, v_attacker_orientation);
	n_flung_zombies = 0;
	foreach(zombie in a_ai_zombies)
	{
		if(!isdefined(zombie) || !isalive(zombie))
		{
			continue;
		}
		if(isdefined(level.AAT["zm_aat_thunder_wall"].immune_result_direct[zombie.archetype]) && level.AAT["zm_aat_thunder_wall"].immune_result_direct[zombie.archetype])
		{
			continue;
		}
		if(zombie == self)
		{
			v_curr_zombie_origin = self.origin;
			v_curr_zombie_origin_sq = 0;
		}
		else
		{
			v_curr_zombie_origin = zombie GetCentroid();
			v_curr_zombie_origin_sq = DistanceSquared(v_thunder_wall_blast_pos, v_curr_zombie_origin);
			v_curr_zombie_to_thunder_wall = VectorNormalize(v_curr_zombie_origin - v_thunder_wall_blast_pos);
			v_curr_zombie_facing_dot = VectorDot(v_attacker_facing, v_curr_zombie_to_thunder_wall);
			if(v_curr_zombie_facing_dot < 0)
			{
				continue;
			}
			radial_origin = PointOnSegmentNearestToPoint(v_thunder_wall_blast_pos, end_pos, v_curr_zombie_origin);
			if(DistanceSquared(v_curr_zombie_origin, radial_origin) > f_thunder_wall_effect_area_sq)
			{
				continue;
			}
		}
		if(v_curr_zombie_origin_sq < f_thunder_wall_range_sq)
		{
			zombie DoDamage(zombie.health, v_curr_zombie_origin, undefined, undefined, "none", "MOD_IMPACT");
			if(isdefined(attacker) && isPlayer(attacker))
			{
				attacker zm_stats::increment_challenge_stat("ZOMBIE_HUNTER_THUNDER_WALL");
			}
			if(!(isdefined(level.AAT["zm_aat_thunder_wall"].immune_result_indirect[self.archetype]) && level.AAT["zm_aat_thunder_wall"].immune_result_indirect[self.archetype]))
			{
				n_random_x = RandomFloatRange(-3, 3);
				n_random_y = RandomFloatRange(-3, 3);
				zombie StartRagdoll(1);
				zombie LaunchRagdoll(100 * VectorNormalize(v_curr_zombie_origin - v_thunder_wall_blast_pos + (n_random_x, n_random_y, 30)), "torso_lower");
			}
		}
	}
}

/*
	Name: thunder_wall_blast_fx
	Namespace: zm_aat_thunder_wall
	Checksum: 0x424F4353
	Offset: 0x8F0
	Size: 0x44
	Parameters: 2
	Flags: None
	Line Number: 152
*/
function thunder_wall_blast_fx(v_blast_origin, v_attacker_orientation)
{
	FX::Play("zm_aat_thunder_wall" + "_break_fx", v_blast_origin, v_attacker_orientation, 1);
}

