#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\zm_temple_sq;
#include scripts\zm\zm_temple_sq_brock;

#namespace namespace_435c2400;

/*
	Name: function_98e846ee
	Namespace: namespace_435c2400
	Checksum: 0x424F4353
	Offset: 0x9E8
	Size: 0xD8
	Parameters: 2
	Flags: None
	Line Number: 21
*/
function function_98e846ee(character, vo)
{
	entry = spawnstruct();
	switch(character)
	{
		case "dempsey":
		{
			entry.character = 0;
			break;
		}
		case "nikolai":
		{
			entry.character = 1;
			break;
		}
		case "takeo":
		{
			entry.character = 3;
			break;
		}
		case "richtofen":
		{
			entry.character = 2;
			break;
		}
	}
	entry.vo = vo;
	return entry;
}

/*
	Name: init_skits
	Namespace: namespace_435c2400
	Checksum: 0x424F4353
	Offset: 0xAC8
	Size: 0xDB8
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function init_skits()
{
	if(!isdefined(level.var_bc33b0dc))
	{
		level.var_bc33b0dc = [];
		level.var_bc33b0dc["tt1"] = Array(function_98e846ee("dempsey", "vox_egg_skit_travel_1_0"), function_98e846ee("nikolai", "vox_egg_skit_travel_1_1"), function_98e846ee("takeo", "vox_egg_skit_travel_1_2"), function_98e846ee("richtofen", "vox_egg_skit_travel_1_3"), function_98e846ee("dempsey", "vox_egg_skit_travel_1_4"));
		level.var_bc33b0dc["tt2"] = Array(function_98e846ee("takeo", "vox_egg_skit_travel_2_0"), function_98e846ee("nikolai", "vox_egg_skit_travel_2_1"), function_98e846ee("richtofen", "vox_egg_skit_travel_2_2"), function_98e846ee("dempsey", "vox_egg_skit_travel_2_3"), function_98e846ee("nikolai", "vox_egg_skit_travel_2_4"));
		level.var_bc33b0dc["tt3"] = Array(function_98e846ee("dempsey", "vox_egg_skit_travel_3_0"), function_98e846ee("takeo", "vox_egg_skit_travel_3_1"), function_98e846ee("richtofen", "vox_egg_skit_travel_3_2"), function_98e846ee("nikolai", "vox_egg_skit_travel_3_3"), function_98e846ee("richtofen", "vox_egg_skit_travel_3_3a"), function_98e846ee("dempsey", "vox_egg_skit_travel_3_4"));
		level.var_bc33b0dc["tt4a"] = Array(function_98e846ee("takeo", "vox_egg_skit_travel_4a_0"), function_98e846ee("dempsey", "vox_egg_skit_travel_4a_1"), function_98e846ee("richtofen", "vox_egg_skit_travel_4a_2"), function_98e846ee("nikolai", "vox_egg_skit_travel_4a_3"), function_98e846ee("dempsey", "vox_egg_skit_travel_4a_4"), function_98e846ee("dempsey", "vox_egg_skit_travel_4a_5"), function_98e846ee("dempsey", "vox_egg_skit_travel_4a_6"), function_98e846ee("richtofen", "vox_egg_skit_travel_4a_7"));
		level.var_bc33b0dc["tt4b"] = Array(function_98e846ee("richtofen", "vox_egg_skit_travel_4b_0"), function_98e846ee("dempsey", "vox_egg_skit_travel_4b_1"), function_98e846ee("richtofen", "vox_egg_skit_travel_4b_2"), function_98e846ee("dempsey", "vox_egg_skit_travel_4b_3"), function_98e846ee("richtofen", "vox_egg_skit_travel_4b_4"), function_98e846ee("nikolai", "vox_egg_skit_travel_4b_5"), function_98e846ee("richtofen", "vox_egg_skit_travel_4b_6"));
		level.var_bc33b0dc["tt5"] = Array(function_98e846ee("richtofen", "vox_egg_skit_travel_5_0"), function_98e846ee("takeo", "vox_egg_skit_travel_5_1"), function_98e846ee("dempsey", "vox_egg_skit_travel_5_2"), function_98e846ee("nikolai", "vox_egg_skit_travel_5_3"), function_98e846ee("richtofen", "vox_egg_skit_travel_5_4"));
		level.var_bc33b0dc["tt6"] = Array(function_98e846ee("dempsey", "vox_egg_skit_travel_6_0"), function_98e846ee("richtofen", "vox_egg_skit_travel_6_1"), function_98e846ee("richtofen", "vox_egg_skit_travel_6_2"), function_98e846ee("nikolai", "vox_egg_skit_travel_6_3"), function_98e846ee("richtofen", "vox_egg_skit_travel_6_4"), function_98e846ee("takeo", "vox_egg_skit_travel_6_5"), function_98e846ee("takeo", "vox_egg_skit_travel_6_6"));
		level.var_bc33b0dc["tt7a"] = Array(function_98e846ee("dempsey", "vox_egg_skit_travel_7a_0"), function_98e846ee("richtofen", "vox_egg_skit_travel_7a_1"), function_98e846ee("dempsey", "vox_egg_skit_travel_7a_2"), function_98e846ee("nikolai", "vox_egg_skit_travel_7a_3"), function_98e846ee("takeo", "vox_egg_skit_travel_7a_4"));
		level.var_bc33b0dc["tt7b"] = Array(function_98e846ee("dempsey", "vox_egg_skit_travel_7b_0"), function_98e846ee("richtofen", "vox_egg_skit_travel_7b_1"), function_98e846ee("nikolai", "vox_egg_skit_travel_7b_2"), function_98e846ee("takeo", "vox_egg_skit_travel_7b_3"), function_98e846ee("takeo", "vox_egg_skit_travel_7b_4"));
		level.var_bc33b0dc["tt8"] = Array(function_98e846ee("richtofen", "vox_egg_skit_travel_8_0"), function_98e846ee("dempsey", "vox_egg_skit_travel_8_1"), function_98e846ee("richtofen", "vox_egg_skit_travel_8_2"), function_98e846ee("nikolai", "vox_egg_skit_travel_8_3"), function_98e846ee("richtofen", "vox_egg_skit_travel_8_4"));
		level.var_bc33b0dc["fail1"] = Array(function_98e846ee("dempsey", "vox_egg_skit_fail_0_0"), function_98e846ee("nikolai", "vox_egg_skit_fail_0_1"), function_98e846ee("takeo", "vox_egg_skit_fail_0_2"), function_98e846ee("richtofen", "vox_egg_skit_fail_0_3"));
		level.var_bc33b0dc["fail2"] = Array(function_98e846ee("dempsey", "vox_egg_skit_fail_1_0"), function_98e846ee("nikolai", "vox_egg_skit_fail_2_1"), function_98e846ee("takeo", "vox_egg_skit_fail_3_2"), function_98e846ee("richtofen", "vox_egg_skit_fail_4_3"));
		level.var_bc33b0dc["fail3"] = Array(function_98e846ee("dempsey", "vox_egg_skit_fail_0_0"), function_98e846ee("nikolai", "vox_egg_skit_fail_1_1"), function_98e846ee("takeo", "vox_egg_skit_fail_2_2"), function_98e846ee("richtofen", "vox_egg_skit_fail_3_3"));
		level.var_bc33b0dc["fail4"] = Array(function_98e846ee("dempsey", "vox_egg_skit_fail_0_0"), function_98e846ee("nikolai", "vox_egg_skit_fail_1_1"), function_98e846ee("takeo", "vox_egg_skit_fail_2_2"), function_98e846ee("richtofen", "vox_egg_skit_fail_3_3"));
		level.var_bc33b0dc["start0"] = Array(function_98e846ee("dempsey", "vox_egg_skit_start_0_0"), function_98e846ee("nikolai", "vox_egg_skit_start_0_1"), function_98e846ee("takeo", "vox_egg_skit_start_0_2"), function_98e846ee("richtofen", "vox_egg_skit_start_0_2a"), function_98e846ee("nikolai", "vox_egg_skit_start_0_3"), function_98e846ee("richtofen", "vox_egg_skit_start_0_4"), function_98e846ee("richtofen", "vox_egg_skit_start_0_5"));
		level.var_bc33b0dc["start1"] = Array(function_98e846ee("takeo", "vox_egg_skit_start_1_0"), function_98e846ee("richtofen", "vox_egg_skit_start_1_1"), function_98e846ee("nikolai", "vox_egg_skit_start_1_2"), function_98e846ee("nikolai", "vox_egg_skit_start_1_3"), function_98e846ee("takeo", "vox_egg_skit_start_1_4"), function_98e846ee("nikolai", "vox_egg_skit_start_1_5"), function_98e846ee("dempsey", "vox_egg_skit_start_1_6"), function_98e846ee("dempsey", "vox_egg_skit_start_1_7"));
		return;
	}
}

/*
	Name: function_22d442e8
	Namespace: namespace_435c2400
	Checksum: 0x424F4353
	Offset: 0x1888
	Size: 0x490
	Parameters: 2
	Flags: None
	Line Number: 96
*/
function function_22d442e8(var_3b02d9c2, group)
{
	level endon("hash_f180f1ce");
	if(!isdefined(level.var_12e02d45))
	{
		Buttons = GetEntArray("sq_sundial_button", "targetname");
		pos = (0, 0, 0);
		for(i = 0; i < Buttons.size; i++)
		{
			pos = pos + Buttons[i].origin;
		}
		pos = pos / Buttons.size;
		level.var_12e02d45 = pos;
	}
	if(!isdefined(var_3b02d9c2))
	{
		var_3b02d9c2 = level.var_12e02d45;
	}
	while(1)
	{
		players = GetPlayers();
		if(isdefined(group))
		{
			players = group;
		}
		max_dist_squared = 0;
		check_pos = level.var_12e02d45;
		if(isdefined(group))
		{
			check_pos = (0, 0, 0);
			var_cb3cff2b = 0;
			for(i = 0; i < group.size; i++)
			{
				if(isdefined(group[i]))
				{
					check_pos = check_pos + group[i].origin;
					var_cb3cff2b++;
				}
			}
			if(var_cb3cff2b)
			{
				check_pos = check_pos / var_cb3cff2b;
			}
		}
		for(i = 0; i < players.size; i++)
		{
			if(!isdefined(players[i]))
			{
				break;
			}
			dist_squared = Distance2DSquared(players[i].origin, check_pos);
			if(isdefined(dist_squared))
			{
				max_dist_squared = max(max_dist_squared, dist_squared);
			}
		}
		if(max_dist_squared > 518400)
		{
			break;
		}
		wait(0.1);
	}
	level notify("hash_22d442e8");
	speaker = GetPlayers()[0];
	if(isdefined(level.var_1b611061))
	{
		speaker = level.var_1b611061;
	}
	if(isdefined(speaker.var_d7c2ba50) && speaker.var_d7c2ba50)
	{
		while(isdefined(speaker) && speaker.var_d7c2ba50)
		{
			wait(0.2);
		}
	}
	character = speaker.characterindex;
	if(isdefined(speaker) && isdefined(speaker.zm_random_char))
	{
		character = speaker.zm_random_char;
	}
	num = 5;
	if(character === 3)
	{
		num = 8;
	}
	snd = "vox_plr_" + character + "_safety_" + randomIntRange(0, num);
	if(!isdefined(speaker))
	{
		return;
	}
	/#
		iprintln(character + "Dev Block strings are not supported" + snd);
	#/
	var_53a95046 = soundgetplaybacktime(snd);
	thread namespace_cc012897::Send(snd, "all", var_53a95046);
	speaker playsoundwithnotify(snd, "line_done");
	speaker waittill("hash_aca755da");
	level.skit_vox_override = 0;
}

