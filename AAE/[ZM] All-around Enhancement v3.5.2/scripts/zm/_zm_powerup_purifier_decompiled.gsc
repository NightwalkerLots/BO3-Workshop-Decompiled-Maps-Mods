#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_clientdvar;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\extra_weapon_load;

#namespace namespace_fdb503ce;

/*
	Name: __init__sytem__
	Namespace: namespace_fdb503ce
	Checksum: 0x424F4353
	Offset: 0x4C0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 37
*/
function autoexec __init__sytem__()
{
	system::register("zm_powerup_purifier", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_fdb503ce
	Checksum: 0x424F4353
	Offset: 0x500
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __init__()
{
	if(GetWeapon("purifier").name == "purifier")
	{
		zm_powerups::register_powerup("purifier", &function_cdfd204a);
		zm_powerups::register_powerup_weapon("purifier", &function_a06ec289);
		zm_powerups::powerup_set_prevent_pick_up_if_drinking("purifier", 1);
		zm_powerups::set_weapon_ignore_max_ammo("purifier");
		zm_powerups::add_zombie_powerup("purifier", "wpn_t7_hero_flamethrower_world", &"ZOMBIE_POWERUP_PURIFIER", &function_fa3528fc, 1, 0, 0, undefined, "powerup_purifier", "zombie_powerup_purifier_time", "zombie_powerup_purifier_on");
		level.zombie_powerup_weapon["purifier"] = GetWeapon("purifier");
		callback::on_connect(&init_player_zombie_vars);
		zm::register_player_friendly_fire_callback(&function_cea5e22d);
	}
}

/*
	Name: function_cea5e22d
	Namespace: namespace_fdb503ce
	Checksum: 0x424F4353
	Offset: 0x688
	Size: 0x108
	Parameters: 11
	Flags: None
	Line Number: 77
*/
function function_cea5e22d(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex)
{
	if(eAttacker GetCurrentWeapon().name != "purifier")
	{
		return;
	}
	if(self laststand::player_is_in_laststand() || isdefined(self.reviveTrigger))
	{
		self zm_laststand::auto_revive(eAttacker, 0);
		namespace_22b67853::function_f105c5b1("revive_an_ally", eAttacker);
	}
	else
	{
		self setnormalhealth(1);
		return;
	}
}

/*
	Name: function_cdfd204a
	Namespace: namespace_fdb503ce
	Checksum: 0x424F4353
	Offset: 0x798
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 105
*/
function function_cdfd204a(player)
{
	if(isdefined(player.has_powerup_weapon) && player.has_powerup_weapon)
	{
		return 1;
	}
	level thread function_68295275(player);
	if(isdefined(level.var_fab7b425))
	{
		level thread [[level.var_fab7b425]](player);
	}
	return 0;
}

/*
	Name: init_player_zombie_vars
	Namespace: namespace_fdb503ce
	Checksum: 0x424F4353
	Offset: 0x818
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 129
*/
function init_player_zombie_vars()
{
	self.zombie_vars["zombie_powerup_purifier_on"] = 0;
	self.zombie_vars["zombie_powerup_purifier_time"] = 0;
}

/*
	Name: function_fa3528fc
	Namespace: namespace_fdb503ce
	Checksum: 0x424F4353
	Offset: 0x850
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 145
*/
function function_fa3528fc()
{
	if(function_4d623bdf() || (GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver") && GetDvarString("tfoption_flamer") == "1") || GetDvarString("aae_lite") != "")
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_4d623bdf
	Namespace: namespace_fdb503ce
	Checksum: 0x424F4353
	Offset: 0x920
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 164
*/
function function_4d623bdf()
{
	if(level.script == "zm_castle" || level.script == "zm_cosmodrome" || level.script == "zm_nuked")
	{
		return 1;
	}
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i].zombie_vars["zombie_powerup_purifier_on"] == 1)
		{
			return 1;
		}
	}
	if(!level flag::get("power_on"))
	{
		if(level flag::get("solo_game"))
		{
			if(!isdefined(level.solo_lives_given) || level.solo_lives_given == 0)
			{
				return 1;
			}
		}
		else
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_68295275
	Namespace: namespace_fdb503ce
	Checksum: 0x424F4353
	Offset: 0xA58
	Size: 0x1B8
	Parameters: 2
	Flags: None
	Line Number: 205
*/
function function_68295275()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: function_d1a0de66
	Namespace: namespace_fdb503ce
	Checksum: 0x424F4353
	Offset: 0xC18
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function function_d1a0de66()
{
	zm_powerups::weapon_watch_gunner_downed("purifier");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a06ec289
	Namespace: namespace_fdb503ce
	Checksum: 0x424F4353
	Offset: 0xC40
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 242
*/
function function_a06ec289(ent_player, str_weapon_time)
{
	ent_player thread function_be8880b7();
	while(ent_player.zombie_vars[str_weapon_time] > 0)
	{
		wait(0.05);
		ent_player.zombie_vars[str_weapon_time] = ent_player.zombie_vars[str_weapon_time] - 0.05;
	}
	return;
}

/*
	Name: function_be8880b7
	Namespace: namespace_fdb503ce
	Checksum: 0x424F4353
	Offset: 0xCD0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 263
*/
function function_be8880b7()
{
	self notify("hash_be8880b7");
	self endon("hash_be8880b7");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("weapon_fired", weapon);
		if(weapon == level.zombie_powerup_weapon["purifier"])
		{
			self function_d9e6a995();
			return;
		}
		else
		{
		}
	}
}

/*
	Name: function_d9e6a995
	Namespace: namespace_fdb503ce
	Checksum: 0x424F4353
	Offset: 0xD68
	Size: 0x2E0
	Parameters: 0
	Flags: None
	Line Number: 293
*/
function function_d9e6a995()
{
	view_pos = self GetWeaponMuzzlePoint();
	zombies = Array::get_all_closest(view_pos, GetAITeamArray(level.zombie_team), undefined, undefined, 750);
	if(!isdefined(zombies))
	{
		return;
	}
	view_angles = self getPlayerAngles();
	for(i = 0; i < zombies.size; i++)
	{
		if(zombies[i] namespace_ab57545b::function_79615af2())
		{
			zombie_eye = zombies[i] GetCentroid();
			in_view = util::within_fov(view_pos, view_angles, zombie_eye, cos(10));
			if(in_view)
			{
				trace = beamtrace(view_pos, zombie_eye, 0, self, 1);
				if(Distance(trace["position"], zombie_eye) < 20)
				{
					zombies[i] DoDamage(1000, zombies[i].origin, self, self, "torso_lower", "MOD_BURNED", 0, level.zombie_powerup_weapon["purifier"]);
					continue;
				}
			}
			if(Distance(zombies[i].origin, self.origin) < 60)
			{
				in_view = util::within_fov(view_pos, view_angles, zombie_eye, cos(70));
				if(in_view)
				{
					zombies[i] DoDamage(1000, zombies[i].origin, self, self, "torso_lower", "MOD_BURNED", 0, level.zombie_powerup_weapon["purifier"]);
				}
			}
		}
	}
}

/*
	Name: function_8e0d4847
	Namespace: namespace_fdb503ce
	Checksum: 0x424F4353
	Offset: 0x1050
	Size: 0x1A
	Parameters: 0
	Flags: None
	Line Number: 339
*/
function function_8e0d4847()
{
	self.zombie_vars["zombie_powerup_purifier_time"] = 0;
}

