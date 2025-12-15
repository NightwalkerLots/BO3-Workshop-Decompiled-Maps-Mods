#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\gameobjects_shared;
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

#namespace namespace_79c5ac56;

/*
	Name: __init__sytem__
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x608
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 46
*/
function autoexec __init__sytem__()
{
	system::register("FFYL", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x648
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
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x668
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_ffyl", "customperk", 3500, &"ZM_REAP_MOD_PERK_FFYL", GetWeapon("zombie_perk_bottle_ffyl"));
	zm_perks::register_perk_precache_func("specialty_ffyl", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_ffyl", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_ffyl", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_ffyl", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_ffyl", "Fighters Fizz", "jugger_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_ffyl", &"ZM_REAP_MOD_PERK_FFYL_DB", 4000, "Fighters Fizz", "ffyl");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_ffyl"] = 1;
	callback::on_spawned(&onSpawn);
	zm_spawner::register_zombie_death_event_callback(&function_2935bd5d);
	callback::on_laststand(&function_4767b258);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x868
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_ffyl"] = spawnstruct();
	level.machine_assets["specialty_ffyl"].weapon = GetWeapon("zombie_perk_bottle_ffyl");
	level.machine_assets["specialty_ffyl"].off_model = "zombie_vending_ffyl_off";
	level.machine_assets["specialty_ffyl"].on_model = "zombie_vending_ffyl_on";
}

/*
	Name: function_19157aff
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x910
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 123
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x920
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 137
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_ffyl", "ffyl", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x968
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 152
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_ffyl_jingle";
	use_trigger.script_string = "specialty_ffyl";
	use_trigger.script_label = "mus_perks_ffyl_sting";
	use_trigger.target = "Fighters Fizz";
	perk_machine.script_string = "specialty_ffyl";
	perk_machine.targetname = "Fighters Fizz";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_ffyl";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0xA30
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 176
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_ffyl"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_ffyl"] = 1;
	self thread function_f4782781();
	return;
}

/*
	Name: function_b4722825
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0xAC8
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 206
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_ffyl"] = 0;
	self.var_b5c2c258["specialty_ffyl"] = undefined;
	self.var_d6aef449["specialty_ffyl"] = undefined;
}

/*
	Name: function_f4782781
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0xB28
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 223
*/
function function_f4782781()
{
	level.callbackPlayerLastStand = &PlayerLastStand;
	self thread function_758e0d15();
	level zm_utility::increment_no_end_game_check();
	self.var_5d9bb57 = 1;
	self.player_too_many_weapons_monitor = 0;
	return;
	ERROR: Bad function call
}

/*
	Name: function_4767b258
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0xB98
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 244
*/
function function_4767b258()
{
	if(self.var_5d9bb57)
	{
		perk_array = [];
		if(level._custom_perks.size > 0)
		{
			a_keys = getArrayKeys(level._custom_perks);
			for(i = 0; i < a_keys.size; i++)
			{
				if(namespace_851dc78f::function_20dc5a15(a_keys[i]) && self namespace_851dc78f::function_5f9a13b3(a_keys[i]) || (!namespace_851dc78f::function_20dc5a15(a_keys[i]) && self hasPerk(a_keys[i])) && (a_keys[i] != "specialty_ffyl" || (a_keys[i] == "specialty_ffyl" && self namespace_851dc78f::function_b690a849("specialty_ffyl"))))
				{
					perk_array[perk_array.size] = a_keys[i];
				}
			}
		}
		else if(perk_array.size > 0)
		{
			var_81c5f011 = 1;
			self.var_70355b8e = perk_array;
		}
		self thread function_5eece5b1();
	}
}

/*
	Name: function_5eece5b1
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0xD50
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 279
*/
function function_5eece5b1()
{
	self function_694c4a3();
	self.var_5d9bb57 = 0;
	self notify("hash_9155f5cd");
	wait(1);
	level zm_utility::decrement_no_end_game_check();
}

/*
	Name: function_694c4a3
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0xDB0
	Size: 0x308
	Parameters: 0
	Flags: None
	Line Number: 298
*/
function function_694c4a3()
{
	self endon("disconnect");
	self endon("death");
	self endon("player_suicide");
	self endon("hash_306d1425");
	self endon("hash_6179c72");
	bleedout_time = GetDvarFloat("player_lastStandBleedoutTime");
	if(isdefined(self.n_bleedout_time_multiplier))
	{
		bleedout_time = bleedout_time * self.n_bleedout_time_multiplier;
	}
	if(isdefined(self.has_specific_powerup_weapon) && (isdefined(self.has_specific_powerup_weapon["minigun"]) && self.has_specific_powerup_weapon["minigun"]))
	{
		zm_powerups::weapon_powerup_remove(self, "minigun_time_over", "minigun", 1);
	}
	self thread function_dd3e5424(bleedout_time);
	var_3d179976 = self util::waittill_any_return("timeout", "ffyl_killed_zombie", "activated_tombstone_shadow", "fake_death", "tombstone_revive");
	if(var_3d179976 == "ffyl_killed_zombie")
	{
		self thread zm_laststand::auto_revive(self, 0);
		wait(0.5);
		if(isdefined(self.var_70355b8e) && IsArray(self.var_70355b8e))
		{
			foreach(perk in self.var_70355b8e)
			{
				self zm_perks::give_perk(perk);
			}
		}
		wait(1);
		self.lives++;
	}
	else if(var_3d179976 == "timeout" && level flag::get("solo_game") || (var_3d179976 == "timeout" && !level flag::get("solo_game") && level.activePlayers == 0 && self function_4dcca9a5()))
	{
		if(self laststand::player_is_in_laststand() && !isdefined(self.var_59c285cf))
		{
			level notify("end_game");
		}
	}
}

/*
	Name: function_4dcca9a5
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x10C0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 349
*/
function function_4dcca9a5()
{
	foreach(player in GetPlayers())
	{
		if(player == self)
		{
			continue;
		}
		if(player.var_5d9bb57)
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: function_dd3e5424
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x1170
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 375
*/
function function_dd3e5424(time)
{
	wait(time);
	self notify("timeout");
	return;
}

/*
	Name: function_2935bd5d
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x1198
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 392
*/
function function_2935bd5d(attacker)
{
	if(!isdefined(attacker) || (!(isdefined(attacker.var_5d9bb57) && attacker.var_5d9bb57)) || !attacker laststand::player_is_in_laststand())
	{
		return;
	}
	if(isVehicle(self))
	{
		str_damagemod = self.str_damagemod;
		w_damage = self.w_damage;
	}
	else
	{
		str_damagemod = self.damageMod;
		w_damage = self.damageWeapon;
	}
	attacker.w_min_last_stand_pistol_override = self.damageWeapon;
	attacker notify("hash_38f52eb");
}

/*
	Name: onSpawn
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x1278
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 422
*/
function onSpawn()
{
	self.var_5d9bb57 = 0;
}

/*
	Name: function_758e0d15
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x1290
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 437
*/
function function_758e0d15()
{
	self endon("hash_9155f5cd");
	self endon("disconnect");
	self endon("death");
	self.w_min_last_stand_pistol_override = self GetCurrentWeapon();
	while(1)
	{
		self waittill("weapon_change", weapon);
		self.w_min_last_stand_pistol_override = weapon;
	}
}

/*
	Name: PlayerLastStand
	Namespace: namespace_79c5ac56
	Checksum: 0x424F4353
	Offset: 0x1310
	Size: 0x52C
	Parameters: 9
	Flags: None
	Line Number: 460
*/
function PlayerLastStand(eInflictor, attacker, iDamage, sMeansOfDeath, weapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration)
{
	self notify("entering_last_stand");
	self DisableWeaponCycling();
	if(isdefined(level._game_module_player_laststand_callback))
	{
		self [[level._game_module_player_laststand_callback]](eInflictor, attacker, iDamage, sMeansOfDeath, weapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);
	}
	if(self laststand::player_is_in_laststand())
	{
		return;
	}
	if(isdefined(self.in_zombify_call) && self.in_zombify_call)
	{
		return;
	}
	self thread zm_laststand::player_last_stand_stats(eInflictor, attacker, iDamage, sMeansOfDeath, weapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);
	if(isdefined(level.playerlaststand_func))
	{
		[[level.playerlaststand_func]](eInflictor, attacker, iDamage, sMeansOfDeath, weapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);
	}
	self.health = 1;
	self.laststand = 1;
	self zm_laststand::set_ignoreme(1);
	callback::callback("hash_6751ab5b");
	self thread gameobjects::on_player_last_stand();
	if(!(isdefined(self.no_revive_trigger) && self.no_revive_trigger) || self.var_5d9bb57 == 1)
	{
		self zm_laststand::revive_trigger_spawn();
	}
	else if(isdefined(self.no_revive_trigger) && self.no_revive_trigger || self.var_5d9bb57 == 0)
	{
		self UndoLastStand();
	}
	if(isdefined(self.is_zombie) && self.is_zombie)
	{
		self TakeAllWeapons();
		if(isdefined(attacker) && isPlayer(attacker) && attacker != self)
		{
			attacker notify("killed_a_zombie_player", eInflictor, self, iDamage, sMeansOfDeath, weapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);
		}
	}
	else if(self.var_5d9bb57 == 0)
	{
		self zm_laststand::laststand_disable_player_weapons();
		self zm_laststand::laststand_give_pistol();
	}
	else if(IsInArray(self getweaponslistprimaries(), self GetCurrentWeapon()))
	{
		self DisableWeaponCycling();
	}
	else
	{
		self SwitchToWeapon(self getweaponslistprimaries()[0]);
		self waittill("weapon_change_complete");
		self DisableWeaponCycling();
	}
	if(isdefined(level.playerSuicideAllowed) && level.playerSuicideAllowed && GetPlayers().size > 1)
	{
		if(!isdefined(level.canPlayerSuicide) || self [[level.canPlayerSuicide]]())
		{
			self thread zm_laststand::suicide_trigger_spawn();
		}
	}
	if(isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	if(level.lastStandGetupAllowed)
	{
		self thread zm_laststand::laststand_getup();
	}
	else
	{
		bleedout_time = GetDvarFloat("player_lastStandBleedoutTime");
		if(isdefined(self.n_bleedout_time_multiplier))
		{
			bleedout_time = bleedout_time * self.n_bleedout_time_multiplier;
		}
		level clientfield::increment("laststand_update" + self GetEntityNumber(), 30);
		self thread zm_laststand::laststand_bleedout(bleedout_time);
	}
	demo::bookmark("player_downed", GetTime(), self);
	self notify("player_downed");
	self thread zm_laststand::refire_player_downed();
	self thread laststand::cleanup_laststand_on_disconnect();
}

