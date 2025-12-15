#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_12c937e1;

/*
	Name: function_3f816f6a
	Namespace: namespace_12c937e1
	Checksum: 0x2563EC0E
	Offset: 0x2F0
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 32
*/
function function_3f816f6a(message, return_value)
{
	if(isdefined(return_value))
	{
		return return_value;
	}
}

/*
	Name: function_f2fa04c
	Namespace: namespace_12c937e1
	Checksum: 0x15D15837
	Offset: 0x320
	Size: 0x180
	Parameters: 5
	Flags: None
	Line Number: 50
*/
function function_f2fa04c(v_origin, v_angles, var_e6308502, n_radius, n_height)
{
	if(!isdefined(v_origin))
	{
		v_origin = function_3f816f6a("WE WOULD PASS OUR ERROR MESSAGE HERE", (0, 0, 0));
	}
	if(!isdefined(v_angles))
	{
		v_angles = function_3f816f6a("WE WOULD PASS OUR ERROR MESSAGE HERE", (0, 0, 0));
	}
	if(!isdefined(var_e6308502))
	{
		var_e6308502 = function_3f816f6a("WE WOULD PASS OUR ERROR MESSAGE HERE", 1);
	}
	if(!isdefined(n_radius))
	{
		n_radius = function_3f816f6a("WE WOULD PASS OUR ERROR MESSAGE HERE", 256);
	}
	if(!isdefined(n_height))
	{
		n_height = function_3f816f6a("WE WOULD PASS OUR ERROR MESSAGE HERE", 128);
	}
	e_trigger = spawn("trigger_radius_use", v_origin, var_e6308502, n_radius, n_height);
	e_trigger.angles = v_angles;
	e_trigger TriggerIgnoreTeam();
	e_trigger setHintString("");
	return e_trigger;
}

