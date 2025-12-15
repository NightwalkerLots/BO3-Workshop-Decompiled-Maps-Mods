#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm_weapons;

#namespace namespace_b3f645ab;

/*
	Name: __init__sytem__
	Namespace: namespace_b3f645ab
	Checksum: 0x387F7254
	Offset: 0x1E0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("zm_t4_weapons", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b3f645ab
	Checksum: 0x1BC743EE
	Offset: 0x228
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function __init__()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_t4_weapons.csv", 1);
}

/*
	Name: __main__
	Namespace: namespace_b3f645ab
	Checksum: 0x9ACF73B8
	Offset: 0x258
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function __main__()
{
}

