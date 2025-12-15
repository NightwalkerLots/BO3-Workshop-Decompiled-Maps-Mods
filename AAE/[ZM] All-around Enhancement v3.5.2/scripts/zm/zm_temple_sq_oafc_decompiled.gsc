#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\zm_temple_sq;
#include scripts\zm\zm_temple_sq_brock;
#include scripts\zm\zm_temple_sq_skits;

#namespace namespace_d0f39865;

/*
	Name: init
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x508
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 23
*/
function init()
{
	zm_sidequests::declare_sidequest_stage("sq", "OaFC", &init_stage, &stage_logic, &exit_stage);
	zm_sidequests::set_stage_time_limit("sq", "OaFC", 300);
	zm_sidequests::declare_stage_asset_from_struct("sq", "OaFC", "sq_oafc_switch", &function_110b5bd7);
	zm_sidequests::declare_stage_asset_from_struct("sq", "OaFC", "sq_oafc_tileset1", &function_34a397d8, &zm_sidequests::radius_trigger_thread);
	zm_sidequests::declare_stage_asset_from_struct("sq", "OaFC", "sq_oafc_tileset2", &function_a6ab0713, &zm_sidequests::radius_trigger_thread);
	level flag::init("oafc_switch_pressed");
	level flag::init("oafc_plot_vo_done");
}

/*
	Name: stage_logic
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x698
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function stage_logic()
{
	/#
		level flag::wait_till("Dev Block strings are not supported");
		if(GetPlayers().size == 1)
		{
			wait(20);
			level notify("raise_crystal_1", 1);
			level waittill("hash_64e9e78e");
			wait(5);
			IPrintLnBold("Dev Block strings are not supported");
			zm_sidequests::stage_completed("Dev Block strings are not supported", "Dev Block strings are not supported");
			return;
		}
	#/
}

/*
	Name: function_110b5bd7
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x748
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function function_110b5bd7()
{
	level endon("hash_21dcd34e");
	level thread function_2b71bd26();
	self.on_pos = self.origin;
	self.off_pos = self.on_pos - anglesToUp(self.angles) * 5.5;
	self.trigger TriggerIgnoreTeam();
	self waittill("triggered", who);
	if(isdefined(who))
	{
		level._player_who_pressed_the_switch = who;
	}
	self playsound("evt_sq_gen_button");
	self moveto(self.off_pos, 0.25);
	self waittill("movedone");
	level flag::set("oafc_switch_pressed");
	level thread function_f7d6a150();
}

/*
	Name: function_2b71bd26
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x890
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 100
*/
function function_2b71bd26()
{
	level endon("hash_21dcd34e");
	struct = struct::get("sq_location_oafc", "targetname");
	if(!isdefined(struct))
	{
		return;
	}
	while(!level flag::get("oafc_switch_pressed"))
	{
		playsoundatposition("evt_sq_oafc_knock", struct.origin);
		wait(RandomFloatRange(1.5, 4));
	}
}

/*
	Name: function_34a397d8
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x948
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 125
*/
function function_34a397d8()
{
	self.set = 1;
	self.original_origin = self.origin;
}

/*
	Name: function_a6ab0713
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x970
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 141
*/
function function_a6ab0713()
{
	self.set = 2;
	self.original_origin = self.origin;
}

/*
	Name: function_7269a501
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x998
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 157
*/
function function_7269a501()
{
	/#
		level endon("reset_tiles");
		level endon("hash_21dcd34e");
		while(isdefined(self.matched) && !self.matched)
		{
			print3d(self.origin, self.tile, VectorScale((0, 1, 0), 255));
			wait(0.1);
		}
	#/
}

