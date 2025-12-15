#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\damagefeedback_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_bgb_machine;
#include scripts\zm\_zm_chaos_mod;
#include scripts\zm\_zm_cne;
#include scripts\zm\_zm_da_perk_slots;
#include scripts\zm\_zm_emote_menu;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_gumgame;
#include scripts\zm\_zm_hero_weapon;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_leveling;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_perk_additions;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_rayzorback;
#include scripts\zm\_zm_weapons;
#include scripts\zm\bgb\_zm_bgb_all_custom;
#include scripts\zm\gametypes\_zm_gametype;
#include scripts\zm\zmperkoverlaystyles;
#include scripts\zm\zmsavedata;

#namespace ZCLASSIC;

/*
	Name: main
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x27D0
	Size: 0x558
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function main()
{
	level.var_a4f16266 = &function_a4f16266;
	level.var_f55ff70b = 0;
	level.var_908190f0 = 1;
	level thread namespace_3bad7368::function_6d365278();
	util::registerClientSys("setHudHintstring");
	SetDvar("sv_cheats", 1);
	SetDvar("developer", 0);
	level.var_5072140b = [];
	level.var_5072140b[level.var_5072140b.size] = "Luna can be spawned with the Blood Wolf Bite perk, and she can be pet";
	level.var_5072140b[level.var_5072140b.size] = "The PHD Slider perk will always kill regular zombies within swiping range";
	level.var_5072140b[level.var_5072140b.size] = "The Play It Again Sam Gobblegum can be activated again to change the song it plays, if able to";
	level.var_5072140b[level.var_5072140b.size] = "The Apothicon Servant weapon in Shadows Of Evil can be paped";
	level.var_5072140b[level.var_5072140b.size] = "The Firearm Formulation Gobblegum can give anything within the mystery box, including Wonderweapons and equipment";
	level.var_5072140b[level.var_5072140b.size] = "100 points can be obtained by proning at any perk, even when they move";
	level.var_5072140b[level.var_5072140b.size] = "While emoting, you can still fire your weapon. Aiming like this however is an aquired skill";
	level.var_5072140b[level.var_5072140b.size] = "Cashback Cocktail and Point Crusher make a great early game combo for gaining points";
	level.var_5072140b[level.var_5072140b.size] = "When upgraded, the Blood Bullets perk will regen Wonderweapon ammo";
	level.var_5072140b[level.var_5072140b.size] = "The Malevolent Presence Gobblegum will scale its damage, killing zombies at the same rate on any round";
	level.var_5072140b[level.var_5072140b.size] = "There are Chaos effects for specific maps, like spawning various bosses";
	level.var_5072140b[level.var_5072140b.size] = "When upgraded, Miracle Hands Mocha can turn Max Ammos into Free Perk Powerups";
	level.var_5072140b[level.var_5072140b.size] = "When all perks are owned, Free Perk Powerups will upgrade a random perk if perk upgrade powerups are enabled";
	level.var_5072140b[level.var_5072140b.size] = "Red powerups are activated when a zombie touches it, defend them at all costs!";
	level.var_5072140b[level.var_5072140b.size] = "When 'missing stock perks' is enabled, the button in The Giants spawn room can be activated instantly";
	level.var_5072140b[level.var_5072140b.size] = "The I'm Feelin' Lucky Gobblegum can give custom Powerups";
	level.var_5072140b[level.var_5072140b.size] = "The Quacknarok Gobblegum has an additional effect on Origins";
	level.var_5072140b[level.var_5072140b.size] = "You can melee the Vulture Aid machine to toggle waypoints";
	level.var_5072140b[level.var_5072140b.size] = "with death perception, you can prone at more objects to find loose change";
	if(!(isdefined(level.var_f55ff70b) && level.var_f55ff70b))
	{
		clientfield::register("clientuimodel", "salami_key", 1, 1, "int");
	}
	level flag::init("reap_collection_loaded");
	callback::on_spawned(&on_player_spawned);
	callback::on_connect(&on_player_connect);
	zm_powerups::register_powerup("zombie_collect_perk_slot", &function_b22822b4);
	zm_powerups::add_zombie_powerup("zombie_collect_perk_slot", "p7_zm_perk_bottle_broken", &"ZM_REAP_MOD_POWERUP_FREE_PERK_SLOT", &zm_powerups::func_should_never_drop, 0, 0, 0);
	zm_powerups::register_powerup("zombie_collect_perk_upgrade", &function_44bbf594);
	zm_powerups::add_zombie_powerup("zombie_collect_perk_upgrade", "wpn_t7_zmb_perk_bottle_rainbow", &"ZM_REAP_MOD_POWERUP_FREE_PERK_UPGRADE", &zm_powerups::func_should_never_drop, 0, 0, 0);
	zm_powerups::register_powerup("zombie_collect_gun_upgrade", &function_39a09e40);
	zm_powerups::add_zombie_powerup("zombie_collect_gun_upgrade", "zombie_powerup_weaponup_arrow", &"ZM_REAP_MOD_POWERUP_FREE_PERK_UPGRADE", &zm_powerups::func_should_never_drop, 1, 0, 0);
	zm_gametype::main();
	level thread function_f6524c5e();
	level.onPrecacheGameType = &onPrecacheGameType;
	level.onStartGameType = &onStartGameType;
	level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
	level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
	level thread function_df6c89db();
	level thread function_7302f960();
}

/*
	Name: onPrecacheGameType
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x2D30
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 116
*/
function onPrecacheGameType()
{
	level.playerSuicideAllowed = 1;
	level.canPlayerSuicide = &zm_gametype::canPlayerSuicide;
}

/*
	Name: onStartGameType
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x2D60
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 132
*/
function onStartGameType()
{
	level.spawnMins = (0, 0, 0);
	level.spawnMaxs = (0, 0, 0);
	structs = struct::get_array("player_respawn_point", "targetname");
	foreach(struct in structs)
	{
		level.spawnMins = math::expand_mins(level.spawnMins, struct.origin);
		level.spawnMaxs = math::expand_maxs(level.spawnMaxs, struct.origin);
	}
	level.mapCenter = math::find_box_center(level.spawnMins, level.spawnMaxs);
	setMapCenter(level.mapCenter);
	return;
}

/*
	Name: function_9faea208
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x2EC0
	Size: 0xA0
	Parameters: 2
	Flags: None
	Line Number: 157
*/
function function_9faea208(key, def)
{
	s = spawnstruct();
	s.key = key;
	s.def = def;
	level.var_98fe8b71[level.var_98fe8b71.size] = s;
	if(!isdefined(level.var_625ecbd9))
	{
		level.var_625ecbd9 = [];
	}
	level.var_625ecbd9[key] = def;
	return;
	ERROR: Bad function call
}

/*
	Name: function_a4f16266
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x2F68
	Size: 0xCC0
	Parameters: 0
	Flags: None
	Line Number: 182
*/
function function_a4f16266()
{
	function_9faea208("all_out_chaos", 0);
	function_9faea208("tf_version", 0);
	function_9faea208("temp", 0);
	function_9faea208("gamemode_aimassist", 0);
	function_9faea208("gamemode_chaos_assist", 1);
	function_9faea208("gamemode_chaos_enabled", 0);
	function_9faea208("gamemode_chaos_exper", 0);
	function_9faea208("gamemode_chaos_meta", 1);
	function_9faea208("gamemode_chaos_nogun", 0);
	function_9faea208("gamemode_chaos_perk_tele", 1);
	function_9faea208("gamemode_chaos_position", 0);
	function_9faea208("gamemode_chaos_tele", 1);
	function_9faea208("gamemode_chaos_timer", 30);
	function_9faea208("gamemode_gumgame_blue", 0);
	function_9faea208("gamemode_gumgame_classics", 0);
	function_9faea208("gamemode_gumgame_custom", 0);
	function_9faea208("gamemode_gumgame_enabled", 0);
	function_9faea208("gamemode_gumgame_green", 0);
	function_9faea208("gamemode_gumgame_mega", 0);
	function_9faea208("gamemode_gumgame_nbt", 0);
	function_9faea208("gamemode_gumgame_no_pack", 0);
	function_9faea208("gamemode_gumgame_orange", 0);
	function_9faea208("gamemode_gumgame_perka", 0);
	function_9faea208("gamemode_gumgame_point_drop", 0);
	function_9faea208("gamemode_gumgame_purple", 0);
	function_9faea208("gamemode_gumgame_rare", 0);
	function_9faea208("gamemode_gumgame_shields_up", 0);
	function_9faea208("gamemode_gumgame_skip_eat", 0);
	function_9faea208("gamemode_gumgame_skip_mid_round", 0);
	function_9faea208("gamemode_gumgame_ultra", 0);
	function_9faea208("gamemode_gumgame_whimsical", 0);
	function_9faea208("gamemode_gungame", 0);
	function_9faea208("gamemode_onehit", 0);
	function_9faea208("gamemode_poa_adv", 0);
	function_9faea208("gamemode_poa_enabled", 0);
	function_9faea208("gamemode_poa_kill", 0);
	function_9faea208("gamemode_cne", 0);
	function_9faea208("gamemode_cne_illegal", 0);
	function_9faea208("gamemode_cne_stacked", 0);
	function_9faea208("gobblegums_any_gum", 0);
	function_9faea208("gobblegums_first_free", 1);
	function_9faea208("gobblegums_limit", 3);
	function_9faea208("gobblegums_limit_mode", 0);
	function_9faea208("perks_all_wonder", 0);
	function_9faea208("perks_banana", 0);
	function_9faea208("perks_bandolier", 0);
	function_9faea208("perks_blaze", 0);
	function_9faea208("perks_bloodbullet", 0);
	function_9faea208("perks_bloodwolf", 0);
	function_9faea208("perks_brandy", 0);
	function_9faea208("perks_bull_ice", 0);
	function_9faea208("perks_cashback", 0);
	function_9faea208("perks_changechews", 0);
	function_9faea208("perks_cherry", 0);
	function_9faea208("perks_counter", 0);
	function_9faea208("perks_crusade", 0);
	function_9faea208("perks_crusher", 0);
	function_9faea208("perks_cw_machine", 0);
	function_9faea208("perks_cwprice", 0);
	function_9faea208("perks_damanade", 0);
	function_9faea208("perks_deadshot", 0);
	function_9faea208("perks_doublebuy", 0);
	function_9faea208("perks_doubletap", 0);
	function_9faea208("perks_downer", 0);
	function_9faea208("perks_dyingwish", 0);
	function_9faea208("perks_elemental", 0);
	function_9faea208("perks_estatic", 0);
	function_9faea208("perks_ffyl", 0);
	function_9faea208("perks_icon_style", 0);
	function_9faea208("perks_icu", 0);
	function_9faea208("perks_juggernog", 0);
	function_9faea208("perks_magnet", 0);
	function_9faea208("perks_map_location", 0);
	function_9faea208("perks_milk", 0);
	function_9faea208("perks_missing_stock", 0);
	function_9faea208("perks_miracle", 0);
	function_9faea208("perks_momentum", 0);
	function_9faea208("perks_moonshine", 0);
	function_9faea208("perks_mulekick", 0);
	function_9faea208("perks_nitrogen", 0);
	function_9faea208("perks_nobear", 0);
	function_9faea208("perks_nukacola", 0);
	function_9faea208("perks_packbox", 0);
	function_9faea208("perks_perception", 0);
	function_9faea208("perks_phd", 0);
	function_9faea208("perks_quickrevive", 0);
	function_9faea208("perks_random_perks", 0);
	function_9faea208("perks_razor", 0);
	function_9faea208("perks_refund", 0);
	function_9faea208("perks_repairman", 0);
	function_9faea208("perks_slot_counter", 0);
	function_9faea208("perks_slider", 0);
	function_9faea208("perks_spectorshot", 0);
	function_9faea208("perks_speedcola", 0);
	function_9faea208("perks_staminup", 0);
	function_9faea208("perks_stronghold", 0);
	function_9faea208("perks_swarm", 0);
	function_9faea208("perks_tactiquilla", 0);
	function_9faea208("perks_timeslip", 0);
	function_9faea208("perks_tombstone", 0);
	function_9faea208("perks_tortoise", 0);
	function_9faea208("perks_vigor", 0);
	function_9faea208("perks_vulture", 0);
	function_9faea208("perks_Winterswail", 0);
	function_9faea208("perks_widowswine", 0);
	function_9faea208("perks_zombshell", 0);
	function_9faea208("perks_buy_limit", 4);
	function_9faea208("powerups_better_carp", 0);
	function_9faea208("powerups_better_max", 0);
	function_9faea208("powerups_no_firesale_music", 0);
	function_9faea208("powerups_pap", 0);
	function_9faea208("powerups_perk", 0);
	function_9faea208("powerups_perk_slot", 0);
	function_9faea208("powerups_perk_upgrade", 0);
	function_9faea208("extras_ee_enhance", 0);
	function_9faea208("extras_hitmarker", 0);
	function_9faea208("extras_rayzorback", 0);
	function_9faea208("extras_salami_key", 0);
	function_9faea208("extras_scorefeed", 0);
	function_9faea208("extras_waw_pap", 0);
	function_9faea208("extras_zombie_counter", 0);
	function_9faea208("Cheats_loc_test", 0);
	function_9faea208("Cheats_motherlode", 0);
	function_9faea208("Cheats_perkaholic", 0);
	function_9faea208("Cheats_perk_upgrade", 0);
	function_9faea208("Cheats_UQR", 0);
	function_9faea208("cheats_out_of_bounds", 0);
	function_9faea208("cheats_round", 0);
	function_9faea208("cheats_too_many_weapons", 0);
	function_9faea208("challenges_zombie_points", 0);
	function_9faea208("emotes_enable", 0);
	function_9faea208("progression_disabled", 0);
	function_9faea208("progression_position", 0);
}

