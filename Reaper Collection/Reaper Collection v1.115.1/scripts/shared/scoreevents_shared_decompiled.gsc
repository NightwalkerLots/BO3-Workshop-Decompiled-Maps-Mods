#include scripts\codescripts\struct;
#include scripts\shared\abilities\_ability_power;
#include scripts\shared\callbacks_shared;
#include scripts\shared\gameskill_shared;
#include scripts\shared\killstreaks_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_leveling;

#namespace scoreevents;

/*
	Name: checkStringValid
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x2C0
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 21
*/
function checkStringValid(STR)
{
	if(STR != "")
	{
		return STR;
	}
	return undefined;
}

/*
	Name: processScoreEvent
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x2F0
	Size: 0x160
	Parameters: 4
	Flags: None
	Line Number: 40
*/
function processScoreEvent(event, player, victim, weapon)
{
	PixBeginEvent("processScoreEvent");
	scoreGiven = 0;
	if(!isPlayer(player))
	{
		return scoreGiven;
	}
	index = 1;
	for(row = TableLookupRow("gamedata/tables/zm/scoreInfo.csv", index); isdefined(row); row = TableLookupRow("gamedata/tables/zm/scoreInfo.csv", index))
	{
		var_b086e09a = checkStringValid(row[0]);
		if(var_b086e09a == event)
		{
			scoreGiven = Int(row[15]);
			break;
		}
		index++;
	}
	if(scoreGiven > 0)
	{
		player thread namespace_3bad7368::function_b77a6e9b(scoreGiven, event);
	}
	return scoreGiven;
}

/*
	Name: shouldAddRankXP
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x458
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 76
*/
function shouldAddRankXP(player)
{
	if(SessionModeIsCampaignZombiesGame())
	{
		return 0;
	}
	if(level.gametype == "fr")
	{
		return 0;
	}
	if(!isdefined(level.rankCap) || level.rankCap == 0)
	{
		return 1;
	}
	if(player.pers["plevel"] > 0 || player.pers["rank"] > level.rankCap)
	{
		return 0;
	}
	return 1;
}

/*
	Name: uninterruptedObitFeedKills
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x508
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 107
*/
function uninterruptedObitFeedKills(attacker, weapon)
{
	self endon("hash_82223b0f");
	wait(0.1);
	util::WaitTillSlowProcessAllowed();
	wait(0.1);
	processScoreEvent("uninterrupted_obit_feed_kills", attacker, self, weapon);
}

/*
	Name: isRegisteredEvent
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x578
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 126
*/
function isRegisteredEvent(type)
{
	if(isdefined(level.scoreInfo[type]))
	{
		return 1;
	}
	return 0;
}

/*
	Name: decrementLastObituaryPlayerCountAfterFade
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x5A8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 145
*/
function decrementLastObituaryPlayerCountAfterFade()
{
	level endon("hash_6661ff7e");
	wait(5);
	level.lastObituaryPlayerCount--;
}

/*
	Name: getScoreEventTableName
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x5D0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 162
*/
function getScoreEventTableName()
{
	if(SessionModeIsCampaignGame())
	{
		return "gamedata/tables/cp/scoreInfo.csv";
	}
	if(SessionModeIsZombiesGame())
	{
		return "gamedata/tables/zm/scoreInfo.csv";
	}
	return "gamedata/tables/mp/scoreInfo.csv";
}

