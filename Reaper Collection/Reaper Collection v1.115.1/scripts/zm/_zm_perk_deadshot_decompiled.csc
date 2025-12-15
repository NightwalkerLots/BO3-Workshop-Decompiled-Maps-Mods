#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_deadshot;

/*
	Name: __init__sytem__
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x1C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_deadshot", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x208
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	enable_deadshot_perk_for_level();
}

/*
	Name: enable_deadshot_perk_for_level
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x228
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function enable_deadshot_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_deadshot", &deadshot_client_field_func, &deadshot_code_callback_func);
	zm_perks::register_perk_effects("specialty_deadshot", "deadshot_light");
	zm_perks::register_perk_init_thread("specialty_deadshot", &init_deadshot);
	return;
}

/*
	Name: init_deadshot
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x2B8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function init_deadshot()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		level._effect["deadshot_light"] = "_t6/misc/fx_zombie_cola_dtap_on";
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["p7_zm_vending_ads"] = "specialty_deadshot";
			level.var_9438a32d["p7_zm_vending_ads"] = "specialty_deadshot";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_deadshot"]))
			{
				level._effect["vulture_waypoint_" + "specialty_deadshot"] = "vulture_fx/vulture_waypoint_" + "specialty_deadshot";
			}
		}
	}
}

/*
	Name: deadshot_client_field_func
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x398
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function deadshot_client_field_func()
{
	clientfield::register("toplayer", "deadshot_perk", 1, 1, "int", &player_deadshot_perk_handler, 0, 1);
}

/*
	Name: deadshot_code_callback_func
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x3F0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 108
*/
function deadshot_code_callback_func()
{
}

/*
	Name: player_deadshot_perk_handler
	Namespace: zm_perk_deadshot
	Checksum: 0x424F4353
	Offset: 0x400
	Size: 0xF4
	Parameters: 7
	Flags: None
	Line Number: 122
*/
function player_deadshot_perk_handler(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(!self isLocalPlayer() || IsSpectating(localClientNum, 0) || (isdefined(level.localPlayers[localClientNum]) && self GetEntityNumber() != level.localPlayers[localClientNum] GetEntityNumber()))
	{
		return;
	}
	if(newVal)
	{
		self UseAlternateAimParams();
	}
	else
	{
		self ClearAlternateAimParams();
	}
}

