#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\damagefeedback_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_weapons;
#include scripts\zm\gametypes\_globallogic_score;

#namespace namespace_e0544f6b;

/*
	Name: __init__sytem__
	Namespace: namespace_e0544f6b
	Checksum: 0x8925C92E
	Offset: 0x408
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_elemental_pop", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_e0544f6b
	Checksum: 0x6B0A6FC2
	Offset: 0x450
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_4088d59a();
	}
}

/*
	Name: __main__
	Namespace: namespace_e0544f6b
	Checksum: 0xE1F9317E
	Offset: 0x488
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_aea2ce74();
	}
}

/*
	Name: function_4088d59a
	Namespace: namespace_e0544f6b
	Checksum: 0xFB820FD0
	Offset: 0x4C0
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function function_4088d59a()
{
	zm_perks::register_perk_basic_info("specialty_combat_efficiency", "elemental_pop", 6000, &"HB21_ZM_PERKS_ELEMENTAL_POP", GetWeapon("zombie_perk_bottle_elemental_pop"));
	zm_perks::register_perk_precache_func("specialty_combat_efficiency", &function_d6302918);
	zm_perks::register_perk_clientfields("specialty_combat_efficiency", &function_6a8920ba, &function_db29f23);
	zm_perks::register_perk_machine("specialty_combat_efficiency", &function_62f7eb5b);
	zm_perks::register_perk_threads("specialty_combat_efficiency", &function_9c0f6c97, &function_35f5decd);
	zm_perks::register_perk_host_migration_params("specialty_combat_efficiency", "vending_elemental_pop", "specialty_combat_efficiency");
	if(namespace_b8afaefc::function_fc92a42d() && (level.script == "zm_zod" || level.script == "zm_genesis"))
	{
		zm_perks::register_perk_machine_power_override("specialty_combat_efficiency", &function_7910a78d);
	}
}

/*
	Name: function_d6302918
	Namespace: namespace_e0544f6b
	Checksum: 0xE33E01F1
	Offset: 0x660
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 99
*/
function function_d6302918()
{
	level._effect["specialty_combat_efficiency"] = "harry/zm_perks/fx_perk_elementalpop_light";
	level.machine_assets["specialty_combat_efficiency"] = spawnstruct();
	level.machine_assets["specialty_combat_efficiency"].weapon = GetWeapon("zombie_perk_bottle_elemental_pop");
	level.machine_assets["specialty_combat_efficiency"].off_model = "p9_sur_machine_elemental_pop_off";
	level.machine_assets["specialty_combat_efficiency"].on_model = "p9_sur_machine_elemental_pop";
}

/*
	Name: function_6a8920ba
	Namespace: namespace_e0544f6b
	Checksum: 0x8338EA1B
	Offset: 0x728
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 118
*/
function function_6a8920ba()
{
	clientfield::register("clientuimodel", "hudItems.perks.elemental_pop", 1, 2, "int");
}

/*
	Name: function_db29f23
	Namespace: namespace_e0544f6b
	Checksum: 0x30865D9E
	Offset: 0x768
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 133
*/
function function_db29f23(n_state)
{
	if(n_state != 0 && (level namespace_b8afaefc::function_9f353429("specialty_combat_efficiency") || self namespace_b8afaefc::function_9f353429("specialty_combat_efficiency")))
	{
		n_state = 2;
	}
	self clientfield::set_player_uimodel("hudItems.perks.elemental_pop", n_state);
}

/*
	Name: function_62f7eb5b
	Namespace: namespace_e0544f6b
	Checksum: 0x98DC37E8
	Offset: 0x7F8
	Size: 0x100
	Parameters: 4
	Flags: None
	Line Number: 152
*/
function function_62f7eb5b(var_39cc5a0b, var_8bcf7b93, var_3189c3fc, e_collision)
{
	var_39cc5a0b.script_sound = "mus_perks_elementalpop_jingle";
	var_39cc5a0b.script_string = "elemental_pop_perk";
	var_39cc5a0b.script_label = "mus_perks_elementalpop_sting";
	var_39cc5a0b.target = "vending_elemental_pop";
	var_8bcf7b93.script_string = "elemental_pop_perk";
	var_8bcf7b93.targetname = "vending_elemental_pop";
	if(isdefined(var_3189c3fc))
	{
		var_3189c3fc.script_string = "elemental_pop_perk";
	}
	var_8bcf7b93 thread namespace_b8afaefc::function_2a628bd("specialty_combat_efficiency", "i_fxt_zmb_perk_elementalpop", (0, 0.949019, 0.92549));
}

