#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\vk_script\_zm_vk_general;
#include scripts\zm\_zm_daily_challenges;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;

#namespace zm_powerup_nuke;

/*
	Name: __init__sytem__
	Namespace: zm_powerup_nuke
	Checksum: 0x481D09B4
	Offset: 0x300
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 28
*/
function autoexec __init__sytem__()
{
	system::register("zm_powerup_nuke", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: zm_powerup_nuke
	Checksum: 0x5F71123A
	Offset: 0x340
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function __init__()
{
	zm_powerups::register_powerup("nuke", &grab_nuke);
	clientfield::register("actor", "zm_nuked", 1000, 1, "counter");
	clientfield::register("vehicle", "zm_nuked", 1000, 1, "counter");
	zm_powerups::add_zombie_powerup("nuke", "p7_zm_power_up_nuke", &"ZOMBIE_POWERUP_NUKE", &zm_powerups::func_should_always_drop, 0, 0, 0, "zombie/fx_powerup_nuke_zmb");
}

/*
	Name: grab_nuke
	Namespace: zm_powerup_nuke
	Checksum: 0x94C056B0
	Offset: 0x420
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 63
*/
function grab_nuke(player)
{
	level thread nuke_powerup(self, player.team);
	player thread zm_powerups::powerup_vo("nuke");
	zombies = GetAITeamArray(level.zombie_team);
	player.zombie_nuked = ArraySort(zombies, self.origin);
	player notify("nuke_triggered");
}

/*
	Name: nuke_powerup
	Namespace: zm_powerup_nuke
	Checksum: 0xA6225170
	Offset: 0x4D0
	Size: 0x4A8
	Parameters: 2
	Flags: None
	Line Number: 82
*/
function nuke_powerup(drop_item, player_team)
{
	level thread nuke_delay_spawning(3);
	location = drop_item.origin;
	if(isdefined(drop_item.FX))
	{
		level thread namespace_f56b53f0::function_de45d812(drop_item.FX, location, 10);
	}
	level thread nuke_flash(player_team);
	wait(0.5);
	zombies = GetAITeamArray(level.zombie_team);
	zombies = ArraySort(zombies, location);
	zombies_nuked = [];
	for(i = 0; i < zombies.size; i++)
	{
		if(isdefined(zombies[i].ignore_nuke) && zombies[i].ignore_nuke)
		{
			continue;
		}
		if(isdefined(zombies[i].marked_for_death) && zombies[i].marked_for_death)
		{
			continue;
		}
		if(isdefined(zombies[i].nuke_damage_func))
		{
			zombies[i] thread [[zombies[i].nuke_damage_func]]();
			continue;
		}
		if(zm_utility::is_magic_bullet_shield_enabled(zombies[i]))
		{
			continue;
		}
		zombies[i].marked_for_death = 1;
		if(!(isdefined(zombies[i].nuked) && zombies[i].nuked) && !zm_utility::is_magic_bullet_shield_enabled(zombies[i]))
		{
			zombies[i].nuked = 1;
			zombies_nuked[zombies_nuked.size] = zombies[i];
			zombies[i] clientfield::increment("zm_nuked");
		}
	}
	for(i = 0; i < zombies_nuked.size; i++)
	{
		wait(RandomFloatRange(0.1, 0.7));
		if(!isdefined(zombies_nuked[i]))
		{
			continue;
		}
		if(zm_utility::is_magic_bullet_shield_enabled(zombies_nuked[i]))
		{
			continue;
		}
		if(!(isdefined(zombies_nuked[i].isdog) && zombies_nuked[i].isdog))
		{
			if(!(isdefined(zombies_nuked[i].no_gib) && zombies_nuked[i].no_gib))
			{
				zombies_nuked[i] zombie_utility::zombie_head_gib();
			}
			zombies_nuked[i] playsound("evt_nuked");
		}
		zombies_nuked[i] DoDamage(zombies_nuked[i].health + 666, zombies_nuked[i].origin);
		level thread zm_daily_challenges::increment_nuked_zombie();
	}
	level notify("nuke_complete");
	players = GetPlayers(player_team);
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::player_add_points("nuke_powerup", 400);
	}
}

/*
	Name: nuke_flash
	Namespace: zm_powerup_nuke
	Checksum: 0x93C94487
	Offset: 0x980
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 162
*/
function nuke_flash(team)
{
	if(isdefined(team))
	{
		GetPlayers()[0] playsoundtoteam("evt_nuke_flash", team);
		continue;
	}
	GetPlayers()[0] playsound("evt_nuke_flash");
	level thread namespace_f56b53f0::function_44c594d1();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: nuke_delay_spawning
	Namespace: zm_powerup_nuke
	Checksum: 0xD2E71E03
	Offset: 0xA18
	Size: 0xC4
	Parameters: 1
	Flags: None
	Line Number: 185
*/
function nuke_delay_spawning(n_spawn_delay)
{
	level endon("disable_nuke_delay_spawning");
	if(isdefined(level.disable_nuke_delay_spawning) && level.disable_nuke_delay_spawning)
	{
		return;
	}
	b_spawn_zombies_before_nuke = level flag::get("spawn_zombies");
	level flag::clear("spawn_zombies");
	level waittill("nuke_complete");
	if(isdefined(level.disable_nuke_delay_spawning) && level.disable_nuke_delay_spawning)
	{
		return;
	}
	wait(n_spawn_delay);
	if(b_spawn_zombies_before_nuke)
	{
		level flag::set("spawn_zombies");
	}
}