/*
	Name: function_cc0fce1
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0xA10
	Size: 0x7C0
	Parameters: 0
	Flags: None
	Line Number: 180
*/
function function_cc0fce1()
{
	/#
		level endon("hash_21dcd34e");
		if(!isdefined(level.var_7d341977))
		{
			level.var_7d341977 = 1;
			level.var_e38ebc06 = NewDebugHudElem();
			level.var_e38ebc06.location = 0;
			level.var_e38ebc06.alignX = "Dev Block strings are not supported";
			level.var_e38ebc06.alignY = "Dev Block strings are not supported";
			level.var_e38ebc06.foreground = 1;
			level.var_e38ebc06.fontscale = 1.3;
			level.var_e38ebc06.sort = 20;
			level.var_e38ebc06.x = 10;
			level.var_e38ebc06.y = 240;
			level.var_e38ebc06.og_scale = 1;
			level.var_e38ebc06.color = VectorScale((1, 1, 1), 255);
			level.var_e38ebc06.alpha = 1;
			level.var_1fee3600 = NewDebugHudElem();
			level.var_1fee3600.location = 0;
			level.var_1fee3600.alignX = "Dev Block strings are not supported";
			level.var_1fee3600.alignY = "Dev Block strings are not supported";
			level.var_1fee3600.foreground = 1;
			level.var_1fee3600.fontscale = 1.3;
			level.var_1fee3600.sort = 20;
			level.var_1fee3600.x = 0;
			level.var_1fee3600.y = 240;
			level.var_1fee3600.og_scale = 1;
			level.var_1fee3600.color = VectorScale((1, 1, 1), 255);
			level.var_1fee3600.alpha = 1;
			level.var_1fee3600 setText("Dev Block strings are not supported");
			level.var_bd8c419d = NewDebugHudElem();
			level.var_bd8c419d.location = 0;
			level.var_bd8c419d.alignX = "Dev Block strings are not supported";
			level.var_bd8c419d.alignY = "Dev Block strings are not supported";
			level.var_bd8c419d.foreground = 1;
			level.var_bd8c419d.fontscale = 1.3;
			level.var_bd8c419d.sort = 20;
			level.var_bd8c419d.x = 10;
			level.var_bd8c419d.y = 270;
			level.var_bd8c419d.og_scale = 1;
			level.var_bd8c419d.color = VectorScale((1, 1, 1), 255);
			level.var_bd8c419d.alpha = 1;
			level.var_1780e445 = NewDebugHudElem();
			level.var_1780e445.location = 0;
			level.var_1780e445.alignX = "Dev Block strings are not supported";
			level.var_1780e445.alignY = "Dev Block strings are not supported";
			level.var_1780e445.foreground = 1;
			level.var_1780e445.fontscale = 1.3;
			level.var_1780e445.sort = 20;
			level.var_1780e445.x = 0;
			level.var_1780e445.y = 270;
			level.var_1780e445.og_scale = 1;
			level.var_1780e445.color = VectorScale((1, 1, 1), 255);
			level.var_1780e445.alpha = 1;
			level.var_1780e445 setText("Dev Block strings are not supported");
			level.var_74774b9a = NewDebugHudElem();
			level.var_74774b9a.location = 0;
			level.var_74774b9a.alignX = "Dev Block strings are not supported";
			level.var_74774b9a.alignY = "Dev Block strings are not supported";
			level.var_74774b9a.foreground = 1;
			level.var_74774b9a.fontscale = 1.3;
			level.var_74774b9a.sort = 20;
			level.var_74774b9a.x = 10;
			level.var_74774b9a.y = 300;
			level.var_74774b9a.og_scale = 1;
			level.var_74774b9a.color = VectorScale((1, 1, 1), 255);
			level.var_74774b9a.alpha = 1;
			level.var_2fb9871c = NewDebugHudElem();
			level.var_2fb9871c.location = 0;
			level.var_2fb9871c.alignX = "Dev Block strings are not supported";
			level.var_2fb9871c.alignY = "Dev Block strings are not supported";
			level.var_2fb9871c.foreground = 1;
			level.var_2fb9871c.fontscale = 1.3;
			level.var_2fb9871c.sort = 20;
			level.var_2fb9871c.x = 0;
			level.var_2fb9871c.y = 300;
			level.var_2fb9871c.og_scale = 1;
			level.var_2fb9871c.color = VectorScale((1, 1, 1), 255);
			level.var_2fb9871c.alpha = 1;
			level.var_2fb9871c setText("Dev Block strings are not supported");
		}
		while(1)
		{
			if(isdefined(level.var_66c77de0))
			{
				level.var_e38ebc06 setText(level.var_66c77de0.tile);
			}
			else
			{
				level.var_e38ebc06 setText("Dev Block strings are not supported");
			}
			if(isdefined(level.var_d8ceed1b))
			{
				level.var_bd8c419d setText(level.var_d8ceed1b.tile);
			}
			else
			{
				level.var_bd8c419d setText("Dev Block strings are not supported");
			}
			if(isdefined(level.var_fd4714bf))
			{
				level.var_74774b9a setText(level.var_fd4714bf);
			}
			wait(0.05);
		}
	#/
}

