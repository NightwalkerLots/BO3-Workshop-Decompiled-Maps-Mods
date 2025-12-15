#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\exploder_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;

#namespace namespace_a8433520;

/*
	Name: __init__sytem__
	Namespace: namespace_a8433520
	Checksum: 0xC99C8F80
	Offset: 0x1B8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("hb21_sym_zm_trap_fan", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_a8433520
	Checksum: 0x52425DEA
	Offset: 0x1F8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	if(!isdefined(level._effect))
	{
		level._effect = [];
	}
	level._effect["symbo/zm_traps/fx_fan_trap"] = "symbo/zm_traps/fx_fan_trap";
	clientfield::register("scriptmover", "acid_trap_fx", 1, 1, "int", &function_2ac9170e, 0, 0);
}

/*
	Name: function_2ac9170e
	Namespace: namespace_a8433520
	Checksum: 0xF559F9AE
	Offset: 0x280
	Size: 0x14E
	Parameters: 7
	Flags: None
	Line Number: 54
*/
function function_2ac9170e(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	self endon("entity_shutdown");
	if(isdefined(var_6998917a) && var_6998917a)
	{
		if(!isdefined(self.var_42a2b68e))
		{
			self.var_42a2b68e = [];
			self.var_42a2b68e[0] = PlayFXOnTag(var_3d850ea0, level._effect["symbo/zm_traps/fx_fan_trap"], self, "fan_rt_jnt");
			self.var_42a2b68e[1] = PlayFXOnTag(var_3d850ea0, level._effect["symbo/zm_traps/fx_fan_trap"], self, "fan_lft_jnt");
		}
	}
	else if(isdefined(self.var_42a2b68e))
	{
		stopfx(var_3d850ea0, self.var_42a2b68e[0]);
		stopfx(var_3d850ea0, self.var_42a2b68e[1]);
		self.var_42a2b68e = undefined;
	}
}

