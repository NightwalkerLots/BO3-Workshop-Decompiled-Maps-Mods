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
#include scripts\zm\_hb21_n4l_zm_weap_black_hole_bomb;
#include scripts\zm\_hb21_zm_soul_chests;
#include scripts\zm\_hb21_zm_weap_beacon;
#include scripts\zm\_hb21_zm_weap_dragonshield;
#include scripts\zm\_hb21_zm_weap_one_inch_punch;
#include scripts\zm\_hb21_zm_weap_staff_air;
#include scripts\zm\_hb21_zm_weap_staff_fire;
#include scripts\zm\_hb21_zm_weap_staff_lightning;
#include scripts\zm\_hb21_zm_weap_staff_revive;
#include scripts\zm\_hb21_zm_weap_staff_water;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_idgun;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\craftables\_hb21_zm_craft_dragonshield;
#include scripts\zm\craftables\_hb21_zm_craft_staff;

#namespace namespace_315dc810;

/*
	Name: __init__sytem__
	Namespace: namespace_315dc810
	Checksum: 0x2E228511
	Offset: 0x5E0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 47
*/
function autoexec __init__sytem__()
{
	system::register("zm_t7_weapons", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_315dc810
	Checksum: 0x4E316F65
	Offset: 0x628
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function __init__()
{
	level.zombie_death_animscript_override = &zombie_death_animscript_override;
	level.b_allow_idgun_pap = 1;
	level.idgun_weapons = [];
	level.idgun_weapons[0] = GetWeapon("idgun_0");
	level.idgun_weapons[1] = GetWeapon("idgun_1");
	level.idgun_weapons[2] = GetWeapon("idgun_2");
	level.idgun_weapons[3] = GetWeapon("idgun_3");
	level.idgun_weapons[4] = GetWeapon("idgun_upgraded_0");
	level.idgun_weapons[5] = GetWeapon("idgun_upgraded_1");
	level.idgun_weapons[6] = GetWeapon("idgun_upgraded_2");
	level.idgun_weapons[7] = GetWeapon("idgun_upgraded_3");
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_t7_weapons.csv", 1);
}

/*
	Name: zombie_death_animscript_override
	Namespace: namespace_315dc810
	Checksum: 0x2EAE5B6
	Offset: 0x7B8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 88
*/
function zombie_death_animscript_override()
{
	if("t6_shotgun_rottweil72_upgraded" == self.damageWeapon.name || "t7_shotgun_rottweil72_upgraded" == self.damageWeapon.name)
	{
		self thread zm_spawner::dragons_breath_flame_death_fx();
	}
}

/*
	Name: __main__
	Namespace: namespace_315dc810
	Checksum: 0x9ACF73B8
	Offset: 0x818
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function __main__()
{
}

