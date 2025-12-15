#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\bots\_bot;
#include scripts\shared\bots\_bot_combat;
#include scripts\shared\bots\bot_buttons;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\drown;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\gameobjects_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\music_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\shared\weapons\_riotshield;
#include scripts\shared\weapons_shared;
#include scripts\zm\_clientdvar;
#include scripts\zm\_satchel_charge;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_game_module;
#include scripts\zm\_zm_hero_weapon;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_laststand_bar;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_playerhealth;
#include scripts\zm\_zm_powerup_empty_perk;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_powerup_purifier;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_sub;
#include scripts\zm\_zm_t8_za;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_melee_katana;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zcmachine;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\aae_left_ges;
#include scripts\zm\bgbs\_zm_bgb_aftertaste;
#include scripts\zm\bgbs\_zm_bgb_alchemical_antithesis;
#include scripts\zm\bgbs\_zm_bgb_always_done_swiftly;
#include scripts\zm\bgbs\_zm_bgb_anywhere_but_here;
#include scripts\zm\bgbs\_zm_bgb_armamental_accomplishment;
#include scripts\zm\bgbs\_zm_bgb_arms_grace;
#include scripts\zm\bgbs\_zm_bgb_arsenal_accelerator;
#include scripts\zm\bgbs\_zm_bgb_board_games;
#include scripts\zm\bgbs\_zm_bgb_board_to_death;
#include scripts\zm\bgbs\_zm_bgb_bullet_boost;
#include scripts\zm\bgbs\_zm_bgb_burned_out;
#include scripts\zm\bgbs\_zm_bgb_cache_back;
#include scripts\zm\bgbs\_zm_bgb_coagulant;
#include scripts\zm\bgbs\_zm_bgb_crate_power;
#include scripts\zm\bgbs\_zm_bgb_crawl_space;
#include scripts\zm\bgbs\_zm_bgb_danger_closest;
#include scripts\zm\bgbs\_zm_bgb_dead_of_nuclear_winter;
#include scripts\zm\bgbs\_zm_bgb_disorderly_combat;
#include scripts\zm\bgbs\_zm_bgb_ephemeral_enhancement;
#include scripts\zm\bgbs\_zm_bgb_extra_credit;
#include scripts\zm\bgbs\_zm_bgb_eye_candy;
#include scripts\zm\bgbs\_zm_bgb_fatal_contraption;
#include scripts\zm\bgbs\_zm_bgb_fear_in_headlights;
#include scripts\zm\bgbs\_zm_bgb_firing_on_all_cylinders;
#include scripts\zm\bgbs\_zm_bgb_flavor_hexed;
#include scripts\zm\bgbs\_zm_bgb_head_drama;
#include scripts\zm\bgbs\_zm_bgb_idle_eyes;
#include scripts\zm\bgbs\_zm_bgb_im_feelin_lucky;
#include scripts\zm\bgbs\_zm_bgb_immolation_liquidation;
#include scripts\zm\bgbs\_zm_bgb_impatient;
#include scripts\zm\bgbs\_zm_bgb_in_plain_sight;
#include scripts\zm\bgbs\_zm_bgb_kill_joy;
#include scripts\zm\bgbs\_zm_bgb_killing_time;
#include scripts\zm\bgbs\_zm_bgb_licensed_contractor;
#include scripts\zm\bgbs\_zm_bgb_lucky_crit;
#include scripts\zm\bgbs\_zm_bgb_mind_blown;
#include scripts\zm\bgbs\_zm_bgb_near_death_experience;
#include scripts\zm\bgbs\_zm_bgb_newtonian_negation;
#include scripts\zm\bgbs\_zm_bgb_now_you_see_me;
#include scripts\zm\bgbs\_zm_bgb_on_the_house;
#include scripts\zm\bgbs\_zm_bgb_perkaholic;
#include scripts\zm\bgbs\_zm_bgb_phoenix_up;
#include scripts\zm\bgbs\_zm_bgb_pop_shocks;
#include scripts\zm\bgbs\_zm_bgb_power_vacuum;
#include scripts\zm\bgbs\_zm_bgb_profit_sharing;
#include scripts\zm\bgbs\_zm_bgb_projectile_vomiting;
#include scripts\zm\bgbs\_zm_bgb_reign_drops;
#include scripts\zm\bgbs\_zm_bgb_respin_cycle;
#include scripts\zm\bgbs\_zm_bgb_round_robbin;
#include scripts\zm\bgbs\_zm_bgb_secret_shopper;
#include scripts\zm\bgbs\_zm_bgb_self_medication;
#include scripts\zm\bgbs\_zm_bgb_shopping_free;
#include scripts\zm\bgbs\_zm_bgb_slaughter_slide;
#include scripts\zm\bgbs\_zm_bgb_soda_fountain;
#include scripts\zm\bgbs\_zm_bgb_stock_option;
#include scripts\zm\bgbs\_zm_bgb_sword_flay;
#include scripts\zm\bgbs\_zm_bgb_temporal_gift;
#include scripts\zm\bgbs\_zm_bgb_tone_death;
#include scripts\zm\bgbs\_zm_bgb_unbearable;
#include scripts\zm\bgbs\_zm_bgb_undead_man_walking;
#include scripts\zm\bgbs\_zm_bgb_unquenchable;
#include scripts\zm\bgbs\_zm_bgb_wall_power;
#include scripts\zm\bgbs\_zm_bgb_whos_keeping_score;
#include scripts\zm\bots\_bot;
#include scripts\zm\chaser_gun;
#include scripts\zm\chatnotify;
#include scripts\zm\craftables\_zm_craftables;
#include scripts\zm\elmg_gambler;
#include scripts\zm\elmg_hitmarker;
#include scripts\zm\extra_weapon_load;
#include scripts\zm\gametypes\_clientid;
#include scripts\zm\gametypes\_globallogic_score;
#include scripts\zm\gametypes\_globallogic_spawn;
#include scripts\zm\gametypes\_globallogic_ui;
#include scripts\zm\gametypes\_globallogic_utils;
#include scripts\zm\gametypes\_zm_gametype;
#include scripts\zm\hot_join_spawn;
#include scripts\zm\moreplayers;
#include scripts\zm\spike_charge;
#include scripts\zm\tfoption;
#include scripts\zm\xmodelallies;
#include scripts\zm\zmsavedata;

#namespace Motherfucker;

/*
	Name: __init__sytem__
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x44E0
	Size: 0xA0
	Parameters: 0
	Flags: AutoExec
	Line Number: 155
*/
function autoexec __init__sytem__()
{
	system::register("motherfucker", &__init__, undefined, undefined);
	if(!GetDvarInt("DontLoadDlls") && !GetDvarString("aaeoption_ges"))
	{
		namespace_3d0867a6::main();
		system::Ignore("gestures");
		return;
	}
}

/*
	Name: __init__
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x4588
	Size: 0x320
	Parameters: 0
	Flags: None
	Line Number: 176
*/
function __init__()
{
	if(GetDvarString("sv_playlist") == "" && GetDvarString("live_dedicatedReady") == "")
	{
		level.flag["all_players_connected"] = 0;
		level.var_4fc014b5 = &namespace_e760e7c1::function_c05edfc2;
	}
	namespace_e760e7c1::init();
	thread control();
	MapName = GetDvarString("mapname");
	function_f3e381df("lsm");
	util::registerClientSys("deadshot_keyline");
	util::registerClientSys("levelNotify");
	util::registerClientSys("musicCmd");
	util::registerClientSys("left_ges_event");
	SetDvar("bulletrange", 65536);
	if(GetDvarString("entview") == "1")
	{
		level thread function_febe9a8f();
	}
	else
	{
		SetDvar("developer", 0);
		SetDvar("scr_mod_enable_devblock", 0);
		SetDvar("ai_showNavMesh", 0);
		SetDvar("tracer_debugDraw", 0);
		SetDvar("ai_showNavMeshSilhouettes", 0);
		SetDvar("g_bDebugRenderEntityBrushes", 0);
	}
	if(MapName == "3066613882")
	{
		util::registerClientSys("waterparkChalenges");
	}
	util::registerClientSys("sendsub");
	util::registerClientSys("aae_soulcounter");
	system::Ignore("zm_bgb_fix");
	namespace_11e193f1::function_be47242b();
	clientfield::register("clientuimodel", "hudItems.aaePerkSlot", 21000, 4, "int");
	clientfield::register("clientuimodel", "hudItems.aaeWeapTradeBool", 21000, GetMinBitCountForNum(5), "int");
}

/*
	Name: function_f3e381df
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x48B0
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 227
*/
function function_f3e381df(sSysName)
{
	if(!isdefined(level._clientSys))
	{
		level._clientSys = [];
	}
	if(isdefined(level._clientSys[sSysName]))
	{
		return;
	}
	level._clientSys[sSysName] = sSysName;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: init
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x4908
	Size: 0x508
	Parameters: 0
	Flags: None
	Line Number: 252
*/
function init()
{
	setscoreboardcolumns("kills", "score", "downs", "revives", "headshots", "plants", "stabs", "captures", "returns");
	callback::remove_on_connect(&zm_gametype::onPlayerConnect_check_for_hotjoin);
	if(isdefined(level.giveCustomLoadout))
	{
		level.var_c5f27ebb = level.giveCustomLoadout;
	}
	if(GetDvarString("aae_spectator") != "")
	{
		var_45136bb3 = StrTok(GetDvarString("aae_spectator"), ",");
		if(var_45136bb3.size > 0)
		{
			level.customMaySpawnLogic = &function_da2f4cf3;
		}
	}
	level.giveCustomLoadout = &function_7d83ef11;
	level.var_f605a32e = &zm::get_round_number;
	SetDvar("ai_disablespawn", 0);
	level.player_too_many_players_check = 0;
	level.ignore_vortex_ragdoll = 1;
	level.ignore_gravityspikes_ragdoll = 1;
	level.player_intersection_tracker_override = &DoNothing;
	level.player_too_many_weapons_monitor_func = &player_too_many_weapons_monitor;
	level.custom_player_track_ammo_count = &tomb_custom_player_track_ammo_count;
	level.bgb_in_use = 1;
	if(isdefined(level.start_weapon) && level.start_weapon != level.weaponNone)
	{
		level.default_laststandpistol = level.start_weapon;
		level.laststandpistol = level.start_weapon;
		var_cdf4268a = zm_weapons::get_upgrade_weapon(level.start_weapon);
		if(isdefined(var_cdf4268a) && var_cdf4268a != level.weaponNone)
		{
			level.default_solo_laststandpistol = var_cdf4268a;
		}
		else
		{
			var_cdf4268a = GetWeapon(level.start_weapon.name + "_upgraded");
			if(isdefined(var_cdf4268a) && var_cdf4268a != level.weaponNone)
			{
				level.default_solo_laststandpistol = var_cdf4268a;
			}
			else
			{
				level.default_solo_laststandpistol = level.start_weapon;
			}
		}
	}
	namespace_78d24adc::init();
	namespace_e0ec58c4::init();
	namespace_ab57545b::init();
	function_18e8fb60();
	function_fcd8d89f();
	thread function_2ca96505();
	thread music();
	callback::on_connecting(&function_6a06a8d1);
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&player_on_spawned);
	thread function_a61c7019();
	zm::register_vehicle_damage_callback(&function_c17f0b42);
	zm::register_zombie_damage_override_callback(&function_e7fc38e2);
	thread function_afdb1d03();
	thread function_b08b02d4();
	thread function_b4d2cbac();
	thread function_22336fc2();
	thread function_a3e8a29();
	thread function_9161feac();
	if(isdefined(level.var_508fe397))
	{
		thread function_891e6177();
	}
	thread function_a6669f20();
	zm_audio::zmbVoxAdd("general", "shoot_arm", "shoot_limb", 100, 0);
	zm_audio::zmbVoxAdd("eggs", "music_activate", "secret", 100, 0);
	function_2cc908f4();
	return;
}

/*
	Name: function_da2f4cf3
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x4E18
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 340
*/
function function_da2f4cf3()
{
	map_logic_exists = level flag::exists("all_players_connected");
	map_logic_started = level flag::get("all_players_connected");
	var_48b036a2 = level flag::exists("initial_blackscreen_passed");
	var_380576d = level flag::get("initial_blackscreen_passed");
	var_45136bb3 = StrTok(ToLower(GetDvarString("aae_spectator")), ",");
	if(var_45136bb3.size > 0 && (map_logic_exists && map_logic_started || (var_48b036a2 && var_380576d)))
	{
		foreach(names in var_45136bb3)
		{
			if(IsSubStr(ToLower(self.playerName), names))
			{
				self.spectator_respawn = undefined;
				return 0;
			}
		}
	}
	return 1;
	self.var_0 = undefined;
}

/*
	Name: function_7b498c1b
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x4FF8
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 372
*/
function function_7b498c1b()
{
	function_7af7e4a6();
	function_1f37c981("zm_craftdanimations", (2044.16, -2043.47, 0), (-2043.95, 2042.87, 0), "compass_map_zm_craftdanimations", 800);
	function_1f37c981("zm_factory", (2120.19, -3821.39, 0), (-2389.63, 1904.69, 0), "compass_map_zm_factory", 800);
	function_1f37c981("zm_tomb", (3784.39, -4546.65, 0), (-4643.14, 6665.29, 0), "compass_map_zm_tomb", 900);
	function_1f37c981("zm_zod", (8197.01, -10785.4, 0), (-144.359, -615.994, 0), "compass_map_zm_zod", 800);
	function_1f37c981("zm_castle", (2342.16, -50.1773, 0), (-1960.36, 4618.21, 0), "compass_map_zm_castle", 1000);
	function_1f37c981("1663631538", (4451, -3313, 0), (-2141, 3302, 0), "compass_map_zm_westernz", 800);
}

/*
	Name: function_7af7e4a6
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x51C0
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 393
*/
function function_7af7e4a6()
{
	foreach(minimap_corner in GetEntArray("minimap_corner", "targetname"))
	{
		minimap_corner delete();
	}
	SetDvar("compassmaxrange", 1000);
	var_ec452449 = spawn("script_origin", (2046.55, -2047.15, 0));
	var_ec452449.targetname = "minimap_corner";
	var_e232ce24 = spawn("script_origin", (-2048.72, 2047.89, 0));
	var_e232ce24.targetname = "minimap_corner";
	compass::setupMiniMap("compass_map_test");
}

/*
	Name: function_1f37c981
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x5330
	Size: 0x218
	Parameters: 5
	Flags: None
	Line Number: 417
*/
function function_1f37c981(map, var_243ef0cc, var_663d963, var_73cd474a, range)
{
	if(!isdefined(var_243ef0cc))
	{
		var_243ef0cc = (2046.55, -2047.15, 0);
	}
	if(!isdefined(var_663d963))
	{
		var_663d963 = (-2048.72, 2047.89, 0);
	}
	if(!isdefined(var_73cd474a))
	{
		var_73cd474a = "compass_map_test";
	}
	if(!isdefined(range))
	{
		range = 1000;
	}
	if(map == GetDvarString("ui_mapname"))
	{
		foreach(minimap_corner in GetEntArray("minimap_corner", "targetname"))
		{
			minimap_corner delete();
		}
		SetDvar("compassmaxrange", range);
		var_ec452449 = spawn("script_origin", var_243ef0cc);
		var_ec452449.targetname = "minimap_corner";
		var_e232ce24 = spawn("script_origin", var_663d963);
		var_e232ce24.targetname = "minimap_corner";
		compass::setupMiniMap(var_73cd474a);
	}
}

/*
	Name: function_22336fc2
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x5550
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 460
*/
function function_22336fc2()
{
	level waittill("end_game");
	if(GetDvarString("ui_mapname") == "2780964226")
	{
		thread function_142fe629();
	}
	if(GetDvarInt("sv_cheats") || GetDvarInt("elmg_cheats"))
	{
		return;
	}
	function_daf342d6();
}

