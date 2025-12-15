#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_45211112;

/*
	Name: __init__sytem__
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0x200
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("BANANA", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0x240
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_banana", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_banana", "doubletap2_light");
	zm_perks::register_perk_init_thread("specialty_banana", &function_d820cf1a);
	if(!isdefined(level.var_e1ca33e9))
	{
		level.var_e1ca33e9 = [];
	}
	level.var_e1ca33e9["madgaz/banana_colada/banana_spill"] = &function_a3f5e2b7;
}

/*
	Name: function_d820cf1a
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0x308
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
			level.var_9438a32d["vending_banana_colada_on"] = "specialty_banana";
			level.var_9438a32d["vending_banana_colada"] = "specialty_banana";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_banana"]))
			{
				level._effect["vulture_waypoint_" + "specialty_banana"] = "vulture_fx/vulture_waypoint_" + "specialty_banana";
			}
		}
		level._effect["madgaz/banana_colada/banana_spill"] = "madgaz/banana_colada/banana_spill";
		return;
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0x3E8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 85
*/
function function_124e3889()
{
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0x3F8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 99
*/
function function_75dd2cd4()
{
}

/*
	Name: function_a3f5e2b7
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0x408
	Size: 0x68
	Parameters: 7
	Flags: None
	Line Number: 113
*/
function function_a3f5e2b7(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(newVal)
	{
		self thread function_5877fb6e(localClientNum, self.origin);
	}
}

/*
	Name: function_5877fb6e
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0x478
	Size: 0x13C
	Parameters: 2
	Flags: None
	Line Number: 131
*/
function function_5877fb6e(localClientNum, orig)
{
	fxObj = spawn(localClientNum, orig + (0, 0, 1), "script_model");
	fxObj SetModel("tag_origin");
	fxObj.angles = fxObj.angles + VectorScale((-1, 0, 0), 90);
	var_b500d81 = PlayFXOnTag(localClientNum, level._effect["madgaz/banana_colada/banana_spill"], fxObj, "tag_origin");
	var_95f4a321 = GetTime() + 5000;
	while(GetTime() < var_95f4a321)
	{
		wait(0.1);
	}
	stopfx(localClientNum, var_b500d81);
	wait(1);
	fxObj delete();
}