/*
	Name: function_c42677e6
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x11D8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 300
*/
function function_c42677e6()
{
	level endon("hash_21dcd34e");
	self endon("hash_5ac1645b");
	level endon("reset_tiles");
	self.origin = self.original_origin;
	/#
		self thread function_7269a501();
	#/
}

/*
	Name: init_stage
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x1238
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 321
*/
function init_stage()
{
	/#
		level thread function_cc0fce1();
	#/
	level flag::clear("oafc_switch_pressed");
	level flag::clear("oafc_plot_vo_done");
	reset_tiles();
	namespace_abd6a8a5::delete_radio();
	level thread delayed_start_skit();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: delayed_start_skit
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x12D8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 345
*/
function delayed_start_skit()
{
	wait(0.5);
	level thread namespace_435c2400::start_skit("tt1");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3b50db2
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x1310
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 363
*/
function function_3b50db2(delay)
{
	level endon("hash_21dcd34e");
	level flag::wait_till("oafc_switch_pressed");
	for(i = 0; i < delay; i++)
	{
		util::wait_network_frame();
	}
	self moveto(self.original_origin, 0.25);
	return;
	ERROR: Bad function call
}

/*
	Name: function_70fbf567
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x13B0
	Size: 0xF8
	Parameters: 2
	Flags: None
	Line Number: 386
*/
function function_70fbf567(tiles, models)
{
	for(i = 0; i < tiles.size; i++)
	{
		tiles[i] SetModel("p7_zm_sha_glyph_stone_blank");
		tiles[i].tile = models[i];
		tiles[i].matched = 0;
		tiles[i].origin = tiles[i].original_origin - VectorScale((0, 0, 1), 24);
		tiles[i] thread function_3b50db2(i % 4);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1a1c7361
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x14B0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 410
*/
function function_1a1c7361()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i].sessionstate != "spectator" && self istouching(players[i]))
		{
			return players[i];
		}
	}
	return undefined;
}

/*
	Name: function_1667d8eb
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x1550
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 433
*/
function function_1667d8eb(tile)
{
	level endon("hash_2687e434");
	var_b7081a33 = [];
	if(tile.targetname == "sq_oafc_tileset1")
	{
		var_b7081a33 = GetEntArray("sq_oafc_tileset2", "targetname");
		level notify("hash_e177c495");
		level endon("hash_e177c495");
	}
	else
	{
		var_b7081a33 = GetEntArray("sq_oafc_tileset1", "targetname");
		level notify("hash_77a3efe");
		level endon("hash_77a3efe");
	}
	var_ad717133 = undefined;
	foreach(var_8bf17d58 in var_b7081a33)
	{
		if(tile.tile == var_8bf17d58.tile)
		{
			var_ad717133 = var_8bf17d58;
		}
	}
	while(isdefined(var_ad717133))
	{
		/#
			print3d(var_ad717133.origin + VectorScale((0, 0, 1), 32), "Dev Block strings are not supported", VectorScale((1, 0, 0), 255), 1);
		#/
		util::wait_network_frame();
	}
}

