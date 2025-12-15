#include scripts\codescripts\struct;
#include scripts\shared\ai\margwa;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_ai_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_timer;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_ball;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\craftables\_zm_craftables;
#include scripts\zm\zm_genesis_round_bosses;
#include scripts\zm\zm_genesis_util;
#include scripts\zm\zm_genesis_wearables;

#namespace namespace_c149ef1;

/*
	Name: __init__sytem__
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x6B78
	Size: 0x80
	Parameters: 0
	Flags: AutoExec
	Line Number: 44
*/
function autoexec __init__sytem__()
{
	level.var_9b0e8260 = &namespace_6929903c::spawn_boss;
	level.var_fab7b425 = &ball::function_18041b1b;
	level.var_a4d84208 = &function_a4d84208;
	system::register("zm_genesis_vo", &__init__, undefined, undefined);
}

/*
	Name: function_a4d84208
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x6C00
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function function_a4d84208()
{
	wearables::function_f6b20985("s_helm_of_siegfried", "c_zom_dlc4_player_siegfried_helmet", "j_head", 0);
	wearables::function_f6b20985("s_helm_of_the_king", "c_zom_dlc4_player_king_helmet", "j_head", 0);
	wearables::function_f6b20985("s_dire_wolf_head", "c_zom_dlc4_player_direwolf_helmet", "j_head", 0);
	wearables::function_f6b20985("s_keeper_skull_head", "c_zom_dlc4_player_keeper_helmet", "j_head", 0);
	wearables::function_f6b20985("s_margwa_head", "c_zom_dlc4_player_margwa_helmet", "j_head", 0);
	wearables::function_f6b20985("s_apothicon_mask", "c_zom_dlc4_player_apothican_helmet", "j_head", -30);
	wearables::function_f6b20985("s_fury_head", "c_zom_dlc4_player_fury_helmet", "j_head", -30);
	return;
	ERROR: Bad function call
}

/*
	Name: __init__
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x6D38
	Size: 0x2110
	Parameters: 0
	Flags: None
	Line Number: 85
*/
function __init__()
{
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	callback::on_laststand(&function_e658d896);
	level.a_e_speakers = [];
	level thread function_7884e6b8();
	level.audio_get_mod_type = &function_642e6aef;
	level flag::init("story_playing");
	level flag::init("area_visit_new_round");
	level flag::init("boss_round");
	level flag::init("mega_round_end_shad_talking");
	level flag::init("mega_round_end_abcd_talking");
	level flag::init("abcd_speaking");
	level flag::init("shadowman_speaking");
	level flag::init("sophia_speaking");
	level flag::init("wisp_abcd_speaking");
	level flag::init("wisp_shad_speaking");
	level flag::init("pap_entered");
	level flag::init("pap_artery_destroyed");
	/#
		level flag::init("Dev Block strings are not supported");
	#/
	zm_spawner::register_zombie_death_event_callback(&function_f7879c72);
	spawner::add_archetype_spawn_function("apothicon_fury", &function_cc2b9e13, "fury_spotted", 50, 30);
	spawner::add_archetype_spawn_function("keeper", &function_cc2b9e13, "keeper_spotted", 60, 30);
	spawner::add_archetype_spawn_function("margwa", &function_cc2b9e13, "margwa_spotted", 90, 20);
	spawner::add_archetype_spawn_function("mechz", &function_cc2b9e13, "mechz_spotted", 90, 20);
	spawner::add_archetype_spawn_function("parasite", &function_cc2b9e13, "parasite_spotted", 50, 45);
	spawner::add_archetype_spawn_function("spider", &function_cc2b9e13, "spider_spotted", 50, 45);
	if(!isdefined(level.var_8c92b387))
	{
		level.var_8c92b387 = [];
	}
	level.var_9aa82ff8 = [];
	level.var_9aa82ff8["visit_asylum"] = 0;
	level.var_9aa82ff8["visit_castle"] = 0;
	level.var_9aa82ff8["visit_prison"] = 0;
	level.var_9aa82ff8["visit_prototype"] = 0;
	level.var_9aa82ff8["visit_temple"] = 0;
	level.var_9aa82ff8["visit_theater"] = 0;
	level.var_9aa82ff8["visit_tomb"] = 0;
	level.var_8c92b387["visit_asylum"] = [];
	level.var_8c92b387["visit_asylum"][0] = Array("vox_plr_0_room_verrukt_0");
	level.var_8c92b387["visit_asylum"][1] = Array("vox_plr_1_room_verrukt_0");
	level.var_8c92b387["visit_asylum"][2] = Array("vox_plr_2_room_verrukt_0");
	level.var_8c92b387["visit_asylum"][3] = Array("vox_plr_3_room_verrukt_0");
	level.var_8c92b387["visit_castle"] = [];
	level.var_8c92b387["visit_castle"][0] = Array("vox_plr_0_room_undercroft_0");
	level.var_8c92b387["visit_castle"][1] = Array("vox_plr_1_room_undercroft_0");
	level.var_8c92b387["visit_castle"][2] = Array("vox_plr_2_room_undercroft_0");
	level.var_8c92b387["visit_castle"][3] = Array("vox_plr_3_room_undercroft_0");
	level.var_8c92b387["visit_prison"] = [];
	level.var_8c92b387["visit_prison"][0] = Array("vox_plr_0_room_prison_0");
	level.var_8c92b387["visit_prison"][1] = Array("vox_plr_1_room_prison_0");
	level.var_8c92b387["visit_prison"][2] = Array("vox_plr_2_room_prison_0");
	level.var_8c92b387["visit_prison"][3] = Array("vox_plr_3_room_prison_0");
	level.var_8c92b387["visit_prototype"] = [];
	level.var_8c92b387["visit_prototype"][0] = Array("vox_plr_0_room_nacht_0");
	level.var_8c92b387["visit_prototype"][1] = Array("vox_plr_1_room_nacht_0");
	level.var_8c92b387["visit_prototype"][2] = Array("vox_plr_2_room_nacht_0");
	level.var_8c92b387["visit_prototype"][3] = Array("vox_plr_3_room_nacht_0");
	level.var_8c92b387["visit_temple"] = [];
	level.var_8c92b387["visit_temple"][0] = Array("vox_plr_0_room_shangri_0");
	level.var_8c92b387["visit_temple"][1] = Array("vox_plr_1_room_shangri_0");
	level.var_8c92b387["visit_temple"][2] = Array("vox_plr_2_room_shangri_0");
	level.var_8c92b387["visit_temple"][3] = Array("vox_plr_3_room_shangri_0");
	level.var_8c92b387["visit_theater"] = [];
	level.var_8c92b387["visit_theater"][0] = Array("vox_plr_0_room_kino_0");
	level.var_8c92b387["visit_theater"][1] = Array("vox_plr_1_room_kino_0");
	level.var_8c92b387["visit_theater"][2] = Array("vox_plr_2_room_kino_0");
	level.var_8c92b387["visit_theater"][3] = Array("vox_plr_3_room_kino_0");
	level.var_8c92b387["visit_tomb"] = [];
	level.var_8c92b387["visit_tomb"][0] = Array("vox_plr_0_room_trenches_0");
	level.var_8c92b387["visit_tomb"][1] = Array("vox_plr_1_room_trenches_0");
	level.var_8c92b387["visit_tomb"][2] = Array("vox_plr_2_room_trenches_0");
	level.var_8c92b387["visit_tomb"][3] = Array("vox_plr_3_room_trenches_0");
	level.var_8c92b387["mega_round_end_shad"] = Array("vox_shad_shadow_downed_0", "vox_shad_shadow_teasing_0");
	function_1399b96f("boss_round_margwa", "vox_shad_margwas_spawn_", 4, 1);
	function_1399b96f("boss_round_mechz", "vox_shad_panzersoldat_spawn_", 4, 1);
	level.var_fb47733c = Array("shad", "abcd");
	function_1399b96f("chaos_round_start", "vox_shad_chaos_start_", 12, 1);
	function_1399b96f("chaos_round_spawn_general", "vox_shad_general_chaos_spawn_", 9, 1);
	function_1399b96f("chaos_round_spawn_keepers", "vox_shad_keepers_spawn_", 4, 1);
	function_1399b96f("chaos_round_spawn_parasite", "vox_shad_parasites_spawn_", 4, 1);
	function_1399b96f("chaos_round_spawn_apothicon", "vox_shad_apothicon_spawn_", 4, 1);
	level.var_8c92b387["mega_round_end_abcd"] = [];
	level.var_8c92b387["mega_round_end_abcd"][0] = Array("vox_abcd_monty_first_appear_0", "vox_abcd_monty_first_appear_1");
	level.var_8c92b387["mega_round_end_abcd"][1] = Array("vox_abcd_monty_second_appear_0", "vox_abcd_monty_second_appear_1", "vox_abcd_monty_second_appear_2");
	level.var_8c92b387["mega_round_end_abcd"][2] = Array("vox_abcd_monty_third_appear_0", "vox_abcd_monty_third_appear_1", "vox_abcd_monty_third_appear_2");
	level.var_7b3abc9b = Array("abcd", "abcd", "shad");
	function_1399b96f("corruption_engine_override", "vox_shad_general_chaos_spawn_", 9, 1);
	function_1399b96f("misc_abcd_encouragement", "vox_abcd_misc_encouragement_", 7, 1);
	function_1399b96f("dr_monty_chastisement", "vox_abcd_misc_chastisement_", 12, 0);
	function_1399b96f("shadowman_taunt_downed_demp", "vox_shad_downed_dempsey_", 2, 0);
	function_1399b96f("shadowman_taunt_downed_niko", "vox_shad_downed_nikolai_", 2, 0);
	function_1399b96f("shadowman_taunt_downed_rich", "vox_shad_downed_richtofen_", 2, 0);
	function_1399b96f("shadowman_taunt_downed_take", "vox_shad_downed_takeo_", 3, 0);
	level.var_8c92b387["fun_facts_intro"] = Array("vox_abcd_monty_facts_0", "vox_abcd_monty_facts_1");
	level.var_8c92b387["fun_facts_activate"] = Array("vox_abcd_player_activate_radio_0");
	level.var_8c92b387["fun_facts"] = [];
	level.var_8c92b387["fun_facts"][0] = Array("vox_abcd_monty_dempsey_0", "vox_abcd_monty_dempsey_1", "vox_abcd_monty_dempsey_2", "vox_abcd_monty_dempsey_3", "vox_abcd_monty_dempsey_4", "vox_abcd_monty_dempsey_5", "vox_abcd_monty_dempsey_6");
	level.var_8c92b387["fun_facts"][1] = Array("vox_abcd_monty_nikolai_0", "vox_abcd_monty_nikolai_1", "vox_abcd_monty_nikolai_2", "vox_abcd_monty_nikolai_3", "vox_abcd_monty_nikolai_4", "vox_abcd_monty_nikolai_5", "vox_abcd_monty_nikolai_6");
	level.var_8c92b387["fun_facts"][2] = Array("vox_abcd_monty_richtofen_0", "vox_abcd_monty_richtofen_1", "vox_abcd_monty_richtofen_2", "vox_abcd_monty_richtofen_3", "vox_abcd_monty_richtofen_4", "vox_abcd_monty_richtofen_5");
	level.var_8c92b387["fun_facts"][3] = Array("vox_abcd_monty_takeo_0", "vox_abcd_monty_takeo_1", "vox_abcd_monty_takeo_2", "vox_abcd_monty_takeo_3", "vox_abcd_monty_takeo_4", "vox_abcd_monty_takeo_5");
	level.var_8c92b387["acquire_audiolog"] = Array("vox_plr_0_log_acquire_0", "vox_plr_1_log_acquire_0", "vox_plr_2_log_acquire_0", "vox_plr_3_log_acquire_0");
	level.var_8c92b387["sophia_appears_1_convo"] = [];
	level.var_8c92b387["sophia_appears_1_convo"][0] = Array("vox_soph_sophia_appears_0_0", "vox_plr_0_sophia_appears_1_0", "vox_plr_2_sophia_appears_1_0");
	level.var_8c92b387["sophia_appears_1_convo"][1] = Array("vox_soph_sophia_appears_0_0", "vox_plr_1_sophia_appears_1_0", "vox_plr_2_sophia_appears_1_0");
	level.var_8c92b387["sophia_appears_1_convo"][2] = Array("vox_soph_sophia_appears_0_0", "vox_plr_2_sophia_appears_1_0");
	level.var_8c92b387["sophia_appears_1_convo"][3] = Array("vox_soph_sophia_appears_0_0", "vox_plr_3_sophia_appears_1_0", "vox_plr_2_sophia_appears_1_0");
	level.var_8c92b387["sophia_appears_2_convo"] = [];
	level.var_8c92b387["sophia_appears_2_convo"][0] = Array("vox_soph_sophia_appears_2_0", "vox_plr_0_sophia_appears_3_0", "vox_plr_2_sophia_appears_3_0");
	level.var_8c92b387["sophia_appears_2_convo"][1] = Array("vox_soph_sophia_appears_2_0", "vox_plr_1_sophia_appears_3_0", "vox_plr_2_sophia_appears_3_0");
	level.var_8c92b387["sophia_appears_2_convo"][2] = Array("vox_soph_sophia_appears_2_0", "vox_plr_2_sophia_appears_3_0");
	level.var_8c92b387["sophia_appears_2_convo"][3] = Array("vox_soph_sophia_appears_2_0", "vox_plr_3_sophia_appears_3_0", "vox_plr_2_sophia_appears_3_0");
	level.var_8c92b387["sophia_appears_2_abcd_vo"] = Array("vox_abcd_maxis_sophia_0", "vox_abcd_maxis_sophia_1");
	level.var_8c92b387["sophia_activates_teleporter"] = "vox_soph_sophia_appears_4_0";
	level.var_8c92b387["teleporter_sophia_nag"] = Array("vox_soph_sophia_appears_4_1", "vox_soph_sophia_appears_4_2", "vox_soph_sophia_appears_4_3", "vox_soph_sophia_appears_4_4");
	level.var_8c92b387["sams_room_no_book_convo"] = [];
	level.var_8c92b387["sams_room_no_book_convo"][0] = Array("vox_plr_0_sams_room_no_book_0", "vox_plr_2_sams_room_no_book_0");
	level.var_8c92b387["sams_room_no_book_convo"][1] = Array("vox_plr_1_sams_room_no_book_0", "vox_plr_2_sams_room_no_book_0");
	level.var_8c92b387["sams_room_no_book_convo"][2] = Array("vox_plr_2_sams_room_no_book_0");
	level.var_8c92b387["sams_room_no_book_convo"][3] = Array("vox_plr_3_sams_room_no_book_0", "vox_plr_2_sams_room_no_book_0");
	level.var_8c92b387["sams_room_with_book_convo"] = [];
	level.var_8c92b387["sams_room_with_book_convo"][0] = Array("vox_plr_0_sams_room_with_book_0", "vox_plr_2_sams_room_with_book_0");
	level.var_8c92b387["sams_room_with_book_convo"][1] = Array("vox_plr_1_sams_room_with_book_0", "vox_plr_2_sams_room_with_book_0");
	level.var_8c92b387["sams_room_with_book_convo"][2] = Array("vox_plr_2_sams_room_with_book_0");
	level.var_8c92b387["sams_room_with_book_convo"][3] = Array("vox_plr_3_sams_room_with_book_0", "vox_plr_2_sams_room_with_book_0");
	level.var_8c92b387["summoning_key_pickup"] = Array("vox_plr_0_summoning_key_acquire_0_0", "vox_plr_1_summoning_key_acquire_0_0", "vox_plr_2_summoning_key_acquire_0_0", "vox_plr_3_summoning_key_acquire_0_0");
	function_1399b96f("summoning_key_pickup_abcd_overt", "vox_abcd_explain_summoning_key_", 4, 0);
	level.var_8c92b387["toy_3_abcd"] = "vox_abcd_before_ee_completion_0";
	level.var_14dff117 = 0;
	level.var_8c92b387["boss_start_shad"] = "vox_shad_shadow_second_battle_10";
	level.var_8c92b387["boss_start_response"] = Array("vox_plr_0_boss_battle_0_0", "vox_plr_1_boss_battle_0_0", "vox_plr_2_boss_battle_0_0", "vox_plr_3_boss_battle_0_0");
	level.var_8c92b387["throw_sophia_summoning_key"] = [];
	level.var_8c92b387["throw_sophia_summoning_key"][0] = Array::randomize(Array("vox_plr_0_boss_battle_1_0", "vox_plr_0_boss_battle_1_1", "vox_plr_0_boss_battle_1_2"));
	level.var_8c92b387["throw_sophia_summoning_key"][1] = Array::randomize(Array("vox_plr_1_boss_battle_1_0", "vox_plr_1_boss_battle_1_1", "vox_plr_1_boss_battle_1_2"));
	level.var_8c92b387["throw_sophia_summoning_key"][2] = Array::randomize(Array("vox_plr_2_boss_battle_1_0", "vox_plr_2_boss_battle_1_1", "vox_plr_2_boss_battle_1_2"));
	level.var_8c92b387["throw_sophia_summoning_key"][3] = Array::randomize(Array("vox_plr_3_boss_battle_1_0", "vox_plr_3_boss_battle_1_1", "vox_plr_3_boss_battle_1_2"));
	function_1399b96f("sophia_firing", "vox_soph_boss_battle_2_", 5, 1);
	level.var_8c92b387["shad_boss_fight_killing_blow_response"] = Array("vox_plr_0_boss_battle_3_0", "vox_plr_1_boss_battle_3_0", "vox_plr_2_boss_battle_3_0", "vox_plr_3_boss_battle_3_0");
	level.var_8c92b387["shad_boss_taunts"] = [];
	var_4f57804e = Array("vox_shad_shadow_first_battle_1", "vox_shad_shadow_first_battle_3", "vox_shad_shadow_first_battle_4", "vox_shad_shadow_first_battle_7", "vox_shad_shadow_first_battle_8");
	var_295505e5 = Array("vox_shad_shadow_first_battle_9", "vox_shad_shadow_second_battle_1", "vox_shad_shadow_second_battle_3", "vox_shad_shadow_second_battle_6", "vox_shad_shadow_second_battle_8");
	var_ae9781fd = ArrayCombine(var_4f57804e, var_295505e5, 0, 0);
	level.var_8c92b387["shad_boss_taunts"] = Array::randomize(var_ae9781fd);
	function_1399b96f("shad_boss_hurt", "vox_shad_shadowman_damage_", 4, 1);
	level.var_8c92b387["shad_boss_defeated"] = "vox_shad_sahdowman_defeated_5";
	level.var_8c92b387["shad_boss_rush_read"] = Array::randomize(Array("vox_demo_boss_rush_0_0", "vox_demo_boss_rush_0_1", "vox_demo_boss_rush_0_2", "vox_demo_boss_rush_0_3"));
	level.var_8c92b387["shad_boss_rush_start_soph"] = "vox_soph_boss_rush_1_0";
	level.var_8c92b387["shad_boss_rush_start_closest_to_sophia"] = Array("vox_plr_0_boss_rush_2_0", "vox_plr_1_boss_rush_2_0", "vox_plr_2_boss_rush_2_0", "vox_plr_3_boss_rush_2_0");
	function_1399b96f("shad_boss_rush_taunts", "vox_shad_dark_arena_general_", 8, 1);
	level.var_8c92b387["wisp_abcd"] = [];
	level.var_8c92b387["wisp_abcd"][0][0] = [];
	level.var_8c92b387["wisp_abcd"][0][0] = Array("vox_stub");
	level.var_8c92b387["wisp_abcd"][1] = [];
	level.var_8c92b387["wisp_abcd"][1][0] = Array("vox_abcd_maxis_trouble_0", "vox_abcd_maxis_trouble_1", "vox_abcd_maxis_trouble_2");
	level.var_8c92b387["wisp_abcd"][1][1] = Array("vox_abcd_the_infinite_0", "vox_abcd_the_infinite_1", "vox_abcd_the_infinite_2", "vox_abcd_the_infinite_3", "vox_abcd_the_infinite_4");
	level.var_8c92b387["wisp_abcd"][1][2] = Array("vox_abcd_apothicons_1_0", "vox_abcd_apothicons_1_1", "vox_abcd_apothicons_1_2");
	level.var_8c92b387["wisp_abcd"][1][3] = Array("vox_abcd_apothicons_2_0", "vox_abcd_apothicons_2_1", "vox_abcd_apothicons_2_2", "vox_abcd_apothicons_2_3", "vox_abcd_apothicons_2_4", "vox_abcd_apothicons_2_5");
	level.var_8c92b387["wisp_shad"] = [];
	level.var_8c92b387["wisp_shad"][0][0] = [];
	level.var_8c92b387["wisp_shad"][0][0] = Array("vox_stub");
	level.var_8c92b387["wisp_shad"][1] = [];
	level.var_8c92b387["wisp_shad"][1][0] = Array("vox_shad_shadow_downed_1");
	level.var_8c92b387["wisp_shad"][1][1] = Array("vox_shad_shadow_downed_3");
	level.var_8c92b387["wisp_shad"][1][2] = Array("vox_shad_shadow_teasing_1");
	level.var_8c92b387["wisp_shad"][1][3] = Array("vox_shad_shadow_first_battle_2", "vox_shad_shadow_first_battle_0", "vox_shad_shadow_first_battle_5", "vox_shad_shadow_first_battle_6");
	level.var_8c92b387["wisp_abcd"][2] = [];
	level.var_8c92b387["wisp_abcd"][2][0] = Array("vox_abcd_explain_shadowman_0", "vox_abcd_explain_shadowman_1", "vox_abcd_explain_shadowman_2", "vox_abcd_explain_shadowman_3");
	level.var_8c92b387["wisp_abcd"][2][1] = Array("vox_abcd_explain_keepers_0", "vox_abcd_explain_keepers_1", "vox_abcd_explain_keepers_2", "vox_abcd_explain_keepers_3", "vox_abcd_explain_keepers_4");
	level.var_8c92b387["wisp_abcd"][2][2] = Array("vox_abcd_my_best_0", "vox_abcd_my_best_1", "vox_abcd_my_best_2", "vox_abcd_my_best_3", "vox_abcd_my_best_4");
	level.var_8c92b387["wisp_abcd"][2][3] = Array("vox_abcd_monty_warn_shadowman_0", "vox_abcd_monty_warn_shadowman_1");
	level.var_8c92b387["wisp_abcd"][3] = [];
	level.var_8c92b387["wisp_abcd"][3][0] = Array("vox_abcd_monty_trouble_1", "vox_abcd_monty_trouble_2", "vox_abcd_monty_trouble_3", "vox_abcd_monty_trouble_4");
	level.var_8c92b387["wisp_abcd"][3][1] = Array("vox_abcd_monty_reflects_0", "vox_abcd_monty_reflects_1", "vox_abcd_monty_reflects_2", "vox_abcd_monty_reflects_3", "vox_abcd_monty_reflects_4");
	level.var_8c92b387["wisp_abcd"][3][2] = Array("vox_abcd_monty_help_people_0", "vox_abcd_monty_help_people_1", "vox_abcd_monty_help_people_2", "vox_abcd_monty_help_people_3", "vox_abcd_monty_help_people_4");
	var_1c099e34 = Array("vox_abcd_monty_concerned_0", "vox_abcd_monty_concerned_1", "vox_abcd_monty_concerned_2");
	level.var_8c92b387["wisp_abcd"][3][2] = ArrayCombine(level.var_8c92b387["wisp_abcd"][3][2], var_1c099e34, 0, 0);
	level.var_8c92b387["wisp_abcd"][3][3] = Array("vox_abcd_monty_really_concerned_0", "vox_abcd_monty_really_concerned_1", "vox_abcd_monty_really_concerned_2", "vox_abcd_monty_really_concerned_3", "vox_abcd_monty_really_concerned_4");
	level.var_8c92b387["wisp_shad"][2] = [];
	level.var_8c92b387["wisp_shad"][2][0] = Array("vox_shad_shadow_downed_2");
	level.var_8c92b387["wisp_shad"][2][1] = Array("vox_shad_shadow_teasing_2");
	level.var_8c92b387["wisp_shad"][2][2] = Array("vox_shad_shadow_teasing_3");
	level.var_8c92b387["wisp_shad"][2][3] = Array("vox_shad_shadow_second_battle_0", "vox_shad_shadow_second_battle_2", "vox_shad_shadow_second_battle_5", "vox_shad_shadow_second_battle_4", "vox_shad_shadow_second_battle_7", "vox_shad_shadow_second_battle_9");
	level.craft_shield_piece_pickup_vo_override = &function_60f0dfbc;
	level thread function_26f9afa2();
	/#
		level thread function_632967ad();
	#/
}

