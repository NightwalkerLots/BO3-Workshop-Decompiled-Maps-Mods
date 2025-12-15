#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
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

#namespace namespace_88fb8d29;

/*
	Name: __init__sytem__
	Namespace: namespace_88fb8d29
	Checksum: 0xA32B5E74
	Offset: 0x740
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_slipgun", &__init__, &__main__, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_88fb8d29
	Checksum: 0x774F84B9
	Offset: 0x788
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function __init__()
{
	clientfield::register("scriptmover", "slipgun_spot_active", 1, 1, "int");
	zombie_utility::set_zombie_var("slipgun_reslip_max_spots", 8);
	zombie_utility::set_zombie_var("slipgun_reslip_rate", 6);
	zombie_utility::set_zombie_var("slipgun_max_kill_chain_depth", 16);
	zombie_utility::set_zombie_var("slipgun_max_kill_round", 100);
	zombie_utility::set_zombie_var("slipgun_chain_radius", 120);
	zombie_utility::set_zombie_var("slipgun_chain_wait_min", 0.75);
	zombie_utility::set_zombie_var("slipgun_chain_wait_max", 1.5);
	level.var_1a66810f = 0;
	level.var_de34c22d = 0;
	callback::on_spawned(&function_12468fe8);
	zm_spawner::register_zombie_damage_callback(&slipgun_zombie_damage_response);
	zm_spawner::register_zombie_death_event_callback(&slipgun_zombie_death_response);
}

/*
	Name: __main__
	Namespace: namespace_88fb8d29
	Checksum: 0x20D81128
	Offset: 0x920
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 83
*/
function __main__()
{
	level.var_88adebc8 = function_b5a2ce63(level.zombie_vars["slipgun_max_kill_round"]);
	level.var_1d815c39 = "MOD_PROJECTILE_SPLASH";
}

/*
	Name: function_b5a2ce63
	Namespace: namespace_88fb8d29
	Checksum: 0xA9B75403
	Offset: 0x970
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 99
*/
function function_b5a2ce63(var_1169a494)
{
	var_e92533af = level.zombie_vars["zombie_health_start"];
	for(i = 2; i <= var_1169a494; i++)
	{
		if(i >= 10)
		{
			var_c755f7e8 = var_e92533af;
			var_e92533af = var_e92533af + Int(var_e92533af * level.zombie_vars["zombie_health_increase_multiplier"]);
			if(var_e92533af < var_c755f7e8)
			{
				return var_c755f7e8;
				continue;
			}
		}
		var_e92533af = Int(var_e92533af + level.zombie_vars["zombie_health_increase"]);
	}
	return var_e92533af;
}

/*
	Name: function_12468fe8
	Namespace: namespace_88fb8d29
	Checksum: 0xDB41D30A
	Offset: 0xA68
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 129
*/
function function_12468fe8()
{
	self thread function_17a8b858();
	return;
}

/*
	Name: function_17a8b858
	Namespace: namespace_88fb8d29
	Checksum: 0x860BD155
	Offset: 0xA90
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 145
*/
function function_17a8b858()
{
	self endon("death_or_disconnect");
	self notify("hash_17a8b858");
	self endon("hash_17a8b858");
	for(;;)
	{
		self waittill("grenade_fire", e_grenade, w_weapon);
		switch(w_weapon.name)
		{
			case "t6_slipgun":
			{
				e_grenade thread function_d7814353(self, 0);
				break;
				break;
			}
			case "t6_slipgun_upgraded":
			{
				e_grenade thread function_d7814353(self, 1);
				break;
				break;
			}
		}
	}
}

/*
	Name: function_d7814353
	Namespace: namespace_88fb8d29
	Checksum: 0x5C8AF20B
	Offset: 0xB60
	Size: 0xE8
	Parameters: 2
	Flags: None
	Line Number: 181
*/
function function_d7814353(e_player, var_2826b50)
{
	v_start_pos = e_player GetWeaponMuzzlePoint();
	self util::waittill_any("grenade_bounce", "stationary", "death", "explode");
	if(isdefined(var_2826b50) && var_2826b50)
	{
		continue;
	}
	n_duration = 24;
	if(!isdefined(self))
	{
		v_origin = v_start_pos;
		continue;
	}
	v_origin = self.origin;
	thread function_ed871ee9(self.origin, n_duration, v_start_pos);
}

