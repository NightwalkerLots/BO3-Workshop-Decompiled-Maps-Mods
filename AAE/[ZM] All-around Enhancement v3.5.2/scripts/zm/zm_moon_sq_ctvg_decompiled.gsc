#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\sound_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_black_hole_bomb;
#include scripts\zm\_zm_weap_quantum_bomb;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zm_moon_amb;
#include scripts\zm\zm_moon_ffotd;
#include scripts\zm\zm_moon_sq;

#namespace zm_moon_sq_ctvg;

/*
	Name: init
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x850
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function init()
{
	level flag::init("w_placed");
	level flag::init("vg_placed");
	level flag::init("cvg_picked_up");
	zm_sidequests::declare_sidequest_stage("ctvg", "build", &build_init, &build_stage_logic, &build_exit_stage);
	zm_sidequests::declare_stage_asset_from_struct("ctvg", "build", "sq_cassimir_plates", &plate_thread);
	zm_sidequests::declare_sidequest_stage("ctvg", "charge", &charge_init, &charge_stage_logic, &charge_exit_stage);
}

/*
	Name: plate_thread
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x998
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function plate_thread()
{
	level waittill("stage_1");
	for(target = self.target; isdefined(target); target = self.target)
	{
		struct = struct::get(target, "targetname");
		time = struct.script_float;
		if(!isdefined(time))
		{
			time = 1;
		}
		self moveto(struct.origin, time, time / 10);
		self RotateTo(struct.angles, time, time / 10);
		self waittill("movedone");
		playsoundatposition("evt_clank", self.origin);
	}
	level notify("stage_1_done", struct.target);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: build_init
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0xAE8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 85
*/
function build_init()
{
}

/*
	Name: plates
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0xAF8
	Size: 0x480
	Parameters: 0
	Flags: None
	Line Number: 99
*/
function plates()
{
	plates = GetEntArray("sq_cassimir_plates", "targetname");
	trig = GetEnt("sq_cassimir_trigger", "targetname");
	while(1)
	{
		trig waittill("damage", amount, attacker, direction, point, dmg_type, modelName, tagName);
		if(isPlayer(attacker) && (dmg_type == "MOD_PROJECTILE" || dmg_type == "MOD_PROJECTILE_SPLASH" || dmg_type == "MOD_EXPLOSIVE" || dmg_type == "MOD_EXPLOSIVE_SPLASH" || dmg_type == "MOD_GRENADE" || dmg_type == "MOD_GRENADE_SPLASH"))
		{
			attacker thread zm_audio::create_and_play_dialog("eggs", "quest5", randomIntRange(0, 2));
			break;
		}
	}
	trig delete();
	level notify("stage_1");
	level waittill("stage_1_done");
	level.teleport_target_trigger = spawn("trigger_radius", plates[0].origin + VectorScale((0, 0, -1), 70), 0, 125, 100);
	level.black_hole_bomb_loc_check_func = &bhb_teleport_loc_check;
	level waittill("ctvg_tp_done");
	level.black_hole_bomb_loc_check_func = undefined;
	level waittill("restart_round");
	targs = struct::get_array("sq_ctvg_tp2", "targetname");
	for(i = 0; i < plates.size; i++)
	{
		plates[i] DontInterpolate();
		plates[i].origin = targs[i].origin;
		plates[i].angles = targs[i].angles;
	}
	namespace_ddd35ff::quantum_bomb_register_result("ctvg", &dud_func, 100, &ctvg_validation);
	level._ctvg_pos = targs[0].origin;
	level waittill("ctvg_validation");
	namespace_ddd35ff::quantum_bomb_deregister_result("ctvg");
	players = GetPlayers();
	players[randomIntRange(0, players.size)] thread zm_audio::create_and_play_dialog("eggs", "quest5", randomIntRange(4, 6));
	for(i = 0; i < plates.size; i++)
	{
		plates[i] ghost();
	}
	level clientfield::set("charge_vril_init", 1);
	level flag::set("c_built");
}

/*
	Name: wire_qualifier
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0xF80
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 151
*/
function wire_qualifier()
{
	if(isdefined(self._has_wire) && self._has_wire)
	{
		return 1;
	}
	return 0;
}

