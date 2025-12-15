#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;

#namespace namespace_75e0af07;

/*
	Name: __init__sytem__
	Namespace: namespace_75e0af07
	Checksum: 0x8AC73002
	Offset: 0x1D8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_trap_centrifuge", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_75e0af07
	Checksum: 0xB89867B9
	Offset: 0x218
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	if(!isdefined(level._effect))
	{
		level._effect = [];
	}
	level._effect["harry/zm_traps/fx_trap_centrifuge_light"] = "harry/zm_traps/fx_trap_centrifuge_light";
	clientfield::register("scriptmover", "centrifuge_lights", 1, 1, "int", &function_86225045, 0, 0);
}

/*
	Name: function_86225045
	Namespace: namespace_75e0af07
	Checksum: 0x936A1199
	Offset: 0x2A0
	Size: 0x1CE
	Parameters: 7
	Flags: None
	Line Number: 53
*/
function function_86225045(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(isdefined(var_6998917a) && var_6998917a)
	{
		if(!isdefined(self.var_af065900))
		{
			self.var_af065900 = [];
			self.var_af065900[0] = PlayFXOnTag(var_3d850ea0, level._effect["harry/zm_traps/fx_trap_centrifuge_light"], self, "tag_light_fnt_top");
			self.var_af065900[1] = PlayFXOnTag(var_3d850ea0, level._effect["harry/zm_traps/fx_trap_centrifuge_light"], self, "tag_light_fnt_bttm");
			self.var_af065900[2] = PlayFXOnTag(var_3d850ea0, level._effect["harry/zm_traps/fx_trap_centrifuge_light"], self, "tag_light_bk_top");
			self.var_af065900[3] = PlayFXOnTag(var_3d850ea0, level._effect["harry/zm_traps/fx_trap_centrifuge_light"], self, "tag_light_bk_bttm");
		}
	}
	else if(isdefined(self.var_af065900))
	{
		for(i = 0; i < self.var_af065900.size; i++)
		{
			stopfx(var_3d850ea0, self.var_af065900[i]);
		}
		self.var_af065900 = undefined;
	}
}

