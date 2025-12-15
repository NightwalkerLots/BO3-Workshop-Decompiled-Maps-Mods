#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\sphynx\_zm_sphynx_util;
#include scripts\sphynx\_zm_subtitles;
#include scripts\sphynx\craftables\_zm_craft_gravityspikes;
#include scripts\sphynx\craftables\_zm_craft_origins_shield;
#include scripts\zm\_hb21_sym_zm_trap_acid;
#include scripts\zm\_hb21_sym_zm_trap_fan;
#include scripts\zm\_hb21_zm_magicbox;
#include scripts\zm\_hb21_zm_trap_centrifuge;
#include scripts\zm\_load;
#include scripts\zm\_zm_ai_mechz;
#include scripts\zm\_zm_pack_a_punch;
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
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerup_double_points;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_powerup_free_perk;
#include scripts\zm\_zm_powerup_full_ammo;
#include scripts\zm\_zm_powerup_insta_kill;
#include scripts\zm\_zm_powerup_nuke;
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
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craftables;
#include scripts\zm\symbo_zns_transports;
#include scripts\zm\zm_castle_weap_quest;
#include scripts\zm\zm_usermap;

#namespace namespace_da78430a;

/*
	Name: main
	Namespace: namespace_da78430a
	Checksum: 0x5AD3B588
	Offset: 0x18A0
	Size: 0x1DC8
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function main()
{
	LuiLoad("ui.uieditor.menus.hud.t7hud_zm_custom");
	LuiLoad("ui.uieditor.widgets.hud.zm_ammowidgetfactory_mod.zmammo_dpadiconpistolfactory");
	callback::on_localclient_connect(&on_local_client_connect);
	LuiLoad("ui.uieditor.menus.hud.t7hud_zm_castle");
	clientfield::register("clientuimodel", "zmInventory.widget_sprayer", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.player_using_sprayer", 1, 1, "int", undefined, 0, 1);
	clientfield::register("world", "orb_red_pickup", 1, 1, "int", &function_927fcc74, 0, 1);
	clientfield::register("world", "orb_blue_pickup", 1, 1, "int", &function_91a5f157, 0, 1);
	clientfield::register("world", "orb_green_pickup", 1, 1, "int", &function_4afbb184, 0, 1);
	clientfield::register("world", "orb_yellow_pickup", 1, 1, "int", &function_e8625247, 0, 1);
	clientfield::register("world", "summoning_key_pickup", 1, 1, "int", &function_9e487208, 0, 1);
	clientfield::register("world", "orb_red_pickup2", 1, 1, "int", &function_3ebcdbbe, 0, 1);
	clientfield::register("world", "orb_blue_pickup2", 1, 1, "int", &function_8b183a37, 0, 1);
	clientfield::register("world", "orb_green_pickup2", 1, 1, "int", &function_7a15c10e, 0, 1);
	clientfield::register("world", "orb_yellow_pickup2", 1, 1, "int", &function_455586e7, 0, 1);
	clientfield::register("world", "iron_dragon", 1, 1, "int", &function_65faed3, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.widget_shield_parts", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.player_crafted_shield", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.widget_gravityspike_parts", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.player_crafted_gravityspikes", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.gravityspike_part_body", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.gravityspike_part_guards", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.gravityspike_part_handle", 1, 1, "int", undefined, 0, 1);
	RegisterClientField("world", "gravityspike_part_body", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "gravityspike_part_guards", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "gravityspike_part_handle", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	clientfield::register("clientuimodel", "zmInventory.widget_weap_quest_rune", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.quest_state_rune", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.quest_owner_rune", 1, 1, "int", undefined, 0, 1);
	RegisterClientField("world", "quest_state_rune", 1, 3, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "quest_owner_rune", 1, 3, "int", &zm_utility::setSharedInventoryUIModels, 0);
	clientfield::register("clientuimodel", "zmInventory.widget_weap_quest_wolf", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.quest_state_wolf", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.quest_owner_wolf", 1, 1, "int", undefined, 0, 1);
	RegisterClientField("world", "quest_state_wolf", 1, 3, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "quest_owner_wolf", 1, 3, "int", &zm_utility::setSharedInventoryUIModels, 0);
	clientfield::register("clientuimodel", "zmInventory.widget_weap_quest_demon", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.quest_state_demon", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.quest_owner_demon", 1, 1, "int", undefined, 0, 1);
	RegisterClientField("world", "quest_state_demon", 1, 3, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "quest_owner_demon", 1, 3, "int", &zm_utility::setSharedInventoryUIModels, 0);
	clientfield::register("clientuimodel", "zmInventory.widget_weap_quest_storm", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.quest_state_storm", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmInventory.quest_owner_storm", 1, 1, "int", undefined, 0, 1);
	RegisterClientField("world", "quest_state_storm", 1, 3, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "quest_owner_storm", 1, 3, "int", &zm_utility::setSharedInventoryUIModels, 0);
	clientfield::register("scriptmover", "fx_orbgreen", 1, 1, "int", &function_ac808bda, 0, 0);
	clientfield::register("scriptmover", "fx_orbred", 1, 1, "int", &function_df5ea70a, 0, 0);
	clientfield::register("scriptmover", "fx_orbblue", 1, 1, "int", &function_1b784139, 0, 0);
	clientfield::register("scriptmover", "fx_orbyellow", 1, 1, "int", &function_36471f59, 0, 0);
	clientfield::register("scriptmover", "fx_raven", 1, 1, "int", &function_627ccf70, 0, 0);
	clientfield::register("scriptmover", "fx_stormbow", 1, 1, "int", &function_65debc63, 0, 0);
	clientfield::register("scriptmover", "fx_vane", 1, 1, "int", &function_c8e07f9e, 0, 0);
	clientfield::register("scriptmover", "fx_stormfire", 1, 1, "int", &function_378a07d5, 0, 0);
	clientfield::register("scriptmover", "fx_stormshock", 1, 1, "int", &function_55aac4c9, 0, 0);
	clientfield::register("scriptmover", "fx_stormflash", 1, 1, "int", &function_7707ff19, 0, 0);
	clientfield::register("scriptmover", "fx_wall", 1, 1, "int", &function_3f906a6e, 0, 0);
	clientfield::register("scriptmover", "fx_wolfbow", 1, 1, "int", &function_a9f03e7e, 0, 0);
	clientfield::register("scriptmover", "fx_wolfskull", 1, 1, "int", &function_3fc95281, 0, 0);
	clientfield::register("scriptmover", "fx_skeyglow2", 1, 1, "int", &function_b2476fcd, 0, 0);
	clientfield::register("scriptmover", "fx_bowglow", 1, 1, "int", &function_7adf8701, 0, 0);
	clientfield::register("scriptmover", "fx_urnglow", 1, 1, "int", &function_fca30628, 0, 0);
	clientfield::register("scriptmover", "fx_demonskull", 1, 1, "int", &function_8dfa462, 0, 0);
	clientfield::register("scriptmover", "fx_urnexplode", 1, 1, "int", &function_d8a07286, 0, 0);
	clientfield::register("scriptmover", "fx_demonskulltrail", 1, 1, "int", &function_4e8e6df6, 0, 0);
	clientfield::register("scriptmover", "fx_papwall", 1, 1, "int", &function_b6f8d461, 0, 0);
	clientfield::register("scriptmover", "fx_obeliskglow", 1, 1, "int", &function_ff044c1a, 0, 0);
	clientfield::register("scriptmover", "fx_obeliskexplode", 1, 1, "int", &function_540c33c, 0, 0);
	clientfield::register("scriptmover", "fx_runecirclefire", 1, 1, "int", &function_c8f7b78a, 0, 0);
	clientfield::register("scriptmover", "fx_runecircleflare", 1, 1, "int", &function_b4a00bbe, 0, 0);
	clientfield::register("scriptmover", "fx_fireplace1", 1, 1, "int", &function_87d55be8, 0, 0);
	clientfield::register("scriptmover", "fx_fireplace2", 1, 1, "int", &function_f9dccb23, 0, 0);
	clientfield::register("scriptmover", "fx_fireplace4", 1, 1, "int", &function_45e1bff5, 0, 0);
	clientfield::register("scriptmover", "fx_orbexplode", 1, 1, "int", &function_6e6e78a8, 0, 0);
	clientfield::register("scriptmover", "fx_orbgrow", 1, 1, "int", &function_19ac8bcc, 0, 0);
	clientfield::register("scriptmover", "fx_orbcrust", 1, 1, "int", &function_1a399bae, 0, 0);
	clientfield::register("scriptmover", "fx_stormfire2", 1, 1, "int", &function_d6ce6bcd, 0, 0);
	clientfield::register("scriptmover", "fx_planeglow", 1, 1, "int", &function_4dc084f, 0, 0);
	clientfield::register("scriptmover", "fx_planetrail", 1, 1, "int", &function_d76a4b88, 0, 0);
	clientfield::register("scriptmover", "fx_runebrazier", 1, 1, "int", &function_7d153f81, 0, 0);
	clientfield::register("scriptmover", "fx_demonsmoke", 1, 1, "int", &function_ee9c1d76, 0, 0);
	clientfield::register("scriptmover", "fx_torchlight", 1, 1, "int", &function_dfcf13c8, 0, 0);
	clientfield::register("scriptmover", "fx_torchfire", 1, 1, "int", &function_5ce9dea8, 0, 0);
	clientfield::register("scriptmover", "fx_keeperbeam", 1, 1, "int", &function_d6ac6601, 0, 0);
	clientfield::register("scriptmover", "fx_keeperspawn", 1, 1, "int", &function_3bba7599, 0, 0);
	clientfield::register("scriptmover", "fx_keepertrail2", 1, 1, "int", &function_808ab872, 0, 0);
	clientfield::register("scriptmover", "fx_flak1", 1, 1, "int", &function_4ea23a61, 0, 0);
	clientfield::register("scriptmover", "fx_flak2", 1, 1, "int", &function_74a4b4ca, 0, 0);
	clientfield::register("scriptmover", "fx_flak3", 1, 1, "int", &function_9aa72f33, 0, 0);
	clientfield::register("scriptmover", "fx_flak4", 1, 1, "int", &function_c0a9a99c, 0, 0);
	clientfield::register("scriptmover", "fx_flak5", 1, 1, "int", &function_e6ac2405, 0, 0);
	clientfield::register("scriptmover", "fx_flak6", 1, 1, "int", &function_cae9e6e, 0, 0);
	clientfield::register("scriptmover", "fx_keeperglow", 1, 1, "int", &function_74ea787, 0, 0);
	clientfield::register("scriptmover", "fx_wolfinkbody", 1, 1, "int", &function_c9c5686e, 0, 0);
	level._effect["orbgreen"] = "zombie/fx_powerup_grab_caution_zmb_wolf";
	level._effect["orbred"] = "zombie/fx_powerup_grab_red_zmb";
	level._effect["orbblue"] = "zombie/fx_powerup_grab_solo_zmb";
	level._effect["orbyellow"] = "zombie/fx_powerup_grab_caution_zmb_demongate";
	level._effect["raven"] = "dlc1/castle/fx_raven_death";
	level._effect["stormbow"] = "dlc1/castle/fx_storm_arrow_whole_float_glow";
	level._effect["vane"] = "dlc1/castle/fx_lightning_strike_weathervane";
	level._effect["stormfire"] = "dlc1/castle/fx_fire_tornado_lg";
	level._effect["stormshock"] = "dlc5/tomb/fx_elec_monolith_coil_beam_slack_shock_02";
	level._effect["stormflash"] = "dlc1/castle/fx_elec_storm_flash_sm";
	level._effect["wall"] = "dlc1/castle/fx_rune_clock_exp_concrete_wall";
	level._effect["wolfbow"] = "dlc1/castle/fx_wolf_arrow_whole_float_glow_light";
	level._effect["wolfskull"] = "dlc1/castle/fx_wolf_skull_light_trail";
	level._effect["bowglow"] = "dlc1/castle/fx_plinth_aura_base_bow";
	level._effect["skeyglow2"] = "dlc1/castle/fx_ritual_key_glow_charging";
	level._effect["urnglow"] = "dlc1/castle/fx_demon_gate_rune_glow";
	level._effect["demonskull"] = "dlc1/castle/fx_demon_gate_pick_up";
	level._effect["urnexplode"] = "dlc1/castle/fx_demon_gate_urn_exp";
	level._effect["demonskulltrail"] = "dlc1/castle/fx_demon_gate_skulls_trail";
	level._effect["papwall"] = "zombie/fx_ritual_pap_wall_explo_zod_zmb";
	level._effect["obeliskglow"] = "dlc1/castle/fx_rune_obelisk_glow";
	level._effect["obeliskexplode"] = "dlc1/castle/fx_rune_obelisk_exp";
	level._effect["runecirclefire"] = "dlc5/tomb/fx_light_chamber_fire";
	level._effect["runecircleflare"] = "light/fx_light_flare_flareup_sgen";
	level._effect["fireplace1"] = "dlc1/castle/fx_rune_fireplace_01_flareup";
	level._effect["fireplace2"] = "dlc1/castle/fx_rune_fireplace_01_smk";
	level._effect["fireplace4"] = "dlc1/castle/fx_rune_fireplace_01_smolder";
	level._effect["orbexplode"] = "dlc1/castle/fx_rune_magma_orb_exp";
	level._effect["orbgrow"] = "dlc1/castle/fx_rune_magma_orb_grow";
	level._effect["orbcrust"] = "dlc1/castle/fx_rune_magma_ball_crust2";
	level._effect["stormfire2"] = "dlc1/castle/fx_fire_elec_tornado";
	level._effect["wolfinkbody"] = "dlc1/castle/fx_wolf_ink_hold_body";
	level._effect["planeglow"] = "dlc5/tomb/fx_glow_biplane";
	level._effect["planetrail"] = "dlc5/tomb/fx_glow_biplane_trail";
	level._effect["runebrazier"] = "dlc5/tomb/fx_fire_smky";
	level._effect["demonsmoke"] = "dlc5/tomb/fx_tomb_puzzle_air_smoke";
	level._effect["torchlight"] = "dlc1/castle/fx_light_lantern_castle";
	level._effect["torchfire"] = "dlc5/tomb/fx_fire_torch_wall_lit_eva";
	level._effect["keeperbeam"] = "zombie/fx_ee_keeper_beam_a_success_zod_zmb";
	level._effect["keeperspawn"] = "zombie/fx_portal_keeper_spawn_os_zod_zmb";
	level._effect["keepertrail2"] = "zombie/fx_keeper_mist_trail_zod_zmb";
	level._effect["flak1"] = "zombie/fx_concussive_wave_impact_zdo";
	level._effect["flak2"] = "dlc3/stalingrad/fx_mech_escape_jump_exp_debris";
	level._effect["flak3"] = "explosions/fx_exp_bomb_demo_mp";
	level._effect["flak4"] = "smoke/fx_smk_explode_lg";
	level._effect["flak5"] = "dlc5/tomb/fx_tomb_explo_airplane";
	level._effect["flak6"] = "dlc1/castle/fx_snow_impact_lg";
	level._effect["keeperglow"] = "dlc1/castle/fx_keeper_ghost_ambient_torso";
	zm_usermap::main();
	level thread namespace_2a78f3c::main();
	include_weapons();
	util::waitforclient(0);
	callback::on_localplayer_spawned(&on_localplayer_spawned);
}

/*
	Name: include_weapons
	Namespace: namespace_da78430a
	Checksum: 0x4677A45B
	Offset: 0x3670
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 227
*/
function include_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_levelcommon_weapons.csv", 1);
}

