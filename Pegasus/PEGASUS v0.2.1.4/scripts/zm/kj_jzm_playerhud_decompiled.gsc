#include scripts\codescripts\struct;
#include scripts\shared\_burnplayer;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\gameobjects_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\kj_jzm_boxshare;
#include scripts\zm\kj_jzm_callouts;
#include scripts\zm\kj_jzm_gamemodes;
#include scripts\zm\kj_jzm_laserfix;
#include scripts\zm\kj_jzm_playerhealth;
#include scripts\zm\kj_jzm_rankicon;
#include scripts\zm\kj_jzm_waypoints;
#include scripts\zm\kj_jzm_weaponboost;
#include scripts\zm\kj_jzm_xp;
#include scripts\zm\zmsavedata;

#namespace namespace_32dd7dbd;

/*
	Name: __init__sytem__
	Namespace: namespace_32dd7dbd
	Checksum: 0xED41DA0B
	Offset: 0xA40
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 52
*/
function autoexec __init__sytem__()
{
	system::register("kj_jzm_playerhud", &__init__, &__main__, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_32dd7dbd
	Checksum: 0xB08889E8
	Offset: 0xA88
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 68
*/
function __init__()
{
	callback::on_connect(&on_player_connect);
}

/*
	Name: __main__
	Namespace: namespace_32dd7dbd
	Checksum: 0xFE3FBE80
	Offset: 0xAB8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 83
*/
function __main__()
{
	SetDvar("cg_disableplayernames", 1);
	SetDvar("scr_firstGumFree", 1);
	if(GetDvarInt("sv_cheats") > 0 || GetDvarInt("zombie_cheat") > 0)
	{
		level notify("end_game");
		return;
	}
	level flag::clear("spawn_zombies");
	level.musicsystemoverride = 1;
}

/*
	Name: function_b74c151a
	Namespace: namespace_32dd7dbd
	Checksum: 0x8AFDFA5B
	Offset: 0xB78
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 106
*/
function function_b74c151a(weapon)
{
	self show();
	self setClientUIVisibilityFlag("hud_visible", 1);
	self setClientUIVisibilityFlag("weapon_hud_visible", 1);
	self AllowMelee(1);
	self AllowAds(1);
	self EnableOffhandWeapons();
	self EnableWeaponCycling();
	self CameraActivate(0);
	self setMoveSpeedScale(1);
	wait(0.1);
	if(!isdefined(self.var_963eb9c7))
	{
		self zm_weapons::weapon_give(weapon, undefined, undefined, 1);
	}
}

/*
	Name: on_player_connect
	Namespace: namespace_32dd7dbd
	Checksum: 0x28CD993C
	Offset: 0xCB0
	Size: 0x4A0
	Parameters: 0
	Flags: None
	Line Number: 134
*/
function on_player_connect()
{
	if(self IsTestClient())
	{
		return;
	}
	if(self IsSplitscreen() && !self IsHost())
	{
		return;
	}
	self.var_a73bce6b = newClientHudElem(self);
	self.var_a73bce6b.x = 83;
	self.var_a73bce6b.y = 101;
	self.var_a73bce6b.alignX = "left";
	self.var_a73bce6b.alignY = "top";
	self.var_a73bce6b.horzAlign = "fullscreen";
	self.var_a73bce6b.vertAlign = "fullscreen";
	self.var_a73bce6b.alpha = 1;
	self.var_a73bce6b.fontscale = 1.1;
	self.var_a73bce6b.foreground = 1;
	self.var_a73bce6b.hidewheninmenu = 1;
	self.var_a2be355 = self getXuid();
	self.var_7e6b6d74 = newClientHudElem(self);
	self.var_7e6b6d74.x = 30;
	self.var_7e6b6d74.y = 180;
	self.var_7e6b6d74.color = VectorScale((1, 0, 0), 0.8);
	self.var_7e6b6d74.alignX = "left";
	self.var_7e6b6d74.alignY = "top";
	self.var_7e6b6d74.horzAlign = "fullscreen";
	self.var_7e6b6d74.vertAlign = "fullscreen";
	self.var_7e6b6d74.alpha = 1;
	self.var_7e6b6d74.fontscale = 1.1;
	self.var_7e6b6d74.foreground = 1;
	self.var_7e6b6d74.hidewheninmenu = 1;
	if(self IsSplitscreen())
	{
		self.var_a73bce6b.x = 41.5;
		self.var_a73bce6b.y = 50.5;
		self.var_7e6b6d74.x = 15;
		self.var_7e6b6d74.y = 90;
	}
	self.var_1c43abc3 = 0;
	self.var_b93089b6 = 0;
	self.var_188c9f4d = 25000;
	self.var_9d6730be = 0;
	self.var_fc421594 = "zombierank_1";
	self.var_b36224f8 = "mpl_promotion";
	self.var_fdb8642e = 0;
	self.var_49a07362 = 1;
	self.var_709323d5 = 15;
	self.var_1ad2f4ac = "^9[^5PZM^9]^7" + self.name;
	self.perk_purchase_limit = 0;
	self.var_1f28099c = Array();
	self.var_15511cdf = 0;
	self.var_dd7af6c9 = 0;
	self.var_53d81061 = 0;
	self.var_97807449 = 0;
	self.var_a40cc2b1 = 0;
	self.var_4dacfab9 = 0;
	self.var_437ef106 = 0;
	self.var_5abe532d = 0;
	self.var_7b1993d1 = 0;
	self.var_1bb19491 = 0;
	self.var_6066ec4e = 0;
	MapName = GetDvarString("mapname");
	wait(0.05);
	if(isdefined(self.is_hotjoining))
	{
	}
	else
	{
		level flag::wait_till("start_zombie_round_logic");
		self thread function_1122d681(MapName);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_373d79d0
	Namespace: namespace_32dd7dbd
	Checksum: 0xA84B17B5
	Offset: 0x1158
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 222
*/
function function_373d79d0()
{
	level flag::wait_till("initial_blackscreen_passed");
	wait(RandomFloatRange(1.2, 2.65));
	self SetControllerUIModelValue("pegasus_player", "JZMLoadscreen");
	wait(RandomFloatRange(1.2, 3.65));
	self SetControllerUIModelValue("pegasus_player", "JZMLoadscreen");
	if(self IsHost())
	{
		level flag::set("spawn_zombies");
	}
}

/*
	Name: function_ca94d1d5
	Namespace: namespace_32dd7dbd
	Checksum: 0x1A2E401E
	Offset: 0x1250
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 245
*/
function function_ca94d1d5(MapName)
{
	self SetControllerUIModelValue("pegasus_player", "JZMLoadscreen");
	self function_40c647ff();
	self function_3041599a();
	self.var_3d231107 = gameobjects::get_next_obj_id();
	self.var_c77b20b7 = gameobjects::get_next_obj_id();
	self function_32d2a35b();
	self namespace_c1c38b58::function_9d7231f9();
	self thread function_6df33624();
	wait(0.25);
	self thread function_117d7e49();
}

/*
	Name: function_117d7e49
	Namespace: namespace_32dd7dbd
	Checksum: 0x9E64D08C
	Offset: 0x1358
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 269
*/
function function_117d7e49()
{
	level waittill("start_of_round");
	if(!isdefined(self.var_3e958c62))
	{
		self namespace_9aaa7736::callouts();
	}
}

/*
	Name: function_1811fa4c
	Namespace: namespace_32dd7dbd
	Checksum: 0x8E18BC30
	Offset: 0x1398
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 288
*/
function function_1811fa4c()
{
	players = GetPlayers();
	foreach(player in players)
	{
		if(player IsTestClient())
		{
			ArrayRemoveValue(players, player);
		}
	}
	return players;
}

/*
	Name: function_1122d681
	Namespace: namespace_32dd7dbd
	Checksum: 0x5DAB7B63
	Offset: 0x1468
	Size: 0x510
	Parameters: 1
	Flags: None
	Line Number: 311
*/
function function_1122d681(MapName)
{
	var_9fe0d4a1 = 0;
	if(!IsInArray(Array("zm_cosmodrome", "zm_moon", "zm_zurgtower_kj", "zm_leviathan", "zm_prison", "zm_blockbuster_kj", "zm_consulate"), MapName))
	{
		var_9fe0d4a1 = 1;
		self function_d35567ee(var_9fe0d4a1);
	}
	else
	{
		self thread function_373d79d0();
		level waittill("end_of_round");
		self function_acf309c6();
	}
	if(var_9fe0d4a1 == 1)
	{
		self function_59923645(var_9fe0d4a1);
		wait(0.65);
	}
	else
	{
		self function_cd5dd04d();
	}
	weapon = self GetCurrentWeapon();
	self TakeWeapon(weapon);
	if(self IsHost())
	{
		players = function_1811fa4c();
		wait(0.05);
		self namespace_afd88775::function_710ca4a5(players);
		self namespace_afd88775::function_66f1be4a();
		self namespace_afd88775::function_b68b5eb5(players);
		namespace_80a8617d::function_8e722e7a();
		foreach(player in players)
		{
			player function_40c647ff();
			wait(0.05);
		}
	}
	else
	{
		wait(RandomFloatRange(6, 10));
	}
	if(var_9fe0d4a1 == 1)
	{
		self function_12130f6f(var_9fe0d4a1);
	}
	else
	{
		self SetControllerUIModelValue("pegasus_player", "JZMLoadscreen");
	}
	self SetControllerUIModelValue("pegasus_player", "JZMLoadscreen");
	self function_32d2a35b();
	self function_b74c151a(weapon);
	if(self IsHost())
	{
		wait(0.05);
		foreach(player in players)
		{
			player function_3041599a();
			player.var_3d231107 = gameobjects::get_next_obj_id();
			player.var_c77b20b7 = gameobjects::get_next_obj_id();
			wait(0.05);
		}
		self namespace_bc075b67::function_2795f3b6();
		wait(0.1);
		self function_16f42f32(players);
		self function_2002adfc();
		level thread namespace_683dd809::function_c7aa6ee1(players);
		self function_703e15a1();
	}
	else
	{
		wait(3.5);
	}
	self namespace_c1c38b58::function_9d7231f9();
	self thread function_6df33624();
	wait(1);
	self thread function_117d7e49();
}

/*
	Name: function_3041599a
	Namespace: namespace_32dd7dbd
	Checksum: 0x7A8B643B
	Offset: 0x1980
	Size: 0x7A0
	Parameters: 0
	Flags: None
	Line Number: 402
*/
function function_3041599a()
{
	self.var_a3bde1f5 = self namespace_11e193f1::function_69424d4c(63);
	var_a45be61d = self namespace_11e193f1::function_69424d4c(64);
	wait(0.05);
	var_cefa04ab = self namespace_11e193f1::function_69424d4c(65);
	if(var_cefa04ab == 0)
	{
		self namespace_11e193f1::function_89cedfa0(5, 0);
		self.var_9d6730be = 0;
		wait(0.2);
		self namespace_11e193f1::function_89cedfa0(65, 1);
	}
	var_a9c1ef36 = self namespace_11e193f1::function_69424d4c(66);
	var_a9c1ef36++;
	wait(0.1);
	if(var_a9c1ef36 >= 60000)
	{
		wait(0.05);
		var_a9c1ef36 = 0;
		self namespace_11e193f1::function_89cedfa0(66, 0);
		wait(0.2);
		var_a45be61d++;
		self namespace_11e193f1::function_89cedfa0(64, var_a45be61d);
	}
	else
	{
		self namespace_11e193f1::function_89cedfa0(66, var_a9c1ef36);
	}
	if(var_a45be61d > 0)
	{
		var_d38719e1 = var_a45be61d * 60000 + var_a9c1ef36;
	}
	else
	{
		var_d38719e1 = var_a9c1ef36;
	}
	self.var_3298b74b = self namespace_11e193f1::function_69424d4c(68);
	self.var_aa8af75b = 0;
	self.var_2b256ab0 = self namespace_11e193f1::function_69424d4c(69);
	wait(0.05);
	self.var_fd7ad041 = self namespace_11e193f1::function_69424d4c(70);
	self.var_5ed359e9 = 0;
	self.var_e233e746 = self namespace_11e193f1::function_69424d4c(71);
	wait(0.05);
	self.pers["downs"] = self namespace_11e193f1::function_69424d4c(72);
	self.pers["deaths"] = self namespace_11e193f1::function_69424d4c(73);
	wait(0.05);
	self.pers["revives"] = self namespace_11e193f1::function_69424d4c(74);
	self.var_97807449 = self.pers["revives"];
	self.var_3167ee6e = self namespace_11e193f1::function_69424d4c(75);
	self.var_3b22ef76 = self namespace_11e193f1::function_69424d4c(76);
	self.var_ba240b2d = self namespace_11e193f1::function_69424d4c(77);
	self.pers["use_pap"] = self namespace_11e193f1::function_69424d4c(78);
	wait(0.05);
	self.var_a40cc2b1 = self.pers["use_pap"];
	self.pers["drops"] = self namespace_11e193f1::function_69424d4c(79);
	self.var_4dacfab9 = self.pers["drops"];
	wait(0.05);
	self.pers["use_magicbox"] = self namespace_11e193f1::function_69424d4c(80);
	self.var_437ef106 = self.pers["use_magicbox"];
	self.pers["wallbuy_weapons_purchased"] = self namespace_11e193f1::function_69424d4c(90);
	wait(0.05);
	self.var_5abe532d = self.pers["wallbuy_weapons_purchased"];
	self.pers["perks_drank"] = self namespace_11e193f1::function_69424d4c(91);
	self.var_7b1993d1 = self.pers["perks_drank"];
	wait(0.05);
	self.pers["doors_purchased"] = self namespace_11e193f1::function_69424d4c(92);
	self.var_1bb19491 = self.pers["doors_purchased"];
	self.pers["bgbs_chewed"] = self namespace_11e193f1::function_69424d4c(93);
	wait(0.05);
	self.var_6066ec4e = self.pers["bgbs_chewed"];
	var_25f308d1 = self namespace_11e193f1::function_69424d4c(94);
	wait(0.1);
	self.var_600fe65b = self namespace_11e193f1::function_69424d4c(95);
	var_4bf5833a = var_25f308d1 / 100;
	var_71f7fda3 = var_4bf5833a * 40000;
	wait(0.05);
	self.pers["distance_traveled"] = var_71f7fda3;
	wait(0.05);
	self.var_851a009c = self namespace_11e193f1::function_69424d4c(96);
	self.var_1a6206fe = self namespace_11e193f1::function_69424d4c(97);
	self.var_670d2e3d = self namespace_11e193f1::function_69424d4c(98);
	wait(0.05);
	self.var_143784f9 = self namespace_11e193f1::function_69424d4c(100);
	self.var_88f77384 = self namespace_11e193f1::function_69424d4c(101);
	wait(0.05);
	self.var_611fdd14 = self namespace_11e193f1::function_69424d4c(102);
	self.var_2425dc14 = self namespace_11e193f1::function_69424d4c(103);
	self.var_de70c620 = self namespace_11e193f1::function_69424d4c(104);
	wait(0.05);
	self.var_9cbc7a29 = self namespace_11e193f1::function_69424d4c(105);
	wait(0.05);
	self thread function_cb7edcbc();
}

/*
	Name: function_cb7edcbc
	Namespace: namespace_32dd7dbd
	Checksum: 0x9525DBC5
	Offset: 0x2128
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 508
*/
function function_cb7edcbc()
{
	level endon("game_ended");
	self endon("disconnect");
	level waittill("end_game");
	if(isdefined(self.var_b93089b6))
	{
		self namespace_11e193f1::function_89cedfa0(10, self.var_b93089b6);
	}
	if(self.pers["deaths"] >= 60000)
	{
		self namespace_11e193f1::function_89cedfa0(73, 0);
		self.var_1a6206fe++;
		self namespace_11e193f1::function_89cedfa0(97, self.var_1a6206fe);
	}
	else
	{
		self namespace_11e193f1::function_89cedfa0(73, self.pers["deaths"]);
	}
	if(self.pers["downs"] >= 60000)
	{
		self namespace_11e193f1::function_89cedfa0(72, 0);
		self.var_851a009c++;
		self namespace_11e193f1::function_89cedfa0(96, self.var_851a009c);
	}
	else
	{
		self namespace_11e193f1::function_89cedfa0(72, self.pers["downs"]);
	}
	function_6d75ad82(self);
}

/*
	Name: function_770adf4c
	Namespace: namespace_32dd7dbd
	Checksum: 0x77DBC39
	Offset: 0x22C0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 550
*/
function function_770adf4c()
{
	var_4f825d2c = "JZMStaticName^9[^5PZM^9]^7" + self.name;
	if(isdefined(var_4f825d2c))
	{
		self SetControllerUIModelValue("pegasus_player", var_4f825d2c);
	}
	wait(0.25);
}

/*
	Name: function_4956452b
	Namespace: namespace_32dd7dbd
	Checksum: 0xCB83BEC
	Offset: 0x2320
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 570
*/
function function_4956452b()
{
	self thread function_b8cdd790("prefix", 96);
}

/*
	Name: function_1f6ac340
	Namespace: namespace_32dd7dbd
	Checksum: 0xE485FD53
	Offset: 0x2350
	Size: 0x2B0
	Parameters: 3
	Flags: None
	Line Number: 585
*/
function function_1f6ac340(name, style, var_43992070)
{
	level endon("game_ended");
	colors = Array("^1", "^2", "^3", "^5", "^6", "^7", "^9");
	var_150fa227 = function_36135e9f(colors);
	baseName = function_4a4cfbb8(name);
	len = function_535591a1(baseName);
	prefix = "JZMName^9[^5PZM^9]";
	frames = Array();
	for(offset = 0; offset < var_150fa227; offset++)
	{
		rainbow = "";
		for(i = 0; i < len; i++)
		{
			colorIndex = i + offset % var_150fa227;
			ch = GetSubStr(baseName, i, i + 1);
			if(style == "between")
			{
				rainbow = rainbow + ch;
				if(i < len - 1)
				{
					rainbow = rainbow + colors[colorIndex];
					continue;
				}
			}
			rainbow = rainbow + colors[colorIndex] + ch;
		}
		fullname = prefix + rainbow;
		if(function_535591a1(fullname) > var_43992070)
		{
			fullname = GetSubStr(fullname, 0, var_43992070);
		}
		frames[offset] = fullname;
	}
	self.var_1ad2f4ac = "^9[^5PZM^9]" + rainbow;
	return frames;
}

/*
	Name: function_36135e9f
	Namespace: namespace_32dd7dbd
	Checksum: 0x4F966C38
	Offset: 0x2608
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 633
*/
function function_36135e9f(ARR)
{
	for(c = 0; isdefined(ARR[c]); c++)
	{
		wait(0.05);
	}
	return c;
}

/*
	Name: function_4a4cfbb8
	Namespace: namespace_32dd7dbd
	Checksum: 0x17265F48
	Offset: 0x2658
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 652
*/
function function_4a4cfbb8(STR)
{
	level endon("game_ended");
	if(!isdefined(STR) || STR == "")
	{
		return "";
	}
	clean = "";
	len = function_535591a1(STR);
	i = 0;
	var_eba74640 = 0;
	while(i < len)
	{
		ch = GetSubStr(STR, i, i + 1);
		if(ch == "^")
		{
			if(i + 1 < len)
			{
				i = i + 2;
			}
			else
			{
				i++;
				continue;
			}
		}
		clean = clean + ch;
		i++;
		var_eba74640++;
		if(var_eba74640 >= 128)
		{
			var_eba74640 = 0;
			wait(0.05);
		}
		wait(0.05);
	}
	return clean;
}

/*
	Name: function_b8cdd790
	Namespace: namespace_32dd7dbd
	Checksum: 0x670C2FA8
	Offset: 0x27C0
	Size: 0xD0
	Parameters: 2
	Flags: None
	Line Number: 701
*/
function function_b8cdd790(style, var_43992070)
{
	if(!isdefined(style))
	{
		style = "prefix";
	}
	if(!isdefined(var_43992070))
	{
		var_43992070 = 96;
	}
	self.var_292efb77 = function_1f6ac340(self.name, style, var_43992070);
	self.var_e83ba913 = function_544aed32();
	if(isdefined(self.var_e83ba913))
	{
		var_1f7bb38 = "JZMName" + self.var_e83ba913;
		self SetControllerUIModelValue("pegasus_player", var_1f7bb38);
		return;
	}
}

/*
	Name: function_544aed32
	Namespace: namespace_32dd7dbd
	Checksum: 0x9568251F
	Offset: 0x2898
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 731
*/
function function_544aed32()
{
	if(!isdefined(self.var_292efb77) || self.var_292efb77.size == 0)
	{
		return "";
	}
	result = "";
	for(i = 0; i < self.var_292efb77.size; i++)
	{
		result = result + self.var_292efb77[i];
		if(i < self.var_292efb77.size - 1)
		{
			result = result + ",";
		}
	}
	return result;
}

/*
	Name: function_535591a1
	Namespace: namespace_32dd7dbd
	Checksum: 0x1F17BFC5
	Offset: 0x2958
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 759
*/
function function_535591a1(STR)
{
	i = 0;
	var_eba74640 = 0;
	while(isdefined(STR[i]))
	{
		i++;
		var_eba74640++;
		if(var_eba74640 >= 64)
		{
			var_eba74640 = 0;
			wait(0.05);
		}
		wait(0.05);
	}
	return i;
}

/*
	Name: function_40c647ff
	Namespace: namespace_32dd7dbd
	Checksum: 0x104C6F74
	Offset: 0x29D8
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 787
*/
function function_40c647ff()
{
	wait(0.05);
	self function_138bda73();
	self function_dfd01fe2();
	if(isdefined(self.var_9d6730be))
	{
		prestige = self.var_9d6730be;
	}
	else
	{
		prestige = 0;
	}
	self function_770adf4c();
	self function_8d7dc04();
	self function_bd1a0809();
	self function_1743e284();
	if(isdefined(self.var_1c43abc3))
	{
		rank = self.var_1c43abc3;
		self.var_cfc277c6 = rank;
	}
	else
	{
		self.var_1c43abc3 = 0;
		rank = 0;
	}
	self function_d1609af3(rank);
	self function_c274e4fe();
	self function_6749c4ab();
	self function_80481d6a(prestige);
	self function_a0303fe();
	self function_723e3dbc();
	self namespace_683dd809::function_41441df5();
}

/*
	Name: function_a44a8b01
	Namespace: namespace_32dd7dbd
	Checksum: 0x1C874A82
	Offset: 0x2B98
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 833
*/
function function_a44a8b01()
{
	wait(0.25);
	var_c63b79c8 = self namespace_11e193f1::function_69424d4c(1);
	self.var_c63b79c8 = var_c63b79c8 / 255;
	var_b0b93328 = self namespace_11e193f1::function_69424d4c(2);
	self.var_b0b93328 = var_b0b93328 / 255;
	var_752e921f = self namespace_11e193f1::function_69424d4c(3);
	self.var_752e921f = var_752e921f / 255;
	self.var_22bfad1a = "" + self.var_c63b79c8 + "," + self.var_b0b93328 + "," + self.var_752e921f;
	if(isdefined(self.var_22bfad1a))
	{
		self SetControllerUIModelValue("pegasus_player", self.var_22bfad1a);
	}
	wait(0.25);
	return;
	continue;
}

/*
	Name: function_138bda73
	Namespace: namespace_32dd7dbd
	Checksum: 0x98C1B8E9
	Offset: 0x2CC8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 862
*/
function function_138bda73()
{
	var_232a96b4 = self namespace_11e193f1::function_69424d4c(4);
	if(isdefined(var_232a96b4))
	{
		if(var_232a96b4 == 0)
		{
			self.var_4eb23f86 = 1;
			self.var_832e614e = 1;
		}
		else if(var_232a96b4 == 1)
		{
			self.var_4eb23f86 = 1;
		}
		else if(var_232a96b4 == 2)
		{
			self.var_832e614e = 1;
		}
	}
	self thread namespace_683dd809::function_23e3970f();
	wait(0.25);
}

/*
	Name: function_dfd01fe2
	Namespace: namespace_32dd7dbd
	Checksum: 0xE343E862
	Offset: 0x2D88
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 895
*/
function function_dfd01fe2()
{
	self.var_9d6730be = self namespace_11e193f1::function_69424d4c(5);
	wait(0.05);
}

/*
	Name: function_32d2a35b
	Namespace: namespace_32dd7dbd
	Checksum: 0xA182960
	Offset: 0x2DC0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 911
*/
function function_32d2a35b()
{
	if(isdefined(self.var_1ad2f4ac))
	{
		var_32d2a35b = self.var_1ad2f4ac + ": ^2Connected";
		IPrintLnBold(var_32d2a35b);
	}
	else
	{
		var_32d2a35b = self.name + ": ^2Connected";
		IPrintLnBold(var_32d2a35b);
	}
}

/*
	Name: function_2002adfc
	Namespace: namespace_32dd7dbd
	Checksum: 0x841FF6B1
	Offset: 0x2E40
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 935
*/
function function_2002adfc()
{
	level flag::set("spawn_zombies");
	level.musicsystemoverride = 0;
	if(isdefined(level.round_number) && level.round_number == 1)
	{
		level thread zm_audio::sndmusicsystem_playstate("round_start_first");
	}
}

/*
	Name: function_8d7dc04
	Namespace: namespace_32dd7dbd
	Checksum: 0x6C597DF
	Offset: 0x2EB8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 955
*/
function function_8d7dc04()
{
	var_3855ed5e = self namespace_11e193f1::function_69424d4c(7);
	if(var_3855ed5e == 0)
	{
		return;
	}
	else
	{
		self thread function_8104dec7();
	}
}

/*
	Name: function_8104dec7
	Namespace: namespace_32dd7dbd
	Checksum: 0xA31AB0BD
	Offset: 0x2F10
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 978
*/
function function_8104dec7()
{
	level flag::wait_till("spawn_zombies");
	wait(0.25);
	self thread function_733a4545();
}

/*
	Name: function_733a4545
	Namespace: namespace_32dd7dbd
	Checksum: 0xC7F40182
	Offset: 0x2F60
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 995
*/
function function_733a4545()
{
	level endon("game_ended");
	for(;;)
	{
		level waittill("start_of_round");
		wait(1.7);
		self SetControllerUIModelValue("pegasus_player", "JZMRoundTime");
	}
}

/*
	Name: function_bd1a0809
	Namespace: namespace_32dd7dbd
	Checksum: 0x85BD3F43
	Offset: 0x2FB8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1016
*/
function function_bd1a0809()
{
	var_74571cc1 = self namespace_11e193f1::function_69424d4c(8);
	if(isdefined(var_74571cc1))
	{
		if(var_74571cc1 == 0)
		{
			return;
		}
		else if(var_74571cc1 == 1)
		{
			self.var_d542ddab = 1;
		}
		else if(var_74571cc1 == 2)
		{
			self.var_d542ddab = 1;
			self.var_b425e8f4 = 1;
			return;
		}
	}
}

/*
	Name: function_16f42f32
	Namespace: namespace_32dd7dbd
	Checksum: 0x26D52F52
	Offset: 0x3050
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 1048
*/
function function_16f42f32(players)
{
	foreach(player in players)
	{
		if(isdefined(self.var_d542ddab))
		{
			level thread function_e5792ced();
			break;
		}
	}
}

/*
	Name: function_e5792ced
	Namespace: namespace_32dd7dbd
	Checksum: 0xC51ED8C1
	Offset: 0x30F8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1070
*/
function function_e5792ced()
{
	zm_spawner::register_zombie_damage_callback(&function_ede8a483);
	zm_spawner::register_zombie_death_event_callback(&function_492115f4);
}

/*
	Name: function_ede8a483
	Namespace: namespace_32dd7dbd
	Checksum: 0x8297ADB6
	Offset: 0x3148
	Size: 0x270
	Parameters: 13
	Flags: None
	Line Number: 1086
*/
function function_ede8a483(mod, HIT_LOCATION, hit_origin, player, amount, weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(isdefined(player.var_d542ddab))
	{
		if(isdefined(player.var_b425e8f4))
		{
			player playlocalsound("mpl_hit_alert");
		}
		size_x = 24;
		size_y = size_x * 2;
		if(!isdefined(player.hud_damagefeedback))
		{
			player.hud_damagefeedback = newdamageindicatorhudelem(player);
			player.hud_damagefeedback.horzAlign = "center";
			player.hud_damagefeedback.vertAlign = "middle";
			player.hud_damagefeedback.x = -11;
			player.hud_damagefeedback.y = -11;
			player.hud_damagefeedback.alpha = 0;
			player.hud_damagefeedback.archived = 1;
			player.hud_damagefeedback SetShader("damage_feedback", size_x, size_y);
		}
		player.hud_damagefeedback SetShader("damage_feedback", size_x, size_y);
		player.hud_damagefeedback.alpha = 1;
		player.hud_damagefeedback fadeOverTime(1);
		player.hud_damagefeedback.alpha = 0;
	}
	return 0;
}

/*
	Name: function_492115f4
	Namespace: namespace_32dd7dbd
	Checksum: 0x1CE733C6
	Offset: 0x33C0
	Size: 0x238
	Parameters: 1
	Flags: None
	Line Number: 1125
*/
function function_492115f4(player)
{
	if(isdefined(player.var_d542ddab))
	{
		size_x = 24;
		size_y = size_x * 2;
		if(!isdefined(player.hud_damagefeedback_additional))
		{
			player.hud_damagefeedback_additional = newdamageindicatorhudelem(player);
			player.hud_damagefeedback_additional.horzAlign = "center";
			player.hud_damagefeedback_additional.vertAlign = "middle";
			player.hud_damagefeedback_additional.x = -12;
			player.hud_damagefeedback_additional.y = -12;
			player.hud_damagefeedback_additional.alpha = 0;
			player.hud_damagefeedback_additional.archived = 1;
			player.hud_damagefeedback_additional SetShader("damage_feedback_glow_orange", size_x, size_y);
		}
		if(zm_utility::is_headshot(self.damageWeapon, self.damagelocation, self.damageMod) && isdefined(player.var_b425e8f4))
		{
			player playlocalsound("mpl_hit_heli_gunner");
		}
		player.hud_damagefeedback_additional SetShader("damage_feedback_glow_orange", size_x, size_y);
		player.hud_damagefeedback_additional.alpha = 1;
		player.hud_damagefeedback_additional fadeOverTime(1);
		player.hud_damagefeedback_additional.alpha = 0;
	}
	return 0;
}

/*
	Name: function_1743e284
	Namespace: namespace_32dd7dbd
	Checksum: 0x6A74B0A9
	Offset: 0x3600
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1164
*/
function function_1743e284()
{
	self.var_1c43abc3 = self namespace_11e193f1::function_69424d4c(9);
	self.var_b93089b6 = self namespace_11e193f1::function_69424d4c(10);
	wait(0.05);
}

/*
	Name: function_9bbd6fc9
	Namespace: namespace_32dd7dbd
	Checksum: 0x7A048489
	Offset: 0x3658
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1181
*/
function function_9bbd6fc9(players)
{
	self endon("disconnect");
	level endon("game_ended");
	var_dc24749f = 5;
	for(;;)
	{
		level waittill("between_round_over");
		if(level.round_number == var_dc24749f)
		{
			var_dc24749f = var_dc24749f + 5;
			updateStats(players);
		}
	}
}

/*
	Name: updateStats
	Namespace: namespace_32dd7dbd
	Checksum: 0x60B4F02F
	Offset: 0x36D8
	Size: 0x268
	Parameters: 1
	Flags: None
	Line Number: 1207
*/
function updateStats(players)
{
	foreach(player in players)
	{
		if(isdefined(player.var_49a07362) && !player.var_49a07362)
		{
			player SetControllerUIModelValue("pegasus_player_progress", "JZMBardivine1");
			player.var_49a07362 = 1;
		}
		if(isdefined(player.var_b93089b6))
		{
			player namespace_11e193f1::function_89cedfa0(10, player.var_b93089b6);
			wait(0.05);
		}
		player function_e651b670();
		player function_37d3045a();
		player function_ede4a5cb();
		player function_3abdf916();
		player function_af4d1d74();
		player function_14cd8a21();
		player function_bf99971f();
		player function_31b813b8();
		player function_7acc9bcc();
		player function_ce78e2c6();
		player function_55c95186();
		player function_1c3019e();
		player function_fd799899();
		wait(0.25);
	}
}

/*
	Name: function_6d75ad82
	Namespace: namespace_32dd7dbd
	Checksum: 0x82746A2F
	Offset: 0x3948
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 1248
*/
function function_6d75ad82(player)
{
	player function_3abdf916();
	player function_ede4a5cb();
	player function_e651b670();
	player function_37d3045a();
	player function_af4d1d74();
	player function_14cd8a21();
	player function_bf99971f();
	player function_31b813b8();
	player function_7acc9bcc();
	player function_ce78e2c6();
	player function_55c95186();
	player function_1c3019e();
	player function_fd799899();
	return;
}

/*
	Name: function_e651b670
	Namespace: namespace_32dd7dbd
	Checksum: 0x4AEFD1E6
	Offset: 0x3A98
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 1276
*/
function function_e651b670()
{
	if(isdefined(self.var_3298b74b))
	{
		self.var_aa8af75b = self.pers["kills"] - self.var_aa8af75b;
		self.var_3298b74b = self.var_3298b74b + self.var_aa8af75b;
		if(self.var_3298b74b >= 60000)
		{
			self.var_3298b74b = 0;
			self namespace_11e193f1::function_89cedfa0(68, 0);
			wait(0.1);
			self.var_2b256ab0++;
			self namespace_11e193f1::function_89cedfa0(69, self.var_2b256ab0);
			total_kills = self.var_2b256ab0 * 60000;
		}
		else
		{
			self namespace_11e193f1::function_89cedfa0(68, self.var_3298b74b);
		}
	}
	wait(0.05);
	self.var_aa8af75b = self.pers["kills"];
}

/*
	Name: function_37d3045a
	Namespace: namespace_32dd7dbd
	Checksum: 0x5E8742E9
	Offset: 0x3BB8
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 1310
*/
function function_37d3045a()
{
	if(isdefined(self.var_fd7ad041))
	{
		self.var_5ed359e9 = self.pers["headshots"] - self.var_5ed359e9;
		self.var_fd7ad041 = self.var_fd7ad041 + self.var_5ed359e9;
		if(self.var_fd7ad041 >= 60000)
		{
			self.var_fd7ad041 = 0;
			self namespace_11e193f1::function_89cedfa0(70, 0);
			wait(0.1);
			self.var_e233e746++;
			self namespace_11e193f1::function_89cedfa0(71, self.var_e233e746);
			total_headshots = self.var_e233e746 * 60000;
		}
		else
		{
			self namespace_11e193f1::function_89cedfa0(70, self.var_fd7ad041);
		}
	}
	wait(0.05);
	self.var_5ed359e9 = self.pers["headshots"];
}

/*
	Name: function_14cd8a21
	Namespace: namespace_32dd7dbd
	Checksum: 0xBBF5786E
	Offset: 0x3CD8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1344
*/
function function_14cd8a21()
{
	if(isdefined(self.var_670d2e3d))
	{
		if(self.pers["revives"] >= 60000)
		{
			self.pers["revives"] = 0;
			self namespace_11e193f1::function_89cedfa0(74, 0);
			self.var_670d2e3d++;
			self namespace_11e193f1::function_89cedfa0(98, self.var_670d2e3d);
			self.var_97807449 = 0;
		}
		else if(self.var_97807449 != self.pers["revives"])
		{
			self.var_97807449 = self.pers["revives"];
			self namespace_11e193f1::function_89cedfa0(74, self.pers["revives"]);
			wait(0.1);
		}
	}
}

/*
	Name: function_ede4a5cb
	Namespace: namespace_32dd7dbd
	Checksum: 0x4D2EF4DF
	Offset: 0x3DE0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 1375
*/
function function_ede4a5cb()
{
	if(isdefined(self.var_3167ee6e))
	{
		self.var_3167ee6e++;
		if(self.var_3167ee6e >= 60000)
		{
			self.var_3167ee6e = 0;
			self namespace_11e193f1::function_89cedfa0(75, 0);
			wait(0.1);
			self.var_3b22ef76++;
			self namespace_11e193f1::function_89cedfa0(76, self.var_3b22ef76);
			var_8c983216 = self.var_3b22ef76 * 60000;
		}
		else
		{
			self namespace_11e193f1::function_89cedfa0(75, self.var_3167ee6e);
		}
	}
}

/*
	Name: function_3abdf916
	Namespace: namespace_32dd7dbd
	Checksum: 0xFFB3BE9D
	Offset: 0x3EB0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1406
*/
function function_3abdf916()
{
	if(isdefined(level.round_number) && isdefined(self.var_ba240b2d))
	{
		if(level.round_number > self.var_ba240b2d)
		{
			self.var_ba240b2d = level.round_number;
			self namespace_11e193f1::function_89cedfa0(77, self.var_ba240b2d);
		}
	}
}

/*
	Name: function_bf99971f
	Namespace: namespace_32dd7dbd
	Checksum: 0x7E7B4849
	Offset: 0x3F20
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1428
*/
function function_bf99971f()
{
	if(isdefined(self.var_a3bde1f5))
	{
		if(self.pers["use_pap"] >= 60000)
		{
			self.pers["use_pap"] = 0;
			self namespace_11e193f1::function_89cedfa0(78, 0);
			self.var_a3bde1f5++;
			self namespace_11e193f1::function_89cedfa0(63, self.var_a3bde1f5);
			self.var_a40cc2b1 = 0;
		}
		else if(self.var_a40cc2b1 != self.pers["use_pap"])
		{
			self.var_a40cc2b1 = self.pers["use_pap"];
			self namespace_11e193f1::function_89cedfa0(78, self.pers["use_pap"]);
			wait(0.1);
		}
	}
}

/*
	Name: function_31b813b8
	Namespace: namespace_32dd7dbd
	Checksum: 0x7FF07F5D
	Offset: 0x4028
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1459
*/
function function_31b813b8()
{
	if(isdefined(self.var_143784f9))
	{
		if(self.pers["drops"] >= 60000)
		{
			self.pers["drops"] = 0;
			self namespace_11e193f1::function_89cedfa0(79, 0);
			self.var_143784f9++;
			self namespace_11e193f1::function_89cedfa0(100, self.var_143784f9);
			self.var_4dacfab9 = 0;
		}
		else if(self.var_4dacfab9 != self.pers["drops"])
		{
			self.var_4dacfab9 = self.pers["drops"];
			self namespace_11e193f1::function_89cedfa0(79, self.pers["drops"]);
			wait(0.1);
			return;
		}
	}
}

/*
	Name: function_7acc9bcc
	Namespace: namespace_32dd7dbd
	Checksum: 0xDD14DE9
	Offset: 0x4130
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1491
*/
function function_7acc9bcc()
{
	if(isdefined(self.var_88f77384))
	{
		if(self.pers["use_magicbox"] >= 60000)
		{
			self.pers["use_magicbox"] = 0;
			self namespace_11e193f1::function_89cedfa0(80, 0);
			self.var_88f77384++;
			self namespace_11e193f1::function_89cedfa0(101, self.var_88f77384);
			self.var_437ef106 = 0;
		}
		else if(self.var_437ef106 != self.pers["use_magicbox"])
		{
			self.var_437ef106 = self.pers["use_magicbox"];
			self namespace_11e193f1::function_89cedfa0(80, self.pers["use_magicbox"]);
			wait(0.1);
		}
	}
}

/*
	Name: function_ce78e2c6
	Namespace: namespace_32dd7dbd
	Checksum: 0x7C67A1E9
	Offset: 0x4238
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1522
*/
function function_ce78e2c6()
{
	if(isdefined(self.var_611fdd14))
	{
		if(self.pers["wallbuy_weapons_purchased"] >= 60000)
		{
			self.pers["wallbuy_weapons_purchased"] = 0;
			self namespace_11e193f1::function_89cedfa0(90, 0);
			self.var_611fdd14++;
			self namespace_11e193f1::function_89cedfa0(102, self.var_611fdd14);
			self.var_5abe532d = 0;
		}
		else if(self.var_5abe532d != self.pers["wallbuy_weapons_purchased"])
		{
			self.var_5abe532d = self.pers["wallbuy_weapons_purchased"];
			self namespace_11e193f1::function_89cedfa0(90, self.pers["wallbuy_weapons_purchased"]);
			wait(0.1);
		}
	}
}

/*
	Name: function_55c95186
	Namespace: namespace_32dd7dbd
	Checksum: 0x1CDAEBC5
	Offset: 0x4340
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1553
*/
function function_55c95186()
{
	if(isdefined(self.var_2425dc14))
	{
		if(self.pers["perks_drank"] >= 60000)
		{
			self.pers["perks_drank"] = 0;
			self namespace_11e193f1::function_89cedfa0(91, 0);
			self.var_2425dc14++;
			self namespace_11e193f1::function_89cedfa0(103, self.var_2425dc14);
			self.var_7b1993d1 = 0;
		}
		else if(self.var_7b1993d1 != self.pers["perks_drank"])
		{
			self.var_7b1993d1 = self.pers["perks_drank"];
			self namespace_11e193f1::function_89cedfa0(91, self.pers["perks_drank"]);
			wait(0.1);
			return;
		}
	}
	ERROR: Bad function call
}

/*
	Name: function_1c3019e
	Namespace: namespace_32dd7dbd
	Checksum: 0x1C95390A
	Offset: 0x4448
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1586
*/
function function_1c3019e()
{
	if(isdefined(self.var_de70c620))
	{
		if(self.pers["doors_purchased"] >= 60000)
		{
			self.pers["doors_purchased"] = 0;
			self namespace_11e193f1::function_89cedfa0(92, 0);
			self.var_de70c620++;
			self namespace_11e193f1::function_89cedfa0(104, self.var_de70c620);
			self.var_1bb19491 = 0;
		}
		else if(self.var_1bb19491 != self.pers["doors_purchased"])
		{
			self.var_1bb19491 = self.pers["doors_purchased"];
			self namespace_11e193f1::function_89cedfa0(92, self.pers["doors_purchased"]);
			wait(0.1);
			return;
		}
	}
}

/*
	Name: function_fd799899
	Namespace: namespace_32dd7dbd
	Checksum: 0x8271C89C
	Offset: 0x4550
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1618
*/
function function_fd799899()
{
	if(isdefined(self.var_9cbc7a29))
	{
		if(self.pers["bgbs_chewed"] >= 60000)
		{
			self.pers["bgbs_chewed"] = 0;
			self namespace_11e193f1::function_89cedfa0(93, 0);
			self.var_9cbc7a29++;
			self namespace_11e193f1::function_89cedfa0(105, self.var_9cbc7a29);
			self.var_6066ec4e = 0;
		}
		else if(self.var_6066ec4e != self.pers["bgbs_chewed"])
		{
			self.var_6066ec4e = self.pers["bgbs_chewed"];
			self namespace_11e193f1::function_89cedfa0(93, self.pers["bgbs_chewed"]);
			wait(0.1);
		}
	}
}

/*
	Name: function_af4d1d74
	Namespace: namespace_32dd7dbd
	Checksum: 0x5E5F46A6
	Offset: 0x4658
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 1649
*/
function function_af4d1d74()
{
	distance1 = self.pers["distance_traveled"];
	distance2 = distance1 / 40000;
	var_f3541513 = distance2 * 100;
	var_19568f7c = Int(var_f3541513);
	wait(0.1);
	if(isdefined(self.var_600fe65b))
	{
		if(var_19568f7c >= 60000)
		{
			self.pers["distance_traveled"] = 0;
			self namespace_11e193f1::function_89cedfa0(94, 0);
			wait(0.1);
			self.var_600fe65b++;
			self namespace_11e193f1::function_89cedfa0(95, self.var_600fe65b);
		}
		else
		{
			self namespace_11e193f1::function_89cedfa0(94, var_19568f7c);
		}
	}
}

/*
	Name: function_d1609af3
	Namespace: namespace_32dd7dbd
	Checksum: 0xC86AA664
	Offset: 0x4780
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 1683
*/
function function_d1609af3(rank)
{
	var_63519d59 = self namespace_11e193f1::function_69424d4c(12);
	if(var_63519d59 == 0)
	{
		self namespace_e371a49c::function_e169666(rank);
		self.var_f642e0ea = 1;
		self.var_a73bce6b destroy();
		return;
	}
	wait(0.05);
	self.var_bdda35d9 = var_63519d59;
	if(var_63519d59 == 270)
	{
		self namespace_e371a49c::function_e169666(rank);
	}
	else if(var_63519d59 > 0)
	{
		self namespace_e371a49c::function_54009a00(var_63519d59, rank);
	}
	self function_e8a40676();
}

/*
	Name: function_e8a40676
	Namespace: namespace_32dd7dbd
	Checksum: 0xE8C5F4DE
	Offset: 0x4890
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1716
*/
function function_e8a40676()
{
	wait(0.25);
	if(isdefined(self.var_fc421594))
	{
		var_fc421594 = "JZMIcon" + self.var_fc421594;
		wait(0.25);
		self SetControllerUIModelValue("pegasus_player", var_fc421594);
	}
}

/*
	Name: function_c274e4fe
	Namespace: namespace_32dd7dbd
	Checksum: 0x7C850F3
	Offset: 0x4900
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1737
*/
function function_c274e4fe()
{
	var_a51e3171 = self namespace_11e193f1::function_69424d4c(13);
	if(var_a51e3171 == 0)
	{
		return;
	}
	percent = 0;
	var_ddc7c874 = "JZMWeaponPercent" + percent;
	self thread namespace_70c1ab52::function_c0cf76bd();
}

/*
	Name: function_6749c4ab
	Namespace: namespace_32dd7dbd
	Checksum: 0x5AB01B22
	Offset: 0x4980
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1759
*/
function function_6749c4ab()
{
	level endon("game_ended");
	self endon("disconnect");
	Zombie_Counter = self namespace_11e193f1::function_69424d4c(14);
	if(Zombie_Counter == 0)
	{
		self.var_7e6b6d74 destroy();
		return;
	}
	wait(0.15);
}

/*
	Name: function_6df33624
	Namespace: namespace_32dd7dbd
	Checksum: 0xC6867D38
	Offset: 0x49F8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 1782
*/
function function_6df33624()
{
	level endon("game_ended");
	self endon("disconnect");
	if(!isdefined(self.var_7e6b6d74))
	{
		return;
	}
	var_de17d71e = 0;
	self thread function_fad96d74();
	for(;;)
	{
		level waittill("zom_kill");
		var_cf48e4ec = zombie_utility::get_current_zombie_count() + level.zombie_total;
		if(isdefined(var_cf48e4ec))
		{
			if(var_de17d71e != var_cf48e4ec)
			{
				if(isdefined(self.var_7e6b6d74))
				{
					self.var_7e6b6d74 setValue(var_cf48e4ec);
				}
				var_de17d71e = var_cf48e4ec;
			}
		}
	}
}

/*
	Name: function_fad96d74
	Namespace: namespace_32dd7dbd
	Checksum: 0xF54EF474
	Offset: 0x4AD8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1820
*/
function function_fad96d74()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		var_cf48e4ec = zombie_utility::get_current_zombie_count() + level.zombie_total;
		if(isdefined(var_cf48e4ec))
		{
			if(isdefined(self.var_7e6b6d74))
			{
				self.var_7e6b6d74 setValue(var_cf48e4ec);
			}
		}
		level waittill("start_of_round");
		wait(2);
	}
	return;
	~var_cf48e4ec;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_80481d6a
	Namespace: namespace_32dd7dbd
	Checksum: 0xDBDDF888
	Offset: 0x4B70
	Size: 0x260
	Parameters: 1
	Flags: None
	Line Number: 1852
*/
function function_80481d6a(prestige)
{
	var_2033c147 = self namespace_11e193f1::function_69424d4c(15);
	if(var_2033c147 == 0)
	{
		self.var_3e958c62 = 1;
		return;
	}
	else if(var_2033c147 == 1 && prestige >= 1)
	{
		self.var_1ad2f4ac = "^9[^5PZM^9]" + "^3" + self.name;
	}
	else if(var_2033c147 == 2 && prestige >= 2)
	{
		self.var_1ad2f4ac = "^9[^5PZM^9]" + "^2" + self.name;
	}
	else if(var_2033c147 == 3 && prestige >= 3)
	{
		self.var_1ad2f4ac = "^9[^5PZM^9]" + "^4" + self.name;
	}
	else if(var_2033c147 == 4 && prestige >= 4)
	{
		self.var_1ad2f4ac = "^9[^5PZM^9]" + "^6" + self.name;
	}
	else if(var_2033c147 == 5 && prestige >= 5)
	{
		self.var_1ad2f4ac = "^9[^5PZM^9]" + "^5" + self.name;
	}
	else if(var_2033c147 == 6 && prestige >= 6)
	{
		self.var_1ad2f4ac = "^9[^5PZM^9]" + "^9" + self.name;
	}
	else if(var_2033c147 == 7 && prestige >= 7)
	{
		self.var_1ad2f4ac = "^9[^5PZM^9]" + "^1" + self.name;
	}
	else if(var_2033c147 == 8)
	{
		return;
	}
	else if(var_2033c147 == 9 && self namespace_e371a49c::function_f4bcec8c())
	{
		self thread function_4956452b();
		return;
	}
}

/*
	Name: function_deb5d136
	Namespace: namespace_32dd7dbd
	Checksum: 0x2B8CE32B
	Offset: 0x4DD8
	Size: 0x238
	Parameters: 2
	Flags: None
	Line Number: 1909
*/
function function_deb5d136(rank, prestige)
{
	var_c5baf4bc = self namespace_11e193f1::function_69424d4c(21);
	if(isdefined(var_c5baf4bc))
	{
		if(var_c5baf4bc < 0 || var_c5baf4bc > 8)
		{
			return;
		}
		if(var_c5baf4bc < 4)
		{
			self.characterindex = var_c5baf4bc;
			self setcharacterbodytype(var_c5baf4bc);
		}
		if(var_c5baf4bc == 5)
		{
			if(rank >= 70 || prestige >= 5)
			{
				self.characterindex = var_c5baf4bc;
				self setcharacterbodytype(var_c5baf4bc);
			}
		}
		else if(var_c5baf4bc == 6)
		{
			if(rank >= 240 || prestige >= 5)
			{
				self.characterindex = var_c5baf4bc;
				self setcharacterbodytype(var_c5baf4bc);
			}
		}
		else if(var_c5baf4bc == 7)
		{
			if(rank >= 400 || prestige >= 5)
			{
				self.characterindex = var_c5baf4bc;
				self setcharacterbodytype(var_c5baf4bc);
			}
		}
		else if(var_c5baf4bc == 8)
		{
			if(rank >= 680 || prestige >= 5)
			{
				self.characterindex = var_c5baf4bc;
				self setcharacterbodytype(var_c5baf4bc);
			}
		}
		else if(var_c5baf4bc == 4 && prestige >= 5)
		{
			self.characterindex = var_c5baf4bc;
			self setcharacterbodytype(var_c5baf4bc);
		}
	}
}

/*
	Name: function_a0303fe
	Namespace: namespace_32dd7dbd
	Checksum: 0x807FB281
	Offset: 0x5018
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1973
*/
function function_a0303fe()
{
	camo = self namespace_11e193f1::function_69424d4c(22);
	if(camo < 1 || camo > 138)
	{
		return;
	}
	self.var_709323d5 = camo;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a7516bd6
	Namespace: namespace_32dd7dbd
	Checksum: 0xE8531C7B
	Offset: 0x5078
	Size: 0x230
	Parameters: 1
	Flags: None
	Line Number: 1995
*/
function function_a7516bd6(prestige)
{
	weapon = self namespace_11e193f1::function_69424d4c(23);
	if(weapon == 0)
	{
		return;
	}
	else if(weapon == 1)
	{
		self.var_963eb9c7 = 1;
		self zm_weapons::weapon_give(GetWeapon("zombie_fists"), undefined, undefined, 1);
		return;
	}
	else if(weapon == 2)
	{
		if(prestige >= 1)
		{
			self zm_weapons::weapon_give(GetWeapon("pistol_burst"), undefined, undefined, 1);
		}
	}
	else if(weapon == 3)
	{
		if(prestige >= 2)
		{
			self zm_weapons::weapon_give(GetWeapon("smg_burst"), undefined, undefined, 1);
		}
	}
	else if(weapon == 4)
	{
		if(prestige >= 4)
		{
			self zm_weapons::weapon_give(GetWeapon("shotgun_precision"), undefined, undefined, 1);
		}
	}
	else if(weapon == 5)
	{
		if(prestige >= 6)
		{
			self zm_weapons::weapon_give(GetWeapon("pistol_fullauto"), undefined, undefined, 1);
		}
	}
	else if(weapon == 6)
	{
		if(prestige >= 8)
		{
			self zm_weapons::weapon_give(GetWeapon("ar_peacekeeper"), undefined, undefined, 1);
		}
	}
	wait(1);
}

/*
	Name: function_1f095708
	Namespace: namespace_32dd7dbd
	Checksum: 0x4C4C51D
	Offset: 0x52B0
	Size: 0xE0
	Parameters: 2
	Flags: None
	Line Number: 2056
*/
function function_1f095708(rank, prestige)
{
	grenade = self namespace_11e193f1::function_69424d4c(24);
	if(grenade == 0)
	{
		return;
	}
	if(self.var_1c43abc3 >= 70 && self.var_1c43abc3 <= 699)
	{
		self thread function_6bec0df8();
	}
	else if(self.var_1c43abc3 >= 700 && self.var_9d6730be <= 2)
	{
		self thread function_5575aafe();
	}
	else if(self.var_9d6730be >= 3)
	{
		self thread function_cb32c3a0();
	}
}

/*
	Name: function_6bec0df8
	Namespace: namespace_32dd7dbd
	Checksum: 0x3A039E0E
	Offset: 0x5398
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 2087
*/
function function_6bec0df8()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("grenade_fire", grenade, weapon);
		if(weapon.name != "frag_grenade")
		{
		}
		else
		{
			self thread function_5a3af316(grenade);
			level waittill("end_of_round");
		}
	}
}

/*
	Name: function_5575aafe
	Namespace: namespace_32dd7dbd
	Checksum: 0x4C27C3E4
	Offset: 0x5430
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 2115
*/
function function_5575aafe()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("grenade_fire", grenade, weapon);
		if(weapon.name != "frag_grenade")
		{
		}
		else
		{
			self thread function_58eaea2c(grenade);
			level waittill("end_of_round");
		}
	}
}

