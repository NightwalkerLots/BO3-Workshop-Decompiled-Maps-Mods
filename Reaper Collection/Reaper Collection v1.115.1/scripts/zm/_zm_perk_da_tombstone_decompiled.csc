#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_ab667430;

/*
	Name: __init__sytem__
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x390
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec __init__sytem__()
{
	system::register("DA_TOMBSTONE", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x3D0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_da_tombstone", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_da_tombstone", "zombie/fx_perk_quick_revive_zmb");
	zm_perks::register_perk_init_thread("specialty_da_tombstone", &function_d820cf1a);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x460
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["cz_zombie_vending_da_tombstone"] = "specialty_da_tombstone";
			level.var_9438a32d["cz_zombie_vending_da_tombstone_off"] = "specialty_da_tombstone";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_da_tombstone"]))
			{
				level._effect["vulture_waypoint_" + "specialty_da_tombstone"] = "vulture_fx/vulture_waypoint_" + "specialty_da_tombstone";
			}
		}
		level._effect["tombstone_da_light"] = "zombie/fx_perk_quick_revive_zmb";
		level._effect["reap_cz_da_tombstone_grave"] = "reaps_cz_da_machines/reap_cz_da_tombstone_grave";
		level._effect["reap_cz_da_tombstone_shadow_player"] = "reaps_cz_da_machines/reap_cz_da_tombstone_shadow_player";
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x578
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 83
*/
function function_124e3889()
{
	visionset_mgr::register_visionset_info("zm_tombstone", 1, 31, undefined, "zm_tombstone");
	visionset_mgr::register_overlay_info_style_speed_blur("zm_tombstone_blur", 1, 30, 0.12, 0.35, 1);
	duplicate_render::set_dr_filter_framebuffer("tombstone_render", 10, "tombstone_render", undefined, 0, "mc/mtl_c_zom_tombstone_shadow_render", 0);
	clientfield::register("clientuimodel", "player_tombstone", 1, 1, "int", &tombstone, 0, 0);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x660
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function function_75dd2cd4()
{
}

/*
	Name: tombstone
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x670
	Size: 0x31A
	Parameters: 7
	Flags: None
	Line Number: 118
*/
function tombstone(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	player = GetLocalPlayer(localClientNum);
	if(newVal)
	{
		player duplicate_render::set_dr_flag("tombstone_render", 1);
		player duplicate_render::update_dr_filters(localClientNum);
		player MapShaderConstant(localClientNum, 0, "scriptVector0", 0.5);
		all = GetEntArray(localClientNum);
		foreach(ent in all)
		{
			if(isdefined(ent.model) && ent.model == "cz_zombie_vending_da_tombstone_grave" && !isdefined(ent.var_6e8c70fb))
			{
				ent.var_6e8c70fb = PlayFXOnTag(localClientNum, level._effect["reap_cz_da_tombstone_grave"], ent, "tag_origin");
			}
		}
		if(isdefined(player.var_d5677ec2))
		{
			stopfx(localClientNum, player.var_d5677ec2);
			player.var_d5677ec2 = undefined;
		}
		player.var_d5677ec2 = PlayFXOnTag(localClientNum, level._effect["reap_cz_da_tombstone_shadow_player"], player, "j_head");
	}
	else
	{
		player duplicate_render::set_dr_flag("tombstone_render", 0);
		player duplicate_render::update_dr_filters(localClientNum);
		player MapShaderConstant(localClientNum, 0, "scriptVector0", 0);
		if(isdefined(player.var_d5677ec2))
		{
			stopfx(localClientNum, player.var_d5677ec2);
			player.var_d5677ec2 = undefined;
		}
	}
}

