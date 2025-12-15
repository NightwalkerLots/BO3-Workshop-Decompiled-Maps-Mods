#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;

#namespace namespace_d87f1aa7;

/*
	Name: init
	Namespace: namespace_d87f1aa7
	Checksum: 0x424F4353
	Offset: 0x128
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 15
*/
function autoexec init()
{
	level.var_e2177d62 = &function_908a81cd;
	level.var_71ef45f3 = &namespace_22b67853::function_71ef45f3;
}

/*
	Name: function_908a81cd
	Namespace: namespace_d87f1aa7
	Checksum: 0x424F4353
	Offset: 0x168
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 31
*/
function function_908a81cd(dvar)
{
	if(isdefined(self))
	{
		if(self == level)
		{
			level util::setClientSysState("deadshot_keyline", "dvar," + dvar);
		}
		else
		{
			util::setClientSysState("deadshot_keyline", "dvar," + dvar, self);
		}
	}
}

#namespace namespace_22b67853;

/*
	Name: function_71ef45f3
	Namespace: namespace_22b67853
	Checksum: 0x424F4353
	Offset: 0x1E0
	Size: 0x68
	Parameters: 4
	Flags: None
	Line Number: 58
*/
function function_71ef45f3(event, player, victim, weapon)
{
	if(!level flag::get("initial_blackscreen_passed"))
	{
		return 1;
	}
	return function_f105c5b1(event, player);
}

/*
	Name: function_f105c5b1
	Namespace: namespace_22b67853
	Checksum: 0x424F4353
	Offset: 0x250
	Size: 0x1E8
	Parameters: 3
	Flags: None
	Line Number: 77
*/
function function_f105c5b1(event, player, score)
{
	if(!isdefined(player))
	{
		player = level;
	}
	if(GetDvarInt("tfoption_se") == 0)
	{
		return 1;
	}
	if(!isdefined(level.var_a41b3d62))
	{
		level.var_a41b3d62 = [];
	}
	if(isdefined(level.var_a41b3d62[event]))
	{
		if(isdefined(score))
		{
			player LUINotifyEvent(&"aae_score_event", 2, level.var_a41b3d62[event], Int(score));
		}
		else
		{
			player LUINotifyEvent(&"aae_score_event", 1, level.var_a41b3d62[event]);
		}
	}
	else
	{
		level.var_a41b3d62[event] = TableLookupRowNum("gamedata/tables/common/aae_scoreevents.csv", 0, ToLower(event));
		if(!isdefined(level.var_a41b3d62[event]) || level.var_a41b3d62[event] == "")
		{
			return 0;
		}
		if(isdefined(score))
		{
			player LUINotifyEvent(&"aae_score_event", 2, level.var_a41b3d62[event], Int(score));
		}
		else
		{
			player LUINotifyEvent(&"aae_score_event", 1, level.var_a41b3d62[event]);
		}
	}
	return 1;
}

