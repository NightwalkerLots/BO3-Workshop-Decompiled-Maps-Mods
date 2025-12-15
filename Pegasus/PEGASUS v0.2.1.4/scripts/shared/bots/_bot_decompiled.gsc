#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\bots\_bot_combat;
#include scripts\shared\bots\bot_buttons;
#include scripts\shared\bots\bot_traversals;
#include scripts\shared\callbacks_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace bot;

/*
	Name: __init__sytem__
	Namespace: bot
	Checksum: 0xE2D24916
	Offset: 0x3D8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("bot", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: bot
	Checksum: 0xC819463B
	Offset: 0x418
	Size: 0x2E0
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function __init__()
{
	callback::on_start_gametype(&init);
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	callback::on_player_killed(&on_player_killed);
	if(!isdefined(level.getBotSettings))
	{
		level.getBotSettings = &get_bot_default_settings;
	}
	if(!isdefined(level.onBotRemove))
	{
		level.onBotRemove = &bot_void;
	}
	if(!isdefined(level.onBotConnect))
	{
		level.onBotConnect = &bot_void;
	}
	if(!isdefined(level.onBotSpawned))
	{
		level.onBotSpawned = &bot_void;
	}
	if(!isdefined(level.onBotKilled))
	{
		level.onBotKilled = &bot_void;
	}
	if(!isdefined(level.onBotDamage))
	{
		level.onBotDamage = &bot_void;
	}
	if(!isdefined(level.botUpdate))
	{
		level.botUpdate = &bot_update;
	}
	if(!isdefined(level.botPreCombat))
	{
		level.botPreCombat = &bot_void;
	}
	if(!isdefined(level.botCombat))
	{
		level.botCombat = &bot_combat::combat_think;
	}
	if(!isdefined(level.botPostCombat))
	{
		level.botPostCombat = &bot_void;
	}
	if(!isdefined(level.botIdle))
	{
		level.botIdle = &bot_void;
	}
	if(!isdefined(level.botThreatDead))
	{
		level.botThreatDead = &bot_combat::clear_threat;
	}
	if(!isdefined(level.botThreatEngage))
	{
		level.botThreatEngage = &bot_combat::engage_threat;
	}
	if(!isdefined(level.botUpdateThreatGoal))
	{
		level.botUpdateThreatGoal = &bot_combat::update_threat_goal;
	}
	if(!isdefined(level.botThreatLost))
	{
		level.botThreatLost = &bot_combat::clear_threat;
	}
	if(!isdefined(level.botGetThreats))
	{
		level.botGetThreats = &bot_combat::get_bot_threats;
	}
	if(!isdefined(level.botIgnoreThreat))
	{
		level.botIgnoreThreat = &bot_combat::ignore_non_sentient;
	}
	SetDvar("bot_maxMantleHeight", 200);
	/#
		level thread bot_devgui_think();
		return;
	#/
	waittillframeend;
}

/*
	Name: init
	Namespace: bot
	Checksum: 0x3A719FB4
	Offset: 0x700
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 132
*/
function init()
{
	init_bot_settings();
	return;
}

/*
	Name: is_bot_ranked_match
	Namespace: bot
	Checksum: 0x3354A275
	Offset: 0x720
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 148
*/
function is_bot_ranked_match()
{
	return 0;
}

/*
	Name: bot_void
	Namespace: bot
	Checksum: 0x9ACF73B8
	Offset: 0x730
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 163
*/
function bot_void()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: bot_unhandled
	Namespace: bot
	Checksum: 0x702DC4A6
	Offset: 0x740
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 183
*/
function bot_unhandled()
{
	return 0;
}

/*
	Name: add_bots
	Namespace: bot
	Checksum: 0x82DCBC90
	Offset: 0x750
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 198
*/
function add_bots(count, team)
{
	for(i = 0; i < count; i++)
	{
		add_bot(team);
	}
}

/*
	Name: add_bot
	Namespace: bot
	Checksum: 0xF81EBC8A
	Offset: 0x7B0
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 216
*/
function add_bot(team)
{
	botEnt = AddTestClient();
	if(!isdefined(botEnt))
	{
		return undefined;
	}
	botEnt BotSetRandomCharacterCustomization();
	if(isdefined(level.disableClassSelection) && level.disableClassSelection)
	{
		botEnt.pers["class"] = level.defaultClass;
		botEnt.curClass = level.defaultClass;
	}
	if(level.teambased && team !== "autoassign")
	{
		botEnt.pers["team"] = team;
	}
	return botEnt;
}

/*
	Name: remove_bots
	Namespace: bot
	Checksum: 0xF0F7D729
	Offset: 0x890
	Size: 0x118
	Parameters: 2
	Flags: None
	Line Number: 246
*/
function remove_bots(count, team)
{
	players = GetPlayers();
	foreach(player in players)
	{
		if(!player IsTestClient())
		{
			continue;
		}
		if(isdefined(team) && player.team != team)
		{
			continue;
		}
		remove_bot(player);
		if(isdefined(count))
		{
			count--;
			if(count <= 0)
			{
				break;
			}
		}
	}
}

