#include scripts\codescripts\struct;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\music_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_clientdvar;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_sub;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\banks;
#include scripts\zm\motherfucker;
#include scripts\zm\zmsavedata;

#namespace namespace_aab1d308;

/*
	Name: main
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x928
	Size: 0x78
	Parameters: 0
	Flags: AutoExec
	Line Number: 34
*/
function autoexec main()
{
	callback::on_connect(&function_11965755);
	level.var_9b1deffa = [];
	modvar("lua_save", "");
	modvar("lua_save2", "");
}

/*
	Name: function_11965755
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x9A8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function function_11965755()
{
	self endon("disconnect");
	self endon("death");
	level flag::wait_till("initial_blackscreen_passed");
	self thread function_489d46f5();
	wait(2);
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		self function_13396380(menu, response);
	}
}

/*
	Name: function_13396380
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0xA48
	Size: 0x398
	Parameters: 2
	Flags: None
	Line Number: 76
*/
function function_13396380(menu, response)
{
	if(IsSubStr(response, "ChatNotify") && menu == "restartgamepopup")
	{
		var_8b3b790e = StrTok(response, "â¦");
		if(var_8b3b790e[1][0] == "/")
		{
			self thread function_961cfc05(var_8b3b790e[1]);
		}
		else if(IsSubStr(var_8b3b790e[1], "Â¨"))
		{
			var_83269738 = StrTok(var_8b3b790e[1], "Â¨");
			var_7e1dde40 = "";
			foreach(text in var_83269738)
			{
				var_7e1dde40 = var_7e1dde40 + text;
				var_7e1dde40 = var_7e1dde40 + " ";
			}
			thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, var_7e1dde40);
		}
		else
		{
			thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, var_8b3b790e[1]);
		}
	}
	else if(IsSubStr(response, "elmgafk") && menu == "restartgamepopup")
	{
		self notify("hash_f9c9bf74");
		if(self.sessionstate == "playing")
		{
			if(response == "elmgafkon")
			{
				self thread function_1498288e(1);
			}
			else
			{
				self thread function_1498288e(0);
			}
		}
	}
	else if(IsSubStr(response, "ELMGMusic") && menu == "restartgamepopup")
	{
		var_8b3b790e = StrTok(response, "â¦");
		var_5b4e9817 = tableLookup("gamedata/tables/common/music_player.csv", 1, var_8b3b790e[2], 2);
		self CloseMenu("StartMenu_Main");
		IPrintLnBold("^3" + self.name, " ^5Ordered a Song^7: " + var_5b4e9817);
		function_27ba8b18(var_8b3b790e[1]);
		return;
	}
	~var_5b4e9817;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_489d46f5
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0xDE8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 139
*/
function function_489d46f5()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self waittill("chat", msg);
		if(msg[0] == "/")
		{
			self thread function_961cfc05(msg);
		}
		else
		{
			thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, msg);
		}
	}
}

