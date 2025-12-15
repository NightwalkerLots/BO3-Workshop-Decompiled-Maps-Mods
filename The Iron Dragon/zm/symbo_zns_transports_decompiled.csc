#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\filter_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_weapons;

#namespace namespace_9cd29803;

/*
	Name: init
	Namespace: namespace_9cd29803
	Checksum: 0x68A53424
	Offset: 0x240
	Size: 0xF8
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec init()
{
	clientfield::register("vehicle", "sewer_current_fx", 9000, 1, "int", &function_5fcc9cf9, 0, 0);
	clientfield::register("toplayer", "tp_water_sheeting", 9000, 1, "int", &function_b7943e55, 0, 0);
	clientfield::register("toplayer", "wind_blur", 9000, 1, "int", &function_5e969437, 0, 0);
	level._effect["current_effect"] = "debris/fx_debris_underwater_current_sgen_os";
}

/*
	Name: function_5fcc9cf9
	Namespace: namespace_9cd29803
	Checksum: 0x3E966CE5
	Offset: 0x340
	Size: 0xD0
	Parameters: 7
	Flags: None
	Line Number: 39
*/
function function_5fcc9cf9(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		if(!isdefined(self.var_d39a53c4))
		{
			self.var_d39a53c4 = [];
		}
		self thread function_3449fb2d(localClientNum);
		continue;
	}
	self notify("hash_f2f823e5");
	if(isdefined(self.var_d39a53c4[localClientNum]))
	{
		deletefx(localClientNum, self.var_d39a53c4[localClientNum], 0);
		return;
	}
	.var_0 = undefined;
}

/*
	Name: function_3449fb2d
	Namespace: namespace_9cd29803
	Checksum: 0x837A7963
	Offset: 0x418
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 69
*/
function function_3449fb2d(localClientNum)
{
	self endon("hash_f2f823e5");
	while(1)
	{
		self.var_d39a53c4[localClientNum] = PlayFXOnTag(localClientNum, level._effect["current_effect"], self, "tag_origin");
		wait(0.05);
	}
}

/*
	Name: function_b7943e55
	Namespace: namespace_9cd29803
	Checksum: 0x4D2FD31D
	Offset: 0x488
	Size: 0xD8
	Parameters: 7
	Flags: None
	Line Number: 89
*/
function function_b7943e55(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		function_6c7d1149(localClientNum, 0.5, 0.6);
		playsound(localClientNum, "evt_sewer_transport_start");
		wait(0.6);
		function_6c7d1149(localClientNum, 0, 0.1);
		continue;
	}
	function_d92493fb(localClientNum, 0.5);
}

/*
	Name: function_5e969437
	Namespace: namespace_9cd29803
	Checksum: 0x7301212C
	Offset: 0x568
	Size: 0xDC
	Parameters: 7
	Flags: None
	Line Number: 112
*/
function function_5e969437(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self PlayRumbleLoopOnEntity(localClientNum, "zm_island_rumble_zipline");
		EnableSpeedBlur(localClientNum, 0.07, 0.55, 0.9, 0, 100, 100);
		continue;
	}
	self StopRumble(localClientNum, "zm_island_rumble_zipline");
	DisableSpeedBlur(localClientNum);
}

