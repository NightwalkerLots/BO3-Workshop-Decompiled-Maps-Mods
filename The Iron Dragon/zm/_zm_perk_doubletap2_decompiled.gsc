#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace zm_perk_doubletap2;

/*
	Name: __init__sytem__
	Namespace: zm_perk_doubletap2
	Checksum: 0xE9AB6146
	Offset: 0x2D0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_doubletap2", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_doubletap2
	Checksum: 0xBE4AF816
	Offset: 0x318
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_158e5e94();
		return;
	}
}

/*
	Name: __main__
	Namespace: zm_perk_doubletap2
	Checksum: 0xF2EA8F1C
	Offset: 0x350
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_6b89f9a6();
	}
}

/*
	Name: function_158e5e94
	Namespace: zm_perk_doubletap2
	Checksum: 0x37B7EA04
	Offset: 0x388
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function function_158e5e94()
{
	zm_perks::register_perk_basic_info("specialty_doubletap2", "doubletap", 2000, &"ZOMBIE_PERK_DOUBLETAP", GetWeapon("zombie_perk_bottle_doubletap"));
	zm_perks::register_perk_precache_func("specialty_doubletap2", &function_f3111762);
	zm_perks::register_perk_clientfields("specialty_doubletap2", &function_5f5a9a40, &function_a095a539);
	zm_perks::register_perk_machine("specialty_doubletap2", &function_354235);
	zm_perks::register_perk_threads("specialty_doubletap2", &function_8fc0ca6d, &function_55c0244f);
	zm_perks::register_perk_host_migration_params("specialty_doubletap2", "vending_doubletap", "specialty_doubletap2");
	if(namespace_b8afaefc::function_fc92a42d() && level.script == "zm_tomb")
	{
		zm_perks::register_perk_machine_power_override("specialty_doubletap2", &function_78a42523);
	}
	if(level.script == "zm_cosmodrome")
	{
		namespace_b8afaefc::function_8fd06793((-234, 1242, -485), (0, 0, 0), "specialty_doubletap2", "p7_zm_vending_doubletap2");
	}
	else if(level.script == "zm_tomb")
	{
		namespace_b8afaefc::function_8fd06793((-167, 3680, -291), (0, 0, 0), "specialty_doubletap2", "p7_zm_vending_doubletap2");
	}
}

/*
	Name: function_f3111762
	Namespace: zm_perk_doubletap2
	Checksum: 0xFDEF4CF9
	Offset: 0x5A8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 103
*/
function function_f3111762()
{
	level._effect["specialty_doubletap2"] = "harry/zm_perks/fx_perk_doubletap_light";
	level.machine_assets["specialty_doubletap2"] = spawnstruct();
	level.machine_assets["specialty_doubletap2"].weapon = GetWeapon("zombie_perk_bottle_doubletap");
	level.machine_assets["specialty_doubletap2"].off_model = "p7_zm_vending_doubletap2";
	level.machine_assets["specialty_doubletap2"].on_model = "p7_zm_vending_doubletap2";
}

