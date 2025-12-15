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
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_easteregg_song;
#include scripts\zm\_zm_pack_a_punch;
#include scripts\zm\_zm_pack_a_punch_util;
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
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerup_double_points;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_powerup_free_perk;
#include scripts\zm\_zm_powerup_full_ammo;
#include scripts\zm\_zm_powerup_insta_kill;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_t4_weapons;
#include scripts\zm\_zm_t6_weapons;
#include scripts\zm\_zm_t7_weapons;
#include scripts\zm\_zm_trap_electric;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_usermap;

#namespace namespace_4a1c8625;

/*
	Name: main
	Namespace: namespace_4a1c8625
	Checksum: 0x403B1321
	Offset: 0x8B0
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 65
*/
function main()
{
	zm_usermap::main();
	level.perk_purchase_limit = 6;
	thread namespace_a1bbf102::init();
	zm_perks::spare_change();
	level flag::set("power_on");
	level.player_starting_points = 500;
	startingWeapon = "bo2_m1911";
	weapon = GetWeapon(startingWeapon);
	level.start_weapon = weapon;
	level._zombie_custom_add_weapons = &custom_add_weapons;
	level.zones = [];
	level.zone_manager_init_func = &function_f1e6f843;
	init_zones[0] = "start_zone";
	level thread zm_zonemgr::manage_zones(init_zones);
	level.pathdist_type = 2;
	level.musicplay = 0;
	thread function_148d9374();
	thread function_587eaf6e();
}

/*
	Name: function_f1e6f843
	Namespace: namespace_4a1c8625
	Checksum: 0x4E6A19DE
	Offset: 0xA10
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function function_f1e6f843()
{
	zm_zonemgr::add_adjacent_zone("start_zone", "bar_zone", "enter_bar_zone");
	zm_zonemgr::add_adjacent_zone("start_zone", "bank_zone", "enter_bank_zone");
	zm_zonemgr::add_adjacent_zone("start_zone", "jug_zone", "enter_jug_zone");
	zm_zonemgr::add_adjacent_zone("start_zone", "bowl_zone", "enter_bowl_zone");
	zm_zonemgr::add_adjacent_zone("start_zone", "extra_zone", "enter_extra_zone");
	zm_zonemgr::add_adjacent_zone("extra_zone", "jug_zone", "enter_jug_zone");
	zm_zonemgr::add_adjacent_zone("bank_zone", "vault_room", "enter_vault_room");
	level flag::init("always_on");
	level flag::set("always_on");
}

/*
	Name: custom_add_weapons
	Namespace: namespace_4a1c8625
	Checksum: 0x30F6545D
	Offset: 0xB78
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function custom_add_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_levelcommon_weapons.csv", 1);
}

/*
	Name: function_148d9374
	Namespace: namespace_4a1c8625
	Checksum: 0xE43FC28F
	Offset: 0xBA8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 135
*/
function function_148d9374()
{
	level flag::wait_till("initial_blackscreen_passed");
	var_5a02cdc9 = GetEntArray("musicmulti", "targetname");
	foreach(var_913e21f4 in var_5a02cdc9)
	{
		var_913e21f4 thread function_10e1e99d();
	}
}

/*
	Name: function_10e1e99d
	Namespace: namespace_4a1c8625
	Checksum: 0x5BBF6E71
	Offset: 0xC88
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 155
*/
function function_10e1e99d()
{
	while(1)
	{
		self waittill("trigger", player);
		if(level.musicplay == 0)
		{
			level.musicplay = 1;
			player playsoundwithnotify(self.script_string, "soundcomplete");
			player waittill("hash_6e7499f7");
			level.musicplay = 0;
			continue;
		}
	}
}

/*
	Name: function_587eaf6e
	Namespace: namespace_4a1c8625
	Checksum: 0x8D5E6033
	Offset: 0xD18
	Size: 0x28C
	Parameters: 0
	Flags: None
	Line Number: 181
*/
function function_587eaf6e()
{
	var_587eaf6e = GetEnt("bank_vault", "targetname");
	var_587eaf6e setcandamage(1);
	while(1)
	{
		var_587eaf6e waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(weapon.type != "grenade" || damage <= 100)
		{
			continue;
		}
		var_587eaf6e notsolid();
		wait(0.1);
		var_900fc177 = struct::get(var_587eaf6e.target, "targetname");
		clip = GetEnt(var_587eaf6e.target, "targetname");
		playsoundatposition(var_587eaf6e.script_sound, var_587eaf6e.origin);
		level flag::set(var_587eaf6e.script_flag);
		playFX("dlc1/castle/fx_demon_gate_dest_ceiling_debris_impact", var_587eaf6e.origin);
		var_b106e031 = var_587eaf6e.origin - var_900fc177.origin;
		var_587eaf6e physicslaunch(var_587eaf6e.origin, var_b106e031 * 0.5);
		clip delete();
		break;
	}
}

