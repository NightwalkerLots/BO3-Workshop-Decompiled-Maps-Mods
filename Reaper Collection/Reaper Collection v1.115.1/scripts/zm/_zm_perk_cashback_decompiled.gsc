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

#namespace namespace_26037cbd;

/*
	Name: __init__sytem__
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0x538
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("CASHBACK", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0x578
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
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0x598
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_cashback", "customperk", 3000, &"ZM_REAP_MOD_PERK_CASHBACK", GetWeapon("zombie_perk_bottle_cashback"));
	zm_perks::register_perk_precache_func("specialty_cashback", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_cashback", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_cashback", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_cashback", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_cashback", "Cashback Cocktail", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_cashback", &"ZM_REAP_MOD_PERK_CASHBACK_DB", 2000, "Cashback Cocktail", "cashback");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_cashback"] = 1;
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0x758
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_cashback"] = spawnstruct();
	level.machine_assets["specialty_cashback"].weapon = GetWeapon("zombie_perk_bottle_cashback");
	level.machine_assets["specialty_cashback"].off_model = "cz_zombie_vending_cashback";
	level.machine_assets["specialty_cashback"].on_model = "cz_zombie_vending_cashback";
}

/*
	Name: function_19157aff
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0x800
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function function_19157aff()
{
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_99c1452c
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0x810
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 137
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_cashback", "cashback", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0x858
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 152
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_cashback_jingle";
	use_trigger.script_string = "specialty_cashback";
	use_trigger.script_label = "mus_perks_cashback_sting";
	use_trigger.target = "Cashback Cocktail";
	perk_machine.script_string = "specialty_cashback";
	perk_machine.targetname = "Cashback Cocktail";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_cashback";
		return;
	}
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0x920
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
	self.disabled_perks["specialty_cashback"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_cashback"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0x9A8
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 207
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_cashback"] = 0;
	self.var_b5c2c258["specialty_cashback"] = undefined;
	self.var_d6aef449["specialty_cashback"] = undefined;
}

/*
	Name: on_player_spawned
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0xA08
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 224
*/
function on_player_spawned()
{
	self thread function_26037cbd();
}

/*
	Name: function_26037cbd
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0xA30
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 239
*/
function function_26037cbd()
{
	self endon("disconnect");
	self notify("hash_29f275ef");
	self endon("hash_29f275ef");
	while(1)
	{
		level waittill("spent_points", player, points);
		if(player == self && self namespace_851dc78f::function_5f9a13b3("specialty_cashback"))
		{
			self thread function_fb344889(points);
		}
	}
}

/*
	Name: function_fb344889
	Namespace: namespace_26037cbd
	Checksum: 0x424F4353
	Offset: 0xAD0
	Size: 0x7C
	Parameters: 1
	Flags: None
	Line Number: 264
*/
function function_fb344889(points)
{
	self endon("disconnect");
	wait(2);
	self zm_score::add_to_player_score(points * 0.2);
	if(self namespace_851dc78f::function_b690a849("specialty_cashback"))
	{
		self zm_score::add_to_player_score(points * 0.1);
	}
}

