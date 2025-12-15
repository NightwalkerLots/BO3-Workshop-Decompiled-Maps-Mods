#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_puppeteer_shared;
#include scripts\shared\ai_shared;
#include scripts\shared\archetype_shared\archetype_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_bb;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_attackables;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_bgb_token;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_bot;
#include scripts\zm\_zm_daily_challenges;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_ffotd;
#include scripts\zm\_zm_game_module;
#include scripts\zm\_zm_hero_weapon;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_placeable_mine;
#include scripts\zm\_zm_player;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_timer;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\aats\_zm_aat_blast_furnace;
#include scripts\zm\aats\_zm_aat_dead_wire;
#include scripts\zm\aats\_zm_aat_fire_works;
#include scripts\zm\aats\_zm_aat_thunder_wall;
#include scripts\zm\aats\_zm_aat_turned;
#include scripts\zm\craftables\_zm_craftables;
#include scripts\zm\gametypes\_globallogic;
#include scripts\zm\gametypes\_globallogic_player;
#include scripts\zm\gametypes\_globallogic_spawn;
#include scripts\zm\gametypes\_globallogic_vehicle;
#include scripts\zm\gametypes\_weapons;
#include scripts\zm\gametypes\_zm_gametype;

#namespace namespace_169c0a3f;

/*
	Name: init
	Namespace: namespace_169c0a3f
	Checksum: 0xFEAE01BE
	Offset: 0xAF8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function init()
{
	level.var_aa69c5db = 10000;
	level.var_f6a9d310 = "Press and Hold ^3&&1^7 to Escape \n ^8Pay in 10K Increments - 10000 Remaining";
	level.var_2b12077a = "You Do Not Have Enough Money";
	level.var_9b1ad299 = "Thanks for Playing! You Have Escaped";
	level.var_59d0ffa4 = 0;
	level.var_2481b2ed = "All Players Must Be Nearby to Escape";
	main();
}

/*
	Name: main
	Namespace: namespace_169c0a3f
	Checksum: 0x4B36F5DD
	Offset: 0xB70
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 98
*/
function main()
{
	trig = GetEnt("end_game_trig", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig UseTriggerRequireLookAt();
	cost = level.var_aa69c5db;
	while(1)
	{
		trig TriggerEnable(0);
		while(!level.var_cc5ad6fc)
		{
			wait(0.25);
		}
		trig TriggerEnable(1);
		trig setHintString(level.var_f6a9d310);
		trig waittill("trigger", player);
		if(isdefined(cost) && isdefined(player) && player.score >= cost)
		{
			if(level.var_59d0ffa4)
			{
				if(trig function_59d0ffa4())
				{
					player zm_score::minus_to_player_score(cost);
					trig setHintString("");
					function_b8bbdc71();
					continue;
				}
				trig setHintString(level.var_2481b2ed);
				wait(1);
				continue;
			}
			player zm_score::minus_to_player_score(cost);
			trig setHintString("");
			function_b8bbdc71();
		}
		else if(isdefined(cost) && isdefined(player) && player.score < cost)
		{
			trig setHintString("You Do Not Have Enough Money");
			wait(1);
		}
	}
	return;
}

/*
	Name: function_59d0ffa4
	Namespace: namespace_169c0a3f
	Checksum: 0x9813B97F
	Offset: 0xDF0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 152
*/
function function_59d0ffa4()
{
	players = GetPlayers();
	foreach(player in players)
	{
		if(Distance(self.origin, player.origin) > 500)
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: function_b8bbdc71
	Namespace: namespace_169c0a3f
	Checksum: 0xA6CD675F
	Offset: 0xEC0
	Size: 0xD10
	Parameters: 0
	Flags: None
	Line Number: 175
*/
function function_b8bbdc71()
{
	zm::check_end_game_intermission_delay();
	SetMatchFlag("game_ended", 1);
	level clientfield::set("gameplay_started", 0);
	level clientfield::set("game_end_time", Int(GetTime() - level.n_gameplay_start_time + 500 / 1000));
	util::clientNotify("zesn");
	level thread zm_audio::sndmusicsystem_playstate("game_over");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] clientfield::set("zmbLastStand", 0);
	}
	for(i = 0; i < players.size; i++)
	{
		if(players[i] laststand::player_is_in_laststand())
		{
			players[i] RecordPlayerDeathZombies();
			players[i] zm_stats::increment_player_stat("deaths");
			players[i] zm_stats::increment_client_stat("deaths");
		}
		if(isdefined(players[i].reviveTextHud))
		{
			players[i].reviveTextHud destroy();
		}
	}
	StopAllRumbles();
	level.intermission = 1;
	level.zombie_vars["zombie_powerup_insta_kill_time"] = 0;
	level.zombie_vars["zombie_powerup_fire_sale_time"] = 0;
	level.zombie_vars["zombie_powerup_double_points_time"] = 0;
	wait(0.1);
	game_over = [];
	survived = [];
	players = GetPlayers();
	SetMatchFlag("disableIngameMenu", 1);
	foreach(player in players)
	{
		player closeInGameMenu();
		player CloseMenu("StartMenu_Main");
	}
	foreach(player in players)
	{
		player SetDStat("AfterActionReportStats", "lobbyPopup", "summary");
	}
	if(!isdefined(level._supress_survived_screen))
	{
		for(i = 0; i < players.size; i++)
		{
			game_over[i] = newClientHudElem(players[i]);
			survived[i] = newClientHudElem(players[i]);
			if(isdefined(level.custom_game_over_hud_elem))
			{
				[[level.custom_game_over_hud_elem]](players[i], game_over[i], survived[i]);
				continue;
			}
			game_over[i].alignX = "center";
			game_over[i].alignY = "middle";
			game_over[i].horzAlign = "center";
			game_over[i].vertAlign = "middle";
			game_over[i].y = game_over[i].y - 130;
			game_over[i].foreground = 1;
			game_over[i].fontscale = 3;
			game_over[i].alpha = 0;
			game_over[i].color = (1, 1, 1);
			game_over[i].hidewheninmenu = 1;
			game_over[i] setText(level.var_9b1ad299);
			game_over[i] fadeOverTime(1);
			game_over[i].alpha = 1;
			if(players[i] IsSplitscreen())
			{
				game_over[i].fontscale = 2;
				game_over[i].y = game_over[i].y + 40;
			}
			survived[i].alignX = "center";
			survived[i].alignY = "middle";
			survived[i].horzAlign = "center";
			survived[i].vertAlign = "middle";
			survived[i].y = survived[i].y - 100;
			survived[i].foreground = 1;
			survived[i].fontscale = 2;
			survived[i].alpha = 0;
			survived[i].color = (1, 1, 1);
			survived[i].hidewheninmenu = 1;
			if(players[i] IsSplitscreen())
			{
				survived[i].fontscale = 1.5;
				survived[i].y = survived[i].y + 40;
			}
			if(level.round_number < 2)
			{
				survived[i] setText(&"ZOMBIE_SURVIVED_ROUND");
				continue;
			}
			survived[i] setText(&"ZOMBIE_SURVIVED_ROUNDS", level.round_number);
			survived[i] fadeOverTime(1);
			survived[i].alpha = 1;
		}
	}
	else if(isdefined(level.custom_end_screen))
	{
		level [[level.custom_end_screen]]();
	}
	for(i = 0; i < players.size; i++)
	{
		players[i] setClientUIVisibilityFlag("weapon_hud_visible", 0);
		players[i] SetClientMiniScoreboardHide(1);
		players[i] notify("report_bgb_consumption", players, players);
	}
	UploadStats();
	zm_stats::update_players_stats_at_match_end(players);
	zm_stats::update_global_counters_on_match_end();
	zm::upload_leaderboards();
	recordGameResult("draw");
	globallogic::recordZMEndGameComScoreEvent("draw");
	globallogic_player::recordActivePlayersEndGameMatchRecordStats();
	finalizeMatchRecord();
	players = GetPlayers();
	foreach(player in players)
	{
		if(isdefined(player.sessionstate) && player.sessionstate == "spectator")
		{
			player.sessionstate = "playing";
			player thread zm::end_game_player_was_spectator();
		}
	}
	wait(0.05);
	players = GetPlayers();
	LUINotifyEvent(&"force_scoreboard", 1, 1);
	zm::intermission();
	wait(level.zombie_vars["zombie_intermission_time"]);
	if(!isdefined(level._supress_survived_screen))
	{
		for(i = 0; i < players.size; i++)
		{
			survived[i] destroy();
			game_over[i] destroy();
		}
		continue;
	}
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i].survived_hud))
		{
			players[i].survived_hud destroy();
		}
		if(isdefined(players[i].game_over_hud))
		{
			players[i].game_over_hud destroy();
		}
	}
	level notify("stop_intermission", players);
	Array::thread_all(GetPlayers(), &player_exit_level);
	wait(1.5);
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] CameraActivate(0);
	}
	exitLevel(0);
	wait(666);
	return;
}

/*
	Name: player_exit_level
	Namespace: namespace_169c0a3f
	Checksum: 0x4E0DB8D7
	Offset: 0x1BD8
	Size: 0x4C
	Parameters: 0
	Flags: None
	Line Number: 349
*/
function player_exit_level()
{
	self AllowStand(1);
	self AllowCrouch(0);
	self allowprone(0);
}

