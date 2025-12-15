#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equip_hacker;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_black_hole_bomb;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_moon_digger;
#include scripts\zm\zm_moon_sq;
#include scripts\zm\zm_moon_sq_datalogs;

#namespace zm_moon_ffotd;

/*
	Name: main_start
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0xAF8
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function main_start()
{
	zm_powerups::register_powerup("bonus_points_team", &function_b6e2445);
	zm_powerups::register_powerup("lose_points_team", &function_33894eeb);
	zm_powerups::register_powerup("lose_perk", &function_cab7f4dc);
	zm_powerups::register_powerup("empty_clip", &function_27214d2e);
	zm_powerups::register_powerup("random_weapon", &function_984a38e);
	zm_powerups::add_zombie_powerup("bonus_points_team", "zombie_z_money_icon", &"ZOMBIE_POWERUP_BONUS_POINTS", &zm_powerups::func_should_never_drop, 0, 0, 0);
	zm_powerups::add_zombie_powerup("lose_points_team", "zombie_z_money_icon", &"ZOMBIE_POWERUP_LOSE_POINTS", &zm_powerups::func_should_never_drop, 0, 0, 1);
	zm_powerups::add_zombie_powerup("lose_perk", "zombie_pickup_perk_bottle", &"ZOMBIE_POWERUP_MAX_AMMO", &zm_powerups::func_should_never_drop, 0, 0, 1);
	zm_powerups::add_zombie_powerup("empty_clip", "p7_zm_power_up_max_ammo", &"ZOMBIE_POWERUP_MAX_AMMO", &zm_powerups::func_should_never_drop, 0, 0, 1);
	zm_powerups::add_zombie_powerup("random_weapon", "zombie_pickup_minigun", &"ZOMBIE_POWERUP_MAX_AMMO", &zm_powerups::func_should_never_drop, 1, 0, 0);
	level.zombie_powerups["random_weapon"].weapon = GetWeapon("ar_standard");
	level thread spawned_collision_ffotd();
	callback::on_spawned(&on_spawned);
}

/*
	Name: main_end
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0xD78
	Size: 0x540
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function main_end()
{
	spawncollision("collision_player_64x64x256", "collider", (76, 5552, 328), VectorScale((0, 1, 0), 270));
	spawncollision("collision_player_64x64x256", "collider", (76, 5552, 584), VectorScale((0, 1, 0), 270));
	spawncollision("collision_player_64x64x256", "collider", (140, 5552, 328), VectorScale((0, 1, 0), 270));
	spawncollision("collision_player_64x64x256", "collider", (140, 5552, 584), VectorScale((0, 1, 0), 270));
	spawncollision("collision_player_wall_512x512x10", "collider", (1473, 6312, 712), VectorScale((0, 1, 0), 240));
	spawncollision("collision_player_wall_256x256x10", "collider", (-590, 1165, -165), (0, 0, 0));
	spawncollision("collision_player_wall_256x256x10", "collider", (66.933, 7228.8, 221.5), VectorScale((0, 1, 0), 322.599));
	spawncollision("collision_player_wall_256x256x10", "collider", (45.067, 7200.2, 221.5), VectorScale((0, 1, 0), 322.599));
	spawncollision("collision_player_wall_256x256x10", "collider", (175.961, 7144.78, 223.472), VectorScale((0, 1, 0), 322.399));
	spawncollision("collision_player_wall_256x256x10", "collider", (153.995, 7116.25, 223.472), VectorScale((0, 1, 0), 322.399));
	spawncollision("collision_player_slick_wedge_32x256", "collider", (198.789, 7135.46, 344.998), (271.276, 284.062, 128.652));
	spawncollision("collision_player_slick_wedge_32x256", "collider", (170.789, 7098.46, 344.998), (271.276, 284.062, 128.652));
	spawncollision("collision_player_slick_wedge_32x256", "collider", (76.289, 7229.46, 344.998), (271.276, 284.062, 128.652));
	spawncollision("collision_player_slick_wedge_32x256", "collider", (48.289, 7192.46, 344.998), (271.276, 284.062, 128.652));
	spawncollision("collision_player_slick_wedge_32x256", "collider", (-155.692, 3850.08, -52.5), VectorScale((0, 1, 0), 175.099));
	level thread function_43e425f0("hangar_digger_switch", "start_hangar_digger", "hangar");
	level thread function_43e425f0("teleporter_digger_switch", "start_teleporter_digger", "teleporter");
	level thread function_43e425f0("biodome_digger_switch", "start_biodome_digger", "biodome");
	level thread function_e0bbb82b();
	if(math::cointoss())
	{
		level.var_f291cf55 = 1;
	}
	else
	{
		level.var_f291cf55 = 0;
	}
	level.giveCustomCharacters = &giveCustomCharacters;
	if(isdefined(level._zombie_sidequests["sq"]))
	{
		level._zombie_sidequests["sq"].init_func = &function_f1462ebf;
	}
	level thread function_f942f971();
	return;
}

/*
	Name: function_f942f971
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x12C0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 114
*/
function function_f942f971()
{
	level flagsys::wait_till("start_zombie_round_logic");
	level thread function_7ef0dffc();
}

