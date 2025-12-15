#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm_weap_ammo_counter;
#include scripts\zm\_zm_weapons;

#namespace namespace_16e079a1;

/*
	Name: __init__sytem__
	Namespace: namespace_16e079a1
	Checksum: 0x614BD198
	Offset: 0x208
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("zm_t6_weapons", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_16e079a1
	Checksum: 0xE91CBFF8
	Offset: 0x250
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_t6_weapons.csv", 1);
}

/*
	Name: __main__
	Namespace: namespace_16e079a1
	Checksum: 0x9ACF73B8
	Offset: 0x280
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function __main__()
{
}

