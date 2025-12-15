#include scripts\codescripts\struct;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\zm_temple_sq;
#include scripts\zm\zm_temple_sq_brock;
#include scripts\zm\zm_temple_sq_skits;

#namespace namespace_a28ea140;

/*
	Name: init
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0x430
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 23
*/
function init()
{
	flag::init("sq_ptt_dial_dialed");
	flag::init("sq_ptt_level_pulled");
	flag::init("ptt_plot_vo_done");
	zm_sidequests::declare_sidequest_stage("sq", "PtT", &init_stage, &stage_logic, &exit_stage);
	zm_sidequests::set_stage_time_limit("sq", "PtT", 300);
	zm_sidequests::declare_stage_asset_from_struct("sq", "PtT", "sq_ptt_trig", &gas_volume, &function_74e74bde);
}

/*
	Name: debug_jet
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0x548
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 43
*/
function debug_jet()
{
	/#
		self endon("death");
		struct = struct::get(self.target, "Dev Block strings are not supported");
		dir = AnglesToForward(struct.angles);
		while(!(isdefined(level.disable_print3d_ent) && level.disable_print3d_ent))
		{
			scale = 0.1;
			offset = (0, 0, 0);
			for(i = 0; i < 5; i++)
			{
				print3d(struct.origin + offset, "Dev Block strings are not supported", self.jet_color, 1, scale, 10);
				scale = scale * 1.7;
				offset = offset + dir * 6;
			}
			wait(1);
		}
	#/
}

/*
	Name: ignite_jet
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0x690
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 74
*/
function ignite_jet()
{
	level endon("end_game");
	self playsound("evt_sq_ptt_gas_ignite");
	str_exploder = "fxexp_" + self.script_int + 10;
	exploder::exploder(str_exploder);
	level waittill("sq_PtT_over");
	exploder::stop_exploder(str_exploder);
}

/*
	Name: gas_volume
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0x720
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function gas_volume()
{
	self endon("death");
	self.jet_color = VectorScale((0, 1, 0), 255);
	level flag::wait_till("sq_ptt_dial_dialed");
	exploder::exploder("fxexp_" + self.script_int);
	while(1)
	{
		level waittill("napalm_death", volume);
		if(volume == self.script_int)
		{
			self.trigger notify("lit");
			level notify("lit");
			self thread ignite_jet();
			self thread play_line_on_nearby_player();
			level._ptt_num_lit++;
			return;
		}
	}
}

/*
	Name: play_line_on_nearby_player
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0x820
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 125
*/
function play_line_on_nearby_player()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(DistanceSquared(self.origin, players[i].origin) <= 62500)
		{
			players[i] thread zm_audio::create_and_play_dialog("eggs", "quest4", randomIntRange(2, 5));
			return;
		}
	}
}

/*
	Name: function_d9c0ed6
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0x8F0
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 148
*/
function function_d9c0ed6()
{
	self endon("death");
	self TriggerIgnoreTeam();
	while(1)
	{
		while(level.var_4e4c9791.size == 0)
		{
			/#
				if(GetDvarInt("Dev Block strings are not supported") == 2)
				{
					wait(self.owner_ent.script_int - 99 * 2);
					self notify("hash_c1510355");
				}
			#/
			wait(1);
		}
		while(level.var_4e4c9791.size > 0)
		{
			foreach(zombie in level.var_4e4c9791)
			{
				if(zombie istouching(self))
				{
					self notify("hash_c1510355");
				}
			}
			util::wait_network_frame();
		}
	}
	return;
	self.owner_ent.var_0 = undefined;
}

/*
	Name: function_74e74bde
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0xA58
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 191
*/
function function_74e74bde()
{
	self endon("death");
	self endon("lit");
	level flag::wait_till("sq_ptt_dial_dialed");
	self thread player_line_thread();
	self thread function_d9c0ed6();
	if(1)
	{
		self waittill("hash_c1510355");
		level notify("napalm_death", self.owner_ent.script_int);
		return;
	}
}

/*
	Name: player_line_thread
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0xAF8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 216
*/
function player_line_thread()
{
	self endon("death");
	self endon("lit");
	while(1)
	{
		self waittill("trigger", who);
		if(isPlayer(who))
		{
			who thread zm_audio::create_and_play_dialog("eggs", "quest4", randomIntRange(0, 2));
			return;
		}
	}
}

/*
	Name: init_stage
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0xBA0
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 241
*/
function init_stage()
{
	level notify("ptt_start");
	level flag::clear("sq_ptt_dial_dialed");
	dial = GetEnt("sq_ptt_dial", "targetname");
	dial thread ptt_dial();
	jets = GetEntArray("sq_ptt_trig", "targetname");
	level._ptt_jets = jets.size;
	level._ptt_num_lit = 0;
	namespace_abd6a8a5::delete_radio();
	if(level flag::get("radio_4_played"))
	{
		level thread delayed_start_skit("tt4a");
	}
	else
	{
		level thread delayed_start_skit("tt4b");
	}
	level thread play_choking_loop();
}

