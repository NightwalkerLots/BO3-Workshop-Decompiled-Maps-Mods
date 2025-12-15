#include scripts\codescripts\struct;
#include scripts\core\gametypes\frontend_zm_bgb_chance;
#include scripts\shared\ai\animation_selector_table_evaluators;
#include scripts\shared\ai\archetype_cover_utility;
#include scripts\shared\ai\archetype_damage_effects;
#include scripts\shared\ai\archetype_locomotion_utility;
#include scripts\shared\ai\archetype_mocomps_utility;
#include scripts\shared\ai\archetype_utility;
#include scripts\shared\ai\behavior_state_machine_planners_utility;
#include scripts\shared\ai\zombie;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\math_shared;
#include scripts\shared\player_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\util_shared;

#namespace frontend;

/*
	Name: callback_void
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x10B8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function callback_void()
{
}

/*
	Name: function_9f2214d4
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x10C8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 46
*/
function function_9f2214d4(spawner)
{
	self thread spawner::spawn_think(spawner);
}

/*
	Name: main
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x10F8
	Size: 0x460
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function main()
{
	level.callbackStartGameType = &callback_void;
	level.callbackPlayerConnect = &Callback_PlayerConnect;
	level.callbackPlayerDisconnect = &callback_void;
	level.callbackEntitySpawned = &callback_void;
	level.callbackActorSpawned = &function_9f2214d4;
	level.orbis = GetDvarString("orbisGame") == "true";
	level.durango = GetDvarString("durangoGame") == "true";
	scene::add_scene_func("sb_frontend_black_market", &function_98e4f876, "play");
	clientfield::register("world", "first_time_flow", 1, GetMinBitCountForNum(1), "int");
	clientfield::register("world", "cp_bunk_anim_type", 1, GetMinBitCountForNum(1), "int");
	clientfield::register("actor", "zombie_has_eyes", 1, 1, "int");
	clientfield::register("scriptmover", "dni_eyes", 1000, 1, "int");
	level.weaponNone = GetWeapon("none");
	level thread function_78987129();
	level thread random_perk_machine();
	level thread function_12798feb();
	level thread function_e53b379f();
	level thread namespace_dd96a64a::function_910ec890();
	level thread function_f7d50167();
	level thread function_33f0733b();
	SetDvar("g_gametype", "onslaught");
	SetGametypeSetting("loadoutKillstreaksEnabled", 0);
	SetGametypeSetting("playerForceRespawn", 0);
	SetGametypeSetting("perksEnabled", 0);
	SetGametypeSetting("disableAttachments", 1);
	SetGametypeSetting("disableTacInsert", 1);
	SetGametypeSetting("disableCAC", 1);
	SetGametypeSetting("disableClassSelection", 1);
	SetGametypeSetting("disableweapondrop", 1);
	SetGametypeSetting("deathPointLoss", 0);
	SetGametypeSetting("teamCount", 1);
	SetGametypeSetting("roundLimit", 1);
	SetGametypeSetting("allowAnnouncer", 0);
	SetGametypeSetting("disableVehicleSpawners", 1);
	SetGametypeSetting("forceRadar", 1);
	return;
	ERROR: Bad function call
}

/*
	Name: function_33f0733b
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x1560
	Size: 0x2E0
	Parameters: 0
	Flags: None
	Line Number: 112
*/
function function_33f0733b()
{
	wait(1);
	models = [];
	models[models.size] = "c_zom_der_richtofen_mpc_fb";
	models[models.size] = "c_zom_der_nikolai_mpc_fb";
	models[models.size] = "c_zom_der_dempsey_mpc_fb";
	models[models.size] = "c_zom_der_takeo_mpc_fb";
	models[models.size] = "c_zom_zod_boxer_mpc_fb";
	models[models.size] = "c_zom_zod_femme_mpc_fb";
	models[models.size] = "c_zom_zod_magician_mpc_fb";
	models[models.size] = "c_zom_zod_detective_mpc_fb";
	var_600efb9c = models[RandomInt(models.size)];
	var_71e3ee15 = RandomInt(10);
	var_eedc34d6 = GetEntArray("sb_frontend_mainmenu_character", "targetname");
	foreach(var_a0bd4da1 in var_eedc34d6)
	{
		var_a0bd4da1 SetModel(var_600efb9c);
		if(var_71e3ee15 == 1)
		{
			var_a0bd4da1 Attach("p7_zm_bgb_plash_floatie_duck", "J_SpineLower", 1);
		}
	}
	var_eedc34d6 = GetEntArray("sb_frontend_pressstart_character", "targetname");
	foreach(var_a0bd4da1 in var_eedc34d6)
	{
		var_a0bd4da1 SetModel(var_600efb9c);
		if(var_71e3ee15 == 1)
		{
			var_a0bd4da1 Attach("p7_zm_bgb_plash_floatie_duck", "J_SpineLower", 1);
		}
	}
}

