#include scripts\codescripts\struct;
#include scripts\lilrobot\_inspectable_weapons;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\gameobjects_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_clientdvar;
#include scripts\zm\_satchel_charge;
#include scripts\zm\_zm;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_hero_weapon;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\tfoption;

#namespace namespace_ab57545b;

/*
	Name: init
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0xD30
	Size: 0x320
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function init()
{
	if(GetDvarString("aae_lite") == "")
	{
		zm_utility::register_lethal_grenade_for_level("incendiary_grenade2");
		zm_utility::register_lethal_grenade_for_level("nukebomb");
	}
	zm_utility::register_tactical_grenade_for_level("octobomb");
	zm_utility::register_tactical_grenade_for_level("octobomb_upgraded");
	if(GetDvarString("aae_lite") == "")
	{
		zm_utility::register_tactical_grenade_for_level("stunfrag");
		zm_equipment::register("lefthand_shield", &"ELMG_SHIELD_HINT", &"ELMG_SHIELD_HINT_HOWTO", "HINT_NOICON", "riotshield");
		zm_equipment::register_for_level("lefthand_shield");
		zm_equipment::Include("lefthand_shield");
		zm_equipment::set_ammo_driven("lefthand_shield", 0, 0);
	}
	function_d78a37b1();
	function_e7701e5d();
	zm::register_vehicle_damage_callback(&function_690918f3);
	if(GetDvarString("tfoption_dpap") == "1" && namespace_78d24adc::function_98902a25())
	{
		level.var_5cc17d02 = [];
		level.var_5cc17d02[2] = 0.2;
		level.var_5cc17d02[3] = 0.4;
		level.var_5cc17d02[4] = 0.6;
		level.var_5cc17d02[5] = 0.8;
	}
	if(!(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver") && GetDvarInt("tfoption_perkplus")))
	{
		zm::register_zombie_damage_override_callback(&function_b0f983d8);
		callback::on_connect(&function_5d4350ed);
	}
	thread function_90b4bc88();
	callback::on_connect(&function_2b1cfcdc);
}

/*
	Name: function_d78a37b1
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x1058
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 89
*/
function function_d78a37b1()
{
	if(!isdefined(level.player_damage_callbacks))
	{
		zm::register_player_damage_callback(&function_754ee0e6);
		return;
	}
	else
	{
		var_b54d4365 = level.player_damage_callbacks;
		level.player_damage_callbacks = [];
		zm::register_player_damage_callback(&function_754ee0e6);
		for(i = 0; i < var_b54d4365.size; i++)
		{
			zm::register_player_damage_callback(var_b54d4365[i]);
		}
	}
}

