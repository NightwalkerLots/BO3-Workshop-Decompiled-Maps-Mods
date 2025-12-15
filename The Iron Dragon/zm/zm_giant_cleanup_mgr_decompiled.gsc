#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_zonemgr;

#namespace giant_cleanup;

/*
	Name: __init__sytem__
	Namespace: giant_cleanup
	Checksum: 0xD5F5E46F
	Offset: 0x1A8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("giant_cleanup", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: giant_cleanup
	Checksum: 0x948057F1
	Offset: 0x1F0
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	level.n_cleanups_processed_this_frame = 0;
}

/*
	Name: __main__
	Namespace: giant_cleanup
	Checksum: 0x481B3E33
	Offset: 0x208
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function __main__()
{
	level thread cleanup_main();
}

/*
	Name: force_check_now
	Namespace: giant_cleanup
	Checksum: 0xA3360E3B
	Offset: 0x230
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function force_check_now()
{
	level notify("pump_distance_check");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: cleanup_main
	Namespace: giant_cleanup
	Checksum: 0x4F1244E5
	Offset: 0x250
	Size: 0x248
	Parameters: 0
	Flags: Private
	Line Number: 83
*/
function private cleanup_main()
{
	n_next_eval = 0;
	while(1)
	{
		util::wait_network_frame();
		n_time = GetTime();
		if(n_time < n_next_eval)
		{
			continue;
		}
		if(isdefined(level.n_cleanup_manager_restart_time))
		{
			n_current_time = GetTime() / 1000;
			n_delta_time = n_current_time - level.n_cleanup_manager_restart_time;
			if(n_delta_time < 0)
			{
				continue;
			}
			level.n_cleanup_manager_restart_time = undefined;
		}
		n_round_time = n_time - level.round_start_time / 1000;
		if(level.round_number <= 5 && n_round_time < 30)
		{
			continue;
		}
		else if(level.round_number > 5 && n_round_time < 20)
		{
			continue;
		}
		n_override_cleanup_dist_sq = undefined;
		if(level.zombie_total == 0 && zombie_utility::get_current_zombie_count() < 3)
		{
			n_override_cleanup_dist_sq = 2250000;
		}
		n_next_eval = n_next_eval + 3000;
		a_ai_enemies = GetAITeamArray("axis");
		foreach(ai_enemy in a_ai_enemies)
		{
			if(level.n_cleanups_processed_this_frame >= 1)
			{
				level.n_cleanups_processed_this_frame = 0;
				util::wait_network_frame();
			}
			ai_enemy do_cleanup_check(n_override_cleanup_dist_sq);
		}
	}
}

/*
	Name: do_cleanup_check
	Namespace: giant_cleanup
	Checksum: 0xD1B12D9
	Offset: 0x4A0
	Size: 0x248
	Parameters: 1
	Flags: None
	Line Number: 142
*/
function do_cleanup_check(n_override_cleanup_dist)
{
	if(!isalive(self))
	{
		return;
	}
	if(self.b_ignore_cleanup === 1)
	{
		return;
	}
	n_time_alive = GetTime() - self.spawn_time;
	if(n_time_alive < 5000)
	{
		return;
	}
	if(n_time_alive < 45000 && self.script_string !== "find_flesh" && self.completed_emerging_into_playable_area !== 1)
	{
		return;
	}
	b_in_active_zone = self zm_zonemgr::entity_in_active_zone();
	level.n_cleanups_processed_this_frame++;
	if(!b_in_active_zone)
	{
		n_dist_sq_min = 10000000;
		e_closest_player = level.activePlayers[0];
		foreach(player in level.activePlayers)
		{
			n_dist_sq = DistanceSquared(self.origin, player.origin);
			if(n_dist_sq < n_dist_sq_min)
			{
				n_dist_sq_min = n_dist_sq;
				e_closest_player = player;
			}
		}
		if(isdefined(n_override_cleanup_dist))
		{
			n_cleanup_dist_sq = n_override_cleanup_dist;
		}
		else if(isdefined(e_closest_player) && player_ahead_of_me(e_closest_player))
		{
			n_cleanup_dist_sq = 189225;
			continue;
		}
		n_cleanup_dist_sq = 250000;
		if(n_dist_sq_min >= n_cleanup_dist_sq)
		{
			self thread delete_zombie_noone_looking();
		}
	}
}

