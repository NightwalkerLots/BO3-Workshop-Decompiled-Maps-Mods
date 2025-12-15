#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace namespace_e0e62135;

/*
	Name: __init__sytem__
	Namespace: namespace_e0e62135
	Checksum: 0x44CE7DAF
	Offset: 0x1C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_crusaders_ale", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_e0e62135
	Checksum: 0x5814A3BD
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
		function_de02f6d8();
	}
}

/*
	Name: function_de02f6d8
	Namespace: namespace_e0e62135
	Checksum: 0xAA04BF69
	Offset: 0x240
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function function_de02f6d8()
{
	zm_perks::register_perk_clientfields("specialty_flashprotection", &function_3cb96ef2, &function_eb3e68f9);
	zm_perks::register_perk_effects("specialty_flashprotection", "specialty_flashprotection");
	zm_perks::register_perk_init_thread("specialty_flashprotection", &function_28befcfb);
}

/*
	Name: function_28befcfb
	Namespace: namespace_e0e62135
	Checksum: 0x31C560B5
	Offset: 0x2D0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function function_28befcfb()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_flashprotection"] = "zombie/fx_perk_juggernaut_zmb";
		continue;
	}
	level._effect["specialty_flashprotection"] = "zombie/fx_perk_juggernaut_factory_zmb";
}

/*
	Name: function_3cb96ef2
	Namespace: namespace_e0e62135
	Checksum: 0x9ACF73B8
	Offset: 0x378
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function function_3cb96ef2()
{
}

/*
	Name: function_eb3e68f9
	Namespace: namespace_e0e62135
	Checksum: 0x9ACF73B8
	Offset: 0x388
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function function_eb3e68f9()
{
}

