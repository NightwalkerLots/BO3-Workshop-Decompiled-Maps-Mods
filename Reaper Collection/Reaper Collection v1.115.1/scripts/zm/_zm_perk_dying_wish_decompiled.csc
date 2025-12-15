#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_f4272f8a;

/*
	Name: __init__sytem__
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0x1E0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("dying_wish", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0x220
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_dyingwish", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_dyingwish", "revive_light");
	zm_perks::register_perk_init_thread("specialty_dyingwish", &function_d820cf1a);
	visionset_mgr::register_visionset_info("zm_dying_wish_sight", 1, 31, undefined, "zm_dying_wish_sight");
	visionset_mgr::register_overlay_info_style_postfx_bundle("zm_dying_wish_sight", 1, 1, "pstfx_zm_bgb_in_plain_sight");
}

/*
	Name: function_d820cf1a
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0x300
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
			level.var_9438a32d["cz_vending_dying_wish_new"] = "specialty_dyingwish";
			level.var_9438a32d["cz_vending_dying_wish_new_off"] = "specialty_dyingwish";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_dyingwish"]))
			{
				level._effect["vulture_waypoint_" + "specialty_dyingwish"] = "vulture_fx/vulture_waypoint_" + "specialty_dyingwish";
				return;
			}
		}
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0x3C0
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
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0x3D0
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function function_75dd2cd4()
{
}

