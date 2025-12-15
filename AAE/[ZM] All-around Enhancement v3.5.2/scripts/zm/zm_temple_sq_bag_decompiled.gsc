#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\zm_temple_sq;
#include scripts\zm\zm_temple_sq_brock;
#include scripts\zm\zm_temple_sq_skits;

#namespace namespace_6d88ee3a;

/*
	Name: init
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x428
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 25
*/
function init()
{
	level flag::init("given_dynamite");
	level flag::init("dynamite_chat");
	zm_sidequests::declare_sidequest_stage("sq", "BaG", &init_stage, &stage_logic, &exit_stage);
	zm_sidequests::set_stage_time_limit("sq", "BaG", 300);
}

/*
	Name: function_38592a25
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x4F0
	Size: 0x878
	Parameters: 0
	Flags: None
	Line Number: 43
*/
function function_38592a25()
{
	/#
		if(isdefined(level.var_c16cbca))
		{
			return;
		}
		if(!isdefined(level.var_c16cbca))
		{
			level.var_c16cbca = 1;
			level.var_d05fb424 = NewDebugHudElem();
			level.var_d05fb424.location = 0;
			level.var_d05fb424.alignX = "Dev Block strings are not supported";
			level.var_d05fb424.alignY = "Dev Block strings are not supported";
			level.var_d05fb424.foreground = 1;
			level.var_d05fb424.fontscale = 1.3;
			level.var_d05fb424.sort = 20;
			level.var_d05fb424.x = 10;
			level.var_d05fb424.y = 240;
			level.var_d05fb424.og_scale = 1;
			level.var_d05fb424.color = VectorScale((1, 1, 1), 255);
			level.var_d05fb424.alpha = 1;
			level.var_5b0b9093 = NewDebugHudElem();
			level.var_5b0b9093.location = 0;
			level.var_5b0b9093.alignX = "Dev Block strings are not supported";
			level.var_5b0b9093.alignY = "Dev Block strings are not supported";
			level.var_5b0b9093.foreground = 1;
			level.var_5b0b9093.fontscale = 1.3;
			level.var_5b0b9093.sort = 20;
			level.var_5b0b9093.x = 0;
			level.var_5b0b9093.y = 240;
			level.var_5b0b9093.og_scale = 1;
			level.var_5b0b9093.color = VectorScale((1, 1, 1), 255);
			level.var_5b0b9093.alpha = 1;
			level.var_5b0b9093 setText("Dev Block strings are not supported");
			level.var_a2fc2b82 = NewDebugHudElem();
			level.var_a2fc2b82.location = 0;
			level.var_a2fc2b82.alignX = "Dev Block strings are not supported";
			level.var_a2fc2b82.alignY = "Dev Block strings are not supported";
			level.var_a2fc2b82.foreground = 1;
			level.var_a2fc2b82.fontscale = 1.3;
			level.var_a2fc2b82.sort = 20;
			level.var_a2fc2b82.x = 10;
			level.var_a2fc2b82.y = 270;
			level.var_a2fc2b82.og_scale = 1;
			level.var_a2fc2b82.color = VectorScale((1, 1, 1), 255);
			level.var_a2fc2b82.alpha = 1;
			level.var_22924059 = NewDebugHudElem();
			level.var_22924059.location = 0;
			level.var_22924059.alignX = "Dev Block strings are not supported";
			level.var_22924059.alignY = "Dev Block strings are not supported";
			level.var_22924059.foreground = 1;
			level.var_22924059.fontscale = 1.3;
			level.var_22924059.sort = 20;
			level.var_22924059.x = 0;
			level.var_22924059.y = 270;
			level.var_22924059.og_scale = 1;
			level.var_22924059.color = VectorScale((1, 1, 1), 255);
			level.var_22924059.alpha = 1;
			level.var_22924059 setText("Dev Block strings are not supported");
			level.var_13adef5a = NewDebugHudElem();
			level.var_13adef5a.location = 0;
			level.var_13adef5a.alignX = "Dev Block strings are not supported";
			level.var_13adef5a.alignY = "Dev Block strings are not supported";
			level.var_13adef5a.foreground = 1;
			level.var_13adef5a.fontscale = 1.3;
			level.var_13adef5a.sort = 20;
			level.var_13adef5a.x = 10;
			level.var_13adef5a.y = 300;
			level.var_13adef5a.og_scale = 1;
			level.var_13adef5a.color = VectorScale((1, 1, 1), 255);
			level.var_13adef5a.alpha = 1;
			level.var_edaac3a1 = NewDebugHudElem();
			level.var_edaac3a1.location = 0;
			level.var_edaac3a1.alignX = "Dev Block strings are not supported";
			level.var_edaac3a1.alignY = "Dev Block strings are not supported";
			level.var_edaac3a1.foreground = 1;
			level.var_edaac3a1.fontscale = 1.3;
			level.var_edaac3a1.sort = 20;
			level.var_edaac3a1.x = 0;
			level.var_edaac3a1.y = 300;
			level.var_edaac3a1.og_scale = 1;
			level.var_edaac3a1.color = VectorScale((1, 1, 1), 255);
			level.var_edaac3a1.alpha = 1;
			level.var_edaac3a1 setText("Dev Block strings are not supported");
		}
		gongs = GetEntArray("Dev Block strings are not supported", "Dev Block strings are not supported");
		while(1)
		{
			if(isdefined(level._num_gongs))
			{
				level.var_d05fb424 setValue(level._num_gongs);
			}
			else
			{
				level.var_e38ebc06 setValue("Dev Block strings are not supported");
			}
			var_63989b10 = "Dev Block strings are not supported";
			for(i = 0; i < gongs.size; i++)
			{
				if(isdefined(gongs[i].ringing) && gongs[i].ringing)
				{
					var_63989b10 = var_63989b10 + "Dev Block strings are not supported";
					continue;
				}
				var_63989b10 = var_63989b10 + "Dev Block strings are not supported";
			}
			level.var_a2fc2b82 setText(var_63989b10);
			if(level flag::get("Dev Block strings are not supported"))
			{
				level.var_edaac3a1 setText("Dev Block strings are not supported");
			}
			else
			{
				level.var_edaac3a1 setText("Dev Block strings are not supported");
			}
			wait(0.05);
		}
	#/
}

