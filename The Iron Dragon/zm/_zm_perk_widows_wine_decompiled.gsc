#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerup_ww_grenade;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace zm_perk_widows_wine;

/*
	Name: __init__sytem__
	Namespace: zm_perk_widows_wine
	Checksum: 0x9D6728D8
	Offset: 0x5D0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 30
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_widows_wine", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_widows_wine
	Checksum: 0x4AE71254
	Offset: 0x618
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 45
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
	}
}

/*
	Name: __main__
	Namespace: zm_perk_widows_wine
	Checksum: 0x712DB215
	Offset: 0x690
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 68
*/
function __main__()
{
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_factory")
	{
		return;
	}
	if(isdefined(1) && 1)
	{
		function_9882031c();
	}
}

/*
	Name: enable_widows_wine_perk_for_level
	Namespace: zm_perk_widows_wine
	Checksum: 0xDC37E26
	Offset: 0x708
	Size: 0x3E0
	Parameters: 0
	Flags: None
	Line Number: 91
*/
function enable_widows_wine_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_widowswine", "widows_wine", 4000, &"ZOMBIE_PERK_WIDOWSWINE", GetWeapon("zombie_perk_bottle_widows_wine"));
	zm_perks::register_perk_precache_func("specialty_widowswine", &widows_wine_precache);
	zm_perks::register_perk_clientfields("specialty_widowswine", &widows_wine_register_clientfield, &widows_wine_set_clientfield);
	zm_perks::register_perk_machine("specialty_widowswine", &widows_wine_perk_machine_setup);
	zm_perks::register_perk_host_migration_params("specialty_widowswine", "vending_widowswine", "specialty_widowswine");
	zm_perks::register_perk_threads("specialty_widowswine", &function_de9128af, &function_3e0cb385);
	if(namespace_b8afaefc::function_fc92a42d() && (level.script == "zm_tomb" || level.script == "zm_sumpf"))
	{
		zm_perks::register_perk_machine_power_override("specialty_widowswine", &function_731a1985);
	}
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
	else if(level.script == "zm_asylum")
	{
		namespace_b8afaefc::function_8fd06793((637, 774, 226), VectorScale((0, -1, 0), 90), "specialty_widowswine", "p7_zm_vending_widows_wine");
	}
	else if(level.script == "zm_sumpf")
	{
		namespace_b8afaefc::function_8fd06793((8952, 1770, -656), VectorScale((0, -1, 0), 45), "specialty_widowswine", "p7_zm_vending_widows_wine");
	}
	else if(level.script == "zm_theater")
	{
		namespace_b8afaefc::function_8fd06793((1062, -16, 170), VectorScale((0, 1, 0), 180), "specialty_widowswine", "p7_zm_vending_widows_wine");
	}
	else if(level.script == "zm_tomb")
	{
		namespace_b8afaefc::function_8fd06793((-21, 464, 326), VectorScale((0, 1, 0), 90), "specialty_widowswine", "p7_zm_vending_widows_wine");
		return;
	}
}

/*
	Name: widows_wine_precache
	Namespace: zm_perk_widows_wine
	Checksum: 0x7F22BACA
	Offset: 0xAF0
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 144
*/
function widows_wine_precache()
{
	level._effect["specialty_widowswine"] = "harry/zm_perks/fx_perk_widows_wine_light";
	level.machine_assets["specialty_widowswine"] = spawnstruct();
	level.machine_assets["specialty_widowswine"].weapon = GetWeapon("zombie_perk_bottle_widows_wine");
	level.machine_assets["specialty_widowswine"].off_model = "p7_zm_vending_widows_wine";
	level.machine_assets["specialty_widowswine"].on_model = "p7_zm_vending_widows_wine";
}

/*
	Name: widows_wine_register_clientfield
	Namespace: zm_perk_widows_wine
	Checksum: 0x5F7A3976
	Offset: 0xBB8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 163
*/
function widows_wine_register_clientfield()
{
	clientfield::register("clientuimodel", "hudItems.perks.widows_wine", 1, 2, "int");
}

/*
	Name: widows_wine_set_clientfield
	Namespace: zm_perk_widows_wine
	Checksum: 0x5254A461
	Offset: 0xBF8
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 178
*/
function widows_wine_set_clientfield(n_state)
{
	if(n_state != 0 && (level namespace_b8afaefc::function_9f353429("specialty_widowswine") || self namespace_b8afaefc::function_9f353429("specialty_widowswine")))
	{
		n_state = 2;
	}
	self clientfield::set_player_uimodel("hudItems.perks.widows_wine", n_state);
	return;
	ERROR: Bad function call
}

/*
	Name: widows_wine_perk_machine_setup
	Namespace: zm_perk_widows_wine
	Checksum: 0xFA03CED2
	Offset: 0xC88
	Size: 0x100
	Parameters: 4
	Flags: None
	Line Number: 199
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
	perk_machine thread namespace_b8afaefc::function_2a628bd("specialty_widowswine", "i_fxt_zmb_perk_widow", (0.949019, 0.121268, 0));
	return;
	ERROR: Bad function call
}

/*
	Name: function_de9128af
	Namespace: zm_perk_widows_wine
	Checksum: 0xCB89C2C1
	Offset: 0xD90
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 226
*/
function function_de9128af()
{
	namespace_b8afaefc::function_ffb18d9f("specialty_widowswine", "3.0.4");
	if(level namespace_b8afaefc::function_9f353429("specialty_widowswine"))
	{
		self namespace_b8afaefc::function_7932e598("specialty_widowswine");
	}
	if(self namespace_b8afaefc::function_9f353429("specialty_widowswine"))
	{
		return;
	}
	self thread function_3770ffae(1);
}

