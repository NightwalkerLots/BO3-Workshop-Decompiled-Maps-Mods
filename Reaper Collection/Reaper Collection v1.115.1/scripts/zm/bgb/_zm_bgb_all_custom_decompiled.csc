#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_powerup_bonfire_sale;
#include scripts\zm\_zm_utility;

#namespace namespace_95537630;

/*
	Name: __init__sytem__
	Namespace: namespace_95537630
	Checksum: 0x424F4353
	Offset: 0x4B8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_DEFAULT", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_95537630
	Checksum: 0x424F4353
	Offset: 0x4F8
	Size: 0x420
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	bgb::register("zm_bgb_arbitrary_armament", "rounds");
	bgb::register("zm_bgb_armoured_up", "event");
	bgb::register("zm_bgb_bearly_alive", "rounds");
	bgb::register("zm_bgb_bottomless_bullets", "activated");
	bgb::register("zm_bgb_bullet_bucks", "activated");
	bgb::register("zm_bgb_chilling_conclusion", "activated");
	bgb::register("zm_bgb_conflagration_liquidation", "activated");
	bgb::register("zm_bgb_ctrl_z", "activated");
	bgb::register("zm_bgb_disorientated_distance", "event");
	bgb::register("zm_bgb_exceptionally_equipped", "event");
	bgb::register("zm_bgb_expenditure_exemption", "time");
	bgb::register("zm_bgb_firearm_formulation", "activated");
	bgb::register("zm_bgb_flatulence_fulmination", "event");
	bgb::register("zm_bgb_here_they_rise", "activated");
	bgb::register("zm_bgb_join_the_party", "activated");
	bgb::register("zm_bgb_malevolent_presence", "time");
	bgb::register("zm_bgb_mighty_midas", "rounds");
	bgb::register("zm_bgb_miraculous_box", "event");
	bgb::register("zm_bgb_next_rounds_on_me", "event");
	bgb::register("zm_bgb_nowhere_but_there", "activated");
	bgb::register("zm_bgb_on_a_whim", "event");
	bgb::register("zm_bgb_play_it_again_sam", "activated");
	bgb::register("zm_bgb_point_drops", "activated");
	bgb::register("zm_bgb_power_keg", "activated");
	bgb::register("zm_bgb_power_to_the_people", "event");
	bgb::register("zm_bgb_quacknarok", "time");
	bgb::register("zm_bgb_shields_up", "activated");
	bgb::register("zm_bgb_sucker_points", "time");
	bgb::register("zm_bgb_prismatic_touch", "activated");
	clientfield::register("actor", "bgb_malevolent_presence", 21000, 1, "int", &attach_model, 0, 0);
	level._effect["malevolent_presence_zombie"] = "custom_bgb/malevolent_presence_zombie";
}

/*
	Name: attach_model
	Namespace: namespace_95537630
	Checksum: 0x424F4353
	Offset: 0x920
	Size: 0xEE
	Parameters: 7
	Flags: None
	Line Number: 85
*/
function attach_model(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(isdefined(self.var_9afda2c1))
	{
		stopfx(localClientNum, self.var_9afda2c1);
	}
	if(newVal)
	{
		if(!isdefined(self.var_9afda2c1))
		{
			self.var_9afda2c1 = PlayFXOnTag(localClientNum, level._effect["malevolent_presence_zombie"], self, "J_SpineLower");
		}
	}
	else if(isdefined(self.var_9afda2c1))
	{
		stopfx(localClientNum, self.var_9afda2c1);
		self.var_9afda2c1 = undefined;
	}
}