/*
	Name: init_stage
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0xD70
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 174
*/
function init_stage()
{
	namespace_abd6a8a5::delete_radio();
	level notify("hash_c43e46b4");
	/#
		if(GetPlayers().size == 1 || GetDvarInt("Dev Block strings are not supported") == 2)
		{
			GetPlayers()[0] GiveWeapon(level.var_953f69a0);
			level notify("raise_crystal_1");
			level notify("raise_crystal_2");
			level notify("raise_crystal_3");
			level notify("raise_crystal_4");
			level notify("raise_crystal_5");
			level notify("raise_crystal_6");
		}
	#/
	level flag::clear("given_dynamite");
	level flag::clear("dynamite_chat");
	gongs = GetEntArray("sq_gong", "targetname");
	Array::thread_all(gongs, &gong_handler);
	level thread function_5b66185a();
	namespace_1e4bbaa5::reset_dynamite();
	level thread delayed_start_skit();
	return;
	waittillframeend;
}

/*
	Name: delayed_start_skit
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0xF28
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 211
*/
function delayed_start_skit()
{
	wait(0.5);
	level thread namespace_435c2400::start_skit("tt8");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_43060cc
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0xF60
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 229
*/
function function_43060cc()
{
	/#
		self endon("caught");
		while(!(isdefined(level.disable_print3d_ent) && level.disable_print3d_ent))
		{
			print3d(self.origin, "Dev Block strings are not supported", VectorScale((0, 1, 0), 255), 2);
			wait(0.1);
		}
	#/
}

/*
	Name: fire_in_the_hole
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0xFD0
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 251
*/
function fire_in_the_hole()
{
	self endon("caught");
	self.dropped = 1;
	self Unlink();
	dest = struct::get(self.target, "targetname");
	level.var_6dc7946f = spawn("trigger_radius", self.origin, 0, 24, 10);
	level.var_6dc7946f EnableLinkTo();
	level.var_6dc7946f LinkTo(self);
	level.var_6dc7946f.owner_ent = self;
	level.var_6dc7946f thread function_a87aa210();
	/#
		self thread function_43060cc();
	#/
	self notsolid();
	self moveto(dest.origin, 1.4, 0.2, 0);
	self waittill("movedone");
	players = GetPlayers();
	players[randomIntRange(0, players.size)] thread zm_audio::create_and_play_dialog("eggs", "quest8", 5);
	playsoundatposition("evt_sq_bag_dynamite_explosion", dest.origin);
	level.var_6dc7946f notify("boom");
	level.var_6dc7946f delete();
	level.var_6dc7946f = undefined;
	zm_sidequests::stage_failed("sq", "BaG");
	return;
	ERROR: Bad function call
}

/*
	Name: function_a87aa210
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x1228
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 289
*/
function function_a87aa210()
{
	self endon("boom");
	self endon("death");
	while(1)
	{
		self waittill("trigger", who);
		if(isdefined(who) && zombie_utility::is_player_valid(who))
		{
			who thread zm_audio::create_and_play_dialog("eggs", "quest8", 6);
			who playsound("evt_sq_bag_dynamite_catch");
			who.var_4088da72 = 1;
			self.owner_ent notify("caught");
			self.owner_ent ghost();
			who zm_sidequests::add_sidequest_icon("sq", "dynamite");
			self delete();
			break;
		}
	}
}

/*
	Name: function_5b66185a
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x1360
	Size: 0x410
	Parameters: 0
	Flags: None
	Line Number: 320
*/
function function_5b66185a()
{
	level endon("hash_36d53f0b");
	wall = GetEnt("sq_wall", "targetname");
	wall solid();
	level flag::wait_till("meteorite_shrunk");
	player_close = 0;
	player = undefined;
	while(!player_close)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(Distance2DSquared(players[i].origin, wall.origin) < 57600)
			{
				player_close = 1;
				player = players[i];
				break;
			}
		}
		wait(0.1);
	}
	level function_43e26f4d(player);
	level flag::set("dynamite_chat");
	level.var_56963dec = spawn("trigger_radius_use", wall.origin, 0, 56, 72);
	level.var_56963dec TriggerIgnoreTeam();
	level.var_56963dec setcursorhint("HINT_NOICON");
	level.var_56963dec.radius = 48;
	level.var_56963dec.height = 72;
	var_6d71b4aa = 1;
	while(var_6d71b4aa)
	{
		level.var_56963dec waittill("trigger", who);
		if(isPlayer(who) && zombie_utility::is_player_valid(who) && isdefined(who.var_4088da72) && who.var_4088da72)
		{
			who.var_4088da72 = undefined;
			who zm_sidequests::remove_sidequest_icon("sq", "dynamite");
			var_6d71b4aa = 0;
		}
	}
	level notify("suspend_timer");
	level.var_56963dec delete();
	level.var_56963dec = undefined;
	level function_69e4e9b6();
	players_far = 0;
	for(players = GetPlayers(); players_far < players.size; players = GetPlayers())
	{
		players_far = 0;
		for(i = 0; i < players.size; i++)
		{
			if(Distance2DSquared(players[i].origin, wall.origin) > 129600)
			{
				players_far++;
			}
		}
		wait(0.1);
	}
	level flag::set("given_dynamite");
}

