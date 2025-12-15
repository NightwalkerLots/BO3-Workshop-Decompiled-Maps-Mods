#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_1db86760;

/*
	Name: __init__sytem__
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x220
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("SWARM_SCOTCH", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x260
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_swarmscotch", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_swarmscotch", "revive_light");
	zm_perks::register_perk_init_thread("specialty_swarmscotch", &function_d820cf1a);
	if(!isdefined(level.var_67450254))
	{
		level.var_67450254 = [];
	}
	level.var_67450254["swarm_scotch"] = &function_1db86760;
}

/*
	Name: function_d820cf1a
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x328
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["cz_zombie_vending_swarmscotch"] = "specialty_swarmscotch";
			level.var_9438a32d["cz_zombie_vending_swarmscotch_off"] = "specialty_swarmscotch";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_swarmscotch"]))
			{
				level._effect["vulture_waypoint_" + "specialty_swarmscotch"] = "vulture_fx/vulture_waypoint_" + "specialty_swarmscotch";
			}
		}
		level._effect["swarm_scotch"] = "reap_cz_swarm_scotch/swarm_scotch_swarm";
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x408
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 83
*/
function function_124e3889()
{
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x418
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function function_75dd2cd4()
{
}

/*
	Name: function_1db86760
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x428
	Size: 0xAE
	Parameters: 7
	Flags: None
	Line Number: 111
*/
function function_1db86760(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self.var_1db86760 = PlayFXOnTag(localClientNum, "reap_cz_swarm_scotch/swarm_scotch_swarm", self, "tag_origin");
	}
	else if(isdefined(self.var_1db86760))
	{
		stopfx(localClientNum, self.var_1db86760);
		self.var_1db86760 = undefined;
	}
}

