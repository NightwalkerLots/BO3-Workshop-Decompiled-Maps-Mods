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
#include scripts\zm\_zm_powerup_utility;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_f8dd4e39;

/*
	Name: __init__sytem__
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0x758
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 47
*/
function autoexec __init__sytem__()
{
	system::register("MH_MOCHA", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0x798
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function __init__()
{
	function_1a92256e();
}

/*
	Name: function_1a92256e
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0x7B8
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_mh_mocha", "mh_mocha", 2500, &"ZM_REAP_MOD_PERK_MH_MOCHA", GetWeapon("zombie_perk_bottle_mh_mocha"));
	zm_perks::register_perk_precache_func("specialty_mh_mocha", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_mh_mocha", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_mh_mocha", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_mh_mocha", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_mh_mocha", "Miracle Hands Mocha", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_mh_mocha", &"ZM_REAP_MOD_PERK_MH_MOCHA_DB", 3000, "Miracle Hands Mocha", "mh_mocha");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_mh_mocha"] = 1;
	namespace_3b75c34a::function_4e972a8e(&function_d06ca97d);
	callback::on_spawned(&on_player_spawn);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0x998
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_mh_mocha"] = spawnstruct();
	level.machine_assets["specialty_mh_mocha"].weapon = GetWeapon("zombie_perk_bottle_mh_mocha");
	level.machine_assets["specialty_mh_mocha"].off_model = "cz_zombie_vending_mh_mocha_off";
	level.machine_assets["specialty_mh_mocha"].on_model = "cz_zombie_vending_mh_mocha";
}

/*
	Name: function_19157aff
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0xA40
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 124
*/
function function_19157aff()
{
	return;
}

/*
	Name: function_99c1452c
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0xA50
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 139
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_mh_mocha", "mh_mocha", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0xA98
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 154
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_mh_mocha_jingle";
	use_trigger.script_string = "specialty_mh_mocha";
	use_trigger.script_label = "mus_perks_mh_mocha_sting";
	use_trigger.target = "Miracle Hands Mocha";
	perk_machine.script_string = "specialty_mh_mocha";
	perk_machine.targetname = "Miracle Hands Mocha";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_mh_mocha";
		return;
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0xB60
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
	self.disabled_perks["specialty_mh_mocha"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_mh_mocha"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0xBE8
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 209
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_mh_mocha"] = 0;
	self.var_b5c2c258["specialty_mh_mocha"] = undefined;
	self.var_d6aef449["specialty_mh_mocha"] = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d06ca97d
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0xC48
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 228
*/
function function_d06ca97d()
{
	if(self.powerup_name == "random_weapon")
	{
		return;
	}
	if(level.zombie_powerups[self.powerup_name].zombie_grabbable == 1)
	{
		return;
	}
	if(self.powerup_name == "ww_grenade" || self.powerup_name == "zombie_full_ammo" || self.powerup_name == "lose_points_team_powerup" || self.powerup_name == "lose_perk_team_powerup" || self.powerup_name == "anti_carpentr")
	{
		return;
	}
	t_use = spawn("trigger_radius_use", self.origin - VectorScale((0, 0, 1), 16), 0, 100, 64);
	t_use setcursorhint("HINT_NOICON");
	t_use TriggerIgnoreTeam();
	t_use setHintString(&"ZM_REAP_MOD_PERK_MH_MOCHA_TRANSMUTE");
	t_use thread function_ca725238(self);
	t_use thread function_48b53440(self);
	t_use.targetname = "mocha_transmutaion";
	self util::waittill_any("powerup_timedout", "powerup_grabbed", "hacked", "death");
	if(isdefined(t_use))
	{
		t_use delete();
	}
}

/*
	Name: function_ca725238
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0xE30
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 266
*/
function function_ca725238(powerup)
{
	while(isdefined(powerup) && isdefined(self))
	{
		if(!isdefined(powerup) && isdefined(self))
		{
			self delete();
		}
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(!players[i] zm_utility::in_revive_trigger() && players[i] namespace_851dc78f::function_5f9a13b3("specialty_mh_mocha"))
			{
				self setinvisibletoplayer(players[i], 0);
				continue;
			}
			self setinvisibletoplayer(players[i], 1);
		}
		if(powerup.origin - VectorScale((0, 0, 1), 16) != self.origin)
		{
			self.origin = powerup.origin;
		}
		wait(0.05);
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_b2ea967d
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0xFC0
	Size: 0x128
	Parameters: 3
	Flags: None
	Line Number: 306
*/
function function_b2ea967d(upgrade, var_3053dfc5, var_5f39587e)
{
	powerup_keys = getArrayKeys(level.zombie_powerups);
	powerup_keys = Array::randomize(powerup_keys);
	for(i = 0; i < powerup_keys.size; i++)
	{
		if(powerup_keys[i] == var_3053dfc5 || powerup_keys[i] == var_5f39587e)
		{
			continue;
		}
		if(upgrade)
		{
			if(powerup_keys[i] == "nuke" || powerup_keys[i] == "carpenter")
			{
				continue;
			}
		}
		if([[level.zombie_powerups[powerup_keys[i]].func_should_drop_with_regular_powerups]]())
		{
			return powerup_keys[i];
		}
	}
	return powerup_keys[0];
}

/*
	Name: function_48b53440
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0x10F0
	Size: 0x380
	Parameters: 1
	Flags: None
	Line Number: 341
*/
function function_48b53440(powerup)
{
	powerup endon("powerup_timedout");
	powerup endon("powerup_grabbed");
	powerup endon("hacked");
	powerup endon("death");
	var_3053dfc5 = powerup.powerup_name;
	var_770b88f2 = 0;
	uses = 3;
	while(isdefined(powerup) && isdefined(self))
	{
		self waittill("trigger", player);
		if(!isdefined(player) || !player namespace_851dc78f::function_5f9a13b3("specialty_mh_mocha") || uses <= 0)
		{
			continue;
		}
		var_5f39587e = powerup.powerup_name;
		var_e29daab4 = player namespace_851dc78f::function_b690a849("specialty_mh_mocha");
		if(uses == 3 && !var_770b88f2 && var_e29daab4 && var_3053dfc5 == "full_ammo")
		{
			var_d2000dfa = "free_perk";
			var_770b88f2 = 1;
		}
		else
		{
			var_d2000dfa = function_b2ea967d(var_e29daab4, var_3053dfc5, var_5f39587e);
		}
		if(!isdefined(level.zombie_powerups[var_d2000dfa]))
		{
			continue;
		}
		struct = level.zombie_powerups[var_d2000dfa];
		powerup SetModel(struct.model_name);
		powerup.powerup_name = struct.powerup_name;
		powerup.hint = struct.hint;
		powerup.only_affects_grabber = struct.only_affects_grabber;
		powerup thread zm_powerups::powerup_wobble_fx();
		if(!var_770b88f2 || !var_e29daab4)
		{
			uses--;
		}
		if(struct.only_affects_grabber)
		{
			playFX(level._effect["powerup_grabbed_solo"], powerup.origin);
		}
		else if(struct.any_team)
		{
			playFX(level._effect["powerup_grabbed_caution"], powerup.origin);
		}
		else
		{
			playFX(level._effect["powerup_grabbed"], powerup.origin);
		}
		if(uses == 0)
		{
			self delete();
			return;
		}
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: on_player_spawn
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0x1478
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 416
*/
function on_player_spawn()
{
	self thread function_a3bd7c97();
}

/*
	Name: function_a3bd7c97
	Namespace: namespace_f8dd4e39
	Checksum: 0x424F4353
	Offset: 0x14A0
	Size: 0x256
	Parameters: 0
	Flags: None
	Line Number: 431
*/
function function_a3bd7c97()
{
	self endon("disconnect");
	self notify("hash_31e127ad");
	self endon("hash_31e127ad");
	while(1)
	{
		if(self namespace_851dc78f::function_5f9a13b3("specialty_mh_mocha"))
		{
			if(!self hasPerk("specialty_fastads"))
			{
				self setPerk("specialty_fastads");
			}
			if(!self hasPerk("specialty_fastmeleerecovery"))
			{
				self setPerk("specialty_fastmeleerecovery");
			}
			if(!self hasPerk("specialty_fastweaponswitch"))
			{
				self setPerk("specialty_fastweaponswitch");
			}
			if(!self hasPerk("specialty_fastequipmentuse"))
			{
				self setPerk("specialty_fastequipmentuse");
			}
			if(!self hasPerk("specialty_fasttoss"))
			{
				self setPerk("specialty_fasttoss");
			}
		}
		else if(!(isdefined(self.bgb) && self.bgb == "zm_bgb_always_done_swiftly"))
		{
			self unsetPerk("specialty_fastads");
		}
		self unsetPerk("specialty_fastmeleerecovery");
		self unsetPerk("specialty_fastweaponswitch");
		self unsetPerk("specialty_fastequipmentuse");
		self unsetPerk("specialty_fasttoss");
		wait(1);
	}
}

