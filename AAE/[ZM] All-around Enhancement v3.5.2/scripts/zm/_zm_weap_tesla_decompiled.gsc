#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_lightning_chain;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_tesla;
#include scripts\zm\_zm_weapons;

#namespace _zm_weap_tesla;

/*
	Name: init
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x688
	Size: 0x488
	Parameters: 0
	Flags: None
	Line Number: 31
*/
function init()
{
	level.weaponZMTeslaGun = GetWeapon("tesla_gun");
	level.weaponZMTeslaGunUpgraded = GetWeapon("tesla_gun_upgraded");
	if(!zm_weapons::is_weapon_included(level.weaponZMTeslaGun) && (!(isdefined(level.uses_tesla_powerup) && level.uses_tesla_powerup)))
	{
		return;
	}
	level._effect["tesla_viewmodel_rail"] = "zombie/fx_tesla_rail_view_zmb";
	level._effect["tesla_viewmodel_tube"] = "zombie/fx_tesla_tube_view_zmb";
	level._effect["tesla_viewmodel_tube2"] = "zombie/fx_tesla_tube_view2_zmb";
	level._effect["tesla_viewmodel_tube3"] = "zombie/fx_tesla_tube_view3_zmb";
	level._effect["tesla_viewmodel_rail_upgraded"] = "zombie/fx_tesla_rail_view_ug_zmb";
	level._effect["tesla_viewmodel_tube_upgraded"] = "zombie/fx_tesla_tube_view_ug_zmb";
	level._effect["tesla_viewmodel_tube2_upgraded"] = "zombie/fx_tesla_tube_view2_ug_zmb";
	level._effect["tesla_viewmodel_tube3_upgraded"] = "zombie/fx_tesla_tube_view3_ug_zmb";
	level._effect["tesla_shock_eyes"] = "zombie/fx_tesla_shock_eyes_zmb";
	zm::register_zombie_damage_override_callback(&tesla_zombie_damage_response);
	zm_spawner::register_zombie_death_animscript_callback(&tesla_zombie_death_response);
	zm::register_vehicle_damage_callback(&function_451357cd);
	zombie_utility::set_zombie_var("tesla_max_arcs", 5);
	zombie_utility::set_zombie_var("tesla_max_enemies_killed", 20);
	zombie_utility::set_zombie_var("tesla_radius_start", 300);
	zombie_utility::set_zombie_var("tesla_radius_decay", 20);
	zombie_utility::set_zombie_var("tesla_head_gib_chance", 75);
	zombie_utility::set_zombie_var("tesla_arc_travel_time", 0.11, 1);
	zombie_utility::set_zombie_var("tesla_kills_for_powerup", 10);
	zombie_utility::set_zombie_var("tesla_min_fx_distance", 128);
	zombie_utility::set_zombie_var("tesla_network_death_choke", 4);
	level.tesla_lightning_params = lightning_chain::create_lightning_chain_params(level.zombie_vars["tesla_max_arcs"], level.zombie_vars["tesla_max_enemies_killed"], level.zombie_vars["tesla_radius_start"], level.zombie_vars["tesla_radius_decay"], level.zombie_vars["tesla_head_gib_chance"], level.zombie_vars["tesla_arc_travel_time"], level.zombie_vars["tesla_kills_for_powerup"], level.zombie_vars["tesla_min_fx_distance"], level.zombie_vars["tesla_network_death_choke"], undefined, undefined, "wpn_tesla_bounce");
	level.var_9044a375 = lightning_chain::create_lightning_chain_params(level.zombie_vars["tesla_max_arcs"], 64, level.zombie_vars["tesla_radius_start"], level.zombie_vars["tesla_radius_decay"], level.zombie_vars["tesla_head_gib_chance"], level.zombie_vars["tesla_arc_travel_time"], level.zombie_vars["tesla_kills_for_powerup"], level.zombie_vars["tesla_min_fx_distance"], level.zombie_vars["tesla_network_death_choke"], undefined, undefined, "wpn_tesla_bounce");
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: tesla_devgui_dvar_think
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0xB18
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function tesla_devgui_dvar_think()
{
	/#
		if(!zm_weapons::is_weapon_included(level.weaponZMTeslaGun))
		{
			return;
		}
		SetDvar("Dev Block strings are not supported", level.zombie_vars["Dev Block strings are not supported"]);
		SetDvar("Dev Block strings are not supported", level.zombie_vars["Dev Block strings are not supported"]);
		SetDvar("Dev Block strings are not supported", level.zombie_vars["Dev Block strings are not supported"]);
		SetDvar("Dev Block strings are not supported", level.zombie_vars["Dev Block strings are not supported"]);
		SetDvar("Dev Block strings are not supported", level.zombie_vars["Dev Block strings are not supported"]);
		SetDvar("Dev Block strings are not supported", level.zombie_vars["Dev Block strings are not supported"]);
		for(;;)
		{
			level.zombie_vars["Dev Block strings are not supported"] = GetDvarInt("Dev Block strings are not supported");
			level.zombie_vars["Dev Block strings are not supported"] = GetDvarInt("Dev Block strings are not supported");
			level.zombie_vars["Dev Block strings are not supported"] = GetDvarInt("Dev Block strings are not supported");
			level.zombie_vars["Dev Block strings are not supported"] = GetDvarInt("Dev Block strings are not supported");
			level.zombie_vars["Dev Block strings are not supported"] = GetDvarInt("Dev Block strings are not supported");
			level.zombie_vars["Dev Block strings are not supported"] = GetDvarFloat("Dev Block strings are not supported");
			wait(0.5);
		}
	#/
}

/*
	Name: tesla_damage_init
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0xD40
	Size: 0x1D8
	Parameters: 4
	Flags: None
	Line Number: 111
*/
function tesla_damage_init(HIT_LOCATION, hit_origin, player, weapon)
{
	player endon("disconnect");
	if(isdefined(player.tesla_firing) && player.tesla_firing)
	{
		zm_utility::debug_print("TESLA: Player: '" + player.name + "' currently processing tesla damage");
		return;
	}
	if(isdefined(self.zombie_tesla_hit) && self.zombie_tesla_hit)
	{
		return;
	}
	zm_utility::debug_print("TESLA: Player: '" + player.name + "' hit with the tesla gun");
	player.tesla_enemies = undefined;
	player.tesla_enemies_hit = 1;
	player.tesla_powerup_dropped = 0;
	player.tesla_arc_count = 0;
	player.tesla_firing = 1;
	if(weapon === level.weaponZMTeslaGunUpgraded)
	{
		self lightning_chain::arc_damage(self, player, 1, level.var_9044a375);
	}
	else
	{
		self lightning_chain::arc_damage(self, player, 1, level.tesla_lightning_params);
	}
	if(player.tesla_enemies_hit >= 4)
	{
		player thread tesla_killstreak_sound();
	}
	player.tesla_enemies_hit = 0;
	player.tesla_firing = 0;
	return;
}

/*
	Name: is_tesla_damage
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0xF20
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 156
*/
function is_tesla_damage(mod, weapon)
{
	return weapon == level.weaponZMTeslaGun || weapon == level.weaponZMTeslaGunUpgraded && (mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH");
}

/*
	Name: enemy_killed_by_tesla
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0xF78
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 171
*/
function enemy_killed_by_tesla()
{
	return isdefined(self.tesla_death) && self.tesla_death;
}

/*
	Name: on_player_spawned
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0xF98
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 186
*/
function on_player_spawned()
{
	self thread tesla_sound_thread();
	self thread tesla_pvp_thread();
	self thread tesla_network_choke();
}

/*
	Name: tesla_sound_thread
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0xFF0
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 203
*/
function tesla_sound_thread()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		result = self util::waittill_any_return("grenade_fire", "death", "player_downed", "weapon_change", "grenade_pullback", "disconnect");
		if(!isdefined(result))
		{
		}
		else if(result == "weapon_change" || result == "grenade_fire" && (self GetCurrentWeapon() == level.weaponZMTeslaGun || self GetCurrentWeapon() == level.weaponZMTeslaGunUpgraded))
		{
			if(!isdefined(self.tesla_loop_sound))
			{
				self.tesla_loop_sound = spawn("script_origin", self.origin);
				self.tesla_loop_sound LinkTo(self);
				self thread cleanup_loop_sound(self.tesla_loop_sound);
			}
			self.tesla_loop_sound PlayLoopSound("wpn_tesla_idle", 0.25);
			self thread tesla_engine_sweets();
		}
		else
		{
			self notify("weap_away");
			if(isdefined(self.tesla_loop_sound))
			{
				self.tesla_loop_sound StopLoopSound(0.25);
			}
		}
	}
}

