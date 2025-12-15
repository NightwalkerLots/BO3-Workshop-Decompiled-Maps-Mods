#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\exploder_shared;
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
#include scripts\zm\_zm_da_perk_slots;
#include scripts\zm\_zm_daily_challenges;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perk_additions_custom_maps;
#include scripts\zm\_zm_perk_banana_colada;
#include scripts\zm\_zm_perk_bandolier_bandit;
#include scripts\zm\_zm_perk_blaze_phase;
#include scripts\zm\_zm_perk_blood_bullets;
#include scripts\zm\_zm_perk_blood_wolf_bite;
#include scripts\zm\_zm_perk_bull_ice_blast;
#include scripts\zm\_zm_perk_cashback;
#include scripts\zm\_zm_perk_changechews;
#include scripts\zm\_zm_perk_crusaders_ale;
#include scripts\zm\_zm_perk_da_death_perception;
#include scripts\zm\_zm_perk_da_phd_slider;
#include scripts\zm\_zm_perk_da_tombstone;
#include scripts\zm\_zm_perk_damnade;
#include scripts\zm\_zm_perk_deadshot;
#include scripts\zm\_zm_perk_directionalfire;
#include scripts\zm\_zm_perk_doubletap2;
#include scripts\zm\_zm_perk_downers_delight;
#include scripts\zm\_zm_perk_dying_wish;
#include scripts\zm\_zm_perk_electric_cherry;
#include scripts\zm\_zm_perk_elemental_pop;
#include scripts\zm\_zm_perk_estatic;
#include scripts\zm\_zm_perk_ethereal_razor;
#include scripts\zm\_zm_perk_inferno;
#include scripts\zm\_zm_perk_juggernaut;
#include scripts\zm\_zm_perk_madgaz_moonshine;
#include scripts\zm\_zm_perk_magnet;
#include scripts\zm\_zm_perk_mh_mocha;
#include scripts\zm\_zm_perk_momentum;
#include scripts\zm\_zm_perk_nitrogen;
#include scripts\zm\_zm_perk_nobear;
#include scripts\zm\_zm_perk_nuka_cola;
#include scripts\zm\_zm_perk_packbox;
#include scripts\zm\_zm_perk_phd_slider;
#include scripts\zm\_zm_perk_point_crusher;
#include scripts\zm\_zm_perk_quick_revive;
#include scripts\zm\_zm_perk_repairman;
#include scripts\zm\_zm_perk_sleight_of_hand;
#include scripts\zm\_zm_perk_spector_shot;
#include scripts\zm\_zm_perk_staminup;
#include scripts\zm\_zm_perk_stone_cold_stronghold;
#include scripts\zm\_zm_perk_swarm_scotch;
#include scripts\zm\_zm_perk_timeslip;
#include scripts\zm\_zm_perk_victorious_tortoise;
#include scripts\zm\_zm_perk_vulture;
#include scripts\zm\_zm_perk_widows_wine;
#include scripts\zm\_zm_perk_winters_wail;
#include scripts\zm\_zm_perk_zombshell;
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
#include scripts\zm\logical\perks\_zm_perk_ffyl;
#include scripts\zm\logical\perks\_zm_perk_icu;
#include scripts\zm\logical\perks\_zm_perk_milk;
#include scripts\zm\logical\perks\_zm_perk_tactiquilla;
#include scripts\zm\zmperkoverlaystyles;
#include scripts\zm\zmsavedata;

#namespace namespace_789de0fc;