/*
	Name: function_145e3b98
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x1720
	Size: 0x848
	Parameters: 2
	Flags: None
	Line Number: 476
*/
function function_145e3b98(tiles, set)
{
	self endon("death");
	level endon("reset_tiles");
	self TriggerEnable(0);
	level flag::wait_till("oafc_switch_pressed");
	self TriggerEnable(1);
	while(1)
	{
		for(i = 0; i < tiles.size; i++)
		{
			tile = tiles[i];
			if(isdefined(tile) && !tile.matched)
			{
				self.origin = tiles[i].origin;
				var_95d1fa7 = self function_1a1c7361();
				if(isdefined(var_95d1fa7))
				{
					/#
						if(set == 1)
						{
							println("Dev Block strings are not supported" + i);
						}
					#/
					tile SetModel(tile.tile);
					tile playsound("evt_sq_oafc_glyph_activate");
					/#
						level thread function_1667d8eb(tile);
					#/
					matched = 0;
					if(set == 1)
					{
						level.var_66c77de0 = tile;
					}
					else
					{
						level.var_d8ceed1b = tile;
					}
					while(isdefined(var_95d1fa7) && self istouching(var_95d1fa7) && var_95d1fa7.sessionstate != "spectator" && !tile.matched)
					{
						self.var_95d1fa7 = var_95d1fa7;
						if(set == 1)
						{
							if(isdefined(level.var_66c77de0) && isdefined(level.var_d8ceed1b))
							{
								if(level.var_66c77de0.tile == level.var_d8ceed1b.tile)
								{
									level.var_66c77de0 playsound("evt_sq_oafc_glyph_correct");
									level.var_d8ceed1b playsound("evt_sq_oafc_glyph_correct");
									/#
										level notify("hash_2687e434");
									#/
									matched = 1;
									level.var_66c77de0.matched = 1;
									level.var_d8ceed1b.matched = 1;
									level.var_66c77de0 moveto(level.var_66c77de0.origin - VectorScale((0, 0, 1), 24), 0.5);
									level.var_d8ceed1b moveto(level.var_d8ceed1b.origin - VectorScale((0, 0, 1), 24), 0.5);
									level.var_66c77de0 waittill("movedone");
									level.var_66c77de0 = undefined;
									level.var_d8ceed1b = undefined;
									level.var_fd4714bf++;
									if(level.var_fd4714bf < level.var_1aea7d74)
									{
										rand = randomIntRange(0, 2);
										if(isdefined(var_95d1fa7) && rand == 0)
										{
											var_95d1fa7 thread zm_audio::create_and_play_dialog("eggs", "quest1", randomIntRange(5, 8));
										}
										else if(isdefined(level.var_ca8e74be.var_95d1fa7))
										{
											level.var_ca8e74be.var_95d1fa7 thread zm_audio::create_and_play_dialog("eggs", "quest1", randomIntRange(5, 8));
										}
									}
									if(level.var_fd4714bf == level.var_1aea7d74)
									{
										/#
											println("Dev Block strings are not supported");
										#/
										struct = struct::get("sq_location_oafc", "targetname");
										if(isdefined(struct))
										{
											playsoundatposition("evt_sq_oafc_glyph_complete", struct.origin);
											playsoundatposition("evt_sq_oafc_kachunk", struct.origin);
										}
										level notify("suspend_timer");
										level notify("raise_crystal_1", 1);
										level waittill("hash_64e9e78e");
										level flag::wait_till("oafc_plot_vo_done");
										wait(5);
										zm_sidequests::stage_completed("sq", "OaFC");
										return;
									}
									/#
										println("Dev Block strings are not supported");
										break;
									#/
								}
								else
								{
									level.var_66c77de0 playsound("evt_sq_oafc_glyph_wrong");
									level.var_d8ceed1b playsound("evt_sq_oafc_glyph_wrong");
									rand = randomIntRange(0, 2);
									if(isdefined(var_95d1fa7) && rand == 0)
									{
										var_95d1fa7 thread zm_audio::create_and_play_dialog("eggs", "quest1", randomIntRange(2, 5));
									}
									else if(isdefined(level.var_ca8e74be.var_95d1fa7))
									{
										level.var_ca8e74be.var_95d1fa7 thread zm_audio::create_and_play_dialog("eggs", "quest1", randomIntRange(2, 5));
									}
									while(isdefined(var_95d1fa7) && self istouching(var_95d1fa7) && isdefined(level.var_d8ceed1b))
									{
										wait(0.05);
									}
									/#
										println("Dev Block strings are not supported");
									#/
									level thread reset_tiles();
									break;
								}
							}
						}
						wait(0.05);
					}
					tile playsound("evt_sq_oafc_glyph_clear");
					if(set == 1)
					{
						level.var_66c77de0 = undefined;
					}
					else
					{
						level.var_d8ceed1b = undefined;
					}
					tile SetModel("p7_zm_sha_glyph_stone_blank");
				}
			}
		}
		wait(0.05);
	}
	/#
		if(set == 1)
		{
			println("Dev Block strings are not supported");
		}
	#/
}

