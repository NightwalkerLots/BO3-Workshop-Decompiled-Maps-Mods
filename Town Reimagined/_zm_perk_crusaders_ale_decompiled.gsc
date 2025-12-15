#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\_zm_weapons;

#namespace namespace_e0e62135;

/*
	Name: __init__sytem__
	Namespace: namespace_e0e62135
	Checksum: 0x8E790ABC
	Offset: 0x5A0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 39
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_crusaders_ale", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_e0e62135
	Checksum: 0x2B57B68
	Offset: 0x5E0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_de02f6d8();
	}
}

/*
	Name: function_de02f6d8
	Namespace: namespace_e0e62135
	Checksum: 0xA44A8AC7
	Offset: 0x618
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_de02f6d8()
{
	zm_perks::register_perk_basic_info("specialty_flashprotection", "crusaders_ale", 2000, "Hold ^3[{+activate}]^7 for Crusader's Ale [Cost: &&1]", GetWeapon("zombie_perk_bottle_crusader_ale"));
	zm_perks::register_perk_precache_func("specialty_flashprotection", &function_faddb7a6);
	zm_perks::register_perk_clientfields("specialty_flashprotection", &function_85b1559c, &function_e3a818ed);
	zm_perks::register_perk_machine("specialty_flashprotection", &function_694ed0d1);
	zm_perks::register_perk_threads("specialty_flashprotection", &function_f6139291, &function_d849c84b);
	zm_perks::register_perk_host_migration_params("specialty_flashprotection", "vending_crusaders_ale", "specialty_flashprotection");
}

/*
	Name: function_faddb7a6
	Namespace: namespace_e0e62135
	Checksum: 0x99BE6BEA
	Offset: 0x750
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function function_faddb7a6()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_flashprotection"] = "zombie/fx_perk_juggernaut_zmb";
		continue;
	}
	level._effect["specialty_flashprotection"] = "zombie/fx_perk_juggernaut_factory_zmb";
	level.machine_assets["specialty_flashprotection"] = spawnstruct();
	level.machine_assets["specialty_flashprotection"].weapon = GetWeapon("zombie_perk_bottle_crusader_ale");
	level.machine_assets["specialty_flashprotection"].off_model = "vending_crusader_ale";
	level.machine_assets["specialty_flashprotection"].on_model = "vending_crusader_ale_on";
}

/*
	Name: function_85b1559c
	Namespace: namespace_e0e62135
	Checksum: 0x9ACF73B8
	Offset: 0x890
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 117
*/
function function_85b1559c()
{
}

/*
	Name: function_e3a818ed
	Namespace: namespace_e0e62135
	Checksum: 0x76149C13
	Offset: 0x8A0
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 131
*/
function function_e3a818ed(state)
{
}

/*
	Name: function_694ed0d1
	Namespace: namespace_e0e62135
	Checksum: 0x24CA14A0
	Offset: 0x8B8
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 145
*/
function function_694ed0d1(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_crusaders_ale_jingle";
	use_trigger.script_string = "crusaders_ale_perk";
	use_trigger.script_label = "mus_perks_crusaders_ale_sting";
	use_trigger.target = "vending_crusaders_ale";
	perk_machine.script_string = "crusaders_ale_perk";
	perk_machine.targetname = "vending_crusaders_ale";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "crusaders_ale_perk";
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_f6139291
	Namespace: namespace_e0e62135
	Checksum: 0x818356E1
	Offset: 0x980
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 171
*/
function function_f6139291(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_flashprotection", "madgaz_crusader_ale");
	self notify("specialty_flashprotection" + "_start");
	self thread function_ce72c900();
}

/*
	Name: function_d849c84b
	Namespace: namespace_e0e62135
	Checksum: 0x76329F1E
	Offset: 0xA00
	Size: 0x68
	Parameters: 3
	Flags: None
	Line Number: 188
*/
function function_d849c84b(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_flashprotection");
	self notify("perk_lost", str_perk);
	self notify("specialty_flashprotection" + "_stop");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ecbc73bf
	Namespace: namespace_e0e62135
	Checksum: 0x6E1D8EC3
	Offset: 0xA70
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 207
*/
function function_ecbc73bf()
{
	var_5ebba046 = GetEntArray("vending_crusaders_ale", "targetname");
	foreach(perk_machine in var_5ebba046)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "vending_crusader_ale_on")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("crusaders_ale");
		}
	}
}

