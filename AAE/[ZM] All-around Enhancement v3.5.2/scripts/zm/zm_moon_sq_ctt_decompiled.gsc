#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\sound_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zm_moon_amb;
#include scripts\zm\zm_moon_ffotd;
#include scripts\zm\zm_moon_sq;

#namespace zm_moon_sq_ctt;

/*
	Name: init_1
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x590
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 31
*/
function init_1()
{
	level._active_tanks = [];
	zm_spawner::add_custom_zombie_spawn_logic(&tank_volume_death_check);
	zm_sidequests::declare_sidequest_stage("tanks", "ctt1", &init_stage_1, &stage_logic, &exit_stage_1);
	return;
}

/*
	Name: init_stage_1
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x620
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function init_stage_1()
{
	level._active_tanks = [];
	level._cur_stage_name = "ctt1";
	level._ctt_pause_flag = "sam_switch_thrown";
	level._charge_flag = "first_tanks_charged";
	add_tank("sq_first_tank");
	level clientfield::increment("charge_tank_1");
	level thread setup_and_play_ctt1_vox();
}

/*
	Name: exit_stage_1
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x6C0
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 70
*/
function exit_stage_1(success)
{
	kill_tanks();
}

/*
	Name: init_2
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x6E8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 85
*/
function init_2()
{
	zm_sidequests::declare_sidequest_stage("tanks", "ctt2", &init_stage_2, &stage_logic, &exit_stage_2);
	return;
}

/*
	Name: init_stage_2
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x748
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 101
*/
function init_stage_2()
{
	level._active_tanks = [];
	level._cur_stage_name = "ctt2";
	level._ctt_pause_flag = "cvg_placed";
	level._charge_flag = "second_tanks_charged";
}