/*
	Name: stage_logic
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x1778
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 390
*/
function stage_logic()
{
	level flag::wait_till("meteorite_shrunk");
	level flag::set("pap_override");
	level flag::wait_till("dynamite_chat");
	level flag::wait_till("given_dynamite");
	wait(5);
	zm_sidequests::stage_completed("sq", "BaG");
	return;
}

/*
	Name: exit_stage
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x1830
	Size: 0x2C8
	Parameters: 1
	Flags: None
	Line Number: 411
*/
function exit_stage(success)
{
	if(success)
	{
		namespace_abd6a8a5::create_radio(9, &namespace_abd6a8a5::radio9_override);
		level._buttons_can_reset = 0;
	}
	else
	{
		namespace_abd6a8a5::create_radio(8);
		level flag::clear("meteorite_shrunk");
		ent = GetEnt("sq_meteorite", "targetname");
		ent.origin = ent.original_origin;
		ent.angles = ent.original_angles;
		ent SetModel("p7_zm_sha_meteorite");
		namespace_1e4bbaa5::reset_dynamite();
		level flag::clear("pap_override");
		level thread namespace_435c2400::fail_skit();
	}
	if(isdefined(level.var_6dc7946f))
	{
		level.var_6dc7946f delete();
		level.var_6dc7946f = undefined;
	}
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i].var_4088da72))
		{
			players[i].var_4088da72 = undefined;
			players[i] zm_sidequests::remove_sidequest_icon("sq", "dynamite");
		}
	}
	if(isdefined(level.var_56963dec))
	{
		level.var_56963dec delete();
	}
	gongs = GetEntArray("sq_gong", "targetname");
	Array::thread_all(gongs, &dud_gong_handler);
	if(isdefined(level.var_8e1fd3d4))
	{
		level.var_8e1fd3d4 delete();
		level.var_8e1fd3d4 = undefined;
	}
	level.skit_vox_override = 0;
}

