#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace zm_perk_additionalprimaryweapon;

/*
	Name: __init__sytem__
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x428
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 29
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_additionalprimaryweapon", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x468
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	level.additionalprimaryweapon_limit = 3;
	enable_additional_primary_weapon_perk_for_level();
	callback::on_laststand(&on_laststand);
	level.return_additionalprimaryweapon = &return_additionalprimaryweapon;
	return;
}

/*
	Name: enable_additional_primary_weapon_perk_for_level
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x4D0
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function enable_additional_primary_weapon_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_additionalprimaryweapon", "additionalprimaryweapon", 4000, &"ZOMBIE_PERK_ADDITIONALPRIMARYWEAPON", GetWeapon("zombie_perk_bottle_additionalprimaryweapon"));
	zm_perks::register_perk_precache_func("specialty_additionalprimaryweapon", &additional_primary_weapon_precache);
	zm_perks::register_perk_clientfields("specialty_additionalprimaryweapon", &additional_primary_weapon_register_clientfield, &additional_primary_weapon_set_clientfield);
	zm_perks::register_perk_machine("specialty_additionalprimaryweapon", &additional_primary_weapon_perk_machine_setup);
	zm_perks::register_perk_threads("specialty_additionalprimaryweapon", &give_additional_primary_weapon_perk, &take_additional_primary_weapon_perk);
	zm_perks::register_perk_host_migration_params("specialty_additionalprimaryweapon", "vending_additionalprimaryweapon", "additionalprimaryweapon_light");
}

/*
	Name: additional_primary_weapon_precache
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x608
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 83
*/
function additional_primary_weapon_precache()
{
	if(isdefined(level.additional_primary_weapon_precache_override_func))
	{
		[[level.additional_primary_weapon_precache_override_func]]();
		return;
	}
	level._effect["additionalprimaryweapon_light"] = "zombie/fx_perk_mule_kick_zmb";
	level.machine_assets["specialty_additionalprimaryweapon"] = spawnstruct();
	level.machine_assets["specialty_additionalprimaryweapon"].weapon = GetWeapon("zombie_perk_bottle_additionalprimaryweapon");
	level.machine_assets["specialty_additionalprimaryweapon"].off_model = "p7_zm_vending_three_gun_off";
	level.machine_assets["specialty_additionalprimaryweapon"].on_model = "p7_zm_vending_three_gun";
}

/*
	Name: additional_primary_weapon_register_clientfield
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x6F0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function additional_primary_weapon_register_clientfield()
{
}

/*
	Name: additional_primary_weapon_set_clientfield
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x700
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 121
*/
function additional_primary_weapon_set_clientfield(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_additionalprimaryweapon", "additional_primary_weapon", "SetIconActive", state);
}

/*
	Name: additional_primary_weapon_perk_machine_setup
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x748
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 136
*/
function additional_primary_weapon_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_mulekick_jingle";
	use_trigger.script_string = "tap_perk";
	use_trigger.script_label = "mus_perks_mulekick_sting";
	use_trigger.target = "vending_additionalprimaryweapon";
	perk_machine.script_string = "tap_perk";
	perk_machine.targetname = "vending_additionalprimaryweapon";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "tap_perk";
	}
}

/*
	Name: give_additional_primary_weapon_perk
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x810
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 160
*/
function give_additional_primary_weapon_perk()
{
}

/*
	Name: take_additional_primary_weapon_perk
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x820
	Size: 0x48
	Parameters: 3
	Flags: None
	Line Number: 174
*/
function take_additional_primary_weapon_perk(b_pause, str_perk, str_result)
{
	if(b_pause || str_result == str_perk)
	{
		self take_additionalprimaryweapon();
	}
}

/*
	Name: take_additionalprimaryweapon
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0x870
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 192
*/
function take_additionalprimaryweapon()
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
	self.weapons_taken_by_losing_specialty_additionalprimaryweapon = [];
	pwtcbt = primary_weapons_that_can_be_taken.size;
	while(pwtcbt >= 3)
	{
		weapon_to_take = primary_weapons_that_can_be_taken[pwtcbt - 1];
		self.weapons_taken_by_losing_specialty_additionalprimaryweapon[weapon_to_take] = zm_weapons::get_player_weapondata(self, weapon_to_take);
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
	Name: on_laststand
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0xA68
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 234
*/
function on_laststand()
{
	if(self hasPerk("specialty_additionalprimaryweapon"))
	{
		self.weapon_taken_by_losing_specialty_additionalprimaryweapon = take_additionalprimaryweapon();
	}
}

/*
	Name: return_additionalprimaryweapon
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x424F4353
	Offset: 0xAB8
	Size: 0x5C
	Parameters: 1
	Flags: None
	Line Number: 252
*/
function return_additionalprimaryweapon(w_returning)
{
	if(isdefined(self.weapons_taken_by_losing_specialty_additionalprimaryweapon[w_returning]))
	{
		self zm_weapons::weapondata_give(self.weapons_taken_by_losing_specialty_additionalprimaryweapon[w_returning]);
	}
	else
	{
		self zm_weapons::give_build_kit_weapon(w_returning);
	}
}