/*
	Name: function_9c0f6c97
	Namespace: namespace_e0544f6b
	Checksum: 0xB9468B17
	Offset: 0x900
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 177
*/
function function_9c0f6c97()
{
	namespace_b8afaefc::function_ffb18d9f("specialty_combat_efficiency", "3.0.4");
	if(level namespace_b8afaefc::function_9f353429("specialty_combat_efficiency"))
	{
		self namespace_b8afaefc::function_7932e598("specialty_combat_efficiency");
	}
	if(self namespace_b8afaefc::function_9f353429("specialty_combat_efficiency"))
	{
		return;
	}
	self function_4ffe6dc6(1);
}

/*
	Name: function_35f5decd
	Namespace: namespace_e0544f6b
	Checksum: 0x4508A4AE
	Offset: 0x9B0
	Size: 0x38
	Parameters: 3
	Flags: None
	Line Number: 201
*/
function function_35f5decd(b_pause, str_perk, str_result)
{
	self function_4ffe6dc6(0);
}

/*
	Name: function_7910a78d
	Namespace: namespace_e0544f6b
	Checksum: 0x2ED40A33
	Offset: 0x9F0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 216
*/
function function_7910a78d()
{
	namespace_b8afaefc::function_cfe6acb0("specialty_combat_efficiency");
}

/*
	Name: function_aea2ce74
	Namespace: namespace_e0544f6b
	Checksum: 0x2F6A357D
	Offset: 0xA18
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 231
*/
function function_aea2ce74()
{
	clientfield::register("clientuimodel", "elemental_pop_ui_glow", 1, 1, "int");
	if(isdefined(0) && 0)
	{
		namespace_b8afaefc::function_38f810ea("specialty_combat_efficiency");
	}
	zm::register_zombie_damage_override_callback(&function_968ab32c);
	zm::register_vehicle_damage_callback(&function_88dcee38);
	callback::on_connect(&function_e84ded19);
}

