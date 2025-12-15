#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_powerup_shield_charge;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_11be1214;

/*
	Name: __init__sytem__
	Namespace: namespace_11be1214
	Checksum: 0x8F9A91AD
	Offset: 0x468
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_craft_staff", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_11be1214
	Checksum: 0x66A70FA
	Offset: 0x4A8
	Size: 0x4C4
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	zm_craftables::include_zombie_craftable("craft_staff_fire");
	zm_craftables::add_zombie_craftable("craft_staff_fire");
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_crystal_fire_world", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_tip_fire_world", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_fire_parts_stem", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_fire_parts_revive", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	zm_craftables::include_zombie_craftable("craft_staff_water");
	zm_craftables::add_zombie_craftable("craft_staff_water");
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_crystal_water_world", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_tip_water_world", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_water_parts_stem", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_water_parts_revive", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	zm_craftables::include_zombie_craftable("craft_staff_air");
	zm_craftables::add_zombie_craftable("craft_staff_air");
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_crystal_air_world", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_tip_air_world", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_air_parts_stem", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_air_revive_view", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	zm_craftables::include_zombie_craftable("craft_staff_bolt");
	zm_craftables::add_zombie_craftable("craft_staff_bolt");
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_crystal_lightning_world", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_tip_lightning_world", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_lightning_parts_stem", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_lightning_parts_revive", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
}

