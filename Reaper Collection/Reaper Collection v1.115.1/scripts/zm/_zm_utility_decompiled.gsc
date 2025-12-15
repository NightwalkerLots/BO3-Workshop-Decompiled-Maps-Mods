#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_message_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_faller;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_server_throttle;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_weapons;

#namespace zm_utility;

/*
	Name: init_utility
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x990
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function init_utility()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: is_Classic
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9A0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function is_Classic()
{
	return 1;
}

/*
	Name: is_Standard
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9B0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 67
*/
function is_Standard()
{
	dvar = GetDvarString("ui_gametype");
	if(dvar == "zstandard")
	{
		return 1;
	}
	return 0;
}

/*
	Name: ConvertSecondsToMilliseconds
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9F8
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 87
*/
function ConvertSecondsToMilliseconds(seconds)
{
	return seconds * 1000;
	++;
}

/*
	Name: is_player
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA18
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 103
*/
function is_player()
{
	return isPlayer(self) || (isdefined(self.pers) && (isdefined(self.pers["isBot"]) && self.pers["isBot"]));
	ERROR: Exception occured: Stack empty.
}

/*
	Name: lerp
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA78
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 119
*/
function lerp(chunk)
{
	link = spawn("script_origin", self GetOrigin());
	link.angles = self.first_node.angles;
	self LinkTo(link);
	link RotateTo(self.first_node.angles, level._CONTEXTUAL_GRAB_LERP_TIME);
	link moveto(self.attacking_spot, level._CONTEXTUAL_GRAB_LERP_TIME);
	link util::waittill_multiple("rotatedone", "movedone");
	self Unlink();
	link delete();
	return;
}

/*
	Name: recalc_zombie_array
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBB0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 142
*/
function recalc_zombie_array()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: init_zombie_run_cycle
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBC0
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 158
*/
function init_zombie_run_cycle()
{
	if(isdefined(level.speed_change_round))
	{
		if(level.round_number >= level.speed_change_round)
		{
			speed_percent = 0.2 + level.round_number - level.speed_change_round * 0.2;
			speed_percent = min(speed_percent, 1);
			change_round_max = Int(level.speed_change_max * speed_percent);
			change_left = change_round_max - level.speed_change_num;
			if(change_left == 0)
			{
				self zombie_utility::set_zombie_run_cycle();
				return;
			}
			change_speed = RandomInt(100);
			if(change_speed > 80)
			{
				self change_zombie_run_cycle();
				return;
			}
			zombie_count = zombie_utility::get_current_zombie_count();
			zombie_left = level.zombie_ai_limit - zombie_count;
			if(zombie_left == change_left)
			{
				self change_zombie_run_cycle();
				return;
			}
		}
	}
	self zombie_utility::set_zombie_run_cycle();
}

