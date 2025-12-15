#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\hud_message_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_stats;
#include scripts\zm\gametypes\_globallogic;
#include scripts\zm\gametypes\_globallogic_audio;
#include scripts\zm\gametypes\_globallogic_defaults;
#include scripts\zm\gametypes\_globallogic_player;
#include scripts\zm\gametypes\_globallogic_score;
#include scripts\zm\gametypes\_globallogic_ui;
#include scripts\zm\gametypes\_globallogic_utils;
#include scripts\zm\gametypes\_hostmigration;
#include scripts\zm\gametypes\_spawning;
#include scripts\zm\gametypes\_spawnlogic;
#include scripts\zm\gametypes\_spectating;

#namespace globallogic_spawn;

/*
	Name: init
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x8A0
	Size: 0x28
	Parameters: 0
	Flags: AutoExec
	Line Number: 33
*/
function autoexec init()
{
	if(!isdefined(level.giveStartLoadout))
	{
		level.giveStartLoadout = &giveStartLoadout;
	}
}

/*
	Name: timeUntilSpawn
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x8D0
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 51
*/
function timeUntilSpawn(includeTeamkillDelay)
{
	if(level.inGracePeriod && !self.hasSpawned)
	{
		return 0;
	}
	respawnDelay = 0;
	if(self.hasSpawned)
	{
		result = self [[level.onRespawnDelay]]();
		if(isdefined(result))
		{
			respawnDelay = result;
		}
		else
		{
			respawnDelay = level.playerRespawnDelay;
		}
		if(includeTeamkillDelay && (isdefined(self.teamKillPunish) && self.teamKillPunish))
		{
			respawnDelay = respawnDelay + globallogic_player::teamKillDelay();
		}
	}
	waveBased = level.waveRespawnDelay > 0;
	if(waveBased)
	{
		return self TimeUntilWaveSpawn(respawnDelay);
	}
	return respawnDelay;
}

/*
	Name: allTeamsHaveExisted
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x9D8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function allTeamsHaveExisted()
{
	foreach(team in level.teams)
	{
		if(!level.everExisted[team])
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: maySpawn
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0xA70
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 114
*/
function maySpawn()
{
	if(isdefined(level.playerMaySpawn) && !self [[level.playerMaySpawn]]())
	{
		return 0;
	}
	if(level.inOvertime)
	{
		return 0;
	}
	if(level.playerQueuedRespawn && !isdefined(self.allowQueueSpawn) && !level.inGracePeriod && !level.useStartSpawns)
	{
		return 0;
	}
	if(level.numLives)
	{
		if(level.teambased)
		{
			gameHasStarted = allTeamsHaveExisted();
		}
		else
		{
			gameHasStarted = level.MaxPlayerCount > 1 || (!util::isOneRound() && !util::isFirstRound());
		}
		if(!self.pers["lives"] && gameHasStarted)
		{
			return 0;
		}
		if(gameHasStarted)
		{
			if(!level.inGracePeriod && !self.hasSpawned && !level.wagerMatch)
			{
				return 0;
			}
		}
	}
	return 1;
}

/*
	Name: TimeUntilWaveSpawn
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0xBC0
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 163
*/
function TimeUntilWaveSpawn(minimumWait)
{
	earliestSpawnTime = GetTime() + minimumWait * 1000;
	lastWaveTime = level.lastWave[self.pers["team"]];
	waveDelay = level.waveDelay[self.pers["team"]] * 1000;
	if(waveDelay == 0)
	{
		return 0;
	}
	numWavesPassedEarliestSpawnTime = earliestSpawnTime - lastWaveTime / waveDelay;
	numWaves = ceil(numWavesPassedEarliestSpawnTime);
	timeOfSpawn = lastWaveTime + numWaves * waveDelay;
	if(isdefined(self.waveSpawnIndex))
	{
		timeOfSpawn = timeOfSpawn + 50 * self.waveSpawnIndex;
	}
	return timeOfSpawn - GetTime() / 1000;
}

/*
	Name: stopPoisoningAndFlareOnSpawn
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0xCF0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 192
*/
function stopPoisoningAndFlareOnSpawn()
{
	self endon("disconnect");
	self.inPoisonArea = 0;
	self.inBurnArea = 0;
	self.inFlareVisionArea = 0;
	self.inGroundNapalm = 0;
	return;
}

/*
	Name: spawnPlayerPrediction
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0xD38
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 212
*/
function spawnPlayerPrediction()
{
	self endon("disconnect");
	self endon("end_respawn");
	self endon("game_ended");
	self endon("joined_spectators");
	self endon("spawned");
	while(1)
	{
		wait(0.5);
		if(isdefined(level.onSpawnPlayerUnified) && GetDvarInt("scr_disableunifiedspawning") == 0)
		{
			Spawning::onSpawnPlayer_Unified(1);
		}
		else
		{
			self [[level.onSpawnPlayer]](1);
		}
	}
}

