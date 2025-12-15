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
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_64fcaf97;

/*
	Name: __init__sytem__
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x688
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("winters_wail", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x6C8
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
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x6E8
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_winterwail", "customperk", 3000, &"ZM_REAP_MOD_PERK_WINTERS_WAIL", GetWeapon("zombie_perk_bottle_winters_wail"));
	zm_perks::register_perk_precache_func("specialty_winterwail", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_winterwail", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_winterwail", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_winterwail", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_winterwail", "Winter's Wail", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_winterwail", &"ZM_REAP_MOD_PERK_WINTERS_WAIL_DB", 2000, "Winter's Wail", "winterwail", &function_87ba3164);
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_winterwail"] = 1;
	if(!isdefined(level.perk_damage_override))
	{
		level.perk_damage_override = [];
	}
	Array::add(level.perk_damage_override, &function_cf0bfc84, 0);
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x8F8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_winterwail"] = spawnstruct();
	level.machine_assets["specialty_winterwail"].weapon = GetWeapon("zombie_perk_bottle_winters_wail");
	level.machine_assets["specialty_winterwail"].off_model = "cz_zombie_vending_winterswail_off";
	level.machine_assets["specialty_winterwail"].on_model = "cz_zombie_vending_winterswail";
}

/*
	Name: function_19157aff
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x9A0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 125
*/
function function_19157aff()
{
	clientfield::register("clientuimodel", "winters_wail_blast", 1, 1, "int");
}

/*
	Name: function_99c1452c
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x9E0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 140
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_winterwail", "winterwail", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0xA28
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 155
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_winterwail";
	use_trigger.script_label = "";
	use_trigger.target = "Winter's Wail";
	perk_machine.script_string = "specialty_winterwail";
	perk_machine.targetname = "Winter's Wail";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_winterwail";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0xAF0
	Size: 0xB8
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
	self.disabled_perks["specialty_winterwail"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_winterwail"] = 1;
	self thread namespace_4b6e359c::function_75aa16e4("specialty_winterwail", "winterwail", "overlayStyleCounter", self.var_dc8204f2 + 1);
}

/*
	Name: function_b4722825
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0xBB0
	Size: 0xB8
	Parameters: 3
	Flags: None
	Line Number: 208
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_winterwail"] = 0;
	self.var_b5c2c258["specialty_winterwail"] = undefined;
	self.var_d6aef449["specialty_winterwail"] = undefined;
	self thread namespace_4b6e359c::function_75aa16e4("specialty_winterwail", "winterwail", "overlayStyleCounter", 0);
	self thread namespace_4b6e359c::function_75aa16e4("specialty_winterwail", "winterwail", "Meter", 0);
}

/*
	Name: on_player_spawned
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0xC70
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 227
*/
function on_player_spawned()
{
	self thread function_ea1cbfd1();
}

/*
	Name: function_ea1cbfd1
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0xC98
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 242
*/
function function_ea1cbfd1()
{
	self endon("disconnect");
	self notify("hash_ea1cbfd1");
	self endon("hash_ea1cbfd1");
	charge = 0;
	var_344719ba = 60;
	self.var_dc8204f2 = self function_87ffb07e();
	self thread function_4f5d72b3();
	while(1)
	{
		if(self namespace_851dc78f::function_5f9a13b3("specialty_winterwail"))
		{
			if(self.var_dc8204f2 < self function_87ffb07e())
			{
				charge = charge + 1;
				self thread namespace_4b6e359c::function_75aa16e4("specialty_winterwail", "winterwail", "Meter", Int(charge / var_344719ba * 100));
				if(charge >= var_344719ba)
				{
					charge = 0;
					self.var_dc8204f2 = self.var_dc8204f2 + 1;
					self thread namespace_4b6e359c::function_75aa16e4("specialty_winterwail", "winterwail", "overlayStyleCounter", self.var_dc8204f2 + 1);
					self thread namespace_4b6e359c::function_75aa16e4("specialty_winterwail", "winterwail", "Meter", 0);
				}
			}
			else
			{
				charge = 0;
			}
			else
			{
			}
		}
		wait(1);
	}
}

/*
	Name: function_4f5d72b3
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0xE78
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 289
*/
function function_4f5d72b3()
{
	self endon("disconnect");
	self notify("hash_4f5d72b3");
	self endon("hash_4f5d72b3");
	while(1)
	{
		level waittill("between_round_over");
		if(self namespace_851dc78f::function_5f9a13b3("specialty_winterwail"))
		{
			self.var_dc8204f2 = self function_87ffb07e();
			self thread namespace_4b6e359c::function_75aa16e4("specialty_winterwail", "winterwail", "overlayStyleCounter", self.var_dc8204f2 + 1);
			self thread namespace_4b6e359c::function_75aa16e4("specialty_winterwail", "winterwail", "Meter", 0);
		}
	}
}

