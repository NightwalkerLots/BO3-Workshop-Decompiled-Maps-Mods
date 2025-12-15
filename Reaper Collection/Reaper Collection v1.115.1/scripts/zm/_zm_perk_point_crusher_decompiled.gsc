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

#namespace namespace_7e3e21d4;

/*
	Name: __init__sytem__
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x520
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("POINT_CRUSHER", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x560
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function __init__()
{
	function_1a92256e();
}

/*
	Name: function_1a92256e
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x580
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_point", "pointcrusher", 4000, &"ZM_REAP_MOD_PERK_POINT_CRUSHER", GetWeapon("zombie_perk_bottle_point_crusher"));
	zm_perks::register_perk_precache_func("specialty_point", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_point", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_point", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_point", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_point", "Point Crusher", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_point", &"ZM_REAP_MOD_PERK_POINT_CRUSHER_DB", 3000, "Point Crusher", "pointcrusher");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_point"] = 1;
	callback::on_spawned(&on_player_spawned);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x740
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_point"] = spawnstruct();
	level.machine_assets["specialty_point"].weapon = GetWeapon("zombie_perk_bottle_point_crusher");
	level.machine_assets["specialty_point"].off_model = "cz_vending_point_crusher";
	level.machine_assets["specialty_point"].on_model = "cz_vending_point_crusher";
}

/*
	Name: function_19157aff
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x7E8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 122
*/
function function_19157aff()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_99c1452c
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x7F8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 138
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_point", "pointcrusher", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x840
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 153
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_point";
	use_trigger.script_label = "";
	use_trigger.target = "Point Crusher";
	perk_machine.script_string = "specialty_point";
	perk_machine.targetname = "Point Crusher";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_point";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x908
	Size: 0x80
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
	self.disabled_perks["specialty_point"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_point"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x990
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 205
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_point"] = 0;
	self.var_b5c2c258["specialty_point"] = undefined;
	self.var_d6aef449["specialty_point"] = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: on_player_spawned
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0x9F0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 224
*/
function on_player_spawned()
{
	self thread function_7e3e21d4();
	return;
}

/*
	Name: function_7e3e21d4
	Namespace: namespace_7e3e21d4
	Checksum: 0x424F4353
	Offset: 0xA18
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 240
*/
function function_7e3e21d4()
{
	self endon("disconnect");
	self notify("hash_2cede09b");
	self endon("hash_2cede09b");
	while(1)
	{
		self waittill("zom_kill");
		if(self namespace_851dc78f::function_5f9a13b3("specialty_point"))
		{
			add = randomIntRange(10, randomIntRange(30, randomIntRange(60, 90)));
			if(self namespace_851dc78f::function_b690a849("specialty_point") && RandomInt(100) < 15)
			{
				add = add * 2;
			}
			self zm_score::add_to_player_score(add, 1, "POINT CRUSHER BONUS", 1);
		}
	}
}

