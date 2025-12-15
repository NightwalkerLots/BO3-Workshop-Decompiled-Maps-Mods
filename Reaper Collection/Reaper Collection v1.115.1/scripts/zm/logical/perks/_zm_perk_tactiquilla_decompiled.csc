#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_57c55ace;

/*
	Name: __init__sytem__
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0x208
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("TACTIQUILLA", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0x248
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_tactiquilla", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_tactiquilla", "zombie/fx_perk_quick_revive_zmb");
	zm_perks::register_perk_init_thread("specialty_tactiquilla", &function_d820cf1a);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0x2D8
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
			level.var_9438a32d["xela_perk_tactiquilla_on"] = "specialty_tactiquilla";
			level.var_9438a32d["xela_perk_tactiquilla"] = "specialty_tactiquilla";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_tactiquilla"]))
			{
				level._effect["vulture_waypoint_" + "specialty_tactiquilla"] = "vulture_fx/vulture_waypoint_" + "specialty_tactiquilla";
			}
		}
		level._effect["zombie/fx_perk_mule_kick_zmb"] = "zombie/fx_perk_quick_revive_zmb";
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0x3B8
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
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0x3C8
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function function_75dd2cd4()
{
}

