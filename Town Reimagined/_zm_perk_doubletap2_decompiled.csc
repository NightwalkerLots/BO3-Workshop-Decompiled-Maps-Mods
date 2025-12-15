#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace zm_perk_doubletap2;

/*
	Name: __init__sytem__
	Namespace: zm_perk_doubletap2
	Checksum: 0xF4F564D0
	Offset: 0x1C0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_doubletap2", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_doubletap2
	Checksum: 0xDCF919B0
	Offset: 0x200
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_158e5e94();
	}
}

/*
	Name: function_158e5e94
	Namespace: zm_perk_doubletap2
	Checksum: 0x6CE46E7B
	Offset: 0x238
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 52
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
	Checksum: 0xC0FB505C
	Offset: 0x2C8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function function_577e8077()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_doubletap2"] = "zombie/fx_perk_doubletap2_zmb";
		continue;
	}
	level._effect["specialty_doubletap2"] = "zombie/fx_perk_doubletap2_factory_zmb";
}

/*
	Name: function_5e0909ae
	Namespace: zm_perk_doubletap2
	Checksum: 0x9ACF73B8
	Offset: 0x370
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function function_5e0909ae()
{
	return;
	ERROR: Bad function call
}

/*
	Name: function_357b9005
	Namespace: zm_perk_doubletap2
	Checksum: 0x9ACF73B8
	Offset: 0x380
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_357b9005()
{
}

