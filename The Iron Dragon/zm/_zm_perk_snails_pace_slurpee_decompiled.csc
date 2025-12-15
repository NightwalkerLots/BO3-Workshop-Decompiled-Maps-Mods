#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace namespace_82faecc8;

/*
	Name: __init__sytem__
	Namespace: namespace_82faecc8
	Checksum: 0xDAD0B4CE
	Offset: 0x250
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_snails_pace", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_82faecc8
	Checksum: 0xDA897B58
	Offset: 0x290
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_96e170a7();
	}
}

/*
	Name: function_96e170a7
	Namespace: namespace_82faecc8
	Checksum: 0x99AECBAE
	Offset: 0x2C8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function function_96e170a7()
{
	zm_perks::register_perk_clientfields("specialty_gpsjammer", &function_2f32a8cf, &function_b0e94b04);
	zm_perks::register_perk_effects("specialty_gpsjammer", "specialty_gpsjammer");
	zm_perks::register_perk_init_thread("specialty_gpsjammer", &function_85b3d9cc);
}

/*
	Name: function_85b3d9cc
	Namespace: namespace_82faecc8
	Checksum: 0x224F3089
	Offset: 0x358
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function function_85b3d9cc()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_gpsjammer"] = "zombie/fx_perk_sleight_of_hand_zmb";
		continue;
	}
	level._effect["specialty_gpsjammer"] = "zombie/fx_perk_sleight_of_hand_factory_zmb";
	clientfield::register("actor", "zombie_eye_change_snail", 1, 1, "int", &function_e797bc64, 0, 0);
}

/*
	Name: function_2f32a8cf
	Namespace: namespace_82faecc8
	Checksum: 0x6DF984FC
	Offset: 0x440
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function function_2f32a8cf()
{
	clientfield::register("clientuimodel", "hudItems.perks.snails_pace", 1, 2, "int", undefined, 0, 1);
}

/*
	Name: function_b0e94b04
	Namespace: namespace_82faecc8
	Checksum: 0x9ACF73B8
	Offset: 0x488
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function function_b0e94b04()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e797bc64
	Namespace: namespace_82faecc8
	Checksum: 0xBD1DEB49
	Offset: 0x498
	Size: 0xBC
	Parameters: 7
	Flags: None
	Line Number: 123
*/
function function_e797bc64(var_3d850ea0, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	self zm::deleteZombieEyes(var_3d850ea0);
	if(var_ee3cd374 == 1)
	{
		self._eyeglow_fx_override = "snails_pace/snails_pace_zombie_eyes";
		self zm::createZombieEyes(var_3d850ea0);
	}
	else if(var_ee3cd374 == 0)
	{
		self._eyeglow_fx_override = undefined;
		self zm::createZombieEyes(var_3d850ea0);
	}
}

