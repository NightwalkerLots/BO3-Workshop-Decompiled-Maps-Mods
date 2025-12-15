#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_powerup_ww_grenade;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace zm_perk_widows_wine;

/*
	Name: __init__sytem__
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x690
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 42
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_widows_wine", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x6D0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function __init__()
{
	enable_widows_wine_perk_for_level();
	return;
	.var_0 = undefined;
}

/*
	Name: enable_widows_wine_perk_for_level
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x6F0
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function enable_widows_wine_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_widowswine", "widows_wine", 4000, &"ZOMBIE_PERK_WIDOWSWINE", GetWeapon("zombie_perk_bottle_widows_wine"));
	zm_perks::register_perk_precache_func("specialty_widowswine", &widows_wine_precache);
	zm_perks::register_perk_clientfields("specialty_widowswine", &widows_wine_register_clientfield, &widows_wine_set_clientfield);
	zm_perks::register_perk_machine("specialty_widowswine", &widows_wine_perk_machine_setup);
	zm_perks::register_perk_host_migration_params("specialty_widowswine", "vending_widowswine", "widow_light");
	zm_perks::register_perk_threads("specialty_widowswine", &widows_wine_perk_activate, &widows_wine_perk_lost);
	if(isdefined(level.custom_widows_wine_perk_threads) && level.custom_widows_wine_perk_threads)
	{
		level thread [[level.custom_widows_wine_perk_threads]]();
	}
	init_widows_wine();
}

/*
	Name: widows_wine_precache
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x860
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 100
*/
function widows_wine_precache()
{
	if(isdefined(level.widows_wine_precache_override_func))
	{
		[[level.widows_wine_precache_override_func]]();
		return;
	}
	level._effect["widow_light"] = "zombie/fx_perk_widows_wine_zmb";
	level.machine_assets["specialty_widowswine"] = spawnstruct();
	level.machine_assets["specialty_widowswine"].weapon = GetWeapon("zombie_perk_bottle_widows_wine");
	level.machine_assets["specialty_widowswine"].off_model = "p7_zm_vending_widows_wine_off";
	level.machine_assets["specialty_widowswine"].on_model = "p7_zm_vending_widows_wine";
}

/*
	Name: widows_wine_register_clientfield
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x948
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 124
*/
function widows_wine_register_clientfield()
{
	clientfield::register("toplayer", "widows_wine_1p_contact_explosion", 1, 1, "counter");
	clientfield::register("actor", "widows_wine_wrapping", 1, 1, "int");
	clientfield::register("vehicle", "widows_wine_wrapping", 1, 1, "int");
}

/*
	Name: widows_wine_set_clientfield
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x9E8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 141
*/
function widows_wine_set_clientfield(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_widowswine", "widows_wine", "SetIconActive", state);
}

/*
	Name: widows_wine_perk_machine_setup
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0xA30
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 156
*/
function widows_wine_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_widow_jingle";
	use_trigger.script_string = "widowswine_perk";
	use_trigger.script_label = "mus_perks_widow_sting";
	use_trigger.target = "vending_widowswine";
	perk_machine.script_string = "widowswine_perk";
	perk_machine.targetname = "vending_widowswine";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "widowswine_perk";
	}
}

/*
	Name: init_widows_wine
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0xAF8
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 180
*/
function init_widows_wine()
{
	zm_utility::register_lethal_grenade_for_level("sticky_grenade_widows_wine");
	zm_spawner::register_zombie_damage_callback(&widows_wine_zombie_damage_response);
	zm_spawner::register_zombie_death_event_callback(&widows_wine_zombie_death_watch);
	zm::register_vehicle_damage_callback(&widows_wine_vehicle_damage_response);
	zm_perks::register_perk_damage_override_func(&widows_wine_damage_callback);
	level.w_widows_wine_grenade = GetWeapon("sticky_grenade_widows_wine");
	zm_utility::register_melee_weapon_for_level("knife_widows_wine");
	level.w_widows_wine_knife = GetWeapon("knife_widows_wine");
	zm_utility::register_melee_weapon_for_level("bowie_knife_widows_wine");
	level.w_widows_wine_bowie_knife = GetWeapon("bowie_knife_widows_wine");
	zm_utility::register_melee_weapon_for_level("sickle_knife_widows_wine");
	level.w_widows_wine_sickle_knife = GetWeapon("sickle_knife_widows_wine");
	return;
}