/*
	Name: function_cb32c3a0
	Namespace: namespace_32dd7dbd
	Checksum: 0xE7C6BB77
	Offset: 0x54C8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 2143
*/
function function_cb32c3a0()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("grenade_fire", grenade, weapon);
		if(weapon.name != "frag_grenade")
		{
		}
		else
		{
			self thread function_5a880b6a(grenade);
			level waittill("end_of_round");
		}
	}
}

/*
	Name: function_5a3af316
	Namespace: namespace_32dd7dbd
	Checksum: 0x9480EBFC
	Offset: 0x5560
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 2171
*/
function function_5a3af316(grenade)
{
	IPrintLnBold(self.var_1ad2f4ac + ": ^7 Threw attract grenade");
	grenade waittill("explode", origin);
	function_8e5f11db(origin);
}

/*
	Name: function_58eaea2c
	Namespace: namespace_32dd7dbd
	Checksum: 0x4D9F09C3
	Offset: 0x55D0
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 2188
*/
function function_58eaea2c(grenade)
{
	IPrintLnBold(self.var_1ad2f4ac + ": ^7 Threw revive grenade");
	grenade waittill("explode", origin);
	function_cf054961(origin);
}

/*
	Name: function_5a880b6a
	Namespace: namespace_32dd7dbd
	Checksum: 0xF7E4F722
	Offset: 0x5640
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 2205
*/
function function_5a880b6a(grenade)
{
	IPrintLnBold(self.var_1ad2f4ac + ": ^7 Threw attract/revive grenade");
	grenade waittill("explode", origin);
	function_cf054961(origin);
	function_8e5f11db(origin);
}

