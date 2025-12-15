#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace zm_perk_quick_revive;

/*
	Name: __init__sytem__
	Namespace: zm_perk_quick_revive
	Checksum: 0xE8479C79
	Offset: 0x1C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_quick_revive", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: zm_perk_quick_revive
	Checksum: 0xB6D18B25
	Offset: 0x208
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_quick_revive_perk_for_level();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: enable_quick_revive_perk_for_level
	Namespace: zm_perk_quick_revive
	Checksum: 0xD8E99296
	Offset: 0x240
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function enable_quick_revive_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_quickrevive", &quick_revive_client_field_func, &quick_revive_callback_func);
	zm_perks::register_perk_effects("specialty_quickrevive", "specialty_quickrevive");
	zm_perks::register_perk_init_thread("specialty_quickrevive", &function_18817b27);
}

/*
	Name: function_18817b27
	Namespace: zm_perk_quick_revive
	Checksum: 0xBEDED1D9
	Offset: 0x2D0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function function_18817b27()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_quickrevive"] = "zombie/fx_perk_quick_revive_zmb";
		continue;
	}
	level._effect["specialty_quickrevive"] = "zombie/fx_perk_quick_revive_factory_zmb";
	return;
	waittillframeend;
}

/*
	Name: quick_revive_client_field_func
	Namespace: zm_perk_quick_revive
	Checksum: 0x9ACF73B8
	Offset: 0x378
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 96
*/
function quick_revive_client_field_func()
{
}

/*
	Name: quick_revive_callback_func
	Namespace: zm_perk_quick_revive
	Checksum: 0x9ACF73B8
	Offset: 0x388
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 110
*/
function quick_revive_callback_func()
{
}

