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

#namespace zm_perk_staminup;

/*
	Name: __init__sytem__
	Namespace: zm_perk_staminup
	Checksum: 0x4A14C665
	Offset: 0x380
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 27
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_staminup", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_staminup
	Checksum: 0xFB754972
	Offset: 0x3C0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_staminup_perk_for_level();
	}
}

/*
	Name: enable_staminup_perk_for_level
	Namespace: zm_perk_staminup
	Checksum: 0x43FD7AB1
	Offset: 0x3F8
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function enable_staminup_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_staminup", "marathon", 2000, &"ZOMBIE_PERK_MARATHON", GetWeapon("zombie_perk_bottle_marathon"));
	zm_perks::register_perk_precache_func("specialty_staminup", &staminup_precache);
	zm_perks::register_perk_clientfields("specialty_staminup", &staminup_register_clientfield, &staminup_set_clientfield);
	zm_perks::register_perk_machine("specialty_staminup", &staminup_perk_machine_setup);
	zm_perks::register_perk_threads("specialty_staminup", &function_852448f3, &function_a4c9b351);
	zm_perks::register_perk_host_migration_params("specialty_staminup", "vending_marathon", "specialty_staminup");
}

/*
	Name: staminup_precache
	Namespace: zm_perk_staminup
	Checksum: 0x96FA33DE
	Offset: 0x530
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function staminup_precache()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_staminup"] = "zombie/fx_perk_stamin_up_zmb";
		continue;
	}
	level._effect["specialty_staminup"] = "zombie/fx_perk_stamin_up_factory_zmb";
	level.machine_assets["specialty_staminup"] = spawnstruct();
	level.machine_assets["specialty_staminup"].weapon = GetWeapon("zombie_perk_bottle_marathon");
	level.machine_assets["specialty_staminup"].off_model = "p7_zm_vending_marathon";
	level.machine_assets["specialty_staminup"].on_model = "p7_zm_vending_marathon";
}

/*
	Name: staminup_register_clientfield
	Namespace: zm_perk_staminup
	Checksum: 0x9ACF73B8
	Offset: 0x670
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function staminup_register_clientfield()
{
}

/*
	Name: staminup_set_clientfield
	Namespace: zm_perk_staminup
	Checksum: 0x9D0A4AF
	Offset: 0x680
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 119
*/
function staminup_set_clientfield(state)
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: staminup_perk_machine_setup
	Namespace: zm_perk_staminup
	Checksum: 0x7F4624F
	Offset: 0x698
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 135
*/
function staminup_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_stamin_jingle";
	use_trigger.script_string = "marathon_perk";
	use_trigger.script_label = "mus_perks_stamin_sting";
	use_trigger.target = "vending_marathon";
	perk_machine.script_string = "marathon_perk";
	perk_machine.targetname = "vending_marathon";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "marathon_perk";
		return;
	}
}

/*
	Name: function_852448f3
	Namespace: zm_perk_staminup
	Checksum: 0xAFFC4A31
	Offset: 0x760
	Size: 0x60
	Parameters: 3
	Flags: None
	Line Number: 160
*/
function function_852448f3(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_staminup", "t6_specialty_staminup");
	self notify("specialty_staminup" + "_start");
}

/*
	Name: function_a4c9b351
	Namespace: zm_perk_staminup
	Checksum: 0xED976012
	Offset: 0x7C8
	Size: 0x68
	Parameters: 3
	Flags: None
	Line Number: 176
*/
function function_a4c9b351(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_staminup");
	self notify("perk_lost", str_perk);
	self notify("specialty_staminup" + "_stop");
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5cf2b2e9
	Namespace: zm_perk_staminup
	Checksum: 0xAE86467D
	Offset: 0x838
	Size: 0x10A
	Parameters: 0
	Flags: None
	Line Number: 196
*/
function function_5cf2b2e9()
{
	var_f85e8e1d = GetEntArray("vending_marathon", "targetname");
	foreach(perk_machine in var_f85e8e1d)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "p7_zm_vending_marathon")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("marathon");
		}
	}
}

