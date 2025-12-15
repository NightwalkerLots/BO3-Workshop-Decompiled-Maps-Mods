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
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_2127f613;

/*
	Name: __init__sytem__
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x6D8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 44
*/
function autoexec __init__sytem__()
{
	system::register("CHANGECHEWS", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x718
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
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x738
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_changechews", "customperk", 1500, &"ZM_REAP_MOD_PERK_CHANGECHEWS", GetWeapon("zombie_perk_bottle_changechews"));
	zm_perks::register_perk_precache_func("specialty_changechews", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_changechews", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_changechews", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_changechews", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_changechews", "Change Chews", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_changechews", &"ZM_REAP_MOD_PERK_CHANGECHEWS_DB", 1500, "Change Chews", "changechews");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_changechews"] = 1;
	zm_spawner::register_zombie_damage_callback(&function_4c4340d2);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x8F8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_changechews"] = spawnstruct();
	level.machine_assets["specialty_changechews"].weapon = GetWeapon("zombie_perk_bottle_changechews");
	level.machine_assets["specialty_changechews"].off_model = "cz_zombie_vending_changechews";
	level.machine_assets["specialty_changechews"].on_model = "cz_zombie_vending_changechews_on";
}

/*
	Name: function_19157aff
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x9A0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x9B0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 134
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x9F8
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 149
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_changechews";
	use_trigger.script_label = "";
	use_trigger.target = "Change Chews";
	perk_machine.script_string = "specialty_changechews";
	perk_machine.targetname = "Change Chews";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_changechews";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0xAC0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 173
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_changechews"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_changechews"] = 1;
	self thread function_968f0442();
	self thread function_1d9c5873();
}

/*
	Name: function_b4722825
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0xB70
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 203
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_changechews"] = 0;
	self.var_b5c2c258["specialty_changechews"] = undefined;
	self.var_d6aef449["specialty_changechews"] = undefined;
}

/*
	Name: function_4c4340d2
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0xBD0
	Size: 0x228
	Parameters: 13
	Flags: None
	Line Number: 220
*/
function function_4c4340d2(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(!(isdefined(isdefined(str_mod) && isdefined(e_player) && isdefined(str_hit_location) && isdefined(v_hit_origin)) && isdefined(str_mod) && isdefined(e_player) && isdefined(str_hit_location) && isdefined(v_hit_origin)))
	{
		return 0;
	}
	if(isdefined(self.var_4564dc68))
	{
		self ASMSetAnimationRate(1);
		self.var_87371112 = undefined;
		self.var_4564dc68 = undefined;
		self namespace_851dc78f::function_4621bbdd("actor", "frozen_zombie_test", 0);
		self DoDamage(self.health + 666, e_player.origin, e_player, e_player, str_mod);
	}
	else if(isdefined(e_player) && isPlayer(e_player) && e_player namespace_851dc78f::function_5f9a13b3("specialty_changechews") && RandomInt(100) < 30 && !isdefined(self.var_87371112))
	{
		if(str_hit_location == "head" || str_hit_location == "helmet" || str_hit_location == "neck")
		{
			e_player thread function_63286a9b(self, v_hit_origin);
		}
	}
	return 0;
}

/*
	Name: function_63286a9b
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0xE00
	Size: 0x438
	Parameters: 2
	Flags: None
	Line Number: 254
*/
function function_63286a9b(zombie, or)
{
	var_1f9befeb = "changechews_fire";
	FX = level._effect["changechews_fire"];
	var_656856ed = &function_10d99839;
	damage = 0;
	switch(self.var_6af3d125)
	{
		case "electric":
		{
			FX = level._effect["changechews_electric"];
			var_1f9befeb = "changechews_electric";
			var_656856ed = &function_7043243c;
			damage = 1000;
			break;
		}
		case "ice":
		{
			FX = level._effect["changechews_ice"];
			var_1f9befeb = "changechews_ice";
			var_656856ed = &function_cf65384a;
			damage = 0;
			break;
		}
		case "explosive":
		{
			FX = level._effect["changechews_explode"];
			var_1f9befeb = "changechews_explode";
			var_656856ed = &function_e645a8e8;
			damage = 1300;
			break;
		}
		case "fire":
		default
		{
			FX = level._effect["changechews_fire"];
			var_1f9befeb = "changechews_fire";
			var_656856ed = &function_10d99839;
			damage = 1200;
			break;
		}
	}
	level thread function_e64458d(FX, or);
	var_fdeab6bc = "" + or[0];
	var_fdeab6bc = var_fdeab6bc + "*" + or[1];
	var_fdeab6bc = var_fdeab6bc + "*" + or[2];
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] util::setClientSysState("setPerkOverlayStyle", var_1f9befeb + "|" + var_fdeab6bc, players[i]);
	}
	a_zombies = zombie_utility::get_round_enemy_array();
	a_zombies = util::get_array_of_closest(zombie.origin, a_zombies, undefined, undefined, 150);
	for(i = 0; i < a_zombies.size; i++)
	{
		if(isalive(self) && isalive(a_zombies[i]))
		{
			wait(0.01);
			if(isdefined(a_zombies[i]) && isalive(a_zombies[i]))
			{
				if(a_zombies[i].health > damage)
				{
					a_zombies[i] thread [[var_656856ed]](or);
				}
				if(damage > 0)
				{
					a_zombies[i] DoDamage(damage, a_zombies[i].origin, self, self, "none");
				}
			}
		}
	}
}

