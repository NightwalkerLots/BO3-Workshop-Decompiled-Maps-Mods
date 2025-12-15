#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_sub;
#include scripts\zm\_zm_utility;
#include scripts\zm\gametypes\_globallogic;
#include scripts\zm\gametypes\_globallogic_spawn;

#namespace namespace_e760e7c1;

/*
	Name: init
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0x4E0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 31
*/
function init()
{
	callback::on_connecting(&function_da28e089);
	callback::on_connect(&function_da28e089);
	level thread function_a7c3821f();
	callback::on_disconnect(&function_6cf67ac3);
	level.custom_spawnplayer = &spectator_respawn;
	return;
	ERROR: Bad function call
}

/*
	Name: function_a7c3821f
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0x580
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function function_a7c3821f()
{
	for(;;)
	{
		level util::waittill_either("bleed_out", "connected");
		level thread function_6cf67ac3();
	}
}

/*
	Name: function_6cf67ac3
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0x5D0
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function function_6cf67ac3()
{
	level notify("hash_6cf67ac3");
	level endon("hash_6cf67ac3");
	wait(0.1);
	activePlayers = [];
	foreach(player in GetPlayers())
	{
		if(isdefined(player.sessionstate) && player.sessionstate == "playing")
		{
			activePlayers[activePlayers.size] = player;
		}
	}
	level.activePlayers = activePlayers;
}

/*
	Name: function_da28e089
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0x6D8
	Size: 0x4D8
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function function_da28e089()
{
	if(self IsTestClient())
	{
		self.var_1da7a07d = 1;
		return;
	}
	self notify("hash_da28e089");
	self endon("hash_da28e089");
	self endon("disconnect");
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		if(menu === "StartMenu_Main")
		{
			if(response === "maploaded")
			{
				if(level flag::get("initial_blackscreen_passed"))
				{
					self thread function_e8a7c3ab();
				}
				self.var_1da7a07d = 1;
				thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦SUBEVENT_READYâ¦â¦SUBEVENT_DOTâ¦");
				continue;
			}
			else if(response === "maploaded_norpc")
			{
				if(level flag::get("initial_blackscreen_passed"))
				{
					self thread function_e8a7c3ab();
				}
				iprintln(self.name + "^7's Loading is Incomplete, Movement Patch Disabled For All Players");
				self.var_1da7a07d = 1;
				thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦SUBEVENT_READYâ¦â¦SUBEVENT_DOTâ¦");
				SetDvar("no_movement_patch", 1);
			}
		}
	}
	else
	{
	}
	else
	{
	}
	if(isdefined(level.customMaySpawnLogic))
	{
		level flag::wait_till("all_players_connected");
		var_45136bb3 = StrTok(ToLower(GetDvarString("aae_spectator")), ",");
		result = 0;
		if(var_45136bb3.size > 0)
		{
			foreach(names in var_45136bb3)
			{
				if(IsSubStr(ToLower(self.playerName), names))
				{
					result = 1;
					break;
				}
			}
		}
		else if(result)
		{
			self zm::spawnSpectator();
			self.pers["team"] = "spectator";
			self.team = "spectator";
			self.sessionteam = self.pers["team"];
			level globallogic::updateTeamStatus();
			self.spectator_respawn = undefined;
			self allowSpectateTeam("allies", 1);
			self allowSpectateTeam("axis", 1);
			self allowSpectateTeam("freelook", 0);
			self allowSpectateTeam("none", 0);
			self allowSpectateTeam("localplayers", 0);
			level flag::wait_till("initial_blackscreen_passed");
			self FreezeControls(0);
			self allowSpectateTeam("freelook", 1);
			self allowSpectateTeam("none", 1);
			self allowSpectateTeam("localplayers", 1);
			return;
		}
	}
}

/*
	Name: function_c15618ad
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0xBB8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 190
*/
function function_c15618ad()
{
	if(self.sessionstate == "spectator")
	{
		if(GetDvarString("tfoption_spectator_spawn") == "1")
		{
			self thread function_900f5213();
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_900f5213
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0xC18
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 213
*/
function function_900f5213()
{
	self endon("disconnect");
	self endon("death");
	self endon("spawned_player");
	self thread function_ca8ed3bf();
	self LUINotifyEvent(&"player_afk", 3, 301, 0, 0);
	while(!self useButtonPressed())
	{
		wait(0.048);
	}
	self LUINotifyEvent(&"player_afk", 3, 0, 0, 0);
	self thread function_ff17f242();
}

/*
	Name: function_ff17f242
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0xCF0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 238
*/
function function_ff17f242()
{
	self notify("hash_ff17f242");
	self endon("hash_ff17f242");
	self zm::spectator_respawn_player();
	wait(1);
	self SetWeaponAmmoClip(level.zombie_lethal_grenade_player_init, 2);
}

/*
	Name: spectator_respawn
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0xD58
	Size: 0x2D0
	Parameters: 0
	Flags: None
	Line Number: 257
*/
function spectator_respawn()
{
	origin = self.spectator_respawn.origin;
	angles = self.spectator_respawn.angles;
	self zm::setSpectatePermissions(0);
	new_origin = undefined;
	if(isdefined(level.check_valid_spawn_override))
	{
		new_origin = [[level.check_valid_spawn_override]](self);
	}
	if(!isdefined(new_origin))
	{
		new_origin = zm::check_for_valid_spawn_near_team(self, 1);
	}
	if(isdefined(new_origin))
	{
		if(!isdefined(new_origin.angles))
		{
			angles = (0, 0, 0);
		}
		else
		{
			angles = new_origin.angles;
		}
		self spawn(new_origin.origin, angles);
	}
	else
	{
		self spawn(origin, angles);
	}
	if(isdefined(self zm_utility::get_player_placeable_mine()))
	{
		self TakeWeapon(self zm_utility::get_player_placeable_mine());
		self zm_utility::set_player_placeable_mine(level.weaponNone);
	}
	self zm_equipment::take();
	self.is_burning = undefined;
	self.abilities = [];
	self.is_zombie = 0;
	zm_laststand::set_ignoreme(0);
	self clientfield::set("zmbLastStand", 0);
	self reviveplayer();
	self thread spawned_player();
	self callback::callback("hash_bc12b61f");
	if(isdefined(level._zombiemode_post_respawn_callback))
	{
		self thread [[level._zombiemode_post_respawn_callback]]();
	}
	self zm_score::player_reduce_points("died");
	self zm_melee_weapon::spectator_respawn_all();
	self thread zm::player_zombie_breadcrumb();
	self thread zm_perks::return_retained_perks();
	return 1;
}

/*
	Name: spawned_player
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0x1030
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 322
*/
function spawned_player()
{
	wait(0.048);
	self notify("spawned_player");
}

/*
	Name: function_ca8ed3bf
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0x1058
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 338
*/
function function_ca8ed3bf()
{
	self notify("hash_ca8ed3bf");
	self endon("hash_ca8ed3bf");
	self endon("disconnect");
	self endon("hash_6ee8c7e1");
	self waittill("spawned_player");
	while(!self IsOnGround())
	{
		wait(0.05);
	}
	self LUINotifyEvent(&"player_afk", 3, 0, 0, 0);
}

/*
	Name: function_53a57ed5
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0x10F8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 362
*/
function function_53a57ed5()
{
	level endon("game_ended");
	level endon("end_game");
	level.var_5dcef4ba = 300;
	level thread function_b156e115();
	for(;;)
	{
		level waittill("bleed_out");
		level.var_5dcef4ba = 300;
		wait(0.2);
		foreach(player in level.players)
		{
			if(player.sessionstate == "spectator")
			{
				player thread function_6ee8c7e1();
			}
		}
	}
}

/*
	Name: function_b156e115
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0x1200
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 393
*/
function function_b156e115()
{
	level endon("game_ended");
	level endon("end_game");
	for(;;)
	{
		wait(0.048);
		while(level.var_5dcef4ba >= 1)
		{
			level.var_5dcef4ba--;
			wait(1);
		}
		if(level.var_5dcef4ba == 0)
		{
			foreach(player in level.players)
			{
				if(player.sessionstate == "spectator")
				{
					if(player useButtonPressed())
					{
						player zm::spectator_respawn_player();
						player LUINotifyEvent(&"player_afk", 3, 0, 0, 0);
					}
				}
			}
		}
	}
}

/*
	Name: function_6ee8c7e1
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0x1348
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 432
*/
function function_6ee8c7e1()
{
	self notify("hash_6ee8c7e1");
	self endon("hash_6ee8c7e1");
	self endon("disconnect");
	self endon("death");
	self thread function_ca8ed3bf();
	while(self.sessionstate != "spectator")
	{
		self LUINotifyEvent(&"player_afk", 3, 0, 0, 0);
		return;
		self allowSpectateTeam("freelook", 1);
		if(level.var_5dcef4ba != 0)
		{
			self LUINotifyEvent(&"player_afk", 3, level.var_5dcef4ba, 0, 0);
		}
		else
		{
			self LUINotifyEvent(&"player_afk", 3, 301, 0, 0);
		}
		wait(0.5);
	}
}

/*
	Name: function_c05edfc2
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0x1468
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 466
*/
function function_c05edfc2()
{
	if(isdefined(level.var_4fc014b5))
	{
		level.flag["all_players_connected"] = 0;
		level.var_4fc014b5 = undefined;
		level thread function_f9ccdaaf();
	}
}

/*
	Name: function_f9ccdaaf
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0x14B8
	Size: 0x350
	Parameters: 0
	Flags: None
	Line Number: 486
*/
function function_f9ccdaaf()
{
	level thread function_111fc600();
	level flag::wait_till_timeout(200, "all_players_connected");
	if(!level flag::get("all_players_connected"))
	{
		level.flag["all_players_connected"] = 1;
		level notify("all_players_connected");
	}
	level._unitriggers.largest_radius = 1000;
	trigger::set_flag_permissions("all_players_connected");
	SetDvar("all_players_are_connected", "1");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players.size == 1)
		{
			level flag::set("solo_game");
			level.solo_lives_given = 0;
			level zm::set_default_laststand_pistol(1);
			players[i].lives = 0;
		}
		players[i] FreezeControls(0);
		players[i] setClientUIVisibilityFlag("hud_visible", 0);
	}
	level flag::set("initial_players_connected");
	wait(0.048);
	level flag::set("start_zombie_round_logic");
	if(isdefined(level.added_initial_streamer_blackscreen))
	{
		wait(level.added_initial_streamer_blackscreen);
	}
	else
	{
		wait(0.048);
	}
	level clientfield::set("sndZMBFadeIn", 1);
	LUI::screen_fade_in(0, undefined);
	for(i = 0; i < level.activePlayers.size; i++)
	{
		level.activePlayers[i] thread function_dec095d3();
	}
	level.passed_introscreen = 1;
	if(level.script != "zm_burenyuu")
	{
		level flag::set("initial_blackscreen_passed");
	}
	level clientfield::set("gameplay_started", 1);
	level.n_gameplay_start_time = GetTime();
	clientfield::set("game_start_time", level.n_gameplay_start_time);
	level notify("fade_introblack");
}

/*
	Name: function_dec095d3
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0x1810
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 549
*/
function function_dec095d3()
{
	self endon("death");
	self endon("disconnect");
	if(isdefined(level.customHudReveal))
	{
		self [[level.customHudReveal]]();
	}
	else
	{
		wait(1);
		self setClientUIVisibilityFlag("hud_visible", 1);
		self setClientUIVisibilityFlag("weapon_hud_visible", 1);
	}
}

/*
	Name: function_e8a7c3ab
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0x18A0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 575
*/
function function_e8a7c3ab()
{
	self endon("death");
	self endon("disconnect");
	wait(3);
	self setClientUIVisibilityFlag("hud_visible", 0);
	self setClientUIVisibilityFlag("weapon_hud_visible", 0);
	wait(0.1);
	self setClientUIVisibilityFlag("hud_visible", 1);
	self setClientUIVisibilityFlag("weapon_hud_visible", 1);
}

/*
	Name: function_111fc600
	Namespace: namespace_e760e7c1
	Checksum: 0x424F4353
	Offset: 0x1950
	Size: 0x3BA
	Parameters: 0
	Flags: None
	Line Number: 597
*/
function function_111fc600()
{
	var_9d24df4c = NewHudElem();
	var_9d24df4c.alignX = "left";
	var_9d24df4c.alignY = "top";
	var_9d24df4c.horzAlign = "left";
	var_9d24df4c.vertAlign = "top";
	var_9d24df4c.x = 100;
	var_9d24df4c.y = 100;
	var_9d24df4c.fontscale = 1.5;
	var_9d24df4c.color = (1, 1, 1);
	var_9d24df4c.hidewheninmenu = 0;
	var_9d24df4c.foreground = 1;
	var_d2885280 = 0;
	while(!level flag::get("all_players_connected") && !var_d2885280)
	{
		players = GetPlayers();
		player_count_actual = 0;
		var_c9b4c3c4 = [];
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(players[i].var_1da7a07d))
			{
				player_count_actual++;
			}
			else
			{
				var_c9b4c3c4[var_c9b4c3c4.size] = players[i].name;
			}
			if(player_count_actual == players.size)
			{
				var_d2885280 = 1;
				break;
			}
		}
		if(var_d2885280 || level flag::get("all_players_connected"))
		{
			break;
		}
		if(var_c9b4c3c4.size > 0 && players.size > 1)
		{
			var_9d24df4c.alpha = 0.85;
			text = "\n\n";
			foreach(User in var_c9b4c3c4)
			{
				text = text + User;
				text = text + "\n^7";
			}
			var_9d24df4c.label = &"EXE_AWAITINGHOST";
			var_9d24df4c setText(text);
		}
		else
		{
			var_9d24df4c.label = &"";
			var_9d24df4c setText("");
		}
		wait(0.1);
	}
	var_9d24df4c destroy();
	if(!level flag::get("all_players_connected"))
	{
		level.flag["all_players_connected"] = 1;
		level notify("all_players_connected");
	}
}

