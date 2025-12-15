#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
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

#namespace zm_perk_juggernaut;

/*
	Name: __init__sytem__
	Namespace: zm_perk_juggernaut
	Checksum: 0x43E8B946
	Offset: 0x3B8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 27
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_juggernaut", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_juggernaut
	Checksum: 0xA6F219DA
	Offset: 0x3F8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function __init__()
{
	enable_juggernaut_perk_for_level();
}

/*
	Name: enable_juggernaut_perk_for_level
	Namespace: zm_perk_juggernaut
	Checksum: 0x669AD749
	Offset: 0x418
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function enable_juggernaut_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_armorvest", "juggernog", 2500, &"VK_DESC_JUGGERNOG", GetWeapon("zombie_perk_bottle_jugg"));
	zm_perks::register_perk_precache_func("specialty_armorvest", &juggernaut_precache);
	zm_perks::register_perk_clientfields("specialty_armorvest", &juggernaut_register_clientfield, &juggernaut_set_clientfield);
	zm_perks::register_perk_machine("specialty_armorvest", &juggernaut_perk_machine_setup, &init_juggernaut);
	zm_perks::register_perk_threads("specialty_armorvest", &give_juggernaut_perk, &take_juggernaut_perk);
	zm_perks::register_perk_host_migration_params("specialty_armorvest", "vending_jugg", "jugger_light");
}

/*
	Name: init_juggernaut
	Namespace: zm_perk_juggernaut
	Checksum: 0xBEBF6DD4
	Offset: 0x560
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function init_juggernaut()
{
	zombie_utility::set_zombie_var("zombie_perk_juggernaut_health", 100);
	zombie_utility::set_zombie_var("zombie_perk_juggernaut_health_upgrade", 150);
}

/*
	Name: juggernaut_precache
	Namespace: zm_perk_juggernaut
	Checksum: 0x8442CE62
	Offset: 0x5B0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function juggernaut_precache()
{
	if(isdefined(level.juggernaut_precache_override_func))
	{
		[[level.juggernaut_precache_override_func]]();
		return;
	}
	level._effect["jugger_light"] = "zombie/fx_perk_juggernaut_zmb";
	level.machine_assets["specialty_armorvest"] = spawnstruct();
	level.machine_assets["specialty_armorvest"].weapon = GetWeapon("zombie_perk_bottle_jugg");
	level.machine_assets["specialty_armorvest"].off_model = "p9_sur_machine_jugg_off";
	level.machine_assets["specialty_armorvest"].on_model = "p9_sur_machine_jugg_on";
}

/*
	Name: juggernaut_register_clientfield
	Namespace: zm_perk_juggernaut
	Checksum: 0x415456F3
	Offset: 0x698
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 117
*/
function juggernaut_register_clientfield()
{
	clientfield::register("clientuimodel", "hudItems.perks.juggernaut", 1, 2, "int");
}

/*
	Name: juggernaut_set_clientfield
	Namespace: zm_perk_juggernaut
	Checksum: 0x6D537136
	Offset: 0x6D8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 132
*/
function juggernaut_set_clientfield(state)
{
	self clientfield::set_player_uimodel("hudItems.perks.juggernaut", state);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: juggernaut_perk_machine_setup
	Namespace: zm_perk_juggernaut
	Checksum: 0xCE11E565
	Offset: 0x710
	Size: 0xD0
	Parameters: 4
	Flags: None
	Line Number: 149
*/
function juggernaut_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_jugganog_jingle";
	use_trigger.script_string = "jugg_perk";
	use_trigger.script_label = "mus_perks_jugganog_sting";
	use_trigger.longJingleWait = 1;
	use_trigger.target = "vending_jugg";
	perk_machine.script_string = "jugg_perk";
	perk_machine.targetname = "vending_jugg";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "jugg_perk";
	}
}

/*
	Name: give_juggernaut_perk
	Namespace: zm_perk_juggernaut
	Checksum: 0x87B98B82
	Offset: 0x7E8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 174
*/
function give_juggernaut_perk()
{
	self zm_perks::perk_set_max_health_if_jugg("specialty_armorvest", 1, 0);
	return;
}

/*
	Name: take_juggernaut_perk
	Namespace: zm_perk_juggernaut
	Checksum: 0x3D72C84D
	Offset: 0x818
	Size: 0x44
	Parameters: 3
	Flags: None
	Line Number: 190
*/
function take_juggernaut_perk(b_pause, str_perk, str_result)
{
	self zm_perks::perk_set_max_health_if_jugg("health_reboot", 1, 1);
}

