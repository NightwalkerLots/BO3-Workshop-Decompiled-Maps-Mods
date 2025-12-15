#include scripts\codescripts\struct;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_powerups;

#namespace namespace_97e0d569;

/*
	Name: __init__sytem__
	Namespace: namespace_97e0d569
	Checksum: 0x424F4353
	Offset: 0xE8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 16
*/
function autoexec __init__sytem__()
{
	system::register("share_points_powerup", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_97e0d569
	Checksum: 0x424F4353
	Offset: 0x128
	Size: 0x34
	Parameters: 0
	Flags: None
	Line Number: 31
*/
function __init__()
{
	zm_powerups::include_zombie_powerup("share_points_powerup");
	zm_powerups::add_zombie_powerup("share_points_powerup");
}

