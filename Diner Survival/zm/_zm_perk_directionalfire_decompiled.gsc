#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;

#namespace namespace_c23e218c;

/*
	Name: __init__sytem__
	Namespace: namespace_c23e218c
	Checksum: 0x141B0F8C
	Offset: 0x3E0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 27
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_directionalfire", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_c23e218c
	Checksum: 0x9BE6AA7E
	Offset: 0x420
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function __init__()
{
	function_28827157();
}

/*
	Name: function_28827157
	Namespace: namespace_c23e218c
	Checksum: 0x86F32E98
	Offset: 0x440
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function function_28827157()
{
	zm_perks::register_perk_basic_info("specialty_directionalfire", "directionalfire", 2000, "Hold ^3[{+activate}]^7 for Vigor Rush [Cost: &&1] \n ^5Explosive bullets dealing extra damage", GetWeapon("zombie_perk_bottle_directionalfire"));
	zm_perks::register_perk_precache_func("specialty_directionalfire", &function_b20045dd);
	zm_perks::register_perk_clientfields("specialty_directionalfire", &function_201c295f, &function_bc42158c);
	zm_perks::register_perk_machine("specialty_directionalfire", &function_655fa6ea);
	zm_perks::register_perk_host_migration_params("specialty_directionalfire", "vending_directionalfire", "vending_directionalfire");
	thread function_e48692b();
	wait(0.05);
	if(!isdefined(level._random_perk_machine_perk_list))
	{
		level._random_perk_machine_perk_list = [];
	}
	if(isdefined(level._random_perk_machine_perk_list))
	{
		if(!isdefined(level._random_perk_machine_perk_list))
		{
			level._random_perk_machine_perk_list = [];
		}
		else if(!IsArray(level._random_perk_machine_perk_list))
		{
			level._random_perk_machine_perk_list = Array(level._random_perk_machine_perk_list);
		}
	}
	level._random_perk_machine_perk_list[level._random_perk_machine_perk_list.size] = "specialty_directionalfire";
}

/*
	Name: function_e48692b
	Namespace: namespace_c23e218c
	Checksum: 0x5E30F0B7
	Offset: 0x5E8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function function_e48692b()
{
	zm::register_actor_damage_callback(&function_5e52bc0f);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5e52bc0f
	Namespace: namespace_c23e218c
	Checksum: 0x950FDAB0
	Offset: 0x618
	Size: 0x68
	Parameters: 12
	Flags: None
	Line Number: 112
*/
function function_5e52bc0f(inflictor, attacker, damage, flags, mod, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	return -1;
}

/*
	Name: function_e84da0cf
	Namespace: namespace_c23e218c
	Checksum: 0x6B9A2AEE
	Offset: 0x688
	Size: 0x110
	Parameters: 3
	Flags: None
	Line Number: 127
*/
function function_e84da0cf(damage, vPoint, attacker)
{
	foreach(zomb in GetAITeamArray("axis"))
	{
		if(zomb == self)
		{
			continue;
		}
		if(DistanceSquared(zomb.origin, vPoint) < 4096)
		{
			zomb DoDamage(damage * 0.2, vPoint, attacker);
		}
	}
}

/*
	Name: function_b20045dd
	Namespace: namespace_c23e218c
	Checksum: 0xF3737F81
	Offset: 0x7A0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 152
*/
function function_b20045dd()
{
	if(isdefined(level.var_44c41bed))
	{
		[[level.var_44c41bed]]();
		return;
	}
	level._effect["vending_directionalfire"] = "km/fx_km_perk_directionalfire_zmb";
	level._effect["exp_directionalfire"] = "km/fx_km_exp_vigorrush";
	level.machine_assets["specialty_directionalfire"] = spawnstruct();
	level.machine_assets["specialty_directionalfire"].weapon = GetWeapon("zombie_perk_bottle_directionalfire");
	level.machine_assets["specialty_directionalfire"].off_model = "km_zm_vending_vigor_rush_vm";
	level.machine_assets["specialty_directionalfire"].on_model = "km_zm_vending_vigor_rush_on_vm";
}

/*
	Name: function_201c295f
	Namespace: namespace_c23e218c
	Checksum: 0xCF2474C5
	Offset: 0x8A0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 177
*/
function function_201c295f()
{
	clientfield::register("clientuimodel", "hudItems.perks.directionalfire", 1, 2, "int");
}

/*
	Name: function_bc42158c
	Namespace: namespace_c23e218c
	Checksum: 0xE6754D10
	Offset: 0x8E0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 192
*/
function function_bc42158c(state)
{
	self clientfield::set_player_uimodel("hudItems.perks.directionalfire", state);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_655fa6ea
	Namespace: namespace_c23e218c
	Checksum: 0x648A2752
	Offset: 0x918
	Size: 0xBC
	Parameters: 4
	Flags: None
	Line Number: 209
*/
function function_655fa6ea(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "mus_perks_stamin_sting";
	use_trigger.script_label = "";
	use_trigger.target = "vending_directionalfire";
	perk_machine.script_string = "mus_perks_stamin_sting";
	perk_machine.targetname = "vending_directionalfire";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "mus_perks_stamin_sting";
	}
}