/*
	Name: function_7043243c
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x1240
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 337
*/
function function_7043243c(or)
{
	self.var_87371112 = 1;
	self endon("death");
	if(self.ai_state !== "zombie_think")
	{
		return;
	}
	if(!isdefined(self.var_641269c0))
	{
		self.var_641269c0 = 1;
		return;
	}
	else
	{
	}
	self thread electric_cherry_shock_fx();
	self.zombie_tesla_hit = 1;
	self.ignoreall = 1;
	self DoDamage(Int(self.maxhealth / 4 + 500), self, self, self, "MOD_PROJECTILE_SPLASH");
	wait(2);
	if(isdefined(self))
	{
		self.zombie_tesla_hit = 0;
		self.ignoreall = 0;
		self notify("stun_fx_end");
	}
	self.var_641269c0 = undefined;
	self.var_87371112 = undefined;
	return;
	~self.ignoreall;
}

/*
	Name: electric_cherry_shock_fx
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x1358
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 380
*/
function electric_cherry_shock_fx()
{
	self endon("death");
	if(!isVehicle(self))
	{
		self clientfield::set("tesla_shock_eyes_fx", 1);
	}
	self playsound("zmb_elec_jib_zombie");
	self waittill("stun_fx_end");
	if(!isVehicle(self))
	{
		self clientfield::set("tesla_shock_eyes_fx", 0);
	}
}

/*
	Name: function_e645a8e8
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x1408
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 405
*/
function function_e645a8e8(or)
{
	self DoDamage(Int(self.maxhealth / 8 + 500), or, self, self, "MOD_PROJECTILE_SPLASH");
}

/*
	Name: function_cf65384a
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x1468
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 420
*/
function function_cf65384a(or)
{
	self endon("death");
	self namespace_851dc78f::function_4621bbdd("actor", "frozen_zombie_test", 1);
	self.var_87371112 = 1;
	self.var_4564dc68 = 1;
	self ASMSetAnimationRate(0);
	self thread function_837de428();
	wait(8);
	self notify("hash_e1eee4c8");
	self ASMSetAnimationRate(1);
	self.var_87371112 = undefined;
	self.var_4564dc68 = undefined;
	self namespace_851dc78f::function_4621bbdd("actor", "frozen_zombie_test", 0);
}