/*
	Name: cleanup_loop_sound
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x11C0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 245
*/
function cleanup_loop_sound(loop_sound)
{
	self waittill("disconnect");
	if(isdefined(loop_sound))
	{
		loop_sound delete();
	}
}

/*
	Name: tesla_engine_sweets
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x1208
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 264
*/
function tesla_engine_sweets()
{
	self endon("disconnect");
	self endon("death");
	self endon("weap_away");
	while(1)
	{
		wait(randomIntRange(7, 15));
		self play_tesla_sound("wpn_tesla_sweeps_idle");
	}
}

/*
	Name: tesla_pvp_thread
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x1280
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 286
*/
function tesla_pvp_thread()
{
	self endon("disconnect");
	self endon("death");
	self endon("death");
	for(;;)
	{
		self waittill("weapon_pvp_attack", attacker, weapon, damage, mod);
		if(self laststand::player_is_in_laststand())
		{
		}
		else if(weapon != level.weaponZMTeslaGun && weapon != level.weaponZMTeslaGunUpgraded)
		{
		}
		else if(mod != "MOD_PROJECTILE" && mod != "MOD_PROJECTILE_SPLASH")
		{
		}
		else if(self == attacker)
		{
			damage = Int(self.maxhealth * 0.25);
			if(damage < 25)
			{
				damage = 25;
			}
			if(self.health - damage < 1)
			{
				self.health = 1;
			}
			else
			{
				self.health = self.health - damage;
			}
		}
		self SetElectrified(1);
		self shellshock("electrocution", 1);
		self playsound("wpn_tesla_bounce");
	}
}