/*
	Name: function_f702c96b
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x1B00
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 468
*/
function function_f702c96b()
{
	if(!isdefined(level.var_4389e8e5) || level.var_4389e8e5 == 0)
	{
		level.var_4389e8e5 = 60;
	}
	else
	{
		level.var_4389e8e5 = level.var_4389e8e5 + 60;
		return;
	}
	level endon("wrong_gong");
	level flag::set("gongs_resonating");
	while(level.var_4389e8e5)
	{
		level.var_4389e8e5--;
		wait(1);
	}
	level flag::clear("gongs_resonating");
}

/*
	Name: function_88b98782
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x1BB8
	Size: 0x300
	Parameters: 1
	Flags: None
	Line Number: 499
*/
function function_88b98782(player)
{
	level endon("kill_resonate");
	self.ringing = 1;
	if(isdefined(self.right_gong) && self.right_gong)
	{
		self PlayLoopSound("mus_sq_bag_gong_correct_loop_" + level._num_gongs, 5);
	}
	else
	{
		self playsound("evt_sq_bag_gong_incorrect");
	}
	if(level._num_gongs == 4)
	{
		level thread function_f702c96b();
	}
	if(isdefined(player) && isPlayer(player))
	{
		if(self.right_gong && level._num_gongs == 1)
		{
			player thread zm_audio::create_and_play_dialog("eggs", "quest8", 1);
		}
		else if(self.right_gong && level flag::get("gongs_resonating"))
		{
			player thread zm_audio::create_and_play_dialog("eggs", "quest8", 2);
		}
		else if(!self.right_gong)
		{
			player thread zm_audio::create_and_play_dialog("eggs", "quest8", 0);
		}
	}
	if(self.right_gong == 0)
	{
		level notify("wrong_gong");
		level.var_4389e8e5 = 0;
		gongs = GetEntArray("sq_gong", "targetname");
		for(i = 0; i < gongs.size; i++)
		{
			if(gongs[i].right_gong)
			{
				if(gongs[i].ringing)
				{
					if(level._num_gongs >= 0)
					{
						level._num_gongs--;
					}
					gongs[i] StopLoopSound(5);
				}
			}
			gongs[i].ringing = 0;
		}
		level notify("kill_resonate");
	}
	wait(60);
	if(self.right_gong && level._num_gongs >= 0)
	{
		level._num_gongs--;
	}
	self.ringing = 0;
	self StopLoopSound(5);
	return;
}

/*
	Name: function_287b9cb6
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x1EC0
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 572
*/
function function_287b9cb6(var_f75f842b, player)
{
	if(self.right_gong && level._num_gongs < 4)
	{
		level._num_gongs++;
	}
	self thread function_88b98782(player);
}

/*
	Name: gong_handler
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x1F20
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 591
*/
function gong_handler()
{
	level endon("hash_36d53f0b");
	if(!isdefined(self.ringing))
	{
		self.ringing = 0;
	}
	self thread function_2e874442();
	while(1)
	{
		self waittill("triggered", who);
		if(!self.ringing)
		{
			self function_287b9cb6(1, who);
		}
	}
}

/*
	Name: function_2e874442
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x1FB0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 619
*/
function function_2e874442()
{
	/#
		level endon("hash_c43e46b4");
		level endon("hash_36d53f0b");
		while(!(isdefined(level.disable_print3d_ent) && level.disable_print3d_ent))
		{
			if(!self.ringing && self.right_gong)
			{
				print3d(self.origin + VectorScale((0, 0, 1), 64), "Dev Block strings are not supported", VectorScale((0, 1, 0), 255), 1);
			}
			wait(0.1);
		}
	#/
}

/*
	Name: function_39927c36
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x2050
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 645
*/
function function_39927c36()
{
	if(isdefined(self.var_8088fd7a))
	{
		return;
	}
	self.var_8088fd7a = 1;
	self useanimtree(-1);
	while(1)
	{
		self waittill("triggered");
		self animation::stop();
		self thread animation::Play("p7_fxanim_zm_sha_gong_anim", self.origin, self.angles);
	}
}