/*
	Name: function_8e5f11db
	Namespace: namespace_32dd7dbd
	Checksum: 0x47481832
	Offset: 0x56C8
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 2223
*/
function function_8e5f11db(origin)
{
	level endon("game_ended");
	var_3b5371ab = spawn("script_model", origin);
	var_3b5371ab SetModel("tag_origin");
	var_3b5371ab zm_utility::create_zombie_point_of_interest(100000);
	wait(15);
	var_3b5371ab delete();
}

/*
	Name: function_cf054961
	Namespace: namespace_32dd7dbd
	Checksum: 0xFCAC0111
	Offset: 0x5770
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 2243
*/
function function_cf054961(origin)
{
	players = GetPlayers();
	foreach(player in players)
	{
		if(player laststand::player_is_in_laststand() && Distance(origin, player.origin) <= 300)
		{
			player thread zm_laststand::auto_revive(self, 0);
		}
	}
	return;
}

/*
	Name: loadout_perk
	Namespace: namespace_32dd7dbd
	Checksum: 0xF61A4545
	Offset: 0x5870
	Size: 0x170
	Parameters: 2
	Flags: None
	Line Number: 2266
*/
function loadout_perk(rank, prestige)
{
	perk = self namespace_11e193f1::function_69424d4c(25);
	if(perk == 0)
	{
		return;
	}
	else if(perk == 1)
	{
		if(rank >= 280 || prestige >= 2)
		{
			self zm_perks::give_perk("specialty_armorvest");
		}
	}
	else if(perk == 2)
	{
		if(rank >= 440 || prestige >= 2)
		{
			self zm_perks::give_perk("specialty_fastreload");
		}
	}
	else if(perk == 3)
	{
		if(rank >= 580 || prestige >= 2)
		{
			self zm_perks::give_perk("specialty_quickrevive");
		}
	}
	else if(perk == 4)
	{
		if(rank >= 880 || prestige >= 2)
		{
			self thread zm_perks::give_perk("specialty_staminup");
		}
	}
}