/*
	Name: monitor_wire_disconnect
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0xFB0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 170
*/
function monitor_wire_disconnect()
{
	level endon("w_placed");
	self waittill("disconnect");
	level notify("wire_restart");
	level thread wire();
}

/*
	Name: wire
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0xFF8
	Size: 0x328
	Parameters: 0
	Flags: None
	Line Number: 188
*/
function wire()
{
	level endon("wire_restart");
	wires = struct::get_array("sq_wire_pos", "targetname");
	wires = Array::randomize(wires);
	wire_struct = wires[0];
	wire = spawn("script_model", wire_struct.origin);
	if(isdefined(wire_struct.angles))
	{
		wire.angles = wire_struct.angles;
	}
	wire SetModel("p7_zm_moo_computer_rocket_launch_wire");
	wire thread zm_sidequests::fake_use("pickedup_wire");
	wire waittill("pickedup_wire", who);
	who thread monitor_wire_disconnect();
	who thread zm_audio::create_and_play_dialog("eggs", "quest5", 7);
	who playsound("evt_grab_wire");
	who._has_wire = 1;
	wire delete();
	who zm_sidequests::add_sidequest_icon("sq", "wire");
	level flag::wait_till("c_built");
	wire_struct = struct::get("sq_wire_final", "targetname");
	wire_struct thread zm_sidequests::fake_use("placed_wire", &wire_qualifier);
	wire_struct waittill("placed_wire", who);
	who thread zm_audio::create_and_play_dialog("eggs", "quest5", 8);
	who playsound("evt_casimir_charge");
	who playsound("evt_sq_rbs_light_on");
	who._has_wire = undefined;
	who zm_sidequests::remove_sidequest_icon("sq", "wire");
	level clientfield::set("sq_wire_init", 1);
	level flag::set("w_placed");
}

/*
	Name: dud_func
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x1328
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 231
*/
function dud_func(position)
{
}

/*
	Name: vg_qualifier
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x1340
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 245
*/
function vg_qualifier()
{
	if(!zm_moon_ffotd::function_5c35365f() && level.activePlayers.size == 1)
	{
		return 1;
	}
	num = self.characterindex;
	if(isdefined(self.zm_random_char))
	{
		num = self.zm_random_char;
	}
	return num == 2 && level._all_previous_done;
}

/*
	Name: vg
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x13C0
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 269
*/
function vg()
{
	level flag::wait_till("w_placed");
	level flag::wait_till("power_on");
	vg_struct = struct::get("sq_charge_vg_pos", "targetname");
	vg_struct thread zm_sidequests::fake_use("vg_placed", &vg_qualifier);
	vg_struct waittill("vg_placed", who);
	who thread zm_audio::create_and_play_dialog("eggs", "quest5", 9);
	level.vg_struct_sound = spawn("script_origin", vg_struct.origin);
	level.vg_struct_sound playsound("evt_vril_connect");
	level.vg_struct_sound PlayLoopSound("evt_vril_loop_lvl1", 1);
	who zm_sidequests::remove_sidequest_icon("sq", "generator");
	level clientfield::set("vril_generator", 1);
	level flag::set("vg_placed");
}

/*
	Name: build_stage_logic
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x1588
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 295
*/
function build_stage_logic()
{
	level thread plates();
	level thread wire();
	level thread vg();
	level flag::wait_till("c_built");
	level flag::wait_till("w_placed");
	level flag::wait_till("vg_placed");
	zm_sidequests::stage_completed("ctvg", "build");
}

/*
	Name: ctvg_validation
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x1660
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 316
*/
function ctvg_validation(position)
{
	if(DistanceSquared(level._ctvg_pos, position) < 16384)
	{
		level notify("ctvg_validation");
	}
	return 0;
}

/*
	Name: delete_soon
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x16B0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 335
*/
function delete_soon()
{
	wait(4.5);
	self delete();
}