/*
	Name: exit_stage_2
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x790
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 119
*/
function exit_stage_2(success)
{
	level flag::set("second_tanks_charged");
	kill_tanks();
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: stage_logic
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x7D8
	Size: 0x550
	Parameters: 0
	Flags: None
	Line Number: 138
*/
function stage_logic()
{
	if(level._cur_stage_name == "ctt2")
	{
		s = struct::get("sq_vg_final", "targetname");
		r_close = 0;
		while(!r_close)
		{
			players = GetPlayers();
			for(i = 0; i < players.size; i++)
			{
				ent_num = players[i].characterindex;
				if(isdefined(players[i].zm_random_char))
				{
					ent_num = players[i].zm_random_char;
				}
				if(ent_num == 2)
				{
					d = DistanceSquared(players[i].origin, s.origin);
					if(d < 57600)
					{
						r_close = 1;
						var_53a95046 = soundgetplaybacktime("vox_plr_2_quest_step6_0");
						thread namespace_cc012897::Send("vox_plr_2_quest_step6_0", "all", var_53a95046);
						players[i] playsound("vox_plr_2_quest_step6_0");
						break;
						continue;
					}
				}
				if(!zm_moon_ffotd::function_5c35365f() && level.activePlayers.size == 1)
				{
					r_close = 1;
					break;
				}
			}
			wait(0.1);
		}
		add_tank("sq_first_tank", "sq_second_tank");
		level clientfield::increment("charge_tank_2");
		level thread setup_and_play_ctt2_vox();
		level thread hit_sam();
	}
	while(1)
	{
		if(all_tanks_full())
		{
			sound::play_in_space("zmb_squest_all_souls_full", (0, 0, 0));
			level notify("ctt_aud_note");
			break;
		}
		wait(0.1);
	}
	level clientfield::increment("charge_tank_cleanup");
	level flag::set(level._charge_flag);
	level flag::wait_till(level._ctt_pause_flag);
	drain_tanks();
	for(i = 0; i < level._active_tanks.size; i++)
	{
		tank = level._active_tanks[i];
		tank.capacitor moveto(tank.capacitor.origin + VectorScale((0, 0, 1), 12), 2);
		tank.tank moveto(tank.tank.origin - VectorScale((0, 0, 1), 57.156), 2);
		tank.tank playsound("evt_tube_move_down");
		tank.tank util::delay(2, undefined, &exploder::stop_exploder, "canister_light_0" + tank.tank.script_int);
		tank.tank thread play_delayed_stop_sound(2);
		tank TriggerEnable(0);
	}
	wait(2);
	if(level._cur_stage_name == "ctt2")
	{
		level flag::set("second_tanks_drained");
	}
	else
	{
		level flag::set("first_tanks_drained");
	}
	zm_sidequests::stage_completed("tanks", level._cur_stage_name);
}

/*
	Name: play_delayed_stop_sound
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0xD30
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 226
*/
function play_delayed_stop_sound(time)
{
	wait(time);
	self playsound("evt_tube_stop");
}

/*
	Name: build_sam_stage
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0xD68
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 242
*/
function build_sam_stage(percent, l)
{
	s = spawnstruct();
	s.percent = percent;
	s.line = l;
	return s;
}

/*
	Name: percent_full
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0xDD0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 260
*/
function percent_full()
{
	max_fill = 0;
	Fill = 0;
	for(i = 0; i < level._active_tanks.size; i++)
	{
		max_fill = max_fill + level._active_tanks[i].max_fill;
		Fill = Fill + level._active_tanks[i].Fill;
	}
	return Fill / max_fill;
}

/*
	Name: hit_sam
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0xE80
	Size: 0x248
	Parameters: 0
	Flags: None
	Line Number: 282
*/
function hit_sam()
{
	level endon("tanks_ctt2_over");
	stages = Array(build_sam_stage(0.1, "vox_plr_4_quest_step6_1"), build_sam_stage(0.2, "vox_plr_4_quest_step6_1a"), build_sam_stage(0.3, "vox_plr_4_quest_step6_2"), build_sam_stage(0.4, "vox_plr_4_quest_step6_2a"), build_sam_stage(0.5, "vox_plr_4_quest_step6_3"), build_sam_stage(0.6, "vox_plr_4_quest_step6_3a"), build_sam_stage(0.7, "vox_plr_4_quest_step6_4"), build_sam_stage(0.9, "vox_plr_4_quest_step6_5"));
	index = 0;
	targ = struct::get("sq_sam", "targetname");
	targ = struct::get(targ.target, "targetname");
	while(index < stages.size)
	{
		stage = stages[index];
		while(percent_full() < stage.percent)
		{
			wait(0.1);
		}
		level.skit_vox_override = 1;
		level thread play_sam_vo(stage.line, targ.origin, index);
		level.skit_vox_override = 0;
		index++;
	}
}

/*
	Name: play_sam_vo
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x10D0
	Size: 0x120
	Parameters: 3
	Flags: None
	Line Number: 313
*/
function play_sam_vo(_line, origin, index)
{
	level clientfield::set("sam_vo_rumble", 1);
	snd_ent = spawn("script_origin", origin);
	var_53a95046 = soundgetplaybacktime(_line);
	thread namespace_cc012897::Send(_line, "all", var_53a95046);
	snd_ent playsoundwithnotify(_line, index + "_snddone");
	snd_ent waittill(index + "_snddone");
	level clientfield::set("sam_vo_rumble", 0);
	snd_ent delete();
}

/*
	Name: drain_tanks
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x11F8
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 335
*/
function drain_tanks()
{
	for(i = 0; i < level._active_tanks.size; i++)
	{
		tank = level._active_tanks[i];
		tank.fill_model moveto(tank.fill_model.origin - VectorScale((0, 0, 1), 65), 1.5, 0.1, 0.1);
		tank.tank StopLoopSound(1);
		tank.tank playsound("evt_souls_flush");
		tank.fill_model thread delay_hide();
		tank.Fill = 0;
	}
	wait(2);
	return;
	ERROR: Bad function call
}

/*
	Name: delay_hide
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x1320
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 361
*/
function delay_hide()
{
	wait(2);
	self ghost();
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: all_tanks_full
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x1348
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 380
*/
function all_tanks_full()
{
	if(level._active_tanks.size == 0)
	{
		return 0;
	}
	for(i = 0; i < level._active_tanks.size; i++)
	{
		tank = level._active_tanks[i];
		if(tank.Fill < tank.max_fill)
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: kill_tanks
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x13D8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 407
*/
function kill_tanks()
{
	level clientfield::increment("charge_tank_cleanup");
	tanks = GetEntArray("ctt_tank", "script_noteworthy");
	for(i = 0; i < tanks.size; i++)
	{
		tank = tanks[i];
		tank.capacitor delete();
		tank.capacitor = undefined;
		tank.tank = undefined;
		tank.fill_model delete();
		tank.fill_model = undefined;
		tank delete();
	}
	return;
	ERROR: Bad function call
}

/*
	Name: movetopos
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x14F0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 435
*/
function movetopos(pos)
{
	self moveto(pos, 1);
}

/*
	Name: add_tank
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x1528
	Size: 0x510
	Parameters: 2
	Flags: None
	Line Number: 450
*/
function add_tank(tank_name, other_tank_name)
{
	tanks = struct::get_array(tank_name, "targetname");
	if(isdefined(other_tank_name))
	{
		tanks = ArrayCombine(tanks, struct::get_array(other_tank_name, "targetname"), 0, 0);
	}
	for(i = 0; i < tanks.size; i++)
	{
		tank = tanks[i];
		radius = 32;
		if(isdefined(tank.radius))
		{
			radius = tank.radius;
		}
		height = 72;
		if(isdefined(tank.height))
		{
			height = tank.height;
		}
		tank_trigger = spawn("trigger_radius", tank.origin, 1, radius, height);
		tank_trigger.script_noteworthy = "ctt_tank";
		capacitor_struct = struct::get(tank.target, "targetname");
		capacitor_model = spawn("script_model", capacitor_struct.origin + VectorScale((0, 0, 1), 18));
		capacitor_model.angles = capacitor_struct.angles;
		capacitor_model SetModel(capacitor_struct.model);
		capacitor_model thread movetopos(capacitor_struct.origin);
		tank_trigger.capacitor = capacitor_model;
		tank_model = GetEnt(capacitor_struct.target, "targetname");
		tank_model thread movetopos(tank_model.origin + VectorScale((0, 0, 1), 57.156));
		tank_model playsound("evt_tube_move_up");
		tank_model util::delay(2, undefined, &exploder::exploder, "canister_light_0" + tank_model.script_int);
		tank_model thread play_delayed_stop_sound(1);
		tank_trigger.tank = tank_model;
		tank_trigger.Fill = 0;
		scalar = 1;
		scalar = scalar + GetPlayers().size - 1 * 0.33;
		tank_trigger.max_fill = Int(25 * scalar);
		max_fill = struct::get(tank_model.target, "targetname");
		tank_trigger.tank.fill_step = max_fill.origin[2] - tank_model.origin[2] + 53 / tank_trigger.max_fill;
		tank_fill_model = util::spawn_model(max_fill.model, tank_trigger.tank.origin + VectorScale((0, 0, 1), 2));
		tank_fill_model ghost();
		tank_trigger.fill_model = tank_fill_model;
		tank_trigger.script_int = function_f696ffe2(tank.origin);
		level._active_tanks[level._active_tanks.size] = tank_trigger;
	}
}

/*
	Name: function_f696ffe2
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x1A40
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 508
*/
function function_f696ffe2(origin)
{
	if(origin == (301.7, 3687.5, -579))
	{
		return 1;
	}
	if(origin == (-207.8, 4164.8, -579))
	{
		return 2;
	}
	if(origin == (-211.1, 3703.2, -579))
	{
		return 3;
	}
	if(origin == (293.5, 4173.4, -579))
	{
		return 4;
	}
}

/*
	Name: do_tank_fill
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x1AE8
	Size: 0x228
	Parameters: 2
	Flags: None
	Line Number: 538
*/
function do_tank_fill(actor, tank)
{
	if(tank.Fill >= tank.max_fill)
	{
		return;
	}
	actor clientfield::set("ctt", 1);
	wait(0.5);
	if(tank.Fill <= 0)
	{
		level notify("ctt_first_kill");
	}
	if(isdefined(tank) && tank.Fill < tank.max_fill)
	{
		tank.Fill++;
		tank.fill_model.origin = tank.fill_model.origin + (0, 0, tank.tank.fill_step);
		tank.fill_model show();
		util::setClientSysState("aae_soulcounter", "tank" + tank.script_int + "," + tank.Fill + "," + tank.max_fill);
	}
	if(tank.Fill >= tank.max_fill)
	{
		tank.tank playsound("zmb_squest_tank_full");
		tank.tank PlayLoopSound("zmb_squest_tank_full_lp", 1);
		util::setClientSysState("aae_soulcounter", "tank" + tank.script_int + ",0,0");
	}
}

/*
	Name: tank_volume_death_check
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x1D18
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 575
*/
function tank_volume_death_check()
{
	self waittill("death", attacker);
	if(!isPlayer(attacker))
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	for(i = 0; i < level._active_tanks.size; i++)
	{
		if(isdefined(level._active_tanks[i]))
		{
			if(self istouching(level._active_tanks[i]))
			{
				level thread do_tank_fill(self, level._active_tanks[i]);
				return;
			}
		}
	}
}

/*
	Name: setup_and_play_ctt1_vox
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x1DF0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 609
*/
function setup_and_play_ctt1_vox()
{
	level thread ctt1_first_kill_vox();
	level thread ctt1_full_vox();
	level thread vox_override_while_near_tank();
	level thread ctt1_fifty_percent_vox();
}

/*
	Name: ctt1_first_kill_vox
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x1E60
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 627
*/
function ctt1_first_kill_vox()
{
	level waittill("ctt_first_kill");
	for(i = 0; i < level._active_tanks.size; i++)
	{
		player = zm_utility::get_closest_player(level._active_tanks[i].origin);
		if(isdefined(player))
		{
			player thread zm_audio::create_and_play_dialog("eggs", "quest4", 0);
			return;
		}
	}
}

/*
	Name: ctt1_fifty_percent_vox
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x1F10
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 651
*/
function ctt1_fifty_percent_vox()
{
	while(percent_full() < 0.5)
	{
		wait(0.5);
	}
	players = GetPlayers();
	players[randomIntRange(0, players.size)] thread zm_audio::create_and_play_dialog("eggs", "quest4", 1);
}

/*
	Name: ctt1_full_vox
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x1FB0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 671
*/
function ctt1_full_vox()
{
	level waittill("ctt_aud_note");
	players = GetPlayers();
	players[randomIntRange(0, players.size)] thread zm_audio::create_and_play_dialog("eggs", "quest4", 2);
}

/*
	Name: vox_override_while_near_tank
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x2038
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 688
*/
function vox_override_while_near_tank()
{
	while(!level flag::get("sam_switch_thrown"))
	{
		while(level.zones["generator_zone"].is_occupied)
		{
			level.skit_vox_override = 1;
			if(level flag::get("sam_switch_thrown"))
			{
				break;
			}
			wait(1);
		}
		level.skit_vox_override = 0;
		wait(1);
	}
	level.skit_vox_override = 1;
	wait(10);
	level.skit_vox_override = 0;
}

/*
	Name: setup_and_play_ctt2_vox
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x20F8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 719
*/
function setup_and_play_ctt2_vox()
{
	level thread vox_override_while_near_tank2();
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: ctt2_full_vox
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x2120
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 737
*/
function ctt2_full_vox()
{
	level waittill("ctt_aud_note");
	players = GetPlayers();
	players[randomIntRange(0, players.size)] thread zm_audio::create_and_play_dialog("eggs", "quest6", 6);
}

/*
	Name: vox_override_while_near_tank2
	Namespace: zm_moon_sq_ctt
	Checksum: 0x424F4353
	Offset: 0x21A8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 754
*/
function vox_override_while_near_tank2()
{
	while(!level flag::get("cvg_placed"))
	{
		while(level.zones["generator_zone"].is_occupied)
		{
			level.skit_vox_override = 1;
			if(level flag::get("cvg_placed"))
			{
				break;
			}
			wait(1);
		}
		level.skit_vox_override = 0;
		wait(1);
	}
	level.skit_vox_override = 1;
	wait(10);
	level.skit_vox_override = 0;
}