/*
	Name: widows_wine_perk_activate
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0xC68
	Size: 0x2C0
	Parameters: 0
	Flags: None
	Line Number: 207
*/
function widows_wine_perk_activate()
{
	if(level.w_widows_wine_grenade == self zm_utility::get_player_lethal_grenade())
	{
		return;
	}
	self.w_widows_wine_prev_grenade = self zm_utility::get_player_lethal_grenade();
	self TakeWeapon(self.w_widows_wine_prev_grenade);
	self GiveWeapon(level.w_widows_wine_grenade);
	self zm_utility::set_player_lethal_grenade(level.w_widows_wine_grenade);
	self.w_widows_wine_prev_knife = self zm_utility::get_player_melee_weapon();
	if(isdefined(self.widows_wine_knife_override))
	{
		self [[self.widows_wine_knife_override]]();
	}
	else
	{
		self TakeWeapon(self.w_widows_wine_prev_knife);
		if(self.w_widows_wine_prev_knife.name == "bowie_knife")
		{
			self GiveWeapon(level.w_widows_wine_bowie_knife);
			self zm_utility::set_player_melee_weapon(level.w_widows_wine_bowie_knife);
		}
		else if(self.w_widows_wine_prev_knife.name == "sickle_knife")
		{
			self GiveWeapon(level.w_widows_wine_sickle_knife);
			self zm_utility::set_player_melee_weapon(level.w_widows_wine_sickle_knife);
		}
		else
		{
			self GiveWeapon(level.w_widows_wine_knife);
			self zm_utility::set_player_melee_weapon(level.w_widows_wine_knife);
		}
	}
	/#
		fallback_initiated::Assert(!isdefined(self.check_override_wallbuy_purchase) || self.check_override_wallbuy_purchase == &widows_wine_override_wallbuy_purchase);
	#/
	/#
		fallback_initiated::Assert(!isdefined(self.check_override_melee_wallbuy_purchase) || self.check_override_melee_wallbuy_purchase == &widows_wine_override_melee_wallbuy_purchase);
	#/
	self.check_override_wallbuy_purchase = &widows_wine_override_wallbuy_purchase;
	self.check_override_melee_wallbuy_purchase = &widows_wine_override_melee_wallbuy_purchase;
	self thread grenade_bounce_monitor();
}

/*
	Name: widows_wine_contact_explosion
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0xF30
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 262
*/
function widows_wine_contact_explosion()
{
	self MagicGrenadeType(self.current_lethal_grenade, self.origin + VectorScale((0, 0, 1), 48), (0, 0, 0), 0);
	self SetWeaponAmmoClip(self.current_lethal_grenade, self GetWeaponAmmoClip(self.current_lethal_grenade) - 1);
	self clientfield::increment_to_player("widows_wine_1p_contact_explosion", 1);
}

/*
	Name: widows_wine_zombie_damage_response
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0xFE0
	Size: 0x210
	Parameters: 13
	Flags: None
	Line Number: 279
*/
function widows_wine_zombie_damage_response(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(isdefined(self.damageWeapon) && self.damageWeapon == level.w_widows_wine_grenade || (str_mod === "MOD_MELEE" && isdefined(e_player) && isPlayer(e_player) && e_player hasPerk("specialty_widowswine") && RandomFloat(1) <= 0.5))
	{
		if(!(isdefined(self.no_widows_wine) && self.no_widows_wine))
		{
			self thread zm_powerups::check_for_instakill(e_player, str_mod, str_hit_location);
			n_dist_sq = DistanceSquared(self.origin, v_hit_origin);
			if(n_dist_sq <= 10000)
			{
				self thread widows_wine_cocoon_zombie(e_player);
			}
			else
			{
				self thread widows_wine_slow_zombie(e_player);
			}
			if(!(isdefined(self.no_damage_points) && self.no_damage_points) && isdefined(e_player))
			{
				damage_type = "damage";
				e_player zm_score::player_add_points(damage_type, str_mod, str_hit_location, 0, undefined, w_weapon);
			}
			return 1;
		}
	}
	return 0;
}

/*
	Name: widows_wine_vehicle_damage_response
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x11F8
	Size: 0x168
	Parameters: 15
	Flags: None
	Line Number: 316
*/
function widows_wine_vehicle_damage_response(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, modelIndex, partName, vSurfaceNormal)
{
	if(isdefined(weapon) && weapon == level.w_widows_wine_grenade && (!(isdefined(self.b_widows_wine_cocoon) && self.b_widows_wine_cocoon)))
	{
		if(self.archetype === "parasite")
		{
			self thread vehicle_stuck_grenade_monitor();
		}
		self thread widows_wine_vehicle_behavior(eAttacker, weapon);
		if(!(isdefined(self.no_damage_points) && self.no_damage_points) && isdefined(eAttacker))
		{
			damage_type = "damage";
			eAttacker zm_score::player_add_points(damage_type, sMeansOfDeath, sHitLoc, 0, undefined, weapon);
		}
		return 0;
	}
	return iDamage;
}

