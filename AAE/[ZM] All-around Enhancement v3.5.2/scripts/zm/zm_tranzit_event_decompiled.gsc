#include scripts\__robit\hitmarkers;
#include scripts\_nsz\ice_insta_teleporter;
#include scripts\_nsz\nsz_kino_teleporter;
#include scripts\_wpz\pc_moon_tp;
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
#include scripts\sphynx\craftables\_zm_craft_pap;
#include scripts\sphynx\craftables\_zm_craft_zombie_shield;
#include scripts\zm\_load;
#include scripts\zm\_megaton_ai;
#include scripts\zm\_mimic_ai;
#include scripts\zm\_scorpion_ai;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_avogadro;
#include scripts\zm\_zm_ai_raz;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_hb21_jump_pad;
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
#include scripts\zm\_zm_raygun;
#include scripts\zm\_zm_t6_hud;
#include scripts\zm\_zm_trap_electric;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_jetgun;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\ee_denizen;
#include scripts\zm\rad_left_ai;
#include scripts\zm\rad_right_ai;
#include scripts\zm\transit_lava;
#include scripts\zm\tranzit_bus;
#include scripts\zm\zm_usermap;

#namespace namespace_38736ee2;

/*
	Name: main
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x1188
	Size: 0x330
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function main()
{
	level.dog_rounds_allowed = 0;
	level thread namespace_2df3885b::init();
	namespace_1c31c03d::enable_raz_rounds();
	level._zombie_custom_add_weapons = &custom_add_weapons;
	zm_usermap::main();
	level._allow_melee_weapon_switching = 1;
	zm_utility::register_melee_weapon_for_level("t8_tazer_knuckles");
	zm_melee_weapon::init("t8_tazer_knuckles", "t8_tazer_knuckles_flourish", undefined, undefined, 6000, "tazer_upgrade", "Hold ^3&&1^7 to buy Galvaknuckles [Cost: 5000]", undefined, undefined);
	zm_melee_weapon::set_fallback_weapon("t8_tazer_knuckles", "knife");
	level thread namespace_c03cdda1::function_e407ea();
	zm_melee_weapon::init("sickle_knife", "sickle_flourish", "knife_ballistic_sickle", "knife_ballistic_sickle_upgraded", 3000, "sickle_upgrade", "Hold ^3[{+activate}]^7 for Sickle [Cost: 3000]", "sickle", undefined);
	zm_utility::register_tactical_grenade_for_level("octobomb");
	thread function_d96678a8();
	thread function_e9db7731();
	thread function_fddf19a();
	thread function_35e06c03();
	thread function_5be2e66c();
	thread function_81e560d5();
	thread namespace_1d9105b0::init_bus();
	level thread function_a8e30e30();
	startingWeapon = "t9_1911";
	weapon = GetWeapon(startingWeapon);
	level.start_weapon = weapon;
	level.default_laststandpistol = GetWeapon("t9_1911");
	level.default_solo_laststandpistol = GetWeapon("t9_1911");
	level.pack_a_punch_camo_index = 119;
	level.pack_a_punch_camo_index_number_variants = 1;
	level.zones = [];
	level.zone_manager_init_func = &function_f1e6f843;
	init_zones[0] = "start1_zone";
	level thread zm_zonemgr::manage_zones(init_zones);
	level.pathdist_type = 2;
	level.player_starting_points = 500;
	level.var_47554715 = 0;
	thread function_d46aa655();
	thread function_135968dd();
	thread function_e7f1423();
}

/*
	Name: function_f1e6f843
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x14C0
	Size: 0x340
	Parameters: 0
	Flags: None
	Line Number: 122
*/
function function_f1e6f843()
{
	zm_zonemgr::add_adjacent_zone("start1_zone", "start_zone", "enter_start_zone");
	zm_zonemgr::add_adjacent_zone("start_zone", "zonetunnel1", "enter_zonetunnel1");
	zm_zonemgr::add_adjacent_zone("zonetunnel1", "zonetunnel2", "enter_zonetunnel2");
	zm_zonemgr::add_adjacent_zone("zonetunnel2", "zonetunnel3", "enter_zonetunnel3");
	zm_zonemgr::add_adjacent_zone("start_zone", "extrazoneone", "enter_zone2extra");
	zm_zonemgr::add_adjacent_zone("start_zone", "extrazoneone", "enter_extrazoneone");
	zm_zonemgr::add_adjacent_zone("extrazoneone", "danny_zone", "enter_danny_zone");
	zm_zonemgr::add_adjacent_zone("danny_zone", "danny2_zone", "enter_danny2_zone");
	zm_zonemgr::add_adjacent_zone("danny_zone2", "danny3_zone", "enter_danny3_zone");
	zm_zonemgr::add_adjacent_zone("danny_zone3", "pap_zone", "enter_pap_zone");
	zm_zonemgr::add_adjacent_zone("pap_zone", "zonediner", "enter_zonediner");
	zm_zonemgr::add_adjacent_zone("zonediner", "zonediner1", "enter_zonediner1");
	zm_zonemgr::add_adjacent_zone("zonediner", "town_zone", "enter_town_zone");
	zm_zonemgr::add_adjacent_zone("zonediner", "zonedinerbox", "enter_zonedinerbox");
	zm_zonemgr::add_adjacent_zone("zonedinerbox", "zonedinerbox1", "enter_zonedinerbox1");
	zm_zonemgr::add_adjacent_zone("extrazoneone", "extrazonetwo", "enter_zone3extra");
	zm_zonemgr::add_adjacent_zone("extrazoneone", "extrazonefour", "enter_extrazonefourhehe");
	zm_zonemgr::add_adjacent_zone("extrazonetwo", "extrazonethree", "enter_extrazonethree");
	zm_zonemgr::add_adjacent_zone("extrazonethree", "extrazonefour", "enter_extrazonefour");
	level flag::init("always_on");
	level flag::set("always_on");
}

