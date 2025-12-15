#include scripts\codescripts\struct;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_powerups;

#namespace zm_powerup_ww_grenade;

/*
	Name: __init__sytem__
	Namespace: zm_powerup_ww_grenade
	Checksum: 0xE19A742E
	Offset: 0xF8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 16
*/
function autoexec __init__sytem__()
{
	system::register("zm_powerup_ww_grenade", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: zm_powerup_ww_grenade
	Checksum: 0xA62FA5A
	Offset: 0x138
	Size: 0x34
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	zm_powerups::include_zombie_powerup("ww_grenade");
	zm_powerups::add_zombie_powerup("ww_grenade");
}