/*
	Name: widows_wine_damage_callback
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x1368
	Size: 0x130
	Parameters: 10
	Flags: None
	Line Number: 345
*/
function widows_wine_damage_callback(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(sWeapon == level.w_widows_wine_grenade)
	{
		return 0;
	}
	if(self.current_lethal_grenade == level.w_widows_wine_grenade && self GetWeaponAmmoClip(self.current_lethal_grenade) > 0 && !self bgb::is_enabled("zm_bgb_burned_out"))
	{
		if(sMeansOfDeath == "MOD_MELEE" && isai(eAttacker) || (sMeansOfDeath == "MOD_EXPLOSIVE" && isVehicle(eAttacker)))
		{
			self thread widows_wine_contact_explosion();
			return iDamage;
		}
	}
}

/*
	Name: widows_wine_zombie_death_watch
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x14A0
	Size: 0x1B8
	Parameters: 1
	Flags: None
	Line Number: 371
*/
function widows_wine_zombie_death_watch(attacker)
{
	if(isdefined(self.b_widows_wine_cocoon) && self.b_widows_wine_cocoon || (isdefined(self.b_widows_wine_slow) && self.b_widows_wine_slow) && (!(isdefined(self.b_widows_wine_no_powerup) && self.b_widows_wine_no_powerup)))
	{
		if(isdefined(self.attacker) && isPlayer(self.attacker) && self.attacker hasPerk("specialty_widowswine"))
		{
			chance = 0.2;
			if(isdefined(self.damageWeapon) && self.damageWeapon == level.w_widows_wine_grenade)
			{
				chance = 0.15;
			}
			else if(isdefined(self.damageWeapon) && (self.damageWeapon == level.w_widows_wine_knife || self.damageWeapon == level.w_widows_wine_bowie_knife || self.damageWeapon == level.w_widows_wine_sickle_knife))
			{
				chance = 0.25;
			}
			if(RandomFloat(1) <= chance)
			{
				self.no_powerups = 1;
				level._powerup_timeout_override = &powerup_widows_wine_timeout;
				level thread zm_powerups::specific_powerup_drop("ww_grenade", self.origin, undefined, undefined, undefined, self.attacker);
				level._powerup_timeout_override = undefined;
			}
		}
	}
}

