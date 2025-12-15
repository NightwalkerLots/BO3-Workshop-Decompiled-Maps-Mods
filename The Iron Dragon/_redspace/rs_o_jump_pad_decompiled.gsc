#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_utility;

#namespace namespace_7a23391b;

/*
	Name: __init__sytem__
	Namespace: namespace_7a23391b
	Checksum: 0x83D50502
	Offset: 0x340
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("rs_o_jump_pad", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_7a23391b
	Checksum: 0x81ACD409
	Offset: 0x380
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function __init__()
{
	level jump_pad_init();
	return;
}

/*
	Name: jump_pad_init
	Namespace: namespace_7a23391b
	Checksum: 0x6B057FD1
	Offset: 0x3A8
	Size: 0x4D8
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function jump_pad_init()
{
	jump_pad_triggers = GetEntArray("trig_jump_pad", "targetname");
	if(!isdefined(jump_pad_triggers))
	{
		return;
	}
	for(i = 0; i < jump_pad_triggers.size; i++)
	{
		jump_pad_triggers[i].start = struct::get(jump_pad_triggers[i].target, "targetname");
		jump_pad_triggers[i].destination = struct::get_array(jump_pad_triggers[i].start.target, "targetname");
		var_efc12a1b = 2.85;
		var_7244a1b1 = 800;
		var_a90fec4 = 72;
		var_6e58484f = 500;
		var_3f40ff3d = 0;
		var_700adf63 = 0;
		values = StrTok("time" + ":" + "zOffset" + ":" + "zPeakProgress" + ":" + "cost" + ":" + "delay" + ":" + "cooldown", ":");
		input = jump_pad_triggers[i].script_string;
		if(input != "")
		{
			input = StrTok(input, ",");
			for(j = 0; j < input.size; j++)
			{
				var_b0da2614 = StrTok(input[j], ":");
				var_a90d340a = "";
				for(K = 0; K < values.size; K++)
				{
					if(var_b0da2614[0] == values[K])
					{
						switch(K)
						{
							case 0:
							{
								var_efc12a1b = float(var_b0da2614[1]);
								break;
							}
							case 1:
							{
								var_7244a1b1 = Int(var_b0da2614[1]);
								break;
							}
							case 2:
							{
								var_a90fec4 = Int(var_b0da2614[1]);
								break;
							}
							case 3:
							{
								var_6e58484f = Int(var_b0da2614[1]);
								break;
							}
							case 4:
							{
								var_3f40ff3d = float(var_b0da2614[1]);
								break;
							}
							case 5:
							{
								var_700adf63 = float(var_b0da2614[1]);
								break;
							}
						}
					}
				}
			}
		}
		jump_pad_triggers[i].var_efc12a1b = var_efc12a1b;
		jump_pad_triggers[i].var_cbb84b9b = var_7244a1b1;
		jump_pad_triggers[i].var_a90fec4 = var_a90fec4;
		jump_pad_triggers[i].var_6e58484f = var_6e58484f;
		jump_pad_triggers[i].var_3f40ff3d = var_3f40ff3d;
		jump_pad_triggers[i].var_700adf63 = var_700adf63;
		jump_pad_triggers[i] thread function_fe51959c();
		jump_pad_triggers[i] thread jump_pad_think();
	}
}

/*
	Name: function_fe51959c
	Namespace: namespace_7a23391b
	Checksum: 0xD66725FA
	Offset: 0x888
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 144
*/
function function_fe51959c()
{
	self endon("destroyed");
	while(isdefined(self))
	{
		FX = spawn("script_model", self.origin);
		FX SetModel("tag_origin");
		PlayFXOnTag("dlc1/castle/fx_elec_jumppad", FX, "tag_origin");
		self waittill("hash_3d52c728");
		FX delete();
		FX = spawn("script_model", self.origin);
		FX SetModel("tag_origin");
		PlayFXOnTag("redspace/fx_launchpad_red", FX, "tag_origin");
		self waittill("jump_pad_activate");
		FX delete();
	}
}

