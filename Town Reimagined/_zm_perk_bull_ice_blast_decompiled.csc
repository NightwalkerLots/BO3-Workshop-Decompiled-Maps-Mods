#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace namespace_2bf6085c;

/*
	Name: __init__sytem__
	Namespace: namespace_2bf6085c
	Checksum: 0x53A78F0A
	Offset: 0x1D0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_bull_ice_blast", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_2bf6085c
	Checksum: 0x5C7A6963
	Offset: 0x210
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_ec3e5889();
	}
}

/*
	Name: function_ec3e5889
	Namespace: namespace_2bf6085c
	Checksum: 0xF459D9CE
	Offset: 0x248
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function function_ec3e5889()
{
	zm_perks::register_perk_clientfields("specialty_proximityprotection", &function_ed87d365, &function_29c0a4e0);
	zm_perks::register_perk_effects("specialty_proximityprotection", "specialty_proximityprotection");
	zm_perks::register_perk_init_thread("specialty_proximityprotection", &function_21b45532);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_21b45532
	Namespace: namespace_2bf6085c
	Checksum: 0x3D6D379D
	Offset: 0x2D8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_21b45532()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_proximityprotection"] = "zombie/fx_perk_quick_revive_zmb";
		continue;
	}
	level._effect["specialty_proximityprotection"] = "zombie/fx_perk_quick_revive_factory_zmb";
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ed87d365
	Namespace: namespace_2bf6085c
	Checksum: 0x9ACF73B8
	Offset: 0x380
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function function_ed87d365()
{
	return;
}

/*
	Name: function_29c0a4e0
	Namespace: namespace_2bf6085c
	Checksum: 0x9ACF73B8
	Offset: 0x390
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 112
*/
function function_29c0a4e0()
{
}

