#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
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

#namespace zm_perk_electric_cherry;

/*
	Name: __init__sytem__
	Namespace: zm_perk_electric_cherry
	Checksum: 0x549ABC6B
	Offset: 0x638
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 32
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_electric_cherry", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_electric_cherry
	Checksum: 0xA8CC927E
	Offset: 0x678
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 47
*/
function __init__()
{
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_factory" || script == "zm_zod")
	{
		return;
	}
	if(isdefined(1) && 1)
	{
		enable_electric_cherry_perk_for_level();
	}
}

/*
	Name: enable_electric_cherry_perk_for_level
	Namespace: zm_perk_electric_cherry
	Checksum: 0x1E6BB09C
	Offset: 0x700
	Size: 0x318
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function enable_electric_cherry_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_electriccherry", "electric_cherry", 2000, "Hold ^3[{+activate}]^7 for Electric Cherry [Cost: &&1]", GetWeapon("zombie_perk_bottle_cherry"));
	zm_perks::register_perk_precache_func("specialty_electriccherry", &electric_cherry_precache);
	zm_perks::register_perk_clientfields("specialty_electriccherry", &electric_cherry_register_clientfield, &electric_cherry_set_clientfield);
	zm_perks::register_perk_machine("specialty_electriccherry", &electric_cherry_perk_machine_setup);
	zm_perks::register_perk_host_migration_params("specialty_electriccherry", "vending_electriccherry", "specialty_electriccherry");
	zm_perks::register_perk_threads("specialty_electriccherry", &function_a255575f, &function_d092f435);
	function_8fdc802d();
	if(level.script == "zm_zod")
	{
		namespace_b8afaefc::function_8fd06793((1992, -3417, -400), VectorScale((0, 1, 0), 270), "specialty_electriccherry", "p6_zm_vending_electric_cherry");
	}
	if(level.script == "zm_factory")
	{
		namespace_b8afaefc::function_8fd06793((63, -1464, 191), VectorScale((0, 1, 0), 180), "specialty_electriccherry", "p6_zm_vending_electric_cherry");
	}
	if(level.script == "zm_castle")
	{
		namespace_b8afaefc::function_8fd06793((1502, 3094, 408), VectorScale((0, -1, 0), 73), "specialty_electriccherry", "p6_zm_vending_electric_cherry");
	}
	if(level.script == "zm_island")
	{
		namespace_b8afaefc::function_8fd06793((1684, 908, -4399), VectorScale((0, 1, 0), 180), "specialty_electriccherry", "p6_zm_vending_electric_cherry");
	}
	if(level.script == "zm_stalingrad")
	{
		namespace_b8afaefc::function_8fd06793((-905, 3335, 160), (0, 0, 0), "specialty_electriccherry", "p6_zm_vending_electric_cherry");
	}
	if(level.script == "zm_genesis")
	{
		namespace_b8afaefc::function_8fd06793((-82, -411, -3381), VectorScale((0, 1, 0), 90), "specialty_electriccherry", "p6_zm_vending_electric_cherry");
	}
}

/*
	Name: electric_cherry_precache
	Namespace: zm_perk_electric_cherry
	Checksum: 0x2908EE4F
	Offset: 0xA20
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 115
*/
function electric_cherry_precache()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_electriccherry"] = "zombie/fx_perk_quick_revive_zmb";
		continue;
	}
	level._effect["specialty_electriccherry"] = "zombie/fx_perk_quick_revive_factory_zmb";
	level.machine_assets["specialty_electriccherry"] = spawnstruct();
	level.machine_assets["specialty_electriccherry"].weapon = GetWeapon("zombie_perk_bottle_cherry");
	level.machine_assets["specialty_electriccherry"].off_model = "p6_zm_vending_electric_cherry";
	level.machine_assets["specialty_electriccherry"].on_model = "p6_zm_vending_electric_cherry_on";
}

/*
	Name: electric_cherry_register_clientfield
	Namespace: zm_perk_electric_cherry
	Checksum: 0x9ACF73B8
	Offset: 0xB60
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 140
*/
function electric_cherry_register_clientfield()
{
}