/*
	Name: function_142fe629
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x55F0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 484
*/
function function_142fe629()
{
	wait(10);
	exitLevel(0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_daf342d6
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x5618
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 502
*/
function function_daf342d6()
{
	level notify("hash_5b2b9dc0");
	level endon("hash_5b2b9dc0");
	if(isdefined(level.var_3c40c482))
	{
		return;
	}
	foreach(player in level.players)
	{
		player function_f7a298a5();
	}
	if(namespace_11e193f1::function_66a72324())
	{
		wait(2);
		level namespace_11e193f1::function_d7942e29();
	}
}

/*
	Name: function_c17f0b42
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x5710
	Size: 0x140
	Parameters: 15
	Flags: None
	Line Number: 531
*/
function function_c17f0b42(eInflictor, player, damage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, modelIndex, partName, vSurfaceNormal)
{
	if(zm_utility::is_player_valid(player) && (weapon == player GetCurrentWeapon() || weapon == player GetCurrentWeapon().dualWieldWeapon || weapon == player GetCurrentWeapon().altweapon) && weapon.type === "bullet")
	{
		self thread function_2186aa1a(player);
	}
	return damage;
}

/*
	Name: function_2186aa1a
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x5858
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 550
*/
function function_2186aa1a(player)
{
	self notify("hash_2186aa1a");
	self endon("hash_2186aa1a");
	player endon("disconnect");
	player.var_eca90719 = 1;
	wait(0.05);
	player.var_eca90719 = undefined;
	return;
	ERROR: Bad function call
}

/*
	Name: function_e7fc38e2
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x58C0
	Size: 0x130
	Parameters: 13
	Flags: None
	Line Number: 572
*/
function function_e7fc38e2(death, inflictor, player, damage, flags, mod, weapon, vPoint, vDir, HIT_LOCATION, psOffsetTime, boneIndex, surfaceType)
{
	if(zm_utility::is_player_valid(player) && (weapon == player GetCurrentWeapon() || weapon == player GetCurrentWeapon().dualWieldWeapon || weapon == player GetCurrentWeapon().altweapon) && weapon.type === "bullet")
	{
		self thread function_2186aa1a(player);
	}
	return damage;
}

/*
	Name: function_1544f0e9
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x59F8
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 591
*/
function function_1544f0e9()
{
	level waittill("end_game");
	MapName = GetDvarString("ui_mapname");
	if(IsSubStr(MapName, "zm_") && MapName != "zm_genesis")
	{
		level util::waittill_notify_or_timeout("player_intermission_spawned", 6);
		foreach(player in level.players)
		{
			if(isdefined(player.game_over))
			{
				player.game_over.x = 10000;
			}
			if(isdefined(player.var_1a914bcc))
			{
				player.var_1a914bcc.x = 10000;
			}
			if(isdefined(player.survived))
			{
				player.survived.x = 10000;
			}
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f7a298a5
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x5B90
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 628
*/
function function_f7a298a5()
{
	self endon("disconnect");
	self notify("hash_cec70ebb");
	self endon("hash_cec70ebb");
	if(namespace_11e193f1::function_66a72324())
	{
		if(isdefined(self.var_bef468a3))
		{
			var_b1664111 = self.score_total - 500;
			if(var_b1664111 < 0)
			{
				var_b1664111 = 0;
			}
			self namespace_11e193f1::function_2812fe55(6, self.total_shots);
			self namespace_11e193f1::function_2812fe55(7, self.var_457779be);
			self namespace_11e193f1::function_2812fe55(8, var_b1664111);
			self namespace_11e193f1::function_2812fe55(9, self.kills);
			self namespace_11e193f1::function_2812fe55(12, self.headshots);
			if(GetDvarInt("tfoption_starting_round") > 1)
			{
				self namespace_11e193f1::function_9ec531f4(50, zm::get_round_number() - GetDvarInt("tfoption_starting_round"));
			}
			else
			{
				self namespace_11e193f1::function_9ec531f4(50, zm::get_round_number());
			}
			self namespace_11e193f1::function_15dae02d(52);
			self namespace_11e193f1::function_2812fe55(46, Int(self.pers["distance_traveled"] / 38));
			self namespace_11e193f1::function_2812fe55(48, Int(self.pers["time_played_total"]));
		}
	}
}

/*
	Name: function_cdc9b05d
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x5DE8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 672
*/
function function_cdc9b05d()
{
	return;
}

/*
	Name: function_afdb1d03
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x5DF8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 687
*/
function function_afdb1d03()
{
	level flag::wait_till("initial_blackscreen_passed");
	if(level.script == "zm_zod")
	{
		level flag::wait_till("ritual_pap_complete");
	}
	Array::thread_all(zm_pap_util::get_triggers(), &function_684b18e8);
}

/*
	Name: function_684b18e8
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x5E88
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 707
*/
function function_684b18e8()
{
	bump_trigger = spawn("trigger_radius", self.origin, 0, level.pack_a_punch.interaction_trigger_radius, level.pack_a_punch.interaction_trigger_height);
	bump_trigger thread function_863854f9(self);
	for(;;)
	{
		bump_trigger waittill("trigger", player);
		if(player GetStance() == "prone")
		{
			if(isdefined(player.var_def06a03) && player.var_def06a03 >= 50)
			{
				player zm_score::add_to_player_score(1000);
			}
			else
			{
				player zm_score::add_to_player_score(25);
			}
			player zm_utility::play_sound_at_pos("purchase", player.origin);
			return;
		}
	}
}

/*
	Name: function_863854f9
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x5FD0
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 740
*/
function function_863854f9(PaP)
{
	level endon("game_end");
	pap_machine = GetEnt(PaP.target, "targetname");
	for(;;)
	{
		self waittill("trigger", player);
		if(isdefined(pap_machine.state) && pap_machine.state == "powered" || level.script == "zm_zod")
		{
			if(!player IsSwitchingWeapons() && player IsMeleeing() && self function_ff620ca6(player))
			{
				player.var_7011e588 = 1;
				PaP notify("trigger", player);
				player waittill("weapon_change");
				player.var_7011e588 = undefined;
				while(player IsMeleeing() && isdefined(player))
				{
					wait(0.05);
				}
			}
		}
	}
}

/*
	Name: function_ff620ca6
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x6138
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 774
*/
function function_ff620ca6(player)
{
	if(player laststand::player_is_in_laststand())
	{
		return 0;
	}
	octobomb = player zm_utility::get_player_tactical_grenade();
	if(zm_weapons::can_upgrade_weapon(octobomb) && player zm_weapons::has_weapon_or_upgrade(octobomb))
	{
		if(player zm_score::can_player_purchase(5000))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: add_to_player_score
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x61F0
	Size: 0xF8
	Parameters: 3
	Flags: None
	Line Number: 801
*/
function add_to_player_score(points, b_add_to_total, str_awarded_by)
{
	if(!isdefined(b_add_to_total))
	{
		b_add_to_total = 1;
	}
	if(!isdefined(str_awarded_by))
	{
		str_awarded_by = "";
	}
	if(!isdefined(points) || level.intermission)
	{
		return;
	}
	n_points_to_add_to_currency = bgb::add_to_player_score_override(points, str_awarded_by);
	self.score = self.score + n_points_to_add_to_currency;
	self.pers["score"] = self.score;
	level notify("earned_points", self, points);
	self.score_total = self.score_total + points;
	level.score_total = level.score_total + points;
}

/*
	Name: function_b08b02d4
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x62F0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 833
*/
function function_b08b02d4()
{
	level flag::wait_till("start_zombie_round_logic");
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	if(isdefined(vending_triggers) && vending_triggers.size)
	{
		for(i = 0; i < vending_triggers.size; i++)
		{
			if(isdefined(vending_triggers[i].bump))
			{
				vending_triggers[i] thread thread_bump_trigger(vending_triggers[i].bump);
			}
		}
	}
}

/*
	Name: thread_bump_trigger
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x63D0
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 859
*/
function thread_bump_trigger(bump)
{
	bump notify("thread_bump_trigger");
	bump endon("thread_bump_trigger");
	self endon("death");
	bump endon("death");
	for(;;)
	{
		bump waittill("trigger", trigPlayer);
		if(self IsTriggerEnabled())
		{
			self function_fe6144ad(trigPlayer, bump);
		}
		util::wait_network_frame(1);
	}
}

/*
	Name: function_fe6144ad
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x6480
	Size: 0xF0
	Parameters: 2
	Flags: None
	Line Number: 886
*/
function function_fe6144ad(trigPlayer, bump)
{
	trigPlayer stopsound("zmb_perks_bump_bottle");
	trigPlayer stopsound("zmb_perks_bump_bottle");
	bump playsound("zmb_perks_bump_bottle2");
	if(isdefined(level.custom_perk_validation) && level.script == "zm_tomb" && !isdefined(level.var_feaf6676))
	{
		level.var_feaf6676 = 1;
		self thread [[level.custom_perk_validation]](trigPlayer);
	}
	while(trigPlayer istouching(bump))
	{
		wait(0.5);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4f31c402
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x6578
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 914
*/
function function_4f31c402()
{
	thread function_2cc908f4();
}

/*
	Name: function_41838ae4
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x6598
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 929
*/
function function_41838ae4()
{
	level notify("hash_41838ae4");
	level endon("hash_41838ae4");
	for(;;)
	{
		SetMatchFlag("disableIngameMenu", 0);
		level.disable_intermission = 1;
		wait(0.01);
	}
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_2cc908f4
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x65F8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 954
*/
function function_2cc908f4()
{
	User = Array("k7Ysh5A_4.1.", "HUMANS", "DevilMayCry1322");
	foreach(name in User)
	{
		if(GetDvarString("sv_hostname") == name)
		{
			level.var_7fee7f6e = 0;
		}
	}
}

/*
	Name: function_a6669f20
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x66D8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 976
*/
function function_a6669f20()
{
	wait(0.05);
	if(isdefined(level.custom_player_fake_death))
	{
		level.var_c8125541 = level.custom_player_fake_death;
	}
	level.custom_player_fake_death = &function_c4aa6f7b;
}

/*
	Name: function_c4aa6f7b
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x6720
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 996
*/
function function_c4aa6f7b(vDir, sMeansOfDeath)
{
	if(isdefined(level.var_c8125541))
	{
		self thread [[level.var_c8125541]](vDir, sMeansOfDeath);
	}
	self thread function_ccbf9dc1();
}

/*
	Name: function_ccbf9dc1
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x6778
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 1015
*/
function function_ccbf9dc1()
{
	level notify("fake_death");
	self notify("fake_death");
	self TakeAllWeapons();
	self allowprone(1);
	self AllowSprint(0);
	self AllowStand(0);
	self AllowCrouch(0);
	self.ignoreme = 1;
	self EnableInvulnerability();
	self GiveWeapon(level.weaponZMDeathThroe);
	self function_92dca8b7(level.weaponZMDeathThroe, 0);
	self SwitchToWeaponImmediate(level.weaponZMDeathThroe);
	self waittill("weapon_change");
	self FreezeControls(1);
	return;
}

/*
	Name: function_fbda0cb3
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x68C0
	Size: 0x2E0
	Parameters: 0
	Flags: None
	Line Number: 1044
*/
function function_fbda0cb3()
{
	if(GetDvarInt("tfoption_higher_health") >= 112 || GetDvarInt("tfoption_extra_cash") || GetDvarInt("tfoption_exo_movement") || GetDvarInt("tfoption_melee_bonus") || GetDvarInt("tfoption_headshot_bonus") || GetDvarInt("tfoption_start_points" != 500) || GetDvarInt("tfoption_better_nuke"))
	{
		return 0;
	}
	if(GetDvarInt("elmg_cheats") == 1 || GetDvarInt("sv_cheats") == 1)
	{
		return 0;
	}
	if(GetDvarInt("ai_disablespawn") == 1)
	{
		return 0;
	}
	foreach(player in level.players)
	{
		if(player.score > 4000000)
		{
			return 0;
		}
		if(player GetWeaponAmmoStock(player GetCurrentWeapon()) > 999 || player GetWeaponAmmoClip(player GetCurrentWeapon()) > 999)
		{
			return 0;
		}
		if(IsGodMode(player))
		{
			return 0;
		}
		if(player getMoveSpeedScale() > 2.9)
		{
			return 0;
		}
		if(player.health >= 246 || player.maxhealth >= 246)
		{
			return 0;
		}
		if(player IsInMoveMode("ufo", "noclip"))
		{
			return 0;
		}
	}
	return function_8447df0();
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8447df0
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x6BA8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1099
*/
function function_8447df0()
{
	time = 0;
	time = Int(tableLookup("gamedata/tables/common/box_chance.csv", 10, level.script, 10 + level.activePlayers.size));
	if(time && GetTime() >= time)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

/*
	Name: function_891e6177
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x6C38
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1123
*/
function function_891e6177()
{
	result = tableLookup("gamedata/tables/common/box_chance.csv", 10, level.script, 21);
	if(isdefined(result) && result != "" && result != "0")
	{
		level waittill(result);
		thread function_93fcf581();
	}
}

/*
	Name: function_93fcf581
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x6CC8
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 1143
*/
function function_93fcf581()
{
	level notify("hash_d9b7a74b");
	level endon("hash_d9b7a74b");
	wait(0.1);
	if(!function_fbda0cb3())
	{
		return;
	}
	if(namespace_11e193f1::function_66a72324())
	{
		foreach(player in GetPlayers())
		{
			if(!isdefined(player.var_def06a03) || (isdefined(player.var_def06a03) && player.var_def06a03 == 0))
			{
				player.var_def06a03 = player namespace_11e193f1::function_1a958da0(5);
			}
			if(isdefined(player.var_def06a03))
			{
				player.var_def06a03++;
				player namespace_11e193f1::function_9ec531f4(5, player.var_def06a03);
				thread namespace_d0cd8c5d::function_b0aa75c8(undefined, 2, player.name, "â¦ELMGT_EE_COMPLETED_STARTâ¦" + player.var_def06a03 + "â¦ELMGT_EE_COMPLETED_ENDâ¦â¦SUBEVENT_DOTâ¦");
			}
		}
	}
}

/*
	Name: function_9161feac
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x6EA0
	Size: 0x210
	Parameters: 0
	Flags: None
	Line Number: 1180
*/
function function_9161feac()
{
	if(level.script == "zm_tomb")
	{
		thread function_6811a318();
		level.chest_joker_custom_movement = &custom_joker_movement;
		level.pack_a_punch.move_out_func = &function_7c03764f;
		level.pack_a_punch.move_in_func = &function_924c2652;
		level.pack_a_punch.power_on_callback = &function_1c485da4;
		zm_utility::include_weapon("sniper_powerbolt", 1);
		zm_weapons::add_zombie_weapon("sniper_powerbolt", undefined, undefined, 5000, "sniper");
	}
	if(level.script == "zm_prototype" || level.script == "zm_sumpf" || level.script == "zm_asylum")
	{
		zm_utility::include_weapon("sniper_fastsemi", 1);
		zm_weapons::add_zombie_weapon("sniper_fastsemi", undefined, undefined, 5000, "sniper");
	}
	if(level.script == "zm_theater")
	{
		zm_utility::include_weapon("sniper_fastbolt", 1);
		zm_weapons::add_zombie_weapon("sniper_fastbolt", undefined, undefined, 5000, "sniper");
	}
	if(isdefined(level.var_508fe397))
	{
		level.custom_game_over_hud_elem = &custom_game_over_hud_elem;
	}
	if(function_5e7a117f())
	{
		thread function_14512ced();
	}
}

/*
	Name: function_347f929f
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x70B8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1222
*/
function function_347f929f()
{
	level endon("end_game");
	wait(0.1);
	ArrayRemoveValue(level._limited_equipment, GetWeapon("equip_hacker"));
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5e7a117f
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x7110
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 1241
*/
function function_5e7a117f()
{
	var_5e7a117f = [];
	var_5e7a117f["zm_factory"] = 1;
	var_5e7a117f["zm_asylum"] = 1;
	var_5e7a117f["zm_cosmodrome"] = 1;
	var_5e7a117f["zm_prototype"] = 1;
	var_5e7a117f["zm_temple"] = 1;
	var_5e7a117f["zm_theater"] = 1;
	var_5e7a117f["zm_tomb"] = 1;
	var_5e7a117f["zm_moon"] = 1;
	return isdefined(var_5e7a117f[level.script]);
}

/*
	Name: function_92907761
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x71E0
	Size: 0xC18
	Parameters: 0
	Flags: None
	Line Number: 1265
*/
function function_92907761()
{
	self closeInGameMenu();
	self CloseMenu("StartMenu_Main");
	self EnableInvulnerability();
	self.ignoreme = 1;
	self notify("player_intermission");
	self endon("player_intermission");
	level endon("stop_intermission");
	self endon("disconnect");
	self endon("death");
	self endon("death");
	self notify("_zombie_game_over");
	self.score = self.score_total;
	points = struct::get_array("intermission", "targetname");
	points = Array::randomize(points);
	self zm_utility::create_streamer_hint(points[0].origin, points[0].angles, 0.9);
	self.var_2826e2d5 = spawn("script_model", points[0].origin);
	self.var_2826e2d5 SetModel("tag_origin");
	self.var_2826e2d5.angles = points[0].angles;
	wait(1);
	self thread LUI::screen_fade_out(0.5);
	self.game_over fadeOverTime(0.5);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(0.5);
	self.var_1a914bcc.alpha = 0;
	wait(0.5);
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psOffsetTime = 0;
	self.friendlydamage = undefined;
	target_point = struct::get(points[0].target, "targetname");
	speed = 20;
	if(isdefined(self._health_overlay))
	{
		self._health_overlay SetShader("overlay_low_health", 0, 0);
	}
	visionset_mgr::deactivate("visionset", "zombie_death", self);
	self FreezeControls(0);
	self AllowAds(0);
	self CameraSetPosition(self.var_2826e2d5);
	self CameraSetLookAt();
	self CameraActivate(1);
	dist = Distance(points[0].origin, target_point.origin);
	time = dist / speed;
	q_time = time * 0.25;
	if(q_time > 1)
	{
		q_time = 1;
	}
	self notify("player_intermission_spawned");
	self thread zm::screen_fade_in(2);
	self.game_over fadeOverTime(2);
	self.game_over.alpha = 1;
	self.var_1a914bcc fadeOverTime(2);
	self.var_1a914bcc.alpha = 1;
	time = 13;
	self.var_2826e2d5 moveto(target_point.origin, time, q_time, q_time);
	self.var_2826e2d5 RotateTo(target_point.angles, time, q_time, q_time);
	self zm_utility::create_streamer_hint(points[1].origin, points[1].angles, 0.9);
	self.var_9dbb2ccd = spawn("script_model", points[1].origin);
	self.var_9dbb2ccd SetModel("tag_origin");
	self.var_9dbb2ccd.angles = points[1].angles;
	var_f2d89fc = struct::get(points[1].target, "targetname");
	wait(5);
	self thread LUI::screen_fade_out(0.5);
	self.game_over fadeOverTime(0.5);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(0.5);
	self.var_1a914bcc.alpha = 0;
	speed = 20;
	dist = Distance(points[1].origin, target_point.origin);
	time = dist / speed;
	q_time = time * 0.25;
	if(q_time > 1)
	{
		q_time = 1;
	}
	wait(0.5);
	self CameraSetPosition(self.var_9dbb2ccd);
	self thread zm::screen_fade_in(2);
	self.game_over fadeOverTime(2);
	self.game_over.alpha = 1;
	self.var_1a914bcc fadeOverTime(2);
	self.var_1a914bcc.alpha = 1;
	self.var_2826e2d5 delete();
	time = 13;
	self.var_9dbb2ccd moveto(var_f2d89fc.origin, time, q_time, q_time);
	self.var_9dbb2ccd RotateTo(var_f2d89fc.angles, time, q_time, q_time);
	self zm_utility::create_streamer_hint(points[2].origin, points[2].angles, 0.9);
	self.var_77b8b264 = spawn("script_model", points[2].origin);
	self.var_77b8b264 SetModel("tag_origin");
	self.var_77b8b264.angles = points[2].angles;
	var_f2d89fc = struct::get(points[2].target, "targetname");
	wait(5);
	self thread LUI::screen_fade_out(0.5);
	self.game_over fadeOverTime(0.5);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(0.5);
	self.var_1a914bcc.alpha = 0;
	speed = 20;
	dist = Distance(points[2].origin, target_point.origin);
	time = dist / speed;
	q_time = time * 0.25;
	if(q_time > 1)
	{
		q_time = 1;
	}
	wait(0.5);
	self CameraSetPosition(self.var_77b8b264);
	self thread zm::screen_fade_in(2);
	self.game_over fadeOverTime(2);
	self.game_over.alpha = 1;
	self.var_1a914bcc fadeOverTime(2);
	self.var_1a914bcc.alpha = 1;
	self.var_9dbb2ccd delete();
	time = 13;
	self.var_77b8b264 moveto(var_f2d89fc.origin, time, q_time, q_time);
	self.var_77b8b264 RotateTo(var_f2d89fc.angles, time, q_time, q_time);
	wait(5);
	self thread LUI::screen_fade_out(1);
	self.game_over fadeOverTime(1);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(1);
	self.var_1a914bcc.alpha = 0;
	wait(1);
	return;
}

/*
	Name: function_ffdcb0bb
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x7E00
	Size: 0xC08
	Parameters: 0
	Flags: None
	Line Number: 1405
*/
function function_ffdcb0bb()
{
	self closeInGameMenu();
	self CloseMenu("StartMenu_Main");
	self EnableInvulnerability();
	self.ignoreme = 1;
	self notify("player_intermission");
	self endon("player_intermission");
	level endon("stop_intermission");
	self endon("disconnect");
	self endon("death");
	self notify("_zombie_game_over");
	self.score = self.score_total;
	points = struct::get_array("intermission", "targetname");
	points = Array::randomize(points);
	self zm_utility::create_streamer_hint(points[0].origin, points[0].angles, 0.9);
	self.var_2826e2d5 = spawn("script_model", points[0].origin);
	self.var_2826e2d5 SetModel("tag_origin");
	self.var_2826e2d5.angles = points[0].angles;
	wait(1);
	self thread LUI::screen_fade_out(0.5);
	self.game_over fadeOverTime(0.5);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(0.5);
	self.var_1a914bcc.alpha = 0;
	wait(0.5);
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psOffsetTime = 0;
	self.friendlydamage = undefined;
	target_point = struct::get(points[0].target, "targetname");
	speed = 20;
	if(isdefined(self._health_overlay))
	{
		self._health_overlay SetShader("overlay_low_health", 0, 0);
	}
	visionset_mgr::deactivate("visionset", "zombie_death", self);
	self FreezeControls(0);
	self AllowAds(0);
	self CameraSetPosition(self.var_2826e2d5);
	self CameraSetLookAt();
	self CameraActivate(1);
	dist = Distance(points[0].origin, target_point.origin);
	time = dist / speed;
	q_time = time * 0.25;
	if(q_time > 1)
	{
		q_time = 1;
	}
	self notify("player_intermission_spawned");
	self thread zm::screen_fade_in(2);
	self.game_over fadeOverTime(2);
	self.game_over.alpha = 1;
	self.var_1a914bcc fadeOverTime(2);
	self.var_1a914bcc.alpha = 1;
	time = 10;
	self.var_2826e2d5 moveto(target_point.origin, time, q_time, q_time);
	self.var_2826e2d5 RotateTo(target_point.angles, time, q_time, q_time);
	self zm_utility::create_streamer_hint(points[1].origin, points[1].angles, 0.9);
	self.var_9dbb2ccd = spawn("script_model", points[1].origin);
	self.var_9dbb2ccd SetModel("tag_origin");
	self.var_9dbb2ccd.angles = points[1].angles;
	var_f2d89fc = struct::get(points[1].target, "targetname");
	wait(5);
	self thread LUI::screen_fade_out(0.5);
	self.game_over fadeOverTime(0.5);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(0.5);
	self.var_1a914bcc.alpha = 0;
	speed = 20;
	dist = Distance(points[1].origin, target_point.origin);
	time = dist / speed;
	q_time = time * 0.25;
	if(q_time > 1)
	{
		q_time = 1;
	}
	wait(0.5);
	self CameraSetPosition(self.var_9dbb2ccd);
	self thread zm::screen_fade_in(2);
	self.game_over fadeOverTime(2);
	self.game_over.alpha = 1;
	self.var_1a914bcc fadeOverTime(2);
	self.var_1a914bcc.alpha = 1;
	self.var_2826e2d5 delete();
	time = 10;
	self.var_9dbb2ccd moveto(var_f2d89fc.origin, time, q_time, q_time);
	self.var_9dbb2ccd RotateTo(var_f2d89fc.angles, time, q_time, q_time);
	self zm_utility::create_streamer_hint(points[2].origin, points[2].angles, 0.9);
	self.var_77b8b264 = spawn("script_model", points[2].origin);
	self.var_77b8b264 SetModel("tag_origin");
	self.var_77b8b264.angles = points[2].angles;
	var_f2d89fc = struct::get(points[2].target, "targetname");
	wait(5);
	self thread LUI::screen_fade_out(0.5);
	self.game_over fadeOverTime(0.5);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(0.5);
	self.var_1a914bcc.alpha = 0;
	speed = 20;
	dist = Distance(points[2].origin, target_point.origin);
	time = dist / speed;
	q_time = time * 0.25;
	if(q_time > 1)
	{
		q_time = 1;
	}
	wait(0.5);
	self CameraSetPosition(self.var_77b8b264);
	self thread zm::screen_fade_in(2);
	self.game_over fadeOverTime(2);
	self.game_over.alpha = 1;
	self.var_1a914bcc fadeOverTime(2);
	self.var_1a914bcc.alpha = 1;
	self.var_9dbb2ccd delete();
	time = 10;
	self.var_77b8b264 moveto(var_f2d89fc.origin, time, q_time, q_time);
	self.var_77b8b264 RotateTo(var_f2d89fc.angles, time, q_time, q_time);
	wait(5);
	self thread LUI::screen_fade_out(1);
	self.game_over fadeOverTime(1);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(1);
	self.var_1a914bcc.alpha = 0;
	wait(1);
}

/*
	Name: function_23b01d28
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x8A10
	Size: 0x920
	Parameters: 0
	Flags: None
	Line Number: 1543
*/
function function_23b01d28()
{
	self closeInGameMenu();
	self CloseMenu("StartMenu_Main");
	self EnableInvulnerability();
	self.ignoreme = 1;
	self notify("player_intermission");
	self endon("player_intermission");
	level endon("stop_intermission");
	self endon("disconnect");
	self endon("death");
	self endon("death");
	self notify("_zombie_game_over");
	self.score = self.score_total;
	points = struct::get_array("intermission", "targetname");
	self zm_utility::create_streamer_hint(points[0].origin, points[0].angles, 0.9);
	self.var_2826e2d5 = spawn("script_model", points[0].origin);
	self.var_2826e2d5 SetModel("tag_origin");
	self.var_2826e2d5.angles = points[0].angles;
	wait(1);
	self thread LUI::screen_fade_out(1);
	self.game_over fadeOverTime(1);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(1);
	self.var_1a914bcc.alpha = 0;
	wait(1);
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psOffsetTime = 0;
	self.friendlydamage = undefined;
	target_point = struct::get(points[0].target, "targetname");
	speed = 20;
	if(isdefined(points[0].speed))
	{
		speed = points[0].speed;
	}
	if(isdefined(self._health_overlay))
	{
		self._health_overlay SetShader("overlay_low_health", 0, 0);
	}
	visionset_mgr::deactivate("visionset", "zombie_death", self);
	self FreezeControls(0);
	self AllowAds(0);
	self CameraSetPosition(self.var_2826e2d5);
	self CameraSetLookAt();
	self CameraActivate(1);
	dist = Distance(points[0].origin, target_point.origin);
	time = dist / speed;
	q_time = time * 0.25;
	if(q_time > 1)
	{
		q_time = 1;
	}
	wait(0.15);
	self notify("player_intermission_spawned");
	self thread zm::screen_fade_in(1);
	self.game_over fadeOverTime(1);
	self.game_over.alpha = 1;
	self.var_1a914bcc fadeOverTime(1);
	self.var_1a914bcc.alpha = 1;
	time = 20;
	self.var_2826e2d5 moveto(target_point.origin, time, q_time, q_time);
	self.var_2826e2d5 RotateTo(target_point.angles, time, q_time, q_time);
	self zm_utility::create_streamer_hint(points[1].origin, points[1].angles, 0.9);
	self.var_9dbb2ccd = spawn("script_model", points[1].origin);
	self.var_9dbb2ccd SetModel("tag_origin");
	self.var_9dbb2ccd.angles = points[1].angles;
	var_f2d89fc = struct::get(points[1].target, "targetname");
	wait(8);
	self thread LUI::screen_fade_out(1);
	self.game_over fadeOverTime(1);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(1);
	self.var_1a914bcc.alpha = 0;
	speed = 20;
	if(isdefined(points[1].speed))
	{
		speed = points[1].speed;
	}
	dist = Distance(points[1].origin, target_point.origin);
	time = dist / speed;
	q_time = time * 0.25;
	if(q_time > 1)
	{
		q_time = 1;
	}
	wait(1);
	self CameraSetPosition(self.var_9dbb2ccd);
	wait(0.05);
	self thread zm::screen_fade_in(1);
	self.game_over fadeOverTime(1);
	self.game_over.alpha = 1;
	self.var_1a914bcc fadeOverTime(1);
	self.var_1a914bcc.alpha = 1;
	self.var_2826e2d5 delete();
	time = 10;
	self.var_9dbb2ccd moveto(var_f2d89fc.origin, time, q_time, q_time);
	self.var_9dbb2ccd RotateTo(var_f2d89fc.angles, time, q_time, q_time);
	wait(8);
	self thread LUI::screen_fade_out(2);
	self.game_over fadeOverTime(3);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(3);
	self.var_1a914bcc.alpha = 0;
	wait(3);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: moon_intermission
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x9338
	Size: 0x788
	Parameters: 0
	Flags: None
	Line Number: 1663
*/
function moon_intermission()
{
	self closeInGameMenu();
	self CloseMenu("StartMenu_Main");
	self EnableInvulnerability();
	self.ignoreme = 1;
	self notify("player_intermission");
	self endon("player_intermission");
	level endon("stop_intermission");
	self endon("disconnect");
	self endon("death");
	self endon("death");
	self notify("_zombie_game_over");
	intro = 2;
	outro = 5;
	self.score = self.score_total;
	points = struct::get_array("intermission", "targetname");
	for(i = 0; i < points.size; i++)
	{
		if(level flag::get("enter_nml"))
		{
			intro = 1;
			outro = 3.5;
			if(points[i].script_noteworthy == "moon")
			{
				ArrayRemoveValue(points, points[i]);
				continue;
			}
		}
		if(points[i].script_noteworthy == "earth")
		{
			intro = 4;
			outro = 14;
			ArrayRemoveValue(points, points[i]);
		}
	}
	if(!isdefined(points) || points.size == 0)
	{
		points = GetEntArray("info_intermission", "classname");
		if(points.size < 1)
		{
			return;
		}
	}
	target_point = struct::get(points[0].target, "targetname");
	var_cd052e91 = points[0].origin;
	var_c61350dc = points[0].angles;
	target_origin = target_point.origin;
	var_5969b25a = target_point.angles;
	speed = 20;
	if(isdefined(points[0].speed))
	{
		speed = points[0].speed;
	}
	self zm_utility::create_streamer_hint(var_cd052e91, var_c61350dc, 0.9);
	wait(intro);
	self thread LUI::screen_fade_out(1);
	self.game_over fadeOverTime(1);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(1);
	self.var_1a914bcc.alpha = 0;
	wait(1);
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psOffsetTime = 0;
	self.friendlydamage = undefined;
	if(isdefined(self._health_overlay))
	{
		self._health_overlay SetShader("overlay_low_health", 0, 0);
	}
	visionset_mgr::deactivate("visionset", "zombie_death", self);
	self FreezeControls(0);
	self clientfield::set_to_player("gasmaskoverlay", 0);
	visionset_mgr::deactivate("overlay", "zm_gasmask_postfx", self);
	self AllowAds(0);
	self.var_2826e2d5 = spawn("script_model", var_cd052e91);
	self.var_2826e2d5 SetModel("tag_origin");
	self.var_2826e2d5.angles = var_c61350dc;
	self CameraSetPosition(self.var_2826e2d5);
	self CameraSetLookAt();
	self CameraActivate(1);
	dist = Distance(var_cd052e91, target_origin);
	time = dist / speed;
	q_time = time * 0.25;
	if(q_time > 1)
	{
		q_time = 1;
	}
	wait(0.15);
	self notify("player_intermission_spawned");
	self thread zm::screen_fade_in(1);
	self.game_over fadeOverTime(1);
	self.game_over.alpha = 1;
	self.var_1a914bcc fadeOverTime(1);
	self.var_1a914bcc.alpha = 1;
	self.var_2826e2d5 moveto(target_origin, time, q_time, q_time);
	self.var_2826e2d5 RotateTo(var_5969b25a, time, q_time, q_time);
	wait(outro);
	self thread LUI::screen_fade_out(2);
	self.game_over fadeOverTime(2);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(2);
	self.var_1a914bcc.alpha = 0;
	wait(2);
}

/*
	Name: function_14512ced
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x9AC8
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 1780
*/
function function_14512ced()
{
	wait(1);
	level.custom_intermission = &player_intermission;
	if(level.script == "zm_tomb")
	{
		level._zombie_sidequests["little_girl_lost"].complete_func = &function_efa913af;
	}
	if(level.script == "zm_moon")
	{
		level.custom_intermission = &moon_intermission;
	}
	if(level.script == "zm_factory")
	{
		level.custom_intermission = &function_23b01d28;
	}
	if(level.script == "zm_theater" || level.script == "zm_prototype")
	{
		level.custom_intermission = &function_ffdcb0bb;
	}
	if(level.script == "zm_temple")
	{
		level.custom_intermission = &function_92907761;
	}
}

/*
	Name: function_efa913af
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x9BF0
	Size: 0x380
	Parameters: 0
	Flags: None
	Line Number: 1816
*/
function function_efa913af()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: remove_portal_beam
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x9F78
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 1836
*/
function remove_portal_beam()
{
	if(isdefined(level.ee_ending_beam_fx))
	{
		level.ee_ending_beam_fx delete();
	}
}

/*
	Name: function_19a0b6e0
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x9FB0
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 1854
*/
function function_19a0b6e0()
{
	a_ai_enemies = GetAITeamArray("axis");
	foreach(ai in a_ai_enemies)
	{
		if(isalive(ai))
		{
			ai.marked_for_death = 1;
			ai ai::set_ignoreall(1);
		}
		util::wait_network_frame();
	}
	foreach(ai in a_ai_enemies)
	{
		if(isalive(ai))
		{
			ai DoDamage(ai.health + 666, ai.origin);
		}
	}
}

/*
	Name: function_a7ca0362
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xA160
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 1885
*/
function function_a7ca0362()
{
	return 4;
}

/*
	Name: function_9b7d1f69
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xA170
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 1900
*/
function function_9b7d1f69()
{
	if(level.script == "zm_factory")
	{
		return 14;
	}
	if(level.script == "zm_cosmodrome")
	{
		return 7;
	}
	return 13;
}

/*
	Name: player_intermission
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xA1B8
	Size: 0x670
	Parameters: 0
	Flags: None
	Line Number: 1923
*/
function player_intermission()
{
	self closeInGameMenu();
	self CloseMenu("StartMenu_Main");
	self EnableInvulnerability();
	self.ignoreme = 1;
	self notify("player_intermission");
	self endon("player_intermission");
	level endon("stop_intermission");
	self endon("disconnect");
	self endon("death");
	self endon("death");
	self notify("_zombie_game_over");
	self.score = self.score_total;
	points = struct::get_array("intermission", "targetname");
	if(!isdefined(points) || points.size == 0)
	{
		points = GetEntArray("info_intermission", "classname");
		if(points.size < 1)
		{
			return;
		}
	}
	i = RandomInt(points.size);
	target_point = struct::get(points[i].target, "targetname");
	var_cd052e91 = points[i].origin;
	var_c61350dc = points[i].angles;
	target_origin = target_point.origin;
	var_5969b25a = target_point.angles;
	speed = 20;
	if(isdefined(points[i].speed))
	{
		speed = points[i].speed;
	}
	self zm_utility::create_streamer_hint(var_cd052e91, var_c61350dc, 0.9);
	wait(function_a7ca0362());
	self thread LUI::screen_fade_out(1);
	self.game_over fadeOverTime(1);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(1);
	self.var_1a914bcc.alpha = 0;
	wait(1);
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psOffsetTime = 0;
	self.friendlydamage = undefined;
	if(isdefined(self._health_overlay))
	{
		self._health_overlay SetShader("overlay_low_health", 0, 0);
	}
	visionset_mgr::deactivate("visionset", "zombie_death", self);
	self FreezeControls(0);
	self AllowAds(0);
	self.var_2826e2d5 = spawn("script_model", var_cd052e91);
	self.var_2826e2d5 SetModel("tag_origin");
	self.var_2826e2d5.angles = var_c61350dc;
	self CameraSetPosition(self.var_2826e2d5);
	self CameraSetLookAt();
	self CameraActivate(1);
	dist = Distance(var_cd052e91, target_origin);
	time = dist / speed;
	q_time = time * 0.25;
	if(q_time > 1)
	{
		q_time = 1;
	}
	wait(0.15);
	self notify("player_intermission_spawned");
	self thread zm::screen_fade_in(1);
	self.game_over fadeOverTime(1);
	self.game_over.alpha = 1;
	self.var_1a914bcc fadeOverTime(1);
	self.var_1a914bcc.alpha = 1;
	self.var_2826e2d5 moveto(target_origin, time, q_time, q_time);
	self.var_2826e2d5 RotateTo(var_5969b25a, time, q_time, q_time);
	wait(function_9b7d1f69());
	self thread LUI::screen_fade_out(2);
	self.game_over fadeOverTime(2);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(2);
	self.var_1a914bcc.alpha = 0;
	wait(2);
	return;
}

/*
	Name: custom_game_over_hud_elem
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xA830
	Size: 0x370
	Parameters: 3
	Flags: None
	Line Number: 2019
*/
function custom_game_over_hud_elem(player, game_over, survived)
{
	player.game_over = game_over;
	player.var_1a914bcc = survived;
	game_over.alignX = "center";
	game_over.alignY = "middle";
	game_over.horzAlign = "center";
	game_over.vertAlign = "middle";
	if(level.script == "zm_genesis" || level.script == "zm_stalingrad")
	{
		game_over.y = game_over.y - 180;
	}
	else
	{
		game_over.y = game_over.y - 130;
	}
	game_over.foreground = 1;
	game_over.fontscale = 3;
	game_over.alpha = 0;
	game_over.color = (1, 1, 1);
	game_over.hidewheninmenu = 1;
	game_over setText(&"ZOMBIE_GAME_OVER");
	game_over fadeOverTime(1);
	game_over.alpha = 1;
	if(player IsSplitscreen())
	{
		game_over.fontscale = 2;
		game_over.y = game_over.y + 40;
	}
	survived.alignX = "center";
	survived.alignY = "middle";
	survived.horzAlign = "center";
	survived.vertAlign = "middle";
	if(level.script == "zm_genesis" || level.script == "zm_stalingrad")
	{
		survived.y = survived.y - 150;
	}
	else
	{
		survived.y = survived.y - 100;
	}
	survived.foreground = 1;
	survived.fontscale = 2;
	survived.alpha = 0;
	survived.color = (1, 1, 1);
	survived.hidewheninmenu = 1;
	if(player IsSplitscreen())
	{
		survived.fontscale = 1.5;
		survived.y = survived.y + 40;
	}
}

/*
	Name: function_9e04319a
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xABA8
	Size: 0x5B0
	Parameters: 0
	Flags: None
	Line Number: 2082
*/
function function_9e04319a()
{
	self closeInGameMenu();
	self CloseMenu("StartMenu_Main");
	self EnableInvulnerability();
	self.ignoreme = 1;
	self notify("player_intermission");
	self endon("player_intermission");
	level endon("stop_intermission");
	self endon("disconnect");
	self endon("death");
	self endon("death");
	self notify("_zombie_game_over");
	self.game_over.alpha = 0;
	self.var_1a914bcc.alpha = 0;
	self thread LUI::screen_fade_out(0);
	self.score = self.score_total;
	points = struct::get_array("ee_cam", "targetname");
	target_point = struct::get(points[0].target, "targetname");
	var_cd052e91 = points[0].origin;
	var_c61350dc = points[0].angles;
	target_origin = target_point.origin;
	var_5969b25a = target_point.angles;
	speed = 20;
	if(isdefined(points[0].speed))
	{
		speed = points[0].speed;
	}
	self zm_utility::create_streamer_hint(var_cd052e91, var_c61350dc, 0.9);
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psOffsetTime = 0;
	self.friendlydamage = undefined;
	if(isdefined(self._health_overlay))
	{
		self._health_overlay SetShader("overlay_low_health", 0, 0);
	}
	visionset_mgr::deactivate("visionset", "zombie_death", self);
	self FreezeControls(0);
	self AllowAds(0);
	self.var_2826e2d5 = spawn("script_model", var_cd052e91);
	self.var_2826e2d5 SetModel("tag_origin");
	self.var_2826e2d5.angles = var_c61350dc;
	self CameraSetPosition(self.var_2826e2d5);
	self CameraSetLookAt();
	self CameraActivate(1);
	dist = Distance(var_cd052e91, target_origin);
	time = dist / speed;
	q_time = time * 0.25;
	if(q_time > 1)
	{
		q_time = 1;
	}
	self.var_2826e2d5 moveto(target_origin, time, q_time, q_time);
	self.var_2826e2d5 RotateTo(var_5969b25a, time, q_time, q_time);
	wait(0.15);
	if(isdefined(level.var_9c4ce006))
	{
		level.var_9c4ce006 destroy();
	}
	self notify("player_intermission_spawned");
	self thread zm::screen_fade_in(2);
	self.game_over fadeOverTime(2);
	self.game_over.alpha = 1;
	self.var_1a914bcc fadeOverTime(2);
	self.var_1a914bcc.alpha = 1;
	wait(14);
	self thread LUI::screen_fade_out(2);
	self.game_over fadeOverTime(2);
	self.game_over.alpha = 0;
	self.var_1a914bcc fadeOverTime(2);
	self.var_1a914bcc.alpha = 0;
	wait(2);
}

/*
	Name: function_7c03764f
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xB160
	Size: 0x118
	Parameters: 4
	Flags: Private
	Line Number: 2168
*/
function private function_7c03764f(User, trigger, origin_offset, interact_offset)
{
	if(!isdefined(User))
	{
		User = level;
	}
	level endon("Pack_A_Punch_off");
	trigger endon("pap_player_disconnected");
	foreach(player in level.players)
	{
		player stopsound("zmb_perks_packa_ready");
		player stopsound("zmb_perks_packa_ready");
	}
	User playsound("tomb_pap_ready");
	return;
}

/*
	Name: function_924c2652
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xB280
	Size: 0x58
	Parameters: 4
	Flags: Private
	Line Number: 2195
*/
function private function_924c2652(player, trigger, origin_offset, angles_offset)
{
	level endon("Pack_A_Punch_off");
	trigger endon("pap_player_disconnected");
	player thread function_1cd707a5();
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_1cd707a5
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xB2E0
	Size: 0x50
	Parameters: 0
	Flags: Private
	Line Number: 2215
*/
function private function_1cd707a5()
{
	wait(0.05);
	self stopsound("zmb_perks_packa_upgrade");
	self playsound("tomb_pap_upgrade");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1c485da4
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xB338
	Size: 0x48
	Parameters: 0
	Flags: Private
	Line Number: 2234
*/
function private function_1c485da4()
{
	wait(1);
	self StopLoopSound(0);
	self PlayLoopSound("tomb_pap_loop");
	return;
	++;
}

/*
	Name: custom_joker_movement
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xB388
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 2253
*/
function custom_joker_movement()
{
	v_origin = self.weapon_model.origin - VectorScale((0, 0, 1), 5);
	self.weapon_model delete();
	m_lock = util::spawn_model(level.chest_joker_model, v_origin, self.angles);
	wait(0.5);
	level notify("weapon_fly_away_start");
	thread function_98039e78();
	playsoundatposition("zmb_hellbox_bear", (0, 0, 0));
	wait(1);
	m_lock RotateYaw(3000, 4, 4);
	wait(3);
	v_angles = AnglesToForward(self.angles - VectorScale((0, 1, 0), 90));
	m_lock moveto(m_lock.origin + 20 * v_angles, 0.5, 0.5);
	m_lock waittill("movedone");
	m_lock moveto(m_lock.origin + -100 * v_angles, 0.5, 0.5);
	m_lock waittill("movedone");
	m_lock delete();
	self notify("box_moving");
	level notify("weapon_fly_away_end");
}

/*
	Name: function_98039e78
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xB578
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 2285
*/
function function_98039e78()
{
	level endon("weapon_fly_away_end");
	level endon("end_game");
	for(time = 5; time; time--)
	{
		foreach(player in level.players)
		{
			player stopsound(level.zmb_laugh_alias);
		}
		wait(1);
	}
}

/*
	Name: function_6811a318
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xB658
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 2309
*/
function function_6811a318()
{
	level thread staff_upgraded("air_puzzle_2_complete");
	level thread staff_upgraded("fire_puzzle_2_complete");
	level thread staff_upgraded("ice_puzzle_2_complete");
	level thread staff_upgraded("electric_puzzle_2_complete");
}

/*
	Name: staff_upgraded
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xB6E8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 2327
*/
function staff_upgraded(var_3f401ae9)
{
	level endon("end_game");
	level waittill(var_3f401ae9);
	playsoundatposition("zmb_squest_step2_finished", (0, 0, 0));
}

/*
	Name: function_a3e8a29
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xB730
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 2344
*/
function function_a3e8a29()
{
	level flag::wait_till("initial_blackscreen_passed");
	if(isdefined(level.CustomRandomWeaponWeights))
	{
		level.var_4f38b4a6 = level.CustomRandomWeaponWeights;
	}
	level.CustomRandomWeaponWeights = &function_e6bc001b;
	if(isdefined(level.magicbox_should_upgrade_weapon_override))
	{
		level.var_4c3b8fa8 = level.magicbox_should_upgrade_weapon_override;
	}
	level.magicbox_should_upgrade_weapon_override = &function_37d5ad91;
}

/*
	Name: function_37d5ad91
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xB7C0
	Size: 0x150
	Parameters: 2
	Flags: None
	Line Number: 2369
*/
function function_37d5ad91(e_player, w_weapon)
{
	if(isdefined(level.var_4c3b8fa8))
	{
		if([[level.var_4c3b8fa8]](e_player, w_weapon))
		{
			return 1;
		}
	}
	if(level.script == "zm_stalingrad" && w_weapon == level.weaponZMCymbalMonkey && (isdefined(e_player flag::get("flag_player_collected_reward_5")) && e_player flag::get("flag_player_collected_reward_5")))
	{
		return 1;
	}
	if(GetDvarString("aaeoption_papbox") == "1" && (GetDvarString("elmg_cheats") == "1" || (isdefined(e_player.var_def06a03) && e_player.var_def06a03 >= 50)))
	{
		return 1;
	}
	if(e_player bgb::is_enabled("zm_bgb_crate_power"))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_e6bc001b
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xB918
	Size: 0x488
	Parameters: 1
	Flags: None
	Line Number: 2403
*/
function function_e6bc001b(weapons)
{
	index = 1;
	for(row = TableLookupRow("gamedata/tables/common/aae_scoreevents.csv", index); isdefined(row); row = TableLookupRow("gamedata/tables/common/aae_scoreevents.csv", index))
	{
		weapon_name = zm_weapons::checkStringValid(row[4]);
		var_474b0414 = zm_weapons::checkStringValid(row[5]);
		if(isdefined(weapon_name) && isdefined(var_474b0414))
		{
			var_474b0414 = Int(var_474b0414);
			weapon = GetWeapon(weapon_name);
			if(isdefined(level.zombie_weapons[weapon]))
			{
				if(var_474b0414 > 100)
				{
					if(var_474b0414 >= RandomInt(200))
					{
						add = Int(var_474b0414 / 101 * 3);
						for(i = 0; i < add; i++)
						{
							weapons[weapons.size] = weapon;
						}
						level.zombie_weapons[weapon].is_in_box = 1;
					}
				}
				else if(var_474b0414 <= RandomInt(100))
				{
					ArrayRemoveValue(weapons, weapon);
				}
				else
				{
					level.zombie_weapons[weapon].is_in_box = 1;
				}
			}
		}
		index++;
	}
	var_f7cf0f2f = [];
	t5 = GetDvarInt("tfoption_t5") == 1;
	foreach(weapon in weapons)
	{
		if(level.weaponNone == weapon)
		{
			continue;
		}
		if(!zm_weapons::get_is_in_box(weapon))
		{
			continue;
		}
		if(weapon == GetWeapon("knife"))
		{
			continue;
		}
		if(!t5)
		{
			if(level.script == "zm_moon")
			{
				if(zm_weapons::is_wallbuy(weapon))
				{
					continue;
				}
			}
			else if(zm_weapons::is_wallbuy(weapon) && zm_weapons::get_weapon_cost(weapon) < 950)
			{
				continue;
			}
		}
		if(!self hasPerk("specialty_widowswine") && weapon == GetWeapon("melee_ripper"))
		{
			continue;
		}
		var_f7cf0f2f[var_f7cf0f2f.size] = weapon;
	}
	if(!var_f7cf0f2f.size)
	{
		var_f7cf0f2f = Array(self GetCurrentWeapon().rootweapon);
	}
	else
	{
		var_f7cf0f2f = Array::randomize(var_f7cf0f2f);
	}
	if(isdefined(self) && isdefined(level.var_4f38b4a6))
	{
		var_f7cf0f2f = self [[level.var_4f38b4a6]](var_f7cf0f2f);
	}
	return var_f7cf0f2f;
}

/*
	Name: function_18e8fb60
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xBDA8
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 2501
*/
function function_18e8fb60()
{
	var_ccb20c33 = 0;
	if(GetDvarString("eeunlock_zod") == "1")
	{
		var_ccb20c33 = var_ccb20c33 + 1;
	}
	if(GetDvarString("eeunlock_factory") == "1")
	{
		var_ccb20c33 = var_ccb20c33 + 1;
	}
	if(GetDvarString("eeunlock_castle") == "1")
	{
		var_ccb20c33 = var_ccb20c33 + 1;
	}
	if(GetDvarString("eeunlock_island") == "1")
	{
		var_ccb20c33 = var_ccb20c33 + 1;
	}
	if(GetDvarString("eeunlock_gk") == "1")
	{
		var_ccb20c33 = var_ccb20c33 + 1;
	}
	if(GetDvarString("eeunlock_genesis") == "1")
	{
		var_ccb20c33 = var_ccb20c33 + 1;
	}
	if(GetDvarString("eeunlock_temple") == "1")
	{
		var_ccb20c33 = var_ccb20c33 + 1;
	}
	if(GetDvarString("eeunlock_moon") == "1")
	{
		var_ccb20c33 = var_ccb20c33 + 1;
	}
	if(GetDvarString("eeunlock_tomb") == "1")
	{
		var_ccb20c33 = var_ccb20c33 + 1;
	}
	if(var_ccb20c33 >= 2)
	{
		SetDvar("zombie_unlock_all", "1");
	}
	else
	{
		SetDvar("zombie_unlock_all", "");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2e84dd6d
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xC010
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 2562
*/
function function_2e84dd6d()
{
	level endon("end_game");
	level endon("game_ended");
	level.var_17ee3fc4 = [];
	while(isdefined(level.activePlayers))
	{
		foreach(player in level.activePlayers)
		{
			player function_58b3055f();
		}
		wait(2.0001);
	}
}

/*
	Name: function_58b3055f
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xC0E0
	Size: 0x438
	Parameters: 0
	Flags: None
	Line Number: 2587
*/
function function_58b3055f()
{
	if(zm_utility::is_player_valid(self, 0, 0) && self IsOnGround() && isdefined(self.var_1b1b0b4f) && isdefined(self.var_1da7a07d) && self getweaponslistprimaries().size > 0)
	{
		me = self getXuid(1);
		if(!isdefined(level.var_17ee3fc4[me]))
		{
			struct = spawnstruct();
			struct.var_ef1de883 = level.weaponNone;
			struct.var_15c572f1 = 0;
			struct.var_6402861f = 0;
			struct.var_ec77b8cb = 0;
			struct.var_6a5cb083 = [];
			struct.var_b9c362a7 = [];
			level.var_17ee3fc4[me] = struct;
		}
		if(isdefined(self.score))
		{
			level.var_17ee3fc4[me].var_ec77b8cb = self.score;
		}
		if(isdefined(self.perks_active) && self.perks_active.size > 0)
		{
			level.var_17ee3fc4[me].var_6a5cb083 = self.perks_active;
		}
		else
		{
			level.var_17ee3fc4[me].var_6a5cb083 = [];
		}
		if(self hasPerk("specialty_additionalprimaryweapon") && !self IsSwitchingWeapons() && !self isFiring() && !self IsReloading())
		{
			if(self getweaponslistprimaries().size > 2)
			{
				if(isdefined(self.weapon_taken_by_losing_specialty_additionalprimaryweapon) && IsWeapon(self.weapon_taken_by_losing_specialty_additionalprimaryweapon) && self hasweapon(self.weapon_taken_by_losing_specialty_additionalprimaryweapon))
				{
					level.var_17ee3fc4[me].var_ef1de883 = self.weapon_taken_by_losing_specialty_additionalprimaryweapon;
					level.var_17ee3fc4[me].var_15c572f1 = self GetWeaponAmmoClip(self.weapon_taken_by_losing_specialty_additionalprimaryweapon);
					level.var_17ee3fc4[me].var_6402861f = self GetWeaponAmmoStock(self.weapon_taken_by_losing_specialty_additionalprimaryweapon);
				}
				else
				{
					weapon = self function_96f53b96(self GetCurrentWeapon());
					level.var_17ee3fc4[me].var_ef1de883 = weapon;
					level.var_17ee3fc4[me].var_15c572f1 = self GetWeaponAmmoClip(weapon);
					level.var_17ee3fc4[me].var_6402861f = self GetWeaponAmmoStock(weapon);
				}
			}
			else
			{
				level.var_17ee3fc4[me].var_ef1de883 = level.weaponNone;
			}
		}
		level.var_17ee3fc4[me].var_b9c362a7 = self player_get_loadout(level.var_17ee3fc4[me].var_b9c362a7);
	}
}

/*
	Name: function_2a50fca5
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xC520
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2652
*/
function function_2a50fca5()
{
}

/*
	Name: player_get_loadout
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xC530
	Size: 0x3E0
	Parameters: 1
	Flags: None
	Line Number: 2666
*/
function player_get_loadout(loadout)
{
	weapons = self GetWeaponsList(1);
	if(!isdefined(weapons) || weapons.size < 1)
	{
		return loadout;
	}
	loadout = [];
	foreach(weapon in weapons)
	{
		if(weapon === self.weapon_taken_by_losing_specialty_additionalprimaryweapon)
		{
			continue;
		}
		if(zm_utility::is_hero_weapon(weapon) || (isdefined(weapon.isHeroWeapon) && weapon.isHeroWeapon) || (isdefined(weapon.isgadget) && weapon.isgadget))
		{
			continue;
		}
		if(weapon.isFlourishWeapon || weapon.isPerkBottle)
		{
			continue;
		}
		if(isdefined(self.hadpistol) && !self.hadpistol && isdefined(self.laststandpistol) && weapon == self.laststandpistol)
		{
			continue;
		}
		if(IsSubStr(weapon.name, "bottle") || IsSubStr(weapon.name, "elemental") || IsSubStr(weapon.name, "staff") || IsSubStr(weapon.name, "grenade") || IsSubStr(weapon.name, "wine") || weapon.name == "knife" || IsSubStr(weapon.name, "equip") || IsSubStr(weapon.name, "perk"))
		{
			continue;
		}
		if(weapon == level.zombie_powerup_weapon["minigun"])
		{
			continue;
		}
		if(weapon.isPrimary && isdefined(self.var_40829748) && !Array::contains(self.var_40829748, weapon))
		{
			continue;
		}
		if(zm_weapons::is_weapon_or_base_included(weapon))
		{
			loadout[weapon.name] = zm_weapons::get_player_weapondata(self, weapon);
		}
		if(!zm_weapons::is_weapon_or_base_included(weapon) && weapon == self zm_utility::get_player_melee_weapon())
		{
			loadout[weapon.name] = zm_weapons::get_player_weapondata(self, weapon);
		}
	}
	return loadout;
}

/*
	Name: function_da20d9e5
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xC918
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 2726
*/
function function_da20d9e5()
{
	level notify("hash_da20d9e5");
	level endon("hash_da20d9e5");
	wait(60);
	players = level.activePlayers;
	count = 0;
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i].afk) && players[i].afk)
		{
			continue;
		}
		count++;
	}
	if(count == 0)
	{
		if(namespace_98efd7b6::validation())
		{
			level.var_dfd95560 = 1;
			level thread namespace_98efd7b6::function_8824774d(level.round_number + 1);
		}
	}
}

/*
	Name: function_b4d2cbac
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xCA20
	Size: 0x210
	Parameters: 0
	Flags: None
	Line Number: 2761
*/
function function_b4d2cbac()
{
	level endon("game_ended");
	level endon("end_game");
	level flag::wait_till("all_players_connected");
	level thread function_18d1846f();
	if(GetDvarString("no_movement_patch", "") == "1")
	{
		level namespace_d87f1aa7::function_908a81cd("no_movement_patchâ¦1");
	}
	level.player_intersection_tracker_override = &DoNothing;
	level.player_too_many_weapons_monitor_func = &player_too_many_weapons_monitor;
	perk = GetDvarInt("tfoption_no_perk_lim");
	if(perk && perk != 4)
	{
		level.perk_purchase_limit = perk;
		foreach(player in level.players)
		{
			if(isdefined(player.player_perk_purchase_limit))
			{
				player.player_perk_purchase_limit = perk;
			}
		}
	}
	SetDvar("scr_secondaryProgressBarY", "170");
	if(GetDvarString("cg_unlockall_loot") == "")
	{
		thread serverinfo();
	}
	wait(5);
	level.var_4551258a = 1;
}

/*
	Name: function_76b45df1
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xCC38
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 2804
*/
function function_76b45df1()
{
	triggers = [];
	trigger_use = GetEntArray("trigger_use", "classname", 1);
	var_80b641f5 = GetEntArray("trigger_box", "classname", 1);
	var_10e16f0c = GetEntArray("trigger_radius_use", "classname", 1);
	triggers = ArrayCombine(triggers, trigger_use, 0, 0);
	triggers = ArrayCombine(triggers, var_80b641f5, 0, 0);
	triggers = ArrayCombine(triggers, var_10e16f0c, 0, 0);
	return triggers;
}

/*
	Name: function_18d1846f
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xCD50
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2826
*/
function function_18d1846f()
{
	for(;;)
	{
		level.var_131c307e = function_76b45df1();
		wait(0.5);
	}
}

/*
	Name: DoNothing
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xCD80
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2845
*/
function DoNothing()
{
	return 1;
}

/*
	Name: serverinfo
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xCD90
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 2860
*/
function serverinfo()
{
	for(;;)
	{
		SetDvar("elmg_player_size", level.players.size);
		SetDvar("elmg_zm_count", zombie_utility::get_current_zombie_count() + level.zombie_total);
		if(GetDvarString("sv_playlist") != "")
		{
			SetDvar("live_steam_server_description", "^1Round^7:" + zm::get_round_number() + " ^1Zombies^7:" + GetDvarString("elmg_zm_count") + " ^3Players^7:" + GetDvarString("elmg_player_size"));
		}
		else
		{
			SetDvar("live_steam_server_name", "^0-^5AAE^0- ^1Round^7:" + zm::get_round_number() + " ^3Host^7:" + GetDvarString("sv_hostname"));
			SetDvar("live_steam_server_description", "^2" + MakeLocalizedString("PLATFORM_AAE_VERSION") + "  ^1Zombies^7:" + GetDvarString("elmg_zm_count") + " ^3Players^7:" + GetDvarString("elmg_player_size"));
		}
		wait(7);
	}
}

/*
	Name: function_6a06a8d1
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xCF68
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 2889
*/
function function_6a06a8d1()
{
	thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦SUBEVENT_LOADINGMAPâ¦â¦SUBEVENT_DOTâ¦");
	return;
	ERROR: Bad function call
}

/*
	Name: function_b0308ee1
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xCFA0
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 2906
*/
function function_b0308ee1()
{
	me = self getXuid(1);
	if(isdefined(level.var_17ee3fc4) && isdefined(level.var_17ee3fc4[me]))
	{
		if(!level.var_17ee3fc4[me].var_b9c362a7.size === 0)
		{
			self player_give_loadout(level.var_17ee3fc4[me].var_b9c362a7, 1, 1);
		}
		if(!level.var_17ee3fc4[me].var_6a5cb083.size === 0)
		{
			foreach(perk in level.var_17ee3fc4[me].var_6a5cb083)
			{
				self zm_perks::give_perk(perk, 0);
			}
		}
		else if(self.score < level.var_17ee3fc4[me].var_ec77b8cb)
		{
			self.score = level.var_17ee3fc4[me].var_ec77b8cb;
		}
	}
	if(self getweaponslistprimaries().size < 1)
	{
		self thread function_340dbcc5();
	}
}

/*
	Name: function_340dbcc5
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xD180
	Size: 0x3A8
	Parameters: 0
	Flags: None
	Line Number: 2943
*/
function function_340dbcc5()
{
	self endon("disconnect");
	self endon("death");
	if(GetDvarString("tfoption_start_rk5") == "1")
	{
		self zm_weapons::give_build_kit_weapon(GetWeapon("pistol_burst"));
	}
	if(GetDvarString("tfoption_random_weapon") == "1")
	{
		var_8561b1fb = function_f56a5552();
		if(isdefined(var_8561b1fb))
		{
			var_8561b1fb = self zm_weapons::give_build_kit_weapon(var_8561b1fb);
		}
		else if(isdefined(level.var_c5f27ebb))
		{
			self [[level.var_c5f27ebb]]();
		}
		else if(isdefined(level.start_weapon))
		{
			self zm_weapons::give_build_kit_weapon(level.start_weapon);
		}
		else
		{
			self zm_weapons::give_build_kit_weapon(GetWeapon("pistol_standard"));
		}
	}
	else if(isdefined(level.var_c5f27ebb))
	{
		self [[level.var_c5f27ebb]]();
	}
	else if(isdefined(level.start_weapon))
	{
		self zm_weapons::give_build_kit_weapon(level.start_weapon);
	}
	else
	{
		self zm_weapons::give_build_kit_weapon(GetWeapon("pistol_standard"));
	}
	var_249ddc23 = self getweaponslistprimaries();
	if(GetDvarInt("tfoption_max_ammo") == 1)
	{
		foreach(weapon in var_249ddc23)
		{
			self giveMaxAmmo(weapon);
		}
	}
	else
	{
		foreach(weapon in var_249ddc23)
		{
			self GiveStartAmmo(weapon);
		}
	}
	for(i = 0; i < var_249ddc23.size; i++)
	{
		if(i + 1 == var_249ddc23.size)
		{
			self function_92dca8b7(var_249ddc23[i], 0);
			self setSpawnWeapon(var_249ddc23[i]);
			return;
		}
	}
}

/*
	Name: player_give_loadout
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xD530
	Size: 0x370
	Parameters: 3
	Flags: None
	Line Number: 3019
*/
function player_give_loadout(loadout, replace_existing, immediate_switch)
{
	if(!isdefined(replace_existing))
	{
		replace_existing = 1;
	}
	if(!isdefined(immediate_switch))
	{
		immediate_switch = 0;
	}
	if(isdefined(replace_existing) && replace_existing)
	{
		weapons = self GetWeaponsList();
		if(weapons.size != 0)
		{
			foreach(weapon in weapons)
			{
				self zm_weapons::weapon_take(weapon);
			}
		}
	}
	foreach(weapondata in loadout)
	{
		if(self getweaponslistprimaries().size <= 2)
		{
			me = self getXuid(1);
			if(isdefined(level.var_17ee3fc4[me].var_ef1de883) && weapondata["weapon"] != level.var_17ee3fc4[me].var_ef1de883)
			{
				self zm_weapons::weapondata_give(weapondata);
			}
		}
	}
	foreach(weapon in self getweaponslistprimaries())
	{
		if(weapon.rootweapon == level.start_weapon)
		{
			self SetWeaponAmmoClip(weapon, weapon.clipSize);
			self giveMaxAmmo(weapon);
			break;
		}
	}
	foreach(weapon in self getweaponslistprimaries())
	{
		self SwitchToWeaponImmediate(weapon);
		break;
	}
	return;
}

/*
	Name: player_on_spawned
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xD8A8
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 3078
*/
function player_on_spawned()
{
	self.var_b81d7a38 = undefined;
	self.var_17075ee = 0;
	if(isdefined(self.Interest))
	{
		self.var_888f3d5f = 2;
	}
	else
	{
		self.var_888f3d5f = 1;
	}
	self thread function_293017fa("Spike Launcher", &"ELMG_SPIKE_HINT", "spike_hint_over");
	self thread function_293017fa("Ground Blaster", &"ELMG_SPIKE_HINT", "spike_ug_hint_over");
	if(self GamepadUsedLast())
	{
		self thread function_293017fa("Path of Honour", &"ELMG_KATANA_HINT_GAMEPAD", "KATANA_ug_hint_over");
	}
	else
	{
		self thread function_293017fa("Path of Honour", &"ELMG_KATANA_HINT", "KATANA_ug_hint_over");
	}
	self thread function_293017fa("WEAPON_HERO_FLAMETHROWER", &"ELMGT_PURIFIER_HINT", "bowlauncher_ug_hint_over");
	self thread function_293017fa("HEROES_OUTRIDER", &"ELMGT_OUTRIDER_HINT", "purifier_ug_hint_over");
	self.var_7bc74bd7 = 3;
	self thread function_8b5f5e0d();
}

/*
	Name: function_8b5f5e0d
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xDA48
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 3116
*/
function function_8b5f5e0d()
{
	wait(0.05);
	if(level.script == "zm_moon")
	{
		self notify("player_throw_grenade");
	}
	self thread player_monitor_travel_dist();
	self thread playerHealthRegen();
	self thread player_out_of_playable_area_monitor();
}

/*
	Name: function_78f4f688
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xDAC8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 3138
*/
function function_78f4f688(levelvar)
{
	if(self hasPerk("specialty_quickrevive") && GetDvarInt("tfoption_perkplus") != 1)
	{
		return levelvar * 0.6;
	}
	return levelvar;
	~;
}

/*
	Name: playerHealthRegen
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xDB30
	Size: 0x6F0
	Parameters: 0
	Flags: None
	Line Number: 3158
*/
function playerHealthRegen()
{
	self notify("playerHealthRegen");
	self endon("playerHealthRegen");
	self endon("death");
	self endon("disconnect");
	if(!isdefined(self.flag))
	{
		self.flag = [];
		self.flags_lock = [];
	}
	if(!isdefined(self.flag["player_has_red_flashing_overlay"]))
	{
		self flag::init("player_has_red_flashing_overlay");
		self flag::init("player_is_invulnerable");
	}
	self flag::clear("player_has_red_flashing_overlay");
	self flag::clear("player_is_invulnerable");
	self thread healthoverlay();
	oldratio = 1;
	health_add = 0;
	regenRate = 0.1;
	veryHurt = 0;
	playerJustGotRedFlashing = 0;
	invulTime = 0;
	hurtTime = 0;
	newHealth = 0;
	lastinvulratio = 1;
	self thread zm_playerhealth::playerHurtcheck();
	if(!isdefined(self.veryHurt))
	{
		self.veryHurt = 0;
	}
	self.boltHit = 0;
	if(GetDvarString("scr_playerInvulTimeScale") == "")
	{
		SetDvar("scr_playerInvulTimeScale", 1);
	}
	playerInvulTimeScale = GetDvarFloat("scr_playerInvulTimeScale");
	for(;;)
	{
		wait(0.05);
		waittillframeend;
		if(self.health == self.maxhealth)
		{
			if(self flag::get("player_has_red_flashing_overlay"))
			{
				self clientfield::set_to_player("sndZombieHealth", 0);
				self flag::clear("player_has_red_flashing_overlay");
			}
			lastinvulratio = 1;
			playerJustGotRedFlashing = 0;
			veryHurt = 0;
		}
		else if(self.health <= 0)
		{
			return;
		}
		wasVeryHurt = veryHurt;
		health_ratio = self.health / self.maxhealth;
		if(health_ratio <= level.healthOverlayCutoff)
		{
			veryHurt = 1;
			if(!wasVeryHurt)
			{
				hurtTime = GetTime();
				self startfadingblur(3.6, 2);
				self clientfield::set_to_player("sndZombieHealth", 1);
				self flag::set("player_has_red_flashing_overlay");
				playerJustGotRedFlashing = 1;
			}
		}
		if(self.hurtAgain)
		{
			hurtTime = GetTime();
			self.hurtAgain = 0;
		}
		if(health_ratio >= oldratio)
		{
			if(GetTime() - hurtTime < Int(self function_78f4f688(level.playerHealth_RegularRegenDelay)))
			{
			}
			else if(veryHurt)
			{
				self.veryHurt = 1;
				newHealth = health_ratio;
				if(GetTime() > hurtTime + Int(self function_78f4f688(level.longRegenTime)))
				{
					newHealth = newHealth + regenRate;
				}
			}
			else
			{
				newHealth = 1;
				self.veryHurt = 0;
			}
			if(newHealth > 1)
			{
				newHealth = 1;
			}
			if(newHealth <= 0)
			{
				return;
			}
			self setnormalhealth(newHealth);
			oldratio = self.health / self.maxhealth;
		}
		else
		{
			invulWorthyHealthDrop = lastinvulratio - health_ratio > level.worthyDamageRatio;
			if(self.health <= 1)
			{
				self setnormalhealth(2 / self.maxhealth);
				invulWorthyHealthDrop = 1;
			}
			oldratio = self.health / self.maxhealth;
			level notify("hit_again");
			health_add = 0;
			hurtTime = GetTime();
			self startfadingblur(3, 0.8);
			if(!invulWorthyHealthDrop || playerInvulTimeScale <= 0)
			{
			}
			else if(self flag::get("player_is_invulnerable"))
			{
			}
			else
			{
				self flag::set("player_is_invulnerable");
				level notify("player_becoming_invulnerable");
				if(playerJustGotRedFlashing)
				{
					invulTime = self function_78f4f688(level.invulTime_onShield);
					playerJustGotRedFlashing = 0;
				}
				else if(veryHurt)
				{
					invulTime = self function_78f4f688(level.invulTime_postShield);
				}
				else
				{
					invulTime = self function_78f4f688(level.invulTime_preShield);
				}
				invulTime = invulTime * playerInvulTimeScale;
				lastinvulratio = self.health / self.maxhealth;
				self thread zm_playerhealth::playerInvul(invulTime);
			}
		}
	}
}

/*
	Name: healthoverlay
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xE228
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 3319
*/
function healthoverlay()
{
	self endon("disconnect");
	self endon("noHealthOverlay");
	if(!isdefined(self._health_overlay))
	{
		self._health_overlay = newClientHudElem(self);
		self._health_overlay.x = 0;
		self._health_overlay.y = 0;
		self._health_overlay SetShader("overlay_low_health", 640, 480);
		self._health_overlay.alignX = "left";
		self._health_overlay.alignY = "top";
		self._health_overlay.horzAlign = "fullscreen";
		self._health_overlay.vertAlign = "fullscreen";
		self._health_overlay.alpha = 0;
	}
	overlay = self._health_overlay;
	self thread zm_playerhealth::healthOverlay_remove(overlay);
	self thread zm_playerhealth::watchHideRedFlashingOverlay(overlay);
	while(overlay.alpha > 0)
	{
		overlay fadeOverTime(0.5);
		overlay.alpha = 0;
		self flag::wait_till("player_has_red_flashing_overlay");
		self redFlashingOverlay(overlay);
	}
}

/*
	Name: redFlashingOverlay
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xE3F8
	Size: 0x270
	Parameters: 1
	Flags: None
	Line Number: 3357
*/
function redFlashingOverlay(overlay)
{
	self endon("hit_again");
	self endon("damage");
	self endon("death");
	self endon("disconnect");
	self endon("clear_red_flashing_overlay");
	stopFlashingBadlyTime = GetTime() + Int(self function_78f4f688(level.longRegenTime));
	if(!(isdefined(self.is_in_process_of_zombify) && self.is_in_process_of_zombify) && (!(isdefined(self.is_zombie) && self.is_zombie)))
	{
		zm_playerhealth::fadeFunc(overlay, 1, 1, 0);
		while(GetTime() < stopFlashingBadlyTime && isalive(self) && (!(isdefined(self.is_in_process_of_zombify) && self.is_in_process_of_zombify) && (!(isdefined(self.is_zombie) && self.is_zombie))))
		{
			zm_playerhealth::fadeFunc(overlay, 0.9, 1, 0);
		}
		if(!(isdefined(self.is_in_process_of_zombify) && self.is_in_process_of_zombify) && (!(isdefined(self.is_zombie) && self.is_zombie)))
		{
			if(isalive(self))
			{
				zm_playerhealth::fadeFunc(overlay, 0.65, 0.8, 0);
			}
			zm_playerhealth::fadeFunc(overlay, 0, 0.6, 1);
		}
	}
	overlay fadeOverTime(0.5);
	overlay.alpha = 0;
	self flag::clear("player_has_red_flashing_overlay");
	self clientfield::set_to_player("sndZombieHealth", 0);
	wait(0.5);
	self notify("hit_again");
}

/*
	Name: player_monitor_travel_dist
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xE670
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 3399
*/
function player_monitor_travel_dist()
{
	wait(1);
	self endon("disconnect");
	self notify("stop_player_monitor_travel_dist");
	self endon("stop_player_monitor_travel_dist");
	prevpos = self.origin;
	for(;;)
	{
		wait(0.1);
		vel = length(self getvelocity());
		if(vel < 440 && vel > 17)
		{
			self.pers["distance_traveled"] = self.pers["distance_traveled"] + Distance(self.origin, prevpos);
		}
		prevpos = self.origin;
	}
}

/*
	Name: function_bee07b49
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xE768
	Size: 0x508
	Parameters: 1
	Flags: None
	Line Number: 3428
*/
function function_bee07b49(weapon)
{
	if(self hasPerk("specialty_fastreload"))
	{
		self function_e974f053("specialty_fastads");
		self function_e974f053("specialty_fastequipmentuse");
		self function_e974f053("specialty_fastmeleerecovery");
		self function_e974f053("specialty_fasttoss");
		self function_e974f053("specialty_fastweaponswitch");
		self function_e974f053("specialty_fastmantle");
		self function_e974f053("specialty_fastladderclimb");
	}
	else
	{
		self function_92f3c278("specialty_fastads");
		self function_92f3c278("specialty_fastequipmentuse");
		self function_92f3c278("specialty_fastmeleerecovery");
		self function_92f3c278("specialty_fasttoss");
		self function_92f3c278("specialty_fastweaponswitch");
		self function_92f3c278("specialty_fastmantle");
		self function_92f3c278("specialty_fastladderclimb");
	}
	if(self hasPerk("specialty_doubletap2"))
	{
		self function_e974f053("specialty_overcharge");
	}
	else
	{
		self function_92f3c278("specialty_overcharge");
	}
	if(self hasPerk("specialty_staminup") || (isdefined(self.beastmode) && self.beastmode == 1) || weapon.name == "t6_xl_shockhands")
	{
		self function_e974f053("specialty_unlimitedsprint");
		self function_e974f053("specialty_sprintfire");
	}
	else
	{
		self function_92f3c278("specialty_unlimitedsprint");
		self function_92f3c278("specialty_sprintfire");
	}
	if(self hasPerk("specialty_staminup"))
	{
		self function_e974f053("specialty_movefaster");
		self function_e974f053("specialty_sprintrecovery");
		self function_e974f053("specialty_sprintfirerecovery");
		self function_e974f053("specialty_sprintequipment");
		self function_e974f053("specialty_sprintgrenadelethal");
		self function_e974f053("specialty_sprintgrenadetactical");
		self function_e974f053("specialty_stalker");
	}
	else
	{
		self function_92f3c278("specialty_movefaster");
		self function_92f3c278("specialty_sprintrecovery");
		self function_92f3c278("specialty_sprintfirerecovery");
		self function_92f3c278("specialty_sprintequipment");
		self function_92f3c278("specialty_sprintgrenadelethal");
		self function_92f3c278("specialty_sprintgrenadetactical");
		self function_92f3c278("specialty_stalker");
		return;
	}
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_e974f053
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xEC78
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 3503
*/
function function_e974f053(perk)
{
	if(!isdefined(level._custom_perks[perk]))
	{
		self setPerk(perk);
	}
}

/*
	Name: function_92f3c278
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xECB8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 3521
*/
function function_92f3c278(perk)
{
	if(!isdefined(level._custom_perks[perk]))
	{
		self unsetPerk(perk);
	}
}

/*
	Name: function_917c26c4
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xECF8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 3539
*/
function function_917c26c4()
{
}

/*
	Name: function_293017fa
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xED08
	Size: 0x1D0
	Parameters: 3
	Flags: None
	Line Number: 3553
*/
function function_293017fa(displayName, hint, over)
{
	self notify(over);
	self endon(over);
	self endon("death");
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	self endon("spawned_player");
	self endon("death_or_disconnect");
	for(;;)
	{
		self waittill("weapon_change", var_d2af076);
		if(self GetCurrentWeapon().displayName == displayName && self GetCurrentWeapon().displayName != "" && isdefined(displayName))
		{
			if(isdefined(self.hintelem))
			{
				self.hintelem setText("");
				self.hintelem destroy();
			}
			if(self IsSplitscreen())
			{
				self thread zm_equipment::show_hint_text(hint, 8, 1, 150);
			}
			else
			{
				self thread zm_equipment::show_hint_text(hint, 8);
				return;
			}
			self util::waittill_any_timeout(1, "weapon_change_complete", "death", "bled_out");
		}
		wait(0.05);
	}
}

/*
	Name: function_9a2ee780
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xEEE0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 3598
*/
function function_9a2ee780()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: watch_grenade_cancel
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xEEF0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 3614
*/
function watch_grenade_cancel()
{
	self notify("watch_grenade_cancel");
	self endon("watch_grenade_cancel");
	self endon("weapon_change");
	self endon("disconnect");
	self endon("death");
	while(!self WeaponSwitchButtonPressed() && self IsThrowingGrenade() && self isusingoffhand() && self GetCurrentWeapon().name == "none")
	{
		wait(0.05);
		if(self IsThrowingGrenade() && self isusingoffhand() && self GetCurrentWeapon().name == "none" && self WeaponSwitchButtonPressed())
		{
			self forceoffhandend();
			return;
		}
	}
}

/*
	Name: function_f76fe639
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xF040
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 3642
*/
function function_f76fe639()
{
	self endon("disconnect");
	level.var_ae633d88 = 1;
	for(;;)
	{
		result = self util::waittill_any_array_return(Array("fake_death", "player_downed", "weapon_change", "perk_abort_drinking", "shield_update", "reload_start", "reload", "perk_acquired", "perk_lost", "new_equipment", "weapon_give", "weapon_take"));
		self setDepthOfField(0, 128, 512, 4000, 6, 1.8);
		if(isdefined(result) && result == "weapon_change")
		{
			self thread watch_grenade_cancel();
		}
		self function_1427c64c();
		weapon = self GetCurrentWeapon();
		if(!isdefined(weapon.name) || weapon.name == "")
		{
		}
		else if(GetDvarInt("tfoption_perkplus") != 1)
		{
			self function_bee07b49(weapon);
		}
	}
}

/*
	Name: function_5f463241
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xF1F8
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 3676
*/
function function_5f463241()
{
	self endon("disconnect");
	self endon("death");
	self endon("hash_16cd487c");
	level flag::wait_till("initial_blackscreen_passed");
	while(isdefined(level.var_16cd487c))
	{
		return;
		if(!self zm::in_kill_brush() && (self zm::in_life_brush() || self zm::in_enabled_playable_area()) && self IsOnGround() && !self issprinting() && !self IsWallRunning() && length(self getvelocity()) <= 0)
		{
			if(self zm_utility::get_current_zone(1) != "zone_robot_head")
			{
				level.var_16cd487c = self GetOrigin();
				return;
			}
		}
		wait(0.1);
	}
}

/*
	Name: get_player_out_of_playable_area_monitor_wait_time
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xF360
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 3707
*/
function get_player_out_of_playable_area_monitor_wait_time()
{
	return 3;
}

/*
	Name: function_407f887d
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xF370
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 3722
*/
function function_407f887d()
{
	if(self IsInMoveMode("ufo", "noclip"))
	{
		return 0;
	}
	if(GetDvarInt("sv_cheats") == 1)
	{
		return 0;
	}
	if(IsSubStr(level.script, "rust"))
	{
		return 0;
	}
	if(isdefined(self.var_9a7147c6))
	{
		return 0;
	}
	if(isdefined(self.current_player_scene) || self scene::is_igc_active() || self flagsys::get("playing_movie_hide_hud") || (isdefined(self.dont_show_hud) && self.dont_show_hud))
	{
		return 0;
	}
	if(isdefined(self.gamevars["ufomode"]))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_6e51757f
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xF490
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 3761
*/
function function_6e51757f(var_b6beb897)
{
	zone_enabled = zm_zonemgr::get_zone_from_position(var_b6beb897, 0);
	if(!isdefined(zone_enabled))
	{
		if(isdefined(level.var_16cd487c))
		{
			return level.var_16cd487c;
		}
	}
	else if(zone_enabled == "zone_robot_head")
	{
		if(isdefined(level.var_16cd487c))
		{
			return level.var_16cd487c;
		}
	}
	if(self.var_3d5836cb > 4)
	{
		self.var_3d5836cb = 0;
		return level.var_16cd487c;
	}
	return self.var_b6beb897;
}

/*
	Name: function_e2f7867a
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xF540
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 3796
*/
function function_e2f7867a()
{
	self endon("disconnect");
	self endon("death");
	if(level.players.size == 1 && level flag::get("solo_game") && (isdefined(self.waiting_to_revive) && self.waiting_to_revive))
	{
		level notify("end_game");
	}
	else
	{
		self DisableInvulnerability();
		self.lives = 0;
		self DoDamage(self.health + 1000, self.origin);
		self.bleedout_time = 0;
		wait(5);
		self zm::spectator_respawn_player();
	}
}

/*
	Name: player_out_of_playable_area_monitor
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xF638
	Size: 0x530
	Parameters: 0
	Flags: None
	Line Number: 3825
*/
function player_out_of_playable_area_monitor()
{
	self notify("stop_player_out_of_playable_area_monitor");
	self endon("stop_player_out_of_playable_area_monitor");
	self endon("disconnect");
	self endon("death");
	level endon("game_ended");
	level endon("end_game");
	self.var_3d5836cb = 0;
	while(!isdefined(self.characterindex))
	{
		wait(0.05);
	}
	wait(0.15 * self.characterindex);
	while(isdefined(self))
	{
		if(self.sessionstate == "spectator" || isdefined(self.var_49afbfe1))
		{
			wait(3);
			continue;
		}
		if(isdefined(level.hostmigration_occured) && level.hostmigration_occured)
		{
			wait(3);
			continue;
		}
		if(isdefined(level.player_out_of_playable_area_monitor) && level.player_out_of_playable_area_monitor && self function_407f887d() && !self zm::in_life_brush() && (self zm::in_kill_brush() || !self zm::in_enabled_playable_area() || (isdefined(level.player_out_of_playable_area_override) && (isdefined(self [[level.player_out_of_playable_area_override]]()) && self [[level.player_out_of_playable_area_override]]()))))
		{
			if(!isdefined(level.player_out_of_playable_area_monitor_callback) || self [[level.player_out_of_playable_area_monitor_callback]]())
			{
				self playlocalsound("zmb_laugh_child2");
				wait(0.5);
				origin = self function_6e51757f(self.var_b6beb897);
				if(!isdefined(origin))
				{
					self thread function_e2f7867a();
					wait(3);
					continue;
				}
				self.var_3d5836cb++;
				self SetOrigin(origin);
				self SetVelocity((0, 0, 0));
				self namespace_82ce4a91::function_a667729f("AAE_OUT_OF_BOUNDS", "t7_icon_rank_zm_prestige_15_lrg", "MPUI_OUT_OF_BOUNDS_RETURN_TO_COMBAT_ZONE");
				self playsound("zmb_bgb_abh_teleport_in");
				playFX(level._effect["teleport_splash"], origin);
				playFX(level._effect["teleport_aoe"], origin);
				a_ai = GetAIArray();
				var_aca0d7c7 = ArraySortClosest(a_ai, origin, a_ai.size, 0, 200);
				if(isdefined(self.var_7bc74bd7) && self.var_7bc74bd7 != 0)
				{
					foreach(ai in var_aca0d7c7)
					{
						if(IsActor(ai))
						{
							if(ai.archetype === "zombie")
							{
								playFX(level._effect["teleport_aoe_kill"], ai GetTagOrigin("j_spineupper"));
							}
							else
							{
								playFX(level._effect["teleport_aoe_kill"], ai.origin);
							}
							ai.marked_for_recycle = 1;
							ai.has_been_damaged_by_player = 0;
							ai DoDamage(ai.health + 6, origin);
							self.var_7bc74bd7 = self.var_7bc74bd7 - 1;
						}
					}
				}
			}
		}
		self setClientUIVisibilityFlag("g_compassShowEnemies", 1);
		wait(0.2);
		self setClientUIVisibilityFlag("g_compassShowEnemies", 0);
		wait(3);
	}
}

/*
	Name: get_player_too_many_weapons_monitor_wait_time
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xFB70
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 3913
*/
function get_player_too_many_weapons_monitor_wait_time()
{
	return 3;
}

/*
	Name: player_too_many_weapons_monitor_takeaway_simultaneous
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xFB80
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 3928
*/
function player_too_many_weapons_monitor_takeaway_simultaneous(primary_weapons_to_take)
{
	self endon("player_too_many_weapons_monitor_takeaway_sequence_done");
	self util::waittill_any("player_downed", "replace_weapon_powerup");
	for(i = 0; i < primary_weapons_to_take.size; i++)
	{
		self TakeWeapon(primary_weapons_to_take[i]);
	}
	self zm_score::player_reduce_points("take_all");
	self zm_utility::give_start_weapon(0);
	if(!self laststand::player_is_in_laststand())
	{
		self zm_utility::decrement_is_drinking();
	}
	else if(level flag::get("solo_game"))
	{
		self.score_lost_when_downed = 0;
	}
	self notify("player_too_many_weapons_monitor_takeaway_sequence_done");
}

/*
	Name: player_too_many_weapons_monitor_takeaway_sequence
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xFCB0
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 3959
*/
function player_too_many_weapons_monitor_takeaway_sequence(primary_weapons_to_take)
{
	self thread player_too_many_weapons_monitor_takeaway_simultaneous(primary_weapons_to_take);
	self endon("player_downed");
	self endon("replace_weapon_powerup");
	self zm_utility::increment_is_drinking();
	score_decrement = zm_utility::round_up_to_ten(Int(self.score / primary_weapons_to_take.size + 1));
	for(i = 0; i < primary_weapons_to_take.size; i++)
	{
		self playlocalsound(level.zmb_laugh_alias);
		self SwitchToWeapon(primary_weapons_to_take[i]);
		self zm_score::player_reduce_points("take_specified", score_decrement);
		wait(3);
		self TakeWeapon(primary_weapons_to_take[i]);
	}
	self playlocalsound(level.zmb_laugh_alias);
	self zm_score::player_reduce_points("take_all");
	wait(1);
	self zm_utility::give_start_weapon(1);
	self zm_utility::decrement_is_drinking();
	self notify("player_too_many_weapons_monitor_takeaway_sequence_done");
}

/*
	Name: player_too_many_weapons_monitor
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0xFE80
	Size: 0x3D8
	Parameters: 0
	Flags: None
	Line Number: 3992
*/
function player_too_many_weapons_monitor()
{
	self notify("stop_player_too_many_weapons_monitor");
	self endon("stop_player_too_many_weapons_monitor");
	self endon("disconnect");
	self endon("death");
	level endon("game_ended");
	level endon("end_game");
	scalar = self.characterindex;
	if(!isdefined(scalar))
	{
		scalar = self GetEntityNumber();
	}
	wait(0.15 * scalar);
	while(isdefined(self))
	{
		if(self zm_utility::has_powerup_weapon() || self laststand::player_is_in_laststand() || self.sessionstate == "spectator" || isdefined(self.laststandpistol))
		{
			wait(get_player_too_many_weapons_monitor_wait_time());
			continue;
		}
		weapon_limit = zm_utility::get_player_weapon_limit(self);
		primaryWeapons = self getweaponslistprimaries();
		if(primaryWeapons.size > weapon_limit)
		{
			self zm_weapons::take_fallback_weapon();
			primaryWeapons = self getweaponslistprimaries();
		}
		primary_weapons_to_take = [];
		for(i = 0; i < primaryWeapons.size; i++)
		{
			if(zm_weapons::is_weapon_included(primaryWeapons[i]) || zm_weapons::is_weapon_upgraded(primaryWeapons[i]))
			{
				primary_weapons_to_take[primary_weapons_to_take.size] = primaryWeapons[i];
			}
		}
		if(primary_weapons_to_take.size > weapon_limit)
		{
			if(!isdefined(level.player_too_many_weapons_monitor_callback) || self [[level.player_too_many_weapons_monitor_callback]](primary_weapons_to_take))
			{
				self playlocalsound(level.zmb_laugh_alias);
				foreach(weapon in primaryWeapons)
				{
					if(weapon.name == "defaultweapon")
					{
						self TakeWeapon(weapon);
					}
				}
				if(IsInArray(primary_weapons_to_take, self.currentWeapon))
				{
					self TakeWeapon(self.currentWeapon);
				}
				else
				{
					self TakeWeapon(primary_weapons_to_take[0]);
				}
				self SwitchToWeaponImmediate(self getweaponslistprimaries()[0]);
				wait(1);
				if(!self getweaponslistprimaries().size)
				{
					self zm_utility::give_start_weapon(1);
				}
			}
		}
		wait(3);
	}
	return;
}

/*
	Name: function_6f7a33ed
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x10260
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 4071
*/
function function_6f7a33ed()
{
	if(isdefined(self.drownStage) && self.drownStage == 4)
	{
		return 0;
	}
	remainingTime = self.drown_damage_after_time - GetTime() - self.lastWaterDamageTime;
	if(remainingTime < 0)
	{
		return self.drown_damage_after_time + 1000;
	}
	else
	{
		return remainingTime + 50;
	}
}

/*
	Name: function_ed8831ad
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x102D8
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 4098
*/
function function_ed8831ad()
{
	if(self IsTestClient())
	{
		return;
	}
	self notify("hash_ed8831ad");
	self endon("hash_ed8831ad");
	self endon("disconnect");
	self endon("death");
	self SetControllerUIModelValue("hudItems.elmgplayerO2", 2);
	for(;;)
	{
		wait(0.17);
		var_d552a755 = self function_6f7a33ed();
		if(isdefined(self.drown_damage_after_time) && self.drown_damage_after_time > var_d552a755 && self IsPlayerUnderwater())
		{
			self SetControllerUIModelValue("hudItems.elmgplayerO2", var_d552a755 / self.drown_damage_after_time);
		}
		else
		{
			self SetControllerUIModelValue("hudItems.elmgplayerO2", 2);
		}
	}
}

/*
	Name: function_d4a986d9
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x10408
	Size: 0x428
	Parameters: 0
	Flags: None
	Line Number: 4134
*/
function function_d4a986d9()
{
	self notify("hash_d4a986d9");
	self endon("hash_d4a986d9");
	self endon("disconnect");
	time_in_low_gravity = 0;
	time_to_death = 0;
	time_to_death_default = 15000;
	time_to_death_jug = 17000;
	time_til_damage = 0;
	blur_level = 0;
	blur_level_max = 7;
	var_9f8b53da = 0;
	blur_occur = [];
	blur_occur[0] = 1000;
	blur_occur[1] = 1250;
	blur_occur[2] = 1250;
	blur_occur[3] = 1500;
	blur_occur[4] = 1500;
	blur_occur[5] = 1750;
	blur_occur[6] = 2250;
	blur_occur[7] = 2500;
	if(isdefined(level.debug_low_gravity) && level.debug_low_gravity)
	{
		time_to_death = 3000;
	}
	startTime = GetTime();
	nextTime = GetTime();
	self function_ae8b3bc3(1, 1);
	for(;;)
	{
		diff = nextTime - startTime;
		if(IsGodMode(self))
		{
			self function_ae8b3bc3(1, 1);
			time_in_low_gravity = 0;
			blur_level = 0;
			wait(0.048);
		}
		else if(!zombie_utility::is_player_valid(self) || (!(isdefined(level.on_the_moon) && level.on_the_moon)))
		{
			self function_ae8b3bc3(1, 1);
			time_in_low_gravity = 0;
			blur_level = 0;
			wait(0.048);
		}
		else if(!level flag::get("power_on") || (isdefined(self.in_low_gravity) && self.in_low_gravity) && !self zm_equipment::is_active(level.var_f486078e))
		{
			time_til_damage = time_til_damage + diff;
			time_in_low_gravity = time_in_low_gravity + diff;
			if(self hasPerk("specialty_armorvest"))
			{
				time_to_death = time_to_death_jug;
			}
			else
			{
				time_to_death = time_to_death_default;
			}
			var_9f8b53da = time_to_death - time_in_low_gravity;
			if(time_in_low_gravity > time_to_death)
			{
				self function_ae8b3bc3(0.1, time_to_death);
			}
			else if(blur_level < blur_occur.size && time_til_damage > blur_occur[blur_level])
			{
				self function_ae8b3bc3(var_9f8b53da, time_to_death);
				blur_level++;
				if(blur_level > blur_level_max)
				{
					blur_level = blur_level_max;
				}
				time_til_damage = 0;
			}
		}
		else if(time_in_low_gravity > 0)
		{
			self function_ae8b3bc3(time_to_death, time_to_death);
			time_in_low_gravity = 0;
			time_til_damage = 0;
			blur_level = 0;
		}
		startTime = GetTime();
		wait(0.048);
		nextTime = GetTime();
	}
}

/*
	Name: function_ae8b3bc3
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x10838
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 4231
*/
function function_ae8b3bc3(var1, var2)
{
	if(var1 < var2)
	{
		self SetControllerUIModelValue("hudItems.elmgplayerO2", var1 / var2);
	}
	else
	{
		self SetControllerUIModelValue("hudItems.elmgplayerO2", 2);
	}
}

/*
	Name: function_49ac4bdc
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x108B8
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 4253
*/
function function_49ac4bdc()
{
	var_e595f6c1 = 0;
	if(self hasPerk("specialty_additionalprimaryweapon"))
	{
		var_e595f6c1 = var_e595f6c1 | 1;
	}
	if(self hasPerk("specialty_deadshot"))
	{
		var_e595f6c1 = var_e595f6c1 | 2;
	}
	if(self hasPerk("specialty_doubletap2"))
	{
		var_e595f6c1 = var_e595f6c1 | 4;
	}
	if(self hasPerk("specialty_electriccherry"))
	{
		var_e595f6c1 = var_e595f6c1 | 8;
	}
	if(self hasPerk("specialty_armorvest"))
	{
		var_e595f6c1 = var_e595f6c1 | 16;
	}
	if(self hasPerk("specialty_staminup"))
	{
		var_e595f6c1 = var_e595f6c1 | 32;
	}
	if(self hasPerk("specialty_quickrevive"))
	{
		var_e595f6c1 = var_e595f6c1 | 64;
	}
	if(self hasPerk("specialty_fastreload"))
	{
		var_e595f6c1 = var_e595f6c1 | 128;
	}
	if(self hasPerk("specialty_widowswine"))
	{
		var_e595f6c1 = var_e595f6c1 | 256;
	}
	return var_e595f6c1;
}

/*
	Name: function_a7754cf7
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x10A90
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 4305
*/
function function_a7754cf7()
{
	var_d089df71 = 0;
	if(isdefined(self.afk) && self.afk)
	{
		var_d089df71 = var_d089df71 | 1;
	}
	if(self IsReloading())
	{
		var_d089df71 = var_d089df71 | 2;
	}
	if(self GamepadUsedLast())
	{
		var_d089df71 = var_d089df71 | 4;
	}
	return var_d089df71;
}

/*
	Name: function_73cb043f
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x10B28
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 4333
*/
function function_73cb043f()
{
	self endon("disconnect");
	level flag::wait_till("initial_blackscreen_passed");
	if(level.script == "zm_moon")
	{
		self thread function_d4a986d9();
	}
	else
	{
		self thread function_ed8831ad();
	}
	player_num = self GetEntityNumber();
	for(;;)
	{
		util::wait_network_frame();
		self function_5a9db9c7(player_num);
	}
}

/*
	Name: function_5a9db9c7
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x10BF0
	Size: 0x470
	Parameters: 1
	Flags: None
	Line Number: 4363
*/
function function_5a9db9c7(player_num)
{
	returns = 64000;
	if(self laststand::player_is_in_laststand() && zm_utility::is_player_valid(self, 0, 1))
	{
		if(isdefined(self.bleedout_time))
		{
			if(isdefined(self.reviveTrigger.beingRevived) && self.reviveTrigger.beingRevived)
			{
				health = self.bleedout_time;
				self function_3c1488cf("hp,2," + player_num);
			}
			else if(level flag::get("wait_and_revive"))
			{
				health = self.bleedout_time;
				self function_3c1488cf("hp,3," + player_num);
			}
			else
			{
				health = self.bleedout_time;
				self function_3c1488cf("hp,1," + player_num);
			}
		}
		else
		{
			self function_3c1488cf("hp,1," + player_num);
			health = 1;
		}
		if(health > 99)
		{
			health = 99;
		}
		returns = 1000;
	}
	else
	{
		self function_3c1488cf("hp,0," + player_num);
		if(isdefined(self.sessionstate) && self.sessionstate == "playing")
		{
			health = self.maxhealth;
			if(health > 990)
			{
				health = 990;
			}
			health = health / 10;
			returns = Int(64 * self getnormalhealth()) * 1000;
			if(returns <= 2000)
			{
				returns = 2000;
			}
		}
		else
		{
			returns = 1000;
		}
	}
	var_7af42a5e = self function_49ac4bdc();
	var_d089df71 = self function_a7754cf7();
	var_5edc89bc = 0;
	if(isdefined(self.bgb))
	{
		var_5edc89bc = tableLookup("gamedata/tables/common/box_chance.csv", 34, self.bgb, 32);
		var_5edc89bc = Int(var_5edc89bc) * 1000;
	}
	self.returns = returns + var_7af42a5e;
	self.Captures = Int(var_5edc89bc + var_d089df71 * 100 + health);
	if(!isdefined(level._custom_perks) && (isdefined(level._custom_perks) && level._custom_perks.size == 0))
	{
		return;
	}
	var_f6cbf6ce = self zm_utility::get_player_perk_purchase_limit();
	if(self bgb::is_enabled("zm_bgb_unquenchable"))
	{
		var_f6cbf6ce++;
	}
	if(self bgb::is_enabled("zm_bgb_soda_fountain"))
	{
		var_f6cbf6ce = level._custom_perks.size;
	}
	if(isdefined(var_f6cbf6ce))
	{
		if(var_f6cbf6ce > level._custom_perks.size)
		{
			var_f6cbf6ce = level._custom_perks.size;
		}
		if(self clientfield::get_player_uimodel("hudItems.aaePerkSlot") != var_f6cbf6ce)
		{
			self clientfield::set_player_uimodel("hudItems.aaePerkSlot", var_f6cbf6ce);
		}
	}
}

/*
	Name: function_3c1488cf
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x11068
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 4465
*/
function function_3c1488cf(stats)
{
	if(self.var_26b9adeb != stats)
	{
		self util::setClientSysState("deadshot_keyline", stats, self);
		self.var_26b9adeb = stats;
	}
}

/*
	Name: function_1427c64c
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x110B8
	Size: 0x518
	Parameters: 0
	Flags: None
	Line Number: 4484
*/
function function_1427c64c()
{
	var_22ce02e1 = 0;
	primaryWeapons = self getweaponslistprimaries();
	currentWeapon = self GetCurrentWeapon();
	foreach(weapon in self GetWeaponsList(1))
	{
		if(weapon.isRiotShield || weapon.name == "misc_shield")
		{
			var_22ce02e1 = 1;
			if(isdefined(currentWeapon) && weapon == currentWeapon)
			{
				if(primaryWeapons[0] != self GetStowedWeapon())
				{
					self zm_weapons::set_stowed_weapon(primaryWeapons[0]);
				}
			}
			else if(weapon != self GetStowedWeapon())
			{
				self zm_weapons::set_stowed_weapon(weapon);
			}
		}
		if(var_22ce02e1 && isdefined(var_22ce02e1))
		{
			return;
		}
		if(!weapon.isRiotShield && weapon.name != "misc_shield")
		{
			foreach(weapon in primaryWeapons)
			{
				if(primaryWeapons.size > 3)
				{
					if(primaryWeapons[0] != self GetStowedWeapon())
					{
						self zm_weapons::set_stowed_weapon(primaryWeapons[0]);
					}
				}
				if(primaryWeapons.size == 3)
				{
					if(isdefined(currentWeapon) && weapon == currentWeapon && weapon == primaryWeapons[0])
					{
						if(primaryWeapons[1] != self GetStowedWeapon())
						{
							self zm_weapons::set_stowed_weapon(primaryWeapons[1]);
						}
					}
					if(isdefined(currentWeapon) && weapon == currentWeapon && weapon == primaryWeapons[1])
					{
						if(primaryWeapons[2] != self GetStowedWeapon())
						{
							self zm_weapons::set_stowed_weapon(primaryWeapons[2]);
						}
					}
					if(isdefined(currentWeapon) && weapon == currentWeapon && weapon == primaryWeapons[2])
					{
						if(primaryWeapons[0] != self GetStowedWeapon())
						{
							self zm_weapons::set_stowed_weapon(primaryWeapons[0]);
							continue;
						}
					}
				}
				if(isdefined(currentWeapon) && weapon == currentWeapon && weapon == primaryWeapons[0] && primaryWeapons.size == 2)
				{
					if(primaryWeapons[1] != self GetStowedWeapon())
					{
						self zm_weapons::set_stowed_weapon(primaryWeapons[1]);
					}
				}
				if(isdefined(currentWeapon) && weapon == currentWeapon && weapon == primaryWeapons[1] && primaryWeapons.size == 2)
				{
					if(primaryWeapons[0] != self GetStowedWeapon())
					{
						self zm_weapons::set_stowed_weapon(primaryWeapons[0]);
					}
				}
			}
		}
	}
	if(var_22ce02e1 && isdefined(var_22ce02e1))
	{
		return;
	}
	if(primaryWeapons.size < 2)
	{
		self zm_weapons::clear_stowed_weapon();
	}
}

/*
	Name: pap_taken
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x115D8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 4583
*/
function pap_taken()
{
	self endon("disconnect");
	self endon("death");
	while(isdefined(self))
	{
		self waittill("pap_taken");
		self waittill("weapon_change");
		self function_da8e1604();
	}
}

/*
	Name: function_da8e1604
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x11638
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 4605
*/
function function_da8e1604()
{
	upgradedweapon = self GetCurrentWeapon();
	if(zm_weapons::is_weapon_upgraded(upgradedweapon))
	{
		baseWeapon = zm_weapons::get_base_weapon(upgradedweapon);
		if(isdefined(upgradedweapon.displayName))
		{
			var_de745693 = upgradedweapon.displayName;
		}
		else
		{
			var_de745693 = upgradedweapon.name;
		}
		if(isdefined(baseWeapon.displayName))
		{
			var_e2dc2ac5 = baseWeapon.displayName;
		}
		else
		{
			var_e2dc2ac5 = baseWeapon.name;
		}
		namespace_22b67853::function_f105c5b1("pap_taken", self);
		thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦SUBEVENT_GOT_PAPâ¦ â¦" + var_e2dc2ac5 + "â¦ (â¦" + var_de745693 + "â¦)â¦SUBEVENT_DOTâ¦");
	}
	if(isdefined(self.var_def06a03) && self.var_def06a03 >= 50)
	{
		self zm_score::add_to_player_score(50);
	}
	wait(1);
}

/*
	Name: function_b05e1da5
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x117D8
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 4647
*/
function function_b05e1da5(ignore_enabled_check)
{
	zone = undefined;
	keys = getArrayKeys(level.zones);
	for(i = 0; i < keys.size; i++)
	{
		if(self zm_zonemgr::entity_in_zone(keys[i], ignore_enabled_check))
		{
			zone = keys[i];
			break;
		}
	}
	return zone;
}

/*
	Name: function_ca9b0920
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x11888
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 4672
*/
function function_ca9b0920()
{
	zone_enabled = self function_b05e1da5(0);
	if(isdefined(zone_enabled))
	{
		if(zone_enabled != "zone_robot_head" && zone_enabled != "foyer_zone")
		{
			self.var_b6beb897 = self GetOrigin();
		}
	}
}

/*
	Name: function_74ee81a3
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x11908
	Size: 0x480
	Parameters: 0
	Flags: None
	Line Number: 4694
*/
function function_74ee81a3()
{
	self endon("disconnect");
	self endon("death");
	modvar("zm_share", 1000);
	modvar("zm_tex", 10);
	self.var_f931eded = 0;
	version = MakeLocalizedString("PLATFORM_AAE_VERSION");
	self thread function_2c8435cc();
	for(;;)
	{
		wait(0.05);
		if(!self zm::in_kill_brush() && (self zm::in_life_brush() || self zm::in_enabled_playable_area()) && self IsOnGround() && !self issprinting() && !self IsWallRunning() && length(self getvelocity()) <= 0)
		{
			self function_ca9b0920();
		}
		if(self IsTestClient())
		{
		}
		else if(self GamepadUsedLast() || IsSubStr(version, "TU24"))
		{
			if(self ActionSlotThreeButtonPressed() && self meleeButtonPressed())
			{
				self function_2ea35bc3();
				while(self ActionSlotThreeButtonPressed())
				{
					wait(0.05);
				}
			}
			else if(self ActionSlotFourButtonPressed() && self meleeButtonPressed())
			{
				self function_49bb31ad();
				while(self ActionSlotFourButtonPressed())
				{
					wait(0.05);
				}
			}
			else if(self JumpButtonPressed() && self WeaponSwitchButtonPressed())
			{
				self flash();
				while(self JumpButtonPressed())
				{
					wait(0.05);
				}
			}
			else if(self ReloadButtonPressed() && self WeaponSwitchButtonPressed())
			{
				self function_2eae6dbc();
				while(self ReloadButtonPressed() || self WeaponSwitchButtonPressed())
				{
					wait(0.05);
				}
			}
			else if(self AdsButtonPressed() && self useButtonPressed())
			{
				self function_394473a2();
				while(self AdsButtonPressed() || self useButtonPressed())
				{
					wait(0.05);
				}
			}
			else if(self meleeButtonPressed())
			{
				self function_35c09470();
				while(self meleeButtonPressed())
				{
					wait(0.05);
				}
			}
		}
	}
}

/*
	Name: flash
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x11D90
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 4777
*/
function flash()
{
	if(isdefined(self))
	{
		util::setClientSysState("deadshot_keyline", "fl,1", self);
	}
}

/*
	Name: function_35c09470
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x11DC8
	Size: 0x440
	Parameters: 0
	Flags: None
	Line Number: 4795
*/
function function_35c09470()
{
	zombie_doors = ArrayCombine(GetEntArray("zombie_door", "targetname"), GetEntArray("zombie_debris", "targetname"), 0, 0);
	zombie_doors = ArrayCombine(zombie_doors, GetEntArray("zombie_airlock_buy", "targetname"), 0, 0);
	zombie_door = ArrayGetClosest(self GetEye(), zombie_doors, 200);
	if(isdefined(zombie_door.script_noteworthy) && (zombie_door.script_noteworthy == "electric_door" || zombie_door.script_noteworthy == "electric_buyable_door" || zombie_door.script_noteworthy == "local_electric_door" || zombie_door.script_noteworthy == "kill_counter_door"))
	{
		return;
	}
	if(isdefined(zombie_door) && self istouching(zombie_door) && !isdefined(zombie_door.purchaser) && (!(isdefined(zombie_door._door_open) && zombie_door._door_open)))
	{
		if(isdefined(zombie_door.zombie_cost) && zombie_door.zombie_cost)
		{
			if(!isdefined(zombie_door.var_6dcd55d2))
			{
				cost = Int(zombie_door.zombie_cost / 20) * 10;
				if(self zm_score::can_player_purchase(cost))
				{
					zm_utility::play_sound_at_pos("purchase", self.origin);
					self zm_score::minus_to_player_score(cost);
					zombie_door.zombie_cost = cost;
					if(zombie_door.targetname === "zombie_debris")
					{
						namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦SUBEVENT_PAYHALF_DEBRISâ¦" + cost + "â¦SUBEVENT_DOTâ¦");
						zombie_door zm_utility::set_hint_string(zombie_door, "default_buy_debris", cost);
					}
					else
					{
						namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦SUBEVENT_PAYHALF_DOORâ¦" + cost + "â¦SUBEVENT_DOTâ¦");
						zombie_door zm_utility::set_hint_string(zombie_door, "default_buy_door", cost);
					}
					zombie_door.var_6dcd55d2 = 1;
				}
				else
				{
					zm_utility::play_sound_at_pos("no_purchase", zombie_door.origin);
					if(isdefined(level.custom_door_deny_vo_func))
					{
						self thread [[level.custom_door_deny_vo_func]]();
					}
					else if(isdefined(level.custom_generic_deny_vo_func))
					{
						self thread [[level.custom_generic_deny_vo_func]](1);
					}
					else
					{
						self zm_audio::create_and_play_dialog("general", "outofmoney");
						return;
					}
				}
			}
		}
		zm_utility::play_sound_at_pos("no_purchase", zombie_door.origin);
	}
}

/*
	Name: function_394473a2
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x12210
	Size: 0x378
	Parameters: 0
	Flags: None
	Line Number: 4861
*/
function function_394473a2()
{
	self endon("disconnect");
	self endon("death");
	if(isdefined(self.var_c1966de3) || self IsSwitchingWeapons())
	{
		return;
	}
	weapon = self GetCurrentWeapon();
	if(isdefined(weapon) && weapon.isRiotShield)
	{
		if(self IsMeleeing() || self issprinting() || !self IsOnGround() || self IsWallRunning())
		{
			self SetRiotshieldFailHint();
			return;
		}
		if(isdefined(self.var_f6dca7a8))
		{
			self.var_f6dca7a8 function_aa00172f();
		}
		self.var_c1966de3 = 1;
		shieldHealth = self DamageRiotShield(1) + 1;
		ammo = self getammocount(weapon);
		self zm_equipment::take(weapon);
		while(self hasRiotShield())
		{
			wait(0.05);
		}
		Earthquake(0.3, 0.5, self.origin, 100);
		self.var_f6dca7a8 = spawn("trigger_box_use", self.origin + VectorScale((0, 0, 1), 0.1), 0, 30, 20, 80);
		self.var_f6dca7a8.angles = self.angles;
		self.var_f6dca7a8.var_554b726a = function_6450d8fc(weapon, self, shieldHealth, self.origin);
		self.var_f6dca7a8.var_c7d61553 = ammo;
		self.var_f6dca7a8.targetname = "deploy_shield";
		self.var_f6dca7a8 playsound("fly_shield_plant_npc");
		self.var_f6dca7a8 SetInvisibleToAll();
		self.var_f6dca7a8 setcursorhint("HINT_WEAPON", weapon);
		self.var_f6dca7a8 setHintString(&"ZOMBIE_TRADE_WEAPON_FILL");
		self.var_f6dca7a8 thread function_acda7140(self, weapon);
		self.var_f6dca7a8 thread function_af7ee681(self, weapon);
		self.var_c1966de3 = undefined;
	}
}

/*
	Name: function_6450d8fc
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x12590
	Size: 0x160
	Parameters: 4
	Flags: None
	Line Number: 4915
*/
function function_6450d8fc(weapon, player, shieldHealth, origin)
{
	weapon_model = spawn("script_model", origin + VectorScale((0, 0, 1), 30));
	weapon_model MakeSentient();
	weapon_model setmaxhealth(weapon.weaponstarthitpoints);
	weapon_model setcandamage(0);
	weapon_model.angles = player.angles;
	weapon_model.weapon = weapon;
	weapon_model UseWeaponModel(weapon, function_abab24e6(shieldHealth, weapon));
	weapon_model.health = shieldHealth;
	weapon_model.owner = player;
	weapon_model.team = player.team;
	return weapon_model;
	continue;
}

/*
	Name: function_abab24e6
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x126F8
	Size: 0x1C8
	Parameters: 2
	Flags: None
	Line Number: 4941
*/
function function_abab24e6(shieldHealth, weapon)
{
	if(shieldHealth == weapon.weaponstarthitpoints && isdefined(weapon.worldmodel) && weapon.worldmodel != "")
	{
		return weapon.worldmodel;
	}
	if(shieldHealth < weapon.var_df8c2ef5 && isdefined(weapon.worlddamagedmodel3) && weapon.worlddamagedmodel3 != "")
	{
		return weapon.worlddamagedmodel3;
	}
	else if(shieldHealth < weapon.var_4e335ad6 && isdefined(weapon.worlddamagedmodel2) && weapon.worlddamagedmodel2 != "")
	{
		return weapon.worlddamagedmodel2;
	}
	else if(shieldHealth < weapon.var_2e736e8f && isdefined(weapon.worlddamagedmodel1) && weapon.worlddamagedmodel1 != "")
	{
		return weapon.worlddamagedmodel1;
	}
	else if(isdefined(weapon.worldmodel) && weapon.worldmodel != "")
	{
		return weapon.worldmodel;
	}
	return "";
}

/*
	Name: function_af7ee681
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x128C8
	Size: 0x128
	Parameters: 2
	Flags: None
	Line Number: 4976
*/
function function_af7ee681(player, weapon)
{
	self endon("hash_af7ee681");
	wait(0.1);
	while(isdefined(self) && isdefined(self.var_554b726a) && self.var_554b726a.health > 0)
	{
		if(!isdefined(player))
		{
			self function_aa00172f();
			return;
		}
		if(player hasRiotShield())
		{
			self function_aa00172f();
			return;
		}
		wait(0.05);
	}
	if(isdefined(player) && (!(isdefined(self.current_equipment) && self hasweapon(self.current_equipment))))
	{
		player clientfield::set_player_uimodel("hudItems.showDpadDown", 0);
	}
	self function_aa00172f();
}

/*
	Name: function_aa00172f
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x129F8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 5011
*/
function function_aa00172f()
{
	if(isdefined(self))
	{
		playFX(level._equipment_explode_fx_lg, self.var_554b726a.origin, undefined, undefined, 1);
		self.var_554b726a playsound("t8_shield_break");
		self.var_554b726a delete();
		self delete();
		return;
	}
}

/*
	Name: function_acda7140
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x12A90
	Size: 0x308
	Parameters: 2
	Flags: None
	Line Number: 5033
*/
function function_acda7140(owner, weapon)
{
	self endon("death");
	owner endon("disconnect");
	self zm_utility::create_zombie_point_of_interest(50, 8, 0, 1, undefined, &shield_zombie_arrive_func, owner.team);
	self thread zm_utility::create_zombie_point_of_interest_attractor_positions(4, 15);
	self thread zm_utility::wait_for_attractor_positions_complete();
	owner clientfield::set_player_uimodel("zmInventory.shield_health", self.var_554b726a.health / weapon.weaponstarthitpoints);
	wait(0.1);
	while(owner IsSwitchingWeapons() || owner useButtonPressed())
	{
		wait(0.05);
	}
	self setvisibletoplayer(owner);
	for(;;)
	{
		self waittill("trigger", player);
		if(player == owner && !player IsSwitchingWeapons())
		{
			damage = weapon.weaponstarthitpoints - self.var_554b726a.health;
			ammo = self.var_c7d61553;
			self notify("hash_af7ee681");
			player function_be57ada9(weapon);
			player clientfield::set_player_uimodel("zmInventory.shield_health", weapon.weaponstarthitpoints - damage / weapon.weaponstarthitpoints);
			player SetWeaponAmmoClip(weapon, ammo);
			player DamageRiotShield(damage);
			player RefreshShieldAttachment();
			player SwitchToWeaponImmediate(weapon);
			if(isdefined(self) && isdefined(self.var_554b726a))
			{
				self.var_554b726a playsound("fly_equipment_pickup");
				self.var_554b726a delete();
				self delete();
				return;
			}
		}
	}
}

/*
	Name: function_8696b6e0
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x12DA0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 5082
*/
function function_8696b6e0()
{
	return;
}

/*
	Name: function_be57ada9
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x12DB0
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 5097
*/
function function_be57ada9(equipment)
{
	if(!isdefined(equipment))
	{
		return;
	}
	if(!isdefined(level.zombie_equipment[equipment]))
	{
		return;
	}
	if(self zm_equipment::has_player_equipment(equipment))
	{
		return;
	}
	self zm_equipment::take();
	self zm_equipment::set_player_equipment(equipment);
	self GiveWeapon(equipment);
	self zm_equipment::set_equipment_invisibility_to_player(equipment, 1);
	self SetActionSlot(2, "weapon", equipment);
	self thread zm_equipment::slot_watcher(equipment);
	self notify("player_given", equipment);
	if(equipment.isRiotShield)
	{
		if(isdefined(self.player_shield_reset_health))
		{
			self [[self.player_shield_reset_health]]();
		}
	}
}

/*
	Name: function_658a288
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x12EE8
	Size: 0x40
	Parameters: 3
	Flags: None
	Line Number: 5137
*/
function function_658a288(weapon, damage, ammo)
{
	self endon("death");
	self endon("disconnect");
	self endon("bled_out");
}

/*
	Name: shield_zombie_arrive_func
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x12F30
	Size: 0x398
	Parameters: 1
	Flags: None
	Line Number: 5154
*/
function shield_zombie_arrive_func(POI)
{
	self endon("death");
	if(isdefined(self.var_9dbbde90) || self.team == POI.var_554b726a.team)
	{
		return;
	}
	if(isdefined(self.archetype) && self.archetype == "zombie" && isdefined(self.targetname) && self.targetname === "zombie")
	{
	}
	else if(!isdefined(self.ignore_poi_targetname))
	{
		self.ignore_poi_targetname = [];
	}
	if(!IsInArray(self.ignore_poi_targetname, "deploy_shield"))
	{
		self.ignore_poi_targetname[self.ignore_poi_targetname.size] = "deploy_shield";
		return;
	}
	self.var_9dbbde90 = 1;
	self LookAtEntity(POI);
	self waittill("goal");
	var_5971c136 = "ai_zombie_base_ad_attack_v1";
	n_damage = 45;
	while(isdefined(POI))
	{
		if(self.team == POI.var_554b726a.team)
		{
			return;
		}
		self LookAtEntity(POI);
		wait(0.2);
		speed = self function_a4237df3();
		animlength = getanimlength(var_5971c136) * 0.5 / speed;
		self AnimScripted("melee", self.origin, self.angles, var_5971c136, "normal", undefined, speed, 0.5, 0.5);
		wait(animlength);
		if(isdefined(POI.var_554b726a))
		{
			POI.var_554b726a.health = POI.var_554b726a.health - n_damage;
			playsoundatposition("fly_riotshield_zm_impact_zombies", POI.origin);
			POI.var_554b726a UseWeaponModel(POI.var_554b726a.weapon, function_abab24e6(POI.var_554b726a.health, POI.var_554b726a.weapon));
			if(isdefined(POI.var_554b726a.owner))
			{
				POI.var_554b726a.owner clientfield::set_player_uimodel("zmInventory.shield_health", POI.var_554b726a.health / POI.var_554b726a.weapon.weaponstarthitpoints);
			}
		}
		wait(animlength);
	}
	self.var_9dbbde90 = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a4237df3
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x132D0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 5217
*/
function function_a4237df3()
{
	switch(self.zombie_move_speed)
	{
		case "run":
		{
			return 1.33;
			break;
		}
		case "sprint":
		{
			return 1.66;
			break;
		}
		case "super_sprint":
		{
			return 2;
			break;
		}
	}
	return 1;
}

/*
	Name: function_2c8435cc
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x13338
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 5250
*/
function function_2c8435cc()
{
	self endon("disconnect");
	self endon("death");
	level endon("end_game");
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		if(menu == "StartMenu_Main" && isalive(self))
		{
			if(isdefined(level.var_ac8c4fea[response]))
			{
				self thread [[level.var_ac8c4fea[response]]]();
			}
			if(IsSubStr(response, "player_fps"))
			{
				fps = StrTok(response, ",");
				self.Plants = Int(fps[1]);
			}
			if(IsSubStr(response, "ischat"))
			{
				fps = StrTok(response, ",");
				self.var_8f551329 = Int(fps[1]);
			}
		}
	}
}

/*
	Name: function_fcd8d89f
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x134B8
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 5288
*/
function function_fcd8d89f()
{
	function_29982504("aae_mark_pos", &function_49bb31ad);
	function_29982504("aae_flashlight", &flash);
	function_29982504("aae_dni", &function_599b8ddb);
	function_29982504("aae_share_points", &function_2ea35bc3);
	function_29982504("aae_print", &function_2eae6dbc);
	function_29982504("aae_hud", &function_f81ffcf6);
	function_29982504("aae_mapview", &function_2272dd8);
	function_29982504("aae_shield", &function_394473a2);
	function_29982504("aae_setmulekick", &function_7d8d1eae);
	function_29982504("aae_buyhalf", &function_35c09470);
	function_29982504("aae_camoback", &function_a9afef72);
	function_29982504("aae_camonext", &function_a9c5171c);
	function_29982504("aae_opticback", &function_15fd7857);
	function_29982504("aae_opticnext", &function_be91ab79);
}

/*
	Name: function_a9afef72
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x136F8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 5316
*/
function function_a9afef72()
{
	weapon = self GetCurrentWeapon();
	if(isdefined(weapon) && level.weaponNone != weapon && weapon.inventoryType == "primary")
	{
		self NextPlayerRenderOption("camo", 0);
	}
}

/*
	Name: function_a9c5171c
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x13780
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 5335
*/
function function_a9c5171c()
{
	weapon = self GetCurrentWeapon();
	if(isdefined(weapon) && level.weaponNone != weapon && weapon.inventoryType == "primary")
	{
		self NextPlayerRenderOption("camo", 1);
	}
}

/*
	Name: function_15fd7857
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x13810
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 5354
*/
function function_15fd7857()
{
	weapon = self GetCurrentWeapon();
	if(isdefined(weapon) && level.weaponNone != weapon && weapon.inventoryType == "primary")
	{
		attachments = StrTok(weapon.name, "+");
		foreach(Attach in attachments)
		{
			if(Attach == "reflex" || Attach == "acog" || Attach == "ir" || Attach == "dualoptic")
			{
				self NextPlayerRenderOption("reticle", 0);
				return;
			}
		}
	}
}

/*
	Name: function_be91ab79
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x13978
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 5381
*/
function function_be91ab79()
{
	weapon = self GetCurrentWeapon();
	if(weapon.inventoryType == "primary")
	{
		attachments = StrTok(weapon.name, "+");
		foreach(Attach in attachments)
		{
			if(Attach == "reflex" || Attach == "acog" || Attach == "ir" || Attach == "dualoptic")
			{
				self NextPlayerRenderOption("reticle", 1);
				return;
			}
		}
	}
}

/*
	Name: function_7d8d1eae
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x13AD0
	Size: 0x298
	Parameters: 0
	Flags: None
	Line Number: 5408
*/
function function_7d8d1eae()
{
	self notify("hash_7d8d1eae");
	self endon("hash_7d8d1eae");
	self endon("disconnect");
	weapons = self getweaponslistprimaries();
	if(weapons.size > 2 && self hasPerk("specialty_additionalprimaryweapon") && zm_utility::is_player_valid(self, 0, 0))
	{
		weapon = self GetCurrentWeapon();
		if(weapon != level.weaponNone && weapon.inventoryType == "primary" && !self zm_utility::is_multiple_drinking() && !self zm_utility::has_powerup_weapon())
		{
			var_3b51ef06 = self function_96f53b96(weapon);
			if(isdefined(var_3b51ef06) && var_3b51ef06 != level.weaponNone && var_3b51ef06 != weapon)
			{
				weapon_data = zm_weapons::get_player_weapondata(self, weapon);
				var_b785587d = zm_weapons::get_player_weapondata(self, var_3b51ef06);
				self TakeWeapon(var_3b51ef06);
				self TakeWeapon(weapon);
				weapon = self zm_weapons::weapondata_give(var_b785587d, undefined, undefined, 1);
				self function_92dca8b7(weapon, 0);
				var_3b51ef06 = self zm_weapons::weapondata_give(weapon_data, undefined, undefined, 1);
				self function_92dca8b7(var_3b51ef06, 0);
				self playlocalsound("set_mulekick");
				self notify("hash_1c748418");
			}
		}
	}
}

/*
	Name: function_2272dd8
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x13D70
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 5447
*/
function function_2272dd8()
{
	if(isdefined(self.var_e23018e4))
	{
		self notify("hash_3128fe8");
	}
	else
	{
		self thread namespace_aab1d308::function_e2db1ae();
	}
}

/*
	Name: function_f81ffcf6
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x13DB0
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 5469
*/
function function_f81ffcf6()
{
	if(isdefined(self.var_a09dcd5a) || isdefined(self.current_player_scene))
	{
		return;
	}
	if(!isdefined(self.gamevars["hardcore"]))
	{
		self.gamevars["hardcore"] = 1;
		self setClientUIVisibilityFlag("hud_visible", 0);
		self setClientUIVisibilityFlag("weapon_hud_visible", 0);
	}
	else
	{
		self.gamevars["hardcore"] = undefined;
		self setClientUIVisibilityFlag("hud_visible", 1);
		self setClientUIVisibilityFlag("weapon_hud_visible", 1);
	}
}

/*
	Name: function_2eae6dbc
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x13EA0
	Size: 0x270
	Parameters: 0
	Flags: None
	Line Number: 5499
*/
function function_2eae6dbc()
{
	self endon("disconnect");
	if(isdefined(self.var_b7f134ff) || self GetEntityNumber() == 9)
	{
		return;
	}
	self.var_b7f134ff = 1;
	self namespace_3d0867a6::function_18df83fb("print");
	wait(0.23);
	if(isdefined(self.var_49603ad2))
	{
		self.var_49603ad2 delete();
	}
	num = self GetEntityNumber();
	LUINotifyEvent(&"aae_print", 1, num);
	level notify("aae_print_update" + num);
	var_22ae50 = self GetPlayerCameraPos();
	player_angles = self getPlayerAngles();
	self playsoundtoallbutplayer("fly_aae_print_npc", self);
	self playlocalsound("fly_aae_print");
	trace = beamtrace(var_22ae50, var_22ae50 + AnglesToForward(player_angles) * 10000, 1, self);
	self.var_49603ad2 = spawn("script_model", trace["position"]);
	self.var_49603ad2 thread function_2b16e57d(num, self);
	self.var_49603ad2 SetModel("ui3d_print" + num);
	self.var_49603ad2.angles = VectorToAngles(trace["normal"]);
	wait(0.5);
	self.var_b7f134ff = undefined;
	return;
}

/*
	Name: function_2b16e57d
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x14118
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 5540
*/
function function_2b16e57d(num, player)
{
	level endon("aae_print_update" + num);
	self endon("death");
	while(isdefined(player) || isdefined(self))
	{
		wait(1);
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: gun_pos
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x14188
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 5564
*/
function gun_pos()
{
	if(!isdefined(self.gun_pos))
	{
		self.gun_pos = 0;
	}
	self.gun_pos++;
	if(self.gun_pos > 2)
	{
		self.gun_pos = 0;
	}
	switch(self.gun_pos)
	{
		case 0:
		{
			util::setClientSysState("left_ges_event", "tag_fill_light", self);
			break;
		}
		case 1:
		{
			util::setClientSysState("left_ges_event", "tag_torso", self);
			break;
		}
		case 2:
		{
			util::setClientSysState("left_ges_event", "tag_view", self);
			break;
		}
	}
	return;
	continue;
}

/*
	Name: function_91bf5d68
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x14278
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 5607
*/
function function_91bf5d68()
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	var_e3955304 = ArrayGetClosest(self.origin, vending_triggers);
	perk = "specialty_widowswine";
	if(level.script == "zm_factory" || level.script == "zm_sumpf" || level.script == "zm_prison")
	{
		perk = "specialty_armorvest";
	}
	if(var_e3955304.script_noteworthy === perk && (isdefined(var_e3955304.power_on) && var_e3955304.power_on) && Distance(var_e3955304.origin, self.origin) <= 100)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_2ea35bc3
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x143A8
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 5633
*/
function function_2ea35bc3()
{
	self endon("disconnect");
	if(!isdefined(self.var_884bfee0))
	{
		if(isdefined(self.score) && self.score >= GetDvarInt("zm_share") + GetDvarInt("zm_tex"))
		{
			self.var_884bfee0 = 1;
			self iprintln(&"ELMG_SHARE_DROP", GetDvarInt("zm_share"));
			self thread function_abfba8e1();
			self thread zm_powerups::specific_powerup_drop("share_point_powerup", self.origin + AnglesToForward(self.angles) * 60, undefined, undefined, undefined, undefined, 1);
			if(!self hasPerk("specialty_flakjacket") && isdefined(level.var_508fe397))
			{
				if(self zm_score::can_player_purchase(2000) && self function_91bf5d68())
				{
					self zm_score::minus_to_player_score(2000);
					self zm_perks::give_perk("specialty_flakjacket");
				}
			}
			thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦SUBEVENT_DROPSOMEâ¦â¦SUBEVENT_DOTâ¦");
			wait(0.5);
			self.var_884bfee0 = undefined;
		}
		else
		{
			self IPrintLnBold(&"ELMG_SHARE_OUT");
		}
	}
}

/*
	Name: function_599b8ddb
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x145B0
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 5673
*/
function function_599b8ddb()
{
	if(self.var_f931eded)
	{
		self playlocalsound("gdt_oed_off");
		self.var_f931eded = 0;
		if(!isdefined(self.var_494104fc))
		{
			self namespace_d87f1aa7::function_908a81cd("r_postFxIndexâ¦-1");
		}
	}
	else
	{
		self playlocalsound("gdt_oed_on");
		self.var_f931eded = 1;
		if(!isdefined(self.var_494104fc))
		{
			self namespace_d87f1aa7::function_908a81cd("r_postFxIndexâ¦1");
		}
	}
}

/*
	Name: function_29982504
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x14678
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 5705
*/
function function_29982504(name, func)
{
	if(!isdefined(level.var_ac8c4fea))
	{
		level.var_ac8c4fea = [];
	}
	if(isdefined(name) && isdefined(func))
	{
		level.var_ac8c4fea[name] = func;
	}
}

/*
	Name: function_49bb31ad
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x146D8
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 5727
*/
function function_49bb31ad()
{
	self endon("disconnect");
	if(isdefined(self.var_49bb31ad))
	{
		return;
	}
	self.var_49bb31ad = 1;
	if(isdefined(self.var_5851086a))
	{
		self function_133a72ad();
		self notify("hash_c4ad4db4");
		self notify("hash_3b8f7cfb");
		gameobjects::release_obj_id(self.var_5851086a);
		objective_delete(self.var_5851086a);
		self.var_5851086a = undefined;
		self playlocalsound("t8_marker_canel");
	}
	else
	{
		self.var_5851086a = gameobjects::get_next_obj_id();
		var_872d189 = self function_dd98a270();
		if(IsArray(var_872d189) && var_872d189.size == 2)
		{
			objective_add(self.var_5851086a, "active", var_872d189[0], var_872d189[1], self);
			self thread function_c4ad4db4(self.var_5851086a, var_872d189[0]);
			self playlocalsound("t8_marker_hit");
			self namespace_3d0867a6::function_18df83fb("point_out");
		}
	}
	wait(0.7);
	self.var_49bb31ad = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_bb3889fe
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x148B8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 5773
*/
function function_bb3889fe()
{
	vending_triggers = [];
	var_18102538 = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < var_18102538.size; i++)
	{
		if(!var_18102538[i].machine ishidden())
		{
			vending_triggers[vending_triggers.size] = var_18102538[i];
		}
	}
	return vending_triggers;
}

/*
	Name: function_dd98a270
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x14970
	Size: 0x9E8
	Parameters: 0
	Flags: None
	Line Number: 5797
*/
function function_dd98a270()
{
	marker = self GetEntityNumber();
	var_81e03bee = self GetPlayerCameraPos();
	player_angles = self getPlayerAngles();
	target = var_81e03bee + AnglesToForward(player_angles) * 60;
	range = var_81e03bee + AnglesToForward(player_angles) * 20000;
	trace = beamtrace(var_81e03bee, range, 1, self);
	position = trace["position"];
	if(isdefined(trace["entity"]))
	{
		if(IsActor(trace["entity"]) || isVehicle(trace["entity"]))
		{
			marker = &"elmg_player_zombie";
			return Array(trace["entity"], marker);
		}
		else
		{
			OBJ_NAME = tableLookup("gamedata/tables/common/box_chance.csv", 22, trace["entity"].targetname, 23);
			if(isdefined(OBJ_NAME) && OBJ_NAME != "")
			{
				return Array(trace["entity"], istring(OBJ_NAME));
			}
			else
			{
				OBJ_NAME = tableLookup("gamedata/tables/common/box_chance.csv", 22, trace["entity"].target, 23);
				if(isdefined(OBJ_NAME) && OBJ_NAME != "")
				{
					return Array(trace["entity"], istring(OBJ_NAME));
				}
			}
		}
	}
	if(isdefined(position))
	{
		var_53fdb5c1 = [];
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, GetEntArray("bowie_upgrade", "targetname"));
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, GetEntArray("sickle_upgrade", "targetname"));
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, GetEntArray("tazer_upgrade", "targetname"));
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, GetEntArray("claymore_purchase", "targetname"));
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, GetEntArray("zombie_door", "targetname"));
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, GetEntArray("zombie_debris", "targetname"));
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, GetEntArray("flag_blocker", "targetname"));
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, level._spawned_wallbuys);
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, function_bb3889fe());
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, GetEntArray("use_elec_switch", "targetname"));
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, GetEntArray("use_power_switch", "targetname"));
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, GetEntArray("use_elec_switch_deferred", "targetname"));
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, GetEntArray("use_master_switch", "targetname"));
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, GetEntArray("perk_random_machine", "targetname"));
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, GetEntArray("random_perk_machine", "targetname"));
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, level.chests);
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, level.pack_a_punch.triggers);
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, level.bgb_machines);
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, struct::get_array("exterior_goal", "targetname"));
		var_53fdb5c1[var_53fdb5c1.size] = ArrayGetClosest(position, level.a_uts_craftables);
		var_53fdb5c1 = ArrayGetClosest(position, var_53fdb5c1, 70);
		if(isdefined(var_53fdb5c1))
		{
			if(isdefined(var_53fdb5c1.targetname))
			{
				if(var_53fdb5c1.targetname == "zombie_vending")
				{
					if(isdefined(var_53fdb5c1.script_noteworthy))
					{
						target = var_53fdb5c1.origin;
						marker = var_53fdb5c1.script_noteworthy;
					}
					var_1d900d60 = 1;
				}
				else if(var_53fdb5c1.targetname == "exterior_goal" && isdefined(var_53fdb5c1.trigger_location))
				{
					target = var_53fdb5c1.trigger_location.origin;
					marker = var_53fdb5c1.targetname;
				}
				else
				{
					target = var_53fdb5c1.origin;
					marker = var_53fdb5c1.targetname;
				}
			}
			else if(isdefined(var_53fdb5c1.target))
			{
				target = var_53fdb5c1.origin;
				marker = var_53fdb5c1.target;
			}
			else
			{
				target = position;
			}
		}
		else
		{
			target = position;
		}
	}
	marker = tableLookup("gamedata/tables/common/box_chance.csv", 22, marker, 23);
	if(isdefined(marker) && marker != "")
	{
		marker = istring(marker);
	}
	else if(isdefined(var_1d900d60))
	{
		marker = &"elmg_player_perks";
	}
	else
	{
		marker = istring(tableLookup("gamedata/tables/common/box_chance.csv", 22, self GetEntityNumber(), 23));
	}
	return Array(target, marker);
}

