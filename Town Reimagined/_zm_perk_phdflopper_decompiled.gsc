#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;

#namespace zm_perk_phdflopper;

/*
	Name: __init__sytem__
	Namespace: zm_perk_phdflopper
	Checksum: 0x839CAFCA
	Offset: 0x560
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 33
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_phdflopper", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_phdflopper
	Checksum: 0x310E749A
	Offset: 0x5A0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_phdflopper_perk_for_level();
	}
}

/*
	Name: enable_phdflopper_perk_for_level
	Namespace: zm_perk_phdflopper
	Checksum: 0xD516896
	Offset: 0x5D8
	Size: 0x348
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function enable_phdflopper_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_phdflopper", "phdflopper", 2000, "Hold ^3[{+activate}]^7 for P.H.D Flopper [Cost: &&1]", GetWeapon("zombie_perk_bottle_nuke"));
	zm_perks::register_perk_precache_func("specialty_phdflopper", &phdflopper_precache);
	zm_perks::register_perk_clientfields("specialty_phdflopper", &phdflopper_register_clientfield, &phdflopper_set_clientfield);
	zm_perks::register_perk_machine("specialty_phdflopper", &phdflopper_perk_machine_setup);
	zm_perks::register_perk_host_migration_params("specialty_phdflopper", "vending_phdflopper", "specialty_phdflopper");
	zm_perks::register_perk_threads("specialty_phdflopper", &function_2be6073e, &function_afaadeac);
	zm_perks::register_perk_damage_override_func(&function_52500da2);
	if(level.script == "zm_zod")
	{
		namespace_b8afaefc::function_8fd06793((3059, -5478, 128), VectorScale((0, -1, 0), 90), "specialty_phdflopper", "zombie_vending_nuke");
	}
	else if(level.script == "zm_factory")
	{
		namespace_b8afaefc::function_8fd06793((-732, -40, 70), (0, 0, 0), "specialty_phdflopper", "zombie_vending_nuke");
	}
	else if(level.script == "zm_castle")
	{
		namespace_b8afaefc::function_8fd06793((-1284, 2843, 824), (0, 0, 0), "specialty_phdflopper", "zombie_vending_nuke");
	}
	else if(level.script == "zm_island")
	{
		namespace_b8afaefc::function_8fd06793((-2005, -1205, -303), VectorScale((0, 1, 0), 23), "specialty_phdflopper", "zombie_vending_nuke");
	}
	else if(level.script == "zm_stalingrad")
	{
		namespace_b8afaefc::function_8fd06793((-1050, 2972, 160), VectorScale((0, 1, 0), 180), "specialty_phdflopper", "zombie_vending_nuke");
	}
	else if(level.script == "zm_genesis")
	{
		namespace_b8afaefc::function_8fd06793((675, 4541, 1226), VectorScale((0, -1, 0), 10), "specialty_phdflopper", "zombie_vending_nuke");
	}
}

/*
	Name: phdflopper_precache
	Namespace: zm_perk_phdflopper
	Checksum: 0x930442D2
	Offset: 0x928
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 111
*/
function phdflopper_precache()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_phdflopper"] = "zombie/fx_perk_doubletap2_zmb";
		continue;
	}
	level._effect["specialty_phdflopper"] = "zombie/fx_perk_doubletap2_factory_zmb";
	level.machine_assets["specialty_phdflopper"] = spawnstruct();
	level.machine_assets["specialty_phdflopper"].weapon = GetWeapon("zombie_perk_bottle_nuke");
	level.machine_assets["specialty_phdflopper"].off_model = "zombie_vending_nuke";
	level.machine_assets["specialty_phdflopper"].on_model = "zombie_vending_nuke_on";
}

/*
	Name: phdflopper_register_clientfield
	Namespace: zm_perk_phdflopper
	Checksum: 0x9ACF73B8
	Offset: 0xA68
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 136
*/
function phdflopper_register_clientfield()
{
	return;
	continue;
}

/*
	Name: phdflopper_set_clientfield
	Namespace: zm_perk_phdflopper
	Checksum: 0x9722CA
	Offset: 0xA78
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 152
*/
function phdflopper_set_clientfield(state)
{
}

/*
	Name: phdflopper_perk_machine_setup
	Namespace: zm_perk_phdflopper
	Checksum: 0x53964180
	Offset: 0xA90
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 166
*/
function phdflopper_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_phdflopper_jingle";
	use_trigger.script_string = "phdflopper_perk";
	use_trigger.script_label = "mus_perks_phdflopper_sting";
	use_trigger.target = "vending_phdflopper";
	perk_machine.script_string = "phdflopper_perk";
	perk_machine.targetname = "vending_phdflopper";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "phdflopper_perk";
	}
}

