#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_staminup;

/*
	Name: __init__sytem__
	Namespace: zm_perk_staminup
	Checksum: 0x424F4353
	Offset: 0x1D0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_staminup", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_staminup
	Checksum: 0x424F4353
	Offset: 0x210
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	enable_staminup_perk_for_level();
}

/*
	Name: enable_staminup_perk_for_level
	Namespace: zm_perk_staminup
	Checksum: 0x424F4353
	Offset: 0x230
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function enable_staminup_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_staminup", &staminup_client_field_func, &staminup_callback_func);
	zm_perks::register_perk_effects("specialty_staminup", "zombie/fx_perk_quick_revive_zmb");
	zm_perks::register_perk_init_thread("specialty_staminup", &init_staminup);
}

/*
	Name: init_staminup
	Namespace: zm_perk_staminup
	Checksum: 0x424F4353
	Offset: 0x2C0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 65
*/
function init_staminup()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["p7_zm_vending_marathon_off"] = "specialty_staminup";
			level.var_9438a32d["p7_zm_vending_marathon"] = "specialty_staminup";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_staminup"]))
			{
				level._effect["vulture_waypoint_" + "specialty_staminup"] = "vulture_fx/vulture_waypoint_" + "specialty_staminup";
			}
		}
		level._effect["marathon_light"] = "zombie/fx_perk_quick_revive_zmb";
	}
}

/*
	Name: staminup_client_field_func
	Namespace: zm_perk_staminup
	Checksum: 0x424F4353
	Offset: 0x3A0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function staminup_client_field_func()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: staminup_callback_func
	Namespace: zm_perk_staminup
	Checksum: 0x424F4353
	Offset: 0x3B0
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 108
*/
function staminup_callback_func()
{
}