/*
	Name: function_df6c89db
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x3C30
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 329
*/
function function_df6c89db()
{
	level.round_prestart_func = &function_8a7e68f9;
	wait(2);
	if(level.script == "zm_castle")
	{
		level.powerup_fx_func = &function_c7d8dba7;
	}
	level thread function_a8a620d5();
	level thread function_f218f8f2();
	level thread function_a1e5f2f1();
	level thread aim_assist();
}

/*
	Name: function_8a7e68f9
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x3CE8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 353
*/
function function_8a7e68f9()
{
	level flag::wait_till("reap_collection_loaded");
	level._round_start_func = undefined;
	zm_spawner::register_zombie_damage_callback(&hitmarker);
	zm_spawner::register_zombie_death_event_callback(&function_5adbafc9);
	return;
	waittillframeend;
}

/*
	Name: function_a3e3b292
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x3D60
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 373
*/
function function_a3e3b292(var_6c4a7508, var_7f57924c)
{
	if(self.sessionstate == "spectator")
	{
		return;
	}
	if(!isdefined(var_6c4a7508) || !isdefined(var_7f57924c))
	{
		return;
	}
	var_b22466e9 = var_6c4a7508;
	var_b22466e9 = var_b22466e9 + "|" + var_7f57924c;
	util::setClientSysState("setHudHintstring", var_b22466e9, self);
}

/*
	Name: on_player_spawned
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x3DF8
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 398
*/
function on_player_spawned()
{
	level.player_too_many_players_check = 0;
	level.player_too_many_players_check_func = undefined;
	self thread function_c0c63d92();
	self thread function_17afeda7();
	self thread function_5e5dfcd7();
	self thread function_98311296();
	self thread function_f87b6e11();
	self thread function_6924b983();
	self thread function_9ac007ed();
	self thread function_b48eac6a();
	self thread function_74907bc3();
	self thread function_7ca1da8d();
}

/*
	Name: function_74907bc3
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x3F08
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 424
*/
function function_74907bc3()
{
}

