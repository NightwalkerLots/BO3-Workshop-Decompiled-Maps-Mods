#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\damagefeedback_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_daily_challenges;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zmsavedata;

#namespace namespace_9f2849ef;

/*
	Name: __init__sytem__
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0xF80
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 49
*/
function autoexec __init__sytem__()
{
	system::register("zm_cne", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0xFC8
	Size: 0xC10
	Parameters: 0
	Flags: None
	Line Number: 64
*/
function __init__()
{
	spawner::add_global_spawn_function("axis", &spawn_notify);
	callback::on_spawned(&on_player_connect);
	level thread function_b9da7e8c();
	level thread function_3e2b6d4d();
	function_712cf20b("when a perk is purchased", 1, "perk_bought");
	function_712cf20b("when a powerup spawns", 0, "powerup_dropped");
	function_712cf20b("when a zombie spawns", 0, "zombie_has_spawned");
	function_712cf20b("when a zombie dies", 0, "challenge_kill");
	function_712cf20b("when a player takes damage", 1, "damage");
	function_712cf20b("when a player gets a headshot", 0, "challenge_headshot");
	function_712cf20b("when a zombie dies to a grenade", 0, "zombie_grenade_death");
	function_712cf20b("when a player earns 100+ points", 0, "100_points");
	function_712cf20b("when a player loses 300+ points", 0, "lose_300_points");
	function_712cf20b("when a player loses 1000+ points", 0, "lose_1000_points");
	function_712cf20b("when a door is purchased", 0, "door_opened");
	function_712cf20b("when a player reloads", 1, "reload");
	function_712cf20b("when a player swaps weapons", 1, "weapon_change_complete");
	function_712cf20b("when a gumball is eaten", 1, "bgb_gumball_anim_give");
	function_712cf20b("when a grenade is thrown", 1, "grenade_fire");
	function_712cf20b("when a player slides", 0, "player_slide");
	function_b6114a45("a zombie spawns", &function_fb5ec37);
	function_b6114a45("5 zombies spawn", &function_fa786169);
	function_b6114a45("a random perk is lost", &function_47d5a769);
	function_b6114a45("a random perk is gained", &give_random_perk);
	function_b6114a45("gain 100 points", &function_c9505171);
	function_b6114a45("lose 100 points", &function_e3c5e1e7);
	function_b6114a45("gain 10 percent of your total points", &function_4fd6c0f8);
	function_b6114a45("lose 10 percent of your total points", &function_6f1b1aea);
	function_b6114a45("Activate a random gobblegum effect", &function_b83ce6f0);
	function_b6114a45("Give a random gobblegum", &function_6b22d9c9);
	function_b6114a45("Give a random gun", &function_b6ae2093);
	function_b6114a45("Give a random paped gun", &function_e2e7679);
	function_b6114a45("Active gun toggles being paped", &function_5dacb2e7);
	function_b6114a45("Held gun becomes paped", &function_af80261);
	function_b6114a45("Held gun becomes un-paped", &function_9b9372e8);
	function_b6114a45("Spawn a random powerup", &function_6449d119);
	function_b6114a45("Open a random door", &function_314448ac);
	function_b6114a45("Player speed is randomised", &function_b319c2d0);
	function_b6114a45("Wallbuy prices are randomised", &function_f6a56e82);
	function_b6114a45("Wallbuys are randomised", &function_ed8f9890);
	function_b6114a45("An earthquake occurs", &Earthquake);
	function_b6114a45("A random zombie dies", &function_3bcb4f5e);
	function_b6114a45("A random player drops a grenade", &spawn_grenade);
	function_b6114a45("The mystery box moves", &function_480b8056);
	function_b6114a45("Active weapon gets random attachments", &function_d23b63ab);
	function_b6114a45("Players orientation is slightly changed", &function_96c449e);
	function_b6114a45("A random zombie triggers an AAT", &function_8a1a8bd8);
	function_b6114a45("Players gun gets a random AAT", &function_c97affa9);
	function_b6114a45("Players AAT is removed", &function_373d6b95);
	function_b6114a45("Players take 1 damage", &function_6265272c);
	function_b6114a45("Players ability to sprint will toggle", &function_f890cd98);
	function_b6114a45("Players ability to ADS will toggle", &function_b40d1192);
	function_b6114a45("Players gun gets a random camo", &function_fd993613);
	function_b6114a45("all zombies gain 10 percent of their max health", &function_ef756506);
	function_b6114a45("a random player is slightly moved", &function_1cef064c);
	function_b6114a45("a random zombie teleports near a player", &function_5b1d3887);
	function_b6114a45("Players ability to slide will toggle", &function_2df4f79b);
	function_b6114a45("Players ability to jump will toggle", &function_5931f6a0);
	function_b6114a45("perks will randomize their locations", &function_3d7c6349);
	function_b6114a45("active gun loses a bullet", &function_d9d8c54f);
	function_4006ba6f("when a zombie spawns", "a zombie spawns");
	function_4006ba6f("when a zombie spawns", "5 zombies spawn");
	function_4006ba6f("when a zombie dies", "a zombie spawns");
	function_4006ba6f("when a zombie dies", "5 zombies spawn");
	function_4006ba6f("when a player earns 100+ points", "gain 100 points");
	function_4006ba6f("when a player earns 100+ points", "gain 10 percent of your total points");
	function_4006ba6f("when a player loses 300+ points", "lose 10 percent of your total points");
	function_4006ba6f("when a player loses 1000+ points", "lose 10 percent of your total points");
	function_4006ba6f("when a powerup spawns", "Spawn a random powerup");
	function_4006ba6f("when a player swaps weapons", "Give a random gun");
	function_4006ba6f("when a player swaps weapons", "Give a random paped gun");
	function_4006ba6f("when a player swaps weapons", "Active gun toggles being paped");
	function_4006ba6f("when a zombie spawns", "A random zombie dies");
	function_4006ba6f("when a player swaps weapons", "Active weapon gets random attachments");
	function_4006ba6f("when a zombie spawns", "lose 10 percent of your total points");
	function_4006ba6f("when a zombie dies", "lose 10 percent of your total points");
	function_4006ba6f("when a player gets a headshot", "lose 10 percent of your total points");
	function_4006ba6f("when a player takes damage", "lose 10 percent of your total points");
	function_4006ba6f("when a player slides", "lose 10 percent of your total points");
	function_4006ba6f("when a player reloads", "lose 10 percent of your total points");
	function_4006ba6f("when a player swaps weapons", "lose 10 percent of your total points");
	function_4006ba6f("when a zombie spawns", "Give a random gun");
	function_4006ba6f("when a zombie dies", "Give a random gun");
	function_4006ba6f("when a zombie spawns", "Give a random paped gun");
	function_4006ba6f("when a zombie dies", "Give a random paped gun");
}

/*
	Name: __main__
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x1BE0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 163
*/
function __main__()
{
	level thread function_a6cb80a4();
	return;
}

/*
	Name: function_712cf20b
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x1C08
	Size: 0xA8
	Parameters: 3
	Flags: None
	Line Number: 179
*/
function function_712cf20b(effect_name, is_player, var_388b7025)
{
	if(!isdefined(level.var_26cfe470))
	{
		level.var_26cfe470 = [];
	}
	effect = spawnstruct();
	effect.effect_name = effect_name;
	effect.is_player = is_player;
	effect.var_388b7025 = var_388b7025;
	level.var_26cfe470[level.var_26cfe470.size] = effect;
}

/*
	Name: function_b6114a45
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x1CB8
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 202
*/
function function_b6114a45(effect_name, func)
{
	if(!isdefined(level.var_5198ec4c))
	{
		level.var_5198ec4c = [];
	}
	effect = spawnstruct();
	effect.effect_name = effect_name;
	effect.func = func;
	level.var_5198ec4c[level.var_5198ec4c.size] = effect;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4006ba6f
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x1D48
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 226
*/
function function_4006ba6f(var_3f66bfd0, effect_name)
{
	if(!isdefined(level.var_4a8cbfeb))
	{
		level.var_4a8cbfeb = [];
	}
	effect = spawnstruct();
	effect.var_3f66bfd0 = var_3f66bfd0;
	effect.effect_name = effect_name;
	level.var_4a8cbfeb[level.var_4a8cbfeb.size] = effect;
}

/*
	Name: function_3e2b6d4d
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x1DD8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 248
*/
function function_3e2b6d4d()
{
	while(1)
	{
		level waittill("earned_points", player, points);
		if(isdefined(player) && isPlayer(player) && isdefined(points))
		{
			if(points >= 100)
			{
				level notify("hash_71965fd4");
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_b9da7e8c
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x1E68
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 274
*/
function function_b9da7e8c()
{
	while(1)
	{
		level waittill("spent_points", player, points);
		if(isdefined(player) && isPlayer(player) && isdefined(points))
		{
			if(points >= 300)
			{
				level notify("hash_d670346");
			}
			if(points >= 1000)
			{
				level notify("hash_cb4dfa20");
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_10822eb0
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x1F18
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 304
*/
function function_10822eb0()
{
	while(!isdefined(level.exterior_goals))
	{
		wait(0.1);
	}
	while(1)
	{
		Array::thread_all(level.exterior_goals, &function_460c9874);
		wait(1);
	}
}

/*
	Name: function_460c9874
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x1F78
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 327
*/
function function_460c9874()
{
	self waittill("hash_460c9874");
	self endon("hash_460c9874");
	while(1)
	{
		self waittill("all_boards_repaired");
		level notify("hash_92817662");
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: spawn_notify
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x1FC8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 350
*/
function spawn_notify()
{
	level notify("hash_8a10cc35");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a6cb80a4
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x1FE8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 367
*/
function function_a6cb80a4()
{
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("gamemode_cne") == 0)
	{
		return;
	}
	level.var_f94160f7 = namespace_11e193f1::function_6dd41714("gamemode_cne_stacked");
	level.var_b11fba70 = namespace_11e193f1::function_6dd41714("gamemode_cne_illegal");
	level thread function_9a5e6033();
}

/*
	Name: function_83a88fa
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x2090
	Size: 0xC0
	Parameters: 2
	Flags: None
	Line Number: 389
*/
function function_83a88fa(cause, effect)
{
	if(isdefined(level.var_b11fba70) && level.var_b11fba70)
	{
		return 0;
	}
	for(i = 0; i < level.var_4a8cbfeb.size; i++)
	{
		if(cause.effect_name == level.var_4a8cbfeb[i].var_3f66bfd0 && effect.effect_name == level.var_4a8cbfeb[i].effect_name)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_9a5e6033
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x2158
	Size: 0x698
	Parameters: 0
	Flags: None
	Line Number: 415
*/
function function_9a5e6033()
{
	wait(0.1);
	level flag::wait_till("initial_blackscreen_passed");
	while(1)
	{
		cause = level.var_26cfe470[RandomInt(level.var_26cfe470.size)];
		effect = level.var_5198ec4c[RandomInt(level.var_5198ec4c.size)];
		var_f88bac44 = namespace_851dc78f::function_122a9928("right", "top", "center", "top", -10, 30, 0, (1, 1, 1), cause.effect_name, 2);
		var_85c57520 = namespace_851dc78f::function_122a9928("left", "top", "center", "top", 10, 30, 0, (1, 1, 1), effect.effect_name, 2);
		var_f88bac44 fadeOverTime(1);
		var_f88bac44.alpha = 1;
		var_85c57520 fadeOverTime(1);
		var_85c57520.alpha = 1;
		for(i = 0; i < 10; i++)
		{
			wait(0.1);
			cause = level.var_26cfe470[RandomInt(level.var_26cfe470.size)];
			effect = level.var_5198ec4c[RandomInt(level.var_5198ec4c.size)];
			var_f88bac44 setText(cause.effect_name);
			var_85c57520 setText(effect.effect_name);
			players = GetPlayers();
			for(a = 0; a < players.size; a++)
			{
				players[a] playsound("evt_perk_deny");
			}
		}
		illegal = 0;
		if(function_83a88fa(cause, effect))
		{
			illegal = 1;
		}
		while(illegal)
		{
			wait(0.1);
			cause = level.var_26cfe470[RandomInt(level.var_26cfe470.size)];
			effect = level.var_5198ec4c[RandomInt(level.var_5198ec4c.size)];
			var_f88bac44 setText(cause.effect_name);
			var_85c57520 setText(effect.effect_name);
			players = GetPlayers();
			for(a = 0; a < players.size; a++)
			{
				players[a] playsound("evt_perk_deny");
			}
			if(!function_83a88fa(cause, effect))
			{
				illegal = 0;
			}
		}
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			zm_utility::play_sound_at_pos("purchase", players[i].origin);
		}
		var_c58237e1 = cause.effect_name + ", " + effect.effect_name;
		if(!isdefined(level.var_33b898ae))
		{
			level.var_33b898ae = level namespace_851dc78f::function_122a9928("left", "top", "left", "top", 10, 15, 1, (1, 1, 1), var_c58237e1, 1.2);
		}
		else
		{
			level.var_33b898ae setText(var_c58237e1);
		}
		if(cause.is_player)
		{
			players = GetPlayers();
			for(i = 0; i < players.size; i++)
			{
				players[i] thread function_69f8eef(cause, effect);
			}
		}
		else
		{
			level thread function_69f8eef(cause, effect);
		}
		wait(3);
		var_f88bac44 fadeOverTime(1);
		var_f88bac44.alpha = 0;
		var_85c57520 fadeOverTime(1);
		var_85c57520.alpha = 0;
		wait(1);
		var_f88bac44 destroy();
		var_85c57520 destroy();
		level waittill("end_of_round");
	}
}

/*
	Name: function_69f8eef
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x27F8
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 512
*/
function function_69f8eef(cause, effect)
{
	if(self != level)
	{
		self endon("disconnect");
	}
	level notify("hash_69f8eef");
	wait(0.1);
	if(isdefined(level.var_f94160f7) && !level.var_f94160f7 || !isdefined(level.var_f94160f7))
	{
		level endon("hash_69f8eef");
	}
	while(1)
	{
		self waittill(cause.var_388b7025);
		level [[effect.func]]();
		wait(0.3);
	}
}

/*
	Name: on_player_connect
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x28B0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 542
*/
function on_player_connect()
{
	self thread function_2d5caca8();
	self thread function_fd43aeb2();
}

/*
	Name: function_2d5caca8
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x28F0
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 558
*/
function function_2d5caca8()
{
	self notify("hash_2d5caca8");
	self endon("hash_2d5caca8");
	self endon("disconnect");
	headshots = 0;
	kills = 0;
	while(1)
	{
		if(!isdefined(self.headshots))
		{
			self.headshots = 0;
		}
		if(!isdefined(self.kills))
		{
			self.kills = 0;
		}
		if(self.headshots > headshots)
		{
			headshots = headshots + 1;
			level notify("hash_ce8c51c1", self GetCurrentWeapon());
		}
		if(self.kills > kills)
		{
			kills = kills + 1;
			level notify("hash_2fd15d93", self GetCurrentWeapon());
		}
		wait(0.1);
	}
}

/*
	Name: function_fd43aeb2
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x2A10
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 599
*/
function function_fd43aeb2()
{
	self notify("hash_fd43aeb2");
	self endon("hash_fd43aeb2");
	self endon("disconnect");
	while(1)
	{
		if(self IsSliding())
		{
			level notify("hash_790e867c");
			while(self IsSliding())
			{
				wait(0.1);
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_28b7ec17
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x2A98
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 628
*/
function function_28b7ec17()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread givegobblegum(undefined, 1);
	}
}

/*
	Name: function_292e3617
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x2B10
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 647
*/
function function_292e3617()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread givegobblegum(undefined, 1, "whimsical");
	}
	return;
}

/*
	Name: function_f210330e
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x2B90
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 667
*/
function function_f210330e()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread givegobblegum(undefined, 1, "classic");
	}
	return;
}

/*
	Name: function_12a19e46
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x2C10
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 687
*/
function function_12a19e46()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread givegobblegum(undefined, 1, "mega");
	}
	return;
	~players;
}

/*
	Name: function_66a7ffd0
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x2C90
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 708
*/
function function_66a7ffd0()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread givegobblegum(undefined, 1, "rare");
	}
	return;
}

/*
	Name: function_2bec33d0
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x2D10
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 728
*/
function function_2bec33d0()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread givegobblegum(undefined, 1, "ultra");
	}
}

/*
	Name: function_9b84d8c6
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x2D90
	Size: 0x280
	Parameters: 2
	Flags: None
	Line Number: 747
*/
function function_9b84d8c6(type, var_c8570286)
{
	var_a95e1085 = [];
	num = undefined;
	if(type == "classic")
	{
		num = 0;
	}
	if(type == "mega")
	{
		num = 1;
	}
	if(type == "rare")
	{
		num = 2;
	}
	if(type == "ultra")
	{
		num = 3;
	}
	if(type == "whimsical")
	{
		num = 4;
	}
	index = 1;
	for(row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index); isdefined(row); row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index))
	{
		var_71832171 = 0;
		var_803e329f = checkStringValid(row[2]);
		if(var_803e329f == "bubblegum" || var_803e329f == "bubblegum_consumable")
		{
			var_71832171 = 1;
		}
		var_d277f374 = Int(row[16]);
		var_a0ec4ef3 = checkStringValid(row[4]);
		if(!isdefined(num) || (isdefined(num) && num == var_d277f374))
		{
			if(isdefined(var_a0ec4ef3) && var_71832171)
			{
				var_a95e1085[var_a95e1085.size] = var_a0ec4ef3;
			}
		}
		index++;
		if(index == 101)
		{
			index++;
		}
	}
	if(isdefined(var_c8570286) && var_c8570286)
	{
		return var_a95e1085;
	}
	return function_b4705b81(var_a95e1085[RandomInt(var_a95e1085.size)]);
}

/*
	Name: function_b4705b81
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3018
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 812
*/
function function_b4705b81(var_33636f4a)
{
	index = 1;
	for(row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index); isdefined(row); row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index))
	{
		var_a0ec4ef3 = checkStringValid(row[4]);
		if(var_a0ec4ef3 == var_33636f4a)
		{
			break;
		}
		index++;
		if(index == 101)
		{
			index++;
		}
	}
	struct = spawnstruct();
	struct.name = var_a0ec4ef3;
	struct.UI = checkStringValid(row[3]);
	struct.camoIndex = Int(row[5]);
	struct.hud = checkStringValid(row[6]);
	struct.description = checkStringValid(row[7]);
	struct.var_d277f374 = Int(row[16]);
	struct.activation = checkStringValid(row[20]);
	return struct;
}

/*
	Name: checkStringValid
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3218
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 849
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
	Name: givegobblegum
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3248
	Size: 0x2F0
	Parameters: 3
	Flags: None
	Line Number: 868
*/
function givegobblegum(var_33636f4a, play_anim, type)
{
	if(!isdefined(play_anim))
	{
		play_anim = 1;
	}
	self endon("disconnect");
	if(isdefined(self.var_5462dfe0))
	{
		return;
	}
	self thread function_d280daa1();
	if(!isdefined(var_33636f4a))
	{
		var_33636f4a = function_9b84d8c6(type);
	}
	if(play_anim)
	{
		while(!self namespace_851dc78f::function_1275e2ff())
		{
			wait(0.1);
		}
		var_a6bea1a = GetWeapon("zombie_bgb_grab");
		oldWeapon = self GetCurrentWeapon();
		var_a6bea1a = self getbuildkitweapon(var_a6bea1a, 0);
		weapon_options = self getbuildkitweaponoptions(var_a6bea1a, var_33636f4a.camoIndex);
		acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(var_a6bea1a, 0);
		self GiveWeapon(var_a6bea1a, weapon_options, acvi);
		self SwitchToWeapon(var_a6bea1a);
		self thread function_78da9ac7();
		evt = self util::waittill_any_return("fake_death", "death", "player_downed", "weapon_change_complete", "perk_abort_drinking", "disconnect", "giveGobbleGumTimeout");
		self TakeWeapon(var_a6bea1a);
		self SwitchToWeapon(oldWeapon);
	}
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	self playsoundtoplayer("bgb_grab", self);
	self bgb::give(var_33636f4a.name);
	if(!play_anim && var_33636f4a.name == "zm_bgb_disorderly_combat")
	{
		wait(0.5);
		self notify("weapon_change_complete");
	}
}

/*
	Name: function_d280daa1
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3540
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 925
*/
function function_d280daa1()
{
	self.var_5462dfe0 = 1;
	wait(3.6);
	self.var_5462dfe0 = undefined;
}

/*
	Name: function_78da9ac7
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3570
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 942
*/
function function_78da9ac7()
{
	self endon("fake_death");
	self endon("death");
	self endon("player_downed");
	self endon("weapon_change_complete");
	self endon("perk_abort_drinking");
	self endon("disconnect");
	wait(4);
	self notify("hash_78da9ac7");
}

/*
	Name: function_fa786169
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x35D8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 964
*/
function function_fa786169()
{
	level.zombie_total = level.zombie_total + 5;
}

/*
	Name: function_fb5ec37
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x35F8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 979
*/
function function_fb5ec37()
{
	level.zombie_total = level.zombie_total + 1;
}

/*
	Name: function_47d5a769
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3618
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 994
*/
function function_47d5a769()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_perks::lose_random_perk();
	}
}

