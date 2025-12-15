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

#namespace zm_perk_deadshot;

/*
	Name: __init__sytem__
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x360
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 27
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_deadshot", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x3A0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function __init__()
{
	enable_deadshot_perk_for_level();
}

/*
	Name: enable_deadshot_perk_for_level
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x3C0
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function enable_deadshot_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_deadshot", "deadshot", 1500, &"ZOMBIE_PERK_DEADSHOT", GetWeapon("zombie_perk_bottle_deadshot"));
	zm_perks::register_perk_precache_func("specialty_deadshot", &deadshot_precache);
	zm_perks::register_perk_clientfields("specialty_deadshot", &deadshot_register_clientfield, &deadshot_set_clientfield);
	zm_perks::register_perk_machine("specialty_deadshot", &deadshot_perk_machine_setup);
	zm_perks::register_perk_threads("specialty_deadshot", &give_deadshot_perk, &take_deadshot_perk);
	zm_perks::register_perk_host_migration_params("specialty_deadshot", "vending_deadshot", "deadshot_light");
	return;
}

/*
	Name: deadshot_precache
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x4F8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function deadshot_precache()
{
	if(isdefined(level.deadshot_precache_override_func))
	{
		[[level.deadshot_precache_override_func]]();
		return;
	}
	level._effect["deadshot_light"] = "_t6/misc/fx_zombie_cola_dtap_on";
	level.machine_assets["specialty_deadshot"] = spawnstruct();
	level.machine_assets["specialty_deadshot"].weapon = GetWeapon("zombie_perk_bottle_deadshot");
	level.machine_assets["specialty_deadshot"].off_model = "p7_zm_vending_ads";
	level.machine_assets["specialty_deadshot"].on_model = "p7_zm_vending_ads";
}

/*
	Name: deadshot_register_clientfield
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x5E0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function deadshot_register_clientfield()
{
	clientfield::register("toplayer", "deadshot_perk", 1, 1, "int");
	return;
}

/*
	Name: deadshot_set_clientfield
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x620
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 118
*/
function deadshot_set_clientfield(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_deadshot", "dead_shot", "SetIconActive", state);
}

/*
	Name: deadshot_perk_machine_setup
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x668
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 133
*/
function deadshot_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_deadshot_jingle";
	use_trigger.script_string = "deadshot_perk";
	use_trigger.script_label = "mus_perks_deadshot_sting";
	use_trigger.target = "vending_deadshot";
	perk_machine.script_string = "deadshot_vending";
	perk_machine.targetname = "vending_deadshot";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "deadshot_vending";
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: give_deadshot_perk
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x730
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 159
*/
function give_deadshot_perk()
{
	self clientfield::set_to_player("deadshot_perk", 1);
	return;
}

/*
	Name: take_deadshot_perk
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x760
	Size: 0x3C
	Parameters: 3
	Flags: None
	Line Number: 175
*/
function take_deadshot_perk(b_pause, str_perk, str_result)
{
	self clientfield::set_to_player("deadshot_perk", 0);
}