/*
	Name: function_7ca1da8d
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x3F18
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 438
*/
function function_7ca1da8d()
{
	wait(0.1);
	level flag::wait_till("reap_collection_loaded");
	wait(0.1);
	self util::setClientSysState("setHudHintstring", "ReapModXpbar|" + namespace_11e193f1::function_6dd41714("progression_disabled"));
	self util::setClientSysState("setHudHintstring", "ReapModXpbarPos|" + namespace_11e193f1::function_6dd41714("progression_position"));
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c7d8dba7
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x3FC8
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 459
*/
function function_c7d8dba7()
{
	if(self.powerup_name === "castle_tram_token")
	{
		self clientfield::set("powerup_fx", 2);
	}
	else if(IsSubStr(self.powerup_name, "demonic_rune"))
	{
		self clientfield::set("demonic_rune_fx", 1);
	}
	else if(self.only_affects_grabber)
	{
		self clientfield::set("powerup_fx", 2);
	}
	else if(self.any_team)
	{
		self clientfield::set("powerup_fx", 4);
	}
	else if(self.zombie_grabbable)
	{
		self clientfield::set("powerup_fx", 3);
	}
	else
	{
		self clientfield::set("powerup_fx", 1);
	}
}

/*
	Name: function_f6524c5e
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x4110
	Size: 0xCD8
	Parameters: 0
	Flags: None
	Line Number: 497
*/
function function_f6524c5e()
{
	level endon("game_ended");
	level.var_f6524c5e = [];
	level.var_aee37993 = [];
	level.var_2717f5bc = [];
	if(!(isdefined(level.var_f55ff70b) && level.var_f55ff70b))
	{
		level.var_2717f5bc["perks_icon_style"] = &function_6101825e;
	}
	level.var_aee37993[128] = 0;
	level.var_aee37993[117] = 0;
	level.var_aee37993[118] = 0;
	level.var_aee37993[122] = 0;
	level.var_aee37993[66] = 0;
	level.var_aee37993[57] = 0;
	level.var_aee37993[129] = 0;
	level.var_aee37993[130] = 0;
	level.var_aee37993[121] = RandomInt(10) + 1;
	level.var_aee37993[19] = RandomInt(75);
	level.var_aee37993[3] = RandomInt(3);
	level.var_aee37993[73] = RandomInt(7);
	level.var_aee37993[67] = RandomInt(3);
	level.var_aee37993[58] = RandomInt(6);
	level.var_aee37993[4] = 5 * RandomInt(12) + 1;
	level.var_aee37993[78] = 5 * RandomInt(4) + 1;
	level.var_aee37993[93] = RandomInt(3);
	wait(0.2);
	level flag::wait_till("all_players_spawned");
	IPrintLnBold("LOADING SETTINGS, PLEASE WAIT");
	if(level.script == "zm_zod")
	{
		level.b_allow_idgun_pap = 1;
	}
	players = GetPlayers();
	while(players.size == 0)
	{
		players = GetPlayers();
		wait(0.05);
	}
	var_8c743a97 = getArrayKeys(level.var_625ecbd9);
	var_40370e7f = namespace_851dc78f::function_7d15591a("center", "top", "center", "top", 0, 0, 1, "white", 300, 12, (0, 0, 0), -2);
	level.var_1851f4c1 = namespace_851dc78f::function_7d15591a("center", "top", "center", "top", 0, 0, 1, "white", 5, 12, VectorScale((1, 0, 1), 0.8), -1);
	var_9da727d = namespace_851dc78f::function_122a9928("center", "top", "center", "top", 0, 15, 1, (1, 1, 1), "LOADING, PLEASE WAIT...", 1.2);
	var_b4dab76e = namespace_851dc78f::function_122a9928("center", "top", "center", "top", 0, 35, 1, (1, 1, 1), "while you wait, check out this tip:", 1);
	var_10b80a9a = namespace_851dc78f::function_122a9928("center", "top", "center", "top", 0, 45, 1, (1, 1, 1), level.var_5072140b[RandomInt(level.var_5072140b.size)], 1.2);
	level.var_42da30f8 = var_8c743a97.size;
	level.var_d0a9514b = var_8c743a97.size;
	level.var_f6524c5e["all_out_chaos"] = players[0] namespace_11e193f1::function_9ba0bb47("all_out_chaos");
	wait(0.5);
	for(i = 0; i < var_8c743a97.size; i++)
	{
		level.var_f6524c5e[var_8c743a97[i]] = players[0] namespace_11e193f1::function_9ba0bb47(var_8c743a97[i]);
		if(isdefined(level.var_2717f5bc[var_8c743a97[i]]))
		{
			level thread [[level.var_2717f5bc[var_8c743a97[i]]]]();
		}
	}
	while(level.var_42da30f8 > 0)
	{
		wait(0.1);
	}
	var_40370e7f destroy();
	level.var_1851f4c1 destroy();
	var_9da727d destroy();
	var_b4dab76e destroy();
	var_10b80a9a destroy();
	wait(0.1);
	IPrintLnBold("SETTINGS LOADED");
	level flag::set("reap_collection_loaded");
	level thread function_f223aa3a();
	level thread function_204284ce();
	if(namespace_11e193f1::function_6dd41714("cheats_round") > 1)
	{
		level.var_908190f0 = 0;
		level thread function_111a5a3e();
	}
	if(namespace_11e193f1::function_6dd41714("powerups_perk") == 1)
	{
		level.zombie_powerups["free_perk"].func_should_drop_with_regular_powerups = &zm_powerups::func_should_always_drop;
	}
	if(namespace_11e193f1::function_6dd41714("powerups_perk_slot") == 1)
	{
		level.zombie_powerups["zombie_collect_perk_slot"].func_should_drop_with_regular_powerups = &zm_powerups::func_should_always_drop;
	}
	else
	{
		level.zombie_powerups["zombie_collect_perk_slot"] = undefined;
	}
	if(namespace_11e193f1::function_6dd41714("powerups_pap") == 1)
	{
		level.zombie_powerups["zombie_collect_gun_upgrade"].func_should_drop_with_regular_powerups = &zm_powerups::func_should_always_drop;
	}
	else
	{
		level.zombie_powerups["zombie_collect_gun_upgrade"] = undefined;
	}
	if(namespace_11e193f1::function_6dd41714("powerups_perk_upgrade") == 1)
	{
		level.zombie_powerups["zombie_collect_perk_upgrade"].func_should_drop_with_regular_powerups = &zm_powerups::func_should_always_drop;
		level._custom_powerups["free_perk"].grab_powerup = &grab_free_perk;
	}
	else
	{
		level.zombie_powerups["zombie_collect_perk_upgrade"] = undefined;
	}
	if(namespace_11e193f1::function_6dd41714("perks_cw_machine") == 1)
	{
		level thread function_66d007c5();
	}
	if(namespace_11e193f1::function_6dd41714("extras_zombie_counter") > 0)
	{
		level thread Zombie_Counter();
	}
	if(namespace_11e193f1::function_6dd41714("gamemode_chaos_enabled") == 0)
	{
		level.zombie_powerups["zombie_full_ammo"] = undefined;
		level.zombie_powerups["lose_points_team_powerup"] = undefined;
		level.zombie_powerups["lose_perk_team_powerup"] = undefined;
		level.zombie_powerups["anti_carpentr"] = undefined;
	}
	level thread zm_powerups::randomize_powerups();
	if(namespace_11e193f1::function_6dd41714("challenges_zombie_points") == 1)
	{
		zombie_utility::set_zombie_var("zombie_score_kill_4player", 0);
		zombie_utility::set_zombie_var("zombie_score_kill_3player", 0);
		zombie_utility::set_zombie_var("zombie_score_kill_2player", 0);
		zombie_utility::set_zombie_var("zombie_score_kill_1player", 0);
		zombie_utility::set_zombie_var("zombie_score_damage_normal", 0);
		zombie_utility::set_zombie_var("zombie_score_damage_light", 0);
		zombie_utility::set_zombie_var("zombie_score_bonus_melee", 0);
		zombie_utility::set_zombie_var("zombie_score_bonus_head", 0);
		zombie_utility::set_zombie_var("zombie_score_bonus_neck", 0);
		zombie_utility::set_zombie_var("zombie_score_bonus_torso", 0);
		zombie_utility::set_zombie_var("zombie_score_bonus_burn", 0);
	}
	if(namespace_11e193f1::function_6dd41714("cheats_out_of_bounds") == 1)
	{
		level.var_908190f0 = 0;
		level.player_out_of_playable_area_monitor = 0;
	}
	if(namespace_11e193f1::function_6dd41714("cheats_too_many_weapons") == 1)
	{
		level.player_too_many_weapons_monitor = 0;
	}
	if(namespace_11e193f1::function_6dd41714("perks_missing_stock") == 1 && level.script == "zm_factory" && namespace_11e193f1::function_6dd41714("perks_staminup") == 0 && namespace_11e193f1::function_6dd41714("perks_deadshot") == 0)
	{
		if(flag::exists("power_on"))
		{
			level flag::wait_till("power_on");
			wait(1);
			if(flag::exists("console_one_completed") && flag::exists("console_two_completed") && flag::exists("console_three_completed"))
			{
				level flag::set("console_one_completed");
				wait(0.1);
				level flag::set("console_two_completed");
				wait(0.1);
				level flag::set("console_three_completed");
				wait(0.1);
			}
		}
	}
}

/*
	Name: function_111a5a3e
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x4DF0
	Size: 0x2B8
	Parameters: 0
	Flags: None
	Line Number: 671
*/
function function_111a5a3e()
{
	wait(0.1);
	level flag::wait_till("start_zombie_round_logic");
	target_round = namespace_11e193f1::function_6dd41714("cheats_round");
	while(zombie_utility::get_round_enemy_array() < 1)
	{
		wait(0.1);
	}
	foreach(player in level.players)
	{
		if(zm_utility::is_player_valid(player))
		{
			player zm_score::add_to_player_score(target_round - 1 * 500);
		}
	}
	SetRoundsPlayed(target_round);
	level.round_number = target_round - 1;
	zm::set_round_number(target_round - 1);
	while(zombie_utility::get_round_enemy_array() > 0 || level.round_number < 2 || level.round_number == target_round - 1)
	{
		level.zombie_total = 0;
		foreach(zombie in zombie_utility::get_round_enemy_array())
		{
			level.round_number = target_round - 1;
			zombie DoDamage(zombie.health + 666, zombie.origin);
		}
		wait(0.1);
	}
	zm::set_round_number(target_round);
	level.round_number = zm::get_round_number();
}

/*
	Name: function_66d007c5
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x50B0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 714
*/
function function_66d007c5()
{
}

/*
	Name: function_4a31782f
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x50C0
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 728
*/
function function_4a31782f(perk_machine)
{
	while(1)
	{
		level flag::wait_till("power_on");
		perk_machine scene::Play("p9_fxanim_zm_gp_doubletap_ducks_bundle", perk_machine);
		level flag::wait_till("power_off");
		perk_machine scene::stop("p9_fxanim_zm_gp_doubletap_ducks_bundle", perk_machine);
	}
}

/*
	Name: function_6c43a5c8
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x5160
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 749
*/
function function_6c43a5c8(perk_machine)
{
	perk_machine thread function_de1fba74();
	var_fb1cd1b2 = "specialty_doubletap2_power_on";
	str_off = "specialty_doubletap2_off";
	first = 1;
	while(1)
	{
		if(first && perk_machine.model == "p9_sur_machine_doubletap2_on" || (first && flag::get("power_on")))
		{
			first = 0;
		}
		else
		{
			level waittill(var_fb1cd1b2);
		}
		level.var_15009ec4 = 1;
		level thread function_575c219c(perk_machine);
		level waittill(str_off);
		level.var_15009ec4 = 0;
		wait(0.01);
	}
}

/*
	Name: function_575c219c
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x5278
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 783
*/
function function_575c219c(perk_machine)
{
	wait(5);
	while(level.var_15009ec4)
	{
		while(isdefined(level.var_2a48ed87))
		{
			wait(0.1);
		}
		wait(10);
	}
}

/*
	Name: function_de1fba74
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x52C8
	Size: 0x228
	Parameters: 0
	Flags: None
	Line Number: 806
*/
function function_de1fba74()
{
	tags = [];
	tags[tags.size] = "duck_back";
	tags[tags.size] = "duck_front";
	tags[tags.size] = "duck_left";
	tags[tags.size] = "duck_right";
	level.var_9aa8c1bc = [];
	self setcandamage(1);
	self.health = 99999;
	while(1)
	{
		self waittill("damage", damage, attacker, direction, point, type, tagName, modelName, partName, weapon, iDFlags);
		for(i = 0; i < tags.size; i++)
		{
			if(isdefined(level.var_9aa8c1bc[tags[i]]) && Distance(point, self function_dd4ff2dc(tags[i])) < 1 && isdefined(attacker) && isPlayer(attacker))
			{
				attacker zm_score::add_to_player_score(10 + RandomInt(10) * 10);
				level thread function_4b3a9881(tags[i]);
			}
		}
	}
}

/*
	Name: function_dd4ff2dc
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x54F8
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 840
*/
function function_dd4ff2dc(tag)
{
	orig = self GetTagOrigin(tag);
	if(tag == "duck_back")
	{
		orig = orig + VectorScale((0, 0, 1), 6);
	}
	if(tag == "duck_front")
	{
		orig = orig + VectorScale((0, 0, 1), 5);
	}
	if(tag == "duck_right")
	{
		orig = orig + VectorScale((1, 0, 1), 8);
	}
	if(tag == "duck_left")
	{
		orig = orig + (-8, 0, 4);
	}
	return orig;
}

/*
	Name: function_4b3a9881
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x55D8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 872
*/
function function_4b3a9881(tag)
{
	level.var_9aa8c1bc[tag] = 1;
	level waittill("between_round_over");
	level.var_9aa8c1bc[tag] = undefined;
}

/*
	Name: grab_free_perk
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x5618
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 889
*/
function grab_free_perk(player)
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread free_perk_powerup();
	}
	LUINotifyEvent(&"zombie_notification", 1, &"ZM_REAP_MOD_POWERUP_FREE_PERK");
}

/*
	Name: free_perk_powerup
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x56B8
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 909
*/
function free_perk_powerup()
{
	if(!self laststand::player_is_in_laststand() && !self.sessionstate == "spectator")
	{
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
			if(isdefined(random_perk) && isdefined(level.perk_bought_func))
			{
				self [[level.perk_bought_func]](random_perk);
			}
		}
		else
		{
			self thread function_7dd58646();
		}
	}
}

/*
	Name: function_b22822b4
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x58A8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 954
*/
function function_b22822b4(player)
{
	level.perk_purchase_limit++;
	level notify("hash_db578725");
	LUINotifyEvent(&"zombie_notification", 1, &"ZM_REAP_MOD_POWERUP_FREE_PERK_SLOT");
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_39a09e40
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x58F8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 974
*/
function function_39a09e40(player)
{
	player thread namespace_851dc78f::function_8d654c9c();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_44bbf594
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x5928
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 991
*/
function function_44bbf594(player)
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_7dd58646();
	}
	LUINotifyEvent(&"zombie_notification", 1, &"ZM_REAP_MOD_POWERUP_FREE_PERK_UPGRADE");
}