/*
	Name: function_7ef0dffc
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x1308
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 130
*/
function function_7ef0dffc()
{
	level endon("end_game");
	while(isdefined(level.played_extra_song_a7x) && level.played_extra_song_a7x)
	{
		return;
		if(zm_zonemgr::any_player_in_zone("bridge_zone"))
		{
			level thread function_e9cc4751();
			while(zm_zonemgr::any_player_in_zone("bridge_zone") && (!(isdefined(level.played_extra_song_a7x) && level.played_extra_song_a7x)))
			{
				wait(1);
			}
			if(isdefined(level.played_extra_song_a7x) && level.played_extra_song_a7x)
			{
				return;
			}
			level notify("hash_8960a444");
		}
		wait(1);
	}
}

/*
	Name: function_e9cc4751
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x13E0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 163
*/
function function_e9cc4751()
{
	level endon("end_game");
	level endon("hash_8960a444");
	num = 1;
	while(!zm_zonemgr::any_player_in_zone("bridge_zone") || (isdefined(level.played_extra_song_a7x) && level.played_extra_song_a7x))
	{
		return;
		level waittill("end_of_round");
		num++;
		if(num >= 5)
		{
			level.played_extra_song_a7x = 1;
			level thread zm_audio::sndmusicsystem_playstate("nightmare");
			return;
		}
	}
}

/*
	Name: spawned_collision_ffotd
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x14A0
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 192
*/
function spawned_collision_ffotd()
{
	zm_audio::zmbVoxAdd("powerup", "empty_clip", "powerup_antipts_plr", 100, 0);
	zm_audio::zmbVoxAdd("general", "biodome", "location_biodome", 100, 0);
	zm_audio::zmbVoxAdd("general", "hack_box", "hack_box", 100, 0);
	zm_audio::zmbVoxAdd("general", "quad_spawn", "spawn_quad", 100, 0);
	zm_audio::zmbVoxAdd("general", "teleporter", "teleporter", 100, 0);
	level thread function_bf05c75a();
	level.zombiemode_gasmask_set_player_model = &gasmask_set_player_model;
	wait(2);
	level notify("specialty_armorvest_power_on");
	level notify("juggernog_on");
	level notify("specialty_fastreload_power_on");
	level notify("sleight_on");
	return;
	level.zombiemode_gasmask_set_player_model++;
}

/*
	Name: gasmask_set_player_model
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x1608
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 220
*/
function gasmask_set_player_model(entity_num)
{
	if(self hasweapon(level.var_f486078e))
	{
		self setcharacterbodystyle(1);
	}
}

/*
	Name: on_spawned
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x1658
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 238
*/
function on_spawned()
{
	self thread function_35a0986c();
}

/*
	Name: function_35a0986c
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x1680
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 253
*/
function function_35a0986c()
{
	self endon("disconnect");
	while(1)
	{
		self waittill("bled_out");
		self.var_a32f5476 = 0;
		self zm_equipment::set_equipment_invisibility_to_player(level.var_f486078e, 0);
		if(isdefined(level.zombiemode_gasmask_reset_player_viewmodel))
		{
			ent_num = self.characterindex;
			if(isdefined(self.zm_random_char))
			{
				ent_num = self.zm_random_char;
			}
			self [[level.zombiemode_gasmask_reset_player_viewmodel]](ent_num);
		}
	}
}

/*
	Name: function_b6e2445
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x1728
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 283
*/
function function_b6e2445(player)
{
	level thread bonus_points_team_powerup(self, player);
	if(level.zmAnnouncerPrefix == "vox_zmbar_")
	{
		thread zm_audio::sndAnnouncerPlayVox("bonus_points_team", undefined, 1);
	}
}

