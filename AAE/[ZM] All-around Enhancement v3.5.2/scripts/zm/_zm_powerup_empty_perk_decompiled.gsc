#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;

#namespace namespace_ac1a876c;

/*
	Name: __init__sytem__
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x320
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 31
*/
function autoexec __init__sytem__()
{
	system::register("zm_powerup_empty_perk", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x360
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 46
*/
function __init__()
{
	zm_powerups::register_powerup("empty_perk", &function_59e7b1f8);
	if(ToLower(GetDvarString("g_gametype")) != "zcleansed")
	{
		zm_powerups::add_zombie_powerup("empty_perk", "zombie_pickup_perk_bottle", &"", &function_a4aae90a, 1, 1, 0);
		zm_powerups::powerup_set_statless_powerup("empty_perk");
		level thread function_1f8ab5ec();
	}
}

/*
	Name: function_1f8ab5ec
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x440
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 67
*/
function function_1f8ab5ec()
{
	level flag::wait_till("start_zombie_round_logic");
	level.zombie_powerups["empty_perk"].func_should_drop_with_regular_powerups = &function_a4aae90a;
}

/*
	Name: function_a4aae90a
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x498
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 83
*/
function function_a4aae90a()
{
	if(GetDvarInt("aaeoption_perkslot"))
	{
		if(level.perk_purchase_limit >= level._custom_perks.size)
		{
			return 0;
		}
		num = 0;
		foreach(player in level.activePlayers)
		{
			if(isdefined(player.player_perk_purchase_limit))
			{
				if(player.player_perk_purchase_limit >= level._custom_perks.size)
				{
					num++;
				}
			}
		}
		if(num >= level.activePlayers.size)
		{
			return 0;
		}
		return 1;
	}
	return 0;
}

/*
	Name: function_59e7b1f8
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x5B8
	Size: 0x178
	Parameters: 1
	Flags: None
	Line Number: 121
*/
function function_59e7b1f8(player)
{
	if(!isdefined(level.get_player_perk_purchase_limit) || (isdefined(level.get_player_perk_purchase_limit) && level.get_player_perk_purchase_limit != &function_ee091724))
	{
		if(!isdefined(level.var_9ab87b78) && isdefined(level.get_player_perk_purchase_limit) && level.get_player_perk_purchase_limit != &function_ee091724)
		{
			level.var_9ab87b78 = level.get_player_perk_purchase_limit;
		}
		level.get_player_perk_purchase_limit = &function_ee091724;
	}
	if(GetDvarInt("aaeoption_perkslot") == 2)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(players[i].player_perk_purchase_limit))
			{
				players[i].player_perk_purchase_limit++;
			}
		}
		level.perk_purchase_limit++;
	}
	else if(!isdefined(player.player_perk_purchase_limit))
	{
		player.player_perk_purchase_limit = level.perk_purchase_limit;
	}
	player.player_perk_purchase_limit++;
}

/*
	Name: function_ba8751f2
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x738
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 160
*/
function function_ba8751f2()
{
	level.var_1eddc9ee = 50;
	if(!isdefined(self.player_perk_purchase_limit))
	{
		self.player_perk_purchase_limit = level.perk_purchase_limit;
	}
	if(self.player_perk_purchase_limit < level.var_1eddc9ee)
	{
		self.player_perk_purchase_limit++;
	}
}

/*
	Name: function_ee091724
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x788
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 183
*/
function function_ee091724()
{
	var_83318f89 = level.perk_purchase_limit;
	if(isdefined(level.var_9ab87b78))
	{
		var_83318f89 = self [[level.var_9ab87b78]]();
	}
	if(isdefined(self.player_perk_purchase_limit))
	{
		return Int(max(self.player_perk_purchase_limit, var_83318f89));
	}
	return var_83318f89;
}

/*
	Name: function_ac499d74
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x808
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 207
*/
function function_ac499d74()
{
}

/*
	Name: function_5d69c3e
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x818
	Size: 0xC
	Parameters: 1
	Flags: None
	Line Number: 221
*/
function function_5d69c3e(cmd)
{
}

