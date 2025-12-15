#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_utility;

#namespace namespace_d5190444;

/*
	Name: __init__sytem__
	Namespace: namespace_d5190444
	Checksum: 0x424F4353
	Offset: 0x260
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_idle_eyes", &__init__, undefined, "bgb");
	return;
}

/*
	Name: __init__
	Namespace: namespace_d5190444
	Checksum: 0x424F4353
	Offset: 0x2A0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	bgb::register("zm_bgb_idle_eyes", "activated", 3, undefined, undefined, &validation, &activation);
	bgb::function_4cda71bf("zm_bgb_idle_eyes", 1);
	bgb::function_336ffc4e("zm_bgb_idle_eyes");
	if(!isdefined(level.var_c2d3ebc0))
	{
		level.var_c2d3ebc0 = 112;
	}
	visionset_mgr::register_info("visionset", "zm_bgb_idle_eyes", 1, level.var_c2d3ebc0, 31, 1, &visionset_mgr::ramp_in_out_thread_per_player, 0);
	if(!isdefined(level.var_384c0a48))
	{
		level.var_384c0a48 = 112;
	}
	visionset_mgr::register_info("overlay", "zm_bgb_idle_eyes", 1, level.var_384c0a48, 1, 1);
}

/*
	Name: validation
	Namespace: namespace_d5190444
	Checksum: 0x424F4353
	Offset: 0x3F0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function validation()
{
	return !bgb::is_team_active("zm_bgb_idle_eyes");
}

/*
	Name: activation
	Namespace: namespace_d5190444
	Checksum: 0x424F4353
	Offset: 0x418
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 84
*/
function activation()
{
	self endon("disconnect");
	self endon("death");
	var_7092e170 = ArrayCopy(level.activePlayers);
	Array::thread_all(var_7092e170, &enable);
	self.bgb_idle_eyes_active = 1;
	if(!bgb::function_f345a8ce("zm_bgb_idle_eyes"))
	{
		if(isdefined(level.no_target_override))
		{
			if(!isdefined(level.var_4effcea9))
			{
				level.var_4effcea9 = level.no_target_override;
			}
			level.no_target_override = undefined;
		}
	}
	level thread function_1f57344e(self, var_7092e170);
	self thread bgb::run_timer(31);
	self util::waittill_any_timeout(30.5, "bgb_about_to_take_on_bled_out", "bgb_activation_request", "end_game", "bgb_update", "disconnect");
	self.bgb_idle_eyes_active = undefined;
	self notify("hash_16ab3604");
	deactivate(var_7092e170);
}

/*
	Name: function_1f57344e
	Namespace: namespace_d5190444
	Checksum: 0x424F4353
	Offset: 0x590
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 120
*/
function function_1f57344e(e_watch, var_7092e170)
{
	e_watch endon("hash_16ab3604");
	e_watch waittill("disconnect");
	deactivate(var_7092e170);
	return;
}

/*
	Name: deactivate
	Namespace: namespace_d5190444
	Checksum: 0x424F4353
	Offset: 0x5E0
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 138
*/
function deactivate(var_7092e170)
{
	var_7092e170 = Array::remove_undefined(var_7092e170);
	Array::thread_all(var_7092e170, &disable);
	if(bgb::function_72936116("zm_bgb_idle_eyes"))
	{
		return;
	}
	if(isdefined(level.var_4effcea9))
	{
		level.no_target_override = level.var_4effcea9;
		level.var_4effcea9 = undefined;
	}
}

/*
	Name: enable
	Namespace: namespace_d5190444
	Checksum: 0x424F4353
	Offset: 0x678
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 163
*/
function enable()
{
	self zm_utility::increment_ignoreme();
	self playsound("zmb_bgb_idleeyes_start");
	self PlayLoopSound("zmb_bgb_idleeyes_loop", 1);
	visionset_mgr::activate("visionset", "zm_bgb_idle_eyes", self, 0.5, 30, 0.5);
	visionset_mgr::activate("overlay", "zm_bgb_idle_eyes", self);
}

/*
	Name: disable
	Namespace: namespace_d5190444
	Checksum: 0x424F4353
	Offset: 0x738
	Size: 0x9C
	Parameters: 0
	Flags: None
	Line Number: 182
*/
function disable()
{
	self zm_utility::decrement_ignoreme();
	self StopLoopSound(1);
	self playsound("zmb_bgb_idleeyes_end");
	visionset_mgr::deactivate("visionset", "zm_bgb_idle_eyes", self);
	wait(0.5);
	visionset_mgr::deactivate("overlay", "zm_bgb_idle_eyes", self);
}

