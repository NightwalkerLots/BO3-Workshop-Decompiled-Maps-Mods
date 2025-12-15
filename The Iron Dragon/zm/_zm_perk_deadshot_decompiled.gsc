#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;

#namespace zm_perk_deadshot;

/*
	Name: __init__sytem__
	Namespace: zm_perk_deadshot
	Checksum: 0x56C1B718
	Offset: 0x3A0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_deadshot", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_deadshot
	Checksum: 0xB00452F8
	Offset: 0x3E8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_deadshot_perk_for_level();
	}
}

/*
	Name: __main__
	Namespace: zm_perk_deadshot
	Checksum: 0x86CB7539
	Offset: 0x420
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_69a73be1();
	}
}

/*
	Name: enable_deadshot_perk_for_level
	Namespace: zm_perk_deadshot
	Checksum: 0x769611CE
	Offset: 0x458
	Size: 0x348
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function enable_deadshot_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_deadshot", "deadshot", 1500, &"ZOMBIE_PERK_DEADSHOT", GetWeapon("zombie_perk_bottle_deadshot"));
	zm_perks::register_perk_precache_func("specialty_deadshot", &deadshot_precache);
	zm_perks::register_perk_clientfields("specialty_deadshot", &deadshot_register_clientfield, &deadshot_set_clientfield);
	zm_perks::register_perk_machine("specialty_deadshot", &function_960b174b);
	zm_perks::register_perk_threads("specialty_deadshot", &function_5fb7e9f8, &function_77ead2ea);
	zm_perks::register_perk_host_migration_params("specialty_deadshot", "vending_deadshot", "specialty_deadshot");
	if(namespace_b8afaefc::function_fc92a42d() && (level.script == "zm_zod" || level.script == "zm_genesis" || level.script == "zm_tomb"))
	{
		zm_perks::register_perk_machine_power_override("specialty_deadshot", &function_11d866b4);
	}
	if(level.script == "zm_asylum")
	{
		namespace_b8afaefc::function_8fd06793((1152, -53, 64), VectorScale((0, 1, 0), 270), "specialty_deadshot", "p9_sur_vending_ads_off");
	}
	else if(level.script == "zm_sumpf")
	{
		namespace_b8afaefc::function_8fd06793((10640, 906, -528), VectorScale((0, -1, 0), 90), "specialty_deadshot", "p9_sur_vending_ads_off");
	}
	else if(level.script == "zm_theater")
	{
		namespace_b8afaefc::function_8fd06793((-248, -535, 80), (0, 0, 0), "specialty_deadshot", "p9_sur_vending_ads_off");
	}
	else if(level.script == "zm_cosmodrome")
	{
		namespace_b8afaefc::function_8fd06793((-679, 1296, -119), (0, 0, 0), "specialty_deadshot", "p9_sur_vending_ads_off");
	}
	else if(level.script == "zm_tomb")
	{
		namespace_b8afaefc::function_8fd06793((1868, 4088, -4353), VectorScale((0, 1, 0), 270), "specialty_deadshot", "p9_sur_vending_ads_off");
		return;
	}
}

/*
	Name: deadshot_precache
	Namespace: zm_perk_deadshot
	Checksum: 0x3E5177E5
	Offset: 0x7A8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 118
*/
function deadshot_precache()
{
	level._effect["specialty_deadshot"] = "harry/zm_perks/fx_perk_daiquiri_light";
	level.machine_assets["specialty_deadshot"] = spawnstruct();
	level.machine_assets["specialty_deadshot"].weapon = GetWeapon("zombie_perk_bottle_deadshot");
	level.machine_assets["specialty_deadshot"].off_model = "p9_sur_vending_ads_off";
	level.machine_assets["specialty_deadshot"].on_model = "p9_sur_vending_ads";
}

