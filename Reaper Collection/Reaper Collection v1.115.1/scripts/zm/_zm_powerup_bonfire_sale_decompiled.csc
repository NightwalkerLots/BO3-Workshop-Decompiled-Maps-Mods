#include scripts\codescripts\struct;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_powerups;

#namespace zm_powerup_bonfire_sale;

/*
	Name: __init__sytem__
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x424F4353
	Offset: 0x120
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 16
*/
function autoexec __init__sytem__()
{
	system::register("zm_powerup_bonfire_sale", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x424F4353
	Offset: 0x160
	Size: 0x74
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	zm_powerups::include_zombie_powerup("bonfire_sale");
	if(ToLower(GetDvarString("g_gametype")) != "zcleansed")
	{
		zm_powerups::add_zombie_powerup("bonfire_sale", "powerup_bon_fire");
	}
}