/*
	Name: give_random_perk
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3688
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1013
*/
function give_random_perk()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] function_6a382289();
	}
	return;
}

/*
	Name: function_6a382289
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x36F8
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 1033
*/
function function_6a382289()
{
	random_perk = undefined;
	a_str_perks = getArrayKeys(level._custom_perks);
	PERKS = [];
	for(i = 0; i < a_str_perks.size; i++)
	{
		perk = a_str_perks[i];
		if(isdefined(self.perk_purchased) && self.perk_purchased == perk)
		{
			continue;
		}
		if(!namespace_851dc78f::function_20dc5a15(perk) && !self hasPerk(perk) || (namespace_851dc78f::function_20dc5a15(perk) && !self namespace_851dc78f::function_5f9a13b3(perk)))
		{
			PERKS[PERKS.size] = perk;
		}
	}
	if(PERKS.size > 0)
	{
		PERKS = Array::randomize(PERKS);
		random_perk = PERKS[0];
		self zm_perks::give_perk(random_perk);
	}
	return random_perk;
}

/*
	Name: function_c9505171
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3878
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1069
*/
function function_c9505171()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::add_to_player_score(100);
	}
}

/*
	Name: function_e3c5e1e7
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x38F0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1088
*/
function function_e3c5e1e7()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::minus_to_player_score(100);
	}
}

