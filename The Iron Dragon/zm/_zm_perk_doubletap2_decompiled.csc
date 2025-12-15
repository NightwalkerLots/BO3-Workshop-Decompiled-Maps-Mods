#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_doubletap2;

/*
	Name: __init__sytem__
	Namespace: zm_perk_doubletap2
	Checksum: 0xB81F140D
	Offset: 0x170
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_doubletap2", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_doubletap2
	Checksum: 0xF08702D
	Offset: 0x1B8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_158e5e94();
	}
}

/*
	Name: __main__
	Namespace: zm_perk_doubletap2
	Checksum: 0xF5AF6B8C
	Offset: 0x1F0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_6b89f9a6();
	}
}

/*
	Name: function_158e5e94
	Namespace: zm_perk_doubletap2
	Checksum: 0xA4431726
	Offset: 0x228
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 68
*/
function function_158e5e94()
{
	zm_perks::register_perk_clientfields("specialty_doubletap2", &function_5e0909ae, &function_357b9005);
	zm_perks::register_perk_effects("specialty_doubletap2", "specialty_doubletap2");
	zm_perks::register_perk_init_thread("specialty_doubletap2", &function_577e8077);
}

/*
	Name: function_577e8077
	Namespace: zm_perk_doubletap2
	Checksum: 0xB2964F84
	Offset: 0x2B8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 85
*/
function function_577e8077()
{
	level._effect["specialty_doubletap2"] = "harry/zm_perks/fx_perk_doubletap_light";
}

/*
	Name: function_5e0909ae
	Namespace: zm_perk_doubletap2
	Checksum: 0xB7A336F2
	Offset: 0x2E0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 100
*/
function function_5e0909ae()
{
	clientfield::register("clientuimodel", "hudItems.perks.doubletap2", 1, 2, "int", undefined, 0, 1);
}

/*
	Name: function_357b9005
	Namespace: zm_perk_doubletap2
	Checksum: 0x9ACF73B8
	Offset: 0x328
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 115
*/
function function_357b9005()
{
}

/*
	Name: function_6b89f9a6
	Namespace: zm_perk_doubletap2
	Checksum: 0x9ACF73B8
	Offset: 0x338
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 129
*/
function function_6b89f9a6()
{
}

