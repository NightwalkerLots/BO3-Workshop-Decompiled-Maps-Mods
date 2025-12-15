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

#namespace namespace_15344033;

/*
	Name: __init__sytem__
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x660
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("MOONSHINE", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x6A0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function __init__()
{
	function_1a92256e();
	return;
}

/*
	Name: function_1a92256e
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x6C0
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_moonshine", "customperk", 2000, &"ZM_REAP_MOD_PERK_MOONSHINE", GetWeapon("zombie_perk_bottle_MOONSHINE"));
	zm_perks::register_perk_precache_func("specialty_moonshine", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_moonshine", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_moonshine", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_moonshine", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_moonshine", "Madgaz Moonshine", "zombie/fx_perk_doubletap2_zmb");
	level thread namespace_851dc78f::function_c3c32972("specialty_moonshine", &"ZM_REAP_MOD_PERK_MOONSHINE_DB", 1500, "Madgaz Moonshine", "madgaz_moonshine");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_moonshine"] = 1;
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x860
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_moonshine"] = spawnstruct();
	level.machine_assets["specialty_moonshine"].weapon = GetWeapon("zombie_perk_bottle_MOONSHINE");
	level.machine_assets["specialty_moonshine"].off_model = "vending_madgaz_moonshine";
	level.machine_assets["specialty_moonshine"].on_model = "vending_madgaz_moonshine_on";
}

/*
	Name: function_19157aff
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x908
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x918
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 134
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_moonshine", "madgaz_moonshine", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x960
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 149
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_madgaz_moonshine_jingle";
	use_trigger.script_string = "specialty_moonshine";
	use_trigger.script_label = "mus_perks_madgaz_moonshine_sting";
	use_trigger.target = "Madgaz Moonshine";
	perk_machine.script_string = "specialty_moonshine";
	perk_machine.targetname = "Madgaz Moonshine";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_moonshine";
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0xA28
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
	self.disabled_perks["specialty_moonshine"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_moonshine"] = 1;
	self thread function_d0d77982();
}

/*
	Name: function_b4722825
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0xAC0
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 204
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_moonshine"] = 0;
	self.var_b5c2c258["specialty_moonshine"] = undefined;
	self.var_d6aef449["specialty_moonshine"] = undefined;
}

/*
	Name: function_d0d77982
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0xB20
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 221
*/
function function_d0d77982()
{
	self endon("hash_d972bd0b");
	self thread function_cad7a454();
	if(!isdefined(level.var_a9742d28))
	{
		thread function_89e7bf0d();
	}
	while(self namespace_851dc78f::function_5f9a13b3("specialty_moonshine"))
	{
		while(self function_679da569())
		{
			wait(0.05);
			if(!self function_679da569())
			{
				self function_a2feb947();
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_a2feb947
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0xBF0
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 253
*/
function function_a2feb947()
{
	self.var_a440ec--;
	if(self.var_a440ec > 0)
	{
		self playsound("moonshine_explode");
		self thread function_6cfb46c3(self.origin);
		var_2d8f0b24 = GetAISpeciesArray("axis");
		var_2d8f0b24 = Array::get_all_closest(self.origin, var_2d8f0b24, undefined, undefined, 100);
		foreach(var_458203d5 in var_2d8f0b24)
		{
			if(isdefined(var_458203d5))
			{
				if(isdefined(var_458203d5.var_2dce8d67) && var_458203d5.var_2dce8d67 || !var_458203d5 function_6c048906())
				{
					continue;
				}
				PlayFXOnTag(level._effect["character_fire_death_torso"], self, "j_spineupper");
				angles = var_458203d5.angles;
				angles_forward = AnglesToForward(angles);
				velocity = VectorScale(angles_forward * -1, 100);
				var_458203d5 DoDamage(var_458203d5.health + 666, self.origin, self);
				var_458203d5 StartRagdoll();
				var_458203d5 LaunchRagdoll(velocity + VectorScale((0, 0, 1), 40));
			}
		}
	}
}

/*
	Name: function_6cfb46c3
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0xE58
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 292
*/
function function_6cfb46c3(origin)
{
	var_8be4db6f = spawn("script_model", origin);
	var_8be4db6f SetModel("tag_origin");
	var_8be4db6f namespace_851dc78f::function_4621bbdd("scriptmover", "moonshine_explosion", 1);
	wait(5);
	var_8be4db6f namespace_851dc78f::function_4621bbdd("scriptmover", "moonshine_explosion", 0);
	wait(0.1);
	var_8be4db6f delete();
}

/*
	Name: function_89e7bf0d
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0xF30
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 313
*/
function function_89e7bf0d()
{
	level.var_a9742d28 = 1;
	while(function_468d4dee())
	{
		var_2d8f0b24 = GetAISpeciesArray("axis");
		foreach(var_458203d5 in var_2d8f0b24)
		{
			if(isdefined(var_458203d5))
			{
				if(isdefined(var_458203d5.var_2dce8d67) && var_458203d5.var_2dce8d67 || var_458203d5.archetype != "zombie")
				{
					continue;
				}
				if(!isdefined(var_458203d5.var_64b97637))
				{
					var_458203d5 thread function_e654524f();
				}
			}
		}
		wait(5);
	}
	level.var_a9742d28 = undefined;
}

/*
	Name: function_468d4dee
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x1078
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 348
*/
function function_468d4dee()
{
	players = GetPlayers();
	foreach(player in players)
	{
		if(player namespace_851dc78f::function_5f9a13b3("specialty_moonshine"))
		{
			return 1;
		}
	}
	return 0;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_e654524f
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x1138
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 373
*/
function function_e654524f()
{
	self endon("death");
	self.var_64b97637 = 1;
	while(isdefined(self))
	{
		self waittill("damage", damage, attacker);
		if(attacker namespace_851dc78f::function_5f9a13b3("specialty_moonshine"))
		{
			if(isdefined(self))
			{
				chance = randomIntRange(0, 9);
				if(self namespace_851dc78f::function_b690a849("specialty_moonshine"))
				{
					chance = randomIntRange(0, 7);
				}
				if(chance == 4 && !isdefined(self.var_383acc7a))
				{
					self thread Burn(30, attacker);
					wait(0.05);
				}
			}
		}
	}
}

/*
	Name: Burn
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x1250
	Size: 0x1E8
	Parameters: 2
	Flags: None
	Line Number: 409
*/
function Burn(time, attacker)
{
	self.var_383acc7a = 1;
	var_19a88814 = spawn("script_model", self GetTagOrigin("j_spineupper"));
	var_19a88814 SetModel("tag_origin");
	var_19a88814 EnableLinkTo();
	var_19a88814 LinkTo(self);
	var_19a88814 PlayLoopSound("moonshine_burning");
	PlayFXOnTag(level._effect["character_fire_death_torso"], var_19a88814, "tag_origin");
	end_time = GetTime() + time * 1000;
	self thread damage_over_time(time, attacker);
	while(GetTime() < end_time && isdefined(self))
	{
		if(self.health < 10)
		{
			var_19a88814 StopLoopSound(1);
			wait(0.05);
			break;
		}
		wait(0.05);
	}
	if(isdefined(self))
	{
		self notify("hash_b90e804");
		self.is_burning = undefined;
	}
	var_19a88814 StopLoopSound(1);
	wait(4);
	var_19a88814 delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: damage_over_time
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x1440
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 452
*/
function damage_over_time(time, attacker)
{
	self endon("death");
	self endon("hash_b90e804");
	for(i = 0; i < time; i++)
	{
		self DoDamage(25, self.origin, attacker);
		wait(1);
	}
}

/*
	Name: function_cad7a454
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x14C8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 473
*/
function function_cad7a454()
{
	self.var_a440ec = 20;
	while(self namespace_851dc78f::function_5f9a13b3("specialty_moonshine"))
	{
		level waittill("between_round_over");
		self.var_a440ec = 20;
		if(self namespace_851dc78f::function_b690a849("specialty_moonshine"))
		{
			self.var_a440ec = 30;
		}
	}
}

/*
	Name: function_6c048906
	Namespace: namespace_15344033
	Checksum: 0x424F4353
	Offset: 0x1548
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 497
*/
function function_6c048906()
{
	t = self.archetype;
	if(t === "zombie" || t === "zombie_dog" || t === "zombie_dog" || t === "skeleton" || t === "mannequin" || t === "zombie_quad" || t === "apothicon_fury" || t === "keeper" || t === "monkey")
	{
		return 1;
	}
	return 0;
}