/*
	Name: function_4fd6c0f8
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3968
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1107
*/
function function_4fd6c0f8()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::add_to_player_score(Int(players[i].score / 10));
	}
	return;
}

/*
	Name: function_6f1b1aea
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3A00
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1127
*/
function function_6f1b1aea()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::minus_to_player_score(Int(players[i].score / 10));
	}
}

/*
	Name: function_b83ce6f0
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3A98
	Size: 0x2A0
	Parameters: 0
	Flags: None
	Line Number: 1146
*/
function function_b83ce6f0()
{
	var_a95e1085 = function_9b84d8c6(undefined, 1);
	var_a95e1085 = Array::randomize(var_a95e1085);
	var_8cf6bbc9 = [];
	var_8cf6bbc9[var_8cf6bbc9.size] = "zm_bgb_alchemical_antithesis";
	var_8cf6bbc9[var_8cf6bbc9.size] = "zm_bgb_ephemeral_enhancement";
	var_8cf6bbc9[var_8cf6bbc9.size] = "zm_bgb_eye_candy";
	var_8cf6bbc9[var_8cf6bbc9.size] = "zm_bgb_fear_in_headlights";
	var_8cf6bbc9[var_8cf6bbc9.size] = "zm_bgb_idle_eyes";
	var_8cf6bbc9[var_8cf6bbc9.size] = "zm_bgb_in_plain_sight";
	var_8cf6bbc9[var_8cf6bbc9.size] = "zm_bgb_killing_time";
	var_8cf6bbc9[var_8cf6bbc9.size] = "zm_bgb_now_you_see_me";
	var_f86554d7 = "";
	for(i = 0; i < var_a95e1085.size; i++)
	{
		if(level.bgb[var_a95e1085[i]].var_c9e64d65 == "activated")
		{
			var_f86554d7 = var_a95e1085[i];
			break;
		}
	}
	var_9fc09a56 = 0;
	for(i = 0; i < var_8cf6bbc9.size; i++)
	{
		if(var_8cf6bbc9[i] == var_f86554d7)
		{
			var_9fc09a56 = 1;
		}
	}
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(var_9fc09a56)
		{
			players[i] thread givegobblegum(var_f86554d7, 0);
		}
		wait(0.1);
		if(players[i] [[level.bgb[var_f86554d7].validation_func]]() && isdefined(players[i]))
		{
			players[i] thread [[level.bgb[var_f86554d7].var_6fa3d682]]();
		}
	}
	wait(3);
}

