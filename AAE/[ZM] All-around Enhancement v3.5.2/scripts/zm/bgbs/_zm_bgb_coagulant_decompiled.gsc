#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_lightning_chain;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_utility;

#namespace namespace_4e2ad0b7;

/*
	Name: __init__sytem__
	Namespace: namespace_4e2ad0b7
	Checksum: 0x424F4353
	Offset: 0x1A8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_coagulant", &__init__, undefined, "bgb");
}

/*
	Name: __init__
	Namespace: namespace_4e2ad0b7
	Checksum: 0x424F4353
	Offset: 0x1E8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	bgb::register("zm_bgb_coagulant", "time", 1200, &enable, &disable, undefined, undefined);
}

/*
	Name: enable
	Namespace: namespace_4e2ad0b7
	Checksum: 0x424F4353
	Offset: 0x258
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function enable()
{
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	self endon("hash_994d5e9e");
	self.n_bleedout_time_multiplier = 40;
	for(;;)
	{
		self waittill("player_downed");
		self bgb::do_one_shot_use(1);
	}
}

/*
	Name: disable
	Namespace: namespace_4e2ad0b7
	Checksum: 0x424F4353
	Offset: 0x2C8
	Size: 0xE
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function disable()
{
	self.n_bleedout_time_multiplier = undefined;
}

