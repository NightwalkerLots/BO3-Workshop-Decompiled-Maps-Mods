#include scripts\codescripts\struct;
#include scripts\shared\abilities\_ability_player;
#include scripts\shared\ai\behavior_zombie_dog;
#include scripts\shared\ai\zombie;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_dogs;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_hero_weapon;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_pack_a_punch;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perk_deadshot;
#include scripts\zm\_zm_perk_doubletap2;
#include scripts\zm\_zm_perk_juggernaut;
#include scripts\zm\_zm_perk_quick_revive;
#include scripts\zm\_zm_perk_sleight_of_hand;
#include scripts\zm\_zm_perk_staminup;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerup_double_points;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_powerup_free_perk;
#include scripts\zm\_zm_powerup_full_ammo;
#include scripts\zm\_zm_powerup_insta_kill;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerup_weapon_minigun;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_timer;
#include scripts\zm\_zm_trap_electric;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_annihilator;
#include scripts\zm\_zm_weap_bouncingbetty;
#include scripts\zm\_zm_weap_bowie;
#include scripts\zm\_zm_weap_cymbal_monkey;
#include scripts\zm\_zm_weap_tesla;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\bgbs\_zm_bgb_anywhere_but_here;
#include scripts\zm\zm_factory_cleanup_mgr;
#include scripts\zm\zm_factory_ffotd;
#include scripts\zm\zm_factory_fx;
#include scripts\zm\zm_factory_gamemodes;
#include scripts\zm\zm_factory_teleporter;
#include scripts\zm\zm_factory_vo;
#include scripts\zm\zm_factory_zombie;

#namespace zm_factory;

/*
	Name: opt_in
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x1E70
	Size: 0x28
	Parameters: 0
	Flags: AutoExec
	Line Number: 81
*/
function autoexec opt_in()
{
	level.aat_in_use = 1;
	level.bgb_in_use = 1;
	level.randomize_perk_machine_location = 1;
}

/*
	Name: main
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x1EA0
	Size: 0xA10
	Parameters: 0
	Flags: None
	Line Number: 98
*/
function main()
{
	namespace_689d3383::main_start();
	SetClearanceCeiling(17);
	zm_factory_fx::main();
	init_clientfields();
	scene::add_scene_func("p7_fxanim_zm_factory_bridge_lft_bundle", &bridge_disconnect, "init");
	scene::add_scene_func("p7_fxanim_zm_factory_bridge_lft_bundle", &bridge_connect, "done");
	scene::add_scene_func("p7_fxanim_zm_factory_bridge_rt_bundle", &bridge_disconnect, "init");
	scene::add_scene_func("p7_fxanim_zm_factory_bridge_rt_bundle", &bridge_connect, "done");
	level._uses_sticky_grenades = 1;
	level._uses_taser_knuckles = 1;
	zm::init_fx();
	level util::set_lighting_state(1);
	callback::on_connect(&function_7cb67075);
	callback::on_spawned(&on_player_spawned);
	level._effect["eye_glow"] = "zombie/fx_glow_eye_orange";
	level._effect["headshot"] = "zombie/fx_bul_flesh_head_fatal_zmb";
	level._effect["headshot_nochunks"] = "zombie/fx_bul_flesh_head_nochunks_zmb";
	level._effect["bloodspurt"] = "zombie/fx_bul_flesh_neck_spurt_zmb";
	level._effect["animscript_gib_fx"] = "zombie/fx_blood_torso_explo_zmb";
	level._effect["animscript_gibtrail_fx"] = "trail/fx_trail_blood_streak";
	level._effect["switch_sparks"] = "electric/fx_elec_sparks_directional_orange";
	level.var_9cef605e = &function_81abed86;
	level.default_start_location = "start_room";
	level.default_game_mode = "zclassic";
	zm::spawn_life_brush((700, -986, 280), 128, 128);
	level.random_pandora_box_start = 1;
	if(1 == GetDvarInt("movie_intro"))
	{
		SetDvar("art_review", "1");
		level.random_pandora_box_start = 0;
		level.start_chest_name = "chest_4";
		var_8ad3e4ad = GetEnt("clock_snow", "targetname");
		var_8ad3e4ad ghost();
		scene::add_scene_func("cin_der_01_intro_3rd_sh050", &clock_shot, "play");
		level thread cinematic();
	}
	else
	{
		clock = GetEnt("factory_clock", "targetname");
		clock thread scene::Play("p7_fxanim_zm_factory_clock_bundle");
	}
	level.has_richtofen = 0;
	level.powerup_special_drop_override = &powerup_special_drop_override;
	level.precacheCustomCharacters = &precacheCustomCharacters;
	level.giveCustomCharacters = &giveCustomCharacters;
	level thread setup_personality_character_exerts();
	initCharacterStartIndex();
	level.register_offhand_weapons_for_level_defaults_override = &offhand_weapon_overrride;
	level.zombiemode_offhand_weapon_give_override = &offhand_weapon_give_override;
	level._zombie_custom_add_weapons = &custom_add_weapons;
	level thread custom_add_vox();
	level._allow_melee_weapon_switching = 1;
	level.enemy_location_override_func = &enemy_location_override;
	level.no_target_override = &no_target_override;
	zm_pap_util::enable_swap_attachments();
	level thread function_e0f73644();
	include_weapons();
	include_powerups();
	include_perks();
	level.zm_custom_spawn_location_selection = &factory_custom_spawn_location_selection;
	load::main();
	fx_overrides();
	compass::setupMiniMap("compass_map_zm_factory");
	_zm_weap_cymbal_monkey::init();
	_zm_weap_tesla::init();
	level.pulls_since_last_ray_gun = 0;
	level.pulls_since_last_tesla_gun = 0;
	level.player_drops_tesla_gun = 0;
	level.debug_keyline_zombies = 0;
	level.burning_zombies = [];
	level.max_barrier_search_dist_override = 400;
	level.door_dialog_function = &zm::play_door_dialog;
	script_anims_init();
	level.zombie_anim_override = &anim_override_func;
	level.dog_rounds_allowed = GetGametypeSetting("allowdogs");
	if(level.dog_rounds_allowed)
	{
		zm_ai_dogs::enable_dog_rounds();
	}
	level.fn_custom_round_ai_spawn = &function_33aa4940;
	level._round_start_func = &zm::round_start;
	init_sounds();
	init_achievement();
	level thread power_electric_switch();
	level thread magic_box_init();
	level.zones = [];
	level.zone_manager_init_func = &factory_zone_init;
	init_zones[0] = "receiver_zone";
	level thread zm_zonemgr::manage_zones(init_zones);
	level function_a1d5988d();
	level.zombie_ai_limit = 24;
	level thread jump_from_bridge();
	level lock_additional_player_spawner();
	level thread bridge_init();
	level.grenade_planted = &function_6ea54e62;
	level thread sndFunctions();
	level.sndTrapFunc = &sndPA_Traps;
	level.monk_scream_trig = GetEnt("monk_scream_trig", "targetname");
	zombie_utility::set_zombie_var("zombie_powerup_drop_max_per_round", 4);
	a_t_audio = GetEntArray("audio_bump_trigger", "targetname");
	foreach(t_audio_bump in a_t_audio)
	{
		if(t_audio_bump.script_sound === "zmb_perks_bump_bottle")
		{
			t_audio_bump thread check_for_change();
		}
	}
	trigs = GetEntArray("trig_ee", "targetname");
	Array::thread_all(trigs, &extra_events);
	level.use_powerup_volumes = 1;
	level.var_9aaae7ae = &function_869d6f66;
	level thread ciphers();
	level thread flytrap();
	level thread function_5d386c43();
	/#
		level thread function_afea638c();
	#/
	namespace_689d3383::main_end();
}

/*
	Name: init_clientfields
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x28B8
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 230
*/
function init_clientfields()
{
	clientfield::register("world", "console_blue", 1, 1, "int");
	clientfield::register("world", "console_green", 1, 1, "int");
	clientfield::register("world", "console_red", 1, 1, "int");
	clientfield::register("world", "console_start", 1, 1, "int");
	clientfield::register("toplayer", "lightning_strike", 1, 1, "counter");
}

/*
	Name: function_a1d5988d
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x29B8
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 249
*/
function function_a1d5988d()
{
	var_e4821d40 = level.zones["wnuen_bridge_zone"].a_loc_types["dog_location"];
	if(isdefined(var_e4821d40))
	{
		foreach(spawn in var_e4821d40)
		{
			if(spawn.origin == (1196, -1459.8, 135.4))
			{
				spawn.origin = GetClosestPointOnNavMesh((1244, -1444, 136), 15);
				return;
			}
		}
	}
}

/*
	Name: cinematic
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x2AC8
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 275
*/
function cinematic()
{
	level flag::wait_till("all_players_connected");
	SetDvar("cg_draw2D", 0);
	SetDvar("cg_drawFPS", 0);
	SetDvar("cg_drawPerformanceWarnings", 0);
	while(!AreTexturesLoaded())
	{
		wait(0.05);
	}
	visionSetNaked("cp_igc_chinatown_intro", 0.05);
	foreach(e_player in level.players)
	{
		e_player FreezeControls(1);
		e_player AllowSprint(0);
		e_player AllowJump(0);
	}
	level.players[0] setClientUIVisibilityFlag("hud_visible", 0);
	SetDvar("debug_show_viewpos", "0");
	wait(3);
	var_a720d14f = struct::get("tag_align_switch_box");
	var_a720d14f scene::Play("cin_der_01_intro_3rd_sh010");
}

/*
	Name: clock_shot
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x2CD0
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 309
*/
function clock_shot(a_ents)
{
	clock = GetEnt("factory_clock", "targetname");
	clock thread scene::Play("p7_fxanim_zm_factory_clock_igc_bundle");
}

/*
	Name: on_player_spawned
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x2D30
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 325
*/
function on_player_spawned()
{
	self thread periodic_lightning_strikes();
}

/*
	Name: periodic_lightning_strikes
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x2D58
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 340
*/
function periodic_lightning_strikes()
{
	self endon("disconnect");
	util::wait_network_frame();
	while(1)
	{
		n_random_wait = randomIntRange(12, 18);
		if(isdefined(self) && isPlayer(self))
		{
			self notify("lightning_strike");
			self clientfield::increment_to_player("lightning_strike", 1);
		}
		wait(n_random_wait);
	}
	return;
	.var_0 = undefined;
}

