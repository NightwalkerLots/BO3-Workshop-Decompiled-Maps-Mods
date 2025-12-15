#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_26037cbd;

/*
	Name: __init__sytem__
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0x1B0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("CASHBACK", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0x1F0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_cashback", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_cashback", "revive_light");
	zm_perks::register_perk_init_thread("specialty_cashback", &function_d820cf1a);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0x280
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
			level.var_9438a32d["cz_zombie_vending_cashback"] = "specialty_cashback";
			level.var_9438a32d["cz_zombie_vending_cashback"] = "specialty_cashback";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_cashback"]))
			{
				level._effect["vulture_waypoint_" + "specialty_cashback"] = "vulture_fx/vulture_waypoint_" + "specialty_cashback";
				return;
			}
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_124e3889
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0x340
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 79
*/
function function_124e3889()
{
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0x350
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function function_75dd2cd4()
{
}

