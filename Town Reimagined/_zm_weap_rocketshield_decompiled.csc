#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craft_shield;

#namespace zm_equip_turret;

/*
	Name: __init__sytem__
	Namespace: zm_equip_turret
	Checksum: 0xBEC5B720
	Offset: 0x1C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("zm_weap_rocketshield", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_equip_turret
	Checksum: 0x48A26538
	Offset: 0x208
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	clientfield::register("allplayers", "rs_ammo", 1, 1, "int", &set_rocketshield_ammo, 0, 0);
}

/*
	Name: set_rocketshield_ammo
	Namespace: zm_equip_turret
	Checksum: 0x6C2A3F5D
	Offset: 0x260
	Size: 0xA4
	Parameters: 7
	Flags: None
	Line Number: 51
*/
function set_rocketshield_ammo(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		self MapShaderConstant(localClientNum, 0, "scriptVector2", 0, 1, 0, 0);
		continue;
	}
	self MapShaderConstant(localClientNum, 0, "scriptVector2", 0, 0, 0, 0);
}