/*
	Name: bhb_teleport_loc_check
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x16E0
	Size: 0x128
	Parameters: 3
	Flags: None
	Line Number: 351
*/
function bhb_teleport_loc_check(grenade, model, info)
{
	if(isdefined(level.teleport_target_trigger) && grenade istouching(level.teleport_target_trigger))
	{
		plates = GetEntArray("sq_cassimir_plates", "targetname");
		spot = spawn("script_model", plates[0].origin);
		spot SetModel("tag_origin");
		spot clientfield::set("toggle_black_hole_deployed", 1);
		spot thread delete_soon();
		level thread teleport_target(grenade, plates);
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: teleport_target
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x1810
	Size: 0x2F0
	Parameters: 2
	Flags: None
	Line Number: 377
*/
function teleport_target(grenade, models)
{
	level.teleport_target_trigger delete();
	level.teleport_target_trigger = undefined;
	wait(1);
	time = 3;
	for(i = 0; i < models.size; i++)
	{
		models[i] moveto(grenade.origin + VectorScale((0, 0, 1), 50), time, time - 0.05);
	}
	wait(time);
	teleport_targets = struct::get_array("sq_ctvg_tp", "targetname");
	for(i = 0; i < models.size; i++)
	{
		models[i] ghost();
	}
	playsoundatposition("zmb_gersh_teleporter_out", grenade.origin + VectorScale((0, 0, 1), 50));
	wait(0.5);
	for(i = 0; i < models.size; i++)
	{
		models[i] DontInterpolate();
		models[i].angles = teleport_targets[i].angles;
		models[i].origin = teleport_targets[i].origin;
		models[i] StopLoopSound(1);
	}
	wait(0.5);
	for(i = 0; i < models.size; i++)
	{
		models[i] show();
	}
	PlayFXOnTag(level._effect["black_hole_bomb_event_horizon"], models[0], "tag_origin");
	models[0] playsound("zmb_gersh_teleporter_go");
	models[0] playsound("evt_clank");
	wait(2);
	level notify("ctvg_tp_done");
}

/*
	Name: build_exit_stage
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x1B08
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 424
*/
function build_exit_stage(success)
{
}

/*
	Name: build_charge_stage
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x1B20
	Size: 0x108
	Parameters: 2
	Flags: None
	Line Number: 438
*/
function build_charge_stage(num_presses, lines)
{
	stage = spawnstruct();
	stage.num_presses = num_presses;
	stage.lines = [];
	for(i = 0; i < lines.size; i = 0)
	{
		l = spawnstruct();
		l.who = lines[i];
		l.what = lines[i + 1];
		stage.lines[stage.lines.size] = l;
	}
	return stage;
}

/*
	Name: speak_charge_lines
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x1C30
	Size: 0x2D0
	Parameters: 1
	Flags: None
	Line Number: 463
*/
function speak_charge_lines(lines)
{
	level.skit_vox_override = 1;
	for(i = 0; i < lines.size; i++)
	{
		l = lines[i];
		sound_ent = undefined;
		switch(l.who)
		{
			case "rictofen":
			{
				players = GetPlayers();
				for(j = 0; j < players.size; j++)
				{
					ent_num = players[j].characterindex;
					if(isdefined(players[j].zm_random_char))
					{
						ent_num = players[j].zm_random_char;
					}
					if(ent_num == 2)
					{
						sound_ent = players[j];
						break;
						continue;
					}
					if(!zm_moon_ffotd::function_5c35365f() && level.activePlayers.size == 1)
					{
						sound_ent = players[j];
						break;
					}
				}
				break;
			}
			case "computer":
			case "maxis":
			{
				sound_ent = level._charge_sound_ent;
				break;
			}
		}
		if(l.what == "vox_mcomp_quest_step5_15" || l.what == "vox_mcomp_quest_step5_26")
		{
			level._charge_terminal SetModel("p7_zm_moo_computer_rocket_launch_green");
		}
		else if(l.what == "vox_xcomp_quest_step5_16")
		{
			level._charge_terminal SetModel("p7_zm_moo_computer_rocket_launch_red");
		}
		thread namespace_cc012897::Send(l.what, "all");
		sound_ent thread function_1762f1c3(l.what, "line_spoken");
		sound_ent waittill("line_spoken");
	}
	level._charge_sound_ent StopLoopSound();
	level.skit_vox_override = 0;
}

/*
	Name: function_1762f1c3
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x1F08
	Size: 0x158
	Parameters: 2
	Flags: None
	Line Number: 529
*/
function function_1762f1c3(sound_to_play, notify_string)
{
	self endon("death");
	self endon("disconnect");
	if(zombie_utility::is_player_valid(self) && self zm_equipment::is_active(level.var_f486078e))
	{
		self playsoundwithnotify(sound_to_play + "_f", notify_string, "j_head");
		wait(0.1);
		for(i = 0; i < level.activePlayers.size; i++)
		{
			if(self != level.activePlayers[i] && level.activePlayers[i] zm_equipment::is_active(level.var_f486078e))
			{
				level.activePlayers[i] playsoundtoplayer(sound_to_play + "_f", level.activePlayers[i]);
			}
		}
	}
	else
	{
		self playsoundwithnotify(sound_to_play, notify_string);
		return;
	}
}

/*
	Name: charge_init
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x2068
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 562
*/
function charge_init()
{
	level._charge_stages = Array(build_charge_stage(1, Array("rictofen", "vox_plr_2_quest_step5_12")), build_charge_stage(15, Array("computer", "vox_mcomp_quest_step5_13", "rictofen", "vox_plr_2_quest_step5_14")), build_charge_stage(15, Array("computer", "vox_mcomp_quest_step5_15", "maxis", "vox_xcomp_quest_step5_16", "rictofen", "vox_plr_2_quest_step5_17")), build_charge_stage(10, Array("maxis", "vox_xcomp_quest_step5_18", "rictofen", "vox_plr_2_quest_step5_19")), build_charge_stage(15, Array("maxis", "vox_xcomp_quest_step5_20", "rictofen", "vox_plr_2_quest_step5_21", "maxis", "vox_xcomp_quest_step5_22", "rictofen", "vox_plr_2_quest_step5_23")), build_charge_stage(10, Array("maxis", "vox_xcomp_quest_step5_24", "rictofen", "vox_plr_2_quest_step5_25", "computer", "vox_mcomp_quest_step5_26")));
	sound_struct = struct::get("sq_charge_terminal", "targetname");
	level._charge_sound_ent = spawn("script_origin", sound_struct.origin);
	level._charge_terminal = GetEnt("sq_ctvg_terminal", "targetname");
	level._charge_terminal SetModel("p7_zm_moo_computer_rocket_launch_red");
}

/*
	Name: bucket_qualifier
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x22E8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 581
*/
function bucket_qualifier()
{
	if(!zm_moon_ffotd::function_5c35365f() && level.activePlayers.size == 1)
	{
		return 1;
	}
	ent_num = self.characterindex;
	if(isdefined(self.zm_random_char))
	{
		ent_num = self.zm_random_char;
	}
	if(ent_num == 2)
	{
		return 1;
	}
	return 0;
}

/*
	Name: wrong_press_qualifier
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x2368
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 609
*/
function wrong_press_qualifier()
{
	if(!zm_moon_ffotd::function_5c35365f() && level.activePlayers.size == 1)
	{
		return 0;
	}
	ent_num = self.characterindex;
	if(isdefined(self.zm_random_char))
	{
		ent_num = self.zm_random_char;
	}
	if(ent_num != 2)
	{
		return 1;
	}
	return 0;
}

/*
	Name: typing_sound_thread
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x23E8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 637
*/
function typing_sound_thread()
{
	level endon("kill_typing_thread");
	level._charge_sound_ent PlayLoopSound("evt_typing_loop");
	TYPING = 1;
	level._typing_time = GetTime();
	while(1)
	{
		if(TYPING)
		{
			if(GetTime() - level._typing_time > 250)
			{
				TYPING = 0;
				level._charge_sound_ent StopLoopSound();
			}
		}
		else if(GetTime() - level._typing_time < 100)
		{
			TYPING = 1;
			level._charge_sound_ent PlayLoopSound("evt_typing_loop");
		}
		wait(0.1);
	}
}

/*
	Name: do_bucket_fill
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x24D0
	Size: 0x1E0
	Parameters: 1
	Flags: None
	Line Number: 672
*/
function do_bucket_fill(target)
{
	presses = 0;
	players = level.activePlayers;
	RICHTOFEN = undefined;
	level thread typing_sound_thread();
	if(!zm_moon_ffotd::function_5c35365f() && level.activePlayers.size == 1)
	{
		RICHTOFEN = players[0];
	}
	else
	{
		for(i = 0; i < players.size; i++)
		{
			player = players[i];
			ent_num = player.characterindex;
			if(isdefined(player.zm_random_char))
			{
				ent_num = player.zm_random_char;
			}
			if(ent_num == 2)
			{
				RICHTOFEN = players[i];
				break;
			}
		}
	}
	while(presses < target)
	{
		level._charge_sound_ent thread zm_sidequests::fake_use("press", &bucket_qualifier);
		level._charge_sound_ent waittill("press");
		presses++;
		level._typing_time = GetTime();
		while(isdefined(RICHTOFEN) && RICHTOFEN useButtonPressed())
		{
			wait(0.05);
		}
	}
	level notify("kill_typing_thread");
}

/*
	Name: wrong_presser_thread
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x26B8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 723
*/
function wrong_presser_thread()
{
	level endon("kill_press_monitor");
	while(1)
	{
		if(isdefined(level._charge_sound_ent))
		{
			level._charge_sound_ent thread zm_sidequests::fake_use("wrong_press", &wrong_press_qualifier);
			level._charge_sound_ent waittill("wrong_press", who);
			who thread zm_audio::create_and_play_dialog("eggs", "quest5", 11);
		}
		wait(1);
	}
	return;
	ERROR: Bad function call
}

/*
	Name: wrong_collector
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x2768
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 750
*/
function wrong_collector()
{
	level endon("collected");
	while(1)
	{
		self thread zm_sidequests::fake_use("wrong_collector", &wrong_press_qualifier);
		self waittill("wrong_collector", who);
		who thread zm_audio::create_and_play_dialog("eggs", "quest5", 27);
		wait(1);
	}
}

/*
	Name: charge_stage_logic
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x27F8
	Size: 0x2B0
	Parameters: 0
	Flags: None
	Line Number: 772
*/
function charge_stage_logic()
{
	stage_index = 0;
	level thread wrong_presser_thread();
	level thread prevent_other_vox_while_here();
	while(stage_index < level._charge_stages.size)
	{
		stage = level._charge_stages[stage_index];
		do_bucket_fill(stage.num_presses);
		speak_charge_lines(stage.lines);
		stage_index++;
	}
	level clientfield::set("vril_generator", 2);
	level.vg_struct_sound playsound("evt_extra_charge");
	level.vg_struct_sound PlayLoopSound("evt_vril_loop_lvl2", 1);
	level thread start_player_vox_again();
	vg = struct::get("sq_charge_vg_pos", "targetname");
	level notify("kill_press_monitor");
	vg thread wrong_collector();
	vg thread zm_sidequests::fake_use("collect", &bucket_qualifier);
	vg waittill("collect", who);
	who thread zm_audio::create_and_play_dialog("eggs", "quest5", 27);
	who playsound("evt_vril_remove");
	level.vg_struct_sound delete();
	level.vg_struct_sound = undefined;
	level clientfield::set("vril_generator", 3);
	who zm_sidequests::add_sidequest_icon("sq", "cgenerator");
	level notify("collected");
	zm_sidequests::stage_completed("ctvg", "charge");
	return;
}

/*
	Name: charge_exit_stage
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x2AB0
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 814
*/
function charge_exit_stage(success)
{
	level._charge_sound_ent delete();
	level._charge_sound_ent = undefined;
	level flag::set("vg_charged");
	return;
	ERROR: Bad function call
}

/*
	Name: prevent_other_vox_while_here
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x2B08
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 833
*/
function prevent_other_vox_while_here()
{
	level endon("start_player_vox_again");
	while(1)
	{
		while(level.zones["bridge_zone"].is_occupied)
		{
			level.skit_vox_override = 1;
			wait(1);
		}
		level.skit_vox_override = 0;
		wait(1);
	}
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
	ERROR: Exception occured: Stack empty.
}

/*
	Name: start_player_vox_again
	Namespace: zm_moon_sq_ctvg
	Checksum: 0x424F4353
	Offset: 0x2B78
	Size: 0x24
	Parameters: 0
	Flags: None
	Line Number: 862
*/
function start_player_vox_again()
{
	level notify("start_player_vox_again");
	wait(1);
	level.skit_vox_override = 0;
}

