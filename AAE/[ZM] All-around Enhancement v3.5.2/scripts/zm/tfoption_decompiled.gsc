#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_aae_zombie_health_bar;
#include scripts\zm\_clientdvar;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_counter;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\aae_phd;
#include scripts\zm\bgbs\_zm_bgb_burned_out;
#include scripts\zm\elmg_gambler;
#include scripts\zm\elmg_hitmarker;
#include scripts\zm\elmg_powerups;
#include scripts\zm\hot_join_spawn;
#include scripts\zm\motherfucker;
#include scripts\zm\qxzj;
#include scripts\zm\timedplay;

#namespace namespace_78d24adc;

/*
	Name: init
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x12E8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function init()
{
	function_7d33ea12();
	if(GetDvarString("tfoption_tf_enabled") != GetDvarString("tfoption_master_ver") || GetDvarString("tfoption_master_ver") == "")
	{
	}
	else
	{
		function_bdd7089a();
		function_bdd8bce9();
	}
}

/*
	Name: function_8d13c3b4
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x1388
	Size: 0x1B8
	Parameters: 11
	Flags: None
	Line Number: 79
*/
function function_8d13c3b4(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex)
{
	if(self == eAttacker && (sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_GRENADE_SPLASH" || sMeansOfDeath == "MOD_PROJECTILE" || sMeansOfDeath == "MOD_PROJECTILE_SPLASH" || sMeansOfDeath == "MOD_EXPLOSIVE" || sMeansOfDeath == "MOD_EXPLOSIVE_SPLASH"))
	{
		pulse = GetDvarInt("rj");
		dir = (self.origin[0] - vPoint[0], self.origin[1] - vPoint[1], 0);
		dir = VectorNormalize(dir);
		dir = dir + (0, 0, 1);
		dir = dir * pulse;
		self SetOrigin(self.origin + VectorScale((0, 0, 1), 0.1));
		self SetVelocity(dir);
	}
	return -1;
}

/*
	Name: function_7d33ea12
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x1548
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function function_7d33ea12()
{
	if(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver"))
	{
		callback::on_spawned(&function_994c6e78);
		thread function_4816ad2d();
	}
}

/*
	Name: function_4816ad2d
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x15E8
	Size: 0x330
	Parameters: 0
	Flags: None
	Line Number: 123
*/
function function_4816ad2d()
{
	level flag::wait_till("start_zombie_round_logic");
	level namespace_d87f1aa7::function_908a81cd("tfoption_bgb_loadoutâ¦" + GetDvarString("tfoption_bgb_loadout"));
	util::wait_network_frame(1);
	level namespace_d87f1aa7::function_908a81cd("tfoption_bgb_costâ¦" + GetDvarString("tfoption_bgb_cost"));
	util::wait_network_frame(1);
	level namespace_d87f1aa7::function_908a81cd("tfoption_bgb_useâ¦" + GetDvarString("tfoption_bgb_use"));
	util::wait_network_frame(1);
	level namespace_d87f1aa7::function_908a81cd("tfoption_fixed_costâ¦" + GetDvarString("tfoption_fixed_cost"));
	util::wait_network_frame(1);
	level namespace_d87f1aa7::function_908a81cd("tfoption_pregumâ¦" + GetDvarString("tfoption_pregum"));
	util::wait_network_frame(1);
	level namespace_d87f1aa7::function_908a81cd("tfoption_tf_enabledâ¦" + GetDvarString("tfoption_master_ver"));
	util::wait_network_frame(1);
	level namespace_d87f1aa7::function_908a81cd("tfoption_gungameâ¦" + GetDvarString("tfoption_gungame"));
	util::wait_network_frame(1);
	if(level.script == "zm_moon")
	{
		self namespace_d87f1aa7::function_908a81cd("recentplayersâ¦" + GetDvarString("recentplayers"));
		util::wait_network_frame(1);
	}
	level namespace_d87f1aa7::function_908a81cd("tfoption_dwâ¦" + GetDvarString("tfoption_dw"));
	util::wait_network_frame(1);
	level namespace_d87f1aa7::function_908a81cd("tfoption_statusâ¦" + GetDvarString("tfoption_status"));
	util::wait_network_frame(1);
	callback::on_connect(&function_81e8c724);
}

/*
	Name: function_994c6e78
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x1920
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 162
*/
function function_994c6e78()
{
	if(self IsTestClient())
	{
		return;
	}
	self notify("hash_994c6e78");
	self endon("hash_994c6e78");
	self endon("disconnect");
	self endon("death");
	level endon("end_game");
	while(!zm_utility::is_player_valid(self, 1, 0))
	{
		wait(0.05);
	}
	if(GetDvarInt("tfoption_perkaholic") == 1)
	{
		self thread function_e25c963();
	}
	if(GetDvarInt("tfoption_perkaholic") != 1 && GetDvarInt("tfoption_spawn_with_quick_res") == 1)
	{
		self thread function_9a509ef9();
	}
	if(GetDvarString("no_movement_patch", "") == "1")
	{
		self namespace_d87f1aa7::function_908a81cd("no_movement_patchâ¦1");
	}
}

/*
	Name: function_81e8c724
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x1A90
	Size: 0x390
	Parameters: 0
	Flags: None
	Line Number: 201
*/
function function_81e8c724()
{
	if(self IsTestClient())
	{
		return;
	}
	level endon("end_game");
	self endon("disconnect");
	self endon("death");
	while(!isdefined(self.var_1da7a07d))
	{
		wait(0.05);
	}
	util::wait_network_frame(1);
	self namespace_d87f1aa7::function_908a81cd("tfoption_bgb_loadoutâ¦" + GetDvarString("tfoption_bgb_loadout"));
	util::wait_network_frame(1);
	self namespace_d87f1aa7::function_908a81cd("tfoption_bgb_costâ¦" + GetDvarString("tfoption_bgb_cost"));
	util::wait_network_frame(1);
	self namespace_d87f1aa7::function_908a81cd("tfoption_bgb_useâ¦" + GetDvarString("tfoption_bgb_use"));
	util::wait_network_frame(1);
	self namespace_d87f1aa7::function_908a81cd("tfoption_fixed_costâ¦" + GetDvarString("tfoption_fixed_cost"));
	util::wait_network_frame(1);
	self namespace_d87f1aa7::function_908a81cd("tfoption_pregumâ¦" + GetDvarString("tfoption_pregum"));
	util::wait_network_frame(1);
	self namespace_d87f1aa7::function_908a81cd("tfoption_tf_enabledâ¦" + GetDvarString("tfoption_master_ver"));
	util::wait_network_frame(1);
	self namespace_d87f1aa7::function_908a81cd("tfoption_gungameâ¦" + GetDvarString("tfoption_gungame"));
	util::wait_network_frame(1);
	self namespace_d87f1aa7::function_908a81cd("tfoption_damagestatsâ¦" + GetDvarString("tfoption_damagestats"));
	util::wait_network_frame(1);
	if(level.script == "zm_moon")
	{
		self namespace_d87f1aa7::function_908a81cd("recentplayersâ¦" + GetDvarString("recentplayers"));
		util::wait_network_frame(1);
	}
	self namespace_d87f1aa7::function_908a81cd("tfoption_dwâ¦" + GetDvarString("tfoption_dw"));
	util::wait_network_frame(1);
	self namespace_d87f1aa7::function_908a81cd("tfoption_statusâ¦" + GetDvarString("tfoption_status"));
}

/*
	Name: function_bdd7089a
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x1E28
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 251
*/
function function_bdd7089a()
{
	function_9573efd();
	thread function_d0fe1146();
}

/*
	Name: function_a62ea0de
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x1E58
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 267
*/
function function_a62ea0de()
{
}

/*
	Name: function_9573efd
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x1E68
	Size: 0xCB8
	Parameters: 0
	Flags: None
	Line Number: 281
*/
function function_9573efd()
{
	if(GetDvarInt("tfoption_roulette"))
	{
		thread namespace_452f006e::function_c6e11604();
		thread function_8a23f7dd();
	}
	else if(GetDvarInt("tfoption_gungame"))
	{
		namespace_452f006e::init();
	}
	if(GetDvarInt("tfoption_duck"))
	{
		thread function_f1698641();
	}
	if(GetDvarInt("tfoption_snail"))
	{
		thread function_8c5212f9();
	}
	if(GetDvarInt("tfoption_move_speed") != 1)
	{
		g_speed = Int(190 * GetDvarInt("tfoption_move_speed") / 100);
		SetDvar("g_speed", g_speed);
	}
	if(GetDvarString("tfoption_rj") == "1" && function_98902a25())
	{
		modvar("rj", 300);
		zm::register_player_damage_callback(&function_8d13c3b4);
	}
	if(GetDvarString("tfoption_solorevive") == "1")
	{
		thread function_58a9f0a0();
	}
	if(GetDvarString("tfoption_crazy_zombie") == "1")
	{
		thread function_43706e05();
	}
	if(GetDvarInt("tfoption_perk_powerup") == 1 && function_98902a25())
	{
		level.zombie_powerups["free_perk"].func_should_drop_with_regular_powerups = &zm_powerups::func_should_always_drop;
	}
	if(GetDvarInt("tfoption_better_nuke") == 1 && function_98902a25())
	{
		level._custom_powerups["nuke"].grab_powerup = &namespace_3f64bff6::grab_nuke;
	}
	else
	{
		level._custom_powerups["nuke"].grab_powerup = &namespace_3f64bff6::function_1cdeea19;
	}
	if(!GetDvarInt("tfoption_gungame") && GetDvarInt("tfoption_roamer_enabled") && GetDvarInt("tfoption_timed_gameplay") != 1)
	{
		thread function_af0e430f();
	}
	if(!GetDvarInt("tfoption_gungame") && GetDvarInt("tfoption_roamer_enabled") == 0 && GetDvarInt("tfoption_timed_gameplay") == 1)
	{
		thread namespace_88adf060::function_97b4fac5();
	}
	if(GetDvarString("tfoption_ff") != "" && GetDvarString("tfoption_ff") != "0" || GetDvarString("tfoption_shock") == "1")
	{
		if(function_98902a25())
		{
			zm::register_player_friendly_fire_callback(&function_74dcf766);
		}
	}
	if(GetDvarInt("tfoption_nohotjoin"))
	{
		thread function_2425d15c(GetDvarInt("tfoption_nohotjoin"));
	}
	if(GetDvarInt("tfoption_juke") == 1 && function_98902a25())
	{
		zm_spawner::add_custom_zombie_spawn_logic(&function_ee4b2c59);
	}
	if(GetDvarInt("tfoption_exo_movement") == 1)
	{
		callback::on_connect(&function_86f11272);
	}
	if(GetDvarString("tfoption_dpap") == "1" && function_98902a25())
	{
		callback::on_connect(&function_5327419e);
	}
	if(GetDvarString("tfoption_noslide") == "1" && function_98902a25() && level.script != "zm_tomb")
	{
		callback::on_connect(&function_fbad66db);
	}
	if(GetDvarInt("tfoption_safeArea_horizontal") > 0)
	{
		level.zombie_vars["zombie_health_start"] = Int(150 * 1 + GetDvarInt("tfoption_safeArea_horizontal") / 10);
	}
	target_round = GetDvarInt("tfoption_starting_round");
	if(target_round > 1)
	{
		level.start_round = target_round;
		level.round_number = level.start_round;
		if(level.gamedifficulty == 0)
		{
			level.zombie_move_speed = level.round_number * level.zombie_vars["zombie_move_speed_multiplier_easy"];
		}
		else
		{
			level.zombie_move_speed = level.round_number * level.zombie_vars["zombie_move_speed_multiplier"];
		}
		zombie_utility::ai_calculate_health(target_round);
		zm::set_round_number(level.start_round);
	}
	if(GetDvarString("tfoption_status") != "1")
	{
		namespace_ee79c167::function_f181aed2();
	}
	if(GetDvarInt("tfoption_no_round_delay") == 1)
	{
		zombie_utility::set_zombie_var("zombie_between_round_time", 0);
	}
	if(GetDvarInt("tfoption_melee_bonus") != 0)
	{
		zombie_utility::set_zombie_var("zombie_score_bonus_melee", 80 + GetDvarInt("tfoption_melee_bonus"));
	}
	if(GetDvarInt("tfoption_headshot_bonus") != 0)
	{
		zombie_utility::set_zombie_var("zombie_score_bonus_head", 50 + GetDvarInt("tfoption_headshot_bonus"));
	}
	var_1b9c2b0c = GetDvarInt("tfoption_max_zombies");
	if(var_1b9c2b0c && var_1b9c2b0c != 24)
	{
		if(function_98902a25())
		{
			level.zombie_ai_limit = var_1b9c2b0c;
			level.zombie_actor_limit = var_1b9c2b0c;
			zombie_utility::set_zombie_var("zombie_max_ai", var_1b9c2b0c);
		}
	}
	var_3f3a00e9 = GetDvarInt("tfoption_higher_health");
	if(var_3f3a00e9 <= 20 && var_3f3a00e9 > 1)
	{
		zombie_utility::set_zombie_var("player_base_health", var_3f3a00e9 * 10, 0);
	}
	if(GetDvarInt("tfoption_bo4_carpenter"))
	{
		level._custom_powerups["carpenter"].var_d4974158 = level._custom_powerups["carpenter"].grab_powerup;
		level._custom_powerups["carpenter"].grab_powerup = &namespace_3f64bff6::grab_carpenter;
	}
	if(GetDvarInt("tfoption_more_powerups") != 0 && function_98902a25())
	{
		increment = 0;
		var_e921715a = 0;
		switch(GetDvarInt("tfoption_more_powerups"))
		{
			case 0:
			{
				increment = 20000;
				var_e921715a = -1;
				break;
			}
			case 1:
			{
				increment = 3000;
				var_e921715a = 2;
				break;
			}
			case 2:
			{
				increment = 2000;
				var_e921715a = 4;
				break;
			}
			case 3:
			{
				increment = 1700;
				var_e921715a = 8;
				break;
			}
			case 4:
			{
				increment = 1000;
				var_e921715a = 50;
				break;
			}
			case 5:
			{
				increment = 1;
				var_e921715a = 20000;
			}
		}
		level.zombie_vars["zombie_powerup_drop_increment"] = increment;
		level.zombie_vars["zombie_powerup_drop_max_per_round"] = var_e921715a;
	}
	if(GetDvarInt("tfoption_bigger_mule") == 1)
	{
		level.additionalprimaryweapon_limit = 4;
	}
	if(GetDvarInt("tfoption_extra_cash") != 0)
	{
		zombie_utility::set_zombie_var("zombie_score_kill_4player", 50 + GetDvarInt("tfoption_extra_cash"));
		zombie_utility::set_zombie_var("zombie_score_kill_3player", 50 + GetDvarInt("tfoption_extra_cash"));
		zombie_utility::set_zombie_var("zombie_score_kill_2player", 50 + GetDvarInt("tfoption_extra_cash"));
		zombie_utility::set_zombie_var("zombie_score_kill_1player", 50 + GetDvarInt("tfoption_extra_cash"));
	}
}

/*
	Name: function_4430864f
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x2B28
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 489
*/
function function_4430864f()
{
	level endon("end_game");
	for(;;)
	{
		util::wait_network_frame(1);
		if(isdefined(level.var_6cf1c11f))
		{
			if(IsArray(level.var_6cf1c11f) && level.var_6cf1c11f.size > 0)
			{
				function_e2403242();
			}
		}
	}
}

/*
	Name: function_e2403242
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x2BA8
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 515
*/
function function_e2403242()
{
	for(i = 0; i < level.var_6cf1c11f.size; i++)
	{
		if(i > 120)
		{
			level.var_6cf1c11f = [];
			return;
		}
		var_63a2fb8 = level.var_6cf1c11f[i];
		if(IsArray(var_63a2fb8) && var_63a2fb8.size > 0)
		{
			if(isdefined(var_63a2fb8[0]) && isPlayer(var_63a2fb8[0]))
			{
				if(!isdefined(var_63a2fb8[5]))
				{
					var_63a2fb8[0] function_198df030(var_63a2fb8[1], var_63a2fb8[2], var_63a2fb8[3], var_63a2fb8[4]);
					continue;
				}
				if(!isdefined(var_63a2fb8[6]))
				{
					var_63a2fb8[0] function_198df030(var_63a2fb8[1], var_63a2fb8[2], var_63a2fb8[3], var_63a2fb8[4], var_63a2fb8[5]);
					continue;
				}
				var_63a2fb8[0] function_198df030(var_63a2fb8[1], var_63a2fb8[2], var_63a2fb8[3], var_63a2fb8[4], var_63a2fb8[5], var_63a2fb8[6]);
			}
		}
	}
	level.var_6cf1c11f = [];
}

/*
	Name: function_6504b2d6
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x2D80
	Size: 0xA8
	Parameters: 6
	Flags: None
	Line Number: 556
*/
function function_6504b2d6(head_origin, var_6b4220db, var_7641c35c, Distance, zombie, var_7ae2d73b)
{
	if(self IsTestClient())
	{
		return;
	}
	if(!isdefined(level.var_6cf1c11f))
	{
		level.var_6cf1c11f = [];
	}
	level.var_6cf1c11f[level.var_6cf1c11f.size] = Array(self, head_origin, var_6b4220db, var_7641c35c, Distance, zombie, var_7ae2d73b);
}

/*
	Name: function_198df030
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x2E30
	Size: 0x3A8
	Parameters: 6
	Flags: None
	Line Number: 579
*/
function function_198df030(head_origin, var_6b4220db, var_7641c35c, Distance, zombie, var_7ae2d73b)
{
	if(isdefined(head_origin) && isdefined(var_6b4220db) && isdefined(var_7641c35c) && isdefined(Distance))
	{
		if(isdefined(zombie) && IsActor(zombie))
		{
			if(isdefined(var_7ae2d73b) && IsFunctionPtr(var_7ae2d73b))
			{
				var_6b4220db = zombie [[var_7ae2d73b]](var_6b4220db);
			}
			else if(var_7641c35c == 1 && var_6b4220db >= zombie.health)
			{
				var_6b4220db = var_6b4220db - zombie.health;
			}
			if(var_6b4220db >= 4000000 || var_6b4220db < -5)
			{
				var_6b4220db = -1;
			}
			else if(var_6b4220db < 1)
			{
				var_6b4220db = -2;
			}
			if(isalive(zombie))
			{
				var_7641c35c = 1;
			}
			else
			{
				var_7641c35c = 0;
			}
			if(self zm_powerups::is_insta_kill_active() && isdefined(zombie.archetype) && zombie.archetype == "zombie")
			{
				var_7641c35c = 2;
			}
			self util::setClientSysState("deadshot_keyline", "dn," + Int(head_origin[0]) + "s" + Int(head_origin[1]) + "s" + Int(head_origin[2]) + "s" + var_6b4220db + "s" + var_7641c35c + "s" + Int(Distance), self);
		}
		else if(var_6b4220db >= 4000000 || var_6b4220db < -5)
		{
			var_6b4220db = -1;
		}
		else if(var_6b4220db < 1)
		{
			var_6b4220db = -2;
		}
		self util::setClientSysState("deadshot_keyline", "dn," + Int(head_origin[0]) + "s" + Int(head_origin[1]) + "s" + Int(head_origin[2]) + "s" + var_6b4220db + "s" + var_7641c35c + "s" + Int(Distance), self);
		return;
	}
	waittillframeend;
}

/*
	Name: function_e09fb6f9
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x31E0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 639
*/
function function_e09fb6f9()
{
	health = 0;
	foreach(head in self.head)
	{
		health = health + head.health;
	}
	return health;
}

/*
	Name: function_2263bfb4
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x3288
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 659
*/
function function_2263bfb4(var_6cce9274)
{
	return var_6cce9274 - self function_e09fb6f9();
}

/*
	Name: function_598edcd7
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x32B8
	Size: 0x1C8
	Parameters: 15
	Flags: None
	Line Number: 674
*/
function function_598edcd7(inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, boneIndex, modelIndex, surfaceType, vSurfaceNormal)
{
	var_29a3cf5b = 1;
	if(!isalive(self))
	{
		var_29a3cf5b = 0;
	}
	else
	{
		current_health = self.health;
	}
	if(isdefined(level.var_639022a6))
	{
		self [[level.var_639022a6]](inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, boneIndex, modelIndex, surfaceType, vSurfaceNormal);
	}
	if(var_29a3cf5b)
	{
		if(isdefined(self.var_308a583c) && self.var_308a583c != -1)
		{
			damage = self.var_308a583c;
		}
		willBeKilled = damage >= self.health || !isalive(self) || self.health <= 0;
		self thread function_2696030c(attacker, sHitLoc, vDamageOrigin, boneIndex, modelIndex, current_health, damage, willBeKilled);
	}
}

/*
	Name: function_2696030c
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x3488
	Size: 0x560
	Parameters: 8
	Flags: Private
	Line Number: 710
*/
function private function_2696030c(attacker, sHitLoc, vDamageOrigin, boneIndex, modelIndex, current_health, damage_override, willBeKilled)
{
	if(!isdefined(attacker))
	{
		return;
	}
	if(!isPlayer(attacker) || attacker IsTestClient())
	{
		return;
	}
	if(self.archetype == "margwa")
	{
		partName = GetPartName(self.model, boneIndex);
		modelHit = self namespace_ee79c167::margwaHeadHit(self, partName);
		if(isdefined(modelHit))
		{
			headInfo = self.head[modelHit];
			if(headInfo namespace_ee79c167::margwaCanDamageHead())
			{
				if(isdefined(vDamageOrigin) && vDamageOrigin != (0, 0, 0) && Distance(self.origin, vDamageOrigin) < 100)
				{
					attacker function_6504b2d6(vDamageOrigin, self function_e09fb6f9(), 1, Distance(self.origin, attacker.origin), self, &function_2263bfb4);
				}
				else
				{
					head_origin = self GetTagOrigin("j_head");
					if(isdefined(boneIndex) && boneIndex)
					{
						head_origin = self GetTagOrigin(GetPartName(self.model, boneIndex));
					}
					attacker function_6504b2d6(head_origin, self function_e09fb6f9(), 1, Distance(self.origin, attacker.origin), self, &function_2263bfb4);
				}
			}
		}
	}
	else if(willBeKilled)
	{
		var_7641c35c = 0;
		if(damage_override >= self.maxhealth)
		{
			var_7641c35c = 2;
		}
		if(isdefined(vDamageOrigin) && vDamageOrigin != (0, 0, 0) && Distance(self.origin, vDamageOrigin) < 100)
		{
			attacker function_6504b2d6(vDamageOrigin, damage_override, var_7641c35c, Distance(self.origin, attacker.origin), self);
		}
		else
		{
			head_origin = self GetTagOrigin("j_head");
			if(isdefined(boneIndex) && boneIndex)
			{
				head_origin = self GetTagOrigin(GetPartName(self.model, boneIndex));
			}
			attacker function_6504b2d6(head_origin, damage_override, var_7641c35c, Distance(self.origin, attacker.origin), self);
		}
	}
	else if(isdefined(vDamageOrigin) && vDamageOrigin != (0, 0, 0) && Distance(self.origin, vDamageOrigin) < 100)
	{
		attacker function_6504b2d6(vDamageOrigin, current_health, 1, Distance(self.origin, attacker.origin), self);
	}
	else
	{
		head_origin = self GetTagOrigin("j_head");
		if(isdefined(boneIndex) && boneIndex)
		{
			head_origin = self GetTagOrigin(GetPartName(self.model, boneIndex));
		}
		attacker function_6504b2d6(head_origin, current_health, 1, Distance(self.origin, attacker.origin), self);
	}
}

/*
	Name: function_d92df30b
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x39F0
	Size: 0x108
	Parameters: 5
	Flags: None
	Line Number: 791
*/
function function_d92df30b(head_origin, var_6b4220db, var_7641c35c, Distance, player)
{
	if(!isdefined(self.var_63172112))
	{
		player endon("disconnect");
		self.var_63172112 = 1;
		util::waitForTimeAndNetworkFrame(0.1);
		player LUINotifyEvent(&"damagenumber", 6, Int(head_origin[0]), Int(head_origin[1]), Int(head_origin[2]), var_6b4220db, var_7641c35c, Int(Distance));
		if(isdefined(self))
		{
			self.var_63172112 = undefined;
		}
	}
}

/*
	Name: function_314f052
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x3B00
	Size: 0x570
	Parameters: 15
	Flags: None
	Line Number: 816
*/
function function_314f052(eInflictor, player, damage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, modelIndex, partName, vSurfaceNormal)
{
	if(IsSubStr(self.vehicleType, "nikolai"))
	{
		return damage;
	}
	willBeKilled = self.health - self.damageTaken <= 0 || damage >= self.health;
	if(damage && self.team == level.zombie_team && isPlayer(player))
	{
		var_6b4220db = damage;
		if(damage >= 4000000)
		{
			var_6b4220db = -1;
		}
		if(damage < 1)
		{
			var_6b4220db = -2;
		}
		if(willBeKilled)
		{
			if(damage >= self.maxhealth)
			{
				var_7641c35c = 2;
			}
			else
			{
				var_7641c35c = 0;
			}
			if(isdefined(vDamageOrigin) && vDamageOrigin != (0, 0, 0) && Distance(self.origin, vDamageOrigin) < 100)
			{
				player LUINotifyEvent(&"damagenumber", 6, Int(vDamageOrigin[0]), Int(vDamageOrigin[1]), Int(vDamageOrigin[2]), var_6b4220db, var_7641c35c, Int(Distance(self.origin, player.origin)));
			}
			else
			{
				head_origin = self.origin + VectorScale((0, 0, 1), 25);
				if(isdefined(partName) && partName != "")
				{
					head_origin = self GetTagOrigin(partName);
				}
				player LUINotifyEvent(&"damagenumber", 6, Int(head_origin[0]), Int(head_origin[1]), Int(head_origin[2]), var_6b4220db, var_7641c35c, Int(Distance(self.origin, player.origin)));
			}
		}
		else if(isdefined(vDamageOrigin) && vDamageOrigin != (0, 0, 0) && Distance(self.origin, vDamageOrigin) < 100)
		{
			player LUINotifyEvent(&"damagenumber", 6, Int(vDamageOrigin[0]), Int(vDamageOrigin[1]), Int(vDamageOrigin[2]), var_6b4220db, 1, Int(Distance(self.origin, player.origin)));
		}
		else
		{
			head_origin = self.origin + VectorScale((0, 0, 1), 25);
			if(isdefined(partName) && partName != "")
			{
				head_origin = self GetTagOrigin(partName);
			}
			player LUINotifyEvent(&"damagenumber", 6, Int(head_origin[0]), Int(head_origin[1]), Int(head_origin[2]), var_6b4220db, 1, Int(Distance(self.origin, player.origin)));
		}
	}
	return damage;
}

/*
	Name: function_fbad66db
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x4078
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 885
*/
function function_fbad66db()
{
	self endon("disconnect");
	self endon("death");
	while(isdefined(self))
	{
		self allowslide(0);
		wait(0.05);
	}
}

/*
	Name: function_2425d15c
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x40C8
	Size: 0x418
	Parameters: 1
	Flags: None
	Line Number: 906
*/
function function_2425d15c(bool)
{
	level flag::wait_till("initial_blackscreen_passed");
	if(isdefined(level.zombie_include_craftables))
	{
		foreach(s_craftable in level.zombie_include_craftables)
		{
			foreach(s_piece in s_craftable.a_piecestubs)
			{
				if(isdefined(s_piece.pieceSpawn))
				{
					s_piece.pieceSpawn.model clientfield::set("bank_keyline", bool);
				}
			}
		}
	}
	else if(level.script == "zm_genesis")
	{
		wait(2);
		var_cf4d9486 = GetEntArray("b_target", "targetname");
		foreach(bone in var_cf4d9486)
		{
			bone clientfield::set("bank_keyline", bool);
		}
		var_7b352087 = struct::get("b_target_reel", "targetname");
		var_db42e573 = struct::get("b_target_body", "targetname");
		var_7b352087 clientfield::set("bank_keyline", bool);
		var_db42e573 clientfield::set("bank_keyline", bool);
		num = 0;
		script_models = GetEntArray("script_model", "classname");
		foreach(models in script_models)
		{
			if(models.model == "t7_zm_zod_keepers_totem" || models.model == "wpn_t7_zmb_dlc2_keeper_head_world" || models.model == "p7_ban_north_tribe_banner_crystal")
			{
				num++;
				models clientfield::set("bank_keyline", bool);
				if(num >= 3)
				{
					return;
				}
			}
		}
	}
}

/*
	Name: function_ee4b2c59
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x44E8
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 961
*/
function function_ee4b2c59()
{
	self endon("death");
	while(isdefined(self) && isalive(self))
	{
		if(self.zombie_move_speed != "super_sprint")
		{
			var_b15e2d5d = self ai::get_behavior_attribute("can_juke");
			if(!(isdefined(var_b15e2d5d) && var_b15e2d5d))
			{
				ai::set_behavior_attribute("can_juke", 1);
			}
			var_b15e2d5d = self ai::get_behavior_attribute("spark_behavior");
			if(!(isdefined(var_b15e2d5d) && var_b15e2d5d))
			{
				ai::set_behavior_attribute("spark_behavior", 1);
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_58a9f0a0
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x45E8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 993
*/
function function_58a9f0a0()
{
	while(!isdefined(level.solo_game_free_player_quickrevive))
	{
		level.solo_game_free_player_quickrevive = 1;
		wait(1);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_24113cdf
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x4618
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 1014
*/
function function_24113cdf()
{
	level endon("end_game");
	if(GetDvarInt("tfoption_no_dog") == 1)
	{
		for(;;)
		{
			level.next_dog_round = 0;
			level.next_monkey_round = 0;
			level.n_next_raps_round = 0;
			level.n_next_raz_round = 0;
			level.var_a78effc7 = 0;
			level.n_next_spider_round = 0;
			level.var_ebc4830 = 0;
			level.next_wasp_round = 0;
			level.var_783db6ab = 0;
			wait(2);
		}
	}
	else if(GetDvarInt("tfoption_no_dog") == 2)
	{
		zm::register_zombie_damage_override_callback(&function_a7a7058a);
		switch(GetDvarString("mapname"))
		{
			case "zm_castle":
			case "zm_genesis":
			case "zm_island":
			case "zm_stalingrad":
			case "zm_zod":
			{
				thread function_885ce4a0();
				break;
			}
			case "zm_tomb":
			{
				thread function_fcbbf377();
				break;
			}
			case "zm_moon":
			{
				thread function_3287fac();
				break;
			}
			case "zm_temple":
			{
				thread function_8b293044();
				break;
			}
		}
	}
}

/*
	Name: function_3287fac
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x47C8
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 1076
*/
function function_3287fac()
{
	level endon("end_game");
	level flag::wait_till("initial_blackscreen_passed");
	level.var_a0ee96e4 = 0;
	level thread function_cc6d0913();
	for(;;)
	{
		level waittill("start_of_round");
		while(!(isdefined(level.on_the_moon) && level.on_the_moon))
		{
			wait(0.048);
		}
		while(!level.zombie_total)
		{
			wait(0.048);
		}
		level.var_a0ee96e4 = Int(level.zombie_total / 3);
		while(level.var_a0ee96e4 > 0)
		{
			if(function_7a74dda9())
			{
				level.zombies_left_before_astro_spawn = 114514;
				level.next_astro_round = 1;
				level.num_astro_zombies = 0;
				level.max_astro_zombies = 1;
			}
			else
			{
				level.next_astro_round = 200;
				level.num_astro_zombies = 2;
				level.max_astro_zombies = 2;
			}
			wait(1);
		}
		level.next_astro_round = 200;
		level.num_astro_zombies = 2;
		level.max_astro_zombies = 2;
	}
}

/*
	Name: function_8b293044
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x4940
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 1127
*/
function function_8b293044()
{
	level endon("end_game");
	level flag::wait_till("initial_blackscreen_passed");
	level.var_a0ee96e4 = 0;
	level thread function_cc6d0913();
	for(;;)
	{
		level waittill("start_of_round");
		while(!level.zombie_total)
		{
			wait(0.048);
		}
		level.var_a0ee96e4 = Int(level.zombie_total / 3);
		while(level.var_a0ee96e4 > 0)
		{
			if(function_7a74dda9())
			{
				level.napalmZombiesEnabled = math::cointoss();
				level.napalmZombieCount = 0;
				level.var_57ecc1a3 = -1;
				level.nextNapalmSpawnRound = -1;
				level.zombiesLeftBeforeNapalmSpawn = 114514;
				level.sonicZombiesEnabled = 1;
				level.sonicZombieCount = 0;
				level.nextSonicSpawnRound = -1;
				level.var_57ecc1a3 = -1;
				level.zombiesLeftBeforeSonicSpawn = 114514;
			}
			else
			{
				level.napalmZombiesEnabled = 0;
				level.sonicZombiesEnabled = 0;
			}
			wait(1);
		}
		level.napalmZombiesEnabled = 0;
		level.sonicZombiesEnabled = 0;
	}
}

/*
	Name: function_fcbbf377
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x4AD8
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 1178
*/
function function_fcbbf377()
{
	level endon("end_game");
	level flag::wait_till("initial_blackscreen_passed");
	level.var_a0ee96e4 = 0;
	level thread function_cc6d0913();
	for(;;)
	{
		level waittill("start_of_round");
		while(!level.zombie_total)
		{
			wait(0.048);
		}
		level.var_a0ee96e4 = Int(level.zombie_total / 3);
		while(level.var_a0ee96e4 > 0)
		{
			if(function_7a74dda9())
			{
				level.mechz_left_to_spawn = 1;
				level notify("spawn_mechz");
			}
			wait(1);
		}
	}
}

/*
	Name: function_885ce4a0
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x4BC8
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 1214
*/
function function_885ce4a0()
{
	level endon("end_game");
	level flag::wait_till("initial_blackscreen_passed");
	if(!isdefined(level.var_9b0e8260))
	{
		return;
	}
	level.var_a0ee96e4 = 0;
	level thread function_cc6d0913();
	for(;;)
	{
		level waittill("start_of_round");
		while(!level.zombie_total)
		{
			wait(0.048);
		}
		level.var_a0ee96e4 = Int(level.zombie_total / 3);
		if(level.var_a0ee96e4 == 0)
		{
			level.var_a0ee96e4 = 1;
		}
		while(level.var_a0ee96e4 > 0)
		{
			if(function_7a74dda9())
			{
				function_7d355fe0();
			}
			wait(1);
		}
	}
}

/*
	Name: function_cc6d0913
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x4CE8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 1257
*/
function function_cc6d0913()
{
	level endon("end_game");
	for(;;)
	{
		level waittill("end_of_round");
		level.var_a0ee96e4 = 0;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7d355fe0
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x4D20
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 1279
*/
function function_7d355fe0()
{
	switch(level.script)
	{
		case "zm_island":
		{
			[[level.var_9b0e8260]](0);
			break;
		}
		case "zm_stalingrad":
		{
			[[level.var_9b0e8260]](1, undefined, 1);
			break;
		}
		case "zm_genesis":
		{
			if(RandomInt(100) >= 45)
			{
				[[level.var_9b0e8260]]("margwa");
			}
			else
			{
				[[level.var_9b0e8260]]("mechz");
				break;
			}
		}
		default
		{
			[[level.var_9b0e8260]](1);
			break;
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7a74dda9
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x4E08
	Size: 0x2A0
	Parameters: 0
	Flags: None
	Line Number: 1325
*/
function function_7a74dda9()
{
	if(level.var_a0ee96e4 <= 0)
	{
		return 0;
	}
	switch(level.script)
	{
		case "zm_zod":
		{
			archetype = "margwa";
			break;
		}
		case "zm_castle":
		case "zm_tomb":
		{
			archetype = "mechz";
			break;
		}
		case "zm_island":
		{
			archetype = "thrasher";
			break;
		}
		case "zm_stalingrad":
		{
			archetype = "raz";
			break;
		}
		case "zm_moon":
		{
			archetype = "astronaut";
			break;
		}
		default
		{
			archetype = "none";
			break;
		}
	}
	switch(level.script)
	{
		case "zm_temple":
		{
			check_count = 0;
			foreach(ai in GetAITeamArray("axis"))
			{
				if(isdefined(ai.animName) && (ai.animName == "sonic_zombie" || ai.animName == "napalm_zombie"))
				{
					check_count++;
				}
			}
			break;
		}
		case "zm_genesis":
		{
			check_count = getaiarchetypearray("mechz").size + getaiarchetypearray("margwa").size;
			break;
		}
		default
		{
			check_count = getaiarchetypearray(archetype).size;
			break;
		}
	}
	count = level.var_a0ee96e4;
	if(count >= 11)
	{
		count = 10;
	}
	if(count == 0)
	{
		count = 1;
	}
	if(check_count <= count)
	{
		return 1;
	}
	else
	{
		return 0;
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_a7a7058a
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x50B0
	Size: 0x148
	Parameters: 13
	Flags: None
	Line Number: 1421
*/
function function_a7a7058a(death, inflictor, player, damage, flags, mod, weapon, vPoint, vDir, HIT_LOCATION, psOffsetTime, boneIndex, surfaceType)
{
	if(isdefined(death) && death && isdefined(player) && isPlayer(player))
	{
		if(self.archetype == function_c2d5eb9c())
		{
			level.var_a0ee96e4--;
		}
		if(self.archetype == "mechz" || self.archetype == "margwa" && level.script == "zm_genesis")
		{
			level.var_a0ee96e4--;
		}
		if(isdefined(self.animName) && (self.animName == "sonic_zombie" || self.animName == "napalm_zombie"))
		{
			level.var_a0ee96e4--;
		}
	}
}

/*
	Name: function_c2d5eb9c
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x5200
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1450
*/
function function_c2d5eb9c()
{
	switch(level.script)
	{
		case "zm_zod":
		{
			return "margwa";
		}
		case "zm_castle":
		case "zm_tomb":
		{
			return "mechz";
		}
		case "zm_island":
		{
			return "thrasher";
		}
		case "zm_stalingrad":
		{
			return "raz";
		}
		case "zm_moon":
		{
			return "astronaut";
		}
		default
		{
			return "none";
		}
	}
}

/*
	Name: function_d0fe1146
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x5290
	Size: 0x258
	Parameters: 0
	Flags: None
	Line Number: 1492
*/
function function_d0fe1146()
{
	level flag::wait_till("all_players_connected");
	if(GetDvarInt("tfoption_start_power"))
	{
		thread function_8aaa8aa0();
	}
	if(GetDvarInt("tfoption_open_all_doors"))
	{
		thread function_d69a70db();
	}
	if(GetDvarInt("tfoption_every_box") && function_98902a25())
	{
		level thread function_dfdd79c8();
	}
	if(GetDvarInt("tfoption_no_dog"))
	{
		thread function_24113cdf();
	}
	if(GetDvarString("tfoption_damagestats") == "1")
	{
		if(isdefined(level.callbackActorDamage))
		{
			level.var_639022a6 = level.callbackActorDamage;
		}
		level.callbackActorDamage = &function_598edcd7;
		zm::register_vehicle_damage_callback(&function_314f052);
		level thread function_4430864f();
	}
	if(GetDvarInt("tfoption_no_delay") == 1 && !GetDvarInt("tfoption_gungame"))
	{
		thread function_b6b5ebf5();
	}
	function_c27ddd7();
	if(GetDvarString("tfoption_nt_death") == "1")
	{
		thread function_6badddd4();
	}
	if(GetDvarInt("tfoption_roundlimit") > 1)
	{
		thread function_73aeeead();
	}
}

/*
	Name: function_54546488
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x54F0
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1546
*/
function function_54546488()
{
	if(isdefined(level.var_508fe397) && level.var_508fe397)
	{
		return 1;
	}
	if(!isdefined(level._custom_perks))
	{
		return 0;
	}
	foreach(perk in getArrayKeys(level._custom_perks))
	{
		if(perk == "specialty_widowswine")
		{
			return 1;
		}
	}
	if(isdefined(level.perk_damage_override) && level.perk_damage_override.size > 1)
	{
		return 0;
	}
	return 0;
}

/*
	Name: widows_wine_damage_callback
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x55E8
	Size: 0x78
	Parameters: 10
	Flags: None
	Line Number: 1580
*/
function widows_wine_damage_callback(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(sWeapon.name === "sticky_grenade_widows_wine")
	{
		return 0;
	}
	return iDamage;
}

/*
	Name: widows_wine_contact_explosion
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x5668
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1599
*/
function widows_wine_contact_explosion()
{
	self MagicGrenadeType(GetWeapon("sticky_grenade_widows_wine"), self.origin + VectorScale((0, 0, 1), 48), (0, 0, 0), 0);
	self SetWeaponAmmoClip(self.current_lethal_grenade, self GetWeaponAmmoClip(self.current_lethal_grenade) - 1);
	self clientfield::increment_to_player("widows_wine_1p_contact_explosion", 1);
	return;
}

/*
	Name: function_dbe862e5
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x5718
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1617
*/
function function_dbe862e5()
{
	while(!isdefined(level._custom_powerups["carpenter"].grab_powerup))
	{
		wait(0.05);
	}
	level._custom_powerups["carpenter"].var_d4974158 = level._custom_powerups["carpenter"].grab_powerup;
	level._custom_powerups["carpenter"].grab_powerup = &namespace_3f64bff6::grab_carpenter;
}

/*
	Name: function_5327419e
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x57B0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1637
*/
function function_5327419e()
{
	self endon("disconnect");
	self endon("death");
	self thread function_70b3a1e8();
	for(;;)
	{
		self waittill("pap_taken");
		self waittill("weapon_change", weapon);
		if(!zm_weapons::is_weapon_upgraded(weapon))
		{
		}
		else
		{
			self function_e843ceb2(weapon);
			wait(1);
		}
	}
}

/*
	Name: function_e843ceb2
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x5848
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 1667
*/
function function_e843ceb2(weapon)
{
	weapon = zm_weapons::get_nonalternate_weapon(weapon);
	rootweapon = weapon.rootweapon;
	if(isdefined(level.var_97da320a[self getXuid(1) + rootweapon.name]))
	{
		if(level.var_97da320a[self getXuid(1) + rootweapon.name] < 5)
		{
			level.var_97da320a[self getXuid(1) + rootweapon.name] = level.var_97da320a[self getXuid(1) + rootweapon.name] + 1;
			namespace_22b67853::function_f105c5b1("pap_lvup", self);
		}
	}
	else
	{
		level.var_97da320a[self getXuid(1) + rootweapon.name] = 1;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_70b3a1e8
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x59B0
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 1697
*/
function function_70b3a1e8()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self waittill("weapon_change", weapon);
		var_d683289c = self getXuid(1) + zm_weapons::get_upgrade_weapon(weapon).name;
		if(!zm_weapons::is_weapon_upgraded(weapon))
		{
			if(isdefined(level.var_97da320a[var_d683289c]))
			{
				level.var_97da320a[var_d683289c] = undefined;
			}
		}
		if(isdefined(level.var_97da320a[var_d683289c]))
		{
			self function_f08253a6(level.var_97da320a[var_d683289c]);
		}
		else
		{
			self function_f08253a6(0);
		}
	}
}

/*
	Name: function_f08253a6
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x5AC0
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 1733
*/
function function_f08253a6(var_a2f55b96)
{
	if(!isdefined(self.var_a2f55b96))
	{
		self.var_a2f55b96 = var_a2f55b96;
		self util::setClientSysState("deadshot_keyline", "p," + self.var_a2f55b96, self);
	}
	if(isdefined(self.var_a2f55b96) && var_a2f55b96 != self.var_a2f55b96)
	{
		self.var_a2f55b96 = var_a2f55b96;
		self util::setClientSysState("deadshot_keyline", "p," + self.var_a2f55b96, self);
	}
}

/*
	Name: function_73aeeead
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x5B78
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 1757
*/
function function_73aeeead()
{
	level endon("end_game");
	modvar("autoend", GetDvarInt("tfoption_roundlimit"));
	roundLimit = GetDvarInt("autoend") + 1;
	if(roundLimit == 1 || roundLimit == 0 || roundLimit == 2)
	{
		return;
	}
	while(!level.round_number >= GetDvarInt("autoend") + 1)
	{
		wait(0.05);
	}
	if(GetDvarInt("tfoption_roundtime") > 0)
	{
		thread function_3ceb2ad5();
		level notify("hash_2fc4dd18");
		level waittill("start_of_round");
		thread function_92820ad(GetDvarInt("tfoption_roundtime") * 60);
		wait(GetDvarInt("tfoption_roundtime") * 60);
	}
	level notify("end_game");
}

/*
	Name: function_92820ad
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x5CF8
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 1791
*/
function function_92820ad(timer)
{
	thread function_3630751c(timer);
	level.zombie_ai_limit = 48;
	level.zombie_actor_limit = 48;
	zombie_utility::set_zombie_var("zombie_spawn_delay", 0.01, 1);
	for(;;)
	{
		level.zombie_total = 115;
		zombie = GetAISpeciesArray("axis");
		for(i = 0; i < zombie.size; i++)
		{
			if(isdefined(zombie[i].no_powerups) && zombie[i].no_powerups)
			{
				zombie[i] zombie_utility::set_zombie_run_cycle_override_value("sprint");
				continue;
			}
			zombie[i] zombie_utility::set_zombie_run_cycle_override_value("super_sprint");
		}
		wait(1);
	}
}

/*
	Name: function_3ceb2ad5
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x5E48
	Size: 0x150
	Parameters: 1
	Flags: None
	Line Number: 1824
*/
function function_3ceb2ad5(timer)
{
	title = MakeLocalizedString("ELMGS_ZOMBIERIOT");
	var_92820ad = NewHudElem();
	var_92820ad.foreground = 1;
	var_92820ad.hidewheninmenu = 0;
	var_92820ad.fontscale = 5;
	var_92820ad.alignX = "center";
	var_92820ad.alignY = "middle";
	var_92820ad.horzAlign = "center";
	var_92820ad.vertAlign = "middle";
	var_92820ad.color = (1, 0, 0);
	var_92820ad.x = 0;
	var_92820ad.y = 0;
	var_92820ad.alpha = 0;
	var_92820ad setText(title);
	var_92820ad thread function_4eb884cd();
}

/*
	Name: function_4eb884cd
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x5FA0
	Size: 0x210
	Parameters: 0
	Flags: None
	Line Number: 1853
*/
function function_4eb884cd()
{
	level endon("end_game");
	self fadeOverTime(0.5);
	self.alpha = 0.9;
	wait(0.5);
	self fadeOverTime(0.5);
	self.alpha = 0;
	wait(0.5);
	self fadeOverTime(0.5);
	self.alpha = 0.9;
	wait(0.5);
	self fadeOverTime(0.5);
	self.alpha = 0;
	wait(0.5);
	self fadeOverTime(0.5);
	self.alpha = 0.9;
	wait(0.5);
	self fadeOverTime(0.5);
	self.alpha = 0;
	wait(0.5);
	self fadeOverTime(0.5);
	self.alpha = 0.9;
	wait(0.5);
	self fadeOverTime(0.5);
	self.alpha = 0;
	wait(0.5);
	self fadeOverTime(0.5);
	self.alpha = 0.9;
	wait(0.5);
	self fadeOverTime(0.5);
	self.alpha = 0;
}

/*
	Name: function_3630751c
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x61B8
	Size: 0x180
	Parameters: 1
	Flags: None
	Line Number: 1897
*/
function function_3630751c(timer)
{
	var_92820ad = NewHudElem();
	var_92820ad.foreground = 1;
	var_92820ad.sort = 2;
	var_92820ad.hidewheninmenu = 0;
	var_92820ad.fontscale = 2;
	var_92820ad.alignX = "center";
	var_92820ad.alignY = "top";
	var_92820ad.horzAlign = "center";
	var_92820ad.vertAlign = "top";
	var_92820ad.color = (1, 0, 0);
	var_92820ad.x = 0;
	var_92820ad.y = 20;
	var_92820ad setTimer(timer);
	var_92820ad.alpha = 0;
	var_92820ad fadeOverTime(1.2);
	var_92820ad.alpha = 0.9;
	var_92820ad thread function_3e648b7b();
	thread function_3ff5ca26();
}

/*
	Name: function_3ff5ca26
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x6340
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1929
*/
function function_3ff5ca26()
{
	level endon("end_game");
	level endon("game_ended");
	level.var_3ff5ca26 = 1;
	level.players[0] playsound("zombsendgameintro");
	wait(142.684);
	while(level.var_3ff5ca26)
	{
		level.players[0] playsound("zombsendgameloop");
		wait(138.879);
	}
}

/*
	Name: function_3e648b7b
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x63D8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1953
*/
function function_3e648b7b()
{
	level waittill("end_game");
	level.var_3ff5ca26 = 0;
	level.players[0] stopsound("zombsendgameloop");
	level.players[0] stopsound("zombsendgameintro");
	if(isdefined(self))
	{
		self.alpha = 0.9;
		self fadeOverTime(1.2);
		self.alpha = 0;
		wait(1.2);
		self destroy();
	}
}

/*
	Name: function_b6b5ebf5
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x64B0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1979
*/
function function_b6b5ebf5()
{
	level endon("end_game");
	while(!isdefined(level.var_7df8604))
	{
		zombie_utility::set_zombie_var("zombie_spawn_delay", 0.1, 1);
		wait(1);
	}
}

/*
	Name: function_3201cecf
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x6508
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 1999
*/
function function_3201cecf()
{
}

/*
	Name: function_da5230f1
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x6518
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 2013
*/
function function_da5230f1(player)
{
}

/*
	Name: function_f46ea231
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x6530
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2027
*/
function function_f46ea231()
{
}

/*
	Name: function_3e4cc222
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x6540
	Size: 0x20
	Parameters: 3
	Flags: None
	Line Number: 2041
*/
function function_3e4cc222(hud, index, delay)
{
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_f72d940a
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x6568
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 2058
*/
function function_f72d940a(index)
{
}

/*
	Name: function_382f6307
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x6580
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2072
*/
function function_382f6307()
{
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ef02aa2
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x6590
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2089
*/
function function_ef02aa2()
{
}

/*
	Name: function_e97356fa
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x65A0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2103
*/
function function_e97356fa()
{
}

/*
	Name: function_83336fa
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x65B0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2117
*/
function function_83336fa()
{
}

/*
	Name: function_8bbbf045
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x65C0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2131
*/
function function_8bbbf045()
{
	return;
}

/*
	Name: function_5c899fd3
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x65D0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2146
*/
function function_5c899fd3()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a451ac1
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x65E0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2162
*/
function function_a451ac1()
{
}

/*
	Name: function_c381cb27
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x65F0
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 2176
*/
function function_c381cb27()
{
	zombies = Array::get_all_closest(self.origin, GetAITeamArray(level.zombie_team), undefined, 1);
	if(isalive(zombies[0]) && isdefined(zombies[0]) && zombies[0].health > 0)
	{
		zombie = zombies[0];
	}
	health = zombie.health;
	health = zombie.health / zombie.maxhealth;
	health = health * 100;
	health = Int(health);
	if(!isdefined(health))
	{
		health = "--";
	}
	return health;
}

/*
	Name: function_77ceb943
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x6728
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 2204
*/
function function_77ceb943()
{
	num = 0;
	zombies = GetAITeamArray("axis");
	foreach(zombie in zombies)
	{
		if(isalive(zombie) && zombie.archetype == "zombie" && zombie.team == level.zombie_team)
		{
			num = num + 1;
		}
	}
	if(!isdefined(num) || !num > 0)
	{
		num = "--";
	}
	return num;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_92f9fb44
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x6860
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 2233
*/
function function_92f9fb44()
{
	round = "--";
	if(isdefined(level.next_dog_round) && level.next_dog_round > 0)
	{
		round = level.next_dog_round;
	}
	if(isdefined(level.next_monkey_round) && level.next_monkey_round > 0)
	{
		round = level.next_monkey_round;
	}
	if(isdefined(level.n_next_raps_round) && level.n_next_raps_round > 0)
	{
		round = level.n_next_raps_round;
	}
	if(isdefined(level.n_next_raz_round) && level.n_next_raz_round > 0)
	{
		round = level.n_next_raz_round;
	}
	if(isdefined(level.var_a78effc7) && level.var_a78effc7 > 0)
	{
		round = level.var_a78effc7;
	}
	if(isdefined(level.n_next_spider_round) && level.n_next_spider_round > 0)
	{
		round = level.n_next_spider_round;
	}
	if(isdefined(level.var_ebc4830) && level.var_ebc4830 > 0)
	{
		round = level.var_ebc4830;
	}
	if(isdefined(level.next_wasp_round) && level.next_wasp_round > 0)
	{
		round = level.next_wasp_round;
	}
	if(isdefined(level.var_783db6ab) && level.var_783db6ab > 0)
	{
		round = level.var_783db6ab;
	}
	if(!isdefined(round))
	{
		round = "--";
	}
	return round;
}

/*
	Name: function_6badddd4
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x6A08
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 2289
*/
function function_6badddd4()
{
	level endon("end_game");
	while(1)
	{
		SetDvar("phys_gravity_dir", (0, 0, -1));
		wait(10);
	}
}

/*
	Name: function_7c3af9f2
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x6A50
	Size: 0xE0
	Parameters: 11
	Flags: None
	Line Number: 2309
*/
function function_7c3af9f2(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex)
{
	if(self != eAttacker)
	{
		self shellshock("flashbang", 2.5);
		self shellshock("concussion_grenade_mp", 2.5);
		self shellshock("explosion", 2.5);
	}
}

/*
	Name: function_74dcf766
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x6B38
	Size: 0x160
	Parameters: 11
	Flags: None
	Line Number: 2329
*/
function function_74dcf766(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex)
{
	if(GetDvarString("tfoption_shock") == "1")
	{
		self thread function_7c3af9f2(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex);
	}
	if(GetDvarString("tfoption_ff") != "" && GetDvarString("tfoption_ff") != "0" && self != eAttacker)
	{
		self thread function_1413baca(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex);
		return;
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_1413baca
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x6CA0
	Size: 0x3C0
	Parameters: 11
	Flags: None
	Line Number: 2354
*/
function function_1413baca(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex)
{
	switch(GetDvarInt("tfoption_ff"))
	{
		case 1:
		{
			self DoDamage(Int(25), vPoint, undefined, undefined, sHitLoc, "MOD_PROJECTILE", iDFlags, GetWeapon("pistol_standard_upgraded"));
			break;
		}
		case 2:
		{
			eAttacker DoDamage(Int(50), eAttacker GetEye(), undefined, undefined, sHitLoc, "MOD_PROJECTILE", iDFlags, GetWeapon("pistol_standard_upgraded"));
			self DoDamage(Int(50), vPoint, undefined, undefined, sHitLoc, "MOD_PROJECTILE", iDFlags, GetWeapon("pistol_standard_upgraded"));
			break;
		}
		case 3:
		{
			eAttacker DoDamage(Int(25), eAttacker GetEye(), undefined, undefined, sHitLoc, "MOD_PROJECTILE", iDFlags, GetWeapon("pistol_standard_upgraded"));
			break;
		}
		case 4:
		{
			if(sMeansOfDeath != "MOD_BURNED")
			{
				self ApplyKnockBack(20, vDir);
				break;
			}
		}
		case 5:
		{
			if(self.health != 0 || self.health != 1)
			{
				if(Int(25) >= self.health)
				{
					self DoDamage(self.health - 1, vPoint, undefined, undefined, sHitLoc, "MOD_PROJECTILE", iDFlags, GetWeapon("pistol_standard_upgraded"));
				}
				else
				{
					self DoDamage(Int(25), vPoint, undefined, undefined, sHitLoc, "MOD_PROJECTILE", iDFlags, GetWeapon("pistol_standard_upgraded"));
				}
			}
			else
			{
				self DoDamage(0, vPoint, undefined, undefined, sHitLoc, "MOD_PROJECTILE", iDFlags, GetWeapon("pistol_standard_upgraded"));
				break;
			}
		}
		default
		{
		}
	}
}

/*
	Name: function_c27ddd7
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x7068
	Size: 0x308
	Parameters: 0
	Flags: None
	Line Number: 2417
*/
function function_c27ddd7()
{
	switch(GetDvarInt("tfoption_camo_pap"))
	{
		case 2:
		{
			level.pack_a_punch_camo_index = 26;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 3:
		{
			level.pack_a_punch_camo_index = 42;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 4:
		{
			level.pack_a_punch_camo_index = 75;
			level.pack_a_punch_camo_index_number_variants = 5;
			break;
		}
		case 5:
		{
			level.pack_a_punch_camo_index = 81;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 6:
		{
			level.pack_a_punch_camo_index = 84;
			level.pack_a_punch_camo_index_number_variants = 5;
			break;
		}
		case 7:
		{
			level.pack_a_punch_camo_index = 121;
			level.pack_a_punch_camo_index_number_variants = 5;
			break;
		}
		case 8:
		{
			level.pack_a_punch_camo_index = 132;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 9:
		{
			level.pack_a_punch_camo_index = 133;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 10:
		{
			level.pack_a_punch_camo_index = 15;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 11:
		{
			level.pack_a_punch_camo_index = 17;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 12:
		{
			level.pack_a_punch_camo_index = 14;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 13:
		{
			level.pack_a_punch_camo_index = 23;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 14:
		{
			level.pack_a_punch_camo_index = 18;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 15:
		{
			level.pack_a_punch_camo_index = 16;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 16:
		{
			level.pack_a_punch_camo_index = 28;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 17:
		{
			level.pack_a_punch_camo_index = 22;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 18:
		{
			level.pack_a_punch_camo_index = 36;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 19:
		{
			level.pack_a_punch_camo_index = 1;
			level.pack_a_punch_camo_index_number_variants = 138;
			break;
		}
		case 20:
		{
			level.pack_a_punch_camo_index = 5;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
		}
		case 21:
		{
			level.pack_a_punch_camo_index = 0;
			level.pack_a_punch_camo_index_number_variants = 1;
			break;
			break;
		}
		default
		{
		}
	}
}

/*
	Name: function_69c9c680
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x7378
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 2558
*/
function function_69c9c680(score)
{
	foreach(player in GetPlayers())
	{
		player.score = score;
	}
}

/*
	Name: function_deb48fd7
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x7418
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 2576
*/
function function_deb48fd7(hp)
{
	if(hp <= 20)
	{
		hp = hp * 10;
		zombie_utility::set_zombie_var("player_base_health", hp, 0);
		foreach(player in GetPlayers())
		{
			player.maxhealth = hp;
			player.health = hp;
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_86f11272
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x7510
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 2602
*/
function function_86f11272()
{
	level endon("end_game");
	self endon("disconnect");
	self endon("death");
	level flag::wait_till("initial_blackscreen_passed");
	while(!self IsOnGround())
	{
		wait(0.048);
	}
	self util::setClientSysState("deadshot_keyline", "b,1", self);
	self namespace_d87f1aa7::function_908a81cd("doublejump_enabledâ¦1");
	self namespace_d87f1aa7::function_908a81cd("playerEnergy_enabledâ¦1");
	self namespace_d87f1aa7::function_908a81cd("wallrun_enabledâ¦1");
	self namespace_d87f1aa7::function_908a81cd("slide_forceBaseSlideâ¦0");
	for(;;)
	{
		wait(1);
		self function_f0051f1b(1);
		self allowdoublejump(1);
		SetDvar("doublejump_enabled", 1);
		SetDvar("playerEnergy_enabled", 1);
		SetDvar("wallrun_enabled", 1);
		SetDvar("slide_forceBaseSlide", 0);
	}
}

/*
	Name: function_ef9ae8ba
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x76E0
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 2639
*/
function function_ef9ae8ba()
{
	self endon("disconnect");
	self endon("death");
	level endon("end_game");
	level flag::wait_till("initial_blackscreen_passed");
	self.var_6838e76a = 2;
	modvar("exo", 800);
	for(;;)
	{
		wait(0.05);
		if(length(self getvelocity()) > 0 && !self IsOnGround() && !self SprintButtonPressed())
		{
			self thread function_9f5210c0(self GetEye() + AnglesToForward(self.angles - VectorScale((0, 1, 0), 180)) * 50);
			self playlocalsound("veh_jetpack_boost");
			self playsoundtoallbutplayer("veh_jetpack_boost_npc", self);
			self.var_6838e76a = self.var_6838e76a - 1;
			while(!self IsOnGround())
			{
				wait(0.05);
			}
		}
		else if(self.var_6838e76a <= 0)
		{
			wait(3);
			self.var_6838e76a = 2;
		}
	}
}

/*
	Name: function_9f5210c0
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x78A8
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 2679
*/
function function_9f5210c0(vPoint)
{
	pulse = GetDvarInt("exo");
	eye = self GetPlayerCameraPos();
	dir = (eye[0] - vPoint[0], eye[1] - vPoint[1], 0);
	dir = VectorNormalize(dir);
	dir = dir + (0, 0, 0);
	dir = dir * pulse;
	self SetVelocity(dir);
}

/*
	Name: function_bdd8bce9
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x7998
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 2700
*/
function function_bdd8bce9()
{
	if(GetDvarInt("tfoption_hitmarkers") == 1)
	{
		namespace_7003346::function_8c3adde9();
	}
	if(GetDvarInt("tfoption_se") != 0 && function_98902a25())
	{
		zm::register_zombie_damage_override_callback(&Motherfucker::function_ead67cbb);
		zm::register_vehicle_damage_callback(&function_9d5e768a);
	}
	if(GetDvarString("tfoption_trade") == "1")
	{
		Motherfucker::function_e6e848d9();
	}
	if(GetDvarInt("tfoption_bo4_max_ammo") == 1)
	{
		level._custom_powerups["full_ammo"].grab_powerup = &namespace_3f64bff6::grab_full_ammo;
	}
	if(GetDvarInt("tfoption_zcounter_enabled") == 1)
	{
		thread namespace_d96d7247::function_6e36800();
	}
	thread function_2181ff4a();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2181ff4a
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x7B10
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 2738
*/
function function_2181ff4a()
{
	level flag::wait_till("initial_blackscreen_passed");
	if(GetDvarString("tfoption_spectator_spawn") == "1" && function_98902a25())
	{
		thread namespace_e760e7c1::function_53a57ed5();
	}
	if(GetDvarString("tfoption_boxshare") == "1" && function_98902a25())
	{
		thread Motherfucker::function_f1c739ba();
	}
	if(GetDvarString("tfoption_loadoutsave") == "1" && GetDvarInt("tfoption_bigger_mule") != 1 && function_98902a25())
	{
		thread Motherfucker::function_2e84dd6d();
	}
	if(GetDvarInt("tfoption_perk_lose") == 1 && GetDvarInt("tfoption_bigger_mule") != 1 && function_98902a25())
	{
		thread function_e66390c9();
	}
}

/*
	Name: function_f231504
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x7CB8
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 2769
*/
function function_f231504()
{
	level flag::wait_till("start_zombie_round_logic");
	a_t_audio = GetEntArray("audio_bump_trigger", "targetname");
	foreach(t_audio_bump in a_t_audio)
	{
		if(t_audio_bump.script_sound === "zmb_perks_bump_bottle")
		{
			t_audio_bump thread function_42dec135();
		}
	}
	return;
}

/*
	Name: function_42dec135
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x7DB8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 2793
*/
function function_42dec135()
{
	self endon("death");
	for(;;)
	{
		self waittill("trigger", player);
		if(player GetStance() == "prone")
		{
			namespace_22b67853::function_f105c5b1("change", player);
		}
		wait(0.1);
	}
	else
	{
	}
}

/*
	Name: function_9d5e768a
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x7E38
	Size: 0xE0
	Parameters: 15
	Flags: None
	Line Number: 2820
*/
function function_9d5e768a(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, modelIndex, partName, vSurfaceNormal)
{
	willBeKilled = self.health - iDamage <= 0;
	self thread Motherfucker::function_ead67cbb(willBeKilled, eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, undefined, undefined);
	return iDamage;
}

/*
	Name: function_e66390c9
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x7F20
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 2837
*/
function function_e66390c9()
{
	level endon("end_game");
	level endon("game_ended");
	for(;;)
	{
		level.callbackPlayerLastStand = &function_43394aa;
		wait(1);
	}
}

/*
	Name: function_ee74649a
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x7F68
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 2858
*/
function function_ee74649a()
{
	foreach(player in level.activePlayers)
	{
		if(player hasweapon(GetWeapon("hero_gravityspikes_melee")))
		{
			return 1;
		}
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_43394aa
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8020
	Size: 0x120
	Parameters: 9
	Flags: None
	Line Number: 2881
*/
function function_43394aa(eInflictor, eAttacker, iDamage, sMeansOfDeath, weapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration)
{
	self endon("disconnect");
	self endon("death");
	if(isdefined(self.perks_active) && self.perks_active.size > 0)
	{
		if(function_ee74649a())
		{
			self.var_b76283a = self.perks_active;
		}
		if(GetDvarInt("tfoption_perk_lose"))
		{
			self thread Motherfucker::function_9f31686f(self.perks_active);
		}
	}
	self thread zm_laststand::PlayerLastStand(eInflictor, eAttacker, iDamage, sMeansOfDeath, weapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);
}

/*
	Name: function_e25c963
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8148
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 2909
*/
function function_e25c963()
{
	self endon("disconnect");
	self endon("death");
	level flag::wait_till("initial_blackscreen_passed");
	self thread zm_utility::give_player_all_perks();
}

/*
	Name: function_9a509ef9
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x81A0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 2927
*/
function function_9a509ef9()
{
	self endon("disconnect");
	self endon("death");
	level flag::wait_till("initial_blackscreen_passed");
	self zm_perks::give_perk("specialty_quickrevive");
	return;
}

/*
	Name: function_d69a70db
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8200
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 2946
*/
function function_d69a70db()
{
	while(isdefined(level.activePlayers) && level.activePlayers.size == 0)
	{
		wait(0.05);
	}
	player = level.activePlayers[0];
	zombie_doors = GetEntArray("zombie_door", "targetname");
	for(i = 0; i < zombie_doors.size; i++)
	{
		zombie_doors[i] notify("trigger", player, 1);
	}
	zombie_airlock_doors = GetEntArray("zombie_airlock_buy", "targetname");
	for(i = 0; i < zombie_airlock_doors.size; i++)
	{
		zombie_airlock_doors[i] notify("trigger", player, 1);
	}
	zombie_debris = GetEntArray("zombie_debris", "targetname");
	for(i = 0; i < zombie_debris.size; i++)
	{
		zombie_debris[i].zombie_cost = 0;
		zombie_debris[i] notify("trigger", player, 1);
	}
}

/*
	Name: function_dfdd79c8
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x83B8
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 2981
*/
function function_dfdd79c8()
{
	Array::thread_all(level.chests, &function_1f1efb2a);
	Array::thread_all(level.chests, &function_bd970802);
	Array::thread_all(level.chests, &function_826d52d7);
	if(GetDvarString("magic_chest_movable") == "1")
	{
		SetDvar("magic_chest_movable", "0");
	}
}

/*
	Name: function_826d52d7
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8488
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 3002
*/
function function_826d52d7()
{
	level endon("end_game");
	for(;;)
	{
		wait(0.1);
		level waittill("fire_sale_off");
		self.was_temp = undefined;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_bd970802
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x84C8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 3025
*/
function function_bd970802()
{
	level endon("end_game");
	for(;;)
	{
		wait(0.1);
		self.zbarrier waittill("closed");
		thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &zm_magicbox::magicbox_unitrigger_think);
	}
}

/*
	Name: get_chest_index
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8528
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 3046
*/
function get_chest_index()
{
	foreach(Chest in level.chests)
	{
		if(self == Chest)
		{
			return index;
		}
	}
	return undefined;
}

/*
	Name: is_chest_active
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x85B8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 3068
*/
function is_chest_active()
{
	curr_state = self.zbarrier.state;
	if(level flag::get("moving_chest_now"))
	{
		return 0;
	}
	if(curr_state == "open" || curr_state == "close")
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_1f1efb2a
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8630
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 3092
*/
function function_1f1efb2a()
{
	level endon("end_game");
	if(self is_chest_active() || self get_chest_index() == level.chest_index)
	{
		return;
	}
	self thread zm_magicbox::show_chest();
}

/*
	Name: function_330028f3
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8698
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 3112
*/
function function_330028f3()
{
	SetDvar("tfoptions_bowie", 1);
	return;
}

/*
	Name: function_8aaa8aa0
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x86C8
	Size: 0x240
	Parameters: 1
	Flags: None
	Line Number: 3128
*/
function function_8aaa8aa0(SIZE)
{
	if(!isdefined(SIZE))
	{
		SIZE = 0;
	}
	level flag::wait_till("initial_blackscreen_passed");
	wait(0.1);
	if(level flag::get("power_on"))
	{
		return;
	}
	arrays = Array("use_elec_switch", "zombie_vending", "zombie_door");
	presets = Array("elec", "power", "master");
	for(e = 0; e < 3; e++)
	{
		SIZE = SIZE + arrays[e].size;
	}
	for(e = 0; e < SIZE; e++)
	{
		level flag::set("power_on" + e);
	}
	foreach(preset in presets)
	{
		trig = GetEnt("use_" + preset + "_switch", "targetname");
		if(isdefined(trig))
		{
			trig notify("trigger", self);
			break;
		}
	}
	level flag::set("power_on");
	return;
	ERROR: Bad function call
}

/*
	Name: function_4069b038
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8910
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 3174
*/
function function_4069b038()
{
	level endon("end_game");
	self endon("death");
	self endon("hash_9cd39b2");
	for(;;)
	{
		wait(1);
		if(function_f101196b())
		{
		}
		else if(isdefined(self.no_powerups) && !self.no_powerups)
		{
			self zombie_utility::set_zombie_run_cycle_restore_from_override();
			self thread zombie_speed();
		}
		else if(isdefined(self.no_powerups) && self.no_powerups)
		{
			if(self.zombie_move_speed != "sprint" && !isdefined(self.var_ee695533))
			{
				self zombie_utility::set_zombie_run_cycle_override_value("sprint");
				self.var_ee695533 = 1;
			}
		}
	}
}

/*
	Name: function_f101196b
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8A10
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 3211
*/
function function_f101196b()
{
	foreach(player in GetPlayers())
	{
		if(player bgb::is_enabled("zm_bgb_undead_man_walking"))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: zombie_speed
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8AC0
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 3233
*/
function zombie_speed()
{
	self notify("hash_46b2ef7f");
	self endon("death");
	self endon("hash_46b2ef7f");
	for(;;)
	{
		wait(1);
		if(isdefined(self.no_powerups) && self.no_powerups)
		{
		}
		else if(function_f101196b())
		{
		}
		else if(GetDvarInt("tfoption_zombs_always_sprint") == 1)
		{
			if(self.zombie_move_speed != "sprint")
			{
				self zombie_utility::set_zombie_run_cycle_override_value("sprint");
			}
		}
		if(GetDvarInt("tfoption_zombs_always_sprint") == 2)
		{
			if(self.zombie_move_speed != "super_sprint" && level.script != "zm_moon")
			{
				self zombie_utility::set_zombie_run_cycle_override_value("super_sprint");
			}
		}
	}
}

/*
	Name: function_43706e05
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8BE8
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 3274
*/
function function_43706e05()
{
	for(;;)
	{
		wait(1);
		if(isdefined(level.var_7df8604))
		{
		}
		else
		{
			zombie = GetAISpeciesArray("axis");
			for(i = 0; i < zombie.size; i++)
			{
				if(isdefined(zombie[i].b_widows_wine_cocoon) && zombie[i].b_widows_wine_cocoon)
				{
					zombie[i] ASMSetAnimationRate(0.1);
					continue;
				}
				if(isdefined(zombie[i].var_a1d7b876))
				{
					zombie[i] ASMSetAnimationRate(1);
					continue;
				}
				if(isdefined(zombie[i].no_powerups) && zombie[i].no_powerups)
				{
					zombie[i] ASMSetAnimationRate(1);
					continue;
				}
				zombie[i] ASMSetAnimationRate(1.2);
			}
		}
	}
	return;
}

/*
	Name: function_af0e430f
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8D70
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 3319
*/
function function_af0e430f()
{
	level waittill("start_zombie_round_logic");
	level.round_end_custom_logic = &function_ede2b204;
}

/*
	Name: function_ede2b204
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8DA0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 3335
*/
function function_ede2b204()
{
	level endon("kill_round");
	level endon("hash_71c19eaa");
	level thread function_bc3afffb();
	level waittill("forever");
}

/*
	Name: function_bc3afffb
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8DE0
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 3353
*/
function function_bc3afffb()
{
	level endon("end_game");
	level endon("kill_round");
	level endon("hash_71c19eaa");
	thread function_45b7dd2d();
	thread function_de5e6875();
	if(GetDvarInt("tfoption_roamer_enabled") == 2)
	{
		for(;;)
		{
			for(i = 0; i < level.activePlayers.size; i++)
			{
				player = level.activePlayers[i];
				if(player meleeButtonPressed() && player AdsButtonPressed())
				{
					level notify("hash_71c19eaa");
				}
			}
			wait(0.05);
		}
	}
	else
	{
		for(i = 0; i < level.players.size; i++)
		{
			player = level.players[i];
			if(player IsHost())
			{
				if(player.sessionstate == "playing")
				{
					if(player meleeButtonPressed() && player AdsButtonPressed())
					{
						level notify("hash_71c19eaa");
						continue;
					}
				}
				if(GetDvarString("tfoption_spectator_spawn") != "1")
				{
					wait(1);
					level notify("hash_71c19eaa");
				}
			}
		}
		wait(0.05);
	}
	for(;;)
	{
	}
}

/*
	Name: function_de5e6875
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x8FD8
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 3414
*/
function function_de5e6875()
{
	level notify("hash_5856a22a");
	level endon("hash_5856a22a");
	level util::waittill_any_return("elmg_nextround", "end_game", "kill_round");
	wait(0.3);
	if(GetDvarInt("tfoption_roamer_enabled") == 2)
	{
		foreach(player in level.players)
		{
			if(isdefined(player.var_147d6641))
			{
				player CloseLUIMenu(player.var_147d6641);
			}
			if(isdefined(player.var_45b7dd2d))
			{
				player CloseLUIMenu(player.var_45b7dd2d);
			}
		}
	}
	else
	{
		foreach(player in level.players)
		{
			if(player IsHost())
			{
				if(isdefined(player.var_147d6641))
				{
					player CloseLUIMenu(player.var_147d6641);
				}
				if(isdefined(player.var_45b7dd2d))
				{
					player CloseLUIMenu(player.var_45b7dd2d);
					return;
				}
			}
		}
		return;
	}
	waittillframeend;
}

/*
	Name: function_45b7dd2d
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x9230
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 3466
*/
function function_45b7dd2d()
{
	level notify("hash_947aaef9");
	level endon("hash_947aaef9");
	level endon("end_game");
	level endon("kill_round");
	level endon("hash_71c19eaa");
	timer = GetDvarInt("tfoption_roamer_time");
	if(timer != 0)
	{
		thread function_adc0896b(timer);
		while(timer)
		{
			wait(1);
			timer--;
			thread function_adc0896b(timer);
		}
		level notify("hash_71c19eaa");
	}
	else
	{
		thread function_adc0896b();
		return;
	}
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_adc0896b
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x9318
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 3504
*/
function function_adc0896b(time)
{
	if(GetDvarInt("tfoption_roamer_enabled") == 2)
	{
		foreach(player in level.activePlayers)
		{
			player thread function_c83f2285(time);
		}
	}
	else
	{
		foreach(player in level.activePlayers)
		{
			if(player IsHost())
			{
				player thread function_c83f2285(time);
				return;
			}
		}
		return;
	}
}

/*
	Name: function_c83f2285
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x9488
	Size: 0x150
	Parameters: 1
	Flags: None
	Line Number: 3537
*/
function function_c83f2285(time)
{
	if(!isdefined(time))
	{
		time = 0;
	}
	if(isdefined(self.var_147d6641))
	{
		self CloseLUIMenu(self.var_147d6641);
	}
	if(isdefined(self.var_45b7dd2d))
	{
		self CloseLUIMenu(self.var_45b7dd2d);
	}
	self.var_147d6641 = self hud::function_1143b5c4(&"ELMGT_ROAMER_LABEL", 1, 900, 209, 720, (1, 1, 1), 23, "1,0,1");
	if(time != 0)
	{
		self.var_45b7dd2d = self hud::function_1143b5c4(namespace_82ce4a91::function_cec50efa(time), 1, 900, 229, 720, (1, 1, 1), 23, "1,0,1");
	}
	else if(isdefined(self.var_45b7dd2d))
	{
		self CloseLUIMenu(self.var_45b7dd2d);
	}
}

/*
	Name: function_8a23f7dd
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x95E0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 3572
*/
function function_8a23f7dd()
{
	level flag::wait_till("initial_blackscreen_passed");
	for(;;)
	{
		function_457e5d06();
		level waittill("end_of_round");
	}
	return;
}

/*
	Name: function_457e5d06
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x9630
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 3593
*/
function function_457e5d06()
{
	foreach(player in level.activePlayers)
	{
		player thread function_421ea25e();
	}
	if(zm::get_round_number() > 18)
	{
		zombie_utility::set_zombie_var("zombie_between_round_time", 30);
		return;
	}
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_421ea25e
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x9700
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 3618
*/
function function_421ea25e()
{
	self endon("disconnect");
	self notify("hash_421ea25e");
	self endon("hash_421ea25e");
	while(self GetCurrentWeapon().inventoryType != "primary" || self IsSwitchingWeapons() || self zm_utility::is_multiple_drinking())
	{
		wait(0.05);
	}
	self zm_weapons::weapon_give(Motherfucker::function_f56a5552(), 0, 0, 1, 1);
}

/*
	Name: function_98902a25
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x97C8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 3640
*/
function function_98902a25()
{
	switch(level.script)
	{
		case "zm_zod":
		{
			var_d0781852 = 6;
			break;
		}
		case "zm_castle":
		{
			var_d0781852 = 6;
			break;
		}
		case "zm_stalingrad":
		{
			var_d0781852 = 6;
			break;
		}
		case "zm_tomb":
		{
			var_d0781852 = 7;
			break;
		}
		default
		{
			var_d0781852 = 10;
			break;
		}
	}
	if(GetDvarInt("com_maxclients") > var_d0781852)
	{
		return 0;
	}
	else
	{
		return 1;
	}
}

/*
	Name: function_f1698641
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x9890
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 3690
*/
function function_f1698641()
{
	level.ducks = [];
	callback::on_spawned(&function_22c04d63);
}

/*
	Name: function_8c5212f9
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x98D0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 3706
*/
function function_8c5212f9()
{
	SetDvar("tfoption_higher_health", 2);
	level flag::wait_till("initial_blackscreen_passed");
	while(GetDvarInt("g_speed") < 512)
	{
		SetDvar("g_speed", GetDvarInt("g_speed") + 25);
		level waittill("end_of_round");
	}
}

/*
	Name: function_22c04d63
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x9980
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 3727
*/
function function_22c04d63()
{
	self notify("hash_22c04d63");
	self endon("hash_22c04d63");
	num = self GetEntityNumber();
	if(isdefined(level.ducks[num]))
	{
		level.ducks[num] delete();
	}
	level.ducks[num] = spawn("script_model", self.origin);
	level.ducks[num] endon("death");
	level.ducks[num] SetModel("p8_zmb_duck_float");
	level.ducks[num] thread function_7be110a6(self, num);
	level.ducks[num] EnableLinkTo();
	while(!level.ducks[num] islinkedto(self))
	{
		level.ducks[num] LinkTo(self, "j_mainroot", (0, 0, 0), (0, 0, 0));
		wait(1);
	}
}

/*
	Name: function_7be110a6
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x9B10
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 3758
*/
function function_7be110a6(player, num)
{
	player endon("hash_22c04d63");
	player function_dac0c688();
	self delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dac0c688
	Namespace: namespace_78d24adc
	Checksum: 0x424F4353
	Offset: 0x9B68
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 3777
*/
function function_dac0c688()
{
	self endon("disconnect");
	self endon("bled_out");
	self endon("hash_22c04d63");
	while(self.sessionstate == "playing")
	{
		wait(0.05);
	}
}