/*
	Name: __init__sytem__
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x1F70
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 104
*/
function autoexec __init__sytem__()
{
	system::register("_zm_perk_additions", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x1FB0
	Size: 0x4CB8
	Parameters: 0
	Flags: None
	Line Number: 119
*/
function __init__()
{
	level.var_6d54f498 = [];
	level.var_1bfd5a74 = [];
	callback::on_spawned(&on_player_spawned);
	level flag::init("checked_for_map_perks");
	function_f7387578();
	level thread function_92241174();
	level thread function_e3887522();
	level.var_8e7dc01c = VectorScale((0, 0, -1), 5000);
	level thread namespace_851dc78f::function_c3c32972("specialty_armorvest", &"ZM_REAP_MOD_PERK_JUGG_DB", 2000, "Jugger-nog", "juggernaut", &function_d5c02d81, &function_c9e7ddeb);
	level thread namespace_851dc78f::function_c3c32972("specialty_quickrevive", &"ZM_REAP_MOD_PERK_QUICKREVIVE_DB", 2000, "quick revive", "quick_revive");
	level thread namespace_851dc78f::function_c3c32972("specialty_fastreload", &"ZM_REAP_MOD_PERK_SPEEDCOLA_DB", 2000, "Speed Cola", "sleight_of_hand", &function_7a1baa03);
	level thread namespace_851dc78f::function_c3c32972("specialty_doubletap2", &"ZM_REAP_MOD_PERK_DOUBLETAP_DB", 2000, "Double Tap 2.0", "doubletap2", &function_6732b02e, &function_9e534960);
	level thread namespace_851dc78f::function_c3c32972("specialty_staminup", &"ZM_REAP_MOD_PERK_STAMINUP_DB", 2000, "Stamin-Up", "marathon", &function_942ac8df, &function_3dc49dd);
	level thread namespace_851dc78f::function_c3c32972("specialty_deadshot", &"ZM_REAP_MOD_PERK_DEADSHOT_DB", 1500, "Deadshot Daiquiri", "dead_shot", &function_93b798cc, &function_782fbb72);
	level thread namespace_851dc78f::function_c3c32972("specialty_additionalprimaryweapon", &"ZM_REAP_MOD_PERK_MULEKICK_DB", 2000, "Mule Kick", "additional_primary_weapon");
	level thread namespace_851dc78f::function_c3c32972("specialty_electriccherry", &"ZM_REAP_MOD_PERK_CHERRY_DB", 1500, "Electric Cherry", "electric_cherry");
	level thread namespace_851dc78f::function_c3c32972("specialty_widowswine", &"ZM_REAP_MOD_PERK_WIDOWSWINE_DB", 2000, "Widows Wine", "widows_wine");
	level thread function_4b312505();
	level.var_b82f654b = [];
	level.var_b82f654b["specialty_doubletap2"] = 137;
	level.var_b82f654b["specialty_armorvest"] = 138;
	level.var_b82f654b["specialty_quickrevive"] = 139;
	level.var_b82f654b["specialty_fastreload"] = 140;
	level.var_b82f654b["specialty_staminup"] = 141;
	level.var_b82f654b["specialty_deadshot"] = 142;
	level.var_b82f654b["specialty_additionalprimaryweapon"] = 143;
	level.var_b82f654b["specialty_electriccherry"] = 144;
	level.var_b82f654b["specialty_widowswine"] = 145;
	level.var_b82f654b["specialty_bandolier"] = 146;
	level.var_b82f654b["specialty_blazephase"] = 147;
	level.var_b82f654b["specialty_da_death_perception"] = 148;
	level.var_b82f654b["specialty_dyingwish"] = 149;
	level.var_b82f654b["specialty_razor"] = 150;
	level.var_b82f654b["specialty_slider"] = 151;
	level.var_b82f654b["specialty_stronghold"] = 152;
	level.var_b82f654b["specialty_timeslip"] = 153;
	level.var_b82f654b["specialty_victorious"] = 154;
	level.var_b82f654b["specialty_winterwail"] = 155;
	level.var_b82f654b["specialty_zombshell"] = 156;
	level.var_b82f654b["specialty_bloodbullets"] = 157;
	level.var_b82f654b["specialty_cashback"] = 158;
	level.var_b82f654b["specialty_damnade"] = 159;
	level.var_b82f654b["specialty_downersdelight"] = 160;
	level.var_b82f654b["specialty_estatic"] = 161;
	level.var_b82f654b["specialty_inferno"] = 162;
	level.var_b82f654b["specialty_magnet"] = 163;
	level.var_b82f654b["specialty_mh_mocha"] = 164;
	level.var_b82f654b["specialty_nitrogen"] = 165;
	level.var_b82f654b["specialty_nukacola"] = 166;
	level.var_b82f654b["specialty_packbox"] = 167;
	level.var_b82f654b["specialty_point"] = 168;
	level.var_b82f654b["specialty_swarmscotch"] = 169;
	level.var_b82f654b["specialty_da_phd_slider"] = 170;
	level.var_b82f654b["specialty_vulture"] = 171;
	level.var_b82f654b["specialty_elementalpop"] = 172;
	level.var_b82f654b["specialty_da_tombstone"] = 173;
	level.var_b82f654b["specialty_bloodwolf"] = 174;
	level.var_b82f654b["specialty_directionalfire"] = 175;
	level.var_b82f654b["specialty_ffyl"] = 176;
	level.var_b82f654b["specialty_icu"] = 177;
	level.var_b82f654b["specialty_tactiquilla"] = 178;
	level.var_b82f654b["specialty_milk"] = 145;
	level.var_b82f654b["specialty_banana"] = 137;
	level.var_b82f654b["specialty_bull_ice"] = 138;
	level.var_b82f654b["specialty_crusade"] = 139;
	level.var_b82f654b["specialty_moonshine"] = 140;
	level.var_b82f654b["specialty_changechews"] = 141;
	level.var_b82f654b["specialty_repairman"] = 142;
	level.var_b82f654b["specialty_nobear"] = 143;
	level.var_b82f654b["specialty_momentum"] = 144;
	level.var_b82f654b["specialty_spectorshot"] = 145;
	level.var_10a6f246 = [];
	level.var_10a6f246["specialty_milk"] = "zombie_perk_bottle_alt_template";
	level.var_10a6f246["specialty_banana"] = "zombie_perk_bottle_alt_template";
	level.var_10a6f246["specialty_bull_ice"] = "zombie_perk_bottle_alt_template";
	level.var_10a6f246["specialty_crusade"] = "zombie_perk_bottle_alt_template";
	level.var_10a6f246["specialty_moonshine"] = "zombie_perk_bottle_alt_template";
	level.var_10a6f246["specialty_changechews"] = "zombie_perk_bottle_alt_template";
	level.var_10a6f246["specialty_repairman"] = "zombie_perk_bottle_alt_template";
	level.var_10a6f246["specialty_nobear"] = "zombie_perk_bottle_alt_template";
	level.var_10a6f246["specialty_momentum"] = "zombie_perk_bottle_alt_template";
	level.var_10a6f246["specialty_spectorshot"] = "zombie_perk_bottle_alt_template";
	level.var_543bac32 = [];
	level.var_543bac32["specialty_doubletap2"] = 6;
	level.var_543bac32["specialty_armorvest"] = 8;
	level.var_543bac32["specialty_quickrevive"] = 0;
	level.var_543bac32["specialty_fastreload"] = 12;
	level.var_543bac32["specialty_staminup"] = 10;
	level.var_543bac32["specialty_deadshot"] = 2;
	level.var_543bac32["specialty_additionalprimaryweapon"] = 122;
	level.var_543bac32["specialty_electriccherry"] = 18;
	level.var_543bac32["specialty_widowswine"] = 20;
	level.var_543bac32["specialty_bandolier"] = 32;
	level.var_543bac32["specialty_blazephase"] = 34;
	level.var_543bac32["specialty_da_death_perception"] = 52;
	level.var_543bac32["specialty_dyingwish"] = 44;
	level.var_543bac32["specialty_razor"] = 30;
	level.var_543bac32["specialty_slider"] = 42;
	level.var_543bac32["specialty_stronghold"] = 36;
	level.var_543bac32["specialty_timeslip"] = 46;
	level.var_543bac32["specialty_victorious"] = 38;
	level.var_543bac32["specialty_winterwail"] = 28;
	level.var_543bac32["specialty_zombshell"] = 40;
	level.var_543bac32["specialty_bloodbullets"] = 62;
	level.var_543bac32["specialty_cashback"] = 74;
	level.var_543bac32["specialty_damnade"] = 78;
	level.var_543bac32["specialty_downersdelight"] = 66;
	level.var_543bac32["specialty_estatic"] = 70;
	level.var_543bac32["specialty_inferno"] = 80;
	level.var_543bac32["specialty_magnet"] = 72;
	level.var_543bac32["specialty_mh_mocha"] = 68;
	level.var_543bac32["specialty_nitrogen"] = 84;
	level.var_543bac32["specialty_nukacola"] = 64;
	level.var_543bac32["specialty_packbox"] = 76;
	level.var_543bac32["specialty_point"] = 60;
	level.var_543bac32["specialty_swarmscotch"] = 56;
	level.var_543bac32["specialty_da_phd_slider"] = 54;
	level.var_543bac32["specialty_vulture"] = 22;
	level.var_543bac32["specialty_elementalpop"] = 48;
	level.var_543bac32["specialty_da_tombstone"] = 50;
	level.var_543bac32["specialty_bloodwolf"] = 24;
	level.var_543bac32["specialty_directionalfire"] = 102;
	level.var_543bac32["specialty_ffyl"] = 116;
	level.var_543bac32["specialty_icu"] = 112;
	level.var_543bac32["specialty_tactiquilla"] = 114;
	level.var_543bac32["specialty_milk"] = 118;
	level.var_543bac32["specialty_banana"] = 96;
	level.var_543bac32["specialty_bull_ice"] = 98;
	level.var_543bac32["specialty_crusade"] = 100;
	level.var_543bac32["specialty_moonshine"] = 94;
	level.var_543bac32["specialty_changechews"] = 82;
	level.var_543bac32["specialty_repairman"] = 86;
	level.var_543bac32["specialty_nobear"] = 88;
	level.var_543bac32["specialty_momentum"] = 90;
	level.var_543bac32["specialty_spectorshot"] = 92;
	if(level.script == "zm_zod")
	{
		function_15b19a13((2216, -10273, -255), VectorScale((0, 1, 0), 90), &function_57c748b3);
		function_15b19a13((1896, -4878, 128), VectorScale((0, 1, 0), 30), &function_57c748b3);
		function_15b19a13((2671, -7599, 0), VectorScale((0, -1, 0), 135), &function_57c748b3);
		function_15b19a13((1570, -8569, 128), VectorScale((0, 1, 0), 90), &function_57c748b3);
		function_15b19a13((997, -8278, 384), VectorScale((0, -1, 0), 42), &function_57c748b3);
		function_15b19a13((5821, -2777, 256), VectorScale((0, -1, 0), 165), &function_57c748b3);
		function_15b19a13((5618, -2298, 384), VectorScale((0, 1, 0), 45), &function_57c748b3);
		function_15b19a13((2151, -2530, 260), VectorScale((0, 1, 0), 90), &function_57c748b3);
		function_15b19a13((651, -3462, 456), (0, 0, 0), &function_57c748b3);
		function_15b19a13((1298, -5520, 384), VectorScale((0, -1, 0), 90), &function_57c748b3);
		function_15b19a13((2594, -4457, -399), VectorScale((0, 1, 0), 90), &function_57c748b3);
		function_15b19a13((989, -5654, 126), (0, 0, 0), &function_57c748b3);
		function_15b19a13((2966, -5211, 0), VectorScale((0, 1, 0), 50), &function_57c748b3);
		function_15b19a13((4040, -4641, 128), VectorScale((0, 1, 0), 90), &function_57c748b3);
		function_15b19a13((6189, -4049, 128), VectorScale((0, 1, 0), 135), &function_57c748b3);
		function_15b19a13((6900, -5082, 100), VectorScale((0, 1, 0), 135), &function_57c748b3);
		function_15b19a13((6053, -3193, 512), VectorScale((0, -1, 0), 45), &function_57c748b3);
		function_15b19a13((1119, -9200, 512), VectorScale((0, -1, 0), 90), &function_57c748b3);
		function_15b19a13((1354, -3868, 88), VectorScale((0, 1, 0), 60), &function_57c748b3);
		function_15b19a13((731, -1878, 512), VectorScale((0, 1, 0), 45), &function_57c748b3);
		function_15b19a13((1399, -1486, 384), (0, 0, 0), &function_57c748b3);
		function_15b19a13((1975, -1841, 640), VectorScale((0, -1, 0), 45), &function_57c748b3);
		function_15b19a13((3247, -5614, -23), VectorScale((0, 1, 0), 135), &function_57c748b3);
		level.var_858f84bf = &function_57c748b3;
	}
	else if(level.script == "zm_factory")
	{
		function_15b19a13((-241, 615, 6), VectorScale((0, -1, 0), 90));
		function_15b19a13((-471, 69, 70), VectorScale((0, -1, 0), 135));
		function_15b19a13((-1018, -399, 67), VectorScale((0, -1, 0), 90));
		function_15b19a13((100, -1450, 191), VectorScale((0, 1, 0), 145));
		function_15b19a13((626, -1848, 64), VectorScale((0, 1, 0), 180));
		function_15b19a13((-8, -2797, 88), (0, 0, 0));
		function_15b19a13((544, -1262, 64), VectorScale((0, 1, 0), 90));
		function_15b19a13((415, 594, 57), VectorScale((0, -1, 0), 90));
		function_15b19a13((1230, -815, 69), VectorScale((0, 1, 0), 180));
		function_15b19a13((1321, 372, 65), VectorScale((0, 1, 0), 90));
		function_15b19a13((640, 43, 68), VectorScale((0, 1, 0), 90));
		function_15b19a13((924, 324, 68), VectorScale((0, -1, 0), 90));
		function_15b19a13((585, -2317, 93), VectorScale((0, 1, 0), 180));
		function_15b19a13((449, -2393, 93), VectorScale((0, -1, 0), 90));
		function_15b19a13((-272, -2332, 156), VectorScale((0, 1, 0), 90));
		function_15b19a13((-171, -458, 76), VectorScale((0, -1, 0), 90));
		function_15b19a13((-443, -1039, 67), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1406, -584, 199), (0, 0, 0));
		function_15b19a13((-620, -1048, 199), VectorScale((0, -1, 0), 90));
		function_15b19a13((117, 615, 0), VectorScale((0, -1, 0), 90));
	}
	else if(level.script == "zm_castle")
	{
		function_15b19a13((1772, 622, 47), VectorScale((0, 1, 0), 165));
		function_15b19a13((976, 2365, 440), (0, 0, 0));
		function_15b19a13((750, 3307, 680), VectorScale((0, 1, 0), 90));
		function_15b19a13((260, 2911, 896), VectorScale((0, -1, 0), 90));
		function_15b19a13((-204, 2480, 912), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1631, 2447, 824), VectorScale((0, 1, 0), 69));
		function_15b19a13((-1578, 2698, 608), VectorScale((0, -1, 0), 20));
		function_15b19a13((119, 3599, 157), VectorScale((0, -1, 0), 145));
		function_15b19a13((4008, -2204, -2291), VectorScale((0, -1, 0), 10));
		function_15b19a13((-356, 3027, 824), VectorScale((0, 1, 0), 90));
		function_15b19a13((794, 2447, 640), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1949, 2799, 417), VectorScale((0, 1, 0), 90));
		function_15b19a13((-181, 844, -7), (0, 0, 0), undefined, undefined, 1);
		function_15b19a13((1073, 1093, 179), VectorScale((0, -1, 0), 26));
		function_15b19a13((621, 3307, 672), VectorScale((0, 1, 0), 180));
		function_15b19a13((-1175, 1488, 1016), VectorScale((0, 1, 0), 175));
		function_15b19a13((-367, 2769, 824), VectorScale((0, 1, 0), 180));
		function_15b19a13((1505, 3099, 409), VectorScale((0, -1, 0), 169), undefined, undefined, 1);
		function_15b19a13((5334, -2700, -2291), VectorScale((0, 1, 0), 74));
		function_15b19a13((499, 1083, -7), VectorScale((0, -1, 0), 90), undefined, undefined, 1);
		function_15b19a13((-1268, 431, 368), VectorScale((0, -1, 0), 69));
		function_15b19a13((-477, 1495, 504), VectorScale((0, -1, 0), 151));
		function_15b19a13((-486, 3991, 664), VectorScale((0, -1, 0), 135));
		function_15b19a13((230, 4032, 760), VectorScale((0, -1, 0), 90));
		function_15b19a13((-140, 2647, 848), (0, 0, 0));
		function_15b19a13((21, 1872, 95), VectorScale((0, -1, 0), 90));
		function_15b19a13((125, 1263, 152), VectorScale((0, -1, 0), 80));
	}
	else if(level.script == "zm_island")
	{
		function_15b19a13((-198, -3104, -474), VectorScale((0, 1, 0), 74));
		function_15b19a13((1304, -1490, -471), VectorScale((0, -1, 0), 30));
		function_15b19a13((3017, -1490, -415), VectorScale((0, 1, 0), 130));
		function_15b19a13((3314, 640, -703), VectorScale((0, 1, 0), 165));
		function_15b19a13((2460, 766, -211), VectorScale((0, -1, 0), 135));
		function_15b19a13((871, 2872, -255), VectorScale((0, -1, 0), 45));
		function_15b19a13((-795, 1014, -83), VectorScale((0, -1, 0), 116));
		function_15b19a13((-2232, 846, 120), (0, 0, 0));
		function_15b19a13((-1943, -2222, -175), VectorScale((0, 1, 0), 123));
		function_15b19a13((2056, 4451, -511), VectorScale((0, 1, 0), 180));
		function_15b19a13((246, 5416, -511), VectorScale((0, -1, 0), 90));
		function_15b19a13((3303, 2133, -687), VectorScale((0, -1, 0), 32));
		function_15b19a13((401, -1583, -435), (0, 0, 0));
		function_15b19a13((2221, -1924, -419), VectorScale((0, 1, 0), 45));
		function_15b19a13((2635, -482, -404), (0, 0, 0));
		function_15b19a13((3164, 1063, -367), VectorScale((0, -1, 0), 45));
		function_15b19a13((2091, 1070, -703), VectorScale((0, -1, 0), 45));
		function_15b19a13((-200, 1570, -703), (0, 0, 0));
		function_15b19a13((-1744, 996, -82), (0, 0, 0));
		function_15b19a13((-1492, -466, -130), (0, 0, 0));
		function_15b19a13((-996, -44, 119), VectorScale((0, 1, 0), 180));
		function_15b19a13((486, 4982, -639), VectorScale((0, 1, 0), 180));
		function_15b19a13((1831, 3511, -511), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1456, 3744, -447), VectorScale((0, -1, 0), 45));
		function_15b19a13((-1508, 2917, -345), (0, 0, 0));
	}
	else if(level.script == "zm_stalingrad")
	{
		function_15b19a13((397, -263, -2), VectorScale((0, 1, 0), 100));
		function_15b19a13((240, 1361, 16), VectorScale((0, 1, 0), 145));
		function_15b19a13((527, 1238, 176), VectorScale((0, 1, 0), 133));
		function_15b19a13((-678, 3207, -191), (0, 0, 0));
		function_15b19a13((173, 2992, 320), VectorScale((0, 1, 0), 90));
		function_15b19a13((-306, 4400, 16), VectorScale((0, -1, 0), 90));
		function_15b19a13((159, 5135, 304), VectorScale((0, 1, 0), 45));
		function_15b19a13((1884, 3294, -152), VectorScale((0, -1, 0), 180));
		function_15b19a13((2327, 3493, 0), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1256, 1943, 115), VectorScale((0, 1, 0), 90));
		function_15b19a13((-2322, 3031, 496), VectorScale((0, 1, 0), 90));
		function_15b19a13((732, 3660, 6), VectorScale((0, -1, 0), 155));
		function_15b19a13((712, 2485, 24), VectorScale((0, 1, 0), 180));
		function_15b19a13((-866, 1580, 336), VectorScale((0, 1, 0), 45));
		function_15b19a13((743, 3299, 162), VectorScale((0, 1, 0), 45));
		function_15b19a13((181, 3307, 0), (0, 0, 0));
		function_15b19a13((-2356, 2592, 160), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1194, 2940, 4), VectorScale((0, -1, 0), 55));
		function_15b19a13((-830, 2355, 345), (0, 0, 0));
		function_15b19a13((-360, 4533, 145), (0, 0, 0));
		function_15b19a13((-2171, 2380, 507), VectorScale((0, -1, 0), 90));
	}
	else if(level.script == "zm_genesis")
	{
		function_15b19a13((-4726, -264, -447), VectorScale((0, 1, 0), 90), &function_77acc80d, "power_on2");
		function_15b19a13((-3944, 690, -487), VectorScale((0, -1, 0), 180), &function_77acc80d, "power_on2");
		function_15b19a13((-4302, -352, -395), VectorScale((0, 1, 0), 90), &function_77acc80d, "power_on2");
		function_15b19a13((-3988, 23, -499), VectorScale((0, 1, 0), 90), &function_77acc80d, "power_on2");
		function_15b19a13((-246, -886, -381), VectorScale((0, 1, 0), 90), &function_57c748b3);
		function_15b19a13((267, 169, -381), VectorScale((0, 1, 0), 90), &function_57c748b3);
		function_15b19a13((-2021, -3876, -1714), VectorScale((0, 1, 0), 90), &function_77acc80d, "power_on3");
		function_15b19a13((-1574, -8342, -1703), VectorScale((0, -1, 0), 40), &function_77acc80d, "power_on3");
		function_15b19a13((772, -6007, -1223), VectorScale((0, -1, 0), 163), &function_77acc80d, "power_on3");
		function_15b19a13((65, -9173, -1479), VectorScale((0, 1, 0), 135), &function_77acc80d, "power_on3");
		function_15b19a13((12, -9302, -1479), VectorScale((0, -1, 0), 45), &function_77acc80d, "power_on3");
		function_15b19a13((2075, 4166, 1226), VectorScale((0, 1, 0), 170), &function_77acc80d, "power_on1");
		function_15b19a13((809, 4519, 1226), VectorScale((0, -1, 0), 100), &function_77acc80d, "power_on1");
		function_15b19a13((1001, 4163, 1410), VectorScale((0, -1, 0), 35), &function_77acc80d, "power_on1");
		function_15b19a13((-932, 3986, 1419), VectorScale((0, 1, 0), 80), &function_77acc80d, "power_on1");
		function_15b19a13((-2767, 4046, 1138), VectorScale((0, -1, 0), 110), &function_77acc80d, "power_on1");
		function_15b19a13((-2244, 4906, 1339), VectorScale((0, -1, 0), 72), &function_77acc80d, "power_on1");
		function_15b19a13((30, 4477, 1330), VectorScale((0, -1, 0), 100), &function_77acc80d, "power_on1");
		function_15b19a13((6321, -2650, 187), VectorScale((0, 1, 0), 100), &function_77acc80d, "power_on4");
		function_15b19a13((5287, -2590, 197), VectorScale((0, 1, 0), 84), &function_77acc80d, "power_on4");
		function_15b19a13((5666, -842, 349), VectorScale((0, -1, 0), 90), &function_77acc80d, "power_on4");
		function_15b19a13((5356, -1485, 349), VectorScale((0, 1, 0), 97), &function_77acc80d, "power_on4");
		function_15b19a13((4576, -893, 349), VectorScale((0, 1, 0), 10), &function_77acc80d, "power_on4");
	}
	else if(level.script == "zm_tomb")
	{
		function_15b19a13((1435, 3711, -319), VectorScale((0, 1, 0), 90), &function_77acc80d, "power_on1");
		function_15b19a13((-567, 3692, -295), (0, 0, 0), &function_77acc80d, "power_on2");
		function_15b19a13((-976, 2900, -111), (0, 0, 0), &function_77acc80d, "power_on3");
		function_15b19a13((1926, 3391, -277), VectorScale((0, 1, 0), 135), &function_77acc80d, "power_on1");
		function_15b19a13((-508, 786, 130), VectorScale((0, 1, 0), 140), &function_77acc80d, "power_on5");
		function_15b19a13((867, 167, 140), VectorScale((0, 1, 0), 90), &function_77acc80d, "power_on4");
		function_15b19a13((79, 368, 320), VectorScale((0, -1, 0), 60), &function_77acc80d, "power_on4");
		function_15b19a13((222, -413, -237), VectorScale((0, 1, 0), 111), &function_77acc80d, "all_zones_captured");
		function_15b19a13((966, -2825, 50), VectorScale((0, 1, 0), 100), &function_77acc80d, "power_on6");
		function_15b19a13((1280, -3424, 311), VectorScale((0, 1, 0), 180), &function_77acc80d, "power_on6");
		function_15b19a13((-2263, 471, 211), VectorScale((0, 1, 0), 90), &function_77acc80d, "power_on5");
		function_15b19a13((160, 3784, -351), VectorScale((0, 1, 0), 180), &function_77acc80d, "power_on2");
		function_15b19a13((-774, 2303, -255), VectorScale((0, 1, 0), 90), &function_77acc80d, "power_on3");
		function_15b19a13((858, -2856, 312), VectorScale((0, 1, 0), 100), &function_77acc80d, "power_on6");
		function_15b19a13((734, -712, 80), VectorScale((0, -1, 0), 90), &function_77acc80d, "power_on4");
		function_15b19a13((2976, 5223, -375), VectorScale((0, -1, 0), 180), &function_77acc80d, "power_on1");
		function_15b19a13((1047, 4357, -339), VectorScale((0, -1, 0), 90), &function_77acc80d, "power_on1");
		function_15b19a13((158, 4007, -206), VectorScale((0, 1, 0), 180), &function_77acc80d, "power_on2");
		function_15b19a13((267, 2121, -125), VectorScale((0, 1, 0), 90), &function_77acc80d, "power_on3");
		function_15b19a13((-79, 2856, -259), VectorScale((0, -1, 0), 90), &function_77acc80d, "power_on3");
		function_15b19a13((-667, 2316, -111), VectorScale((0, 1, 0), 180), &function_77acc80d, "power_on3");
		function_15b19a13((2509, 961, 156), VectorScale((0, -1, 0), 135), &function_77acc80d, "power_on4");
		function_15b19a13((2491, -90, 151), VectorScale((0, -1, 0), 45), &function_77acc80d, "power_on4");
		function_15b19a13((-3019, -495, -156), VectorScale((0, 1, 0), 135), &function_77acc80d, "power_on5");
		function_15b19a13((1568, -2156, -40), VectorScale((0, -1, 0), 135), &function_77acc80d, "power_on6");
		function_15b19a13((10311, -7070, -463), VectorScale((0, -1, 0), 80), &function_77acc80d, "all_zones_captured");
		function_15b19a13((10727, -8715, -463), VectorScale((0, 1, 0), 45), &function_77acc80d, "all_zones_captured");
	}
	else if(level.script == "zm_sumpf")
	{
		function_15b19a13((10640, 906, -528), VectorScale((0, -1, 0), 180), &function_57c748b3);
		function_15b19a13((10129, 1409, -528), (0, 0, 0), &function_57c748b3);
		function_15b19a13((9536, 501, -660), VectorScale((0, 1, 0), 90), &function_57c748b3);
		function_15b19a13((10694, 548, -660), VectorScale((0, -1, 0), 135), &function_57c748b3);
		function_15b19a13((11066, -990, -701), VectorScale((0, 1, 0), 30), &function_57c748b3);
		function_15b19a13((12289, -1595, -646), VectorScale((0, 1, 0), 90), &function_57c748b3);
		function_15b19a13((8930, 1797, -657), VectorScale((0, -1, 0), 133), &function_57c748b3);
		function_15b19a13((8522, 3253, -664), VectorScale((0, 1, 0), 45), &function_57c748b3);
		function_15b19a13((11096, 3265, -665), VectorScale((0, -1, 0), 143), &function_57c748b3);
		function_15b19a13((11488, 3161, -655), VectorScale((0, 1, 0), 45), &function_57c748b3);
		function_15b19a13((10805, 1289, -669), VectorScale((0, 1, 0), 115), &function_57c748b3);
		function_15b19a13((10149, 819, -526), VectorScale((0, -1, 0), 90), &function_57c748b3);
		function_15b19a13((9934, 464, -660), VectorScale((0, 1, 0), 90), &function_57c748b3);
		function_15b19a13((10694, 619, -660), VectorScale((0, 1, 0), 135), &function_57c748b3);
		function_15b19a13((8411, 2355, -704), VectorScale((0, 1, 0), 135), &function_57c748b3);
		function_15b19a13((8275, 119, -707), VectorScale((0, -1, 0), 90), &function_57c748b3);
		function_15b19a13((9197, -751, -707), VectorScale((0, -1, 0), 30), &function_57c748b3);
		function_15b19a13((7345, -1410, -679), VectorScale((0, 1, 0), 45), &function_57c748b3);
		function_15b19a13((10826, 410, -660), VectorScale((0, -1, 0), 90), &function_57c748b3);
		function_15b19a13((12062, -600, -705), VectorScale((0, -1, 0), 111), &function_57c748b3);
		function_1dffd5fa((10676, 794, -659), VectorScale((0, -1, 0), 135));
		level.var_858f84bf = &function_57c748b3;
	}
	else if(level.script == "zm_theater")
	{
		function_15b19a13((-194, -535, 249), VectorScale((0, -1, 0), 90));
		function_15b19a13((591, -1006, 320), (0, 0, 0));
		function_15b19a13((799, 299, 168), (0, 0, 0));
		function_15b19a13((940, 1359, -15), VectorScale((0, 1, 0), 90));
		function_15b19a13((633, 1239, -15), VectorScale((0, 1, 0), 90));
		function_15b19a13((-824, -1034, 80), VectorScale((0, 1, 0), 180));
		function_15b19a13((-1151, -162, 0), VectorScale((0, -1, 0), 180));
		function_15b19a13((-1343, 954, 0), VectorScale((0, -1, 0), 180));
		function_15b19a13((-1632, 831, 168), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1104, 1311, -15), (0, 0, 0));
		function_15b19a13((530, 1059, -43), VectorScale((0, -1, 0), 154));
		function_15b19a13((595, -785, 320), (0, 0, 0));
		function_15b19a13((859, 1020, -15), (0, 0, 0));
		function_15b19a13((-732, 921, -63), (0, 0, 0));
		function_15b19a13((-393, -535, 84), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1318, -935, 79), VectorScale((0, 1, 0), 45));
		function_15b19a13((-1502, 361, 4), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1312, 1597, 169), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1166, 1047, 168), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1094, 1624, 168), VectorScale((0, -1, 0), 90));
		function_15b19a13((1167, 297, -15), (0, 0, 0));
		function_15b19a13((1640, -444, 320), VectorScale((0, 1, 0), 180));
		function_15b19a13((373, -535, 248), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1151, 163, 0), VectorScale((0, 1, 0), 180));
	}
	else if(level.script == "zm_cosmodrome")
	{
		function_15b19a13((254, 131, -303), VectorScale((0, 1, 0), 156));
		function_15b19a13((-829, 808, -95), VectorScale((0, 1, 0), 180));
		function_15b19a13((-1579, 1517, -209), VectorScale((0, 1, 0), 80));
		function_15b19a13((50, 2060, -157), VectorScale((0, -1, 0), 90));
		function_15b19a13((-506, 1245, -485), VectorScale((0, -1, 0), 90));
		function_15b19a13((-730, 1136, 220), VectorScale((0, -1, 0), 54));
		function_15b19a13((1566, 1057, 343), (0, 0, 0));
		function_15b19a13((1129, 741, -316), VectorScale((0, 1, 0), 90));
		function_15b19a13((1341, 1934, -340), VectorScale((0, -1, 0), 180));
		function_15b19a13((-477, -94, -126), VectorScale((0, -1, 0), 50));
		function_15b19a13((496, -1482, -57), VectorScale((0, 1, 0), 90));
		function_15b19a13((71, -58, -485), VectorScale((0, 1, 0), 135));
		function_15b19a13((-917, 1323, -139), VectorScale((0, 1, 0), 135));
		function_15b19a13((-631, 1496, -119), VectorScale((0, -1, 0), 90));
		function_15b19a13((203, 1151, 56), VectorScale((0, 1, 0), 90));
		function_15b19a13((1661, 1444, 343), VectorScale((0, -1, 0), 90));
		function_15b19a13((836, 1517, -180), VectorScale((0, 1, 0), 180));
		function_15b19a13((216, -606, -173), VectorScale((0, 1, 0), 90));
		function_15b19a13((-153, -1612, -150), VectorScale((0, -1, 0), 75));
	}
	else if(level.script == "zm_temple")
	{
		function_15b19a13((-389, -415, 0), (0, 0, 0));
		function_15b19a13((681, -624, -1), (0, 0, 0));
		function_15b19a13((1552, -690, 17), VectorScale((0, -1, 0), 90));
		function_15b19a13((1528, -1536, -358), VectorScale((0, 1, 0), 130));
		function_15b19a13((309, -213, -339), (0, 0, 0));
		function_15b19a13((-1000, -1324, -467), VectorScale((0, 1, 0), 45));
		function_15b19a13((-2448, -1607, -196), (0, 0, 0));
		function_15b19a13((-807, -1145, -7), VectorScale((0, 1, 0), 180));
		function_15b19a13((-764, -548, -7), VectorScale((0, -1, 0), 90));
		function_15b19a13((862, -2000, -176), VectorScale((0, 1, 0), 90));
		function_15b19a13((1433, -999, -360), VectorScale((0, -1, 0), 90));
		function_15b19a13((9, 252, -339), VectorScale((0, -1, 0), 90));
		function_15b19a13((-2007, -1409, -494), (0, 0, 0));
	}
	else if(level.script == "zm_moon")
	{
		function_15b19a13((21894, -37927, -679), VectorScale((0, -1, 0), 90), &function_57c748b3);
		function_15b19a13((-1310, 459, -189), (0, 0, 0));
		function_15b19a13((-614, 951, -213), VectorScale((0, -1, 0), 180));
		function_15b19a13((-680, 1672, -468), VectorScale((0, 1, 0), 90));
		function_15b19a13((230, 2379, -565), VectorScale((0, 1, 0), 135));
		function_15b19a13((1188, 2804, -417), VectorScale((0, 1, 0), 180));
		function_15b19a13((1282, 956, -221), VectorScale((0, -1, 0), 90));
		function_15b19a13((538, 4145, -9), VectorScale((0, -1, 0), 45));
		function_15b19a13((540, 6828, 9), VectorScale((0, -1, 0), 70));
		function_15b19a13((420, -22, -1), VectorScale((0, 1, 0), 180));
		function_15b19a13((1402, 454, -189), VectorScale((0, 1, 0), 180));
		function_15b19a13((-26, 650, -205), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1393, 1733, -363), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1031, 2043, -404), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1040, 2612, -424), VectorScale((0, -1, 0), 90));
		function_15b19a13((45, 3399, -591), VectorScale((0, 1, 0), 90));
		function_15b19a13((2434, 4514, -244), VectorScale((0, 1, 0), 90));
		function_15b19a13((1501, 5436, 15), (0, 0, 0));
		function_15b19a13((1426, 5124, -17), VectorScale((0, -1, 0), 90));
		function_15b19a13((509, 4477, 5), VectorScale((0, 1, 0), 180));
		function_15b19a13((1569, 6148, 1), VectorScale((0, 1, 0), 135));
		function_15b19a13((1114, 1880, -361), VectorScale((0, -1, 0), 90));
		function_15b19a13((1610, 747, -221), VectorScale((0, 1, 0), 135));
	}
	else if(level.script == "zm_asylum")
	{
		function_15b19a13((1264, 638, 64), VectorScale((0, -1, 0), 90));
		function_15b19a13((832, 411, 226), VectorScale((0, -1, 0), 180));
		function_15b19a13((-551, 464, 226), VectorScale((0, -1, 0), 90));
		function_15b19a13((-475, -896, 226), VectorScale((0, 1, 0), 90));
		function_15b19a13((-256, -344, 226), (0, 0, 0));
		function_15b19a13((160, 3784, -9990), VectorScale((0, 1, 0), 180));
		function_15b19a13((-774, 2303, -9990), VectorScale((0, 1, 0), 90));
		function_15b19a13((858, -2856, -9990), VectorScale((0, 1, 0), 100));
		function_15b19a13((882, 15, 64), (0, 0, 0));
		function_15b19a13((686, -161, 226), VectorScale((0, -1, 0), 90));
		function_15b19a13((244, -736, 231), VectorScale((0, 1, 0), 180));
		function_15b19a13((-805, -64, 66), VectorScale((0, -1, 0), 45));
		function_15b19a13((-926, 271, 226), VectorScale((0, -1, 0), 90));
		function_15b19a13((-559, 759, 226), VectorScale((0, 1, 0), 90));
		function_15b19a13((518, 968, 235), VectorScale((0, -1, 0), 90));
		function_15b19a13((334, 856, 64), VectorScale((0, -1, 0), 90));
		function_15b19a13((1150, 526, 64), VectorScale((0, 1, 0), 180));
		function_15b19a13((805, -188, 64), VectorScale((0, 1, 0), 90));
		function_1dffd5fa((797, -161, 226), VectorScale((0, -1, 0), 90));
	}
	else if(level.script == "zm_prototype")
	{
		function_15b19a13((318, 507, 1), VectorScale((0, 1, 0), 180));
		function_15b19a13((411, 641, 10), VectorScale((0, 1, 0), 90));
		function_15b19a13((179, 593, 145), VectorScale((0, -1, 0), 90));
		function_15b19a13((983, 671, 149), VectorScale((0, 1, 0), 135));
		function_15b19a13((170, 642, 144), VectorScale((0, 1, 0), 90));
		function_15b19a13((-154, -847, 1), VectorScale((0, 1, 0), 90));
		function_15b19a13((189, -339, 1), VectorScale((0, 1, 0), 135));
		function_15b19a13((-154, 562, 1), VectorScale((0, -1, 0), 90));
		function_15b19a13((298, 1036, 1), VectorScale((0, 1, 0), 180));
		function_15b19a13((144, -535, 1), VectorScale((0, -1, 0), 135));
		function_15b19a13((275, 175, 1), VectorScale((0, 1, 0), 135));
		function_15b19a13((797, 982, 1), VectorScale((0, -1, 0), 90));
		function_15b19a13((314, 1068, 144), VectorScale((0, 1, 0), 180));
		function_15b19a13((-129, 536, 143), VectorScale((0, -1, 0), 50));
		function_15b19a13((162, 318, 143), VectorScale((0, -1, 0), 90));
		function_15b19a13((63, 562, 1), VectorScale((0, -1, 0), 90));
		function_15b19a13((-91, 966, 1), VectorScale((0, -1, 0), 64));
		function_15b19a13((574, 838, 1), (0, 0, 0));
		function_15b19a13((135, 1073, 144), (0, 0, 0));
		function_15b19a13((830, 836, 1), (0, 0, 0));
		function_15b19a13((707, 641, 1), VectorScale((0, 1, 0), 90));
		function_1dffd5fa((1019, 897, 144), VectorScale((0, 1, 0), 180));
	}
	else
	{
		namespace_7b1eb23c::init();
	}
	level thread function_84a70493();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f7387578
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x6C70
	Size: 0x870
	Parameters: 0
	Flags: None
	Line Number: 626