/*
	Name: offhand_weapon_overrride
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x2E08
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 368
*/
function offhand_weapon_overrride()
{
	zm_utility::register_lethal_grenade_for_level("frag_grenade");
	level.zombie_lethal_grenade_player_init = GetWeapon("frag_grenade");
	zm_utility::register_tactical_grenade_for_level("cymbal_monkey");
	zm_utility::register_tactical_grenade_for_level("emp_grenade");
	zm_utility::register_melee_weapon_for_level(level.weaponBaseMelee.name);
	zm_utility::register_melee_weapon_for_level("bowie_knife");
	zm_utility::register_melee_weapon_for_level("tazer_knuckles");
	level.zombie_melee_weapon_player_init = level.weaponBaseMelee;
	level.zombie_equipment_player_init = undefined;
}

/*
	Name: offhand_weapon_give_override
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x2EE8
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 391
*/
function offhand_weapon_give_override(weapon)
{
	self endon("death");
	if(zm_utility::is_tactical_grenade(weapon) && isdefined(self zm_utility::get_player_tactical_grenade()) && !self zm_utility::is_player_tactical_grenade(weapon))
	{
		self SetWeaponAmmoClip(self zm_utility::get_player_tactical_grenade(), 0);
		self TakeWeapon(self zm_utility::get_player_tactical_grenade());
	}
	return 0;
}

/*
	Name: include_powerups
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x2FB0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 412
*/
function include_powerups()
{
	zm_powerups::add_zombie_special_drop("nothing");
}

/*
	Name: include_perks
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x2FD8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 427
*/
function include_perks()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: include_weapons
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x2FE8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 443
*/
function include_weapons()
{
	return;
	++;
}

/*
	Name: precacheCustomCharacters
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x2FF8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 459
*/
function precacheCustomCharacters()
{
}

/*
	Name: initCharacterStartIndex
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x3008
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 473
*/
function initCharacterStartIndex()
{
	level.characterStartIndex = RandomInt(4);
	return;
}

/*
	Name: selectCharacterIndexToUse
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x3038
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 489
*/
function selectCharacterIndexToUse()
{
	if(level.characterStartIndex >= 4)
	{
		level.characterStartIndex = 0;
	}
	self.characterindex = level.characterStartIndex;
	level.characterStartIndex++;
	return self.characterindex;
}

/*
	Name: assign_lowest_unused_character_index
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x3080
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 510
*/
function assign_lowest_unused_character_index()
{
	charindexarray = [];
	charindexarray[0] = 0;
	charindexarray[1] = 1;
	charindexarray[2] = 2;
	charindexarray[3] = 3;
	players = GetPlayers();
	if(players.size == 1)
	{
		charindexarray = Array::randomize(charindexarray);
		if(charindexarray[0] == 2)
		{
			level.has_richtofen = 1;
		}
		return charindexarray[0];
	}
	n_characters_defined = 0;
	foreach(player in players)
	{
		if(isdefined(player.characterindex))
		{
			ArrayRemoveValue(charindexarray, player.characterindex, 0);
			n_characters_defined++;
		}
	}
	if(charindexarray.size > 0)
	{
		if(n_characters_defined == players.size - 1)
		{
			if(!(isdefined(level.has_richtofen) && level.has_richtofen))
			{
				level.has_richtofen = 1;
				return 2;
			}
		}
		charindexarray = Array::randomize(charindexarray);
		if(charindexarray[0] == 2)
		{
			level.has_richtofen = 1;
		}
		return charindexarray[0];
	}
	return 0;
}

/*
	Name: giveCustomCharacters
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x32A0
	Size: 0x2D0
	Parameters: 0
	Flags: None
	Line Number: 566
*/
function giveCustomCharacters()
{
	if(isdefined(level.hotjoin_player_setup) && [[level.hotjoin_player_setup]]("c_zom_farmgirl_viewhands"))
	{
		return;
	}
	self DetachAll();
	if(!isdefined(self.characterindex))
	{
		self.characterindex = assign_lowest_unused_character_index();
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
		case 1:
		{
			self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("870mcs");
			break;
		}
		case 0:
		{
			self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("frag_grenade");
			self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("bouncingbetty");
			break;
		}
		case 3:
		{
			self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("hk416");
			break;
		}
		case 2:
		{
			self.talks_in_danger = 1;
			level.rich_sq_player = self;
			level.sndRadioA = self;
			self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("pistol_standard");
			break;
		}
	}
	self setMoveSpeedScale(1);
	self SetSprintDuration(4);
	self SetSprintCooldown(0);
	self thread set_exert_id();
}

/*
	Name: set_exert_id
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x3578
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 631
*/
function set_exert_id()
{
	self endon("disconnect");
	util::wait_network_frame();
	util::wait_network_frame();
	self zm_audio::SetExertVoice(self.characterindex + 1);
}

/*
	Name: setup_personality_character_exerts
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x35D8
	Size: 0x7F8
	Parameters: 0
	Flags: None
	Line Number: 649
*/
function setup_personality_character_exerts()
{
	level.exert_sounds[1]["burp"][0] = "evt_belch";
	level.exert_sounds[1]["burp"][1] = "evt_belch";
	level.exert_sounds[1]["burp"][2] = "evt_belch";
	level.exert_sounds[2]["burp"][0] = "evt_belch";
	level.exert_sounds[2]["burp"][1] = "evt_belch";
	level.exert_sounds[2]["burp"][2] = "evt_belch";
	level.exert_sounds[3]["burp"][0] = "evt_belch";
	level.exert_sounds[3]["burp"][1] = "evt_belch";
	level.exert_sounds[3]["burp"][2] = "evt_belch";
	level.exert_sounds[4]["burp"][0] = "evt_belch";
	level.exert_sounds[4]["burp"][1] = "evt_belch";
	level.exert_sounds[4]["burp"][2] = "evt_belch";
	level.exert_sounds[1]["hitmed"][0] = "vox_plr_0_exert_pain_0";
	level.exert_sounds[1]["hitmed"][1] = "vox_plr_0_exert_pain_1";
	level.exert_sounds[1]["hitmed"][2] = "vox_plr_0_exert_pain_2";
	level.exert_sounds[1]["hitmed"][3] = "vox_plr_0_exert_pain_3";
	level.exert_sounds[1]["hitmed"][4] = "vox_plr_0_exert_pain_4";
	level.exert_sounds[2]["hitmed"][0] = "vox_plr_1_exert_pain_0";
	level.exert_sounds[2]["hitmed"][1] = "vox_plr_1_exert_pain_1";
	level.exert_sounds[2]["hitmed"][2] = "vox_plr_1_exert_pain_2";
	level.exert_sounds[2]["hitmed"][3] = "vox_plr_1_exert_pain_3";
	level.exert_sounds[2]["hitmed"][4] = "vox_plr_1_exert_pain_4";
	level.exert_sounds[3]["hitmed"][0] = "vox_plr_2_exert_pain_0";
	level.exert_sounds[3]["hitmed"][1] = "vox_plr_2_exert_pain_1";
	level.exert_sounds[3]["hitmed"][2] = "vox_plr_2_exert_pain_2";
	level.exert_sounds[3]["hitmed"][3] = "vox_plr_2_exert_pain_3";
	level.exert_sounds[3]["hitmed"][4] = "vox_plr_2_exert_pain_4";
	level.exert_sounds[4]["hitmed"][0] = "vox_plr_3_exert_pain_0";
	level.exert_sounds[4]["hitmed"][1] = "vox_plr_3_exert_pain_1";
	level.exert_sounds[4]["hitmed"][2] = "vox_plr_3_exert_pain_2";
	level.exert_sounds[4]["hitmed"][3] = "vox_plr_3_exert_pain_3";
	level.exert_sounds[4]["hitmed"][4] = "vox_plr_3_exert_pain_4";
	level.exert_sounds[1]["hitlrg"][0] = "vox_plr_0_exert_pain_0";
	level.exert_sounds[1]["hitlrg"][1] = "vox_plr_0_exert_pain_1";
	level.exert_sounds[1]["hitlrg"][2] = "vox_plr_0_exert_pain_2";
	level.exert_sounds[1]["hitlrg"][3] = "vox_plr_0_exert_pain_3";
	level.exert_sounds[1]["hitlrg"][4] = "vox_plr_0_exert_pain_4";
	level.exert_sounds[2]["hitlrg"][0] = "vox_plr_1_exert_pain_0";
	level.exert_sounds[2]["hitlrg"][1] = "vox_plr_1_exert_pain_1";
	level.exert_sounds[2]["hitlrg"][2] = "vox_plr_1_exert_pain_2";
	level.exert_sounds[2]["hitlrg"][3] = "vox_plr_1_exert_pain_3";
	level.exert_sounds[2]["hitlrg"][4] = "vox_plr_1_exert_pain_4";
	level.exert_sounds[3]["hitlrg"][0] = "vox_plr_2_exert_pain_0";
	level.exert_sounds[3]["hitlrg"][1] = "vox_plr_2_exert_pain_1";
	level.exert_sounds[3]["hitlrg"][2] = "vox_plr_2_exert_pain_2";
	level.exert_sounds[3]["hitlrg"][3] = "vox_plr_2_exert_pain_3";
	level.exert_sounds[3]["hitlrg"][4] = "vox_plr_2_exert_pain_4";
	level.exert_sounds[4]["hitlrg"][0] = "vox_plr_3_exert_pain_0";
	level.exert_sounds[4]["hitlrg"][1] = "vox_plr_3_exert_pain_1";
	level.exert_sounds[4]["hitlrg"][2] = "vox_plr_3_exert_pain_2";
	level.exert_sounds[4]["hitlrg"][3] = "vox_plr_3_exert_pain_3";
	level.exert_sounds[4]["hitlrg"][4] = "vox_plr_3_exert_pain_4";
}

/*
	Name: custom_add_weapons
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x3DD8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 715
*/
function custom_add_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_factory_weapons.csv", 1);
}

