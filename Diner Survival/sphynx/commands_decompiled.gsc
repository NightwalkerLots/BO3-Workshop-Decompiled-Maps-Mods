#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_dogs;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_behavior;
#include scripts\zm\_zm_behavior_utility;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_puppet;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_cymbal_monkey;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_25ddfc86;

/*
	Name: init
	Namespace: namespace_25ddfc86
	Checksum: 0xED45E1D
	Offset: 0xB10
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function init()
{
	level waittill("hash_f938585a");
	wait(3);
	if(isdefined(level.var_a1c63168) && level.var_a1c63168)
	{
		thread function_74af0ad3();
		thread function_9acd5a5d();
		thread function_13cd0428();
		thread function_e3a1b2da();
		thread give_loadout();
		thread give_weapons();
		thread give_points();
		thread function_7daa1ff7();
		thread function_9ef99ee0();
		thread function_f7df6174();
		thread function_61186e9e();
		thread function_c65e7550();
		thread function_2091eb7e();
	}
}

/*
	Name: function_74af0ad3
	Namespace: namespace_25ddfc86
	Checksum: 0x7E0D0B3F
	Offset: 0xC20
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function function_74af0ad3()
{
	amount = 0;
	while(1)
	{
		if(GetDvarInt("spawn_dog") != amount)
		{
			IPrintLnBold("Spawned " + GetDvarInt("spawn_dog") + " dogs with dvar!");
			zm_ai_dogs::special_dog_spawn(GetDvarInt("spawn_dog"));
			SetDvar("spawn_dog", 0);
		}
		wait(0.05);
	}
}

/*
	Name: function_9acd5a5d
	Namespace: namespace_25ddfc86
	Checksum: 0x24A6D91
	Offset: 0xCE8
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 112
*/
function function_9acd5a5d()
{
	amount = 0;
	while(1)
	{
		if(GetDvarInt("spawn_zombie") != amount)
		{
			IPrintLnBold("Spawned " + GetDvarInt("spawn_zombie") + " zombies with dvar!");
			spawner = Array::random(level.zombie_spawners);
			for(spawned = 0; GetDvarInt("spawn_zombie") > spawned; spawned++)
			{
				spots = GetEntArray("zombie_dog_spawner", "script_noteworthy");
				ai = zombie_utility::spawn_zombie(spawner, spawner.targetname, Array::random(spots));
				ai zm_spawner::zombie_spawn_init(undefined);
				ai.gibbed = 1;
				ai.in_the_ground = 1;
				ai.var_12544dfb = 1;
				ai.script_string = "find_flesh";
				wait(0.2);
			}
			SetDvar("spawn_zombie", 0);
		}
		wait(0.05);
	}
}

