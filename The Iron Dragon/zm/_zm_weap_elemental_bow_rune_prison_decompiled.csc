#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_weap_elemental_bow;

#namespace namespace_156ea490;

/*
	Name: __init__sytem__
	Namespace: namespace_156ea490
	Checksum: 0x3E7FFD9D
	Offset: 0x510
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("_zm_weap_elemental_bow_rune_prison", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_156ea490
	Checksum: 0x79BA2838
	Offset: 0x550
	Size: 0x330
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	clientfield::register("toplayer", "elemental_bow_rune_prison" + "_ambient_bow_fx", 1, 1, "int", &function_c804eed3, 0, 0);
	clientfield::register("missile", "elemental_bow_rune_prison" + "_arrow_impact_fx", 1, 1, "int", &function_caa07722, 0, 0);
	clientfield::register("missile", "elemental_bow_rune_prison4" + "_arrow_impact_fx", 1, 1, "int", &function_a265922, 0, 0);
	clientfield::register("scriptmover", "runeprison_rock_fx", 1, 1, "int", &function_63be352d, 0, 0);
	clientfield::register("scriptmover", "runeprison_explode_fx", 1, 1, "int", &function_409bb06f, 0, 0);
	clientfield::register("scriptmover", "runeprison_lava_geyser_fx", 1, 1, "int", &function_cea37b26, 0, 0);
	clientfield::register("actor", "runeprison_lava_geyser_dot_fx", 1, 1, "int", &function_96b27c9e, 0, 0);
	clientfield::register("actor", "runeprison_zombie_charring", 1, 1, "int", &function_ddc32cba, 0, 0);
	clientfield::register("actor", "runeprison_zombie_death_skull", 1, 1, "int", &function_b0a5feb0, 0, 0);
	level._effect["rune_ambient_bow"] = "dlc1/zmb_weapon/fx_bow_rune_ambient_1p_zmb";
	level._effect["rune_arrow_impact"] = "dlc1/zmb_weapon/fx_bow_rune_impact_zmb";
	level._effect["rune_fire_pillar"] = "dlc1/zmb_weapon/fx_bow_rune_impact_ug_fire_zmb";
	level._effect["rune_lava_geyser"] = "dlc1/zmb_weapon/fx_bow_rune_impact_aoe_zmb";
	level._effect["rune_lava_geyser_dot"] = "dlc1/zmb_weapon/fx_bow_rune_fire_torso_zmb";
}

/*
	Name: function_c804eed3
	Namespace: namespace_156ea490
	Checksum: 0xA769EA45
	Offset: 0x888
	Size: 0x68
	Parameters: 7
	Flags: None
	Line Number: 67
*/
function function_c804eed3(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self zm_weap_elemental_bow::function_783ddebf(localClientNum, newVal, "rune_ambient_bow");
}

/*
	Name: function_caa07722
	Namespace: namespace_156ea490
	Checksum: 0xC3BE4A7B
	Offset: 0x8F8
	Size: 0x78
	Parameters: 7
	Flags: None
	Line Number: 82
*/
function function_caa07722()
{
	// Could not fully decompile function; skipped
}