/*
	Name: function_33894eeb
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x1788
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 302
*/
function function_33894eeb(player)
{
	level thread lose_points_team_powerup(self, player);
	thread zm_audio::sndAnnouncerPlayVox("points_negative", undefined, 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_cab7f4dc
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x17D8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 320
*/
function function_cab7f4dc(player)
{
	level thread lose_perk_powerup(self);
	thread zm_audio::sndAnnouncerPlayVox("random", undefined, 1);
}

/*
	Name: function_27214d2e
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x1828
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 336
*/
function function_27214d2e(player)
{
	level thread empty_clip_powerup(self, player);
	thread zm_audio::sndAnnouncerPlayVox("powerup_negative", undefined, 1);
}

/*
	Name: function_984a38e
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x1878
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 352
*/
function function_984a38e(player)
{
	player thread random_weapon_powerup(self);
	if(level.zmAnnouncerPrefix == "vox_zmbar_")
	{
		thread zm_audio::sndAnnouncerPlayVox("random_weapon", player, 1);
	}
}

/*
	Name: powerup_vo
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x18E0
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 371
*/
function powerup_vo(type)
{
	self endon("death");
	self endon("disconnect");
	self endon("death");
	if(!isPlayer(self))
	{
		return;
	}
	if(isdefined(level.powerup_vo_available))
	{
		if(![[level.powerup_vo_available]]())
		{
			return;
		}
	}
	wait(RandomFloatRange(2, 2.5));
	if(type == "tesla")
	{
		self zm_audio::create_and_play_dialog("weapon_pickup", type);
	}
	else
	{
		self zm_audio::create_and_play_dialog("powerup", type);
	}
	if(isdefined(level.custom_powerup_vo_response))
	{
		level [[level.custom_powerup_vo_response]](self, type);
	}
}

/*
	Name: random_weapon_powerup
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x19E8
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 412
*/
function random_weapon_powerup(item)
{
	self TakeWeapon(GetWeapon("minigun"));
	weapon = item.weapon;
	if(weapon.inventoryType == "primary")
	{
		weaponList = self getweaponslistprimaries();
		if(weaponList.size)
		{
			self TakeWeapon(weaponList[RandomInt(weaponList.size)]);
		}
		weapon = self zm_weapons::give_build_kit_weapon(weapon);
		self function_92dca8b7(weapon, 0);
		self SwitchToWeaponImmediate(weapon);
	}
	else
	{
		weapon = self zm_weapons::weapon_give(weapon);
	}
}

/*
	Name: function_f56a5552
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x1B30
	Size: 0x2B8
	Parameters: 0
	Flags: None
	Line Number: 443
*/
function function_f56a5552()
{
	weapon = GetWeapon("lmg_cqb");
	keys = getArrayKeys(level.zombie_weapons);
	keys = Array::randomize(keys);
	weapon = level.start_weapon;
	for(i = 0; i < keys.size; i++)
	{
		if(keys[i].isMeleeWeapon || keys[i].isgrenadeweapon || keys[i].isHeroWeapon || keys[i].isgadget || keys[i].isRiotShield || level.start_weapon == keys[i] || keys[i] == level.weaponNone || keys[i] == level.weaponBaseMelee || zm_weapons::get_is_in_box(keys[i]) != 1 || IsSubStr(keys[i].name, "knife") || IsSubStr(keys[i].name, "melee") || keys[i].isFlourishWeapon || zm_utility::is_melee_weapon(keys[i]) || zm_utility::is_placeable_mine(keys[i]) || zm_utility::is_lethal_grenade(keys[i]) || keys[i].inventoryType != "primary" || zm_utility::is_tactical_grenade(keys[i]))
		{
			continue;
		}
		weapon = keys[i];
		continue;
	}
	return weapon;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: empty_clip_powerup
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x1DF0
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 472
*/
function empty_clip_powerup(item, player)
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(!player laststand::player_is_in_laststand() && !player.sessionstate == "spectator")
		{
			weapon = player GetCurrentWeapon();
			player SetWeaponAmmoClip(weapon, 0);
		}
	}
	wait(2);
	player zm_audio::create_and_play_dialog("powerup", "empty_clip");
}

/*
	Name: lose_perk_powerup
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x1F08
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 498
*/
function lose_perk_powerup(item)
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(!player laststand::player_is_in_laststand() && !player.sessionstate == "spectator")
		{
			player zm_perks::lose_random_perk();
		}
	}
}

/*
	Name: lose_points_team_powerup
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x1FC8
	Size: 0x148
	Parameters: 2
	Flags: None
	Line Number: 521
*/
function lose_points_team_powerup(item, player)
{
	player endon("death");
	points = randomIntRange(1, 25) * 100;
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(0 > players[i].score - points)
		{
			players[i] zm_score::minus_to_player_score(players[i].score);
			continue;
		}
		players[i] zm_score::minus_to_player_score(points);
	}
	wait(2);
	player zm_audio::create_and_play_dialog("powerup", "lose_points");
}

/*
	Name: bonus_points_team_powerup
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x2118
	Size: 0x150
	Parameters: 2
	Flags: None
	Line Number: 549
*/
function bonus_points_team_powerup(item, player)
{
	player endon("death");
	points = randomIntRange(1, 25) * 100;
	if(isdefined(level.bonus_points_powerup_override))
	{
		points = [[level.bonus_points_powerup_override]]();
	}
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::player_add_points("bonus_points_powerup", points);
	}
	if(math::cointoss())
	{
		player zm_audio::create_and_play_dialog("powerup", "bonus_points_solo");
	}
	else
	{
		player zm_audio::create_and_play_dialog("powerup", "bonus_points_team");
	}
}

