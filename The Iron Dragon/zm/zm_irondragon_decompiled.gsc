#include scripts\_nsz\ice_insta_teleporter;
#include scripts\_nsz\ice_insta_teleporter1;
#include scripts\_nsz\ice_insta_teleporter2;
#include scripts\_nsz\ice_insta_teleporter3;
#include scripts\_nsz\ice_insta_teleporter4;
#include scripts\_nsz\ice_insta_teleporter5;
#include scripts\_nsz\ice_insta_teleporter6;
#include scripts\_nsz\ice_insta_teleporter7;
#include scripts\_nsz\ice_insta_teleporter8;
#include scripts\_nsz\nsz_buyable_ending;
#include scripts\_nsz\nsz_shootable_ee;
#include scripts\_redspace\rs_o_jump_pad;
#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\sphynx\_zm_sphynx_util;
#include scripts\sphynx\_zm_subtitles;
#include scripts\sphynx\craftables\_zm_craft_gravityspikes;
#include scripts\sphynx\craftables\_zm_craft_origins_shield;
#include scripts\zm\_hb21_sym_zm_trap_acid;
#include scripts\zm\_hb21_sym_zm_trap_chain;
#include scripts\zm\_hb21_sym_zm_trap_fan;
#include scripts\zm\_hb21_sym_zm_trap_gate;
#include scripts\zm\_hb21_sym_zm_trap_turret;
#include scripts\zm\_hb21_zm_behavior;
#include scripts\zm\_hb21_zm_hitmarkers;
#include scripts\zm\_hb21_zm_magicbox;
#include scripts\zm\_hb21_zm_soul_chests;
#include scripts\zm\_hb21_zm_soul_chests_circle1;
#include scripts\zm\_hb21_zm_soul_chests_circle2;
#include scripts\zm\_hb21_zm_soul_chests_circle3;
#include scripts\zm\_hb21_zm_soul_chests_demongate;
#include scripts\zm\_hb21_zm_soul_chests_keeper1;
#include scripts\zm\_hb21_zm_soul_chests_keeper2;
#include scripts\zm\_hb21_zm_soul_chests_keeper3;
#include scripts\zm\_hb21_zm_soul_chests_keeper4;
#include scripts\zm\_hb21_zm_soul_chests_rune_prison;
#include scripts\zm\_hb21_zm_soul_chests_storm;
#include scripts\zm\_hb21_zm_soul_chests_wolf_howl;
#include scripts\zm\_hb21_zm_trap_centrifuge;
#include scripts\zm\_hb21_zm_trap_flinger;
#include scripts\zm\_hb21_zm_trap_flogger;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_dogs;
#include scripts\zm\_zm_ai_mechz;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_pack_a_punch;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perk_deadshot;
#include scripts\zm\_zm_perk_doubletap2;
#include scripts\zm\_zm_perk_electric_cherry;
#include scripts\zm\_zm_perk_elemental_pop;
#include scripts\zm\_zm_perk_juggernaut;
#include scripts\zm\_zm_perk_quick_revive;
#include scripts\zm\_zm_perk_random;
#include scripts\zm\_zm_perk_sleight_of_hand;
#include scripts\zm\_zm_perk_snails_pace_slurpee;
#include scripts\zm\_zm_perk_staminup;
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
#include scripts\zm\_zm_t4_weapons;
#include scripts\zm\_zm_t6_weapons;
#include scripts\zm\_zm_t7_weapons;
#include scripts\zm\_zm_trap_electric;
#include scripts\zm\_zm_trap_fire;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_elemental_bow;
#include scripts\zm\_zm_weap_elemental_bow_demongate;
#include scripts\zm\_zm_weap_elemental_bow_rune_prison;
#include scripts\zm\_zm_weap_elemental_bow_storm;
#include scripts\zm\_zm_weap_elemental_bow_wolf_howl;
#include scripts\zm\_zm_weap_gravityspikes;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\bo4_carpenter;
#include scripts\zm\craftables\_zm_craft_shield;
#include scripts\zm\craftables\_zm_craftables;
#include scripts\zm\symbo_zns_transports;
#include scripts\zm\zm_castle_weap_quest;
#include scripts\zm\zm_giant_cleanup_mgr;
#include scripts\zm\zm_usermap;

#namespace namespace_da78430a;

/*
	Name: main
	Namespace: namespace_da78430a
	Checksum: 0x85D361F6
	Offset: 0x6948
	Size: 0x24D8
	Parameters: 0
	Flags: None
	Line Number: 115
*/
function main()
{
	clientfield::register("clientuimodel", "zmInventory.widget_sprayer", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.player_using_sprayer", 1, 1, "int");
	clientfield::register("world", "orb_red_pickup", 1, 1, "int");
	clientfield::register("world", "orb_blue_pickup", 1, 1, "int");
	clientfield::register("world", "orb_green_pickup", 1, 1, "int");
	clientfield::register("world", "orb_yellow_pickup", 1, 1, "int");
	clientfield::register("world", "orb_red_pickup2", 1, 1, "int");
	clientfield::register("world", "orb_blue_pickup2", 1, 1, "int");
	clientfield::register("world", "orb_green_pickup2", 1, 1, "int");
	clientfield::register("world", "orb_yellow_pickup2", 1, 1, "int");
	clientfield::register("world", "iron_dragon", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.widget_weap_quest_rune", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.quest_state_rune", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.quest_owner_rune", 1, 1, "int");
	RegisterClientField("world", "quest_state_rune", 1, 3, "int", undefined, 0);
	RegisterClientField("world", "quest_owner_rune", 1, 3, "int", undefined, 0);
	clientfield::register("clientuimodel", "zmInventory.widget_weap_quest_wolf", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.quest_state_wolf", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.quest_owner_wolf", 1, 1, "int");
	RegisterClientField("world", "quest_state_wolf", 1, 3, "int", undefined, 0);
	RegisterClientField("world", "quest_owner_wolf", 1, 3, "int", undefined, 0);
	clientfield::register("clientuimodel", "zmInventory.widget_weap_quest_demon", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.quest_state_demon", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.quest_owner_demon", 1, 1, "int");
	RegisterClientField("world", "quest_state_demon", 1, 3, "int", undefined, 0);
	RegisterClientField("world", "quest_owner_demon", 1, 3, "int", undefined, 0);
	clientfield::register("clientuimodel", "zmInventory.widget_weap_quest_storm", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.quest_state_storm", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.quest_owner_storm", 1, 1, "int");
	RegisterClientField("world", "quest_state_storm", 1, 3, "int", undefined, 0);
	RegisterClientField("world", "quest_owner_storm", 1, 3, "int", undefined, 0);
	clientfield::register("scriptmover", "fx_orbgreen", 1, 1, "int");
	clientfield::register("scriptmover", "fx_orbred", 1, 1, "int");
	clientfield::register("scriptmover", "fx_orbblue", 1, 1, "int");
	clientfield::register("scriptmover", "fx_orbyellow", 1, 1, "int");
	clientfield::register("scriptmover", "fx_raven", 1, 1, "int");
	clientfield::register("scriptmover", "fx_stormbow", 1, 1, "int");
	clientfield::register("scriptmover", "fx_vane", 1, 1, "int");
	clientfield::register("scriptmover", "fx_stormfire", 1, 1, "int");
	clientfield::register("scriptmover", "fx_stormshock", 1, 1, "int");
	clientfield::register("scriptmover", "fx_stormflash", 1, 1, "int");
	clientfield::register("scriptmover", "fx_wall", 1, 1, "int");
	clientfield::register("scriptmover", "fx_wolfbow", 1, 1, "int");
	clientfield::register("scriptmover", "fx_wolfskull", 1, 1, "int");
	clientfield::register("scriptmover", "fx_urnglow", 1, 1, "int");
	clientfield::register("scriptmover", "fx_demonskull", 1, 1, "int");
	clientfield::register("scriptmover", "fx_urnexplode", 1, 1, "int");
	clientfield::register("scriptmover", "fx_demonskulltrail", 1, 1, "int");
	clientfield::register("scriptmover", "fx_obeliskglow", 1, 1, "int");
	clientfield::register("scriptmover", "fx_obeliskexplode", 1, 1, "int");
	clientfield::register("scriptmover", "fx_runecirclefire", 1, 1, "int");
	clientfield::register("scriptmover", "fx_runecircleflare", 1, 1, "int");
	clientfield::register("scriptmover", "fx_fireplace1", 1, 1, "int");
	clientfield::register("scriptmover", "fx_fireplace2", 1, 1, "int");
	clientfield::register("scriptmover", "fx_fireplace4", 1, 1, "int");
	clientfield::register("scriptmover", "fx_orbexplode", 1, 1, "int");
	clientfield::register("scriptmover", "fx_orbgrow", 1, 1, "int");
	clientfield::register("scriptmover", "fx_orbcrust", 1, 1, "int");
	clientfield::register("scriptmover", "fx_stormfire2", 1, 1, "int");
	clientfield::register("scriptmover", "fx_planeglow", 1, 1, "int");
	clientfield::register("scriptmover", "fx_planetrail", 1, 1, "int");
	clientfield::register("scriptmover", "fx_runebrazier", 1, 1, "int");
	clientfield::register("scriptmover", "fx_demonsmoke", 1, 1, "int");
	clientfield::register("scriptmover", "fx_torchlight", 1, 1, "int");
	clientfield::register("scriptmover", "fx_torchfire", 1, 1, "int");
	clientfield::register("scriptmover", "fx_keeperbeam", 1, 1, "int");
	clientfield::register("scriptmover", "fx_keeperspawn", 1, 1, "int");
	clientfield::register("scriptmover", "fx_keepertrail2", 1, 1, "int");
	clientfield::register("scriptmover", "fx_flak1", 1, 1, "int");
	clientfield::register("scriptmover", "fx_flak2", 1, 1, "int");
	clientfield::register("scriptmover", "fx_flak3", 1, 1, "int");
	clientfield::register("scriptmover", "fx_flak4", 1, 1, "int");
	clientfield::register("scriptmover", "fx_flak5", 1, 1, "int");
	clientfield::register("scriptmover", "fx_flak6", 1, 1, "int");
	clientfield::register("scriptmover", "fx_keeperglow", 1, 1, "int");
	clientfield::register("scriptmover", "fx_wolfinkbody", 1, 1, "int");
	level._effect["lpadland"] = "dlc1/castle/fx_elec_landingpad_glow";
	level._effect["lpadlaunch"] = "dlc1/castle/fx_elec_jumppad";
	level._effect["eject"] = "dlc5/tomb/fx_tomb_robot_eject_warning";
	level._effect["stormhead"] = "dlc1/castle/fx_storm_arrow_head_float_glow";
	level._effect["stormshaft2"] = "dlc1/castle/fx_storm_arrow_shaft_float_glow";
	level._effect["stormtail"] = "dlc1/castle/fx_storm_arrow_tail_float_glow";
	level._effect["wolfshaft2"] = "dlc1/castle/fx_wolf_arrow_shaft_float_glow";
	level._effect["wolfhead"] = "dlc1/castle/fx_wolf_arrow_head_float_glow";
	level._effect["wolftail"] = "dlc1/castle/fx_wolf_arrow_tail_float_glow";
	level._effect["skeyglow"] = "zombie/fx_ee_book_mist_zod_zmb";
	level._effect["runearrowglow"] = "dlc1/castle/fx_plinth_aura_rune_prison";
	level._effect["runecirclecomplete"] = "dlc1/castle/fx_rune_circle_to_orb_tgt_energy";
	level._effect["demonaura"] = "dlc1/castle/fx_plinth_aura_demon_gate";
	level._effect["stormaura"] = "dlc1/castle/fx_plinth_aura_elemental_storm";
	level._effect["wolfaura"] = "dlc1/castle/fx_plinth_aura_wolf_howl";
	level._effect["keepertrail"] = "dlc1/castle/fx_keeper_ghost_mist_trail";
	level._effect["grave"] = "impacts/fx_hero_impact_grvity_spk_concrete";
	level._effect["panelspark"] = "dlc3/stalingrad/fx_main_spark_generator";
	level._effect["runeshaft"] = "dlc1/castle/fx_plinth_light_shaft_rune_prison";
	level._effect["keeperstone"] = "dlc1/castle/fx_ee_keeper_channeling_stone_d_src";
	level._effect["crate"] = "destruct/fx_dest_pallet_wood_damaged";
	level._effect["disco"] = "zombie/disco";
	level._effect["disco2"] = "zombie/disco2";
	level._effect["vase"] = "impacts/fx_bul_impact_concrete_lg";
	level._effect["keepertrailstorm"] = "zombie/fx_keeper_mist_trail_zod_zmb_storm";
	level._effect["keepertrailwolf"] = "zombie/fx_keeper_mist_trail_zod_zmb_wolf";
	level._effect["keepertraildemon"] = "zombie/fx_keeper_mist_trail_zod_zmb_demongate";
	level._effect["keepertrailrune"] = "zombie/fx_keeper_mist_trail_zod_zmb_rune_prison";
	level._effect["booze"] = "zombie/fx_powerup_grab_green_zmb";
	level._effect["boozeglint"] = "zombie/fx_sprayer_glint_zod_zmb";
	level._effect["fireplace3"] = "dlc1/castle/fx_rune_fireplace_embers";
	level._effect["stormfuse"] = "electric/fx_elec_veh_dmg_weakspot";
	level._effect["dust"] = "dlc3/stalingrad/fx_dust_impact_ring_xlg";
	level._effect["trailrune"] = "zombie/fx_trail_blood_soul_zmb_rune_prison";
	level._effect["traildemon"] = "zombie/fx_trail_blood_soul_zmb_demongate";
	level._effect["trailstorm"] = "zombie/fx_trail_blood_soul_zmb";
	level._effect["trailwolf"] = "zombie/fx_trail_blood_soul_zmb_wolf_howl";
	level._effect["wallending"] = "dlc1/castle/fx_rune_clock_exp_concrete_wall_obelisk";
	level._effect["dragon"] = "dlc3/stalingrad/fx_dragon_death_burst_md_loop";
	level._effect["dragon2"] = "dlc3/stalingrad/fx_dragon_death_chest_burst";
	level._effect["dig"] = "dlc5/tomb/fx_tomb_shovel_dig";
	level._effect["bosswall"] = "zombie/fx_ritual_barrier_defend_zod_zmb";
	level._effect["orbmerge"] = "dlc2/island/fx_plant_glow_underwater_orb";
	level._effect["wall2"] = "dlc1/castle/fx_rune_clock_exp_concrete_wall_demongate";
	level._effect["vane2"] = "dlc1/castle/fx_fire_elec_weathervane";
	zm_usermap::main();
	level thread function_b8f281b0();
	level thread function_cee9017f();
	level thread function_86db0ed7(500);
	level thread intro_credits();
	level.perk_purchase_limit = 30;
	startingWeapon = "t7_pistol_mc96";
	weapon = GetWeapon(startingWeapon);
	level.start_weapon = weapon;
	level.default_solo_laststandpistol = GetWeapon("pistol_standard_upgraded");
	level.default_laststandpistol = level.start_weapon;
	level.laststandpistol = GetWeapon("t7_pistol_mc96");
	level thread function_c28cdeba();
	level._zombie_custom_add_weapons = &custom_add_weapons;
	level.pack_a_punch_camo_index = 133;
	level.pack_a_punch_camo_index_number_variants = 1;
	level thread function_aa900fc4();
	level thread namespace_bbc93beb::main();
	level thread namespace_169c0a3f::init();
	Array::thread_all(GetEntArray("audio_bump_trigger", "targetname"), &zm_perks::thread_bump_trigger);
	level thread function_125aa444();
	level function_1a64f7d1();
	level function_266ccbcb();
	level function_32641ce1();
	level function_c61a278();
	level function_1672fb57();
	level function_f07080ee();
	level function_ca6e0685();
	level function_8b695e16();
	level function_6566e3ad();
	level function_3f646944();
	level function_1961eedb();
	level function_f35f7472();
	level function_8d17b82d();
	level function_76384461();
	level function_9c3abeca();
	level function_c23d3933();
	level function_b6cd88b6();
	level function_253672a9();
	level function_4b38ed12();
	level function_713b677b();
	level function_a959025e();
	level function_2931353();
	level function_908ba418();
	level function_b68e1e81();
	level function_749a828e();
	level function_9a9cfcf7();
	level function_fed3c4f4();
	level function_29dbc4c9();
	level function_b3b8692f();
	level function_41b0f9f4();
	level function_67b3745d();
	level function_9293cfc5();
	level function_9d59492b();
	level function_f42b4505();
	level function_c21d959f();
	level function_251b756a();
	level function_3b93f145();
	level function_61966bae();
	level function_8798e617();
	level function_8f8affd0();
	level function_f35eb592();
	level function_19612ffb();
	level function_c1792b24();
	level function_d2ab1388();
	level function_44b282c3();
	level function_1eb0085a();
	level function_90b77795();
	level function_386e2073();
	level function_8900846a();
	level function_8198d04e();
	level function_8c31f012();
	level function_687a8dee();
	level function_5948c0a8();
	level function_a43f7d8d();
	level function_ca0a17b4();
	level function_3c1186ef();
	level function_160f0c86();
	level function_5802a879();
	level function_32002e10();
	level function_a4079d4b();
	level function_e8a6d18f();
	level function_a979da04();
	level function_fe57233c();
	level function_705e9277();
	level function_4a5c180e();
	level function_db2e73c3();
	level function_69270488();
	level function_8f297ef1();
	level function_5f48826b();
	level function_aef5bced();
	level function_d4f83756();
	level function_fafab1bf();
	level function_ec19845a();
	level function_c61709f1();
	level function_a0148f88();
	level function_bf8687ba();
	level function_4bc20d9a();
	level function_25bf9331();
	level function_ffbd18c8();
	level function_7e23fa59();
	level function_a42674c2();
	level function_ca28ef2b();
	level function_67ff4134();
	level function_c83b8a8d();
	level function_c6936a0d();
	level function_957f43ff();
	level function_4a89e99d();
	level function_2377d4c4();
	level function_ef2e4c6a();
	level function_497a4f2d();
	level function_6c2cfcaf();
	level function_dafa4787();
	level function_920e2f9();
	level function_ca2c0cf3();
	level function_1595331a();
	level function_e39e1cb5();
	level function_9a0971e();
	level function_2fa31187();
	level function_e91dbada();
	level function_c31b4071();
	level function_9d18c608();
	level function_c987eba6();
	level function_58f7d090();
	level function_dd5c9e7c();
	level function_53907987();
	level function_e1890a4c();
	level function_78b84b5();
	level function_8a09222f();
	level function_7caae36a();
	level function_80ebda53();
	level function_ca050772();
	level function_a4028d09();
	level function_7e0012a0();
	level function_bc3ef235();
	level function_fb715da3();
	level function_ad823e31();
	level function_2593e0da();
	level function_18ebac57();
	level function_a6e43d1c();
	level function_cce6b785();
	level function_8e2f8729();
	level function_6931e78b();
	level function_fe6d7e45();
	level function_700fe492();
	level function_fc2bbf49();
	level function_2bb7a980();
	level function_bfedae8();
	level function_8e83cb80();
	level function_aa21930();
	level function_fbb828fb();
	level function_7b8cc3a6();
	level function_fa2429d1();
	level function_78bb8ffc();
	level function_f752f627();
	level function_b6d843b2();
	level thread LUI::screen_flash(0.05, 0.5, 0.05, 0.8, "white");
	level.zones = [];
	level.zone_manager_init_func = &function_f1e6f843;
	init_zones[0] = "start_zone";
	level thread zm_zonemgr::manage_zones(init_zones);
	level.pathdist_type = 2;
	precache_fx();
	level.musicplay = 0;
	thread function_148d9374();
	thread function_e7f1423();
	level.fn_custom_round_ai_spawn = &function_7a43781d;
	level thread namespace_dc53ad81::function_ce79b152();
	level thread zm_craftables::player_show_craftable_parts_ui();
	level thread function_43d5eef2();
	level thread function_3cf4c42();
	level thread function_773df40d();
	level thread function_bf318c09();
	level thread function_903925d4();
	level thread function_d4d92364();
	level thread function_d7a9e235();
	level thread function_978389a9();
	level thread namespace_c03cdda1::function_e407ea();
	level thread namespace_fa57765a::function_dd0733a7();
	level thread namespace_d454fbf1::function_9277d85a();
	level thread namespace_ae528188::function_d4aedb19();
	level thread namespace_b863da67::function_8cf8a984();
	level thread namespace_92615ffe::function_9467b9b();
	level thread namespace_6c5ee595::function_6d7ee2ee();
	level thread namespace_465c6b2c::function_833d181d();
	level thread namespace_f0461d7b::function_8aeed638();
}

/*
	Name: precache_fx
	Namespace: namespace_da78430a
	Checksum: 0x9ACF73B8
	Offset: 0x8E28
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 436
*/
function precache_fx()
{
}

/*
	Name: function_f1e6f843
	Namespace: namespace_da78430a
	Checksum: 0x77717C67
	Offset: 0x8E38
	Size: 0x6D0
	Parameters: 0
	Flags: None
	Line Number: 450
*/
function function_f1e6f843()
{
	zm_zonemgr::add_adjacent_zone("start_zone", "z1", "szz1");
	zm_zonemgr::add_adjacent_zone("z1", "z2", "z1z2");
	zm_zonemgr::add_adjacent_zone("z2", "z3", "z2z3");
	zm_zonemgr::add_adjacent_zone("z2", "z4", "z2z4");
	zm_zonemgr::add_adjacent_zone("z3", "z5", "z3z5");
	zm_zonemgr::add_adjacent_zone("z4", "z5", "z4z5");
	zm_zonemgr::add_adjacent_zone("z5", "z6", "z5z6");
	zm_zonemgr::add_adjacent_zone("z23", "z23b", "z5z23");
	zm_zonemgr::add_adjacent_zone("z23", "z23c");
	zm_zonemgr::add_adjacent_zone("z6", "z7", "z6z7");
	zm_zonemgr::add_adjacent_zone("z7", "z8", "z7z8");
	zm_zonemgr::add_adjacent_zone("z8", "z8b");
	zm_zonemgr::add_adjacent_zone("z8b", "z11", "z8z11");
	zm_zonemgr::add_adjacent_zone("z8b", "z15", "z8z15");
	zm_zonemgr::add_adjacent_zone("z7", "z9", "z7z9");
	zm_zonemgr::add_adjacent_zone("z7", "z10", "z7z10");
	zm_zonemgr::add_adjacent_zone("z8", "z9", "z8z9");
	zm_zonemgr::add_adjacent_zone("z8", "z11", "z8z11");
	zm_zonemgr::add_adjacent_zone("z11", "z11b");
	zm_zonemgr::add_adjacent_zone("z11b", "z18", "z11z18");
	zm_zonemgr::add_adjacent_zone("z8", "z12", "z8z12");
	zm_zonemgr::add_adjacent_zone("z8", "z15", "z8z15");
	zm_zonemgr::add_adjacent_zone("z9", "z15", "z9z15");
	zm_zonemgr::add_adjacent_zone("z10", "z13", "z10z13");
	zm_zonemgr::add_adjacent_zone("z12", "z13", "z12z13");
	zm_zonemgr::add_adjacent_zone("z12", "z14", "z12z14");
	zm_zonemgr::add_adjacent_zone("z12", "z15", "z12z15");
	zm_zonemgr::add_adjacent_zone("z15", "z15b");
	zm_zonemgr::add_adjacent_zone("z15b", "z12", "z12z15");
	zm_zonemgr::add_adjacent_zone("z12", "z21", "z12z21");
	zm_zonemgr::add_adjacent_zone("z13", "z16", "z13z16");
	zm_zonemgr::add_adjacent_zone("z11", "z18", "z11z18");
	zm_zonemgr::add_adjacent_zone("z11", "z22", "z11z22");
	zm_zonemgr::add_adjacent_zone("z13", "z19", "z13z19");
	zm_zonemgr::add_adjacent_zone("z18", "z19", "z18z19");
	zm_zonemgr::add_adjacent_zone("z18", "z20", "z18z20");
	zm_zonemgr::add_adjacent_zone("z21", "z22", "z21z22");
	zm_zonemgr::add_adjacent_zone("z21", "z23", "z21z23");
	zm_zonemgr::add_adjacent_zone("z21", "z21c");
	zm_zonemgr::add_adjacent_zone("z21c", "z21b");
	zm_zonemgr::add_adjacent_zone("z21c", "z12", "z12z21");
	zm_zonemgr::add_adjacent_zone("z18", "z24", "z18z24");
	zm_zonemgr::add_adjacent_zone("z19", "z20", "z19z20");
	level flag::init("always_on");
	level flag::set("always_on");
}

/*
	Name: custom_add_weapons
	Namespace: namespace_da78430a
	Checksum: 0xFD476A47
	Offset: 0x9510
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 509
*/
function custom_add_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_levelcommon_weapons.csv", 1);
}

/*
	Name: function_86db0ed7
	Namespace: namespace_da78430a
	Checksum: 0xCD30BC80
	Offset: 0x9540
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 524
*/
function function_86db0ed7(points)
{
	level flag::wait_till("all_players_connected");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i].score = points;
	}
}

/*
	Name: function_cee9017f
	Namespace: namespace_da78430a
	Checksum: 0xBC2619C6
	Offset: 0x95D8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 544
*/
function function_cee9017f()
{
	zm_audio::loadPlayerVoiceCategories("gamedata/audio/zm/zm_castle_vox.csv");
}

/*
	Name: intro_credits
	Namespace: namespace_da78430a
	Checksum: 0xA4ADB36E
	Offset: 0x9600
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 559
*/
function intro_credits()
{
	thread function_89f38c4c(" The Iron Dragon ", 50, 100, 3, 5);
	thread function_89f38c4c(" Near Werfen ", 50, 75, 2, 5);
	thread function_89f38c4c(" Austria ", 50, 50, 2, 5);
}

/*
	Name: function_89f38c4c
	Namespace: namespace_da78430a
	Checksum: 0x6CE63432
	Offset: 0x9688
	Size: 0x1A0
	Parameters: 5
	Flags: None
	Line Number: 576
*/
function function_89f38c4c(text, align_x, align_y, font_scale, fade_time)
{
	hud = NewHudElem();
	hud.foreground = 1;
	hud.fontscale = font_scale;
	hud.sort = 1;
	hud.hidewheninmenu = 0;
	hud.alignX = "left";
	hud.alignY = "bottom";
	hud.horzAlign = "left";
	hud.vertAlign = "bottom";
	hud.x = align_x;
	hud.y = hud.y - align_y;
	hud.alpha = 1;
	hud setText(text);
	wait(8);
	hud fadeOverTime(fade_time);
	hud.alpha = 0;
	wait(fade_time);
	hud destroy();
	return;
	~hud.alpha;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b8f281b0
	Namespace: namespace_da78430a
	Checksum: 0x20F55AAA
	Offset: 0x9830
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 611
*/
function function_b8f281b0()
{
	level flag::wait_till("initial_blackscreen_passed");
	level util::set_lighting_state(1);
	level flag::wait_till("power_on");
	level util::set_lighting_state(2);
}

/*
	Name: function_c28cdeba
	Namespace: namespace_da78430a
	Checksum: 0xD1761319
	Offset: 0x98B0
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 629
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
	Name: function_aa900fc4
	Namespace: namespace_da78430a
	Checksum: 0x6B93AE2C
	Offset: 0x9A40
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 656
*/
function function_aa900fc4()
{
	level waittill("power_on");
	foreach(player in GetPlayers())
	{
		player playlocalsound("power_cue_sound");
	}
}

/*
	Name: function_148d9374
	Namespace: namespace_da78430a
	Checksum: 0xA9836D36
	Offset: 0x9AF8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 675
*/
function function_148d9374()
{
	level flag::wait_till("initial_blackscreen_passed");
	var_5a02cdc9 = GetEntArray("musicmulti", "targetname");
	foreach(var_913e21f4 in var_5a02cdc9)
	{
		var_913e21f4 thread function_10e1e99d();
	}
}

/*
	Name: function_10e1e99d
	Namespace: namespace_da78430a
	Checksum: 0xA565AABB
	Offset: 0x9BD8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 695
*/
function function_10e1e99d()
{
	self waittill("trigger", player);
	if(level.musicplay == 0)
	{
		level.musicplay = 1;
		player playsoundwithnotify(self.script_string, "soundcomplete");
		player waittill("hash_6e7499f7");
		level.musicplay = 0;
		continue;
	}
}

/*
	Name: function_125aa444
	Namespace: namespace_da78430a
	Checksum: 0x6B6F67C
	Offset: 0x9C58
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 718
*/
function function_125aa444()
{
	var_deba8e85 = GetEntArray("rotate_ent", "targetname");
	if(isdefined(var_deba8e85))
	{
		for(i = 0; i < var_deba8e85.size; i++)
		{
			var_deba8e85[i] thread function_dbdbb94a();
		}
	}
}

/*
	Name: function_dbdbb94a
	Namespace: namespace_da78430a
	Checksum: 0xE5B1E8BE
	Offset: 0x9CE0
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 740
*/
function function_dbdbb94a()
{
	if(isdefined(self.script_transition_time))
	{
		speed = self.script_transition_time;
		continue;
	}
	speed = 0.5;
	if(isdefined(self.script_string))
	{
		level waittill("power_on");
	}
	if(isdefined(self.script_sound))
	{
		self PlayLoopSound(self.script_sound);
	}
	while(1)
	{
		if(isdefined(self.script_noteworthy))
		{
			if(self.script_noteworthy == "x")
			{
				self RotateRoll(360, speed);
			}
			else if(self.script_noteworthy == "y")
			{
				self RotatePitch(360, speed);
			}
			else if(self.script_noteworthy == "z")
			{
				self RotateYaw(360, speed);
			}
			else if(self.script_noteworthy == "-x")
			{
				self RotatePitch(-360, speed);
			}
			else if(self.script_noteworthy == "-y")
			{
				self RotateYaw(-360, speed);
			}
			else if(self.script_noteworthy == "-z")
			{
				self RotateYaw(-360, speed);
				continue;
			}
		}
		self RotateRoll(360, speed);
		wait(speed);
	}
}

/*
	Name: function_1a64f7d1
	Namespace: namespace_da78430a
	Checksum: 0x1625A00B
	Offset: 0x9EE8
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 801
*/
function function_1a64f7d1()
{
	level.var_8a138a29 = 0;
	key = GetEnt("key_trigger", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Activate Landing Pad");
	key thread wait_for_pickup();
	var_ce3309d8 = GetEntArray("key_door", "targetname");
	foreach(door in var_ce3309d8)
	{
		door setcursorhint("HINT_NOICON");
		door setHintString("Landing Pad Not Activated");
		door thread function_732dd211();
	}
}

/*
	Name: wait_for_pickup
	Namespace: namespace_da78430a
	Checksum: 0x2C4E0E8F
	Offset: 0xA078
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 827
*/
function wait_for_pickup()
{
	level endon("intermission");
	self waittill("trigger", player);
	model = GetEnt(self.target, "targetname");
	self delete();
	level.var_8a138a29 = 1;
	location = struct::get("lpad2", "targetname");
	model2 = spawn("script_model", location.origin);
	model2 SetModel("p7_zm_ctl_jumpsphere_landing_pad_snow_blue");
	playsoundatposition("launch_pad_on_00", player.origin);
	playsoundatposition("vox_cast_maxis_pad_pa_activate_0", player.origin);
	wait(0.05);
	model delete();
}

/*
	Name: function_732dd211
	Namespace: namespace_da78430a
	Checksum: 0xBFB43C23
	Offset: 0xA1E8
	Size: 0x268
	Parameters: 0
	Flags: None
	Line Number: 853
*/
function function_732dd211()
{
	level endon("intermission");
	while(!level.var_8a138a29)
	{
		wait(0.25);
	}
	self setHintString("Press and Hold ^3&&1^7 to Unlock Launch Pad");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	model2 = GetEnt("wsgate1", "targetname");
	playsoundatposition("zmb_cha_ching", player.origin);
	wait(0.05);
	playsoundatposition("gate_open", player.origin);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	location = struct::get("key_door_pad_struct", "targetname");
	model2 moveto(location.origin, 1, 0.25, 0.25);
	wait(2);
	model2 delete();
}

/*
	Name: function_266ccbcb
	Namespace: namespace_da78430a
	Checksum: 0x552E81A9
	Offset: 0xA458
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 891
*/
function function_266ccbcb()
{
	level.var_c8c250ed = 0;
	key = GetEnt("key_trigger_pad2", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Activate Landing Pad");
	key thread function_963603ab();
	var_c5d5e9e8 = GetEntArray("key_door_pad2", "targetname");
	foreach(door in var_c5d5e9e8)
	{
		door setcursorhint("HINT_NOICON");
		door setHintString("Landing Pad Not Activated");
		door thread function_5399be8b();
	}
}

/*
	Name: function_963603ab
	Namespace: namespace_da78430a
	Checksum: 0x3D4CAD86
	Offset: 0xA5E8
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 917
*/
function function_963603ab()
{
	level endon("intermission");
	self waittill("trigger", player);
	model = GetEnt(self.target, "targetname");
	self delete();
	level.var_c8c250ed = 1;
	location = struct::get("lpad2_pad2", "targetname");
	model2 = spawn("script_model", location.origin);
	model2 SetModel("p7_zm_ctl_jumpsphere_landing_pad_snow_blue");
	playsoundatposition("launch_pad_on_00", player.origin);
	playsoundatposition("vox_cast_maxis_pad_pa_activate_0", player.origin);
	wait(0.05);
	model delete();
	return;
	model2++;
}

/*
	Name: function_5399be8b
	Namespace: namespace_da78430a
	Checksum: 0x90ECE059
	Offset: 0xA758
	Size: 0x268
	Parameters: 0
	Flags: None
	Line Number: 945
*/
function function_5399be8b()
{
	level endon("intermission");
	while(!level.var_c8c250ed)
	{
		wait(0.25);
	}
	self setHintString("Press and Hold ^3&&1^7 to Unlock Launch Pad");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	model2 = GetEnt("wsgate2", "targetname");
	playsoundatposition("zmb_cha_ching", player.origin);
	wait(0.05);
	playsoundatposition("gate_open", player.origin);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	location = struct::get("key_door_pad2_struct", "targetname");
	model2 moveto(location.origin, 1, 0.25, 0.25);
	wait(2);
	model2 delete();
}

/*
	Name: function_32641ce1
	Namespace: namespace_da78430a
	Checksum: 0x52F33980
	Offset: 0xA9C8
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 983
*/
function function_32641ce1()
{
	level.var_31c50477 = 0;
	level.var_80d38640 = 0;
	key = GetEnt("key_trigger2", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Flak Gun Ammo");
	key thread function_a87a4681();
	var_ded4678a = GetEntArray("key_door1", "targetname");
	foreach(door in var_ded4678a)
	{
		door setcursorhint("HINT_NOICON");
		door thread function_3693afa1();
	}
}

/*
	Name: function_a87a4681
	Namespace: namespace_da78430a
	Checksum: 0x914F73C9
	Offset: 0xAB40
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 1009
*/
function function_a87a4681()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_22ab3c17)
	{
		wait(0.25);
	}
	model = GetEnt(self.target, "targetname");
	model moveto((-1101.5, -1798, 203.5), 0.1, 0.05, 0.05);
	wait(0.15);
	model thread zm_powerups::powerup_wobble();
	self TriggerEnable(1);
	self waittill("trigger", player);
	model delete();
	self delete();
	level.var_31c50477 = 1;
	playsoundatposition("zmb_craftable_pickup", player.origin);
}

/*
	Name: function_3693afa1
	Namespace: namespace_da78430a
	Checksum: 0xDE15B4E8
	Offset: 0xACA8
	Size: 0x6A8
	Parameters: 0
	Flags: None
	Line Number: 1039
*/
function function_3693afa1()
{
	level endon("intermission");
	while(!level.var_31c50477)
	{
		wait(0.25);
	}
	self setHintString("Press and Hold ^3&&1^7 to Fire Flak Gun");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("aa_load", player.origin);
	wait(0.8);
	playsoundatposition("wpn_aa_fire_01", player.origin);
	FX = spawn("script_model", (-1120, -1951, 235));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_flak1", 1);
	wait(0.2);
	fx2 = spawn("script_model", (452, -3362, 1150));
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_flak2", 1);
	FX3 = spawn("script_model", (485, -3347.5, 1286));
	FX3 SetModel("tag_origin");
	FX3 clientfield::set("fx_flak3", 1);
	var_fb2c4b25 = spawn("script_model", (352, -3252, 1172));
	var_fb2c4b25 SetModel("tag_origin");
	var_fb2c4b25 clientfield::set("fx_flak4", 1);
	var_d529d0bc = spawn("script_model", (394, -3362, 1292));
	var_d529d0bc SetModel("tag_origin");
	var_d529d0bc clientfield::set("fx_flak5", 1);
	playsoundatposition("stone_break_00", (428.5, -3390.75, 686.5));
	wait(0.2);
	var_47313ff7 = spawn("script_model", (344.25, -3417.75, 742.5));
	var_47313ff7 SetModel("tag_origin");
	var_47313ff7 clientfield::set("fx_flak6", 1);
	var_212ec58e = spawn("script_model", (344, -3417, 742));
	var_212ec58e SetModel("tag_origin");
	var_212ec58e clientfield::set("fx_flak4", 1);
	level.var_80d38640 = 1;
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	wait(10);
	FX clientfield::set("fx_flak1", 0);
	fx2 clientfield::set("fx_flak2", 0);
	FX3 clientfield::set("fx_flak3", 0);
	var_fb2c4b25 clientfield::set("fx_flak4", 0);
	var_d529d0bc clientfield::set("fx_flak5", 0);
	var_47313ff7 clientfield::set("fx_flak6", 0);
	var_212ec58e clientfield::set("fx_flak4", 0);
	FX delete();
	fx2 delete();
	FX3 delete();
	var_fb2c4b25 delete();
	var_d529d0bc delete();
	var_47313ff7 delete();
	var_212ec58e delete();
}

/*
	Name: function_c61a278
	Namespace: namespace_da78430a
	Checksum: 0xED154322
	Offset: 0xB358
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 1112
*/
function function_c61a278()
{
	level.var_b8662558 = 0;
	level.var_7f6824f7 = 0;
	key = GetEnt("key_trigger3", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Orb");
	key thread function_8277cc18();
	var_4d6e1f3 = GetEntArray("key_door3", "targetname");
	foreach(door in var_4d6e1f3)
	{
		door setcursorhint("HINT_NOICON");
		door thread function_10913538();
	}
}

/*
	Name: function_8277cc18
	Namespace: namespace_da78430a
	Checksum: 0x32A7BFE3
	Offset: 0xB4D0
	Size: 0x288
	Parameters: 0
	Flags: None
	Line Number: 1138
*/
function function_8277cc18()
{
	level endon("intermission");
	self waittill("trigger", player);
	model = GetEnt(self.target, "targetname");
	model delete();
	self delete();
	level.var_b8662558 = 1;
	playsoundatposition("fill", player.origin);
	FX = spawn("script_model", (210.5, -3631.5, 242.25));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbgreen", 1);
	wait(5);
	FX clientfield::set("fx_orbgreen", 0);
	FX delete();
	while(!level.var_7f6824f7)
	{
		wait(0.25);
	}
	while(!level.var_62c631a6)
	{
		wait(0.25);
	}
	while(!level.var_9af2440d)
	{
		wait(0.25);
	}
	while(!level.var_32a0bc0c)
	{
		wait(0.25);
	}
	var_fb2c4b25 = spawn("script_model", (-712, 718.25, 528.75));
	var_fb2c4b25 SetModel("tag_origin");
	PlayFXOnTag(level._effect["skeyglow"], var_fb2c4b25, "tag_origin");
	while(!level.var_3ca3b3ec)
	{
		wait(0.25);
	}
	var_fb2c4b25 delete();
}

/*
	Name: function_10913538
	Namespace: namespace_da78430a
	Checksum: 0xB484D2F2
	Offset: 0xB760
	Size: 0x650
	Parameters: 0
	Flags: None
	Line Number: 1189
*/
function function_10913538()
{
	level endon("intermission");
	while(!level.var_b8662558)
	{
		wait(0.25);
	}
	self setHintString("Press and Hold ^3&&1^7 to Place Orb");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("success", player.origin);
	FX = spawn("script_model", (-558, 558, 550));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbgreen", 1);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	location = struct::get("orbred2", "targetname");
	model = spawn("script_model", location.origin);
	model SetModel("p7_zm_ori_orb_wolf");
	level.var_7f6824f7 = 1;
	wait(5);
	FX clientfield::set("fx_orbgreen", 0);
	wait(0.5);
	while(!level.var_7cb96a63)
	{
		wait(0.25);
	}
	playsoundatposition("medal_acquired_mn", (-558, 558, 550));
	FX clientfield::set("fx_orbgreen", 1);
	PlayFXOnTag(level._effect["skeyglow"], FX, "tag_origin");
	wait(5);
	FX clientfield::set("fx_orbgreen", 0);
	while(!level.var_4738d26a)
	{
		wait(0.25);
	}
	playsoundatposition("finish_scenario_all", (-558, 558, 550));
	PlayFXOnTag(level._effect["wolfaura"], model, "tag_origin");
	while(!level.var_da0d3078)
	{
		wait(0.1);
	}
	location2 = struct::get("wolf_howl_merge_struct", "targetname");
	location3 = struct::get("orb_merge_struct", "targetname");
	model moveto(location2.origin, 1.5, 0.25, 0.25);
	wait(1.5);
	fx2 = spawn("script_model", (-558, 558, 581));
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbgreen", 1);
	wait(0.5);
	model moveto(location3.origin, 1, 0.25, 0.25);
	wait(1);
	FX3 = spawn("script_model", (-712, 717.75, 539.75));
	FX3 SetModel("tag_origin");
	FX3 clientfield::set("fx_orbgreen", 1);
	model delete();
	wait(5);
	fx2 clientfield::set("fx_orbgreen", 0);
	FX3 clientfield::set("fx_orbgreen", 0);
	FX delete();
	fx2 delete();
	FX3 delete();
}

/*
	Name: function_1672fb57
	Namespace: namespace_da78430a
	Checksum: 0x2B2C50B
	Offset: 0xBDB8
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 1269
*/
function function_1672fb57()
{
	level.var_fae13699 = 0;
	level.var_62c631a6 = 0;
	key = GetEnt("key_trigger4", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Orb");
	key thread function_8c8924f7();
	var_2ad95c5c = GetEntArray("key_door4", "targetname");
	foreach(door in var_2ad95c5c)
	{
		door setcursorhint("HINT_NOICON");
		door thread function_1aa28e17();
	}
}

/*
	Name: function_8c8924f7
	Namespace: namespace_da78430a
	Checksum: 0x7605977C
	Offset: 0xBF30
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 1295
*/
function function_8c8924f7()
{
	level endon("intermission");
	self waittill("trigger", player);
	model = GetEnt(self.target, "targetname");
	model delete();
	self delete();
	level.var_fae13699 = 1;
	playsoundatposition("fill", player.origin);
	FX = spawn("script_model", (-897.75, 1890.25, 8.75));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbred", 1);
	wait(5);
	FX clientfield::set("fx_orbred", 0);
	FX delete();
}

/*
	Name: function_1aa28e17
	Namespace: namespace_da78430a
	Checksum: 0x833F1B50
	Offset: 0xC0A8
	Size: 0x650
	Parameters: 0
	Flags: None
	Line Number: 1322
*/
function function_1aa28e17()
{
	level endon("intermission");
	while(!level.var_fae13699)
	{
		wait(0.25);
	}
	self setHintString("Press and Hold ^3&&1^7 to Place Orb");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("success", player.origin);
	FX = spawn("script_model", (-882, 564, 550));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbred", 1);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	location = struct::get("orbgreen2", "targetname");
	model = spawn("script_model", location.origin);
	model SetModel("p7_zm_ori_orb_fire");
	level.var_62c631a6 = 1;
	wait(5);
	FX clientfield::set("fx_orbred", 0);
	wait(0.5);
	while(!level.var_186b0770)
	{
		wait(0.25);
	}
	playsoundatposition("medal_acquired_mn", (-882, 564, 517));
	FX clientfield::set("fx_orbred", 1);
	PlayFXOnTag(level._effect["skeyglow"], FX, "tag_origin");
	wait(5);
	FX clientfield::set("fx_orbred", 0);
	while(!level.var_60d3a457)
	{
		wait(0.25);
	}
	playsoundatposition("finish_scenario_all", (-882, 564, 517));
	PlayFXOnTag(level._effect["runearrowglow"], model, "tag_origin");
	while(!level.var_da0d3078)
	{
		wait(0.1);
	}
	location2 = struct::get("rune_prison_merge_struct", "targetname");
	location3 = struct::get("orb_merge_struct", "targetname");
	model moveto(location2.origin, 1.5, 0.25, 0.25);
	wait(1.5);
	fx2 = spawn("script_model", (-882, 564, 581));
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbred", 1);
	wait(0.5);
	model moveto(location3.origin, 1, 0.25, 0.25);
	wait(1);
	FX3 = spawn("script_model", (-712, 717.75, 539.75));
	FX3 SetModel("tag_origin");
	FX3 clientfield::set("fx_orbred", 1);
	model delete();
	wait(5);
	fx2 clientfield::set("fx_orbred", 0);
	FX3 clientfield::set("fx_orbred", 0);
	FX delete();
	fx2 delete();
	FX3 delete();
}

/*
	Name: function_f07080ee
	Namespace: namespace_da78430a
	Checksum: 0xB87E28D4
	Offset: 0xC700
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 1402
*/
function function_f07080ee()
{
	level.var_2e2e040a = 0;
	level.var_9af2440d = 0;
	key = GetEnt("key_trigger5", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Orb");
	key thread function_6686aa8e();
	var_50dbd6c5 = GetEntArray("key_door5", "targetname");
	foreach(door in var_50dbd6c5)
	{
		door setcursorhint("HINT_NOICON");
		door thread function_f4a013ae();
	}
	return;
}

/*
	Name: function_6686aa8e
	Namespace: namespace_da78430a
	Checksum: 0xD8A5B851
	Offset: 0xC878
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 1429
*/
function function_6686aa8e()
{
	level endon("intermission");
	self waittill("trigger", player);
	model = GetEnt(self.target, "targetname");
	model delete();
	self delete();
	level.var_2e2e040a = 1;
	playsoundatposition("fill", player.origin);
	FX = spawn("script_model", (281.5, 1729, 10));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbblue", 1);
	wait(5);
	FX clientfield::set("fx_orbblue", 0);
	FX delete();
}

/*
	Name: function_f4a013ae
	Namespace: namespace_da78430a
	Checksum: 0xE05D11D9
	Offset: 0xC9E8
	Size: 0x650
	Parameters: 0
	Flags: None
	Line Number: 1456
*/
function function_f4a013ae()
{
	level endon("intermission");
	while(!level.var_2e2e040a)
	{
		wait(0.25);
	}
	self setHintString("Press and Hold ^3&&1^7 to Place Orb");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("success", player.origin);
	FX = spawn("script_model", (-546, 894, 550));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbblue", 1);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	location = struct::get("orbblue2", "targetname");
	model = spawn("script_model", location.origin);
	model SetModel("p7_zm_ori_orb_ice");
	level.var_9af2440d = 1;
	wait(5);
	FX clientfield::set("fx_orbblue", 0);
	wait(0.5);
	while(!level.var_c8fdaf4d)
	{
		wait(0.25);
	}
	playsoundatposition("medal_acquired_mn", (-546, 894, 517));
	FX clientfield::set("fx_orbblue", 1);
	PlayFXOnTag(level._effect["skeyglow"], FX, "tag_origin");
	wait(5);
	FX clientfield::set("fx_orbblue", 0);
	while(!level.var_827912e0)
	{
		wait(0.25);
	}
	playsoundatposition("finish_scenario_all", (-546, 894, 517));
	PlayFXOnTag(level._effect["stormaura"], model, "tag_origin");
	while(!level.var_da0d3078)
	{
		wait(0.1);
	}
	location2 = struct::get("storm_merge_struct", "targetname");
	location3 = struct::get("orb_merge_struct", "targetname");
	model moveto(location2.origin, 1.5, 0.25, 0.25);
	wait(1.5);
	fx2 = spawn("script_model", (-546, 894, 581));
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbblue", 1);
	wait(0.5);
	model moveto(location3.origin, 1, 0.25, 0.25);
	wait(1);
	FX3 = spawn("script_model", (-712, 717.75, 539.75));
	FX3 SetModel("tag_origin");
	FX3 clientfield::set("fx_orbblue", 1);
	model delete();
	wait(5);
	fx2 clientfield::set("fx_orbblue", 0);
	FX3 clientfield::set("fx_orbblue", 0);
	FX delete();
	fx2 delete();
	FX3 delete();
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: function_ca6e0685
	Namespace: namespace_da78430a
	Checksum: 0xDC8F9C9B
	Offset: 0xD040
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 1539
*/
function function_ca6e0685()
{
	// Could not fully decompile function; skipped
}

/*
	Name: function_40843025
	Namespace: namespace_da78430a
	Checksum: 0xCA32C5C4
	Offset: 0xD1B8
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 1554
*/
function function_40843025()
{
	level endon("intermission");
	self waittill("trigger", player);
	model = GetEnt(self.target, "targetname");
	model delete();
	self delete();
	level.var_ad38163b = 1;
	playsoundatposition("fill", player.origin);
	FX = spawn("script_model", (-348.5, 1823, 2));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbyellow", 1);
	wait(5);
	FX clientfield::set("fx_orbyellow", 0);
	FX delete();
}

/*
	Name: function_ce9d9945
	Namespace: namespace_da78430a
	Checksum: 0x65FCC9B9
	Offset: 0xD328
	Size: 0x650
	Parameters: 0
	Flags: None
	Line Number: 1581
*/
function function_ce9d9945()
{
	level endon("intermission");
	while(!level.var_ad38163b)
	{
		wait(0.25);
	}
	self setHintString("Press and Hold ^3&&1^7 to Place Orb");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("success", player.origin);
	FX = spawn("script_model", (-874, 886, 550));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbyellow", 1);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	location = struct::get("orbyellow2", "targetname");
	model = spawn("script_model", location.origin);
	model SetModel("p7_zm_ori_orb_lightning");
	level.var_32a0bc0c = 1;
	wait(5);
	FX clientfield::set("fx_orbyellow", 0);
	wait(0.5);
	while(!level.var_f05836f6)
	{
		wait(0.25);
	}
	playsoundatposition("medal_acquired_mn", (-874, 886, 517));
	FX clientfield::set("fx_orbyellow", 1);
	PlayFXOnTag(level._effect["skeyglow"], FX, "tag_origin");
	wait(5);
	FX clientfield::set("fx_orbyellow", 0);
	while(!level.var_3b17bf71)
	{
		wait(0.25);
	}
	playsoundatposition("finish_scenario_all", (-874, 886, 517));
	PlayFXOnTag(level._effect["demonaura"], model, "tag_origin");
	while(!level.var_da0d3078)
	{
		wait(0.1);
	}
	location2 = struct::get("demongate_merge_struct", "targetname");
	location3 = struct::get("orb_merge_struct", "targetname");
	model moveto(location2.origin, 1.5, 0.25, 0.25);
	wait(1.5);
	fx2 = spawn("script_model", (-874, 886, 581));
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbyellow", 1);
	wait(0.5);
	model moveto(location3.origin, 1, 0.25, 0.25);
	wait(1);
	FX3 = spawn("script_model", (-712, 717.75, 539.75));
	FX3 SetModel("tag_origin");
	FX3 clientfield::set("fx_orbyellow", 1);
	model delete();
	wait(5);
	fx2 clientfield::set("fx_orbyellow", 0);
	FX3 clientfield::set("fx_orbyellow", 0);
	FX delete();
	fx2 delete();
	FX3 delete();
	return;
}

/*
	Name: function_8b695e16
	Namespace: namespace_da78430a
	Checksum: 0xB775531E
	Offset: 0xD980
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1662
*/
function function_8b695e16()
{
	level.var_40cce652 = 0;
	key = GetEnt("raven1", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_c075fab0();
}

/*
	Name: function_c075fab0
	Namespace: namespace_da78430a
	Checksum: 0x3F90D5C0
	Offset: 0xDA20
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 1681
*/
function function_c075fab0()
{
	level endon("intermission");
	e_model = GetEnt("raven_1", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	model = GetEnt(self.target, "targetname");
	self delete();
	playsoundatposition("amb_raven_caws_05", (-397.402, -612.069, 217.5));
	FX = spawn("script_model", (-395.763, -608.492, 217.75));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_raven", 1);
	wait(0.1);
	level.var_40cce652 = 1;
	wait(3);
	FX clientfield::set("fx_raven", 0);
	FX delete();
}

/*
	Name: function_6566e3ad
	Namespace: namespace_da78430a
	Checksum: 0x500E4D6A
	Offset: 0xDC78
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1715
*/
function function_6566e3ad()
{
	level.var_40994263 = 0;
	key = GetEnt("raven2", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_327d69eb();
}

/*
	Name: function_327d69eb
	Namespace: namespace_da78430a
	Checksum: 0x459A8379
	Offset: 0xDD18
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 1734
*/
function function_327d69eb()
{
	level endon("intermission");
	e_model = GetEnt("raven_2", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	model = GetEnt(self.target, "targetname");
	self delete();
	playsoundatposition("amb_raven_caws_05", (-1151.19, 46.692, 863.5));
	FX = spawn("script_model", (-1151.19, 46.692, 863.5));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_raven", 1);
	wait(0.1);
	level.var_40994263 = 1;
	wait(3);
	FX clientfield::set("fx_raven", 0);
	FX delete();
	return;
}

/*
	Name: function_3f646944
	Namespace: namespace_da78430a
	Checksum: 0x370D136F
	Offset: 0xDF70
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1769
*/
function function_3f646944()
{
	level.var_d4888fd4 = 0;
	key = GetEnt("raven3", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_c7aef82();
}

/*
	Name: function_c7aef82
	Namespace: namespace_da78430a
	Checksum: 0x98F787C6
	Offset: 0xE010
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 1788
*/
function function_c7aef82()
{
	level endon("intermission");
	e_model = GetEnt("raven_3", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	model = GetEnt(self.target, "targetname");
	self delete();
	playsoundatposition("amb_raven_caws_05", (-92.1528, -1830.65, 295.75));
	FX = spawn("script_model", (-92.1528, -1830.65, 295.75));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_raven", 1);
	wait(0.1);
	level.var_d4888fd4 = 1;
	wait(3);
	FX clientfield::set("fx_raven", 0);
	FX delete();
}

/*
	Name: function_1961eedb
	Namespace: namespace_da78430a
	Checksum: 0xD92C5B82
	Offset: 0xE268
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1822
*/
function function_1961eedb()
{
	level.var_bcba698d = 0;
	key = GetEnt("raven4", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_7e825ebd();
}

/*
	Name: function_7e825ebd
	Namespace: namespace_da78430a
	Checksum: 0xFE115E40
	Offset: 0xE308
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 1841
*/
function function_7e825ebd()
{
	level endon("intermission");
	e_model = GetEnt("raven_4", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	model = GetEnt(self.target, "targetname");
	self delete();
	playsoundatposition("amb_raven_caws_05", (-1018.74, -4102.3, 402));
	FX = spawn("script_model", (-1018.74, -4102.3, 402));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_raven", 1);
	wait(0.1);
	level.var_bcba698d = 1;
	wait(3);
	FX clientfield::set("fx_raven", 0);
	FX delete();
}

/*
	Name: function_f35f7472
	Namespace: namespace_da78430a
	Checksum: 0x44A40816
	Offset: 0xE560
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1875
*/
function function_f35f7472()
{
	level.var_d168361e = 0;
	key = GetEnt("raven5", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_587fe454();
}

/*
	Name: function_587fe454
	Namespace: namespace_da78430a
	Checksum: 0x28F8C25E
	Offset: 0xE600
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 1894
*/
function function_587fe454()
{
	level endon("intermission");
	e_model = GetEnt("raven_5", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	model = GetEnt(self.target, "targetname");
	self delete();
	playsoundatposition("amb_raven_caws_05", (405.21, -379.49, 297.594));
	FX = spawn("script_model", (405.21, -379.49, 307.094));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_raven", 1);
	wait(0.1);
	level.var_d168361e = 1;
	wait(3);
	FX clientfield::set("fx_raven", 0);
	FX delete();
	return;
}

/*
	Name: function_8d17b82d
	Namespace: namespace_da78430a
	Checksum: 0xE689436E
	Offset: 0xE858
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 1929
*/
function function_8d17b82d()
{
	thread function_adf283e3();
}

/*
	Name: function_adf283e3
	Namespace: namespace_da78430a
	Checksum: 0xF3F72B25
	Offset: 0xE878
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 1944
*/
function function_adf283e3()
{
	level endon("intermission");
	while(!level.var_40cce652)
	{
		wait(0.25);
	}
	while(!level.var_40994263)
	{
		wait(0.25);
	}
	while(!level.var_d4888fd4)
	{
		wait(0.25);
	}
	while(!level.var_bcba698d)
	{
		wait(0.25);
	}
	while(!level.var_d168361e)
	{
		wait(0.25);
	}
	wait(1.5);
	foreach(player in level.players)
	{
		player zm_perks::give_random_perk();
	}
	playsoundatposition("success2", player.origin);
}

/*
	Name: function_76384461
	Namespace: namespace_da78430a
	Checksum: 0xE75D459D
	Offset: 0xE9C8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1985
*/
function function_76384461()
{
	level.var_9590ef8f = 0;
	key = GetEnt("teddy1", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_fdeccedf();
}

/*
	Name: function_fdeccedf
	Namespace: namespace_da78430a
	Checksum: 0xE3FC3AAE
	Offset: 0xEA48
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2003
*/
function function_fdeccedf()
{
	level endon("intermission");
	self PlayLoopSound("meteor_loop");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("meteor_affirm", player.origin);
	self delete();
	wait(0.1);
	level.var_9590ef8f = 1;
}

/*
	Name: function_9c3abeca
	Namespace: namespace_da78430a
	Checksum: 0x5DE76B7A
	Offset: 0xEB10
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 2025
*/
function function_9c3abeca()
{
	level.var_a3d8bee = 0;
	key = GetEnt("teddy2", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_8be55fa4();
}

/*
	Name: function_8be55fa4
	Namespace: namespace_da78430a
	Checksum: 0xBBD8EA06
	Offset: 0xEB90
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2043
*/
function function_8be55fa4()
{
	level endon("intermission");
	self PlayLoopSound("meteor_loop");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("meteor_affirm", player.origin);
	self delete();
	wait(0.1);
	level.var_a3d8bee = 1;
}

/*
	Name: function_c23d3933
	Namespace: namespace_da78430a
	Checksum: 0x60F9620E
	Offset: 0xEC58
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 2065
*/
function function_c23d3933()
{
	level.var_997e6cdd = 0;
	key = GetEnt("teddy3", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_b1e7da0d();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b1e7da0d
	Namespace: namespace_da78430a
	Checksum: 0xA3E68346
	Offset: 0xECD8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2085
*/
function function_b1e7da0d()
{
	level endon("intermission");
	self PlayLoopSound("meteor_loop");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("meteor_affirm", player.origin);
	self delete();
	wait(0.1);
	level.var_997e6cdd = 1;
}

/*
	Name: function_b6cd88b6
	Namespace: namespace_da78430a
	Checksum: 0x8A5B8F8B
	Offset: 0xEDA0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 2107
*/
function function_b6cd88b6()
{
	thread function_765c6dc8();
}

/*
	Name: function_765c6dc8
	Namespace: namespace_da78430a
	Checksum: 0xB3FCB68C
	Offset: 0xEDC0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 2122
*/
function function_765c6dc8()
{
	level endon("intermission");
	while(!level.var_9590ef8f)
	{
		wait(0.25);
	}
	while(!level.var_a3d8bee)
	{
		wait(0.25);
	}
	while(!level.var_997e6cdd)
	{
		wait(0.25);
	}
	foreach(player in GetPlayers())
	{
		player playsoundtoplayer("dead_again_43", player);
	}
}

/*
	Name: function_253672a9
	Namespace: namespace_da78430a
	Checksum: 0x518FCCBD
	Offset: 0xEEC0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 2153
*/
function function_253672a9()
{
	level.var_6de71139 = 0;
	key = GetEnt("radio1", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_8cbeb427();
}

/*
	Name: function_8cbeb427
	Namespace: namespace_da78430a
	Checksum: 0x5F2519BE
	Offset: 0xEF40
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2171
*/
function function_8cbeb427()
{
	level endon("intermission");
	self PlayLoopSound("meteor_loop");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("meteor_affirm", player.origin);
	self delete();
	wait(0.1);
	level.var_6de71139 = 1;
}

/*
	Name: function_4b38ed12
	Namespace: namespace_da78430a
	Checksum: 0xAC652E37
	Offset: 0xF008
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 2193
*/
function function_4b38ed12()
{
	level.var_690bc80c = 0;
	key = GetEnt("radio2", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_1ab744ec();
}

/*
	Name: function_1ab744ec
	Namespace: namespace_da78430a
	Checksum: 0xDCF2CA51
	Offset: 0xF088
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2211
*/
function function_1ab744ec()
{
	level endon("intermission");
	self PlayLoopSound("meteor_loop");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("meteor_affirm", player.origin);
	self delete();
	wait(0.1);
	level.var_690bc80c = 1;
}

/*
	Name: function_713b677b
	Namespace: namespace_da78430a
	Checksum: 0x9594EC4D
	Offset: 0xF150
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 2233
*/
function function_713b677b()
{
	level.var_ac17945b = 0;
	key = GetEnt("radio3", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_40b9bf55();
}

/*
	Name: function_40b9bf55
	Namespace: namespace_da78430a
	Checksum: 0xA85AD557
	Offset: 0xF1D0
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2251
*/
function function_40b9bf55()
{
	level endon("intermission");
	self PlayLoopSound("meteor_loop");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("meteor_affirm", player.origin);
	self delete();
	wait(0.1);
	level.var_ac17945b = 1;
}

/*
	Name: function_a959025e
	Namespace: namespace_da78430a
	Checksum: 0xF107CE8D
	Offset: 0xF298
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 2273
*/
function function_a959025e()
{
	thread function_d4d77c10();
}

/*
	Name: function_d4d77c10
	Namespace: namespace_da78430a
	Checksum: 0xB679BE29
	Offset: 0xF2B8
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 2288
*/
function function_d4d77c10()
{
	level endon("intermission");
	while(!level.var_6de71139)
	{
		wait(0.25);
	}
	while(!level.var_690bc80c)
	{
		wait(0.25);
	}
	while(!level.var_ac17945b)
	{
		wait(0.25);
	}
	foreach(player in GetPlayers())
	{
		player playsoundtoplayer("shepherd_of_fire", player);
	}
}

/*
	Name: function_2931353
	Namespace: namespace_da78430a
	Checksum: 0x315D0EE4
	Offset: 0xF3B8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 2319
*/
function function_2931353()
{
	level.var_b7ae5773 = 0;
	key = GetEnt("vase1", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_d8cdf23d();
}

/*
	Name: function_d8cdf23d
	Namespace: namespace_da78430a
	Checksum: 0x17CD25AB
	Offset: 0xF458
	Size: 0x310
	Parameters: 0
	Flags: None
	Line Number: 2338
*/
function function_d8cdf23d()
{
	level endon("intermission");
	e_model = GetEnt("vase_1", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	model = GetEnt(self.target, "targetname");
	self delete();
	playsoundatposition("brick_break_05", (15.75, -1294.75, -157.25));
	FX = spawn("script_model", (15.75, -1294.75, -157.25));
	FX.angles = VectorScale((0, 1, 0), 180);
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["vase"], FX, "tag_origin");
	fx2 = spawn("script_model", (18.75, -1294.25, -156.25));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbred", 1);
	wait(0.1);
	level.var_b7ae5773 = 1;
	wait(3);
	fx2 clientfield::set("fx_orbred", 0);
	fx2 delete();
	FX delete();
	return;
}

/*
	Name: function_908ba418
	Namespace: namespace_da78430a
	Checksum: 0x67B0823B
	Offset: 0xF770
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 2378
*/
function function_908ba418()
{
	level.var_c28776a2 = 0;
	key = GetEnt("vase2", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_fed06ca6();
}

/*
	Name: function_fed06ca6
	Namespace: namespace_da78430a
	Checksum: 0xF7BEDA72
	Offset: 0xF810
	Size: 0x310
	Parameters: 0
	Flags: None
	Line Number: 2397
*/
function function_fed06ca6()
{
	level endon("intermission");
	e_model = GetEnt("vase_2", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	model = GetEnt(self.target, "targetname");
	self delete();
	playsoundatposition("brick_break_05", (-217.5, -1015.75, -158.25));
	FX = spawn("script_model", (-217.5, -1015.75, -158.25));
	FX.angles = VectorScale((0, 1, 0), 270);
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["vase"], FX, "tag_origin");
	fx2 = spawn("script_model", (-217.75, -1010.75, -156.75));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbred", 1);
	wait(0.1);
	level.var_c28776a2 = 1;
	wait(3);
	fx2 clientfield::set("fx_orbred", 0);
	fx2 delete();
	FX delete();
}

/*
	Name: function_b68e1e81
	Namespace: namespace_da78430a
	Checksum: 0xD61EDB49
	Offset: 0xFB28
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 2436
*/
function function_b68e1e81()
{
	level.var_10caaf91 = 0;
	key = GetEnt("vase3", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_24d2e70f();
}

/*
	Name: function_24d2e70f
	Namespace: namespace_da78430a
	Checksum: 0x93A19261
	Offset: 0xFBC8
	Size: 0x308
	Parameters: 0
	Flags: None
	Line Number: 2455
*/
function function_24d2e70f()
{
	level endon("intermission");
	e_model = GetEnt("vase_3", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	model = GetEnt(self.target, "targetname");
	self delete();
	playsoundatposition("brick_break_05", (-830.25, -1015.75, -184));
	FX = spawn("script_model", (-830.25, -1015.75, -184));
	FX.angles = VectorScale((0, 1, 0), 270);
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["vase"], FX, "tag_origin");
	fx2 = spawn("script_model", (-831, -1012, -182.5));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbred", 1);
	wait(0.1);
	level.var_10caaf91 = 1;
	wait(3);
	fx2 clientfield::set("fx_vase", 0);
	fx2 delete();
	FX delete();
}

/*
	Name: function_749a828e
	Namespace: namespace_da78430a
	Checksum: 0x248BAF0B
	Offset: 0xFED8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 2494
*/
function function_749a828e()
{
	level.var_c1009fb0 = 0;
	key = GetEnt("vase4", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_1ac18e30();
}

/*
	Name: function_1ac18e30
	Namespace: namespace_da78430a
	Checksum: 0x6F7F147A
	Offset: 0xFF78
	Size: 0x300
	Parameters: 0
	Flags: None
	Line Number: 2513
*/
function function_1ac18e30()
{
	level endon("intermission");
	e_model = GetEnt("vase_4", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	model = GetEnt(self.target, "targetname");
	self delete();
	playsoundatposition("brick_break_05", (-973, -1271.75, -236.25));
	FX = spawn("script_model", (-973, -1271.75, -236.25));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["vase"], FX, "tag_origin");
	fx2 = spawn("script_model", (-976, -1272, -234.75));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbred", 1);
	wait(0.1);
	level.var_c1009fb0 = 1;
	wait(3);
	fx2 clientfield::set("fx_vase", 0);
	fx2 delete();
	FX delete();
}

/*
	Name: function_9a9cfcf7
	Namespace: namespace_da78430a
	Checksum: 0x3BD0E2F8
	Offset: 0x10280
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 2552
*/
function function_9a9cfcf7()
{
	level.var_f4dc4acf = 0;
	key = GetEnt("vase5", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_40c40899();
}

/*
	Name: function_40c40899
	Namespace: namespace_da78430a
	Checksum: 0x5BB6D681
	Offset: 0x10320
	Size: 0x308
	Parameters: 0
	Flags: None
	Line Number: 2571
*/
function function_40c40899()
{
	level endon("intermission");
	e_model = GetEnt("vase_5", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	model = GetEnt(self.target, "targetname");
	self delete();
	playsoundatposition("brick_break_05", (-973.25, -1396.5, -157.75));
	FX = spawn("script_model", (-973.25, -1396.5, -157.75));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["vase"], FX, "tag_origin");
	fx2 = spawn("script_model", (-976.25, -1397, -156.75));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbred", 1);
	wait(0.1);
	level.var_f4dc4acf = 1;
	wait(3);
	fx2 clientfield::set("fx_vase", 0);
	fx2 delete();
	FX delete();
}

/*
	Name: function_fed3c4f4
	Namespace: namespace_da78430a
	Checksum: 0x417A2ACB
	Offset: 0x10630
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 2610
*/
function function_fed3c4f4()
{
	thread function_23c7547a();
}

/*
	Name: function_23c7547a
	Namespace: namespace_da78430a
	Checksum: 0x5A1F1712
	Offset: 0x10650
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 2625
*/
function function_23c7547a()
{
	level endon("intermission");
	while(!level.var_b7ae5773)
	{
		wait(0.25);
	}
	while(!level.var_c28776a2)
	{
		wait(0.25);
	}
	while(!level.var_10caaf91)
	{
		wait(0.25);
	}
	while(!level.var_c1009fb0)
	{
		wait(0.25);
	}
	while(!level.var_f4dc4acf)
	{
		wait(0.25);
	}
	wait(1.5);
	playsoundatposition("success2", (-480.5, -1075, -209.25));
	location = struct::get("vase_ammo", "targetname");
	wait(0.25);
	level thread zm_powerups::specific_powerup_drop("full_ammo", location.origin);
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_29dbc4c9
	Namespace: namespace_da78430a
	Checksum: 0x9AD00D4C
	Offset: 0x10778
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 2668
*/
function function_29dbc4c9()
{
	level.var_82cd5277 = 0;
	level.var_d1dbd440 = 0;
	level.var_5d06c233 = 0;
	key = GetEnt("booze_key", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_8148102();
	thread function_a8775283();
	thread function_df86b73e();
	var_ce3309d8 = GetEntArray("booze_key_door", "targetname");
	foreach(door in var_ce3309d8)
	{
		door setcursorhint("HINT_NOICON");
		door thread function_7e7f3a62();
	}
}

/*
	Name: function_8148102
	Namespace: namespace_da78430a
	Checksum: 0xCE957620
	Offset: 0x10900
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 2696
*/
function function_8148102()
{
	level endon("intermission");
	self waittill("trigger", player);
	model = GetEnt(self.target, "targetname");
	self delete();
	level.var_82cd5277 = 1;
	playsoundatposition("memento_pickup", player.origin);
	FX = spawn("script_model", (-668, 564, 115.75));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["booze"], FX, "tag_origin");
	wait(0.05);
	model delete();
	wait(3);
	FX delete();
}

/*
	Name: function_7e7f3a62
	Namespace: namespace_da78430a
	Checksum: 0x60D58218
	Offset: 0x10A80
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 2724
*/
function function_7e7f3a62()
{
	level endon("intermission");
	while(!level.var_82cd5277)
	{
		wait(0.25);
	}
	var_16035636 = GetEnt("cell_door", "targetname");
	self waittill("trigger", player);
	var_16035636 RotateYaw(120, 1, 0.1, 0.1);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("zmb_metal_door_standard_01", player.origin);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	level.var_d1dbd440 = 1;
}

/*
	Name: function_a8775283
	Namespace: namespace_da78430a
	Checksum: 0x3D87B55
	Offset: 0x10C20
	Size: 0x300
	Parameters: 0
	Flags: None
	Line Number: 2755
*/
function function_a8775283()
{
	level endon("intermission");
	fx2 = spawn("script_model", (-539.5, 1056, 87));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	PlayFXOnTag(level._effect["boozeglint"], fx2, "tag_origin");
	while(!level.var_d1dbd440)
	{
		wait(0.25);
	}
	var_4941161 = GetEnt("booze_trigger", "targetname");
	var_4941161 setcursorhint("HINT_NOICON");
	var_4941161 waittill("trigger", player);
	models = GetEntArray(var_4941161.target, "targetname");
	playsoundatposition("fly_booze_pickup", player.origin);
	FX = spawn("script_model", (-539, 1057.25, 89.5));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["booze"], FX, "tag_origin");
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	var_4941161 delete();
	level.var_5d06c233 = 1;
	fx2 delete();
	wait(3);
	FX delete();
	return;
}

/*
	Name: function_df86b73e
	Namespace: namespace_da78430a
	Checksum: 0xCF1C23B2
	Offset: 0x10F28
	Size: 0x2A0
	Parameters: 0
	Flags: None
	Line Number: 2798
*/
function function_df86b73e()
{
	level endon("intermission");
	var_dd04db8 = GetEnt("booze_painting_trigger", "targetname");
	var_dd04db8 setcursorhint("HINT_NOICON");
	var_dd04db8 TriggerEnable(0);
	while(!level.var_5d06c233)
	{
		wait(0.25);
	}
	var_dd04db8 TriggerEnable(1);
	var_dd04db8 waittill("trigger", player);
	location = struct::get("booze_struct", "targetname");
	model2 = spawn("script_model", location.origin);
	model2.angles = VectorScale((0, 1, 0), 90);
	model2 SetModel("p7_zm_ctl_booze");
	FX = spawn("script_model", location.origin);
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["booze"], FX, "tag_origin");
	playsoundatposition("fly_booze_pickup", player.origin);
	wait(0.05);
	var_dd04db8 delete();
	wait(0.5);
	playsoundatposition("gimme_00", player.origin);
	wait(1);
	player zm_score::add_to_player_score(750);
	wait(3);
	FX delete();
	return;
	continue;
}

/*
	Name: function_b3b8692f
	Namespace: namespace_da78430a
	Checksum: 0x315ADBEF
	Offset: 0x111D0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 2841
*/
function function_b3b8692f()
{
	level.var_cd79d15d = 0;
	level.var_d668bf71 = 0;
	level.var_36f1f658 = 1;
	level.var_a1a11120 = 0;
	level.var_8e00ae25 = 0;
	key = GetEnt("dg4_puzzle1", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_5305af11();
	return;
	~key;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5305af11
	Namespace: namespace_da78430a
	Checksum: 0xC46870C1
	Offset: 0x11280
	Size: 0x808
	Parameters: 0
	Flags: None
	Line Number: 2866
*/
function function_5305af11()
{
	level endon("intermission");
	var_7c6ce185 = GetEnt("dg4_puzzle_block1", "targetname");
	model2 = GetEnt("dg4_puzzle_block_code1", "targetname");
	model3 = GetEnt("puzzle_switch_1", "targetname");
	self TriggerEnable(0);
	while(1)
	{
		self TriggerEnable(1);
		self waittill("trigger", player);
		self TriggerEnable(0);
		level notify("hash_e021c6ad");
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		model3 useanimtree(-1);
		model3 AnimScripted("ori_puzzle_switch_anim", model3.origin, model3.angles, %ori_puzzle_switch_anim);
		level.var_d668bf71 = 0;
		level.var_36f1f658 = 0;
		level.var_a1a11120 = 1;
		level.var_8e00ae25 = 0;
		playsoundatposition("evt_power_switch_moon", player.origin);
		wait(0.5);
		var_7c6ce185 RotateYaw(-90, 0.5, 0.05, 0.05);
		model2 RotateYaw(-90, 0.5, 0.05, 0.05);
		playsoundatposition("pillar_move_03", (-1433, 1001.5, 729.75));
		wait(0.5);
		model3 StopAnimScripted();
		self TriggerEnable(1);
		self waittill("trigger", player);
		self TriggerEnable(0);
		level notify("hash_cceac082");
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		model3 useanimtree(-1);
		model3 AnimScripted("ori_puzzle_switch_anim", model3.origin, model3.angles, %ori_puzzle_switch_anim);
		level.var_d668bf71 = 0;
		level.var_36f1f658 = 0;
		level.var_a1a11120 = 0;
		level.var_8e00ae25 = 1;
		playsoundatposition("evt_power_switch_moon", player.origin);
		wait(0.5);
		var_7c6ce185 RotateYaw(-90, 0.5, 0.05, 0.05);
		model2 RotateYaw(-90, 0.5, 0.05, 0.05);
		playsoundatposition("pillar_move_03", (-1433, 1001.5, 729.75));
		wait(0.5);
		model3 StopAnimScripted();
		self TriggerEnable(1);
		self waittill("trigger", player);
		self TriggerEnable(0);
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		model3 useanimtree(-1);
		model3 AnimScripted("ori_puzzle_switch_anim", model3.origin, model3.angles, %ori_puzzle_switch_anim);
		level.var_d668bf71 = 1;
		level.var_36f1f658 = 0;
		level.var_a1a11120 = 0;
		level.var_8e00ae25 = 0;
		playsoundatposition("evt_power_switch_moon", player.origin);
		wait(0.5);
		var_7c6ce185 RotateYaw(-90, 0.5, 0.05, 0.05);
		model2 RotateYaw(-90, 0.5, 0.05, 0.05);
		playsoundatposition("pillar_move_03", (-1433, 1001.5, 729.75));
		wait(0.5);
		model3 StopAnimScripted();
		self TriggerEnable(1);
		self waittill("trigger", player);
		self TriggerEnable(0);
		level notify("hash_d266e923");
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		model3 useanimtree(-1);
		model3 AnimScripted("ori_puzzle_switch_anim", model3.origin, model3.angles, %ori_puzzle_switch_anim);
		level.var_d668bf71 = 0;
		level.var_36f1f658 = 1;
		level.var_a1a11120 = 0;
		level.var_8e00ae25 = 0;
		playsoundatposition("evt_power_switch_moon", player.origin);
		wait(0.5);
		var_7c6ce185 RotateYaw(-90, 0.5, 0.05, 0.05);
		model2 RotateYaw(-90, 0.5, 0.05, 0.05);
		playsoundatposition("pillar_move_03", (-1433, 1001.5, 729.75));
		wait(0.5);
		model3 StopAnimScripted();
	}
	if(level.var_cd79d15d == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_41b0f9f4
	Namespace: namespace_da78430a
	Checksum: 0xD70D6801
	Offset: 0x11A90
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 2976
*/
function function_41b0f9f4()
{
	level.var_bf17e00a = 0;
	level.var_49241ca1 = 1;
	level.var_1436c33b = 0;
	level.var_60476306 = 0;
	key = GetEnt("dg4_puzzle2", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_7908297a();
	return;
}

/*
	Name: function_7908297a
	Namespace: namespace_da78430a
	Checksum: 0x2B6C0882
	Offset: 0x11B30
	Size: 0x808
	Parameters: 0
	Flags: None
	Line Number: 2998
*/
function function_7908297a()
{
	level endon("intermission");
	var_7c6ce185 = GetEnt("dg4_puzzle_block2", "targetname");
	model2 = GetEnt("dg4_puzzle_block_code2", "targetname");
	model3 = GetEnt("puzzle_switch_2", "targetname");
	self TriggerEnable(0);
	while(1)
	{
		self TriggerEnable(1);
		self waittill("trigger", player);
		self TriggerEnable(0);
		level notify("hash_cceac082");
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		model3 useanimtree(-1);
		model3 AnimScripted("ori_puzzle_switch_anim", model3.origin, model3.angles, %ori_puzzle_switch_anim);
		level.var_bf17e00a = 0;
		level.var_49241ca1 = 0;
		level.var_1436c33b = 1;
		level.var_60476306 = 0;
		playsoundatposition("evt_power_switch_moon", player.origin);
		wait(0.5);
		var_7c6ce185 RotateYaw(-90, 0.5, 0.05, 0.05);
		model2 RotateYaw(-90, 0.5, 0.05, 0.05);
		playsoundatposition("pillar_move_03", (-1379.25, 1001.75, 729.75));
		wait(0.5);
		model3 StopAnimScripted();
		self TriggerEnable(1);
		self waittill("trigger", player);
		self TriggerEnable(0);
		level notify("hash_d266e923");
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		model3 useanimtree(-1);
		model3 AnimScripted("ori_puzzle_switch_anim", model3.origin, model3.angles, %ori_puzzle_switch_anim);
		level.var_bf17e00a = 0;
		level.var_49241ca1 = 0;
		level.var_1436c33b = 0;
		level.var_60476306 = 1;
		playsoundatposition("evt_power_switch_moon", player.origin);
		wait(0.5);
		var_7c6ce185 RotateYaw(-90, 0.5, 0.05, 0.05);
		model2 RotateYaw(-90, 0.5, 0.05, 0.05);
		playsoundatposition("pillar_move_03", (-1379.25, 1001.75, 729.75));
		wait(0.5);
		model3 StopAnimScripted();
		self TriggerEnable(1);
		self waittill("trigger", player);
		self TriggerEnable(0);
		level notify("hash_e021c6ad");
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		model3 useanimtree(-1);
		model3 AnimScripted("ori_puzzle_switch_anim", model3.origin, model3.angles, %ori_puzzle_switch_anim);
		level.var_bf17e00a = 1;
		level.var_49241ca1 = 0;
		level.var_1436c33b = 0;
		level.var_60476306 = 0;
		playsoundatposition("evt_power_switch_moon", player.origin);
		wait(0.5);
		var_7c6ce185 RotateYaw(-90, 0.5, 0.05, 0.05);
		model2 RotateYaw(-90, 0.5, 0.05, 0.05);
		playsoundatposition("pillar_move_03", (-1379.25, 1001.75, 729.75));
		wait(0.5);
		model3 StopAnimScripted();
		self TriggerEnable(1);
		self waittill("trigger", player);
		self TriggerEnable(0);
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		model3 useanimtree(-1);
		model3 AnimScripted("ori_puzzle_switch_anim", model3.origin, model3.angles, %ori_puzzle_switch_anim);
		level.var_bf17e00a = 0;
		level.var_49241ca1 = 1;
		level.var_1436c33b = 0;
		level.var_60476306 = 0;
		playsoundatposition("evt_power_switch_moon", player.origin);
		wait(0.5);
		var_7c6ce185 RotateYaw(-90, 0.5, 0.05, 0.05);
		model2 RotateYaw(-90, 0.5, 0.05, 0.05);
		playsoundatposition("pillar_move_03", (-1379.25, 1001.75, 729.75));
		wait(0.5);
		model3 StopAnimScripted();
	}
	if(level.var_cd79d15d == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_67b3745d
	Namespace: namespace_da78430a
	Checksum: 0x3737B64
	Offset: 0x12340
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 3108
*/
function function_67b3745d()
{
	level.var_166f1eb3 = 0;
	level.var_42734abe = 1;
	level.var_f6b724fe = 0;
	level.var_cb7a4a73 = 0;
	key = GetEnt("dg4_puzzle3", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_9f0aa3e3();
	return;
	continue;
}

/*
	Name: function_9f0aa3e3
	Namespace: namespace_da78430a
	Checksum: 0xF995CD0C
	Offset: 0x123E0
	Size: 0x808
	Parameters: 0
	Flags: None
	Line Number: 3131
*/
function function_9f0aa3e3()
{
	level endon("intermission");
	var_7c6ce185 = GetEnt("dg4_puzzle_block3", "targetname");
	model2 = GetEnt("dg4_puzzle_block_code3", "targetname");
	model3 = GetEnt("puzzle_switch_3", "targetname");
	self TriggerEnable(0);
	while(1)
	{
		self TriggerEnable(1);
		self waittill("trigger", player);
		self TriggerEnable(0);
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		model3 useanimtree(-1);
		model3 AnimScripted("ori_puzzle_switch_anim", model3.origin, model3.angles, %ori_puzzle_switch_anim);
		level.var_166f1eb3 = 0;
		level.var_42734abe = 0;
		level.var_f6b724fe = 1;
		level.var_cb7a4a73 = 0;
		playsoundatposition("evt_power_switch_moon", player.origin);
		wait(0.5);
		var_7c6ce185 RotateYaw(-90, 0.5, 0.05, 0.05);
		model2 RotateYaw(-90, 0.5, 0.05, 0.05);
		playsoundatposition("pillar_move_03", (-1325.5, 1002, 729.75));
		wait(0.5);
		model3 StopAnimScripted();
		self TriggerEnable(1);
		self waittill("trigger", player);
		self TriggerEnable(0);
		level notify("hash_d266e923");
		level notify("hash_e021c6ad");
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		model3 useanimtree(-1);
		model3 AnimScripted("ori_puzzle_switch_anim", model3.origin, model3.angles, %ori_puzzle_switch_anim);
		level.var_166f1eb3 = 0;
		level.var_42734abe = 0;
		level.var_f6b724fe = 0;
		level.var_cb7a4a73 = 1;
		playsoundatposition("evt_power_switch_moon", player.origin);
		wait(0.5);
		var_7c6ce185 RotateYaw(-90, 0.5, 0.05, 0.05);
		model2 RotateYaw(-90, 0.5, 0.05, 0.05);
		playsoundatposition("pillar_move_03", (-1325.5, 1002, 729.75));
		wait(0.5);
		model3 StopAnimScripted();
		self TriggerEnable(1);
		self waittill("trigger", player);
		self TriggerEnable(0);
		level notify("hash_cceac082");
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		model3 useanimtree(-1);
		model3 AnimScripted("ori_puzzle_switch_anim", model3.origin, model3.angles, %ori_puzzle_switch_anim);
		level.var_166f1eb3 = 1;
		level.var_42734abe = 0;
		level.var_f6b724fe = 0;
		level.var_cb7a4a73 = 0;
		playsoundatposition("evt_power_switch_moon", player.origin);
		wait(0.5);
		var_7c6ce185 RotateYaw(-90, 0.5, 0.05, 0.05);
		model2 RotateYaw(-90, 0.5, 0.05, 0.05);
		playsoundatposition("pillar_move_03", (-1325.5, 1002, 729.75));
		wait(0.5);
		model3 StopAnimScripted();
		self TriggerEnable(1);
		self waittill("trigger", player);
		self TriggerEnable(0);
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		model3 useanimtree(-1);
		model3 AnimScripted("ori_puzzle_switch_anim", model3.origin, model3.angles, %ori_puzzle_switch_anim);
		level.var_166f1eb3 = 0;
		level.var_42734abe = 1;
		level.var_f6b724fe = 0;
		level.var_cb7a4a73 = 0;
		playsoundatposition("evt_power_switch_moon", player.origin);
		wait(0.5);
		var_7c6ce185 RotateYaw(-90, 0.5, 0.05, 0.05);
		model2 RotateYaw(-90, 0.5, 0.05, 0.05);
		playsoundatposition("pillar_move_03", (-1325.5, 1002, 729.75));
		wait(0.5);
		model3 StopAnimScripted();
	}
	if(level.var_cd79d15d == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_9293cfc5
	Namespace: namespace_da78430a
	Checksum: 0x9F9A00E1
	Offset: 0x12BF0
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 3241
*/
function function_9293cfc5()
{
	thread function_9cb40233();
	var_37e03a5b = GetEntArray("puzzle_door1", "targetname");
	foreach(door in var_37e03a5b)
	{
		door setcursorhint("HINT_NOICON");
		door setHintString("The Gate is Sealed by a Dark Gravitational Force");
		door thread function_b999d498();
	}
}

/*
	Name: function_9cb40233
	Namespace: namespace_da78430a
	Checksum: 0x7A7E3B80
	Offset: 0x12D00
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 3263
*/
function function_9cb40233()
{
	level endon("intermission");
	while(1)
	{
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		level waittill("hash_cceac082");
		if(level.var_8e00ae25 == 1)
		{
			if(level.var_1436c33b == 1)
			{
				if(level.var_166f1eb3 == 1)
				{
					level.var_cd79d15d = 1;
					break;
				}
			}
		}
	}
	continue;
	level.var_cd79d15d = 1;
	return;
}

/*
	Name: function_b999d498
	Namespace: namespace_da78430a
	Checksum: 0xBE6B3D7
	Offset: 0x12D98
	Size: 0x2E8
	Parameters: 0
	Flags: None
	Line Number: 3300
*/
function function_b999d498()
{
	level endon("intermission");
	location = struct::get("puzzle_wall1_struct", "targetname");
	location2 = struct::get("puzzle_wall1_struct2", "targetname");
	var_3f906a6e = spawn("script_model", location.origin);
	var_3f906a6e SetModel("tag_origin");
	var_3f906a6e.angles = VectorScale((0, 1, 0), 270);
	PlayFXOnTag(level._effect["bosswall"], var_3f906a6e, "tag_origin");
	while(!level.var_cd79d15d)
	{
		wait(0.25);
	}
	var_11ddbff2 = GetEnt("puzzle_door2", "targetname");
	wait(1.5);
	playsoundatposition("finish", (-1203, 910.75, 521.25));
	wait(2.5);
	var_11ddbff2 moveto(location2.origin, 1, 0.25, 0.25);
	self setHintString("");
	models = GetEntArray(self.target, "targetname");
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	var_3f906a6e delete();
	playsoundatposition("gate_open", (-1370.75, 949, 521.25));
}

/*
	Name: function_9d59492b
	Namespace: namespace_da78430a
	Checksum: 0x73064800
	Offset: 0x13088
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 3339
*/
function function_9d59492b()
{
	thread function_1631dad();
}

/*
	Name: function_1631dad
	Namespace: namespace_da78430a
	Checksum: 0x48A9B93
	Offset: 0x130A8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 3354
*/
function function_1631dad()
{
	level endon("intermission");
	while(1)
	{
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		level waittill("hash_d266e923");
		if(level.var_36f1f658 == 1)
		{
			if(level.var_60476306 == 1)
			{
				if(level.var_cb7a4a73 == 1)
				{
					wait(1.5);
					playsoundatposition("vox_brutus_scary_voice_d_0", (-1370.75, 949, 521.25));
					continue;
				}
			}
		}
	}
	continue;
}

/*
	Name: function_f42b4505
	Namespace: namespace_da78430a
	Checksum: 0x7D661687
	Offset: 0x13158
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 3390
*/
function function_f42b4505()
{
	thread function_53be9893();
}

/*
	Name: function_53be9893
	Namespace: namespace_da78430a
	Checksum: 0x604064E1
	Offset: 0x13178
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 3405
*/
function function_53be9893()
{
	level endon("intermission");
	while(1)
	{
		if(level.var_cd79d15d == 1)
		{
			break;
		}
		level waittill("hash_e021c6ad");
		if(level.var_a1a11120 == 1)
		{
			if(level.var_bf17e00a == 1)
			{
				if(level.var_cb7a4a73 == 1)
				{
					wait(1.5);
					playsoundatposition("vox_brutus_scary_voice_d_1", (-1370.75, 949, 521.25));
					continue;
				}
			}
		}
	}
	continue;
}

/*
	Name: function_c21d959f
	Namespace: namespace_da78430a
	Checksum: 0x6366FF8F
	Offset: 0x13228
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 3441
*/
function function_c21d959f()
{
	level.var_f19311c7 = 0;
	thread function_ba937358();
}

/*
	Name: function_ba937358
	Namespace: namespace_da78430a
	Checksum: 0xA39C9FE5
	Offset: 0x13258
	Size: 0x4A0
	Parameters: 0
	Flags: None
	Line Number: 3457
*/
function function_ba937358()
{
	level endon("intermission");
	while(!level.var_2aa8fb67)
	{
		wait(0.1);
	}
	location = struct::get("dragon_struct", "targetname");
	model2 = spawn("script_model", location.origin);
	model2.angles = (0, 0, 0);
	model2 SetModel("c_zom_dlc3_dragon");
	model3 = spawn("script_model", location.origin);
	model3.angles = (0, 0, 0);
	model3 SetModel("c_zom_dlc3_dragon2");
	model2 useanimtree(-1);
	model2 AnimScripted("ai_zm_dlc3_dragon_flight_idle_a_1", model2.origin, model2.angles, %ai_zm_dlc3_dragon_flight_idle_a_1);
	model3 useanimtree(-1);
	model3 AnimScripted("ai_zm_dlc3_dragon_flight_idle_a_1", model3.origin, model3.angles, %ai_zm_dlc3_dragon_flight_idle_a_1);
	model2 setcandamage(1);
	while(1)
	{
		model2 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	PlayFXOnTag(level._effect["dragon"], model2, "j_spine_2_anim_death_fx");
	level.var_f19311c7 = 1;
	foreach(player in level.players)
	{
		playsoundatposition("dragon_death_scream", player.origin);
		wait(3.5);
		PlayFXOnTag(level._effect["dragon"], model2, "j_spine_2_anim_death_fx");
		wait(3.5);
		playsoundatposition("explode_00", player.origin);
		player zm_score::add_to_player_score(11500);
		PlayFXOnTag(level._effect["dragon2"], model3, "j_spine_2_anim_death_fx");
	}
	model2 StopAnimScripted();
	model2 delete();
	wait(5);
	model3 StopAnimScripted();
	model3 delete();
}

/*
	Name: function_251b756a
	Namespace: namespace_da78430a
	Checksum: 0xB81A4FB3
	Offset: 0x13700
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 3510
*/
function function_251b756a()
{
	level.var_db5214f7 = 0;
	level.var_2a6096c0 = 0;
	key = GetEnt("storm_quest_arrow", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Start Upgrade Quest");
	key thread function_3850338f();
	var_99a31bb2 = GetEntArray("key_door_storm", "targetname");
	foreach(door in var_99a31bb2)
	{
		door thread function_62f88aef();
	}
}

/*
	Name: function_3850338f
	Namespace: namespace_da78430a
	Checksum: 0xDCC224DC
	Offset: 0x13858
	Size: 0x750
	Parameters: 0
	Flags: None
	Line Number: 3535
*/
function function_3850338f()
{
	level endon("intermission");
	e_model = GetEnt("storm_damage", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			break;
		}
	}
	model = GetEnt(self.target, "targetname");
	model3 = GetEnt("storm_quest_arrow", "targetname");
	model3 RotateYaw(2880, 5, 0.5, 0.5);
	playsoundatposition("weathervane_spin_04", (60.5, -2584.75, 860.25));
	FX = spawn("script_model", (60.5, -2584.75, 860.25));
	FX.angles = VectorScale((1, 0, 0), 270);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_vane", 1);
	wait(1);
	level.var_db5214f7 = 1;
	wait(2);
	FX clientfield::set("fx_vane", 0);
	FX delete();
	location = struct::get("storm_arrow_model", "targetname");
	model2 = spawn("script_model", location.origin);
	model2.angles = VectorScale((0, 1, 0), 312.799);
	model2 SetModel("p7_fxanim_zm_castle_quest_storm_arrow_broken_mod");
	model2 useanimtree(-1);
	model2 AnimScripted("storm_arrow_broken_mod_idle_anim", model2.origin, model2.angles, %storm_arrow_broken_mod_idle_anim);
	PlayFXOnTag(level._effect["stormhead"], model2, "broken_arrow_head_fx_jnt");
	PlayFXOnTag(level._effect["stormshaft2"], model2, "broken_arrow_shaft_fx_jnt");
	PlayFXOnTag(level._effect["stormtail"], model2, "broken_arrow_tail_fx_jnt");
	fx2 = spawn("script_model", (-115.25, -2747, 46.5));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_stormflash", 1);
	while(!level.var_2a6096c0)
	{
		wait(0.25);
	}
	fx2 clientfield::set("fx_stormflash", 0);
	fx2 delete();
	model2 delete();
}

/*
	Name: function_62f88aef
	Namespace: namespace_da78430a
	Checksum: 0xBD4399C2
	Offset: 0x13FB0
	Size: 0x520
	Parameters: 0
	Flags: None
	Line Number: 3593
*/
function function_62f88aef()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_db5214f7)
	{
		wait(0.25);
	}
	FX = spawn("script_model", (59, -2584, 856));
	FX.angles = VectorScale((1, 0, 0), 270);
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["vane2"], FX, "tag_origin");
	wait(2);
	self TriggerEnable(1);
	self setHintString("Press and Hold ^3&&1^7 to Start Upgrade Quest");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("zmb_arrow_reforged", player.origin);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	level.var_2a6096c0 = 1;
	player thread function_3bc995f5("zmInventory.widget_weap_quest_storm", 3.5);
	level clientfield::set("quest_state_storm", 1);
	level clientfield::set("quest_owner_storm", player function_f653fb27());
	while(!level.var_ec1930ae)
	{
		wait(0.25);
	}
	while(!level.var_2ab67d4f)
	{
		wait(0.25);
	}
	while(!level.var_f6dad230)
	{
		wait(0.25);
	}
	playsoundatposition("zmb_tornado_arrow_1", player.origin);
	level.var_5537102e = 1;
	player thread function_3bc995f5("zmInventory.widget_weap_quest_storm", 3.5);
	level clientfield::set("quest_state_storm", 2);
	while(!level.var_91653777)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_storm", 3.5);
	level clientfield::set("quest_state_storm", 3);
	while(!level.var_df0857f7)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_storm", 3.5);
	level clientfield::set("quest_state_storm", 4);
	while(!level.var_7ed3794d)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_storm", 3.5);
	level clientfield::set("quest_state_storm", 5);
	while(!level.var_240dfb3d)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_storm", 3.5);
	level clientfield::set("quest_state_storm", 6);
}

/*
	Name: function_3b93f145
	Namespace: namespace_da78430a
	Checksum: 0xDCED5C95
	Offset: 0x144D8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 3675
*/
function function_3b93f145()
{
	level.var_ec1930ae = 0;
	level.var_5537102e = 0;
	key = GetEnt("storm_quest_brazier1", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_57147496();
}

/*
	Name: function_57147496
	Namespace: namespace_da78430a
	Checksum: 0x93999222
	Offset: 0x14580
	Size: 0x488
	Parameters: 0
	Flags: None
	Line Number: 3695
*/
function function_57147496()
{
	level endon("intermission");
	while(!level.var_2a6096c0)
	{
		wait(0.25);
	}
	e_model = GetEnt("brazier1", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			break;
		}
	}
	model = GetEnt(self.target, "targetname");
	FX = spawn("script_model", (1765.55, -3449.03, 1175.5));
	FX.angles = VectorScale((1, 0, 0), 270);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_stormfire", 1);
	wait(0.1);
	level.var_ec1930ae = 1;
	while(!level.var_83b1ee4)
	{
		wait(0.25);
	}
	FX clientfield::set("fx_stormfire", 0);
	wait(0.1);
	FX clientfield::set("fx_stormfire2", 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_61966bae
	Namespace: namespace_da78430a
	Checksum: 0xAE5C51D0
	Offset: 0x14A10
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 3740
*/
function function_61966bae()
{
	level.var_2ab67d4f = 0;
	key = GetEnt("storm_quest_brazier2", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_3111fa2d();
}

/*
	Name: function_3111fa2d
	Namespace: namespace_da78430a
	Checksum: 0xFA5C7EB1
	Offset: 0x14AB0
	Size: 0x488
	Parameters: 0
	Flags: None
	Line Number: 3759
*/
function function_3111fa2d()
{
	level endon("intermission");
	while(!level.var_2a6096c0)
	{
		wait(0.25);
	}
	e_model = GetEnt("brazier2", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			break;
		}
	}
	model = GetEnt(self.target, "targetname");
	FX = spawn("script_model", (-2621.5, -772.5, 982.5));
	FX.angles = VectorScale((1, 0, 0), 270);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_stormfire", 1);
	wait(0.1);
	level.var_2ab67d4f = 1;
	while(!level.var_5a02f5d1)
	{
		wait(0.25);
	}
	FX clientfield::set("fx_stormfire", 0);
	wait(0.1);
	FX clientfield::set("fx_stormfire2", 1);
}

/*
	Name: function_8798e617
	Namespace: namespace_da78430a
	Checksum: 0xA6FF0598
	Offset: 0x14F40
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 3802
*/
function function_8798e617()
{
	level.var_f6dad230 = 0;
	key = GetEnt("storm_quest_brazier3", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_b0f7fc4();
}

/*
	Name: function_b0f7fc4
	Namespace: namespace_da78430a
	Checksum: 0x2B26488F
	Offset: 0x14FE0
	Size: 0x480
	Parameters: 0
	Flags: None
	Line Number: 3821
*/
function function_b0f7fc4()
{
	level endon("intermission");
	while(!level.var_2a6096c0)
	{
		wait(0.25);
	}
	e_model = GetEnt("brazier3", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			break;
		}
	}
	model = GetEnt(self.target, "targetname");
	FX = spawn("script_model", (4120, 2128.75, 65.25));
	FX.angles = VectorScale((1, 0, 0), 270);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_stormfire", 1);
	wait(0.1);
	level.var_f6dad230 = 1;
	while(!level.var_44f7b1e2)
	{
		wait(0.25);
	}
	FX clientfield::set("fx_stormfire", 0);
	wait(0.1);
	FX clientfield::set("fx_stormfire2", 1);
}

/*
	Name: function_8f8affd0
	Namespace: namespace_da78430a
	Checksum: 0x89978127
	Offset: 0x15468
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 3864
*/
function function_8f8affd0()
{
	level.var_119e6b29 = 0;
	level.var_ce27d0b6 = 0;
	key = GetEnt("storm_quest_coil", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Fuse");
	key thread function_a112ef67();
	var_659dcd68 = GetEntArray("key_door_storm_coil", "targetname");
	foreach(door in var_659dcd68)
	{
		door thread function_fe563f87();
	}
	return;
}

/*
	Name: function_a112ef67
	Namespace: namespace_da78430a
	Checksum: 0x942ABF03
	Offset: 0x155C0
	Size: 0x328
	Parameters: 0
	Flags: None
	Line Number: 3890
*/
function function_a112ef67()
{
	level endon("intermission");
	while(!level.var_ec1930ae)
	{
		wait(0.25);
	}
	while(!level.var_2ab67d4f)
	{
		wait(0.25);
	}
	while(!level.var_f6dad230)
	{
		wait(0.25);
	}
	e_model = GetEnt("coil_key", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	self delete();
	model = GetEnt(self.target, "targetname");
	playsoundatposition("crane_arm_open", (149.75, -359.25, 51.5));
	location2 = struct::get("locker_struct", "targetname");
	model2 = spawn("script_model", location2.origin);
	model2.angles = VectorScale((0, 1, 0), 202.098);
	model2 SetModel("p7_zm_ctl_locker_metal_lrg_door");
	wait(0.1);
	location = struct::get("fuse_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = VectorScale((0, 1, 0), 193);
	model SetModel("p7_zm_ctl_115_fuse");
	level.var_119e6b29 = 1;
	while(!level.var_ce27d0b6)
	{
		wait(0.25);
	}
	model delete();
}

/*
	Name: function_fe563f87
	Namespace: namespace_da78430a
	Checksum: 0xD9A95CD4
	Offset: 0x158F0
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 3942
*/
function function_fe563f87()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_119e6b29)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self setHintString("Press and Hold ^3&&1^7 to Pick Up Fuse");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("zmb_craftable_pickup", player.origin);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	level.var_ce27d0b6 = 1;
}

/*
	Name: function_f35eb592
	Namespace: namespace_da78430a
	Checksum: 0x3905CACF
	Offset: 0x15AB8
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 3976
*/
function function_f35eb592()
{
	level.var_91653777 = 0;
	level.var_e073b940 = 0;
	key = GetEnt("storm_quest_coil2", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Insert Fuse");
	key thread function_a3fb7a87();
	var_8af85bda = GetEntArray("key_door_storm_coil2", "targetname");
	foreach(door in var_8af85bda)
	{
		door thread function_145402a7();
	}
	return;
	wait(var_8af85bda);
}

/*
	Name: function_a3fb7a87
	Namespace: namespace_da78430a
	Checksum: 0x58C9118C
	Offset: 0x15C10
	Size: 0x3C0
	Parameters: 0
	Flags: None
	Line Number: 4003
*/
function function_a3fb7a87()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_ce27d0b6)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	var_37effc36 = GetEnt("key_door_storm_coil_door2", "targetname");
	var_11ed81cd = GetEnt("key_door_storm_coil_door3", "targetname");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("talon_vortex_end", (-257.5, 1129.5, 259.75));
	self delete();
	FX = spawn("script_model", (-252.75, 1127, 287.25));
	FX.angles = VectorScale((1, 0, 0), 270);
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["stormfuse"], FX, "tag_origin");
	wait(0.1);
	location = struct::get("fuse_struct2", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (315, 0, -90);
	model SetModel("p7_zm_ctl_115_fuse_pickup");
	level.var_91653777 = 1;
	wait(2);
	foreach(model in models)
	{
		model delete();
	}
	var_37effc36 RotateYaw(70, 1, 0.1, 0.1);
	var_11ed81cd RotateYaw(-120, 1, 0.1, 0.1);
	playsoundatposition("zmb_iron_door_slide_00", (-257.5, 1129.5, 259.75));
	FX delete();
}

/*
	Name: function_145402a7
	Namespace: namespace_da78430a
	Checksum: 0x44FCC545
	Offset: 0x15FD8
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 4049
*/
function function_145402a7()
{
	level endon("intermission");
	self setHintString("Press and Hold ^3&&1^7 to Pick Up Coil");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("zmb_craftable_pickup", player.origin);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	level.var_e073b940 = 1;
}

/*
	Name: function_19612ffb
	Namespace: namespace_da78430a
	Checksum: 0x2169261C
	Offset: 0x16158
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 4077
*/
function function_19612ffb()
{
	level.var_18065858 = 0;
	level.var_df0857f7 = 0;
	key = GetEnt("storm_quest_coil3", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Place Coil");
	key thread function_7df9001e();
	var_b0fad643 = GetEntArray("key_door_storm_coil3", "targetname");
	foreach(door in var_b0fad643)
	{
		door thread function_ee51883e();
	}
}

/*
	Name: function_7df9001e
	Namespace: namespace_da78430a
	Checksum: 0x4414B4E3
	Offset: 0x162B0
	Size: 0x5E8
	Parameters: 0
	Flags: None
	Line Number: 4102
*/
function function_7df9001e()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_e073b940)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("talon_vortex_end", (-530.5, 828.75, 932.75));
	FX = spawn("script_model", (-530.5, 828.75, 932.75));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_stormshock", 1);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	wait(0.1);
	location = struct::get("fuse_struct3", "targetname");
	model = spawn("script_model", location.origin);
	model SetModel("p7_zm_ctl_pap_platform_coil");
	wait(3);
	playsoundatposition("death_ray_on", (-545.75, 758.5, 871.25));
	fx2 = spawn("script_model", (-545.75, 758.5, 871.25));
	fx2.angles = VectorScale((1, 0, 0), 270);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_vane", 1);
	wait(0.5);
	FX3 = spawn("script_model", (-540.25, 760.5, 909.5));
	FX3 SetModel("tag_origin");
	FX3 clientfield::set("fx_stormflash", 1);
	location = struct::get("storm_arrow_model2", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (0, 0, 0);
	model SetModel("p7_fxanim_zm_castle_quest_storm_arrow_whole_mod");
	model clientfield::set("fx_stormbow", 1);
	model useanimtree(-1);
	model AnimScripted("storm_arrow_whole_mod_idle_anim", model.origin, model.angles, %storm_arrow_whole_mod_idle_anim);
	level.var_18065858 = 1;
	while(!level.var_df0857f7)
	{
		wait(0.25);
	}
	model clientfield::set("fx_stormbow", 0);
	model delete();
	FX clientfield::set("fx_stormshock", 0);
	fx2 clientfield::set("fx_vane", 0);
	FX3 clientfield::set("fx_stormflash", 0);
	FX delete();
	fx2 delete();
	FX3 delete();
}

/*
	Name: function_ee51883e
	Namespace: namespace_da78430a
	Checksum: 0xCF55B90F
	Offset: 0x168A0
	Size: 0x258
	Parameters: 0
	Flags: None
	Line Number: 4171
*/
function function_ee51883e()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_18065858)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self setHintString("Press and Hold ^3&&1^7 to Pick Up Arrow");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("zmb_arrow_reforged", player.origin);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	level.var_df0857f7 = 1;
	while(!level.var_df0857f7)
	{
		wait(0.25);
	}
	FX = spawn("script_model", (-530.5, 828.75, 932.75));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_stormshock", 1);
}

/*
	Name: function_c1792b24
	Namespace: namespace_da78430a
	Checksum: 0x7A74DD45
	Offset: 0x16B00
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 4212
*/
function function_c1792b24()
{
	level.var_7ed3794d = 0;
	key = GetEnt("storm_quest_soul", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Place Arrow");
	key thread function_52454de3();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_52454de3
	Namespace: namespace_da78430a
	Checksum: 0x3E2597DE
	Offset: 0x16BA0
	Size: 0x2F8
	Parameters: 0
	Flags: None
	Line Number: 4233
*/
function function_52454de3()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_df0857f7)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("zmb_bow_upgrade", (-597.25, -2053.75, -528));
	FX = spawn("script_model", (-606.75, -2054.75, -542.25));
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["stormaura"], FX, "tag_origin");
	location = struct::get("storm_arrow_model3", "targetname");
	location2 = struct::get("storm_arrow_ammo", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (340, 350, 0);
	model SetModel("tag_origin1");
	model thread zm_powerups::powerup_wobble();
	wait(0.25);
	level thread zm_powerups::specific_powerup_drop("full_ammo", location2.origin);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	self delete();
	wait(0.1);
	level.var_7ed3794d = 1;
	while(!level.var_240dfb3d)
	{
		wait(0.25);
	}
	model delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d2ab1388
	Namespace: namespace_da78430a
	Checksum: 0x4872D872
	Offset: 0x16EA0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 4281
*/
function function_d2ab1388()
{
	level.var_3eb44809 = 0;
	key = GetEnt("wolf_howl_painting1", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_2445d7b5();
}

/*
	Name: function_2445d7b5
	Namespace: namespace_da78430a
	Checksum: 0xC213B02B
	Offset: 0x16F40
	Size: 0x408
	Parameters: 0
	Flags: None
	Line Number: 4300
*/
function function_2445d7b5()
{
	level endon("intermission");
	e_model = GetEnt("wolf_howl_painting1_model", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			break;
		}
	}
	location = struct::get("wolf_howl_painting1_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = VectorScale((0, 1, 0), 180);
	model SetModel("p7_zm_ctl_kings_painting_01_lit");
	playsoundatposition("correct_painting", (-1055, -190.5, 160.25));
	wait(0.1);
	level.var_3eb44809 = 1;
}

/*
	Name: function_44b282c3
	Namespace: namespace_da78430a
	Checksum: 0xD646EC0E
	Offset: 0x17350
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 4332
*/
function function_44b282c3()
{
	level.var_9bb4b51c = 0;
	key = GetEnt("wolf_howl_painting2", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_4a48521e();
}

/*
	Name: function_4a48521e
	Namespace: namespace_da78430a
	Checksum: 0x1F7E960C
	Offset: 0x173D0
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 4350
*/
function function_4a48521e()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_3eb44809)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
	location = struct::get("wolf_howl_painting2_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (0, 0, 0);
	model SetModel("p7_zm_ctl_kings_painting_02_lit");
	playsoundatposition("correct_painting", player.origin);
	wait(0.1);
	level.var_9bb4b51c = 1;
}

/*
	Name: function_1eb0085a
	Namespace: namespace_da78430a
	Checksum: 0x111B5CD1
	Offset: 0x17510
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 4379
*/
function function_1eb0085a()
{
	level.var_bd72592b = 0;
	key = GetEnt("wolf_howl_painting3", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_704acc87();
}

/*
	Name: function_704acc87
	Namespace: namespace_da78430a
	Checksum: 0xD9C88447
	Offset: 0x17590
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 4397
*/
function function_704acc87()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_9bb4b51c)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
	location = struct::get("wolf_howl_painting3_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = VectorScale((0, 1, 0), 90);
	model SetModel("p7_zm_ctl_kings_painting_03_lit");
	playsoundatposition("correct_painting", player.origin);
	wait(0.1);
	level.var_bd72592b = 1;
}

/*
	Name: function_90b77795
	Namespace: namespace_da78430a
	Checksum: 0x214FDF8
	Offset: 0x176D8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 4426
*/
function function_90b77795()
{
	level.var_f80aeba6 = 0;
	key = GetEnt("wolf_howl_painting4", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_663973a8();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_663973a8
	Namespace: namespace_da78430a
	Checksum: 0xDDFEB7AD
	Offset: 0x17758
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 4446
*/
function function_663973a8()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_bd72592b)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
	location = struct::get("wolf_howl_painting4_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (0, 0, 0);
	model SetModel("p7_zm_ctl_kings_painting_04_lit");
	playsoundatposition("correct_painting", player.origin);
	wait(0.1);
	level.var_f80aeba6 = 1;
	wait(3);
	foreach(player in GetPlayers())
	{
		player playsoundtoplayer("wolf_howl", player);
	}
}

/*
	Name: function_386e2073
	Namespace: namespace_da78430a
	Checksum: 0x12FD520E
	Offset: 0x17938
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 4480
*/
function function_386e2073()
{
	level.var_477701e4 = 0;
	level.var_a2ac695b = 0;
	key = GetEnt("wolf_howl_wall", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_80f9920c();
	var_762a72c7 = GetEntArray("key_door_wolf_howl_wall", "targetname");
	foreach(door in var_762a72c7)
	{
		door thread function_9e65b76c();
	}
}

/*
	Name: function_80f9920c
	Namespace: namespace_da78430a
	Checksum: 0xE03453E7
	Offset: 0x17A70
	Size: 0x230
	Parameters: 0
	Flags: None
	Line Number: 4504
*/
function function_80f9920c()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_f80aeba6)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
	FX = spawn("script_model", (-631, -1012.5, -183.5));
	FX.angles = VectorScale((0, 1, 0), 270);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_wall", 1);
	models = GetEntArray(self.target, "targetname");
	foreach(model in models)
	{
		model delete();
	}
	playsoundatposition("punch_imp_wall_00", player.origin);
	wait(0.5);
	level.var_477701e4 = 1;
	wait(2.5);
	FX clientfield::set("fx_wall", 0);
	FX delete();
}

/*
	Name: function_9e65b76c
	Namespace: namespace_da78430a
	Checksum: 0xE518870C
	Offset: 0x17CA8
	Size: 0x588
	Parameters: 0
	Flags: None
	Line Number: 4541
*/
function function_9e65b76c()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_477701e4)
	{
		wait(0.25);
	}
	location = struct::get("wolf_howl_wall_struct", "targetname");
	location2 = struct::get("wolf_howl_wall_struct2", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = VectorScale((0, 1, 0), 270);
	model SetModel("p7_fxanim_zm_castle_quest_wolf_arrow_broken_mod");
	PlayFXOnTag(level._effect["wolftail"], model, "wolf_broken_arrow_tail_fx_jnt");
	PlayFXOnTag(level._effect["wolfhead"], model, "wolf_broken_arrow_head_fx_jnt");
	PlayFXOnTag(level._effect["wolfshaft2"], model, "wolf_broken_arrow_shaft_fx_jnt");
	model moveto(location2.origin, 1.5, 0.05, 0.05);
	wait(1.5);
	model useanimtree(-1);
	model AnimScripted("wolf_arrow_broken_mod_idle_anim", model.origin, model.angles, %wolf_arrow_broken_mod_idle_anim);
	self TriggerEnable(1);
	self setHintString("Press and Hold ^3&&1^7 to Start Upgrade Quest");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("zmb_arrow_reforged", player.origin);
	self delete();
	level.var_a2ac695b = 1;
	wait(0.25);
	while(!level.var_a2ac695b)
	{
		wait(0.25);
	}
	model delete();
	player thread function_3bc995f5("zmInventory.widget_weap_quest_wolf", 3.5);
	level clientfield::set("quest_state_wolf", 1);
	level clientfield::set("quest_owner_wolf", player function_f653fb27());
	while(!level.var_f05de42c)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_wolf", 3.5);
	level clientfield::set("quest_state_wolf", 2);
	while(!level.var_478b09cf)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_wolf", 3.5);
	level clientfield::set("quest_state_wolf", 3);
	while(!level.var_d372e700)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_wolf", 3.5);
	level clientfield::set("quest_state_wolf", 4);
	while(!level.var_125d500b)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_wolf", 3.5);
	level clientfield::set("quest_state_wolf", 5);
	while(!level.var_3ed5214e)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_wolf", 3.5);
	level clientfield::set("quest_state_wolf", 6);
}

/*
	Name: function_8900846a
	Namespace: namespace_da78430a
	Checksum: 0x7F804C32
	Offset: 0x18238
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 4619
*/
function function_8900846a()
{
	level.var_e8be345b = 0;
	level.var_f05de42c = 0;
	key = GetEnt("wolf_howl_skull", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_12a5ecfb();
	var_64f4e216 = GetEntArray("key_door_wolf_howl_skull", "targetname");
	foreach(door in var_64f4e216)
	{
		door thread function_ea8debdb();
	}
}

/*
	Name: function_12a5ecfb
	Namespace: namespace_da78430a
	Checksum: 0xF329FFAF
	Offset: 0x18370
	Size: 0x8B8
	Parameters: 0
	Flags: None
	Line Number: 4643
*/
function function_12a5ecfb()
{
	level endon("intermission");
	while(!level.var_a2ac695b)
	{
		wait(0.25);
	}
	e_model = GetEnt("wolf_howl_skull_model", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			break;
		}
	}
	location = struct::get("wolf_howl_skull_struct", "targetname");
	location2 = struct::get("wolf_howl_skull2_struct", "targetname");
	location3 = struct::get("wolf_howl_skull3_struct", "targetname");
	var_e8943b5c = struct::get("wolf_howl_skull4_struct", "targetname");
	var_e96b5c5 = struct::get("wolf_howl_skull5_struct", "targetname");
	var_3499302e = struct::get("wolf_howl_skull6_struct", "targetname");
	var_5a9baa97 = struct::get("wolf_howl_skull7_struct", "targetname");
	var_20767e70 = struct::get("wolf_howl_skull8_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (0, 0, 0);
	model SetModel("p7_zm_ctl_wolf_skull");
	model clientfield::set("fx_wolfskull", 1);
	model RotatePitch(810, 0.5, 0.05, 0.05);
	model moveto(location2.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	model RotatePitch(1530, 1, 0.05, 0.05);
	model moveto(location3.origin, 1, 0.05, 0.05);
	wait(1);
	model RotatePitch(720, 0.5, 0.05, 0.05);
	model moveto(var_e8943b5c.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	model RotatePitch(1440, 1, 0.05, 0.05);
	model moveto(var_e96b5c5.origin, 1, 0.05, 0.05);
	wait(1);
	model RotatePitch(720, 0.5, 0.05, 0.05);
	model moveto(var_3499302e.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	model RotatePitch(720, 0.5, 0.05, 0.05);
	model moveto(var_5a9baa97.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	model RotatePitch(720, 0.5, 0.05, 0.05);
	model moveto(var_20767e70.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	level.var_e8be345b = 1;
	while(!level.var_f05de42c)
	{
		wait(0.25);
	}
	model clientfield::set("fx_wolfskull", 0);
	model delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ea8debdb
	Namespace: namespace_da78430a
	Checksum: 0x7DD208A0
	Offset: 0x18C30
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 4714
*/
function function_ea8debdb()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_e8be345b)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self setHintString("Press and Hold ^3&&1^7 to Pick Up Skull");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("zmb_fossil_pickup", player.origin);
	self delete();
	level.var_f05de42c = 1;
}

/*
	Name: function_8198d04e
	Namespace: namespace_da78430a
	Checksum: 0xCC07B691
	Offset: 0x18D38
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 4741
*/
function function_8198d04e()
{
	level.var_478b09cf = 0;
	level.var_bf6a3068 = 0;
	key = GetEnt("wolf_howl_skull_place", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_b40ba1c7();
	var_cde75372 = GetEntArray("key_door_wolf_howl_skull_place", "targetname");
	foreach(door in var_cde75372)
	{
		door thread function_340e8467();
	}
}

/*
	Name: function_b40ba1c7
	Namespace: namespace_da78430a
	Checksum: 0x7930DAB
	Offset: 0x18E70
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 4765
*/
function function_b40ba1c7()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_f05de42c)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
	self delete();
	playsoundatposition("wolf_howl_x3", player.origin);
	location = struct::get("wolf_howl_skull_place_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = VectorScale((0, 1, 0), 233.198);
	model SetModel("p7_zm_ctl_wolf_skull");
	FX = spawn("script_model", model.origin);
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_wolfskull", 1);
	level.var_478b09cf = 1;
	wait(1);
	FX clientfield::set("fx_wolfskull", 0);
	FX delete();
}

/*
	Name: function_340e8467
	Namespace: namespace_da78430a
	Checksum: 0x25A6F014
	Offset: 0x19090
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 4801
*/
function function_340e8467()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_478b09cf)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	location = struct::get("shovel_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = VectorScale((0, 1, 0), 270);
	model SetModel("tag_origin_shovel");
	model thread zm_powerups::powerup_wobble();
	self setHintString("Press and Hold ^3&&1^7 to Pick Up Shovel");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("zmb_craftable_pickup", player.origin);
	self delete();
	model delete();
	level.var_bf6a3068 = 1;
}

/*
	Name: function_8c31f012
	Namespace: namespace_da78430a
	Checksum: 0xE954599
	Offset: 0x19260
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 4834
*/
function function_8c31f012()
{
	level.var_a2bde937 = 0;
	level.var_d372e700 = 0;
	key = GetEnt("wolf_howl_grave", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_28118a03();
	var_6d2157fe = GetEntArray("key_door_wolf_howl_grave", "targetname");
	foreach(door in var_6d2157fe)
	{
		door thread function_e9273ce3();
	}
	return;
	waittillframeend;
}

/*
	Name: function_28118a03
	Namespace: namespace_da78430a
	Checksum: 0xE055368F
	Offset: 0x19398
	Size: 0x5E8
	Parameters: 0
	Flags: None
	Line Number: 4860
*/
function function_28118a03()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_bf6a3068)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	fx2 = spawn("script_model", (-757.25, -4471, 256));
	fx2.angles = VectorScale((1, 0, 0), 270);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_wolfinkbody", 1);
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	playsoundatposition("dig_00", player.origin);
	FX = spawn("script_model", (-734.5, -4459.5, 224.75));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["dig"], FX, "tag_origin");
	location = struct::get("wolf_howl_grave_arrow_struct", "targetname");
	location2 = struct::get("wolf_howl_grave_arrow_struct2", "targetname");
	location3 = struct::get("wolf_howl_grave_arm_struct", "targetname");
	var_e8943b5c = struct::get("wolf_howl_grave_arm_struct2", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = VectorScale((0, 1, 0), 305.399);
	model SetModel("tag_origin2_grave");
	model clientfield::set("fx_wolfbow", 1);
	model2 = spawn("script_model", location3.origin);
	model2.angles = (360, 180, -180);
	model2 SetModel("tag_origin_arm");
	model moveto(location2.origin, 3, 0.05, 0.05);
	model2 moveto(var_e8943b5c.origin, 3, 0.05, 0.05);
	wait(1);
	playsoundatposition("zmb_skeleton_arrow", player.origin);
	wait(2);
	level.var_a2bde937 = 1;
	FX delete();
	while(!level.var_d372e700)
	{
		wait(0.25);
	}
	model2 moveto(location3.origin, 3, 0.05, 0.05);
	model delete();
	wait(3);
	fx2 clientfield::set("fx_wolfinkbody", 0);
	fx2 delete();
	var_a2eadd92 = GetEnt("wolf_logo_grave_arrow", "targetname");
	var_a2eadd92 delete();
}

/*
	Name: function_e9273ce3
	Namespace: namespace_da78430a
	Checksum: 0xB3557C3C
	Offset: 0x19988
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 4926
*/
function function_e9273ce3()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_a2bde937)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self setHintString("Press and Hold ^3&&1^7 to Pick Up Arrow");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("zmb_arrow_reforged", player.origin);
	self delete();
	level.var_d372e700 = 1;
}

/*
	Name: function_687a8dee
	Namespace: namespace_da78430a
	Checksum: 0xEA5A72DE
	Offset: 0x19A90
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 4953
*/
function function_687a8dee()
{
	level.var_125d500b = 0;
	key = GetEnt("wolf_howl_quest_soul", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Place Arrow");
	key thread function_25fedfc1();
	return;
}

/*
	Name: function_25fedfc1
	Namespace: namespace_da78430a
	Checksum: 0x777349F1
	Offset: 0x19B30
	Size: 0x2F8
	Parameters: 0
	Flags: None
	Line Number: 4973
*/
function function_25fedfc1()
{
	// Could not fully decompile function; skipped
}

/*
	Name: function_5948c0a8
	Namespace: namespace_da78430a
	Checksum: 0xF03929C0
	Offset: 0x19E30
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 4988
*/
function function_5948c0a8()
{
	level.var_9915c461 = 0;
	level.var_73b96a7e = 0;
	key = GetEnt("demongate_wall", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_3b489407();
	var_7a0b8ccc = GetEntArray("key_door_demongate_wall", "targetname");
	foreach(door in var_7a0b8ccc)
	{
		door thread function_6f76527();
	}
}

/*
	Name: function_3b489407
	Namespace: namespace_da78430a
	Checksum: 0x5B5F56B0
	Offset: 0x19F68
	Size: 0x528
	Parameters: 0
	Flags: None
	Line Number: 5012
*/
function function_3b489407()
{
	level endon("intermission");
	e_model = GetEnt("demonwall", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			break;
		}
	}
	FX = spawn("script_model", (-43.75, -1588.5, 178));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["wall2"], FX, "tag_origin");
	model = GetEnt("demongate_wall", "targetname");
	model delete();
	model2 = GetEnt("demongate_wall2", "targetname");
	model2 delete();
	model3 = GetEnt("demongate_wall3", "targetname");
	model3 delete();
	var_be607d78 = GetEnt("demongate_wall4", "targetname");
	var_be607d78 delete();
	playsoundatposition("punch_imp_wall_00", (-43.75, -1588.5, 178));
	wait(0.5);
	level.var_9915c461 = 1;
	wait(2.5);
	FX delete();
}

/*
	Name: function_6f76527
	Namespace: namespace_da78430a
	Checksum: 0x3F7B01A0
	Offset: 0x1A498
	Size: 0x520
	Parameters: 0
	Flags: None
	Line Number: 5054
*/
function function_6f76527()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_9915c461)
	{
		wait(0.25);
	}
	location = struct::get("demongate_wall_struct", "targetname");
	location2 = struct::get("demongate_wall_struct2", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (0, 0, 0);
	model SetModel("p7_fxanim_zm_castle_quest_demongate_arrow_broken_mod");
	PlayFXOnTag(level._effect["demonaura"], model, "demon_broken_arrow_shaft_fx_jnt");
	model moveto(location2.origin, 2.5, 0.05, 0.05);
	wait(2.5);
	model useanimtree(-1);
	model AnimScripted("demongate_arrow_broken_mod_idle_anim", model.origin, model.angles, %demongate_arrow_broken_mod_idle_anim);
	self TriggerEnable(1);
	self setHintString("Press and Hold ^3&&1^7 to Start Upgrade Quest");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("zmb_arrow_reforged", player.origin);
	self delete();
	level.var_73b96a7e = 1;
	wait(0.25);
	while(!level.var_73b96a7e)
	{
		wait(0.25);
	}
	model delete();
	player thread function_3bc995f5("zmInventory.widget_weap_quest_demon", 3.5);
	level clientfield::set("quest_state_demon", 1);
	level clientfield::set("quest_owner_demon", player function_f653fb27());
	while(!level.var_2fa657e6)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_demon", 3.5);
	level clientfield::set("quest_state_demon", 2);
	while(!level.var_8a09a324)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_demon", 3.5);
	level clientfield::set("quest_state_demon", 3);
	while(!level.var_c2885a75)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_demon", 3.5);
	level clientfield::set("quest_state_demon", 4);
	while(!level.var_c317b842)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_demon", 3.5);
	level clientfield::set("quest_state_demon", 5);
	while(!level.var_6ec350e8)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_demon", 3.5);
	level clientfield::set("quest_state_demon", 6);
}

/*
	Name: function_a43f7d8d
	Namespace: namespace_da78430a
	Checksum: 0x8B2FF740
	Offset: 0x1A9C0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 5130
*/
function function_a43f7d8d()
{
	level.var_2fa657e6 = 0;
	level.var_ca617df1 = 0;
	thread function_7a379a80();
	var_e67105e1 = GetEntArray("key_door_demongate_urn", "targetname");
	foreach(door in var_e67105e1)
	{
		door thread function_f2d13220();
	}
}

/*
	Name: function_7a379a80
	Namespace: namespace_da78430a
	Checksum: 0xE20BFCE0
	Offset: 0x1AAA8
	Size: 0x8B0
	Parameters: 0
	Flags: None
	Line Number: 5152
*/
function function_7a379a80()
{
	level endon("intermission");
	while(!level.var_73b96a7e)
	{
		wait(0.25);
	}
	location = struct::get("urn_struct", "targetname");
	location2 = struct::get("rune_circle_struct", "targetname");
	location3 = struct::get("urn_struct2", "targetname");
	FX = spawn("script_model", (-517.5, -798.25, 145.25));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_urnglow", 1);
	wait(0.1);
	var_e462f7e1 = spawn("script_model", location.origin);
	var_e462f7e1.angles = (0, 0, 0);
	var_e462f7e1 SetModel("p7_fxanim_zm_castle_quest_demongate_urn_mod");
	var_e462f7e1 useanimtree(-1);
	var_e462f7e1 AnimScripted("p7_fxanim_zm_castle_quest_demongate_urn_mod_idle", var_e462f7e1.origin, var_e462f7e1.angles, %p7_fxanim_zm_castle_quest_demongate_urn_mod_idle);
	model2 = spawn("script_model", location2.origin);
	model2.angles = VectorScale((0, 1, 0), 180);
	model2 SetModel("p7_zm_ctl_rune_circle_trophey_room_glow");
	wait(0.1);
	model3 = GetEnt("urn_float2", "targetname");
	model3 moveto(location3.origin, 0.2, 0.05, 0.05);
	wait(0.5);
	model3 setcandamage(1);
	while(1)
	{
		model3 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			break;
		}
	}
	playsoundatposition("vox_cast_arro_demongate_return_0", (-517.5, -798.25, 126.75));
	thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "Return that which is scattered");
	wait(0.1);
	level.var_2fa657e6 = 1;
	while(!level.var_3965ec7c)
	{
		wait(0.1);
	}
	var_e462f7e1 StopAnimScripted();
	var_e462f7e1 useanimtree(-1);
	var_e462f7e1 AnimScripted("p7_fxanim_zm_castle_quest_demongate_urn_mod_destroy", var_e462f7e1.origin, var_e462f7e1.angles, %p7_fxanim_zm_castle_quest_demongate_urn_mod_destroy);
	playsoundatposition("zmb_urn_dest_build", (-517.5, -798.25, 126.75));
	wait(4.5);
	playsoundatposition("zmb_urn_dest_pop", (-517.5, -798.25, 126.75));
	FX clientfield::set("fx_urnglow", 0);
	FX delete();
	fx2 = spawn("script_model", (-517, -798, 145));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_urnexplode", 1);
	wait(0.1);
	model2 delete();
	model3 delete();
	var_e462f7e1 delete();
	fx2 clientfield::set("fx_urnexplode", 0);
	fx2 delete();
	level.var_ca617df1 = 1;
}

/*
	Name: function_f2d13220
	Namespace: namespace_da78430a
	Checksum: 0xAB3DDC58
	Offset: 0x1B360
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 5227
*/
function function_f2d13220()
{
	level endon("intermission");
	self setHintString("");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	level.var_ca617df1 = 1;
}

/*
	Name: function_ca0a17b4
	Namespace: namespace_da78430a
	Checksum: 0x9C3AA743
	Offset: 0x1B4B8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 5254
*/
function function_ca0a17b4()
{
	level.var_d42319f9 = 0;
	key = GetEnt("demongate_skull1", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Skull");
	key thread function_7280c85b();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7280c85b
	Namespace: namespace_da78430a
	Checksum: 0x36EE463F
	Offset: 0x1B558
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 5275
*/
function function_7280c85b()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_2fa657e6)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	location = struct::get("demongate_skull1_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (322.498, 120.596, 0);
	model SetModel("c_zom_chomper_demongate");
	wait(0.1);
	self waittill("trigger", player);
	self delete();
	model clientfield::set("fx_demonskull", 1);
	playsoundatposition("chomper_bite_07", location.origin);
	wait(0.1);
	model clientfield::set("fx_demonskull", 0);
	model delete();
	level.var_d42319f9 = 1;
}

/*
	Name: function_3c1186ef
	Namespace: namespace_da78430a
	Checksum: 0x68643AB6
	Offset: 0x1B720
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 5309
*/
function function_3c1186ef()
{
	level.var_569fb8cc = 0;
	key = GetEnt("demongate_skull2", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Skull");
	key thread function_795920();
}

/*
	Name: function_795920
	Namespace: namespace_da78430a
	Checksum: 0x544EC486
	Offset: 0x1B7C0
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 5328
*/
function function_795920()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_2fa657e6)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	location = struct::get("demongate_skull2_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (322.498, 210.596, 0);
	model SetModel("c_zom_chomper_demongate");
	wait(0.1);
	self waittill("trigger", player);
	self delete();
	model clientfield::set("fx_demonskull", 1);
	playsoundatposition("chomper_bite_07", location.origin);
	wait(0.1);
	model clientfield::set("fx_demonskull", 0);
	model delete();
	level.var_569fb8cc = 1;
}

/*
	Name: function_160f0c86
	Namespace: namespace_da78430a
	Checksum: 0x32898CA
	Offset: 0x1B988
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 5362
*/
function function_160f0c86()
{
	level.var_9af50a1b = 0;
	key = GetEnt("demongate_skull3", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Skull");
	key thread function_267bd389();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_267bd389
	Namespace: namespace_da78430a
	Checksum: 0x5E737BC4
	Offset: 0x1BA28
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 5383
*/
function function_267bd389()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_2fa657e6)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	location = struct::get("demongate_skull3_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (331.946, 143, 17.7235);
	model SetModel("c_zom_chomper_demongate");
	wait(0.1);
	self waittill("trigger", player);
	self delete();
	model clientfield::set("fx_demonskull", 1);
	playsoundatposition("chomper_bite_07", location.origin);
	wait(0.1);
	model clientfield::set("fx_demonskull", 0);
	model delete();
	level.var_9af50a1b = 1;
}

/*
	Name: function_5802a879
	Namespace: namespace_da78430a
	Checksum: 0x7AB7225A
	Offset: 0x1BBF0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 5417
*/
function function_5802a879()
{
	level.var_d9804956 = 0;
	key = GetEnt("demongate_skull4", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Skull");
	key thread function_e4883796();
}

/*
	Name: function_e4883796
	Namespace: namespace_da78430a
	Checksum: 0x80CA8EC1
	Offset: 0x1BC90
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 5436
*/
function function_e4883796()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_2fa657e6)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	location = struct::get("demongate_skull4_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (322.498, 30.5959, 0);
	model SetModel("c_zom_chomper_demongate");
	wait(0.1);
	self waittill("trigger", player);
	self delete();
	model clientfield::set("fx_demonskull", 1);
	playsoundatposition("chomper_bite_07", location.origin);
	wait(0.1);
	model clientfield::set("fx_demonskull", 0);
	model delete();
	level.var_d9804956 = 1;
}

/*
	Name: function_32002e10
	Namespace: namespace_da78430a
	Checksum: 0xB472DCBB
	Offset: 0x1BE58
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 5470
*/
function function_32002e10()
{
	level.var_a8ed8945 = 0;
	key = GetEnt("demongate_skull5", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Skull");
	key thread function_a8ab1ff();
}

/*
	Name: function_a8ab1ff
	Namespace: namespace_da78430a
	Checksum: 0x2C60D88E
	Offset: 0x1BEF8
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 5489
*/
function function_a8ab1ff()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_2fa657e6)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	location = struct::get("demongate_skull5_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (322.498, 210.596, 0);
	model SetModel("c_zom_chomper_demongate");
	wait(0.1);
	self waittill("trigger", player);
	self delete();
	model clientfield::set("fx_demonskull", 1);
	playsoundatposition("chomper_bite_07", location.origin);
	wait(0.1);
	model clientfield::set("fx_demonskull", 0);
	model delete();
	level.var_a8ed8945 = 1;
}

/*
	Name: function_a4079d4b
	Namespace: namespace_da78430a
	Checksum: 0xBC3212E2
	Offset: 0x1C0C0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 5523
*/
function function_a4079d4b()
{
	level.var_11d4a938 = 0;
	key = GetEnt("demongate_skull6", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Skull");
	key thread function_988342c4();
}

/*
	Name: function_988342c4
	Namespace: namespace_da78430a
	Checksum: 0x6A517E85
	Offset: 0x1C160
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 5542
*/
function function_988342c4()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_2fa657e6)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	location = struct::get("demongate_skull6_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (322.498, 120.596, 0);
	model SetModel("c_zom_chomper_demongate");
	wait(0.1);
	self waittill("trigger", player);
	self delete();
	model clientfield::set("fx_demonskull", 1);
	playsoundatposition("chomper_bite_07", location.origin);
	wait(0.1);
	model clientfield::set("fx_demonskull", 0);
	model delete();
	level.var_11d4a938 = 1;
}

/*
	Name: function_e8a6d18f
	Namespace: namespace_da78430a
	Checksum: 0x33C22C91
	Offset: 0x1C328
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 5576
*/
function function_e8a6d18f()
{
	level.var_8a09a324 = 0;
	level.var_2f1e6131 = 0;
	level.var_77a56944 = 0;
	level.var_465a7993 = 0;
	level.var_5a34733b = 0;
	level.var_3965ec7c = 0;
	key = GetEnt("demongate_skull_complete", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_f7ee39c();
}

/*
	Name: function_f7ee39c
	Namespace: namespace_da78430a
	Checksum: 0xBAC4A695
	Offset: 0x1C3E0
	Size: 0x2190
	Parameters: 0
	Flags: None
	Line Number: 5599
*/
function function_f7ee39c()
{
	// Could not fully decompile function; skipped
}

/*
	Name: function_a979da04
	Namespace: namespace_da78430a
	Checksum: 0x990CE9A2
	Offset: 0x1E578
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 5614
*/
function function_a979da04()
{
	thread function_80ea2f41();
}

/*
	Name: function_80ea2f41
	Namespace: namespace_da78430a
	Checksum: 0x7E2E3C6F
	Offset: 0x1E598
	Size: 0x678
	Parameters: 0
	Flags: None
	Line Number: 5629
*/
function function_80ea2f41()
{
	level endon("intermission");
	while(!level.var_2f1e6131)
	{
		wait(0.1);
	}
	e_model = GetEnt("urn_float2", "targetname");
	thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "They know my name. Gather and inscribe it");
	playsoundatposition("vox_cast_arro_demongate_name_0", (-517.5, -798.25, 126.75));
	wait(7);
	playsoundatposition("vox_cast_arro_demongate_crown_0", (-517.5, -798.25, 126.75));
	thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "Crown. Door. Griffon");
	wait(2.5);
	playsoundatposition("vox_cast_arro_demongate_door_0", (-517.5, -798.25, 126.75));
	wait(2.5);
	playsoundatposition("vox_cast_arro_demongate_griffon_0", (-517.5, -798.25, 126.75));
	wait(3.5);
	playsoundatposition("vox_cast_arro_demongate_ask_name_0", (-517.5, -798.25, 126.75));
	thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "What is my name?");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(level.var_4a9f389f == 1)
		{
			break;
		}
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			wait(0.5);
		}
		playsoundatposition("zmb_urn_interact", (-517.5, -798.25, 126.75));
		wait(2.5);
		playsoundatposition("vox_cast_arro_demongate_crown_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "Crown. Door. Griffon");
		wait(2.5);
		playsoundatposition("vox_cast_arro_demongate_door_0", (-517.5, -798.25, 126.75));
		wait(2.5);
		playsoundatposition("vox_cast_arro_demongate_griffon_0", (-517.5, -798.25, 126.75));
		wait(3.5);
		playsoundatposition("vox_cast_arro_demongate_ask_name_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "What is my name?");
		wait(5);
	}
	if(level.var_4a9f389f == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_fe57233c
	Namespace: namespace_da78430a
	Checksum: 0x65C265BE
	Offset: 0x1EC18
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 5691
*/
function function_fe57233c()
{
	level.var_e513726d = 0;
	wait(0.1);
	key = GetEnt("icon4", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_a760c823();
}

/*
	Name: function_a760c823
	Namespace: namespace_da78430a
	Checksum: 0x19DEEEB3
	Offset: 0x1ECA0
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 5710
*/
function function_a760c823()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_2f1e6131)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_4a9f389f == 1)
		{
			break;
		}
		FX = spawn("script_model", (-570.25, -877.5, 62.5));
		FX SetModel("tag_origin");
		FX clientfield::set("fx_demonskull", 1);
		level.var_e513726d = 1;
		wait(0.1);
		playsoundatposition("success", (-517.5, -798.25, 126.75));
		wait(2.5);
		FX clientfield::set("fx_demonskull", 0);
		FX delete();
	}
	if(level.var_4a9f389f == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_705e9277
	Namespace: namespace_da78430a
	Checksum: 0xA8145F79
	Offset: 0x1EE50
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 5753
*/
function function_705e9277()
{
	level.var_ef38dc0 = 0;
	wait(0.1);
	key = GetEnt("icon6", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_355958e8();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_355958e8
	Namespace: namespace_da78430a
	Checksum: 0x3F403110
	Offset: 0x1EED8
	Size: 0x338
	Parameters: 0
	Flags: None
	Line Number: 5774
*/
function function_355958e8()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_2f1e6131)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_4a9f389f == 1)
		{
			break;
		}
		if(level.var_e513726d == 1)
		{
			FX = spawn("script_model", (-609.25, -800, 62.5));
			FX SetModel("tag_origin");
			FX clientfield::set("fx_demonskull", 1);
			level.var_ef38dc0 = 1;
			wait(0.1);
			playsoundatposition("success", (-517.5, -798.25, 126.75));
			wait(2.5);
			FX clientfield::set("fx_demonskull", 0);
			FX delete();
			continue;
		}
		fx2 = spawn("script_model", (-609.25, -800, 62.5));
		fx2 SetModel("tag_origin");
		fx2 clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_e513726d = 0;
		level.var_ef38dc0 = 0;
		wait(18);
		level.var_5a34733b = 0;
		fx2 clientfield::set("fx_demonskull", 0);
		fx2 delete();
	}
	if(level.var_4a9f389f == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_4a5c180e
	Namespace: namespace_da78430a
	Checksum: 0xFA08E38C
	Offset: 0x1F218
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 5837
*/
function function_4a5c180e()
{
	level.var_4a9f389f = 0;
	wait(0.1);
	key = GetEnt("icon3", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_5b5bd351();
}

/*
	Name: function_5b5bd351
	Namespace: namespace_da78430a
	Checksum: 0x3D915F
	Offset: 0x1F2A0
	Size: 0x3C0
	Parameters: 0
	Flags: None
	Line Number: 5856
*/
function function_5b5bd351()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_2f1e6131)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_4a9f389f == 1)
		{
			break;
		}
		if(level.var_ef38dc0 == 1)
		{
			FX = spawn("script_model", (-424.25, -800, 62.5));
			FX SetModel("tag_origin");
			FX clientfield::set("fx_demonskull", 1);
			level.var_4a9f389f = 1;
			playsoundatposition("success", (-517.5, -798.25, 126.75));
			wait(1.5);
			playsoundatposition("vox_cast_arro_demongate_name_correct_0", (-517.5, -798.25, 126.75));
			thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is my name");
			wait(3.5);
			level.var_3965ec7c = 1;
			FX clientfield::set("fx_demonskull", 0);
			FX delete();
			wait(0.1);
			level notify("hash_8a8578fd");
			continue;
		}
		fx2 = spawn("script_model", (-424.25, -800, 62.5));
		fx2 SetModel("tag_origin");
		fx2 clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_e513726d = 0;
		level.var_ef38dc0 = 0;
		wait(18);
		level.var_5a34733b = 0;
		fx2 clientfield::set("fx_demonskull", 0);
		fx2 delete();
	}
	if(level.var_4a9f389f == 1)
	{
	}
	else if(level.var_4a9f389f == 1)
	{
		continue;
	}
}

/*
	Name: function_db2e73c3
	Namespace: namespace_da78430a
	Checksum: 0xAA965D22
	Offset: 0x1F668
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 5926
*/
function function_db2e73c3()
{
	key = GetEnt("icon1", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_b84ebe18();
	return;
	ERROR: Bad function call
}

/*
	Name: function_b84ebe18
	Namespace: namespace_da78430a
	Checksum: 0xCDDA44E9
	Offset: 0x1F6D8
	Size: 0x230
	Parameters: 0
	Flags: None
	Line Number: 5945
*/
function function_b84ebe18()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_2f1e6131)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_4a9f389f == 1)
		{
			break;
		}
		FX = spawn("script_model", (-569.25, -723.75, 62.5));
		FX SetModel("tag_origin");
		FX clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_e513726d = 0;
		level.var_ef38dc0 = 0;
		wait(18);
		level.var_5a34733b = 0;
		FX clientfield::set("fx_demonskull", 0);
		FX delete();
	}
	if(level.var_4a9f389f == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_69270488
	Namespace: namespace_da78430a
	Checksum: 0x722C8704
	Offset: 0x1F910
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 5995
*/
function function_69270488()
{
	key = GetEnt("icon2", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_2a562d53();
}

/*
	Name: function_2a562d53
	Namespace: namespace_da78430a
	Checksum: 0xDF8577EE
	Offset: 0x1F980
	Size: 0x230
	Parameters: 0
	Flags: None
	Line Number: 6012
*/
function function_2a562d53()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_2f1e6131)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_4a9f389f == 1)
		{
			break;
		}
		FX = spawn("script_model", (-466.75, -722.25, 62.5));
		FX SetModel("tag_origin");
		FX clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_e513726d = 0;
		level.var_ef38dc0 = 0;
		wait(18);
		level.var_5a34733b = 0;
		FX clientfield::set("fx_demonskull", 0);
		FX delete();
	}
	if(level.var_4a9f389f == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_8f297ef1
	Namespace: namespace_da78430a
	Checksum: 0x741CFAF0
	Offset: 0x1FBB8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 6062
*/
function function_8f297ef1()
{
	key = GetEnt("icon5", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_453b2ea();
}

/*
	Name: function_453b2ea
	Namespace: namespace_da78430a
	Checksum: 0x46D3B76E
	Offset: 0x1FC28
	Size: 0x228
	Parameters: 0
	Flags: None
	Line Number: 6079
*/
function function_453b2ea()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_2f1e6131)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_4a9f389f == 1)
		{
			break;
		}
		FX = spawn("script_model", (-467, -878.75, 62.5));
		FX SetModel("tag_origin");
		FX clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_e513726d = 0;
		level.var_ef38dc0 = 0;
		wait(18);
		level.var_5a34733b = 0;
		FX clientfield::set("fx_demonskull", 0);
		FX delete();
	}
	if(level.var_4a9f389f == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_5f48826b
	Namespace: namespace_da78430a
	Checksum: 0x7919365B
	Offset: 0x1FE58
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 6129
*/
function function_5f48826b()
{
	thread function_7271eea6();
}

/*
	Name: function_7271eea6
	Namespace: namespace_da78430a
	Checksum: 0x23EF63AB
	Offset: 0x1FE78
	Size: 0x678
	Parameters: 0
	Flags: None
	Line Number: 6144
*/
function function_7271eea6()
{
	level endon("intermission");
	while(!level.var_77a56944)
	{
		wait(0.1);
	}
	e_model = GetEnt("urn_float2", "targetname");
	thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "They know my name. Gather and inscribe it");
	playsoundatposition("vox_cast_arro_demongate_name_0", (-517.5, -798.25, 126.75));
	wait(7);
	thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "Heart. Horn. Stag");
	playsoundatposition("vox_cast_arro_demongate_heart_0", (-517.5, -798.25, 126.75));
	wait(2.5);
	playsoundatposition("vox_cast_arro_demongate_horn_0", (-517.5, -798.25, 126.75));
	wait(2.5);
	playsoundatposition("vox_cast_arro_demongate_stag_0", (-517.5, -798.25, 126.75));
	wait(3.5);
	playsoundatposition("vox_cast_arro_demongate_ask_name_0", (-517.5, -798.25, 126.75));
	thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "What is my name?");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(level.var_d32e394 == 1)
		{
			break;
		}
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			wait(0.5);
		}
		playsoundatposition("zmb_urn_interact", (-517.5, -798.25, 126.75));
		wait(2.5);
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "Heart. Horn. Stag");
		playsoundatposition("vox_cast_arro_demongate_heart_0", (-517.5, -798.25, 126.75));
		wait(2.5);
		playsoundatposition("vox_cast_arro_demongate_horn_0", (-517.5, -798.25, 126.75));
		wait(2.5);
		playsoundatposition("vox_cast_arro_demongate_stag_0", (-517.5, -798.25, 126.75));
		wait(3.5);
		playsoundatposition("vox_cast_arro_demongate_ask_name_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "What is my name?");
		wait(5);
	}
	if(level.var_d32e394 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_aef5bced
	Namespace: namespace_da78430a
	Checksum: 0x3AC23980
	Offset: 0x204F8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 6206
*/
function function_aef5bced()
{
	level.var_a5f9812 = 0;
	wait(0.1);
	key = GetEnt("icon5", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_9110cd3e();
}

/*
	Name: function_9110cd3e
	Namespace: namespace_da78430a
	Checksum: 0x37927A30
	Offset: 0x20580
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 6225
*/
function function_9110cd3e()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_77a56944)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_d32e394 == 1)
		{
			break;
		}
		FX = spawn("script_model", (-467, -878.75, 62.5));
		FX SetModel("tag_origin");
		FX clientfield::set("fx_demonskull", 1);
		level.var_a5f9812 = 1;
		wait(0.1);
		playsoundatposition("success", (-517.5, -798.25, 126.75));
		wait(2.5);
		FX clientfield::set("fx_demonskull", 0);
		FX delete();
	}
	if(level.var_d32e394 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_d4f83756
	Namespace: namespace_da78430a
	Checksum: 0x84BB1485
	Offset: 0x20728
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 6268
*/
function function_d4f83756()
{
	level.var_e3ec5223 = 0;
	wait(0.1);
	key = GetEnt("icon2", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_6b0e52d5();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_6b0e52d5
	Namespace: namespace_da78430a
	Checksum: 0xC2F6A73A
	Offset: 0x207B0
	Size: 0x348
	Parameters: 0
	Flags: None
	Line Number: 6289
*/
function function_6b0e52d5()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_77a56944)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_d32e394 == 1)
		{
			break;
		}
		if(level.var_a5f9812 == 1)
		{
			FX = spawn("script_model", (-466.75, -722.25, 62.5));
			FX SetModel("tag_origin");
			FX clientfield::set("fx_demonskull", 1);
			level.var_e3ec5223 = 1;
			wait(0.1);
			playsoundatposition("success", (-517.5, -798.25, 126.75));
			wait(2.5);
			FX clientfield::set("fx_demonskull", 0);
			FX delete();
			continue;
		}
		fx2 = spawn("script_model", (-466.75, -722.25, 62.5));
		fx2 SetModel("tag_origin");
		fx2 clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_a5f9812 = 0;
		level.var_e3ec5223 = 0;
		wait(18);
		level.var_5a34733b = 0;
		fx2 clientfield::set("fx_demonskull", 0);
		fx2 delete();
	}
	if(level.var_d32e394 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_fafab1bf
	Namespace: namespace_da78430a
	Checksum: 0x869A1B94
	Offset: 0x20B00
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 6352
*/
function function_fafab1bf()
{
	level.var_d32e394 = 0;
	wait(0.1);
	key = GetEnt("icon1", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_450bd86c();
	return;
}

/*
	Name: function_450bd86c
	Namespace: namespace_da78430a
	Checksum: 0x5436BD69
	Offset: 0x20B88
	Size: 0x3D0
	Parameters: 0
	Flags: None
	Line Number: 6372
*/
function function_450bd86c()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_77a56944)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_d32e394 == 1)
		{
			break;
		}
		if(level.var_e3ec5223 == 1)
		{
			FX = spawn("script_model", (-569.25, -723.75, 62.5));
			FX SetModel("tag_origin");
			FX clientfield::set("fx_demonskull", 1);
			level.var_d32e394 = 1;
			playsoundatposition("success", (-517.5, -798.25, 126.75));
			wait(1.5);
			playsoundatposition("vox_cast_arro_demongate_name_correct_0", (-517.5, -798.25, 126.75));
			thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is my name");
			wait(3.5);
			FX clientfield::set("fx_demonskull", 0);
			FX delete();
			level.var_3965ec7c = 1;
			wait(0.1);
			level notify("hash_8a8578fd");
			continue;
		}
		fx2 = spawn("script_model", (-569.25, -723.75, 62.5));
		fx2 SetModel("tag_origin");
		fx2 clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_a5f9812 = 0;
		level.var_e3ec5223 = 0;
		wait(18);
		level.var_5a34733b = 0;
		FX clientfield::set("fx_demonskull", 0);
		fx2 delete();
	}
	if(level.var_d32e394 == 1)
	{
	}
	else if(level.var_d32e394 == 1)
	{
		continue;
	}
}

/*
	Name: function_ec19845a
	Namespace: namespace_da78430a
	Checksum: 0x3F18798E
	Offset: 0x20F60
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 6442
*/
function function_ec19845a()
{
	key = GetEnt("icon3", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_1d57a4c5();
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1d57a4c5
	Namespace: namespace_da78430a
	Checksum: 0xBD6D1384
	Offset: 0x20FD0
	Size: 0x228
	Parameters: 0
	Flags: None
	Line Number: 6462
*/
function function_1d57a4c5()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_77a56944)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_d32e394 == 1)
		{
			break;
		}
		FX = spawn("script_model", (-424.25, -800, 62.5));
		FX SetModel("tag_origin");
		FX clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_a5f9812 = 0;
		level.var_e3ec5223 = 0;
		wait(18);
		level.var_5a34733b = 0;
		FX clientfield::set("fx_demonskull", 0);
		FX delete();
	}
	if(level.var_d32e394 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_c61709f1
	Namespace: namespace_da78430a
	Checksum: 0xF76595A0
	Offset: 0x21200
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 6512
*/
function function_c61709f1()
{
	key = GetEnt("icon4", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_435a1f2e();
}

/*
	Name: function_435a1f2e
	Namespace: namespace_da78430a
	Checksum: 0xA90FC660
	Offset: 0x21270
	Size: 0x230
	Parameters: 0
	Flags: None
	Line Number: 6529
*/
function function_435a1f2e()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_77a56944)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_d32e394 == 1)
		{
			break;
		}
		FX = spawn("script_model", (-570.25, -877.5, 62.5));
		FX SetModel("tag_origin");
		FX clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_a5f9812 = 0;
		level.var_e3ec5223 = 0;
		wait(18);
		level.var_5a34733b = 0;
		FX clientfield::set("fx_demonskull", 0);
		FX delete();
	}
	if(level.var_d32e394 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_a0148f88
	Namespace: namespace_da78430a
	Checksum: 0xEA1DA7D5
	Offset: 0x214A8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 6579
*/
function function_a0148f88()
{
	key = GetEnt("icon6", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_695c9997();
}

/*
	Name: function_695c9997
	Namespace: namespace_da78430a
	Checksum: 0x1A9B74A
	Offset: 0x21518
	Size: 0x228
	Parameters: 0
	Flags: None
	Line Number: 6596
*/
function function_695c9997()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_77a56944)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_d32e394 == 1)
		{
			break;
		}
		FX = spawn("script_model", (-609.25, -800, 62.5));
		FX SetModel("tag_origin");
		FX clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_a5f9812 = 0;
		level.var_e3ec5223 = 0;
		wait(18);
		level.var_5a34733b = 0;
		FX clientfield::set("fx_demonskull", 0);
		FX delete();
	}
	if(level.var_d32e394 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_bf8687ba
	Namespace: namespace_da78430a
	Checksum: 0x3C41FE26
	Offset: 0x21748
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 6646
*/
function function_bf8687ba()
{
	thread function_813a2087();
}

/*
	Name: function_813a2087
	Namespace: namespace_da78430a
	Checksum: 0x42B3E289
	Offset: 0x21768
	Size: 0x678
	Parameters: 0
	Flags: None
	Line Number: 6661
*/
function function_813a2087()
{
	level endon("intermission");
	while(!level.var_465a7993)
	{
		wait(0.1);
	}
	e_model = GetEnt("urn_float2", "targetname");
	thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "They know my name. Gather and inscribe it");
	playsoundatposition("vox_cast_arro_demongate_name_0", (-517.5, -798.25, 126.75));
	wait(7);
	thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "Stag. Door. Horn");
	playsoundatposition("vox_cast_arro_demongate_stag_0", (-517.5, -798.25, 126.75));
	wait(2.5);
	playsoundatposition("vox_cast_arro_demongate_door_0", (-517.5, -798.25, 126.75));
	wait(2.5);
	playsoundatposition("vox_cast_arro_demongate_horn_0", (-517.5, -798.25, 126.75));
	wait(3.5);
	playsoundatposition("vox_cast_arro_demongate_ask_name_0", (-517.5, -798.25, 126.75));
	thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "What is my name?");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(level.var_5d0e17d9 == 1)
		{
			break;
		}
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			wait(0.5);
		}
		playsoundatposition("zmb_urn_interact", (-517.5, -798.25, 126.75));
		wait(2.5);
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "Stag. Door. Horn");
		playsoundatposition("vox_cast_arro_demongate_stag_0", (-517.5, -798.25, 126.75));
		wait(2.5);
		playsoundatposition("vox_cast_arro_demongate_door_0", (-517.5, -798.25, 126.75));
		wait(2.5);
		playsoundatposition("vox_cast_arro_demongate_horn_0", (-517.5, -798.25, 126.75));
		wait(3.5);
		playsoundatposition("vox_cast_arro_demongate_ask_name_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "What is my name?");
		wait(5);
	}
	if(level.var_5d0e17d9 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_4bc20d9a
	Namespace: namespace_da78430a
	Checksum: 0x2F4DA7E5
	Offset: 0x21DE8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 6723
*/
function function_4bc20d9a()
{
	level.var_17f3ce7b = 0;
	wait(0.1);
	key = GetEnt("icon1", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_ae820311();
}

/*
	Name: function_ae820311
	Namespace: namespace_da78430a
	Checksum: 0xBE6C9E98
	Offset: 0x21E70
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 6742
*/
function function_ae820311()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_465a7993)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_5d0e17d9 == 1)
		{
			break;
		}
		FX = spawn("script_model", (-569.25, -723.75, 62.5));
		FX SetModel("tag_origin");
		FX clientfield::set("fx_demonskull", 1);
		level.var_17f3ce7b = 1;
		wait(0.1);
		playsoundatposition("success", (-517.5, -798.25, 126.75));
		wait(2.5);
		FX clientfield::set("fx_demonskull", 0);
		FX delete();
	}
	if(level.var_5d0e17d9 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_25bf9331
	Namespace: namespace_da78430a
	Checksum: 0x17D177B3
	Offset: 0x22020
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 6785
*/
function function_25bf9331()
{
	level.var_7d229e4a = 0;
	wait(0.1);
	key = GetEnt("icon6", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_d4847d7a();
}

/*
	Name: function_d4847d7a
	Namespace: namespace_da78430a
	Checksum: 0xF773EF2D
	Offset: 0x220A8
	Size: 0x338
	Parameters: 0
	Flags: None
	Line Number: 6804
*/
function function_d4847d7a()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_465a7993)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_5d0e17d9 == 1)
		{
			break;
		}
		if(level.var_17f3ce7b == 1)
		{
			FX = spawn("script_model", (-609.25, -800, 62.5));
			FX SetModel("tag_origin");
			FX clientfield::set("fx_demonskull", 1);
			level.var_7d229e4a = 1;
			wait(0.1);
			playsoundatposition("success", (-517.5, -798.25, 126.75));
			wait(2.5);
			FX clientfield::set("fx_demonskull", 0);
			FX delete();
			continue;
		}
		fx2 = spawn("script_model", (-609.25, -800, 62.5));
		fx2 SetModel("tag_origin");
		fx2 clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_17f3ce7b = 0;
		level.var_7d229e4a = 0;
		wait(18);
		level.var_5a34733b = 0;
		fx2 clientfield::set("fx_demonskull", 0);
		fx2 delete();
	}
	if(level.var_5d0e17d9 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_ffbd18c8
	Namespace: namespace_da78430a
	Checksum: 0x7DD2C22E
	Offset: 0x223E8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 6867
*/
function function_ffbd18c8()
{
	level.var_5d0e17d9 = 0;
	wait(0.1);
	key = GetEnt("icon2", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_fa86f7e3();
}

/*
	Name: function_fa86f7e3
	Namespace: namespace_da78430a
	Checksum: 0xB2B02E61
	Offset: 0x22470
	Size: 0x3C8
	Parameters: 0
	Flags: None
	Line Number: 6886
*/
function function_fa86f7e3()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_465a7993)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_5d0e17d9 == 1)
		{
			break;
		}
		if(level.var_7d229e4a == 1)
		{
			FX = spawn("script_model", (-466.75, -722.25, 62.5));
			FX SetModel("tag_origin");
			FX clientfield::set("fx_demonskull", 1);
			level.var_5d0e17d9 = 1;
			playsoundatposition("success", (-517.5, -798.25, 126.75));
			wait(1.5);
			playsoundatposition("vox_cast_arro_demongate_name_correct_0", (-517.5, -798.25, 126.75));
			thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is my name");
			wait(3.5);
			level.var_3965ec7c = 1;
			FX clientfield::set("fx_demonskull", 0);
			FX delete();
			wait(0.1);
			level notify("hash_8a8578fd");
			continue;
		}
		fx2 = spawn("script_model", (-466.75, -722.25, 62.5));
		fx2 SetModel("tag_origin");
		fx2 clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_17f3ce7b = 0;
		level.var_7d229e4a = 0;
		wait(18);
		level.var_5a34733b = 0;
		fx2 clientfield::set("fx_demonskull", 0);
		fx2 delete();
	}
	if(level.var_5d0e17d9 == 1)
	{
	}
	else if(level.var_5d0e17d9 == 1)
	{
		continue;
	}
}

/*
	Name: function_7e23fa59
	Namespace: namespace_da78430a
	Checksum: 0x2E601926
	Offset: 0x22840
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 6956
*/
function function_7e23fa59()
{
	key = GetEnt("icon3", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_57231846();
}

/*
	Name: function_57231846
	Namespace: namespace_da78430a
	Checksum: 0x788412A7
	Offset: 0x228B0
	Size: 0x228
	Parameters: 0
	Flags: None
	Line Number: 6973
*/
function function_57231846()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_465a7993)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_5d0e17d9 == 1)
		{
			break;
		}
		FX = spawn("script_model", (-424.25, -800, 62.5));
		FX SetModel("tag_origin");
		FX clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_17f3ce7b = 0;
		level.var_7d229e4a = 0;
		wait(18);
		level.var_5a34733b = 0;
		FX clientfield::set("fx_demonskull", 0);
		FX delete();
	}
	if(level.var_5d0e17d9 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_a42674c2
	Namespace: namespace_da78430a
	Checksum: 0x6D07915F
	Offset: 0x22AE0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 7023
*/
function function_a42674c2()
{
	key = GetEnt("icon4", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_31209ddd();
}

/*
	Name: function_31209ddd
	Namespace: namespace_da78430a
	Checksum: 0xBAC7565A
	Offset: 0x22B50
	Size: 0x230
	Parameters: 0
	Flags: None
	Line Number: 7040
*/
function function_31209ddd()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_465a7993)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_5d0e17d9 == 1)
		{
			break;
		}
		FX = spawn("script_model", (-570.25, -877.5, 62.5));
		FX SetModel("tag_origin");
		FX clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_17f3ce7b = 0;
		level.var_7d229e4a = 0;
		wait(18);
		level.var_5a34733b = 0;
		FX clientfield::set("fx_demonskull", 0);
		FX delete();
	}
	if(level.var_5d0e17d9 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_ca28ef2b
	Namespace: namespace_da78430a
	Checksum: 0xCBFF82C3
	Offset: 0x22D88
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 7090
*/
function function_ca28ef2b()
{
	key = GetEnt("icon5", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_b1e2374();
}

/*
	Name: function_b1e2374
	Namespace: namespace_da78430a
	Checksum: 0x61982AE9
	Offset: 0x22DF8
	Size: 0x228
	Parameters: 0
	Flags: None
	Line Number: 7107
*/
function function_b1e2374()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_465a7993)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_5d0e17d9 == 1)
		{
			break;
		}
		FX = spawn("script_model", (-467, -878.75, 62.5));
		FX SetModel("tag_origin");
		FX clientfield::set("fx_demonskull", 1);
		playsoundatposition("circle_rune_hit", (-517.5, -798.25, 126.75));
		wait(2);
		playsoundatposition("vox_cast_arro_demongate_name_incorrect_0", (-517.5, -798.25, 126.75));
		thread namespace_56430b4::function_8a662f5e(undefined, 1, "Demon Voice", "That is not my name");
		wait(0.25);
		level notify("hash_8a8578fd");
		level.var_5a34733b = 1;
		level.var_17f3ce7b = 0;
		level.var_7d229e4a = 0;
		wait(18);
		level.var_5a34733b = 0;
		FX clientfield::set("fx_demonskull", 0);
		FX delete();
	}
	if(level.var_5d0e17d9 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_67ff4134
	Namespace: namespace_da78430a
	Checksum: 0xBFCD2E07
	Offset: 0x23028
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 7157
*/
function function_67ff4134()
{
	level.var_c2885a75 = 0;
	key = GetEnt("demongate_icons_complete", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Arrow");
	key thread function_fbfcf7c3();
}

/*
	Name: function_fbfcf7c3
	Namespace: namespace_da78430a
	Checksum: 0xB5AD3F0D
	Offset: 0x230C8
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 7176
*/
function function_fbfcf7c3()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_ca617df1)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	location = struct::get("demongate_arrow_struct", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (0, 0, 0);
	model SetModel("p7_fxanim_zm_castle_quest_demongate_arrow_whole_mod");
	PlayFXOnTag(level._effect["demonaura"], model, "demon_arrow_whole_fx_jnt");
	model useanimtree(-1);
	model AnimScripted("demongate_arrow_whole_mod_idle_anim", model.origin, model.angles, %demongate_arrow_whole_mod_idle_anim);
	self waittill("trigger", player);
	playsoundatposition("zmb_arrow_reforged", player.origin);
	model delete();
	self delete();
	level.var_c2885a75 = 1;
}

/*
	Name: function_c83b8a8d
	Namespace: namespace_da78430a
	Checksum: 0x79051C09
	Offset: 0x232C0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 7209
*/
function function_c83b8a8d()
{
	level.var_c317b842 = 0;
	key = GetEnt("demongate_quest_soul", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Place Arrow");
	key thread function_8005ddd2();
}

/*
	Name: function_8005ddd2
	Namespace: namespace_da78430a
	Checksum: 0x8EEB63A0
	Offset: 0x23360
	Size: 0x300
	Parameters: 0
	Flags: None
	Line Number: 7228
*/
function function_8005ddd2()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_c2885a75)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("zmb_bow_upgrade", (-129.5, -2020.75, -525.75));
	FX = spawn("script_model", (-109.75, -2036, -540.5));
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["demonaura"], FX, "tag_origin");
	location = struct::get("demongate_arrow_model3", "targetname");
	location2 = struct::get("demongate_arrow_ammo", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (340, 80, 0);
	model SetModel("tag_origin3");
	model thread zm_powerups::powerup_wobble();
	wait(0.25);
	level thread zm_powerups::specific_powerup_drop("full_ammo", location2.origin);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	self delete();
	wait(0.1);
	level.var_c317b842 = 1;
	while(!level.var_6ec350e8)
	{
		wait(0.25);
	}
	model delete();
}

/*
	Name: function_c6936a0d
	Namespace: namespace_da78430a
	Checksum: 0xD5AB9DC
	Offset: 0x23668
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 7274
*/
function function_c6936a0d()
{
	level.var_99ce36be = 0;
	level.var_b892ca19 = 0;
	level.var_96195a3f = 0;
	level.var_17a62ff1 = 0;
	key = GetEnt("rune_prison_obelisk", "targetname");
	key thread function_39228c10();
	var_bf1d5e21 = GetEntArray("key_door_rune_prison_obelisk", "targetname");
	foreach(door in var_bf1d5e21)
	{
		door thread function_fd1a2d70();
	}
	return;
	continue;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_39228c10
	Namespace: namespace_da78430a
	Checksum: 0xCD59F88F
	Offset: 0x23798
	Size: 0x780
	Parameters: 0
	Flags: None
	Line Number: 7302
*/
function function_39228c10()
{
	level endon("intermission");
	FX = spawn("script_model", (-1857.25, -1894.5, -53.25));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_obeliskglow", 1);
	e_model = GetEnt("obelisk", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			break;
		}
	}
	model = GetEnt(self.target, "targetname");
	playsoundatposition("evt_meteor_impact", (-1846.11, -1903.1, -151.25));
	fx2 = spawn("script_model", (-1859.5, -1892.5, -53.5));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_obeliskexplode", 1);
	wait(0.5);
	FX clientfield::set("fx_obeliskglow", 0);
	FX delete();
	model2 = GetEnt("rune_prison_obelisk", "targetname");
	model2 delete();
	model3 = GetEnt("rune_prison_obelisk2", "targetname");
	model3 delete();
	var_be607d78 = GetEnt("rune_prison_obelisk3", "targetname");
	var_be607d78 delete();
	level.var_99ce36be = 1;
	wait(2.5);
	playsoundatposition("zmb_tornado_arrow_1", (-1846.11, -1903.1, -151.25));
	fx2 clientfield::set("fx_obeliskexplode", 0);
	fx2 delete();
	location = struct::get("rune_prison_arrow_model", "targetname");
	var_be607d78 = spawn("script_model", location.origin);
	var_be607d78.angles = VectorScale((0, 1, 0), 167.699);
	var_be607d78 SetModel("p7_fxanim_zm_castle_quest_rune_clock_wall_arrow_broken_mod");
	var_be607d78 useanimtree(-1);
	var_be607d78 AnimScripted("rune_arrow_broken_mod_idle_anim", var_be607d78.origin, var_be607d78.angles, %rune_arrow_broken_mod_idle_anim);
	PlayFXOnTag(level._effect["runearrowglow"], var_be607d78, "arrow_shaft_fx_jnt");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	var_be607d78 delete();
}

/*
	Name: function_fd1a2d70
	Namespace: namespace_da78430a
	Checksum: 0xF0A5AD52
	Offset: 0x23F20
	Size: 0x500
	Parameters: 0
	Flags: None
	Line Number: 7363
*/
function function_fd1a2d70()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_99ce36be)
	{
		wait(0.25);
	}
	wait(2.5);
	self TriggerEnable(1);
	self setHintString("Press and Hold ^3&&1^7 to Start Upgrade Quest");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("zmb_arrow_reforged", player.origin);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	foreach(model in models)
	{
		model delete();
	}
	self delete();
	level.var_b892ca19 = 1;
	wait(0.25);
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_rune", 3.5);
	level clientfield::set("quest_state_rune", 1);
	level clientfield::set("quest_owner_rune", player function_f653fb27());
	while(!level.var_8d99a227)
	{
		wait(0.25);
	}
	while(!level.var_488013fa)
	{
		wait(0.25);
	}
	while(!level.var_de24adf1)
	{
		wait(0.25);
	}
	level.var_96195a3f = 1;
	playsoundatposition("zmb_tornado_arrow_1", player.origin);
	player thread function_3bc995f5("zmInventory.widget_weap_quest_rune", 3.5);
	level clientfield::set("quest_state_rune", 2);
	while(!level.var_84af1cd9)
	{
		wait(0.25);
	}
	while(!level.var_efd85a2c)
	{
		wait(0.25);
	}
	while(!level.var_3f94d37b)
	{
		wait(0.25);
	}
	level.var_17a62ff1 = 1;
	playsoundatposition("zmb_tornado_arrow_1", player.origin);
	player thread function_3bc995f5("zmInventory.widget_weap_quest_rune", 3.5);
	level clientfield::set("quest_state_rune", 3);
	while(!level.var_36836c79)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_rune", 3.5);
	level clientfield::set("quest_state_rune", 4);
	while(!level.var_3984eb84)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_rune", 3.5);
	level clientfield::set("quest_state_rune", 5);
	while(!level.var_ea692787)
	{
		wait(0.25);
	}
	player thread function_3bc995f5("zmInventory.widget_weap_quest_rune", 3.5);
	level clientfield::set("quest_state_rune", 6);
	return;
	ERROR: Bad function call
}

/*
	Name: function_957f43ff
	Namespace: namespace_da78430a
	Checksum: 0x5CC29143
	Offset: 0x24428
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 7458
*/
function function_957f43ff()
{
	thread function_7cd7cdae();
	thread function_ad6d7235();
	thread function_876af7cc();
	thread function_61687d63();
}

/*
	Name: function_7cd7cdae
	Namespace: namespace_da78430a
	Checksum: 0xD193FF81
	Offset: 0x24478
	Size: 0x370
	Parameters: 0
	Flags: None
	Line Number: 7476
*/
function function_7cd7cdae()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	e_model = GetEnt("rune_prison_circle1_target", "targetname");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			level notify("hash_f53ad998");
		}
	}
	if(level.var_f3e7e488 == 1)
	{
		continue;
	}
}

/*
	Name: function_ad6d7235
	Namespace: namespace_da78430a
	Checksum: 0x80805E07
	Offset: 0x247F0
	Size: 0x370
	Parameters: 0
	Flags: None
	Line Number: 7509
*/
function function_ad6d7235()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	e_model = GetEnt("rune_prison_circle1_target_2", "targetname");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			level notify("hash_f53ad998");
		}
	}
	if(level.var_f3e7e488 == 1)
	{
		continue;
	}
}

/*
	Name: function_876af7cc
	Namespace: namespace_da78430a
	Checksum: 0x85EF22F1
	Offset: 0x24B68
	Size: 0x370
	Parameters: 0
	Flags: None
	Line Number: 7542
*/
function function_876af7cc()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	e_model = GetEnt("rune_prison_circle1_target_3", "targetname");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			level notify("hash_f53ad998");
		}
	}
	if(level.var_f3e7e488 == 1)
	{
		continue;
	}
}

/*
	Name: function_61687d63
	Namespace: namespace_da78430a
	Checksum: 0xC996509
	Offset: 0x24EE0
	Size: 0x370
	Parameters: 0
	Flags: None
	Line Number: 7575
*/
function function_61687d63()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	e_model = GetEnt("rune_prison_circle1_target_4", "targetname");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			level notify("hash_f53ad998");
		}
	}
	if(level.var_f3e7e488 == 1)
	{
		continue;
	}
}

/*
	Name: function_4a89e99d
	Namespace: namespace_da78430a
	Checksum: 0xF2DFB48C
	Offset: 0x25258
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 7608
*/
function function_4a89e99d()
{
	level.var_f3e7e488 = 0;
	level.var_8d99a227 = 0;
	level.var_6a45a301 = 0;
	thread function_3a55ac40();
}

/*
	Name: function_3a55ac40
	Namespace: namespace_da78430a
	Checksum: 0xBCF112A6
	Offset: 0x252A0
	Size: 0x690
	Parameters: 0
	Flags: None
	Line Number: 7626
*/
function function_3a55ac40()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	location = struct::get("rune_prison_circle1_struct", "targetname");
	e_model = GetEnt("rune_prison_circle1_target", "targetname");
	var_fff00e7b = GetEnt("rune_prison_circle1_target_2", "targetname");
	var_25f288e4 = GetEnt("rune_prison_circle1_target_3", "targetname");
	var_4bf5034d = GetEnt("rune_prison_circle1_target_4", "targetname");
	var_d9ed9412 = GetEnt("rune_prison_circle1", "targetname");
	var_d9ed9412 moveto(location.origin, 0.2, 0.05, 0.05);
	while(1)
	{
		level waittill("hash_f53ad998");
		if(level.var_6a45a301 == 1)
		{
			FX = spawn("script_model", (44.25, -2194.5, 12));
			FX.angles = VectorScale((0, 1, 0), 270);
			FX SetModel("tag_origin");
			FX clientfield::set("fx_runecirclefire", 1);
			fx2 = spawn("script_model", (-47.75, -2290.5, 12));
			fx2.angles = (0, 0, 0);
			fx2 SetModel("tag_origin");
			fx2 clientfield::set("fx_runecirclefire", 1);
			FX3 = spawn("script_model", (52.25, -2378.5, 12));
			FX3.angles = VectorScale((0, 1, 0), 90);
			FX3 SetModel("tag_origin");
			FX3 clientfield::set("fx_runecirclefire", 1);
			var_fb2c4b25 = spawn("script_model", (136.25, -2282.5, 12));
			var_fb2c4b25.angles = VectorScale((0, 1, 0), 180);
			var_fb2c4b25 SetModel("tag_origin");
			var_fb2c4b25 clientfield::set("fx_runecirclefire", 1);
			var_d529d0bc = spawn("script_model", (40.25, -2282.75, 13.5));
			var_d529d0bc.angles = (0, 0, 0);
			var_d529d0bc SetModel("tag_origin");
			var_d529d0bc clientfield::set("fx_runecircleflare", 1);
			wait(1);
			level.var_f3e7e488 = 1;
			wait(0.1);
			level.var_8d99a227 = 1;
			wait(0.1);
			while(!level.var_84af1cd9)
			{
				wait(2.5);
			}
			e_model delete();
			var_d9ed9412 delete();
			var_fff00e7b delete();
			var_25f288e4 delete();
			var_4bf5034d delete();
			FX clientfield::set("fx_runecirclefire", 0);
			fx2 clientfield::set("fx_runecirclefire", 0);
			FX3 clientfield::set("fx_runecirclefire", 0);
			var_fb2c4b25 clientfield::set("fx_runecirclefire", 0);
			var_d529d0bc clientfield::set("fx_runecircleflare", 0);
			FX delete();
			fx2 delete();
			FX3 delete();
			var_fb2c4b25 delete();
			var_d529d0bc delete();
			break;
			continue;
		}
		wait(0.5);
	}
	if(level.var_f3e7e488 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_2377d4c4
	Namespace: namespace_da78430a
	Checksum: 0xB1B1C295
	Offset: 0x25938
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 7711
*/
function function_2377d4c4()
{
	thread function_56d55345();
	thread function_bd9070a();
	thread function_31db8173();
	thread function_57ddfbdc();
}

/*
	Name: function_56d55345
	Namespace: namespace_da78430a
	Checksum: 0x70BB087D
	Offset: 0x25988
	Size: 0x378
	Parameters: 0
	Flags: None
	Line Number: 7729
*/
function function_56d55345()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	e_model = GetEnt("rune_prison_circle2_target", "targetname");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			level notify("hash_e38c3baf");
		}
	}
	if(level.var_ccd05855 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_bd9070a
	Namespace: namespace_da78430a
	Checksum: 0x62A69EFA
	Offset: 0x25D08
	Size: 0x370
	Parameters: 0
	Flags: None
	Line Number: 7763
*/
function function_bd9070a()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	e_model = GetEnt("rune_prison_circle2_target_2", "targetname");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			level notify("hash_e38c3baf");
		}
	}
	if(level.var_ccd05855 == 1)
	{
		continue;
	}
}

/*
	Name: function_31db8173
	Namespace: namespace_da78430a
	Checksum: 0xEBB591C0
	Offset: 0x26080
	Size: 0x370
	Parameters: 0
	Flags: None
	Line Number: 7796
*/
function function_31db8173()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	e_model = GetEnt("rune_prison_circle2_target_3", "targetname");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			level notify("hash_e38c3baf");
		}
	}
	if(level.var_ccd05855 == 1)
	{
		continue;
	}
}

/*
	Name: function_57ddfbdc
	Namespace: namespace_da78430a
	Checksum: 0xB662CC9D
	Offset: 0x263F8
	Size: 0x370
	Parameters: 0
	Flags: None
	Line Number: 7829
*/
function function_57ddfbdc()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	e_model = GetEnt("rune_prison_circle2_target_4", "targetname");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			level notify("hash_e38c3baf");
		}
	}
	if(level.var_ccd05855 == 1)
	{
		continue;
	}
}

/*
	Name: function_ef2e4c6a
	Namespace: namespace_da78430a
	Checksum: 0xE573FE7A
	Offset: 0x26770
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 7862
*/
function function_ef2e4c6a()
{
	level.var_ccd05855 = 0;
	level.var_488013fa = 0;
	thread function_fbfe69f7();
}

/*
	Name: function_fbfe69f7
	Namespace: namespace_da78430a
	Checksum: 0x452C8CBC
	Offset: 0x267A8
	Size: 0x690
	Parameters: 0
	Flags: None
	Line Number: 7879
*/
function function_fbfe69f7()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	location = struct::get("rune_prison_circle2_struct", "targetname");
	e_model = GetEnt("rune_prison_circle2_target", "targetname");
	var_fff00e7b = GetEnt("rune_prison_circle2_target_2", "targetname");
	var_25f288e4 = GetEnt("rune_prison_circle2_target_3", "targetname");
	var_4bf5034d = GetEnt("rune_prison_circle2_target_4", "targetname");
	var_d9ed9412 = GetEnt("rune_prison_circle2", "targetname");
	var_d9ed9412 moveto(location.origin, 0.2, 0.05, 0.05);
	while(1)
	{
		level waittill("hash_e38c3baf");
		if(level.var_6a45a301 == 1)
		{
			FX = spawn("script_model", (-358.25, 26.5, 528));
			FX.angles = VectorScale((0, 1, 0), 270);
			FX SetModel("tag_origin");
			FX clientfield::set("fx_runecirclefire", 1);
			fx2 = spawn("script_model", (-450.25, -69.5, 528));
			fx2.angles = (0, 0, 0);
			fx2 SetModel("tag_origin");
			fx2 clientfield::set("fx_runecirclefire", 1);
			FX3 = spawn("script_model", (-350.25, -157.5, 528));
			FX3.angles = VectorScale((0, 1, 0), 90);
			FX3 SetModel("tag_origin");
			FX3 clientfield::set("fx_runecirclefire", 1);
			var_fb2c4b25 = spawn("script_model", (-266.25, -61.5, 528));
			var_fb2c4b25.angles = VectorScale((0, 1, 0), 180);
			var_fb2c4b25 SetModel("tag_origin");
			var_fb2c4b25 clientfield::set("fx_runecirclefire", 1);
			var_d529d0bc = spawn("script_model", (-362.25, -61.75, 529.5));
			var_d529d0bc.angles = (0, 0, 0);
			var_d529d0bc SetModel("tag_origin");
			var_d529d0bc clientfield::set("fx_runecircleflare", 1);
			wait(1);
			level.var_ccd05855 = 1;
			wait(0.1);
			level.var_488013fa = 1;
			wait(0.1);
			while(!level.var_efd85a2c)
			{
				wait(2.5);
			}
			e_model delete();
			var_d9ed9412 delete();
			var_fff00e7b delete();
			var_25f288e4 delete();
			var_4bf5034d delete();
			FX clientfield::set("fx_runecirclefire", 0);
			fx2 clientfield::set("fx_runecirclefire", 0);
			FX3 clientfield::set("fx_runecirclefire", 0);
			var_fb2c4b25 clientfield::set("fx_runecirclefire", 0);
			var_d529d0bc clientfield::set("fx_runecircleflare", 0);
			FX delete();
			fx2 delete();
			FX3 delete();
			var_fb2c4b25 delete();
			var_d529d0bc delete();
			break;
			continue;
		}
		wait(0.5);
	}
	if(level.var_ccd05855 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_497a4f2d
	Namespace: namespace_da78430a
	Checksum: 0x6D980CDA
	Offset: 0x26E40
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 7964
*/
function function_497a4f2d()
{
	thread function_30d2d8dc();
	thread function_8aaa507b();
	thread function_64a7d612();
	thread function_d6af454d();
}

/*
	Name: function_30d2d8dc
	Namespace: namespace_da78430a
	Checksum: 0x4F222D10
	Offset: 0x26E90
	Size: 0x378
	Parameters: 0
	Flags: None
	Line Number: 7982
*/
function function_30d2d8dc()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	e_model = GetEnt("rune_prison_circle3_target", "targetname");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			level notify("hash_668d8b6a");
		}
	}
	if(level.var_436987e6 == 1)
	{
		continue;
		continue;
	}
	return;
}

/*
	Name: function_8aaa507b
	Namespace: namespace_da78430a
	Checksum: 0xC882B4FF
	Offset: 0x27210
	Size: 0x378
	Parameters: 0
	Flags: None
	Line Number: 8017
*/
function function_8aaa507b()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	e_model = GetEnt("rune_prison_circle3_target_2", "targetname");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			level notify("hash_668d8b6a");
		}
	}
	if(level.var_436987e6 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_64a7d612
	Namespace: namespace_da78430a
	Checksum: 0x1B99467
	Offset: 0x27590
	Size: 0x378
	Parameters: 0
	Flags: None
	Line Number: 8051
*/
function function_64a7d612()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	e_model = GetEnt("rune_prison_circle3_target_3", "targetname");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			level notify("hash_668d8b6a");
		}
	}
	if(level.var_436987e6 == 1)
	{
		continue;
		continue;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d6af454d
	Namespace: namespace_da78430a
	Checksum: 0x697258D4
	Offset: 0x27910
	Size: 0x378
	Parameters: 0
	Flags: None
	Line Number: 8087
*/
function function_d6af454d()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	e_model = GetEnt("rune_prison_circle3_target_4", "targetname");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			level notify("hash_668d8b6a");
		}
	}
	if(level.var_436987e6 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_6c2cfcaf
	Namespace: namespace_da78430a
	Checksum: 0xD4E5B495
	Offset: 0x27C90
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 8121
*/
function function_6c2cfcaf()
{
	level.var_436987e6 = 0;
	level.var_de24adf1 = 0;
	level.var_6a45a301 = 0;
	thread function_7b144d92();
}

/*
	Name: function_7b144d92
	Namespace: namespace_da78430a
	Checksum: 0xFCFD1360
	Offset: 0x27CD8
	Size: 0x670
	Parameters: 0
	Flags: None
	Line Number: 8139
*/
function function_7b144d92()
{
	level endon("intermission");
	while(!level.var_b892ca19)
	{
		wait(0.25);
	}
	location = struct::get("rune_prison_circle3_struct", "targetname");
	e_model = GetEnt("rune_prison_circle3_target", "targetname");
	var_fff00e7b = GetEnt("rune_prison_circle3_target_2", "targetname");
	var_25f288e4 = GetEnt("rune_prison_circle3_target_3", "targetname");
	var_4bf5034d = GetEnt("rune_prison_circle3_target_4", "targetname");
	var_d9ed9412 = GetEnt("rune_prison_circle3", "targetname");
	var_d9ed9412 moveto(location.origin, 0.2, 0.05, 0.05);
	while(1)
	{
		level waittill("hash_668d8b6a");
		if(level.var_6a45a301 == 1)
		{
			FX = spawn("script_model", (-408, 992, 864));
			FX.angles = VectorScale((0, 1, 0), 270);
			FX SetModel("tag_origin");
			FX clientfield::set("fx_runecirclefire", 1);
			fx2 = spawn("script_model", (-500, 896, 864));
			fx2.angles = (0, 0, 0);
			fx2 SetModel("tag_origin");
			fx2 clientfield::set("fx_runecirclefire", 1);
			FX3 = spawn("script_model", (-400, 808, 864));
			FX3.angles = VectorScale((0, 1, 0), 90);
			FX3 SetModel("tag_origin");
			FX3 clientfield::set("fx_runecirclefire", 1);
			var_fb2c4b25 = spawn("script_model", (-316, 904, 864));
			var_fb2c4b25.angles = VectorScale((0, 1, 0), 180);
			var_fb2c4b25 SetModel("tag_origin");
			var_fb2c4b25 clientfield::set("fx_runecirclefire", 1);
			var_d529d0bc = spawn("script_model", (-412, 903.75, 865.5));
			var_d529d0bc.angles = (0, 0, 0);
			var_d529d0bc SetModel("tag_origin");
			var_d529d0bc clientfield::set("fx_runecircleflare", 1);
			wait(1);
			level.var_436987e6 = 1;
			wait(0.1);
			level.var_de24adf1 = 1;
			wait(0.1);
			while(!level.var_3f94d37b)
			{
				wait(2.5);
			}
			e_model delete();
			var_d9ed9412 delete();
			var_fff00e7b delete();
			var_25f288e4 delete();
			var_4bf5034d delete();
			FX clientfield::set("fx_runecirclefire", 0);
			fx2 clientfield::set("fx_runecirclefire", 0);
			FX3 clientfield::set("fx_runecirclefire", 0);
			var_fb2c4b25 clientfield::set("fx_runecirclefire", 0);
			var_d529d0bc clientfield::set("fx_runecircleflare", 0);
			FX delete();
			fx2 delete();
			FX3 delete();
			var_fb2c4b25 delete();
			var_d529d0bc delete();
			break;
			continue;
		}
		wait(0.5);
	}
	if(level.var_436987e6 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_dafa4787
	Namespace: namespace_da78430a
	Checksum: 0xB4502796
	Offset: 0x28350
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 8224
*/
function function_dafa4787()
{
	level.var_d155fad8 = 0;
	level.var_9857fa77 = 0;
	key = GetEnt("rune_prison_fireplace", "targetname");
	key thread function_726b56e();
	var_2a26d2a3 = GetEntArray("key_door_rune_prison_fireplace", "targetname");
	foreach(door in var_2a26d2a3)
	{
		door thread function_6ced74ce();
	}
}

/*
	Name: function_726b56e
	Namespace: namespace_da78430a
	Checksum: 0x69F1FBED
	Offset: 0x28468
	Size: 0x670
	Parameters: 0
	Flags: None
	Line Number: 8247
*/
function function_726b56e()
{
	level endon("intermission");
	while(!level.var_17a62ff1)
	{
		wait(0.25);
	}
	e_model = GetEnt("fireplace", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			break;
		}
	}
	model = GetEnt(self.target, "targetname");
	playsoundatposition("evt_meteor_impact", (535, -284, 21.5));
	FX = spawn("script_model", (535, -284, 21.5));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_fireplace1", 1);
	fx2 = spawn("script_model", (534.25, -272.5, 33.75));
	fx2.angles = VectorScale((0, 1, 0), 90);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_fireplace2", 1);
	FX3 = spawn("script_model", (535.25, -283.5, 33.75));
	FX3.angles = (0, 0, 0);
	FX3 SetModel("tag_origin");
	PlayFXOnTag(level._effect["fireplace3"], FX3, "tag_origin");
	wait(0.5);
	location = struct::get("fireplace_ammo", "targetname");
	level thread zm_powerups::specific_powerup_drop("full_ammo", location.origin);
	level.var_d155fad8 = 1;
	while(!level.var_9857fa77)
	{
		wait(0.25);
	}
	FX clientfield::set("fx_fireplace1", 0);
	fx2 clientfield::set("fx_fireplace2", 0);
	FX delete();
	fx2 delete();
	FX3 delete();
}

/*
	Name: function_6ced74ce
	Namespace: namespace_da78430a
	Checksum: 0x92303F1C
	Offset: 0x28AE0
	Size: 0x310
	Parameters: 0
	Flags: None
	Line Number: 8303
*/
function function_6ced74ce()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_d155fad8)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self setcursorhint("HINT_NOICON");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	self delete();
	level.var_9857fa77 = 1;
	playsoundatposition("castle_fireplace_start", player.origin);
	FX = spawn("script_model", (534.5, -285.25, 21));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_fireplace4", 1);
	wait(1);
	location = struct::get("fireplace_arrow", "targetname");
	model2 = spawn("script_model", location.origin);
	model2.angles = (0, 0, 0);
	model2 SetModel("p7_fxanim_zm_castle_quest_rune_clock_wall_arrow_broken_mod");
	model2 useanimtree(-1);
	model2 AnimScripted("rune_arrow_broken_mod_idle_anim", model2.origin, model2.angles, %rune_arrow_broken_mod_idle_anim);
	PlayFXOnTag(level._effect["runearrowglow"], model2, "arrow_shaft_fx_jnt");
	wait(3.5);
	model2 delete();
	FX clientfield::set("fx_fireplace4", 0);
	FX delete();
}

/*
	Name: function_920e2f9
	Namespace: namespace_da78430a
	Checksum: 0x5BCC113F
	Offset: 0x28DF8
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 8346
*/
function function_920e2f9()
{
	level.var_1a39421e = 0;
	level.var_36836c79 = 0;
	key = GetEnt("rune_prison_orb", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_f12762dc();
	var_4eee407d = GetEntArray("key_door_rune_prison_orb", "targetname");
	foreach(door in var_4eee407d)
	{
		door thread function_bab6d63c();
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f12762dc
	Namespace: namespace_da78430a
	Checksum: 0x4EEC061D
	Offset: 0x28F30
	Size: 0x5D0
	Parameters: 0
	Flags: None
	Line Number: 8372
*/
function function_f12762dc()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_9857fa77)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	FX = spawn("script_model", (-471.25, -100.25, 656.75));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbgrow", 1);
	playsoundatposition("zmb_magma_chunks_form", (-471.25, -100.25, 656.75));
	wait(1.25);
	location = struct::get("rune_prison_orb_struct", "targetname");
	var_e8943b5c = struct::get("rune_prison_arrow3_struct", "targetname");
	model = GetEnt("rune_prison_orb2", "targetname");
	model clientfield::set("fx_orbcrust", 1);
	model moveto(location.origin, 0.2, 0.05, 0.05);
	wait(0.25);
	model playsound("zmb_magma_loop");
	self waittill("trigger", player);
	playsoundatposition("zmb_magma_interact", (-471.25, -100.25, 656.75));
	wait(0.25);
	self delete();
	model useanimtree(-1);
	model AnimScripted("p7_fxanim_zm_castle_quest_rune_orb_fx_idle_anim", model.origin, model.angles, %p7_fxanim_zm_castle_quest_rune_orb_fx_idle_anim);
	model stopsound("zmb_magma_loop");
	wait(2.25);
	fx2 = spawn("script_model", (-471.25, -100.25, 656.75));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbexplode", 1);
	playsoundatposition("zmb_magma_chunks_exp", (-471.25, -100.25, 656.75));
	model clientfield::set("fx_orbcrust", 0);
	wait(0.5);
	model delete();
	var_be607d78 = GetEnt("rune_prison_arrow2", "targetname");
	var_be607d78 moveto(var_e8943b5c.origin, 0.2, 0.05, 0.05);
	wait(0.25);
	var_be607d78 useanimtree(-1);
	var_be607d78 AnimScripted("rune_arrow_whole_mod_idle_anim", var_be607d78.origin, var_be607d78.angles, %rune_arrow_whole_mod_idle_anim);
	PlayFXOnTag(level._effect["runearrowglow"], var_be607d78, "arrow_whole_jnt");
	wait(1);
	level.var_1a39421e = 1;
	while(!level.var_36836c79)
	{
		wait(0.25);
	}
	FX clientfield::set("fx_orbgrow", 0);
	fx2 clientfield::set("fx_orbexplode", 0);
	FX delete();
	fx2 delete();
	var_be607d78 delete();
}

/*
	Name: function_bab6d63c
	Namespace: namespace_da78430a
	Checksum: 0xB57B92D6
	Offset: 0x29508
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 8439
*/
function function_bab6d63c()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_1a39421e)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self setcursorhint("HINT_NOICON");
	self setHintString("Press and Hold ^3&&1^7 to Pick Up Arrow");
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	self delete();
	playsoundatposition("zmb_arrow_reforged", player.origin);
	level.var_36836c79 = 1;
}

/*
	Name: function_ca2c0cf3
	Namespace: namespace_da78430a
	Checksum: 0x8411C363
	Offset: 0x29630
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 8467
*/
function function_ca2c0cf3()
{
	level.var_3984eb84 = 0;
	key = GetEnt("rune_prison_quest_soul", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Place Arrow");
	key thread function_afbf7bf8();
}

/*
	Name: function_afbf7bf8
	Namespace: namespace_da78430a
	Checksum: 0x87994453
	Offset: 0x296D0
	Size: 0x2F0
	Parameters: 0
	Flags: None
	Line Number: 8486
*/
function function_afbf7bf8()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_36836c79)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
	models = GetEntArray(self.target, "targetname");
	playsoundatposition("zmb_bow_upgrade", player.origin);
	FX = spawn("script_model", (-341.5, -2055, -540.5));
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["runearrowglow"], FX, "tag_origin");
	location = struct::get("rune_prison_arrow_model3", "targetname");
	location2 = struct::get("rune_prison_arrow_ammo", "targetname");
	model = spawn("script_model", location.origin);
	model.angles = (340, 350, 0);
	model SetModel("tag_origin4");
	model thread zm_powerups::powerup_wobble();
	wait(0.25);
	level thread zm_powerups::specific_powerup_drop("full_ammo", location2.origin);
	spawn_flag = models[0].script_flag;
	flag::set(spawn_flag);
	wait(0.05);
	self delete();
	wait(0.1);
	level.var_3984eb84 = 1;
	while(!level.var_ea692787)
	{
		wait(0.25);
	}
	model delete();
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1595331a
	Namespace: namespace_da78430a
	Checksum: 0x15F87AE9
	Offset: 0x299C8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 8535
*/
function function_1595331a()
{
	level.var_c8fdaf4d = 0;
	key = GetEnt("storm_quest2_damage", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_e16dc57f();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e16dc57f
	Namespace: namespace_da78430a
	Checksum: 0x54ABED7A
	Offset: 0x29A48
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 8555
*/
function function_e16dc57f()
{
	level endon("intermission");
	while(!level.var_9af2440d)
	{
		wait(0.25);
	}
	e_model = GetEnt("storm2_damage", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow_storm")
		{
			break;
		}
	}
	wait(0.5);
	level.var_c8fdaf4d = 1;
	wait(1.5);
	level notify("hash_2edd00f2");
}

/*
	Name: function_e39e1cb5
	Namespace: namespace_da78430a
	Checksum: 0x29F54F3
	Offset: 0x29C10
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 8588
*/
function function_e39e1cb5()
{
	level.var_83b1ee4 = 0;
	level.var_664c9854 = 0;
	key = GetEnt("storm_quest_brazier1", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_5094fc86();
}

/*
	Name: function_5094fc86
	Namespace: namespace_da78430a
	Checksum: 0x7BD172CE
	Offset: 0x29CB8
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 8608
*/
function function_5094fc86()
{
	level endon("intermission");
	while(!level.var_c8fdaf4d)
	{
		wait(0.25);
	}
	e_model = GetEnt("brazier1", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow_storm")
		{
			break;
		}
	}
	model = GetEnt(self.target, "targetname");
	level.var_83b1ee4 = 1;
}

/*
	Name: function_9a0971e
	Namespace: namespace_da78430a
	Checksum: 0x875BB910
	Offset: 0x29E88
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 8639
*/
function function_9a0971e()
{
	level.var_5a02f5d1 = 0;
	key = GetEnt("storm_quest_brazier2", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_2a92821d();
}

/*
	Name: function_2a92821d
	Namespace: namespace_da78430a
	Checksum: 0xC8499902
	Offset: 0x29F28
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 8658
*/
function function_2a92821d()
{
	level endon("intermission");
	while(!level.var_c8fdaf4d)
	{
		wait(0.25);
	}
	e_model = GetEnt("brazier2", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow_storm")
		{
			break;
		}
	}
	model = GetEnt(self.target, "targetname");
	level.var_5a02f5d1 = 1;
}

/*
	Name: function_2fa31187
	Namespace: namespace_da78430a
	Checksum: 0xEB561078
	Offset: 0x2A0F8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 8689
*/
function function_2fa31187()
{
	level.var_44f7b1e2 = 0;
	key = GetEnt("storm_quest_brazier3", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_49007b4();
}

/*
	Name: function_49007b4
	Namespace: namespace_da78430a
	Checksum: 0x9FA9E923
	Offset: 0x2A198
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 8708
*/
function function_49007b4()
{
	level endon("intermission");
	while(!level.var_c8fdaf4d)
	{
		wait(0.25);
	}
	e_model = GetEnt("brazier3", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow_storm")
		{
			break;
		}
	}
	model = GetEnt(self.target, "targetname");
	level.var_44f7b1e2 = 1;
}

/*
	Name: function_e91dbada
	Namespace: namespace_da78430a
	Checksum: 0xE13602D
	Offset: 0x2A368
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 8739
*/
function function_e91dbada()
{
	level.var_f0159939 = 0;
	level.var_2203eda5 = 0;
	level.var_a0351e1c = 1;
	level.var_c16f116c = 0;
	level.var_7d59de1 = 0;
	key = GetEnt("storm_panel1", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_c4064485();
}

/*
	Name: function_c4064485
	Namespace: namespace_da78430a
	Checksum: 0x7578AB8C
	Offset: 0x2A418
	Size: 0x328
	Parameters: 0
	Flags: None
	Line Number: 8761
*/
function function_c4064485()
{
	level endon("intermission");
	model = GetEnt("storm_panelswitch1", "targetname");
	while(1)
	{
		self waittill("trigger", player);
		level notify("hash_1d82bebe");
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level.var_2203eda5 = 0;
		level.var_a0351e1c = 0;
		level.var_c16f116c = 1;
		level.var_7d59de1 = 0;
		model.angles = (0, 180, 180);
		playsoundatposition("switch_hit", player.origin);
		wait(0.5);
		self waittill("trigger", player);
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level notify("hash_1d82bebe");
		wait(0.05);
		level notify("hash_2edd00f2");
		level.var_2203eda5 = 0;
		level.var_a0351e1c = 0;
		level.var_c16f116c = 0;
		level.var_7d59de1 = 1;
		model.angles = (270, 180, 180);
		playsoundatposition("switch_hit", player.origin);
		wait(0.5);
		self waittill("trigger", player);
		level notify("hash_1d82bebe");
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level.var_2203eda5 = 1;
		level.var_a0351e1c = 0;
		level.var_c16f116c = 0;
		level.var_7d59de1 = 0;
		model.angles = (0, 0, 0);
		playsoundatposition("switch_hit", player.origin);
		wait(0.5);
		self waittill("trigger", player);
		level notify("hash_1d82bebe");
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level.var_2203eda5 = 0;
		level.var_a0351e1c = 1;
		level.var_c16f116c = 0;
		level.var_7d59de1 = 0;
		model.angles = (90, 35, 35);
		playsoundatposition("switch_hit", player.origin);
		wait(0.5);
	}
	if(level.var_f0159939 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_c31b4071
	Namespace: namespace_da78430a
	Checksum: 0xAE619A5
	Offset: 0x2A748
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 8839
*/
function function_c31b4071()
{
	level.var_3182a62e = 0;
	level.var_fe8de645 = 1;
	level.var_c3454d67 = 0;
	level.var_23e2ec22 = 0;
	key = GetEnt("storm_panel2", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_ea08beee();
}

/*
	Name: function_ea08beee
	Namespace: namespace_da78430a
	Checksum: 0xC9CC734F
	Offset: 0x2A7E8
	Size: 0x338
	Parameters: 0
	Flags: None
	Line Number: 8860
*/
function function_ea08beee()
{
	level endon("intermission");
	model = GetEnt("storm_panelswitch2", "targetname");
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level notify("hash_850717d1");
		wait(0.05);
		level notify("hash_2edd00f2");
		level.var_3182a62e = 0;
		level.var_fe8de645 = 0;
		level.var_c3454d67 = 1;
		level.var_23e2ec22 = 0;
		model.angles = (0, 90, 180);
		playsoundatposition("switch_hit", player.origin);
		wait(0.5);
		self waittill("trigger", player);
		level notify("hash_850717d1");
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level.var_3182a62e = 0;
		level.var_fe8de645 = 0;
		level.var_c3454d67 = 0;
		level.var_23e2ec22 = 1;
		model.angles = (270, 180, 90);
		playsoundatposition("switch_hit", player.origin);
		wait(0.5);
		self waittill("trigger", player);
		level notify("hash_850717d1");
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level.var_3182a62e = 1;
		level.var_fe8de645 = 0;
		level.var_c3454d67 = 0;
		level.var_23e2ec22 = 0;
		model.angles = VectorScale((0, 1, 0), 270);
		playsoundatposition("switch_hit", player.origin);
		wait(0.5);
		self waittill("trigger", player);
		level notify("hash_850717d1");
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level.var_3182a62e = 0;
		level.var_fe8de645 = 1;
		level.var_c3454d67 = 0;
		level.var_23e2ec22 = 0;
		model.angles = VectorScale((1, 0, 1), 90);
		playsoundatposition("switch_hit", player.origin);
		wait(0.5);
	}
	if(level.var_f0159939 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_9d18c608
	Namespace: namespace_da78430a
	Checksum: 0xE93E72C0
	Offset: 0x2AB28
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 8938
*/
function function_9d18c608()
{
	level.var_d790dec7 = 0;
	level.var_4122a892 = 1;
	level.var_9acef09a = 0;
	level.var_cb9890bf = 0;
	key = GetEnt("storm_panel3", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_100b3957();
}

/*
	Name: function_100b3957
	Namespace: namespace_da78430a
	Checksum: 0x247B6BAE
	Offset: 0x2ABC8
	Size: 0x330
	Parameters: 0
	Flags: None
	Line Number: 8959
*/
function function_100b3957()
{
	level endon("intermission");
	model = GetEnt("storm_panelswitch3", "targetname");
	while(1)
	{
		self waittill("trigger", player);
		level notify("hash_efc4c4b8");
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level.var_d790dec7 = 0;
		level.var_4122a892 = 0;
		level.var_9acef09a = 1;
		level.var_cb9890bf = 0;
		model.angles = (0, 180, 180);
		playsoundatposition("switch_hit", player.origin);
		wait(0.5);
		self waittill("trigger", player);
		level notify("hash_efc4c4b8");
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level.var_d790dec7 = 0;
		level.var_4122a892 = 0;
		level.var_9acef09a = 0;
		level.var_cb9890bf = 1;
		model.angles = (270, 210, 150);
		playsoundatposition("switch_hit", player.origin);
		wait(0.5);
		self waittill("trigger", player);
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level notify("hash_efc4c4b8");
		wait(0.05);
		level notify("hash_2edd00f2");
		level.var_d790dec7 = 1;
		level.var_4122a892 = 0;
		level.var_9acef09a = 0;
		level.var_cb9890bf = 0;
		model.angles = (0, 0, 0);
		playsoundatposition("switch_hit", player.origin);
		wait(0.5);
		self waittill("trigger", player);
		level notify("hash_efc4c4b8");
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level.var_d790dec7 = 0;
		level.var_4122a892 = 1;
		level.var_9acef09a = 0;
		level.var_cb9890bf = 0;
		model.angles = (90, 35, 35);
		playsoundatposition("switch_hit", player.origin);
		wait(0.5);
	}
	if(level.var_f0159939 == 1)
	{
		continue;
		continue;
	}
}

/*
	Name: function_c987eba6
	Namespace: namespace_da78430a
	Checksum: 0x25C90783
	Offset: 0x2AF00
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 9037
*/
function function_c987eba6()
{
	thread function_1decccf7();
	thread function_414d1fba();
	thread function_1b4aa551();
	thread function_f5482ae8();
}

/*
	Name: function_1decccf7
	Namespace: namespace_da78430a
	Checksum: 0x820E0A25
	Offset: 0x2AF50
	Size: 0x4E0
	Parameters: 0
	Flags: None
	Line Number: 9055
*/
function function_1decccf7()
{
	level endon("intermission");
	while(1)
	{
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level waittill("hash_2edd00f2");
		if(level.var_7d59de1 == 1)
		{
			if(level.var_c3454d67 == 1)
			{
				if(level.var_d790dec7 == 1)
				{
					if(level.var_c8fdaf4d == 1)
					{
						level.var_f0159939 = 1;
						wait(0.05);
						level notify("hash_1d82bebe");
						level notify("hash_850717d1");
						level notify("hash_efc4c4b8");
						wait(0.25);
						playsoundatposition("pyramid_open", (-96.5, -2531.5, 37.25));
						playsoundatposition("pyramid_open", (-376.5, -3235, 2.75));
						playsoundatposition("pyramid_open", (421.5, -3611, 240.75));
						playsoundatposition("pyramid_open", (-705.25, 568.5, 539));
						FX = spawn("script_model", (419.75, -3610.75, 240.5));
						FX SetModel("tag_origin");
						FX.angles = VectorScale((0, 1, 0), 180);
						PlayFXOnTag(level._effect["panelspark"], FX, "tag_origin");
						fx2 = spawn("script_model", (-376.75, -3236, 2.5));
						fx2 SetModel("tag_origin");
						fx2.angles = VectorScale((0, 1, 0), 270);
						PlayFXOnTag(level._effect["panelspark"], fx2, "tag_origin");
						FX3 = spawn("script_model", (-96.75, -2531.5, 37.25));
						FX3 SetModel("tag_origin");
						FX3.angles = VectorScale((0, 1, 0), 270);
						PlayFXOnTag(level._effect["panelspark"], FX3, "tag_origin");
						while(!level.var_942eb417)
						{
							wait(0.25);
						}
						FX delete();
						fx2 delete();
						FX3 delete();
						break;
					}
				}
			}
		}
	}
	continue;
	level.var_f0159939 = 1;
	playsoundatposition("pyramid_open", (-96.5, -2531.5, 37.25));
	playsoundatposition("pyramid_open", (-376.5, -3235, 2.75));
	playsoundatposition("pyramid_open", (421.5, -3611, 240.75));
	while(!level.var_942eb417)
	{
		wait(0.25);
	}
	FX delete();
	fx2 delete();
	FX3 delete();
}

/*
	Name: function_414d1fba
	Namespace: namespace_da78430a
	Checksum: 0x667C2532
	Offset: 0x2B438
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 9132
*/
function function_414d1fba()
{
	level endon("intermission");
	while(!level.var_c8fdaf4d)
	{
		wait(0.25);
	}
	while(1)
	{
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level waittill("hash_2edd00f2");
		if(level.var_7d59de1 == 1)
		{
			fx2 = spawn("script_model", (-376.75, -3236, 2.5));
			fx2 SetModel("tag_origin");
			fx2.angles = VectorScale((0, 1, 0), 270);
			PlayFXOnTag(level._effect["panelspark"], fx2, "tag_origin");
		}
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level waittill("hash_1d82bebe");
		fx2 delete();
	}
	fx2 delete();
	continue;
}

/*
	Name: function_1b4aa551
	Namespace: namespace_da78430a
	Checksum: 0xCFD03EE9
	Offset: 0x2B598
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 9174
*/
function function_1b4aa551()
{
	level endon("intermission");
	while(!level.var_c8fdaf4d)
	{
		wait(0.25);
	}
	while(1)
	{
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level waittill("hash_2edd00f2");
		if(level.var_c3454d67 == 1)
		{
			FX = spawn("script_model", (419.75, -3610.75, 240.5));
			FX SetModel("tag_origin");
			FX.angles = VectorScale((0, 1, 0), 180);
			PlayFXOnTag(level._effect["panelspark"], FX, "tag_origin");
		}
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level waittill("hash_850717d1");
		FX delete();
	}
	FX delete();
	continue;
}

/*
	Name: function_f5482ae8
	Namespace: namespace_da78430a
	Checksum: 0x643CA2DF
	Offset: 0x2B700
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 9216
*/
function function_f5482ae8()
{
	level endon("intermission");
	while(!level.var_c8fdaf4d)
	{
		wait(0.25);
	}
	while(1)
	{
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level waittill("hash_2edd00f2");
		if(level.var_d790dec7 == 1)
		{
			FX3 = spawn("script_model", (-96.75, -2531.5, 37.25));
			FX3 SetModel("tag_origin");
			FX3.angles = VectorScale((0, 1, 0), 270);
			PlayFXOnTag(level._effect["panelspark"], FX3, "tag_origin");
		}
		if(level.var_f0159939 == 1)
		{
			break;
		}
		level waittill("hash_efc4c4b8");
		FX3 delete();
	}
	FX3 delete();
	continue;
}

/*
	Name: function_58f7d090
	Namespace: namespace_da78430a
	Checksum: 0x819D4E3
	Offset: 0x2B868
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 9258
*/
function function_58f7d090()
{
	level.var_942eb417 = 0;
	level.var_827912e0 = 0;
	key = GetEnt("storm_quest2_complete", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Orb Essence");
	key thread function_b375774f();
	var_5fa3dbb3 = GetEntArray("key_door_storm2_quest_complete", "targetname");
	foreach(door in var_5fa3dbb3)
	{
		door thread function_a379d6d6();
	}
}

/*
	Name: function_b375774f
	Namespace: namespace_da78430a
	Checksum: 0x373D973A
	Offset: 0x2B9C0
	Size: 0x328
	Parameters: 0
	Flags: None
	Line Number: 9283
*/
function function_b375774f()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_f0159939)
	{
		wait(0.25);
	}
	while(!level.var_83b1ee4)
	{
		wait(0.1);
	}
	while(!level.var_5a02f5d1)
	{
		wait(0.1);
	}
	while(!level.var_44f7b1e2)
	{
		wait(0.1);
	}
	foreach(player in level.players)
	{
		playsoundatposition("trial_complete", player.origin);
	}
	self TriggerEnable(1);
	model = GetEnt("storm_crystal", "targetname");
	model moveto((281.75, 1730, 7.25), 0.2, 0.05, 0.05);
	model.angles = VectorScale((1, 1, 1), 90);
	PlayFXOnTag(level._effect["stormaura"], model, "tag_origin");
	self waittill("trigger", player);
	self delete();
	model delete();
	playsoundatposition("crystal_00", (281.25, 1730.5, 0.25));
	FX = spawn("script_model", (281.25, 1730.5, 0.25));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbblue", 1);
	level.var_942eb417 = 1;
	wait(5);
	FX clientfield::set("fx_orbblue", 0);
	FX delete();
}

/*
	Name: function_a379d6d6
	Namespace: namespace_da78430a
	Checksum: 0x294F3AAE
	Offset: 0x2BCF0
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 9335
*/
function function_a379d6d6()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_942eb417)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self setcursorhint("HINT_NOICON");
	self setHintString("Press and Hold ^3&&1^7 to Infuse Orb");
	self waittill("trigger", player);
	self delete();
	FX = spawn("script_model", (-546, 894, 550));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbblue", 1);
	playsoundatposition("challenge_complete_all", player.origin);
	wait(1);
	level.var_827912e0 = 1;
	wait(5);
	FX clientfield::set("fx_orbblue", 0);
	FX delete();
}

/*
	Name: function_dd5c9e7c
	Namespace: namespace_da78430a
	Checksum: 0xBBA30F23
	Offset: 0x2BEA8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 9369
*/
function function_dd5c9e7c()
{
	level.var_7cb96a63 = 0;
	key = GetEnt("wolf_howl_quest2_damage", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_cfda1cc5();
}

/*
	Name: function_cfda1cc5
	Namespace: namespace_da78430a
	Checksum: 0x886494AB
	Offset: 0x2BF28
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 9387
*/
function function_cfda1cc5()
{
	level endon("intermission");
	while(!level.var_7f6824f7)
	{
		wait(0.25);
	}
	e_model = GetEnt("wolf_howl2_damage", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_wolf_howl")
		{
			break;
		}
	}
	wait(0.5);
	level.var_7cb96a63 = 1;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_53907987
	Namespace: namespace_da78430a
	Checksum: 0xF8050023
	Offset: 0x2C0D8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 9420
*/
function function_53907987()
{
	level.var_12fd223a = 0;
	level.var_b21dffbd = 0;
	key = GetEnt("wolf_howl2_quest_grave1", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_114138c8();
}

/*
	Name: function_114138c8
	Namespace: namespace_da78430a
	Checksum: 0xEAD26441
	Offset: 0x2C160
	Size: 0x728
	Parameters: 0
	Flags: None
	Line Number: 9439
*/
function function_114138c8()
{
	level endon("intermission");
	while(!level.var_7cb96a63)
	{
		wait(0.25);
	}
	location = struct::get("wolf_howl2_grave1_logo", "targetname");
	var_7c6ce185 = GetEnt("wolf_logo1", "targetname");
	var_7c6ce185 moveto(location.origin, 0.2, 0.05, 0.05);
	var_7c6ce185.angles = (0.251999, 89.8941, 23.8669);
	e_model = GetEnt("grave1", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_wolf_howl")
		{
			break;
		}
	}
	model3 = GetEnt("wolf_howl2_quest_grave1_wolf", "targetname");
	model3 moveto((-1222.61, -3891.12, 265.25), 0.2, 0.05, 0.05);
	model3.angles = VectorScale((0, 1, 0), 90);
	model3 setcandamage(1);
	model3 clientfield::set("fx_wolfinkbody", 1);
	model2 = GetEnt("wolf_howl2_quest_grave1", "targetname");
	wait(0.25);
	model2 delete();
	while(1)
	{
		model3 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			continue;
			break;
		}
	}
	playsoundatposition("rock_01", (-1224, -3891, 267.5));
	FX = spawn("script_model", (-1221.75, -3890.75, 265.25));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbgreen", 1);
	model3 clientfield::set("fx_wolfinkbody", 0);
	model3 delete();
	var_7c6ce185 delete();
	level.var_12fd223a = 1;
	wait(5);
	FX clientfield::set("fx_orbgreen", 0);
	FX delete();
}

/*
	Name: function_e1890a4c
	Namespace: namespace_da78430a
	Checksum: 0xB3D13A8D
	Offset: 0x2C890
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 9500
*/
function function_e1890a4c()
{
	level.var_3791bfab = 0;
	level.var_654751fc = 0;
	key = GetEnt("wolf_howl2_quest_grave2", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_8348a803();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8348a803
	Namespace: namespace_da78430a
	Checksum: 0x329F51E3
	Offset: 0x2C918
	Size: 0x730
	Parameters: 0
	Flags: None
	Line Number: 9521
*/
function function_8348a803()
{
	level endon("intermission");
	while(!level.var_7cb96a63)
	{
		wait(0.25);
	}
	location = struct::get("wolf_howl2_grave2_logo", "targetname");
	var_7c6ce185 = GetEnt("wolf_logo2", "targetname");
	var_7c6ce185 moveto(location.origin, 0.2, 0.05, 0.05);
	var_7c6ce185.angles = (0.251827, 270.392, 23.8668);
	e_model = GetEnt("grave2", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_wolf_howl")
		{
			break;
		}
	}
	model3 = GetEnt("wolf_howl2_quest_grave2_wolf", "targetname");
	model3 moveto((491.11, -4257.13, 221.25), 0.2, 0.05, 0.05);
	model3.angles = VectorScale((0, 1, 0), 270);
	model3 setcandamage(1);
	model3 clientfield::set("fx_wolfinkbody", 1);
	model2 = GetEnt("wolf_howl2_quest_grave2", "targetname");
	wait(0.25);
	model2 delete();
	while(1)
	{
		model3 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			continue;
			break;
		}
	}
	playsoundatposition("rock_01", (489.25, -4257.5, 226.5));
	FX = spawn("script_model", (489.25, -4257.5, 226.5));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbgreen", 1);
	model3 clientfield::set("fx_wolfinkbody", 0);
	model3 delete();
	var_7c6ce185 delete();
	level.var_3791bfab = 1;
	wait(5);
	FX clientfield::set("fx_orbgreen", 0);
	FX delete();
	return;
}

/*
	Name: function_78b84b5
	Namespace: namespace_da78430a
	Checksum: 0xF1D8F70F
	Offset: 0x2D050
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 9583
*/
function function_78b84b5()
{
	level.var_15d41b9c = 0;
	level.var_b7dc54e3 = 0;
	key = GetEnt("wolf_howl2_quest_grave3", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_5d462d9a();
}

/*
	Name: function_5d462d9a
	Namespace: namespace_da78430a
	Checksum: 0xB66583BB
	Offset: 0x2D0D8
	Size: 0x730
	Parameters: 0
	Flags: None
	Line Number: 9602
*/
function function_5d462d9a()
{
	level endon("intermission");
	while(!level.var_7cb96a63)
	{
		wait(0.25);
	}
	location = struct::get("wolf_howl2_grave3_logo", "targetname");
	var_7c6ce185 = GetEnt("wolf_logo3", "targetname");
	var_7c6ce185 moveto(location.origin, 0.2, 0.05, 0.05);
	var_7c6ce185.angles = (0.251827, 270.392, 23.8668);
	e_model = GetEnt("grave3", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_wolf_howl")
		{
			break;
		}
	}
	model3 = GetEnt("wolf_howl2_quest_grave3_wolf", "targetname");
	model3 moveto((1328.86, -3272.88, 98.75), 0.2, 0.05, 0.05);
	model3.angles = VectorScale((0, 1, 0), 270);
	model3 setcandamage(1);
	model3 clientfield::set("fx_wolfinkbody", 1);
	model2 = GetEnt("wolf_howl2_quest_grave3", "targetname");
	wait(0.25);
	model2 delete();
	while(1)
	{
		model3 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_wolf_howl" || weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_demongate" || weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_rune_prison" || weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow_storm" || weapon.name == "elemental_bow4" || weapon.name == "elemental_bow" || weapon.name == "elemental_bow2" || weapon.name == "elemental_bow3")
		{
			continue;
			break;
		}
	}
	playsoundatposition("rock_01", (1327, -3272.25, 100.75));
	FX = spawn("script_model", (1327, -3272.25, 100.75));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbgreen", 1);
	model3 clientfield::set("fx_wolfinkbody", 0);
	model3 delete();
	var_7c6ce185 delete();
	level.var_15d41b9c = 1;
	wait(5);
	FX clientfield::set("fx_orbgreen", 0);
	FX delete();
	return;
	level.var_15d41b9c++;
}

/*
	Name: function_8a09222f
	Namespace: namespace_da78430a
	Checksum: 0x90C88F19
	Offset: 0x2D810
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 9665
*/
function function_8a09222f()
{
	level.var_d62b8b9d = 0;
	level.var_e433d44c = 0;
	key = GetEnt("wolf_howl2_place", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_fc58062a();
	var_604b5525 = GetEntArray("key_door_wolf_howl2_quest_place", "targetname");
	foreach(door in var_604b5525)
	{
		door thread function_a7a7824a();
	}
}

/*
	Name: function_fc58062a
	Namespace: namespace_da78430a
	Checksum: 0x801330C3
	Offset: 0x2D948
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 9689
*/
function function_fc58062a()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_7cb96a63)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	location = struct::get("wolffx_struct", "targetname");
	FX = spawn("script_model", location.origin);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_wolfinkbody", 1);
	self waittill("trigger", player);
	self delete();
	level.var_d62b8b9d = 1;
	wait(0.1);
	level thread LUI::screen_flash(0.05, 0.5, 0.05, 0.8, "white");
	wait(0.1);
	FX clientfield::set("fx_wolfinkbody", 0);
	FX delete();
	wait(1);
	playsoundatposition("wolf_entry", player.origin);
	return;
}

/*
	Name: function_a7a7824a
	Namespace: namespace_da78430a
	Checksum: 0x1D9CD4F0
	Offset: 0x2DB30
	Size: 0x1C58
	Parameters: 0
	Flags: None
	Line Number: 9725
*/
function function_a7a7824a()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_d62b8b9d)
	{
		wait(0.25);
	}
	location = struct::get("wolf_start_struct", "targetname");
	location1 = struct::get("wolf_1_struct", "targetname");
	location2 = struct::get("wolf_2_struct", "targetname");
	location3 = struct::get("wolf_3_struct", "targetname");
	var_e8943b5c = struct::get("wolf_4_struct", "targetname");
	var_e96b5c5 = struct::get("wolf_5_struct", "targetname");
	var_3499302e = struct::get("wolf_6_struct", "targetname");
	var_5a9baa97 = struct::get("wolf_7_struct", "targetname");
	var_20767e70 = struct::get("wolf_8_struct", "targetname");
	var_4678f8d9 = struct::get("wolf_9_struct", "targetname");
	var_a02e6443 = struct::get("wolf_10_struct", "targetname");
	var_7a2be9da = struct::get("wolf_11_struct", "targetname");
	var_54296f71 = struct::get("wolf_12_struct", "targetname");
	var_2e26f508 = struct::get("wolf_13_struct", "targetname");
	var_38384de7 = struct::get("wolf_14_struct", "targetname");
	var_1235d37e = struct::get("wolf_15_struct", "targetname");
	var_ec335915 = struct::get("wolf_16_struct", "targetname");
	var_c630deac = struct::get("wolf_17_struct", "targetname");
	var_701a90fb = struct::get("wolf_18_struct", "targetname");
	var_4a181692 = struct::get("wolf_19_struct", "targetname");
	var_2002feee = struct::get("wolf_20_struct", "targetname");
	var_46057957 = struct::get("wolf_21_struct", "targetname");
	var_d3fe0a1c = struct::get("wolf_22_struct", "targetname");
	var_fa008485 = struct::get("wolf_23_struct", "targetname");
	var_87f9154a = struct::get("wolf_24_struct", "targetname");
	var_adfb8fb3 = struct::get("wolf_25_struct", "targetname");
	var_3bf42078 = struct::get("wolf_26_struct", "targetname");
	var_61f69ae1 = struct::get("wolf_27_struct", "targetname");
	var_efef2ba6 = struct::get("wolf_28_struct", "targetname");
	var_15f1a60f = struct::get("wolf_29_struct", "targetname");
	var_de4b17f9 = struct::get("wolf_30_struct", "targetname");
	var_b8489d90 = struct::get("wolf_31_struct", "targetname");
	var_2a500ccb = struct::get("wolf_32_struct", "targetname");
	var_44d9262 = struct::get("wolf_33_struct", "targetname");
	var_7655019d = struct::get("wolf_34_struct", "targetname");
	var_50528734 = struct::get("wolf_35_struct", "targetname");
	model2 = spawn("script_model", location.origin);
	model2 SetModel("tag_origin");
	model = GetEnt("wolf_ghost", "targetname");
	model moveto(location.origin, 0.2, 0.05, 0.05);
	model clientfield::set("fx_wolfinkbody", 1);
	PlayFXOnTag(level._effect["keepertrail"], model, "spine2_jnt");
	wait(0.25);
	model EnableLinkTo();
	model LinkTo(model2);
	wait(0.1);
	model useanimtree(-1);
	model AnimScripted("ai_zm_dlc1_wolf_entry", model.origin, model.angles, %ai_zm_dlc1_wolf_entry);
	model2 moveto(location1.origin, 1, 0.01, 0.01);
	wait(1);
	model StopAnimScripted();
	wait(0.1);
	model useanimtree(-1);
	model AnimScripted("ai_direwolf_base_trot", model.origin, model.angles, %ai_direwolf_base_trot);
	model2 moveto(location2.origin, 0.64, 0.01, 0.01);
	model2 RotateYaw(22.5, 0.32, 0.01, 0.01);
	wait(0.64);
	model2 moveto(location3.origin, 0.62, 0.01, 0.01);
	model2 RotateYaw(22.5, 0.31, 0.01, 0.01);
	wait(0.62);
	model2 moveto(var_e8943b5c.origin, 0.5, 0.01, 0.01);
	model2 RotateYaw(-45, 0.25, 0.01, 0.01);
	wait(0.5);
	model2 moveto(var_e96b5c5.origin, 2.75, 0.01, 0.01);
	wait(2.75);
	model2 moveto(var_3499302e.origin, 0.56, 0.01, 0.01);
	model2 RotateYaw(-25, 0.28, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_5a9baa97.origin, 0.56, 0.01, 0.01);
	model2 RotateYaw(-50, 0.28, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_20767e70.origin, 1.27, 0.01, 0.01);
	model2 RotateYaw(-15, 0.3, 0.01, 0.01);
	wait(1.27);
	model2 moveto(var_4678f8d9.origin, 0.66, 0.01, 0.01);
	model2 RotateYaw(-45, 0.33, 0.01, 0.01);
	wait(0.66);
	model2 moveto(var_a02e6443.origin, 0.5, 0.01, 0.01);
	model2 RotateYaw(-45, 0.25, 0.01, 0.01);
	wait(0.5);
	model2 moveto(var_7a2be9da.origin, 0.5, 0.01, 0.01);
	wait(0.5);
	model2 moveto(var_54296f71.origin, 0.5, 0.01, 0.01);
	wait(0.5);
	model2 moveto(var_2e26f508.origin, 0.75, 0.01, 0.01);
	wait(0.75);
	model2 moveto(var_38384de7.origin, 1.75, 0.01, 0.01);
	model2 RotateYaw(-10, 0.3, 0.01, 0.01);
	wait(1.75);
	model2 moveto(var_1235d37e.origin, 0.57, 0.01, 0.01);
	model2 RotateYaw(32.5, 0.28, 0.01, 0.01);
	wait(0.57);
	model2 moveto(var_ec335915.origin, 0.69, 0.01, 0.01);
	model2 RotateYaw(22.5, 0.34, 0.01, 0.01);
	wait(0.69);
	model2 moveto(var_c630deac.origin, 0.73, 0.01, 0.01);
	wait(0.73);
	model2 moveto(var_701a90fb.origin, 0.56, 0.01, 0.01);
	model2 RotateYaw(-22.5, 0.28, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_4a181692.origin, 0.5, 0.01, 0.01);
	model2 RotateYaw(-22.5, 0.25, 0.01, 0.01);
	wait(0.5);
	model2 moveto(var_2002feee.origin, 4, 0.01, 0.01);
	wait(4);
	model2 moveto(var_46057957.origin, 0.64, 0.01, 0.01);
	model2 RotateYaw(22.5, 0.32, 0.01, 0.01);
	wait(0.64);
	model2 moveto(var_d3fe0a1c.origin, 0.71, 0.01, 0.01);
	model2 RotateYaw(22.5, 0.35, 0.01, 0.01);
	wait(0.71);
	model2 moveto(var_fa008485.origin, 0.64, 0.01, 0.01);
	model2 RotateYaw(12.5, 0.32, 0.01, 0.01);
	wait(0.64);
	model2 moveto(var_87f9154a.origin, 0.52, 0.01, 0.01);
	model2 RotateYaw(-45.5, 0.26, 0.01, 0.01);
	wait(0.52);
	model2 moveto(var_adfb8fb3.origin, 0.76, 0.01, 0.01);
	model2 RotateYaw(-12.5, 0.3, 0.01, 0.01);
	wait(0.76);
	model2 moveto(var_3bf42078.origin, 1.25, 0.01, 0.01);
	wait(1.25);
	model2 moveto(var_61f69ae1.origin, 0.71, 0.01, 0.01);
	model2 RotateYaw(45, 0.3, 0.01, 0.01);
	wait(0.71);
	model2 moveto(var_efef2ba6.origin, 0.56, 0.01, 0.01);
	model2 RotateYaw(45, 0.28, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_15f1a60f.origin, 1.44, 0.01, 0.01);
	wait(1.44);
	model2 moveto(var_de4b17f9.origin, 0.53, 0.01, 0.01);
	model2 RotateYaw(45, 0.26, 0.01, 0.01);
	wait(0.53);
	model2 moveto(var_b8489d90.origin, 0.63, 0.01, 0.01);
	model2 RotateYaw(45, 0.3, 0.01, 0.01);
	wait(0.63);
	model2 moveto(var_2a500ccb.origin, 0.97, 0.01, 0.01);
	wait(0.97);
	model2 moveto(var_44d9262.origin, 0.6, 0.01, 0.01);
	model2 RotateYaw(45, 0.3, 0.01, 0.01);
	wait(0.6);
	model2 moveto(var_7655019d.origin, 0.56, 0.01, 0.01);
	model2 RotateYaw(45, 0.3, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_50528734.origin, 0.88, 0.01, 0.01);
	wait(0.88);
	model StopAnimScripted();
	model useanimtree(-1);
	model AnimScripted("ai_zm_dlc1_wolf_digging", model.origin, model.angles, %ai_zm_dlc1_wolf_digging);
	wait(5);
	model StopAnimScripted();
	model useanimtree(-1);
	model AnimScripted("ai_zm_dlc1_wolf_pawing_ground", model.origin, model.angles, %ai_zm_dlc1_wolf_pawing_ground);
	wait(0.5);
	model PlaySoundOnTag("wolf_dig", "tag_origin");
	self TriggerEnable(1);
	self setcursorhint("HINT_NOICON");
	self waittill("trigger", player);
	self delete();
	model stopsound("wolf_dig");
	playsoundatposition("dig_00", player.origin);
	FX = spawn("script_model", (483.25, -484.25, 23));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["dig"], FX, "tag_origin");
	model3 = GetEnt("wolf_dig_spot1", "targetname");
	var_be607d78 = GetEnt("wolf_dig_spot2", "targetname");
	var_e462f7e1 = GetEnt("wolf_dig_spot3", "targetname");
	wait(0.2);
	model3 delete();
	var_be607d78 delete();
	var_e462f7e1 delete();
	var_a65724a = GetEnt("wolf_bone", "targetname");
	model StopAnimScripted();
	model useanimtree(-1);
	model AnimScripted("ai_zm_dlc1_wolf_howl", model.origin, model.angles, %ai_zm_dlc1_wolf_howl);
	wait(0.2);
	playsoundatposition("wolf_howl", player.origin);
	wait(3);
	fx2 = spawn("script_model", (486, -489.5, 16.25));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbgreen", 1);
	model StopAnimScripted();
	model clientfield::set("fx_wolfinkbody", 0);
	model delete();
	var_a65724a delete();
	playsoundatposition("circle_rune_hit", player.origin);
	wait(1.5);
	fx2 clientfield::set("fx_orbgreen", 0);
	FX delete();
	fx2 delete();
	level.var_e433d44c = 1;
}

/*
	Name: function_7caae36a
	Namespace: namespace_da78430a
	Checksum: 0xE6668823
	Offset: 0x2F790
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 9938
*/
function function_7caae36a()
{
	level.var_e1f65b85 = 0;
	level.var_4738d26a = 0;
	key = GetEnt("wolf_howl_quest2_complete", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Orb Essence");
	key thread function_16625bd();
	var_7735b7f9 = GetEntArray("key_door_wolf_howl2_quest_complete", "targetname");
	foreach(door in var_7735b7f9)
	{
		door thread function_27afd7a4();
	}
}

/*
	Name: function_16625bd
	Namespace: namespace_da78430a
	Checksum: 0x797F9396
	Offset: 0x2F8E8
	Size: 0x330
	Parameters: 0
	Flags: None
	Line Number: 9963
*/
function function_16625bd()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_e433d44c)
	{
		wait(0.1);
	}
	while(!level.var_12fd223a)
	{
		wait(0.1);
	}
	while(!level.var_3791bfab)
	{
		wait(0.1);
	}
	while(!level.var_15d41b9c)
	{
		wait(0.1);
	}
	foreach(player in level.players)
	{
		playsoundatposition("trial_complete", player.origin);
	}
	self TriggerEnable(1);
	model = GetEnt("wolf_howl_crystal", "targetname");
	model moveto((210.75, -3631.75, 241.5), 0.2, 0.05, 0.05);
	model.angles = VectorScale((1, 1, 1), 90);
	PlayFXOnTag(level._effect["wolfaura"], model, "tag_origin");
	self waittill("trigger", player);
	self delete();
	model delete();
	playsoundatposition("crystal_00", (210.75, -3631.75, 242.25));
	FX = spawn("script_model", (210.75, -3631.75, 242.25));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbgreen", 1);
	level.var_e1f65b85 = 1;
	wait(5);
	FX clientfield::set("fx_orbgreen", 0);
	FX delete();
}

/*
	Name: function_27afd7a4
	Namespace: namespace_da78430a
	Checksum: 0xA0A93C0
	Offset: 0x2FC20
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 10015
*/
function function_27afd7a4()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_e1f65b85)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self setcursorhint("HINT_NOICON");
	self setHintString("Press and Hold ^3&&1^7 to Infuse Orb");
	self waittill("trigger", player);
	self delete();
	FX = spawn("script_model", (-558, 558, 550));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbgreen", 1);
	playsoundatposition("challenge_complete_all", player.origin);
	wait(1);
	level.var_4738d26a = 1;
	wait(5);
	FX clientfield::set("fx_orbgreen", 0);
	FX delete();
}

/*
	Name: function_80ebda53
	Namespace: namespace_da78430a
	Checksum: 0xF6F55522
	Offset: 0x2FDD8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 10049
*/
function function_80ebda53()
{
	level.var_f05836f6 = 0;
	key = GetEnt("demongate_quest2_damage", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_dc610d82();
}

/*
	Name: function_dc610d82
	Namespace: namespace_da78430a
	Checksum: 0xCA1EA4CF
	Offset: 0x2FE58
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 10067
*/
function function_dc610d82()
{
	level endon("intermission");
	while(!level.var_32a0bc0c)
	{
		wait(0.25);
	}
	e_model = GetEnt("demongate2_damage", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_demongate")
		{
			break;
		}
	}
	wait(0.5);
	level.var_f05836f6 = 1;
}

/*
	Name: function_ca050772
	Namespace: namespace_da78430a
	Checksum: 0x492EDB0E
	Offset: 0x30008
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 10098
*/
function function_ca050772()
{
	level.var_b95873b5 = 0;
	level.var_8aabbc0f = 0;
	key = GetEnt("demongate_quest_brazier1", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_654f13fd();
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_654f13fd
	Namespace: namespace_da78430a
	Checksum: 0xDA9BBCC0
	Offset: 0x300B0
	Size: 0x3A0
	Parameters: 0
	Flags: None
	Line Number: 10121
*/
function function_654f13fd()
{
	level endon("intermission");
	while(!level.var_f05836f6)
	{
		wait(0.25);
	}
	FX = spawn("script_model", (-1054.25, -3685.25, 270));
	FX SetModel("tag_origin");
	FX.angles = VectorScale((0, 1, 0), 270);
	FX clientfield::set("fx_demonsmoke", 1);
	fx2 = spawn("script_model", (-1054.25, -3685.25, 270));
	fx2 SetModel("tag_origin");
	fx2.angles = (0, 0, 0);
	PlayFXOnTag(level._effect["demonaura"], fx2, "tag_origin");
	e_model = GetEnt("demongate_brazier1", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_demongate")
		{
			break;
		}
	}
	model = GetEnt(self.target, "targetname");
	playsoundatposition("circle_rune_hit", (-1054.25, -3685.25, 270));
	FX.angles = VectorScale((0, 1, 0), 90);
	fx2 delete();
	level.var_b95873b5 = 1;
	while(!level.var_a05c9966)
	{
		wait(0.25);
	}
	FX clientfield::set("fx_demonsmoke", 0);
	FX delete();
}

/*
	Name: function_a4028d09
	Namespace: namespace_da78430a
	Checksum: 0x9825D12E
	Offset: 0x30458
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 10169
*/
function function_a4028d09()
{
	level.var_ec14a368 = 0;
	key = GetEnt("demongate_quest_brazier2", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_8b518e66();
}

/*
	Name: function_8b518e66
	Namespace: namespace_da78430a
	Checksum: 0xC2FC3D41
	Offset: 0x304F8
	Size: 0x3B0
	Parameters: 0
	Flags: None
	Line Number: 10188
*/
function function_8b518e66()
{
	level endon("intermission");
	while(!level.var_f05836f6)
	{
		wait(0.25);
	}
	FX = spawn("script_model", (-805.25, -2623.5, 22.5));
	FX SetModel("tag_origin");
	FX.angles = VectorScale((0, 1, 0), 270);
	FX clientfield::set("fx_demonsmoke", 1);
	fx2 = spawn("script_model", (-805.25, -2623.5, 22.5));
	fx2 SetModel("tag_origin");
	fx2.angles = (0, 0, 0);
	PlayFXOnTag(level._effect["demonaura"], fx2, "tag_origin");
	e_model = GetEnt("demongate_brazier2", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_demongate")
		{
			break;
		}
	}
	model = GetEnt(self.target, "targetname");
	playsoundatposition("circle_rune_hit", (-805.25, -2623.5, 22.5));
	FX.angles = VectorScale((0, 1, 0), 90);
	fx2 delete();
	level.var_ec14a368 = 1;
	while(!level.var_a05c9966)
	{
		wait(0.3);
	}
	FX clientfield::set("fx_demonsmoke", 0);
	FX delete();
}

/*
	Name: function_7e0012a0
	Namespace: namespace_da78430a
	Checksum: 0x874142C5
	Offset: 0x308B0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 10236
*/
function function_7e0012a0()
{
	level.var_67ba7a07 = 0;
	key = GetEnt("demongate_quest_brazier3", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("");
	key thread function_b15408cf();
}

/*
	Name: function_b15408cf
	Namespace: namespace_da78430a
	Checksum: 0x27B52AFC
	Offset: 0x30950
	Size: 0x3A0
	Parameters: 0
	Flags: None
	Line Number: 10255
*/
function function_b15408cf()
{
	level endon("intermission");
	while(!level.var_f05836f6)
	{
		wait(0.25);
	}
	FX = spawn("script_model", (695.75, -2638, 21.25));
	FX SetModel("tag_origin");
	FX.angles = VectorScale((0, 1, 0), 270);
	FX clientfield::set("fx_demonsmoke", 1);
	fx2 = spawn("script_model", (695.75, -2638, 21.25));
	fx2 SetModel("tag_origin");
	fx2.angles = (0, 0, 0);
	PlayFXOnTag(level._effect["demonaura"], fx2, "tag_origin");
	e_model = GetEnt("demongate_brazier3", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_demongate")
		{
			break;
		}
	}
	model = GetEnt(self.target, "targetname");
	playsoundatposition("circle_rune_hit", (695.75, -2638, 21.25));
	FX.angles = VectorScale((0, 1, 0), 90);
	fx2 delete();
	level.var_67ba7a07 = 1;
	while(!level.var_a05c9966)
	{
		wait(0.35);
	}
	FX clientfield::set("fx_demonsmoke", 0);
	FX delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_bc3ef235
	Namespace: namespace_da78430a
	Checksum: 0x3BF1BAAB
	Offset: 0x30CF8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 10305
*/
function function_bc3ef235()
{
	level.var_1b1324a4 = 0;
	thread function_2f387012();
	return;
	ERROR: Bad function call
}

/*
	Name: function_2f387012
	Namespace: namespace_da78430a
	Checksum: 0xA1381442
	Offset: 0x30D28
	Size: 0x6A0
	Parameters: 0
	Flags: None
	Line Number: 10323
*/
function function_2f387012()
{
	level endon("intermission");
	while(!level.var_f05836f6)
	{
		wait(0.25);
	}
	FX = spawn("script_model", (535.25, -267.5, 365.5));
	FX SetModel("tag_origin");
	FX.angles = (0, 0, 0);
	FX clientfield::set("fx_demonskulltrail", 1);
	e_model = GetEnt("demongate_glow1", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_demongate")
		{
			break;
		}
	}
	playsoundatposition("circle_rune_hit", (535.25, -267.5, 365.5));
	FX clientfield::set("fx_demonskulltrail", 0);
	FX delete();
	wait(0.25);
	fx2 = spawn("script_model", (-680.5, 1030.5, 307.5));
	fx2 SetModel("tag_origin");
	fx2.angles = (0, 0, 0);
	fx2 clientfield::set("fx_demonskulltrail", 1);
	var_d9ed9412 = GetEnt("demongate_glow2", "script_noteworthy");
	var_d9ed9412 setcandamage(1);
	while(1)
	{
		var_d9ed9412 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_demongate")
		{
			break;
		}
	}
	playsoundatposition("circle_rune_hit", (-680.5, 1030.5, 307.5));
	fx2 clientfield::set("fx_demonskulltrail", 0);
	fx2 delete();
	wait(0.25);
	FX3 = spawn("script_model", (92.25, 487, 114.5));
	FX3 SetModel("tag_origin");
	FX3.angles = (0, 0, 0);
	FX3 clientfield::set("fx_demonskulltrail", 1);
	var_fff00e7b = GetEnt("demongate_glow3", "script_noteworthy");
	var_fff00e7b setcandamage(1);
	while(1)
	{
		var_fff00e7b waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_demongate")
		{
			break;
		}
	}
	playsoundatposition("circle_rune_hit", (92.25, 487, 114.5));
	FX3 clientfield::set("fx_demonskulltrail", 0);
	FX3 delete();
	level.var_1b1324a4 = 1;
}

/*
	Name: function_fb715da3
	Namespace: namespace_da78430a
	Checksum: 0xD63C758F
	Offset: 0x313D0
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 10396
*/
function function_fb715da3()
{
	level.var_a05c9966 = 0;
	level.var_3b17bf71 = 0;
	key = GetEnt("demongate_quest2_complete", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Orb Essence");
	key thread function_bc775948();
	var_c2c99544 = GetEntArray("key_door_demongate2_quest_complete", "targetname");
	foreach(door in var_c2c99544)
	{
		door thread function_c164cf19();
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_bc775948
	Namespace: namespace_da78430a
	Checksum: 0xB18DE15F
	Offset: 0x31528
	Size: 0x318
	Parameters: 0
	Flags: None
	Line Number: 10423
*/
function function_bc775948()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_b95873b5)
	{
		wait(0.1);
	}
	while(!level.var_ec14a368)
	{
		wait(0.1);
	}
	while(!level.var_67ba7a07)
	{
		wait(0.1);
	}
	while(!level.var_1b1324a4)
	{
		wait(0.25);
	}
	foreach(player in level.players)
	{
		playsoundatposition("trial_complete", player.origin);
	}
	self TriggerEnable(1);
	model = GetEnt("demongate_crystal", "targetname");
	model moveto((-348, 1822.75, 1), 0.2, 0.05, 0.05);
	model.angles = VectorScale((1, 1, 1), 90);
	PlayFXOnTag(level._effect["demonaura"], model, "tag_origin");
	self waittill("trigger", player);
	self delete();
	model delete();
	playsoundatposition("crystal_00", (-348, 1822.75, 1));
	FX = spawn("script_model", (-348, 1822.75, 1));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbyellow", 1);
	level.var_a05c9966 = 1;
	wait(5);
	FX clientfield::set("fx_orbyellow", 0);
	FX delete();
}

/*
	Name: function_c164cf19
	Namespace: namespace_da78430a
	Checksum: 0xB5D73A3F
	Offset: 0x31848
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 10475
*/
function function_c164cf19()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_a05c9966)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self setcursorhint("HINT_NOICON");
	self setHintString("Press and Hold ^3&&1^7 to Infuse Orb");
	self waittill("trigger", player);
	self delete();
	FX = spawn("script_model", (-874, 886, 550));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbyellow", 1);
	playsoundatposition("challenge_complete_all", player.origin);
	wait(1);
	level.var_3b17bf71 = 1;
	wait(5);
	FX clientfield::set("fx_orbyellow", 0);
	FX delete();
}

/*
	Name: function_ad823e31
	Namespace: namespace_da78430a
	Checksum: 0xB825BD42
	Offset: 0x31A00
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 10509
*/
function function_ad823e31()
{
	level.var_186b0770 = 0;
	key = GetEnt("rune_prison_quest2_damage", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_af52ce70();
}

/*
	Name: function_af52ce70
	Namespace: namespace_da78430a
	Checksum: 0x5B3B25A6
	Offset: 0x31A80
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 10527
*/
function function_af52ce70()
{
	level endon("intermission");
	while(!level.var_62c631a6)
	{
		wait(0.25);
	}
	e_model = GetEnt("rune_prison2_damage", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_rune_prison")
		{
			break;
		}
	}
	wait(0.5);
	level.var_186b0770 = 1;
}

/*
	Name: function_2593e0da
	Namespace: namespace_da78430a
	Checksum: 0xA8930098
	Offset: 0x31C30
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 10558
*/
function function_2593e0da()
{
	level.var_2c5888bd = 0;
	level.var_1ff6c892 = 0;
	key = GetEnt("rune_prison_plane", "targetname");
	key setcursorhint("HINT_NOICON");
	key thread function_28b349a7();
	thread function_5fc3d207();
}

/*
	Name: function_28b349a7
	Namespace: namespace_da78430a
	Checksum: 0x5B305A1C
	Offset: 0x31CC8
	Size: 0x2660
	Parameters: 0
	Flags: None
	Line Number: 10578
*/
function function_28b349a7()
{
	level endon("intermission");
	while(!level.var_186b0770)
	{
		wait(0.25);
	}
	location1 = struct::get("rune_prison_plane_struct1", "targetname");
	location2 = struct::get("rune_prison_plane_struct2", "targetname");
	location3 = struct::get("rune_prison_plane_struct3", "targetname");
	var_e8943b5c = struct::get("rune_prison_plane_struct4", "targetname");
	var_e96b5c5 = struct::get("rune_prison_plane_struct5", "targetname");
	var_3499302e = struct::get("rune_prison_plane_struct6", "targetname");
	var_5a9baa97 = struct::get("rune_prison_plane_struct7", "targetname");
	var_20767e70 = struct::get("rune_prison_plane_struct8", "targetname");
	var_4678f8d9 = struct::get("rune_prison_plane_struct9", "targetname");
	var_a02e6443 = struct::get("rune_prison_plane_struct10", "targetname");
	var_7a2be9da = struct::get("rune_prison_plane_struct11", "targetname");
	var_54296f71 = struct::get("rune_prison_plane_struct12", "targetname");
	var_2e26f508 = struct::get("rune_prison_plane_struct13", "targetname");
	var_38384de7 = struct::get("rune_prison_plane_struct14", "targetname");
	var_1235d37e = struct::get("rune_prison_plane_struct15", "targetname");
	var_ec335915 = struct::get("rune_prison_plane_struct16", "targetname");
	var_c630deac = struct::get("rune_prison_plane_struct17", "targetname");
	var_701a90fb = struct::get("rune_prison_plane_struct18", "targetname");
	var_4a181692 = struct::get("rune_prison_plane_struct19", "targetname");
	var_2002feee = struct::get("rune_prison_plane_struct20", "targetname");
	var_46057957 = struct::get("rune_prison_plane_struct21", "targetname");
	var_d3fe0a1c = struct::get("rune_prison_plane_struct22", "targetname");
	var_fa008485 = struct::get("rune_prison_plane_struct23", "targetname");
	var_87f9154a = struct::get("rune_prison_plane_struct24", "targetname");
	var_adfb8fb3 = struct::get("rune_prison_plane_struct25", "targetname");
	var_3bf42078 = struct::get("rune_prison_plane_struct26", "targetname");
	var_61f69ae1 = struct::get("rune_prison_plane_struct27", "targetname");
	var_efef2ba6 = struct::get("rune_prison_plane_struct28", "targetname");
	var_15f1a60f = struct::get("rune_prison_plane_struct29", "targetname");
	var_de4b17f9 = struct::get("rune_prison_plane_struct30", "targetname");
	var_b8489d90 = struct::get("rune_prison_plane_struct31", "targetname");
	var_2a500ccb = struct::get("rune_prison_plane_struct32", "targetname");
	var_44d9262 = struct::get("rune_prison_plane_struct33", "targetname");
	var_7655019d = struct::get("rune_prison_plane_struct34", "targetname");
	var_50528734 = struct::get("rune_prison_plane_struct35", "targetname");
	var_c259f66f = struct::get("rune_prison_plane_struct36", "targetname");
	var_9c577c06 = struct::get("rune_prison_plane_struct37", "targetname");
	var_e5eeb41 = struct::get("rune_prison_plane_struct38", "targetname");
	var_e85c70d8 = struct::get("rune_prison_plane_struct39", "targetname");
	var_5ce27e24 = struct::get("rune_prison_plane_struct40", "targetname");
	var_82e4f88d = struct::get("rune_prison_plane_struct41", "targetname");
	var_a8e772f6 = struct::get("rune_prison_plane_struct42", "targetname");
	var_cee9ed5f = struct::get("rune_prison_plane_struct43", "targetname");
	var_c4d89480 = struct::get("rune_prison_plane_struct44", "targetname");
	var_eadb0ee9 = struct::get("rune_prison_plane_struct45", "targetname");
	var_10dd8952 = struct::get("rune_prison_plane_struct46", "targetname");
	var_36e003bb = struct::get("rune_prison_plane_struct47", "targetname");
	var_8cf6516c = struct::get("rune_prison_plane_struct48", "targetname");
	var_b2f8cbd5 = struct::get("rune_prison_plane_struct49", "targetname");
	var_dcb718cf = struct::get("rune_prison_plane_struct50", "targetname");
	var_b6b49e66 = struct::get("rune_prison_plane_struct51", "targetname");
	var_90b223fd = struct::get("rune_prison_plane_struct52", "targetname");
	var_6aafa994 = struct::get("rune_prison_plane_struct53", "targetname");
	var_44ad2f2b = struct::get("rune_prison_plane_struct54", "targetname");
	var_1eaab4c2 = struct::get("rune_prison_plane_struct55", "targetname");
	var_f8a83a59 = struct::get("rune_prison_plane_struct56", "targetname");
	var_d2a5bff0 = struct::get("rune_prison_plane_struct57", "targetname");
	var_ccaec17 = struct::get("rune_prison_plane_struct58", "targetname");
	var_e6c871ae = struct::get("rune_prison_plane_trail_struct", "targetname");
	model2 = spawn("script_model", location1.origin);
	model2 SetModel("tag_origin");
	var_7c6ce185 = GetEnt("rune_prison2_plane", "script_noteworthy");
	var_7c6ce185 moveto(location1.origin, 0.2, 0.05, 0.05);
	var_7c6ce185 clientfield::set("fx_planeglow", 1);
	var_7c6ce185.angles = VectorScale((0, 1, 0), 180);
	model3 = GetEnt("rune_prison2_plane_hitbox", "script_noteworthy");
	model3 moveto(location1.origin, 0.2, 0.05, 0.05);
	model3 clientfield::set("fx_planeglow", 1);
	model3.angles = (0, 0, 0);
	model3 setcandamage(1);
	wait(0.5);
	var_7c6ce185 EnableLinkTo();
	var_7c6ce185 LinkTo(model2);
	model3 EnableLinkTo();
	model3 LinkTo(model2);
	wait(0.25);
	model2 moveto(location2.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	model2 moveto(location3.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	model2 moveto(var_e8943b5c.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	model2 moveto(var_e96b5c5.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	model2 moveto(var_3499302e.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	model2 moveto(var_5a9baa97.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	model2 moveto(var_20767e70.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	model2 moveto(var_4678f8d9.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	model2 moveto(var_a02e6443.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	model2 moveto(var_7a2be9da.origin, 0.5, 0.05, 0.05);
	wait(0.5);
	model2 moveto(var_54296f71.origin, 0.5, 0.05, 0.05);
	wait(0.25);
	model2 RotateYaw(-45, 1, 0.25, 0.25);
	wait(0.25);
	model2 moveto(var_38384de7.origin, 1, 0.05, 0.05);
	wait(1);
	while(1)
	{
		model2 moveto(var_1235d37e.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_ec335915.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_c630deac.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_701a90fb.origin, 0.5, 0.05, 0.05);
		wait(0.25);
		model2 RotateYaw(22.5, 0.75, 0.25, 0.25);
		wait(0.25);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_4a181692.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_2002feee.origin, 0.5, 0.05, 0.05);
		wait(0.25);
		model2 RotateYaw(22.5, 0.75, 0.25, 0.25);
		wait(0.25);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_46057957.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_d3fe0a1c.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_fa008485.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_87f9154a.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_adfb8fb3.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_3bf42078.origin, 0.5, 0.05, 0.05);
		wait(0.25);
		model2 RotateYaw(22.5, 0.75, 0.25, 0.25);
		wait(0.25);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_61f69ae1.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_efef2ba6.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_15f1a60f.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_de4b17f9.origin, 0.5, 0.05, 0.05);
		wait(0.25);
		model2 RotateYaw(22.5, 0.75, 0.25, 0.25);
		wait(0.25);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_b8489d90.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_2a500ccb.origin, 0.5, 0.05, 0.05);
		wait(0.25);
		model2 RotateYaw(22.5, 0.75, 0.25, 0.25);
		wait(0.25);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_44d9262.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_7655019d.origin, 0.5, 0.05, 0.05);
		wait(0.25);
		model2 RotateYaw(22.5, 0.75, 0.25, 0.25);
		wait(0.25);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_50528734.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_c259f66f.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_9c577c06.origin, 0.5, 0.05, 0.05);
		wait(0.25);
		model2 RotateYaw(22.5, 0.75, 0.25, 0.25);
		wait(0.25);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_e5eeb41.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_e85c70d8.origin, 0.5, 0.05, 0.05);
		wait(0.25);
		model2 RotateYaw(22.5, 0.75, 0.25, 0.25);
		wait(0.25);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_5ce27e24.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_82e4f88d.origin, 0.5, 0.05, 0.05);
		wait(0.25);
		model2 RotateYaw(22.5, 0.75, 0.25, 0.25);
		wait(0.25);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_a8e772f6.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_cee9ed5f.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_c4d89480.origin, 0.5, 0.05, 0.05);
		wait(0.25);
		model2 RotateYaw(22.5, 0.75, 0.25, 0.25);
		wait(0.25);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_eadb0ee9.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_10dd8952.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_36e003bb.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_8cf6516c.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_b2f8cbd5.origin, 0.5, 0.05, 0.05);
		wait(0.25);
		model2 RotateYaw(22.5, 0.75, 0.25, 0.25);
		wait(0.25);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_dcb718cf.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_b6b49e66.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_90b223fd.origin, 0.5, 0.05, 0.05);
		wait(0.25);
		model2 RotateYaw(22.5, 0.75, 0.25, 0.25);
		wait(0.25);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_6aafa994.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_44ad2f2b.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_1eaab4c2.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_f8a83a59.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_d2a5bff0.origin, 0.5, 0.05, 0.05);
		wait(0.25);
		model2 RotateYaw(90, 2, 0.25, 0.25);
		wait(0.25);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_ccaec17.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_2e26f508.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
		model2 moveto(var_38384de7.origin, 0.5, 0.05, 0.05);
		wait(0.5);
		if(level.var_1ff6c892 == 1)
		{
			break;
		}
	}
	var_7c6ce185 Hide();
	var_7c6ce185 clientfield::set("fx_planeglow", 0);
	wait(0.1);
	model2 clientfield::set("fx_flak5", 1);
	wait(0.6);
	model2 clientfield::set("fx_flak5", 0);
	model2 clientfield::set("fx_planetrail", 1);
	model2 moveto(var_e6c871ae.origin, 3.5, 0.25, 0.25);
	wait(3.5);
	FX = spawn("script_model", (-1277.75, -2627.25, 100.25));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_flak5", 1);
	playsoundatposition("explode_00", (-1277.75, -2627.25, 100.25));
	wait(0.25);
	fx2 = spawn("script_model", (-1277.75, -2627.25, 100.25));
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_runebrazier", 1);
	model2 clientfield::set("fx_planetrail", 0);
	var_7c6ce185 delete();
	model2 delete();
	model3 delete();
	level.var_2c5888bd = 1;
	wait(5);
	FX clientfield::set("fx_flak5", 0);
	FX delete();
}

/*
	Name: function_5fc3d207
	Namespace: namespace_da78430a
	Checksum: 0x2788FA03
	Offset: 0x34330
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 11029
*/
function function_5fc3d207()
{
	level endon("intermission");
	while(!level.var_186b0770)
	{
		wait(0.5);
	}
	e_model = GetEnt("rune_prison2_plane_hitbox", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	level.var_1ff6c892 = 1;
}

/*
	Name: function_18ebac57
	Namespace: namespace_da78430a
	Checksum: 0x3B916F3E
	Offset: 0x34468
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 11056
*/
function function_18ebac57()
{
	level.var_9fc52c4a = 0;
	key = GetEnt("torch9", "targetname");
	key thread function_e866e838();
}

/*
	Name: function_e866e838
	Namespace: namespace_da78430a
	Checksum: 0xB18AE7AF
	Offset: 0x344C8
	Size: 0x378
	Parameters: 0
	Flags: None
	Line Number: 11073
*/
function function_e866e838()
{
	level endon("intermission");
	FX = spawn("script_model", (-18.5, -3820.75, 74.25));
	FX SetModel("tag_origin");
	FX.angles = (0, 0, 0);
	FX clientfield::set("fx_torchlight", 1);
	fx2 = spawn("script_model", (-22.25, -3809, 58.25));
	fx2 SetModel("tag_origin");
	fx2.angles = VectorScale((0, 1, 0), 270);
	fx2 clientfield::set("fx_torchfire", 1);
	while(!level.var_186b0770)
	{
		wait(0.1);
	}
	FX clientfield::set("fx_torchlight", 0);
	fx2 clientfield::set("fx_torchfire", 0);
	wait(0.25);
	e_model = GetEnt("torch_9", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_rune_prison")
		{
			break;
		}
	}
	playsoundatposition("explode_00", (-18.5, -3820.75, 74.25));
	FX clientfield::set("fx_torchlight", 1);
	fx2 clientfield::set("fx_torchfire", 1);
	level.var_9fc52c4a = 1;
}

/*
	Name: function_a6e43d1c
	Namespace: namespace_da78430a
	Checksum: 0x54494103
	Offset: 0x34848
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 11117
*/
function function_a6e43d1c()
{
	level.var_3a965c7b = 0;
	key = GetEnt("torch3", "targetname");
	key thread function_5a6e5773();
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_5a6e5773
	Namespace: namespace_da78430a
	Checksum: 0x1B930F07
	Offset: 0x348A8
	Size: 0x390
	Parameters: 0
	Flags: None
	Line Number: 11137
*/
function function_5a6e5773()
{
	level endon("intermission");
	FX = spawn("script_model", (-325.25, -3250.75, 74.25));
	FX SetModel("tag_origin");
	FX.angles = VectorScale((0, 1, 0), 180);
	FX clientfield::set("fx_torchlight", 1);
	fx2 = spawn("script_model", (-321.5, -3262.5, 58.25));
	fx2 SetModel("tag_origin");
	fx2.angles = VectorScale((0, 1, 0), 90);
	fx2 clientfield::set("fx_torchfire", 1);
	while(!level.var_186b0770)
	{
		wait(0.1);
	}
	FX clientfield::set("fx_torchlight", 0);
	fx2 clientfield::set("fx_torchfire", 0);
	while(!level.var_9fc52c4a)
	{
		wait(0.25);
	}
	e_model = GetEnt("torch_3", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_rune_prison")
		{
			break;
		}
	}
	playsoundatposition("explode_00", (-325.25, -3250.75, 74.25));
	FX clientfield::set("fx_torchlight", 1);
	fx2 clientfield::set("fx_torchfire", 1);
	level.var_3a965c7b = 1;
}

/*
	Name: function_cce6b785
	Namespace: namespace_da78430a
	Checksum: 0x4BF0F8F2
	Offset: 0x34C40
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 11184
*/
function function_cce6b785()
{
	level.var_ead9e32c = 0;
	key = GetEnt("torch5", "targetname");
	key thread function_346bdd0a();
}

/*
	Name: function_346bdd0a
	Namespace: namespace_da78430a
	Checksum: 0xA7C82A83
	Offset: 0x34CA0
	Size: 0xD70
	Parameters: 0
	Flags: None
	Line Number: 11201
*/
function function_346bdd0a()
{
	level endon("intermission");
	FX = spawn("script_model", (-763, -3384, 75));
	FX SetModel("tag_origin");
	FX.angles = VectorScale((0, 1, 0), 270);
	FX clientfield::set("fx_torchlight", 1);
	fx2 = spawn("script_model", (-751.25, -3380.25, 59));
	fx2 SetModel("tag_origin");
	fx2.angles = VectorScale((0, 1, 0), 180);
	fx2 clientfield::set("fx_torchfire", 1);
	FX3 = spawn("script_model", (-626.5, -3820.5, 74.25));
	FX3 SetModel("tag_origin");
	FX3.angles = (0, 0, 0);
	FX3 clientfield::set("fx_torchlight", 1);
	var_fb2c4b25 = spawn("script_model", (-630.25, -3808.75, 58.25));
	var_fb2c4b25 SetModel("tag_origin");
	var_fb2c4b25.angles = VectorScale((0, 1, 0), 270);
	var_fb2c4b25 clientfield::set("fx_torchfire", 1);
	var_d529d0bc = spawn("script_model", (-322.75, -3819.75, 74.25));
	var_d529d0bc SetModel("tag_origin");
	var_d529d0bc.angles = (0, 0, 0);
	var_d529d0bc clientfield::set("fx_torchlight", 1);
	var_47313ff7 = spawn("script_model", (-326.5, -3808, 58.25));
	var_47313ff7 SetModel("tag_origin");
	var_47313ff7.angles = VectorScale((0, 1, 0), 270);
	var_47313ff7 clientfield::set("fx_torchfire", 1);
	var_212ec58e = spawn("script_model", (286, -3820.5, 74.25));
	var_212ec58e SetModel("tag_origin");
	var_212ec58e.angles = (0, 0, 0);
	var_212ec58e clientfield::set("fx_torchlight", 1);
	var_330e8e39 = spawn("script_model", (282.25, -3808.75, 58.25));
	var_330e8e39 SetModel("tag_origin");
	var_330e8e39.angles = VectorScale((0, 1, 0), 270);
	var_330e8e39 clientfield::set("fx_torchfire", 1);
	var_d0c13d0 = spawn("script_model", (418, -3683.5, 74.25));
	var_d0c13d0 SetModel("tag_origin");
	var_d0c13d0.angles = VectorScale((0, 1, 0), 90);
	var_d0c13d0 clientfield::set("fx_torchlight", 1);
	var_71afbe78 = spawn("script_model", (406.25, -3687.25, 58.25));
	var_71afbe78 SetModel("tag_origin");
	var_71afbe78.angles = (0, 0, 0);
	var_71afbe78 clientfield::set("fx_torchfire", 1);
	var_97b238e1 = spawn("script_model", (-24.25, -3247.75, 74.25));
	var_97b238e1 SetModel("tag_origin");
	var_97b238e1.angles = VectorScale((0, 1, 0), 180);
	var_97b238e1 clientfield::set("fx_torchlight", 1);
	var_bdb4b34a = spawn("script_model", (-20.5, -3259.5, 58.25));
	var_bdb4b34a SetModel("tag_origin");
	var_bdb4b34a.angles = VectorScale((0, 1, 0), 90);
	var_bdb4b34a clientfield::set("fx_torchfire", 1);
	var_e3b72db3 = spawn("script_model", (-764.25, -3687.75, 74));
	var_e3b72db3 SetModel("tag_origin");
	var_e3b72db3.angles = VectorScale((0, 1, 0), 270);
	var_e3b72db3 clientfield::set("fx_torchlight", 1);
	var_9b9a81c = spawn("script_model", (-752.5, -3684, 58));
	var_9b9a81c SetModel("tag_origin");
	var_9b9a81c.angles = VectorScale((0, 1, 0), 180);
	var_9b9a81c clientfield::set("fx_torchfire", 1);
	while(!level.var_186b0770)
	{
		wait(0.1);
	}
	FX clientfield::set("fx_torchlight", 0);
	fx2 clientfield::set("fx_torchfire", 0);
	FX3 clientfield::set("fx_torchlight", 0);
	var_fb2c4b25 clientfield::set("fx_torchfire", 0);
	var_d529d0bc clientfield::set("fx_torchlight", 0);
	var_47313ff7 clientfield::set("fx_torchfire", 0);
	var_212ec58e clientfield::set("fx_torchlight", 0);
	var_330e8e39 clientfield::set("fx_torchfire", 0);
	var_d0c13d0 clientfield::set("fx_torchlight", 0);
	var_71afbe78 clientfield::set("fx_torchfire", 0);
	var_97b238e1 clientfield::set("fx_torchlight", 0);
	var_bdb4b34a clientfield::set("fx_torchfire", 0);
	var_e3b72db3 clientfield::set("fx_torchlight", 0);
	var_9b9a81c clientfield::set("fx_torchfire", 0);
	while(!level.var_3a965c7b)
	{
		wait(0.25);
	}
	e_model = GetEnt("torch_5", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_rune_prison")
		{
			break;
		}
	}
	playsoundatposition("explode_00", (-763, -3384, 75));
	FX clientfield::set("fx_torchlight", 1);
	fx2 clientfield::set("fx_torchfire", 1);
	FX3 clientfield::set("fx_torchlight", 1);
	var_fb2c4b25 clientfield::set("fx_torchfire", 1);
	var_d529d0bc clientfield::set("fx_torchlight", 1);
	var_47313ff7 clientfield::set("fx_torchfire", 1);
	var_212ec58e clientfield::set("fx_torchlight", 1);
	var_330e8e39 clientfield::set("fx_torchfire", 1);
	var_d0c13d0 clientfield::set("fx_torchlight", 1);
	var_71afbe78 clientfield::set("fx_torchfire", 1);
	var_97b238e1 clientfield::set("fx_torchlight", 1);
	var_bdb4b34a clientfield::set("fx_torchfire", 1);
	var_e3b72db3 clientfield::set("fx_torchlight", 1);
	var_9b9a81c clientfield::set("fx_torchfire", 1);
	level.var_ead9e32c = 1;
}

/*
	Name: function_8e2f8729
	Namespace: namespace_da78430a
	Checksum: 0xC5F12205
	Offset: 0x35A18
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 11320
*/
function function_8e2f8729()
{
	level.var_d8f751b8 = 0;
	level.var_60d3a457 = 0;
	key = GetEnt("rune_prison_quest2_complete", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Orb Essence");
	key thread function_47361cbe();
	var_658b1712 = GetEntArray("key_door_rune_prison2_quest_complete", "targetname");
	foreach(door in var_658b1712)
	{
		door thread function_aba743af();
	}
}

/*
	Name: function_47361cbe
	Namespace: namespace_da78430a
	Checksum: 0xAB823A44
	Offset: 0x35B70
	Size: 0x330
	Parameters: 0
	Flags: None
	Line Number: 11345
*/
function function_47361cbe()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_2c5888bd)
	{
		wait(0.25);
	}
	while(!level.var_9fc52c4a)
	{
		wait(0.1);
	}
	while(!level.var_3a965c7b)
	{
		wait(0.1);
	}
	while(!level.var_ead9e32c)
	{
		wait(0.1);
	}
	foreach(player in level.players)
	{
		playsoundatposition("trial_complete", player.origin);
	}
	self TriggerEnable(1);
	model = GetEnt("rune_prison_crystal", "targetname");
	model moveto((-897.651, 1889.87, 7.25), 0.2, 0.05, 0.05);
	model.angles = (90, 0, 21);
	PlayFXOnTag(level._effect["runearrowglow"], model, "tag_origin");
	self waittill("trigger", player);
	self delete();
	model delete();
	playsoundatposition("crystal_00", (-897.651, 1889.87, 7.25));
	FX = spawn("script_model", (-897.651, 1889.87, 7.25));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbred", 1);
	level.var_d8f751b8 = 1;
	wait(5);
	FX clientfield::set("fx_orbred", 0);
	FX delete();
}

/*
	Name: function_aba743af
	Namespace: namespace_da78430a
	Checksum: 0xA27CA64E
	Offset: 0x35EA8
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 11397
*/
function function_aba743af()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_d8f751b8)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self setcursorhint("HINT_NOICON");
	self setHintString("Press and Hold ^3&&1^7 to Infuse Orb");
	self waittill("trigger", player);
	self delete();
	FX = spawn("script_model", (-882, 564, 550));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_orbred", 1);
	playsoundatposition("challenge_complete_all", player.origin);
	wait(1);
	level.var_60d3a457 = 1;
	wait(5);
	FX clientfield::set("fx_orbred", 0);
	FX delete();
}

/*
	Name: function_6931e78b
	Namespace: namespace_da78430a
	Checksum: 0xE513491F
	Offset: 0x36060
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 11431
*/
function function_6931e78b()
{
	level.var_da0d3078 = 0;
	level.var_22ab3c17 = 0;
	level.var_966ce677 = 0;
	level.var_706a6c0e = 0;
	key = GetEnt("orb_merge_complete", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Fracture The Melded Orb");
	key thread function_1215aa4();
	var_16904dde = GetEntArray("key_door_orb_merge_quest_complete", "targetname");
	foreach(door in var_16904dde)
	{
		door thread function_51306295();
	}
}

/*
	Name: function_1215aa4
	Namespace: namespace_da78430a
	Checksum: 0x8EEDA7D2
	Offset: 0x361D0
	Size: 0x24B8
	Parameters: 0
	Flags: None
	Line Number: 11458
*/
function function_1215aa4()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_827912e0)
	{
		wait(0.1);
	}
	while(!level.var_4738d26a)
	{
		wait(0.1);
	}
	while(!level.var_3b17bf71)
	{
		wait(0.1);
	}
	while(!level.var_60d3a457)
	{
		wait(0.1);
	}
	playsoundatposition("success2", (-712, 718, 484));
	wait(3.5);
	level.var_da0d3078 = 1;
	playsoundatposition("warp_to_moon", (-712, 718, 484));
	wait(2.75);
	level thread LUI::screen_flash(0.05, 0.5, 0.05, 0.8, "white");
	wait(0.25);
	self TriggerEnable(1);
	location = struct::get("orb_merge_struct", "targetname");
	location1 = struct::get("orb_move1_struct", "targetname");
	location2 = struct::get("orb_move2_struct", "targetname");
	location3 = struct::get("orb_move3_struct", "targetname");
	var_e8943b5c = struct::get("orb_move4_struct", "targetname");
	var_e96b5c5 = struct::get("orb_move5_struct", "targetname");
	var_3499302e = struct::get("orb_move6_struct", "targetname");
	var_5a9baa97 = struct::get("orb_move7_struct", "targetname");
	var_20767e70 = struct::get("orb_move8_struct", "targetname");
	var_4678f8d9 = struct::get("orb_move9_struct", "targetname");
	var_a02e6443 = struct::get("orb_move10_struct", "targetname");
	var_7a2be9da = struct::get("orb_move11_struct", "targetname");
	var_54296f71 = struct::get("orb_move12_struct", "targetname");
	var_2e26f508 = struct::get("orb_move13_struct", "targetname");
	var_38384de7 = struct::get("orb_move14_struct", "targetname");
	var_1235d37e = struct::get("orb_move15_struct", "targetname");
	var_ec335915 = struct::get("orb_move16_struct", "targetname");
	var_c630deac = struct::get("orb_move17_struct", "targetname");
	var_701a90fb = struct::get("orb_move18_struct", "targetname");
	var_4a181692 = struct::get("orb_move19_struct", "targetname");
	model2 = spawn("script_model", location.origin);
	model2 SetModel("tag_origin");
	model2 clientfield::set("fx_wolfskull", 1);
	wait(0.1);
	var_7c6ce185 = spawn("script_model", location.origin);
	var_7c6ce185 SetModel("p7_zm_ori_orb_final");
	PlayFXOnTag(level._effect["orbmerge"], var_7c6ce185, "tag_origin");
	wait(0.25);
	var_7c6ce185 EnableLinkTo();
	var_7c6ce185 LinkTo(model2);
	self waittill("trigger", player);
	self delete();
	playsoundatposition("shield_collapse", (-712, 718, 484));
	wait(3);
	level thread LUI::screen_flash(0.05, 0.5, 0.05, 0.8, "white");
	playsoundatposition("beam_st_start", (-712, 718, 484));
	model2 moveto(location1.origin, 0.5, 0.15, 0.15);
	wait(0.75);
	var_7c6ce185 setcandamage(1);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", location1.origin);
	fx1 = spawn("script_model", location1.origin);
	fx1 SetModel("tag_origin");
	fx1 clientfield::set("fx_orbred", 1);
	model2 moveto(location2.origin, 0.5, 0.15, 0.15);
	wait(0.5);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", location2.origin);
	fx1 clientfield::set("fx_orbred", 0);
	fx1 delete();
	fx2 = spawn("script_model", location2.origin);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbred", 1);
	model2 moveto(location3.origin, 1, 0.15, 0.15);
	wait(1);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", location3.origin);
	fx2 clientfield::set("fx_orbred", 0);
	fx2 delete();
	FX3 = spawn("script_model", location3.origin);
	FX3 SetModel("tag_origin");
	FX3 clientfield::set("fx_orbred", 1);
	model2 moveto(var_e8943b5c.origin, 0.5, 0.15, 0.15);
	wait(0.5);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_e8943b5c.origin);
	FX3 clientfield::set("fx_orbred", 0);
	FX3 delete();
	var_fb2c4b25 = spawn("script_model", var_e8943b5c.origin);
	var_fb2c4b25 SetModel("tag_origin");
	var_fb2c4b25 clientfield::set("fx_orbred", 1);
	model2 moveto(var_e96b5c5.origin, 1, 0.15, 0.15);
	wait(1);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_e96b5c5.origin);
	var_fb2c4b25 clientfield::set("fx_orbred", 0);
	var_fb2c4b25 delete();
	var_d529d0bc = spawn("script_model", var_e96b5c5.origin);
	var_d529d0bc SetModel("tag_origin");
	var_d529d0bc clientfield::set("fx_orbred", 1);
	model2 moveto(var_3499302e.origin, 0.75, 0.15, 0.15);
	wait(0.75);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_3499302e.origin);
	var_d529d0bc clientfield::set("fx_orbred", 0);
	var_d529d0bc delete();
	var_47313ff7 = spawn("script_model", var_3499302e.origin);
	var_47313ff7 SetModel("tag_origin");
	var_47313ff7 clientfield::set("fx_orbred", 1);
	model2 moveto(var_5a9baa97.origin, 0.75, 0.15, 0.15);
	wait(0.75);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_5a9baa97.origin);
	var_47313ff7 clientfield::set("fx_orbred", 0);
	var_47313ff7 delete();
	var_212ec58e = spawn("script_model", var_5a9baa97.origin);
	var_212ec58e SetModel("tag_origin");
	var_212ec58e clientfield::set("fx_orbred", 1);
	model2 moveto(var_20767e70.origin, 0.5, 0.15, 0.15);
	wait(0.5);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_20767e70.origin);
	var_212ec58e clientfield::set("fx_orbred", 0);
	var_212ec58e delete();
	var_330e8e39 = spawn("script_model", var_20767e70.origin);
	var_330e8e39 SetModel("tag_origin");
	var_330e8e39 clientfield::set("fx_orbred", 1);
	model2 moveto(var_4678f8d9.origin, 0.75, 0.15, 0.15);
	wait(0.75);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_4678f8d9.origin);
	var_330e8e39 clientfield::set("fx_orbred", 0);
	var_330e8e39 delete();
	var_d0c13d0 = spawn("script_model", var_4678f8d9.origin);
	var_d0c13d0 SetModel("tag_origin");
	var_d0c13d0 clientfield::set("fx_orbred", 1);
	model2 moveto(var_a02e6443.origin, 1, 0.15, 0.15);
	wait(1);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_a02e6443.origin);
	var_d0c13d0 clientfield::set("fx_orbred", 0);
	var_d0c13d0 delete();
	var_71afbe78 = spawn("script_model", var_a02e6443.origin);
	var_71afbe78 SetModel("tag_origin");
	var_71afbe78 clientfield::set("fx_orbred", 1);
	model2 moveto(var_7a2be9da.origin, 0.75, 0.15, 0.15);
	wait(0.75);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_7a2be9da.origin);
	var_71afbe78 clientfield::set("fx_orbred", 0);
	var_71afbe78 delete();
	var_97b238e1 = spawn("script_model", var_7a2be9da.origin);
	var_97b238e1 SetModel("tag_origin");
	var_97b238e1 clientfield::set("fx_orbred", 1);
	model2 moveto(var_54296f71.origin, 0.75, 0.15, 0.15);
	wait(0.75);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_54296f71.origin);
	var_97b238e1 clientfield::set("fx_orbred", 0);
	var_97b238e1 delete();
	var_bdb4b34a = spawn("script_model", var_54296f71.origin);
	var_bdb4b34a SetModel("tag_origin");
	var_bdb4b34a clientfield::set("fx_orbred", 1);
	model2 moveto(var_2e26f508.origin, 0.5, 0.15, 0.15);
	wait(0.5);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_2e26f508.origin);
	var_bdb4b34a clientfield::set("fx_orbred", 0);
	var_bdb4b34a delete();
	var_e3b72db3 = spawn("script_model", var_2e26f508.origin);
	var_e3b72db3 SetModel("tag_origin");
	var_e3b72db3 clientfield::set("fx_orbred", 1);
	model2 moveto(var_38384de7.origin, 0.75, 0.15, 0.15);
	wait(0.75);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_38384de7.origin);
	var_e3b72db3 clientfield::set("fx_orbred", 0);
	var_e3b72db3 delete();
	var_9b9a81c = spawn("script_model", var_38384de7.origin);
	var_9b9a81c SetModel("tag_origin");
	var_9b9a81c clientfield::set("fx_orbred", 1);
	model2 moveto(var_1235d37e.origin, 0.75, 0.15, 0.15);
	wait(0.75);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_1235d37e.origin);
	var_9b9a81c clientfield::set("fx_orbred", 0);
	var_9b9a81c delete();
	var_2fbc2285 = spawn("script_model", var_1235d37e.origin);
	var_2fbc2285 SetModel("tag_origin");
	var_2fbc2285 clientfield::set("fx_orbred", 1);
	model2 moveto(var_ec335915.origin, 1.5, 0.15, 0.15);
	wait(1.5);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_ec335915.origin);
	var_2fbc2285 clientfield::set("fx_orbred", 0);
	var_2fbc2285 delete();
	var_55be9cee = spawn("script_model", var_ec335915.origin);
	var_55be9cee SetModel("tag_origin");
	var_55be9cee clientfield::set("fx_orbred", 1);
	model2 moveto(var_c630deac.origin, 0.75, 0.15, 0.15);
	wait(0.75);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_c630deac.origin);
	var_55be9cee clientfield::set("fx_orbred", 0);
	var_55be9cee delete();
	var_7bc11757 = spawn("script_model", var_c630deac.origin);
	var_7bc11757 SetModel("tag_origin");
	var_7bc11757 clientfield::set("fx_orbred", 1);
	model2 moveto(var_701a90fb.origin, 1, 0.15, 0.15);
	wait(1);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_701a90fb.origin);
	var_7bc11757 clientfield::set("fx_orbred", 0);
	var_7bc11757 delete();
	var_419beb30 = spawn("script_model", var_701a90fb.origin);
	var_419beb30 SetModel("tag_origin");
	var_419beb30 clientfield::set("fx_orbred", 1);
	model2 moveto(var_4a181692.origin, 2, 0.15, 0.15);
	wait(0.25);
	var_679e6599 = spawn("script_model", (-1105.5, -1794, 198));
	var_679e6599 SetModel("tag_origin");
	var_679e6599.angles = VectorScale((1, 0, 0), 270);
	PlayFXOnTag(level._effect["dig"], var_679e6599, "tag_origin");
	var_7a68cd2b = spawn("script_model", (-1100.75, -1796.25, 200.25));
	var_7a68cd2b SetModel("tag_origin");
	PlayFXOnTag(level._effect["crate"], var_7a68cd2b, "tag_origin");
	playsoundatposition("crate_small_break", var_701a90fb.origin);
	model3 = GetEnt("flak_lid", "targetname");
	model3 delete();
	level.var_22ab3c17 = 1;
	wait(2);
	var_419beb30 clientfield::set("fx_orbred", 0);
	var_419beb30 delete();
	var_679e6599 delete();
	var_7a68cd2b delete();
	var_2e63d859 = spawn("script_model", (427.25, -3339.5, 1010.75));
	var_2e63d859 SetModel("tag_origin");
	var_2e63d859 clientfield::set("fx_urnglow", 1);
	while(!level.var_80d38640)
	{
		wait(0.25);
	}
	var_2e63d859 clientfield::set("fx_urnglow", 0);
	var_2e63d859 delete();
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	playsoundatposition("beam_st_start", var_4a181692.origin);
	var_8615df0 = spawn("script_model", var_4a181692.origin);
	var_8615df0 SetModel("tag_origin");
	var_8615df0 clientfield::set("fx_orbred", 1);
	model2 moveto(location.origin, 3, 0.15, 0.15);
	wait(3);
	level.var_966ce677 = 1;
	while(!level.var_706a6c0e)
	{
		wait(0.25);
	}
	var_8615df0 clientfield::set("fx_orbred", 0);
	var_8615df0 delete();
	var_7c6ce185 delete();
	model2 delete();
}

/*
	Name: function_51306295
	Namespace: namespace_da78430a
	Checksum: 0x4D6C8FEA
	Offset: 0x38690
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 11814
*/
function function_51306295()
{
	level endon("intermission");
	self TriggerEnable(0);
	while(!level.var_966ce677)
	{
		wait(0.25);
	}
	self TriggerEnable(1);
	self setcursorhint("HINT_NOICON");
	self setHintString("Press and Hold ^3&&1^7 to Destroy The Melded Orb");
	self waittill("trigger", player);
	self delete();
	playsoundatposition("challenge_complete_all", player.origin);
	wait(1);
	FX = spawn("script_model", (-712, 717.75, 539.75));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_urnexplode", 1);
	playsoundatposition("zmb_urn_dest_pop", player.origin);
	level thread LUI::screen_flash(0.05, 0.5, 0.05, 0.8, "white");
	level.var_706a6c0e = 1;
	wait(5);
	FX clientfield::set("fx_urnexplode", 0);
	FX delete();
}

/*
	Name: function_e7f1423
	Namespace: namespace_da78430a
	Checksum: 0x586D282A
	Offset: 0x388B0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 11850
*/
function function_e7f1423()
{
	thread function_1a4700a1("z2z3");
	thread function_924a14f1("z2z4");
	thread function_6c479a88("z6z7");
	thread function_7658f367("z18z20");
	thread function_505678fe("z19z20");
	thread function_2a53fe95("z8z12");
	thread function_451842c("z10z13");
	thread function_ae3b367b("z9z15");
	thread function_8838bc12("z21z22");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1a4700a1
	Namespace: namespace_da78430a
	Checksum: 0x2A353ED8
	Offset: 0x38998
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 11875
*/
function function_1a4700a1(var_32cbbef9)
{
	var_b8efb3ff = GetEnt(var_32cbbef9, "targetname");
	var_b8efb3ff waittill("trigger", player);
	level flag::set(var_32cbbef9);
}

/*
	Name: function_924a14f1
	Namespace: namespace_da78430a
	Checksum: 0x71ED17B6
	Offset: 0x38A10
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 11892
*/
function function_924a14f1(var_c42fa0d9)
{
	var_b8efb3ff = GetEnt(var_c42fa0d9, "targetname");
	var_b8efb3ff waittill("trigger", player);
	level flag::set(var_c42fa0d9);
	return;
	ERROR: Bad function call
}

/*
	Name: function_6c479a88
	Namespace: namespace_da78430a
	Checksum: 0xCD53E50D
	Offset: 0x38A88
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 11911
*/
function function_6c479a88(var_9e2d2670)
{
	var_b8efb3ff = GetEnt(var_9e2d2670, "targetname");
	var_b8efb3ff waittill("trigger", player);
	level flag::set(var_9e2d2670);
}

/*
	Name: function_7658f367
	Namespace: namespace_da78430a
	Checksum: 0x43BA0FB7
	Offset: 0x38B00
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 11928
*/
function function_7658f367(var_a83e7f4f)
{
	var_b8efb3ff = GetEnt(var_a83e7f4f, "targetname");
	var_b8efb3ff waittill("trigger", player);
	level flag::set(var_a83e7f4f);
}

/*
	Name: function_505678fe
	Namespace: namespace_da78430a
	Checksum: 0x6662543
	Offset: 0x38B78
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 11945
*/
function function_505678fe(var_823c04e6)
{
	var_b8efb3ff = GetEnt(var_823c04e6, "targetname");
	var_b8efb3ff waittill("trigger", player);
	level flag::set(var_823c04e6);
}

/*
	Name: function_2a53fe95
	Namespace: namespace_da78430a
	Checksum: 0xAEFBFF6
	Offset: 0x38BF0
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 11962
*/
function function_2a53fe95(var_5c398a7d)
{
	var_b8efb3ff = GetEnt(var_5c398a7d, "targetname");
	var_b8efb3ff waittill("trigger", player);
	level flag::set(var_5c398a7d);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_451842c
	Namespace: namespace_da78430a
	Checksum: 0xAAF1CDFC
	Offset: 0x38C68
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 11982
*/
function function_451842c(var_36371014)
{
	var_b8efb3ff = GetEnt(var_36371014, "targetname");
	var_b8efb3ff waittill("trigger", player);
	level flag::set(var_36371014);
}

/*
	Name: function_ae3b367b
	Namespace: namespace_da78430a
	Checksum: 0xA405EC95
	Offset: 0x38CE0
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 11999
*/
function function_ae3b367b(var_404868f3)
{
	var_b8efb3ff = GetEnt(var_404868f3, "targetname");
	var_b8efb3ff waittill("trigger", player);
	level flag::set(var_404868f3);
}

/*
	Name: function_8838bc12
	Namespace: namespace_da78430a
	Checksum: 0x1618FCA7
	Offset: 0x38D58
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 12016
*/
function function_8838bc12(var_1a45ee8a)
{
	var_b8efb3ff = GetEnt(var_1a45ee8a, "targetname");
	var_b8efb3ff waittill("trigger", player);
	level flag::set(var_1a45ee8a);
}

/*
	Name: function_7a43781d
	Namespace: namespace_da78430a
	Checksum: 0xCE2C846F
	Offset: 0x38DD0
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 12033
*/
function function_7a43781d()
{
	var_b13912ff = 0;
	if(level.round_number > 30)
	{
		if(RandomFloat(100) < 4)
		{
			var_b13912ff = 1;
		}
	}
	else if(level.round_number > 25)
	{
		if(RandomFloat(100) < 3)
		{
			var_b13912ff = 1;
		}
	}
	else if(level.round_number > 20)
	{
		if(RandomFloat(100) < 2)
		{
			var_b13912ff = 1;
		}
	}
	else if(level.round_number > 15)
	{
		if(RandomFloat(100) < 1)
		{
			var_b13912ff = 1;
		}
	}
	if(var_b13912ff)
	{
		zm_ai_dogs::special_dog_spawn(1);
		level.zombie_total--;
	}
	return var_b13912ff;
}

/*
	Name: function_fe6d7e45
	Namespace: namespace_da78430a
	Checksum: 0xCDAF2F3
	Offset: 0x38F10
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 12082
*/
function function_fe6d7e45()
{
	level.var_fb392447 = 0;
	thread function_9c44377b();
}

/*
	Name: function_9c44377b
	Namespace: namespace_da78430a
	Checksum: 0x56C42ACF
	Offset: 0x38F40
	Size: 0x258
	Parameters: 0
	Flags: None
	Line Number: 12098
*/
function function_9c44377b()
{
	level endon("intermission");
	trig = GetEnt("model_trig", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig setHintString("Hold ^3[{+activate}]^7 to pick Up Vril Device");
	trig UseTriggerRequireLookAt();
	trig TriggerEnable(0);
	while(!level.var_706a6c0e)
	{
		wait(0.25);
	}
	trig TriggerEnable(1);
	model = GetEnt(trig.target, "targetname");
	model moveto((-712, 717.75, 526.25), 0.2, 0.05, 0.05);
	wait(0.25);
	model thread zm_powerups::powerup_wobble();
	trig waittill("trigger", player);
	player playsound("relic_pickup");
	trig delete();
	model delete();
	level.var_fb392447 = 1;
	wait(0.05);
	player thread clientfield::set_player_uimodel("zmInventory.widget_sprayer", 1);
	player thread clientfield::set_player_uimodel("zmInventory.player_using_sprayer", 1);
	wait(3.5);
	player thread clientfield::set_player_uimodel("zmInventory.widget_sprayer", 0);
	return;
	ERROR: Bad function call
}

/*
	Name: function_700fe492
	Namespace: namespace_da78430a
	Checksum: 0xED46BA42
	Offset: 0x391A0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 12139
*/
function function_700fe492()
{
	level.var_19c2514c = 0;
	level.var_48961f1d = 0;
	level.var_6e989986 = 0;
	level.var_949b13ef = 0;
	level.var_8a89bb10 = 0;
	level.var_d3686a94 = 0;
	key = GetEnt("vril_quest_place", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Insert Vril Device");
	key thread function_2c78a480();
	thread function_fa59f660();
}

/*
	Name: function_2c78a480
	Namespace: namespace_da78430a
	Checksum: 0x5775B569
	Offset: 0x39288
	Size: 0x858
	Parameters: 0
	Flags: None
	Line Number: 12164
*/
function function_2c78a480()
{
	level endon("intermission");
	self TriggerEnable(0);
	var_c4a7b0f4 = GetEnt("vril_quest_done", "targetname");
	var_c4a7b0f4 setcursorhint("HINT_NOICON");
	var_c4a7b0f4 setHintString("Hold ^3[{+activate}]^7 to pick Up Charged Vril Device");
	var_c4a7b0f4 TriggerEnable(0);
	while(!level.var_fb392447)
	{
		wait(0.1);
	}
	self TriggerEnable(1);
	self waittill("trigger", player);
	self delete();
	playsoundatposition("death_ray_on", player.origin);
	location = struct::get("vril_place_struct", "targetname");
	model = GetEnt("vril_device", "targetname");
	model moveto(location.origin, 0.2, 0.05, 0.05);
	model.angles = VectorScale((0, 0, -1), 25.3012);
	FX = spawn("script_model", (-479.25, -1622, -545.25));
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["stormfuse"], FX, "tag_origin");
	level.var_19c2514c = 1;
	wait(0.1);
	level thread LUI::screen_flash(0.05, 0.5, 0.05, 0.8, "white");
	wait(2);
	FX delete();
	while(!level.var_2aa8fb67)
	{
		wait(0.1);
	}
	var_c4a7b0f4 TriggerEnable(1);
	fx2 = spawn("script_model", (-479.5, -1618.5, -548.25));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_planetrail", 1);
	var_c4a7b0f4 waittill("trigger", player);
	var_c4a7b0f4 delete();
	fx2 clientfield::set("fx_planetrail", 0);
	fx2 delete();
	model delete();
	playsoundatposition("finish", player.origin);
	wait(1);
	location1 = struct::get("vril_sarcophagus_struct", "targetname");
	model2 = GetEnt("vril_sarcophagus", "targetname");
	model2 moveto(location1.origin, 3, 0.05, 0.05);
	model3 = GetEnt("vril_sarcophagus_stone", "targetname");
	model3 connectpaths();
	model3 MoveZ(-62, 3);
	playsoundatposition("pyramid_open2", (-469.25, -1615.5, -507));
	wait(0.5);
	var_fb2c4b25 = spawn("script_model", (-474.75, -1591.75, -590.25));
	var_fb2c4b25.angles = VectorScale((1, 0, 0), 270);
	var_fb2c4b25 SetModel("tag_origin");
	PlayFXOnTag(level._effect["dust"], var_fb2c4b25, "tag_origin");
	wait(2.5);
	playsoundatposition("move", (-469.25, -1615.5, -507));
	var_be607d78 = GetEnt("vril_sarcophagus_stone2", "targetname");
	var_be607d78 connectpaths();
	var_be607d78 MoveY(100, 3);
	wait(3);
	FX3 = spawn("script_model", (-480.5, -1534.75, -522.5));
	FX3.angles = VectorScale((0, 1, 0), 270);
	FX3 SetModel("tag_origin");
	PlayFXOnTag(level._effect["wallending"], FX3, "tag_origin");
	playsoundatposition("punch_imp_wall_00", (-480.5, -1534.75, -522.5));
	var_e462f7e1 = GetEnt("vril_sarcophagus_wall", "targetname");
	var_e462f7e1 delete();
	var_a65724a = GetEnt("vril_sarcophagus_clip", "targetname");
	var_a65724a delete();
	wait(10);
	FX3 delete();
	var_fb2c4b25 delete();
}

/*
	Name: function_fa59f660
	Namespace: namespace_da78430a
	Checksum: 0x51EE9CA3
	Offset: 0x39AE8
	Size: 0x6840
	Parameters: 0
	Flags: None
	Line Number: 12251
*/
function function_fa59f660()
{
	level endon("intermission");
	while(!level.var_19c2514c)
	{
		wait(0.25);
	}
	location = struct::get("keeper_start_struct", "targetname");
	location1 = struct::get("keeper_1_struct", "targetname");
	location2 = struct::get("keeper_2_struct", "targetname");
	location3 = struct::get("keeper_3_struct", "targetname");
	var_e8943b5c = struct::get("keeper_4_struct", "targetname");
	var_e96b5c5 = struct::get("keeper_5_struct", "targetname");
	var_3499302e = struct::get("keeper_6_struct", "targetname");
	var_5a9baa97 = struct::get("keeper_7_struct", "targetname");
	var_20767e70 = struct::get("keeper_8_struct", "targetname");
	var_4678f8d9 = struct::get("keeper_9_struct", "targetname");
	var_a02e6443 = struct::get("keeper_10_struct", "targetname");
	var_7a2be9da = struct::get("keeper_11_struct", "targetname");
	var_54296f71 = struct::get("keeper_12_struct", "targetname");
	var_2e26f508 = struct::get("keeper_13_struct", "targetname");
	var_38384de7 = struct::get("keeper_14_struct", "targetname");
	var_1235d37e = struct::get("keeper_15_struct", "targetname");
	var_ec335915 = struct::get("keeper_16_struct", "targetname");
	var_c630deac = struct::get("keeper_17_struct", "targetname");
	var_701a90fb = struct::get("keeper_18_struct", "targetname");
	var_4a181692 = struct::get("keeper_19_struct", "targetname");
	var_2002feee = struct::get("keeper_20_struct", "targetname");
	var_46057957 = struct::get("keeper_21_struct", "targetname");
	var_d3fe0a1c = struct::get("keeper_22_struct", "targetname");
	var_fa008485 = struct::get("keeper_23_struct", "targetname");
	var_87f9154a = struct::get("keeper_24_struct", "targetname");
	var_adfb8fb3 = struct::get("keeper_25_struct", "targetname");
	var_3bf42078 = struct::get("keeper_26_struct", "targetname");
	var_61f69ae1 = struct::get("keeper_27_struct", "targetname");
	var_efef2ba6 = struct::get("keeper_28_struct", "targetname");
	var_15f1a60f = struct::get("keeper_29_struct", "targetname");
	var_de4b17f9 = struct::get("keeper_30_struct", "targetname");
	var_b8489d90 = struct::get("keeper_31_struct", "targetname");
	var_2a500ccb = struct::get("keeper_32_struct", "targetname");
	var_44d9262 = struct::get("keeper_33_struct", "targetname");
	var_7655019d = struct::get("keeper_34_struct", "targetname");
	var_50528734 = struct::get("keeper_35_struct", "targetname");
	var_c259f66f = struct::get("keeper_36_struct", "targetname");
	var_9c577c06 = struct::get("keeper_37_struct", "targetname");
	var_e5eeb41 = struct::get("keeper_38_struct", "targetname");
	var_e85c70d8 = struct::get("keeper_39_struct", "targetname");
	var_5ce27e24 = struct::get("keeper_40_struct", "targetname");
	var_82e4f88d = struct::get("keeper_41_struct", "targetname");
	var_a8e772f6 = struct::get("keeper_42_struct", "targetname");
	var_cee9ed5f = struct::get("keeper_43_struct", "targetname");
	var_c4d89480 = struct::get("keeper_44_struct", "targetname");
	var_eadb0ee9 = struct::get("keeper_45_struct", "targetname");
	var_10dd8952 = struct::get("keeper_46_struct", "targetname");
	var_36e003bb = struct::get("keeper_47_struct", "targetname");
	var_8cf6516c = struct::get("keeper_48_struct", "targetname");
	var_b2f8cbd5 = struct::get("keeper_49_struct", "targetname");
	var_dcb718cf = struct::get("keeper_50_struct", "targetname");
	var_b6b49e66 = struct::get("keeper_51_struct", "targetname");
	var_90b223fd = struct::get("keeper_52_struct", "targetname");
	var_6aafa994 = struct::get("keeper_53_struct", "targetname");
	var_44ad2f2b = struct::get("keeper_54_struct", "targetname");
	var_1eaab4c2 = struct::get("keeper_55_struct", "targetname");
	var_f8a83a59 = struct::get("keeper_56_struct", "targetname");
	var_d2a5bff0 = struct::get("keeper_57_struct", "targetname");
	var_ccaec17 = struct::get("keeper_58_struct", "targetname");
	var_e6c871ae = struct::get("keeper_59_struct", "targetname");
	var_5b4e7efa = struct::get("keeper_60_struct", "targetname");
	var_8150f963 = struct::get("keeper_61_struct", "targetname");
	var_f498a28 = struct::get("keeper_62_struct", "targetname");
	var_354c0491 = struct::get("keeper_63_struct", "targetname");
	var_f358689e = struct::get("keeper_64_struct", "targetname");
	var_195ae307 = struct::get("keeper_65_struct", "targetname");
	var_a75373cc = struct::get("keeper_66_struct", "targetname");
	var_cd55ee35 = struct::get("keeper_67_struct", "targetname");
	var_2b3aabb2 = struct::get("keeper_68_struct", "targetname");
	var_513d261b = struct::get("keeper_69_struct", "targetname");
	var_d9e5e525 = struct::get("keeper_70_struct", "targetname");
	var_b3e36abc = struct::get("keeper_71_struct", "targetname");
	var_25ead9f7 = struct::get("keeper_72_struct", "targetname");
	var_ffe85f8e = struct::get("keeper_73_struct", "targetname");
	var_41dbfb81 = struct::get("keeper_74_struct", "targetname");
	var_1bd98118 = struct::get("keeper_75_struct", "targetname");
	var_8de0f053 = struct::get("keeper_76_struct", "targetname");
	var_67de75ea = struct::get("keeper_77_struct", "targetname");
	var_a9d211dd = struct::get("keeper_78_struct", "targetname");
	var_83cf9774 = struct::get("keeper_79_struct", "targetname");
	var_eab0b0e0 = struct::get("keeper_80_struct", "targetname");
	var_10b32b49 = struct::get("keeper_81_struct", "targetname");
	var_36b5a5b2 = struct::get("keeper_82_struct", "targetname");
	var_5cb8201b = struct::get("keeper_83_struct", "targetname");
	var_82ba9a84 = struct::get("keeper_84_struct", "targetname");
	var_a8bd14ed = struct::get("keeper_85_struct", "targetname");
	var_cebf8f56 = struct::get("keeper_86_struct", "targetname");
	var_f4c209bf = struct::get("keeper_87_struct", "targetname");
	var_1ac48428 = struct::get("keeper_88_struct", "targetname");
	var_40c6fe91 = struct::get("keeper_89_struct", "targetname");
	var_6948170b = struct::get("keeper_90_struct", "targetname");
	var_43459ca2 = struct::get("keeper_91_struct", "targetname");
	var_1d432239 = struct::get("keeper_92_struct", "targetname");
	var_f740a7d0 = struct::get("keeper_93_struct", "targetname");
	var_15200af = struct::get("keeper_94_struct", "targetname");
	var_db4f8646 = struct::get("keeper_95_struct", "targetname");
	var_b54d0bdd = struct::get("keeper_96_struct", "targetname");
	var_8f4a9174 = struct::get("keeper_97_struct", "targetname");
	var_995bea53 = struct::get("keeper_98_struct", "targetname");
	var_73596fea = struct::get("keeper_99_struct", "targetname");
	var_cc2f7c09 = struct::get("keeper_100_struct", "targetname");
	var_a62d01a0 = struct::get("keeper_101_struct", "targetname");
	var_183470db = struct::get("keeper_102_struct", "targetname");
	var_f231f672 = struct::get("keeper_103_struct", "targetname");
	var_643965ad = struct::get("keeper_104_struct", "targetname");
	var_3e36eb44 = struct::get("keeper_105_struct", "targetname");
	var_b03e5a7f = struct::get("keeper_106_struct", "targetname");
	var_8a3be016 = struct::get("keeper_107_struct", "targetname");
	var_fc434f51 = struct::get("keeper_108_struct", "targetname");
	var_d640d4e8 = struct::get("keeper_109_struct", "targetname");
	var_caa2e7e = struct::get("keeper_110_struct", "targetname");
	var_32aca8e7 = struct::get("keeper_111_struct", "targetname");
	var_c0a539ac = struct::get("keeper_112_struct", "targetname");
	var_e6a7b415 = struct::get("keeper_113_struct", "targetname");
	var_74a044da = struct::get("keeper_114_struct", "targetname");
	var_9aa2bf43 = struct::get("keeper_115_struct", "targetname");
	var_289b5008 = struct::get("keeper_116_struct", "targetname");
	var_4e9dca71 = struct::get("keeper_117_struct", "targetname");
	var_dc965b36 = struct::get("keeper_118_struct", "targetname");
	var_298d59f = struct::get("keeper_119_struct", "targetname");
	var_8e12c853 = struct::get("keeper_120_struct", "targetname");
	var_68104dea = struct::get("keeper_121_struct", "targetname");
	var_420dd381 = struct::get("keeper_122_struct", "targetname");
	var_1c0b5918 = struct::get("keeper_123_struct", "targetname");
	var_261cb1f7 = struct::get("keeper_124_struct", "targetname");
	var_1a378e = struct::get("keeper_125_struct", "targetname");
	var_da17bd25 = struct::get("keeper_126_struct", "targetname");
	var_b41542bc = struct::get("keeper_127_struct", "targetname");
	var_5dfef50b = struct::get("keeper_128_struct", "targetname");
	var_37fc7aa2 = struct::get("keeper_129_struct", "targetname");
	var_f7b6228 = struct::get("keeper_130_struct", "targetname");
	var_357ddc91 = struct::get("keeper_131_struct", "targetname");
	var_5b8056fa = struct::get("keeper_stage2_struct_start", "targetname");
	model2 = spawn("script_model", location.origin);
	model2.angles = (0, 0, 0);
	model2 SetModel("tag_origin");
	model = spawn("script_model", location.origin);
	model.angles = VectorScale((0, 1, 0), 270);
	model SetModel("c_zom_zod_keeper_red_fb");
	PlayFXOnTag(level._effect["keepertrail"], model, "tag_aim");
	model clientfield::set("fx_keeperglow", 1);
	model EnableLinkTo();
	model LinkTo(model2);
	wait(0.5);
	model useanimtree(-1);
	model AnimScripted("ai_zombie_zod_keeper_walk_idle", model.origin, model.angles, %ai_zombie_zod_keeper_walk_idle);
	wait(0.8);
	model StopAnimScripted();
	wait(0.1);
	model2 moveto(location1.origin, 1, 0.01, 0.01);
	model useanimtree(-1);
	model AnimScripted("ai_zombie_zod_keeper_walk_v2", model.origin, model.angles, %ai_zombie_zod_keeper_walk_v2);
	wait(1);
	model2 moveto(location2.origin, 0.56, 0.01, 0.01);
	model2 RotateYaw(180, 3.86, 0.15, 0.15);
	wait(0.56);
	model2 moveto(location3.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_e8943b5c.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_e96b5c5.origin, 0.5, 0.01, 0.01);
	wait(0.5);
	model2 moveto(var_3499302e.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_5a9baa97.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_20767e70.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_4678f8d9.origin, 1.5, 0.01, 0.01);
	wait(1.5);
	model2 moveto(var_a02e6443.origin, 2.55, 0.01, 0.01);
	model2 RotateYaw(-10, 2.55, 0.15, 0.15);
	wait(2.55);
	model2 moveto(var_7a2be9da.origin, 0.63, 0.01, 0.01);
	model2 RotateYaw(10, 0.63, 0.15, 0.15);
	wait(0.63);
	model2 moveto(var_54296f71.origin, 0.56, 0.01, 0.01);
	model2 RotateYaw(90, 1.59, 0.15, 0.15);
	wait(0.56);
	model2 moveto(var_2e26f508.origin, 0.53, 0.01, 0.01);
	wait(0.53);
	model2 moveto(var_38384de7.origin, 0.5, 0.01, 0.01);
	wait(0.5);
	model2 moveto(var_1235d37e.origin, 1, 0.01, 0.01);
	wait(1);
	model2 moveto(var_ec335915.origin, 0.56, 0.01, 0.01);
	model2 RotateYaw(-90, 1.12, 0.15, 0.15);
	wait(0.56);
	model2 moveto(var_c630deac.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_701a90fb.origin, 0.75, 0.01, 0.01);
	wait(0.75);
	model2 moveto(var_4a181692.origin, 1.5, 0.01, 0.01);
	wait(1.5);
	model2 moveto(var_2002feee.origin, 0.55, 0.01, 0.01);
	model2 RotateYaw(-90, 3.29, 0.15, 0.15);
	wait(0.55);
	model2 moveto(var_46057957.origin, 0.63, 0.01, 0.01);
	wait(0.63);
	model2 moveto(var_d3fe0a1c.origin, 0.55, 0.01, 0.01);
	wait(0.55);
	model2 moveto(var_fa008485.origin, 0.51, 0.01, 0.01);
	wait(0.51);
	model2 moveto(var_87f9154a.origin, 0.49, 0.01, 0.01);
	wait(0.49);
	model2 moveto(var_adfb8fb3.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_3bf42078.origin, 1.25, 0.01, 0.01);
	wait(1.25);
	model2 moveto(var_61f69ae1.origin, 0.52, 0.01, 0.01);
	model2 RotateYaw(-90, 2.43, 0.15, 0.15);
	wait(0.52);
	model2 moveto(var_efef2ba6.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_15f1a60f.origin, 0.71, 0.01, 0.01);
	wait(0.71);
	model2 moveto(var_de4b17f9.origin, 0.64, 0.01, 0.01);
	wait(0.64);
	model2 moveto(var_b8489d90.origin, 3, 0.01, 0.01);
	wait(3);
	model2 moveto(var_2a500ccb.origin, 0.63, 0.01, 0.01);
	model2 RotateYaw(180, 3.15, 0.15, 0.15);
	wait(0.63);
	model2 moveto(var_44d9262.origin, 0.63, 0.01, 0.01);
	wait(0.63);
	model2 moveto(var_7655019d.origin, 0.64, 0.01, 0.01);
	wait(0.64);
	model2 moveto(var_50528734.origin, 0.73, 0.01, 0.01);
	wait(0.73);
	model2 moveto(var_c259f66f.origin, 0.52, 0.01, 0.01);
	wait(0.52);
	model2 moveto(var_9c577c06.origin, 2.25, 0.01, 0.01);
	wait(2.25);
	model2 moveto(var_e5eeb41.origin, 0.56, 0.01, 0.01);
	model2 RotateYaw(-180, 3.44, 0.15, 0.15);
	wait(0.56);
	model2 moveto(var_e85c70d8.origin, 0.63, 0.01, 0.01);
	wait(0.63);
	model2 moveto(var_5ce27e24.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_82e4f88d.origin, 0.64, 0.01, 0.01);
	wait(0.64);
	model2 moveto(var_a8e772f6.origin, 0.53, 0.01, 0.01);
	wait(0.53);
	model2 moveto(var_cee9ed5f.origin, 0.52, 0.01, 0.01);
	wait(0.52);
	model2 moveto(var_c4d89480.origin, 1, 0.01, 0.01);
	wait(1);
	model2 moveto(var_eadb0ee9.origin, 1, 0.01, 0.01);
	wait(1);
	model2 moveto(var_10dd8952.origin, 0.76, 0.01, 0.01);
	model2 RotateYaw(90, 1.55, 0.15, 0.15);
	wait(0.76);
	model2 moveto(var_36e003bb.origin, 0.79, 0.01, 0.01);
	wait(0.79);
	model2 moveto(var_8cf6516c.origin, 1.88, 0.01, 0.01);
	wait(1.88);
	model2 moveto(var_b2f8cbd5.origin, 0.67, 0.01, 0.01);
	model2 RotateYaw(-90, 1.34, 0.15, 0.15);
	wait(0.67);
	model2 moveto(var_dcb718cf.origin, 0.67, 0.01, 0.01);
	wait(0.67);
	model2 moveto(var_b6b49e66.origin, 1, 0.01, 0.01);
	wait(1);
	model2 moveto(var_90b223fd.origin, 0.73, 0.01, 0.01);
	model2 RotateYaw(-90, 1.4, 0.15, 0.15);
	wait(0.73);
	model2 moveto(var_6aafa994.origin, 0.67, 0.01, 0.01);
	wait(0.67);
	model2 moveto(var_44ad2f2b.origin, 1.76, 0.01, 0.01);
	wait(1.76);
	model2 moveto(var_1eaab4c2.origin, 1.5, 0.01, 0.01);
	wait(1.5);
	model2 moveto(var_f8a83a59.origin, 0.63, 0.01, 0.01);
	model2 RotateYaw(-90, 1.19, 0.15, 0.15);
	wait(0.63);
	model2 moveto(var_d2a5bff0.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model2 RotateYaw(90, 0.75, 0.15, 0.15);
	wait(0.75);
	level.var_48961f1d = 1;
	playsoundatposition("skel_power_activate", (668.5, -1268.75, 29.25));
	var_29d55b73 = struct::get("stone1_struct", "targetname");
	var_473b56cf = spawn("script_model", var_29d55b73.origin);
	var_473b56cf SetModel("p7_zm_ctl_channeling_stone_glow");
	var_473b56cf.angles = VectorScale((1, 0, 0), 270);
	var_e802763e = spawn("script_model", (665.5, -1269, 81.75));
	var_e802763e SetModel("tag_origin");
	var_e802763e.angles = VectorScale((0, 1, 0), 180);
	PlayFXOnTag(level._effect["keeperstone"], var_e802763e, "tag_origin");
	model StopAnimScripted();
	wait(0.1);
	model useanimtree(-1);
	model AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_intro", model.origin, model.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_intro);
	wait(0.8);
	model StopAnimScripted();
	wait(0.1);
	model useanimtree(-1);
	model AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_loop", model.origin, model.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_loop);
	while(!level.var_f632c673)
	{
		wait(0.25);
	}
	var_e802763e delete();
	model StopAnimScripted();
	wait(0.1);
	model2 moveto(var_ccaec17.origin, 1, 0.01, 0.01);
	model useanimtree(-1);
	model AnimScripted("ai_zombie_zod_keeper_walk_v2", model.origin, model.angles, %ai_zombie_zod_keeper_walk_v2);
	wait(1);
	model2 moveto(var_e6c871ae.origin, 1, 0.01, 0.01);
	wait(1);
	model2 moveto(var_5b4e7efa.origin, 1, 0.01, 0.01);
	wait(1);
	model2 moveto(var_8150f963.origin, 1.12, 0.01, 0.01);
	model2 RotateYaw(90, 2.47, 0.15, 0.15);
	wait(1.12);
	model2 moveto(var_f498a28.origin, 0.71, 0.01, 0.01);
	wait(0.71);
	model2 moveto(var_354c0491.origin, 0.64, 0.01, 0.01);
	wait(0.64);
	model2 moveto(var_f358689e.origin, 9, 0.01, 0.01);
	wait(9);
	model2 moveto(var_195ae307.origin, 0.73, 0.01, 0.01);
	model2 RotateYaw(45, 1.44, 0.15, 0.15);
	wait(0.73);
	model2 moveto(var_a75373cc.origin, 0.71, 0.01, 0.01);
	wait(0.71);
	model2 moveto(var_cd55ee35.origin, 2.13, 0.01, 0.01);
	wait(2.13);
	model2 moveto(var_2b3aabb2.origin, 0.73, 0.01, 0.01);
	model2 RotateYaw(-45, 1.36, 0.15, 0.15);
	wait(0.73);
	model2 moveto(var_513d261b.origin, 0.63, 0.01, 0.01);
	wait(0.63);
	model2 moveto(var_d9e5e525.origin, 0.67, 0.01, 0.01);
	model2 RotateYaw(-90, 2.04, 0.15, 0.15);
	wait(0.67);
	model2 moveto(var_b3e36abc.origin, 0.73, 0.01, 0.01);
	wait(0.73);
	model2 moveto(var_25ead9f7.origin, 0.64, 0.01, 0.01);
	wait(0.64);
	model2 moveto(var_ffe85f8e.origin, 1.36, 0.01, 0.01);
	wait(1.36);
	model2 moveto(var_41dbfb81.origin, 2.86, 0.01, 0.01);
	wait(2.86);
	model2 moveto(var_1bd98118.origin, 0.55, 0.01, 0.01);
	model2 RotateYaw(45, 1.2, 0.15, 0.15);
	wait(0.55);
	model2 moveto(var_8de0f053.origin, 0.65, 0.01, 0.01);
	wait(0.65);
	model2 moveto(var_67de75ea.origin, 0.77, 0.01, 0.01);
	wait(0.77);
	model2 moveto(var_a9d211dd.origin, 0.64, 0.01, 0.01);
	model2 RotateYaw(-135, 2.16, 0.15, 0.15);
	wait(0.64);
	model2 moveto(var_83cf9774.origin, 0.73, 0.01, 0.01);
	wait(0.73);
	model2 moveto(var_eab0b0e0.origin, 0.79, 0.01, 0.01);
	wait(0.79);
	model2 RotateYaw(-135, 0.75, 0.15, 0.15);
	wait(0.75);
	level.var_6e989986 = 1;
	var_b7cdec38 = struct::get("stone2_struct", "targetname");
	playsoundatposition("skel_power_activate", (-700.75, -3296.75, 257.25));
	var_d533e794 = spawn("script_model", var_b7cdec38.origin);
	var_d533e794 SetModel("p7_zm_ctl_channeling_stone_glow");
	var_d533e794.angles = (0, 270, -90);
	var_c1fffbd5 = spawn("script_model", (-725.25, -3297.25, 306.5));
	var_c1fffbd5 SetModel("tag_origin");
	var_c1fffbd5.angles = (0, 0, 0);
	PlayFXOnTag(level._effect["keeperstone"], var_c1fffbd5, "tag_origin");
	model StopAnimScripted();
	wait(0.1);
	model useanimtree(-1);
	model AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_intro", model.origin, model.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_intro);
	wait(0.8);
	model StopAnimScripted();
	wait(0.1);
	model useanimtree(-1);
	model AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_loop", model.origin, model.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_loop);
	while(!level.var_10be5a2)
	{
		wait(0.25);
	}
	var_c1fffbd5 delete();
	model StopAnimScripted();
	wait(0.1);
	model2 moveto(var_83cf9774.origin, 0.79, 0.01, 0.01);
	model2 RotateYaw(-45, 0.79, 0.15, 0.15);
	model useanimtree(-1);
	model AnimScripted("ai_zombie_zod_keeper_walk_v2", model.origin, model.angles, %ai_zombie_zod_keeper_walk_v2);
	wait(0.79);
	model2 moveto(var_a9d211dd.origin, 0.73, 0.01, 0.01);
	model2 RotateYaw(135, 2.14, 0.15, 0.15);
	wait(0.73);
	model2 moveto(var_67de75ea.origin, 0.64, 0.01, 0.01);
	wait(0.64);
	model2 moveto(var_8de0f053.origin, 0.77, 0.01, 0.01);
	wait(0.77);
	model2 moveto(var_1bd98118.origin, 0.65, 0.01, 0.01);
	model2 RotateYaw(-45, 0.65, 0.15, 0.15);
	wait(0.65);
	model2 moveto(var_41dbfb81.origin, 0.55, 0.01, 0.01);
	wait(0.55);
	model2 moveto(var_ffe85f8e.origin, 2.86, 0.01, 0.01);
	wait(2.86);
	model2 moveto(var_25ead9f7.origin, 1.36, 0.01, 0.01);
	wait(1.36);
	model2 moveto(var_b3e36abc.origin, 0.64, 0.01, 0.01);
	model2 RotateYaw(90, 2.04, 0.15, 0.15);
	wait(0.64);
	model2 moveto(var_d9e5e525.origin, 0.73, 0.01, 0.01);
	wait(0.73);
	model2 moveto(var_513d261b.origin, 0.67, 0.01, 0.01);
	wait(0.67);
	model2 moveto(var_2b3aabb2.origin, 0.63, 0.01, 0.01);
	wait(0.63);
	model2 moveto(var_cd55ee35.origin, 0.73, 0.01, 0.01);
	model2 RotateYaw(45, 0.73, 0.15, 0.15);
	wait(0.73);
	model2 moveto(var_a75373cc.origin, 2.13, 0.01, 0.01);
	wait(2.13);
	model2 moveto(var_195ae307.origin, 0.71, 0.01, 0.01);
	wait(0.71);
	model2 moveto(var_f358689e.origin, 0.73, 0.01, 0.01);
	model2 RotateYaw(-45, 0.73, 0.15, 0.15);
	wait(0.73);
	model2 moveto(var_354c0491.origin, 9, 0.01, 0.01);
	wait(9);
	model2 moveto(var_10b32b49.origin, 6.5, 0.01, 0.01);
	wait(6.5);
	model2 moveto(var_36b5a5b2.origin, 0.79, 0.01, 0.01);
	model2 RotateYaw(-90, 2.35, 0.15, 0.15);
	wait(0.79);
	model2 moveto(var_5cb8201b.origin, 0.8, 0.01, 0.01);
	wait(0.8);
	model2 moveto(var_82ba9a84.origin, 0.76, 0.01, 0.01);
	wait(0.76);
	model2 moveto(var_5ce27e24.origin, 2.63, 0.01, 0.01);
	wait(2.63);
	model2 moveto(var_82e4f88d.origin, 0.64, 0.01, 0.01);
	model2 RotateYaw(-90, 2.33, 0.15, 0.15);
	wait(0.64);
	model2 moveto(var_a8e772f6.origin, 0.53, 0.01, 0.01);
	wait(0.53);
	model2 moveto(var_cee9ed5f.origin, 0.52, 0.01, 0.01);
	wait(0.52);
	model2 moveto(var_c4d89480.origin, 1, 0.01, 0.01);
	wait(1);
	model2 moveto(var_a8bd14ed.origin, 0.71, 0.01, 0.01);
	model2 RotateYaw(-90, 1.4, 0.15, 0.15);
	wait(0.71);
	model2 moveto(var_cebf8f56.origin, 0.69, 0.01, 0.01);
	wait(0.69);
	model2 moveto(var_f4c209bf.origin, 1.69, 0.01, 0.01);
	wait(1.69);
	model2 moveto(var_1ac48428.origin, 0.56, 0.01, 0.01);
	model2 RotateYaw(-90, 1.08, 0.15, 0.15);
	wait(0.56);
	model2 moveto(var_40c6fe91.origin, 0.52, 0.01, 0.01);
	wait(0.52);
	model2 moveto(var_6948170b.origin, 1.19, 0.01, 0.01);
	wait(1.19);
	model2 moveto(var_43459ca2.origin, 0.63, 0.01, 0.01);
	wait(0.63);
	model2 moveto(var_1d432239.origin, 0.8, 0.01, 0.01);
	model2 RotateYaw(90, 1.44, 0.15, 0.15);
	wait(0.8);
	model2 moveto(var_f740a7d0.origin, 0.64, 0.01, 0.01);
	wait(0.64);
	model2 moveto(var_15200af.origin, 0.71, 0.01, 0.01);
	model2 RotateYaw(-90, 1.47, 0.15, 0.15);
	wait(0.71);
	model2 moveto(var_db4f8646.origin, 0.76, 0.01, 0.01);
	wait(0.76);
	model2 moveto(var_b54d0bdd.origin, 4, 0.01, 0.01);
	wait(4);
	model2 moveto(var_8f4a9174.origin, 1.5, 0.01, 0.01);
	model2 RotateYaw(-45, 1.5, 0.15, 0.15);
	wait(1.5);
	model2 RotateYaw(135, 1, 0.15, 0.15);
	wait(1);
	level.var_949b13ef = 1;
	var_ddd066a1 = struct::get("stone3_struct", "targetname");
	playsoundatposition("skel_power_activate", (155.25, 431.25, 333.25));
	var_fb3661fd = spawn("script_model", var_ddd066a1.origin);
	var_fb3661fd SetModel("p7_zm_ctl_channeling_stone_glow");
	var_fb3661fd.angles = VectorScale((1, 0, 0), 270);
	var_9bfd816c = spawn("script_model", (175.25, 432.75, 394.5));
	var_9bfd816c SetModel("tag_origin");
	var_9bfd816c.angles = VectorScale((0, 1, 0), 180);
	PlayFXOnTag(level._effect["keeperstone"], var_9bfd816c, "tag_origin");
	model StopAnimScripted();
	wait(0.1);
	model useanimtree(-1);
	model AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_intro", model.origin, model.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_intro);
	wait(0.8);
	model StopAnimScripted();
	wait(0.1);
	model useanimtree(-1);
	model AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_loop", model.origin, model.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_loop);
	while(!level.var_4f4f1e91)
	{
		wait(0.25);
	}
	var_9bfd816c delete();
	model StopAnimScripted();
	wait(0.1);
	model2 moveto(var_b54d0bdd.origin, 1.5, 0.01, 0.01);
	model2 RotateYaw(90, 1.5, 0.15, 0.15);
	model useanimtree(-1);
	model AnimScripted("ai_zombie_zod_keeper_walk_v2", model.origin, model.angles, %ai_zombie_zod_keeper_walk_v2);
	wait(1.5);
	model2 moveto(var_db4f8646.origin, 4, 0.01, 0.01);
	wait(4);
	model2 moveto(var_15200af.origin, 0.76, 0.01, 0.01);
	model2 RotateYaw(90, 2.11, 0.15, 0.15);
	wait(0.76);
	model2 moveto(var_f740a7d0.origin, 0.71, 0.01, 0.01);
	wait(0.71);
	model2 moveto(var_1d432239.origin, 0.64, 0.01, 0.01);
	wait(0.64);
	model2 moveto(var_43459ca2.origin, 0.8, 0.01, 0.01);
	model2 RotateYaw(-90, 1.43, 0.15, 0.15);
	wait(0.8);
	model2 moveto(var_6948170b.origin, 0.63, 0.01, 0.01);
	wait(0.63);
	model2 moveto(var_40c6fe91.origin, 1.19, 0.01, 0.01);
	wait(1.19);
	model2 moveto(var_1ac48428.origin, 0.52, 0.01, 0.01);
	model2 RotateYaw(90, 1.08, 0.15, 0.15);
	wait(0.52);
	model2 moveto(var_f4c209bf.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_cebf8f56.origin, 1.69, 0.01, 0.01);
	wait(1.69);
	model2 moveto(var_a8bd14ed.origin, 0.69, 0.01, 0.01);
	wait(0.69);
	model2 moveto(var_c4d89480.origin, 0.71, 0.01, 0.01);
	model2 RotateYaw(90, 1.71, 0.15, 0.15);
	wait(0.71);
	model2 moveto(var_cee9ed5f.origin, 1, 0.01, 0.01);
	wait(1);
	model2 moveto(var_a8e772f6.origin, 0.52, 0.01, 0.01);
	model2 RotateYaw(90, 1.69, 0.15, 0.15);
	wait(0.52);
	model2 moveto(var_82e4f88d.origin, 0.53, 0.01, 0.01);
	wait(0.53);
	model2 moveto(var_5ce27e24.origin, 0.64, 0.01, 0.01);
	wait(0.64);
	model2 moveto(var_82ba9a84.origin, 2.6, 0.01, 0.01);
	wait(2.6);
	model2 moveto(var_995bea53.origin, 0.76, 0.01, 0.01);
	model2 RotateYaw(-90, 2.25, 0.15, 0.15);
	wait(0.76);
	model2 moveto(var_73596fea.origin, 0.73, 0.01, 0.01);
	wait(0.73);
	model2 moveto(var_cc2f7c09.origin, 0.76, 0.01, 0.01);
	wait(0.76);
	model2 moveto(var_a62d01a0.origin, 0.84, 0.01, 0.01);
	model2 RotateYaw(-45, 0.84, 0.15, 0.15);
	wait(0.84);
	model2 moveto(var_183470db.origin, 0.76, 0.01, 0.01);
	model2 RotateYaw(55, 0.76, 0.15, 0.15);
	wait(0.76);
	model2 moveto(var_f231f672.origin, 2.03, 0.01, 0.01);
	wait(2.03);
	model2 moveto(var_643965ad.origin, 0.63, 0.01, 0.01);
	model2 RotateYaw(170, 1.34, 0.15, 0.15);
	wait(0.63);
	model2 moveto(var_3e36eb44.origin, 0.71, 0.01, 0.01);
	wait(0.71);
	model2 moveto(var_b03e5a7f.origin, 1.78, 0.01, 0.01);
	wait(1.78);
	model2 moveto(var_8a3be016.origin, 0.56, 0.01, 0.01);
	model2 RotateYaw(-90, 1.12, 0.15, 0.15);
	wait(0.56);
	model2 moveto(var_fc434f51.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model2 moveto(var_d640d4e8.origin, 0.63, 0.01, 0.01);
	wait(0.63);
	model2 moveto(var_caa2e7e.origin, 0.75, 0.01, 0.01);
	wait(0.75);
	model2 moveto(var_32aca8e7.origin, 0.76, 0.01, 0.01);
	model2 RotateYaw(-115, 2.16, 0.15, 0.15);
	wait(0.76);
	model2 moveto(var_c0a539ac.origin, 0.73, 0.01, 0.01);
	wait(0.73);
	model2 moveto(var_e6a7b415.origin, 0.67, 0.01, 0.01);
	wait(0.67);
	model2 RotateYaw(115, 1.5, 0.15, 0.15);
	wait(0.75);
	level.var_8a89bb10 = 1;
	playsoundatposition("skel_power_activate", (-432.75, -53.75, 117.25));
	var_9bdccaae = struct::get("stone4_struct", "targetname");
	var_892ef2c2 = spawn("script_model", var_9bdccaae.origin);
	var_892ef2c2 SetModel("p7_zm_ctl_channeling_stone_glow");
	var_892ef2c2.angles = VectorScale((1, 0, 0), 270);
	var_75fb0703 = spawn("script_model", (-412.5, -53.25, 178.75));
	var_75fb0703 SetModel("tag_origin");
	var_75fb0703.angles = VectorScale((0, 1, 0), 180);
	PlayFXOnTag(level._effect["keeperstone"], var_75fb0703, "tag_origin");
	model StopAnimScripted();
	wait(0.1);
	model useanimtree(-1);
	model AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_intro", model.origin, model.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_intro);
	wait(0.8);
	model StopAnimScripted();
	wait(0.1);
	model useanimtree(-1);
	model AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_loop", model.origin, model.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_loop);
	while(!level.var_ff850eb0)
	{
		wait(0.25);
	}
	level notify("hash_f1c5673d");
	model StopAnimScripted();
	wait(0.1);
	var_75fb0703 delete();
	model clientfield::set("fx_keeperglow", 0);
	model delete();
	model2 delete();
	model3 = spawn("script_model", var_e6a7b415.origin);
	model3.angles = (0, 0, 0);
	model3 SetModel("tag_origin");
	var_be607d78 = spawn("script_model", var_e6a7b415.origin);
	var_be607d78.angles = VectorScale((0, 1, 0), 180);
	var_be607d78 SetModel("c_zom_zod_keeper_fb");
	var_be607d78 clientfield::set("fx_keepertrail2", 1);
	var_be607d78 EnableLinkTo();
	var_be607d78 LinkTo(model3);
	var_e462f7e1 = spawn("script_model", var_e6a7b415.origin);
	var_e462f7e1.angles = (0, 0, 0);
	var_e462f7e1 SetModel("tag_origin");
	var_e462f7e1 clientfield::set("fx_keeperspawn", 1);
	wait(0.1);
	var_be607d78 useanimtree(-1);
	var_be607d78 AnimScripted("ai_zombie_zod_keeper_walk_v2", var_be607d78.origin, var_be607d78.angles, %ai_zombie_zod_keeper_walk_v2);
	wait(0.25);
	model3 moveto(var_74a044da.origin, 0.79, 0.01, 0.01);
	model3 RotateYaw(-30, 0.79, 0.15, 0.15);
	wait(0.79);
	model3 moveto(var_9aa2bf43.origin, 0.79, 0.01, 0.01);
	wait(0.79);
	model3 moveto(var_289b5008.origin, 0.87, 0.01, 0.01);
	wait(0.87);
	model3 moveto(var_4e9dca71.origin, 0.92, 0.01, 0.01);
	model3 RotateYaw(-60, 1.71, 0.15, 0.15);
	wait(0.92);
	model3 moveto(var_dc965b36.origin, 0.79, 0.01, 0.01);
	wait(0.79);
	model3 moveto(var_298d59f.origin, 2, 0.01, 0.01);
	wait(2);
	model3 moveto(var_8e12c853.origin, 0.8, 0.01, 0.01);
	model3 RotateYaw(-90, 1.56, 0.15, 0.15);
	wait(0.8);
	model3 moveto(var_68104dea.origin, 0.76, 0.01, 0.01);
	wait(0.76);
	model3 moveto(var_420dd381.origin, 0.79, 0.01, 0.01);
	model3 RotateYaw(-90, 1.5, 0.15, 0.15);
	wait(0.79);
	model3 moveto(var_1c0b5918.origin, 0.71, 0.01, 0.01);
	wait(0.71);
	model3 moveto(var_261cb1f7.origin, 3, 0.01, 0.01);
	wait(3);
	model3 moveto(var_1a378e.origin, 1, 0.01, 0.01);
	wait(1);
	model3 moveto(var_da17bd25.origin, 1.34, 0.01, 0.01);
	wait(1.34);
	model3 moveto(var_b41542bc.origin, 0.84, 0.01, 0.01);
	model3 RotateYaw(45, 0.84, 0.15, 0.15);
	wait(0.84);
	model3 moveto(var_5dfef50b.origin, 0.8, 0.01, 0.01);
	wait(0.8);
	model3 moveto(var_d3fe0a1c.origin, 1.58, 0.01, 0.01);
	model3 RotateYaw(-45, 0.75, 0.15, 0.15);
	wait(1.58);
	model3 moveto(var_46057957.origin, 0.55, 0.01, 0.01);
	model3 RotateYaw(-45, 0.55, 0.15, 0.15);
	wait(0.55);
	model3 moveto(var_2002feee.origin, 0.63, 0.01, 0.01);
	wait(0.63);
	model3 moveto(var_4a181692.origin, 0.55, 0.01, 0.01);
	model3 RotateYaw(45, 0.55, 0.15, 0.15);
	wait(0.55);
	model3 moveto(var_701a90fb.origin, 1.5, 0.01, 0.01);
	wait(1.5);
	model3 moveto(var_c630deac.origin, 0.75, 0.01, 0.01);
	wait(0.75);
	model3 moveto(var_ec335915.origin, 0.56, 0.01, 0.01);
	model3 RotateYaw(90, 1.12, 0.15, 0.15);
	wait(0.56);
	model3 moveto(var_1235d37e.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model3 moveto(var_38384de7.origin, 1, 0.01, 0.01);
	wait(1);
	model3 moveto(var_2e26f508.origin, 0.5, 0.01, 0.01);
	wait(0.5);
	model3 moveto(var_54296f71.origin, 0.53, 0.01, 0.01);
	model3 RotateYaw(-90, 1.09, 0.15, 0.15);
	wait(0.53);
	model3 moveto(var_7a2be9da.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model3 moveto(var_a02e6443.origin, 0.63, 0.01, 0.01);
	wait(0.63);
	model3 moveto(var_4678f8d9.origin, 2.5, 0.01, 0.01);
	model3 RotateYaw(-10, 0.75, 0.15, 0.15);
	wait(2.5);
	model3 moveto(var_20767e70.origin, 1.5, 0.01, 0.01);
	model3 RotateYaw(10, 0.75, 0.15, 0.15);
	wait(1.5);
	model3 moveto(var_5a9baa97.origin, 0.56, 0.01, 0.01);
	model3 RotateYaw(-180, 3.86, 0.15, 0.15);
	wait(0.56);
	model3 moveto(var_3499302e.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model3 moveto(var_e96b5c5.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model3 moveto(var_e8943b5c.origin, 0.5, 0.01, 0.01);
	wait(0.5);
	model3 moveto(location3.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model3 moveto(location2.origin, 0.56, 0.01, 0.01);
	wait(0.56);
	model3 moveto(location1.origin, 0.56, 0.01, 0.01);
	wait(0.75);
	model3 moveto(location.origin, 1, 0.01, 0.01);
	wait(1);
	var_be607d78 StopAnimScripted();
	wait(0.1);
	var_be607d78 useanimtree(-1);
	var_be607d78 AnimScripted("ai_zm_dlc1_corrupted_keeper_float_idle", var_be607d78.origin, var_be607d78.angles, %ai_zm_dlc1_corrupted_keeper_float_idle);
	wait(0.8);
	level.var_d3686a94 = 1;
	wait(0.1);
	while(!level.var_3b0f9cea)
	{
		wait(0.25);
	}
	playsoundatposition("trans_outof", (-481.25, -1656.25, -567.75));
	model3 moveto(var_5b8056fa.origin, 3, 0.01, 0.01);
	wait(3);
	level thread LUI::screen_flash(0.05, 0.5, 0.05, 0.8, "white");
	var_a65724a = spawn("script_model", var_5b8056fa.origin);
	var_a65724a.angles = (0, 0, 0);
	var_a65724a SetModel("tag_origin");
	var_a65724a clientfield::set("fx_keeperspawn", 1);
	var_be607d78 clientfield::set("fx_keepertrail2", 0);
	var_e462f7e1 clientfield::set("fx_keeperspawn", 0);
	model3 delete();
	var_be607d78 delete();
	var_e462f7e1 delete();
	wait(3);
	var_a65724a clientfield::set("fx_keeperspawn", 0);
	var_a65724a delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fc2bbf49
	Namespace: namespace_da78430a
	Checksum: 0x4C8E125A
	Offset: 0x40330
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 13028
*/
function function_fc2bbf49()
{
	level.var_15a919a9 = 0;
	level.var_d2327f36 = 0;
	level.var_414bf04e = 0;
	level.var_af025980 = 0;
	level.var_63f1ebd8 = 0;
	level.var_92bf2877 = 0;
	level.var_358e0ebd = 0;
	level.var_4615dd66 = 0;
	level.var_3b0f9cea = 0;
	level.var_506998bb = 0;
	key = GetEnt("vril_quest_keeper_boss", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Energy Surge Needed to Start Lockdown");
	key thread function_ebb80f87();
	thread function_4a933227();
	thread function_5e56bb4c();
	thread function_eeb1da7f();
	thread function_21239d91();
	thread function_201a191e();
}

/*
	Name: function_ebb80f87
	Namespace: namespace_da78430a
	Checksum: 0x94A19E5
	Offset: 0x40488
	Size: 0xAE8
	Parameters: 0
	Flags: None
	Line Number: 13061
*/
function function_ebb80f87()
{
	level endon("intermission");
	var_bd228e76 = GetEnt("keeper_boss_players", "targetname");
	var_c6ea5b40 = GetEnt("keeper_boss_players2", "targetname");
	var_ececd5a9 = GetEnt("keeper_boss_players3", "targetname");
	var_aaf939b6 = GetEnt("vril_quest_all_players", "targetname");
	var_aaf939b6 setcursorhint("HINT_NOICON");
	var_aaf939b6 setHintString("All Players Required to Start Lockdown");
	var_bd228e76 TriggerEnable(0);
	var_c6ea5b40 TriggerEnable(0);
	var_ececd5a9 TriggerEnable(0);
	var_aaf939b6 TriggerEnable(0);
	self TriggerEnable(0);
	while(!level.var_d3686a94)
	{
		wait(0.25);
	}
	fx2 = spawn("script_model", (-479.5, -1725.5, -570.25));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_stormflash", 1);
	var_c6ea5b40 TriggerEnable(1);
	var_ececd5a9 TriggerEnable(1);
	self TriggerEnable(1);
	while(1)
	{
		var_ececd5a9 waittill("trigger", player);
		while(1)
		{
			var_c6ea5b40 waittill("trigger", player);
			while(1)
			{
				level.gravity_trap_spike_watcher = &function_25a8e486;
				if(level.var_506998bb == 1)
				{
					level.var_3b0f9cea = 1;
					wait(0.05);
					if(level.var_3b0f9cea == 1)
					{
						break;
					}
				}
				wait(0.05);
				if(level.var_3b0f9cea == 1)
				{
					break;
				}
			}
			wait(0.05);
			if(level.var_3b0f9cea == 1)
			{
				break;
			}
		}
		fx2 clientfield::set("fx_stormflash", 0);
		fx2 delete();
		self delete();
		break;
	}
	var_bd228e76 TriggerEnable(1);
	var_aaf939b6 TriggerEnable(1);
	var_bd228e76 waittill("trigger", player);
	level thread LUI::screen_flash(0.05, 0.5, 0.05, 0.8, "white");
	var_aaf939b6 delete();
	level.var_506998bb = 0;
	level.var_15a919a9 = 1;
	door1 = GetEnt("boss_wall1", "targetname");
	door1 connectpaths();
	door1 MoveZ(376, 0.25);
	door2 = GetEnt("boss_wall2", "targetname");
	door2 connectpaths();
	door2 MoveZ(260, 0.25);
	door3 = GetEnt("boss_wall3", "targetname");
	door3 connectpaths();
	door3 MoveZ(260, 0.25);
	location = struct::get("boss_wall1_struct", "targetname");
	location2 = struct::get("boss_wall1_struct2", "targetname");
	location3 = struct::get("boss_wall2_struct", "targetname");
	var_e8943b5c = struct::get("boss_wall3_struct", "targetname");
	var_e96b5c5 = struct::get("boss_gate1_struct", "targetname");
	FX = spawn("script_model", location.origin);
	FX SetModel("tag_origin");
	FX.angles = VectorScale((0, 1, 0), 270);
	PlayFXOnTag(level._effect["bosswall"], FX, "tag_origin");
	FX3 = spawn("script_model", location3.origin);
	FX3 SetModel("tag_origin");
	FX3.angles = VectorScale((0, 1, 0), 330);
	PlayFXOnTag(level._effect["bosswall"], FX3, "tag_origin");
	var_fb2c4b25 = spawn("script_model", var_e8943b5c.origin);
	var_fb2c4b25 SetModel("tag_origin");
	var_fb2c4b25.angles = VectorScale((0, 1, 0), 210);
	PlayFXOnTag(level._effect["bosswall"], var_fb2c4b25, "tag_origin");
	gate1 = GetEnt("boss_gate1", "targetname");
	gate1 moveto(var_e96b5c5.origin, 0.15, 0.01, 0.01);
	gate2 = GetEnt("boss_gate2", "targetname");
	gate2 moveto(location3.origin, 0.15, 0.01, 0.01);
	var_f43d3793 = GetEnt("boss_gate3", "targetname");
	var_f43d3793 moveto(var_e8943b5c.origin, 0.15, 0.01, 0.01);
	wait(1);
	level.var_3b0f9cea = 0;
	wait(2.25);
	playsoundatposition("shield_rise", (-481.25, -1656.25, -567.75));
	level.var_d2327f36 = 1;
	wait(5);
	playsoundatposition("evil", (-479.75, -1511.25, -340));
	while(!level.var_2aa8fb67)
	{
		wait(0.25);
	}
	door1 delete();
	door2 delete();
	door3 delete();
	gate1 delete();
	gate2 delete();
	var_f43d3793 delete();
	FX delete();
	FX3 delete();
	var_fb2c4b25 delete();
}

/*
	Name: function_4a933227
	Namespace: namespace_da78430a
	Checksum: 0x630AB88B
	Offset: 0x40F78
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 13192
*/
function function_4a933227()
{
	level endon("intermission");
	while(!level.var_d2327f36)
	{
		wait(0.25);
	}
	var_c6ea5b40 = GetEnt("keeper_boss_players2", "targetname");
	e_model = GetEnt("keeper_boss_players3", "targetname");
	wait(130);
	location = struct::get("boss_ammo1", "targetname");
	level thread zm_powerups::specific_powerup_drop("full_ammo", location.origin);
	player = GetPlayers();
	FX = spawn("script_model", (-479.5, -1725.5, -570.25));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_stormflash", 1);
	while(1)
	{
		var_c6ea5b40 waittill("trigger", player);
		while(1)
		{
			level.gravity_trap_spike_watcher = &function_25a8e486;
			if(level.var_506998bb == 1)
			{
				level.var_3b0f9cea = 1;
				wait(0.05);
				if(level.var_3b0f9cea == 1)
				{
					break;
				}
			}
			wait(0.05);
			if(level.var_3b0f9cea == 1)
			{
				break;
			}
		}
		wait(0.05);
		if(level.var_3b0f9cea == 1)
		{
			break;
		}
	}
	wait(3);
	level.var_414bf04e = 1;
	FX clientfield::set("fx_stormflash", 0);
	FX delete();
	level.var_3b0f9cea = 0;
	level.var_506998bb = 0;
	while(!level.var_63f1ebd8)
	{
		wait(0.05);
	}
	while(!level.var_92bf2877)
	{
		wait(0.05);
	}
	while(!level.var_358e0ebd)
	{
		wait(0.05);
	}
	while(!level.var_4615dd66)
	{
		wait(0.05);
	}
	level.var_af025980 = 1;
	playsoundatposition("shield_collapse", (-479.75, -1511.25, -340));
	wait(3);
	level thread LUI::screen_flash(0.05, 0.5, 0.05, 0.8, "white");
	wait(3);
	level thread zm_powerups::specific_powerup_drop("full_ammo", location.origin);
	return;
	waittillframeend;
}

/*
	Name: function_5e56bb4c
	Namespace: namespace_da78430a
	Checksum: 0xA6FC1FF5
	Offset: 0x41318
	Size: 0x980
	Parameters: 0
	Flags: None
	Line Number: 13277
*/
function function_5e56bb4c()
{
	level endon("intermission");
	while(!level.var_3b0f9cea)
	{
		wait(0.25);
	}
	location1 = struct::get("keeper_struct_rune_prison", "targetname");
	location2 = struct::get("keeper_struct_rune_prison2", "targetname");
	model2 = spawn("script_model", location1.origin);
	model2.angles = (0, 0, 0);
	model2 SetModel("tag_origin");
	var_7c6ce185 = spawn("script_model", location1.origin);
	var_7c6ce185.angles = VectorScale((0, 1, 0), 300);
	var_7c6ce185 SetModel("c_zom_zod_keeper_fb_rune_prison");
	FX = spawn("script_model", location1.origin);
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_keeperspawn", 1);
	var_7c6ce185 EnableLinkTo();
	var_7c6ce185 LinkTo(model2);
	var_7c6ce185 useanimtree(-1);
	var_7c6ce185 AnimScripted("ai_zm_dlc1_corrupted_keeper_float_idle", var_7c6ce185.origin, var_7c6ce185.angles, %ai_zm_dlc1_corrupted_keeper_float_idle);
	var_90f3dd44 = GetEnt("keeper_shield_rune_prison", "targetname");
	var_90f3dd44 Hide();
	var_90f3dd44 moveto((-318.642, -1861.61, -454), 0.2, 0.01, 0.01);
	var_90f3dd44 show();
	wait(0.2);
	while(!level.var_414bf04e)
	{
		wait(0.25);
	}
	var_90f3dd44 delete();
	fx2 = spawn("script_model", (-318.5, -1861.5, -445));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbred", 1);
	PlayFXOnTag(level._effect["keepertrailrune"], var_7c6ce185, "tag_aim");
	var_7c6ce185 setcandamage(1);
	while(1)
	{
		var_7c6ce185 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_rune_prison4" || weapon.name == "elemental_bow_rune_prison2" || weapon.name == "elemental_bow_rune_prison3" || weapon.name == "elemental_bow_rune_prison")
		{
			break;
		}
	}
	playsoundatposition("pain_00", (-318.642, -1861.61, -494.75));
	var_7c6ce185 StopAnimScripted();
	wait(0.1);
	model2 moveto(location2.origin, 2, 0.01, 0.01);
	var_7c6ce185 useanimtree(-1);
	var_7c6ce185 AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_intro", var_7c6ce185.origin, var_7c6ce185.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_intro);
	wait(0.8);
	var_7c6ce185 StopAnimScripted();
	wait(0.1);
	var_7c6ce185 useanimtree(-1);
	var_7c6ce185 AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_loop", var_7c6ce185.origin, var_7c6ce185.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_loop);
	level.var_63f1ebd8 = 1;
	while(!level.var_af025980)
	{
		wait(0.1);
	}
	wait(3);
	var_7c6ce185 StopAnimScripted();
	var_7c6ce185 delete();
	model2 delete();
	var_4c590e3d = spawn("script_model", location2.origin);
	var_4c590e3d.angles = (0, 0, 0);
	var_4c590e3d SetModel("tag_origin");
	var_4c590e3d clientfield::set("fx_keeperspawn", 1);
	location3 = struct::get("vril_place_struct", "targetname");
	FX3 = spawn("script_model", (-318.5, -1861.5, -403.75));
	FX3.angles = (0, 0, 0);
	FX3 SetModel("tag_origin");
	PlayFXOnTag(level._effect["trailrune"], FX3, "tag_origin");
	FX3 moveto(location3.origin, 3, 0.01, 0.01);
	wait(3);
	var_4c590e3d clientfield::set("fx_keeperspawn", 0);
	FX clientfield::set("fx_keeperspawn", 0);
	fx2 clientfield::set("fx_orbred", 0);
	var_4c590e3d delete();
	FX delete();
	fx2 delete();
	FX3 delete();
}

/*
	Name: function_eeb1da7f
	Namespace: namespace_da78430a
	Checksum: 0x80D1FCC2
	Offset: 0x41CA0
	Size: 0x980
	Parameters: 0
	Flags: None
	Line Number: 13374
*/
function function_eeb1da7f()
{
	level endon("intermission");
	while(!level.var_3b0f9cea)
	{
		wait(0.25);
	}
	location2 = struct::get("keeper_struct_storm", "targetname");
	location3 = struct::get("keeper_struct_storm2", "targetname");
	model3 = spawn("script_model", location2.origin);
	model3.angles = (0, 0, 0);
	model3 SetModel("tag_origin");
	var_be607d78 = spawn("script_model", location2.origin);
	var_be607d78.angles = VectorScale((0, 1, 0), 240);
	var_be607d78 SetModel("c_zom_zod_keeper_fb_storm");
	FX = spawn("script_model", location2.origin);
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_keeperspawn", 1);
	var_be607d78 EnableLinkTo();
	var_be607d78 LinkTo(model3);
	var_be607d78 useanimtree(-1);
	var_be607d78 AnimScripted("ai_zm_dlc1_corrupted_keeper_float_idle", var_be607d78.origin, var_be607d78.angles, %ai_zm_dlc1_corrupted_keeper_float_idle);
	var_90f3dd44 = GetEnt("keeper_shield_storm", "targetname");
	var_90f3dd44 Hide();
	var_90f3dd44 moveto((-642.392, -1861.49, -454.75), 0.2, 0.01, 0.01);
	var_90f3dd44 show();
	wait(0.2);
	while(!level.var_414bf04e)
	{
		wait(0.25);
	}
	var_90f3dd44 delete();
	fx2 = spawn("script_model", (-642.5, -1861.5, -445.25));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbblue", 1);
	PlayFXOnTag(level._effect["keepertrailstorm"], var_be607d78, "tag_aim");
	var_be607d78 setcandamage(1);
	while(1)
	{
		var_be607d78 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_storm4" || weapon.name == "elemental_bow_storm2" || weapon.name == "elemental_bow_storm3" || weapon.name == "elemental_bow_storm")
		{
			break;
		}
	}
	playsoundatposition("pain_01", (-642.392, -1861.49, -494.5));
	var_be607d78 StopAnimScripted();
	wait(0.1);
	model3 moveto(location3.origin, 2, 0.01, 0.01);
	var_be607d78 useanimtree(-1);
	var_be607d78 AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_intro", var_be607d78.origin, var_be607d78.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_intro);
	wait(0.8);
	var_be607d78 StopAnimScripted();
	wait(0.1);
	var_be607d78 useanimtree(-1);
	var_be607d78 AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_loop", var_be607d78.origin, var_be607d78.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_loop);
	level.var_92bf2877 = 1;
	while(!level.var_af025980)
	{
		wait(0.1);
	}
	wait(3);
	var_be607d78 StopAnimScripted();
	model3 delete();
	var_be607d78 delete();
	var_4c590e3d = spawn("script_model", location3.origin);
	var_4c590e3d.angles = (0, 0, 0);
	var_4c590e3d SetModel("tag_origin");
	var_4c590e3d clientfield::set("fx_keeperspawn", 1);
	location1 = struct::get("vril_place_struct", "targetname");
	FX3 = spawn("script_model", (-642.5, -1861.5, -403.75));
	FX3.angles = (0, 0, 0);
	FX3 SetModel("tag_origin");
	PlayFXOnTag(level._effect["trailstorm"], FX3, "tag_origin");
	FX3 moveto(location1.origin, 3, 0.01, 0.01);
	wait(3);
	var_4c590e3d clientfield::set("fx_keeperspawn", 0);
	FX clientfield::set("fx_keeperspawn", 0);
	fx2 clientfield::set("fx_orbblue", 0);
	var_4c590e3d delete();
	FX delete();
	fx2 delete();
	FX3 delete();
	return;
	waittillframeend;
}

/*
	Name: function_21239d91
	Namespace: namespace_da78430a
	Checksum: 0x39A34B12
	Offset: 0x42628
	Size: 0x978
	Parameters: 0
	Flags: None
	Line Number: 13473
*/
function function_21239d91()
{
	level endon("intermission");
	while(!level.var_3b0f9cea)
	{
		wait(0.25);
	}
	location3 = struct::get("keeper_struct_wolf_howl", "targetname");
	location2 = struct::get("keeper_struct_wolf_howl2", "targetname");
	var_e462f7e1 = spawn("script_model", location3.origin);
	var_e462f7e1.angles = (0, 0, 0);
	var_e462f7e1 SetModel("tag_origin");
	var_a65724a = spawn("script_model", location3.origin);
	var_a65724a.angles = VectorScale((0, 1, 0), 120);
	var_a65724a SetModel("c_zom_zod_keeper_fb_wolf_howl");
	FX = spawn("script_model", location3.origin);
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_keeperspawn", 1);
	var_a65724a EnableLinkTo();
	var_a65724a LinkTo(var_e462f7e1);
	var_a65724a useanimtree(-1);
	var_a65724a AnimScripted("ai_zm_dlc1_corrupted_keeper_float_idle", var_a65724a.origin, var_a65724a.angles, %ai_zm_dlc1_corrupted_keeper_float_idle);
	var_90f3dd44 = GetEnt("keeper_shield_wolf_howl", "targetname");
	var_90f3dd44 Hide();
	var_90f3dd44 moveto((-641.108, -1529.39, -359), 0.2, 0.01, 0.01);
	var_90f3dd44 show();
	wait(0.2);
	while(!level.var_414bf04e)
	{
		wait(0.25);
	}
	var_90f3dd44 delete();
	fx2 = spawn("script_model", (-641, -1529.25, -350.5));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbgreen", 1);
	PlayFXOnTag(level._effect["keepertrailwolf"], var_a65724a, "tag_aim");
	var_a65724a setcandamage(1);
	while(1)
	{
		var_a65724a waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_wolf_howl4" || weapon.name == "elemental_bow_wolf_howl2" || weapon.name == "elemental_bow_wolf_howl3" || weapon.name == "elemental_bow_wolf_howl")
		{
			break;
		}
	}
	playsoundatposition("pain_02", (-641.108, -1529.39, -398.75));
	var_a65724a StopAnimScripted();
	wait(0.1);
	var_e462f7e1 moveto(location2.origin, 2, 0.01, 0.01);
	var_a65724a useanimtree(-1);
	var_a65724a AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_intro", var_a65724a.origin, var_a65724a.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_intro);
	wait(0.8);
	var_a65724a StopAnimScripted();
	wait(0.1);
	var_a65724a useanimtree(-1);
	var_a65724a AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_loop", var_a65724a.origin, var_a65724a.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_loop);
	level.var_358e0ebd = 1;
	while(!level.var_af025980)
	{
		wait(0.1);
	}
	wait(3);
	var_a65724a StopAnimScripted();
	var_e462f7e1 delete();
	var_a65724a delete();
	var_4c590e3d = spawn("script_model", location2.origin);
	var_4c590e3d.angles = (0, 0, 0);
	var_4c590e3d SetModel("tag_origin");
	var_4c590e3d clientfield::set("fx_keeperspawn", 1);
	location1 = struct::get("vril_place_struct", "targetname");
	FX3 = spawn("script_model", (-641, -1529.25, -305.5));
	FX3.angles = (0, 0, 0);
	FX3 SetModel("tag_origin");
	PlayFXOnTag(level._effect["trailwolf"], FX3, "tag_origin");
	FX3 moveto(location1.origin, 3, 0.01, 0.01);
	wait(3);
	var_4c590e3d clientfield::set("fx_keeperspawn", 0);
	FX clientfield::set("fx_keeperspawn", 0);
	fx2 clientfield::set("fx_orbgreen", 0);
	var_4c590e3d delete();
	FX delete();
	fx2 delete();
	FX3 delete();
}

/*
	Name: function_201a191e
	Namespace: namespace_da78430a
	Checksum: 0xCCBABC58
	Offset: 0x42FA8
	Size: 0x980
	Parameters: 0
	Flags: None
	Line Number: 13570
*/
function function_201a191e()
{
	level endon("intermission");
	while(!level.var_3b0f9cea)
	{
		wait(0.25);
	}
	var_e8943b5c = struct::get("keeper_struct_demongate", "targetname");
	location2 = struct::get("keeper_struct_demongate2", "targetname");
	var_3067ecb3 = spawn("script_model", var_e8943b5c.origin);
	var_3067ecb3.angles = (0, 0, 0);
	var_3067ecb3 SetModel("tag_origin");
	var_265693d4 = spawn("script_model", var_e8943b5c.origin);
	var_265693d4.angles = VectorScale((0, 1, 0), 60);
	var_265693d4 SetModel("c_zom_zod_keeper_fb_demongate");
	FX = spawn("script_model", var_e8943b5c.origin);
	FX.angles = (0, 0, 0);
	FX SetModel("tag_origin");
	FX clientfield::set("fx_keeperspawn", 1);
	var_265693d4 EnableLinkTo();
	var_265693d4 LinkTo(var_3067ecb3);
	var_265693d4 useanimtree(-1);
	var_265693d4 AnimScripted("ai_zm_dlc1_corrupted_keeper_float_idle", var_265693d4.origin, var_265693d4.angles, %ai_zm_dlc1_corrupted_keeper_float_idle);
	var_90f3dd44 = GetEnt("keeper_shield_demongate", "targetname");
	var_90f3dd44 Hide();
	var_90f3dd44 moveto((-320.358, -1529.51, -358.75), 0.2, 0.01, 0.01);
	var_90f3dd44 show();
	wait(0.2);
	while(!level.var_414bf04e)
	{
		wait(0.25);
	}
	var_90f3dd44 delete();
	fx2 = spawn("script_model", (-320.25, -1529.5, -348.75));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_orbyellow", 1);
	PlayFXOnTag(level._effect["keepertraildemon"], var_265693d4, "tag_aim");
	var_265693d4 setcandamage(1);
	while(1)
	{
		var_265693d4 waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.name == "elemental_bow_demongate4" || weapon.name == "elemental_bow_demongate2" || weapon.name == "elemental_bow_demongate3" || weapon.name == "elemental_bow_demongate")
		{
			break;
		}
	}
	playsoundatposition("pain_03", (-320.358, -1529.51, -398.75));
	var_265693d4 StopAnimScripted();
	wait(0.1);
	var_3067ecb3 moveto(location2.origin, 2, 0.01, 0.01);
	var_265693d4 useanimtree(-1);
	var_265693d4 AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_intro", var_265693d4.origin, var_265693d4.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_intro);
	wait(0.8);
	var_265693d4 StopAnimScripted();
	wait(0.1);
	var_265693d4 useanimtree(-1);
	var_265693d4 AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_loop", var_265693d4.origin, var_265693d4.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_loop);
	level.var_4615dd66 = 1;
	while(!level.var_af025980)
	{
		wait(0.1);
	}
	wait(3);
	var_265693d4 StopAnimScripted();
	var_3067ecb3 delete();
	var_265693d4 delete();
	var_4c590e3d = spawn("script_model", location2.origin);
	var_4c590e3d.angles = (0, 0, 0);
	var_4c590e3d SetModel("tag_origin");
	var_4c590e3d clientfield::set("fx_keeperspawn", 1);
	location1 = struct::get("vril_place_struct", "targetname");
	FX3 = spawn("script_model", (-320.25, -1529.5, -305.5));
	FX3.angles = (0, 0, 0);
	FX3 SetModel("tag_origin");
	PlayFXOnTag(level._effect["traildemon"], FX3, "tag_origin");
	FX3 moveto(location1.origin, 3, 0.01, 0.01);
	wait(3);
	var_4c590e3d clientfield::set("fx_keeperspawn", 0);
	FX clientfield::set("fx_keeperspawn", 0);
	fx2 clientfield::set("fx_orbyellow", 0);
	var_4c590e3d delete();
	FX delete();
	fx2 delete();
	FX3 delete();
	return;
}

/*
	Name: function_2bb7a980
	Namespace: namespace_da78430a
	Checksum: 0x635D3843
	Offset: 0x43930
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 13668
*/
function function_2bb7a980()
{
	level.var_d12a1e28 = 0;
	level.var_2aa8fb67 = 0;
	level.var_f3507893 = 0;
	level.var_a92c2659 = 0;
	level.var_1cc7af59 = 0;
	thread function_53679422();
	thread function_5106d582();
	thread function_e43015c8();
	thread function_875a3ec0();
	thread function_51dc7164();
}

/*
	Name: function_53679422
	Namespace: namespace_da78430a
	Checksum: 0x84067015
	Offset: 0x439D0
	Size: 0x320
	Parameters: 0
	Flags: None
	Line Number: 13692
*/
function function_53679422()
{
	level endon("intermission");
	var_4507a6af = GetEnt("keeper_boss_players2_stage2", "targetname");
	var_c6ea5b40 = GetEnt("keeper_boss_players2", "targetname");
	var_4507a6af TriggerEnable(0);
	level.var_a92c2659 = 1;
	while(!level.var_af025980)
	{
		wait(0.25);
	}
	var_4507a6af TriggerEnable(1);
	wait(5);
	if(level.var_2aa8fb67 == 1)
	{
		continue;
	}
	fx2 = spawn("script_model", (-479.5, -1725.5, -570.25));
	fx2.angles = (0, 0, 0);
	fx2 SetModel("tag_origin");
	fx2 clientfield::set("fx_stormflash", 1);
	while(1)
	{
		var_c6ea5b40 waittill("trigger", player);
		while(1)
		{
			level.gravity_trap_spike_watcher = &function_25a8e486;
			if(level.var_506998bb == 1)
			{
				level.var_3b0f9cea = 1;
				wait(0.05);
				if(level.var_3b0f9cea == 1)
				{
					break;
				}
			}
			wait(0.05);
			if(level.var_3b0f9cea == 1)
			{
				break;
			}
		}
		wait(0.05);
		if(level.var_3b0f9cea == 1)
		{
			break;
		}
	}
	playsoundatposition("shield_collapse", (-479.75, -1511.25, -340));
	fx2 clientfield::set("fx_stormflash", 0);
	fx2 delete();
	level.var_506998bb = 0;
	level.var_a92c2659 = 0;
	level.var_d12a1e28 = 1;
	wait(0.5);
	level.var_3b0f9cea = 0;
	if(level.var_2aa8fb67 == 1)
	{
		continue;
	}
	level notify("hash_95268191");
	playsoundatposition("medal_acquired_mn", (-481.25, -1656.25, -567.75));
}

/*
	Name: function_5106d582
	Namespace: namespace_da78430a
	Checksum: 0x871A435E
	Offset: 0x43CF8
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 13766
*/
function function_5106d582()
{
	level endon("intermission");
	while(!level.var_d12a1e28)
	{
		wait(0.25);
	}
	while(1)
	{
		wait(5);
		if(level.var_2aa8fb67 == 1)
		{
			break;
		}
		wait(5);
		if(level.var_2aa8fb67 == 1)
		{
			break;
		}
		wait(5);
		if(level.var_2aa8fb67 == 1)
		{
			break;
		}
		wait(5);
		if(level.var_2aa8fb67 == 1)
		{
			break;
		}
		wait(5);
		if(level.var_2aa8fb67 == 1)
		{
			break;
		}
		wait(5);
		if(level.var_2aa8fb67 == 1)
		{
			break;
		}
		self thread function_53679422();
		wait(5.75);
		level waittill("hash_95268191");
		if(level.var_2aa8fb67 == 1)
		{
			break;
		}
	}
}

/*
	Name: function_e43015c8
	Namespace: namespace_da78430a
	Checksum: 0x7CAF956B
	Offset: 0x43E18
	Size: 0x2928
	Parameters: 0
	Flags: None
	Line Number: 13825
*/
function function_e43015c8()
{
	level endon("intermission");
	while(!level.var_3b0f9cea)
	{
		wait(0.25);
	}
	location = struct::get("keeper_stage2_struct_start", "targetname");
	location1 = struct::get("keeper_stage2_struct1", "targetname");
	location2 = struct::get("keeper_stage2_struct2", "targetname");
	location3 = struct::get("keeper_stage2_struct3", "targetname");
	var_e8943b5c = struct::get("keeper_stage2_struct4", "targetname");
	var_e96b5c5 = struct::get("keeper_stage2_struct5", "targetname");
	var_3499302e = struct::get("keeper_stage2_struct6", "targetname");
	var_5a9baa97 = struct::get("keeper_stage2_struct7", "targetname");
	var_20767e70 = struct::get("keeper_stage2_struct8", "targetname");
	var_4678f8d9 = struct::get("keeper_stage2_struct9", "targetname");
	var_a02e6443 = struct::get("keeper_stage2_struct_hide", "targetname");
	var_7c6ce185 = GetEnt("keeper_boss_damage", "targetname");
	model3 = GetEnt("keeper_shield", "targetname");
	wait(2.9);
	model2 = spawn("script_model", var_a02e6443.origin);
	model2.angles = (0, 0, 0);
	model2 SetModel("tag_origin");
	var_7c6ce185 EnableLinkTo();
	var_7c6ce185 LinkTo(model2);
	var_7c6ce185 useanimtree(-1);
	var_7c6ce185 AnimScripted("ai_zm_dlc1_corrupted_keeper_charge_stone_loop", var_7c6ce185.origin, var_7c6ce185.angles, %ai_zm_dlc1_corrupted_keeper_charge_stone_loop);
	var_83ba4dad = GetEnt("keeper_shield_large", "targetname");
	var_83ba4dad moveto((-480, -1653, -378.75), 0.2, 0.01, 0.01);
	var_7c6ce185 Hide();
	model2 moveto(location.origin, 0.2, 0.01, 0.01);
	model3 Hide();
	model3 moveto((-480, -1653, -378.75), 0.2, 0.01, 0.01);
	model3 show();
	wait(0.2);
	var_7c6ce185 show();
	var_8eca0e6e = spawn("script_model", location.origin);
	var_8eca0e6e.angles = (0, 0, 0);
	var_8eca0e6e SetModel("tag_origin");
	var_8eca0e6e clientfield::set("fx_keeperspawn", 1);
	wait(3);
	var_8eca0e6e clientfield::set("fx_keeperspawn", 0);
	var_8eca0e6e delete();
	while(!level.var_af025980)
	{
		wait(3);
	}
	var_83ba4dad delete();
	while(!level.var_d12a1e28)
	{
		wait(0.25);
	}
	model3 Hide();
	model3 moveto(var_a02e6443.origin, 0.2, 0.01, 0.01);
	model3 show();
	var_7c6ce185 Hide();
	wait(0.05);
	while(1)
	{
		var_7c6ce185 show();
		model3 Hide();
		model3 moveto((-480, -1653, -378.75), 0.2, 0.01, 0.01);
		model3 show();
		level waittill("hash_95268191");
		model3 Hide();
		model3 moveto(var_a02e6443.origin, 0.2, 0.01, 0.01);
		model3 show();
		var_7c6ce185 clientfield::set("fx_keepertrail2", 1);
		FX = spawn("script_model", location.origin);
		FX.angles = (0, 0, 0);
		FX SetModel("tag_origin");
		FX clientfield::set("fx_keeperspawn", 1);
		while(1)
		{
			if(level.var_f3507893 == 1)
			{
				break;
			}
			if(level.var_a92c2659 == 1)
			{
				break;
			}
			wait(0.05);
		}
		playsoundatposition("keeper_resurrect", (-479.5, -1584.5, -418.5));
		var_7c6ce185 clientfield::set("fx_keepertrail2", 0);
		var_7c6ce185 Hide();
		model2 moveto(location.origin, 0.1, 0.01, 0.01);
		wait(0.1);
		FX clientfield::set("fx_keeperspawn", 0);
		FX delete();
		if(level.var_a92c2659 == 1)
		{
			continue;
		}
		fx2 = spawn("script_model", location.origin);
		fx2.angles = (0, 0, 0);
		fx2 SetModel("tag_origin");
		fx2 clientfield::set("fx_keeperspawn", 1);
		model2 moveto(location1.origin, 0.2, 0.01, 0.01);
		wait(0.2);
		var_7c6ce185 show();
		var_7c6ce185 clientfield::set("fx_keepertrail2", 1);
		FX3 = spawn("script_model", location1.origin);
		FX3.angles = (0, 0, 0);
		FX3 SetModel("tag_origin");
		FX3 clientfield::set("fx_keeperspawn", 1);
		while(1)
		{
			if(level.var_f3507893 == 1)
			{
				break;
			}
			if(level.var_a92c2659 == 1)
			{
				break;
			}
			wait(0.05);
		}
		playsoundatposition("keeper_resurrect", (-642.5, -1861.5, -471.5));
		var_7c6ce185 clientfield::set("fx_keepertrail2", 0);
		var_7c6ce185 Hide();
		model2 moveto(location.origin, 0.1, 0.01, 0.01);
		wait(0.1);
		fx2 clientfield::set("fx_keeperspawn", 0);
		FX3 clientfield::set("fx_keeperspawn", 0);
		fx2 delete();
		FX3 delete();
		if(level.var_a92c2659 == 1)
		{
			continue;
		}
		var_fb2c4b25 = spawn("script_model", location1.origin);
		var_fb2c4b25.angles = (0, 0, 0);
		var_fb2c4b25 SetModel("tag_origin");
		var_fb2c4b25 clientfield::set("fx_keeperspawn", 1);
		model2 moveto(location2.origin, 0.2, 0.01, 0.01);
		wait(0.2);
		var_7c6ce185 show();
		var_7c6ce185 clientfield::set("fx_keepertrail2", 1);
		var_d529d0bc = spawn("script_model", location2.origin);
		var_d529d0bc.angles = (0, 0, 0);
		var_d529d0bc SetModel("tag_origin");
		var_d529d0bc clientfield::set("fx_keeperspawn", 1);
		while(1)
		{
			if(level.var_f3507893 == 1)
			{
				break;
			}
			if(level.var_a92c2659 == 1)
			{
				break;
			}
			wait(0.05);
		}
		playsoundatposition("keeper_resurrect", (-320.5, -1529.5, -375.5));
		var_7c6ce185 clientfield::set("fx_keepertrail2", 0);
		var_7c6ce185 Hide();
		model2 moveto(location.origin, 0.1, 0.01, 0.01);
		wait(0.1);
		var_fb2c4b25 clientfield::set("fx_keeperspawn", 0);
		var_d529d0bc clientfield::set("fx_keeperspawn", 0);
		var_fb2c4b25 delete();
		var_d529d0bc delete();
		if(level.var_a92c2659 == 1)
		{
			continue;
		}
		var_47313ff7 = spawn("script_model", location2.origin);
		var_47313ff7.angles = (0, 0, 0);
		var_47313ff7 SetModel("tag_origin");
		var_47313ff7 clientfield::set("fx_keeperspawn", 1);
		model2 moveto(location3.origin, 0.2, 0.01, 0.01);
		wait(0.2);
		var_7c6ce185 show();
		var_7c6ce185 clientfield::set("fx_keepertrail2", 1);
		var_212ec58e = spawn("script_model", location3.origin);
		var_212ec58e.angles = (0, 0, 0);
		var_212ec58e SetModel("tag_origin");
		var_212ec58e clientfield::set("fx_keeperspawn", 1);
		while(1)
		{
			if(level.var_f3507893 == 1)
			{
				break;
			}
			if(level.var_a92c2659 == 1)
			{
				break;
			}
			wait(0.05);
		}
		playsoundatposition("keeper_resurrect", (-318.5, -1861.5, -471.5));
		var_7c6ce185 clientfield::set("fx_keepertrail2", 0);
		var_7c6ce185 Hide();
		model2 moveto(location.origin, 0.1, 0.01, 0.01);
		wait(0.1);
		var_47313ff7 clientfield::set("fx_keeperspawn", 0);
		var_212ec58e clientfield::set("fx_keeperspawn", 0);
		var_47313ff7 delete();
		var_212ec58e delete();
		if(level.var_a92c2659 == 1)
		{
			continue;
		}
		var_330e8e39 = spawn("script_model", location3.origin);
		var_330e8e39.angles = (0, 0, 0);
		var_330e8e39 SetModel("tag_origin");
		var_330e8e39 clientfield::set("fx_keeperspawn", 1);
		model2 moveto(var_e8943b5c.origin, 0.2, 0.01, 0.01);
		wait(0.2);
		var_7c6ce185 show();
		var_7c6ce185 clientfield::set("fx_keepertrail2", 1);
		var_d0c13d0 = spawn("script_model", var_e8943b5c.origin);
		var_d0c13d0.angles = (0, 0, 0);
		var_d0c13d0 SetModel("tag_origin");
		var_d0c13d0 clientfield::set("fx_keeperspawn", 1);
		while(1)
		{
			if(level.var_f3507893 == 1)
			{
				break;
			}
			if(level.var_a92c2659 == 1)
			{
				break;
			}
			wait(0.05);
		}
		playsoundatposition("keeper_resurrect", (-641.5, -1530.5, -375.5));
		var_7c6ce185 clientfield::set("fx_keepertrail2", 0);
		var_7c6ce185 Hide();
		model2 moveto(location.origin, 0.1, 0.01, 0.01);
		wait(0.1);
		var_330e8e39 clientfield::set("fx_keeperspawn", 0);
		var_d0c13d0 clientfield::set("fx_keeperspawn", 0);
		var_330e8e39 delete();
		var_d0c13d0 delete();
		if(level.var_a92c2659 == 1)
		{
			continue;
		}
		var_71afbe78 = spawn("script_model", var_e8943b5c.origin);
		var_71afbe78.angles = (0, 0, 0);
		var_71afbe78 SetModel("tag_origin");
		var_71afbe78 clientfield::set("fx_keeperspawn", 1);
		model2 moveto(var_e96b5c5.origin, 0.2, 0.01, 0.01);
		wait(0.2);
		var_7c6ce185 show();
		var_7c6ce185 clientfield::set("fx_keepertrail2", 1);
		var_97b238e1 = spawn("script_model", var_e96b5c5.origin);
		var_97b238e1.angles = (0, 0, 0);
		var_97b238e1 SetModel("tag_origin");
		var_97b238e1 clientfield::set("fx_keeperspawn", 1);
		while(1)
		{
			if(level.var_f3507893 == 1)
			{
				break;
			}
			if(level.var_a92c2659 == 1)
			{
				break;
			}
			wait(0.05);
		}
		playsoundatposition("keeper_resurrect", (-270.5, -1166.5, -171.5));
		var_7c6ce185 clientfield::set("fx_keepertrail2", 0);
		var_7c6ce185 Hide();
		model2 moveto(location.origin, 0.1, 0.01, 0.01);
		wait(0.1);
		var_71afbe78 clientfield::set("fx_keeperspawn", 0);
		var_97b238e1 clientfield::set("fx_keeperspawn", 0);
		var_71afbe78 delete();
		var_97b238e1 delete();
		if(level.var_a92c2659 == 1)
		{
			continue;
		}
		var_bdb4b34a = spawn("script_model", var_e96b5c5.origin);
		var_bdb4b34a.angles = (0, 0, 0);
		var_bdb4b34a SetModel("tag_origin");
		var_bdb4b34a clientfield::set("fx_keeperspawn", 1);
		model2 moveto(var_3499302e.origin, 0.2, 0.01, 0.01);
		wait(0.2);
		var_7c6ce185 show();
		var_7c6ce185 clientfield::set("fx_keepertrail2", 1);
		var_e3b72db3 = spawn("script_model", var_3499302e.origin);
		var_e3b72db3.angles = (0, 0, 0);
		var_e3b72db3 SetModel("tag_origin");
		var_e3b72db3 clientfield::set("fx_keeperspawn", 1);
		while(1)
		{
			if(level.var_f3507893 == 1)
			{
				break;
			}
			if(level.var_a92c2659 == 1)
			{
				break;
			}
			wait(0.05);
		}
		playsoundatposition("keeper_resurrect", (-696.5, -1166.5, -171.5));
		var_7c6ce185 clientfield::set("fx_keepertrail2", 0);
		var_7c6ce185 Hide();
		model2 moveto(location.origin, 0.1, 0.01, 0.01);
		wait(0.1);
		var_bdb4b34a clientfield::set("fx_keeperspawn", 0);
		var_e3b72db3 clientfield::set("fx_keeperspawn", 0);
		var_bdb4b34a delete();
		var_e3b72db3 delete();
		if(level.var_a92c2659 == 1)
		{
			continue;
		}
		var_9b9a81c = spawn("script_model", var_3499302e.origin);
		var_9b9a81c.angles = (0, 0, 0);
		var_9b9a81c SetModel("tag_origin");
		var_9b9a81c clientfield::set("fx_keeperspawn", 1);
		model2 moveto(var_5a9baa97.origin, 0.2, 0.01, 0.01);
		wait(0.2);
		var_7c6ce185 show();
		var_7c6ce185 clientfield::set("fx_keepertrail2", 1);
		var_2fbc2285 = spawn("script_model", var_5a9baa97.origin);
		var_2fbc2285.angles = (0, 0, 0);
		var_2fbc2285 SetModel("tag_origin");
		var_2fbc2285 clientfield::set("fx_keeperspawn", 1);
		while(1)
		{
			if(level.var_f3507893 == 1)
			{
				break;
			}
			if(level.var_a92c2659 == 1)
			{
				break;
			}
			wait(0.05);
		}
		playsoundatposition("keeper_resurrect", (-479.75, -1246, -215));
		var_7c6ce185 clientfield::set("fx_keepertrail2", 0);
		var_7c6ce185 Hide();
		model2 moveto(location.origin, 0.1, 0.01, 0.01);
		wait(0.1);
		var_9b9a81c clientfield::set("fx_keeperspawn", 0);
		var_2fbc2285 clientfield::set("fx_keeperspawn", 0);
		var_9b9a81c delete();
		var_2fbc2285 delete();
		if(level.var_a92c2659 == 1)
		{
			continue;
		}
		var_55be9cee = spawn("script_model", var_5a9baa97.origin);
		var_55be9cee.angles = (0, 0, 0);
		var_55be9cee SetModel("tag_origin");
		var_55be9cee clientfield::set("fx_keeperspawn", 1);
		model2 moveto(var_20767e70.origin, 0.2, 0.01, 0.01);
		wait(0.2);
		var_7c6ce185 show();
		var_7c6ce185 clientfield::set("fx_keepertrail2", 1);
		var_7bc11757 = spawn("script_model", var_20767e70.origin);
		var_7bc11757.angles = (0, 0, 0);
		var_7bc11757 SetModel("tag_origin");
		var_7bc11757 clientfield::set("fx_keeperspawn", 1);
		while(1)
		{
			if(level.var_f3507893 == 1)
			{
				break;
			}
			if(level.var_a92c2659 == 1)
			{
				break;
			}
			wait(0.05);
		}
		playsoundatposition("keeper_resurrect", (-479.75, -1386, -269.25));
		var_7c6ce185 clientfield::set("fx_keepertrail2", 0);
		var_7c6ce185 Hide();
		model2 moveto(location.origin, 0.1, 0.01, 0.01);
		wait(0.1);
		var_55be9cee clientfield::set("fx_keeperspawn", 0);
		var_7bc11757 clientfield::set("fx_keeperspawn", 0);
		var_55be9cee delete();
		var_7bc11757 delete();
		if(level.var_a92c2659 == 1)
		{
			continue;
		}
		var_419beb30 = spawn("script_model", var_20767e70.origin);
		var_419beb30.angles = (0, 0, 0);
		var_419beb30 SetModel("tag_origin");
		var_419beb30 clientfield::set("fx_keeperspawn", 1);
		model2 moveto(var_4678f8d9.origin, 0.2, 0.01, 0.01);
		wait(0.2);
		var_7c6ce185 show();
		var_7c6ce185 clientfield::set("fx_keepertrail2", 1);
		var_679e6599 = spawn("script_model", var_4678f8d9.origin);
		var_679e6599.angles = (0, 0, 0);
		var_679e6599 SetModel("tag_origin");
		var_679e6599 clientfield::set("fx_keeperspawn", 1);
		while(1)
		{
			if(level.var_1cc7af59 == 1)
			{
				break;
			}
			if(level.var_a92c2659 == 1)
			{
				break;
			}
			wait(0.05);
		}
		var_419beb30 clientfield::set("fx_keeperspawn", 0);
		var_679e6599 clientfield::set("fx_keeperspawn", 0);
		var_419beb30 delete();
		var_679e6599 delete();
		if(level.var_a92c2659 == 1)
		{
			model2 moveto(location.origin, 0.1, 0.01, 0.01);
		}
		wait(0.1);
		if(level.var_a92c2659 == 1)
		{
			var_7c6ce185 clientfield::set("fx_keepertrail2", 0);
		}
		if(level.var_a92c2659 == 1)
		{
			continue;
		}
		playsoundatposition("beam_fx_link", (-479.75, -1246, -215));
		fx_beam = spawn("script_model", (-479, -1151.75, -172.25));
		fx_beam SetModel("tag_origin");
		fx_beam.angles = (20, 270, 0);
		fx_beam clientfield::set("fx_keeperbeam", 1);
		wait(3.5);
		playsoundatposition("shadowman_die", (-479.75, -1511.25, -340));
		wait(0.5);
		playsoundatposition("zmb_magma_chunks_exp", (-479.75, -1511.25, -340));
		var_2e63d859 = spawn("script_model", var_4678f8d9.origin);
		var_2e63d859.angles = (0, 0, 0);
		var_2e63d859 SetModel("tag_origin");
		var_2e63d859 clientfield::set("fx_orbexplode", 1);
		var_7c6ce185 StopAnimScripted();
		var_7c6ce185 clientfield::set("fx_keepertrail2", 0);
		var_7c6ce185 StopAnimScripted();
		var_7c6ce185 delete();
		model2 delete();
		model3 delete();
		fx_beam clientfield::set("fx_keeperbeam", 0);
		fx_beam delete();
		var_83ba4dad delete();
		wait(2.5);
		level.var_2aa8fb67 = 1;
		level thread LUI::screen_flash(0.05, 0.5, 0.05, 0.8, "white");
		var_78c536a9 = struct::get("vril_place_struct", "targetname");
		var_9fa8c7a2 = spawn("script_model", (-480, -1515.5, -302.25));
		var_9fa8c7a2.angles = (0, 0, 0);
		var_9fa8c7a2 SetModel("tag_origin");
		PlayFXOnTag(level._effect["trailrune"], var_9fa8c7a2, "tag_origin");
		var_9fa8c7a2 moveto(var_78c536a9.origin, 3, 0.01, 0.01);
		foreach(player in level.players)
		{
			player PlayRumbleOnEntity("zm_castle_pulsing_rumble");
		}
		var_2e63d859 clientfield::set("fx_orbexplode", 0);
		var_2e63d859 delete();
		playsoundatposition("castle_outro_part_3_mas", (-479.75, -1511.25, -340));
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] thread function_7dec9f20();
		}
		level flag::set("boss_fight_completed");
		wait(3);
		var_9fa8c7a2 delete();
		if(level.var_2aa8fb67 == 1)
		{
			break;
		}
	}
}

/*
	Name: function_875a3ec0
	Namespace: namespace_da78430a
	Checksum: 0x481F73FB
	Offset: 0x46748
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 14321
*/
function function_875a3ec0()
{
	level endon("intermission");
	while(!level.var_d12a1e28)
	{
		wait(0.25);
	}
	var_d0a80cde = GetEnt("keeper_boss_damage", "targetname");
	var_d0a80cde setcandamage(1);
	while(1)
	{
		var_d0a80cde waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(level.var_a92c2659 == 1)
		{
			continue;
		}
		level.var_f3507893 = 1;
		wait(0.05);
		level.var_f3507893 = 0;
		if(level.var_2aa8fb67 == 1)
		{
			break;
		}
	}
}

/*
	Name: function_51dc7164
	Namespace: namespace_da78430a
	Checksum: 0x2A85A1
	Offset: 0x468B8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 14357
*/
function function_51dc7164()
{
	level endon("intermission");
	var_6288b9a = GetEnt("keeper_laser_trigger", "targetname");
	var_6288b9a setcursorhint("HINT_NOICON");
	while(1)
	{
		var_6288b9a waittill("trigger", player);
		if(level.var_2aa8fb67 == 1)
		{
			break;
		}
		level.var_1cc7af59 = 1;
		playsoundatposition("button_press", player.origin);
		wait(0.25);
		level.var_1cc7af59 = 0;
		if(level.var_2aa8fb67 == 1)
		{
			break;
		}
	}
	var_6288b9a delete();
	return;
	waittillframeend;
}

/*
	Name: function_bfedae8
	Namespace: namespace_da78430a
	Checksum: 0xCA91C335
	Offset: 0x469C0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 14393
*/
function function_bfedae8()
{
	thread function_7d80cc06();
	thread function_7c5d41e6();
}

/*
	Name: function_7d80cc06
	Namespace: namespace_da78430a
	Checksum: 0xD5E1E410
	Offset: 0x469F0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 14409
*/
function function_7d80cc06()
{
	level endon("intermission");
	while(!level.var_d2327f36)
	{
		wait(0.25);
	}
	while(1)
	{
		wait(0.05);
		if(zombie_utility::get_current_zombie_count() < level.zombie_ai_limit)
		{
			level.zombie_total = level.zombie_ai_limit;
		}
		if(level.var_2aa8fb67 == 1)
		{
			break;
		}
	}
}

/*
	Name: function_7c5d41e6
	Namespace: namespace_da78430a
	Checksum: 0x6C78144
	Offset: 0x46A78
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 14440
*/
function function_7c5d41e6()
{
	level endon("intermission");
	while(!level.var_d2327f36)
	{
		wait(0.25);
	}
	while(1)
	{
		wait(0.05);
		s_loc = namespace_ef567265::function_20278ca2();
		if(!isdefined(s_loc))
		{
			wait(RandomFloatRange(3, 6));
			continue;
		}
		ai = namespace_ef567265::spawn_mechz(s_loc, 1);
		waittillframeend;
		level waittill("mechz_killed");
		if(level.var_2aa8fb67 == 1)
		{
			break;
		}
		wait(30);
		if(level.var_2aa8fb67 == 1)
		{
			break;
		}
	}
}

/*
	Name: function_7dec9f20
	Namespace: namespace_da78430a
	Checksum: 0x2E7B56B4
	Offset: 0x46B70
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 14481
*/
function function_7dec9f20()
{
	level endon("intermission");
	for(i = 0; i < level._custom_perks.size; i++)
	{
		self zm_perks::give_random_perk();
		wait(0.1);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8e83cb80
	Namespace: namespace_da78430a
	Checksum: 0xC9E2C2F
	Offset: 0x46BD0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 14503
*/
function function_8e83cb80()
{
	thread function_9853351e();
}

/*
	Name: function_9853351e
	Namespace: namespace_da78430a
	Checksum: 0xFD85A60C
	Offset: 0x46BF0
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 14518
*/
function function_9853351e()
{
	level endon("intermission");
	while(!level.var_19c2514c)
	{
		wait(0.25);
	}
	level endon("hash_f1c5673d");
	level endon("intermission");
	var_de17d71e = zombie_utility::get_current_zombie_count();
	while(1)
	{
		if(zombie_utility::get_current_zombie_count() < level.zombie_ai_limit)
		{
			level thread zm_ai_dogs::special_dog_spawn(1, undefined, undefined);
			var_de17d71e = zombie_utility::get_current_zombie_count();
			wait(10);
		}
		var_de17d71e = zombie_utility::get_current_zombie_count();
		wait(1);
	}
}

/*
	Name: function_25a8e486
	Namespace: namespace_da78430a
	Checksum: 0x11E5274
	Offset: 0x46CE0
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 14551
*/
function function_25a8e486(var_42dddc8c)
{
	level endon("intermission");
	var_56bb330f = GetEnt("keeper_boss_players2", "targetname");
	foreach(player in level.players)
	{
		if(player istouching(var_56bb330f))
		{
			level.var_506998bb = 1;
		}
	}
}

/*
	Name: function_aa21930
	Namespace: namespace_da78430a
	Checksum: 0x15EB6B1C
	Offset: 0x46DC8
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 14574
*/
function function_aa21930()
{
	level.var_b3d2c200 = 0;
	level.var_a7e88eaf = 0;
	key = GetEnt("gramophone_trigger", "targetname");
	key setcursorhint("HINT_NOICON");
	key setHintString("Press and Hold ^3&&1^7 to Pick Up Gramophone");
	key thread function_5fcdfdce();
	var_41a85d8b = GetEntArray("key_buyable_ending_place", "targetname");
	foreach(door in var_41a85d8b)
	{
		door setcursorhint("HINT_NOICON");
		door setHintString("The Gramophone is Missing");
		door thread function_e21153ee();
	}
	return;
}

/*
	Name: function_5fcdfdce
	Namespace: namespace_da78430a
	Checksum: 0xEC4FD7A1
	Offset: 0x46F60
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 14602
*/
function function_5fcdfdce()
{
	level endon("intermission");
	self waittill("trigger", player);
	model = GetEnt(self.target, "targetname");
	model delete();
	self delete();
	level.var_b3d2c200 = 1;
	playsoundatposition("egg_pickup", player.origin);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e21153ee
	Namespace: namespace_da78430a
	Checksum: 0x8A4D216E
	Offset: 0x47020
	Size: 0x758
	Parameters: 0
	Flags: None
	Line Number: 14625
*/
function function_e21153ee()
{
	level endon("intermission");
	while(!level.var_b3d2c200)
	{
		wait(0.25);
	}
	location = struct::get("gramophone_struct", "targetname");
	location1 = struct::get("ending_portal_rocks_struct", "targetname");
	location2 = struct::get("ending_portal_struct", "targetname");
	self setHintString("Press and Hold ^3&&1^7 to Place Gramophone");
	self waittill("trigger", player);
	self delete();
	playsoundatposition("gramophone_activate", player.origin);
	var_7c6ce185 = spawn("script_model", location.origin);
	var_7c6ce185.angles = (0, 0, 0);
	var_7c6ce185 SetModel("p7_gramophone");
	wait(0.25);
	model2 = spawn("script_model", location1.origin);
	model2.angles = VectorScale((0, 1, 0), 90);
	model2 SetModel("p7_fxanim_zm_ori_portal_mod");
	playsoundatposition("tmb_air_grmphone_futz", (-566.25, -1418, -573.5));
	model2 useanimtree(-1);
	model2 AnimScripted("p7_fxanim_zm_ori_portal_open_anim", model2.origin, model2.angles, %p7_fxanim_zm_ori_portal_open_anim);
	wait(1.4);
	playsoundatposition("rock_00", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_02", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_03", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_00", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_02", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_03", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_00", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_02", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_03", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_00", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_02", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_03", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_00", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_02", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_03", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_00", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_02", (-479.5, -1300.75, -527.5));
	wait(0.62);
	playsoundatposition("rock_03", (-479.5, -1300.75, -527.5));
	wait(0.62);
	model2 StopAnimScripted();
	model3 = spawn("script_model", location2.origin);
	model3.angles = VectorScale((0, 1, 0), 270);
	model3 SetModel("p7_zm_ori_tomb_portal_screen_air");
	playsoundatposition("loop2", (-482.75, -1304.25, -523.75));
	level.var_a7e88eaf = 1;
}

/*
	Name: function_fbb828fb
	Namespace: namespace_da78430a
	Checksum: 0x92D6DF15
	Offset: 0x47780
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 14704
*/
function function_fbb828fb()
{
	level.var_7e7a0317 = 0;
	level.var_cbaf1323 = 10000;
	level.var_88e54352 = "Press and Hold ^3&&1^7 to Escape \n ^8Pay in 10K Increments - 70000 Remaining";
	level.var_5b8476cc = "You Do Not Have Enough Money";
	level.var_180ceb79 = "Thanks for Playing! You Have Escaped";
	level.var_f8b0c295 = "All Players Must Be Nearby to Escape";
	thread function_d9da0149();
}

/*
	Name: function_d9da0149
	Namespace: namespace_da78430a
	Checksum: 0x3A202834
	Offset: 0x477F8
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 14725
*/
function function_d9da0149()
{
	level endon("intermission");
	trig = GetEnt("buyable10", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig UseTriggerRequireLookAt();
	cost = level.var_cbaf1323;
	while(1)
	{
		trig TriggerEnable(0);
		while(!level.var_a7e88eaf)
		{
			wait(0.25);
		}
		trig TriggerEnable(1);
		trig setHintString(level.var_88e54352);
		trig waittill("trigger", player);
		if(isdefined(cost) && isdefined(player) && player.score >= cost)
		{
			player zm_score::minus_to_player_score(cost);
			trig setHintString("");
			model = GetEnt(trig.target, "targetname");
			model delete();
			trig delete();
			level.var_7e7a0317 = 1;
			playsoundatposition("zmb_cha_ching", player.origin);
		}
		else if(isdefined(cost) && isdefined(player) && player.score < cost)
		{
			trig setHintString("You Do Not Have Enough Money");
			wait(1);
		}
	}
}

/*
	Name: function_7b8cc3a6
	Namespace: namespace_da78430a
	Checksum: 0xF4C0C70D
	Offset: 0x47A60
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 14770
*/
function function_7b8cc3a6()
{
	level.var_878a5060 = 0;
	level.var_a5ac98ba = 10000;
	level.var_aee7bdbb = "Press and Hold ^3&&1^7 to Escape \n ^8Pay in 10K Increments - 60000 Remaining";
	level.var_8186f135 = "You Do Not Have Enough Money";
	level.var_f20a7110 = "Thanks for Playing! You Have Escaped";
	level.var_d2ae482c = "All Players Must Be Nearby to Escape";
	thread function_1d25e768();
}

/*
	Name: function_1d25e768
	Namespace: namespace_da78430a
	Checksum: 0x86E4F3B5
	Offset: 0x47AD8
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 14791
*/
function function_1d25e768()
{
	level endon("intermission");
	trig = GetEnt("buyable20", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig UseTriggerRequireLookAt();
	cost = level.var_a5ac98ba;
	while(1)
	{
		trig TriggerEnable(0);
		while(!level.var_7e7a0317)
		{
			wait(0.25);
		}
		trig TriggerEnable(1);
		trig setHintString(level.var_aee7bdbb);
		trig waittill("trigger", player);
		if(isdefined(cost) && isdefined(player) && player.score >= cost)
		{
			player zm_score::minus_to_player_score(cost);
			trig setHintString("");
			model = GetEnt(trig.target, "targetname");
			model delete();
			trig delete();
			level.var_878a5060 = 1;
			playsoundatposition("zmb_cha_ching", player.origin);
		}
		else if(isdefined(cost) && isdefined(player) && player.score < cost)
		{
			trig setHintString("You Do Not Have Enough Money");
			wait(1);
		}
	}
}

/*
	Name: function_fa2429d1
	Namespace: namespace_da78430a
	Checksum: 0x615C6AE1
	Offset: 0x47D40
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 14836
*/
function function_fa2429d1()
{
	level.var_24dd25f1 = 0;
	level.var_17b407f5 = 10000;
	level.var_d4ea3824 = "Press and Hold ^3&&1^7 to Escape \n ^8Pay in 10K Increments - 50000 Remaining";
	level.var_f7f81fa = "You Do Not Have Enough Money";
	level.var_fc1bc9ef = "Thanks for Playing! You Have Escaped";
	level.var_acabcdc3 = "All Players Must Be Nearby to Escape";
	thread function_9bbd4d93();
}

/*
	Name: function_9bbd4d93
	Namespace: namespace_da78430a
	Checksum: 0x48587865
	Offset: 0x47DB8
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 14857
*/
function function_9bbd4d93()
{
	level endon("intermission");
	trig = GetEnt("buyable30", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig UseTriggerRequireLookAt();
	cost = level.var_17b407f5;
	while(1)
	{
		trig TriggerEnable(0);
		while(!level.var_878a5060)
		{
			wait(0.25);
		}
		trig TriggerEnable(1);
		trig setHintString(level.var_d4ea3824);
		trig waittill("trigger", player);
		if(isdefined(cost) && isdefined(player) && player.score >= cost)
		{
			player zm_score::minus_to_player_score(cost);
			trig setHintString("");
			model = GetEnt(trig.target, "targetname");
			model delete();
			trig delete();
			level.var_24dd25f1 = 1;
			playsoundatposition("zmb_cha_ching", player.origin);
		}
		else if(isdefined(cost) && isdefined(player) && player.score < cost)
		{
			trig setHintString("You Do Not Have Enough Money");
			wait(1);
		}
	}
}

/*
	Name: function_78bb8ffc
	Namespace: namespace_da78430a
	Checksum: 0xFB26D11
	Offset: 0x48020
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 14902
*/
function function_78bb8ffc()
{
	level.var_9f3ab2a2 = 0;
	level.var_f1b18d8c = 10000;
	level.var_faecb28d = "Press and Hold ^3&&1^7 to Escape \n ^8Pay in 10K Increments - 40000 Remaining";
	level.var_3581fc63 = "You Do Not Have Enough Money";
	level.var_d6194f86 = "Thanks for Playing! You Have Escaped";
	level.var_86a9535a = "All Players Must Be Nearby to Escape";
	thread function_56dd684a();
}

/*
	Name: function_56dd684a
	Namespace: namespace_da78430a
	Checksum: 0x3B2618B2
	Offset: 0x48098
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 14923
*/
function function_56dd684a()
{
	level endon("intermission");
	trig = GetEnt("buyable40", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig UseTriggerRequireLookAt();
	cost = level.var_f1b18d8c;
	while(1)
	{
		trig TriggerEnable(0);
		while(!level.var_24dd25f1)
		{
			wait(0.25);
		}
		trig TriggerEnable(1);
		trig setHintString(level.var_faecb28d);
		trig waittill("trigger", player);
		if(isdefined(cost) && isdefined(player) && player.score >= cost)
		{
			player zm_score::minus_to_player_score(cost);
			trig setHintString("");
			model = GetEnt(trig.target, "targetname");
			model delete();
			trig delete();
			level.var_9f3ab2a2 = 1;
			playsoundatposition("zmb_cha_ching", player.origin);
		}
		else if(isdefined(cost) && isdefined(player) && player.score < cost)
		{
			trig setHintString("You Do Not Have Enough Money");
			wait(1);
		}
	}
}

/*
	Name: function_f752f627
	Namespace: namespace_da78430a
	Checksum: 0x4936F93E
	Offset: 0x48300
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 14968
*/
function function_f752f627()
{
	level.var_e8fc15e3 = 0;
	level.var_63b8fcc7 = 10000;
	level.var_20ef2cf6 = "Press and Hold ^3&&1^7 to Escape \n ^8Pay in 10K Increments - 30000 Remaining";
	level.var_c37a8d28 = "You Do Not Have Enough Money";
	level.var_b016d51d = "Thanks for Playing! You Have Escaped";
	level.var_60a6d8f1 = "All Players Must Be Nearby to Escape";
	thread function_d574ce75();
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: function_d574ce75
	Namespace: namespace_da78430a
	Checksum: 0x43465B3C
	Offset: 0x48378
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 14992
*/
function function_d574ce75()
{
	level endon("intermission");
	trig = GetEnt("buyable50", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig UseTriggerRequireLookAt();
	cost = level.var_63b8fcc7;
	while(1)
	{
		trig TriggerEnable(0);
		while(!level.var_9f3ab2a2)
		{
			wait(0.25);
		}
		trig TriggerEnable(1);
		trig setHintString(level.var_20ef2cf6);
		trig waittill("trigger", player);
		if(isdefined(cost) && isdefined(player) && player.score >= cost)
		{
			player zm_score::minus_to_player_score(cost);
			trig setHintString("");
			model = GetEnt(trig.target, "targetname");
			model delete();
			trig delete();
			level.var_e8fc15e3 = 1;
			playsoundatposition("zmb_cha_ching", player.origin);
		}
		else if(isdefined(cost) && isdefined(player) && player.score < cost)
		{
			trig setHintString("You Do Not Have Enough Money");
			wait(1);
		}
	}
}

/*
	Name: function_b6d843b2
	Namespace: namespace_da78430a
	Checksum: 0x1E6F8136
	Offset: 0x485E0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 15037
*/
function function_b6d843b2()
{
	level.var_cc5ad6fc = 0;
	level.var_3db6825e = 10000;
	level.var_46f1a75f = "Press and Hold ^3&&1^7 to Escape \n ^8Pay in 10K Increments - 20000 Remaining";
	level.var_e97d0791 = "You Do Not Have Enough Money";
	level.var_8a145ab4 = "Thanks for Playing! You Have Escaped";
	level.var_3aa45e88 = "All Players Must Be Nearby to Escape";
	thread function_58716774();
}

/*
	Name: function_58716774
	Namespace: namespace_da78430a
	Checksum: 0x56C64FFA
	Offset: 0x48658
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 15058
*/
function function_58716774()
{
	level endon("intermission");
	trig = GetEnt("buyable60", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig UseTriggerRequireLookAt();
	cost = level.var_3db6825e;
	while(1)
	{
		trig TriggerEnable(0);
		while(!level.var_e8fc15e3)
		{
			wait(0.25);
		}
		trig TriggerEnable(1);
		trig setHintString(level.var_46f1a75f);
		trig waittill("trigger", player);
		if(isdefined(cost) && isdefined(player) && player.score >= cost)
		{
			player zm_score::minus_to_player_score(cost);
			trig setHintString("");
			model = GetEnt(trig.target, "targetname");
			model delete();
			trig delete();
			level.var_cc5ad6fc = 1;
			playsoundatposition("zmb_cha_ching", player.origin);
		}
		else if(isdefined(cost) && isdefined(player) && player.score < cost)
		{
			trig setHintString("You Do Not Have Enough Money");
			wait(1);
		}
	}
}

/*
	Name: function_43d5eef2
	Namespace: namespace_da78430a
	Checksum: 0x43A64ACD
	Offset: 0x488C0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 15103
*/
function function_43d5eef2()
{
	level endon("intermission");
	while(!level.var_b8662558)
	{
		wait(0.05);
	}
	clientfield::set("orb_green_pickup", 1);
}

/*
	Name: function_3cf4c42
	Namespace: namespace_da78430a
	Checksum: 0x6A19AB55
	Offset: 0x48910
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 15123
*/
function function_3cf4c42()
{
	level endon("intermission");
	while(!level.var_fae13699)
	{
		wait(0.05);
	}
	clientfield::set("orb_red_pickup", 1);
	return;
}

/*
	Name: function_773df40d
	Namespace: namespace_da78430a
	Checksum: 0xA820DC68
	Offset: 0x48960
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 15144
*/
function function_773df40d()
{
	level endon("intermission");
	while(!level.var_2e2e040a)
	{
		wait(0.05);
	}
	clientfield::set("orb_blue_pickup", 1);
}

/*
	Name: function_bf318c09
	Namespace: namespace_da78430a
	Checksum: 0x722EE5B5
	Offset: 0x489B0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 15164
*/
function function_bf318c09()
{
	level endon("intermission");
	while(!level.var_ad38163b)
	{
		wait(0.05);
	}
	clientfield::set("orb_yellow_pickup", 1);
}

/*
	Name: function_903925d4
	Namespace: namespace_da78430a
	Checksum: 0xB7558EFD
	Offset: 0x48A00
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 15184
*/
function function_903925d4()
{
	level endon("intermission");
	while(!level.var_4738d26a)
	{
		wait(0.05);
	}
	clientfield::set("orb_green_pickup", 0);
	wait(0.05);
	clientfield::set("orb_green_pickup2", 1);
	return;
	continue;
}

/*
	Name: function_d4d92364
	Namespace: namespace_da78430a
	Checksum: 0xD4184A3D
	Offset: 0x48A78
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 15208
*/
function function_d4d92364()
{
	level endon("intermission");
	while(!level.var_60d3a457)
	{
		wait(0.05);
	}
	clientfield::set("orb_red_pickup", 0);
	wait(0.05);
	clientfield::set("orb_red_pickup2", 1);
}

/*
	Name: function_d7a9e235
	Namespace: namespace_da78430a
	Checksum: 0x3EDCC238
	Offset: 0x48AF0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 15230
*/
function function_d7a9e235()
{
	level endon("intermission");
	while(!level.var_827912e0)
	{
		wait(0.05);
	}
	clientfield::set("orb_blue_pickup", 0);
	wait(0.05);
	clientfield::set("orb_blue_pickup2", 1);
}

/*
	Name: function_978389a9
	Namespace: namespace_da78430a
	Checksum: 0x8BF34709
	Offset: 0x48B68
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 15252
*/
function function_978389a9()
{
	level endon("intermission");
	while(!level.var_3b17bf71)
	{
		wait(0.05);
	}
	clientfield::set("orb_yellow_pickup", 0);
	wait(0.05);
	clientfield::set("orb_yellow_pickup2", 1);
}

/*
	Name: function_f653fb27
	Namespace: namespace_da78430a
	Checksum: 0xF754F72
	Offset: 0x48BE0
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 15274
*/
function function_f653fb27()
{
	return self.characterindex + 1;
}

/*
	Name: function_3bc995f5
	Namespace: namespace_da78430a
	Checksum: 0xACD0F820
	Offset: 0x48BF8
	Size: 0x5C
	Parameters: 2
	Flags: None
	Line Number: 15289
*/
function function_3bc995f5(uimodel, duration)
{
	self endon("disconnect");
	self clientfield::set_player_uimodel(uimodel, 1);
	wait(duration);
	self clientfield::set_player_uimodel(uimodel, 0);
}

