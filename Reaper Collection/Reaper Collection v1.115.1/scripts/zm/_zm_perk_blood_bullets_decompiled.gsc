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

#namespace namespace_5154ff8d;

/*
	Name: __init__sytem__
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0x568
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("BLOOD_BULLETS", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0x5A8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function __init__()
{
	function_1a92256e();
}

/*
	Name: function_1a92256e
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0x5C8
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_bloodbullets", "customperk", 3000, &"ZM_REAP_MOD_PERK_BLOOD_BULLETS", GetWeapon("zombie_perk_bottle_blood_bullets"));
	zm_perks::register_perk_precache_func("specialty_bloodbullets", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_bloodbullets", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_bloodbullets", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_bloodbullets", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_bloodbullets", "Blood Bullets", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_bloodbullets", &"ZM_REAP_MOD_PERK_BLOOD_BULLETS_DB", 2000, "Blood Bullets", "bloodbullets");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_bloodbullets"] = 1;
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0x788
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_bloodbullets"] = spawnstruct();
	level.machine_assets["specialty_bloodbullets"].weapon = GetWeapon("zombie_perk_bottle_blood_bullets");
	level.machine_assets["specialty_bloodbullets"].off_model = "cz_zombie_vending_blood_bullets";
	level.machine_assets["specialty_bloodbullets"].on_model = "cz_zombie_vending_blood_bullets";
}

/*
	Name: function_19157aff
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0x830
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0x840
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 134
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_bloodbullets", "bloodbullets", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0x888
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 149
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_bloodbullets_jingle";
	use_trigger.script_string = "specialty_bloodbullets";
	use_trigger.script_label = "mus_perks_bloodbullets_sting";
	use_trigger.target = "Blood Bullets";
	perk_machine.script_string = "specialty_bloodbullets";
	perk_machine.targetname = "Blood Bullets";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_bloodbullets";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0x950
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 173
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_bloodbullets"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_bloodbullets"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0x9D8
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 201
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_bloodbullets"] = 0;
	self.var_b5c2c258["specialty_bloodbullets"] = undefined;
	self.var_d6aef449["specialty_bloodbullets"] = undefined;
}

/*
	Name: on_player_spawned
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0xA38
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 218
*/
function on_player_spawned()
{
	self thread function_a779cb85();
}

/*
	Name: function_a779cb85
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0xA60
	Size: 0x418
	Parameters: 0
	Flags: None
	Line Number: 233
*/
function function_a779cb85()
{
	self endon("disconnect");
	self notify("hash_dceafea4");
	self endon("hash_dceafea4");
	while(1)
	{
		if(self namespace_851dc78f::function_5f9a13b3("specialty_bloodbullets"))
		{
			weapon = self GetCurrentWeapon();
			var_ed934c5b = 1;
			if(weapon.clipSize > 0)
			{
				var_ed934c5b = weapon.clipSize / 15;
				var_ed934c5b = Int(var_ed934c5b);
				if(var_ed934c5b < 1)
				{
					var_ed934c5b = 1;
				}
			}
			if(self function_5682d28e(weapon))
			{
				if(isdefined(level.var_daebd49c))
				{
					self [[level.var_daebd49c]](weapon, var_ed934c5b);
				}
				else
				{
					stock = self GetWeaponAmmoStock(weapon);
					self SetWeaponAmmoStock(weapon, stock + var_ed934c5b);
				}
				if(self namespace_851dc78f::function_b690a849("specialty_bloodbullets") && RandomInt(100) < 40)
				{
					if(isdefined(level.var_daebd49c))
					{
						self [[level.var_daebd49c]](weapon, var_ed934c5b);
					}
					else
					{
						stock = self GetWeaponAmmoStock(weapon);
						self SetWeaponAmmoStock(weapon, stock + var_ed934c5b);
					}
				}
			}
			wait_time = var_ed934c5b;
			if(wait_time > 10)
			{
				wait_time = wait_time / 2;
			}
			wait_time = Int(wait_time);
			if(self namespace_851dc78f::function_b690a849("specialty_bloodbullets") && RandomInt(100) < 25)
			{
				primaryWeapons = self getweaponslistprimaries();
				for(i = 0; i < primaryWeapons.size; i++)
				{
					if(weapon != primaryWeapons[i] && self function_5682d28e(primaryWeapons[i]))
					{
						var_256e1f68 = primaryWeapons[i].clipSize / 10;
						var_256e1f68 = Int(var_256e1f68);
						if(var_256e1f68 < 1)
						{
							var_256e1f68 = 1;
						}
						if(isdefined(level.var_daebd49c))
						{
							self [[level.var_daebd49c]](primaryWeapons[i], var_256e1f68);
							continue;
						}
						stock = self GetWeaponAmmoStock(primaryWeapons[i]);
						self SetWeaponAmmoStock(primaryWeapons[i], stock + var_256e1f68);
					}
				}
			}
			wait(wait_time * 3);
		}
		wait(0.05);
	}
}

/*
	Name: function_5682d28e
	Namespace: namespace_5154ff8d
	Checksum: 0x424F4353
	Offset: 0xE80
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 322
*/
function function_5682d28e(gun)
{
	if(zm_weapons::is_wonder_weapon(gun))
	{
		if(gun == GetWeapon("ray_gun"))
		{
			return 1;
		}
		if(self namespace_851dc78f::function_b690a849("specialty_bloodbullets") && RandomInt(100) < 20)
		{
			return 1;
		}
		return 0;
	}
	can_use = 0;
	primaryWeapons = self getweaponslistprimaries();
	for(i = 0; i < primaryWeapons.size; i++)
	{
		if(primaryWeapons[i] == gun)
		{
			can_use = 1;
		}
	}
	if(!can_use)
	{
		return 0;
	}
	return 1;
}

