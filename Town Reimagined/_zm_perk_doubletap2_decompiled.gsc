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

#namespace zm_perk_doubletap2;

/*
	Name: __init__sytem__
	Namespace: zm_perk_doubletap2
	Checksum: 0xFE9796B9
	Offset: 0x390
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
	Checksum: 0x2342F3D9
	Offset: 0x3D0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_158e5e94();
	}
}

/*
	Name: function_158e5e94
	Namespace: zm_perk_doubletap2
	Checksum: 0x8723B6A2
	Offset: 0x408
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function function_158e5e94()
{
	zm_perks::register_perk_basic_info("specialty_doubletap2", "doubletap", 2000, &"ZOMBIE_PERK_DOUBLETAP", GetWeapon("zombie_perk_bottle_doubletap"));
	zm_perks::register_perk_precache_func("specialty_doubletap2", &function_f3111762);
	zm_perks::register_perk_clientfields("specialty_doubletap2", &function_5f5a9a40, &function_a095a539);
	zm_perks::register_perk_machine("specialty_doubletap2", &function_354235);
	zm_perks::register_perk_threads("specialty_doubletap2", &function_8fc0ca6d, &function_55c0244f);
	zm_perks::register_perk_host_migration_params("specialty_doubletap2", "vending_doubletap", "specialty_doubletap2");
	return;
}

/*
	Name: function_f3111762
	Namespace: zm_perk_doubletap2
	Checksum: 0xCFE05B98
	Offset: 0x540
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 81
*/
function function_f3111762()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_doubletap2"] = "zombie/fx_perk_doubletap2_zmb";
		continue;
	}
	level._effect["specialty_doubletap2"] = "zombie/fx_perk_doubletap2_factory_zmb";
	level.machine_assets["specialty_doubletap2"] = spawnstruct();
	level.machine_assets["specialty_doubletap2"].weapon = GetWeapon("zombie_perk_bottle_doubletap");
	level.machine_assets["specialty_doubletap2"].off_model = "p7_zm_vending_doubletap2";
	level.machine_assets["specialty_doubletap2"].on_model = "p7_zm_vending_doubletap2";
}

/*
	Name: function_5f5a9a40
	Namespace: zm_perk_doubletap2
	Checksum: 0x9ACF73B8
	Offset: 0x680
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_5f5a9a40()
{
	return;
	.var_0 = undefined;
}

/*
	Name: function_a095a539
	Namespace: zm_perk_doubletap2
	Checksum: 0xEE4932B1
	Offset: 0x690
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 122
*/
function function_a095a539(state)
{
}

/*
	Name: function_354235
	Namespace: zm_perk_doubletap2
	Checksum: 0x49F8D533
	Offset: 0x6A8
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 136
*/
function function_354235(use_trigger, perk_machine, bump_trigger, collision)
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

/*
	Name: function_8fc0ca6d
	Namespace: zm_perk_doubletap2
	Checksum: 0x807BB54
	Offset: 0x770
	Size: 0x60
	Parameters: 3
	Flags: None
	Line Number: 160
*/
function function_8fc0ca6d(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_doubletap2", "t6_specialty_doubletap2");
	self notify("specialty_doubletap2" + "_start");
}

/*
	Name: function_55c0244f
	Namespace: zm_perk_doubletap2
	Checksum: 0xED565FB0
	Offset: 0x7D8
	Size: 0x68
	Parameters: 3
	Flags: None
	Line Number: 176
*/
function function_55c0244f(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_doubletap2");
	self notify("perk_lost", str_perk);
	self notify("specialty_doubletap2" + "_stop");
}

/*
	Name: function_54e391e3
	Namespace: zm_perk_doubletap2
	Checksum: 0x9A214EAB
	Offset: 0x848
	Size: 0x10A
	Parameters: 0
	Flags: None
	Line Number: 193
*/
function function_54e391e3()
{
	var_47473a7b = GetEntArray("vending_doubletap", "targetname");
	foreach(perk_machine in var_47473a7b)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "p7_zm_vending_doubletap2")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("doubletap");
		}
	}
}