/*
	Name: function_c4ad4db4
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x15360
	Size: 0x168
	Parameters: 2
	Flags: None
	Line Number: 5919
*/
function function_c4ad4db4(objId, target)
{
	if(!isdefined(objId))
	{
		objId = 0;
	}
	self notify("hash_c4ad4db4");
	self endon("hash_c4ad4db4");
	origin = target;
	if(IsEntity(target))
	{
		target endon("death");
		self thread function_3b8f7cfb(objId, target);
		self thread function_7ee89239(objId, target);
		origin = target.origin;
	}
	self function_e50735bc(origin);
	self util::waittill_any("disconnect", "bledout", "death");
	self function_133a72ad();
	objective_delete(objId);
	if(isdefined(self))
	{
		if(isdefined(self.var_5851086a))
		{
			self.var_5851086a = undefined;
			return;
		}
	}
	waittillframeend;
}

/*
	Name: function_e50735bc
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x154D0
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 5960
*/
function function_e50735bc(origin)
{
	if(!isdefined(level.var_7e0a3e49))
	{
		level.var_7e0a3e49 = [];
	}
	level.var_7e0a3e49[self.guid + self.var_5851086a] = origin;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_133a72ad
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x15520
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 5981
*/
function function_133a72ad(origin)
{
	if(isdefined(level.var_7e0a3e49))
	{
		if(isdefined(level.var_7e0a3e49[self.guid + self.var_5851086a]))
		{
			keys = getArrayKeys(level.var_7e0a3e49);
			var_5144551e = [];
			foreach(key in keys)
			{
				if(key != self.guid + self.var_5851086a)
				{
					var_5144551e[key] = level.var_7e0a3e49[key];
				}
			}
			level.var_7e0a3e49 = var_5144551e;
		}
	}
}

/*
	Name: function_3b8f7cfb
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x15640
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 6011
*/
function function_3b8f7cfb(objId, target)
{
	self notify("hash_3b8f7cfb");
	self endon("hash_3b8f7cfb");
	target waittill("death");
	self notify("hash_7ee89239");
	objective_delete(objId);
	if(isdefined(self.var_5851086a) && isdefined(self))
	{
		self.var_5851086a = undefined;
	}
}

/*
	Name: function_7ee89239
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x156D0
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 6034
*/
function function_7ee89239(objId, target)
{
	self notify("hash_7ee89239");
	self endon("hash_7ee89239");
	target endon("death");
	while(!target ishidden() || isdefined(target))
	{
		wait(0.05);
	}
	self notify("hash_3b8f7cfb");
	objective_delete(objId);
	if(isdefined(self.var_5851086a) && isdefined(self))
	{
		self.var_5851086a = undefined;
	}
}

/*
	Name: function_abfba8e1
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x15790
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 6061
*/
function function_abfba8e1()
{
	self function_47f70c4d(GetDvarInt("zm_share"));
	if(!isdefined(self.var_d97c35aa))
	{
		wait(0.01);
		self function_47f70c4d(GetDvarInt("zm_tex"));
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_595421f0
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x15808
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 6083
*/
function function_595421f0(points)
{
	self.score = self.score + points;
}

/*
	Name: function_47f70c4d
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x15830
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 6098
*/
function function_47f70c4d(points)
{
	self.score = self.score - points;
}

/*
	Name: function_8f90dcdb
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x15858
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 6113
*/
function function_8f90dcdb()
{
	self endon("disconnect");
	self endon("death");
	var_f4b89b04 = Array("fake_death", "death", "player_downed", "weapon_change", "perk_abort_drinking", "weapon_give", "shield_update", "aae_setmulekick");
	for(;;)
	{
		self util::waittill_any_array(var_f4b89b04);
		if(self getweaponslistprimaries().size >= 4 && self hasPerk("specialty_additionalprimaryweapon") && (isdefined(self getweaponslistprimaries()[2]) && self GetCurrentWeapon() == self getweaponslistprimaries()[2] || (isdefined(self getweaponslistprimaries()[3]) && self GetCurrentWeapon() == self getweaponslistprimaries()[3])) && zm_weapons::is_weapon_or_base_included(self GetCurrentWeapon().rootweapon) && !self isusingoffhand())
		{
			self function_b60392ac(1);
		}
		else
		{
			self function_b60392ac(0);
		}
	}
}

/*
	Name: function_4e37195d
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x15A58
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 6142
*/
function function_4e37195d()
{
	self endon("disconnect");
	self endon("death");
	var_f4b89b04 = Array("fake_death", "death", "player_downed", "weapon_change", "perk_abort_drinking", "weapon_give", "shield_update", "aae_setmulekick");
	for(;;)
	{
		self util::waittill_any_array(var_f4b89b04);
		self function_c7e6eabd();
	}
}

/*
	Name: function_b60392ac
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x15B10
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 6164
*/
function function_b60392ac(stats)
{
	if(!isdefined(self.var_34cad600))
	{
		self.var_34cad600 = stats;
		self util::setClientSysState("deadshot_keyline", "m," + stats, self);
	}
	if(isdefined(self.var_34cad600) && self.var_34cad600 != stats)
	{
		self.var_34cad600 = stats;
		self util::setClientSysState("deadshot_keyline", "m," + stats, self);
	}
}

/*
	Name: function_c7e6eabd
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x15BB8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 6188
*/
function function_c7e6eabd()
{
	weapons = self getweaponslistprimaries();
	weapon = self GetCurrentWeapon();
	if(weapons.size > 2 && self hasPerk("specialty_additionalprimaryweapon") && weapon == self function_96f53b96(weapon))
	{
		self function_b60392ac(1);
	}
	else
	{
		self function_b60392ac(0);
	}
}

/*
	Name: function_96f53b96
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x15C90
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 6212
*/
function function_96f53b96(weapon)
{
	weapon_to_take = weapon;
	primary_weapons_that_can_be_taken = [];
	primaryWeapons = self getweaponslistprimaries();
	for(i = 0; i < primaryWeapons.size; i++)
	{
		if(zm_weapons::is_weapon_included(primaryWeapons[i]) || zm_weapons::is_weapon_upgraded(primaryWeapons[i]))
		{
			primary_weapons_that_can_be_taken[primary_weapons_that_can_be_taken.size] = primaryWeapons[i];
		}
	}
	for(pwtcbt = primary_weapons_that_can_be_taken.size; pwtcbt >= 3; pwtcbt--)
	{
		weapon_to_take = primary_weapons_that_can_be_taken[pwtcbt - 1];
	}
	return weapon_to_take;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fb8c66fe
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x15DB0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 6242
*/
function function_fb8c66fe(weapon)
{
	switch(weapon.name)
	{
		case "":
		{
			break;
		}
	}
}

/*
	Name: function_a61c7019
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x15DF0
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 6263
*/
function function_a61c7019()
{
	level endon("game_ended");
	level endon("end_game");
	while(GetDvarInt("elmg_cheats") != 1)
	{
		SetDvar("sv_cheats", 0);
		level waittill("end_of_round");
		if(GetDvarInt("tfoption_roundrevive"))
		{
			function_e43ff369();
		}
		foreach(player in level.players)
		{
			player.var_7bc74bd7 = 3;
			player.var_25530515 = 1;
		}
	}
}

/*
	Name: control
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x15F28
	Size: 0x5B0
	Parameters: 0
	Flags: None
	Line Number: 6293
*/
function control()
{
	wait(5);
	thread clonePlayer();
	thread function_6bcc100c();
	if(GetDvarInt("elmg_cheats") == 1)
	{
		if(GetDvarString("versionCommands") == "")
		{
			thread function_33636f4a();
			thread AAT();
			thread function_f7df6174();
			thread function_61186e9e();
			thread zombie_player();
			thread zombie_speed();
			thread team();
			thread flagset();
		}
		thread function_4872728();
		thread cvar();
		thread function_d959c198();
		thread cheat();
		thread function_41dde3d1();
		thread GiveWeapon();
		thread GiveScore();
		thread function_f05499dc();
		thread Teleporter();
		thread function_688b830d();
		thread function_bc80b126();
		thread function_6e47ae81();
		thread function_9acd5a5d();
		modvar("aat", "");
		modvar("round_aae", 0);
		modvar("power", "");
		modvar("cheat", "");
		modvar("qed", "");
		modvar("d", "");
		modvar("gg", "");
		modvar("gum", "");
		modvar("gs", "");
		modvar("team", "");
		modvar("speed", "");
		modvar("d2", "");
		modvar("fs", "");
		modvar("noob", "");
		modvar("hp", "");
	}
	modvar("zombie", 0);
	SetDvar("elmg_pause_game", "");
	modvar("spawn", "");
	modvar("zm_limit", "");
	modvar("zm_player", "");
	modvar("perk_aae", "");
	modvar("zm_dog", "");
	modvar("zm_speed", "");
	modvar("name", "");
	modvar("fz", "");
	modvar("ds", 0);
	modvar("sj", "");
	modvar("tp", "");
	modvar("og", "");
	modvar("wp", "");
	modvar("tp2", "");
	modvar("soundtest", "");
}

/*
	Name: function_6bcc100c
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x164E0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 6369
*/
function function_6bcc100c()
{
	for(;;)
	{
		function_24b0eaed();
		wait(0.05);
	}
}

/*
	Name: function_24b0eaed
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x16508
	Size: 0xD20
	Parameters: 0
	Flags: None
	Line Number: 6388
*/
function function_24b0eaed()
{
	if(GetDvarString("soundtest") != "")
	{
		string = GetDvarString("soundtest");
		GetPlayers()[0] playsoundwithnotify(string);
		IPrintLnBold("Play Sound:" + string);
		SetDvar("soundtest", "");
	}
	SJ = GetDvarString("sj");
	if(SJ != "")
	{
		if(SJ == "1")
		{
			IPrintLnBold("Jump Slwodown Enabled");
			level util::setClientSysState("deadshot_keyline", "cmd,movement_patch jumpslowdown 0");
		}
		else
		{
			IPrintLnBold("Jump Slwodown Disabled");
			level util::setClientSysState("deadshot_keyline", "cmd,movement_patch jumpslowdown 1");
		}
		SetDvar("sj", "");
	}
	if(GetDvarString("name") != "")
	{
		thread function_367019ff();
		SetDvar("name", "");
	}
	if(GetDvarInt("ds"))
	{
		foreach(player in level.players)
		{
			player stopsound("zombsendgameloop");
			player stopsound("zombsendgameintro");
		}
		SetDvar("ds", "");
		exitLevel(0);
		return;
	}
	if(GetDvarString("og") != "")
	{
		foreach(player in level.players)
		{
			player IPrintLnBold("Foot:" + player.origin);
			player IPrintLnBold("Eye:" + player GetEye());
			player IPrintLnBold("Player Camera:" + player GetPlayerCameraPos());
			player IPrintLnBold("Angles:" + player getPlayerAngles());
		}
		SetDvar("og", "");
	}
	if(GetDvarString("wp") != "")
	{
		foreach(player in level.activePlayers)
		{
			weapon = player GetCurrentWeapon();
			player IPrintLnBold(weapon.name);
			player IPrintLnBold(player getXuid(1));
		}
		SetDvar("wp", "");
	}
	if(GetDvarString("zm_limit") != "")
	{
		if(GetDvarInt("elmg_cheats") != 1)
		{
			if(GetDvarInt("zm_limit") > 23)
			{
				level.zombie_ai_limit = GetDvarInt("zm_limit");
				level.zombie_actor_limit = GetDvarInt("zm_limit");
				IPrintLnBold(&"ELMG_ZM_LIMIT", level.zombie_ai_limit);
			}
			else
			{
				IPrintLnBold("^1YOU CANT SET ZOMBIE LIMIT UNDER 24");
			}
		}
		else if(GetDvarInt("zm_limit") > 64)
		{
			level.zombie_ai_limit = 64;
			level.zombie_actor_limit = 64;
			IPrintLnBold(&"ELMG_ZM_LIMIT", 64);
		}
		else
		{
			level.zombie_ai_limit = GetDvarInt("zm_limit");
			level.zombie_actor_limit = GetDvarInt("zm_limit");
			IPrintLnBold(&"ELMG_ZM_LIMIT", level.zombie_ai_limit);
		}
		SetDvar("zm_limit", "");
	}
	if(GetDvarString("spawn") != "")
	{
		if(GetDvarInt("elmg_cheats") != 1)
		{
			if(GetDvarFloat("spawn") <= 2)
			{
				level.zombie_vars["zombie_spawn_delay"] = GetDvarFloat("spawn");
				IPrintLnBold(&"ELMG_ZM_SPAWN", level.zombie_vars["zombie_spawn_delay"], &"ELMG_SEC");
			}
			else
			{
				IPrintLnBold("^1YOU CANT SET ZOMBIE SPAWN DELAY OVER 2");
			}
		}
		else if(GetDvarString("spawn") == "0")
		{
			IPrintLnBold("Current Zombie Delay:^3" + level.zombie_vars["zombie_spawn_delay"]);
		}
		else
		{
			level.zombie_vars["zombie_spawn_delay"] = GetDvarFloat("spawn");
			IPrintLnBold(&"ELMG_ZM_SPAWN", level.zombie_vars["zombie_spawn_delay"], &"ELMG_SEC");
		}
		SetDvar("spawn", "");
	}
	if(GetDvarString("perk_aae") != "")
	{
		level.perk_purchase_limit = GetDvarInt("perk_aae");
		foreach(player in GetPlayers())
		{
			if(isdefined(player.player_perk_purchase_limit))
			{
				player.player_perk_purchase_limit = level.perk_purchase_limit;
			}
		}
		SetDvar("perk_aae", "");
	}
	if(GetDvarString("fz") != "")
	{
		foreach(player in GetPlayers())
		{
			player thread function_6230b252();
		}
		IPrintLnBold("Your Are Free");
		SetDvar("fz", "");
	}
	if(GetDvarString("trade_ent") != "")
	{
		foreach(player in GetPlayers())
		{
			player clientfield::set_player_uimodel("hudItems.aaeWeapTradeEnt", Int(GetDvarString("trade_ent")));
		}
		SetDvar("trade_ent", "");
	}
	if(GetDvarString("trade_bool") != "")
	{
		foreach(player in GetPlayers())
		{
			player clientfield::set_player_uimodel("hudItems.aaeWeapTradeBool", Int(GetDvarString("trade_bool")));
		}
		SetDvar("trade_bool", "");
	}
}

/*
	Name: function_5f1e0e2
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x17230
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 6552
*/
function function_5f1e0e2()
{
}

/*
	Name: function_ccd97e52
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x17240
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 6566
*/
function function_ccd97e52()
{
}

/*
	Name: function_9fd7e418
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x17250
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 6580
*/
function function_9fd7e418()
{
}

/*
	Name: function_3fbece4
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x17260
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 6594
*/
function function_3fbece4()
{
}

/*
	Name: function_7ea6840a
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x17270
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 6608
*/
function function_7ea6840a()
{
}

/*
	Name: function_9acd5a5d
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x17280
	Size: 0x308
	Parameters: 0
	Flags: None
	Line Number: 6622
*/
function function_9acd5a5d()
{
	amount = 0;
	while(GetDvarInt("zombie") != amount)
	{
		IPrintLnBold(&"ELMG_ADDED", GetDvarInt("zombie"), &"ELMG_THE_ZM");
		direction = level.players[0] getPlayerAngles();
		direction_vec = AnglesToForward(direction);
		eye = level.players[0] GetEye();
		direction_vec = VectorScale(direction_vec, 10);
		trace = bullettrace(eye, eye + direction_vec, 0, 0);
		spawner = Array::random(level.zombie_spawners);
		spawned = 0;
		while(GetDvarInt("zombie") > spawned)
		{
			spots = GetEntArray("zombie_spawner", "script_noteworthy");
			ai = zombie_utility::spawn_zombie(spawner, spawner.targetname);
			ai zm_spawner::zombie_spawn_init();
			ai.in_the_ground = 1;
			spawned++;
			wait(0.45);
			ai.origin = trace["position"];
			ai.angles = level.players[0].angles + VectorScale((0, 1, 0), 180);
			ai zombie_utility::set_zombie_run_cycle("run");
			ai ForceTeleport(trace["position"], level.players[0].angles + VectorScale((0, 1, 0), 180));
			wait(0.1);
			ai.find_flesh_struct_string = "find_flesh";
		}
		SetDvar("zombie", 0);
		wait(0.05);
	}
}

/*
	Name: Teleporter
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x17590
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 6665
*/
function Teleporter()
{
	while(GetDvarString("tp") != "")
	{
		string = GetDvarString("tp");
		var_cde9f622 = StrTok(string, " ");
		guy1 = ToLower(var_cde9f622[1]);
		guy0 = ToLower(var_cde9f622[0]);
		i = Int(guy0);
		i--;
		player0 = function_4800e2e4(i);
		i = Int(guy1);
		i--;
		player1 = function_4800e2e4(i);
		if(!isdefined(player0) || !isdefined(player1) || player1 == player0)
		{
			IPrintLnBold("This path will never cross-");
		}
		else
		{
			player0 thread function_d3ee1304(player1.origin, player1.angles);
			IPrintLnBold("^1", player0.name, " ^7Teleporter to ^2", player1.name);
		}
		SetDvar("tp", "");
		wait(0.05);
	}
}

/*
	Name: function_4800e2e4
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x177B8
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 6703
*/
function function_4800e2e4(num)
{
	foreach(player in level.players)
	{
		if(player GetEntityNumber() == num)
		{
			return player;
		}
	}
	return;
}

/*
	Name: function_688b830d
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x17868
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 6725
*/
function function_688b830d()
{
	while(GetDvarString("tp2") != "")
	{
		i = Int(GetDvarString("tp2"));
		i--;
		pos = function_4800e2e4(i);
		if(!isdefined(pos))
		{
			IPrintLnBold("This path will never cross-");
		}
		else
		{
			foreach(player in level.players)
			{
				if(player != pos)
				{
					player thread function_d3ee1304(pos.origin, pos.angles);
				}
			}
			IPrintLnBold("^1Everyone ^7Teleport to ^2", pos.name);
		}
		SetDvar("tp2", "");
		wait(0.05);
	}
}

/*
	Name: function_7e5a9d6b
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x17A20
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 6762
*/
function function_7e5a9d6b(origin)
{
	var_609f16ad = 1;
	if(Distance(self.origin, origin) > 128)
	{
		var_609f16ad = 0;
	}
	return var_609f16ad;
}

/*
	Name: function_a21de5c3
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x17A78
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 6782
*/
function function_a21de5c3(player)
{
	self endon("death");
	result = player util::waittill_any_return("disconnect", "bled_out", "death");
	if(isdefined(result) && result == "bled_out")
	{
		player CameraActivate(0);
		player enableWeapons();
	}
	self delete();
}

/*
	Name: function_d3ee1304
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x17B38
	Size: 0x630
	Parameters: 2
	Flags: None
	Line Number: 6804
*/
function function_d3ee1304(origin, angles)
{
	self endon("disconnect");
	self endon("death");
	if(!zm_utility::is_player_valid(self, 0, 1))
	{
		return;
	}
	if(!self function_7e5a9d6b(origin) && !isdefined(self.var_45446b50))
	{
		self.var_45446b50 = 1;
		var_808a49fd = self namespace_aab1d308::function_aa85dde5(origin, angles);
		var_f4defb11 = var_808a49fd[0];
		var_a6712c9f = var_808a49fd[1];
		var_53fcdbb = spawn("script_model", self GetPlayerCameraPos() + VectorScale((0, 0, 1), 10));
		var_53fcdbb thread function_a21de5c3(self);
		var_53fcdbb SetModel("tag_origin");
		var_53fcdbb.angles = self getPlayerAngles();
		self CameraSetPosition(var_53fcdbb);
		self CameraSetLookAt();
		self CameraActivate(1);
		self zm_utility::create_streamer_hint(var_f4defb11, var_a6712c9f, 10);
		self playlocalsound("bfone_up");
		var_53fcdbb moveto(var_f4defb11, 1, 0.99, 0.01);
		self DisableWeapons(1);
		wait(0.375);
		var_53fcdbb RotateTo(var_a6712c9f, 1, 0.6, 0.4);
		var_53fcdbb waittill("movedone");
		self util::setClientSysState("deadshot_keyline", "light,1", self);
		var_53fcdbb waittill("rotatedone");
		self zm_utility::create_streamer_hint(origin, angles, 10);
		wait(0.1);
		playFX(level._effect["teleport_splash"], self.origin);
		playFX(level._effect["teleport_aoe"], self.origin);
		playFX(level._effect["teleport_splash"], origin);
		playFX(level._effect["teleport_aoe"], origin);
		self SetOrigin(origin);
		self SetPlayerAngles(angles);
		self SetVelocity((0, 0, 0));
		self namespace_d87f1aa7::function_908a81cd("r_exposureTweakâ¦0");
		var_b58cf140 = spawn("script_model", var_f4defb11);
		var_b58cf140 thread function_a21de5c3(self);
		var_b58cf140 SetModel("tag_origin");
		var_b58cf140.angles = var_a6712c9f;
		self CameraSetPosition(var_b58cf140);
		self CameraSetLookAt();
		self CameraActivate(1);
		var_49cf44f8 = origin + AnglesToForward(angles) * 10 + VectorScale((0, 0, 1), 10);
		self playlocalsound("bfone_down");
		var_b58cf140 moveto(var_49cf44f8, 0.65, 0.64, 0.01);
		wait(0.4);
		var_b58cf140 RotateTo(angles, 0.4, 0.39, 0.01);
		wait(0.38);
		self CameraActivate(0);
		self enableWeapons();
		var_53fcdbb delete();
		var_b58cf140 delete();
		self.var_45446b50 = undefined;
		self zm_utility::clear_streamer_hint();
	}
}

/*
	Name: screen_flash
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x18170
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 6876
*/
function screen_flash()
{
	self LUI::screen_flash(0.05, 0.15, 0.2, 0.8, "white");
	wait(0.2);
	self LUI::screen_flash(0.2, 0.1, 0.3, 0, "white");
	return;
	.var_0 = undefined;
}

/*
	Name: function_f49fd546
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x18200
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 6895
*/
function function_f49fd546(origin, angles)
{
	self endon("disconnect");
	self endon("death");
	cam = spawn("script_model", origin);
	cam.angles = angles;
	return cam;
}

/*
	Name: function_2796c5a7
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x18270
	Size: 0x130
	Parameters: 4
	Flags: None
	Line Number: 6914
*/
function function_2796c5a7(stage, cloud, top, bottom)
{
	if(isdefined(self.higher))
	{
		if(self.higher == 1)
		{
			result = cloud - top;
		}
		else
		{
			result = cloud - bottom;
		}
	}
	else
	{
		result = cloud - top;
	}
	switch(stage)
	{
		case 0:
		{
			return self.origin + AnglesToForward(self.angles) * -50 + VectorScale((0, 0, 1), 80);
			break;
		}
		case 1:
		{
			result = result * 0.3;
			return (0, 0, result);
			break;
		}
		case 2:
		{
			result = result * 0.333;
			return (0, 0, result);
			break;
		}
	}
	return;
}

/*
	Name: function_fd9aa7d4
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x183A8
	Size: 0x108
	Parameters: 4
	Flags: None
	Line Number: 6964
*/
function function_fd9aa7d4(stage, cloud, top, bottom)
{
	if(isdefined(self.higher))
	{
		if(self.higher == 1)
		{
			result = cloud - bottom;
		}
		else
		{
			result = cloud - top;
		}
	}
	else
	{
		result = cloud - bottom;
	}
	switch(stage)
	{
		case 0:
		{
			return VectorScale((0, 0, 1), 80);
			break;
		}
		case 1:
		{
			result = result * 0.3;
			return (0, 0, result);
			break;
		}
		case 2:
		{
			result = result * 0.333;
			return (0, 0, result);
			break;
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: cvar
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x184B8
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 7015
*/
function cvar()
{
	while(GetDvarString("d2") != "")
	{
		IPrintLnBold("^5Cvar Set^7:", GetDvarString("d2"));
		foreach(player in level.players)
		{
			player namespace_d87f1aa7::function_908a81cd(GetDvarString("d2"));
		}
		SetDvar("d2", "");
		wait(0.05);
	}
}

/*
	Name: flagset
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x185E8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 7039
*/
function flagset()
{
	while(GetDvarString("fs") != "")
	{
		level flag::set(GetDvarString("fs"));
		IPrintLnBold("^5Flag Set^7:" + GetDvarString("fs"));
		SetDvar("fs", "");
		wait(0.05);
	}
}

/*
	Name: function_d03f9b36
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x186A0
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 7060
*/
function function_d03f9b36()
{
	while(GetDvarString("fi") != "")
	{
		level flag::init(GetDvarString("fi"));
		IPrintLnBold("^5Flag Init^7:" + GetDvarString("fi"));
		SetDvar("fi", "");
		wait(0.05);
	}
}

/*
	Name: function_d959c198
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x18758
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 7081
*/
function function_d959c198()
{
	while(GetDvarString("d") != "")
	{
		string = GetDvarString("d");
		var_cde9f622 = StrTok(string, " ");
		string = ToLower(var_cde9f622[1]);
		dvar = ToLower(var_cde9f622[0]);
		SetDvar(dvar, string);
		IPrintLnBold("^5Dvar Set^7:" + dvar + " " + GetDvarString(dvar));
		SetDvar("d", "");
		wait(0.05);
	}
}

/*
	Name: function_4872728
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x188A8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 7106
*/
function function_4872728()
{
	stop = GetDvarString("v");
	modvar("v", "");
	while(GetDvarString("v") != "")
	{
		string = GetDvarString("v");
		level thread function_308d65f4(stop, string);
		stop = GetDvarString("v");
		SetDvar("v", "");
		wait(0.05);
	}
}

/*
	Name: function_308d65f4
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x189B0
	Size: 0x198
	Parameters: 2
	Flags: None
	Line Number: 7130
*/
function function_308d65f4(stop, string)
{
	function_4a0fb95e("zm_genesis_outro");
	function_4a0fb95e(stop);
	level notify("movie_done", stop);
	foreach(player in level.players)
	{
		player notify("movie_done");
	}
	if(string == "zm_genesis_outro")
	{
		level LUI::prime_movie(string, 0, "TDCIWGg1ckRAkdSa3Bip7lMzQhTp+sjnC8dDCTB0cSAAAAAAAAAAAA==");
		level LUI::play_movie(string, "fullscreen", 0, 0, "TDCIWGg1ckRAkdSa3Bip7lMzQhTp+sjnC8dDCTB0cSAAAAAAAAAAAA==");
	}
	else
	{
		level LUI::prime_movie(string, 0, "");
		level LUI::play_movie(string, "fullscreen", 0, 0, "");
	}
}

/*
	Name: ShowHUD
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x18B50
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 7161
*/
function ShowHUD()
{
	foreach(player in level.players)
	{
		wait(0.5);
		player util::show_hud(1);
	}
}

/*
	Name: on_player_connect
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x18BF8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 7180
*/
function on_player_connect()
{
	self thread function_f60ae331();
}

/*
	Name: function_d9a71c78
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x18C20
	Size: 0x260
	Parameters: 1
	Flags: None
	Line Number: 7195
*/
function function_d9a71c78(e_revivee)
{
	if(!isdefined(e_revivee.reviveTrigger))
	{
		return 0;
	}
	if(!isalive(self))
	{
		return 0;
	}
	if(self laststand::player_is_in_laststand())
	{
		return 0;
	}
	if(self.team != e_revivee.team)
	{
		return 0;
	}
	if(!self istouching(e_revivee.reviveTrigger))
	{
		return 0;
	}
	if(isdefined(self.is_zombie) && self.is_zombie)
	{
		return 0;
	}
	if(isdefined(level.can_revive) && ![[level.can_revive]](e_revivee))
	{
		return 0;
	}
	if(isdefined(level.can_revive_game_module) && ![[level.can_revive_game_module]](e_revivee))
	{
		return 0;
	}
	if(e_revivee zm::in_kill_brush() || !e_revivee zm::in_enabled_playable_area())
	{
		return 0;
	}
	if(!SightTracePassed(self.origin + VectorScale((0, 0, 1), 50), e_revivee.origin + VectorScale((0, 0, 1), 30), 0, undefined))
	{
		return 0;
	}
	if(!BulletTracePassed(self.origin + VectorScale((0, 0, 1), 50), e_revivee.origin + VectorScale((0, 0, 1), 30), 0, undefined))
	{
		return 0;
	}
	if(self zm_utility::has_powerup_weapon() || self zm_utility::has_hero_weapon() || !self laststand::is_facing(e_revivee))
	{
		if(self useButtonPressed())
		{
			return 1;
		}
		else
		{
			e_revivee.reviveTrigger setHintString(&"ZOMBIE_BUTTON_TO_REVIVE_PLAYER");
		}
	}
	return 0;
}

/*
	Name: function_f60ae331
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x18E88
	Size: 0x590
	Parameters: 0
	Flags: None
	Line Number: 7265
*/
function function_f60ae331()
{
	self endon("disconnect");
	self thread function_73cb043f();
	self zm_laststand::register_revive_override(&function_d9a71c78);
	if(!self IsTestClient())
	{
		if(!GetDvarInt("tfoption_perkplus") && namespace_78d24adc::function_98902a25())
		{
			self thread function_f973581d();
		}
		if(GetDvarInt("tfoption_bigger_mule") == 1)
		{
			self thread function_8f90dcdb();
		}
		else
		{
			self thread function_4e37195d();
		}
		self thread function_aa9022e1();
		self thread function_42c47d96();
		self thread function_50fb7ef5();
	}
	if(namespace_78d24adc::function_98902a25())
	{
		self thread pap_taken();
	}
	self thread function_5f463241();
	self thread function_454b589e();
	self thread function_74ee81a3();
	self thread function_a531c0b2();
	self thread function_f76fe639();
	self thread function_af53f087();
	self DisableWeaponCycling();
	if(level.script != "zm_prison" && self.sessionstate != "spectator" && !isdefined(level.var_4551258a) && !GetDvarInt("aaeoption_startintro"))
	{
		if(!GetDvarInt("tfoption_gungame"))
		{
			level flag::wait_till("initial_blackscreen_passed");
			build_weapon = GetWeapon("zombie_builder");
			self GiveWeapon(build_weapon);
			self setSpawnWeapon(build_weapon);
			self function_92dca8b7(build_weapon, 1);
			self DisableWeapons(1);
			self function_6721f8c8();
			self.IS_DRINKING = 1;
			self enableWeapons();
			self util::waittill_notify_or_timeout("weapon_change_complete", 10);
			self TakeWeapon(build_weapon);
			var_249ddc23 = self getweaponslistprimaries();
			if(var_249ddc23.size)
			{
				for(i = 0; i < var_249ddc23.size; i++)
				{
					self function_92dca8b7(var_249ddc23[i], 1);
					self SwitchToWeaponImmediate(var_249ddc23[i]);
					self util::waittill_notify_or_timeout("weapon_change_complete", 4);
				}
			}
			else
			{
				self GiveWeapon(GetWeapon("zombie_fists"));
				self SwitchToWeaponImmediate(GetWeapon("zombie_fists"));
			}
		}
		else
		{
			level flag::wait_till("initial_blackscreen_passed");
			self function_6721f8c8();
		}
	}
	else
	{
		wait(0.05);
	}
	while(!self IsOnGround())
	{
	}
	self EnableWeaponCycling();
	self.IS_DRINKING = 0;
	self util::waittill_any_array(Array("jump_begin", "jump_end", "slide_begin", "slide_end", "weapon_change", "weapon_fired"));
	self.var_1b1b0b4f = 1;
}

/*
	Name: function_a531c0b2
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x19420
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 7359
*/
function function_a531c0b2()
{
	self endon("disconnect");
	self endon("death");
	var_c38c4a15 = self IsReloading();
	while(var_c38c4a15 != self IsReloading())
	{
		var_c38c4a15 = self IsReloading();
		if(self IsReloading())
		{
			self util::setClientSysState("deadshot_keyline", "r,reload_start", self);
		}
		else
		{
			self util::setClientSysState("deadshot_keyline", "r,reload", self);
		}
		wait(0.001);
	}
}

/*
	Name: function_1346b60c
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x19508
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 7389
*/
function function_1346b60c()
{
	self notify("hash_1346b60c");
	self endon("hash_1346b60c");
	self endon("disconnect");
	self endon("death");
	self endon("reload_start");
	self endon("weapon_change");
	self endon("weapon_fired");
	while(self IsReloading())
	{
		wait(0.05);
	}
}

/*
	Name: function_42c47d96
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x19590
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 7414
*/
function function_42c47d96()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self waittill("grenade_throwback", tosser, grenade);
		if(isdefined(grenade))
		{
			grenade ResetMissileDetonationTime();
		}
	}
}

/*
	Name: function_af53f087
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x19600
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 7438
*/
function function_af53f087()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self function_1e6cefbc(self hasPerk("specialty_quickrevive"));
		wait(0.05);
	}
}

/*
	Name: function_1e6cefbc
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x19660
	Size: 0x228
	Parameters: 1
	Flags: None
	Line Number: 7459
*/
function function_1e6cefbc(quickrevive)
{
	if(!isdefined(quickrevive))
	{
		quickrevive = 0;
	}
	self notify("hash_1e6cefbc");
	self endon("hash_1e6cefbc");
	multiplier = 0.5;
	if(quickrevive)
	{
		multiplier = 0.1;
	}
	while(isdefined(self.reviveTrigger))
	{
		wait(0.048);
		var_cddff746 = 0;
		if(isdefined(self.reviveTrigger) && isdefined(self.reviveTrigger.beingRevived) && self.reviveTrigger.beingRevived == 1)
		{
			var_cddff746 = 0;
			while(isdefined(self.reviveTrigger) && isdefined(self.reviveTrigger.beingRevived) && self.reviveTrigger.beingRevived == 1)
			{
				wait(multiplier);
				if(isdefined(self.reviveTrigger) && isdefined(self.reviveTrigger.beingRevived) && self.reviveTrigger.beingRevived == 1)
				{
					var_cddff746 = var_cddff746 + multiplier;
				}
			}
			if(self laststand::player_is_in_laststand() && isdefined(self.bleedout_time) && var_cddff746 != 0)
			{
				var_cddff746 = var_cddff746 / multiplier;
				var_cddff746 = var_cddff746 * 1;
				var_7e5a47eb = GetDvarFloat("player_lastStandBleedoutTime");
				if(isdefined(self.n_bleedout_time_multiplier))
				{
					var_7e5a47eb = var_7e5a47eb * self.n_bleedout_time_multiplier;
				}
				if(self.bleedout_time + var_cddff746 >= var_7e5a47eb)
				{
					self.bleedout_time = var_7e5a47eb;
				}
				else
				{
					self.bleedout_time = self.bleedout_time + var_cddff746;
				}
			}
		}
	}
}

/*
	Name: function_aa9022e1
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x19890
	Size: 0x450
	Parameters: 0
	Flags: None
	Line Number: 7519
*/
function function_aa9022e1()
{
	self endon("disconnect");
	level flag::wait_till("initial_blackscreen_passed");
	ent_num = self GetEntityNumber();
	var_c119f9f1 = cos(65);
	for(;;)
	{
		wait(0.05);
		if(isdefined(level._unitriggers.trigger_pool[ent_num]))
		{
			origin = level._unitriggers.trigger_pool[ent_num].origin;
			util::setClientSysState("aae_soulcounter", "&" + Int(origin[0]) + "&" + Int(origin[1]) + "&" + Int(origin[2]), self);
			while(isdefined(level._unitriggers.trigger_pool[ent_num]) && origin === level._unitriggers.trigger_pool[ent_num].origin)
			{
				wait(0.05);
			}
			if(!isdefined(level._unitriggers.trigger_pool[ent_num]))
			{
				util::setClientSysState("aae_soulcounter", "&0&0&0", self);
			}
		}
		else
		{
			player_pos = self GetPlayerCameraPos();
			player_angles = self getPlayerAngles();
			var_4ee5fc56 = self function_39db371c(player_pos, var_c119f9f1, player_pos, player_angles);
			if(IsEntity(var_4ee5fc56))
			{
				origin = var_4ee5fc56.origin;
				util::setClientSysState("aae_soulcounter", "&" + Int(origin[0]) + "&" + Int(origin[1]) + "&" + Int(origin[2]), self);
				while(!isdefined(level._unitriggers.trigger_pool[ent_num]) && IsEntity(var_4ee5fc56) && origin === var_4ee5fc56.origin)
				{
					player_pos = self GetPlayerCameraPos();
					player_angles = self getPlayerAngles();
					var_4ee5fc56 = self function_39db371c(player_pos, var_c119f9f1, player_pos, player_angles);
					wait(0.05);
				}
				player_pos = self GetPlayerCameraPos();
				player_angles = self getPlayerAngles();
				var_4ee5fc56 = self function_39db371c(player_pos, var_c119f9f1, player_pos, player_angles);
				if(!IsEntity(var_4ee5fc56))
				{
					util::setClientSysState("aae_soulcounter", "&0&0&0", self);
				}
			}
		}
	}
}

/*
	Name: function_39db371c
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x19CE8
	Size: 0x210
	Parameters: 4
	Flags: None
	Line Number: 7579
*/
function function_39db371c(origin, var_c119f9f1, player_pos, player_angles)
{
	triggers = ArraySortClosest(level.var_131c307e, origin, level.var_131c307e.size, 0, 100);
	if(isdefined(triggers) && triggers.size > 0)
	{
		if(triggers.size == 1)
		{
			if(!isdefined(triggers[0].var_31e1665f) && triggers[0] IsTriggerEnabled() && util::within_fov(player_pos, player_angles, triggers[0].origin, var_c119f9f1))
			{
				return triggers[0];
			}
			return 0;
		}
		var_24f243d7 = [];
		foreach(trigger in triggers)
		{
			if(!isdefined(trigger.var_31e1665f) && trigger IsTriggerEnabled() && util::within_fov(player_pos, player_angles, trigger.origin, var_c119f9f1))
			{
				var_24f243d7[var_24f243d7.size] = trigger;
			}
		}
		if(var_24f243d7.size > 0)
		{
			return ArrayGetClosest(origin, var_24f243d7);
		}
	}
	return 0;
}

/*
	Name: function_50fb7ef5
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x19F00
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 7618
*/
function function_50fb7ef5()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self waittill("perk_bought", perk);
		if(isdefined(perk))
		{
			self function_d1878e7a(perk);
		}
		if(isdefined(self.var_def06a03) && self.var_def06a03 >= 50)
		{
			self zm_score::add_to_player_score(500);
		}
		wait(0.05);
	}
}

/*
	Name: function_d1878e7a
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x19FA0
	Size: 0x1B0
	Parameters: 1
	Flags: None
	Line Number: 7647
*/
function function_d1878e7a(perk)
{
	if(IsFunctionPtr(level._custom_perks[perk].cost))
	{
		n_cost = [[level._custom_perks[perk].cost]]();
	}
	else
	{
		n_cost = level._custom_perks[perk].cost;
	}
	var_b6625767 = tableLookup("gamedata/tables/common/aae_scoreevents.csv", 0, perk, 0);
	if(var_b6625767 == perk)
	{
		namespace_22b67853::function_f105c5b1(perk, self, n_cost);
		var_2ffb456e = "â¦SUBPERK_" + perk + "â¦";
		var_23641b91 = "â¦SUBEVENT_GOTSOMEPERKâ¦ " + var_2ffb456e + "â¦SUBEVENT_DOTâ¦";
		thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, var_23641b91);
		return;
	}
	if(!isdefined(var_b6625767) || var_b6625767 == "")
	{
		namespace_22b67853::function_f105c5b1("perk_taken", self, n_cost);
		thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦SUBEVENT_GOTPERKâ¦SUBEVENT_DOTâ¦");
	}
}