/*
	Name: on_localplayer_spawned
	Namespace: namespace_da78430a
	Checksum: 0x9169CBE5
	Offset: 0x36A0
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 242
*/
function on_localplayer_spawned(localClientNum)
{
	if(self == GetLocalPlayer(localClientNum))
	{
		self thread function_495d1bec(localClientNum);
	}
}

/*
	Name: function_495d1bec
	Namespace: namespace_da78430a
	Checksum: 0x94D1ED90
	Offset: 0x36F0
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 260
*/
function function_495d1bec(localClientNum)
{
	self endon("disconnect");
	self endon("entityshutdown");
	self endon("death");
	while(1)
	{
		playFX(localClientNum, "dlc0/factory/fx_snow_player_os_factory", self.origin);
		wait(0.2);
	}
}

/*
	Name: ramp_fog_in_out
	Namespace: namespace_da78430a
	Checksum: 0x3A9980C5
	Offset: 0x3760
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 282
*/
function ramp_fog_in_out()
{
	for(localClientNum = 0; localClientNum < level.localPlayers.size; localClientNum++)
	{
		SetLitFogBank(localClientNum, -1, 1, -1);
		SetWorldFogActiveBank(localClientNum, 2);
	}
	wait(2.5);
	for(localClientNum = 0; localClientNum < level.localPlayers.size; localClientNum++)
	{
		SetLitFogBank(localClientNum, -1, 0, -1);
		SetWorldFogActiveBank(localClientNum, 1);
	}
}