/*
	Name: jump_pad_think
	Namespace: namespace_7a23391b
	Checksum: 0x3DC15BF3
	Offset: 0x9C0
	Size: 0x340
	Parameters: 0
	Flags: None
	Line Number: 172
*/
function jump_pad_think()
{
	self endon("destroyed");
	self function_faabbe36();
	while(isdefined(self))
	{
		wait(0.2);
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			who = players[i];
			if(!self function_2ce57f53())
			{
				self.var_fa9835c6 = undefined;
			}
			if(!who istouching(self))
			{
				continue;
			}
			if(isPlayer(who) && !isdefined(self.var_fa9835c6))
			{
				if(self.var_6e58484f >= 0 && (!who useButtonPressed() || who.score < self.var_6e58484f))
				{
					continue;
				}
				if(self.var_6e58484f > 0)
				{
					who.score = who.score - self.var_6e58484f;
				}
				if(self.var_3f40ff3d > 0)
				{
					who playsound("flinger_activate");
					self setHintString("");
					wait(self.var_3f40ff3d);
					self function_faabbe36();
					if(!who istouching(self))
					{
						continue;
					}
				}
				start = self.start;
				time = self.var_efc12a1b;
				zoffset = self.var_cbb84b9b;
				var_d443b429 = self.var_a90fec4;
				end = self.destination[RandomInt(self.destination.size)];
				who thread function_dd82322c(start.origin, time, zoffset, var_d443b429, end.origin);
				self.var_fa9835c6 = 1;
				if(self.var_700adf63 > 0)
				{
					wait(0.5);
					self setHintString("Launch pad cooling down...");
					self notify("hash_3d52c728");
					wait(self.var_700adf63);
					self notify("jump_pad_activate");
					self function_faabbe36();
				}
			}
		}
	}
}

/*
	Name: function_faabbe36
	Namespace: namespace_7a23391b
	Checksum: 0x9C684207
	Offset: 0xD08
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 243
*/
function function_faabbe36()
{
	self setcursorhint("HINT_NOICON");
	if(self.var_6e58484f >= 0)
	{
		self setHintString("Press and Hold ^3[{+activate}]^7 use Launch Pad. Cost[" + self.var_6e58484f + "]");
		continue;
	}
	self setHintString("");
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2ce57f53
	Namespace: namespace_7a23391b
	Checksum: 0xC778A9C6
	Offset: 0xD90
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 267
*/
function function_2ce57f53()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] istouching(self))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_dd82322c
	Namespace: namespace_7a23391b
	Checksum: 0x7DC06CA2
	Offset: 0xE08
	Size: 0x738
	Parameters: 5
	Flags: None
	Line Number: 290
