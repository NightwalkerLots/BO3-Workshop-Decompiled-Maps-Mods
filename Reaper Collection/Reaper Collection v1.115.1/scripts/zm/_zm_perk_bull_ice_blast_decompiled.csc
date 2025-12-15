#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_e8b460a;

/*
	Name: __init__sytem__
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x208
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("BULL_ICE", &__init__, undefined, undefined);
	return;
	waittillframeend;
}

/*
	Name: __init__
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x248
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_bull_ice", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_bull_ice", "revive_light");
	zm_perks::register_perk_init_thread("specialty_bull_ice", &function_d820cf1a);
	if(!isdefined(level.var_58278879))
	{
		level.var_58278879 = [];
	}
	level.var_58278879["slam_ice_impact"] = &function_115b511f;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d820cf1a
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x310
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["vending_bull_ice_blast_on"] = "specialty_bull_ice";
			level.var_9438a32d["vending_bull_ice_blast"] = "specialty_bull_ice";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_bull_ice"]))
			{
				level._effect["vulture_waypoint_" + "specialty_bull_ice"] = "vulture_fx/vulture_waypoint_" + "specialty_bull_ice";
			}
		}
		level._effect["slam_ice_impact"] = "madgaz/bull_ice/ice_impact_fx";
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x3F0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function function_124e3889()
{
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x400
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 101
*/
function function_75dd2cd4()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_115b511f
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x410
	Size: 0x4C
	Parameters: 3
	Flags: None
	Line Number: 117
*/
function function_115b511f(localClientNum, arg2, arg3)
{
	PlayFXOnTag(localClientNum, level._effect["slam_ice_impact"], self, "tag_origin");
}