*/
function function_f7387578()
{
	function_166c3f61("specialty_armorvest", "perks_missing_stock", "perks_juggernog");
	function_166c3f61("specialty_quickrevive", "perks_missing_stock", "perks_quickrevive");
	function_166c3f61("specialty_fastreload", "perks_missing_stock", "perks_speedcola");
	function_166c3f61("specialty_doubletap2", "perks_missing_stock", "perks_doubletap");
	function_166c3f61("specialty_staminup", "perks_missing_stock", "perks_staminup");
	function_166c3f61("specialty_deadshot", "perks_missing_stock", "perks_deadshot");
	function_166c3f61("specialty_additionalprimaryweapon", "perks_missing_stock", "perks_mulekick");
	function_166c3f61("specialty_electriccherry", "perks_missing_stock", "perks_cherry");
	function_166c3f61("specialty_widowswine", "perks_missing_stock", "perks_widowswine");
	function_166c3f61("specialty_elementalpop", "perks_elemental");
	function_166c3f61("specialty_vulture", "perks_vulture");
	function_166c3f61("specialty_bandolier", "perks_bandolier");
	function_166c3f61("specialty_blazephase", "perks_blaze");
	function_166c3f61("specialty_bloodwolf", "perks_bloodwolf");
	function_166c3f61("specialty_da_death_perception", "perks_perception");
	function_166c3f61("specialty_dyingwish", "perks_dyingwish");
	function_166c3f61("specialty_razor", "perks_razor");
	function_166c3f61("specialty_slider", "perks_slider");
	function_166c3f61("specialty_stronghold", "perks_stronghold");
	function_166c3f61("specialty_timeslip", "perks_timeslip");
	function_166c3f61("specialty_victorious", "perks_tortoise");
	function_166c3f61("specialty_winterwail", "perks_Winterswail");
	function_166c3f61("specialty_zombshell", "perks_zombshell");
	function_166c3f61("specialty_bloodbullets", "perks_bloodbullet");
	function_166c3f61("specialty_cashback", "perks_cashback");
	function_166c3f61("specialty_damnade", "perks_damanade");
	function_166c3f61("specialty_downersdelight", "perks_downer");
	function_166c3f61("specialty_estatic", "perks_estatic");
	function_166c3f61("specialty_inferno", "perks_brandy");
	function_166c3f61("specialty_magnet", "perks_magnet");
	function_166c3f61("specialty_mh_mocha", "perks_miracle");
	function_166c3f61("specialty_nitrogen", "perks_nitrogen");
	function_166c3f61("specialty_nukacola", "perks_nukacola");
	function_166c3f61("specialty_packbox", "perks_packbox");
	function_166c3f61("specialty_point", "perks_crusher");
	function_166c3f61("specialty_swarmscotch", "perks_swarm");
	function_166c3f61("specialty_da_phd_slider", "perks_phd");
	function_166c3f61("specialty_da_tombstone", "perks_tombstone");
	function_166c3f61("specialty_directionalfire", "perks_vigor");
	function_166c3f61("specialty_ffyl", "perks_ffyl");
	function_166c3f61("specialty_icu", "perks_icu");
	function_166c3f61("specialty_tactiquilla", "perks_tactiquilla");
	function_166c3f61("specialty_milk", "perks_milk");
	function_166c3f61("specialty_banana", "perks_banana");
	function_166c3f61("specialty_bull_ice", "perks_bull_ice");
	function_166c3f61("specialty_crusade", "perks_crusade");
	function_166c3f61("specialty_moonshine", "perks_moonshine");
	function_166c3f61("specialty_changechews", "perks_changechews");
	function_166c3f61("specialty_repairman", "perks_repairman");
	function_166c3f61("specialty_nobear", "perks_nobear");
	function_166c3f61("specialty_momentum", "perks_momentum");
	function_166c3f61("specialty_spectorshot", "perks_spectorshot");
	specialty = "specialty_whoswho";
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(isdefined(vending_triggers[i]) && isdefined(vending_triggers[i].script_noteworthy) && vending_triggers[i].script_noteworthy == specialty)
		{
			if(isdefined(vending_triggers[i].machine) && isdefined(vending_triggers[i].machine.script_noteworthy))
			{
				level thread zm_perks::perk_machine_removal(vending_triggers[i].machine.script_noteworthy);
			}
			vending_triggers[i] thread function_adb43ab();
		}
	}
	str_endon = specialty + "_power_thread_end";
	level notify(str_endon);
	level._custom_perks = Array::remove_index(level._custom_perks, specialty, 1);
	level thread function_e2896015();
}