/*
	Name: function_1399b96f
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x8E50
	Size: 0x68
	Parameters: 4
	Flags: None
	Line Number: 288
*/
function function_1399b96f(str_key, str_base, var_852832cf, b_randomize)
{
	var_d44b84c3 = function_ac5a16bb(str_base, var_852832cf);
	function_1f9abb06(str_key, var_d44b84c3, b_randomize);
}

/*
	Name: function_1f9abb06
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x8EC0
	Size: 0x120
	Parameters: 3
	Flags: None
	Line Number: 304
*/
function function_1f9abb06(str_key, var_d44b84c3, b_randomize)
{
	/#
		/#
			Assert(isdefined(str_key), "Dev Block strings are not supported");
		#/
	#/
	/#
		/#
			Assert(isdefined(var_d44b84c3), "Dev Block strings are not supported");
		#/
	#/
	if(isdefined(b_randomize) && b_randomize)
	{
		var_d44b84c3 = Array::randomize(var_d44b84c3);
	}
	if(!isdefined(level.var_8c92b387[str_key]))
	{
		level.var_8c92b387[str_key] = var_d44b84c3;
	}
	else
	{
		zm_utility::debug_print("Appending to existing vo list " + str_key);
		level.var_8c92b387[str_key] = ArrayCombine(level.var_8c92b387[str_key], var_d44b84c3, 0, 0);
	}
}

/*
	Name: function_ac5a16bb
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x8FE8
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 341
*/
function function_ac5a16bb(str_base, var_852832cf)
{
	a_str = [];
	for(i = 0; i <= var_852832cf; i++)
	{
		a_str[i] = str_base + i;
	}
	return a_str;
}

/*
	Name: on_player_spawned
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x9058
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 361
*/
function on_player_spawned()
{
	self.isSpeaking = 0;
	self.n_vo_priority = 0;
	self thread function_2b0fa0c0();
	self thread function_1af15c36();
	self thread function_ee206f01();
	self thread function_4eab9dac();
	self thread function_e6873e6a();
	self.var_f069d80e = 0;
	self thread function_f24af040();
	return;
}

/*
	Name: on_player_connect
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x9118
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 385
*/
function on_player_connect()
{
	self.var_59daaa5e = [];
	self.var_59daaa5e["visit_asylum"] = 0;
	self.var_59daaa5e["visit_castle"] = 0;
	self.var_59daaa5e["visit_prison"] = 0;
	self.var_59daaa5e["visit_prototype"] = 0;
	self.var_59daaa5e["visit_temple"] = 0;
	self.var_59daaa5e["visit_theater"] = 0;
	return;
	ERROR: Bad function call
}

/*
	Name: function_26f9afa2
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x91B0
	Size: 0x258
	Parameters: 0
	Flags: None
	Line Number: 408
*/
function function_26f9afa2()
{
	level.var_43bc2077 = [];
	level thread function_3939d375();
	level thread function_7e1a463f();
	level thread function_1ac8eab3();
	level thread function_fbd71326();
	level thread function_b254fea1();
	level thread function_59a4b1e6();
	level thread function_dccb9cbe();
	level thread function_c3d7d23e();
	level thread function_30fcd603();
	level thread function_d4efe48a();
	level thread function_7e2041d5();
	level thread function_20aa8fb0();
	level thread function_5ebe7974();
	level thread function_a2bd8b29();
	level flag::wait_till("initial_blackscreen_passed");
	zm_audio::zmbVoxAdd("perk", "specialty_armorvest", "der_perk_jugga", 100, 0);
	zm_audio::zmbVoxAdd("perk", "specialty_quickrevive", "der_perk_revive", 100, 0);
	zm_audio::zmbVoxAdd("perk", "specialty_fastreload", "der_perk_speed", 100, 0);
	zm_audio::zmbVoxAdd("perk", "specialty_doubletap2", "der_perk_double", 100, 0);
	level thread function_871342f3();
}

/*
	Name: function_871342f3
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x9410
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 443
*/
function function_871342f3(var_1b9c2b0c)
{
	flags = Array("end_of_round", "spawn_zombies", "hash_9a954bfc");
	for(;;)
	{
		level util::waittill_any_array(flags);
		level.zombie_ai_limit = level.zombie_vars["zombie_max_ai"];
	}
}