/*
	Name: function_e7701e5d
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x1128
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 118
*/
function function_e7701e5d()
{
	if(!isdefined(level.actor_damage_callbacks))
	{
		zm::register_actor_damage_callback(&function_65401d93);
		return;
	}
	else
	{
		var_4435794f = level.actor_damage_callbacks;
		level.actor_damage_callbacks = [];
		zm::register_actor_damage_callback(&function_65401d93);
		for(i = 0; i < var_4435794f.size; i++)
		{
			zm::register_actor_damage_callback(var_4435794f[i]);
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_54546488
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x11F8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 149
*/
function function_54546488()
{
	if(!isdefined(level._custom_perks))
	{
		return 0;
	}
	if(isdefined(level.perk_damage_override) && level.perk_damage_override.size == 1)
	{
		foreach(perk in getArrayKeys(level._custom_perks))
		{
			if(perk == "specialty_widowswine")
			{
				return 1;
			}
		}
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: widows_wine_damage_callback
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x12D0
	Size: 0x138
	Parameters: 10
	Flags: None
	Line Number: 179
*/
function widows_wine_damage_callback(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(sWeapon == level.w_widows_wine_grenade)
	{
		return 0;
	}
	if(self GetWeaponAmmoClip(self.current_lethal_grenade) > 0 && !self bgb::is_enabled("zm_bgb_burned_out") && self hasPerk("specialty_widowswine"))
	{
		if(sMeansOfDeath == "MOD_MELEE" && isai(eAttacker) || (sMeansOfDeath == "MOD_EXPLOSIVE" && isVehicle(eAttacker)))
		{
			self thread widows_wine_contact_explosion();
			return iDamage;
			return;
		}
	}
}

/*
	Name: widows_wine_contact_explosion
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x1410
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 206
*/
function widows_wine_contact_explosion()
{
	self MagicGrenadeType(level.w_widows_wine_grenade, self.origin + VectorScale((0, 0, 1), 48), (0, 0, 0), 0);
	self SetWeaponAmmoClip(self.current_lethal_grenade, self GetWeaponAmmoClip(self.current_lethal_grenade) - 1);
	self clientfield::increment_to_player("widows_wine_1p_contact_explosion", 1);
	return;
	ERROR: Bad function call
}

/*
	Name: function_90b4bc88
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x14B8
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function function_90b4bc88()
{
	level flag::wait_till("all_players_connected");
	if(function_54546488())
	{
		level.perk_damage_override = [];
		level.perk_damage_override[0] = &widows_wine_damage_callback;
	}
	AddDirectHitWeapon("micromissile_launcher");
	AddDirectHitWeapon("micromissile_launcher_upgraded");
	AddDirectHitWeapon("launcher_lockonly");
	AddDirectHitWeapon("launcher_lockonly_upgraded");
	AddDirectHitWeapon("spike_launcher");
	AddDirectHitWeapon("spike_launcher_upgraded");
	AddDirectHitWeapon("k7_raygun_mark3");
	AddDirectHitWeapon("k7_raygun_mark3_upgraded");
	AddDirectHitWeapon("ray_gun_upgraded_cw");
	AddDirectHitWeapon("ray_gun_upgraded_lh");
	AddDirectHitWeapon("ray_gun_upgraded");
	AddDirectHitWeapon("ray_gun");
	AddDirectHitWeapon("raygun_mark2_upgraded");
	AddDirectHitWeapon("raygun_mark2");
	AddDirectHitWeapon("raygun_mark3_upgraded");
	AddDirectHitWeapon("raygun_mark3");
	AddDirectHitWeapon("launcher_multi_upgraded");
	AddDirectHitWeapon("launcher_multi");
}

/*
	Name: AddDirectHitWeapon
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x16C8
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 263
*/
function AddDirectHitWeapon(weaponName)
{
	MapName = GetDvarString("mapname");
	if(MapName == "zm_zod" || MapName == "zm_genesis")
	{
		if(!isdefined(level.dhWeapons))
		{
			level.dhWeapons = [];
		}
		foreach(weapon in level.dhWeapons)
		{
			if(weapon == weaponName)
			{
				return;
			}
		}
		level.dhWeapons[level.dhWeapons.size] = weaponName;
	}
}

/*
	Name: function_5d4350ed
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x17D0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 293
*/
function function_5d4350ed()
{
	self endon("disconnect");
	self endon("death");
	self.var_9b145994 = 0;
	self.var_6293cda9 = 0;
}

/*
	Name: function_b0f983d8
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x1808
	Size: 0x1A8
	Parameters: 13
	Flags: None
	Line Number: 311
*/
function function_b0f983d8(death, inflictor, player, damage, flags, mod, weapon, vPoint, vDir, HIT_LOCATION, psOffsetTime, boneIndex, surfaceType)
{
	if(isdefined(death) && death && !player IsTestClient())
	{
		if(isPlayer(player) && player hasPerk("specialty_deadshot") && isdefined(player.perks_active) && player.perks_active.size > 3 && isdefined(HIT_LOCATION) && (HIT_LOCATION == "head" || HIT_LOCATION == "helmet" || HIT_LOCATION == "neck"))
		{
			player.var_9b145994++;
			if(player.var_9b145994 == 5)
			{
				player function_90e9e701(1);
			}
		}
		else
		{
			player.var_9b145994 = 0;
			player function_90e9e701(0);
		}
	}
}

/*
	Name: function_90e9e701
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x19B8
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 341
*/
function function_90e9e701(bool)
{
	if(self.var_6293cda9 != bool)
	{
		self.var_6293cda9 = bool;
		self util::setClientSysState("deadshot_keyline", "d," + bool, self);
		if(bool)
		{
			self SetSpreadOverride(1);
		}
		else if(self function_7863ae56())
		{
			self thread function_171e07d5();
		}
		else
		{
			self ReSetSpreadOverride();
		}
	}
}

/*
	Name: function_7863ae56
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x1A80
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 372
*/
function function_7863ae56()
{
	weapon = self GetCurrentWeapon();
	return weapon.type == "projectile" && weapon.weapClass == "rifle";
}

/*
	Name: function_171e07d5
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x1AE8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 388
*/
function function_171e07d5()
{
	self notify("hash_171e07d5");
	self endon("hash_171e07d5");
	self endon("disconnect");
	self endon("death");
	while(self function_7863ae56())
	{
		wait(0.05);
	}
	if(!self.var_6293cda9)
	{
		self ReSetSpreadOverride();
	}
}

/*
	Name: function_2b1cfcdc
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x1B70
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 414
*/
function function_2b1cfcdc()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self waittill("missile_fire", projectile, weapon);
		if(weapon.name == "special_crossbow_dw_upgraded" || weapon.name == "special_crossbowlh_upgraded")
		{
			if(isdefined(projectile))
			{
				projectile thread wait_for_bolt_death(self, weapon);
			}
		}
	}
}

/*
	Name: wait_for_bolt_death
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x1C18
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 441
*/
function wait_for_bolt_death(player, weapon)
{
	player endon("disconnect");
	player endon("death");
	self waittill("death");
	radiusdamage(self.origin, 200, 300, 10, player, "MOD_PROJECTILE_SPLASH", weapon);
}

/*
	Name: function_754ee0e6
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x1C90
	Size: 0x4E0
	Parameters: 11
	Flags: None
	Line Number: 459
*/
function function_754ee0e6(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex)
{
	if(!isdefined(self.var_1da7a07d))
	{
		return 0;
	}
	if(isPlayer(eAttacker) && self != eAttacker)
	{
		return -1;
	}
	if(self zm_laststand::is_reviving_any() && self hasPerk("specialty_quickrevive"))
	{
		return 0;
	}
	if(self zm_utility::is_multiple_drinking() || isdefined(self.var_2152e56a) || isdefined(self.var_45446b50))
	{
		return 0;
	}
	var_e228cee = self GetCurrentWeapon().name;
	if(var_e228cee == "zombie_bgb_use" || var_e228cee == "zombie_bgb_grab" || IsSubStr(var_e228cee, "bottle") || IsSubStr(var_e228cee, "perk") || IsSubStr(var_e228cee, "knuckle_crack"))
	{
		return 0;
	}
	if(self IsTestClient())
	{
		return 1;
	}
	if(isVehicle(eAttacker))
	{
		return -1;
	}
	if(IsActor(eAttacker) && (!isdefined(self.archetype) || self.archetype !== "zombie"))
	{
		return -1;
	}
	if(isdefined(weapon))
	{
		if(self == eAttacker)
		{
			if(IsSubStr(weapon.name, "raygun_mark2") || weapon.displayName == "DLC3_WEAPON_RAYGUN_MARK3" || weapon.displayName == "DLC3_WEAPON_RAYGUN_MARK3_UPGRADED")
			{
				return 0;
			}
		}
	}
	if(isdefined(level.var_508fe397))
	{
		if(self hasPerk("specialty_flakjacket"))
		{
			if(sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_GRENADE_SPLASH" || sMeansOfDeath == "MOD_PROJECTILE" || sMeansOfDeath == "MOD_PROJECTILE_SPLASH" || sMeansOfDeath == "MOD_EXPLOSIVE" || sMeansOfDeath == "MOD_EXPLOSIVE_SPLASH" || sMeansOfDeath == "MOD_FALLING")
			{
				return 0;
			}
			if(isdefined(weapon))
			{
				if(weapon.weapClass === "grenade")
				{
					return 0;
				}
			}
		}
	}
	else if(self hasPerk("specialty_widowswine") && !GetDvarInt("tfoption_perkplus") && isdefined(level.perk_damage_override) && level.perk_damage_override.size)
	{
		if(sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_GRENADE_SPLASH" || sMeansOfDeath == "MOD_PROJECTILE" || sMeansOfDeath == "MOD_PROJECTILE_SPLASH" || sMeansOfDeath == "MOD_EXPLOSIVE" || sMeansOfDeath == "MOD_EXPLOSIVE_SPLASH")
		{
			return 0;
		}
	}
	if(sMeansOfDeath == "MOD_FALLING" && self.health > 0)
	{
		if(self hasPerk("specialty_staminup") && !isdefined(level._custom_perks["specialty_movefaster"]) && self hasPerk("specialty_movefaster") && !GetDvarInt("tfoption_perkplus") && iDamage >= self.health)
		{
			return self.health - 1;
		}
	}
	return -1;
}

/*
	Name: function_65401d93
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x2178
	Size: 0xB8
	Parameters: 12
	Flags: None
	Line Number: 548
*/
function function_65401d93(inflictor, attacker, iDamage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	result = function_a04f330b(inflictor, attacker, iDamage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType);
	return result;
}

/*
	Name: function_690918f3
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x2238
	Size: 0x108
	Parameters: 15
	Flags: None
	Line Number: 564
*/
function function_690918f3(inflictor, attacker, iDamage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, boneIndex, partName, surfaceType)
{
	if(isdefined(self.dragon_recall_death) && self.dragon_recall_death)
	{
		return self.health + 6;
	}
	newDamage = function_a04f330b(inflictor, attacker, iDamage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType);
	if(-1 != newDamage)
	{
		return newDamage;
	}
	return iDamage;
}

/*
	Name: function_79615af2
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x2348
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 588
*/
function function_79615af2()
{
	if(!(isdefined(self) && isalive(self)))
	{
		return 0;
	}
	if(isdefined(self.ignore_nuke) && self.ignore_nuke)
	{
		return 0;
	}
	if(isdefined(self.marked_for_death) && self.marked_for_death)
	{
		return 0;
	}
	if(zm_utility::is_magic_bullet_shield_enabled(self))
	{
		return 0;
	}
	return self.health;
}

/*
	Name: function_d008ad61
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x23D8
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 619
*/
function function_d008ad61(zombie)
{
	if(isdefined(self.archetype))
	{
		if(self.archetype == "zombie" || self.archetype == "zombie_dog" || self.archetype == "zombie_quad" || self.archetype == "apothicon_fury" || self.archetype == "keeper" || self.archetype == "spider" || self.archetype == "parasite")
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_ea32788
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x2490
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 641
*/
function function_ea32788(weapon)
{
	if(!weapon.isBulletWeapon)
	{
		return 0;
	}
	weapon = weapon.rootweapon;
	if(weapon.shotCount > 3)
	{
		return 1;
	}
	if(weapon.weapClass == "spread" || weapon.weapClass == "pistol spread")
	{
		return 1;
	}
	if(weapon.isSniperWeapon)
	{
		return 1;
	}
	if(IsSubStr(weapon.name, "sniper"))
	{
		return 1;
	}
	if(IsSubStr(weapon.name, "shotgun"))
	{
		return 1;
	}
	if(isdefined(level.wallbuy_autofill_weapons))
	{
		if(isdefined(level.wallbuy_autofill_weapons["sniper"]) && isdefined(level.wallbuy_autofill_weapons["sniper"][weapon]))
		{
			return 1;
		}
		if(isdefined(level.wallbuy_autofill_weapons["shotgun"]) && isdefined(level.wallbuy_autofill_weapons["shotgun"][weapon]))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_a04f330b
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x2620
	Size: 0x978
	Parameters: 12
	Flags: None
	Line Number: 692
*/
function function_a04f330b(inflictor, attacker, iDamage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	self.var_308a583c = -1;
	if(self == attacker)
	{
		return -1;
	}
	if(iDamage > self.health)
	{
		self.var_308a583c = iDamage;
		return -1;
	}
	is_bot = attacker IsTestClient();
	var_5a986ff0 = function_d008ad61(self);
	if(is_bot && var_5a986ff0)
	{
		if(Distance(attacker.origin, self.origin) < 35)
		{
			return self.health;
		}
	}
	if(GetDvarString("aaeoption_headshot") == "1")
	{
		if(!(meansOfDeath === "MOD_HEAD_SHOT" || sHitLoc === "head" || sHitLoc === "helmet" || sHitLoc === "neck"))
		{
			self.var_308a583c = 0;
			return 0;
		}
	}
	weapon_damage = 0;
	if(isdefined(weapon))
	{
		if(self.archetype === "zombie" && self function_79615af2() && function_ea32788(weapon) && (!(isdefined(self.missingLegs) && self.missingLegs)) && self.health > 0 && iDamage < self.health)
		{
			if(self zombie_utility::zombie_should_gib(iDamage, attacker, meansOfDeath))
			{
				if(sHitLoc == "right_leg_lower" || sHitLoc == "right_leg_upper")
				{
					GibServerUtils::GibRightLeg(self);
					self.missingLegs = 1;
					self AllowedStances("crouch");
					self setPhysParams(15, 0, 24);
					self AllowPitchAngle(1);
					self SetPitchOrient();
					if(isdefined(self.crawl_anim_override))
					{
						self [[self.crawl_anim_override]]();
					}
				}
				else if(sHitLoc == "left_leg_lower" || sHitLoc == "left_leg_upper")
				{
					GibServerUtils::GibLeftLeg(self);
					self.missingLegs = 1;
					self AllowedStances("crouch");
					self setPhysParams(15, 0, 24);
					self AllowPitchAngle(1);
					self SetPitchOrient();
					if(isdefined(self.crawl_anim_override))
					{
						self [[self.crawl_anim_override]]();
					}
				}
			}
		}
		weapon_damage = self function_6d128dda(inflictor, attacker, iDamage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType);
		if(weapon_damage == 0)
		{
			self.var_308a583c = 0;
			return 0;
		}
		if(weapon_damage >= self.health)
		{
			self.var_308a583c = weapon_damage;
			return weapon_damage;
		}
		if(weapon_damage > 0)
		{
			iDamage = iDamage + weapon_damage;
		}
		var_99a76922 = 0;
		if(GetDvarInt("tfoption_dpap") && namespace_78d24adc::function_98902a25() && isdefined(attacker) && isPlayer(attacker))
		{
			var_9448e09 = zm_weapons::get_upgrade_weapon(weapon);
			if(isdefined(var_9448e09))
			{
				var_a2f55b96 = level.var_97da320a[attacker getXuid(1) + var_9448e09.name];
				if(isdefined(level.var_5cc17d02[var_a2f55b96]))
				{
					var_99a76922 = var_99a76922 + level.var_5cc17d02[var_a2f55b96];
				}
			}
		}
		if(IsSubStr(weapon.name, "+damage") && (sHitLoc == "helmet" || sHitLoc == "head" || sHitLoc == "neck"))
		{
			var_99a76922 = var_99a76922 + 0.5;
		}
		if(IsSubStr(weapon.name, "+fmj") && (!isdefined(self.archetype) || self.archetype !== "zombie"))
		{
			var_99a76922 = var_99a76922 + 1;
		}
		if(weapon.name == "stunfrag")
		{
			if(!isdefined(self.var_adeb391b))
			{
				namespace_22b67853::function_f105c5b1("stun_hit", attacker);
			}
			self thread satchel_charge::zombie_speed();
		}
	}
	if(!(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver") && GetDvarInt("tfoption_perkplus")))
	{
		if(isPlayer(attacker) && isdefined(attacker.perks_active) && attacker.perks_active.size >= 4 && isdefined(attacker.var_9b145994) && attacker.var_9b145994 >= 5 && weapon.inventoryType == "primary" && (sHitLoc == "head" || sHitLoc == "helmet" || sHitLoc == "neck"))
		{
			var_99a76922 = var_99a76922 + 0.25;
		}
	}
	if(var_99a76922 > 0)
	{
		iDamage = Int(iDamage * var_99a76922) + iDamage;
		if(is_bot && var_5a986ff0)
		{
			if(Int(self.maxhealth * 0.34) <= iDamage)
			{
				self.var_308a583c = iDamage;
			}
			else
			{
				self.var_308a583c = Int(self.maxhealth * 0.34);
			}
			return self.var_308a583c;
		}
		self.var_308a583c = iDamage;
		return self.var_308a583c;
	}
	if(is_bot && var_5a986ff0)
	{
		if(Int(self.maxhealth * 0.34) <= iDamage)
		{
			self.var_308a583c = iDamage;
		}
		else
		{
			self.var_308a583c = Int(self.maxhealth * 0.34);
		}
		return self.var_308a583c;
	}
	if(weapon_damage > 0)
	{
		self.var_308a583c = iDamage;
		return iDamage;
	}
	return -1;
}

/*
	Name: function_6d128dda
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x2FA0
	Size: 0x4B8
	Parameters: 12
	Flags: Private
	Line Number: 856
*/
function private function_6d128dda(inflictor, attacker, iDamage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(isdefined(self.archetype))
	{
		if(isdefined(level.minigun_damage_adjust_override))
		{
			n_percent_damage = [[level.minigun_damage_adjust_override]](inflictor, attacker, iDamage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType);
		}
		if(self.archetype == "zombie" || self.archetype == "zombie_dog" || self.archetype == "zombie_quad" || self.archetype == "apothicon_fury" || self.archetype == "keeper" || self.archetype == "spider" || self.archetype == "parasite")
		{
			if(self function_79615af2())
			{
				n_percent_damage = self.health * RandomFloatRange(0.34, 0.75);
				if(meansOfDeath === "MOD_GRENADE_SPLASH" && self.health > 2000)
				{
					if(weapon.name == "frag_grenade" || weapon.name == "bouncingbetty" || (isdefined(level.weaponZMCymbalMonkey) && weapon === level.weaponZMCymbalMonkey))
					{
						return self.health - 1000;
					}
				}
				if(meansOfDeath != "MOD_MELEE")
				{
					if(IsSubStr(weapon.name, "_wolf_howl"))
					{
						return self.health;
					}
					if(IsSubStr(weapon.name, "_storm"))
					{
						return self.health;
					}
					if(IsSubStr(weapon.name, "staff"))
					{
						return iDamage + 20000;
					}
				}
				if(isdefined(self.maxhealth) && weapon.name == "purifier" && self.health > 1000)
				{
					return Int(self.maxhealth * RandomFloatRange(0.34, 0.75));
				}
			}
		}
		if(isdefined(n_percent_damage) && level.zombie_powerup_weapon["minigun"] == weapon)
		{
			return iDamage + n_percent_damage;
		}
	}
	if(weapon.name == "bowie_knife_widows_wine")
	{
		return 1400;
	}
	if(weapon.name == "hero_annihilator")
	{
		if(meansOfDeath == "MOD_MELEE")
		{
			return 1000;
		}
		else
		{
			return self.health;
		}
	}
	if(weapon.name == "special_crossbow_dw" || weapon.name == "special_crossbowlh")
	{
		if(sHitLoc == "helmet" || sHitLoc == "head" || sHitLoc == "neck")
		{
			return 2000;
		}
		else
		{
			return 1100;
		}
	}
	if(weapon.name == "special_crossbow_dw_upgraded" || weapon.name == "special_crossbowlh_upgraded")
	{
		if(sHitLoc == "helmet" || sHitLoc == "head" || sHitLoc == "neck")
		{
			return 10000;
		}
		else
		{
			return 5000;
		}
	}
	return -1;
}

/*
	Name: health_regen
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x3460
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 952
*/
function health_regen()
{
	self endon("spawned_player");
	level endon("end_game");
	self endon("bled_out");
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self waittill("grenade_fire", grenade, weapon);
		if(weapon == GetWeapon("heal_aid"))
		{
			if(self getnormalhealth() < 1)
			{
				self thread function_5b1cc462();
			}
			else if(self hasweapon(weapon) && self GetWeaponAmmoClip(weapon) == 0)
			{
				self SetWeaponAmmoClip(weapon, 1);
			}
		}
	}
}

/*
	Name: function_5b1cc462
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x3580
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 986
*/
function function_5b1cc462(var_647f7d26)
{
	level endon("end_game");
	self endon("damage");
	self endon("hit_again");
	self endon("bled_out");
	self endon("disconnect");
	self endon("death");
	self thread function_623eb6c();
	self setnormalhealth(1);
	self notify("clear_red_flashing_overlay");
}

/*
	Name: function_623eb6c
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x3618
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1009
*/
function function_623eb6c()
{
	self notify("hash_623eb6c");
	self endon("hash_623eb6c");
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	self endon("hash_eb391656");
	wait(2);
	weapon = GetWeapon("heal_aid");
	if(self hasweapon(weapon) && self GetWeaponAmmoClip(weapon) == 0)
	{
		self playlocalsound("t8_heal_ready");
		self SetWeaponAmmoClip(weapon, 1);
		return;
	}
}

/*
	Name: function_5ea45bed
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x3710
	Size: 0x20
	Parameters: 0
	Flags: AutoExec
	Line Number: 1037
*/
function autoexec function_5ea45bed()
{
	level thread function_64144b81();
}

/*
	Name: function_64144b81
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x3738
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1052
*/
function function_64144b81()
{
	level flag::wait_till("initial_blackscreen_passed");
	zm_spawner::register_zombie_death_event_callback(&function_c3f2ac14);
	wait(5);
	if(GetDvarString("tfoption_c4nuke") != "1")
	{
		function_32ffa65a();
	}
	thread function_2596f173();
	return;
}

/*
	Name: function_abe5a844
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x37D8
	Size: 0x4F8
	Parameters: 1
	Flags: None
	Line Number: 1075
*/
function function_abe5a844(e_player)
{
	if(isdefined(self.cost) && zm_utility::is_player_valid(e_player))
	{
		if(e_player zm_score::can_player_purchase(self.cost))
		{
			weapon = e_player GetCurrentWeapon();
			if(weapon.inventoryType == "primary" && (!(isdefined(weapon.unlimitedammo) && weapon.unlimitedammo)))
			{
				if(isdefined(weapon.isClipOnly) && weapon.isClipOnly)
				{
					if(e_player GetWeaponAmmoClip(weapon) < weapon.clipSize)
					{
						e_player playsoundwithnotify("wpn_ammo_pickup");
						e_player zm_score::minus_to_player_score(self.cost);
						e_player SetWeaponAmmoClip(weapon, weapon.clipSize);
						e_player giveMaxAmmo(weapon);
						if(isdefined(weapon.dualWieldWeapon))
						{
							e_player SetWeaponAmmoClip(weapon.dualWieldWeapon, weapon.dualWieldWeapon.clipSize);
						}
						if(isdefined(weapon.altweapon))
						{
							e_player SetWeaponAmmoClip(weapon.altweapon, weapon.altweapon.clipSize);
							e_player giveMaxAmmo(weapon.altweapon);
						}
					}
					else
					{
						e_player IPrintLnBold(&"MPUI_LMG_MAGAZINE_FULL_CAPS");
					}
				}
				else if(e_player GetWeaponAmmoClip(weapon) < weapon.clipSize || e_player GetWeaponAmmoStock(weapon) < weapon.maxAmmo || (isdefined(weapon.dualWieldWeapon) && e_player GetWeaponAmmoClip(weapon.dualWieldWeapon) < weapon.dualWieldWeapon.clipSize) || (isdefined(weapon.altweapon) && (e_player GetWeaponAmmoClip(weapon.altweapon) < weapon.altweapon.clipSize || e_player GetWeaponAmmoStock(weapon.altweapon) < weapon.altweapon.maxAmmo)))
				{
					e_player playsoundwithnotify("wpn_ammo_pickup");
					e_player zm_score::minus_to_player_score(self.cost);
					e_player SetWeaponAmmoClip(weapon, weapon.clipSize);
					e_player giveMaxAmmo(weapon);
					if(isdefined(weapon.dualWieldWeapon))
					{
						e_player SetWeaponAmmoClip(weapon.dualWieldWeapon, weapon.dualWieldWeapon.clipSize);
					}
					if(isdefined(weapon.altweapon))
					{
						e_player SetWeaponAmmoClip(weapon.altweapon, weapon.altweapon.clipSize);
						e_player giveMaxAmmo(weapon.altweapon);
					}
				}
				else
				{
					e_player IPrintLnBold(&"MPUI_LMG_MAGAZINE_FULL_CAPS");
				}
			}
		}
		else
		{
			e_player IPrintLnBold(&"MPUI_BM_NO_CURRENCY");
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c8e0a34c
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x3CD8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1148
*/
function function_c8e0a34c()
{
	price = zm::get_round_number() / 10;
	price = math::clamp(price, 0, 10);
	price = pow(2, price);
	result = Int(price * 1000 / 10) * 10 - 70;
	if(result > 6000)
	{
		result = 6000;
	}
	return result;
}

/*
	Name: function_2596f173
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x3DA0
	Size: 0x3C0
	Parameters: 0
	Flags: None
	Line Number: 1171
*/
function function_2596f173()
{
	level endon("end_game");
	var_2596f173 = undefined;
	while(!GetDvarInt("aaeoption_ammobag"))
	{
		if(isdefined(level.activePlayers) && level.activePlayers.size)
		{
			if(isdefined(var_2596f173))
			{
				var_2596f173 gameobjects::destroy_object(1, 1);
				objective_delete(var_2596f173.objectiveId);
				gameobjects::release_obj_id(self.objectiveId);
				var_2596f173 delete();
			}
			wait(5);
			guy = level.activePlayers[RandomInt(level.activePlayers.size)];
			if(isdefined(guy))
			{
				eye = guy GetEye();
				var_2596f173 = function_3b5a9346(eye + VectorScale((0, 0, 1), 30), (RandomInt(180), RandomInt(180), RandomInt(180)), &"aaethreed_ammobag", &function_abe5a844);
				var_2596f173 SetModel("p7_pouch_ammo_02");
				var_2596f173 Unlink();
				var_2596f173.trigger linkToBlendToTag(var_2596f173);
				var_2596f173 physicslaunch(eye, (0, 0, 1));
				var_2596f173 util::waittill_notify_or_timeout("stationary", 10);
				var_2596f173.trigger Unlink();
				var_2596f173 LinkTo(var_2596f173.trigger);
				var_2596f173.cost = function_c8e0a34c();
				level function_52988a8d(var_2596f173.objectiveId, "^BBUTTON_COD_POINT_ICON^" + var_2596f173.cost, "-1");
			}
			else
			{
				level waittill("end_of_round");
				wait(0.1);
			}
		}
		else
		{
			for(i = 0; i < 10; i++)
			{
				level waittill("end_of_round");
				if(isdefined(var_2596f173))
				{
					var_2596f173.cost = function_c8e0a34c();
					level function_52988a8d(var_2596f173.objectiveId, "^BBUTTON_COD_POINT_ICON^" + var_2596f173.cost, "-1");
				}
			}
			level waittill("end_of_round");
		}
	}
}

/*
	Name: function_32ffa65a
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x4168
	Size: 0x400
	Parameters: 0
	Flags: None
	Line Number: 1234
*/
function function_32ffa65a()
{
	if(GetDvarString("tfoption_zombs_always_sprint") == "1")
	{
		var_32ffa65a = function_80511ad1(function_c8b0fa5b(), 0);
		var_32ffa65a SetModel("wpn_t7_uplink_ball_world");
		var_32ffa65a clientfield::set("bank_keyline", 1);
		return;
	}
	pos = tableLookup("gamedata/tables/common/box_chance.csv", 24, GetDvarString("ui_mapname"), 29);
	if(isdefined(pos) && pos != "")
	{
		pos = StrTok(pos, "|");
		if(pos.size == 3)
		{
			angles = tableLookup("gamedata/tables/common/box_chance.csv", 24, GetDvarString("ui_mapname"), 31);
			var_32ffa65a = function_80511ad1((float(pos[0]), float(pos[1]), float(pos[2])), float(angles));
			var_f0c9c2e9 = tableLookup("gamedata/tables/common/box_chance.csv", 24, GetDvarString("ui_mapname"), 30);
			if(isdefined(var_f0c9c2e9) && var_f0c9c2e9 != "" && var_f0c9c2e9 != "0")
			{
				var_32ffa65a SetModel(var_f0c9c2e9);
				return;
			}
		}
	}
	pos = tableLookup("gamedata/tables/common/box_chance.csv", 24, level.script, 29);
	if(isdefined(pos) && pos != "")
	{
		pos = StrTok(pos, "|");
		if(pos.size == 3)
		{
			angles = tableLookup("gamedata/tables/common/box_chance.csv", 24, level.script, 31);
			var_32ffa65a = function_80511ad1((float(pos[0]), float(pos[1]), float(pos[2])), float(angles));
			var_f0c9c2e9 = tableLookup("gamedata/tables/common/box_chance.csv", 24, level.script, 30);
			if(isdefined(var_f0c9c2e9) && var_f0c9c2e9 != "" && var_f0c9c2e9 != "0")
			{
				var_32ffa65a SetModel(var_f0c9c2e9);
				return;
			}
			return;
		}
	}
}

/*
	Name: function_c8b0fa5b
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x4570
	Size: 0x2D8
	Parameters: 0
	Flags: None
	Line Number: 1288
*/
function function_c8b0fa5b()
{
	pos = tableLookup("gamedata/tables/common/box_chance.csv", 24, GetDvarString("ui_mapname"), 28);
	if(isdefined(pos) && pos != "")
	{
		pos = StrTok(pos, "|");
		if(pos.size == 3)
		{
			return (float(pos[0]), float(pos[1]), float(pos[2]));
		}
	}
	pos = tableLookup("gamedata/tables/common/box_chance.csv", 24, level.script, 28);
	if(isdefined(pos) && pos != "")
	{
		pos = StrTok(pos, "|");
		if(pos.size == 3)
		{
			return (float(pos[0]), float(pos[1]), float(pos[2]));
		}
	}
	origin = (0, 0, 0);
	points = struct::get_array("initial_spawn", "script_noteworthy");
	if(!isdefined(points) || points.size == 0)
	{
		points = struct::get_array("initial_spawn_points", "targetname");
	}
	if(!isdefined(points) || points.size == 0)
	{
		points = GetEntArray("info_player_start", "classname");
	}
	if(isdefined(points[3]))
	{
		return points[3].origin;
	}
	if(!isdefined(origin) && isdefined(points[0]))
	{
		return points[0].origin + (10, 0, 20);
	}
	return origin;
}

/*
	Name: onUse
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x4850
	Size: 0x290
	Parameters: 1
	Flags: None
	Line Number: 1339
*/
function onUse(e_player)
{
	if(isdefined(level.var_7df8604))
	{
		level.var_7df8604 = undefined;
		level function_52988a8d(self.objectiveId, "MENU_ACTIVATE", "-1");
		return;
	}
	if(isdefined(e_player.var_5ff47a0))
	{
		e_player function_52988a8d(self.objectiveId, "MENU_ACTIVATE", "-1");
		e_player.var_5ff47a0 = undefined;
		return;
	}
	else
	{
		e_player.var_5ff47a0 = 1;
	}
	num = 0;
	var_7d0ae247 = 0;
	foreach(player in level.activePlayers)
	{
		if(isdefined(player.var_5ff47a0))
		{
			num++;
		}
		if(!player IsTestClient())
		{
			var_7d0ae247++;
		}
	}
	if(num >= var_7d0ae247)
	{
		self thread function_1c767348();
		level function_52988a8d(self.objectiveId, "AAE_DEACTIVATE", "-1");
		foreach(player in GetPlayers())
		{
			if(isdefined(player.var_5ff47a0))
			{
				player.var_5ff47a0 = undefined;
			}
		}
	}
	else
	{
		e_player function_52988a8d(self.objectiveId, "EXE_AWAITINGHOST", "-1");
	}
}

/*
	Name: function_b9dbea0e
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x4AE8
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 1398
*/
function function_b9dbea0e(bool)
{
	if(!isdefined(bool))
	{
		bool = 0;
	}
	if(bool)
	{
		util::setClientSysState("deadshot_keyline", "rami,1");
	}
	else
	{
		util::setClientSysState("deadshot_keyline", "rami,0");
	}
}

/*
	Name: function_1c767348
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x4B60
	Size: 0x460
	Parameters: 0
	Flags: None
	Line Number: 1424
*/
function function_1c767348()
{
	level notify("hash_1c767348");
	level endon("hash_1c767348");
	level.var_7df8604 = 1;
	self playsound("rampage_inducer_start");
	while(isdefined(level.var_7df8604))
	{
		wait(1);
		result = 0;
		foreach(player in level.activePlayers)
		{
			if(player bgb::is_enabled("zm_bgb_undead_man_walking"))
			{
				result = 1;
			}
		}
		if(result)
		{
			function_b9dbea0e(0);
			continue;
		}
		zombie_utility::set_zombie_var("zombie_spawn_delay", 0.1);
		zombie = GetAISpeciesArray("axis");
		for(i = 0; i < zombie.size; i++)
		{
			if(!isdefined(zombie[i].old_speed))
			{
				zombie[i].old_speed = zombie[i].zombie_move_speed;
			}
			if(isdefined(zombie[i].completed_emerging_into_playable_area) && zombie[i].completed_emerging_into_playable_area)
			{
				zombie[i] zombie_utility::set_zombie_run_cycle_override_value("super_sprint");
				if(zm::get_round_number() > 25)
				{
					zombie[i] ASMSetAnimationRate(1.05);
				}
			}
		}
		function_b9dbea0e(1);
	}
	level.zombie_vars["zombie_spawn_delay"] = [[level.func_get_zombie_spawn_delay]](zm::get_round_number());
	result = 0;
	foreach(player in level.activePlayers)
	{
		if(player bgb::is_enabled("zm_bgb_undead_man_walking"))
		{
			result = 1;
		}
	}
	if(!result)
	{
		zombie = GetAISpeciesArray("axis");
		for(i = 0; i < zombie.size; i++)
		{
			if(isdefined(zombie[i].old_speed))
			{
				zombie[i] ASMSetAnimationRate(1);
				zombie[i] zombie_utility::set_zombie_run_cycle_override_value(zombie[i].old_speed);
				zombie[i] zombie_utility::set_zombie_run_cycle_restore_from_override();
			}
		}
	}
	self playsound("rampage_inducer_end");
	function_b9dbea0e(0);
}

/*
	Name: canInteractWithPlayer
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x4FC8
	Size: 0x198
	Parameters: 1
	Flags: None
	Line Number: 1501
*/
function canInteractWithPlayer(e_player)
{
	var_f329927f = (Int(self.origin[0]), Int(self.origin[1]), Int(self.origin[2]));
	eye = e_player GetEye();
	result = util::within_fov(eye, e_player getPlayerAngles(), var_f329927f, cos(GetDvarInt("ip_angles")));
	range = GetDvarInt("ip_range");
	result = Distance(e_player.origin, var_f329927f) <= range || Distance(eye, var_f329927f) <= range && result;
	self gameobjects::set_use_time(2);
	return result;
}

/*
	Name: function_c9879280
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x5168
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 1522
*/
function function_c9879280(e_player)
{
	var_f329927f = (Int(self.origin[0]), Int(self.origin[1]), Int(self.origin[2]));
	eye = e_player GetEye();
	result = util::within_fov(eye, e_player getPlayerAngles(), var_f329927f, cos(GetDvarInt("ip_angles")));
	range = GetDvarInt("ip_range");
	result = Distance(e_player.origin, var_f329927f) <= range || Distance(eye, var_f329927f) <= range && result;
	if(isdefined(level.var_7df8604))
	{
		if(e_player GamepadUsedLast())
		{
			self gameobjects::set_use_time(0.15);
		}
		else
		{
			self gameobjects::set_use_time(0.09);
		}
	}
	else
	{
		self gameobjects::set_use_time(1.2);
	}
	return result;
}

/*
	Name: function_3b5a9346
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x5378
	Size: 0x230
	Parameters: 4
	Flags: None
	Line Number: 1557
*/
function function_3b5a9346(origin, angles, objective, var_9c83f603)
{
	t_use = spawn("trigger_radius_use", origin, 0, 80, 80);
	t_use.angles = angles;
	t_use TriggerIgnoreTeam();
	t_use setvisibletoall();
	t_use SetTeamForTrigger("none");
	t_use setcursorhint("HINT_INTERACTIVE_PROMPT");
	t_use EnableLinkTo();
	var_db7c07b5 = gameobjects::create_use_object("any", t_use, [], (0, 0, 0), objective, 0, 1);
	var_db7c07b5 gameobjects::allow_use("any");
	var_db7c07b5 gameobjects::set_owner_team("allies");
	var_db7c07b5 gameobjects::set_visible_team("any");
	var_db7c07b5.onUse = var_9c83f603;
	var_db7c07b5.useWeapon = undefined;
	var_db7c07b5.keepWeapon = 1;
	var_db7c07b5.dontLinkPlayerToTrigger = 1;
	var_db7c07b5 gameobjects::set_use_time(0.1);
	var_db7c07b5.onBeginUse = undefined;
	var_db7c07b5.onEndUse = undefined;
	var_db7c07b5.canInteractWithPlayer = &canInteractWithPlayer;
	return var_db7c07b5;
}

/*
	Name: function_80511ad1
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x55B0
	Size: 0x270
	Parameters: 2
	Flags: None
	Line Number: 1591
*/
function function_80511ad1(origin, angles)
{
	t_use = spawn("trigger_radius_use", origin, 0, 60, 60);
	t_use.angles = angles;
	t_use TriggerIgnoreTeam();
	t_use setvisibletoall();
	t_use SetTeamForTrigger("none");
	t_use setcursorhint("HINT_INTERACTIVE_PROMPT");
	t_use EnableLinkTo();
	obj = &"aaethreed_rampage";
	if(GetDvarString("tfoption_zombs_always_sprint") == "1")
	{
		obj = &"aaethreed_rampage2";
	}
	var_db7c07b5 = gameobjects::create_use_object("any", t_use, [], (0, 0, 0), obj, 0, 1);
	var_db7c07b5 gameobjects::allow_use("any");
	var_db7c07b5 gameobjects::set_owner_team("allies");
	var_db7c07b5 gameobjects::set_visible_team("any");
	var_db7c07b5.onUse = &onUse;
	var_db7c07b5.useWeapon = undefined;
	var_db7c07b5.keepWeapon = 1;
	var_db7c07b5.dontLinkPlayerToTrigger = 1;
	var_db7c07b5 gameobjects::set_use_time(1.2);
	var_db7c07b5.onBeginUse = undefined;
	var_db7c07b5.onEndUse = undefined;
	var_db7c07b5.canInteractWithPlayer = &function_c9879280;
	return var_db7c07b5;
}

/*
	Name: function_52988a8d
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x5828
	Size: 0xC8
	Parameters: 3
	Flags: None
	Line Number: 1630
*/
function function_52988a8d(objId, hint, var_36f79777)
{
	if(self == level || !isdefined(self))
	{
		util::setClientSysState("deadshot_keyline", "ip," + objId + "â¦" + hint + ":" + var_36f79777);
	}
	else
	{
		self util::setClientSysState("deadshot_keyline", "ip," + objId + "â¦" + hint + ":" + var_36f79777, self);
	}
}

/*
	Name: function_2c8d2c1a
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x58F8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1652
*/
function function_2c8d2c1a()
{
	if(level.round_number >= 40 && self.archetype == "zombie" && isdefined(self.archetype))
	{
		self thread function_6f187dfa();
	}
}

/*
	Name: function_6f187dfa
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x5950
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 1670
*/
function function_6f187dfa()
{
	self endon("death");
	self endon("hash_812e64d1");
	for(;;)
	{
		wait(1);
		result = 0;
		var_3812f8bd = 0;
		foreach(player in level.activePlayers)
		{
			if(player bgb::is_enabled("zm_bgb_undead_man_walking"))
			{
				result = 1;
			}
		}
		if(isdefined(level.var_9e59cb5b))
		{
			var_3812f8bd = ![[level.var_9e59cb5b]](self);
		}
		if(result || var_3812f8bd || isdefined(level.var_7df8604))
		{
		}
		else if(isdefined(self.no_powerups) && !self.no_powerups)
		{
			self zombie_utility::set_zombie_run_cycle_restore_from_override();
			self thread zombie_speed();
			self notify("hash_812e64d1");
			return;
		}
		if(isdefined(self.no_powerups) && self.no_powerups)
		{
			if(self.zombie_move_speed != "sprint" && !isdefined(self.var_ee695533))
			{
				self zombie_utility::set_zombie_run_cycle_override_value("sprint");
				self.var_ee695533 = 1;
			}
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: zombie_speed
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x5B38
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 1724
*/
function zombie_speed()
{
	self endon("death");
	self endon("hash_46b2ef7f");
	util::wait_network_frame();
	for(;;)
	{
		wait(1);
		result = 0;
		if(isdefined(self.no_powerups) && self.no_powerups)
		{
			result = 1;
		}
		foreach(player in level.activePlayers)
		{
			if(player bgb::is_enabled("zm_bgb_undead_man_walking"))
			{
				result = 1;
			}
		}
		if(isdefined(level.var_9e59cb5b))
		{
			var_3812f8bd = ![[level.var_9e59cb5b]](self);
		}
		if(result || var_3812f8bd)
		{
		}
		else if(!isdefined(self.var_a1d7b876))
		{
			if(self.zombie_move_speed != "super_sprint" && level.script != "zm_moon")
			{
				self zombie_utility::set_zombie_run_cycle_override_value("super_sprint");
			}
		}
		else
		{
			self notify("hash_46b2ef7f");
			return;
		}
	}
}

/*
	Name: function_c3f2ac14
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x5CF0
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 1776
*/
function function_c3f2ac14(player)
{
	if(isPlayer(player) && self.team === level.zombie_team)
	{
		powerup = zm_powerups::get_regular_random_powerup_name();
		if(self function_dfb8be86(player) && isdefined(powerup))
		{
			self thread function_64866887(powerup, self.origin);
		}
	}
	if(level.script == "zm_castle")
	{
		self thread wait_for_drop(player);
	}
	if(level.script == "zm_island")
	{
		self thread function_8b288276();
	}
}

/*
	Name: function_64866887
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x5DF8
	Size: 0xE0
	Parameters: 2
	Flags: None
	Line Number: 1806
*/
function function_64866887(powerup, origin)
{
	self notify("hash_d0395249");
	self endon("hash_d0395249");
	level endon("powerup_dropped");
	level endon("hash_c5065002");
	level endon("hash_b8b6381d");
	wait(0.5);
	var_cb18f043 = ArrayGetClosest(origin, level.active_powerups);
	if(isdefined(var_cb18f043) && Distance(var_cb18f043.origin, origin) < 300)
	{
	}
	else
	{
		thread zm_powerups::specific_powerup_drop(powerup, origin);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8b288276
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x5EE0
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 1836
*/
function function_8b288276()
{
	self notify("hash_8b288276");
	self endon("hash_8b288276");
	origin = self.origin;
	if(isdefined(self) && isdefined(self.no_powerups) && self.no_powerups)
	{
		return;
	}
	if(isdefined(self.archetype) && "thrasher" != self.archetype)
	{
		return;
	}
	wait(0.1);
	powerup = ArrayGetClosest(origin, level.active_powerups);
	if(!(isdefined(powerup) && Distance(powerup.origin, origin) < 200))
	{
		if(RandomFloat(1) <= 0.35)
		{
			level thread zm_powerups::specific_powerup_drop("island_seed", origin);
		}
	}
}

/*
	Name: wait_for_drop
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x6010
	Size: 0x248
	Parameters: 1
	Flags: None
	Line Number: 1870
*/
function wait_for_drop(player)
{
	self notify("hash_4f54f70a");
	self endon("hash_4f54f70a");
	player endon("disconnect");
	level endon("powerup_dropped");
	level endon("hash_c5065002");
	level endon("hash_b8b6381d");
	origin = self.origin;
	wait(0.1);
	if(isdefined(self) && !level flag::get("demonic_rune_dropped") && IsSubStr(player GetCurrentWeapon().name, "+suppressed") && isdefined(self.no_powerups) && !self.no_powerups)
	{
		powerup = ArrayGetClosest(origin, level.active_powerups);
		if(isdefined(powerup) && Distance(powerup.origin, origin) < 200)
		{
		}
		else if(isdefined(level.var_ee1b913a) && isdefined(level.var_1d3b068e) && self [[level.var_ee1b913a]](level.var_6e68c0d8))
		{
			if(level.var_234807d9.size > 0 && RandomFloat(1) <= 0.4)
			{
				self.no_powerups = 1;
				var_50ef61f9 = level.var_234807d9[0];
				level flag::set("demonic_rune_dropped");
				level._powerup_timeout_override = level.var_1d3b068e;
				level thread zm_powerups::specific_powerup_drop(var_50ef61f9, origin, undefined, undefined, undefined, level.var_6e68c0d8);
				level._powerup_timeout_override = undefined;
			}
		}
	}
}

/*
	Name: function_dfb8be86
	Namespace: namespace_ab57545b
	Checksum: 0x424F4353
	Offset: 0x6260
	Size: 0x84
	Parameters: 1
	Flags: None
	Line Number: 1911
*/
function function_dfb8be86(attacker)
{
	if(IsSubStr(attacker GetCurrentWeapon().name, "+suppressed") && RandomInt(100) < 3 && isdefined(self.no_powerups) && !self.no_powerups)
	{
		return 1;
	}
	return 0;
}