/*
	Name: custom_add_vox
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x3E08
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 730
*/
function custom_add_vox()
{
	zm_audio::loadPlayerVoiceCategories("gamedata/audio/zm/zm_factory_vox.csv");
}

/*
	Name: init_achievement
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x3E30
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 745
*/
function init_achievement()
{
	return;
	.var_0 = undefined;
}

/*
	Name: factory_zone_init
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x3E40
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 761
*/
function factory_zone_init()
{
	zm_zonemgr::add_adjacent_zone("receiver_zone", "outside_east_zone", "enter_outside_east");
	zm_zonemgr::add_adjacent_zone("receiver_zone", "outside_west_zone", "enter_outside_west");
	zm_zonemgr::add_adjacent_zone("wnuen_zone", "outside_east_zone", "enter_wnuen_building");
	zm_zonemgr::add_adjacent_zone("wnuen_zone", "wnuen_bridge_zone", "enter_wnuen_loading_dock");
	zm_zonemgr::add_adjacent_zone("warehouse_bottom_zone", "outside_west_zone", "enter_warehouse_building");
	zm_zonemgr::add_adjacent_zone("warehouse_bottom_zone", "warehouse_top_zone", "enter_warehouse_second_floor");
	zm_zonemgr::add_adjacent_zone("warehouse_top_zone", "bridge_zone", "enter_warehouse_second_floor");
	zm_zonemgr::add_adjacent_zone("tp_east_zone", "wnuen_zone", "enter_tp_east");
	zm_zonemgr::add_adjacent_zone("tp_east_zone", "outside_east_zone", "enter_tp_east", 1);
	zm_zonemgr::add_zone_flags("enter_tp_east", "enter_wnuen_building");
	zm_zonemgr::add_adjacent_zone("tp_south_zone", "outside_south_zone", "enter_tp_south");
	zm_zonemgr::add_adjacent_zone("tp_west_zone", "warehouse_top_zone", "enter_tp_west");
}

/*
	Name: intro_screen
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x4030
	Size: 0x410
	Parameters: 0
	Flags: None
	Line Number: 787
*/
function intro_screen()
{
	if(1 == GetDvarInt("movie_intro"))
	{
		return;
	}
	level flag::wait_till("start_zombie_round_logic");
	wait(2);
	level.intro_hud = [];
	for(i = 0; i < 3; i++)
	{
		level.intro_hud[i] = NewHudElem();
		level.intro_hud[i].x = 0;
		level.intro_hud[i].y = 0;
		level.intro_hud[i].alignX = "left";
		level.intro_hud[i].alignY = "bottom";
		level.intro_hud[i].horzAlign = "left";
		level.intro_hud[i].vertAlign = "bottom";
		level.intro_hud[i].foreground = 1;
		if(level.splitscreen && !level.hiDef)
		{
			level.intro_hud[i].fontscale = 2.75;
		}
		else
		{
			level.intro_hud[i].fontscale = 1.75;
		}
		level.intro_hud[i].alpha = 0;
		level.intro_hud[i].color = (1, 1, 1);
		level.intro_hud[i].inUse = 0;
	}
	level.intro_hud[0].y = -110;
	level.intro_hud[1].y = -90;
	level.intro_hud[2].y = -70;
	level.intro_hud[0] setText(&"ZOMBIE_INTRO_FACTORY_LEVEL_PLACE");
	level.intro_hud[1] setText("");
	level.intro_hud[2] setText("");
	for(i = 0; i < 3; i++)
	{
		level.intro_hud[i] fadeOverTime(3.5);
		level.intro_hud[i].alpha = 1;
		wait(1.5);
	}
	wait(1.5);
	for(i = 0; i < 3; i++)
	{
		level.intro_hud[i] fadeOverTime(3.5);
		level.intro_hud[i].alpha = 0;
		wait(1.5);
	}
	for(i = 0; i < 3; i++)
	{
		level.intro_hud[i] destroy();
	}
}

/*
	Name: enemy_location_override
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x4448
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 853
*/
function enemy_location_override(zombie, enemy)
{
	AIProfile_BeginEntry("factory-enemy_location_override");
	if(isdefined(zombie.is_trapped) && zombie.is_trapped)
	{
		AIProfile_EndEntry();
		return zombie.origin;
	}
	AIProfile_EndEntry();
	return undefined;
	ERROR: Bad function call
}

/*
	Name: validate_and_set_no_target_position
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x44D8
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 876
*/
function validate_and_set_no_target_position(position)
{
	if(isdefined(position))
	{
		goal_point = GetClosestPointOnNavMesh(position.origin, 100);
		if(isdefined(goal_point))
		{
			self SetGoal(goal_point);
			self.has_exit_point = 1;
			return 1;
		}
	}
	return 0;
}

/*
	Name: no_target_override
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x4560
	Size: 0x340
	Parameters: 1
	Flags: None
	Line Number: 901
*/
function no_target_override(zombie)
{
	if(isdefined(zombie.has_exit_point))
	{
		return;
	}
	players = level.players;
	dist_zombie = 0;
	dist_player = 0;
	dest = 0;
	if(isdefined(level.zm_loc_types["dog_location"]))
	{
		locs = Array::randomize(level.zm_loc_types["dog_location"]);
		for(i = 0; i < locs.size; i++)
		{
			found_point = 0;
			foreach(player in players)
			{
				if(player laststand::player_is_in_laststand())
				{
					continue;
				}
				away = VectorNormalize(self.origin - player.origin);
				endPos = self.origin + VectorScale(away, 600);
				dist_zombie = DistanceSquared(locs[i].origin, endPos);
				dist_player = DistanceSquared(locs[i].origin, player.origin);
				if(dist_zombie < dist_player)
				{
					dest = i;
					found_point = 1;
					continue;
				}
				found_point = 0;
			}
			if(found_point)
			{
				if(zombie validate_and_set_no_target_position(locs[i]))
				{
					return;
				}
			}
		}
	}
	escape_position = zombie namespace_45003ce0::get_escape_position_in_current_zone();
	if(zombie validate_and_set_no_target_position(escape_position))
	{
		return;
	}
	escape_position = zombie namespace_45003ce0::get_escape_position();
	if(zombie validate_and_set_no_target_position(escape_position))
	{
		return;
	}
	zombie.has_exit_point = 1;
	zombie SetGoal(zombie.origin);
}

/*
	Name: script_anims_init
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x48A8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 968
*/
function script_anims_init()
{
}

/*
	Name: factory_playanim
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x48B8
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 982
*/
function factory_playanim(animName)
{
}

/*
	Name: anim_override_func
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x48D0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 996
*/
function anim_override_func()
{
}

/*
	Name: lock_additional_player_spawner
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x48E0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1010
*/
function lock_additional_player_spawner()
{
	spawn_points = struct::get_array("player_respawn_point", "targetname");
	for(i = 0; i < spawn_points.size; i++)
	{
		spawn_points[i].locked = 1;
	}
}

/*
	Name: bridge_init
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x4960
	Size: 0x240
	Parameters: 0
	Flags: None
	Line Number: 1029
*/
function bridge_init()
{
	level flag::init("bridge_down");
	bridge_audio = struct::get("bridge_audio", "targetname");
	level flag::wait_till("power_on");
	level util::clientNotify("pl1");
	level thread scene::Play("p7_fxanim_zm_factory_bridge_lft_bundle");
	level scene::Play("p7_fxanim_zm_factory_bridge_rt_bundle");
	level flag::set("bridge_down");
	wnuen_bridge_clip = GetEnt("wnuen_bridge_clip", "targetname");
	wnuen_bridge_clip connectpaths();
	wnuen_bridge_clip delete();
	warehouse_bridge_clip = GetEnt("warehouse_bridge_clip", "targetname");
	warehouse_bridge_clip connectpaths();
	warehouse_bridge_clip delete();
	wnuen_bridge = GetEnt("wnuen_bridge", "targetname");
	wnuen_bridge connectpaths();
	zm_zonemgr::connect_zones("wnuen_bridge_zone", "bridge_zone");
	zm_zonemgr::connect_zones("warehouse_top_zone", "bridge_zone");
	wait(14);
	level thread sndPA_DoVox("vox_maxis_teleporter_lost_0");
}

/*
	Name: bridge_disconnect
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x4BA8
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 1062
*/
function bridge_disconnect(a_parts)
{
	foreach(part in a_parts)
	{
		part disconnectpaths();
	}
}

/*
	Name: bridge_connect
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x4C48
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 1080
*/
function bridge_connect(a_parts)
{
	foreach(part in a_parts)
	{
		part connectpaths();
	}
}

/*
	Name: jump_from_bridge
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x4CE8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1098
*/
function jump_from_bridge()
{
	trig = GetEnt("trig_outside_south_zone", "targetname");
	trig waittill("trigger");
	zm_zonemgr::connect_zones("outside_south_zone", "bridge_zone", 1);
	zm_zonemgr::connect_zones("outside_south_zone", "wnuen_bridge_zone", 1);
}

/*
	Name: init_sounds
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x4D80
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1116
*/
function init_sounds()
{
	zm_utility::add_sound("break_stone", "evt_break_stone");
	zm_utility::add_sound("gate_door", "zmb_gate_slide_open");
	zm_utility::add_sound("heavy_door", "zmb_heavy_door_open");
	zm_utility::add_sound("zmb_heavy_door_open", "zmb_heavy_door_open");
}

/*
	Name: factory_ray_gun_weighting_func
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x4E10
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 1134
*/
function factory_ray_gun_weighting_func()
{
	if(level.chest_moves > 0)
	{
		num_to_add = 1;
		if(isdefined(level.pulls_since_last_ray_gun))
		{
			if(level.pulls_since_last_ray_gun > 11)
			{
				num_to_add = num_to_add + Int(level.zombie_include_weapons.size * 0.1);
			}
			else if(level.pulls_since_last_ray_gun > 7)
			{
				num_to_add = num_to_add + Int(0.05 * level.zombie_include_weapons.size);
			}
		}
		return num_to_add;
	}
	return 0;
}

/*
	Name: factory_cymbal_monkey_weighting_func
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x4EE0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 1165
*/
function factory_cymbal_monkey_weighting_func()
{
	players = GetPlayers();
	count = 0;
	for(i = 0; i < players.size; i++)
	{
		if(players[i] zm_weapons::has_weapon_or_upgrade("cymbal_monkey_zm"))
		{
			count++;
		}
	}
	if(count > 0)
	{
		return 1;
	}
	if(level.round_number < 10)
	{
		return 3;
	}
	return 5;
}

