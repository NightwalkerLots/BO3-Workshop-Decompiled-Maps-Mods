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
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_f354aa4;

/*
	Name: __init__sytem__
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0x6F0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 46
*/
function autoexec __init__sytem__()
{
	system::register("estatic", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0x730
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
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0x750
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_estatic", "customperk", 2500, &"ZM_REAP_MOD_PERK_ESTATIC", GetWeapon("zombie_perk_bottle_estatic"));
	zm_perks::register_perk_precache_func("specialty_estatic", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_estatic", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_estatic", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_estatic", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_estatic", "Estatic Elixir", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_estatic", &"ZM_REAP_MOD_PERK_ESTATIC_DB", 2000, "Estatic Elixir", "estatic");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_estatic"] = 1;
	callback::on_spawned(&on_player_spawned);
	Array::add(level.perk_damage_override, &function_1db26e3, 0);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0x938
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_estatic"] = spawnstruct();
	level.machine_assets["specialty_estatic"].weapon = GetWeapon("zombie_perk_bottle_estatic");
	level.machine_assets["specialty_estatic"].off_model = "cz_zombie_vending_estatic_off";
	level.machine_assets["specialty_estatic"].on_model = "cz_zombie_vending_estatic";
}

/*
	Name: function_19157aff
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0x9E0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 122
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0x9F0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 136
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_estatic", "estatic", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0xA38
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 151
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_estatic_jingle";
	use_trigger.script_string = "specialty_estatic";
	use_trigger.script_label = "mus_perks_estatic_sting";
	use_trigger.target = "Estatic Elixir";
	perk_machine.script_string = "specialty_estatic";
	perk_machine.targetname = "Estatic Elixir";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_estatic";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0xB00
	Size: 0xB8
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
	self.disabled_perks["specialty_estatic"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_estatic"] = 1;
	self.var_4c2152f4 = 0;
	self thread namespace_4b6e359c::function_75aa16e4("specialty_estatic", "estatic", "MeterBlue", 0);
}

/*
	Name: function_b4722825
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0xBC0
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 205
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_estatic"] = 0;
	self.var_b5c2c258["specialty_estatic"] = undefined;
	self.var_d6aef449["specialty_estatic"] = undefined;
}

/*
	Name: on_player_spawned
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0xC20
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 222
*/
function on_player_spawned()
{
	self thread function_f354aa4();
	self thread function_403d4bbe();
}

/*
	Name: function_403d4bbe
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0xC60
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
	Name: function_f354aa4
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0xD08
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 269
*/
function function_f354aa4()
{
	self endon("disconnect");
	self notify("hash_66c83902");
	self endon("hash_66c83902");
	while(1)
	{
		self waittill("sprint_start");
		if(self namespace_851dc78f::function_5f9a13b3("specialty_estatic") && self issprinting())
		{
			self thread function_38e2e46d(VectorScale((0, 0, 1), 45));
			self thread function_38e2e46d(VectorScale((0, 0, 1), 25));
			self thread function_b4743568();
			self waittill("sprint_end");
			self notify("hash_d214412a");
		}
		wait(0.05);
	}
	return;
	++;
}

/*
	Name: function_38e2e46d
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0xE08
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 301
*/
function function_38e2e46d(add)
{
	fxOrg = spawn("script_model", self.origin + add);
	fxOrg SetModel("tag_origin");
	FX = PlayFXOnTag(level._effect["tesla_bolt"], fxOrg, "tag_origin");
	fxOrg thread function_444a2233(self, add);
	fxOrg.targetname = "estatic_fx";
	self util::waittill_any("estatic_off", "disconnect");
	fxOrg delete();
	return;
}

/*
	Name: function_444a2233
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0xF18
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 323
*/
function function_444a2233(player, add)
{
	while(isdefined(self))
	{
		self moveto(player.origin + add, 0.1);
		wait(0.1);
	}
}

/*
	Name: function_b4743568
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0xF78
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 342
*/
function function_b4743568()
{
	self endon("disconnect");
	self endon("hash_d214412a");
	while(1)
	{
		a_zombies = GetAITeamArray("axis");
		a_zombies = util::get_array_of_closest(self.origin, a_zombies);
		for(i = 0; i < a_zombies.size; i++)
		{
			if(DistanceSquared(self.origin, a_zombies[i].origin) < 4900)
			{
				a_zombies[i] thread function_641269c0(self);
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_641269c0
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0x1078
	Size: 0x248
	Parameters: 2
	Flags: None
	Line Number: 371
*/
function function_641269c0(player, var_ce26ea8b)
{
	if(!isdefined(var_ce26ea8b))
	{
		var_ce26ea8b = 1;
	}
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
	playsoundatposition("zmb_bgb_mindblown_start", self.origin + VectorScale((0, 0, 1), 40));
	if(isdefined(self) && isdefined(player) && player namespace_851dc78f::function_b690a849("specialty_estatic"))
	{
		if(!isdefined(player.var_4c2152f4))
		{
			player.var_4c2152f4 = 0;
		}
		if(player.var_4c2152f4 < 40)
		{
			player.var_4c2152f4++;
			num = 0;
			if(player.var_4c2152f4 >= 10)
			{
				num = 1;
			}
			if(player.var_4c2152f4 >= 20)
			{
				num = 2;
			}
			if(player.var_4c2152f4 >= 30)
			{
				num = 3;
			}
			if(player.var_4c2152f4 >= 40)
			{
				num = 4;
			}
			player thread namespace_4b6e359c::function_75aa16e4("specialty_estatic", "estatic", "overlayStyleCounter", num + 1);
		}
	}
	wait(2);
	if(isdefined(self))
	{
		self.zombie_tesla_hit = 0;
		self.ignoreall = 0;
		self notify("stun_fx_end");
	}
	self.var_641269c0 = undefined;
}

/*
	Name: electric_cherry_shock_fx
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0x12C8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 443
*/
function electric_cherry_shock_fx()
{
	self endon("death");
	if(!isVehicle(self))
	{
		self clientfield::set("tesla_shock_eyes_fx", 1);
	}
	self playsound("estatic_electric_stun");
	self waittill("stun_fx_end");
	if(!isVehicle(self))
	{
		self clientfield::set("tesla_shock_eyes_fx", 0);
	}
}

/*
	Name: function_1db26e3
	Namespace: namespace_f354aa4
	Checksum: 0x424F4353
	Offset: 0x1378
	Size: 0x3A0
	Parameters: 10
	Flags: None
	Line Number: 468
*/
function function_1db26e3(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!self namespace_851dc78f::function_5f9a13b3("specialty_estatic"))
	{
		return undefined;
	}
	if(!isdefined(self.var_4c2152f4) || (isdefined(self.var_4c2152f4) && self.var_4c2152f4 < 9))
	{
		return undefined;
	}
	can_use = 1;
	if(self namespace_851dc78f::function_5f9a13b3("specialty_slider") || self namespace_851dc78f::function_5f9a13b3("specialty_da_phd_slider") || self bgb::is_enabled("zm_bgb_danger_closest"))
	{
		if(sMeansOfDeath == "MOD_ELECTOCUTED" || sMeansOfDeath == "MOD_EXPLOSIVE" || sMeansOfDeath == "MOD_EXPLOSIVE_SPLASH" || sMeansOfDeath == "MOD_FALLING" || sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_PROJECTILE" || sMeansOfDeath == "MOD_PROJECTILE_SPLASH" || sMeansOfDeath == "MOD_GRENADE_SPLASH" || sMeansOfDeath == "MOD_SUICIDE" || sMeansOfDeath == "MOD_IMPACT")
		{
			can_use = 0;
		}
	}
	if(can_use && isdefined(eAttacker) && eAttacker.archetype == "zombie" && eAttacker.ai_state == "zombie_think")
	{
		self.var_4c2152f4 = self.var_4c2152f4 - 10;
		num = 0;
		if(self.var_4c2152f4 >= 10)
		{
			num = 1;
		}
		if(self.var_4c2152f4 >= 20)
		{
			num = 2;
		}
		if(self.var_4c2152f4 >= 30)
		{
			num = 3;
		}
		if(self.var_4c2152f4 >= 40)
		{
			num = 4;
		}
		self thread namespace_4b6e359c::function_75aa16e4("specialty_estatic", "estatic", "overlayStyleCounter", num + 1);
		a_zombies = GetAITeamArray("axis");
		a_zombies = util::get_array_of_closest(self.origin, a_zombies);
		for(i = 0; i < a_zombies.size; i++)
		{
			if(DistanceSquared(self.origin, a_zombies[i].origin) < 12100)
			{
				a_zombies[i] thread function_641269c0(self, 1);
			}
		}
	}
	return undefined;
}