/*
	Name: change_zombie_run_cycle
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xD68
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 201
*/
function change_zombie_run_cycle()
{
	level.speed_change_num++;
	if(level.gamedifficulty == 0)
	{
		self zombie_utility::set_zombie_run_cycle("sprint");
	}
	else
	{
		self zombie_utility::set_zombie_run_cycle("walk");
	}
	self thread speed_change_watcher();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: make_supersprinter
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xDE0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 227
*/
function make_supersprinter()
{
	self zombie_utility::set_zombie_run_cycle("super_sprint");
	return;
	ERROR: Bad function call
}

/*
	Name: speed_change_watcher
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE10
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 244
*/
function speed_change_watcher()
{
	self waittill("death");
	if(level.speed_change_num > 0)
	{
		level.speed_change_num--;
	}
}

/*
	Name: move_zombie_spawn_location
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE40
	Size: 0x540
	Parameters: 1
	Flags: None
	Line Number: 263
*/
function move_zombie_spawn_location(spot)
{
	self endon("death");
	if(isdefined(self.spawn_pos))
	{
		self notify("risen", self.spawn_pos.script_string);
		return;
	}
	self.spawn_pos = spot;
	if(isdefined(spot.target))
	{
		self.target = spot.target;
	}
	if(isdefined(spot.zone_name))
	{
		self.zone_name = spot.zone_name;
		self.previous_zone_name = spot.zone_name;
	}
	if(isdefined(spot.script_parameters))
	{
		self.script_parameters = spot.script_parameters;
	}
	if(!isdefined(spot.script_noteworthy))
	{
		spot.script_noteworthy = "spawn_location";
	}
	tokens = StrTok(spot.script_noteworthy, " ");
	foreach(token in tokens)
	{
		if(isdefined(self.spawn_point_override))
		{
			spot = self.spawn_point_override;
			token = spot.script_noteworthy;
		}
		if(token == "custom_spawner_entry")
		{
			next_token = index + 1;
			if(isdefined(tokens[next_token]))
			{
				str_spawn_entry = tokens[next_token];
				if(isdefined(level.custom_spawner_entry) && isdefined(level.custom_spawner_entry[str_spawn_entry]))
				{
					self thread [[level.custom_spawner_entry[str_spawn_entry]]](spot);
					continue;
				}
			}
		}
		if(token == "riser_location")
		{
			self thread zm_spawner::do_zombie_rise(spot);
			continue;
		}
		if(token == "faller_location")
		{
			self thread zm_ai_faller::do_zombie_fall(spot);
			continue;
		}
		if(token == "spawn_location")
		{
			if(isdefined(self.anchor))
			{
				return;
			}
			self.anchor = spawn("script_origin", self.origin);
			self.anchor.angles = self.angles;
			self LinkTo(self.anchor);
			self.anchor thread anchor_delete_failsafe(self);
			if(!isdefined(spot.angles))
			{
				spot.angles = (0, 0, 0);
			}
			self ghost();
			self.anchor moveto(spot.origin, 0.05);
			self.anchor waittill("movedone");
			target_org = zombie_utility::get_desired_origin();
			if(isdefined(target_org))
			{
				anim_ang = VectorToAngles(target_org - self.origin);
				self.anchor RotateTo((0, anim_ang[1], 0), 0.05);
				self.anchor waittill("rotatedone");
			}
			if(isdefined(level.zombie_spawn_fx))
			{
				playFX(level.zombie_spawn_fx, spot.origin);
			}
			self Unlink();
			if(isdefined(self.anchor))
			{
				self.anchor delete();
			}
			if(!(isdefined(self.dontShow) && self.dontShow))
			{
				self show();
			}
			self notify("risen", spot.script_string);
		}
	}
}

/*
	Name: anchor_delete_failsafe
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1388
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 372
*/
function anchor_delete_failsafe(ai_zombie)
{
	ai_zombie endon("risen");
	ai_zombie waittill("death");
	if(isdefined(self))
	{
		self delete();
		return;
	}
	ERROR: Bad function call
}

/*
	Name: run_spawn_functions
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x13D8
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 394
*/
function run_spawn_functions()
{
	self endon("death");
	waittillframeend;
	for(i = 0; i < level.spawn_funcs[self.team].size; i++)
	{
		func = level.spawn_funcs[self.team][i];
		util::single_thread(self, func["function"], func["param1"], func["param2"], func["param3"], func["param4"], func["param5"]);
	}
	if(isdefined(self.spawn_funcs))
	{
		for(i = 0; i < self.spawn_funcs.size; i++)
		{
			func = self.spawn_funcs[i];
			util::single_thread(self, func["function"], func["param1"], func["param2"], func["param3"], func["param4"]);
		}
		/#
			self.saved_spawn_functions = self.spawn_funcs;
		#/
		self.spawn_funcs = undefined;
		/#
			self.spawn_funcs = self.saved_spawn_functions;
			self.saved_spawn_functions = undefined;
		#/
		self.spawn_funcs = undefined;
	}
}

/*
	Name: create_simple_hud
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1588
	Size: 0xE0
	Parameters: 2
	Flags: None
	Line Number: 432
*/
function create_simple_hud(client, team)
{
	if(isdefined(team))
	{
		hud = NewTeamHudElem(team);
		hud.team = team;
	}
	else if(isdefined(client))
	{
		hud = newClientHudElem(client);
	}
	else
	{
		hud = NewHudElem();
	}
	level.hudelem_count++;
	hud.foreground = 1;
	hud.sort = 1;
	hud.hidewheninmenu = 0;
	return hud;
}

/*
	Name: destroy_hud
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1670
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 464
*/
function destroy_hud()
{
	level.hudelem_count--;
	self destroy();
}

/*
	Name: all_chunks_intact
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x16A0
	Size: 0xE8
	Parameters: 2
	Flags: None
	Line Number: 480
*/
function all_chunks_intact(barrier, barrier_chunks)
{
	if(isdefined(barrier.zbarrier))
	{
		pieces = barrier.zbarrier GetZBarrierPieceIndicesInState("closed");
		if(pieces.size != barrier.zbarrier getnumzbarrierpieces())
		{
			return 0;
		}
	}
	else
	{
		for(i = 0; i < barrier_chunks.size; i++)
		{
			if(barrier_chunks[i] get_chunk_state() != "repaired")
			{
				return 0;
			}
		}
	}
	return 1;
}

/*
	Name: no_valid_repairable_boards
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1790
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 513
*/
function no_valid_repairable_boards(barrier, barrier_chunks)
{
	if(isdefined(barrier.zbarrier))
	{
		pieces = barrier.zbarrier GetZBarrierPieceIndicesInState("open");
		if(pieces.size)
		{
			return 0;
		}
	}
	else
	{
		for(i = 0; i < barrier_chunks.size; i++)
		{
			if(barrier_chunks[i] get_chunk_state() == "destroyed")
			{
				return 0;
			}
		}
	}
	return 1;
}

/*
	Name: is_Survival
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1860
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 546
*/
function is_Survival()
{
	return 0;
}

/*
	Name: is_encounter
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1870
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 561
*/
function is_encounter()
{
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: all_chunks_destroyed
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1880
	Size: 0x150
	Parameters: 2
	Flags: None
	Line Number: 577
*/
function all_chunks_destroyed(barrier, barrier_chunks)
{
	if(isdefined(barrier.zbarrier))
	{
		pieces = ArrayCombine(barrier.zbarrier GetZBarrierPieceIndicesInState("open"), barrier.zbarrier GetZBarrierPieceIndicesInState("opening"), 1, 0);
		if(pieces.size != barrier.zbarrier getnumzbarrierpieces())
		{
			return 0;
		}
	}
	else if(isdefined(barrier_chunks))
	{
		/#
			fallback_initiated::Assert(isdefined(barrier_chunks), "Dev Block strings are not supported");
		#/
		for(i = 0; i < barrier_chunks.size; i++)
		{
			if(barrier_chunks[i] get_chunk_state() != "destroyed")
			{
				return 0;
			}
		}
	}
	return 1;
}

/*
	Name: check_point_in_playable_area
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x19D8
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 613
*/
function check_point_in_playable_area(origin)
{
	playable_area = GetEntArray("player_volume", "script_noteworthy");
	if(!isdefined(level.check_model))
	{
		level.check_model = spawn("script_model", origin + VectorScale((0, 0, 1), 40));
	}
	else
	{
		level.check_model.origin = origin + VectorScale((0, 0, 1), 40);
	}
	valid_point = 0;
	for(i = 0; i < playable_area.size; i++)
	{
		if(level.check_model istouching(playable_area[i]))
		{
			valid_point = 1;
		}
	}
	return valid_point;
}

/*
	Name: check_point_in_enabled_zone
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1AF0
	Size: 0x1E0
	Parameters: 3
	Flags: None
	Line Number: 645
*/
function check_point_in_enabled_zone(origin, zone_is_active, player_zones)
{
	if(!isdefined(player_zones))
	{
		player_zones = GetEntArray("player_volume", "script_noteworthy");
	}
	if(!isdefined(level.zones) || !isdefined(player_zones))
	{
		return 1;
	}
	if(!isdefined(level.e_check_point))
	{
		level.e_check_point = spawn("script_origin", origin + VectorScale((0, 0, 1), 40));
	}
	else
	{
		level.e_check_point.origin = origin + VectorScale((0, 0, 1), 40);
	}
	one_valid_zone = 0;
	for(i = 0; i < player_zones.size; i++)
	{
		if(level.e_check_point istouching(player_zones[i]))
		{
			zone = level.zones[player_zones[i].targetname];
			if(isdefined(zone) && (isdefined(zone.is_enabled) && zone.is_enabled))
			{
				if(isdefined(zone_is_active) && zone_is_active == 1 && (!(isdefined(zone.is_active) && zone.is_active)))
				{
					continue;
				}
				one_valid_zone = 1;
				break;
			}
		}
	}
	return one_valid_zone;
}

/*
	Name: round_up_to_ten
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1CD8
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 693
*/
function round_up_to_ten(score)
{
	new_score = score - score % 10;
	if(new_score < score)
	{
		new_score = new_score + 10;
	}
	return new_score;
}

/*
	Name: round_up_score
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1D30
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 713
*/
function round_up_score(score, value)
{
	score = Int(score);
	new_score = score - score % value;
	if(new_score < score)
	{
		new_score = new_score + value;
	}
	return new_score;
}

/*
	Name: halve_score
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1DA8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 734
*/
function halve_score(n_score)
{
	n_score = n_score / 2;
	n_score = round_up_score(n_score, 10);
	return n_score;
}

/*
	Name: random_tan
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1DF0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 751
*/
function random_tan()
{
	rand = RandomInt(100);
	if(isdefined(level.char_percent_override))
	{
		percentNotCharred = level.char_percent_override;
	}
	else
	{
		percentNotCharred = 65;
	}
}

/*
	Name: places_before_decimal
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1E50
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 774
*/
function places_before_decimal(num)
{
	abs_num = Abs(num);
	count = 0;
	while(1)
	{
		abs_num = abs_num * 0.1;
		count = count + 1;
		if(abs_num < 1)
		{
			return count;
		}
	}
}

/*
	Name: create_zombie_point_of_interest
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1EE0
	Size: 0x1E0
	Parameters: 7
	Flags: None
	Line Number: 799
*/
function create_zombie_point_of_interest(attract_dist, num_attractors, added_poi_value, start_turned_on, initial_attract_func, arrival_attract_func, poi_team)
{
	if(!isdefined(added_poi_value))
	{
		self.added_poi_value = 0;
	}
	else
	{
		self.added_poi_value = added_poi_value;
	}
	if(!isdefined(start_turned_on))
	{
		start_turned_on = 1;
	}
	if(!isdefined(attract_dist))
	{
		attract_dist = 1536;
	}
	self.script_noteworthy = "zombie_poi";
	self.poi_active = start_turned_on;
	if(isdefined(attract_dist))
	{
		self.max_attractor_dist = attract_dist;
		self.poi_radius = attract_dist * attract_dist;
	}
	else
	{
		self.poi_radius = undefined;
	}
	self.num_poi_attracts = num_attractors;
	self.attract_to_origin = 1;
	self.attractor_array = [];
	self.initial_attract_func = undefined;
	self.arrival_attract_func = undefined;
	if(isdefined(poi_team))
	{
		self._team = poi_team;
	}
	if(isdefined(initial_attract_func))
	{
		self.initial_attract_func = initial_attract_func;
	}
	if(isdefined(arrival_attract_func))
	{
		self.arrival_attract_func = arrival_attract_func;
	}
	if(!isdefined(level.zombie_poi_array))
	{
		level.zombie_poi_array = [];
	}
	else if(!IsArray(level.zombie_poi_array))
	{
		level.zombie_poi_array = Array(level.zombie_poi_array);
	}
	level.zombie_poi_array[level.zombie_poi_array.size] = self;
	self thread watch_for_poi_death();
}

/*
	Name: watch_for_poi_death
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x20C8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 867
*/
function watch_for_poi_death()
{
	self waittill("death");
	if(IsInArray(level.zombie_poi_array, self))
	{
		ArrayRemoveValue(level.zombie_poi_array, self);
	}
}

/*
	Name: debug_draw_new_attractor_positions
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x2120
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 886
*/
function debug_draw_new_attractor_positions()
{
	self endon("death");
	while(1)
	{
		foreach(attract in self.attractor_positions)
		{
			passed = BulletTracePassed(attract[0] + VectorScale((0, 0, 1), 24), self.origin + VectorScale((0, 0, 1), 24), 0, self);
			if(passed)
			{
				/#
					debugstar(attract[0], 6, (1, 1, 1));
					continue;
				#/
			}
			/#
				debugstar(attract[0], 6, (1, 0, 0));
			#/
		}
		wait(0.05);
	}
}

/*
	Name: create_zombie_point_of_interest_attractor_positions
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x2260
	Size: 0x2F0
	Parameters: 2
	Flags: None
	Line Number: 919
*/
function create_zombie_point_of_interest_attractor_positions()
{
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.FillBuffer(Int32 numBytes)
   at System.IO.BinaryReader.ReadInt32()
   at Cerberus.Logic.BlackOps3Script.LoadEndSwitch() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\BlackOps3Script.cs:line 24909
   at Cerberus.Logic.Decompiler.FindSwitchCase() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 377
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 218
}

/*
	Name: generated_radius_attract_positions
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x2558
	Size: 0x420
	Parameters: 4
	Flags: None
	Line Number: 939
*/
function generated_radius_attract_positions(FORWARD, offset, num_positions, attract_radius)
{
	self endon("death");
	epsilon = 1;
	failed = 0;
	degs_per_pos = 360 / num_positions;
	for(i = offset; i < 360 + offset; i = offset)
	{
		altforward = FORWARD * attract_radius;
		rotated_forward = (cos(i) * altforward[0] - sin(i) * altforward[1], sin(i) * altforward[0] + cos(i) * altforward[1], altforward[2]);
		if(isdefined(level.poi_positioning_func))
		{
			pos = [[level.poi_positioning_func]](self.origin, rotated_forward);
		}
		else if(isdefined(level.use_alternate_poi_positioning) && level.use_alternate_poi_positioning)
		{
			pos = zm_server_throttle::server_safe_ground_trace("poi_trace", 10, self.origin + rotated_forward + VectorScale((0, 0, 1), 10));
		}
		else
		{
			pos = zm_server_throttle::server_safe_ground_trace("poi_trace", 10, self.origin + rotated_forward + VectorScale((0, 0, 1), 100));
		}
		if(!isdefined(pos))
		{
			failed++;
		}
		else if(isdefined(level.use_alternate_poi_positioning) && level.use_alternate_poi_positioning)
		{
			if(isdefined(self) && isdefined(self.origin))
			{
				if(self.origin[2] >= pos[2] - epsilon && self.origin[2] - pos[2] <= 150)
				{
					pos_array = [];
					pos_array[0] = pos;
					pos_array[1] = self;
					if(!isdefined(self.attractor_positions))
					{
						self.attractor_positions = [];
					}
					else if(!IsArray(self.attractor_positions))
					{
						self.attractor_positions = Array(self.attractor_positions);
					}
					self.attractor_positions[self.attractor_positions.size] = pos_array;
				}
			}
			else
			{
				failed++;
			}
		}
		else if(Abs(pos[2] - self.origin[2]) < 60)
		{
			pos_array = [];
			pos_array[0] = pos;
			pos_array[1] = self;
			if(!isdefined(self.attractor_positions))
			{
				self.attractor_positions = [];
			}
			else if(!IsArray(self.attractor_positions))
			{
				self.attractor_positions = Array(self.attractor_positions);
			}
			self.attractor_positions[self.attractor_positions.size] = pos_array;
		}
		else
		{
			failed++;
		}
	}
	return failed;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: debug_draw_attractor_positions
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x2980
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1024
*/
function debug_draw_attractor_positions()
{
	/#
		while(1)
		{
			while(!isdefined(self.attractor_positions))
			{
				wait(0.05);
				continue;
			}
			for(i = 0; i < self.attractor_positions.size; i++)
			{
				line(self.origin, self.attractor_positions[i][0], (1, 0, 0), 1, 1);
			}
			wait(0.05);
			if(!isdefined(self))
			{
				return;
			}
		}
	#/
}

/*
	Name: debug_draw_claimed_attractor_positions
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x2A30
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1057
*/
function debug_draw_claimed_attractor_positions()
{
	/#
		while(1)
		{
			while(!isdefined(self.claimed_attractor_positions))
			{
				wait(0.05);
				continue;
			}
			for(i = 0; i < self.claimed_attractor_positions.size; i++)
			{
				line(self.origin, self.claimed_attractor_positions[i][0], (0, 1, 0), 1, 1);
			}
			wait(0.05);
			if(!isdefined(self))
			{
				return;
			}
		}
		return;
	#/
}

/*
	Name: get_zombie_point_of_interest
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x2AE0
	Size: 0x530
	Parameters: 2
	Flags: None
	Line Number: 1091
*/
function get_zombie_point_of_interest(origin, poi_array)
{
	AIProfile_BeginEntry("get_zombie_point_of_interest");
	if(isdefined(self.ignore_all_poi) && self.ignore_all_poi)
	{
		AIProfile_EndEntry();
		return undefined;
	}
	curr_radius = undefined;
	if(isdefined(poi_array))
	{
		ent_array = poi_array;
	}
	else
	{
		ent_array = level.zombie_poi_array;
	}
	best_poi = undefined;
	position = undefined;
	best_dist = 100000000;
	for(i = 0; i < ent_array.size; i++)
	{
		if(!isdefined(ent_array[i]) || !isdefined(ent_array[i].poi_active) || !ent_array[i].poi_active)
		{
			continue;
		}
		if(isdefined(self.ignore_poi_targetname) && self.ignore_poi_targetname.size > 0)
		{
			if(isdefined(ent_array[i].targetname))
			{
				Ignore = 0;
				for(j = 0; j < self.ignore_poi_targetname.size; j++)
				{
					if(ent_array[i].targetname == self.ignore_poi_targetname[j])
					{
						Ignore = 1;
						break;
					}
				}
				if(Ignore)
				{
					continue;
				}
			}
		}
		if(isdefined(self.ignore_poi) && self.ignore_poi.size > 0)
		{
			Ignore = 0;
			for(j = 0; j < self.ignore_poi.size; j++)
			{
				if(self.ignore_poi[j] == ent_array[i])
				{
					Ignore = 1;
					break;
				}
			}
			if(Ignore)
			{
				continue;
			}
		}
		dist = DistanceSquared(origin, ent_array[i].origin);
		dist = dist - ent_array[i].added_poi_value;
		if(isdefined(ent_array[i].poi_radius))
		{
			curr_radius = ent_array[i].poi_radius;
		}
		if(!isdefined(curr_radius) || dist < curr_radius && dist < best_dist && ent_array[i] can_attract(self))
		{
			best_poi = ent_array[i];
			best_dist = dist;
		}
	}
	if(isdefined(best_poi))
	{
		if(isdefined(best_poi._team))
		{
			if(isdefined(self._race_team) && self._race_team != best_poi._team)
			{
				AIProfile_EndEntry();
				return undefined;
			}
		}
		if(isdefined(best_poi._new_ground_trace) && best_poi._new_ground_trace)
		{
			position = [];
			position[0] = groundpos_ignore_water_new(best_poi.origin + VectorScale((0, 0, 1), 100));
			position[1] = self;
		}
		else if(isdefined(best_poi.attract_to_origin) && best_poi.attract_to_origin)
		{
			position = [];
			position[0] = GROUNDPOS(best_poi.origin + VectorScale((0, 0, 1), 100));
			position[1] = self;
		}
		else
		{
			position = self add_poi_attractor(best_poi);
		}
		if(isdefined(best_poi.initial_attract_func))
		{
			self thread [[best_poi.initial_attract_func]](best_poi);
		}
		if(isdefined(best_poi.arrival_attract_func))
		{
			self thread [[best_poi.arrival_attract_func]](best_poi);
		}
	}
	AIProfile_EndEntry();
	return position;
}

/*
	Name: activate_zombie_point_of_interest
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x3018
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1213
*/
function activate_zombie_point_of_interest()
{
	if(self.script_noteworthy != "zombie_poi")
	{
		return;
	}
	self.poi_active = 1;
}

/*
	Name: deactivate_zombie_point_of_interest
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x3048
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 1232
*/
function deactivate_zombie_point_of_interest(dont_remove)
{
	if(self.script_noteworthy != "zombie_poi")
	{
		return;
	}
	self.attractor_array = Array::remove_undefined(self.attractor_array);
	for(i = 0; i < self.attractor_array.size; i++)
	{
		self.attractor_array[i] notify("kill_poi");
	}
	self.attractor_array = [];
	self.claimed_attractor_positions = [];
	self.poi_active = 0;
	if(isdefined(dont_remove) && dont_remove)
	{
		return;
	}
	if(isdefined(self))
	{
		if(IsInArray(level.zombie_poi_array, self))
		{
			ArrayRemoveValue(level.zombie_poi_array, self);
		}
	}
}

/*
	Name: assign_zombie_point_of_interest
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x3158
	Size: 0x118
	Parameters: 2
	Flags: None
	Line Number: 1269
*/
function assign_zombie_point_of_interest(origin, POI)
{
	position = undefined;
	doremovalthread = 0;
	if(isdefined(POI) && POI can_attract(self))
	{
		if(!isdefined(POI.attractor_array) || (isdefined(POI.attractor_array) && !IsInArray(POI.attractor_array, self)))
		{
			doremovalthread = 1;
		}
		position = self add_poi_attractor(POI);
		if(isdefined(position) && doremovalthread && IsInArray(POI.attractor_array, self))
		{
			self thread update_on_poi_removal(POI);
		}
	}
	return position;
}

/*
	Name: remove_poi_attractor
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x3278
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 1298
*/
function remove_poi_attractor(zombie_poi)
{
	if(!isdefined(zombie_poi) || !isdefined(zombie_poi.attractor_array))
	{
		return;
	}
	for(i = 0; i < zombie_poi.attractor_array.size; i++)
	{
		if(zombie_poi.attractor_array[i] == self)
		{
			ArrayRemoveValue(zombie_poi.attractor_array, zombie_poi.attractor_array[i]);
			ArrayRemoveValue(zombie_poi.claimed_attractor_positions, zombie_poi.claimed_attractor_positions[i]);
			if(isdefined(self))
			{
				self notify("kill_poi");
			}
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: array_check_for_dupes_using_compare
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x3378
	Size: 0x70
	Parameters: 3
	Flags: None
	Line Number: 1330
*/
function array_check_for_dupes_using_compare(Array, single, is_equal_fn)
{
	for(i = 0; i < Array.size; i++)
	{
		if([[is_equal_fn]](Array[i], single))
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: poi_locations_equal
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x33F0
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 1352
*/
function poi_locations_equal(loc1, loc2)
{
	return loc1[0] == loc2[0];
}

/*
	Name: add_poi_attractor
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x3420
	Size: 0x550
	Parameters: 1
	Flags: None
	Line Number: 1367
*/
function add_poi_attractor(zombie_poi)
{
	if(!isdefined(zombie_poi))
	{
		return;
	}
	if(!isdefined(zombie_poi.attractor_array))
	{
		zombie_poi.attractor_array = [];
	}
	if(!IsInArray(zombie_poi.attractor_array, self))
	{
		if(!isdefined(zombie_poi.claimed_attractor_positions))
		{
			zombie_poi.claimed_attractor_positions = [];
		}
		if(!isdefined(zombie_poi.attractor_positions) || zombie_poi.attractor_positions.size <= 0)
		{
			return undefined;
		}
		start = -1;
		end = -1;
		last_index = -1;
		for(i = 0; i < 4; i++)
		{
			if(zombie_poi.claimed_attractor_positions.size < zombie_poi.last_index[i])
			{
				start = last_index + 1;
				end = zombie_poi.last_index[i];
				break;
			}
			last_index = zombie_poi.last_index[i];
		}
		best_dist = 100000000;
		best_pos = undefined;
		if(start < 0)
		{
			start = 0;
		}
		if(end < 0)
		{
			return undefined;
		}
		for(i = Int(start); i <= Int(end); i++)
		{
			if(!isdefined(zombie_poi.attractor_positions[i]))
			{
				continue;
			}
			if(array_check_for_dupes_using_compare(zombie_poi.claimed_attractor_positions, zombie_poi.attractor_positions[i], &poi_locations_equal))
			{
				if(isdefined(zombie_poi.attractor_positions[i][0]) && isdefined(self.origin))
				{
					dist = DistanceSquared(zombie_poi.attractor_positions[i][0], zombie_poi.origin);
					if(dist < best_dist || !isdefined(best_pos))
					{
						best_dist = dist;
						best_pos = zombie_poi.attractor_positions[i];
					}
				}
			}
		}
		if(!isdefined(best_pos))
		{
			if(isdefined(level.validate_poi_attractors) && level.validate_poi_attractors)
			{
				valid_pos = [];
				valid_pos[0] = zombie_poi.origin;
				valid_pos[1] = zombie_poi;
				return valid_pos;
			}
			return undefined;
		}
		if(!isdefined(zombie_poi.attractor_array))
		{
			zombie_poi.attractor_array = [];
		}
		else if(!IsArray(zombie_poi.attractor_array))
		{
			zombie_poi.attractor_array = Array(zombie_poi.attractor_array);
		}
		zombie_poi.attractor_array[zombie_poi.attractor_array.size] = self;
		self thread update_poi_on_death(zombie_poi);
		if(!isdefined(zombie_poi.claimed_attractor_positions))
		{
			zombie_poi.claimed_attractor_positions = [];
		}
		else if(!IsArray(zombie_poi.claimed_attractor_positions))
		{
			zombie_poi.claimed_attractor_positions = Array(zombie_poi.claimed_attractor_positions);
		}
		zombie_poi.claimed_attractor_positions[zombie_poi.claimed_attractor_positions.size] = best_pos;
		return best_pos;
	}
	else
	{
		for(i = 0; i < zombie_poi.attractor_array.size; i++)
		{
			if(zombie_poi.attractor_array[i] == self)
			{
				if(isdefined(zombie_poi.claimed_attractor_positions) && isdefined(zombie_poi.claimed_attractor_positions[i]))
				{
					return zombie_poi.claimed_attractor_positions[i];
				}
			}
		}
	}
	return undefined;
}

/*
	Name: can_attract
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x3978
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 1487
*/
function can_attract(attractor)
{
	if(!isdefined(self.attractor_array))
	{
		self.attractor_array = [];
	}
	if(isdefined(self.attracted_array) && !IsInArray(self.attracted_array, attractor))
	{
		return 0;
	}
	if(IsInArray(self.attractor_array, attractor))
	{
		return 1;
	}
	if(isdefined(self.num_poi_attracts) && self.attractor_array.size >= self.num_poi_attracts)
	{
		return 0;
	}
	return 1;
}

/*
	Name: update_poi_on_death
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x3A28
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1518
*/
function update_poi_on_death(zombie_poi)
{
	self endon("kill_poi");
	self waittill("death");
	self remove_poi_attractor(zombie_poi);
}

/*
	Name: update_on_poi_removal
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x3A70
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 1535
*/
function update_on_poi_removal(zombie_poi)
{
	zombie_poi waittill("death");
	if(!isdefined(zombie_poi.attractor_array))
	{
		return;
	}
	for(i = 0; i < zombie_poi.attractor_array.size; i++)
	{
		if(zombie_poi.attractor_array[i] == self)
		{
			ArrayRemoveIndex(zombie_poi.attractor_array, i);
			ArrayRemoveIndex(zombie_poi.claimed_attractor_positions, i);
		}
	}
	return;
	~i;
}

/*
	Name: invalidate_attractor_pos
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x3B38
	Size: 0x200
	Parameters: 2
	Flags: None
	Line Number: 1564
*/
function invalidate_attractor_pos()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: remove_poi_from_ignore_list
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x3D40
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 1584
*/
function remove_poi_from_ignore_list(POI)
{
	if(isdefined(self.ignore_poi) && self.ignore_poi.size > 0)
	{
		for(i = 0; i < self.ignore_poi.size; i++)
		{
			if(self.ignore_poi[i] == POI)
			{
				ArrayRemoveValue(self.ignore_poi, self.ignore_poi[i]);
				return;
			}
		}
	}
}

/*
	Name: add_poi_to_ignore_list
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x3DD8
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 1609
*/
function add_poi_to_ignore_list(POI)
{
	if(!isdefined(self.ignore_poi))
	{
		self.ignore_poi = [];
	}
	add_poi = 1;
	if(self.ignore_poi.size > 0)
	{
		for(i = 0; i < self.ignore_poi.size; i++)
		{
			if(self.ignore_poi[i] == POI)
			{
				add_poi = 0;
				break;
			}
		}
	}
	else if(add_poi)
	{
		self.ignore_poi[self.ignore_poi.size] = POI;
	}
}

/*
	Name: default_validate_enemy_path_length
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x3E98
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1643
*/
function default_validate_enemy_path_length(player)
{
	max_dist = 1296;
	d = DistanceSquared(self.origin, player.origin);
	if(d <= max_dist)
	{
		return 1;
	}
	return 0;
}

/*
	Name: get_closest_valid_player
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x3F08
	Size: 0x428
	Parameters: 2
	Flags: None
	Line Number: 1664
*/
function get_closest_valid_player(origin, ignore_player)
{
	AIProfile_BeginEntry("get_closest_valid_player");
	valid_player_found = 0;
	players = GetPlayers();
	if(isdefined(level.get_closest_valid_player_override))
	{
		players = [[level.get_closest_valid_player_override]]();
	}
	b_designated_target_exists = 0;
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(!player.am_i_valid)
		{
			continue;
		}
		if(isdefined(level.evaluate_zone_path_override))
		{
			if(![[level.evaluate_zone_path_override]](player))
			{
				Array::add(ignore_player, player);
			}
		}
		if(isdefined(player.b_is_designated_target) && player.b_is_designated_target)
		{
			b_designated_target_exists = 1;
		}
	}
	if(isdefined(ignore_player))
	{
		for(i = 0; i < ignore_player.size; i++)
		{
			ArrayRemoveValue(players, ignore_player[i]);
		}
	}
	done = 0;
	while(players.size && !done)
	{
		done = 1;
		for(i = 0; i < players.size; i++)
		{
			player = players[i];
			if(!player.am_i_valid)
			{
				ArrayRemoveValue(players, player);
				done = 0;
				break;
			}
			if(b_designated_target_exists && (!(isdefined(player.b_is_designated_target) && player.b_is_designated_target)))
			{
				ArrayRemoveValue(players, player);
				done = 0;
				break;
			}
		}
	}
	if(players.size == 0)
	{
		AIProfile_EndEntry();
		return undefined;
	}
	while(!valid_player_found)
	{
		if(isdefined(self.closest_player_override))
		{
			player = [[self.closest_player_override]](origin, players);
		}
		else if(isdefined(level.closest_player_override))
		{
			player = [[level.closest_player_override]](origin, players);
		}
		else
		{
			player = ArrayGetClosest(origin, players);
		}
		if(!isdefined(player) || players.size == 0)
		{
			AIProfile_EndEntry();
			return undefined;
		}
		if(isdefined(level.allow_zombie_to_target_ai) && level.allow_zombie_to_target_ai || (isdefined(player.allow_zombie_to_target_ai) && player.allow_zombie_to_target_ai))
		{
			AIProfile_EndEntry();
			return player;
		}
		if(!player.am_i_valid)
		{
			ArrayRemoveValue(players, player);
			if(players.size == 0)
			{
				AIProfile_EndEntry();
				return undefined;
				continue;
			}
		}
		AIProfile_EndEntry();
		return player;
	}
}

/*
	Name: update_valid_players
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x4338
	Size: 0x3B0
	Parameters: 2
	Flags: None
	Line Number: 1775
*/
function update_valid_players(origin, ignore_player)
{
	AIProfile_BeginEntry("update_valid_players");
	valid_player_found = 0;
	players = ArrayCopy(level.players);
	foreach(player in players)
	{
		self SetIgnoreEnt(player, 1);
	}
	b_designated_target_exists = 0;
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(!player.am_i_valid)
		{
			continue;
		}
		if(isdefined(level.evaluate_zone_path_override))
		{
			if(![[level.evaluate_zone_path_override]](player))
			{
				Array::add(ignore_player, player);
			}
		}
		if(isdefined(player.b_is_designated_target) && player.b_is_designated_target)
		{
			b_designated_target_exists = 1;
		}
	}
	if(isdefined(ignore_player))
	{
		for(i = 0; i < ignore_player.size; i++)
		{
			ArrayRemoveValue(players, ignore_player[i]);
		}
	}
	done = 0;
	while(players.size && !done)
	{
		done = 1;
		for(i = 0; i < players.size; i++)
		{
			player = players[i];
			if(!player.am_i_valid)
			{
				ArrayRemoveValue(players, player);
				done = 0;
				break;
			}
			if(b_designated_target_exists && (!(isdefined(player.b_is_designated_target) && player.b_is_designated_target)))
			{
				ArrayRemoveValue(players, player);
				done = 0;
				break;
			}
		}
	}
	foreach(player in players)
	{
		self SetIgnoreEnt(player, 0);
		self GetPerfectInfo(player);
	}
	AIProfile_EndEntry();
}

/*
	Name: is_player_valid
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x46F0
	Size: 0x170
	Parameters: 3
	Flags: None
	Line Number: 1850
*/
function is_player_valid(player, checkIgnoreMeFlag, ignore_laststand_players)
{
	if(!isdefined(player))
	{
		return 0;
	}
	if(!isalive(player))
	{
		return 0;
	}
	if(!isPlayer(player))
	{
		return 0;
	}
	if(isdefined(player.is_zombie) && player.is_zombie == 1)
	{
		return 0;
	}
	if(player.sessionstate == "spectator")
	{
		return 0;
	}
	if(player.sessionstate == "intermission")
	{
		return 0;
	}
	if(isdefined(level.intermission) && level.intermission)
	{
		return 0;
	}
	if(!(isdefined(ignore_laststand_players) && ignore_laststand_players))
	{
		if(player laststand::player_is_in_laststand())
		{
			return 0;
		}
	}
	if(isdefined(checkIgnoreMeFlag) && checkIgnoreMeFlag && player.ignoreme)
	{
		return 0;
	}
	if(isdefined(level.is_player_valid_override))
	{
		return [[level.is_player_valid_override]](player);
	}
	return 1;
}

/*
	Name: get_number_of_valid_players
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x4868
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1908
*/
function get_number_of_valid_players()
{
	players = GetPlayers();
	num_player_valid = 0;
	for(i = 0; i < players.size; i++)
	{
		if(is_player_valid(players[i]))
		{
			num_player_valid = num_player_valid + 1;
		}
	}
	return num_player_valid;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: in_revive_trigger
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x4900
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 1933
*/
function in_revive_trigger()
{
	if(isdefined(self.rt_time) && self.rt_time + 100 >= GetTime())
	{
		return self.in_rt_cached;
	}
	self.rt_time = GetTime();
	players = level.players;
	for(i = 0; i < players.size; i++)
	{
		current_player = players[i];
		if(isdefined(current_player) && isdefined(current_player.reviveTrigger) && isalive(current_player))
		{
			if(self istouching(current_player.reviveTrigger))
			{
				self.in_rt_cached = 1;
				return 1;
			}
		}
	}
	self.in_rt_cached = 0;
	return 0;
}

/*
	Name: get_closest_node
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x4A18
	Size: 0x30
	Parameters: 2
	Flags: None
	Line Number: 1967
*/
function get_closest_node(org, nodes)
{
	return ArrayGetClosest(org, nodes);
}

/*
	Name: non_destroyed_bar_board_order
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x4A50
	Size: 0x528
	Parameters: 2
	Flags: None
	Line Number: 1982
*/
function non_destroyed_bar_board_order(origin, chunks)
{
	first_bars = [];
	first_bars1 = [];
	first_bars2 = [];
	for(i = 0; i < chunks.size; i++)
	{
		if(isdefined(chunks[i].script_team) && chunks[i].script_team == "classic_boards")
		{
			if(isdefined(chunks[i].script_parameters) && chunks[i].script_parameters == "board")
			{
				return get_closest_2d(origin, chunks);
			}
			else if(isdefined(chunks[i].script_team) && chunks[i].script_team == "bar_board_variant1" || chunks[i].script_team == "bar_board_variant2" || chunks[i].script_team == "bar_board_variant4" || chunks[i].script_team == "bar_board_variant5")
			{
				return undefined;
				continue;
			}
		}
		if(isdefined(chunks[i].script_team) && chunks[i].script_team == "new_barricade")
		{
			if(isdefined(chunks[i].script_parameters) && (chunks[i].script_parameters == "repair_board" || chunks[i].script_parameters == "barricade_vents"))
			{
				return get_closest_2d(origin, chunks);
			}
		}
	}
	for(i = 0; i < chunks.size; i++)
	{
		if(isdefined(chunks[i].script_team) && chunks[i].script_team == "6_bars_bent" || chunks[i].script_team == "6_bars_prestine")
		{
			if(isdefined(chunks[i].script_parameters) && chunks[i].script_parameters == "bar")
			{
				if(isdefined(chunks[i].script_noteworthy))
				{
					if(chunks[i].script_noteworthy == "4" || chunks[i].script_noteworthy == "6")
					{
						first_bars[first_bars.size] = chunks[i];
					}
				}
			}
		}
	}
	for(i = 0; i < first_bars.size; i++)
	{
		if(isdefined(chunks[i].script_team) && chunks[i].script_team == "6_bars_bent" || chunks[i].script_team == "6_bars_prestine")
		{
			if(isdefined(chunks[i].script_parameters) && chunks[i].script_parameters == "bar")
			{
				if(!first_bars[i].destroyed)
				{
					return first_bars[i];
				}
			}
		}
	}
	for(i = 0; i < chunks.size; i++)
	{
		if(isdefined(chunks[i].script_team) && chunks[i].script_team == "6_bars_bent" || chunks[i].script_team == "6_bars_prestine")
		{
			if(isdefined(chunks[i].script_parameters) && chunks[i].script_parameters == "bar")
			{
				if(!chunks[i].destroyed)
				{
					return get_closest_2d(origin, chunks);
				}
			}
		}
	}
}

/*
	Name: non_destroyed_grate_order
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x4F80
	Size: 0x578
	Parameters: 2
	Flags: None
	Line Number: 2063
*/
function non_destroyed_grate_order(origin, chunks_grate)
{
	grate_order = [];
	grate_order1 = [];
	grate_order2 = [];
	grate_order3 = [];
	grate_order4 = [];
	grate_order5 = [];
	grate_order6 = [];
	if(isdefined(chunks_grate))
	{
		for(i = 0; i < chunks_grate.size; i++)
		{
			if(isdefined(chunks_grate[i].script_parameters) && chunks_grate[i].script_parameters == "grate")
			{
				if(isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "1")
				{
					grate_order1[grate_order1.size] = chunks_grate[i];
				}
				if(isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "2")
				{
					grate_order2[grate_order2.size] = chunks_grate[i];
				}
				if(isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "3")
				{
					grate_order3[grate_order3.size] = chunks_grate[i];
				}
				if(isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "4")
				{
					grate_order4[grate_order4.size] = chunks_grate[i];
				}
				if(isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "5")
				{
					grate_order5[grate_order5.size] = chunks_grate[i];
				}
				if(isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "6")
				{
					grate_order6[grate_order6.size] = chunks_grate[i];
				}
			}
		}
		for(i = 0; i < chunks_grate.size; i++)
		{
			if(isdefined(chunks_grate[i].script_parameters) && chunks_grate[i].script_parameters == "grate")
			{
				if(isdefined(grate_order1[i]))
				{
					if(grate_order1[i].state == "repaired")
					{
						grate_order2[i] thread show_grate_pull();
						return grate_order1[i];
					}
					if(grate_order2[i].state == "repaired")
					{
						/#
							IPrintLnBold("Dev Block strings are not supported");
						#/
						grate_order3[i] thread show_grate_pull();
						return grate_order2[i];
						continue;
					}
					if(grate_order3[i].state == "repaired")
					{
						/#
							IPrintLnBold("Dev Block strings are not supported");
						#/
						grate_order4[i] thread show_grate_pull();
						return grate_order3[i];
						continue;
					}
					if(grate_order4[i].state == "repaired")
					{
						/#
							IPrintLnBold("Dev Block strings are not supported");
						#/
						grate_order5[i] thread show_grate_pull();
						return grate_order4[i];
						continue;
					}
					if(grate_order5[i].state == "repaired")
					{
						/#
							IPrintLnBold("Dev Block strings are not supported");
						#/
						grate_order6[i] thread show_grate_pull();
						return grate_order5[i];
						continue;
					}
					if(grate_order6[i].state == "repaired")
					{
						return grate_order6[i];
					}
				}
			}
		}
	}
}

/*
	Name: non_destroyed_variant1_order
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x5500
	Size: 0x3E8
	Parameters: 2
	Flags: None
	Line Number: 2171
*/
function non_destroyed_variant1_order(origin, chunks_variant1)
{
	variant1_order = [];
	variant1_order1 = [];
	variant1_order2 = [];
	variant1_order3 = [];
	variant1_order4 = [];
	variant1_order5 = [];
	variant1_order6 = [];
	if(isdefined(chunks_variant1))
	{
		for(i = 0; i < chunks_variant1.size; i++)
		{
			if(isdefined(chunks_variant1[i].script_team) && chunks_variant1[i].script_team == "bar_board_variant1")
			{
				if(isdefined(chunks_variant1[i].script_noteworthy))
				{
					if(chunks_variant1[i].script_noteworthy == "1")
					{
						variant1_order1[variant1_order1.size] = chunks_variant1[i];
					}
					if(chunks_variant1[i].script_noteworthy == "2")
					{
						variant1_order2[variant1_order2.size] = chunks_variant1[i];
					}
					if(chunks_variant1[i].script_noteworthy == "3")
					{
						variant1_order3[variant1_order3.size] = chunks_variant1[i];
					}
					if(chunks_variant1[i].script_noteworthy == "4")
					{
						variant1_order4[variant1_order4.size] = chunks_variant1[i];
					}
					if(chunks_variant1[i].script_noteworthy == "5")
					{
						variant1_order5[variant1_order5.size] = chunks_variant1[i];
					}
					if(chunks_variant1[i].script_noteworthy == "6")
					{
						variant1_order6[variant1_order6.size] = chunks_variant1[i];
					}
				}
			}
		}
		for(i = 0; i < chunks_variant1.size; i++)
		{
			if(isdefined(chunks_variant1[i].script_team) && chunks_variant1[i].script_team == "bar_board_variant1")
			{
				if(isdefined(variant1_order2[i]))
				{
					if(variant1_order2[i].state == "repaired")
					{
						return variant1_order2[i];
						continue;
					}
					if(variant1_order3[i].state == "repaired")
					{
						return variant1_order3[i];
						continue;
					}
					if(variant1_order4[i].state == "repaired")
					{
						return variant1_order4[i];
						continue;
					}
					if(variant1_order6[i].state == "repaired")
					{
						return variant1_order6[i];
						continue;
					}
					if(variant1_order5[i].state == "repaired")
					{
						return variant1_order5[i];
						continue;
					}
					if(variant1_order1[i].state == "repaired")
					{
						return variant1_order1[i];
					}
				}
			}
		}
	}
}

/*
	Name: non_destroyed_variant2_order
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x58F0
	Size: 0x4D0
	Parameters: 2
	Flags: None
	Line Number: 2266
*/
function non_destroyed_variant2_order(origin, chunks_variant2)
{
	variant2_order = [];
	variant2_order1 = [];
	variant2_order2 = [];
	variant2_order3 = [];
	variant2_order4 = [];
	variant2_order5 = [];
	variant2_order6 = [];
	if(isdefined(chunks_variant2))
	{
		for(i = 0; i < chunks_variant2.size; i++)
		{
			if(isdefined(chunks_variant2[i].script_team) && chunks_variant2[i].script_team == "bar_board_variant2")
			{
				if(isdefined(chunks_variant2[i].script_noteworthy) && chunks_variant2[i].script_noteworthy == "1")
				{
					variant2_order1[variant2_order1.size] = chunks_variant2[i];
				}
				if(isdefined(chunks_variant2[i].script_noteworthy) && chunks_variant2[i].script_noteworthy == "2")
				{
					variant2_order2[variant2_order2.size] = chunks_variant2[i];
				}
				if(isdefined(chunks_variant2[i].script_noteworthy) && chunks_variant2[i].script_noteworthy == "3")
				{
					variant2_order3[variant2_order3.size] = chunks_variant2[i];
				}
				if(isdefined(chunks_variant2[i].script_noteworthy) && chunks_variant2[i].script_noteworthy == "4")
				{
					variant2_order4[variant2_order4.size] = chunks_variant2[i];
				}
				if(isdefined(chunks_variant2[i].script_noteworthy) && chunks_variant2[i].script_noteworthy == "5" && isdefined(chunks_variant2[i].script_location) && chunks_variant2[i].script_location == "5")
				{
					variant2_order5[variant2_order5.size] = chunks_variant2[i];
				}
				if(isdefined(chunks_variant2[i].script_noteworthy) && chunks_variant2[i].script_noteworthy == "5" && isdefined(chunks_variant2[i].script_location) && chunks_variant2[i].script_location == "6")
				{
					variant2_order6[variant2_order6.size] = chunks_variant2[i];
				}
			}
		}
		for(i = 0; i < chunks_variant2.size; i++)
		{
			if(isdefined(chunks_variant2[i].script_team) && chunks_variant2[i].script_team == "bar_board_variant2")
			{
				if(isdefined(variant2_order1[i]))
				{
					if(variant2_order1[i].state == "repaired")
					{
						return variant2_order1[i];
						continue;
					}
					if(variant2_order2[i].state == "repaired")
					{
						return variant2_order2[i];
						continue;
					}
					if(variant2_order3[i].state == "repaired")
					{
						return variant2_order3[i];
						continue;
					}
					if(variant2_order5[i].state == "repaired")
					{
						return variant2_order5[i];
						continue;
					}
					if(variant2_order4[i].state == "repaired")
					{
						return variant2_order4[i];
						continue;
					}
					if(variant2_order6[i].state == "repaired")
					{
						return variant2_order6[i];
					}
				}
			}
		}
	}
}

/*
	Name: non_destroyed_variant4_order
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x5DC8
	Size: 0x4B0
	Parameters: 2
	Flags: None
	Line Number: 2358
*/
function non_destroyed_variant4_order(origin, chunks_variant4)
{
	variant4_order = [];
	variant4_order1 = [];
	variant4_order2 = [];
	variant4_order3 = [];
	variant4_order4 = [];
	variant4_order5 = [];
	variant4_order6 = [];
	if(isdefined(chunks_variant4))
	{
		for(i = 0; i < chunks_variant4.size; i++)
		{
			if(isdefined(chunks_variant4[i].script_team) && chunks_variant4[i].script_team == "bar_board_variant4")
			{
				if(isdefined(chunks_variant4[i].script_noteworthy) && chunks_variant4[i].script_noteworthy == "1" && !isdefined(chunks_variant4[i].script_location))
				{
					variant4_order1[variant4_order1.size] = chunks_variant4[i];
				}
				if(isdefined(chunks_variant4[i].script_noteworthy) && chunks_variant4[i].script_noteworthy == "2")
				{
					variant4_order2[variant4_order2.size] = chunks_variant4[i];
				}
				if(isdefined(chunks_variant4[i].script_noteworthy) && chunks_variant4[i].script_noteworthy == "3")
				{
					variant4_order3[variant4_order3.size] = chunks_variant4[i];
				}
				if(isdefined(chunks_variant4[i].script_noteworthy) && chunks_variant4[i].script_noteworthy == "1" && isdefined(chunks_variant4[i].script_location) && chunks_variant4[i].script_location == "3")
				{
					variant4_order4[variant4_order4.size] = chunks_variant4[i];
				}
				if(isdefined(chunks_variant4[i].script_noteworthy) && chunks_variant4[i].script_noteworthy == "5")
				{
					variant4_order5[variant4_order5.size] = chunks_variant4[i];
				}
				if(isdefined(chunks_variant4[i].script_noteworthy) && chunks_variant4[i].script_noteworthy == "6")
				{
					variant4_order6[variant4_order6.size] = chunks_variant4[i];
				}
			}
		}
		for(i = 0; i < chunks_variant4.size; i++)
		{
			if(isdefined(chunks_variant4[i].script_team) && chunks_variant4[i].script_team == "bar_board_variant4")
			{
				if(isdefined(variant4_order1[i]))
				{
					if(variant4_order1[i].state == "repaired")
					{
						return variant4_order1[i];
						continue;
					}
					if(variant4_order6[i].state == "repaired")
					{
						return variant4_order6[i];
						continue;
					}
					if(variant4_order3[i].state == "repaired")
					{
						return variant4_order3[i];
						continue;
					}
					if(variant4_order4[i].state == "repaired")
					{
						return variant4_order4[i];
						continue;
					}
					if(variant4_order2[i].state == "repaired")
					{
						return variant4_order2[i];
						continue;
					}
					if(variant4_order5[i].state == "repaired")
					{
						return variant4_order5[i];
					}
				}
			}
		}
	}
}

/*
	Name: non_destroyed_variant5_order
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x6280
	Size: 0x450
	Parameters: 2
	Flags: None
	Line Number: 2450
*/
function non_destroyed_variant5_order(origin, chunks_variant5)
{
	variant5_order = [];
	variant5_order1 = [];
	variant5_order2 = [];
	variant5_order3 = [];
	variant5_order4 = [];
	variant5_order5 = [];
	variant5_order6 = [];
	if(isdefined(chunks_variant5))
	{
		for(i = 0; i < chunks_variant5.size; i++)
		{
			if(isdefined(chunks_variant5[i].script_team) && chunks_variant5[i].script_team == "bar_board_variant5")
			{
				if(isdefined(chunks_variant5[i].script_noteworthy))
				{
					if(chunks_variant5[i].script_noteworthy == "1" && !isdefined(chunks_variant5[i].script_location))
					{
						variant5_order1[variant5_order1.size] = chunks_variant5[i];
					}
					if(chunks_variant5[i].script_noteworthy == "2")
					{
						variant5_order2[variant5_order2.size] = chunks_variant5[i];
					}
					if(isdefined(chunks_variant5[i].script_noteworthy) && chunks_variant5[i].script_noteworthy == "1" && isdefined(chunks_variant5[i].script_location) && chunks_variant5[i].script_location == "3")
					{
						variant5_order3[variant5_order3.size] = chunks_variant5[i];
					}
					if(chunks_variant5[i].script_noteworthy == "4")
					{
						variant5_order4[variant5_order4.size] = chunks_variant5[i];
					}
					if(chunks_variant5[i].script_noteworthy == "5")
					{
						variant5_order5[variant5_order5.size] = chunks_variant5[i];
					}
					if(chunks_variant5[i].script_noteworthy == "6")
					{
						variant5_order6[variant5_order6.size] = chunks_variant5[i];
					}
				}
			}
		}
		for(i = 0; i < chunks_variant5.size; i++)
		{
			if(isdefined(chunks_variant5[i].script_team) && chunks_variant5[i].script_team == "bar_board_variant5")
			{
				if(isdefined(variant5_order1[i]))
				{
					if(variant5_order1[i].state == "repaired")
					{
						return variant5_order1[i];
						continue;
					}
					if(variant5_order6[i].state == "repaired")
					{
						return variant5_order6[i];
						continue;
					}
					if(variant5_order3[i].state == "repaired")
					{
						return variant5_order3[i];
						continue;
					}
					if(variant5_order2[i].state == "repaired")
					{
						return variant5_order2[i];
						continue;
					}
					if(variant5_order5[i].state == "repaired")
					{
						return variant5_order5[i];
						continue;
					}
					if(variant5_order4[i].state == "repaired")
					{
						return variant5_order4[i];
					}
				}
			}
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: show_grate_pull
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x66D8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 2547
*/
function show_grate_pull()
{
	wait(0.53);
	self show();
	self vibrate(VectorScale((0, 1, 0), 270), 0.2, 0.4, 0.4);
}

/*
	Name: get_closest_2d
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x6740
	Size: 0x228
	Parameters: 2
	Flags: None
	Line Number: 2564
*/
function get_closest_2d(origin, ents)
{
	if(!isdefined(ents))
	{
		return undefined;
	}
	dist = Distance2D(origin, ents[0].origin);
	index = 0;
	temp_array = [];
	for(i = 1; i < ents.size; i++)
	{
		if(isdefined(ents[i].unbroken) && ents[i].unbroken == 1)
		{
			ents[i].index = i;
			if(!isdefined(temp_array))
			{
				temp_array = [];
			}
			else if(!IsArray(temp_array))
			{
				temp_array = Array(temp_array);
			}
			temp_array[temp_array.size] = ents[i];
		}
	}
	if(temp_array.size > 0)
	{
		index = temp_array[randomIntRange(0, temp_array.size)].index;
		return ents[index];
	}
	else
	{
		for(i = 1; i < ents.size; i++)
		{
			temp_dist = Distance2D(origin, ents[i].origin);
			if(temp_dist < dist)
			{
				dist = temp_dist;
				index = i;
			}
		}
		return ents[index];
	}
}

/*
	Name: in_playable_area
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x6970
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 2619
*/
function in_playable_area()
{
	playable_area = GetEntArray("player_volume", "script_noteworthy");
	if(!isdefined(playable_area))
	{
		/#
			println("Dev Block strings are not supported");
		#/
		return 1;
	}
	for(i = 0; i < playable_area.size; i++)
	{
		if(self istouching(playable_area[i]))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: get_closest_non_destroyed_chunk
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x6A28
	Size: 0x128
	Parameters: 3
	Flags: None
	Line Number: 2649
*/
function get_closest_non_destroyed_chunk(origin, barrier, barrier_chunks)
{
	chunks = undefined;
	chunks_grate = undefined;
	chunks_grate = get_non_destroyed_chunks_grate(barrier, barrier_chunks);
	chunks = get_non_destroyed_chunks(barrier, barrier_chunks);
	if(isdefined(barrier.zbarrier))
	{
		if(isdefined(chunks))
		{
			return Array::randomize(chunks)[0];
		}
		if(isdefined(chunks_grate))
		{
			return Array::randomize(chunks_grate)[0];
		}
	}
	else if(isdefined(chunks))
	{
		return non_destroyed_bar_board_order(origin, chunks);
	}
	else if(isdefined(chunks_grate))
	{
		return non_destroyed_grate_order(origin, chunks_grate);
	}
	return undefined;
}

/*
	Name: get_random_destroyed_chunk
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x6B58
	Size: 0x148
	Parameters: 2
	Flags: None
	Line Number: 2687
*/
function get_random_destroyed_chunk(barrier, barrier_chunks)
{
	if(isdefined(barrier.zbarrier))
	{
		ret = undefined;
		pieces = barrier.zbarrier GetZBarrierPieceIndicesInState("open");
		if(pieces.size)
		{
			ret = Array::randomize(pieces)[0];
		}
		return ret;
	}
	else
	{
		chunk = undefined;
		chunks_repair_grate = undefined;
		chunks = get_destroyed_chunks(barrier_chunks);
		chunks_repair_grate = get_destroyed_repair_grates(barrier_chunks);
		if(isdefined(chunks))
		{
			return chunks[RandomInt(chunks.size)];
		}
		else if(isdefined(chunks_repair_grate))
		{
			return grate_order_destroyed(chunks_repair_grate);
		}
		return undefined;
	}
}

/*
	Name: get_destroyed_repair_grates
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x6CA8
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 2727
*/
function get_destroyed_repair_grates(barrier_chunks)
{
	Array = [];
	for(i = 0; i < barrier_chunks.size; i++)
	{
		if(isdefined(barrier_chunks[i]))
		{
			if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "grate")
			{
				Array[Array.size] = barrier_chunks[i];
			}
		}
	}
	if(Array.size == 0)
	{
		return undefined;
	}
	return Array;
}

/*
	Name: get_non_destroyed_chunks
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x6D70
	Size: 0x440
	Parameters: 2
	Flags: None
	Line Number: 2757
*/
function get_non_destroyed_chunks(barrier, barrier_chunks)
{
	if(isdefined(barrier.zbarrier))
	{
		return barrier.zbarrier GetZBarrierPieceIndicesInState("closed");
	}
	else
	{
		Array = [];
		for(i = 0; i < barrier_chunks.size; i++)
		{
			if(isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "classic_boards")
			{
				if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "board")
				{
					if(barrier_chunks[i] get_chunk_state() == "repaired")
					{
						if(barrier_chunks[i].origin == barrier_chunks[i].og_origin)
						{
							Array[Array.size] = barrier_chunks[i];
						}
					}
				}
			}
			if(isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "new_barricade")
			{
				if(isdefined(barrier_chunks[i].script_parameters) && (barrier_chunks[i].script_parameters == "repair_board" || barrier_chunks[i].script_parameters == "barricade_vents"))
				{
					if(barrier_chunks[i] get_chunk_state() == "repaired")
					{
						if(barrier_chunks[i].origin == barrier_chunks[i].og_origin)
						{
							Array[Array.size] = barrier_chunks[i];
							continue;
						}
					}
				}
			}
			if(isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "6_bars_bent")
			{
				if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "bar")
				{
					if(barrier_chunks[i] get_chunk_state() == "repaired")
					{
						if(barrier_chunks[i].origin == barrier_chunks[i].og_origin)
						{
							Array[Array.size] = barrier_chunks[i];
							continue;
						}
					}
				}
			}
			if(isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "6_bars_prestine")
			{
				if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "bar")
				{
					if(barrier_chunks[i] get_chunk_state() == "repaired")
					{
						if(barrier_chunks[i].origin == barrier_chunks[i].og_origin)
						{
							Array[Array.size] = barrier_chunks[i];
						}
					}
				}
			}
		}
		if(Array.size == 0)
		{
			return undefined;
		}
		return Array;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_non_destroyed_chunks_grate
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x71B8
	Size: 0x108
	Parameters: 2
	Flags: None
	Line Number: 2843
*/
function get_non_destroyed_chunks_grate(barrier, barrier_chunks)
{
	if(isdefined(barrier.zbarrier))
	{
		return barrier.zbarrier GetZBarrierPieceIndicesInState("closed");
	}
	else
	{
		Array = [];
		for(i = 0; i < barrier_chunks.size; i++)
		{
			if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "grate")
			{
				if(isdefined(barrier_chunks[i]))
				{
					Array[Array.size] = barrier_chunks[i];
				}
			}
		}
		if(Array.size == 0)
		{
			return undefined;
		}
		return Array;
	}
}

/*
	Name: get_non_destroyed_variant1
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x72C8
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 2880
*/
function get_non_destroyed_variant1(barrier_chunks)
{
	Array = [];
	for(i = 0; i < barrier_chunks.size; i++)
	{
		if(isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "bar_board_variant1")
		{
			if(isdefined(barrier_chunks[i]))
			{
				Array[Array.size] = barrier_chunks[i];
			}
		}
	}
	if(Array.size == 0)
	{
		return undefined;
	}
	return Array;
}

/*
	Name: get_non_destroyed_variant2
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x7390
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 2910
*/
function get_non_destroyed_variant2(barrier_chunks)
{
	Array = [];
	for(i = 0; i < barrier_chunks.size; i++)
	{
		if(isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "bar_board_variant2")
		{
			if(isdefined(barrier_chunks[i]))
			{
				Array[Array.size] = barrier_chunks[i];
			}
		}
	}
	if(Array.size == 0)
	{
		return undefined;
	}
	return Array;
}

/*
	Name: get_non_destroyed_variant4
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x7458
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 2940
*/
function get_non_destroyed_variant4(barrier_chunks)
{
	Array = [];
	for(i = 0; i < barrier_chunks.size; i++)
	{
		if(isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "bar_board_variant4")
		{
			if(isdefined(barrier_chunks[i]))
			{
				Array[Array.size] = barrier_chunks[i];
			}
		}
	}
	if(Array.size == 0)
	{
		return undefined;
	}
	return Array;
	ERROR: Bad function call
}

/*
	Name: get_non_destroyed_variant5
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x7520
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 2971
*/
function get_non_destroyed_variant5(barrier_chunks)
{
	Array = [];
	for(i = 0; i < barrier_chunks.size; i++)
	{
		if(isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "bar_board_variant5")
		{
			if(isdefined(barrier_chunks[i]))
			{
				Array[Array.size] = barrier_chunks[i];
			}
		}
	}
	if(Array.size == 0)
	{
		return undefined;
	}
	return Array;
}

/*
	Name: get_destroyed_chunks
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x75E8
	Size: 0x1E0
	Parameters: 1
	Flags: None
	Line Number: 3001
*/
function get_destroyed_chunks(barrier_chunks)
{
	Array = [];
	for(i = 0; i < barrier_chunks.size; i++)
	{
		if(barrier_chunks[i] get_chunk_state() == "destroyed")
		{
			if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "board")
			{
				Array[Array.size] = barrier_chunks[i];
				continue;
			}
			if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "repair_board" || barrier_chunks[i].script_parameters == "barricade_vents")
			{
				Array[Array.size] = barrier_chunks[i];
				continue;
			}
			if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "bar")
			{
				Array[Array.size] = barrier_chunks[i];
				continue;
			}
			if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "grate")
			{
				return undefined;
			}
		}
	}
	if(Array.size == 0)
	{
		return undefined;
	}
	return Array;
}

/*
	Name: grate_order_destroyed
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x77D0
	Size: 0x5A0
	Parameters: 1
	Flags: None
	Line Number: 3046
*/
function grate_order_destroyed(chunks_repair_grate)
{
	grate_repair_order = [];
	grate_repair_order1 = [];
	grate_repair_order2 = [];
	grate_repair_order3 = [];
	grate_repair_order4 = [];
	grate_repair_order5 = [];
	grate_repair_order6 = [];
	for(i = 0; i < chunks_repair_grate.size; i++)
	{
		if(isdefined(chunks_repair_grate[i].script_parameters) && chunks_repair_grate[i].script_parameters == "grate")
		{
			if(isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "1")
			{
				grate_repair_order1[grate_repair_order1.size] = chunks_repair_grate[i];
			}
			if(isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "2")
			{
				grate_repair_order2[grate_repair_order2.size] = chunks_repair_grate[i];
			}
			if(isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "3")
			{
				grate_repair_order3[grate_repair_order3.size] = chunks_repair_grate[i];
			}
			if(isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "4")
			{
				grate_repair_order4[grate_repair_order4.size] = chunks_repair_grate[i];
			}
			if(isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "5")
			{
				grate_repair_order5[grate_repair_order5.size] = chunks_repair_grate[i];
			}
			if(isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "6")
			{
				grate_repair_order6[grate_repair_order6.size] = chunks_repair_grate[i];
			}
		}
	}
	for(i = 0; i < chunks_repair_grate.size; i++)
	{
		if(isdefined(chunks_repair_grate[i].script_parameters) && chunks_repair_grate[i].script_parameters == "grate")
		{
			if(isdefined(grate_repair_order1[i]))
			{
				if(grate_repair_order6[i].state == "destroyed")
				{
					/#
						IPrintLnBold("Dev Block strings are not supported");
					#/
					return grate_repair_order6[i];
				}
				if(grate_repair_order5[i].state == "destroyed")
				{
					/#
						IPrintLnBold("Dev Block strings are not supported");
					#/
					grate_repair_order6[i] thread show_grate_repair();
					return grate_repair_order5[i];
					continue;
				}
				if(grate_repair_order4[i].state == "destroyed")
				{
					/#
						IPrintLnBold("Dev Block strings are not supported");
					#/
					grate_repair_order5[i] thread show_grate_repair();
					return grate_repair_order4[i];
					continue;
				}
				if(grate_repair_order3[i].state == "destroyed")
				{
					/#
						IPrintLnBold("Dev Block strings are not supported");
					#/
					grate_repair_order4[i] thread show_grate_repair();
					return grate_repair_order3[i];
					continue;
				}
				if(grate_repair_order2[i].state == "destroyed")
				{
					/#
						IPrintLnBold("Dev Block strings are not supported");
					#/
					grate_repair_order3[i] thread show_grate_repair();
					return grate_repair_order2[i];
					continue;
				}
				if(grate_repair_order1[i].state == "destroyed")
				{
					/#
						IPrintLnBold("Dev Block strings are not supported");
					#/
					grate_repair_order2[i] thread show_grate_repair();
					return grate_repair_order1[i];
				}
			}
		}
	}
}

/*
	Name: show_grate_repair
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x7D78
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 3157
*/
function show_grate_repair()
{
	wait(0.34);
	self Hide();
}

/*
	Name: get_chunk_state
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x7DA8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 3173
*/
function get_chunk_state()
{
	/#
		fallback_initiated::Assert(isdefined(self.state));
	#/
	return self.state;
}

/*
	Name: array_limiter
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x7DE0
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 3191
*/
function array_limiter(Array, Total)
{
	new_array = [];
	for(i = 0; i < Array.size; i++)
	{
		if(i < Total)
		{
			new_array[new_array.size] = Array[i];
		}
	}
	return new_array;
}

/*
	Name: fake_physicslaunch
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x7E60
	Size: 0x158
	Parameters: 2
	Flags: None
	Line Number: 3214
*/
function fake_physicslaunch(target_pos, power)
{
	start_pos = self.origin;
	gravity = GetDvarInt("bg_gravity") * -1;
	dist = Distance(start_pos, target_pos);
	time = dist / power;
	delta = target_pos - start_pos;
	drop = 0.5 * gravity * time * time;
	velocity = (delta[0] / time, delta[1] / time, delta[2] - drop / time);
	level thread draw_line_ent_to_pos(self, target_pos);
	self MoveGravity(velocity, time);
	return time;
}

/*
	Name: add_zombie_hint
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x7FC0
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 3238
*/
function add_zombie_hint(ref, text)
{
	if(!isdefined(level.zombie_hints))
	{
		level.zombie_hints = [];
	}
	level.zombie_hints[ref] = text;
	return;
	level.zombie_hints[ref]++;
}

/*
	Name: get_zombie_hint
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8008
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 3259
*/
function get_zombie_hint(ref)
{
	if(isdefined(level.zombie_hints[ref]))
	{
		return level.zombie_hints[ref];
	}
	/#
		println("Dev Block strings are not supported" + ref);
	#/
	return level.zombie_hints["undefined"];
}

/*
	Name: set_hint_string
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8078
	Size: 0x118
	Parameters: 3
	Flags: None
	Line Number: 3281
*/
function set_hint_string(ent, default_ref, cost)
{
	ref = default_ref;
	if(isdefined(ent.script_hint))
	{
		ref = ent.script_hint;
	}
	if(isdefined(level.legacy_hint_system) && level.legacy_hint_system)
	{
		ref = ref + "_" + cost;
		self setHintString(get_zombie_hint(ref));
	}
	else
	{
		hint = get_zombie_hint(ref);
		if(isdefined(cost))
		{
			self setHintString(hint, cost);
		}
		else
		{
			self setHintString(hint);
		}
	}
}

/*
	Name: get_hint_string
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8198
	Size: 0xA8
	Parameters: 3
	Flags: None
	Line Number: 3317
*/
function get_hint_string(ent, default_ref, cost)
{
	ref = default_ref;
	if(isdefined(ent.script_hint))
	{
		ref = ent.script_hint;
	}
	if(isdefined(level.legacy_hint_system) && level.legacy_hint_system && isdefined(cost))
	{
		ref = ref + "_" + cost;
	}
	return get_zombie_hint(ref);
}

/*
	Name: unitrigger_set_hint_string
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8248
	Size: 0x1D0
	Parameters: 3
	Flags: None
	Line Number: 3341
*/
function unitrigger_set_hint_string(ent, default_ref, cost)
{
	triggers = [];
	if(self.trigger_per_player)
	{
		triggers = self.playertrigger;
	}
	else
	{
		triggers[0] = self.trigger;
	}
	foreach(trigger in triggers)
	{
		ref = default_ref;
		if(isdefined(ent.script_hint))
		{
			ref = ent.script_hint;
		}
		if(isdefined(level.legacy_hint_system) && level.legacy_hint_system)
		{
			ref = ref + "_" + cost;
			trigger setHintString(get_zombie_hint(ref));
			continue;
		}
		hint = get_zombie_hint(ref);
		if(isdefined(cost))
		{
			trigger setHintString(hint, cost);
			continue;
		}
		trigger setHintString(hint);
	}
}

/*
	Name: add_sound
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8420
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 3385
*/
function add_sound(ref, alias)
{
	if(!isdefined(level.zombie_sounds))
	{
		level.zombie_sounds = [];
	}
	level.zombie_sounds[ref] = alias;
}

/*
	Name: play_sound_at_pos
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8468
	Size: 0xF8
	Parameters: 3
	Flags: None
	Line Number: 3404
*/
function play_sound_at_pos(ref, pos, ent)
{
	if(isdefined(ent))
	{
		if(isdefined(ent.script_soundalias))
		{
			playsoundatposition(ent.script_soundalias, pos);
			return;
		}
		if(isdefined(self.script_sound))
		{
			ref = self.script_sound;
		}
	}
	if(ref == "none")
	{
		return;
	}
	if(!isdefined(level.zombie_sounds[ref]))
	{
		/#
			fallback_initiated::ASSERTMSG("Dev Block strings are not supported" + ref + "Dev Block strings are not supported");
			return;
		#/
	}
	playsoundatposition(level.zombie_sounds[ref], pos);
}

/*
	Name: play_sound_on_ent
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8568
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 3442
*/
function play_sound_on_ent(ref)
{
	if(isdefined(self.script_soundalias))
	{
		self playsound(self.script_soundalias);
		return;
	}
	if(isdefined(self.script_sound))
	{
		ref = self.script_sound;
	}
	if(ref == "none")
	{
		return;
	}
	if(!isdefined(level.zombie_sounds[ref]))
	{
		/#
			fallback_initiated::ASSERTMSG("Dev Block strings are not supported" + ref + "Dev Block strings are not supported");
			return;
		#/
	}
	self playsound(level.zombie_sounds[ref]);
}

/*
	Name: play_loopsound_on_ent
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8638
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 3477
*/
function play_loopsound_on_ent(ref)
{
	if(isdefined(self.script_firefxsound))
	{
		ref = self.script_firefxsound;
	}
	if(ref == "none")
	{
		return;
	}
	if(!isdefined(level.zombie_sounds[ref]))
	{
		/#
			fallback_initiated::ASSERTMSG("Dev Block strings are not supported" + ref + "Dev Block strings are not supported");
			return;
		#/
	}
	self playsound(level.zombie_sounds[ref]);
}

/*
	Name: string_to_float
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x86D8
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 3507
*/
function string_to_float(string)
{
	floatParts = StrTok(string, ".");
	if(floatParts.size == 1)
	{
		return Int(floatParts[0]);
	}
	whole = Int(floatParts[0]);
	decimal = 0;
	for(i = floatParts[1].size - 1; i >= 0; i--)
	{
		decimal = decimal / 10 + Int(floatParts[1][i]) / 10;
	}
	if(whole >= 0)
	{
		return whole + decimal;
	}
	else
	{
		return whole - decimal;
		return;
	}
}

/*
	Name: set_zombie_var
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8818
	Size: 0x110
	Parameters: 5
	Flags: None
	Line Number: 3541
*/
function set_zombie_var(zvar, value, is_float, column, is_team_based)
{
	if(!isdefined(is_float))
	{
		is_float = 0;
	}
	if(!isdefined(column))
	{
		column = 1;
	}
	if(isdefined(is_team_based) && is_team_based)
	{
		foreach(team in level.teams)
		{
			level.zombie_vars[team][zvar] = value;
		}
	}
	else
	{
		level.zombie_vars[zvar] = value;
	}
	return value;
}

/*
	Name: get_table_var
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8930
	Size: 0x100
	Parameters: 5
	Flags: None
	Line Number: 3575
*/
function get_table_var(table, var_name, value, is_float, column)
{
	if(!isdefined(table))
	{
		table = "mp/zombiemode.csv";
	}
	if(!isdefined(is_float))
	{
		is_float = 0;
	}
	if(!isdefined(column))
	{
		column = 1;
	}
	table_value = tableLookup(table, 0, var_name, column);
	if(isdefined(table_value) && table_value != "")
	{
		if(is_float)
		{
			value = string_to_float(table_value);
		}
		else
		{
			value = Int(table_value);
		}
	}
	return value;
}

/*
	Name: hudelem_count
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8A38
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 3614
*/
function hudelem_count()
{
	/#
		max = 0;
		curr_total = 0;
		while(1)
		{
			if(level.hudelem_count > max)
			{
				max = level.hudelem_count;
			}
			println("Dev Block strings are not supported" + level.hudelem_count + "Dev Block strings are not supported" + max + "Dev Block strings are not supported");
			wait(0.05);
		}
	#/
}

/*
	Name: debug_round_advancer
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8AD8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 3641
*/
function debug_round_advancer()
{
	/#
		while(1)
		{
			zombs = zombie_utility::get_round_enemy_array();
			for(i = 0; i < zombs.size; i++)
			{
				zombs[i] DoDamage(zombs[i].health + 666, (0, 0, 0));
				wait(0.5);
			}
		}
	#/
}

/*
	Name: print_run_speed
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8B88
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 3666
*/
function print_run_speed(speed)
{
	/#
		self endon("death");
		while(1)
		{
			print3d(self.origin + VectorScale((0, 0, 1), 64), speed, (1, 1, 1));
			wait(0.05);
		}
	#/
}

/*
	Name: draw_line_ent_to_ent
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8BF0
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 3688
*/
function draw_line_ent_to_ent(ent1, ent2)
{
	/#
		if(GetDvarInt("Dev Block strings are not supported") != 1)
		{
			return;
		}
		ent1 endon("death");
		ent2 endon("death");
		while(1)
		{
			line(ent1.origin, ent2.origin);
			wait(0.05);
		}
	#/
}

/*
	Name: draw_line_ent_to_pos
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8C90
	Size: 0xB8
	Parameters: 3
	Flags: None
	Line Number: 3715
*/
function draw_line_ent_to_pos(ent, pos, end_on)
{
	/#
		if(GetDvarInt("Dev Block strings are not supported") != 1)
		{
			return;
		}
		ent endon("death");
		ent notify("stop_draw_line_ent_to_pos");
		ent endon("stop_draw_line_ent_to_pos");
		if(isdefined(end_on))
		{
			ent endon(end_on);
		}
		while(1)
		{
			line(ent.origin, pos);
			wait(0.05);
		}
	#/
}

/*
	Name: debug_print
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8D50
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 3747
*/
function debug_print(msg)
{
	/#
		if(GetDvarInt("Dev Block strings are not supported") > 0)
		{
			println("Dev Block strings are not supported" + msg);
		}
	#/
}

/*
	Name: debug_blocker
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8DB0
	Size: 0x88
	Parameters: 3
	Flags: None
	Line Number: 3767
*/
function debug_blocker(pos, rad, height)
{
	/#
		self notify("stop_debug_blocker");
		self endon("stop_debug_blocker");
		while(GetDvarInt("Dev Block strings are not supported") != 1)
		{
			return;
			wait(0.05);
			drawcylinder(pos, rad, height);
		}
	#/
}

/*
	Name: drawcylinder
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x8E40
	Size: 0x260
	Parameters: 3
	Flags: None
	Line Number: 3791
*/
function drawcylinder(pos, rad, height)
{
	/#
		currad = rad;
		curheight = height;
		for(r = 0; r < 20; r++)
		{
			theta = r / 20 * 360;
			theta2 = r + 1 / 20 * 360;
			line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta2) * currad, sin(theta2) * currad, 0));
			line(pos + (cos(theta) * currad, sin(theta) * currad, curheight), pos + (cos(theta2) * currad, sin(theta2) * currad, curheight));
			line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta) * currad, sin(theta) * currad, curheight));
		}
	#/
}

