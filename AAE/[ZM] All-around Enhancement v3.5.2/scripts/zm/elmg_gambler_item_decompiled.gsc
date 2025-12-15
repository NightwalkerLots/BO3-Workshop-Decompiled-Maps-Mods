#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_clientdvar;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\bgbs\_zm_bgb_anywhere_but_here;
#include scripts\zm\bgbs\_zm_bgb_phoenix_up;
#include scripts\zm\bgbs\_zm_bgb_round_robbin;
#include scripts\zm\elmg_gambler;
#include scripts\zm\motherfucker;

#namespace namespace_8ba9a0c9;

/*
	Name: function_b7ca8f3c
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0xAB0
	Size: 0x568
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function function_b7ca8f3c()
{
	namespace_82ce4a91::function_c75d34c5(&function_879fce9b);
	namespace_82ce4a91::function_c75d34c5(&function_619d5432);
	namespace_82ce4a91::function_c75d34c5(&function_3b9ad9c9);
	namespace_82ce4a91::function_c75d34c5(&function_15985f60);
	namespace_82ce4a91::function_c75d34c5(&function_1fa9b83f);
	namespace_82ce4a91::function_c75d34c5(&function_f9a73dd6);
	namespace_82ce4a91::function_c75d34c5(&function_d3a4c36d);
	namespace_82ce4a91::function_c75d34c5(&function_ada24904);
	namespace_82ce4a91::function_c75d34c5(&function_b7b3a1e3);
	namespace_82ce4a91::function_c75d34c5(&function_91b1277a);
	namespace_82ce4a91::function_c75d34c5(&function_fd227e66);
	namespace_82ce4a91::function_c75d34c5(&function_2324f8cf);
	namespace_82ce4a91::function_c75d34c5(&function_b11d8994);
	namespace_82ce4a91::function_c75d34c5(&function_d72003fd);
	namespace_82ce4a91::function_c75d34c5(&function_651894c2);
	namespace_82ce4a91::function_c75d34c5(&function_8b1b0f2b);
	namespace_82ce4a91::function_c75d34c5(&function_19139ff0);
	namespace_82ce4a91::function_c75d34c5(&function_3f161a59);
	namespace_82ce4a91::function_c75d34c5(&function_2d3651ae);
	namespace_82ce4a91::function_c75d34c5(&function_5338cc17);
	namespace_82ce4a91::function_c75d34c5(&function_7d4de3bb);
	namespace_82ce4a91::function_c75d34c5(&function_574b6952);
	namespace_82ce4a91::function_c75d34c5(&function_3148eee9);
	namespace_82ce4a91::function_c75d34c5(&function_b467480);
	namespace_82ce4a91::function_c75d34c5(&function_1557cd5f);
	namespace_82ce4a91::function_c75d34c5(&function_ef5552f6);
	namespace_82ce4a91::function_c75d34c5(&function_c952d88d);
	namespace_82ce4a91::function_c75d34c5(&function_a3505e24);
	namespace_82ce4a91::function_c75d34c5(&function_ad61b703);
	namespace_82ce4a91::function_c75d34c5(&function_875f3c9a);
	namespace_82ce4a91::function_c75d34c5(&function_feb67d90);
	namespace_82ce4a91::function_c75d34c5(&function_24b8f7f9);
	namespace_82ce4a91::function_c75d34c5(&function_4abb7262);
	namespace_82ce4a91::function_c75d34c5(&function_70bdeccb);
	namespace_82ce4a91::function_c75d34c5(&function_96c06734);
	namespace_82ce4a91::function_c75d34c5(&function_bcc2e19d);
	namespace_82ce4a91::function_c75d34c5(&function_e2c55c06);
	namespace_82ce4a91::function_c75d34c5(&function_8c7d66f);
	namespace_82ce4a91::function_c75d34c5(&function_2eca50d8);
	namespace_82ce4a91::function_c75d34c5(&function_54cccb41);
	namespace_82ce4a91::function_c75d34c5(&function_b705649d);
	namespace_82ce4a91::function_c75d34c5(&function_9102ea34);
	namespace_82ce4a91::function_c75d34c5(&function_30a596f);
}

/*
	Name: function_879fce9b
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x1020
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function function_879fce9b()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_WIN", "GAMBLER_WIN");
	self playlocalsound("elmg_counter_uav_deactivate");
}

/*
	Name: function_619d5432
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x1078
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 110
*/
function function_619d5432()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_W500", "GAMBLER_W500");
	self zm_score::add_to_player_score(500);
	self playlocalsound("elmg_new_feature_unlocks");
}