/*
	Name: function_2be6073e
	Namespace: zm_perk_phdflopper
	Checksum: 0xFD0EDD60
	Offset: 0xB58
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 190
*/
function function_2be6073e(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_phdflopper", "t6_specialty_phdflopper");
	self notify("specialty_phdflopper" + "_start");
	self function_439de62b();
}

/*
	Name: function_afaadeac
	Namespace: zm_perk_phdflopper
	Checksum: 0x7D27C172
	Offset: 0xBD8
	Size: 0x80
	Parameters: 3
	Flags: None
	Line Number: 207
*/
function function_afaadeac(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_phdflopper");
	self notify("perk_lost", str_perk);
	self notify("specialty_phdflopper" + "_stop");
	self function_735322b4();
}

/*
	Name: function_1c7a91a8
	Namespace: zm_perk_phdflopper
	Checksum: 0x85976E3E
	Offset: 0xC60
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function function_1c7a91a8()
{
	var_115e7e2 = GetEntArray("vending_phdflopper", "targetname");
	foreach(perk_machine in var_115e7e2)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "zombie_vending_nuke_on")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("phdflopper");
		}
	}
}

/*
	Name: function_52500da2
	Namespace: zm_perk_phdflopper
	Checksum: 0xACC083C1
	Offset: 0xD78
	Size: 0xF8
	Parameters: 10
	Flags: None
	Line Number: 248
*/
function function_52500da2(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!self hasPerk("specialty_phdflopper"))
	{
		return undefined;
	}
	switch(sMeansOfDeath)
	{
		case "MOD_BURNED":
		case "MOD_ELECTOCUTED":
		case "MOD_EXPLOSIVE":
		case "MOD_EXPLOSIVE_SPLASH":
		case "MOD_FALLING":
		case "MOD_GRENADE":
		case "MOD_GRENADE_SPLASH":
		case "MOD_IMPACT":
		case "MOD_PROJECTILE":
		case "MOD_PROJECTILE_SPLASH":
		{
			iDamage = 0;
			return 0;
			break;
		}
		default
		{
		}
	}
	return undefined;
}

/*
	Name: function_439de62b
	Namespace: zm_perk_phdflopper
	Checksum: 0xE2DB4962
	Offset: 0xE78
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 288
*/
function function_439de62b()
{
	self thread function_f3cb2d65();
}

/*
	Name: function_735322b4
	Namespace: zm_perk_phdflopper
	Checksum: 0xC2245871
	Offset: 0xEA0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 303
*/
function function_735322b4()
{
	self notify("hash_f3cb2d65");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f3cb2d65
	Namespace: zm_perk_phdflopper
	Checksum: 0xAE5172C8
	Offset: 0xEC0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 320
*/
function function_f3cb2d65()
{
	self endon("hash_f3cb2d65");
	self notify("hash_f3cb2d65");
	while(1)
	{
		self waittill("grenade_fire", grenade, weapon);
		if(!self hasPerk("specialty_phdflopper"))
		{
			continue;
		}
		if(isdefined(grenade.additional) && grenade.additional)
		{
			continue;
		}
		var_2d1c309 = self zm_utility::get_player_lethal_grenade();
		if(weapon != var_2d1c309)
		{
			continue;
		}
		self thread function_9ebde1a6(grenade, weapon);
	}
}

/*
	Name: function_9ebde1a6
	Namespace: zm_perk_phdflopper
	Checksum: 0xE677D6AB
	Offset: 0xFA8
	Size: 0x130
	Parameters: 2
	Flags: None
	Line Number: 354
*/
function function_9ebde1a6(grenade, weapon)
{
	if(isdefined(grenade))
	{
		grenade function_277cd86a();
	}
	fraction = 72;
	for(i = 0; i < 4; i++)
	{
		wait(0.3);
		self playsound("dig_sites_grenade");
		if(!isdefined(grenade))
		{
			origin = self GetTagOrigin("j_spineupper");
			continue;
		}
		origin = grenade.origin;
		var_3ccf1245 = self MagicGrenadeType(weapon, origin, VectorScale((0, 0, 1), 300), 3);
		var_3ccf1245.additional = 1;
	}
}

/*
	Name: function_277cd86a
	Namespace: zm_perk_phdflopper
	Checksum: 0x4F37533
	Offset: 0x10E0
	Size: 0x64
	Parameters: 0
	Flags: None
	Line Number: 386
*/
function function_277cd86a()
{
	self endon("death");
	self endon("grenade_bounce");
	prev_origin = self.origin;
	while(1)
	{
		wait(0.05);
		if(prev_origin == self.origin)
		{
			break;
		}
		prev_origin = self.origin;
	}
}

