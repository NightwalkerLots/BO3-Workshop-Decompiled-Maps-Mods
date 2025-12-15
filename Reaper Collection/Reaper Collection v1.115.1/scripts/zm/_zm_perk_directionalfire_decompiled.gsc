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
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_cfa83d3b;

/*
	Name: __init__sytem__
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0x5A8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("DIRECTIONALFIRE", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0x5E8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function __init__()
{
	function_1a92256e();
	return;
}

/*
	Name: function_1a92256e
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0x608
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_directionalfire", "customperk", 3000, &"ZM_REAP_MOD_PERK_VIGOR_RUSH", GetWeapon("zombie_perk_bottle_directionalfire"));
	zm_perks::register_perk_precache_func("specialty_directionalfire", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_directionalfire", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_directionalfire", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_directionalfire", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_directionalfire", "Vigor Rush", "jugger_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_directionalfire", &"ZM_REAP_MOD_PERK_VIGOR_RUSH_DB", 2000, "Vigor Rush", "directionalfire");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_directionalfire"] = 1;
	zm::register_actor_damage_callback(&function_5e52bc0f);
	level.var_934d95d3 = 0;
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0x7D0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_directionalfire"] = spawnstruct();
	level.machine_assets["specialty_directionalfire"].weapon = GetWeapon("zombie_perk_bottle_directionalfire");
	level.machine_assets["specialty_directionalfire"].off_model = "km_zm_vending_vigor_rush_vm";
	level.machine_assets["specialty_directionalfire"].on_model = "km_zm_vending_vigor_rush_on_vm";
}

/*
	Name: function_19157aff
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0x878
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 122
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0x888
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 136
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_directionalfire", "directionalfire", "SetIconActive", state);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_edb3a90b
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0x8D0
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 153
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_directionalfire";
	use_trigger.script_label = "";
	use_trigger.target = "Vigor Rush";
	perk_machine.script_string = "specialty_directionalfire";
	perk_machine.targetname = "Vigor Rush";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_directionalfire";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0x998
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
	self.disabled_perks["specialty_directionalfire"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_directionalfire"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0xA20
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 205
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_directionalfire"] = 0;
	self.var_b5c2c258["specialty_directionalfire"] = undefined;
	self.var_d6aef449["specialty_directionalfire"] = undefined;
}

/*
	Name: function_5e52bc0f
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0xA80
	Size: 0xF8
	Parameters: 12
	Flags: None
	Line Number: 222
*/
function function_5e52bc0f(inflictor, attacker, damage, flags, mod, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(mod == "MOD_BULLET" || mod == "MOD_PISTOL_BULLET" || mod == "MOD_RIFLE_BULLET" && attacker namespace_851dc78f::function_5f9a13b3("specialty_directionalfire"))
	{
		damage = damage * 1.5;
		self thread function_e84da0cf(damage, vPoint, attacker);
		return damage;
	}
	return -1;
}

/*
	Name: function_e84da0cf
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0xB80
	Size: 0x1E4
	Parameters: 3
	Flags: None
	Line Number: 243
*/
function function_e84da0cf(damage, vPoint, attacker)
{
	damage = damage * 0.2;
	if(attacker namespace_851dc78f::function_b690a849("specialty_directionalfire"))
	{
		damage = damage * 2;
	}
	foreach(zomb in GetAITeamArray("axis"))
	{
		if(zomb == self)
		{
			continue;
		}
		if(DistanceSquared(zomb.origin, vPoint) < 4096)
		{
			zomb DoDamage(damage, vPoint, attacker);
		}
	}
	if(level.var_934d95d3 > 6)
	{
		return;
	}
	var_8ac566f8 = spawn("script_model", vPoint);
	var_8ac566f8 SetModel("tag_origin");
	level.var_934d95d3++;
	var_8ac566f8 playsound("wpn_exp_directionalfire");
	wait(0.5);
	var_8ac566f8 delete();
	level.var_934d95d3--;
}

