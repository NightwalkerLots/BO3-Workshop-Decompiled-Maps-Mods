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
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_ammo_counter;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_16e079a1;

/*
	Name: __init__sytem__
	Namespace: namespace_16e079a1
	Checksum: 0x72C830CE
	Offset: 0x380
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 35
*/
function autoexec __init__sytem__()
{
	system::register("zm_t6_weapons", &__init__, &__main__, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_16e079a1
	Checksum: 0x4E4FC3D2
	Offset: 0x3C8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function __init__()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_t6_weapons.csv", 1);
}

/*
	Name: zombie_death_animscript_override
	Namespace: namespace_16e079a1
	Checksum: 0xA049AA84
	Offset: 0x3F8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function zombie_death_animscript_override()
{
	if("shotgun_rottweil72_upgraded" == self.damageWeapon.name || "t7_shotgun_rottweil72_upgraded" == self.damageWeapon.name)
	{
		self thread zm_spawner::dragons_breath_flame_death_fx();
	}
}

/*
	Name: __main__
	Namespace: namespace_16e079a1
	Checksum: 0x9ACF73B8
	Offset: 0x458
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 84
*/
function __main__()
{
}

