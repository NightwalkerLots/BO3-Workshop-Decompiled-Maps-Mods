#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_powerup_shield_charge;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_156eacee;

/*
	Name: __init__sytem__
	Namespace: namespace_156eacee
	Checksum: 0x8E5BBF9F
	Offset: 0x270
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_craft_slipgun", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_156eacee
	Checksum: 0x6D7698DE
	Offset: 0x2B0
	Size: 0x134
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function __init__()
{
	zm_craftables::include_zombie_craftable("craft_slipgun_zm");
	zm_craftables::add_zombie_craftable("craft_slipgun_zm");
	RegisterClientField("world", "t6_zmb_buildable_slipgun_cooker", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "t6_zmb_buildable_slipgun_extinguisher", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "t6_zmb_buildable_slipgun_foot", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "t6_zmb_buildable_slipgun_throttle", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
}