/*
	Name: function_7884e6b8
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x9490
	Size: 0x14D0
	Parameters: 0
	Flags: None
	Line Number: 463
*/
function function_7884e6b8()
{
	self endon("_zombie_game_over");
	level.var_4ea3bfd0 = [];
	level.var_4ea3bfd0[0][0] = Array("vox_plr_0_round1_start_0", "vox_plr_2_round1_start_response_0_0");
	level.var_4ea3bfd0[0][1] = Array("vox_plr_0_round1_end_0", "vox_plr_2_round1_end_response_0_0");
	level.var_4ea3bfd0[0][2] = Array("vox_plr_0_round2_end_0", "vox_plr_2_round2_end_response_0_0");
	level.var_4ea3bfd0[1][0] = Array("vox_plr_1_round1_start_0", "vox_plr_2_round1_start_response_0_0");
	level.var_4ea3bfd0[1][1] = Array("vox_plr_1_round1_end_0", "vox_plr_2_round1_end_response_0_0");
	level.var_4ea3bfd0[1][2] = Array("vox_plr_1_round2_end_0", "vox_plr_2_round2_end_response_0_0");
	level.var_4ea3bfd0[3][0] = Array("vox_plr_3_round1_start_0", "vox_plr_2_round1_start_response_0_0");
	level.var_4ea3bfd0[3][1] = Array("vox_plr_3_round1_end_0", "vox_plr_2_round1_end_response_0_0");
	level.var_4ea3bfd0[3][2] = Array("vox_plr_3_round2_end_0", "vox_plr_2_round2_end_response_0_0");
	level.var_f8331b71 = [];
	level.var_f8331b71[0] = Array(0, 0.75);
	level.var_f8331b71[1] = Array(0, 0.75);
	level.var_f8331b71[2] = Array(0, 0.75);
	var_38607083 = [];
	var_38607083[0] = Array("vox_plr_0_interaction_rich_demp_1_0", "vox_plr_2_interaction_rich_demp_1_0");
	var_38607083[1] = Array("vox_plr_0_interaction_rich_demp_2_0", "vox_plr_2_interaction_rich_demp_2_0");
	var_38607083[2] = Array("vox_plr_0_interaction_rich_demp_3_0", "vox_plr_2_interaction_rich_demp_3_0");
	var_38607083[3] = Array("vox_plr_0_interaction_rich_demp_4_0", "vox_plr_2_interaction_rich_demp_4_0");
	var_38607083[4] = Array("vox_plr_0_interaction_rich_demp_5_0", "vox_plr_2_interaction_rich_demp_5_0");
	var_7ff3a3c1 = [];
	var_7ff3a3c1[0] = Array(0, 0.75);
	var_7ff3a3c1[1] = Array(0, 0.75);
	var_7ff3a3c1[2] = Array(0, 0.75);
	var_7ff3a3c1[3] = Array(0, 0.75);
	var_7ff3a3c1[4] = Array(0, 0.75);
	var_98d3df13 = 0;
	var_69c11398 = [];
	var_69c11398[0] = Array("vox_plr_2_interaction_rich_niko_1_0", "vox_plr_1_interaction_rich_niko_1_0");
	var_69c11398[1] = Array("vox_plr_1_interaction_rich_niko_2_0", "vox_plr_2_interaction_rich_niko_2_0");
	var_69c11398[2] = Array("vox_plr_1_interaction_rich_niko_3_0", "vox_plr_2_interaction_rich_niko_3_0");
	var_69c11398[3] = Array("vox_plr_1_interaction_rich_niko_4_0", "vox_plr_2_interaction_rich_niko_4_0");
	var_69c11398[4] = Array("vox_plr_1_interaction_rich_niko_5_0", "vox_plr_2_interaction_rich_niko_5_0");
	var_3b4286c8 = [];
	var_3b4286c8[0] = Array(0, 0.75);
	var_3b4286c8[1] = Array(0, 0.75);
	var_3b4286c8[2] = Array(0, 0.75, 0.75);
	var_3b4286c8[3] = Array(0, 0.75);
	var_3b4286c8[4] = Array(0, 0.75);
	var_f5c2b1e8 = 0;
	var_e2b4828c = [];
	var_e2b4828c[0] = Array("vox_plr_3_interaction_rich_takeo_1_0", "vox_plr_2_interaction_rich_takeo_1_0");
	var_e2b4828c[1] = Array("vox_plr_3_interaction_rich_takeo_2_0", "vox_plr_2_interaction_rich_takeo_2_0");
	var_e2b4828c[2] = Array("vox_plr_3_interaction_rich_takeo_3_0", "vox_plr_2_interaction_rich_takeo_3_0");
	var_e2b4828c[3] = Array("vox_plr_2_interaction_rich_takeo_4_0", "vox_plr_3_interaction_rich_takeo_4_0");
	var_e2b4828c[4] = Array("vox_plr_2_interaction_rich_takeo_5_0", "vox_plr_3_interaction_rich_takeo_5_0");
	var_4cce0630 = [];
	var_4cce0630[0] = Array(0, 0.75);
	var_4cce0630[1] = Array(0, 0.75);
	var_4cce0630[2] = Array(0, 0.75);
	var_4cce0630[3] = Array(0, 0.75);
	var_4cce0630[4] = Array(0, 0.75);
	var_9589fa70 = 0;
	var_1f05f8f0 = [];
	var_1f05f8f0[0] = Array("vox_plr_0_interaction_demp_niko_1_0", "vox_plr_1_interaction_demp_niko_1_0");
	var_1f05f8f0[1] = Array("vox_plr_0_interaction_demp_niko_2_0", "vox_plr_1_interaction_demp_niko_2_0");
	var_1f05f8f0[2] = Array("vox_plr_1_interaction_demp_niko_3_0", "vox_plr_0_interaction_demp_niko_3_0");
	var_1f05f8f0[3] = Array("vox_plr_1_interaction_demp_niko_4_0", "vox_plr_0_interaction_demp_niko_4_0");
	var_1f05f8f0[4] = Array("vox_plr_1_interaction_demp_niko_5_0", "vox_plr_0_interaction_demp_niko_5_0");
	var_3993ba28 = [];
	var_3993ba28[0] = Array(0, 0.75);
	var_3993ba28[1] = Array(0, 0.75);
	var_3993ba28[2] = Array(0, 0.75);
	var_3993ba28[3] = Array(0, 0.75);
	var_3993ba28[4] = Array(0, 0.75);
	var_ea6d33c8 = 0;
	var_26887a74 = [];
	var_26887a74[0] = Array("vox_plr_0_interaction_demp_takeo_1_0", "vox_plr_3_interaction_demp_takeo_1_0");
	var_26887a74[1] = Array("vox_plr_0_interaction_demp_takeo_2_0", "vox_plr_3_interaction_demp_takeo_2_0");
	var_26887a74[2] = Array("vox_plr_3_interaction_demp_takeo_3_0", "vox_plr_0_interaction_demp_takeo_3_0");
	var_26887a74[3] = Array("vox_plr_3_interaction_demp_takeo_4_0", "vox_plr_0_interaction_demp_takeo_4_0");
	var_26887a74[4] = Array("vox_plr_3_interaction_demp_takeo_5_0", "vox_plr_0_interaction_demp_takeo_5_0");
	var_52697a10 = [];
	var_52697a10[0] = Array(0, 0.75);
	var_52697a10[1] = Array(0, 0.75);
	var_52697a10[2] = Array(0, 0.75);
	var_52697a10[3] = Array(0, 0.75);
	var_52697a10[4] = Array(0, 0.75);
	var_b4e2f9d0 = 0;
	var_aeae7aa1 = [];
	var_aeae7aa1[0] = Array("vox_plr_3_interaction_takeo_niko_1_0", "vox_plr_1_interaction_takeo_niko_1_0");
	var_aeae7aa1[1] = Array("vox_plr_1_interaction_takeo_niko_2_0", "vox_plr_3_interaction_takeo_niko_2_0");
	var_aeae7aa1[2] = Array("vox_plr_1_interaction_takeo_niko_3_0", "vox_plr_3_interaction_takeo_niko_3_0");
	var_aeae7aa1[3] = Array("vox_plr_3_interaction_takeo_niko_4_0", "vox_plr_1_interaction_takeo_niko_4_0");
	var_aeae7aa1[4] = Array("vox_plr_1_interaction_takeo_niko_5_0", "vox_plr_3_interaction_takeo_niko_5_0");
	var_d3757c7 = [];
	var_d3757c7[0] = Array(0, 0.75);
	var_d3757c7[1] = Array(0, 0.75);
	var_d3757c7[2] = Array(0, 0.75);
	var_d3757c7[3] = Array(0, 0.75);
	var_d3757c7[4] = Array(0, 0.75);
	var_e60d01d = 0;
	level waittill("all_players_spawned");
	level waittill("start_of_round");
	wait(1.5);
	function_6b96bf38();
	while(1)
	{
		level waittill("end_of_round");
		wait(1.5);
		if(level.round_number == 2)
		{
			function_ef84a69b();
		}
		else if(level.round_number == 3)
		{
			function_7d7d3760();
		}
		else if(level flag::get("boss_round"))
		{
			level flag::clear("boss_round");
			if(level.var_fb47733c.size > 0)
			{
				function_58758962(level.var_fb47733c[0]);
				ArrayRemoveIndex(level.var_fb47733c, 0, 0);
			}
			level notify("hash_e6181d80");
		}
		else if(level.round_number != level.var_783db6ab && !level flag::get("mega_round_end_abcd_talking") && !level flag::get("mega_round_end_shad_talking") && level.round_number != level.var_ba0d6d40)
		{
			if(level flag::get("boss_round"))
			{
				level flag::clear("boss_round");
			}
			if(level.activePlayers.size > 1)
			{
				n_counter = 0;
				var_261100d2 = undefined;
				n_player_index = RandomInt(level.activePlayers.size);
				var_e8669 = level.activePlayers[n_player_index];
				while(!zm_utility::is_player_valid(var_e8669) && n_counter < level.activePlayers.size)
				{
					if(n_player_index + 1 < level.activePlayers.size)
					{
					}
					else
					{
					}
					n_player_index = 0;
					var_e8669 = level.activePlayers[n_player_index];
					n_counter++;
				}
				if(zm_utility::is_player_valid(var_e8669))
				{
					var_a68de872 = Array::remove_index(level.activePlayers, n_player_index);
					var_a68de872 = Array::get_all_closest(var_e8669.origin, var_a68de872, undefined, 4, 900);
					foreach(e_player in var_a68de872)
					{
						if(zm_utility::is_player_valid(e_player))
						{
							var_261100d2 = e_player;
							break;
						}
					}
				}
				else if(zm_utility::is_player_valid(var_e8669) && zm_utility::is_player_valid(var_261100d2))
				{
					var_3b5e4c24 = undefined;
					var_123bfae = Array(0, 0);
					if(var_e8669.characterindex == 0 && var_261100d2.characterindex == 2 || (var_261100d2.characterindex == 0 && var_e8669.characterindex == 2))
					{
						if(var_98d3df13 < var_38607083.size)
						{
							function_c23e3a71(var_38607083, var_98d3df13, var_7ff3a3c1, 1);
							var_98d3df13++;
						}
					}
					else if(var_e8669.characterindex == 2 && var_261100d2.characterindex == 1 || (var_261100d2.characterindex == 2 && var_e8669.characterindex == 1))
					{
						if(var_f5c2b1e8 < var_69c11398.size)
						{
							function_c23e3a71(var_69c11398, var_f5c2b1e8, var_3b4286c8, 1);
							var_f5c2b1e8++;
						}
					}
					else if(var_e8669.characterindex == 2 && var_261100d2.characterindex == 3 || (var_261100d2.characterindex == 2 && var_e8669.characterindex == 3))
					{
						if(var_9589fa70 < var_e2b4828c.size)
						{
							function_c23e3a71(var_e2b4828c, var_9589fa70, var_4cce0630, 1);
							var_9589fa70++;
						}
					}
					else if(var_e8669.characterindex == 1 && var_261100d2.characterindex == 0 || (var_261100d2.characterindex == 1 && var_e8669.characterindex == 0))
					{
						if(var_ea6d33c8 < var_1f05f8f0.size)
						{
							function_c23e3a71(var_1f05f8f0, var_ea6d33c8, var_3993ba28, 1);
							var_ea6d33c8++;
						}
					}
					else if(var_e8669.characterindex == 0 && var_261100d2.characterindex == 3 || (var_261100d2.characterindex == 0 && var_e8669.characterindex == 3))
					{
						if(var_b4e2f9d0 < var_26887a74.size)
						{
							function_c23e3a71(var_26887a74, var_b4e2f9d0, var_52697a10, 1);
							var_b4e2f9d0++;
						}
					}
					else if(var_e8669.characterindex == 1 && var_261100d2.characterindex == 3 || (var_261100d2.characterindex == 1 && var_e8669.characterindex == 3))
					{
						if(var_e60d01d < var_aeae7aa1.size)
						{
							function_c23e3a71(var_aeae7aa1, var_e60d01d, var_d3757c7, 1);
							var_e60d01d++;
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_218256bd
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xA968
	Size: 0x170
	Parameters: 1
	Flags: None
	Line Number: 689
*/
function function_218256bd(var_eca8128e)
{
	foreach(player in level.activePlayers)
	{
		if(isdefined(player))
		{
			player.dontspeak = var_eca8128e;
			player clientfield::set_to_player("isspeaking", var_eca8128e);
		}
	}
	if(var_eca8128e)
	{
		foreach(player in level.activePlayers)
		{
			while(isdefined(player) && (isdefined(player.isSpeaking) && player.isSpeaking))
			{
				wait(0.1);
			}
		}
	}
}

/*
	Name: function_cf8fccfe
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xAAE0
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 721
*/
function function_cf8fccfe(var_eca8128e)
{
	self.dontspeak = var_eca8128e;
	self clientfield::set_to_player("isspeaking", var_eca8128e);
	if(var_eca8128e)
	{
		while(isdefined(self) && (isdefined(self.isSpeaking) && self.isSpeaking))
		{
			wait(0.1);
		}
	}
}

/*
	Name: function_8ac5430
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xAB58
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 744
*/
function function_8ac5430(var_b20e186c, v_position)
{
	if(!isdefined(var_b20e186c))
	{
		var_b20e186c = 0;
	}
	if(!isdefined(v_position))
	{
		v_position = (0, 0, 0);
	}
	if(var_b20e186c)
	{
		level.sndVoxOverride = 1;
		level flag::set("story_playing");
		function_2426269b(v_position, 9999);
	}
	else
	{
		level flag::clear("story_playing");
		level.sndVoxOverride = 0;
	}
}

/*
	Name: function_13bbcb98
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xAC10
	Size: 0x200
	Parameters: 5
	Flags: None
	Line Number: 777
*/
function function_13bbcb98(str_vo_line, n_wait, b_wait_if_busy, var_a8564a44, var_43802352)
{
	if(!isdefined(n_wait))
	{
		n_wait = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	function_218256bd(1);
	var_3c529a41 = undefined;
	if(isdefined(var_43802352))
	{
		var_3c529a41 = zm_utility::get_specific_character(var_43802352);
	}
	if(isdefined(var_3c529a41))
	{
		for(i = 1; i < level.activePlayers.size; i++)
		{
			level.activePlayers[i] thread function_7b697614(str_vo_line, n_wait, b_wait_if_busy, var_a8564a44, 1, 0, var_3c529a41);
		}
		level.activePlayers[0] function_7b697614(str_vo_line, n_wait, b_wait_if_busy, var_a8564a44, 1, 0, var_3c529a41);
	}
	else
	{
		for(i = 1; i < level.activePlayers.size; i++)
		{
			level.activePlayers[i] thread function_7b697614(str_vo_line, n_wait + 0.1, b_wait_if_busy, var_a8564a44, 1, 0);
		}
		level.activePlayers[0] function_7b697614(str_vo_line, n_wait, b_wait_if_busy, var_a8564a44, 1, 0);
	}
	function_218256bd(0);
}

/*
	Name: function_672fc476
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xAE18
	Size: 0x148
	Parameters: 5
	Flags: None
	Line Number: 822
*/
function function_672fc476(a_str_vo, var_e21e86b8, b_wait_if_busy, var_a8564a44, var_43802352)
{
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	for(i = 0; i < a_str_vo.size; i++)
	{
		if(isdefined(var_e21e86b8))
		{
			if(IsArray(var_e21e86b8))
			{
				var_e27770b1 = var_e21e86b8[i];
			}
			else if(IsInt(var_e21e86b8))
			{
				var_e27770b1 = var_e21e86b8;
			}
			else
			{
				/#
					Assert(0, "Dev Block strings are not supported");
				#/
			}
			/#
			#/
		}
		else
		{
			var_e27770b1 = 0;
		}
		function_13bbcb98(a_str_vo[i], var_e27770b1, b_wait_if_busy, var_a8564a44, var_43802352);
	}
}

/*
	Name: function_c62826c9
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xAF68
	Size: 0xF8
	Parameters: 5
	Flags: None
	Line Number: 871
*/
function function_c62826c9(var_c35eec70, n_wait, b_wait_if_busy, var_a8564a44, var_43802352)
{
	if(!isdefined(n_wait))
	{
		n_wait = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	if(!IsArray(var_c35eec70))
	{
		var_31290267 = &function_13bbcb98;
	}
	else
	{
		var_31290267 = &function_672fc476;
	}
	level flag::set("abcd_speaking");
	[[var_31290267]](var_c35eec70, n_wait, b_wait_if_busy, var_a8564a44, var_43802352);
	level flag::clear("abcd_speaking");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: shadowman_say
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xB068
	Size: 0xF8
	Parameters: 5
	Flags: None
	Line Number: 906
*/
function shadowman_say(var_c35eec70, n_wait, b_wait_if_busy, var_a8564a44, var_43802352)
{
	if(!isdefined(n_wait))
	{
		n_wait = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	if(!IsArray(var_c35eec70))
	{
		var_31290267 = &function_13bbcb98;
	}
	else
	{
		var_31290267 = &function_672fc476;
	}
	level flag::set("shadowman_speaking");
	[[var_31290267]](var_c35eec70, n_wait, b_wait_if_busy, var_a8564a44, var_43802352);
	level flag::clear("shadowman_speaking");
}

/*
	Name: sophia_say
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xB168
	Size: 0x120
	Parameters: 4
	Flags: None
	Line Number: 939
*/
function sophia_say(var_c35eec70, n_wait, b_wait_if_busy, var_a8564a44)
{
	if(IsArray(var_c35eec70))
	{
		var_31290267 = &function_63c44c5a;
	}
	else if(IsString(var_c35eec70))
	{
		var_31290267 = &function_7b697614;
	}
	level flag::set("sophia_speaking");
	if(isdefined(level.var_a090a655))
	{
		level.var_a090a655 [[var_31290267]](var_c35eec70, n_wait, b_wait_if_busy, var_a8564a44);
	}
	else
	{
		level.activePlayers[0] [[var_31290267]](var_c35eec70, n_wait, b_wait_if_busy, var_a8564a44);
	}
	level flag::clear("sophia_speaking");
	return;
	ERROR: Bad function call
}

/*
	Name: function_7b697614
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xB290
	Size: 0x508
	Parameters: 7
	Flags: None
	Line Number: 973
*/
function function_7b697614(var_96896ff5, n_delay, b_wait_if_busy, var_a8564a44, var_d1295208, var_248b6239, var_a5d9e5f7)
{
	if(!isdefined(n_delay))
	{
		n_delay = 0;
	}
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	if(!isdefined(var_248b6239))
	{
		var_248b6239 = 0;
	}
	if(!isdefined(var_a5d9e5f7))
	{
		var_a5d9e5f7 = undefined;
	}
	self endon("death");
	self endon("disconnect");
	self endon("death");
	if(level flag::get("story_playing"))
	{
		return 0;
	}
	if(!(isdefined(var_d1295208) && var_d1295208) && zm_audio::areNearbySpeakersActive(10000))
	{
		return 0;
	}
	if(isdefined(self.isSpeaking) && self.isSpeaking || (isdefined(level.sndVoxOverride) && level.sndVoxOverride))
	{
		if(isdefined(b_wait_if_busy) && b_wait_if_busy)
		{
			while(isdefined(self.isSpeaking) && self.isSpeaking || (isdefined(level.sndVoxOverride) && level.sndVoxOverride))
			{
				wait(0.1);
			}
			wait(0.35);
		}
		else
		{
			return 0;
		}
	}
	if(n_delay > 0)
	{
		wait(n_delay);
	}
	if(isdefined(self.isSpeaking) && self.isSpeaking && (isdefined(self.b_wait_if_busy) && self.b_wait_if_busy))
	{
		while(isdefined(self.isSpeaking) && self.isSpeaking)
		{
			wait(0.1);
		}
	}
	else if(isdefined(self.isSpeaking) && self.isSpeaking && (!(isdefined(self.b_wait_if_busy) && self.b_wait_if_busy)) || (isdefined(level.sndVoxOverride) && level.sndVoxOverride))
	{
		return 0;
	}
	self notify(var_96896ff5 + "_vo_started");
	self.isSpeaking = 1;
	level.sndVoxOverride = 1;
	self thread function_b3baa665();
	self.n_vo_priority = var_a8564a44;
	self.str_vo_being_spoken = var_96896ff5;
	Array::add(level.a_e_speakers, self, 1);
	if(isdefined(var_a5d9e5f7))
	{
		if(var_a5d9e5f7 != self)
		{
			var_53a95046 = soundgetplaybacktime(var_96896ff5);
			if(var_53a95046 > 0)
			{
				var_18481389 = var_53a95046 / 1000;
				self playsoundtoallbutplayer(var_96896ff5, var_a5d9e5f7);
				self thread namespace_cc012897::Send(var_96896ff5, "team", var_53a95046);
				wait(var_18481389);
			}
		}
	}
	else if(var_248b6239 == 0)
	{
		var_2df3d133 = var_96896ff5 + "_vo_done";
		if(IsActor(self) || isPlayer(self))
		{
			self playsoundwithnotify(var_96896ff5, var_2df3d133, "J_head");
		}
		else
		{
			self playsoundwithnotify(var_96896ff5, var_2df3d133);
		}
		var_53a95046 = soundgetplaybacktime(var_96896ff5);
		thread namespace_cc012897::Send(var_96896ff5, "all", var_53a95046);
		self waittill(var_2df3d133);
	}
	else
	{
		var_53a95046 = soundgetplaybacktime(var_96896ff5);
		if(var_53a95046 > 0)
		{
			var_18481389 = var_53a95046 / 1000;
			self playsoundtoplayer(var_96896ff5, self);
			self thread namespace_cc012897::Send(var_96896ff5, "player", var_53a95046);
			wait(var_18481389);
		}
	}
	self function_8995134a();
	return 1;
}

/*
	Name: function_b3baa665
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xB7A0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 1101
*/
function function_b3baa665()
{
	self endon("hash_2f69a80e");
	self util::waittill_any("death", "disconnect");
	level.sndVoxOverride = 0;
}

/*
	Name: function_8995134a
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xB7E8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 1118
*/
function function_8995134a()
{
	self notify("hash_2f69a80e");
	self.str_vo_being_spoken = "";
	self.n_vo_priority = 0;
	self.isSpeaking = 0;
	level.sndVoxOverride = 0;
	b_in_a_e_speakers = 0;
	foreach(e_checkme in level.a_e_speakers)
	{
		if(e_checkme == self)
		{
			b_in_a_e_speakers = 1;
			break;
		}
	}
	if(isdefined(b_in_a_e_speakers) && b_in_a_e_speakers)
	{
		ArrayRemoveValue(level.a_e_speakers, self);
		return;
	}
}

/*
	Name: function_502f946b
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xB900
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 1151
*/
function function_502f946b(var_7a483c9a)
{
	if(!isdefined(var_7a483c9a))
	{
		var_7a483c9a = 0;
	}
	self endon("death");
	if(!(isdefined(var_7a483c9a) && var_7a483c9a))
	{
		if(level flag::get("abcd_speaking") || level flag::get("shadowman_speaking"))
		{
			return;
		}
	}
	self stopsounds();
	self notify("stop_vo_convo");
	self function_8995134a();
}

/*
	Name: function_2426269b
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xB9C0
	Size: 0x238
	Parameters: 2
	Flags: None
	Line Number: 1180
*/
function function_2426269b(v_pos, n_range)
{
	if(!isdefined(n_range))
	{
		n_range = 1000;
	}
	if(isdefined(level.a_e_speakers))
	{
		foreach(var_36ca1ecb in level.a_e_speakers)
		{
			if(!isdefined(var_36ca1ecb))
			{
				continue;
			}
			if(!isdefined(v_pos) || DistanceSquared(var_36ca1ecb.origin, v_pos) <= n_range * n_range)
			{
				if(isdefined(var_36ca1ecb.str_vo_being_spoken) && var_36ca1ecb.str_vo_being_spoken != "")
				{
					var_36ca1ecb stopsound(var_36ca1ecb.str_vo_being_spoken);
				}
				var_36ca1ecb.deleteme = 1;
				var_36ca1ecb.str_vo_being_spoken = "";
				var_36ca1ecb.n_vo_priority = 0;
				var_36ca1ecb.isSpeaking = 0;
			}
		}
		i = 0;
		while(isdefined(level.a_e_speakers) && i < level.a_e_speakers.size)
		{
			if(isdefined(level.a_e_speakers[i].deleteme) && level.a_e_speakers[i].deleteme == 1)
			{
				ArrayRemoveValue(level.a_e_speakers, level.a_e_speakers[i]);
				i = 0;
			}
			else
			{
				i++;
			}
		}
	}
}

/*
	Name: function_897246e4
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xBC00
	Size: 0x390
	Parameters: 6
	Flags: None
	Line Number: 1232
*/
function function_897246e4(var_96896ff5, n_wait, b_wait_if_busy, var_a8564a44, var_d1295208, var_248b6239)
{
	if(!isdefined(n_wait))
	{
		n_wait = 0;
	}
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	if(!isdefined(var_248b6239))
	{
		var_248b6239 = 0;
	}
	var_942373f4 = 0;
	var_9689ca97 = 0;
	var_2ea24b84 = "";
	var_81132431 = StrTok(var_96896ff5, "_");
	if(var_81132431[1] === "grop")
	{
		var_942373f4 = 1;
	}
	else if(var_81132431[7] === "pa")
	{
		var_9689ca97 = 1;
	}
	else if(var_81132431[1] === "soph")
	{
		var_2ea24b84 = "soph";
	}
	else if(var_81132431[1] === "abcd")
	{
		var_2ea24b84 = "abcd";
	}
	else if(var_81132431[1] === "shad")
	{
		var_2ea24b84 = "shad";
	}
	else if(var_81132431[1] === "plr")
	{
		var_edf0b06 = Int(var_81132431[2]);
		e_speaker = zm_utility::get_specific_character(var_edf0b06);
	}
	else
	{
		e_speaker = undefined;
		/#
			/#
				Assert(0, "Dev Block strings are not supported" + var_96896ff5 + "Dev Block strings are not supported");
			#/
		#/
	}
	if(var_2ea24b84 == "" && !var_942373f4 && !var_9689ca97)
	{
		if(zm_utility::is_player_valid(e_speaker))
		{
			e_speaker function_7b697614(var_96896ff5, n_wait, b_wait_if_busy, var_a8564a44, var_248b6239);
		}
	}
	else if(var_2ea24b84 != "")
	{
		switch(var_2ea24b84)
		{
			case "abcd":
			{
				function_c62826c9(var_96896ff5, n_wait, b_wait_if_busy, var_a8564a44);
				break;
			}
			case "shad":
			{
				shadowman_say(var_96896ff5, n_wait, b_wait_if_busy, var_a8564a44);
				break;
			}
			case "soph":
			{
				sophia_say(var_96896ff5, n_wait, b_wait_if_busy, var_a8564a44);
				break;
			}
		}
	}
	else
	{
		function_13bbcb98(var_96896ff5, n_wait, b_wait_if_busy, var_a8564a44);
	}
}

/*
	Name: function_63c44c5a
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xBF98
	Size: 0x178
	Parameters: 6
	Flags: None
	Line Number: 1336
*/
function function_63c44c5a(a_str_vo, var_e21e86b8, b_wait_if_busy, var_a8564a44, var_d1295208, var_248b6239)
{
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	if(!isdefined(var_248b6239))
	{
		var_248b6239 = 0;
	}
	function_218256bd(1);
	for(i = 0; i < a_str_vo.size; i++)
	{
		if(isdefined(var_e21e86b8))
		{
			if(IsArray(var_e21e86b8))
			{
				var_e27770b1 = var_e21e86b8[i];
			}
			else if(IsInt(var_e21e86b8))
			{
				var_e27770b1 = var_e21e86b8;
			}
		}
		else
		{
			var_e27770b1 = 0;
		}
		self function_7b697614(a_str_vo[i], var_e27770b1, b_wait_if_busy, var_a8564a44, var_d1295208, var_248b6239);
	}
	function_218256bd(0);
}

/*
	Name: function_7aa5324a
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xC118
	Size: 0x160
	Parameters: 5
	Flags: None
	Line Number: 1387
*/
function function_7aa5324a(a_str_vo, var_e21e86b8, b_wait_if_busy, var_a8564a44, var_d1295208)
{
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	function_218256bd(1);
	for(i = 0; i < a_str_vo.size; i++)
	{
		if(isdefined(var_e21e86b8))
		{
			if(IsArray(var_e21e86b8))
			{
				var_e27770b1 = var_e21e86b8[i];
			}
			else if(IsInt(var_e21e86b8))
			{
				var_e27770b1 = var_e21e86b8;
			}
		}
		else
		{
			var_e27770b1 = 0.5;
		}
		function_897246e4(a_str_vo[i], var_e27770b1, b_wait_if_busy, var_a8564a44, var_d1295208);
	}
	function_218256bd(0);
}

/*
	Name: function_c23e3a71
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xC280
	Size: 0x160
	Parameters: 6
	Flags: None
	Line Number: 1434
*/
function function_c23e3a71(var_49fefccd, n_index, var_f781d8ce, b_wait_if_busy, var_7e649f23, var_d1295208)
{
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_7e649f23))
	{
		var_7e649f23 = 0;
	}
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	/#
		/#
			Assert(isdefined(var_49fefccd), "Dev Block strings are not supported");
		#/
	#/
	/#
		/#
			Assert(n_index < var_49fefccd.size, "Dev Block strings are not supported");
		#/
	#/
	var_3b5e4c24 = var_49fefccd[n_index];
	var_123bfae = undefined;
	if(isdefined(var_f781d8ce))
	{
		/#
			/#
				Assert(n_index < var_f781d8ce.size, "Dev Block strings are not supported");
			#/
		#/
		var_123bfae = var_f781d8ce[n_index];
	}
	function_7aa5324a(var_3b5e4c24, var_123bfae, b_wait_if_busy, var_7e649f23, var_d1295208);
}

/*
	Name: function_642e6aef
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xC3E8
	Size: 0x590
	Parameters: 7
	Flags: None
	Line Number: 1482
*/
function function_642e6aef(impact, mod, weapon, zombie, instakill, dist, player)
{
	var_adac242b = 4096;
	var_af03c4a6 = 160000;
	if(zombie.damageWeapon.name == "sticky_grenade_widows_wine")
	{
		return "default";
	}
	if(zombie.damageWeapon.name == "dragonshield" || zombie.damageWeapon.name == "dragonshield_upgraded")
	{
		return "rocketshield";
	}
	if(zombie.damageWeapon.name == "hero_gravityspikes_melee")
	{
		if(zombie.damageWeapon.fireType == "Melee" && (!(isdefined(player IsSlamming()) && player IsSlamming())))
		{
			return "default";
		}
		return "dg4";
	}
	if(zombie.damageWeapon.name == "octobomb")
	{
		return "octobomb";
	}
	if(zombie.damageWeapon.name == "idgun_genesis_0")
	{
		return "servant";
	}
	if(zombie.damageWeapon.name == "thundergun")
	{
		return "thundergun";
	}
	if(zombie.damageWeapon.name == "shotgun_energy+holo+quickdraw" || zombie.damageWeapon.name == "pistol_energy+fastreload+reddot+steadyaim" || zombie.damageWeapon.name == "shotgun_energy_upgraded+extclip+holo+quickdraw" || zombie.damageWeapon.name == "pistol_energy_upgraded+extclip+fastreload+reddot+steadyaim")
	{
		return "default";
	}
	if(zm_utility::is_placeable_mine(weapon))
	{
		if(!instakill)
		{
			return "betty";
		}
		return "weapon_instakill";
	}
	if(zombie.damageWeapon.name == "cymbal_monkey")
	{
		if(instakill)
		{
			return "weapon_instakill";
		}
		return "monkey";
	}
	if(zombie.damageWeapon.name == "ray_gun" || (zombie.damageWeapon.name == "ray_gun_upgraded" && dist > var_af03c4a6))
	{
		if(!instakill)
		{
			return "raygun";
		}
		return "weapon_instakill";
	}
	if(zm_utility::is_headshot(weapon, impact, mod) && dist >= var_af03c4a6)
	{
		return "headshot";
	}
	if(mod == "MOD_MELEE" || (mod == "MOD_UNKNOWN" && dist < var_adac242b))
	{
		if(!instakill)
		{
			return "melee";
		}
		return "melee_instakill";
	}
	if(zm_utility::is_explosive_damage(mod) && weapon.name != "ray_gun" && weapon.name != "ray_gun_upgraded" && (!(isdefined(zombie.is_on_fire) && zombie.is_on_fire)))
	{
		if(!instakill)
		{
			return "explosive";
		}
		return "weapon_instakill";
	}
	if(weapon.doesFireDamage && (mod == "MOD_BURNED" || mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH"))
	{
		if(!instakill)
		{
			return "flame";
		}
		return "weapon_instakill";
	}
	if(!isdefined(impact))
	{
		impact = "";
	}
	if(mod != "MOD_MELEE" && zombie.missingLegs)
	{
		return "crawler";
	}
	if(mod != "MOD_BURNED" && dist < var_adac242b)
	{
		return "close";
	}
	if(mod == "MOD_RIFLE_BULLET" || mod == "MOD_PISTOL_BULLET")
	{
		if(!instakill)
		{
			return "bullet";
		}
		return "weapon_instakill";
	}
	if(instakill)
	{
		return "default";
	}
	return "default";
	impact++;
}

/*
	Name: function_6b96bf38
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xC980
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 1608
*/
function function_6b96bf38()
{
	function_218256bd(1);
	if(level.activePlayers.size == 1)
	{
		if(level.activePlayers[0].characterindex == 0)
		{
			a_str_vo = Array("vox_plr_0_round1_start_solo_0", "vox_plr_0_round1_start_solo_1");
			level.activePlayers[0] function_63c44c5a(a_str_vo, 1);
		}
		else
		{
			str_base = "_round1_start_solo_0";
			var_b48c1dda = "vox_plr_" + level.activePlayers[0].characterindex + str_base;
			level.activePlayers[0] function_7b697614(var_b48c1dda, 0, 1);
		}
	}
	else
	{
		function_a272201f(0);
	}
	function_218256bd(0);
}

/*
	Name: function_ef84a69b
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xCAC8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1642
*/
function function_ef84a69b()
{
	function_218256bd(1);
	if(level.activePlayers.size == 1)
	{
		var_b48c1dda = "vox_plr_" + level.activePlayers[0].characterindex + "_round1_end_solo_0";
		level.activePlayers[0] function_7b697614(var_b48c1dda, 0, 1);
	}
	else
	{
		function_a272201f(1);
	}
	function_218256bd(0);
	return;
}

/*
	Name: function_7d7d3760
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xCB90
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1668
*/
function function_7d7d3760()
{
	function_218256bd(1);
	if(level.activePlayers.size == 1)
	{
		var_b48c1dda = "vox_plr_" + level.activePlayers[0].characterindex + "_round2_end_solo_0";
		level.activePlayers[0] function_7b697614(var_b48c1dda, 0, 1);
	}
	else
	{
		function_a272201f(2);
	}
	function_218256bd(0);
}

/*
	Name: function_a272201f
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xCC58
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 1693
*/
function function_a272201f(var_3ef9e565)
{
	var_31408c0d = undefined;
	foreach(e_player in level.players)
	{
		if(e_player.characterindex == 2)
		{
			var_31408c0d = e_player;
			break;
		}
	}
	if(zm_utility::is_player_valid(var_31408c0d))
	{
		var_3cf0d54b = Array::get_all_closest(var_31408c0d.origin, level.activePlayers, Array(var_31408c0d), 4, 900);
		var_e4d5c0ab = undefined;
		foreach(e_player in var_3cf0d54b)
		{
			if(zm_utility::is_player_valid(e_player))
			{
				var_e4d5c0ab = e_player;
				break;
			}
		}
		if(zm_utility::is_player_valid(var_e4d5c0ab))
		{
			function_c23e3a71(level.var_4ea3bfd0[var_e4d5c0ab.characterindex], var_3ef9e565, level.var_f8331b71, 1);
		}
	}
}

/*
	Name: function_5803cf05
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xCE60
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 1733
*/
function function_5803cf05(n_max, var_6e653641)
{
	/#
		/#
			Assert(!isdefined(var_6e653641) || var_6e653641 < n_max, "Dev Block strings are not supported");
		#/
	#/
	do
	{
		var_ee3cd374 = RandomInt(n_max);
	}
	while(!var_ee3cd374 === var_6e653641);
	return var_ee3cd374;
}

/*
	Name: function_7091d990
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xCEF0
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 1758
*/
function function_7091d990()
{
	level.var_faaf04fc[0] = 7;
	level.var_faaf04fc[1] = 10;
	level.var_faaf04fc[2] = 8;
	level.var_faaf04fc[3] = 9;
	level.var_8ec9fe34[0] = Array(1, 2, 3, 4, 5, 6);
	level.var_8ec9fe34[1] = Array(2, 3, 4, 5, 6, 7, 9);
	level.var_8ec9fe34[2] = Array(0, 1, 2, 3, 4, 5, 6, 7);
	level.var_8ec9fe34[3] = Array(0, 1, 2, 3, 4, 5, 6, 7, 8);
	level thread function_edee8c1e();
	level thread function_5b684ae5();
	return;
	ERROR: Bad function call
}

/*
	Name: function_edee8c1e
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xD068
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1784
*/
function function_edee8c1e()
{
	while(1)
	{
		level waittill("hash_ac4cc18c", e_zombie, var_ecf98bb6);
		e_zombie function_52f36cdc("flogger", var_ecf98bb6);
	}
}

/*
	Name: function_5b684ae5
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xD0C8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1803
*/
function function_5b684ae5()
{
	while(1)
	{
		level waittill("trap_kill", e_zombie, var_f1c4d54d);
		if(isPlayer(var_f1c4d54d))
		{
		}
		else
		{
		}
		var_ecf98bb6 = var_f1c4d54d.activated_by_player;
		e_zombie function_52f36cdc("generic", var_ecf98bb6);
	}
}

/*
	Name: function_52f36cdc
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xD160
	Size: 0x238
	Parameters: 2
	Flags: None
	Line Number: 1829
*/
function function_52f36cdc(str_type, var_ecf98bb6)
{
	var_ecf98bb6 endon("disconnect");
	var_ecf98bb6 endon("death");
	if(!isdefined(self))
	{
		return;
	}
	if(!zm_utility::is_player_valid(var_ecf98bb6))
	{
		return;
	}
	if(!isdefined(level.var_2038540a) || !isdefined(level.var_2038540a[var_ecf98bb6.characterindex]) || GetTime() - level.var_2038540a[var_ecf98bb6.characterindex] > 40000)
	{
		if(DistanceSquared(self.origin, var_ecf98bb6.origin) < 262144)
		{
			if(var_ecf98bb6 util::is_looking_at(self GetCentroid(), 0.85, 0))
			{
				var_70bd2a66 = function_73ee0fdd(str_type, var_ecf98bb6);
				if(isdefined(level.var_f590f5e2) && isdefined(level.var_f590f5e2[var_ecf98bb6.characterindex]))
				{
					while(var_70bd2a66 === level.var_f590f5e2[var_ecf98bb6.characterindex])
					{
						var_70bd2a66 = function_73ee0fdd(str_type, var_ecf98bb6);
					}
				}
				b_success = var_ecf98bb6 function_7b697614("vox_plr_" + var_ecf98bb6.characterindex + "_trap_kill_" + var_70bd2a66, 1);
				if(isdefined(b_success) && b_success)
				{
					level.var_2038540a[var_ecf98bb6.characterindex] = GetTime();
					level.var_f590f5e2[var_ecf98bb6.characterindex] = var_70bd2a66;
				}
			}
		}
	}
}

/*
	Name: function_73ee0fdd
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xD3A0
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 1876
*/
function function_73ee0fdd(str_type, var_ecf98bb6)
{
	switch(str_type)
	{
		case "flogger":
		{
			return RandomInt(level.var_faaf04fc[var_ecf98bb6.characterindex]);
			break;
		}
		case "generic":
		{
			return Array::random(level.var_8ec9fe34[var_ecf98bb6.characterindex]);
			break;
		}
	}
}

/*
	Name: function_20aa8fb0
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xD440
	Size: 0x840
	Parameters: 0
	Flags: None
	Line Number: 1903
*/
function function_20aa8fb0()
{
	level.var_f594048b = [];
	level.var_f594048b["flogger"] = [];
	level.var_f594048b["flogger"][0] = [];
	level.var_f594048b["flogger"][1] = [];
	level.var_f594048b["flogger"][2] = [];
	level.var_f594048b["flogger"][3] = [];
	level.var_f594048b["flogger"][0] = Array::randomize(Array("vox_plr_0_trap_flogger_start_0", "vox_plr_0_trap_flogger_start_1", "vox_plr_0_trap_flogger_start_2", "vox_plr_0_trap_flogger_start_3", "vox_plr_0_trap_flogger_start_4"));
	level.var_f594048b["flogger"][1] = Array::randomize(Array("vox_plr_1_trap_flogger_start_0", "vox_plr_1_trap_flogger_start_1", "vox_plr_1_trap_flogger_start_2", "vox_plr_1_trap_flogger_start_3", "vox_plr_1_trap_flogger_start_4"));
	level.var_f594048b["flogger"][2] = Array::randomize(Array("vox_plr_2_trap_flogger_start_0", "vox_plr_2_trap_flogger_start_1", "vox_plr_2_trap_flogger_start_2", "vox_plr_2_trap_flogger_start_3", "vox_plr_2_trap_flogger_start_4"));
	level.var_f594048b["flogger"][3] = Array::randomize(Array("vox_plr_3_trap_flogger_start_0", "vox_plr_3_trap_flogger_start_1", "vox_plr_3_trap_flogger_start_2", "vox_plr_3_trap_flogger_start_3", "vox_plr_3_trap_flogger_start_4"));
	level.var_f594048b["flinger"] = [];
	level.var_f594048b["flinger"][0] = [];
	level.var_f594048b["flinger"][1] = [];
	level.var_f594048b["flinger"][2] = [];
	level.var_f594048b["flinger"][3] = [];
	level.var_f594048b["flinger"][0] = Array::randomize(Array("vox_plr_0_trap_flinger_start_0", "vox_plr_0_trap_flinger_start_1", "vox_plr_0_trap_flinger_start_2", "vox_plr_0_trap_flinger_start_3", "vox_plr_0_trap_flinger_start_4"));
	level.var_f594048b["flinger"][1] = Array::randomize(Array("vox_plr_1_trap_flinger_start_0", "vox_plr_1_trap_flinger_start_1", "vox_plr_1_trap_flinger_start_2", "vox_plr_1_trap_flinger_start_3", "vox_plr_1_trap_flinger_start_4"));
	level.var_f594048b["flinger"][2] = Array::randomize(Array("vox_plr_2_trap_flinger_start_0", "vox_plr_2_trap_flinger_start_1", "vox_plr_2_trap_flinger_start_2", "vox_plr_2_trap_flinger_start_3", "vox_plr_2_trap_flinger_start_4"));
	level.var_f594048b["flinger"][3] = Array::randomize(Array("vox_plr_3_trap_flinger_start_0", "vox_plr_3_trap_flinger_start_1", "vox_plr_3_trap_flinger_start_2", "vox_plr_3_trap_flinger_start_3", "vox_plr_3_trap_flinger_start_4"));
	level.var_f594048b["electric"] = [];
	level.var_f594048b["electric"][0] = [];
	level.var_f594048b["electric"][1] = [];
	level.var_f594048b["electric"][2] = [];
	level.var_f594048b["electric"][3] = [];
	level.var_f594048b["electric"][0] = Array::randomize(Array("vox_plr_0_trap_start_0", "vox_plr_0_trap_start_1", "vox_plr_0_trap_start_2", "vox_plr_0_trap_start_3", "vox_plr_0_trap_start_4"));
	level.var_f594048b["electric"][1] = Array::randomize(Array("vox_plr_1_trap_start_0", "vox_plr_1_trap_start_1", "vox_plr_1_trap_start_2", "vox_plr_1_trap_start_3", "vox_plr_1_trap_start_4"));
	level.var_f594048b["electric"][2] = Array::randomize(Array("vox_plr_2_trap_start_0", "vox_plr_2_trap_start_1", "vox_plr_2_trap_start_2", "vox_plr_2_trap_start_3", "vox_plr_2_trap_start_4"));
	level.var_f594048b["electric"][3] = Array::randomize(Array("vox_plr_3_trap_start_0", "vox_plr_3_trap_start_1", "vox_plr_3_trap_start_2", "vox_plr_3_trap_start_3", "vox_plr_3_trap_start_4"));
	level.var_f594048b["turret"] = [];
	level.var_f594048b["turret"][0] = [];
	level.var_f594048b["turret"][1] = [];
	level.var_f594048b["turret"][2] = [];
	level.var_f594048b["turret"][3] = [];
	level.var_f594048b["turret"][0] = Array::randomize(Array("vox_plr_0_turret_use_0", "vox_plr_0_turret_use_2", "vox_plr_0_turret_use_3", "vox_plr_0_turret_use_4"));
	level.var_f594048b["turret"][1] = Array::randomize(Array("vox_plr_1_turret_use_0", "vox_plr_1_turret_use_1", "vox_plr_1_turret_use_2", "vox_plr_1_turret_use_3", "vox_plr_1_turret_use_4"));
	level.var_f594048b["turret"][2] = Array::randomize(Array("vox_plr_2_turret_use_0", "vox_plr_2_turret_use_1", "vox_plr_2_turret_use_2", "vox_plr_2_turret_use_3", "vox_plr_2_turret_use_4"));
	level.var_f594048b["turret"][3] = Array::randomize(Array("vox_plr_3_turret_use_0", "vox_plr_3_turret_use_1", "vox_plr_3_turret_use_2", "vox_plr_3_turret_use_3", "vox_plr_3_turret_use_4"));
	level thread function_3fecec4e();
}

/*
	Name: function_3fecec4e
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xDC88
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 1955
*/
function function_3fecec4e()
{
	while(1)
	{
		level waittill("trap_activate", e_trap);
		e_trap thread function_bc8dac38();
	}
}

/*
	Name: function_bc8dac38
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xDCD0
	Size: 0x1B0
	Parameters: 2
	Flags: None
	Line Number: 1974
*/
function function_bc8dac38(e_player, var_4bdfcfa4)
{
	if(isdefined(e_player))
	{
		var_ecf98bb6 = e_player;
	}
	else
	{
		var_ecf98bb6 = self.activated_by_player;
	}
	var_ecf98bb6 endon("disconnect");
	var_ecf98bb6 endon("death");
	if(!zm_utility::is_player_valid(var_ecf98bb6))
	{
		return;
	}
	if(isdefined(var_4bdfcfa4))
	{
		var_63feebc3 = var_4bdfcfa4;
	}
	else
	{
		var_63feebc3 = self._trap_type;
	}
	if(level.var_f594048b[var_63feebc3][var_ecf98bb6.characterindex].size)
	{
		if(var_63feebc3 == "turret")
		{
			if(isdefined(self.var_98b34c52) && self.var_98b34c52)
			{
				return;
			}
			self.var_98b34c52 = 1;
			self notify("hash_7cbc9d72");
			self thread function_593460bf();
		}
		str_vo = level.var_f594048b[var_63feebc3][var_ecf98bb6.characterindex][0];
		b_success = var_ecf98bb6 function_7b697614(str_vo, 0.5);
		if(b_success)
		{
			ArrayRemoveValue(level.var_f594048b[var_63feebc3][var_ecf98bb6.characterindex], str_vo);
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_593460bf
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xDE88
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 2031
*/
function function_593460bf()
{
	self waittill("turret_timeout");
	self.var_98b34c52 = 0;
}

/*
	Name: function_3939d375
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xDEB0
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 2047
*/
function function_3939d375()
{
	level.var_43bc2077["dragonshield_pickup"] = [];
	level.var_43bc2077["dragonshield_pickup"][0] = Array::randomize(Array("vox_plr_0_rocketshield_pickup_0", "vox_plr_0_rocketshield_pickup_1", "vox_plr_0_rocketshield_pickup_2", "vox_plr_0_rocketshield_pickup_3", "vox_plr_0_rocketshield_pickup_4"));
	level.var_43bc2077["dragonshield_pickup"][1] = Array::randomize(Array("vox_plr_1_rocketshield_pickup_0", "vox_plr_1_rocketshield_pickup_1", "vox_plr_1_rocketshield_pickup_2", "vox_plr_1_rocketshield_pickup_3"));
	level.var_43bc2077["dragonshield_pickup"][2] = Array::randomize(Array("vox_plr_2_rocketshield_pickup_0", "vox_plr_2_rocketshield_pickup_1", "vox_plr_2_rocketshield_pickup_2", "vox_plr_2_rocketshield_pickup_3", "vox_plr_2_rocketshield_pickup_4"));
	level.var_43bc2077["dragonshield_pickup"][3] = Array::randomize(Array("vox_plr_3_rocketshield_pickup_0", "vox_plr_3_rocketshield_pickup_1", "vox_plr_3_rocketshield_pickup_2", "vox_plr_3_rocketshield_pickup_3", "vox_plr_3_rocketshield_pickup_4"));
}

/*
	Name: function_7e1a463f
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xE050
	Size: 0x338
	Parameters: 0
	Flags: None
	Line Number: 2066
*/
function function_7e1a463f()
{
	level.var_43bc2077["fury_kill"] = [];
	level.var_43bc2077["fury_kill"][0] = Array::randomize(Array("vox_plr_0_fury_kill_0", "vox_plr_0_fury_kill_1", "vox_plr_0_fury_kill_2", "vox_plr_0_fury_kill_3", "vox_plr_0_fury_kill_4"));
	level.var_43bc2077["fury_kill"][1] = Array::randomize(Array("vox_plr_1_fury_kill_0", "vox_plr_1_fury_kill_1", "vox_plr_1_fury_kill_2", "vox_plr_1_fury_kill_3", "vox_plr_1_fury_kill_4"));
	level.var_43bc2077["fury_kill"][2] = Array::randomize(Array("vox_plr_2_fury_kill_0", "vox_plr_2_fury_kill_1", "vox_plr_2_fury_kill_2", "vox_plr_2_fury_kill_3", "vox_plr_2_fury_kill_4"));
	level.var_43bc2077["fury_kill"][3] = Array::randomize(Array("vox_plr_3_fury_kill_0", "vox_plr_3_fury_kill_1", "vox_plr_3_fury_kill_2", "vox_plr_3_fury_kill_3", "vox_plr_3_fury_kill_4"));
	level.var_43bc2077["fury_spotted"] = [];
	level.var_43bc2077["fury_spotted"][0] = Array::randomize(Array("vox_plr_0_fury_appears_0", "vox_plr_0_fury_appears_1", "vox_plr_0_fury_appears_2", "vox_plr_0_fury_appears_3", "vox_plr_0_fury_appears_4"));
	level.var_43bc2077["fury_spotted"][1] = Array::randomize(Array("vox_plr_1_fury_appears_0", "vox_plr_1_fury_appears_1", "vox_plr_1_fury_appears_2", "vox_plr_1_fury_appears_3", "vox_plr_1_fury_appears_4"));
	level.var_43bc2077["fury_spotted"][2] = Array::randomize(Array("vox_plr_2_fury_appears_0", "vox_plr_2_fury_appears_1", "vox_plr_2_fury_appears_2", "vox_plr_2_fury_appears_3", "vox_plr_2_fury_appears_4"));
	level.var_43bc2077["fury_spotted"][3] = Array::randomize(Array("vox_plr_3_fury_appears_0", "vox_plr_3_fury_appears_1", "vox_plr_3_fury_appears_2", "vox_plr_3_fury_appears_3", "vox_plr_3_fury_appears_4"));
}

/*
	Name: function_1ac8eab3
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xE390
	Size: 0x338
	Parameters: 0
	Flags: None
	Line Number: 2090
*/
function function_1ac8eab3()
{
	level.var_43bc2077["gateworm_egg_acquire"] = [];
	level.var_43bc2077["gateworm_egg_acquire"][0] = Array::randomize(Array("vox_plr_0_gateworm_egg_acquire_0", "vox_plr_0_gateworm_egg_acquire_1", "vox_plr_0_gateworm_egg_acquire_2", "vox_plr_0_gateworm_egg_acquire_3", "vox_plr_0_gateworm_egg_acquire_4"));
	level.var_43bc2077["gateworm_egg_acquire"][1] = Array::randomize(Array("vox_plr_1_gateworm_egg_acquire_0", "vox_plr_1_gateworm_egg_acquire_1", "vox_plr_1_gateworm_egg_acquire_2", "vox_plr_1_gateworm_egg_acquire_3", "vox_plr_1_gateworm_egg_acquire_4"));
	level.var_43bc2077["gateworm_egg_acquire"][2] = Array::randomize(Array("vox_plr_2_gateworm_egg_acquire_0", "vox_plr_2_gateworm_egg_acquire_1", "vox_plr_2_gateworm_egg_acquire_2", "vox_plr_2_gateworm_egg_acquire_3", "vox_plr_2_gateworm_egg_acquire_4"));
	level.var_43bc2077["gateworm_egg_acquire"][3] = Array::randomize(Array("vox_plr_3_gateworm_egg_acquire_0", "vox_plr_3_gateworm_egg_acquire_1", "vox_plr_3_gateworm_egg_acquire_2", "vox_plr_3_gateworm_egg_acquire_3", "vox_plr_3_gateworm_egg_acquire_4"));
	level.var_43bc2077["gateworm_acquire"] = [];
	level.var_43bc2077["gateworm_acquire"][0] = Array::randomize(Array("vox_plr_0_gateworm_acquire_0", "vox_plr_0_gateworm_acquire_1", "vox_plr_0_gateworm_acquire_2", "vox_plr_0_gateworm_acquire_3", "vox_plr_0_gateworm_acquire_4"));
	level.var_43bc2077["gateworm_acquire"][1] = Array::randomize(Array("vox_plr_1_gateworm_acquire_0", "vox_plr_1_gateworm_acquire_1", "vox_plr_1_gateworm_acquire_2", "vox_plr_1_gateworm_acquire_3", "vox_plr_1_gateworm_acquire_4"));
	level.var_43bc2077["gateworm_acquire"][2] = Array::randomize(Array("vox_plr_2_gateworm_acquire_0", "vox_plr_2_gateworm_acquire_1", "vox_plr_2_gateworm_acquire_2", "vox_plr_2_gateworm_acquire_3", "vox_plr_2_gateworm_acquire_4"));
	level.var_43bc2077["gateworm_acquire"][3] = Array::randomize(Array("vox_plr_3_gateworm_acquire_0", "vox_plr_3_gateworm_acquire_1", "vox_plr_3_gateworm_acquire_2", "vox_plr_3_gateworm_acquire_3", "vox_plr_3_gateworm_acquire_4"));
}

/*
	Name: function_fbd71326
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xE6D0
	Size: 0x490
	Parameters: 0
	Flags: None
	Line Number: 2114
*/
function function_fbd71326()
{
	level.var_43bc2077["gen_pos"] = [];
	level.var_43bc2077["gen_pos"][0] = Array::randomize(function_ac5a16bb("vox_plr_0_response_positive_", 9));
	level.var_43bc2077["gen_pos"][1] = Array::randomize(function_ac5a16bb("vox_plr_1_response_positive_", 8));
	level.var_43bc2077["gen_pos"][2] = Array::randomize(function_ac5a16bb("vox_plr_2_response_positive_", 10));
	level.var_43bc2077["gen_pos"][3] = Array::randomize(function_ac5a16bb("vox_plr_3_response_positive_", 9));
	level.var_43bc2077["gen_neg"] = [];
	level.var_43bc2077["gen_neg"][0] = Array::randomize(Array("vox_plr_0_response_negative_2", "vox_plr_0_response_negative_4", "vox_plr_0_response_negative_5", "vox_plr_0_response_negative_6", "vox_plr_0_response_negative_7", "vox_plr_0_response_negative_8", "vox_plr_0_response_negative_9", "vox_plr_0_response_negative_10", "vox_plr_0_response_negative_12", "vox_plr_0_response_negative_14", "vox_plr_0_response_negative_15", "vox_plr_0_response_negative_16"));
	level.var_43bc2077["gen_neg"][1] = Array::randomize(Array("vox_plr_1_response_negative_0,", "vox_plr_1_response_negative_1", "vox_plr_1_response_negative_2", "vox_plr_1_response_negative_4", "vox_plr_1_response_negative_5", "vox_plr_1_response_negative_6", "vox_plr_1_response_negative_7", "vox_plr_1_response_negative_9", "vox_plr_1_response_negative_11"));
	level.var_43bc2077["gen_neg"][2] = Array::randomize(Array("vox_plr_2_response_negative_0", "vox_plr_2_response_negative_1", "vox_plr_2_response_negative_2", "vox_plr_2_response_negative_5", "vox_plr_2_response_negative_6", "vox_plr_2_response_negative_8", "vox_plr_2_response_negative_9"));
	level.var_43bc2077["gen_neg"][3] = Array::randomize(Array("vox_plr_3_response_negative_0", "vox_plr_3_response_negative_1", "vox_plr_3_response_negative_2", "vox_plr_3_response_negative_3", "vox_plr_3_response_negative_4", "vox_plr_3_response_negative_6", "vox_plr_3_response_negative_7", "vox_plr_3_response_negative_9", "vox_plr_3_response_negative_10", "vox_plr_3_response_negative_11"));
	level.var_43bc2077["gen_pickup"] = [];
	level.var_43bc2077["gen_pickup"][0] = Array::randomize(function_ac5a16bb("vox_plr_0_pickup_generic_", 8));
	level.var_43bc2077["gen_pickup"][1] = Array::randomize(function_ac5a16bb("vox_plr_1_pickup_generic_", 7));
	level.var_43bc2077["gen_pickup"][2] = Array::randomize(function_ac5a16bb("vox_plr_2_pickup_generic_", 8));
	level.var_43bc2077["gen_pickup"][3] = Array::randomize(function_ac5a16bb("vox_plr_3_pickup_generic_", 6));
}

/*
	Name: function_b254fea1
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xEB68
	Size: 0x338
	Parameters: 0
	Flags: None
	Line Number: 2143
*/
function function_b254fea1()
{
	level.var_43bc2077["keeper_kill"] = [];
	level.var_43bc2077["keeper_kill"][0] = Array::randomize(Array("vox_plr_0_enslaved_kill_0", "vox_plr_0_enslaved_kill_1", "vox_plr_0_enslaved_kill_2", "vox_plr_0_enslaved_kill_3", "vox_plr_0_enslaved_kill_4"));
	level.var_43bc2077["keeper_kill"][1] = Array::randomize(Array("vox_plr_1_enslaved_kill_0", "vox_plr_1_enslaved_kill_1", "vox_plr_1_enslaved_kill_2", "vox_plr_1_enslaved_kill_3", "vox_plr_1_enslaved_kill_4"));
	level.var_43bc2077["keeper_kill"][2] = Array::randomize(Array("vox_plr_2_enslaved_kill_0", "vox_plr_2_enslaved_kill_1", "vox_plr_2_enslaved_kill_2", "vox_plr_2_enslaved_kill_3", "vox_plr_2_enslaved_kill_4"));
	level.var_43bc2077["keeper_kill"][3] = Array::randomize(Array("vox_plr_3_enslaved_kill_0", "vox_plr_3_enslaved_kill_1", "vox_plr_3_enslaved_kill_2", "vox_plr_3_enslaved_kill_3", "vox_plr_3_enslaved_kill_4"));
	level.var_43bc2077["keeper_spotted"] = [];
	level.var_43bc2077["keeper_spotted"][0] = Array::randomize(Array("vox_plr_0_enslaved_appears_0", "vox_plr_0_enslaved_appears_1", "vox_plr_0_enslaved_appears_2", "vox_plr_0_enslaved_appears_3", "vox_plr_0_enslaved_appears_4"));
	level.var_43bc2077["keeper_spotted"][1] = Array::randomize(Array("vox_plr_1_enslaved_appears_0", "vox_plr_1_enslaved_appears_1", "vox_plr_1_enslaved_appears_2", "vox_plr_1_enslaved_appears_3", "vox_plr_1_enslaved_appears_4"));
	level.var_43bc2077["keeper_spotted"][2] = Array::randomize(Array("vox_plr_2_enslaved_appears_0", "vox_plr_2_enslaved_appears_1", "vox_plr_2_enslaved_appears_2", "vox_plr_2_enslaved_appears_3", "vox_plr_2_enslaved_appears_4"));
	level.var_43bc2077["keeper_spotted"][3] = Array::randomize(Array("vox_plr_3_enslaved_appears_0", "vox_plr_3_enslaved_appears_1", "vox_plr_3_enslaved_appears_2", "vox_plr_3_enslaved_appears_3", "vox_plr_3_enslaved_appears_4"));
}

/*
	Name: function_59a4b1e6
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xEEA8
	Size: 0x4D0
	Parameters: 0
	Flags: None
	Line Number: 2167
*/
function function_59a4b1e6()
{
	level.var_43bc2077["margwa_kill"] = [];
	level.var_43bc2077["margwa_kill"][0] = Array::randomize(Array("vox_plr_0_margwa_kill_0", "vox_plr_0_margwa_kill_1", "vox_plr_0_margwa_kill_2", "vox_plr_0_margwa_kill_3", "vox_plr_0_margwa_kill_4"));
	level.var_43bc2077["margwa_kill"][1] = Array::randomize(Array("vox_plr_1_margwa_kill_0", "vox_plr_1_margwa_kill_1", "vox_plr_1_margwa_kill_2", "vox_plr_1_margwa_kill_3", "vox_plr_1_margwa_kill_4"));
	level.var_43bc2077["margwa_kill"][2] = Array::randomize(Array("vox_plr_2_margwa_kill_0", "vox_plr_2_margwa_kill_1", "vox_plr_2_margwa_kill_2", "vox_plr_2_margwa_kill_3", "vox_plr_2_margwa_kill_4"));
	level.var_43bc2077["margwa_kill"][3] = Array::randomize(Array("vox_plr_3_margwa_kill_0", "vox_plr_3_margwa_kill_1", "vox_plr_3_margwa_kill_2", "vox_plr_3_margwa_kill_3", "vox_plr_3_margwa_kill_4"));
	level.var_43bc2077["margwa_spotted"] = [];
	level.var_43bc2077["margwa_spotted"][0] = Array::randomize(Array("vox_plr_0_margwa_appears_0", "vox_plr_0_margwa_appears_1", "vox_plr_0_margwa_appears_2", "vox_plr_0_margwa_appears_3", "vox_plr_0_margwa_appears_4"));
	level.var_43bc2077["margwa_spotted"][1] = Array::randomize(Array("vox_plr_1_margwa_appears_0", "vox_plr_1_margwa_appears_1", "vox_plr_1_margwa_appears_2", "vox_plr_1_margwa_appears_3", "vox_plr_1_margwa_appears_4"));
	level.var_43bc2077["margwa_spotted"][2] = Array::randomize(Array("vox_plr_2_margwa_appears_0", "vox_plr_2_margwa_appears_1", "vox_plr_2_margwa_appears_2", "vox_plr_2_margwa_appears_3", "vox_plr_2_margwa_appears_4"));
	level.var_43bc2077["margwa_spotted"][3] = Array::randomize(Array("vox_plr_3_margwa_appears_0", "vox_plr_3_margwa_appears_1", "vox_plr_3_margwa_appears_2", "vox_plr_3_margwa_appears_3", "vox_plr_3_margwa_appears_4"));
	level.var_43bc2077["margwa_headshot"] = [];
	level.var_43bc2077["margwa_headshot"][0] = Array::randomize(Array("vox_plr_0_margwa_headshot_0", "vox_plr_0_margwa_headshot_1", "vox_plr_0_margwa_headshot_2", "vox_plr_0_margwa_headshot_3", "vox_plr_0_margwa_headshot_4"));
	level.var_43bc2077["margwa_headshot"][1] = Array::randomize(Array("vox_plr_1_margwa_headshot_0", "vox_plr_1_margwa_headshot_1", "vox_plr_1_margwa_headshot_2", "vox_plr_1_margwa_headshot_3", "vox_plr_1_margwa_headshot_4"));
	level.var_43bc2077["margwa_headshot"][2] = Array::randomize(Array("vox_plr_2_margwa_headshot_0", "vox_plr_2_margwa_headshot_1", "vox_plr_2_margwa_headshot_2", "vox_plr_2_margwa_headshot_3", "vox_plr_2_margwa_headshot_4"));
	level.var_43bc2077["margwa_headshot"][3] = Array::randomize(Array("vox_plr_3_margwa_headshot_0", "vox_plr_3_margwa_headshot_1", "vox_plr_3_margwa_headshot_2", "vox_plr_3_margwa_headshot_3", "vox_plr_3_margwa_headshot_4"));
}

/*
	Name: function_1af15c36
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xF380
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 2196
*/
function function_1af15c36()
{
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("margwa_headshot", var_225347e1);
		var_3c161673 = 0;
		foreach(var_dab2db6d in var_225347e1.head)
		{
			if(var_dab2db6d.health > 0)
			{
				var_3c161673++;
			}
		}
		if(RandomInt(100) < 25 && var_3c161673 > 1)
		{
			self thread function_aa5f0ceb("margwa_headshot");
		}
	}
}

/*
	Name: function_dccb9cbe
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xF4B0
	Size: 0x338
	Parameters: 0
	Flags: None
	Line Number: 2228
*/
function function_dccb9cbe()
{
	level.var_43bc2077["mechz_kill"] = [];
	level.var_43bc2077["mechz_kill"][0] = Array::randomize(Array("vox_plr_0_panzer_kill_0", "vox_plr_0_panzer_kill_1", "vox_plr_0_panzer_kill_2", "vox_plr_0_panzer_kill_3", "vox_plr_0_panzer_kill_4"));
	level.var_43bc2077["mechz_kill"][1] = Array::randomize(Array("vox_plr_1_panzer_kill_0", "vox_plr_1_panzer_kill_1", "vox_plr_1_panzer_kill_2", "vox_plr_1_panzer_kill_3", "vox_plr_1_panzer_kill_4"));
	level.var_43bc2077["mechz_kill"][2] = Array::randomize(Array("vox_plr_2_panzer_kill_0", "vox_plr_2_panzer_kill_1", "vox_plr_2_panzer_kill_2", "vox_plr_2_panzer_kill_3", "vox_plr_2_panzer_kill_4"));
	level.var_43bc2077["mechz_kill"][3] = Array::randomize(Array("vox_plr_3_panzer_kill_0", "vox_plr_3_panzer_kill_1", "vox_plr_3_panzer_kill_2", "vox_plr_3_panzer_kill_3", "vox_plr_3_panzer_kill_4"));
	level.var_43bc2077["mechz_spotted"] = [];
	level.var_43bc2077["mechz_spotted"][0] = Array::randomize(Array("vox_plr_0_panzer_appears_0", "vox_plr_0_panzer_appears_1", "vox_plr_0_panzer_appears_2", "vox_plr_0_panzer_appears_3", "vox_plr_0_panzer_appears_4"));
	level.var_43bc2077["mechz_spotted"][1] = Array::randomize(Array("vox_plr_1_panzer_appears_0", "vox_plr_1_panzer_appears_1", "vox_plr_1_panzer_appears_2", "vox_plr_1_panzer_appears_3", "vox_plr_1_panzer_appears_4"));
	level.var_43bc2077["mechz_spotted"][2] = Array::randomize(Array("vox_plr_2_panzer_appears_0", "vox_plr_2_panzer_appears_1", "vox_plr_2_panzer_appears_2", "vox_plr_2_panzer_appears_3", "vox_plr_2_panzer_appears_4"));
	level.var_43bc2077["mechz_spotted"][3] = Array::randomize(Array("vox_plr_3_panzer_appears_0", "vox_plr_3_panzer_appears_1", "vox_plr_3_panzer_appears_2", "vox_plr_3_panzer_appears_3", "vox_plr_3_panzer_appears_4"));
}

/*
	Name: function_d4efe48a
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xF7F0
	Size: 0x338
	Parameters: 0
	Flags: None
	Line Number: 2252
*/
function function_d4efe48a()
{
	level.var_43bc2077["parasite_kill"] = [];
	level.var_43bc2077["parasite_kill"][0] = Array::randomize(Array("vox_plr_0_parasite_kill_0", "vox_plr_0_parasite_kill_1", "vox_plr_0_parasite_kill_2", "vox_plr_0_parasite_kill_3", "vox_plr_0_parasite_kill_4"));
	level.var_43bc2077["parasite_kill"][1] = Array::randomize(Array("vox_plr_1_parasite_kill_0", "vox_plr_1_parasite_kill_1", "vox_plr_1_parasite_kill_2", "vox_plr_1_parasite_kill_3", "vox_plr_1_parasite_kill_4"));
	level.var_43bc2077["parasite_kill"][2] = Array::randomize(Array("vox_plr_2_parasite_kill_0", "vox_plr_2_parasite_kill_1", "vox_plr_2_parasite_kill_2", "vox_plr_2_parasite_kill_3", "vox_plr_2_parasite_kill_4"));
	level.var_43bc2077["parasite_kill"][3] = Array::randomize(Array("vox_plr_3_parasite_kill_0", "vox_plr_3_parasite_kill_1", "vox_plr_3_parasite_kill_2", "vox_plr_3_parasite_kill_3", "vox_plr_3_parasite_kill_4"));
	level.var_43bc2077["parasite_spotted"] = [];
	level.var_43bc2077["parasite_spotted"][0] = Array::randomize(Array("vox_plr_0_parasite_appears_0", "vox_plr_0_parasite_appears_1", "vox_plr_0_parasite_appears_2", "vox_plr_0_parasite_appears_3", "vox_plr_0_parasite_appears_4"));
	level.var_43bc2077["parasite_spotted"][1] = Array::randomize(Array("vox_plr_1_parasite_appears_0", "vox_plr_1_parasite_appears_1", "vox_plr_1_parasite_appears_2", "vox_plr_1_parasite_appears_3", "vox_plr_1_parasite_appears_4"));
	level.var_43bc2077["parasite_spotted"][2] = Array::randomize(Array("vox_plr_2_parasite_appears_0", "vox_plr_2_parasite_appears_1", "vox_plr_2_parasite_appears_2", "vox_plr_2_parasite_appears_3", "vox_plr_2_parasite_appears_4"));
	level.var_43bc2077["parasite_spotted"][3] = Array::randomize(Array("vox_plr_3_parasite_appears_0", "vox_plr_3_parasite_appears_1", "vox_plr_3_parasite_appears_2", "vox_plr_3_parasite_appears_3", "vox_plr_3_parasite_appears_4"));
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_30fcd603
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xFB30
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 2278
*/
function function_30fcd603()
{
	level.var_43bc2077["pap_enter"] = [];
	level.var_43bc2077["pap_enter"][0] = Array("vox_plr_0_apothicon_enter_0");
	level.var_43bc2077["pap_enter"][1] = Array("vox_plr_1_apothicon_enter_0");
	level.var_43bc2077["pap_enter"][2] = Array("vox_plr_2_apothicon_enter_0");
	level.var_43bc2077["pap_enter"][3] = Array("vox_plr_3_apothicon_enter_0");
	level.var_43bc2077["pap_artery_destroy"] = [];
	level.var_43bc2077["pap_artery_destroy"][0] = Array::randomize(Array("vox_plr_0_artery_first_destroy_0", "vox_plr_0_artery_first_destroy_1", "vox_plr_0_artery_first_destroy_2"));
	level.var_43bc2077["pap_artery_destroy"][1] = Array::randomize(Array("vox_plr_1_artery_first_destroy_0", "vox_plr_1_artery_first_destroy_1", "vox_plr_1_artery_first_destroy_2"));
	level.var_43bc2077["pap_artery_destroy"][2] = Array::randomize(Array("vox_plr_2_artery_first_destroy_0", "vox_plr_2_artery_first_destroy_1", "vox_plr_2_artery_first_destroy_2"));
	level.var_43bc2077["pap_artery_destroy"][3] = Array::randomize(Array("vox_plr_3_artery_first_destroy_0", "vox_plr_3_artery_first_destroy_1", "vox_plr_3_artery_first_destroy_2"));
	return;
}

/*
	Name: function_7e2041d5
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xFD70
	Size: 0x258
	Parameters: 0
	Flags: None
	Line Number: 2303
*/
function function_7e2041d5()
{
	level.var_43bc2077["protector_craft"] = [];
	level.var_43bc2077["protector_craft"][0] = Array("vox_plr_0_keeper_protector_craft_0");
	level.var_43bc2077["protector_craft"][1] = Array("vox_plr_1_keeper_protector_craft_0");
	level.var_43bc2077["protector_craft"][2] = Array("vox_plr_2_keeper_protector_craft_0");
	level.var_43bc2077["protector_craft"][3] = Array("vox_plr_3_keeper_protector_craft_0");
	level.var_43bc2077["protector_kill"] = [];
	level.var_43bc2077["protector_kill"][0] = Array::randomize(Array("vox_plr_0_keeper_protector_kill_0", "vox_plr_0_keeper_protector_kill_1", "vox_plr_0_keeper_protector_kill_2", "vox_plr_0_keeper_protector_kill_3"));
	level.var_43bc2077["protector_kill"][1] = Array::randomize(Array("vox_plr_1_keeper_protector_kill_0", "vox_plr_1_keeper_protector_kill_1", "vox_plr_1_keeper_protector_kill_2", "vox_plr_1_keeper_protector_kill_3"));
	level.var_43bc2077["protector_kill"][2] = Array::randomize(Array("vox_plr_2_keeper_protector_kill_0", "vox_plr_2_keeper_protector_kill_1", "vox_plr_2_keeper_protector_kill_2", "vox_plr_2_keeper_protector_kill_3"));
	level.var_43bc2077["protector_kill"][3] = Array::randomize(Array("vox_plr_3_keeper_protector_kill_0", "vox_plr_3_keeper_protector_kill_1", "vox_plr_3_keeper_protector_kill_2", "vox_plr_3_keeper_protector_kill_3"));
}

/*
	Name: function_c3d7d23e
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0xFFD0
	Size: 0x330
	Parameters: 0
	Flags: None
	Line Number: 2327
*/
function function_c3d7d23e()
{
	level.var_43bc2077["spider_kill"] = [];
	level.var_43bc2077["spider_kill"][0] = Array::randomize(Array("vox_plr_0_spider_kill_0", "vox_plr_0_spider_kill_1", "vox_plr_0_spider_kill_2", "vox_plr_0_spider_kill_3"));
	level.var_43bc2077["spider_kill"][1] = Array::randomize(Array("vox_plr_1_spider_kill_0", "vox_plr_1_spider_kill_1", "vox_plr_1_spider_kill_2", "vox_plr_1_spider_kill_3", "vox_plr_1_spider_kill_4"));
	level.var_43bc2077["spider_kill"][2] = Array::randomize(Array("vox_plr_2_spider_kill_0", "vox_plr_2_spider_kill_1", "vox_plr_2_spider_kill_2", "vox_plr_2_spider_kill_3", "vox_plr_2_spider_kill_4"));
	level.var_43bc2077["spider_kill"][3] = Array::randomize(Array("vox_plr_3_spider_kill_0", "vox_plr_3_spider_kill_1", "vox_plr_3_spider_kill_2", "vox_plr_3_spider_kill_3", "vox_plr_3_spider_kill_4"));
	level.var_43bc2077["spider_spotted"] = [];
	level.var_43bc2077["spider_spotted"][0] = Array::randomize(Array("vox_plr_0_spider_appears_0", "vox_plr_0_spider_appears_1", "vox_plr_0_spider_appears_2", "vox_plr_0_spider_appears_3", "vox_plr_0_spider_appears_4"));
	level.var_43bc2077["spider_spotted"][1] = Array::randomize(Array("vox_plr_1_spider_appears_0", "vox_plr_1_spider_appears_1", "vox_plr_1_spider_appears_2", "vox_plr_1_spider_appears_3", "vox_plr_1_spider_appears_4"));
	level.var_43bc2077["spider_spotted"][2] = Array::randomize(Array("vox_plr_2_spider_appears_0", "vox_plr_2_spider_appears_1", "vox_plr_2_spider_appears_2", "vox_plr_2_spider_appears_3", "vox_plr_2_spider_appears_4"));
	level.var_43bc2077["spider_spotted"][3] = Array::randomize(Array("vox_plr_3_spider_appears_0", "vox_plr_3_spider_appears_1", "vox_plr_3_spider_appears_2", "vox_plr_3_spider_appears_3", "vox_plr_3_spider_appears_4"));
}

/*
	Name: function_aa5f0ceb
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x10308
	Size: 0x108
	Parameters: 2
	Flags: None
	Line Number: 2351
*/
function function_aa5f0ceb(str_category, n_delay)
{
	if(!isdefined(n_delay))
	{
		n_delay = 0;
	}
	self endon("disconnect");
	self endon("death");
	self endon("death");
	if(!zm_utility::is_player_valid(self))
	{
		return 0;
	}
	if(level.var_43bc2077[str_category][self.characterindex].size)
	{
		str_vo = level.var_43bc2077[str_category][self.characterindex][0];
		b_success = self function_7b697614(str_vo, n_delay);
		if(b_success)
		{
			ArrayRemoveValue(level.var_43bc2077[str_category][self.characterindex], str_vo);
		}
	}
	return b_success;
}

/*
	Name: function_cc2b9e13
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x10418
	Size: 0x40
	Parameters: 3
	Flags: None
	Line Number: 2386
*/
function function_cc2b9e13(var_2afa3837, var_8c599c54, var_b25c16bd)
{
	self thread function_8271d5e3(var_2afa3837, var_8c599c54, var_b25c16bd);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8271d5e3
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x10460
	Size: 0x140
	Parameters: 3
	Flags: None
	Line Number: 2403
*/
function function_8271d5e3(str_type, var_d3a8a61c, var_fad05e6)
{
	if(!isdefined(var_d3a8a61c))
	{
		var_d3a8a61c = 50;
	}
	if(!isdefined(var_fad05e6))
	{
		var_fad05e6 = 3;
	}
	self endon("death");
	while(1)
	{
		foreach(player in level.activePlayers)
		{
			if(player islookingat(self))
			{
				n_roll = RandomInt(100);
				if(n_roll < var_d3a8a61c)
				{
					player function_dfd59b6d(str_type, var_fad05e6);
					return;
				}
			}
		}
		wait(1);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dfd59b6d
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x105A8
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 2444
*/
function function_dfd59b6d(str_type, var_614a7182)
{
	if(!isdefined(var_614a7182))
	{
		var_614a7182 = 120;
	}
	self endon("disconnect");
	self endon("death");
	if(!(isdefined(self.var_996d46ad) && self.var_996d46ad))
	{
		self.var_996d46ad = 1;
		self thread function_aa5f0ceb(str_type);
		wait(var_614a7182);
		self.var_996d46ad = 0;
	}
}

/*
	Name: function_6a2d6df
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x10640
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 2471
*/
function function_6a2d6df(str_type, var_614a7182)
{
	if(!isdefined(var_614a7182))
	{
		var_614a7182 = 30;
	}
	self endon("disconnect");
	self endon("death");
	if(!(isdefined(self.var_9a189147) && self.var_9a189147))
	{
		self.var_9a189147 = 1;
		self thread function_aa5f0ceb(str_type);
		wait(var_614a7182);
		self.var_9a189147 = 0;
	}
}

/*
	Name: function_f7879c72
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x106D8
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 2498
*/
function function_f7879c72(e_attacker)
{
	if(!isPlayer(e_attacker))
	{
		return;
	}
	if(isdefined(self.archetype))
	{
		switch(self.archetype)
		{
			case "apothicon_fury":
			{
				if(RandomInt(100) < 15)
				{
					e_attacker thread function_6a2d6df("fury_kill");
					break;
				}
			}
			case "keeper":
			{
				if(RandomInt(100) < 15)
				{
					e_attacker thread function_6a2d6df("keeper_kill");
					break;
				}
			}
			case "margwa":
			{
				if(RandomInt(100) < 30)
				{
					e_attacker thread function_aa5f0ceb("margwa_kill");
					break;
				}
			}
			case "mechz":
			{
				if(RandomInt(100) < 30)
				{
					e_attacker thread function_aa5f0ceb("mechz_kill");
					break;
				}
			}
			case "parasite":
			{
				if(RandomInt(100) < 10)
				{
					e_attacker thread function_6a2d6df("parasite_kill");
					break;
				}
			}
			case "spider":
			{
				if(RandomInt(100) < 10)
				{
					e_attacker thread function_6a2d6df("spider_kill");
					break;
				}
			}
		}
	}
}

/*
	Name: function_5ebe7974
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x108E0
	Size: 0x660
	Parameters: 0
	Flags: None
	Line Number: 2570
*/
function function_5ebe7974()
{
	a_str_visit["zm_asylum_downstairs_zone"] = "visit_asylum";
	a_str_visit["zm_asylum_upstairs_zone"] = "visit_asylum";
	a_str_visit["zm_castle_undercroft_airlock_zone"] = "visit_castle";
	a_str_visit["zm_castle_undercroft_hallway_zone"] = "visit_castle";
	a_str_visit["zm_castle_undercroft_hallway2_zone"] = "visit_castle";
	a_str_visit["zm_castle_undercroft_zone"] = "visit_castle";
	a_str_visit["zm_prison_inner_zone"] = "visit_prison";
	a_str_visit["zm_prototype_apothicon_zone"] = "visit_prototype";
	a_str_visit["zm_prototype_balcony_zone"] = "visit_prototype";
	a_str_visit["zm_prototype_box_zone"] = "visit_prototype";
	a_str_visit["zm_prototype_outside_zone"] = "visit_prototype";
	a_str_visit["zm_prototype_start_zone"] = "visit_prototype";
	a_str_visit["zm_prototype_upstairs_zone"] = "visit_prototype";
	a_str_visit["zm_temple_stairs_zone"] = "visit_temple";
	a_str_visit["zm_temple_zone"] = "visit_temple";
	a_str_visit["zm_temple2_zone"] = "visit_temple";
	a_str_visit["zm_theater_foyer_zone"] = "visit_theater";
	a_str_visit["zm_theater_zone"] = "visit_theater";
	a_str_visit["zm_tomb_trench_center_zone"] = "visit_tomb";
	a_str_visit["zm_tomb_generator_zone"] = "visit_tomb";
	a_str_visit["zm_tomb_ruins2_zone"] = "visit_tomb";
	level thread function_a800aae9();
	level waittill("start_zombie_round_logic");
	level._effect["deadshot_light"] = "_t6/misc/fx_zombie_cola_dtap_on";
	level thread function_1ada31a1();
	while(1)
	{
		while(!level flag::get("area_visit_new_round"))
		{
			foreach(player in level.activePlayers)
			{
				if(zm_utility::is_player_valid(player))
				{
					str_player_zone = player zm_zonemgr::get_player_zone();
					if(isdefined(str_player_zone))
					{
						str_visit = a_str_visit[str_player_zone];
						if(!isdefined(str_visit))
						{
							continue;
						}
						if(isdefined(player.var_59daaa5e[str_visit]) && player.var_59daaa5e[str_visit])
						{
							continue;
						}
						if(isdefined(level.var_9aa82ff8[str_visit]) && level.var_9aa82ff8[str_visit])
						{
							continue;
						}
						if(isdefined(player.var_3d303d7e) && player.var_3d303d7e)
						{
							continue;
						}
						if(str_visit === player.var_73aab1d6)
						{
							continue;
						}
						if(isdefined(level.var_8c92b387[str_visit]) && isdefined(level.var_8c92b387[str_visit][player.characterindex]) && isdefined(level.var_8c92b387[str_visit][player.characterindex][0]))
						{
							str_vo = level.var_8c92b387[str_visit][player.characterindex][0];
							b_success = player function_7b697614(str_vo, 1);
							if(isdefined(b_success) && b_success)
							{
								player.var_59daaa5e[str_visit] = 1;
								ArrayRemoveValue(level.var_8c92b387[str_visit][player.characterindex], str_vo);
								player thread function_5a86ac8d();
								level thread function_9926a1d1(str_visit);
								player.var_73aab1d6 = undefined;
							}
						}
					}
				}
			}
			wait(1);
		}
		level flag::wait_till("area_visit_new_round");
		foreach(player in level.activePlayers)
		{
			str_player_zone = player zm_zonemgr::get_player_zone();
			if(isdefined(str_player_zone))
			{
				var_143b303e = StrTok(str_player_zone, "_");
				player.var_73aab1d6 = "visit_" + var_143b303e[1];
			}
		}
		level flag::clear("area_visit_new_round");
	}
}

/*
	Name: function_5a86ac8d
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x10F48
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 2671
*/
function function_5a86ac8d()
{
	self endon("disconnect");
	self endon("death");
	self.var_3d303d7e = 1;
	wait(30);
	self.var_3d303d7e = 0;
}

/*
	Name: function_9926a1d1
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x10F88
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 2690
*/
function function_9926a1d1(str_visit)
{
	level.var_9aa82ff8[str_visit] = 1;
	wait(30);
	level.var_9aa82ff8[str_visit] = 0;
}

/*
	Name: function_a800aae9
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x10FC8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 2707
*/
function function_a800aae9()
{
	while(1)
	{
		level waittill("end_of_round");
		level flag::set("area_visit_new_round");
	}
}

/*
	Name: function_79eeee03
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x11008
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 2726
*/
function function_79eeee03(str_enemy)
{
	var_a91c725a = "boss_round_" + str_enemy;
	var_30f9b5a1 = [];
	var_30f9b5a1["boss_round_margwa"] = 75;
	var_30f9b5a1["boss_round_mechz"] = 75;
	level flag::set("boss_round");
	var_be6a28e5 = RandomInt(100);
	if(isdefined(level.var_8c92b387[var_a91c725a]) && var_be6a28e5 < var_30f9b5a1[var_a91c725a])
	{
		if(level.var_8c92b387[var_a91c725a].size > 0)
		{
			var_a8953380 = level.var_8c92b387[var_a91c725a][0];
			ArrayRemoveValue(level.var_8c92b387[var_a91c725a], var_a8953380);
		}
		else if(level.var_8c92b387["chaos_round_spawn_general"].size > 0)
		{
			var_a8953380 = level.var_8c92b387["chaos_round_spawn_general"][0];
			ArrayRemoveValue(level.var_8c92b387["chaos_round_spawn_general"], var_a8953380);
		}
		if(isdefined(var_a8953380))
		{
			level flag::set("mega_round_end_shad_talking");
			shadowman_say(var_a8953380);
			level flag::clear("mega_round_end_shad_talking");
		}
	}
	if(level.var_c1feb276 !== "wisps_off")
	{
		level notify("hash_ae62e4bd");
	}
}

/*
	Name: function_c74d1a57
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x11218
	Size: 0x308
	Parameters: 0
	Flags: None
	Line Number: 2769
*/
function function_c74d1a57()
{
	level endon("hash_b66ef55c");
	level thread function_98ebb22a();
	level.var_83e70c7a = 1;
	level notify("hash_ae62e4bd");
	if(level.var_8c92b387["chaos_round_start"].size > 0)
	{
		var_5945c71b = level.var_8c92b387["chaos_round_start"][0];
		shadowman_say(var_5945c71b);
		ArrayRemoveValue(level.var_8c92b387["chaos_round_start"], var_5945c71b);
	}
	var_6e11c191 = [];
	var_6e11c191["chaos_round_spawn_apothicon"] = 0;
	var_6e11c191["chaos_round_spawn_keeper"] = 0;
	var_6e11c191["chaos_round_spawn_margwa"] = 0;
	var_6e11c191["chaos_round_spawn_panzersoldat"] = 0;
	var_6e11c191["chaos_round_spawn_parasite"] = 0;
	var_30f9b5a1 = [];
	var_30f9b5a1["chaos_round_spawn_apothicon"] = 50;
	var_30f9b5a1["chaos_round_spawn_keeper"] = 50;
	var_30f9b5a1["chaos_round_spawn_parasite"] = 15;
	while(1)
	{
		var_a91c725a = util::waittill_any_ex("chaos_round_spawn_keeper", "chaos_round_spawn_parasite", "chaos_round_spawn_apothicon", level, "chaos_round_complete");
		var_be6a28e5 = RandomInt(100);
		if(!(isdefined(var_6e11c191[var_a91c725a]) && var_6e11c191[var_a91c725a]) && isdefined(level.var_8c92b387[var_a91c725a]) && var_be6a28e5 < var_30f9b5a1[var_a91c725a])
		{
			var_6e11c191[var_a91c725a] = 1;
			if(level.var_8c92b387[var_a91c725a].size > 0)
			{
				var_a8953380 = level.var_8c92b387[var_a91c725a][0];
				ArrayRemoveValue(level.var_8c92b387[var_a91c725a], var_a8953380);
			}
			else if(level.var_8c92b387["chaos_round_spawn_general"].size > 0)
			{
				var_a8953380 = level.var_8c92b387["chaos_round_spawn_general"][0];
				ArrayRemoveValue(level.var_8c92b387["chaos_round_spawn_general"], var_a8953380);
			}
			if(isdefined(var_a8953380))
			{
				shadowman_say(var_a8953380);
			}
		}
	}
}

/*
	Name: function_98ebb22a
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x11528
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 2826
*/
function function_98ebb22a()
{
	level waittill("hash_b66ef55c");
	if(level.var_7b3abc9b.size > 0)
	{
		function_58758962(level.var_7b3abc9b[0]);
		ArrayRemoveIndex(level.var_7b3abc9b, 0, 0);
	}
	level notify("hash_d5a3b3d");
	return;
}

/*
	Name: function_58758962
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x115A0
	Size: 0x1B8
	Parameters: 1
	Flags: None
	Line Number: 2848
*/
function function_58758962(var_46866c13)
{
	var_a5052088 = [];
	var_a5052088["abcd"] = "mega_round_end_abcd";
	var_a5052088["shad"] = "mega_round_end_shad";
	var_89dff895 = [];
	var_89dff895["abcd"] = "mega_round_end_abcd_talking";
	var_89dff895["shad"] = "mega_round_end_shad_talking";
	var_bb7e5747 = [];
	var_bb7e5747["abcd"] = &function_c62826c9;
	var_bb7e5747["shad"] = &shadowman_say;
	var_d5c77268 = var_a5052088[var_46866c13];
	var_eb812675 = var_89dff895[var_46866c13];
	var_31290267 = var_bb7e5747[var_46866c13];
	if(level.var_8c92b387[var_d5c77268].size)
	{
		level flag::set(var_eb812675);
		var_d44b84c3 = level.var_8c92b387[var_d5c77268][0];
		[[var_31290267]](var_d44b84c3);
		ArrayRemoveIndex(level.var_8c92b387[var_d5c77268], 0);
		level flag::clear(var_eb812675);
	}
}

/*
	Name: function_5e81e3ff
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x11760
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 2882
*/
function function_5e81e3ff()
{
	if(!function_316d6c5c() && !level flag::get("abcd_speaking") && !level flag::get("shadowman_speaking"))
	{
		if(!flag::exists("corruption_engine_vo"))
		{
			flag::init("corruption_engine_vo");
		}
		if(!level flag::get("wisp_abcd_speaking") && !level flag::get("wisp_shad_speaking") && level.var_8c92b387["corruption_engine_override"].size > 0 && !flag::get("corruption_engine_vo"))
		{
			flag::set("corruption_engine_vo");
			str_vo = level.var_8c92b387["corruption_engine_override"][0];
			ArrayRemoveValue(level.var_8c92b387["corruption_engine_override"], str_vo);
			shadowman_say(str_vo);
			flag::clear("corruption_engine_vo");
		}
	}
}

/*
	Name: function_e658d896
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x11910
	Size: 0x2C8
	Parameters: 0
	Flags: None
	Line Number: 2911
*/
function function_e658d896()
{
	if(!flag::exists("final_boss_defeated") || !flag::get("final_boss_defeated"))
	{
		if(RandomInt(100) < 50)
		{
			self notify("hash_9aa179de");
		}
		else if(level.round_number > 10 && (!(isdefined(self.var_1cd72357) && self.var_1cd72357)))
		{
			a_str_cat = Array("shadowman_taunt_downed_demp", "shadowman_taunt_downed_niko", "shadowman_taunt_downed_rich", "shadowman_taunt_downed_take");
			str_cat = a_str_cat[self.characterindex];
			self function_502f946b();
			while(isdefined(level.var_8c92b387[str_cat][0]))
			{
				str_vo = level.var_8c92b387[str_cat][0];
				ArrayRemoveValue(level.var_8c92b387[str_cat], str_vo);
				self function_7b697614(str_vo, 0.75, 1, 1000, 1, 1);
			}
			self.var_1cd72357 = 1;
		}
		else if(isdefined(level.var_83e70c7a) && level.var_83e70c7a && !level flag::get("abcd_speaking") && !level flag::get("shadowman_speaking") && RandomInt(100) > 75)
		{
			if(isdefined(level.var_8c92b387["dr_monty_chastisement"][0]))
			{
				self function_502f946b();
				str_vo = level.var_8c92b387["dr_monty_chastisement"][0];
				ArrayRemoveValue(level.var_8c92b387["dr_monty_chastisement"], str_vo);
				self function_7b697614(str_vo, 0.75, 1, 1000, 1, 1);
			}
		}
	}
}

/*
	Name: function_2b0fa0c0
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x11BE0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 2955
*/
function function_2b0fa0c0()
{
	while(1)
	{
		self waittill("player_bought", e_what);
		if(isdefined(e_what) && isdefined(e_what.name))
		{
			if(e_what.name == "dragonshield")
			{
				self thread function_aa5f0ceb("dragonshield_pickup", 1);
			}
		}
	}
}

/*
	Name: function_2a22bd54
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x11C68
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2980
*/
function function_2a22bd54()
{
	self function_aa5f0ceb("gateworm_egg_acquire", 1);
}

/*
	Name: function_78d4f20e
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x11C98
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2995
*/
function function_78d4f20e()
{
	self function_aa5f0ceb("gateworm_acquire", 1);
}

/*
	Name: function_4821b1a3
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x11CC8
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 3010
*/
function function_4821b1a3(var_46866c13)
{
	if(var_46866c13 === "wisp_abcd" || var_46866c13 === "wisp_shad")
	{
		str_set = var_46866c13;
	}
	else
	{
		str_set = "wisp_" + var_46866c13;
	}
	if(isdefined(level.var_8c92b387[str_set]) && isdefined(level.var_8c92b387[str_set][0]))
	{
		ArrayRemoveIndex(level.var_8c92b387[str_set], 0);
		return;
	}
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_10b9b50e
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x11D78
	Size: 0x158
	Parameters: 1
	Flags: None
	Line Number: 3039
*/
function function_10b9b50e(str_set)
{
	if(!isdefined(str_set))
	{
		str_set = "wisp_abcd";
	}
	var_5a26c45b = [];
	var_5a26c45b["wisp_abcd"] = &function_c62826c9;
	var_5a26c45b["wisp_shad"] = &shadowman_say;
	str_flag = str_set + "_speaking";
	if(isdefined(level.var_8c92b387[str_set][0]) && level.var_8c92b387[str_set][0].size > 0)
	{
		var_40f41259 = level.var_8c92b387[str_set][0];
		var_d44b84c3 = var_40f41259[0];
		level flag::set(str_flag);
		[[var_5a26c45b[str_set]]](var_d44b84c3, 0);
		ArrayRemoveIndex(var_40f41259, 0);
		level flag::clear(str_flag);
	}
}

/*
	Name: function_36734069
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x11ED8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 3070
*/
function function_36734069()
{
	function_c62826c9(level.var_8c92b387["fun_facts_intro"]);
}

/*
	Name: function_2050fb34
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x11F10
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 3085
*/
function function_2050fb34()
{
	function_c62826c9(level.var_8c92b387["fun_facts_activate"]);
}

/*
	Name: function_bbeae714
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x11F48
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 3100
*/
function function_bbeae714(var_d95a0cf3)
{
	var_d44b84c3 = level.var_8c92b387["fun_facts"][var_d95a0cf3];
	if(!level flag::get("abcd_speaking") && !level flag::get("shadowman_speaking") && (isdefined(var_d44b84c3) && var_d44b84c3.size > 0))
	{
		str_vo = var_d44b84c3[0];
		function_c62826c9(str_vo, 1);
		ArrayRemoveIndex(var_d44b84c3, 0);
	}
}

/*
	Name: function_e5bc23b9
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12028
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 3121
*/
function function_e5bc23b9(str_type)
{
	a_n_probability = [];
	a_n_probability["gen_pos"] = 100;
	a_n_probability["gen_neg"] = 50;
	a_n_probability["gen_pickup"] = 100;
	if(isdefined(a_n_probability[str_type]))
	{
		n_roll = RandomInt(100);
		if(n_roll < a_n_probability[str_type])
		{
			b_success = self function_aa5f0ceb(str_type, 0);
			return b_success;
		}
		return 0;
		return;
	}
}

/*
	Name: function_60f0dfbc
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12100
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 3150
*/
function function_60f0dfbc()
{
	self notify("hash_cec35eb0");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e6873e6a
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12120
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 3167
*/
function function_e6873e6a()
{
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		str_notify = self util::waittill_any_return("disconnect", "gen_pickup", "player_got_keeper_companion_piece", "player_got_craftable_piece_for_craft_shield_zm");
		self thread function_e5bc23b9("gen_pickup");
		wait(5);
	}
}

/*
	Name: function_f24af040
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x121B0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 3189
*/
function function_f24af040()
{
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("hash_7cbc9d72");
		self.var_f069d80e++;
		if(self.var_f069d80e <= 4)
		{
			self thread function_e5bc23b9("gen_pos");
		}
		else
		{
			level thread function_a8d63dab(self.var_6f621931);
			self.var_f069d80e = 0;
		}
		wait(10);
	}
}

/*
	Name: function_4eab9dac
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12258
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 3220
*/
function function_4eab9dac()
{
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("hash_9aa179de");
		self thread function_e5bc23b9("gen_neg");
		wait(30);
	}
	return;
	waittillframeend;
}

/*
	Name: function_a2bd8b29
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x122B8
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 3244
*/
function function_a2bd8b29()
{
	level endon("hash_1ec5d376");
	level waittill("hash_b66ef55c");
	n_probability = 100;
	while(level.var_8c92b387["misc_abcd_encouragement"].size)
	{
		str_notify = util::waittill_any_ex("apotho_pack_freed", "time_attack_weapon_awarded", level, "final_boss_defeated");
		switch(str_notify)
		{
			case "used_apothicon_cannon":
			{
				n_probability = 33;
				break;
			}
			case "apotho_pack_freed":
			{
				if(isdefined(level.var_793cad85))
				{
					level.var_793cad85 notify("hash_7cbc9d72");
				}
				var_58cd035a = 0;
				break;
			}
			case "time_attack_weapon_awarded":
			{
				n_probability = 33;
				break;
			}
			default
			{
				n_probability = 0;
				break;
			}
		}
		if(n_probability)
		{
			n_roll = RandomInt(100);
			if(n_roll < n_probability)
			{
				function_a8d63dab();
			}
		}
		level notify("hash_a285ec90");
		wait(30);
	}
}

/*
	Name: function_a8d63dab
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12430
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 3302
*/
function function_a8d63dab(var_141eb752)
{
	if(level.var_8c92b387["misc_abcd_encouragement"].size)
	{
		str_vo = level.var_8c92b387["misc_abcd_encouragement"][0];
		if(isdefined(var_141eb752))
		{
			function_c62826c9(str_vo, 0, 0, 0, var_141eb752);
		}
		else
		{
			function_c62826c9(str_vo);
		}
		ArrayRemoveIndex(level.var_8c92b387["misc_abcd_encouragement"], 0);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ee206f01
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x124E8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 3331
*/
function function_ee206f01()
{
	self endon("death");
	while(1)
	{
		str_notify = self util::waittill_any_return("flag_player_completed_challenge_1", "flag_player_completed_challenge_2", "flag_player_completed_challenge_3", "changed_wearable");
		switch(str_notify)
		{
			case "flag_player_completed_challenge_1":
			case "flag_player_completed_challenge_2":
			case "flag_player_completed_challenge_3":
			{
				self notify("hash_7cbc9d72");
				break;
			}
			case "changed_wearable":
			{
				self notify("hash_7cbc9d72");
				break;
			}
		}
	}
	return;
	.var_0 = undefined;
}

/*
	Name: function_89b21fad
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x125A0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 3367
*/
function function_89b21fad()
{
	if(!isdefined(self.var_55312abc))
	{
		self.var_55312abc = 0;
	}
	if(self.var_55312abc < 3)
	{
		wait(1);
		self zm_audio::create_and_play_dialog("keeper_protector", "summon");
		self.var_55312abc++;
	}
}

/*
	Name: function_92425254
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12608
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 3391
*/
function function_92425254()
{
	n_roll = RandomInt(100);
	if(n_roll < 75)
	{
		self function_aa5f0ceb("protector_kill", 0.5);
	}
}

/*
	Name: function_a5e16a1e
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12670
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 3410
*/
function function_a5e16a1e()
{
	self function_aa5f0ceb("protector_craft", 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_21783178
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x126A0
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 3427
*/
function function_21783178(var_fc7f95e3)
{
	if(isdefined(level.var_8c92b387["acquire_audiolog"][var_fc7f95e3.characterindex]))
	{
		var_fc7f95e3 function_7b697614(level.var_8c92b387["acquire_audiolog"][var_fc7f95e3.characterindex]);
		level.var_8c92b387["acquire_audiolog"][var_fc7f95e3.characterindex] = undefined;
	}
}

/*
	Name: function_dfe962f
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12738
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 3446
*/
function function_dfe962f()
{
	if(!(isdefined(level.var_4a394cdf) && level.var_4a394cdf))
	{
		level.var_4a394cdf = 1;
		if(level.activePlayers.size == 1)
		{
			var_67d3fdc6 = level.activePlayers[0].characterindex;
		}
		else
		{
			e_richtofen = zm_utility::get_specific_character(2);
			e_closest_player = zm_utility::get_player_closest_to(e_richtofen);
			var_67d3fdc6 = e_closest_player.characterindex;
		}
		level waittill("hash_ef5f3d90");
		if(isdefined(level.var_8c92b387["sophia_appears_1_convo"][var_67d3fdc6]))
		{
			var_d44b84c3 = level.var_8c92b387["sophia_appears_1_convo"][var_67d3fdc6];
			function_7aa5324a(var_d44b84c3, 1);
			level.var_8c92b387["sophia_appears_1_convo"][var_67d3fdc6] = undefined;
		}
	}
}

/*
	Name: function_efdd99e2
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12878
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 3481
*/
function function_efdd99e2(e_player)
{
	if(!(isdefined(level.var_d831dda4) && level.var_d831dda4))
	{
		level.var_d831dda4 = 1;
		var_67d3fdc6 = e_player.characterindex;
		var_d44b84c3 = level.var_8c92b387["sophia_appears_2_convo"][var_67d3fdc6];
		function_7aa5324a(var_d44b84c3, 1);
		shadowman_say(level.var_8c92b387["sophia_appears_2_abcd_vo"], 0);
	}
}

/*
	Name: function_ab35cb95
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12938
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 3503
*/
function function_ab35cb95()
{
	function_897246e4(level.var_8c92b387["sophia_activates_teleporter"]);
}

/*
	Name: function_14ee80c6
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12970
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 3518
*/
function function_14ee80c6()
{
	level endon("hash_a14d03aa");
	level endon("hash_a6e90db1");
	level endon("hash_38b4845b");
	while(level.var_8c92b387["teleporter_sophia_nag"].size > 0)
	{
		wait(30);
		function_ceb51f();
	}
}

/*
	Name: function_ceb51f
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x129D8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 3540
*/
function function_ceb51f()
{
	var_385eca05 = level.var_8c92b387["teleporter_sophia_nag"][0];
	function_897246e4(var_385eca05);
	ArrayRemoveIndex(level.var_8c92b387["teleporter_sophia_nag"], 0);
}

/*
	Name: function_60fe98c4
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12A48
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 3557
*/
function function_60fe98c4()
{
	var_bd381e73 = "sams_room_no_book_convo";
	if(level flag::get("book_picked_up"))
	{
		var_bd381e73 = "sams_room_with_book_convo";
	}
	if(level.activePlayers.size == 1)
	{
		var_67d3fdc6 = level.activePlayers[0].characterindex;
	}
	else
	{
		e_richtofen = zm_utility::get_specific_character(2);
		e_closest_player = zm_utility::get_player_closest_to(e_richtofen);
		var_67d3fdc6 = e_closest_player.characterindex;
	}
	var_d44b84c3 = level.var_8c92b387[var_bd381e73][var_67d3fdc6];
	if(isdefined(var_d44b84c3))
	{
		function_7aa5324a(var_d44b84c3);
		level.var_8c92b387[var_bd381e73][var_67d3fdc6] = undefined;
	}
}

/*
	Name: function_47713f03
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12B78
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 3592
*/
function function_47713f03(e_player)
{
	var_67d3fdc6 = e_player.characterindex;
	if(isdefined(level.var_8c92b387["summoning_key_pickup"][var_67d3fdc6]))
	{
		function_897246e4(level.var_8c92b387["summoning_key_pickup"][var_67d3fdc6]);
		level.var_8c92b387["summoning_key_pickup"][var_67d3fdc6] = undefined;
		function_c62826c9(level.var_8c92b387["summoning_key_pickup_abcd_overt"], 0, 1, 1000, 2);
	}
}

/*
	Name: function_e644549c
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12C38
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 3613
*/
function function_e644549c(var_af2df8a3)
{
	level.var_14dff117++;
	if(level.var_14dff117 == 3)
	{
		function_af6a23e7();
	}
}

/*
	Name: function_af6a23e7
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12C78
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 3632
*/
function function_af6a23e7()
{
	function_c62826c9(level.var_8c92b387["toy_3_abcd"], 1, 0, 0, 2);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5f2a1c13
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12CB8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 3649
*/
function function_5f2a1c13()
{
	shadowman_say(level.var_8c92b387["boss_start_shad"]);
	e_player = Array::random(level.activePlayers);
	function_897246e4(level.var_8c92b387["boss_start_response"][e_player.characterindex]);
	level thread function_a9c857();
	return;
	ERROR: Bad function call
}

/*
	Name: function_8c5fea67
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12D60
	Size: 0x170
	Parameters: 1
	Flags: None
	Line Number: 3669
*/
function function_8c5fea67(e_player)
{
	var_f7416da7 = level.var_8c92b387["throw_sophia_summoning_key"][e_player.characterindex];
	if(isdefined(var_f7416da7) && var_f7416da7.size > 0)
	{
		function_897246e4(var_f7416da7[0]);
		ArrayRemoveIndex(var_f7416da7, 0);
	}
	if(!level flag::exists("final_boss_at_deaths_door") || !level flag::get("final_boss_at_deaths_door"))
	{
		var_15e4021e = level.var_8c92b387["sophia_firing"];
		if(isdefined(var_15e4021e) && var_15e4021e.size > 0)
		{
			sophia_say(var_15e4021e[0]);
			ArrayRemoveIndex(var_15e4021e, 0);
		}
	}
	else
	{
		function_897246e4(level.var_8c92b387["shad_boss_fight_killing_blow_response"][e_player.characterindex]);
	}
}

/*
	Name: function_a9c857
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12ED8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 3702
*/
function function_a9c857()
{
	level endon("hash_1ec5d376");
	level endon("hash_38b4845b");
	while(level.var_8c92b387["shad_boss_taunts"].size)
	{
		level flag::wait_till("final_boss_vulnerable");
		function_a0326f63();
		level flag::wait_till_clear("final_boss_vulnerable");
		function_a0326f63();
	}
}

/*
	Name: function_a0326f63
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12F70
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 3725
*/
function function_a0326f63()
{
	if(level.var_8c92b387["shad_boss_taunts"].size > 0)
	{
		shadowman_say(level.var_8c92b387["shad_boss_taunts"][0]);
		ArrayRemoveIndex(level.var_8c92b387["shad_boss_taunts"], 0, 0);
	}
}

/*
	Name: function_e4bc2634
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x12FE8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 3744
*/
function function_e4bc2634()
{
	if(level.var_8c92b387["shad_boss_hurt"].size)
	{
		shadowman_say(level.var_8c92b387["shad_boss_hurt"][0]);
		ArrayRemoveIndex(level.var_8c92b387["shad_boss_hurt"], 0, 0);
	}
}

/*
	Name: function_c4c3abad
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x13060
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 3763
*/
function function_c4c3abad()
{
	if(level.var_8c92b387["shad_boss_rushread"].size)
	{
		shadowman_say(level.var_8c92b387["shad_boss_rushread"][0]);
		ArrayRemoveIndex(level.var_8c92b387["shad_boss_rushread"], 0, 0);
	}
}

/*
	Name: function_273b3233
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x130D8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 3782
*/
function function_273b3233()
{
	shadowman_say("vox_shad_dark_arena_enter_0");
	wait(1);
	var_99cc9099 = Array::random(level.activePlayers);
	var_99cc9099 function_7b697614(level.var_8c92b387["shad_boss_rush_start_closest_to_sophia"][var_99cc9099.characterindex]);
	level thread function_d96c6f7();
	return;
	continue;
}

/*
	Name: function_d96c6f7
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x13178
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 3803
*/
function function_d96c6f7()
{
	level endon("hash_15617ebe");
	level endon("hash_38b4845b");
	while(level.var_8c92b387["shad_boss_rush_taunts"].size > 0)
	{
		n_wait = randomIntRange(45, 60);
		wait(n_wait);
		function_9907a7c3();
	}
}

/*
	Name: function_9907a7c3
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x13200
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 3825
*/
function function_9907a7c3()
{
	if(level.var_8c92b387["shad_boss_rush_taunts"].size > 0)
	{
		shadowman_say(level.var_8c92b387["shad_boss_rush_taunts"][0]);
		ArrayRemoveIndex(level.var_8c92b387["shad_boss_rush_taunts"], 0, 0);
	}
}

/*
	Name: function_dfd31c20
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x13278
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 3844
*/
function function_dfd31c20()
{
	if(isdefined(level.var_5b08e991))
	{
		function_2426269b(level.var_5b08e991.origin, 10000);
	}
	shadowman_say(level.var_8c92b387["shad_boss_defeated"]);
}

/*
	Name: function_e1bf753b
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x132E0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 3863
*/
function function_e1bf753b()
{
	wait(1.5);
	if(!level flag::get("pap_entered") && zm_utility::is_player_valid(self))
	{
		b_success = self function_aa5f0ceb("pap_enter");
		if(b_success)
		{
			level flag::set("pap_entered");
		}
	}
}

/*
	Name: function_57f3d77
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x13380
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 3886
*/
function function_57f3d77()
{
	level.var_793cad85 = self;
	if(!level flag::get("pap_artery_destroyed") && zm_utility::is_player_valid(self))
	{
		b_success = self function_aa5f0ceb("pap_artery_destroy");
		if(b_success)
		{
			level flag::set("pap_artery_destroyed");
			level waittill("end_of_round");
			level flag::clear("pap_artery_destroyed");
		}
	}
}

/*
	Name: function_843b5ad0
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x13448
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 3911
*/
function function_843b5ad0()
{
	str_player_zone = zm_zonemgr::get_player_zone();
	return str_player_zone === "dark_arena_zone" || str_player_zone === "dark_arena2_zone";
}

/*
	Name: function_316d6c5c
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x13490
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 3927
*/
function function_316d6c5c()
{
	foreach(player in level.activePlayers)
	{
		if(player function_843b5ad0())
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_632967ad
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x13530
	Size: 0x980
	Parameters: 0
	Flags: None
	Line Number: 3949
*/
function function_632967ad()
{
	/#
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 2, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 3, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 4, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 5, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 6, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 7, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 8, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 9, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 10, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 11, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 12, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 13, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 14, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 15, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 16, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 17, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 18, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 19, &function_209da490);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 0, &function_9104f6c3);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_9104f6c3);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 2, &function_9104f6c3);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 3, &function_9104f6c3);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 0, &function_b28d80bd);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_b28d80bd);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 2, &function_b28d80bd);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 3, &function_b28d80bd);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 0, &function_cb9eba2);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 0, &function_f030bece);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 0, &function_a012e4e0);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_cb9eba2);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_f030bece);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_a012e4e0);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 2, &function_cb9eba2);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 2, &function_f030bece);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 2, &function_a012e4e0);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 3, &function_cb9eba2);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 3, &function_f030bece);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 3, &function_a012e4e0);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 0, &function_b780637);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_b780637);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 2, &function_b780637);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 3, &function_b780637);
		return;
	#/
	continue;
}

