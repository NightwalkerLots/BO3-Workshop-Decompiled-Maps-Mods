#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace namespace_163c39a8;

/*
	Name: __init__sytem__
	Namespace: namespace_163c39a8
	Checksum: 0x3C6DB9D9
	Offset: 0x1C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_banana_colada", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_163c39a8
	Checksum: 0xA2AB74EB
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
		function_74ae19cb();
	}
}

/*
	Name: function_74ae19cb
	Namespace: namespace_163c39a8
	Checksum: 0x9B4337C9
	Offset: 0x240
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function function_74ae19cb()
{
	zm_perks::register_perk_clientfields("specialty_immunecounteruav", &function_a8803997, &function_768d73ca);
	zm_perks::register_perk_effects("specialty_immunecounteruav", "specialty_immunecounteruav");
	zm_perks::register_perk_init_thread("specialty_immunecounteruav", &function_aa0dee34);
}

/*
	Name: function_aa0dee34
	Namespace: namespace_163c39a8
	Checksum: 0x2D6C5A80
	Offset: 0x2D0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function function_aa0dee34()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_immunecounteruav"] = "zombie/fx_perk_doubletap2_zmb";
		continue;
	}
	level._effect["specialty_immunecounteruav"] = "zombie/fx_perk_doubletap2_factory_zmb";
}

/*
	Name: function_a8803997
	Namespace: namespace_163c39a8
	Checksum: 0x9ACF73B8
	Offset: 0x378
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function function_a8803997()
{
}

/*
	Name: function_768d73ca
	Namespace: namespace_163c39a8
	Checksum: 0x9ACF73B8
	Offset: 0x388
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_768d73ca()
{
}