/*
	Name: function_961cfc05
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0xE80
	Size: 0x5B8
	Parameters: 1
	Flags: None
	Line Number: 167
*/
function function_961cfc05(chat)
{
	chat = StrTok(chat, "/");
	for(i = 0; i < chat.size; i++)
	{
		chat[i] = ToLower(chat[i]);
	}
	switch(chat[0])
	{
		case "s":
		{
			self DoDamage(self.health, self.origin);
			break;
		}
		case "tp":
		{
			if(chat[1] != "" && chat.size == 2)
			{
				SetDvar("tp", self GetEntityNumber() + 1 + " " + chat[1]);
				break;
				break;
			}
		}
		case "ct":
		{
			if(chat[1] != "" && chat.size == 2)
			{
				self namespace_d87f1aa7::function_908a81cd("chatTimeInGameâ¦" + chat[1] + "000");
				self IPrintLnBold("^5Your chat duration has been changed to^7: " + chat[1] + "s.");
				break;
				break;
			}
		}
		case "a":
		{
			if(chat[1] != "" && chat.size == 2)
			{
				self thread play_player_anim(chat[1]);
				break;
				break;
			}
		}
		case "g":
		{
			if(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver") && GetDvarString("tfoption_gambler") == "1")
			{
				result = 0;
			}
			if(!isdefined(result))
			{
				if(isdefined(level.var_bd1b01f5))
				{
					trigger = GetEnt("elmg_gambler", "targetname");
					trigger thread [[level.var_bd1b01f5]](self);
					break;
				}
			}
		}
		case "r":
		{
			weapon = self GetCurrentWeapon();
			if(weapon.inventoryType == "primary" && zm_weapons::is_weapon_or_base_included(weapon))
			{
				clip = self GetWeaponAmmoClip(weapon);
				self SetWeaponAmmoClip(weapon, 0);
				if(isdefined(weapon.dualWieldWeapon))
				{
					var_8fe1b764 = self GetWeaponAmmoClip(weapon.dualWieldWeapon);
					self SetWeaponAmmoClip(weapon.dualWieldWeapon, 0);
				}
				wait(0.1);
				self SetWeaponAmmoClip(weapon, clip);
				if(isdefined(weapon.dualWieldWeapon))
				{
					self SetWeaponAmmoClip(weapon.dualWieldWeapon, var_8fe1b764);
					break;
				}
			}
		}
		case "?":
		{
			self thread function_cc054202();
			break;
		}
		case "cin":
		{
			if(!isdefined(self.current_player_scene))
			{
				if(!isdefined(self.gamevars["cin"]))
				{
					self LUINotifyEvent(&"player_afk", 2, 1, 0);
					self.gamevars["cin"] = 1;
				}
				else
				{
					self LUINotifyEvent(&"player_afk", 2, 0, 0);
					self.gamevars["cin"] = undefined;
					break;
				}
			}
		}
		case "ee":
		{
			self thread banks::function_72b4d2cf();
			break;
		}
		case "save":
		{
			self namespace_11e193f1::function_d7942e29(2);
			break;
			break;
		}
		default
		{
		}
	}
}

/*
	Name: function_1498288e
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x1440
	Size: 0x2D0
	Parameters: 1
	Flags: None
	Line Number: 295
*/
function function_1498288e(state)
{
	self endon("disconnect");
	if(isdefined(self.afk))
	{
		if(self.afk == 1)
		{
			if(state)
			{
				return;
			}
			self notify("hash_be2d651c");
			self SetLowReady(0);
			self LUINotifyEvent(&"player_afk", 1, 0);
			self zm_utility::function_adb1601b();
			self zm_utility::decrement_ignoreme();
			self.afk = undefined;
			return;
		}
		if(self.afk == 2)
		{
			if(state)
			{
				return;
			}
			self notify("hash_be2d651c");
			self.afk = undefined;
			return;
		}
	}
	if(!state)
	{
		return;
	}
	if(level.players.size > 1 && GetDvarString("aaeoption_afk") != "2" && self.sessionstate == "playing")
	{
		self endon("hash_be2d651c");
		if(GetDvarString("aaeoption_afk") == "1")
		{
			self.afk = 2;
			wait(5);
		}
		self.afk = 1;
		self LUINotifyEvent(&"player_afk", 1, 1);
		self zm_utility::increment_ignoreme();
		self zm_utility::function_ea3a8353();
		while(isdefined(self) && isdefined(self.afk) && self.afk == 1 && self.sessionstate == "playing" && level.players.size > 1)
		{
			self SetLowReady(1);
			wait(0.05);
		}
		if(!isdefined(self.afk))
		{
			return;
		}
		self SetLowReady(0);
		self LUINotifyEvent(&"player_afk", 1, 0);
		self zm_utility::function_adb1601b();
		self zm_utility::decrement_ignoreme();
		self.afk = undefined;
	}
}

/*
	Name: function_cc054202
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x1718
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 368
*/
function function_cc054202()
{
	self endon("disconnect");
	self endon("death");
	self notify("hash_cc054202");
	self endon("hash_cc054202");
	if(isdefined(self.var_cc054202))
	{
		self CloseLUIMenu(self.var_cc054202);
		wait(0.1);
	}
	self.var_cc054202 = self hud::function_1143b5c4(&"EXT_HELP", 1, 200, 50, 720, (1, 1, 1), 20, "0,400,1");
	wait(20);
	self CloseLUIMenu(self.var_cc054202);
}

/*
	Name: function_27ba8b18
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x17F0
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 394
*/
function function_27ba8b18(song)
{
	foreach(player in GetPlayers())
	{
		player stopsounds();
		player StopLoopSound(0);
	}
	level zm_audio::sndmusicsystem_stopandflush();
	music::setmusicstate("none");
	wait(0.1);
	level zm_audio::sndmusicsystem_playstate(song);
}

/*
	Name: play_player_anim
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x18F8
	Size: 0x880
	Parameters: 1
	Flags: None
	Line Number: 417
*/
function play_player_anim(num)
{
	if(isdefined(self.var_a09dcd5a) || isdefined(self.current_player_scene))
	{
		return;
	}
	if(self function_6c0b3401())
	{
		return;
	}
	switch(num)
	{
		case "1":
		{
			self function_12cb005a();
			self IPrintLnBold("Zombie");
			self thread scene::Play("pb_emote_shared_male_zombie", self);
			break;
		}
		case "2":
		{
			self function_12cb005a();
			self IPrintLnBold("Superhero");
			self thread scene::Play("pb_emote_shared_male_superhero_floating_arms_crossed", self);
			break;
		}
		case "3":
		{
			self function_12cb005a(1);
			self IPrintLnBold("Teddy");
			prop = util::spawn_model("p7_zm_teddybear", self GetTagOrigin("tag_sync"), self GetTagAngles("tag_sync"));
			level.var_9b1deffa[level.var_9b1deffa.size] = prop;
			prop EnableLinkTo();
			prop LinkTo(self, "tag_sync");
			prop clientfield::set("powerup_fx", 4);
			prop thread function_4e5eb791(self);
			self thread scene::Play("pb_emote_teddy", self);
			break;
		}
		case "4":
		{
			self function_12cb005a();
			self IPrintLnBold("Dance");
			self thread function_a69dcdac("amiens_emoteedit_lp", 48);
			self thread scene::Play("pb_emote_dance1", self);
			break;
		}
		case "5":
		{
			self function_12cb005a();
			self IPrintLnBold("Dance");
			self thread function_a69dcdac("slam_loop_f", 18);
			self thread scene::Play("pb_emote_dance2", self);
			break;
		}
		case "6":
		{
			self function_12cb005a();
			self IPrintLnBold("Dance");
			self thread function_a69dcdac("popnlock", 14);
			self thread scene::Play("pb_emote_dance3", self);
			break;
		}
		case "7":
		{
			self function_12cb005a();
			self IPrintLnBold("Dance");
			self thread function_a69dcdac("slam_loop_f", 18);
			self thread scene::Play("pb_emote_dance4", self);
			break;
		}
		case "8":
		{
			self function_12cb005a();
			self IPrintLnBold("Dance");
			self thread function_a69dcdac("popnlock", 14);
			self thread scene::Play("pb_emote_dance5", self);
			break;
		}
		case "9":
		{
			self function_12cb005a(1);
			self IPrintLnBold(&"WEAPON_RAY_GUN");
			self Attach("wpn_t7_zmb_raygun_world", "tag_weapon_right");
			self thread scene::Play("pb_emote_raygun", self);
			break;
		}
		case "10":
		{
			self function_12cb005a(1);
			self IPrintLnBold("Ball");
			if(level.script == "zm_genesis")
			{
				self Attach("wpn_t7_zmb_dlc4_summoning_key_world", "tag_weapon_right");
			}
			else
			{
				self Attach("wpn_t7_uplink_ball_world", "tag_weapon_right");
			}
			self thread scene::Play("pb_emote_ball", self);
			break;
		}
		case "11":
		{
			self function_12cb005a(1);
			self IPrintLnBold(&"ZMWEAPON_BOWIE");
			self Attach("wpn_t7_zmb_knife_bowie_view", "tag_weapon_right");
			self thread scene::Play("pb_emote_bowie", self);
			break;
		}
		case "12":
		{
			self function_12cb005a(1);
			self IPrintLnBold(&"WEAPON_MELEE_KATANA");
			self Attach("wpn_t7_loot_melee_katana_world", "tag_weapon_right");
			self thread scene::Play("pb_emote_katana", self);
			break;
		}
		case "13":
		{
			self function_12cb005a(1);
			self IPrintLnBold(&"SCOREEVENT_Jugger_Nog");
			self Attach("wpn_t7_zmb_perk_bottle_jugg_world", "tag_weapon_right");
			self thread scene::Play("pb_emote_perk", self);
			break;
		}
		case "14":
		{
			self function_12cb005a(1);
			self IPrintLnBold("Mine");
			self Attach("wpn_t7_spider_mine_prop_open", "tag_weapon_right");
			self thread scene::Play("pb_emote_mine", self);
			break;
			break;
		}
		default
		{
		}
	}
	return;
}

/*
	Name: function_4e5eb791
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x2180
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 569
*/
function function_4e5eb791(player)
{
	while(!isdefined(player.current_player_scene))
	{
		wait(0.048);
	}
	while(isdefined(player.current_player_scene) && isdefined(player))
	{
		wait(0.048);
	}
	wait(1);
	self delete();
}

/*
	Name: function_12cb005a
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x2200
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 593
*/
function function_12cb005a(skip)
{
	if(!isdefined(skip))
	{
		skip = 1;
	}
	if(isdefined(self.current_player_scene))
	{
		self scene::stop();
	}
	self namespace_d87f1aa7::function_908a81cd("cg_thirdpersonmodeâ¦0");
	self SetClientThirdPerson(0);
	wait(0.048);
	self SetClientThirdPerson(1);
	self.spectatingThirdPerson = 1;
	self DisableWeapons(1);
	self thread function_2db9d065(skip);
}

/*
	Name: function_2db9d065
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x22E8
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 622
*/
function function_2db9d065(skip)
{
	self endon("hash_ff422a77");
	self endon("disconnect");
	self endon("death");
	while(!isdefined(self.current_player_scene))
	{
		wait(0.048);
	}
	if(skip)
	{
		self thread function_b56ff2c6();
	}
	else
	{
		self.var_a09dcd5a = 1;
	}
	while(isdefined(self.current_player_scene))
	{
		wait(0.048);
	}
	self function_d55c625();
	wait(0.1);
	self SetClientThirdPerson(0);
	self.spectatingThirdPerson = 0;
	self enableWeapons();
	self.var_a09dcd5a = undefined;
	self namespace_d87f1aa7::function_908a81cd("cg_thirdpersonmodeâ¦1");
	self notify("hash_ff422a77");
}

/*
	Name: function_b56ff2c6
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x2410
	Size: 0x2E0
	Parameters: 0
	Flags: None
	Line Number: 663
*/
function function_b56ff2c6()
{
	self endon("hash_ff422a77");
	self endon("disconnect");
	self endon("death");
	self thread function_93e0bd27();
	while(self function_e2e4a173() || self ActionSlotFourButtonPressed() || self ActionSlotOneButtonPressed() || self ActionSlotThreeButtonPressed() || self ActionSlotTwoButtonPressed() || self AdsButtonPressed() || self AttackButtonPressed() || self fragButtonPressed() || self inventoryButtonPressed() || self JumpButtonPressed() || self meleeButtonPressed() || self OffhandSpecialButtonPressed() || self ReloadButtonPressed() || self SecondaryOffhandButtonPressed() || self SprintButtonPressed() || self StanceButtonPressed() || self throwbuttonpressed() || self useButtonPressed() || self WeaponSwitchButtonPressed() || self laststand::player_is_in_laststand() || self function_a451ac1())
	{
		self function_d55c625();
		self scene::stop();
		self SetClientThirdPerson(0);
		self.spectatingThirdPerson = 0;
		self namespace_d87f1aa7::function_908a81cd("cg_thirdpersonmodeâ¦1");
		self enableWeapons();
		self.var_a09dcd5a = undefined;
		self notify("hash_ff422a77");
		wait(0.048);
	}
}

/*
	Name: function_6c0b3401
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x26F8
	Size: 0x3D8
	Parameters: 0
	Flags: None
	Line Number: 693
*/
function function_6c0b3401()
{
	if(self function_e2e4a173() || self ActionSlotFourButtonPressed() || self ActionSlotOneButtonPressed() || self ActionSlotThreeButtonPressed() || self ActionSlotTwoButtonPressed() || self AdsButtonPressed() || self AttackButtonPressed() || self fragButtonPressed() || self inventoryButtonPressed() || self JumpButtonPressed() || self meleeButtonPressed() || self OffhandSpecialButtonPressed() || self ReloadButtonPressed() || self SecondaryOffhandButtonPressed() || self SprintButtonPressed() || self StanceButtonPressed() || self throwbuttonpressed() || self useButtonPressed() || self WeaponSwitchButtonPressed())
	{
		return 1;
	}
	if(!self IsOnGround() || self.sessionstate == "spectator" || self IsPlayerSwimming() || self IsPlayerUnderwater() || self IsWallRunning() || self function_679da569() || self issprinting() || self IsReloading() || self IsSwitchingWeapons() || self isusingoffhand() || self IsThrowingGrenade())
	{
		return 1;
	}
	if(self getvelocity() != 0 || self GetCurrentWeapon().inventoryType != "primary" || zm_weapons::is_weapon_or_base_included(self GetCurrentWeapon()) != 1)
	{
		return 1;
	}
	if(self laststand::player_is_in_laststand() || (isdefined(self.reviveTrigger) && self.laststand == 1) || self.IS_DRINKING > 0)
	{
		return 1;
	}
	if(self function_a451ac1())
	{
		return 1;
	}
	return self function_80b825eb();
}

/*
	Name: function_80b825eb
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x2AD8
	Size: 0x3C8
	Parameters: 0
	Flags: None
	Line Number: 728
*/
function function_80b825eb()
{
	trigs = [];
	if(!isdefined(trigs))
	{
		trigs = [];
	}
	else if(!IsArray(trigs))
	{
		trigs = Array(trigs);
	}
	trigs[trigs.size] = GetEntArray("trigger_use", "classname");
	if(!isdefined(trigs))
	{
		trigs = [];
	}
	else if(!IsArray(trigs))
	{
		trigs = Array(trigs);
	}
	trigs[trigs.size] = GetEntArray("trigger_radius", "classname");
	if(!isdefined(trigs))
	{
		trigs = [];
	}
	else if(!IsArray(trigs))
	{
		trigs = Array(trigs);
	}
	trigs[trigs.size] = GetEntArray("trigger_use_touch", "classname");
	foreach(var_44af1788 in trigs)
	{
		foreach(trig in var_44af1788)
		{
			if(IsSubStr(trig.classname, "use") || IsSubStr(trig.classname, "exterior_goal") || (isdefined(trig.var_aa8e5bd9) && trig.var_aa8e5bd9))
			{
				if(self istouching(trig))
				{
					return 1;
				}
			}
		}
	}
	zbarriers = struct::get_array("exterior_goal", "targetname");
	foreach(z in zbarriers)
	{
		if(Distance(self.origin, z.origin) < 70)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_a451ac1
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x2EA8
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 792
*/
function function_a451ac1()
{
	if(GetAITeamArray("axis").size != 0)
	{
		zombies = Array::get_all_closest(self.origin, GetAITeamArray("axis"), undefined, 1);
		var_bc95555e = Distance(self.origin, zombies[0].origin);
		var_bc95555e = Int(var_bc95555e * 2.54);
		var_bc95555e = var_bc95555e / 100;
		var_bc95555e = Int(var_bc95555e);
		if(var_bc95555e < 3)
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}
	else
	{
		return 0;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_93e0bd27
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x2FC8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 828
*/
function function_93e0bd27()
{
	self util::waittill_any("damage", "elmg_emote");
	if(isdefined(self.current_player_scene))
	{
		self function_d55c625();
		self scene::stop();
		self SetClientThirdPerson(0);
		self.spectatingThirdPerson = 0;
		self namespace_d87f1aa7::function_908a81cd("cg_thirdpersonmodeâ¦1");
		self enableWeapons();
		self.var_a09dcd5a = undefined;
		self notify("hash_ff422a77");
	}
}

/*
	Name: function_d55c625
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x30A8
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 854
*/
function function_d55c625()
{
	self Detach("wpn_t7_zmb_raygun_world", "tag_weapon_right");
	if(level.script == "zm_genesis")
	{
		self Detach("wpn_t7_zmb_dlc4_summoning_key_world", "tag_weapon_right");
	}
	else
	{
		self Detach("wpn_t7_uplink_ball_world", "tag_weapon_right");
	}
	self Detach("wpn_t7_zmb_knife_bowie_view", "tag_weapon_right");
	self Detach("wpn_t7_loot_melee_katana_world", "tag_weapon_right");
	self Detach("wpn_t7_zmb_perk_bottle_jugg_world", "tag_weapon_right");
	self Detach("wpn_t7_spider_mine_prop_open", "tag_weapon_right");
	wait(0.1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a69dcdac
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x31E8
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 884
*/
function function_a69dcdac(sound, time)
{
	self endon("hash_ff422a77");
	self endon("disconnect");
	self endon("death");
	self thread function_337b7b50(sound);
	for(;;)
	{
		self playsound(sound);
		wait(time);
	}
}

/*
	Name: function_337b7b50
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x3260
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 907
*/
function function_337b7b50(sound)
{
	self endon("disconnect");
	self endon("death");
	self waittill("hash_ff422a77");
	wait(0.08);
	self stopsound(sound);
}

/*
	Name: function_e2db1ae
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x32C0
	Size: 0x2F0
	Parameters: 0
	Flags: None
	Line Number: 926
*/
function function_e2db1ae()
{
	self endon("hash_8e8f403e");
	self endon("disconnect");
	self endon("death");
	if(!zm_utility::is_player_valid(self) || isdefined(self.var_45446b50))
	{
		return;
	}
	var_f4defb11 = self function_808a49fd()[0];
	var_a6712c9f = self function_808a49fd()[1];
	self.var_e23018e4 = "start";
	if(isdefined(self.var_53fcdbb))
	{
		self CameraActivate(0);
		self.var_53fcdbb delete();
	}
	self.var_53fcdbb = spawn("script_model", VectorScale((1, 1, 1), 69));
	self thread function_cab8938b(self.var_53fcdbb);
	self.var_53fcdbb SetModel("tag_origin");
	self.var_53fcdbb.origin = self GetPlayerCameraPos() + VectorScale((0, 0, 1), 10);
	self.var_53fcdbb.angles = self getPlayerAngles();
	self CameraSetPosition(self.var_53fcdbb);
	self CameraSetLookAt();
	self CameraActivate(1);
	self zm_utility::create_streamer_hint(var_f4defb11, var_a6712c9f, 10);
	self playlocalsound("bfone_up");
	self.var_53fcdbb moveto(var_f4defb11, 1, 0.99, 0.01);
	wait(0.375);
	self.var_53fcdbb RotateTo(var_a6712c9f, 1, 0.6, 0.4);
	wait(0.95);
	self util::setClientSysState("deadshot_keyline", "light,1", self);
	self.var_e23018e4 = "idle";
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: function_cab8938b
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x35B8
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 974
*/
function function_cab8938b(cam)
{
	self endon("disconnect");
	self endon("death");
	self endon("hash_cab8938b");
	self thread function_f83243de();
	self util::waittill_any_timeout(10, "damage", "map_view_over", "weapon_fired", "end_game", "disconnect");
	self thread function_863a831d(cam);
}

/*
	Name: function_863a831d
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x3660
	Size: 0x420
	Parameters: 1
	Flags: None
	Line Number: 994
*/
function function_863a831d(cam)
{
	self notify("hash_8e8f403e");
	self endon("hash_b58cf140");
	if(!isdefined(self))
	{
		cam delete();
		return;
	}
	self endon("disconnect");
	self endon("death");
	self namespace_d87f1aa7::function_908a81cd("r_exposureTweakâ¦0");
	var_808a49fd = self function_808a49fd();
	var_f4defb11 = var_808a49fd[0];
	var_a6712c9f = var_808a49fd[1];
	self.var_e23018e4 = "over";
	if(isdefined(self.var_b58cf140))
	{
		self CameraActivate(0);
		self.var_b58cf140 delete();
	}
	self.var_b58cf140 = spawn("script_model", VectorScale((1, 1, 1), 69));
	self.var_b58cf140 SetModel("tag_origin");
	if(isdefined(self.var_53fcdbb.origin))
	{
		self.var_b58cf140.origin = self.var_53fcdbb.origin;
	}
	else
	{
		self.var_b58cf140.origin = var_f4defb11;
	}
	if(isdefined(self.var_53fcdbb.angles))
	{
		self.var_b58cf140.angles = self.var_53fcdbb.angles;
	}
	else
	{
		self.var_b58cf140.angles = var_a6712c9f;
	}
	self CameraSetPosition(self.var_b58cf140);
	self CameraSetLookAt();
	self CameraActivate(1);
	origin = self GetPlayerCameraPos() + AnglesToForward(self.angles) * 10 + VectorScale((0, 0, 1), 10);
	self playlocalsound("bfone_down");
	self DisableWeapons(1);
	self.var_b58cf140 moveto(origin, 0.65, 0.64, 0.01);
	wait(0.4);
	self zm_utility::clear_streamer_hint();
	self.var_b58cf140 RotateTo(self getPlayerAngles(), 0.4, 0.39, 0.01);
	wait(0.38);
	self CameraActivate(0);
	self enableWeapons();
	if(isdefined(self.var_53fcdbb))
	{
		self.var_53fcdbb delete();
	}
	if(isdefined(self.var_b58cf140))
	{
		self.var_b58cf140 delete();
	}
	self notify("hash_cab8938b");
	self.var_e23018e4 = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f83243de
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x3A88
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 1070
*/
function function_f83243de()
{
	self endon("disconnect");
	self endon("death");
	self endon("hash_3128fe8");
	while(self function_e2e4a173() || self ActionSlotFourButtonPressed() || self ActionSlotOneButtonPressed() || self ActionSlotThreeButtonPressed() || self ActionSlotTwoButtonPressed() || self AdsButtonPressed() || self AttackButtonPressed() || self fragButtonPressed() || self inventoryButtonPressed() || self JumpButtonPressed() || self meleeButtonPressed() || self OffhandSpecialButtonPressed() || self ReloadButtonPressed() || self SecondaryOffhandButtonPressed() || self SprintButtonPressed() || self StanceButtonPressed() || self throwbuttonpressed() || self useButtonPressed() || self WeaponSwitchButtonPressed() || self laststand::player_is_in_laststand() || self function_a451ac1())
	{
		self notify("hash_3128fe8");
		wait(0.048);
	}
}

/*
	Name: function_808a49fd
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x3CC8
	Size: 0x4E0
	Parameters: 0
	Flags: None
	Line Number: 1092
*/
function function_808a49fd()
{
	origin = Array((0, 0, 0), (0, 0, 0));
	switch(level.script)
	{
		case "zm_zod":
		{
			origin = Array((1588.81, -397.377, 4049.22), (50.4163, -88.9618, 0));
			break;
		}
		case "zm_factory":
		{
			origin = Array((-1150.04, -809.075, 1708.71), (59.4196, 1.45569, 0));
			break;
		}
		case "zm_castle":
		{
			origin = Array((318.678, 407.218, 2414.83), (47.2028, 82.9248, 0));
			break;
		}
		case "zm_island":
		{
			origin = Array((2169.18, -1861.76, 2219.52), (62.5946, 141.905, 0));
			break;
		}
		case "zm_stalingrad":
		{
			origin = Array((-5.85639, 1548.04, 2388.97), (68.8403, 90.4944, 0));
			break;
		}
		case "zm_genesis":
		{
			origin = Array((-839.397, 4949.01, 6893.89), (59.5569, -89.1431, 0));
			break;
		}
		case "zm_theater":
		{
			origin = Array((61.5047, -719.683, 2706.48), (70, 91.3623, 0));
			break;
		}
		case "zm_prototype":
		{
			origin = Array((1928.1, 226.309, 3133.87), (72.1857, -179.506, 0));
			break;
		}
		case "zm_asylum":
		{
			origin = Array((114.352, 1771.54, 3684.02), (70, -90.1099, 0));
			break;
		}
		case "zm_sumpf":
		{
			origin = Array((10051.7, -1677.13, 3621.35), (69.093, 87.6984, 0));
			break;
		}
		case "zm_moon":
		{
			origin = Array((-2742.11, 3464.04, 5334.57), (70, -2.66968, 0));
			break;
		}
		case "zm_temple":
		{
			origin = Array((-6.66813, 307.052, 2149.32), (66.3574, -89.7748, 0));
			break;
		}
		case "zm_cosmodrome":
		{
			origin = Array((-2856.39, 419.879, 6690.03), (70, 0.97774, 0));
			break;
		}
		case "zm_tomb":
		{
			origin = Array((79.3306, 5499.59, 8729.49), (69.9994, -89.5441, 0));
			break;
		}
		default
		{
			origin = Array(self.origin + VectorScale((0, 0, 1), 2000), (70, self.angles[1] + 90, self.angles[2]));
			break;
		}
	}
	return origin;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_aa85dde5
	Namespace: namespace_aab1d308
	Checksum: 0x424F4353
	Offset: 0x41B0
	Size: 0x4BE
	Parameters: 2
	Flags: None
	Line Number: 1187
*/
function function_aa85dde5(origin, angles)
{
	switch(level.script)
	{
		case "zm_zod":
		{
			origin = Array((1588.81, -397.377, 4049.22), (50.4163, -88.9618, 0));
			break;
		}
		case "zm_factory":
		{
			origin = Array((-1150.04, -809.075, 1708.71), (59.4196, 1.45569, 0));
			break;
		}
		case "zm_castle":
		{
			origin = Array((318.678, 407.218, 2414.83), (47.2028, 82.9248, 0));
			break;
		}
		case "zm_island":
		{
			origin = Array((2169.18, -1861.76, 2219.52), (62.5946, 141.905, 0));
			break;
		}
		case "zm_stalingrad":
		{
			origin = Array((-5.85639, 1548.04, 2388.97), (68.8403, 90.4944, 0));
			break;
		}
		case "zm_genesis":
		{
			origin = Array((-839.397, 4949.01, 6893.89), (59.5569, -89.1431, 0));
			break;
		}
		case "zm_theater":
		{
			origin = Array((61.5047, -719.683, 2706.48), (70, 91.3623, 0));
			break;
		}
		case "zm_prototype":
		{
			origin = Array((1928.1, 226.309, 3133.87), (72.1857, -179.506, 0));
			break;
		}
		case "zm_asylum":
		{
			origin = Array((114.352, 1771.54, 3684.02), (70, -90.1099, 0));
			break;
		}
		case "zm_sumpf":
		{
			origin = Array((10051.7, -1677.13, 3621.35), (69.093, 87.6984, 0));
			break;
		}
		case "zm_moon":
		{
			origin = Array((-2742.11, 3464.04, 5334.57), (70, -2.66968, 0));
			break;
		}
		case "zm_temple":
		{
			origin = Array((-6.66813, 307.052, 2149.32), (66.3574, -89.7748, 0));
			break;
		}
		case "zm_cosmodrome":
		{
			origin = Array((-2856.39, 419.879, 6690.03), (70, 0.97774, 0));
			break;
		}
		case "zm_tomb":
		{
			origin = Array((79.3306, 5499.59, 8729.49), (69.9994, -89.5441, 0));
			break;
		}
		default
		{
			origin = Array(origin + VectorScale((0, 0, 1), 2000), (80, angles[1], angles[2]));
			break;
		}
	}
	return origin;
}

