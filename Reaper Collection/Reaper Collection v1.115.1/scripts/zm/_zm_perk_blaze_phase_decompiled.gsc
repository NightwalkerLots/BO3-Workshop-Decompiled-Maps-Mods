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

#namespace namespace_3d1a60e3;

/*
	Name: __init__sytem__
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x640
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("blaze_phase", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x680
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
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x6A0
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_blazephase", "customperk", 2000, &"ZM_REAP_MOD_PERK_BLAZE_PHASE", GetWeapon("zombie_perk_bottle_blaze_phase"));
	zm_perks::register_perk_precache_func("specialty_blazephase", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_blazephase", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_blazephase", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_blazephase", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_blazephase", "Blaze Phase", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_blazephase", &"ZM_REAP_MOD_PERK_BLAZE_PHASE_DB", 2000, "Blaze Phase", "blazephase");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_blazephase"] = 1;
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x860
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_blazephase"] = spawnstruct();
	level.machine_assets["specialty_blazephase"].weapon = GetWeapon("zombie_perk_bottle_blaze_phase");
	level.machine_assets["specialty_blazephase"].off_model = "p7_zm_vending_blazephase";
	level.machine_assets["specialty_blazephase"].on_model = "p7_zm_vending_blazephase_on";
}

/*
	Name: function_19157aff
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x908
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function function_19157aff()
{
	clientfield::register("toplayer", "blaze_phase_burning_screen", 1, 1, "int");
	clientfield::register("toplayer", "blaze_phase_burning_blue", 1, 1, "int");
}

/*
	Name: function_99c1452c
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x978
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 136
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_blazephase", "blazephase", "SetIconActive", state);
	return;
	continue;
}

/*
	Name: function_edb3a90b
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x9C0
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 153
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_blazephase";
	use_trigger.script_label = "";
	use_trigger.target = "Blaze Phase";
	perk_machine.script_string = "specialty_blazephase";
	perk_machine.targetname = "Blaze Phase";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_blazephase";
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0xA88
	Size: 0x80
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
	self.disabled_perks["specialty_blazephase"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_blazephase"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0xB10
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 207
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_blazephase"] = 0;
	self.var_b5c2c258["specialty_blazephase"] = undefined;
	self.var_d6aef449["specialty_blazephase"] = undefined;
}

/*
	Name: on_player_spawned
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0xB70
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 224
*/
function on_player_spawned()
{
	self thread function_3d1a60e3();
}

/*
	Name: function_3d1a60e3
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0xB98
	Size: 0x3C0
	Parameters: 0
	Flags: None
	Line Number: 239
*/
function function_3d1a60e3()
{
	self endon("disconnect");
	self notify("hash_3bf10079");
	self endon("hash_3bf10079");
	has_perk = 0;
	while(1)
	{
		if(self namespace_851dc78f::function_5f9a13b3("specialty_blazephase"))
		{
			has_perk = 1;
			charge = 0;
			active = 0;
			var_f434b3fb = 0;
			if(self GetStance() == "crouch" && self function_679da569() == 0 && !isdefined(self.var_167fdc37))
			{
				point = self.origin;
				while(self GetStance() == "crouch" && DistanceSquared(point, self.origin) < 100)
				{
					wait(0.1);
					charge = charge + 1;
					if(charge >= 10 && !active && DistanceSquared(point, self.origin) < 100)
					{
						active = 1;
						self clientfield::set_to_player("blaze_phase_burning_screen", 1);
						self PlayLoopSound("chr_burn_loop_overlay");
					}
					if(charge > 60 && self namespace_851dc78f::function_b690a849("specialty_blazephase") && !var_f434b3fb)
					{
						self clientfield::set_to_player("blaze_phase_burning_blue", 1);
						var_f434b3fb = 1;
					}
				}
				if(charge >= 10 && DistanceSquared(point, self.origin) < 100 && self GetStance() == "stand")
				{
					if(charge > 60 && self namespace_851dc78f::function_b690a849("specialty_blazephase"))
					{
						charge = 100000;
					}
					else if(charge > 30)
					{
						charge = 30;
					}
					self thread function_365e8610(charge);
				}
				if(active)
				{
					self clientfield::set_to_player("blaze_phase_burning_blue", 0);
					self StopLoopSound(1);
					self clientfield::set_to_player("blaze_phase_burning_screen", 0);
				}
			}
		}
		else if(has_perk)
		{
			self StopLoopSound(1);
			self clientfield::set_to_player("blaze_phase_burning_screen", 0);
		}
		wait(0.1);
	}
}

