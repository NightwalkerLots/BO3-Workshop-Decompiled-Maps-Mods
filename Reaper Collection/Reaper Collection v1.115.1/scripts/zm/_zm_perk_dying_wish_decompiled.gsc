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

#namespace namespace_f4272f8a;

/*
	Name: __init__sytem__
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0x690
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 46
*/
function autoexec __init__sytem__()
{
	system::register("dying_wish", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0x6D0
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
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0x6F0
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_dyingwish", "dyingwish", 4000, &"ZM_REAP_MOD_PERK_DYING_WISH", GetWeapon("zombie_perk_bottle_dying_wish"));
	zm_perks::register_perk_precache_func("specialty_dyingwish", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_dyingwish", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_dyingwish", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_dyingwish", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_dyingwish", "Dying Wish", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_dyingwish", &"ZM_REAP_MOD_PERK_DYING_WISH_DB", 1500, "Dying Wish", "dyingwish");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_dyingwish"] = 1;
	level thread function_e915bdd0();
	zm_spawner::register_zombie_damage_callback(&function_5889c305);
	visionset_mgr::register_info("visionset", "zm_dying_wish_sight", 1, 110, 31, 1, &visionset_mgr::ramp_in_out_thread_per_player, 0);
	visionset_mgr::register_info("overlay", "zm_dying_wish_sight", 1, 110, 1, 1);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0x930
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_dyingwish"] = spawnstruct();
	level.machine_assets["specialty_dyingwish"].weapon = GetWeapon("zombie_perk_bottle_dying_wish");
	level.machine_assets["specialty_dyingwish"].off_model = "cz_vending_dying_wish_new_off";
	level.machine_assets["specialty_dyingwish"].on_model = "cz_vending_dying_wish_new";
}

/*
	Name: function_19157aff
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0x9D8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 124
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0x9E8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 138
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_dyingwish", "dyingwish", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0xA30
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 153
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_dyingwish";
	use_trigger.script_label = "";
	use_trigger.target = "Dying Wish";
	perk_machine.script_string = "specialty_dyingwish";
	perk_machine.targetname = "Dying Wish";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_dyingwish";
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0xAF8
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
	self.disabled_perks["specialty_dyingwish"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_dyingwish"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0xB80
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 207
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_dyingwish"] = 0;
	self.var_b5c2c258["specialty_dyingwish"] = undefined;
	self.var_d6aef449["specialty_dyingwish"] = undefined;
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_e915bdd0
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0xBE0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 227
*/
function function_e915bdd0()
{
	wait(1);
	if(!isdefined(level.perk_damage_override))
	{
		level.perk_damage_override = [];
	}
	Array::add(level.perk_damage_override, &function_c5acd7e0, 0);
}

/*
	Name: function_c5acd7e0
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0xC38
	Size: 0x318
	Parameters: 10
	Flags: None
	Line Number: 247
*/
function function_c5acd7e0(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(isdefined(self.var_7eb83e77) && self.var_7eb83e77)
	{
		return 0;
	}
	var_6bfdf47a = 1;
	if(isdefined(sMeansOfDeath))
	{
		if(self namespace_851dc78f::function_5f9a13b3("specialty_slider") || self namespace_851dc78f::function_5f9a13b3("specialty_da_phd_slider") || self bgb::is_enabled("zm_bgb_danger_closest"))
		{
			if(sMeansOfDeath == "MOD_ELECTOCUTED" || sMeansOfDeath == "MOD_EXPLOSIVE" || sMeansOfDeath == "MOD_EXPLOSIVE_SPLASH" || sMeansOfDeath == "MOD_FALLING" || sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_PROJECTILE" || sMeansOfDeath == "MOD_PROJECTILE_SPLASH" || sMeansOfDeath == "MOD_GRENADE_SPLASH" || sMeansOfDeath == "MOD_SUICIDE" || sMeansOfDeath == "MOD_IMPACT")
			{
				var_6bfdf47a = 0;
			}
		}
		if(sMeansOfDeath == "MOD_PROJECTILE" || sMeansOfDeath == "MOD_PROJECTILE_SPLASH" || sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_GRENADE_SPLASH" || sMeansOfDeath == "MOD_EXPLOSIVE")
		{
			if(isdefined(weapon) && isdefined(weapon.name) && (weapon.name == "ray_gun" || weapon.name == "ray_gun_upgraded"))
			{
				if(self.health > 25 && iDamage > 25)
				{
					var_6bfdf47a = 0;
				}
			}
			else if(self.health > 75 && iDamage > 75)
			{
				var_6bfdf47a = 0;
			}
		}
	}
	if(self namespace_851dc78f::function_5f9a13b3("specialty_dyingwish") && !isdefined(self.var_f2d882e9) && isdefined(iDamage) && self.health <= iDamage && var_6bfdf47a && !isdefined(self.var_7eb83e77))
	{
		self.health = 1;
		self thread function_bbc8a59a();
		return 0;
	}
	return undefined;
}

/*
	Name: function_bbc8a59a
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0xF58
	Size: 0x258
	Parameters: 0
	Flags: None
	Line Number: 297
*/
function function_bbc8a59a()
{
	self endon("disconnect");
	playsoundatposition("dyingwish_start_plr", self.origin);
	self PlayLoopSound("dyingwish_lp_plr");
	self.var_7eb83e77 = 1;
	visionset_mgr::activate("overlay", "zm_dying_wish_sight", self, 2, 9);
	visionset_mgr::activate("visionset", "zm_dying_wish_sight", self, 2, 9);
	time = 0;
	var_7d3cd309 = 9;
	while(time < var_7d3cd309 && self namespace_851dc78f::function_5f9a13b3("specialty_dyingwish"))
	{
		time = time + 1;
		self thread namespace_4b6e359c::function_75aa16e4("specialty_dyingwish", "dyingwish", "Meter", 100 - Int(time / var_7d3cd309 * 100));
		wait(1);
		self.health = 1;
	}
	visionset_mgr::deactivate("overlay", "zm_dying_wish_sight", self);
	visionset_mgr::deactivate("visionset", "zm_dying_wish_sight", self);
	self.var_7eb83e77 = undefined;
	self thread function_12c7b682();
	if(self namespace_851dc78f::function_b690a849("specialty_dyingwish"))
	{
		self.health = self.maxhealth;
	}
	else
	{
		self.health = 1;
	}
	self StopLoopSound(1);
	playsoundatposition("dyingwish_end_plr", self.origin);
}

/*
	Name: function_12c7b682
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0x11B8
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 340
*/
function function_12c7b682()
{
	self endon("disconnect");
	wait(0.1);
	self.var_f2d882e9 = 0;
	max = 300;
	while(self.var_f2d882e9 < max)
	{
		self.var_f2d882e9 = self.var_f2d882e9 + 1;
		if(self namespace_851dc78f::function_5f9a13b3("specialty_dyingwish"))
		{
			self thread namespace_4b6e359c::function_75aa16e4("specialty_dyingwish", "dyingwish", "Meter", Int(self.var_f2d882e9 / max * 100));
		}
		wait(1);
	}
	self.var_f2d882e9 = undefined;
	if(!self namespace_851dc78f::function_5f9a13b3("specialty_dyingwish"))
	{
		while(!self namespace_851dc78f::function_5f9a13b3("specialty_dyingwish"))
		{
			wait(1);
		}
		self thread namespace_4b6e359c::function_75aa16e4("specialty_dyingwish", "dyingwish", "Meter", Int(100));
	}
}

/*
	Name: function_5889c305
	Namespace: namespace_f4272f8a
	Checksum: 0x424F4353
	Offset: 0x1330
	Size: 0x10E
	Parameters: 13
	Flags: None
	Line Number: 376
*/
function function_5889c305(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(str_mod === "MOD_MELEE" && isdefined(e_player) && isPlayer(e_player) && e_player namespace_851dc78f::function_5f9a13b3("specialty_dyingwish") && isdefined(e_player.var_7eb83e77) && isdefined(self))
	{
		self DoDamage(self.health + 666, self.origin, e_player, self, "MOD_MELEE");
	}
	return 0;
}

