#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
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
#include scripts\zm\_zm_bgb;
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

#namespace namespace_4d30ea15;

/*
	Name: __init__sytem__
	Namespace: namespace_4d30ea15
	Checksum: 0x424F4353
	Offset: 0x550
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 47
*/
function autoexec __init__sytem__()
{
	system::register("PACKBOX", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_4d30ea15
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
	Namespace: namespace_4d30ea15
	Checksum: 0x424F4353
	Offset: 0x5B0
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_packbox", "customperk", 2500, &"ZM_REAP_MOD_PERK_PACKBOX", GetWeapon("zombie_perk_bottle_packbox"));
	zm_perks::register_perk_precache_func("specialty_packbox", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_packbox", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_packbox", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_packbox", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_packbox", "Pack-A-Box", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_packbox", &"ZM_REAP_MOD_PERK_PACKBOX_DB", 1500, "Pack-A-Box", "packbox");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_packbox"] = 1;
	level.magicbox_should_upgrade_weapon_override = &function_4d493aca;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_4d30ea15
	Checksum: 0x424F4353
	Offset: 0x768
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_packbox"] = spawnstruct();
	level.machine_assets["specialty_packbox"].weapon = GetWeapon("zombie_perk_bottle_packbox");
	level.machine_assets["specialty_packbox"].off_model = "cz_zombie_vending_packbox";
	level.machine_assets["specialty_packbox"].on_model = "cz_zombie_vending_packbox";
}

/*
	Name: function_19157aff
	Namespace: namespace_4d30ea15
	Checksum: 0x424F4353
	Offset: 0x810
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 124
*/
function function_19157aff()
{
	return;
	ERROR: Bad function call
}

/*
	Name: function_99c1452c
	Namespace: namespace_4d30ea15
	Checksum: 0x424F4353
	Offset: 0x820
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 140
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_packbox", "packbox", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_4d30ea15
	Checksum: 0x424F4353
	Offset: 0x868
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 155
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_packbox";
	use_trigger.script_label = "";
	use_trigger.target = "Pack-A-Box";
	perk_machine.script_string = "specialty_packbox";
	perk_machine.targetname = "Pack-A-Box";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_packbox";
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_4d30ea15
	Checksum: 0x424F4353
	Offset: 0x930
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 181
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_packbox"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_packbox"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_4d30ea15
	Checksum: 0x424F4353
	Offset: 0x9B8
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 209
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_packbox"] = 0;
	self.var_b5c2c258["specialty_packbox"] = undefined;
	self.var_d6aef449["specialty_packbox"] = undefined;
}

/*
	Name: function_4d493aca
	Namespace: namespace_4d30ea15
	Checksum: 0x424F4353
	Offset: 0xA18
	Size: 0x150
	Parameters: 2
	Flags: None
	Line Number: 226
*/
function function_4d493aca(player, weapon)
{
	if(player bgb::is_enabled("zm_bgb_crate_power") || isdefined(level.var_a4cae63d))
	{
		return 1;
	}
	if(player bgb::is_enabled("zm_bgb_mighty_midas"))
	{
		return 1;
	}
	if(player namespace_851dc78f::function_5f9a13b3("specialty_packbox") && RandomInt(100) < 20 || (player namespace_851dc78f::function_b690a849("specialty_packbox") && RandomInt(100) < 30))
	{
		if(player namespace_851dc78f::function_b690a849("specialty_packbox") && RandomInt(100) < 20)
		{
			player thread function_f9287409(weapon);
		}
		return 1;
	}
	return 0;
	waittillframeend;
}

/*
	Name: function_f9287409
	Namespace: namespace_4d30ea15
	Checksum: 0x424F4353
	Offset: 0xB70
	Size: 0x94
	Parameters: 1
	Flags: None
	Line Number: 258
*/
function function_f9287409(weapon)
{
	self endon("disconnect");
	self waittill("weapon_give", gun);
	if(weapon == gun)
	{
		self waittill("weapon_change_complete");
		b_weapon_supports_aat = zm_weapons::weapon_supports_aat(weapon);
		if(b_weapon_supports_aat)
		{
			self AAT::acquire(weapon);
		}
	}
}

