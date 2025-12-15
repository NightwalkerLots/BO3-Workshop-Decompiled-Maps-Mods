#include scripts\codescripts\struct;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_powerups;

#namespace namespace_808cb90;

/*
	Name: __init__sytem__
	Namespace: namespace_808cb90
	Checksum: 0x424F4353
	Offset: 0x100
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 16
*/
function autoexec __init__sytem__()
{
	system::register("zm_powerup_purifier", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_808cb90
	Checksum: 0x424F4353
	Offset: 0x140
	Size: 0x6C
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	if(GetWeapon("purifier").name == "purifier")
	{
		zm_powerups::include_zombie_powerup("purifier");
		zm_powerups::add_zombie_powerup("purifier", "powerup_purifier");
	}
}

