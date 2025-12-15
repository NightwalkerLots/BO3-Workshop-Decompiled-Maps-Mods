#include scripts\shared\ai\zombie_utility;
#include scripts\shared\flag_shared;
#include scripts\zm\_zm_utility;

#namespace namespace_8bfbf971;

/*
	Name: init
	Namespace: namespace_8bfbf971
	Checksum: 0xA58D1661
	Offset: 0x138
	Size: 0x90
	Parameters: 0
	Flags: AutoExec
	Line Number: 16
*/
function autoexec init()
{
	wait(1);
	level flag::wait_till("initial_blackscreen_passed");
	SetDvar("scr_zm_use_code_enemy_selection", 0);
	level.closest_player_override = &function_30da3a1b;
	level.pathdist_type = 2;
	level thread update_closest_player();
	level.enemy_location_override_func = &enemy_location_override;
}

/*
	Name: enemy_location_override
	Namespace: namespace_8bfbf971
	Checksum: 0x928575BA
	Offset: 0x1D0
	Size: 0xF0
	Parameters: 2
	Flags: None
	Line Number: 37
*/
function enemy_location_override(ai_zombie, ai_enemy)
{
	AIProfile_BeginEntry("castle-enemy_location_override");
	if(isPlayer(ai_enemy) && (ai_enemy IsWallRunning() || !ai_enemy IsOnGround()))
	{
		if(!isdefined(ai_enemy.v_ground_pos))
		{
			ai_enemy thread function_fe6c0de6();
		}
		if(isdefined(ai_enemy.v_ground_pos))
		{
			AIProfile_EndEntry();
			return ai_enemy.v_ground_pos;
		}
	}
	AIProfile_EndEntry();
	return undefined;
}

/*
	Name: function_fe6c0de6
	Namespace: namespace_8bfbf971
	Checksum: 0xBF43D0A6
	Offset: 0x2C8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function function_fe6c0de6()
{
	self endon("death");
	while(self IsWallRunning() || !self IsOnGround())
	{
		var_19c24540 = GroundTrace(self.origin, self.origin + VectorScale((0, 0, -1), 10000), 0, undefined)["position"];
		self.v_ground_pos = GetClosestPointOnNavMesh(var_19c24540, 256);
		wait(0.5);
	}
	self.v_ground_pos = undefined;
}

/*
	Name: function_30da3a1b
	Namespace: namespace_8bfbf971
	Checksum: 0x11C89F4E
	Offset: 0x390
	Size: 0x4E0
	Parameters: 2
	Flags: Private
	Line Number: 88
*/
function private function_30da3a1b(origin, players)
{
	if(isdefined(self.zombie_poi))
	{
		return undefined;
	}
	done = 0;
	while(players.size && !done)
	{
		done = 1;
		for(i = 0; i < players.size; i++)
		{
			target = players[i];
			if(!zombie_utility::is_player_valid(target, 1, 1))
			{
				ArrayRemoveValue(players, target);
				done = 0;
				break;
			}
		}
	}
	if(players.size == 0)
	{
		return undefined;
	}
	designated_target = 0;
	foreach(player in players)
	{
		if(isdefined(player.b_is_designated_target) && player.b_is_designated_target)
		{
			designated_target = 1;
			break;
		}
	}
	if(!designated_target)
	{
		if(isdefined(self.attackable) && self.attackable.is_active)
		{
			return undefined;
		}
	}
	if(players.size == 1)
	{
		self.last_closest_player = players[0];
		return self.last_closest_player;
	}
	if(!isdefined(self.last_closest_player))
	{
		self.last_closest_player = players[0];
	}
	if(!isdefined(self.need_closest_player))
	{
		self.need_closest_player = 1;
	}
	if(isdefined(level.last_closest_time) && level.last_closest_time >= level.time)
	{
		return self.last_closest_player;
	}
	if(isdefined(self.need_closest_player) && self.need_closest_player)
	{
		level.last_closest_time = level.time;
		self.need_closest_player = 0;
		closest = players[0];
		closest_dist = undefined;
		if(isdefined(players[0].am_i_valid) && players[0].am_i_valid)
		{
			if(IsActor(self))
			{
				closest_dist = self zm_utility::approximate_path_dist(closest);
			}
			else
			{
				closest_dist = DistanceSquared(self.origin, closest.origin);
			}
		}
		if(!isdefined(closest_dist))
		{
			closest = undefined;
		}
		for(index = 1; index < players.size; index++)
		{
			dist = undefined;
			if(isdefined(players[index].am_i_valid) && players[index].am_i_valid)
			{
				if(IsActor(self))
				{
					dist = self zm_utility::approximate_path_dist(players[index]);
				}
				else
				{
					dist = DistanceSquared(self.origin, players[index].origin);
				}
			}
			if(isdefined(dist))
			{
				if(isdefined(closest_dist))
				{
					if(dist < closest_dist)
					{
						closest = players[index];
						closest_dist = dist;
						continue;
					}
				}
				closest = players[index];
				closest_dist = dist;
			}
		}
		self.last_closest_player = closest;
	}
	if(players.size > 1 && isdefined(closest))
	{
		if(IsActor(self))
		{
			self zm_utility::approximate_path_dist(closest);
		}
	}
	return self.last_closest_player;
}

/*
	Name: update_closest_player
	Namespace: namespace_8bfbf971
	Checksum: 0xD2E9F84E
	Offset: 0x878
	Size: 0x18C
	Parameters: 0
	Flags: Private
	Line Number: 218
*/
function private update_closest_player()
{
	level waittill("start_of_round");
	while(1)
	{
		reset_closest_player = 1;
		zombies = zombie_utility::get_round_enemy_array();
		foreach(zombie in zombies)
		{
			if(isdefined(zombie.need_closest_player) && zombie.need_closest_player)
			{
				reset_closest_player = 0;
				break;
			}
		}
		if(reset_closest_player)
		{
			foreach(zombie in zombies)
			{
				if(isdefined(zombie.need_closest_player))
				{
					zombie.need_closest_player = 1;
				}
			}
		}
		wait(0.05);
	}
}