/*
	Name: deadshot_register_clientfield
	Namespace: zm_perk_deadshot
	Checksum: 0xDAFDAC69
	Offset: 0x870
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 137
*/
function deadshot_register_clientfield()
{
	clientfield::register("clientuimodel", "hudItems.perks.dead_shot", 1, 2, "int");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: deadshot_set_clientfield
	Namespace: zm_perk_deadshot
	Checksum: 0xEAC3A67B
	Offset: 0x8B0
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 154
*/
function deadshot_set_clientfield(n_state)
{
	if(n_state != 0 && (level namespace_b8afaefc::function_9f353429("specialty_deadshot") || self namespace_b8afaefc::function_9f353429("specialty_deadshot")))
	{
		n_state = 2;
	}
	if(n_state != 1)
	{
		self clientfield::set_player_uimodel("dead_shot_ui_glow", 0);
	}
	self clientfield::set_player_uimodel("hudItems.perks.dead_shot", n_state);
}

/*
	Name: function_960b174b
	Namespace: zm_perk_deadshot
	Checksum: 0x426C84A
	Offset: 0x968
	Size: 0x100
	Parameters: 4
	Flags: None
	Line Number: 177
*/
function function_960b174b(var_39cc5a0b, var_8bcf7b93, var_3189c3fc, e_collision)
{
	var_39cc5a0b.script_sound = "mus_perks_deadshot_jingle";
	var_39cc5a0b.script_string = "deadshot_perk";
	var_39cc5a0b.script_label = "mus_perks_deadshot_sting";
	var_39cc5a0b.target = "vending_deadshot";
	var_8bcf7b93.script_string = "deadshot_perk";
	var_8bcf7b93.targetname = "vending_deadshot";
	if(isdefined(var_3189c3fc))
	{
		var_3189c3fc.script_string = "deadshot_perk";
	}
	var_8bcf7b93 thread namespace_b8afaefc::function_2a628bd("specialty_deadshot", "i_fxt_zmb_perk_deadshot", (0.50196, 0.25098, 0));
	return;
}

/*
	Name: function_5fb7e9f8
	Namespace: zm_perk_deadshot
	Checksum: 0x807BB582
	Offset: 0xA70
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 203
*/
function function_5fb7e9f8()
{
	namespace_b8afaefc::function_ffb18d9f("specialty_deadshot", "3.0.4");
	if(level namespace_b8afaefc::function_9f353429("specialty_deadshot"))
	{
		self namespace_b8afaefc::function_7932e598("specialty_deadshot");
	}
	if(self namespace_b8afaefc::function_9f353429("specialty_deadshot"))
	{
		return;
	}
	self function_c70676d(1);
	return;
}

/*
	Name: function_77ead2ea
	Namespace: zm_perk_deadshot
	Checksum: 0x8751058A
	Offset: 0xB20
	Size: 0x38
	Parameters: 3
	Flags: None
	Line Number: 228
*/
function function_77ead2ea(b_pause, str_perk, str_result)
{
	self function_c70676d(0);
}

/*
	Name: function_11d866b4
	Namespace: zm_perk_deadshot
	Checksum: 0x70474A7B
	Offset: 0xB60
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 243
*/
function function_11d866b4()
{
	namespace_b8afaefc::function_cfe6acb0("specialty_deadshot");
}

/*
	Name: function_69a73be1
	Namespace: zm_perk_deadshot
	Checksum: 0x5271FE8E
	Offset: 0xB88
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 258
*/
function function_69a73be1()
{
	clientfield::register("clientuimodel", "dead_shot_ui_glow", 1, 1, "int");
	clientfield::register("toplayer", "deadshot_perk", 1, 1, "int");
	Array::push(level.actor_damage_callbacks, &function_75986beb, 0);
	zm_spawner::register_zombie_death_event_callback(&function_afc177ed);
	SetDvar("perk_weapSpreadMultiplier", 0.4225);
	if(isdefined(1) && 1)
	{
		namespace_b8afaefc::function_38f810ea("specialty_deadshot");
	}
}

/*
	Name: function_c70676d
	Namespace: zm_perk_deadshot
	Checksum: 0x19B5B500
	Offset: 0xC88
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 281
*/
function function_c70676d(b_enabled)
{
	if(isdefined(b_enabled) && b_enabled)
	{
		self clientfield::set_to_player("deadshot_perk", 1);
		if(isdefined(1) && 1)
		{
			for(i = 0; i < Array("specialty_fastads", "specialty_stalker", "specialty_bulletaccuracy").size; i++)
			{
				self setPerk(Array("specialty_fastads", "specialty_stalker", "specialty_bulletaccuracy")[i]);
			}
			self thread namespace_b8afaefc::function_f4c6e254(Array("specialty_fastads", "specialty_stalker", "specialty_bulletaccuracy"), "specialty_deadshot", "zm_bgb_always_done_swiftly");
			continue;
		}
	}
	self clientfield::set_to_player("deadshot_perk", 0);
	if(isdefined(1) && 1)
	{
		for(i = 0; i < Array("specialty_fastads", "specialty_stalker", "specialty_bulletaccuracy").size; i++)
		{
			self unsetPerk(Array("specialty_fastads", "specialty_stalker", "specialty_bulletaccuracy")[i]);
		}
	}
	self clientfield::set_player_uimodel("dead_shot_ui_glow", 0);
}

/*
	Name: function_d692b306
	Namespace: zm_perk_deadshot
	Checksum: 0x25B53891
	Offset: 0xE90
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 317
*/
function function_d692b306()
{
	self notify("hash_d692b306");
	self endon("hash_d692b306");
	self clientfield::set_player_uimodel("dead_shot_ui_glow", 1);
	wait(0.25);
	self clientfield::set_player_uimodel("dead_shot_ui_glow", 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_75986beb
	Namespace: zm_perk_deadshot
	Checksum: 0x3B714D6A
	Offset: 0xF00
	Size: 0x1B0
	Parameters: 12
	Flags: None
	Line Number: 338
*/
function function_75986beb(var_be883c61, e_attacker, n_damage, var_69494f71, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_901d6761, var_22b92c8f, str_surface_type)
{
	if(!zm_utility::is_headshot(w_weapon, str_hit_loc, str_means_of_death))
	{
		return n_damage;
	}
	if(!isdefined(e_attacker) || !isPlayer(e_attacker) || !e_attacker hasPerk("specialty_deadshot"))
	{
		return n_damage;
	}
	if(isdefined(1) && 1)
	{
		e_attacker thread function_d692b306();
	}
	if(!(isdefined(1) && 1))
	{
		return n_damage;
	}
	if(isdefined(self.var_f0c9e606) && self.var_f0c9e606)
	{
		return n_damage;
	}
	if(isdefined(self.var_6238f4b2))
	{
		n_damage = self [[self.var_6238f4b2]](var_be883c61, e_attacker, n_damage, var_69494f71, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_901d6761, var_22b92c8f, str_surface_type);
		return n_damage;
	}
	n_damage = Int(n_damage * 1.3);
	return n_damage;
}

/*
	Name: function_afc177ed
	Namespace: zm_perk_deadshot
	Checksum: 0x3BC2E8A8
	Offset: 0x10B8
	Size: 0xEC
	Parameters: 1
	Flags: None
	Line Number: 379
*/
function function_afc177ed(e_attacker)
{
	if(!isdefined(e_attacker) || !isPlayer(e_attacker) || !e_attacker hasPerk("specialty_deadshot") || (!(isdefined(1) && 1)))
	{
		return;
	}
	if(!zm_utility::is_headshot(self.damageWeapon, self.damagelocation, self.damageMod))
	{
		return;
	}
	if(isdefined(1) && 1)
	{
		e_attacker thread function_d692b306();
	}
	if(isdefined(self.var_f0c9e606) && self.var_f0c9e606)
	{
		return;
	}
	e_attacker zm_score::add_to_player_score(40);
}

