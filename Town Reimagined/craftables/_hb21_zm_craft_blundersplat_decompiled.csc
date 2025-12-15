#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_utility;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_a272a90;

/*
	Name: __init__sytem__
	Namespace: namespace_a272a90
	Checksum: 0x2CC9CD18
	Offset: 0x1E0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_craft_blundersplat", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_a272a90
	Checksum: 0x1672F7F9
	Offset: 0x220
	Size: 0xF4
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_craftables::include_zombie_craftable("craft_blundersplat_zm");
	zm_craftables::add_zombie_craftable("craft_blundersplat_zm");
	RegisterClientField("world", "p6_zm_al_packasplat_engine", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "p6_zm_al_packasplat_iv", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "p6_zm_al_packasplat_suitcase", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
}

