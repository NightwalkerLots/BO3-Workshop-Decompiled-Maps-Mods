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
#include scripts\zm\kj_jzm_backpack;

#namespace namespace_70c1ab52;

/*
	Name: __init__sytem__
	Namespace: namespace_70c1ab52
	Checksum: 0xD9093B81
	Offset: 0x500
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 49
*/
function autoexec __init__sytem__()
{
	system::register("kj_jzm_weaponboost", &__init__, &__main__, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_70c1ab52
	Checksum: 0x9ACF73B8
	Offset: 0x548
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function __init__()
{
}

/*
	Name: __main__
	Namespace: namespace_70c1ab52
	Checksum: 0x13CDADA7
	Offset: 0x558
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function __main__()
{
	zm::register_actor_damage_callback(&function_3bdca755);
}

/*
	Name: function_c0cf76bd
	Namespace: namespace_70c1ab52
	Checksum: 0xA4A7AD8D
	Offset: 0x588
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 95
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
			if(!namespace_f8c4cfb7::function_91b2366a())
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
	Checksum: 0xD8E49E31
	Offset: 0x750
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 141
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
	Checksum: 0x51F03AA1
	Offset: 0x840
	Size: 0x154
	Parameters: 12
	Flags: None
	Line Number: 175
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

