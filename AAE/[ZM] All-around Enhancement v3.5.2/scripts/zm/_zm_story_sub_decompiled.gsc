#include scripts\shared\callbacks_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace namespace_cc012897;

/*
	Name: __init__sytem__
	Namespace: namespace_cc012897
	Checksum: 0x424F4353
	Offset: 0x1E8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("zm_story_sub", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_cc012897
	Checksum: 0x424F4353
	Offset: 0x230
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
}

/*
	Name: __main__
	Namespace: namespace_cc012897
	Checksum: 0x424F4353
	Offset: 0x240
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 46
*/
function __main__()
{
	if(level.script == "zm_zod" || level.script == "zm_factory" || level.script == "zm_castle" || level.script == "zm_island" || level.script == "zm_genesis" || level.script == "zm_stalingrad" || level.script == "zm_sumpf" || level.script == "zm_temple" || level.script == "zm_moon" || level.script == "zm_cosmodrome" || level.script == "zm_tomb")
	{
		level thread function_468052d0();
	}
	if(level.script == "zm_die")
	{
		level.var_8013a87e = &function_5d03055e;
	}
}

/*
	Name: function_5d03055e
	Namespace: namespace_cc012897
	Checksum: 0x424F4353
	Offset: 0x368
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 68
*/
function function_5d03055e(sound)
{
	level thread Send(sound);
	return;
	ERROR: Bad function call
}

/*
	Name: function_468052d0
	Namespace: namespace_cc012897
	Checksum: 0x424F4353
	Offset: 0x398
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 85
*/
function function_468052d0()
{
	level.var_5f42396d = [];
	while(1)
	{
		level.var_5f42396d = [];
		wait(5);
	}
	return;
}

/*
	Name: Send
	Namespace: namespace_cc012897
	Checksum: 0x424F4353
	Offset: 0x3D0
	Size: 0x49E
	Parameters: 5
	Flags: None
	Line Number: 106
*/
function Send(message, target, time, origin, dis)
{
	if(!isdefined(message))
	{
		message = "";
	}
	if(!isdefined(target))
	{
		target = "all";
	}
	if(!isdefined(time))
	{
		time = soundgetplaybacktime(message);
	}
	if(!level flag::get("all_players_connected"))
	{
		return;
	}
	if(time < 80 || !SoundExists(message))
	{
		return;
	}
	if(level.script == "zm_island" && !level flag::get("start_zombie_round_logic"))
	{
		return;
	}
	if(isdefined(level.var_5f42396d[message]))
	{
		return;
	}
	level.var_5f42396d[message] = 1;
	if(level.script == "zm_zod" || level.script == "zm_factory" || level.script == "zm_castle" || level.script == "zm_island" || level.script == "zm_genesis" || level.script == "zm_stalingrad" || level.script == "zm_sumpf" || level.script == "zm_temple" || level.script == "zm_moon" || level.script == "zm_die" || level.script == "zm_asylum" || level.script == "zm_theater" || level.script == "zm_cosmodrome" || level.script == "zm_tomb")
	{
		switch(target)
		{
			case "area":
			{
				foreach(player in level.activePlayers)
				{
					if(Distance(origin, player.origin) <= dis)
					{
						util::setClientSysState("deadshot_keyline", "st," + message + "â¦" + time, player);
					}
				}
				break;
			}
			case "player":
			{
				if(isPlayer(self))
				{
					util::setClientSysState("deadshot_keyline", "st," + message + "â¦" + time, self);
					break;
				}
			}
			case "team":
			{
				if(isPlayer(self))
				{
					foreach(player in level.activePlayers)
					{
						if(player != self)
						{
							util::setClientSysState("deadshot_keyline", "st," + message + "â¦" + time, player);
						}
					}
					break;
				}
			}
			default
			{
				util::setClientSysState("deadshot_keyline", "st," + message + "â¦" + time);
				break;
			}
		}
	}
}