/*
	Name: on_local_client_connect
	Namespace: namespace_da78430a
	Checksum: 0x390F084D
	Offset: 0x3840
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 307
*/
function on_local_client_connect(localClientNum)
{
	hud = CreateLUIMenu(localClientNum, "T7Hud_zm_castle");
	OpenLUIMenu(localClientNum, hud);
}

/*
	Name: function_927fcc74
	Namespace: namespace_da78430a
	Checksum: 0x554A3D2F
	Offset: 0x38A0
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 323
*/
function function_927fcc74(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), fieldName);
	SetUIModelValue(model, newVal);
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_91a5f157
	Namespace: namespace_da78430a
	Checksum: 0x3CF0CDCF
	Offset: 0x3940
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 342
*/
function function_91a5f157(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), fieldName);
	SetUIModelValue(model, newVal);
}

/*
	Name: function_4afbb184
	Namespace: namespace_da78430a
	Checksum: 0xA3D2280
	Offset: 0x39E0
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 358
*/
function function_4afbb184(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), fieldName);
	SetUIModelValue(model, newVal);
}

/*
	Name: function_e8625247
	Namespace: namespace_da78430a
	Checksum: 0x8A059EDB
	Offset: 0x3A80
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 374
*/
function function_e8625247(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), fieldName);
	SetUIModelValue(model, newVal);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_9e487208
	Namespace: namespace_da78430a
	Checksum: 0x83FBF01F
	Offset: 0x3B20
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 392
*/
function function_9e487208(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), fieldName);
	SetUIModelValue(model, newVal);
	return;
	ERROR: Bad function call
}

