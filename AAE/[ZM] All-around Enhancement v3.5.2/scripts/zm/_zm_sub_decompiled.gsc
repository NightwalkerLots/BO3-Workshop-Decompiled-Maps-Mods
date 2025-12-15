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

#namespace namespace_d0cd8c5d;

/*
	Name: __init__sytem__
	Namespace: namespace_d0cd8c5d
	Checksum: 0x424F4353
	Offset: 0x3B0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 31
*/
function autoexec __init__sytem__()
{
	system::register("zm_sub", &__init__, undefined, undefined);
	return;
	ERROR: Bad function call
}

/*
	Name: __init__
	Namespace: namespace_d0cd8c5d
	Checksum: 0x424F4353
	Offset: 0x3F0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function __init__()
{
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_9e5ebece
	Namespace: namespace_d0cd8c5d
	Checksum: 0x424F4353
	Offset: 0x400
	Size: 0x4A0
	Parameters: 4
	Flags: None
	Line Number: 65
*/
function function_9e5ebece(player, type, character, message)
{
	if(!level flag::get("start_zombie_round_logic"))
	{
		return;
	}
	if(level.script == "zm_der_bunker")
	{
		return;
	}
	if(level.script == "zm_zod" || level.script == "zm_factory" || level.script == "zm_castle" || level.script == "zm_island" || level.script == "zm_genesis" || level.script == "zm_stalingrad" || level.script == "zm_sumpf" || level.script == "zm_temple" || level.script == "zm_moon" || level.script == "zm_die" || level.script == "zm_asylum" || level.script == "zm_theater" || level.script == "zm_cosmodrome" || level.script == "zm_tomb")
	{
		return;
	}
	if(isdefined(level.gamevars["hardcore"]) && level.gamevars["hardcore"] == 1)
	{
		return;
	}
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
				util::setClientSysState("sendsub", color + character + "^7: " + message, player);
			}
			else
			{
				util::setClientSysState("sendsub", color + " ^7" + message, player);
			}
		}
		else
		{
			util::setClientSysState("sendsub", "^7" + message, player);
		}
	}
	else
	{
		foreach(var_2d4cbd56 in level.activePlayers)
		{
			if(isdefined(var_2d4cbd56.var_1da7a07d) && var_2d4cbd56.sessionstate != "spectator")
			{
				if(isdefined(color))
				{
					if(isdefined(character))
					{
						if(color == "^2" && var_2d4cbd56.name == character)
						{
							util::setClientSysState("sendsub", "^3" + character + "^7: " + message, var_2d4cbd56);
						}
						else
						{
							util::setClientSysState("sendsub", color + character + "^7: " + message, var_2d4cbd56);
						}
					}
					else
					{
						util::setClientSysState("sendsub", color + " ^7" + message, var_2d4cbd56);
						continue;
					}
				}
				util::setClientSysState("sendsub", "^7" + message, var_2d4cbd56);
			}
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b0aa75c8
	Namespace: namespace_d0cd8c5d
	Checksum: 0x424F4353
	Offset: 0x8A8
	Size: 0x2FA
	Parameters: 4
	Flags: None
	Line Number: 169
*/
function function_b0aa75c8(player, type, character, message)
{
	if(level.script == "zm_der_bunker")
	{
		return;
	}
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
				util::setClientSysState("sendsub", color + character + "^7: " + message, player);
			}
			else
			{
				util::setClientSysState("sendsub", color + " ^7" + message, player);
			}
		}
		else
		{
			util::setClientSysState("sendsub", "^7" + message, player);
		}
	}
	else
	{
		foreach(var_2d4cbd56 in level.activePlayers)
		{
			if(isdefined(color))
			{
				if(isdefined(character))
				{
					if(color == "^2" && var_2d4cbd56.name == character)
					{
						util::setClientSysState("sendsub", "^3" + character + "^7: " + message, var_2d4cbd56);
					}
					else
					{
						util::setClientSysState("sendsub", color + character + "^7: " + message, var_2d4cbd56);
					}
				}
				else
				{
					util::setClientSysState("sendsub", color + " ^7" + message, var_2d4cbd56);
					continue;
				}
			}
			util::setClientSysState("sendsub", "^7" + message, var_2d4cbd56);
		}
	}
}

