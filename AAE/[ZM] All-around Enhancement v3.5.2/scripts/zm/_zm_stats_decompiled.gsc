#include scripts\codescripts\struct;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_weapons;
#include scripts\zm\aae_left_ges;
#include scripts\zm\gametypes\_globallogic;
#include scripts\zm\gametypes\_globallogic_score;
#include scripts\zm\zmsavedata;

#namespace zm_stats;

/*
	Name: __init__sytem__
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x628
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("zm_stats", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x668
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function __init__()
{
	level.player_stats_init = &player_stats_init;
	level.add_client_stat = &add_client_stat;
	level.increment_client_stat = &increment_client_stat;
	thread function_d35de174();
}

/*
	Name: function_d35de174
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x6D0
	Size: 0x340
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function function_d35de174()
{
	level.var_d35de174 = [];
	level.var_d35de174["downs"] = 10;
	level.var_d35de174["revives"] = 11;
	level.var_d35de174["deaths"] = 14;
	level.var_d35de174["zdogs_killed"] = 15;
	level.var_d35de174["zraps_killed"] = 16;
	level.var_d35de174["zwasp_killed"] = 17;
	level.var_d35de174["buildables_built"] = 18;
	level.var_d35de174["doors_purchased"] = 19;
	level.var_d35de174["boards"] = 20;
	level.var_d35de174["failed_sacrifices"] = 21;
	level.var_d35de174["sacrifices"] = 22;
	level.var_d35de174["use_magicbox"] = 23;
	level.var_d35de174["grabbed_from_magicbox"] = 24;
	level.var_d35de174["use_pap"] = 25;
	level.var_d35de174["pap_weapon_grabbed"] = 26;
	level.var_d35de174["pap_weapon_not_grabbed"] = 27;
	level.var_d35de174["use_perk_random"] = 28;
	level.var_d35de174["grabbed_from_perk_random"] = 29;
	level.var_d35de174["drops"] = 30;
	level.var_d35de174["grenade_kills"] = 31;
	level.var_d35de174["melee_kills"] = 32;
	level.var_d35de174["wallbuy_weapons_purchased"] = 33;
	level.var_d35de174["upgraded_ammo_purchased"] = 34;
	level.var_d35de174["ammo_purchased"] = 35;
	level.var_d35de174["SURVIVALIST_BUY_PERK"] = 36;
	level.var_d35de174["bouncingbetty_planted"] = 37;
	level.var_d35de174["bouncingbetty_pickedup"] = 38;
	level.var_d35de174["carpenter_pickedup"] = 39;
	level.var_d35de174["double_points_pickedup"] = 40;
	level.var_d35de174["fire_sale_pickedup"] = 41;
	level.var_d35de174["full_ammo_pickedup"] = 42;
	level.var_d35de174["insta_kill_pickedup"] = 43;
	level.var_d35de174["nuke_pickedup"] = 44;
	level.var_d35de174["bgbs_chewed"] = 51;
}

/*
	Name: function_5923c4ca
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0xA18
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function function_5923c4ca()
{
	while(1)
	{
		level waittill("end_of_round");
		foreach(player in GetPlayers())
		{
			player function_fb09d7eb();
		}
	}
}

/*
	Name: function_fb09d7eb
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0xAD0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 127
*/
function function_fb09d7eb()
{
	self endon("disconnect");
	self namespace_11e193f1::function_2812fe55(46, self function_5135e0b8());
	self namespace_11e193f1::function_2812fe55(48, self function_a11dd942());
}