/*
	Name: function_3ebcdbbe
	Namespace: namespace_da78430a
	Checksum: 0x7C975F29
	Offset: 0x3BC0
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 410
*/
function function_3ebcdbbe(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), fieldName);
	SetUIModelValue(model, newVal);
	return;
}

/*
	Name: function_8b183a37
	Namespace: namespace_da78430a
	Checksum: 0x74303AF2
	Offset: 0x3C60
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 427
*/
function function_8b183a37(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), fieldName);
	SetUIModelValue(model, newVal);
}

/*
	Name: function_7a15c10e
	Namespace: namespace_da78430a
	Checksum: 0x955FD7E1
	Offset: 0x3D00
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 443
*/
function function_7a15c10e(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), fieldName);
	SetUIModelValue(model, newVal);
}

/*
	Name: function_455586e7
	Namespace: namespace_da78430a
	Checksum: 0x1385DC2D
	Offset: 0x3DA0
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 459
*/
function function_455586e7(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), fieldName);
	SetUIModelValue(model, newVal);
}

/*
	Name: function_65faed3
	Namespace: namespace_da78430a
	Checksum: 0x36BFCA31
	Offset: 0x3E40
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 475
*/
function function_65faed3(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), fieldName);
	SetUIModelValue(model, newVal);
}