/*
	Name: function_ed871ee9
	Namespace: namespace_88fb8d29
	Checksum: 0xDB1DF7C1
	Offset: 0xC50
	Size: 0x478
	Parameters: 3
	Flags: None
	Line Number: 209
*/
function function_ed871ee9(v_origin, n_duration, v_start_pos)
{
	wait(0.5);
	if(!isdefined(v_origin) && !isdefined(v_start_pos))
	{
		return;
	}
	playsoundatposition("wpn_slipgun_splash", v_origin);
	GROUND = playerphysicstrace(v_origin + VectorScale((0, 0, 1), 80), v_origin - VectorScale((0, 0, 1), 1000));
	level.var_1a66810f++;
	thread function_bc5317dc(GROUND, n_duration);
	if(!isdefined(level.var_a0366967))
	{
		level.var_a0366967 = [];
	}
	level.var_a0366967[level.var_a0366967.size] = v_origin;
	n_radius = 60;
	n_height = 48;
	n_lifetime = n_duration;
	n_radius_sq = n_radius * n_radius;
	while(n_lifetime > 0)
	{
		var_ecafbab3 = n_lifetime;
		_a612 = GetPlayers();
		for(_k612 = getFirstArrayKey(_a612); isdefined(_k612); _k612 = getFirstArrayKey(_a612))
		{
			e_player = _a612[_k612];
			if(Distance2DSquared(e_player.origin, GROUND) < n_radius_sq && e_player function_6ad90def())
			{
				should_be_slick = Abs(e_player.origin[2] - GROUND[2]) < n_height;
				if(should_be_slick)
				{
					e_player function_d2b2bce9(GROUND, n_radius_sq);
				}
			}
			n_lifetime = function_3c08260c(n_lifetime);
		}
		zombies = zombie_utility::get_round_enemy_array();
		if(isdefined(zombies))
		{
			_a645 = zombies;
			for(_k645 = getFirstArrayKey(_a645); isdefined(_k645); _k645 = getFirstArrayKey(_a645))
			{
				e_zombie = _a645[_k645];
				if(isdefined(e_zombie))
				{
					if(Distance2DSquared(e_zombie.origin, GROUND) < n_radius_sq && e_zombie function_4d1b11f0())
					{
						should_be_slick = Abs(e_zombie.origin[2] - GROUND[2]) < n_height;
						if(should_be_slick)
						{
							e_zombie function_22df7c16();
						}
					}
					n_lifetime = function_3c08260c(n_lifetime);
				}
			}
		}
		else if(var_ecafbab3 == n_lifetime)
		{
			n_lifetime = n_lifetime - 0.05;
			wait(0.05);
		}
	}
	ArrayRemoveValue(level.var_a0366967, v_origin, 0);
	level.var_1a66810f--;
}

/*
	Name: function_3c08260c
	Namespace: namespace_88fb8d29
	Checksum: 0x35636746
	Offset: 0x10D0
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 287
*/
function function_3c08260c(n_lifetime)
{
	level.var_de34c22d++;
	if(level.var_de34c22d >= 32)
	{
		level.var_de34c22d = 0;
		n_lifetime = n_lifetime - 0.05;
		wait(0.05);
	}
	return n_lifetime;
}