/*
	Name: function_f7d50167
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x1848
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 156
*/
function function_f7d50167()
{
	wait(0.05);
	if(world.var_1048aced !== 0)
	{
		world.var_3dcac2e2 = 0;
		level clientfield::set("first_time_flow", 1);
	}
	else if(math::cointoss())
	{
		world.var_3dcac2e2 = 0;
	}
	else
	{
		world.var_3dcac2e2 = 1;
	}
	level clientfield::set("cp_bunk_anim_type", world.var_3dcac2e2);
}

/*
	Name: function_78987129
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x1900
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function function_78987129()
{
	wait(5);
	var_765b3a01 = GetEntArray("sp_zombie_frontend", "targetname");
	while(1)
	{
		var_765b3a01 = Array::randomize(var_765b3a01);
		foreach(var_a0bd4da1 in var_765b3a01)
		{
			while(GetAICount() >= 20)
			{
				wait(1);
			}
			ai_zombie = var_a0bd4da1 SpawnFromSpawner();
			if(isdefined(ai_zombie))
			{
				ai_zombie SetHighDetail(1);
				ai_zombie SetAvoidanceMask("avoid all");
				ai_zombie PushActors(0);
				ai_zombie clientfield::set("zombie_has_eyes", 1);
				ai_zombie.delete_on_path_end = 1;
				ai_zombie.disableTargetService = 1;
				ai_zombie.ignoreall = 1;
				var_a0bd4da1.count++;
			}
			wait(RandomFloatRange(3, 8));
		}
	}
}

/*
	Name: random_perk_machine
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x1B00
	Size: 0x560
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function random_perk_machine()
{
	PERKS = [];
	PERKS[PERKS.size] = "cz_vending_timeslip2";
	PERKS[PERKS.size] = "cz_zombie_vending_mh_mocha";
	PERKS[PERKS.size] = "cz_zombie_vending_bandolier";
	PERKS[PERKS.size] = "cz_zombie_vending_nitrogen";
	PERKS[PERKS.size] = "cz_zombie_vending_nuka_cola";
	PERKS[PERKS.size] = "cz_zombie_vending_packbox";
	PERKS[PERKS.size] = "cz_vending_slider";
	PERKS[PERKS.size] = "cz_vending_point_crusher";
	PERKS[PERKS.size] = "cz_zombie_vending_stronghold";
	PERKS[PERKS.size] = "cz_zombie_vending_swarmscotch";
	PERKS[PERKS.size] = "cz_vending_victorious";
	PERKS[PERKS.size] = "p6_zm_vending_vultureaid_on";
	PERKS[PERKS.size] = "cz_zombie_vending_winterswail";
	PERKS[PERKS.size] = "chm_zm_vending_zombshell";
	PERKS[PERKS.size] = "p7_zm_vending_blazephase_on";
	PERKS[PERKS.size] = "cz_zombie_vending_blood_bullets";
	PERKS[PERKS.size] = "cz_zombie_vending_cashback";
	PERKS[PERKS.size] = "cz_zombie_vending_da_phd_slider";
	PERKS[PERKS.size] = "cz_zombie_vending_damnade";
	PERKS[PERKS.size] = "cz_zombie_vending_da_death_perception";
	PERKS[PERKS.size] = "cz_zombie_vending_downers_delight";
	PERKS[PERKS.size] = "cz_vending_dying_wish_new";
	PERKS[PERKS.size] = "cz_zombie_vending_elemental_pop";
	PERKS[PERKS.size] = "cz_zombie_vending_estatic";
	PERKS[PERKS.size] = "cz_vending_razor_new";
	PERKS[PERKS.size] = "cz_zombie_vending_inferno";
	PERKS[PERKS.size] = "cz_zombie_vending_magnet";
	PERKS[PERKS.size] = "cz_vending_spectorshot_on";
	PERKS[PERKS.size] = "p6_zm_vending_momentum_on";
	PERKS[PERKS.size] = "p7_zm_vending_repairman_on";
	PERKS[PERKS.size] = "p7_zm_vending_nobear_on";
	PERKS = Array::randomize(PERKS);
	for(i = 0; i < PERKS.size; i++)
	{
		fxOrg = spawn("script_model", (-168, 2192, -40));
		fxOrg SetModel(PERKS[i]);
	}
	locs = [];
	var_2d2bdc32 = [];
	machines = [];
	locs[locs.size] = (-168, 2192, 122);
	var_2d2bdc32[var_2d2bdc32.size] = VectorScale((0, 1, 0), 30);
	locs[locs.size] = (72, 2400, 122);
	var_2d2bdc32[var_2d2bdc32.size] = VectorScale((0, -1, 0), 30);
	locs[locs.size] = (-202, 2960, 154);
	var_2d2bdc32[var_2d2bdc32.size] = VectorScale((0, 1, 0), 14);
	locs[locs.size] = (376, 3312, 266);
	var_2d2bdc32[var_2d2bdc32.size] = VectorScale((0, -1, 0), 30);
	for(i = 0; i < locs.size; i++)
	{
		var_8be4db6f = spawn("script_model", locs[i]);
		var_8be4db6f SetModel(PERKS[RandomInt(PERKS.size)]);
		var_8be4db6f.angles = var_2d2bdc32[i];
		var_8be4db6f.targetname = "random_perk_machine";
		machines[machines.size] = var_8be4db6f;
	}
	while(1)
	{
		for(i = 0; i < machines.size; i++)
		{
			machines[i] SetModel(PERKS[RandomInt(PERKS.size)]);
			wait(2);
		}
		wait(0.01);
	}
}

/*
	Name: function_e53b379f
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2068
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 305
*/
function function_e53b379f()
{
	fxOrg = spawn("script_model", (-95, 2112, 152));
	fxOrg SetModel("tag_origin");
	fxOrg.targetname = "reap_light";
	FX = PlayFXOnTag("frontend/frontend_zombies_light", fxOrg, "tag_origin");
}

