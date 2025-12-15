#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_bgb_token;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\zmsavedata;

#namespace zm_score;

/*
	Name: __init__sytem__
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x7E8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 28
*/
function autoexec __init__sytem__()
{
	system::register("zm_score", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: __init__
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x828
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 46
*/
function __init__()
{
	score_cf_register_info("damage", 1, 7);
	score_cf_register_info("death_normal", 1, 3);
	score_cf_register_info("death_torso", 1, 3);
	score_cf_register_info("death_neck", 1, 3);
	score_cf_register_info("death_head", 1, 3);
	score_cf_register_info("death_melee", 1, 3);
	clientfield::register("clientuimodel", "hudItems.doublePointsActive", 1, 1, "int");
	clientfield::register("clientuimodel", "hudItems.showDpadUp", 1, 1, "int");
	clientfield::register("clientuimodel", "hudItems.showDpadDown", 1, 1, "int");
	clientfield::register("clientuimodel", "hudItems.showDpadLeft", 1, 1, "int");
	clientfield::register("clientuimodel", "hudItems.showDpadRight", 1, 1, "int");
	callback::on_spawned(&player_on_spawned);
	level.score_total = 0;
	level.a_func_score_events = [];
}

/*
	Name: register_score_event
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0xA20
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 74
*/
function register_score_event(str_event, func_callback)
{
	level.a_func_score_events[str_event] = func_callback;
}

/*
	Name: reset_doublexp_timer
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0xA50
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 89
*/
function reset_doublexp_timer()
{
	self notify("reset_doublexp_timer");
	self thread doublexp_timer();
}

/*
	Name: doublexp_timer
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0xA80
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function doublexp_timer()
{
	self notify("doublexp_timer");
	self endon("doublexp_timer");
	self endon("reset_doublexp_timer");
	self endon("end_game");
	level flagsys::wait_till("start_zombie_round_logic");
	if(!level.onlinegame)
	{
		return;
	}
	wait(60);
	if(level.onlinegame)
	{
		if(!isdefined(self))
		{
			return;
		}
		self DoubleXPTimerFired();
	}
	self thread reset_doublexp_timer();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: player_on_spawned
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0xB38
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 140
*/
function player_on_spawned()
{
	util::wait_network_frame();
	self thread doublexp_timer();
	if(isdefined(self))
	{
		self.ready_for_score_events = 1;
	}
}

/*
	Name: score_cf_register_info
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0xB80
	Size: 0xA0
	Parameters: 3
	Flags: None
	Line Number: 160
*/
function score_cf_register_info(name, version, max_count)
{
	for(i = 0; i < 4; i++)
	{
		clientfield::register("clientuimodel", "PlayerList.client" + i + ".score_cf_" + name, version, GetMinBitCountForNum(max_count), "counter");
	}
}

/*
	Name: score_cf_increment_info
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0xC28
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 178
*/
function score_cf_increment_info(name)
{
	foreach(player in level.players)
	{
		thread wait_score_cf_increment_info(player, "PlayerList.client" + self.entity_num + ".score_cf_" + name);
	}
}

/*
	Name: wait_score_cf_increment_info
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0xCE8
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 196
*/
function wait_score_cf_increment_info(player, cf)
{
	if(isdefined(player) && (isdefined(player.ready_for_score_events) && player.ready_for_score_events))
	{
		player clientfield::increment_uimodel(cf);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: player_add_points
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0xD50
	Size: 0x980
	Parameters: 6
	Flags: None
	Line Number: 216
*/
function player_add_points(event, mod, HIT_LOCATION, is_dog, zombie_team, DAMAGE_WEAPON)
{
	if(level.intermission)
	{
		return;
	}
	if(!zm_utility::is_player_valid(self))
	{
		return;
	}
	player_points = 0;
	team_points = 0;
	multiplier = get_points_multiplier(self);
	var_dee1e85a = undefined;
	if(isdefined(level.a_func_score_events[event]))
	{
		player_points = [[level.a_func_score_events[event]]](event, mod, HIT_LOCATION, zombie_team, DAMAGE_WEAPON);
	}
	else
	{
		switch(event)
		{
			case "death_raps":
			case "death_wasp":
			{
				player_points = mod;
				scoreevents::processScoreEvent("kill", self, undefined, DAMAGE_WEAPON);
				break;
			}
			case "death_spider":
			{
				player_points = get_zombie_death_player_points();
				team_points = get_zombie_death_team_points();
				scoreevents::processScoreEvent("kill_spider", self, undefined, DAMAGE_WEAPON);
				break;
			}
			case "death_thrasher":
			{
				player_points = get_zombie_death_player_points();
				team_points = get_zombie_death_team_points();
				points = self player_add_points_kill_bonus(mod, HIT_LOCATION, DAMAGE_WEAPON);
				if(level.zombie_vars[self.team]["zombie_powerup_insta_kill_on"] == 1 && mod == "MOD_UNKNOWN")
				{
					points = points * 2;
				}
				player_points = player_points + points;
				player_points = player_points * 2;
				if(team_points > 0)
				{
					team_points = team_points + points;
				}
				if(mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH")
				{
					self zm_stats::increment_client_stat("grenade_kills");
					self zm_stats::increment_player_stat("grenade_kills");
				}
				scoreevents::processScoreEvent("kill_thrasher", self, undefined, DAMAGE_WEAPON);
				break;
			}
			case "death":
			{
				player_points = get_zombie_death_player_points();
				team_points = get_zombie_death_team_points();
				points = self player_add_points_kill_bonus(mod, HIT_LOCATION, DAMAGE_WEAPON, player_points);
				var_dee1e85a = "ZOMBIE ELIMINATION";
				if(mod == "MOD_MELEE")
				{
					var_dee1e85a = "ZOMBIE MELEE KILL";
				}
				if("head" == HIT_LOCATION || "helmet" == HIT_LOCATION)
				{
					var_dee1e85a = "ZOMBIE CRITICAL KILL";
				}
				if(level.zombie_vars[self.team]["zombie_powerup_insta_kill_on"] == 1 && mod == "MOD_UNKNOWN")
				{
					points = points * 2;
					var_dee1e85a = "ZOMBIE MELEE KILL";
				}
				player_points = player_points + points;
				if(team_points > 0)
				{
					team_points = team_points + points;
				}
				if(mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH")
				{
					self zm_stats::increment_client_stat("grenade_kills");
					self zm_stats::increment_player_stat("grenade_kills");
					var_dee1e85a = "ZOMBIE GRENADE KILL";
					break;
				}
			}
			case "death_mechz":
			{
				player_points = mod;
				scoreevents::processScoreEvent("kill_mechz", self, undefined, DAMAGE_WEAPON);
				break;
			}
			case "ballistic_knife_death":
			{
				player_points = get_zombie_death_player_points() + level.zombie_vars["zombie_score_bonus_melee"];
				self score_cf_increment_info("death_melee");
				break;
			}
			case "damage_light":
			{
				player_points = level.zombie_vars["zombie_score_damage_light"];
				self score_cf_increment_info("damage");
				break;
			}
			case "damage":
			{
				player_points = level.zombie_vars["zombie_score_damage_normal"];
				self score_cf_increment_info("damage");
				break;
			}
			case "damage_ads":
			{
				player_points = Int(level.zombie_vars["zombie_score_damage_normal"] * 1.25);
				self score_cf_increment_info("damage");
				break;
			}
			case "rebuild_board":
			{
				player_points = mod;
				var_dee1e85a = "REBUILD BOARD";
				break;
			}
			case "carpenter_powerup":
			{
				player_points = mod;
				var_dee1e85a = "CARPENTER";
				break;
			}
			case "bonus_points_powerup":
			{
				player_points = mod;
				var_dee1e85a = "BONUS POINTS";
				break;
			}
			case "nuke_powerup":
			{
				player_points = mod;
				team_points = mod;
				var_dee1e85a = "NUKE";
				break;
			}
			case "jetgun_fling":
			case "riotshield_fling":
			case "thundergun_fling":
			{
				player_points = mod;
				scoreevents::processScoreEvent("kill", self, undefined, DAMAGE_WEAPON);
				break;
			}
			case "hacker_transfer":
			{
				player_points = mod;
				break;
			}
			case "reviver":
			{
				player_points = mod;
				break;
			}
			case "vulture":
			{
				player_points = mod;
				break;
			}
			case "build_wallbuy":
			{
				player_points = mod;
				break;
			}
			case "ww_webbed":
			{
				player_points = mod;
				break;
			}
			default
			{
				/#
					fallback_initiated::Assert(0, "Dev Block strings are not supported");
					break;
				#/
			}
		}
	}
	if(isdefined(level.player_score_override))
	{
		player_points = self [[level.player_score_override]](DAMAGE_WEAPON, player_points);
	}
	if(isdefined(level.team_score_override))
	{
		team_points = self [[level.team_score_override]](DAMAGE_WEAPON, team_points);
	}
	player_points = multiplier * zm_utility::round_up_score(player_points, 10);
	team_points = multiplier * zm_utility::round_up_score(team_points, 10);
	if(isdefined(self.point_split_receiver) && (event == "death" || event == "ballistic_knife_death"))
	{
		split_player_points = player_points - zm_utility::round_up_score(player_points * self.point_split_keep_percent, 10);
		self.point_split_receiver add_to_player_score(split_player_points);
		player_points = player_points - split_player_points;
	}
	if(isdefined(level.pers_upgrade_pistol_points) && level.pers_upgrade_pistol_points)
	{
		player_points = self zm_pers_upgrades_functions::pers_upgrade_pistol_points_set_score(player_points, event, mod, DAMAGE_WEAPON);
	}
	if(isdefined(var_dee1e85a))
	{
		self add_to_player_score(player_points, 1, var_dee1e85a, 1);
	}
	else
	{
		self add_to_player_score(player_points, 1, event);
	}
	self.pers["score"] = self.score;
	if(isdefined(level._game_module_point_adjustment))
	{
		level [[level._game_module_point_adjustment]](self, zombie_team, player_points);
	}
}

/*
	Name: get_points_multiplier
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x16D8
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 449
*/
function get_points_multiplier(player)
{
	multiplier = level.zombie_vars[player.team]["zombie_point_scalar"];
	if(isdefined(level.current_game_module) && level.current_game_module == 2)
	{
		if(isdefined(level._race_team_double_points) && level._race_team_double_points == player._race_team)
		{
			return multiplier;
		}
		else
		{
			return 1;
		}
	}
	return multiplier;
	multiplier++;
}

/*
	Name: get_zombie_death_player_points
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x1770
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 477
*/
function get_zombie_death_player_points()
{
	players = GetPlayers();
	if(players.size == 1)
	{
		points = level.zombie_vars["zombie_score_kill_1player"];
	}
	else if(players.size == 2)
	{
		points = level.zombie_vars["zombie_score_kill_2player"];
	}
	else if(players.size == 3)
	{
		points = level.zombie_vars["zombie_score_kill_3player"];
	}
	else
	{
		points = level.zombie_vars["zombie_score_kill_4player"];
	}
	return points;
}

/*
	Name: get_zombie_death_team_points
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x1840
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 509
*/
function get_zombie_death_team_points()
{
	return 0;
}

/*
	Name: player_add_points_kill_bonus
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x1850
	Size: 0x2D0
	Parameters: 4
	Flags: None
	Line Number: 524
*/
function player_add_points_kill_bonus(mod, HIT_LOCATION, weapon, player_points)
{
	if(!isdefined(player_points))
	{
		player_points = undefined;
	}
	if(mod != "MOD_MELEE")
	{
		if("head" == HIT_LOCATION || "helmet" == HIT_LOCATION)
		{
			scoreevents::processScoreEvent("headshot", self, undefined, weapon);
		}
		else
		{
			scoreevents::processScoreEvent("kill", self, undefined, weapon);
		}
	}
	if(isdefined(level.player_score_override))
	{
		new_points = self [[level.player_score_override]](weapon, player_points);
		if(new_points > 0 && new_points != player_points)
		{
			return 0;
		}
	}
	if(mod == "MOD_MELEE")
	{
		self score_cf_increment_info("death_melee");
		scoreevents::processScoreEvent("melee_kill", self, undefined, weapon);
		return level.zombie_vars["zombie_score_bonus_melee"];
	}
	if(mod == "MOD_BURNED")
	{
		self score_cf_increment_info("death_torso");
		return level.zombie_vars["zombie_score_bonus_burn"];
	}
	score = 0;
	if(isdefined(HIT_LOCATION))
	{
		switch(HIT_LOCATION)
		{
			case "head":
			case "helmet":
			{
				self score_cf_increment_info("death_head");
				score = level.zombie_vars["zombie_score_bonus_head"];
				break;
			}
			case "neck":
			{
				self score_cf_increment_info("death_neck");
				score = level.zombie_vars["zombie_score_bonus_neck"];
				break;
			}
			case "torso_lower":
			case "torso_upper":
			{
				self score_cf_increment_info("death_torso");
				score = level.zombie_vars["zombie_score_bonus_torso"];
				break;
			}
			default
			{
				self score_cf_increment_info("death_normal");
				break;
			}
		}
	}
	return score;
}

/*
	Name: player_reduce_points
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x1B28
	Size: 0x218
	Parameters: 2
	Flags: None
	Line Number: 605
*/
function player_reduce_points(event, n_amount)
{
	if(level.intermission)
	{
		return;
	}
	points = 0;
	switch(event)
	{
		case "take_all":
		{
			points = self.score;
			break;
		}
		case "take_half":
		{
			points = Int(self.score / 2);
			break;
		}
		case "take_specified":
		{
			points = n_amount;
			break;
		}
		case "no_revive_penalty":
		{
			percent = level.zombie_vars["penalty_no_revive"];
			points = self.score * percent;
			break;
		}
		case "died":
		{
			percent = level.zombie_vars["penalty_died"];
			points = self.score * percent;
			break;
		}
		case "downed":
		{
			percent = level.zombie_vars["penalty_downed"];
			self notify("I_am_down");
			points = self.score * percent;
			self.score_lost_when_downed = zm_utility::round_up_to_ten(Int(points));
			break;
		}
		default
		{
			/#
				fallback_initiated::Assert(0, "Dev Block strings are not supported");
				break;
			#/
		}
	}
	points = self.score - zm_utility::round_up_to_ten(Int(points));
	if(points < 0)
	{
		points = 0;
	}
	self.score = points;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: add_to_player_score
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x1D48
	Size: 0x1A0
	Parameters: 4
	Flags: None
	Line Number: 677
*/
function add_to_player_score(points, b_add_to_total, str_awarded_by, var_2f5b9475)
{
	if(!isdefined(b_add_to_total))
	{
		b_add_to_total = 1;
	}
	if(!isdefined(str_awarded_by))
	{
		str_awarded_by = "";
	}
	if(!isdefined(var_2f5b9475))
	{
		var_2f5b9475 = 0;
	}
	if(!isdefined(points) || level.intermission)
	{
		return;
	}
	points = zm_utility::round_up_score(points, 10);
	n_points_to_add_to_currency = bgb::add_to_player_score_override(points, str_awarded_by);
	if(isdefined(str_awarded_by) && str_awarded_by != "" && n_points_to_add_to_currency > 0 && var_2f5b9475)
	{
		self thread function_78d140e3(n_points_to_add_to_currency, str_awarded_by);
	}
	self.score = self.score + n_points_to_add_to_currency;
	self.pers["score"] = self.score;
	self IncrementPlayerStat("scoreEarned", n_points_to_add_to_currency);
	level notify("earned_points", self, points);
	if(b_add_to_total)
	{
		self.score_total = self.score_total + points;
		level.score_total = level.score_total + points;
	}
}

/*
	Name: minus_to_player_score
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x1EF0
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 722
*/
function minus_to_player_score(points)
{
	if(!isdefined(points) || level.intermission)
	{
		return;
	}
	if(self bgb::is_enabled("zm_bgb_shopping_free"))
	{
		self bgb::do_one_shot_use();
		self playsoundtoplayer("zmb_bgb_shoppingfree_coinreturn", self);
		return;
	}
	if(!isdefined(level.var_5d84897d))
	{
		level.var_5d84897d = [];
	}
	for(i = 0; i < level.var_5d84897d.size; i++)
	{
		points = self [[level.var_5d84897d[i]]](points);
	}
	self.score = self.score - points;
	self.pers["score"] = self.score;
	self IncrementPlayerStat("scoreSpent", points);
	level notify("spent_points", self, points);
}

/*
	Name: function_b14604c0
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x2040
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 758
*/
function function_b14604c0(func)
{
	if(!isdefined(level.var_5d84897d))
	{
		level.var_5d84897d = [];
	}
	level.var_5d84897d[level.var_5d84897d.size] = func;
}

/*
	Name: function_22b362c1
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x2088
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 777
*/
function function_22b362c1(func)
{
	if(!isdefined(level.var_5d84897d))
	{
		level.var_5d84897d = [];
	}
	ArrayRemoveValue(level.var_5d84897d, func);
}

/*
	Name: add_to_team_score
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x20D8
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 796
*/
function add_to_team_score(points)
{
}

/*
	Name: minus_to_team_score
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x20F0
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 810
*/
function minus_to_team_score(points)
{
}

/*
	Name: player_died_penalty
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x2108
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 824
*/
function player_died_penalty()
{
	players = GetPlayers(self.team);
	for(i = 0; i < players.size; i++)
	{
		if(players[i] != self && !players[i].is_zombie)
		{
			players[i] player_reduce_points("no_revive_penalty");
		}
	}
}

/*
	Name: player_downed_penalty
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x21B8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 846
*/
function player_downed_penalty()
{
	/#
		println("Dev Block strings are not supported");
	#/
	self player_reduce_points("downed");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: can_player_purchase
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x2208
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 866
*/
function can_player_purchase(n_cost)
{
	if(self.score >= n_cost)
	{
		return 1;
	}
	if(self bgb::is_enabled("zm_bgb_shopping_free"))
	{
		return 1;
	}
	if(isdefined(level.var_7e5a6936) && level.var_7e5a6936.size > 0)
	{
		can = 0;
		for(i = 0; i < level.var_7e5a6936.size; i++)
		{
			can = self [[level.var_7e5a6936[i]]](n_cost);
			if(can == 1)
			{
				break;
			}
		}
		return can;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b534cc03
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x22E8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 903
*/
function function_b534cc03(func)
{
	if(!isdefined(level.var_7e5a6936))
	{
		level.var_7e5a6936 = [];
	}
	level.var_7e5a6936[level.var_7e5a6936.size] = func;
}

/*
	Name: function_c9f1d0be
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x2330
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 922
*/
function function_c9f1d0be(func)
{
	if(!isdefined(level.var_7e5a6936))
	{
		level.var_7e5a6936 = [];
	}
	ArrayRemoveValue(level.var_7e5a6936, func);
	return;
}

/*
	Name: function_78d140e3
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x2380
	Size: 0x270
	Parameters: 2
	Flags: None
	Line Number: 942
*/
function function_78d140e3(points, str_awarded_by)
{
	if(level flag::exists("reap_collection_loaded") && !level flag::get("reap_collection_loaded") || namespace_11e193f1::function_6dd41714("extras_scorefeed") == 0)
	{
		return;
	}
	if(!isdefined(self.var_78d140e3))
	{
		self.var_78d140e3 = 0;
	}
	if(self.var_78d140e3 > 0)
	{
		num = self.var_78d140e3;
		self.var_78d140e3++;
		for(i = 0; i < num; i++)
		{
			self waittill("hash_e3d990fb");
		}
	}
	else
	{
		self.var_78d140e3++;
	}
	var_ee47361b = self namespace_851dc78f::function_122a9928("left", "middle", "center", "middle", 16, 10, 0, (1, 1, 1), "+" + points + "  " + str_awarded_by, 1.2, 1, 1);
	var_ee47361b endon("hash_78d140e3");
	self notify("hash_78d140e3");
	var_ee47361b thread function_ab72b9b7(self);
	var_ee47361b fadeOverTime(0.1);
	var_ee47361b.alpha = 0.7;
	wait(0.1);
	self.var_78d140e3--;
	self notify("hash_e3d990fb");
	wait(2);
	if(isdefined(var_ee47361b))
	{
		var_ee47361b fadeOverTime(0.25);
		var_ee47361b.alpha = 0;
		wait(0.25);
		if(isdefined(var_ee47361b))
		{
			var_ee47361b destroy();
		}
	}
}

/*
	Name: function_ab72b9b7
	Namespace: zm_score
	Checksum: 0x424F4353
	Offset: 0x25F8
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 997
*/
function function_ab72b9b7(player)
{
	while(isdefined(self))
	{
		player waittill("hash_78d140e3");
		if(isdefined(self))
		{
			self MoveOverTime(0.1);
			self.y = self.y + 10;
			if(self.y > 70)
			{
				self notify("hash_78d140e3");
				self destroy();
			}
		}
	}
}