/*
	Name: function_a265922
	Namespace: namespace_156ea490
	Checksum: 0xFF23116
	Offset: 0x978
	Size: 0x78
	Parameters: 7
	Flags: None
	Line Number: 97
*/
function function_a265922(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		playFX(localClientNum, level._effect["rune_arrow_impact"], self.origin);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_63be352d
	Namespace: namespace_156ea490
	Checksum: 0x6955DF7
	Offset: 0x9F8
	Size: 0x128
	Parameters: 7
	Flags: None
	Line Number: 117
*/
function function_63be352d(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	switch(newVal)
	{
		case 0:
		{
			self function_406fdb8("p7_fxanim_zm_bow_rune_prison_01_bundle");
			if(!isdefined(self))
			{
				return;
			}
			self thread function_406fdb8("p7_fxanim_zm_bow_rune_prison_01_dissolve_bundle", self.var_cedb9611);
			self.var_cedb9611 thread function_120a6c23(localClientNum);
			break;
		}
		case 1:
		{
			self thread scene::init("p7_fxanim_zm_bow_rune_prison_01_bundle");
			self.var_cedb9611 = util::spawn_model(localClientNum, "p7_fxanim_zm_bow_rune_prison_dissolve_mod", self.origin, self.angles);
			break;
		}
	}
}

/*
	Name: function_406fdb8
	Namespace: namespace_156ea490
	Checksum: 0x69143BE3
	Offset: 0xB28
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 151
*/
function function_406fdb8(scene, str_scene)
{
	self notify("hash_406fdb8");
	self endon("hash_406fdb8");
	self scene::stop();
	self function_6221b6b9(scene, str_scene);
	if(isdefined(self))
	{
		self scene::stop();
	}
}

/*
	Name: function_6221b6b9
	Namespace: namespace_156ea490
	Checksum: 0x9549ECF9
	Offset: 0xBB8
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 173
*/
function function_6221b6b9(scene, str_scene)
{
	level endon("demo_jump");
	self scene::Play(scene, str_scene);
}

/*
	Name: function_120a6c23
	Namespace: namespace_156ea490
	Checksum: 0x8AE07FDD
	Offset: 0xC00
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 189
*/
function function_120a6c23(localClientNum)
{
	self endon("entityshutdown");
	n_start_time = GetTime();
	n_end_time = n_start_time + 1633;
	b_is_updating = 1;
	while(b_is_updating)
	{
		n_time = GetTime();
		if(n_time >= n_end_time)
		{
			n_shader_value = mapfloat(n_start_time, n_end_time, 1, 0, n_end_time);
			b_is_updating = 0;
			continue;
		}
		n_shader_value = mapfloat(n_start_time, n_end_time, 1, 0, n_time);
		self MapShaderConstant(localClientNum, 0, "scriptVector0", n_shader_value, 0, 0);
		wait(0.016);
	}
}

/*
	Name: function_409bb06f
	Namespace: namespace_156ea490
	Checksum: 0x2813334A
	Offset: 0xD20
	Size: 0x80
	Parameters: 7
	Flags: None
	Line Number: 220
*/
function function_409bb06f(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		playFX(localClientNum, level._effect["rune_fire_pillar"], self.origin, (0, 0, 1), (1, 0, 0));
	}
}

/*
	Name: function_cea37b26
	Namespace: namespace_156ea490
	Checksum: 0x7BE33F15
	Offset: 0xDA8
	Size: 0xA8
	Parameters: 7
	Flags: None
	Line Number: 238
*/
function function_cea37b26(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		playFX(localClientNum, level._effect["rune_lava_geyser"], self.origin, (0, 0, 1), (1, 0, 0));
		self playsound(0, "wpn_rune_prison_lava_lump", self.origin);
		return;
	}
}

/*
	Name: function_96b27c9e
	Namespace: namespace_156ea490
	Checksum: 0x81477838
	Offset: 0xE58
	Size: 0xA0
	Parameters: 7
	Flags: None
	Line Number: 258
*/
function function_96b27c9e(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self.var_df6e291f = PlayFXOnTag(localClientNum, level._effect["rune_lava_geyser_dot"], self, "j_spine4");
		continue;
	}
	deletefx(localClientNum, self.var_df6e291f, 0);
	return;
}

/*
	Name: function_ddc32cba
	Namespace: namespace_156ea490
	Checksum: 0x5EA5118F
	Offset: 0xF00
	Size: 0xF0
	Parameters: 7
	Flags: None
	Line Number: 279
*/
function function_ddc32cba(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self endon("entityshutdown");
	if(newVal)
	{
		var_7929bbd6 = GetTime();
		n_start_time = var_7929bbd6;
		n_end_time = var_7929bbd6 + 1200;
		while(var_7929bbd6 < n_end_time)
		{
			n_shader_value = var_7929bbd6 - n_start_time / 1200;
			self MapShaderConstant(localClientNum, 0, "scriptVector0", n_shader_value, n_shader_value, 0);
			wait(0.016);
			var_7929bbd6 = GetTime();
		}
	}
}

/*
	Name: function_b0a5feb0
	Namespace: namespace_156ea490
	Checksum: 0x3CC71E73
	Offset: 0xFF8
	Size: 0x10C
	Parameters: 7
	Flags: None
	Line Number: 307
*/
function function_b0a5feb0(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		var_e36a46a9 = self GetTagOrigin("j_head");
		var_687c0597 = self GetTagAngles("j_head");
		CreateDynEntAndLaunch(localClientNum, "rune_prison_death_skull", var_e36a46a9, var_687c0597, self.origin, (RandomFloatRange(-0.15, 0.15), RandomFloatRange(-0.15, 0.15), 0.1));
	}
}

