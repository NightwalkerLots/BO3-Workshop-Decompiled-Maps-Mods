#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_c21e9819;

/*
	Name: __init__sytem__
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x608
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 46
*/
function autoexec __init__sytem__()
{
	system::register("zombshell", &__init__, undefined, undefined);
	return;
	ERROR: Bad function call
}

/*
	Name: __init__
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x648
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function __init__()
{
	function_1a92256e();
}

/*
	Name: function_1a92256e
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x668
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_zombshell", "zombshell", 2500, &"ZM_REAP_MOD_PERK_ZOMBSHELL", GetWeapon("zombie_perk_bottle_zombshell"));
	zm_perks::register_perk_precache_func("specialty_zombshell", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_zombshell", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_zombshell", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_zombshell", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_zombshell", "Zombshell", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_zombshell", &"ZM_REAP_MOD_PERK_ZOMBSHELL_DB", 1500, "Zombshell", "zombshell");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_zombshell"] = 1;
	zm_spawner::register_zombie_damage_callback(&function_c21e9819);
	zm_utility::register_slowdown("zombshell", 0.7, 2);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x850
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_zombshell"] = spawnstruct();
	level.machine_assets["specialty_zombshell"].weapon = GetWeapon("zombie_perk_bottle_zombshell");
	level.machine_assets["specialty_zombshell"].off_model = "chm_zm_vending_zombshell";
	level.machine_assets["specialty_zombshell"].on_model = "chm_zm_vending_zombshell";
}

/*
	Name: function_19157aff
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x8F8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 124
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x908
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 138
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_zombshell", "zombshell", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x950
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 153
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_zombshell";
	use_trigger.script_label = "";
	use_trigger.target = "Zombshell";
	perk_machine.script_string = "specialty_zombshell";
	perk_machine.targetname = "Zombshell";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_zombshell";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0xA18
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 177
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_zombshell"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_zombshell"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0xAA0
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 205
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_zombshell"] = 0;
	self.var_b5c2c258["specialty_zombshell"] = undefined;
	self.var_d6aef449["specialty_zombshell"] = undefined;
}

/*
	Name: function_c21e9819
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0xB00
	Size: 0x208
	Parameters: 13
	Flags: None
	Line Number: 222
*/
function function_c21e9819(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(str_mod == "MOD_RIFLE_BULLET" || str_mod == "MOD_PISTOL_BULLET")
	{
		if(self function_536b7e6f(e_player))
		{
			self thread namespace_851dc78f::function_4621bbdd("actor", "zombshell_explosion", 1);
			var_8be4db6f = spawn("script_model", self.origin + VectorScale((0, 0, 1), 30));
			var_8be4db6f SetModel("tag_origin");
			var_8be4db6f.angles = self.angles + VectorScale((-1, 0, 0), 90);
			var_8be4db6f.targetname = "zombshell_spot";
			var_8be4db6f.owner = e_player;
			var_8be4db6f thread function_730ec9(e_player);
			var_8be4db6f thread delete_on_disconnect(e_player);
			self thunder_wall_blast(e_player);
		}
		if(isdefined(self.var_5ec1078c))
		{
			self DoDamage(Int(n_amount / 2), e_player.origin, e_player);
		}
	}
	return 0;
}

