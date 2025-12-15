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

#namespace namespace_7e71cf7b;

/*
	Name: __init__sytem__
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x6A0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("DA_PHD_SLIDER", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x6E0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function __init__()
{
	function_1a92256e();
}

/*
	Name: function_1a92256e
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x700
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_da_phd_slider", "customperk", 2000, &"ZM_REAP_MOD_PERK_DA_PHD_SLIDER", GetWeapon("zombie_perk_bottle_da_phd"));
	zm_perks::register_perk_precache_func("specialty_da_phd_slider", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_da_phd_slider", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_da_phd_slider", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_da_phd_slider", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_da_phd_slider", "PHD Slider", "da_phd_machine_on");
	level thread namespace_851dc78f::function_c3c32972("specialty_da_phd_slider", &"ZM_REAP_MOD_PERK_DA_PHD_SLIDER_DB", 2000, "PHD Slider", "da_phd");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_da_phd_slider"] = 1;
	callback::on_spawned(&on_player_spawned);
	return;
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x8C0
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_da_phd_slider"] = spawnstruct();
	level.machine_assets["specialty_da_phd_slider"].weapon = GetWeapon("zombie_perk_bottle_da_phd");
	level.machine_assets["specialty_da_phd_slider"].off_model = "cz_zombie_vending_da_phd_slider_off";
	level.machine_assets["specialty_da_phd_slider"].on_model = "cz_zombie_vending_da_phd_slider";
	if(!isdefined(level.perk_damage_override))
	{
		level.perk_damage_override = [];
	}
	Array::add(level.perk_damage_override, &function_feadfe98, 0);
}

/*
	Name: function_19157aff
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x9B0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 127
*/
function function_19157aff()
{
	clientfield::register("toplayer", "phd_slider_trail", 1, 1, "int");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_99c1452c
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x9F0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 144
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_da_phd_slider", "da_phd", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0xA38
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 159
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_phd_jingle";
	use_trigger.script_string = "specialty_da_phd_slider";
	use_trigger.script_label = "mus_perks_phd_sting";
	use_trigger.target = "PHD Slider";
	perk_machine.script_string = "specialty_da_phd_slider";
	perk_machine.targetname = "PHD Slider";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_da_phd_slider";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0xB00
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 183
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_da_phd_slider"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_da_phd_slider"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0xB88
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 211
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_da_phd_slider"] = 0;
	self.var_b5c2c258["specialty_da_phd_slider"] = undefined;
	self.var_d6aef449["specialty_da_phd_slider"] = undefined;
}

/*
	Name: on_player_spawned
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0xBE8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 228
*/
function on_player_spawned()
{
	self thread function_5d498775();
}