/*
	Name: function_3e0cb385
	Namespace: zm_perk_widows_wine
	Checksum: 0xA08F591D
	Offset: 0xE40
	Size: 0x38
	Parameters: 3
	Flags: None
	Line Number: 250
*/
function function_3e0cb385(b_pause, str_perk, str_result)
{
	self thread function_3770ffae(0);
}

/*
	Name: function_731a1985
	Namespace: zm_perk_widows_wine
	Checksum: 0x48442821
	Offset: 0xE80
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 265
*/
function function_731a1985()
{
	namespace_b8afaefc::function_cfe6acb0("specialty_widowswine");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_9882031c
	Namespace: zm_perk_widows_wine
	Checksum: 0x7FB27B7
	Offset: 0xEA8
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 282
*/
function function_9882031c()
{
	clientfield::register("toplayer", "widows_wine_1p_contact_explosion", 1, 1, "counter");
	clientfield::register("actor", "widows_wine_wrapping", 1, 1, "int");
	clientfield::register("vehicle", "widows_wine_wrapping", 1, 1, "int");
	level._effect["widows_wine_wrap"] = "zombie/fx_widows_wrap_torso_zmb";
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
	if(isdefined(1) && 1)
	{
		namespace_b8afaefc::function_38f810ea("specialty_widowswine");
		return;
	}
}

/*
	Name: function_3770ffae
	Namespace: zm_perk_widows_wine
	Checksum: 0x723C9AE6
	Offset: 0x10E8
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 317
*/
function function_3770ffae(enabled)
{
	if(isdefined(enabled) && enabled)
	{
		self widows_wine_perk_activate();
		continue;
	}
	widows_wine_perk_lost();
}

/*
	Name: widows_wine_perk_activate
	Namespace: zm_perk_widows_wine
	Checksum: 0xBD44D7AD
	Offset: 0x1140
	Size: 0x310
	Parameters: 0
	Flags: None
	Line Number: 337
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
	else if(self.w_widows_wine_prev_knife.name != "t7_one_inch_punch_upgraded" && self.w_widows_wine_prev_knife.name != "t7_one_inch_punch" && self.w_widows_wine_prev_knife.name != "t6_tazer_knuckles")
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
			continue;
		}
		self GiveWeapon(level.w_widows_wine_knife);
		self zm_utility::set_player_melee_weapon(level.w_widows_wine_knife);
	}
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
	Checksum: 0x7442E61
	Offset: 0x1458
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 390
*/
function widows_wine_contact_explosion()
{
	self MagicGrenadeType(self.current_lethal_grenade, self.origin + VectorScale((0, 0, 1), 48), (0, 0, 0), 0);
	self SetWeaponAmmoClip(self.current_lethal_grenade, self GetWeaponAmmoClip(self.current_lethal_grenade) - 1);
	self clientfield::increment_to_player("widows_wine_1p_contact_explosion", 1);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: widows_wine_zombie_damage_response
	Namespace: zm_perk_widows_wine
	Checksum: 0x6BCC3E4B
	Offset: 0x1508
	Size: 0x210
	Parameters: 13
	Flags: None
	Line Number: 410
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
}

/*
	Name: widows_wine_vehicle_damage_response
	Namespace: zm_perk_widows_wine
	Checksum: 0x630EB547
	Offset: 0x1720
	Size: 0x168
	Parameters: 15
	Flags: None
	Line Number: 445
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
	Checksum: 0x95295EB
	Offset: 0x1890
	Size: 0x130
	Parameters: 10
	Flags: None
	Line Number: 474
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
	Checksum: 0x58DBE821
	Offset: 0x19C8
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 500
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
	Checksum: 0xB1A0AEEA
	Offset: 0x1B70
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 536
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
}

/*
	Name: widows_wine_cocoon_zombie_score
	Namespace: zm_perk_widows_wine
	Checksum: 0xD65DB613
	Offset: 0x1CF8
	Size: 0xD8
	Parameters: 3
	Flags: None
	Line Number: 591
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
	Checksum: 0xBFF416EE
	Offset: 0x1DD8
	Size: 0x198
	Parameters: 1
	Flags: None
	Line Number: 619
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
	Checksum: 0x2D3C81D7
	Offset: 0x1F78
	Size: 0x198
	Parameters: 1
	Flags: None
	Line Number: 667
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
	Checksum: 0x871976DE
	Offset: 0x2118
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 715
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
	Checksum: 0xA13AA4C8
	Offset: 0x2160
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 732
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
	Checksum: 0x925DF083
	Offset: 0x21C0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 753
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
	Checksum: 0x9FB4D44F
	Offset: 0x2260
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 776
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
	Checksum: 0x8889406E
	Offset: 0x2378
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 807
*/
function widows_wine_perk_lost()
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
}

/*
	Name: widows_wine_override_wallbuy_purchase
	Namespace: zm_perk_widows_wine
	Checksum: 0xAB74EEF3
	Offset: 0x2578
	Size: 0x1C8
	Parameters: 2
	Flags: None
	Line Number: 856
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
	Checksum: 0x17F2442A
	Offset: 0x2748
	Size: 0x284
	Parameters: 7
	Flags: None
	Line Number: 898
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

