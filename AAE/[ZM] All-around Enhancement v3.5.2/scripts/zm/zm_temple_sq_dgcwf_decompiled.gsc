#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\zm_temple_sq;
#include scripts\zm\zm_temple_sq_brock;
#include scripts\zm\zm_temple_sq_skits;

#namespace namespace_44e3f385;

/*
	Name: init
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0x320
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 22
*/
function init()
{
	level flag::init("dgcwf_on_plate");
	level flag::init("dgcwf_sw1_pressed");
	level flag::init("dgcwf_plot_vo_done");
	level.var_a775df2e = 0;
	zm_sidequests::declare_sidequest_stage("sq", "DgCWf", &init_stage, &stage_logic, &exit_stage);
	zm_sidequests::set_stage_time_limit("sq", "DgCWf", 300);
	zm_sidequests::declare_stage_asset_from_struct("sq", "DgCWf", "sq_dgcwf_sw1", &function_3ab2e3c3, &function_375f6cbc);
	zm_sidequests::declare_stage_asset("sq", "DgCWf", "sq_dgcwf_trig", &function_9041b7f6);
	return;
}

/*
	Name: function_ee5bdd96
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0x498
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function function_ee5bdd96()
{
	self endon("death");
	var_b4264aa6 = 4;
	/#
		if(GetDvarInt("Dev Block strings are not supported") >= 2)
		{
			var_b4264aa6 = GetPlayers().size;
		}
	#/
	while(1)
	{
		if(level.var_a775df2e >= var_b4264aa6 - 1 && !level flag::get("dgcwf_on_plate"))
		{
			level flag::set("dgcwf_on_plate");
		}
		else if(level flag::get("dgcwf_on_plate") && level.var_a775df2e < var_b4264aa6 - 1)
		{
			level flag::clear("dgcwf_on_plate");
		}
		wait(0.05);
	}
}

/*
	Name: function_801d1def
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0x5B8
	Size: 0x2A0
	Parameters: 0
	Flags: None
	Line Number: 79
*/
function function_801d1def()
{
	/#
		level endon("hash_4022caee");
		if(!isdefined(level.var_19e4094c))
		{
			level.var_19e4094c = 1;
			level.var_a4c38233 = NewDebugHudElem();
			level.var_a4c38233.location = 0;
			level.var_a4c38233.alignX = "Dev Block strings are not supported";
			level.var_a4c38233.alignY = "Dev Block strings are not supported";
			level.var_a4c38233.foreground = 1;
			level.var_a4c38233.fontscale = 1.3;
			level.var_a4c38233.sort = 20;
			level.var_a4c38233.x = 10;
			level.var_a4c38233.y = 240;
			level.var_a4c38233.og_scale = 1;
			level.var_a4c38233.color = VectorScale((1, 1, 1), 255);
			level.var_a4c38233.alpha = 1;
			level.var_e4afe5fb = NewDebugHudElem();
			level.var_e4afe5fb.location = 0;
			level.var_e4afe5fb.alignX = "Dev Block strings are not supported";
			level.var_e4afe5fb.alignY = "Dev Block strings are not supported";
			level.var_e4afe5fb.foreground = 1;
			level.var_e4afe5fb.fontscale = 1.3;
			level.var_e4afe5fb.sort = 20;
			level.var_e4afe5fb.x = 0;
			level.var_e4afe5fb.y = 240;
			level.var_e4afe5fb.og_scale = 1;
			level.var_e4afe5fb.color = VectorScale((1, 1, 1), 255);
			level.var_e4afe5fb.alpha = 1;
			level.var_e4afe5fb setText("Dev Block strings are not supported");
		}
		while(1)
		{
			if(isdefined(level.var_a775df2e))
			{
				level.var_a4c38233 setValue(level.var_a775df2e);
			}
			wait(0.1);
		}
	#/
}

/*
	Name: function_64952bc
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0x860
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 133
*/
function function_64952bc(trig)
{
	trig endon("death");
	level endon("hash_4022caee");
	self waittill("spawned_player");
	self thread function_3230d5dc(trig);
}