/*
	Name: powerup_widows_wine_timeout
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x1660
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 407
*/
function powerup_widows_wine_timeout()
{
	self endon("powerup_grabbed");
	self endon("death");
	self endon("powerup_reset");
	self zm_powerups::powerup_show(1);
	wait_time = 1;
	if(isdefined(level._powerup_timeout_custom_time))
	{
		time = [[level._powerup_timeout_custom_time]](self);
		if(time == 0)
		{
			return;
		}
		wait_time = time;
	}
	wait(wait_time);
	for(i = 20; i > 0; i--)
	{
		if(i % 2)
		{
			self zm_powerups::powerup_show(0);
		}
		else
		{
			self zm_powerups::powerup_show(1);
		}
		if(i > 15)
		{
			wait(0.3);
		}
		if(i > 10)
		{
			wait(0.25);
			continue;
		}
		if(i > 5)
		{
			wait(0.15);
			continue;
		}
		wait(0.1);
	}
	self notify("powerup_timedout");
	self zm_powerups::powerup_delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: widows_wine_cocoon_zombie_score
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x17E8
	Size: 0xD8
	Parameters: 3
	Flags: None
	Line Number: 466
*/
function widows_wine_cocoon_zombie_score(e_player, duration, max_score)
{
	self notify("widows_wine_cocoon_zombie_score");
	self endon("widows_wine_cocoon_zombie_score");
	self endon("death");
	if(!isdefined(self.ww_points_given))
	{
		self.ww_points_given = 0;
	}
	start_time = GetTime();
	end_time = start_time + duration * 1000;
	while(GetTime() < end_time && self.ww_points_given < max_score)
	{
		e_player zm_score::add_to_player_score(10);
		wait(duration / max_score);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: widows_wine_cocoon_zombie
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x18C8
	Size: 0x1B8
	Parameters: 1
	Flags: None
	Line Number: 496
*/
function widows_wine_cocoon_zombie(e_player)
{
	self notify("widows_wine_cocoon");
	self endon("widows_wine_cocoon");
	if(isdefined(self.kill_on_wine_coccon) && self.kill_on_wine_coccon)
	{
		self kill();
	}
	if(!(isdefined(self.b_widows_wine_cocoon) && self.b_widows_wine_cocoon))
	{
		self.b_widows_wine_cocoon = 1;
		self.e_widows_wine_player = e_player;
		if(isdefined(self.widows_wine_cocoon_fraction_rate))
		{
			widows_wine_cocoon_fraction_rate = self.widows_wine_cocoon_fraction_rate;
		}
		else
		{
			widows_wine_cocoon_fraction_rate = 0.1;
		}
		self ASMSetAnimationRate(widows_wine_cocoon_fraction_rate);
		self clientfield::set("widows_wine_wrapping", 1);
	}
	if(isdefined(e_player))
	{
		self thread widows_wine_cocoon_zombie_score(e_player, 16, 10);
	}
	self util::waittill_any_timeout(16, "death", "widows_wine_cocoon");
	if(!isdefined(self))
	{
		return;
	}
	self ASMSetAnimationRate(1);
	self clientfield::set("widows_wine_wrapping", 0);
	if(isalive(self))
	{
		self.b_widows_wine_cocoon = 0;
	}
}

/*
	Name: widows_wine_slow_zombie
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x1A88
	Size: 0x1B0
	Parameters: 1
	Flags: None
	Line Number: 546
*/
function widows_wine_slow_zombie(e_player)
{
	self notify("widows_wine_slow");
	self endon("widows_wine_slow");
	if(isdefined(self.b_widows_wine_cocoon) && self.b_widows_wine_cocoon)
	{
		self thread widows_wine_cocoon_zombie(e_player);
		return;
	}
	if(isdefined(e_player))
	{
		self thread widows_wine_cocoon_zombie_score(e_player, 12, 6);
	}
	if(!(isdefined(self.b_widows_wine_slow) && self.b_widows_wine_slow))
	{
		if(isdefined(self.widows_wine_slow_fraction_rate))
		{
			widows_wine_slow_fraction_rate = self.widows_wine_slow_fraction_rate;
		}
		else
		{
			widows_wine_slow_fraction_rate = 0.7;
		}
		self.b_widows_wine_slow = 1;
		self ASMSetAnimationRate(widows_wine_slow_fraction_rate);
		self clientfield::set("widows_wine_wrapping", 1);
	}
	self util::waittill_any_timeout(12, "death", "widows_wine_slow");
	if(!isdefined(self))
	{
		return;
	}
	self ASMSetAnimationRate(1);
	self clientfield::set("widows_wine_wrapping", 0);
	if(isalive(self))
	{
		self.b_widows_wine_slow = 0;
	}
}

/*
	Name: vehicle_stuck_grenade_monitor
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x1C40
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 596
*/
function vehicle_stuck_grenade_monitor()
{
	self endon("death");
	self waittill("grenade_stuck", e_grenade);
	e_grenade detonate();
}

/*
	Name: grenade_bounce_monitor
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x1C88
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 613
*/
function grenade_bounce_monitor()
{
	self endon("disconnect");
	self endon("stop_widows_wine");
	while(1)
	{
		self waittill("grenade_fire", e_grenade);
		e_grenade thread grenade_bounces();
	}
}

/*
	Name: grenade_bounces
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x1CE8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 634
*/
function grenade_bounces()
{
	self endon("explode");
	self waittill("grenade_bounce", pos, normal, e_target);
	if(isdefined(e_target))
	{
		if(e_target.archetype === "parasite" || e_target.archetype === "raps")
		{
			self detonate();
		}
	}
}

/*
	Name: widows_wine_vehicle_behavior
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x1D88
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 657
*/
function widows_wine_vehicle_behavior(attacker, weapon)
{
	self endon("death");
	self.b_widows_wine_cocoon = 1;
	if(isdefined(self.archetype))
	{
		if(self.archetype == "raps")
		{
			self clientfield::set("widows_wine_wrapping", 1);
			self._override_raps_combat_speed = 5;
			wait(6);
			self DoDamage(self.health + 1000, self.origin, attacker, undefined, "none", "MOD_EXPLOSIVE", 0, weapon);
		}
		else if(self.archetype == "parasite")
		{
			wait(0.05);
			self DoDamage(self.maxhealth, self.origin);
		}
	}
}

/*
	Name: widows_wine_perk_lost
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x1EA0
	Size: 0x2A0
	Parameters: 3
	Flags: None
	Line Number: 688
*/
function widows_wine_perk_lost(b_pause, str_perk, str_result)
{
	self notify("stop_widows_wine");
	self endon("death");
	if(self laststand::player_is_in_laststand())
	{
		self waittill("player_revived");
		if(self hasPerk("specialty_widowswine"))
		{
			return;
		}
	}
	self.check_override_wallbuy_purchase = undefined;
	self TakeWeapon(level.w_widows_wine_grenade);
	if(isdefined(self.w_widows_wine_prev_grenade))
	{
		self.lsgsar_lethal = self.w_widows_wine_prev_grenade;
		self GiveWeapon(self.w_widows_wine_prev_grenade);
		self zm_utility::set_player_lethal_grenade(self.w_widows_wine_prev_grenade);
	}
	else
	{
		self zm_utility::init_player_lethal_grenade();
	}
	grenade = self zm_utility::get_player_lethal_grenade();
	self GiveStartAmmo(grenade);
	if(isdefined(self.current_melee_weapon) && !IsSubStr(self.current_melee_weapon.name, "widows_wine"))
	{
		self.w_widows_wine_prev_knife = self.current_melee_weapon;
	}
	else if(self.w_widows_wine_prev_knife.name == "bowie_knife")
	{
		self TakeWeapon(level.w_widows_wine_bowie_knife);
	}
	else if(self.w_widows_wine_prev_knife.name == "sickle_knife")
	{
		self TakeWeapon(level.w_widows_wine_sickle_knife);
	}
	else
	{
		self TakeWeapon(level.w_widows_wine_knife);
	}
	if(isdefined(self.w_widows_wine_prev_knife))
	{
		self GiveWeapon(self.w_widows_wine_prev_knife);
		self zm_utility::set_player_melee_weapon(self.w_widows_wine_prev_knife);
	}
	else
	{
		self zm_utility::init_player_melee_weapon();
	}
}

/*
	Name: widows_wine_override_wallbuy_purchase
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x2148
	Size: 0xA0
	Parameters: 2
	Flags: None
	Line Number: 751
*/
function widows_wine_override_wallbuy_purchase(weapon, wallbuy)
{
	if(zm_utility::is_lethal_grenade(weapon))
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
	return 0;
}

/*
	Name: widows_wine_override_melee_wallbuy_purchase
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x21F0
	Size: 0x2EC
	Parameters: 7
	Flags: None
	Line Number: 779
*/
function widows_wine_override_melee_wallbuy_purchase(vo_dialog_id, flourish_weapon, weapon, ballistic_weapon, ballistic_upgraded_weapon, flourish_fn, wallbuy)
{
	if(zm_utility::is_melee_weapon(weapon))
	{
		if(self.w_widows_wine_prev_knife != weapon)
		{
			cost = wallbuy.stub.cost;
			if(self zm_score::can_player_purchase(cost))
			{
				if(wallbuy.first_time_triggered == 0)
				{
					model = GetEnt(wallbuy.target, "targetname");
					if(isdefined(model))
					{
						model thread zm_melee_weapon::melee_weapon_show(self);
					}
					else if(isdefined(wallbuy.clientFieldName))
					{
						level clientfield::set(wallbuy.clientFieldName, 1);
					}
					wallbuy.first_time_triggered = 1;
					if(isdefined(wallbuy.stub))
					{
						wallbuy.stub.first_time_triggered = 1;
					}
				}
				self zm_score::minus_to_player_score(cost);
				/#
					fallback_initiated::Assert(weapon.name == "Dev Block strings are not supported" || weapon.name == "Dev Block strings are not supported");
				#/
				self.w_widows_wine_prev_knife = weapon;
				if(self.w_widows_wine_prev_knife.name == "bowie_knife")
				{
					self thread zm_melee_weapon::give_melee_weapon(vo_dialog_id, flourish_weapon, weapon, ballistic_weapon, ballistic_upgraded_weapon, flourish_fn, wallbuy);
				}
				else if(self.w_widows_wine_prev_knife.name == "sickle_knife")
				{
					self thread zm_melee_weapon::give_melee_weapon(vo_dialog_id, flourish_weapon, weapon, ballistic_weapon, ballistic_upgraded_weapon, flourish_fn, wallbuy);
				}
			}
			else
			{
				zm_utility::play_sound_on_ent("no_purchase");
				self zm_audio::create_and_play_dialog("general", "outofmoney", 1);
			}
		}
		return 1;
	}
	return 0;
}