/*
	Name: electric_cherry_set_clientfield
	Namespace: zm_perk_electric_cherry
	Checksum: 0x169B7550
	Offset: 0xB70
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 154
*/
function electric_cherry_set_clientfield(state)
{
}

/*
	Name: electric_cherry_perk_machine_setup
	Namespace: zm_perk_electric_cherry
	Checksum: 0x51AA7174
	Offset: 0xB88
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 168
*/
function electric_cherry_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_cherry_jingle";
	use_trigger.script_string = "electriccherry_perk";
	use_trigger.script_label = "mus_perks_cherry_sting";
	use_trigger.target = "vending_electriccherry";
	perk_machine.script_string = "electriccherry_perk";
	perk_machine.targetname = "vending_electriccherry";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "electriccherry_perk";
	}
}

/*
	Name: function_a255575f
	Namespace: zm_perk_electric_cherry
	Checksum: 0x22A5E171
	Offset: 0xC50
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 192
*/
function function_a255575f(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_electriccherry", "t6_specialty_electriccherry");
	self notify("specialty_electriccherry" + "_start");
	self thread function_99423256();
}

/*
	Name: function_d092f435
	Namespace: zm_perk_electric_cherry
	Checksum: 0x63697AF
	Offset: 0xCD0
	Size: 0x68
	Parameters: 3
	Flags: None
	Line Number: 209
*/
function function_d092f435(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_electriccherry");
	self notify("perk_lost", str_perk);
	self notify("specialty_electriccherry" + "_stop");
}

/*
	Name: electric_cherry_host_migration_func
	Namespace: zm_perk_electric_cherry
	Checksum: 0x62294D03
	Offset: 0xD40
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 226
*/
function electric_cherry_host_migration_func()
{
	a_electric_cherry_perk_machines = GetEntArray("vending_electriccherry", "targetname");
	foreach(perk_machine in a_electric_cherry_perk_machines)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "p6_zm_vending_electric_cherry_on")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("electric_cherry");
		}
	}
	return;
}

