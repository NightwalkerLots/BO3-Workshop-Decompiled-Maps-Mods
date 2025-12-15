#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace namespace_2e8f8ef1;

/*
	Name: __init__sytem__
	Namespace: namespace_2e8f8ef1
	Checksum: 0xD532EFF2
	Offset: 0x1C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_madgaz_moonshine", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_2e8f8ef1
	Checksum: 0xC643BA43
	Offset: 0x208
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_427eeace();
	}
}

/*
	Name: function_427eeace
	Namespace: namespace_2e8f8ef1
	Checksum: 0x2F6CC5C3
	Offset: 0x240
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function function_427eeace()
{
	zm_perks::register_perk_clientfields("specialty_flakjacket", &function_3ebf90c0, &function_4ef6567f);
	zm_perks::register_perk_effects("specialty_flakjacket", "specialty_flakjacket");
	zm_perks::register_perk_init_thread("specialty_flakjacket", &function_6e68c589);
}

/*
	Name: function_6e68c589
	Namespace: namespace_2e8f8ef1
	Checksum: 0xBEC4E9D6
	Offset: 0x2D0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function function_6e68c589()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_flakjacket"] = "zombie/fx_perk_doubletap2_zmb";
		continue;
	}
	level._effect["specialty_flakjacket"] = "zombie/fx_perk_doubletap2_factory_zmb";
	return;
}

/*
	Name: function_3ebf90c0
	Namespace: namespace_2e8f8ef1
	Checksum: 0x9ACF73B8
	Offset: 0x378
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 91
*/
function function_3ebf90c0()
{
}

/*
	Name: function_4ef6567f
	Namespace: namespace_2e8f8ef1
	Checksum: 0x9ACF73B8
	Offset: 0x388
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function function_4ef6567f()
{
}