/*
	Name: function_e2896015
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x74E8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 709
*/
function function_e2896015()
{
	level flag::wait_till("reap_collection_loaded");
	wait(4);
	level flag::set("checked_for_map_perks");
}

/*
	Name: function_19fb4047
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x7538
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 726
*/
function function_19fb4047()
{
	self notify("hash_45ed54e6");
	self endon("hash_45ed54e6");
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("Cheats_loc_test") == 0)
	{
		return;
	}
	self thread function_5ee892ae();
	self thread function_3a102353();
	self thread function_eff3941d();
	while(!isdefined(self.score))
	{
		wait(0.1);
	}
	if(self.score < 100000)
	{
		self zm_score::add_to_player_score(100000);
	}
}

/*
	Name: function_5ee892ae
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x7630
	Size: 0x300
	Parameters: 0
	Flags: None
	Line Number: 758
*/
function function_5ee892ae()
{
	var_e4211933 = newClientHudElem(self);
	var_e4211933.alignX = "center";
	var_e4211933.alignY = "middle";
	var_e4211933.horzAlign = "center";
	var_e4211933.vertAlign = "middle";
	var_e4211933.y = var_e4211933.y + 40;
	var_e4211933.foreground = 1;
	var_e4211933.fontscale = 1;
	var_e4211933.alpha = 1;
	var_e4211933.color = (1, 1, 1);
	while(1)
	{
		origin = self GetOrigin();
		if(self useButtonPressed())
		{
			var_e4211933 setText("Position:\t" + Int(origin[0]) + ", " + Int(origin[1]) + ", " + Int(origin[2]));
		}
		else
		{
			var_e4211933 setText("");
		}
		if(isdefined(level.override_perk_targetname))
		{
			structs = struct::get_array(level.override_perk_targetname, "targetname");
		}
		else
		{
			structs = struct::get_array("zm_perk_machine", "targetname");
		}
		points = GetEntArray("zm_perk_machine", "targetname");
		structs = Array::get_all_closest(origin, structs, undefined, undefined, 250);
		points = Array::get_all_closest(origin, points, undefined, undefined, 250);
		wait(2);
	}
}

/*
	Name: function_eff3941d
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x7938
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 806
*/
function function_eff3941d()
{
	var_e4211933 = newClientHudElem(self);
	var_e4211933.alignX = "center";
	var_e4211933.alignY = "middle";
	var_e4211933.horzAlign = "center";
	var_e4211933.vertAlign = "middle";
	var_e4211933.y = var_e4211933.y + 25;
	var_e4211933.foreground = 1;
	var_e4211933.fontscale = 1;
	var_e4211933.alpha = 1;
	var_e4211933.color = (1, 1, 1);
	while(1)
	{
		if(self useButtonPressed())
		{
			var_e4211933 setText(level.script);
		}
		else
		{
			var_e4211933 setText("");
		}
		wait(2);
	}
}

/*
	Name: function_3a102353
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x7A98
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 842
*/
function function_3a102353()
{
	var_e4211933 = newClientHudElem(self);
	var_e4211933.alignX = "center";
	var_e4211933.alignY = "middle";
	var_e4211933.horzAlign = "center";
	var_e4211933.vertAlign = "middle";
	var_e4211933.y = var_e4211933.y + 55;
	var_e4211933.foreground = 1;
	var_e4211933.fontscale = 1;
	var_e4211933.alpha = 1;
	var_e4211933.color = (1, 1, 1);
	while(1)
	{
		if(self useButtonPressed())
		{
			var_e4211933 setText("Angles: " + Int(self.angles[1]));
		}
		else
		{
			var_e4211933 setText("");
		}
		wait(2);
	}
}

/*
	Name: function_9bf03c1
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x7C18
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 878
*/
function function_9bf03c1(perk)
{
	while(1)
	{
		notify_name = perk + "_power_on";
		level waittill(notify_name);
		level.var_1741956d[perk] = 1;
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_84a70493
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x7C70
	Size: 0x800
	Parameters: 0
	Flags: None
	Line Number: 900
*/
function function_84a70493()
{
	level.var_1741956d = [];
	wait(0.1);
	level flag::wait_till("checked_for_map_perks");
	if(namespace_11e193f1::function_6dd41714("perks_buy_limit") != 4 || namespace_11e193f1::function_6dd41714("perks_buy_limit") > 50)
	{
		num = namespace_11e193f1::function_6dd41714("perks_buy_limit");
		level.perk_purchase_limit = num;
	}
	if(namespace_11e193f1::function_6dd41714("perks_doublebuy") == 0)
	{
		level.var_7280bfd8 = [];
	}
	if(level.var_1bfd5a74.size == 0)
	{
		return;
	}
	first = 1;
	var_cbd5309c = [];
	var_39516499 = function_5d762669(var_cbd5309c);
	var_ddf21a3f = 0;
	if(level.var_5a036fa0.size > level.var_1bfd5a74.size)
	{
		while(1)
		{
			level.var_2a48ed87 = 1;
			PERKS = Array::randomize(level.var_1bfd5a74);
			var_cbd5309c = [];
			for(i = 0; i < PERKS.size; i++)
			{
				if(!isdefined(PERKS[i]))
				{
					continue;
				}
				if(!isdefined(PERKS[i].var_807754d1))
				{
					vending_triggers = GetEntArray("zombie_vending", "targetname");
					for(j = 0; j < vending_triggers.size; j++)
					{
						if(isdefined(vending_triggers[j].machine) && vending_triggers[j].machine == PERKS[i])
						{
							PERKS[i].var_807754d1 = vending_triggers[j];
							break;
						}
					}
				}
				else if(var_ddf21a3f >= var_39516499.size)
				{
					var_ddf21a3f = 0;
					var_39516499 = function_5d762669(var_cbd5309c);
				}
				if(first)
				{
					perk = PERKS[i].var_807754d1.script_noteworthy;
				}
				else
				{
					perk = var_39516499[var_ddf21a3f];
				}
				perk_machine = PERKS[i];
				trigger = PERKS[i].var_807754d1;
				is_on = 0;
				if(isdefined(trigger.power_on) && trigger.power_on)
				{
					is_on = 1;
				}
				if(isdefined(perk_machine) && isdefined(perk_machine.origin) && isdefined(level._effect["teleport_aoe"]))
				{
					playFX(level._effect["teleport_aoe"], perk_machine.origin);
				}
				trigger.script_noteworthy = perk;
				if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].perk_machine_set_kvps))
				{
					[[level._custom_perks[perk].perk_machine_set_kvps]](trigger, perk_machine, undefined, undefined);
				}
				wait(0.1);
				wait(0.1);
				if(isdefined(trigger) && isdefined(trigger.var_231fac73))
				{
					level thread [[trigger.var_231fac73]](trigger, trigger.var_2c7b6735);
				}
				else if(isdefined(level.var_1741956d[perk]) && level.var_1741956d[perk] || is_on)
				{
					perk_machine SetModel(level.machine_assets[perk].off_model);
					wait(0.1);
					perk_machine SetModel(level.machine_assets[perk].on_model);
					trigger thread zm_perks::vending_trigger_think(1);
					trigger zm_perks::set_power_on(1);
				}
				else
				{
					perk_machine SetModel(level.machine_assets[perk].off_model);
					trigger thread zm_perks::vending_trigger_think();
					trigger zm_perks::set_power_on(0);
				}
				var_cbd5309c[perk] = 1;
				var_ddf21a3f++;
				wait(0.05);
			}
			wait(0.5);
			level clientfield::set("vulture_reset", 1);
			wait(0.5);
			level.var_2a48ed87 = undefined;
			level clientfield::set("vulture_reset", 0);
			level util::waittill_any("end_of_round", "nml_alarm_buzz");
			if(first)
			{
				first = 0;
			}
		}
	}
	else
	{
		PERKS = Array::randomize(level.var_1bfd5a74);
		for(i = 0; i < PERKS.size; i++)
		{
			if(!isdefined(PERKS[i]))
			{
				continue;
			}
			if(!isdefined(PERKS[i].var_807754d1))
			{
				vending_triggers = GetEntArray("zombie_vending", "targetname");
				for(j = 0; j < vending_triggers.size; j++)
				{
					if(isdefined(vending_triggers[j].machine) && vending_triggers[j].machine == PERKS[i])
					{
						PERKS[i].var_807754d1 = vending_triggers[j];
						break;
					}
				}
			}
			trigger = PERKS[i].var_807754d1;
			if(isdefined(trigger) && isdefined(trigger.var_231fac73))
			{
				level thread [[trigger.var_231fac73]](trigger, trigger.var_2c7b6735);
			}
		}
	}
}

/*
	Name: function_5d762669
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x8478
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 1052
*/
function function_5d762669(var_cbd5309c)
{
	var_ffccbfa6 = [];
	PERKS = Array::randomize(getArrayKeys(level.var_5a036fa0));
	for(i = 0; i < PERKS.size; i++)
	{
		if(!isdefined(var_cbd5309c[PERKS[i]]))
		{
			var_ffccbfa6[var_ffccbfa6.size] = PERKS[i];
		}
	}
	return var_ffccbfa6;
}

/*
	Name: function_15b19a13
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x8530
	Size: 0xD0
	Parameters: 5
	Flags: None
	Line Number: 1076
*/
function function_15b19a13(var_7aef55f1, var_2c81877f, var_231fac73, var_2c7b6735, var_d086dc85)
{
	perk = spawnstruct();
	perk.var_7aef55f1 = var_7aef55f1;
	perk.var_2c81877f = var_2c81877f + VectorScale((0, 1, 0), 90);
	perk.var_231fac73 = var_231fac73;
	perk.var_2c7b6735 = var_2c7b6735;
	perk.var_d086dc85 = var_d086dc85;
	level.var_6d54f498[level.var_6d54f498.size] = perk;
}

/*
	Name: function_cfaa5496
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x8608
	Size: 0x7C8
	Parameters: 2
	Flags: None
	Line Number: 1097
*/
function function_cfaa5496(specialty, var_f55b660b)
{
	if(isdefined(level.override_perk_targetname))
	{
		structs = struct::get_array(level.override_perk_targetname, "targetname");
	}
	else
	{
		structs = struct::get_array("zm_perk_machine", "targetname");
	}
	points = GetEntArray("zm_perk_machine", "targetname");
	if(isdefined(points) && points.size > 0)
	{
		structs = ArrayCombine(structs, points, 0, 0);
	}
	foreach(struct in structs)
	{
		if(function_7179730e(struct, specialty, "_snail", "specialty_nitrogen"))
		{
			return 0;
		}
		if(function_7179730e(struct, specialty, "_icu", "specialty_icu"))
		{
			return 0;
		}
		if(function_7179730e(struct, specialty, "milk", "specialty_milk"))
		{
			return 0;
		}
		if(function_7179730e(struct, specialty, "fightersfizz", "specialty_ffyl") || function_7179730e(struct, specialty, "ffyl", "specialty_ffyl"))
		{
			return 0;
		}
		if(function_7179730e(struct, specialty, "death_perception", "specialty_da_death_perception"))
		{
			return 0;
		}
		if(function_7179730e(struct, specialty, "banana", "specialty_banana"))
		{
			return 0;
		}
		if(function_7179730e(struct, specialty, "bull_ice", "specialty_bull_ice"))
		{
			return 0;
		}
		if(function_7179730e(struct, specialty, "crusader", "specialty_crusade"))
		{
			return 0;
		}
		if(function_7179730e(struct, specialty, "moonshine", "specialty_moonshine"))
		{
			return 0;
		}
		if(isdefined(struct.model) && IsSubStr(struct.model, "phd") && specialty == "specialty_da_phd_slider" || (specialty == "specialty_da_phd_slider" && struct.script_noteworthy == "specialty_phdflopper"))
		{
			struct.script_noteworthy = "specialty_da_phd_slider";
			return 0;
		}
		if(isdefined(struct.model) && IsSubStr(struct.model, "elemental") || (struct.script_noteworthy == "specialty_tracer" && level.script == "zm_log_kowloon") && specialty == "specialty_elementalpop")
		{
			struct.script_noteworthy = "specialty_elementalpop";
			return 0;
		}
		if(isdefined(struct.model) && IsSubStr(struct.model, "tombstone") && specialty == "specialty_da_tombstone" || (specialty == "specialty_da_tombstone" && struct.script_noteworthy == "specialty_tombstone"))
		{
			struct.script_noteworthy = "specialty_da_tombstone";
			return 0;
		}
		if(isdefined(struct.script_noteworthy) && struct.script_noteworthy == specialty && specialty == "specialty_vultureaid" || (isdefined(struct.model) && IsSubStr(struct.model, "vulture")))
		{
			struct.script_noteworthy = "specialty_vulture";
			return 0;
		}
		if(isdefined(struct.model) && IsSubStr(struct.model, "whoswho") || (isdefined(struct.model) && IsSubStr(struct.model, "chugabud")) || struct.script_noteworthy == "specialty_whoswho")
		{
			if(ToLower(GetDvarString("mapname")) == "zm_die")
			{
				struct.script_noteworthy = "specialty_da_tombstone";
				return 0;
			}
			else
			{
				struct.targetname = "";
				struct.script_noteworthy = "";
				return 0;
			}
		}
		if(isdefined(struct.model) && IsSubStr(struct.model, "reserve_soda") && specialty == "specialty_bandolier" || (struct.script_noteworthy == "specialty_reserve" && specialty == "specialty_bandolier"))
		{
			struct.script_noteworthy = "specialty_bandolier";
			return 0;
		}
		if(struct.script_noteworthy == "specialty_vigor_rush" && specialty == "specialty_directionalfire")
		{
			struct.script_noteworthy = "specialty_directionalfire";
			return 0;
		}
		if(isdefined(struct.script_noteworthy) && struct.script_noteworthy == specialty)
		{
			if(specialty == "specialty_victorious")
			{
				struct.angles = struct.angles + VectorScale((0, 1, 0), 90);
			}
			return 0;
		}
	}
	return 1;
}

/*
	Name: function_7179730e
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x8DD8
	Size: 0x88
	Parameters: 4
	Flags: None
	Line Number: 1216
*/
function function_7179730e(struct, specialty, var_6e2f79db, var_14289bfa)
{
	if(isdefined(struct.model) && IsSubStr(struct.model, "death_perception") && specialty == var_14289bfa)
	{
		struct.script_noteworthy = var_14289bfa;
		return 1;
	}
	return 0;
}