/*
	Name: function_bf05c75a
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x2270
	Size: 0x2F0
	Parameters: 0
	Flags: None
	Line Number: 582
*/
function function_bf05c75a()
{
	[[level.quantum_bomb_register_result_func]]("random_tactical_grenade", &function_c939b342, 40);
	[[level.quantum_bomb_register_result_func]]("random_powerup", &quantum_bomb_random_powerup_result, 5, level.quantum_bomb_in_playable_area_validation_func);
	[[level.quantum_bomb_register_result_func]]("random_zombie_grab_powerup", &quantum_bomb_random_zombie_grab_powerup_result, 5, level.quantum_bomb_in_playable_area_validation_func);
	[[level.quantum_bomb_register_result_func]]("random_weapon_powerup", &quantum_bomb_random_weapon_powerup_result, 60, level.quantum_bomb_in_playable_area_validation_func);
	[[level.quantum_bomb_register_result_func]]("random_bonus_or_lose_points_powerup", &quantum_bomb_random_bonus_or_lose_points_powerup_result, 25, level.quantum_bomb_in_playable_area_validation_func);
	level.quantum_bomb_results["random_lethal_grenade"].chance = 50;
	level.quantum_bomb_results["random_weapon_starburst"].chance = 50;
	level.quantum_bomb_results["pack_or_unpack_current_weapon"].chance = 10;
	level.quantum_bomb_results["auto_revive"].chance = 98;
	level.quantum_bomb_results["player_teleport"].chance = 66;
	level.quantum_bomb_results["zombie_speed_buff"].chance = 88;
	level.quantum_bomb_results["zombie_add_to_total"].chance = 65;
	level.quantum_bomb_results["zombie_fling"].chance = 25;
	level.quantum_bomb_results["remove_digger"].chance = 75;
	level.quantum_bomb_results["open_nearest_door"].chance = 40;
	level.quantum_bomb_results["give_nearest_perk"].chance = 30;
	level.quantum_bomb_results["random_tactical_grenade"].chance = 40;
	level.quantum_bomb_results["random_powerup"].chance = 20;
	level.quantum_bomb_results["random_zombie_grab_powerup"].chance = 88;
	level.quantum_bomb_results["random_weapon_powerup"].chance = 45;
	level.quantum_bomb_results["random_bonus_or_lose_points_powerup"].chance = 77;
}

/*
	Name: quantum_bomb_random_powerup_result
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x2568
	Size: 0x240
	Parameters: 1
	Flags: None
	Line Number: 617
*/
function quantum_bomb_random_powerup_result(position)
{
	if(!isdefined(level.zombie_include_powerups) || !level.zombie_include_powerups.size)
	{
		return;
	}
	keys = getArrayKeys(level.zombie_include_powerups);
	while(keys.size)
	{
		index = RandomInt(keys.size);
		if(!level.zombie_powerups[keys[index]].zombie_grabbable)
		{
			skip = 0;
			switch(keys[index])
			{
				case "bonus_points_player":
				case "bonus_points_team":
				case "random_weapon":
				{
					skip = 1;
					break;
				}
				case "carpenter":
				case "fire_sale":
				case "full_ammo":
				case "insta_kill":
				case "minigun":
				case "nuke":
				{
					if(RandomInt(4))
					{
						skip = 1;
						break;
					}
				}
				case "free_perk":
				{
					if(RandomInt(20))
					{
						skip = 1;
						break;
					}
				}
				default
				{
				}
			}
			if(skip)
			{
				keys = ArrayRemoveValue(keys, keys[index]);
				continue;
			}
			self thread zm_audio::create_and_play_dialog("kill", "quant_good");
			[[level.quantum_bomb_play_player_effect_at_position_func]](position);
			level zm_powerups::specific_powerup_drop(keys[index], position);
			return;
		}
		else
		{
			keys = ArrayRemoveValue(keys, keys[index]);
		}
	}
}

/*
	Name: quantum_bomb_random_zombie_grab_powerup_result
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x27B0
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 691
*/
function quantum_bomb_random_zombie_grab_powerup_result(position)
{
	if(!isdefined(level.zombie_include_powerups) || !level.zombie_include_powerups.size)
	{
		return;
	}
	keys = getArrayKeys(level.zombie_include_powerups);
	while(keys.size)
	{
		index = RandomInt(keys.size);
		if(level.zombie_powerups[keys[index]].zombie_grabbable)
		{
			self thread zm_audio::create_and_play_dialog("kill", "quant_bad");
			[[level.quantum_bomb_play_player_effect_at_position_func]](position);
			level zm_powerups::specific_powerup_drop(keys[index], position);
			return;
		}
		else
		{
			keys = ArrayRemoveValue(keys, keys[index]);
		}
	}
}

