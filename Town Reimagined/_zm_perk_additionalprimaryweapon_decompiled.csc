#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace zm_perk_additionalprimaryweapon;

/*
	Name: __init__sytem__
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xC58F5536
	Offset: 0x1E0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_additionalprimaryweapon", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x73DEDAFE
	Offset: 0x220
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_additional_primary_weapon_perk_for_level();
	}
}

/*
	Name: enable_additional_primary_weapon_perk_for_level
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xAF0F7E87
	Offset: 0x258
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function enable_additional_primary_weapon_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_additionalprimaryweapon", &additional_primary_weapon_client_field_func, &additional_primary_weapon_code_callback_func);
	zm_perks::register_perk_effects("specialty_additionalprimaryweapon", "specialty_additionalprimaryweapon");
	zm_perks::register_perk_init_thread("specialty_additionalprimaryweapon", &function_a7b918e9);
	return;
}

/*
	Name: function_a7b918e9
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x70258011
	Offset: 0x2E8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function function_a7b918e9()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_additionalprimaryweapon"] = "zombie/fx_perk_mule_kick_zmb";
		continue;
	}
	level._effect["specialty_additionalprimaryweapon"] = "zombie/fx_perk_mule_kick_factory_zmb";
}

/*
	Name: additional_primary_weapon_client_field_func
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x9ACF73B8
	Offset: 0x390
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 91
*/
function additional_primary_weapon_client_field_func()
{
}

/*
	Name: additional_primary_weapon_code_callback_func
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x9ACF73B8
	Offset: 0x3A0
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function additional_primary_weapon_code_callback_func()
{
}

