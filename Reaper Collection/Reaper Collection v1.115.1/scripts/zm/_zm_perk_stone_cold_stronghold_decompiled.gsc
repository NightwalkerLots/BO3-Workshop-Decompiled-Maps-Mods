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
#include scripts\zm\_zm_bgb;
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

#namespace namespace_7c87917e;

/*
	Name: __init__sytem__
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0x6B8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 46
*/
function autoexec __init__sytem__()
{
	system::register("stone_cold_stronghold", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0x6F8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function __init__()
{
	function_1a92256e();
	return;
	ERROR: Bad function call
}

/*
	Name: function_1a92256e
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0x718
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_stronghold", "customperk", 3000, &"ZM_REAP_MOD_PERK_STONE_COLD_STRONGHOLD", GetWeapon("zombie_perk_bottle_stone_cold_stronghold"));
	zm_perks::register_perk_precache_func("specialty_stronghold", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_stronghold", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_stronghold", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_stronghold", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_stronghold", "Stone Cold Stronghold", "jugger_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_stronghold", &"ZM_REAP_MOD_PERK_STONE_COLD_STRONGHOLD_DB", 2000, "Stone Cold Stronghold", "stronghold");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_stronghold"] = 1;
	if(!isdefined(level.perk_damage_override))
	{
		level.perk_damage_override = [];
	}
	Array::add(level.perk_damage_override, &function_c0d05fed, 0);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0x8F8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 109
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_stronghold"] = spawnstruct();
	level.machine_assets["specialty_stronghold"].weapon = GetWeapon("zombie_perk_bottle_stone_cold_stronghold");
	level.machine_assets["specialty_stronghold"].off_model = "cz_zombie_vending_stronghold";
	level.machine_assets["specialty_stronghold"].on_model = "cz_zombie_vending_stronghold_on";
}

/*
	Name: function_19157aff
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0x9A0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 127
*/
function function_19157aff()
{
	clientfield::register("toplayer", "stone_cold_ring", 1, 1, "int");
	return;
	~;
}

/*
	Name: function_99c1452c
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0x9E0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 144
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_stronghold", "stronghold", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0xA28
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 159
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_stronghold";
	use_trigger.script_label = "";
	use_trigger.target = "Stone Cold Stronghold";
	perk_machine.script_string = "specialty_stronghold";
	perk_machine.targetname = "Stone Cold Stronghold";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_stronghold";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0xAF0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 183
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_stronghold"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_stronghold"] = 1;
	self thread function_16ab572d();
}

/*
	Name: function_b4722825
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0xB88
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 212
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_stronghold"] = 0;
	self.var_b5c2c258["specialty_stronghold"] = undefined;
	self.var_d6aef449["specialty_stronghold"] = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: on_player_spawned
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0xBE8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 231
*/
function on_player_spawned()
{
	self thread function_cdceac4a();
}

/*
	Name: function_cdceac4a
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0xC10
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 246
*/
function function_cdceac4a()
{
	self notify("hash_cdceac4a");
	self endon("hash_cdceac4a");
	while(1)
	{
		while(self getvelocity()[0] != 0 && self getvelocity()[1] != 0 && self getvelocity()[2] != 0)
		{
			wait(0.1);
		}
		self notify("hash_7597eda");
		while(self getvelocity()[0] == 0 && self getvelocity()[1] == 0 && self getvelocity()[2] == 0)
		{
			wait(0.1);
		}
		self notify("hash_84c30ef7");
		wait(0.1);
	}
}

/*
	Name: function_16ab572d
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0xD40
	Size: 0x430
	Parameters: 0
	Flags: None
	Line Number: 276
*/
function function_16ab572d()
{
	self endon("disconnect");
	self notify("hash_b5129bab");
	self endon("hash_b5129bab");
	while(self namespace_851dc78f::function_5f9a13b3("specialty_stronghold"))
	{
		sT = 0;
		max = 200;
		var_afc00af1 = 0;
		while(self namespace_851dc78f::function_5f9a13b3("specialty_stronghold") && self getvelocity() == (0, 0, 0) && !var_afc00af1 && self.health == self.maxhealth)
		{
			sT = sT + 1;
			if(sT > 20)
			{
				spawn_point = self.origin;
				self clientfield::set_to_player("stone_cold_ring", 1);
				if(!isdefined(self.var_dcdb6c11))
				{
					self.var_dcdb6c11 = 5;
					self thread namespace_4b6e359c::function_75aa16e4("specialty_stronghold", "stronghold", "MeterBlue", Int(self.var_dcdb6c11 / max * 100));
				}
				while(DistanceSquared(spawn_point, self.origin) < 7225 && self.var_dcdb6c11 > 4)
				{
					wait(0.7);
					if(self.health == self.maxhealth)
					{
						if(self.var_dcdb6c11 < max)
						{
							self.var_dcdb6c11 = self.var_dcdb6c11 + 5;
						}
						if(self.var_dcdb6c11 < max && self namespace_851dc78f::function_b690a849("specialty_stronghold"))
						{
							self.var_dcdb6c11 = self.var_dcdb6c11 + 5;
						}
						if(self.var_dcdb6c11 > max)
						{
							self.var_dcdb6c11 = max;
						}
					}
					if(self.var_dcdb6c11 < 0)
					{
						self.var_dcdb6c11 = 0;
					}
					self thread namespace_4b6e359c::function_75aa16e4("specialty_stronghold", "stronghold", "MeterBlue", Int(self.var_dcdb6c11 / max * 100));
				}
				if(self.var_dcdb6c11 < 1)
				{
					var_afc00af1 = 1;
				}
			}
			wait(0.1);
		}
		self clientfield::set_to_player("stone_cold_ring", 0);
		if(isdefined(self.var_dcdb6c11))
		{
			if(self namespace_851dc78f::function_b690a849("specialty_stronghold"))
			{
				self.var_dcdb6c11 = self.var_dcdb6c11 - 4;
				self thread namespace_4b6e359c::function_75aa16e4("specialty_stronghold", "stronghold", "MeterBlue", Int(self.var_dcdb6c11 / max * 100));
			}
			else
			{
				self.var_dcdb6c11 = 0;
			}
			if(self.var_dcdb6c11 < 1)
			{
				self.var_dcdb6c11 = undefined;
				self playsound("stone_cold_armour_broken");
				self thread namespace_4b6e359c::function_75aa16e4("specialty_stronghold", "stronghold", "MeterBlue", 0);
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_c0d05fed
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0x1178
	Size: 0x28A
	Parameters: 10
	Flags: None
	Line Number: 362
*/
function function_c0d05fed(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!self namespace_851dc78f::function_5f9a13b3("specialty_stronghold") || !isdefined(self.var_dcdb6c11))
	{
		return undefined;
	}
	can_use = 1;
	if(self namespace_851dc78f::function_5f9a13b3("specialty_slider") || self namespace_851dc78f::function_5f9a13b3("specialty_da_phd_slider") || self bgb::is_enabled("zm_bgb_danger_closest"))
	{
		if(sMeansOfDeath == "MOD_ELECTOCUTED" || sMeansOfDeath == "MOD_EXPLOSIVE" || sMeansOfDeath == "MOD_EXPLOSIVE_SPLASH" || sMeansOfDeath == "MOD_FALLING" || sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_PROJECTILE" || sMeansOfDeath == "MOD_PROJECTILE_SPLASH" || sMeansOfDeath == "MOD_GRENADE_SPLASH" || sMeansOfDeath == "MOD_SUICIDE" || sMeansOfDeath == "MOD_IMPACT")
		{
			can_use = 0;
		}
	}
	if(can_use)
	{
		dam = Int(iDamage / 2);
		self.var_dcdb6c11 = self.var_dcdb6c11 - iDamage;
		dam = dam - self.var_dcdb6c11;
		if(dam < 0)
		{
			dam = 0;
		}
		self thread namespace_4b6e359c::function_75aa16e4("specialty_stronghold", "stronghold", "MeterBlue", Int(self.var_dcdb6c11 / 200 * 100));
		self playsound("stone_cold_armour_hit");
		return 0;
	}
	return undefined;
}

