#include scripts\codescripts\struct;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_d481af59;

/*
	Name: __init__sytem__
	Namespace: namespace_d481af59
	Checksum: 0x3FEF2A13
	Offset: 0x1C0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_galvaknuckles", &__init__, &__main__, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_d481af59
	Checksum: 0x9ACF73B8
	Offset: 0x208
	Size: 0x8
	Parameters: 0
	Flags: Private
	Line Number: 35
*/
function private __init__()
{
}

/*
	Name: __main__
	Namespace: namespace_d481af59
	Checksum: 0x8805FB3
	Offset: 0x218
	Size: 0x8C
	Parameters: 0
	Flags: Private
	Line Number: 49
*/
function private __main__()
{
	level._allow_melee_weapon_switching = 1;
	zm_utility::register_melee_weapon_for_level("t6_tazer_knuckles");
	zm_melee_weapon::init("t6_tazer_knuckles", "t6_tazer_knuckles_flourish", undefined, undefined, 6000, "tazer_upgrade", "Hold ^3&&1^7 to buy Galvaknuckles [Cost: 6000]", undefined, undefined);
	zm_melee_weapon::set_fallback_weapon("t6_tazer_knuckles", "knife");
}

