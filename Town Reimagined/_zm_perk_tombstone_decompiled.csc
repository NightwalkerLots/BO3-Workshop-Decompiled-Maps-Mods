#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace namespace_93d68851;

/*
	Name: __init__sytem__
	Namespace: namespace_93d68851
	Checksum: 0x616ACAA1
	Offset: 0x1C0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_tombstone", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_93d68851
	Checksum: 0x87A65DF6
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
		function_5b93268c();
		return;
	}
	~;
}

/*
	Name: function_5b93268c
	Namespace: namespace_93d68851
	Checksum: 0x74C3513
	Offset: 0x238
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function function_5b93268c()
{
	zm_perks::register_perk_clientfields("specialty_tombstone", &function_e3f6a812, &function_c0365099);
	zm_perks::register_perk_effects("specialty_tombstone", "specialty_tombstone");
	zm_perks::register_perk_init_thread("specialty_tombstone", &function_5bbe231b);
}

/*
	Name: function_5bbe231b
	Namespace: namespace_93d68851
	Checksum: 0x3E6570BA
	Offset: 0x2C8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function function_5bbe231b()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_tombstone"] = "zombie/fx_perk_sleight_of_hand_zmb";
		continue;
	}
	level._effect["specialty_tombstone"] = "zombie/fx_perk_sleight_of_hand_factory_zmb";
}

/*
	Name: function_e3f6a812
	Namespace: namespace_93d68851
	Checksum: 0x9ACF73B8
	Offset: 0x370
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function function_e3f6a812()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c0365099
	Namespace: namespace_93d68851
	Checksum: 0x9ACF73B8
	Offset: 0x380
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 108
*/
function function_c0365099()
{
}

