#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_2248ddce;

/*
	Name: __init__sytem__
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x270
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec __init__sytem__()
{
	system::register("SPECTOR_SHOT", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x2B0
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_spectorshot", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_spectorshot", "revive_light");
	zm_perks::register_perk_init_thread("specialty_spectorshot", &function_d820cf1a);
	duplicate_render::set_dr_filter_framebuffer("spectorshot", 10, "spectorshot_on", undefined, 0, "mc/mtl_c_zom_spectorshot_render", 0);
	if(!isdefined(level.var_67450254))
	{
		level.var_67450254 = [];
	}
	level.var_67450254["spectorshot_render"] = &function_85a5797b;
	return;
}

/*
	Name: function_d820cf1a
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x3A8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["cz_vending_spectorshot_on"] = "specialty_spectorshot";
			level.var_9438a32d["cz_vending_spectorshot"] = "specialty_spectorshot";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_spectorshot"]))
			{
				level._effect["vulture_waypoint_" + "specialty_spectorshot"] = "vulture_fx/vulture_waypoint_" + "specialty_spectorshot";
				return;
			}
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_124e3889
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x468
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 89
*/
function function_124e3889()
{
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x478
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 103
*/
function function_75dd2cd4()
{
}

/*
	Name: function_85a5797b
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x488
	Size: 0x15C
	Parameters: 7
	Flags: None
	Line Number: 117
*/
function function_85a5797b(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self.var_85a5797b = PlayFXOnTag(localClientNum, level._effect["winters_wail_zombie"], self, "tag_origin");
		self duplicate_render::set_dr_flag("spectorshot_on", 1);
		self duplicate_render::update_dr_filters(localClientNum);
		self MapShaderConstant(localClientNum, 0, "scriptVector0", 0.5);
	}
	else
	{
		stopfx(localClientNum, self.var_85a5797b);
		self.var_85a5797b = undefined;
		self duplicate_render::set_dr_flag("spectorshot_on", 0);
		self duplicate_render::update_dr_filters(localClientNum);
		self MapShaderConstant(localClientNum, 0, "scriptVector0", 0);
	}
}

