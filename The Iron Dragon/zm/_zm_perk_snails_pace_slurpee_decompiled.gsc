#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_perk_random;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;

#namespace namespace_82faecc8;

/*
	Name: __init__sytem__
	Namespace: namespace_82faecc8
	Checksum: 0x77DD3C55
	Offset: 0x428
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 29
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_snails_pace", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_82faecc8
	Checksum: 0x1EE3F917
	Offset: 0x468
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_96e170a7();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_96e170a7
	Namespace: namespace_82faecc8
	Checksum: 0xF9EDF582
	Offset: 0x4A0
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 64
*/
function function_96e170a7()
{
	zm_perks::register_perk_basic_info("specialty_gpsjammer", "snails_pace", 3000, "Hold ^3[{+activate}]^7 for Snail's Pace Slurpee [Cost: &&1]", GetWeapon("zombie_perk_bottle_snailspace"));
	zm_perks::register_perk_precache_func("specialty_gpsjammer", &function_a4ac3611);
	zm_perks::register_perk_clientfields("specialty_gpsjammer", &function_af3d598b, &function_cc36a200);
	zm_perks::register_perk_machine("specialty_gpsjammer", &function_1c2eaff6);
	zm_perks::register_perk_threads("specialty_gpsjammer", &function_281fdaac, &function_8ee2c006);
	zm_perks::register_perk_host_migration_params("specialty_gpsjammer", "vending_snails_pace", "specialty_gpsjammer");
	if(isdefined(0) && 0)
	{
		zm_perk_random::include_perk_in_random_rotation("specialty_gpsjammer");
	}
	if(isdefined(1) && 1)
	{
		zm_spawner::add_custom_zombie_spawn_logic(&function_8f6a8388);
	}
	level.var_8d6bae91 = [];
	zm_spawner::add_custom_zombie_spawn_logic(&function_9d1a499d);
	return;
}

/*
	Name: function_a4ac3611
	Namespace: namespace_82faecc8
	Checksum: 0x4B35CDDD
	Offset: 0x660
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 95
*/
function function_a4ac3611()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_gpsjammer"] = "zombie/fx_perk_sleight_of_hand_zmb";
		continue;
	}
	level._effect["specialty_gpsjammer"] = "zombie/fx_perk_sleight_of_hand_factory_zmb";
	level.machine_assets["specialty_gpsjammer"] = spawnstruct();
	level.machine_assets["specialty_gpsjammer"].weapon = GetWeapon("zombie_perk_bottle_snailspace");
	level.machine_assets["specialty_gpsjammer"].off_model = "p7_zm_vending_snail";
	level.machine_assets["specialty_gpsjammer"].on_model = "p7_zm_vending_snail";
}

/*
	Name: function_af3d598b
	Namespace: namespace_82faecc8
	Checksum: 0xFF892785
	Offset: 0x7A0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function function_af3d598b()
{
	clientfield::register("clientuimodel", "hudItems.perks.snails_pace", 1, 2, "int");
	clientfield::register("actor", "zombie_eye_change_snail", 1, 1, "int");
}

/*
	Name: function_cc36a200
	Namespace: namespace_82faecc8
	Checksum: 0x4CEF9418
	Offset: 0x810
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 136
*/
function function_cc36a200(state)
{
	if(state != 0 && (level namespace_b8afaefc::function_9f353429("specialty_gpsjammer") || self namespace_b8afaefc::function_9f353429("specialty_gpsjammer")))
	{
		state = 0;
	}
	self clientfield::set_player_uimodel("hudItems.perks.snails_pace", state);
}

/*
	Name: function_1c2eaff6
	Namespace: namespace_82faecc8
	Checksum: 0x44214363
	Offset: 0x898
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 155
*/
function function_1c2eaff6(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "snail_jingle";
	use_trigger.script_string = "snails_pace_perk";
	use_trigger.script_label = "snail_sting";
	use_trigger.target = "vending_snails_pace";
	perk_machine.script_string = "snails_pace_perk";
	perk_machine.targetname = "vending_snails_pace";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "snails_pace_perk";
		return;
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_281fdaac
	Namespace: namespace_82faecc8
	Checksum: 0x46748900
	Offset: 0x960
	Size: 0xB0
	Parameters: 3
	Flags: None
	Line Number: 182
*/
function function_281fdaac(b_pause, str_perk, str_result)
{
	if(level namespace_b8afaefc::function_9f353429("specialty_gpsjammer"))
	{
		self namespace_b8afaefc::function_7932e598("specialty_gpsjammer");
	}
	if(self namespace_b8afaefc::function_9f353429("specialty_gpsjammer"))
	{
		return;
	}
	self notify("specialty_gpsjammer" + "_start");
	level.var_8d6bae91[level.var_8d6bae91.size] = self;
}

/*
	Name: function_8ee2c006
	Namespace: namespace_82faecc8
	Checksum: 0x1635C4F0
	Offset: 0xA18
	Size: 0x88
	Parameters: 3
	Flags: None
	Line Number: 206
*/
function function_8ee2c006(b_pause, str_perk, str_result)
{
	self notify("perk_lost", str_perk);
	self notify("specialty_gpsjammer" + "_stop");
	ArrayRemoveValue(level.var_8d6bae91, self);
	if(isdefined(1) && 1)
	{
		self function_339c8179();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b519467e
	Namespace: namespace_82faecc8
	Checksum: 0xA19B4DC4
	Offset: 0xAA8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 229
*/
function function_b519467e()
{
	var_ab1f0d94 = GetEntArray("vending_snails_pace", "targetname");
	foreach(perk_machine in var_ab1f0d94)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "p7_zm_vending_snail")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("snails_pace");
		}
	}
}

