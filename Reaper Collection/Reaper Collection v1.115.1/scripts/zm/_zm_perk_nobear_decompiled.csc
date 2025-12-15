#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_bc7ade0e;

/*
	Name: __init__sytem__
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x1B8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("NOBEAR", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: __init__
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x1F8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_nobear", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_nobear", "revive_light");
	zm_perks::register_perk_init_thread("specialty_nobear", &function_d820cf1a);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x288
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["p7_zm_vending_nobear_on"] = "specialty_nobear";
			level.var_9438a32d["p7_zm_vending_nobear"] = "specialty_nobear";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_nobear"]))
			{
				level._effect["vulture_waypoint_" + "specialty_nobear"] = "vulture_fx/vulture_waypoint_" + "specialty_nobear";
				return;
			}
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_124e3889
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x348
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 82
*/
function function_124e3889()
{
	return;
	ERROR: Bad function call
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x358
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 98
*/
function function_75dd2cd4()
{
}

