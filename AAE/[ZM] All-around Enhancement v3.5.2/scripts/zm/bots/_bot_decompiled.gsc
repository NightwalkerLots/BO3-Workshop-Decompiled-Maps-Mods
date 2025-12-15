#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\bots\_bot;
#include scripts\shared\bots\_bot_combat;
#include scripts\shared\bots\bot_buttons;
#include scripts\shared\bots\bot_traversals;
#include scripts\shared\callbacks_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\killstreaks_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\rank_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\weapons\_weapons;
#include scripts\shared\weapons_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\bots\_bot_action;
#include scripts\zm\bots\_bot_combat;
#include scripts\zm\motherfucker;

#namespace bot;

/*
	Name: __init__sytem__
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x5A8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 41
*/
function autoexec __init__sytem__()
{
	system::register("aae_bot_zm", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x5E8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function __init__()
{
	callback::remove_on_spawned(&on_player_spawned);
	callback::on_spawned(&zm_on_player_spawned);
	level thread spawn_bot();
	level thread function_d0fa0116();
}

/*
	Name: spawn_bot
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x668
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 74
*/
function spawn_bot()
{
	modvar("sb", "");
	while(GetDvarString("sb") != "")
	{
		if(!isdefined(level.var_f1c0fae))
		{
			level.var_f1c0fae = 1;
			function_f546ab37();
			util::wait_network_frame();
		}
		AddTestClient();
		SetDvar("sb", "");
		wait(0.05);
	}
}

/*
	Name: function_f486d8a8
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x730
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 101
*/
function function_f486d8a8()
{
	modvar("sbs", "");
	while(GetDvarString("sbs") != "")
	{
		pos = StrTok(GetDvarString("sbs"), ",");
		foreach(player in level.activePlayers)
		{
			if(player IsTestClient())
			{
				bot = player;
			}
		}
		bot BotSetGoal((Int(pos[0]), Int(pos[1]), Int(pos[2])));
		SetDvar("sbs", "");
		wait(0.05);
	}
}

/*
	Name: zm_on_player_spawned
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x8F0
	Size: 0x280
	Parameters: 0
	Flags: None
	Line Number: 130
*/
function zm_on_player_spawned()
{
	if(!self IsTestClient())
	{
		return;
	}
	self BotReleaseButtons();
	self notify("hash_76b86dc3");
	self clear_stuck();
	self bot_combat::clear_threat();
	self BotLookForward();
	self thread [[level.onBotSpawned]]();
	self thread bot_combat::function_6e8d827b();
	self thread wait_bot_path_failed_loop();
	self thread wait_bot_goal_reached_loop();
	self thread function_1e361f76();
	self thread function_6a123423();
	self thread function_e133191b();
	self.bot.prevWeapon = undefined;
	self.bot.var_beeeee21 = undefined;
	self.bot.var_660cc448 = undefined;
	if(!self hasPerk("specialty_quickrevive"))
	{
		self zm_perks::give_perk("specialty_quickrevive", 0);
	}
	if(!self hasPerk("specialty_deadshot"))
	{
		self zm_perks::give_perk("specialty_deadshot", 0);
	}
	if(isdefined(level.weaponZMCymbalMonkey))
	{
		weapon = self zm_weapons::weapon_give(level.weaponZMCymbalMonkey, 0, 0, 1, 0);
		self SetWeaponAmmoClip(weapon, 0);
	}
	else if(isdefined(level.w_octobomb))
	{
		weapon = self zm_weapons::weapon_give(level.w_octobomb, 0, 0, 1, 0);
		self SetWeaponAmmoClip(weapon, 0);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_6a123423
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0xB78
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 183
*/
function function_6a123423()
{
	self endon("death");
	self endon("bled_out");
	level endon("game_ended");
	self endon("hash_76b86dc3");
	for(;;)
	{
		self waittill("hash_e37255e7");
		self function_6d0f4232();
	}
}

/*
	Name: function_e133191b
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0xBD8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 206
*/
function function_e133191b()
{
	self endon("death");
	self endon("bled_out");
	level endon("game_ended");
	self endon("hash_76b86dc3");
	for(;;)
	{
		self waittill("hash_d83e7f0f");
		self function_b3d56908();
	}
}

/*
	Name: function_b3d56908
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0xC38
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 229
*/
function function_b3d56908()
{
	for(i = 0; i < 2; i++)
	{
		weapon = self GetCurrentWeapon();
		if(weapon.fireType == "Single Shot" || weapon.fireType == "Burst" || weapon.fireType == "Charge Shot")
		{
			self BotTapButton(0);
		}
		else
		{
			self BotPressButton(0);
		}
		if(weapon.isDualWield)
		{
			if(weapon.dualWieldWeapon.fireType == "Single Shot" || weapon.dualWieldWeapon.fireType == "Burst" || weapon.dualWieldWeapon.fireType == "Charge Shot")
			{
				self BotTapButton(24);
			}
			else
			{
				self BotPressButton(24);
			}
		}
		wait(0.1);
	}
	self BotReleaseButton(0);
	self BotReleaseButton(24);
}

/*
	Name: function_6d0f4232
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0xE00
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 269
*/
function function_6d0f4232()
{
	startTime = GetTime();
	endTime = startTime + 150;
	while(startTime <= endTime)
	{
		startTime = GetTime();
		self BotPressButton(11);
		self BotTapButton(24);
		wait(0.05);
	}
	self BotReleaseButton(11);
}

/*
	Name: function_1e361f76
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0xEA8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 293
*/
function function_1e361f76()
{
	self endon("death");
	self endon("bled_out");
	level endon("game_ended");
	self endon("hash_76b86dc3");
	while(!isdefined(self) || self.sessionstate == "spectator" || self.sessionstate == "intermission" || !isalive(self))
	{
		self notify("hash_76b86dc3");
		return;
		self function_f73249c1();
		if(level.botSettings.thinkInterval)
		{
			wait(level.botSettings.thinkInterval);
		}
		else
		{
			wait(0.1);
		}
	}
}

/*
	Name: function_262d54a1
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0xF88
	Size: 0x6D8
	Parameters: 1
	Flags: None
	Line Number: 325
*/
function function_262d54a1(player)
{
	player endon("bled_out");
	player endon("disconnect");
	player endon("death");
	if(player ReloadButtonPressed())
	{
		cam_pos = player GetPlayerCameraPos();
		trace = beamtrace(cam_pos, cam_pos + AnglesToForward(player getPlayerAngles()) * 10000, 1, player, 1, 1);
		self BotLookAtPoint(trace["position"]);
	}
	if(player useButtonPressed())
	{
		self BotTapButton(3);
	}
	if(player OffhandSpecialButtonPressed())
	{
		foreach(weapon in self GetWeaponsList(0))
		{
			if(weapon.isHeroWeapon)
			{
				self BotSwitchToWeapon(weapon);
				break;
			}
		}
	}
	else if(player ActionSlotTwoButtonPressed())
	{
		foreach(weapon in self GetWeaponsList(0))
		{
			if(weapon.isRiotShield)
			{
				self BotSwitchToWeapon(weapon);
				break;
			}
		}
	}
	else if(player ActionSlotThreeButtonPressed())
	{
		foreach(weapon in self GetWeaponsList(1))
		{
			if(weapon.inventoryType == "primary" && weapon.altweapon != level.weaponNone)
			{
				if(!weapon.ischargeshot)
				{
					if(!WeaponHasAttachment(weapon, "dualoptic"))
					{
						self BotSwitchToWeapon(weapon.altweapon);
						break;
					}
				}
			}
		}
	}
	else if(player WeaponSwitchButtonPressed())
	{
		var_98f00566 = Array::randomize(self getweaponslistprimaries());
		current_weapon = self GetCurrentWeapon();
		foreach(weapon in var_98f00566)
		{
			if(weapon != current_weapon)
			{
				self BotSwitchToWeapon(weapon);
				break;
			}
		}
	}
	else if(player meleeButtonPressed())
	{
		self BotTapButton(2);
	}
	else if(player AttackButtonPressed() && !player IsThrowingGrenade())
	{
		self notify("hash_d83e7f0f");
	}
	if(player AdsButtonPressed())
	{
		self notify("hash_e37255e7");
	}
	if(player IsReloading())
	{
		self BotTapButton(4);
	}
	if(player ActionSlotOneButtonPressed())
	{
		self BotTapButton(45);
	}
	if(!player IsOnGround() && (player JumpButtonPressed() || player IsDoubleJumping()))
	{
		self BotTapButton(10);
	}
	if(!player laststand::player_is_in_laststand())
	{
		stance = player GetStance();
		if(stance == "prone")
		{
			self BotPressButton(8);
		}
		else if(stance == "crouch")
		{
			self BotPressButton(9);
		}
		else
		{
			self BotReleaseButton(9);
		}
		self BotReleaseButton(8);
	}
}

/*
	Name: function_f73249c1
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x1668
	Size: 0x440
	Parameters: 0
	Flags: None
	Line Number: 445
*/
function function_f73249c1()
{
	if(level.inPrematchPeriod || level.gameended || !isalive(self))
	{
		return;
	}
	teammate = self function_1e74c65d(0);
	if(teammate != self)
	{
		if(Distance(teammate.origin, self.origin) > 1800)
		{
			origin = teammate.origin;
			wait(5);
			if(isdefined(teammate) && Distance(teammate.origin, self.origin) > 1800)
			{
				self SetOrigin(origin);
				return;
			}
		}
		else
		{
			self function_262d54a1(teammate);
		}
	}
	else
	{
		teammate = self function_bee312d7(0);
		if(Distance(teammate.origin, self.origin) > 1800)
		{
			self SetOrigin(teammate.origin);
			return;
		}
	}
	if(self GetStance() == "stand")
	{
		self BotPressButton(1);
		self BotTapButton(39);
	}
	else
	{
		self BotReleaseButton(1);
	}
	self function_99779806();
	self update_swim();
	self thread [[level.botUpdate]]();
	self thread [[level.botPreCombat]]();
	self thread [[level.botCombat]]();
	self thread [[level.botPostCombat]]();
	weapon = self GetCurrentWeapon();
	if(self getammocount(weapon) < 10)
	{
		self giveMaxAmmo(weapon);
	}
	if(isdefined(self.bot.var_beeeee21))
	{
		return;
	}
	if(isdefined(level.var_7e0a3e49) && level.var_7e0a3e49.size > 0 && self function_1e74c65d(0) != self)
	{
		origin = ArrayGetClosest(self.origin, level.var_7e0a3e49);
		var_7e0a3e49 = GroundTrace(origin + VectorScale((0, 0, 1), 10), origin - VectorScale((0, 0, 1), 1000), 0, self, 1)["position"];
		if(zm_utility::check_point_in_enabled_zone(var_7e0a3e49))
		{
			if(self CanPath(self.origin, var_7e0a3e49))
			{
				self BotSetGoal(var_7e0a3e49, 25);
			}
			else
			{
				self BotSetGoal(var_7e0a3e49, 70);
				return;
			}
		}
	}
	if(!self bot_combat::has_threat())
	{
		self thread [[level.botIdle]]();
	}
}

/*
	Name: function_f546ab37
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x1AB0
	Size: 0x5B8
	Parameters: 0
	Flags: None
	Line Number: 535
*/
function function_f546ab37()
{
	level.onBotConnect = &on_bot_connect;
	level.onBotSpawned = &on_bot_spawned;
	level.onBotKilled = &on_bot_killed;
	level.botIdle = &function_ffb7e5e9;
	level.botThreatLost = &function_35fa3aaf;
	level.botPreCombat = &bot_combat::mp_pre_combat;
	level.botCombat = &bot_combat::function_2bb31584;
	level.botPostCombat = &bot_combat::mp_post_combat;
	level.botThreatEngage = &bot_combat::function_fd6b48fb;
	level.botUpdateThreatGoal = &bot_combat::function_5bfe8cc9;
	level.botUpdate = &function_e881b7e0;
	level.botGetThreats = &bot_combat::function_c8ba221b;
	level.onBotDamage = &bot_combat::function_ddfaef90;
	level.botSettings.meleeRangeMultiplier = 0;
	level.botSettings.meleeRange = -100000;
	level.botSettings.meleeRangeSq = -100000;
	level.botSettings.meleeDot = -100000;
	level.botSettings.allowKillstreaks = 0;
	level.botSettings.allowHeroGadgets = 1;
	level.botSettings.fov = 360;
	level.botSettings.fovAds = 360;
	level.botSettings.pitchSpeed = 1080;
	level.botSettings.yawSpeed = 1080;
	level.botSettings.pitchSpeedAds = 1080;
	level.botSettings.yawSpeedAds = 1080;
	level.botSettings.threatRadiusMin = 0;
	level.botSettings.threatRadiusMax = 20000;
	level.botSettings.headshotWeight = 101;
	level.botSettings.aimTime = 0;
	level.botSettings.aimDelay = 0;
	level.botSettings.aimErrorMinPitch = 0;
	level.botSettings.aimErrorMinYaw = 0;
	SetDvar("bot_AllowKillstreaks", level.botSettings.allowKillstreaks);
	SetDvar("bot_AllowHeroGadgets", level.botSettings.allowHeroGadgets);
	SetDvar("bot_Fov", level.botSettings.fov);
	SetDvar("bot_FovAds", level.botSettings.fovAds);
	SetDvar("bot_PitchSpeed", level.botSettings.pitchSpeed);
	SetDvar("bot_PitchSpeedAds", level.botSettings.pitchSpeedAds);
	SetDvar("bot_YawSpeed", level.botSettings.yawSpeed);
	SetDvar("bot_YawSpeedAds", level.botSettings.yawSpeedAds);
	level.botSettings.threatRadiusMinSq = level.botSettings.threatRadiusMin * level.botSettings.threatRadiusMin;
	level.botSettings.threatRadiusMaxSq = level.botSettings.threatRadiusMax * level.botSettings.threatRadiusMax;
	level.var_4c2810e7 = [];
	level.var_4c2810e7 = ArrayCombine(level.var_4c2810e7, GetEntArray("zombie_door", "targetname"), 0, 0);
	level.var_4c2810e7 = ArrayCombine(level.var_4c2810e7, GetEntArray("zombie_debris", "targetname"), 0, 0);
	level.var_4c2810e7 = ArrayCombine(level.var_4c2810e7, GetEntArray("zombie_airlock_buy", "targetname"), 0, 0);
	level.var_4d47e29b = GetEntArray("zombie_vending", "targetname");
	level thread function_ad42d6cd();
	level thread function_53b3bdc1();
	level thread function_6057f9bf();
}

/*
	Name: function_d0fa0116
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x2070
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 599
*/
function function_d0fa0116()
{
	if(GetDvarInt("tfoption_bot"))
	{
		level flag::wait_till("all_players_connected");
		if(!isdefined(level.var_f1c0fae))
		{
			level.var_f1c0fae = 1;
			function_f546ab37();
		}
		players = GetPlayers();
		var_c0f9dabb = GetDvarInt("com_maxclients");
		var_c0f9dabb = var_c0f9dabb - players.size;
		for(i = 0; i < var_c0f9dabb; i++)
		{
			util::wait_network_frame(1);
			AddTestClient();
		}
		return;
	}
	~var_c0f9dabb;
}

/*
	Name: function_53b3bdc1
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x2180
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 632
*/
function function_53b3bdc1()
{
	level endon("end_game");
	for(;;)
	{
		var_a0392c55 = function_43e1df72();
		if(var_a0392c55.size)
		{
			foreach(player in var_a0392c55)
			{
				var_97f5bd4b = player function_f209c088();
				if(isdefined(var_97f5bd4b))
				{
					var_97f5bd4b thread function_e49ab69d(player);
				}
			}
		}
		wait(1);
	}
}

/*
	Name: function_ad42d6cd
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x2288
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 663
*/
function function_ad42d6cd()
{
	level endon("end_game");
	for(;;)
	{
		level waittill("spent_points", player, points);
		if(player IsTestClient() && isdefined(player.bot.var_660cc448))
		{
			player thread function_e4da6b68();
		}
	}
}

/*
	Name: function_6057f9bf
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x2310
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 686
*/
function function_6057f9bf()
{
	level endon("end_game");
	for(;;)
	{
		level waittill("powerup_dropped", powerup);
		if(powerup.powerup_name == "fire_sale")
		{
			foreach(player in level.activePlayers)
			{
				if(player IsTestClient())
				{
					player thread function_97b200db();
				}
			}
		}
	}
}

/*
	Name: function_97b200db
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x2400
	Size: 0x80
	Parameters: 0
	Flags: Private
	Line Number: 715
*/
function private function_97b200db()
{
	if(self IsThrowingGrenade())
	{
		self forceoffhandend();
		wait(0.1);
	}
	var_8561b1fb = Motherfucker::function_f56a5552();
	self zm_weapons::weapon_give(var_8561b1fb, undefined, undefined, 1, undefined);
	return;
}

/*
	Name: function_e4da6b68
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x2488
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 737
*/
function function_e4da6b68()
{
	self notify("hash_e4da6b68");
	self endon("hash_e4da6b68");
	self endon("death");
	self endon("bled_out");
	level endon("game_ended");
	self endon("hash_76b86dc3");
	wait(0.1);
	while(self zm_utility::is_multiple_drinking())
	{
		wait(0.05);
	}
	wait(0.1);
	self.bot.var_660cc448 = undefined;
}

/*
	Name: function_43e1df72
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x2528
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 764
*/
function function_43e1df72()
{
	players = [];
	foreach(player in level.activePlayers)
	{
		if(isdefined(player.reviveTrigger) && !isdefined(player.var_cb1f0f45))
		{
			players[players.size] = player;
		}
	}
	return players;
}

/*
	Name: function_f209c088
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x25F8
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 787
*/
function function_f209c088()
{
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.FillBuffer(Int32 numBytes)
   at System.IO.BinaryReader.ReadInt32()
   at Cerberus.Logic.BlackOps3Script.LoadEndSwitch() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\BlackOps3Script.cs:line 24892
   at Cerberus.Logic.Decompiler.FindSwitchCase() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 377
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 218
}

/*
	Name: function_e49ab69d
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x2760
	Size: 0x248
	Parameters: 1
	Flags: None
	Line Number: 807
*/
function function_e49ab69d(player)
{
	self endon("death");
	self endon("bled_out");
	self endon("hash_76b86dc3");
	self.bot.var_beeeee21 = player;
	player.var_cb1f0f45 = self;
	self bot_combat::clear_threat();
	self bot_combat::get_new_threat();
	while(isdefined(player) && player laststand::player_is_in_laststand() && isdefined(player.reviveTrigger) && self CanPath(self.origin, player.origin))
	{
		if(self zm_laststand::can_revive(player))
		{
			self BotTapButton(3);
			self FreezeControls(1);
		}
		else if(!self bot_combat::threat_is_alive() || !self bot_combat::threat_visible())
		{
			self BotLookAtPoint(player GetEye());
		}
		self FreezeControls(0);
		self BotSetGoal(player.origin, GetDvarInt("revive_trigger_radius"));
		wait(0.05);
	}
	self FreezeControls(0);
	self.bot.var_beeeee21 = undefined;
	player.var_cb1f0f45 = undefined;
	self bot_combat::clear_threat();
	self bot_combat::get_new_threat();
}

/*
	Name: on_bot_connect
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x29B0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 848
*/
function on_bot_connect()
{
	self endon("disconnect");
	level endon("game_ended");
}

/*
	Name: on_bot_spawned
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x29D8
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 864
*/
function on_bot_spawned()
{
	self endon("death");
	self endon("bled_out");
	self endon("hash_76b86dc3");
	if(level.script == "zm_moon")
	{
		while(!(isdefined(level.on_the_moon) && level.on_the_moon))
		{
			self BotSetGoal((22238.7, -39923.2, -605.625));
			wait(0.05);
		}
		self zm_equipment::give(level.var_f486078e);
		wait(0.1);
		self SwitchToWeapon(level.var_f486078e);
		while(isdefined(level.on_the_moon) && level.on_the_moon)
		{
			continue;
			self BotSetGoal((22238.7, -39923.2, -605.625));
			wait(0.1);
		}
	}
}

/*
	Name: on_bot_killed
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x2B00
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 898
*/
function on_bot_killed()
{
}

/*
	Name: function_ffb7e5e9
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x2B10
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 912
*/
function function_ffb7e5e9()
{
	if(!self BotGoalReached())
	{
		return;
	}
	teammate = self function_1e74c65d();
	if(teammate != self && Distance(teammate.origin, self.origin) > 1000)
	{
		self BotSetGoal(teammate.origin, 100);
		return;
	}
	if(self zm_utility::is_multiple_drinking() || self laststand::player_is_in_laststand() || self.score < 100)
	{
		return 0;
	}
	if(self namespace_fae32d79::wallbuy())
	{
		return;
	}
	else if(self namespace_fae32d79::doors())
	{
		return;
	}
	else if(self namespace_fae32d79::perk())
	{
		return;
	}
	self function_da7cb4d();
}

/*
	Name: function_da7cb4d
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x2C78
	Size: 0x518
	Parameters: 5
	Flags: None
	Line Number: 953
*/
function function_da7cb4d(fwd, radiusMin, radiusMax, spacing, fwdDot)
{
	if(isdefined(self.bot.var_beeeee21))
	{
		if(!self bot_combat::threat_visible())
		{
			self BotLookAtPoint(self.bot.var_beeeee21.origin);
			return;
		}
	}
	if(!self BotGoalReached())
	{
		return;
	}
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
		if(!isdefined(best_point) || (point.score > best_point.score && self function_99fbfe36(point)))
		{
			best_point = point;
		}
	}
	if(isdefined(best_point))
	{
		self BotSetGoal(best_point.origin, radiusMin);
		if(!self bot_combat::threat_visible())
		{
			self BotLookForward();
		}
	}
	else
	{
		self thread function_9e6f10b0();
	}
}

/*
	Name: function_e7cfbfc5
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x3198
	Size: 0x3B0
	Parameters: 5
	Flags: None
	Line Number: 1062
*/
function function_e7cfbfc5(radiusMin, radiusMax, spacing, sideDotMin, sideDotMax)
{
	if(isdefined(self.bot.var_beeeee21))
	{
		return;
	}
	if(!isdefined(radiusMin))
	{
		if(isdefined(level.botSettings.strafeMin))
		{
		}
		else
		{
		}
		radiusMin = 0;
	}
	if(!isdefined(radiusMax))
	{
		if(isdefined(level.botSettings.strafeMax))
		{
		}
		else
		{
		}
		radiusMax = 0;
	}
	if(!isdefined(spacing))
	{
		if(isdefined(level.botSettings.strafeSpacing))
		{
		}
		else
		{
		}
		spacing = 0;
	}
	if(!isdefined(sideDotMin))
	{
		if(isdefined(level.botSettings.strafeSideDotMin))
		{
		}
		else
		{
		}
		sideDotMin = 0;
	}
	if(!isdefined(sideDotMax))
	{
		if(isdefined(level.botSettings.strafeSideDotMax))
		{
		}
		else
		{
		}
		sideDotMax = 0;
	}
	fwd = AnglesToForward(self.angles);
	queryResult = PositionQuery_Source_Navigation(self.origin, radiusMin, radiusMax, 64, spacing, self);
	best_point = undefined;
	foreach(point in queryResult.data)
	{
		moveDir = VectorNormalize(point.origin - self.origin);
		dot = VectorDot(moveDir, fwd);
		if(dot >= sideDotMin && dot <= sideDotMax)
		{
			point.score = mapfloat(radiusMin, radiusMax, 0, 50, point.distToOrigin2D);
			point.score = point.score + RandomFloatRange(0, 50);
		}
		if(!isdefined(best_point) || (point.score > best_point.score && self function_99fbfe36(point)))
		{
			best_point = point;
		}
	}
	if(isdefined(best_point))
	{
		self BotSetGoal(best_point.origin);
	}
}

/*
	Name: function_9e6f10b0
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x3550
	Size: 0x180
	Parameters: 1
	Flags: None
	Line Number: 1151
*/
function function_9e6f10b0(direction)
{
	self endon("death");
	level endon("end_game");
	self clear_stuck();
	self BotTakeManualControl();
	if(isdefined(direction))
	{
		escapeAngle = direction[1] + randomIntRange(-30, 30);
		escapeDir = AnglesToForward((0, escapeAngle, 0));
	}
	else
	{
		escapeAngle = self GetAngles()[1] + 180 + randomIntRange(-60, 60);
		escapeDir = AnglesToForward((0, escapeAngle, 0));
	}
	self BotSetMoveAngle(escapeDir);
	self BotSetMoveMagnitude(1);
	wait(1);
	self BotReleaseManualControl();
	self BotSetGoal(self.origin, 64);
}

/*
	Name: function_99fbfe36
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x36D8
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 1184
*/
function function_99fbfe36(point)
{
	if(self CanPath(self.origin, point.origin))
	{
		return zm_utility::check_point_in_enabled_zone(point.origin);
	}
	return 0;
}

/*
	Name: function_1e74c65d
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x3738
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 1203
*/
function function_1e74c65d(var_95fa2795)
{
	if(!isdefined(var_95fa2795))
	{
		var_95fa2795 = 1;
	}
	var_7a703932 = [];
	for(i = 0; i < level.activePlayers.size; i++)
	{
		if(!level.activePlayers[i] IsTestClient())
		{
			if(var_95fa2795 && !self CanPath(self.origin, level.activePlayers[i].origin))
			{
				continue;
			}
			var_7a703932[var_7a703932.size] = level.activePlayers[i];
		}
	}
	near_player = ArrayGetClosest(self.origin, var_7a703932);
	if(isdefined(near_player))
	{
		return near_player;
	}
	return self;
}

/*
	Name: function_bee312d7
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x3860
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 1239
*/
function function_bee312d7(var_95fa2795)
{
	if(!isdefined(var_95fa2795))
	{
		var_95fa2795 = 1;
	}
	var_7a703932 = [];
	for(i = 0; i < level.activePlayers.size; i++)
	{
		if(level.activePlayers[i] != self && level.activePlayers[i] IsTestClient() && level.activePlayers[i] IsOnGround())
		{
			var_7a703932[var_7a703932.size] = level.activePlayers[i];
		}
	}
	if(var_7a703932.size == 0)
	{
		return self;
	}
	return ArrayGetClosest(self.origin, var_7a703932);
}

/*
	Name: function_99779806
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x3970
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 1270
*/
function function_99779806()
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
	if(velocity[0] < 5 && velocity[1] < 5)
	{
		if(!isdefined(self.bot.stuckCycles))
		{
			self.bot.stuckCycles = 0;
		}
		self.bot.stuckCycles++;
		if(self.bot.stuckCycles >= 3)
		{
			self thread function_9e6f10b0();
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
	Name: function_35fa3aaf
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x3B48
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 1315
*/
function function_35fa3aaf()
{
	self.bot.threat.entity = undefined;
	self bot_combat::clear_threat_aim();
}

/*
	Name: function_e881b7e0
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x3B80
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 1331
*/
function function_e881b7e0()
{
	if(isdefined(self.bot.var_660cc448))
	{
		trigger = self.bot.var_660cc448;
		if(isdefined(trigger.classname) && IsSubStr(trigger.classname, "trigger"))
		{
			if(self istouching(trigger))
			{
				self BotLookAtPoint(trigger.origin);
				for(i = 0; i < 2; i++)
				{
					self BotTapButton(3);
					wait(0.05);
				}
			}
		}
		else if(isdefined(level._unitriggers.trigger_pool[self.entity_num]) && trigger.origin === level._unitriggers.trigger_pool[self.entity_num].origin)
		{
			trigger = level._unitriggers.trigger_pool[self.entity_num];
			if(self istouching(trigger))
			{
				self BotLookAtPoint(trigger.origin);
				for(i = 0; i < 2; i++)
				{
					self BotTapButton(3);
					wait(0.05);
				}
			}
		}
	}
}

/*
	Name: function_fddab144
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x3D78
	Size: 0xD8
	Parameters: 3
	Flags: None
	Line Number: 1374
*/
function function_fddab144(trigger, radiusMax, spacing)
{
	if(!isdefined(spacing))
	{
		spacing = 128;
	}
	distSq = DistanceSquared(self.origin, trigger.origin);
	if(distSq < radiusMax * radiusMax)
	{
		self function_2e9465b2(trigger, radiusMax, spacing);
		return;
	}
	radiusMin = 0;
	self function_d51c120e(trigger.origin, radiusMin, radiusMax, spacing);
}

/*
	Name: function_2e9465b2
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x3E58
	Size: 0x298
	Parameters: 3
	Flags: None
	Line Number: 1400
*/
function function_2e9465b2(trigger, radius, spacing)
{
	mins = trigger GetMins();
	maxs = trigger GetMaxs();
	if(!isdefined(radius))
	{
		radius = min(maxs[0], maxs[1]);
	}
	height = maxs[2] - mins[2];
	minOrigin = trigger.origin + (0, 0, mins[2]);
	queryHeight = height / 4;
	queryOrigin = minOrigin + (0, 0, queryHeight);
	queryResult = PositionQuery_Source_Navigation(queryOrigin, 0, radius, queryHeight, 17, self);
	best_point = undefined;
	foreach(point in queryResult.data)
	{
		point.score = RandomFloatRange(0, 100);
		if(!isdefined(best_point) || (point.score > best_point.score && self function_99fbfe36(point)))
		{
			best_point = point;
		}
	}
	if(isdefined(best_point))
	{
		self BotSetGoal(best_point.origin, radius);
		return;
	}
	self function_5032d2d9(trigger, radius);
}

/*
	Name: function_5032d2d9
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x40F8
	Size: 0x150
	Parameters: 2
	Flags: None
	Line Number: 1440
*/
function function_5032d2d9(trigger, radius)
{
	if(isdefined(trigger.classname) && IsSubStr(trigger.classname, "trigger"))
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
	Name: function_d51c120e
	Namespace: bot
	Checksum: 0x424F4353
	Offset: 0x4250
	Size: 0x394
	Parameters: 4
	Flags: None
	Line Number: 1470
*/
function function_d51c120e(point, radiusMin, radiusMax, spacing)
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
		self BotSetGoal(point);
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
		if(!isdefined(best_point) || (point.score > best_point.score && self function_99fbfe36(point)))
		{
			best_point = point;
		}
	}
	if(isdefined(best_point))
	{
		self BotSetGoal(best_point.origin);
		return 1;
	}
	return 0;
}