/*
	Name: function_8fdc802d
	Namespace: zm_perk_electric_cherry
	Checksum: 0x4C09E7E0
	Offset: 0xE58
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 250
*/
function function_8fdc802d()
{
	level._effect["electric_cherry_explode"] = "dlc1/castle/fx_castle_electric_cherry_down";
	level.custom_laststand_func = &electric_cherry_laststand;
	zombie_utility::set_zombie_var("tesla_head_gib_chance", 50);
	clientfield::register("allplayers", "electric_cherry_reload_fx", 1, 2, "int");
	clientfield::register("actor", "tesla_death_fx", 1, 1, "int");
	clientfield::register("vehicle", "tesla_death_fx_veh", 10000, 1, "int");
	clientfield::register("actor", "tesla_shock_eyes_fx", 1, 1, "int");
	clientfield::register("vehicle", "tesla_shock_eyes_fx_veh", 10000, 1, "int");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: electric_cherry_laststand
	Namespace: zm_perk_electric_cherry
	Checksum: 0xF64EE4AD
	Offset: 0xFA8
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 274
*/
function electric_cherry_laststand()
{
	VisionSetLastStand("zombie_last_stand", 1);
	if(isdefined(self))
	{
		playFX(level._effect["electric_cherry_explode"], self.origin);
		self playsound("zmb_cherry_explode");
		self notify("electric_cherry_start");
		wait(0.05);
		a_zombies = zombie_utility::get_round_enemy_array();
		a_zombies = util::get_array_of_closest(self.origin, a_zombies, undefined, undefined, 500);
		for(i = 0; i < a_zombies.size; i++)
		{
			if(isalive(self) && isalive(a_zombies[i]))
			{
				if(a_zombies[i].health <= 1000)
				{
					a_zombies[i] thread electric_cherry_death_fx();
					if(isdefined(self.cherry_kills))
					{
						self.cherry_kills++;
					}
					self zm_score::add_to_player_score(40);
					continue;
				}
				a_zombies[i] thread electric_cherry_stun();
				a_zombies[i] thread electric_cherry_shock_fx();
				wait(0.1);
				a_zombies[i] DoDamage(1000, self.origin, self, self, "none");
			}
		}
		self notify("electric_cherry_end");
	}
}

/*
	Name: electric_cherry_death_fx
	Namespace: zm_perk_electric_cherry
	Checksum: 0x5DF94976
	Offset: 0x11E8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 319
*/
function electric_cherry_death_fx()
{
	self endon("death");
	self playsound("zmb_elec_jib_zombie");
	if(!(isdefined(self.head_gibbed) && self.head_gibbed))
	{
		if(isVehicle(self))
		{
			self clientfield::set("tesla_shock_eyes_fx_veh", 1);
			continue;
		}
		self clientfield::set("tesla_shock_eyes_fx", 1);
	}
	else if(isVehicle(self))
	{
		self clientfield::set("tesla_death_fx_veh", 1);
		continue;
	}
	self clientfield::set("tesla_death_fx", 1);
}

/*
	Name: electric_cherry_shock_fx
	Namespace: zm_perk_electric_cherry
	Checksum: 0x3E2547ED
	Offset: 0x12F0
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 350
*/
function electric_cherry_shock_fx()
{
	self endon("death");
	if(isVehicle(self))
	{
		self clientfield::set("tesla_shock_eyes_fx_veh", 1);
		continue;
	}
	self clientfield::set("tesla_shock_eyes_fx", 1);
	self playsound("zmb_elec_jib_zombie");
	self waittill("stun_fx_end");
	if(isVehicle(self))
	{
		self clientfield::set("tesla_shock_eyes_fx_veh", 0);
		continue;
	}
	self clientfield::set("tesla_shock_eyes_fx", 0);
}

/*
	Name: electric_cherry_stun
	Namespace: zm_perk_electric_cherry
	Checksum: 0x3F2889B7
	Offset: 0x13E8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 379
*/
function electric_cherry_stun()
{
	self endon("death");
	self notify("stun_zombie");
	self endon("stun_zombie");
	if(self.health <= 0)
	{
		return;
	}
	if(self.ai_state !== "zombie_think")
	{
		return;
	}
	self.zombie_tesla_hit = 1;
	self.ignoreall = 1;
	wait(4);
	if(isdefined(self))
	{
		self.zombie_tesla_hit = 0;
		self.ignoreall = 0;
		self notify("stun_fx_end");
	}
}

/*
	Name: function_99423256
	Namespace: zm_perk_electric_cherry
	Checksum: 0xC16745BE
	Offset: 0x1490
	Size: 0x4A8
	Parameters: 0
	Flags: None
	Line Number: 413
*/
function function_99423256()
{
	self endon("death");
	self endon("disconnect");
	self endon("specialty_electriccherry" + "_stop");
	self.wait_on_reload = [];
	self.consecutive_electric_cherry_attacks = 0;
	while(1)
	{
		self waittill("reload_start");
		current_weapon = self GetCurrentWeapon();
		if(IsInArray(self.wait_on_reload, current_weapon))
		{
			continue;
		}
		self.wait_on_reload[self.wait_on_reload.size] = current_weapon;
		self.consecutive_electric_cherry_attacks++;
		n_clip_current = 1;
		n_clip_max = 10;
		n_fraction = n_clip_current / n_clip_max;
		perk_radius = math::linear_map(n_fraction, 1, 0, 32, 128);
		perk_dmg = math::linear_map(n_fraction, 1, 0, 1, 1045);
		self thread check_for_reload_complete(current_weapon);
		if(isdefined(self))
		{
			switch(self.consecutive_electric_cherry_attacks)
			{
				case 0:
				case 1:
				{
					n_zombie_limit = undefined;
					break;
				}
				case 2:
				{
					n_zombie_limit = 8;
					break;
				}
				case 3:
				{
					n_zombie_limit = 4;
					break;
				}
				case 4:
				{
					n_zombie_limit = 2;
					break;
				}
				default
				{
					n_zombie_limit = 0;
				}
			}
			self thread electric_cherry_cooldown_timer(current_weapon);
			if(isdefined(n_zombie_limit) && n_zombie_limit == 0)
			{
				continue;
			}
			self thread electric_cherry_reload_fx(n_fraction);
			self notify("electric_cherry_start");
			self playsound("zmb_cherry_explode");
			a_zombies = zombie_utility::get_round_enemy_array();
			a_zombies = util::get_array_of_closest(self.origin, a_zombies, undefined, undefined, perk_radius);
			n_zombies_hit = 0;
			for(i = 0; i < a_zombies.size; i++)
			{
				if(isalive(self) && isalive(a_zombies[i]))
				{
					if(isdefined(n_zombie_limit))
					{
						if(n_zombies_hit < n_zombie_limit)
						{
							n_zombies_hit++;
							continue;
							break;
						}
					}
					if(a_zombies[i].health <= perk_dmg)
					{
						a_zombies[i] thread electric_cherry_death_fx();
						if(isdefined(self.cherry_kills))
						{
							self.cherry_kills++;
						}
						self zm_score::add_to_player_score(40);
					}
					else if(!isdefined(a_zombies[i].is_brutus))
					{
						a_zombies[i] thread electric_cherry_stun();
					}
					a_zombies[i] thread electric_cherry_shock_fx();
					wait(0.1);
					if(isdefined(a_zombies[i]) && isalive(a_zombies[i]))
					{
						a_zombies[i] DoDamage(perk_dmg, self.origin, self, self, "none");
					}
				}
			}
			self notify("electric_cherry_end");
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: electric_cherry_cooldown_timer
	Namespace: zm_perk_electric_cherry
	Checksum: 0x23658C19
	Offset: 0x1940
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 528
*/
function electric_cherry_cooldown_timer(current_weapon)
{
	self notify("electric_cherry_cooldown_started");
	self endon("electric_cherry_cooldown_started");
	self endon("death");
	self endon("disconnect");
	n_reload_time = 0.25;
	if(self hasPerk("specialty_fastreload"))
	{
		n_reload_time = n_reload_time * GetDvarFloat("perk_weapReloadMultiplier");
	}
	n_cooldown_time = n_reload_time + 3;
	wait(n_cooldown_time);
	self.consecutive_electric_cherry_attacks = 0;
}

/*
	Name: check_for_reload_complete
	Namespace: zm_perk_electric_cherry
	Checksum: 0x2BF714BE
	Offset: 0x1A10
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 554
*/
function check_for_reload_complete(weapon)
{
	self endon("death");
	self endon("disconnect");
	self endon("player_lost_weapon_" + weapon.name);
	self thread weapon_replaced_monitor(weapon);
	while(1)
	{
		self waittill("reload");
		current_weapon = self GetCurrentWeapon();
		if(current_weapon == weapon)
		{
			ArrayRemoveValue(self.wait_on_reload, weapon);
			self notify("weapon_reload_complete_" + weapon.name);
			break;
		}
	}
}

/*
	Name: weapon_replaced_monitor
	Namespace: zm_perk_electric_cherry
	Checksum: 0x6F20253F
	Offset: 0x1AF0
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 583
*/
function weapon_replaced_monitor(weapon)
{
	self endon("death");
	self endon("disconnect");
	self endon("weapon_reload_complete_" + weapon.name);
	while(1)
	{
		self waittill("weapon_change");
		primaryWeapons = self getweaponslistprimaries();
		if(!IsInArray(primaryWeapons, weapon))
		{
			self notify("player_lost_weapon_" + weapon.name);
			ArrayRemoveValue(self.wait_on_reload, weapon);
			break;
		}
	}
	return;
}

/*
	Name: electric_cherry_reload_fx
	Namespace: zm_perk_electric_cherry
	Checksum: 0x14B5077E
	Offset: 0x1BC8
	Size: 0xD4
	Parameters: 1
	Flags: None
	Line Number: 612
*/
function electric_cherry_reload_fx(n_fraction)
{
	if(n_fraction >= 0.67)
	{
		CodeSetClientField(self, "electric_cherry_reload_fx", 1);
	}
	else if(n_fraction >= 0.33 && n_fraction < 0.67)
	{
		CodeSetClientField(self, "electric_cherry_reload_fx", 2);
		continue;
	}
	CodeSetClientField(self, "electric_cherry_reload_fx", 3);
	wait(1);
	CodeSetClientField(self, "electric_cherry_reload_fx", 0);
}

