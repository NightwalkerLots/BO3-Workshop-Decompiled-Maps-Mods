#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_368f46a3;

/*
	Name: __init__sytem__
	Namespace: namespace_368f46a3
	Checksum: 0x630EE6C5
	Offset: 0x4F0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 41
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_blundersplat", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_368f46a3
	Checksum: 0xD4B961E6
	Offset: 0x530
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function __init__()
{
	callback::on_spawned(&function_cc3f1e76);
	zm::register_player_damage_callback(&function_e1526b51);
	zm_spawner::register_zombie_damage_callback(&function_6e15afa8);
}

/*
	Name: function_cc3f1e76
	Namespace: namespace_368f46a3
	Checksum: 0xF648C41
	Offset: 0x5A0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function function_cc3f1e76()
{
	self thread function_d5fea532();
	return;
	continue;
}

/*
	Name: function_d5fea532
	Namespace: namespace_368f46a3
	Checksum: 0xF20BFF1F
	Offset: 0x5C8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function function_d5fea532()
{
	self endon("death_or_disconnect");
	self notify("hash_d5fea532");
	self endon("hash_d5fea532");
	for(;;)
	{
		self waittill("weapon_fired", str_weapon);
		if(str_weapon.name == "t6_shotgun_acidgat" || str_weapon.name == "t6_shotgun_acidgat_upgraded")
		{
			for(i = 0; i < 3; i++)
			{
				self function_209913ae(str_weapon.name == "t6_shotgun_acidgat_upgraded");
			}
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_209913ae
	Namespace: namespace_368f46a3
	Checksum: 0xFA9FEDCE
	Offset: 0x6A8
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 120
*/
function function_209913ae(var_2826b50)
{
	if(isdefined(var_2826b50) && var_2826b50)
	{
		continue;
	}
	n_fuse_timer = RandomFloatRange(1, 2.5);
	v_player_angles = VectorToAngles(self GetWeaponForwardDir());
	v_player_angles = function_c74f90a0(v_player_angles);
	v_shot_start = self GetWeaponMuzzlePoint();
	v_shot_end = v_shot_start + AnglesToForward(v_player_angles) * 10000;
	e_dart = self function_a2d9c5b2(GetWeapon("t6_shotgun_acidgat_bullet"), v_shot_start, v_shot_end, self);
	e_dart thread function_4a9f57f2(n_fuse_timer, var_2826b50);
}

/*
	Name: function_4a9f57f2
	Namespace: namespace_368f46a3
	Checksum: 0x9C332F45
	Offset: 0x810
	Size: 0x208
	Parameters: 2
	Flags: None
	Line Number: 145
*/
function function_4a9f57f2(n_fuse_timer, var_2826b50)
{
	if(!isdefined(n_fuse_timer))
	{
		n_fuse_timer = RandomFloatRange(1, 1.5);
	}
	self util::waittill_any("grenade_bounce", "stationary", "death", "explode");
	a_grenades = GetEntArray("grenade", "classname");
	_a375 = a_grenades;
	for(_k375 = getFirstArrayKey(_a375); isdefined(_k375); _k375 = getFirstArrayKey(_a375))
	{
		e_grenade = _a375[_k375];
		if(isdefined(e_grenade.model) && e_grenade.model == "t6_wpn_zmb_projectile_blundergat" && !isdefined(e_grenade.fuse_reset))
		{
			e_grenade.fuse_reset = 1;
			e_grenade.fuse_time = n_fuse_timer;
			e_grenade ResetMissileDetonationTime(n_fuse_timer);
			if(isdefined(var_2826b50) && var_2826b50)
			{
				e_grenade zm_utility::create_zombie_point_of_interest(500, 10, 10000);
				continue;
			}
			e_grenade zm_utility::create_zombie_point_of_interest(250, 5, 10000);
			return;
		}
	}
}

/*
	Name: function_e1526b51
	Namespace: namespace_368f46a3
	Checksum: 0x8A68D9BB
	Offset: 0xA20
	Size: 0x90
	Parameters: 11
	Flags: None
	Line Number: 183
*/
function function_e1526b51(e_inflictor, e_attacker, n_damage, var_fe41cdb2, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_bb4cbbbb, var_22b92c8f)
{
	if(isdefined(w_weapon) && w_weapon.name == "t6_shotgun_acidgat_bullet")
	{
		return 10;
	}
	return -1;
}