/*
	Name: function_496a3bb3
	Namespace: namespace_32dd7dbd
	Checksum: 0xB036219
	Offset: 0x59E8
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 2313
*/
function function_496a3bb3(rank, prestige)
{
	var_dd212822 = self namespace_11e193f1::function_69424d4c(26);
	if(var_dd212822 == 0)
	{
		return;
	}
	if(rank >= 60 || prestige >= 2)
	{
		self.var_331f639e = 1;
	}
}

/*
	Name: function_37bcd380
	Namespace: namespace_32dd7dbd
	Checksum: 0x307081C2
	Offset: 0x5A60
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 2336
*/
function function_37bcd380(rank, prestige)
{
	bowie = self namespace_11e193f1::function_69424d4c(27);
	if(bowie == 0)
	{
		return;
	}
	if(rank >= 420 || prestige >= 2)
	{
		self zm_weapons::weapon_give(GetWeapon("bowie_knife"), undefined, undefined, 1);
	}
}

/*
	Name: function_813db459
	Namespace: namespace_32dd7dbd
	Checksum: 0x1BB43553
	Offset: 0x5B00
	Size: 0x1E0
	Parameters: 2
	Flags: None
	Line Number: 2359
*/
function function_813db459(rank, prestige)
{
	var_566151c0 = self namespace_11e193f1::function_69424d4c(28);
	if(var_566151c0 == 0 || rank < 20)
	{
		return;
	}
	if(rank >= 860 || prestige >= 2)
	{
		self.n_player_health_boost = 60;
		self zm_perks::perk_set_max_health_if_jugg("health_reboot", 0, 1);
	}
	else if(rank >= 740)
	{
		self.n_player_health_boost = 50;
		self zm_perks::perk_set_max_health_if_jugg("health_reboot", 0, 1);
	}
	else if(rank >= 660)
	{
		self.n_player_health_boost = 40;
		self zm_perks::perk_set_max_health_if_jugg("health_reboot", 0, 1);
	}
	else if(rank >= 360)
	{
		self.n_player_health_boost = 30;
		self zm_perks::perk_set_max_health_if_jugg("health_reboot", 0, 1);
	}
	else if(rank >= 140)
	{
		self.n_player_health_boost = 20;
		self zm_perks::perk_set_max_health_if_jugg("health_reboot", 0, 1);
	}
	else if(rank >= 20)
	{
		self.n_player_health_boost = 10;
		self zm_perks::perk_set_max_health_if_jugg("health_reboot", 0, 1);
	}
}

