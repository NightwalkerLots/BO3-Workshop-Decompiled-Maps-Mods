#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\music_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;

#namespace namespace_eb92fcf2;

/*
	Name: __init__sytem__
	Namespace: namespace_eb92fcf2
	Checksum: 0x62843BB8
	Offset: 0x210
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("db_util", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_eb92fcf2
	Checksum: 0xEEE89A41
	Offset: 0x250
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	clientfield::register("scriptmover", "db_set_script_material", 1, 2, "int", &function_d8c43018, 0, 0);
	util::REGISTER_SYSTEM("dbSendClientMsg", &function_c075195f);
	callback::on_localclient_connect(&player_init);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c075195f
	Namespace: namespace_eb92fcf2
	Checksum: 0xEC2F84B7
	Offset: 0x2F0
	Size: 0xE8
	Parameters: 3
	Flags: None
	Line Number: 55
*/
function function_c075195f(localClientNum, newVal, oldVal)
{
	msg = newVal;
	if(!isdefined(msg))
	{
		msg = "";
	}
	self function_52c34727(localClientNum, oldVal, msg, 0, undefined, "dbSendLuaMsg", 0);
	model = GetUIModel(GetUIModelForController(localClientNum), "dbSendLuaMsg");
	SetUIModelValue(model, msg);
	level notify("hash_c075195f", localClientNum, msg);
}

/*
	Name: player_init
	Namespace: namespace_eb92fcf2
	Checksum: 0x5306B00
	Offset: 0x3E0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 78
*/
function player_init(localClientNum)
{
	if(IsSplitScreenHost(localClientNum))
	{
		function_fd0f9098();
	}
}

/*
	Name: function_fd0f9098
	Namespace: namespace_eb92fcf2
	Checksum: 0xE291627B
	Offset: 0x428
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 96
*/
function function_fd0f9098()
{
	lineEmitters = struct::get_array("line_emitter_extended", "script_label");
	if(isdefined(lineEmitters) && lineEmitters.size > 0)
	{
		delay = 0;
		/#
			if(GetDvarInt("Dev Block strings are not supported") > 0)
			{
				println("Dev Block strings are not supported" + lineEmitters.size + "Dev Block strings are not supported");
			}
		#/
		for(i = 0; i < lineEmitters.size; i++)
		{
			lineEmitters[i] thread function_95a04fd6();
			delay = delay + 1;
			if(delay % 20 == 0)
			{
				wait(0.016);
			}
		}
	}
	else
	{
		if(GetDvarInt("Dev Block strings are not supported") > 0)
		{
			println("Dev Block strings are not supported");
		}
	}
	/#
	#/
}

/*
	Name: function_95a04fd6
	Namespace: namespace_eb92fcf2
	Checksum: 0x1F7208DA
	Offset: 0x590
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 139
*/
function function_95a04fd6()
{
	if(!isdefined(self.target))
	{
		return;
	}
	start = self;
	end = struct::get(start.target, "targetname");
	while(isdefined(end))
	{
		self thread function_7a4dd582(start.origin, end.origin);
		start = end;
		end = struct::get(start.target, "targetname");
		wait(0.016);
	}
}

/*
	Name: function_7a4dd582
	Namespace: namespace_eb92fcf2
	Checksum: 0x3899AFB4
	Offset: 0x668
	Size: 0x138
	Parameters: 2
	Flags: None
	Line Number: 166
*/
function function_7a4dd582(start, end)
{
	notifyname = "";
	if(isdefined(self.script_string))
	{
		notifyname = self.script_string;
	}
	started = 1;
	if(isdefined(self.script_int))
	{
		started = self.script_int != 0;
	}
	if(started)
	{
		soundLineEmitter(self.script_sound, start, end);
	}
	if(notifyname != "")
	{
		for(;;)
		{
			level waittill(notifyname);
			if(started)
			{
				soundStopLineEmitter(self.script_sound, start, end);
				self thread soundLineCheckpointRestore(start, end);
				continue;
			}
			soundLineEmitter(self.script_sound, start, end);
			started = !started;
		}
	}
}

/*
	Name: soundLineCheckpointRestore
	Namespace: namespace_eb92fcf2
	Checksum: 0x9E0DEA9
	Offset: 0x7A8
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 209
*/
function soundLineCheckpointRestore(start, end)
{
	level waittill("save_restore");
	soundLineEmitter(self.script_sound, start, end);
	return;
}

/*
	Name: function_52c34727
	Namespace: namespace_eb92fcf2
	Checksum: 0xA071E1C6
	Offset: 0x7F8
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 226
*/
function function_52c34727(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), fieldName);
	SetUIModelValue(model, newVal);
}

/*
	Name: function_d8c43018
	Namespace: namespace_eb92fcf2
	Checksum: 0xE3B7DE17
	Offset: 0x898
	Size: 0x70
	Parameters: 7
	Flags: None
	Line Number: 242
*/
function function_d8c43018(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self MapShaderConstant(localClientNum, 0, "scriptVector2", 0, 1, newVal, 0);
}

/*
	Name: function_2d8b1d69
	Namespace: namespace_eb92fcf2
	Checksum: 0xA0E73B64
	Offset: 0x910
	Size: 0xE0
	Parameters: 7
	Flags: None
	Line Number: 257
*/
function function_2d8b1d69(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(!isdefined(self.FX))
	{
		self.FX = [];
	}
	if(isdefined(self.FX[fieldName]))
	{
		stopfx(localClientNum, self.FX[fieldName]);
		self.FX[fieldName] = undefined;
	}
	if(newVal)
	{
		self.FX[fieldName] = PlayFXOnTag(localClientNum, level._effect[fieldName], self, "tag_origin");
	}
}

/*
	Name: function_76e66fd8
	Namespace: namespace_eb92fcf2
	Checksum: 0x39FFD5A1
	Offset: 0x9F8
	Size: 0xE0
	Parameters: 7
	Flags: None
	Line Number: 284
*/
function function_76e66fd8(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(!isdefined(self.FX))
	{
		self.FX = [];
	}
	if(isdefined(self.FX[fieldName]))
	{
		deletefx(localClientNum, self.FX[fieldName]);
		self.FX[fieldName] = undefined;
	}
	if(newVal)
	{
		self.FX[fieldName] = PlayFXOnTag(localClientNum, level._effect[fieldName], self, "tag_origin");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b305a3e8
	Namespace: namespace_eb92fcf2
	Checksum: 0xBBD57DA4
	Offset: 0xAE0
	Size: 0x6C
	Parameters: 7
	Flags: None
	Line Number: 313
*/
function function_b305a3e8(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	PlayFXOnTag(localClientNum, level._effect[fieldName], self, "tag_origin");
}