/*
	Name: give_loadout
	Namespace: namespace_25ddfc86
	Checksum: 0x5FB9AD63
	Offset: 0xED8
	Size: 0xAE0
	Parameters: 0
	Flags: None
	Line Number: 148
*/
function give_loadout()
{
	activated = "";
	while(1)
	{
		if(GetDvarString("loadout") != "")
		{
			string = GetDvarString("loadout");
			var_cde9f622 = StrTok(string, " ");
			index = Int(var_cde9f622[1]);
			playerName = ToLower(var_cde9f622[0]);
			players = GetPlayers();
			foreach(player in players)
			{
				if(ToLower(player.name) == playerName)
				{
					switch(index)
					{
						case 1:
						{
							player TakeWeapon(player GetStowedWeapon());
							player TakeWeapon(player GetCurrentWeapon());
							player zm_weapons::weapon_give(GetWeapon("s2_emp44_up"), 0, 0, 1, 1);
							player zm_weapons::weapon_give(GetWeapon("s2_fg42_up"), 0, 0, 1, 1);
							player thread _zm_weap_cymbal_monkey::player_give_cymbal_monkey();
							break;
						}
						case 2:
						{
							player TakeWeapon(player GetStowedWeapon());
							player TakeWeapon(player GetCurrentWeapon());
							player zm_weapons::weapon_give(GetWeapon("s2_kar98k_irons_up"), 0, 0, 1, 1);
							player zm_weapons::weapon_give(GetWeapon("s2_lewis_up"), 0, 0, 1, 1);
							player thread _zm_weap_cymbal_monkey::player_give_cymbal_monkey();
							break;
						}
						case 3:
						{
							player TakeWeapon(player GetStowedWeapon());
							player TakeWeapon(player GetCurrentWeapon());
							player zm_weapons::weapon_give(GetWeapon("s2_m1919_up"), 0, 0, 1, 1);
							player zm_weapons::weapon_give(GetWeapon("s2_m1928_up"), 0, 0, 1, 1);
							player thread _zm_weap_cymbal_monkey::player_give_cymbal_monkey();
							break;
						}
						case 4:
						{
							player TakeWeapon(player GetStowedWeapon());
							player TakeWeapon(player GetCurrentWeapon());
							player zm_weapons::weapon_give(GetWeapon("s2_m1941_up"), 0, 0, 1, 1);
							player zm_weapons::weapon_give(GetWeapon("s2_mas36_up"), 0, 0, 1, 1);
							player thread _zm_weap_cymbal_monkey::player_give_cymbal_monkey();
							break;
						}
					}
				}
				if(ToLower(playerName) == "all")
				{
					foreach(player in players)
					{
						switch(index)
						{
							case 1:
							{
								player TakeWeapon(player GetStowedWeapon());
								player TakeWeapon(player GetCurrentWeapon());
								player zm_weapons::weapon_give(GetWeapon("s2_emp44_up"), 0, 0, 1, 1);
								player zm_weapons::weapon_give(GetWeapon("s2_fg42_up"), 0, 0, 1, 1);
								player thread _zm_weap_cymbal_monkey::player_give_cymbal_monkey();
								break;
							}
							case 2:
							{
								player TakeWeapon(player GetStowedWeapon());
								player TakeWeapon(player GetCurrentWeapon());
								player zm_weapons::weapon_give(GetWeapon("s2_kar98k_irons_up"), 0, 0, 1, 1);
								player zm_weapons::weapon_give(GetWeapon("s2_lewis_up"), 0, 0, 1, 1);
								player thread _zm_weap_cymbal_monkey::player_give_cymbal_monkey();
								break;
							}
							case 3:
							{
								player TakeWeapon(player GetStowedWeapon());
								player TakeWeapon(player GetCurrentWeapon());
								player zm_weapons::weapon_give(GetWeapon("s2_m1919_up"), 0, 0, 1, 1);
								player zm_weapons::weapon_give(GetWeapon("s2_m1928_up"), 0, 0, 1, 1);
								player thread _zm_weap_cymbal_monkey::player_give_cymbal_monkey();
								break;
							}
							case 4:
							{
								player TakeWeapon(player GetStowedWeapon());
								player TakeWeapon(player GetCurrentWeapon());
								player zm_weapons::weapon_give(GetWeapon("s2_m1941_up"), 0, 0, 1, 1);
								player zm_weapons::weapon_give(GetWeapon("s2_mas36_up"), 0, 0, 1, 1);
								player thread _zm_weap_cymbal_monkey::player_give_cymbal_monkey();
								break;
							}
						}
					}
				}
				IPrintLnBold("Gave " + playerName + " Loadout: " + index + " with dvar!");
			}
			SetDvar("loadout", "");
		}
		wait(0.05);
	}
}

/*
	Name: give_weapons
	Namespace: namespace_25ddfc86
	Checksum: 0x97855973
	Offset: 0x19C0
	Size: 0x248
	Parameters: 0
	Flags: None
	Line Number: 267
*/
function give_weapons()
{
	activated = "";
	while(1)
	{
		if(GetDvarString("give") != "")
		{
			string = GetDvarString("give");
			weaponName = ToLower(string);
			IPrintLnBold("Gave weapon: " + weaponName + " with dvar!");
			players = GetPlayers();
			foreach(player in players)
			{
				switch(weaponName)
				{
					case "shield":
					{
						player zm_weapons::weapon_give(GetWeapon("zod_riotshield"), 0, 0, 1, 1);
						break;
					}
					case "monkeys":
					{
						player zm_weapons::weapon_give(GetWeapon("cymbal_monkey"), 0, 0, 1, 1);
						break;
					}
					default
					{
						player zm_weapons::weapon_give(GetWeapon(weaponName), 0, 0, 1, 1);
						break;
					}
				}
			}
			SetDvar("give", "");
		}
		wait(0.05);
	}
}

