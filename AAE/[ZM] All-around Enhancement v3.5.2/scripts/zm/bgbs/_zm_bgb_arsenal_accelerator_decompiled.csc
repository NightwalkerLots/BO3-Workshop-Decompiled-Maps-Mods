#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_utility;

#namespace namespace_3ab5ff91;

/*
	Name: __init__sytem__
	Namespace: namespace_3ab5ff91
	Checksum: 0x424F4353
	Offset: 0x228
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_arsenal_accelerator", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_3ab5ff91
	Checksum: 0x424F4353
	Offset: 0x268
	Size: 0xD0
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
	bgb::register("zm_bgb_arsenal_accelerator", "time");
	clientfield::register("allplayers", "zm_bgb_arsenal_accelerator_3p_fx", 15000, 1, "int", &function_24480126, 0, 0);
	clientfield::register("toplayer", "zm_bgb_arsenal_accelerator_1p_fx", 15000, 1, "int", &function_11972f24, 0, 1);
}

/*
	Name: function_24480126
	Namespace: namespace_3ab5ff91
	Checksum: 0x424F4353
	Offset: 0x340
	Size: 0x128
	Parameters: 7
	Flags: None
	Line Number: 57
*/
function function_24480126(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	var_b84b5692 = GetLocalPlayer(localClientNum);
	if(newVal)
	{
		if(var_b84b5692 != self)
		{
			if(!isdefined(self.var_6b39dbae))
			{
				self.var_6b39dbae = [];
			}
			if(isdefined(self.var_6b39dbae[localClientNum]))
			{
				return;
			}
			self.var_6b39dbae[localClientNum] = PlayFXOnTag(localClientNum, "zombie/fx_bgb_arsenal_accelerator_3p", self, "j_spine4");
		}
	}
	else if(isdefined(self.var_6b39dbae) && isdefined(self.var_6b39dbae[localClientNum]))
	{
		stopfx(localClientNum, self.var_6b39dbae[localClientNum]);
		self.var_6b39dbae[localClientNum] = undefined;
	}
}

/*
	Name: function_11972f24
	Namespace: namespace_3ab5ff91
	Checksum: 0x424F4353
	Offset: 0x470
	Size: 0xF8
	Parameters: 7
	Flags: None
	Line Number: 92
*/
function function_11972f24(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		if(isdefined(level.var_3b53e98b[localClientNum]))
		{
			deletefx(localClientNum, level.var_3b53e98b[localClientNum]);
		}
		level.var_3b53e98b[localClientNum] = PlayFXOnCamera(localClientNum, "zombie/fx_bgb_arsenal_accelerator_1p", (0, 0, 0), (1, 0, 0));
	}
	else if(isdefined(level.var_3b53e98b[localClientNum]))
	{
		stopfx(localClientNum, level.var_3b53e98b[localClientNum]);
		level.var_3b53e98b[localClientNum] = undefined;
	}
}

