#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_961a2806;

/*
	Name: __init__sytem__
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x1C0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("victorious_tortoise", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x200
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_victorious", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_victorious", "sleight_light");
	zm_perks::register_perk_init_thread("specialty_victorious", &function_d820cf1a);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x290
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
			level.var_9438a32d["cz_vending_victorious"] = "specialty_victorious";
			level.var_9438a32d["cz_vending_victorious_off"] = "specialty_victorious";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_victorious"]))
			{
				level._effect["vulture_waypoint_" + "specialty_victorious"] = "vulture_fx/vulture_waypoint_" + "specialty_victorious";
				return;
			}
		}
	}
	.var_0 = undefined;
}

/*
	Name: function_124e3889
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x350
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function function_124e3889()
{
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x360
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function function_75dd2cd4()
{
}

