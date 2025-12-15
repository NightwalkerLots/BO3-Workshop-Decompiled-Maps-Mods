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

#namespace namespace_a18b404;

/*
	Name: __init__sytem__
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0x610
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 46
*/
function autoexec __init__sytem__()
{
	system::register("bandolier_bandit", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0x650
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function __init__()
{
	function_1a92256e();
}

/*
	Name: function_1a92256e
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0x670
	Size: 0x210
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_bandolier", "customperk", 3000, &"ZM_REAP_MOD_PERK_BANDOLIER_BANDIT", GetWeapon("zombie_perk_bottle_bandolier_bandit"));
	zm_perks::register_perk_precache_func("specialty_bandolier", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_bandolier", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_bandolier", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_bandolier", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_bandolier", "Bandolier Bandit", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_bandolier", &"ZM_REAP_MOD_PERK_BANDOLIER_BANDIT_DB", 1500, "Bandolier Bandit", "bandolier", &function_2749a03d);
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_bandolier"] = 1;
	callback::on_spawned(&on_player_spawned);
	level.var_9c4c2110 = &function_42452c7e;
	level.var_daebd49c = &function_b78e69c;
	level.var_c510219a = &function_65ac2433;
	return;
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0x888
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_bandolier"] = spawnstruct();
	level.machine_assets["specialty_bandolier"].weapon = GetWeapon("zombie_perk_bottle_bandolier_bandit");
	level.machine_assets["specialty_bandolier"].off_model = "cz_zombie_vending_bandolier";
	level.machine_assets["specialty_bandolier"].on_model = "cz_zombie_vending_bandolier";
}

/*
	Name: on_player_spawned
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0x930
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 125
*/
function on_player_spawned()
{
	self thread function_a18b404();
}

/*
	Name: function_19157aff
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0x958
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 140
*/
function function_19157aff()
{
	return;
}

/*
	Name: function_99c1452c
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0x968
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 155
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_bandolier", "bandolier", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0x9B0
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 170
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "zombie_perk_bottle_bandolier_bandit";
	use_trigger.script_label = "";
	use_trigger.target = "Bandolier Bandit";
	perk_machine.script_string = "zombie_perk_bottle_bandolier_bandit";
	perk_machine.targetname = "Bandolier Bandit";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "zombie_perk_bottle_bandolier_bandit";
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0xA78
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 196
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_bandolier"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_bandolier"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0xB00
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 224
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_bandolier"] = 0;
	self.var_b5c2c258["specialty_bandolier"] = undefined;
	self.var_d6aef449["specialty_bandolier"] = undefined;
	self SetControllerUIModelValue("hudItems.ReapAmmo.ExtraStockAmmo", 0);
	return;
}

/*
	Name: function_42452c7e
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0xB80
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 243
*/
function function_42452c7e(gun)
{
	if(self namespace_851dc78f::function_5f9a13b3("specialty_bandolier"))
	{
		clip = gun.clipSize;
		switch(gun.name)
		{
			case "lmg_cqb":
			{
				return clip;
				break;
			}
			default
			{
				if(clip >= 50)
				{
					return clip;
				}
				else if(clip == 1)
				{
					return clip * 4;
				}
				else if(clip == 2)
				{
					return clip * 3;
				}
				else
				{
					return clip * 2;
					break;
				}
			}
		}
		return 60;
	}
	return 0;
}

/*
	Name: function_b78e69c
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0xC78
	Size: 0x2D0
	Parameters: 2
	Flags: None
	Line Number: 291
*/
function function_b78e69c(weapon, ammo)
{
	if(!isdefined(self.var_4cb5323d))
	{
		self.var_4cb5323d = [];
	}
	if(weapon.maxAmmo == 0)
	{
		return;
	}
	stock = self GetWeaponAmmoStock(weapon);
	if(ammo + stock <= weapon.maxAmmo)
	{
		self SetWeaponAmmoStock(weapon, stock + ammo);
	}
	else
	{
		var_ad0ca325 = stock + ammo - weapon.maxAmmo;
		if(self namespace_851dc78f::function_5f9a13b3("specialty_bandolier"))
		{
			if(!isdefined(self.var_4cb5323d[weapon.name]))
			{
				self.var_4cb5323d[weapon.name] = Int(function_42452c7e(weapon));
			}
			var_5ac57a5 = self.var_4cb5323d[weapon.name];
			if(self.var_4cb5323d[weapon.name] < Int(function_42452c7e(weapon)))
			{
				if(var_ad0ca325 > Int(function_42452c7e(weapon)))
				{
					var_ad0ca325 = Int(function_42452c7e(weapon)) - self.var_4cb5323d[weapon.name];
				}
				self.var_4cb5323d[weapon.name] = self.var_4cb5323d[weapon.name] + var_ad0ca325;
				self SetControllerUIModelValue("hudItems.ReapAmmo.ExtraStockAmmo", Int(self.var_4cb5323d[weapon.name]));
			}
		}
		self SetWeaponAmmoStock(weapon, weapon.maxAmmo);
		return;
	}
}

/*
	Name: function_65ac2433
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0xF50
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 341
*/
function function_65ac2433(weapon)
{
	if(!isdefined(self.var_4cb5323d))
	{
		self.var_4cb5323d = [];
	}
	stock = self GetWeaponAmmoStock(weapon);
	if(isdefined(self.var_4cb5323d[weapon.name]))
	{
		stock = stock + self.var_4cb5323d[weapon.name];
	}
	return stock;
}

/*
	Name: function_a18b404
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0xFE8
	Size: 0x3E8
	Parameters: 0
	Flags: None
	Line Number: 365
*/
function function_a18b404()
{
	self endon("disconnect");
	self notify("hash_e939af8c");
	self endon("hash_e939af8c");
	self.var_4cb5323d = [];
	self thread function_20ee62e7();
	self thread function_b1e54bfa();
	self thread function_3da8ac10();
	self thread function_e897b7b7();
	self.check_override_wallbuy_purchase = &function_3e3b40ea;
	weapon = undefined;
	wait(1);
	while(1)
	{
		self SetControllerUIModelValue("hudItems.ReapAmmo.ExtraStockAmmo", 0);
		while(self namespace_851dc78f::function_5f9a13b3("specialty_bandolier"))
		{
			self util::waittill_any_timeout(1, "update_bandolier_bandit", "reload", "reload_start", "weapon_change", "weapon_change_complete");
			if(!isdefined(self.check_override_wallbuy_purchase) || self.check_override_wallbuy_purchase != &function_3e3b40ea)
			{
				self.check_override_wallbuy_purchase = &function_3e3b40ea;
			}
			force_update = 0;
			if(weapon != self GetCurrentWeapon())
			{
				force_update = 1;
			}
			weapon = self GetCurrentWeapon();
			if(!isdefined(self.var_4cb5323d[weapon.name]))
			{
				self.var_4cb5323d[weapon.name] = Int(function_42452c7e(weapon));
				force_update = 1;
			}
			stock = self GetWeaponAmmoStock(weapon);
			if(stock < weapon.maxAmmo && Int(self.var_4cb5323d[weapon.name]) > 0)
			{
				ammount = weapon.maxAmmo - stock;
				if(Int(self.var_4cb5323d[weapon.name]) < ammount)
				{
					ammount = Int(self.var_4cb5323d[weapon.name]);
				}
				self.var_4cb5323d[weapon.name] = self.var_4cb5323d[weapon.name] - ammount;
				self SetWeaponAmmoStock(weapon, stock + ammount);
				force_update = 1;
			}
			if(force_update)
			{
				self SetControllerUIModelValue("hudItems.ReapAmmo.ExtraStockAmmo", Int(self.var_4cb5323d[weapon.name]));
			}
		}
		wait(1);
	}
}

/*
	Name: function_20ee62e7
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0x13D8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 430
*/
function function_20ee62e7()
{
	self endon("disconnect");
	self notify("hash_20ee62e7");
	self endon("hash_20ee62e7");
	while(1)
	{
		self waittill("weapon_give", weapon);
		if(isdefined(self.var_4cb5323d[weapon.name]))
		{
			self.var_4cb5323d[weapon.name] = undefined;
		}
		self notify("hash_fe460328");
	}
	return;
}

/*
	Name: function_b1e54bfa
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0x1470
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 457
*/
function function_b1e54bfa()
{
	self endon("disconnect");
	self notify("hash_b1e54bfa");
	self endon("hash_b1e54bfa");
	while(1)
	{
		self waittill("hash_6aea631f", weapon);
		if(isdefined(self.var_4cb5323d[weapon.name]))
		{
			self.var_4cb5323d[weapon.name] = undefined;
		}
		self notify("hash_fe460328");
	}
}

/*
	Name: function_3da8ac10
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0x1508
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 483
*/
function function_3da8ac10()
{
	self endon("disconnect");
	self notify("hash_3da8ac10");
	self endon("hash_3da8ac10");
	while(1)
	{
		self waittill("zmb_max_ammo");
		self.var_4cb5323d = [];
		self notify("hash_fe460328");
	}
	return;
}

/*
	Name: function_e897b7b7
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0x1570
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 507
*/
function function_e897b7b7()
{
	self endon("disconnect");
	self notify("hash_e897b7b7");
	self endon("hash_e897b7b7");
	while(1)
	{
		self waittill("weapon_take", weapon);
		if(isdefined(self.var_4cb5323d[weapon.name]))
		{
			self.var_4cb5323d[weapon.name] = undefined;
		}
		self notify("hash_fe460328");
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2749a03d
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0x1608
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 535
*/
function function_2749a03d()
{
	self endon("disconnect");
	self notify("hash_2749a03d");
	self endon("hash_2749a03d");
	while(1)
	{
		while(self namespace_851dc78f::function_5f9a13b3("specialty_bandolier"))
		{
			primaryWeapons = self getweaponslistprimaries();
			for(i = 0; i < primaryWeapons.size; i++)
			{
				clip = primaryWeapons[i].clipSize;
				var_5e212200 = self GetWeaponAmmoClip(primaryWeapons[i]);
				stock = self GetWeaponAmmoStock(primaryWeapons[i]);
				if(var_5e212200 < clip && stock > 0 && self namespace_851dc78f::function_b690a849("specialty_bandolier") && primaryWeapons[i] != self GetCurrentWeapon())
				{
					self SetWeaponAmmoStock(primaryWeapons[i], stock - 1);
					self SetWeaponAmmoClip(primaryWeapons[i], var_5e212200 + 1);
				}
			}
			wait(2);
		}
		wait(0.1);
	}
	return;
}

/*
	Name: function_3e3b40ea
	Namespace: namespace_a18b404
	Checksum: 0x424F4353
	Offset: 0x17E0
	Size: 0x3F4
	Parameters: 2
	Flags: None
	Line Number: 573
*/
function function_3e3b40ea(weapon, wallbuy)
{
	player_has_weapon = self zm_weapons::has_weapon_or_upgrade(wallbuy.weapon);
	if(zm_utility::is_lethal_grenade(weapon) && self hasPerk("specialty_widowswine"))
	{
		wallbuy zm_utility::play_sound_on_ent("no_purchase");
		if(isdefined(level.custom_generic_deny_vo_func))
		{
			self [[level.custom_generic_deny_vo_func]]();
		}
		else
		{
			self zm_audio::create_and_play_dialog("general", "sigh");
		}
		return 1;
	}
	if(player_has_weapon)
	{
		weapon = wallbuy.weapon;
		if(isdefined(wallbuy.stub.hacked) && wallbuy.stub.hacked)
		{
			if(!self zm_weapons::has_upgrade(weapon))
			{
				ammo_cost = 4500;
			}
			else
			{
				ammo_cost = zm_weapons::get_ammo_cost(weapon);
			}
		}
		else if(self zm_weapons::has_upgrade(weapon))
		{
			ammo_cost = 4500;
		}
		else
		{
			ammo_cost = zm_weapons::get_ammo_cost(weapon);
		}
		if(self bgb::is_enabled("zm_bgb_secret_shopper") && !zm_weapons::is_wonder_weapon(weapon))
		{
			ammo_cost = self zm_weapons::get_ammo_cost_for_weapon(weapon);
		}
		if(self zm_score::can_player_purchase(ammo_cost))
		{
			stockMax = weapon.maxAmmo;
			clipCount = self GetWeaponAmmoClip(weapon);
			dw_clipcount = self GetWeaponAmmoClip(weapon.dualWieldWeapon);
			currStock = self getammocount(weapon);
			if(currStock - clipCount + dw_clipcount >= stockMax)
			{
				if(self.var_4cb5323d[weapon.name] < function_42452c7e(weapon))
				{
					self giveMaxAmmo(weapon);
					alt_weap = weapon.altweapon;
					if(level.weaponNone != alt_weap)
					{
						self giveMaxAmmo(alt_weap);
					}
					self notify("hash_6aea631f", weapon);
					self zm_score::minus_to_player_score(ammo_cost);
					self notify("hash_fe460328");
					zm_utility::play_sound_at_pos("purchase", self.origin);
					return 1;
				}
			}
			self notify("hash_6aea631f", weapon);
		}
	}
	return 0;
}

