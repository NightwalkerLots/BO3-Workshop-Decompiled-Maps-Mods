#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace zm_perk_juggernaut;

/*
	Name: __init__sytem__
	Namespace: zm_perk_juggernaut
	Checksum: 0x854E813E
	Offset: 0x1B8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_juggernaut", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_juggernaut
	Checksum: 0xC233B441
	Offset: 0x1F8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_juggernaut_perk_for_level();
		return;
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: enable_juggernaut_perk_for_level
	Namespace: zm_perk_juggernaut
	Checksum: 0xDBAA7A3A
	Offset: 0x230
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function enable_juggernaut_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_armorvest", &juggernaut_client_field_func, &juggernaut_code_callback_func);
	zm_perks::register_perk_effects("specialty_armorvest", "specialty_armorvest");
	zm_perks::register_perk_init_thread("specialty_armorvest", &function_3c1e52f2);
}

/*
	Name: function_3c1e52f2
	Namespace: zm_perk_juggernaut
	Checksum: 0xA6619C6
	Offset: 0x2C0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_3c1e52f2()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_armorvest"] = "zombie/fx_perk_juggernaut_zmb";
		continue;
	}
	level._effect["specialty_armorvest"] = "zombie/fx_perk_juggernaut_factory_zmb";
}

/*
	Name: juggernaut_client_field_func
	Namespace: zm_perk_juggernaut
	Checksum: 0x9ACF73B8
	Offset: 0x368
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function juggernaut_client_field_func()
{
}

/*
	Name: juggernaut_code_callback_func
	Namespace: zm_perk_juggernaut
	Checksum: 0x9ACF73B8
	Offset: 0x378
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function juggernaut_code_callback_func()
{
}