/*
	Name: function_3b9ad9c9
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x10E8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 127
*/
function function_3b9ad9c9()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_W1000", "GAMBLER_W1000");
	self zm_score::add_to_player_score(1000);
	self playlocalsound("elmg_new_feature_unlocks");
}

/*
	Name: function_15985f60
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x1158
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 144
*/
function function_15985f60()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_W2000", "GAMBLER_W2000");
	self zm_score::add_to_player_score(2000);
	self playlocalsound("elmg_new_feature_unlocks");
}

/*
	Name: function_1fa9b83f
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x11C8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 161
*/
function function_1fa9b83f()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_L500", "GAMBLER_L500");
	self zm_score::minus_to_player_score(500);
	self playlocalsound("elmg_counter_uav_deactivate");
	return;
}

/*
	Name: function_f9a73dd6
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x1238
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 179
*/
function function_f9a73dd6()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_LOSTALL", "GAMBLER_LOSTALL", 1);
	foreach(player in level.activePlayers)
	{
		if(isdefined(player.var_def06a03) && player.var_def06a03 >= 50)
		{
			continue;
		}
		player zm_score::minus_to_player_score(player.score);
		player playlocalsound("elmg_disable_activeperk");
	}
	return;
}

/*
	Name: function_d3a4c36d
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x1350
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 204
*/
function function_d3a4c36d()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_LOSTMONEY", "GAMBLER_LOSTMONEY");
	if(isdefined(self.var_def06a03) && self.var_def06a03 >= 50)
	{
	}
	else
	{
		self zm_score::minus_to_player_score(self.score);
	}
	self playlocalsound("elmg_disable_activeperk");
}

/*
	Name: function_ada24904
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x13E8
	Size: 0x328
	Parameters: 0
	Flags: None
	Line Number: 227
*/
function function_ada24904()
{
	self playlocalsound("elmg_mp_vest_deployed_ui");
	foreach(weapon in self GetWeaponsList(1))
	{
		if(weapon.isRiotShield)
		{
			if(weapon == self GetCurrentWeapon())
			{
				self zm_equipment::take(weapon);
				self zm_weapons::weapon_give(weapon, 0, 0, 1, 0);
				self SwitchToWeaponImmediate(weapon);
			}
			else
			{
				self zm_equipment::take(weapon);
				self zm_weapons::weapon_give(weapon, 0, 0, 1, 0);
			}
			self namespace_82ce4a91::function_11bd1496(&"GAMBLER_SHIELD_FIX", "GAMBLER_SHIELD_FIX");
			return;
		}
	}
	var_db6c470 = getArrayKeys(level.zombie_equipment);
	for(i = 0; i < var_db6c470.size; i++)
	{
		if(var_db6c470[i].isRiotShield)
		{
			self zm_weapons::weapon_give(var_db6c470[i], 0, 0, 1, 0);
			self namespace_82ce4a91::function_11bd1496(&"GAMBLER_WIN_SHIELD", "GAMBLER_WIN_SHIELD");
			return;
		}
	}
	var_db6c470 = getArrayKeys(level.zombie_include_equipment);
	for(i = 0; i < var_db6c470.size; i++)
	{
		if(var_db6c470[i].isRiotShield)
		{
			self zm_weapons::weapon_give(var_db6c470[i], 0, 0, 1, 0);
			self namespace_82ce4a91::function_11bd1496(&"GAMBLER_WIN_SHIELD", "GAMBLER_WIN_SHIELD");
			return;
		}
	}
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_NO_SHIELD", "GAMBLER_NO_SHIELD");
	self zm_score::add_to_player_score(1000);
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_b7b3a1e3
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x1718
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 286
*/
function function_b7b3a1e3()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_AIRSTRIKE_CL", "GAMBLER_AIRSTRIKE_CL");
	self playlocalsound("elmg_mp_killstrk_talon");
	trace = beamtrace(self.origin, self.origin + VectorScale((0, 0, 1), 10000), 0, self, 1, 0);
	wait(3);
	self thread namespace_82ce4a91::doAirstrike(trace["position"]);
	return;
}