/*
	Name: dud_gong_handler
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x20F0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 671
*/
function dud_gong_handler()
{
	level endon("hash_c43e46b4");
	self thread function_39927c36();
	if(!isdefined(self.ringing))
	{
		self.ringing = 0;
	}
	self thread function_2e874442();
	while(1)
	{
		self waittill("triggered");
		if(!self.ringing)
		{
			self function_287b9cb6(0);
		}
	}
}

/*
	Name: function_43e26f4d
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x2188
	Size: 0x3C8
	Parameters: 1
	Flags: None
	Line Number: 700
*/
function function_43e26f4d(player)
{
	level endon("hash_c511c0c0");
	struct = struct::get("sq_location_bag", "targetname");
	if(!isdefined(struct))
	{
		return;
	}
	level.var_8e1fd3d4 = spawn("script_origin", struct.origin);
	var_53a95046 = soundgetplaybacktime("vox_egg_story_5_0");
	thread namespace_cc012897::Send("vox_egg_story_5_0", "all", var_53a95046);
	level.var_8e1fd3d4 playsoundwithnotify("vox_egg_story_5_0", "sounddone");
	level.var_8e1fd3d4 waittill("sounddone");
	var_53a95046 = soundgetplaybacktime("vox_egg_story_5_1");
	thread namespace_cc012897::Send("vox_egg_story_5_1", "all", var_53a95046);
	level.var_8e1fd3d4 playsoundwithnotify("vox_egg_story_5_1", "sounddone");
	level.var_8e1fd3d4 waittill("sounddone");
	var_53a95046 = soundgetplaybacktime("vox_egg_story_5_2");
	thread namespace_cc012897::Send("vox_egg_story_5_2", "all", var_53a95046);
	level.var_8e1fd3d4 playsoundwithnotify("vox_egg_story_5_2", "sounddone");
	level.var_8e1fd3d4 waittill("sounddone");
	if(isdefined(player))
	{
		level.skit_vox_override = 1;
		snd = "vox_egg_story_5_3" + namespace_1e4bbaa5::function_26186755(player.characterindex);
		var_53a95046 = soundgetplaybacktime(snd);
		thread namespace_cc012897::Send(snd, "all", var_53a95046);
		player playsoundwithnotify(snd, "vox_egg_sounddone");
		player waittill("vox_egg_sounddone");
		level.skit_vox_override = 0;
	}
	var_53a95046 = soundgetplaybacktime("vox_egg_story_5_4");
	thread namespace_cc012897::Send("vox_egg_story_5_4", "all", var_53a95046);
	level.var_8e1fd3d4 playsoundwithnotify("vox_egg_story_5_4", "sounddone");
	level.var_8e1fd3d4 waittill("sounddone");
	var_53a95046 = soundgetplaybacktime("vox_egg_story_5_5");
	thread namespace_cc012897::Send("vox_egg_story_5_5", "all", var_53a95046);
	level.var_8e1fd3d4 playsoundwithnotify("vox_egg_story_5_5", "sounddone");
	level.var_8e1fd3d4 waittill("sounddone");
	level.var_8e1fd3d4 delete();
	level.var_8e1fd3d4 = undefined;
}

/*
	Name: function_69e4e9b6
	Namespace: namespace_6d88ee3a
	Checksum: 0x424F4353
	Offset: 0x2558
	Size: 0x18E
	Parameters: 0
	Flags: None
	Line Number: 753
*/
function function_69e4e9b6()
{
	level endon("hash_c511c0c0");
	struct = struct::get("sq_location_bag", "targetname");
	if(!isdefined(struct))
	{
		return;
	}
	level.var_8e1fd3d4 = spawn("script_origin", struct.origin);
	var_53a95046 = soundgetplaybacktime("vox_egg_story_5_7");
	thread namespace_cc012897::Send("vox_egg_story_5_7", "all", var_53a95046);
	level.var_8e1fd3d4 playsoundwithnotify("vox_egg_story_5_7", "sounddone");
	level.var_8e1fd3d4 waittill("sounddone");
	var_53a95046 = soundgetplaybacktime("vox_egg_story_5_8");
	thread namespace_cc012897::Send("vox_egg_story_5_8", "all", var_53a95046);
	level.var_8e1fd3d4 playsoundwithnotify("vox_egg_story_5_8", "sounddone");
	level.var_8e1fd3d4 waittill("sounddone");
	level.var_8e1fd3d4 delete();
	level.var_8e1fd3d4 = undefined;
}

