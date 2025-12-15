#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_elemental_bow;
#include scripts\zm\_zm_weapons;

#namespace namespace_156ea490;

/*
	Name: __init__sytem__
	Namespace: namespace_156ea490
	Checksum: 0xEAE157E2
	Offset: 0x540
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 34
*/
function autoexec __init__sytem__()
{
	system::register("_zm_weap_elemental_bow_storm", &__init__, &__main__, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_156ea490
	Checksum: 0x239765C8
	Offset: 0x588
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function __init__()
{
	level.var_16e90d5f = GetWeapon("elemental_bow_storm");
	level.var_432d1b3a = GetWeapon("elemental_bow_storm4");
	clientfield::register("toplayer", "elemental_bow_storm" + "_ambient_bow_fx", 1, 1, "int");
	clientfield::register("missile", "elemental_bow_storm" + "_arrow_impact_fx", 1, 1, "int");
	clientfield::register("missile", "elemental_bow_storm4" + "_arrow_impact_fx", 1, 1, "int");
	clientfield::register("scriptmover", "elem_storm_fx", 1, 1, "int");
	clientfield::register("toplayer", "elem_storm_whirlwind_rumble", 1, 1, "int");
	clientfield::register("scriptmover", "elem_storm_bolt_fx", 1, 1, "int");
	clientfield::register("scriptmover", "elem_storm_zap_ambient", 1, 1, "int");
	clientfield::register("actor", "elem_storm_shock_fx", 1, 2, "int");
	callback::on_connect(&function_d1a92fba);
	return;
	ERROR: Bad function call
}

/*
	Name: __main__
	Namespace: namespace_156ea490
	Checksum: 0x9ACF73B8
	Offset: 0x790
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function __main__()
{
}

/*
	Name: function_d1a92fba
	Namespace: namespace_156ea490
	Checksum: 0x4E8CBD1B
	Offset: 0x7A0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function function_d1a92fba()
{
	self thread zm_weap_elemental_bow::function_59d385a8("elemental_bow_storm");
	self thread zm_weap_elemental_bow::function_1160e0e9("elemental_bow_storm", "elemental_bow_storm4");
	self thread zm_weap_elemental_bow::function_a991479f("elemental_bow_storm", "elemental_bow_storm4", &function_3a521bda);
}

/*
	Name: function_3a521bda
	Namespace: namespace_156ea490
	Checksum: 0xC180E34C
	Offset: 0x828
	Size: 0x180
	Parameters: 5
	Flags: None
	Line Number: 109
*/
function function_3a521bda(weapon, v_position, radius, attacker, normal)
{
	self.var_85348a4a = &function_fe228973;
	if(IsSubStr(weapon.name, "elemental_bow_storm4"))
	{
		var_9df1d108 = self zm_weap_elemental_bow::function_665a02cd(v_position, weapon.name, attacker, 64, self.var_85348a4a);
		if(isdefined(var_9df1d108))
		{
			continue;
		}
		v_position = v_position;
		self thread function_66347976(v_position + VectorScale((0, 0, 1), 48));
		continue;
	}
	var_9df1d108 = self zm_weap_elemental_bow::function_665a02cd(v_position, weapon.name, attacker, 32, self.var_85348a4a);
	if(isdefined(var_9df1d108))
	{
		continue;
	}
	v_position = v_position;
	self thread function_3e6925b8(v_position + VectorScale((0, 0, 1), 32), 3.6, attacker, 0);
	return;
	var_9df1d108 waittillmatch(var_9df1d108ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_3e6925b8
	Namespace: namespace_156ea490
	Checksum: 0x76B7358C
	Offset: 0x9B0
	Size: 0x5D0
	Parameters: 4
	Flags: None
	Line Number: 145
*/
function function_3e6925b8(v_hit_pos, var_2149e2af, var_87e73bac, var_faec5e37)
{
	zombie_utility::set_zombie_var("tesla_head_gib_chance", 75);
	if(var_faec5e37)
	{
		continue;
	}
	var_e2213bbd = 1;
	if(!(isdefined(var_faec5e37) && var_faec5e37))
	{
		var_87e73bac = util::spawn_model("tag_origin", v_hit_pos);
		var_87e73bac.var_1dcdd471 = 1;
		var_87e73bac.var_70338414 = 1;
	}
	if(!isdefined(var_87e73bac.var_70e3ceac))
	{
		var_87e73bac.var_70e3ceac = [];
		for(i = 0; i < var_e2213bbd; i++)
		{
			var_87e73bac.var_70e3ceac[i] = util::spawn_model("tag_origin", var_87e73bac.origin);
			util::wait_network_frame();
		}
	}
	foreach(var_12bee559 in var_87e73bac.var_70e3ceac)
	{
		var_12bee559.var_537d7e50 = 0;
	}
	var_87e73bac.n_lifetime = var_2149e2af;
	var_9bcd1ee9 = var_2149e2af + 1;
	var_a607b5b9 = 160;
	var_20901b43 = 0.6;
	if(var_faec5e37)
	{
		var_a607b5b9 = 320;
		var_20901b43 = 0.233;
	}
	if(!(isdefined(var_faec5e37) && var_faec5e37))
	{
		var_87e73bac clientfield::set("elem_storm_zap_ambient", 1);
	}
	while(var_87e73bac.n_lifetime > 0 && (isdefined(var_87e73bac.var_1dcdd471) && var_87e73bac.var_1dcdd471))
	{
		if(var_87e73bac.n_lifetime < var_9bcd1ee9)
		{
			var_cdc375a3 = undefined;
			var_cdc375a3 = var_87e73bac function_fb34c210();
			if(isdefined(var_cdc375a3))
			{
				var_f2460d2b = var_87e73bac function_396f13ed(var_a607b5b9, self);
				foreach(ai_enemy in var_f2460d2b)
				{
					if(BulletTracePassed(ai_enemy GetCentroid(), var_87e73bac.origin, 0, var_87e73bac))
					{
						ai_enemy thread function_1c24ffd0(self, var_87e73bac, var_cdc375a3, var_faec5e37);
						break;
					}
				}
			}
			var_9bcd1ee9 = var_87e73bac.n_lifetime - var_20901b43;
		}
		wait(0.05);
		var_87e73bac.n_lifetime = var_87e73bac.n_lifetime - 0.05;
	}
	if(!(isdefined(var_faec5e37) && var_faec5e37))
	{
		var_87e73bac clientfield::set("elem_storm_zap_ambient", 0);
	}
	if(isdefined(var_87e73bac.var_70338414) && var_87e73bac.var_70338414)
	{
		util::wait_network_frame();
		var_87e73bac delete();
		Array::run_all(var_87e73bac.var_70e3ceac, &delete);
		if(isdefined(var_87e73bac.var_8d5a356a))
		{
			var_87e73bac.var_8d5a356a delete();
			continue;
		}
	}
	foreach(var_12bee559 in var_87e73bac.var_70e3ceac)
	{
		var_12bee559 clientfield::set("elem_storm_bolt_fx", 0);
	}
	return;
}

/*
	Name: function_396f13ed
	Namespace: namespace_156ea490
	Checksum: 0xDD5EFA0C
	Offset: 0xF88
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 240
*/
function function_396f13ed(var_a607b5b9, e_player)
{
	a_ai_enemies = GetAITeamArray(level.zombie_team);
	var_f2460d2b = Array::get_all_closest(self.origin, a_ai_enemies, undefined, undefined, var_a607b5b9);
	if(zm_utility::is_player_valid(e_player))
	{
		var_f2460d2b = Array::get_all_closest(e_player.origin, var_f2460d2b);
	}
	var_f2460d2b = Array::filter(var_f2460d2b, 0, &zm_weap_elemental_bow::function_69533776);
	var_f2460d2b = Array::filter(var_f2460d2b, 0, &function_e6306ce3);
	return var_f2460d2b;
}

/*
	Name: function_e6306ce3
	Namespace: namespace_156ea490
	Checksum: 0x6A2E5043
	Offset: 0x10A0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 263
*/
function function_e6306ce3(ai_enemy)
{
	return !(isdefined(ai_enemy.var_7d7de9) && ai_enemy.var_7d7de9);
}

/*
	Name: function_fb34c210
	Namespace: namespace_156ea490
	Checksum: 0x87B35566
	Offset: 0x10D8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 278
*/
function function_fb34c210()
{
	foreach(var_12bee559 in self.var_70e3ceac)
	{
		if(isdefined(var_12bee559) && isdefined(var_12bee559.var_537d7e50) && !var_12bee559.var_537d7e50)
		{
			return var_12bee559;
		}
	}
	return undefined;
}

/*
	Name: function_1c24ffd0
	Namespace: namespace_156ea490
	Checksum: 0xB35AB414
	Offset: 0x1190
	Size: 0x488
	Parameters: 4
	Flags: None
	Line Number: 300
*/
function function_1c24ffd0(e_player, var_87e73bac, var_12bee559, var_faec5e37)
{
	if(var_faec5e37)
	{
		var_f4766248 = var_87e73bac.origin + (0, 0, randomIntRange(0, 96));
		continue;
	}
	var_f4766248 = var_87e73bac.origin;
	self.var_7d7de9 = 1;
	var_12bee559.var_537d7e50 = 1;
	var_9790501e = 0;
	var_12bee559.origin = var_f4766248;
	var_6b6664ec = var_f4766248;
	var_7b8f547c = self GetCentroid();
	var_73e0c3f = VectorNormalize(var_7b8f547c - var_6b6664ec);
	var_98d81436 = VectorToAngles(var_73e0c3f);
	var_98d81436 = (var_98d81436[0], var_98d81436[1], RandomInt(360));
	var_12bee559.angles = var_98d81436;
	var_12bee559 LinkTo(var_87e73bac);
	wait(0.05);
	var_12bee559 clientfield::set("elem_storm_bolt_fx", 1);
	wait(0.2);
	if(isdefined(self) && isalive(self))
	{
		if(self.archetype === "mechz")
		{
			var_884914fb = level.mechz_health;
			if(var_faec5e37)
			{
				continue;
			}
			var_218b8ebf = 0.01;
			n_damage = var_884914fb * var_218b8ebf / 0.2;
			str_damage_mod = "MOD_PROJECTILE_SPLASH";
			var_efa4c306 = self.health / 0.2;
			continue;
		}
		n_damage = 4782;
		str_damage_mod = "MOD_UNKNOWN";
		var_efa4c306 = self.health;
		var_2503c8aa = 0;
		if(isdefined(e_player) && (isdefined(level.zombie_vars[e_player.team]["zombie_insta_kill"]) && level.zombie_vars[e_player.team]["zombie_insta_kill"]) && self.archetype !== "mechz")
		{
			var_2503c8aa = 1;
		}
		if(var_efa4c306 > n_damage && !var_2503c8aa)
		{
			self DoDamage(n_damage, self.origin, e_player, e_player, undefined, str_damage_mod, 0, level.var_16e90d5f);
			if(var_faec5e37)
			{
				var_9790501e = 1;
				if(self.archetype === "mechz")
				{
					self thread function_b7e77de5(e_player, var_f4766248, var_87e73bac);
					continue;
				}
				self thread function_c6b9951c(e_player, var_f4766248, var_87e73bac);
				continue;
			}
			self.var_7d7de9 = 0;
			continue;
		}
		self thread function_e06f5d99(e_player, var_faec5e37);
	}
	if(var_9790501e)
	{
		wait(2.166);
	}
	var_12bee559 clientfield::set("elem_storm_bolt_fx", 0);
	var_12bee559.var_537d7e50 = 0;
	var_12bee559 Unlink();
}

/*
	Name: function_e06f5d99
	Namespace: namespace_156ea490
	Checksum: 0x2360F39D
	Offset: 0x1620
	Size: 0x2A0
	Parameters: 2
	Flags: None
	Line Number: 383
*/
function function_e06f5d99(e_player, var_faec5e37)
{
	self endon("death");
	n_damage = self.health;
	str_damage_mod = "MOD_UNKNOWN";
	if(var_faec5e37)
	{
		if(self.archetype === "zombie")
		{
			if(zm_weap_elemental_bow::function_69533776(self))
			{
				self SetPlayerCollision(0);
				self.var_a940fc8b = 1;
				self clientfield::set("elem_storm_shock_fx", 2);
				self scene::Play("cin_zm_dlc1_zombie_dth_deathray_0" + randomIntRange(1, 5), self);
				self clientfield::set("elem_storm_shock_fx", 0);
				self.var_a940fc8b = 0;
				if(var_faec5e37)
				{
					self zm_spawner::zombie_explodes_intopieces(0);
				}
			}
		}
		else if(self.archetype === "mechz")
		{
			n_damage = self.health / 0.2;
			str_damage_mod = "MOD_PROJECTILE_SPLASH";
		}
	}
	else if(self.archetype === "zombie")
	{
		self function_33ba03ad(1);
	}
	if(zm_utility::is_player_valid(e_player) && isdefined(e_player.zapped_zombies) && self.archetype === "zombie")
	{
		e_player.zapped_zombies++;
		e_player notify("zombie_zapped");
	}
	if(var_faec5e37)
	{
		continue;
	}
	var_16e90d5f = level.var_16e90d5f;
	self DoDamage(n_damage, self.origin, e_player, e_player, undefined, str_damage_mod, 0, var_16e90d5f);
	self.var_7d7de9 = 0;
	self SetPlayerCollision(1);
	return;
	wait(level.var_432d1b3a);
}

/*
	Name: function_c6b9951c
	Namespace: namespace_156ea490
	Checksum: 0xC0B132E9
	Offset: 0x18C8
	Size: 0xB8
	Parameters: 3
	Flags: None
	Line Number: 443
*/
function function_c6b9951c(e_player, var_8e4b2150, var_87e73bac)
{
	self endon("death");
	var_9bcd1ee9 = 2.166;
	if(var_87e73bac.n_lifetime < 2.166)
	{
		var_9bcd1ee9 = var_87e73bac.n_lifetime;
	}
	if(var_9bcd1ee9 > 0.5)
	{
		self function_33ba03ad(var_9bcd1ee9);
	}
	self function_e06f5d99(e_player, 1);
}

/*
	Name: function_33ba03ad
	Namespace: namespace_156ea490
	Checksum: 0x61A999EB
	Offset: 0x1988
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 468
*/
function function_33ba03ad(n_time)
{
	self endon("death");
	n_counter = 0;
	self clientfield::set("elem_storm_shock_fx", 1);
	while(n_counter < n_time)
	{
		self.zombie_tesla_hit = 1;
		wait(0.2);
		n_counter = n_counter + 0.2;
	}
	self.zombie_tesla_hit = 0;
	self notify("hash_ce6eb8fe");
	self clientfield::set("elem_storm_shock_fx", 0);
}

/*
	Name: function_b7e77de5
	Namespace: namespace_156ea490
	Checksum: 0x2E060D5D
	Offset: 0x1A48
	Size: 0x170
	Parameters: 3
	Flags: None
	Line Number: 494
*/
function function_b7e77de5(e_player, var_8e4b2150, var_87e73bac)
{
	self endon("death");
	if(!(isdefined(self.var_751c4d00) && self.var_751c4d00) && var_87e73bac.n_lifetime > 2.5)
	{
		self.var_a940fc8b = 1;
		self.var_751c4d00 = 1;
		self thread scene::Play("cin_zm_dlc1_mechz_dth_deathray_01", self);
		self thread function_236b3ca5(var_87e73bac);
		self thread function_2bd3ba28(e_player, var_87e73bac);
		util::waittill_any_ents_two(self, "mechz_zap_lift_end", var_87e73bac, "elem_storm_whirlwind_done");
		wait(0.1);
		self scene::stop("cin_zm_dlc1_mechz_dth_deathray_01");
		self.var_7d7de9 = 0;
		self.var_a940fc8b = 0;
		self.var_77c0b8c7 = 1;
		wait(16);
		self.var_77c0b8c7 = 0;
		self.var_751c4d00 = 0;
		continue;
	}
	self.var_7d7de9 = 0;
}

/*
	Name: function_236b3ca5
	Namespace: namespace_156ea490
	Checksum: 0x9B936E78
	Offset: 0x1BC0
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 528
*/
function function_236b3ca5(var_87e73bac)
{
	self endon("death");
	var_87e73bac endon("death");
	var_87e73bac endon("hash_6c60cfc8");
	var_f31351ed = Distance(self.origin, var_87e73bac.origin) + 200;
	if(var_f31351ed > 320)
	{
		continue;
	}
	n_dist = var_f31351ed;
	n_dist_sq = n_dist * n_dist;
	while(1)
	{
		if(DistanceSquared(self.origin, var_87e73bac.origin) > n_dist_sq)
		{
			self notify("hash_b4a49de", 320);
			break;
		}
		wait(0.2);
	}
	return;
}

/*
	Name: function_2bd3ba28
	Namespace: namespace_156ea490
	Checksum: 0x9A9E22E2
	Offset: 0x1CC8
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 562
*/
function function_2bd3ba28(e_player, var_87e73bac)
{
	self endon("death");
	self endon("hash_b4a49de");
	var_87e73bac endon("hash_6c60cfc8");
	if(!isdefined(var_87e73bac.var_8d5a356a))
	{
		var_87e73bac.var_8d5a356a = util::spawn_model("tag_origin", self.origin);
	}
	while(1)
	{
		wait(1.4);
		self thread function_1c24ffd0(e_player, var_87e73bac, var_87e73bac.var_8d5a356a, 1);
	}
}

/*
	Name: function_66347976
	Namespace: namespace_156ea490
	Checksum: 0x1D8BD202
	Offset: 0x1D88
	Size: 0x288
	Parameters: 1
	Flags: None
	Line Number: 588
*/
function function_66347976(v_hit_pos)
{
	if(!isdefined(self.var_a67ccf19))
	{
		self.var_a67ccf19 = [];
		for(i = 0; i < 1; i++)
		{
			self.var_a67ccf19[i] = util::spawn_model("tag_origin", (0, 0, 0), VectorScale((-1, 0, 0), 90));
			self.var_a67ccf19[i].var_1dcdd471 = 0;
			util::wait_network_frame();
		}
	}
	else if(zm_utility::is_player_valid(self))
	{
		var_cdc375a3 = self function_b48b3b01();
		if(isdefined(var_cdc375a3))
		{
			var_cdc375a3.var_1dcdd471 = 1;
			var_cdc375a3.script_int = GetTime();
			var_cdc375a3.var_537da1f1 = 0;
			v_ground_pos = util::ground_position(v_hit_pos, 1000, VectorScale((0, 0, 1), 16)[2]);
			if(v_hit_pos[2] - v_ground_pos[2] < 64)
			{
				var_cdc375a3.origin = v_ground_pos;
				continue;
			}
			var_cdc375a3.origin = v_hit_pos;
			wait(0.05);
			var_cdc375a3 clientfield::set("elem_storm_fx", 1);
			var_cdc375a3 thread function_5eefeada();
			var_cdc375a3 thread function_255aa55a(self);
			var_cdc375a3 thread function_fe8fc906(self);
			var_bc5cda7b = var_cdc375a3 util::waittill_any_timeout(7.8, "elem_storm_whirlwind_force_off");
			var_cdc375a3 clientfield::set("elem_storm_fx", 0);
			var_cdc375a3 notify("hash_6c60cfc8");
			var_cdc375a3.var_1dcdd471 = 0;
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fe8fc906
	Namespace: namespace_156ea490
	Checksum: 0x67DD2479
	Offset: 0x2018
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 640
*/
function function_fe8fc906(e_player)
{
	e_player function_3e6925b8((0, 0, 0), 7.8, self, 1);
}

/*
	Name: function_b48b3b01
	Namespace: namespace_156ea490
	Checksum: 0xF2C2A021
	Offset: 0x2058
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 655
*/
function function_b48b3b01()
{
	for(i = 0; i < self.var_a67ccf19.size; i++)
	{
		if(!(isdefined(self.var_a67ccf19[i].var_1dcdd471) && self.var_a67ccf19[i].var_1dcdd471))
		{
			return self.var_a67ccf19[i];
		}
	}
	var_a67ccf19 = Array::sort_by_script_int(self.var_a67ccf19, 1);
	var_a67ccf19[0] notify("hash_378fa443");
	wait(0.1);
	return var_a67ccf19[0];
}

/*
	Name: function_255aa55a
	Namespace: namespace_156ea490
	Checksum: 0x32523881
	Offset: 0x2128
	Size: 0x4A0
	Parameters: 1
	Flags: None
	Line Number: 680
*/
function function_255aa55a(e_player)
{
	self endon("hash_6c60cfc8");
	while(1)
	{
		v_ground_pos = util::ground_position(self.origin + (0, 0, 1), 1000, VectorScale((0, 0, 1), 16)[2]);
		n_z_diff = Abs(self.origin[2] - v_ground_pos[2]);
		if(n_z_diff > 0)
		{
			n_time = n_z_diff / 256;
			self moveto(v_ground_pos, n_time, n_time * 0.5);
			wait(n_time);
		}
		v_away_from_source = undefined;
		var_f17995b7 = 64;
		a_ai_enemies = self function_396f13ed(768, e_player);
		if(a_ai_enemies.size)
		{
			foreach(ai_enemy in a_ai_enemies)
			{
				if(BulletTracePassed(ai_enemy GetCentroid(), self.origin + VectorScale((0, 0, 1), 12), 0, self))
				{
					var_b5918ba1 = VectorNormalize(ai_enemy.origin - self.origin);
					var_b5918ba1 = (var_b5918ba1[0], var_b5918ba1[1], 0);
					v_away_from_source = var_b5918ba1 * 128;
					break;
				}
			}
		}
		else if(!isdefined(v_away_from_source))
		{
			var_bc711b42 = randomIntRange(-1, 2);
			if(!var_bc711b42)
			{
				if(RandomInt(100) < 50)
				{
					continue;
				}
				var_93877267 = -1;
				continue;
			}
			var_93877267 = randomIntRange(-1, 2);
			v_away_from_source = (128 * var_bc711b42, 128 * var_93877267, 0);
			var_f17995b7 = RandomFloatRange(16, 48);
			var_c3f05669 = self.origin + VectorScale((0, 0, 1), 12);
			a_trace = PhysicsTraceEx(var_c3f05669, var_c3f05669 + v_away_from_source, VectorScale((-1, -1, -1), 24), VectorScale((1, 1, 1), 24), self);
			v_away_from_source = v_away_from_source * a_trace["fraction"];
		}
		n_length = length(v_away_from_source);
		n_time = n_length / var_f17995b7;
		if(n_time < 1)
		{
			continue;
		}
		n_time = n_time;
		v_on_navmesh = GetClosestPointOnNavMesh(self.origin + v_away_from_source, 128, 64);
		if(!isdefined(v_on_navmesh))
		{
			v_on_navmesh = self.origin + v_away_from_source;
			continue;
		}
		v_on_navmesh = v_on_navmesh + VectorScale((0, 0, 1), 16);
		self moveto(v_on_navmesh, n_time, n_time * 0.5);
		wait(n_time);
	}
}

/*
	Name: function_5eefeada
	Namespace: namespace_156ea490
	Checksum: 0x24A6DF8
	Offset: 0x25D0
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 757
*/
function function_5eefeada()
{
	self endon("hash_6c60cfc8");
	while(1)
	{
		foreach(e_player in level.activePlayers)
		{
			if(isdefined(e_player) && (!(isdefined(e_player.var_d663a0db) && e_player.var_d663a0db)))
			{
				if(DistanceSquared(e_player.origin, self.origin) < 16384)
				{
					e_player thread function_637cff3b(self);
				}
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_637cff3b
	Namespace: namespace_156ea490
	Checksum: 0xA68C18E4
	Offset: 0x26E8
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 786
*/
function function_637cff3b(var_cdc375a3)
{
	self endon("disconnect");
	self endon("bled_out");
	self.var_d663a0db = 1;
	self clientfield::set_to_player("elem_storm_whirlwind_rumble", 1);
	while(DistanceSquared(self.origin, var_cdc375a3.origin) < 16384 && (isdefined(var_cdc375a3.var_1dcdd471) && var_cdc375a3.var_1dcdd471))
	{
		wait(0.05);
	}
	self.var_d663a0db = 0;
	self clientfield::set_to_player("elem_storm_whirlwind_rumble", 0);
}

/*
	Name: function_fe228973
	Namespace: namespace_156ea490
	Checksum: 0x74B6DE0B
	Offset: 0x27D8
	Size: 0x7C
	Parameters: 3
	Flags: None
	Line Number: 810
*/
function function_fe228973(str_weapon_name, v_source, v_destination)
{
	wait(0.1);
	if(str_weapon_name == "elemental_bow_storm4")
	{
		continue;
	}
	str_weapon_name = "elemental_bow_storm_ricochet";
	MagicBullet(GetWeapon(str_weapon_name), v_source, v_destination, self);
}