/*
	Name: function_7dd58646
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x59C8
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 1011
*/
function function_7dd58646()
{
	a_str_perks = Array::randomize(getArrayKeys(level._custom_perks));
	for(i = 0; i < a_str_perks.size; i++)
	{
		perk = a_str_perks[i];
		if(namespace_851dc78f::function_20dc5a15(perk) && namespace_851dc78f::function_a7c76532(perk) && !self namespace_851dc78f::function_b690a849(perk) && self namespace_851dc78f::function_5f9a13b3(perk) || (!namespace_851dc78f::function_20dc5a15(perk) && namespace_851dc78f::function_a7c76532(perk) && !self namespace_851dc78f::function_b690a849(perk) && self hasPerk(perk)))
		{
			if(!isdefined(self.var_d6aef449))
			{
				self.var_d6aef449 = [];
			}
			self.var_d6aef449[perk] = 1;
			if(isdefined(level.var_7280bfd8) && isdefined(level.var_7280bfd8[perk]) && isdefined(level.var_7280bfd8[perk].clientfield_name))
			{
				self thread namespace_4b6e359c::function_75aa16e4(perk, level.var_7280bfd8[perk].clientfield_name, "overlayStyle", 1);
				if(isdefined(level.var_7280bfd8[perk].var_2ebfb3f9))
				{
					self thread [[level.var_7280bfd8[perk].var_2ebfb3f9]]();
				}
			}
			if(isdefined(level.var_543bac32) && isdefined(level.var_543bac32[perk]))
			{
				self thread zm_perks::function_fea048be(level.var_543bac32[perk] + 1);
				break;
			}
		}
	}
}

/*
	Name: function_8024df49
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x5C48
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1051
*/
function function_8024df49()
{
	var_8c743a97 = getArrayKeys(level.var_f6524c5e);
	for(i = 0; i < var_8c743a97.size; i++)
	{
		IPrintLnBold(var_8c743a97[i] + " = " + level.var_f6524c5e[var_8c743a97[i]]);
		wait(0.5);
	}
}

/*
	Name: function_17afeda7
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x5CE8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 1071
*/
function function_17afeda7()
{
	self endon("disconnect");
	wait(2);
	level flag::wait_till("initial_blackscreen_passed");
	self.var_e610f362 = [];
}

