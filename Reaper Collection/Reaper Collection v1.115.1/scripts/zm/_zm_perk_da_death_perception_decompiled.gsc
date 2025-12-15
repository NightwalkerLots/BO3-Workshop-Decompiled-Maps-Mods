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
#include scripts\shared\spawner_shared;
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
#include scripts\zm\_zm_pack_a_punch_util;
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

#namespace namespace_728c33db;

/*
	Name: __init__sytem__
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x720
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 47
*/
function autoexec __init__sytem__()
{
	system::register("DA_DEATH_PERCEPTION", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x760
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
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x780
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_da_death_perception", "customperk", 2000, &"ZM_REAP_MOD_PERK_DA_DEATH_PERCEPTION", GetWeapon("zombie_perk_bottle_da_death_perception"));
	zm_perks::register_perk_precache_func("specialty_da_death_perception", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_da_death_perception", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_da_death_perception", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_da_death_perception", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_da_death_perception", "Death Perception", "reaps_cz_da_machine_on_death_perception");
	level thread namespace_851dc78f::function_c3c32972("specialty_da_death_perception", &"ZM_REAP_MOD_PERK_DA_DEATH_PERCEPTION_DB", 2000, "Death Perception", "da_death_perception", &function_412fae8c);
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_da_death_perception"] = 1;
	spawner::add_global_spawn_function("axis", &function_9e6c892f);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x958
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_da_death_perception"] = spawnstruct();
	level.machine_assets["specialty_da_death_perception"].weapon = GetWeapon("zombie_perk_bottle_da_death_perception");
	level.machine_assets["specialty_da_death_perception"].off_model = "cz_zombie_vending_da_death_perception_off";
	level.machine_assets["specialty_da_death_perception"].on_model = "cz_zombie_vending_da_death_perception";
}

/*
	Name: function_19157aff
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0xA00
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 124
*/
function function_19157aff()
{
	clientfield::register("clientuimodel", "death_perception", 1, 2, "int");
}

/*
	Name: function_99c1452c
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0xA40
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 139
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_da_death_perception", "da_death_perception", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0xA88
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 154
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_death_perception_jingle";
	use_trigger.script_string = "specialty_da_death_perception";
	use_trigger.script_label = "mus_perks_death_perception_sting";
	use_trigger.target = "Death Perception";
	perk_machine.script_string = "specialty_da_death_perception";
	perk_machine.targetname = "Death Perception";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_da_death_perception";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0xB50
	Size: 0xC8
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
	self.disabled_perks["specialty_da_death_perception"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_da_death_perception"] = 1;
	self thread function_6b094e01();
	self thread check_for_change();
	self clientfield::set_player_uimodel("death_perception", 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b4722825
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0xC20
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 211
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_da_death_perception"] = 0;
	self.var_b5c2c258["specialty_da_death_perception"] = undefined;
	self.var_d6aef449["specialty_da_death_perception"] = undefined;
	self clientfield::set_player_uimodel("death_perception", 0);
}

/*
	Name: function_412fae8c
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0xCA0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 229
*/
function function_412fae8c()
{
	self clientfield::set_player_uimodel("death_perception", 2);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: on_player_spawned
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0xCD0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 246
*/
function on_player_spawned()
{
	self thread function_ac29113b();
}

/*
	Name: function_ac29113b
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0xCF8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 261
*/
function function_ac29113b()
{
	self endon("disconnect");
	self notify("hash_ac29113b");
	self endon("hash_ac29113b");
	wait(1);
	level flag::wait_till("initial_blackscreen_passed");
	while(1)
	{
		if(self namespace_851dc78f::function_b690a849("specialty_da_death_perception") || isdefined(level.var_504a6cbb))
		{
			self clientfield::set_player_uimodel("death_perception", 2);
		}
		else if(self namespace_851dc78f::function_5f9a13b3("specialty_da_death_perception"))
		{
			self clientfield::set_player_uimodel("death_perception", 1);
		}
		else
		{
			self clientfield::set_player_uimodel("death_perception", 0);
		}
		wait(1);
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_6b094e01
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0xE10
	Size: 0x310
	Parameters: 0
	Flags: None
	Line Number: 298
*/
function function_6b094e01()
{
	self endon("death");
	self notify("hash_6b094e01");
	self endon("hash_6b094e01");
	limit = 8;
	if(!isdefined(self.var_6b094e01))
	{
		self.var_6b094e01 = [];
	}
	while(self namespace_851dc78f::function_5f9a13b3("specialty_da_death_perception"))
	{
		angles = self getPlayerAngles();
		forward_dir = AnglesToForward(angles + VectorScale((0, 1, 0), 180));
		end_pos = self.origin + forward_dir * 400;
		end_pos = (end_pos[0], end_pos[1], self.origin[2]);
		a_zombies = zombie_utility::get_round_enemy_array();
		a_zombies = self CantSeeEntities(a_zombies, cos(75), 1);
		a_zombies = util::get_array_of_closest(end_pos, a_zombies, undefined, undefined, 425);
		for(i = 0; i < limit; i++)
		{
			if(isdefined(a_zombies[i]))
			{
				if(!isdefined(self.var_6b094e01[i]))
				{
					hud = newClientHudElem(self);
					hud SetTargetEnt(a_zombies[i]);
					hud setWaypoint(1, "death_perception_zombies_hud_icon", 0, 0);
					self.var_6b094e01[i] = hud;
					continue;
				}
			}
			if(isdefined(self.var_6b094e01[i]))
			{
				self.var_6b094e01[i] destroy();
				self.var_6b094e01[i] = undefined;
			}
		}
		wait(0.05);
	}
	for(i = 0; i < self.var_6b094e01.size; i++)
	{
		if(isdefined(self.var_6b094e01[i]))
		{
			self.var_6b094e01[i] destroy();
			self.var_6b094e01[i] = undefined;
		}
	}
	self.var_6b094e01 = undefined;
}

/*
	Name: function_9e6c892f
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x1128
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 359
*/
function function_9e6c892f()
{
	if(self.archetype == "zombie")
	{
		return;
	}
	while(1)
	{
		self waittill("damage", amount, attacker, direction_vec, point, type, tagName, modelName, partName, weapon, dFlags, inflictor, chargeLevel);
		if(isdefined(attacker) && attacker namespace_851dc78f::function_b690a849("specialty_da_death_perception"))
		{
			if(tagName == "head" || tagName == "helmet" || tagName == "neck")
			{
				self DoDamage(Int(amount), attacker.origin, attacker, attacker, 0, type, 0, weapon);
			}
		}
	}
}

/*
	Name: check_for_change
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x1298
	Size: 0x294
	Parameters: 0
	Flags: None
	Line Number: 388
*/
function check_for_change()
{
	self endon("death");
	self notify("hash_97168d60");
	self endon("hash_97168d60");
	wait(1);
	vending_triggers = [];
	vending_triggers = GetEntArray("bgb_machine_use", "targetname");
	vending_triggers = ArrayCombine(vending_triggers, GetEntArray("perk_random_machine", "targetname"), 0, 0);
	vending_triggers = ArrayCombine(vending_triggers, struct::get_array("treasure_chest_use", "targetname"), 0, 0);
	vending_triggers = ArrayCombine(vending_triggers, GetEntArray("zombie_vending_upgrade", "targetname"), 0, 0);
	vending_triggers = ArrayCombine(vending_triggers, GetEntArray("zm_pack_a_punch", "targetname"), 0, 0);
	if(vending_triggers.size == 0)
	{
		return;
	}
	while(1)
	{
		for(i = 0; i < vending_triggers.size; i++)
		{
			if(!isdefined(self.origin) || !isdefined(vending_triggers[i].origin))
			{
				wait(0.1);
				continue;
			}
			if(isdefined(vending_triggers[i].var_97168d60))
			{
				continue;
			}
			if(DistanceSquared(vending_triggers[i].origin, self.origin) < 4900)
			{
				if(self GetStance() == "prone")
				{
					self zm_score::add_to_player_score(100);
					zm_utility::play_sound_at_pos("purchase", self.origin);
					vending_triggers[i].var_97168d60 = 0;
				}
			}
		}
		wait(0.1);
	}
}

