#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\zmperkoverlaystyles;

#namespace zm_perk_sleight_of_hand;

/*
	Name: __init__sytem__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x424F4353
	Offset: 0x358
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 27
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_sleight_of_hand", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x424F4353
	Offset: 0x398
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	enable_sleight_of_hand_perk_for_level();
	return;
	ERROR: Bad function call
}

/*
	Name: enable_sleight_of_hand_perk_for_level
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x424F4353
	Offset: 0x3B8
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function enable_sleight_of_hand_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_fastreload", "sleight", 3000, &"ZOMBIE_PERK_FASTRELOAD", GetWeapon("zombie_perk_bottle_sleight"));
	zm_perks::register_perk_precache_func("specialty_fastreload", &sleight_of_hand_precache);
	zm_perks::register_perk_clientfields("specialty_fastreload", &sleight_of_hand_register_clientfield, &sleight_of_hand_set_clientfield);
	zm_perks::register_perk_machine("specialty_fastreload", &sleight_of_hand_perk_machine_setup);
	zm_perks::register_perk_host_migration_params("specialty_fastreload", "vending_sleight", "sleight_light");
}

/*
	Name: sleight_of_hand_precache
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x424F4353
	Offset: 0x4B8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function sleight_of_hand_precache()
{
	if(isdefined(level.sleight_of_hand_precache_override_func))
	{
		[[level.sleight_of_hand_precache_override_func]]();
		return;
	}
	level._effect["sleight_light"] = "zombie/fx_perk_sleight_of_hand_zmb";
	level.machine_assets["specialty_fastreload"] = spawnstruct();
	level.machine_assets["specialty_fastreload"].weapon = GetWeapon("zombie_perk_bottle_sleight");
	level.machine_assets["specialty_fastreload"].off_model = "p7_zm_vending_sleight";
	level.machine_assets["specialty_fastreload"].on_model = "p7_zm_vending_sleight";
}

/*
	Name: sleight_of_hand_register_clientfield
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x424F4353
	Offset: 0x5A0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function sleight_of_hand_register_clientfield()
{
}

/*
	Name: sleight_of_hand_set_clientfield
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x424F4353
	Offset: 0x5B0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 118
*/
function sleight_of_hand_set_clientfield(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_fastreload", "sleight_of_hand", "SetIconActive", state);
}

/*
	Name: sleight_of_hand_perk_machine_setup
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x424F4353
	Offset: 0x5F8
	Size: 0xBC
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

