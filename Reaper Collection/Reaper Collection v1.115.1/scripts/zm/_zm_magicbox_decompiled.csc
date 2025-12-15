#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_reap_common;

#namespace zm_magicbox;

/*
	Name: __init__sytem__
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x238
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("zm_magicbox", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x278
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	level._effect["chest_light"] = "zombie/fx_weapon_box_open_glow_zmb";
	level._effect["chest_light_closed"] = "zombie/fx_weapon_box_closed_glow_zmb";
	clientfield::register("zbarrier", "magicbox_open_glow", 1, 1, "int", &magicbox_open_glow_callback, 0, 0);
	clientfield::register("zbarrier", "magicbox_closed_glow", 1, 1, "int", &magicbox_closed_glow_callback, 0, 0);
	clientfield::register("zbarrier", "zbarrier_show_sounds", 1, 1, "counter", &magicbox_show_sounds_callback, 1, 0);
	clientfield::register("zbarrier", "zbarrier_leave_sounds", 1, 1, "counter", &magicbox_leave_sounds_callback, 1, 0);
	if(!isdefined(level.var_67450254))
	{
		level.var_67450254 = [];
	}
	level.var_67450254["force_stream"] = &force_stream_changed;
}

/*
	Name: force_stream_changed
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x410
	Size: 0x88
	Parameters: 7
	Flags: None
	Line Number: 59
*/
function force_stream_changed(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		model = self.model;
		if(isdefined(model))
		{
			thread stream_model_for_time(localClientNum, model, 15);
		}
	}
}

/*
	Name: lock_weapon_model
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x4A0
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 81
*/
function lock_weapon_model(model)
{
	if(isdefined(model))
	{
		if(!isdefined(level.model_locks))
		{
			level.model_locks = [];
		}
		if(!isdefined(level.model_locks[model]))
		{
			level.model_locks[model] = 0;
		}
		if(level.model_locks[model] < 1)
		{
			ForceStreamXModel(model);
		}
		level.model_locks[model]++;
	}
}

/*
	Name: unlock_weapon_model
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x540
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 111
*/
function unlock_weapon_model(model)
{
	if(isdefined(model))
	{
		if(!isdefined(level.model_locks))
		{
			level.model_locks = [];
		}
		if(!isdefined(level.model_locks[model]))
		{
			level.model_locks[model] = 0;
		}
		level.model_locks[model]--;
		if(level.model_locks[model] < 1)
		{
			StopForceStreamingXModel(model);
		}
	}
}

/*
	Name: stream_model_for_time
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5E0
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 141
*/
function stream_model_for_time(localClientNum, model, time)
{
	lock_weapon_model(model);
	wait(time);
	unlock_weapon_model(model);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: magicbox_show_sounds_callback
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x640
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 160
*/
function magicbox_show_sounds_callback(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	playsound(localClientNum, "zmb_box_poof_land", self.origin);
	playsound(localClientNum, "zmb_couch_slam", self.origin);
	playsound(localClientNum, "zmb_box_poof", self.origin);
}

/*
	Name: magicbox_leave_sounds_callback
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x700
	Size: 0x90
	Parameters: 7
	Flags: None
	Line Number: 177
*/
function magicbox_leave_sounds_callback(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	playsound(localClientNum, "zmb_box_move", self.origin);
	playsound(localClientNum, "zmb_whoosh", self.origin);
}

/*
	Name: magicbox_open_glow_callback
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x798
	Size: 0x70
	Parameters: 7
	Flags: None
	Line Number: 193
*/
function magicbox_open_glow_callback(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self thread magicbox_glow_callback(localClientNum, newVal, level._effect["chest_light"]);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: magicbox_closed_glow_callback
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x810
	Size: 0x70
	Parameters: 7
	Flags: None
	Line Number: 210
*/
function magicbox_closed_glow_callback(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self thread magicbox_glow_callback(localClientNum, newVal, level._effect["chest_light_closed"]);
}

/*
	Name: magicbox_glow_callback
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x888
	Size: 0x158
	Parameters: 3
	Flags: None
	Line Number: 225
*/
function magicbox_glow_callback(localClientNum, newVal, FX)
{
	if(!isdefined(self.glow_obj_array))
	{
		self.glow_obj_array = [];
	}
	if(!isdefined(self.glow_fx_array))
	{
		self.glow_fx_array = [];
	}
	if(!isdefined(self.glow_obj_array[localClientNum]))
	{
		fx_obj = spawn(localClientNum, self.origin, "script_model");
		fx_obj SetModel("tag_origin");
		fx_obj.angles = self.angles;
		self.glow_obj_array[localClientNum] = fx_obj;
		wait(0.016);
	}
	self glow_obj_cleanup(localClientNum);
	if(newVal)
	{
		self.glow_fx_array[localClientNum] = PlayFXOnTag(localClientNum, FX, self.glow_obj_array[localClientNum], "tag_origin");
		self glow_obj_demo_jump_listener(localClientNum);
	}
}

/*
	Name: glow_obj_demo_jump_listener
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x9E8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 261
*/
function glow_obj_demo_jump_listener(localClientNum)
{
	self endon("end_demo_jump_listener");
	level waittill("demo_jump");
	if(isdefined(self))
	{
		self glow_obj_cleanup(localClientNum);
	}
}

/*
	Name: glow_obj_cleanup
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0xA38
	Size: 0x5E
	Parameters: 1
	Flags: None
	Line Number: 281
*/
function glow_obj_cleanup(localClientNum)
{
	if(isdefined(self.glow_fx_array[localClientNum]))
	{
		stopfx(localClientNum, self.glow_fx_array[localClientNum]);
		self.glow_fx_array[localClientNum] = undefined;
	}
	self notify("end_demo_jump_listener");
}