/*
	Name: print3d_at_pos
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x90A8
	Size: 0x98
	Parameters: 4
	Flags: None
	Line Number: 3817
*/
function print3d_at_pos(msg, pos, thread_endon, offset)
{
	/#
		self endon("death");
		if(isdefined(thread_endon))
		{
			self notify(thread_endon);
			self endon(thread_endon);
		}
		if(!isdefined(offset))
		{
			offset = (0, 0, 0);
		}
		while(1)
		{
			print3d(self.origin + offset, msg);
			wait(0.05);
		}
	#/
}

/*
	Name: debug_breadcrumbs
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9148
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 3848
*/
function debug_breadcrumbs()
{
	/#
		self endon("disconnect");
		self notify("stop_debug_breadcrumbs");
		self endon("stop_debug_breadcrumbs");
		while(1)
		{
			if(GetDvarInt("Dev Block strings are not supported") != 1)
			{
				wait(1);
				continue;
			}
			for(i = 0; i < self.zombie_breadcrumbs.size; i++)
			{
				drawcylinder(self.zombie_breadcrumbs[i], 5, 5);
			}
			wait(0.05);
		}
		return;
	#/
	ERROR: Exception occured: Stack empty.
}

/*
	Name: debug_attack_spots_taken
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9218
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 3882
*/
function debug_attack_spots_taken()
{
	/#
		self notify("stop_debug_breadcrumbs");
		self endon("stop_debug_breadcrumbs");
		while(1)
		{
			if(GetDvarInt("Dev Block strings are not supported") != 2)
			{
				wait(1);
				continue;
			}
			wait(0.05);
			count = 0;
			for(i = 0; i < self.attack_spots_taken.size; i++)
			{
				if(self.attack_spots_taken[i])
				{
					count++;
					circle(self.attack_spots[i], 12, (1, 0, 0), 0, 1, 1);
					continue;
				}
				circle(self.attack_spots[i], 12, (0, 1, 0), 0, 1, 1);
			}
			msg = "Dev Block strings are not supported" + count + "Dev Block strings are not supported" + self.attack_spots_taken.size;
			print3d(self.origin, msg);
		}
	#/
}

