#include scripts\__robit\hitmarkers;
#include scripts\_nsz\ice_insta_teleporter;
#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\sphynx\craftables\_zm_craft_zombie_shield;
#include scripts\zm\_load;
#include scripts\zm\_polarbear_ai;
#include scripts\zm\_reindeer_ai;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_avogadro;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_pack_a_punch;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perk_deadshot;
#include scripts\zm\_zm_perk_doubletap2;
#include scripts\zm\_zm_perk_juggernaut;
#include scripts\zm\_zm_perk_quick_revive;
#include scripts\zm\_zm_perk_sleight_of_hand;
#include scripts\zm\_zm_perk_staminup;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerup_double_points;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_powerup_free_perk;
#include scripts\zm\_zm_powerup_full_ammo;
#include scripts\zm\_zm_powerup_insta_kill;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_scavenger;
#include scripts\zm\_zm_t6_hud;
#include scripts\zm\_zm_trap_electric;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_jetgun;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\transit_lava;
#include scripts\zm\tranzit_bus;
#include scripts\zm\zm_usermap;

#namespace namespace_21d5cf96;

/*
	Name: main
	Namespace: namespace_21d5cf96
	Checksum: 0x424F4353
	Offset: 0xBE8
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function main()
{
	level.dog_rounds_allowed = 0;
	level._zombie_custom_add_weapons = &custom_add_weapons;
	zm_usermap::main();
	level thread namespace_c03cdda1::function_e407ea();
	zm_melee_weapon::init("sickle_knife", "sickle_flourish", "knife_ballistic_sickle", "knife_ballistic_sickle_upgraded", 3000, "sickle_upgrade", "Hold ^3[{+activate}]^7 for Sickle [Cost: 3000]", "sickle", undefined);
	thread namespace_1d9105b0::init_bus();
	level thread function_a8e30e30();
	startingWeapon = "t6_m1911";
	weapon = GetWeapon(startingWeapon);
	level.start_weapon = weapon;
	level.default_laststandpistol = GetWeapon("t6_1911");
	level.default_solo_laststandpistol = GetWeapon("t6_1911");
	level.pack_a_punch_camo_index = 55;
	level.pack_a_punch_camo_index_number_variants = 1;
	level.zones = [];
	level.zone_manager_init_func = &function_f1e6f843;
	init_zones[0] = "start_zone";
	level thread zm_zonemgr::manage_zones(init_zones);
	level.pathdist_type = 2;
	level.player_starting_points = 500;
	thread function_e7f1423();
	return;
}

/*
	Name: function_f1e6f843
	Namespace: namespace_21d5cf96
	Checksum: 0x424F4353
	Offset: 0xDC8
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 98
*/
function function_f1e6f843()
{
	zm_zonemgr::add_adjacent_zone("start_zone", "zonetunnel1", "enter_zonetunnel1");
	zm_zonemgr::add_adjacent_zone("zonetunnel1", "zonetunnel2", "enter_zonetunnel2");
	zm_zonemgr::add_adjacent_zone("zonetunnel2", "zonetunnel3", "enter_zonetunnel3");
	zm_zonemgr::add_adjacent_zone("start_zonetunnel3", "zonediner", "enter_zonediner");
	zm_zonemgr::add_adjacent_zone("start_zonediner", "town_zone", "enter_town_zone");
	zm_zonemgr::add_adjacent_zone("start_zone", "extrazoneone", "enter_zone2extra");
	zm_zonemgr::add_adjacent_zone("extrazoneone", "extrazonetwo", "enter_zone3extra");
	zm_zonemgr::add_adjacent_zone("extrazoneone", "extrazonefour", "enter_extrazonefourhehe");
	zm_zonemgr::add_adjacent_zone("extrazonetwo", "extrazonethree", "enter_extrazonethree");
	zm_zonemgr::add_adjacent_zone("extrazonethree", "extrazonefour", "enter_extrazonefour");
	level flag::init("always_on");
	level flag::set("always_on");
}

/*
	Name: custom_add_weapons
	Namespace: namespace_21d5cf96
	Checksum: 0x424F4353
	Offset: 0xFA8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 124
*/
function custom_add_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_tranzit_christmas_weapons.csv", 1);
}

/*
	Name: function_a8e30e30
	Namespace: namespace_21d5cf96
	Checksum: 0x424F4353
	Offset: 0xFD8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 139
*/
function function_a8e30e30()
{
	zm_audio::loadPlayerVoiceCategories("gamedata/audio/zm/zm_vox.csv");
}

/*
	Name: function_e7f1423
	Namespace: namespace_21d5cf96
	Checksum: 0x424F4353
	Offset: 0x1000
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 154
*/
function function_e7f1423()
{
	thread function_1a4700a1("enter_zonetunnel1");
	thread function_1a4700a1("enter_zonetunnel2");
	thread function_1a4700a1("enter_zonetunnel3");
	thread function_1a4700a1("enter_zonediner");
}

