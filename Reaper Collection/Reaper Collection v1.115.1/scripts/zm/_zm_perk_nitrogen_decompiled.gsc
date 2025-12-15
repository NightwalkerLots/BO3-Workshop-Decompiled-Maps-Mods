#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
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

#namespace nitrogen;

/*
	Name: __init__sytem__
	Namespace: nitrogen
	Checksum: 0x424F4353
	Offset: 0x558
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 46
*/
function autoexec __init__sytem__()
{
	system::register("NITROGEN", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: nitrogen
	Checksum: 0x424F4353
	Offset: 0x598
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
	Namespace: nitrogen
	Checksum: 0x424F4353
	Offset: 0x5B8
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_nitrogen", "customperk", 2000, &"ZM_REAP_MOD_PERK_NITROGEN", GetWeapon("zombie_perk_bottle_nitrogen"));
	zm_perks::register_perk_precache_func("specialty_nitrogen", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_nitrogen", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_nitrogen", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_nitrogen", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_nitrogen", "Nitrogen Cooled", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_nitrogen", &"ZM_REAP_MOD_PERK_NITROGEN_DB", 2000, "Nitrogen Cooled", "nitrogen");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_nitrogen"] = 1;
	spawner::add_global_spawn_function("axis", &function_ffaf2b3a);
}

/*
	Name: function_8bd87e3d
	Namespace: nitrogen
	Checksum: 0x424F4353
	Offset: 0x780
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_nitrogen"] = spawnstruct();
	level.machine_assets["specialty_nitrogen"].weapon = GetWeapon("zombie_perk_bottle_nitrogen");
	level.machine_assets["specialty_nitrogen"].off_model = "cz_zombie_vending_nitrogen_off";
	level.machine_assets["specialty_nitrogen"].on_model = "cz_zombie_vending_nitrogen";
}

/*
	Name: function_19157aff
	Namespace: nitrogen
	Checksum: 0x424F4353
	Offset: 0x828
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 123
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: nitrogen
	Checksum: 0x424F4353
	Offset: 0x838
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 137
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_nitrogen", "nitrogen", "SetIconActive", state);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_edb3a90b
	Namespace: nitrogen
	Checksum: 0x424F4353
	Offset: 0x880
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 154
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_nitrogen";
	use_trigger.script_label = "";
	use_trigger.target = "Nitrogen Cooled";
	perk_machine.script_string = "specialty_nitrogen";
	perk_machine.targetname = "Nitrogen Cooled";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_nitrogen";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: nitrogen
	Checksum: 0x424F4353
	Offset: 0x948
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 178
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_nitrogen"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_nitrogen"] = 1;
}

/*
	Name: function_b4722825
	Namespace: nitrogen
	Checksum: 0x424F4353
	Offset: 0x9D0
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 206
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_nitrogen"] = 0;
	self.var_b5c2c258["specialty_nitrogen"] = undefined;
	self.var_d6aef449["specialty_nitrogen"] = undefined;
}

/*
	Name: function_ffaf2b3a
	Namespace: nitrogen
	Checksum: 0x424F4353
	Offset: 0xA30
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 223
*/
function function_ffaf2b3a()
{
	self endon("death");
	if(self.archetype != "zombie")
	{
		return;
	}
	while(1)
	{
		if(isdefined(self))
		{
			if(self function_386411e8() && (!isdefined(self.var_bc7fecef) || (isdefined(self.var_bc7fecef) && self.var_bc7fecef != "walk")) && isdefined(self.zombie_move_speed))
			{
				if(self.zombie_move_speed != "walk")
				{
					if(!isdefined(self.var_bc7fecef))
					{
						self.var_bc7fecef = self.zombie_move_speed;
					}
					self.zombie_move_speed = "walk";
					self.var_c53012d9 = 1;
					self zombie_utility::set_zombie_run_cycle("walk");
				}
			}
			else if(self function_a9ec568b() && (!isdefined(self.var_bc7fecef) || (isdefined(self.var_bc7fecef) && self.var_bc7fecef != "run")) && isdefined(self.zombie_move_speed))
			{
				if(self.zombie_move_speed != "walk" && self.zombie_move_speed != "run")
				{
					if(!isdefined(self.var_bc7fecef))
					{
						self.var_bc7fecef = self.zombie_move_speed;
					}
					self.zombie_move_speed = "run";
					self.var_c53012d9 = 1;
					self zombie_utility::set_zombie_run_cycle("run");
				}
			}
			else if(isdefined(self.var_c53012d9))
			{
				if(isdefined(self.var_bc7fecef))
				{
					self.zombie_move_speed = self.var_bc7fecef;
					self zombie_utility::set_zombie_run_cycle(self.zombie_move_speed);
				}
				else
				{
					self zombie_utility::set_run_speed();
				}
				self.var_bc7fecef = undefined;
				self.var_c53012d9 = undefined;
			}
		}
		wait(0.01);
	}
}

/*
	Name: function_386411e8
	Namespace: nitrogen
	Checksum: 0x424F4353
	Offset: 0xC88
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 289
*/
function function_386411e8()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(DistanceSquared(self.origin, players[i].origin) < 22500 && players[i] namespace_851dc78f::function_b690a849("specialty_nitrogen"))
		{
			return 1;
			continue;
		}
		if(DistanceSquared(self.origin, players[i].origin) < 5625 && players[i] namespace_851dc78f::function_5f9a13b3("specialty_nitrogen"))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_a9ec568b
	Namespace: nitrogen
	Checksum: 0x424F4353
	Offset: 0xDA8
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 317
*/
function function_a9ec568b()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(DistanceSquared(self.origin, players[i].origin) < 90000 && players[i] namespace_851dc78f::function_b690a849("specialty_nitrogen"))
		{
			return 1;
			continue;
		}
		if(DistanceSquared(self.origin, players[i].origin) < 22500 && players[i] namespace_851dc78f::function_5f9a13b3("specialty_nitrogen"))
		{
			return 1;
		}
	}
	return 0;
}

