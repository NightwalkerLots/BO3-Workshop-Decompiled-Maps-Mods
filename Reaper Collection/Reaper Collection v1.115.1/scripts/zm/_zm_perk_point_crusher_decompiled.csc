#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_7e3e21d4;

/*
	Name: __init__sytem__
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x1B8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("POINT_CRUSHER", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x1F8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_point", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_point", "revive_light");
	zm_perks::register_perk_init_thread("specialty_point", &function_d820cf1a);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x288
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["cz_vending_point_crusher"] = "specialty_point";
			level.var_9438a32d["cz_vending_point_crusher"] = "specialty_point";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_point"]))
			{
				level._effect["vulture_waypoint_" + "specialty_point"] = "vulture_fx/vulture_waypoint_" + "specialty_point";
			}
		}
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x348
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_124e3889()
{
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x358
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function function_75dd2cd4()
{
}