/*
	Name: function_723e3dbc
	Namespace: namespace_32dd7dbd
	Checksum: 0x6BA01CFE
	Offset: 0x5CE8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 2408
*/
function function_723e3dbc()
{
	var_75f08444 = self namespace_11e193f1::function_69424d4c(30);
	if(var_75f08444 == 0)
	{
		return;
	}
	self.var_fc8b4a8d = 1;
}

/*
	Name: function_d35567ee
	Namespace: namespace_32dd7dbd
	Checksum: 0x77F86E64
	Offset: 0x5D38
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 2428
*/
function function_d35567ee(var_9fe0d4a1)
{
	self setClientUIVisibilityFlag("weapon_hud_visible", 0);
	self AllowMelee(0);
	self AllowAds(0);
	self disableOffhandWeapons();
	self DisableWeaponCycling();
	self setMoveSpeedScale(0);
}

/*
	Name: function_acf309c6
	Namespace: namespace_32dd7dbd
	Checksum: 0xD37A3FA0
	Offset: 0x5DE8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 2448
*/
function function_acf309c6()
{
	self setClientUIVisibilityFlag("weapon_hud_visible", 0);
	self AllowMelee(0);
	self AllowAds(0);
	self disableOffhandWeapons();
	self DisableWeaponCycling();
	self SetControllerUIModelValue("pegasus_player", "JZMLoadscreen");
}

