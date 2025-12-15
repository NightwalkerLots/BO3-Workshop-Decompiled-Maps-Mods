#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_5154ff8d;

/*
	Name: __init__sytem__
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0x1C0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("BLOOD_BULLETS", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0x200
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_bloodbullets", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_bloodbullets", "revive_light");
	zm_perks::register_perk_init_thread("specialty_bloodbullets", &function_d820cf1a);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d820cf1a
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0x290
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["cz_zombie_vending_blood_bullets"] = "specialty_bloodbullets";
			level.var_9438a32d["cz_zombie_vending_blood_bullets"] = "specialty_bloodbullets";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_bloodbullets"]))
			{
				level._effect["vulture_waypoint_" + "specialty_bloodbullets"] = "vulture_fx/vulture_waypoint_" + "specialty_bloodbullets";
			}
		}
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0x350
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 81
*/
function function_124e3889()
{
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0x360
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 95
*/
function function_75dd2cd4()
{
}

