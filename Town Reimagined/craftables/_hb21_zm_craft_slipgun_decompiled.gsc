#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_156eacee;

/*
	Name: __init__sytem__
	Namespace: namespace_156eacee
	Checksum: 0xB09D6D24
	Offset: 0x438
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 30
*/
function autoexec __init__sytem__()
{
	system::register("zm_craft_slipgun", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_156eacee
	Checksum: 0x1B4C321C
	Offset: 0x480
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function __init__()
{
	init();
	return;
	ERROR: Bad function call
}

/*
	Name: init
	Namespace: namespace_156eacee
	Checksum: 0xD272E920
	Offset: 0x4A0
	Size: 0x430
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function init()
{
	slipgun_cooker = zm_craftables::generate_zombie_craftable_piece("craft_slipgun_zm", "cooker", 32, 64, 0, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "t6_zmb_buildable_slipgun_cooker", 1, "build_zs");
	var_20c9d4c3 = zm_craftables::generate_zombie_craftable_piece("craft_slipgun_zm", "extinguisher", 48, 15, 0, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "t6_zmb_buildable_slipgun_extinguisher", 1, "build_zs");
	slipgun_foot = zm_craftables::generate_zombie_craftable_piece("craft_slipgun_zm", "foot", 48, 15, 0, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "t6_zmb_buildable_slipgun_foot", 1, "build_zs");
	slipgun_throttle = zm_craftables::generate_zombie_craftable_piece("craft_slipgun_zm", "throttle", 48, 15, 0, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "t6_zmb_buildable_slipgun_throttle", 1, "build_zs");
	RegisterClientField("world", "t6_zmb_buildable_slipgun_cooker", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "t6_zmb_buildable_slipgun_extinguisher", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "t6_zmb_buildable_slipgun_foot", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "t6_zmb_buildable_slipgun_throttle", 1, 1, "int", undefined, 0);
	slipgun = spawnstruct();
	slipgun.name = "craft_slipgun_zm";
	slipgun.weaponName = "t6_slipgun";
	slipgun zm_craftables::add_craftable_piece(slipgun_cooker);
	slipgun zm_craftables::add_craftable_piece(var_20c9d4c3);
	slipgun zm_craftables::add_craftable_piece(slipgun_foot);
	slipgun zm_craftables::add_craftable_piece(slipgun_throttle);
	slipgun.onBuyWeapon = &function_452768d7;
	slipgun.triggerThink = &function_7582fdbc;
	zm_craftables::include_zombie_craftable(slipgun);
	zm_craftables::add_zombie_craftable("craft_slipgun_zm", "Hold ^3&&1^7 to craft Sliquifier", "ERROR", "Took Sliquifier!", &on_fully_crafted, 1);
	zm_craftables::add_zombie_craftable_vox_category("craft_slipgun_zm", "build_zs");
	zm_craftables::make_zombie_craftable_open("craft_slipgun_zm", "t6_wpn_zmb_slipgun_world", (0, 0, 0), VectorScale((0, 0, 1), 16));
}

/*
	Name: __main__
	Namespace: namespace_156eacee
	Checksum: 0x9ACF73B8
	Offset: 0x8D8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function __main__()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7582fdbc
	Namespace: namespace_156eacee
	Checksum: 0x3BAA7D9D
	Offset: 0x8E8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 113
*/
function function_7582fdbc()
{
	zm_craftables::craftable_trigger_think("craft_slipgun_zm" + "_craftable_trigger", "craft_slipgun_zm", "t6_slipgun", "Hold ^3&&1^7 to take Sliquifier", 1, 2);
}

/*
	Name: show_infotext_for_duration
	Namespace: namespace_156eacee
	Checksum: 0x75FE5E99
	Offset: 0x940
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 128
*/
function show_infotext_for_duration(str_infotext, n_duration)
{
}

/*
	Name: on_pickup_common
	Namespace: namespace_156eacee
	Checksum: 0x9BDCF5FC
	Offset: 0x960
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 142
*/
function on_pickup_common(player)
{
	player playsound("zmb_craftable_pickup");
	if(isdefined(level.var_2e95556b))
	{
		player thread [[level.var_2e95556b]]();
	}
	foreach(e_player in level.players)
	{
	}
	self pickup_from_mover();
	self.piece_owner = player;
}

/*
	Name: on_drop_common
	Namespace: namespace_156eacee
	Checksum: 0x3FE49262
	Offset: 0xA48
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 166
*/
function on_drop_common(player)
{
	self drop_on_mover(player);
	self.piece_owner = undefined;
}

/*
	Name: pickup_from_mover
	Namespace: namespace_156eacee
	Checksum: 0x3C9B39FB
	Offset: 0xA80
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 182
*/
function pickup_from_mover()
{
	if(isdefined(level.var_e60c653a))
	{
		[[level.var_e60c653a]]();
	}
}

/*
	Name: on_fully_crafted
	Namespace: namespace_156eacee
	Checksum: 0x365B7A0
	Offset: 0xAA8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 200
*/
function on_fully_crafted()
{
	return 1;
}

/*
	Name: drop_on_mover
	Namespace: namespace_156eacee
	Checksum: 0xE696CB24
	Offset: 0xAB8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 215
*/
function drop_on_mover(player)
{
	if(isdefined(level.var_231a158b))
	{
		[[level.var_231a158b]]();
	}
}

/*
	Name: function_452768d7
	Namespace: namespace_156eacee
	Checksum: 0x3C623394
	Offset: 0xAE8
	Size: 0x1E
	Parameters: 1
	Flags: None
	Line Number: 233
*/
function function_452768d7(player)
{
	level notify("hash_2d3f05ff", player);
}