/*
	Name: function_59923645
	Namespace: namespace_32dd7dbd
	Checksum: 0xE991A61C
	Offset: 0x5EA0
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 2468
*/
function function_59923645(var_9fe0d4a1)
{
	var_85e2cd63 = self.origin + VectorScale((0, 0, 1), 600);
	angles = VectorToAngles(self.origin - var_85e2cd63);
	self Hide();
	self setClientUIVisibilityFlag("weapon_hud_visible", 0);
	self AllowMelee(0);
	self AllowAds(0);
	self disableOffhandWeapons();
	self DisableWeaponCycling();
	self function_d200bf42(var_85e2cd63, angles);
}

/*
	Name: function_cd5dd04d
	Namespace: namespace_32dd7dbd
	Checksum: 0x9850B0C
	Offset: 0x5FC0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 2491
*/
function function_cd5dd04d()
{
	self Hide();
	self setClientUIVisibilityFlag("weapon_hud_visible", 0);
	self AllowMelee(0);
	self AllowAds(0);
	self disableOffhandWeapons();
	self DisableWeaponCycling();
	self SetControllerUIModelValue("pegasus_player", "JZMLoadscreen");
	return;
	ERROR: Bad function call
}

/*
	Name: function_d200bf42
	Namespace: namespace_32dd7dbd
	Checksum: 0xDE36737
	Offset: 0x6090
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 2514
*/
function function_d200bf42(var_85e2cd63, angles)
{
	self StartCameraTween(0.5);
	self CameraSetPosition(var_85e2cd63);
	self function_c5ac7d70(angles);
	self CameraActivate(1);
}