/*
	Name: function_909060e5
	Namespace: namespace_435c2400
	Checksum: 0x424F4353
	Offset: 0x1D20
	Size: 0x218
	Parameters: 1
	Flags: None
	Line Number: 206
*/
function function_909060e5(var_a0bbcaa5)
{
	players = GetPlayers();
	speaking_player = players[0];
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i].zm_random_char))
		{
			if(players[i].zm_random_char == var_a0bbcaa5.character)
			{
				speaking_player = players[i];
				break;
				continue;
			}
		}
		if(players[i].characterindex == var_a0bbcaa5.character)
		{
			speaking_player = players[i];
			break;
		}
	}
	speaking_player.var_d7c2ba50 = 1;
	level.var_1b611061 = speaking_player;
	if(!isdefined(speaking_player))
	{
		return;
	}
	/#
		iprintln(speaking_player GetEntityNumber() + "Dev Block strings are not supported" + var_a0bbcaa5.vo);
	#/
	var_53a95046 = soundgetplaybacktime(var_a0bbcaa5.vo);
	thread namespace_cc012897::Send(var_a0bbcaa5.vo, "all", var_53a95046);
	speaking_player playsoundwithnotify(var_a0bbcaa5.vo, "line_done");
	speaking_player waittill("hash_aca755da");
	speaking_player.var_d7c2ba50 = 0;
	level notify("line_spoken");
}