/*
	Name: delete_zombie_noone_looking
	Namespace: giant_cleanup
	Checksum: 0xD5A86EC1
	Offset: 0x6F0
	Size: 0x248
	Parameters: 0
	Flags: Private
	Line Number: 203
*/
function private delete_zombie_noone_looking()
{
	if(isdefined(self.in_the_ground) && self.in_the_ground)
	{
		return;
	}
	foreach(player in level.players)
	{
		if(player.sessionstate == "spectator")
		{
			continue;
		}
		if(self player_can_see_me(player))
		{
			return;
		}
	}
	if(!(isdefined(self.exclude_cleanup_adding_to_total) && self.exclude_cleanup_adding_to_total))
	{
		level.zombie_total++;
		level.zombie_respawns++;
		if(self.health < self.maxhealth)
		{
			if(!isdefined(level.a_zombie_respawn_health[self.archetype]))
			{
				level.a_zombie_respawn_health[self.archetype] = [];
			}
			if(!isdefined(level.a_zombie_respawn_health[self.archetype]))
			{
				level.a_zombie_respawn_health[self.archetype] = [];
			}
			else if(!IsArray(level.a_zombie_respawn_health[self.archetype]))
			{
				level.a_zombie_respawn_health[self.archetype] = Array(level.a_zombie_respawn_health[self.archetype]);
			}
			level.a_zombie_respawn_health[self.archetype][level.a_zombie_respawn_health[self.archetype].size] = self.health;
		}
	}
	self zombie_utility::reset_attack_spot();
	self kill();
	wait(0.05);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: player_can_see_me
	Namespace: giant_cleanup
	Checksum: 0xA90DB6AB
	Offset: 0x940
	Size: 0xD8
	Parameters: 1
	Flags: Private
	Line Number: 260
*/
function private player_can_see_me(player)
{
	v_player_angles = player getPlayerAngles();
	v_player_forward = AnglesToForward(v_player_angles);
	v_player_to_self = self.origin - player GetOrigin();
	v_player_to_self = VectorNormalize(v_player_to_self);
	n_dot = VectorDot(v_player_forward, v_player_to_self);
	if(n_dot < 0.766)
	{
		return 0;
	}
	return 1;
}

/*
	Name: player_ahead_of_me
	Namespace: giant_cleanup
	Checksum: 0x423BD40E
	Offset: 0xA20
	Size: 0xB8
	Parameters: 1
	Flags: Private
	Line Number: 284
*/
function private player_ahead_of_me(player)
{
	v_player_angles = player getPlayerAngles();
	v_player_forward = AnglesToForward(v_player_angles);
	v_dir = player GetOrigin() - self.origin;
	n_dot = VectorDot(v_player_forward, v_dir);
	if(n_dot < 0)
	{
		return 0;
	}
	return 1;
}

/*
	Name: get_escape_position
	Namespace: giant_cleanup
	Checksum: 0x95FA034D
	Offset: 0xAE0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 307
*/
function get_escape_position()
{
	self endon("death");
	str_zone = self.zone_name;
	if(!isdefined(str_zone))
	{
		str_zone = self.zone_name;
	}
	if(isdefined(str_zone))
	{
		a_zones = get_adjacencies_to_zone(str_zone);
		a_wait_locations = get_wait_locations_in_zones(a_zones);
		s_farthest = self get_farthest_wait_location(a_wait_locations);
	}
	return s_farthest;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_adjacencies_to_zone
	Namespace: giant_cleanup
	Checksum: 0xECA2B508
	Offset: 0xBA0
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 335
*/
function get_adjacencies_to_zone(str_zone)
{
	a_adjacencies = [];
	a_adjacencies[0] = str_zone;
	a_adjacent_zones = getArrayKeys(level.zones[str_zone].adjacent_zones);
	for(i = 0; i < a_adjacent_zones.size; i++)
	{
		if(level.zones[str_zone].adjacent_zones[a_adjacent_zones[i]].is_connected)
		{
			if(!isdefined(a_adjacencies))
			{
				a_adjacencies = [];
			}
			else if(!IsArray(a_adjacencies))
			{
				a_adjacencies = Array(a_adjacencies);
			}
			a_adjacencies[a_adjacencies.size] = a_adjacent_zones[i];
		}
	}
	return a_adjacencies;
}

/*
	Name: get_wait_locations_in_zones
	Namespace: giant_cleanup
	Checksum: 0x49A66FDD
	Offset: 0xCC8
	Size: 0xD8
	Parameters: 1
	Flags: Private
	Line Number: 368
*/
function private get_wait_locations_in_zones(a_zones)
{
	a_wait_locations = [];
	foreach(zone in a_zones)
	{
		a_wait_locations = ArrayCombine(a_wait_locations, level.zones[zone].a_loc_types["dog_location"], 0, 0);
	}
	return a_wait_locations;
}

/*
	Name: get_farthest_wait_location
	Namespace: giant_cleanup
	Checksum: 0xC740B8FB
	Offset: 0xDA8
	Size: 0xD8
	Parameters: 1
	Flags: Private
	Line Number: 388
*/
function private get_farthest_wait_location(a_wait_locations)
{
	if(!isdefined(a_wait_locations) || a_wait_locations.size == 0)
	{
		return undefined;
	}
	n_farthest_index = 0;
	n_distance_farthest = 0;
	for(i = 0; i < a_wait_locations.size; i++)
	{
		n_distance_sq = DistanceSquared(self.origin, a_wait_locations[i].origin);
		if(n_distance_sq > n_distance_farthest)
		{
			n_distance_farthest = n_distance_sq;
			n_farthest_index = i;
		}
	}
	return a_wait_locations[n_farthest_index];
}

/*
	Name: get_wait_locations_in_zone
	Namespace: giant_cleanup
	Checksum: 0x6509E4C
	Offset: 0xE88
	Size: 0x88
	Parameters: 1
	Flags: Private
	Line Number: 418
*/
function private get_wait_locations_in_zone(zone)
{
	if(isdefined(level.zones[zone].a_loc_types["dog_location"]))
	{
		a_wait_locations = [];
		a_wait_locations = ArrayCombine(a_wait_locations, level.zones[zone].a_loc_types["dog_location"], 0, 0);
		return a_wait_locations;
	}
	return undefined;
}

/*
	Name: get_escape_position_in_current_zone
	Namespace: giant_cleanup
	Checksum: 0xED46A0CA
	Offset: 0xF18
	Size: 0x9C
	Parameters: 0
	Flags: None
	Line Number: 439
*/
function get_escape_position_in_current_zone()
{
	self endon("death");
	str_zone = self.zone_name;
	if(!isdefined(str_zone))
	{
		str_zone = self.zone_name;
	}
	if(isdefined(str_zone))
	{
		a_wait_locations = get_wait_locations_in_zone(str_zone);
		if(isdefined(a_wait_locations))
		{
			s_farthest = self get_farthest_wait_location(a_wait_locations);
		}
	}
	return s_farthest;
}