/*
	Name: float_print3d
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9390
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 3922
*/
function float_print3d(msg, time)
{
	/#
		self endon("death");
		time = GetTime() + time * 1000;
		offset = VectorScale((0, 0, 1), 72);
		while(GetTime() < time)
		{
			offset = offset + VectorScale((0, 0, 1), 2);
			print3d(self.origin + offset, msg, (1, 1, 1));
			wait(0.05);
		}
	#/
}

/*
	Name: do_player_vo
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9448
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 3947
*/
function do_player_vo(snd, variation_count)
{
	index = get_player_index(self);
	sound = "zmb_vox_plr_" + index + "_" + snd;
	if(isdefined(variation_count))
	{
		sound = sound + "_" + randomIntRange(0, variation_count);
	}
	if(!isdefined(level.player_is_speaking))
	{
		level.player_is_speaking = 0;
	}
	if(level.player_is_speaking == 0)
	{
		level.player_is_speaking = 1;
		self playsoundwithnotify(sound, "sound_done");
		self waittill("sound_done");
		wait(2);
		level.player_is_speaking = 0;
	}
}

/*
	Name: is_magic_bullet_shield_enabled
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9560
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 3979
*/
function is_magic_bullet_shield_enabled(ent)
{
	if(!isdefined(ent))
	{
		return 0;
	}
	return !(isdefined(ent.allowdeath) && ent.allowdeath);
}

