#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\vk_script\_zm_vk_general;
#include scripts\zm\_util;
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
	Checksum: 0xED9725FA
	Offset: 0x390
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
	Checksum: 0xE98DDC7B
	Offset: 0x3D0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function __init__()
{
	enable_staminup_perk_for_level();
}

/*
	Name: enable_staminup_perk_for_level
	Namespace: zm_perk_staminup
	Checksum: 0xDC6D1530
	Offset: 0x3F0
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function enable_staminup_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_staminup", "marathon", 2000, &"VK_DESC_STAMINUP", GetWeapon("zombie_perk_bottle_marathon"));
	zm_perks::register_perk_precache_func("specialty_staminup", &staminup_precache);
	zm_perks::register_perk_clientfields("specialty_staminup", &staminup_register_clientfield, &staminup_set_clientfield);
	zm_perks::register_perk_machine("specialty_staminup", &staminup_perk_machine_setup);
	zm_perks::register_perk_host_migration_params("specialty_staminup", "vending_marathon", "marathon_light");
	zm_perks::register_perk_threads("specialty_staminup", &function_852448f3, &function_a4c9b351);
}

/*
	Name: function_852448f3
	Namespace: zm_perk_staminup
	Checksum: 0x89C8BE37
	Offset: 0x528
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_852448f3()
{
	namespace_f56b53f0::function_dbe7e78b("Staminup Given");
	self.var_ada1f46a = 1;
}

/*
	Name: function_a4c9b351
	Namespace: zm_perk_staminup
	Checksum: 0x2A2E9002
	Offset: 0x558
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function function_a4c9b351()
{
	namespace_f56b53f0::function_dbe7e78b("Staminup Taken");
	self.var_ada1f46a = 0;
}

/*
	Name: staminup_precache
	Namespace: zm_perk_staminup
	Checksum: 0xE68019A6
	Offset: 0x588
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 109
*/
function staminup_precache()
{
	if(isdefined(level.staminup_precache_override_func))
	{
		[[level.staminup_precache_override_func]]();
		return;
	}
	level._effect["marathon_light"] = "zombie/fx_perk_stamin_up_zmb";
	level.machine_assets["specialty_staminup"] = spawnstruct();
	level.machine_assets["specialty_staminup"].weapon = GetWeapon("zombie_perk_bottle_marathon");
	level.machine_assets["specialty_staminup"].off_model = "p9_sur_machine_staminup_off";
	level.machine_assets["specialty_staminup"].on_model = "p9_sur_machine_staminup_on";
}

/*
	Name: staminup_register_clientfield
	Namespace: zm_perk_staminup
	Checksum: 0x7AA7BC55
	Offset: 0x670
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 133
*/
function staminup_register_clientfield()
{
	clientfield::register("clientuimodel", "hudItems.perks.marathon", 1, 2, "int");
}

/*
	Name: staminup_set_clientfield
	Namespace: zm_perk_staminup
	Checksum: 0x641064BC
	Offset: 0x6B0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 148
*/
function staminup_set_clientfield(state)
{
	self clientfield::set_player_uimodel("hudItems.perks.marathon", state);
}

/*
	Name: staminup_perk_machine_setup
	Namespace: zm_perk_staminup
	Checksum: 0x984E4A59
	Offset: 0x6E8
	Size: 0xBC
	Parameters: 4
	Flags: None
	Line Number: 163
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
	}
}