/*
	Name: function_6e15afa8
	Namespace: namespace_368f46a3
	Checksum: 0x9FC346A4
	Offset: 0xAB8
	Size: 0x218
	Parameters: 13
	Flags: None
	Line Number: 202
*/
function function_6e15afa8(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, var_504aa06c, str_tag_name, str_model_name, str_part_name, var_df862ae6, e_inflictor, n_chargeLevel)
{
	if(w_weapon.name == "t6_shotgun_acidgat_bullet")
	{
		if(!isdefined(self.var_8ddc8a7))
		{
			a_grenades = GetEntArray("grenade", "classname");
			if(!isdefined(a_grenades) || a_grenades.size <= 0)
			{
				return 0;
			}
			self.var_8ddc8a7 = 1;
			_a66 = a_grenades;
			for(_k66 = getFirstArrayKey(_a66); isdefined(_k66); _k66 = getFirstArrayKey(_a66))
			{
				e_grenade = _a66[_k66];
				if(isdefined(e_grenade.model) && e_grenade.model == "t6_wpn_zmb_projectile_blundergat")
				{
					if(e_grenade islinkedto(self))
					{
						e_grenade.fuse_time = 3;
						n_fuse_timer = e_grenade.fuse_time;
						e_grenade thread function_f7ebbbda(self);
					}
				}
			}
			self thread function_e4b3ae76(n_fuse_timer, e_inflictor);
		}
	}
	return 0;
}

/*
	Name: function_f7ebbbda
	Namespace: namespace_368f46a3
	Checksum: 0xD4278032
	Offset: 0xCD8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 244
*/
function function_f7ebbbda(e_target)
{
	self endon("death");
	e_target endon("hash_e09e6edf");
	e_target waittill("hash_85b82625");
	self.fuse_reset = 1;
	self ResetMissileDetonationTime(0.05);
}

/*
	Name: function_e4b3ae76
	Namespace: namespace_368f46a3
	Checksum: 0xD0646753
	Offset: 0xD40
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 263
*/
function function_e4b3ae76(n_fuse_timer, e_inflictor)
{
	self endon("death");
	self endon("hash_e09e6edf");
	self thread function_e09e6edf(n_fuse_timer);
	self thread function_d136799f(e_inflictor);
	self thread function_e279a694();
	wait(n_fuse_timer);
	self notify("killed_by_a_blundersplat");
	self DoDamage(self.health + 666, self.origin);
}

/*
	Name: function_e09e6edf
	Namespace: namespace_368f46a3
	Checksum: 0x2DE4A71
	Offset: 0xDF8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 285
*/
function function_e09e6edf(n_fuse_timer)
{
	self endon("death");
	self endon("hash_85b82625");
	wait(n_fuse_timer);
	self notify("hash_e09e6edf");
}

/*
	Name: function_d136799f
	Namespace: namespace_368f46a3
	Checksum: 0xD893BB35
	Offset: 0xE38
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 303
*/
function function_d136799f(inflictor)
{
	self endon("hash_85b82625");
	self waittill("death");
	self notify("killed_by_a_blundersplat");
	self notify("hash_85b82625");
}

/*
	Name: function_c74f90a0
	Namespace: namespace_368f46a3
	Checksum: 0xFCC03A78
	Offset: 0xE80
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 321
*/
function function_c74f90a0(v_angles)
{
	n_x = v_angles[0] - 5 + RandomInt(10);
	n_y = v_angles[1] - 5 + RandomInt(10);
	n_z = v_angles[2] - 5 + RandomInt(10);
	return (n_x, n_y, n_z);
}

/*
	Name: function_e279a694
	Namespace: namespace_368f46a3
	Checksum: 0xDF4D6BD
	Offset: 0xF48
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 339
*/
function function_e279a694()
{
	self endon("death");
	while(isdefined(self))
	{
		var_408ae76a = self GetGroundEnt();
		if(isdefined(var_408ae76a) && (!(isdefined(var_408ae76a.classname == "worldspawn") && var_408ae76a.classname == "worldspawn")))
		{
			self LinkTo(var_408ae76a);
		}
		if(!(isdefined(self.missingLegs) && self.missingLegs))
		{
			anim_to_play = Array("ai_zombie_acid_stun_a", "ai_zombie_acid_stun_b", "ai_zombie_acid_stun_c", "ai_zombie_acid_stun_d", "ai_zombie_acid_stun_e")[RandomInt(5)];
			self AnimScripted(anim_to_play, self.origin, self.angles, anim_to_play);
			wait(getanimlength(anim_to_play));
		}
		wait(0.05);
	}
}

