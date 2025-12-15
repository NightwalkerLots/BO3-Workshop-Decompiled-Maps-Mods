#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_e6205b53;

/*
	Name: __init__sytem__
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x1E0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("blood_wolf_bite", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x220
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_bloodwolf", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_bloodwolf", "revive_light");
	zm_perks::register_perk_init_thread("specialty_bloodwolf", &function_d820cf1a);
	return;
	ERROR: Bad function call
}

/*
	Name: function_d820cf1a
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x2B0
	Size: 0xB8
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
			level.var_9438a32d["cz_zombie_vending_blood_wolf_bite"] = "specialty_bloodwolf";
			level.var_9438a32d["cz_zombie_vending_blood_wolf_bite_off"] = "specialty_bloodwolf";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_bloodwolf"]))
			{
				level._effect["vulture_waypoint_" + "specialty_bloodwolf"] = "vulture_fx/vulture_waypoint_" + "specialty_bloodwolf";
				return;
			}
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_124e3889
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x370
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function function_124e3889()
{
	clientfield::register("actor", "LUNA", 1, 1, "int", &function_cac00c3b, 0, 0);
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x3C8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 95
*/
function function_75dd2cd4()
{
}

/*
	Name: function_cac00c3b
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x3D8
	Size: 0x64
	Parameters: 7
	Flags: None
	Line Number: 109
*/
function function_cac00c3b(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self SetDrawName("^7LUNA", 1);
	}
}

