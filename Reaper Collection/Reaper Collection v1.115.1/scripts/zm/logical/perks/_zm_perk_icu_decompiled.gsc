#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\gameobjects_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_e423d491;

/*
	Name: __init__sytem__
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0x508
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 41
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_icu", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0x548
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function __init__()
{
	function_b765bce4();
}

/*
	Name: function_b765bce4
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0x568
	Size: 0x228
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function function_b765bce4()
{
	callback::on_laststand(&function_e0aed1f6);
	zm_perks::register_perk_basic_info("specialty_icu", "icu", 2500, &"ZM_REAP_MOD_PERK_ICU", GetWeapon("zombie_perk_bottle_icu"));
	zm_perks::register_perk_precache_func("specialty_icu", &function_c68503ae);
	zm_perks::register_perk_clientfields("specialty_icu", &function_3314c104, &function_3395d575);
	zm_perks::register_perk_machine("specialty_icu", &function_67649359);
	zm_perks::register_perk_threads("specialty_icu", &function_7c31d243, &function_f59f41e1);
	zm_perks::register_perk_host_migration_params("specialty_icu", "I.C.U.", "specialty_icu");
	level thread namespace_851dc78f::function_c3c32972("specialty_icu", &"ZM_REAP_MOD_PERK_ICU_DB", 1000, "I.C.U.", "icu");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_icu"] = 1;
	if(!isdefined(level._random_perk_machine_perk_list))
	{
		level._random_perk_machine_perk_list = [];
	}
	else if(!IsArray(level._random_perk_machine_perk_list))
	{
		level._random_perk_machine_perk_list = Array(level._random_perk_machine_perk_list);
	}
	level._random_perk_machine_perk_list[level._random_perk_machine_perk_list.size] = "specialty_icu";
}

/*
	Name: function_c68503ae
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0x798
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function function_c68503ae()
{
	level._effect["specialty_icu"] = "doubletap2_light";
	level.machine_assets["specialty_icu"] = spawnstruct();
	level.machine_assets["specialty_icu"].weapon = GetWeapon("zombie_perk_bottle_icu");
	level.machine_assets["specialty_icu"].off_model = "zombie_vending_icu_off";
	level.machine_assets["specialty_icu"].on_model = "zombie_vending_icu_on";
}

/*
	Name: function_3314c104
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0x860
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 126
*/
function function_3314c104()
{
}

/*
	Name: function_3395d575
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0x870
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 140
*/
function function_3395d575(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_icu", "icu", "SetIconActive", state);
	return;
}

/*
	Name: function_67649359
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0x8B8
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 156
*/
function function_67649359(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_icu_jingle";
	use_trigger.script_string = "specialty_icu";
	use_trigger.script_label = "mus_perks_icu_sting";
	use_trigger.target = "I.C.U.";
	perk_machine.script_string = "specialty_icu";
	perk_machine.targetname = "I.C.U.";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_icu";
	}
}

/*
	Name: function_7c31d243
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0x980
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 180
*/
function function_7c31d243()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_icu"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_icu"] = 1;
	self notify("specialty_icu" + "_start");
	self thread function_17d3e71();
}

/*
	Name: function_f59f41e1
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0xA30
	Size: 0xB0
	Parameters: 3
	Flags: None
	Line Number: 210
*/
function function_f59f41e1(b_pause, str_perk, str_result)
{
	if(isdefined(self.var_8b2e6a83))
	{
		self thread namespace_851dc78f::function_7647c83d(0.5);
		self.var_8b2e6a83 = undefined;
	}
	self.disabled_perks["specialty_icu"] = 0;
	self.var_b5c2c258["specialty_icu"] = undefined;
	self.var_d6aef449["specialty_icu"] = undefined;
	self notify("perk_lost", str_perk);
	self notify("specialty_icu" + "_stop");
}

/*
	Name: function_75a3cf47
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0xAE8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 234
*/
function function_75a3cf47()
{
	var_275964ef = GetEntArray("I.C.U.", "targetname");
	foreach(perk_machine in var_275964ef)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "zombie_vending_icu_on")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("icu");
		}
	}
}