/*
	Name: function_6b22d9c9
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3D40
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1202
*/
function function_6b22d9c9()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread givegobblegum(undefined, 0);
	}
}

/*
	Name: function_b6ae2093
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3DB8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1221
*/
function function_b6ae2093()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_4b1a1737();
	}
}

/*
	Name: function_e2e7679
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3E28
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1240
*/
function function_e2e7679()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_4b1a1737(1);
	}
}

/*
	Name: function_4b1a1737
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x3EA0
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 1259
*/
function function_4b1a1737(var_6c95c0b7)
{
	if(!isdefined(var_6c95c0b7))
	{
		var_6c95c0b7 = 0;
	}
	self endon("disconnect");
	wait(0.4);
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	self.var_97c73248 = 1;
	weap = undefined;
	while(weap == undefined)
	{
		weap = zm_magicbox::treasure_chest_ChooseWeightedRandomWeapon(self);
		if(weap == level.weaponNone || zm_utility::is_lethal_grenade(weap) || zm_utility::is_tactical_grenade(weap) || zm_equipment::is_equipment(weap) || zm_utility::is_placeable_mine(weap) || weap.isRiotShield || weap.isHeroWeapon || weap.isgadget || weap.isFlourishWeapon)
		{
			weap = undefined;
		}
		wait(0.01);
	}
	if(var_6c95c0b7 == 1 && self zm_weapons::can_upgrade_weapon(weap))
	{
		weap = zm_weapons::get_upgrade_weapon(weap);
	}
	weap = self zm_weapons::weapon_give(weap);
	self SwitchToWeaponImmediate(weap);
	wait(0.1);
	self.var_97c73248 = undefined;
	wait(0.1);
}

