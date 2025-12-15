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

#namespace inferno;

/*
	Name: __init__sytem__
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x5F0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("INFERNO", &__init__, undefined, undefined);
	return;
	continue;
}

/*
	Name: __init__
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x630
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function __init__()
{
	function_1a92256e();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1a92256e
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x650
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 79
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_inferno", "customperk", 3000, &"ZM_REAP_MOD_PERK_INFERNO", GetWeapon("zombie_perk_bottle_inferno"));
	zm_perks::register_perk_precache_func("specialty_inferno", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_inferno", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_inferno", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_inferno", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_inferno", "Inciner-Brandy", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_inferno", &"ZM_REAP_MOD_PERK_INFERNO_DB", 1500, "Inciner-Brandy", "inferno");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_inferno"] = 1;
	zm_spawner::register_zombie_damage_callback(&function_f2b13234);
}

/*
	Name: function_8bd87e3d
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x810
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_inferno"] = spawnstruct();
	level.machine_assets["specialty_inferno"].weapon = GetWeapon("zombie_perk_bottle_inferno");
	level.machine_assets["specialty_inferno"].off_model = "cz_zombie_vending_inferno";
	level.machine_assets["specialty_inferno"].on_model = "cz_zombie_vending_inferno";
}

/*
	Name: function_19157aff
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x8B8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 124
*/
function function_19157aff()
{
	return;
	ERROR: Bad function call
}

/*
	Name: function_99c1452c
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x8C8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 140
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_inferno", "inferno", "SetIconActive", state);
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_edb3a90b
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x910
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 158
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_inferno";
	use_trigger.script_label = "";
	use_trigger.target = "Inciner-Brandy";
	perk_machine.script_string = "specialty_inferno";
	perk_machine.targetname = "Inciner-Brandy";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_inferno";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x9D8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 182
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_inferno"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_inferno"] = 1;
}

/*
	Name: function_b4722825
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0xA60
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 210
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_inferno"] = 0;
	self.var_b5c2c258["specialty_inferno"] = undefined;
	self.var_d6aef449["specialty_inferno"] = undefined;
}

/*
	Name: function_f2b13234
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0xAC0
	Size: 0x170
	Parameters: 13
	Flags: None
	Line Number: 227
*/
function function_f2b13234(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(self.archetype == "zombie")
	{
		if(isdefined(e_player) && isPlayer(e_player) && e_player namespace_851dc78f::function_5f9a13b3("specialty_inferno") && RandomInt(100) < 10 && !isdefined(self.var_c1cd5b35) && (!isdefined(e_player.var_89856a0) || (isdefined(e_player.var_89856a0) && e_player.var_89856a0 < 8)))
		{
			if(str_mod == "MOD_PISTOL_BULLET" || str_mod == "MOD_RIFLE_BULLET")
			{
				self thread function_46152a45(e_player);
			}
		}
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_46152a45
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0xC38
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 253
*/
function function_46152a45(player)
{
	player endon("disconnect");
	self.var_c1cd5b35 = 1;
	if(!isdefined(player.var_89856a0))
	{
		player.var_89856a0 = 0;
	}
	player.var_89856a0 = player.var_89856a0 + 1;
	player thread function_5cb77540();
	self thread function_d556109e(player);
	self util::waittill_any("inferno_over", "death");
	self StopLoopSound();
	player.var_89856a0 = player.var_89856a0 - 1;
	if(player.var_89856a0 < 0)
	{
		player.var_89856a0 = 0;
	}
}

/*
	Name: function_d556109e
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0xD68
	Size: 0x180
	Parameters: 1
	Flags: None
	Line Number: 283
*/
function function_d556109e(player)
{
	player endon("disconnect");
	self endon("death");
	time = 6;
	self PlayLoopSound("chr_burn_npc_loop1");
	while(time > 0)
	{
		str_tag = "J_SpineUpper";
		PlayFXOnTag(level._effect["character_fire_death_torso"], self, str_tag);
		time = time - 1;
		wait(1);
		damage = 20 * level.round_number;
		if(self.health <= damage)
		{
			self thread function_999d6f66(player);
			self DoDamage(damage + 666, self.origin, self, player, 0, "MOD_EXPLOSIVE");
		}
		else
		{
			self DoDamage(damage, self.origin, self, player, 0, "MOD_EXPLOSIVE");
		}
	}
	self notify("hash_8ef9373b");
}

/*
	Name: function_999d6f66
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0xEF0
	Size: 0x1A8
	Parameters: 1
	Flags: None
	Line Number: 319
*/
function function_999d6f66(player)
{
	player endon("disconnect");
	self thread function_bc4deca3();
	a_e_blasted_zombies = Array::get_all_closest(self.origin, GetAITeamArray("axis"), undefined, undefined, 150);
	if(a_e_blasted_zombies.size > 0)
	{
		i = 0;
		while(i < a_e_blasted_zombies.size)
		{
			if(isalive(a_e_blasted_zombies[i]))
			{
				if(isdefined(player) && isPlayer(player) && player namespace_851dc78f::function_5f9a13b3("specialty_inferno") && RandomInt(100) < 50 && !isdefined(a_e_blasted_zombies[i].var_c1cd5b35) && (!isdefined(player.var_89856a0) || (isdefined(player.var_89856a0) && player.var_89856a0 < 8)))
				{
					a_e_blasted_zombies[i] thread function_46152a45(player);
					continue;
				}
			}
			i++;
		}
	}
}

/*
	Name: function_bc4deca3
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x10A0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 352
*/
function function_bc4deca3()
{
	var_8be4db6f = spawn("script_model", self.origin + VectorScale((0, 0, 1), 30));
	var_8be4db6f SetModel("tag_origin");
	var_8be4db6f.angles = self.angles + VectorScale((1, 0, 0), 90);
	FX = PlayFXOnTag(level._effect["zombie_guts_explosion"], var_8be4db6f, "tag_origin");
	wait(2);
	var_8be4db6f delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5cb77540
	Namespace: inferno
	Checksum: 0x424F4353
	Offset: 0x1188
	Size: 0x5C
	Parameters: 0
	Flags: None
	Line Number: 374
*/
function function_5cb77540()
{
	self endon("disconnect");
	self playsound("wpn_aat_blastfurnace_explo");
	self util::setClientSysState("setPerkOverlayStyle", "inferno_muzzle", self);
	wait(0.1);
}