/*
	Name: function_cf0bfc84
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0xF68
	Size: 0x208
	Parameters: 10
	Flags: None
	Line Number: 316
*/
function function_cf0bfc84(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!self namespace_851dc78f::function_5f9a13b3("specialty_winterwail"))
	{
		return undefined;
	}
	if(!isdefined(self.var_dc8204f2))
	{
		self.var_dc8204f2 = self function_87ffb07e();
	}
	if(self.var_dc8204f2 <= 0)
	{
		return undefined;
	}
	can_use = 1;
	if(sMeansOfDeath == "MOD_ELECTOCUTED" || sMeansOfDeath == "MOD_EXPLOSIVE" || sMeansOfDeath == "MOD_EXPLOSIVE_SPLASH" || sMeansOfDeath == "MOD_FALLING" || sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_PROJECTILE" || sMeansOfDeath == "MOD_PROJECTILE_SPLASH" || sMeansOfDeath == "MOD_GRENADE_SPLASH" || sMeansOfDeath == "MOD_SUICIDE" || sMeansOfDeath == "MOD_IMPACT")
	{
		can_use = 0;
	}
	if(can_use)
	{
		if(self.health < self.maxhealth || self.health < 150)
		{
			self.var_dc8204f2 = self.var_dc8204f2 - 1;
			self thread namespace_4b6e359c::function_75aa16e4("specialty_winterwail", "winterwail", "overlayStyleCounter", self.var_dc8204f2 + 1);
			self thread function_d122c04();
		}
	}
	return undefined;
}

/*
	Name: function_d122c04
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x1178
	Size: 0x310
	Parameters: 0
	Flags: None
	Line Number: 357
*/
function function_d122c04()
{
	self endon("disconnect");
	self util::setClientSysState("setPerkOverlayStyle", "winters_wail_player|1", self);
	time = 0.5;
	if(self namespace_851dc78f::function_b690a849("specialty_winterwail"))
	{
		time = 4;
	}
	while(time > 0)
	{
		if(self namespace_851dc78f::function_5f9a13b3("specialty_winterwail"))
		{
			a_zombies = GetAITeamArray("axis");
			if(a_zombies.size > 0)
			{
				a_zombies = util::get_array_of_closest(self.origin, a_zombies, undefined, undefined, 240);
				if(a_zombies.size > 0)
				{
					for(i = 0; i < a_zombies.size; i++)
					{
						if(a_zombies[i].archetype === "zombie")
						{
							if(DistanceSquared(a_zombies[i].origin, self.origin) < 6400)
							{
								a_zombies[i] thread function_af439050(self, 1);
								continue;
							}
							if(DistanceSquared(a_zombies[i].origin, self.origin) < 14400)
							{
								a_zombies[i] thread function_af439050(self, 0.6);
								continue;
							}
							if(DistanceSquared(a_zombies[i].origin, self.origin) < 32400)
							{
								a_zombies[i] thread function_af439050(self, 0.4);
								continue;
							}
							if(DistanceSquared(a_zombies[i].origin, self.origin) < 57600)
							{
								a_zombies[i] thread function_af439050(self, 0.2);
							}
						}
					}
				}
			}
		}
		time = time - 0.1;
		wait(0.1);
	}
	self util::setClientSysState("setPerkOverlayStyle", "winters_wail_player|0", self);
}

/*
	Name: function_af439050
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x1490
	Size: 0x1F0
	Parameters: 2
	Flags: None
	Line Number: 420
*/
function function_af439050(attacker, rate)
{
	self endon("death");
	self endon("widows_wine_cocoon");
	self notify("hash_af439050");
	self endon("hash_af439050");
	self thread function_ae8d23ff();
	self namespace_851dc78f::function_4621bbdd("actor", "frozen_zombie_test", 1);
	self playsound("winters_wail_freeze");
	if(!isdefined(self.var_d7ae97e8))
	{
		self.var_d7ae97e8 = 1;
	}
	if(self.var_d7ae97e8 - rate < 0)
	{
		self.var_d7ae97e8 = 0;
	}
	else if(self.var_d7ae97e8 > 0)
	{
		self.var_d7ae97e8 = self.var_d7ae97e8 - rate;
	}
	for(time = 15 * rate; time > 0; time = 15 * rate)
	{
		self ASMSetAnimationRate(self.var_d7ae97e8);
		wait(0.2);
	}
	self namespace_851dc78f::function_4621bbdd("actor", "frozen_zombie_test", 0);
	while(self.var_d7ae97e8 < 1)
	{
		wait(0.2);
		self.var_d7ae97e8 = self.var_d7ae97e8 + 0.2;
		if(self.var_d7ae97e8 > 1)
		{
			self.var_d7ae97e8 = 1;
		}
		self ASMSetAnimationRate(self.var_d7ae97e8);
	}
}

/*
	Name: function_ae8d23ff
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x1688
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 469
*/
function function_ae8d23ff()
{
	self endon("hash_af439050");
	self waittill("death");
	self ASMSetAnimationRate(1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_87ffb07e
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x16C8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 488
*/
function function_87ffb07e()
{
	if(self namespace_851dc78f::function_b690a849("specialty_winterwail"))
	{
		return 4;
	}
	return 3;
}

/*
	Name: function_87ba3164
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x1700
	Size: 0x8C
	Parameters: 0
	Flags: None
	Line Number: 507
*/
function function_87ba3164()
{
	self.var_dc8204f2 = self function_87ffb07e();
	self thread namespace_4b6e359c::function_75aa16e4("specialty_winterwail", "winterwail", "overlayStyleCounter", self.var_dc8204f2 + 1);
	self thread namespace_4b6e359c::function_75aa16e4("specialty_winterwail", "winterwail", "Meter", 0);
}