/*
	Name: function_bc5317dc
	Namespace: namespace_88fb8d29
	Checksum: 0x6C038870
	Offset: 0x1128
	Size: 0xC0
	Parameters: 2
	Flags: None
	Line Number: 309
*/
function function_bc5317dc(v_origin, n_duration)
{
	var_ca090381 = spawn("script_model", v_origin);
	var_ca090381 SetModel("tag_origin");
	var_ca090381 clientfield::set("slipgun_spot_active", 1);
	wait(n_duration);
	var_ca090381 clientfield::set("slipgun_spot_active", 0);
	var_ca090381 delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_6ad90def
	Namespace: namespace_88fb8d29
	Checksum: 0x5CDE5636
	Offset: 0x11F0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 331
*/
function function_6ad90def()
{
	if(self laststand::player_is_in_laststand() || (isdefined(self.intermission) && self.intermission))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_4d1b11f0
	Namespace: namespace_88fb8d29
	Checksum: 0x1B5B1A8F
	Offset: 0x1238
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 350
*/
function function_4d1b11f0()
{
	if(!(isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area))
	{
		return 0;
	}
	if(isdefined(self.barricade_enter) && self.barricade_enter)
	{
		return 0;
	}
	if(isdefined(self.in_the_ground) && self.in_the_ground)
	{
		return 0;
	}
	if(isdefined(self.is_traversing) && self.is_traversing)
	{
		return 0;
	}
	if(!isdefined(self.ai_state) || self.ai_state != "zombie_think")
	{
		return 0;
	}
	if(isdefined(self.is_leaping) && self.is_leaping)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_d2b2bce9
	Namespace: namespace_88fb8d29
	Checksum: 0x85920724
	Offset: 0x1300
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 389
*/
function function_d2b2bce9(origin, radius)
{
	if(isdefined(self))
	{
		self thread function_9eff4eed(origin, radius);
	}
}

/*
	Name: function_9eff4eed
	Namespace: namespace_88fb8d29
	Checksum: 0x34CB9851
	Offset: 0x1348
	Size: 0xA8
	Parameters: 2
	Flags: None
	Line Number: 407
*/
function function_9eff4eed(v_origin, n_radius)
{
	if(isdefined(self.var_40384bfe) && self.var_40384bfe)
	{
		return;
	}
	self.var_40384bfe = 1;
	self forceslick(1);
	while(Distance2DSquared(self.origin, v_origin) < n_radius)
	{
		wait(0.05);
	}
	self forceslick(0);
	self.var_40384bfe = undefined;
}

/*
	Name: function_22df7c16
	Namespace: namespace_88fb8d29
	Checksum: 0xF0D58AED
	Offset: 0x13F8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 433
*/
function function_22df7c16()
{
	if(isdefined(self))
	{
		self thread function_7994e088();
	}
}

/*
	Name: function_7994e088
	Namespace: namespace_88fb8d29
	Checksum: 0xC3B5CD07
	Offset: 0x1428
	Size: 0x288
	Parameters: 0
	Flags: None
	Line Number: 451
*/
function function_7994e088()
{
	self endon("death");
	if(isdefined(self.var_40384bfe) && self.var_40384bfe)
	{
		return;
	}
	self.var_40384bfe = 1;
	if(isdefined(self.missingLegs) && self.missingLegs)
	{
		Int = RandomInt(2);
		if(Int)
		{
			var_76595b9f = "ai_zombie_crawl_slipslide_recover";
			continue;
		}
		var_76595b9f = "ai_zombie_crawl_slipslide_slow";
		if(self.zombie_move_speed == "sprint" || self.zombie_move_speed == "run")
		{
			var_76595b9f = "ai_zombie_crawl_slipslide_fast";
			continue;
		}
	}
	Int = RandomInt(2);
	if(Int)
	{
		var_76595b9f = "ai_zombie_stand_slipslide_recover";
		continue;
	}
	Int = RandomInt(2);
	if(Int)
	{
		var_76595b9f = "ai_zombie_slipslide_collapse";
		continue;
	}
	Int = RandomInt(2);
	if(self.zombie_move_speed == "sprint")
	{
		if(Int)
		{
			var_76595b9f = "ai_zombie_sprint_slipslide_a";
			continue;
		}
		var_76595b9f = "ai_zombie_sprint_slipslide";
	}
	else if(self.zombie_move_speed == "run")
	{
		if(Int)
		{
			var_76595b9f = "ai_zombie_run_slipslide_a";
			continue;
		}
		var_76595b9f = "ai_zombie_run_slipslide";
	}
	else if(Int)
	{
		var_76595b9f = "ai_zombie_walk_slipslide_a";
		continue;
	}
	var_76595b9f = "ai_zombie_walk_slipslide";
	if(!self MayMoveFromPointToPoint(self.origin, self zombie_utility::getAnimEndPos(var_76595b9f)))
	{
		var_76595b9f = "ai_zombie_slipslide_collapse";
	}
	self AnimScripted(var_76595b9f, self.origin, self.angles, var_76595b9f);
	wait(getanimlength(var_76595b9f));
	if(!isdefined(self))
	{
		return;
	}
	self.var_40384bfe = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: slipgun_zombie_damage_response
	Namespace: namespace_88fb8d29
	Checksum: 0xF54E6008
	Offset: 0x16B8
	Size: 0x110
	Parameters: 13
	Flags: None
	Line Number: 536
*/
function slipgun_zombie_damage_response(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, var_504aa06c, str_tag_name, str_model_name, str_part_name, var_df862ae6, e_inflictor, n_chargeLevel)
{
	if(!self is_slipgun_damage(str_mod, w_weapon))
	{
		return 0;
	}
	self playsound("wpn_slipgun_zombie_impact");
	var_2826b50 = w_weapon.name == "t6_slipgun_upgraded";
	self thread slipgun_zombie_1st_hit_response(w_weapon, e_player);
	playsoundatposition("wpn_slipgun_zombie_impact", self.origin);
	return 1;
}

/*
	Name: slipgun_zombie_1st_hit_response
	Namespace: namespace_88fb8d29
	Checksum: 0x7DC7BEB3
	Offset: 0x17D0
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 559
*/
function slipgun_zombie_1st_hit_response(w_weapon, e_player)
{
	self notify("stop_find_flesh");
	self notify("zombie_acquire_enemy");
	self OrientMode("face default");
	self.ignoreall = 1;
	self.gibbed = 1;
	if(isalive(self))
	{
		if(!isdefined(self.var_c5ee74e9))
		{
			self.var_c5ee74e9 = 0;
		}
		if(self.health > 0)
		{
			if(e_player zm_powerups::is_insta_kill_active())
			{
				self.health = 1;
			}
			self DoDamage(level.var_88adebc8, self.origin, e_player, e_player, "none", level.var_1d815c39, 0, w_weapon);
		}
	}
}

/*
	Name: is_slipgun_damage
	Namespace: namespace_88fb8d29
	Checksum: 0x6E1A03FC
	Offset: 0x18E8
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 593
*/
function is_slipgun_damage(str_mod, w_weapon)
{
	if(isdefined(w_weapon) && isdefined(w_weapon.name) && (w_weapon.name == "t6_slipgun" || w_weapon.name == "t6_slipgun_upgraded"))
	{
		return 1;
	}
	return 0;
}

/*
	Name: slipgun_zombie_death_response
	Namespace: namespace_88fb8d29
	Checksum: 0x87B3074D
	Offset: 0x1960
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 612
*/
function slipgun_zombie_death_response(e_attacker)
{
	if(!self is_slipgun_damage(self.damageMod, self.damageWeapon))
	{
		return 0;
	}
	self function_be73e162(self.attacker, 0, self.damageWeapon);
	return 1;
}

/*
	Name: function_be73e162
	Namespace: namespace_88fb8d29
	Checksum: 0xF4829AAC
	Offset: 0x19C8
	Size: 0x148
	Parameters: 3
	Flags: None
	Line Number: 632
*/
function function_be73e162(e_player, var_1d427c1d, w_weapon)
{
	if(isdefined(self.marked_for_insta_upgraded_death))
	{
		return;
	}
	if(isdefined(self.isdog) && self.isdog)
	{
		continue;
	}
	str_tag = "j_spinelower";
	self playsound("wpn_slipgun_zombie_explode");
	playFX("harry/sliquifier/fx_sliquifier_explode", self GetTagOrigin(str_tag));
	if(!(isdefined(self.isdog) && self.isdog))
	{
		wait(0.1);
	}
	self ghost();
	if(!isdefined(self.var_c5ee74e9))
	{
		self.var_c5ee74e9 = var_1d427c1d;
	}
	level thread function_18b36de0(e_player, self.origin, level.zombie_vars["slipgun_chain_radius"], self.var_c5ee74e9, w_weapon);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_18b36de0
	Namespace: namespace_88fb8d29
	Checksum: 0x5623C2A4
	Offset: 0x1B18
	Size: 0x2EE
	Parameters: 5
	Flags: None
	Line Number: 669
*/
function function_18b36de0(e_player, v_origin, n_radius, var_1d427c1d, w_weapon)
{
	n_radius_squared = n_radius * n_radius;
	a_enemies = zombie_utility::get_round_enemy_array();
	a_enemies = util::get_array_of_closest(v_origin, a_enemies);
	for(i = 0; i < a_enemies.size; i++)
	{
		v_trace = playerphysicstrace(v_origin, a_enemies[i] GetTagOrigin("j_head"));
		if(v_trace != a_enemies[i] GetTagOrigin("j_head"))
		{
			continue;
		}
		if(isalive(a_enemies[i]) && DistanceSquared(a_enemies[i].origin, v_origin) < n_radius_squared)
		{
			a_enemies[i].slipgun_sizzle = PlayFXOnTag("harry/sliquifier/fx_sliquifier_sizzle", a_enemies[i], "j_head");
		}
		wait(RandomFloatRange(level.zombie_vars["slipgun_chain_wait_min"], level.zombie_vars["slipgun_chain_wait_max"]));
		if(isalive(a_enemies[i]) && DistanceSquared(a_enemies[i].origin, v_origin) < n_radius_squared)
		{
			if(e_player zm_powerups::is_insta_kill_active())
			{
				a_enemies[i].health = 1;
			}
			a_enemies[i] DoDamage(level.var_88adebc8, v_origin, e_player, e_player, "none", level.var_1d815c39, 0, w_weapon);
			if(level.var_1a66810f < level.zombie_vars["slipgun_reslip_max_spots"])
			{
				thread function_ed871ee9(a_enemies[i].origin, 24, v_origin);
			}
		}
	}
}