/*
	Name: function_166c3f61
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x8E68
	Size: 0xA0
	Parameters: 3
	Flags: None
	Line Number: 1236
*/
function function_166c3f61(specialty, var_e6d6ce49, var_f55b660b)
{
	if(function_cfaa5496(specialty))
	{
		level thread function_b34c857f(specialty, var_e6d6ce49, var_f55b660b);
		level thread function_9bf03c1(specialty);
	}
	else if(isdefined(var_f55b660b))
	{
		level thread function_b34c857f(specialty, var_e6d6ce49, var_f55b660b);
	}
}

/*
	Name: function_1cf86d92
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x8F10
	Size: 0x6E0
	Parameters: 5
	Flags: None
	Line Number: 1259
*/
function function_1cf86d92(origin, angles, perk, model, var_cdc9f3b3)
{
	level flag::wait_till("reap_collection_loaded");
	wait(0.25);
	t_use = spawn("trigger_radius_use", origin + VectorScale((0, 0, 1), 30), 0, 40, 130);
	t_use.targetname = "zombie_vending";
	t_use.script_noteworthy = perk;
	t_use TriggerIgnoreTeam();
	if(isdefined(var_cdc9f3b3))
	{
		t_use.var_231fac73 = var_cdc9f3b3.var_231fac73;
		t_use.var_2c7b6735 = var_cdc9f3b3.var_2c7b6735;
	}
	perk_machine = spawn("script_model", origin);
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	perk_machine.angles = angles;
	perk_machine SetModel(model);
	t_use.machine = perk_machine;
	t_use.script_sound = "mus_perks_speed_jingle";
	t_use.script_string = "speedcola_perk";
	t_use.script_label = "mus_perks_speed_sting";
	t_use.target = "vending_sleight";
	perk_machine.script_string = "speedcola_perk";
	perk_machine.targetname = "vending_sleight";
	wait(0.2);
	t_use thread zm_perks::vending_trigger_think();
	t_use thread zm_perks::electric_perks_dialog();
	wait(0.5);
	if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].perk_machine_set_kvps))
	{
		[[level._custom_perks[perk].perk_machine_set_kvps]](t_use, perk_machine, undefined, undefined);
	}
	if(isdefined(level._custom_perks[perk].perk_machine_thread))
	{
		level thread [[level._custom_perks[perk].perk_machine_thread]]();
	}
	if(isdefined(level._custom_perks[perk].perk_machine_power_override_thread))
	{
		if(namespace_851dc78f::function_20dc5a15(perk) || (level.script == "zm_tomb" && (perk == "specialty_doubletap2" || perk == "specialty_widowswine" || perk == "specialty_deadshot" || perk == "specialty_electriccherry")))
		{
			level thread [[level._custom_perks[perk].perk_machine_power_override_thread]](perk);
		}
		else if(level.script == "zm_sumpf" && perk != "specialty_quickrevive" && perk != "specialty_fastreload" && perk != "specialty_additionalprimaryweapon" && perk != "specialty_doubletap2" && perk != "specialty_armorvest")
		{
			level thread [[level._custom_perks[perk].perk_machine_power_override_thread]](perk);
		}
		else
		{
			level thread [[level._custom_perks[perk].perk_machine_power_override_thread]]();
		}
	}
	else if(isdefined(level._custom_perks[perk].alias) && isdefined(level._custom_perks[perk].radiant_machine_name) && isdefined(level._custom_perks[perk].machine_light_effect))
	{
		level thread zm_perks::perk_machine_think(perk, level._custom_perks[perk]);
	}
	wait(0.5);
	powered_on = zm_perks::get_perk_machine_start_state(perk);
	powered_perk = zm_power::add_powered_item(&zm_power::perk_power_on, &zm_power::perk_power_off, &zm_power::perk_range, &zm_power::cost_low_if_local, 0, powered_on, t_use);
	if(isdefined(t_use.script_int))
	{
		powered_perk thread zm_power::zone_controlled_perk(t_use.script_int);
	}
	wait(0.5);
	if(level flag::get("power_on"))
	{
		if(isdefined(powered_perk.power) && powered_perk.power)
		{
			powered_perk [[powered_perk.power_on_func]]();
			if(isdefined(level.machine_assets[perk].on_model))
			{
				perk_machine SetModel(level.machine_assets[perk].on_model);
			}
		}
		else
		{
			powered_perk zm_power::global_power(1);
			if(isdefined(level.machine_assets[perk].off_model))
			{
				perk_machine SetModel(level.machine_assets[perk].off_model);
			}
		}
	}
	else
	{
		perk_machine SetModel(level.machine_assets[perk].off_model);
	}
	level notify(perk + "_initialised");
}

/*
	Name: function_b34c857f
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x95F8
	Size: 0x7E8
	Parameters: 3
	Flags: None
	Line Number: 1361
*/
function function_b34c857f(specialty, var_e6d6ce49, var_f55b660b)
{
	level flag::wait_till("reap_collection_loaded");
	wait(0.1);
	var_43178103 = 0;
	var_501b7271 = 1;
	perk_random = 1;
	structs = struct::get_array("zm_perk_machine", "targetname");
	if(isdefined(level.override_perk_targetname))
	{
		structs = struct::get_array(level.override_perk_targetname, "targetname");
	}
	structs = ArrayCombine(structs, GetEntArray("zm_perk_machine", "targetname"), 0, 0);
	structs = ArrayCombine(structs, GetEntArray("zombie_vending", "targetname"), 0, 0);
	var_52d2e9d0 = 0;
	foreach(struct in structs)
	{
		if(isdefined(struct.script_noteworthy))
		{
			if(struct.script_noteworthy == specialty)
			{
				var_43178103 = 1;
				var_501b7271 = 0;
				perk_random = 0;
				var_52d2e9d0 = 1;
			}
		}
	}
	if(namespace_11e193f1::function_6dd41714("perks_random_perks") == 1 && !isdefined(var_f55b660b))
	{
		if(RandomInt(100) < 40)
		{
			var_43178103 = 1;
		}
	}
	else if(!isdefined(var_e6d6ce49))
	{
		var_43178103 = 1;
	}
	else if(isdefined(var_e6d6ce49) && namespace_11e193f1::function_6dd41714(var_e6d6ce49) == 1)
	{
		var_43178103 = 1;
	}
	if(var_e6d6ce49 == "perks_missing_stock")
	{
		if(isdefined(level._random_perk_machine_perk_list))
		{
			keys = getArrayKeys(level._random_perk_machine_perk_list);
			for(i = 0; i < keys.size; i++)
			{
				if(level._random_perk_machine_perk_list[keys[i]] == specialty)
				{
					var_501b7271 = 0;
				}
			}
		}
		else if(!var_52d2e9d0 && (!(isdefined(isdefined(var_f55b660b) && namespace_11e193f1::function_6dd41714(var_f55b660b) == 1) && isdefined(var_f55b660b) && namespace_11e193f1::function_6dd41714(var_f55b660b) == 1)))
		{
			var_43178103 = 1;
			perk_random = 1;
		}
	}
	if(isdefined(var_f55b660b) && namespace_11e193f1::function_6dd41714(var_f55b660b) == 1)
	{
		var_43178103 = 0;
		var_501b7271 = 1;
		if(isdefined(level._random_perk_machine_perk_list))
		{
			keys = getArrayKeys(level._random_perk_machine_perk_list);
			for(i = 0; i < keys.size; i++)
			{
				if(level._random_perk_machine_perk_list[keys[i]] == specialty)
				{
					level._random_perk_machine_perk_list[keys[i]] = undefined;
				}
			}
		}
	}
	else if(var_43178103 && perk_random)
	{
		if(!isdefined(level.var_af1f90e1))
		{
			level.var_af1f90e1 = Array::randomize(level.var_6d54f498);
			level.var_20e7b3f7 = 0;
		}
		if(isdefined(level.var_af1f90e1[level.var_20e7b3f7]))
		{
			struc = level.var_af1f90e1[level.var_20e7b3f7];
			var_7aef55f1 = struc.var_7aef55f1;
			var_2c81877f = struc.var_2c81877f;
			level thread function_1cf86d92(var_7aef55f1, var_2c81877f, specialty, "zombie_powerup_weaponup_arrow", struc);
			level.var_20e7b3f7++;
		}
		else
		{
			level thread zm_perks::perk_machine_think(specialty, level._custom_perks[specialty]);
		}
		level thread function_8d25c704(specialty);
	}
	else if(var_501b7271)
	{
		vending_triggers = GetEntArray("zombie_vending", "targetname");
		for(i = 0; i < vending_triggers.size; i++)
		{
			if(isdefined(vending_triggers[i]) && isdefined(vending_triggers[i].machine) && isdefined(vending_triggers[i].machine.script_noteworthy) && vending_triggers[i].machine.script_noteworthy == specialty)
			{
				level thread zm_perks::perk_machine_removal(vending_triggers[i].machine.script_noteworthy);
				vending_triggers[i] thread function_adb43ab();
			}
		}
		str_endon = specialty + "_power_thread_end";
		level notify(str_endon);
		if(isdefined(level._custom_perks[specialty]))
		{
			level._custom_perks[specialty] = undefined;
			level._custom_perks = Array::remove_index(level._custom_perks, specialty, 1);
		}
	}
	points = GetEntArray("zm_perk_machine", "targetname");
	if(isdefined(points) && points.size > 0)
	{
		for(i = 0; i < points.size; i++)
		{
			if(isdefined(points[i].script_noteworthy) && points[i].script_noteworthy == specialty)
			{
				points[i] delete();
			}
		}
	}
}

/*
	Name: function_e3887522
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0x9DE8
	Size: 0x3A8
	Parameters: 0
	Flags: None
	Line Number: 1502
*/
function function_e3887522()
{
	level flag::wait_till("reap_collection_loaded");
	wait(1);
	if(namespace_11e193f1::function_6dd41714("perks_map_location") > 0)
	{
		structs = struct::get_array("zm_perk_machine", "targetname");
		if(isdefined(level.override_perk_targetname))
		{
			structs = struct::get_array(level.override_perk_targetname, "targetname");
		}
		filtered = [];
		if(namespace_11e193f1::function_6dd41714("perks_map_location") == 1)
		{
			for(i = 0; i < structs.size; i++)
			{
				if(isdefined(structs[i].script_noteworthy) && (structs[i].script_noteworthy != "specialty_armorvest" && structs[i].script_noteworthy != "specialty_quickrevive" && structs[i].script_noteworthy != "specialty_fastreload" && structs[i].script_noteworthy != "specialty_doubletap2"))
				{
					filtered[filtered.size] = structs[i];
				}
			}
		}
		else
		{
			for(i = 0; i < structs.size; i++)
			{
				if(!(isdefined(level.script == "zm_moon" && (structs[i].script_noteworthy == "specialty_armorvest" || structs[i].script_noteworthy == "specialty_fastreload")) && level.script == "zm_moon" && (structs[i].script_noteworthy == "specialty_armorvest" || structs[i].script_noteworthy == "specialty_fastreload")))
				{
					filtered[filtered.size] = structs[i];
				}
			}
		}
		for(i = 0; i < filtered.size; i++)
		{
			if(level.script == "zm_moon")
			{
				if(isdefined(level.start_locations))
				{
					for(a = 0; a < level.start_locations.size; a++)
					{
						if(Distance(level.start_locations[a].origin, filtered[i].origin) < 10)
						{
							level thread function_94dedbc8(filtered[i]);
							continue;
						}
					}
				}
			}
			level thread function_7d6efafe(filtered[i].script_noteworthy);
		}
		return;
	}
}

/*
	Name: function_94dedbc8
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xA198
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 1566
*/
function function_94dedbc8(perk_struct)
{
	perk = "";
	wait(1);
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(Distance(vending_triggers[i].origin, perk_struct.origin) < 10)
		{
			perk = vending_triggers[i].script_noteworthy;
		}
	}
	level waittill(perk + "_unhide");
	level thread function_7d6efafe(perk);
}

/*
	Name: function_7d6efafe
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xA2A0
	Size: 0x260
	Parameters: 1
	Flags: None
	Line Number: 1592
*/
function function_7d6efafe(specialty)
{
	wait(1);
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(isdefined(vending_triggers[i]) && isdefined(vending_triggers[i].script_noteworthy) && vending_triggers[i].script_noteworthy == specialty)
		{
			machine = vending_triggers[i].machine;
			perk = spawnstruct();
			if(isdefined(machine) && isdefined(machine.origin) && isdefined(machine.angles))
			{
				perk.var_7aef55f1 = machine.origin;
				perk.var_2c81877f = machine.angles;
				return;
			}
			else
			{
			}
			perk.var_231fac73 = undefined;
			perk.var_2c7b6735 = undefined;
			perk.var_16e36c5e = 1;
			level.var_6d54f498[level.var_6d54f498.size] = perk;
			if(level.script == "zm_tomb")
			{
				perk thread function_d1034cae(specialty, vending_triggers[i]);
			}
			if(level.script == "zm_genesis")
			{
				perk thread function_98911b11(specialty, vending_triggers[i]);
			}
			if(isdefined(level.var_858f84bf))
			{
				perk.var_231fac73 = level.var_858f84bf;
			}
		}
	}
	level thread function_8d25c704(specialty);
	wait(0.1);
	level notify(specialty + "_initialised");
}

/*
	Name: function_d1034cae
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xA508
	Size: 0x1E0
	Parameters: 2
	Flags: None
	Line Number: 1644
*/
function function_d1034cae(specialty, trig)
{
	self.var_231fac73 = &function_77acc80d;
	self.var_2c7b6735 = "power_on1";
	level._custom_perks[specialty].perk_machine_power_override_thread = undefined;
	level thread zm_perks::perk_machine_think(specialty, level._custom_perks[specialty]);
	if(specialty == "specialty_quickrevive")
	{
		level.zone_capture.zones["generator_start_bunker"].perk_machines["revive"] = undefined;
	}
	if(specialty == "specialty_fastreload")
	{
		level.zone_capture.zones["generator_mid_trench"].perk_machines["sleight"] = undefined;
		self.var_2c7b6735 = "power_on3";
	}
	if(specialty == "specialty_armorvest")
	{
		level.zone_capture.zones["generator_nml_right"].perk_machines["juggernog"] = undefined;
		self.var_2c7b6735 = "power_on4";
	}
	if(specialty == "specialty_staminup")
	{
		level.zone_capture.zones["generator_nml_left"].perk_machines["marathon"] = undefined;
		self.var_2c7b6735 = "power_on5";
	}
	if(specialty == "specialty_additionalprimaryweapon")
	{
		self.var_2c7b6735 = "all_zones_captured";
	}
	trig.var_2c7b6735 = self.var_2c7b6735;
	trig.var_231fac73 = self.var_231fac73;
}

/*
	Name: function_98911b11
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xA6F0
	Size: 0x150
	Parameters: 2
	Flags: None
	Line Number: 1687
*/
function function_98911b11(specialty, trig)
{
	self.var_231fac73 = &function_77acc80d;
	self.var_2c7b6735 = "power_on2";
	level._custom_perks[specialty].perk_machine_power_override_thread = undefined;
	level thread zm_perks::perk_machine_think(specialty, level._custom_perks[specialty]);
	if(specialty == "specialty_fastreload")
	{
		self.var_2c7b6735 = "power_on4";
	}
	if(specialty == "specialty_armorvest")
	{
		self.var_231fac73 = &function_57c748b3;
		self.var_2c7b6735 = undefined;
	}
	if(specialty == "specialty_staminup" || specialty == "specialty_widowswine")
	{
		self.var_2c7b6735 = "power_on3";
	}
	if(specialty == "specialty_additionalprimaryweapon" || specialty == "specialty_doubletap2")
	{
		self.var_2c7b6735 = "power_on1";
	}
	trig.var_2c7b6735 = self.var_2c7b6735;
	trig.var_231fac73 = self.var_231fac73;
}