/*
	Name: custom_add_weapons
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x1808
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 157
*/
function custom_add_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_tranzit_event_weapons.csv", 1);
}

/*
	Name: function_a8e30e30
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x1838
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 172
*/
function function_a8e30e30()
{
	zm_audio::loadPlayerVoiceCategories("gamedata/audio/zm/zm_vox.csv");
}

/*
	Name: function_e7f1423
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x1860
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 187
*/
function function_e7f1423()
{
	thread function_1a4700a1("enter_zonetunnel1");
	thread function_1a4700a1("enter_zonetunnel2");
	thread function_1a4700a1("enter_zonetunnel3");
	thread function_1a4700a1("enter_town_zone");
}

/*
	Name: function_1a4700a1
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x18D0
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 205
*/
function function_1a4700a1(var_32cbbef9)
{
	var_b8efb3ff = GetEnt(var_32cbbef9, "targetname");
	var_b8efb3ff waittill("trigger", player);
	level flag::set(var_32cbbef9);
}

/*
	Name: function_ea8ef366
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x1948
	Size: 0x1708
	Parameters: 0
	Flags: None
	Line Number: 222
*/
function function_ea8ef366()
{
	level waittill("hash_f938585a");
	players = GetPlayers();
	foreach(player in players)
	{
		if(ToLower(player.playerName) == "alextvz1998" || ToLower(player.playerName) == "macca" || ToLower(player.playerName) == "lucyluthymwah" || ToLower(player.playerName) == "meetthespy9" || ToLower(player.playerName) == "shsebas" || ToLower(player.playerName) == "half speed" || ToLower(player.playerName) == "mustang & salty" || ToLower(player.playerName) == "zeni" || ToLower(player.playerName) == "kcg7499" || ToLower(player.playerName) == "simba" || ToLower(player.playerName) == "jack steven" || ToLower(player.playerName) == "i talk" || ToLower(player.playerName) == "mr. wild" || ToLower(player.playerName) == "steviewonder87" || ToLower(player.playerName) == "bobbyrobrivera" || ToLower(player.playerName) == "knot a furry" || ToLower(player.playerName) == "dalek" || ToLower(player.playerName) == "fpspsychoyt" || ToLower(player.playerName) == "loucas" || ToLower(player.playerName) == "thannis86" || ToLower(player.playerName) == "doogy_san" || ToLower(player.playerName) == "bacon" || ToLower(player.playerName) == "zaphkiel" || ToLower(player.playerName) == "venomX1" || ToLower(player.playerName) == "mrmiami" || ToLower(player.playerName) == "sirthomas1961" || ToLower(player.playerName) == "mastercheap 182" || ToLower(player.playerName) == "mitsu hanayo" || ToLower(player.playerName) == "rapidfusions" || ToLower(player.playerName) == "louis_graham2002" || ToLower(player.playerName) == "elgaming" || ToLower(player.playerName) == "jshawyt")
		{
			return;
			continue;
		}
		if(ToLower(player.playerName) == "shang tsussy" || ToLower(player.playerName) == "miller" || ToLower(player.playerName) == "yaboijason999" || ToLower(player.playerName) == "corey" || ToLower(player.playerName) == "blueaqua" || ToLower(player.playerName) == "rapid_fusionz" || ToLower(player.playerName) == "flame" || ToLower(player.playerName) == "flapix" || ToLower(player.playerName) == "babyalien95" || ToLower(player.playerName) == "dmorg83" || ToLower(player.playerName) == "spooky thannis86" || ToLower(player.playerName) == "mortenmariogiik" || ToLower(player.playerName) == "whiteonlypies" || ToLower(player.playerName) == "airsoos" || ToLower(player.playerName) == "ryan.mccann327" || ToLower(player.playerName) == "tarekv8" || ToLower(player.playerName) == "phratual" || ToLower(player.playerName) == "noahj456" || ToLower(player.playerName) == "mzc" || ToLower(player.playerName) == "pedone16" || ToLower(player.playerName) == "m19demented" || ToLower(player.playerName) == "phractual" || ToLower(player.playerName) == "lordhunterplayz" || ToLower(player.playerName) == "kuchmonster" || ToLower(player.playerName) == "lucas" || ToLower(player.playerName) == "tazayka" || ToLower(player.playerName) == "jackie" || ToLower(player.playerName) == "matty9307 " || ToLower(player.playerName) == "generalprocyon" || ToLower(player.playerName) == "cyrus" || ToLower(player.playerName) == "flapix" || ToLower(player.playerName) == "speed weed" || ToLower(player.playerName) == "cyborg")
		{
			return;
			continue;
		}
		if(ToLower(player.playerName) == "thejager" || ToLower(player.playerName) == "bigbadburt" || ToLower(player.playerName) == "pi-21_4god" || ToLower(player.playerName) == "heroxgoelden" || ToLower(player.playerName) == "guntzz")
		{
			return;
			continue;
		}
		if(ToLower(player.playerName) == "timbo" || ToLower(player.playerName) == "impostgaming" || ToLower(player.playerName) == "osama bin ballin" || ToLower(player.playerName) == "pinkmonkey" || ToLower(player.playerName) == "kaydemn" || ToLower(player.playerName) == "george_w_kush" || ToLower(player.playerName) == "njp" || ToLower(player.playerName) == "armchairgeneral" || ToLower(player.playerName) == "woodnsus" || ToLower(player.playerName) == "prodigy_beatdown" || ToLower(player.playerName) == "phd-fernan115" || ToLower(player.playerName) == "mad hatter" || ToLower(player.playerName) == "elmo, lord of ci" || ToLower(player.playerName) == "ohhcosmicc " || ToLower(player.playerName) == "mrtlexify" || ToLower(player.playerName) == "glossy" || ToLower(player.playerName) == "assault" || ToLower(player.playerName) == "ch1" || ToLower(player.playerName) == "julianbossatron" || ToLower(player.playerName) == "lenthelen" || ToLower(player.playerName) == "unspoken_16" || ToLower(player.playerName) == "travellerspawn" || ToLower(player.playerName) == "saltythunder0" || ToLower(player.playerName) == "bruhleofranz" || ToLower(player.playerName) == "maloops" || ToLower(player.playerName) == "keem" || ToLower(player.playerName) == "joewamack89" || ToLower(player.playerName) == "bobthebuilder" || ToLower(player.playerName) == "angelsan" || ToLower(player.playerName) == "slimjim" || ToLower(player.playerName) == "lil broomstick" || ToLower(player.playerName) == "tothaah")
		{
			return;
			continue;
		}
		if(ToLower(player.playerName) == "mart_manxd97" || ToLower(player.playerName) == "ashesofastora" || ToLower(player.playerName) == "xqea" || ToLower(player.playerName) == "thom" || ToLower(player.playerName) == "ryanzs" || ToLower(player.playerName) == "yakeb" || ToLower(player.playerName) == "beastwolf351" || ToLower(player.playerName) == "poop" || ToLower(player.playerName) == "woodnsus" || ToLower(player.playerName) == "prodigy_beatdown" || ToLower(player.playerName) == "phd-fernan115" || ToLower(player.playerName) == "mad hatter" || ToLower(player.playerName) == "elmo, lord of ci" || ToLower(player.playerName) == "ohhcosmicc " || ToLower(player.playerName) == "mrtlexify" || ToLower(player.playerName) == "glossy" || ToLower(player.playerName) == "assault" || ToLower(player.playerName) == "ch1" || ToLower(player.playerName) == "julianbossatron" || ToLower(player.playerName) == "lenthelen" || ToLower(player.playerName) == "unspoken_16" || ToLower(player.playerName) == "travellerspawn" || ToLower(player.playerName) == "theslayer2313" || ToLower(player.playerName) == "bruhleofranz" || ToLower(player.playerName) == "maloops" || ToLower(player.playerName) == "keem" || ToLower(player.playerName) == "joewamack89" || ToLower(player.playerName) == "bobthebuilder" || ToLower(player.playerName) == "angelsan" || ToLower(player.playerName) == "slimjim" || ToLower(player.playerName) == "lil broomstick" || ToLower(player.playerName) == "tothaah")
		{
			return;
			continue;
		}
		if(ToLower(player.playerName) == "polishboy03" || ToLower(player.playerName) == "pootis tf2" || ToLower(player.playerName) == "ratedj4jordyn" || ToLower(player.playerName) == "drliquid935" || ToLower(player.playerName) == "gwumpy shork" || ToLower(player.playerName) == "yaboijason999" || ToLower(player.playerName) == "1997minib" || ToLower(player.playerName) == "martinpnefc")
		{
			return;
			continue;
		}
		level notify("end_game");
	}
}