/*
	Name: function_5f5a9a40
	Namespace: zm_perk_doubletap2
	Checksum: 0x891A130C
	Offset: 0x670
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 122
*/
function function_5f5a9a40()
{
	clientfield::register("clientuimodel", "hudItems.perks.doubletap2", 1, 2, "int");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a095a539
	Namespace: zm_perk_doubletap2
	Checksum: 0x4CEAD695
	Offset: 0x6B0
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 139
*/
function function_a095a539(n_state)
{
	if(n_state != 0 && (level namespace_b8afaefc::function_9f353429("specialty_doubletap2") || self namespace_b8afaefc::function_9f353429("specialty_doubletap2")))
	{
		n_state = 2;
	}
	self clientfield::set_player_uimodel("hudItems.perks.doubletap2", n_state);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_354235
	Namespace: zm_perk_doubletap2
	Checksum: 0x281625D0
	Offset: 0x740
	Size: 0x100
	Parameters: 4
	Flags: None
	Line Number: 160
*/
function function_354235(var_39cc5a0b, var_8bcf7b93, var_3189c3fc, e_collision)
{
	var_39cc5a0b.script_sound = "mus_perks_doubletap_jingle";
	var_39cc5a0b.script_string = "tap_perk";
	var_39cc5a0b.script_label = "mus_perks_doubletap_sting";
	var_39cc5a0b.target = "vending_doubletap";
	var_8bcf7b93.script_string = "tap_perk";
	var_8bcf7b93.targetname = "vending_doubletap";
	if(isdefined(var_3189c3fc))
	{
		var_3189c3fc.script_string = "tap_perk";
	}
	var_8bcf7b93 thread namespace_b8afaefc::function_2a628bd("specialty_doubletap2", "i_fxt_zmb_dbl_tap", (1, 0.980392, 0.098039));
}

/*
	Name: function_8fc0ca6d
	Namespace: zm_perk_doubletap2
	Checksum: 0xFD6AFFBD
	Offset: 0x848
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function function_8fc0ca6d()
{
	namespace_b8afaefc::function_ffb18d9f("specialty_doubletap2", "3.0.4");
	if(level namespace_b8afaefc::function_9f353429("specialty_doubletap2"))
	{
		self namespace_b8afaefc::function_7932e598("specialty_doubletap2");
	}
	if(self namespace_b8afaefc::function_9f353429("specialty_doubletap2"))
	{
		return;
	}
}

/*
	Name: function_55c0244f
	Namespace: zm_perk_doubletap2
	Checksum: 0xA79D716
	Offset: 0x8D8
	Size: 0x20
	Parameters: 3
	Flags: None
	Line Number: 208
*/
function function_55c0244f(b_pause, str_perk, str_result)
{
}

/*
	Name: function_78a42523
	Namespace: zm_perk_doubletap2
	Checksum: 0xD5A96264
	Offset: 0x900
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 222
*/
function function_78a42523()
{
	namespace_b8afaefc::function_cfe6acb0("specialty_doubletap2");
}

/*
	Name: function_6b89f9a6
	Namespace: zm_perk_doubletap2
	Checksum: 0x857F9614
	Offset: 0x928
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 237
*/
function function_6b89f9a6()
{
	Array::push(level.actor_damage_callbacks, &function_e9501baa, 0);
	if(isdefined(1) && 1)
	{
		namespace_b8afaefc::function_38f810ea("specialty_doubletap2");
	}
}

/*
	Name: function_e9501baa
	Namespace: zm_perk_doubletap2
	Checksum: 0x63E130A4
	Offset: 0x988
	Size: 0x470
	Parameters: 12
	Flags: None
	Line Number: 256
*/
function function_e9501baa(var_be883c61, e_attacker, n_damage, var_69494f71, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_901d6761, var_22b92c8f, str_surface_type)
{
	if(!isdefined(str_means_of_death) || !IsString(str_means_of_death) || !isdefined(w_weapon) || !IsWeapon(w_weapon))
	{
		return n_damage;
	}
	if(!isdefined(e_attacker) || !isPlayer(e_attacker) || !e_attacker hasPerk("specialty_doubletap2"))
	{
		return n_damage;
	}
	if(isdefined(1) && 1 && function_c2f91beb(w_weapon.name))
	{
		return n_damage;
	}
	if(str_means_of_death == "MOD_PROJECTILE")
	{
		if(!(isdefined(1) && 1) || (isdefined(self.var_12befb5) && self.var_12befb5))
		{
			return n_damage;
		}
		if(isdefined(self.var_399519be))
		{
			n_damage = self [[self.var_399519be]](var_be883c61, e_attacker, n_damage, var_69494f71, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_901d6761, var_22b92c8f, str_surface_type);
			return n_damage;
		}
		n_damage = Int(n_damage * 1.5);
	}
	else if(str_means_of_death == "MOD_IMPACT")
	{
		if(!(isdefined(1) && 1) || (isdefined(self.var_d824d0c7) && self.var_d824d0c7))
		{
			return n_damage;
		}
		if(isdefined(self.var_6c8de15d))
		{
			n_damage = self [[self.var_6c8de15d]](var_be883c61, e_attacker, n_damage, var_69494f71, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_901d6761, var_22b92c8f, str_surface_type);
			return n_damage;
		}
		n_damage = Int(n_damage * 1.75);
	}
	else if(str_means_of_death == "MOD_GRENADE_SPLASH" || str_means_of_death == "MOD_PROJECTILE_SPLASH")
	{
		if(!(isdefined(0) && 0) || (isdefined(self.var_de3d0cc6) && self.var_de3d0cc6))
		{
			return n_damage;
		}
		if(isdefined(self.var_fc1c46f2))
		{
			n_damage = self [[self.var_fc1c46f2]](var_be883c61, e_attacker, n_damage, var_69494f71, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_901d6761, var_22b92c8f, str_surface_type);
			return n_damage;
		}
		n_damage = Int(n_damage * 1.25);
	}
	else if(str_means_of_death == "MOD_MELEE")
	{
		if(!(isdefined(0) && 0) || (isdefined(self.var_b463e68b) && self.var_b463e68b))
		{
			return n_damage;
		}
		if(isdefined(self.var_ffa29839))
		{
			n_damage = self [[self.var_ffa29839]](var_be883c61, e_attacker, n_damage, var_69494f71, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_901d6761, var_22b92c8f, str_surface_type);
			return n_damage;
		}
		n_damage = Int(n_damage * 2);
		continue;
	}
	return n_damage;
	if(isdefined(1) && 1 && n_damage > 10000)
	{
		n_damage = 10000;
	}
	return n_damage;
}

/*
	Name: function_a59f18f0
	Namespace: zm_perk_doubletap2
	Checksum: 0x5ADEC39B
	Offset: 0xE00
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 341
*/
function function_a59f18f0(str_weapon_name)
{
	if(!isdefined(level.var_c207019e))
	{
		level.var_c207019e = [];
	}
	if(!IsInArray(level.var_c207019e, str_weapon_name))
	{
		if(!isdefined(level.var_c207019e))
		{
			level.var_c207019e = [];
		}
		else if(!IsArray(level.var_c207019e))
		{
			level.var_c207019e = Array(level.var_c207019e);
		}
	}
	level.var_c207019e[level.var_c207019e.size] = str_weapon_name;
	return;
}

/*
	Name: function_c2f91beb
	Namespace: zm_perk_doubletap2
	Checksum: 0x9873E3A9
	Offset: 0xEC0
	Size: 0x76
	Parameters: 1
	Flags: None
	Line Number: 372
*/
function function_c2f91beb(str_weapon_name)
{
	if(!isdefined(level.var_c207019e) || !IsArray(level.var_c207019e) || level.var_c207019e.size < 1)
	{
		return 0;
	}
	if(IsInArray(level.var_c207019e, str_weapon_name))
	{
		return 1;
	}
	return 0;
}