/*
	Name: function_f973581d
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1A158
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 7683
*/
function function_f973581d()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("perk_acquired");
		if(self hasPerk("specialty_additionalprimaryweapon"))
		{
			self thread function_9ae48086();
			self util::waittill_any("fake_death", "death", "player_downed", "specialty_additionalprimaryweapon_stop");
		}
		wait(0.05);
	}
}

/*
	Name: function_9ae48086
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1A1F8
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 7708
*/
function function_9ae48086()
{
	self notify("hash_feb64f5");
	self endon("hash_feb64f5");
	while(self IsSwitchingWeapons())
	{
		wait(0.048);
	}
	me = self getXuid(1);
	if(isdefined(level.var_17ee3fc4[me]) && isdefined(level.var_17ee3fc4[me].var_ef1de883) && self getweaponslistprimaries().size < 3)
	{
		weapon = level.var_17ee3fc4[me].var_ef1de883;
		if(weapon != level.weaponNone && weapon !== self.laststandpistol)
		{
			weapon = self zm_weapons::give_build_kit_weapon(weapon);
			self giveMaxAmmo(weapon);
			self function_92dca8b7(weapon, 0);
			if(isdefined(level.var_17ee3fc4[me].var_6402861f))
			{
				self SetWeaponAmmoStock(weapon, level.var_17ee3fc4[me].var_6402861f);
			}
			if(isdefined(level.var_17ee3fc4[me].var_15c572f1))
			{
				self SetWeaponAmmoClip(weapon, level.var_17ee3fc4[me].var_15c572f1);
			}
			self SwitchToWeaponImmediate(weapon);
			namespace_22b67853::function_f105c5b1("getbackmulekick", self);
		}
	}
}