/*
	Name: function_837de428
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x1558
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 446
*/
function function_837de428()
{
	or = self.origin;
	wait(0.05);
	var_8be4db6f = spawn("script_model", or);
	var_8be4db6f SetModel("cp_final_snow_chunk_03");
	self util::waittill_any("changechews_ice_over", "death");
	var_8be4db6f delete();
	wait(0.1);
	wait(2);
}

/*
	Name: function_10d99839
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x1618
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 468
*/
function function_10d99839(or)
{
	self.var_87371112 = 1;
	self endon("death");
	time = 6;
	self PlayLoopSound("chr_burn_npc_loop1");
	while(time > 0)
	{
		str_tag = "J_SpineUpper";
		PlayFXOnTag(level._effect["inferno_torso_fire"], self, str_tag);
		time = time - 1;
		wait(1);
		damage = Int(self.maxhealth / 10 + 500);
		if(self.health <= damage)
		{
			self DoDamage(damage + 666, self.origin, self, self, "none");
		}
		else
		{
			self DoDamage(damage, self.origin, self, self, "none");
		}
	}
	self.var_87371112 = undefined;
}

/*
	Name: function_e64458d
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x1788
	Size: 0xD0
	Parameters: 2
	Flags: None
	Line Number: 503
*/
function function_e64458d(FX, or)
{
	var_8be4db6f = spawn("script_model", or);
	var_8be4db6f SetModel("tag_origin");
	var_8be4db6f.angles = self.angles + VectorScale((1, 0, 0), 90);
	fx2 = PlayFXOnTag(FX, var_8be4db6f, "tag_origin");
	wait(2);
	var_8be4db6f delete();
}

/*
	Name: function_968f0442
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x1860
	Size: 0x478
	Parameters: 1
	Flags: None
	Line Number: 523
*/
function function_968f0442(current)
{
	self notify("hash_968f0442");
	self endon("hash_968f0442");
	var_2127f613 = [];
	var_2127f613[var_2127f613.size] = "electric";
	var_2127f613[var_2127f613.size] = "ice";
	var_2127f613[var_2127f613.size] = "explosive";
	var_2127f613[var_2127f613.size] = "fire";
	if(isdefined(current))
	{
		for(i = 0; i < var_2127f613.size; i++)
		{
			if(var_2127f613[i] == current)
			{
				var_2127f613 = ArrayRemoveIndex(var_2127f613, i);
			}
		}
	}
	self.var_6af3d125 = var_2127f613[RandomInt(var_2127f613.size)];
	if(self.var_6af3d125 == "electric")
	{
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleGreen", 1);
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleYellow", 0);
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleBlue", 0);
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleRed", 0);
	}
	if(self.var_6af3d125 == "ice")
	{
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleBlue", 1);
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleYellow", 0);
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleGreen", 0);
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleRed", 0);
	}
	if(self.var_6af3d125 == "explosive")
	{
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleYellow", 1);
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleGreen", 0);
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleBlue", 0);
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleRed", 0);
	}
	if(self.var_6af3d125 == "fire")
	{
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleRed", 1);
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleYellow", 0);
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleGreen", 0);
		self namespace_4b6e359c::function_75aa16e4("specialty_changechews", "changechews", "overlayStyleBlue", 0);
	}
}

/*
	Name: function_1d9c5873
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x1CE0
	Size: 0xBC
	Parameters: 0
	Flags: None
	Line Number: 583
*/
function function_1d9c5873()
{
	self notify("hash_1d9c5873");
	self endon("hash_1d9c5873");
	while(self namespace_851dc78f::function_5f9a13b3("specialty_changechews"))
	{
		self waittill("damage");
		if(self.health <= 50)
		{
			if(self namespace_851dc78f::function_5f9a13b3("specialty_changechews"))
			{
				self thread function_968f0442(self.var_6af3d125);
			}
			while(self.health <= 50)
			{
				wait(0.05);
			}
		}
	}
}

