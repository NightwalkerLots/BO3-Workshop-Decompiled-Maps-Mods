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
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_powerup_ww_grenade;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace zm_perk_widows_wine;

/*
	Name: __init__sytem__
	Namespace: zm_perk_widows_wine
	Checksum: 0x3DEFDC64
	Offset: 0x6D0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 41
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_widows_wine", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_widows_wine
	Checksum: 0x168C8FA2
	Offset: 0x710
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function __init__()
{
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_factory")
	{
		return;
	}
	if(isdefined(1) && 1)
	{
		enable_widows_wine_perk_for_level();
		return;
	}
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: enable_widows_wine_perk_for_level
	Namespace: zm_perk_widows_wine
	Checksum: 0x5038F036
	Offset: 0x788
	Size: 0x2B0
	Parameters: 0
	Flags: None
	Line Number: 82
*/
function enable_widows_wine_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_widowswine", "widows_wine", 4000, &"ZOMBIE_PERK_WIDOWSWINE", GetWeapon("zombie_perk_bottle_widows_wine"));
	zm_perks::register_perk_precache_func("specialty_widowswine", &widows_wine_precache);
	zm_perks::register_perk_clientfields("specialty_widowswine", &widows_wine_register_clientfield, &widows_wine_set_clientfield);
	zm_perks::register_perk_machine("specialty_widowswine", &widows_wine_perk_machine_setup);
	zm_perks::register_perk_host_migration_params("specialty_widowswine", "vending_widowswine", "specialty_widowswine");
	zm_perks::register_perk_threads("specialty_widowswine", &function_de9128af, &function_3e0cb385);
	clientfield::register("toplayer", "widows_wine_1p_contact_explosion", 1, 1, "counter");
	function_a722637d();
	if(level.script == "zm_castle")
	{
		namespace_b8afaefc::function_8fd06793((-161, 2479, 912), (0, 0, 0), "specialty_widowswine", "p7_zm_vending_widows_wine");
	}
	else if(level.script == "zm_island")
	{
		namespace_b8afaefc::function_8fd06793((831, -985, -453), (0, 0, 0), "specialty_widowswine", "p7_zm_vending_widows_wine");
	}
	else if(level.script == "zm_stalingrad")
	{
		namespace_b8afaefc::function_8fd06793((1721, 3395, -117), (0, 0, 0), "specialty_widowswine", "p7_zm_vending_widows_wine");
	}
	else if(level.script == "zm_genesis")
	{
		namespace_b8afaefc::function_8fd06793((50, -9144, -1479), VectorScale((0, 1, 0), 230), "specialty_widowswine", "p7_zm_vending_widows_wine");
	}
}

/*
	Name: widows_wine_precache
	Namespace: zm_perk_widows_wine
	Checksum: 0xB4880CF7
	Offset: 0xA40
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function widows_wine_precache()
{
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_zod" || script == "zm_genesis")
	{
		level._effect["specialty_widowswine"] = "zombie/fx_perk_widows_wine_zmb";
	}
	else if(script == "zm_factory")
	{
		level._effect["specialty_widowswine"] = "zombie/fx_perk_juggernaut_factory_zmb";
	}
	else if(namespace_b8afaefc::function_fc92a42d())
	{
		level._effect["specialty_widowswine"] = "zombie/fx_perk_juggernaut_zmb";
		continue;
	}
	level._effect["specialty_widowswine"] = "zombie/fx_perk_juggernaut_factory_zmb";
	level._effect["widows_wine_wrap"] = "zombie/fx_widows_wrap_torso_zmb";
	level.machine_assets["specialty_widowswine"] = spawnstruct();
	level.machine_assets["specialty_widowswine"].weapon = GetWeapon("zombie_perk_bottle_widows_wine");
	level.machine_assets["specialty_widowswine"].off_model = "p7_zm_vending_widows_wine";
	level.machine_assets["specialty_widowswine"].on_model = "p7_zm_vending_widows_wine";
}

/*
	Name: widows_wine_register_clientfield
	Namespace: zm_perk_widows_wine
	Checksum: 0x6916FA4A
	Offset: 0xC00
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 154
*/
function widows_wine_register_clientfield()
{
	clientfield::register("actor", "widows_wine_wrapping", 1, 1, "int");
	clientfield::register("vehicle", "widows_wine_wrapping", 1, 1, "int");
}

/*
	Name: widows_wine_set_clientfield
	Namespace: zm_perk_widows_wine
	Checksum: 0x806E1991
	Offset: 0xC70
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 170
*/
function widows_wine_set_clientfield(state)
{
}

