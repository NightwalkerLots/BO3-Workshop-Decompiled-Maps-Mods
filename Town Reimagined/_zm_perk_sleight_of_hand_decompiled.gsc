#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;

#namespace zm_perk_sleight_of_hand;

/*
	Name: __init__sytem__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x278130A8
	Offset: 0x398
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 27
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_sleight_of_hand", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xA2950C8A
	Offset: 0x3D8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_sleight_of_hand_perk_for_level();
	}
}

/*
	Name: enable_sleight_of_hand_perk_for_level
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x26FE31B5
	Offset: 0x410
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function enable_sleight_of_hand_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_fastreload", "sleight", 3000, &"ZOMBIE_PERK_FASTRELOAD", GetWeapon("zombie_perk_bottle_sleight"));
	zm_perks::register_perk_precache_func("specialty_fastreload", &sleight_of_hand_precache);
	zm_perks::register_perk_clientfields("specialty_fastreload", &sleight_of_hand_register_clientfield, &sleight_of_hand_set_clientfield);
	zm_perks::register_perk_machine("specialty_fastreload", &sleight_of_hand_perk_machine_setup);
	zm_perks::register_perk_threads("specialty_fastreload", &function_463dec8e, &function_11474d3c);
	zm_perks::register_perk_host_migration_params("specialty_fastreload", "vending_sleight", "specialty_fastreload");
}

/*
	Name: sleight_of_hand_precache
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x4278F8D
	Offset: 0x548
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function sleight_of_hand_precache()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_fastreload"] = "zombie/fx_perk_sleight_of_hand_zmb";
		continue;
	}
	level._effect["specialty_fastreload"] = "zombie/fx_perk_sleight_of_hand_factory_zmb";
	level.machine_assets["specialty_fastreload"] = spawnstruct();
	level.machine_assets["specialty_fastreload"].weapon = GetWeapon("zombie_perk_bottle_sleight");
	level.machine_assets["specialty_fastreload"].off_model = "p7_zm_vending_sleight";
	level.machine_assets["specialty_fastreload"].on_model = "p7_zm_vending_sleight";
}

/*
	Name: sleight_of_hand_register_clientfield
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x9ACF73B8
	Offset: 0x688
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function sleight_of_hand_register_clientfield()
{
}

/*
	Name: sleight_of_hand_set_clientfield
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xB111245F
	Offset: 0x698
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 119
*/
function sleight_of_hand_set_clientfield(state)
{
}

/*
	Name: sleight_of_hand_perk_machine_setup
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x320ECDD1
	Offset: 0x6B0
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 133
*/
function sleight_of_hand_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_speed_jingle";
	use_trigger.script_string = "speedcola_perk";
	use_trigger.script_label = "mus_perks_speed_sting";
	use_trigger.target = "vending_sleight";
	perk_machine.script_string = "speedcola_perk";
	perk_machine.targetname = "vending_sleight";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "speedcola_perk";
	}
}

/*
	Name: function_463dec8e
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x20329FE1
	Offset: 0x778
	Size: 0x60
	Parameters: 3
	Flags: None
	Line Number: 157
*/
function function_463dec8e(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_fastreload", "t6_specialty_fastreload");
	self notify("specialty_fastreload" + "_start");
}

/*
	Name: function_11474d3c
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xC78BB637
	Offset: 0x7E0
	Size: 0x68
	Parameters: 3
	Flags: None
	Line Number: 173
*/
function function_11474d3c(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_fastreload");
	self notify("perk_lost", str_perk);
	self notify("specialty_fastreload" + "_stop");
}

/*
	Name: function_1018fe18
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xAF3AE276
	Offset: 0x850
	Size: 0x10A
	Parameters: 0
	Flags: None
	Line Number: 190
*/
function function_1018fe18()
{
	var_5364d372 = GetEntArray("vending_sleight", "targetname");
	foreach(perk_machine in var_5364d372)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "p7_zm_vending_sleight")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("sleight");
		}
	}
}