*/
function function_dd82322c(start, time, zoffset, var_d443b429, end)
{
	self notify("stop_player_out_of_playable_area_monitor");
	self.var_9a7147c6 = 1;
	self notify("hash_ce6986aa");
	level util::clientNotify("player_fling_blur_0");
	org = start;
	startx = org[0];
	starty = org[1];
	var_f165bed7 = org[2];
	endOrg = end;
	var_b9c74802 = endOrg[0] - startx;
	var_dfc9c26b = endOrg[1] - starty;
	var_6dc25330 = endOrg[2] - var_f165bed7;
	totalTime = time;
	currentTime = 0;
	var_b84b0fbb = 0;
	var_fc15e8c1 = 100;
	var_585ce22d = var_d443b429;
	var_62933806 = zoffset;
	increments = 0.065;
	ent = spawn("script_origin", self.origin);
	self playsound("flinger_fly");
	level.var_6a45a301 = 1;
	FX = spawn("script_model", (-463.964, -670.456, 552.5));
	FX SetModel("tag_origin");
	PlayFXOnTag("dlc1/castle/fx_elec_jumppad", FX, "tag_origin");
	FX = spawn("script_model", (-616, -2582.25, 59.5));
	FX SetModel("tag_origin");
	PlayFXOnTag("dlc1/castle/fx_elec_jumppad", FX, "tag_origin");
	ent PlayLoopSound("flinger_wind_loop");
	wait(0.05);
	self playerLinkTo(ent);
	for(i = 0; i < totalTime; i = 0)
	{
		ent.angles = self.angles;
		var_b84b0fbb = map(i, 0, totalTime, 0, var_fc15e8c1);
		dx = linear(var_b84b0fbb, 0, var_b9c74802, var_fc15e8c1 + 1);
		dy = linear(var_b84b0fbb, 0, var_dfc9c26b, var_fc15e8c1 + 1);
		dZ = linear(var_b84b0fbb, 0, var_6dc25330, var_fc15e8c1 + 1);
		var_34423870 = 0;
		if(var_b84b0fbb < var_585ce22d)
		{
			var_34423870 = function_f2679dc6(var_b84b0fbb, 0, var_62933806, var_fc15e8c1 - var_fc15e8c1 - var_585ce22d);
			continue;
		}
		var_34423870 = var_62933806 - function_ae299e99(var_b84b0fbb - var_585ce22d, 0, var_62933806, var_fc15e8c1 - var_585ce22d);
		x = startx + dx;
		y = starty + dy;
		z = var_f165bed7 + dZ + var_34423870;
		ent moveto((x, y, z), increments, 0, 0);
		wait(increments);
	}
	self SetOrigin(endOrg);
	Earthquake(0.6, 3, self.origin, 200);
	level util::clientNotify("player_fling_blur_disable_0");
	self Unlink();
	ent delete();
	self playsound("flinger_land");
	level.var_6a45a301 = 0;
	FX = spawn("script_model", (128, -1991.25, 14));
	FX SetModel("tag_origin");
	PlayFXOnTag("dlc1/castle/fx_elec_landingpad_glow", FX, "tag_origin");
	FX = spawn("script_model", (-844, 522.75, 864));
	FX SetModel("tag_origin");
	PlayFXOnTag("dlc1/castle/fx_elec_landingpad_glow", FX, "tag_origin");
	self thread zm::player_out_of_playable_area_monitor();
	self.var_9a7147c6 = undefined;
	self notify("hash_656230ab", i + increments);
	wait(8);
	FX delete();
}

/*
	Name: linear
	Namespace: namespace_7a23391b
	Checksum: 0xC881AF19
	Offset: 0x1548
	Size: 0x40
	Parameters: 4
	Flags: None
	Line Number: 373
*/
function linear(t, b, c, d)
{
	return c * t / d - 1 + b;
}

/*
	Name: function_ae299e99
	Namespace: namespace_7a23391b
	Checksum: 0xB1E520F6
	Offset: 0x1590
	Size: 0x80
	Parameters: 4
	Flags: None
	Line Number: 388
*/
function function_ae299e99(t, b, c, d)
{
	return c * -1 * cos(function_57791e31(t / d * function_d1ce033f() / 2)) + c + b;
}

/*
	Name: function_f2679dc6
	Namespace: namespace_7a23391b
	Checksum: 0x3BBCEF3D
	Offset: 0x1618
	Size: 0x80
	Parameters: 4
	Flags: None
	Line Number: 403
*/
function function_f2679dc6(t, b, c, d)
{
	return c * sin(function_57791e31(t / d * function_d1ce033f() / 2)) + b;
}

/*
	Name: function_d1ce033f
	Namespace: namespace_7a23391b
	Checksum: 0x4D815521
	Offset: 0x16A0
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 418
*/
function function_d1ce033f()
{
	return 3.141593;
}

/*
	Name: function_57791e31
	Namespace: namespace_7a23391b
	Checksum: 0xA487568E
	Offset: 0x16B8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 433
*/
function function_57791e31(degree)
{
	return degree * 180 / function_d1ce033f();
}

/*
	Name: map
	Namespace: namespace_7a23391b
	Checksum: 0x1984FA40
	Offset: 0x16E8
	Size: 0x54
	Parameters: 5
	Flags: None
	Line Number: 448
*/
function map(input, var_339aa7bd, var_949b93b8, var_599d2226, var_6a302f3)
{
	return input - var_339aa7bd * var_6a302f3 - var_599d2226 / var_949b93b8 - var_339aa7bd + var_599d2226;
}