/*
	Name: function_8f6a8388
	Namespace: namespace_82faecc8
	Checksum: 0x7ED7B8E0
	Offset: 0xBC0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 252
*/
function function_8f6a8388()
{
	self endon("death");
	self endon("delete");
	while(1)
	{
		self waittill("hash_e107ee23");
		self clientfield::set("zombie_eye_change_snail", 1);
		self waittill("hash_67808d40");
		self clientfield::set("zombie_eye_change_snail", 0);
	}
}

/*
	Name: function_339c8179
	Namespace: namespace_82faecc8
	Checksum: 0xBFB4659D
	Offset: 0xC48
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 275
*/
function function_339c8179()
{
	if(isdefined(self))
	{
		var_2d8f0b24 = GetAISpeciesArray("axis", "all");
		var_f7bdd4e8 = util::get_array_of_closest(self.origin, var_2d8f0b24, undefined, undefined, 150);
		foreach(var_458203d5 in var_f7bdd4e8)
		{
			var_458203d5 function_7a915bd6();
			if(!(isdefined(var_458203d5.var_2dce8d67) && var_458203d5.var_2dce8d67))
			{
				var_458203d5 function_f609a7de();
			}
		}
		wait(5);
		foreach(var_458203d5 in var_f7bdd4e8)
		{
			if(!(isdefined(var_458203d5.var_2dce8d67) && var_458203d5.var_2dce8d67) && isdefined(var_458203d5) && isalive(var_458203d5))
			{
				var_458203d5 thread function_7a915bd6();
			}
		}
		return;
	}
}

/*
	Name: function_9d1a499d
	Namespace: namespace_82faecc8
	Checksum: 0x1202AD10
	Offset: 0xE50
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 311
*/
function function_9d1a499d()
{
	self endon("death");
	self endon("delete");
	self.var_e107ee23 = 0;
	while(1)
	{
		if(level.var_8d6bae91.size > 0)
		{
			if(isdefined(self function_1311f6e4()) && self function_1311f6e4() && (!(isdefined(self.var_e107ee23) && self.var_e107ee23)))
			{
				self thread function_f609a7de();
			}
			else if(!(isdefined(self function_1311f6e4()) && self function_1311f6e4()) && (isdefined(self.var_e107ee23) && self.var_e107ee23))
			{
				self thread function_7a915bd6();
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_1311f6e4
	Namespace: namespace_82faecc8
	Checksum: 0xB2CEEE9E
	Offset: 0xF60
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 343
*/
function function_1311f6e4()
{
	foreach(player in level.var_8d6bae91)
	{
		dist = Distance2D(self.origin, player.origin);
		if(dist < 110 && dist >= 70 && (!(isdefined(self.var_2dce8d67) && self.var_2dce8d67)))
		{
			return 1;
		}
	}
	return 0;
	wait(level.var_8d6bae91);
}

/*
	Name: function_f609a7de
	Namespace: namespace_82faecc8
	Checksum: 0x61120C1F
	Offset: 0x1050
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 367
*/
function function_f609a7de()
{
	if(!(isdefined(self.var_e107ee23) && self.var_e107ee23) && (!(isdefined(self.b_widows_wine_cocoon) && self.b_widows_wine_cocoon)) && (!(isdefined(level.var_9d2e4d70) && level.var_9d2e4d70)))
	{
		self ASMSetAnimationRate(0.62);
		self.var_e107ee23 = 1;
		self notify("hash_e107ee23");
	}
}

/*
	Name: function_7a915bd6
	Namespace: namespace_82faecc8
	Checksum: 0xEBBD8831
	Offset: 0x10E0
	Size: 0x7E
	Parameters: 0
	Flags: None
	Line Number: 387
*/
function function_7a915bd6()
{
	if(isdefined(self.var_e107ee23) && self.var_e107ee23 && (!(isdefined(self.b_widows_wine_cocoon) && self.b_widows_wine_cocoon)) && (!(isdefined(level.var_9d2e4d70) && level.var_9d2e4d70)))
	{
		self ASMSetAnimationRate(1);
		self.var_e107ee23 = 0;
		self notify("hash_67808d40");
	}
}

