#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_6c5dc4e3;

/*
	Name: __init__sytem__
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0x578
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("DAMNADE", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0x5B8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function __init__()
{
	function_1a92256e();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1a92256e
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0x5D8
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_damnade", "customperk", 2500, &"ZM_REAP_MOD_PERK_DAMNADE", GetWeapon("zombie_perk_bottle_damnade"));
	zm_perks::register_perk_precache_func("specialty_damnade", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_damnade", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_damnade", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_damnade", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_damnade", "Dam-A-Nade", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_damnade", &"ZM_REAP_MOD_PERK_DAMNADE_DB", 1500, "Dam-A-Nade", "damnade");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_damnade"] = 1;
	level thread function_a79bd2dd();
	callback::on_spawned(&on_player_spawned);
	zm_spawner::register_zombie_damage_callback(&function_2b360da7);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0x7C8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_damnade"] = spawnstruct();
	level.machine_assets["specialty_damnade"].weapon = GetWeapon("zombie_perk_bottle_damnade");
	level.machine_assets["specialty_damnade"].off_model = "cz_zombie_vending_damnade";
	level.machine_assets["specialty_damnade"].on_model = "cz_zombie_vending_damnade";
}

/*
	Name: function_19157aff
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0x870
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 125
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0x880
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 139
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_damnade", "damnade", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0x8C8
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 154
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_damanade_jingle";
	use_trigger.script_string = "specialty_damnade";
	use_trigger.script_label = "mus_perks_damanade_sting";
	use_trigger.target = "Dam-A-Nade";
	perk_machine.script_string = "specialty_damnade";
	perk_machine.targetname = "Dam-A-Nade";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_damnade";
		return;
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0x990
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 179
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_damnade"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_damnade"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0xA18
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 207
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_damnade"] = 0;
	self.var_b5c2c258["specialty_damnade"] = undefined;
	self.var_d6aef449["specialty_damnade"] = undefined;
	return;
	ERROR: Bad function call
}

/*
	Name: function_a79bd2dd
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0xA78
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 226
*/
function function_a79bd2dd()
{
	while(1)
	{
		level waittill("start_of_round");
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(!players[i].is_zombie && (!(isdefined(players[i].altbody) && players[i].altbody)) && !players[i] laststand::player_is_in_laststand() && players[i] namespace_851dc78f::function_5f9a13b3("specialty_damnade"))
			{
				lethal_grenade = players[i] zm_utility::get_player_lethal_grenade();
				players[i] SetWeaponAmmoClip(lethal_grenade, 4);
				var_ea9ffa91 = players[i] zm_utility::get_player_tactical_grenade();
				if(isdefined(var_ea9ffa91) && var_ea9ffa91 != level.weaponNone)
				{
					clip = var_ea9ffa91.clipSize;
					var_a9add4d9 = players[i] GetWeaponAmmoClip(var_ea9ffa91);
					if(var_a9add4d9 < clip)
					{
						players[i] SetWeaponAmmoClip(var_ea9ffa91, var_a9add4d9 + 1);
					}
				}
			}
		}
	}
	return;
}

/*
	Name: on_player_spawned
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0xC98
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 264
*/
function on_player_spawned()
{
	self thread function_b17c277d();
	self thread function_ff35ad82();
}

/*
	Name: function_b17c277d
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0xCD8
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 280
*/
function function_b17c277d()
{
	self endon("disconnect");
	self notify("hash_b17c277d");
	self endon("hash_b17c277d");
	while(1)
	{
		while(!self function_22528c25())
		{
			wait(0.01);
		}
		while(self function_22528c25())
		{
			wait(0.01);
		}
		if(self namespace_851dc78f::function_5f9a13b3("specialty_damnade"))
		{
			lethal_grenade = self zm_utility::get_player_lethal_grenade();
			clip = lethal_grenade.clipSize;
			self SetWeaponAmmoClip(lethal_grenade, clip);
		}
		while(self function_22528c25())
		{
			wait(0.01);
		}
		wait(0.1);
	}
}

/*
	Name: function_ff35ad82
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0xE10
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 319
*/
function function_ff35ad82()
{
	self endon("disconnect");
	self notify("hash_ff35ad82");
	self endon("hash_ff35ad82");
	while(1)
	{
		while(!self function_69e7f677())
		{
			wait(0.01);
		}
		while(self function_69e7f677())
		{
			wait(0.01);
		}
		if(self namespace_851dc78f::function_5f9a13b3("specialty_damnade"))
		{
			lethal_grenade = self zm_utility::get_player_tactical_grenade();
			clip = lethal_grenade.clipSize;
			self SetWeaponAmmoClip(lethal_grenade, clip);
		}
		while(self function_69e7f677())
		{
			wait(0.01);
		}
		wait(0.1);
	}
}

/*
	Name: function_22528c25
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0xF48
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 358
*/
function function_22528c25()
{
	lethal_grenade = self zm_utility::get_player_lethal_grenade();
	clip = lethal_grenade.clipSize;
	var_a9add4d9 = self GetWeaponAmmoClip(lethal_grenade);
	if(clip == var_a9add4d9)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_69e7f677
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0xFD0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 380
*/
function function_69e7f677()
{
	lethal_grenade = self zm_utility::get_player_tactical_grenade();
	clip = lethal_grenade.clipSize;
	var_a9add4d9 = self GetWeaponAmmoClip(lethal_grenade);
	if(clip == var_a9add4d9)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_2b360da7
	Namespace: namespace_6c5dc4e3
	Checksum: 0x424F4353
	Offset: 0x1058
	Size: 0x1E6
	Parameters: 13
	Flags: None
	Line Number: 402
*/
function function_2b360da7(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(isdefined(str_mod) && isdefined(e_player) && isdefined(w_weapon) && isdefined(n_amount))
	{
		if(str_mod == "MOD_GRENADE" || str_mod == "MOD_GRENADE_SPLASH" || str_mod == "MOD_PROJECTILE" || str_mod == "MOD_PROJECTILE_SPLASH" || str_mod == "MOD_EXPLOSIVE")
		{
			if(isdefined(e_player) && isPlayer(e_player) && e_player namespace_851dc78f::function_5f9a13b3("specialty_damnade"))
			{
				self DoDamage(Int(n_amount), e_player.origin, e_player, e_player, 0, str_mod, 0, w_weapon);
				if(e_player namespace_851dc78f::function_b690a849("specialty_damnade"))
				{
					self DoDamage(Int(n_amount), e_player.origin, e_player, e_player, 0, str_mod, 0, w_weapon);
				}
			}
		}
	}
	return 0;
}