/*
	Name: function_13cd0428
	Namespace: namespace_25ddfc86
	Checksum: 0x3E4EB6AF
	Offset: 0x1C10
	Size: 0x608
	Parameters: 0
	Flags: None
	Line Number: 315
*/
function function_13cd0428()
{
	activated = "";
	while(1)
	{
		if(GetDvarString("give_perks") != "")
		{
			string = GetDvarString("give_perks");
			var_cde9f622 = StrTok(string, " ");
			index = ToLower(var_cde9f622[1]);
			playerName = ToLower(var_cde9f622[0]);
			players = GetPlayers();
			foreach(player in players)
			{
				if(ToLower(player.name) == playerName)
				{
					switch(index)
					{
						case "quickrevive":
						{
							player zm_perks::give_perk("specialty_quickrevive", 0);
							break;
						}
						case "juggernog":
						{
							player zm_perks::give_perk("specialty_armorvest", 0);
							break;
						}
						case "speedcola":
						{
							player zm_perks::give_perk("specialty_fastreload", 0);
							break;
						}
						case "doubletap":
						{
							player zm_perks::give_perk("specialty_doubletap2", 0);
							break;
						}
						case "electric":
						{
							player zm_perks::give_perk("specialty_electriccherry", 0);
							break;
						}
						case "mulekick":
						{
							player zm_perks::give_perk("specialty_additionalprimaryweapon", 0);
							break;
						}
						case "staminup":
						{
							player zm_perks::give_perk("specialty_staminup", 0);
							break;
						}
						case "widowswine":
						{
							player zm_perks::give_perk("specialty_widowswine", 0);
							break;
							break;
						}
						case "bananacolada":
						{
							break;
						}
						case "bullice":
						{
							break;
						}
						case "crusaderale":
						{
							break;
						}
						case "moonshine":
						{
							break;
						}
						case "phd":
						{
							break;
						}
						case "sodalicious":
						{
							break;
						}
						case "dyingwish":
						{
							break;
						}
						case "victorious":
						{
						}
						case "all":
						{
							thread function_7dec9f20(playerName);
							break;
						}
					}
				}
			}
			if(ToLower(playerName) == "all")
			{
				foreach(player in players)
				{
					switch(ToLower(index))
					{
						case "quickrevive":
						{
							player zm_perks::give_perk("specialty_quickrevive", 0);
							break;
						}
						case "juggernog":
						{
							player zm_perks::give_perk("specialty_armorvest", 0);
							break;
						}
						case "speedcola":
						{
							player zm_perks::give_perk("specialty_fastreload", 0);
							break;
						}
						case "doubletap":
						{
							player zm_perks::give_perk("specialty_doubletap2", 0);
							break;
						}
						case "electric":
						{
							player zm_perks::give_perk("specialty_electriccherry", 0);
							break;
						}
						case "mulekick":
						{
							player zm_perks::give_perk("specialty_additionalprimaryweapon", 0);
							break;
						}
						case "staminup":
						{
							player zm_perks::give_perk("specialty_staminup", 0);
							break;
						}
						case "widowswine":
						{
							player zm_perks::give_perk("specialty_widowswine", 0);
							break;
							break;
						}
						case "bananacolada":
						{
							break;
						}
						case "bullice":
						{
							break;
						}
						case "crusaderale":
						{
							break;
						}
						case "moonshine":
						{
							break;
						}
						case "phd":
						{
							break;
						}
						case "sodalicious":
						{
							break;
						}
						case "dyingwish":
						{
							break;
						}
						case "victorious":
						{
						}
						case "all":
						{
							thread function_7dec9f20(1);
							break;
						}
					}
				}
			}
			SetDvar("give_perks", "");
		}
		wait(0.05);
	}
}

