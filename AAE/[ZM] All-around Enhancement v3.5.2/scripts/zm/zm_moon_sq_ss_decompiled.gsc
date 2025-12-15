#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
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

#namespace zm_moon_sq_ss;

/*
	Name: ss_debug
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x520
	Size: 0x558
	Parameters: 0
	Flags: None
	Line Number: 31
*/
function ss_debug()
{
	/#
		level endon("sq_ss1_over");
		level endon("sq_ss2_over");
		if(!isdefined(level._debug_ss))
		{
			level._debug_ss = 1;
			level.ss_val = NewDebugHudElem();
			level.ss_val.location = 0;
			level.ss_val.alignX = "Dev Block strings are not supported";
			level.ss_val.alignY = "Dev Block strings are not supported";
			level.ss_val.foreground = 1;
			level.ss_val.fontscale = 1.3;
			level.ss_val.sort = 20;
			level.ss_val.x = 10;
			level.ss_val.y = 240;
			level.ss_val.og_scale = 1;
			level.ss_val.color = VectorScale((1, 1, 1), 255);
			level.ss_val.alpha = 1;
			level.ss_val_text = NewDebugHudElem();
			level.ss_val_text.location = 0;
			level.ss_val_text.alignX = "Dev Block strings are not supported";
			level.ss_val_text.alignY = "Dev Block strings are not supported";
			level.ss_val_text.foreground = 1;
			level.ss_val_text.fontscale = 1.3;
			level.ss_val_text.sort = 20;
			level.ss_val_text.x = 0;
			level.ss_val_text.y = 240;
			level.ss_val_text.og_scale = 1;
			level.ss_val_text.color = VectorScale((1, 1, 1), 255);
			level.ss_val_text.alpha = 1;
			level.ss_val_text setText("Dev Block strings are not supported");
			level.ss_user_val = NewDebugHudElem();
			level.ss_user_val.location = 0;
			level.ss_user_val.alignX = "Dev Block strings are not supported";
			level.ss_user_val.alignY = "Dev Block strings are not supported";
			level.ss_user_val.foreground = 1;
			level.ss_user_val.fontscale = 1.3;
			level.ss_user_val.sort = 20;
			level.ss_user_val.x = 10;
			level.ss_user_val.y = 270;
			level.ss_user_val.og_scale = 1;
			level.ss_user_val.color = VectorScale((1, 1, 1), 255);
			level.ss_user_val.alpha = 1;
			level.ss_user_val_text = NewDebugHudElem();
			level.ss_user_val_text.location = 0;
			level.ss_user_val_text.alignX = "Dev Block strings are not supported";
			level.ss_user_val_text.alignY = "Dev Block strings are not supported";
			level.ss_user_val_text.foreground = 1;
			level.ss_user_val_text.fontscale = 1.3;
			level.ss_user_val_text.sort = 20;
			level.ss_user_val_text.x = 0;
			level.ss_user_val_text.y = 270;
			level.ss_user_val_text.og_scale = 1;
			level.ss_user_val_text.color = VectorScale((1, 1, 1), 255);
			level.ss_user_val_text.alpha = 1;
			level.ss_user_val_text setText("Dev Block strings are not supported");
		}
		while(1)
		{
			if(isdefined(level._ss_user_seq))
			{
				STR = "Dev Block strings are not supported";
				for(i = 0; i < level._ss_user_seq.size; i++)
				{
					STR = STR + level._ss_user_seq[i];
				}
				level.ss_user_val setText(STR);
			}
			else
			{
				level.ss_user_val setText("Dev Block strings are not supported");
			}
			wait(0.1);
		}
	#/
}