/*
	Name: start_skit
	Namespace: namespace_435c2400
	Checksum: 0x424F4353
	Offset: 0x1F40
	Size: 0xE8
	Parameters: 2
	Flags: None
	Line Number: 254
*/
function start_skit(var_f0626d82, group)
{
	level endon("hash_22d442e8");
	script = level.var_bc33b0dc[var_f0626d82];
	level.skit_vox_override = 1;
	level thread function_22d442e8(undefined, group);
	for(i = 0; i < script.size; i++)
	{
		if(i == script.size - 1)
		{
			level notify("hash_f180f1ce");
		}
		level thread function_909060e5(script[i]);
		level waittill("line_spoken");
	}
	level.skit_vox_override = 0;
}

/*
	Name: fail_skit
	Namespace: namespace_435c2400
	Checksum: 0x424F4353
	Offset: 0x2030
	Size: 0x35C
	Parameters: 1
	Flags: None
	Line Number: 282
*/
function fail_skit(first_time)
{
	var_a8e5ccfc = undefined;
	if(isdefined(first_time) && first_time)
	{
		var_a8e5ccfc = Array(level.var_bc33b0dc["fail1"]);
	}
	else
	{
		var_a8e5ccfc = Array(level.var_bc33b0dc["fail2"], level.var_bc33b0dc["fail3"], level.var_bc33b0dc["fail4"]);
	}
	players = GetPlayers();
	player_index = 0;
	var_fb29795b = undefined;
	while(player_index != players.size)
	{
		var_fb29795b = [];
		for(i = 0; i < players.size; i++)
		{
			if(i == player_index)
			{
				continue;
			}
			if(Distance2DSquared(players[player_index].origin, players[i].origin) < 129600)
			{
				var_fb29795b[var_fb29795b.size] = players[i];
			}
		}
		player_index++;
		if(var_fb29795b.size > 0)
		{
			break;
		}
	}
	level.skit_vox_override = 1;
	skit = var_a8e5ccfc[randomIntRange(0, var_a8e5ccfc.size)];
	if(var_fb29795b.size > 0)
	{
		pos = (0, 0, 0);
		for(i = 0; i < var_fb29795b.size; i++)
		{
			pos = pos + var_fb29795b[i].origin;
		}
		pos = pos / var_fb29795b.size;
		level endon("hash_22d442e8");
		level thread function_22d442e8(pos, var_fb29795b);
		for(i = 0; i < var_fb29795b.size; i++)
		{
			level thread function_909060e5(skit[var_fb29795b[i].characterindex]);
			level waittill("line_spoken");
		}
	}
	else
	{
		player = players[randomIntRange(0, players.size)];
		level thread function_909060e5(skit[player.characterindex]);
		level waittill("line_spoken");
	}
	level.skit_vox_override = 0;
}

