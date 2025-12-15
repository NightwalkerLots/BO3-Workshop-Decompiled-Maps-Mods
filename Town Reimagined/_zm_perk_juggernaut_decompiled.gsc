#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
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

#namespace zm_perk_juggernaut;

/*
	Name: __init__sytem__
	Namespace: zm_perk_juggernaut
	Checksum: 0x3321D88E
	Offset: 0x3F0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 28
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_juggernaut", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_juggernaut
	Checksum: 0xDEB623
	Offset: 0x430
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 43
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_juggernaut_perk_for_level();
	}
}

/*
	Name: enable_juggernaut_perk_for_level
	Namespace: zm_perk_juggernaut
	Checksum: 0x195FE5E0
	Offset: 0x468
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function enable_juggernaut_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_armorvest", "juggernog", 2500, &"ZOMBIE_PERK_JUGGERNAUT", GetWeapon("zombie_perk_bottle_jugg"));
	zm_perks::register_perk_precache_func("specialty_armorvest", &juggernaut_precache);
	zm_perks::register_perk_clientfields("specialty_armorvest", &juggernaut_register_clientfield, &juggernaut_set_clientfield);
	zm_perks::register_perk_machine("specialty_armorvest", &juggernaut_perk_machine_setup, &function_3c1e52f2);
	zm_perks::register_perk_threads("specialty_armorvest", &function_1f2a5666, &function_83c12f54);
	zm_perks::register_perk_host_migration_params("specialty_armorvest", "vending_jugg", "specialty_armorvest");
}

/*
	Name: function_3c1e52f2
	Namespace: zm_perk_juggernaut
	Checksum: 0xA9367CF8
	Offset: 0x5B0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 81
*/
function function_3c1e52f2()
{
	zombie_utility::set_zombie_var("zombie_perk_juggernaut_health", 100);
	zombie_utility::set_zombie_var("zombie_perk_juggernaut_health_upgrade", 150);
}

/*
	Name: juggernaut_precache
	Namespace: zm_perk_juggernaut
	Checksum: 0xFC5C7E55
	Offset: 0x600
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function juggernaut_precache()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_armorvest"] = "zombie/fx_perk_juggernaut_zmb";
		continue;
	}
	level._effect["specialty_armorvest"] = "zombie/fx_perk_juggernaut_factory_zmb";
	level.machine_assets["specialty_armorvest"] = spawnstruct();
	level.machine_assets["specialty_armorvest"].weapon = GetWeapon("zombie_perk_bottle_jugg");
	level.machine_assets["specialty_armorvest"].off_model = "p7_zm_vending_jugg";
	level.machine_assets["specialty_armorvest"].on_model = "p7_zm_vending_jugg";
}

/*
	Name: juggernaut_register_clientfield
	Namespace: zm_perk_juggernaut
	Checksum: 0x9ACF73B8
	Offset: 0x740
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 122
*/
function juggernaut_register_clientfield()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: juggernaut_set_clientfield
	Namespace: zm_perk_juggernaut
	Checksum: 0xF5BA7826
	Offset: 0x750
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 138
*/
function juggernaut_set_clientfield(state)
{
	return;
}

/*
	Name: juggernaut_perk_machine_setup
	Namespace: zm_perk_juggernaut
	Checksum: 0x74E6586F
	Offset: 0x768
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 153
*/
function juggernaut_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_jugganog_jingle";
	use_trigger.script_string = "jugg_perk";
	use_trigger.script_label = "mus_perks_jugganog_sting";
	use_trigger.target = "vending_jugg";
	perk_machine.script_string = "jugg_perk";
	perk_machine.targetname = "vending_jugg";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "jugg_perk";
	}
}

/*
	Name: function_1f2a5666
	Namespace: zm_perk_juggernaut
	Checksum: 0x7A69577A
	Offset: 0x830
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 177
*/
function function_1f2a5666(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_armorvest", "t6_specialty_armorvest");
	self notify("specialty_armorvest" + "_start");
	self function_a12550a3();
}

/*
	Name: function_83c12f54
	Namespace: zm_perk_juggernaut
	Checksum: 0xD13293E1
	Offset: 0x8B0
	Size: 0x80
	Parameters: 3
	Flags: None
	Line Number: 194
*/
function function_83c12f54(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_armorvest");
	self notify("perk_lost", str_perk);
	self notify("specialty_armorvest" + "_stop");
	self function_12076f5c();
}

/*
	Name: function_acf38280
	Namespace: zm_perk_juggernaut
	Checksum: 0x156EF02D
	Offset: 0x938
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 212
*/
function function_acf38280()
{
	var_c53cdaa = GetEntArray("vending_jugg", "targetname");
	foreach(perk_machine in var_c53cdaa)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "p7_zm_vending_jugg")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("juggernog");
		}
	}
	return;
	var_c53cdaa;
}

/*
	Name: function_a12550a3
	Namespace: zm_perk_juggernaut
	Checksum: 0x8D218536
	Offset: 0xA50
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 237
*/
function function_a12550a3()
{
	self zm_perks::perk_set_max_health_if_jugg("specialty_armorvest", 1, 0);
	return;
	~;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_12076f5c
	Namespace: zm_perk_juggernaut
	Checksum: 0xF510943D
	Offset: 0xA80
	Size: 0x24
	Parameters: 0
	Flags: None
	Line Number: 255
*/
function function_12076f5c()
{
	self zm_perks::perk_set_max_health_if_jugg("health_reboot", 1, 0);
}