/*
	Name: function_ac808bda
	Namespace: namespace_da78430a
	Checksum: 0x6FF6D8
	Offset: 0x3EE0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 491
*/
function function_ac808bda(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["orbgreen"], self, "tag_origin");
	}
}

/*
	Name: function_df5ea70a
	Namespace: namespace_da78430a
	Checksum: 0x2C0C94C
	Offset: 0x3FA0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 514
*/
function function_df5ea70a(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["orbred"], self, "tag_origin");
	}
}

/*
	Name: function_1b784139
	Namespace: namespace_da78430a
	Checksum: 0x1F487D9A
	Offset: 0x4060
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 537
*/
function function_1b784139(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["orbblue"], self, "tag_origin");
		return;
	}
}

/*
	Name: function_36471f59
	Namespace: namespace_da78430a
	Checksum: 0xCBB080BD
	Offset: 0x4120
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 561
*/
function function_36471f59(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["orbyellow"], self, "tag_origin");
	}
}

/*
	Name: function_627ccf70
	Namespace: namespace_da78430a
	Checksum: 0x2A496059
	Offset: 0x41E0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 584
*/
function function_627ccf70(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["raven"], self, "tag_origin");
	}
}

/*
	Name: function_65debc63
	Namespace: namespace_da78430a
	Checksum: 0x53CBF13A
	Offset: 0x42A0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 607
*/
function function_65debc63(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["stormbow"], self, "arrow_whole_jnt");
	}
}

