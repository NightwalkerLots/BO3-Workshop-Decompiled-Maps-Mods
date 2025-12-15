#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_hb21_n4l_zm_weap_black_hole_bomb;
#include scripts\zm\_hb21_zm_weap_beacon;
#include scripts\zm\_hb21_zm_weap_dragonshield;
#include scripts\zm\_hb21_zm_weap_one_inch_punch;
#include scripts\zm\_hb21_zm_weap_staff_air;
#include scripts\zm\_hb21_zm_weap_staff_fire;
#include scripts\zm\_hb21_zm_weap_staff_lightning;
#include scripts\zm\_hb21_zm_weap_staff_revive;
#include scripts\zm\_hb21_zm_weap_staff_water;
#include scripts\zm\_load;
#include scripts\zm\_zm_weap_idgun;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_hb21_zm_craft_dragonshield;
#include scripts\zm\craftables\_hb21_zm_craft_staff;

#namespace namespace_315dc810;

/*
	Name: __init__sytem__
	Namespace: namespace_315dc810
	Checksum: 0x6D716997
	Offset: 0x3E0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 35
*/
function autoexec __init__sytem__()
{
	system::register("zm_t7_weapons", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_315dc810
	Checksum: 0x53D77AE
	Offset: 0x428
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function __init__()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_t7_weapons.csv", 1);
}

/*
	Name: __main__
	Namespace: namespace_315dc810
	Checksum: 0x9ACF73B8
	Offset: 0x458
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 65
*/
function __main__()
{
}

