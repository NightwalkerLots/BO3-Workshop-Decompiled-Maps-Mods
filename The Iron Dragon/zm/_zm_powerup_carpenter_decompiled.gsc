#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;

#namespace zm_powerup_carpenter;

/*
	Name: __init__sytem__
	Namespace: zm_powerup_carpenter
	Checksum: 0xB41D4C45
	Offset: 0x2D8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 25
*/
function autoexec __init__sytem__()
{
	system::register("zm_powerup_carpenter", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_powerup_carpenter
	Checksum: 0xA5F6B241
	Offset: 0x318
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function __init__()
{
	zm_powerups::register_powerup("carpenter", &grab_carpenter);
	if(ToLower(GetDvarString("g_gametype")) != "zcleansed")
	{
		zm_powerups::add_zombie_powerup("carpenter", "p7_zm_power_up_carpenter", &"ZOMBIE_POWERUP_MAX_AMMO", &func_should_drop_carpenter, 0, 0, 0);
	}
	level.use_new_carpenter_func = &start_carpenter_new;
	return;
	ERROR: Bad function call
}

/*
	Name: grab_carpenter
	Namespace: zm_powerup_carpenter
	Checksum: 0x7AAA9A8F
	Offset: 0x3D8
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 62
*/
function grab_carpenter(player)
{
	if(zm_utility::is_Classic())
	{
		player thread zm_pers_upgrades::persistent_carpenter_ability_check();
	}
	if(isdefined(level.use_new_carpenter_func))
	{
		level thread [[level.use_new_carpenter_func]](self.origin);
		continue;
	}
	level thread start_carpenter(self.origin);
	player thread zm_powerups::powerup_vo("carpenter");
}

/*
	Name: start_carpenter
	Namespace: zm_powerup_carpenter
	Checksum: 0x7ACAB1C4
	Offset: 0x480
	Size: 0x328
	Parameters: 1
	Flags: None
	Line Number: 87
*/
function start_carpenter(origin)
{
	window_boards = struct::get_array("exterior_goal", "targetname");
	Total = level.exterior_goals.size;
	carp_ent = spawn("script_origin", (0, 0, 0));
	carp_ent PlayLoopSound("evt_carpenter");
	while(1)
	{
		windows = get_closest_window_repair(window_boards, origin);
		if(!isdefined(windows))
		{
			carp_ent StopLoopSound(1);
			carp_ent playsoundwithnotify("evt_carpenter_end", "sound_done");
			carp_ent waittill("sound_done");
			break;
			continue;
		}
		ArrayRemoveValue(window_boards, windows);
		while(1)
		{
			if(zm_utility::all_chunks_intact(windows, windows.barrier_chunks))
			{
				break;
			}
			chunk = zm_utility::get_random_destroyed_chunk(windows, windows.barrier_chunks);
			if(!isdefined(chunk))
			{
				break;
			}
			windows thread zm_blockers::replace_chunk(windows, chunk, undefined, zm_powerups::is_carpenter_boards_upgraded(), 1);
			if(isdefined(windows.clip))
			{
				windows.clip TriggerEnable(1);
				windows.clip disconnectpaths();
				continue;
			}
			zm_blockers::blocker_disconnect_paths(windows.neg_start, windows.neg_end);
			util::wait_network_frame();
			wait(0.05);
		}
		util::wait_network_frame();
	}
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::player_add_points("carpenter_powerup", 200);
	}
	carp_ent delete();
}

/*
	Name: get_closest_window_repair
	Namespace: zm_powerup_carpenter
	Checksum: 0x585E6DAE
	Offset: 0x7B0
	Size: 0x140
	Parameters: 2
	Flags: None
	Line Number: 147
*/
function get_closest_window_repair(windows, origin)
{
	current_window = undefined;
	shortest_distance = undefined;
	for(i = 0; i < windows.size; i++)
	{
		if(zm_utility::all_chunks_intact(windows, windows[i].barrier_chunks))
		{
			continue;
		}
		if(!isdefined(current_window))
		{
			current_window = windows[i];
			shortest_distance = DistanceSquared(current_window.origin, origin);
			continue;
		}
		if(DistanceSquared(windows[i].origin, origin) < shortest_distance)
		{
			current_window = windows[i];
			shortest_distance = DistanceSquared(windows[i].origin, origin);
		}
	}
	return current_window;
}

/*
	Name: start_carpenter_new
	Namespace: zm_powerup_carpenter
	Checksum: 0x63164B05
	Offset: 0x8F8
	Size: 0x4A0
	Parameters: 1
	Flags: None
	Line Number: 182
*/
function start_carpenter_new(origin)
{
	level.carpenter_powerup_active = 1;
	level notify("hash_d5fbb6f5");
	window_boards = struct::get_array("exterior_goal", "targetname");
	if(isdefined(level._additional_carpenter_nodes))
	{
		window_boards = ArrayCombine(window_boards, level._additional_carpenter_nodes, 0, 0);
	}
	carp_ent = spawn("script_origin", (0, 0, 0));
	carp_ent PlayLoopSound("evt_carpenter");
	boards_near_players = get_near_boards(window_boards);
	boards_far_from_players = get_far_boards(window_boards);
	level repair_far_boards(boards_far_from_players, zm_powerups::is_carpenter_boards_upgraded());
	for(i = 0; i < boards_near_players.size; i++)
	{
		window = boards_near_players[i];
		num_chunks_checked = 0;
		last_repaired_chunk = undefined;
		while(1)
		{
			if(zm_utility::all_chunks_intact(window, window.barrier_chunks))
			{
				break;
			}
			chunk = zm_utility::get_random_destroyed_chunk(window, window.barrier_chunks);
			if(!isdefined(chunk))
			{
				break;
			}
			window thread zm_blockers::replace_chunk(window, chunk, undefined, zm_powerups::is_carpenter_boards_upgraded(), 1);
			last_repaired_chunk = chunk;
			if(isdefined(window.clip))
			{
				window.clip TriggerEnable(1);
				window.clip disconnectpaths();
				continue;
			}
			zm_blockers::blocker_disconnect_paths(window.neg_start, window.neg_end);
			util::wait_network_frame();
			num_chunks_checked++;
			if(num_chunks_checked >= 20)
			{
				break;
			}
		}
		if(isdefined(window.zbarrier))
		{
			if(isdefined(last_repaired_chunk))
			{
				while(window.zbarrier GetZBarrierPieceState(last_repaired_chunk) == "closing")
				{
					wait(0.05);
				}
				if(isdefined(window._post_carpenter_callback))
				{
					window [[window._post_carpenter_callback]]();
					continue;
				}
			}
		}
		while(isdefined(last_repaired_chunk) && last_repaired_chunk.state == "mid_repair")
		{
			wait(0.05);
		}
	}
	carp_ent StopLoopSound(1);
	carp_ent playsoundwithnotify("evt_carpenter_end", "sound_done");
	carp_ent waittill("sound_done");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::player_add_points("carpenter_powerup", 200);
	}
	carp_ent delete();
	level notify("carpenter_finished");
	level.carpenter_powerup_active = undefined;
}