/*
	Name: function_c8e07f9e
	Namespace: namespace_da78430a
	Checksum: 0x366EB3C1
	Offset: 0x4360
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 630
*/
function function_c8e07f9e(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["vane"], self, "tag_origin");
	}
}

/*
	Name: function_378a07d5
	Namespace: namespace_da78430a
	Checksum: 0x50AC3BD7
	Offset: 0x4420
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 653
*/
function function_378a07d5(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["stormfire"], self, "tag_origin");
	}
}

/*
	Name: function_55aac4c9
	Namespace: namespace_da78430a
	Checksum: 0xF9D017AE
	Offset: 0x44E0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 676
*/
function function_55aac4c9(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["stormshock"], self, "tag_origin");
	}
}

/*
	Name: function_7707ff19
	Namespace: namespace_da78430a
	Checksum: 0x99FF9ED
	Offset: 0x45A0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 699
*/
function function_7707ff19(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["stormflash"], self, "tag_origin");
		return;
	}
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_3f906a6e
	Namespace: namespace_da78430a
	Checksum: 0x7FC28D9C
	Offset: 0x4660
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 725
*/
function function_3f906a6e(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["wall"], self, "tag_origin");
	}
}

/*
	Name: function_a9f03e7e
	Namespace: namespace_da78430a
	Checksum: 0x534D6F31
	Offset: 0x4720
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 748
*/
function function_a9f03e7e(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["wolfbow"], self, "tag_origin");
	}
}

/*
	Name: function_3fc95281
	Namespace: namespace_da78430a
	Checksum: 0x7A7D6AD4
	Offset: 0x47E0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 771
*/
function function_3fc95281(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["wolfskull"], self, "tag_origin");
	}
}

/*
	Name: function_b2476fcd
	Namespace: namespace_da78430a
	Checksum: 0xF7BC4ADF
	Offset: 0x48A0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 794
*/
function function_b2476fcd(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["skeyglow2"], self, "key_body_jnt");
	}
}

/*
	Name: function_7adf8701
	Namespace: namespace_da78430a
	Checksum: 0xBD519F
	Offset: 0x4960
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 817
*/
function function_7adf8701(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["bowglow"], self, "tag_origin");
	}
}

/*
	Name: function_fca30628
	Namespace: namespace_da78430a
	Checksum: 0x7755D63F
	Offset: 0x4A20
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 840
*/
function function_fca30628(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["urnglow"], self, "tag_origin");
	}
}