/*
	Name: magic_box_init
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x4FA0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1197
*/
function magic_box_init()
{
	level.open_chest_location = [];
	level.open_chest_location[0] = "chest1";
	level.open_chest_location[1] = "chest2";
	level.open_chest_location[2] = "chest3";
	level.open_chest_location[3] = "chest4";
	level.open_chest_location[4] = "chest5";
	level.open_chest_location[5] = "start_chest";
}

/*
	Name: function_f82121a3
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x5048
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 1218
*/
function function_f82121a3(trig)
{
	/#
		trig endon("trigger");
		level flag::wait_till("Dev Block strings are not supported");
		trig notify("trigger");
	#/
}

/*
	Name: power_electric_switch
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x50A0
	Size: 0x3E0
	Parameters: 0
	Flags: None
	Line Number: 1237
*/
function power_electric_switch()
{
	trig = GetEnt("use_power_switch", "targetname");
	trig setHintString(&"ZOMBIE_ELECTRIC_SWITCH");
	trig setcursorhint("HINT_NOICON");
	cheat = 0;
	/#
		if(GetDvarInt("Dev Block strings are not supported") >= 3)
		{
			wait(5);
			cheat = 1;
		}
	#/
	User = undefined;
	if(cheat != 1)
	{
		level thread function_f82121a3(trig);
		trig waittill("trigger", User);
	}
	level thread scene::Play("power_switch", "targetname");
	level flag::set("power_on");
	util::wait_network_frame();
	level notify("sleight_on", isdefined(User));
	util::wait_network_frame();
	level notify("revive_on");
	util::wait_network_frame();
	level notify("doubletap_on");
	util::wait_network_frame();
	level notify("juggernog_on");
	util::wait_network_frame();
	level notify("Pack_A_Punch_on");
	util::wait_network_frame();
	level notify("specialty_armorvest_power_on");
	util::wait_network_frame();
	level notify("specialty_rof_power_on");
	util::wait_network_frame();
	level notify("specialty_quickrevive_power_on");
	util::wait_network_frame();
	level notify("specialty_fastreload_power_on");
	util::wait_network_frame();
	level util::set_lighting_state(0);
	util::clientNotify("ZPO");
	util::wait_network_frame();
	trig delete();
	wait(1);
	s_switch = struct::get("power_switch_fx", "targetname");
	FORWARD = AnglesToForward(s_switch.origin);
	playFX(level._effect["switch_sparks"], s_switch.origin, FORWARD);
	zm_zonemgr::connect_zones("outside_east_zone", "outside_south_zone");
	zm_zonemgr::connect_zones("outside_west_zone", "outside_south_zone", 1);
	level util::delay(19, undefined, &zm_audio::sndmusicsystem_playstate, "power_on");
	return;
	~FORWARD;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: check_for_change
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x5488
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1303
*/
function check_for_change()
{
	while(1)
	{
		self waittill("trigger", player);
		if(player GetStance() == "prone")
		{
			player zm_score::add_to_player_score(100);
			zm_utility::play_sound_at_pos("purchase", player.origin);
			break;
		}
		wait(0.1);
	}
}

/*
	Name: extra_events
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x5530
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1328
*/
function extra_events()
{
	self UseTriggerRequireLookAt();
	self setcursorhint("HINT_NOICON");
	self waittill("trigger");
	targ = GetEnt(self.target, "targetname");
	if(isdefined(targ))
	{
		targ MoveZ(-10, 5);
		return;
	}
}

/*
	Name: flytrap
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x55E0
	Size: 0x2F8
	Parameters: 0
	Flags: None
	Line Number: 1351
*/
function flytrap()
{
	level flag::init("hide_and_seek");
	level flag::init("flytrap");
	level.flytrap_counter = 0;
	level thread hide_and_seek_target("ee_exp_monkey");
	util::wait_network_frame();
	level thread hide_and_seek_target("ee_bowie_bear");
	util::wait_network_frame();
	level thread hide_and_seek_target("ee_perk_bear");
	util::wait_network_frame();
	trig_control_panel = GetEnt("trig_ee_flytrap", "targetname");
	upgrade_hit = 0;
	while(!upgrade_hit)
	{
		trig_control_panel waittill("damage", amount, inflictor, direction, point, type, tagName, modelName, partName, weapon);
		if(zm_weapons::is_weapon_upgraded(weapon))
		{
			upgrade_hit = 1;
		}
	}
	level flag::set("flytrap");
	thread zm_utility::play_sound_2d("vox_maxis_flytrap_1_0");
	var_53a95046 = soundgetplaybacktime("vox_maxis_flytrap_1_0");
	thread namespace_cc012897::Send("vox_maxis_flytrap_1_0", "all", var_53a95046);
	scene::Play("p7_fxanim_zm_factory_fly_trap_bundle");
	wait(9);
	level flag::set("hide_and_seek");
	level flag::wait_till("ee_exp_monkey");
	level flag::wait_till("ee_bowie_bear");
	level flag::wait_till("ee_perk_bear");
	level thread function_d8362620();
}

/*
	Name: hide_and_seek_target
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x58E0
	Size: 0x220
	Parameters: 1
	Flags: None
	Line Number: 1395
*/
function hide_and_seek_target(target_name)
{
	level flag::init(target_name);
	obj_array = GetEntArray(target_name, "targetname");
	for(i = 0; i < obj_array.size; i++)
	{
		obj_array[i] Hide();
	}
	trig = GetEnt("trig_" + target_name, "targetname");
	trig TriggerEnable(0);
	level flag::wait_till("hide_and_seek");
	for(i = 0; i < obj_array.size; i++)
	{
		obj_array[i] show();
	}
	trig TriggerEnable(1);
	trig waittill("trigger");
	level.flytrap_counter = level.flytrap_counter + 1;
	thread flytrap_samantha_vox();
	trig playsound("zmb_flytrap_target_" + level.flytrap_counter);
	for(i = 0; i < obj_array.size; i++)
	{
		obj_array[i] Hide();
	}
	level flag::set(target_name);
}

/*
	Name: phono_egg_init
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x5B08
	Size: 0x158
	Parameters: 2
	Flags: None
	Line Number: 1432
*/
function phono_egg_init(trigger_name, origin_name)
{
	if(!isdefined(level.phono_counter))
	{
		level.phono_counter = 0;
	}
	players = GetPlayers();
	phono_trig = GetEnt(trigger_name, "targetname");
	phono_origin = GetEnt(origin_name, "targetname");
	if(!isdefined(phono_trig) || !isdefined(phono_origin))
	{
		return;
	}
	phono_trig UseTriggerRequireLookAt();
	phono_trig setcursorhint("HINT_NOICON");
	for(i = 0; i < players.size; i++)
	{
		phono_trig waittill("trigger", players);
		level.phono_counter = level.phono_counter + 1;
		phono_origin play_phono_egg();
	}
}

/*
	Name: play_phono_egg
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x5C68
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1465
*/
function play_phono_egg()
{
	if(!isdefined(level.phono_counter))
	{
		level.phono_counter = 0;
	}
	if(level.phono_counter == 1)
	{
		self playsound("evt_phono_one");
	}
	if(level.phono_counter == 2)
	{
		self playsound("evt_phono_two");
	}
	if(level.phono_counter == 3)
	{
		self playsound("evt_phono_three");
		return;
	}
	continue;
}

/*
	Name: radio_egg_init
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x5D20
	Size: 0x190
	Parameters: 2
	Flags: None
	Line Number: 1497
*/
function radio_egg_init(trigger_name, origin_name)
{
	players = GetPlayers();
	radio_trig = GetEnt(trigger_name, "targetname");
	radio_origin = GetEnt(origin_name, "targetname");
	if(!isdefined(radio_trig) || !isdefined(radio_origin))
	{
		return;
	}
	radio_trig UseTriggerRequireLookAt();
	radio_origin PlayLoopSound("amb_radio_static");
	for(i = 0; i < players.size; i++)
	{
		radio_trig waittill("trigger", players);
		radio_origin StopLoopSound(0.1);
		radio_origin playsound(trigger_name);
		var_53a95046 = soundgetplaybacktime(trigger_name);
		thread namespace_cc012897::Send(trigger_name, "all", var_53a95046);
	}
}

/*
	Name: play_music_easter_egg
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x5EB8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 1528
*/
function play_music_easter_egg(player)
{
	level.music_override = 1;
	wait(4);
	if(isdefined(player))
	{
		player zm_audio::create_and_play_dialog("eggs", "music_activate");
	}
	wait(236);
	level.music_override = 0;
}

/*
	Name: meteor_egg
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x5F20
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 1550
*/
function meteor_egg(trigger_name)
{
	meteor_trig = GetEnt(trigger_name, "targetname");
	meteor_trig UseTriggerRequireLookAt();
	meteor_trig setcursorhint("HINT_NOICON");
	meteor_trig PlayLoopSound("zmb_meteor_loop");
	meteor_trig waittill("trigger", player);
	meteor_trig StopLoopSound(1);
	player playsound("zmb_meteor_activate");
	level.meteor_counter = level.meteor_counter + 1;
	if(level.meteor_counter == 3)
	{
		level thread play_music_easter_egg(player);
	}
}

/*
	Name: flytrap_samantha_vox
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x6050
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 1576
*/
function flytrap_samantha_vox()
{
	if(!isdefined(level.flytrap_counter))
	{
		level.flytrap_counter = 0;
	}
	if(level.flytrap_counter == 1)
	{
		thread zm_utility::play_sound_2d("vox_maxis_flytrap_2_0");
		var_53a95046 = soundgetplaybacktime("vox_maxis_flytrap_2_0");
		thread namespace_cc012897::Send("vox_maxis_flytrap_2_0", "all", var_53a95046);
	}
	if(level.flytrap_counter == 2)
	{
		thread zm_utility::play_sound_2d("vox_maxis_flytrap_3_0");
		var_53a95046 = soundgetplaybacktime("vox_maxis_flytrap_3_0");
		thread namespace_cc012897::Send("vox_maxis_flytrap_3_0", "all", var_53a95046);
	}
	if(level.flytrap_counter == 3)
	{
		thread zm_utility::play_sound_2d("vox_maxis_flytrap_4_0");
		var_53a95046 = soundgetplaybacktime("vox_maxis_flytrap_4_0");
		thread namespace_cc012897::Send("vox_maxis_flytrap_4_0", "all", var_53a95046);
		wait(9);
		thread zm_utility::play_sound_2d("vox_maxis_flytrap_4_1");
		var_53a95046 = soundgetplaybacktime("vox_maxis_flytrap_4_1");
		thread namespace_cc012897::Send("vox_maxis_flytrap_4_1", "all", var_53a95046);
		return;
	}
	wait(0.05);
}

/*
	Name: factory_exit_level
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x6220
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1618
*/
function factory_exit_level()
{
	zombies = GetAIArray(level.zombie_team);
	for(i = 0; i < zombies.size; i++)
	{
		zombies[i] thread factory_find_exit_point();
	}
}

/*
	Name: factory_find_exit_point
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x6298
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 1637
*/
function factory_find_exit_point()
{
	self endon("death");
	player = GetPlayers()[0];
	dist_zombie = 0;
	dist_player = 0;
	dest = 0;
	away = VectorNormalize(self.origin - player.origin);
	endPos = self.origin + VectorScale(away, 600);
	locs = Array::randomize(level.zm_loc_types["dog_location"]);
	for(i = 0; i < locs.size; i++)
	{
		dist_zombie = DistanceSquared(locs[i].origin, endPos);
		dist_player = DistanceSquared(locs[i].origin, player.origin);
		if(dist_zombie < dist_player)
		{
			dest = i;
			break;
		}
	}
	self notify("stop_find_flesh");
	self notify("zombie_acquire_enemy");
	self SetGoal(locs[dest].origin);
	while(1)
	{
		if(!level flag::get("wait_and_revive"))
		{
			break;
		}
		util::wait_network_frame();
	}
}

/*
	Name: powerup_special_drop_override
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x64B8
	Size: 0x320
	Parameters: 0
	Flags: None
	Line Number: 1680
*/
function powerup_special_drop_override()
{
	if(level.round_number <= 10)
	{
		powerup = zm_powerups::get_valid_powerup();
	}
	else
	{
		powerup = level.zombie_special_drop_array[RandomInt(level.zombie_special_drop_array.size)];
		if(level.round_number > 15 && RandomInt(100) < level.round_number - 15 * 5)
		{
			powerup = "nothing";
		}
	}
	switch(powerup)
	{
		case "full_ammo":
		{
			if(level.round_number > 10 && RandomInt(100) < level.round_number - 10 * 5)
			{
				powerup = level.zombie_powerup_array[RandomInt(level.zombie_powerup_array.size)];
				break;
			}
		}
		case "dog":
		{
			if(level.round_number >= 15)
			{
				dog_spawners = GetEntArray("special_dog_spawner", "targetname");
				thread zm_utility::play_sound_2d("vox_sam_nospawn");
				powerup = undefined;
			}
			else
			{
				powerup = zm_powerups::get_valid_powerup();
				break;
			}
		}
		case "free_perk":
		case "nothing":
		{
			if(isdefined(level._zombiemode_special_drop_setup))
			{
				is_powerup = [[level._zombiemode_special_drop_setup]](powerup);
			}
			else
			{
				playFX(level._effect["lightning_dog_spawn"], self.origin);
				playsoundatposition("zmb_hellhound_prespawn", self.origin);
				wait(1.5);
				playsoundatposition("zmb_hellhound_bolt", self.origin);
				Earthquake(0.5, 0.75, self.origin, 1000);
				playsoundatposition("zmb_hellhound_spawn", self.origin);
				wait(1);
				thread zm_utility::play_sound_2d("vox_sam_nospawn");
				self delete();
			}
			powerup = undefined;
			break;
		}
	}
	return powerup;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_81abed86
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x67E0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1755
*/
function function_81abed86()
{
	if(isdefined(self.b_teleporting) && self.b_teleporting)
	{
		return 0;
	}
	return 1;
}

/*
	Name: sndFunctions
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x6810
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1774
*/
function sndFunctions()
{
	level thread setupMusic();
	level thread sndFirstDoor();
	level thread sndPASetup();
	level thread sndRadioSetup();
	level thread sndConversations();
	level.sndWeaponPickupOverride = Array("hero_annihilator");
}

/*
	Name: sndConversations
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x68B8
	Size: 0x388
	Parameters: 0
	Flags: None
	Line Number: 1794
*/
function sndConversations()
{
	level flag::wait_till("initial_blackscreen_passed");
	level zm_audio::sndConversation_Init("round1start");
	level zm_audio::sndConversation_AddLine("round1start", "round1_start_0", 4, 2);
	level zm_audio::sndConversation_AddLine("round1start", "round1_start_0", 2);
	level zm_audio::sndConversation_AddLine("round1start", "round1_start_1", 4, 2);
	level zm_audio::sndConversation_AddLine("round1start", "round1_start_1", 2);
	level zm_audio::sndConversation_Init("round1during", "end_of_round");
	level zm_audio::sndConversation_AddLine("round1during", "round1_during_0", 1);
	level zm_audio::sndConversation_AddLine("round1during", "round1_during_0", 3);
	level zm_audio::sndConversation_AddLine("round1during", "round1_during_0", 0);
	level zm_audio::sndConversation_AddLine("round1during", "round1_during_0", 2);
	level zm_audio::sndConversation_Init("round1end");
	level zm_audio::sndConversation_AddLine("round1end", "round1_end_0", 4, 2);
	level zm_audio::sndConversation_AddLine("round1end", "round1_end_0", 2);
	level zm_audio::sndConversation_Init("round2during", "end_of_round");
	level zm_audio::sndConversation_AddLine("round2during", "round2_during_0", 0);
	level zm_audio::sndConversation_AddLine("round2during", "round2_during_0", 3);
	level zm_audio::sndConversation_AddLine("round2during", "round2_during_0", 1);
	level zm_audio::sndConversation_AddLine("round2during", "round2_during_0", 2);
	if(level.players.size >= 2)
	{
		level thread sndConvo1();
		level thread sndConvo2();
		level thread sndConvo3();
		level thread sndConvo4();
	}
	else
	{
		level thread sndFieldReport1();
	}
}

/*
	Name: sndConvo1
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x6C48
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 1838
*/
function sndConvo1()
{
	wait(randomIntRange(2, 5));
	level zm_audio::sndConversation_Play("round1start");
}

/*
	Name: sndConvo2
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x6C90
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1854
*/
function sndConvo2()
{
	level waittill("sndConversationDone");
	wait(randomIntRange(20, 30));
	level zm_audio::sndConversation_Play("round1during");
}

/*
	Name: sndConvo3
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x6CE8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1871
*/
function sndConvo3()
{
	level waittill("end_of_round");
	wait(randomIntRange(4, 7));
	level zm_audio::sndConversation_Play("round1end");
}

/*
	Name: sndConvo4
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x6D40
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1888
*/
function sndConvo4()
{
	while(1)
	{
		level waittill("start_of_round");
		if(!(isdefined(level.first_round) && level.first_round))
		{
			break;
		}
	}
	wait(randomIntRange(45, 60));
	level zm_audio::sndConversation_Play("round2during");
}

/*
	Name: sndFieldReport1
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x6DC0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 1912
*/
function sndFieldReport1()
{
	wait(randomIntRange(7, 10));
	while(isdefined(level.players[0].isSpeaking) && level.players[0].isSpeaking)
	{
		wait(0.5);
	}
	level.sndVoxOverride = 1;
	doLine(level.players[0], "fieldreport_start_0");
	if(isdefined(getSpecificCharacter(2)))
	{
		doLine(level.players[0], "fieldreport_start_1");
	}
	level.sndVoxOverride = 0;
	level thread sndFieldReport2();
}

/*
	Name: sndFieldReport2
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x6EC0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 1939
*/
function sndFieldReport2()
{
	level waittill("end_of_round");
	wait(randomIntRange(1, 3));
	while(isdefined(level.players[0].isSpeaking) && level.players[0].isSpeaking)
	{
		wait(0.5);
	}
	level.sndVoxOverride = 1;
	doLine(level.players[0], "fieldreport_round1_0");
	level.sndVoxOverride = 0;
	level thread sndFieldReport3();
}

/*
	Name: sndFieldReport3
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x6F90
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1963
*/
function sndFieldReport3()
{
	level waittill("end_of_round");
	wait(randomIntRange(1, 3));
	while(isdefined(level.players[0].isSpeaking) && level.players[0].isSpeaking)
	{
		wait(0.5);
	}
	level.sndVoxOverride = 1;
	doLine(level.players[0], "fieldreport_round2_0");
	if(isdefined(getSpecificCharacter(2)))
	{
		doLine(level.players[0], "fieldreport_round2_1");
	}
	level.sndVoxOverride = 0;
}

/*
	Name: doLine
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x7088
	Size: 0x160
	Parameters: 2
	Flags: None
	Line Number: 1990
*/
function doLine(guy, alias)
{
	if(isdefined(guy))
	{
		guy clientfield::set_to_player("isspeaking", 1);
		guy PlaySoundOnTag("vox_plr_" + guy.characterindex + "_" + alias, "J_Head");
		var_53a95046 = soundgetplaybacktime("vox_plr_" + guy.characterindex + "_" + alias);
		thread namespace_cc012897::Send("vox_plr_" + guy.characterindex + "_" + alias, "all", var_53a95046);
		waitPlayBackTime("vox_plr_" + guy.characterindex + "_" + alias);
		guy clientfield::set_to_player("isspeaking", 0);
	}
}

/*
	Name: waitPlayBackTime
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x71F0
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 2013
*/
function waitPlayBackTime(alias)
{
	playbacktime = soundgetplaybacktime(alias);
	if(!isdefined(playbacktime))
	{
		playbacktime = 1;
	}
	if(playbacktime >= 0)
	{
		playbacktime = playbacktime * 0.001;
	}
	else
	{
		playbacktime = 1;
	}
	wait(playbacktime);
}

/*
	Name: getRandomNotRichtofen
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x7270
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2041
*/
function getRandomNotRichtofen()
{
	Array = level.players;
	Array::randomize(Array);
	foreach(guy in Array)
	{
		if(guy.characterindex != 2)
		{
			return guy;
		}
	}
	return undefined;
}

/*
	Name: getSpecificCharacter
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x7338
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 2065
*/
function getSpecificCharacter(charIndex)
{
	foreach(guy in level.players)
	{
		if(guy.characterindex == charIndex)
		{
			return guy;
		}
	}
	return undefined;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: isAnyoneTalking
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x73E0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 2088
*/
function isAnyoneTalking()
{
	foreach(player in level.players)
	{
		if(isdefined(player.isSpeaking) && player.isSpeaking)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: sndRadioSetup
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x7488
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 2110
*/
function sndRadioSetup()
{
	level thread zm_audio::sndRadioSetup("vox_maxis_maxis_radio", undefined, (582, -2167, 286), (629, -1257, 259), (-594, -1359, 108), (-159, 437, 18), (1219, 136, 90));
	level thread function_de1db1bb("vox_maxis_player_radio", (966, 805, 124), (-1197, -1466, 215), (-94, -2324, 175));
}

/*
	Name: function_de1db1bb
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x7548
	Size: 0x2E0
	Parameters: 4
	Flags: None
	Line Number: 2126
*/
function function_de1db1bb(alias_prefix, origin1, origin2, origin3)
{
	radio = spawnstruct();
	radio.counter = 1;
	radio.alias_prefix = alias_prefix;
	radio.isplaying = 0;
	radio.Array = Array();
	if(!isdefined(radio.Array))
	{
		radio.Array = [];
	}
	else if(!IsArray(radio.Array))
	{
		radio.Array = Array(radio.Array);
	}
	radio.Array[radio.Array.size] = origin1;
	if(!isdefined(radio.Array))
	{
		radio.Array = [];
	}
	else if(!IsArray(radio.Array))
	{
		radio.Array = Array(radio.Array);
	}
	radio.Array[radio.Array.size] = origin2;
	if(!isdefined(radio.Array))
	{
		radio.Array = [];
	}
	else if(!IsArray(radio.Array))
	{
		radio.Array = Array(radio.Array);
	}
	radio.Array[radio.Array.size] = origin3;
	if(radio.Array.size > 0)
	{
		for(i = 0; i < radio.Array.size; i++)
		{
			level thread sndRadioWait(radio.Array[i], radio, i + 1);
		}
		return;
	}
	radio.Array[radio.Array.size]++;
}

/*
	Name: sndRadioWait
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x7830
	Size: 0x308
	Parameters: 3
	Flags: None
	Line Number: 2181
*/
function sndRadioWait(origin, radio, num)
{
	temp_ent = spawn("script_origin", origin);
	temp_ent thread zm_audio::secretUse("sndRadioHit", VectorScale((1, 0, 0), 255), &zm_audio::sndRadio_Override, radio);
	temp_ent waittill("hash_678c47ee", player);
	if(isdefined(level.sndRadioA) && level.sndRadioA == player)
	{
		if(num == 1)
		{
			alias = "vox_maxis_player_radio1a";
		}
		if(num == 2)
		{
			alias = "vox_maxis_player_radio2a";
		}
		if(num == 3)
		{
			alias = "vox_maxis_player_radio3a";
		}
	}
	else if(num == 1)
	{
		alias = "vox_demp_player_radio1b";
	}
	if(num == 2)
	{
		alias = "vox_niko_player_radio2b";
	}
	if(num == 3)
	{
		alias = "vox_take_player_radio3b";
	}
	var_48a5e056 = num;
	var_aae31f82 = alias;
	var_c3d43d75 = zm_spawner::get_number_variants(var_aae31f82);
	if(var_c3d43d75 > 0)
	{
		radio.isplaying = 1;
		for(i = 0; i < var_c3d43d75; i++)
		{
			temp_ent playsound(var_aae31f82 + "_" + i);
			playbacktime = soundgetplaybacktime(var_aae31f82 + "_" + i);
			thread namespace_cc012897::Send(var_aae31f82 + "_" + i, "all", playbacktime);
			if(!isdefined(playbacktime))
			{
				playbacktime = 1;
			}
			if(playbacktime >= 0)
			{
				playbacktime = playbacktime * 0.001;
			}
			else
			{
				playbacktime = 1;
			}
			wait(playbacktime);
		}
	}
	radio.counter++;
	radio.isplaying = 0;
	temp_ent delete();
	return;
}

/*
	Name: function_6ea54e62
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x7B40
	Size: 0x298
	Parameters: 2
	Flags: None
	Line Number: 2255
*/
function function_6ea54e62(grenade, model)
{
	grenade endon("death");
	grenade endon("explode");
	if(grenade.weapon.name === "cymbal_monkey")
	{
		if(grenade istouching(level.monk_scream_trig))
		{
			grenade.monk_scream_vox = 1;
			grenade playsound("zmb_vox_cymmonkey_scream");
			return;
		}
		var_6cfabdcd = GetEntArray("sndTransportTrig", "targetname");
		foreach(trig in var_6cfabdcd)
		{
			if(grenade istouching(trig))
			{
				grenade.monk_scream_vox = 1;
				if(isdefined(level.cymbal_monkey_dual_view) && level.cymbal_monkey_dual_view)
				{
					grenade playsoundtoteam("zmb_monkey_song_reverse", "allies");
				}
				else
				{
					grenade playsound("zmb_cymmonkey_song_reverse");
				}
				wait(6.5);
				grenade playsound("zmb_vox_cymmonkey_explode_reverse");
				return;
			}
		}
		if(!(isdefined(grenade.monk_scream_vox) && grenade.monk_scream_vox))
		{
			if(isdefined(level.cymbal_monkey_dual_view) && level.cymbal_monkey_dual_view)
			{
				grenade playsoundtoteam("zmb_monkey_song", "allies");
			}
			else
			{
				grenade playsound("zmb_cymmonkey_song");
			}
			wait(6.5);
			grenade playsound("zmb_vox_cymmonkey_explode");
		}
	}
}

/*
	Name: setupMusic
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x7DE0
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 2312
*/
function setupMusic()
{
	zm_audio::musicState_Create("round_start", 3, "roundstart1", "roundstart2", "roundstart3", "roundstart4");
	zm_audio::musicState_Create("round_start_short", 3, "roundstart_short1", "roundstart_short2", "roundstart_short3", "roundstart_short4");
	zm_audio::musicState_Create("round_start_first", 3, "roundstart_first");
	zm_audio::musicState_Create("round_end", 3, "roundend1");
	zm_audio::musicState_Create("game_over", 5, "gameover");
	zm_audio::musicState_Create("dog_start", 3, "dogstart1");
	zm_audio::musicState_Create("dog_end", 3, "dogend1");
	zm_audio::musicState_Create("timer", 3, "timer");
	zm_audio::musicState_Create("power_on", 2, "poweron");
	zm_audio::musicState_Create("musicEasterEgg", 4, "egg");
	zm_audio::sndMusicSystem_EESetup("musicEasterEgg", (900, -586, 151), (987, -873, 122), (-1340, -483, 255));
	level thread function_f8db7034();
	return;
}

/*
	Name: function_f8db7034
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x8008
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 2339
*/
function function_f8db7034()
{
	level waittill("hash_a1b1dadb");
	level thread audio::unlockfrontendmusic("mus_beauty_the_giant_mix_intro");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: sndFirstDoor
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x8040
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 2357
*/
function sndFirstDoor()
{
	level waittill("sndDoorOpening");
	level thread zm_audio::sndmusicsystem_playstate("first_door");
}

/*
	Name: sndPASetup
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x8078
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 2373
*/
function sndPASetup()
{
	level.paTalking = 0;
	level.paArray = Array();
	Array = struct::get_array("pa_system", "targetname");
	foreach(pa in Array)
	{
		ent = spawn("script_origin", pa.origin);
		if(!isdefined(level.paArray))
		{
			level.paArray = [];
		}
		else if(!IsArray(level.paArray))
		{
			level.paArray = Array(level.paArray);
		}
		level.paArray[level.paArray.size] = ent;
	}
}

/*
	Name: sndPA_DoVox
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x81E0
	Size: 0x108
	Parameters: 3
	Flags: None
	Line Number: 2403
*/
function sndPA_DoVox(alias, delay, nowait)
{
	if(!isdefined(nowait))
	{
		nowait = 0;
	}
	if(isdefined(delay))
	{
		wait(delay);
	}
	if(!(isdefined(level.paTalking) && level.paTalking))
	{
		level.paTalking = 1;
		level thread sndPA_playvox(alias);
		playbacktime = soundgetplaybacktime(alias);
		if(!isdefined(playbacktime) || playbacktime <= 2)
		{
			waittime = 1;
		}
		else
		{
			waittime = playbacktime * 0.001;
		}
		if(!nowait)
		{
			wait(waittime - 0.9);
		}
		level.paTalking = 0;
	}
}

/*
	Name: sndPA_playvox
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x82F0
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 2444
*/
function sndPA_playvox(alias)
{
	Array::randomize(level.paArray);
	foreach(pa in level.paArray)
	{
		pa playsound(alias);
		var_53a95046 = soundgetplaybacktime(alias);
		thread namespace_cc012897::Send(alias, "all", var_53a95046);
		wait(0.05);
	}
}

/*
	Name: sndPA_Traps
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x8400
	Size: 0x180
	Parameters: 2
	Flags: None
	Line Number: 2466
*/
function sndPA_Traps(trap, stage)
{
	if(isdefined(trap))
	{
		if(stage == 1)
		{
			switch(trap.target)
			{
				case "trap_b":
				{
					level thread sndPA_DoVox("vox_maxis_trap_warehouse_inuse_0", 2);
					break;
				}
				case "trap_a":
				{
					level thread sndPA_DoVox("vox_maxis_trap_lab_inuse_0", 2);
					break;
				}
				case "trap_c":
				{
					level thread sndPA_DoVox("vox_maxis_trap_bridge_inuse_0", 2);
					break;
				}
			}
		}
		else
		{
			switch(trap.target)
			{
				case "trap_b":
				{
					level thread sndPA_DoVox("vox_maxis_trap_warehouse_active_0", 4);
					break;
				}
				case "trap_a":
				{
					level thread sndPA_DoVox("vox_maxis_trap_lab_active_0", 4);
					break;
				}
				case "trap_c":
				{
					level thread sndPA_DoVox("vox_maxis_trap_bridge_active_0", 4);
					break;
				}
			}
		}
	}
}

/*
	Name: function_33aa4940
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x8588
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 2525
*/
function function_33aa4940()
{
	var_88369d66 = 0;
	if(level.round_number > 30)
	{
		if(RandomFloat(100) < 4)
		{
			var_88369d66 = 1;
		}
	}
	else if(level.round_number > 25)
	{
		if(RandomFloat(100) < 3)
		{
			var_88369d66 = 1;
		}
	}
	else if(level.round_number > 20)
	{
		if(RandomFloat(100) < 2)
		{
			var_88369d66 = 1;
		}
	}
	else if(level.round_number > 15)
	{
		if(RandomFloat(100) < 1)
		{
			var_88369d66 = 1;
		}
	}
	if(var_88369d66)
	{
		zm_ai_dogs::special_dog_spawn(1);
		level.zombie_total--;
	}
	return var_88369d66;
}

/*
	Name: factory_custom_spawn_location_selection
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x86C8
	Size: 0x220
	Parameters: 1
	Flags: None
	Line Number: 2574
*/
function factory_custom_spawn_location_selection(a_spots)
{
	if(level.zombie_respawns > 0)
	{
		if(!isdefined(level.n_player_spawn_selection_index))
		{
			level.n_player_spawn_selection_index = 0;
		}
		a_players = GetPlayers();
		level.n_player_spawn_selection_index++;
		if(level.n_player_spawn_selection_index >= a_players.size)
		{
			level.n_player_spawn_selection_index = 0;
		}
		e_player = a_players[level.n_player_spawn_selection_index];
		ArraySortClosest(a_spots, e_player.origin);
		a_candidates = [];
		v_player_dir = AnglesToForward(e_player.angles);
		for(i = 0; i < a_spots.size; i++)
		{
			v_dir = a_spots[i].origin - e_player.origin;
			dp = VectorDot(v_player_dir, v_dir);
			if(dp >= 0)
			{
				a_candidates[a_candidates.size] = a_spots[i];
				if(a_candidates.size > 10)
				{
					break;
				}
			}
		}
		if(a_candidates.size)
		{
			s_spot = Array::random(a_candidates);
		}
		else
		{
			s_spot = Array::random(a_spots);
		}
	}
	else
	{
		s_spot = Array::random(a_spots);
	}
	return s_spot;
}

/*
	Name: factory_closest_player
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x88F0
	Size: 0x120
	Parameters: 2
	Flags: Private
	Line Number: 2631
*/
function private factory_closest_player(origin, players)
{
	closest = players[0];
	closest_dist = self zm_utility::approximate_path_dist(closest);
	if(!isdefined(closest_dist))
	{
		closest = undefined;
	}
	for(index = 1; index < players.size; index++)
	{
		dist = self zm_utility::approximate_path_dist(players[index]);
		if(isdefined(dist) && dist < closest_dist)
		{
			closest = players[index];
			closest_dist = dist;
		}
	}
	if(players.size > 1 && isdefined(closest))
	{
		self zm_utility::approximate_path_dist(closest);
	}
	return closest;
}

/*
	Name: fx_overrides
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x8A18
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 2665
*/
function fx_overrides()
{
	level._effect["jugger_light"] = "zombie/fx_perk_juggernaut_factory_zmb";
	level._effect["revive_light"] = "zombie/fx_perk_quick_revive_factory_zmb";
	level._effect["sleight_light"] = "zombie/fx_perk_sleight_of_hand_factory_zmb";
	level._effect["doubletap2_light"] = "zombie/fx_perk_doubletap2_factory_zmb";
	level._effect["deadshot_light"] = "zombie/fx_perk_daiquiri_factory_zmb";
	level._effect["marathon_light"] = "zombie/fx_perk_stamin_up_factory_zmb";
	level._effect["additionalprimaryweapon_light"] = "zombie/fx_perk_mule_kick_factory_zmb";
}

/*
	Name: ciphers
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x8AE8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 2686
*/
function ciphers()
{
	mdl_brick = GetEnt("cipher_brick_main", "script_noteworthy");
	mdl_brick thread function_b730f44e();
}

/*
	Name: function_b730f44e
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x8B38
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 2702
*/
function function_b730f44e()
{
	self create_unitrigger();
	self waittill("trigger_activated");
	a_mdl_bricks = GetEntArray("cipher_bricks", "targetname");
	foreach(mdl_brick in a_mdl_bricks)
	{
		mdl_brick MoveZ(375, 2);
	}
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
	wait(2);
	foreach(mdl_brick in a_mdl_bricks)
	{
		mdl_brick delete();
	}
	return;
	a_mdl_bricks++;
}

/*
	Name: create_unitrigger
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x8CC8
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 2731
*/
function create_unitrigger(str_hint)
{
	s_unitrigger = spawnstruct();
	s_unitrigger.origin = self.origin;
	s_unitrigger.angles = self.angles;
	s_unitrigger.script_unitrigger_type = "unitrigger_radius_use";
	s_unitrigger.cursor_hint = "HINT_NOICON";
	s_unitrigger.str_hint = str_hint;
	s_unitrigger.related_parent = self;
	s_unitrigger.radius = 64;
	self.s_unitrigger = s_unitrigger;
	zm_unitrigger::register_static_unitrigger(s_unitrigger, &unitrigger_logic);
}

/*
	Name: unitrigger_logic
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x8DB0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 2755
*/
function unitrigger_logic()
{
	self endon("death");
	while(1)
	{
		self waittill("trigger", player);
		if(player zm_utility::in_revive_trigger())
		{
			continue;
		}
		if(player.IS_DRINKING > 0)
		{
			continue;
		}
		if(!zm_utility::is_player_valid(player))
		{
			continue;
		}
		self.stub.related_parent notify("trigger_activated", player);
	}
	return;
}

/*
	Name: function_5d386c43
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x8E60
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 2788
*/
function function_5d386c43()
{
	level flag::init("snow_ee_completed");
	level flag::init("console_one_completed");
	level flag::init("console_two_completed");
	level flag::init("console_three_completed");
	level flag::wait_till("power_on");
	level clientfield::set("console_start", 1);
	level flag::wait_till_all(Array("console_one_completed", "console_two_completed", "console_three_completed"));
	exploder::exploder("teleporter_controller_main_light");
	s_console = struct::get("snowpile_console");
	s_console create_unitrigger();
	s_console waittill("trigger_activated");
	playsoundatposition("zmb_snowmelt_button_press", s_console.origin);
	zm_unitrigger::unregister_unitrigger(s_console.s_unitrigger);
	level util::clientNotify("sndSB");
	level thread function_428d50ed();
	exploder::exploder("fx_expl_robothead_laser");
	wait(0.5);
	scene::Play("p7_fxanim_zm_factory_snowbank_bundle");
	wait(0.5);
	exploder::stop_exploder("fx_expl_robothead_laser");
	var_935a64f = GetEnt("snowbank_clip", "targetname");
	var_935a64f delete();
}

/*
	Name: function_428d50ed
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x90E0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 2824
*/
function function_428d50ed()
{
	level flag::set("snow_ee_completed");
	exploder::stop_exploder("teleporter_controller_main_light");
	level clientfield::set("console_blue", 0);
	level clientfield::set("console_green", 0);
	level clientfield::set("console_red", 0);
}

/*
	Name: function_7cb67075
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9188
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 2843
*/
function function_7cb67075()
{
	self endon("disconnect");
	level endon("hash_497e0707");
	if(level flag::exists("snow_ee_completed") && level flag::get("snow_ee_completed"))
	{
		return;
	}
	var_f1f15003 = GetWeapon("cymbal_monkey");
	var_230694a = GetEntArray("teleporter_radius_trigger", "targetname");
	while(1)
	{
		self waittill("grenade_fire", e_grenade, w_weapon);
		if(w_weapon == var_f1f15003)
		{
			e_grenade waittill("stationary");
			foreach(trigger in var_230694a)
			{
				if(e_grenade istouching(trigger))
				{
					e_grenade thread function_ffa4d8ca(trigger);
				}
			}
		}
	}
}

/*
	Name: function_ffa4d8ca
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9338
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 2880
*/
function function_ffa4d8ca(var_7d7ca0ea)
{
	if(!isdefined(var_7d7ca0ea.a_w_bombs))
	{
		var_7d7ca0ea.a_w_bombs = [];
	}
	if(!isdefined(var_7d7ca0ea.a_w_bombs))
	{
		var_7d7ca0ea.a_w_bombs = [];
	}
	else if(!IsArray(var_7d7ca0ea.a_w_bombs))
	{
		var_7d7ca0ea.a_w_bombs = Array(var_7d7ca0ea.a_w_bombs);
	}
	var_7d7ca0ea.a_w_bombs[var_7d7ca0ea.a_w_bombs.size] = self;
	self waittill("death");
	var_7d7ca0ea.a_w_bombs = Array::remove_dead(var_7d7ca0ea.a_w_bombs);
}

/*
	Name: function_c7b37638
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9438
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 2909
*/
function function_c7b37638()
{
	var_3c2393cb = GetEnt(self.targetname, "script_noteworthy");
	if(isdefined(var_3c2393cb.a_w_bombs) && var_3c2393cb.a_w_bombs.size)
	{
		switch(var_3c2393cb.script_noteworthy)
		{
			case "trigger_teleport_pad_0":
			{
				level thread function_fdf0e661();
				break;
			}
			case "trigger_teleport_pad_1":
			{
				level thread function_8fe22c4f();
				break;
			}
			case "trigger_teleport_pad_2":
			{
				level thread function_4bc4a18d();
				break;
			}
		}
	}
}

/*
	Name: function_fdf0e661
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9518
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 2945
*/
function function_fdf0e661()
{
	if(!level flag::get("console_one_completed") && !level flag::get("snow_ee_completed"))
	{
		level flag::set("console_one_completed");
		level clientfield::set("console_blue", 1);
	}
}

/*
	Name: function_8fe22c4f
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x95A8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 2964
*/
function function_8fe22c4f()
{
	if(!level flag::get("console_two_completed") && !level flag::get("snow_ee_completed"))
	{
		level flag::set("console_two_completed");
		level clientfield::set("console_green", 1);
	}
}

/*
	Name: function_4bc4a18d
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9638
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 2983
*/
function function_4bc4a18d()
{
	if(!level flag::get("console_three_completed") && !level flag::get("snow_ee_completed"))
	{
		level flag::set("console_three_completed");
		level clientfield::set("console_red", 1);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e0f73644
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x96C8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 3004
*/
function function_e0f73644()
{
	if(math::cointoss())
	{
		level._custom_perks["specialty_staminup"].perk_machine_power_override_thread = &function_384be1c4;
		level._custom_perks["specialty_deadshot"].perk_machine_power_override_thread = &function_49e223a9;
	}
	else
	{
		level._custom_perks["specialty_deadshot"].perk_machine_power_override_thread = &function_16d38a15;
		level._custom_perks["specialty_staminup"].perk_machine_power_override_thread = &function_6000324c;
	}
}

/*
	Name: function_384be1c4
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9790
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 3028
*/
function function_384be1c4()
{
	zm_perks::perk_machine_removal("specialty_staminup");
	level._custom_perks = Array::remove_index(level._custom_perks, "specialty_staminup", 1);
}

/*
	Name: function_16d38a15
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x97E8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 3044
*/
function function_16d38a15()
{
	zm_perks::perk_machine_removal("specialty_deadshot");
	level._custom_perks = Array::remove_index(level._custom_perks, "specialty_deadshot", 1);
}

/*
	Name: function_49e223a9
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9840
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 3060
*/
function function_49e223a9()
{
	level waittill("start_zombie_round_logic");
	level thread function_8fbb6760("specialty_deadshot");
	level flag::wait_till("snow_ee_completed");
	level thread function_f8f36ff3("specialty_deadshot", level._custom_perks["specialty_deadshot"]);
}

/*
	Name: function_6000324c
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x98C8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 3078
*/
function function_6000324c()
{
	level waittill("start_zombie_round_logic");
	level thread function_8fbb6760("specialty_staminup");
	level flag::wait_till("snow_ee_completed");
	level thread function_f8f36ff3("specialty_staminup", level._custom_perks["specialty_staminup"]);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f8f36ff3
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9950
	Size: 0x200
	Parameters: 2
	Flags: None
	Line Number: 3098
*/
function function_f8f36ff3(str_key, s_custom_perk)
{
	machine = GetEntArray(s_custom_perk.radiant_machine_name, "targetname");
	machine_triggers = GetEntArray(s_custom_perk.radiant_machine_name, "target");
	for(i = 0; i < machine.size; i++)
	{
		machine[i] SetModel(level.machine_assets[str_key].on_model);
		machine[i] vibrate(VectorScale((0, -1, 0), 100), 0.3, 0.4, 3);
		machine[i] playsound("zmb_perks_power_on");
		machine[i] thread zm_perks::perk_fx(s_custom_perk.machine_light_effect);
		machine[i] thread zm_perks::play_loop_on_machine();
	}
	level notify(str_key + "_power_on");
	Array::thread_all(machine_triggers, &zm_perks::set_power_on, 1);
	if(isdefined(level.machine_assets[str_key].power_on_callback))
	{
		Array::thread_all(machine, level.machine_assets[str_key].power_on_callback);
	}
}

/*
	Name: function_8fbb6760
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9B58
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 3128
*/
function function_8fbb6760(str_perk)
{
	t_perk = GetEnt(str_perk, "script_noteworthy");
	t_perk setHintString(&"");
}

/*
	Name: function_d8362620
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9BB8
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 3144
*/
function function_d8362620()
{
	s_prize = struct::get("flytrap_prize", "targetname");
	mdl_prize = util::spawn_model("wpn_t7_hero_annihilator_world", s_prize.origin, s_prize.angles);
	mdl_prize thread rotate_prize(s_prize);
	level thread function_86e1c543();
	level flag::clear("flytrap");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: rotate_prize
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9C88
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 3165
*/
function rotate_prize(s_prize)
{
	self endon("death");
	while(1)
	{
		self RotateTo(self.angles + VectorScale((0, 1, 0), 180), 2);
		wait(1.9);
	}
}

/*
	Name: function_86e1c543
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9CE8
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 3185
*/
function function_86e1c543()
{
	var_957c9ba0 = GetWeapon("hero_annihilator");
	while(1)
	{
		var_65af5e9c = trigger::wait_till("flytrap_prize");
		if(!(isdefined(level.var_1cbe7756) && level.var_1cbe7756))
		{
			foreach(player in level.players)
			{
				level scoreevents::processScoreEvent("main_EE_quest_factory", player);
				player zm_stats::increment_global_stat("DARKOPS_FACTORY_EE");
				player zm_stats::increment_global_stat("DARKOPS_FACTORY_SUPER_EE");
			}
			level.var_1cbe7756 = 1;
		}
		player = var_65af5e9c.who;
		if(!player hasweapon(var_957c9ba0))
		{
			player function_5d3bb3fe(var_957c9ba0);
		}
	}
}

/*
	Name: function_5d3bb3fe
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9E90
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 3219
*/
function function_5d3bb3fe(var_957c9ba0)
{
	w_previous = self GetCurrentWeapon();
	self zm_weapons::weapon_give(var_957c9ba0);
	self GadgetPowerSet(0, 99);
	self SwitchToWeapon(var_957c9ba0);
	self waittill("weapon_change_complete");
	self SetLowReady(1);
	self SwitchToWeapon(w_previous);
	self util::waittill_any_timeout(1, "weapon_change_complete");
	self SetLowReady(0);
	self GadgetPowerSet(0, 100);
}

/*
	Name: function_869d6f66
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9FA8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 3243
*/
function function_869d6f66()
{
	if(!isdefined(self namespace_93b7f03::function_728dfe3()))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_dabc4be1
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0x9FD8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 3262
*/
function function_dabc4be1()
{
	/#
		trig_control_panel = GetEnt("Dev Block strings are not supported", "Dev Block strings are not supported");
		var_5dc8ad42 = GetWeapon("Dev Block strings are not supported");
		trig_control_panel DoDamage(100, trig_control_panel.origin, undefined, undefined, undefined, "Dev Block strings are not supported", 0, var_5dc8ad42);
	#/
}

/*
	Name: function_35372e3f
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0xA080
	Size: 0x158
	Parameters: 1
	Flags: None
	Line Number: 3281
*/
function function_35372e3f(n_value)
{
	/#
		if(!level flag::exists("Dev Block strings are not supported") || !level flag::exists("Dev Block strings are not supported") || !level flag::exists("Dev Block strings are not supported") || !level flag::exists("Dev Block strings are not supported"))
		{
			return;
		}
		var_ef99f97c = GetEntArray("Dev Block strings are not supported", "Dev Block strings are not supported");
		foreach(trigger in var_ef99f97c)
		{
			trigger DoDamage(100, trigger.origin);
			wait(5);
		}
	#/
}

/*
	Name: function_7c3a679c
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0xA1E0
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 3307
*/
function function_7c3a679c(n_value)
{
	/#
		var_957c9ba0 = GetWeapon("Dev Block strings are not supported");
		foreach(player in level.activePlayers)
		{
			player function_5d3bb3fe(var_957c9ba0);
		}
	#/
}

/*
	Name: function_1196e483
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0xA2B0
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 3328
*/
function function_1196e483(n_value)
{
	/#
		foreach(player in level.players)
		{
			player ability_player::function_10f3334();
		}
	#/
}

/*
	Name: function_75baeb50
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0xA358
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 3348
*/
function function_75baeb50(n_value)
{
	/#
		level flag::set("Dev Block strings are not supported");
		level clientfield::set("Dev Block strings are not supported", 1);
	#/
}

/*
	Name: function_5e65cea5
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0xA3B0
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 3366
*/
function function_5e65cea5(n_value)
{
	/#
		level flag::set("Dev Block strings are not supported");
		level clientfield::set("Dev Block strings are not supported", 1);
	#/
}

/*
	Name: function_71fe81
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0xA408
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 3384
*/
function function_71fe81(n_value)
{
	/#
		level flag::set("Dev Block strings are not supported");
		level clientfield::set("Dev Block strings are not supported", 1);
	#/
}

/*
	Name: function_dafe334
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0xA460
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 3402
*/
function function_dafe334()
{
	/#
		level flag::set("Dev Block strings are not supported");
		level flag::set("Dev Block strings are not supported");
		level flag::set("Dev Block strings are not supported");
		wait(0.2);
		s_console = struct::get("Dev Block strings are not supported");
		s_console notify("trigger_activated");
	#/
}

/*
	Name: function_afea638c
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0xA508
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 3424
*/
function function_afea638c()
{
	/#
		level thread setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_75baeb50);
		level thread setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_5e65cea5);
		level thread setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_71fe81);
		level thread setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_dafe334);
		level thread setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_dabc4be1);
		level thread setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_35372e3f);
		level thread setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_7c3a679c);
		level thread setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_1196e483);
	#/
}

/*
	Name: setup_devgui_func
	Namespace: zm_factory
	Checksum: 0x424F4353
	Offset: 0xA6E0
	Size: 0x120
	Parameters: 5
	Flags: None
	Line Number: 3448
*/
function setup_devgui_func(str_devgui_path, str_dvar, n_value, func, n_base_value)
{
	/#
		if(!isdefined(n_base_value))
		{
			n_base_value = -1;
		}
		SetDvar(str_dvar, n_base_value);
		AddDebugCommand("Dev Block strings are not supported" + str_devgui_path + "Dev Block strings are not supported" + str_dvar + "Dev Block strings are not supported" + n_value + "Dev Block strings are not supported");
		while(1)
		{
			n_dvar = GetDvarInt(str_dvar);
			if(n_dvar > n_base_value)
			{
				[[func]](n_dvar);
				SetDvar(str_dvar, n_base_value);
			}
			util::wait_network_frame();
		}
	#/
}