/*
	Name: function_57fb29cc
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2108
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 323
*/
function function_57fb29cc()
{
	var_8be4db6f = spawn("script_model", (-95, 2227, 232));
	var_8be4db6f SetModel("cz_zombie_patron");
	var_8be4db6f.angles = VectorScale((0, -1, 0), 90);
	var_8be4db6f SetHighDetail(1);
	var_8be4db6f.targetname = "patreon";
}

/*
	Name: function_12798feb
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x21B0
	Size: 0x558
	Parameters: 0
	Flags: None
	Line Number: 342
*/
function function_12798feb()
{
	var_d65b3f36 = [];
	var_d65b3f36[var_d65b3f36.size] = %emote_boast_yogging;
	var_d65b3f36[var_d65b3f36.size] = %emote_boast_laugh;
	var_d65b3f36[var_d65b3f36.size] = %emote_boast_gun_show;
	var_d65b3f36[var_d65b3f36.size] = %emote_boast_dip_low;
	var_d65b3f36[var_d65b3f36.size] = %emote_boast_clucked_up;
	var_d65b3f36[var_d65b3f36.size] = %emote_boast_zombie_eats_brain;
	var_d65b3f36[var_d65b3f36.size] = %emote_boast_so_fresh;
	var_d65b3f36[var_d65b3f36.size] = %emote_boast_poplock;
	var_d65b3f36[var_d65b3f36.size] = %emote_goodgame_bow;
	var_d65b3f36[var_d65b3f36.size] = %emote_goodgame_bunny_hop;
	var_d65b3f36[var_d65b3f36.size] = %emote_goodgame_jump_for_joy;
	var_d65b3f36[var_d65b3f36.size] = %emote_goodgame_nunchokes;
	var_d65b3f36[var_d65b3f36.size] = %emote_goodgame_your_so_meme;
	var_d65b3f36[var_d65b3f36.size] = %emote_goodgame_but_that_flip_though;
	var_d65b3f36[var_d65b3f36.size] = %emote_goodgame_clapping;
	var_d65b3f36[var_d65b3f36.size] = %emote_goodgame_high_five_for_one;
	var_d65b3f36[var_d65b3f36.size] = %emote_threat_grave_digger;
	var_d65b3f36[var_d65b3f36.size] = %emote_threat_heart_attack;
	var_d65b3f36[var_d65b3f36.size] = %emote_threat_king_of_the_castle;
	var_d65b3f36[var_d65b3f36.size] = %emote_threat_motivational;
	var_d65b3f36[var_d65b3f36.size] = %emote_threat_shadow_boxing;
	var_d65b3f36[var_d65b3f36.size] = %emote_threat_throat_slit;
	var_d65b3f36[var_d65b3f36.size] = %emote_threat_sweep_this;
	var_d65b3f36[var_d65b3f36.size] = %emote_threat_meanstreak;
	var_d65b3f36[var_d65b3f36.size] = %emote_dance_shoes;
	var_d65b3f36[var_d65b3f36.size] = %emote_war_mooshine;
	var_d65b3f36[var_d65b3f36.size] = %emote_firebreakin;
	var_d65b3f36[var_d65b3f36.size] = %emote_wild_style;
	var_d65b3f36[var_d65b3f36.size] = %emote_barn_burner;
	var_d65b3f36[var_d65b3f36.size] = %emote_bo4_jamn_on_the_one;
	models = [];
	models[models.size] = "c_zom_der_richtofen_mpc_fb";
	models[models.size] = "c_zom_der_nikolai_mpc_fb";
	models[models.size] = "c_zom_der_dempsey_mpc_fb";
	models[models.size] = "c_zom_der_takeo_mpc_fb";
	models[models.size] = "c_zom_zod_boxer_mpc_fb";
	models[models.size] = "c_zom_zod_femme_mpc_fb";
	models[models.size] = "c_zom_zod_magician_mpc_fb";
	models[models.size] = "c_zom_zod_detective_mpc_fb";
	var_8be4db6f = spawn("script_model", (-105, 2192, 120));
	var_8be4db6f SetModel(models[RandomInt(models.size)]);
	var_8be4db6f.angles = VectorScale((0, -1, 0), 110);
	var_8be4db6f useanimtree(-1);
	if(RandomInt(10) == 1)
	{
		var_8be4db6f Attach("p7_zm_bgb_plash_floatie_duck", "J_SpineLower", 1);
	}
	while(1)
	{
		var_a7f182ef = var_d65b3f36[RandomInt(var_d65b3f36.size)];
		var_8be4db6f AnimScripted("optionalNotify", var_8be4db6f.origin, var_8be4db6f.angles, var_a7f182ef);
		time = getanimlength(var_a7f182ef);
		wait(time);
		wait(0.01);
		var_8be4db6f SetModel(models[RandomInt(models.size)]);
	}
}

