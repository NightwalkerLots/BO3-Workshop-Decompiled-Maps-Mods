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

#namespace zm_perk_deadshot;

/*
	Name: __init__sytem__
	Namespace: zm_perk_deadshot
	Checksum: 0x13CA80F3
	Offset: 0x390
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 27
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_deadshot", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: __init__
	Namespace: zm_perk_deadshot
	Checksum: 0x17848C7
	Offset: 0x3D0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_deadshot_perk_for_level();
	}
}

/*
	Name: enable_deadshot_perk_for_level
	Namespace: zm_perk_deadshot
	Checksum: 0xB33FDB8C
	Offset: 0x408
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function enable_deadshot_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_deadshot", "deadshot", 1500, &"ZOMBIE_PERK_DEADSHOT", GetWeapon("zombie_perk_bottle_deadshot"));
	zm_perks::register_perk_precache_func("specialty_deadshot", &deadshot_precache);
	zm_perks::register_perk_clientfields("specialty_deadshot", &deadshot_register_clientfield, &deadshot_set_clientfield);
	zm_perks::register_perk_machine("specialty_deadshot", &deadshot_perk_machine_setup);
	zm_perks::register_perk_threads("specialty_deadshot", &function_5fb7e9f8, &function_77ead2ea);
	zm_perks::register_perk_host_migration_params("specialty_deadshot", "vending_deadshot", "specialty_deadshot");
}

/*
	Name: deadshot_precache
	Namespace: zm_perk_deadshot
	Checksum: 0x4429FF5B
	Offset: 0x540
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 83
*/
function deadshot_precache()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_deadshot"] = "zombie/fx_perk_daiquiri_zmb";
		continue;
	}
	level._effect["specialty_deadshot"] = "zombie/fx_perk_daiquiri_factory_zmb";
	level.machine_assets["specialty_deadshot"] = spawnstruct();
	level.machine_assets["specialty_deadshot"].weapon = GetWeapon("zombie_perk_bottle_deadshot");
	level.machine_assets["specialty_deadshot"].off_model = "p7_zm_vending_deadshot";
	level.machine_assets["specialty_deadshot"].on_model = "p7_zm_vending_deadshot";
}

/*
	Name: deadshot_register_clientfield
	Namespace: zm_perk_deadshot
	Checksum: 0xFF459ABF
	Offset: 0x680
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 108
*/
function deadshot_register_clientfield()
{
	clientfield::register("toplayer", "deadshot_perk", 1, 1, "int");
}

/*
	Name: deadshot_set_clientfield
	Namespace: zm_perk_deadshot
	Checksum: 0x1F78EF4B
	Offset: 0x6C0
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 123
*/
function deadshot_set_clientfield(state)
{
}

/*
	Name: deadshot_perk_machine_setup
	Namespace: zm_perk_deadshot
	Checksum: 0xFB1C7345
	Offset: 0x6D8
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 137
*/
function deadshot_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_deadshot_jingle";
	use_trigger.script_string = "deadshot_perk";
	use_trigger.script_label = "mus_perks_deadshot_sting";
	use_trigger.target = "vending_deadshot";
	perk_machine.script_string = "deadshot_perk";
	perk_machine.targetname = "vending_deadshot";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "deadshot_perk";
	}
}

/*
	Name: function_5fb7e9f8
	Namespace: zm_perk_deadshot
	Checksum: 0xA4EDEAD0
	Offset: 0x7A0
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 161
*/
function function_5fb7e9f8(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_deadshot", "t6_specialty_deadshot");
	self notify("specialty_deadshot" + "_start");
	self function_7f59eaad();
}

/*
	Name: function_77ead2ea
	Namespace: zm_perk_deadshot
	Checksum: 0x8A30CFED
	Offset: 0x820
	Size: 0x80
	Parameters: 3
	Flags: None
	Line Number: 178
*/
function function_77ead2ea(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_deadshot");
	self notify("perk_lost", str_perk);
	self notify("specialty_deadshot" + "_stop");
	self function_a701fb22();
}

/*
	Name: function_ed3f492
	Namespace: zm_perk_deadshot
	Checksum: 0xF1D03345
	Offset: 0x8A8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 196
*/
function function_ed3f492()
{
	var_a159ec88 = GetEntArray("vending_deadshot", "targetname");
	foreach(perk_machine in var_a159ec88)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "p7_zm_vending_deadshot")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("deadshot");
		}
	}
}

/*
	Name: function_7f59eaad
	Namespace: zm_perk_deadshot
	Checksum: 0x45504E67
	Offset: 0x9C0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 219
*/
function function_7f59eaad()
{
	self clientfield::set_to_player("deadshot_perk", 1);
}

/*
	Name: function_a701fb22
	Namespace: zm_perk_deadshot
	Checksum: 0xEBE791B3
	Offset: 0x9F0
	Size: 0x3C
	Parameters: 3
	Flags: None
	Line Number: 234
*/
function function_a701fb22(b_pause, str_perk, str_result)
{
	self clientfield::set_to_player("deadshot_perk", 0);
}

