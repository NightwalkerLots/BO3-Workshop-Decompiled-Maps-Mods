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
#include scripts\zm\_zm_lightning_chain;
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

#namespace namespace_57c55ace;

/*
	Name: __init__sytem__
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0x690
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 46
*/
function autoexec __init__sytem__()
{
	system::register("TACTIQUILLA", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_57c55ace
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
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0x6F0
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_tactiquilla", "customperk", 2000, &"ZM_REAP_MOD_PERK_TACTIQUILLA", GetWeapon("zombie_perk_bottle_tac"));
	zm_perks::register_perk_precache_func("specialty_tactiquilla", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_tactiquilla", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_tactiquilla", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_tactiquilla", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_tactiquilla", "Tactiquilla Sangria", "zombie/fx_perk_mule_kick_zmb");
	level thread namespace_851dc78f::function_c3c32972("specialty_tactiquilla", &"ZM_REAP_MOD_PERK_TACTIQUILLA_DB", 1500, "Tactiquilla Sangria", "tactiquilla");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_tactiquilla"] = 1;
	level.var_a2db1f4d = Array("ray_gun", "tesla_gun", "slipgun", "slipgun_upgraded", "t9_zm_raygun", "t9_zm_raygun_up");
	callback::on_connect(&on_player_connect);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0x8F8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_tactiquilla"] = spawnstruct();
	level.machine_assets["specialty_tactiquilla"].weapon = GetWeapon("zombie_perk_bottle_tac");
	level.machine_assets["specialty_tactiquilla"].off_model = "xela_perk_tactiquilla";
	level.machine_assets["specialty_tactiquilla"].on_model = "xela_perk_tactiquilla_on";
}

/*
	Name: function_19157aff
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0x9A0
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
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0x9B0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 138
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_tactiquilla", "tactiquilla", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0x9F8
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 153
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_tactiquilla_jingle";
	use_trigger.script_string = "specialty_tactiquilla";
	use_trigger.script_label = "mus_perks_tactiquilla_sting";
	use_trigger.target = "Tactiquilla Sangria";
	perk_machine.script_string = "specialty_tactiquilla";
	perk_machine.targetname = "Tactiquilla Sangria";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_tactiquilla";
		return;
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0xAC0
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 178
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_tactiquilla"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_tactiquilla"] = 1;
	self thread function_1698c759();
	self setPerk("specialty_sprintrecovery");
	self setPerk("specialty_sprintfirerecovery");
	self setPerk("specialty_sprintfire");
	self setPerk("specialty_sprintgrenadelethal");
	self setPerk("specialty_sprintgrenadetactical");
	self setPerk("specialty_sprintequipment");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b4722825
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0xC18
	Size: 0x118
	Parameters: 3
	Flags: None
	Line Number: 215
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_tactiquilla"] = 0;
	self.var_b5c2c258["specialty_tactiquilla"] = undefined;
	self.var_d6aef449["specialty_tactiquilla"] = undefined;
	self unsetPerk("specialty_sprintrecovery");
	self unsetPerk("specialty_sprintfirerecovery");
	self unsetPerk("specialty_sprintfire");
	self unsetPerk("specialty_sprintgrenadelethal");
	self unsetPerk("specialty_sprintgrenadetactical");
	self unsetPerk("specialty_sprintequipment");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1698c759
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0xD38
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 240
*/
function function_1698c759()
{
	self thread function_23ec2d73();
}

/*
	Name: function_23ec2d73
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0xD60
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 255
*/
function function_23ec2d73()
{
	while(1)
	{
		self waittill("weapon_fired", weapon);
		if(IsInArray(level.var_a2db1f4d, weapon.name))
		{
			continue;
		}
		if(randomIntRange(1, 101) <= 15 || (self namespace_851dc78f::function_b690a849("specialty_tactiquilla") && randomIntRange(1, 101) <= 25))
		{
			var_e41d8554 = self GetWeaponAmmoClip(weapon);
			var_f6641e5 = weapon.clipSize;
			if(var_e41d8554 < var_f6641e5)
			{
				self SetWeaponAmmoClip(weapon, var_e41d8554 + 1);
			}
		}
	}
}

/*
	Name: function_601f097f
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0xE98
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 286
*/
function function_601f097f()
{
	while(1)
	{
		self waittill("grenade_fire", grenade, weapon);
		if(IsInArray(level.var_a2db1f4d, weapon.name))
		{
			continue;
		}
		if(randomIntRange(1, 101) <= 15 && self zm_utility::is_player_tactical_grenade(weapon) || self zm_utility::is_player_lethal_grenade(weapon))
		{
			if(!self hasweapon(weapon))
			{
				self GiveWeapon(weapon);
				self SetWeaponAmmoClip(weapon, 1);
			}
			else
			{
				frac = self GetFractionMaxAmmo(weapon);
				if(frac < 0.25 && weapon.maxAmmo >= 2)
				{
					self SetWeaponAmmoClip(weapon, 2);
				}
				else if(frac < 0.5 && weapon.maxAmmo >= 3)
				{
					self SetWeaponAmmoClip(weapon, 3);
				}
				else if(frac < 0.75 && weapon.maxAmmo >= 4)
				{
					self SetWeaponAmmoClip(weapon, 4);
				}
			}
		}
	}
}

/*
	Name: on_player_connect
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0x10A0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 332
*/
function on_player_connect()
{
	self thread kill_streak();
}

/*
	Name: kill_streak
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0x10C8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 347
*/
function kill_streak()
{
	if(!isdefined(self.var_b0ee9c4a))
	{
		self.var_b0ee9c4a = 0;
	}
	while(1)
	{
		self waittill("zom_kill");
		self.var_b0ee9c4a++;
		self thread function_f72e59e7();
	}
}

/*
	Name: function_f72e59e7
	Namespace: namespace_57c55ace
	Checksum: 0x424F4353
	Offset: 0x1120
	Size: 0xAC
	Parameters: 0
	Flags: None
	Line Number: 371
*/
function function_f72e59e7()
{
	self endon("zom_kill");
	wait(2);
	if(self.var_b0ee9c4a > 0)
	{
		if(self namespace_851dc78f::function_5f9a13b3("specialty_tactiquilla"))
		{
			self.score = self.score + self.var_b0ee9c4a * 10;
		}
		if(self namespace_851dc78f::function_b690a849("specialty_tactiquilla"))
		{
			self.score = self.score + self.var_b0ee9c4a * 10;
		}
		self.var_b0ee9c4a = 0;
	}
}

