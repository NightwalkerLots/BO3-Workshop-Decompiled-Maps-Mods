#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_f354aa4;

/*
	Name: __init__sytem__
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0x1C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("estatic", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0x208
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_estatic", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_estatic", "revive_light");
	zm_perks::register_perk_init_thread("specialty_estatic", &function_d820cf1a);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0x298
	Size: 0xB8
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
			level.var_9438a32d["cz_zombie_vending_estatic"] = "specialty_estatic";
			level.var_9438a32d["cz_zombie_vending_estatic_off"] = "specialty_estatic";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_estatic"]))
			{
				level._effect["vulture_waypoint_" + "specialty_estatic"] = "vulture_fx/vulture_waypoint_" + "specialty_estatic";
			}
		}
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0x358
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_124e3889()
{
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0x368
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 91
*/
function function_75dd2cd4()
{
}

