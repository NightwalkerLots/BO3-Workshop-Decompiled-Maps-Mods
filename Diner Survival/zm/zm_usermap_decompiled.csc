#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm_ai_dogs;
#include scripts\zm\_zm_pack_a_punch;
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
#include scripts\zm\_zm_powerup_weapon_minigun;
#include scripts\zm\_zm_trap_electric;
#include scripts\zm\_zm_weap_bouncingbetty;
#include scripts\zm\_zm_weap_cymbal_monkey;
#include scripts\zm\_zm_weap_gravityspikes;
#include scripts\zm\_zm_weap_octobomb;
#include scripts\zm\_zm_weap_raygun_mark3;
#include scripts\zm\_zm_weap_rocketshield;
#include scripts\zm\_zm_weap_tesla;
#include scripts\zm\_zm_weap_thundergun;
#include scripts\zm\_zm_weapons;

#namespace zm_usermap;

/*
	Name: opt_in
	Namespace: zm_usermap
	Checksum: 0x554DA2F
	Offset: 0xBD0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 48
*/
function autoexec opt_in()
{
	if(!isdefined(level.aat_in_use))
	{
		level.aat_in_use = 1;
	}
	if(!isdefined(level.bgb_in_use))
	{
		level.bgb_in_use = 1;
	}
}

/*
	Name: main
	Namespace: zm_usermap
	Checksum: 0x8F7C1A8A
	Offset: 0xC10
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function main()
{
	level.setupCustomCharacterExerts = &setup_personality_character_exerts;
	level._effect["eye_glow"] = "zombie/fx_glow_eye_orange";
	level._effect["headshot"] = "zombie/fx_bul_flesh_head_fatal_zmb";
	level._effect["headshot_nochunks"] = "zombie/fx_bul_flesh_head_nochunks_zmb";
	level._effect["bloodspurt"] = "zombie/fx_bul_flesh_neck_spurt_zmb";
	level._effect["animscript_gib_fx"] = "zombie/fx_blood_torso_explo_zmb";
	level._effect["animscript_gibtrail_fx"] = "trail/fx_trail_blood_streak";
	level.debug_keyline_zombies = 0;
	include_weapons();
	include_perks();
	load::main();
	_zm_weap_cymbal_monkey::init();
	_zm_weap_tesla::init();
}

/*
	Name: include_weapons
	Namespace: zm_usermap
	Checksum: 0xB4E68518
	Offset: 0xD38
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function include_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/vk_wpn_table_tranzit_shared.csv", 1);
}

/*
	Name: include_perks
	Namespace: zm_usermap
	Checksum: 0xF4C73ADD
	Offset: 0xD68
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 112
*/
function include_perks()
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
	Name: setup_personality_character_exerts
	Namespace: zm_usermap
	Checksum: 0x5D3F250F
	Offset: 0xE38
	Size: 0x622
	Parameters: 0
	Flags: None
	Line Number: 133
*/
function setup_personality_character_exerts()
{
	level.exert_sounds[1]["falldamage"][0] = "vox_plr_0_exert_pain_0";
	level.exert_sounds[1]["falldamage"][1] = "vox_plr_0_exert_pain_1";
	level.exert_sounds[1]["falldamage"][2] = "vox_plr_0_exert_pain_2";
	level.exert_sounds[1]["falldamage"][3] = "vox_plr_0_exert_pain_3";
	level.exert_sounds[1]["falldamage"][4] = "vox_plr_0_exert_pain_4";
	level.exert_sounds[2]["falldamage"][0] = "vox_plr_1_exert_pain_0";
	level.exert_sounds[2]["falldamage"][1] = "vox_plr_1_exert_pain_1";
	level.exert_sounds[2]["falldamage"][2] = "vox_plr_1_exert_pain_2";
	level.exert_sounds[2]["falldamage"][3] = "vox_plr_1_exert_pain_3";
	level.exert_sounds[2]["falldamage"][4] = "vox_plr_1_exert_pain_4";
	level.exert_sounds[3]["falldamage"][0] = "vox_plr_2_exert_pain_0";
	level.exert_sounds[3]["falldamage"][1] = "vox_plr_2_exert_pain_1";
	level.exert_sounds[3]["falldamage"][2] = "vox_plr_2_exert_pain_2";
	level.exert_sounds[3]["falldamage"][3] = "vox_plr_2_exert_pain_3";
	level.exert_sounds[3]["falldamage"][4] = "vox_plr_2_exert_pain_4";
	level.exert_sounds[4]["falldamage"][0] = "vox_plr_3_exert_pain_0";
	level.exert_sounds[4]["falldamage"][1] = "vox_plr_3_exert_pain_1";
	level.exert_sounds[4]["falldamage"][2] = "vox_plr_3_exert_pain_2";
	level.exert_sounds[4]["falldamage"][3] = "vox_plr_3_exert_pain_3";
	level.exert_sounds[4]["falldamage"][4] = "vox_plr_3_exert_pain_4";
	level.exert_sounds[1]["meleeswipesoundplayer"][0] = "vox_plr_0_exert_melee_0";
	level.exert_sounds[1]["meleeswipesoundplayer"][1] = "vox_plr_0_exert_melee_1";
	level.exert_sounds[1]["meleeswipesoundplayer"][2] = "vox_plr_0_exert_melee_2";
	level.exert_sounds[1]["meleeswipesoundplayer"][3] = "vox_plr_0_exert_melee_3";
	level.exert_sounds[1]["meleeswipesoundplayer"][4] = "vox_plr_0_exert_melee_4";
	level.exert_sounds[2]["meleeswipesoundplayer"][0] = "vox_plr_1_exert_melee_0";
	level.exert_sounds[2]["meleeswipesoundplayer"][1] = "vox_plr_1_exert_melee_1";
	level.exert_sounds[2]["meleeswipesoundplayer"][2] = "vox_plr_1_exert_melee_2";
	level.exert_sounds[2]["meleeswipesoundplayer"][3] = "vox_plr_1_exert_melee_3";
	level.exert_sounds[2]["meleeswipesoundplayer"][4] = "vox_plr_1_exert_melee_4";
	level.exert_sounds[3]["meleeswipesoundplayer"][0] = "vox_plr_2_exert_melee_0";
	level.exert_sounds[3]["meleeswipesoundplayer"][1] = "vox_plr_2_exert_melee_1";
	level.exert_sounds[3]["meleeswipesoundplayer"][2] = "vox_plr_2_exert_melee_2";
	level.exert_sounds[3]["meleeswipesoundplayer"][3] = "vox_plr_2_exert_melee_3";
	level.exert_sounds[3]["meleeswipesoundplayer"][4] = "vox_plr_2_exert_melee_4";
	level.exert_sounds[4]["meleeswipesoundplayer"][0] = "vox_plr_3_exert_melee_0";
	level.exert_sounds[4]["meleeswipesoundplayer"][1] = "vox_plr_3_exert_melee_1";
	level.exert_sounds[4]["meleeswipesoundplayer"][2] = "vox_plr_3_exert_melee_2";
	level.exert_sounds[4]["meleeswipesoundplayer"][3] = "vox_plr_3_exert_melee_3";
	level.exert_sounds[4]["meleeswipesoundplayer"][4] = "vox_plr_3_exert_melee_4";
}

