#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace momentum;

/*
	Name: __init__sytem__
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x1F0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("MOMENTUM", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x230
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_momentum", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_momentum", "revive_light");
	zm_perks::register_perk_init_thread("specialty_momentum", &function_d820cf1a);
	return;
}

/*
	Name: function_d820cf1a
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x2C0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["p6_zm_vending_momentum_on"] = "specialty_momentum";
			level.var_9438a32d["p6_zm_vending_momentum"] = "specialty_momentum";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_momentum"]))
			{
				level._effect["vulture_waypoint_" + "specialty_momentum"] = "vulture_fx/vulture_waypoint_" + "specialty_momentum";
				return;
			}
		}
	}
}

/*
	Name: function_124e3889
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x380
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 79
*/
function function_124e3889()
{
	clientfield::register("clientuimodel", "momentum_perk_speed_blur", 1, 1, "int", &function_7042f87a, 0, 1);
	return;
}

/*
	Name: function_7042f87a
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x3D8
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 95
*/
function function_7042f87a(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		EnableSpeedBlur(localClientNum, 0.12, 0.55, 0.9, 0, 100, 1, 1);
	}
	else
	{
		DisableSpeedBlur(localClientNum);
		return;
	}
}

/*
	Name: function_75dd2cd4
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x478
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 118
*/
function function_75dd2cd4()
{
}