/*
	Name: player_stats_init
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0xB48
	Size: 0xF48
	Parameters: 0
	Flags: None
	Line Number: 144
*/
function player_stats_init()
{
	self globallogic_score::initPersStat("kills", 0);
	self globallogic_score::initPersStat("suicides", 0);
	self globallogic_score::initPersStat("downs", 0);
	self.downs = self globallogic_score::getPersStat("downs");
	self globallogic_score::initPersStat("revives", 0);
	self.revives = self globallogic_score::getPersStat("revives");
	self globallogic_score::initPersStat("perks_drank", 0);
	self globallogic_score::initPersStat("bgbs_chewed", 0);
	self globallogic_score::initPersStat("headshots", 0);
	self globallogic_score::initPersStat("melee_kills", 0);
	self globallogic_score::initPersStat("grenade_kills", 0);
	self globallogic_score::initPersStat("doors_purchased", 0);
	self globallogic_score::initPersStat("distance_traveled", 0);
	self.distance_traveled = self globallogic_score::getPersStat("distance_traveled");
	self globallogic_score::initPersStat("total_shots", 0);
	self.total_shots = self globallogic_score::getPersStat("total_shots");
	self globallogic_score::initPersStat("hits", 0);
	self.hits = self globallogic_score::getPersStat("hits");
	self globallogic_score::initPersStat("misses", 0);
	self.misses = self globallogic_score::getPersStat("misses");
	self globallogic_score::initPersStat("deaths", 0);
	self.deaths = self globallogic_score::getPersStat("deaths");
	self globallogic_score::initPersStat("boards", 0);
	self globallogic_score::initPersStat("failed_revives", 0);
	self globallogic_score::initPersStat("sacrifices", 0);
	self globallogic_score::initPersStat("failed_sacrifices", 0);
	self globallogic_score::initPersStat("drops", 0);
	self globallogic_score::initPersStat("nuke_pickedup", 0);
	self globallogic_score::initPersStat("insta_kill_pickedup", 0);
	self globallogic_score::initPersStat("full_ammo_pickedup", 0);
	self globallogic_score::initPersStat("double_points_pickedup", 0);
	self globallogic_score::initPersStat("carpenter_pickedup", 0);
	self globallogic_score::initPersStat("fire_sale_pickedup", 0);
	self globallogic_score::initPersStat("minigun_pickedup", 0);
	self globallogic_score::initPersStat("bonus_points_team_pickedup", 0);
	self globallogic_score::initPersStat("ww_grenade_pickedup", 0);
	self globallogic_score::initPersStat("use_magicbox", 0);
	self globallogic_score::initPersStat("grabbed_from_magicbox", 0);
	self globallogic_score::initPersStat("use_perk_random", 0);
	self globallogic_score::initPersStat("grabbed_from_perk_random", 0);
	self globallogic_score::initPersStat("use_pap", 0);
	self globallogic_score::initPersStat("pap_weapon_grabbed", 0);
	self globallogic_score::initPersStat("pap_weapon_not_grabbed", 0);
	self globallogic_score::initPersStat("bouncingbetty_planted", 0);
	self globallogic_score::initPersStat("bouncingbetty_pickedup", 0);
	self globallogic_score::initPersStat("ballistic_knives_pickedup", 0);
	self globallogic_score::initPersStat("wallbuy_weapons_purchased", 0);
	self globallogic_score::initPersStat("ammo_purchased", 0);
	self globallogic_score::initPersStat("upgraded_ammo_purchased", 0);
	self globallogic_score::initPersStat("power_turnedon", 0);
	self globallogic_score::initPersStat("power_turnedoff", 0);
	self globallogic_score::initPersStat("buildables_built", 0);
	self globallogic_score::initPersStat("time_played_total", 0);
	self globallogic_score::initPersStat("zdogs_killed", 0);
	self globallogic_score::initPersStat("zraps_killed", 0);
	self globallogic_score::initPersStat("zwasp_killed", 0);
	self globallogic_score::initPersStat("castle_tram_token_pickedup", 0);
	self globallogic_score::initPersStat("total_points", 0);
	self globallogic_score::initPersStat("rounds", 0);
	if(level.resetPlayerScoreEveryRound)
	{
		self.pers["score"] = 0;
	}
	startPoints = GetDvarInt("tfoption_starting_points");
	if(startPoints != 500 && startPoints > 1)
	{
		level.player_starting_points = startPoints;
	}
	self.pers["score"] = level.player_starting_points;
	self.score = self.pers["score"];
	self IncrementPlayerStat("score", self.score);
	self add_map_stat("score", self.score);
	self globallogic_score::initPersStat("zteam", 0);
	if(isdefined(level.level_specific_stats_init))
	{
		[[level.level_specific_stats_init]]();
	}
	if(!isdefined(self.stats_this_frame))
	{
		self.pers_upgrade_force_test = 1;
		self.stats_this_frame = [];
		self.pers_upgrades_awarded = [];
	}
	self globallogic_score::initPersStat("ZM_DAILY_CHALLENGE_INGAME_TIME", 1, 1);
	self add_global_stat("ZM_DAILY_CHALLENGE_GAMES_PLAYED", 1);
	if(GetDvarString("ui_mapname") == "3391299194")
	{
		self.total_headshots = 0;
		self.var_735cfde7 = 0;
		self.var_a45bb319 = 3;
		self.var_d25a1f0 = 0;
		self.var_9b55e8bb = 0;
		self.var_47973dea = 0;
		self.var_91188f64 = 0;
		self.var_ce6d7007 = 0;
		self.var_c79b75b4 = 0;
		self.var_a4d6363 = 9999;
		self.var_9f57c267 = 0;
		self.var_aa9154a4 = 0;
		self.var_89238b7e = 99;
		self.var_c1f27c5e = 0;
		self.var_8d45b207 = Array(16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16);
		self.var_cf4f6177 = Array(16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16);
		self.var_bc271a18 = Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		self.var_d00f0887 = Array(1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		self.var_8a727e82 = Array(16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16);
		self.var_e28f9e1e = 0;
		self.var_bf8e6a41 = Array(16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16);
		self.var_b09afede = Array(undefined, undefined, undefined);
		self.var_30bc1904 = Array(0, 0, 0);
		self.var_a5a01049 = Array(0, 0, 0);
		self.var_eba2d683 = undefined;
		self.var_3867805e = undefined;
		self.var_c8220e82 = "outside";
		self.var_8f92ebb1 = "none";
		self.var_ccd47000 = Array();
		self.player_died = 0;
		self.bleedout_time = 55;
		self.var_37d0799d = 63;
		self.var_3e7cc288 = 11;
		self.var_7183cac9 = 121;
		self.var_c9d0b6a9 = 0;
		self.var_e5bb866b = 0;
		self.var_d2e7e804 = 0;
		self.var_97e067dd = 0;
		self.var_885812de = 0;
		self.spawn_point = undefined;
		self.spawn_origin = (0, 0, 0);
		self.spawn_angles = (0, 0, 0);
		self.var_25a6694b = (0, 0, 0);
		self.var_f54a2d88 = Array(0, 0, 0, 0, 0, 0);
		self.var_4233406a = Array(0, 0, 0, 0);
		self.var_33434ae6 = 0;
		self.var_f9af2758 = 0;
		self.var_d2caab64 = 11;
		self.var_53a0ff10 = 0;
		self.var_22261ff4 = 0;
		self.var_37ff54e4 = 0;
		self.var_bb154cce = 0;
		self.var_5b199ff2 = 0;
		self.var_20da7214 = -1;
		self.var_a477405f = undefined;
		self.var_5c4fc0ab = 0;
		self.elevator_pos = undefined;
		self.var_1b16efee = 0;
		self.var_143a4285 = 0;
		self.var_e4ae5cb5 = 0;
		self.var_a8f29401 = 0;
		self.var_7551763c = 0;
		self.var_d953372d = 0;
		self.var_a27ee3d7 = 0;
		self.var_5f005d2e = 15;
		self.var_e6aa1011 = -1;
		self.var_60e88ef9 = undefined;
		self.var_bbfc247a = -1;
		self.var_6c7be90e = -1;
		self.var_c9a8d5f2 = 0;
		self.var_32bcee9a = 0;
		self.var_11edef56 = 0;
		self.var_82f063dc = undefined;
		self.var_8e021987 = 0;
		self.var_8fc9cb0d = undefined;
		self.var_5568c88a = 0;
		self.var_4329df7d = undefined;
		self.var_692c59e6 = undefined;
		self.var_8f2ed44f = undefined;
	}
	else
	{
		self.var_f191a1fc = 0;
		self globallogic_score::initPersStat("meat_stink_pickedup", 0);
		self globallogic_score::initPersStat("bgb_tokens_gained_this_game", 0);
	}
}

/*
	Name: update_players_stats_at_match_end
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1A98
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 331
*/
function update_players_stats_at_match_end(players)
{
}

/*
	Name: update_playing_utc_time
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1AB0
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 345
*/
function update_playing_utc_time(matchEndUTCTime)
{
}

/*
	Name: survival_classic_custom_stat_update
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1AC8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 359
*/
function survival_classic_custom_stat_update()
{
}

/*
	Name: grief_custom_stat_update
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1AD8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 373
*/
function grief_custom_stat_update()
{
}

/*
	Name: get_global_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1AE8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 387
*/
function get_global_stat(stat_name)
{
	if(IsSubStr(stat_name, "DARKOPS"))
	{
		return 0;
	}
	return self GetDStat("PlayerStatsList", stat_name, "StatValue");
}

/*
	Name: set_global_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1B50
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 406
*/
function set_global_stat(stat_name, value)
{
	if(isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats)
	{
		return;
	}
	self SetDStat("PlayerStatsList", stat_name, "StatValue", value);
}

/*
	Name: add_global_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1BB8
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 425
*/
function add_global_stat(stat_name, value)
{
	if(isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats)
	{
		return;
	}
	self AddDStat("PlayerStatsList", stat_name, "StatValue", value);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: increment_global_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1C20
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 446
*/
function increment_global_stat(stat_name)
{
	if(isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats)
	{
		return;
	}
	self AddDStat("PlayerStatsList", stat_name, "StatValue", 1);
}

/*
	Name: highwater_global_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1C80
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 465
*/
function highwater_global_stat(stat_name, value)
{
	if(value > get_global_stat(stat_name))
	{
		set_global_stat(stat_name, value);
		return;
	}
	ERROR: Bad function call
}

/*
	Name: add_client_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1CD8
	Size: 0x90
	Parameters: 3
	Flags: None
	Line Number: 485
*/
function add_client_stat(stat_name, stat_value, include_gametype)
{
	if(!isdefined(self.pers[stat_name]))
	{
		return;
	}
	if(isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats)
	{
		return;
	}
	if(!isdefined(include_gametype))
	{
		include_gametype = 1;
	}
	self globallogic_score::incPersStat(stat_name, stat_value, 0, include_gametype);
	self.stats_this_frame[stat_name] = 1;
}

/*
	Name: increment_player_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1D70
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 513
*/
function increment_player_stat(stat_name)
{
	if(!isdefined(self.pers[stat_name]))
	{
		return;
	}
	if(isdefined(stat_name) && (stat_name == "use_magicbox" || stat_name == "use_perk_random"))
	{
		self namespace_3d0867a6::function_18df83fb("point_out", 1);
	}
	if(isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats)
	{
		return;
	}
	self IncrementPlayerStat(stat_name, 1);
	if(isdefined(level.var_d35de174[stat_name]) && isdefined(self.var_bef468a3))
	{
		self thread namespace_11e193f1::function_15dae02d(level.var_d35de174[stat_name]);
	}
}

/*
	Name: increment_root_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1E60
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 544
*/
function increment_root_stat(stat_name, stat_value)
{
	if(isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats)
	{
		return;
	}
	self AddDStat(stat_name, stat_value);
}

/*
	Name: increment_client_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1EB8
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 563
*/
function increment_client_stat(stat_name, include_gametype)
{
	if(isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats)
	{
		return;
	}
	if(!isdefined(self.pers[stat_name]))
	{
		return;
	}
	add_client_stat(stat_name, 1, include_gametype);
}

/*
	Name: set_client_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1F20
	Size: 0x98
	Parameters: 3
	Flags: None
	Line Number: 586
*/
function set_client_stat(stat_name, stat_value, include_gametype)
{
	if(isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats)
	{
		return;
	}
	current_stat_count = self globallogic_score::getPersStat(stat_name);
	self globallogic_score::incPersStat(stat_name, stat_value - current_stat_count, 0, include_gametype);
	self.stats_this_frame[stat_name] = 1;
}

/*
	Name: zero_client_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x1FC0
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 607
*/
function zero_client_stat(stat_name, include_gametype)
{
	if(isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats)
	{
		return;
	}
	current_stat_count = self globallogic_score::getPersStat(stat_name);
	self globallogic_score::incPersStat(stat_name, current_stat_count * -1, 0, include_gametype);
	self.stats_this_frame[stat_name] = 1;
}

/*
	Name: get_map_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x2058
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 628
*/
function get_map_stat(stat_name)
{
	return self GetDStat("PlayerStatsByMap", level.script, "stats", stat_name, "StatValue");
}

/*
	Name: set_map_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x20A8
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 643
*/
function set_map_stat(stat_name, value)
{
	if(!level.onlinegame || (isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats))
	{
		return;
	}
	self SetDStat("PlayerStatsByMap", level.script, "stats", stat_name, "StatValue", value);
}

/*
	Name: add_map_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x2128
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 662
*/
function add_map_stat(stat_name, value)
{
	if(!level.onlinegame || (isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats))
	{
		return;
	}
	self AddDStat("PlayerStatsByMap", level.script, "stats", stat_name, "StatValue", value);
	return;
}

/*
	Name: increment_map_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x21A8
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 682
*/
function increment_map_stat(stat_name)
{
	if(!level.onlinegame || (isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats))
	{
		return;
	}
	self AddDStat("PlayerStatsByMap", level.script, "stats", stat_name, "StatValue", 1);
}

/*
	Name: highwater_map_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x2220
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 701
*/
function highwater_map_stat(stat_name, value)
{
	if(value > get_map_stat(stat_name))
	{
		set_map_stat(stat_name, value);
	}
}

/*
	Name: increment_map_cheat_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x2278
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 719
*/
function increment_map_cheat_stat(stat_name)
{
	if(isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats)
	{
		return;
	}
	if(!isdefined(self.pers[stat_name]))
	{
		return;
	}
	self AddDStat("PlayerStatsByMap", level.script, "cheats", stat_name, 1);
}

/*
	Name: increment_challenge_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x22F0
	Size: 0xE0
	Parameters: 2
	Flags: None
	Line Number: 742
*/
function increment_challenge_stat(stat_name, amount)
{
	if(!isdefined(amount))
	{
		amount = 1;
	}
	if(stat_name == "SURVIVALIST_SURVIVE_ROUNDS")
	{
		self thread namespace_11e193f1::function_15dae02d(13);
		return;
	}
	if(isdefined(level.var_d35de174[stat_name]) && isdefined(self.var_bef468a3))
	{
		self thread namespace_11e193f1::function_15dae02d(level.var_d35de174[stat_name]);
	}
	if(!level.onlinegame || (isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats))
	{
		return;
	}
	self AddPlayerStat(stat_name, amount);
}

/*
	Name: get_stat_distance_traveled
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x23D8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 774
*/
function get_stat_distance_traveled()
{
	miles = Int(self.pers["distance_traveled"] / 63360);
	remainder = self.pers["distance_traveled"] / 63360 - miles;
	if(miles < 1 && remainder < 0.5)
	{
		miles = 1;
	}
	else if(remainder >= 0.5)
	{
		miles++;
	}
	return miles;
}

/*
	Name: function_5135e0b8
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x2498
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 799
*/
function function_5135e0b8()
{
	var_a5c54712 = Int(self.pers["distance_traveled"] / 39.37008);
	self.pers["distance_traveled"] = 0;
	return var_a5c54712;
}

/*
	Name: function_a11dd942
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x2500
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 816
*/
function function_a11dd942()
{
	var_a5c54712 = Int(self.pers["time_played_total"]);
	self.pers["time_played_total"] = 0;
	return var_a5c54712;
}

/*
	Name: get_stat_round_number
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x2560
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 833
*/
function get_stat_round_number()
{
	return zm::get_round_number();
}

/*
	Name: get_stat_combined_rank_value_survival_classic
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x2580
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 848
*/
function get_stat_combined_rank_value_survival_classic()
{
	rounds = get_stat_round_number();
	kills = self.pers["kills"];
	if(rounds > 99)
	{
		rounds = 99;
	}
	result = rounds * 10000000 + kills;
	return result;
}

/*
	Name: update_global_counters_on_match_end
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x2608
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 870
*/
function update_global_counters_on_match_end()
{
}

/*
	Name: get_specific_stat
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x2618
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 884
*/
function get_specific_stat(stat_category, stat_name)
{
	return self GetDStat(stat_category, stat_name, "StatValue");
}

/*
	Name: initializeMatchStats
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x2660
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 899
*/
function initializeMatchStats()
{
	if(!level.onlinegame || !GameModeIsMode(0))
	{
		return;
	}
	self.pers["lastHighestScore"] = self GetDStat("HighestStats", "highest_score");
	currGameType = level.gametype;
	self GameHistoryStartMatch(getGameTypeEnumFromName(currGameType, 0));
}

/*
	Name: adjustRecentStats
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x2708
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 920
*/
function adjustRecentStats()
{
	/#
		if(GetDvarInt("Dev Block strings are not supported") == 1 || GetDvarInt("Dev Block strings are not supported") == 1)
		{
			return;
		}
	#/
	initializeMatchStats();
}

/*
	Name: uploadStatsSoon
	Namespace: zm_stats
	Checksum: 0x424F4353
	Offset: 0x2778
	Size: 0x54
	Parameters: 0
	Flags: None
	Line Number: 941
*/
function uploadStatsSoon()
{
	self notify("upload_stats_soon");
	self endon("upload_stats_soon");
	self endon("disconnect");
	self endon("death");
	wait(1);
	UploadStats(self);
}

