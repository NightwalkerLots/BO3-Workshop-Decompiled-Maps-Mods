#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace inferno;

/*
	Name: __init__sytem__
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x1E8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("INFERNO", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x228
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_inferno", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_inferno", "revive_light");
	zm_perks::register_perk_init_thread("specialty_inferno", &function_d820cf1a);
	if(!isdefined(level.var_58278879))
	{
		level.var_58278879 = [];
	}
	level.var_58278879["inferno_muzzle"] = &function_a62bae6e;
}

/*
	Name: function_d820cf1a
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x2F0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["cz_zombie_vending_inferno"] = "specialty_inferno";
			level.var_9438a32d["cz_zombie_vending_inferno"] = "specialty_inferno";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_inferno"]))
			{
				level._effect["vulture_waypoint_" + "specialty_inferno"] = "vulture_fx/vulture_waypoint_" + "specialty_inferno";
			}
		}
	}
}

/*
	Name: function_124e3889
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x3B0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 82
*/
function function_124e3889()
{
	return;
}

/*
	Name: function_75dd2cd4
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x3C0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function function_75dd2cd4()
{
}

/*
	Name: function_5cb77540
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x3D0
	Size: 0x40
	Parameters: 7
	Flags: None
	Line Number: 111
*/
function function_5cb77540(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
}

/*
	Name: function_a62bae6e
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x418
	Size: 0x44
	Parameters: 3
	Flags: None
	Line Number: 125
*/
function function_a62bae6e(localClientNum, arg2, arg3)
{
	PlayViewmodelFX(localClientNum, "reaps_cz_inferno/inferno_muzzleflash", "tag_flash");
}

