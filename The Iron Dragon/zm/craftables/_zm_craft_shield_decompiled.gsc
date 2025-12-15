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

#namespace zm_craft_shield;

/*
	Name: __init__sytem__
	Namespace: zm_craft_shield
	Checksum: 0xB906D114
	Offset: 0x448
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 30
*/
function autoexec __init__sytem__()
{
	system::register("zm_craft_shield", &__init__, &__main__, undefined);
	return;
}

/*
	Name: __init__
	Namespace: zm_craft_shield
	Checksum: 0x9ACF73B8
	Offset: 0x490
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 46
*/
function __init__()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: init
	Namespace: zm_craft_shield
	Checksum: 0xFFF25C5
	Offset: 0x4A0
	Size: 0x4E0
	Parameters: 6
	Flags: None
	Line Number: 62
*/
function init(shield_equipment, shield_weapon, shield_model, str_to_craft, str_taken, str_grab)
{
	if(!isdefined(str_to_craft))
	{
		str_to_craft = &"ZOMBIE_CRAFT_RIOT";
	}
	if(!isdefined(str_taken))
	{
		str_taken = &"ZOMBIE_BOUGHT_RIOT";
	}
	if(!isdefined(str_grab))
	{
		str_grab = &"ZOMBIE_GRAB_RIOTSHIELD";
	}
	level.craftable_shield_equipment = shield_equipment;
	level.craftable_shield_weapon = shield_weapon;
	level.craftable_shield_model = shield_model;
	level.craftable_shield_grab = str_grab;
	level.riotshield_supports_deploy = 0;
	riotShield_dolly = zm_craftables::generate_zombie_craftable_piece(level.craftable_shield_equipment, "dolly", 32, 64, 0, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "piece_riotshield_dolly", 1, "build_zs");
	riotShield_door = zm_craftables::generate_zombie_craftable_piece(level.craftable_shield_equipment, "door", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "piece_riotshield_door", 1, "build_zs");
	riotShield_clamp = zm_craftables::generate_zombie_craftable_piece(level.craftable_shield_equipment, "clamp", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "piece_riotshield_clamp", 1, "build_zs");
	RegisterClientField("world", "piece_riotshield_dolly", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "piece_riotshield_door", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "piece_riotshield_clamp", 1, 1, "int", undefined, 0);
	clientfield::register("toplayer", "ZMUI_SHIELD_PART_PICKUP", 1, 1, "int");
	clientfield::register("toplayer", "ZMUI_SHIELD_CRAFTED", 1, 1, "int");
	riotshield = spawnstruct();
	riotshield.name = level.craftable_shield_equipment;
	riotshield.weaponName = level.craftable_shield_weapon;
	riotshield zm_craftables::add_craftable_piece(riotShield_dolly);
	riotshield zm_craftables::add_craftable_piece(riotShield_door);
	riotshield zm_craftables::add_craftable_piece(riotShield_clamp);
	riotshield.onBuyWeapon = &on_buy_weapon_riotshield;
	riotshield.triggerThink = &riotshield_craftable;
	zm_craftables::include_zombie_craftable(riotshield);
	zm_craftables::add_zombie_craftable(level.craftable_shield_equipment, str_to_craft, "ERROR", str_taken, &on_fully_crafted, 1);
	zm_craftables::add_zombie_craftable_vox_category(level.craftable_shield_equipment, "build_zs");
	zm_craftables::make_zombie_craftable_open(level.craftable_shield_equipment, level.craftable_shield_model, VectorScale((0, -1, 0), 90), VectorScale((0, 0, 1), 26));
	clientfield::register("clientuimodel", "zmInventory.widget_shield_parts", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.player_crafted_shield", 1, 1, "int");
}

/*
	Name: __main__
	Namespace: zm_craft_shield
	Checksum: 0x9ACF73B8
	Offset: 0x988
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 115
*/
function __main__()
{
}

/*
	Name: riotshield_craftable
	Namespace: zm_craft_shield
	Checksum: 0x52D14B86
	Offset: 0x998
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 129
*/
function riotshield_craftable()
{
	zm_craftables::craftable_trigger_think("riotshield_zm_craftable_trigger", level.craftable_shield_equipment, level.craftable_shield_weapon, level.craftable_shield_grab, 1, 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: show_infotext_for_duration
	Namespace: zm_craft_shield
	Checksum: 0xF88088E5
	Offset: 0x9E0
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 146
*/
function show_infotext_for_duration(str_infotext, n_duration)
{
	self clientfield::set_to_player(str_infotext, 1);
	wait(n_duration);
	self clientfield::set_to_player(str_infotext, 0);
}

/*
	Name: on_pickup_common
	Namespace: zm_craft_shield
	Checksum: 0x24A8F703
	Offset: 0xA40
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 163
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
		e_player thread zm_craftables::player_show_craftable_parts_ui("zmInventory.player_crafted_shield", "zmInventory.widget_shield_parts", 0);
		e_player thread show_infotext_for_duration("ZMUI_SHIELD_PART_PICKUP", 3.5);
	}
	self pickup_from_mover();
	self.piece_owner = player;
}

/*
	Name: on_drop_common
	Namespace: zm_craft_shield
	Checksum: 0x16874441
	Offset: 0xB70
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 189
*/
function on_drop_common(player)
{
	self drop_on_mover(player);
	self.piece_owner = undefined;
}

/*
	Name: pickup_from_mover
	Namespace: zm_craft_shield
	Checksum: 0xF565158F
	Offset: 0xBA8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 205
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
	Namespace: zm_craft_shield
	Checksum: 0xA037783E
	Offset: 0xBD0
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 223
*/
function on_fully_crafted()
{
	players = level.players;
	foreach(e_player in players)
	{
		if(zm_utility::is_player_valid(e_player))
		{
			e_player thread zm_craftables::player_show_craftable_parts_ui("zmInventory.player_crafted_shield", "zmInventory.widget_shield_parts", 1);
			e_player thread show_infotext_for_duration("ZMUI_SHIELD_CRAFTED", 3.5);
		}
	}
	return 1;
	wait(players);
}

/*
	Name: drop_on_mover
	Namespace: zm_craft_shield
	Checksum: 0xB9EA05EF
	Offset: 0xCC8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 248
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
	Namespace: zm_craft_shield
	Checksum: 0xC67F1289
	Offset: 0xCF8
	Size: 0x96
	Parameters: 1
	Flags: None
	Line Number: 266
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

