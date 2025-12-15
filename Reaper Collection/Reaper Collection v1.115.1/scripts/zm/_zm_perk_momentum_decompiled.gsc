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

#namespace momentum;

/*
	Name: __init__sytem__
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x5F8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("MOMENTUM", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x638
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
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x658
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_momentum", "momentum", 3500, &"ZM_REAP_MOD_PERK_MOMENTUM", GetWeapon("zombie_perk_bottle_damnade"));
	zm_perks::register_perk_precache_func("specialty_momentum", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_momentum", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_momentum", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_momentum", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_momentum", "Momentum Mojito", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_momentum", &"ZM_REAP_MOD_PERK_MOMENTUM_DB", 2000, "Momentum Mojito", "momentum");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_momentum"] = 1;
	callback::on_spawned(&on_player_spawned);
	zm_spawner::register_zombie_death_event_callback(&function_56ec86d);
}

/*
	Name: function_8bd87e3d
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x838
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 103
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_momentum"] = spawnstruct();
	level.machine_assets["specialty_momentum"].weapon = GetWeapon("zombie_perk_bottle_damnade");
	level.machine_assets["specialty_momentum"].off_model = "p6_zm_vending_momentum";
	level.machine_assets["specialty_momentum"].on_model = "p6_zm_vending_momentum_on";
}

/*
	Name: function_19157aff
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x8E0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 121
*/
function function_19157aff()
{
	clientfield::register("clientuimodel", "momentum_perk_speed_blur", 1, 1, "int");
}

/*
	Name: function_99c1452c
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x920
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 136
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_momentum", "momentum", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x968
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 151
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_momentum_jingle";
	use_trigger.script_string = "specialty_momentum";
	use_trigger.script_label = "mus_perks_momentum_sting";
	use_trigger.target = "Momentum Mojito";
	perk_machine.script_string = "specialty_momentum";
	perk_machine.targetname = "Momentum Mojito";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_momentum";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0xA30
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 175
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_momentum"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_momentum"] = 1;
}

/*
	Name: function_b4722825
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0xAB8
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 203
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_momentum"] = 0;
	self.var_b5c2c258["specialty_momentum"] = undefined;
	self.var_d6aef449["specialty_momentum"] = undefined;
}

/*
	Name: on_player_spawned
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0xB18
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 220
*/
function on_player_spawned()
{
	self thread function_403d4bbe();
	self thread function_e6eaf557();
	self thread function_b39b2f8f();
	self thread function_c9d8aa22();
}

/*
	Name: function_403d4bbe
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0xB88
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 238
*/
function function_403d4bbe()
{
	self endon("disconnect");
	self notify("hash_403d4bbe");
	self endon("hash_403d4bbe");
	while(1)
	{
		while(!self issprinting())
		{
			wait(0.05);
		}
		self notify("sprint_start");
		while(self issprinting())
		{
			wait(0.05);
		}
		self notify("sprint_end");
		wait(0.1);
	}
}

/*
	Name: function_c9d8aa22
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0xC30
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 269
*/
function function_c9d8aa22()
{
	self notify("hash_505dff0e");
	self endon("hash_505dff0e");
	while(1)
	{
		while(!self SprintButtonPressed())
		{
			wait(0.01);
		}
		for(time = 0; self SprintButtonPressed() && time < 0.5; time = 0)
		{
			wait(0.05);
		}
		if(time < 0.5)
		{
			for(time = 0; !self SprintButtonPressed() && time < 0.5; time = 0)
			{
				wait(0.05);
			}
			if(time < 0.5)
			{
				for(time = 0; self SprintButtonPressed() && time < 0.5; time = 0)
				{
					wait(0.05);
				}
				if(time < 0.5)
				{
					self notify("hash_cd6b79d6", time + 0.05, time + 0.05, time + 0.05);
				}
			}
		}
		wait(0.1);
	}
	return;
}

/*
	Name: function_b39b2f8f
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0xDD0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 316
*/
function function_b39b2f8f()
{
	self notify("hash_b39b2f8f");
	self endon("hash_b39b2f8f");
	while(1)
	{
		self waittill("hash_cd6b79d6");
		self.var_b39b2f8f = !self.var_b39b2f8f;
		self thread namespace_4b6e359c::function_75aa16e4("specialty_momentum", "momentum", "overlayStyleGreen", self.var_b39b2f8f);
	}
}

