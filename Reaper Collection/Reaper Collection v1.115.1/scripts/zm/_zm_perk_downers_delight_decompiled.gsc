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

#namespace namespace_b1c002a5;

/*
	Name: __init__sytem__
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0x590
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("DOWNERS_DELIGHT", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0x5D0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function __init__()
{
	function_1a92256e();
	return;
	ERROR: Bad function call
}

/*
	Name: function_1a92256e
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0x5F0
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_downersdelight", "customperk", 2000, &"ZM_REAP_MOD_PERK_DOWNERS_DELIGHT", GetWeapon("zombie_perk_bottle_downers_delight"));
	zm_perks::register_perk_precache_func("specialty_downersdelight", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_downersdelight", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_downersdelight", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_downersdelight", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_downersdelight", "Downers Delight", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_downersdelight", &"ZM_REAP_MOD_PERK_DOWNERS_DELIGHT_DB", 2000, "Downers Delight", "downersdelight");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_downersdelight"] = 1;
	callback::on_spawned(&on_player_connect);
	return;
	ERROR: Bad function call
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0x7B0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_downersdelight"] = spawnstruct();
	level.machine_assets["specialty_downersdelight"].weapon = GetWeapon("zombie_perk_bottle_downers_delight");
	level.machine_assets["specialty_downersdelight"].off_model = "cz_zombie_vending_downers_delight_off";
	level.machine_assets["specialty_downersdelight"].on_model = "cz_zombie_vending_downers_delight";
}

/*
	Name: function_19157aff
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0x858
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
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0x868
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 138
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_downersdelight", "downersdelight", "SetIconActive", state);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_edb3a90b
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0x8B0
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 155
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_downers_jingle";
	use_trigger.script_string = "specialty_downersdelight";
	use_trigger.script_label = "mus_perks_downers_sting";
	use_trigger.target = "Downers Delight";
	perk_machine.script_string = "specialty_downersdelight";
	perk_machine.targetname = "Downers Delight";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_downersdelight";
		return;
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0x978
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 180
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_downersdelight"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_downersdelight"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0xA00
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 208
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_downersdelight"] = 0;
	self.var_b5c2c258["specialty_downersdelight"] = undefined;
	self.var_d6aef449["specialty_downersdelight"] = undefined;
}

/*
	Name: on_player_connect
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0xA60
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function on_player_connect()
{
	self thread function_601bf342();
}

/*
	Name: function_601bf342
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0xA88
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 240
*/
function function_601bf342()
{
	self endon("disconnect");
	self notify("hash_70e92b79");
	self endon("hash_70e92b79");
	self thread function_7c6cdc89();
	while(1)
	{
		if(self namespace_851dc78f::function_5f9a13b3("specialty_downersdelight"))
		{
			self.var_11702a5f = 1;
			if(self namespace_851dc78f::function_b690a849("specialty_downersdelight"))
			{
				self.n_bleedout_time_multiplier = 3;
			}
			else
			{
				self.n_bleedout_time_multiplier = 2;
			}
		}
		else if(!self laststand::player_is_in_laststand())
		{
			self.var_11702a5f = undefined;
			self.n_bleedout_time_multiplier = 1;
		}
		wait(0.1);
	}
}

/*
	Name: function_7c6cdc89
	Namespace: namespace_b1c002a5
	Checksum: 0x424F4353
	Offset: 0xB80
	Size: 0x1A2
	Parameters: 0
	Flags: None
	Line Number: 279
*/
function function_7c6cdc89()
{
	self endon("disconnect");
	self notify("hash_7c6cdc89");
	self endon("hash_7c6cdc89");
	while(1)
	{
		self waittill("player_downed");
		var_5e3fcfc3 = 0;
		if(isdefined(self.laststandpistol) && self hasweapon(self.laststandpistol))
		{
			var_5e3fcfc3 = 1;
		}
		wait(0.01);
		if(isdefined(self.var_11702a5f))
		{
			if(isdefined(self.laststandpistol) && self hasweapon(self.laststandpistol) && (!(isdefined(self.hadpistol) && self.hadpistol)))
			{
				self TakeWeapon(self.laststandpistol);
			}
			self thread zm_laststand::laststand_enable_player_weapons();
			self SwitchToWeapon(self.lastActiveWeapon);
			if(isdefined(self.laststandpistol) && self hasweapon(self.laststandpistol) && (!(isdefined(self.hadpistol) && self.hadpistol)) && !var_5e3fcfc3)
			{
				self TakeWeapon(self.laststandpistol);
			}
			self.var_11702a5f = undefined;
		}
	}
}

