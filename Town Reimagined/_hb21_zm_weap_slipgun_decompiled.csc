#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm_weapons;

#namespace namespace_88fb8d29;

/*
	Name: __init__sytem__
	Namespace: namespace_88fb8d29
	Checksum: 0x1B29474E
	Offset: 0x200
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_slipgun", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_88fb8d29
	Checksum: 0x3433D017
	Offset: 0x240
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	clientfield::register("scriptmover", "slipgun_spot_active", 1, 1, "int", &function_2ba8e68b, 0, 0);
}

/*
	Name: function_2ba8e68b
	Namespace: namespace_88fb8d29
	Checksum: 0x626E1764
	Offset: 0x298
	Size: 0xCE
	Parameters: 7
	Flags: None
	Line Number: 52
*/
function function_2ba8e68b(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	self endon("entity_shutdown");
	if(isdefined(var_6998917a) && var_6998917a)
	{
		if(!isdefined(self.var_85879aa4))
		{
			self.var_85879aa4 = PlayFXOnTag(var_3d850ea0, "harry/sliquifier/fx_sliquifier_aoe", self, "script_origin");
		}
	}
	else if(isdefined(self.var_85879aa4))
	{
		stopfx(var_3d850ea0, self.var_85879aa4);
		self.var_85879aa4 = undefined;
	}
}