/*
	Name: delete_on_disconnect
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0xD10
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 256
*/
function delete_on_disconnect(e_player)
{
	self endon("death");
	e_player waittill("disconnect");
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_730ec9
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0xD60
	Size: 0x510
	Parameters: 1
	Flags: None
	Line Number: 276
*/
function function_730ec9(e_player)
{
	e_player endon("disconnect");
	self PlayLoopSound("zombshell_loop");
	playsoundatposition("zombshell_start", self.origin);
	e_player.var_feb16d38 = 1;
	if(!isdefined(e_player.var_3634fc84))
	{
		e_player.var_3634fc84 = 0;
	}
	for(time = 10; time > 0; time = 10)
	{
		dist_sq = DistanceSquared(e_player.origin, self.origin);
		var_e29daab4 = e_player namespace_851dc78f::function_b690a849("specialty_zombshell");
		if(var_e29daab4 && dist_sq < 6400 && !e_player.var_3634fc84)
		{
			e_player.var_3634fc84 = 1;
			e_player zm_utility::increment_ignoreme();
		}
		else if(!var_e29daab4 || dist_sq >= 6400 && e_player.var_3634fc84)
		{
			e_player.var_3634fc84 = 0;
			e_player zm_utility::decrement_ignoreme();
		}
		a_zombies = util::get_array_of_closest(self.origin, GetAITeamArray("axis"), undefined, undefined, 350);
		for(i = 0; i < a_zombies.size; i++)
		{
			if(isalive(e_player) && isalive(a_zombies[i]))
			{
				a_zombies[i].var_5ec1078c = e_player;
				a_zombies[i] thread zm_utility::slowdown_ai("zombshell");
			}
		}
		b = Int(time * 10);
		b = clamp(b, 1, 100);
		e_player thread namespace_4b6e359c::function_75aa16e4("specialty_zombshell", "zombshell", "Meter", b);
		wait(0.2);
	}
	a_zombies = GetAITeamArray("axis");
	for(i = 0; i < a_zombies.size; i++)
	{
		if(isdefined(a_zombies[i].var_5ec1078c) && a_zombies[i].var_5ec1078c == e_player)
		{
			a_zombies[i].var_5ec1078c = undefined;
		}
	}
	if(e_player.var_3634fc84)
	{
		e_player.var_3634fc84 = 0;
		e_player zm_utility::decrement_ignoreme();
	}
	self StopLoopSound(1);
	self delete();
	time = 1;
	update_time = 0;
	while(time < 100)
	{
		time = time + 0.5;
		time = clamp(time, 1, 100);
		if(e_player namespace_851dc78f::function_5f9a13b3("specialty_zombshell") && update_time >= 1)
		{
			e_player thread namespace_4b6e359c::function_75aa16e4("specialty_zombshell", "zombshell", "Meter", time);
			update_time = 0;
		}
		update_time = update_time + 0.1;
		wait(0.1);
	}
	e_player.var_feb16d38 = undefined;
	return;
}

/*
	Name: clamp
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x1278
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 357
*/
function clamp(value, min, max)
{
	if(value < min)
	{
		return min;
	}
	else if(value > max)
	{
		return max;
	}
	else
	{
		return value;
	}
}

/*
	Name: thunder_wall_blast
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x12D8
	Size: 0x558
	Parameters: 1
	Flags: None
	Line Number: 383
*/
function thunder_wall_blast(attacker)
{
	v_thunder_wall_blast_pos = self.origin;
	v_attacker_facing_forward_dir = VectorToAngles(v_thunder_wall_blast_pos - attacker.origin);
	v_attacker_facing = attacker GetWeaponForwardDir();
	v_attacker_orientation = attacker.angles;
	a_ai_zombies = Array::get_all_closest(v_thunder_wall_blast_pos, GetAITeamArray("axis"), undefined, undefined, 180);
	if(!isdefined(a_ai_zombies))
	{
		return;
	}
	f_thunder_wall_range_sq = Int(32400) / 2;
	f_thunder_wall_effect_area_sq = f_thunder_wall_range_sq * 9;
	end_pos = v_thunder_wall_blast_pos + VectorScale(v_attacker_facing, 180);
	self playsound("wpn_aat_thunderwall_impact");
	level thread thunder_wall_blast_fx(v_thunder_wall_blast_pos, v_attacker_orientation);
	n_flung_zombies = 0;
	for(i = 0; i < a_ai_zombies.size; i++)
	{
		if(!isdefined(a_ai_zombies[i]) || !isalive(a_ai_zombies[i]))
		{
			continue;
		}
		if(isdefined(level.AAT["zm_aat_thunder_wall"].immune_result_direct[a_ai_zombies[i].archetype]) && level.AAT["zm_aat_thunder_wall"].immune_result_direct[a_ai_zombies[i].archetype])
		{
			continue;
		}
		if(a_ai_zombies[i] == self)
		{
			v_curr_zombie_origin = self.origin;
			v_curr_zombie_origin_sq = 0;
		}
		else
		{
			v_curr_zombie_origin = a_ai_zombies[i] GetCentroid();
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
			a_ai_zombies[i] DoDamage(a_ai_zombies[i].health, v_curr_zombie_origin, attacker, attacker, "none", "MOD_IMPACT");
			if(isdefined(attacker) && isPlayer(attacker))
			{
				attacker zm_stats::increment_challenge_stat("ZOMBIE_HUNTER_THUNDER_WALL");
			}
			if(!(isdefined(level.AAT["zm_aat_thunder_wall"].immune_result_indirect[self.archetype]) && level.AAT["zm_aat_thunder_wall"].immune_result_indirect[self.archetype]))
			{
				n_random_x = RandomFloatRange(-3, 3);
				n_random_y = RandomFloatRange(-3, 3);
				a_ai_zombies[i] StartRagdoll(1);
				a_ai_zombies[i] LaunchRagdoll(100 * VectorNormalize(v_curr_zombie_origin - v_thunder_wall_blast_pos + (n_random_x, n_random_y, 30)), "torso_lower");
			}
			n_flung_zombies++;
		}
		if(-1 && n_flung_zombies >= 6)
		{
			break;
		}
	}
}

/*
	Name: thunder_wall_blast_fx
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x1838
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 464
*/
function thunder_wall_blast_fx(v_blast_origin, v_attacker_orientation)
{
	FX::Play("zm_aat_thunder_wall" + "_break_fx", v_blast_origin, v_attacker_orientation, 1);
}

/*
	Name: function_536b7e6f
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x1890
	Size: 0x8C
	Parameters: 1
	Flags: None
	Line Number: 479
*/
function function_536b7e6f(e_player)
{
	if(!isdefined(e_player))
	{
		return 0;
	}
	if(isdefined(self.var_5ec1078c))
	{
		return 0;
	}
	if(!e_player namespace_851dc78f::function_5f9a13b3("specialty_zombshell"))
	{
		return 0;
	}
	if(isdefined(e_player.var_feb16d38))
	{
		return 0;
	}
	if(RandomInt(100) < 80)
	{
		return 0;
	}
	return 1;
}

