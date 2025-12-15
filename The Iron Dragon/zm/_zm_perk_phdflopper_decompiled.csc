#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_phdflopper;

/*
	Name: __init__sytem__
	Namespace: zm_perk_phdflopper
	Checksum: 0x349F6ED6
	Offset: 0x270
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_phdflopper", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_phdflopper
	Checksum: 0x8AFCC7B0
	Offset: 0x2B8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_phdflopper_perk_for_level();
		return;
	}
}

/*
	Name: __main__
	Namespace: zm_perk_phdflopper
	Checksum: 0xAD928B1
	Offset: 0x2F0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_bd3a729b();
	}
}

/*
	Name: enable_phdflopper_perk_for_level
	Namespace: zm_perk_phdflopper
	Checksum: 0xCB41B6DE
	Offset: 0x328
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function enable_phdflopper_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_phdflopper", &phdflopper_client_field_func, &function_1630f428);
	zm_perks::register_perk_effects("specialty_phdflopper", "specialty_phdflopper");
	zm_perks::register_perk_init_thread("specialty_phdflopper", &function_edd977da);
}

/*
	Name: function_edd977da
	Namespace: zm_perk_phdflopper
	Checksum: 0x4040997
	Offset: 0x3B8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function function_edd977da()
{
	level._effect["specialty_phdflopper"] = "harry/zm_perks/fx_perk_phdflopper_light";
	return;
}

/*
	Name: phdflopper_client_field_func
	Namespace: zm_perk_phdflopper
	Checksum: 0x13238841
	Offset: 0x3E0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 103
*/
function phdflopper_client_field_func()
{
	clientfield::register("clientuimodel", "hudItems.perks.phdflopper", 1, 2, "int", undefined, 0, 1);
}

/*
	Name: function_1630f428
	Namespace: zm_perk_phdflopper
	Checksum: 0x9ACF73B8
	Offset: 0x428
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 118
*/
function function_1630f428()
{
}

/*
	Name: function_bd3a729b
	Namespace: zm_perk_phdflopper
	Checksum: 0x39D6E123
	Offset: 0x438
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 132
*/
function function_bd3a729b()
{
	visionset_mgr::register_visionset_info("zm_perk_divetonuke", 1, 400, undefined, "zombie_cosmodrome_divetonuke");
	clientfield::register("missile", "phdflopper_multigrenade_trail_fx", 1, 1, "int", &function_ad2ee05f, 0, 0);
	clientfield::register("allplayers", "phdflopper_slide_explode_fx", 1, 1, "int", &function_1957c1ca, 0, 0);
}

/*
	Name: function_ad2ee05f
	Namespace: zm_perk_phdflopper
	Checksum: 0x7CCB4173
	Offset: 0x500
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 149
*/
function function_ad2ee05f(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(isdefined(var_6998917a) && var_6998917a)
	{
		self.var_ea86cc9f = PlayFXOnTag(var_3d850ea0, "harry/phd_flopper/fx_phd_flopper_trail", self, "tag_origin");
	}
	else if(isdefined(self.var_ea86cc9f))
	{
		stopfx(var_3d850ea0, self.var_ea86cc9f);
	}
	self.var_ea86cc9f = undefined;
}

/*
	Name: function_1957c1ca
	Namespace: zm_perk_phdflopper
	Checksum: 0x32229724
	Offset: 0x5C0
	Size: 0xB6
	Parameters: 7
	Flags: None
	Line Number: 172
*/
function function_1957c1ca(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(isdefined(var_6998917a) && var_6998917a)
	{
		self.var_3e4f258e = playFX(var_3d850ea0, "explosions/fx_exp_rocket_default", self.origin);
	}
	else if(isdefined(self.var_3e4f258e))
	{
		stopfx(var_3d850ea0, self.var_3e4f258e);
	}
	self.var_3e4f258e = undefined;
}