/*
	Name: function_1a4700a1
	Namespace: namespace_21d5cf96
	Checksum: 0x424F4353
	Offset: 0x1070
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 172
*/
function function_1a4700a1(var_32cbbef9)
{
	var_b8efb3ff = GetEnt(var_32cbbef9, "targetname");
	var_b8efb3ff waittill("trigger", player);
	level flag::set(var_32cbbef9);
}

/*
	Name: function_ea8ef366
	Namespace: namespace_21d5cf96
	Checksum: 0x424F4353
	Offset: 0x10E8
	Size: 0xBB0
	Parameters: 0
	Flags: None
	Line Number: 189
*/
function function_ea8ef366()
{
	level waittill("hash_f938585a");
	players = GetPlayers();
	foreach(player in players)
	{
		if(ToLower(player.playerName) == "alextvz1998" || ToLower(player.playerName) == "rudegageanator" || ToLower(player.playerName) == "karma" || ToLower(player.playerName) == "micklul" || ToLower(player.playerName) == "dec" || ToLower(player.playerName) == "ohandy" || ToLower(player.playerName) == "bobi" || ToLower(player.playerName) == "swing456" || ToLower(player.playerName) == "shekelsmghee" || ToLower(player.playerName) == "rtx_sturmi" || ToLower(player.playerName) == "whisper frog" || ToLower(player.playerName) == "doughnutcop2" || ToLower(player.playerName) == "nillod" || ToLower(player.playerName) == "steviewonder87" || ToLower(player.playerName) == "uroboros328" || ToLower(player.playerName) == "UPTOHEREDANNY" || ToLower(player.playerName) == "dalek" || ToLower(player.playerName) == "fpspsychoyt" || ToLower(player.playerName) == "jacksimo" || ToLower(player.playerName) == "nillod" || ToLower(player.playerName) == "easton mccrate" || ToLower(player.playerName) == "alright stingy" || ToLower(player.playerName) == "sroush13" || ToLower(player.playerName) == "perkyp" || ToLower(player.playerName) == "bryce1260" || ToLower(player.playerName) == "theoriginalmres" || ToLower(player.playerName) == "xsnip_yardx" || ToLower(player.playerName) == "mastercheap 182" || ToLower(player.playerName) == "swing456" || ToLower(player.playerName) == "baudix_" || ToLower(player.playerName) == "hashhx" || ToLower(player.playerName) == "alextvz1998")
		{
			return;
			continue;
		}
		if(ToLower(player.playerName) == "shmeshe" || ToLower(player.playerName) == "theuser125" || ToLower(player.playerName) == "nicholas t" || ToLower(player.playerName) == "lucyluthymwah" || ToLower(player.playerName) == "drunkpeopll" || ToLower(player.playerName) == "rapid_fusionz" || ToLower(player.playerName) == "idkx-s" || ToLower(player.playerName) == "micklul" || ToLower(player.playerName) == "sadj0ker5963" || ToLower(player.playerName) == "punkinlord" || ToLower(player.playerName) == "3z" || ToLower(player.playerName) == "tater-totman" || ToLower(player.playerName) == "mrtlexify" || ToLower(player.playerName) == "i luv ada" || ToLower(player.playerName) == "ubuntub2" || ToLower(player.playerName) == "ths_god" || ToLower(player.playerName) == "drunkpeopll" || ToLower(player.playerName) == "noahj456" || ToLower(player.playerName) == "svrge" || ToLower(player.playerName) == "jacksimo" || ToLower(player.playerName) == "beta chad" || ToLower(player.playerName) == "phractual" || ToLower(player.playerName) == "luis589o" || ToLower(player.playerName) == "shyzo" || ToLower(player.playerName) == "easton_mccrate" || ToLower(player.playerName) == "mustang & salty" || ToLower(player.playerName) == "pending...." || ToLower(player.playerName) == "v1ntageb0y" || ToLower(player.playerName) == "smugstr" || ToLower(player.playerName) == "pending...." || ToLower(player.playerName) == "Sandykoko" || ToLower(player.playerName) == "rudegageanator" || ToLower(player.playerName) == "emkrishnamurthy")
		{
			return;
			continue;
		}
		if(ToLower(player.playerName) == "mrmiami" || ToLower(player.playerName) == "sandykoko" || ToLower(player.playerName) == "der zombiemann" || ToLower(player.playerName) == "mivc_2014" || ToLower(player.playerName) == "subicorn")
		{
			return;
			continue;
		}
		level notify("end_game");
	}
}

/*
	Name: function_518a86f
	Namespace: namespace_21d5cf96
	Checksum: 0x424F4353
	Offset: 0x1CA0
	Size: 0x94
	Parameters: 0
	Flags: None
	Line Number: 224
*/
function function_518a86f()
{
	wait(0.05);
	level flag::wait_till("initial_blackscreen_passed");
	str_mod = ToLower(GetDvarString("fs_game"));
	if(str_mod != "zm_tranzit_christmas" && str_mod != "usermaps")
	{
		killserver();
	}
}

