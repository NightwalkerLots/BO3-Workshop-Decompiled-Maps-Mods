#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm_pack_a_punch;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perk_banana_colada;
#include scripts\zm\_zm_perk_bull_ice_blast;
#include scripts\zm\_zm_perk_crusaders_ale;
#include scripts\zm\_zm_perk_doubletap2;
#include scripts\zm\_zm_perk_electric_cherry;
#include scripts\zm\_zm_perk_juggernaut;
#include scripts\zm\_zm_perk_madgaz_moonshine;
#include scripts\zm\_zm_perk_phdflopper;
#include scripts\zm\_zm_perk_quick_revive;
#include scripts\zm\_zm_perk_sleight_of_hand;
#include scripts\zm\_zm_perk_staminup;
#include scripts\zm\_zm_perk_tombstone;
#include scripts\zm\_zm_perk_vulture_aid;
#include scripts\zm\_zm_perk_whoswho;
#include scripts\zm\_zm_perk_widows_wine;
#include scripts\zm\_zm_perk_wunderfizz;
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
#include scripts\zm\_zm_weapons;
#include scripts\zm\zm_usermap;

#namespace namespace_4a1c8625;

/*
	Name: main
	Namespace: namespace_4a1c8625
	Checksum: 0x78B448D1
	Offset: 0x5E8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function main()
{
	zm_usermap::main();
	include_weapons();
	util::waitforclient(0);
}

/*
	Name: include_weapons
	Namespace: namespace_4a1c8625
	Checksum: 0x3130A420
	Offset: 0x630
	Size: 0x24
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function include_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_levelcommon_weapons.csv", 1);
}