/*
	Name: function_204284ce
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x5D30
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1089
*/
function function_204284ce()
{
	while(1)
	{
		level waittill("zmb_max_ammo_level");
		if(namespace_11e193f1::function_6dd41714("powerups_better_max") == 1)
		{
			players = GetPlayers();
			for(i = 0; i < players.size; i++)
			{
				players[i] thread function_ecabcf3a();
			}
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ecabcf3a
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x5DE0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1117
*/
function function_ecabcf3a()
{
	primaryWeapons = self getweaponslistprimaries();
	for(i = 0; i < primaryWeapons.size; i++)
	{
		self SetWeaponAmmoClip(primaryWeapons[i], primaryWeapons[i].clipSize);
	}
}

/*
	Name: function_f223aa3a
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x5E70
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 1136
*/
function function_f223aa3a()
{
	while(1)
	{
		while(!isdefined(level.carpenter_powerup_active))
		{
			wait(0.1);
		}
		if(namespace_11e193f1::function_6dd41714("powerups_better_carp") == 1)
		{
			players = GetPlayers();
			for(i = 0; i < players.size; i++)
			{
				if(isdefined(level.riotshield_damage_callback))
				{
					players[i] thread [[level.riotshield_damage_callback]](-1500);
				}
			}
		}
		while(isdefined(level.carpenter_powerup_active))
		{
			wait(0.1);
		}
		wait(0.1);
	}
}

/*
	Name: function_b48eac6a
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x5F50
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 1173
*/
function function_b48eac6a()
{
	self endon("disconnect");
	self notify("hash_b48eac6a");
	self endon("hash_b48eac6a");
	wait(5);
	level flag::wait_till("reap_collection_loaded");
	self SetControllerUIModelValue("hudItems.ReapPerks.PerkSlotCounterText", " ");
	if(namespace_11e193f1::function_6dd41714("perks_slot_counter") > 0)
	{
		while(1)
		{
			slots = self zm_utility::get_player_perk_purchase_limit();
			self SetControllerUIModelValue("hudItems.ReapPerks.PerkSlotCounterText", slots + " Slots");
			level util::waittill_any_ex(10, "perk_slot_changed", "perk_purchased", "fake_death", "death", "player_downed");
			wait(0.1);
		}
	}
}

/*
	Name: function_9ac007ed
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x6088
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 1203
*/
function function_9ac007ed()
{
	self endon("disconnect");
	self notify("hash_9ac007ed");
	self endon("hash_9ac007ed");
	wait(5);
	level flag::wait_till("reap_collection_loaded");
	wait(1);
	self SetControllerUIModelValue("hudItems.ReapPerks.PerkCounterText", " ");
	if(namespace_11e193f1::function_6dd41714("perks_counter") > 0)
	{
		while(1)
		{
			Total = function_20cb21eb();
			owned = self function_cea3e97c();
			self SetControllerUIModelValue("hudItems.ReapPerks.PerkCounterText", owned + "/" + Total);
			self util::waittill_any_ex(10, "perk_purchased", "burp", "fake_death", "death", "player_downed", "perk_acquired");
			wait(0.1);
		}
	}
}

/*
	Name: function_20cb21eb
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x61F0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 1235
*/
function function_20cb21eb()
{
	Total = 0;
	a_str_perks = getArrayKeys(level._custom_perks);
	Total = a_str_perks.size;
	if(namespace_11e193f1::function_6dd41714("perks_counter") == 2)
	{
		if(isdefined(level.var_7280bfd8))
		{
			for(i = 0; i < a_str_perks.size; i++)
			{
				if(isdefined(level.var_7280bfd8[a_str_perks[i]]))
				{
					Total = Total + 1;
				}
			}
		}
	}
	return Total;
}

/*
	Name: function_cea3e97c
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x62C0
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 1266
*/
function function_cea3e97c()
{
	Total = 0;
	a_str_perks = getArrayKeys(level._custom_perks);
	PERKS = [];
	for(i = 0; i < a_str_perks.size; i++)
	{
		perk = a_str_perks[i];
		if(!namespace_851dc78f::function_20dc5a15(perk) && self hasPerk(perk) || (namespace_851dc78f::function_20dc5a15(perk) && self namespace_851dc78f::function_5f9a13b3(perk)))
		{
			PERKS[PERKS.size] = perk;
		}
	}
	Total = PERKS.size;
	if(namespace_11e193f1::function_6dd41714("perks_counter") == 2)
	{
		if(isdefined(self.var_d6aef449))
		{
			Total = Total + self.var_d6aef449.size;
		}
	}
	return Total;
}

/*
	Name: function_c0c63d92
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x6418
	Size: 0x3A8
	Parameters: 0
	Flags: None
	Line Number: 1300
*/
function function_c0c63d92()
{
	self endon("disconnect");
	wait(1);
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("extras_salami_key") == 1)
	{
		self SetControllerUIModelValue("hudItems.Shitpost.SalamiKey", "on");
		self clientfield::set_player_uimodel("salami_key", 1);
		all = GetEntArray();
		foreach(ent in all)
		{
			if(ent.model == "p7_fxanim_zm_zod_summoning_key_mod")
			{
				ent SetModel("p7_fxanim_zm_zod_salami_key_mod");
			}
			if(ent.model == "p7_fxanim_zm_zod_redemption_key_ritual_mod")
			{
				ent SetModel("p7_fxanim_zm_zod_redemption_salami_key_ritual_mod");
			}
			if(ent.model == "p7_fxanim_zm_zod_summoning_key_mod_small")
			{
				ent SetModel("p7_fxanim_zm_zod_salami_key_mod_small");
			}
		}
		var_7a05a0de = GetEnt("quest_key_pickup", "targetname");
		var_7a05a0de.unitrigger_stub.prompt_and_visibility_func = &function_8f16bf43;
		level.ballWeapon = GetWeapon("salami");
		level.var_d566bdba = GetWeapon("salami_world");
		level.var_aff3334d = GetWeapon("salami_world_pass");
		level thread function_22c9dc9();
	}
	if(namespace_11e193f1::function_6dd41714("cheats_out_of_bounds") == 1)
	{
		level.var_908190f0 = 0;
		self notify("stop_player_out_of_playable_area_monitor");
	}
	if(namespace_11e193f1::function_6dd41714("cheats_too_many_weapons") == 1)
	{
		self notify("stop_player_too_many_weapons_monitor");
	}
	wait(0.1);
	if(namespace_11e193f1::function_6dd41714("Cheats_motherlode") == 1)
	{
		level.var_908190f0 = 0;
		self zm_score::add_to_player_score(50000 - self.score);
	}
	wait(1);
	if(namespace_11e193f1::function_6dd41714("Cheats_perkaholic") == 1)
	{
		level.var_908190f0 = 0;
		self zm_utility::give_player_all_perks();
	}
}

/*
	Name: function_22c9dc9
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x67C8
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 1365
*/
function function_22c9dc9()
{
	while(1)
	{
		ents = GetEntArray();
		for(i = 0; i < ents.size; i++)
		{
			if(isdefined(ents[i].model) && ents[i].model == "veh_t7_zhd_robot_0")
			{
				ents[i] SetModel("veh_t7_zhd_robot_0_curse");
			}
			if(isdefined(ents[i].model) && ents[i].model == "veh_t7_zhd_robot_1")
			{
				ents[i] SetModel("veh_t7_zhd_robot_2_curse");
			}
			if(isdefined(ents[i].model) && ents[i].model == "veh_t7_zhd_robot_2")
			{
				ents[i] SetModel("veh_t7_zhd_robot_1_curse");
			}
			wait(0.01);
		}
		wait(1);
	}
}

/*
	Name: function_6101825e
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x6950
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 1400
*/
function function_6101825e()
{
	level flag::wait_till("reap_collection_loaded");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(namespace_11e193f1::function_6dd41714("perks_icon_style") == 1)
		{
			players[i] SetControllerUIModelValue("hudItems.ReapPerks.PerkIconStyle", "_soe");
		}
		if(namespace_11e193f1::function_6dd41714("perks_icon_style") == 2)
		{
			players[i] SetControllerUIModelValue("hudItems.ReapPerks.PerkIconStyle", "_bo1");
		}
		if(namespace_11e193f1::function_6dd41714("perks_icon_style") == 3)
		{
			players[i] SetControllerUIModelValue("hudItems.ReapPerks.PerkIconStyle", "_bo2");
		}
		if(namespace_11e193f1::function_6dd41714("perks_icon_style") == 4)
		{
			players[i] SetControllerUIModelValue("hudItems.ReapPerks.PerkIconStyle", "_kf2");
			players[i] SetControllerUIModelValue("hudItems.ReapPerks.PerkIconStyleOverlay", "_kf2");
		}
		if(namespace_11e193f1::function_6dd41714("perks_icon_style") == 5)
		{
			players[i] SetControllerUIModelValue("hudItems.ReapPerks.PerkIconStyle", "_vg");
			players[i] SetControllerUIModelValue("hudItems.ReapPerks.PerkIconStyleOverlay", "_vg");
		}
	}
}

/*
	Name: function_8f16bf43
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x6BB8
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 1441
*/
function function_8f16bf43(player)
{
	b_is_invis = isdefined(player.beastmode) && player.beastmode || (!(isdefined(level.var_c913a45f) && level.var_c913a45f));
	self setinvisibletoplayer(player, b_is_invis);
	self setHintString("Hold [{+activate}] to Pick Up the Salami Key...");
	return !b_is_invis;
}

/*
	Name: on_player_connect
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x6C60
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1459
*/
function on_player_connect()
{
	level.player_too_many_players_check = 0;
	level.player_too_many_players_check_func = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c1a41461
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x6C88
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1477
*/
function function_c1a41461()
{
	while(1)
	{
		self waittill("perk_purchased", perk);
		if(perk == "specialty_additionalprimaryweapon" && namespace_11e193f1::function_6dd41714("perks_cw_machine") == 1)
		{
			machine = GetEntArray("vending_additionalprimaryweapon", "targetname");
			for(i = 0; i < machine.size; i++)
			{
				machine[i] thread function_49d3d495(self);
			}
		}
	}
}

/*
	Name: function_f56a5552
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x6D60
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 1503
*/
function function_f56a5552(weap_class)
{
	guns = [];
	keys = Array::randomize(getArrayKeys(level.zombie_weapons));
	for(i = 0; i < keys.size; i++)
	{
		if(isdefined(weap_class))
		{
			if(keys[i].weapClass == weap_class && !zm_weapons::is_weapon_upgraded(keys[i]))
			{
				if(weap_class == "rifle")
				{
					if(!keys[i].isSniperWeapon)
					{
						guns[guns.size] = keys[i];
					}
				}
				else
				{
					guns[guns.size] = keys[i];
				}
			}
		}
		if(!isdefined(weap_class))
		{
			can = 1;
			if(!zm_weapons::get_is_in_box(keys[i]))
			{
				can = 0;
			}
			if(can)
			{
				guns[guns.size] = keys[i];
			}
		}
	}
	return guns[RandomInt(guns.size)];
}

/*
	Name: function_49d3d495
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x6F08
	Size: 0x570
	Parameters: 1
	Flags: None
	Line Number: 1552
*/
function function_49d3d495(player)
{
	if(!isdefined(level.var_160e9eab))
	{
		level.var_160e9eab = function_f56a5552("smg");
	}
	if(!isdefined(level.var_160e9eab))
	{
		level.var_160e9eab = function_f56a5552("rifle");
	}
	if(!isdefined(level.var_160e9eab))
	{
		level.var_160e9eab = function_f56a5552();
	}
	if(isdefined(level.var_af43edac))
	{
		return;
	}
	var_b2cededf = struct::get_array("da_mule_kick_gun_handgun", "targetname");
	snipers = struct::get_array("da_mule_kick_gun_sniper", "targetname");
	rifles = struct::get_array("da_mule_kick_gun_rifle", "targetname");
	shotguns = struct::get_array("da_mule_kick_gun_shotgun", "targetname");
	level.var_af43edac = 1;
	wait(0.1);
	self thread function_2e30e80b(var_b2cededf, player);
	wait(0.6);
	self thread function_2e30e80b(shotguns, player);
	wait(0.4);
	self thread function_2e30e80b(shotguns, player);
	wait(0.2);
	self thread function_2e30e80b(snipers, player);
	wait(0.4);
	self thread function_2e30e80b(var_b2cededf, player);
	wait(0.2);
	self thread function_2e30e80b(var_b2cededf, player);
	wait(0.2);
	self thread function_2e30e80b(var_b2cededf, player);
	wait(1);
	self thread function_2e30e80b(rifles, player);
	wait(0.5);
	self thread function_2e30e80b(var_b2cededf, player);
	wait(0.1);
	self thread function_2e30e80b(rifles, player);
	wait(0.1);
	self thread function_2e30e80b(shotguns, player);
	wait(0.1);
	self thread function_2e30e80b(shotguns, player);
	wait(0.2);
	self thread function_2e30e80b(rifles, player);
	wait(0.1);
	self thread function_2e30e80b(rifles, player);
	wait(0.1);
	self thread function_2e30e80b(rifles, player);
	wait(0.1);
	self thread function_2e30e80b(rifles, player);
	wait(0.1);
	self thread function_2e30e80b(rifles, player);
	wait(0.1);
	self thread function_2e30e80b(rifles, player);
	wait(0.1);
	self thread function_2e30e80b(rifles, player);
	wait(1);
	self thread function_2e30e80b(var_b2cededf, player);
	self thread function_2e30e80b(snipers, player);
	self thread function_2e30e80b(rifles, player);
	self thread function_2e30e80b(shotguns, player);
	wait(0.2);
	self thread function_2e30e80b(var_b2cededf, player);
	self thread function_2e30e80b(snipers, player);
	self thread function_2e30e80b(rifles, player);
	self thread function_2e30e80b(shotguns, player);
	level.var_af43edac = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2e30e80b
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x7480
	Size: 0x2E0
	Parameters: 2
	Flags: None
	Line Number: 1638
*/
function function_2e30e80b(gun_structs, player)
{
	foreach(var_4dd79e2c in gun_structs)
	{
		orig = var_4dd79e2c.origin;
		playFX("reaps_cz_da_machines/reap_cz_da_mule_gun", orig, var_4dd79e2c.angles);
		var_3b5c06aa = orig + VectorScale(AnglesToForward(var_4dd79e2c.angles), 60) + VectorScale((0, 0, 1), 10);
		self playsound("da_mule_kick_gun_fire");
	}
	var_8b625ba2 = gun_structs[RandomInt(gun_structs.size)];
	a_zombies = zombie_utility::get_round_enemy_array();
	a_zombies = util::get_array_of_closest(var_8b625ba2.origin, a_zombies, undefined, undefined, 800);
	a_zombies = Array::randomize(a_zombies);
	for(i = 0; i < gun_structs.size; i++)
	{
		if(isalive(player) && isalive(a_zombies[i]))
		{
			wait(0.01);
			trace = bullettrace(var_8b625ba2.origin, a_zombies[i].origin + VectorScale((0, 0, 1), 40), 1, undefined);
			a_zombies[i] DoDamage(Int(a_zombies[i].maxhealth / 2), var_8b625ba2.origin, player, player, "none");
		}
	}
}

/*
	Name: Zombie_Counter
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x7768
	Size: 0x448
	Parameters: 0
	Flags: None
	Line Number: 1672
*/
function Zombie_Counter()
{
	level.var_f28416b = namespace_851dc78f::function_122a9928("right", "bottom", "center", "bottom", -20, 0, 1, (1, 1, 1), undefined, 1.5, undefined, 1);
	level.var_ebd5508c = namespace_851dc78f::function_122a9928("left", "bottom", "center", "bottom", -16, 0, 1, (1, 1, 1), "ZOMBIES LEFT", 1.5);
	pos = namespace_11e193f1::function_6dd41714("extras_zombie_counter");
	if(pos == 1)
	{
		level.var_f28416b.horzAlign = "left";
		level.var_f28416b.vertAlign = "top";
		level.var_f28416b.alignY = "top";
		level.var_f28416b.x = level.var_f28416b.x + 39;
		level.var_ebd5508c.horzAlign = "left";
		level.var_ebd5508c.vertAlign = "top";
		level.var_ebd5508c.alignY = "top";
		level.var_ebd5508c.x = level.var_ebd5508c.x + 39;
	}
	if(pos == 2)
	{
		level.var_f28416b.vertAlign = "top";
		level.var_ebd5508c.vertAlign = "top";
		level.var_f28416b.alignY = "top";
		level.var_ebd5508c.alignY = "top";
	}
	if(pos == 3)
	{
		level.var_f28416b.horzAlign = "right";
		level.var_f28416b.vertAlign = "top";
		level.var_f28416b.alignY = "top";
		level.var_f28416b.x = level.var_f28416b.x - 62;
		level.var_ebd5508c.horzAlign = "right";
		level.var_ebd5508c.vertAlign = "top";
		level.var_ebd5508c.alignY = "top";
		level.var_ebd5508c.x = level.var_ebd5508c.x - 62;
	}
	if(pos == 4)
	{
		level.var_f28416b.horzAlign = "left";
		level.var_ebd5508c.horzAlign = "left";
		level.var_f28416b.x = level.var_f28416b.x + 39;
		level.var_ebd5508c.x = level.var_ebd5508c.x + 39;
	}
	if(pos == 6)
	{
		level.var_f28416b.horzAlign = "right";
		level.var_ebd5508c.horzAlign = "right";
		level.var_f28416b.x = level.var_f28416b.x - 62;
		level.var_ebd5508c.x = level.var_ebd5508c.x - 62;
	}
	level.var_f28416b thread function_b9e60166();
}

/*
	Name: function_b9e60166
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x7BB8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 1733
*/
function function_b9e60166()
{
	while(1)
	{
		num = level.zombie_total;
		num = num + zombie_utility::get_current_zombie_count();
		self setValue(num);
		wait(0.5);
	}
}

/*
	Name: hitmarker
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x7C20
	Size: 0x120
	Parameters: 13
	Flags: None
	Line Number: 1754
*/
function hitmarker(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(level flag::exists("reap_collection_loaded") && !level flag::get("reap_collection_loaded"))
	{
		return;
	}
	if(isdefined(e_player) && isPlayer(e_player) && namespace_11e193f1::function_6dd41714("extras_hitmarker") == 1)
	{
		e_player thread damagefeedback::update_override("collect_icon_hitmark", "reap_hitmark");
	}
	return 0;
}

/*
	Name: function_5adbafc9
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x7D48
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1777
*/
function function_5adbafc9(e_player)
{
	if(isdefined(e_player) && isPlayer(e_player) && namespace_11e193f1::function_6dd41714("extras_hitmarker") == 1)
	{
		e_player thread damagefeedback::update_override("collect_icon_hitmark_death", "reap_hitmark");
		return;
	}
}

/*
	Name: function_a8a620d5
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x7DC8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1796
*/
function function_a8a620d5()
{
	wait(1);
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("gamemode_poa_enabled") == 0)
	{
		level notify("hash_7e8b059c");
		return;
	}
	level.var_606718e6 = 20;
	if(namespace_11e193f1::function_6dd41714("gamemode_poa_kill") > 0)
	{
		level.var_606718e6 = level.var_606718e6 - Int(5 * namespace_11e193f1::function_6dd41714("gamemode_poa_kill"));
	}
	level notify("hash_d769de26");
}

/*
	Name: function_42b26d4a
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x7EA0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1823
*/
function function_42b26d4a()
{
	self endon("disconnect");
	self thread zm_equipment::show_hint_text("WELCOME TO PERKS OF ATTRITION", 3);
	wait(3.2);
	self thread zm_equipment::show_hint_text("EVERY " + level.var_606718e6 + " KILLS, A PERK IS TAKEN", 3);
	wait(3.2);
	self thread zm_equipment::show_hint_text("FIRST PLAYER TO LOSE ALL PERKS WINS!", 3);
}

/*
	Name: function_98311296
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x7F38
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 1843
*/
function function_98311296()
{
	self endon("disconnect");
	level endon("hash_7e8b059c");
	level waittill("hash_d769de26");
	while(1)
	{
		if(!isdefined(level.var_e245ed6a))
		{
			a_str_perks = getArrayKeys(level._custom_perks);
			PERKS = [];
			for(i = 0; i < a_str_perks.size; i++)
			{
				perk = a_str_perks[i];
				if(isdefined(self.perk_purchased) && self.perk_purchased == perk)
				{
					continue;
				}
				if(!namespace_851dc78f::function_20dc5a15(perk) && self hasPerk(perk) || (namespace_851dc78f::function_20dc5a15(perk) && self namespace_851dc78f::function_5f9a13b3(perk)))
				{
					PERKS[PERKS.size] = perk;
				}
			}
			if(PERKS.size < 1)
			{
				self zm_utility::give_player_all_perks();
			}
		}
		wait(1);
		level.zombie_vars["zombie_spawn_delay"] = 0.2;
		level.zombie_move_speed = 50;
	}
}

/*
	Name: function_5e5dfcd7
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x80E0
	Size: 0x400
	Parameters: 0
	Flags: None
	Line Number: 1887
*/
function function_5e5dfcd7()
{
	self endon("disconnect");
	level endon("hash_7e8b059c");
	level waittill("hash_d769de26");
	self zm_utility::give_player_all_perks();
	self thread function_42b26d4a();
	var_5052abb5 = level.var_606718e6;
	var_f710d56f = 0;
	var_baec2a17 = 0;
	if(!isdefined(self.kills))
	{
		self.kills = 0;
	}
	self thread function_a3e3b292("ReapModPOA", var_5052abb5);
	while(1)
	{
		if(self.kills > var_baec2a17)
		{
			var_5052abb5 = var_5052abb5 - self.kills - var_baec2a17;
			var_baec2a17 = self.kills;
			self thread function_a3e3b292("ReapModPOA", var_5052abb5);
		}
		if(var_5052abb5 <= 0)
		{
			var_5052abb5 = level.var_606718e6;
			self thread function_a3e3b292("ReapModPOA", var_5052abb5);
			a_str_perks = getArrayKeys(level._custom_perks);
			PERKS = [];
			for(i = 0; i < a_str_perks.size; i++)
			{
				perk = a_str_perks[i];
				if(!namespace_851dc78f::function_20dc5a15(perk) && self hasPerk(perk) || (namespace_851dc78f::function_20dc5a15(perk) && self namespace_851dc78f::function_5f9a13b3(perk)))
				{
					PERKS[PERKS.size] = perk;
				}
			}
			var_8c796a39 = PERKS[RandomInt(PERKS.size)];
			var_6cda2dc6 = 0;
			if(namespace_11e193f1::function_6dd41714("gamemode_poa_adv") && self namespace_851dc78f::function_b690a849(var_8c796a39))
			{
				self thread namespace_4b6e359c::function_75aa16e4(var_8c796a39, level.var_7280bfd8[var_8c796a39].clientfield_name, "overlayStyle", 0);
				if(!isdefined(self.var_d6aef449))
				{
					self.var_d6aef449 = [];
				}
				self.var_d6aef449[var_8c796a39] = undefined;
				var_6cda2dc6 = 1;
				self IPrintLnBold("LOST " + function_2f134368(var_8c796a39) + " DOUBLE BUY");
			}
			else
			{
				self namespace_851dc78f::function_c65ada05(var_8c796a39);
				self IPrintLnBold("LOST " + function_2f134368(var_8c796a39));
			}
			if(PERKS.size <= 1 && !var_6cda2dc6)
			{
				level thread function_54d8c462(self);
				level.var_e245ed6a = 1;
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_2f134368
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x84E8
	Size: 0x4B8
	Parameters: 1
	Flags: None
	Line Number: 1962
*/
function function_2f134368(var_8c796a39)
{
	text = "UNKNOWN PERK";
	switch(var_8c796a39)
	{
		case "specialty_armorvest":
		{
			text = "JUGGER-NOG";
			break;
		}
		case "specialty_quickrevive":
		{
			text = "QUICK REVIVE";
			break;
		}
		case "specialty_fastreload":
		{
			text = "SPEED COLA";
			break;
		}
		case "specialty_doubletap2":
		{
			text = "DOUBLE TAP 2.0";
			break;
		}
		case "specialty_staminup":
		{
			text = "STAMIN-UP";
			break;
		}
		case "specialty_da_phd_slider":
		case "specialty_phdflopper":
		{
			text = "PHD FLOPPER";
			break;
		}
		case "specialty_deadshot":
		{
			text = "DEADSHOT";
			break;
		}
		case "specialty_additionalprimaryweapon":
		{
			text = "MULE KICK";
			break;
		}
		case "specialty_electriccherry":
		{
			text = "ELECTRIC CHERRY";
			break;
		}
		case "specialty_da_tombstone":
		case "specialty_tombstone":
		{
			text = "TOMBSTONE";
			break;
		}
		case "specialty_vulture":
		case "specialty_vultureaid":
		{
			text = "VULTURE AID";
			break;
		}
		case "specialty_widowswine":
		{
			text = "WIDOWS WINE";
			break;
		}
		case "specialty_elementalpop":
		{
			text = "ELEMENTAL POP";
			break;
		}
		case "specialty_bandolier":
		{
			text = "BANDOLIER BANDIT";
			break;
		}
		case "specialty_blazephase":
		{
			text = "BLAZE PHASE";
			break;
		}
		case "specialty_bloodwolf":
		{
			text = "BLOOD WOLF BITE";
			break;
		}
		case "specialty_da_death_perception":
		{
			text = "DEATH PERCEPTION";
			break;
		}
		case "specialty_dyingwish":
		{
			text = "DYING WISH";
			break;
		}
		case "specialty_razor":
		{
			text = "ETHERIAL RAZOR";
			break;
		}
		case "specialty_slider":
		{
			text = "PHD SLIDER";
			break;
		}
		case "specialty_stronghold":
		{
			text = "STONE COLD STRONGHOLD";
			break;
		}
		case "specialty_timeslip":
		{
			text = "TIME SLIP";
			break;
		}
		case "specialty_victorious":
		{
			text = "VICTORIOUS TORTOISE";
			break;
		}
		case "specialty_winterwail":
		{
			text = "WINTERS WAIL";
			break;
		}
		case "specialty_zombshell":
		{
			text = "ZOMBSHELL";
			break;
		}
		case "specialty_bloodbullets":
		{
			text = "BLOOD BULLETS";
			break;
		}
		case "specialty_cashback":
		{
			text = "CASHBACK COCKTAIL";
			break;
		}
		case "specialty_damnade":
		{
			text = "DAM-A-NADE";
			break;
		}
		case "specialty_downersdelight":
		{
			text = "DOWNERS DELIGHT";
			break;
		}
		case "specialty_estatic":
		{
			text = "ESTATIC ELIXIR";
			break;
		}
		case "specialty_inferno":
		{
			text = "INCINER-BRANDY";
			break;
		}
		case "specialty_magnet":
		{
			text = "MAGNET MARGARITA";
			break;
		}
		case "specialty_mh_mocha":
		{
			text = "MIRICLE HANDS MOCHA";
			break;
		}
		case "specialty_nitrogen":
		{
			text = "NITROGEN COOLED";
			break;
		}
		case "specialty_nukacola":
		{
			text = "NUKA COLA";
			break;
		}
		case "specialty_packbox":
		{
			text = "PACK-A-BOX";
			break;
		}
		case "specialty_point":
		{
			text = "POINT CRUSHER";
			break;
		}
		case "specialty_swarmscotch":
		{
			text = "SWARM SCOTCH";
			break;
		}
		case "specialty_ffyl":
		{
			text = "FIGHTERS FIZZ";
			break;
		}
		case "specialty_icu":
		{
			text = "I.C.U";
			break;
		}
		case "specialty_milk":
		{
			text = "MUSCLE MILK";
			break;
		}
		case "specialty_tactiquilla":
		{
			text = "TACTIQUILLA SANGRI";
			break;
		}
		case "specialty_bull_ice":
		{
			text = "BULL ICE BLAST";
			break;
		}
		case "specialty_changechews":
		{
			text = "CHANGE CHEWS";
			break;
		}
		case "specialty_moonshine":
		{
			text = "MADGAZ MOONSHINE";
			break;
		}
		case "specialty_banana":
		{
			text = "BANANA COLADA";
			break;
		}
		case "specialty_crusade":
		{
			text = "CRUSADERS ALE";
			break;
		}
	}
	return text;
	ERROR: Bad function call
}

/*
	Name: function_54d8c462
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x89A8
	Size: 0xD78
	Parameters: 1
	Flags: None
	Line Number: 2220
*/
function function_54d8c462(winner)
{
	SetMatchFlag("game_ended", 1);
	level clientfield::set("gameplay_started", 0);
	level clientfield::set("game_end_time", Int(GetTime() - level.n_gameplay_start_time + 500 / 1000));
	util::clientNotify("zesn");
	level thread zm_audio::sndmusicsystem_playstate("game_over");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] clientfield::set("zmbLastStand", 0);
	}
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i].reviveTextHud))
		{
			players[i].reviveTextHud destroy();
		}
	}
	StopAllRumbles();
	level.intermission = 1;
	level.zombie_vars["zombie_powerup_insta_kill_time"] = 0;
	level.zombie_vars["zombie_powerup_fire_sale_time"] = 0;
	level.zombie_vars["zombie_powerup_double_points_time"] = 0;
	wait(0.1);
	game_over = [];
	survived = [];
	players = GetPlayers();
	SetMatchFlag("disableIngameMenu", 1);
	foreach(player in players)
	{
		player closeInGameMenu();
		player CloseMenu("StartMenu_Main");
	}
	foreach(player in players)
	{
		player SetDStat("AfterActionReportStats", "lobbyPopup", "summary");
	}
	for(i = 0; i < players.size; i++)
	{
		game_over[i] = newClientHudElem(players[i]);
		survived[i] = newClientHudElem(players[i]);
		game_over[i].alignX = "center";
		game_over[i].alignY = "middle";
		game_over[i].horzAlign = "center";
		game_over[i].vertAlign = "middle";
		game_over[i].y = game_over[i].y - 130;
		game_over[i].foreground = 1;
		game_over[i].fontscale = 3;
		game_over[i].alpha = 0;
		game_over[i].color = (1, 1, 1);
		game_over[i].hidewheninmenu = 1;
		game_over[i] setText(winner.name + " HAS WON!");
		game_over[i] fadeOverTime(1);
		game_over[i].alpha = 1;
		if(players[i] IsSplitscreen())
		{
			game_over[i].fontscale = 2;
			game_over[i].y = game_over[i].y + 40;
		}
		survived[i].alignX = "center";
		survived[i].alignY = "middle";
		survived[i].horzAlign = "center";
		survived[i].vertAlign = "middle";
		survived[i].y = survived[i].y - 100;
		survived[i].foreground = 1;
		survived[i].fontscale = 2;
		survived[i].alpha = 0;
		survived[i].color = (1, 1, 1);
		survived[i].hidewheninmenu = 1;
		if(players[i] IsSplitscreen())
		{
			survived[i].fontscale = 1.5;
			survived[i].y = survived[i].y + 40;
		}
		if(level.round_number < 2)
		{
			if(level.script == "zm_moon")
			{
				if(!isdefined(level.left_nomans_land))
				{
					nomanslandtime = level.nml_best_time;
					player_survival_time = Int(nomanslandtime / 1000);
					player_survival_time_in_mins = zm::to_mins(player_survival_time);
					survived[i] setText(&"ZOMBIE_SURVIVED_NOMANS", player_survival_time_in_mins);
				}
				else if(level.left_nomans_land == 2)
				{
					survived[i] setText(&"ZOMBIE_SURVIVED_ROUND");
				}
			}
			else
			{
				survived[i] setText(&"ZOMBIE_SURVIVED_ROUND");
			}
		}
		else
		{
			survived[i] setText(&"ZOMBIE_SURVIVED_ROUNDS", level.round_number);
		}
		survived[i] fadeOverTime(1);
		survived[i].alpha = 1;
	}
	LUINotifyEvent(&"force_scoreboard", 1, 1);
	for(i = 0; i < players.size; i++)
	{
		players[i] setClientUIVisibilityFlag("weapon_hud_visible", 0);
		players[i] SetClientMiniScoreboardHide(1);
	}
	if(isdefined(level.custom_end_screen))
	{
		level [[level.custom_end_screen]]();
	}
	for(i = 0; i < players.size; i++)
	{
		players[i] setClientUIVisibilityFlag("weapon_hud_visible", 0);
		players[i] SetClientMiniScoreboardHide(1);
		players[i] notify("report_bgb_consumption");
		players[i] zm_utility::zm_dash_stats_game_end();
	}
	recordGameResult("draw");
	if(SessionModeIsOnlineGame())
	{
		level thread zm_utility::upload_zm_dash_counters_end_game();
	}
	finalizeMatchRecord();
	players = GetPlayers();
	foreach(player in players)
	{
		if(isdefined(player.sessionstate) && player.sessionstate == "spectator")
		{
			player.sessionstate = "playing";
			player thread zm::end_game_player_was_spectator();
		}
	}
	wait(0.05);
	players = GetPlayers();
	LUINotifyEvent(&"force_scoreboard", 1, 1);
	zm::intermission();
	wait(level.zombie_vars["zombie_intermission_time"]);
	if(!isdefined(level._supress_survived_screen))
	{
		for(i = 0; i < players.size; i++)
		{
			survived[i] destroy();
			game_over[i] destroy();
		}
	}
	else
	{
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(players[i].survived_hud))
			{
				players[i].survived_hud destroy();
			}
			if(isdefined(players[i].game_over_hud))
			{
				players[i].game_over_hud destroy();
			}
		}
	}
	level notify("stop_intermission");
	Array::thread_all(GetPlayers(), &zm::player_exit_level);
	wait(1.5);
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] CameraActivate(0);
	}
	exitLevel(0);
	wait(666);
}