/*
	Name: function_8dfa462
	Namespace: namespace_da78430a
	Checksum: 0x9238915C
	Offset: 0x4AE0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 863
*/
function function_8dfa462(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["demonskull"], self, "tag_fx");
		return;
	}
	self.FX++;
}

/*
	Name: function_d8a07286
	Namespace: namespace_da78430a
	Checksum: 0x6438B997
	Offset: 0x4BA0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 888
*/
function function_d8a07286(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["urnexplode"], self, "tag_origin");
	}
}

/*
	Name: function_4e8e6df6
	Namespace: namespace_da78430a
	Checksum: 0x30504CF9
	Offset: 0x4C60
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 911
*/
function function_4e8e6df6(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["demonskulltrail"], self, "tag_fx");
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_b6f8d461
	Namespace: namespace_da78430a
	Checksum: 0x728119EE
	Offset: 0x4D20
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 936
*/
function function_b6f8d461(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["papwall"], self, "tag_origin");
	}
}

/*
	Name: function_ff044c1a
	Namespace: namespace_da78430a
	Checksum: 0xB4D34F5E
	Offset: 0x4DE0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 959
*/
function function_ff044c1a(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["obeliskglow"], self, "tag_origin");
	}
}

/*
	Name: function_540c33c
	Namespace: namespace_da78430a
	Checksum: 0x4506628C
	Offset: 0x4EA0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 982
*/
function function_540c33c(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["obeliskexplode"], self, "tag_origin");
		return;
	}
	continue;
}

/*
	Name: function_c8f7b78a
	Namespace: namespace_da78430a
	Checksum: 0x4ADB0489
	Offset: 0x4F60
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1007
*/
function function_c8f7b78a(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["runecirclefire"], self, "tag_origin");
	}
}

/*
	Name: function_b4a00bbe
	Namespace: namespace_da78430a
	Checksum: 0x8C5447D9
	Offset: 0x5020
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1030
*/
function function_b4a00bbe(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["runecircleflare"], self, "tag_origin");
	}
}

/*
	Name: function_87d55be8
	Namespace: namespace_da78430a
	Checksum: 0x58A2A3CD
	Offset: 0x50E0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1053
*/
function function_87d55be8(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["fireplace1"], self, "tag_origin");
		return;
	}
}

/*
	Name: function_f9dccb23
	Namespace: namespace_da78430a
	Checksum: 0xE5205783
	Offset: 0x51A0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1077
*/
function function_f9dccb23(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["fireplace2"], self, "tag_origin");
	}
}

/*
	Name: function_45e1bff5
	Namespace: namespace_da78430a
	Checksum: 0xEC910020
	Offset: 0x5260
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1100
*/
function function_45e1bff5(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["fireplace4"], self, "tag_origin");
	}
}

/*
	Name: function_6e6e78a8
	Namespace: namespace_da78430a
	Checksum: 0xF140DBED
	Offset: 0x5320
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1123
*/
function function_6e6e78a8(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["orbexplode"], self, "tag_origin");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_19ac8bcc
	Namespace: namespace_da78430a
	Checksum: 0xAA398332
	Offset: 0x53E0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1148
*/
function function_19ac8bcc(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["orbgrow"], self, "tag_origin");
	}
}

/*
	Name: function_1a399bae
	Namespace: namespace_da78430a
	Checksum: 0xD9273ED0
	Offset: 0x54A0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1171
*/
function function_1a399bae(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["orbcrust"], self, "tag_origin");
	}
}

/*
	Name: function_d6ce6bcd
	Namespace: namespace_da78430a
	Checksum: 0x6DBDE3DF
	Offset: 0x5560
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1194
*/
function function_d6ce6bcd(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["stormfire2"], self, "tag_origin");
	}
}

/*
	Name: function_c9c5686e
	Namespace: namespace_da78430a
	Checksum: 0xC517A80E
	Offset: 0x5620
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1217
*/
function function_c9c5686e(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["wolfinkbody"], self, "tag_origin");
	}
}

