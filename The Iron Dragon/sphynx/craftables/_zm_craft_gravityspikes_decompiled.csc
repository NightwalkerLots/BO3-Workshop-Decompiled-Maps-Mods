#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_utility;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_ccb89763;

/*
	Name: __init__sytem__
	Namespace: namespace_ccb89763
	Checksum: 0x59E1C69D
	Offset: 0x1E0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_craft_gravityspikes", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_ccb89763
	Checksum: 0x2FB5DF0D
	Offset: 0x220
	Size: 0xF4
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_craftables::include_zombie_craftable("craft_gravityspikes_zm");
	zm_craftables::add_zombie_craftable("craft_gravityspikes_zm");
	RegisterClientField("world", "gravityspike_part_body", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "gravityspike_part_guards", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
	RegisterClientField("world", "gravityspike_part_handle", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
}

