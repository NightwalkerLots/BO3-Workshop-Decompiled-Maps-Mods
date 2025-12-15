#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_lightning_chain;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmsavedata;

#namespace namespace_b3844a48;

/*
	Name: __init__sytem__
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0x4E0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 38
*/
function autoexec __init__sytem__()
{
	system::register("rayzorback", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0x520
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function __init__()
{
	level.var_bfa36368 = GetWeapon("rayzorback");
	level.var_91db5510 = GetWeapon("rayzorback_up");
	level.var_d1b744dd = GetWeapon("rayzorback_elec");
	level.var_a4b9c7e1 = GetWeapon("rayzorback_up_elec");
	level._effect["tesla_shock_eyes"] = "zombie/fx_tesla_shock_eyes_zmb";
	zm::register_zombie_damage_override_callback(&function_c3a4027c);
	zm_spawner::register_zombie_death_animscript_callback(&function_8d846c45);
	callback::on_spawned(&on_player_spawned);
	level thread function_a8ceb83c();
	return;
}

/*
	Name: function_a8ceb83c
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0x640
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function function_a8ceb83c()
{
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("extras_rayzorback") == 0)
	{
		return;
	}
	zm_utility::include_weapon("rayzorback", 1);
	zm_utility::include_weapon("rayzorback_up", 0);
	struct = spawnstruct();
	if(!isdefined(level.zombie_weapons))
	{
		level.zombie_weapons = [];
	}
	if(!isdefined(level.zombie_weapons_upgraded))
	{
		level.zombie_weapons_upgraded = [];
	}
	level.zombie_weapons_upgraded[level.var_91db5510] = level.var_bfa36368;
	struct.weapon = level.var_bfa36368;
	struct.upgrade = level.var_91db5510;
	struct.weapon_classname = "weapon_rayzorback_zm";
	struct.hint = "";
	struct.cost = 10000;
	struct.vox = "wpck_ray";
	struct.vox_response = undefined;
	struct.is_wonder_weapon = 1;
	struct.force_attachments = [];
	struct.is_in_box = level.zombie_include_weapons[level.var_bfa36368];
	struct.ammo_cost = 10000;
	level.zombie_weapons[level.var_bfa36368] = struct;
	AAT::register_aat_exemption(level.var_bfa36368);
	return;
}

/*
	Name: function_65a65dc
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0x838
	Size: 0xD0
	Parameters: 4
	Flags: None
	Line Number: 123
*/
function function_65a65dc(HIT_LOCATION, hit_origin, player, weapon)
{
	player endon("disconnect");
	if(isdefined(self.var_c8908588) && self.var_c8908588)
	{
		return;
	}
	if(isdefined(self.var_2dce8d67) && self.var_2dce8d67)
	{
		return;
	}
	if(weapon == level.var_d1b744dd)
	{
		self thread function_b675dfb(8, player, 150);
	}
	else if(weapon == level.var_a4b9c7e1)
	{
		self thread function_b675dfb(12, player, 250);
	}
}

/*
	Name: function_b675dfb
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0x910
	Size: 0x50
	Parameters: 3
	Flags: None
	Line Number: 154
*/
function function_b675dfb(var_11afe0bb, attacker, range)
{
	if(var_11afe0bb > 0)
	{
		self thread function_6ba9b580(var_11afe0bb, attacker, range);
		return;
	}
}

/*
	Name: function_6ba9b580
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0x968
	Size: 0x2D8
	Parameters: 3
	Flags: None
	Line Number: 173
*/
function function_6ba9b580(var_11afe0bb, attacker, range)
{
	if(!isdefined(range))
	{
		range = 128;
	}
	if(isdefined(self GetTagOrigin("J_SpineUpper")))
	{
		PlayFXOnTag(level._effect["tesla_shock_secondary"], self, "J_SpineUpper");
	}
	self.zombie_tesla_hit = 1;
	self.tesla_death = 1;
	wait(0.4);
	a_zombies = zombie_utility::get_round_enemy_array();
	a_zombies = util::get_array_of_closest(self.origin, a_zombies, undefined, undefined, range);
	spread = 0;
	for(i = 0; i < a_zombies.size; i++)
	{
		if(isdefined(self.var_2dce8d67) && self.var_2dce8d67)
		{
			continue;
		}
		if(Distance(a_zombies[i].origin, self.origin) < range && !spread && a_zombies[i] != self && (!isdefined(a_zombies[i].zombie_tesla_hit) || !a_zombies[i].zombie_tesla_hit))
		{
			a_zombies[i] thread function_b675dfb(var_11afe0bb - 1, attacker, range);
			level thread function_a087d058(self, a_zombies[i]);
			spread = 1;
		}
	}
	self playsound("zmb_bgb_popshocks_impact");
	wait(0.3);
	self DoDamage(self.health + 666, attacker.origin, attacker, attacker, "MOD_PROJECTILE");
	attacker zm_score::add_to_player_score(60 * level.zombie_vars[attacker.team]["zombie_point_scalar"]);
	scoreevents::processScoreEvent("kill", attacker);
}

/*
	Name: function_a087d058
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0xC48
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 219
*/
function function_a087d058(spawn_pos, target)
{
	fxOrg = spawn("script_model", spawn_pos.origin + VectorScale((0, 0, 1), 32));
	fxOrg SetModel("tag_origin");
	FX = PlayFXOnTag(level._effect["tesla_bolt"], fxOrg, "tag_origin");
	fxOrg moveto(target.origin + VectorScale((0, 0, 1), 32), 0.4);
	wait(0.5);
	fxOrg delete();
	return;
	ERROR: Bad function call
}

/*
	Name: function_cfb64adc
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0xD60
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 241
*/
function function_cfb64adc(mod, weapon)
{
	return weapon == level.var_bfa36368 || weapon == level.var_91db5510 && (mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH");
}

/*
	Name: function_afd9e33c
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0xDB8
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 256
*/
function function_afd9e33c(mod, weapon)
{
	return weapon == level.var_d1b744dd || weapon == level.var_a4b9c7e1 && (mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH");
}

/*
	Name: function_5aaa88da
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0xE10
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 271
*/
function function_5aaa88da()
{
	return isdefined(self.var_5a425982) && self.var_5a425982;
}

/*
	Name: on_player_spawned
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0xE30
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 286
*/
function on_player_spawned()
{
	self thread function_4d3de123();
	self thread function_b9482458();
}

/*
	Name: function_b9482458
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0xE70
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 302
*/
function function_b9482458()
{
	while(1)
	{
		if(self GetCurrentWeapon() == level.var_bfa36368 || self GetCurrentWeapon() == level.var_91db5510)
		{
			self thread zm_equipment::show_hint_text("Press ^3[{+actionslot 3}]^7 For Alt Mode", 3);
			while(self GetCurrentWeapon() == level.var_bfa36368 || self GetCurrentWeapon() == level.var_91db5510 || self GetCurrentWeapon() == level.var_d1b744dd || self GetCurrentWeapon() == level.var_a4b9c7e1)
			{
				wait(0.1);
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_8ea0f48e
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0xF88
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 328
*/
function function_8ea0f48e()
{
	self endon("disconnect");
	self zm_audio::create_and_play_dialog("kill", "tesla");
	wait(3.5);
	level util::clientNotify("TGH");
}

/*
	Name: function_4d3de123
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0xFF0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 346
*/
function function_4d3de123()
{
	self endon("disconnect");
	self endon("death");
	self.var_ffd96d1c = 0;
	for(;;)
	{
		util::wait_network_frame();
		util::wait_network_frame();
		self.var_ffd96d1c = 0;
	}
}

/*
	Name: function_8d846c45
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0x1050
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 369
*/
function function_8d846c45()
{
	if(self function_5aaa88da())
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_c3a4027c
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0x1080
	Size: 0xBC
	Parameters: 13
	Flags: None
	Line Number: 388
*/
function function_c3a4027c(willBeKilled, inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(self function_afd9e33c(meansOfDeath, weapon))
	{
		self thread function_65a65dc(sHitLoc, vPoint, attacker, weapon);
		return 1;
	}
	return 0;
}

