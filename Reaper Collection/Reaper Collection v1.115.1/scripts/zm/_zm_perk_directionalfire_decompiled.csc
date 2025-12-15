#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_cfa83d3b;

/*
	Name: __init__sytem__
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0x208
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("DIRECTIONALFIRE", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0x248
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_directionalfire", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_directionalfire", "zombie/fx_perk_quick_revive_zmb");
	zm_perks::register_perk_init_thread("specialty_directionalfire", &function_d820cf1a);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0x2D8
	Size: 0xD8
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
			level.var_9438a32d["km_zm_vending_vigor_rush_on_vm"] = "specialty_directionalfire";
			level.var_9438a32d["km_zm_vending_vigor_rush_vm"] = "specialty_directionalfire";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_directionalfire"]))
			{
				level._effect["vulture_waypoint_" + "specialty_directionalfire"] = "vulture_fx/vulture_waypoint_" + "specialty_directionalfire";
			}
		}
		level._effect["jugger_light"] = "zombie/fx_perk_quick_revive_zmb";
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0x3B8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 79
*/
function function_124e3889()
{
	return;
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_cfa83d3b
	Checksum: 0x424F4353
	Offset: 0x3C8
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function function_75dd2cd4()
{
}

