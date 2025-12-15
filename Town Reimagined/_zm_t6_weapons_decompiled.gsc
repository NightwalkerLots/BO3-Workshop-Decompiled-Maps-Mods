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
#include scripts\zm\_hb21_zm_weap_blundersplat;
#include scripts\zm\_hb21_zm_weap_galvaknuckles;
#include scripts\zm\_hb21_zm_weap_slipgun;
#include scripts\zm\_hb21_zm_weap_tomahawk;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_ammo_counter;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\craftables\_hb21_zm_craft_blundersplat;
#include scripts\zm\craftables\_hb21_zm_craft_slipgun;

#namespace namespace_16e079a1;

/*
	Name: __init__sytem__
	Namespace: namespace_16e079a1
	Checksum: 0x5F4E3852
	Offset: 0x480
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 41
*/
function autoexec __init__sytem__()
{
	system::register("zm_t6_weapons", &__init__, &__main__, undefined);
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: __init__
	Namespace: namespace_16e079a1
	Checksum: 0x27E0C10F
	Offset: 0x4C8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 59
*/
function __init__()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_t6_weapons.csv", 1);
}

/*
	Name: zombie_death_animscript_override
	Namespace: namespace_16e079a1
	Checksum: 0xD5DEB07B
	Offset: 0x4F8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 74
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
	Offset: 0x558
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function __main__()
{
}

