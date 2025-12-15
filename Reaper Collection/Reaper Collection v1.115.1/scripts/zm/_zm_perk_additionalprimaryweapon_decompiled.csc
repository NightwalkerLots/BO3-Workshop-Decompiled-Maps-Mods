#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_additionalprimaryweapon;

/*
	Name: __init__sytem__
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x210
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_additionalprimaryweapon", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x250
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	enable_additional_primary_weapon_perk_for_level();
}

/*
	Name: enable_additional_primary_weapon_perk_for_level
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x270
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function enable_additional_primary_weapon_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_additionalprimaryweapon", &additional_primary_weapon_client_field_func, &additional_primary_weapon_code_callback_func);
	zm_perks::register_perk_effects("specialty_additionalprimaryweapon", "zombie/fx_perk_quick_revive_zmb");
	zm_perks::register_perk_init_thread("specialty_additionalprimaryweapon", &init_additional_primary_weapon);
	return;
}

/*
	Name: init_additional_primary_weapon
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x300
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 68
*/
function init_additional_primary_weapon()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["p7_zm_vending_three_gun"] = "specialty_additionalprimaryweapon";
			level.var_9438a32d["p7_zm_vending_three_gun_off"] = "specialty_additionalprimaryweapon";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_additionalprimaryweapon"]))
			{
				level._effect["vulture_waypoint_" + "specialty_additionalprimaryweapon"] = "vulture_fx/vulture_waypoint_" + "specialty_additionalprimaryweapon";
			}
		}
		level._effect["additionalprimaryweapon_light"] = "zombie/fx_perk_quick_revive_zmb";
	}
}

/*
	Name: additional_primary_weapon_client_field_func
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x3E0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 95
*/
function additional_primary_weapon_client_field_func()
{
}

/*
	Name: additional_primary_weapon_code_callback_func
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x3F0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 109
*/
function additional_primary_weapon_code_callback_func()
{
}

/*
	Name: function_ef7f0034
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x400
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 123
*/
function function_ef7f0034()
{
}

