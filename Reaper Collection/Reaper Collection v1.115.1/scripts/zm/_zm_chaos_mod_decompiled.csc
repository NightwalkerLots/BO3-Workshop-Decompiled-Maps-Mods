#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;

#namespace namespace_ac3f3f96;

/*
	Name: __init__sytem__
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x240
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_chaos_mod", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x288
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	level._effect["chaos_mod_fog"] = "chaos_mod/chaos_mod_fog";
	visionset_mgr::register_visionset_info("chaos_mod_noire", 21000, 31, undefined, "zombie_noire");
	visionset_mgr::register_visionset_info("chaos_mod_infrared", 21000, 31, undefined, "infrared");
	level._effect["powerup_on_red"] = "zombie/fx_powerup_on_red_zmb";
	if(!isdefined(level.var_67450254))
	{
		level.var_67450254 = [];
	}
	level.var_67450254["chaos_mod_fog"] = &function_40fdd237;
}

/*
	Name: __main__
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x350
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function __main__()
{
}

/*
	Name: function_40fdd237
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x360
	Size: 0xB6
	Parameters: 7
	Flags: None
	Line Number: 74
*/
function function_40fdd237(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self.var_40fdd237 = PlayFXOnTag(localClientNum, level._effect["chaos_mod_fog"], self, "tag_origin");
	}
	else if(isdefined(self.var_40fdd237))
	{
		stopfx(localClientNum, self.var_40fdd237);
		self.var_40fdd237 = undefined;
	}
}

