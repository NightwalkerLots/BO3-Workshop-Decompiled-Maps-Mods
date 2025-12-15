#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace zm_perk_additionalprimaryweapon;

/*
	Name: __init__sytem__
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x326DC7CB
	Offset: 0x438
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 29
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_additionalprimaryweapon", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xA0B9057
	Offset: 0x478
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_additional_primary_weapon_perk_for_level();
		return;
	}
	ERROR: Bad function call
}

/*
	Name: enable_additional_primary_weapon_perk_for_level
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xA67779D7
	Offset: 0x4B0
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 65
*/
function enable_additional_primary_weapon_perk_for_level()
{
	level.additionalprimaryweapon_limit = 3;
	zm_perks::register_perk_basic_info("specialty_additionalprimaryweapon", "additionalprimaryweapon", 4000, &"ZOMBIE_PERK_ADDITIONALPRIMARYWEAPON", GetWeapon("zombie_perk_bottle_additionalprimaryweapon"));
	zm_perks::register_perk_precache_func("specialty_additionalprimaryweapon", &additional_primary_weapon_precache);
	zm_perks::register_perk_clientfields("specialty_additionalprimaryweapon", &additional_primary_weapon_register_clientfield, &additional_primary_weapon_set_clientfield);
	zm_perks::register_perk_machine("specialty_additionalprimaryweapon", &additional_primary_weapon_perk_machine_setup);
	zm_perks::register_perk_threads("specialty_additionalprimaryweapon", &function_8a679456, &function_c493ba04);
	zm_perks::register_perk_host_migration_params("specialty_additionalprimaryweapon", "vending_additionalprimaryweapon", "specialty_additionalprimaryweapon");
	callback::on_laststand(&function_f4b8555a);
}

/*
	Name: additional_primary_weapon_precache
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x24EF9EE2
	Offset: 0x618
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function additional_primary_weapon_precache()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_additionalprimaryweapon"] = "zombie/fx_perk_mule_kick_zmb";
		continue;
	}
	level._effect["specialty_additionalprimaryweapon"] = "zombie/fx_perk_mule_kick_factory_zmb";
	level.machine_assets["specialty_additionalprimaryweapon"] = spawnstruct();
	level.machine_assets["specialty_additionalprimaryweapon"].weapon = GetWeapon("zombie_perk_bottle_additionalprimaryweapon");
	level.machine_assets["specialty_additionalprimaryweapon"].off_model = "p7_zm_vending_three_gun";
	level.machine_assets["specialty_additionalprimaryweapon"].on_model = "p7_zm_vending_three_gun";
}

/*
	Name: additional_primary_weapon_register_clientfield
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x9ACF73B8
	Offset: 0x758
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 112
*/
function additional_primary_weapon_register_clientfield()
{
	return;
}

/*
	Name: additional_primary_weapon_set_clientfield
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x9C21A93
	Offset: 0x768
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 127
*/
function additional_primary_weapon_set_clientfield(state)
{
}

/*
	Name: additional_primary_weapon_perk_machine_setup
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x7358EFA1
	Offset: 0x780
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 141
*/
function additional_primary_weapon_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_mulekick_jingle";
	use_trigger.script_string = "mule_perk";
	use_trigger.script_label = "mus_perks_mulekick_sting";
	use_trigger.target = "vending_additionalprimaryweapon";
	perk_machine.script_string = "mule_perk";
	perk_machine.targetname = "vending_additionalprimaryweapon";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "mule_perk";
		return;
	}
}

/*
	Name: function_8a679456
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xCC6EA698
	Offset: 0x848
	Size: 0x80
	Parameters: 3
	Flags: None
	Line Number: 166
*/
function function_8a679456(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_additionalprimaryweapon", "t6_specialty_additionalprimaryweapon");
	self notify("specialty_additionalprimaryweapon" + "_start");
	self function_867e156c(b_pause, str_perk, str_result);
}

/*
	Name: function_c493ba04
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xE5F1FF0
	Offset: 0x8D0
	Size: 0x68
	Parameters: 3
	Flags: None
	Line Number: 183
*/
function function_c493ba04(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_additionalprimaryweapon");
	self notify("perk_lost", str_perk);
	self notify("specialty_additionalprimaryweapon" + "_stop");
}

/*
	Name: function_42dd0f50
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xD858431D
	Offset: 0x940
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 200
*/
function function_42dd0f50()
{
	var_563705a = GetEntArray("vending_additionalprimaryweapon", "targetname");
	foreach(perk_machine in var_563705a)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "p7_zm_vending_three_gun")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("additionalprimaryweapon");
		}
	}
}

/*
	Name: function_867e156c
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xFA20174B
	Offset: 0xA58
	Size: 0x48
	Parameters: 3
	Flags: None
	Line Number: 223
*/
function function_867e156c(b_pause, str_perk, str_result)
{
	if(b_pause || str_result == str_perk)
	{
		self function_c8afb6db();
	}
}

/*
	Name: function_c8afb6db
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x3E18C4F
	Offset: 0xAA8
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 241
*/
function function_c8afb6db()
{
	weapon_to_take = level.weaponNone;
	if(isdefined(self._retain_perks) && self._retain_perks || (isdefined(self._retain_perks_array) && (isdefined(self._retain_perks_array["specialty_additionalprimaryweapon"]) && self._retain_perks_array["specialty_additionalprimaryweapon"])))
	{
		return weapon_to_take;
	}
	primary_weapons_that_can_be_taken = [];
	primaryWeapons = self getweaponslistprimaries();
	for(i = 0; i < primaryWeapons.size; i++)
	{
		if(zm_weapons::is_weapon_included(primaryWeapons[i]) || zm_weapons::is_weapon_upgraded(primaryWeapons[i]))
		{
			primary_weapons_that_can_be_taken[primary_weapons_that_can_be_taken.size] = primaryWeapons[i];
		}
	}
	pwtcbt = primary_weapons_that_can_be_taken.size;
	while(pwtcbt >= 3)
	{
		weapon_to_take = primary_weapons_that_can_be_taken[pwtcbt - 1];
		pwtcbt--;
		if(weapon_to_take == self GetCurrentWeapon())
		{
			self SwitchToWeapon(primary_weapons_that_can_be_taken[0]);
		}
		self TakeWeapon(weapon_to_take);
	}
	return weapon_to_take;
}

/*
	Name: function_f4b8555a
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x2E14E0BE
	Offset: 0xC68
	Size: 0x44
	Parameters: 0
	Flags: None
	Line Number: 281
*/
function function_f4b8555a()
{
	if(self hasPerk("specialty_additionalprimaryweapon"))
	{
		self.weapon_taken_by_losing_specialty_additionalprimaryweapon = function_c8afb6db();
	}
}