/*
	Name: function_e3a1b2da
	Namespace: namespace_25ddfc86
	Checksum: 0x9BD914C5
	Offset: 0x2220
	Size: 0x378
	Parameters: 0
	Flags: None
	Line Number: 515
*/
function function_e3a1b2da()
{
	activated = "";
	while(1)
	{
		if(GetDvarString("take_perks") != "")
		{
			string = GetDvarString("take_perks");
			playerName = ToLower(string);
			players = GetPlayers();
			foreach(player in players)
			{
				if(ToLower(player.name) == playerName)
				{
					PERKS = player GetPerks();
					foreach(perk in PERKS)
					{
						player zm_perks::lose_random_perk();
					}
					IPrintLnBold("Took all perks from " + playerName + " with dvar!");
				}
			}
			if(ToLower(playerName) == "all")
			{
				foreach(player in players)
				{
					PERKS = player GetPerks();
					foreach(perk in PERKS)
					{
						player zm_perks::lose_random_perk();
					}
				}
				IPrintLnBold("Took all perks from all players with dvar!");
			}
			SetDvar("take_perks", "");
		}
		wait(0.05);
	}
}

/*
	Name: give_points
	Namespace: namespace_25ddfc86
	Checksum: 0x7EDEB63A
	Offset: 0x25A0
	Size: 0x338
	Parameters: 0
	Flags: None
	Line Number: 565
*/
function give_points()
{
	activated = "";
	while(1)
	{
		if(GetDvarString("points") != "")
		{
			string = GetDvarString("points");
			var_cde9f622 = StrTok(string, " ");
			index = Int(var_cde9f622[1]);
			playerName = ToLower(var_cde9f622[0]);
			players = GetPlayers();
			foreach(player in players)
			{
				if(ToLower(player.name) == playerName)
				{
					player zm_score::add_to_player_score(index);
					zm_utility::play_sound_at_pos("purchase", player.origin);
					IPrintLnBold("Gave player " + playerName + " " + index + " points with dvar!");
				}
			}
			if(ToLower(playerName) == "all")
			{
				foreach(player in players)
				{
					player zm_score::add_to_player_score(index);
					zm_utility::play_sound_at_pos("purchase", player.origin);
					IPrintLnBold("Gave all players " + index + " points with dvar!");
				}
			}
			SetDvar("points", "");
		}
		wait(0.05);
	}
}