/*
	Name: function_f218f8f2
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x9728
	Size: 0x9E0
	Parameters: 0
	Flags: None
	Line Number: 2404
*/
function function_f218f8f2()
{
	level endon("game_ended");
	wait(1);
	level flag::wait_till("reap_collection_loaded");
	var_1960b2fb = namespace_11e193f1::function_6dd41714("gamemode_gungame");
	if(var_1960b2fb > 0)
	{
		level.var_63e52823 = [];
		var_efbfef34 = [];
		rifles = [];
		snipers = [];
		SMGs = [];
		LMGs = [];
		pistols = [];
		shotgun = [];
		launchers = [];
		wonder = [];
		var_18b43294 = [];
		var_7b107314 = [];
		var_77be8409 = [];
		var_61bd21f9 = [];
		var_a1551b3a = [];
		var_184f08dd = [];
		var_f924a6a3 = [];
		var_93cbe1b4 = [];
		var_d635656c = [];
		keys = getArrayKeys(level.zombie_weapons);
		for(i = 0; i < keys.size; i++)
		{
			if(keys[i] == level.weaponNone || keys[i].isFlourishWeapon || zm_utility::is_melee_weapon(keys[i]) || zm_utility::is_placeable_mine(keys[i]) || zm_utility::is_lethal_grenade(keys[i]) || zm_utility::is_tactical_grenade(keys[i]) || keys[i].isHeroWeapon || keys[i].isgadget)
			{
				continue;
			}
			gun = zm_weapons::get_base_weapon(keys[i]);
			gun = GetWeapon(gun.rootweapon.name);
			if(isdefined(level.a_elemental_staffs_upgraded["staff_air_upgraded"].w_weapon))
			{
				if(gun == level.a_elemental_staffs_upgraded["staff_air_upgraded"].w_weapon || gun == level.a_elemental_staffs_upgraded["staff_fire_upgraded"].w_weapon || gun == level.a_elemental_staffs_upgraded["staff_lightning_upgraded"].w_weapon || gun == level.a_elemental_staffs_upgraded["staff_water_upgraded"].w_weapon)
				{
					continue;
				}
			}
			upgraded = undefined;
			if(zm_weapons::can_upgrade_weapon(gun))
			{
				upgraded = zm_weapons::get_upgrade_weapon(gun);
			}
			weapClass = gun.weapClass;
			if(level.start_weapon == gun || gun.name == "pistol_standard")
			{
				if(isdefined(upgraded))
				{
					var_18b43294[var_18b43294.size] = upgraded;
				}
				var_efbfef34[var_efbfef34.size] = gun;
				continue;
			}
			if(zm_weapons::is_wonder_weapon(gun))
			{
				if(isdefined(upgraded))
				{
					var_d635656c[var_d635656c.size] = upgraded;
				}
				wonder[wonder.size] = gun;
				continue;
			}
			if(weapClass == "rifle")
			{
				if(gun.isSniperWeapon)
				{
					if(isdefined(upgraded))
					{
						var_77be8409[var_77be8409.size] = upgraded;
					}
					snipers[snipers.size] = gun;
				}
				else if(isdefined(upgraded))
				{
					var_7b107314[var_7b107314.size] = upgraded;
				}
				rifles[rifles.size] = gun;
				continue;
			}
			if(weapClass == "pistol" || weapClass == "pistolspread" || weapClass == "pistol spread")
			{
				if(isdefined(upgraded))
				{
					var_184f08dd[var_184f08dd.size] = upgraded;
				}
				pistols[pistols.size] = gun;
				continue;
			}
			if(weapClass == "mg")
			{
				if(isdefined(upgraded))
				{
					var_a1551b3a[var_a1551b3a.size] = upgraded;
				}
				LMGs[LMGs.size] = gun;
				continue;
			}
			if(weapClass == "smg")
			{
				if(isdefined(upgraded))
				{
					var_61bd21f9[var_61bd21f9.size] = upgraded;
				}
				SMGs[SMGs.size] = gun;
				continue;
			}
			if(weapClass == "spread")
			{
				if(isdefined(upgraded))
				{
					var_f924a6a3[var_f924a6a3.size] = upgraded;
				}
				shotgun[shotgun.size] = gun;
				continue;
			}
			if(weapClass == "rocketlauncher")
			{
				if(isdefined(upgraded))
				{
					var_93cbe1b4[var_93cbe1b4.size] = upgraded;
				}
				launchers[launchers.size] = gun;
			}
		}
		level.var_63e52823 = ArrayCombine(level.var_63e52823, var_efbfef34, 0, 0);
		level.var_63e52823 = ArrayCombine(level.var_63e52823, pistols, 0, 0);
		level.var_63e52823 = ArrayCombine(level.var_63e52823, SMGs, 0, 0);
		level.var_63e52823 = ArrayCombine(level.var_63e52823, launchers, 0, 0);
		level.var_63e52823 = ArrayCombine(level.var_63e52823, shotgun, 0, 0);
		level.var_63e52823 = ArrayCombine(level.var_63e52823, snipers, 0, 0);
		level.var_63e52823 = ArrayCombine(level.var_63e52823, rifles, 0, 0);
		level.var_63e52823 = ArrayCombine(level.var_63e52823, LMGs, 0, 0);
		level.var_63e52823 = ArrayCombine(level.var_63e52823, wonder, 0, 0);
		if(var_1960b2fb == 3 || var_1960b2fb == 4)
		{
			level.var_63e52823 = ArrayCombine(level.var_63e52823, var_18b43294, 0, 0);
			level.var_63e52823 = ArrayCombine(level.var_63e52823, var_184f08dd, 0, 0);
			level.var_63e52823 = ArrayCombine(level.var_63e52823, var_61bd21f9, 0, 0);
			level.var_63e52823 = ArrayCombine(level.var_63e52823, var_93cbe1b4, 0, 0);
			level.var_63e52823 = ArrayCombine(level.var_63e52823, var_f924a6a3, 0, 0);
			level.var_63e52823 = ArrayCombine(level.var_63e52823, var_77be8409, 0, 0);
			level.var_63e52823 = ArrayCombine(level.var_63e52823, var_7b107314, 0, 0);
			level.var_63e52823 = ArrayCombine(level.var_63e52823, var_a1551b3a, 0, 0);
			level.var_63e52823 = ArrayCombine(level.var_63e52823, var_d635656c, 0, 0);
		}
		level.var_6a92c1f = 1;
	}
	else
	{
		level notify("hash_380e7ae8");
	}
}

