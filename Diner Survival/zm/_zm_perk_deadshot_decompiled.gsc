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

#namespace zm_perk_deadshot;

/*
	Name: __init__sytem__
	Namespace: zm_perk_deadshot
	Checksum: 0xE2294583
	Offset: 0x348
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 26
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_deadshot", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_deadshot
	Checksum: 0x6ABE3FA6
	Offset: 0x388
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 41
*/
function __init__()
{
	enable_deadshot_perk_for_level();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: enable_deadshot_perk_for_level
	Namespace: zm_perk_deadshot
	Checksum: 0x5DB03F74
	Offset: 0x3A8
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function enable_deadshot_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_deadshot", "deadshot", 1500, &"VK_DESC_DEADSHOT", GetWeapon("zombie_perk_bottle_deadshot"));
	zm_perks::register_perk_precache_func("specialty_deadshot", &deadshot_precache);
	zm_perks::register_perk_clientfields("specialty_deadshot", &deadshot_register_clientfield, &deadshot_set_clientfield);
	zm_perks::register_perk_machine("specialty_deadshot", &deadshot_perk_machine_setup);
	zm_perks::register_perk_threads("specialty_deadshot", &give_deadshot_perk, &take_deadshot_perk);
	zm_perks::register_perk_host_migration_params("specialty_deadshot", "vending_deadshot", "deadshot_light");
}

/*
	Name: deadshot_precache
	Namespace: zm_perk_deadshot
	Checksum: 0x9C67C40
	Offset: 0x4E0
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
	Checksum: 0xF24FA476
	Offset: 0x5C8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function deadshot_register_clientfield()
{
	clientfield::register("toplayer", "deadshot_perk", 1, 1, "int");
	clientfield::register("clientuimodel", "hudItems.perks.dead_shot", 1, 2, "int");
}

/*
	Name: deadshot_set_clientfield
	Namespace: zm_perk_deadshot
	Checksum: 0xB047249C
	Offset: 0x638
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 118
*/
function deadshot_set_clientfield(state)
{
	self clientfield::set_player_uimodel("hudItems.perks.dead_shot", state);
}

/*
	Name: deadshot_perk_machine_setup
	Namespace: zm_perk_deadshot
	Checksum: 0x807BFC1F
	Offset: 0x670
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
	}
}

/*
	Name: give_deadshot_perk
	Namespace: zm_perk_deadshot
	Checksum: 0xB6D10442
	Offset: 0x738
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 157
*/
function give_deadshot_perk()
{
	self clientfield::set_to_player("deadshot_perk", 1);
	return;
}

/*
	Name: take_deadshot_perk
	Namespace: zm_perk_deadshot
	Checksum: 0x48D2E387
	Offset: 0x768
	Size: 0x3C
	Parameters: 3
	Flags: None
	Line Number: 173
*/
function take_deadshot_perk(b_pause, str_perk, str_result)
{
	self clientfield::set_to_player("deadshot_perk", 0);
}

