#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_hb21_zm_weap_blundersplat;
#include scripts\zm\_hb21_zm_weap_slipgun;
#include scripts\zm\_hb21_zm_weap_tomahawk;
#include scripts\zm\_load;
#include scripts\zm\_zm_weap_ammo_counter;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_hb21_zm_craft_blundersplat;
#include scripts\zm\craftables\_hb21_zm_craft_slipgun;

#namespace namespace_16e079a1;

/*
	Name: __init__sytem__
	Namespace: namespace_16e079a1
	Checksum: 0x6CCC27
	Offset: 0x2E0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 29
*/
function autoexec __init__sytem__()
{
	system::register("zm_t6_weapons", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_16e079a1
	Checksum: 0x4C9E5897
	Offset: 0x328
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_t6_weapons.csv", 1);
}

/*
	Name: __main__
	Namespace: namespace_16e079a1
	Checksum: 0x9ACF73B8
	Offset: 0x358
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 59
*/
function __main__()
{
}