/*
	Name: function_209da490
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x13EB8
	Size: 0x290
	Parameters: 1
	Flags: None
	Line Number: 4011
*/
function function_209da490(n_val)
{
	/#
		switch(n_val)
		{
			case 1:
			{
				level thread function_21783178(level.activePlayers[0]);
				break;
			}
			case 2:
			{
				level thread function_dfe962f();
				break;
			}
			case 3:
			{
				level thread function_efdd99e2(level.activePlayers[0]);
				break;
			}
			case 4:
			{
				level thread function_ab35cb95();
				break;
			}
			case 5:
			{
				level thread function_ceb51f();
				break;
			}
			case 6:
			{
				level thread function_60fe98c4();
				break;
			}
			case 7:
			{
				level thread function_47713f03(level.activePlayers[0]);
				break;
			}
			case 8:
			{
				level thread function_e644549c(level.activePlayers[0]);
				break;
			}
			case 9:
			{
				level thread function_af6a23e7();
				break;
				break;
			}
			case 10:
			{
			}
			case 11:
			{
				level thread function_5f2a1c13();
				break;
			}
			case 12:
			{
				level thread function_8c5fea67(level.activePlayers[0]);
				break;
			}
			case 13:
			{
				level thread function_a0326f63();
				break;
				break;
			}
			case 14:
			{
			}
			case 15:
			{
				level thread function_e4bc2634();
				break;
			}
			case 16:
			{
				level thread function_c4c3abad();
				break;
			}
			case 17:
			{
				level thread function_273b3233();
				break;
			}
			case 18:
			{
				level thread function_9907a7c3();
				break;
			}
			case 19:
			{
				level thread function_dfd31c20();
				break;
			}
		}
	#/
}

