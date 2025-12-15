#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_electric_cherry;

/*
	Name: __init__sytem__
	Namespace: zm_perk_electric_cherry
	Checksum: 0xD2F319A3
	Offset: 0x3B8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_electric_cherry", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_electric_cherry
	Checksum: 0x48BB0F54
	Offset: 0x400
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_factory" || script == "zm_zod" || script == "zm_prototype" || script == "zm_asylum" || script == "zm_sumpf" || script == "zm_theater" || script == "zm_cosmodrome" || script == "zm_temple" || script == "zm_moon")
	{
		return;
	}
	if(isdefined(1) && 1)
	{
		enable_electric_cherry_perk_for_level();
	}
}

/*
	Name: __main__
	Namespace: zm_perk_electric_cherry
	Checksum: 0xD6695703
	Offset: 0x4F8
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function __main__()
{
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_factory" || script == "zm_zod" || script == "zm_prototype" || script == "zm_asylum" || script == "zm_sumpf" || script == "zm_theater" || script == "zm_cosmodrome" || script == "zm_temple" || script == "zm_moon")
	{
		return;
	}
	if(isdefined(1) && 1)
	{
		function_feaaa4ac();
	}
}

/*
	Name: enable_electric_cherry_perk_for_level
	Namespace: zm_perk_electric_cherry
	Checksum: 0xAE3109A0
	Offset: 0x5F0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function enable_electric_cherry_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_electriccherry", &electric_cherry_client_field_func, &electric_cherry_code_callback_func);
	zm_perks::register_perk_effects("specialty_electriccherry", "specialty_electriccherry");
	zm_perks::register_perk_init_thread("specialty_electriccherry", &function_8fdc802d);
}

/*
	Name: function_8fdc802d
	Namespace: zm_perk_electric_cherry
	Checksum: 0x1CB00743
	Offset: 0x680
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 95
*/
function function_8fdc802d()
{
	level._effect["specialty_electriccherry"] = "harry/zm_perks/fx_perk_electric_cherry_light";
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: electric_cherry_client_field_func
	Namespace: zm_perk_electric_cherry
	Checksum: 0x924540E9
	Offset: 0x6A8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 112
*/
function electric_cherry_client_field_func()
{
	clientfield::register("clientuimodel", "hudItems.perks.electric_cherry", 1, 2, "int", undefined, 0, 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: electric_cherry_code_callback_func
	Namespace: zm_perk_electric_cherry
	Checksum: 0x9ACF73B8
	Offset: 0x6F0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 129
*/
function electric_cherry_code_callback_func()
{
	return;
	++;
}

/*
	Name: function_feaaa4ac
	Namespace: zm_perk_electric_cherry
	Checksum: 0x4085773A
	Offset: 0x700
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 145
*/
function function_feaaa4ac()
{
	clientfield::register("allplayers", "electric_cherry_reload_fx", 1, 1, "int", &electric_cherry_reload_attack_fx, 0, 0);
	clientfield::register("actor", "tesla_death_fx", 1, 1, "int", &tesla_death_fx_callback, 0, 0);
	clientfield::register("vehicle", "tesla_death_fx_veh", 10000, 1, "int", &function_26eb1270, 0, 0);
	clientfield::register("actor", "tesla_shock_eyes_fx", 1, 1, "int", &tesla_shock_eyes_fx_callback, 0, 0);
	clientfield::register("vehicle", "tesla_shock_eyes_fx_veh", 10000, 1, "int", &function_b385b793, 0, 0);
	level._effect["electric_cherry_explode"] = "dlc1/castle/fx_castle_electric_cherry_down";
	level._effect["tesla_death_cherry"] = "zombie/fx_tesla_shock_zmb";
	level._effect["tesla_shock_eyes_cherry"] = "zombie/fx_tesla_shock_eyes_zmb";
	level._effect["electric_cherry_trail"] = "dlc1/castle/fx_castle_electric_cherry_trail";
	level._effect["tesla_shock_cherry"] = "zombie/fx_bmode_shock_os_zod_zmb";
}

/*
	Name: electric_cherry_reload_attack_fx
	Namespace: zm_perk_electric_cherry
	Checksum: 0xB725AFB7
	Offset: 0x900
	Size: 0xE8
	Parameters: 7
	Flags: None
	Line Number: 169
*/
function electric_cherry_reload_attack_fx(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(isdefined(self.var_11001800))
	{
		stopfx(var_3d850ea0, self.var_11001800);
	}
	if(isdefined(var_6998917a) && var_6998917a)
	{
		self.var_11001800 = PlayFXOnTag(var_3d850ea0, level._effect["electric_cherry_explode"], self, "tag_origin");
	}
	else if(isdefined(self.var_11001800))
	{
		stopfx(var_3d850ea0, self.var_11001800);
	}
	self.var_11001800 = undefined;
}

/*
	Name: tesla_death_fx_callback
	Namespace: zm_perk_electric_cherry
	Checksum: 0xC4470BA2
	Offset: 0x9F0
	Size: 0x138
	Parameters: 7
	Flags: None
	Line Number: 196
*/
function tesla_death_fx_callback(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(isdefined(var_6998917a) && var_6998917a)
	{
		str_tag = "j_spineupper";
		if(isdefined(self.str_tag_tesla_death_fx))
		{
			str_tag = self.str_tag_tesla_death_fx;
		}
		else if(isdefined(self.isdog) && self.isdog)
		{
			str_tag = "j_spine1";
		}
		self.var_4b317d61 = PlayFXOnTag(var_3d850ea0, level._effect["tesla_death_cherry"], self, str_tag);
		SetFXIgnorePause(var_3d850ea0, self.var_4b317d61, 1);
	}
	else if(isdefined(self.var_4b317d61))
	{
		deletefx(var_3d850ea0, self.var_4b317d61, 1);
		self.var_4b317d61 = undefined;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_26eb1270
	Namespace: zm_perk_electric_cherry
	Checksum: 0x641B48D6
	Offset: 0xB30
	Size: 0x110
	Parameters: 7
	Flags: None
	Line Number: 231
*/
function function_26eb1270(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(isdefined(var_6998917a) && var_6998917a)
	{
		str_tag = "j_spineupper";
		if(isdefined(self.str_tag_tesla_death_fx))
		{
			str_tag = self.str_tag_tesla_death_fx;
		}
		self.var_4b317d61 = PlayFXOnTag(var_3d850ea0, level._effect["tesla_shock_cherry"], self, str_tag);
		SetFXIgnorePause(var_3d850ea0, self.var_4b317d61, 1);
	}
	else if(isdefined(self.var_4b317d61))
	{
		deletefx(var_3d850ea0, self.var_4b317d61, 1);
		self.var_4b317d61 = undefined;
	}
}

/*
	Name: tesla_shock_eyes_fx_callback
	Namespace: zm_perk_electric_cherry
	Checksum: 0x6EBA5785
	Offset: 0xC48
	Size: 0x1C8
	Parameters: 7
	Flags: None
	Line Number: 260
*/
function tesla_shock_eyes_fx_callback(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(isdefined(var_6998917a) && var_6998917a)
	{
		str_tag = "j_spineupper";
		if(isdefined(self.str_tag_tesla_shock_eyes_fx))
		{
			str_tag = self.str_tag_tesla_shock_eyes_fx;
		}
		else if(isdefined(self.isdog) && self.isdog)
		{
			str_tag = "j_spine1";
		}
		self.var_a1d6e74e = PlayFXOnTag(var_3d850ea0, level._effect["tesla_shock_eyes_cherry"], self, "j_eyeball_le");
		SetFXIgnorePause(var_3d850ea0, self.var_a1d6e74e, 1);
		self.var_b6812ee1 = PlayFXOnTag(var_3d850ea0, level._effect["tesla_death_cherry"], self, str_tag);
		SetFXIgnorePause(var_3d850ea0, self.var_b6812ee1, 1);
	}
	else if(isdefined(self.var_a1d6e74e))
	{
		deletefx(var_3d850ea0, self.var_a1d6e74e, 1);
		self.var_a1d6e74e = undefined;
	}
	if(isdefined(self.var_b6812ee1))
	{
		deletefx(var_3d850ea0, self.var_b6812ee1, 1);
		self.var_b6812ee1 = undefined;
	}
}

/*
	Name: function_b385b793
	Namespace: zm_perk_electric_cherry
	Checksum: 0x890EAEF7
	Offset: 0xE18
	Size: 0x19E
	Parameters: 7
	Flags: None
	Line Number: 300
*/
function function_b385b793(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(isdefined(var_6998917a) && var_6998917a)
	{
		str_tag = "j_spineupper";
		if(isdefined(self.str_tag_tesla_shock_eyes_fx))
		{
			str_tag = self.str_tag_tesla_shock_eyes_fx;
		}
		self.var_a1d6e74e = PlayFXOnTag(var_3d850ea0, level._effect["electric_cherry_trail"], self, str_tag);
		SetFXIgnorePause(var_3d850ea0, self.var_a1d6e74e, 1);
		self.var_b6812ee1 = PlayFXOnTag(var_3d850ea0, level._effect["tesla_shock_cherry"], self, str_tag);
		SetFXIgnorePause(var_3d850ea0, self.var_b6812ee1, 1);
	}
	else if(isdefined(self.var_a1d6e74e))
	{
		deletefx(var_3d850ea0, self.var_a1d6e74e, 1);
		self.var_a1d6e74e = undefined;
	}
	if(isdefined(self.var_b6812ee1))
	{
		deletefx(var_3d850ea0, self.var_b6812ee1, 1);
		self.var_b6812ee1 = undefined;
	}
}

