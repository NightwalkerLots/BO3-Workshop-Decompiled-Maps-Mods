#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\weapons\_weaponobjects;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace riotshield;

/*
	Name: __init__sytem__
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x568
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 33
*/
function autoexec __init__sytem__()
{
	system::register("zm_equip_riotshield", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x5B0
	Size: 0x310
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function __init__()
{
	if(!isdefined(level.weaponRiotshield))
	{
		level.weaponRiotshield = GetWeapon("riotshield");
	}
	clientfield::register("clientuimodel", "zmInventory.shield_health", 11000, 4, "float");
	zombie_utility::set_zombie_var("riotshield_cylinder_radius", 360);
	zombie_utility::set_zombie_var("riotshield_fling_range", 90);
	zombie_utility::set_zombie_var("riotshield_gib_range", 90);
	zombie_utility::set_zombie_var("riotshield_gib_damage", 75);
	zombie_utility::set_zombie_var("riotshield_knockdown_range", 90);
	zombie_utility::set_zombie_var("riotshield_knockdown_damage", 15);
	zombie_utility::set_zombie_var("riotshield_fling_force_melee", 100);
	zombie_utility::set_zombie_var("riotshield_hit_points", 1850);
	zombie_utility::set_zombie_var("riotshield_fling_damage_shield", 100);
	zombie_utility::set_zombie_var("riotshield_knockdown_damage_shield", 15);
	zombie_utility::set_zombie_var("riotshield_juke_damage_shield", 100);
	zombie_utility::set_zombie_var("riotshield_stowed_block_fraction", 1);
	level.riotshield_network_choke_count = 0;
	level.riotshield_gib_refs = [];
	level.riotshield_gib_refs[level.riotshield_gib_refs.size] = "guts";
	level.riotshield_gib_refs[level.riotshield_gib_refs.size] = "right_arm";
	level.riotshield_gib_refs[level.riotshield_gib_refs.size] = "left_arm";
	zm::register_player_damage_callback(&player_damage_override_callback);
	if(!isdefined(level.riotshield_melee))
	{
		level.riotshield_melee = &riotshield_melee;
	}
	if(!isdefined(level.riotshield_melee_power))
	{
		level.riotshield_melee_power = &riotshield_melee;
	}
	if(!isdefined(level.riotshield_damage_callback))
	{
		level.riotshield_damage_callback = &player_damage_shield;
	}
	if(!isdefined(level.should_shield_absorb_damage))
	{
		level.should_shield_absorb_damage = &should_shield_absorb_damage;
	}
	callback::on_connect(&on_player_connect);
}

/*
	Name: __main__
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x8C8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function __main__()
{
}

/*
	Name: on_player_connect
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x8D8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 116
*/
function on_player_connect()
{
	self.player_shield_reset_health = &player_init_shield_health;
	if(!isdefined(self.player_shield_apply_damage))
	{
		self.player_shield_apply_damage = &player_damage_shield;
	}
	self thread player_watch_weapon_change();
	self thread player_watch_shield_melee();
	self thread player_watch_shield_melee_power();
}

/*
	Name: player_init_shield_health
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x968
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 138
*/
function player_init_shield_health()
{
	foreach(weapon in self GetWeaponsList())
	{
		if(isdefined(weapon) && weapon.isRiotShield)
		{
			self TakeWeapon(weapon);
			self UpdateRiotShieldModel(weapon);
			self clientfield::set_player_uimodel("zmInventory.shield_health", 1);
			return 1;
		}
	}
	self player_set_shield_health(1, 1);
	return 1;
}

/*
	Name: player_set_shield_health
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0xA98
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 164
*/
function player_set_shield_health(damage, max_damage)
{
	self UpdateRiotShieldModel();
	self clientfield::set_player_uimodel("zmInventory.shield_health", damage / max_damage);
}

/*
	Name: player_shield_absorb_damage
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0xAF8
	Size: 0x28
	Parameters: 4
	Flags: None
	Line Number: 180
*/
function player_shield_absorb_damage(eAttacker, iDamage, sHitLoc, sMeansOfDeath)
{
}

/*
	Name: player_shield_facing_attacker
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0xB28
	Size: 0x138
	Parameters: 2
	Flags: None
	Line Number: 194
*/
function player_shield_facing_attacker(vDir, limit)
{
	orientation = self getPlayerAngles();
	forwardVec = AnglesToForward(orientation);
	forwardVec2D = (forwardVec[0], forwardVec[1], 0);
	unitForwardVec2D = VectorNormalize(forwardVec2D);
	toFaceeVec = vDir * -1;
	toFaceeVec2D = (toFaceeVec[0], toFaceeVec[1], 0);
	unitToFaceeVec2D = VectorNormalize(toFaceeVec2D);
	dotProduct = VectorDot(unitForwardVec2D, unitToFaceeVec2D);
	return dotProduct > limit;
}

/*
	Name: should_shield_absorb_damage
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0xC68
	Size: 0x180
	Parameters: 10
	Flags: None
	Line Number: 217
*/
function should_shield_absorb_damage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(isdefined(self.hasRiotShield) && self.hasRiotShield && isdefined(vDir))
	{
		if(isdefined(eAttacker) && (isdefined(eAttacker.is_zombie) && eAttacker.is_zombie || isPlayer(eAttacker)))
		{
			if(isdefined(self.hasRiotShieldEquipped) && self.hasRiotShieldEquipped)
			{
				if(self player_shield_facing_attacker(vDir, 0.2))
				{
					return 1;
				}
			}
			else if(!isdefined(self.riotshieldEntity))
			{
				if(!self player_shield_facing_attacker(vDir, -0.2))
				{
					return level.zombie_vars["riotshield_stowed_block_fraction"];
				}
			}
			else
			{
				Assert(!isdefined(self.riotshieldEntity), "Dev Block strings are not supported");
			}
			/#
			#/
		}
	}
	return 0;
}

/*
	Name: player_damage_override_callback
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0xDF0
	Size: 0x1B8
	Parameters: 10
	Flags: None
	Line Number: 258
*/
function player_damage_override_callback(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	friendly_fire = isdefined(eAttacker) && eAttacker.team === self.team;
	if(isdefined(self.hasRiotShield) && self.hasRiotShield && !friendly_fire)
	{
		fBlockFraction = self [[level.should_shield_absorb_damage]](eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime);
		if(fBlockFraction > 0 && isdefined(self.player_shield_apply_damage))
		{
			iBlocked = Int(fBlockFraction * iDamage);
			iUnblocked = iDamage - iBlocked;
			if(isdefined(self.player_shield_apply_damage))
			{
				self [[self.player_shield_apply_damage]](iBlocked, 0, sHitLoc == "riotshield", sMeansOfDeath);
				if(isdefined(self.riotshield_damage_absorb_callback))
				{
					self [[self.riotshield_damage_absorb_callback]](eAttacker, iBlocked, sHitLoc, sMeansOfDeath);
				}
			}
			return iUnblocked;
		}
	}
	return -1;
}

/*
	Name: player_damage_shield
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0xFB0
	Size: 0x240
	Parameters: 4
	Flags: None
	Line Number: 292
*/
function player_damage_shield(iDamage, bHeld, fromCode, smod)
{
	if(!isdefined(fromCode))
	{
		fromCode = 0;
	}
	if(!isdefined(smod))
	{
		smod = "MOD_UNKNOWN";
	}
	if(isdefined(self.weaponRiotshield) && level.weaponNone != self.weaponRiotshield)
	{
		if(self.weaponRiotshield.name == "castle_riotshield_upgraded")
		{
			iDamage = Int(iDamage / 3);
		}
		damageMax = self.weaponRiotshield.weaponstarthitpoints;
		shieldHealth = damageMax;
		shieldDamage = iDamage;
		rumbled = 0;
		if(fromCode)
		{
			shieldDamage = 0;
		}
		shieldHealth = self DamageRiotShield(shieldDamage);
		if(shieldHealth <= 0)
		{
			if(!rumbled)
			{
				self PlayRumbleOnEntity("damage_heavy");
				Earthquake(1, 0.75, self.origin, 100);
			}
			self thread player_take_riotshield();
		}
		else if(!rumbled)
		{
			self PlayRumbleOnEntity("damage_light");
			Earthquake(0.5, 0.5, self.origin, 100);
		}
		self playsound("fly_riotshield_zm_impact_zombies");
		self player_set_shield_health(shieldHealth, damageMax);
		return;
	}
}

/*
	Name: player_watch_weapon_change
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x11F8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 347
*/
function player_watch_weapon_change()
{
	for(;;)
	{
		self waittill("weapon_change", weapon);
		self UpdateRiotShieldModel();
	}
}

/*
	Name: player_watch_shield_melee
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x1238
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 366
*/
function player_watch_shield_melee()
{
	for(;;)
	{
		self waittill("weapon_melee", weapon);
		if(weapon.isRiotShield)
		{
			self [[level.riotshield_melee]](weapon);
		}
	}
}

/*
	Name: player_watch_shield_melee_power
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x1288
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 388
*/
function player_watch_shield_melee_power()
{
	for(;;)
	{
		self waittill("weapon_melee_power", weapon);
		if(weapon.isRiotShield)
		{
			self [[level.riotshield_melee_power]](weapon);
		}
	}
}

/*
	Name: riotshield_fling_zombie
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x12D8
	Size: 0x120
	Parameters: 3
	Flags: None
	Line Number: 410
*/
function riotshield_fling_zombie(player, fling_vec, index)
{
	if(!isdefined(self) || !isalive(self))
	{
		return;
	}
	if(isdefined(self.ignore_riotshield) && self.ignore_riotshield)
	{
		return;
	}
	if(isdefined(self.riotshield_fling_func))
	{
		self [[self.riotshield_fling_func]](player);
		return;
	}
	damage = 2500;
	self DoDamage(damage, player.origin, player, player, "", "MOD_IMPACT");
	if(self.health < 1)
	{
		self.riotshield_death = 1;
		self StartRagdoll(1);
		self LaunchRagdoll(fling_vec);
	}
}

/*
	Name: zombie_knockdown
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x1400
	Size: 0xD0
	Parameters: 2
	Flags: None
	Line Number: 445
*/
function zombie_knockdown(player, gib)
{
	damage = level.zombie_vars["riotshield_knockdown_damage"];
	if(isdefined(level.override_riotshield_damage_func))
	{
		self [[level.override_riotshield_damage_func]](player, gib);
	}
	else if(gib)
	{
		self.a.gib_ref = Array::random(level.riotshield_gib_refs);
		self thread zombie_death::do_gib();
	}
	self DoDamage(damage, player.origin, player);
}

/*
	Name: riotshield_knockdown_zombie
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x14D8
	Size: 0x128
	Parameters: 2
	Flags: None
	Line Number: 470
*/
function riotshield_knockdown_zombie(player, gib)
{
	self endon("death");
	playsoundatposition("vox_riotshield_forcehit", self.origin);
	playsoundatposition("wpn_riotshield_proj_impact", self.origin);
	if(!isdefined(self) || !isalive(self))
	{
		return;
	}
	if(isdefined(self.riotshield_knockdown_func))
	{
		self [[self.riotshield_knockdown_func]](player, gib);
	}
	else
	{
		self zombie_knockdown(player, gib);
	}
	self DoDamage(level.zombie_vars["riotshield_knockdown_damage"], player.origin, player);
	self playsound("fly_riotshield_forcehit");
}

/*
	Name: riotshield_get_enemies_in_range
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x1608
	Size: 0x4D0
	Parameters: 0
	Flags: None
	Line Number: 501
*/
function riotshield_get_enemies_in_range()
{
	view_pos = self GetEye();
	zombies = Array::get_all_closest(view_pos, GetAITeamArray(level.zombie_team), undefined, undefined, 2 * level.zombie_vars["riotshield_knockdown_range"]);
	if(!isdefined(zombies))
	{
		return;
	}
	knockdown_range_squared = level.zombie_vars["riotshield_knockdown_range"] * level.zombie_vars["riotshield_knockdown_range"];
	gib_range_squared = level.zombie_vars["riotshield_gib_range"] * level.zombie_vars["riotshield_gib_range"];
	fling_range_squared = level.zombie_vars["riotshield_fling_range"] * level.zombie_vars["riotshield_fling_range"];
	cylinder_radius_squared = level.zombie_vars["riotshield_cylinder_radius"] * level.zombie_vars["riotshield_cylinder_radius"];
	fling_force = level.zombie_vars["riotshield_fling_force_melee"];
	fling_force_v = 0.5;
	forward_view_angles = self GetWeaponForwardDir();
	end_pos = view_pos + VectorScale(forward_view_angles, level.zombie_vars["riotshield_knockdown_range"]);
	for(i = 0; i < zombies.size; i++)
	{
		if(!isdefined(zombies[i]) || !isalive(zombies[i]))
		{
			continue;
		}
		if(zombies[i].archetype == "margwa")
		{
			continue;
		}
		test_origin = zombies[i] GetCentroid();
		test_range_squared = DistanceSquared(view_pos, test_origin);
		if(test_range_squared > knockdown_range_squared)
		{
			return;
		}
		normal = VectorNormalize(test_origin - view_pos);
		dot = VectorDot(forward_view_angles, normal);
		if(0 > dot)
		{
			continue;
		}
		radial_origin = PointOnSegmentNearestToPoint(view_pos, end_pos, test_origin);
		if(DistanceSquared(test_origin, radial_origin) > cylinder_radius_squared)
		{
			continue;
		}
		if(0 == zombies[i] damageConeTrace(view_pos, self))
		{
			continue;
		}
		if(test_range_squared < fling_range_squared)
		{
			level.riotshield_fling_enemies[level.riotshield_fling_enemies.size] = zombies[i];
			dist_mult = fling_range_squared - test_range_squared / fling_range_squared;
			fling_vec = VectorNormalize(test_origin - view_pos);
			if(5000 < test_range_squared)
			{
				fling_vec = fling_vec + VectorNormalize(test_origin - radial_origin);
			}
			fling_vec = (fling_vec[0], fling_vec[1], fling_force_v * Abs(fling_vec[2]));
			fling_vec = VectorScale(fling_vec, fling_force + fling_force * dist_mult);
			level.riotshield_fling_vecs[level.riotshield_fling_vecs.size] = fling_vec;
			continue;
		}
		level.riotshield_knockdown_enemies[level.riotshield_knockdown_enemies.size] = zombies[i];
		level.riotshield_knockdown_gib[level.riotshield_knockdown_gib.size] = 0;
	}
}

/*
	Name: riotshield_network_choke
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x1AE0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 577
*/
function riotshield_network_choke()
{
	level.riotshield_network_choke_count++;
	if(!level.riotshield_network_choke_count % 10)
	{
		util::wait_network_frame();
		util::wait_network_frame();
		util::wait_network_frame();
	}
}

/*
	Name: riotshield_melee
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x1B38
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 598
*/
function riotshield_melee(weapon)
{
	if(!isdefined(level.riotshield_knockdown_enemies))
	{
		level.riotshield_knockdown_enemies = [];
		level.riotshield_knockdown_gib = [];
		level.riotshield_fling_enemies = [];
		level.riotshield_fling_vecs = [];
	}
	self riotshield_get_enemies_in_range();
	shield_damage = 0;
	level.riotshield_network_choke_count = 0;
	for(i = 0; i < level.riotshield_fling_enemies.size; i++)
	{
		riotshield_network_choke();
		if(isdefined(level.riotshield_fling_enemies[i]))
		{
			level.riotshield_fling_enemies[i] thread riotshield_fling_zombie(self, level.riotshield_fling_vecs[i], i);
			shield_damage = shield_damage + level.zombie_vars["riotshield_fling_damage_shield"];
		}
	}
	for(i = 0; i < level.riotshield_knockdown_enemies.size; i++)
	{
		riotshield_network_choke();
		level.riotshield_knockdown_enemies[i] thread riotshield_knockdown_zombie(self, level.riotshield_knockdown_gib[i]);
		shield_damage = shield_damage + level.zombie_vars["riotshield_knockdown_damage_shield"];
	}
	level.riotshield_knockdown_enemies = [];
	level.riotshield_knockdown_gib = [];
	level.riotshield_fling_enemies = [];
	level.riotshield_fling_vecs = [];
	if(shield_damage)
	{
		self player_damage_shield(shield_damage, 0);
	}
}

/*
	Name: UpdateRiotShieldModel
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x1D38
	Size: 0x280
	Parameters: 1
	Flags: None
	Line Number: 645
*/
function UpdateRiotShieldModel(shield)
{
	wait(0.05);
	if(isdefined(shield) && shield != level.weaponNone)
	{
		self GiveWeapon(shield);
	}
	self.hasRiotShield = 0;
	self.weaponRiotshield = level.weaponNone;
	foreach(weapon in self GetWeaponsList(1))
	{
		if(weapon.isRiotShield)
		{
			self.hasRiotShield = 1;
			self.weaponRiotshield = weapon;
		}
	}
	current = self GetCurrentWeapon();
	self.hasRiotShieldEquipped = current.isRiotShield;
	if(self.hasRiotShield)
	{
		self clientfield::set_player_uimodel("hudItems.showDpadDown", 1);
		if(self.hasRiotShieldEquipped)
		{
			if(isdefined(level.var_ae633d88))
			{
				self notify("hash_f18d8aa6");
			}
			else
			{
				self zm_weapons::clear_stowed_weapon();
			}
		}
		else if(isdefined(level.var_ae633d88))
		{
			self notify("hash_f18d8aa6");
		}
		else
		{
			self zm_weapons::set_stowed_weapon(self.weaponRiotshield);
		}
	}
	else if(!isdefined(self.var_f6dca7a8))
	{
		self clientfield::set_player_uimodel("hudItems.showDpadDown", 0);
	}
	if(isdefined(level.var_ae633d88))
	{
		self notify("hash_f18d8aa6");
	}
	else
	{
		self SetStowedWeapon(level.weaponNone);
	}
	self RefreshShieldAttachment();
}

/*
	Name: player_take_riotshield
	Namespace: riotshield
	Checksum: 0x424F4353
	Offset: 0x1FC0
	Size: 0x1BC
	Parameters: 0
	Flags: None
	Line Number: 712
*/
function player_take_riotshield()
{
	self notify("destroy_riotshield");
	current = self GetCurrentWeapon();
	if(current.isRiotShield)
	{
		if(!self laststand::player_is_in_laststand())
		{
			new_primary = level.weaponNone;
			primaryWeapons = self getweaponslistprimaries();
			for(i = 0; i < primaryWeapons.size; i++)
			{
				if(!primaryWeapons[i].isRiotShield)
				{
					new_primary = primaryWeapons[i];
					break;
				}
			}
			if(new_primary == level.weaponNone)
			{
				self zm_weapons::give_fallback_weapon();
				self SwitchToWeaponImmediate();
			}
			else
			{
				self SwitchToWeaponImmediate();
			}
		}
	}
	self playsound("t8_shield_break");
	if(isdefined(self.weaponRiotshield))
	{
		self zm_equipment::take(self.weaponRiotshield);
	}
	else
	{
		self zm_equipment::take(level.weaponRiotshield);
	}
	self.hasRiotShield = 0;
	self.hasRiotShieldEquipped = 0;
}

