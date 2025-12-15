#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\sound_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equip_hacker;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zm_moon_amb;
#include scripts\zm\zm_moon_sq;

#namespace zm_moon_sq_osc;

/*
	Name: init
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x5A8
	Size: 0x558
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function init()
{
	level._osc_rb_jolie_spots = [];
	level._osc_rbs = struct::get_array("struct_osc_button", "targetname");
	if(!isdefined(level._osc_rbs))
	{
		/#
			println("Dev Block strings are not supported");
		#/
		wait(1);
		return;
	}
	level._osc_struct = struct::get("struct_sq_osc", "targetname");
	if(!isdefined(level._osc_struct))
	{
		/#
			println("Dev Block strings are not supported");
		#/
		wait(1);
		return;
	}
	level._osc_flags = StrTok(level._osc_struct.script_flag, ",");
	if(!isdefined(level._osc_flags))
	{
		/#
			println("Dev Block strings are not supported");
		#/
		wait(1);
		return;
	}
	for(j = 0; j < level._osc_flags.size; j++)
	{
		if(!isdefined(level.flag[level._osc_flags[j]]))
		{
			level flag::init(level._osc_flags[j]);
		}
	}
	level._jolie_greet_array = Array(level._osc_flags[4], level._osc_flags[5], level._osc_flags[6], level._osc_flags[7]);
	level._osc_st = struct::get_array("struct_osc_st", "targetname");
	for(K = 0; K < level._osc_st.size; K++)
	{
		level._osc_st[K].focus = spawnstruct();
		level._osc_st[K].focus.origin = level._osc_st[K].origin;
		level._osc_st[K].focus.radius = 48;
		level._osc_st[K].focus.height = 48;
		level._osc_st[K].focus.script_float = 5;
		level._osc_st[K].focus.script_int = 0;
		level._osc_st[K].focus._light_spot = struct::get(level._osc_st[K].target, "targetname");
	}
	level thread function_f65c74fe();
	level._osc_min_dist = level._osc_struct.script_wait_min;
	level._osc_max_dist = level._osc_struct.script_wait_max;
	level._osc_rbs_dist_range = level._osc_max_dist - level._osc_min_dist;
	level._osc_release = 0;
	level._osc_check = undefined;
	if(GetDvarInt("jolie_greet_debug"))
	{
		level._osc_trial_time = GetDvarInt("jolie_greet_time");
	}
	else if(!isdefined(level._osc_struct.script_int))
	{
		/#
			println("Dev Block strings are not supported");
		#/
		wait(1);
		return;
	}
	level._osc_trial_time = level._osc_struct.script_int;
	level._osc_cap_spot = struct::get("struct_cover", "targetname");
	level._osc_cap = util::spawn_model("p7_zm_moo_glyph_dial_cap", level._osc_cap_spot.origin, level._osc_cap_spot.angles);
	level._osc_terms = 0;
	level thread osc_button_cover_setup();
	zm_sidequests::declare_sidequest_stage("sq", "osc", &init_stage, &stage_logic, &exit_stage);
}

/*
	Name: function_f65c74fe
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0xB08
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 117
*/
function function_f65c74fe()
{
	level flag::wait_till("start_zombie_round_logic");
	foreach(var_c597f9d8 in level._osc_st)
	{
		var_c597f9d8 function_27fd2e20(0);
	}
}

/*
	Name: osc_button_cover_setup
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0xBC0
	Size: 0x3E8
	Parameters: 0
	Flags: None
	Line Number: 136
*/
function osc_button_cover_setup()
{
	level flagsys::wait_till("load_main_complete");
	level flag::wait_till("start_zombie_round_logic");
	for(i = 0; i < level._osc_rbs.size; i++)
	{
		osc_target = struct::get(level._osc_rbs[i].target, "targetname");
		level._osc_rbs[i].cover = spawn("script_model", osc_target.origin);
		level._osc_rbs[i].cover.angles = osc_target.angles;
		level._osc_rbs[i].cover SetModel("p7_zm_moo_console_button_lid");
		level._osc_rbs[i].cover_close = level._osc_rbs[i].cover.angles;
		level._osc_rbs[i].cover RotateRoll(-90, 0.05);
		level._osc_rbs[i].cover waittill("rotatedone");
		level._osc_rbs[i].cover_open = level._osc_rbs[i].cover.angles;
		level._osc_rbs[i].cover.angles = level._osc_rbs[i].cover_close;
		level._osc_rbs[i].jolie = spawnstruct();
		level._osc_rbs[i].jolie.origin = level._osc_rbs[i].origin;
		level._osc_rbs[i].jolie.radius = 48;
		level._osc_rbs[i].jolie.height = 48;
		level._osc_rbs[i].jolie.script_float = 4;
		level._osc_rbs[i].jolie.script_int = 500;
		level._osc_rbs[i].jolie.no_sight_check = 1;
		level._osc_rbs[i].jolie.no_bullet_trace = 1;
		Array::add(level._osc_rb_jolie_spots, level._osc_rbs[i].jolie, 0);
	}
	level._osc_rbs_totalrot = level._osc_rbs[0].cover_close - level._osc_rbs[0].cover_open;
}