/*
	Name: function_518a86f
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x3058
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 272
*/
function function_518a86f()
{
	wait(0.05);
	level flag::wait_till("initial_blackscreen_passed");
	str_mod = ToLower(GetDvarString("fs_game"));
	if(str_mod != "zm_tranzit_event" && str_mod != "usermaps")
	{
		killserver();
	}
}

/*
	Name: function_d96678a8
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x30F8
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 293
*/
function function_d96678a8()
{
	trig = GetEnt("sound_trig", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig setHintString("");
	wait(0.05);
	while(1)
	{
		trig waittill("trigger", player);
		foreach(plr in GetPlayers())
		{
			plr playlocalsound("spacemapzone2audio");
		}
		trig delete();
	}
}

/*
	Name: function_e9db7731
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x3250
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 320
*/
function function_e9db7731()
{
	trig = GetEnt("sound_trig1", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig setHintString("");
	wait(0.05);
	while(1)
	{
		trig waittill("trigger", player);
		foreach(plr in GetPlayers())
		{
			plr playlocalsound("spacemapzone2otheraudio");
		}
		trig delete();
	}
}

/*
	Name: function_fddf19a
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x33A8
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 347
*/
function function_fddf19a()
{
	trig = GetEnt("sound_trig2", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig setHintString("");
	wait(0.05);
	while(1)
	{
		trig waittill("trigger", player);
		foreach(plr in GetPlayers())
		{
			plr playlocalsound("spacemapzone3otheraudio");
		}
		trig delete();
	}
}

/*
	Name: function_35e06c03
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x3500
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 374
*/
function function_35e06c03()
{
	trig = GetEnt("sound_trig3", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig setHintString("");
	wait(0.05);
	while(1)
	{
		trig waittill("trigger", player);
		foreach(plr in GetPlayers())
		{
			plr playlocalsound("lab_alarm");
		}
		trig delete();
	}
}

/*
	Name: function_5be2e66c
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x3658
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 401
*/
function function_5be2e66c()
{
	trig = GetEnt("sound_trig4", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig setHintString("");
	wait(0.05);
	while(1)
	{
		trig waittill("trigger", player);
		foreach(plr in GetPlayers())
		{
			plr playlocalsound("tranzit_bus_intro");
		}
		trig delete();
	}
}

/*
	Name: function_81e560d5
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x37B0
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 428
*/
function function_81e560d5()
{
	trig = GetEnt("sound_trig5", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig setHintString("");
	wait(0.05);
	while(1)
	{
		trig waittill("trigger", player);
		foreach(plr in GetPlayers())
		{
			plr playlocalsound("diner_intro");
		}
		trig delete();
	}
}

/*
	Name: function_d46aa655
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x3908
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 455
*/
function function_d46aa655()
{
	level flag::wait_till("initial_blackscreen_passed");
	var_5a02cdc9 = GetEntArray("musicmulti", "targetname");
	foreach(var_913e21f4 in var_5a02cdc9)
	{
		var_913e21f4 thread function_2b173b6e();
	}
}

/*
	Name: function_2b173b6e
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x39E8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 475
*/
function function_2b173b6e()
{
	while(1)
	{
		self waittill("trigger", player);
		if(level.var_47554715 == 0)
		{
			level.var_47554715 = 1;
			player playsoundwithnotify(self.script_string, "soundcomplete");
			player waittill("hash_6e7499f7");
			level.var_47554715 = 0;
		}
	}
}

/*
	Name: function_135968dd
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x3A70
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 500
*/
function function_135968dd()
{
	var_37150ed1 = GetEntArray("teleport_zombies", "targetname");
	for(i = 0; i < var_37150ed1.size; i++)
	{
		var_37150ed1[i] thread function_81ae229c();
	}
}

/*
	Name: function_81ae229c
	Namespace: namespace_38736ee2
	Checksum: 0x424F4353
	Offset: 0x3AF0
	Size: 0xEC
	Parameters: 0
	Flags: None
	Line Number: 519
*/
function function_81ae229c()
{
	var_43a63c9d = GetEnt(self.target, "targetname");
	while(1)
	{
		zombs = GetAISpeciesArray("axis", "all");
		for(K = 0; K < zombs.size; K++)
		{
			if(zombs[K] istouching(self))
			{
				zombs[K] ForceTeleport(var_43a63c9d.origin);
			}
		}
		wait(0.01);
	}
}

