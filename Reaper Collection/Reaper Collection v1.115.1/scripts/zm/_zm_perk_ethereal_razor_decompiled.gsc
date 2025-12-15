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

#namespace namespace_41c569fa;

/*
	Name: __init__sytem__
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0x550
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("ethereal_razor", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0x590
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
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0x5B0
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_razor", "customperk", 3000, &"ZM_REAP_MOD_PERK_ETHEREAL_RAZOR", GetWeapon("zombie_perk_bottle_ethereal_razor"));
	zm_perks::register_perk_precache_func("specialty_razor", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_razor", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_razor", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_razor", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_razor", "Ethereal Razor", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_razor", &"ZM_REAP_MOD_PERK_ETHEREAL_RAZOR_DB", 2000, "Ethereal Razor", "razor");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_razor"] = 1;
	zm_spawner::register_zombie_damage_callback(&function_6e1826d5);
	return;
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0x770
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_razor"] = spawnstruct();
	level.machine_assets["specialty_razor"].weapon = GetWeapon("zombie_perk_bottle_ethereal_razor");
	level.machine_assets["specialty_razor"].off_model = "cz_vending_razor_new_off";
	level.machine_assets["specialty_razor"].on_model = "cz_vending_razor_new";
}

/*
	Name: function_19157aff
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0x818
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 123
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0x828
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 137
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_razor", "razor", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0x870
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 152
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_razor";
	use_trigger.script_label = "";
	use_trigger.target = "Ethereal Razor";
	perk_machine.script_string = "specialty_razor";
	perk_machine.targetname = "Ethereal Razor";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_razor";
		return;
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0x938
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 177
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_razor"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_razor"] = 1;
	self thread function_d5eb17dd();
	return;
	ERROR: Bad function call
}

/*
	Name: function_b4722825
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0x9D0
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 208
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_razor"] = 0;
	self.var_b5c2c258["specialty_razor"] = undefined;
	self.var_d6aef449["specialty_razor"] = undefined;
}

/*
	Name: function_ecb2fc7
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0xA30
	Size: 0x2C8
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function function_ecb2fc7()
{
	self endon("disconnect");
	damage = 1000;
	if(self namespace_851dc78f::function_b690a849("specialty_razor"))
	{
		damage = damage * 1.8;
	}
	angles = self getPlayerAngles();
	pos = self.origin;
	forward_view_angles = AnglesToForward(angles);
	end_pos = pos + function_f9cb4212(forward_view_angles, 40);
	end_pos = (end_pos[0], end_pos[1], self.origin[2]);
	a_zombies = zombie_utility::get_round_enemy_array();
	a_zombies = util::get_array_of_closest(end_pos, a_zombies, undefined, undefined, 80);
	a_zombies = util::get_array_of_closest(pos, a_zombies);
	n_zombies_hit = 0;
	n_zombie_limit = 4;
	for(i = 0; i < a_zombies.size; i++)
	{
		if(isalive(self) && isalive(a_zombies[i]) && DistanceSquared(self.origin, a_zombies[i].origin) < 6400)
		{
			if(n_zombies_hit < n_zombie_limit)
			{
				n_zombies_hit++;
				break;
			}
			else
			{
			}
			wait(0.05);
			if(isdefined(a_zombies[i]) && isalive(a_zombies[i]))
			{
				a_zombies[i] DoDamage(damage, self.origin, self, self, 0, "MOD_MELEE", 0, zm_utility::get_player_melee_weapon());
				self thread function_50280f3();
			}
		}
	}
}

/*
	Name: function_50280f3
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0xD00
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 275
*/
function function_50280f3()
{
	if(self.health < self.maxhealth)
	{
		dif = self.maxhealth - self.health;
		if(dif < 10)
		{
			self.health = self.maxhealth;
		}
		else
		{
			self.health = self.health + 10;
		}
	}
}

/*
	Name: function_f9cb4212
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0xD78
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 301
*/
function function_f9cb4212(V, scale)
{
	V = V * scale;
	return V;
}

/*
	Name: function_6e1826d5
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0xDA8
	Size: 0x198
	Parameters: 13
	Flags: None
	Line Number: 317
*/
function function_6e1826d5(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(str_mod === "MOD_MELEE" && isdefined(e_player) && isPlayer(e_player) && e_player namespace_851dc78f::function_5f9a13b3("specialty_razor") && !isdefined(self.var_6e1826d5))
	{
		damage = 3000;
		if(self namespace_851dc78f::function_b690a849("specialty_razor"))
		{
			damage = damage * 1.8;
		}
		self.var_6e1826d5 = 1;
		self DoDamage(damage, self.origin, e_player, self, 0, "MOD_MELEE", 0, zm_utility::get_player_melee_weapon());
		self thread function_77391cdb();
		self thread function_50280f3();
	}
	return 0;
}

/*
	Name: function_77391cdb
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0xF48
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 344
*/
function function_77391cdb()
{
	self endon("disconnect");
	wait(0.2);
	self.var_6e1826d5 = undefined;
}

/*
	Name: function_41c569fa
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0xF78
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 361
*/
function function_41c569fa()
{
	self thread function_d5eb17dd();
}

/*
	Name: function_d5eb17dd
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0xFA0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 376
*/
function function_d5eb17dd()
{
	self endon("disconnect");
	self notify("hash_46060f3c");
	self endon("hash_46060f3c");
	while(self namespace_851dc78f::function_5f9a13b3("specialty_razor"))
	{
		self waittill("weapon_melee");
		self function_ecb2fc7();
		while(self IsMeleeing())
		{
			wait(0.05);
		}
	}
}

/*
	Name: function_625d2dad
	Namespace: namespace_41c569fa
	Checksum: 0x424F4353
	Offset: 0x1040
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 402
*/
function function_625d2dad()
{
	self endon("disconnect");
	self notify("hash_625d2dad");
	self endon("hash_625d2dad");
	self thread function_41c569fa();
	while(1)
	{
		if(!self hasPerk("specialty_widowswine") && self namespace_851dc78f::function_5f9a13b3("specialty_razor"))
		{
			if(self hasweapon(self zm_utility::get_player_melee_weapon()) && self zm_utility::get_player_melee_weapon() == level.weaponBaseMelee)
			{
				self GiveWeapon(level.var_c49c9c0);
				self zm_utility::set_player_melee_weapon(level.var_c49c9c0);
			}
		}
		else if(!self namespace_851dc78f::function_5f9a13b3("specialty_razor"))
		{
			if(self hasweapon(level.var_c49c9c0) && self zm_utility::get_player_melee_weapon() == level.var_c49c9c0)
			{
				self GiveWeapon(level.weaponBaseMelee);
				self zm_utility::set_player_melee_weapon(level.weaponBaseMelee);
			}
		}
		wait(0.1);
	}
}