/*
	Name: function_ce72c900
	Namespace: namespace_e0e62135
	Checksum: 0x1858E8B0
	Offset: 0xB88
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 230
*/
function function_ce72c900()
{
	self endon("hash_ff69282a");
	self setPerk("specialty_flashprotection");
	self thread function_3f4035ec();
	self thread function_fb503a42();
	if(!isdefined(level.var_e1f787f3))
	{
		thread function_8dfdb21e();
	}
}

/*
	Name: function_8dfdb21e
	Namespace: namespace_e0e62135
	Checksum: 0x50E553A6
	Offset: 0xC10
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 252
*/
function function_8dfdb21e()
{
	level.var_e1f787f3 = 1;
	while(function_285e761b())
	{
		var_2d8f0b24 = GetAISpeciesArray("axis");
		foreach(var_458203d5 in var_2d8f0b24)
		{
			if(!isdefined(var_458203d5.var_16ff2037))
			{
				var_458203d5 thread function_e7e79105();
				var_458203d5 thread function_674e922d();
			}
		}
		wait(5);
	}
	level.var_e1f787f3 = undefined;
}

/*
	Name: function_285e761b
	Namespace: namespace_e0e62135
	Checksum: 0xE2F42EC8
	Offset: 0xD28
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 281
*/
function function_285e761b()
{
	players = GetPlayers();
	foreach(player in players)
	{
		if(player hasPerk("specialty_flashprotection"))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_e7e79105
	Namespace: namespace_e0e62135
	Checksum: 0xE907326D
	Offset: 0xDE8
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 304
*/
function function_e7e79105()
{
	self endon("death");
	self.var_16ff2037 = 1;
	while(1)
	{
		self waittill("damage", damage, attacker, direction, point, type, tagName, modelName, partName, weapon, flags, inflictor, chargeLevel);
		if(type == "MOD_MELEE_WEAPON_BUTT" || (type == "MOD_MELEE" && attacker hasPerk("specialty_flashprotection")))
		{
			if(self.health > 150)
			{
				self DoDamage(150, self.origin, attacker, attacker, undefined, "MOD_MELEE");
			}
		}
	}
}

/*
	Name: function_674e922d
	Namespace: namespace_e0e62135
	Checksum: 0x61BF29C0
	Offset: 0xF38
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 331
*/
function function_674e922d()
{
	self waittill("death", attacker);
	if(attacker hasPerk("specialty_flashprotection"))
	{
		weap = attacker GetCurrentWeapon();
		if(isdefined(attacker.var_6027c460) && GetTime() - attacker.var_6027c460 < 1800)
		{
			attacker playlocalsound("crusade_money");
			attacker zm_score::add_to_player_score(130);
		}
	}
}

/*
	Name: function_3f4035ec
	Namespace: namespace_e0e62135
	Checksum: 0x1A2F4ED3
	Offset: 0x1008
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 355
*/
function function_3f4035ec()
{
	while(self hasPerk("specialty_flashprotection"))
	{
		level waittill("between_round_over");
		if(self hasPerk("specialty_flashprotection"))
		{
			skip = 1;
			primary_weapons = self GetWeaponsList(1);
			foreach(weap in primary_weapons)
			{
				if(weap.name == "zod_riotshield")
				{
					skip = 0;
				}
			}
			if(!skip)
			{
				self playlocalsound("repair_tick");
				self riotshield::player_damage_shield(-1500);
				self giveMaxAmmo("zod_riotshield");
			}
		}
	}
}

/*
	Name: function_fb503a42
	Namespace: namespace_e0e62135
	Checksum: 0xCB6C2CAA
	Offset: 0x1190
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 391
*/
function function_fb503a42()
{
	while(self hasPerk("specialty_flashprotection"))
	{
		if(self IsMeleeing())
		{
			self.var_6027c460 = GetTime();
			self thread function_f8ba90c1(1.3);
		}
		wait(0.05);
	}
}

/*
	Name: function_f8ba90c1
	Namespace: namespace_e0e62135
	Checksum: 0x4D5BF94E
	Offset: 0x1208
	Size: 0x3C
	Parameters: 1
	Flags: None
	Line Number: 414
*/
function function_f8ba90c1(time)
{
	self EnableInvulnerability();
	wait(time);
	self DisableInvulnerability();
}

