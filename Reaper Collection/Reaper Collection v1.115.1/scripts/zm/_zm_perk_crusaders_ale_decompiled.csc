#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_254f53a2;

/*
	Name: __init__sytem__
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x1C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("CRUSADE", &__init__, undefined, undefined);
	return;
	ERROR: Bad function call
}

/*
	Name: __init__
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x208
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_crusade", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_crusade", "jugger_light");
	zm_perks::register_perk_init_thread("specialty_crusade", &function_d820cf1a);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x298
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["vending_crusader_ale_on"] = "specialty_crusade";
			level.var_9438a32d["vending_crusader_ale"] = "specialty_crusade";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_crusade"]))
			{
				level._effect["vulture_waypoint_" + "specialty_crusade"] = "vulture_fx/vulture_waypoint_" + "specialty_crusade";
				return;
			}
		}
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x358
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
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x368
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function function_75dd2cd4()
{
}

