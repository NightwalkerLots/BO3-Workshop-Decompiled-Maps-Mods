#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_ai_shared;
#include scripts\shared\vehicle_shared;
#include scripts\shared\vehicles\_auto_turret;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_traps;
#include scripts\zm\_zm_utility;

#namespace namespace_b7bd3aeb;

/*
	Name: __init__sytem__
	Namespace: namespace_b7bd3aeb
	Checksum: 0x2298B0A8
	Offset: 0x310
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 29
*/
function autoexec __init__sytem__()
{
	system::register("hb21_sym_zm_trap_turret", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b7bd3aeb
	Checksum: 0xBEFC9988
	Offset: 0x350
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	zm_spawner::register_zombie_death_event_callback(&function_89f60a5);
	zm::register_vehicle_damage_callback(&function_5bc262cd);
	zm::register_actor_damage_callback(&function_ab5b2b18);
	vehicle::add_main_callback("veh_bo3_turret_zmtrap", &auto_turret::turret_initialze);
	zm_traps::register_trap_basic_info("turret", &function_460fa6d9, undefined);
}

/*
	Name: function_460fa6d9
	Namespace: namespace_b7bd3aeb
	Checksum: 0x5B8229BF
	Offset: 0x410
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function function_460fa6d9()
{
	a_targets = GetEntArray(self.target, "targetname");
	for(i = 0; i < a_targets.size; i++)
	{
		if(isVehicle(a_targets[i]))
		{
			a_targets[i] vehicle_ai::turnOn();
			playsoundatposition("amb_turret_start", a_targets[i].origin);
			a_targets[i] PlayLoopSound("amb_turret_loop", 0.5);
		}
	}
	self._trap_duration = 40;
	self._trap_cooldown_time = 60;
	self notify("trap_activate");
	level notify("trap_activate", self);
	self util::waittill_notify_or_timeout("trap_deactivate", self._trap_duration);
	for(i = 0; i < a_targets.size; i++)
	{
		if(isVehicle(a_targets[i]))
		{
			a_targets[i] vehicle_ai::turnoff();
			playsoundatposition("amb_turret_end", a_targets[i].origin);
			a_targets[i] StopLoopSound(0.5);
		}
	}
	self notify("trap_done");
	return;
}

/*
	Name: function_5bc262cd
	Namespace: namespace_b7bd3aeb
	Checksum: 0x6603213F
	Offset: 0x638
	Size: 0xC0
	Parameters: 15
	Flags: None
	Line Number: 103
*/
function function_5bc262cd(e_inflictor, e_attacker, n_damage, var_df862ae6, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, v_damage_origin, var_bb4cbbbb, var_e37399f9, n_model_index, str_part_name, str_surface_type)
{
	if(isdefined(w_weapon) && w_weapon.name == "auto_turret_weapon")
	{
		if(isdefined(self.var_fba31184) && self.var_fba31184)
		{
			return 0;
		}
	}
	return -1;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ab5b2b18
	Namespace: namespace_b7bd3aeb
	Checksum: 0x838BC46F
	Offset: 0x700
	Size: 0xA8
	Parameters: 12
	Flags: None
	Line Number: 126
*/
function function_ab5b2b18(e_inflictor, e_attacker, n_damage, var_df862ae6, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_bb4cbbbb, var_22b92c8f, str_surface_type)
{
	if(isdefined(w_weapon) && w_weapon.name == "auto_turret_weapon")
	{
		if(isdefined(self.var_fba31184) && self.var_fba31184)
		{
			return 0;
		}
	}
	return -1;
}

/*
	Name: function_89f60a5
	Namespace: namespace_b7bd3aeb
	Checksum: 0x84A7EABF
	Offset: 0x7B0
	Size: 0x8A
	Parameters: 1
	Flags: None
	Line Number: 148
*/
function function_89f60a5(e_attacker)
{
	if(isdefined(e_attacker) && isdefined(e_attacker.vehicleType) && e_attacker.vehicleType == "veh_bo3_turret_zmtrap")
	{
		e_trap = GetEnt(e_attacker.targetname, "target");
		level notify("trap_kill", self, e_trap);
	}
}

