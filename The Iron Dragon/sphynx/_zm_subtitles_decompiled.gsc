#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace namespace_56430b4;

/*
	Name: __init__sytem__
	Namespace: namespace_56430b4
	Checksum: 0xC9A216BD
	Offset: 0x300
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 31
*/
function autoexec __init__sytem__()
{
	system::register("zm_subtitles", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_56430b4
	Checksum: 0x6553C5A6
	Offset: 0x340
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 46
*/
function __init__()
{
	util::registerClientSys("subtitleMessage");
	callback::on_connect(&on_player_connect);
	return;
}

/*
	Name: on_player_connect
	Namespace: namespace_56430b4
	Checksum: 0xF73ED5FD
	Offset: 0x388
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function on_player_connect()
{
	self util::setClientSysState("subtitleMessage", "");
}

/*
	Name: function_8a662f5e
	Namespace: namespace_56430b4
	Checksum: 0x45E4FC50
	Offset: 0x3C0
	Size: 0x292
	Parameters: 4
	Flags: None
	Line Number: 78
*/
function function_8a662f5e(player, type, character, message)
{
	if(!isdefined(message))
	{
		return;
	}
	if(isdefined(type))
	{
		switch(type)
		{
			case 1:
			{
				color = "^1";
				break;
			}
			case 2:
			{
				color = "^2";
				break;
			}
			case 3:
			{
				color = "^7";
				break;
			}
		}
	}
	if(isdefined(player))
	{
		if(isdefined(color))
		{
			if(isdefined(character))
			{
				player util::setClientSysState("subtitleMessage", color + character + ": ^7" + message, player);
				continue;
			}
			player util::setClientSysState("subtitleMessage", color + " ^7" + message, player);
			continue;
		}
		player util::setClientSysState("subtitleMessage", "^7" + message, player);
		continue;
	}
	foreach(var_2d4cbd56 in GetPlayers())
	{
		if(isdefined(color))
		{
			if(isdefined(character))
			{
				var_2d4cbd56 util::setClientSysState("subtitleMessage", color + character + ": ^7" + message, var_2d4cbd56);
				continue;
			}
			var_2d4cbd56 util::setClientSysState("subtitleMessage", color + " ^7" + message, var_2d4cbd56);
			continue;
		}
		var_2d4cbd56 util::setClientSysState("subtitleMessage", "^7" + message, var_2d4cbd56);
	}
}

