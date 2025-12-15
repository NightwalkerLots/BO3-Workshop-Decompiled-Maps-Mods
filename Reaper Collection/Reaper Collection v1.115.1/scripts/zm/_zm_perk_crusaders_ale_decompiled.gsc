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
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_254f53a2;

/*
	Name: __init__sytem__
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x5A0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("CRUSADE", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x5E0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function __init__()
{
	function_1a92256e();
}

/*
	Name: function_1a92256e
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x600
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_crusade", "customperk", 2000, &"ZM_REAP_MOD_PERK_CRUSADE", GetWeapon("zombie_perk_bottle_CRUSADE"));
	zm_perks::register_perk_precache_func("specialty_crusade", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_crusade", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_crusade", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_crusade", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_crusade", "Crusaders Ale", "jugger_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_crusade", &"ZM_REAP_MOD_PERK_CRUSADE_DB", 1000, "Crusaders Ale", "crusaders_ale");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_crusade"] = 1;
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x7A0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 103
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_crusade"] = spawnstruct();
	level.machine_assets["specialty_crusade"].weapon = GetWeapon("zombie_perk_bottle_CRUSADE");
	level.machine_assets["specialty_crusade"].off_model = "vending_crusader_ale";
	level.machine_assets["specialty_crusade"].on_model = "vending_crusader_ale_on";
}

/*
	Name: function_19157aff
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x848
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 121
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x858
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 135
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_crusade", "crusaders_ale", "SetIconActive", state);
	return;
}

/*
	Name: function_edb3a90b
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x8A0
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 151
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_crusaders_ale_jingle";
	use_trigger.script_string = "specialty_crusade";
	use_trigger.script_label = "mus_perks_crusaders_ale_sting";
	use_trigger.target = "Crusaders Ale";
	perk_machine.script_string = "specialty_crusade";
	perk_machine.targetname = "Crusaders Ale";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_crusade";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x968
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 175
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_crusade"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_crusade"] = 1;
	self thread function_ce72c900();
}

/*
	Name: function_b4722825
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0xA00
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 204
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_crusade"] = 0;
	self.var_b5c2c258["specialty_crusade"] = undefined;
	self.var_d6aef449["specialty_crusade"] = undefined;
	return;
	~;
}

/*
	Name: function_ce72c900
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0xA60
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 223
*/
function function_ce72c900()
{
	self endon("hash_ff69282a");
	self thread function_3f4035ec();
	self thread function_fb503a42();
	if(!isdefined(level.var_e1f787f3))
	{
		thread function_8dfdb21e();
	}
}

/*
	Name: function_8dfdb21e
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0xAC8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 244
*/
function function_8dfdb21e()
{
	level.var_e1f787f3 = 1;
	while(function_285e761b())
	{
		var_2d8f0b24 = GetAISpeciesArray("axis");
		foreach(var_458203d5 in var_2d8f0b24)
		{
			if(!isdefined(var_458203d5.var_16ff2037))
			{
				var_458203d5 thread function_e7e79105();
				var_458203d5 thread function_674e922d();
			}
		}
		wait(5);
	}
	level.var_e1f787f3 = undefined;
	return;
}

/*
	Name: function_285e761b
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0xBE0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 274
*/
function function_285e761b()
{
	players = GetPlayers();
	foreach(player in players)
	{
		if(player namespace_851dc78f::function_5f9a13b3("specialty_crusade"))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_e7e79105
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0xCA0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 297
*/
function function_e7e79105()
{
	self endon("death");
	self.var_16ff2037 = 1;
	while(1)
	{
		self waittill("damage", damage, attacker, direction, point, type, tagName, modelName, partName, weapon, flags, inflictor, chargeLevel);
		if(type == "MOD_MELEE_WEAPON_BUTT" || (type == "MOD_MELEE" && attacker namespace_851dc78f::function_5f9a13b3("specialty_crusade")))
		{
			if(self.health > 150)
			{
				self DoDamage(150, self.origin, attacker, attacker, undefined, "MOD_MELEE");
			}
		}
	}
}

/*
	Name: function_674e922d
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0xDF0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 324
*/
function function_674e922d()
{
	self waittill("death", attacker);
	if(attacker namespace_851dc78f::function_5f9a13b3("specialty_crusade"))
	{
		weap = attacker GetCurrentWeapon();
		if(isdefined(attacker.var_6027c460) && GetTime() - attacker.var_6027c460 < 1800)
		{
			attacker playlocalsound("crusade_money");
			attacker zm_score::add_to_player_score(130);
		}
		if(attacker namespace_851dc78f::function_b690a849("specialty_crusade") && RandomInt(100) < 5)
		{
			self playlocalsound("repair_tick");
			if(isdefined(level.riotshield_damage_callback))
			{
				self [[level.riotshield_damage_callback]](-10);
			}
		}
	}
}

/*
	Name: function_3f4035ec
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0xF40
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 356
*/
function function_3f4035ec()
{
	while(self namespace_851dc78f::function_5f9a13b3("specialty_crusade"))
	{
		level waittill("between_round_over");
		if(self namespace_851dc78f::function_5f9a13b3("specialty_crusade"))
		{
			skip = 1;
			primary_weapons = self GetWeaponsList(1);
			foreach(weap in primary_weapons)
			{
				if(weap.isRiotShield)
				{
					skip = 0;
					self giveMaxAmmo(weap);
				}
			}
			if(!skip)
			{
				self playlocalsound("repair_tick");
				if(isdefined(level.riotshield_damage_callback))
				{
					self [[level.riotshield_damage_callback]](-1500);
				}
				self giveMaxAmmo("zod_riotshield");
			}
		}
	}
}

/*
	Name: function_fb503a42
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x10E0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 396
*/
function function_fb503a42()
{
	while(self namespace_851dc78f::function_5f9a13b3("specialty_crusade"))
	{
		if(self IsMeleeing())
		{
			self.var_6027c460 = GetTime();
			self thread function_f8ba90c1(1.3);
		}
		wait(0.05);
	}
}

/*
	Name: function_f8ba90c1
	Namespace: namespace_254f53a2
	Checksum: 0x424F4353
	Offset: 0x1158
	Size: 0x3C
	Parameters: 1
	Flags: None
	Line Number: 419
*/
function function_f8ba90c1(time)
{
	self EnableInvulnerability();
	wait(time);
	self DisableInvulnerability();
}