/*
	Name: function_91b1277a
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x17D8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 306
*/
function function_91b1277a()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_W20000", "GAMBLER_W20000");
	self zm_score::add_to_player_score(20000);
	self playlocalsound("elmg_mp_levelup_final_2");
}

/*
	Name: function_fd227e66
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x1848
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 323
*/
function function_fd227e66()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_LIVE_DIE", "GAMBLER_LIVE_DIE");
	self namespace_82ce4a91::function_1d75ae6c(5, "elmg_ui_mp_countdown");
	if(math::cointoss())
	{
		self namespace_82ce4a91::function_11bd1496(&"GAMBLER_LIVE", "GAMBLER_LIVE");
		self playlocalsound("elmg_mp_levelup_final");
	}
	else
	{
		self namespace_82ce4a91::function_11bd1496(&"GAMBLER_DIE", "GAMBLER_DIE");
		if(level.activePlayers.size == 1 && level flag::get("solo_game") && (isdefined(self.waiting_to_revive) && self.waiting_to_revive))
		{
			level notify("end_game");
		}
		else if(GetDvarInt("tfoption_gungame"))
		{
			self thread [[level.whoswho_laststand_func]]();
		}
		else
		{
			self function_a2d9c5b2(GetWeapon("launcher_standard_upgraded"), self.origin + (0, 0, 1), (0, 0, -1));
			wait(0.1);
			self DisableInvulnerability();
			self.lives = 0;
			self DoDamage(self.health + 1000, self.origin);
			self thread namespace_82ce4a91::function_cc5e608();
		}
	}
}

/*
	Name: function_2324f8cf
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x1A58
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 365
*/
function function_2324f8cf()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_HEIST", "GAMBLER_HEIST");
	self playlocalsound("elmg_flag_spawned");
	foreach(player in level.activePlayers)
	{
		if(self != player)
		{
			if(isdefined(player.var_def06a03) && player.var_def06a03 >= 50)
			{
				continue;
			}
			self zm_score::add_to_player_score(player.score);
			player zm_score::add_to_player_score(0 - player.score);
			player thread namespace_82ce4a91::function_a667729f("GAMBLER_HEIST", "gamblerabll", self.name);
			player playlocalsound("elmg_mp_last_stand");
		}
	}
}

/*
	Name: function_b11d8994
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x1BF8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 395
*/
function function_b11d8994()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_RESTART", "GAMBLER_RESTART");
	self playlocalsound("elmg_enable_activeperk");
	wait(1);
	self.var_888f3d5f++;
	trigger = GetEnt("elmg_gambler", "targetname");
	self thread namespace_82ce4a91::function_ce5b1a6f(trigger);
	self notify("hash_d72a893c");
}