/*
	Name: function_b780637
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x14150
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 4123
*/
function function_b780637(n_val)
{
	/#
		var_e8489bcc = 90 * n_val;
		v_face = (0, var_e8489bcc, 0);
		player = level.activePlayers[0];
		var_5d8a4d6d = util::spawn_model("Dev Block strings are not supported", player.origin, player.angles);
		player LinkTo(var_5d8a4d6d);
		var_5d8a4d6d RotateTo(v_face, 0.25);
		wait(0.5);
		player Unlink();
		var_5d8a4d6d delete();
	#/
}

/*
	Name: function_9104f6c3
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x14268
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 4148
*/
function function_9104f6c3(var_9485d9b7)
{
	/#
		if(!level flag::get("Dev Block strings are not supported"))
		{
			level flag::set("Dev Block strings are not supported");
			function_13bbcb98("Dev Block strings are not supported", 0, 0, 1000, var_9485d9b7);
			level flag::clear("Dev Block strings are not supported");
		}
	#/
}

/*
	Name: function_b28d80bd
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x14308
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 4170
*/
function function_b28d80bd(var_9485d9b7)
{
	/#
		e_character = zm_utility::get_specific_character(var_9485d9b7);
		if(isdefined(e_character))
		{
			e_character function_7b697614("Dev Block strings are not supported", 0, 0, 1000, 1, 1);
		}
	#/
}