/*
	Name: function_5dacb2e7
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x40A8
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1303
*/
function function_5dacb2e7()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		current_weapon = players[i] GetCurrentWeapon();
		current_weapon = players[i] zm_weapons::switch_from_alt_weapon(current_weapon);
		if(!zm_weapons::is_weapon_upgraded(current_weapon))
		{
			players[i] thread function_8d654c9c();
			continue;
		}
		players[i] thread function_404b3bcb();
	}
}

/*
	Name: function_af80261
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x41A0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1329
*/
function function_af80261()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_8d654c9c();
	}
}

/*
	Name: function_8d654c9c
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x4210
	Size: 0x3B0
	Parameters: 0
	Flags: None
	Line Number: 1348
*/
function function_8d654c9c()
{
	self endon("disconnect");
	wait(0.4);
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	self.var_97c73248 = 1;
	current_weapon = self GetCurrentWeapon();
	current_weapon = self zm_weapons::switch_from_alt_weapon(current_weapon);
	if(self zm_weapons::can_upgrade_weapon(current_weapon))
	{
		b_weapon_supports_aat = zm_weapons::weapon_supports_aat(current_weapon);
		upgrade_weapon = zm_weapons::get_upgrade_weapon(current_weapon, b_weapon_supports_aat);
		current_weapon = self getbuildkitweapon(current_weapon, 0);
		upgrade_weapon = self getbuildkitweapon(upgrade_weapon, 1);
		current_weapon_options = self getbuildkitweaponoptions(current_weapon);
		current_weapon_acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(current_weapon, 0);
		pap_camo_to_use = zm_weapons::get_pack_a_punch_camo_index();
		upgrade_weapon_options = self getbuildkitweaponoptions(upgrade_weapon, pap_camo_to_use);
		upgrade_weapon_acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(upgrade_weapon, 1);
		weapon_limit = zm_utility::get_player_weapon_limit(self);
		Primaries = self getweaponslistprimaries();
		if(isdefined(Primaries) && Primaries.size >= weapon_limit)
		{
			upgrade_weapon = self zm_weapons::weapon_give(upgrade_weapon);
		}
		else
		{
			self TakeWeapon(current_weapon);
			upgrade_weapon = self zm_weapons::give_build_kit_weapon(upgrade_weapon);
			self GiveStartAmmo(upgrade_weapon);
		}
		self notify("weapon_give", upgrade_weapon);
		aatID = -1;
		if(isdefined(b_weapon_supports_aat) && b_weapon_supports_aat)
		{
			self thread AAT::acquire(upgrade_weapon);
			aatObj = self AAT::getAATOnWeapon(upgrade_weapon);
			if(isdefined(aatObj))
			{
				aatID = aatObj.hash_id;
			}
		}
		else
		{
			self thread AAT::remove(upgrade_weapon);
		}
		self SwitchToWeapon(upgrade_weapon);
		self zm_weapons::play_weapon_vo(upgrade_weapon);
		wait(0.1);
	}
	self.var_97c73248 = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_9b9372e8
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x45C8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1416
*/
function function_9b9372e8()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_404b3bcb();
	}
}

/*
	Name: function_404b3bcb
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x4638
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 1435
*/
function function_404b3bcb()
{
	self endon("disconnect");
	wait(0.4);
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	self.var_97c73248 = undefined;
	current_weapon = self GetCurrentWeapon();
	current_weapon = self zm_weapons::switch_from_alt_weapon(current_weapon);
	if(zm_weapons::is_weapon_upgraded(current_weapon))
	{
		rootweapon = zm_weapons::get_base_weapon(current_weapon);
		if(isdefined(rootweapon))
		{
			weapon_limit = zm_utility::get_player_weapon_limit(self);
			Primaries = self getweaponslistprimaries();
			if(isdefined(Primaries) && Primaries.size >= weapon_limit)
			{
				upgrade_weapon = self zm_weapons::weapon_give(rootweapon);
			}
			else
			{
				self TakeWeapon(current_weapon);
				upgrade_weapon = self zm_weapons::give_build_kit_weapon(rootweapon);
				self GiveStartAmmo(rootweapon);
			}
			self notify("weapon_give", upgrade_weapon);
		}
		wait(0.1);
	}
	self.var_97c73248 = undefined;
	return;
}

/*
	Name: function_4bf4ac40
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x4808
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1481
*/
function function_4bf4ac40()
{
	valid = [];
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(zm_utility::is_player_valid(players[i]))
		{
			valid[valid.size] = players[i];
		}
	}
	return valid[RandomInt(valid.size)];
}

/*
	Name: function_6449d119
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x48C0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1505
*/
function function_6449d119()
{
	player = function_4bf4ac40();
	if(player [[level.bgb["zm_bgb_im_feelin_lucky"].validation_func]]())
	{
		player [[level.bgb["zm_bgb_im_feelin_lucky"].var_6fa3d682]]();
	}
}

/*
	Name: function_314448ac
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x4938
	Size: 0x2F8
	Parameters: 0
	Flags: None
	Line Number: 1524
*/
function function_314448ac()
{
	zombie_doors = GetEntArray("zombie_door", "targetname");
	zombie_debris = GetEntArray("zombie_debris", "targetname");
	zombie_debris = ArrayCombine(zombie_debris, zombie_doors, 0, 1);
	var_c2244aff = [];
	if(isdefined(zombie_debris) && zombie_debris.size > 0)
	{
		for(i = 0; i < zombie_debris.size; i++)
		{
			if(isdefined(zombie_debris[i].purchaser) || (isdefined(zombie_debris[i]._door_open) && zombie_debris[i]._door_open))
			{
				continue;
			}
			if(!isdefined(zombie_debris[i].script_noteworthy) || zombie_debris[i].script_noteworthy != "electric_door" || zombie_debris[i].script_noteworthy != "electric_buyable_door" || isdefined(zombie_debris[i].has_been_opened))
			{
				var_c2244aff[var_c2244aff.size] = zombie_debris[i];
			}
		}
	}
	player = GetPlayers()[0];
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(zm_utility::is_player_valid(players[i]))
		{
			player = players[i];
		}
	}
	if(isdefined(var_c2244aff) && var_c2244aff.size > 0)
	{
		SetDvar("zombie_unlock_all", 1);
		wait(0.1);
		door = var_c2244aff[RandomInt(var_c2244aff.size)];
		door notify("trigger", player, 1);
		door.has_been_opened = 1;
		wait(0.1);
		SetDvar("zombie_unlock_all", 0);
	}
}

