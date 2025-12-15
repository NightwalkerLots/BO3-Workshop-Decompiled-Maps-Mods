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
#include scripts\zm\_zm_lightning_chain;
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

#namespace milk;

/*
	Name: __init__sytem__
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0x6B0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 46
*/
function autoexec __init__sytem__()
{
	system::register("MILK", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0x6F0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function __init__()
{
	function_1a92256e();
}

/*
	Name: function_1a92256e
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0x710
	Size: 0x4C0
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_milk", "customperk", 3000, &"ZM_REAP_MOD_PERK_MILK", GetWeapon("zombie_perk_bottle_milk"));
	zm_perks::register_perk_precache_func("specialty_milk", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_milk", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_milk", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_milk", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_milk", "Muscle Milk", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_milk", &"ZM_REAP_MOD_PERK_MILK_DB", 2000, "Muscle Milk", "milk");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_milk"] = 1;
	callback::on_spawned(&onSpawn);
	zm::register_zombie_damage_override_callback(&tesla_zombie_damage_response);
	zm_spawner::register_zombie_death_animscript_callback(&tesla_zombie_death_response);
	level._effect["tesla_shock_eyes"] = "zombie/fx_tesla_shock_eyes_zmb";
	zombie_utility::set_zombie_var("milk_perk_max_arcs", 4);
	zombie_utility::set_zombie_var("milk_perk_max_enemies_killed", 8);
	zombie_utility::set_zombie_var("milk_perk_radius_start", 250);
	zombie_utility::set_zombie_var("milk_perk_radius_decay", 18);
	zombie_utility::set_zombie_var("milk_perk_head_gib_chance", 75);
	zombie_utility::set_zombie_var("milk_perk_arc_travel_time", 0.08, 1);
	zombie_utility::set_zombie_var("milk_perk_kills_for_powerup", 8);
	zombie_utility::set_zombie_var("milk_perk_min_fx_distance", 128);
	zombie_utility::set_zombie_var("milk_perk_network_death_choke", 4);
	level.var_6634a01c = lightning_chain::create_lightning_chain_params(level.zombie_vars["milk_perk_max_arcs"], level.zombie_vars["milk_perk_max_enemies_killed"], level.zombie_vars["milk_perk_radius_start"], level.zombie_vars["milk_perk_radius_decay"], level.zombie_vars["milk_perk_head_gib_chance"], level.zombie_vars["milk_perk_arc_travel_time"], level.zombie_vars["milk_perk_kills_for_powerup"], level.zombie_vars["milk_perk_min_fx_distance"], level.zombie_vars["milk_perk_network_death_choke"], undefined, undefined, "wpn_tesla_bounce");
	level.var_323ac185 = lightning_chain::create_lightning_chain_params(level.zombie_vars["milk_perk_max_arcs"] + 1, level.zombie_vars["milk_perk_max_enemies_killed"] + 1, level.zombie_vars["milk_perk_radius_start"] + 50, level.zombie_vars["milk_perk_radius_decay"], level.zombie_vars["milk_perk_head_gib_chance"], level.zombie_vars["milk_perk_arc_travel_time"], level.zombie_vars["milk_perk_kills_for_powerup"], level.zombie_vars["milk_perk_min_fx_distance"], level.zombie_vars["milk_perk_network_death_choke"], undefined, undefined, "wpn_tesla_bounce");
}

/*
	Name: function_8bd87e3d
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0xBD8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 117
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_milk"] = spawnstruct();
	level.machine_assets["specialty_milk"].weapon = GetWeapon("zombie_perk_bottle_milk");
	level.machine_assets["specialty_milk"].off_model = "zombie_vending_milk_off";
	level.machine_assets["specialty_milk"].on_model = "zombie_vending_milk_on";
}

/*
	Name: function_19157aff
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0xC80
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 135
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0xC90
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 149
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_milk", "milk", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0xCD8
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 164
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_milk_jingle";
	use_trigger.script_string = "specialty_milk";
	use_trigger.script_label = "mus_perks_milk_sting";
	use_trigger.target = "Muscle Milk";
	perk_machine.script_string = "specialty_milk";
	perk_machine.targetname = "Muscle Milk";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_milk";
		return;
	}
}

/*
	Name: function_dc5cf16f
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0xDA0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 189
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_milk"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_milk"] = 1;
	self.var_5821d6f1 = 1;
	self thread function_398ce0c3();
}

/*
	Name: function_b4722825
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0xE48
	Size: 0x60
	Parameters: 3
	Flags: None
	Line Number: 219
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_milk"] = 0;
	self.var_b5c2c258["specialty_milk"] = undefined;
	self.var_d6aef449["specialty_milk"] = undefined;
	self.var_5821d6f1 = 0;
}

/*
	Name: function_398ce0c3
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0xEB0
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 237
*/
function function_398ce0c3()
{
	self.var_60fa68d2 = 0;
	while(isdefined(self.var_5821d6f1) && self.var_5821d6f1)
	{
		var_83079f85 = 15;
		if(self namespace_851dc78f::function_b690a849("specialty_milk"))
		{
			var_83079f85 = 12;
		}
		charge = var_83079f85;
		self thread namespace_4b6e359c::function_75aa16e4("specialty_milk", "milk", "Meter", Int(charge / var_83079f85 * 100));
		self waittill("hash_a5be7631");
		self.var_60fa68d2 = 1;
		charge = 0;
		self thread namespace_4b6e359c::function_75aa16e4("specialty_milk", "milk", "Meter", Int(charge / var_83079f85 * 100));
		while(charge < var_83079f85)
		{
			wait(1);
			charge = charge + 1;
			self thread namespace_4b6e359c::function_75aa16e4("specialty_milk", "milk", "Meter", Int(charge / var_83079f85 * 100));
		}
		self playlocalsound("mus_perks_milk_elec");
		self.var_60fa68d2 = 0;
	}
}

/*
	Name: tesla_damage_init
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0x1088
	Size: 0x168
	Parameters: 3
	Flags: None
	Line Number: 274
*/
function tesla_damage_init(HIT_LOCATION, hit_origin, player)
{
	player endon("disconnect");
	if(isdefined(self.zombie_tesla_hit) && self.zombie_tesla_hit)
	{
		return;
	}
	player.tesla_enemies = undefined;
	player.tesla_enemies_hit = 1;
	player.tesla_powerup_dropped = 0;
	player.tesla_arc_count = 0;
	player.tesla_firing = 1;
	if(player namespace_851dc78f::function_b690a849("specialty_milk"))
	{
		self lightning_chain::arc_damage(self, player, 1, level.var_323ac185);
	}
	else
	{
		self lightning_chain::arc_damage(self, player, 1, level.var_6634a01c);
	}
	if(player.tesla_enemies_hit >= 4)
	{
		player thread tesla_killstreak_sound();
	}
	player.tesla_enemies_hit = 0;
	player.tesla_firing = 0;
	player notify("hash_a5be7631");
}

/*
	Name: onSpawn
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0x11F8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 313
*/
function onSpawn()
{
	self.var_5821d6f1 = 0;
	self.var_60fa68d2 = 0;
}

/*
	Name: is_tesla_damage
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0x1220
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 329
*/
function is_tesla_damage(mod, player)
{
	if(!(isdefined(player.var_5821d6f1) && player.var_5821d6f1))
	{
		return 0;
	}
	if(player.var_60fa68d2 == 1)
	{
		return 0;
	}
	if(mod != "MOD_MELEE")
	{
		return 0;
	}
	return 1;
}

/*
	Name: enemy_killed_by_tesla
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0x1298
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 356
*/
function enemy_killed_by_tesla()
{
	return isdefined(self.tesla_death) && self.tesla_death;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: tesla_zombie_damage_response
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0x12B8
	Size: 0xE0
	Parameters: 13
	Flags: None
	Line Number: 372
*/
function tesla_zombie_damage_response(willBeKilled, inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(isdefined(meansOfDeath) && isdefined(attacker) && isdefined(sHitLoc) && isdefined(vPoint))
	{
		if(self is_tesla_damage(meansOfDeath, attacker))
		{
			self thread tesla_damage_init(sHitLoc, vPoint, attacker);
			return 1;
		}
	}
	return 0;
}

/*
	Name: tesla_zombie_death_response
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0x13A0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 395
*/
function tesla_zombie_death_response()
{
	if(self enemy_killed_by_tesla())
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: tesla_killstreak_sound
	Namespace: milk
	Checksum: 0x424F4353
	Offset: 0x13D0
	Size: 0x5C
	Parameters: 0
	Flags: None
	Line Number: 415
*/
function tesla_killstreak_sound()
{
	self endon("disconnect");
	self zm_audio::create_and_play_dialog("kill", "tesla");
	wait(3.5);
	level util::clientNotify("TGH");
}