/*
	Name: function_3230d5dc
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0x8B8
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 151
*/
function function_3230d5dc(trig)
{
	self endon("disconnect");
	trig endon("death");
	level endon("hash_4022caee");
	while(1)
	{
		while(!self istouching(trig))
		{
			wait(0.1);
		}
		if(level.var_a775df2e < 4)
		{
			level.var_a775df2e++;
		}
		trig playsound("evt_sq_dgcwf_plate_" + level.var_a775df2e);
		if(level.var_a775df2e <= 2 && !level flag::get("dgcwf_sw1_pressed"))
		{
			self thread zm_audio::create_and_play_dialog("eggs", "quest2", 0);
		}
		else
		{
			self thread zm_audio::create_and_play_dialog("eggs", "quest2", 1);
		}
		while(self istouching(trig) && self.sessionstate != "spectator")
		{
			wait(0.05);
		}
		if(level.var_a775df2e >= 0)
		{
			level.var_a775df2e--;
		}
		if(self.sessionstate == "spectator")
		{
			self thread function_64952bc(trig);
			return;
		}
		if(level.var_a775df2e < 3 && !level flag::get("dgcwf_sw1_pressed"))
		{
			self thread zm_audio::create_and_play_dialog("eggs", "quest2", 2);
		}
	}
}

/*
	Name: function_9041b7f6
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0xAC8
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 205
*/
function function_9041b7f6()
{
	self endon("death");
	self thread function_8d26168c();
	self thread function_4115af82();
	level.var_9fb9bcda = spawn("script_origin", self.origin);
	level.var_9fb9bcda PlayLoopSound("evt_sq_dgcwf_waterthrash_loop", 2);
	if(GetPlayers().size == 1)
	{
		level flag::set("dgcwf_on_plate");
		return;
	}
	/#
		level thread function_801d1def();
	#/
	self thread function_ee5bdd96();
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_3230d5dc(self);
	}
}

