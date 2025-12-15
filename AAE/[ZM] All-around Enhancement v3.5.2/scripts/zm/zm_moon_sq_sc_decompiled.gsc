#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\sound_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_powerup_weapon_minigun;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zm_moon_amb;
#include scripts\zm\zm_moon_ffotd;
#include scripts\zm\zm_moon_sq;

#namespace zm_moon_sq_sc;

/*
	Name: init
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0x508
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function init()
{
	level._active_tanks = [];
	level flag::init("sam_switch_thrown");
	zm_sidequests::declare_sidequest_stage("sq", "sc", &init_stage, &stage_logic, &exit_stage);
	zm_sidequests::declare_stage_asset("sq", "sc", "sq_knife_switch", &sq_sc_switch);
}

/*
	Name: init_2
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0x5C8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function init_2()
{
	level flag::init("cvg_placed");
	zm_sidequests::declare_sidequest_stage("sq", "sc2", &init_stage_2, &stage_logic_2, &exit_stage_2);
	return;
	ERROR: Bad function call
}

/*
	Name: init_stage_2
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0x648
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 68
*/
function init_stage_2()
{
	level thread place_cvg();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: stage_logic_2
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0x670
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 85
*/
function stage_logic_2()
{
	level flag::wait_till("second_tanks_drained");
	level flag::wait_till("soul_swap_done");
	wait(1);
	zm_sidequests::stage_completed("sq", "sc2");
	return;
	~;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: exit_stage_2
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0x6E8
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 106
*/
function exit_stage_2(success)
{
	return;
	++;
}

/*
	Name: init_stage
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0x700
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 122
*/
function init_stage()
{
}

/*
	Name: wall_move
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0x710
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 136
*/
function wall_move()
{
	level clientfield::set("sam_end_rumble", 1);
	scene::Play("p7_fxanim_zmhd_moon_pyramid_bundle");
	level clientfield::set("sam_init", 1);
	wait(0.1);
	level notify("walls_down");
	level clientfield::set("sam_end_rumble", 0);
}

/*
	Name: stage_logic
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0x7B0
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 156
*/
function stage_logic()
{
	level flag::wait_till("first_tanks_drained");
	level thread wall_move();
	level thread zm_audio::sndmusicsystem_playstate("samantha_reveal");
	level thread sam_reveal_richtofen_vox();
	level waittill("walls_down");
	wait(1);
	players = GetPlayers();
	Array::thread_all(players, &room_sweeper);
	zm_sidequests::stage_completed("sq", "sc");
	return;
}

/*
	Name: sam_reveal_richtofen_vox
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0x8A8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 180
*/
function sam_reveal_richtofen_vox()
{
	wait(8);
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		index = zm_utility::get_player_index(players[i]);
		if(index == 3)
		{
			players[i] thread zm_audio::create_and_play_dialog("eggs", "quest4", 3);
		}
	}
}

/*
	Name: room_sweeper
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0x968
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 204
*/
function room_sweeper()
{
	while(!zombie_utility::is_player_valid(self) || (self useButtonPressed() && self zm_utility::in_revive_trigger()))
	{
		wait(1);
	}
	level thread zm_powerup_weapon_minigun::minigun_weapon_powerup(self, 90);
	level thread dempsey_gersh_vox();
	level notify("moon_sidequest_reveal_achieved");
}

/*
	Name: dempsey_gersh_vox
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0xA10
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function dempsey_gersh_vox()
{
	wait(5);
	player = zm_moon_sq::get_specific_player(0);
	if(isdefined(player))
	{
		player playsound("vox_plr_0_stupid_gersh");
		var_53a95046 = soundgetplaybacktime("vox_plr_0_stupid_gersh");
		thread namespace_cc012897::Send("vox_plr_0_stupid_gersh", "all", var_53a95046);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: exit_stage
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0xAB0
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 249
*/
function exit_stage(success)
{
}

/*
	Name: sq_sc_switch
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0xAC8
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 263
*/
function sq_sc_switch()
{
	level flag::wait_till("first_tanks_charged");
	var_bf58ee19 = GetEnt("use_tank_switch", "targetname");
	var_bf58ee19 waittill("trigger");
	self playsound("zmb_switch_flip_no2d");
	self scene::Play("p7_fxanim_zmhd_power_switch_bundle", self);
	playFX(level._effect["switch_sparks"], struct::get("sq_knife_switch_fx", "targetname").origin);
	wait(1);
	level flag::set("sam_switch_thrown");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: do_soul_swap
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0xBD8
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 287
*/
function do_soul_swap(who)
{
	zm_moon_amb::player_4_override();
	level.zmb_laugh_alias = "zmb_laugh_rich";
	if(isdefined(who))
	{
		who clientfield::set_to_player("soul_swap", 1);
		who zm_moon_sq::give_perk_reward();
	}
	wait(2);
	if(isdefined(who))
	{
		who clientfield::set_to_player("soul_swap", 0);
	}
	level notify("moon_sidequest_swap_achieved");
}

/*
	Name: place_qualifier
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0xC90
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 314
*/
function place_qualifier()
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
	Name: richtofen_sam_vo
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0xD10
	Size: 0x270
	Parameters: 0
	Flags: None
	Line Number: 342
*/
function richtofen_sam_vo()
{
	level endon("ss_done");
	level.skit_vox_override = 1;
	players = GetPlayers();
	RICHTOFEN = undefined;
	for(i = 0; i < players.size; i++)
	{
		ent_num = players[i].characterindex;
		if(isdefined(players[i].zm_random_char))
		{
			ent_num = players[i].zm_random_char;
		}
		if(ent_num == 2)
		{
			RICHTOFEN = players[i];
			break;
		}
	}
	if(!isdefined(RICHTOFEN))
	{
		return;
	}
	RICHTOFEN playsoundwithnotify("vox_plr_2_quest_step6_7", "line_spoken");
	var_53a95046 = soundgetplaybacktime("vox_plr_2_quest_step6_7");
	thread namespace_cc012897::Send("vox_plr_2_quest_step6_7", "all", var_53a95046);
	RICHTOFEN waittill("line_spoken");
	targ = struct::get("sq_sam", "targetname");
	targ = struct::get(targ.target, "targetname");
	sound::play_in_space("vox_plr_4_quest_step6_10", targ.origin);
	if(isdefined(RICHTOFEN))
	{
		RICHTOFEN playsoundwithnotify("vox_plr_2_quest_step6_8", "line_spoken");
		var_53a95046 = soundgetplaybacktime("vox_plr_2_quest_step6_8");
		thread namespace_cc012897::Send("vox_plr_2_quest_step6_8", "all", var_53a95046);
		RICHTOFEN waittill("line_spoken");
	}
	level.skit_vox_override = 0;
}

/*
	Name: place_cvg
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0xF88
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 392
*/
function place_cvg()
{
	level flag::wait_till("second_tanks_charged");
	level thread richtofen_sam_vo();
	s = struct::get("sq_vg_final", "targetname");
	s thread zm_sidequests::fake_use("placed_cvg", &place_qualifier);
	s waittill("placed_cvg", who);
	level flag::set("cvg_placed");
	level clientfield::set("vril_generator", 4);
	who zm_sidequests::remove_sidequest_icon("sq", "cgenerator");
	level flag::wait_till("second_tanks_drained");
	level notify("ss_done");
	level thread do_soul_swap(who);
	level flag::set("soul_swap_done");
	level thread play_sam_then_response_line();
	level.skit_vox_override = 0;
}

/*
	Name: play_sam_then_response_line
	Namespace: zm_moon_sq_sc
	Checksum: 0x424F4353
	Offset: 0x1130
	Size: 0x224
	Parameters: 0
	Flags: None
	Line Number: 420
*/
function play_sam_then_response_line()
{
	wait(1);
	SAM = undefined;
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
			SAM = players[i];
			break;
		}
	}
	if(!isdefined(SAM))
	{
		return;
	}
	SAM playsoundwithnotify("vox_plr_4_quest_step6_12", "linedone");
	var_53a95046 = soundgetplaybacktime("vox_plr_4_quest_step6_12");
	thread namespace_cc012897::Send("vox_plr_4_quest_step6_12", "all", var_53a95046);
	SAM waittill("linedone");
	players = GetPlayers();
	player = [];
	for(i = 0; i < players.size; i++)
	{
		if(players[i] != SAM)
		{
			player[player.size] = players[i];
		}
	}
	if(player.size <= 0)
	{
		return;
	}
	player[randomIntRange(0, player.size)] thread zm_audio::create_and_play_dialog("eggs", "quest6", 13);
}

