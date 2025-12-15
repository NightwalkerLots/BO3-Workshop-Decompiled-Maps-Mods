#include scripts\_kj\kj_symbo_digsites;
#include scripts\codescripts\struct;
#include scripts\shared\ai\archetype_apothicon_fury;
#include scripts\shared\ai\archetype_thrasher;
#include scripts\shared\ai\archetype_thrasher_interface;
#include scripts\shared\ai\margwa;
#include scripts\shared\ai\mechz;
#include scripts\shared\ai\raz;
#include scripts\shared\ai\zombie;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\animation_shared;
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
#include scripts\shared\spawner_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicles\_raps;
#include scripts\shared\vehicles\_sentinel_drone;
#include scripts\shared\vehicles\_spider;
#include scripts\sphynx\craftables\_zm_craft_brazen_bull_shield;
#include scripts\zm\_dragon_whelp;
#include scripts\zm\_hb21_zm_powerups;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_avogadro;
#include scripts\zm\_zm_ai_dogs;
#include scripts\zm\_zm_ai_fury;
#include scripts\zm\_zm_ai_margwa;
#include scripts\zm\_zm_ai_mechz;
#include scripts\zm\_zm_ai_quad;
#include scripts\zm\_zm_ai_raps;
#include scripts\zm\_zm_ai_raz;
#include scripts\zm\_zm_ai_sentinel_drone;
#include scripts\zm\_zm_ai_wasp;
#include scripts\zm\_zm_attackables;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_behavior;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_elemental_zombies;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_pack_a_punch;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perk_doubletap2;
#include scripts\zm\_zm_perk_electric_cherry;
#include scripts\zm\_zm_perk_juggernaut;
#include scripts\zm\_zm_perk_quick_revive;
#include scripts\zm\_zm_perk_random;
#include scripts\zm\_zm_perk_sleight_of_hand;
#include scripts\zm\_zm_perk_staminup;
#include scripts\zm\_zm_perk_widows_wine;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerup_double_points;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_powerup_free_perk;
#include scripts\zm\_zm_powerup_full_ammo;
#include scripts\zm\_zm_powerup_insta_kill;
#include scripts\zm\_zm_powerup_island_seed;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_trap_electric;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_elemental_bow;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\apoth_god;
#include scripts\zm\attackable_sep;
#include scripts\zm\buffalos;
#include scripts\zm\camera_tween;
#include scripts\zm\cristal_challenge;
#include scripts\zm\custom_wallbuy;
#include scripts\zm\dragon_custom;
#include scripts\zm\dragon_powerup;
#include scripts\zm\explosive_zomb;
#include scripts\zm\katana;
#include scripts\zm\symbo_zns_transports;
#include scripts\zm\tranzit_bus;
#include scripts\zm\ugxmods_timedgp;
#include scripts\zm\zm_genesis_apothicon_fury;
#include scripts\zm\zm_giant_cleanup_mgr;
#include scripts\zm\zm_island_planting;
#include scripts\zm\zm_island_util;
#include scripts\zm\zm_panzermorder;
#include scripts\zm\zm_seppukuee_bossfight;
#include scripts\zm\zm_usermap;

#namespace namespace_b138122a;

/*
	Name: main
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x1660
	Size: 0x6A8
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function main()
{
	clientfield::register("toplayer", "raindrop", 1, 1, "int");
	clientfield::register("clientuimodel", "zmHud.activeWeapon", 1, 2, "int");
	clientfield::register("clientuimodel", "zmHud.perkLimit", 1, 4, "int");
	clientfield::register("world", "voteRestart", 1, 2, "int");
	clientfield::register("world", "voteExit", 1, 2, "int");
	for(i = 0; i < 4; i++)
	{
		clientfield::register("world", "zmHud.playerDead." + i, 1, 2, "int");
	}
	clientfield::register("scriptmover", "csc_passer", 1, 1, "int");
	callback::on_connect(&function_50176e02);
	callback::on_connect(&function_22a1eb50);
	zm_utility::register_tactical_grenade_for_level("revive_grenade");
	callback::on_spawned(&function_e9ec43c6);
	zm::register_actor_damage_callback(&function_73b1897e);
	callback::on_connect(&function_6d3d9470);
	modvar("fast_restart", 0);
	zm_usermap::main();
	level._should_skip_ignore_player_logic = &function_d036ab27;
	level.custom_intermission = &function_bd361db0;
	SetDvar("scr_zm_use_code_enemy_selection", 1);
	spawner::add_archetype_spawn_function("zombie", &function_d6b4bc51);
	level.player_starting_points = 500;
	level flag::set("power_on");
	zombie_utility::set_zombie_var("below_world_check", -1000000);
	level.player_intersection_tracker_override = &function_67d40520;
	level.default_laststandpistol = GetWeapon("elemental_bow");
	level.default_solo_laststandpistol = GetWeapon("elemental_bow");
	level.laststandpistol = level.default_laststandpistol;
	var_cd1edb2e = Array("t8_kap45", "s2_m712");
	level.start_weapon = GetWeapon(Array::random(var_cd1edb2e));
	level.perk_purchase_limit = 18;
	level._zombie_custom_add_weapons = &custom_add_weapons;
	level.pack_a_punch_camo_index = 121;
	level.pack_a_punch_camo_index_number_variants = 3;
	level.zones = [];
	level.zone_manager_init_func = &function_f1e6f843;
	init_zones[0] = "start_zone";
	init_zones[1] = "zone1";
	init_zones[2] = "zone2";
	init_zones[3] = "zone3";
	init_zones[4] = "zone4";
	init_zones[5] = "zone5";
	init_zones[6] = "zone6";
	init_zones[7] = "zone7";
	init_zones[8] = "zone8";
	init_zones[9] = "zone9";
	init_zones[10] = "zone10";
	init_zones[11] = "zone11";
	init_zones[12] = "zone_top";
	init_zones[12] = "zone_train_area";
	init_zones[13] = "zone_global";
	level thread zm_zonemgr::manage_zones(init_zones);
	level.pathdist_type = 2;
	level.zombie_ai_limit = 25;
	level.zombie_actor_limit = 120;
	ArrayRemoveValue(level.zombie_powerup_array, "minigun");
	ArrayRemoveValue(level.zombie_powerup_array, "nuke");
	thread function_acdb1eb1();
	thread function_3af0f0b5();
	thread function_bdac8e74();
	thread function_c28cdeba();
	thread function_c08851e7();
	thread function_319e72e0();
	thread function_518a86f();
	level.custom_riseanim = "zombie_riser_elevator_from_floor";
	level._effect["rise_burst"] = "Symbo/lava_spawn";
	level._effect["rise_dust"] = "Symbo/blank";
}

/*
	Name: function_518a86f
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x1D10
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 189
*/
function function_518a86f()
{
	wait(0.05);
	level flag::wait_till("initial_blackscreen_passed");
	str_mod = ToLower(GetDvarString("fs_game"));
	if(str_mod != "zm_seppuku" && str_mod != "usermaps")
	{
		killserver();
	}
}

/*
	Name: function_2ecc7941
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x1DB0
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 210
*/
function function_2ecc7941()
{
	targets = [];
	foreach(player in GetPlayers())
	{
		if(player istouching(self.trig) && !player laststand::player_is_in_laststand())
		{
			if(!isdefined(targets))
			{
				targets = [];
			}
			else if(!IsArray(targets))
			{
				targets = Array(targets);
			}
		}
		targets[targets.size] = player;
	}
	favorite_enemy = ArrayGetClosest(self.origin, targets);
	return favorite_enemy;
}

/*
	Name: function_c08851e7
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x1F08
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 242
*/
function function_c08851e7()
{
	wait(1);
	trig = GetEnt("ammomatic_trig", "targetname");
	trig setcursorhint("HINT_NOICON");
	struct = struct::get(trig.target, "targetname");
	var_564e0690 = 0;
	var_5fcea998 = 8000;
	while(1)
	{
		trig setHintString("+^7Hold ^3[{+activate}]^7 to deposit money for a MaxAmmo \n" + var_5fcea998 - var_564e0690 + " needed");
		trig waittill("trigger", player);
		var_c6a547f1 = var_5fcea998 - var_564e0690;
		if(player.score >= var_c6a547f1)
		{
			player zm_score::minus_to_player_score(var_c6a547f1);
			function_99640d27(struct);
			var_564e0690 = 0;
		}
		else
		{
			var_564e0690 = var_564e0690 + player.score;
			player zm_score::minus_to_player_score(player.score);
		}
	}
}