/*
	Name: function_c9747c9e
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2710
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 413
*/
function function_c9747c9e()
{
	while(1)
	{
		or = self.origin;
		while(or == self.origin)
		{
			wait(0.3);
		}
		level notify("hash_c9747c9e");
		wait(0.1);
	}
}

/*
	Name: Callback_PlayerConnect
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2770
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 437
*/
function Callback_PlayerConnect()
{
	self thread function_c9747c9e();
	self thread function_c7410880();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_98e4f876
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x27B0
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 455
*/
function function_98e4f876(a_ents)
{
	level.var_65f83320 = self.origin;
	level.var_a1674e6e = self.angles;
	level.var_cc4f1e31 = a_ents["sb_frontend_black_market_character"];
	level.var_bd18dfbe = a_ents["lefthand"];
	level.var_54a434fc = a_ents["righthand"];
	level scene::stop("sb_frontend_black_market");
	level.var_cc4f1e31 clientfield::set("dni_eyes", 1);
}

/*
	Name: function_c7410880
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2868
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 476
*/
function function_c7410880()
{
	self endon("hash_82223b0f");
	while(1)
	{
		self waittill("hash_6fb48969", menu, response);
		if(menu != "BlackMarket")
		{
			continue;
		}
		switch(response)
		{
			case "greeting":
			{
				thread function_d9abcfe();
				break;
			}
			case "greeting_first":
			{
				function_888326b9("vox_mark_greeting_first");
				break;
			}
			case "greeting_broke":
			{
				thread function_f174105a();
				break;
			}
			case "roll":
			{
				function_888326b9("vox_mark_roll_in_progress");
				break;
			}
			case "complete_common":
			{
				function_888326b9("vox_mark_complete_common");
				break;
			}
			case "complete_rare":
			{
				function_888326b9("vox_mark_complete_rare");
				break;
			}
			case "complete_legendary":
			{
				function_888326b9("vox_mark_complete_legendary");
				break;
			}
			case "complete_epic":
			{
				function_888326b9("vox_mark_complete_epic");
				break;
			}
			case "burn_duplicates":
			{
				thread function_ae2deb8();
				break;
			}
			case "stopsounds":
			{
				level.var_cc4f1e31 stopsounds();
				break;
			}
			case "closed":
			{
				level.var_cc4f1e31 stopsounds();
				level.var_cc4f1e31 thread animation::stop(0.2);
				level.var_bd18dfbe thread animation::stop(0.2);
				level.var_54a434fc thread animation::stop(0.2);
				level.var_cc4f1e31 notify("hash_f6aee61f");
				break;
			}
		}
	}
}

/*
	Name: function_888326b9
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2AE8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 561
*/
function function_888326b9(dialogAlias)
{
	if(!isdefined(dialogAlias))
	{
		return;
	}
	level.var_cc4f1e31 stopsounds();
	level.var_cc4f1e31 PlaySoundOnTag(dialogAlias, "J_Head");
}

/*
	Name: function_c2c50a17
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2B50
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 581
*/
function function_c2c50a17()
{
	if(GetLocalProfileInt("com_firsttime_blackmarket"))
	{
		return 0;
	}
	level.var_cc4f1e31 endon("hash_f6aee61f");
	function_c5205bdc("pb_black_marketeer_1st_time_greeting_", "o_black_marketeer_tumbler_1st_time_greeting_", "o_black_marketeer_pistol_1st_time_greeting_", "01");
	level.var_cc4f1e31 waittill("hash_c9fadaad");
	SetLocalProfileVar("com_firsttime_blackmarket", 1);
	return 1;
}

/*
	Name: function_d9abcfe
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2BF0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 604
*/
function function_d9abcfe()
{
	level.var_cc4f1e31 endon("hash_f6aee61f");
	if(function_c2c50a17())
	{
		return;
	}
	var_27284619 = function_b64618f7(11);
	function_c5205bdc("pb_black_marketeer_greeting_", "o_black_marketeer_tumbler_greeting_", "o_black_marketeer_pistol_greeting_", var_27284619);
	return;
}

/*
	Name: function_f174105a
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2C70
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 626
*/
function function_f174105a()
{
	level.var_cc4f1e31 endon("hash_f6aee61f");
	if(function_c2c50a17())
	{
		return;
	}
	var_27284619 = function_b64618f7(10);
	function_c5205bdc("pb_black_marketeer_insufficient_funds_", "o_black_marketeer_tumbler_insufficient_funds_", "o_black_marketeer_pistol_insufficient_funds_", var_27284619);
}

/*
	Name: function_ae2deb8
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2CF0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 647
*/
function function_ae2deb8()
{
	var_27284619 = function_b64618f7(6);
	function_c5205bdc("pb_black_marketeer_burn_dupes_", "o_black_marketeer_tumbler_burn_dupes_", "o_black_marketeer_pistol_burn_dupes_", var_27284619);
}

/*
	Name: function_b64618f7
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2D50
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 663
*/
function function_b64618f7(var_1c7f095f)
{
	var_27284619 = RandomInt(var_1c7f095f);
	if(var_27284619 < 10)
	{
		return "0" + var_27284619;
	}
	return var_27284619;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c5205bdc
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2DB0
	Size: 0x100
	Parameters: 4
	Flags: None
	Line Number: 684
*/
function function_c5205bdc(var_515c5969, var_2759f5e5, var_a12eee4f, var_27284619)
{
	if(!isdefined(var_27284619))
	{
		var_27284619 = "";
	}
	level.var_cc4f1e31 stopsounds();
	level.var_cc4f1e31 thread function_c0d629d(var_515c5969 + var_27284619, "pb_black_marketeer_idle", level.var_65f83320, level.var_a1674e6e);
	level.var_bd18dfbe thread function_c0d629d(var_2759f5e5 + var_27284619, "o_black_marketeer_tumbler_idle", level.var_cc4f1e31, "tag_origin");
	level.var_54a434fc thread function_c0d629d(var_a12eee4f + var_27284619, "o_black_marketeer_pistol_idle", level.var_cc4f1e31, "tag_origin");
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_c0d629d
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2EB8
	Size: 0xE8
	Parameters: 4
	Flags: None
	Line Number: 709
*/
function function_c0d629d(animName, idleAnimName, var_19357182, tagAngles)
{
	self notify("hash_4531f39");
	self endon("hash_4531f39");
	level.var_cc4f1e31 endon("hash_f6aee61f");
	self thread animation::stop(0.2);
	self animation::Play(animName, var_19357182, tagAngles, 1, 0.2, 0.2);
	self notify("hash_c9fadaad");
	self thread animation::Play(idleAnimName, var_19357182, tagAngles, 1, 0.2, 0);
}

/*
	Name: function_6141407b
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2FA8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 730
*/
function function_6141407b()
{
}

/*
	Name: function_54fda3b
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2FB8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 744
*/
function function_54fda3b()
{
}

/*
	Name: function_4afc218
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2FC8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 758
*/
function function_4afc218()
{
}

/*
	Name: function_ead1dc1a
	Namespace: frontend
	Checksum: 0x424F4353
	Offset: 0x2FD8
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 772
*/
function function_ead1dc1a()
{
}

