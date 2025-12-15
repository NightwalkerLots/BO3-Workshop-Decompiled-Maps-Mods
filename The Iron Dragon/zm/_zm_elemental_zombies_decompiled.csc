#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace namespace_57695b4d;

/*
	Name: __init__sytem__
	Namespace: namespace_57695b4d
	Checksum: 0xBF2DF09D
	Offset: 0x450
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec __init__sytem__()
{
	system::register("zm_elemental_zombie", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_57695b4d
	Checksum: 0xB1D0B054
	Offset: 0x490
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	init_fx();
	register_clientfields();
}

/*
	Name: init_fx
	Namespace: namespace_57695b4d
	Checksum: 0xEF19E033
	Offset: 0x4C0
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function init_fx()
{
	level._effect["elemental_zombie_sparky"] = "electric/fx_ability_elec_surge_short_robot_optim";
	level._effect["elemental_sparky_zombie_suicide"] = "explosions/fx_ability_exp_ravage_core_optim";
	level._effect["elemental_zombie_fire_damage"] = "fire/fx_embers_burst_optim";
	level._effect["elemental_napalm_zombie_suicide"] = "explosions/fx_exp_dest_barrel_concussion_sm_optim";
	level._effect["elemental_zombie_spark_light"] = "light/fx_light_spark_chest_zombie_optim";
	level._effect["elemental_electric_spark"] = "electric/fx_elec_sparks_burst_blue_optim";
}

/*
	Name: register_clientfields
	Namespace: namespace_57695b4d
	Checksum: 0x5F355DA6
	Offset: 0x578
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function register_clientfields()
{
	clientfield::register("actor", "sparky_zombie_spark_fx", 1, 1, "int", &function_de563d9b, 0, 0);
	clientfield::register("actor", "sparky_zombie_death_fx", 1, 1, "int", &function_d0886efe, 0, 0);
	clientfield::register("actor", "napalm_zombie_death_fx", 1, 1, "int", &function_56ad3a27, 0, 0);
	clientfield::register("actor", "sparky_damaged_fx", 1, 1, "counter", &function_9b52252, 0, 0);
	clientfield::register("actor", "napalm_damaged_fx", 1, 1, "counter", &function_9ed5f539, 0, 0);
	clientfield::register("actor", "napalm_sfx", 1, 1, "int", &function_709b06a, 0, 0);
}

/*
	Name: function_56ad3a27
	Namespace: namespace_57695b4d
	Checksum: 0x5CFC6836
	Offset: 0x738
	Size: 0xD8
	Parameters: 7
	Flags: None
	Line Number: 91
*/
function function_56ad3a27(var_3d850ea0, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	self util::waittill_dobj(var_3d850ea0);
	if(!isdefined(self))
	{
		return;
	}
	if(var_6e653641 !== var_ee3cd374 && var_ee3cd374 === 1)
	{
		FX = PlayFXOnTag(var_3d850ea0, level._effect["elemental_napalm_zombie_suicide"], self, "j_spineupper");
		self playsound(0, "zmb_elemental_zombie_explode_fire");
	}
}

/*
	Name: function_9ed5f539
	Namespace: namespace_57695b4d
	Checksum: 0xDA7BF9B2
	Offset: 0x818
	Size: 0x148
	Parameters: 7
	Flags: None
	Line Number: 115
*/
function function_9ed5f539(var_3d850ea0, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	self endon("entityshutdown");
	self util::waittill_dobj(var_3d850ea0);
	if(!isdefined(self))
	{
		return;
	}
	if(var_ee3cd374)
	{
		if(isdefined(level._effect["elemental_zombie_fire_damage"]))
		{
			playsound(var_3d850ea0, "gdt_electro_bounce", self.origin);
			a_locs = Array("j_wrist_le", "j_wrist_ri");
			FX = PlayFXOnTag(var_3d850ea0, level._effect["elemental_zombie_fire_damage"], self, Array::random(a_locs));
			SetFXIgnorePause(var_3d850ea0, FX, 1);
		}
	}
}

/*
	Name: function_709b06a
	Namespace: namespace_57695b4d
	Checksum: 0x3F03519
	Offset: 0x968
	Size: 0xC8
	Parameters: 7
	Flags: None
	Line Number: 145
*/
function function_709b06a(var_3d850ea0, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(var_ee3cd374 == 1)
	{
		if(!isdefined(self.var_c5157e2a))
		{
			self.var_c5157e2a = self PlayLoopSound("zmb_elemental_zombie_loop_fire", 0.2);
		}
	}
	else if(isdefined(self.var_c5157e2a))
	{
		self StopLoopSound(self.var_c5157e2a, 0.5);
		self.var_c5157e2a = undefined;
	}
}

/*
	Name: function_de563d9b
	Namespace: namespace_57695b4d
	Checksum: 0x6F0223A2
	Offset: 0xA38
	Size: 0x1C0
	Parameters: 7
	Flags: None
	Line Number: 171
*/
function function_de563d9b(var_3d850ea0, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!isdefined(var_ee3cd374))
	{
		return;
	}
	if(var_ee3cd374 == 1)
	{
		if(!isdefined(self.var_ee04c521))
		{
			self.var_ee04c521 = self PlayLoopSound("zmb_electrozomb_lp", 0.2);
		}
		str_tag = "j_spineupper";
		if(isdefined(self.var_bf7d643c))
		{
			str_tag = self.var_bf7d643c;
		}
		str_fx = level._effect["elemental_zombie_sparky"];
		if(isdefined(self.var_9603fac6))
		{
			str_fx = self.var_9603fac6;
		}
		FX = PlayFXOnTag(var_3d850ea0, str_fx, self, str_tag);
		SetFXIgnorePause(var_3d850ea0, FX, 1);
		var_ae3b200c = level._effect["elemental_zombie_spark_light"];
		if(isdefined(self.var_ede9abd1))
		{
			var_ae3b200c = self.var_ede9abd1;
		}
		FX = PlayFXOnTag(var_3d850ea0, var_ae3b200c, self, str_tag);
		SetFXIgnorePause(var_3d850ea0, FX, 1);
	}
}

/*
	Name: function_d0886efe
	Namespace: namespace_57695b4d
	Checksum: 0x16711415
	Offset: 0xC00
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 215
*/
function function_d0886efe(var_3d850ea0, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(var_6e653641 !== var_ee3cd374 && var_ee3cd374 === 1)
	{
		FX = PlayFXOnTag(var_3d850ea0, level._effect["elemental_sparky_zombie_suicide"], self, "j_spineupper");
		self playsound(0, "zmb_elemental_zombie_explode_elec");
	}
}

/*
	Name: function_9b52252
	Namespace: namespace_57695b4d
	Checksum: 0xDB015431
	Offset: 0xCC0
	Size: 0x12C
	Parameters: 7
	Flags: None
	Line Number: 234
*/
function function_9b52252(var_3d850ea0, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	self endon("entityshutdown");
	self util::waittill_dobj(var_3d850ea0);
	if(!isdefined(var_ee3cd374))
	{
		return;
	}
	self util::waittill_dobj(var_3d850ea0);
	if(!isdefined(self))
	{
		return;
	}
	if(var_ee3cd374 >= 1)
	{
		if(!isdefined(self.var_ee04c521))
		{
			self.var_ee04c521 = self PlayLoopSound("zmb_electrozomb_lp", 0.2);
		}
		FX = PlayFXOnTag(var_3d850ea0, level._effect["elemental_electric_spark"], self, "j_spineupper");
		SetFXIgnorePause(var_3d850ea0, FX, 1);
	}
}