/*
	Name: function_b319c2d0
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x4C38
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1575
*/
function function_b319c2d0()
{
	level thread function_31430b83();
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] setMoveSpeedScale(RandomFloatRange(0.5, 1.5));
	}
}

/*
	Name: function_31430b83
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x4CE0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1595
*/
function function_31430b83()
{
	level notify("hash_b994ab38");
	level endon("hash_b994ab38");
	level waittill("hash_69f8eef");
	wait(0.1);
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] setMoveSpeedScale(1);
	}
}

/*
	Name: function_f6a56e82
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x4D88
	Size: 0x2C0
	Parameters: 0
	Flags: None
	Line Number: 1618
*/
function function_f6a56e82()
{
	if(isdefined(level._unitriggers))
	{
		for(i = 0; i < level._unitriggers.trigger_stubs.size; i++)
		{
			stub = level._unitriggers.trigger_stubs[i];
			tn = stub.targetname;
			weap = stub.weapon;
			if(tn == "weapon_upgrade" && isdefined(weap) && isdefined(level.zombie_weapons[weap]) && (!(isdefined(weap.isgrenadeweapon) && weap.isgrenadeweapon)))
			{
				if(!isdefined(level.zombie_weapons[weap].original_cost))
				{
					level.zombie_weapons[weap].original_cost = level.zombie_weapons[weap].cost;
				}
				cost = level.zombie_weapons[weap].original_cost / 10;
				min = Int(cost * 0.5);
				max = Int(cost * 2);
				cost = randomIntRange(min, max) * 10;
				level.zombie_weapons[weap].cost = cost;
				level.zombie_weapons[weap].ammo_cost = Int(cost / 2);
				stub.hint_string = zm_weapons::get_weapon_hint(stub.weapon);
				stub.cost = cost;
				stub.hint_parm1 = cost;
				level.weapon_cost_client_filled = 0;
				stub setHintString(stub.hint_string, cost);
			}
		}
	}
}

/*
	Name: function_ed8f9890
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x5050
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 1659
*/
function function_ed8f9890()
{
	if(isdefined(level._unitriggers))
	{
		candidates = [];
		weapons = [];
		for(i = 0; i < level._unitriggers.trigger_stubs.size; i++)
		{
			stub = level._unitriggers.trigger_stubs[i];
			tn = stub.targetname;
			weap = stub.weapon;
			if(tn == "weapon_upgrade" && isdefined(weap) && isdefined(level.zombie_weapons[stub.weapon]) && (!(isdefined(weap.isgrenadeweapon) && weap.isgrenadeweapon)))
			{
				candidates[candidates.size] = stub;
				weapons[weapons.size] = stub.weapon;
			}
		}
		weapons = Array::randomize(weapons);
		for(i = 0; i < candidates.size; i++)
		{
			candidates[i].weapon = weapons[i];
		}
		return;
	}
}

/*
	Name: Earthquake
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x5200
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 1695
*/
function Earthquake()
{
	Earthquake(0.75, 1.5, (0, 0, 0), 1000000);
}

/*
	Name: function_3bcb4f5e
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x5240
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1710
*/
function function_3bcb4f5e()
{
	a_ai = GetAIArray();
	for(i = 0; i < a_ai.size; i++)
	{
		if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie")
		{
			a_ai[i] DoDamage(a_ai[i].health + 666, a_ai[i].origin);
			break;
		}
	}
}

/*
	Name: spawn_grenade
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x5338
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1733
*/
function spawn_grenade()
{
	player = function_4bf4ac40();
	w_grenade = GetWeapon("frag_grenade");
	player MagicGrenadeType(w_grenade, player.origin, VectorScale((0, 0, 1), 300), 3);
	return;
}

/*
	Name: function_8e3197c0
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x53C0
	Size: 0x3F0
	Parameters: 2
	Flags: None
	Line Number: 1751
*/
function function_8e3197c0(weapon, count)
{
	weapon = weapon.rootweapon;
	attachments = weapon.supportedAttachments;
	attachments = Array::randomize(attachments);
	Attach = [];
	var_3b61809f = [];
	var_f72e2041 = [];
	for(i = 0; i < attachments.size; i++)
	{
		if(IsSubStr(attachments[i], "holo") || IsSubStr(attachments[i], "acog") || IsSubStr(attachments[i], "reflex") || IsSubStr(attachments[i], "ir") || IsSubStr(attachments[i], "reddot"))
		{
			var_3b61809f[var_3b61809f.size] = attachments[i];
		}
		if(IsSubStr(attachments[i], "rf") || IsSubStr(attachments[i], "extbarrel") || IsSubStr(attachments[i], "steadyaim") || IsSubStr(attachments[i], "grip") || IsSubStr(attachments[i], "fastreload") || IsSubStr(attachments[i], "quickdraw") || IsSubStr(attachments[i], "stalker"))
		{
			var_f72e2041[var_f72e2041.size] = attachments[i];
		}
	}
	for(i = 0; i < var_f72e2041.size; i++)
	{
		Attach[Attach.size] = var_f72e2041[i];
	}
	if(Attach.size < 1)
	{
		return;
	}
	if(Attach.size < count)
	{
		count = Attach.size;
	}
	if(RandomInt(100) > 80)
	{
		level.zombie_weapons[weapon].force_attachments[0] = var_3b61809f[RandomInt(var_3b61809f.size)];
	}
	Attach = Array::randomize(Attach);
	for(i = 1; i < count + 1; i++)
	{
		level.zombie_weapons[weapon].force_attachments[i] = Attach[i];
	}
}

/*
	Name: function_d23b63ab
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x57B8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1803
*/
function function_d23b63ab()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] function_24b2ba2f();
	}
}

/*
	Name: function_24b2ba2f
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x5828
	Size: 0x340
	Parameters: 0
	Flags: None
	Line Number: 1822
*/
function function_24b2ba2f()
{
	self endon("disconnect");
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	self.var_97c73248 = 1;
	swap_weapon = self GetCurrentWeapon();
	swap_weapon = swap_weapon.rootweapon;
	var_9b6c3861 = self GetCurrentWeapon();
	weapon = self GetCurrentWeapon();
	weapon = zm_weapons::get_nonalternate_weapon(weapon);
	newWeapon = GetWeapon(weapon);
	level.zombie_weapons[weapon].force_attachments = [];
	if(isdefined(weapon.supportedAttachments) && weapon.supportedAttachments.size > 0)
	{
		function_8e3197c0(weapon, 5);
		newWeapon = zm_weapons::get_weapon_with_attachments(weapon);
		self TakeWeapon(var_9b6c3861);
		primaryWeapons = self getweaponslistprimaries();
		if(isdefined(primaryWeapons) && primaryWeapons.size > 0)
		{
			self SwitchToWeaponImmediate(primaryWeapons[0]);
		}
		wait(0.1);
		upgrade_weapon = self zm_weapons::give_build_kit_weapon(newWeapon);
		self GiveStartAmmo(newWeapon);
		self SwitchToWeaponImmediate(newWeapon);
	}
	primaryWeapons = self getweaponslistprimaries();
	for(i = 0; i < primaryWeapons.size; i++)
	{
		if(primaryWeapons[i].rootweapon == swap_weapon)
		{
			self SetWeaponAmmoStock(primaryWeapons[i], primaryWeapons[i].maxAmmo);
			self SetWeaponAmmoClip(primaryWeapons[i], primaryWeapons[i].clipSize);
			self SwitchToWeaponImmediate(primaryWeapons[i]);
		}
	}
	wait(0.1);
	self.var_97c73248 = undefined;
}