/*
	Name: function_4dc084f
	Namespace: namespace_da78430a
	Checksum: 0x3230C565
	Offset: 0x56E0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1240
*/
function function_4dc084f(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["planeglow"], self, "tag_origin");
		return;
	}
	self.var_0 = undefined;
}

/*
	Name: function_d76a4b88
	Namespace: namespace_da78430a
	Checksum: 0x819364C8
	Offset: 0x57A0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1265
*/
function function_d76a4b88(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["planetrail"], self, "tag_origin");
	}
}

/*
	Name: function_7d153f81
	Namespace: namespace_da78430a
	Checksum: 0x439DEDD6
	Offset: 0x5860
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1288
*/
function function_7d153f81(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["runebrazier"], self, "tag_origin");
	}
}

/*
	Name: function_ee9c1d76
	Namespace: namespace_da78430a
	Checksum: 0x7E504362
	Offset: 0x5920
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1311
*/
function function_ee9c1d76(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["demonsmoke"], self, "tag_origin");
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_dfcf13c8
	Namespace: namespace_da78430a
	Checksum: 0x716A0970
	Offset: 0x59E0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1336
*/
function function_dfcf13c8(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["torchlight"], self, "tag_origin");
	}
}

/*
	Name: function_5ce9dea8
	Namespace: namespace_da78430a
	Checksum: 0xF8F22E8D
	Offset: 0x5AA0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1359
*/
function function_5ce9dea8(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["torchfire"], self, "tag_origin");
	}
}

/*
	Name: function_d6ac6601
	Namespace: namespace_da78430a
	Checksum: 0x962C6638
	Offset: 0x5B60
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1382
*/
function function_d6ac6601(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["keeperbeam"], self, "tag_origin");
	}
}

/*
	Name: function_3bba7599
	Namespace: namespace_da78430a
	Checksum: 0x117030F2
	Offset: 0x5C20
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1405
*/
function function_3bba7599(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["keeperspawn"], self, "tag_origin");
	}
}

/*
	Name: function_808ab872
	Namespace: namespace_da78430a
	Checksum: 0x126408DA
	Offset: 0x5CE0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1428
*/
function function_808ab872(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["keepertrail2"], self, "tag_aim");
	}
}

/*
	Name: function_4ea23a61
	Namespace: namespace_da78430a
	Checksum: 0x8B59C50C
	Offset: 0x5DA0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1451
*/
function function_4ea23a61(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["flak1"], self, "tag_origin");
	}
}

/*
	Name: function_74a4b4ca
	Namespace: namespace_da78430a
	Checksum: 0x982F07CB
	Offset: 0x5E60
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1474
*/
function function_74a4b4ca(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["flak2"], self, "tag_origin");
	}
}

/*
	Name: function_9aa72f33
	Namespace: namespace_da78430a
	Checksum: 0xCC4B90E8
	Offset: 0x5F20
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1497
*/
function function_9aa72f33(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["flak3"], self, "tag_origin");
	}
}

/*
	Name: function_c0a9a99c
	Namespace: namespace_da78430a
	Checksum: 0x2947007E
	Offset: 0x5FE0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1520
*/
function function_c0a9a99c(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["flak4"], self, "tag_origin");
	}
}

/*
	Name: function_e6ac2405
	Namespace: namespace_da78430a
	Checksum: 0x1F2D7A2
	Offset: 0x60A0
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1543
*/
function function_e6ac2405(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["flak5"], self, "tag_origin");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_cae9e6e
	Namespace: namespace_da78430a
	Checksum: 0xC3DEA7D5
	Offset: 0x6160
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 1568
*/
function function_cae9e6e(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["flak6"], self, "tag_origin");
	}
}

/*
	Name: function_74ea787
	Namespace: namespace_da78430a
	Checksum: 0x974BDDEB
	Offset: 0x6220
	Size: 0xB4
	Parameters: 7
	Flags: None
	Line Number: 1591
*/
function function_74ea787(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
		self.FX = undefined;
	}
	if(newVal == 1)
	{
		self.FX = PlayFXOnTag(localClientNum, level._effect["keeperglow"], self, "tag_stowed_back");
	}
}