/*
	Name: function_8d25c704
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xA848
	Size: 0x210
	Parameters: 1
	Flags: None
	Line Number: 1724
*/
function function_8d25c704(specialty)
{
	level flag::wait_till("reap_collection_loaded");
	if(!isdefined(level.var_5a036fa0))
	{
		level.var_5a036fa0 = [];
	}
	level.var_5a036fa0[specialty] = 1;
	level waittill(specialty + "_initialised");
	level notify(specialty + "_reap_enabled");
	if(!isdefined(level._random_perk_machine_perk_list))
	{
		level._random_perk_machine_perk_list = [];
	}
	if(!isdefined(level._random_perk_machine_perk_list))
	{
		level._random_perk_machine_perk_list = [];
	}
	else if(!IsArray(level._random_perk_machine_perk_list))
	{
		level._random_perk_machine_perk_list = Array(level._random_perk_machine_perk_list);
	}
	level._random_perk_machine_perk_list[level._random_perk_machine_perk_list.size] = specialty;
	wait(1);
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(isdefined(vending_triggers[i]) && isdefined(vending_triggers[i].script_noteworthy) && vending_triggers[i].script_noteworthy == specialty)
		{
			if(!isdefined(vending_triggers[i].machine))
			{
				continue;
			}
			vending_triggers[i].machine.var_807754d1 = vending_triggers[i];
			level.var_1bfd5a74[level.var_1bfd5a74.size] = vending_triggers[i].machine;
		}
	}
}

/*
	Name: function_adb43ab
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xAA60
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1773
*/
function function_adb43ab()
{
	wait(0.1);
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.machine))
	{
		self.machine delete();
	}
	if(isdefined(self.bump_trigger))
	{
		self.bump_trigger delete();
	}
	if(isdefined(self.clip))
	{
		self.clip delete();
	}
	if(isdefined(self))
	{
		self delete();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4b312505
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xAB18
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 1810
*/
function function_4b312505()
{
	wait(0.5);
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(isdefined(vending_triggers[i].bump_trigger))
		{
			vending_triggers[i].bump_trigger delete();
			vending_triggers[i].bump_trigger = undefined;
		}
	}
	vending_triggers = GetEntArray("audio_bump_trigger", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		vending_triggers[i] delete();
	}
}

