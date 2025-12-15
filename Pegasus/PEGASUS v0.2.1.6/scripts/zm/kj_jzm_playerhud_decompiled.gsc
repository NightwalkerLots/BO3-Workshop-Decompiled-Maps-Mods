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
#include scripts\zm\kj_jzm_backpack;
#include scripts\zm\kj_jzm_boxshare;
#include scripts\zm\kj_jzm_callouts;
#include scripts\zm\kj_jzm_gamemodes;
#include scripts\zm\kj_jzm_laserfix;
#include scripts\zm\kj_jzm_playerhealth;
#include scripts\zm\kj_jzm_rankicon;
#include scripts\zm\kj_jzm_rewards;
#include scripts\zm\kj_jzm_tokens;
#include scripts\zm\kj_jzm_waypoints;
#include scripts\zm\kj_jzm_weaponboost;
#include scripts\zm\kj_jzm_xp;
#include scripts\zm\zmsavedata;

#namespace namespace_32dd7dbd;

/*
	Name: __init__sytem__
	Namespace: namespace_32dd7dbd
	Checksum: 0x190799C
	Offset: 0xB88
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 55
*/
function autoexec __init__sytem__()
{
	system::register("kj_jzm_playerhud", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_32dd7dbd
	Checksum: 0xB2ABC0ED
	Offset: 0xBD0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function __init__()
{
	clientfield::register("toplayer", "red_laser_fx_view", 1, 1, "int");
	clientfield::register("allplayers", "red_laser_fx_world", 1, 1, "int");
	callback::on_connect(&on_player_connect);
}

/*
	Name: __main__
	Namespace: namespace_32dd7dbd
	Checksum: 0x6431CF7F
	Offset: 0xC60
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 87
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
	zm::register_player_damage_callback(&player_damage_override_callback);
	level thread function_dfd1662d();
}

/*
	Name: function_dfd1662d
	Namespace: namespace_32dd7dbd
	Checksum: 0xBD37BF64
	Offset: 0xD60
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 112
*/
function function_dfd1662d()
{
	level endon("game_ended");
	level waittill("start_of_round");
	level waittill("start_of_round");
	level waittill("start_of_round");
	MapName = GetDvarString("mapname");
	if(IsInArray(Array("zm_superman_kj", "zm_hellevator_kj", "zm_transmitter_remake", "zm_forest", "zm_small_trench", "zm_jap_outpost_remake", "zm_consulate"), MapName))
	{
		foreach(player in GetPlayers())
		{
			player thread function_d8bfb232();
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d8bfb232
	Namespace: namespace_32dd7dbd
	Checksum: 0xE52A700
	Offset: 0xEB8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 140
*/
function function_d8bfb232()
{
	self endon("disconnect");
	level endon("game_ended");
	self waittill("hash_9be44d0e");
	self.var_70a24c4d = 1;
	self namespace_683dd809::function_c929e2bc(self.var_70a24c4d);
	self.var_70a24c4d = 0;
}

/*
	Name: function_b74c151a
	Namespace: namespace_32dd7dbd
	Checksum: 0x9C5AC98
	Offset: 0xF20
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 160
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
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: on_player_connect
	Namespace: namespace_32dd7dbd
	Checksum: 0xB36A828E
	Offset: 0x1058
	Size: 0x4D0
	Parameters: 0
	Flags: None
	Line Number: 190
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
	self namespace_e371a49c::function_6b3735d9();
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
		self thread function_ca94d1d5(MapName);
	}
	else
	{
		level flag::wait_till("start_zombie_round_logic");
		self thread function_1122d681(MapName);
	}
}

/*
	Name: function_373d79d0
	Namespace: namespace_32dd7dbd
	Checksum: 0xFDE41539
	Offset: 0x1530
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 278
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
	Checksum: 0x7B66F313
	Offset: 0x1628
	Size: 0x150
	Parameters: 1
	Flags: None
	Line Number: 301
*/
function function_ca94d1d5(MapName)
{
	self SetControllerUIModelValue("pegasus_player", "JZMLoadscreen");
	self function_40c647ff();
	self namespace_2cb7caef::function_220163bc();
	self function_3041599a();
	self.var_3d231107 = gameobjects::get_next_obj_id();
	self.var_c77b20b7 = gameobjects::get_next_obj_id();
	self function_32d2a35b();
	self namespace_42c9cc4b::function_451c103c();
	self namespace_c1c38b58::function_9d7231f9();
	self thread function_6df33624();
	wait(0.25);
	self namespace_2cb7caef::function_e4d31720();
	self thread function_117d7e49();
	wait(0.25);
}

/*
	Name: function_117d7e49
	Namespace: namespace_32dd7dbd
	Checksum: 0x5AA917CE
	Offset: 0x1780
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 329
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
	Checksum: 0x580E62E0
	Offset: 0x17C0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 348
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
	Checksum: 0xC1E8FCC5
	Offset: 0x1890
	Size: 0x5A0
	Parameters: 1
	Flags: None
	Line Number: 371
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
		self namespace_afd88775::function_710ca4a5();
		self namespace_afd88775::function_66f1be4a();
		namespace_80a8617d::function_8e722e7a();
		foreach(player in players)
		{
			player function_40c647ff();
			wait(0.05);
		}
		self namespace_afd88775::function_b68b5eb5(players);
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
			player namespace_2cb7caef::function_220163bc();
			player function_3041599a();
			player.var_3d231107 = gameobjects::get_next_obj_id();
			player.var_c77b20b7 = gameobjects::get_next_obj_id();
			wait(0.05);
		}
		namespace_2cb7caef::function_8949c14e();
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
	self namespace_42c9cc4b::function_451c103c();
	self namespace_c1c38b58::function_9d7231f9();
	self thread function_6df33624();
	wait(1);
	self namespace_2cb7caef::function_e4d31720();
	self thread function_117d7e49();
	self function_978fded5();
	self namespace_f8c4cfb7::function_4dc5673d();
}

/*
	Name: function_978fded5
	Namespace: namespace_32dd7dbd
	Checksum: 0x7F6FFBF6
	Offset: 0x1E38
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 468
*/
function function_978fded5()
{
	var_12da3649 = self namespace_11e193f1::function_69424d4c(6);
	version_number = 216;
	if(var_12da3649 != version_number)
	{
		self SetControllerUIModelValue("pegasus_player", "JZMDailyReward");
		self playlocalsound("zmb_bgb_token");
		self namespace_11e193f1::function_89cedfa0(6, version_number);
		self.var_b93089b6 = self.var_b93089b6 + 1000;
		wait(0.25);
		self LUINotifyEvent(&"score_event", 2, &"", 1000);
	}
}

/*
	Name: function_1d048435
	Namespace: namespace_32dd7dbd
	Checksum: 0x39AEF797
	Offset: 0x1F38
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 493
*/
function function_1d048435()
{
	level endon("game_ended");
	self endon("disconnect");
	self waittill("hash_1d048435");
	if(isdefined(self.var_1c43abc3))
	{
		self.var_70a24c4d = 1;
		self namespace_683dd809::function_c929e2bc(self.var_70a24c4d);
		self.var_70a24c4d = 0;
	}
}

/*
	Name: function_3041599a
	Namespace: namespace_32dd7dbd
	Checksum: 0xA5707A4A
	Offset: 0x1FA8
	Size: 0x7A0
	Parameters: 0
	Flags: None
	Line Number: 516
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
	Checksum: 0xD509BBCA
	Offset: 0x2750
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 622
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
	return;
	++;
}

/*
	Name: function_770adf4c
	Namespace: namespace_32dd7dbd
	Checksum: 0x881D62EC
	Offset: 0x28E8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 666
*/
function function_770adf4c()
{
	var_4f825d2c = "JZMStaticName^9[^5PZM^9]^7" + self.name;
	if(isdefined(var_4f825d2c))
	{
		self SetControllerUIModelValue("pegasus_player", var_4f825d2c);
	}
	wait(0.25);
	return;
}

/*
	Name: function_4956452b
	Namespace: namespace_32dd7dbd
	Checksum: 0x8D29A6BE
	Offset: 0x2948
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 687
*/
function function_4956452b()
{
	self thread function_b8cdd790("prefix", 96);
}

/*
	Name: function_1f6ac340
	Namespace: namespace_32dd7dbd
	Checksum: 0xFB92E015
	Offset: 0x2978
	Size: 0x2B0
	Parameters: 3
	Flags: None
	Line Number: 702
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
	Checksum: 0xB388AF48
	Offset: 0x2C30
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 750
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
	Checksum: 0x57DDB4F
	Offset: 0x2C80
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 769
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
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b8cdd790
	Namespace: namespace_32dd7dbd
	Checksum: 0x4E25AAD8
	Offset: 0x2DE8
	Size: 0xD0
	Parameters: 2
	Flags: None
	Line Number: 819
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
	}
}

/*
	Name: function_544aed32
	Namespace: namespace_32dd7dbd
	Checksum: 0x93949F20
	Offset: 0x2EC0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 848
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
	Checksum: 0x40FADC00
	Offset: 0x2F80
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 876
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
	Checksum: 0x18BE8B8A
	Offset: 0x3000
	Size: 0x2D0
	Parameters: 0
	Flags: None
	Line Number: 904
*/
function function_40c647ff()
{
	wait(0.05);
	self function_a44a8b01();
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
	}
	self namespace_f8c4cfb7::function_c31d5b84(rank, prestige);
	self function_d1609af3(rank);
	self function_c274e4fe();
	self function_6749c4ab();
	self function_80481d6a(prestige);
	self namespace_6d708c3b::function_2932b50();
	self function_deb5d136(rank, prestige);
	self function_a0303fe();
	self function_a7516bd6(prestige);
	self function_1f095708(rank, prestige);
	self loadout_perk(rank, prestige);
	self function_496a3bb3(rank, prestige);
	self function_37bcd380(rank, prestige);
	self function_813db459(rank, prestige);
	self function_723e3dbc();
	self namespace_683dd809::function_41441df5();
}

/*
	Name: function_a44a8b01
	Namespace: namespace_32dd7dbd
	Checksum: 0xF7E6C449
	Offset: 0x32D8
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 959
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
	wait(0.25);
	if(var_c63b79c8 <= 60 && var_b0b93328 <= 60 && var_752e921f <= 60)
	{
		self.var_22bfad1a = "0.45,0,0.9";
	}
}

/*
	Name: function_138bda73
	Namespace: namespace_32dd7dbd
	Checksum: 0xC324982
	Offset: 0x3410
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 986
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
	Checksum: 0xB1613FED
	Offset: 0x34D0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 1019
*/
function function_dfd01fe2()
{
	self.var_9d6730be = self namespace_11e193f1::function_69424d4c(5);
	wait(0.05);
	return;
}

/*
	Name: function_32d2a35b
	Namespace: namespace_32dd7dbd
	Checksum: 0xC8DD35A9
	Offset: 0x3508
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1036
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
	Checksum: 0xD9DF53FD
	Offset: 0x3588
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1060
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
	Checksum: 0x4829F264
	Offset: 0x3600
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1080
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
	Checksum: 0x147717D6
	Offset: 0x3658
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1103
*/
function function_8104dec7()
{
	level flag::wait_till("spawn_zombies");
	wait(0.25);
	self thread function_733a4545();
	return;
	ERROR: Bad function call
}

/*
	Name: function_733a4545
	Namespace: namespace_32dd7dbd
	Checksum: 0xE299CA7B
	Offset: 0x36A8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1122
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
	Checksum: 0x513D257D
	Offset: 0x3700
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1143
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
		}
	}
}

/*
	Name: function_16f42f32
	Namespace: namespace_32dd7dbd
	Checksum: 0xD89EF80A
	Offset: 0x3798
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 1174
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
	Checksum: 0x1AF1C073
	Offset: 0x3840
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1196
*/
function function_e5792ced()
{
	zm_spawner::register_zombie_damage_callback(&function_ede8a483);
	zm_spawner::register_zombie_death_event_callback(&function_492115f4);
}

/*
	Name: function_ede8a483
	Namespace: namespace_32dd7dbd
	Checksum: 0x48026B0D
	Offset: 0x3890
	Size: 0x270
	Parameters: 13
	Flags: None
	Line Number: 1212
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
	Checksum: 0x9AEFFF82
	Offset: 0x3B08
	Size: 0x238
	Parameters: 1
	Flags: None
	Line Number: 1251
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
	Checksum: 0x6928B157
	Offset: 0x3D48
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1290
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
	Checksum: 0x4579FB2A
	Offset: 0x3DA0
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1307
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
	Checksum: 0x26F3212A
	Offset: 0x3E20
	Size: 0x268
	Parameters: 1
	Flags: None
	Line Number: 1333
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
	return;
}

/*
	Name: function_6d75ad82
	Namespace: namespace_32dd7dbd
	Checksum: 0x7A2C33C3
	Offset: 0x4090
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 1375
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
}

/*
	Name: function_e651b670
	Namespace: namespace_32dd7dbd
	Checksum: 0x61CA53E1
	Offset: 0x41E0
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 1402
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
	Checksum: 0x7E7E9758
	Offset: 0x4300
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 1436
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
	Checksum: 0xE3A9F03B
	Offset: 0x4420
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1470
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
			return;
		}
	}
	waittillframeend;
}

/*
	Name: function_ede4a5cb
	Namespace: namespace_32dd7dbd
	Checksum: 0x30F801EE
	Offset: 0x4528
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 1503
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
	Checksum: 0x64FB14C9
	Offset: 0x45F8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1534
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
	Checksum: 0xFD615866
	Offset: 0x4668
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1556
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
	Checksum: 0xCE3FAFD3
	Offset: 0x4770
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1587
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
		}
	}
}

/*
	Name: function_7acc9bcc
	Namespace: namespace_32dd7dbd
	Checksum: 0xD6AC816D
	Offset: 0x4878
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1618
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
	Checksum: 0x649E67B1
	Offset: 0x4980
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1649
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
	Checksum: 0x8659B258
	Offset: 0x4A88
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1680
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
		}
	}
}

/*
	Name: function_1c3019e
	Namespace: namespace_32dd7dbd
	Checksum: 0xDE8126CF
	Offset: 0x4B90
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1711
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
		}
	}
}

/*
	Name: function_fd799899
	Namespace: namespace_32dd7dbd
	Checksum: 0x248BF919
	Offset: 0x4C98
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1742
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
	Checksum: 0x447AC671
	Offset: 0x4DA0
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 1773
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
	Checksum: 0x283AB108
	Offset: 0x4EC8
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 1807
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
	Checksum: 0x733794A5
	Offset: 0x4FD8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1840
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
	Checksum: 0x5023BD56
	Offset: 0x5048
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1861
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
	Checksum: 0x5A143773
	Offset: 0x50C8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1883
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
	Checksum: 0x46216C89
	Offset: 0x5140
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 1906
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
	Checksum: 0xED7ACE23
	Offset: 0x5220
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1944
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
}

/*
	Name: function_80481d6a
	Namespace: namespace_32dd7dbd
	Checksum: 0xA5C039F3
	Offset: 0x52B8
	Size: 0x260
	Parameters: 1
	Flags: None
	Line Number: 1973
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
	}
}

/*
	Name: function_deb5d136
	Namespace: namespace_32dd7dbd
	Checksum: 0xA6814997
	Offset: 0x5520
	Size: 0x238
	Parameters: 2
	Flags: None
	Line Number: 2029
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
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a0303fe
	Namespace: namespace_32dd7dbd
	Checksum: 0x70435C12
	Offset: 0x5760
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 2095
*/
function function_a0303fe()
{
	camo = self namespace_11e193f1::function_69424d4c(22);
	if(camo < 1 || camo > 138)
	{
		return;
	}
	self.var_709323d5 = camo;
}

/*
	Name: function_a7516bd6
	Namespace: namespace_32dd7dbd
	Checksum: 0x54041589
	Offset: 0x57C0
	Size: 0x230
	Parameters: 1
	Flags: None
	Line Number: 2115
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
	Checksum: 0xC202582F
	Offset: 0x59F8
	Size: 0xE0
	Parameters: 2
	Flags: None
	Line Number: 2176
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
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_6bec0df8
	Namespace: namespace_32dd7dbd
	Checksum: 0x3EB44EB9
	Offset: 0x5AE0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 2209
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
	return;
	ERROR: Bad function call
}

/*
	Name: function_5575aafe
	Namespace: namespace_32dd7dbd
	Checksum: 0x5B60ACDD
	Offset: 0x5B78
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 2239
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
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_cb32c3a0
	Namespace: namespace_32dd7dbd
	Checksum: 0x31EE7CFB
	Offset: 0x5C10
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 2269
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
	Checksum: 0xCDA6FED9
	Offset: 0x5CA8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 2297
*/
function function_5a3af316(grenade)
{
	IPrintLnBold(self.var_1ad2f4ac + ": ^7 Threw attract grenade");
	grenade waittill("explode", origin);
	function_8e5f11db(origin);
	return;
	~;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_58eaea2c
	Namespace: namespace_32dd7dbd
	Checksum: 0xADE1FA43
	Offset: 0x5D18
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 2317
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
	Checksum: 0x7FE3D54B
	Offset: 0x5D88
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 2334
*/
function function_5a880b6a(grenade)
{
	IPrintLnBold(self.var_1ad2f4ac + ": ^7 Threw attract/revive grenade");
	grenade waittill("explode", origin);
	function_cf054961(origin);
	function_8e5f11db(origin);
	return;
}

/*
	Name: function_8e5f11db
	Namespace: namespace_32dd7dbd
	Checksum: 0x3D3EB64E
	Offset: 0x5E10
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 2353
*/
function function_8e5f11db(origin)
{
	level endon("game_ended");
	var_3b5371ab = spawn("script_model", origin);
	var_3b5371ab SetModel("tag_origin");
	var_3b5371ab zm_utility::create_zombie_point_of_interest(100000);
	wait(15);
	var_3b5371ab delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_cf054961
	Namespace: namespace_32dd7dbd
	Checksum: 0x2F5F7E35
	Offset: 0x5EB8
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 2375
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
}

/*
	Name: loadout_perk
	Namespace: namespace_32dd7dbd
	Checksum: 0xE6263234
	Offset: 0x5FB8
	Size: 0x170
	Parameters: 2
	Flags: None
	Line Number: 2397
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
			return;
		}
	}
}

/*
	Name: function_496a3bb3
	Namespace: namespace_32dd7dbd
	Checksum: 0x4C3F8E8D
	Offset: 0x6130
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 2445
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
	Checksum: 0x379A88B4
	Offset: 0x61A8
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 2468
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
		return;
	}
	~bowie;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_813db459
	Namespace: namespace_32dd7dbd
	Checksum: 0x7A277059
	Offset: 0x6248
	Size: 0x1E0
	Parameters: 2
	Flags: None
	Line Number: 2494
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
	Checksum: 0xBA142C0
	Offset: 0x6430
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 2543
*/
function function_723e3dbc()
{
	var_75f08444 = self namespace_11e193f1::function_69424d4c(30);
	if(var_75f08444 == 0)
	{
		return;
	}
	self.var_fc8b4a8d = 1;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: player_damage_override_callback
	Namespace: namespace_32dd7dbd
	Checksum: 0xF19A4501
	Offset: 0x6480
	Size: 0x188
	Parameters: 10
	Flags: None
	Line Number: 2565
*/
function player_damage_override_callback(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(isdefined(self.var_f16438a3) && self GetCurrentWeapon() == level.weaponRiotshield)
	{
		return 0;
	}
	if(isdefined(self.var_45045ecc) && self.var_45045ecc)
	{
		if(isdefined(eAttacker) && isai(eAttacker))
		{
			forward_view_angles = self GetWeaponForwardDir();
			var_1a98c4d8 = eAttacker GetCentroid();
			normal = VectorNormalize(var_1a98c4d8 - self.origin);
			dot = VectorDot(forward_view_angles, normal);
			if(0 > dot)
			{
				return 0;
			}
			else
			{
				return -1;
			}
		}
		else
		{
			return -1;
		}
	}
	else
	{
		return -1;
	}
}

/*
	Name: function_d35567ee
	Namespace: namespace_32dd7dbd
	Checksum: 0xAB52F83C
	Offset: 0x6610
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 2609
*/
function function_d35567ee(var_9fe0d4a1)
{
	self setClientUIVisibilityFlag("weapon_hud_visible", 0);
	self AllowMelee(0);
	self AllowAds(0);
	self disableOffhandWeapons();
	self DisableWeaponCycling();
	self setMoveSpeedScale(0);
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_acf309c6
	Namespace: namespace_32dd7dbd
	Checksum: 0xA3AC161
	Offset: 0x66C0
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 2632
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
	Checksum: 0x1DABCDFE
	Offset: 0x6778
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 2652
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
	Checksum: 0x741A2FB4
	Offset: 0x6898
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 2675
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
}

/*
	Name: function_d200bf42
	Namespace: namespace_32dd7dbd
	Checksum: 0x85E52E38
	Offset: 0x6968
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 2696
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
	Checksum: 0x18F70D2C
	Offset: 0x69F0
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 2714
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
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_703e15a1
	Namespace: namespace_32dd7dbd
	Checksum: 0x861F719B
	Offset: 0x6AE8
	Size: 0x9C
	Parameters: 0
	Flags: None
	Line Number: 2738
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
	var_d12888a5 = "!Prestige: " + self.var_9d6730be + " Rank: " + self.var_1c43abc3 + "  ~Lobby" + ";;;;logo;Pegasus MOD;Workshop Link;https://steamcommunity.com/sharedfiles/filedetails/?id=2804432292&tscn=1728302475;Discord Link;https://discord.gg/jFRMwcxHVm";
	wait(0.05);
	SetDvar("motd", var_d12888a5);
}

