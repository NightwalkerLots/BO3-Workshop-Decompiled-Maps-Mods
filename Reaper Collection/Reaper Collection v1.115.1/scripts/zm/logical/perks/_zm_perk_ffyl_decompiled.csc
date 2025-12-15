#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_79c5ac56;

/*
	Name: __init__sytem__
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x1E8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("FFYL", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x228
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_ffyl", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_ffyl", "zombie/fx_perk_quick_revive_zmb");
	zm_perks::register_perk_init_thread("specialty_ffyl", &function_d820cf1a);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x2B8
	Size: 0xD8
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
			level.var_9438a32d["zombie_vending_ffyl_on"] = "specialty_ffyl";
			level.var_9438a32d["zombie_vending_ffyl_off"] = "specialty_ffyl";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_ffyl"]))
			{
				level._effect["vulture_waypoint_" + "specialty_ffyl"] = "vulture_fx/vulture_waypoint_" + "specialty_ffyl";
			}
		}
		level._effect["jugger_light"] = "zombie/fx_perk_quick_revive_zmb";
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x398
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
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x3A8
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function function_75dd2cd4()
{
}

