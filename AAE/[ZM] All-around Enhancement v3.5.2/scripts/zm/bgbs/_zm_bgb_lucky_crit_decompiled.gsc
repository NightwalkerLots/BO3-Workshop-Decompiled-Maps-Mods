#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\array_shared;
#include scripts\shared\damagefeedback_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_8b3a30e2;

/*
	Name: __init__sytem__
	Namespace: namespace_8b3a30e2
	Checksum: 0x424F4353
	Offset: 0x240
	Size: 0x50
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_lucky_crit", &__init__, undefined, Array("aat", "bgb"));
}

/*
	Name: __init__
	Namespace: namespace_8b3a30e2
	Checksum: 0x424F4353
	Offset: 0x298
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	if(!(isdefined(level.aat_in_use) && level.aat_in_use) || (!(isdefined(level.bgb_in_use) && level.bgb_in_use)))
	{
		return;
	}
	bgb::register("zm_bgb_lucky_crit", "rounds", 3, &enable, &disable, undefined);
	zm::register_zombie_damage_override_callback(&function_968ab32c);
	zm::register_vehicle_damage_callback(&function_88dcee38);
}

/*
	Name: enable
	Namespace: namespace_8b3a30e2
	Checksum: 0x424F4353
	Offset: 0x360
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function enable()
{
	if(isdefined(level.var_df105f37) && !isdefined(level.var_bb821696))
	{
		level.var_bb821696 = level.var_df105f37;
		level.var_df105f37 = 100;
	}
}

/*
	Name: disable
	Namespace: namespace_8b3a30e2
	Checksum: 0x424F4353
	Offset: 0x3A8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 79
*/
function disable()
{
	if(isdefined(level.var_df105f37))
	{
		level.var_df105f37 = level.var_bb821696;
		level.var_bb821696 = undefined;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: active
	Namespace: namespace_8b3a30e2
	Checksum: 0x424F4353
	Offset: 0x3E0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 100
*/
function active()
{
	return bgb::is_enabled("zm_bgb_lucky_crit");
}

/*
	Name: function_88dcee38
	Namespace: namespace_8b3a30e2
	Checksum: 0x424F4353
	Offset: 0x408
	Size: 0x100
	Parameters: 15
	Flags: None
	Line Number: 115
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
	Namespace: namespace_8b3a30e2
	Checksum: 0x424F4353
	Offset: 0x510
	Size: 0x5B6
	Parameters: 13
	Flags: None
	Line Number: 135
*/
function function_968ab32c(var_aeac5aee, e_inflictor, e_attacker, n_damage, var_69494f71, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_901d6761, var_22b92c8f, str_surface_type)
{
	if(!isPlayer(e_attacker))
	{
		return;
	}
	if(!e_attacker bgb::is_enabled("zm_bgb_lucky_crit"))
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
		level.AAT[var_62fc2b54].cooldown_time_global_start = n_time;
		e_attacker.var_37c47784[var_62fc2b54] = n_time;
		self thread [[level.AAT[var_62fc2b54].result_func]](var_aeac5aee, e_attacker, str_means_of_death, w_weapon);
		e_attacker thread damagefeedback::update_override(level.AAT[var_62fc2b54].damage_feedback_icon, level.AAT[var_62fc2b54].damage_feedback_sound, var_d64bd201);
		return;
	}
}