/*
	Name: play_choking_loop
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0xCE8
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 272
*/
function play_choking_loop()
{
	level endon("sq_PtT_over");
	struct = struct::get("sq_location_ptt", "targetname");
	if(!isdefined(struct))
	{
		return;
	}
	level._ptt_sound_choking_ent = spawn("script_origin", struct.origin);
	level._ptt_sound_choking_ent PlayLoopSound("evt_sq_ptt_choking_loop", 2);
	level flag::wait_till("sq_ptt_dial_dialed");
	level._ptt_sound_choking_ent StopLoopSound(1);
	wait(1);
	level._ptt_sound_choking_ent delete();
	level._ptt_sound_choking_ent = undefined;
}

/*
	Name: delayed_start_skit
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0xDF8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 299
*/
function delayed_start_skit(skit)
{
	level thread namespace_435c2400::start_skit(skit);
}

/*
	Name: ptt_lever
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0xE28
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 314
*/
function ptt_lever()
{
	level endon("sq_PtT_over");
	level flag::clear("sq_ptt_level_pulled");
	if(!isdefined(self.original_angles))
	{
		self.original_angles = self.angles;
	}
	self.angles = self.original_angles;
	while(level._ptt_num_lit < level._ptt_jets)
	{
		level waittill("lit");
		self playsound("evt_sq_ptt_lever_ratchet");
		self RotateRoll(-25, 0.25);
		self waittill("rotatedone");
	}
	use_trigger = spawn("trigger_radius_use", self.origin, 0, 32, 72);
	use_trigger TriggerIgnoreTeam();
	use_trigger setcursorhint("HINT_NOICON");
	use_trigger waittill("trigger");
	use_trigger delete();
	self playsound("evt_sq_ptt_lever_pull");
	self RotateRoll(100, 0.25);
	self waittill("rotatedone");
	level flag::set("sq_ptt_level_pulled");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: ptt_story_vox
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0xFF0
	Size: 0x4F0
	Parameters: 1
	Flags: None
	Line Number: 353
*/
function ptt_story_vox(player)
{
	level endon("sq_PtT_over");
	struct = struct::get("sq_location_ptt", "targetname");
	if(!isdefined(struct))
	{
		return;
	}
	level._ptt_sound_ent = spawn("script_origin", struct.origin);
	level._ptt_sound_ent_trash = spawn("script_origin", struct.origin);
	var_53a95046 = soundgetplaybacktime("vox_egg_story_3_0");
	thread namespace_cc012897::Send("vox_egg_story_3_0", "all", var_53a95046);
	level._ptt_sound_ent playsoundwithnotify("vox_egg_story_3_0", "sounddone");
	level._ptt_sound_ent waittill("sounddone");
	level._ptt_sound_ent_trash playsound("evt_sq_ptt_trash_start");
	level._ptt_sound_ent_trash PlayLoopSound("evt_sq_ptt_trash_loop");
	var_53a95046 = soundgetplaybacktime("vox_egg_story_3_1");
	thread namespace_cc012897::Send("vox_egg_story_3_1", "all", var_53a95046);
	level._ptt_sound_ent playsoundwithnotify("vox_egg_story_3_1", "sounddone");
	level._ptt_sound_ent waittill("sounddone");
	var_53a95046 = soundgetplaybacktime("vox_egg_story_3_2");
	thread namespace_cc012897::Send("vox_egg_story_3_2", "all", var_53a95046);
	level._ptt_sound_ent playsoundwithnotify("vox_egg_story_3_2", "sounddone");
	level._ptt_sound_ent waittill("sounddone");
	if(isdefined(player))
	{
		level.skit_vox_override = 1;
		snd = "vox_egg_story_3_3" + namespace_1e4bbaa5::function_26186755(player.characterindex);
		var_53a95046 = soundgetplaybacktime(snd);
		thread namespace_cc012897::Send(snd, "all", var_53a95046);
		player playsoundwithnotify(snd, "vox_egg_sounddone");
		player waittill("vox_egg_sounddone");
		level.skit_vox_override = 0;
	}
	level thread ptt_story_reminder_vox(45);
	level flag::wait_till("sq_ptt_level_pulled");
	level._ptt_sound_ent_trash StopLoopSound(2);
	level._ptt_sound_ent_trash playsound("evt_sq_ptt_trash_end");
	var_53a95046 = soundgetplaybacktime("vox_egg_story_3_8");
	thread namespace_cc012897::Send("vox_egg_story_3_8", "all", var_53a95046);
	level._ptt_sound_ent playsoundwithnotify("vox_egg_story_3_8", "sounddone");
	level._ptt_sound_ent waittill("sounddone");
	var_53a95046 = soundgetplaybacktime("vox_egg_story_3_9");
	thread namespace_cc012897::Send("vox_egg_story_3_9", "all", var_53a95046);
	level._ptt_sound_ent playsoundwithnotify("vox_egg_story_3_9", "sounddone");
	level._ptt_sound_ent waittill("sounddone");
	level flag::set("ptt_plot_vo_done");
	level._ptt_sound_ent_trash delete();
	level._ptt_sound_ent_trash = undefined;
	level._ptt_sound_ent delete();
	level._ptt_sound_ent = undefined;
}

/*
	Name: ptt_story_reminder_vox
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0x14E8
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 416
*/
function ptt_story_reminder_vox(waittime)
{
	level endon("sq_PtT_over");
	wait(waittime);
	for(count = 4; !level flag::get("sq_ptt_level_pulled") && count <= 7; count++)
	{
		var_53a95046 = soundgetplaybacktime("vox_egg_story_3_" + count);
		thread namespace_cc012897::Send("vox_egg_story_3_" + count, "all", var_53a95046);
		level._ptt_sound_ent playsoundwithnotify("vox_egg_story_3_" + count, "sounddone");
		level._ptt_sound_ent waittill("sounddone");
		wait(waittime);
	}
}

/*
	Name: stage_logic
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0x15F8
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 440
*/
function stage_logic()
{
	level flag::wait_till("sq_ptt_dial_dialed");
	while(level._ptt_num_lit < level._ptt_jets)
	{
		wait(0.1);
	}
	level flag::wait_till("sq_ptt_level_pulled");
	level notify("suspend_timer");
	wait(5);
	level notify("raise_crystal_1");
	level notify("raise_crystal_2");
	level notify("raise_crystal_3");
	level notify("raise_crystal_4", 1);
	level waittill("raised_crystal_4");
	level flag::wait_till("ptt_plot_vo_done");
	wait(5);
	zm_sidequests::stage_completed("sq", "PtT");
	return;
}

/*
	Name: remove_exploders
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0x1708
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 471
*/
function remove_exploders()
{
	exploder::stop_exploder("fxexp_100");
	exploder::stop_exploder("fxexp_101");
	exploder::stop_exploder("fxexp_102");
	exploder::stop_exploder("fxexp_103");
	util::wait_network_frame();
	exploder::stop_exploder("fxexp_110");
	exploder::stop_exploder("fxexp_111");
	exploder::stop_exploder("fxexp_112");
	exploder::stop_exploder("fxexp_113");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: exit_stage
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0x17E8
	Size: 0x210
	Parameters: 1
	Flags: None
	Line Number: 496
*/
function exit_stage(success)
{
	level flag::clear("sq_ptt_dial_dialed");
	level flag::clear("ptt_plot_vo_done");
	dial = GetEnt("sq_ptt_dial", "targetname");
	dial thread dud_dial_handler();
	ents = GetAIArray();
	for(i = 0; i < ents.size; i++)
	{
		if(isdefined(ents[i].explosive_volume))
		{
			ents[i].explosive_volume = 0;
		}
	}
	level thread remove_exploders();
	if(success)
	{
		namespace_abd6a8a5::create_radio(5);
	}
	else
	{
		namespace_abd6a8a5::create_radio(4, &namespace_abd6a8a5::radio4_override);
		level thread namespace_435c2400::fail_skit();
	}
	level.skit_vox_override = 0;
	if(isdefined(level._ptt_sound_ent))
	{
		level._ptt_sound_ent delete();
		level._ptt_sound_ent = undefined;
	}
	if(isdefined(level._ptt_sound_ent_trash))
	{
		level._ptt_sound_ent_trash delete();
		level._ptt_sound_ent_trash = undefined;
	}
	if(isdefined(level._ptt_sound_choking_ent))
	{
		level._ptt_sound_choking_ent delete();
		level._ptt_sound_choking_ent = undefined;
		return;
	}
}

/*
	Name: dial_trigger
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0x1A00
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 549
*/
function dial_trigger()
{
	level endon("ptt_start");
	level endon("sq_PtT_over");
	while(1)
	{
		self waittill("trigger", who);
		self.owner_ent notify("triggered", who);
	}
}

/*
	Name: ptt_dial
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0x1A60
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 570
*/
function ptt_dial()
{
	level endon("sq_PtT_over");
	num_turned = 0;
	who = undefined;
	self.trigger TriggerIgnoreTeam();
	self.trigger thread dial_trigger();
	while(num_turned < 4)
	{
		self waittill("triggered", who);
		self playsound("evt_sq_ptt_valve");
		self RotateRoll(90, 0.25);
		self waittill("rotatedone");
		num_turned++;
	}
	level thread ptt_story_vox(who);
	self playsound("evt_sq_ptt_gas_release");
	lever = GetEnt("sq_ptt_lever", "targetname");
	lever thread ptt_lever();
	level flag::set("sq_ptt_dial_dialed");
	return;
}

/*
	Name: dud_dial_handler
	Namespace: namespace_a28ea140
	Checksum: 0x424F4353
	Offset: 0x1BD8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 603
*/
function dud_dial_handler()
{
	level endon("ptt_start");
	self.trigger TriggerIgnoreTeam();
	self.trigger thread dial_trigger();
	while(1)
	{
		self waittill("triggered");
		self playsound("evt_sq_ptt_valve");
		self RotateRoll(90, 0.25);
	}
}

