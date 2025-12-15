#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_quick_revive;

/*
	Name: __init__sytem__
	Namespace: zm_perk_quick_revive
	Checksum: 0x424F4353
	Offset: 0x1B8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_quick_revive", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_quick_revive
	Checksum: 0x424F4353
	Offset: 0x1F8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	enable_quick_revive_perk_for_level();
}

/*
	Name: enable_quick_revive_perk_for_level
	Namespace: zm_perk_quick_revive
	Checksum: 0x424F4353
	Offset: 0x218
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function enable_quick_revive_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_quickrevive", &quick_revive_client_field_func, &quick_revive_callback_func);
	zm_perks::register_perk_effects("specialty_quickrevive", "revive_light");
	zm_perks::register_perk_init_thread("specialty_quickrevive", &init_quick_revive);
}

/*
	Name: init_quick_revive
	Namespace: zm_perk_quick_revive
	Checksum: 0x424F4353
	Offset: 0x2A8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 65
*/
function init_quick_revive()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		level._effect["revive_light"] = "zombie/fx_perk_quick_revive_zmb";
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["p7_zm_vending_revive"] = "specialty_quickrevive";
			level.var_9438a32d["p7_zm_vending_revive"] = "specialty_quickrevive";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_quickrevive"]))
			{
				level._effect["vulture_waypoint_" + "specialty_quickrevive"] = "vulture_fx/vulture_waypoint_" + "specialty_quickrevive";
			}
		}
	}
}

/*
	Name: quick_revive_client_field_func
	Namespace: zm_perk_quick_revive
	Checksum: 0x424F4353
	Offset: 0x388
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function quick_revive_client_field_func()
{
	return;
}

/*
	Name: quick_revive_callback_func
	Namespace: zm_perk_quick_revive
	Checksum: 0x424F4353
	Offset: 0x398
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function quick_revive_callback_func()
{
}