/*
	Name: check_for_change
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xAC38
	Size: 0x508
	Parameters: 0
	Flags: None
	Line Number: 1839
*/
function check_for_change()
{
	self endon("death");
	self notify("check_for_change");
	self endon("check_for_change");
	if(!isdefined(level.var_9fb6373f))
	{
		level.var_9fb6373f = [];
	}
	near = 0;
	while(1)
	{
		vending_triggers = GetEntArray("zombie_vending", "targetname");
		for(i = 0; i < vending_triggers.size; i++)
		{
			if(!isdefined(self.origin) || !isdefined(vending_triggers[i]) || !isdefined(vending_triggers[i].origin))
			{
				wait(0.1);
				continue;
			}
			if(DistanceSquared(vending_triggers[i].origin, self.origin) < 4900)
			{
				if(self GetStance() == "prone" && isdefined(vending_triggers[i].script_noteworthy) && !isdefined(level.var_9fb6373f[vending_triggers[i].script_noteworthy]))
				{
					self zm_score::add_to_player_score(100);
					zm_utility::play_sound_at_pos("purchase", self.origin);
					level.var_9fb6373f[vending_triggers[i].script_noteworthy] = 0;
				}
				if(!near)
				{
					vending_triggers[i] playsound("zmb_perks_bump_bottle");
					near = 1;
				}
			}
			if(!isdefined(vending_triggers[i].var_b758e02c) && isdefined(vending_triggers[i].machine) && isdefined(vending_triggers[i].machine.origin) && DistanceSquared(vending_triggers[i].origin, self.origin) < 80000)
			{
				collision = spawn("script_model", vending_triggers[i].machine.origin, 1);
				collision.angles = vending_triggers[i].machine.angles;
				collision SetModel("zm_collision_perks1");
				collision.script_noteworthy = "clip";
				vending_triggers[i].var_b758e02c = collision;
				collision LinkTo(vending_triggers[i].machine);
				continue;
			}
			if(isdefined(vending_triggers[i].var_b758e02c) && DistanceSquared(vending_triggers[i].origin, self.origin) > 40000)
			{
				if(!function_6b98fb76(vending_triggers[i]))
				{
					vending_triggers[i].var_b758e02c delete();
					vending_triggers[i].var_b758e02c = undefined;
				}
			}
		}
		wait(0.1);
		if(near)
		{
			var_70616e65 = 1;
			vending_triggers = GetEntArray("zombie_vending", "targetname");
			for(i = 0; i < vending_triggers.size; i++)
			{
				if(DistanceSquared(vending_triggers[i].origin, self.origin) < 4900)
				{
					var_70616e65 = 0;
				}
			}
			if(var_70616e65)
			{
				near = 0;
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_6b98fb76
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xB148
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 1923
*/
function function_6b98fb76(var_807754d1)
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(DistanceSquared(var_807754d1.origin, players[i].origin) < 40000)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_57c748b3
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xB1F0
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 1946
*/
function function_57c748b3(perk, arg)
{
	if(!isdefined(perk) || !isdefined(perk.script_noteworthy))
	{
		return;
	}
	wait(0.5);
	while(!isdefined(level._custom_perks[perk.script_noteworthy]))
	{
		wait(1);
	}
	perk thread zm_perks::set_power_on(1);
	perk thread zm_perks::vending_trigger_think(1);
	perk.machine thread function_539a8726(perk.script_noteworthy);
}

/*
	Name: function_77acc80d
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xB2C0
	Size: 0x308
	Parameters: 2
	Flags: None
	Line Number: 1972
*/
function function_77acc80d(perk, arg)
{
	if(!isdefined(perk) || !isdefined(perk.script_noteworthy))
	{
		return;
	}
	level notify(perk.script_noteworthy + "_origins_power");
	level endon(perk.script_noteworthy + "_origins_power");
	is_on = 0;
	while(!level flag::exists(arg))
	{
		wait(1);
	}
	if(level flag::get(arg))
	{
		is_on = 1;
	}
	if(!isdefined(level.var_bfb968a))
	{
		level.var_bfb968a = [];
	}
	wait(1);
	while(!isdefined(level._custom_perks[perk.script_noteworthy]))
	{
		wait(1);
	}
	var_fb1cd1b2 = level._custom_perks[perk.script_noteworthy].alias + "_on";
	str_off = level._custom_perks[perk.script_noteworthy].alias + "_off";
	while(1)
	{
		if(is_on)
		{
			if(isdefined(level.var_bfb968a[perk.script_noteworthy]))
			{
				level.var_bfb968a[perk.script_noteworthy] = undefined;
			}
			perk thread zm_perks::set_power_on(1);
			perk thread zm_perks::vending_trigger_think(1);
			perk.machine thread function_539a8726(perk.script_noteworthy);
			level flag::wait_till_clear(arg);
			is_on = 0;
		}
		else
		{
			perk thread zm_perks::set_power_on(0);
			perk thread zm_perks::vending_trigger_think(0);
			level.var_bfb968a[perk.script_noteworthy] = 1;
			perk thread function_276ec946();
			perk.machine thread function_466b375c(perk.script_noteworthy);
			level flag::wait_till(arg);
			is_on = 1;
		}
	}
	return;
}

/*
	Name: function_539a8726
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xB5D0
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 2038
*/
function function_539a8726(perk)
{
	s_custom_perk = level._custom_perks[perk];
	self SetModel(level.machine_assets[perk].on_model);
	self playsound("zmb_perks_power_on");
	self thread zm_perks::perk_fx(s_custom_perk.machine_light_effect);
	self thread zm_perks::play_loop_on_machine();
	return;
}

/*
	Name: function_466b375c
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xB688
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 2058
*/
function function_466b375c(perk)
{
	s_custom_perk = level._custom_perks[perk];
	self SetModel(level.machine_assets[perk].off_model);
	self notify("stop_loopsound");
	zm_perks::perk_fx(undefined, 1);
}

/*
	Name: function_276ec946
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xB710
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2076
*/
function function_276ec946()
{
	self setHintString(&"ZOMBIE_NEED_POWER");
}

/*
	Name: on_player_spawned
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xB740
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 2091
*/
function on_player_spawned()
{
	self thread function_332a11ed();
	self thread function_49b5095a();
	self thread function_9c21634b();
	self thread function_19fb4047();
	self thread check_for_change();
}

/*
	Name: function_92241174
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xB7C8
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 2110
*/
function function_92241174()
{
	wait(0.1);
	level flag::wait_till("all_players_connected");
	zombie_utility::set_zombie_var("zombie_perk_juggernaut_health", 100);
	zombie_utility::set_zombie_var("zombie_perk_juggernaut_health_upgrade", 150);
	level thread function_ec970c6();
	zm_spawner::register_zombie_death_event_callback(&function_49c7236b);
	zm_spawner::register_zombie_death_event_callback(&function_93a1cd40);
	zm_spawner::register_zombie_damage_callback(&function_102a89da);
	if(!isdefined(level.perk_damage_override))
	{
		level.perk_damage_override = [];
	}
	Array::add(level.perk_damage_override, &function_210fd5ca, 0);
}

/*
	Name: function_332a11ed
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xB8F8
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 2137
*/
function function_332a11ed()
{
	self notify("hash_75999b1");
	self endon("hash_75999b1");
	while(1)
	{
		self waittill("damage", ammount);
		if(namespace_11e193f1::function_6dd41714("gamemode_onehit") > 0)
		{
			if(namespace_11e193f1::function_6dd41714("gamemode_onehit") > 1)
			{
				max = 1;
			}
			else
			{
				max = 40;
				if(self hasPerk("specialty_armorvest"))
				{
					max = max + 20;
				}
			}
		}
		else
		{
			max = level.zombie_vars["player_base_health"];
			if(self hasPerk("specialty_armorvest"))
			{
				max = max + level.zombie_vars["zombie_perk_juggernaut_health"];
			}
		}
		if(self.maxhealth < max)
		{
			self.maxhealth = max;
			self.health = self.maxhealth - ammount;
		}
		if(self.health > self.maxhealth)
		{
			self.health = self.maxhealth - ammount;
		}
		if(self.health <= 0 || (isdefined(level.var_7302f960) && level.var_7302f960 && RandomInt(20) == 0))
		{
			self DoDamage(self.maxhealth, self.origin);
		}
	}
}

/*
	Name: function_210fd5ca
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xBAF0
	Size: 0x338
	Parameters: 10
	Flags: None
	Line Number: 2193
*/
function function_210fd5ca(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!self namespace_851dc78f::function_b690a849("specialty_armorvest") || (!(isdefined(self.var_4a36157d) && self.var_4a36157d > 0)))
	{
		return undefined;
	}
	var_6bfdf47a = 1;
	if(isdefined(sMeansOfDeath))
	{
		if(self namespace_851dc78f::function_5f9a13b3("specialty_slider") || self namespace_851dc78f::function_5f9a13b3("specialty_da_phd_slider") || self bgb::is_enabled("zm_bgb_danger_closest"))
		{
			if(sMeansOfDeath == "MOD_ELECTOCUTED" || sMeansOfDeath == "MOD_EXPLOSIVE" || sMeansOfDeath == "MOD_EXPLOSIVE_SPLASH" || sMeansOfDeath == "MOD_FALLING" || sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_PROJECTILE" || sMeansOfDeath == "MOD_PROJECTILE_SPLASH" || sMeansOfDeath == "MOD_GRENADE_SPLASH" || sMeansOfDeath == "MOD_SUICIDE" || sMeansOfDeath == "MOD_IMPACT")
			{
				var_6bfdf47a = 0;
			}
		}
		if(sMeansOfDeath == "MOD_PROJECTILE" || sMeansOfDeath == "MOD_PROJECTILE_SPLASH" || sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_GRENADE_SPLASH" || sMeansOfDeath == "MOD_EXPLOSIVE")
		{
			if(isdefined(weapon) && isdefined(weapon.name) && (weapon.name == "ray_gun" || weapon.name == "ray_gun_upgraded"))
			{
				if(self.health > 25 && iDamage > 25)
				{
					var_6bfdf47a = 0;
				}
			}
			else if(self.health > 75 && iDamage > 75)
			{
				var_6bfdf47a = 0;
			}
		}
	}
	if(self.health <= iDamage && var_6bfdf47a)
	{
		self.health = 1;
		self.var_4a36157d = self.var_4a36157d - 1;
		self thread namespace_4b6e359c::function_75aa16e4("specialty_armorvest", "juggernaut", "overlayStyleCounter", self.var_4a36157d + 1);
		return 0;
	}
	return undefined;
}

/*
	Name: function_d5c02d81
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xBE30
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 2244
*/
function function_d5c02d81()
{
	self.var_4a36157d = 2;
	self thread namespace_4b6e359c::function_75aa16e4("specialty_armorvest", "juggernaut", "overlayStyleCounter", self.var_4a36157d + 1);
	self thread function_67a5f97();
}

/*
	Name: function_c9e7ddeb
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xBEA0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 2261
*/
function function_c9e7ddeb()
{
	self.var_4a36157d = 0;
	self thread namespace_4b6e359c::function_75aa16e4("specialty_armorvest", "juggernaut", "overlayStyleCounter", self.var_4a36157d);
}

/*
	Name: function_67a5f97
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xBEF0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 2277
*/
function function_67a5f97()
{
	self notify("hash_67a5f97");
	self endon("hash_67a5f97");
	while(self namespace_851dc78f::function_b690a849("specialty_armorvest"))
	{
		self.var_4a36157d = 2;
		self thread namespace_4b6e359c::function_75aa16e4("specialty_armorvest", "juggernaut", "overlayStyleCounter", self.var_4a36157d + 1);
		level waittill("between_round_over");
	}
	self thread namespace_4b6e359c::function_75aa16e4("specialty_armorvest", "juggernaut", "overlayStyleCounter", 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7a1baa03
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xBFC0
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 2302
*/
function function_7a1baa03()
{
	self notify("hash_1c5af90a");
	self endon("hash_1c5af90a");
	while(self namespace_851dc78f::function_b690a849("specialty_fastreload"))
	{
		self waittill("reload");
		if(self namespace_851dc78f::function_b690a849("specialty_fastreload"))
		{
			weapondata = [];
			weapon = self GetCurrentWeapon();
			weapondata["weapon"] = weapon;
			if(weapondata["weapon"] != level.weaponNone)
			{
				weapondata["clip_current"] = self GetWeaponAmmoClip(weapon);
				weapondata["clip"] = weapon.clipSize;
				pow = 1 - weapondata["clip_current"] / weapondata["clip"];
				self thread function_24eb8414(pow);
			}
		}
	}
}

/*
	Name: function_24eb8414
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xC120
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 2335
*/
function function_24eb8414(pow)
{
	self notify("hash_24eb8414");
	self endon("hash_24eb8414");
	if(!isdefined(self.var_f9046461) || (isdefined(self.var_f9046461) && self.var_f9046461 < pow))
	{
		self.var_f9046461 = pow;
	}
	var_64d5914 = self.var_f9046461;
	time = pow * 10;
	var_f94638c6 = time;
	wait(0.5);
	while(time > 0)
	{
		self thread namespace_4b6e359c::function_75aa16e4("hudItems.perks.sleight_of_hand", "sleight_of_hand", "MeterBlue", Int(self.var_f9046461 / var_64d5914 * 100));
		wait(var_f94638c6 * 0.1);
		self.var_f9046461 = self.var_f9046461 - var_64d5914 * 0.1;
		time = time - var_f94638c6 * 0.1;
	}
	self.var_f9046461 = undefined;
	self thread namespace_4b6e359c::function_75aa16e4("hudItems.perks.sleight_of_hand", "sleight_of_hand", "MeterBlue", Int(0));
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_102a89da
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xC2C8
	Size: 0x2B8
	Parameters: 13
	Flags: None
	Line Number: 2370
*/
function function_102a89da(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(isdefined(e_player) && namespace_851dc78f::function_b690a849("specialty_doubletap2") && isdefined(e_player.var_7a5d417f) && e_player.var_7a5d417f > 0)
	{
		if(str_mod == "MOD_RIFLE_BULLET" || str_mod == "MOD_PISTOL_BULLET")
		{
			self DoDamage(Int(n_amount / 100 * e_player.var_7a5d417f), e_player.origin, e_player, e_player, 0, str_mod, 0, GetWeapon(w_weapon));
		}
	}
	if(isdefined(e_player) && isdefined(e_player.var_f9046461))
	{
		self DoDamage(Int(n_amount * e_player.var_f9046461), e_player.origin, e_player, e_player, 0, str_mod, 0, GetWeapon(w_weapon));
	}
	if(isdefined(e_player) && e_player namespace_851dc78f::function_b690a849("specialty_deadshot") && isdefined(e_player.var_bdf31e10) && e_player.var_bdf31e10 >= 4)
	{
		if(str_hit_location == "head" || str_hit_location == "helmet" || str_hit_location == "neck")
		{
			self DoDamage(Int(n_amount), e_player.origin, e_player, e_player, 0, str_mod, 0, GetWeapon(w_weapon));
		}
	}
	return 0;
}

/*
	Name: function_6732b02e
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xC588
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 2403
*/
function function_6732b02e()
{
	self endon("hash_9e534960");
	self.var_7a5d417f = 0;
	while(1)
	{
		evt = self util::waittill_any_return("weapon_fired", "doubletap_db_reset");
		if(evt == "weapon_fired")
		{
			self thread function_51f4dab6();
			if(self.var_7a5d417f < 30)
			{
				self.var_7a5d417f++;
			}
		}
		else
		{
			self.var_7a5d417f = 0;
		}
	}
}

/*
	Name: function_51f4dab6
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xC630
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 2435
*/
function function_51f4dab6()
{
	self endon("weapon_fired");
	wait(1);
	self.var_7a5d417f = 0;
}

/*
	Name: function_9e534960
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xC658
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 2452
*/
function function_9e534960()
{
	self notify("hash_9e534960");
}

/*
	Name: function_49b5095a
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xC678
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 2467
*/
function function_49b5095a()
{
	self notify("hash_7012e821");
	self endon("hash_7012e821");
	while(1)
	{
		self waittill("damage");
		if(self namespace_851dc78f::function_b690a849("specialty_quickrevive"))
		{
			self thread function_f335ce82();
		}
	}
}

/*
	Name: function_f335ce82
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xC6F0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 2491
*/
function function_f335ce82()
{
	self notify("hash_f335ce82");
	self endon("hash_f335ce82");
	var_3217176c = self.health;
	while(self.health <= var_3217176c)
	{
		wait(0.05);
	}
	if(!isdefined(self.var_37f2569f))
	{
		self thread namespace_851dc78f::function_42a4014f(0.15);
		self.var_37f2569f = 1;
	}
	wait(5);
	self thread namespace_851dc78f::function_7647c83d(0.15);
	self.var_37f2569f = undefined;
}

/*
	Name: function_942ac8df
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xC7B0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 2520
*/
function function_942ac8df()
{
	self thread namespace_851dc78f::function_cc14aa10();
	self thread namespace_851dc78f::function_370b3bc();
	return;
}

/*
	Name: function_3dc49dd
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xC7F0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 2537
*/
function function_3dc49dd()
{
	self thread namespace_851dc78f::function_35de86ea();
	self thread namespace_851dc78f::function_5cef184e();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_93b798cc
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xC830
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 2555
*/
function function_93b798cc()
{
	self SetSpreadOverride(0);
}

/*
	Name: function_782fbb72
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xC858
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 2570
*/
function function_782fbb72()
{
	self ReSetSpreadOverride();
}

/*
	Name: function_93a1cd40
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xC880
	Size: 0x1D0
	Parameters: 1
	Flags: None
	Line Number: 2585
*/
function function_93a1cd40(attacker)
{
	if(isdefined(self.attacker) && isPlayer(self.attacker) && self.attacker namespace_851dc78f::function_b690a849("specialty_deadshot") && isdefined(self.damagelocation))
	{
		if(isdefined(self.damageMod) && isdefined(self.damageWeapon) && (self.damageMod == "MOD_RIFLE_BULLET" || self.damageMod == "MOD_PISTOL_BULLET") && zm_utility::is_headshot(self.damageWeapon, self.damagelocation, self.damageMod))
		{
			if(!isdefined(self.attacker.var_bdf31e10))
			{
				self.attacker.var_bdf31e10 = 0;
			}
			if(self.attacker.var_bdf31e10 < 4)
			{
				self.attacker.var_bdf31e10++;
			}
			self.attacker thread function_96f1450c();
		}
		else
		{
			self.attacker.var_bdf31e10 = 0;
		}
	}
	else if(isdefined(self.attacker) && isPlayer(self.attacker) && isdefined(self.damagelocation) && !zm_utility::is_headshot(self.damageWeapon, self.damagelocation, self.damageMod))
	{
		self.attacker.var_bdf31e10 = 0;
	}
}

/*
	Name: function_96f1450c
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xCA58
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 2622
*/
function function_96f1450c()
{
	if(isdefined(self.var_b12e8561) && self.var_b12e8561 > 0)
	{
		self.var_b12e8561 = 2;
		return;
	}
	self.var_b12e8561 = 2;
	self namespace_851dc78f::function_531df54d();
	while(self.var_b12e8561 > 0)
	{
		self.var_b12e8561 = self.var_b12e8561 - 0.1;
		wait(0.1);
	}
	self namespace_851dc78f::function_f1d27cdf();
}

/*
	Name: function_ec970c6
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xCB00
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 2649
*/
function function_ec970c6()
{
	while(!isdefined(level._custom_perks))
	{
		wait(0.1);
	}
	while(!isdefined(level._custom_perks["specialty_additionalprimaryweapon"].player_thread_take))
	{
		wait(0.1);
	}
	level._custom_perks["specialty_additionalprimaryweapon"].player_thread_take = &function_4d7c8638;
	level._custom_perks["specialty_additionalprimaryweapon"].player_thread_give = &function_eb3b574e;
}

/*
	Name: function_4d7c8638
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xCBA0
	Size: 0x88
	Parameters: 3
	Flags: None
	Line Number: 2673
*/
function function_4d7c8638(b_pause, str_perk, str_result)
{
	if(self namespace_851dc78f::function_b690a849("specialty_additionalprimaryweapon"))
	{
		self.var_837946e3 = 1;
		self.var_9c779bba = self.weapon_taken_by_losing_specialty_additionalprimaryweapon;
	}
	if(b_pause || str_result == str_perk)
	{
		self zm_perk_additionalprimaryweapon::take_additionalprimaryweapon();
	}
}

/*
	Name: function_eb3b574e
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xCC30
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 2696
*/
function function_eb3b574e()
{
	if(isdefined(self.var_837946e3) && !self laststand::player_is_in_laststand())
	{
		self.var_837946e3 = undefined;
		while(zm_equipment::is_equipment_that_blocks_purchase(self GetCurrentWeapon()))
		{
			wait(0.1);
		}
		if(isdefined(level.return_additionalprimaryweapon))
		{
			self [[level.return_additionalprimaryweapon]](self.weapon_taken_by_losing_specialty_additionalprimaryweapon);
		}
		else
		{
			self zm_weapons::give_build_kit_weapon(self.weapon_taken_by_losing_specialty_additionalprimaryweapon);
		}
	}
}

/*
	Name: function_9c21634b
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xCCF0
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 2726
*/
function function_9c21634b()
{
	var_63e68b77 = 0;
	while(1)
	{
		self util::waittill_any("fake_death", "death", "player_downed", "weapon_change_complete");
		var_1311187d = 0;
		if(self hasPerk("specialty_additionalprimaryweapon"))
		{
			var_c63cb7e3 = [];
			primaryWeapons = self getweaponslistprimaries();
			for(i = 0; i < primaryWeapons.size; i++)
			{
				if(zm_weapons::is_weapon_included(primaryWeapons[i]) || zm_weapons::is_weapon_upgraded(primaryWeapons[i]))
				{
					var_c63cb7e3[var_c63cb7e3.size] = primaryWeapons[i];
				}
			}
			for(i = 0; i < var_c63cb7e3.size; i++)
			{
				if(i > 1 && self GetCurrentWeapon() == var_c63cb7e3[i])
				{
					var_1311187d = 1;
				}
			}
			if(!var_63e68b77 && var_1311187d)
			{
				self thread namespace_4b6e359c::function_75aa16e4("specialty_additionalprimaryweapon", "additional_primary_weapon", "overlayStyleGreen", Int(1));
				var_63e68b77 = 1;
			}
			else if(var_63e68b77 && !var_1311187d)
			{
				self thread namespace_4b6e359c::function_75aa16e4("specialty_additionalprimaryweapon", "additional_primary_weapon", "overlayStyleGreen", Int(0));
				var_63e68b77 = 0;
			}
		}
		wait(0.3);
	}
}

/*
	Name: function_49c7236b
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xCF58
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 2776
*/
function function_49c7236b(attacker)
{
	if(isdefined(self.attacker) && isPlayer(self.attacker) && self.attacker namespace_851dc78f::function_b690a849("specialty_widowswine") && (!(isdefined(self.no_powerups) && self.no_powerups)))
	{
		if(RandomInt(100) < 5)
		{
			self.no_powerups = 1;
			level._powerup_timeout_override = &powerup_widows_wine_timeout;
			level thread zm_powerups::specific_powerup_drop("ww_grenade", self.origin, undefined, undefined, undefined, self.attacker);
			level._powerup_timeout_override = undefined;
		}
	}
}

/*
	Name: powerup_widows_wine_timeout
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xD048
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 2800
*/
function powerup_widows_wine_timeout()
{
	self endon("powerup_grabbed");
	self endon("death");
	self endon("powerup_reset");
	self zm_powerups::powerup_show(1);
	wait_time = 1;
	if(isdefined(level._powerup_timeout_custom_time))
	{
		time = [[level._powerup_timeout_custom_time]](self);
		if(time == 0)
		{
			return;
		}
		wait_time = time;
	}
	wait(wait_time);
	for(i = 20; i > 0; i--)
	{
		if(i % 2)
		{
			self zm_powerups::powerup_show(0);
		}
		else
		{
			self zm_powerups::powerup_show(1);
		}
		if(i > 15)
		{
			wait(0.3);
		}
		if(i > 10)
		{
			wait(0.25);
			continue;
		}
		if(i > 5)
		{
			wait(0.15);
			continue;
		}
		wait(0.1);
	}
	self notify("powerup_timedout");
	self zm_powerups::powerup_delete();
}

/*
	Name: function_1dffd5fa
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xD1D0
	Size: 0x3F8
	Parameters: 2
	Flags: None
	Line Number: 2857
*/
function function_1dffd5fa(var_7aef55f1, var_2c81877f)
{
	wait(0.1);
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("extras_waw_pap") == 0)
	{
		return;
	}
	level flag::init("pack_machine_in_use");
	PaP = spawn("script_model", var_7aef55f1);
	PaP SetModel("p7_zm_vending_packapunch");
	PaP.angles = var_2c81877f + VectorScale((0, 1, 0), 90);
	PaP.targetname = "zombie_vending_upgrade";
	use_trigger = spawn("trigger_radius_use", PaP.origin + VectorScale((0, 0, 1), 35), 0, 40, 70);
	use_trigger.script_noteworthy = "pack_a_punch";
	use_trigger TriggerIgnoreTeam();
	use_trigger flag::init("pap_offering_gun");
	use_trigger thread pap_trigger_hintstring_monitor();
	use_trigger.machine = PaP;
	use_trigger setHintString(&"ZOMBIE_NEED_POWER");
	use_trigger setcursorhint("HINT_NOICON");
	orig = PaP GetTagOrigin("j_rollers_large") + VectorScale(AnglesToForward((0, PaP.angles[1] - 90, 0)), 22) - VectorScale((0, 0, 1), 3);
	var_3bcb0779 = spawn("script_model", orig);
	var_3bcb0779 SetModel("tag_origin");
	var_3bcb0779.angles = var_2c81877f + VectorScale((0, 1, 0), 90);
	use_trigger.var_3bcb0779 = var_3bcb0779;
	collision = spawn("script_model", PaP.origin, 1);
	collision.angles = PaP.angles;
	collision SetModel("zm_collision_perks1");
	collision.script_noteworthy = "clip";
	collision disconnectpaths();
	use_trigger.clip = collision;
	use_trigger.script_sound = "mus_perks_packa_jingle";
	use_trigger.script_label = "mus_perks_packa_sting";
	use_trigger.longJingleWait = 1;
	use_trigger thread function_52ed52a2();
	return;
}

/*
	Name: pap_trigger_hintstring_monitor
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xD5D0
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 2906
*/
function pap_trigger_hintstring_monitor()
{
	level endon("Pack_A_Punch_off");
	level waittill("Pack_A_Punch_on");
	self thread pap_trigger_hintstring_monitor_reset();
	while(1)
	{
		foreach(e_player in level.players)
		{
			if(e_player istouching(self))
			{
				self update_hint_string(e_player);
			}
		}
		wait(0.05);
	}
}

/*
	Name: update_hint_string
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xD6C0
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 2934
*/
function update_hint_string(player)
{
	if(self flag::get("pap_offering_gun"))
	{
		self setHintString(&"ZOMBIE_GET_UPGRADED_FILL");
		return;
	}
	w_curr_player_weapon = player GetCurrentWeapon();
	if(zm_weapons::is_weapon_upgraded(w_curr_player_weapon))
	{
		self setHintString(&"ZOMBIE_PERK_PACKAPUNCH_AAT", self.aat_cost);
	}
	else
	{
		self setHintString(&"ZOMBIE_PERK_PACKAPUNCH", self.cost);
	}
}

/*
	Name: pap_trigger_hintstring_monitor_reset
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xD7A0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2962
*/
function pap_trigger_hintstring_monitor_reset()
{
	level waittill("Pack_A_Punch_off");
	self thread pap_trigger_hintstring_monitor();
}

/*
	Name: function_52ed52a2
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xD7D0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 2978
*/
function function_52ed52a2()
{
	wait(1);
	while(1)
	{
		level flag::wait_till("power_on");
		level notify("Pack_A_Punch_on");
		self.machine SetModel("p7_zm_vending_packapunch_on");
		self thread function_a0d1cdd5();
		level flag::wait_till("power_off");
		level notify("Pack_A_Punch_off");
		self.machine SetModel("p7_zm_vending_packapunch");
	}
}

/*
	Name: function_a0d1cdd5
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xD8A0
	Size: 0x7E0
	Parameters: 0
	Flags: None
	Line Number: 3003
*/
function function_a0d1cdd5()
{
	level endon("Pack_A_Punch_off");
	self thread vending_weapon_upgrade_cost();
	self thread pack_a_punch_machine_trigger_think();
	pap_machine = self.machine;
	for(;;)
	{
		self.pack_player = undefined;
		self waittill("trigger", player);
		index = zm_utility::get_player_index(player);
		current_weapon = player GetCurrentWeapon();
		current_weapon = player zm_weapons::switch_from_alt_weapon(current_weapon);
		if(isdefined(level.pack_a_punch.custom_validation))
		{
			valid = self [[level.pack_a_punch.custom_validation]](player);
			if(!valid)
			{
			}
		}
		else
		{
			wait(0.1);
			else if(player IsSwitchingWeapons())
			{
				wait(0.1);
				if(player IsSwitchingWeapons())
				{
				}
			}
			else
			{
				else
				{
					current_cost = self.cost;
					player.restore_ammo = undefined;
					player.restore_clip = undefined;
					player.restore_stock = undefined;
					player_restore_clip_size = undefined;
					player.restore_max = undefined;
					b_weapon_supports_aat = zm_weapons::weapon_supports_aat(current_weapon);
					isRepack = 0;
					currentAATHashID = -1;
					if(b_weapon_supports_aat)
					{
						current_cost = self.aat_cost;
						currentAAT = player AAT::getAATOnWeapon(current_weapon);
						if(isdefined(currentAAT))
						{
							currentAATHashID = currentAAT.hash_id;
						}
						player.restore_ammo = 1;
						player.restore_clip = player GetWeaponAmmoClip(current_weapon);
						player.restore_clip_size = current_weapon.clipSize;
						player.restore_stock = player GetWeaponAmmoStock(current_weapon);
						player.restore_max = current_weapon.maxAmmo;
						isRepack = 1;
					}
					if(player zm_pers_upgrades_functions::is_pers_double_points_active())
					{
						current_cost = player zm_pers_upgrades_functions::pers_upgrade_double_points_cost(current_cost);
					}
					if(!player zm_score::can_player_purchase(current_cost))
					{
						player zm_audio::create_and_play_dialog("general", "outofmoney", 0);
					}
					else
					{
						self.pack_player = player;
						level flag::set("pack_machine_in_use");
						player zm_score::minus_to_player_score(current_cost);
						self thread zm_audio::sndPerksJingles_Player(1);
						player zm_audio::create_and_play_dialog("general", "pap_wait");
						self TriggerEnable(0);
						player thread do_knuckle_crack();
						self.current_weapon = current_weapon;
						upgrade_weapon = zm_weapons::get_upgrade_weapon(current_weapon, b_weapon_supports_aat);
						player third_person_weapon_upgrade(current_weapon, upgrade_weapon, pap_machine, self);
						self TriggerEnable(1);
						self setcursorhint("HINT_WEAPON", upgrade_weapon);
						self flag::set("pap_offering_gun");
						if(isdefined(player))
						{
							self SetInvisibleToAll();
							self setvisibletoplayer(player);
							self thread wait_for_player_to_take(player, current_weapon, b_weapon_supports_aat, isRepack);
							self thread wait_for_timeout(current_weapon, player, isRepack);
							self util::waittill_any("pap_timeout", "pap_taken", "pap_player_disconnected");
						}
						else
						{
							self wait_for_timeout(current_weapon, player, isRepack);
						}
						self.var_3bcb0779 SetModel("tag_origin");
						orig = pap_machine GetTagOrigin("j_rollers_large") + VectorScale(AnglesToForward((0, pap_machine.angles[1] - 90, 0)), 22) - VectorScale((0, 0, 1), 3);
						self.var_3bcb0779 moveto(orig, 0.35);
						self setcursorhint("HINT_NOICON");
						self.current_weapon = level.weaponNone;
						self flag::clear("pap_offering_gun");
						self thread pack_a_punch_machine_trigger_think();
						self.pack_player = undefined;
						level flag::clear("pack_machine_in_use");
					}
				}
			}
			else if(!zm_weapons::is_weapon_or_base_included(current_weapon))
			{
			}
		}
		else if(!player zm_magicbox::can_buy_weapon() || player laststand::player_is_in_laststand() || (isdefined(player.intermission) && player.intermission) || player IsThrowingGrenade() || (!player zm_weapons::can_upgrade_weapon(current_weapon) && !zm_weapons::weapon_supports_aat(current_weapon)))
		{
		}
	}
}

/*
	Name: pack_a_punch_machine_trigger_think
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xE088
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 3128
*/
function pack_a_punch_machine_trigger_think()
{
	self endon("death");
	self endon("Pack_A_Punch_off");
	self notify("pack_a_punch_trigger_think");
	self endon("pack_a_punch_trigger_think");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(self.pack_player) && self.pack_player != players[i] || !players[i] player_use_can_pack_now() || players[i] bgb::is_active("zm_bgb_ephemeral_enhancement"))
			{
				self setinvisibletoplayer(players[i], 1);
				continue;
			}
			self setinvisibletoplayer(players[i], 0);
		}
		wait(0.1);
	}
	return;
}

/*
	Name: player_use_can_pack_now
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xE1D8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 3161
*/
function player_use_can_pack_now()
{
	if(self laststand::player_is_in_laststand() || (isdefined(self.intermission) && self.intermission) || self IsThrowingGrenade())
	{
		return 0;
	}
	if(!self zm_magicbox::can_buy_weapon() || self bgb::is_enabled("zm_bgb_disorderly_combat"))
	{
		return 0;
	}
	if(self zm_equipment::hacker_active())
	{
		return 0;
	}
	current_weapon = self GetCurrentWeapon();
	if(!self can_pack_weapon(current_weapon) && !zm_weapons::weapon_supports_aat(current_weapon))
	{
		return 0;
	}
	return 1;
}

/*
	Name: can_pack_weapon
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xE2E0
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 3193
*/
function can_pack_weapon(weapon)
{
	if(weapon.isRiotShield)
	{
		return 0;
	}
	if(level flag::get("pack_machine_in_use"))
	{
		return 1;
	}
	if(!(isdefined(level.b_allow_idgun_pap) && level.b_allow_idgun_pap) && isdefined(level.idgun_weapons))
	{
		if(IsInArray(level.idgun_weapons, weapon))
		{
			return 0;
		}
	}
	weapon = self zm_weapons::get_nonalternate_weapon(weapon);
	if(!zm_weapons::is_weapon_or_base_included(weapon))
	{
		return 0;
	}
	if(!self zm_weapons::can_upgrade_weapon(weapon))
	{
		return 0;
	}
	return 1;
}

/*
	Name: vending_weapon_upgrade_cost
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xE3D0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 3232
*/
function vending_weapon_upgrade_cost()
{
	level endon("Pack_A_Punch_off");
	while(1)
	{
		self.cost = 5000;
		self.aat_cost = 2500;
		level waittill("powerup_bonfire_sale");
		self.cost = 1000;
		self.aat_cost = 500;
		level waittill("bonfire_sale_off");
	}
}

/*
	Name: wait_for_player_to_take
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xE440
	Size: 0x500
	Parameters: 4
	Flags: None
	Line Number: 3256
*/
function wait_for_player_to_take(player, weapon, b_weapon_supports_aat, isRepack)
{
	current_weapon = self.current_weapon;
	upgrade_weapon = self.upgrade_weapon;
	/#
		fallback_initiated::Assert(isdefined(current_weapon), "Dev Block strings are not supported");
	#/
	/#
		fallback_initiated::Assert(isdefined(upgrade_weapon), "Dev Block strings are not supported");
	#/
	self endon("pap_timeout");
	level endon("Pack_A_Punch_off");
	while(isdefined(player))
	{
		self waittill("trigger", trigger_player);
		if(level.pack_a_punch.grabbable_by_anyone)
		{
			player = trigger_player;
		}
		if(trigger_player == player)
		{
			player zm_stats::increment_client_stat("pap_weapon_grabbed");
			player zm_stats::increment_player_stat("pap_weapon_grabbed");
			current_weapon = player GetCurrentWeapon();
			if(zm_utility::is_player_valid(player) && !player.IS_DRINKING > 0 && !zm_utility::is_placeable_mine(current_weapon) && !zm_equipment::is_equipment(current_weapon) && !player zm_utility::is_player_revive_tool(current_weapon) && level.weaponNone != current_weapon && !player zm_equipment::hacker_active())
			{
				self notify("pap_taken");
				player notify("pap_taken");
				player.pap_used = 1;
				weapon_limit = zm_utility::get_player_weapon_limit(player);
				player zm_weapons::take_fallback_weapon();
				Primaries = player getweaponslistprimaries();
				if(isdefined(Primaries) && Primaries.size >= weapon_limit)
				{
					upgrade_weapon = player zm_weapons::weapon_give(upgrade_weapon);
				}
				else
				{
					upgrade_weapon = player zm_weapons::give_build_kit_weapon(upgrade_weapon);
					player GiveStartAmmo(upgrade_weapon);
				}
				player notify("weapon_give", upgrade_weapon);
				aatID = -1;
				if(isdefined(b_weapon_supports_aat) && b_weapon_supports_aat)
				{
					player thread AAT::acquire(upgrade_weapon);
					aatObj = player AAT::getAATOnWeapon(upgrade_weapon);
					if(isdefined(aatObj))
					{
						aatID = aatObj.hash_id;
					}
				}
				else
				{
					player thread AAT::remove(upgrade_weapon);
				}
				player SwitchToWeapon(upgrade_weapon);
				if(isdefined(player.restore_ammo) && player.restore_ammo)
				{
					new_clip = player.restore_clip + upgrade_weapon.clipSize - player.restore_clip_size;
					new_stock = player.restore_stock + upgrade_weapon.maxAmmo - player.restore_max;
					player SetWeaponAmmoStock(upgrade_weapon, new_stock);
					player SetWeaponAmmoClip(upgrade_weapon, new_clip);
				}
				player.restore_ammo = undefined;
				player.restore_clip = undefined;
				player.restore_stock = undefined;
				player.restore_max = undefined;
				player.restore_clip_size = undefined;
				player zm_weapons::play_weapon_vo(upgrade_weapon);
				return;
			}
		}
		wait(0.05);
	}
	return;
}

/*
	Name: wait_for_timeout
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xE948
	Size: 0x70
	Parameters: 3
	Flags: None
	Line Number: 3344
*/
function wait_for_timeout(weapon, player, isRepack)
{
	self endon("pap_taken");
	self endon("pap_player_disconnected");
	self thread wait_for_disconnect(player);
	wait(level.pack_a_punch.timeout);
	self notify("pap_timeout");
}

/*
	Name: wait_for_disconnect
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xE9C0
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 3363
*/
function wait_for_disconnect(player)
{
	self endon("pap_taken");
	self endon("pap_timeout");
	while(isdefined(player))
	{
		wait(0.1);
	}
	self notify("pap_player_disconnected");
}

/*
	Name: third_person_weapon_upgrade
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xEA10
	Size: 0x458
	Parameters: 4
	Flags: None
	Line Number: 3384
*/
function third_person_weapon_upgrade(current_weapon, upgrade_weapon, pap_machine, trigger)
{
	level endon("Pack_A_Punch_off");
	trigger endon("pap_player_disconnected");
	current_weapon = self getbuildkitweapon(current_weapon, 0);
	upgrade_weapon = self getbuildkitweapon(upgrade_weapon, 1);
	trigger.current_weapon = current_weapon;
	trigger.current_weapon_options = self getbuildkitweaponoptions(trigger.current_weapon);
	trigger.current_weapon_acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(trigger.current_weapon, 0);
	trigger.upgrade_weapon = upgrade_weapon;
	upgrade_weapon.pap_camo_to_use = zm_weapons::get_pack_a_punch_camo_index(upgrade_weapon.pap_camo_to_use);
	if(isdefined(self.var_4fabb83f) && isdefined(self.var_4fabb83f.stats) && isdefined(self.var_4fabb83f.stats["wpap_override_" + current_weapon.name]) && self.var_4fabb83f.stats["wpap_override_" + current_weapon.name] == 1)
	{
		upgrade_weapon.pap_camo_to_use = 0;
	}
	trigger.upgrade_weapon_options = self getbuildkitweaponoptions(trigger.upgrade_weapon, upgrade_weapon.pap_camo_to_use);
	trigger.upgrade_weapon_acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(trigger.upgrade_weapon, 1);
	trigger.var_3bcb0779 SetModel(trigger.current_weapon.worldmodel);
	trigger.var_3bcb0779 moveto(pap_machine GetTagOrigin("j_rollers_large"), 0.35);
	self playsound("zmb_perks_packa_upgrade");
	wait(0.35);
	wait(3);
	trigger.var_3bcb0779 SetModel(trigger.upgrade_weapon.worldmodel);
	trigger.var_3bcb0779 SetWeaponOptions(trigger.upgrade_weapon_options);
	trigger.var_3bcb0779 SetAttachmentCosmeticVariantIndexes(trigger.upgrade_weapon_acvi);
	orig = pap_machine GetTagOrigin("j_rollers_large") + VectorScale(AnglesToForward((0, pap_machine.angles[1] - 90, 0)), 22) - VectorScale((0, 0, 1), 3);
	trigger.var_3bcb0779 moveto(orig, 0.35);
	wait(0.5);
	trigger.var_3bcb0779 moveto(pap_machine GetTagOrigin("j_rollers_large"), 10);
	if(isdefined(self))
	{
		self playsound("zmb_perks_packa_ready");
		return;
	}
	else
	{
	}
}

/*
	Name: do_knuckle_crack
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xEE70
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 3433
*/
function do_knuckle_crack()
{
	self endon("disconnect");
	self upgrade_knuckle_crack_begin();
	self util::waittill_any("fake_death", "death", "player_downed", "weapon_change_complete");
	self upgrade_knuckle_crack_end();
}

/*
	Name: upgrade_knuckle_crack_begin
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xEEF0
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 3451
*/
function upgrade_knuckle_crack_begin()
{
	self zm_utility::increment_is_drinking();
	self zm_utility::disable_player_move_states(1);
	Primaries = self getweaponslistprimaries();
	original_weapon = self GetCurrentWeapon();
	weapon = GetWeapon("zombie_knuckle_crack");
	if(original_weapon != level.weaponNone && !zm_utility::is_placeable_mine(original_weapon) && !zm_equipment::is_equipment(original_weapon))
	{
		self notify("zmb_lost_knife");
		self TakeWeapon(original_weapon);
		return;
	}
	else
	{
	}
	self GiveWeapon(weapon);
	self SwitchToWeapon(weapon);
}

/*
	Name: upgrade_knuckle_crack_end
	Namespace: namespace_789de0fc
	Checksum: 0x424F4353
	Offset: 0xF038
	Size: 0x104
	Parameters: 0
	Flags: None
	Line Number: 3481
*/
function upgrade_knuckle_crack_end()
{
	self zm_utility::enable_player_move_states();
	weapon = GetWeapon("zombie_knuckle_crack");
	if(self laststand::player_is_in_laststand() || (isdefined(self.intermission) && self.intermission))
	{
		self TakeWeapon(weapon);
		return;
	}
	self zm_utility::decrement_is_drinking();
	self TakeWeapon(weapon);
	Primaries = self getweaponslistprimaries();
	if(self.IS_DRINKING > 0)
	{
		return;
	}
	else
	{
		self zm_weapons::switch_back_primary_weapon();
	}
}