/*
	Name: function_17d3e71
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0xC00
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 257
*/
function function_17d3e71()
{
	self thread function_2aac2a53();
	self thread function_a448b358();
	self thread function_d5c22480();
}

/*
	Name: function_2aac2a53
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0xC58
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 274
*/
function function_2aac2a53()
{
	self endon("specialty_icu" + "_stop");
	self endon("disconnect");
	self endon("death");
	self endon("player_suicide");
	var_6de4ab0c = self.health / 2;
	while(1)
	{
		self waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(self.health <= var_6de4ab0c)
		{
			self.var_8b2e6a83 = 1;
			self thread namespace_851dc78f::function_42a4014f(0.5);
			wait(3);
			if(self namespace_851dc78f::function_b690a849("specialty_icu"))
			{
				wait(3);
			}
			self thread namespace_851dc78f::function_7647c83d(0.5);
			self.var_8b2e6a83 = undefined;
		}
	}
}

/*
	Name: function_a448b358
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0xDF0
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 309
*/
function function_a448b358()
{
	self endon("specialty_icu" + "_stop");
	self endon("disconnect");
	self endon("death");
	self endon("player_suicide");
	self.health = self.maxhealth;
	while(1)
	{
		self waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(self.health < self.maxhealth)
		{
			while(1)
			{
				wait(0.05);
				if(self.health < self.maxhealth)
				{
					wait(0.3);
					self.health = self.health + 5;
					if(self.health > self.maxhealth)
					{
						self.health = self.maxhealth;
					}
					break;
				}
				else
				{
				}
			}
		}
	}
}

/*
	Name: function_d5c22480
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0xF70
	Size: 0x300
	Parameters: 0
	Flags: None
	Line Number: 352
*/
function function_d5c22480()
{
	self endon("specialty_icu" + "_stop");
	self endon("disconnect");
	self endon("death");
	self endon("player_suicide");
	while(1)
	{
		self thread namespace_4b6e359c::function_75aa16e4("specialty_icu", "icu", "overlayStyleGreen", 0);
		self DisableInvulnerability();
		self waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(self.IS_DRINKING > 0)
		{
			self thread namespace_4b6e359c::function_75aa16e4("specialty_icu", "icu", "overlayStyleGreen", 1);
			self EnableInvulnerability();
			if(self namespace_851dc78f::function_b690a849("specialty_icu"))
			{
				wait(3);
			}
			wait(3);
		}
		if(self GetCurrentWeapon() == GetWeapon("syrette"))
		{
			self thread namespace_4b6e359c::function_75aa16e4("specialty_icu", "icu", "overlayStyleGreen", 1);
			self EnableInvulnerability();
			if(self namespace_851dc78f::function_b690a849("specialty_icu"))
			{
				wait(3);
			}
			wait(10);
		}
		if(self GetCurrentWeapon() == GetWeapon("zombie_knuckle_crack"))
		{
			self thread namespace_4b6e359c::function_75aa16e4("specialty_icu", "icu", "overlayStyleGreen", 1);
			self EnableInvulnerability();
			if(self namespace_851dc78f::function_b690a849("specialty_icu"))
			{
				wait(3);
			}
			wait(8);
		}
	}
}

/*
	Name: function_e0aed1f6
	Namespace: namespace_e423d491
	Checksum: 0x424F4353
	Offset: 0x1278
	Size: 0xA2
	Parameters: 0
	Flags: None
	Line Number: 406
*/
function function_e0aed1f6()
{
	self endon("hash_7cbaded8");
	self endon("disconnect");
	self endon("death");
	self EnableInvulnerability();
	self thread namespace_851dc78f::function_42a4014f(0.5);
	wait(5);
	self thread namespace_851dc78f::function_7647c83d(0.5);
	self DisableInvulnerability();
	self notify("hash_7cbaded8");
}

