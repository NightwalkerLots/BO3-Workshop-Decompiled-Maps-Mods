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
#include scripts\zm\_zm_weap_thundergun;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_5d498775;

/*
	Name: __init__sytem__
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0x628
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 46
*/
function autoexec __init__sytem__()
{
	system::register("phd_slider", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0x668
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function __init__()
{
	function_1a92256e();
	return;
	ERROR: Bad function call
}

/*
	Name: function_1a92256e
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0x688
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_slider", "customperk", 4000, &"ZM_REAP_MOD_PERK_PHD_SLIDER", GetWeapon("zombie_perk_bottle_phd_slider"));
	zm_perks::register_perk_precache_func("specialty_slider", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_slider", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_slider", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_slider", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_slider", "PhD Slider", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_slider", &"ZM_REAP_MOD_PERK_PHD_SLIDER_DB", 2000, "PhD Slider", "slider");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_slider"] = 1;
	if(!isdefined(level.perk_damage_override))
	{
		level.perk_damage_override = [];
	}
	Array::add(level.perk_damage_override, &function_c301758, 0);
	callback::on_spawned(&on_player_spawned);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0x888
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 112
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_slider"] = spawnstruct();
	level.machine_assets["specialty_slider"].weapon = GetWeapon("zombie_perk_bottle_phd_slider");
	level.machine_assets["specialty_slider"].off_model = "cz_vending_slider";
	level.machine_assets["specialty_slider"].on_model = "cz_vending_slider_on";
}

/*
	Name: function_19157aff
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0x930
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 130
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0x940
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 144
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_slider", "slider", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0x988
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 159
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_slider";
	use_trigger.script_label = "";
	use_trigger.target = "PhD Slider";
	perk_machine.script_string = "specialty_slider";
	perk_machine.targetname = "PhD Slider";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_slider";
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0xA50
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_slider"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_slider"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0xAD8
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 213
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_slider"] = 0;
	self.var_b5c2c258["specialty_slider"] = undefined;
	self.var_d6aef449["specialty_slider"] = undefined;
}

/*
	Name: on_player_spawned
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0xB38
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 230
*/
function on_player_spawned()
{
	self thread function_6aa070b9();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_6aa070b9
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0xB60
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 247
*/
function function_6aa070b9()
{
	self endon("disconnect");
	self notify("hash_c78de5a7");
	self endon("hash_c78de5a7");
	self.var_de088283 = 100;
	self thread namespace_4b6e359c::function_75aa16e4("specialty_slider", "slider", "Meter", Int(self.var_de088283 / 100 * 100));
	while(1)
	{
		if(self function_679da569() && self namespace_851dc78f::function_5f9a13b3("specialty_slider"))
		{
			if(self namespace_851dc78f::function_b690a849("specialty_slider"))
			{
				self SetVelocity(self getvelocity() * 1.5);
			}
			if(self.var_de088283 == 100)
			{
				self thread function_86b4ee96();
			}
			while(self function_679da569())
			{
				wait(0.05);
				self.var_de088283 = self.var_de088283 + 1.5;
				if(self.var_de088283 >= 100)
				{
					self.var_de088283 = 100;
				}
			}
			self thread namespace_4b6e359c::function_75aa16e4("specialty_slider", "slider", "Meter", Int(self.var_de088283 / 100 * 100));
		}
		wait(0.05);
	}
}

/*
	Name: function_86b4ee96
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0xD58
	Size: 0x418
	Parameters: 0
	Flags: None
	Line Number: 291
*/
function function_86b4ee96()
{
	self endon("disconnect");
	damage = 2000;
	if(!isdefined(damage))
	{
		damage = 2000;
	}
	start = self.origin;
	while(self function_679da569())
	{
		a_zombies = GetAITeamArray("axis");
		if(a_zombies.size > 0)
		{
			a_zombies = util::get_array_of_closest(self.origin, a_zombies, undefined, undefined, 350);
			if(a_zombies.size > 0)
			{
				if(DistanceSquared(a_zombies[0].origin, self.origin) < 2500)
				{
					if(isVehicle(self) && a_zombies[0] function_6c048906())
					{
						a_zombies[0] thread clientfield::increment("zm_aat_blast_furnace" + "_explosion_vehicle");
					}
					else if(a_zombies[0] function_6c048906())
					{
						a_zombies[0] thread clientfield::increment("zm_aat_blast_furnace" + "_explosion");
					}
					if(self.origin[2] > start[2] && self namespace_851dc78f::function_b690a849("specialty_slider"))
					{
						dif = start[2] - self.origin[2];
						damage = damage + Int(dif * 2);
					}
					self.var_de088283 = 0;
					self thread namespace_4b6e359c::function_75aa16e4("specialty_slider", "slider", "Meter", Int(self.var_de088283 / 100 * 100));
					for(i = 0; i < a_zombies.size; i++)
					{
						if(isalive(self) && isalive(a_zombies[i]))
						{
							wait(0.01);
							if(isdefined(a_zombies[i]) && isalive(a_zombies[i]))
							{
								if(a_zombies[i].archetype == "zombie")
								{
									if(a_zombies[i].health > damage)
									{
										a_zombies[i] thread zm_weap_thundergun::zombie_knockdown(self, 1);
									}
									else
									{
										a_zombies[i] zombie_utility::gib_random_parts();
										GibServerUtils::Annihilate(a_zombies[i]);
									}
								}
								a_zombies[i] DoDamage(damage, a_zombies[i].origin, self, self, 0, "MOD_EXPLOSIVE");
							}
						}
					}
				}
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_6c048906
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0x1178
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 365
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

/*
	Name: function_693cb69c
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0x1230
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 385
*/
function function_693cb69c()
{
	self endon("disconnect");
	angles = self getPlayerAngles();
	angles_forward = AnglesToForward(angles);
	push = VectorScale(angles_forward, 400);
	while(self function_679da569())
	{
		self SetVelocity(self getvelocity() * 1.5);
		wait(0.05);
	}
}

/*
	Name: function_c301758
	Namespace: namespace_5d498775
	Checksum: 0x424F4353
	Offset: 0x12F0
	Size: 0xFC
	Parameters: 10
	Flags: None
	Line Number: 408
*/
function function_c301758(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!self namespace_851dc78f::function_5f9a13b3("specialty_slider") || !isdefined(sMeansOfDeath))
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

