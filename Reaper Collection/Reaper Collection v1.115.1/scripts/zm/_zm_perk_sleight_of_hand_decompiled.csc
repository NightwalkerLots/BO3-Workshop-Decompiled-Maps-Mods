#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_sleight_of_hand;

/*
	Name: __init__sytem__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x424F4353
	Offset: 0x1C0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_sleight_of_hand", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x424F4353
	Offset: 0x200
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	enable_sleight_of_hand_perk_for_level();
	return;
	++;
}

/*
	Name: enable_sleight_of_hand_perk_for_level
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x424F4353
	Offset: 0x220
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function enable_sleight_of_hand_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_fastreload", &sleight_of_hand_client_field_func, &sleight_of_hand_code_callback_func);
	zm_perks::register_perk_effects("specialty_fastreload", "zombie/fx_perk_quick_revive_zmb");
	zm_perks::register_perk_init_thread("specialty_fastreload", &init_sleight_of_hand);
}

/*
	Name: init_sleight_of_hand
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x424F4353
	Offset: 0x2B0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 67
*/
function init_sleight_of_hand()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		level._effect["sleight_light"] = "zombie/fx_perk_quick_revive_zmb";
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["p7_zm_vending_sleight"] = "specialty_fastreload";
			level.var_9438a32d["p7_zm_vending_sleight"] = "specialty_fastreload";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_fastreload"]))
			{
				level._effect["vulture_waypoint_" + "specialty_fastreload"] = "vulture_fx/vulture_waypoint_" + "specialty_fastreload";
			}
		}
	}
}

/*
	Name: sleight_of_hand_client_field_func
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x424F4353
	Offset: 0x390
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function sleight_of_hand_client_field_func()
{
}

/*
	Name: sleight_of_hand_code_callback_func
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x424F4353
	Offset: 0x3A0
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 108
*/
function sleight_of_hand_code_callback_func()
{
}

