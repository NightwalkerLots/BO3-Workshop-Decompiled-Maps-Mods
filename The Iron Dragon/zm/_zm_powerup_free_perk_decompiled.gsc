#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;

#namespace zm_powerup_free_perk;

/*
	Name: __init__sytem__
	Namespace: zm_powerup_free_perk
	Checksum: 0x9EECBB8D
	Offset: 0x350
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 31
*/
function autoexec __init__sytem__()
{
	system::register("zm_powerup_free_perk", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_powerup_free_perk
	Checksum: 0xF7C1FB00
	Offset: 0x390
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 46
*/
function __init__()
{
	zm_powerups::register_powerup("free_perk", &grab_free_perk);
	if(ToLower(GetDvarString("g_gametype")) != "zcleansed")
	{
		zm_powerups::add_zombie_powerup("free_perk", "zombie_pickup_perk_bottle", &"ZOMBIE_POWERUP_FREE_PERK", &zm_powerups::func_should_never_drop, 0, 0, 0);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: grab_free_perk
	Namespace: zm_powerup_free_perk
	Checksum: 0xCB3F3368
	Offset: 0x438
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 67
*/
function grab_free_perk(player)
{
	level thread free_perk_powerup(self);
}

/*
	Name: free_perk_powerup
	Namespace: zm_powerup_free_perk
	Checksum: 0x7E5E07B3
	Offset: 0x468
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 82
*/
function free_perk_powerup(item)
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(!players[i] laststand::player_is_in_laststand() && !players[i].sessionstate == "spectator")
		{
			player = players[i];
			if(isdefined(item.ghost_powerup))
			{
				player zm_stats::increment_client_stat("buried_ghost_perk_acquired", 0);
				player zm_stats::increment_player_stat("buried_ghost_perk_acquired");
				player notify("player_received_ghost_round_free_perk");
			}
			free_perk = player namespace_b8afaefc::give_random_perk();
		}
	}
}

/*
	Name: disable_perk_before_power
	Namespace: zm_powerup_free_perk
	Checksum: 0x821ACBD9
	Offset: 0x5A8
	Size: 0xE4
	Parameters: 1
	Flags: None
	Line Number: 111
*/
function disable_perk_before_power(perk)
{
	self endon("disconnect");
	if(isdefined(perk))
	{
		wait(0.1);
		if(!level flag::get("power_on"))
		{
			a_players = GetPlayers();
			if(isdefined(a_players) && a_players.size == 1 && perk == "specialty_quickrevive")
			{
				return;
			}
			self zm_perks::perk_pause(perk);
			level flag::wait_till("power_on");
			self zm_perks::perk_unpause(perk);
		}
	}
}

