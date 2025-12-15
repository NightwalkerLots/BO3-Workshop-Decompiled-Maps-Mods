#include scripts\_dobby\t6\_zm_t6_hud;
#include scripts\codescripts\struct;
#include scripts\planet\_planet_utilities;
#include scripts\planet\_zm_round_pause;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\postfx_raindrops;
#include scripts\shared\scene_shared;
#include scripts\shared\sound_shared;
#include scripts\shared\util_shared;
#include scripts\sphynx\commands;
#include scripts\vk_script\_zm_vk_general;
#include scripts\vk_script\_zm_vk_hardcore;
#include scripts\vk_script\_zm_vk_powerswitch;
#include scripts\vk_script\_zm_vk_zombie_debris;
#include scripts\vk_script\bl_hitmarkers;
#include scripts\vk_script\tranzit\vk_tranzit_amb_explodables;
#include scripts\vk_script\tranzit\vk_tranzit_flashlight;
#include scripts\vk_script\tranzit\vk_tranzit_main_shared;
#include scripts\vk_script\tranzit\vk_tranzit_zm_controller;
#include scripts\vk_script\tranzit\vk_tranzit_zm_milestones;
#include scripts\vk_script\vk_deadshot_perma;
#include scripts\vk_script\vk_user_preferences;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_dogs;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb_fix;
#include scripts\zm\_zm_pack_a_punch;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perk_deadshot;
#include scripts\zm\_zm_perk_directionalfire;
#include scripts\zm\_zm_perk_doubletap2;
#include scripts\zm\_zm_perk_electric_cherry;
#include scripts\zm\_zm_perk_juggernaut;
#include scripts\zm\_zm_perk_quick_revive;
#include scripts\zm\_zm_perk_random;
#include scripts\zm\_zm_perk_sleight_of_hand;
#include scripts\zm\_zm_perk_staminup;
#include scripts\zm\_zm_perk_vulture;
#include scripts\zm\_zm_perk_widows_wine;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerup_double_points;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_powerup_free_perk;
#include scripts\zm\_zm_powerup_full_ammo;
#include scripts\zm\_zm_powerup_insta_kill;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_trap_electric;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\logical\perks\_zm_perk_icu;
#include scripts\zm\perks\_zm_perk_phdflopper;
#include scripts\zm\zm_usermap;

#namespace namespace_a1b179a4;

/*
	Name: main
	Namespace: namespace_a1b179a4
	Checksum: 0x4C6BB83F
	Offset: 0xD38
	Size: 0x320
	Parameters: 0
	Flags: None
	Line Number: 79
*/
function main()
{
	level.var_571f49fd = 1;
	level.random_pandora_box_start = 1;
	level.var_eaf50aaa = 1;
	level._no_vending_machine_auto_collision = 1;
	level.dog_rounds_allowed = 1;
	level._effect["player_rain"] = "custom/env/fx_rain_player_z_heavy";
	clientfield::register("world", "decal_toggle", 1, 1, "int");
	clientfield::register("world", "rain_fx_stop", 1, 1, "int");
	zm_usermap::main();
	zm_perks::spare_change();
	level thread namespace_66db6bf8::function_665a38b5();
	level.var_6c2c8413 = undefined;
	level thread namespace_25ddfc86::init();
	level._zombie_custom_add_weapons = &custom_add_weapons;
	level.player_starting_points = 500;
	level thread namespace_f56b53f0::function_316c7941("DINER", "1.0.0");
	level thread namespace_f56b53f0::function_dc398f1f(0);
	zm_utility::register_tactical_grenade_for_level("octobomb");
	level thread function_f5d9cc6(6);
	level thread function_22ac2766();
	thread function_c28cdeba();
	level thread function_a8e30e30();
	level.var_69626b81 = -1;
	level.var_8a9168f3 = 0;
	level.var_2f49c9f2 = 1;
	level.default_laststandpistol = GetWeapon("vk_tra_pis_t9_1911_downed_rdw_lvl3");
	level.default_solo_laststandpistol = GetWeapon("vk_tra_pis_t9_1911_downed_rdw_lvl3");
	level.laststandpistol = level.default_laststandpistol;
	level.start_weapon = GetWeapon("vk_tra_pis_t9_1911_rdw_lvl1");
	level.zombie_powerup_weapon["minigun"] = GetWeapon("vk_tra_spc_minigun_lvl1");
	level.pack_a_punch_camo_index = 121;
	level.pack_a_punch_camo_index_number_variants = 3;
	level.zones = [];
	level.zone_manager_init_func = &function_f1e6f843;
	init_zones[0] = "start_zone";
	level thread zm_zonemgr::manage_zones(init_zones);
	level.pathdist_type = 2;
}