/*
	Name: function_7daa1ff7
	Namespace: namespace_25ddfc86
	Checksum: 0xA3F03A4C
	Offset: 0x28E0
	Size: 0xDA8
	Parameters: 0
	Flags: None
	Line Number: 611
*/
function function_7daa1ff7()
{
	activated = "";
	while(1)
	{
		if(GetDvarString("powerup") != "")
		{
			string = GetDvarString("powerup");
			var_cde9f622 = StrTok(string, " ");
			index = ToLower(var_cde9f622[1]);
			playerName = ToLower(var_cde9f622[0]);
			players = GetPlayers();
			foreach(player in players)
			{
				if(ToLower(player.name) == playerName)
				{
					switch(ToLower(index))
					{
						case "instakill":
						{
							level thread zm_powerups::specific_powerup_drop("insta_kill", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "maxammo":
						{
							level thread zm_powerups::specific_powerup_drop("full_ammo", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "doublepoints":
						{
							level thread zm_powerups::specific_powerup_drop("double_points", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "firesale":
						{
							level thread zm_powerups::specific_powerup_drop("fire_sale", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "nuke":
						{
							level thread zm_powerups::specific_powerup_drop("nuke", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "minigun":
						{
							level thread zm_powerups::specific_powerup_drop("minigun", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "carpenter":
						{
							level thread zm_powerups::specific_powerup_drop("carpenter", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "freeperk":
						{
							level thread zm_powerups::specific_powerup_drop("free_perk", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "wwgrenade":
						{
							level thread zm_powerups::specific_powerup_drop("ww_grenade", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "scrap":
						{
							level thread zm_powerups::specific_powerup_drop("scrap", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "all":
						{
							level thread zm_powerups::specific_powerup_drop("insta_kill", player.origin + VectorScale((1, 0, 0), 150), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("full_ammo", player.origin + (67, 92, 0), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("double_points", player.origin + VectorScale((0, 1, 0), 150), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("fire_sale", player.origin + (-67, 92, 0), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("nuke", player.origin + VectorScale((-1, 0, 0), 150), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("minigun", player.origin + (-67, -92, 0), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("carpenter", player.origin + VectorScale((0, -1, 0), 150), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("free_perk", player.origin + (67, -92, 0), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("bottomless_clip", player.origin + (87, -70, 0), undefined, undefined, undefined, undefined, 0);
							break;
						}
					}
				}
				IPrintLnBold("Spawned " + GetDvarString("powerup") + " powerup with dvar! ");
			}
			if(ToLower(playerName) == "all")
			{
				foreach(player in players)
				{
					switch(ToLower(index))
					{
						case "instakill":
						{
							IPrintLnBold("Spawn instakill");
							level thread zm_powerups::specific_powerup_drop("insta_kill", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "maxammo":
						{
							level thread zm_powerups::specific_powerup_drop("full_ammo", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "doublepoints":
						{
							level thread zm_powerups::specific_powerup_drop("double_points", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "firesale":
						{
							level thread zm_powerups::specific_powerup_drop("fire_sale", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "nuke":
						{
							level thread zm_powerups::specific_powerup_drop("nuke", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "minigun":
						{
							level thread zm_powerups::specific_powerup_drop("minigun", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "carpenter":
						{
							level thread zm_powerups::specific_powerup_drop("carpenter", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "freeperk":
						{
							level thread zm_powerups::specific_powerup_drop("free_perk", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "wwgrenade":
						{
							level thread zm_powerups::specific_powerup_drop("ww_grenade", player.origin + VectorScale((-1, 0, 0), 80), undefined, undefined, undefined, undefined, 0);
							break;
						}
						case "all":
						{
							level thread zm_powerups::specific_powerup_drop("insta_kill", player.origin + VectorScale((1, 0, 0), 150), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("full_ammo", player.origin + (67, 92, 0), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("double_points", player.origin + VectorScale((0, 1, 0), 150), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("fire_sale", player.origin + (-67, 92, 0), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("nuke", player.origin + VectorScale((-1, 0, 0), 150), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("minigun", player.origin + (-67, -92, 0), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("carpenter", player.origin + VectorScale((0, -1, 0), 150), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("free_perk", player.origin + (67, -92, 0), undefined, undefined, undefined, undefined, 0);
							level thread zm_powerups::specific_powerup_drop("bottomless_clip", player.origin + (87, -70, 0), undefined, undefined, undefined, undefined, 0);
							break;
						}
					}
				}
			}
			SetDvar("powerup", "");
		}
		wait(0.05);
	}
}

/*
	Name: function_9ef99ee0
	Namespace: namespace_25ddfc86
	Checksum: 0x50D616E1
	Offset: 0x3690
	Size: 0x340
	Parameters: 0
	Flags: None
	Line Number: 780
*/
function function_9ef99ee0()
{
	activated = "";
	while(1)
	{
		if(GetDvarString("camo") != "")
		{
			string = GetDvarString("camo");
			var_cde9f622 = StrTok(string, " ");
			index = Int(var_cde9f622[1]);
			playerName = ToLower(var_cde9f622[0]);
			players = GetPlayers();
			foreach(player in players)
			{
				if(ToLower(player.name) == playerName)
				{
					player function_c8540b60(player GetCurrentWeapon(), player CalcWeaponOptions(index, 0, 0));
					IPrintLnBold("Added new Camo " + index + " to player: " + playerName);
				}
			}
			if(ToLower(playerName) == "all")
			{
				foreach(player in players)
				{
					player function_c8540b60(player GetCurrentWeapon(), player CalcWeaponOptions(index, 0, 0));
					IPrintLnBold("Added new Camo " + index + " to all players");
				}
			}
			SetDvar("camo", "");
		}
		wait(0.05);
	}
}

/*
	Name: function_f7df6174
	Namespace: namespace_25ddfc86
	Checksum: 0x11CA6B88
	Offset: 0x39D8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 824
*/
function function_f7df6174()
{
	amount = 0;
	while(1)
	{
		if(GetDvarInt("change_round") != amount)
		{
			if(isdefined("between_round_over"))
			{
				wait(0.05);
			}
			thread function_8824774d(GetDvarInt("change_round"));
			IPrintLnBold("Set round to: " + GetDvarInt("change_round"));
			SetDvar("change_round", 0);
		}
		wait(0.05);
	}
}

/*
	Name: function_ce854bf2
	Namespace: namespace_25ddfc86
	Checksum: 0x779FE366
	Offset: 0x3AB0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 853
*/
function function_ce854bf2()
{
	activated = 0;
	while(1)
	{
		if(GetDvarInt("complete_ee_step") != activated)
		{
			level notify("hash_1b781166");
			IPrintLnBold("Complete EE Step with dvar!");
			SetDvar("complete_ee_step", 0);
		}
		wait(0.05);
	}
}

/*
	Name: function_61186e9e
	Namespace: namespace_25ddfc86
	Checksum: 0xC313B4C
	Offset: 0x3B40
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 878
*/
function function_61186e9e()
{
	activated = "";
	while(1)
	{
		if(GetDvarString("power") != "")
		{
			string = GetDvarString("power");
			power_state = ToLower(string);
			if(ToLower(power_state) == "on")
			{
				level flag::clear("power_off");
				level flag::set("power_on");
				level clientfield::set("zombie_power_on", 0);
				continue;
			}
			level flag::clear("power_on");
			level flag::set("power_off");
			level clientfield::set("zombie_power_off", 0);
			level notify("power_off");
			IPrintLnBold("Turned power " + power_state + " with dvar!");
			SetDvar("power", "");
		}
		wait(0.05);
	}
}

/*
	Name: function_c65e7550
	Namespace: namespace_25ddfc86
	Checksum: 0x81285986
	Offset: 0x3D18
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 915
*/
function function_c65e7550()
{
	activated = 0;
	while(1)
	{
		if(GetDvarInt("difficulty") != activated)
		{
			var_b98e93fb = GetDvarInt("difficulty");
			IPrintLnBold("Set difficulty to " + var_b98e93fb + " with dvar!");
			switch(var_b98e93fb)
			{
				case 1:
				{
					thread function_22ac2766(1, 24, 8, 8, 2);
					foreach(player in GetPlayers())
					{
						player thread LUI::screen_flash(1, 1, 1, 1, "white");
					}
					thread function_8824774d(level.round_number);
					break;
				}
				case 2:
				{
					thread function_22ac2766(5, 48, 500, 16, 20, 3);
					foreach(player in GetPlayers())
					{
						player thread LUI::screen_flash(1, 1, 1, 1, "white");
					}
					thread function_8824774d(level.round_number);
					break;
				}
				case 3:
				{
					thread function_22ac2766(50, 64, 2500, 16, 20, 4);
					foreach(player in GetPlayers())
					{
						player thread LUI::screen_flash(1, 1, 1, 1, "white");
					}
					thread function_8824774d(level.round_number);
					break;
				}
			}
			SetDvar("difficulty", 0);
		}
		wait(0.05);
	}
}

/*
	Name: function_2091eb7e
	Namespace: namespace_25ddfc86
	Checksum: 0xD40F5457
	Offset: 0x40B8
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 973
*/
function function_2091eb7e()
{
	activated = 0;
	while(1)
	{
		if(GetDvarInt("lighting") != activated)
		{
			var_3ba1a11c = GetDvarInt("lighting");
			IPrintLnBold("Set Lightingstate to " + var_3ba1a11c + " with dvar!");
			switch(var_3ba1a11c)
			{
				case 1:
				{
					level util::set_lighting_state(0);
					break;
				}
				case 2:
				{
					level util::set_lighting_state(1);
					break;
				}
				case 3:
				{
					level util::set_lighting_state(2);
					break;
				}
				case 4:
				{
					level util::set_lighting_state(3);
					break;
				}
			}
			SetDvar("lighting", 0);
		}
		wait(0.05);
	}
}

/*
	Name: function_22ac2766
	Namespace: namespace_25ddfc86
	Checksum: 0xE77208FF
	Offset: 0x4220
	Size: 0xE0
	Parameters: 6
	Flags: None
	Line Number: 1021
*/
function function_22ac2766(multiplier, var_87c4fb18, DOG_HEALTH, var_4730ac76, var_212e320d, var_e2bc616f)
{
	level flag::wait_till("initial_blackscreen_passed");
	zombie_utility::set_zombie_var("zombie_move_speed_multiplier", multiplier, 0);
	zombie_utility::set_zombie_var("zombie_move_speed_multiplier_easy", multiplier, 0);
	level.zombie_actor_limit = var_87c4fb18;
	level.zombie_ai_limit = var_87c4fb18;
	level.DOG_HEALTH = DOG_HEALTH;
	level.var_6f66b796 = var_4730ac76;
	level.var_49643d2d = var_212e320d;
	level.var_239b13f = var_e2bc616f;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8824774d
	Namespace: namespace_25ddfc86
	Checksum: 0xD55263C6
	Offset: 0x4308
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 1046
*/
function function_8824774d(round_number)
{
	if(!isdefined(round_number))
	{
		round_number = undefined;
	}
	if(!isdefined(round_number))
	{
		round_number = zm::get_round_number();
	}
	if(round_number == zm::get_round_number())
	{
		return;
	}
	if(round_number < 0)
	{
		return;
	}
	/#
		level notify("kill_round");
	#/
	level notify("end_of_round");
	level.zombie_total = 0;
	zm::set_round_number(round_number);
	round_number = zm::get_round_number();
	zombie_utility::ai_calculate_health(round_number);
	SetRoundsPlayed(round_number);
	foreach(zombie in zombie_utility::get_round_enemy_array())
	{
		zombie kill();
	}
	if(level.gamedifficulty == 0)
	{
		level.zombie_move_speed = round_number * level.zombie_vars["zombie_move_speed_multiplier_easy"];
		continue;
	}
	level.zombie_move_speed = round_number * level.zombie_vars["zombie_move_speed_multiplier"];
	level.zombie_vars["zombie_spawn_delay"] = [[level.func_get_zombie_spawn_delay]](round_number);
	level.sndGotoRoundOccurred = 1;
	level waittill("between_round_over");
}

/*
	Name: function_7dec9f20
	Namespace: namespace_25ddfc86
	Checksum: 0x5DAB83CB
	Offset: 0x4518
	Size: 0x1E6
	Parameters: 1
	Flags: None
	Line Number: 1098
*/
function function_7dec9f20(allplayers)
{
	if(!isdefined(allplayers))
	{
		allplayers = 0;
	}
	PERKS = getArrayKeys(level._custom_perks);
	if(allplayers)
	{
		players = GetPlayers();
		foreach(player in players)
		{
			if(!player laststand::player_is_in_laststand())
			{
				var_b3864bc9 = player GetPerks();
				givePerks = PERKS.size - var_b3864bc9.size;
				for(i = 0; i < givePerks; i++)
				{
					wait(0.5);
					player zm_perks::give_random_perk();
				}
			}
		}
		continue;
	}
	var_b3864bc9 = self GetPerks();
	givePerks = PERKS.size - var_b3864bc9.size;
	for(i = 0; i < givePerks; i++)
	{
		wait(0.5);
		self zm_perks::give_random_perk();
	}
}

