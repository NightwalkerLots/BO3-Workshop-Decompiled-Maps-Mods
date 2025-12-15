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
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_e423d491;

/*
	Name: __init__sytem__
	Namespace: namespace_e423d491
	Checksum: 0x66E049A
	Offset: 0x548
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 39
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_icu", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_e423d491
	Checksum: 0x3183DAC1
	Offset: 0x588
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function __init__()
{
	function_b765bce4();
}

/*
	Name: function_b765bce4
	Namespace: namespace_e423d491
	Checksum: 0x2622B555
	Offset: 0x5A8
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function function_b765bce4()
{
	callback::on_laststand(&function_e0aed1f6);
	zm_perks::register_perk_basic_info("specialty_quieter", "icu", 2500, "Hold ^3[{+activate}]^7 for I.C.U. [Cost: &&1]\n^5Faster health regeneration\nSpeed boost when on low health\nInvincible while peforming actions", GetWeapon("zombie_perk_bottle_icu"));
	zm_perks::register_perk_precache_func("specialty_quieter", &function_c68503ae);
	zm_perks::register_perk_clientfields("specialty_quieter", &function_3314c104, &function_3395d575);
	zm_perks::register_perk_machine("specialty_quieter", &function_67649359);
	zm_perks::register_perk_threads("specialty_quieter", &function_7c31d243, &function_f59f41e1);
	zm_perks::register_perk_host_migration_params("specialty_quieter", "vending_icu", "specialty_quieter");
	if(!isdefined(level._random_perk_machine_perk_list))
	{
		level._random_perk_machine_perk_list = [];
	}
	else if(!IsArray(level._random_perk_machine_perk_list))
	{
		level._random_perk_machine_perk_list = Array(level._random_perk_machine_perk_list);
	}
	level._random_perk_machine_perk_list[level._random_perk_machine_perk_list.size] = "specialty_quieter";
}

/*
	Name: function_c68503ae
	Namespace: namespace_e423d491
	Checksum: 0xAB304A8E
	Offset: 0x770
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 99
*/
function function_c68503ae()
{
	level._effect["specialty_quieter"] = "_logical_fx/perks/icu";
	level.machine_assets["specialty_quieter"] = spawnstruct();
	level.machine_assets["specialty_quieter"].weapon = GetWeapon("zombie_perk_bottle_icu");
	level.machine_assets["specialty_quieter"].off_model = "zombie_vending_icu_off";
	level.machine_assets["specialty_quieter"].on_model = "zombie_vending_icu_on";
}

/*
	Name: function_3314c104
	Namespace: namespace_e423d491
	Checksum: 0xAF5BBDCD
	Offset: 0x838
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 118
*/
function function_3314c104()
{
	clientfield::register("clientuimodel", "hudItems.perks.icu", 1, 2, "int");
}

/*
	Name: function_3395d575
	Namespace: namespace_e423d491
	Checksum: 0x8C84B639
	Offset: 0x878
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 133
*/
function function_3395d575(state)
{
	self clientfield::set_player_uimodel("hudItems.perks.icu", state);
	return;
}

/*
	Name: function_67649359
	Namespace: namespace_e423d491
	Checksum: 0x328BC83
	Offset: 0x8B0
	Size: 0xA0
	Parameters: 4
	Flags: None
	Line Number: 149
*/
function function_67649359(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_icu_jingle";
	use_trigger.script_string = "icu_perk";
	use_trigger.script_label = "mus_perks_icu_sting";
	use_trigger.target = "vending_icu";
	perk_machine.script_string = "icu_perk";
	perk_machine.targetname = "vending_icu";
	return;
	ERROR: Bad function call
}

/*
	Name: function_7c31d243
	Namespace: namespace_e423d491
	Checksum: 0x1B8ADEE1
	Offset: 0x958
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 171
*/
function function_7c31d243()
{
	self notify("specialty_quieter" + "_start");
	self thread function_17d3e71();
}

/*
	Name: function_f59f41e1
	Namespace: namespace_e423d491
	Checksum: 0xD2143CB2
	Offset: 0x998
	Size: 0x48
	Parameters: 3
	Flags: None
	Line Number: 187
*/
function function_f59f41e1(b_pause, str_perk, str_result)
{
	self notify("perk_lost", str_perk);
	self notify("specialty_quieter" + "_stop");
}

/*
	Name: function_75a3cf47
	Namespace: namespace_e423d491
	Checksum: 0x5C92C0FF
	Offset: 0x9E8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 203
*/
function function_75a3cf47()
{
	var_275964ef = GetEntArray("vending_icu", "targetname");
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
	Checksum: 0xF15CF358
	Offset: 0xB00
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 226
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
	Checksum: 0x720C6D9
	Offset: 0xB58
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 243
*/
function function_2aac2a53()
{
	self endon("specialty_quieter" + "_stop");
	self endon("disconnect");
	self endon("death");
	self endon("player_suicide");
	var_6de4ab0c = self.health / 2;
	while(1)
	{
		self waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(self.health <= var_6de4ab0c)
		{
			self.var_3a324238 = 1;
			wait(3.5);
			self.var_3a324238 = 0;
		}
	}
}

/*
	Name: function_a448b358
	Namespace: namespace_e423d491
	Checksum: 0xCB91D7A1
	Offset: 0xC90
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 272
*/
function function_a448b358()
{
	self endon("specialty_quieter" + "_stop");
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
				if(self.health < self.maxhealth)
				{
					wait(0.3);
					self.health = self.health + 5;
					if(self.health > self.maxhealth)
					{
						self.health = self.maxhealth;
						continue;
					}
					break;
				}
			}
		}
	}
}

/*
	Name: function_d5c22480
	Namespace: namespace_e423d491
	Checksum: 0xB0DBC755
	Offset: 0xE08
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 312
*/
function function_d5c22480()
{
	self endon("specialty_quieter" + "_stop");
	self endon("disconnect");
	self endon("death");
	self endon("player_suicide");
	while(1)
	{
		self DisableInvulnerability();
		self waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(self.IS_DRINKING > 0)
		{
			self EnableInvulnerability();
			wait(3);
		}
		if(self GetCurrentWeapon() == GetWeapon("syrette"))
		{
			self EnableInvulnerability();
			wait(10);
		}
		if(self GetCurrentWeapon() == GetWeapon("zombie_knuckle_crack"))
		{
			self EnableInvulnerability();
			wait(8);
		}
	}
}

/*
	Name: function_e0aed1f6
	Namespace: namespace_e423d491
	Checksum: 0x60C53E85
	Offset: 0xFC0
	Size: 0x7A
	Parameters: 0
	Flags: None
	Line Number: 350
*/
function function_e0aed1f6()
{
	self endon("hash_7cbaded8");
	self endon("disconnect");
	self endon("death");
	self EnableInvulnerability();
	self.var_3a324238 = 1;
	wait(2);
	self.var_3a324238 = 0;
	self DisableInvulnerability();
	self notify("hash_7cbaded8");
}