/*
	Name: giveLoadoutLevelSpecific
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0xDF0
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 243
*/
function giveLoadoutLevelSpecific(team, _class)
{
	PixBeginEvent("giveLoadoutLevelSpecific");
	if(isdefined(level.giveCustomCharacters))
	{
		self [[level.giveCustomCharacters]]();
	}
	if(isdefined(level.giveStartLoadout))
	{
		self [[level.giveStartLoadout]]();
	}
	self flagsys::set("loadout_given");
	callback::callback("hash_33bba039");
	PixEndEvent();
	return;
}

/*
	Name: giveStartLoadout
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0xEA8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 270
*/
function giveStartLoadout()
{
	if(isdefined(level.giveCustomLoadout))
	{
		self [[level.giveCustomLoadout]]();
	}
}

/*
	Name: spawnPlayer
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0xED0
	Size: 0xD20
	Parameters: 0
	Flags: None
	Line Number: 288
*/
function spawnPlayer()
{
	PixBeginEvent("spawnPlayer_preUTS");
	self endon("disconnect");
	self endon("joined_spectators");
	self notify("spawned");
	level notify("player_spawned");
	self notify("end_respawn");
	self setSpawnVariables();
	self LUINotifyEvent(&"player_spawned", 0);
	if(!self.hasSpawned)
	{
		self.underscoreChance = 70;
		self thread globallogic_audio::sndStartMusicSystem();
	}
	self.sessionteam = self.team;
	hadSpawned = self.hasSpawned;
	self.sessionstate = "playing";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psOffsetTime = 0;
	self.statusicon = "";
	self.damagedPlayers = [];
	if(GetDvarInt("scr_csmode") > 0)
	{
		self.maxhealth = GetDvarInt("scr_csmode");
	}
	else
	{
		self.maxhealth = level.playerMaxHealth;
	}
	self.health = self.maxhealth;
	self.friendlydamage = undefined;
	self.hasSpawned = 1;
	self.spawntime = GetTime();
	self.afk = 0;
	if(self.pers["lives"] && (!isdefined(level.takeLivesOnDeath) || level.takeLivesOnDeath == 0))
	{
		self.pers["lives"]--;
		if(self.pers["lives"] == 0)
		{
			level notify("player_eliminated");
			self notify("player_eliminated");
		}
	}
	self.laststand = undefined;
	self.revivingTeammate = 0;
	self.burning = undefined;
	self.nextKillstreakFree = undefined;
	self.activeUAVs = 0;
	self.activeCounterUAVs = 0;
	self.activeSatellites = 0;
	self.deathMachineKills = 0;
	self.disabledWeapon = 0;
	self util::resetUsability();
	self globallogic_player::resetAttackerList();
	self.diedOnVehicle = undefined;
	if(!self.wasAliveAtMatchStart)
	{
		if(level.inGracePeriod || globallogic_utils::getTimePassed() < 20000)
		{
			self.wasAliveAtMatchStart = 1;
		}
	}
	self setDepthOfField(0, 0, 512, 512, 4, 0);
	self resetFov();
	PixBeginEvent("onSpawnPlayer");
	if(isdefined(level.onSpawnPlayerUnified) && GetDvarInt("scr_disableunifiedspawning") == 0)
	{
		self [[level.onSpawnPlayerUnified]]();
	}
	else
	{
		self [[level.onSpawnPlayer]](0);
	}
	if(isdefined(level.playerSpawnedCB))
	{
		self [[level.playerSpawnedCB]]();
	}
	PixEndEvent();
	PixEndEvent();
	level thread globallogic::updateTeamStatus();
	PixBeginEvent("spawnPlayer_postUTS");
	self thread stopPoisoningAndFlareOnSpawn();
	/#
		/#
			Assert(globallogic_utils::isValidClass(self.curClass));
		#/
	#/
	self giveLoadoutLevelSpecific(self.team, self.curClass);
	if(level.inPrematchPeriod)
	{
		self util::freeze_player_controls(1);
		team = self.pers["team"];
		if(isdefined(self.pers["music"].spawn) && self.pers["music"].spawn == 0)
		{
			if(level.wagerMatch)
			{
				music = "SPAWN_WAGER";
			}
			else
			{
				music = game["music"]["spawn_" + team];
			}
			self thread globallogic_audio::set_music_on_player(music, 0, 0);
			self.pers["music"].spawn = 1;
		}
		if(level.splitscreen)
		{
			if(isdefined(level.playedStartingMusic))
			{
				music = undefined;
			}
			else
			{
				level.playedStartingMusic = 1;
			}
		}
		if(!isdefined(level.disablePrematchMessages) || level.disablePrematchMessages == 0)
		{
			thread hud_message::showInitialFactionPopup(team);
			hintMessage = util::getObjectiveHintText(self.pers["team"]);
			if(isdefined(hintMessage))
			{
				self thread hud_message::hintMessage(hintMessage);
			}
			if(isdefined(game["dialog"]["gametype"]) && (!level.splitscreen || self == level.players[0]))
			{
				if(!isdefined(level.inFinalFight) || !level.inFinalFight)
				{
					if(level.hardcoreMode)
					{
						self globallogic_audio::leaderDialogOnPlayer("gametype_hardcore");
					}
					else
					{
						self globallogic_audio::leaderDialogOnPlayer("gametype");
					}
				}
			}
			if(team == game["attackers"])
			{
				self globallogic_audio::leaderDialogOnPlayer("offense_obj", "introboost");
			}
			else
			{
				self globallogic_audio::leaderDialogOnPlayer("defense_obj", "introboost");
			}
		}
	}
	else
	{
		self util::freeze_player_controls(0);
		self enableWeapons();
		if(!hadSpawned && game["state"] == "playing")
		{
			PixBeginEvent("sound");
			team = self.team;
			if(isdefined(self.pers["music"].spawn) && self.pers["music"].spawn == 0)
			{
				self thread globallogic_audio::set_music_on_player("SPAWN_SHORT", 0, 0);
				self.pers["music"].spawn = 1;
			}
			if(level.splitscreen)
			{
				if(isdefined(level.playedStartingMusic))
				{
					music = undefined;
				}
				else
				{
					level.playedStartingMusic = 1;
				}
			}
			if(!isdefined(level.disablePrematchMessages) || level.disablePrematchMessages == 0)
			{
				thread hud_message::showInitialFactionPopup(team);
				hintMessage = util::getObjectiveHintText(self.pers["team"]);
				if(isdefined(hintMessage))
				{
					self thread hud_message::hintMessage(hintMessage);
				}
				if(isdefined(game["dialog"]["gametype"]) && (!level.splitscreen || self == level.players[0]))
				{
					if(!isdefined(level.inFinalFight) || !level.inFinalFight)
					{
						if(level.hardcoreMode)
						{
							self globallogic_audio::leaderDialogOnPlayer("gametype_hardcore");
						}
						else
						{
							self globallogic_audio::leaderDialogOnPlayer("gametype");
						}
					}
				}
				if(team == game["attackers"])
				{
					self globallogic_audio::leaderDialogOnPlayer("offense_obj", "introboost");
				}
				else
				{
					self globallogic_audio::leaderDialogOnPlayer("defense_obj", "introboost");
				}
			}
			PixEndEvent();
		}
	}
	if(GetDvarString("scr_showperksonspawn") == "")
	{
		SetDvar("scr_showperksonspawn", "0");
	}
	if(level.hardcoreMode)
	{
		SetDvar("scr_showperksonspawn", "0");
	}
	if(!level.splitscreen && GetDvarInt("scr_showperksonspawn") == 1 && game["state"] != "postgame")
	{
		PixBeginEvent("showperksonspawn");
		if(level.perksEnabled == 1)
		{
			self hud::showPerks();
		}
		PixEndEvent();
	}
	if(isdefined(self.pers["momentum"]))
	{
		self.momentum = self.pers["momentum"];
	}
	PixEndEvent();
	waittillframeend;
	self notify("spawned_player");
	self callback::callback("hash_bc12b61f");
	/#
		print("Dev Block strings are not supported" + self.origin[0] + "Dev Block strings are not supported" + self.origin[1] + "Dev Block strings are not supported" + self.origin[2] + "Dev Block strings are not supported");
	#/
	SetDvar("scr_selecting_location", "");
	/#
		if(GetDvarInt("Dev Block strings are not supported") > 0)
		{
			self thread globallogic_score::xpRateThread();
		}
	#/
	self zm_perks::perk_set_max_health_if_jugg("health_reboot", 1, 0);
	if(game["state"] == "postgame")
	{
		/#
			/#
				Assert(!level.intermission);
			#/
		#/
		self globallogic_player::freezePlayerForRoundEnd();
	}
	if(level.script != "zm_moon")
	{
		self util::set_lighting_state();
	}
	self util::set_sun_shadow_split_distance();
}

