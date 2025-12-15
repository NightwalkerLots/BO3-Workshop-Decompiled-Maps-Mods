#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_utility;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_beb7b12;

/*
	Name: __init__sytem__
	Namespace: namespace_beb7b12
	Checksum: 0xE884D843
	Offset: 0x210
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_craft_zombie_shield", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_beb7b12
	Checksum: 0x89B6F5CC
	Offset: 0x250
	Size: 0x124
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_craftables::include_zombie_craftable("craft_zombie_shield_zm");
	zm_craftables::add_zombie_craftable("craft_zombie_shield_zm");
	RegisterClientField("world", "t6_wpn_zmb_shield_dolly", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "t6_wpn_zmb_shield_door", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	clientfield::register("clientuimodel", "zmInventory.widget_power_parts", 1, 1, "int", undefined, 0, 0);
	clientfield::register("clientuimodel", "zmInventory.player_crafted_power", 1, 1, "int", undefined, 0, 0);
}

