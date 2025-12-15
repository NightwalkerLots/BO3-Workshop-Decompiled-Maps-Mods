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

#namespace namespace_1db86760;

/*
	Name: __init__sytem__
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x5B0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("SWARM_SCOTCH", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x5F0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function __init__()
{
	function_1a92256e();
	return;
	ERROR: Bad function call
}

/*
	Name: function_1a92256e
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x610
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 79
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_swarmscotch", "customperk", 2500, &"ZM_REAP_MOD_PERK_SWARM_SCOTCH", GetWeapon("zombie_perk_bottle_swarmscotch"));
	zm_perks::register_perk_precache_func("specialty_swarmscotch", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_swarmscotch", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_swarmscotch", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_swarmscotch", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_swarmscotch", "Swarm Scotch", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_swarmscotch", &"ZM_REAP_MOD_PERK_SWARM_SCOTCH_DB", 1500, "Swarm Scotch", "swarmscotch");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_swarmscotch"] = 1;
	zm_spawner::register_zombie_damage_callback(&function_ad889d8a);
	callback::on_spawned(&on_player_spawned);
	return;
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x7F0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 108
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_swarmscotch"] = spawnstruct();
	level.machine_assets["specialty_swarmscotch"].weapon = GetWeapon("zombie_perk_bottle_swarmscotch");
	level.machine_assets["specialty_swarmscotch"].off_model = "cz_zombie_vending_swarmscotch_off";
	level.machine_assets["specialty_swarmscotch"].on_model = "cz_zombie_vending_swarmscotch";
}

/*
	Name: function_19157aff
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x898
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 126
*/
function function_19157aff()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_99c1452c
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x8A8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 142
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_swarmscotch", "swarmscotch", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x8F0
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 157
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_swarmscotch";
	use_trigger.script_label = "";
	use_trigger.target = "Swarm Scotch";
	perk_machine.script_string = "specialty_swarmscotch";
	perk_machine.targetname = "Swarm Scotch";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_swarmscotch";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x9B8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 181
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_swarmscotch"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_swarmscotch"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0xA40
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 209
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_swarmscotch"] = 0;
	self.var_b5c2c258["specialty_swarmscotch"] = undefined;
	self.var_d6aef449["specialty_swarmscotch"] = undefined;
}

/*
	Name: function_ad889d8a
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0xAA0
	Size: 0x148
	Parameters: 13
	Flags: None
	Line Number: 226
*/
function function_ad889d8a(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(isdefined(e_player) && isdefined(str_hit_location) && isPlayer(e_player) && e_player namespace_851dc78f::function_5f9a13b3("specialty_swarmscotch") && (RandomInt(100) < 20 || isdefined(self.var_9f613ad5)) && !isdefined(e_player.var_f91b8ae8))
	{
		if(str_hit_location == "head" || str_hit_location == "helmet" || str_hit_location == "neck")
		{
			e_player thread function_79ce5ea0(self.origin);
		}
	}
	return 0;
}

/*
	Name: function_79ce5ea0
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0xBF0
	Size: 0x218
	Parameters: 1
	Flags: None
	Line Number: 248
*/
function function_79ce5ea0(or)
{
	self endon("disconnect");
	if(!isdefined(self.var_b73fe735))
	{
		self.var_b73fe735 = 0;
	}
	if(self.var_b73fe735 > 4)
	{
		return;
	}
	if(!isdefined(or))
	{
		or = self.origin;
	}
	self.var_b73fe735++;
	damage = 50;
	if(self namespace_851dc78f::function_b690a849("specialty_swarmscotch"))
	{
		damage = damage * 1.5;
	}
	self.var_f91b8ae8 = 1;
	fxOrg = spawn("script_model", or);
	fxOrg SetModel("tag_origin");
	fxOrg.targetname = "swarm_scotch_bugs";
	fxOrg namespace_851dc78f::function_4621bbdd("scriptmover", "swarm_scotch", 1);
	fxOrg PlayLoopSound("SWARM_SCOTCH_aid_stink_loop");
	fxOrg thread delete_on_disconnect(self);
	fxOrg thread function_872757d1();
	fxOrg thread function_acfdde62(damage, self);
	wait(10);
	fxOrg StopLoopSound();
	fxOrg namespace_851dc78f::function_4621bbdd("scriptmover", "swarm_scotch", 0);
	fxOrg delete();
	self.var_f91b8ae8 = undefined;
	self.var_b73fe735--;
}

/*
	Name: delete_on_disconnect
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0xE10
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 296
*/
function delete_on_disconnect(e_player)
{
	self endon("death");
	e_player waittill("disconnect");
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_872757d1
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0xE60
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 316
*/
function function_872757d1()
{
	while(isdefined(self))
	{
		a_zombies = zombie_utility::get_round_enemy_array();
		a_zombies = util::get_array_of_closest(self.origin, a_zombies, undefined, undefined, 450);
		if(isdefined(a_zombies) && a_zombies.size > 0)
		{
			self moveto(a_zombies[0].origin + VectorScale((0, 0, 1), 10), 0.5);
			wait(0.1);
		}
		wait(0.1);
	}
}

/*
	Name: function_acfdde62
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0xF20
	Size: 0x1D8
	Parameters: 2
	Flags: None
	Line Number: 341
*/
function function_acfdde62(damage, player)
{
	while(isdefined(self))
	{
		a_zombies = zombie_utility::get_round_enemy_array();
		a_zombies = util::get_array_of_closest(self.origin, a_zombies, undefined, undefined, 100);
		if(isdefined(a_zombies) && a_zombies.size > 0)
		{
			for(i = 0; i < a_zombies.size; i++)
			{
				if(a_zombies[i].health < damage || RandomInt(100) < 5)
				{
					if(a_zombies[i].health < damage && RandomInt(100) < 20 && player namespace_851dc78f::function_b690a849("specialty_swarmscotch"))
					{
						player thread function_79ce5ea0(player.origin);
					}
					a_zombies[i] DoDamage(damage, self.origin, player, self);
				}
				else
				{
					a_zombies[i] DoDamage(damage, self.origin);
				}
				wait(0.01);
			}
		}
		wait(0.1);
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x1100
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 380
*/
function on_player_spawned()
{
	self thread function_efe11fb();
}

/*
	Name: function_efe11fb
	Namespace: namespace_1db86760
	Checksum: 0x424F4353
	Offset: 0x1128
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 395
*/
function function_efe11fb()
{
	self endon("disconnect");
	self notify("hash_efe11fb");
	self endon("hash_efe11fb");
	while(1)
	{
		self waittill("reload_start");
		weapon = self GetCurrentWeapon();
		var_a9add4d9 = self GetWeaponAmmoClip(weapon);
		if(var_a9add4d9 == 0 && !isdefined(self.var_f91b8ae8) && self namespace_851dc78f::function_5f9a13b3("specialty_swarmscotch"))
		{
			self thread function_79ce5ea0(self.origin);
		}
	}
}

