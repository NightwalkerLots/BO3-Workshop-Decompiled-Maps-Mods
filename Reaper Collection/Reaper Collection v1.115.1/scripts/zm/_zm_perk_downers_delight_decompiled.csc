#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_b1c002a5;

/*
	Name: __init__sytem__
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0x1F0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("DOWNERS_DELIGHT", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0x230
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_downersdelight", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_downersdelight", "revive_light");
	zm_perks::register_perk_init_thread("specialty_downersdelight", &function_d820cf1a);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d820cf1a
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0x2C0
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
			level.var_9438a32d["cz_zombie_vending_downers_delight"] = "specialty_downersdelight";
			level.var_9438a32d["cz_zombie_vending_downers_delight_off"] = "specialty_downersdelight";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_downersdelight"]))
			{
				level._effect["vulture_waypoint_" + "specialty_downersdelight"] = "vulture_fx/vulture_waypoint_" + "specialty_downersdelight";
			}
		}
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0x380
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function function_124e3889()
{
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0x390
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function function_75dd2cd4()
{
}