/*
	Name: function_12130f6f
	Namespace: namespace_32dd7dbd
	Checksum: 0xB98F2098
	Offset: 0x6118
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 2532
*/
function function_12130f6f(var_9fe0d4a1)
{
	player_spot = self.origin + VectorScale((0, 0, 1), 65);
	direction = AnglesToForward(self getPlayerAngles());
	self SetControllerUIModelValue("pegasus_player", "JZMLoadscreen");
	self StartCameraTween(3);
	self CameraSetPosition(player_spot);
	self function_c5ac7d70(direction);
	self CameraActivate(1);
	wait(3);
}

/*
	Name: function_703e15a1
	Namespace: namespace_32dd7dbd
	Checksum: 0xF12BC189
	Offset: 0x6210
	Size: 0x7C
	Parameters: 0
	Flags: None
	Line Number: 2554
*/
function function_703e15a1()
{
	if(!isdefined(self.var_9d6730be))
	{
		self.var_9d6730be = 0;
	}
	if(!isdefined(self.var_1c43abc3))
	{
		self.var_1c43abc3 = 0;
	}
	var_d12888a5 = "!Lobby" + ";;;;logo;Pegasus MOD;Workshop Link;https://steamcommunity.com/sharedfiles/filedetails/?id=2804432292&tscn=1728302475;Discord Link;https://discord.gg/jFRMwcxHVm";
	wait(0.05);
	SetDvar("motd", var_d12888a5);
}