/*
	Name: reset_tiles
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x1F70
	Size: 0x270
	Parameters: 0
	Flags: None
	Line Number: 633
*/
function reset_tiles()
{
	var_b6e112da = Array("p7_zm_sha_glyph_stone_01", "p7_zm_sha_glyph_stone_02", "p7_zm_sha_glyph_stone_03", "p7_zm_sha_glyph_stone_04", "p7_zm_sha_glyph_stone_05", "p7_zm_sha_glyph_stone_06", "p7_zm_sha_glyph_stone_07", "p7_zm_sha_glyph_stone_08", "p7_zm_sha_glyph_stone_09", "p7_zm_sha_glyph_stone_10", "p7_zm_sha_glyph_stone_11", "p7_zm_sha_glyph_stone_12");
	level notify("reset_tiles");
	if(!isdefined(level.var_a48bfa55))
	{
		level.var_a48bfa55 = spawn("trigger_radius", (0, 0, 0), 0, 22, 72);
		level.var_ca8e74be = spawn("trigger_radius", (0, 0, 0), 0, 22, 72);
		level.var_a48bfa55 thread function_cdf129a9();
		level.var_ca8e74be thread function_cdf129a9();
	}
	level.var_fd4714bf = 0;
	level.var_66c77de0 = undefined;
	level.var_d8ceed1b = undefined;
	var_b6e112da = Array::randomize(var_b6e112da);
	var_34a397d8 = GetEntArray("sq_oafc_tileset1", "targetname");
	level.var_1aea7d74 = var_34a397d8.size;
	function_70fbf567(var_34a397d8, var_b6e112da);
	level.var_a48bfa55 thread function_145e3b98(var_34a397d8, 1);
	var_b6e112da = Array::randomize(var_b6e112da);
	var_a6ab0713 = GetEntArray("sq_oafc_tileset2", "targetname");
	function_70fbf567(var_a6ab0713, var_b6e112da);
	level.var_ca8e74be thread function_145e3b98(var_a6ab0713, 2);
}

/*
	Name: function_cdf129a9
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x21E8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 668
*/
function function_cdf129a9()
{
	self endon("death");
	level endon("hash_be6d0796");
	while(1)
	{
		self waittill("trigger", who);
		if(isdefined(who) && isPlayer(who))
		{
			who thread zm_audio::create_and_play_dialog("eggs", "quest1", 1);
			break;
		}
	}
	level notify("hash_be6d0796");
}

/*
	Name: exit_stage
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x2290
	Size: 0x1B0
	Parameters: 1
	Flags: None
	Line Number: 694
*/
function exit_stage(success)
{
	if(isdefined(level.var_7d341977))
	{
		level.var_7d341977 = undefined;
		level.var_e38ebc06 destroy();
		level.var_e38ebc06 = undefined;
		level.var_1fee3600 destroy();
		level.var_1fee3600 = undefined;
		level.var_bd8c419d destroy();
		level.var_bd8c419d = undefined;
		level.var_1780e445 destroy();
		level.var_1780e445 = undefined;
		level.var_74774b9a destroy();
		level.var_74774b9a.location = undefined;
		level.var_2fb9871c destroy();
		level.var_2fb9871c = undefined;
	}
	if(success)
	{
		namespace_abd6a8a5::create_radio(2, &namespace_abd6a8a5::radio2_override);
	}
	else
	{
		namespace_abd6a8a5::create_radio(1);
		level thread namespace_435c2400::fail_skit(1);
	}
	level.var_a48bfa55 delete();
	level.var_ca8e74be delete();
	if(isdefined(level.var_b88253bf))
	{
		level.var_b88253bf delete();
		level.var_b88253bf = undefined;
	}
	level.skit_vox_override = 0;
}