/*
	Name: function_f87b6e11
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0xA110
	Size: 0x4B8
	Parameters: 0
	Flags: None
	Line Number: 2572
*/
function function_f87b6e11()
{
	self endon("disconnect");
	level endon("hash_380e7ae8");
	level endon("game_ended");
	self notify("hash_f87b6e11");
	self endon("hash_f87b6e11");
	wait(1);
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("gamemode_gungame") > 0)
	{
		var_1960b2fb = namespace_11e193f1::function_6dd41714("gamemode_gungame");
		wait(0.1);
		while(!isdefined(level.var_6a92c1f))
		{
			wait(0.1);
		}
		if(!isdefined(self.var_d3500780))
		{
			self.var_d3500780 = 0;
		}
		self thread function_2fd1c64(level.var_63e52823[self.var_d3500780]);
		self.var_bc9cb71 = 0;
		self thread function_a3e3b292("ReapModGungameGunMax", level.var_63e52823.size);
		while(1)
		{
			if(var_1960b2fb == 1 || var_1960b2fb == 3)
			{
				var_26aafa78 = 250 + 250 * self.var_d3500780;
				if(level.var_63e52823.size > 25)
				{
					var_26aafa78 = 200 + 200 * self.var_d3500780;
				}
				if(level.var_63e52823.size > 45)
				{
					var_26aafa78 = 150 + 150 * self.var_d3500780;
				}
				if(level.var_63e52823.size > 65)
				{
					var_26aafa78 = 100 + 100 * self.var_d3500780;
				}
				if(var_26aafa78 > 3000)
				{
					var_26aafa78 = 3000;
				}
			}
			else
			{
				var_26aafa78 = 2 + 3 * self.var_d3500780;
				if(level.var_63e52823.size > 25)
				{
					var_26aafa78 = 2 + 2 * self.var_d3500780;
				}
				if(level.var_63e52823.size > 45)
				{
					var_26aafa78 = 2 + 1 * self.var_d3500780;
				}
				if(level.var_63e52823.size > 65)
				{
					var_26aafa78 = 2 + Int(0.5 * self.var_d3500780);
				}
				if(var_26aafa78 > 25)
				{
					var_26aafa78 = 25;
				}
			}
			while(self.var_bc9cb71 < var_26aafa78)
			{
				self thread function_a3e3b292("ReapModGungameGun", self.var_d3500780 + 1);
				if(var_1960b2fb == 1 || var_1960b2fb == 3)
				{
					self thread function_a3e3b292("ReapModGungameScore", var_26aafa78 - self.var_bc9cb71);
					if(!isdefined(self.var_8c4f9297))
					{
						self.var_8c4f9297 = self.score;
					}
					if(self.score > self.var_8c4f9297)
					{
						self.var_bc9cb71 = self.var_bc9cb71 + self.score - self.var_8c4f9297;
					}
					self.var_8c4f9297 = self.score;
					wait(0.1);
				}
				else
				{
					self thread function_a3e3b292("ReapModGungameKills", var_26aafa78 - self.var_bc9cb71);
					self waittill("zom_kill");
					self.var_bc9cb71++;
				}
				self thread function_a3e3b292("ReapModGungameGun", level.var_63e52823.size - self.var_d3500780);
			}
			self.var_bc9cb71 = 0;
			self.var_d3500780 = self.var_d3500780 + 1;
			if(self.var_d3500780 >= level.var_63e52823.size)
			{
				level thread function_54d8c462(self);
			}
			else
			{
				self thread function_2fd1c64(level.var_63e52823[self.var_d3500780]);
			}
		}
	}
}

