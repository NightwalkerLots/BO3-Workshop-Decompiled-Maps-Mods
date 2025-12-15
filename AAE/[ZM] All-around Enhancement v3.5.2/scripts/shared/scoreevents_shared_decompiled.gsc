#include scripts\codescripts\struct;
#include scripts\shared\abilities\_ability_power;
#include scripts\shared\callbacks_shared;
#include scripts\shared\gameskill_shared;
#include scripts\shared\killstreaks_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_sub;
#include scripts\zm\aae_left_ges;
#include scripts\zm\zmsavedata;

#namespace scoreevents;

/*
	Name: processScoreEvent
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x580
	Size: 0x530
	Parameters: 4
	Flags: None
	Line Number: 23
*/
function processScoreEvent(event, player, victim, weapon)
{
	if(event == "open_door" && isPlayer(player))
	{
		player namespace_3d0867a6::function_18df83fb(event);
		thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, player.name, "â¦SUBEVENT_OPENDOORâ¦â¦SUBEVENT_DOTâ¦");
	}
	PixBeginEvent("processScoreEvent");
	function_894a641e(event);
	if(isdefined(self.gamevars["hardcore"]) || isdefined(level.gamevars["hardcore"]))
	{
		return 0;
	}
	scoreGiven = 0;
	if(!isPlayer(player) || (IsSubStr(player.name, "Miyako") || IsSubStr(player.name, "Rokka")) || player getXuid(1) == "76561198153364466")
	{
		/#
			ASSERTMSG("Dev Block strings are not supported" + event);
		#/
		return scoreGiven;
	}
	if(isdefined(level.var_71ef45f3))
	{
		[[level.var_71ef45f3]](event, player, victim, weapon);
	}
	if(GetDvarInt("teamOpsEnabled") == 1)
	{
		if(isdefined(level.teamopsOnProcessPlayerEvent))
		{
			level [[level.teamopsOnProcessPlayerEvent]](event, player);
		}
	}
	if(isdefined(level.challengesOnEventReceived))
	{
		player thread [[level.challengesOnEventReceived]](event);
	}
	if(isRegisteredEvent(event) && (!SessionModeIsZombiesGame() || level.onlinegame))
	{
		allowPlayerScore = 1;
		if(!isdefined(weapon) || !killstreaks::is_killstreak_weapon(weapon))
		{
			allowPlayerScore = 1;
		}
		else
		{
			allowPlayerScore = killstreakWeaponsAllowedScore(event);
		}
		if(allowPlayerScore)
		{
			if(isdefined(level.scoreOnGivePlayerScore))
			{
				scoreGiven = [[level.scoreOnGivePlayerScore]](event, player, victim, undefined, weapon);
				isScoreEvent = scoreGiven > 0;
				if(isScoreEvent)
				{
					hero_restricted = is_hero_score_event_restricted(event);
					player ability_power::power_gain_event_score(victim, scoreGiven, weapon, hero_restricted);
				}
			}
		}
	}
	if(shouldAddRankXP(player) && GetDvarInt("teamOpsEnabled") == 0)
	{
		pickedup = 0;
		if(isdefined(weapon) && isdefined(player.pickedUpWeapons) && isdefined(player.pickedUpWeapons[weapon]))
		{
			pickedup = 1;
		}
		if(SessionModeIsCampaignGame())
		{
			xp_difficulty_multiplier = player gameskill::get_player_xp_difficulty_multiplier();
		}
		else
		{
			xp_difficulty_multiplier = 1;
		}
		player AddRankXp(event, weapon, player.class_num, pickedup, isScoreEvent, xp_difficulty_multiplier);
	}
	PixEndEvent();
	if(SessionModeIsCampaignGame() && isdefined(xp_difficulty_multiplier))
	{
		if(isdefined(victim) && isdefined(victim.team))
		{
			if(victim.team == "axis" || victim.team == "team3")
			{
				scoreGiven = scoreGiven * xp_difficulty_multiplier;
			}
		}
	}
	return scoreGiven;
}