/*
	Name: widows_wine_perk_machine_setup
	Namespace: zm_perk_widows_wine
	Checksum: 0x5A097205
	Offset: 0xC88
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 184
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
	Name: function_de9128af
	Namespace: zm_perk_widows_wine
	Checksum: 0x46EB2E59
	Offset: 0xD50
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 208
*/
function function_de9128af(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_widowswine", "t6_specialty_widowswine");
	self notify("specialty_widowswine" + "_start");
	self thread widows_wine_perk_activate();
}

/*
	Name: function_3e0cb385
	Namespace: zm_perk_widows_wine
	Checksum: 0x6D7ADC03
	Offset: 0xDD0
	Size: 0x80
	Parameters: 3
	Flags: None
	Line Number: 225
*/
function function_3e0cb385(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_widowswine");
	self notify("perk_lost", str_perk);
	self notify("specialty_widowswine" + "_stop");
	self thread widows_wine_perk_lost();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f358a46d
	Namespace: zm_perk_widows_wine
	Checksum: 0x3ED2A073
	Offset: 0xE58
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 245
*/
function function_f358a46d()
{
	var_e0057640 = GetEntArray("vending_widowswine", "targetname");
	foreach(perk_machine in var_e0057640)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "p7_zm_vending_widows_wine")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("widows_wine");
		}
	}
}

/*
	Name: function_a722637d
	Namespace: zm_perk_widows_wine
	Checksum: 0xF5BFEE5
	Offset: 0xF70
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 268
*/
function function_a722637d()
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
}

/*
	Name: widows_wine_perk_activate
	Namespace: zm_perk_widows_wine
	Checksum: 0x79AFF9FA
	Offset: 0x10A8
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 292
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
		continue;
	}
	self TakeWeapon(self.w_widows_wine_prev_knife);
	if(self.w_widows_wine_prev_knife.name == "bowie_knife")
	{
		self GiveWeapon(level.w_widows_wine_bowie_knife);
		self zm_utility::set_player_melee_weapon(level.w_widows_wine_bowie_knife);
		continue;
	}
	self GiveWeapon(level.w_widows_wine_knife);
	self zm_utility::set_player_melee_weapon(level.w_widows_wine_knife);
	/#
		Assert(!isdefined(self.check_override_wallbuy_purchase) || self.check_override_wallbuy_purchase == &widows_wine_override_wallbuy_purchase);
	#/
	/#
		Assert(!isdefined(self.check_override_melee_wallbuy_purchase) || self.check_override_melee_wallbuy_purchase == &widows_wine_override_melee_wallbuy_purchase);
	#/
	self.check_override_wallbuy_purchase = &widows_wine_override_wallbuy_purchase;
	self.check_override_melee_wallbuy_purchase = &widows_wine_override_melee_wallbuy_purchase;
	self thread grenade_bounce_monitor();
}

/*
	Name: widows_wine_contact_explosion
	Namespace: zm_perk_widows_wine
	Checksum: 0x488033D4
	Offset: 0x1310
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 338
*/
function widows_wine_contact_explosion()
{
	self MagicGrenadeType(self.current_lethal_grenade, self.origin + VectorScale((0, 0, 1), 48), (0, 0, 0), 0);
	self SetWeaponAmmoClip(self.current_lethal_grenade, self GetWeaponAmmoClip(self.current_lethal_grenade) - 1);
	self clientfield::increment_to_player("widows_wine_1p_contact_explosion", 1);
	return;
	continue;
}

