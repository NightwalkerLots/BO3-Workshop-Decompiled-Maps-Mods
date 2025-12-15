#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_perks;

#namespace namespace_c23e218c;

/*
	Name: __init__sytem__
	Namespace: namespace_c23e218c
	Checksum: 0x4B90ED8F
	Offset: 0x1D0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_directionalfire", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_c23e218c
	Checksum: 0xF2540070
	Offset: 0x210
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	function_28827157();
}

/*
	Name: function_28827157
	Namespace: namespace_c23e218c
	Checksum: 0x6FCD6801
	Offset: 0x230
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function function_28827157()
{
	zm_perks::register_perk_clientfields("specialty_directionalfire", &function_68d1aaeb, &function_dc57cc98);
	zm_perks::register_perk_effects("specialty_directionalfire", "vending_directionalfire");
	zm_perks::register_perk_init_thread("specialty_directionalfire", &function_615cfdaa);
}

/*
	Name: function_615cfdaa
	Namespace: namespace_c23e218c
	Checksum: 0xC519FD8D
	Offset: 0x2C0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function function_615cfdaa()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		level._effect["vending_directionalfire"] = "km/fx_km_perk_directionalfire_zmb";
	}
}

/*
	Name: function_68d1aaeb
	Namespace: namespace_c23e218c
	Checksum: 0xE5C2F66D
	Offset: 0x300
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 84
*/
function function_68d1aaeb()
{
	clientfield::register("clientuimodel", "hudItems.perks.directionalfire", 1, 2, "int", undefined, 0, 1);
}

/*
	Name: function_dc57cc98
	Namespace: namespace_c23e218c
	Checksum: 0x9ACF73B8
	Offset: 0x348
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 99
*/
function function_dc57cc98()
{
}