/*
	Name: function_894a641e
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0xAB8
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 125
*/
function function_894a641e(event)
{
	if(event == "main_EE_quest")
	{
		thread function_93fcf581();
		level.zmAnnouncerPrefix = "";
		SetDvar("eeunlock_zod", "1");
	}
	if(event == "main_EE_quest_castle")
	{
		thread function_93fcf581();
		SetDvar("eeunlock_castle", "1");
	}
	if(event == "main_EE_quest_island")
	{
		thread function_93fcf581();
		SetDvar("eeunlock_island", "1");
	}
	if(event == "main_EE_quest_stalingrad")
	{
		thread function_93fcf581();
		SetDvar("eeunlock_gk", "1");
	}
	if(event == "main_EE_quest_genesis")
	{
		thread function_93fcf581();
		SetDvar("eeunlock_genesis", "1");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fbda0cb3
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0xC20
	Size: 0x2E8
	Parameters: 0
	Flags: None
	Line Number: 167
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
	foreach(player in GetPlayers())
	{
		if(player.score > 1000000)
		{
			return 0;
		}
		if(player GetWeaponAmmoStock(player GetCurrentWeapon()) > 1001 || player GetWeaponAmmoClip(player GetCurrentWeapon()) > 1001)
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
}

/*
	Name: function_8447df0
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0xF10
	Size: 0x468
	Parameters: 0
	Flags: None
	Line Number: 221
*/
function function_8447df0()
{
	time = 0;
	if(GetPlayers().size == 1)
	{
		switch(level.script)
		{
			case "zm_zod":
			{
				time = 1214000;
				break;
			}
			case "zm_castle":
			{
				time = 1600000;
				break;
			}
			case "zm_island":
			{
				time = 1305000;
				break;
			}
			case "zm_stalingrad":
			{
				time = 2013999;
				break;
			}
			case "zm_genesis":
			{
				time = 1489000;
				break;
			}
			case "zm_cosmodrome":
			{
				time = 399000;
				break;
			}
			case "zm_moon":
			{
				time = 1191000;
				break;
			}
			case "zm_temple":
			{
				time = 479000;
				break;
			}
			case "zm_tomb":
			{
				time = 2023000;
				break;
			}
		}
	}
	if(GetPlayers().size == 2)
	{
		switch(level.script)
		{
			case "zm_zod":
			{
				time = 1268000;
				break;
			}
			case "zm_castle":
			{
				time = 1214000;
				break;
			}
			case "zm_island":
			{
				time = 1084000;
				break;
			}
			case "zm_stalingrad":
			{
				time = 1797000;
				break;
			}
			case "zm_genesis":
			{
				time = 1108000;
				break;
			}
			case "zm_cosmodrome":
			{
				time = 399000;
				break;
			}
			case "zm_moon":
			{
				time = 1111000;
				break;
			}
			case "zm_temple":
			{
				time = 479000;
				break;
			}
			case "zm_tomb":
			{
				time = 1645000;
				break;
			}
		}
	}
	if(GetPlayers().size == 3)
	{
		switch(level.script)
		{
			case "zm_zod":
			{
				time = 1345000;
				break;
			}
			case "zm_castle":
			{
				time = 1449000;
				break;
			}
			case "zm_island":
			{
				time = 1020999;
				break;
			}
			case "zm_stalingrad":
			{
				time = 1676999;
				break;
			}
			case "zm_genesis":
			{
				time = 1010000;
				break;
			}
			case "zm_cosmodrome":
			{
				time = 399000;
				break;
			}
			case "zm_moon":
			{
				time = 1144000;
				break;
			}
			case "zm_temple":
			{
				time = 479000;
				break;
			}
			case "zm_tomb":
			{
				time = 1306000;
				break;
			}
		}
	}
	if(GetPlayers().size >= 4)
	{
		switch(level.script)
		{
			case "zm_zod":
			{
				time = 1577000;
				break;
			}
			case "zm_castle":
			{
				time = 1497999;
				break;
			}
			case "zm_island":
			{
				time = 989000;
				break;
			}
			case "zm_stalingrad":
			{
				time = 1612000;
				break;
			}
			case "zm_genesis":
			{
				time = 927000;
				break;
			}
			case "zm_cosmodrome":
			{
				time = 399000;
				break;
			}
			case "zm_moon":
			{
				time = 1195000;
				break;
			}
			case "zm_temple":
			{
				time = 479000;
				break;
			}
			case "zm_tomb":
			{
				time = 1192000;
				break;
			}
		}
	}
	if(GetTime() >= time)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

/*
	Name: function_93fcf581
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x1380
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 448
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
	Name: shouldAddRankXP
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x1558
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 485
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
	ERROR: Exception occured: Stack empty.
}

/*
	Name: uninterruptedObitFeedKills
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x1608
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 517
*/
function uninterruptedObitFeedKills(attacker, weapon)
{
	self endon("disconnect");
	self endon("death");
	wait(0.1);
	util::WaitTillSlowProcessAllowed();
	wait(0.1);
	processScoreEvent("uninterrupted_obit_feed_kills", attacker, self, weapon);
}

/*
	Name: isRegisteredEvent
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x1680
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 537
*/
function isRegisteredEvent(type)
{
	if(isdefined(level.scoreInfo[type]))
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

/*
	Name: decrementLastObituaryPlayerCountAfterFade
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x16B8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 559
*/
function decrementLastObituaryPlayerCountAfterFade()
{
	level endon("reset_obituary_count");
	wait(5);
	level.lastObituaryPlayerCount--;
	/#
		Assert(level.lastObituaryPlayerCount >= 0);
		return;
	#/
	ERROR: Bad function call
}

/*
	Name: getScoreEventTableName
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x1700
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 581
*/
function getScoreEventTableName()
{
	if(SessionModeIsCampaignGame())
	{
		return "gamedata/tables/cp/scoreInfo.csv";
	}
	else if(SessionModeIsZombiesGame())
	{
		return "gamedata/tables/zm/scoreInfo.csv";
	}
	else
	{
		return "gamedata/tables/mp/scoreInfo.csv";
	}
}

/*
	Name: getScoreEventTableID
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x1758
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 607
*/
function getScoreEventTableID()
{
	scoreInfoTableLoaded = 0;
	scoreInfoTableID = TableLookupFindCoreAsset(getScoreEventTableName());
	if(isdefined(scoreInfoTableID))
	{
		scoreInfoTableLoaded = 1;
	}
	/#
		Assert(scoreInfoTableLoaded, "Dev Block strings are not supported" + getScoreEventTableName());
	#/
	return scoreInfoTableID;
}

/*
	Name: getScoreEventColumn
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x17F8
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 631
*/
function getScoreEventColumn(gametype)
{
	columnOffset = getColumnOffsetForGametype(gametype);
	/#
		Assert(columnOffset >= 0);
	#/
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
	Offset: 0x1870
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 655
*/
function getXPEventColumn(gametype)
{
	columnOffset = getColumnOffsetForGametype(gametype);
	/#
		Assert(columnOffset >= 0);
	#/
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
	Offset: 0x18E8
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 678
*/
function getColumnOffsetForGametype(gametype)
{
	foundGameMode = 0;
	if(!isdefined(level.scoreEventTableID))
	{
		level.scoreEventTableID = getScoreEventTableID();
	}
	/#
		Assert(isdefined(level.scoreEventTableID));
	#/
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
	/#
		Assert(foundGameMode, "Dev Block strings are not supported" + gametype);
	#/
	return gameModeColumn;
}

/*
	Name: killstreakWeaponsAllowedScore
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x1A28
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 725
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
	else
	{
		return 0;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: is_hero_score_event_restricted
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x1AB0
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 753
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
	Offset: 0x1B10
	Size: 0x1F0
	Parameters: 2
	Flags: None
	Line Number: 772
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
	Offset: 0x1D08
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 817
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
	Offset: 0x1D50
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 836
*/
function register_hero_ability_multikill_event(event_func)
{
	if(!isdefined(level.hero_ability_multikill_events))
	{
		level.hero_ability_multikill_events = [];
	}
	level.hero_ability_multikill_events[level.hero_ability_multikill_events.size] = event_func;
}

/*
	Name: register_hero_weapon_multikill_event
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x1D98
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 855
*/
function register_hero_weapon_multikill_event(event_func)
{
	if(!isdefined(level.hero_weapon_multikill_events))
	{
		level.hero_weapon_multikill_events = [];
	}
	level.hero_weapon_multikill_events[level.hero_weapon_multikill_events.size] = event_func;
	return;
	waittillframeend;
}

/*
	Name: register_thief_shutdown_enemy_event
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x1DE0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 876
*/
function register_thief_shutdown_enemy_event()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: hero_ability_kill_event
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x1E28
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 896
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
	return;
}

/*
	Name: hero_ability_multikill_event
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x1EE8
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 922
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
}

/*
	Name: hero_weapon_multikill_event
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x1FA8
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 947
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
}

/*
	Name: thief_shutdown_enemy_event
	Namespace: scoreevents
	Checksum: 0x424F4353
	Offset: 0x2068
	Size: 0x9C
	Parameters: 0
	Flags: None
	Line Number: 972
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

