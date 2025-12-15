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
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_powerup_shield_charge;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_482ed9d6;

/*
	Name: __init__sytem__
	Namespace: namespace_482ed9d6
	Checksum: 0xEEDA5626
	Offset: 0x478
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 30
*/
function autoexec __init__sytem__()
{
	system::register("zm_craft_dragonshield", &__init__, &__main__, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_482ed9d6
	Checksum: 0xF173576A
	Offset: 0x4C0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 47
*/
function __init__()
{
	init("craft_dragonshield_zm", "dragon_shield", "wpn_t7_zmb_dlc3_dragon_shield_dmg0_world");
}

/*
	Name: init
	Namespace: namespace_482ed9d6
	Checksum: 0xA1FE5FAE
	Offset: 0x4F8
	Size: 0x3E8
	Parameters: 6
	Flags: None
	Line Number: 62
*/
function init(shield_equipment, shield_weapon, shield_model, str_to_craft, str_taken, str_grab)
{
	if(!isdefined(str_to_craft))
	{
		str_to_craft = &"ZOMBIE_DRAGON_SHIELD_CRAFT";
	}
	if(!isdefined(str_taken))
	{
		str_taken = &"ZOMBIE_DRAGON_SHIELD_TAKEN";
	}
	if(!isdefined(str_grab))
	{
		str_grab = &"ZOMBIE_GRAB_RIOTSHIELD";
	}
	var_e8016295 = zm_craftables::generate_zombie_craftable_piece("craft_dragonshield_zm", "pelvis", 32, 64, 0, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_dlc3_dragon_pelvis", 1, "build_zs");
	var_c2b3430c = zm_craftables::generate_zombie_craftable_piece("craft_dragonshield_zm", "head", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_dlc3_dragon_head", 1, "build_zs");
	var_1d2bc0b2 = zm_craftables::generate_zombie_craftable_piece("craft_dragonshield_zm", "window", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_dlc3_dragon_window", 1, "build_zs");
	RegisterClientField("world", "wpn_t7_zmb_dlc3_dragon_pelvis", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_dlc3_dragon_head", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_dlc3_dragon_window", 1, 1, "int", undefined, 0);
	var_f50f6a63 = spawnstruct();
	var_f50f6a63.name = "craft_dragonshield_zm";
	var_f50f6a63.weaponName = "dragon_shield";
	var_f50f6a63 zm_craftables::add_craftable_piece(var_e8016295);
	var_f50f6a63 zm_craftables::add_craftable_piece(var_c2b3430c);
	var_f50f6a63 zm_craftables::add_craftable_piece(var_1d2bc0b2);
	var_f50f6a63.onBuyWeapon = &on_buy_weapon_riotshield;
	var_f50f6a63.triggerThink = &riotshield_craftable;
	zm_craftables::include_zombie_craftable(var_f50f6a63);
	zm_craftables::add_zombie_craftable("craft_dragonshield_zm", str_to_craft, "ERROR", str_taken, &on_fully_crafted, 1);
	zm_craftables::add_zombie_craftable_vox_category("craft_dragonshield_zm", "build_zs");
	zm_craftables::make_zombie_craftable_open("craft_dragonshield_zm", "wpn_t7_zmb_dlc3_dragon_shield_dmg0_world", VectorScale((0, -1, 0), 90), VectorScale((0, 0, 1), 26));
}

/*
	Name: __main__
	Namespace: namespace_482ed9d6
	Checksum: 0x9ACF73B8
	Offset: 0x8E8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function __main__()
{
	return;
}

/*
	Name: riotshield_craftable
	Namespace: namespace_482ed9d6
	Checksum: 0x29587420
	Offset: 0x8F8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 121
*/
function riotshield_craftable()
{
	zm_craftables::craftable_trigger_think("craft_dragonshield_zm_craftable_trigger", "craft_dragonshield_zm", "dragon_shield", "Hold ^3&&1^7 to equip Guard of Fafnir", 1, 1);
}

/*
	Name: show_infotext_for_duration
	Namespace: namespace_482ed9d6
	Checksum: 0x9EE67106
	Offset: 0x940
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 136
*/
function show_infotext_for_duration(str_infotext, n_duration)
{
}

/*
	Name: on_pickup_common
	Namespace: namespace_482ed9d6
	Checksum: 0x442E1DB9
	Offset: 0x960
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 150
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
	Namespace: namespace_482ed9d6
	Checksum: 0xC1C83448
	Offset: 0xA48
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 174
*/
function on_drop_common(player)
{
	self drop_on_mover(player);
	self.piece_owner = undefined;
	return;
}

/*
	Name: pickup_from_mover
	Namespace: namespace_482ed9d6
	Checksum: 0x1E11F80
	Offset: 0xA80
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 191
*/
function pickup_from_mover()
{
	if(isdefined(level.craft_shield_pickup_override))
	{
		[[level.craft_shield_pickup_override]]();
	}
}

/*
	Name: on_fully_crafted
	Namespace: namespace_482ed9d6
	Checksum: 0xB1EFCC21
	Offset: 0xAA8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 209
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
	Namespace: namespace_482ed9d6
	Checksum: 0x214408A
	Offset: 0xB50
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 228
*/
function drop_on_mover(player)
{
	if(isdefined(level.craft_shield_drop_override))
	{
		[[level.craft_shield_drop_override]]();
	}
}

/*
	Name: on_buy_weapon_riotshield
	Namespace: namespace_482ed9d6
	Checksum: 0x34A9CF5C
	Offset: 0xB80
	Size: 0x96
	Parameters: 1
	Flags: None
	Line Number: 246
*/
function on_buy_weapon_riotshield(player)
{
	if(isdefined(player.player_shield_reset_health))
	{
		player [[player.player_shield_reset_health]]();
	}
	if(isdefined(player.player_shield_reset_location))
	{
		player [[player.player_shield_reset_location]]();
	}
	player playsound("zmb_craftable_buy_shield");
	level notify("shield_built", player);
}