/*
	Name: function_79eb3080
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0xF60
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 311
*/
function function_79eb3080()
{
	self endon("disconnect");
	self.var_167fdc37 = 1;
	timer = 0;
	timer_max = 45;
	while(timer < timer_max && self namespace_851dc78f::function_5f9a13b3("specialty_blazephase"))
	{
		self thread namespace_4b6e359c::function_75aa16e4("specialty_blazephase", "blazephase", "Meter", Int(timer / timer_max * 100));
		wait(1);
		timer = timer + 1;
	}
	self.var_167fdc37 = undefined;
}

/*
	Name: function_365e8610
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x1048
	Size: 0x2E0
	Parameters: 1
	Flags: None
	Line Number: 336
*/
function function_365e8610(charge)
{
	tick = 0.05;
	self endon("disconnect");
	angles = self getPlayerAngles();
	angles_forward = AnglesToForward(angles);
	angles = (0, angles[1], 0);
	push = VectorScale(angles_forward, 1200);
	point = self.origin - VectorScale((0, 0, 1), 100);
	playFX("zombie/fx_aat_blast_furnace_zmb", self.origin, self.angles);
	damage = 1500;
	if(charge < 60)
	{
		charge = Int(charge / 3);
	}
	for(trace = self function_1420ee14(); DistanceSquared(point, self.origin) > 100 && charge > 0 && trace > 0; trace = self function_1420ee14())
	{
		self SetPlayerAngles(VectorToAngles(angles_forward));
		point = self.origin;
		charge = charge - 1;
		self SetVelocity(push);
		self thread function_ec47af87(damage, 150);
		wait(tick);
	}
	playFX("zombie/fx_aat_blast_furnace_zmb", self.origin, self.angles);
	self StopLoopSound(1);
	self clientfield::set_to_player("blaze_phase_burning_screen", 0);
	if(self namespace_851dc78f::function_b690a849("specialty_blazephase"))
	{
		self thread function_ec47af87(damage, 450);
	}
	self thread function_79eb3080();
}

/*
	Name: function_1420ee14
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x1330
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 380
*/
function function_1420ee14()
{
	return 1;
}

/*
	Name: function_ec47af87
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x1340
	Size: 0x238
	Parameters: 2
	Flags: None
	Line Number: 395
*/
function function_ec47af87(damage, range)
{
	a_zombies = zombie_utility::get_round_enemy_array();
	a_zombies = util::get_array_of_closest(self.origin, a_zombies, undefined, undefined, range);
	for(i = 0; i < a_zombies.size; i++)
	{
		if(isalive(self) && isalive(a_zombies[i]) && a_zombies[i] function_6c048906())
		{
			wait(0.01);
			if(isdefined(a_zombies[i]) && isalive(a_zombies[i]))
			{
				if(a_zombies[i].health <= damage)
				{
					if(a_zombies[i].archetype === "zombie")
					{
						a_zombies[i] zombie_utility::gib_random_parts();
						a_zombies[i] zombie_utility::gib_random_parts();
						GibServerUtils::Annihilate(a_zombies[i]);
					}
					a_zombies[i] zm_spawner::zombie_explodes_intopieces(0);
				}
				PlayFXOnTag("zombie/fx_bgb_burned_out_fire_torso_zmb", a_zombies[i], "tag_body");
				a_zombies[i] DoDamage(damage, a_zombies[i].origin, self, self, 0, "MOD_FALLING");
			}
		}
	}
}

/*
	Name: function_6c048906
	Namespace: namespace_3d1a60e3
	Checksum: 0x424F4353
	Offset: 0x1580
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 433
*/
function function_6c048906()
{
	t = self.archetype;
	if(t === "zombie" || t === "zombie_dog" || t === "zombie_dog" || t === "skeleton" || t === "mannequin" || t === "zombie_quad" || t === "apothicon_fury" || t === "keeper" || t === "monkey")
	{
		return 1;
	}
	return 0;
}