/*
	Name: get_near_boards
	Namespace: zm_powerup_carpenter
	Checksum: 0x7342E68A
	Offset: 0xDA0
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 271
*/
function get_near_boards(windows)
{
	players = GetPlayers();
	boards_near_players = [];
	for(j = 0; j < windows.size; j++)
	{
		close = 0;
		for(i = 0; i < players.size; i++)
		{
			origin = undefined;
			if(isdefined(windows[j].zbarrier))
			{
				origin = windows[j].zbarrier.origin;
				continue;
			}
			origin = windows[j].origin;
			if(DistanceSquared(players[i].origin, origin) <= 562500)
			{
				close = 1;
				break;
			}
		}
		if(close)
		{
			boards_near_players[boards_near_players.size] = windows[j];
		}
	}
	return boards_near_players;
}

/*
	Name: get_far_boards
	Namespace: zm_powerup_carpenter
	Checksum: 0x28C176A4
	Offset: 0xF10
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 311
*/
function get_far_boards(windows)
{
	players = GetPlayers();
	boards_far_from_players = [];
	for(j = 0; j < windows.size; j++)
	{
		close = 0;
		for(i = 0; i < players.size; i++)
		{
			origin = undefined;
			if(isdefined(windows[j].zbarrier))
			{
				origin = windows[j].zbarrier.origin;
				continue;
			}
			origin = windows[j].origin;
			if(DistanceSquared(players[i].origin, origin) >= 562500)
			{
				close = 1;
				break;
			}
		}
		if(close)
		{
			boards_far_from_players[boards_far_from_players.size] = windows[j];
		}
	}
	return boards_far_from_players;
}

/*
	Name: repair_far_boards
	Namespace: zm_powerup_carpenter
	Checksum: 0xF06A2412
	Offset: 0x1080
	Size: 0x2F0
	Parameters: 2
	Flags: None
	Line Number: 351
*/
function repair_far_boards(barriers, upgrade)
{
	for(i = 0; i < barriers.size; i++)
	{
		barrier = barriers[i];
		if(zm_utility::all_chunks_intact(barrier, barrier.barrier_chunks))
		{
			continue;
		}
		if(isdefined(barrier.zbarrier))
		{
			a_pieces = barrier.zbarrier GetZBarrierPieceIndicesInState("open");
			if(isdefined(a_pieces))
			{
				for(xx = 0; xx < a_pieces.size; xx++)
				{
					chunk = a_pieces[xx];
					if(upgrade)
					{
						barrier.zbarrier ZBarrierPieceUseUpgradedModel(chunk);
						barrier.zbarrier.chunk_health[chunk] = barrier.zbarrier GetUpgradedPieceNumLives(chunk);
						continue;
					}
					barrier.zbarrier ZBarrierPieceUseDefaultModel(chunk);
					barrier.zbarrier.chunk_health[chunk] = 0;
				}
			}
			for(x = 0; x < barrier.zbarrier getnumzbarrierpieces(); x++)
			{
				barrier.zbarrier SetZBarrierPieceState(x, "closed");
				barrier.zbarrier ShowZBarrierPiece(x);
			}
		}
		else if(isdefined(barrier.clip))
		{
			barrier.clip TriggerEnable(1);
			barrier.clip disconnectpaths();
			continue;
		}
		zm_blockers::blocker_disconnect_paths(barrier.neg_start, barrier.neg_end);
		if(i % 4 == 0)
		{
			util::wait_network_frame();
		}
	}
}

/*
	Name: func_should_drop_carpenter
	Namespace: zm_powerup_carpenter
	Checksum: 0x5A169879
	Offset: 0x1378
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 408
*/
function func_should_drop_carpenter()
{
	if(get_num_window_destroyed() < 5)
	{
		return 0;
	}
	return 1;
}

/*
	Name: get_num_window_destroyed
	Namespace: zm_powerup_carpenter
	Checksum: 0xEC356F24
	Offset: 0x13A8
	Size: 0x8C
	Parameters: 0
	Flags: None
	Line Number: 427
*/
function get_num_window_destroyed()
{
	num = 0;
	for(i = 0; i < level.exterior_goals.size; i++)
	{
		if(zm_utility::all_chunks_destroyed(level.exterior_goals[i], level.exterior_goals[i].barrier_chunks))
		{
			num = num + 1;
		}
	}
	return num;
}