/*
	Name: really_play_2D_sound
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x95A8
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 3998
*/
function really_play_2D_sound(sound)
{
	temp_ent = spawn("script_origin", (0, 0, 0));
	temp_ent playsoundwithnotify(sound, sound + "wait");
	temp_ent waittill(sound + "wait");
	wait(0.05);
	temp_ent delete();
}

/*
	Name: play_sound_2d
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9648
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 4017
*/
function play_sound_2d(sound)
{
	level thread really_play_2D_sound(sound);
}

/*
	Name: include_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9678
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 4032
*/
function include_weapon(weapon_name, in_box)
{
	/#
		println("Dev Block strings are not supported" + weapon_name);
	#/
	if(!isdefined(in_box))
	{
		in_box = 1;
	}
	zm_weapons::include_zombie_weapon(weapon_name, in_box);
	return;
	waittillframeend;
}

/*
	Name: trigger_invisible
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x96F0
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 4056
*/
function trigger_invisible(enable)
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i]))
		{
			self setinvisibletoplayer(players[i], enable);
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: print3d_ent
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9780
	Size: 0x130
	Parameters: 6
	Flags: None
	Line Number: 4080
*/
function print3d_ent(text, color, scale, offset, end_msg, overwrite)
{
	self endon("death");
	if(isdefined(overwrite) && overwrite && isdefined(self._debug_print3d_msg))
	{
		self notify("end_print3d");
		wait(0.05);
	}
	self endon("end_print3d");
	if(!isdefined(color))
	{
		color = (1, 1, 1);
	}
	if(!isdefined(scale))
	{
		scale = 1;
	}
	if(!isdefined(offset))
	{
		offset = (0, 0, 0);
	}
	if(isdefined(end_msg))
	{
		self endon(end_msg);
	}
	self._debug_print3d_msg = text;
	/#
		while(!(isdefined(level.disable_print3d_ent) && level.disable_print3d_ent))
		{
			print3d(self.origin + offset, self._debug_print3d_msg, color, scale);
			wait(0.05);
		}
	#/
}

/*
	Name: create_counter_hud
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x98B8
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 4125
*/
function create_counter_hud(x)
{
	if(!isdefined(x))
	{
		x = 0;
	}
	hud = create_simple_hud();
	hud.alignX = "left";
	hud.alignY = "top";
	hud.horzAlign = "user_left";
	hud.vertAlign = "user_top";
	hud.color = (1, 1, 1);
	hud.fontscale = 32;
	hud.x = x;
	hud.alpha = 0;
	hud SetShader("hud_chalk_1", 64, 64);
	return hud;
}

/*
	Name: get_current_zone
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x99C8
	Size: 0x280
	Parameters: 1
	Flags: None
	Line Number: 4154
*/
function get_current_zone(return_zone)
{
	level flag::wait_till("zones_initialized");
	if(isdefined(self.cached_zone))
	{
		zone = self.cached_zone;
		zone_name = self.cached_zone_name;
		VOL = self.cached_zone_volume;
		if(self istouching(zone.Volumes[VOL]))
		{
			if(isdefined(return_zone) && return_zone)
			{
				return zone;
			}
			return zone_name;
		}
		for(i = 0; i < zone.Volumes.size; i++)
		{
			if(i == VOL)
			{
				continue;
			}
			if(self istouching(zone.Volumes[i]))
			{
				self.cached_zone = zone;
				self.cached_zone_volume = i;
				if(isdefined(return_zone) && return_zone)
				{
					return zone;
				}
				return zone_name;
			}
		}
	}
	for(z = 0; z < level.zone_keys.size; z++)
	{
		zone_name = level.zone_keys[z];
		zone = level.zones[zone_name];
		if(zone === self.cached_zone)
		{
			continue;
		}
		for(i = 0; i < zone.Volumes.size; i++)
		{
			if(self istouching(zone.Volumes[i]))
			{
				self.cached_zone = zone;
				self.cached_zone_name = zone_name;
				self.cached_zone_volume = i;
				if(isdefined(return_zone) && return_zone)
				{
					return zone;
				}
				return zone_name;
			}
		}
	}
	self.cached_zone = undefined;
	self.cached_zone_name = undefined;
	self.cached_zone_volume = undefined;
	return undefined;
}

/*
	Name: remove_mod_from_methodofdeath
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9C50
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 4227
*/
function remove_mod_from_methodofdeath(mod)
{
	return mod;
}

/*
	Name: clear_fog_threads
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9C68
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 4242
*/
function clear_fog_threads()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] notify("stop_fog");
	}
}

/*
	Name: display_message
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9CD0
	Size: 0xE0
	Parameters: 3
	Flags: None
	Line Number: 4261
*/
function display_message(titleText, notifyText, duration)
{
	notifyData = spawnstruct();
	notifyData.titleText = notifyText;
	notifyData.notifyText = titleText;
	notifyData.sound = "mus_level_up";
	notifyData.duration = duration;
	notifyData.glowColor = (1, 0, 0);
	notifyData.color = (0, 0, 0);
	notifyData.iconName = "hud_zombies_meat";
	self thread hud_message::notifyMessage(notifyData);
}

/*
	Name: is_quad
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9DB8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 4284
*/
function is_quad()
{
	return self.animName == "quad_zombie";
}

/*
	Name: is_leaper
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9DD8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 4299
*/
function is_leaper()
{
	return self.animName == "leaper_zombie";
}