/*
	Name: spawnSpectator
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x1BF8
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 559
*/
function spawnSpectator(origin, angles)
{
	self notify("spawned");
	self notify("end_respawn");
	in_spawnSpectator(origin, angles);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: respawn_asSpectator
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x1C50
	Size: 0x30
	Parameters: 2
	Flags: None
	Line Number: 578
*/
function respawn_asSpectator(origin, angles)
{
	in_spawnSpectator(origin, angles);
}

/*
	Name: in_spawnSpectator
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x1C88
	Size: 0x190
	Parameters: 2
	Flags: None
	Line Number: 593
*/
function in_spawnSpectator(origin, angles)
{
	pixmarker("BEGIN: in_spawnSpectator");
	self setSpawnVariables();
	if(self.pers["team"] == "spectator")
	{
		self util::clearLowerMessage();
	}
	self.sessionstate = "spectator";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psOffsetTime = 0;
	self.friendlydamage = undefined;
	if(self.pers["team"] == "spectator")
	{
		self.statusicon = "";
	}
	else
	{
		self.statusicon = "hud_status_dead";
	}
	spectating::setSpectatePermissionsForMachine();
	[[level.onSpawnSpectator]](origin, angles);
	if(level.teambased && !level.splitscreen)
	{
		self thread spectatorThirdPersonness();
	}
	level thread globallogic::updateTeamStatus();
	pixmarker("END: in_spawnSpectator");
}

/*
	Name: spectatorThirdPersonness
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x1E20
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 635
*/
function spectatorThirdPersonness()
{
	self endon("disconnect");
	self endon("spawned");
	self notify("spectator_thirdperson_thread");
	self endon("spectator_thirdperson_thread");
	self.spectatingThirdPerson = 0;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: forceSpawn
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x1E68
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 656
*/
function forceSpawn(time)
{
	self endon("death");
	self endon("disconnect");
	self endon("spawned");
	if(!isdefined(time))
	{
		time = 60;
	}
	wait(time);
	if(self.hasSpawned)
	{
		return;
	}
	if(self.pers["team"] == "spectator")
	{
		return;
	}
	if(!globallogic_utils::isValidClass(self.pers["class"]))
	{
		self.pers["class"] = "CLASS_CUSTOM1";
		self.curClass = self.pers["class"];
	}
	self globallogic_ui::closeMenus();
	self thread [[level.spawnClient]]();
}

/*
	Name: kickIfDontSpawn
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x1F68
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 693
*/
function kickIfDontSpawn()
{
	/#
		if(GetDvarInt("Dev Block strings are not supported") == 1)
		{
			return;
		}
	#/
	if(self IsHost())
	{
		return;
	}
	self kickIfIDontSpawnInternal();
}

/*
	Name: kickIfIDontSpawnInternal
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x1FD0
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 718
*/
function kickIfIDontSpawnInternal()
{
	self endon("death");
	self endon("disconnect");
	self endon("spawned");
	waittime = 90;
	if(GetDvarString("scr_kick_time") != "")
	{
		waittime = GetDvarFloat("scr_kick_time");
	}
	minTime = 45;
	if(GetDvarString("scr_kick_mintime") != "")
	{
		minTime = GetDvarFloat("scr_kick_mintime");
	}
	startTime = GetTime();
	kickWait(waittime);
	timePassed = GetTime() - startTime / 1000;
	if(timePassed < waittime - 0.1 && timePassed < minTime)
	{
		return;
	}
	if(self.hasSpawned)
	{
		return;
	}
	if(SessionModeIsPrivate())
	{
		return;
	}
	if(self.pers["team"] == "spectator")
	{
		return;
	}
	kick(self GetEntityNumber());
}

/*
	Name: kickWait
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x2180
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 765
*/
function kickWait(waittime)
{
	level endon("game_ended");
	hostmigration::waitLongDurationWithHostMigrationPause(waittime);
}

/*
	Name: spawnInterRoundIntermission
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x21B8
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 781
*/
function spawnInterRoundIntermission()
{
	self notify("spawned");
	self notify("end_respawn");
	self setSpawnVariables();
	self util::clearLowerMessage();
	self util::freeze_player_controls(0);
	self.sessionstate = "spectator";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psOffsetTime = 0;
	self.friendlydamage = undefined;
	self globallogic_defaults::default_onSpawnIntermission();
	self SetOrigin(self.origin);
	self SetPlayerAngles(self.angles);
	self setDepthOfField(0, 128, 512, 4000, 6, 1.8);
}

/*
	Name: spawnIntermission
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x22F8
	Size: 0x238
	Parameters: 1
	Flags: None
	Line Number: 810
*/
function spawnIntermission(useDefaultCallback)
{
	self notify("spawned");
	self notify("end_respawn");
	self endon("disconnect");
	self setSpawnVariables();
	self util::clearLowerMessage();
	self util::freeze_player_controls(0);
	if(level.rankedMatch && util::wasLastRound())
	{
		if(self.postGameMilestones || self.postGameContracts || self.postGamePromotion)
		{
			if(self.postGamePromotion)
			{
				self playlocalsound("mus_level_up");
			}
			else if(self.postGameContracts)
			{
				self playlocalsound("mus_challenge_complete");
			}
			else if(self.postGameMilestones)
			{
				self playlocalsound("mus_contract_complete");
			}
			self closeInGameMenu();
			for(waittime = 4; waittime; waittime = 4)
			{
				wait(0.25);
			}
		}
	}
	self.sessionstate = "intermission";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psOffsetTime = 0;
	self.friendlydamage = undefined;
	if(isdefined(useDefaultCallback) && useDefaultCallback)
	{
		globallogic_defaults::default_onSpawnIntermission();
	}
	else
	{
		[[level.onSpawnIntermission]]();
	}
	self setDepthOfField(0, 128, 512, 4000, 6, 1.8);
}

/*
	Name: spawnQueuedClientOnTeam
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x2538
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 868
*/
function spawnQueuedClientOnTeam(team)
{
	player_to_spawn = undefined;
	for(i = 0; i < level.deadPlayers[team].size; i++)
	{
		player = level.deadPlayers[team][i];
		if(player.waitingToSpawn)
		{
			continue;
		}
		player_to_spawn = player;
		break;
	}
	if(isdefined(player_to_spawn))
	{
		player_to_spawn.allowQueueSpawn = 1;
		player_to_spawn globallogic_ui::closeMenus();
		player_to_spawn thread [[level.spawnClient]]();
	}
}

/*
	Name: spawnQueuedClient
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x2618
	Size: 0x158
	Parameters: 2
	Flags: None
	Line Number: 899
*/
function spawnQueuedClient(dead_player_team, killer)
{
	if(!level.playerQueuedRespawn)
	{
		return;
	}
	util::WaitTillSlowProcessAllowed();
	spawn_team = undefined;
	if(isdefined(killer) && isdefined(killer.team) && isdefined(level.teams[killer.team]))
	{
		spawn_team = killer.team;
	}
	if(isdefined(spawn_team))
	{
		spawnQueuedClientOnTeam(spawn_team);
		return;
	}
	foreach(team in level.teams)
	{
		if(team == dead_player_team)
		{
			continue;
		}
		spawnQueuedClientOnTeam(team);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: allTeamsNearScoreLimit
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x2778
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 938
*/
function allTeamsNearScoreLimit()
{
	if(!level.teambased)
	{
		return 0;
	}
	if(level.scoreLimit <= 1)
	{
		return 0;
	}
	foreach(team in level.teams)
	{
		if(!game["teamScores"][team] >= level.scoreLimit - 1)
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: shouldShowRespawnMessage
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x2848
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 968
*/
function shouldShowRespawnMessage()
{
	if(util::wasLastRound())
	{
		return 0;
	}
	if(util::isOneRound())
	{
		return 0;
	}
	if(isdefined(level.livesDoNotReset) && level.livesDoNotReset)
	{
		return 0;
	}
	if(allTeamsNearScoreLimit())
	{
		return 0;
	}
	return 1;
}

/*
	Name: default_spawnMessage
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x28C0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 999
*/
function default_spawnMessage()
{
	util::setLowerMessage(game["strings"]["spawn_next_round"]);
	self thread globallogic_ui::removeSpawnMessageShortly(3);
}

/*
	Name: showSpawnMessage
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x2910
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1015
*/
function showSpawnMessage()
{
	if(shouldShowRespawnMessage())
	{
		self thread [[level.spawnMessage]]();
	}
}

/*
	Name: spawnClient
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x2940
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 1033
*/
function spawnClient(timeAlreadyPassed)
{
	PixBeginEvent("spawnClient");
	/#
		/#
			Assert(isdefined(self.team));
		#/
	#/
	/#
		/#
			Assert(globallogic_utils::isValidClass(self.curClass));
		#/
	#/
	if(!self maySpawn())
	{
		currentorigin = self.origin;
		currentangles = self.angles;
		self showSpawnMessage();
		self thread [[level.spawnSpectator]](currentorigin + VectorScale((0, 0, 1), 60), currentangles);
		PixEndEvent();
		return;
	}
	if(self.waitingToSpawn)
	{
		PixEndEvent();
		return;
	}
	self.waitingToSpawn = 1;
	self.allowQueueSpawn = undefined;
	self waitAndSpawnClient(timeAlreadyPassed);
	if(isdefined(self))
	{
		self.waitingToSpawn = 0;
	}
	PixEndEvent();
}

/*
	Name: waitAndSpawnClient
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x2AD0
	Size: 0x4C0
	Parameters: 1
	Flags: None
	Line Number: 1080
*/
function waitAndSpawnClient(timeAlreadyPassed)
{
	self endon("disconnect");
	self endon("end_respawn");
	level endon("game_ended");
	if(!isdefined(timeAlreadyPassed))
	{
		timeAlreadyPassed = 0;
	}
	spawnedAsSpectator = 0;
	if(isdefined(self.teamKillPunish) && self.teamKillPunish)
	{
		teamKillDelay = globallogic_player::teamKillDelay();
		if(teamKillDelay > timeAlreadyPassed)
		{
			teamKillDelay = teamKillDelay - timeAlreadyPassed;
			timeAlreadyPassed = 0;
		}
		else
		{
			timeAlreadyPassed = timeAlreadyPassed - teamKillDelay;
			teamKillDelay = 0;
		}
		if(teamKillDelay > 0)
		{
			util::setLowerMessage(&"MP_FRIENDLY_FIRE_WILL_NOT", teamKillDelay);
			self thread respawn_asSpectator(self.origin + VectorScale((0, 0, 1), 60), self.angles);
			spawnedAsSpectator = 1;
			wait(teamKillDelay);
		}
		self.teamKillPunish = 0;
	}
	if(!isdefined(self.waveSpawnIndex) && isdefined(level.wavePlayerSpawnIndex[self.team]))
	{
		self.waveSpawnIndex = level.wavePlayerSpawnIndex[self.team];
		level.wavePlayerSpawnIndex[self.team]++;
	}
	timeUntilSpawn = timeUntilSpawn(0);
	if(timeUntilSpawn > timeAlreadyPassed)
	{
		timeUntilSpawn = timeUntilSpawn - timeAlreadyPassed;
		timeAlreadyPassed = 0;
	}
	else
	{
		timeAlreadyPassed = timeAlreadyPassed - timeUntilSpawn;
		timeUntilSpawn = 0;
	}
	if(timeUntilSpawn > 0)
	{
		if(level.playerQueuedRespawn)
		{
			util::setLowerMessage(game["strings"]["you_will_spawn"], timeUntilSpawn);
		}
		else if(self IsSplitscreen())
		{
			util::setLowerMessage(game["strings"]["waiting_to_spawn_ss"], timeUntilSpawn, 1);
		}
		else
		{
			util::setLowerMessage(game["strings"]["waiting_to_spawn"], timeUntilSpawn);
		}
		if(!spawnedAsSpectator)
		{
			spawnOrigin = self.origin + VectorScale((0, 0, 1), 60);
			spawnAngles = self.angles;
			if(isdefined(level.useIntermissionPointsOnWaveSpawn) && [[level.useIntermissionPointsOnWaveSpawn]]() == 1)
			{
				spawnpoint = spawnlogic::getRandomIntermissionPoint();
				if(isdefined(spawnpoint))
				{
					spawnOrigin = spawnpoint.origin;
					spawnAngles = spawnpoint.angles;
				}
			}
			self thread respawn_asSpectator(spawnOrigin, spawnAngles);
		}
		spawnedAsSpectator = 1;
		self globallogic_utils::waitForTimeOrNotify(timeUntilSpawn, "force_spawn");
		self notify("stop_wait_safe_spawn_button");
	}
	waveBased = level.waveRespawnDelay > 0;
	if(!level.playerForceRespawn && self.hasSpawned && !waveBased && !self.wantSafeSpawn && !level.playerQueuedRespawn)
	{
		util::setLowerMessage(game["strings"]["press_to_spawn"]);
		if(!spawnedAsSpectator)
		{
			self thread respawn_asSpectator(self.origin + VectorScale((0, 0, 1), 60), self.angles);
		}
		spawnedAsSpectator = 1;
		self waitRespawnOrSafeSpawnButton();
	}
	self.waitingToSpawn = 0;
	self util::clearLowerMessage();
	self.waveSpawnIndex = undefined;
	self.respawnTimerStartTime = undefined;
	self thread [[level.spawnPlayer]]();
}

/*
	Name: waitRespawnOrSafeSpawnButton
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x2F98
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1189
*/
function waitRespawnOrSafeSpawnButton()
{
	self endon("disconnect");
	self endon("end_respawn");
	while(1)
	{
		if(self useButtonPressed())
		{
			break;
		}
		wait(0.05);
	}
}

/*
	Name: waitInSpawnQueue
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x2FE8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1213
*/
function waitInSpawnQueue()
{
	self endon("disconnect");
	self endon("end_respawn");
	if(!level.inGracePeriod && !level.useStartSpawns)
	{
		currentorigin = self.origin;
		currentangles = self.angles;
		self thread [[level.spawnSpectator]](currentorigin + VectorScale((0, 0, 1), 60), currentangles);
		self waittill("queue_respawn");
	}
}

/*
	Name: setThirdPerson
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x3080
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 1236
*/
function setThirdPerson(value)
{
	if(!level.console)
	{
		return;
	}
	if(!isdefined(self.spectatingThirdPerson) || value != self.spectatingThirdPerson)
	{
		self.spectatingThirdPerson = value;
		if(value)
		{
			self SetClientThirdPerson(1);
			self setDepthOfField(0, 128, 512, 4000, 6, 1.8);
		}
		else
		{
			self SetClientThirdPerson(0);
			self setDepthOfField(0, 0, 512, 4000, 4, 0);
		}
		self resetFov();
	}
}

/*
	Name: setSpawnVariables
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x3178
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1269
*/
function setSpawnVariables()
{
	resetTimeout();
	self StopShellshock();
	self StopRumble("damage_heavy");
}

/*
	Name: function_b5b44c4b
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x31D0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1286
*/
function function_b5b44c4b()
{
	self notify("hash_b5b44c4b");
	self endon("hash_b5b44c4b");
	self endon("disconnect");
	wait(0.31);
	iprintln(&"MP_CONNECTED", self);
	return;
	waittillframeend;
}

/*
	Name: function_83515e3d
	Namespace: globallogic_spawn
	Checksum: 0x424F4353
	Offset: 0x3228
	Size: 0xEFC
	Parameters: 0
	Flags: None
	Line Number: 1307
*/
function function_83515e3d()
{
	self notify("hash_83515e3d");
	self endon("hash_83515e3d");
	self endon("disconnect");
	thread globallogic_player::notifyConnecting();
	self.statusicon = "hud_status_connecting";
	self waittill("begin");
	if(isdefined(level.reset_clientdvars))
	{
		self [[level.reset_clientdvars]]();
		waittillframeend;
	}
	self.statusicon = "";
	self.guid = self getGuid();
	profilelog_begintiming(4, "ship");
	level notify("connected", self);
	if(self IsHost())
	{
		self thread globallogic::listenForGameEnd();
	}
	if(!level.splitscreen && !isdefined(self.pers["score"]))
	{
		self thread function_b5b44c4b();
	}
	if(!isdefined(self.pers["score"]))
	{
		self thread zm_stats::adjustRecentStats();
	}
	if(GameModeIsMode(0) && !isdefined(self.pers["matchesPlayedStatsTracked"]))
	{
		gamemode = util::GetCurrentGameMode();
		self globallogic::IncrementMatchCompletionStat(gamemode, "played", "started");
		if(!isdefined(self.pers["matchesHostedStatsTracked"]) && self IsLocalToHost())
		{
			self globallogic::IncrementMatchCompletionStat(gamemode, "hosted", "started");
			self.pers["matchesHostedStatsTracked"] = 1;
		}
		self.pers["matchesPlayedStatsTracked"] = 1;
		self thread zm_stats::uploadStatsSoon();
	}
	lpselfnum = self GetEntityNumber();
	lpGuid = self getGuid();
	lpXuid = self getXuid(1);
	logPrint("J;" + lpGuid + ";" + lpselfnum + ";" + self.name + "\n");
	bbPrint("global_joins", "name %s client %s xuid %s", self.name, lpselfnum, lpXuid);
	if(!SessionModeIsZombiesGame())
	{
		self setClientUIVisibilityFlag("hud_visible", 1);
		self setClientUIVisibilityFlag("weapon_hud_visible", 1);
	}
	if(level.forceradar == 1)
	{
		self.pers["hasRadar"] = 1;
		self.hasSpyplane = 1;
		level.activeUAVs[self GetEntityNumber()] = 1;
	}
	if(level.forceradar == 2)
	{
		self setClientUIVisibilityFlag("g_compassShowEnemies", level.forceradar);
	}
	else
	{
		self setClientUIVisibilityFlag("g_compassShowEnemies", 0);
	}
	self SetClientPlayerSprintTime(level.playerSprintTime);
	self SetClientNumLives(level.numLives);
	if(level.hardcoreMode)
	{
		self SetClientDrawTalk(3);
	}
	self [[level.player_stats_init]]();
	self.killedPlayersCurrent = [];
	if(!isdefined(self.pers["best_kill_streak"]))
	{
		self.pers["killed_players"] = [];
		self.pers["killed_by"] = [];
		self.pers["nemesis_tracking"] = [];
		self.pers["artillery_kills"] = 0;
		self.pers["dog_kills"] = 0;
		self.pers["nemesis_name"] = "";
		self.pers["nemesis_rank"] = 0;
		self.pers["nemesis_rankIcon"] = 0;
		self.pers["nemesis_xp"] = 0;
		self.pers["nemesis_xuid"] = "";
		self.pers["best_kill_streak"] = 0;
	}
	if(!isdefined(self.pers["music"]))
	{
		self.pers["music"] = spawnstruct();
		self.pers["music"].spawn = 0;
		self.pers["music"].inque = 0;
		self.pers["music"].currentstate = "SILENT";
		self.pers["music"].previousState = "SILENT";
		self.pers["music"].nextstate = "UNDERSCORE";
		self.pers["music"].returnState = "UNDERSCORE";
	}
	self.leaderDialogQueue = [];
	self.leaderDialogActive = 0;
	self.leaderDialogGroups = [];
	self.currentLeaderDialogGroup = "";
	self.currentLeaderDialog = "";
	self.currentLeaderDialogTime = 0;
	if(!isdefined(self.pers["cur_kill_streak"]))
	{
		self.pers["cur_kill_streak"] = 0;
	}
	if(!isdefined(self.pers["cur_total_kill_streak"]))
	{
		self.pers["cur_total_kill_streak"] = 0;
		self setplayercurrentstreak(0);
	}
	if(!isdefined(self.pers["totalKillstreakCount"]))
	{
		self.pers["totalKillstreakCount"] = 0;
	}
	if(!isdefined(self.pers["killstreaksEarnedThisKillstreak"]))
	{
		self.pers["killstreaksEarnedThisKillstreak"] = 0;
	}
	if(isdefined(level.usingScoreStreaks) && level.usingScoreStreaks && !isdefined(self.pers["killstreak_quantity"]))
	{
		self.pers["killstreak_quantity"] = [];
	}
	if(isdefined(level.usingScoreStreaks) && level.usingScoreStreaks && !isdefined(self.pers["held_killstreak_ammo_count"]))
	{
		self.pers["held_killstreak_ammo_count"] = [];
	}
	self.lastKillTime = 0;
	self.cur_death_streak = 0;
	self disabledeathstreak();
	self.death_streak = 0;
	self.kill_streak = 0;
	self.gametype_kill_streak = 0;
	self.spawnQueueIndex = -1;
	self.deathtime = 0;
	self.lastGrenadeSuicideTime = -1;
	self.teamkillsThisRound = 0;
	if(!isdefined(level.livesDoNotReset) || !level.livesDoNotReset || !isdefined(self.pers["lives"]))
	{
		self.pers["lives"] = level.numLives;
	}
	if(!level.teambased)
	{
		self.pers["team"] = undefined;
	}
	self.hasSpawned = 0;
	self.waitingToSpawn = 0;
	self.wantSafeSpawn = 0;
	self.deathCount = 0;
	self.wasAliveAtMatchStart = 0;
	level.players[level.players.size] = self;
	if(level.splitscreen)
	{
		SetDvar("splitscreen_playerNum", level.players.size);
	}
	if(game["state"] == "postgame")
	{
		self.pers["needteam"] = 1;
		self.pers["team"] = "spectator";
		self.team = "spectator";
		self.sessionteam = "spectator";
		self setClientUIVisibilityFlag("hud_visible", 0);
		self [[level.spawnIntermission]]();
		self closeInGameMenu();
		profilelog_endtiming(4, "gs=" + game["state"] + " zom=" + SessionModeIsZombiesGame());
		return;
	}
	level endon("game_ended");
	if(isdefined(level.hostMigrationTimer))
	{
		self thread hostmigration::hostMigrationTimerThink();
	}
	if(level.oldschool)
	{
		self.pers["class"] = undefined;
		self.curClass = self.pers["class"];
	}
	if(isdefined(self.pers["team"]))
	{
		self.team = self.pers["team"];
	}
	if(isdefined(self.pers["class"]))
	{
		self.curClass = self.pers["class"];
	}
	if(!isdefined(self.pers["team"]) || isdefined(self.pers["needteam"]))
	{
		self.pers["needteam"] = undefined;
		self.pers["team"] = "spectator";
		self.team = "spectator";
		self.sessionstate = "dead";
		self globallogic_ui::updateObjectiveText();
		[[level.spawnSpectator]]();
		if(level.rankedMatch)
		{
			[[level.autoassign]](0);
			self thread kickIfDontSpawn();
		}
		else
		{
			[[level.autoassign]](0);
		}
		if(self.pers["team"] == "spectator")
		{
			self.sessionteam = "spectator";
			self thread globallogic_player::spectate_player_watcher();
		}
		if(level.teambased)
		{
			self.sessionteam = self.pers["team"];
			if(!isalive(self))
			{
				self.statusicon = "hud_status_dead";
			}
			self thread spectating::setSpectatePermissions();
		}
	}
	else if(self.pers["team"] == "spectator")
	{
		self SetClientScriptMainMenu(game["menu_start_menu"]);
		[[level.spawnSpectator]]();
		self.sessionteam = "spectator";
		self.sessionstate = "spectator";
		self thread globallogic_player::spectate_player_watcher();
	}
	else
	{
		self.sessionteam = self.pers["team"];
		self.sessionstate = "dead";
		self globallogic_ui::updateObjectiveText();
		[[level.spawnSpectator]]();
		if(globallogic_utils::isValidClass(self.pers["class"]))
		{
			self thread [[level.spawnClient]]();
		}
		else
		{
			self globallogic_ui::showMainMenuForTeam();
		}
		self thread spectating::setSpectatePermissions();
	}
	if(self.sessionteam != "spectator")
	{
		self thread Spawning::onSpawnPlayer_Unified(1);
	}
	profilelog_endtiming(4, "gs=" + game["state"] + " zom=" + SessionModeIsZombiesGame());
}

