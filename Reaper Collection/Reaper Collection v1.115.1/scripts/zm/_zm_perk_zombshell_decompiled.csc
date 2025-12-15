#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_c21e9819;

/*
	Name: __init__sytem__
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x1D8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zombshell", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x218
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_zombshell", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_zombshell", "revive_light");
	zm_perks::register_perk_init_thread("specialty_zombshell", &function_d820cf1a);
	if(!isdefined(level.var_5abfe317))
	{
		level.var_5abfe317 = [];
	}
	level.var_5abfe317["zombshell_explosion"] = &function_b500d81;
}

/*
	Name: function_d820cf1a
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x2E0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["chm_zm_vending_zombshell"] = "specialty_zombshell";
			level.var_9438a32d["chm_zm_vending_zombshell"] = "specialty_zombshell";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_zombshell"]))
			{
				level._effect["vulture_waypoint_" + "specialty_zombshell"] = "vulture_fx/vulture_waypoint_" + "specialty_zombshell";
			}
		}
		level._effect["zombshell_explosion"] = "reaps_cz_zombshell/zombshell";
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x3C0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 84
*/
function function_124e3889()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x3D0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 100
*/
function function_75dd2cd4()
{
}

/*
	Name: function_b500d81
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x3E0
	Size: 0x68
	Parameters: 7
	Flags: None
	Line Number: 114
*/
function function_b500d81(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(newVal)
	{
		level thread function_53c25aeb(localClientNum, self.origin);
	}
}

/*
	Name: function_53c25aeb
	Namespace: namespace_c21e9819
	Checksum: 0x424F4353
	Offset: 0x450
	Size: 0xF4
	Parameters: 2
	Flags: None
	Line Number: 132
*/
function function_53c25aeb(localClientNum, orig)
{
	fxObj = spawn(localClientNum, orig + VectorScale((0, 0, 1), 30), "script_model");
	fxObj SetModel("tag_origin");
	var_b500d81 = PlayFXOnTag(localClientNum, level._effect["zombshell_explosion"], fxObj, "tag_origin");
	wait(10);
	stopfx(localClientNum, var_b500d81);
	wait(1);
	fxObj delete();
}