/*
	Name: function_d72003fd
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x1CB8
	Size: 0x468
	Parameters: 0
	Flags: None
	Line Number: 416
*/
function function_d72003fd()
{
	playsoundatposition("elmg_mp_bonus_end", (0, 0, 0));
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_ALL_DIE", "GAMBLER_ALL_DIE", 1);
	wait(2);
	level namespace_82ce4a91::function_1d75ae6c(5, "elmg_ui_mp_countdown", 0);
	if(math::cointoss())
	{
		self namespace_82ce4a91::function_11bd1496(&"GAMBLER_SB_DIE", "GAMBLER_SB_DIE", 1);
		self playlocalsound("elmg_mp_bonus_end");
		self playsoundtoallbutplayer("mp_challengecomplete_metal", self);
		if(level.activePlayers.size == 1 && level flag::get("solo_game") && (isdefined(self.waiting_to_revive) && self.waiting_to_revive))
		{
			level notify("end_game");
		}
		else if(GetDvarInt("tfoption_gungame"))
		{
			self thread [[level.whoswho_laststand_func]]();
		}
		else
		{
			self function_a2d9c5b2(GetWeapon("launcher_standard_upgraded"), self.origin + (0, 0, 1), (0, 0, -1));
			wait(0.1);
			self DisableInvulnerability();
			self.lives = 0;
			self DoDamage(self.health + 1000, self.origin);
			self thread namespace_82ce4a91::function_cc5e608();
		}
	}
	else
	{
		self namespace_82ce4a91::function_11bd1496(&"GAMBLER_SB_LIVE", "GAMBLER_SB_LIVE", 1);
		self thread zm_utility::give_player_all_perks();
		self playsound("elmg_mp_defcon_one_1");
		foreach(player in level.activePlayers)
		{
			if(!(level.activePlayers.size == 1 && level flag::get("solo_game") && (isdefined(self.waiting_to_revive) && self.waiting_to_revive)) && self != player && player.sessionstate != "spectator")
			{
				if(GetDvarInt("tfoption_gungame"))
				{
					player thread [[level.whoswho_laststand_func]]();
					continue;
				}
				player function_a2d9c5b2(GetWeapon("launcher_standard_upgraded"), player.origin + (0, 0, 1), (0, 0, -1));
				wait(0.1);
				player DisableInvulnerability();
				player.lives = 0;
				player DoDamage(player.health + 1000, player.origin);
				player thread namespace_82ce4a91::function_cc5e608();
			}
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_651894c2
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x2128
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 482
*/
function function_651894c2()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_RICH", "GAMBLER_RICH");
	self playsound("elmg_new_feature_unlocks");
	foreach(player in level.activePlayers)
	{
		player zm_score::add_to_player_score(2000);
		if(self != player)
		{
			player thread namespace_82ce4a91::function_a667729f("GAMBLER_RICH", "gamblerabll", self.name);
		}
	}
}

/*
	Name: function_8b1b0f2b
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x2248
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 506
*/
function function_8b1b0f2b()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_AIRSTRIKE_ZM", "GAMBLER_AIRSTRIKE_ZM");
	self playlocalsound("elmg_mp_killstrk_reaper");
	self thread namespace_82ce4a91::function_a4124eb3();
}

/*
	Name: function_19139ff0
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x22B8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 523
*/
function function_19139ff0()
{
	self namespace_82ce4a91::function_11bd1496(&"MENU_DOUBLE_POINTS", "MENU_DOUBLE_POINTS");
	self thread zm_powerups::specific_powerup_drop("double_points", self.origin, undefined, undefined, undefined, undefined, undefined, 1);
}

/*
	Name: function_3f161a59
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x2320
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 539
*/
function function_3f161a59()
{
	self namespace_82ce4a91::function_11bd1496("^2Insta Kill!", "^2Insta Kill!");
	self thread zm_powerups::specific_powerup_drop("insta_kill", self.origin, undefined, undefined, undefined, undefined, undefined, 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2d3651ae
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x2388
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 557
*/
function function_2d3651ae()
{
	self namespace_82ce4a91::function_11bd1496(&"ZOMBIE_POWERUP_MAX_AMMO", "ZOMBIE_POWERUP_MAX_AMMO");
	self thread zm_powerups::specific_powerup_drop("full_ammo", self.origin, undefined, undefined, undefined, undefined, undefined, 1);
}

/*
	Name: function_5338cc17
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x23F0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 573
*/
function function_5338cc17()
{
	self namespace_82ce4a91::function_11bd1496(&"EM_BACK_LOOT_RETROATVI_KABOOM", "EM_BACK_LOOT_RETROATVI_KABOOM");
	self thread zm_powerups::specific_powerup_drop("nuke", self.origin, undefined, undefined, undefined, undefined, undefined, 1);
}

/*
	Name: function_7d4de3bb
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x2458
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 589
*/
function function_7d4de3bb()
{
	self namespace_82ce4a91::function_11bd1496(&"SCOREEVENT_JUGGER_NOG", "SCOREEVENT_JUGGER_NOG");
	self playlocalsound("mus_perks_jugganog_sting");
	if(self hasPerk("specialty_armorvest"))
	{
		self zm_score::add_to_player_score(2500);
	}
	else
	{
		self zm_perks::give_perk("specialty_armorvest", 1);
	}
}

/*
	Name: function_574b6952
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x2510
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 613
*/
function function_574b6952()
{
	self namespace_82ce4a91::function_11bd1496(&"SUBPERK_SPECIALTY_STAMINUP", "SUBPERK_SPECIALTY_STAMINUP");
	self playlocalsound("mus_perks_stamin_sting");
	if(self hasPerk("specialty_staminup"))
	{
		self zm_score::add_to_player_score(2000);
	}
	else
	{
		self zm_perks::give_perk("specialty_staminup", 1);
	}
}

/*
	Name: function_3148eee9
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x25C8
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 637
*/
function function_3148eee9()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_LOST_WP", "GAMBLER_LOST_WP");
	self playlocalsound("elmg_ammo_crate_use");
	foreach(weapon in self getweaponslistprimaries())
	{
		self TakeWeapon(weapon);
	}
	wait(0.05);
	self zm_weapons::give_build_kit_weapon(level.start_weapon);
	foreach(weapon in self getweaponslistprimaries())
	{
		self SetWeaponAmmoClip(weapon, 0);
		self SetWeaponAmmoStock(weapon, 0);
		self setSpawnWeapon(weapon);
	}
}

/*
	Name: function_b467480
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x27A8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 665
*/
function function_b467480()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_UNLIMIT", "GAMBLER_UNLIMIT");
	self playlocalsound("elmg_pickup_laptop_intelligence");
	self thread namespace_82ce4a91::function_36de84f4();
}

/*
	Name: function_1557cd5f
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x2818
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 682
*/
function function_1557cd5f()
{
	self namespace_82ce4a91::function_11bd1496("^5Argus!", "^5Argus!");
	self playlocalsound("elmg_ammo_crate_use");
	foreach(weapon in self getweaponslistprimaries())
	{
		self TakeWeapon(weapon);
	}
	wait(0.05);
	self zm_weapons::give_build_kit_weapon(GetWeapon("shotgun_precision"));
	foreach(weapon in self getweaponslistprimaries())
	{
		self setSpawnWeapon(weapon);
	}
}

/*
	Name: function_ef5552f6
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x29C8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 708
*/
function function_ef5552f6()
{
	self namespace_82ce4a91::function_11bd1496(&"ELMGT_GB_PW", "ELMGT_GB_PW");
	self playsoundtoplayer("zmb_bgb_eyecandy_" + RandomInt(4), self);
	self thread namespace_82ce4a91::function_9288c0b9();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c952d88d
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x2A48
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 727
*/
function function_c952d88d()
{
	self namespace_82ce4a91::function_11bd1496(&"ELMGT_GB_SKY", "ELMGT_GB_SKY");
	playsoundatposition("sping", self.origin);
	foreach(player in level.activePlayers)
	{
		player thread namespace_82ce4a91::function_4afce14a();
	}
}

/*
	Name: function_a3505e24
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x2B28
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 747
*/
function function_a3505e24()
{
	self namespace_82ce4a91::function_11bd1496(&"ELMGT_GB_NOAMMO", "ELMGT_GB_NOAMMO", 1);
	playsoundatposition("elmg_ammo_crate_use", self.origin);
	SetDvar("player_clipSizeMultiplier", 0.1);
	foreach(player in level.activePlayers)
	{
		player namespace_d87f1aa7::function_908a81cd("player_clipSizeMultiplierâ¦0.1");
		foreach(weapon in player getweaponslistprimaries())
		{
			player SetWeaponAmmoClip(weapon, 0);
			player SetWeaponAmmoClip(weapon, weapon.clipSize);
		}
	}
	level thread namespace_82ce4a91::function_8cf1101a();
}

/*
	Name: function_ad61b703
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x2D08
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 774
*/
function function_ad61b703()
{
	if(namespace_93b7f03::validation())
	{
		self namespace_82ce4a91::function_11bd1496(&"ZMUI_BGB_ANYWHERE_BUT_HERE", "ZMUI_BGB_ANYWHERE_BUT_HERE", 1);
		foreach(player in level.activePlayers)
		{
			player thread namespace_93b7f03::activation();
		}
	}
	else
	{
		self namespace_82ce4a91::function_11bd1496(&"GAMBLER_WIN", "GAMBLER_WIN");
		self playlocalsound("elmg_counter_uav_deactivate");
	}
}

/*
	Name: function_875f3c9a
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x2E20
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 801
*/
function function_875f3c9a()
{
	self namespace_82ce4a91::function_11bd1496(&"ZMUI_BGB_PROFIT_SHARING", "ZMUI_BGB_PROFIT_SHARING");
	var_166fdaa9 = 0;
	foreach(player in level.activePlayers)
	{
		var_166fdaa9 = var_166fdaa9 + player.score;
	}
	var_166fdaa9 = var_166fdaa9 / level.activePlayers.size;
	var_166fdaa9 = var_166fdaa9 / 10;
	var_166fdaa9 = Int(var_166fdaa9);
	var_166fdaa9 = var_166fdaa9 * 10;
	foreach(player in level.activePlayers)
	{
		player.score = var_166fdaa9;
		player playlocalsound("elmg_new_feature_unlocks");
	}
}

/*
	Name: function_feb67d90
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x2FD8
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 830
*/
function function_feb67d90()
{
	self namespace_82ce4a91::function_11bd1496(&"ELMGT_GB_DWARF", "ELMGT_GB_DWARF", 1);
	foreach(player in level.activePlayers)
	{
		player namespace_d87f1aa7::function_908a81cd("player_standingViewHeightâ¦41");
		player playlocalsound("zmb_vocals_zombie_death_whimsy");
	}
	level thread namespace_82ce4a91::function_266595c9();
}

/*
	Name: function_24b8f7f9
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x30D0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 851
*/
function function_24b8f7f9()
{
	self namespace_82ce4a91::function_11bd1496(&"ELMGT_GB_LEAK", "ELMGT_GB_LEAK");
	self playlocalsound("elmg_counter_uav_deactivate");
	self.score = self.score + 10000;
	self thread namespace_82ce4a91::function_487b8d0b();
}

/*
	Name: function_4abb7262
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x3150
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 869
*/
function function_4abb7262()
{
	self namespace_82ce4a91::function_11bd1496(&"ELMGT_GB_INFAMMO", "ELMGT_GB_INFAMMO", 1);
	playsoundatposition("elmg_new_feature_unlocks", self.origin);
	SetDvar("player_sustainAmmo", 1);
	foreach(player in level.activePlayers)
	{
		player namespace_d87f1aa7::function_908a81cd("player_sustainAmmoâ¦1");
	}
	level thread namespace_82ce4a91::function_e6981698();
}

/*
	Name: function_70bdeccb
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x3268
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 891
*/
function function_70bdeccb()
{
	if(self hasPerk("specialty_additionalprimaryweapon"))
	{
		if(self getweaponslistprimaries().size >= 3)
		{
			self TakeWeapon(self getweaponslistprimaries()[2]);
		}
	}
	else if(self getweaponslistprimaries().size >= 2)
	{
		self TakeWeapon(self getweaponslistprimaries()[1]);
	}
	wait(0.05);
	var_6e2e3927 = namespace_82ce4a91::function_3002607b();
	var_6e2e3927 = self zm_weapons::give_build_kit_weapon(var_6e2e3927);
	self function_92dca8b7(var_6e2e3927, 0);
	self SwitchToWeaponImmediate(var_6e2e3927);
	self namespace_82ce4a91::function_11bd1496(MakeLocalizedString(var_6e2e3927.displayName), var_6e2e3927.displayName);
	self playlocalsound("elmg_mp_levelup_final_2");
}

/*
	Name: function_96c06734
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x3410
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 923
*/
function function_96c06734()
{
	self namespace_82ce4a91::function_11bd1496("^5Smart Core Online", "^5Smart Core Online");
	self playlocalsound("elmg_mp_killstrk_advuav");
	self thread namespace_82ce4a91::function_5471f2a();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_bcc2e19d
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x3480
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 942
*/
function function_bcc2e19d()
{
	if(isdefined(self.perks_active) && self.perks_active.size > 0)
	{
		PERKS = Array::randomize(self.perks_active);
		self notify(PERKS[0] + "_stop");
		self playlocalsound("elmg_mp_last_stand");
		var_b6625767 = tableLookup("gamedata/tables/common/aae_scoreevents.csv", 0, PERKS[0], 0);
		if(var_b6625767 === PERKS[0])
		{
			self namespace_82ce4a91::function_11bd1496("^1You lost ^7 " + MakeLocalizedString("SUBPERK_" + toupper(PERKS[0])), "^1You lost ^7 " + MakeLocalizedString("SUBPERK_" + toupper(PERKS[0])));
		}
		else
		{
			self namespace_82ce4a91::function_11bd1496("^1You lost a perk", "^1You lost a perk");
		}
	}
	else
	{
		self namespace_82ce4a91::function_11bd1496(&"GAMBLER_WIN", "GAMBLER_WIN");
		self playlocalsound("elmg_counter_uav_deactivate");
	}
}

/*
	Name: function_e2c55c06
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x3640
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 976
*/
function function_e2c55c06()
{
	self namespace_82ce4a91::function_11bd1496(&"ZMUI_BGB_ON_THE_HOUSE", "ZMUI_BGB_ON_THE_HOUSE");
	self thread zm_powerups::specific_powerup_drop("free_perk", self.origin, undefined, undefined, undefined, undefined, undefined, 1);
}

/*
	Name: function_8c7d66f
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x36A8
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 992
*/
function function_8c7d66f()
{
	self namespace_82ce4a91::function_11bd1496("^5Score Chaos", "^5Score Chaos");
	playsoundatposition("elmg_new_feature_unlocks", (0, 0, 0));
	var_7e8c7f6e = [];
	players = level.activePlayers;
	for(i = 0; i < players.size; i++)
	{
		var_7e8c7f6e[i] = players[i].score;
	}
	var_7e8c7f6e = Array::randomize(var_7e8c7f6e);
	foreach(player in level.activePlayers)
	{
		player.score = var_7e8c7f6e[player GetEntityNumber()];
	}
}

/*
	Name: function_2eca50d8
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x3820
	Size: 0x300
	Parameters: 0
	Flags: None
	Line Number: 1019
*/
function function_2eca50d8()
{
	self namespace_82ce4a91::function_11bd1496(&"SCOREEVENT_PACK_A_PUNCH", "SCOREEVENT_PACK_A_PUNCH");
	self playlocalsound("zmb_bgb_disorderly_weap_switch");
	weapon = self GetCurrentWeapon();
	if(zm_utility::is_player_valid(self) && !self.IS_DRINKING > 0 && !zm_utility::is_placeable_mine(weapon) && !zm_equipment::is_equipment(weapon) && (!self zm_utility::is_player_revive_tool(weapon) || weapon.name != "syrette_quick") && !weapon.isHeroWeapon && !weapon.isgadget && self zm_weapons::can_upgrade_weapon(weapon))
	{
		self TakeWeapon(weapon);
		var_4b94f3c1 = zm_weapons::get_upgrade_weapon(weapon);
		var_220646a4 = self zm_weapons::give_build_kit_weapon(var_4b94f3c1);
		self function_92dca8b7(var_220646a4, 0);
		self SwitchToWeaponImmediate(var_220646a4);
	}
	else
	{
		foreach(guns in self getweaponslistprimaries())
		{
			if(self zm_weapons::can_upgrade_weapon(guns))
			{
				self TakeWeapon(guns);
				var_4b94f3c1 = zm_weapons::get_upgrade_weapon(guns);
				var_220646a4 = self zm_weapons::give_build_kit_weapon(var_4b94f3c1);
				self function_92dca8b7(var_220646a4, 0);
				self SwitchToWeaponImmediate(var_220646a4);
				continue;
			}
		}
	}
}

/*
	Name: function_54cccb41
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x3B28
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1059
*/
function function_54cccb41()
{
	if(!isdefined(self.var_49afbfe1) && !isdefined(self.var_5af67acf) && level.activePlayers.size > 1)
	{
		self namespace_82ce4a91::function_11bd1496("^5Human Tower 1min", "^5Human Tower 1min", 1);
		self thread namespace_82ce4a91::function_fef85813();
	}
	else
	{
		self namespace_82ce4a91::function_11bd1496(&"GAMBLER_WIN", "GAMBLER_WIN");
		self playlocalsound("elmg_counter_uav_deactivate");
	}
}

/*
	Name: function_b705649d
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x3BF0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1083
*/
function function_b705649d()
{
	if(namespace_98efd7b6::validation())
	{
		self namespace_82ce4a91::function_11bd1496(&"ZMUI_BGB_ROUND_ROBBIN", "ZMUI_BGB_ROUND_ROBBIN", 1);
		namespace_98efd7b6::activation();
	}
	else
	{
		self namespace_82ce4a91::function_11bd1496(&"GAMBLER_WIN", "GAMBLER_WIN");
		self playlocalsound("elmg_counter_uav_deactivate");
	}
}

/*
	Name: function_9102ea34
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x3C90
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1107
*/
function function_9102ea34()
{
	if(self namespace_7ffac71e::validation())
	{
		self namespace_82ce4a91::function_11bd1496(&"ZMUI_BGB_PHOENIX_UP", "ZMUI_BGB_PHOENIX_UP", 1);
		self namespace_7ffac71e::activation();
	}
	else
	{
		self namespace_82ce4a91::function_11bd1496(&"GAMBLER_WIN", "GAMBLER_WIN");
		self playlocalsound("elmg_counter_uav_deactivate");
	}
}

/*
	Name: function_30a596f
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x3D40
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 1131
*/
function function_30a596f()
{
	if(level.activePlayers.size > 1)
	{
		target_player = self namespace_82ce4a91::function_6aff0624();
		if(isdefined(target_player) && target_player != self)
		{
			self namespace_82ce4a91::function_11bd1496(&"^3Teleport to a random teammate", "^3Teleport to a random teammate");
		}
		else
		{
			self namespace_82ce4a91::function_11bd1496(&"GAMBLER_WIN", "GAMBLER_WIN");
			self playlocalsound("elmg_counter_uav_deactivate");
		}
	}
	else
	{
		self namespace_82ce4a91::function_11bd1496(&"GAMBLER_WIN", "GAMBLER_WIN");
		self playlocalsound("elmg_counter_uav_deactivate");
	}
}

/*
	Name: function_f872e06c
	Namespace: namespace_8ba9a0c9
	Checksum: 0x424F4353
	Offset: 0x3E50
	Size: 0x4C
	Parameters: 0
	Flags: None
	Line Number: 1163
*/
function function_f872e06c()
{
	self namespace_82ce4a91::function_11bd1496(&"GAMBLER_WIN", "GAMBLER_WIN");
	self playlocalsound("elmg_counter_uav_deactivate");
}