/*
	Name: function_cb9eba2
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x14378
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 4191
*/
function function_cb9eba2(n_val)
{
	/#
		level.activePlayers[n_val] notify("hash_7cbc9d72");
	#/
}

/*
	Name: function_f030bece
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x143B0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 4208
*/
function function_f030bece(n_val)
{
	/#
		level.activePlayers[n_val] notify("hash_9aa179de");
	#/
}

/*
	Name: function_a012e4e0
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x143E8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 4225
*/
function function_a012e4e0(n_val)
{
	/#
		level.activePlayers[n_val] notify("hash_cec35eb0");
	#/
}

/*
	Name: function_1ada31a1
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x14420
	Size: 0x58
	Parameters: 0
	Flags: Private
	Line Number: 4242
*/
function private function_1ada31a1()
{
	var_4d97ef95 = struct::get_array("audio_reel_place", "targetname");
	Array::thread_all(var_4d97ef95, &function_7914cbc8);
	return;
}

/*
	Name: function_7914cbc8
	Namespace: namespace_c149ef1
	Checksum: 0x424F4353
	Offset: 0x14480
	Size: 0xC6
	Parameters: 0
	Flags: None
	Line Number: 4259
*/
function function_7914cbc8()
{
	level flag::wait_till("got_audio" + self.script_int);
	self waittill("trigger_activated");
	wait(0.5);
	switch(self.script_int)
	{
		case 1:
		{
			namespace_cc012897::Send("vox_soph_kino_log_1_0");
			break;
		}
		case 2:
		{
			namespace_cc012897::Send("vox_sfx_radio_stem_kino_log_2_0");
			break;
		}
		case 3:
		{
			namespace_cc012897::Send("vox_sfx_radio_stem_kino_log_3_0");
			break;
		}
	}
}

