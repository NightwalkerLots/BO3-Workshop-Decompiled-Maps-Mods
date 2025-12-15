#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_b20e5028;

/*
	Name: __init__sytem__
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x1A0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("timeslip", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x1E0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_timeslip", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_timeslip", "revive_light");
	zm_perks::register_perk_init_thread("specialty_timeslip", &function_d820cf1a);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x270
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["cz_vending_timeslip2"] = "specialty_timeslip";
			level.var_9438a32d["cz_vending_timeslip2_off"] = "specialty_timeslip";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_timeslip"]))
			{
				level._effect["vulture_waypoint_" + "specialty_timeslip"] = "vulture_fx/vulture_waypoint_" + "specialty_timeslip";
			}
		}
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x330
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_124e3889()
{
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x340
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function function_75dd2cd4()
{
}

