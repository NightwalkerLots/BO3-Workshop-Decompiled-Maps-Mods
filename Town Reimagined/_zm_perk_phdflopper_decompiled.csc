#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace zm_perk_phdflopper;

/*
	Name: __init__sytem__
	Namespace: zm_perk_phdflopper
	Checksum: 0x30071AB0
	Offset: 0x1C0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_phdflopper", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: zm_perk_phdflopper
	Checksum: 0x5E43A683
	Offset: 0x200
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_phdflopper_perk_for_level();
	}
}

/*
	Name: enable_phdflopper_perk_for_level
	Namespace: zm_perk_phdflopper
	Checksum: 0xE55BB76C
	Offset: 0x238
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function enable_phdflopper_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_phdflopper", &phdflopper_client_field_func, &function_1630f428);
	zm_perks::register_perk_effects("specialty_phdflopper", "specialty_phdflopper");
	zm_perks::register_perk_init_thread("specialty_phdflopper", &function_edd977da);
}

/*
	Name: function_edd977da
	Namespace: zm_perk_phdflopper
	Checksum: 0x80B6EC7E
	Offset: 0x2C8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function function_edd977da()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_phdflopper"] = "zombie/fx_perk_doubletap2_zmb";
		continue;
	}
	level._effect["specialty_phdflopper"] = "zombie/fx_perk_doubletap2_factory_zmb";
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: phdflopper_client_field_func
	Namespace: zm_perk_phdflopper
	Checksum: 0x9ACF73B8
	Offset: 0x370
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function phdflopper_client_field_func()
{
}

/*
	Name: function_1630f428
	Namespace: zm_perk_phdflopper
	Checksum: 0x9ACF73B8
	Offset: 0x380
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function function_1630f428()
{
}