/*
	Name: remove_bot
	Namespace: bot
	Checksum: 0xE6CD8842
	Offset: 0x9B0
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 281
*/
function remove_bot(bot)
{
	if(!bot IsTestClient())
	{
		return;
	}
	bot [[level.onBotRemove]]();
	bot BotDropClient();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: filter_bots
	Namespace: bot
	Checksum: 0xD2F8D61C
	Offset: 0xA10
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 303
*/
function filter_bots(players)
{
	bots = [];
	foreach(player in players)
	{
		if(player util::is_bot())
		{
			bots[bots.size] = player;
		}
	}
	return bots;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: on_player_connect
	Namespace: bot
	Checksum: 0xB307B8DC
	Offset: 0xAD8
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 327
*/
function on_player_connect()
{
	if(!self IsTestClient())
	{
		return;
	}
	self endon("disconnect");
	self.bot = spawnstruct();
	self.bot.threat = spawnstruct();
	self.bot.damage = spawnstruct();
	self.pers["isBot"] = 1;
	if(level.teambased)
	{
		self notify("menuresponse", game["menu_team"], self.team);
		wait(0.5);
	}
	self notify("joined_team");
	callback::callback("hash_95a6c4c0");
	self thread [[level.onBotConnect]]();
}

/*
	Name: on_player_spawned
	Namespace: bot
	Checksum: 0x6E6F25FA
	Offset: 0xBE8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 358
*/
function on_player_spawned()
{
	if(!self util::is_bot())
	{
		return;
	}
	self clear_stuck();
	self bot_combat::clear_threat();
	self.bot.prevWeapon = undefined;
	self BotLookForward();
	self thread [[level.onBotSpawned]]();
	self thread bot_combat::wait_damage_loop();
	self thread wait_bot_path_failed_loop();
	self thread wait_bot_goal_reached_loop();
	self thread bot_think_loop();
}

/*
	Name: on_player_killed
	Namespace: bot
	Checksum: 0x2D6BFD09
	Offset: 0xCD0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 385
*/
function on_player_killed()
{
	if(!self util::is_bot())
	{
		return;
	}
	self thread [[level.onBotKilled]]();
	self BotReleaseManualControl();
}

/*
	Name: bot_think_loop
	Namespace: bot
	Checksum: 0x755D01DD
	Offset: 0xD20
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 405
*/
function bot_think_loop()
{
	self endon("death");
	level endon("game_ended");
	while(1)
	{
		self bot_think();
		wait(level.botSettings.thinkInterval);
	}
}

/*
	Name: bot_think
	Namespace: bot
	Checksum: 0x15A45F83
	Offset: 0xD70
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 426
*/
function bot_think()
{
	self BotReleaseButtons();
	if(level.inPrematchPeriod || level.gameended || !isalive(self))
	{
		return;
	}
	self check_stuck();
	self sprint_think();
	self update_swim();
	self thread [[level.botUpdate]]();
	self thread [[level.botPreCombat]]();
	self thread [[level.botCombat]]();
	self thread [[level.botPostCombat]]();
	if(!self bot_combat::has_threat() && !self BotGoalSet())
	{
		self thread [[level.botIdle]]();
	}
}

/*
	Name: bot_update
	Namespace: bot
	Checksum: 0x9ACF73B8
	Offset: 0xE88
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 456
*/
function bot_update()
{
	return;
}

/*
	Name: update_swim
	Namespace: bot
	Checksum: 0xCCF62E5F
	Offset: 0xE98
	Size: 0x2C0
	Parameters: 0
	Flags: None
	Line Number: 471
*/
function update_swim()
{
	if(!self IsPlayerSwimming())
	{
		self.bot.resurfaceTime = undefined;
		return;
	}
	if(self IsPlayerUnderwater())
	{
		if(!isdefined(self.bot.resurfaceTime))
		{
			self.bot.resurfaceTime = GetTime() + level.botSettings.swimTime;
		}
	}
	else
	{
		self.bot.resurfaceTime = undefined;
	}
	if(self BotUnderManualControl())
	{
		return;
	}
	goalPosition = self BotGetGoalPosition();
	if(Distance2DSquared(goalPosition, self.origin) <= 16384 && GetWaterHeight(goalPosition) > 0)
	{
		self press_swim_down();
		return;
	}
	if(isdefined(self.bot.resurfaceTime) && self.bot.resurfaceTime <= GetTime())
	{
		press_swim_up();
		return;
	}
	bottomTrace = GroundTrace(self.origin, self.origin + VectorScale((0, 0, -1), 1000), 0, self, 1);
	swimHeight = self.origin[2] - bottomTrace["position"][2];
	if(swimHeight < 25)
	{
		self press_swim_up();
		vertDist = 25 - swimHeight;
	}
	else if(swimHeight > 45)
	{
		self press_swim_down();
		vertDist = swimHeight - 45;
	}
	if(isdefined(vertDist))
	{
		intervalDist = level.botSettings.swimVerticalSpeed * level.botSettings.thinkInterval;
		if(intervalDist > vertDist)
		{
			self wait_release_swim_buttons(level.botSettings.thinkInterval * vertDist / intervalDist);
		}
	}
}

/*
	Name: wait_release_swim_buttons
	Namespace: bot
	Checksum: 0x2F9CCC8
	Offset: 0x1160
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 536
*/
function wait_release_swim_buttons(waittime)
{
	self endon("death");
	level endon("game_ended");
	wait(waittime);
	self release_swim_up();
	self release_swim_down();
}

/*
	Name: init_bot_settings
	Namespace: bot
	Checksum: 0x62AEEDD6
	Offset: 0x11C0
	Size: 0x688
	Parameters: 0
	Flags: None
	Line Number: 555
*/
function init_bot_settings()
{
	level.botSettings = [[level.getBotSettings]]();
	if(isdefined(level.botSettings.AllowMelee))
	{
	}
	else
	{
	}
	SetDvar("bot_AllowMelee", 0);
	if(isdefined(level.botSettings.allowGrenades))
	{
	}
	else
	{
	}
	SetDvar("bot_AllowGrenades", 0);
	if(isdefined(level.botSettings.allowKillstreaks))
	{
	}
	else
	{
	}
	SetDvar("bot_AllowKillstreaks", 0);
	if(isdefined(level.botSettings.allowHeroGadgets))
	{
	}
	else
	{
	}
	SetDvar("bot_AllowHeroGadgets", 0);
	if(isdefined(level.botSettings.fov))
	{
	}
	else
	{
	}
	SetDvar("bot_Fov", 0);
	if(isdefined(level.botSettings.fovAds))
	{
	}
	else
	{
	}
	SetDvar("bot_FovAds", 0);
	SetDvar("bot_PitchSensitivity", level.botSettings.pitchSensitivity);
	SetDvar("bot_YawSensitivity", level.botSettings.yawSensitivity);
	if(isdefined(level.botSettings.pitchSpeed))
	{
	}
	else
	{
	}
	SetDvar("bot_PitchSpeed", 0);
	if(isdefined(level.botSettings.pitchSpeedAds))
	{
	}
	else
	{
	}
	SetDvar("bot_PitchSpeedAds", 0);
	if(isdefined(level.botSettings.yawSpeed))
	{
	}
	else
	{
	}
	SetDvar("bot_YawSpeed", 0);
	if(isdefined(level.botSettings.yawSpeedAds))
	{
	}
	else
	{
	}
	SetDvar("bot_YawSpeedAds", 0);
	if(isdefined(level.botSettings.pitchAccelerationTime))
	{
	}
	else
	{
	}
	SetDvar("pitchAccelerationTime", 0);
	if(isdefined(level.botSettings.yawAccelerationTime))
	{
	}
	else
	{
	}
	SetDvar("yawAccelerationTime", 0);
	if(isdefined(level.botSettings.pitchDecelerationThreshold))
	{
	}
	else
	{
	}
	SetDvar("pitchDecelerationThreshold", 0);
	if(isdefined(level.botSettings.yawDecelerationThreshold))
	{
	}
	else
	{
	}
	SetDvar("yawDecelerationThreshold", 0);
	if(isdefined(level.botSettings.meleeRangeMultiplier))
	{
	}
	else
	{
	}
	meleeRange = level.botSettings.meleeRangeMultiplier * 0;
	level.botSettings.meleeRange = Int(meleeRange);
	level.botSettings.meleeRangeSq = meleeRange * meleeRange;
	level.botSettings.threatRadiusMinSq = level.botSettings.threatRadiusMin * level.botSettings.threatRadiusMin;
	level.botSettings.threatRadiusMaxSq = level.botSettings.threatRadiusMax * level.botSettings.threatRadiusMax;
	if(isdefined(level.botSettings.lethalDistanceMin))
	{
	}
	else
	{
	}
	lethalDistanceMin = 0;
	level.botSettings.lethalDistanceMinSq = lethalDistanceMin * lethalDistanceMin;
	if(isdefined(level.botSettings.lethalDistanceMax))
	{
	}
	else
	{
	}
	lethalDistanceMax = 1024;
	level.botSettings.lethalDistanceMaxSq = lethalDistanceMax * lethalDistanceMax;
	if(isdefined(level.botSettings.tacticalDistanceMin))
	{
	}
	else
	{
	}
	tacticalDistanceMin = 0;
	level.botSettings.tacticalDistanceMinSq = tacticalDistanceMin * tacticalDistanceMin;
	if(isdefined(level.botSettings.tacticalDistanceMax))
	{
	}
	else
	{
	}
	tacticalDistanceMax = 1024;
	level.botSettings.tacticalDistanceMaxSq = tacticalDistanceMax * tacticalDistanceMax;
	level.botSettings.swimVerticalSpeed = GetDvarFloat("player_swimVerticalSpeedMax");
	level.botSettings.swimTime = GetDvarFloat("player_swimTime", 5) * 1000;
}

/*
	Name: get_bot_default_settings
	Namespace: bot
	Checksum: 0x28F77D53
	Offset: 0x1850
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 715
*/
function get_bot_default_settings()
{
	return struct::get_script_bundle("botsettings", "bot_default");
}

/*
	Name: sprint_to_goal
	Namespace: bot
	Checksum: 0x463786B3
	Offset: 0x1880
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 730
*/
function sprint_to_goal()
{
	self.bot.sprintToGoal = 1;
}

/*
	Name: end_sprint_to_goal
	Namespace: bot
	Checksum: 0x8087057D
	Offset: 0x18A0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 745
*/
function end_sprint_to_goal()
{
	self.bot.sprintToGoal = 0;
}

/*
	Name: sprint_think
	Namespace: bot
	Checksum: 0xF177FCD5
	Offset: 0x18C0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 760
*/
function sprint_think()
{
	if(isdefined(self.bot.sprintToGoal) && self.bot.sprintToGoal)
	{
		if(self BotGoalReached())
		{
			self end_sprint_to_goal();
			return;
		}
		self press_sprint_button();
		return;
	}
}

/*
	Name: goal_in_trigger
	Namespace: bot
	Checksum: 0xAB63FC6B
	Offset: 0x1938
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 784
*/
function goal_in_trigger(trigger)
{
	radius = self get_trigger_radius(trigger);
	return DistanceSquared(trigger.origin, self BotGetGoalPosition()) <= radius * radius;
}

/*
	Name: point_in_goal
	Namespace: bot
	Checksum: 0xBED2A868
	Offset: 0x19A8
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 800
*/
function point_in_goal(point)
{
	deltaSq = Distance2DSquared(self BotGetGoalPosition(), point);
	goalRadius = self BotGetGoalRadius();
	return deltaSq <= goalRadius * goalRadius;
}

/*
	Name: path_to_trigger
	Namespace: bot
	Checksum: 0x9AA606DC
	Offset: 0x1A20
	Size: 0x150
	Parameters: 2
	Flags: None
	Line Number: 817
*/
function path_to_trigger(trigger, radius)
{
	if(trigger.classname == "trigger_use" || trigger.classname == "trigger_use_touch")
	{
		if(!isdefined(radius))
		{
			radius = get_trigger_radius(trigger);
		}
		randomAngle = (0, RandomInt(360), 0);
		randomVec = AnglesToForward(randomAngle);
		point = trigger.origin + randomVec * radius;
		self BotSetGoal(point);
	}
	if(!isdefined(radius))
	{
		radius = 0;
	}
	self BotSetGoal(trigger.origin, Int(radius));
}

/*
	Name: path_to_point_in_trigger
	Namespace: bot
	Checksum: 0x9B0B8BEC
	Offset: 0x1B78
	Size: 0x340
	Parameters: 1
	Flags: None
	Line Number: 847
*/
function path_to_point_in_trigger(trigger)
{
	mins = trigger GetMins();
	maxs = trigger GetMaxs();
	radius = min(maxs[0], maxs[1]);
	height = maxs[2] - mins[2];
	minOrigin = trigger.origin + (0, 0, mins[2]);
	queryHeight = height / 4;
	queryOrigin = minOrigin + (0, 0, queryHeight);
	/#
		if(GetDvarInt("Dev Block strings are not supported", 0))
		{
			Draws = 10;
			circle(queryOrigin, radius, (0, 1, 0), 0, 1, 20 * Draws);
			circle(queryOrigin + (0, 0, queryHeight), radius, (0, 1, 0), 0, 1, 20 * Draws);
			circle(queryOrigin - (0, 0, queryHeight), radius, (0, 1, 0), 0, 1, 20 * Draws);
		}
	#/
	queryResult = PositionQuery_Source_Navigation(queryOrigin, 0, radius, queryHeight, 17, self);
	best_point = undefined;
	foreach(point in queryResult.data)
	{
		point.score = RandomFloatRange(0, 100);
		if(!isdefined(best_point) || point.score > best_point.score)
		{
			best_point = point;
		}
	}
	if(isdefined(best_point))
	{
		self BotSetGoal(best_point.origin, 24);
		return;
	}
	self path_to_trigger(trigger, radius);
	return;
	ERROR: Bad function call
}

/*
	Name: get_trigger_radius
	Namespace: bot
	Checksum: 0x50A3C963
	Offset: 0x1EC0
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 895
*/
function get_trigger_radius(trigger)
{
	maxs = trigger GetMaxs();
	if(trigger.classname == "trigger_radius")
	{
		return maxs[0];
	}
	return min(maxs[0], maxs[1]);
}

/*
	Name: get_trigger_height
	Namespace: bot
	Checksum: 0xE6AE3575
	Offset: 0x1F48
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 915
*/
function get_trigger_height(trigger)
{
	maxs = trigger GetMaxs();
	if(trigger.classname == "trigger_radius")
	{
		return maxs[2];
	}
	return maxs[2] * 2;
}

/*
	Name: check_stuck
	Namespace: bot
	Checksum: 0xC15E3D10
	Offset: 0x1FB8
	Size: 0x288
	Parameters: 0
	Flags: None
	Line Number: 935
*/
function check_stuck()
{
	/#
		if(!GetDvarInt("Dev Block strings are not supported"))
		{
			return;
		}
	#/
	if(self BotUnderManualControl() || self BotGoalReached() || self util::isStunned() || self IsMeleeing() || self meleeButtonPressed() || (self bot_combat::has_threat() && self.bot.threat.lastDistanceSq < 16384))
	{
		return;
	}
	velocity = self getvelocity();
	if(velocity[0] == 0 && velocity[1] == 0 && (velocity[2] == 0 || self IsPlayerSwimming()))
	{
		if(!isdefined(self.bot.stuckCycles))
		{
			self.bot.stuckCycles = 0;
		}
		self.bot.stuckCycles++;
		if(self.bot.stuckCycles >= 3)
		{
			/#
				if(GetDvarInt("Dev Block strings are not supported", 0))
				{
					sphere(self.origin, 16, (1, 0, 0), 0.25, 0, 16, 1200);
					iprintln("Dev Block strings are not supported" + self.name + "Dev Block strings are not supported" + self.origin);
				}
			#/
			self thread stuck_resolution();
		}
	}
	else
	{
		self.bot.stuckCycles = 0;
	}
	if(!self bot_combat::threat_visible())
	{
		self check_stuck_position();
	}
}

/*
	Name: check_stuck_position
	Namespace: bot
	Checksum: 0x11F32A7B
	Offset: 0x2248
	Size: 0x2B0
	Parameters: 0
	Flags: None
	Line Number: 987
*/
function check_stuck_position()
{
	if(GetTime() < self.bot.checkPositionTime)
	{
		return;
	}
	self.bot.checkPositionTime = GetTime() + 500;
	self.bot.positionHistory[self.bot.positionHistoryIndex] = self.origin;
	self.bot.positionHistoryIndex = self.bot.positionHistoryIndex + 1 % 5;
	if(self.bot.positionHistory.size < 5)
	{
		return;
	}
	maxDistSq = undefined;
	for(i = 0; i < self.bot.positionHistory.size; i++)
	{
		/#
			if(GetDvarInt("Dev Block strings are not supported", 0))
			{
				line(self.bot.positionHistory[i], self.bot.positionHistory[i] + VectorScale((0, 0, 1), 72), (0, 1, 0), 1, 0, 10);
			}
		#/
		for(j = i + 1; j < self.bot.positionHistory.size; j++)
		{
			distSq = DistanceSquared(self.bot.positionHistory[i], self.bot.positionHistory[j]);
			if(distSq > 16384)
			{
				return;
			}
		}
	}
	/#
		if(GetDvarInt("Dev Block strings are not supported", 0))
		{
			sphere(self.origin, 128, (1, 0, 0), 0.25, 0, 16, 1200);
			iprintln("Dev Block strings are not supported" + self.name + "Dev Block strings are not supported" + self.origin);
		}
	#/
	self thread stuck_resolution();
}

/*
	Name: stuck_resolution
	Namespace: bot
	Checksum: 0xED920E01
	Offset: 0x2500
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 1038
*/
function stuck_resolution()
{
	self endon("death");
	level endon("game_ended");
	self clear_stuck();
	self BotTakeManualControl();
	escapeAngle = self GetAngles()[1] + 180 + randomIntRange(-60, 60);
	escapeDir = AnglesToForward((0, escapeAngle, 0));
	self BotSetMoveAngle(escapeDir);
	self BotSetMoveMagnitude(1);
	wait(1.5);
	self BotReleaseManualControl();
}

/*
	Name: clear_stuck
	Namespace: bot
	Checksum: 0x932CA1A
	Offset: 0x2610
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1062
*/
function clear_stuck()
{
	self.bot.stuckCycles = 0;
	self.bot.positionHistory = [];
	self.bot.positionHistoryIndex = 0;
	self.bot.checkPositionTime = 0;
}

/*
	Name: camp
	Namespace: bot
	Checksum: 0x65518A18
	Offset: 0x2670
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 1080
*/
function camp()
{
	self BotSetGoal(self.origin);
	self press_crouch_button();
}

/*
	Name: wait_bot_path_failed_loop
	Namespace: bot
	Checksum: 0x4EA14D14
	Offset: 0x26B8
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 1096
*/
function wait_bot_path_failed_loop()
{
	self endon("death");
	level endon("game_ended");
	while(1)
	{
		self waittill("bot_path_failed", reason);
		/#
			if(GetDvarInt("Dev Block strings are not supported", 0))
			{
				goalPosition = self BotGetGoalPosition();
				box(self.origin, VectorScale((-1, -1, 0), 15), (15, 15, 72), 0, (0, 1, 0), 0.25, 0, 1200);
				box(goalPosition, VectorScale((-1, -1, 0), 15), (15, 15, 72), 0, (1, 0, 0), 0.25, 0, 1200);
				line(self.origin, goalPosition, (1, 1, 1), 1, 0, 1200);
				iprintln("Dev Block strings are not supported" + self.name + "Dev Block strings are not supported" + self.origin + "Dev Block strings are not supported" + goalPosition);
			}
		#/
		self thread stuck_resolution();
	}
}

/*
	Name: wait_bot_goal_reached_loop
	Namespace: bot
	Checksum: 0xB0A5571A
	Offset: 0x2850
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1127
*/
function wait_bot_goal_reached_loop()
{
	self endon("death");
	level endon("game_ended");
	while(1)
	{
		self waittill("bot_goal_reached", reason);
		self clear_stuck();
	}
}

/*
	Name: stow_gun_gadget
	Namespace: bot
	Checksum: 0xF9F26087
	Offset: 0x28B0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1148
*/
function stow_gun_gadget()
{
	currentWeapon = self GetCurrentWeapon();
	if(self GetWeaponAmmoClip(currentWeapon) || !currentWeapon.isHeroWeapon)
	{
		return;
	}
	if(isdefined(self.lastdroppableweapon) && self hasweapon(self.lastdroppableweapon))
	{
		self SwitchToWeapon(self.lastdroppableweapon);
	}
}

/*
	Name: get_ready_gadget
	Namespace: bot
	Checksum: 0xACA80141
	Offset: 0x2960
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 1171
*/
function get_ready_gadget()
{
	weapons = self GetWeaponsList();
	foreach(weapon in weapons)
	{
		slot = self GadgetGetSlot(weapon);
		if(slot < 0 || !self GadgetIsReady(slot) || self GadgetIsActive(slot))
		{
			continue;
		}
		return weapon;
	}
	return level.weaponNone;
}

/*
	Name: get_ready_gun_gadget
	Namespace: bot
	Checksum: 0x49F42A82
	Offset: 0x2A80
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 1196
*/
function get_ready_gun_gadget()
{
	weapons = self GetWeaponsList();
	foreach(weapon in weapons)
	{
		if(!is_gun_gadget(weapon))
		{
			continue;
		}
		slot = self GadgetGetSlot(weapon);
		if(slot < 0 || !self GadgetIsReady(slot) || self GadgetIsActive(slot))
		{
			continue;
		}
		return weapon;
	}
	return level.weaponNone;
	ERROR: Bad function call
}

/*
	Name: is_gun_gadget
	Namespace: bot
	Checksum: 0x24CE1374
	Offset: 0x2BB8
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1226
*/
function is_gun_gadget(weapon)
{
	if(!isdefined(weapon) || weapon == level.weaponNone || !weapon.isHeroWeapon)
	{
		return 0;
	}
	return weapon.isBulletWeapon || weapon.isProjectileWeapon || weapon.isLauncher || weapon.isGasWeapon;
}

/*
	Name: activate_hero_gadget
	Namespace: bot
	Checksum: 0xDAD7C3CA
	Offset: 0x2C40
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 1245
*/
function activate_hero_gadget(weapon)
{
	if(!isdefined(weapon) || weapon == level.weaponNone || !weapon.isgadget)
	{
		return;
	}
	if(is_gun_gadget(weapon))
	{
		self SwitchToWeapon(weapon);
	}
	else if(weapon.isHeroWeapon)
	{
		self tap_offhand_special_button();
	}
	else
	{
		self BotPressButtonForGadget(weapon);
	}
}

/*
	Name: coop_pre_combat
	Namespace: bot
	Checksum: 0xDEED9EB2
	Offset: 0x2D00
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 1275
*/
function coop_pre_combat()
{
	self bot_combat::bot_pre_combat();
	if(self bot_combat::has_threat())
	{
		return;
	}
	if(self IsReloading() || self IsSwitchingWeapons() || self IsThrowingGrenade() || self fragButtonPressed() || self SecondaryOffhandButtonPressed() || self IsMeleeing() || self IsRemoteControlling() || self IsInVehicle() || self IsWeaponViewOnlyLinked())
	{
		return;
	}
	if(self bot_combat::switch_weapon())
	{
		return;
	}
	if(self bot_combat::reload_weapon())
	{
		return;
	}
}

/*
	Name: coop_post_combat
	Namespace: bot
	Checksum: 0x32DFC909
	Offset: 0x2E48
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1306
*/
function coop_post_combat()
{
	if(self revive_players())
	{
		if(self bot_combat::has_threat())
		{
			self bot_combat::clear_threat();
			self BotSetGoal(self.origin);
			return;
		}
	}
	self bot_combat::bot_post_combat();
}

/*
	Name: follow_coop_players
	Namespace: bot
	Checksum: 0x578D4B97
	Offset: 0x2ED8
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 1330
*/
function follow_coop_players()
{
	host = get_host_player();
	if(!isalive(host))
	{
		players = ArraySort(level.players, self.origin);
		foreach(player in players)
		{
			if(!player util::is_bot() && player.team == self.team && isalive(player))
			{
				break;
			}
		}
	}
	else
	{
		player = host;
	}
	if(isdefined(player))
	{
		fwd = AnglesToForward(player.angles);
		botDir = self.origin - player.origin;
		if(VectorDot(botDir, fwd) < 0)
		{
			self thread lead_player(player, 150);
		}
	}
}

/*
	Name: lead_player
	Namespace: bot
	Checksum: 0x253E769A
	Offset: 0x30A0
	Size: 0x130
	Parameters: 2
	Flags: None
	Line Number: 1369
*/
function lead_player(player, followmin)
{
	radiusMin = followmin - 32;
	radiusMax = followmin;
	dotMin = 0.85;
	dotMax = 0.92;
	queryResult = PositionQuery_Source_Navigation(player.origin, radiusMin, radiusMax, 150, 32, self);
	fwd = AnglesToForward(player.angles);
	point = player.origin + fwd * 72;
	self BotSetGoal(point, 42);
	self sprint_to_goal();
	return;
	ERROR: Bad function call
}

/*
	Name: follow_entity
	Namespace: bot
	Checksum: 0xCA58C848
	Offset: 0x31D8
	Size: 0xD8
	Parameters: 3
	Flags: None
	Line Number: 1394
*/
function follow_entity(entity, radiusMin, radiusMax)
{
	if(!isdefined(radiusMin))
	{
		radiusMin = 24;
	}
	if(!isdefined(radiusMax))
	{
		radiusMax = radiusMin + 1;
	}
	if(!point_in_goal(entity.origin))
	{
		radius = randomIntRange(radiusMin, radiusMax);
		self BotSetGoal(entity.origin, radius);
		self sprint_to_goal();
	}
}

/*
	Name: navmesh_wander
	Namespace: bot
	Checksum: 0xAE50C2BF
	Offset: 0x32B8
	Size: 0x540
	Parameters: 5
	Flags: None
	Line Number: 1422
*/
function navmesh_wander(fwd, radiusMin, radiusMax, spacing, fwdDot)
{
	if(!isdefined(radiusMin))
	{
		if(isdefined(level.botSettings.wanderMin))
		{
		}
		else
		{
		}
		radiusMin = 0;
	}
	if(!isdefined(radiusMax))
	{
		if(isdefined(level.botSettings.wanderMax))
		{
		}
		else
		{
		}
		radiusMax = 0;
	}
	if(!isdefined(spacing))
	{
		if(isdefined(level.botSettings.wanderSpacing))
		{
		}
		else
		{
		}
		spacing = 0;
	}
	if(!isdefined(fwdDot))
	{
		if(isdefined(level.botSettings.wanderFwdDot))
		{
		}
		else
		{
		}
		fwdDot = 0;
	}
	if(!isdefined(fwd))
	{
		fwd = AnglesToForward(self.angles);
	}
	fwd = VectorNormalize((fwd[0], fwd[1], 0));
	queryResult = PositionQuery_Source_Navigation(self.origin, radiusMin, radiusMax, 150, spacing, self);
	best_point = undefined;
	origin = (self.origin[0], self.origin[1], 0);
	foreach(point in queryResult.data)
	{
		movePoint = (point.origin[0], point.origin[1], 0);
		moveDir = VectorNormalize(movePoint - origin);
		dot = VectorDot(moveDir, fwd);
		point.score = mapfloat(radiusMin, radiusMax, 0, 50, point.distToOrigin2D);
		if(dot > fwdDot)
		{
			point.score = point.score + RandomFloatRange(30, 50);
		}
		else if(dot > 0)
		{
			point.score = point.score + RandomFloatRange(10, 35);
		}
		else
		{
			point.score = point.score + RandomFloatRange(0, 15);
		}
		if(!isdefined(best_point) || point.score > best_point.score)
		{
			best_point = point;
		}
	}
	if(isdefined(best_point))
	{
		self BotSetGoal(best_point.origin, radiusMin);
	}
	else
	{
		if(GetDvarInt("Dev Block strings are not supported", 0))
		{
			circle(self.origin, radiusMin, (1, 0, 0), 0, 1, 1200);
			circle(self.origin, radiusMax, (1, 0, 0), 0, 1, 1200);
			sphere(self.origin, 16, (0, 1, 0), 0.25, 0, 16, 1200);
			iprintln("Dev Block strings are not supported" + self.name + "Dev Block strings are not supported" + self.origin);
		}
		self thread stuck_resolution();
	}
	/#
	#/
}

/*
	Name: approach_goal_trigger
	Namespace: bot
	Checksum: 0x5983A77A
	Offset: 0x3800
	Size: 0xF8
	Parameters: 3
	Flags: None
	Line Number: 1524
*/
function approach_goal_trigger(trigger, radiusMax, spacing)
{
	if(!isdefined(radiusMax))
	{
		radiusMax = 1500;
	}
	if(!isdefined(spacing))
	{
		spacing = 128;
	}
	distSq = DistanceSquared(self.origin, trigger.origin);
	if(distSq < radiusMax * radiusMax)
	{
		self path_to_point_in_trigger(trigger);
		return;
	}
	radiusMin = self get_trigger_radius(trigger);
	self approach_point(trigger.origin, radiusMin, radiusMax, spacing);
	return;
}

/*
	Name: approach_point
	Namespace: bot
	Checksum: 0xDBD7651C
	Offset: 0x3900
	Size: 0x380
	Parameters: 4
	Flags: None
	Line Number: 1555
*/
function approach_point(point, radiusMin, radiusMax, spacing)
{
	if(!isdefined(radiusMin))
	{
		radiusMin = 0;
	}
	if(!isdefined(radiusMax))
	{
		radiusMax = 1500;
	}
	if(!isdefined(spacing))
	{
		spacing = 128;
	}
	distSq = DistanceSquared(self.origin, point);
	if(distSq < radiusMax * radiusMax)
	{
		self BotSetGoal(point, 24);
		return;
	}
	queryResult = PositionQuery_Source_Navigation(point, radiusMin, radiusMax, 150, spacing, self);
	fwd = AnglesToForward(self.angles);
	fwd = (fwd[0], fwd[1], 0);
	origin = (self.origin[0], self.origin[1], 0);
	best_point = undefined;
	foreach(point in queryResult.data)
	{
		movePoint = (point.origin[0], point.origin[1], 0);
		moveDir = VectorNormalize(movePoint - origin);
		dot = VectorDot(moveDir, fwd);
		point.score = RandomFloatRange(0, 50);
		if(dot < 0.5)
		{
			point.score = point.score + RandomFloatRange(30, 50);
		}
		else
		{
			point.score = point.score + RandomFloatRange(0, 15);
		}
		if(!isdefined(best_point) || point.score > best_point.score)
		{
			best_point = point;
		}
	}
	if(isdefined(best_point))
	{
		self BotSetGoal(best_point.origin, 24);
	}
}

/*
	Name: revive_players
	Namespace: bot
	Checksum: 0x2930AFC6
	Offset: 0x3C88
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 1615
*/
function revive_players()
{
	players = self get_team_players_in_laststand();
	if(players.size > 0)
	{
		revive_player(players[0]);
		return 1;
	}
	return 0;
}

/*
	Name: get_team_players_in_laststand
	Namespace: bot
	Checksum: 0x78D49090
	Offset: 0x3CF0
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1636
*/
function get_team_players_in_laststand()
{
	players = [];
	foreach(player in level.players)
	{
		if(player != self && player laststand::player_is_in_laststand() && player.team == self.team)
		{
			players[players.size] = player;
		}
	}
	players = ArraySort(players, self.origin);
	return players;
}

/*
	Name: revive_player
	Namespace: bot
	Checksum: 0x7719A426
	Offset: 0x3DF8
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 1660
*/
function revive_player(player)
{
	if(!point_in_goal(player.origin))
	{
		self BotSetGoal(player.origin, 64);
		self sprint_to_goal();
		return;
	}
	if(self BotGoalReached())
	{
		self BotSetLookAnglesFromPoint(player GetCentroid());
		self tap_use_button();
	}
}

/*
	Name: watch_bot_corner
	Namespace: bot
	Checksum: 0x46EEFA39
	Offset: 0x3EC8
	Size: 0x170
	Parameters: 2
	Flags: None
	Line Number: 1685
*/
function watch_bot_corner(startCornerDist, cornerDist)
{
	self endon("death");
	self endon("bot_combat_target");
	level endon("game_ended");
	if(!isdefined(startCornerDist))
	{
		startCornerDist = 64;
	}
	if(!isdefined(cornerDist))
	{
		cornerDist = 128;
	}
	startCornerDistSq = cornerDist * cornerDist;
	cornerDistSq = cornerDist * cornerDist;
	while(1)
	{
		self waittill("bot_corner", centerPoint, enterPoint, leavePoint, angle, nextEnterPoint);
		if(self bot_combat::has_threat())
		{
			continue;
		}
		if(Distance2DSquared(self.origin, enterPoint) < startCornerDistSq || Distance2DSquared(leavePoint, nextEnterPoint) < cornerDistSq)
		{
			continue;
		}
		self thread wait_corner_radius(startCornerDistSq, centerPoint, enterPoint, leavePoint, angle, nextEnterPoint);
	}
}

/*
	Name: wait_corner_radius
	Namespace: bot
	Checksum: 0x94054886
	Offset: 0x4040
	Size: 0x110
	Parameters: 6
	Flags: None
	Line Number: 1725
*/
function wait_corner_radius(startCornerDistSq, centerPoint, enterPoint, leavePoint, angle, nextEnterPoint)
{
	self endon("death");
	self endon("bot_corner");
	self endon("bot_goal_reached");
	self endon("bot_combat_target");
	level endon("game_ended");
	while(Distance2DSquared(self.origin, enterPoint) > startCornerDistSq)
	{
		if(self bot_combat::has_threat())
		{
			return;
		}
		wait(0.05);
	}
	self BotLookAtPoint((nextEnterPoint[0], nextEnterPoint[1], nextEnterPoint[1] + 60));
	self thread finish_corner();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: finish_corner
	Namespace: bot
	Checksum: 0x1D37CF6C
	Offset: 0x4158
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1756
*/
function finish_corner()
{
	self endon("death");
	self endon("combat_target");
	level endon("game_ended");
	self util::waittill_any("bot_corner", "bot_goal_reached");
	self BotLookForward();
}

/*
	Name: get_host_player
	Namespace: bot
	Checksum: 0x2D8995AC
	Offset: 0x41C8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1775
*/
function get_host_player()
{
	players = GetPlayers();
	foreach(player in players)
	{
		if(player IsHost())
		{
			return player;
		}
	}
	return undefined;
}

/*
	Name: fwd_dot
	Namespace: bot
	Checksum: 0xE1DE2952
	Offset: 0x4280
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 1798
*/
function fwd_dot(point)
{
	angles = self getPlayerAngles();
	fwd = AnglesToForward(angles);
	delta = point - self GetEye();
	delta = VectorNormalize(delta);
	dot = VectorDot(fwd, delta);
	return dot;
}

/*
	Name: has_launcher
	Namespace: bot
	Checksum: 0x3870D935
	Offset: 0x4350
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1818
*/
function has_launcher()
{
	weapons = self GetWeaponsList();
	foreach(weapon in weapons)
	{
		if(weapon.isRocketLauncher)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: kill_bot
	Namespace: bot
	Checksum: 0x4B5C440E
	Offset: 0x4408
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 1841
*/
function kill_bot()
{
	self DoDamage(self.health, self.origin);
	return;
}

/*
	Name: kill_bots
	Namespace: bot
	Checksum: 0x2E36F11
	Offset: 0x4440
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1857
*/
function kill_bots()
{
	/#
		foreach(player in level.players)
		{
			if(player util::is_bot())
			{
				player kill_bot();
			}
		}
		return;
	#/
}

/*
	Name: add_bot_at_eye_trace
	Namespace: bot
	Checksum: 0x8A231ED8
	Offset: 0x44F8
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 1881
*/
function add_bot_at_eye_trace(team)
{
	/#
		host = util::getHostPlayer();
		trace = host eye_trace();
		direction_vec = host.origin - trace["Dev Block strings are not supported"];
		direction = VectorToAngles(direction_vec);
		yaw = direction[1];
		bot = add_bot(team);
		if(isdefined(bot))
		{
			bot waittill("spawned_player");
			bot SetOrigin(trace["Dev Block strings are not supported"]);
			bot SetPlayerAngles((bot.angles[0], yaw, bot.angles[2]));
		}
		return bot;
	#/
}

/*
	Name: eye_trace
	Namespace: bot
	Checksum: 0xFA5388C5
	Offset: 0x4660
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 1910
*/
function eye_trace()
{
	/#
		direction = self getPlayerAngles();
		direction_vec = AnglesToForward(direction);
		eye = self GetEye();
		scale = 8000;
		direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
		return bullettrace(eye, eye + direction_vec, 0, undefined);
	#/
}

/*
	Name: devgui_debug_route
	Namespace: bot
	Checksum: 0xB3C4EC91
	Offset: 0x4740
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 1932
*/
function devgui_debug_route()
{
	/#
		iprintln("Dev Block strings are not supported");
		points = self get_nav_points();
		if(!isdefined(points) || points.size == 0)
		{
			iprintln("Dev Block strings are not supported");
			return;
		}
		iprintln("Dev Block strings are not supported");
		players = GetPlayers();
		foreach(player in players)
		{
			if(!player util::is_bot())
			{
				continue;
			}
			player thread debug_patrol(points);
		}
	#/
}

/*
	Name: get_nav_points
	Namespace: bot
	Checksum: 0xF4842DB4
	Offset: 0x48A0
	Size: 0x230
	Parameters: 0
	Flags: None
	Line Number: 1965
*/
function get_nav_points()
{
	/#
		iprintln("Dev Block strings are not supported");
		iprintln("Dev Block strings are not supported");
		iprintln("Dev Block strings are not supported");
		points = [];
		while(1)
		{
			wait(0.05);
			point = self eye_trace()["Dev Block strings are not supported"];
			if(isdefined(point))
			{
				point = GetClosestPointOnNavMesh(point, 128);
				if(isdefined(point))
				{
					sphere(point, 16, (0, 0, 1), 0.25, 0, 16, 1);
				}
			}
			if(self buttonpressed("Dev Block strings are not supported"))
			{
				if(isdefined(point) && (points.size == 0 || Distance2D(point, points[points.size - 1]) > 16))
				{
					points[points.size] = point;
				}
			}
			else if(self buttonpressed("Dev Block strings are not supported"))
			{
				return points;
			}
			else if(self buttonpressed("Dev Block strings are not supported"))
			{
				return undefined;
			}
			for(i = 0; i < points.size; i++)
			{
				sphere(points[i], 16, (0, 1, 0), 0.25, 0, 16, 1);
			}
		}
	#/
}

/*
	Name: debug_patrol
	Namespace: bot
	Checksum: 0xCBA03260
	Offset: 0x4AD8
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 2017
*/
function debug_patrol(points)
{
	/#
		self notify("debug_patrol");
		self endon("death");
		self endon("debug_patrol");
		i = 0;
		while(1)
		{
			self BotSetGoal(points[i], 24);
			self sprint_to_goal();
			self waittill("bot_goal_reached");
			i = i + 1 % points.size;
		}
	#/
}

/*
	Name: bot_devgui_think
	Namespace: bot
	Checksum: 0xB8E9D2ED
	Offset: 0x4B98
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 2044
*/
function bot_devgui_think()
{
	/#
		while(1)
		{
			wait(0.25);
			cmd = GetDvarString("Dev Block strings are not supported", "Dev Block strings are not supported");
			if(!isdefined(level.botDevguiCmd) || ![[level.botDevguiCmd]](cmd))
			{
				host = util::getHostPlayer();
				switch(cmd)
				{
					case "Dev Block strings are not supported":
					{
						remove_bots();
						break;
					}
					case "Dev Block strings are not supported":
					{
						kill_bots();
						break;
					}
					case "Dev Block strings are not supported":
					{
						host devgui_debug_route();
						break;
						break;
					}
					default
					{
					}
				}
			}
			SetDvar("Dev Block strings are not supported", "Dev Block strings are not supported");
		}
	#/
}

/*
	Name: coop_bot_devgui_cmd
	Namespace: bot
	Checksum: 0xC395B7F3
	Offset: 0x4CC8
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 2092
*/
function coop_bot_devgui_cmd(cmd)
{
	/#
		host = get_host_player();
		switch(cmd)
		{
			case "Dev Block strings are not supported":
			{
				add_bot(host.team);
				return 1;
			}
			case "Dev Block strings are not supported":
			{
				add_bots(3, host.team);
				return 1;
			}
			case "Dev Block strings are not supported":
			{
				add_bot_at_eye_trace();
				return 1;
			}
			case "Dev Block strings are not supported":
			{
				remove_bots(1);
				return 1;
				break;
			}
		}
		return 0;
		return;
	#/
	continue;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: debug_star
	Namespace: bot
	Checksum: 0x2EAA84B0
	Offset: 0x4DC8
	Size: 0x8C
	Parameters: 3
	Flags: None
	Line Number: 2137
*/
function debug_star(origin, seconds, color)
{
	/#
		if(!isdefined(seconds))
		{
			seconds = 1;
		}
		if(!isdefined(color))
		{
			color = (1, 0, 0);
		}
		frames = Int(20 * seconds);
		debugstar(origin, frames, color);
	#/
}

