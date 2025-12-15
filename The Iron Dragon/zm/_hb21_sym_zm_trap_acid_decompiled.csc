#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\exploder_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;

#namespace namespace_43042162;

/*
	Name: __init__sytem__
	Namespace: namespace_43042162
	Checksum: 0x5068067C
	Offset: 0x238
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("hb21_sym_zm_trap_acid", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_43042162
	Checksum: 0xED4596D8
	Offset: 0x278
	Size: 0x1E0
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
	level._effect["harry/zm_traps/fx_trap_acid_rain"] = "harry/zm_traps/fx_trap_acid_rain";
	clientfield::register("actor", "trap_acid_ai_disintegrate", 1, 1, "int", &function_ff49081a, 0, 0);
	clientfield::register("vehicle", "trap_acid_ai_disintegrate", 1, 1, "int", &function_ff49081a, 0, 0);
	duplicate_render::set_dr_filter_framebuffer("trap_acid_dissolve", 11, "trap_acid_dissolve_on", "dissolve_on", 0, "mc/mtl_c_zom_dlc3_zombie_dissolve_base", 0);
	a_traps = struct::get_array("trap_acid", "targetname");
	foreach(e_trap in a_traps)
	{
		clientfield::register("world", e_trap.script_noteworthy, 1, 1, "int", &function_d9bc580e, 0, 0);
	}
}

/*
	Name: function_ff49081a
	Namespace: namespace_43042162
	Checksum: 0xB74C5277
	Offset: 0x460
	Size: 0x120
	Parameters: 7
	Flags: None
	Line Number: 61
*/
function function_ff49081a(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	self endon("entity_shutdown");
	self duplicate_render::set_dr_flag("trap_acid_dissolve_on", var_6998917a);
	self duplicate_render::update_dr_filters(var_3d850ea0);
	self.var_2e4f06cb = 1;
	while(isdefined(self) && self.var_2e4f06cb > 0)
	{
		self MapShaderConstant(var_3d850ea0, 0, "scriptVector0", self.var_2e4f06cb);
		self.var_2e4f06cb = self.var_2e4f06cb - 0.0333;
		wait(0.0333);
	}
	if(isdefined(self))
	{
		self MapShaderConstant(var_3d850ea0, 0, "scriptVector0", 0);
	}
}

/*
	Name: function_d9bc580e
	Namespace: namespace_43042162
	Checksum: 0xFCC8A9AD
	Offset: 0x588
	Size: 0x128
	Parameters: 7
	Flags: None
	Line Number: 89
*/
function function_d9bc580e(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	var_114bee7f = struct::get_array(str_field_name, "targetname");
	foreach(var_7402b4a in var_114bee7f)
	{
		if(!isdefined(var_7402b4a.script_noteworthy))
		{
			if(var_6998917a)
			{
				var_7402b4a thread function_665da7a3();
				continue;
			}
			var_7402b4a thread function_c1770f24();
		}
	}
}

/*
	Name: function_665da7a3
	Namespace: namespace_43042162
	Checksum: 0xFEBEDC5D
	Offset: 0x6B8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 116
*/
function function_665da7a3()
{
	if(isdefined(self.var_a8dcce84) && self.var_a8dcce84.size)
	{
		function_c1770f24();
	}
	if(!isdefined(self.var_a8dcce84))
	{
		self.var_a8dcce84 = [];
	}
	a_players = GetLocalPlayers();
	for(i = 0; i < a_players.size; i++)
	{
		self.var_a8dcce84[i] = playFX(i, level._effect["harry/zm_traps/fx_trap_acid_rain"], self.origin);
	}
}

/*
	Name: function_c1770f24
	Namespace: namespace_43042162
	Checksum: 0x7BCEC06F
	Offset: 0x790
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 143
*/
function function_c1770f24()
{
	a_players = GetLocalPlayers();
	for(i = 0; i < a_players.size; i++)
	{
		if(isdefined(self.var_a8dcce84[i]))
		{
			stopfx(i, self.var_a8dcce84[i]);
		}
	}
	self.var_a8dcce84 = [];
}