/*
	Name: getScoreEventTableID
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x620
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function getScoreEventTableID()
{
	scoreInfoTableLoaded = 0;
	scoreInfoTableID = TableLookupFindCoreAsset(getScoreEventTableName());
	if(isdefined(scoreInfoTableID))
	{
		scoreInfoTableLoaded = 1;
	}
	return scoreInfoTableID;
}

/*
	Name: getScoreEventColumn
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x688
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 206
*/
function getScoreEventColumn(gametype)
{
	columnOffset = getColumnOffsetForGametype(gametype);
	if(columnOffset >= 0)
	{
		columnOffset = columnOffset + 0;
	}
	return columnOffset;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: getXPEventColumn
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x6E0
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 227
*/
function getXPEventColumn(gametype)
{
	columnOffset = getColumnOffsetForGametype(gametype);
	if(columnOffset >= 0)
	{
		columnOffset = columnOffset + 1;
	}
	return columnOffset;
}

/*
	Name: getColumnOffsetForGametype
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x738
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 247
*/
function getColumnOffsetForGametype(gametype)
{
	foundGameMode = 0;
	if(!isdefined(level.scoreEventTableID))
	{
		level.scoreEventTableID = getScoreEventTableID();
	}
	if(!isdefined(level.scoreEventTableID))
	{
		return -1;
	}
	gameModeColumn = 14;
	for(;;)
	{
		column_header = TableLookupColumnForRow(level.scoreEventTableID, 0, gameModeColumn);
		if(column_header == "")
		{
			gameModeColumn = 14;
		}
		else if(column_header == level.gametype + " score")
		{
			foundGameMode = 1;
		}
		gameModeColumn = gameModeColumn + 2;
	}
	else
	{
	}
	return gameModeColumn;
}

/*
	Name: killstreakWeaponsAllowedScore
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x830
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 288
*/
function killstreakWeaponsAllowedScore(type)
{
	if(GetDvarInt("teamOpsEnabled") == 1)
	{
		return 0;
	}
	if(isdefined(level.scoreInfo[type]["allowKillstreakWeapons"]) && level.scoreInfo[type]["allowKillstreakWeapons"] == 1)
	{
		return 1;
	}
	return 0;
}

/*
	Name: is_hero_score_event_restricted
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x8B0
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 311
*/
function is_hero_score_event_restricted(event)
{
	if(!isdefined(level.scoreInfo[event]["allow_hero"]) || level.scoreInfo[event]["allow_hero"] != 1)
	{
		return 1;
	}
	return 0;
}

/*
	Name: giveCrateCaptureMedal
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x910
	Size: 0x1F0
	Parameters: 2
	Flags: None
	Line Number: 330
*/
function giveCrateCaptureMedal(Crate, capturer)
{
	if(isdefined(Crate) && isdefined(capturer) && isdefined(Crate.owner) && isPlayer(Crate.owner))
	{
		if(level.teambased)
		{
			if(capturer.team != Crate.owner.team)
			{
				Crate.owner playlocalsound("mpl_crate_enemy_steals");
				if(!isdefined(Crate.hacker))
				{
					processScoreEvent("capture_enemy_crate", capturer);
				}
			}
			else if(isdefined(Crate.owner) && capturer != Crate.owner)
			{
				Crate.owner playlocalsound("mpl_crate_friendly_steals");
				if(!isdefined(Crate.hacker))
				{
					level.globalSharePackages++;
					processScoreEvent("share_care_package", Crate.owner);
				}
			}
		}
		else if(capturer != Crate.owner)
		{
			Crate.owner playlocalsound("mpl_crate_enemy_steals");
			if(!isdefined(Crate.hacker))
			{
				processScoreEvent("capture_enemy_crate", capturer);
			}
		}
	}
}

/*
	Name: register_hero_ability_kill_event
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0xB08
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 375
*/
function register_hero_ability_kill_event(event_func)
{
	if(!isdefined(level.hero_ability_kill_events))
	{
		level.hero_ability_kill_events = [];
	}
	level.hero_ability_kill_events[level.hero_ability_kill_events.size] = event_func;
}

/*
	Name: register_hero_ability_multikill_event
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0xB50
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 394
*/
function register_hero_ability_multikill_event(event_func)
{
	if(!isdefined(level.hero_ability_multikill_events))
	{
		level.hero_ability_multikill_events = [];
	}
	level.hero_ability_multikill_events[level.hero_ability_multikill_events.size] = event_func;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: register_hero_weapon_multikill_event
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0xB98
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 415
*/
function register_hero_weapon_multikill_event(event_func)
{
	if(!isdefined(level.hero_weapon_multikill_events))
	{
		level.hero_weapon_multikill_events = [];
	}
	level.hero_weapon_multikill_events[level.hero_weapon_multikill_events.size] = event_func;
}

/*
	Name: register_thief_shutdown_enemy_event
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0xBE0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 434
*/
function register_thief_shutdown_enemy_event(event_func)
{
	if(!isdefined(level.thief_shutdown_enemy_events))
	{
		level.thief_shutdown_enemy_events = [];
	}
	level.thief_shutdown_enemy_events[level.thief_shutdown_enemy_events.size] = event_func;
}

/*
	Name: hero_ability_kill_event
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0xC28
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 453
*/
function hero_ability_kill_event(ability, victim_ability)
{
	if(!isdefined(level.hero_ability_kill_events))
	{
		return;
	}
	foreach(event_func in level.hero_ability_kill_events)
	{
		if(isdefined(event_func))
		{
			self [[event_func]](ability, victim_ability);
		}
	}
}

/*
	Name: hero_ability_multikill_event
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0xCE8
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 478
*/
function hero_ability_multikill_event(killcount, ability)
{
	if(!isdefined(level.hero_ability_multikill_events))
	{
		return;
	}
	foreach(event_func in level.hero_ability_multikill_events)
	{
		if(isdefined(event_func))
		{
			self [[event_func]](killcount, ability);
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: hero_weapon_multikill_event
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0xDA8
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 505
*/
function hero_weapon_multikill_event(killcount, weapon)
{
	if(!isdefined(level.hero_weapon_multikill_events))
	{
		return;
	}
	foreach(event_func in level.hero_weapon_multikill_events)
	{
		if(isdefined(event_func))
		{
			self [[event_func]](killcount, weapon);
		}
	}
	return;
	++;
}

/*
	Name: thief_shutdown_enemy_event
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0xE68
	Size: 0x9C
	Parameters: 0
	Flags: None
	Line Number: 532
*/
function thief_shutdown_enemy_event()
{
	if(!isdefined(level.thief_shutdown_enemy_event))
	{
		return;
	}
	foreach(event_func in level.thief_shutdown_enemy_event)
	{
		if(isdefined(event_func))
		{
			self [[event_func]]();
		}
	}
}