/*
	Name: function_4ffe6dc6
	Namespace: namespace_e0544f6b
	Checksum: 0x30A43BC6
	Offset: 0xAE0
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 253
*/
function function_4ffe6dc6(b_enabled)
{
	if(isdefined(b_enabled) && b_enabled)
	{
		continue;
	}
	self clientfield::set_player_uimodel("elemental_pop_ui_glow", 0);
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_88dcee38
	Namespace: namespace_e0544f6b
	Checksum: 0xA347DA3A
	Offset: 0xB30
	Size: 0x100
	Parameters: 15
	Flags: None
	Line Number: 275
*/
function function_88dcee38(e_inflictor, e_attacker, n_damage, n_flags, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, v_damage_origin, var_bb4cbbbb, b_damage_from_underneath, n_model_index, str_part_name, var_eca96ec1)
{
	var_e7dc9bd4 = self.health - n_damage <= 0;
	if(isdefined(level.aat_in_use) && level.aat_in_use)
	{
		self thread function_968ab32c(var_e7dc9bd4, e_inflictor, e_attacker, n_damage, n_flags, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_bb4cbbbb, b_damage_from_underneath, var_eca96ec1);
	}
	return n_damage;
}

/*
	Name: function_968ab32c
	Namespace: namespace_e0544f6b
	Checksum: 0xA0693F0C
	Offset: 0xC38
	Size: 0x618
	Parameters: 13
	Flags: None
	Line Number: 295
*/
function function_968ab32c(var_aeac5aee, e_inflictor, e_attacker, n_damage, var_69494f71, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_901d6761, var_22b92c8f, str_surface_type)
{
	if(!isPlayer(e_attacker))
	{
		return;
	}
	if(!e_attacker hasPerk("specialty_combat_efficiency"))
	{
		return;
	}
	if(str_means_of_death != "MOD_PISTOL_BULLET" && str_means_of_death != "MOD_RIFLE_BULLET" && str_means_of_death != "MOD_GRENADE" && str_means_of_death != "MOD_PROJECTILE" && str_means_of_death != "MOD_EXPLOSIVE" && str_means_of_death != "MOD_IMPACT")
	{
		return;
	}
	w_weapon = zm_weapons::get_nonalternate_weapon(w_weapon);
	var_5f980f26 = e_attacker.AAT[w_weapon];
	var_62fc2b54 = Array::random(getArrayKeys(level.AAT));
	if(!isdefined(var_62fc2b54) || var_62fc2b54 == "none" || (isdefined(var_5f980f26) && var_5f980f26 == var_62fc2b54))
	{
		return;
	}
	if(var_aeac5aee && !level.AAT[var_62fc2b54].occurs_on_death)
	{
		return;
	}
	if(!isdefined(self.archetype))
	{
		return;
	}
	if(isdefined(level.AAT[var_62fc2b54].immune_trigger[self.archetype]) && level.AAT[var_62fc2b54].immune_trigger[self.archetype])
	{
		return;
	}
	n_time = GetTime() / 1000;
	if(n_time <= self.aat_cooldown_start[var_62fc2b54] + level.AAT[var_62fc2b54].cooldown_time_entity)
	{
		return;
	}
	if(n_time <= e_attacker.aat_cooldown_start[var_62fc2b54] + level.AAT[var_62fc2b54].cooldown_time_attacker)
	{
		return;
	}
	if(n_time <= level.AAT[var_62fc2b54].cooldown_time_global_start + level.AAT[var_62fc2b54].cooldown_time_global)
	{
		return;
	}
	if(isdefined(level.AAT[var_62fc2b54].validation_func))
	{
		if(!self [[level.AAT[var_62fc2b54].validation_func]]())
		{
			return;
		}
	}
	b_success = 0;
	var_d64bd201 = undefined;
	var_d3a8a61c = level.AAT[var_62fc2b54].percentage;
	if(var_d3a8a61c >= RandomFloat(1))
	{
		b_success = 1;
	}
	if(!b_success)
	{
		a_keys = Array::randomize(getArrayKeys(level.aat_reroll));
		foreach(str_key in a_keys)
		{
			if(e_attacker [[level.aat_reroll[str_key].active_func]]())
			{
				for(i = 0; i < level.aat_reroll[str_key].count; i++)
				{
					if(var_d3a8a61c >= RandomFloat(1))
					{
						b_success = 1;
						var_d64bd201 = level.aat_reroll[str_key].damage_feedback_icon;
						break;
					}
				}
			}
		}
	}
	else if(b_success)
	{
		n_random = RandomInt(5);
		if(n_random != 0)
		{
			return;
		}
		level.AAT[var_62fc2b54].cooldown_time_global_start = n_time;
		e_attacker.var_37c47784[var_62fc2b54] = n_time;
		self thread [[level.AAT[var_62fc2b54].result_func]](var_aeac5aee, e_attacker, str_means_of_death, w_weapon);
		e_attacker thread damagefeedback::update_override(level.AAT[var_62fc2b54].damage_feedback_icon, level.AAT[var_62fc2b54].damage_feedback_sound, var_d64bd201);
		if(isdefined(1) && 1)
		{
			e_attacker thread function_4c039c3();
			return;
		}
	}
}

/*
	Name: function_4c039c3
	Namespace: namespace_e0544f6b
	Checksum: 0x6FAEC3A6
	Offset: 0x1258
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 403
*/
function function_4c039c3()
{
	self notify("hash_4c039c3");
	self endon("hash_4c039c3");
	self clientfield::set_player_uimodel("elemental_pop_ui_glow", 1);
	wait(0.25);
	self clientfield::set_player_uimodel("elemental_pop_ui_glow", 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e84ded19
	Namespace: namespace_e0544f6b
	Checksum: 0xF64E49C8
	Offset: 0x12C8
	Size: 0x2C
	Parameters: 0
	Flags: None
	Line Number: 424
*/
function function_e84ded19()
{
	globallogic_score::initPersStat("specialty_combat_efficiency" + "_drank", 0);
}