/*
	Name: function_99640d27
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x20B8
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 279
*/
function function_99640d27(struct)
{
	dir = AnglesToForward(struct.angles);
	up = anglesToUp(struct.angles);
	var_99b6149a = randomIntRange(30, 40);
	var_901b0af3 = randomIntRange(30, 60);
	max = zm_powerups::specific_powerup_drop("full_ammo", struct.origin, undefined, undefined, 1.5, undefined, 1);
	max playsound("zmb_vocals_margwa_pain_small");
	max launch(dir * var_99b6149a + up * var_901b0af3);
	wait(1.5);
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_67d40520
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x2208
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 304
*/
function function_67d40520()
{
	return 1;
}

/*
	Name: function_f9077db
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x2218
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 319
*/
function function_f9077db()
{
	level waittill("hash_a308f462");
	level.zombie_ai_limit = 61;
	return;
}

/*
	Name: function_f3c1bb2d
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x2240
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 336
*/
function function_f3c1bb2d()
{
}

/*
	Name: function_d036ab27
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x2250
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 350
*/
function function_d036ab27()
{
	return 1;
}

/*
	Name: function_98e3180e
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x2260
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 365
*/
function function_98e3180e()
{
	wait(1);
	trig = GetEnt("orel_trig", "targetname");
	trig setcursorhint("HINT_NOICON");
	trig setHintString("orel");
	while(1)
	{
		trig waittill("trigger", player);
		player setClientUIVisibilityFlag("hud_visible", 0);
		player setClientUIVisibilityFlag("weapon_hud_visible", 0);
		wait(0.05);
		trig waittill("trigger", player);
		player setClientUIVisibilityFlag("hud_visible", 1);
		player setClientUIVisibilityFlag("weapon_hud_visible", 1);
	}
}

/*
	Name: function_c28cdeba
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x2398
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 393
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
	Name: function_bd361db0
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x2528
	Size: 0x2F0
	Parameters: 0
	Flags: None
	Line Number: 420
*/
function function_bd361db0()
{
	level.zombie_vars["zombie_intermission_time"] = 69;
	self closeInGameMenu();
	self CloseMenu("StartMenu_Main");
	self notify("player_intermission");
	self endon("player_intermission");
	level endon("stop_intermission");
	self endon("disconnect");
	self endon("death");
	self notify("_zombie_game_over");
	self.score = self.score_total;
	STR = struct::get("intermission", "targetname");
	target = struct::get(STR.target, "targetname");
	time = level.zombie_vars["zombie_intermission_time"];
	wait(5);
	thread function_58834d52();
	self LUI::screen_fade_out(1);
	wait(1);
	self SetOrigin(STR.origin);
	self SetPlayerAngles(STR.angles);
	self Hide();
	wait(0.1);
	self StartCameraTween(0.1);
	self CameraSetPosition(STR.origin);
	self function_c5ac7d70(STR.angles);
	self CameraActivate(1);
	wait(1);
	self thread zm::screen_fade_in(2);
	self notify("player_intermission_spawned");
	if(isdefined(target))
	{
		self StartCameraTween(time - 5);
		self CameraSetPosition(target.origin);
		self function_c5ac7d70(target.angles);
		self CameraActivate(1);
	}
	wait(time);
}

/*
	Name: function_58834d52
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x2820
	Size: 0x258
	Parameters: 0
	Flags: None
	Line Number: 470
*/
function function_58834d52()
{
	wait(RandomFloat(0.2));
	level notify("hash_ae0e95a9");
	level endon("hash_ae0e95a9");
	wait(2);
	level.var_24bec4f0 = [];
	level.var_24bec4f0["restart"] = 0;
	level.var_24bec4f0["exit"] = 0;
	clientfield::set("voteRestart", 0);
	clientfield::set("voteExit", 0);
	level.var_fa757738 = 0;
	foreach(player in GetPlayers())
	{
		player thread function_7b19b7d6();
	}
	while(level.var_fa757738 == 0)
	{
		wait(0.1);
	}
	time = GetTime();
	wait_time = time + 20000;
	while(level.var_fa757738 <= GetPlayers().size / 2 && time < wait_time)
	{
		wait(1);
		time = time + 1000;
	}
	wait(5);
	MapName = GetDvarString("ui_mapname");
	if(level.var_24bec4f0["restart"] > level.var_24bec4f0["exit"])
	{
		map(MapName);
	}
	else
	{
		exitLevel(0);
	}
}

/*
	Name: function_7b19b7d6
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x2A80
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 519
*/
function function_7b19b7d6()
{
	player = self;
	player.response = "";
	var_81e1db34 = "";
	player openMenu("EndgameMenu");
	while(1)
	{
		player waittill("menuresponse", menu, response);
		if(response == var_81e1db34)
		{
			continue;
		}
		if(response != "restart" && response != "exit")
		{
			continue;
		}
		if(response == "bad")
		{
			continue;
		}
		level.var_fa757738++;
		if(response == "restart")
		{
			level.var_24bec4f0["restart"]++;
			if(var_81e1db34 == "exit")
			{
				level.var_24bec4f0["exit"]--;
			}
		}
		if(response == "exit")
		{
			level.var_24bec4f0["exit"]++;
			if(var_81e1db34 == "restart")
			{
				level.var_24bec4f0["restart"]--;
			}
		}
		level clientfield::set("voteExit", level.var_24bec4f0["exit"]);
		level clientfield::set("voteRestart", level.var_24bec4f0["restart"]);
		var_81e1db34 = response;
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_e9ec43c6
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x2C60
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 575
*/
function function_e9ec43c6()
{
	self endon("death");
	self endon("disconnect");
	self GiveWeapon(GetWeapon("revive_grenade"));
	self zm_utility::set_player_tactical_grenade(GetWeapon("revive_grenade"));
	self thread function_76de9a20();
}

/*
	Name: function_76de9a20
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x2CF0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 594
*/
function function_76de9a20()
{
	self endon("death");
	self endon("disconnect");
	while(1)
	{
		self waittill("grenade_fire", grenade, weapon);
		if(weapon.name != "revive_grenade")
		{
			continue;
		}
		self thread function_5a641094(grenade);
	}
}

/*
	Name: function_5a641094
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x2D80
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 619
*/
function function_5a641094(grenade)
{
	grenade waittill("explode", origin);
	players = GetPlayers();
	foreach(player in players)
	{
		if(player laststand::player_is_in_laststand() && Distance(origin, player.origin) <= 250)
		{
			player thread bgb::bgb_revive_watcher();
			player thread zm_laststand::auto_revive(self, 0);
		}
	}
	if(isdefined(level.var_1ed1d9a6) && level.var_1ed1d9a6.size > 0)
	{
		foreach(thingy in level.var_1ed1d9a6)
		{
			if(Distance(origin, thingy.origin) <= 250)
			{
				thingy notify("hash_482e9fd1", self);
			}
		}
	}
}

/*
	Name: function_bdac8e74
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x2F80
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 653
*/
function function_bdac8e74()
{
	thread function_bc85365b();
	wait(2);
	Debris = GetEntArray("floating_debris_model", "targetname");
	foreach(debri in Debris)
	{
		debri thread function_289a268d();
	}
	level waittill("hash_a308f462");
	level flag::clear("clone_to_boss");
	var_75ddaca7 = util::spawn_model("tag_origin", (0, 0, 0), (0, 0, 0));
	var_75ddaca7 clientfield::set("csc_passer", 1);
	wait(2);
	clips = GetEntArray("clips_floating", "targetname");
	foreach(clip in clips)
	{
		clip connectpaths();
		wait(0.05);
		clip delete();
	}
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_bc85365b
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x31A8
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 689
*/
function function_bc85365b()
{
	level waittill("hash_c3d9c4c");
	Debris = GetEntArray("floating_debris_model", "targetname");
	foreach(debri in Debris)
	{
		if(isdefined(debri.script_notify))
		{
			debri thread animation::Play("rise_debris_anim", self.origin, self.angles);
			debri delete();
		}
	}
	clips = GetEntArray("clips_floating", "targetname");
	foreach(clip in clips)
	{
		if(isdefined(clip.script_notify))
		{
			clip connectpaths();
			wait(0.05);
			clip delete();
		}
	}
}

/*
	Name: function_289a268d
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x33A8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 723
*/
function function_289a268d()
{
	self useanimtree(-1);
	self thread animation::Play("idle_debris_anim", self.origin, self.angles);
	level waittill("hash_a308f462");
	wait(2);
	self animation::Play("rise_debris_anim", self.origin, self.angles);
	self delete();
}

/*
	Name: function_d6b4bc51
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x3460
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 743
*/
function function_d6b4bc51()
{
	self.no_eye_glow = 1;
}

/*
	Name: function_22a1eb50
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x3478
	Size: 0x3A0
	Parameters: 0
	Flags: None
	Line Number: 758
*/
function function_22a1eb50()
{
	level endon("game_ended");
	self endon("disconnect");
	while(isdefined(self))
	{
		NB = self.pers["bgbs_chewed"];
		while(NB == self.pers["bgbs_chewed"])
		{
			wait(0.05);
		}
		self.ignoreme = 1;
		self waittill("weapon_change");
		self playlocalsound("whathaveidone");
		self FreezeControls(1);
		self setClientUIVisibilityFlag("hud_visible", 0);
		self setClientUIVisibilityFlag("weapon_hud_visible", 0);
		self DisableWeaponFire();
		self AllowMelee(0);
		self AllowAds(0);
		self DisableWeaponCycling();
		self setblur(13.3, 3.1);
		wait(2.8);
		self thread LUI::screen_flash(0.3, 0.8, 0.5, 1, "black");
		wait(0.5);
		self setblur(0, 0.5);
		self SetClientThirdPerson(1);
		self SetClientThirdPersonAngle(90);
		wait(1.5);
		self animation::Play("ai_zombie_adolf_death", self.origin, self.angles, 0.6);
		self DoDamage(self.health + 666, self.origin);
		self SetClientThirdPerson(0);
		wait(1);
		self setClientUIVisibilityFlag("hud_visible", 1);
		self setClientUIVisibilityFlag("weapon_hud_visible", 1);
		self EnableWeaponFire();
		self AllowMelee(1);
		self AllowAds(1);
		self EnableWeaponCycling();
		self FreezeControls(0);
		self.ignoreme = 0;
		if(self laststand::player_is_in_laststand())
		{
			self bgb::give("zm_bgb_newtonian_negation");
		}
	}
}

/*
	Name: function_3af0f0b5
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x3820
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 816
*/
function function_3af0f0b5()
{
	wait(5);
	lava = GetEntArray("lava_brush", "targetname");
	while(1)
	{
		lava[0] RotateYaw(-360, 400);
		lava[1] RotateYaw(-360, 250);
		wait(250);
	}
}

/*
	Name: function_73b1897e
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x38C0
	Size: 0x128
	Parameters: 12
	Flags: None
	Line Number: 838
*/
function function_73b1897e(inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(self.animName == "zombie_dog" && !isPlayer(inflictor) || (self.animName == "zombie_dog" && !isdefined(inflictor)))
	{
		return 0;
	}
	if(isdefined(self.avogadro) && self.avogadro)
	{
		return 0;
	}
	if(self.targetname != "margwa")
	{
		return -1;
	}
	if(!isPlayer(attacker) || !isPlayer(inflictor))
	{
		return 0;
	}
	return damage;
}

/*
	Name: function_f1e6f843
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x39F0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 869
*/
function function_f1e6f843()
{
	zm_zonemgr::add_adjacent_zone("zone5", "zone_train_area");
	level flag::init("always_on");
	level flag::set("always_on");
}

/*
	Name: custom_add_weapons
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x3A60
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 886
*/
function custom_add_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_levelcommon_weapons.csv", 1);
}

/*
	Name: function_50176e02
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x3A90
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 901
*/
function function_50176e02()
{
}

/*
	Name: function_2086069d
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x3AA0
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 915
*/
function function_2086069d()
{
	self endon("disconnect");
	var_7c971e50 = [];
	var_7c971e50[var_7c971e50.size] = GetWeapon("minigun");
	for(;;)
	{
		self waittill("weapon_change");
		weapon = self GetCurrentWeapon();
		weaponList = self getweaponslistprimaries();
		for(i = 0; i < weaponList.size; i++)
		{
			if(weaponList[i] == weapon)
			{
				weaponIndex = i + 1;
				if(i >= 3)
				{
					weaponIndex = 3;
				}
				if(self laststand::player_is_in_laststand())
				{
					weaponIndex = 1;
				}
				var_40b241b8 = 0;
				for(j = 0; j < var_7c971e50.size; j++)
				{
					if(weapon == var_7c971e50[j])
					{
						var_40b241b8 = 1;
					}
				}
				if(!var_40b241b8)
				{
					self clientfield::set_player_uimodel("zmHud.activeWeapon", weaponIndex);
				}
			}
		}
	}
}

/*
	Name: function_f51d1e93
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x3C58
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 965
*/
function function_f51d1e93()
{
	for(;;)
	{
		wait(0.05);
		var_f6cbf6ce = self zm_utility::get_player_perk_purchase_limit();
		self clientfield::set_player_uimodel("zmHud.perkLimit", var_f6cbf6ce);
	}
}

/*
	Name: function_cfec09a9
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x3CB8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 985
*/
function function_cfec09a9()
{
	for(;;)
	{
		type = self util::waittill_any_return("player_revived", "player_downed", "bled_out", "spawned_player");
		clientNum = self.entity_num;
		if(type == "player_revived" || type == "spawned_player")
		{
			level clientfield::set("zmHud.playerDead." + clientNum, 0);
		}
		else if(type == "player_downed")
		{
			level clientfield::set("zmHud.playerDead." + clientNum, 1);
		}
		else
		{
			level clientfield::set("zmHud.playerDead." + clientNum, 2);
		}
	}
}

/*
	Name: function_6d3d9470
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x3DC0
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 1016
*/
function function_6d3d9470()
{
	level endon("game_ended");
	self endon("disconnect");
	wait(1);
	self.is_burning = 0;
	var_4f8a5459 = GetEnt("trig_rain", "targetname");
	while(1)
	{
		while(!self istouching(var_4f8a5459) || self.is_burning)
		{
			wait(0.05);
		}
		self clientfield::set_to_player("raindrop", 1);
		while(self istouching(var_4f8a5459) && !self.is_burning)
		{
			wait(0.05);
		}
		self clientfield::set_to_player("raindrop", 0);
	}
}

/*
	Name: ai_count
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x3ED8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1048
*/
function ai_count()
{
	wait(5);
	while(1)
	{
		wait(1);
		IPrintLnBold(GetAITeamArray("axis"));
	}
}

/*
	Name: function_319e72e0
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x3F28
	Size: 0x438
	Parameters: 0
	Flags: None
	Line Number: 1068
*/
function function_319e72e0()
{
	wait(2);
	var_9655a25d = GetEnt("trig_margwa", "targetname");
	thread function_37bb1c07(var_9655a25d);
	thread function_309f592e(var_9655a25d);
	trigs = GetEntArray("trig_gravit", "targetname");
	for(i = 0; i < trigs.size; i++)
	{
		thread function_3533f946(trigs[i]);
		thread function_3503fb77(trigs[i], i);
		if(Int(trigs[i].script_int) > 1)
		{
			thread function_a77c8663(trigs[i], i);
		}
		if(Int(trigs[i].script_int) > 2)
		{
			thread function_98533c34(trigs[i], i);
		}
		if(Int(trigs[i].script_int) > 3)
		{
			thread function_1004b0af(trigs[i], i);
		}
		if(Int(trigs[i].script_int) > 4)
		{
			thread function_9605ac1a(trigs[i], i);
		}
		if(Int(trigs[i].script_int) > 5)
		{
			thread function_3533f946(trigs[i]);
			thread function_97a6cd99(trigs[i], i);
		}
		if(Int(trigs[i].script_int) > 6)
		{
			thread function_399f5819(trigs[i], i);
		}
		if(Int(trigs[i].script_int) > 7)
		{
			thread function_30bd1a84(trigs[i], i);
		}
		if(Int(trigs[i].script_int) > 8)
		{
			thread function_47294b63(trigs[i], i);
		}
		if(Int(trigs[i].script_int) > 9)
		{
			thread function_8751655e(trigs[i], i);
		}
		if(Int(trigs[i].script_int) > 10)
		{
			thread function_7b70faab(trigs[i], i);
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_5b2a85e4
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x4368
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 1135
*/
function function_5b2a85e4(main_trig)
{
	trigs = GetEntArray("trig_gravit", "targetname");
	var_dbb51b57 = 0;
	wait(0.05);
	foreach(trig in trigs)
	{
		if(isdefined(trig.is_active) && trig.is_active && trig.script_int > main_trig.script_int)
		{
			var_dbb51b57++;
		}
	}
	if(var_dbb51b57 >= 2)
	{
		return 0;
	}
	else
	{
		return 1;
	}
}

/*
	Name: function_3533f946
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x4498
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 1167
*/
function function_3533f946(trig)
{
	level endon("hash_7b8561df");
	if(isdefined(trig.script_notify))
	{
		return;
	}
	clip = GetEnt(trig.target, "targetname");
	var_a5c16413 = GetEnt(clip.target, "targetname");
	var_a5c16413 LinkTo(clip);
	origin = clip.origin;
	while(1)
	{
		while(!function_95443b19(trig))
		{
			wait(0.05);
		}
		clip moveto(origin + VectorScale((0, 0, 1), 200), 0.05);
		clip DontInterpolate();
		clip disconnectpaths();
		var_a5c16413 disconnectpaths();
		wait(0.05);
		while(function_95443b19(trig))
		{
			wait(0.05);
		}
		clip moveto(origin, 0.05);
		clip DontInterpolate();
		clip connectpaths();
		var_a5c16413 connectpaths();
		wait(0.05);
	}
}

/*
	Name: function_309f592e
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x46A8
	Size: 0x220
	Parameters: 1
	Flags: None
	Line Number: 1211
*/
function function_309f592e(trig)
{
	level endon("game_ended");
	level endon("hash_7b8561df");
	var_12e8a24a = GetEnt("zombie_spawner", "script_noteworthy");
	while(isdefined(self))
	{
		while(!function_95443b19(trig))
		{
			wait(0.05);
		}
		var_2fb50241 = Array();
		while(function_95443b19(trig))
		{
			NB = 5 * function_738586bf(trig);
			if(NB > 15)
			{
				NB = 15;
			}
			if(function_12d5ceb7(trig) >= NB || GetAICount() > 60)
			{
				wait(0.05);
				continue;
			}
			struct = Array::random(struct::get_array("zone_train_area_spawners"));
			ai = zombie_utility::spawn_zombie(var_12e8a24a, "training_area_zomb", struct);
			wait(0.1);
			if(isdefined(ai))
			{
				ai thread function_5a4025b4(trig);
				ai.ignore_enemy_count = 1;
				ai.exclude_cleanup_adding_to_total = 1;
				ai.targetname = "training_area_zomb";
			}
			wait(0.05);
		}
		var_2fb50241 = undefined;
	}
}

/*
	Name: function_37bb1c07
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x48D0
	Size: 0x378
	Parameters: 1
	Flags: None
	Line Number: 1261
*/
function function_37bb1c07(trig)
{
	level endon("game_ended");
	while(1)
	{
		wait(0.05);
		while(!function_95443b19(trig))
		{
			wait(0.05);
		}
		wait(0.05);
		var_2fb50241 = Array();
		while(function_95443b19(trig))
		{
			NB = 1;
			if(function_8d4ce7a3(trig) >= NB || GetAICount() > 60)
			{
				wait(0.05);
				continue;
			}
			var_30795149 = Array("light", "fire", "shadow", "electric");
			struct = Array::random(struct::get_array(trig.target));
			ai = function_5be091aa(struct, Array::random(var_30795149));
			if(isdefined(ai))
			{
				ai.ignore_enemy_count = 1;
				if(!isdefined(var_2fb50241))
				{
					var_2fb50241 = [];
				}
				else if(!IsArray(var_2fb50241))
				{
					var_2fb50241 = Array(var_2fb50241);
				}
				var_2fb50241[var_2fb50241.size] = ai;
				ai.trig = trig;
				ai thread function_5a4025b4(trig);
			}
			while(function_95443b19(trig) && isdefined(ai))
			{
				wait(0.05);
			}
			if(!isdefined(ai))
			{
				wait(30);
			}
			wait(0.1);
		}
		if(isdefined(var_2fb50241) && var_2fb50241.size > 0)
		{
			foreach(var_2f8d19d2 in var_2fb50241)
			{
				if(isalive(var_2f8d19d2))
				{
					var_2f8d19d2 DoDamage(var_2f8d19d2.health + 666, var_2f8d19d2.origin);
					var_2f8d19d2 kill();
				}
			}
		}
		var_2fb50241 = undefined;
	}
}

/*
	Name: function_c0787737
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x4C50
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 1334
*/
function function_c0787737(trig)
{
	while(1)
	{
		while(!self istouching(trig))
		{
			wait(0.05);
		}
		self playsoundtoplayer("yaguu", self);
		while(self istouching(trig))
		{
			wait(0.05);
		}
	}
}

/*
	Name: function_738586bf
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x4CE0
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 1360
*/
function function_738586bf(trig)
{
	NB = 0;
	foreach(player in GetPlayers())
	{
		if(player istouching(trig) && !player laststand::player_is_in_laststand() && player.sessionstate != "spectator")
		{
			NB++;
		}
	}
	return NB;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_47294b63
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x4DE0
	Size: 0x5D8
	Parameters: 2
	Flags: None
	Line Number: 1384
*/
function function_47294b63(trig, i)
{
	level endon("game_ended");
	level endon("hash_7b8561df");
	if(isdefined(trig.script_notify))
	{
		level waittill("hash_eff9bce7");
		wait(3);
	}
	while(1)
	{
		wait(0.05);
		trig.is_active = 0;
		while(!function_95443b19(trig) || !function_5b2a85e4(trig))
		{
			wait(0.05);
		}
		var_2fb50241 = Array();
		wait(0.05 * i);
		while(function_95443b19(trig) && function_5b2a85e4(trig))
		{
			trig.is_active = 1;
			NB = 2;
			if(function_56435172(trig, var_2fb50241) >= NB || GetAICount() > 60)
			{
				if(function_56435172(trig, var_2fb50241) >= NB)
				{
					var_53928d1e = function_56435172(trig, var_2fb50241) - NB;
					raps = GetEntArray("sentinel_drone", "targetname");
					var_5b88ee9b = [];
					foreach(var_2f8d19d2 in raps)
					{
						if(isalive(var_2f8d19d2) && var_2f8d19d2 istouching(trig))
						{
							if(!isdefined(var_5b88ee9b))
							{
								var_5b88ee9b = [];
							}
							else if(!IsArray(var_5b88ee9b))
							{
								var_5b88ee9b = Array(var_5b88ee9b);
							}
						}
						var_5b88ee9b[var_5b88ee9b.size] = var_2f8d19d2;
					}
					for(i = 0; i < var_53928d1e; i++)
					{
						var_5b88ee9b[i] kill();
					}
				}
				wait(0.05);
				continue;
			}
			struct = Array::random(struct::get_array(trig.target));
			ai = SpawnVehicle("spawner_bo3_dlc_sentinel_drone", struct.origin, struct.angles);
			wait(0.05);
			if(isdefined(ai))
			{
				ai.targetname = "sentinel_drone";
				health = 1000 * trig.script_int;
				ai setmaxhealth(health);
				ai.health = health;
				ai.ignore_enemy_count = 1;
				if(!isdefined(var_2fb50241))
				{
					var_2fb50241 = [];
				}
				else if(!IsArray(var_2fb50241))
				{
					var_2fb50241 = Array(var_2fb50241);
				}
				var_2fb50241[var_2fb50241.size] = ai;
			}
			if(isdefined(ai))
			{
				ai.trig = trig;
				ai thread function_5a4025b4(trig);
			}
			wait(0.05 * i);
		}
		if(isdefined(var_2fb50241) && var_2fb50241.size > 0)
		{
			foreach(var_2f8d19d2 in var_2fb50241)
			{
				if(isalive(var_2f8d19d2))
				{
					var_2f8d19d2 DoDamage(var_2f8d19d2.health + 666, var_2f8d19d2.origin);
					var_2f8d19d2 kill();
				}
			}
		}
		var_2fb50241 = undefined;
	}
}

/*
	Name: function_7b70faab
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x53C0
	Size: 0x3D0
	Parameters: 2
	Flags: None
	Line Number: 1489
*/
function function_7b70faab(trig, i)
{
	level endon("hash_7b8561df");
	level endon("game_ended");
	if(isdefined(trig.script_notify))
	{
		return;
	}
	var_7a1d6883 = struct::get_array("mechz_location", "script_noteworthy");
	while(1)
	{
		wait(0.05);
		trig.is_active = 0;
		while(!function_95443b19(trig) || !function_5b2a85e4(trig))
		{
			wait(0.05);
		}
		var_2fb50241 = Array();
		wait(0.05 * i);
		while(function_95443b19(trig) && function_5b2a85e4(trig))
		{
			trig.is_active = 1;
			NB = 1;
			if(function_881a976b(trig, var_2fb50241) >= NB || GetAICount() > 60)
			{
				wait(0.05);
				continue;
			}
			struct = Array::random(var_7a1d6883);
			ai = namespace_ef567265::spawn_mechz(struct, 1);
			health = 1000 * trig.script_int;
			if(isdefined(ai))
			{
				ai setmaxhealth(health);
				ai.health = health;
				ai.ignore_enemy_count = 1;
				if(!isdefined(var_2fb50241))
				{
					var_2fb50241 = [];
				}
				else if(!IsArray(var_2fb50241))
				{
					var_2fb50241 = Array(var_2fb50241);
				}
				var_2fb50241[var_2fb50241.size] = ai;
			}
			wait(0.05);
			if(isdefined(ai))
			{
				ai.trig = trig;
				ai thread function_5a4025b4(trig);
			}
			wait(0.05 * i);
		}
		if(isdefined(var_2fb50241) && var_2fb50241.size > 0)
		{
			foreach(var_2f8d19d2 in var_2fb50241)
			{
				var_2f8d19d2 DoDamage(var_2f8d19d2.health + 666, var_2f8d19d2.origin);
				var_2f8d19d2 kill();
			}
		}
		var_2fb50241 = undefined;
	}
}

/*
	Name: function_b8428f63
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x5798
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1565
*/
function function_b8428f63()
{
	while(isdefined(self))
	{
		wait(0.05);
		self DoDamage(self.health, self.origin);
		self kill();
	}
}

/*
	Name: function_8751655e
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x57F8
	Size: 0x408
	Parameters: 2
	Flags: None
	Line Number: 1585
*/
function function_8751655e(trig, i)
{
	level endon("hash_7b8561df");
	level endon("game_ended");
	if(isdefined(trig.script_notify))
	{
		level waittill("hash_eff9bce7");
		wait(3);
	}
	while(1)
	{
		wait(0.05);
		trig.is_active = 0;
		while(!function_95443b19(trig) || !function_5b2a85e4(trig))
		{
			wait(0.05);
		}
		var_2fb50241 = Array();
		wait(0.05 * i);
		while(function_95443b19(trig) && function_5b2a85e4(trig))
		{
			trig.is_active = 1;
			NB = 1;
			if(function_8d4ce7a3(trig) >= NB || GetAICount() > 60)
			{
				wait(0.05);
				continue;
			}
			var_30795149 = Array("light", "fire", "shadow", "electric");
			struct = Array::random(struct::get_array(trig.target));
			ai = function_5be091aa(struct, Array::random(var_30795149));
			wait(0.05);
			if(isdefined(ai))
			{
				ai.ignore_enemy_count = 1;
				if(!isdefined(var_2fb50241))
				{
					var_2fb50241 = [];
				}
				else if(!IsArray(var_2fb50241))
				{
					var_2fb50241 = Array(var_2fb50241);
				}
				var_2fb50241[var_2fb50241.size] = ai;
				ai thread function_7e684a8c();
			}
			if(isdefined(ai))
			{
				ai.trig = trig;
				ai thread function_5a4025b4(trig);
			}
			wait(0.05 * i);
		}
		if(isdefined(var_2fb50241) && var_2fb50241.size > 0)
		{
			foreach(var_2f8d19d2 in var_2fb50241)
			{
				if(isalive(var_2f8d19d2))
				{
					var_2f8d19d2 DoDamage(var_2f8d19d2.health + 666, var_2f8d19d2.origin);
					var_2f8d19d2 kill();
				}
			}
		}
		var_2fb50241 = undefined;
	}
}

/*
	Name: function_7e684a8c
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x5C08
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1663
*/
function function_7e684a8c()
{
	self endon("death");
	while(isdefined(self))
	{
		origin = self.origin;
		time = GetTime();
		while(self.origin == origin && GetTime() < time + 20000 && isdefined(self))
		{
			wait(0.05);
		}
		if(self.origin == origin && GetTime() >= time + 20000 && isdefined(self))
		{
			self kill();
			break;
		}
	}
}

/*
	Name: function_30bd1a84
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x5CD0
	Size: 0x408
	Parameters: 2
	Flags: None
	Line Number: 1692
*/
function function_30bd1a84(trig, i)
{
	level endon("hash_7b8561df");
	level endon("game_ended");
	if(isdefined(trig.script_notify))
	{
		level waittill("hash_eff9bce7");
		wait(3);
	}
	while(1)
	{
		wait(0.05);
		trig.is_active = 0;
		while(!function_95443b19(trig) || !function_5b2a85e4(trig))
		{
			wait(0.05);
		}
		var_2fb50241 = Array();
		wait(0.05 * i);
		while(function_95443b19(trig) && function_5b2a85e4(trig))
		{
			trig.is_active = 1;
			NB = 2;
			if(get_current_raz_count(trig, var_2fb50241) >= NB || GetAICount() > 60)
			{
				wait(0.05);
				continue;
			}
			struct = Array::random(struct::get_array(trig.target));
			ai = namespace_1c31c03d::function_665a13cd(undefined, struct);
			wait(0.05);
			if(isdefined(ai))
			{
				ai.targetname = "raz_gorod";
				ai.ignore_enemy_count = 1;
				health = 1500 * trig.script_int;
				ai setmaxhealth(health);
				ai.health = health;
				if(!isdefined(var_2fb50241))
				{
					var_2fb50241 = [];
				}
				else if(!IsArray(var_2fb50241))
				{
					var_2fb50241 = Array(var_2fb50241);
				}
				var_2fb50241[var_2fb50241.size] = ai;
			}
			if(isdefined(ai))
			{
				ai.trig = trig;
				ai thread function_5a4025b4(trig);
			}
			wait(0.05 * i);
		}
		if(isdefined(var_2fb50241) && var_2fb50241.size > 0)
		{
			foreach(var_2f8d19d2 in var_2fb50241)
			{
				if(isalive(var_2f8d19d2))
				{
					var_2f8d19d2 DoDamage(var_2f8d19d2.health + 666, var_2f8d19d2.origin);
					var_2f8d19d2 kill();
				}
			}
		}
		var_2fb50241 = undefined;
	}
}

/*
	Name: function_97a6cd99
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x60E0
	Size: 0x440
	Parameters: 2
	Flags: None
	Line Number: 1772
*/
function function_97a6cd99(trig, i)
{
	level endon("hash_7b8561df");
	level endon("game_ended");
	if(isdefined(trig.script_notify))
	{
		level waittill("hash_eff9bce7");
		wait(3);
	}
	while(1)
	{
		wait(0.05);
		trig.is_active = 0;
		while(!function_95443b19(trig) || !function_5b2a85e4(trig))
		{
			wait(0.05);
		}
		var_2fb50241 = Array();
		wait(0.05 * i);
		while(function_95443b19(trig) && function_5b2a85e4(trig))
		{
			trig.is_active = 1;
			NB = 3;
			if(function_66962612(trig, var_2fb50241) >= NB || GetAICount() > 60)
			{
				wait(0.05);
				continue;
			}
			struct = Array::random(struct::get_array(trig.target));
			ai = zombie_utility::spawn_zombie(level.quad_spawners[0], "quad_nova", struct);
			wait(0.05);
			ai namespace_1d58b607::quad_prespawn();
			if(isdefined(ai))
			{
				ai.var_753949a4 = GetTime();
				ai.targetname = "quad_nova";
				ai.ignore_enemy_count = 1;
				health = 200 * trig.script_int;
				ai setmaxhealth(health);
				ai.health = health;
				if(!isdefined(var_2fb50241))
				{
					var_2fb50241 = [];
				}
				else if(!IsArray(var_2fb50241))
				{
					var_2fb50241 = Array(var_2fb50241);
				}
				var_2fb50241[var_2fb50241.size] = ai;
			}
			wait(0.05);
			if(isdefined(ai))
			{
				ai.trig = trig;
				ai thread function_5a4025b4(trig);
			}
			wait(0.05 * i);
		}
		if(isdefined(var_2fb50241) && var_2fb50241.size > 0)
		{
			foreach(var_2f8d19d2 in var_2fb50241)
			{
				if(isalive(var_2f8d19d2))
				{
					var_2f8d19d2 DoDamage(var_2f8d19d2.health + 666, var_2f8d19d2.origin);
					var_2f8d19d2 kill();
				}
			}
		}
		var_2fb50241 = undefined;
	}
}

/*
	Name: function_9605ac1a
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x6528
	Size: 0x3B0
	Parameters: 2
	Flags: None
	Line Number: 1855
*/
function function_9605ac1a(trig, i)
{
	level endon("hash_7b8561df");
	level endon("game_ended");
	if(isdefined(trig.script_notify))
	{
		level waittill("hash_eff9bce7");
		wait(3);
	}
	while(1)
	{
		wait(0.05);
		trig.is_active = 0;
		while(!function_95443b19(trig) || !function_5b2a85e4(trig))
		{
			wait(0.05);
		}
		var_2fb50241 = Array();
		wait(0.05 * i);
		while(function_95443b19(trig) && function_5b2a85e4(trig))
		{
			trig.is_active = 1;
			NB = 4;
			if(get_current_spider_count(trig) >= NB || GetAICount() > 60)
			{
				wait(0.05);
				continue;
			}
			struct = Array::random(struct::get_array(trig.target));
			ai = spawn_spider(struct, trig);
			if(isdefined(ai))
			{
				ai.targetname = "spider_ai";
				ai.ignore_enemy_count = 1;
				ai.var_753949a4 = GetTime();
				if(!isdefined(var_2fb50241))
				{
					var_2fb50241 = [];
				}
				else if(!IsArray(var_2fb50241))
				{
					var_2fb50241 = Array(var_2fb50241);
				}
				var_2fb50241[var_2fb50241.size] = ai;
			}
			wait(0.05);
			if(isdefined(ai))
			{
				ai.trig = trig;
			}
			wait(0.05 * i);
		}
		if(isdefined(var_2fb50241) && var_2fb50241.size > 0)
		{
			foreach(var_2f8d19d2 in var_2fb50241)
			{
				if(isalive(var_2f8d19d2))
				{
					var_2f8d19d2 DoDamage(var_2f8d19d2.health + 666, var_2f8d19d2.origin);
					var_2f8d19d2 kill();
				}
			}
		}
		var_2fb50241 = undefined;
	}
}

/*
	Name: function_399f5819
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x68E0
	Size: 0x410
	Parameters: 2
	Flags: None
	Line Number: 1932
*/
function function_399f5819(trig, i)
{
	level endon("game_ended");
	level endon("hash_7b8561df");
	if(isdefined(trig.script_notify))
	{
		level waittill("hash_eff9bce7");
		wait(3);
	}
	while(1)
	{
		wait(0.05);
		trig.is_active = 0;
		while(!function_95443b19(trig) || !function_5b2a85e4(trig))
		{
			wait(0.05);
		}
		var_2fb50241 = Array();
		wait(0.05 * i);
		while(function_95443b19(trig) && function_5b2a85e4(trig))
		{
			trig.is_active = 1;
			NB = 2;
			if(function_821face3(trig, var_2fb50241) >= NB || GetAICount() > 60)
			{
				wait(0.05);
				continue;
			}
			wait(0.05);
			struct = Array::random(struct::get_array(trig.target));
			ai = function_61f3b72(struct);
			if(isdefined(ai))
			{
				ai.targetname = "thrasher_sep";
				health = 1000 * trig.script_int;
				ai setmaxhealth(health);
				ai.health = health;
				ai.ignore_enemy_count = 1;
			}
			if(isdefined(ai))
			{
				ai.trig = trig;
				ai thread function_5a4025b4(trig);
				if(!isdefined(var_2fb50241))
				{
					var_2fb50241 = [];
				}
				else if(!IsArray(var_2fb50241))
				{
					var_2fb50241 = Array(var_2fb50241);
				}
				var_2fb50241[var_2fb50241.size] = ai;
			}
			wait(0.05 * i);
		}
		if(isdefined(var_2fb50241) && var_2fb50241.size > 0)
		{
			foreach(var_2f8d19d2 in var_2fb50241)
			{
				if(isalive(var_2f8d19d2))
				{
					var_2f8d19d2 DoDamage(var_2f8d19d2.health + 666, var_2f8d19d2.origin);
					var_2f8d19d2 kill();
				}
			}
		}
		wait(0.05 * i);
		var_2fb50241 = undefined;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1004b0af
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x6CF8
	Size: 0x440
	Parameters: 2
	Flags: None
	Line Number: 2015
*/
function function_1004b0af(trig, i)
{
	level endon("hash_7b8561df");
	level endon("game_ended");
	if(isdefined(trig.script_notify))
	{
		level waittill("hash_eff9bce7");
		wait(3);
	}
	spawners = GetEntArray("zombie_dog_spawner", "script_noteworthy");
	while(1)
	{
		wait(0.05);
		trig.is_active = 0;
		while(!function_95443b19(trig) || !function_5b2a85e4(trig))
		{
			wait(0.05);
		}
		var_2fb50241 = Array();
		wait(0.05 * i);
		while(function_95443b19(trig) && function_5b2a85e4(trig))
		{
			trig.is_active = 1;
			if(trig.script_int > 6)
			{
				NB = 3;
			}
			else
			{
				NB = 3;
			}
			if(var_2fb50241.size >= NB || GetAICount() > 60)
			{
				wait(0.05);
				continue;
			}
			ai = zm_ai_dogs::special_dog_spawn(1, spawners[0], Array::random(struct::get_array(trig.target)));
			if(isdefined(ai))
			{
				ai.b_ignore_cleanup = 1;
				ai.ignoreRagdoll = 1;
				ai.noragdoll = 1;
				ai.var_753949a4 = GetTime();
				ai thread function_b3c9536b(trig);
				ai.ignore_enemy_count = 1;
				if(!isdefined(var_2fb50241))
				{
					var_2fb50241 = [];
				}
				else if(!IsArray(var_2fb50241))
				{
					var_2fb50241 = Array(var_2fb50241);
				}
				var_2fb50241[var_2fb50241.size] = ai;
				wait(0.05);
				if(isdefined(ai))
				{
					ai.trig = trig;
					ai thread function_5a4025b4(trig);
					wait(0.05 * i);
				}
			}
		}
		if(isdefined(var_2fb50241) && var_2fb50241.size > 0)
		{
			foreach(var_2f8d19d2 in var_2fb50241)
			{
				if(isalive(var_2f8d19d2))
				{
					var_2f8d19d2 DoDamage(var_2f8d19d2.health + 666, var_2f8d19d2.origin);
					var_2f8d19d2 kill();
				}
			}
		}
		var_2fb50241 = undefined;
		wait(0.05 * i);
	}
}

/*
	Name: function_b3c9536b
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x7140
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 2104
*/
function function_b3c9536b(trig)
{
	level endon("game_ended");
	wait(3);
	while(isdefined(self))
	{
		wait(0.05);
		if(!self istouching(trig) || !util::any_player_is_touching(trig, "allies"))
		{
			self kill();
		}
	}
}

/*
	Name: function_a77c8663
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x71C8
	Size: 0x480
	Parameters: 2
	Flags: None
	Line Number: 2128
*/
function function_a77c8663(trig, i)
{
	level endon("hash_7b8561df");
	level endon("game_ended");
	if(isdefined(trig.script_notify))
	{
		level waittill("hash_eff9bce7");
		wait(3);
	}
	while(1)
	{
		wait(0.05);
		trig.is_active = 0;
		while(!function_95443b19(trig) || !function_5b2a85e4(trig))
		{
			wait(0.05);
		}
		var_2fb50241 = Array();
		wait(0.05 * i);
		while(function_95443b19(trig) && function_5b2a85e4(trig))
		{
			trig.is_active = 1;
			if(trig.script_int > 6)
			{
				NB = 3;
			}
			else
			{
				NB = 3 * function_738586bf(trig);
				if(NB > 6)
				{
					NB = 6;
				}
			}
			if(function_5240a87c(trig) >= NB || GetAICount() > 60)
			{
				wait(0.05);
				continue;
			}
			ai = function_b712707d(Array::random(struct::get_array(trig.target)));
			if(isdefined(ai))
			{
				ai.var_753949a4 = GetTime();
				health = 200 * trig.script_int;
				ai setmaxhealth(health);
				ai.health = health;
				ai.ignore_enemy_count = 1;
				if(!isdefined(var_2fb50241))
				{
					var_2fb50241 = [];
				}
				else if(!IsArray(var_2fb50241))
				{
					var_2fb50241 = Array(var_2fb50241);
				}
				var_2fb50241[var_2fb50241.size] = ai;
				ai thread function_6bc0d498(var_2fb50241);
				wait(0.05);
				if(isdefined(ai))
				{
					ai.trig = trig;
					ai thread function_5a4025b4(trig);
					wait(0.05 * i);
				}
			}
		}
		if(isdefined(var_2fb50241) && var_2fb50241.size > 0)
		{
			foreach(var_2f8d19d2 in var_2fb50241)
			{
				if(isalive(var_2f8d19d2))
				{
					var_2f8d19d2 DoDamage(var_2f8d19d2.health + 666, var_2f8d19d2.origin);
					var_2f8d19d2 kill();
				}
			}
		}
		trig.var_c90ab0ce = 0;
		var_2fb50241 = undefined;
		wait(0.05 * i);
	}
}

/*
	Name: function_6bc0d498
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x7650
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 2221
*/
function function_6bc0d498(var_2fb50241)
{
	while(isdefined(self))
	{
		wait(0.05);
	}
	if(IsInArray(var_2fb50241, self) && (!(isdefined(self.var_45472a19) && self.var_45472a19)))
	{
		ArrayRemoveValue(var_2fb50241, self);
	}
}

/*
	Name: function_b2161d56
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x76D0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 2243
*/
function function_b2161d56(var_2fb50241)
{
	wait(2);
	ArrayRemoveValue(var_2fb50241, self);
}

/*
	Name: function_98533c34
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x7708
	Size: 0x520
	Parameters: 2
	Flags: None
	Line Number: 2259
*/
function function_98533c34(trig, i)
{
	level endon("hash_9576281f");
	level endon("game_ended");
	var_12e8a24a = GetEnt("zombie_spawner", "script_noteworthy");
	if(isdefined(trig.script_notify))
	{
		level.var_99942599 = trig;
		while(1)
		{
			wait(0.05);
			while(!function_95443b19(trig))
			{
				wait(0.05);
			}
			var_2fb50241 = Array();
			while(function_95443b19(trig))
			{
				if(!level flag::get("attackable_is_done"))
				{
					NB = 15 * function_738586bf(trig);
					if(NB > 30)
					{
						NB = 30;
					}
				}
				else
				{
					NB = 35 * function_738586bf(trig);
					if(NB > 50)
					{
						NB = 50;
					}
				}
				if(function_2af2d158(trig) >= NB || GetAICount() > 62)
				{
					wait(0.05);
					continue;
				}
				structs = struct::get_array("top_spawners");
				ai = zombie_utility::spawn_zombie(var_12e8a24a, "training_area", Array::random(structs));
				wait(0.05);
				if(isdefined(ai))
				{
					ai.trig = trig;
					ai thread function_5a4025b4(trig);
					ai.exclude_cleanup_adding_to_total = 1;
					ai.targetname = "top_temple_zomb";
				}
			}
			var_2fb50241 = undefined;
		}
	}
	else
	{
		wait(0.05);
		while(!function_95443b19(trig))
		{
			wait(0.05);
		}
		wait(0.05 * i);
		if(!level flag::get("attackable_is_done"))
		{
			var_2fb50241 = Array();
			if(trig.var_6ff8e277 == 1 || GetAICount() > 60)
			{
				wait(0.05);
				continue;
			}
			trig.var_6ff8e277 = 1;
			ai = namespace_58932b17::function_9ad9b550(Array::random(struct::get_array(trig.target)));
			if(isdefined(ai))
			{
				ai.ignore_enemy_count = 1;
				ai.avogadro = 1;
				ai.ignoreRagdoll = 1;
				ai.noragdoll = 1;
				ai.b_ignore_cleanup = 1;
				ai.trig = trig;
				ai thread function_5a4025b4(trig);
				wait(0.05);
			}
			while(function_95443b19(trig) && !level flag::get("attackable_is_done") && isdefined(ai))
			{
				wait(0.05);
			}
			ai DoDamage(ai.health, ai.origin);
			trig.var_6ff8e277 = 0;
			var_2fb50241 = undefined;
			wait(0.05 * i);
		}
	}
	while(!level flag::get("attackable_is_done"))
	{
	}
}

/*
	Name: function_3503fb77
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x7C30
	Size: 0x3E8
	Parameters: 2
	Flags: None
	Line Number: 2366
*/
function function_3503fb77(trig, i)
{
	level endon("hash_7b8561df");
	level endon("game_ended");
	trig.var_c2e74cf6 = 0;
	if(isdefined(trig.script_notify))
	{
		level waittill("hash_eff9bce7");
		wait(10);
	}
	while(1)
	{
		wait(0.05);
		trig.is_active = 0;
		while(!function_95443b19(trig) || !function_5b2a85e4(trig))
		{
			wait(0.05);
		}
		wait(0.05 * i);
		raps = Array();
		while(function_95443b19(trig) && function_5b2a85e4(trig))
		{
			trig.is_active = 1;
			NB = 15 * function_738586bf(trig);
			if(NB > 20)
			{
				NB = 20;
			}
			if(Int(trig.script_int) > 2)
			{
				NB = 4;
			}
			if(Int(trig.script_int) > 6)
			{
				NB = 3;
			}
			if(get_current_raps_count(trig) >= NB || GetAICount() > 60)
			{
				wait(0.05);
				continue;
			}
			var_2f8d19d2 = zm_ai_raps::special_raps_spawn(1, trig);
			if(isdefined(var_2f8d19d2))
			{
				raps.ignore_enemy_count = 1;
				var_2f8d19d2.var_753949a4 = GetTime();
				if(!isdefined(raps))
				{
					raps = [];
				}
				else if(!IsArray(raps))
				{
					raps = Array(raps);
				}
				raps[raps.size] = var_2f8d19d2;
				var_2f8d19d2 thread function_4c4464bc(trig);
			}
			wait(0.05);
			wait(0.05 * i);
		}
		wait(0.1);
		if(!function_95443b19(trig) || !function_5b2a85e4(trig))
		{
			if(isdefined(raps) && raps.size > 0)
			{
				foreach(var_2f8d19d2 in raps)
				{
					var_2f8d19d2 thread function_4569d0cc();
				}
			}
		}
		raps = undefined;
	}
	return;
}

/*
	Name: function_4569d0cc
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x8020
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2452
*/
function function_4569d0cc()
{
	wait(0.1);
	self delete();
}

/*
	Name: function_cd10d871
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x8050
	Size: 0x2A0
	Parameters: 1
	Flags: None
	Line Number: 2468
*/
function function_cd10d871(trig)
{
	while(isdefined(self))
	{
		var_31ab259f = [];
		foreach(player in GetPlayers())
		{
			if(self CanPath(self.origin, player.origin) && !player laststand::player_is_in_laststand() && !IsInArray(var_31ab259f, player))
			{
				if(!isdefined(var_31ab259f))
				{
					var_31ab259f = [];
				}
				else if(!IsArray(var_31ab259f))
				{
					var_31ab259f = Array(var_31ab259f);
				}
			}
			var_31ab259f[var_31ab259f.size] = player;
			if(!self CanPath(self.origin, player.origin) && IsInArray(var_31ab259f, player) || (player laststand::player_is_in_laststand() && IsInArray(var_31ab259f, player)))
			{
				ArrayRemoveValue(var_31ab259f, player);
			}
		}
		self.favoriteenemy = ArrayGetClosest(self.origin, var_31ab259f);
		self.enemy = self.favoriteenemy;
		if(!isdefined(self.favoriteenemy))
		{
			self SetVehGoalPos(self.origin, 0, 0);
		}
		else
		{
			self SetVehGoalPos(self.favoriteenemy.origin, 0, 0);
		}
		wait(0.1);
	}
}

/*
	Name: function_c0e501e9
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x82F8
	Size: 0x168
	Parameters: 2
	Flags: None
	Line Number: 2516
*/
function function_c0e501e9(origin, players)
{
	if(!isdefined(self.trig))
	{
		return undefined;
	}
	if(!isdefined(self))
	{
		return undefined;
	}
	var_97dc1c36 = [];
	foreach(player in players)
	{
		if(player istouching(self.trig) && !player laststand::player_is_in_laststand())
		{
			if(!isdefined(var_97dc1c36))
			{
				var_97dc1c36 = [];
			}
			else if(!IsArray(var_97dc1c36))
			{
				var_97dc1c36 = Array(var_97dc1c36);
			}
		}
		var_97dc1c36[var_97dc1c36.size] = player;
	}
	player = ArrayGetClosest(origin, var_97dc1c36);
	return player;
}

/*
	Name: function_34c62103
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x8468
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 2556
*/
function function_34c62103()
{
	self ghost();
	self notsolid();
	model = util::spawn_model("tag_origin", self.origin, self.angles);
	self LinkTo(model);
	model moveto(self.origin + 5000, 0.05);
	wait(0.1);
	self DoDamage(self.health, self.origin);
	return;
}

/*
	Name: function_2af2d158
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x8558
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 2578
*/
function function_2af2d158(trig)
{
	raps = GetEntArray("top_temple_zomb", "targetname");
	var_2fc4a315 = raps.size;
	foreach(en in raps)
	{
		if(!isalive(en))
		{
			var_2fc4a315--;
		}
	}
	return var_2fc4a315;
}

/*
	Name: function_5a4025b4
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x8640
	Size: 0x240
	Parameters: 1
	Flags: None
	Line Number: 2602
*/
function function_5a4025b4(trig)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(self.ignore_player))
	{
		self.ignore_player = [];
	}
	while(util::any_player_is_touching(trig, "allies") && isdefined(self))
	{
		foreach(player in GetPlayers())
		{
			if(!player istouching(trig) && !IsInArray(self.ignore_player, player) || (trig != self.trig && !IsInArray(self.ignore_player, player)))
			{
				if(!isdefined(self.ignore_player))
				{
					self.ignore_player = [];
				}
				else if(!IsArray(self.ignore_player))
				{
					self.ignore_player = Array(self.ignore_player);
				}
			}
			self.ignore_player[self.ignore_player.size] = player;
			if(player istouching(trig) && trig == self.trig)
			{
				if(IsInArray(self.ignore_player, player) && !player laststand::player_is_in_laststand())
				{
					ArrayRemoveValue(self.ignore_player, player);
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_4c4464bc
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x8888
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 2650
*/
function function_4c4464bc(trig)
{
	wait(6);
	while(isdefined(self))
	{
		wait(0.05);
		if(!self istouching(trig))
		{
			self delete();
		}
	}
}

/*
	Name: get_current_wasp_count
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x88E8
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 2673
*/
function get_current_wasp_count(trig)
{
	raps = GetEntArray("zombie_wasp", "targetname");
	var_2fc4a315 = raps.size;
	foreach(en in raps)
	{
		if(!isalive(en))
		{
			var_2fc4a315--;
		}
	}
	return var_2fc4a315;
}

/*
	Name: function_12d5ceb7
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x89D0
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 2697
*/
function function_12d5ceb7(trig)
{
	raps = GetEntArray("training_area_zomb", "targetname");
	var_2fc4a315 = raps.size;
	foreach(en in raps)
	{
		if(!isalive(en))
		{
			var_2fc4a315--;
		}
	}
	return var_2fc4a315;
}

/*
	Name: function_756ae657
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x8AB8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 2721
*/
function function_756ae657()
{
	wait(0.5);
	self DoDamage(self.health + 666, self.origin);
	self kill();
}

/*
	Name: function_b74eb531
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x8B10
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 2738
*/
function function_b74eb531()
{
	spiders = GetEntArray("spider_ai", "targetname");
	sentinel = GetEntArray("sentinel_drone", "targetname");
	raps = GetEntArray("zombie_raps", "targetname");
	var_2fc4a315 = raps.size + sentinel.size + spiders.size;
	return var_2fc4a315;
}

/*
	Name: get_current_spider_count
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x8BD0
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 2757
*/
function get_current_spider_count(trig)
{
	raps = GetEntArray("spider_ai", "targetname");
	var_2fc4a315 = raps.size;
	foreach(en in raps)
	{
		if(!isalive(en) || !en istouching(trig))
		{
			var_2fc4a315--;
		}
	}
	return var_2fc4a315;
}

/*
	Name: function_821face3
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x8CD8
	Size: 0x120
	Parameters: 2
	Flags: None
	Line Number: 2781
*/
function function_821face3(trig, var_2fb50241)
{
	raps = GetEntArray("thrasher_sep", "targetname");
	var_2fc4a315 = raps.size;
	if(var_2fb50241.size > 0)
	{
		foreach(en in raps)
		{
			if(!isalive(en) || !en istouching(trig))
			{
				var_2fc4a315--;
			}
		}
		return var_2fc4a315;
	}
	return var_2fc4a315;
}

/*
	Name: function_881a976b
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x8E00
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 2809
*/
function function_881a976b(trig, var_2fb50241)
{
	raps = getaiarchetypearray("mechz");
	var_2fc4a315 = raps.size;
	if(var_2fc4a315 > 0)
	{
		foreach(en in raps)
		{
			if(!isalive(en) || !en istouching(trig))
			{
				var_2fc4a315--;
			}
		}
		return var_2fc4a315;
	}
	return var_2fc4a315;
}

/*
	Name: function_56435172
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x8F18
	Size: 0x120
	Parameters: 2
	Flags: None
	Line Number: 2837
*/
function function_56435172(trig, var_2fb50241)
{
	raps = GetEntArray("sentinel_drone", "targetname");
	wait(0.05);
	var_2fc4a315 = raps.size;
	if(var_2fc4a315 > 0)
	{
		foreach(en in raps)
		{
			if(!isalive(en) || !IsInArray(var_2fb50241, en))
			{
				var_2fc4a315--;
			}
		}
		return var_2fc4a315;
	}
	return var_2fc4a315;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_current_raz_count
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x9040
	Size: 0x118
	Parameters: 2
	Flags: None
	Line Number: 2867
*/
function get_current_raz_count(trig, var_2fb50241)
{
	raps = getaiarchetypearray("raz");
	wait(0.05);
	var_2fc4a315 = raps.size;
	if(var_2fc4a315 > 0)
	{
		foreach(en in raps)
		{
			if(!isalive(en) || !en istouching(trig))
			{
				var_2fc4a315--;
			}
		}
		return var_2fc4a315;
	}
	return var_2fc4a315;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8d4ce7a3
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x9160
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 2897
*/
function function_8d4ce7a3(trig)
{
	raps = GetEntArray("margwa", "targetname");
	wait(0.05);
	var_2fc4a315 = raps.size;
	foreach(en in raps)
	{
		if(!isalive(en) || !en istouching(trig))
		{
			var_2fc4a315--;
		}
	}
	return var_2fc4a315;
}

/*
	Name: get_current_raps_count
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x9270
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 2922
*/
function get_current_raps_count(trig)
{
	raps = GetEntArray("zombie_raps", "targetname");
	var_2fc4a315 = raps.size;
	foreach(en in raps)
	{
		if(!en istouching(trig))
		{
			var_2fc4a315--;
		}
	}
	return var_2fc4a315;
}

/*
	Name: function_9961d635
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x9358
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 2946
*/
function function_9961d635(trig)
{
	raps = GetEntArray("zombie_dog", "targetname");
	wait(0.05);
	var_2fc4a315 = raps.size;
	foreach(en in raps)
	{
		if(!en istouching(trig) && en.var_753949a4 + 2500 > GetTime())
		{
			continue;
		}
		if(!isalive(en) || !en istouching(trig))
		{
			var_2fc4a315--;
		}
	}
	return var_2fc4a315;
}

/*
	Name: function_66962612
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x94A0
	Size: 0x118
	Parameters: 2
	Flags: None
	Line Number: 2975
*/
function function_66962612(trig, var_2fb50241)
{
	enemies = getaiarchetypearray("zombie_quad");
	wait(0.05);
	var_2fc4a315 = enemies.size;
	if(var_2fc4a315 > 0)
	{
		foreach(en in enemies)
		{
			if(!isalive(en) || !en istouching(trig))
			{
				var_2fc4a315--;
			}
		}
		return var_2fc4a315;
	}
	return var_2fb50241.size;
}

/*
	Name: function_5240a87c
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x95C0
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 3004
*/
function function_5240a87c(trig)
{
	enemies = getaiarchetypearray("apothicon_fury");
	wait(0.05);
	var_2fc4a315 = enemies.size;
	foreach(en in enemies)
	{
		if(!isalive(en) || !en istouching(trig))
		{
			var_2fc4a315--;
		}
	}
	return var_2fc4a315;
}

/*
	Name: function_95443b19
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x96C8
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 3029
*/
function function_95443b19(trig)
{
	foreach(player in GetPlayers())
	{
		if(player istouching(trig) && !player laststand::player_is_in_laststand() && !player.sessionstate != "spectator")
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_acdb1eb1
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x97B8
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 3051
*/
function function_acdb1eb1()
{
	level flag::wait_till("all_players_connected");
	level._zombie_custom_add_weapons = &custom_add_weapons;
	while(1)
	{
		level waittill("start_of_round");
		level.zombie_total = 24;
		difficulty = 3;
		column = Int(difficulty) + 1;
		zombie_utility::set_zombie_var("zombie_spawn_delay", 1, 0, column);
		zombie_utility::set_zombie_var("zombie_new_runner_interval", 3, 0, column);
		zombie_utility::set_zombie_var("zombie_move_speed_multiplier", 25, 0, column);
		zombie_utility::set_zombie_var("zombie_move_speed_multiplier_easy", 25, 0, column);
		zombie_utility::set_zombie_var("zombie_max_ai", 30, 0, column);
		zombie_utility::set_zombie_var("zombie_ai_per_player", 18, 0, column);
		zombie_utility::set_zombie_var("penalty_no_revive", 0, 1, column);
		level.zombie_move_speed = level.round_number * level.zombie_vars["zombie_move_speed_multiplier"];
	}
}

/*
	Name: function_b712707d
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x9968
	Size: 0x2A0
	Parameters: 1
	Flags: None
	Line Number: 3082
*/
function function_b712707d(s_struct)
{
	if(!isdefined(s_struct))
	{
		IPrintLnBold("NO VALID SPAWN POINTS FOUND");
		return undefined;
	}
	spawner = GetEntArray("apothicon_fury_spawner", "targetname");
	spawner = Array::random(spawner);
	if(!isdefined(spawner))
	{
		IPrintLnBold("no spawner");
		return;
	}
	e_ai = zombie_utility::spawn_zombie(spawner, "apothicon_fury");
	if(!isdefined(e_ai))
	{
		return;
	}
	e_ai endon("death");
	e_ai PushActors(1);
	e_ai.health = 500;
	e_ai ForceTeleport(s_struct.origin, s_struct.angles, 0);
	meteor = spawn("script_model", e_ai.origin + VectorScale((0, 0, 1), 500));
	meteor SetModel("tag_origin");
	meteor moveto(e_ai.origin, 1);
	meteor clientfield::set("apothicon_fury_spawn_meteor", 1);
	meteor waittill("movedone");
	meteor clientfield::set("apothicon_fury_spawn_meteor", 2);
	e_ai show();
	e_ai solid();
	e_ai PathMode("move allowed");
	e_ai.zombie_think_done = 1;
	wait(0.5);
	meteor delete();
	return e_ai;
}

/*
	Name: function_5be091aa
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x9C10
	Size: 0x2D8
	Parameters: 2
	Flags: None
	Line Number: 3130
*/
function function_5be091aa(s_struct, type)
{
	if(!isdefined(s_struct))
	{
		IPrintLnBold("NO VALID SPAWN POINTS FOUND");
		return undefined;
	}
	spawner = GetEntArray("margwa_spawner", "targetname");
	spawner = Array::random(spawner);
	if(!isdefined(spawner))
	{
		IPrintLnBold("no spawner");
		return;
	}
	e_ai = zombie_utility::spawn_zombie(spawner, "margwa");
	if(!isdefined(e_ai))
	{
		return;
	}
	e_ai endon("death");
	e_ai PushActors(1);
	e_ai.targetname = "margwa";
	e_ai MargwaServerUtils::margwaSetHeadHealth(500);
	e_ai ForceTeleport(s_struct.origin, s_struct.angles, 0);
	e_ai.isFrozen = 1;
	e_ai ghost();
	e_ai notsolid();
	e_ai PathMode("dont move");
	util::wait_network_frame();
	e_ai clientfield::increment("margwa_fx_spawn");
	wait(2);
	e_ai.goalRadius = 32;
	e_ai.isFrozen = 0;
	e_ai show();
	e_ai solid();
	e_ai PathMode("move allowed");
	e_ai.ignoreRagdoll = 1;
	e_ai.noragdoll = 1;
	e_ai.canDamage = 1;
	e_ai.needSpawn = 1;
	e_ai thread function_63499a8d();
	return e_ai;
}

/*
	Name: function_63499a8d
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x9EF0
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 3184
*/
function function_63499a8d()
{
	self waittill("death");
	self.attacker zm_score::add_to_player_score(1500);
	if(self.attacker.challenge == "margwa")
	{
		self.attacker.var_5c50f6ea++;
	}
	var_68628def = Array("double_points", "full_ammo");
	powerup = zm_powerups::specific_powerup_drop(Array::random(var_68628def), self.origin);
	wait(4);
	self delete();
}

/*
	Name: function_32c1dd92
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x9FE0
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 3208
*/
function function_32c1dd92(type)
{
	if(1)
	{
		level.margwa_head_left_model_override = undefined;
		level.margwa_head_mid_model_override = undefined;
		level.margwa_head_right_model_override = undefined;
		level.margwa_gore_left_model_override = undefined;
		level.margwa_gore_mid_model_override = undefined;
		level.margwa_gore_right_model_override = undefined;
		switch(type)
		{
			case "fire":
			{
				level.margwa_head_left_model_override = "c_zom_dlc4_margwa_chunks_le_fire";
				level.margwa_head_mid_model_override = "c_zom_dlc4_margwa_chunks_mid_fire";
				level.margwa_head_right_model_override = "c_zom_dlc4_margwa_chunks_ri_fire";
				level.margwa_gore_left_model_override = "c_zom_dlc4_margwa_gore_le_fire";
				level.margwa_gore_mid_model_override = "c_zom_dlc4_margwa_gore_mid_fire";
				level.margwa_gore_right_model_override = "c_zom_dlc4_margwa_gore_ri_fire";
				break;
			}
			case "shadow":
			{
				level.margwa_head_left_model_override = "c_zom_dlc4_margwa_chunks_le_shadow";
				level.margwa_head_mid_model_override = "c_zom_dlc4_margwa_chunks_mid_shadow";
				level.margwa_head_right_model_override = "c_zom_dlc4_margwa_chunks_ri_shadow";
				level.margwa_gore_left_model_override = "c_zom_dlc4_margwa_gore_le_shadow";
				level.margwa_gore_mid_model_override = "c_zom_dlc4_margwa_gore_mid_shadow";
				level.margwa_gore_right_model_override = "c_zom_dlc4_margwa_gore_ri_shadow";
				break;
			}
		}
		level.margwa_head_left_model_override = undefined;
		level.margwa_head_mid_model_override = undefined;
		level.margwa_head_right_model_override = undefined;
		level.margwa_gore_left_model_override = undefined;
		level.margwa_gore_mid_model_override = undefined;
		level.margwa_gore_right_model_override = undefined;
	}
}

/*
	Name: function_61f3b72
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0xA150
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 3260
*/
function function_61f3b72(s_struct)
{
	if(!isdefined(s_struct))
	{
		IPrintLnBold("NO VALID SPAWN POINTS FOUND");
		return undefined;
	}
	spawner = GetEntArray("thrasher_spawner", "targetname");
	spawner = Array::random(spawner);
	if(!isdefined(spawner))
	{
		IPrintLnBold("no spawner");
		return;
	}
	e_ai = zombie_utility::spawn_zombie(spawner, "thrasher", s_struct);
	if(!isdefined(e_ai))
	{
		return;
	}
	e_ai endon("death");
	e_ai PushActors(1);
	e_ai.health = 3000;
	e_ai ForceTeleport(s_struct.origin, s_struct.angles, 0);
	return e_ai;
}

/*
	Name: spawn_spider
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0xA2A0
	Size: 0x208
	Parameters: 2
	Flags: None
	Line Number: 3296
*/
function spawn_spider(s_struct, trig)
{
	if(!isdefined(s_struct))
	{
		IPrintLnBold("NO VALID SPAWN POINTS FOUND");
		return undefined;
	}
	spawner = GetEntArray("spider_spawner", "targetname");
	spawner = spawner[0];
	if(!isdefined(spawner))
	{
		IPrintLnBold("no spawner");
		return;
	}
	e_ai = SpawnVehicle("spawner_bo3_spider_enemy_faster", s_struct.origin, s_struct.angles, "spider");
	if(!isdefined(e_ai))
	{
		return;
	}
	e_ai.trig = trig;
	e_ai endon("death");
	e_ai.targetname = "spider";
	e_ai PushActors(1);
	e_ai.ai_state = "";
	e_ai.find_flesh_struct_string = "find_flesh";
	e_ai PathMode("move allowed");
	e_ai.ignore_player = [];
	e_ai.ignoreall = 0;
	e_ai.ignoreme = 0;
	e_ai.zombie_think_done = 1;
	e_ai.ai_state = "zombie_think";
	e_ai.health = 100;
	e_ai Spider::spider_initialize();
	return e_ai;
}

/*
	Name: mechz_spawn
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0xA4B0
	Size: 0x360
	Parameters: 3
	Flags: None
	Line Number: 3342
*/
function mechz_spawn(s_struct, tomb, health)
{
	if(!isdefined(s_struct))
	{
		IPrintLnBold("NO VALID SPAWN POINTS FOUND");
		return undefined;
	}
	spawner = GetEntArray("mechz_genesis_spawner", "targetname");
	if(isdefined(tomb) && tomb == 1)
	{
		spawner = GetEntArray("mechz_tomb_spawner", "targetname");
	}
	spawner = spawner[0];
	if(!isdefined(spawner))
	{
		IPrintLnBold("no spawner");
		return;
	}
	if(isdefined(tomb) && tomb == 1)
	{
		e_ai = zombie_utility::spawn_zombie(spawner, "mechz_tomb", s_struct.origin);
	}
	else
	{
		e_ai = zombie_utility::spawn_zombie(spawner, "mechz", s_struct.origin);
	}
	if(!isdefined(e_ai))
	{
		return;
	}
	e_ai endon("death");
	e_ai.no_eye_glow = 1;
	e_ai.var_2dce8d67 = 1;
	e_ai.b_ignore_cleanup = 1;
	e_ai.goalRadius = 32;
	e_ai PushActors(1);
	e_ai.health = 1500;
	if(isdefined(health))
	{
		e_ai.health = health;
	}
	e_ai.b_flyin_done = 0;
	if(isdefined(s_struct.script_string) && s_struct.script_string == "flyin")
	{
		e_ai ForceTeleport(s_struct.origin, s_struct.angles, 0);
		e_ai scene::Play("ai_zm_dlc1_soldat_arrive_2", e_ai);
	}
	else
	{
		playFX("dlc4/genesis/fx_mech_spawn", s_struct.origin);
		playsoundatposition("panzer_prespawn", s_struct.origin);
		wait(0.5);
		e_ai ForceTeleport(s_struct.origin, s_struct.angles, 0);
	}
	e_ai.b_flyin_done = 1;
	e_ai thread mechz_death();
	return e_ai;
}

/*
	Name: mechz_death
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0xA818
	Size: 0x84
	Parameters: 0
	Flags: None
	Line Number: 3411
*/
function mechz_death()
{
	self waittill("death");
	self.attacker zm_score::player_add_points("death_mechz", 1500);
	self waittill("hash_46c1e51d");
	self clientfield::set("mechz_fx", 1);
	zm_powerups::specific_powerup_drop("full_ammo", self.origin);
}

