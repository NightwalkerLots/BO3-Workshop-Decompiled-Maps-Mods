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
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_b3f645ab;

/*
	Name: __init__sytem__
	Namespace: namespace_b3f645ab
	Checksum: 0x772082FB
	Offset: 0x300
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 33
*/
function autoexec __init__sytem__()
{
	system::register("zm_t4_weapons", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b3f645ab
	Checksum: 0xD3BF3EFD
	Offset: 0x348
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function __init__()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_t4_weapons.csv", 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __main__
	Namespace: namespace_b3f645ab
	Checksum: 0x9ACF73B8
	Offset: 0x378
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 65
*/
function __main__()
{
}