/*
	Name: exit_stage
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0xFB0
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 174
*/
function exit_stage(success)
{
}

/*
	Name: stage_logic
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0xFC8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 188
*/
function stage_logic()
{
	level waittill("release_complete");
	zm_sidequests::stage_completed("sq", "osc");
}

/*
	Name: init_stage
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x1008
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 204
*/
function init_stage()
{
	level thread moon_jolie_greet();
	level thread moon_rb_dist_think();
	level thread moon_open_access();
	level thread moon_keyhole();
}

/*
	Name: moon_rb_dist_think
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x1078
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 222
*/
function moon_rb_dist_think()
{
	level endon("end_game");
	level endon(level._osc_flags[1]);
	level endon("stop_dist_think");
	level._lid_close_sound = 0;
	int_close = 0;
	dist_struct = struct::get("struct_rb_dist_check", "targetname");
	while(!level flag::get(level._osc_flags[1]))
	{
		level._osc_check = zm_utility::get_closest_player(dist_struct.origin);
		int_distance = Distance2D(level._osc_check.origin, dist_struct.origin);
		if(int_distance > level._osc_max_dist)
		{
			int_distance = level._osc_max_dist;
		}
		else if(int_distance < level._osc_min_dist)
		{
			int_distance = level._osc_min_dist;
		}
		scale = int_distance - level._osc_min_dist / level._osc_rbs_dist_range;
		rotation_offset = level._osc_rbs_totalrot * scale;
		for(i = 0; i < level._osc_rbs.size; i++)
		{
			level._osc_rbs[i].cover.angles = level._osc_rbs[i].cover_close - rotation_offset;
			if(level._osc_rbs[i].cover.angles == level._osc_rbs[i].cover_close && level._lid_close_sound == 0)
			{
				level._lid_close_sound = 1;
				level._osc_rbs[i].cover thread rb_cover_sound();
			}
		}
		wait(0.05);
		level._osc_check = undefined;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: rb_cover_sound
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x12F8
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 270
*/
function rb_cover_sound()
{
	for(i = 0; i < level._osc_rbs.size; i++)
	{
		level._osc_rbs[i].cover playsound("evt_sq_rbs_close");
		level._osc_rbs[i].cover playsoundwithnotify("vox_mcomp_quest_step3_0", "sounddone");
		var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step3_0");
		thread namespace_cc012897::Send("vox_mcomp_quest_step3_0", "all", var_53a95046);
	}
	level._osc_rbs[0].cover waittill("sounddone");
	level thread play_rb_cover_player_vox(self);
	wait(30);
	level._lid_close_sound = 0;
	return;
}

/*
	Name: play_rb_cover_player_vox
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x1428
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 296
*/
function play_rb_cover_player_vox(ent)
{
	level notify("prevent_dupe_rb_cover_vox");
	level endon("prevent_dupe_rb_cover_vox");
	wait(0.5);
	player = zm_utility::get_closest_player(ent.origin);
	player thread zm_audio::create_and_play_dialog("eggs", "quest3", 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: moon_jolie_greet
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x14B0
	Size: 0x580
	Parameters: 0
	Flags: None
	Line Number: 317
*/
function moon_jolie_greet()
{
	if(!isdefined(level._osc_rb_jolie_spots) || level._osc_rb_jolie_spots.size == 0)
	{
		/#
			println("Dev Block strings are not supported");
		#/
		wait(1);
		return;
	}
	while(!level flag::get(level._osc_flags[1]))
	{
		for(i = 0; i < level._osc_rb_jolie_spots.size; i++)
		{
			namespace_6d813654::register_pooled_hackable_struct(level._osc_rb_jolie_spots[i], &moon_jolie_access);
		}
		if(!isdefined(level._osc_flags[2]) || !isdefined(level._osc_flags[3]))
		{
			/#
				println("Dev Block strings are not supported");
			#/
			wait(1);
			return;
		}
		level flag::wait_till_any(Array(level._osc_flags[2], level._osc_flags[3]));
		if(level flag::get(level._osc_flags[2]))
		{
			if(level flag::get(level._osc_flags[2]))
			{
				level flag::clear(level._osc_flags[2]);
			}
			else if(level flag::get(level._osc_flags[3]))
			{
				level flag::clear(level._osc_flags[3]);
			}
			for(j = 0; j < level._osc_st.size; j++)
			{
				namespace_6d813654::deregister_hackable_struct(level._osc_st[j].focus);
				if(isdefined(level._osc_st[j].focus._light))
				{
					level._osc_st[j].focus._light delete();
				}
				if(isdefined(level._osc_st[j].focus.script_flag))
				{
					level flag::clear(level._osc_st[j].focus.script_flag);
					level._osc_st[j].focus.script_flag = "";
				}
			}
		}
		else if(level flag::get(level._osc_flags[3]))
		{
			level flag::set(level._osc_flags[1]);
			level notify("stop_dist_think");
			for(l = 0; l < level._osc_rbs.size; l++)
			{
				level._osc_rbs[l].cover.angles = level._osc_rbs[l].cover_open;
				level._osc_rbs[l].cover playsound("evt_sq_rbs_open");
			}
			for(m = 0; m < level._osc_st.size; m++)
			{
				if(isdefined(level._osc_st[m].focus._light))
				{
					level._osc_st[m].focus._light delete();
				}
				level._osc_st[m].focus.script_flag = "";
				namespace_6d813654::deregister_hackable_struct(level._osc_st[m].focus);
			}
			if(level flag::get(level._osc_flags[2]))
			{
				level flag::clear(level._osc_flags[2]);
			}
			else if(level flag::get(level._osc_flags[3]))
			{
				level flag::clear(level._osc_flags[3]);
			}
		}
	}
}

/*
	Name: moon_jolie_access
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x1A38
	Size: 0x2E8
	Parameters: 1
	Flags: None
	Line Number: 406
*/
function moon_jolie_access(ent_hacker)
{
	level thread play_moon_jolie_access_vox(ent_hacker);
	level._lid_close_sound = 1;
	for(i = 0; i < level._osc_rb_jolie_spots.size; i++)
	{
		namespace_6d813654::deregister_hackable_struct(level._osc_rb_jolie_spots[i]);
	}
	level._osc_terms = 0;
	random_array = level._osc_st;
	random_array = Array::randomize(random_array);
	for(j = 0; j < 4; j++)
	{
		/#
			println("Dev Block strings are not supported");
		#/
		random_array[j].focus._light = spawn("script_model", random_array[j].focus._light_spot.origin);
		random_array[j].focus._light.angles = random_array[j].focus._light_spot.angles;
		random_array[j].focus._light SetModel("tag_origin");
		random_array[j] function_27fd2e20(1);
		random_array[j].focus._light playsound("evt_sq_rbs_light_on");
		random_array[j].focus._light PlayLoopSound("evt_sq_rbs_light_loop", 1);
		namespace_6d813654::register_pooled_hackable_struct(random_array[j].focus, &moon_jolie_work);
	}
	level thread moon_good_jolie();
	level thread moon_bad_jolie();
	Array::thread_all(random_array, &moon_jolie_timer_vox);
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_27fd2e20
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x1D28
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 448
*/
function function_27fd2e20(var_ad826a0f)
{
	var_a58a7b24 = "struct_sq_osc0" + self.script_int;
	if(var_ad826a0f)
	{
		exploder::exploder(var_a58a7b24);
	}
	else
	{
		exploder::kill_exploder(var_a58a7b24);
	}
}

/*
	Name: moon_jolie_work
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x1D98
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 471
*/
function moon_jolie_work(ent_hacker)
{
	level._osc_terms++;
	self._light_spot function_27fd2e20(0);
	if(isdefined(self._light))
	{
		self._light playsound("evt_sq_rbs_light_off");
		self._light delete();
	}
	if(level._osc_terms < 4)
	{
		ent_hacker thread zm_audio::create_and_play_dialog("eggs", "quest3", randomIntRange(10, 12));
	}
	else
	{
		self thread play_moon_pass_vox(ent_hacker);
	}
	namespace_6d813654::deregister_hackable_struct(self);
}

/*
	Name: moon_good_jolie
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x1EA0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 501
*/
function moon_good_jolie()
{
	level endon("jolie_fail");
	level endon("jolie_pass");
	level endon(level._osc_flags[1]);
	while(level._osc_terms < 4)
	{
		/#
			println("Dev Block strings are not supported" + level._osc_terms);
		#/
		wait(0.1);
	}
	level flag::set(level._osc_flags[3]);
	level notify("jolie_pass");
}

/*
	Name: moon_bad_jolie
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x1F50
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 527
*/
function moon_bad_jolie()
{
	level endon("jolie_fail");
	level endon("jolie_pass");
	level endon(level._osc_flags[1]);
	wait(level._osc_trial_time);
	level flag::set(level._osc_flags[2]);
	level thread comp_fail_vox();
	foreach(var_c597f9d8 in level._osc_st)
	{
		var_c597f9d8 function_27fd2e20(0);
	}
	level notify("jolie_fail");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: moon_jolie_timer_vox
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x2058
	Size: 0x300
	Parameters: 0
	Flags: None
	Line Number: 554
*/
function moon_jolie_timer_vox()
{
	level endon("jolie_fail");
	level endon("jolie_pass");
	level endon(level._osc_flags[1]);
	for(i = level._osc_trial_time; i > 0; i--)
	{
		playon = self.focus._light;
		if(!isdefined(playon))
		{
			return;
		}
		if(i == 50)
		{
			playon playsound("vox_mcomp_quest_step3_2");
			var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step3_2");
			thread namespace_cc012897::Send("vox_mcomp_quest_step3_2", "all", var_53a95046);
		}
		if(i == 40)
		{
			playon playsound("vox_mcomp_quest_step3_3");
			var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step3_3");
			thread namespace_cc012897::Send("vox_mcomp_quest_step3_3", "all", var_53a95046);
		}
		if(i == 30)
		{
			playon playsound("vox_mcomp_quest_step3_4");
			var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step3_4");
			thread namespace_cc012897::Send("vox_mcomp_quest_step3_4", "all", var_53a95046);
		}
		if(i == 20)
		{
			playon playsound("vox_mcomp_quest_step3_5");
			var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step3_5");
			thread namespace_cc012897::Send("vox_mcomp_quest_step3_5", "all", var_53a95046);
		}
		if(i == 10)
		{
			playon playsound("vox_mcomp_quest_step3_6");
			var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step3_6");
			thread namespace_cc012897::Send("vox_mcomp_quest_step3_6", "all", var_53a95046);
		}
		if(i == 5)
		{
			playon playsound("vox_mcomp_quest_step3_7");
			var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step3_7");
			thread namespace_cc012897::Send("vox_mcomp_quest_step3_7", "all", var_53a95046);
		}
		wait(1);
	}
}

/*
	Name: moon_open_access
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x2360
	Size: 0x2F8
	Parameters: 0
	Flags: None
	Line Number: 616
*/
function moon_open_access()
{
	button_triggers = [];
	level flag::wait_till(level._osc_flags[1]);
	for(i = 0; i < level._osc_rbs.size; i++)
	{
		trig = spawn("trigger_radius_use", level._osc_rbs[i].origin, 0, 48, 32);
		trig.radius = 48;
		trig setcursorhint("HINT_NOICON");
		trig TriggerIgnoreTeam();
		trig._hit_already = 0;
		trig thread moon_hit_reaction();
		Array::add(button_triggers, trig, 0);
		trig = undefined;
	}
	level thread moon_access_granted(button_triggers.size);
	while(!level flag::get(level._osc_flags[9]))
	{
		level flag::wait_till(level._osc_flags[8]);
		if(!isdefined(level._osc_struct.script_float))
		{
			/#
				println("Dev Block strings are not supported");
			#/
			wait(1);
			return;
		}
		if(GetDvarInt("osc_access_time") > 0)
		{
			wait(GetDvarInt("osc_access_time"));
		}
		else
		{
			wait(level._osc_struct.script_float);
		}
		if(!level flag::get(level._osc_flags[9]))
		{
			level._osc_release = 0;
			for(K = 0; K < button_triggers.size; K++)
			{
				button_triggers[K]._hit_already = 0;
				if(isdefined(button_triggers[K]._active))
				{
					button_triggers[K]._active delete();
				}
			}
			level flag::clear(level._osc_flags[8]);
		}
	}
}

/*
	Name: moon_access_granted
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x2660
	Size: 0x178
	Parameters: 1
	Flags: None
	Line Number: 677
*/
function moon_access_granted(int_hits)
{
	level endon("end_game");
	level flag::wait_till(level._osc_flags[1]);
	while(!level flag::get(level._osc_flags[9]))
	{
		if(level._osc_release == int_hits)
		{
			level flag::set(level._osc_flags[9]);
			for(l = 0; l < level._osc_rbs.size; l++)
			{
				level._osc_rbs[l].cover.angles = level._osc_rbs[l].cover_close;
				level._osc_rbs[l].cover playsound("evt_sq_rbs_close");
				if(l == 0)
				{
					level._osc_rbs[l].cover playsound("evt_sq_rbs_button_complete");
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: moon_hit_reaction
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x27E0
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 710
*/
function moon_hit_reaction()
{
	level endon("end_game");
	level endon(level._osc_flags[9]);
	while(!level flag::get(level._osc_flags[9]))
	{
		self waittill("trigger", who);
		if(self._hit_already)
		{
			wait(0.1);
			continue;
		}
		if(zombie_utility::is_player_valid(who))
		{
			level flag::set(level._osc_flags[8]);
			self playsound("evt_sq_rbs_button");
			self._active = spawn("script_model", self.origin);
			self._active SetModel("tag_origin");
			PlayFXOnTag(level._effect["osc_button_glow"], self._active, "tag_origin");
			self._hit_already = 1;
			level._osc_release++;
		}
	}
}

/*
	Name: moon_keyhole
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x2950
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 745
*/
function moon_keyhole()
{
	level flag::wait_till(level._osc_flags[9]);
	level._osc_cap MoveZ(-8, 1);
	level._osc_cap playsound("evt_sq_rbs_open");
	level._osc_cap waittill("movedone");
	level flag::set(level._osc_flags[10]);
}

/*
	Name: hacker_debug
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x29F0
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 764
*/
function hacker_debug(msg, color)
{
	/#
		if(!isdefined(color))
		{
			color = (1, 1, 1);
		}
		while(1)
		{
			print3d(self.origin, msg, color, 1, 2, 10);
			wait(1);
		}
	#/
}

/*
	Name: play_moon_jolie_access_vox
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x2A68
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 789
*/
function play_moon_jolie_access_vox(who)
{
	for(i = 0; i < level._osc_rbs.size; i++)
	{
		level._osc_rbs[i].cover playsoundwithnotify("vox_mcomp_quest_step3_1", "rbs_sounddone");
		var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step3_1");
		thread namespace_cc012897::Send("vox_mcomp_quest_step3_1", "all", var_53a95046);
	}
	level._osc_rbs[0].cover waittill("rbs_sounddone");
	if(isdefined(who))
	{
		who thread zm_audio::create_and_play_dialog("eggs", "quest3", 9);
	}
}

/*
	Name: play_moon_pass_vox
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x2B80
	Size: 0x170
	Parameters: 1
	Flags: None
	Line Number: 814
*/
function play_moon_pass_vox(who)
{
	playsoundatposition("vox_mcomp_quest_step5_26", self.origin);
	var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step5_26");
	thread namespace_cc012897::Send("vox_mcomp_quest_step5_26", "all", var_53a95046);
	for(i = 0; i < level._osc_rbs.size; i++)
	{
		level._osc_rbs[i].cover playsoundwithnotify("vox_mcomp_quest_step5_26", "rbs_sounddone");
		var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step5_26");
		thread namespace_cc012897::Send("vox_mcomp_quest_step5_26", "all", var_53a95046);
	}
	level._osc_rbs[0].cover waittill("rbs_sounddone");
	if(isdefined(who))
	{
		who thread zm_audio::create_and_play_dialog("eggs", "quest3", 12);
	}
}

/*
	Name: comp_fail_vox
	Namespace: zm_moon_sq_osc
	Checksum: 0x424F4353
	Offset: 0x2CF8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 842
*/
function comp_fail_vox()
{
	for(i = 0; i < level._osc_rbs.size; i++)
	{
		level._osc_rbs[i].cover playsoundwithnotify("vox_mcomp_quest_step5_8", "rbs_sounddone");
		var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step5_8");
		thread namespace_cc012897::Send("vox_mcomp_quest_step5_8", "all", var_53a95046);
	}
	level._osc_rbs[0].cover waittill("rbs_sounddone");
	level._lid_close_sound = 0;
}

