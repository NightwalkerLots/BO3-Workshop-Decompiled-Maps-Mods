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
#include scripts\zm\_zm_powerup_utility;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_74ebe98b;

/*
	Name: __init__sytem__
	Namespace: namespace_74ebe98b
	Checksum: 0x424F4353
	Offset: 0x5A0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 46
*/
function autoexec __init__sytem__()
{
	system::register("MAGNET", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_74ebe98b
	Checksum: 0x424F4353
	Offset: 0x5E0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function __init__()
{
	function_1a92256e();
	return;
}

/*
	Name: function_1a92256e
	Namespace: namespace_74ebe98b
	Checksum: 0x424F4353
	Offset: 0x600
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_magnet", "customperk", 2500, &"ZM_REAP_MOD_PERK_MAGNET", GetWeapon("zombie_perk_bottle_magnet"));
	zm_perks::register_perk_precache_func("specialty_magnet", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_magnet", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_magnet", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_magnet", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_magnet", "Magnet Margarita", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_magnet", &"ZM_REAP_MOD_PERK_MAGNET_DB", 1500, "Magnet Margarita", "magnet");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_magnet"] = 1;
	namespace_3b75c34a::function_4e972a8e(&function_4865b5ba);
	zm_spawner::register_zombie_death_event_callback(&function_3b2a123);
	if(!isdefined(level.var_430f6ab4))
	{
		level.var_430f6ab4 = [];
	}
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_74ebe98b
	Checksum: 0x424F4353
	Offset: 0x7F8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 109
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_magnet"] = spawnstruct();
	level.machine_assets["specialty_magnet"].weapon = GetWeapon("zombie_perk_bottle_magnet");
	level.machine_assets["specialty_magnet"].off_model = "cz_zombie_vending_magnet";
	level.machine_assets["specialty_magnet"].on_model = "cz_zombie_vending_magnet";
}

/*
	Name: function_19157aff
	Namespace: namespace_74ebe98b
	Checksum: 0x424F4353
	Offset: 0x8A0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 127
*/
function function_19157aff()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_99c1452c
	Namespace: namespace_74ebe98b
	Checksum: 0x424F4353
	Offset: 0x8B0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 143
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_magnet", "magnet", "SetIconActive", state);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_edb3a90b
	Namespace: namespace_74ebe98b
	Checksum: 0x424F4353
	Offset: 0x8F8
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 160
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_magnet";
	use_trigger.script_label = "";
	use_trigger.target = "Magnet Margarita";
	perk_machine.script_string = "specialty_magnet";
	perk_machine.targetname = "Magnet Margarita";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_magnet";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_74ebe98b
	Checksum: 0x424F4353
	Offset: 0x9C0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 184
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_magnet"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_magnet"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_74ebe98b
	Checksum: 0x424F4353
	Offset: 0xA48
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 212
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_magnet"] = 0;
	self.var_b5c2c258["specialty_magnet"] = undefined;
	self.var_d6aef449["specialty_magnet"] = undefined;
}

/*
	Name: function_7de8fbd
	Namespace: namespace_74ebe98b
	Checksum: 0x424F4353
	Offset: 0xAA8
	Size: 0x108
	Parameters: 2
	Flags: None
	Line Number: 229
*/
function function_7de8fbd(origin, radius)
{
	if(!isdefined(origin) || !isdefined(radius))
	{
		return [];
	}
	powerups = [];
	foreach(p in level.active_powerups)
	{
		if(p != self && DistanceSquared(origin, p.origin) < radius * radius)
		{
			powerups[powerups.size] = p;
		}
	}
	return powerups;
}

/*
	Name: function_bda630b
	Namespace: namespace_74ebe98b
	Checksum: 0x424F4353
	Offset: 0xBB8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 256
*/
function function_bda630b()
{
	self util::waittill_any("death", "powerup_timedout", "powerup_grabbed", "hacked");
	if(isdefined(self))
	{
		self.var_f5a53a83 = undefined;
		return;
	}
}

/*
	Name: function_4865b5ba
	Namespace: namespace_74ebe98b
	Checksum: 0x424F4353
	Offset: 0xC10
	Size: 0x470
	Parameters: 0
	Flags: None
	Line Number: 276
*/
function function_4865b5ba()
{
	if(self.powerup_name == "ww_grenade" || self.powerup_name == "zombie_full_ammo" || self.powerup_name == "lose_points_team_powerup" || self.powerup_name == "lose_perk_team_powerup" || self.powerup_name == "anti_carpentr")
	{
		return;
	}
	self thread function_bda630b();
	var_924cb2eb = 120;
	while(isdefined(self))
	{
		players = GetPlayers();
		var_8193daa6 = [];
		for(i = 0; i < players.size; i++)
		{
			if(players[i] namespace_851dc78f::function_5f9a13b3("specialty_magnet"))
			{
				var_8193daa6[var_8193daa6.size] = players[i];
			}
		}
		if(var_8193daa6.size > 0)
		{
			self.var_f5a53a83 = function_7c633916(self.origin, var_8193daa6);
			if(isdefined(self.var_f5a53a83))
			{
				speed = 100;
				if(self.var_f5a53a83 namespace_851dc78f::function_b690a849("specialty_magnet"))
				{
					speed = 50;
				}
				player_origin = self.var_f5a53a83.origin + VectorScale((0, 0, 1), 32);
				var_d995de0c = player_origin - self.origin;
				var_d995de0c = (var_d995de0c[0], var_d995de0c[1], 0);
				var_2d18ef06 = VectorNormalize(var_d995de0c);
				var_ddeea4bc = var_2d18ef06 * var_924cb2eb;
				dest = player_origin - var_ddeea4bc;
				var_1dd2d452 = self.origin[0] - player_origin[0] * self.origin[0] - player_origin[0] + self.origin[1] - player_origin[1] * self.origin[1] - player_origin[1];
				if(var_1dd2d452 < var_924cb2eb * var_924cb2eb)
				{
					wait(0.1);
					continue;
				}
				nearby = function_7de8fbd(self.origin, 48);
				for(i = 0; i < nearby.size; i++)
				{
					other = nearby[i];
					var_efb3f2c = dest - other.origin;
					var_efb3f2c = (var_efb3f2c[0], var_efb3f2c[1], 0);
					avoid_dir = VectorNormalize(var_efb3f2c);
					var_7faa8d2a = avoid_dir * 16;
					dest = dest + var_7faa8d2a;
				}
				dist = Distance(self.origin, dest);
				if(dist > 16)
				{
					self moveto(dest, dist / speed);
				}
				else
				{
					self moveto(self.origin, 0.2);
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_7c633916
	Namespace: namespace_74ebe98b
	Checksum: 0x424F4353
	Offset: 0x1088
	Size: 0xC0
	Parameters: 2
	Flags: None
	Line Number: 352
*/
function function_7c633916(origin, var_8193daa6)
{
	nearest = undefined;
	near_dist = 10000;
	for(i = 0; i < var_8193daa6.size; i++)
	{
		var_6ca18a11 = Distance(origin, var_8193daa6[i].origin);
		if(var_6ca18a11 < near_dist)
		{
			nearest = var_8193daa6[i];
			near_dist = var_6ca18a11;
		}
	}
	return nearest;
}

/*
	Name: function_3b2a123
	Namespace: namespace_74ebe98b
	Checksum: 0x424F4353
	Offset: 0x1150
	Size: 0x94
	Parameters: 1
	Flags: None
	Line Number: 378
*/
function function_3b2a123(attacker)
{
	if(RandomInt(100) < 3)
	{
		if(isdefined(self.attacker) && isPlayer(self.attacker) && self.attacker namespace_851dc78f::function_b690a849("specialty_magnet"))
		{
			level thread zm_powerups::special_powerup_drop(self.origin);
		}
	}
}

