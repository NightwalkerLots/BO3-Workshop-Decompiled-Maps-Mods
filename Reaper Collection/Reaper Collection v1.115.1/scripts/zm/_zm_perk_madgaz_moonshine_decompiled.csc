#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_15344033;

/*
	Name: __init__sytem__
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x230
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("MOONSHINE", &__init__, undefined, undefined);
	return;
	ERROR: Bad function call
}

/*
	Name: __init__
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x270
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_moonshine", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_moonshine", "zombie/fx_perk_doubletap2_zmb");
	zm_perks::register_perk_init_thread("specialty_moonshine", &function_d820cf1a);
	if(!isdefined(level.var_67450254))
	{
		level.var_67450254 = [];
	}
	level.var_67450254["moonshine_explosion"] = &function_d5b7c477;
}

/*
	Name: function_d820cf1a
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x338
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		level._effect["moonshine_explosion"] = "madgaz/madgaz_moonshine/moonshine_explode";
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["vending_madgaz_moonshine_on"] = "specialty_moonshine";
			level.var_9438a32d["vending_madgaz_moonshine"] = "specialty_moonshine";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_moonshine"]))
			{
				level._effect["vulture_waypoint_" + "specialty_moonshine"] = "vulture_fx/vulture_waypoint_" + "specialty_moonshine";
				return;
			}
		}
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x418
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 86
*/
function function_124e3889()
{
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x428
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 100
*/
function function_75dd2cd4()
{
}

/*
	Name: function_d5b7c477
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x438
	Size: 0xB6
	Parameters: 7
	Flags: None
	Line Number: 114
*/
function function_d5b7c477(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self.var_d5b7c477 = PlayFXOnTag(localClientNum, level._effect["moonshine_explosion"], self, "tag_origin");
	}
	else if(isdefined(self.var_d5b7c477))
	{
		stopfx(localClientNum, self.var_d5b7c477);
		self.var_d5b7c477 = undefined;
	}
}

