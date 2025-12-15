#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_utility;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_76f0519f;

/*
	Name: __init__sytem__
	Namespace: namespace_76f0519f
	Checksum: 0x394DFFBC
	Offset: 0x208
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_craft_origins_shield", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_76f0519f
	Checksum: 0xDBCB0D8
	Offset: 0x248
	Size: 0xF4
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	zm_craftables::include_zombie_craftable("craft_origins_shield_zm");
	zm_craftables::add_zombie_craftable("craft_origins_shield_zm");
	RegisterClientField("world", "wpn_t7_zmb_zod_rocket_shield_tank_parts", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_zod_rocket_shield_eagle", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_zod_rocket_shield_window", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
}

