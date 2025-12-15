#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_76f0519f;

/*
	Name: __init__sytem__
	Namespace: namespace_76f0519f
	Checksum: 0x193078BC
	Offset: 0x5D0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 31
*/
function autoexec __init__sytem__()
{
	system::register("zm_craft_origins_shield", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_76f0519f
	Checksum: 0x9E5FD25C
	Offset: 0x618
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 46
*/
function __init__()
{
	init();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: init
	Namespace: namespace_76f0519f
	Checksum: 0xB732DF47
	Offset: 0x638
	Size: 0x458
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function init()
{
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	level.var_d348c661 = GetWeapon("zod_riotshield");
	zm_equipment::register("zod_riotshield", &"CRAFTABLES_ORIGINS_SHIELD_HINT", &"CRAFTABLES_ORIGINS_SHIELD_HOWTO", undefined, "originshield");
	level.var_5dd26ad = GetWeapon("zod_riotshield_upgraded");
	zm_equipment::register("zod_riotshield_upgraded", &"CRAFTABLES_ORIGINS_SHIELD_HINT", &"CRAFTABLES_ORIGINS_SHIELD_HOWTO", undefined, "originshield");
	var_e8a995af = zm_craftables::generate_zombie_craftable_piece("craft_origins_shield_zm", "part_0", 32, 64, 0, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_zod_rocket_shield_tank_parts", 1, "build_zs");
	var_c2a71b46 = zm_craftables::generate_zombie_craftable_piece("craft_origins_shield_zm", "part_1", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_zod_rocket_shield_eagle", 1, "build_zs");
	var_9ca4a0dd = zm_craftables::generate_zombie_craftable_piece("craft_origins_shield_zm", "part_2", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_zod_rocket_shield_window", 1, "build_zs");
	RegisterClientField("world", "wpn_t7_zmb_zod_rocket_shield_tank_parts", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_zod_rocket_shield_eagle", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_zod_rocket_shield_window", 1, 1, "int", undefined, 0);
	var_4fb51126 = spawnstruct();
	var_4fb51126.name = "craft_origins_shield_zm";
	var_4fb51126.weaponName = "zod_riotshield";
	var_4fb51126 zm_craftables::add_craftable_piece(var_e8a995af);
	var_4fb51126 zm_craftables::add_craftable_piece(var_c2a71b46);
	var_4fb51126 zm_craftables::add_craftable_piece(var_9ca4a0dd);
	var_4fb51126.onBuyWeapon = &function_404a0e22;
	var_4fb51126.triggerThink = &function_12b9be0d;
	zm_craftables::include_zombie_craftable(var_4fb51126);
	zm_craftables::add_zombie_craftable("craft_origins_shield_zm", "Hold ^3&&1^7 to craft the Rocket Shield", "ERROR", "Taken Rocket Shield!", &on_fully_crafted, 1);
	zm_craftables::add_zombie_craftable_vox_category("craft_origins_shield_zm", "build_zs");
	zm_craftables::make_zombie_craftable_open("craft_origins_shield_zm", "wpn_t7_zmb_zod_rocket_shield_world", VectorScale((0, 1, 0), 270), VectorScale((0, 0, 1), 18));
}

/*
	Name: on_player_connect
	Namespace: namespace_76f0519f
	Checksum: 0x99C5E3ED
	Offset: 0xA98
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 101
*/
function on_player_connect()
{
	self thread function_cf5ccca2();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_cf5ccca2
	Namespace: namespace_76f0519f
	Checksum: 0x4B3F5D61
	Offset: 0xAC0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 118
*/
function function_cf5ccca2()
{
	self endon("disconnect");
	while(isdefined(self))
	{
		self waittill("weapon_change", newWeapon);
		if(newWeapon == GetWeapon("zod_riotshield") || newWeapon == GetWeapon("zod_riotshield_upgraded"))
		{
			break;
		}
	}
	zm_equipment::show_hint_text(&"ROCKET_HINT", 5);
}

/*
	Name: on_player_spawned
	Namespace: namespace_76f0519f
	Checksum: 0xD4BF6FF7
	Offset: 0xB60
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 142
*/
function on_player_spawned()
{
	self thread function_f2c8a0b2();
	return;
}

/*
	Name: __main__
	Namespace: namespace_76f0519f
	Checksum: 0xE005F2D3
	Offset: 0xB88
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 158
*/
function __main__()
{
	zm_equipment::register_for_level("zod_riotshield");
	zm_equipment::Include("zod_riotshield");
	zm_equipment::register_for_level("zod_riotshield_upgraded");
	zm_equipment::Include("zod_riotshield_upgraded");
	zombie_utility::set_zombie_var("riotshield_fling_damage_shield", 100);
	zombie_utility::set_zombie_var("riotshield_knockdown_damage_shield", 15);
	zombie_utility::set_zombie_var("riotshield_juke_damage_shield", 0);
	zombie_utility::set_zombie_var("riotshield_fling_force_juke", 175);
	zombie_utility::set_zombie_var("riotshield_fling_range", 120);
	zombie_utility::set_zombie_var("riotshield_gib_range", 120);
	zombie_utility::set_zombie_var("riotshield_knockdown_range", 120);
}

/*
	Name: function_12b9be0d
	Namespace: namespace_76f0519f
	Checksum: 0x9BD6B76A
	Offset: 0xCD0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 183
*/
function function_12b9be0d()
{
	zm_craftables::craftable_trigger_think("craft_origins_shield_zm" + "_craftable_trigger", "craft_origins_shield_zm", "zod_riotshield", "Hold ^3&&1^7 to take the Rocket Shield", 1, 1);
}

/*
	Name: on_pickup_common
	Namespace: namespace_76f0519f
	Checksum: 0x58C29BC
	Offset: 0xD28
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 198
*/
function on_pickup_common(player)
{
	player playsound("zmb_craftable_pickup");
	if(isdefined(level.craft_shield_piece_pickup_vo_override))
	{
		player thread [[level.craft_shield_piece_pickup_vo_override]]();
	}
	foreach(e_player in level.players)
	{
	}
	self pickup_from_mover();
	self.piece_owner = player;
}

/*
	Name: on_drop_common
	Namespace: namespace_76f0519f
	Checksum: 0xCDB38171
	Offset: 0xE10
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 222
*/
function on_drop_common(player)
{
	self drop_on_mover(player);
	self.piece_owner = undefined;
}

/*
	Name: pickup_from_mover
	Namespace: namespace_76f0519f
	Checksum: 0x9ACF73B8
	Offset: 0xE48
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 238
*/
function pickup_from_mover()
{
}

/*
	Name: on_fully_crafted
	Namespace: namespace_76f0519f
	Checksum: 0xE47EFFF0
	Offset: 0xE58
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 252
*/
function on_fully_crafted()
{
	players = level.players;
	foreach(e_player in players)
	{
	}
	return 1;
}

/*
	Name: drop_on_mover
	Namespace: namespace_76f0519f
	Checksum: 0x32535C35
	Offset: 0xF00
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 271
*/
function drop_on_mover(player)
{
	if(isdefined(level.var_360a6348))
	{
		[[level.var_360a6348]]();
	}
}

/*
	Name: function_404a0e22
	Namespace: namespace_76f0519f
	Checksum: 0x3536E5B4
	Offset: 0xF30
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 289
*/
function function_404a0e22(player)
{
	player playsoundtoplayer("zmb_craftable_buy_shield", player);
}

/*
	Name: function_f2c8a0b2
	Namespace: namespace_76f0519f
	Checksum: 0x137DAA38
	Offset: 0xF68
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 304
*/
function function_f2c8a0b2()
{
	str_wpn_name = level.var_d348c661.name;
	str_notify = str_wpn_name + "_pickup_from_table";
	for(;;)
	{
		self waittill(str_notify);
		if(isdefined(self.var_40898dd1) && self.var_40898dd1)
		{
			self zm_equipment::buy("spx_origins_shield_upgraded");
		}
	}
}