/*
	Name: function_f7d6a150
	Namespace: namespace_d0f39865
	Checksum: 0x424F4353
	Offset: 0x2448
	Size: 0x586
	Parameters: 0
	Flags: None
	Line Number: 741
*/
function function_f7d6a150()
{
	level endon("hash_21dcd34e");
	struct = struct::get("sq_location_oafc", "targetname");
	if(!isdefined(struct))
	{
		return;
	}
	level.var_b88253bf = spawn("script_origin", struct.origin);
	var_53a95046 = soundgetplaybacktime("vox_egg_story_1_0");
	thread namespace_cc012897::Send("vox_egg_story_1_0", "all", var_53a95046);
	level.var_b88253bf playsoundwithnotify("vox_egg_story_1_0", "sounddone");
	level.var_b88253bf waittill("sounddone");
	if(isdefined(level._player_who_pressed_the_switch))
	{
		who = level._player_who_pressed_the_switch;
		level.skit_vox_override = 1;
		snd = "vox_egg_story_1_1" + namespace_1e4bbaa5::function_26186755(who.characterindex);
		var_53a95046 = soundgetplaybacktime(snd);
		thread namespace_cc012897::Send(snd, "all", var_53a95046);
		who playsoundwithnotify(snd, "vox_egg_sounddone");
		who waittill("vox_egg_sounddone");
		level.skit_vox_override = 0;
	}
	var_53a95046 = soundgetplaybacktime("vox_egg_story_1_2");
	thread namespace_cc012897::Send("vox_egg_story_1_2", "all", var_53a95046);
	level.var_b88253bf playsoundwithnotify("vox_egg_story_1_2", "sounddone");
	level.var_b88253bf waittill("sounddone");
	while(level.var_fd4714bf < 1)
	{
		wait(0.1);
	}
	var_53a95046 = soundgetplaybacktime("vox_egg_story_1_3");
	thread namespace_cc012897::Send("vox_egg_story_1_3", "all", var_53a95046);
	level.var_b88253bf playsoundwithnotify("vox_egg_story_1_3", "sounddone");
	level.var_b88253bf waittill("sounddone");
	while(level.var_fd4714bf != level.var_1aea7d74)
	{
		wait(0.1);
	}
	var_53a95046 = soundgetplaybacktime("vox_egg_story_1_4");
	thread namespace_cc012897::Send("vox_egg_story_1_4", "all", var_53a95046);
	level.var_b88253bf playsoundwithnotify("vox_egg_story_1_4", "sounddone");
	level.var_b88253bf waittill("sounddone");
	if(isdefined(level._player_who_pressed_the_switch))
	{
		who = level._player_who_pressed_the_switch;
		level.skit_vox_override = 1;
		snd = "vox_egg_story_1_5" + namespace_1e4bbaa5::function_26186755(who.characterindex);
		var_53a95046 = soundgetplaybacktime(snd);
		thread namespace_cc012897::Send(snd, "all", var_53a95046);
		who playsoundwithnotify(snd, "vox_egg_sounddone");
		who waittill("vox_egg_sounddone");
		level.skit_vox_override = 0;
	}
	var_53a95046 = soundgetplaybacktime("vox_egg_story_1_6");
	thread namespace_cc012897::Send("vox_egg_story_1_6", "all", var_53a95046);
	level.var_b88253bf playsoundwithnotify("vox_egg_story_1_6", "sounddone");
	level.var_b88253bf waittill("sounddone");
	var_53a95046 = soundgetplaybacktime("vox_egg_story_1_7");
	thread namespace_cc012897::Send("vox_egg_story_1_7", "all", var_53a95046);
	level.var_b88253bf playsoundwithnotify("vox_egg_story_1_7", "sounddone");
	level.var_b88253bf waittill("sounddone");
	level flag::set("oafc_plot_vo_done");
	level.var_b88253bf delete();
	level.var_b88253bf = undefined;
}

