#include scripts\codescripts\struct;
#include scripts\shared\_burnplayer;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\gameobjects_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_70c1ab52;

/*
	Name: __init__sytem__
	Namespace: namespace_70c1ab52
	Checksum: 0xEBD519BB
	Offset: 0x9D0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 48
*/
function autoexec __init__sytem__()
{
	system::register("kj_jzm_weaponboost", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_70c1ab52
	Checksum: 0x9ACF73B8
	Offset: 0xA18
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function __init__()
{
}

/*
	Name: __main__
	Namespace: namespace_70c1ab52
	Checksum: 0x420DB44B
	Offset: 0xA28
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function __main__()
{
	zm::register_actor_damage_callback(&function_3bdca755);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_91b2366a
	Namespace: namespace_70c1ab52
	Checksum: 0xC91628E0
	Offset: 0xA58
	Size: 0x2A0
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function function_91b2366a()
{
	if(IsInArray(Array("none", "zombie_bgb_grab", "zombie_bgb_use", "minigun", "microwavegun", "microwavegun_upgraded", "microwavegundw", "microwavegundw_upgraded", "microwavegunlh", "microwavegunlh_upgraded", "staff_revive", "staff_water", "staff_water_upgraded", "staff_water_upgraded2", "staff_water_upgraded3", "staff_bolt", "staff_bolt_upgraded", "staff_bolt_upgraded2", "staff_bolt_upgraded3", "staff_fire", "staff_fire_upgraded", "staff_fire_upgraded2", "staff_fire_upgraded3", "staff_air", "staff_air_upgraded", "staff_air_upgraded2", "staff_air_upgraded3"), self.var_9ef95201) || IsInArray(Array("ray_gun", "ray_gun_upgraded", "thundergun", "thundergun_upgraded", "cosmodrome_thundergun", "cosmodrome_thundergun_upgraded", "genesis_thundergun", "genesis_thundergun_upgraded", "theater_thundergun", "theater_thundergun_upgraded", "tesla_gun", "tesla_gun_upgraded", "asylum_tesla_gun", "asylum_tesla_gun_upgraded", "factory_tesla_gun", "factory_tesla_gun_upgraded", "sumpf_tesla_gun", "sumpf_tesla_gun_upgraded", "raygun_mark2", "raygun_mark2_upgraded", "asylum_raygun_mark2", "asylum_raygun_mark2_upgraded", "cosmodrome_raygun_mark2", "cosmodrome_raygun_mark2_upgraded", "moon_raygun_mark2", "moon_raygun_mark2_upgraded", "theater_raygun_mark2", "theater_raygun_mark2_upgraded", "hero_mirg2000", "hero_mirg2000_upgraded", "raygun_mark3", "raygun_mark3_upgraded", "idgun_0", "idgun_1", "idgun_2", "idgun_3", "idgun_genesis_0", "idgun_genesis_0_upgraded", "shrink_ray", "shrink_ray_upgraded"), self.var_9ef95201))
	{
		self IPrintLnBold("Weapon Boost Invalid");
		return 1;
	}
	else
	{
		return 0;
	}
}

/*
	Name: function_c0cf76bd
	Namespace: namespace_70c1ab52
	Checksum: 0xB0AF3F0
	Offset: 0xD00
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 117
*/
function function_c0cf76bd()
{
	self endon("disconnect");
	level endon("game_ended");
	self thread function_241e1e29();
	var_a51e3171 = 50;
	var_4d338e1f = 1000;
	for(;;)
	{
		self waittill("pap_taken");
		self DisableWeaponCycling();
		self disableUsability();
		self waittill("weapon_change_complete");
		self.var_9ef95201 = self GetCurrentWeapon();
		if(isdefined(self.var_9ef95201))
		{
			self SetWeaponAmmoClip(self.var_9ef95201, self.var_9ef95201.clipSize);
			self giveMaxAmmo(self.var_9ef95201);
			if(!function_91b2366a())
			{
				if(!isdefined(self.var_9ef95201.var_9b70b7b5))
				{
					self.var_9ef95201.var_9b70b7b5 = 0;
				}
				else if(self.var_9ef95201.var_9b70b7b5 < var_4d338e1f)
				{
					self.var_9ef95201.var_9b70b7b5 = self.var_9ef95201.var_9b70b7b5 + var_a51e3171;
				}
			}
		}
		wait(0.5);
		self EnableWeaponCycling();
		self enableUsability();
	}
}

/*
	Name: function_241e1e29
	Namespace: namespace_70c1ab52
	Checksum: 0xB169F4B0
	Offset: 0xEC8
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 163
*/
function function_241e1e29()
{
	self endon("disconnect");
	level endon("game_ended");
	for(;;)
	{
		self waittill("weapon_change_complete");
		self.var_9ef95201 = self GetCurrentWeapon();
		wait(0.05);
		if(isdefined(self.var_9ef95201) && isdefined(self.var_9ef95201.var_9b70b7b5))
		{
			var_ddc7c874 = "JZMWeaponPercent" + self.var_9ef95201.var_9b70b7b5;
			if(isdefined(var_ddc7c874))
			{
				self SetControllerUIModelValue("pegasus_player", var_ddc7c874);
			}
		}
		else
		{
			self SetControllerUIModelValue("pegasus_player", "JZMWeaponPercent0");
		}
	}
}

/*
	Name: function_3bdca755
	Namespace: namespace_70c1ab52
	Checksum: 0x157D0F41
	Offset: 0xFB8
	Size: 0x154
	Parameters: 12
	Flags: None
	Line Number: 197
*/
function function_3bdca755(inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(isdefined(attacker) && isPlayer(attacker))
	{
		if(isdefined(attacker.var_9ef95201) && isdefined(attacker.var_9ef95201.var_9b70b7b5))
		{
			var_334b6850 = attacker.var_9ef95201.var_9b70b7b5 * 0.01 * damage;
			damage = damage + var_334b6850;
		}
		else if(isdefined(attacker.var_8812205c) && isdefined(weapon) && zm_utility::is_melee_weapon(weapon))
		{
			var_334b6850 = 320;
			damage = damage + var_334b6850;
		}
	}
	return damage;
}