/*
	Name: shock_onpain
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x9DF8
	Size: 0x298
	Parameters: 0
	Flags: None
	Line Number: 4314
*/
function shock_onpain()
{
	self endon("death");
	self endon("disconnect");
	self notify("stop_shock_onpain");
	self endon("stop_shock_onpain");
	if(GetDvarString("blurpain") == "")
	{
		SetDvar("blurpain", "on");
	}
	while(1)
	{
		oldhealth = self.health;
		self waittill("damage", damage, attacker, direction_vec, point, mod);
		if(isdefined(level.shock_onpain) && !level.shock_onpain)
		{
			continue;
		}
		if(isdefined(self.shock_onpain) && !self.shock_onpain)
		{
			continue;
		}
		if(self.health < 1)
		{
			continue;
		}
		if(isdefined(attacker) && isdefined(attacker.custom_player_shellshock))
		{
			self [[attacker.custom_player_shellshock]](damage, attacker, direction_vec, point, mod);
		}
		else if(mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH")
		{
			continue;
		}
		else if(mod == "MOD_GRENADE_SPLASH" || mod == "MOD_GRENADE" || mod == "MOD_EXPLOSIVE")
		{
			shockType = undefined;
			shockLight = undefined;
			if(isdefined(self.is_burning) && self.is_burning)
			{
				shockType = "lava";
				shockLight = "lava_small";
			}
			self shock_onexplosion(damage, shockType, shockLight);
		}
		else if(GetDvarString("blurpain") == "on")
		{
			self shellshock("pain_zm", 0.5);
		}
	}
}

/*
	Name: shock_onexplosion
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA098
	Size: 0x120
	Parameters: 3
	Flags: None
	Line Number: 4376
*/
function shock_onexplosion(damage, shockType, shockLight)
{
	time = 0;
	scaled_damage = 100 * damage / self.maxhealth;
	if(scaled_damage >= 90)
	{
		time = 4;
	}
	else if(scaled_damage >= 50)
	{
		time = 3;
	}
	else if(scaled_damage >= 25)
	{
		time = 2;
	}
	else if(scaled_damage > 10)
	{
		time = 1;
	}
	if(time)
	{
		if(!isdefined(shockType))
		{
			shockType = "explosion";
		}
		self shellshock(shockType, time);
	}
	else if(isdefined(shockLight))
	{
		self shellshock(shockLight, time);
	}
}

/*
	Name: increment_ignoreme
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA1C0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 4420
*/
function increment_ignoreme()
{
	if(!isdefined(self.ignorme_count))
	{
		self.ignorme_count = 0;
	}
	self.ignorme_count++;
	self.ignoreme = self.ignorme_count > 0;
}

/*
	Name: decrement_ignoreme
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA200
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 4440
*/
function decrement_ignoreme()
{
	if(!isdefined(self.ignorme_count))
	{
		self.ignorme_count = 0;
	}
	if(self.ignorme_count > 0)
	{
		self.ignorme_count--;
	}
	else
	{
		fallback_initiated::ASSERTMSG("Dev Block strings are not supported");
	}
	/#
	#/
	self.ignoreme = self.ignorme_count > 0;
}

/*
	Name: increment_is_drinking
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA270
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 4469
*/
function increment_is_drinking()
{
	/#
		if(isdefined(level.devgui_dpad_watch) && level.devgui_dpad_watch)
		{
			self.IS_DRINKING++;
			return;
		}
	#/
	if(!isdefined(self.IS_DRINKING))
	{
		self.IS_DRINKING = 0;
	}
	if(self.IS_DRINKING == 0)
	{
		self disableOffhandWeapons();
		self DisableWeaponCycling();
	}
	self.IS_DRINKING++;
}

/*
	Name: is_multiple_drinking
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA300
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 4500
*/
function is_multiple_drinking()
{
	return self.IS_DRINKING > 1;
}

/*
	Name: decrement_is_drinking
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA318
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 4515
*/
function decrement_is_drinking()
{
	if(self.IS_DRINKING > 0)
	{
		self.IS_DRINKING--;
	}
	else
	{
		fallback_initiated::ASSERTMSG("Dev Block strings are not supported");
	}
	/#
	#/
	if(self.IS_DRINKING == 0)
	{
		self EnableOffhandWeapons();
		self EnableWeaponCycling();
	}
}

/*
	Name: clear_is_drinking
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA398
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 4544
*/
function clear_is_drinking()
{
	self.IS_DRINKING = 0;
	self EnableOffhandWeapons();
	self EnableWeaponCycling();
}

/*
	Name: increment_no_end_game_check
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA3E0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 4561
*/
function increment_no_end_game_check()
{
	if(!isdefined(level.n_no_end_game_check_count))
	{
		level.n_no_end_game_check_count = 0;
	}
	level.n_no_end_game_check_count++;
	level.no_end_game_check = level.n_no_end_game_check_count > 0;
}

/*
	Name: decrement_no_end_game_check
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA420
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 4581
*/
function decrement_no_end_game_check()
{
	if(!isdefined(level.n_no_end_game_check_count))
	{
		level.n_no_end_game_check_count = 0;
	}
	if(level.n_no_end_game_check_count > 0)
	{
		level.n_no_end_game_check_count--;
	}
	else
	{
		fallback_initiated::ASSERTMSG("Dev Block strings are not supported");
	}
	/#
	#/
	level.no_end_game_check = level.n_no_end_game_check_count > 0;
	if(!level.no_end_game_check)
	{
		level zm::checkForAllDead();
	}
}

/*
	Name: getWeaponClassZM
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA4B0
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 4614
*/
function getWeaponClassZM(weapon)
{
	/#
		fallback_initiated::Assert(isdefined(weapon));
	#/
	if(!isdefined(weapon))
	{
		return undefined;
	}
	if(!isdefined(level.weaponClassArray))
	{
		level.weaponClassArray = [];
	}
	if(isdefined(level.weaponClassArray[weapon]))
	{
		return level.weaponClassArray[weapon];
	}
	baseWeaponIndex = GetBaseWeaponItemIndex(weapon);
	statsTableName = util::getStatsTableName();
	weaponClass = tableLookup(statsTableName, 0, baseWeaponIndex, 2);
	level.weaponClassArray[weapon] = weaponClass;
	return weaponClass;
}

/*
	Name: spawn_weapon_model
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA5B8
	Size: 0xE0
	Parameters: 5
	Flags: None
	Line Number: 4648
*/
function spawn_weapon_model(weapon, model, origin, angles, options)
{
	if(!isdefined(model))
	{
		model = weapon.worldmodel;
	}
	weapon_model = spawn("script_model", origin);
	if(isdefined(angles))
	{
		weapon_model.angles = angles;
	}
	if(isdefined(options))
	{
		weapon_model UseWeaponModel(weapon, model, options);
	}
	else
	{
		weapon_model UseWeaponModel(weapon, model);
	}
	return weapon_model;
}

/*
	Name: spawn_buildkit_weapon_model
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA6A0
	Size: 0xF8
	Parameters: 5
	Flags: None
	Line Number: 4680
*/
function spawn_buildkit_weapon_model(player, weapon, camo, origin, angles)
{
	weapon_model = spawn("script_model", origin);
	if(isdefined(angles))
	{
		weapon_model.angles = angles;
	}
	upgraded = zm_weapons::is_weapon_upgraded(weapon);
	if(upgraded && (!isdefined(camo) || 0 > camo))
	{
		camo = zm_weapons::get_pack_a_punch_camo_index(undefined);
	}
	weapon_model UseBuildKitWeaponModel(player, weapon, camo, upgraded);
	return weapon_model;
}

/*
	Name: is_player_revive_tool
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA7A0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 4706
*/
function is_player_revive_tool(weapon)
{
	if(weapon == level.weaponReviveTool || weapon === self.weaponReviveTool)
	{
		return 1;
	}
	return 0;
}

/*
	Name: is_limited_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA7E0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 4725
*/
function is_limited_weapon(weapon)
{
	if(isdefined(level.limited_weapons) && isdefined(level.limited_weapons[weapon]))
	{
		return 1;
	}
	return 0;
}

/*
	Name: register_lethal_grenade_for_level
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA820
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 4744
*/
function register_lethal_grenade_for_level(weaponName)
{
	weapon = GetWeapon(weaponName);
	if(is_lethal_grenade(weapon))
	{
		return;
	}
	if(!isdefined(level.zombie_lethal_grenade_list))
	{
		level.zombie_lethal_grenade_list = [];
	}
	level.zombie_lethal_grenade_list[weapon] = weapon;
}

/*
	Name: is_lethal_grenade
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA8A0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 4768
*/
function is_lethal_grenade(weapon)
{
	if(!isdefined(weapon) || !isdefined(level.zombie_lethal_grenade_list))
	{
		return 0;
	}
	return isdefined(level.zombie_lethal_grenade_list[weapon]);
}

/*
	Name: is_player_lethal_grenade
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA8E8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 4787
*/
function is_player_lethal_grenade(weapon)
{
	if(!isdefined(weapon) || !isdefined(self.current_lethal_grenade))
	{
		return 0;
	}
	return self.current_lethal_grenade == weapon;
}

/*
	Name: get_player_lethal_grenade
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA928
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 4806
*/
function get_player_lethal_grenade()
{
	grenade = level.weaponNone;
	if(isdefined(self.current_lethal_grenade))
	{
		grenade = self.current_lethal_grenade;
	}
	return grenade;
}

/*
	Name: set_player_lethal_grenade
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA968
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 4826
*/
function set_player_lethal_grenade(weapon)
{
	if(!isdefined(weapon))
	{
		weapon = level.weaponNone;
	}
	self notify("new_lethal_grenade", weapon);
	self.current_lethal_grenade = weapon;
}

/*
	Name: init_player_lethal_grenade
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA9B8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 4846
*/
function init_player_lethal_grenade()
{
	self set_player_lethal_grenade(level.zombie_lethal_grenade_player_init);
}

/*
	Name: register_tactical_grenade_for_level
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xA9E8
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 4861
*/
function register_tactical_grenade_for_level(weaponName)
{
	weapon = GetWeapon(weaponName);
	if(is_tactical_grenade(weapon))
	{
		return;
	}
	if(!isdefined(level.zombie_tactical_grenade_list))
	{
		level.zombie_tactical_grenade_list = [];
	}
	level.zombie_tactical_grenade_list[weapon] = weapon;
}

/*
	Name: is_tactical_grenade
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAA68
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 4885
*/
function is_tactical_grenade(weapon)
{
	if(!isdefined(weapon) || !isdefined(level.zombie_tactical_grenade_list))
	{
		return 0;
	}
	return isdefined(level.zombie_tactical_grenade_list[weapon]);
}

/*
	Name: is_player_tactical_grenade
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAAB0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 4904
*/
function is_player_tactical_grenade(weapon)
{
	if(!isdefined(weapon) || !isdefined(self.current_tactical_grenade))
	{
		return 0;
	}
	return self.current_tactical_grenade == weapon;
}

/*
	Name: get_player_tactical_grenade
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAAF0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 4923
*/
function get_player_tactical_grenade()
{
	Tactical = level.weaponNone;
	if(isdefined(self.current_tactical_grenade))
	{
		Tactical = self.current_tactical_grenade;
	}
	return Tactical;
}

/*
	Name: set_player_tactical_grenade
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAB30
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 4943
*/
function set_player_tactical_grenade(weapon)
{
	if(!isdefined(weapon))
	{
		weapon = level.weaponNone;
	}
	self notify("new_tactical_grenade", weapon);
	self.current_tactical_grenade = weapon;
}

/*
	Name: init_player_tactical_grenade
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAB80
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 4963
*/
function init_player_tactical_grenade()
{
	self set_player_tactical_grenade(level.zombie_tactical_grenade_player_init);
}

/*
	Name: is_placeable_mine
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xABB0
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 4978
*/
function is_placeable_mine(weapon)
{
	if(!isdefined(level.placeable_mines))
	{
		level.placeable_mines = [];
	}
	if(!isdefined(weapon) || weapon == level.weaponNone)
	{
		return 0;
	}
	return isdefined(level.placeable_mines[weapon.name]);
}

/*
	Name: is_player_placeable_mine
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAC18
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 5001
*/
function is_player_placeable_mine(weapon)
{
	if(!isdefined(weapon) || !isdefined(self.current_placeable_mine))
	{
		return 0;
	}
	return self.current_placeable_mine == weapon;
}

/*
	Name: get_player_placeable_mine
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAC58
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 5020
*/
function get_player_placeable_mine()
{
	placeable_mine = level.weaponNone;
	if(isdefined(self.current_placeable_mine))
	{
		placeable_mine = self.current_placeable_mine;
	}
	return placeable_mine;
}

/*
	Name: set_player_placeable_mine
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAC98
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 5040
*/
function set_player_placeable_mine(weapon)
{
	if(!isdefined(weapon))
	{
		weapon = level.weaponNone;
	}
	self notify("new_placeable_mine", weapon);
	self.current_placeable_mine = weapon;
}

/*
	Name: init_player_placeable_mine
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xACE8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 5060
*/
function init_player_placeable_mine()
{
	self set_player_placeable_mine(level.zombie_placeable_mine_player_init);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: register_melee_weapon_for_level
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAD18
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 5077
*/
function register_melee_weapon_for_level(weaponName)
{
	weapon = GetWeapon(weaponName);
	if(is_melee_weapon(weapon))
	{
		return;
	}
	if(!isdefined(level.zombie_melee_weapon_list))
	{
		level.zombie_melee_weapon_list = [];
	}
	level.zombie_melee_weapon_list[weapon] = weapon;
}

/*
	Name: is_melee_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAD98
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 5101
*/
function is_melee_weapon(weapon)
{
	if(!isdefined(weapon) || !isdefined(level.zombie_melee_weapon_list) || weapon == GetWeapon("none"))
	{
		return 0;
	}
	return isdefined(level.zombie_melee_weapon_list[weapon]);
}

/*
	Name: is_player_melee_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAE00
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 5120
*/
function is_player_melee_weapon(weapon)
{
	if(!isdefined(weapon) || !isdefined(self.current_melee_weapon))
	{
		return 0;
	}
	return self.current_melee_weapon == weapon;
}

/*
	Name: get_player_melee_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAE40
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 5139
*/
function get_player_melee_weapon()
{
	melee_weapon = level.weaponNone;
	if(isdefined(self.current_melee_weapon))
	{
		melee_weapon = self.current_melee_weapon;
	}
	return melee_weapon;
}

/*
	Name: set_player_melee_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAE80
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 5159
*/
function set_player_melee_weapon(weapon)
{
	if(!isdefined(weapon))
	{
		weapon = level.weaponNone;
	}
	self notify("new_melee_weapon", weapon);
	self.current_melee_weapon = weapon;
}

/*
	Name: init_player_melee_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAED0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 5179
*/
function init_player_melee_weapon()
{
	self set_player_melee_weapon(level.zombie_melee_weapon_player_init);
}

/*
	Name: register_hero_weapon_for_level
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAF00
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 5194
*/
function register_hero_weapon_for_level(weaponName)
{
	weapon = GetWeapon(weaponName);
	if(is_hero_weapon(weapon))
	{
		return;
	}
	if(!isdefined(level.zombie_hero_weapon_list))
	{
		level.zombie_hero_weapon_list = [];
	}
	level.zombie_hero_weapon_list[weapon] = weapon;
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: is_hero_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAF80
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 5221
*/
function is_hero_weapon(weapon)
{
	if(!isdefined(weapon) || !isdefined(level.zombie_hero_weapon_list))
	{
		return 0;
	}
	return isdefined(level.zombie_hero_weapon_list[weapon]);
}

/*
	Name: is_player_hero_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xAFC8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 5240
*/
function is_player_hero_weapon(weapon)
{
	if(!isdefined(weapon) || !isdefined(self.current_hero_weapon))
	{
		return 0;
	}
	return self.current_hero_weapon == weapon;
}

/*
	Name: get_player_hero_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB008
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 5259
*/
function get_player_hero_weapon()
{
	hero_weapon = level.weaponNone;
	if(isdefined(self.current_hero_weapon))
	{
		hero_weapon = self.current_hero_weapon;
	}
	return hero_weapon;
}

/*
	Name: set_player_hero_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB048
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 5279
*/
function set_player_hero_weapon(weapon)
{
	if(!isdefined(weapon))
	{
		weapon = level.weaponNone;
	}
	self notify("new_hero_weapon", weapon);
	self.current_hero_weapon = weapon;
	return;
}

/*
	Name: init_player_hero_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB098
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 5300
*/
function init_player_hero_weapon()
{
	self set_player_hero_weapon(level.zombie_hero_weapon_player_init);
}

/*
	Name: has_player_hero_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB0C8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 5315
*/
function has_player_hero_weapon()
{
	return isdefined(self.current_hero_weapon) && self.current_hero_weapon != level.weaponNone;
}

/*
	Name: should_watch_for_emp
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB0F0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 5330
*/
function should_watch_for_emp()
{
	return isdefined(level.should_watch_for_emp) && level.should_watch_for_emp;
}

/*
	Name: register_offhand_weapons_for_level_defaults
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB110
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 5345
*/
function register_offhand_weapons_for_level_defaults()
{
	if(isdefined(level.register_offhand_weapons_for_level_defaults_override))
	{
		[[level.register_offhand_weapons_for_level_defaults_override]]();
		return;
	}
	register_lethal_grenade_for_level("frag_grenade");
	level.zombie_lethal_grenade_player_init = GetWeapon("frag_grenade");
	register_tactical_grenade_for_level("cymbal_monkey");
	level.zombie_tactical_grenade_player_init = undefined;
	level.zombie_placeable_mine_player_init = undefined;
	register_melee_weapon_for_level("knife");
	register_melee_weapon_for_level("bowie_knife");
	level.zombie_melee_weapon_player_init = GetWeapon("knife");
	level.zombie_equipment_player_init = undefined;
}

/*
	Name: init_player_offhand_weapons
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB1F8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 5373
*/
function init_player_offhand_weapons()
{
	init_player_lethal_grenade();
	init_player_tactical_grenade();
	init_player_placeable_mine();
	init_player_melee_weapon();
	init_player_hero_weapon();
	zm_equipment::init_player_equipment();
}

/*
	Name: is_offhand_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB268
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 5393
*/
function is_offhand_weapon(weapon)
{
	return is_lethal_grenade(weapon) || is_tactical_grenade(weapon) || is_placeable_mine(weapon) || is_melee_weapon(weapon) || is_hero_weapon(weapon) || zm_equipment::is_equipment(weapon);
	ERROR: Bad function call
}

/*
	Name: is_player_offhand_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB310
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 5409
*/
function is_player_offhand_weapon(weapon)
{
	return self is_player_lethal_grenade(weapon) || self is_player_tactical_grenade(weapon) || self is_player_placeable_mine(weapon) || self is_player_melee_weapon(weapon) || self is_player_hero_weapon(weapon) || self zm_equipment::is_player_equipment(weapon);
}

/*
	Name: has_powerup_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB3B8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 5424
*/
function has_powerup_weapon()
{
	return isdefined(self.has_powerup_weapon) && self.has_powerup_weapon;
}

/*
	Name: has_hero_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB3D8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 5439
*/
function has_hero_weapon()
{
	weapon = self GetCurrentWeapon();
	return isdefined(weapon.isHeroWeapon) && weapon.isHeroWeapon;
}

/*
	Name: give_start_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB430
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 5455
*/
function give_start_weapon(b_switch_weapon)
{
	if(!isdefined(self.hasCompletedSuperEE))
	{
		self.hasCompletedSuperEE = self zm_stats::get_global_stat("DARKOPS_GENESIS_SUPER_EE") > 0;
	}
	var_192a8b9 = level.start_weapon;
	if(self.hasCompletedSuperEE)
	{
		self zm_weapons::weapon_give(var_192a8b9, 0, 0, 1, 0);
		self giveMaxAmmo(var_192a8b9);
		self zm_weapons::weapon_give(level.super_ee_weapon, 0, 0, 1, b_switch_weapon);
	}
	else
	{
		self zm_weapons::weapon_give(var_192a8b9, 0, 0, 1, b_switch_weapon);
	}
}

/*
	Name: array_flag_wait_any
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB528
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 5484
*/
function array_flag_wait_any(flag_array)
{
	if(!isdefined(level._array_flag_wait_any_calls))
	{
		level._n_array_flag_wait_any_calls = 0;
	}
	else
	{
		level._n_array_flag_wait_any_calls++;
	}
	str_condition = "array_flag_wait_call_" + level._n_array_flag_wait_any_calls;
	for(index = 0; index < flag_array.size; index++)
	{
		level thread array_flag_wait_any_thread(flag_array[index], str_condition);
	}
	level waittill(str_condition);
}

/*
	Name: array_flag_wait_any_thread
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB5D8
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 5512
*/
function array_flag_wait_any_thread(flag_name, condition)
{
	level endon(condition);
	level flag::wait_till(flag_name);
	level notify(condition);
}

/*
	Name: GROUNDPOS
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB620
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 5529
*/
function GROUNDPOS(origin)
{
	return bullettrace(origin, origin + VectorScale((0, 0, -1), 100000), 0, self)["position"];
}

/*
	Name: groundpos_ignore_water
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB668
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 5544
*/
function groundpos_ignore_water(origin)
{
	return bullettrace(origin, origin + VectorScale((0, 0, -1), 100000), 0, self, 1)["position"];
}

/*
	Name: groundpos_ignore_water_new
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB6B8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 5559
*/
function groundpos_ignore_water_new(origin)
{
	return GroundTrace(origin, origin + VectorScale((0, 0, -1), 100000), 0, self, 1)["position"];
}

/*
	Name: self_delete
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB708
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 5574
*/
function self_delete()
{
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: ignore_triggers
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB738
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 5592
*/
function ignore_triggers(timer)
{
	self endon("death");
	self.ignoreTriggers = 1;
	if(isdefined(timer))
	{
		wait(timer);
	}
	else
	{
		wait(0.5);
	}
	self.ignoreTriggers = 0;
}

/*
	Name: giveachievement_wrapper
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB790
	Size: 0x238
	Parameters: 2
	Flags: None
	Line Number: 5617
*/
function giveachievement_wrapper(achievement, all_players)
{
	if(achievement == "")
	{
		return;
	}
	if(isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats)
	{
		return;
	}
	achievement_lower = ToLower(achievement);
	global_counter = 0;
	if(isdefined(all_players) && all_players)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] GiveAchievement(achievement);
			has_achievement = 0;
			if(!(isdefined(has_achievement) && has_achievement))
			{
				global_counter++;
			}
			if(IsSplitscreen() && i == 0 || !IsSplitscreen())
			{
				if(isdefined(level.achievement_sound_func))
				{
					players[i] thread [[level.achievement_sound_func]](achievement_lower);
				}
			}
		}
	}
	else if(!isPlayer(self))
	{
		/#
			println("Dev Block strings are not supported");
			return;
		#/
	}
	self GiveAchievement(achievement);
	has_achievement = 0;
	if(!(isdefined(has_achievement) && has_achievement))
	{
		global_counter++;
	}
	if(isdefined(level.achievement_sound_func))
	{
		self thread [[level.achievement_sound_func]](achievement_lower);
	}
	if(global_counter)
	{
		incrementCounter("global_" + achievement_lower, global_counter);
	}
}

/*
	Name: GetYaw
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xB9D0
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 5682
*/
function GetYaw(org)
{
	angles = VectorToAngles(org - self.origin);
	return angles[1];
}

/*
	Name: GetYawToSpot
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBA20
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 5698
*/
function GetYawToSpot(spot)
{
	pos = spot;
	yaw = self.angles[1] - GetYaw(pos);
	yaw = AngleClamp180(yaw);
	return yaw;
}

/*
	Name: disable_react
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBAA0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 5716
*/
function disable_react()
{
	/#
		fallback_initiated::Assert(isalive(self), "Dev Block strings are not supported");
	#/
	self.a.disableReact = 1;
	self.allowReact = 0;
	return;
	waittillframeend;
}

/*
	Name: enable_react
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBB00
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 5737
*/
function enable_react()
{
	/#
		fallback_initiated::Assert(isalive(self), "Dev Block strings are not supported");
	#/
	self.a.disableReact = 0;
	self.allowReact = 1;
}

/*
	Name: bullet_attack
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBB60
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 5756
*/
function bullet_attack(type)
{
	if(type == "MOD_PISTOL_BULLET")
	{
		return 1;
	}
	return type == "MOD_RIFLE_BULLET";
}

/*
	Name: pick_up
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBB98
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 5775
*/
function pick_up()
{
	player = self.owner;
	self destroy_ent();
	clip_ammo = player GetWeaponAmmoClip(self.weapon);
	clip_max_ammo = self.weapon.clipSize;
	if(clip_ammo < clip_max_ammo)
	{
		clip_ammo++;
	}
	player SetWeaponAmmoClip(self.weapon, clip_ammo);
}

/*
	Name: destroy_ent
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBC50
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 5798
*/
function destroy_ent()
{
	self delete();
}

/*
	Name: waittill_not_moving
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBC78
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 5813
*/
function waittill_not_moving()
{
	self endon("death");
	self endon("disconnect");
	self endon("detonated");
	level endon("game_ended");
	if(self.classname == "grenade")
	{
		self waittill("stationary");
	}
	else
	{
		prevOrigin = self.origin;
		while(1)
		{
			wait(0.15);
			if(self.origin == prevOrigin)
			{
				break;
			}
			prevOrigin = self.origin;
		}
	}
}

/*
	Name: get_closest_player
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBD20
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 5848
*/
function get_closest_player(org)
{
	players = [];
	players = GetPlayers();
	return ArrayGetClosest(org, players);
}

/*
	Name: ent_flag_init_ai_standards
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBD78
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 5865
*/
function ent_flag_init_ai_standards()
{
	message_array = [];
	message_array[message_array.size] = "goal";
	message_array[message_array.size] = "damage";
	for(i = 0; i < message_array.size; i++)
	{
		self flag::init(message_array[i]);
		self thread ent_flag_wait_ai_standards(message_array[i]);
	}
}

/*
	Name: ent_flag_wait_ai_standards
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBE28
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 5887
*/
function ent_flag_wait_ai_standards(message)
{
	self endon("death");
	self waittill(message);
	self.ent_flag[message] = 1;
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: flat_angle
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBE68
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 5907
*/
function flat_angle(angle)
{
	rAngle = (0, angle[1], 0);
	return rAngle;
}

/*
	Name: clear_run_anim
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBEA0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 5923
*/
function clear_run_anim()
{
	self.alwaysRunForward = undefined;
	self.a.combatrunanim = undefined;
	self.run_noncombatanim = undefined;
	self.walk_combatanim = undefined;
	self.walk_noncombatanim = undefined;
	self.preCombatRunEnabled = 1;
}

/*
	Name: track_players_intersection_tracker
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xBEF0
	Size: 0x3E0
	Parameters: 0
	Flags: None
	Line Number: 5943
*/
function track_players_intersection_tracker()
{
	self endon("disconnect");
	self endon("death");
	level endon("end_game");
	wait(5);
	while(1)
	{
		killed_players = 0;
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] laststand::player_is_in_laststand() || "playing" != players[i].sessionstate)
			{
				continue;
			}
			for(j = 0; j < players.size; j++)
			{
				if(i == j || players[j] laststand::player_is_in_laststand() || "playing" != players[j].sessionstate)
				{
					continue;
				}
				if(isdefined(level.player_intersection_tracker_override))
				{
					if(players[i] [[level.player_intersection_tracker_override]](players[j]))
					{
						continue;
					}
				}
				playerI_origin = players[i].origin;
				playerJ_origin = players[j].origin;
				if(Abs(playerI_origin[2] - playerJ_origin[2]) > 60)
				{
					continue;
				}
				distance_apart = Distance2D(playerI_origin, playerJ_origin);
				if(Abs(distance_apart) > 18)
				{
					continue;
				}
				/#
					IPrintLnBold("Dev Block strings are not supported");
				#/
				players[i] DoDamage(1000, (0, 0, 0));
				players[j] DoDamage(1000, (0, 0, 0));
				if(!killed_players)
				{
					players[i] playlocalsound(level.zmb_laugh_alias);
				}
				players[i] zm_stats::increment_map_cheat_stat("cheat_too_friendly");
				players[i] zm_stats::increment_client_stat("cheat_too_friendly", 0);
				players[i] zm_stats::increment_client_stat("cheat_total", 0);
				players[j] zm_stats::increment_map_cheat_stat("cheat_too_friendly");
				players[j] zm_stats::increment_client_stat("cheat_too_friendly", 0);
				players[j] zm_stats::increment_client_stat("cheat_total", 0);
				killed_players = 1;
			}
		}
		wait(0.5);
	}
}