/*
	Name: quantum_bomb_random_weapon_powerup_result
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x28E8
	Size: 0x180
	Parameters: 1
	Flags: None
	Line Number: 725
*/
function quantum_bomb_random_weapon_powerup_result(position)
{
	self thread zm_audio::create_and_play_dialog("kill", "quant_good");
	[[level.quantum_bomb_play_player_effect_at_position_func]](position);
	upgraded = zm_weapons::is_weapon_upgraded(level.zombie_powerups["random_weapon"].weapon);
	level.zombie_powerups["random_weapon"].weapon = function_f56a5552();
	if(!upgraded)
	{
		level.zombie_powerups["random_weapon"].weapon = zm_weapons::get_upgrade_weapon(level.zombie_powerups["random_weapon"].weapon);
	}
	powerup = level zm_powerups::specific_powerup_drop("random_weapon", position);
	powerup.weapon = level.zombie_powerups["random_weapon"].weapon;
	powerup UseWeaponModel(powerup.weapon);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: quantum_bomb_random_bonus_or_lose_points_powerup_result
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x2A70
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 752
*/
function quantum_bomb_random_bonus_or_lose_points_powerup_result(position)
{
	rand = RandomInt(10);
	powerup = "bonus_points_team";
	switch(rand)
	{
		case 0:
		case 1:
		{
			powerup = "lose_points_team";
			if(isdefined(level.zombie_include_powerups[powerup]))
			{
				self thread zm_audio::create_and_play_dialog("kill", "quant_bad");
				break;
			}
		}
		case 2:
		case 3:
		case 4:
		{
			powerup = "bonus_points_player";
			if(isdefined(level.zombie_include_powerups[powerup]))
			{
				break;
			}
		}
		default
		{
			powerup = "bonus_points_team";
			break;
		}
	}
	[[level.quantum_bomb_play_player_effect_at_position_func]](position);
	level zm_powerups::specific_powerup_drop(powerup, position);
}

/*
	Name: function_c939b342
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x2BB0
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 798
*/
function function_c939b342(position)
{
	self thread zm_audio::create_and_play_dialog("kill", "quant_good");
	self thread namespace_d6b63386::player_handle_black_hole_bomb();
	self thread namespace_d6b63386::function_e877695e();
	grenade = self MagicGrenadeType(level.var_453e74a0, position, (0, 0, 0));
	grenade.angles = VectorScale((0, 1, 0), 90);
	self notify("grenade_fire", grenade, level.var_453e74a0);
}

/*
	Name: function_fc5dd5b0
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x2C88
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 818
*/
function function_fc5dd5b0(start_flag)
{
	if(start_flag == "start_teleporter_digger" && !level flag::get("teleporter_breached"))
	{
		if(GetDvarInt("com_maxclients") > 5 || GetDvarInt("tfoption_bgb_loadout") == 1 || GetDvarInt("tfoption_bgb") == 1)
		{
			return 5000;
		}
		return 50000;
	}
	return 1000;
}

/*
	Name: function_afa6a8df
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x2D48
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 841
*/
function function_afa6a8df(start_flag)
{
	if(start_flag == "start_teleporter_digger" && !level flag::get("teleporter_breached"))
	{
		if(GetDvarInt("com_maxclients") > 5 || GetDvarInt("tfoption_bgb_loadout") == 1 || GetDvarInt("tfoption_bgb") == 1)
		{
			return 0;
		}
		return 10;
	}
	return 0;
}

/*
	Name: function_a6e94fc8
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x2E00
	Size: 0x110
	Parameters: 3
	Flags: None
	Line Number: 864
*/
function function_a6e94fc8(trig, start_flag, digger)
{
	struct = spawnstruct();
	struct.origin = trig.origin;
	struct.script_float = 5;
	struct.radius = 32;
	struct.height = 32;
	struct.start_flag = start_flag;
	struct.round = function_afa6a8df(struct.start_flag);
	struct.digger = digger;
	struct.no_bullet_trace = 1;
	struct.no_sight_check = 1;
	return struct;
}

/*
	Name: function_f606d57d
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x2F18
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 889
*/
function function_f606d57d()
{
	self.round = function_afa6a8df(self.start_flag);
	if(isdefined(self.round) && self.round > level.round_number)
	{
		self.script_int = undefined;
		self.custom_string = &"ZOMBIE_BGB_MACHINE_COMEBACK";
	}
	else
	{
		self.script_int = function_fc5dd5b0(self.start_flag);
		self.custom_string = undefined;
	}
}

/*
	Name: function_43e425f0
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x2FB0
	Size: 0x138
	Parameters: 3
	Flags: None
	Line Number: 914
*/
function function_43e425f0(trig_name, start_flag, digger)
{
	level flag::wait_till("power_on");
	wait(5);
	trig = GetEnt(trig_name, "targetname");
	while(!level flag::get(start_flag))
	{
		struct = function_a6e94fc8(trig, start_flag, digger);
		function_25a5b0ef(struct, &function_26d1ebe5, &function_f35a549e);
		level flag::wait_till(start_flag);
		namespace_6d813654::deregister_hackable_struct(struct);
		level flag::wait_till_clear(start_flag);
		wait(1);
	}
}

/*
	Name: function_26d1ebe5
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x30F0
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 940
*/
function function_26d1ebe5(hacker)
{
	if(isdefined(self.round) && self.round > level.round_number)
	{
		return 0;
	}
	zm_moon_digger::digger_activate(self.digger);
}

/*
	Name: function_f35a549e
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x3148
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 959
*/
function function_f35a549e(player)
{
	self function_f606d57d();
	return !player bgb::is_active("zm_bgb_shopping_free") && !level flag::get("start_teleporter_digger") && !level flag::get("start_hangar_digger") && !level flag::get("start_biodome_digger") && !level flag::get("digger_moving");
}

/*
	Name: function_e0bbb82b
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x3218
	Size: 0x2E0
	Parameters: 0
	Flags: None
	Line Number: 975
*/
function function_e0bbb82b()
{
	level flag::wait_till("power_on");
	util::setClientSysState("aae_soulcounter", "&AAE_TIP_MOON_DIGGER_HACKING_TITLE&AAE_TIP_MOON_DIGGER_HACKING_CONTENT&-456&806&50");
	util::setClientSysState("aae_soulcounter", "&AAE_TIP_MOON_EE_ITEM_TITLE&AAE_TIP_MOON_EE_ITEM_CONTENT&1163&6113&47");
	level flag::wait_till("be2");
	util::setClientSysState("aae_soulcounter", "&AAE_TIP_MOON_SUPER_PES_TITLE&AAE_TIP_MOON_SUPER_PES_CONTENT&-901&389&-160");
	equipment_spawns = GetEntArray("zombie_equipment_upgrade", "targetname");
	for(i = 0; i < equipment_spawns.size; i++)
	{
		if(isdefined(equipment_spawns[i].equipment) && equipment_spawns[i].zombie_equipment_upgrade == "equip_gasmask")
		{
			equipment_spawns[i] function_7c20dc8f();
		}
	}
	callback::on_connect(&function_74475b1c);
	for(i = 0; i < level.activePlayers.size; i++)
	{
		level.activePlayers[i] thread function_74475b1c();
	}
	callback::remove_on_spawned(&function_74475b1c);
	level waittill("hash_fe196c9c");
	for(i = 0; i < level.activePlayers.size; i++)
	{
		level.activePlayers[i] thread function_b90b9ed5();
	}
	callback::on_connect(&function_b90b9ed5);
	for(i = 0; i < equipment_spawns.size; i++)
	{
		if(isdefined(equipment_spawns[i].equipment) && equipment_spawns[i].zombie_equipment_upgrade === "equip_gasmask")
		{
			equipment_spawns[i] notify(equipment_spawns[i].zombie_equipment_upgrade + "_end");
			equipment_spawns[i] thread function_af29dc1a();
		}
	}
}

/*
	Name: function_74475b1c
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x3500
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1022
*/
function function_74475b1c()
{
	level endon("hash_fe196c9c");
	self notify("hash_74475b1c");
	self endon("hash_74475b1c");
	self endon("disconnect");
	for(;;)
	{
		self waittill("weapon_change", weapon);
		if(self hasweapon(level.w_hacker))
		{
			if(isdefined(weapon) && weapon === level.w_hacker)
			{
				self function_8b73f37(level.var_f486078e, 1);
			}
			else
			{
				self function_8b73f37(level.var_f486078e, 0);
			}
		}
	}
}

/*
	Name: function_8b73f37
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x35D8
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 1055
*/
function function_8b73f37(equipment, invisible)
{
	triggers = level.zombie_equipment[equipment].triggers;
	for(i = 0; i < triggers.size; i++)
	{
		if(isdefined(triggers[i]))
		{
			triggers[i] setinvisibletoplayer(self, invisible);
		}
	}
}

/*
	Name: function_b90b9ed5
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x3678
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1077
*/
function function_b90b9ed5()
{
	self endon("disconnect");
	for(;;)
	{
		wait(0.05);
		var_677bec3 = isdefined(self.var_a32f5476) && self.var_a32f5476;
		if(var_677bec3)
		{
			self zm_equipment::set_equipment_invisibility_to_player(level.var_f486078e, 1);
		}
		else
		{
			self zm_equipment::set_equipment_invisibility_to_player(level.var_f486078e, 0);
		}
		while(var_677bec3 == isdefined(self.var_a32f5476) && self.var_a32f5476)
		{
			wait(0.05);
		}
	}
}

/*
	Name: function_7c20dc8f
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x3730
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1109
*/
function function_7c20dc8f()
{
	struct = spawnstruct();
	struct.origin = self.origin;
	struct.script_int = 2000;
	struct.script_float = 5;
	struct.radius = 32;
	struct.height = 32;
	struct.no_bullet_trace = 1;
	struct.no_sight_check = 1;
	namespace_6d813654::register_pooled_hackable_struct(struct, &function_eccb3498);
	return;
	waittillframeend;
}

/*
	Name: function_eccb3498
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x3808
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1134
*/
function function_eccb3498(hacker)
{
	level.var_f1b3ff8b = 1;
	level notify("hash_fe196c9c");
	namespace_6d813654::deregister_hackable_struct(self);
}

/*
	Name: function_af29dc1a
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x3850
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 1151
*/
function function_af29dc1a()
{
	self endon(self.zombie_equipment_upgrade + "_end");
	for(;;)
	{
		self waittill("trigger", player);
		if(isdefined(player.var_a32f5476) && player.var_a32f5476 && player zm_utility::in_revive_trigger() || player.IS_DRINKING > 0)
		{
			wait(0.1);
		}
		else if(player zm_equipment::has_player_equipment(level.var_f486078e))
		{
			player zm_equipment::take(level.var_f486078e);
			wait(0.2);
		}
		player.var_a32f5476 = 1;
		level clientfield::set("player" + player GetEntityNumber() + "wearableItem", 1);
		if(isdefined(level.zombiemode_gasmask_change_player_headmodel))
		{
			ent_num = player.characterindex;
			if(isdefined(player.zm_random_char))
			{
				ent_num = player.zm_random_char;
			}
			player [[level.zombiemode_gasmask_change_player_headmodel]](ent_num, 1);
		}
		player zm_equipment::set_equipment_invisibility_to_player(level.var_f486078e, 1);
	}
}

/*
	Name: function_25a5b0ef
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x3A10
	Size: 0x50
	Parameters: 3
	Flags: None
	Line Number: 1191
*/
function function_25a5b0ef(struct, callback_func, qualifier_func)
{
	level._hacker_pooled = 1;
	register_hackable_struct(struct, callback_func, qualifier_func);
	level._hacker_pooled = undefined;
	return;
	ERROR: Bad function call
}

/*
	Name: register_hackable_struct
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x3A68
	Size: 0x118
	Parameters: 3
	Flags: None
	Line Number: 1210
*/
function register_hackable_struct(struct, callback_func, qualifier_func)
{
	if(!IsInArray(level._hackable_objects, struct))
	{
		struct._hack_callback_func = callback_func;
		struct._hack_qualifier_func = qualifier_func;
		struct.pooled = level._hacker_pooled;
		if(isdefined(struct.targetname))
		{
			struct.hacker_target = GetEnt(struct.targetname, "targetname");
		}
		level._hackable_objects[level._hackable_objects.size] = struct;
		if(isdefined(level._hacker_pooled))
		{
			level._pooled_hackable_objects[level._pooled_hackable_objects.size] = struct;
		}
		struct thread hackable_object_thread();
	}
}

/*
	Name: hackable_object_thread
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x3B88
	Size: 0x498
	Parameters: 0
	Flags: None
	Line Number: 1240
*/
function hackable_object_thread()
{
	self endon("hackable_deregistered");
	height = 72;
	radius = 64;
	if(isdefined(self.radius))
	{
		radius = self.radius;
	}
	if(isdefined(self.height))
	{
		height = self.height;
	}
	if(!isdefined(self.pooled))
	{
		trigger = spawn("trigger_radius_use", self.origin, 0, radius, height);
		trigger UseTriggerRequireLookAt();
		trigger setcursorhint("HINT_NOICON");
		trigger.radius = radius;
		trigger.height = height;
		trigger.BeingHacked = 0;
		self._trigger = trigger;
	}
	duration = 1;
	if(isdefined(self.script_float))
	{
		duration = self.script_float;
	}
	while(1)
	{
		wait(0.1);
		if(!isdefined(self._trigger))
		{
			continue;
		}
		players = GetPlayers();
		if(isdefined(self._trigger))
		{
			if(isdefined(self.entity))
			{
				self.origin = self.entity.origin;
				self._trigger.origin = self.entity.origin;
				if(isdefined(self.trigger_offset))
				{
					self._trigger.origin = self._trigger.origin + self.trigger_offset;
				}
			}
		}
		for(i = 0; i < players.size; i++)
		{
			if(players[i] namespace_6d813654::can_hack(self))
			{
				self namespace_6d813654::set_hack_hint_string();
				break;
			}
		}
		for(i = 0; i < players.size; i++)
		{
			hacker = players[i];
			if(!hacker namespace_6d813654::is_hacking(self))
			{
				continue;
			}
			cost = 0;
			if(isdefined(self.script_int))
			{
				cost = self.script_int;
			}
			if(hacker.score >= cost || cost <= 0)
			{
				hacker SetLowReady(1);
				self thread namespace_6d813654::lowreadywatcher(hacker);
				hack_success = hacker namespace_6d813654::hacker_do_hack(self);
				self notify("kill_lowreadywatcher");
				if(isdefined(hacker))
				{
					hacker SetLowReady(0);
				}
				if(isdefined(hacker) && hack_success)
				{
					if(cost)
					{
						if(cost > 0)
						{
							hacker zm_score::minus_to_player_score(cost);
						}
						else
						{
							hacker zm_score::add_to_player_score(cost * -1, 1, "equip_hacker");
						}
					}
					hacker notify("successful_hack");
					if(isdefined(self._hack_callback_func))
					{
						self thread [[self._hack_callback_func]](hacker);
						continue;
					}
				}
			}
			hacker zm_utility::play_sound_on_ent("no_purchase");
			hacker zm_audio::create_and_play_dialog("general", "no_money", 1);
		}
	}
}

/*
	Name: giveCustomCharacters
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x4028
	Size: 0x2B8
	Parameters: 0
	Flags: None
	Line Number: 1355
*/
function giveCustomCharacters()
{
	self DetachAll();
	if(!isdefined(self.characterindex))
	{
		self.characterindex = self assign_lowest_unused_character_index();
	}
	self.favorite_wall_weapons_list = [];
	self.talks_in_danger = 0;
	/#
		if(GetDvarString("Dev Block strings are not supported") != "Dev Block strings are not supported")
		{
			self.characterindex = GetDvarInt("Dev Block strings are not supported");
		}
	#/
	self setcharacterbodytype(self.characterindex);
	self setcharacterbodystyle(0);
	self setcharacterhelmetstyle(0);
	switch(self.characterindex)
	{
		case 0:
		{
			self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("frag_grenade");
			self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("bouncingbetty");
			break;
		}
		case 1:
		{
			self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("870mcs");
			break;
		}
		case 2:
		{
			self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("hk416");
			break;
		}
		case 3:
		{
			self.talks_in_danger = 1;
			level.rich_sq_player = self;
			level.sndRadioA = self;
			self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("pistol_standard");
			break;
		}
	}
	level.vox zm_audio::zmbVoxInitSpeaker("player", "vox_plr_", self);
	self setMoveSpeedScale(1);
	self SetSprintDuration(4);
	self SetSprintCooldown(0);
}

/*
	Name: assign_lowest_unused_character_index
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x42E8
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 1416
*/
function assign_lowest_unused_character_index()
{
	charindexarray = [];
	charindexarray[0] = 0;
	charindexarray[1] = 1;
	charindexarray[2] = 2;
	charindexarray[3] = 3;
	players = GetPlayers();
	foreach(player in players)
	{
		if(isdefined(player.characterindex))
		{
			ArrayRemoveValue(charindexarray, player.characterindex, 0);
		}
	}
	if(charindexarray.size > 0)
	{
		characterindex = charindexarray[RandomInt(charindexarray.size)];
		if(characterindex == 2)
		{
			return 2;
		}
		else if(players.size > 1 && self GetEntityNumber() + 1 == players.size && !function_5c35365f(players))
		{
			return 2;
		}
		else
		{
			return characterindex;
		}
	}
	return 0;
}

/*
	Name: function_5c35365f
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x44C8
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 1460
*/
function function_5c35365f(players)
{
	foreach(player in players)
	{
		if(isdefined(player.characterindex) && player.characterindex == 2)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_f1462ebf
	Namespace: zm_moon_ffotd
	Checksum: 0x424F4353
	Offset: 0x4580
	Size: 0x304
	Parameters: 0
	Flags: None
	Line Number: 1482
*/
function function_f1462ebf()
{
	players = level.players;
	level._all_previous_done = 0;
	level._zombiemode_sidequest_icon_offset = -32;
	if(!function_5c35365f() && level.activePlayers.size == 1)
	{
		level._all_previous_done = 1;
		players[0] zm_sidequests::add_sidequest_icon("sq", "generator", 0);
		players[0] zm_sidequests::add_sidequest_icon("sq", "vril", 0);
	}
	else
	{
		for(i = 0; i < players.size; i++)
		{
			entnum = players[i].characterindex;
			/#
				println("Dev Block strings are not supported" + entnum);
			#/
			if(isdefined(players[i].zm_random_char))
			{
				entnum = players[i].zm_random_char;
			}
			if(entnum == 2)
			{
				devmode = 1;
				if(devmode)
				{
					players[i] zm_sidequests::add_sidequest_icon("sq", "generator", 0);
					level._all_previous_done = 1;
					continue;
				}
				if(level.onlinegame)
				{
					if(zm::is_sidequest_previously_completed("EOA"))
					{
						players[i] zm_sidequests::add_sidequest_icon("sq", "generator", 0);
						level._all_previous_done = 1;
						break;
						continue;
					}
					players[i] zm_sidequests::add_sidequest_icon("sq", "vril", 0);
					break;
				}
			}
		}
	}
	level thread zm_moon_sq::tanks();
	level thread zm_moon_sq::cassimir();
	level thread zm_moon_sq::be();
	level thread zm_moon_sq_datalogs::init();
	if(1 == GetDvarInt("scr_debug_launch"))
	{
		level thread zm_moon_sq::rocket_test();
	}
	level thread zm_moon_sq::rocket_raise();
}