/*
	Name: function_480b8056
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x5B70
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 1876
*/
function function_480b8056()
{
	if(isdefined(level.chests[level.chest_index].chest_user) || level.zombie_vars["zombie_powerup_fire_sale_on"] == 1)
	{
		return;
	}
	player = GetPlayers()[0];
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(zm_utility::is_player_valid(players[i]) && players[i].score >= 950)
		{
			player = players[i];
		}
	}
	if(player.score < 950)
	{
		player zm_score::add_to_player_score(Int(950 - player.score));
	}
	if(isdefined(level.chests) && level.chests.size > 1 && isdefined(player))
	{
		level._zombiemode_chest_joker_chance_override_func = &function_1199440e;
		level flag::set("moving_chest_now");
		level.chests[level.chest_index] notify("trigger", player);
		level flag::wait_till_clear("moving_chest_now");
		level._zombiemode_chest_joker_chance_override_func = undefined;
	}
}

/*
	Name: function_1199440e
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x5D68
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 1915
*/
function function_1199440e()
{
	return 100;
}

/*
	Name: function_96c449e
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x5D78
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1930
*/
function function_96c449e()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] SetPlayerAngles(players[i] getPlayerAngles() + (randomIntRange(-10, 10), randomIntRange(-10, 10), randomIntRange(-10, 10)));
	}
}

/*
	Name: function_c97affa9
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x5E50
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1949
*/
function function_c97affa9()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] [[level.bgb["zm_bgb_bullet_boost"].validation_func]]())
		{
			players[i] [[level.bgb["zm_bgb_bullet_boost"].var_6fa3d682]]();
		}
	}
}

/*
	Name: function_373d6b95
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x5F00
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 1971
*/
function function_373d6b95()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		current_weapon = players[i] GetCurrentWeapon();
		current_weapon = players[i] zm_weapons::switch_from_alt_weapon(current_weapon);
		b_weapon_supports_aat = zm_weapons::weapon_supports_aat(current_weapon);
		if(b_weapon_supports_aat)
		{
			currentAAT = players[i] AAT::getAATOnWeapon(current_weapon);
			if(isdefined(currentAAT))
			{
				players[i] thread AAT::remove(current_weapon);
			}
		}
	}
}

/*
	Name: function_8a1a8bd8
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x6028
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 2000
*/
function function_8a1a8bd8()
{
	player = function_4bf4ac40();
	a_ai = GetAIArray();
	for(i = 0; i < a_ai.size; i++)
	{
		if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie")
		{
			a_ai[i] thread function_eb348024(player, player GetCurrentWeapon(), "MOD_RIFLE_BULLET");
			break;
		}
	}
	wait(2);
}

/*
	Name: function_eb348024
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x6138
	Size: 0x248
	Parameters: 3
	Flags: None
	Line Number: 2025
*/
function function_eb348024(e_player, w_weapon, str_mod)
{
	e_player endon("disconnect");
	e_player.var_4fc097c9 = 1;
	keys = getArrayKeys(level.AAT);
	AATs = [];
	for(i = 0; i < keys.size; i++)
	{
		if(keys[i] != "none")
		{
			AATs[AATs.size] = keys[i];
		}
	}
	if(AATs.size > 0)
	{
		name = AATs[RandomInt(AATs.size)];
		if(isdefined(level.AAT[name].validation_func))
		{
			if(self [[level.AAT[name].validation_func]]())
			{
				self thread [[level.AAT[name].result_func]](0, e_player, str_mod, w_weapon);
				e_player thread damagefeedback::update_override(level.AAT[name].damage_feedback_icon, level.AAT[name].damage_feedback_sound);
			}
		}
		else
		{
			self thread [[level.AAT[name].result_func]](0, e_player, str_mod, w_weapon);
			e_player thread damagefeedback::update_override(level.AAT[name].damage_feedback_icon, level.AAT[name].damage_feedback_sound);
		}
	}
	e_player.var_4fc097c9 = undefined;
	return;
}

/*
	Name: function_6265272c
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x6388
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 2069
*/
function function_6265272c()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] DoDamage(1, players[i].origin);
	}
}

/*
	Name: function_f890cd98
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x6410
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 2088
*/
function function_f890cd98()
{
	if(!isdefined(level.var_c2e7f4a1))
	{
		level.var_c2e7f4a1 = 0;
	}
	level.var_c2e7f4a1 = !level.var_c2e7f4a1;
	level thread function_5d22eac3();
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(level.var_c2e7f4a1)
		{
			players[i] AllowSprint(1);
			continue;
		}
		players[i] AllowSprint(0);
	}
}

/*
	Name: function_5d22eac3
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x64F0
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 2118
*/
function function_5d22eac3()
{
	level notify("hash_e2459f00");
	level endon("hash_e2459f00");
	level waittill("hash_69f8eef");
	wait(0.1);
	level.var_c2e7f4a1 = undefined;
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] AllowSprint(1);
	}
}

/*
	Name: function_b40d1192
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x65A8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 2142
*/
function function_b40d1192()
{
	if(!isdefined(level.var_d5ef4239))
	{
		level.var_d5ef4239 = 0;
	}
	level.var_d5ef4239 = !level.var_d5ef4239;
	level thread function_d7f35f17();
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(level.var_d5ef4239)
		{
			players[i] AllowAds(1);
			continue;
		}
		players[i] AllowAds(0);
	}
}

/*
	Name: function_d7f35f17
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x6688
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 2172
*/
function function_d7f35f17()
{
	level notify("hash_8e47e48a");
	level endon("hash_8e47e48a");
	level waittill("hash_69f8eef");
	wait(0.1);
	level.var_d5ef4239 = undefined;
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] AllowAds(1);
	}
}

/*
	Name: function_fd993613
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x6740
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 2196
*/
function function_fd993613()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_aa5b2a69();
	}
}

