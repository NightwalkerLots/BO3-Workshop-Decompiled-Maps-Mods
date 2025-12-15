#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_32dd7dbd;

/*
	Name: init
	Namespace: namespace_32dd7dbd
	Checksum: 0x94CF4A8F
	Offset: 0x200
	Size: 0x98
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec init()
{
	clientfield::register("toplayer", "red_laser_fx_view", 1, 1, "int", &function_920d3ebd, 0, 0);
	clientfield::register("allplayers", "red_laser_fx_world", 1, 1, "int", &function_d5a79966, 0, 0);
}

/*
	Name: function_920d3ebd
	Namespace: namespace_32dd7dbd
	Checksum: 0x93E82B8
	Offset: 0x2A0
	Size: 0xD8
	Parameters: 7
	Flags: None
	Line Number: 39
*/
function function_920d3ebd(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		if(isdefined(self.var_6550cf61))
		{
			KillFX(localClientNum, self.var_6550cf61);
		}
		self.var_6550cf61 = PlayViewmodelFX(localClientNum, "KJ/laser_loop_red", "tag_flash");
	}
	else if(isdefined(self.var_6550cf61))
	{
		KillFX(localClientNum, self.var_6550cf61);
		self.var_6550cf61 = undefined;
	}
}

/*
	Name: function_d5a79966
	Namespace: namespace_32dd7dbd
	Checksum: 0x53B3BAE8
	Offset: 0x380
	Size: 0x106
	Parameters: 7
	Flags: None
	Line Number: 66
*/
function function_d5a79966(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		var_d665442b = GetLocalPlayer(localClientNum);
		if(isdefined(self.var_961d65ea))
		{
			KillFX(localClientNum, self.var_961d65ea);
		}
		if(var_d665442b != self)
		{
			self.var_961d65ea = PlayFXOnTag(localClientNum, "KJ/laser_loop_red", self, "tag_flash");
		}
	}
	else if(isdefined(self.var_961d65ea))
	{
		KillFX(localClientNum, self.var_961d65ea);
		self.var_961d65ea = undefined;
	}
}