/*
	Name: function_5d498775
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0xC10
	Size: 0x290
	Parameters: 0
	Flags: None
	Line Number: 243
*/
function function_5d498775()
{
	self endon("disconnect");
	self notify("hash_48672671");
	self endon("hash_48672671");
	while(1)
	{
		if(self function_679da569() && self namespace_851dc78f::function_5f9a13b3("specialty_da_phd_slider"))
		{
			self playsound("phd_slide_charge");
			self clientfield::set_to_player("phd_slider_trail", 1);
			if(self namespace_851dc78f::function_b690a849("specialty_da_phd_slider"))
			{
				self SetVelocity(self getvelocity() * 1.5);
			}
			self thread function_86b4ee96();
			while(self function_679da569() && self IsOnGround())
			{
				util::wait_network_frame();
			}
			self clientfield::set_to_player("phd_slider_trail", 0);
			self playsound("phd_slide_charge_end");
		}
		if(!self IsOnGround() && self namespace_851dc78f::function_b690a849("specialty_da_phd_slider"))
		{
			start = self.origin;
			while(!self IsOnGround())
			{
				if(self.origin[2] > start[2])
				{
					start = self.origin;
				}
				util::wait_network_frame();
			}
			if(start[2] - self.origin[2] > 120)
			{
				self thread function_e3c51ea2(start, 1);
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_86b4ee96
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0xEA8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 296
*/
function function_86b4ee96()
{
	start = self.origin;
	while(self function_679da569())
	{
		util::wait_network_frame();
	}
	a_zombies = GetAITeamArray("axis");
	if(a_zombies.size > 0)
	{
		a_zombies = util::get_array_of_closest(self.origin, a_zombies, undefined, undefined, 350);
		if(a_zombies.size > 0)
		{
			if(DistanceSquared(a_zombies[0].origin, self.origin) < 2500)
			{
				self thread function_e3c51ea2(start);
			}
		}
	}
}

/*
	Name: function_f9cb4212
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0xFB0
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 327
*/
function function_f9cb4212(V, scale)
{
	V = V * scale;
	return V;
}

/*
	Name: function_e3c51ea2
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0xFE0
	Size: 0x598
	Parameters: 2
	Flags: None
	Line Number: 343
*/
function function_e3c51ea2(start, var_17226aae)
{
	self endon("disconnect");
	damage = 2000;
	extra = 0;
	if(isdefined(start) && isdefined(self.origin) && self namespace_851dc78f::function_b690a849("specialty_da_phd_slider"))
	{
		extra = Int(Distance(start, self.origin) * 2);
	}
	damage = damage + extra;
	a_zombies = GetAITeamArray("axis");
	a_zombies = util::get_array_of_closest(self.origin, a_zombies, undefined, undefined, 200 + Int(extra / 4));
	angles = self getPlayerAngles();
	pos = self.origin;
	forward_view_angles = AnglesToForward(angles);
	end_pos = self.origin;
	if(!isdefined(var_17226aae))
	{
		end_pos = pos + function_f9cb4212(forward_view_angles, 30);
	}
	self playsound("phd_slider_explode");
	end_pos = (end_pos[0], end_pos[1], self.origin[2]);
	level thread function_ab0b395e(end_pos);
	for(i = 0; i < a_zombies.size; i++)
	{
		if(isalive(self) && isalive(a_zombies[i]))
		{
			wait(0.01);
			if(isdefined(a_zombies[i]) && isalive(a_zombies[i]))
			{
				if(DistanceSquared(a_zombies[0].origin, self.origin) < 3600)
				{
					if(a_zombies[i].health <= damage * 3)
					{
						if(a_zombies[i].archetype == "zombie")
						{
							a_zombies[i] zombie_utility::gib_random_parts();
							GibServerUtils::Annihilate(a_zombies[i]);
						}
						a_zombies[i] DoDamage(damage * 3, a_zombies[i].origin, self, self, 0, "MOD_EXPLOSIVE");
					}
					else
					{
						a_zombies[i] DoDamage(damage * 3, a_zombies[i].origin, self, self, 0, "MOD_EXPLOSIVE");
					}
				}
				else if(a_zombies[i].health <= damage)
				{
					if(a_zombies[i].archetype == "zombie")
					{
						a_zombies[i] zombie_utility::gib_random_parts();
						GibServerUtils::Annihilate(a_zombies[i]);
					}
					a_zombies[i] DoDamage(damage, a_zombies[i].origin, self, self, 0, "MOD_EXPLOSIVE");
				}
				else
				{
					a_zombies[i] DoDamage(damage, a_zombies[i].origin, self, self, 0, "MOD_EXPLOSIVE");
				}
				if(isdefined(a_zombies[i]))
				{
					if(isVehicle(a_zombies[i]))
					{
						a_zombies[i] thread clientfield::increment("zm_aat_blast_furnace" + "_explosion_vehicle");
						continue;
					}
					a_zombies[i] thread clientfield::increment("zm_aat_blast_furnace" + "_explosion");
				}
			}
		}
	}
}

/*
	Name: function_ab0b395e
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x1580
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 426
*/
function function_ab0b395e(origin)
{
	wait(0.1);
	var_8be4db6f = spawn("script_model", origin);
	var_8be4db6f SetModel("tag_origin");
	var_8be4db6f namespace_851dc78f::function_4621bbdd("scriptmover", "reap_cz_da_phd_nuke", 1);
	wait(5);
	var_8be4db6f namespace_851dc78f::function_4621bbdd("scriptmover", "reap_cz_da_phd_nuke", 0);
	var_8be4db6f delete();
}

/*
	Name: function_693cb69c
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x1658
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 447
*/
function function_693cb69c()
{
	self endon("disconnect");
	angles = self getPlayerAngles();
	angles_forward = AnglesToForward(angles);
	push = VectorScale(angles_forward, 400);
	while(self function_679da569())
	{
		self SetVelocity(push);
		wait(0.05);
	}
}

/*
	Name: function_feadfe98
	Namespace: namespace_7e71cf7b
	Checksum: 0x424F4353
	Offset: 0x1700
	Size: 0xFC
	Parameters: 10
	Flags: None
	Line Number: 470
*/
function function_feadfe98(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!self namespace_851dc78f::function_5f9a13b3("specialty_da_phd_slider") || !isdefined(sMeansOfDeath))
	{
		return undefined;
	}
	switch(sMeansOfDeath)
	{
		case "MOD_ELECTOCUTED":
		case "MOD_EXPLOSIVE":
		case "MOD_EXPLOSIVE_SPLASH":
		case "MOD_FALLING":
		case "MOD_GRENADE":
		case "MOD_GRENADE_SPLASH":
		case "MOD_IMPACT":
		{
			iDamage = 0;
			return 0;
			break;
		}
		default
		{
		}
	}
	if(eAttacker == self)
	{
		return 0;
	}
	return undefined;
}