/*
	Name: function_2fd1c64
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0xA5D0
	Size: 0x380
	Parameters: 1
	Flags: None
	Line Number: 2687
*/
function function_2fd1c64(gun)
{
	self endon("disconnect");
	self notify("hash_2fd1c64");
	self endon("hash_2fd1c64");
	upgrade = zm_weapons::get_upgrade_weapon(gun);
	while(1)
	{
		current_weapon = self zm_weapons::switch_from_alt_weapon(self GetCurrentWeapon());
		has = 0;
		if(current_weapon.name == gun.name)
		{
			has = 1;
		}
		if(current_weapon.name == upgrade.name)
		{
			has = 1;
		}
		if(IsSubStr(current_weapon.name, gun.name) || IsSubStr(current_weapon.name, upgrade.name))
		{
			has = 1;
		}
		if(IsSubStr(gun.name, current_weapon.name) || IsSubStr(upgrade.name, current_weapon.name))
		{
			has = 1;
		}
		if(!has)
		{
			if(self namespace_851dc78f::function_1275e2ff())
			{
				primaryWeapons = self getweaponslistprimaries();
				for(i = 0; i < primaryWeapons.size; i++)
				{
					self TakeWeapon(primaryWeapons[i]);
				}
				weap = self zm_weapons::weapon_give(gun);
				self SwitchToWeaponImmediate(weap);
			}
		}
		else if(current_weapon.maxAmmo == 0)
		{
			if(current_weapon == upgrade)
			{
				self SetWeaponAmmoClip(upgrade, upgrade.clipSize);
			}
			else
			{
				self SetWeaponAmmoClip(gun, gun.clipSize);
			}
		}
		else if(current_weapon == upgrade)
		{
			self SetWeaponAmmoStock(upgrade, upgrade.maxAmmo - upgrade.clipSize);
		}
		else
		{
			self SetWeaponAmmoStock(gun, gun.maxAmmo - gun.clipSize);
		}
		wait(0.5);
	}
}

/*
	Name: function_a1e5f2f1
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0xA958
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2759
*/
function function_a1e5f2f1()
{
	return;
	~;
}

/*
	Name: function_77e44723
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0xA968
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 2775
*/
function function_77e44723()
{
	self endon("disconnect");
	wait(1);
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("gamemode_onehit") > 0)
	{
		while(1)
		{
			if(self.maxhealth != 60 && self hasPerk("specialty_armorvest"))
			{
				self.maxhealth = 60;
				self.health = 60;
			}
			else if(self.maxhealth != 40)
			{
				self.maxhealth = 40;
				self.health = 40;
			}
			wait(0.1);
		}
	}
}

/*
	Name: aim_assist
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0xAA50
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 2809
*/
function aim_assist()
{
	wait(1);
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("gamemode_aimassist") > 0)
	{
		level.var_74c94a8d = namespace_11e193f1::function_6dd41714("gamemode_aimassist");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_6924b983
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0xAAC0
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 2831
*/
function function_6924b983()
{
	self endon("disconnect");
	self notify("hash_6924b983");
	self endon("hash_6924b983");
	wait(1);
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("gamemode_aimassist") > 0)
	{
		while(!isdefined(level.var_74c94a8d))
		{
			wait(0.1);
		}
		if(!isdefined(self.var_49e79448))
		{
			self.var_49e79448 = [];
		}
		if(!IsInArray(self.var_49e79448, &function_b9f89fc8))
		{
			self.var_49e79448[self.var_49e79448.size] = &function_b9f89fc8;
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b9f89fc8
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0xABB0
	Size: 0x4C0
	Parameters: 0
	Flags: None
	Line Number: 2867
*/
function function_b9f89fc8()
{
	if(!isdefined(self.var_d7e7080b))
	{
		self.var_d7e7080b = 0;
	}
	if(self PlayerAds() > 0.3)
	{
		if(!self.var_d7e7080b || level.var_74c94a8d == 2)
		{
			self.var_d7e7080b = 1;
			range = 450;
			tag = "J_SpineUpper";
			var_6b6b1bbe = "j_head";
			gun = self GetCurrentWeapon();
			if(gun.weapClass == "spread")
			{
				range = range * 0.6;
			}
			if(gun.weapClass == "pistol" || gun.weapClass == "pistolspread" || gun.weapClass == "pistol spread")
			{
				range = range * 0.8;
			}
			if(gun.isSniperWeapon)
			{
				range = range * 1.4;
			}
			if(gun.weapClass == "mg")
			{
				range = range * 1.2;
			}
			if(level.var_74c94a8d == 2)
			{
				range = range * 3;
			}
			var_4fedf3c1 = undefined;
			a_ai = GetAIArray();
			var_f3cff38c = [];
			for(i = 0; i < a_ai.size; i++)
			{
				if(isdefined(a_ai[i].aat_turned) && a_ai[i].aat_turned)
				{
					continue;
				}
				trace = bullettrace(self GetTagOrigin("j_head"), a_ai[i] GetTagOrigin(tag), 1, undefined);
				if(isdefined(trace) && isdefined(a_ai[i]) && isalive(a_ai[i]))
				{
					if(Distance(self.origin, a_ai[i].origin) < range)
					{
						var_f3cff38c[var_f3cff38c.size] = a_ai[i];
					}
				}
			}
			if(var_f3cff38c.size > 0)
			{
				var_f3cff38c = Array::get_all_closest(self.origin, var_f3cff38c, undefined, undefined, range);
				var_4fedf3c1 = var_f3cff38c[0];
				if(isdefined(var_4fedf3c1))
				{
					if(self hasPerk("specialty_deadshot") && isdefined(var_4fedf3c1 GetTagOrigin(var_6b6b1bbe)))
					{
						self SetPlayerAngles(VectorToAngles(var_4fedf3c1 GetTagOrigin(var_6b6b1bbe) - self GetTagOrigin("j_head")));
					}
					else if(isdefined(var_4fedf3c1 GetTagOrigin(tag)))
					{
						self SetPlayerAngles(VectorToAngles(var_4fedf3c1 GetTagOrigin(tag) - self GetTagOrigin("j_head")));
					}
				}
			}
		}
	}
	else if(self.var_d7e7080b)
	{
		self.var_d7e7080b = 0;
	}
}

/*
	Name: function_7302f960
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0xB078
	Size: 0x9E
	Parameters: 0
	Flags: None
	Line Number: 2954
*/
function function_7302f960()
{
	wait(1);
	level flag::wait_till("reap_collection_loaded");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] getXuid() == "1100001066eb551")
		{
			level.var_7302f960 = 1;
		}
	}
}

