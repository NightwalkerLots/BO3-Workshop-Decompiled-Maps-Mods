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

#namespace zm_perk_doubletap2;

/*
	Name: __init__sytem__
	Namespace: zm_perk_doubletap2
	Checksum: 0x424F4353
	Offset: 0x350
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 27
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_doubletap2", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_doubletap2
	Checksum: 0x424F4353
	Offset: 0x390
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function __init__()
{
	enable_doubletap2_perk_for_level();
}

/*
	Name: enable_doubletap2_perk_for_level
	Namespace: zm_perk_doubletap2
	Checksum: 0x424F4353
	Offset: 0x3B0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function enable_doubletap2_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_doubletap2", "doubletap", 2000, &"ZOMBIE_PERK_DOUBLETAP", GetWeapon("zombie_perk_bottle_doubletap"));
	zm_perks::register_perk_precache_func("specialty_doubletap2", &doubletap2_precache);
	zm_perks::register_perk_clientfields("specialty_doubletap2", &doubletap2_register_clientfield, &doubletap2_set_clientfield);
	zm_perks::register_perk_machine("specialty_doubletap2", &doubletap2_perk_machine_setup);
	zm_perks::register_perk_host_migration_params("specialty_doubletap2", "vending_doubletap", "doubletap2_light");
}

/*
	Name: doubletap2_precache
	Namespace: zm_perk_doubletap2
	Checksum: 0x424F4353
	Offset: 0x4B0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function doubletap2_precache()
{
	if(isdefined(level.doubletap2_precache_override_func))
	{
		[[level.doubletap2_precache_override_func]]();
		return;
	}
	level._effect["doubletap2_light"] = "zombie/fx_perk_doubletap2_zmb";
	level.machine_assets["specialty_doubletap2"] = spawnstruct();
	level.machine_assets["specialty_doubletap2"].weapon = GetWeapon("zombie_perk_bottle_doubletap");
	level.machine_assets["specialty_doubletap2"].off_model = "p7_zm_vending_doubletap2";
	level.machine_assets["specialty_doubletap2"].on_model = "p7_zm_vending_doubletap2";
}

/*
	Name: doubletap2_register_clientfield
	Namespace: zm_perk_doubletap2
	Checksum: 0x424F4353
	Offset: 0x598
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 100
*/
function doubletap2_register_clientfield()
{
}

/*
	Name: doubletap2_set_clientfield
	Namespace: zm_perk_doubletap2
	Checksum: 0x424F4353
	Offset: 0x5A8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 114
*/
function doubletap2_set_clientfield(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_doubletap2", "doubletap2", "SetIconActive", state);
}

/*
	Name: doubletap2_perk_machine_setup
	Namespace: zm_perk_doubletap2
	Checksum: 0x424F4353
	Offset: 0x5F0
	Size: 0xBC
	Parameters: 4
	Flags: None
	Line Number: 129
*/
function doubletap2_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_doubletap_jingle";
	use_trigger.script_string = "tap_perk";
	use_trigger.script_label = "mus_perks_doubletap_sting";
	use_trigger.target = "vending_doubletap";
	perk_machine.script_string = "tap_perk";
	perk_machine.targetname = "vending_doubletap";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "tap_perk";
	}
}