/*
	Name: init_1
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0xA80
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function init_1()
{
	level flag::init("displays_active");
	level flag::init("wait_for_hack");
	zm_sidequests::declare_sidequest_stage("sq", "ss1", &init_stage_1, &stage_logic, &exit_stage_1);
	Buttons = GetEntArray("sq_ss_button", "targetname");
	for(i = 0; i < Buttons.size; i++)
	{
		ent = GetEnt(Buttons[i].target, "targetname");
		Buttons[i].terminal_model = ent;
	}
	level._ss_buttons = Buttons;
}

/*
	Name: init_2
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0xBD0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 144
*/
function init_2()
{
	zm_sidequests::declare_sidequest_stage("sq", "ss2", &init_stage_2, &stage_logic, &exit_stage_2);
}

/*
	Name: init_stage_1
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0xC30
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 159
*/
function init_stage_1()
{
	level flag::clear("wait_for_hack");
	level._ss_stage = 1;
}

/*
	Name: init_stage_2
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0xC68
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 175
*/
function init_stage_2()
{
	level._ss_stage = 2;
}

/*
	Name: ss2_hack
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0xC80
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 190
*/
function ss2_hack(hacker)
{
	level flag::clear("wait_for_hack");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: stage_logic
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0xCB8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 207
*/
function stage_logic()
{
	Buttons = level._ss_buttons;
	Array::thread_all(Buttons, &sq_ss_button_thread);
	if(isdefined(level._ss_hacks))
	{
		for(i = 0; i < level._ss_hacks.size; i++)
		{
			namespace_6d813654::deregister_hackable_struct(level._ss_hacks[i]);
		}
	}
	level thread ss_debug();
	if(level._ss_stage == 1)
	{
		do_ss1_logic();
	}
	else
	{
		do_ss2_logic();
	}
	zm_sidequests::stage_completed("sq", "ss" + level._ss_stage);
}

/*
	Name: do_ss1_logic
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0xDD0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 240
*/
function do_ss1_logic()
{
	ss_logic(6, 1);
}

/*
	Name: do_ss2_logic
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0xDF8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 255
*/
function do_ss2_logic()
{
	level.ss_comp_vox_count = 0;
	ss_logic(6, 3);
	wait(2);
	level notify("RL");
	ss_logic(7, 4);
	wait(2);
	level notify("RL");
	ss_logic(8, 5);
	wait(2);
	level notify("RL");
	return;
	ERROR: Bad function call
}

/*
	Name: generate_sequence
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0xEA0
	Size: 0x218
	Parameters: 1
	Flags: None
	Line Number: 281
*/
function generate_sequence(seq_length)
{
	seq = [];
	for(i = 0; i < seq_length; i++)
	{
		seq[seq.size] = randomIntRange(0, 4);
	}
	last = -1;
	num_reps = 0;
	for(i = 0; i < seq_length; i++)
	{
		if(seq[i] == last)
		{
			num_reps++;
			if(num_reps >= 2)
			{
				while(seq[i] == last)
				{
					seq[i] = randomIntRange(0, 4);
				}
				num_reps = 0;
				last = seq[i];
				continue;
			}
		}
		last = seq[i];
		num_reps = 0;
	}
	/#
		if(isdefined(level.ss_val))
		{
			STR = "Dev Block strings are not supported";
			for(i = 0; i < seq.size; i++)
			{
				STR = STR + seq[i];
			}
			level.ss_val setText(STR);
		}
	#/
	if(1 == GetDvarInt("scr_debug_ss"))
	{
		for(i = 0; i < seq.size; i++)
		{
			seq[i] = 0;
		}
	}
	return seq;
}

/*
	Name: kill_debug
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x10C0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 340
*/
function kill_debug()
{
	/#
		if(isdefined(level.ss_val))
		{
			level.ss_val destroy();
			level.ss_val = undefined;
			level.ss_val_text destroy();
			level.ss_val_text = undefined;
			level.ss_user_val destroy();
			level.ss_user_val = undefined;
			level.ss_user_val_text destroy();
			level.ss_user_val_text = undefined;
			level._debug_ss = undefined;
		}
	#/
}

/*
	Name: exit_stage_1
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x1168
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 368
*/
function exit_stage_1(success)
{
	kill_debug();
	level flag::set("ss1");
	Array::thread_all(level._ss_buttons, &sq_ss_button_dud_thread);
}

/*
	Name: exit_stage_2
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x11D8
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 385
*/
function exit_stage_2(success)
{
	kill_debug();
}

/*
	Name: sq_ss_button_dud_thread
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x1200
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 400
*/
function sq_ss_button_dud_thread()
{
	self endon("ss_kill_button_thread");
	self thread sq_ss_button_thread(1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: sq_ss_button_debug
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x1230
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 418
*/
function sq_ss_button_debug()
{
	level endon("ss_kill_button_thread");
	level endon("sq_ss1_over");
	level endon("sq_ss2_over");
	while(1)
	{
		/#
			print3d(self.origin + VectorScale((0, 0, 1), 12), self.script_int, VectorScale((0, 1, 0), 255), 1);
		#/
		wait(0.1);
	}
}

/*
	Name: do_attract
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x12B0
	Size: 0x360
	Parameters: 0
	Flags: None
	Line Number: 442
*/
function do_attract()
{
	level flag::set("displays_active");
	Buttons = level._ss_buttons;
	for(i = 0; i < Buttons.size; i++)
	{
		ent = Buttons[i].terminal_model;
		ent SetModel("p7_zm_moo_computer_rocket_launch");
	}
	for(i = 0; i < Buttons.size; i++)
	{
		button = undefined;
		for(j = 0; j < Buttons.size; j++)
		{
			if(Buttons[j].script_int == i)
			{
				button = Buttons[j];
			}
		}
		if(isdefined(button))
		{
			ent = button.terminal_model;
			model = get_console_model(button.script_int);
			ent SetModel(model);
			ent playsound(color_sound_selector(button.script_int));
			wait(0.6);
			ent SetModel("p7_zm_moo_computer_rocket_launch");
		}
	}
	level thread do_ss_start_vox(level._ss_stage);
	for(i = Buttons.size - 1; i >= 0; i--)
	{
		button = undefined;
		for(j = 0; j < Buttons.size; j++)
		{
			if(Buttons[j].script_int == i)
			{
				button = Buttons[j];
			}
		}
		if(isdefined(button))
		{
			ent = button.terminal_model;
			model = get_console_model(button.script_int);
			ent SetModel(model);
			ent playsound(color_sound_selector(button.script_int));
			wait(0.6);
			ent SetModel("p7_zm_moo_computer_rocket_launch");
		}
	}
	wait(0.5);
	level flag::clear("displays_active");
}

/*
	Name: sq_ss_button_thread
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x1618
	Size: 0x190
	Parameters: 1
	Flags: None
	Line Number: 506
*/
function sq_ss_button_thread(dud)
{
	level endon("sq_ss1_over");
	level endon("sq_ss2_over");
	if(!isdefined(dud))
	{
		self notify("ss_kill_button_thread");
	}
	pos = self.origin;
	pressed = self.origin - AnglesToRight(self.angles) * 0.25;
	targ_model = self.terminal_model;
	while(1)
	{
		self waittill("trigger");
		if(!level flag::get("displays_active"))
		{
			if(!isdefined(dud))
			{
				if(isdefined(level._ss_user_seq))
				{
					level._ss_user_seq[level._ss_user_seq.size] = self.script_int;
				}
			}
			model = get_console_model(self.script_int);
			targ_model playsound(color_sound_selector(self.script_int));
			targ_model SetModel(model);
		}
		wait(0.3);
		targ_model SetModel("p7_zm_moo_computer_rocket_launch");
	}
}

/*
	Name: get_console_model
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x17B0
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 548
*/
function get_console_model(num)
{
	model = "p7_zm_moo_computer_rocket_launch";
	switch(num)
	{
		case 0:
		{
			model = "p7_zm_moo_computer_rocket_launch_red";
			break;
		}
		case 1:
		{
			model = "p7_zm_moo_computer_rocket_launch_green";
			break;
		}
		case 2:
		{
			model = "p7_zm_moo_computer_rocket_launch_blue";
			break;
		}
		case 3:
		{
			model = "p7_zm_moo_computer_rocket_launch_yellow";
			break;
		}
	}
	return model;
}

/*
	Name: ss_logic
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x1850
	Size: 0x130
	Parameters: 2
	Flags: None
	Line Number: 587
*/
function ss_logic(seq_length, seq_start_length)
{
	seq = generate_sequence(seq_length);
	level._ss_user_seq = [];
	level._ss_sequence_matched = 0;
	fails = 0;
	while(!level._ss_sequence_matched)
	{
		wait(0.5);
		self thread ss_logic_internal(seq, seq_length, seq_start_length);
		self util::waittill_either("ss_won", "ss_failed");
		if(level._ss_sequence_matched)
		{
			display_success(seq);
		}
		else
		{
			display_fail();
			fails++;
			if(fails == 4)
			{
				seq = generate_sequence(seq_length);
				fails = 0;
			}
		}
	}
}

/*
	Name: ss_logic_internal
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x1988
	Size: 0x100
	Parameters: 3
	Flags: None
	Line Number: 625
*/
function ss_logic_internal(seq, seq_length, seq_start_length)
{
	self endon("ss_won");
	self endon("ss_failed");
	do_attract();
	pos = seq_start_length;
	Buttons = level._ss_buttons;
	for(i = pos; i <= seq_length; i++)
	{
		level._ss_user_seq = [];
		display_seq(Buttons, seq, i);
		wait(1);
		validate_input(seq, i);
		wait(1);
	}
	level._ss_sequence_matched = 1;
	self notify("ss_won");
}

/*
	Name: user_input_timeout
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x1A90
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 654
*/
function user_input_timeout(len)
{
	self endon("correct_input");
	self endon("ss_failed");
	self endon("ss_won");
	wait(len * 4);
	self notify("ss_failed");
}

/*
	Name: validate_input
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x1AE0
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 673
*/
function validate_input(sequence, len)
{
	self thread user_input_timeout(len);
	while(level._ss_user_seq.size < len)
	{
		for(i = 0; i < level._ss_user_seq.size; i++)
		{
			if(level._ss_user_seq[i] != sequence[i])
			{
				self notify("ss_failed");
			}
		}
		wait(0.05);
	}
	for(i = 0; i < level._ss_user_seq.size; i++)
	{
		if(level._ss_user_seq[i] != sequence[i])
		{
			self notify("ss_failed");
		}
	}
	level._ss_user_seq = [];
	self notify("correct_input");
	return;
}

/*
	Name: display_fail
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x1BF8
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 709
*/
function display_fail()
{
	level flag::set("displays_active");
	Buttons = level._ss_buttons;
	level thread do_ss_failure_vox(level._ss_stage);
	all_screens_black = 0;
	while(!all_screens_black)
	{
		all_screens_black = 1;
		for(i = 0; i < Buttons.size; i++)
		{
			ent = Buttons[i].terminal_model;
			if(ent.model != "p7_zm_moo_computer_rocket_launch")
			{
				all_screens_black = 0;
				break;
			}
		}
		wait(0.1);
	}
	level thread sound::play_in_space("evt_ss_wrong", (-1006.3, 294.2, -93.7));
	for(i = 0; i < 5; i++)
	{
		for(j = 0; j < Buttons.size; j++)
		{
			ent = Buttons[j].terminal_model;
			ent SetModel("p7_zm_moo_computer_rocket_launch_red");
		}
		wait(0.2);
		for(j = 0; j < Buttons.size; j++)
		{
			ent = Buttons[j].terminal_model;
			ent SetModel("p7_zm_moo_computer_rocket_launch");
		}
		wait(0.05);
	}
	level flag::clear("displays_active");
}

/*
	Name: play_win_seq
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x1E38
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 758
*/
function play_win_seq(seq)
{
	for(i = 0; i < seq.size; i++)
	{
		level thread sound::play_in_space(color_sound_selector(seq[i]), (-1006.3, 294.2, -93.7));
		wait(0.2);
	}
}

/*
	Name: display_success
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x1EC8
	Size: 0x228
	Parameters: 1
	Flags: None
	Line Number: 777
*/
function display_success(seq)
{
	level flag::set("displays_active");
	Buttons = level._ss_buttons;
	level thread do_ss_success_vox(level._ss_stage);
	all_screens_black = 0;
	while(!all_screens_black)
	{
		all_screens_black = 1;
		for(i = 0; i < Buttons.size; i++)
		{
			ent = Buttons[i].terminal_model;
			if(ent.model != "p7_zm_moo_computer_rocket_launch")
			{
				all_screens_black = 0;
				break;
			}
		}
		wait(0.1);
	}
	level thread play_win_seq(seq);
	for(i = 0; i < 5; i++)
	{
		for(j = 0; j < Buttons.size; j++)
		{
			ent = Buttons[j].terminal_model;
			ent SetModel("p7_zm_moo_computer_rocket_launch_green");
		}
		wait(0.2);
		for(j = 0; j < Buttons.size; j++)
		{
			ent = Buttons[j].terminal_model;
			ent SetModel("p7_zm_moo_computer_rocket_launch");
		}
		wait(0.05);
	}
	level flag::clear("displays_active");
}

/*
	Name: display_seq
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x20F8
	Size: 0x220
	Parameters: 3
	Flags: None
	Line Number: 826
*/
function display_seq(Buttons, seq, index)
{
	level flag::set("displays_active");
	for(i = 0; i < index; i++)
	{
		print_duration = 1;
		wait_duration = 0.4;
		if(i < index - 1)
		{
			print_duration = print_duration / 2;
			wait_duration = wait_duration / 2;
		}
		for(j = 0; j < Buttons.size; j++)
		{
			ent = Buttons[j].terminal_model;
			model = get_console_model(seq[i]);
			level thread sound::play_in_space(color_sound_selector(seq[i]), (-1006.3, 294.2, -93.7));
			ent SetModel(model);
		}
		wait(print_duration);
		for(j = 0; j < Buttons.size; j++)
		{
			ent = Buttons[j].terminal_model;
			ent SetModel("p7_zm_moo_computer_rocket_launch");
		}
		wait(wait_duration);
	}
	level flag::clear("displays_active");
}

/*
	Name: color_sound_selector
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x2320
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 866
*/
function color_sound_selector(index)
{
	switch(index)
	{
		case 0:
		{
			return "evt_ss_e";
		}
		case 1:
		{
			return "evt_ss_d";
		}
		case 2:
		{
			return "evt_ss_c";
		}
		case 3:
		{
			return "evt_ss_lo_g";
		}
	}
}

/*
	Name: do_ss_start_vox
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x2388
	Size: 0x198
	Parameters: 1
	Flags: None
	Line Number: 899
*/
function do_ss_start_vox(stage)
{
	playon = level._ss_buttons[1].terminal_model;
	if(stage == 1)
	{
		player = is_player_close_enough(playon);
		if(isdefined(player))
		{
			var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step1_0");
			thread namespace_cc012897::Send("vox_mcomp_quest_step1_0", "all", var_53a95046);
			playon playsoundwithnotify("vox_mcomp_quest_step1_0", "mcomp_done0");
			playon waittill("mcomp_done0");
			if(isdefined(player))
			{
				player thread zm_audio::create_and_play_dialog("eggs", "quest1", 0);
			}
		}
	}
	else if(level.ss_comp_vox_count == 0)
	{
		var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step7_0");
		thread namespace_cc012897::Send("vox_mcomp_quest_step7_0", "all", var_53a95046);
		playon playsoundwithnotify("vox_mcomp_quest_step7_0", "mcomp_done1");
	}
}

/*
	Name: do_ss_failure_vox
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x2528
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 935
*/
function do_ss_failure_vox(stage)
{
	playon = level._ss_buttons[1].terminal_model;
	if(stage == 1)
	{
		player = is_player_close_enough(playon);
		if(isdefined(player))
		{
			var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step1_1");
			thread namespace_cc012897::Send("vox_mcomp_quest_step1_1", "all", var_53a95046);
			playon playsoundwithnotify("vox_mcomp_quest_step1_1", "mcomp_done2");
			playon waittill("mcomp_done2");
			if(isdefined(player))
			{
				player thread zm_audio::create_and_play_dialog("eggs", "quest1", 1);
			}
		}
	}
	else
	{
		player = is_player_close_enough(playon);
		if(isdefined(player))
		{
			switch(level.ss_comp_vox_count)
			{
				case 0:
				{
					player thread zm_audio::create_and_play_dialog("eggs", "quest1", 1);
					break;
				}
				case 1:
				{
					player thread zm_audio::create_and_play_dialog("eggs", "quest7", 1);
					break;
				}
				case 2:
				{
					player thread zm_audio::create_and_play_dialog("eggs", "quest7", 3);
					break;
				}
			}
		}
	}
}

/*
	Name: do_ss_success_vox
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x2730
	Size: 0x338
	Parameters: 1
	Flags: None
	Line Number: 990
*/
function do_ss_success_vox(stage)
{
	playon = level._ss_buttons[1].terminal_model;
	if(stage == 1)
	{
		player = is_player_close_enough(playon);
		if(isdefined(player))
		{
			var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step1_2");
			thread namespace_cc012897::Send("vox_mcomp_quest_step1_2", "all", var_53a95046);
			playon playsoundwithnotify("vox_mcomp_quest_step1_2", "mcomp_done3");
			playon waittill("mcomp_done3");
			if(isdefined(player))
			{
				player thread zm_audio::create_and_play_dialog("eggs", "quest1", 2);
			}
		}
	}
	else
	{
		switch(level.ss_comp_vox_count)
		{
			case 0:
			{
				var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step7_2");
				thread namespace_cc012897::Send("vox_mcomp_quest_step7_2", "all", var_53a95046);
				playon playsoundwithnotify("vox_mcomp_quest_step7_2", "mcomp_done4");
				level.ss_comp_vox_count++;
				break;
			}
			case 1:
			{
				var_53a95046 = soundgetplaybacktime("vox_mcomp_hack_success");
				thread namespace_cc012897::Send("vox_mcomp_hack_success", "all", var_53a95046);
				playon playsoundwithnotify("vox_mcomp_hack_success", "mcomp_done5");
				level.ss_comp_vox_count++;
				break;
			}
			case 2:
			{
				var_53a95046 = soundgetplaybacktime("vox_mcomp_quest_step7_4");
				thread namespace_cc012897::Send("vox_mcomp_quest_step7_4", "all", var_53a95046);
				playon playsoundwithnotify("vox_mcomp_quest_step7_4", "mcomp_done6");
				playon waittill("mcomp_done6");
				if(!level flag::get("be2"))
				{
					var_53a95046 = soundgetplaybacktime("vox_xcomp_quest_step7_5");
					thread namespace_cc012897::Send("vox_xcomp_quest_step7_5", "all", var_53a95046);
					playon playsoundwithnotify("vox_xcomp_quest_step7_5", "xcomp_done7");
					break;
				}
			}
		}
	}
}

/*
	Name: is_player_close_enough
	Namespace: zm_moon_sq_ss
	Checksum: 0x424F4353
	Offset: 0x2A70
	Size: 0x9C
	Parameters: 1
	Flags: None
	Line Number: 1056
*/
function is_player_close_enough(org)
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(DistanceSquared(org.origin, players[i].origin) <= 5625)
		{
			return players[i];
		}
	}
	return undefined;
}

