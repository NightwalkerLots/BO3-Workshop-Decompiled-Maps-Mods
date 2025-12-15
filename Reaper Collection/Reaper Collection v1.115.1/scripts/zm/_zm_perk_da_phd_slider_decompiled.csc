#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_7e71cf7b;

/*
	Name: __init__sytem__
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x2B0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("DA_PHD_SLIDER", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x2F0
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_da_phd_slider", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_da_phd_slider", "zombie/fx_perk_quick_revive_zmb");
	zm_perks::register_perk_init_thread("specialty_da_phd_slider", &function_d820cf1a);
	if(!isdefined(level.var_67450254))
	{
		level.var_67450254 = [];
	}
	level.var_67450254["reap_cz_da_phd_nuke"] = &function_ce26e89e;
}

/*
	Name: function_d820cf1a
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x3B8
	Size: 0x110
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
			level.var_9438a32d["cz_zombie_vending_da_phd_slider"] = "specialty_da_phd_slider";
			level.var_9438a32d["cz_zombie_vending_da_phd_slider_off"] = "specialty_da_phd_slider";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_da_phd_slider"]))
			{
				level._effect["vulture_waypoint_" + "specialty_da_phd_slider"] = "vulture_fx/vulture_waypoint_" + "specialty_da_phd_slider";
			}
		}
		level._effect["da_phd_machine_on"] = "zombie/fx_perk_quick_revive_zmb";
		level._effect["reap_cz_da_phd_trail"] = "reaps_cz_da_machines/reap_cz_da_phd_trail";
		level._effect["reap_cz_da_phd_nuke"] = "reaps_cz_da_machines/reap_cz_da_phd_nuke";
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x4D0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 85
*/
function function_124e3889()
{
	clientfield::register("toplayer", "phd_slider_trail", 1, 1, "int", &function_5d498775, 0, 1);
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x528
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 100
*/
function function_75dd2cd4()
{
}

/*
	Name: function_5d498775
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x538
	Size: 0xA8
	Parameters: 7
	Flags: None
	Line Number: 114
*/
function function_5d498775(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	player = GetLocalPlayer(localClientNum);
	if(newVal)
	{
		player.var_a345001c = PlayFXOnTag(localClientNum, level._effect["reap_cz_da_phd_trail"], player, "tag_origin");
	}
}

/*
	Name: function_ce26e89e
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x5E8
	Size: 0xB6
	Parameters: 7
	Flags: None
	Line Number: 133
*/
function function_ce26e89e(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self.var_ce26e89e = PlayFXOnTag(localClientNum, level._effect["reap_cz_da_phd_nuke"], self, "tag_origin");
	}
	else if(isdefined(self.var_ce26e89e))
	{
		stopfx(localClientNum, self.var_ce26e89e);
		self.var_ce26e89e = undefined;
	}
}