/*
	Name: function_f1e6f843
	Namespace: namespace_a1b179a4
	Checksum: 0x17C9B255
	Offset: 0x1060
	Size: 0x3B0
	Parameters: 0
	Flags: None
	Line Number: 130
*/
function function_f1e6f843()
{
	zm_zonemgr::add_adjacent_zone("start_zone", "gas_front_zone", "flag_start_gasfront");
	zm_zonemgr::add_adjacent_zone("gas_front_zone", "garage_side_zone", "flag_servofront_saloon");
	zm_zonemgr::add_adjacent_zone("garage_side_zone", "garage_back_zone");
	zm_zonemgr::add_adjacent_zone("garage_side_zone", "trailer_park_left_zone", "flag_garageside_trailerpark");
	zm_zonemgr::add_adjacent_zone("gas_front_zone", "trailer_park_mid_zone", "flag_servofront_swamplands");
	zm_zonemgr::add_adjacent_zone("trailer_park_left_zone", "trailer_park_mid_zone");
	zm_zonemgr::add_adjacent_zone("trailer_park_mid_zone", "trailer_park_right_zone");
	zm_zonemgr::add_adjacent_zone("trailer_park_pap_zone", "trailer_park_right_zone");
	zm_zonemgr::add_adjacent_zone("trailer_park_pap_zone", "trailer_park_left_zone");
	zm_zonemgr::add_adjacent_zone("diner_front_zone", "trailer_park_right_zone", "flag_dinerfront_trailerpark");
	zm_zonemgr::add_adjacent_zone("diner_front_zone", "diner_building_zone", "flag_diner_dinerfront");
	zm_zonemgr::add_adjacent_zone("diner_building_zone", "diner_roof_zone");
	zm_zonemgr::add_adjacent_zone("gas_front_zone", "diner_building_zone", "flag_diner_gasfront");
	zm_zonemgr::add_adjacent_zone("river_right_zone", "diner_building_zone", "flag_diner_river");
	zm_zonemgr::add_adjacent_zone("river_right_zone", "river_roof_zone", "flag_diner_river");
	zm_zonemgr::add_adjacent_zone("river_right_zone", "river_mid_zone");
	zm_zonemgr::add_adjacent_zone("river_right_zone", "river_roof_zone");
	zm_zonemgr::add_adjacent_zone("river_mid_zone", "river_left_zone");
	zm_zonemgr::add_adjacent_zone("river_left_zone", "garage_side_zone", "flag_garageside_river");
	zm_zonemgr::add_adjacent_zone("river_right_zone", "cave_right_zone", "flag_river_bunker");
	zm_zonemgr::add_adjacent_zone("river_left_zone", "cave_left_zone", "flag_river_bunker");
	zm_zonemgr::add_adjacent_zone("cave_left_zone", "bunker_zone");
	zm_zonemgr::add_adjacent_zone("bunker_zone", "cave_right_zone");
	zm_zonemgr::add_adjacent_zone("gas_front_zone", "diner_front_zone", "flag_servofront_dinerfront");
	level flag::init("always_on");
	level flag::set("always_on");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: custom_add_weapons
	Namespace: namespace_a1b179a4
	Checksum: 0x8025FFF3
	Offset: 0x1418
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 172
*/
function custom_add_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/vk_wpn_table.csv", 1);
}

/*
	Name: function_f5d9cc6
	Namespace: namespace_a1b179a4
	Checksum: 0xDA93E6D8
	Offset: 0x1448
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 187
*/
function function_f5d9cc6(num)
{
	wait(30);
	level.perk_purchase_limit = num;
}

/*
	Name: function_22ac2766
	Namespace: namespace_a1b179a4
	Checksum: 0xC8CF7BB1
	Offset: 0x1470
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 203
*/
function function_22ac2766()
{
	level flag::wait_till("initial_blackscreen_passed");
	zombie_utility::set_zombie_var("zombie_move_speed_multiplier", 8, 0);
	zombie_utility::set_zombie_var("zombie_move_speed_multiplier_easy", 8, 0);
}

/*
	Name: function_c28cdeba
	Namespace: namespace_a1b179a4
	Checksum: 0x77850487
	Offset: 0x14E0
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 220
*/
function function_c28cdeba()
{
	while(1)
	{
		level waittill("zmb_max_ammo_level");
		foreach(player in GetPlayers())
		{
			player.var_5a946b20 = player getweaponslistprimaries();
			foreach(gun in player.var_5a946b20)
			{
				weap = GetWeapon(gun.name);
				player SetWeaponAmmoClip(gun, weap.clipSize);
			}
		}
	}
}

/*
	Name: function_a8e30e30
	Namespace: namespace_a1b179a4
	Checksum: 0x102C2B5C
	Offset: 0x1670
	Size: 0x1C
	Parameters: 0
	Flags: None
	Line Number: 247
*/
function function_a8e30e30()
{
	zm_audio::loadPlayerVoiceCategories("gamedata/audio/zm/zm_zc_vox.csv");
}

