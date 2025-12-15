#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_powerup_shield_charge;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_482ed9d6;

/*
	Name: __init__sytem__
	Namespace: namespace_482ed9d6
	Checksum: 0x804F2652
	Offset: 0x238
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("zm_craft_dragonshield", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_482ed9d6
	Checksum: 0xEC333A22
	Offset: 0x278
	Size: 0xF4
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	zm_craftables::include_zombie_craftable("craft_dragonshield_zm");
	zm_craftables::add_zombie_craftable("craft_dragonshield_zm");
	RegisterClientField("world", "wpn_t7_zmb_dlc3_dragon_pelvis", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_dlc3_dragon_head", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_dlc3_dragon_window", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
}