/*
	Name: widows_wine_zombie_damage_response
	Namespace: zm_perk_widows_wine
	Checksum: 0x814C0D70
	Offset: 0x13C0
	Size: 0x210
	Parameters: 13
	Flags: None
	Line Number: 357
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
				continue;
			}
			self thread widows_wine_slow_zombie(e_player);
			if(!(isdefined(self.no_damage_points) && self.no_damage_points) && isdefined(e_player))
			{
				damage_type = "damage";
				e_player zm_score::player_add_points(damage_type, str_mod, str_hit_location, 0, undefined, w_weapon);
			}
			return 1;
		}
	}
	return 0;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: widows_wine_vehicle_damage_response
	Namespace: zm_perk_widows_wine
	Checksum: 0x3804EFFD
	Offset: 0x15D8
	Size: 0x168
	Parameters: 15
	Flags: None
	Line Number: 394
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
	Checksum: 0x6A700C9D
	Offset: 0x1748
	Size: 0x130
	Parameters: 10
	Flags: None
	Line Number: 423
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
	Checksum: 0x13B41D50
	Offset: 0x1880
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 449
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
			else if(isdefined(self.damageWeapon) && (self.damageWeapon == level.w_widows_wine_knife || self.damageWeapon == level.w_widows_wine_bowie_knife))
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
	Checksum: 0x8916F839
	Offset: 0x1A28
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 485
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
			continue;
		}
		self zm_powerups::powerup_show(1);
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
}

/*
	Name: widows_wine_cocoon_zombie_score
	Namespace: zm_perk_widows_wine
	Checksum: 0x5E5832DF
	Offset: 0x1BB0
	Size: 0xD8
	Parameters: 3
	Flags: None
	Line Number: 541
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
}

/*
	Name: widows_wine_cocoon_zombie
	Namespace: zm_perk_widows_wine
	Checksum: 0x3ACC398B
	Offset: 0x1C90
	Size: 0x1A8
	Parameters: 1
	Flags: None
	Line Number: 569
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
			continue;
		}
		widows_wine_cocoon_fraction_rate = 0.1;
		self ASMSetAnimationRate(widows_wine_cocoon_fraction_rate);
		self clientfield::set("widows_wine_wrapping", 1);
	}
	if(isdefined(e_player))
	{
		self thread widows_wine_cocoon_zombie_score(e_player, 16, 10);
	}
	self util::waittill_any_timeout(16, "death");
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
	Checksum: 0x49E0476A
	Offset: 0x1E40
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 617
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
			continue;
		}
		widows_wine_slow_fraction_rate = 0.7;
		self.b_widows_wine_slow = 1;
		self ASMSetAnimationRate(widows_wine_slow_fraction_rate);
		self clientfield::set("widows_wine_wrapping", 1);
	}
	self util::waittill_any_timeout(12, "death");
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
	Checksum: 0x192BAA3C
	Offset: 0x1FE8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 665
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
	Checksum: 0x10CBA02A
	Offset: 0x2030
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 682
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
	Checksum: 0xD717FB96
	Offset: 0x2090
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 703
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
	Checksum: 0xBB954F7D
	Offset: 0x2130
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 726
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
	Checksum: 0x4E02E77A
	Offset: 0x2248
	Size: 0x220
	Parameters: 3
	Flags: None
	Line Number: 757
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
		continue;
	}
	self zm_utility::init_player_lethal_grenade();
	grenade = self zm_utility::get_player_lethal_grenade();
	self GiveStartAmmo(grenade);
	if(self.w_widows_wine_prev_knife.name == "bowie_knife")
	{
		self TakeWeapon(level.w_widows_wine_bowie_knife);
		continue;
	}
	self TakeWeapon(level.w_widows_wine_knife);
	if(isdefined(self.w_widows_wine_prev_knife))
	{
		self GiveWeapon(self.w_widows_wine_prev_knife);
		self zm_utility::set_player_melee_weapon(self.w_widows_wine_prev_knife);
		continue;
	}
	self zm_utility::init_player_melee_weapon();
	self notify("perk_lost", str_perk);
	return;
}

/*
	Name: widows_wine_override_wallbuy_purchase
	Namespace: zm_perk_widows_wine
	Checksum: 0x348ADD60
	Offset: 0x2470
	Size: 0x1C8
	Parameters: 2
	Flags: None
	Line Number: 808
*/
function widows_wine_override_wallbuy_purchase(weapon, wallbuy)
{
	if(zm_utility::is_lethal_grenade(weapon))
	{
		ammo_cost = zm_weapons::get_ammo_cost(weapon);
		cost = zm_weapons::get_weapon_cost(weapon);
		if(self zm_score::can_player_purchase(ammo_cost))
		{
			if(wallbuy.first_time_triggered == 0)
			{
				wallbuy zm_weapons::show_all_weapon_buys(self, cost, ammo_cost, 1);
			}
			if(self getammocount(self.current_lethal_grenade) < self.current_lethal_grenade.maxAmmo)
			{
				self zm_score::minus_to_player_score(ammo_cost);
				self zm_utility::play_sound_on_ent("purchase");
				self giveMaxAmmo(self.current_lethal_grenade);
				continue;
			}
		}
		wallbuy zm_utility::play_sound_on_ent("no_purchase");
		if(isdefined(level.custom_generic_deny_vo_func))
		{
			self [[level.custom_generic_deny_vo_func]]();
			continue;
		}
		self zm_audio::create_and_play_dialog("general", "outofmoney");
		return 1;
	}
	return 0;
}

/*
	Name: widows_wine_override_melee_wallbuy_purchase
	Namespace: zm_perk_widows_wine
	Checksum: 0x2E061547
	Offset: 0x2640
	Size: 0x284
	Parameters: 7
	Flags: None
	Line Number: 850
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
					Assert(weapon.name == "Dev Block strings are not supported");
				#/
				self.w_widows_wine_prev_knife = weapon;
				if(self.w_widows_wine_prev_knife.name == "bowie_knife")
				{
					self thread zm_melee_weapon::give_melee_weapon(vo_dialog_id, flourish_weapon, weapon, ballistic_weapon, ballistic_upgraded_weapon, flourish_fn, wallbuy);
					continue;
				}
			}
			zm_utility::play_sound_on_ent("no_purchase");
			self zm_audio::create_and_play_dialog("general", "outofmoney", 1);
		}
		return 1;
	}
	return 0;
}