/*
	Name: function_e6eaf557
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0xE58
	Size: 0x520
	Parameters: 0
	Flags: None
	Line Number: 338
*/
function function_e6eaf557()
{
	self notify("hash_e6eaf557");
	self endon("hash_e6eaf557");
	self.var_8deef5e6 = 0;
	var_8eff9a79 = 0;
	self.var_b39b2f8f = 0;
	self thread namespace_4b6e359c::function_75aa16e4("specialty_momentum", "momentum", "overlayStyleGreen", self.var_b39b2f8f);
	var_69fbafec = 0;
	while(1)
	{
		self waittill("sprint_start");
		if(!isdefined(self.var_e479fbc6))
		{
			self.var_e479fbc6 = self function_f339e688();
		}
		if(self namespace_851dc78f::function_5f9a13b3("specialty_momentum") && self issprinting())
		{
			if(self namespace_851dc78f::function_b690a849("specialty_momentum"))
			{
				self.var_8deef5e6 = self.var_e479fbc6;
				self thread namespace_851dc78f::function_42a4014f(0.02 * self.var_8deef5e6);
			}
			else
			{
				self.var_8deef5e6 = 0;
			}
			var_36f12bbd = self function_f339e688();
			while(self issprinting())
			{
				wait(0.05);
				var_8eff9a79 = var_8eff9a79 + 0.05;
				if(var_8eff9a79 >= 0.75)
				{
					var_8eff9a79 = 0;
					if(self.var_8deef5e6 < Int(var_36f12bbd / 2))
					{
						self.var_8deef5e6++;
						self thread namespace_851dc78f::function_42a4014f(0.02);
						if(self.var_8deef5e6 >= Int(var_36f12bbd / 2))
						{
							self thread function_5822520e();
						}
					}
					if(self.var_8deef5e6 >= Int(var_36f12bbd / 2))
					{
						while(self namespace_851dc78f::function_5f9a13b3("specialty_momentum") && (self issprinting() || (self IsSliding() && self namespace_851dc78f::function_b690a849("specialty_momentum"))) && self.var_8deef5e6 >= Int(var_36f12bbd / 2) && self.var_e479fbc6 > 0)
						{
							if(var_69fbafec != level.round_number)
							{
								var_69fbafec = level.round_number;
								self thread zm_equipment::show_hint_text("Double Tap ^3SPRINT^7 To Toggle Momentum Mojito Kill Mode", 3);
							}
							if(self.var_b39b2f8f)
							{
								a_zombies = GetAITeamArray("axis");
								a_zombies = util::get_array_of_closest(self.origin, a_zombies);
								var_3660f20f = 0;
								for(i = 0; i < a_zombies.size; i++)
								{
									if(DistanceSquared(self.origin, a_zombies[i].origin) < 10000)
									{
										a_zombies[i] playsound("momentum_hit");
										a_zombies[i] DoDamage(Int(800 + 50 * level.round_number), self.origin, self, self, 0, "MOD_EXPLOSIVE");
										var_3660f20f = 1;
									}
								}
								if(var_3660f20f)
								{
									self thread function_4c66a4f0();
								}
							}
							wait(0.05);
						}
					}
				}
			}
		}
		else if(isdefined(self.var_8deef5e6) && self.var_8deef5e6 > 0)
		{
			self thread namespace_851dc78f::function_7647c83d(0.02 * self.var_8deef5e6);
			self.var_8deef5e6 = 0;
		}
	}
}

/*
	Name: function_5822520e
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x1380
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 434
*/
function function_5822520e()
{
	self playsound("momentum_activate");
	self clientfield::set_player_uimodel("momentum_perk_speed_blur", 1);
	self thread namespace_851dc78f::function_cc14aa10();
	self util::waittill_any_ex(5, "sprint_end");
	self thread namespace_851dc78f::function_35de86ea();
	self clientfield::set_player_uimodel("momentum_perk_speed_blur", 0);
	wait(0.01);
	self thread namespace_851dc78f::function_cc14aa10();
	wait(0.75);
	self thread namespace_851dc78f::function_35de86ea();
}

/*
	Name: function_f339e688
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x1480
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 458
*/
function function_f339e688()
{
	var_344719ba = 10;
	if(self namespace_851dc78f::function_b690a849("specialty_momentum"))
	{
		var_344719ba = 15;
	}
	return var_344719ba;
}

/*
	Name: function_4c66a4f0
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x14D0
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 478
*/
function function_4c66a4f0()
{
	var_36f12bbd = self function_f339e688();
	if(!isdefined(self.var_e479fbc6))
	{
		self.var_e479fbc6 = var_36f12bbd;
		self thread namespace_4b6e359c::function_75aa16e4("specialty_momentum", "momentum", "Meter", Int(self.var_e479fbc6 / var_36f12bbd * 100));
	}
	self.var_e479fbc6--;
	if(self.var_e479fbc6 < 0)
	{
		self.var_e479fbc6 = 0;
	}
	if(self.var_e479fbc6 == 0)
	{
		self thread namespace_4b6e359c::function_75aa16e4("specialty_momentum", "momentum", "Meter", Int(0.01 * 100));
	}
	else
	{
		self thread namespace_4b6e359c::function_75aa16e4("specialty_momentum", "momentum", "Meter", Int(self.var_e479fbc6 / var_36f12bbd * 100));
	}
}

/*
	Name: function_3c84aff2
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x1630
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 511
*/
function function_3c84aff2()
{
	var_36f12bbd = self function_f339e688();
	if(!isdefined(self.var_e479fbc6))
	{
		self.var_e479fbc6 = var_36f12bbd;
		self thread namespace_4b6e359c::function_75aa16e4("specialty_momentum", "momentum", "Meter", Int(self.var_e479fbc6 / var_36f12bbd * 100));
	}
	if(self.var_e479fbc6 < var_36f12bbd)
	{
		self.var_e479fbc6++;
		self thread namespace_4b6e359c::function_75aa16e4("specialty_momentum", "momentum", "Meter", Int(self.var_e479fbc6 / var_36f12bbd * 100));
	}
}

/*
	Name: function_56ec86d
	Namespace: momentum
	Checksum: 0x424F4353
	Offset: 0x1730
	Size: 0x8C
	Parameters: 1
	Flags: None
	Line Number: 536
*/
function function_56ec86d(attacker)
{
	if(isdefined(self.attacker) && isPlayer(self.attacker) && self.attacker namespace_851dc78f::function_5f9a13b3("specialty_momentum"))
	{
		if(RandomInt(100) < 20)
		{
			self.attacker function_3c84aff2();
		}
	}
}

