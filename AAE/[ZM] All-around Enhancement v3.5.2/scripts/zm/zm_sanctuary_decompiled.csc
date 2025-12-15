#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\sphynx\craftables\_zm_craft_gravityspikes;
#include scripts\sphynx\craftables\_zm_craft_zombie_shield;
#include scripts\sphynx\perks\_zm_perk_death_perception;
#include scripts\zm\_load;
#include scripts\zm\_zm_pack_a_punch;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perk_deadshot;
#include scripts\zm\_zm_perk_doubletap2;
#include scripts\zm\_zm_perk_electric_cherry;
#include scripts\zm\_zm_perk_elemental_pop;
#include scripts\zm\_zm_perk_juggernaut;
#include scripts\zm\_zm_perk_phdflopper;
#include scripts\zm\_zm_perk_quick_revive;
#include scripts\zm\_zm_perk_random;
#include scripts\zm\_zm_perk_sleight_of_hand;
#include scripts\zm\_zm_perk_staminup;
#include scripts\zm\_zm_perk_tombstone;
#include scripts\zm\_zm_perk_vulture_aid;
#include scripts\zm\_zm_perk_whoswho;
#include scripts\zm\_zm_perk_widows_wine;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerup_double_points;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_powerup_free_perk;
#include scripts\zm\_zm_powerup_full_ammo;
#include scripts\zm\_zm_powerup_insta_kill;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_trap_electric;
#include scripts\zm\_zm_weap_elemental_bow;
#include scripts\zm\_zm_weap_elemental_bow_rune_prison;
#include scripts\zm\_zm_weapons;
#include scripts\zm\ignore_redundant_perks;
#include scripts\zm\zm_j\zm_j_ee_steps;
#include scripts\zm\zm_usermap;

#namespace namespace_f2ab8ea9;

/*
	Name: main
	Namespace: namespace_f2ab8ea9
	Checksum: 0xD64A4C29
	Offset: 0x6C0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function main()
{
	LuiLoad("ui.uieditor.menus.hud.t7hud_zm_sanctu");
	zm_usermap::main();
	function_83f713bd();
	include_weapons();
	util::waitforclient(0);
}

/*
	Name: include_weapons
	Namespace: namespace_f2ab8ea9
	Checksum: 0xE3F9376E
	Offset: 0x730
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function include_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_levelcommon_weapons.csv", 1);
	return;
	ERROR: Bad function call
}

/*
	Name: function_83f713bd
	Namespace: namespace_f2ab8ea9
	Checksum: 0xE71B369E
	Offset: 0x760
	Size: 0x14
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function function_83f713bd()
{
	level._override_eye_fx = "frost_iceforge/orange_zombie_eyes";
}