/*
	Name: is_player_looking_at
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xC2D8
	Size: 0x170
	Parameters: 4
	Flags: None
	Line Number: 6015
*/
function is_player_looking_at(origin, dot, do_trace, ignore_ent)
{
	/#
		fallback_initiated::Assert(isPlayer(self), "Dev Block strings are not supported");
	#/
	if(!isdefined(dot))
	{
		dot = 0.7;
	}
	if(!isdefined(do_trace))
	{
		do_trace = 1;
	}
	eye = self util::get_eye();
	delta_vec = AnglesToForward(VectorToAngles(origin - eye));
	view_vec = AnglesToForward(self getPlayerAngles());
	new_dot = VectorDot(delta_vec, view_vec);
	if(new_dot >= dot)
	{
		if(do_trace)
		{
			return BulletTracePassed(origin, eye, 0, ignore_ent);
		}
		else
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: add_gametype
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xC450
	Size: 0x28
	Parameters: 4
	Flags: None
	Line Number: 6056
*/
function add_gametype(gt, dummy1, name, dummy2)
{
}

/*
	Name: add_gameloc
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xC480
	Size: 0x28
	Parameters: 4
	Flags: None
	Line Number: 6070
*/
function add_gameloc(GL, dummy1, name, dummy2)
{
}

/*
	Name: get_closest_index
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xC4B0
	Size: 0xF8
	Parameters: 3
	Flags: None
	Line Number: 6084
*/
function get_closest_index(org, Array, dist)
{
	if(!isdefined(dist))
	{
		dist = 9999999;
	}
	distSq = dist * dist;
	if(Array.size < 1)
	{
		return;
	}
	index = undefined;
	for(i = 0; i < Array.size; i++)
	{
		newdistsq = DistanceSquared(Array[i].origin, org);
		if(newdistsq >= distSq)
		{
			continue;
		}
		distSq = newdistsq;
		index = i;
	}
	return index;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: is_valid_zombie_spawn_point
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xC5B0
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 6120
*/
function is_valid_zombie_spawn_point(point)
{
	liftedorigin = point.origin + VectorScale((0, 0, 1), 5);
	SIZE = 48;
	height = 64;
	mins = (-1 * SIZE, -1 * SIZE, 0);
	maxs = (SIZE, SIZE, height);
	absmins = liftedorigin + mins;
	absmaxs = liftedorigin + maxs;
	if(BoundsWouldTelefrag(absmins, absmaxs))
	{
		return 0;
	}
	return 1;
}

/*
	Name: get_closest_index_to_entity
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xC6B0
	Size: 0x148
	Parameters: 4
	Flags: None
	Line Number: 6146
*/
function get_closest_index_to_entity(entity, Array, dist, extra_check)
{
	org = entity.origin;
	if(!isdefined(dist))
	{
		dist = 9999999;
	}
	distSq = dist * dist;
	if(Array.size < 1)
	{
		return;
	}
	index = undefined;
	for(i = 0; i < Array.size; i++)
	{
		if(isdefined(extra_check) && ![[extra_check]](entity, Array[i]))
		{
			continue;
		}
		newdistsq = DistanceSquared(Array[i].origin, org);
		if(newdistsq >= distSq)
		{
			continue;
		}
		distSq = newdistsq;
		index = i;
	}
	return index;
}

/*
	Name: set_gamemode_var
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xC800
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 6186
*/
function set_gamemode_var(gvar, VAL)
{
	if(!isdefined(game["gamemode_match"]))
	{
		game["gamemode_match"] = [];
	}
	game["gamemode_match"][gvar] = VAL;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: set_gamemode_var_once
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xC858
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 6207
*/
function set_gamemode_var_once(gvar, VAL)
{
	if(!isdefined(game["gamemode_match"]))
	{
		game["gamemode_match"] = [];
	}
	if(!isdefined(game["gamemode_match"][gvar]))
	{
		game["gamemode_match"][gvar] = VAL;
	}
}

/*
	Name: set_game_var
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xC8C8
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 6229
*/
function set_game_var(gvar, VAL)
{
	game[gvar] = VAL;
	return;
	~game[gvar];
	ERROR: Exception occured: Stack empty.
}

/*
	Name: set_game_var_once
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xC8F8
	Size: 0x30
	Parameters: 2
	Flags: None
	Line Number: 6247
*/
function set_game_var_once(gvar, VAL)
{
	if(!isdefined(game[gvar]))
	{
		game[gvar] = VAL;
	}
}

/*
	Name: get_game_var
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xC930
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 6265
*/
function get_game_var(gvar)
{
	if(isdefined(game[gvar]))
	{
		return game[gvar];
	}
	return undefined;
}

/*
	Name: get_gamemode_var
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xC960
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 6284
*/
function get_gamemode_var(gvar)
{
	if(isdefined(game["gamemode_match"]) && isdefined(game["gamemode_match"][gvar]))
	{
		return game["gamemode_match"][gvar];
	}
	return undefined;
}

/*
	Name: waittill_subset
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xC9B0
	Size: 0x1F0
	Parameters: 6
	Flags: None
	Line Number: 6303
*/
function waittill_subset(min_num, string1, string2, string3, string4, string5)
{
	self endon("death");
	ent = spawnstruct();
	ent.threads = 0;
	returned_threads = 0;
	if(isdefined(string1))
	{
		self thread util::waittill_string(string1, ent);
		ent.threads++;
	}
	if(isdefined(string2))
	{
		self thread util::waittill_string(string2, ent);
		ent.threads++;
	}
	if(isdefined(string3))
	{
		self thread util::waittill_string(string3, ent);
		ent.threads++;
	}
	if(isdefined(string4))
	{
		self thread util::waittill_string(string4, ent);
		ent.threads++;
	}
	if(isdefined(string5))
	{
		self thread util::waittill_string(string5, ent);
		ent.threads++;
	}
	while(ent.threads)
	{
		ent waittill("returned");
		ent.threads--;
		returned_threads++;
		if(returned_threads >= min_num)
		{
			break;
		}
	}
	ent notify("die");
}

/*
	Name: is_headshot
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xCBA8
	Size: 0xA8
	Parameters: 3
	Flags: None
	Line Number: 6357
*/
function is_headshot(weapon, sHitLoc, sMeansOfDeath)
{
	if(!isdefined(sHitLoc))
	{
		return 0;
	}
	if(sHitLoc != "head" && sHitLoc != "helmet")
	{
		return 0;
	}
	if(sMeansOfDeath == "MOD_IMPACT" && weapon.isBallisticKnife)
	{
		return 1;
	}
	return sMeansOfDeath != "MOD_MELEE" && sMeansOfDeath != "MOD_IMPACT" && sMeansOfDeath != "MOD_UNKNOWN";
}

/*
	Name: is_jumping
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xCC58
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 6384
*/
function is_jumping()
{
	ground_ent = self GetGroundEnt();
	return !isdefined(ground_ent);
}

/*
	Name: is_explosive_damage
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xCC90
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 6400
*/
function is_explosive_damage(mod)
{
	if(!isdefined(mod))
	{
		return 0;
	}
	if(mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH" || mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH" || mod == "MOD_EXPLOSIVE")
	{
		return 1;
	}
	return 0;
}

/*
	Name: sndSwitchAnnouncerVox
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xCD10
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 6423
*/
function sndSwitchAnnouncerVox(who)
{
	switch(who)
	{
		case "sam":
		{
			game["zmbdialog"]["prefix"] = "vox_zmba_sam";
			level.zmb_laugh_alias = "zmb_laugh_sam";
			level.sndAnnouncerIsRich = 0;
			break;
		}
	}
	return;
}

/*
	Name: do_player_general_vox
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xCD80
	Size: 0xB8
	Parameters: 4
	Flags: None
	Line Number: 6448
*/
function do_player_general_vox(category, type, timer, chance)
{
	if(isdefined(timer) && isdefined(level.votimer[type]) && level.votimer[type] > 0)
	{
		return;
	}
	self thread zm_audio::create_and_play_dialog(category, type);
	if(isdefined(timer))
	{
		level.votimer[type] = timer;
		level thread general_vox_timer(level.votimer[type], type);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: general_vox_timer
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xCE40
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 6474
*/
function general_vox_timer(timer, type)
{
	level endon("end_game");
	/#
		println("Dev Block strings are not supported" + type + "Dev Block strings are not supported" + timer + "Dev Block strings are not supported");
	#/
	while(timer > 0)
	{
		wait(1);
		timer--;
	}
	level.votimer[type] = timer;
	/#
		println("Dev Block strings are not supported" + type + "Dev Block strings are not supported" + timer + "Dev Block strings are not supported");
	#/
}

/*
	Name: create_vox_timer
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xCF10
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 6501
*/
function create_vox_timer(type)
{
	level.votimer[type] = 0;
}

/*
	Name: play_vox_to_player
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xCF38
	Size: 0x20
	Parameters: 3
	Flags: None
	Line Number: 6516
*/
function play_vox_to_player(category, type, force_variant)
{
}

/*
	Name: is_favorite_weapon
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xCF60
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 6530
*/
function is_favorite_weapon(weapon_to_check)
{
	if(!isdefined(self.favorite_wall_weapons_list))
	{
		return 0;
	}
	foreach(weapon in self.favorite_wall_weapons_list)
	{
		if(weapon_to_check == weapon)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: add_vox_response_chance
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xD010
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 6556
*/
function add_vox_response_chance(event, chance)
{
	level.response_chances[event] = chance;
}

/*
	Name: set_demo_intermission_point
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xD040
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 6571
*/
function set_demo_intermission_point()
{
	Spawnpoints = GetEntArray("mp_global_intermission", "classname");
	if(!Spawnpoints.size)
	{
		return;
	}
	spawnpoint = Spawnpoints[0];
	match_string = "";
	location = level.scr_zm_map_start_location;
	if(location == "default" || location == "" && isdefined(level.default_start_location))
	{
		location = level.default_start_location;
	}
	match_string = level.scr_zm_ui_gametype + "_" + location;
	for(i = 0; i < Spawnpoints.size; i++)
	{
		if(isdefined(Spawnpoints[i].script_string))
		{
			tokens = StrTok(Spawnpoints[i].script_string, " ");
			foreach(token in tokens)
			{
				if(token == match_string)
				{
					spawnpoint = Spawnpoints[i];
					i = Spawnpoints.size;
					break;
				}
			}
		}
	}
	setDemoIntermissionPoint(spawnpoint.origin, spawnpoint.angles);
}

/*
	Name: register_map_navcard
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xD260
	Size: 0x30
	Parameters: 2
	Flags: None
	Line Number: 6615
*/
function register_map_navcard(navcard_on_map, navcard_needed_for_computer)
{
	level.navcard_needed = navcard_needed_for_computer;
	level.map_navcard = navcard_on_map;
	return;
}

/*
	Name: does_player_have_map_navcard
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xD298
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 6632
*/
function does_player_have_map_navcard(player)
{
	return player zm_stats::get_global_stat(level.map_navcard);
}

/*
	Name: does_player_have_correct_navcard
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xD2D0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 6647
*/
function does_player_have_correct_navcard(player)
{
	if(!isdefined(level.navcard_needed))
	{
		return 0;
	}
	return player zm_stats::get_global_stat(level.navcard_needed);
}

/*
	Name: place_navcard
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xD318
	Size: 0x360
	Parameters: 4
	Flags: None
	Line Number: 6666
*/
function place_navcard(STR_MODEL, str_stat, org, angles)
{
	navcard = spawn("script_model", org);
	navcard SetModel(STR_MODEL);
	navcard.angles = angles;
	wait(1);
	navcard_pickup_trig = spawn("trigger_radius_use", org, 0, 84, 72);
	navcard_pickup_trig setcursorhint("HINT_NOICON");
	navcard_pickup_trig setHintString(&"ZOMBIE_NAVCARD_PICKUP");
	navcard_pickup_trig TriggerIgnoreTeam();
	a_navcard_stats = Array("navcard_held_zm_transit", "navcard_held_zm_highrise", "navcard_held_zm_buried");
	is_holding_card = 0;
	str_placing_stat = undefined;
	while(1)
	{
		navcard_pickup_trig waittill("trigger", who);
		if(is_player_valid(who))
		{
			foreach(str_cur_stat in a_navcard_stats)
			{
				if(who zm_stats::get_global_stat(str_cur_stat))
				{
					str_placing_stat = str_cur_stat;
					is_holding_card = 1;
					who zm_stats::set_global_stat(str_cur_stat, 0);
				}
			}
			who playsound("zmb_buildable_piece_add");
			who zm_stats::set_global_stat(str_stat, 1);
			who.navcard_grabbed = str_stat;
			util::wait_network_frame();
			is_stat = who zm_stats::get_global_stat(str_stat);
			thread sq_refresh_player_navcard_hud();
			break;
		}
	}
	navcard delete();
	navcard_pickup_trig delete();
	if(is_holding_card)
	{
		level thread place_navcard(STR_MODEL, str_placing_stat, org, angles);
	}
}

/*
	Name: sq_refresh_player_navcard_hud
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xD680
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 6720
*/
function sq_refresh_player_navcard_hud()
{
	if(!isdefined(level.navcards))
	{
		return;
	}
	players = GetPlayers();
	foreach(player in players)
	{
		player thread sq_refresh_player_navcard_hud_internal();
	}
}

/*
	Name: sq_refresh_player_navcard_hud_internal
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xD740
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 6743
*/
function sq_refresh_player_navcard_hud_internal()
{
	self endon("disconnect");
	navcard_bits = 0;
	for(i = 0; i < level.navcards.size; i++)
	{
		hasit = self zm_stats::get_global_stat(level.navcards[i]);
		if(isdefined(self.navcard_grabbed) && self.navcard_grabbed == level.navcards[i])
		{
			hasit = 1;
		}
		if(hasit)
		{
			navcard_bits = navcard_bits + 1 << i;
		}
	}
	util::wait_network_frame();
	self clientfield::set("navcard_held", 0);
	if(navcard_bits > 0)
	{
		util::wait_network_frame();
		self clientfield::set("navcard_held", navcard_bits);
	}
}

/*
	Name: disable_player_move_states
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xD888
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 6778
*/
function disable_player_move_states(forceStanceChange)
{
	self AllowCrouch(1);
	self AllowLean(0);
	self AllowAds(0);
	self AllowSprint(0);
	self allowprone(0);
	self AllowMelee(0);
	if(isdefined(forceStanceChange) && forceStanceChange == 1)
	{
		if(self GetStance() == "prone")
		{
			self SetStance("crouch");
		}
	}
}

/*
	Name: enable_player_move_states
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xD988
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 6805
*/
function enable_player_move_states()
{
	if(!isdefined(self._allow_lean) || self._allow_lean == 1)
	{
		self AllowLean(1);
	}
	if(!isdefined(self._allow_ads) || self._allow_ads == 1)
	{
		self AllowAds(1);
	}
	if(!isdefined(self._allow_sprint) || self._allow_sprint == 1)
	{
		self AllowSprint(1);
	}
	if(!isdefined(self._allow_prone) || self._allow_prone == 1)
	{
		self allowprone(1);
	}
	if(!isdefined(self._allow_melee) || self._allow_melee == 1)
	{
		self AllowMelee(1);
	}
}

/*
	Name: check_and_create_node_lists
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xDAB0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 6839
*/
function check_and_create_node_lists()
{
	if(!isdefined(level._link_node_list))
	{
		level._link_node_list = [];
	}
	if(!isdefined(level._unlink_node_list))
	{
		level._unlink_node_list = [];
	}
}

/*
	Name: link_nodes
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xDAF0
	Size: 0x230
	Parameters: 3
	Flags: None
	Line Number: 6861
*/
function link_nodes(a, b, bDontUnlinkOnMigrate)
{
	if(!isdefined(bDontUnlinkOnMigrate))
	{
		bDontUnlinkOnMigrate = 0;
	}
	if(NodesAreLinked(a, b))
	{
		return;
	}
	check_and_create_node_lists();
	a_index_string = "" + a.origin;
	b_index_string = "" + b.origin;
	if(!isdefined(level._link_node_list[a_index_string]))
	{
		level._link_node_list[a_index_string] = spawnstruct();
		level._link_node_list[a_index_string].node = a;
		level._link_node_list[a_index_string].links = [];
		level._link_node_list[a_index_string].ignore_on_migrate = [];
	}
	if(!isdefined(level._link_node_list[a_index_string].links[b_index_string]))
	{
		level._link_node_list[a_index_string].links[b_index_string] = b;
		level._link_node_list[a_index_string].ignore_on_migrate[b_index_string] = bDontUnlinkOnMigrate;
	}
	if(isdefined(level._unlink_node_list[a_index_string]))
	{
		if(isdefined(level._unlink_node_list[a_index_string].links[b_index_string]))
		{
			level._unlink_node_list[a_index_string].links[b_index_string] = undefined;
			level._unlink_node_list[a_index_string].ignore_on_migrate[b_index_string] = undefined;
		}
	}
	LinkNodes(a, b);
}

/*
	Name: unlink_nodes
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xDD28
	Size: 0x230
	Parameters: 3
	Flags: None
	Line Number: 6907
*/
function unlink_nodes(a, b, bDontLinkOnMigrate)
{
	if(!isdefined(bDontLinkOnMigrate))
	{
		bDontLinkOnMigrate = 0;
	}
	if(!NodesAreLinked(a, b))
	{
		return;
	}
	check_and_create_node_lists();
	a_index_string = "" + a.origin;
	b_index_string = "" + b.origin;
	if(!isdefined(level._unlink_node_list[a_index_string]))
	{
		level._unlink_node_list[a_index_string] = spawnstruct();
		level._unlink_node_list[a_index_string].node = a;
		level._unlink_node_list[a_index_string].links = [];
		level._unlink_node_list[a_index_string].ignore_on_migrate = [];
	}
	if(!isdefined(level._unlink_node_list[a_index_string].links[b_index_string]))
	{
		level._unlink_node_list[a_index_string].links[b_index_string] = b;
		level._unlink_node_list[a_index_string].ignore_on_migrate[b_index_string] = bDontLinkOnMigrate;
	}
	if(isdefined(level._link_node_list[a_index_string]))
	{
		if(isdefined(level._link_node_list[a_index_string].links[b_index_string]))
		{
			level._link_node_list[a_index_string].links[b_index_string] = undefined;
			level._link_node_list[a_index_string].ignore_on_migrate[b_index_string] = undefined;
		}
	}
	UnlinkNodes(a, b);
	return;
}

/*
	Name: spawn_path_node
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xDF60
	Size: 0x140
	Parameters: 6
	Flags: None
	Line Number: 6954
*/
function spawn_path_node(origin, angles, k1, v1, k2, v2)
{
	if(!isdefined(level._spawned_path_nodes))
	{
		level._spawned_path_nodes = [];
	}
	node = spawnstruct();
	node.origin = origin;
	node.angles = angles;
	node.k1 = k1;
	node.v1 = v1;
	node.k2 = k2;
	node.v2 = v2;
	node.node = spawn_path_node_internal(origin, angles, k1, v1, k2, v2);
	level._spawned_path_nodes[level._spawned_path_nodes.size] = node;
	return node.node;
}

/*
	Name: spawn_path_node_internal
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE0A8
	Size: 0xD0
	Parameters: 6
	Flags: None
	Line Number: 6982
*/
function spawn_path_node_internal(origin, angles, k1, v1, k2, v2)
{
	if(isdefined(k2))
	{
		return SpawnPathNode("node_pathnode", origin, angles, k1, v1, k2, v2);
	}
	else if(isdefined(k1))
	{
		return SpawnPathNode("node_pathnode", origin, angles, k1, v1);
	}
	else
	{
		return SpawnPathNode("node_pathnode", origin, angles);
	}
	return undefined;
}

/*
	Name: delete_spawned_path_nodes
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE180
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 7009
*/
function delete_spawned_path_nodes()
{
}

/*
	Name: respawn_path_nodes
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE190
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 7023
*/
function respawn_path_nodes()
{
	if(!isdefined(level._spawned_path_nodes))
	{
		return;
	}
	for(i = 0; i < level._spawned_path_nodes.size; i++)
	{
		node_struct = level._spawned_path_nodes[i];
		/#
			println("Dev Block strings are not supported" + node_struct.origin);
		#/
		node_struct.node = spawn_path_node_internal(node_struct.origin, node_struct.angles, node_struct.k1, node_struct.v1, node_struct.k2, node_struct.v2);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: link_changes_internal_internal
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE288
	Size: 0x238
	Parameters: 2
	Flags: None
	Line Number: 7051
*/
function link_changes_internal_internal(List, func)
{
	keys = getArrayKeys(List);
	for(i = 0; i < keys.size; i++)
	{
		node = List[keys[i]].node;
		node_keys = getArrayKeys(List[keys[i]].links);
		for(j = 0; j < node_keys.size; j++)
		{
			if(isdefined(List[keys[i]].links[node_keys[j]]))
			{
				if(isdefined(List[keys[i]].ignore_on_migrate[node_keys[j]]) && List[keys[i]].ignore_on_migrate[node_keys[j]])
				{
					/#
						println("Dev Block strings are not supported" + keys[i] + "Dev Block strings are not supported" + node_keys[j] + "Dev Block strings are not supported");
						continue;
					#/
				}
				/#
					println("Dev Block strings are not supported" + keys[i] + "Dev Block strings are not supported" + node_keys[j]);
				#/
				[[func]](node, List[keys[i]].links[node_keys[j]]);
			}
		}
	}
}

/*
	Name: link_changes_internal
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE4C8
	Size: 0xA8
	Parameters: 2
	Flags: None
	Line Number: 7088
*/
function link_changes_internal(func_for_link_list, func_for_unlink_list)
{
	if(isdefined(level._link_node_list))
	{
		/#
			println("Dev Block strings are not supported");
		#/
		link_changes_internal_internal(level._link_node_list, func_for_link_list);
	}
	if(isdefined(level._unlink_node_list))
	{
		/#
			println("Dev Block strings are not supported");
		#/
		link_changes_internal_internal(level._unlink_node_list, func_for_unlink_list);
	}
}

/*
	Name: link_nodes_wrapper
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE578
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 7116
*/
function link_nodes_wrapper(a, b)
{
	if(!NodesAreLinked(a, b))
	{
		LinkNodes(a, b);
	}
}

/*
	Name: unlink_nodes_wrapper
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE5D0
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 7134
*/
function unlink_nodes_wrapper(a, b)
{
	if(NodesAreLinked(a, b))
	{
		UnlinkNodes(a, b);
	}
}

/*
	Name: undo_link_changes
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE628
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 7152
*/
function undo_link_changes()
{
	/#
		println("Dev Block strings are not supported");
		println("Dev Block strings are not supported");
		println("Dev Block strings are not supported");
	#/
	link_changes_internal(&unlink_nodes_wrapper, &link_nodes_wrapper);
	delete_spawned_path_nodes();
}

/*
	Name: redo_link_changes
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE6C8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 7173
*/
function redo_link_changes()
{
	/#
		println("Dev Block strings are not supported");
		println("Dev Block strings are not supported");
		println("Dev Block strings are not supported");
	#/
	respawn_path_nodes();
	link_changes_internal(&link_nodes_wrapper, &unlink_nodes_wrapper);
}

/*
	Name: is_gametype_active
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE768
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 7194
*/
function is_gametype_active(a_gametypes)
{
	b_is_gametype_active = 0;
	if(!IsArray(a_gametypes))
	{
		a_gametypes = Array(a_gametypes);
	}
	for(i = 0; i < a_gametypes.size; i++)
	{
		if(GetDvarString("g_gametype") == a_gametypes[i])
		{
			b_is_gametype_active = 1;
		}
	}
	return b_is_gametype_active;
}

/*
	Name: register_custom_spawner_entry
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE828
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 7221
*/
function register_custom_spawner_entry(spot_noteworthy, func)
{
	if(!isdefined(level.custom_spawner_entry))
	{
		level.custom_spawner_entry = [];
	}
	level.custom_spawner_entry[spot_noteworthy] = func;
}

/*
	Name: get_player_weapon_limit
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE870
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 7240
*/
function get_player_weapon_limit(player)
{
	if(isdefined(self.get_player_weapon_limit))
	{
		return [[self.get_player_weapon_limit]](player);
	}
	if(isdefined(level.get_player_weapon_limit))
	{
		return [[level.get_player_weapon_limit]](player);
	}
	weapon_limit = 2;
	if(player hasPerk("specialty_additionalprimaryweapon"))
	{
		weapon_limit = level.additionalprimaryweapon_limit;
	}
	return weapon_limit;
}

/*
	Name: get_player_perk_purchase_limit
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE908
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 7268
*/
function get_player_perk_purchase_limit()
{
	n_perk_purchase_limit_override = level.perk_purchase_limit;
	if(isdefined(level.get_player_perk_purchase_limit))
	{
		n_perk_purchase_limit_override = self [[level.get_player_perk_purchase_limit]]();
	}
	return n_perk_purchase_limit_override;
}

/*
	Name: can_player_purchase_perk
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xE950
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 7288
*/
function can_player_purchase_perk()
{
	if(self.num_perks < self get_player_perk_purchase_limit())
	{
		return 1;
	}
	if(self bgb::is_enabled("zm_bgb_unquenchable") || self bgb::is_enabled("zm_bgb_soda_fountain"))
	{
		return 1;
	}
	can = 0;
	for(i = 0; i < level.var_4d1795b7.size; i++)
	{
		can = self [[level.var_4d1795b7[i]]]();
		if(can == 1)
		{
			break;
		}
	}
	return can;
}

/*
	Name: function_41a08da2
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xEA38
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 7320
*/
function function_41a08da2(func)
{
	if(!isdefined(level.var_4d1795b7))
	{
		level.var_4d1795b7 = [];
	}
	level.var_4d1795b7[level.var_4d1795b7.size] = func;
}

/*
	Name: function_98d1e57d
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xEA80
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 7339
*/
function function_98d1e57d(func)
{
	if(!isdefined(level.var_4d1795b7))
	{
		level.var_4d1795b7 = [];
	}
	ArrayRemoveValue(level.var_4d1795b7, func);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: give_player_all_perks
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xEAD0
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 7360
*/
function give_player_all_perks(b_exclude_quick_revive)
{
	if(!isdefined(b_exclude_quick_revive))
	{
		b_exclude_quick_revive = 0;
	}
	if(level flag::exists("reap_collection_loaded") && !level flag::get("reap_collection_loaded"))
	{
		self IPrintLnBold("PERK ON HOLD UNTIL LOADING FINISHED");
		level flag::wait_till("reap_collection_loaded");
		wait(1);
	}
	a_str_perks = getArrayKeys(level._custom_perks);
	foreach(str_perk in a_str_perks)
	{
		if(str_perk == "specialty_quickrevive" && b_exclude_quick_revive)
		{
			continue;
		}
		if(!namespace_851dc78f::function_20dc5a15(str_perk) && !self hasPerk(str_perk) || (namespace_851dc78f::function_20dc5a15(str_perk) && !self namespace_851dc78f::function_5f9a13b3(str_perk)))
		{
			self zm_perks::give_perk(str_perk, 0);
			if(isdefined(level.perk_bought_func))
			{
				self [[level.perk_bought_func]](str_perk);
			}
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: wait_for_attractor_positions_complete
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xECD8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 7402
*/
function wait_for_attractor_positions_complete()
{
	self waittill("attractor_positions_generated");
	self.attract_to_origin = 0;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_player_index
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xED00
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 7420
*/
function get_player_index(player)
{
	/#
		fallback_initiated::Assert(isPlayer(player));
	#/
	/#
		fallback_initiated::Assert(isdefined(player.characterindex));
	#/
	/#
		if(player.entity_num == 0 && GetDvarString("Dev Block strings are not supported") != "Dev Block strings are not supported")
		{
			new_vo_index = GetDvarInt("Dev Block strings are not supported");
			return new_vo_index;
		}
	#/
	return player.characterindex;
}

/*
	Name: get_specific_character
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xEDE8
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 7448
*/
function get_specific_character(n_character_index)
{
	foreach(character in level.players)
	{
		if(character.characterindex == n_character_index)
		{
			return character;
		}
	}
	return undefined;
}

/*
	Name: zombie_goto_round
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xEE90
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 7470
*/
function zombie_goto_round(n_target_round)
{
	level notify("restart_round");
	if(n_target_round < 1)
	{
		n_target_round = 1;
	}
	level.zombie_total = 0;
	zombie_utility::ai_calculate_health(n_target_round);
	zm::set_round_number(n_target_round - 1);
	zombies = zombie_utility::get_round_enemy_array();
	if(isdefined(zombies))
	{
		Array::run_all(zombies, &kill);
	}
	level.sndGotoRoundOccurred = 1;
	level waittill("between_round_over");
}

/*
	Name: is_point_inside_enabled_zone
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xEF70
	Size: 0x1A8
	Parameters: 2
	Flags: None
	Line Number: 7499
*/
function is_point_inside_enabled_zone(v_origin, ignore_zone)
{
	temp_ent = spawn("script_origin", v_origin);
	foreach(zone in level.zones)
	{
		if(!zone.is_enabled)
		{
			continue;
		}
		if(isdefined(ignore_zone) && zone == ignore_zone)
		{
			continue;
		}
		foreach(e_volume in zone.Volumes)
		{
			if(temp_ent istouching(e_volume))
			{
				temp_ent delete();
				return 1;
			}
		}
	}
	temp_ent delete();
	return 0;
}

/*
	Name: clear_streamer_hint
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xF120
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 7535
*/
function clear_streamer_hint()
{
	if(isdefined(self.streamer_hint))
	{
		self.streamer_hint delete();
		self.streamer_hint = undefined;
	}
	self notify("wait_clear_streamer_hint");
}

/*
	Name: wait_clear_streamer_hint
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xF170
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 7555
*/
function wait_clear_streamer_hint(lifetime)
{
	self endon("wait_clear_streamer_hint");
	wait(lifetime);
	if(isdefined(self))
	{
		self clear_streamer_hint();
	}
}

/*
	Name: create_streamer_hint
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xF1B8
	Size: 0x1B0
	Parameters: 4
	Flags: None
	Line Number: 7575
*/
function create_streamer_hint(origin, angles, value, lifetime)
{
	if(self == level)
	{
		foreach(player in GetPlayers())
		{
			player clear_streamer_hint();
		}
	}
	self clear_streamer_hint();
	self.streamer_hint = CreateStreamerHint(origin, value);
	if(isdefined(angles))
	{
		self.streamer_hint.angles = angles;
	}
	if(self != level)
	{
		self.streamer_hint SetInvisibleToAll();
		self.streamer_hint setvisibletoplayer(self);
	}
	self.streamer_hint SetIncludeMeshes(1);
	self notify("wait_clear_streamer_hint");
	if(isdefined(lifetime) && lifetime > 0)
	{
		self thread wait_clear_streamer_hint(lifetime);
		return;
	}
	ERROR: Bad function call
}

/*
	Name: approximate_path_dist
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xF370
	Size: 0x180
	Parameters: 1
	Flags: None
	Line Number: 7615
*/
function approximate_path_dist(player)
{
	AIProfile_BeginEntry("approximate_path_dist");
	goal_pos = player.origin;
	if(isdefined(player.last_valid_position))
	{
		goal_pos = player.last_valid_position;
	}
	if(isdefined(player.b_teleporting) && player.b_teleporting)
	{
		if(isdefined(player.teleport_location))
		{
			goal_pos = player.teleport_location;
			if(!IsPointOnNavMesh(goal_pos, self))
			{
				position = GetClosestPointOnNavMesh(goal_pos, 100, 15);
				if(isdefined(position))
				{
					goal_pos = position;
				}
			}
		}
	}
	/#
		fallback_initiated::Assert(isdefined(level.pathdist_type), "Dev Block strings are not supported");
	#/
	approx_dist = PathDistance(self.origin, goal_pos, 1, self, level.pathdist_type);
	AIProfile_EndEntry();
	return approx_dist;
}

/*
	Name: register_slowdown
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xF4F8
	Size: 0x90
	Parameters: 3
	Flags: None
	Line Number: 7656
*/
function register_slowdown(str_type, n_rate, n_duration)
{
	if(!isdefined(level.a_n_slowdown_rates))
	{
		level.a_n_slowdown_rates = [];
	}
	level.a_s_slowdowns[str_type] = spawnstruct();
	level.a_s_slowdowns[str_type].n_rate = n_rate;
	level.a_s_slowdowns[str_type].n_duration = n_duration;
}

/*
	Name: slowdown_ai
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xF590
	Size: 0x288
	Parameters: 1
	Flags: None
	Line Number: 7677
*/
function slowdown_ai(str_type)
{
	self notify("starting_slowdown_ai");
	self endon("starting_slowdown_ai");
	self endon("death");
	/#
		fallback_initiated::Assert(isdefined(level.a_s_slowdowns[str_type]), "Dev Block strings are not supported" + str_type + "Dev Block strings are not supported");
	#/
	if(!isdefined(self.a_n_slowdown_timeouts))
	{
		self.a_n_slowdown_timeouts = [];
	}
	n_time = GetTime();
	n_timeout = n_time + level.a_s_slowdowns[str_type].n_duration;
	if(!isdefined(self.a_n_slowdown_timeouts[str_type]) || self.a_n_slowdown_timeouts[str_type] < n_timeout)
	{
		self.a_n_slowdown_timeouts[str_type] = n_timeout;
	}
	while(self.a_n_slowdown_timeouts.size)
	{
		str_lowest_type = undefined;
		n_lowest_rate = 10;
		foreach(n_slowdown_timeout in self.a_n_slowdown_timeouts)
		{
			if(n_slowdown_timeout <= n_time)
			{
				self.a_n_slowdown_timeouts[str_index] = undefined;
				continue;
			}
			if(level.a_s_slowdowns[str_index].n_rate < n_lowest_rate)
			{
				str_lowest_type = str_index;
				n_lowest_rate = level.a_s_slowdowns[str_index].n_rate;
			}
		}
		if(isdefined(str_lowest_type))
		{
			self ASMSetAnimationRate(n_lowest_rate);
			n_duration = self.a_n_slowdown_timeouts[str_lowest_type] - n_time;
			wait(n_duration);
			self.a_n_slowdown_timeouts[str_lowest_type] = undefined;
		}
	}
	self ASMSetAnimationRate(1);
	return;
	~;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_player_closest_to
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xF820
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 7736
*/
function get_player_closest_to(e_target)
{
	a_players = ArrayCopy(level.activePlayers);
	ArrayRemoveValue(a_players, e_target);
	e_closest_player = ArrayGetClosest(e_target.origin, a_players);
	return e_closest_player;
}

/*
	Name: is_facing
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xF8A8
	Size: 0x190
	Parameters: 3
	Flags: None
	Line Number: 7754
*/
function is_facing(facee, requiredDot, b_2d)
{
	if(!isdefined(requiredDot))
	{
		requiredDot = 0.5;
	}
	if(!isdefined(b_2d))
	{
		b_2d = 1;
	}
	orientation = self getPlayerAngles();
	v_forward = AnglesToForward(orientation);
	v_to_facee = facee.origin - self.origin;
	if(b_2d)
	{
		v_forward_computed = (v_forward[0], v_forward[1], 0);
		v_to_facee_computed = (v_to_facee[0], v_to_facee[1], 0);
	}
	else
	{
		v_forward_computed = v_forward;
		v_to_facee_computed = v_to_facee;
	}
	v_unit_forward_computed = VectorNormalize(v_forward_computed);
	v_unit_to_facee_computed = VectorNormalize(v_to_facee_computed);
	dotProduct = VectorDot(v_unit_forward_computed, v_unit_to_facee_computed);
	return dotProduct > requiredDot;
}

/*
	Name: is_solo_ranked_game
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xFA40
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 7793
*/
function is_solo_ranked_game()
{
	return level.players.size == 1 && GetDvarInt("zm_private_rankedmatch", 0);
}

/*
	Name: upload_zm_dash_counters
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xFA80
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 7808
*/
function upload_zm_dash_counters(force_upload)
{
	if(!isdefined(force_upload))
	{
		force_upload = 0;
	}
}

/*
	Name: upload_zm_dash_counters_end_game
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xFAA8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 7826
*/
function upload_zm_dash_counters_end_game()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: increment_zm_dash_counter
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xFAB8
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 7842
*/
function increment_zm_dash_counter(counter_name, amount)
{
}

/*
	Name: zm_dash_stats_game_start
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xFAD8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 7856
*/
function zm_dash_stats_game_start()
{
}

/*
	Name: zm_dash_stats_game_end
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xFAE8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 7870
*/
function zm_dash_stats_game_end()
{
}

/*
	Name: zm_dash_stats_wait_for_consumable_use
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0xFAF8
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 7884
*/
function zm_dash_stats_wait_for_consumable_use()
{
}

