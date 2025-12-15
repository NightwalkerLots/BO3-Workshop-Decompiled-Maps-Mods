#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace zm_perk_staminup;

/*
	Name: __init__sytem__
	Namespace: zm_perk_staminup
	Checksum: 0xDA60842A
	Offset: 0x1B8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_staminup", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_staminup
	Checksum: 0x320EB7A2
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
		enable_staminup_perk_for_level();
	}
}

/*
	Name: enable_staminup_perk_for_level
	Namespace: zm_perk_staminup
	Checksum: 0x971324E1
	Offset: 0x230
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function enable_staminup_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_staminup", &staminup_client_field_func, &staminup_callback_func);
	zm_perks::register_perk_effects("specialty_staminup", "specialty_staminup");
	zm_perks::register_perk_init_thread("specialty_staminup", &function_97cc5591);
}

/*
	Name: function_97cc5591
	Namespace: zm_perk_staminup
	Checksum: 0x870FC690
	Offset: 0x2C0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function function_97cc5591()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_staminup"] = "zombie/fx_perk_stamin_up_zmb";
		continue;
	}
	level._effect["specialty_staminup"] = "zombie/fx_perk_stamin_up_factory_zmb";
}

/*
	Name: staminup_client_field_func
	Namespace: zm_perk_staminup
	Checksum: 0x9ACF73B8
	Offset: 0x368
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function staminup_client_field_func()
{
}

/*
	Name: staminup_callback_func
	Namespace: zm_perk_staminup
	Checksum: 0x9ACF73B8
	Offset: 0x378
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function staminup_callback_func()
{
}