/*
	Name: function_aa5b2a69
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x67B0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 2215
*/
function function_aa5b2a69()
{
	self endon("disconnect");
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	camo = randomIntRange(1, 126);
	self function_c8540b60(self GetCurrentWeapon(), self CalcWeaponOptions(camo, 0, 0));
}

/*
	Name: function_ef756506
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x6850
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 2236
*/
function function_ef756506()
{
	a_ai = GetAIArray();
	for(i = 0; i < a_ai.size; i++)
	{
		if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie")
		{
			a_ai[i].health = a_ai[i].health + Int(a_ai[i].maxhealth / 10);
		}
	}
}

/*
	Name: function_1cef064c
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x6948
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 2258
*/
function function_1cef064c()
{
	player = function_4bf4ac40();
	angles = player getPlayerAngles() + (0, RandomInt(360), 0);
	angles_forward = AnglesToForward(angles);
	push = VectorScale(angles_forward, 100);
	player SetVelocity(push);
}

/*
	Name: function_5b1d3887
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x6A08
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2277
*/
function function_5b1d3887()
{
	a_ai = GetAIArray();
	for(i = 0; i < a_ai.size; i++)
	{
		if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie")
		{
			a_ai[i] thread function_532a88b2();
			break;
		}
	}
}

/*
	Name: function_532a88b2
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x6AD0
	Size: 0x2A8
	Parameters: 0
	Flags: None
	Line Number: 2300
*/
function function_532a88b2()
{
	self endon("death");
	wait(0.2);
	self notify("rise_anim_finished");
	self.in_the_ground = 0;
	self notify("risen", "find_flesh");
	self Unlink();
	if(isdefined(self.anchor))
	{
		self.anchor delete();
	}
	self show();
	player = function_4bf4ac40();
	position = player.last_valid_position;
	if(isdefined(position))
	{
		N_RAPS_SPAWN_DIST_MIN = 250;
		N_RAPS_SPAWN_DIST_MAX = 500;
		query_result = PositionQuery_Source_Navigation(position, N_RAPS_SPAWN_DIST_MIN, N_RAPS_SPAWN_DIST_MAX, 200, 32, 16);
		if(query_result.data.size)
		{
			a_s_locs = Array::randomize(query_result.data);
			if(isdefined(a_s_locs))
			{
				foreach(s_loc in a_s_locs)
				{
					if(zm_utility::check_point_in_enabled_zone(s_loc.origin, 1, level.active_zones))
					{
						s_loc.origin = s_loc.origin + VectorScale((0, 0, 1), 16);
						self.zone_name = player zm_utility::get_current_zone(1);
						self ForceTeleport(s_loc.origin + VectorScale((0, 0, 1), 5), self.angles, 1, 1);
						return;
					}
				}
				return;
			}
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3d7c6349
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x6D80
	Size: 0x558
	Parameters: 0
	Flags: None
	Line Number: 2352
*/
function function_3d7c6349()
{
	locs = [];
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(!isdefined(vending_triggers[i].var_51baeddc))
		{
			fxOrg = spawn("script_model", vending_triggers[i].machine.origin);
			fxOrg SetModel("tag_origin");
			fxOrg.angles = vending_triggers[i].machine.angles;
			locs[locs.size] = fxOrg;
		}
	}
	locs = Array::randomize(locs);
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(!isdefined(vending_triggers[i].var_51baeddc))
		{
			clip = vending_triggers[i].clip;
			machine = vending_triggers[i].machine;
			bump_trigger = vending_triggers[i].bump_trigger;
			machine.origin = locs[i].origin;
			clip.origin = locs[i].origin;
			bump_trigger.origin = locs[i].origin + VectorScale((0, 0, 1), 20);
			machine.angles = locs[i].angles;
			machine RotateTo(locs[i].angles, 0.2);
			clip.angles = locs[i].angles;
			bump_trigger.angles = locs[i].angles;
			vending_triggers[i].origin = locs[i].origin + VectorScale((0, 0, 1), 60);
			machine.angles = locs[i].angles;
		}
	}
	wait(1);
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(!isdefined(vending_triggers[i].var_51baeddc))
		{
			clip = vending_triggers[i].clip;
			machine = vending_triggers[i].machine;
			bump_trigger = vending_triggers[i].bump_trigger;
			machine.origin = locs[i].origin;
			clip.origin = locs[i].origin;
			bump_trigger.origin = locs[i].origin + VectorScale((0, 0, 1), 20);
			machine.angles = locs[i].angles;
			machine RotateTo(locs[i].angles, 0.2);
			clip.angles = locs[i].angles;
			bump_trigger.angles = locs[i].angles;
			vending_triggers[i].origin = locs[i].origin + VectorScale((0, 0, 1), 60);
			machine.angles = locs[i].angles;
		}
	}
}

/*
	Name: function_d9d8c54f
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x72E0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 2418
*/
function function_d9d8c54f()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] SetWeaponAmmoStock(players[i] GetCurrentWeapon(), players[i] getammocount(players[i] GetCurrentWeapon()) - players[i] GetWeaponAmmoClip(players[i] GetCurrentWeapon()) - 1);
	}
}

/*
	Name: function_2df4f79b
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x73E0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 2437
*/
function function_2df4f79b()
{
	if(!isdefined(level.var_b032f23a))
	{
		level.var_b032f23a = 0;
	}
	level.var_b032f23a = !level.var_b032f23a;
	level thread function_a849fb46();
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(level.var_b032f23a)
		{
			players[i] allowslide(1);
			continue;
		}
		players[i] allowslide(0);
	}
}

/*
	Name: function_a849fb46
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x74C0
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 2467
*/
function function_a849fb46()
{
	level notify("hash_b5ad1bb3");
	level endon("hash_b5ad1bb3");
	level waittill("hash_69f8eef");
	wait(0.1);
	level.var_b032f23a = undefined;
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] allowslide(1);
	}
	return;
	continue;
}

/*
	Name: function_5931f6a0
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x7578
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 2493
*/
function function_5931f6a0()
{
	if(!isdefined(level.var_a16230c9))
	{
		level.var_a16230c9 = 0;
	}
	level.var_a16230c9 = !level.var_a16230c9;
	level thread function_37c6d7bb();
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(level.var_a16230c9)
		{
			players[i] AllowJump(1);
			continue;
		}
		players[i] AllowJump(0);
	}
}

/*
	Name: function_37c6d7bb
	Namespace: namespace_9f2849ef
	Checksum: 0x424F4353
	Offset: 0x7658
	Size: 0xAE
	Parameters: 0
	Flags: None
	Line Number: 2523
*/
function function_37c6d7bb()
{
	level notify("hash_1aa280e8");
	level endon("hash_1aa280e8");
	level waittill("hash_69f8eef");
	wait(0.1);
	level.var_a16230c9 = undefined;
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] AllowJump(1);
	}
}