/*
	Name: play_tesla_sound
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x1448
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 335
*/
function play_tesla_sound(emotion)
{
	self endon("disconnect");
	self endon("death");
	if(!isdefined(level.one_emo_at_a_time))
	{
		level.one_emo_at_a_time = 0;
		level.var_c = 0;
	}
	if(level.one_emo_at_a_time == 0)
	{
		level.var_c++;
		level.one_emo_at_a_time = 1;
		org = spawn("script_origin", self.origin);
		org LinkTo(self);
		org playsoundwithnotify(emotion, "sound_complete" + "_" + level.var_c);
		org waittill("sound_complete" + "_" + level.var_c);
		org delete();
		level.one_emo_at_a_time = 0;
	}
}

/*
	Name: tesla_killstreak_sound
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x1580
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 367
*/
function tesla_killstreak_sound()
{
	self endon("disconnect");
	self endon("death");
	self zm_audio::create_and_play_dialog("kill", "tesla");
	wait(3.5);
	level util::clientNotify("TGH");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: tesla_network_choke
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x15F0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 388
*/
function tesla_network_choke()
{
	self endon("disconnect");
	self endon("death");
	self endon("death");
	self.tesla_network_death_choke = 0;
	for(;;)
	{
		util::wait_network_frame();
		util::wait_network_frame();
		self.tesla_network_death_choke = 0;
	}
	return;
	self.tesla_network_death_choke++;
}

/*
	Name: tesla_zombie_death_response
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x1660
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 414
*/
function tesla_zombie_death_response()
{
	if(self enemy_killed_by_tesla())
	{
		return 1;
	}
	return 0;
}

/*
	Name: tesla_zombie_damage_response
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x1690
	Size: 0xC0
	Parameters: 13
	Flags: None
	Line Number: 433
*/
function tesla_zombie_damage_response(willBeKilled, inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(self is_tesla_damage(meansOfDeath, weapon))
	{
		self thread tesla_damage_init(sHitLoc, vPoint, attacker, weapon);
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_451357cd
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x1758
	Size: 0x128
	Parameters: 15
	Flags: None
	Line Number: 454
*/
function function_451357cd(eInflictor, player, damage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, modelIndex, partName, vSurfaceNormal)
{
	if(isdefined(self.ignore_nuke) && self.ignore_nuke)
	{
		return damage;
	}
	if(isdefined(self.marked_for_death) && self.marked_for_death)
	{
		return damage;
	}
	if(zm_utility::is_magic_bullet_shield_enabled(self))
	{
		return damage;
	}
	if(self is_tesla_damage(sMeansOfDeath, weapon))
	{
		self.lightning_chain_immune = 0;
		self thread tesla_damage_init(sHitLoc, vPoint, player, weapon);
	}
	return damage;
}

