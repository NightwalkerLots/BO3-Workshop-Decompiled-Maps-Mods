#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\scene_shared;
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

#namespace zm_perk_sleight_of_hand;

/*
	Name: __init__sytem__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x1A32F040
	Offset: 0x408
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
	Checksum: 0x1E0C8DAC
	Offset: 0x448
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	level thread wait_for_power();
	enable_sleight_of_hand_perk_for_level();
}

/*
	Name: enable_sleight_of_hand_perk_for_level
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xFEA379F2
	Offset: 0x480
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function enable_sleight_of_hand_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_fastreload", "sleight", 3000, &"VK_DESC_SPEEDCOLA", GetWeapon("zombie_perk_bottle_sleight"));
	zm_perks::register_perk_precache_func("specialty_fastreload", &sleight_of_hand_precache);
	zm_perks::register_perk_clientfields("specialty_fastreload", &sleight_of_hand_register_clientfield, &sleight_of_hand_set_clientfield);
	zm_perks::register_perk_machine("specialty_fastreload", &sleight_of_hand_perk_machine_setup);
	zm_perks::register_perk_host_migration_params("specialty_fastreload", "vending_sleight", "sleight_light");
}

/*
	Name: sleight_of_hand_precache
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xF8898555
	Offset: 0x580
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 79
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
	level.machine_assets["specialty_fastreload"].off_model = "p9_sur_machine_speed_cola_off_purple";
	level.machine_assets["specialty_fastreload"].on_model = "p9_sur_machine_speed_cola_on_purple";
}

/*
	Name: sleight_of_hand_register_clientfield
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x7FE52E59
	Offset: 0x668
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 103
*/
function sleight_of_hand_register_clientfield()
{
	clientfield::register("clientuimodel", "hudItems.perks.sleight_of_hand", 1, 2, "int");
}

/*
	Name: sleight_of_hand_set_clientfield
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xABAA9E67
	Offset: 0x6A8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 118
*/
function sleight_of_hand_set_clientfield(state)
{
	self clientfield::set_player_uimodel("hudItems.perks.sleight_of_hand", state);
}

/*
	Name: sleight_of_hand_perk_machine_setup
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x53B49E38
	Offset: 0x6E0
	Size: 0xC0
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

/*
	Name: wait_for_power
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xFF887B91
	Offset: 0x7A8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 157
*/
function wait_for_power()
{
	structs = struct::get_array("speed_cola_cans_bundle", "targetname");
	foreach(struct in structs)
	{
		struct thread function_651a8b6c();
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_651a8b6c
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x7BDE8C36
	Offset: 0x868
	Size: 0x94
	Parameters: 0
	Flags: None
	Line Number: 178
*/
function function_651a8b6c()
{
	Awning = spawn("script_model", self.origin);
	Awning.angles = self.angles;
	Awning SetModel("p9_fxanim_zm_gp_speed_cola_lava_xmodel");
	level waittill("power_on");
	Awning thread scene::Play("t9_speedcola_cans_anim", Awning);
}