/*
	Name: function_4115af82
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0xC28
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 238
*/
function function_4115af82()
{
	self endon("death");
	while(1)
	{
		self waittill("trigger", who);
		if(isPlayer(who))
		{
			self StopLoopSound(1);
			level.var_9fb9bcda StopLoopSound(1);
			level.var_9fb9bcda delete();
			who thread function_5be7878a();
			return;
		}
		wait(0.05);
	}
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_375f6cbc
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0xCF0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 269
*/
function function_375f6cbc()
{
	self endon("death");
	while(1)
	{
		self waittill("trigger", who);
		who thread zm_audio::create_and_play_dialog("eggs", "quest2", 3);
		self.owner_ent.pressed = 1;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3ab2e3c3
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0xD70
	Size: 0x298
	Parameters: 0
	Flags: None
	Line Number: 292
*/
function function_3ab2e3c3()
{
	self endon("death");
	self show();
	self.on_pos = self.origin;
	self.off_pos = self.on_pos - AnglesToRight(self.angles) * 36;
	self.origin = self.off_pos;
	self.trigger TriggerEnable(0);
	self.pressed = 0;
	while(1)
	{
		if(level flag::get("dgcwf_on_plate"))
		{
			self.pressed = 0;
			self moveto(self.on_pos, 0.25);
			self playsound("evt_sq_dgcwf_lever_kachunk");
			self waittill("movedone");
			self.trigger TriggerEnable(1);
			while(level flag::get("dgcwf_on_plate"))
			{
				if(self.pressed)
				{
					self playsound("evt_sq_dgcwf_lever_success");
					self RotateRoll(75, 0.15);
					self.trigger TriggerEnable(0);
					level flag::set("dgcwf_sw1_pressed");
					return;
				}
				wait(0.05);
			}
		}
		else
		{
			self.pressed = 0;
			self.trigger TriggerEnable(0);
			self playsound("evt_sq_dgcwf_lever_dechunk");
			self moveto(self.off_pos, 0.25);
			self waittill("movedone");
			while(!level flag::get("dgcwf_on_plate"))
			{
				wait(0.05);
			}
		}
		wait(0.05);
	}
}

/*
	Name: init_stage
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0x1010
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 349
*/
function init_stage()
{
	level.var_a775df2e = 0;
	if(GetPlayers().size > 1)
	{
		level flag::clear("dgcwf_on_plate");
	}
	level flag::clear("dgcwf_sw1_pressed");
	level flag::clear("dgcwf_plot_vo_done");
	trig = GetEnt("sq_dgcwf_trig", "targetname");
	trig TriggerEnable(1);
	namespace_abd6a8a5::delete_radio();
	level thread delayed_start_skit();
}

/*
	Name: delayed_start_skit
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0x1118
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 374
*/
function delayed_start_skit()
{
	wait(0.5);
	level thread namespace_435c2400::start_skit("tt2");
	return;
	~;
}

/*
	Name: stage_logic
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0x1150
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 392
*/
function stage_logic()
{
	level endon("hash_4022caee");
	level flag::wait_till("dgcwf_on_plate");
	level flag::wait_till("dgcwf_sw1_pressed");
	level notify("suspend_timer");
	level notify("raise_crystal_1");
	level notify("raise_crystal_2", 1);
	level thread slightly_delayed_player_response();
	level waittill("hash_3ee76d25");
	level flag::wait_till("dgcwf_plot_vo_done");
	wait(5);
	level thread zm_sidequests::stage_completed("sq", "DgCWf");
}

/*
	Name: slightly_delayed_player_response
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0x1238
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 417
*/
function slightly_delayed_player_response()
{
	wait(2.5);
	players = GetPlayers();
	players[randomIntRange(0, players.size)] thread zm_audio::create_and_play_dialog("eggs", "quest2", 4);
}

/*
	Name: function_8d26168c
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0x12B8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 434
*/
function function_8d26168c()
{
	level endon("hash_4022caee");
	level flag::wait_till("dgcwf_on_plate");
	level flag::wait_till("dgcwf_sw1_pressed");
	playsoundatposition("evt_sq_dgcwf_gears", self.origin);
}

/*
	Name: exit_stage
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0x1330
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 452
*/
function exit_stage(success)
{
	if(isdefined(level.var_19e4094c))
	{
		level.var_19e4094c = undefined;
		level.var_a4c38233 destroy();
		level.var_a4c38233 = undefined;
		level.var_e4afe5fb destroy();
		level.var_e4afe5fb = undefined;
	}
	trig = GetEnt("sq_dgcwf_trig", "targetname");
	trig TriggerEnable(0);
	if(success)
	{
		namespace_abd6a8a5::create_radio(3);
	}
	else
	{
		namespace_abd6a8a5::create_radio(2, &namespace_abd6a8a5::radio2_override);
		level thread namespace_435c2400::fail_skit();
	}
	level.skit_vox_override = 0;
	if(isdefined(level.var_dac46a9f))
	{
		level.var_dac46a9f delete();
		level.var_dac46a9f = undefined;
	}
}

/*
	Name: function_5be7878a
	Namespace: namespace_44e3f385
	Checksum: 0x424F4353
	Offset: 0x1480
	Size: 0x33E
	Parameters: 0
	Flags: None
	Line Number: 491
*/
function function_5be7878a()
{
	level endon("hash_4022caee");
	struct = struct::get("sq_location_dgcwf", "targetname");
	if(!isdefined(struct))
	{
		return;
	}
	level.var_dac46a9f = spawn("script_origin", struct.origin);
	if(isdefined(self))
	{
		level.skit_vox_override = 1;
		snd = "vox_egg_story_2_0" + namespace_1e4bbaa5::function_26186755(self.characterindex);
		var_53a95046 = soundgetplaybacktime(snd);
		thread namespace_cc012897::Send(snd, "all", var_53a95046);
		self playsoundwithnotify(snd, "vox_egg_sounddone");
		self waittill("vox_egg_sounddone");
		level.skit_vox_override = 0;
	}
	var_53a95046 = soundgetplaybacktime("vox_egg_story_2_1");
	thread namespace_cc012897::Send("vox_egg_story_2_1", "all", var_53a95046);
	level.var_dac46a9f playsoundwithnotify("vox_egg_story_2_1", "sounddone");
	level.var_dac46a9f waittill("sounddone");
	if(isdefined(self))
	{
		level.skit_vox_override = 1;
		snd = "vox_egg_story_2_2" + namespace_1e4bbaa5::function_26186755(self.characterindex);
		var_53a95046 = soundgetplaybacktime(snd);
		thread namespace_cc012897::Send(snd, "all", var_53a95046);
		self playsoundwithnotify(snd, "vox_egg_sounddone");
		self waittill("vox_egg_sounddone");
		level.skit_vox_override = 0;
	}
	level flag::wait_till("dgcwf_sw1_pressed");
	var_53a95046 = soundgetplaybacktime("vox_egg_story_2_3");
	thread namespace_cc012897::Send("vox_egg_story_2_3", "all", var_53a95046);
	level.var_dac46a9f playsoundwithnotify("vox_egg_story_2_3", "sounddone");
	level.var_dac46a9f waittill("sounddone");
	level flag::set("dgcwf_plot_vo_done");
	level.var_dac46a9f delete();
	level.var_dac46a9f = undefined;
}

