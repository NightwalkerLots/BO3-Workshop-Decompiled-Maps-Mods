#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\gametypes\_globallogic_spawn;

#namespace namespace_6d4de49;

/*
	Name: __init__sytem__
	Namespace: namespace_6d4de49
	Checksum: 0x424F4353
	Offset: 0x258
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 27
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_ephemeral_enhancement", &__init__, undefined, "bgb");
	return;
	++;
}

/*
	Name: __init__
	Namespace: namespace_6d4de49
	Checksum: 0x424F4353
	Offset: 0x298
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	bgb::register("zm_bgb_ephemeral_enhancement", "activated", 1, undefined, undefined, &validation, &activation);
}

/*
	Name: validation
	Namespace: namespace_6d4de49
	Checksum: 0x424F4353
	Offset: 0x308
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function validation()
{
	return function_a77ca6ad();
}

/*
	Name: function_a77ca6ad
	Namespace: namespace_6d4de49
	Checksum: 0x424F4353
	Offset: 0x328
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function function_a77ca6ad()
{
	foreach(player in GetPlayers())
	{
		if(player.sessionstate == "spectator" || player laststand::player_is_in_laststand())
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: activation
	Namespace: namespace_6d4de49
	Checksum: 0x424F4353
	Offset: 0x3E8
	Size: 0x10A
	Parameters: 0
	Flags: None
	Line Number: 100
*/
function activation()
{
	self endon("death");
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	foreach(player in GetPlayers())
	{
		if(player.sessionstate == "spectator")
		{
			player zm::spectator_respawn_player();
			continue;
		}
		if(player laststand::player_is_in_laststand())
		{
			player zm_laststand::auto_revive(self);
		}
	}
}