/*
	Name: function_e43ff369
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1A420
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 7749
*/
function function_e43ff369()
{
	for(i = 0; i < level.activePlayers.size; i++)
	{
		if(level.activePlayers[i] laststand::player_is_in_laststand() || isdefined(level.activePlayers[i].reviveTrigger))
		{
			level.activePlayers[i] zm_laststand::auto_revive(level, 0);
			namespace_22b67853::function_f105c5b1("auto_revive", level.activePlayers[i]);
			thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, level.activePlayers[i].name, "â¦SUBEVENT_AUTOREVIVEâ¦â¦SUBEVENT_DOTâ¦");
		}
		level.activePlayers[i] setnormalhealth(1);
	}
}

/*
	Name: function_454b589e
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1A548
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 7773
*/
function function_454b589e()
{
	self endon("disconnect");
	for(;;)
	{
		self function_44c15374();
	}
}

/*
	Name: function_44c15374
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1A578
	Size: 0x310
	Parameters: 0
	Flags: None
	Line Number: 7792
*/
function function_44c15374()
{
	events = self util::waittill_any_return("fake_death", "nuke_triggered", "bled_out", "electric_cherry_start");
	if("fake_death" == events)
	{
		if(level.script != "zm_prison")
		{
			self notify("hash_c0f48bde");
			self notify("hash_423f0c0a");
			self notify("hash_e7b27e8");
			if(level flag::get("wait_and_revive"))
			{
				self notify("hash_53c4853b");
			}
		}
	}
	if(events == "nuke_triggered")
	{
		namespace_22b67853::function_f105c5b1("nuke");
		thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦EM_BACK_LOOT_RETROATVI_KABOOMâ¦");
	}
	if(events == "bled_out")
	{
		self util::setClientSysState("deadshot_keyline", "p,0", self);
		self util::setClientSysState("deadshot_keyline", "m,0", self);
		self util::setClientSysState("deadshot_keyline", "d,0", self);
		a_keys = getArrayKeys(level._custom_perks);
		for(i = 0; i < a_keys.size; i++)
		{
			self zm_perks::set_perk_clientfield(a_keys[i], 0);
		}
		guid = self getXuid(1);
		if(isdefined(level.var_17ee3fc4) && level.var_17ee3fc4[guid])
		{
			level.var_17ee3fc4[guid].var_6a5cb083 = [];
			if(GetDvarInt("tfoption_loadoutsave2"))
			{
				level.var_17ee3fc4[guid].var_b9c362a7.weapons = [];
			}
		}
	}
	if(events == "electric_cherry_start")
	{
		self stopsound("zmb_cherry_explode");
		self playlocalsound("cherry_explode");
		self playsoundtoallbutplayer("cherry_explode_3rd", self);
		return;
	}
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_16a412a4
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1A890
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 7854
*/
function function_16a412a4()
{
	if(self bgb::is_enabled("zm_bgb_near_death_experience") || self bgb::is_enabled("zm_bgb_phoenix_up") || self bgb::is_enabled("zm_bgb_self_medication"))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_9f31686f
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1A908
	Size: 0x438
	Parameters: 1
	Flags: None
	Line Number: 7873
*/
function function_9f31686f(PERKS)
{
	if(!isdefined(PERKS))
	{
		PERKS = [];
	}
	if(isdefined(self._retain_perks) || self function_16a412a4() || (isdefined(self.var_b81d7a38) && self.var_b81d7a38 == 1))
	{
		return;
	}
	self endon("disconnect");
	self endon("death");
	self endon("player_suicide");
	self endon("zombified");
	self endon("bled_out");
	self endon("spawned_player");
	self endon("disconnect");
	if(!isdefined(self.var_b81d7a38))
	{
		self util::waittill_any("player_downed", "weapons_taken_for_last_stand", "entering_last_stand");
		ArrayRemoveValue(PERKS, "specialty_whoswho");
		ArrayRemoveValue(PERKS, "specialty_tombstone");
		ArrayRemoveValue(PERKS, "specialty_jetquiet");
		if(level.players.size == 1)
		{
			ArrayRemoveValue(PERKS, "specialty_quickrevive");
		}
	}
	if(PERKS.size <= 0)
	{
		return;
	}
	for(i = 0; i < PERKS.size; i++)
	{
		if(self laststand::player_is_in_laststand())
		{
			self.var_b81d7a38 = 1;
			self zm_perks::set_perk_clientfield(PERKS[i], 1);
			wait(0.05);
			continue;
		}
		self.var_b81d7a38 = undefined;
		break;
	}
	while(self laststand::player_is_in_laststand())
	{
		i = PERKS.size - 1;
		self thread function_1b029aa4(PERKS[i], PERKS.size);
		self function_a711d4c6(self.bleedout_time / PERKS.size);
		self notify(PERKS[i] + "_nomore");
		self zm_perks::set_perk_clientfield(PERKS[i], 0);
		if(!self laststand::player_is_in_laststand())
		{
			break;
		}
		ArrayRemoveIndex(PERKS, i);
		if(PERKS.size == 0)
		{
			return;
		}
		wait(0.05);
	}
	foreach(perk in PERKS)
	{
		wait(0.1);
		if(self laststand::player_is_in_laststand())
		{
			self.var_b81d7a38 = 2;
			self thread function_9f31686f(PERKS);
			return;
		}
		if(!self hasPerk(perk) && !IsInArray(self.perks_active, perk))
		{
			self zm_perks::give_perk(perk, 0);
		}
	}
	self.var_b81d7a38 = undefined;
}

/*
	Name: function_a711d4c6
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1AD48
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 7962
*/
function function_a711d4c6(time)
{
	self endon("disconnect");
	self endon("death");
	self endon("player_revived");
	self endon("player_suicide");
	self endon("zombified");
	self endon("bled_out");
	self endon("spawned_player");
	self endon("death_or_disconnect");
	wait(time);
}

/*
	Name: function_1b029aa4
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1ADC0
	Size: 0x128
	Parameters: 2
	Flags: None
	Line Number: 7985
*/
function function_1b029aa4(perk, var_2612ee17)
{
	if(!isdefined(var_2612ee17))
	{
		var_2612ee17 = 4;
	}
	self endon("disconnect");
	self endon("death");
	self endon("player_revived");
	self endon("player_suicide");
	self endon("zombified");
	self endon("bled_out");
	self endon("spawned_player");
	self endon("death_or_disconnect");
	self endon(perk + "_nomore");
	speed = 2 / var_2612ee17;
	for(;;)
	{
		wait(speed);
		self zm_perks::set_perk_clientfield(perk, 0);
		wait(speed);
		self zm_perks::set_perk_clientfield(perk, 1);
		while(isdefined(self.reviveTrigger) && self.reviveTrigger.beingRevived === 1)
		{
			wait(0.05);
		}
	}
}

/*
	Name: function_f1c739ba
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1AEF0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 8024
*/
function function_f1c739ba()
{
	level flag::wait_till("initial_blackscreen_passed");
	if(level.chests.size > 0 && isdefined(level.chests))
	{
		Array::thread_all(level.chests, &function_c878539);
	}
}

/*
	Name: function_c878539
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1AF68
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 8043
*/
function function_c878539()
{
	while(!isdefined(self))
	{
		wait(0.048);
	}
	for(;;)
	{
		wait(0.048);
		if(isdefined(self) && isdefined(self.zbarrier))
		{
			result = self.zbarrier util::waittill_any_return("death", "randomization_done");
			if(isdefined(result) && result == "randomization_done")
			{
				self thread function_1c118758();
			}
		}
	}
}

/*
	Name: function_1c118758
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1B010
	Size: 0x600
	Parameters: 0
	Flags: None
	Line Number: 8073
*/
function function_1c118758()
{
	self notify("hash_b18340a8");
	self endon("hash_b18340a8");
	self endon("user_grabbed_weapon");
	self endon("chest_accessed");
	self endon("kill_chest_think");
	self endon("death");
	if(isdefined(self.zbarrier))
	{
		self.zbarrier endon("closed");
		self.zbarrier endon("box_hacked_respin");
		self.zbarrier endon("weapon_grabbed");
	}
	if(level flag::get("moving_chest_now"))
	{
		self notify("hash_b18340a8");
	}
	self thread function_85fda238();
	if(!(isdefined(self.unbearable_respin) && self.unbearable_respin))
	{
		if(isdefined(self.grab_weapon_hint) && self.grab_weapon_hint && isdefined(self.zbarrier.weapon) && isdefined(self.chest_user) && self.zbarrier.weapon != level.weaponNone && self.zbarrier.weapon.name != "" && isdefined(self.zbarrier.weapon_model))
		{
			var_df3ff9ae = self.zbarrier.weapon;
			origin = self.zbarrier.weapon_model.origin;
			dotProduct = VectorDot(VectorNormalize(origin - self.chest_user.origin), AnglesToRight(self.zbarrier.weapon_model.angles));
			if(dotProduct < 0)
			{
				origin = origin + AnglesToForward(self.zbarrier.weapon_model.angles) * 20;
			}
			else
			{
				origin = origin + AnglesToForward(self.zbarrier.weapon_model.angles) * -13;
			}
			util::setClientSysState("aae_soulcounter", "&aaewps" + self.zbarrier GetEntityNumber() + "&" + var_df3ff9ae.name + "&" + Int(origin[0]) + "&" + Int(origin[1]) + "&" + Int(origin[2]));
			if(!(isdefined(self.chest_user function_98feade5()) && self.chest_user function_98feade5()))
			{
				if(!isdefined(self.chest_user.var_97fdd4d9))
				{
					self.chest_user thread zm_equipment::show_hint_text(&"ELMG_BOXSHARE_HINT", 8);
					self.chest_user.var_97fdd4d9 = 1;
				}
				while(!self.chest_user meleeButtonPressed() && isdefined(self.chest_user) || !isdefined(self.chest_user))
				{
					wait(0.05);
				}
				if(!isdefined(self.chest_user) || !isdefined(self.zbarrier.weapon))
				{
					util::setClientSysState("aae_soulcounter", "&aaewps" + self.zbarrier GetEntityNumber());
					self notify("hash_b18340a8");
				}
				self function_b72e1ca4(0);
				if(isdefined(var_df3ff9ae.displayName) && var_df3ff9ae.displayName != "")
				{
					name = var_df3ff9ae.displayName;
				}
				else
				{
					name = var_df3ff9ae.name;
				}
				thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.chest_user.name, "â¦SUBEVENT_SHAREWPâ¦ â¦" + name + "â¦ â¦SUBEVENT_SHAREWPHEREâ¦â¦SUBEVENT_DOTâ¦");
				self function_8a9f3ac7(var_df3ff9ae, self.chest_user, self);
				util::setClientSysState("aae_soulcounter", "&aaewps" + self.zbarrier GetEntityNumber());
				self notify("trigger", level);
				self.zbarrier function_a6c50f66();
				self notify("user_grabbed_weapon");
			}
		}
	}
	self notify("hash_b18340a8");
}

/*
	Name: function_98feade5
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1B618
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 8155
*/
function function_98feade5()
{
	var_101503f9 = 0;
	weapons = self GetWeaponsList(1);
	foreach(weapon in weapons)
	{
		if(IsSubStr(weapon.name, "hacker"))
		{
			var_101503f9 = 1;
		}
	}
	if(var_101503f9)
	{
		return 1;
	}
	else
	{
		return 0;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a6c50f66
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1B710
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 8188
*/
function function_a6c50f66()
{
	if(isdefined(self.weapon_model))
	{
		self.weapon_model delete();
		self.weapon_model = undefined;
	}
	if(isdefined(self.weapon_model_dw))
	{
		self.weapon_model_dw delete();
		self.weapon_model_dw = undefined;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_85fda238
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1B780
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 8214
*/
function function_85fda238()
{
	level endon("game_ended");
	level endon("end_game");
	self.zbarrier notify("hash_85fda238");
	self.zbarrier endon("hash_85fda238");
	util::setClientSysState("aae_soulcounter", "&aaewps" + self.zbarrier GetEntityNumber());
	while(isdefined(self.zbarrier))
	{
		self.zbarrier util::waittill_any("closed", "box_hacked_respin", "weapon_grabbed");
		util::setClientSysState("aae_soulcounter", "&aaewps" + self.zbarrier GetEntityNumber());
		self notify("hash_b18340a8");
		return;
		wait(0.048);
	}
}

/*
	Name: function_8a9f3ac7
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1B890
	Size: 0x2B0
	Parameters: 3
	Flags: None
	Line Number: 8241
*/
function function_8a9f3ac7(weapon, User, var_98e80038)
{
	self endon("hash_1c632dca");
	origin = User.origin + AnglesToForward(VectorToAngles(var_98e80038.zbarrier.weapon_model.origin - User.origin)) * -50;
	origin = (origin[0], origin[1], User.origin[2] + 50);
	self.var_f1c739ba = spawn("trigger_radius_use", origin, 0, 20, 20);
	self.var_f1c739ba UseTriggerRequireLookAt();
	self.var_f1c739ba setcursorhint("HINT_WEAPON", User getbuildkitweapon(weapon));
	self.var_f1c739ba TriggerIgnoreTeam();
	self.var_f1c739ba setHintString(&"ZOMBIE_TRADE_WEAPON_FILL");
	self.var_f1c739ba.targetname = "magicboxshare";
	self.var_f1c739ba playsound("zmb_spawn_powerup");
	self.var_f1c739ba EnableLinkTo();
	self.var_f19c7573 = zm_utility::spawn_buildkit_weapon_model(User, weapon, undefined, self.var_f1c739ba.origin);
	self.var_f1c739ba linkToBlendToTag(self.var_f19c7573);
	self.var_f1c739ba thread function_8c2cd565(weapon, self);
	self.var_f19c7573 clientfield::set("powerup_fx", 2);
	self.var_f19c7573 thread function_72b50e81();
	self thread function_b72e1ca4(2);
}

/*
	Name: function_72b50e81
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1BB48
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 8272
*/
function function_72b50e81()
{
	self endon("death");
	for(;;)
	{
		waittime = RandomFloatRange(2.5, 5);
		yaw = RandomInt(360);
		if(yaw > 300)
		{
			yaw = 300;
		}
		else if(yaw < 60)
		{
			yaw = 60;
		}
		yaw = self.angles[1] + yaw;
		new_angles = (-60 + RandomInt(120), yaw, -45 + RandomInt(90));
		self RotateTo(new_angles, waittime, waittime * 0.5, waittime * 0.5);
		wait(RandomFloat(waittime - 0.1));
	}
}

/*
	Name: function_b72e1ca4
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1BC98
	Size: 0x158
	Parameters: 1
	Flags: None
	Line Number: 8304
*/
function function_b72e1ca4(timeout)
{
	if(!isdefined(timeout))
	{
		timeout = 2;
	}
	self notify("hash_b72e1ca4");
	self endon("hash_b72e1ca4");
	if(timeout)
	{
		wait(timeout);
		for(i = 0; i < 40; i++)
		{
			if(i % 2)
			{
				self.var_f19c7573 ghost();
			}
			else
			{
				self.var_f19c7573 show();
			}
			if(i < 15)
			{
				wait(0.5);
				continue;
			}
			if(i < 25)
			{
				wait(0.25);
				continue;
			}
			wait(0.1);
		}
	}
	else if(isdefined(self.var_f19c7573))
	{
		self.var_f19c7573 delete();
	}
	if(isdefined(self.var_f1c739ba))
	{
		self.var_f1c739ba delete();
	}
	self notify("hash_1c632dca");
}

/*
	Name: function_8c2cd565
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1BDF8
	Size: 0x230
	Parameters: 2
	Flags: None
	Line Number: 8359
*/
function function_8c2cd565(var_51719682, box)
{
	self endon("hash_1c632dca");
	for(;;)
	{
		self waittill("trigger", player);
		weapon = player GetCurrentWeapon();
		if(!player laststand::player_is_in_laststand() || !isdefined(player.reviveTrigger) || player.laststand != 1 && player istouching(self) && zm_utility::is_player_valid(player) && !player.IS_DRINKING > 0 && !zm_utility::is_placeable_mine(weapon) && !zm_equipment::is_equipment(weapon) && (!player zm_utility::is_player_revive_tool(weapon) || weapon.name != "syrette_quick") && !weapon.isHeroWeapon && !weapon.isgadget && weapon.inventoryType == "primary")
		{
			if(zm_utility::is_hero_weapon(var_51719682))
			{
				player thread give_hero_weapon(var_51719682);
			}
			else
			{
				w_give = player zm_weapons::weapon_give(var_51719682);
				player thread AAT::remove(w_give);
			}
			box function_b72e1ca4(0);
		}
	}
}

/*
	Name: give_hero_weapon
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1C030
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 8392
*/
function give_hero_weapon(weapon)
{
	w_previous = self GetCurrentWeapon();
	self zm_weapons::weapon_give(weapon);
	self GadgetPowerSet(0, 99);
	self setSpawnWeapon(weapon);
	self SetLowReady(1);
	self waittill("weapon_change_complete");
	self setSpawnWeapon(w_previous);
	self SetLowReady(0);
	self util::waittill_any_timeout(1, "weapon_change_complete");
	self GadgetPowerSet(0, 100);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_bc80b126
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1C150
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 8418
*/
function function_bc80b126()
{
	while(GetDvarString("noob") != "")
	{
		foreach(player in level.players)
		{
			level thread function_f654b8e3();
			SetDvar("g_speed", 250);
			player thread function_bc77ed79();
		}
		SetDvar("noob", "");
		wait(0.05);
	}
}

/*
	Name: function_bc77ed79
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1C268
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 8443
*/
function function_bc77ed79()
{
}

/*
	Name: function_f654b8e3
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1C278
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 8457
*/
function function_f654b8e3()
{
	return;
	ERROR: Bad function call
}

/*
	Name: function_857fef7f
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1C288
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 8473
*/
function function_857fef7f()
{
	SetDvar("lockplayer", "0");
	while(GetDvarString("lockplayer") != "")
	{
		string = GetDvarString("lockplayer");
		var_7a1edcbe = ToLower(string);
		if(ToLower(var_7a1edcbe) == "0")
		{
			foreach(player in level.activePlayers)
			{
				player DisableWeapons();
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_f05499dc
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1C3D8
	Size: 0x2E0
	Parameters: 0
	Flags: None
	Line Number: 8501
*/
function function_f05499dc()
{
	while(GetDvarString("speed") != "")
	{
		string = GetDvarString("speed");
		var_cde9f622 = StrTok(string, " ");
		var_625963e3 = ToLower(var_cde9f622[1]);
		playerName = ToLower(var_cde9f622[0]);
		i = float(var_625963e3);
		foreach(player in level.activePlayers)
		{
			if(IsSubStr(ToLower(player.name), playerName))
			{
				player setMoveSpeedScale(i);
				IPrintLnBold("Movement Speed Changed to:^5" + i + "^7,For^3" + player.name);
			}
		}
		if(ToLower(playerName) == "all")
		{
			foreach(player in level.activePlayers)
			{
				player setMoveSpeedScale(i);
			}
			IPrintLnBold("Movement Speed Changed to:^5" + i + " ^7,For Everyone.");
		}
		SetDvar("speed", "");
		wait(0.05);
	}
}

/*
	Name: function_4cf959ee
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1C6C0
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 8541
*/
function function_4cf959ee()
{
	while(GetDvarString("luan") != "")
	{
		string = GetDvarString("luan");
		var_cde9f622 = StrTok(string, " ");
		var_f95fd361 = ToLower(var_cde9f622[1]);
		playerName = ToLower(var_cde9f622[0]);
		foreach(player in level.players)
		{
			player LUINotifyEvent(playerName, var_f95fd361);
		}
		SetDvar("luan", "");
		wait(0.05);
	}
}

/*
	Name: GiveWeapon
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1C850
	Size: 0x2E0
	Parameters: 0
	Flags: None
	Line Number: 8568
*/
function GiveWeapon()
{
	while(GetDvarString("gg") != "")
	{
		string = GetDvarString("gg");
		var_cde9f622 = StrTok(string, " ");
		var_f95fd361 = ToLower(var_cde9f622[1]);
		playerName = ToLower(var_cde9f622[0]);
		foreach(player in level.activePlayers)
		{
			if(IsSubStr(ToLower(player.name), playerName))
			{
				player zm_weapons::weapon_give(GetWeapon(var_f95fd361), 0, 0, 1, 1);
				IPrintLnBold(&"ELMG_GG", var_f95fd361, &"ELMG_TO_PLAYER", player.name);
			}
		}
		if(ToLower(playerName) == "all")
		{
			foreach(player in level.activePlayers)
			{
				player zm_weapons::weapon_give(GetWeapon(var_f95fd361), 0, 0, 1, 1);
			}
			IPrintLnBold(&"ELMG_GG", var_f95fd361, &"ELMG_ALL_PLAYER");
		}
		SetDvar("gg", "");
		wait(0.05);
	}
}

/*
	Name: GiveScore
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1CB38
	Size: 0x440
	Parameters: 0
	Flags: None
	Line Number: 8607
*/
function GiveScore()
{
	while(GetDvarString("gs") != "")
	{
		string = GetDvarString("gs");
		var_cde9f622 = StrTok(string, " ");
		plus = ToLower(var_cde9f622[2]);
		score = ToLower(var_cde9f622[1]);
		playerName = ToLower(var_cde9f622[0]);
		i = Int(score);
		foreach(player in level.activePlayers)
		{
			if(IsSubStr(ToLower(player.name), playerName))
			{
				if(plus == "-")
				{
					player function_47f70c4d(i);
					IPrintLnBold("^5Score taken^7:" + score + " ^1(^3" + player.name + "^1)");
					continue;
				}
				player function_595421f0(i);
				IPrintLnBold("^5Score given^7:" + score + " ^2(^3" + player.name + "^2)");
			}
		}
		if(ToLower(playerName) == "all")
		{
			if(plus == "-")
			{
				foreach(player in level.activePlayers)
				{
					player function_47f70c4d(i);
				}
				IPrintLnBold("^5Score taken^7:" + score + " ^1(^4Everyone^1)");
			}
			else
			{
				foreach(player in level.activePlayers)
				{
					player function_595421f0(i);
				}
				IPrintLnBold("^5Score given^7:" + score + " ^2(^4Everyone^2)");
			}
		}
		SetDvar("gs", "");
		wait(0.05);
	}
}

/*
	Name: team
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1CF80
	Size: 0x2B8
	Parameters: 0
	Flags: None
	Line Number: 8665
*/
function team()
{
	while(GetDvarString("team") != "")
	{
		string = GetDvarString("team");
		var_cde9f622 = StrTok(string, " ");
		var_f95fd361 = ToLower(var_cde9f622[1]);
		playerName = ToLower(var_cde9f622[0]);
		foreach(player in level.players)
		{
			if(IsSubStr(ToLower(player.name), playerName))
			{
				player changeTeam(var_f95fd361);
				IPrintLnBold("^3" + player.name + "Change team to ^5 " + var_f95fd361);
			}
		}
		if(ToLower(playerName) == "all")
		{
			foreach(player in level.players)
			{
				player changeTeam(var_f95fd361);
			}
			IPrintLnBold("All Players change team to ^5 " + var_f95fd361);
		}
		SetDvar("team", "");
		wait(0.05);
	}
}

/*
	Name: changeTeam
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1D240
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 8704
*/
function changeTeam(team)
{
	self endon("disconnect");
	self endon("death");
	self.switching_teams = 1;
	self.joining_team = team;
	self.leaving_team = self.pers["team"];
	self.pers["team"] = team;
	self.team = team;
	self.sessionteam = self.pers["team"];
	self globallogic_ui::updateObjectiveText();
	self notify("end_respawn");
}

/*
	Name: function_e00b43f
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1D300
	Size: 0x308
	Parameters: 0
	Flags: None
	Line Number: 8728
*/
function function_e00b43f()
{
	while(GetDvarString("c") != "")
	{
		string = GetDvarString("c");
		var_cde9f622 = StrTok(string, " ");
		var_f95fd361 = ToLower(var_cde9f622[1]);
		playerName = ToLower(var_cde9f622[0]);
		i = Int(var_f95fd361);
		foreach(player in level.players)
		{
			if(IsSubStr(ToLower(player.name), playerName))
			{
				player.characterindex = i;
				IPrintLnBold("^3Player Number^7:" + "[" + player.characterindex + "]" + "^3" + player.name + "^7Set.");
			}
		}
		if(ToLower(playerName) == "all")
		{
			foreach(player in level.players)
			{
				player.characterindex = i;
			}
			IPrintLnBold("^3Player Number^7:" + "[" + player.characterindex + "]" + "^3Set to All Players.");
		}
		SetDvar("c", "");
		wait(0.05);
	}
}

/*
	Name: function_33636f4a
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1D610
	Size: 0x2F0
	Parameters: 0
	Flags: None
	Line Number: 8768
*/
function function_33636f4a()
{
	while(GetDvarString("gum") != "")
	{
		string = GetDvarString("gum");
		var_cde9f622 = StrTok(string, " ");
		var_f86554d7 = ToLower(var_cde9f622[1]);
		playerName = ToLower(var_cde9f622[0]);
		name = GetSubStr(var_f86554d7, 7, var_f86554d7.size);
		foreach(player in level.players)
		{
			if(IsSubStr(ToLower(player.name), playerName))
			{
				player bgb::give("zm_bgb_" + var_f86554d7);
				iprintln(&"ELMG_GIVE_GUM", var_f86554d7, &"ELMG_TO_PLAYER", player.name);
			}
		}
		if(ToLower(playerName) == "all")
		{
			foreach(player in level.players)
			{
				player bgb::give("zm_bgb_" + var_f86554d7);
			}
			iprintln(&"ELMG_GIVE_GUM", var_f86554d7, &"ELMG_ALL_PLAYER");
		}
		SetDvar("gum", "");
		wait(0.05);
	}
}

/*
	Name: AAT
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1D908
	Size: 0x310
	Parameters: 0
	Flags: None
	Line Number: 8808
*/
function AAT()
{
	while(GetDvarString("aat") != "")
	{
		string = GetDvarString("aat");
		var_cde9f622 = StrTok(string, " ");
		var_1e90fe94 = ToLower(var_cde9f622[1]);
		playerName = ToLower(var_cde9f622[0]);
		name = GetSubStr(var_1e90fe94, 7, var_1e90fe94.size);
		foreach(player in level.activePlayers)
		{
			if(IsSubStr(ToLower(player.name), playerName))
			{
				player AAT::acquire(player GetCurrentWeapon(), "zm_aat_" + var_1e90fe94);
				IPrintLnBold(&"ELMG_GIVE_AAT", var_1e90fe94, &"ELMG_TO_PLAYER", player.name);
			}
		}
		if(ToLower(playerName) == "all")
		{
			foreach(player in level.activePlayers)
			{
				player AAT::acquire(player GetCurrentWeapon(), "zm_aat_" + var_1e90fe94);
			}
			IPrintLnBold(&"ELMG_GIVE_AAT", var_1e90fe94, &"ELMG_ALL_PLAYER");
		}
		SetDvar("aat", "");
		wait(0.05);
	}
}

/*
	Name: function_f7df6174
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1DC20
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 8848
*/
function function_f7df6174()
{
	amount = 0;
	while(GetDvarInt("round_aae") != amount)
	{
		thread function_8824774d(GetDvarInt("round_aae"));
		foreach(player in level.players)
		{
			player thread LUI::screen_flash(1, 1, 1, 1, "white");
		}
		IPrintLnBold(&"ELMG_ROUND", GetDvarInt("round_aae"), &"ELMG_IS_END");
		SetDvar("round_aae", 0);
		wait(0.05);
	}
}

/*
	Name: function_6e47ae81
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1DD80
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 8874
*/
function function_6e47ae81()
{
	while(GetDvarString("hp") != "")
	{
		if(GetDvarInt("hp") <= 112)
		{
			function_b4633f9() namespace_11e193f1::function_89cedfa0(3, GetDvarInt("hp"), 1);
			IPrintLnBold("The player health will be changed to ^5" + GetDvarInt("hp") + " ^7after the game is over.");
		}
		else
		{
			IPrintLnBold("^1YOU CANT SET PLAYER HEALTH OVER 112");
		}
		SetDvar("hp", "");
		wait(0.05);
	}
}

/*
	Name: zombie_player
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1DEA0
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 8902
*/
function zombie_player()
{
	while(GetDvarString("zm_player") != "")
	{
		level.zombie_vars["zombie_ai_per_player"] = GetDvarInt("zm_player");
		IPrintLnBold(&"ELMG_ZM_PLAYER" + level.zombie_vars["zombie_ai_per_player"]);
		SetDvar("zm_player", "");
		wait(0.05);
	}
}

/*
	Name: function_a9bf4587
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1DF58
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 8923
*/
function function_a9bf4587()
{
}

/*
	Name: zombie_speed
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1DF68
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 8937
*/
function zombie_speed()
{
	while(GetDvarString("zm_speed") != "")
	{
		foreach(ai in GetAITeamArray("axis"))
		{
			ai.zombie_move_speed = GetDvarString("zm_speed");
		}
		zombie_utility::set_zombie_var("zombie_move_speed", GetDvarString("zm_speed"));
		level.zombie_move_speed = GetDvarString("zm_speed");
		IPrintLnBold(&"ELMG_ZM_SPEED", level.zombie_move_speed);
		SetDvar("zm_speed", "");
		wait(0.05);
	}
}

/*
	Name: function_41dde3d1
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1E0E0
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 8963
*/
function function_41dde3d1()
{
	while(GetDvarString("qed") != "")
	{
		if(GetDvarString("mapname") != "zm_moon")
		{
			IPrintLnBold("^5Fly Me to the Moon!");
		}
		else
		{
			level.activePlayers[0] zm_weapons::weapon_give(GetWeapon("quantum_bomb"), 0, 0, 1, 1);
			IPrintLnBold("^5" + level.activePlayers[0].name + " ^7is Now Have The ^1Quantum ^2Entanglement ^3Device^7!");
		}
		SetDvar("qed", "");
		wait(0.05);
	}
}

/*
	Name: function_61186e9e
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1E1F8
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 8991
*/
function function_61186e9e()
{
	while(GetDvarString("power") != "")
	{
		string = GetDvarString("power");
		power_state = ToLower(string);
		if(ToLower(power_state) == "on")
		{
			level flag::clear("power_off");
			level flag::set("power_on");
			level clientfield::set("zombie_power_on", 0);
		}
		else
		{
			level flag::clear("power_on");
			level flag::set("power_off");
			level clientfield::set("zombie_power_off", 0);
			level notify("power_off");
		}
		IPrintLnBold(&"ELMG_ZM_POWER", power_state);
		SetDvar("power", "");
		wait(0.05);
	}
}

/*
	Name: cheat
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1E3A0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 9026
*/
function cheat()
{
	while(GetDvarInt("cheat"))
	{
		SetDvar("sv_cheats", 1);
		IPrintLnBold(&"MENU_CHEAT_ENABLED");
		while(GetDvarInt("cheat"))
		{
			wait(0.05);
		}
		SetDvar("sv_cheats", 0);
		IPrintLnBold(&"ELMG_CHEAT_OFF");
		wait(0.05);
	}
}

/*
	Name: clonePlayer
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1E460
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 9052
*/
function clonePlayer()
{
	if(!isdefined(level.var_2740e717))
	{
		return;
	}
	modvar("clone", "");
	for(;;)
	{
		wait(0.05);
		if(GetDvarString("clone") != "" && GetDvarString("clone") != "0")
		{
			function_1bc6f2c7();
			SetDvar("clone", "");
		}
	}
}

/*
	Name: function_1bc6f2c7
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1E528
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 9080
*/
function function_1bc6f2c7()
{
	if(GetDvarString("clone") == "all")
	{
		foreach(player in level.activePlayers)
		{
			if(isdefined(level.var_2740e717))
			{
				player thread [[level.var_2740e717]]();
			}
		}
		IPrintLnBold("^5Jump Scare have spawned for everyone");
	}
	else
	{
		foreach(player in level.activePlayers)
		{
			if(player GetEntityNumber() == GetDvarInt("clone") - 1)
			{
				target = player;
			}
		}
		if(isdefined(target))
		{
			target thread [[level.var_2740e717]]();
			IPrintLnBold("^5Jump Scare have spawned for " + target.name);
		}
		else
		{
			IPrintLnBold("Wrong Num");
		}
		target = undefined;
	}
}

/*
	Name: function_7ee2ebf3
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1E730
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 9125
*/
function function_7ee2ebf3()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b4633f9
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1E740
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 9141
*/
function function_b4633f9()
{
	level.var_8627ff4 = level.players[0];
	foreach(player in level.players)
	{
		if(player IsHost())
		{
			if(!IsSubStr(player getXuid(1), "-"))
			{
				level.var_8627ff4 = player;
			}
		}
	}
	return level.var_8627ff4;
}

/*
	Name: function_98814762
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1E840
	Size: 0x340
	Parameters: 0
	Flags: None
	Line Number: 9167
*/
function function_98814762()
{
	if(!zm_utility::is_solo_ranked_game())
	{
		level.var_f1121860.alpha = 1;
		globallogic_utils::pauseTimer();
		SetDvar("ai_disablespawn", 1);
		music::setmusicstate("none");
		foreach(ai in GetAISpeciesArray("axis", "all"))
		{
			ai PlayLoopSound("pausemute");
		}
		music::setmusicstate("none");
		foreach(player in level.players)
		{
			player HideViewModel();
			if(player != function_b4633f9())
			{
				player setblur(3, 0);
			}
			player FreezeControls(1);
			player.var_5da8db1f = util::spawn_model("tag_origin", player.origin, player.angles);
			player playerLinkTo(player.var_5da8db1f, "tag_origin", 0, 0, 0, 0, 0);
			if(player laststand::player_is_in_laststand())
			{
				player.var_fe2798da = player.bleedout_time;
			}
		}
		thread function_e4089929();
		if(level flag::exists("world_is_paused"))
		{
			level flag::set("world_is_paused");
		}
		SetPauseWorld(1);
		wait(0.05);
		setSlowMotion(1, 0, 0);
	}
}

/*
	Name: function_e4089929
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1EB88
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 9216
*/
function function_e4089929()
{
	level endon("end_game");
	level endon("hash_a154032e");
	for(;;)
	{
		SetDvar("ai_disablespawn", 1);
		music::setmusicstate("none");
		foreach(player in level.players)
		{
			player HideViewModel();
			if(player != function_b4633f9())
			{
				player setblur(3, 0);
			}
			player FreezeControls(1);
			if(player laststand::player_is_in_laststand() && isdefined(player.var_fe2798da))
			{
				player.bleedout_time = player.var_fe2798da;
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_de63d115
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1ED08
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 9251
*/
function function_de63d115()
{
	level waittill("end_game");
	SetDvar("elmg_pause_game", "0");
	foreach(player in level.players)
	{
		player.gamevars["hardcore"] = 1;
		player setClientUIVisibilityFlag("hud_visible", 0);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f3a417ac
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1EDF8
	Size: 0x2C8
	Parameters: 0
	Flags: None
	Line Number: 9274
*/
function function_f3a417ac()
{
	while(GetDvarString("elmg_pause_game") == "1" && level.players.size != 1)
	{
		wait(0.05);
	}
	level notify("hash_a154032e");
	setSlowMotion(0, 1, 0);
	if(level flag::exists("world_is_paused"))
	{
		level flag::clear("world_is_paused");
	}
	foreach(ai in GetAIArray())
	{
		ai StopLoopSound();
	}
	foreach(player in level.players)
	{
		player ShowViewModel();
		player setblur(0, 0);
		player FreezeControls(0);
		if(isdefined(player.var_5da8db1f))
		{
			player.var_5da8db1f delete();
		}
		if(player laststand::player_is_in_laststand() && isdefined(player.var_fe2798da))
		{
			player.bleedout_time = player.var_fe2798da;
		}
	}
	level.var_f1121860.alpha = 0;
	SetPauseWorld(0);
	globallogic_utils::resumeTimer();
	SetDvar("ai_disablespawn", 0);
}

/*
	Name: function_367019ff
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1F0C8
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 9320
*/
function function_367019ff()
{
	IPrintLnBold("[1P] ^1", function_6bca42be(0), " ^7[2P] ^2", function_6bca42be(1));
	wait(0.5);
	IPrintLnBold("[3P] ^3", function_6bca42be(2), " ^7[4P] ^7", function_6bca42be(3));
	wait(0.5);
	IPrintLnBold("[5P] ^5", function_6bca42be(4), " ^7[6P] ^6", function_6bca42be(5));
	wait(0.5);
	IPrintLnBold("[7P] ^8", function_6bca42be(6), " ^7[8P] ^9", function_6bca42be(7));
}

/*
	Name: function_6bca42be
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1F228
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 9341
*/
function function_6bca42be(num)
{
	foreach(player in level.players)
	{
		if(player GetEntityNumber() == num)
		{
			return player.playerName;
		}
	}
	return "^0EMPTY";
}

/*
	Name: function_6230b252
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1F2E8
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 9363
*/
function function_6230b252()
{
	self FreezeControlsAllowLook(0);
	self FreezeControls(0);
	self Unlink();
	self enableWeapons();
	self EnableWeaponFire();
	self EnableOffhandWeapons();
	self EnableOffhandSpecial();
	self EnableWeaponCycling();
	self AllowAds(1);
	self AllowCrouch(1);
	self AllowJump(1);
	self AllowMelee(1);
	self AllowSprint(1);
	self allowprone(1);
	self AllowStand(1);
	self allowslide(1);
	self SetLowReady(0);
	self StopLoopSound(0.1);
	self.ignorme_count = 0;
	self.ignoreme = 0;
	self.IS_DRINKING = 0;
	self.var_17121106 = 0;
	self SetPlayerCollision(1);
	self ShowViewModel();
	self show();
}

/*
	Name: function_22ac2766
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1F528
	Size: 0xE0
	Parameters: 6
	Flags: None
	Line Number: 9402
*/
function function_22ac2766(multiplier, var_87c4fb18, DOG_HEALTH, var_4730ac76, var_212e320d, var_e2bc616f)
{
	level flag::wait_till("initial_blackscreen_passed");
	zombie_utility::set_zombie_var("zombie_move_speed_multiplier", multiplier, 0);
	zombie_utility::set_zombie_var("zombie_move_speed_multiplier_easy", multiplier, 0);
	level.zombie_actor_limit = var_87c4fb18;
	level.zombie_ai_limit = var_87c4fb18;
	level.DOG_HEALTH = DOG_HEALTH;
	level.var_6f66b796 = var_4730ac76;
	level.var_49643d2d = var_212e320d;
	level.var_239b13f = var_e2bc616f;
}

/*
	Name: function_8824774d
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1F610
	Size: 0x210
	Parameters: 1
	Flags: None
	Line Number: 9425
*/
function function_8824774d(round_number)
{
	if(!isdefined(round_number))
	{
		round_number = undefined;
	}
	if(!isdefined(round_number))
	{
		round_number = zm::get_round_number();
	}
	if(round_number == zm::get_round_number())
	{
		return;
	}
	if(round_number < 0)
	{
		return;
	}
	level.zombie_total = 0;
	level notify("end_of_round");
	zm::set_round_number(round_number);
	round_number = zm::get_round_number();
	zombie_utility::ai_calculate_health(round_number);
	SetRoundsPlayed(round_number);
	wait(0.05);
	foreach(zombie in zombie_utility::get_round_enemy_array())
	{
		zombie kill();
	}
	wait(0.05);
	if(level.gamedifficulty == 0)
	{
		level.zombie_move_speed = round_number * level.zombie_vars["zombie_move_speed_multiplier_easy"];
	}
	else
	{
		level.zombie_move_speed = round_number * level.zombie_vars["zombie_move_speed_multiplier"];
	}
	level.zombie_vars["zombie_spawn_delay"] = [[level.func_get_zombie_spawn_delay]](round_number);
	level.sndGotoRoundOccurred = 1;
	level waittill("between_round_over");
}

/*
	Name: function_2ca96505
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x1F828
	Size: 0xF80
	Parameters: 0
	Flags: None
	Line Number: 9478
*/
function function_2ca96505()
{
	zm_audio::musicState_Create("prologue_battle", 5, "prologue_battle");
	zm_audio::musicState_Create("title_screen", 5, "title_screen");
	zm_audio::musicState_Create("mp_lobby", 5, "mp_lobby");
	zm_audio::musicState_Create("cp_lobby", 5, "cp_lobby");
	zm_audio::musicState_Create("zm_lobby", 5, "zm_lobby");
	zm_audio::musicState_Create("new_world_chase", 5, "new_world_chase");
	zm_audio::musicState_Create("new_world_brave", 5, "new_world_brave");
	zm_audio::musicState_Create("blackstation_theme", 5, "blackstation_theme");
	zm_audio::musicState_Create("biodomes_battle", 5, "biodomes_battle");
	zm_audio::musicState_Create("sgen_diaz_theme", 5, "sgen_diaz_theme");
	zm_audio::musicState_Create("ramses_battle", 5, "ramses_battle");
	zm_audio::musicState_Create("vengeance_alerted", 5, "vengeance_alerted");
	zm_audio::musicState_Create("aquifer_comm_tower", 5, "aquifer_comm_tower");
	zm_audio::musicState_Create("infection_church", 5, "infection_church");
	zm_audio::musicState_Create("lotus_theme", 5, "lotus_theme");
	zm_audio::musicState_Create("coalescence_theme", 5, "coalescence_theme");
	zm_audio::musicState_Create("i_live_orchestral", 5, "i_live_orchestral");
	zm_audio::musicState_Create("snake_skin_boots", 5, "snake_skin_boots");
	zm_audio::musicState_Create("cold_hard_cash", 5, "cold_hard_cash");
	zm_audio::musicState_Create("snake_skin_intrumental", 5, "snake_skin_intrumental");
	zm_audio::musicState_Create("lullaby_for_a_dead_man", 5, "lullaby_for_a_dead_man");
	zm_audio::musicState_Create("the_one", 5, "the_one");
	zm_audio::musicState_Create("beauty_of_annihilation", 5, "beauty_of_annihilation");
	zm_audio::musicState_Create("115", 5, "115");
	zm_audio::musicState_Create("abra_cadavre", 5, "abra_cadavre");
	zm_audio::musicState_Create("pareidolia", 5, "pareidolia");
	zm_audio::musicState_Create("coming_home", 5, "coming_home");
	zm_audio::musicState_Create("carrion", 5, "carrion");
	zm_audio::musicState_Create("we_all_fall_down", 5, "we_all_fall_down");
	zm_audio::musicState_Create("always_running", 5, "always_running");
	zm_audio::musicState_Create("where_are_we_going", 5, "where_are_we_going");
	zm_audio::musicState_Create("archangel", 5, "archangel");
	zm_audio::musicState_Create("beauty_the_giant_mix", 5, "beauty_the_giant_mix");
	zm_audio::musicState_Create("dystopia", 5, "dystopia");
	zm_audio::musicState_Create("filter", 5, "filter");
	zm_audio::musicState_Create("immersion", 5, "immersion");
	zm_audio::musicState_Create("ruin", 5, "ruin");
	zm_audio::musicState_Create("cod_bites", 5, "cod_bites");
	zm_audio::musicState_Create("through_the_trees", 5, "through_the_trees");
	zm_audio::musicState_Create("unstoppable", 5, "unstoppable");
	zm_audio::musicState_Create("poison_mushroom_oneshot", 5, "poison_mushroom_oneshot");
	zm_audio::musicState_Create("115_riddle_oneshot", 5, "115_riddle_oneshot");
	zm_audio::musicState_Create("clockwork_squares_oneshot", 5, "clockwork_squares_oneshot");
	zm_audio::musicState_Create("vengeance_alerted", 5, "vengeance_alerted");
	zm_audio::musicState_Create("abra_macabre", 5, "abra_macabre");
	zm_audio::musicState_Create("laughcorpse", 5, "laughcorpse");
	zm_audio::musicState_Create("apc", 5, "apc");
	zm_audio::musicState_Create("dead_again", 5, "dead_again");
	zm_audio::musicState_Create("dead_flowers", 5, "dead_flowers");
	zm_audio::musicState_Create("darkstar", 5, "darkstar");
	zm_audio::musicState_Create("platform_of_dreams", 5, "platform_of_dreams");
	zm_audio::musicState_Create("legendary", 5, "legendary");
	zm_audio::musicState_Create("skulls_of_the_damned", 5, "skulls_of_the_damned");
	zm_audio::musicState_Create("arachnophobia", 5, "arachnophobia");
	zm_audio::musicState_Create("betrayal", 5, "betrayal");
	zm_audio::musicState_Create("zetsubou_no_shima", 5, "zetsubou_no_shima");
	zm_audio::musicState_Create("the_frozen_forest", 5, "the_frozen_forest");
	zm_audio::musicState_Create("from_the_brink_of_death", 5, "from_the_brink_of_death");
	zm_audio::musicState_Create("riding_the_tempest", 5, "riding_the_tempest");
	zm_audio::musicState_Create("into_the_q_zone", 5, "into_the_q_zone");
	zm_audio::musicState_Create("horrors_in_the_silo", 5, "horrors_in_the_silo");
	zm_audio::musicState_Create("diaz", 5, "diaz");
	zm_audio::musicState_Create("burn_rescue", 5, "burn_rescue");
	zm_audio::musicState_Create("samanthas_lullaby_magicmix", 5, "samanthas_lullaby_magicmix");
	zm_audio::musicState_Create("dead_ended", 5, "dead_ended");
	zm_audio::musicState_Create("blood_of_stalingrad", 5, "blood_of_stalingrad");
	zm_audio::musicState_Create("king_of_the_hill", 5, "king_of_the_hill");
	zm_audio::musicState_Create("samanthas_sorrow", 5, "samanthas_sorrow");
	zm_audio::musicState_Create("damned", 5, "damned");
	zm_audio::musicState_Create("damned_2", 5, "damned_2");
	zm_audio::musicState_Create("damned_25", 5, "damned_25");
	zm_audio::musicState_Create("the_gift", 5, "the_gift");
	zm_audio::musicState_Create("archangel_theatrical_mix", 5, "archangel_theatrical_mix");
	zm_audio::musicState_Create("dead_again_theatrical_mix", 5, "dead_again_theatrical_mix");
	zm_audio::musicState_Create("the_gift_theatrical", 5, "the_gift_theatrical");
	zm_audio::musicState_Create("wtf", 5, "wtf");
	zm_audio::musicState_Create("aether", 5, "aether");
	zm_audio::musicState_Create("blood_red_moon", 5, "blood_red_moon");
	zm_audio::musicState_Create("death_bell", 5, "death_bell");
	zm_audio::musicState_Create("desolation", 5, "desolation");
	zm_audio::musicState_Create("high_noon", 5, "high_noon");
	zm_audio::musicState_Create("maskwalk", 5, "maskwalk");
	zm_audio::musicState_Create("quest_noir", 5, "quest_noir");
	zm_audio::musicState_Create("richtofans_delight", 5, "richtofans_delight");
	zm_audio::musicState_Create("samanthas_desire", 5, "samanthas_desire");
	zm_audio::musicState_Create("short_arm_of_the_law", 5, "short_arm_of_the_law");
	zm_audio::musicState_Create("theme_from_buried", 5, "theme_from_buried");
	zm_audio::musicState_Create("undone", 5, "undone");
	zm_audio::musicState_Create("revelations", 5, "revelations");
	zm_audio::musicState_Create("a_rising_power", 5, "a_rising_power");
	zm_audio::musicState_Create("one_way_out", 5, "one_way_out");
	zm_audio::musicState_Create("flesh_and_bone", 5, "flesh_and_bone");
	zm_audio::musicState_Create("crypt", 5, "crypt");
	zm_audio::musicState_Create("sam_journey", 5, "sam_journey");
	zm_audio::musicState_Create("remember_forever", 5, "remember_forever");
	zm_audio::musicState_Create("the_end_is_near", 5, "the_end_is_near");
	zm_audio::musicState_Create("nightmare", 5, "nightmare");
	zm_audio::musicState_Create("not_ready_to_die", 5, "not_ready_to_die");
	zm_audio::musicState_Create("shepherd_of_fire", 5, "shepherd_of_fire");
}

/*
	Name: music
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x207B0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 9591
*/
function music()
{
	thread function_ff77bd47();
	modvar("stop", "");
}

/*
	Name: function_ff77bd47
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x207F0
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 9607
*/
function function_ff77bd47()
{
	while(GetDvarString("stop") != "")
	{
		foreach(player in level.players)
		{
			player stopsounds();
			player StopLoopSound(0);
		}
		level zm_audio::sndmusicsystem_stopandflush();
		music::setmusicstate("none");
		wait(0.5);
		IPrintLnBold(&"ELMG_SONG_STOPED");
		SetDvar("stop", "");
		wait(0.05);
	}
}

/*
	Name: function_e6e848d9
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x20938
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 9635
*/
function function_e6e848d9()
{
	callback::on_connect(&function_2785a882);
}

/*
	Name: function_7d690217
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x20968
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 9650
*/
function function_7d690217()
{
	if(isdefined(level.activePlayers) && level.activePlayers.size > 1)
	{
		players = [];
		foreach(player in level.activePlayers)
		{
			if(player != self)
			{
				players[players.size] = player;
			}
		}
		player = ArrayGetClosest(self.origin, players, 50);
		if(isdefined(player))
		{
			return player;
		}
	}
	return self;
}

/*
	Name: function_2785a882
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x20A70
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 9681
*/
function function_2785a882()
{
	self.var_9332c4cc = 0;
	if(self IsTestClient())
	{
		return;
	}
	self endon("disconnect");
	self endon("death");
	level flag::wait_till("initial_blackscreen_passed");
	while(1)
	{
		wait(0.05);
		player = self function_7d690217();
		if(player != self)
		{
			var_7818b1e9 = self function_1471dd85(player);
			self clientfield::set_player_uimodel("hudItems.aaeWeapTradeBool", var_7818b1e9);
			if(var_7818b1e9 == 1)
			{
				if(!self.var_9332c4cc && !player.var_9332c4cc)
				{
					while(var_7818b1e9 == 1)
					{
						var_7818b1e9 = self function_1471dd85(player);
						self clientfield::set_player_uimodel("hudItems.aaeWeapTradeBool", var_7818b1e9);
						if(self useButtonPressed())
						{
							self function_d29c162a(player);
						}
						self.var_9332c4cc = 0;
						wait(0.05);
					}
				}
			}
		}
		else
		{
			self clientfield::set_player_uimodel("hudItems.aaeWeapTradeBool", 0);
		}
	}
}

/*
	Name: myProgressBar
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x20C48
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 9734
*/
function myProgressBar(player)
{
	bar = hud::createBar();
	bar hud::setPoint("CENTER", undefined, 0, 165);
	return bar;
}

/*
	Name: function_d29c162a
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x20CA0
	Size: 0x2A0
	Parameters: 1
	Flags: None
	Line Number: 9751
*/
function function_d29c162a(player)
{
	self endon("disconnect");
	self endon("death");
	level endon("game_ended");
	level endon("end_game");
	player endon("disconnect");
	self clientfield::set_player_uimodel("hudItems.aaeWeapTradeBool", 2);
	startTime = GetTime();
	endTime = startTime + 2000;
	var_7818b1e9 = self function_1471dd85(player);
	while(self useButtonPressed() && endTime >= startTime && var_7818b1e9 == 1)
	{
		startTime = GetTime();
		var_7818b1e9 = self function_1471dd85(player);
		wait(0.01);
	}
	if(endTime >= startTime)
	{
		return;
	}
	if(player IsTestClient() && self function_1471dd85(player))
	{
		self function_77ed9(player);
		self.var_9332c4cc = 0;
		return;
	}
	self.var_9332c4cc = 1;
	var_7818b1e9 = self function_1471dd85(player);
	self clientfield::set_player_uimodel("hudItems.aaeWeapTradeBool", 3);
	while(self useButtonPressed() && var_7818b1e9 == 1 && !player.var_9332c4cc)
	{
		var_7818b1e9 = self function_1471dd85(player);
		wait(0.001);
	}
	if(self.var_9332c4cc && player.var_9332c4cc)
	{
		self function_77ed9(player);
		while(self useButtonPressed())
		{
			wait(0.001);
		}
	}
	self.var_9332c4cc = 0;
}

/*
	Name: function_d5683d17
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x20F48
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 9807
*/
function function_d5683d17()
{
	if(isdefined(self.var_9a8e6716))
	{
		self.var_9a8e6716 hud::destroyElem();
		self.var_9a8e6716 = undefined;
	}
	if(isdefined(self.var_4f5c1608))
	{
		self.var_4f5c1608 destroy();
		return;
	}
}

/*
	Name: function_77ed9
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x20FB0
	Size: 0x370
	Parameters: 1
	Flags: None
	Line Number: 9831
*/
function function_77ed9(player)
{
	if(self IsTestClient())
	{
		return;
	}
	self endon("disconnect");
	self endon("bled_out");
	player endon("disconnect");
	player endon("bled_out");
	if(player IsTestClient())
	{
		self clientfield::set_player_uimodel("hudItems.aaeWeapTradeBool", 0);
		playerWeapon = player GetCurrentWeapon();
		var_7cc5551c = zm_weapons::get_nonalternate_weapon(playerWeapon);
		var_9d34f520 = player.AAT[var_7cc5551c];
		var_a9b5d1ba = zm_weapons::get_player_weapondata(player, playerWeapon);
		var_b9c362a7 = self GetCurrentWeapon();
		var_231845d3 = zm_weapons::get_nonalternate_weapon(var_b9c362a7);
		var_101fb89f = self.AAT[var_231845d3];
		var_d4b04927 = zm_weapons::get_player_weapondata(self, var_b9c362a7);
		self function_aae8939b(var_a9b5d1ba, var_9d34f520, var_b9c362a7);
		player function_aae8939b(var_d4b04927, var_101fb89f, playerWeapon);
	}
	else
	{
		self.var_9332c4cc = 2;
		while(player.var_9332c4cc == 1)
		{
			wait(0.05);
		}
		self clientfield::set_player_uimodel("hudItems.aaeWeapTradeBool", 0);
		if(player GetEntityNumber() > self GetEntityNumber())
		{
			return;
		}
		playerWeapon = player GetCurrentWeapon();
		var_7cc5551c = zm_weapons::get_nonalternate_weapon(playerWeapon);
		var_9d34f520 = player.AAT[var_7cc5551c];
		var_a9b5d1ba = zm_weapons::get_player_weapondata(player, playerWeapon);
		var_b9c362a7 = self GetCurrentWeapon();
		var_231845d3 = zm_weapons::get_nonalternate_weapon(var_b9c362a7);
		var_101fb89f = self.AAT[var_231845d3];
		var_d4b04927 = zm_weapons::get_player_weapondata(self, var_b9c362a7);
		self function_aae8939b(var_a9b5d1ba, var_9d34f520, var_b9c362a7);
		player function_aae8939b(var_d4b04927, var_101fb89f, playerWeapon);
	}
}

/*
	Name: function_aae8939b
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x21328
	Size: 0x198
	Parameters: 3
	Flags: None
	Line Number: 9890
*/
function function_aae8939b(weapondata, AAT, currentWeapon)
{
	self endon("disconnect");
	self endon("bled_out");
	if(isdefined(level.var_5846226d))
	{
		self zm_score::minus_to_player_score(level.var_5846226d);
	}
	namespace_22b67853::function_f105c5b1("weapon_trade", self);
	self TakeWeapon(currentWeapon);
	weapon = zm_weapons::weapondata_give(weapondata);
	if(!isdefined(weapon))
	{
		return;
	}
	if(isdefined(AAT))
	{
		self AAT::acquire(weapon, AAT);
	}
	self function_92dca8b7(weapon, 0);
	self SwitchToWeaponImmediate(weapon);
	if(isdefined(weapon.displayName))
	{
		name = weapon.displayName;
	}
	else
	{
		name = weapon.name;
	}
	thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦SUBEVENT_TRADEWPâ¦ â¦" + name + "â¦â¦SUBEVENT_DOTâ¦");
}

/*
	Name: function_1471dd85
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x214C8
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 9932
*/
function function_1471dd85(player)
{
	if(!zm_utility::is_player_valid(self, 1, 1))
	{
		return 0;
	}
	if(!zm_utility::is_player_valid(player, 1, 1))
	{
		return 0;
	}
	if(self zm_laststand::is_reviving_any())
	{
		return 0;
	}
	if(player zm_laststand::is_reviving_any())
	{
		return 0;
	}
	if(isdefined(level.var_5846226d) && player.score + 5 < level.var_5846226d)
	{
		return 0;
	}
	if(Distance(self.origin, player.origin) > 50)
	{
		return 0;
	}
	if(Distance(self.origin, player.origin) < 50)
	{
		if(self function_3eadbeb5(player))
		{
			return 4;
		}
		if(!self function_b6bc944e() || !player function_b6bc944e())
		{
			return 5;
		}
		return 1;
	}
	return 0;
}

/*
	Name: function_b6bc944e
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x21658
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 9983
*/
function function_b6bc944e()
{
	weapon = self GetCurrentWeapon().rootweapon;
	if(weapon.inventoryType != "primary")
	{
		return 0;
	}
	if(IsSubStr(weapon.name, "katana") || IsSubStr(weapon.name, "launcher_warmachinemp") || IsSubStr(weapon.name, "micromissile_launcher") || IsSubStr(weapon.name, "sniper_chargeshot") || IsSubStr(weapon.name, "melee_satellite") || IsSubStr(weapon.name, "spike_launcher") || IsSubStr(weapon.name, "elmg_tempset") || IsSubStr(weapon.name, "pistol_burst") || IsSubStr(weapon.name, "lmg_death__machine"))
	{
		return 1;
	}
	if(zm_weapons::is_weapon_upgraded(weapon) && zm_weapons::get_base_weapon(weapon) != weapon)
	{
		return 1;
	}
	if(isdefined(level.start_weapon) && weapon == level.start_weapon)
	{
		return 1;
	}
	if(zm_weapons::is_wallbuy(weapon))
	{
		return 1;
	}
	if(zm_weapons::get_is_in_box(weapon))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_3eadbeb5
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x218C0
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 10023
*/
function function_3eadbeb5(player)
{
	var_8aa57db7 = self GetCurrentWeapon().rootweapon;
	var_e3c5a702 = player GetCurrentWeapon().rootweapon;
	if(player function_839fb8b(var_8aa57db7))
	{
		if(self function_839fb8b(var_e3c5a702))
		{
			self clientfield::set_player_uimodel("hudItems.aaeWeapTradeBool", 4);
		}
		else
		{
			self clientfield::set_player_uimodel("hudItems.aaeWeapTradeBool", 4);
			player clientfield::set_player_uimodel("hudItems.aaeWeapTradeBool", 4);
		}
		return 1;
	}
	if(self function_839fb8b(var_e3c5a702))
	{
		self clientfield::set_player_uimodel("hudItems.aaeWeapTradeBool", 4);
		return 1;
	}
	return 0;
}

/*
	Name: function_839fb8b
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x21A10
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 10058
*/
function function_839fb8b(weapon)
{
	foreach(gun in self GetWeaponsList(1))
	{
		if(gun.rootweapon == weapon)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_9cecefed
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x21AC8
	Size: 0x150
	Parameters: 1
	Flags: None
	Line Number: 10080
*/
function function_9cecefed(trig)
{
	if(Distance2D(self.origin, trig.origin) > 50)
	{
		return 0;
	}
	angles = VectorToAngles(trig.origin + VectorScale((0, 0, 1), 50) - self.origin);
	var_6c47b888 = angles[1];
	var_aa154d0 = self.angles[1];
	if(var_6c47b888 > 180)
	{
		var_6c47b888 = var_6c47b888 - 360;
	}
	looking = var_aa154d0 - var_6c47b888;
	if(looking > 340)
	{
		looking = looking - 360;
	}
	if(looking < -340)
	{
		looking = looking + 360;
	}
	if(looking > -35 && looking < 35)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_4f5c1608
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x21C20
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 10119
*/
function function_4f5c1608(text)
{
	if(isdefined(self.var_4f5c1608))
	{
		self.var_4f5c1608 setText(text);
		return;
	}
	self.var_4f5c1608 = create_simple_hud(self);
	self.var_4f5c1608.horzAlign = "center";
	self.var_4f5c1608.vertAlign = "middle";
	self.var_4f5c1608.alignX = "center";
	self.var_4f5c1608.alignY = "middle";
	self.var_4f5c1608.y = self function_2f39f170();
	self.var_4f5c1608.fontscale = self function_a618a461();
	self.var_4f5c1608.font = "small";
	self.var_4f5c1608.alpha = 0.9;
	self.var_4f5c1608.color = (1, 1, 1);
	self.var_4f5c1608 setText(text);
	return;
}

/*
	Name: function_a618a461
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x21D90
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 10150
*/
function function_a618a461()
{
	if(self IsSplitscreen())
	{
		return 1;
	}
	else
	{
		return 1.3;
	}
}

/*
	Name: function_2f39f170
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x21DC8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 10172
*/
function function_2f39f170()
{
	if(self IsSplitscreen())
	{
		return 70;
	}
	else
	{
		return 150;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5fd7495d
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x21E00
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 10196
*/
function function_5fd7495d(weapon)
{
	if(IsString(weapon))
	{
		return GetWeapon(weapon);
	}
	else
	{
		return weapon;
	}
}

/*
	Name: weaponClass
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x21E50
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 10218
*/
function weaponClass(weapon)
{
	return util::getWeaponClass(function_5fd7495d(weapon));
}

/*
	Name: create_simple_hud
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x21E90
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 10233
*/
function create_simple_hud(player)
{
	if(!isdefined(player))
	{
		player = level;
	}
	return newClientHudElem(player);
}

/*
	Name: function_92dc25bf
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x21ED0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 10252
*/
function function_92dc25bf()
{
	return GetAISpeciesArray("axis", "all");
	waittillframeend;
}

/*
	Name: function_ead67cbb
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x21F00
	Size: 0x518
	Parameters: 13
	Flags: None
	Line Number: 10268
*/
function function_ead67cbb(death, inflictor, player, damage, flags, mod, weapon, vPoint, vDir, HIT_LOCATION, psOffsetTime, boneIndex, surfaceType)
{
	if(isdefined(death) && death && !isdefined(self.var_793e3c8b) && isPlayer(player) && self.team === level.zombie_team)
	{
		var_7641c35c = "";
		aitype = self function_e158cee1() + "_";
		if(aitype == "_")
		{
			aitype = "z_";
		}
		if(self.maxhealth <= self.health && self.maxhealth <= damage || (player zm_powerups::is_insta_kill_active() && isdefined(self.archetype) && self.archetype == "zombie"))
		{
			var_7641c35c = "_c";
		}
		else
		{
			var_7641c35c = "";
		}
		if(IsSubStr(player GetCurrentWeapon().name, "thundergun"))
		{
			var_7641c35c = "_c";
		}
		if(mod != "MOD_MELEE" && (IsSubStr(player GetCurrentWeapon().name, "ray_gun") || IsSubStr(player GetCurrentWeapon().name, "raygun")))
		{
			namespace_22b67853::function_f105c5b1(aitype + "kill" + var_7641c35c, player, zm_score::get_zombie_death_player_points());
			return;
		}
		if(mod == "MOD_MELEE")
		{
			namespace_22b67853::function_f105c5b1(aitype + "melee_kill" + var_7641c35c, player, zm_score::get_zombie_death_player_points() + level.zombie_vars["zombie_score_bonus_melee"]);
			return;
		}
		if(mod == "MOD_GRENADE_SPLASH" || mod == "MOD_PROJECTILE_SPLASH" || mod == "MOD_PROJECTILE")
		{
			namespace_22b67853::function_f105c5b1(aitype + "exp_kill" + var_7641c35c, player, zm_score::get_zombie_death_player_points());
			return;
		}
		if(mod != "MOD_MELEE")
		{
			if("head" == HIT_LOCATION || "helmet" == HIT_LOCATION)
			{
				if(player namespace_7003346::function_d441def1())
				{
					namespace_22b67853::function_f105c5b1("sniper_kill" + var_7641c35c, player, zm_score::get_zombie_death_player_points() + level.zombie_vars["zombie_score_bonus_head"]);
				}
				else
				{
					namespace_22b67853::function_f105c5b1(aitype + "headshot" + var_7641c35c, player, zm_score::get_zombie_death_player_points() + level.zombie_vars["zombie_score_bonus_head"]);
				}
			}
			else
			{
				score = zm_score::get_zombie_death_player_points();
				if("neck" == HIT_LOCATION)
				{
					score = score + level.zombie_vars["zombie_score_bonus_neck"];
				}
				if("torso_lower" == HIT_LOCATION || "torso_upper" == HIT_LOCATION)
				{
					score = score + level.zombie_vars["zombie_score_bonus_torso"];
				}
				namespace_22b67853::function_f105c5b1(aitype + "kill" + var_7641c35c, player, score);
			}
		}
		self.var_793e3c8b = 1;
	}
}

/*
	Name: function_e158cee1
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x22420
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 10346
*/
function function_e158cee1()
{
	if(isdefined(self.model))
	{
		if(IsSubStr(self.model, "warden"))
		{
			return "warden";
		}
		if(IsSubStr(self.model, "brutus"))
		{
			return "warden";
		}
		if(IsSubStr(self.model, "keeper"))
		{
			return "keeper";
		}
	}
	if(isdefined(self.animName))
	{
		if(self.animName == "napalm_zombie" || self.animName == "sonic_zombie")
		{
			return self.animName;
		}
	}
	if(isdefined(self.str_name))
	{
		return self.str_name;
	}
	else if(isdefined(self.archetype))
	{
		archetype = [];
		archetype["zombie_dog"] = 1;
		archetype["thrasher"] = 1;
		archetype["zombie_quad"] = 1;
		archetype["apothicon_fury"] = 1;
		archetype["mechz"] = 1;
		archetype["margwa"] = 1;
		archetype["raz"] = 1;
		archetype["spider"] = 1;
		archetype["parasite"] = 1;
		archetype["raps"] = 1;
		if(isdefined(archetype[self.archetype]))
		{
			return self.archetype;
		}
	}
	return "";
}

/*
	Name: function_6721f8c8
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x22628
	Size: 0x2F8
	Parameters: 0
	Flags: None
	Line Number: 10405
*/
function function_6721f8c8()
{
	if(!self IsTestClient() && level.script != "zm_tomb" && level.script != "zm_theater" && level.script != "zm_asylum")
	{
		var_8d69b586 = 1.2;
		cam_height = 2000;
		player_origin = self GetPlayerCameraPos() + AnglesToForward(self.angles) * 20;
		cam = spawn("script_model", VectorScale((1, 1, 1), 69));
		cam SetModel("tag_origin");
		cam.origin = player_origin + (0, 0, cam_height);
		cam.angles = self.angles;
		cam.angles = (cam.angles[0] + 89, cam.angles[1], 0);
		self CameraSetPosition(cam);
		self CameraSetLookAt();
		self CameraActivate(1);
		cam moveto(player_origin + (0, 0, 0), var_8d69b586, 0, var_8d69b586);
		wait(0.05);
		wait(var_8d69b586 - 0.55);
		self thread LUI::screen_fade(0.25, 1, 0, "white", 0);
		cam RotateTo((cam.angles[0] - 89, cam.angles[1], 0), 0.5, 0.3, 0.2);
		wait(0.2);
		self thread LUI::screen_fade(1.1, 0, 1, "white", 0);
		wait(0.25);
		self CameraActivate(0);
		cam delete();
	}
}

/*
	Name: function_7d83ef11
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x22928
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 10443
*/
function function_7d83ef11(TakeAllWeapons, alreadySpawned)
{
	if(!GetDvarInt("tfoption_gungame"))
	{
		self function_fa30d26();
	}
	else
	{
		self zm_weapons::give_build_kit_weapon(level.weaponBaseMelee);
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_fa30d26
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x22998
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 10467
*/
function function_fa30d26()
{
	if(self IsTestClient())
	{
		self zm_weapons::give_build_kit_weapon(level.weaponBaseMelee);
		self zm_weapons::give_build_kit_weapon(level.start_weapon);
		self setSpawnWeapon(self getweaponslistprimaries()[0]);
	}
	else
	{
		self function_b0308ee1();
		var_aa566f49 = self zm_utility::get_player_melee_weapon();
		if(var_aa566f49 == level.weaponNone || var_aa566f49 == level.weaponBaseMelee)
		{
			self function_c39636f5();
		}
		else if(!self hasweapon(var_aa566f49))
		{
			if(zm_utility::is_melee_weapon(var_aa566f49))
			{
				self zm_weapons::weapon_give(var_aa566f49, 0, 0, 1, 0);
			}
		}
	}
}

/*
	Name: function_c39636f5
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x22AF8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 10503
*/
function function_c39636f5()
{
	if(level.weaponBaseMelee.name == "misc_knife")
	{
		self zm_weapons::give_build_kit_weapon(GetWeapon("knife"));
		self zm_utility::set_player_melee_weapon(GetWeapon("knife"));
	}
	else
	{
		self zm_weapons::give_build_kit_weapon(level.weaponBaseMelee);
		self zm_utility::set_player_melee_weapon(level.weaponBaseMelee);
	}
}

/*
	Name: function_f56a5552
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x22BB8
	Size: 0x2D0
	Parameters: 0
	Flags: None
	Line Number: 10527
*/
function function_f56a5552()
{
	weapon = GetWeapon("lmg_cqb");
	keys = getArrayKeys(level.zombie_weapons);
	keys = Array::randomize(keys);
	weapon = level.start_weapon;
	for(i = 0; i < keys.size; i++)
	{
		if(keys[i].isMeleeWeapon || keys[i].isgrenadeweapon || keys[i].isHeroWeapon || keys[i].isgadget || zm_weapons::is_wonder_weapon(keys[i]) || keys[i].isRiotShield || level.start_weapon == keys[i] || keys[i] == level.weaponNone || keys[i] == level.weaponBaseMelee || zm_weapons::get_is_in_box(keys[i]) != 1 || IsSubStr(keys[i].name, "knife") || IsSubStr(keys[i].name, "melee") || keys[i].isFlourishWeapon || zm_utility::is_melee_weapon(keys[i]) || zm_utility::is_placeable_mine(keys[i]) || zm_utility::is_lethal_grenade(keys[i]) || keys[i].inventoryType != "primary" || zm_utility::is_tactical_grenade(keys[i]))
		{
			continue;
		}
		return keys[i];
	}
	return weapon;
}

/*
	Name: function_f9a5da67
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x22E90
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 10554
*/
function function_f9a5da67()
{
	while(GetDvarString("lua_iprintbold") != "")
	{
		IPrintLnBold(GetDvarString("lua_iprintbold"));
		SetDvar("lua_iprintbold", "");
		wait(0.048);
	}
}

/*
	Name: tomb_custom_player_track_ammo_count
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x22F18
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 10574
*/
function tomb_custom_player_track_ammo_count()
{
	self notify("stop_ammo_tracking");
	self endon("disconnect");
	self endon("death");
	self endon("stop_ammo_tracking");
	ammoLowCount = 0;
	ammoOutCount = 0;
	for(;;)
	{
		wait(0.5);
		weap = self GetCurrentWeapon();
		if(weap == level.weaponNone || self IsSwitchingWeapons() || self IsReloading() || !tomb_can_track_ammo_custom(weap))
		{
		}
		else if(self getammocount(weap) > 5 || self laststand::player_is_in_laststand())
		{
			ammoOutCount = 0;
			ammoLowCount = 0;
		}
		else
		{
			wait(0.5);
			if(self getammocount(weap) > 0)
			{
				if(ammoLowCount < 1)
				{
					self zm_audio::create_and_play_dialog("general", "ammo_low");
					ammoLowCount++;
				}
			}
			else if(ammoOutCount < 1)
			{
				self zm_audio::create_and_play_dialog("general", "ammo_out");
				ammoOutCount++;
			}
			wait(20);
		}
	}
}

/*
	Name: tomb_can_track_ammo_custom
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x230F8
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 10625
*/
function tomb_can_track_ammo_custom(weap)
{
	if(weap.inventoryType != "primary" || (isdefined(weap.skiplowammovox) && weap.skiplowammovox) || (isdefined(weap.unlimitedammo) && weap.unlimitedammo) || (isdefined(weap.type) && weap.type == "melee"))
	{
		return 0;
	}
	return zm_weapons::is_weapon_included(weap);
}

/*
	Name: function_33d06095
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x231C0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 10644
*/
function function_33d06095()
{
	modvar("3dobj", "");
	for(;;)
	{
		wait(0.05);
		if(GetDvarString("3dobj") != "")
		{
			thread function_82b8e134();
			SetDvar("3dobj", "");
		}
	}
}

/*
	Name: onUse
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x23250
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 10668
*/
function onUse(e_player)
{
	var_8ea4a872 = e_player GetWeaponsList();
	foreach(w_weapon in var_8ea4a872)
	{
		e_player giveMaxAmmo(w_weapon);
		e_player SetWeaponAmmoClip(w_weapon, w_weapon.clipSize);
	}
}

/*
	Name: onEndUse
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x23340
	Size: 0x20
	Parameters: 3
	Flags: None
	Line Number: 10688
*/
function onEndUse(team, e_player, b_result)
{
}

/*
	Name: onBeginUse
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x23368
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 10702
*/
function onBeginUse(e_player)
{
}

/*
	Name: canInteractWithPlayer
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x23380
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 10716
*/
function canInteractWithPlayer(e_player)
{
	var_f329927f = (Int(self.origin[0]), Int(self.origin[1]), Int(self.origin[2]));
	result = util::within_fov(e_player GetEye(), e_player getPlayerAngles(), var_f329927f, cos(60));
	return Distance(e_player.origin, var_f329927f) <= 39 && result;
}

/*
	Name: function_82b8e134
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x23498
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 10733
*/
function function_82b8e134()
{
	function_35dd0243(GetPlayers()[0].origin + VectorScale((0, 0, 1), 40));
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_35dd0243
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x234E8
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 10750
*/
function function_35dd0243(origin)
{
	t_use = spawn("trigger_radius_use", origin, 0, 80, 80);
	t_use TriggerIgnoreTeam();
	t_use setvisibletoall();
	t_use SetTeamForTrigger("none");
	t_use setcursorhint("HINT_INTERACTIVE_PROMPT");
	t_use EnableLinkTo();
	var_988e928 = gameobjects::create_use_object("any", t_use, [], (0, 0, 0), &"aaethreed_test", 0, 1);
	var_988e928 gameobjects::allow_use("any");
	var_988e928 gameobjects::set_owner_team("allies");
	var_988e928 gameobjects::set_visible_team("any");
	var_988e928.onUse = &onUse;
	var_988e928.dontLinkPlayerToTrigger = 1;
	var_988e928 gameobjects::set_use_time(1);
	var_988e928.onBeginUse = &onBeginUse;
	var_988e928.onEndUse = &onEndUse;
	var_988e928.canInteractWithPlayer = &canInteractWithPlayer;
	var_988e928.var_db0f901 = 1;
}

/*
	Name: function_ac421bbc
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x236F8
	Size: 0xD0
	Parameters: 2
	Flags: None
	Line Number: 10781
*/
function function_ac421bbc(objective, trigger)
{
	if(isdefined(objective) && isdefined(trigger))
	{
		if(IsEntity(trigger))
		{
			if(trigger.classname == "trigger_radius_use")
			{
				trigger setHintString("");
				objId = gameobjects::get_next_obj_id();
				objective_add(objId, "active", trigger.origin, objective, trigger);
				return trigger;
			}
		}
	}
}

/*
	Name: function_febe9a8f
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x237D0
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 10808
*/
function function_febe9a8f()
{
	level endon("end_game");
	level thread wait_for_end_game();
	level flag::wait_till("initial_blackscreen_passed");
	SetDvar("developer", 1);
	SetDvar("scr_mod_enable_devblock", 1);
	SetDvar("ai_showNavMesh", 1);
	SetDvar("tracer_debugDraw", 1);
	SetDvar("ai_showNavMeshSilhouettes", 1);
	SetDvar("g_bDebugRenderEntityBrushes", 1);
	var_77bd86b1 = NewHudElem();
	var_77bd86b1.alignX = "center";
	var_77bd86b1.alignY = "top";
	var_77bd86b1.horzAlign = "center";
	var_77bd86b1.vertAlign = "top";
	var_77bd86b1.x = 0;
	var_77bd86b1.y = 20;
	var_77bd86b1.fontscale = 1.5;
	var_77bd86b1.alpha = 1;
	var_77bd86b1.color = (1, 1, 1);
	var_77bd86b1.hidewheninmenu = 1;
	var_77bd86b1.foreground = 1;
	var_77bd86b1.label = &"Entity Count:";
	for(;;)
	{
		var_815e8d67 = GetEntArray();
		function_e3312300(var_815e8d67, var_77bd86b1);
		util::wait_network_frame(1);
	}
}

/*
	Name: wait_for_end_game
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x23A38
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 10850
*/
function wait_for_end_game()
{
	level waittill("end_game");
	SetDvar("developer", 0);
	SetDvar("scr_mod_enable_devblock", 0);
	SetDvar("ai_showNavMesh", 0);
	SetDvar("tracer_debugDraw", 0);
	SetDvar("ai_showNavMeshSilhouettes", 0);
	return;
}

/*
	Name: function_10078913
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x23AD0
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 10871
*/
function function_10078913(origin)
{
	player_distance = 640000;
	foreach(player in level.activePlayers)
	{
		if(DistanceSquared(origin, player GetPlayerCameraPos()) <= player_distance)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_56e738fb
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x23BA8
	Size: 0x188
	Parameters: 1
	Flags: Private
	Line Number: 10894
*/
function private function_56e738fb(var_815e8d67)
{
	foreach(ent in var_815e8d67)
	{
		if(isdefined(ent) && isdefined(ent.classname) && ent.classname == "player")
		{
			continue;
		}
		var_e956b35b = ent function_779c037c();
		if(var_e956b35b["is_trigger"])
		{
			var_65c84022[var_65c84022.size] = ent;
		}
		if(isdefined(ent) && isdefined(ent.origin) && !function_10078913(ent.origin))
		{
			continue;
		}
		var_ec77f0c1 = ent function_77c2d4e(var_e956b35b);
		function_11821a27(ent, var_ec77f0c1);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_21611ece
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x23D38
	Size: 0x138
	Parameters: 0
	Flags: Private
	Line Number: 10928
*/
function private function_21611ece()
{
	foreach(var_c22e0564 in level.struct)
	{
		if(isdefined(var_c22e0564) && isdefined(var_c22e0564.origin) && !function_10078913(var_c22e0564.origin))
		{
			continue;
		}
		var_e956b35b = var_c22e0564 function_779c037c("struct");
		var_ec77f0c1 = var_c22e0564 function_77c2d4e(var_e956b35b, "struct");
		function_11821a27(var_c22e0564, var_ec77f0c1, 16);
	}
}

/*
	Name: function_63e44dab
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x23E78
	Size: 0x140
	Parameters: 0
	Flags: Private
	Line Number: 10952
*/
function private function_63e44dab()
{
	foreach(var_9bc55c19 in level._unitriggers.trigger_stubs)
	{
		if(isdefined(var_9bc55c19) && isdefined(var_9bc55c19.origin) && !function_10078913(var_9bc55c19.origin))
		{
			continue;
		}
		var_e956b35b = var_9bc55c19 function_779c037c("unitrigger");
		var_ec77f0c1 = var_9bc55c19 function_77c2d4e(var_e956b35b, var_9bc55c19.script_unitrigger_type);
		function_11821a27(var_9bc55c19, var_ec77f0c1, 30);
	}
}

/*
	Name: function_e3312300
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x23FC0
	Size: 0xA0
	Parameters: 2
	Flags: Private
	Line Number: 10976
*/
function private function_e3312300(var_815e8d67, var_77bd86b1)
{
	ent_num = var_815e8d67.size + level.struct.size + level._unitriggers.trigger_stubs.size;
	var_77bd86b1 setValue(ent_num);
	function_56e738fb(var_815e8d67);
	function_21611ece();
	function_63e44dab();
}

/*
	Name: function_779c037c
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x24068
	Size: 0x410
	Parameters: 1
	Flags: Private
	Line Number: 10995
*/
function private function_779c037c(special)
{
	var_e956b35b = [];
	var_e956b35b["group"] = "other";
	var_e956b35b["color"] = (1, 1, 1);
	var_e956b35b["force_classname"] = undefined;
	var_e956b35b["is_trigger"] = 0;
	if(isdefined(special))
	{
		switch(special)
		{
			case "struct":
			{
				var_e956b35b["group"] = "struct";
				var_e956b35b["color"] = VectorScale((1, 1, 1), 0.5);
				var_e956b35b["force_classname"] = "struct";
				return var_e956b35b;
			}
			case "unitrigger":
			{
				var_e956b35b["group"] = "unitrigger";
				var_e956b35b["color"] = VectorScale((1, 1, 1), 0.2);
				var_e956b35b["force_classname"] = "unitrigger";
				return var_e956b35b;
				break;
			}
			default
			{
			}
		}
	}
	var_ca6b3e0c = self getEntityType();
	switch(var_ca6b3e0c)
	{
		case 0:
		{
			var_e956b35b["group"] = "general";
			var_e956b35b["color"] = (1, 0, 1);
			break;
		}
		case 1:
		case 2:
		case 3:
		{
			var_e956b35b["group"] = "player";
			var_e956b35b["color"] = (0, 1, 1);
			break;
		}
		case 4:
		{
			var_e956b35b["group"] = "item";
			var_e956b35b["color"] = (0.54, 0.27, 0.07);
			break;
		}
		case 6:
		{
			var_e956b35b["group"] = "scriptmover";
			var_e956b35b["color"] = (1, 1, 0);
			break;
		}
		case 18:
		case 19:
		case 20:
		{
			var_e956b35b["group"] = "ai";
			var_e956b35b["color"] = (1, 0.5, 0);
			break;
		}
		case 22:
		{
			var_e956b35b["group"] = "zbarrier";
			var_e956b35b["color"] = VectorScale((1, 1, 0), 0.5);
			break;
		}
		case 23:
		{
			var_e956b35b["group"] = "trigger";
			var_e956b35b["color"] = (0, 1, 0);
			var_e956b35b["is_trigger"] = 1;
			break;
		}
		case 28:
		{
			var_e956b35b["group"] = "tempent";
			var_e956b35b["color"] = (1, 0, 0);
			var_e956b35b["force_classname"] = "TempSound";
			break;
		}
		case 119:
		{
			var_e956b35b["group"] = "tempent";
			var_e956b35b["color"] = (0, 0, 1);
			var_e956b35b["force_classname"] = "TempFX";
			break;
			break;
		}
		default
		{
		}
	}
	return var_e956b35b;
}

/*
	Name: function_77c2d4e
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x24480
	Size: 0x3C0
	Parameters: 2
	Flags: Private
	Line Number: 11108
*/
function private function_77c2d4e(var_e956b35b, var_ca8db838)
{
	if(!isdefined(var_ca8db838))
	{
		var_ca8db838 = self.classname;
	}
	var_d698cd64 = "sphere";
	debug_radius = 5;
	var_51651c19 = 1;
	switch(var_ca8db838)
	{
		case "script_brushmodel":
		case "script_model":
		case "script_origin":
		{
			var_d698cd64 = "box";
			break;
		}
		case "info_player_start":
		case "trigger_box":
		case "trigger_damage":
		case "trigger_multiple":
		case "trigger_use":
		case "trigger_use_touch":
		case "volume_litfog":
		case "volume_outdoor":
		case "volume_sun":
		case "volume_weathergrime":
		case "volume_worldfog":
		{
			var_d698cd64 = "box";
			break;
		}
		case "trigger_radius":
		case "trigger_radius_use":
		{
			if(isdefined(self.radius))
			{
				debug_radius = self.radius;
				break;
			}
		}
		case "info_volume":
		{
			var_d698cd64 = "box";
			break;
		}
		case "struct":
		{
			var_d698cd64 = "struct";
			break;
		}
		case "unitrigger_radius":
		case "unitrigger_radius_use":
		{
			var_d698cd64 = "sphere";
			debug_radius = 2;
			break;
		}
		case "unitrigger_box":
		case "unitrigger_box_use":
		{
			var_d698cd64 = "sphere";
			break;
			break;
		}
		default
		{
		}
	}
	if(isdefined(var_e956b35b["force_classname"]))
	{
		var_ca8db838 = var_e956b35b["force_classname"];
	}
	var_2b924a60 = [];
	if(isdefined(self.target))
	{
		var_c5cbe1ba = GetEntArray(self.target, "targetname");
		foreach(var_857d0275 in var_c5cbe1ba)
		{
			var_2b924a60[var_2b924a60.size] = var_857d0275;
		}
		var_feb35266 = get_array(self.target);
		foreach(var_eaed508d in var_feb35266)
		{
			var_2b924a60[var_2b924a60.size] = var_eaed508d;
		}
	}
	else if(var_2b924a60.size == 0)
	{
		var_2b924a60 = undefined;
	}
	return function_fb9a5452(var_ca8db838, var_e956b35b["color"], var_d698cd64, debug_radius, self function_94104bec(var_2b924a60), var_2b924a60, var_51651c19);
}

/*
	Name: function_11821a27
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x24848
	Size: 0x4F0
	Parameters: 3
	Flags: None
	Line Number: 11213
*/
function function_11821a27(ent, var_ec77f0c1, offset)
{
	if(!isdefined(offset))
	{
		offset = 0;
	}
	var_351da6cf = 2;
	if(IsEntity(ent) && ent ishidden())
	{
		/#
			print3d(ent.origin + VectorScale((0, 0, 1), 16 - offset), var_ec77f0c1[0] + "Dev Block strings are not supported", var_ec77f0c1[1], 1, 0.2, var_351da6cf);
		#/
	}
	else
	{
		print3d(ent.origin + VectorScale((0, 0, 1), 16 - offset), var_ec77f0c1[0], var_ec77f0c1[1], 1, 0.2, var_351da6cf);
	}
	/#
	#/
	if(isdefined(var_ec77f0c1[4]) && var_ec77f0c1[4].size)
	{
		var_caa81fec = "";
		for(i = 0; i < var_ec77f0c1[4].size; i++)
		{
			var_699797a2 = var_ec77f0c1[4][i];
			/#
				print3d(ent.origin + VectorScale((0, 0, 1), 13 - offset), var_caa81fec + var_699797a2, VectorScale((1, 1, 1), 0.3), 1, 0.1, var_351da6cf);
			#/
			var_caa81fec = var_caa81fec + "\n";
		}
	}
	switch(var_ec77f0c1[2])
	{
		case "sphere":
		{
			/#
				sphere(ent.origin, var_ec77f0c1[3], var_ec77f0c1[1], 0.05, 1, function_3ed31fe8(var_ec77f0c1[3]), var_351da6cf);
				break;
			#/
		}
		case "box":
		{
			/#
				box(ent.origin, ent GetMins(), ent GetMaxs(), ent.angles[1], var_ec77f0c1[1], 0.25, 1, var_351da6cf);
				break;
			#/
		}
		case "struct":
		{
			/#
				box(ent.origin, VectorScale((-1, -1, -1), 5), VectorScale((1, 1, 1), 5), 0, var_ec77f0c1[1], 0.25, 1, var_351da6cf);
				break;
			#/
		}
		default
		{
			/#
				sphere(ent.origin, var_ec77f0c1[3], var_ec77f0c1[1], 0.05, 1, function_3ed31fe8(var_ec77f0c1[3]), var_351da6cf);
				break;
			#/
		}
	}
	if(var_ec77f0c1[6] && isdefined(var_ec77f0c1[5]))
	{
		foreach(targ in var_ec77f0c1[5])
		{
			if(isdefined(targ.origin))
			{
				/#
					line(ent.origin + (0, 0, 1), targ.origin, var_ec77f0c1[1], 1, 1, var_351da6cf);
				#/
			}
		}
	}
}

/*
	Name: function_3ed31fe8
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x24D40
	Size: 0x48
	Parameters: 1
	Flags: Private
	Line Number: 11299
*/
function private function_3ed31fe8(i)
{
	return Int(10 * 1 + Int(i) % 100);
}

/*
	Name: function_fb9a5452
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x24D90
	Size: 0x120
	Parameters: 7
	Flags: Private
	Line Number: 11314
*/
function private function_fb9a5452(var_41e2b5bf, var_8d7c4444, var_d60ce82e, var_46583d5, var_fb88b5ef, ent_targets, var_777ee430)
{
	if(!isdefined(var_8d7c4444))
	{
		var_8d7c4444 = (1, 1, 1);
	}
	if(!isdefined(var_d60ce82e))
	{
		var_d60ce82e = "sphere";
	}
	if(!isdefined(var_46583d5))
	{
		var_46583d5 = 5;
	}
	if(!isdefined(var_777ee430))
	{
		var_46583d5 = 1;
	}
	var_ec77f0c1 = [];
	var_ec77f0c1[0] = var_41e2b5bf + "";
	var_ec77f0c1[1] = var_8d7c4444;
	var_ec77f0c1[2] = var_d60ce82e;
	var_ec77f0c1[3] = var_46583d5;
	var_ec77f0c1[4] = var_fb88b5ef;
	var_ec77f0c1[5] = ent_targets;
	var_ec77f0c1[6] = var_777ee430;
	return var_ec77f0c1;
}

/*
	Name: get_array
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x24EB8
	Size: 0x58
	Parameters: 2
	Flags: Private
	Line Number: 11353
*/
function private get_array(kvp_value, kvp_key)
{
	if(isdefined(level.struct_class_names[kvp_key][kvp_value]))
	{
		return ArrayCopy(level.struct_class_names[kvp_key][kvp_value]);
	}
	return [];
	ERROR: Bad function call
}

/*
	Name: function_94104bec
	Namespace: Motherfucker
	Checksum: 0x424F4353
	Offset: 0x24F18
	Size: 0x5C6
	Parameters: 1
	Flags: Private
	Line Number: 11373
*/
function private function_94104bec(var_2b924a60)
{
	Subtitle = [];
	if(isdefined(self.pers) && IsArray(self.pers))
	{
		var_d288ed65 = getArrayKeys(self.pers);
		for(i = 0; i < var_d288ed65.size; i++)
		{
			if(isdefined(self.pers[var_d288ed65[i]]))
			{
				if(IsFunctionPtr(self.pers[var_d288ed65[i]]))
				{
					Subtitle[Subtitle.size] = "self.pers[" + var_d288ed65[i] + "]: &FunctionPtr";
					continue;
				}
				Subtitle[Subtitle.size] = "self.pers[" + var_d288ed65[i] + "]: " + self.pers[var_d288ed65[i]];
			}
		}
	}
	else if(isdefined(self.zombie_cost))
	{
		Subtitle[Subtitle.size] = "zombie_cost: " + self.zombie_cost;
	}
	if(isdefined(self.cursorhint) && self.cursorhint != "")
	{
		Subtitle[Subtitle.size] = "cursorhint: " + self.cursorhint;
	}
	if(isdefined(self.hintString) && self.hintString != "")
	{
		Subtitle[Subtitle.size] = "hintstring: " + self.hintString;
	}
	if(isdefined(self.script_int))
	{
		Subtitle[Subtitle.size] = "script_int: " + self.script_int;
	}
	if(isdefined(self.script_sound))
	{
		Subtitle[Subtitle.size] = "script_sound: " + self.script_sound;
	}
	if(isdefined(self.script_parameters))
	{
		Subtitle[Subtitle.size] = "script_parameters: " + self.script_parameters;
	}
	if(isdefined(self.script_team))
	{
		Subtitle[Subtitle.size] = "script_team: " + self.script_team;
	}
	if(isdefined(self.script_hint))
	{
		Subtitle[Subtitle.size] = "script_hint: " + self.script_hint;
	}
	if(isdefined(self.script_vector))
	{
		Subtitle[Subtitle.size] = "script_vector: " + self.script_vector;
	}
	if(isdefined(self.script_width))
	{
		Subtitle[Subtitle.size] = "script_width: " + self.script_width;
	}
	if(isdefined(self.script_label))
	{
		Subtitle[Subtitle.size] = "script_label: " + self.script_label;
	}
	if(isdefined(self.script_string))
	{
		Subtitle[Subtitle.size] = "script_string: " + self.script_string;
	}
	if(isdefined(self.script_angles))
	{
		Subtitle[Subtitle.size] = "script_angles: " + self.script_angles;
	}
	if(isdefined(self.type))
	{
		Subtitle[Subtitle.size] = "type: " + self.type;
	}
	if(isdefined(self.script_float))
	{
		Subtitle[Subtitle.size] = "script_float: " + self.script_float;
	}
	if(isdefined(self.model) && self.model != "")
	{
		Subtitle[Subtitle.size] = "model: " + self.model;
	}
	if(isdefined(self.target))
	{
		if(isdefined(var_2b924a60))
		{
			Subtitle[Subtitle.size] = "target: " + self.target + " { " + var_2b924a60.size + " }";
		}
		else
		{
			Subtitle[Subtitle.size] = "target: " + self.target;
		}
	}
	if(isdefined(self.targetname))
	{
		Subtitle[Subtitle.size] = "targetname: " + self.targetname;
	}
	if(isdefined(self.script_noteworthy))
	{
		Subtitle[Subtitle.size] = "script_noteworthy: " + self.script_noteworthy;
	}
	if(isdefined(self.origin))
	{
		Subtitle[Subtitle.size] = "origin: " + self.origin;
	}
	if(isdefined(self.angles))
	{
		Subtitle[Subtitle.size] = "angles: " + self.angles;
	}
	if(isdefined(self.radius))
	{
		Subtitle[Subtitle.size] = "radius: " + self.radius;
	}
	if(isdefined(self.ent_num))
	{
		Subtitle[Subtitle.size] = "ent_num: " + self.ent_num;
	}
	return Subtitle;
}

