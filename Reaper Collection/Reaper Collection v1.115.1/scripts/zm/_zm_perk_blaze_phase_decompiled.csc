#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_3d1a60e3;

/*
	Name: __init__sytem__
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x278
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("blaze_phase", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x2B8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_blazephase", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_blazephase", "revive_light");
	zm_perks::register_perk_init_thread("specialty_blazephase", &function_d820cf1a);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x348
	Size: 0xD8
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
			level.var_9438a32d["p7_zm_vending_blazephase_on"] = "specialty_blazephase";
			level.var_9438a32d["p7_zm_vending_blazephase"] = "specialty_blazephase";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_blazephase"]))
			{
				level._effect["vulture_waypoint_" + "specialty_blazephase"] = "vulture_fx/vulture_waypoint_" + "specialty_blazephase";
			}
		}
		level._effect["blaze_phase_blue_charge"] = "reaps_cz_blaze_phase/blaze_phase_blue_charge";
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x428
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function function_124e3889()
{
	clientfield::register("toplayer", "blaze_phase_burning_screen", 1, 1, "int", &function_555063bb, 0, 1);
	clientfield::register("toplayer", "blaze_phase_burning_blue", 1, 1, "int", &function_445b2092, 0, 1);
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x4C8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function function_75dd2cd4()
{
}

/*
	Name: function_555063bb
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x4D8
	Size: 0xA0
	Parameters: 7
	Flags: None
	Line Number: 108
*/
function function_555063bb(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self thread postfx::playPostfxBundle("pstfx_burn_loop");
	}
	else
	{
		self thread postfx::exitPostfxBundle();
		wait(0.1);
		self thread postfx::exitPostfxBundle();
	}
}

/*
	Name: function_445b2092
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x580
	Size: 0x14A
	Parameters: 7
	Flags: None
	Line Number: 132
*/
function function_445b2092(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	player = GetLocalPlayer(localClientNum);
	if(isdefined(player.var_445b2092))
	{
		stopfx(localClientNum, player.var_445b2092);
		player.var_445b2092 = undefined;
	}
	if(newVal)
	{
		if(!isdefined(player.var_445b2092))
		{
			player.var_445b2092 = PlayFXOnTag(localClientNum, level._effect["blaze_phase_blue_charge"], player, "j_spinelower");
		}
	}
	else if(isdefined(player.var_445b2092))
	{
		stopfx(localClientNum, player.var_445b2092);
		player.var_445b2092 = undefined;
	}
}

