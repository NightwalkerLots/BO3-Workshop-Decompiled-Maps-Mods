#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_bb;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_sub;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\aae_left_ges;

#namespace bgb_machine;

/*
	Name: __init__sytem__
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0xA50
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 34
*/
function autoexec __init__sytem__()
{
	system::register("bgb_machine", &__init__, &__main__, undefined);
}

/*
	Name: function_6e4ac5cf
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0xA98
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function function_6e4ac5cf()
{
	for(i = 0; i < 10; i++)
	{
		num = i;
		var_6719ebd0 = GetDvarString("gobblegum_" + num + "_" + GetDvarString("ui_mapname"));
		if(var_6719ebd0 != "")
		{
			var_62ca82a8 = StrTok(var_6719ebd0, ",");
			if(var_62ca82a8.size == 4)
			{
				for(n = 0; n < var_62ca82a8.size; n++)
				{
					var_62ca82a8[n] = float(var_62ca82a8[n]);
				}
				if(var_62ca82a8[0] != 0 && var_62ca82a8[1] != 0 && var_62ca82a8[2] != 0)
				{
					function_1c3d5eec(GetDvarString("ui_mapname"), (var_62ca82a8[0], var_62ca82a8[1], var_62ca82a8[2]), (0, var_62ca82a8[3], 0));
				}
			}
		}
	}
}

/*
	Name: function_7189e371
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0xC50
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 83
*/
function function_7189e371()
{
	level flag::wait_till("initial_blackscreen_passed");
	self clientfield::set("bank_keyline", 1);
	return;
	ERROR: Bad function call
}

/*
	Name: function_1c3d5eec
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0xCA0
	Size: 0x180
	Parameters: 3
	Flags: None
	Line Number: 101
*/
function function_1c3d5eec(MapName, origin, angles)
{
	if(GetDvarString("ui_mapname") == MapName || GetDvarString("mapname") == MapName)
	{
		trigger = spawn("script_model", origin);
		trigger.angles = angles + VectorScale((0, 1, 0), 90);
		trigger SetModel("p7_zm_zod_bubblegum_machine_no_lion");
		trigger Attach("p7_zm_zod_bubblegum_machine_gumballs");
		trigger Attach("p7_zm_zod_bubblegum_machine_gumballs_flying");
		trigger Attach("p7_zm_zod_bubblegum_machine_lion_head_gumball");
		trigger.targetname = "bgb_machine_use";
		trigger useanimtree(-1);
		trigger.var_87dbeb74 = 1;
		trigger thread function_7189e371();
	}
}

/*
	Name: __init__
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0xE28
	Size: 0x400
	Parameters: 0
	Flags: Private
	Line Number: 128
*/
function private __init__()
{
	foreach(bgb in struct::get_array("bgb_machine_use", "targetname"))
	{
		bgb delete();
	}
	if(!bgb::function_9ae7fa6d())
	{
		bgb_machines = [];
		bgb_machines = ArrayCombine(bgb_machines, GetEntArray("bgb_machine_fix_zbarrier", "script_noteworthy"), 0, 0);
		bgb_machines = ArrayCombine(bgb_machines, GetEntArray("bgb_machine_use", "targetname"), 0, 0);
		level.bgb_machines = [];
		foreach(bgb in bgb_machines)
		{
			jugger = spawn("script_model", bgb.origin);
			jugger.angles = bgb.angles;
			jugger.targetname = "bgb_machine_use";
			jugger SetModel("p7_zm_vending_jugg");
			jugger SetScale(0.67);
			level.bgb_machines[level.bgb_machines.size] = jugger;
			bgb delete();
		}
		return;
	}
	clientfield::register("zbarrier", "zm_bgb_machine", 1, 1, "int");
	clientfield::register("zbarrier", "zm_bgb_machine_selection", 1, 8, "int");
	clientfield::register("zbarrier", "zm_bgb_machine_fx_state", 1, 3, "int");
	clientfield::register("zbarrier", "zm_bgb_machine_ghost_ball", 1, 1, "int");
	SetDvar("scr_firstgumfree", 1);
	callback::on_connect(&on_player_connect);
	callback::on_disconnect(&on_player_disconnect);
	level thread function_4fb7632c();
	if(!isdefined(level.var_42792b8b))
	{
		level.var_42792b8b = 0;
	}
	clientfield::register("toplayer", "zm_bgb_machine_round_buys", 10000, 3, "int");
}

/*
	Name: __main__
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1230
	Size: 0x378
	Parameters: 0
	Flags: Private
	Line Number: 177
*/
function private __main__()
{
	if(bgb::function_9ae7fa6d())
	{
		if(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver") && GetDvarString("tfoption_bgb_use") != "" && GetDvarString("tfoption_bgb_use") != "0")
		{
			switch(GetDvarString("tfoption_bgb_use"))
			{
				case "1":
				{
					level.var_6cb6a683 = 5;
					break;
				}
				case "2":
				{
					level.var_6cb6a683 = 10;
					break;
				}
				case "3":
				{
					level.var_6cb6a683 = 1000;
					break;
				}
				default
				{
					if(!isdefined(level.var_6cb6a683))
					{
						level.var_6cb6a683 = 3;
						break;
					}
				}
			}
		}
		else if(!isdefined(level.var_6cb6a683))
		{
			level.var_6cb6a683 = 3;
		}
		if(!isdefined(level.var_f02c5598))
		{
			level.var_f02c5598 = 1000;
		}
		if(!isdefined(level.var_e1dee7ba))
		{
			level.var_e1dee7ba = 10;
		}
		if(!isdefined(level.var_a3e3127d))
		{
			level.var_a3e3127d = 2;
		}
		if(!isdefined(level.var_8ef45dc2))
		{
			level.var_8ef45dc2 = 10;
		}
		if(!isdefined(level.var_1485dcdc))
		{
			level.var_1485dcdc = 2;
		}
		if(GetDvarInt("tfoption_pregum"))
		{
			level.var_6cb6a683 = 1;
			level.var_d453a2ed = 0;
			if(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver") && GetDvarInt("tfoption_bgb_use"))
			{
				switch(GetDvarString("tfoption_bgb_use"))
				{
					case "1":
					{
						level.var_6cb6a683 = 5;
						break;
					}
					case "2":
					{
						level.var_6cb6a683 = 10;
						break;
					}
					case "3":
					{
						level.var_6cb6a683 = 1000;
						break;
					}
				}
			}
		}
		if(!isdefined(level.var_d776839c))
		{
			level.var_d776839c = 1000;
		}
		if(!isdefined(level.var_d453a2ed))
		{
			level.var_d453a2ed = 1;
		}
		if(!isdefined(level.var_cc480293))
		{
			level.var_cc480293 = &function_cffffa44;
		}
		level function_8115371();
	}
}

/*
	Name: on_player_connect
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x15B0
	Size: 0x20
	Parameters: 0
	Flags: Private
	Line Number: 286
*/
function private on_player_connect()
{
	level thread function_d83737d3();
}

/*
	Name: on_player_disconnect
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x15D8
	Size: 0x20
	Parameters: 0
	Flags: Private
	Line Number: 301
*/
function private on_player_disconnect()
{
	level thread function_d83737d3();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: setup_devgui
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1600
	Size: 0x258
	Parameters: 0
	Flags: Private
	Line Number: 318
*/
function private setup_devgui()
{
	/#
		waittillframeend;
		SetDvar("Dev Block strings are not supported", 0);
		SetDvar("Dev Block strings are not supported", 0);
		SetDvar("Dev Block strings are not supported", "Dev Block strings are not supported");
		SetDvar("Dev Block strings are not supported", 0);
		SetDvar("Dev Block strings are not supported", 0);
		var_33b4e7c1 = "Dev Block strings are not supported";
		AddDebugCommand(var_33b4e7c1 + "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported");
		keys = getArrayKeys(level.bgb);
		for(i = 0; i < keys.size; i++)
		{
			AddDebugCommand(var_33b4e7c1 + "Dev Block strings are not supported" + keys[i] + "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported" + keys[i] + "Dev Block strings are not supported");
		}
		AddDebugCommand(var_33b4e7c1 + "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported");
		AddDebugCommand(var_33b4e7c1 + "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported");
		AddDebugCommand(var_33b4e7c1 + "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported");
		AddDebugCommand(var_33b4e7c1 + "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported");
		level thread function_95dc1528();
	#/
}

/*
	Name: function_95dc1528
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1860
	Size: 0x3A8
	Parameters: 0
	Flags: Private
	Line Number: 352
*/
function private function_95dc1528()
{
	/#
		for(;;)
		{
			ARRIVE = GetDvarInt("Dev Block strings are not supported");
			move = GetDvarInt("Dev Block strings are not supported");
			if(move || ARRIVE)
			{
				pos = level.players[0].origin;
				var_7ee3aad9 = 999999999;
				best_index = -1;
				for(i = 0; i < level.bgb_machines.size; i++)
				{
					var_7f58a9c3 = DistanceSquared(pos, level.bgb_machines[i].origin);
					if(var_7f58a9c3 < var_7ee3aad9)
					{
						best_index = i;
						var_7ee3aad9 = var_7f58a9c3;
					}
				}
				if(0 <= best_index)
				{
					if(ARRIVE)
					{
						if(!level.bgb_machines[best_index].var_4d6e7e5e)
						{
							for(i = 0; i < level.bgb_machines.size; i++)
							{
								if(level.bgb_machines[i].var_4d6e7e5e)
								{
									level.bgb_machines[i] thread function_3f75d3b();
									break;
								}
							}
							level.bgb_machines[best_index].var_4d6e7e5e = 1;
							level.bgb_machines[best_index] thread function_13565590();
						}
					}
					else
					{
						level.bgb_machines[best_index] thread function_872660fc();
					}
				}
				SetDvar("Dev Block strings are not supported", 0);
				SetDvar("Dev Block strings are not supported", 0);
			}
			var_113a43ca = GetDvarString("Dev Block strings are not supported");
			if(GetDvarInt("Dev Block strings are not supported") || "Dev Block strings are not supported" != var_113a43ca)
			{
				for(i = 0; i < level.players.size; i++)
				{
					level.players[i].var_85da8a33 = 0;
					level.players[i] clientfield::set_to_player("Dev Block strings are not supported", level.players[i].var_85da8a33);
				}
				SetDvar("Dev Block strings are not supported", 0);
			}
			if("Dev Block strings are not supported" != var_113a43ca)
			{
				level.var_fcfc78d0 = var_113a43ca;
				SetDvar("Dev Block strings are not supported", "Dev Block strings are not supported");
			}
			wait(0.5);
		}
	#/
}

/*
	Name: function_8115371
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1C10
	Size: 0x180
	Parameters: 0
	Flags: Private
	Line Number: 429
*/
function private function_8115371()
{
	function_6e4ac5cf();
	if(isdefined(level.bgb_machines) && IsArray(level.bgb_machines))
	{
		level.bgb_machines = ArrayCombine(level.bgb_machines, GetEntArray("bgb_machine_fix_zbarrier", "script_noteworthy"), 0, 0);
		level.bgb_machines = ArrayCombine(level.bgb_machines, GetEntArray("bgb_machine_use", "targetname"), 0, 0);
	}
	else
	{
		level.bgb_machines = [];
		level.bgb_machines = ArrayCombine(level.bgb_machines, GetEntArray("bgb_machine_fix_zbarrier", "script_noteworthy"), 0, 0);
		level.bgb_machines = ArrayCombine(level.bgb_machines, GetEntArray("bgb_machine_use", "targetname"), 0, 0);
	}
	function_62051f89();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_62051f89
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1D98
	Size: 0x1F8
	Parameters: 0
	Flags: Private
	Line Number: 458
*/
function private function_62051f89()
{
	if(!level.bgb_machines.size)
	{
		return;
	}
	for(i = 0; i < level.bgb_machines.size; i++)
	{
		if(!isdefined(level.bgb_machines[i].base_cost))
		{
			level.bgb_machines[i].base_cost = 500;
		}
		level.bgb_machines[i].old_cost = level.bgb_machines[i].base_cost;
		level.bgb_machines[i].var_4d6e7e5e = 0;
		level.bgb_machines[i].uses_at_current_location = 0;
		level.bgb_machines[i] function_561f90cb("leaving");
	}
	if(GetDvarInt("tfoption_bgb"))
	{
		return;
	}
	if(!level.enable_magic)
	{
		foreach(bgb_machine in level.bgb_machines)
		{
			bgb_machine thread function_3f75d3b();
		}
		return;
	}
	level.bgb_machines = Array::randomize(level.bgb_machines);
	level thread function_9ddf3c0d();
}

/*
	Name: function_9ddf3c0d
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1F98
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 501
*/
function function_9ddf3c0d()
{
	level flag::wait_till("all_players_connected");
	while(level.round_number < GetDvarInt("aaeoption_bgb_start"))
	{
		level waittill("start_of_round");
	}
	if(GetDvarInt("tfoption_pregum"))
	{
		for(i = 0; i < level.bgb_machines.size; i++)
		{
			level.bgb_machines[i] function_c4ed49b();
		}
		function_a5bbc4ee();
		Array::thread_all(level.bgb_machines, &function_d9f9a9c1);
	}
	else if(level.script == "zm_island")
	{
		thread function_d174b225();
	}
	else
	{
		thread function_cad61199();
		thread function_a1001873();
	}
}

/*
	Name: function_d174b225
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x20F8
	Size: 0x140
	Parameters: 0
	Flags: Private
	Line Number: 538
*/
function private function_d174b225()
{
	for(i = 0; i < level.bgb_machines.size; i++)
	{
		if(!isdefined(level.bgb_machines[i].var_87dbeb74))
		{
			level.bgb_machines[i] function_c4ed49b();
			level.bgb_machines[i] function_561f90cb("initial");
			level.bgb_machines[i].hidden = 0;
			level.bgb_machines[i].var_4d6e7e5e = 1;
			level.bgb_machines[i] thread function_d9f9a9c1();
			if(level.bgb_machines[i].origin == (-2028.84, 1000.14, 120))
			{
				level.bgb_machines[i].var_479ae6f = 1;
			}
		}
	}
	return;
}

/*
	Name: function_a1001873
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2240
	Size: 0x110
	Parameters: 0
	Flags: Private
	Line Number: 568
*/
function private function_a1001873()
{
	for(i = 0; i < level.bgb_machines.size; i++)
	{
		if(isdefined(level.bgb_machines[i].var_87dbeb74))
		{
			level.bgb_machines[i] function_c4ed49b();
			level.bgb_machines[i] function_561f90cb("arriving");
			level.bgb_machines[i].hidden = 0;
			level.bgb_machines[i].var_4d6e7e5e = 1;
			level.bgb_machines[i] thread function_d9f9a9c1();
			level.bgb_machines[i].targetname = "aae_gummachines";
		}
	}
	return;
}

/*
	Name: function_a4d0aa8d
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2358
	Size: 0x230
	Parameters: 0
	Flags: Private
	Line Number: 595
*/
function private function_a4d0aa8d()
{
	if(!isdefined(level.bgb_machines) || (isdefined(level.bgb_machines) && level.bgb_machines.size == 0))
	{
		return 0;
	}
	level flag::wait_till("all_players_connected");
	var_57a93e61 = [];
	foreach(player in GetPlayers())
	{
		if(isdefined(player.origin))
		{
			var_435427ea = ArraySort(level.bgb_machines, player.origin);
			if(isdefined(var_435427ea) && var_435427ea.size != 0)
			{
				var_57a93e61[var_57a93e61.size] = Distance(var_435427ea[0].origin, player.origin);
			}
		}
	}
	if(var_57a93e61.size != 0)
	{
		dis = var_57a93e61[0];
		for(i = 0; i < var_57a93e61.size; i++)
		{
			if(var_57a93e61[i] < dis)
			{
				dis = var_57a93e61[i];
			}
		}
		var_1b05b2ba = dis / 190;
		delay_time = var_1b05b2ba - 6.36;
		if(delay_time < 0)
		{
			return 0;
		}
		return delay_time;
	}
	return 0;
}

/*
	Name: function_cad61199
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2590
	Size: 0x110
	Parameters: 0
	Flags: Private
	Line Number: 645
*/
function private function_cad61199()
{
	for(i = 0; i < level.bgb_machines.size; i++)
	{
		if(!isdefined(level.bgb_machines[i].var_87dbeb74))
		{
			level.bgb_machines[i] function_c4ed49b();
			level.bgb_machines[i] function_561f90cb("arriving");
			level.bgb_machines[i].targetname = "bgb_machine_use";
			level.bgb_machines[i].hidden = 0;
			level.bgb_machines[i].var_4d6e7e5e = 1;
			level.bgb_machines[i] thread function_d9f9a9c1();
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_a5bbc4ee
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x26A8
	Size: 0x260
	Parameters: 0
	Flags: Private
	Line Number: 673
*/
function private function_a5bbc4ee()
{
	level.var_d776839c = Int(level.bgb_machines.size * 0.375);
	if(!level.var_d776839c)
	{
		level.var_d776839c = 1;
	}
	var_ed3848d8 = 0;
	var_ff664010 = [];
	for(i = 0; i < level.bgb_machines.size; i++)
	{
		level.bgb_machines[i] clientfield::set("zm_bgb_machine", 1);
		if(var_ed3848d8 >= level.var_d776839c || !isdefined(level.bgb_machines[i].script_noteworthy) || !IsSubStr(level.bgb_machines[i].script_noteworthy, "start_bgb_machine"))
		{
			var_ff664010[var_ff664010.size] = level.bgb_machines[i];
			continue;
		}
		level.bgb_machines[i].hidden = 0;
		level.bgb_machines[i].var_4d6e7e5e = 1;
		level.bgb_machines[i] function_561f90cb("initial");
		var_ed3848d8++;
	}
	for(i = 0; i < var_ff664010.size; i++)
	{
		if(var_ed3848d8 >= level.var_d776839c)
		{
			var_ff664010[i] thread function_3f75d3b();
			continue;
		}
		var_ff664010[i].hidden = 0;
		var_ff664010[i].var_4d6e7e5e = 1;
		var_ff664010[i] function_561f90cb("initial");
		var_ed3848d8++;
	}
}

/*
	Name: function_c4ed49b
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2910
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 719
*/
function function_c4ed49b()
{
	self.unitrigger_stub = spawnstruct();
	self.unitrigger_stub.script_width = 30;
	self.unitrigger_stub.script_height = 70;
	self.unitrigger_stub.script_length = 25;
	self.unitrigger_stub.origin = self.origin + AnglesToRight(self.angles) * self.unitrigger_stub.script_length + anglesToUp(self.angles) * self.unitrigger_stub.script_height / 2;
	self.unitrigger_stub.angles = self.angles;
	self.unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	self.unitrigger_stub.trigger_target = self;
	zm_unitrigger::unitrigger_force_per_player_triggers(self.unitrigger_stub, 1);
	self.unitrigger_stub.prompt_and_visibility_func = &function_30e4012c;
}

/*
	Name: function_30e4012c
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2A60
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 743
*/
function function_30e4012c(player)
{
	can_use = self function_ec0482ba(player);
	if(isdefined(self.hint_string))
	{
		if(isdefined(self.hint_parm1))
		{
			self setHintString(self.hint_string, self.hint_parm1);
		}
		else
		{
			self setHintString(self.hint_string);
		}
	}
	return can_use;
}

/*
	Name: function_6c7a96b4
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2AF8
	Size: 0x3E0
	Parameters: 2
	Flags: None
	Line Number: 770
*/
function function_6c7a96b4(player, base_cost)
{
	if(GetDvarInt("tfoption_pregum"))
	{
		return function_d3ca0a2f();
	}
	if(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver"))
	{
		if(GetDvarInt("tfoption_fixed_cost"))
		{
			if(GetDvarInt("scr_firstgumfree") && !GetDvarInt("tfoption_bgb_cost"))
			{
				return 0;
			}
			else
			{
				return function_d3ca0a2f();
			}
		}
		else if(player.var_85da8a33 < 1)
		{
			if(GetDvarInt("scr_firstgumfree") && !GetDvarInt("tfoption_bgb_cost"))
			{
				return 0;
			}
			else
			{
				return function_d3ca0a2f();
			}
		}
	}
	else if(player.var_85da8a33 < 1 && GetDvarInt("scr_firstGumFree") === 1)
	{
		return 0;
	}
	if(GetDvarInt("tfoption_bgb_cost") == 2 || GetDvarInt("tfoption_bgb_cost") == 3 || GetDvarInt("tfoption_bgb_cost") == 4)
	{
		base_cost = function_d3ca0a2f();
	}
	if(!isdefined(level.var_f02c5598))
	{
		level.var_f02c5598 = 1000;
	}
	if(!isdefined(level.var_e1dee7ba))
	{
		level.var_e1dee7ba = 10;
	}
	if(!isdefined(level.var_1485dcdc))
	{
		level.var_1485dcdc = 2;
	}
	cost = function_d3ca0a2f();
	if(player.var_85da8a33 >= 1)
	{
		var_33ea806b = floor(level.round_number / level.var_e1dee7ba);
		var_33ea806b = math::clamp(var_33ea806b, 0, level.var_8ef45dc2);
		var_39a90c5a = pow(level.var_a3e3127d, var_33ea806b);
		cost = cost + level.var_f02c5598 * var_39a90c5a;
	}
	if(player.var_85da8a33 >= 2)
	{
		cost = cost * level.var_1485dcdc;
	}
	cost = Int(cost);
	if(function_d3ca0a2f() != base_cost)
	{
		cost = cost - function_d3ca0a2f() - base_cost;
	}
	return cost;
}

/*
	Name: function_d3ca0a2f
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2EE0
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 851
*/
function function_d3ca0a2f()
{
	cost = 500;
	if(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver") && GetDvarString("tfoption_bgb_cost") != "0")
	{
		switch(GetDvarInt("tfoption_bgb_cost"))
		{
			case 0:
			{
				cost = 500;
				break;
			}
			case 1:
			{
				cost = 500;
				break;
			}
			case 2:
			{
				cost = 1000;
				break;
			}
			case 3:
			{
				cost = 1500;
				break;
			}
			case 4:
			{
				cost = 2000;
				break;
			}
			case 5:
			{
				if(GetDvarInt("tfoption_pregum"))
				{
					cost = 0;
				}
				else
				{
					cost = 500;
					break;
				}
			}
			default
			{
				cost = 500;
				break;
			}
		}
	}
	return cost;
}

/*
	Name: function_ec0482ba
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x3078
	Size: 0x248
	Parameters: 1
	Flags: None
	Line Number: 915
*/
function function_ec0482ba(player)
{
	b_result = 0;
	if(!self trigger_visible_to_player(player))
	{
		return b_result;
	}
	self.hint_parm1 = undefined;
	if(isdefined(self.stub.trigger_target.var_a2b01d1d) && self.stub.trigger_target.var_a2b01d1d)
	{
		if(!(isdefined(self.stub.trigger_target.var_16d95df4) && self.stub.trigger_target.var_16d95df4))
		{
			str_hint = &"ZOMBIE_BGB_MACHINE_OUT_OF";
			b_result = 0;
		}
		else
		{
			str_hint = &"ZOMBIE_BGB_MACHINE_OFFERING";
			b_result = 1;
		}
		cursor_hint = "HINT_BGB";
		var_562e3c5 = level.bgb[self.stub.trigger_target.var_b287be].item_index;
		self setcursorhint(cursor_hint, var_562e3c5);
		self.hint_string = str_hint;
	}
	else
	{
		self setcursorhint("HINT_NOICON");
		if(player.var_85da8a33 < level.var_6cb6a683)
		{
			if(isdefined(level.var_42792b8b) && level.var_42792b8b)
			{
				self.hint_string = &"ZOMBIE_BGB_MACHINE_AVAILABLE_CFILL";
			}
			else
			{
				self.hint_string = &"ZOMBIE_BGB_MACHINE_AVAILABLE";
				self.hint_parm1 = function_6c7a96b4(player, self.stub.trigger_target.base_cost);
			}
			b_result = 1;
		}
		else
		{
			self.hint_string = &"ZOMBIE_BGB_MACHINE_COMEBACK";
			b_result = 0;
		}
	}
	return b_result;
}

/*
	Name: trigger_visible_to_player
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x32C8
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 975
*/
function trigger_visible_to_player(player)
{
	self setinvisibletoplayer(player);
	visible = 1;
	if(!player function_4883a82b())
	{
		visible = 0;
	}
	if(!visible)
	{
		return 0;
	}
	if(isdefined(self.stub.trigger_target.var_492b876) && player !== self.stub.trigger_target.var_492b876)
	{
		return 0;
	}
	self setvisibletoplayer(player);
	return 1;
}

/*
	Name: function_4883a82b
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x3390
	Size: 0x40
	Parameters: 0
	Flags: Private
	Line Number: 1005
*/
function private function_4883a82b()
{
	if(self zm_equipment::hacker_active())
	{
		return 0;
	}
	if(self zm_utility::in_revive_trigger())
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_a4f9891b
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x33D8
	Size: 0xD8
	Parameters: 0
	Flags: Private
	Line Number: 1028
*/
function private function_a4f9891b()
{
	if(isdefined(self.IS_DRINKING) && self.IS_DRINKING > 0)
	{
		return 0;
	}
	current_weapon = self GetCurrentWeapon();
	if(zm_utility::is_placeable_mine(current_weapon) || zm_equipment::is_equipment(current_weapon))
	{
		return 0;
	}
	if(self zm_utility::is_player_revive_tool(current_weapon))
	{
		return 0;
	}
	if(current_weapon == level.weaponNone)
	{
		return 0;
	}
	if(current_weapon.isHeroWeapon || current_weapon.isgadget)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_ededc488
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x34B8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1064
*/
function function_ededc488()
{
	self endon("kill_trigger");
	while(1)
	{
		self waittill("trigger", player);
		self.stub.trigger_target notify("trigger", player);
	}
}

/*
	Name: function_13565590
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x3518
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 1084
*/
function function_13565590()
{
	self function_561f90cb("arriving");
	self waittill("arrived");
	self.hidden = 0;
	return;
	~self.hidden;
}

/*
	Name: function_3f75d3b
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x3560
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 1103
*/
function function_3f75d3b(var_4600cfd0)
{
	self thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
	self.hidden = 1;
	self.uses_at_current_location = 0;
	self.var_4d6e7e5e = 0;
	if(isdefined(var_4600cfd0) && var_4600cfd0)
	{
		self thread function_561f90cb("leaving");
	}
	else
	{
		self thread function_561f90cb("away");
	}
}

/*
	Name: function_5bd3a49b
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x3608
	Size: 0x570
	Parameters: 1
	Flags: Private
	Line Number: 1129
*/
function private function_5bd3a49b(player)
{
	if(GetDvarString("tfoption_bgb_loadout") == "1")
	{
		keys = Array::randomize(getArrayKeys(level.bgb));
		if(zm_utility::is_solo_ranked_game())
		{
			ArrayRemoveValue(keys, "zm_bgb_now_you_see_me");
			ArrayRemoveValue(keys, "zm_bgb_aftertaste");
			ArrayRemoveValue(keys, "zm_bgb_phoenix_up");
		}
		if(GetDvarInt("tfoption_gungame"))
		{
			ArrayRemoveValue(keys, "zm_bgb_disorderly_combat");
			ArrayRemoveValue(keys, "zm_bgb_extra_credit");
			ArrayRemoveValue(keys, "zm_bgb_profit_sharing");
			ArrayRemoveValue(keys, "zm_bgb_reign_drops");
			ArrayRemoveValue(keys, "zm_bgb_round_robbin");
			ArrayRemoveValue(keys, "zm_bgb_whos_keeping_score");
			ArrayRemoveValue(keys, "zm_bgb_power_vacuum");
			ArrayRemoveValue(keys, "zm_bgb_cache_back");
		}
		self.var_b287be = keys[0];
	}
	else if(GetDvarInt("tfoption_gungame"))
	{
		for(i = 0; i < player.var_98ba48a2.size; i++)
		{
			if(player.var_98ba48a2[i] == "zm_bgb_disorderly_combat" || player.var_98ba48a2[i] == "zm_bgb_extra_credit" || player.var_98ba48a2[i] == "zm_bgb_profit_sharing" || player.var_98ba48a2[i] == "zm_bgb_round_robbin" || player.var_98ba48a2[i] == "zm_bgb_whos_keeping_score" || player.var_98ba48a2[i] == "zm_bgb_power_vacuum" || player.var_98ba48a2[i] == "zm_bgb_cache_back")
			{
				player.var_98ba48a2[i] = "zm_bgb_flavor_hexed";
			}
		}
	}
	else if(!player.var_8414308a.size)
	{
		player.var_8414308a = Array::randomize(player.var_98ba48a2);
	}
	self.var_b287be = Array::pop_front(player.var_8414308a);
	/#
		if(isdefined(level.var_fcfc78d0))
		{
			self.var_b287be = level.var_fcfc78d0;
			level.var_fcfc78d0 = undefined;
			if("Dev Block strings are not supported" == self.var_b287be)
			{
				keys = Array::randomize(getArrayKeys(level.bgb));
				for(i = 0; i < keys.size; i++)
				{
					if(level.bgb[keys[i]].var_e0715b48)
					{
						self.var_b287be = keys[i];
						break;
					}
				}
				clientfield::set("Dev Block strings are not supported", level.bgb[self.var_b287be].item_index);
				return 0;
			}
		}
	#/
	if(isdefined(self.var_479ae6f) && level flag::get("trilogy_released"))
	{
		self.var_479ae6f = undefined;
		util::setClientSysState("aae_soulcounter", "&AAE_TIP_FREEGUM_TITLE");
		self.var_b287be = "zm_bgb_anywhere_but_here";
	}
	clientfield::set("zm_bgb_machine_selection", level.bgb[self.var_b287be].item_index);
	return player bgb::function_f59fbff(self.var_b287be);
}

/*
	Name: function_d9f9a9c1
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x3B80
	Size: 0xB28
	Parameters: 0
	Flags: None
	Line Number: 1209
*/
function function_d9f9a9c1()
{
	var_9bbdff4d = -1;
	while(1)
	{
		var_5e7af4df = undefined;
		self waittill("trigger", User);
		var_9bbdff4d = -1;
		if(isdefined(User.bgb) && isdefined(level.bgb[User.bgb]))
		{
			var_9bbdff4d = level.bgb[User.bgb].item_index;
		}
		var_5e7af4df = GetTime();
		if(User == level)
		{
			continue;
		}
		if(User zm_utility::in_revive_trigger())
		{
			wait(0.1);
			continue;
		}
		if(isdefined(self.disabled) && self.disabled)
		{
			wait(0.1);
			continue;
		}
		var_625e97d1 = 0;
		cost = function_6c7a96b4(User, self.base_cost);
		if(zm_utility::is_player_valid(User, 0, 1) && User zm_score::can_player_purchase(cost))
		{
			User zm_score::minus_to_player_score(cost);
			User namespace_3d0867a6::function_18df83fb("point_out");
			self.var_492b876 = User;
			self.current_cost = cost;
			if(User bgb::is_enabled("zm_bgb_shopping_free"))
			{
				var_625e97d1 = 1;
				break;
			}
		}
		else
		{
			zm_utility::play_sound_at_pos("no_purchase", self.origin);
			User zm_audio::create_and_play_dialog("general", "outofmoney");
			continue;
		}
		wait(0.05);
	}
	if(isdefined(level.var_5912cc2e))
	{
		User thread [[level.var_5912cc2e]]();
	}
	User.var_85da8a33++;
	User clientfield::set_to_player("zm_bgb_machine_round_buys", User.var_85da8a33);
	self.var_492b876 = User;
	self.var_bc4509eb = 1;
	self.var_a23dc60f = 0;
	if(isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]) && level.zombie_vars["zombie_powerup_fire_sale_on"])
	{
		self.var_a23dc60f = 1;
	}
	else
	{
		self.uses_at_current_location++;
	}
	self.var_16d95df4 = self function_5bd3a49b(User);
	self thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
	if(isdefined(self.var_87dbeb74))
	{
		self HidePart("tag_gumballs", "p7_zm_zod_bubblegum_machine_gumballs_flying", 1);
		self HidePart("tag_gumballs", "p7_zm_zod_bubblegum_machine_lion_head_gumball", 1);
		var_98ba48a2 = [];
		var_98ba48a2[0] = self.var_b287be;
		foreach(var_fc94c78e in User.var_98ba48a2)
		{
			var_98ba48a2[var_98ba48a2.size] = var_fc94c78e;
		}
		for(i = 0; i < var_98ba48a2.size; i++)
		{
			self ShowPart(level.bgb[var_98ba48a2[i]].var_d3c80142 + "_" + i, "p7_zm_zod_bubblegum_machine_gumballs_flying", 0);
		}
		level util::clientNotify("bgb_buy" + self GetEntityNumber());
		self AnimScripted("p7_fxanim_zm_zod_bgb_machine_gumballs_flying_01_anim", self.origin, self.angles, "p7_fxanim_zm_zod_bgb_machine_gumballs_flying_01_anim");
		wait(getanimlength("p7_fxanim_zm_zod_bgb_machine_gumballs_flying_01_anim"));
	}
	self function_561f90cb("open");
	if(isdefined(self.var_87dbeb74))
	{
		self HidePart("tag_gumballs", "p7_zm_zod_bubblegum_machine_gumballs_flying", 1);
		self HidePart("tag_gumballs", "p7_zm_zod_bubblegum_machine_lion_head_gumball", 1);
		var_fd4e8173 = level.bgb[self.var_b287be].var_ece14434;
		if(isdefined(var_fd4e8173))
		{
			self ShowPart(var_fd4e8173, "p7_zm_zod_bubblegum_machine_lion_head_gumball", 0);
		}
		else
		{
			self ShowPart("tag_gumball_ghost", "p7_zm_zod_bubblegum_machine_lion_head_gumball", 0);
		}
		self AnimScripted("p7_fxanim_zm_zod_bgb_machine_lion_head_gumball_leave_anim", self.origin, self.angles, "p7_fxanim_zm_zod_bgb_machine_lion_head_gumball_leave_anim");
	}
	self waittill("hash_c5d46831");
	self.var_a2b01d1d = 1;
	self thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &function_ededc488);
	var_2c6b4c12 = 0;
	var_88ccefee = 0;
	var_8a2037cd = 0;
	if(self.var_16d95df4)
	{
		if(isdefined(level.bgb[self.var_b287be]))
		{
			var_88ccefee = level.bgb[self.var_b287be].item_index;
		}
		while(1)
		{
			self waittill("trigger", grabber);
			if(grabber == User || grabber == level || grabber == self)
			{
				current_weapon = level.weaponNone;
				if(zm_utility::is_player_valid(User))
				{
					current_weapon = User GetCurrentWeapon();
				}
				if(grabber == User && zm_utility::is_player_valid(User, 0, 1))
				{
					self notify("hash_69873c12");
					User notify("hash_69873c12");
					User bgb::function_66a597c1(self.var_b287be);
					var_2c6b4c12 = 1;
					User thread bgb::bgb_gumball_anim(self.var_b287be, 0, User function_a4f9891b());
					if(isdefined(level.var_361ee139))
					{
						User thread [[level.var_361ee139]](self);
						break;
					}
				}
				else if(grabber == level || grabber == self)
				{
					break;
				}
			}
			wait(0.05);
		}
		self thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
		if(grabber === level)
		{
			while(self GetZBarrierPieceState(2) == "opening")
			{
				wait(0.05);
			}
		}
		else
		{
			self function_561f90cb("close");
			if(isdefined(self.var_87dbeb74))
			{
				level util::clientNotify("bgb_take" + self GetEntityNumber());
				self AnimScripted("p7_fxanim_zm_zod_bgb_machine_lion_head_gumball_take_anim", self.origin, self.angles, "p7_fxanim_zm_zod_bgb_machine_lion_head_gumball_take_anim");
				wait(getanimlength("p7_fxanim_zm_zod_bgb_machine_lion_head_gumball_take_anim"));
			}
			else
			{
				self waittill("closed");
			}
		}
	}
	else
	{
		self waittill("trigger");
		if(!var_625e97d1)
		{
			User zm_score::add_to_player_score(self.current_cost, 0, "bgb_machine_ghost_ball");
		}
		var_8a2037cd = 1;
		self thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
	}
	self.var_a2b01d1d = 0;
	wait(1);
	if(function_d8680cd2())
	{
		self thread function_872660fc();
	}
	else if(isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]) && level.zombie_vars["zombie_powerup_fire_sale_on"] || self.var_4d6e7e5e)
	{
		self thread function_561f90cb("initial");
	}
	self.var_bc4509eb = 0;
	self.var_a23dc60f = 0;
	self.var_492b876 = undefined;
	self notify("hash_62124c1e");
	self thread function_d9f9a9c1();
}

/*
	Name: function_d8680cd2
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x46B0
	Size: 0xA8
	Parameters: 0
	Flags: Private
	Line Number: 1413
*/
function private function_d8680cd2()
{
	/#
		if(GetDvarInt("Dev Block strings are not supported"))
		{
			return 0;
		}
	#/
	if(isdefined(level.var_d453a2ed) && level.var_d453a2ed)
	{
		return 0;
	}
	if(self.uses_at_current_location >= level.var_d118bcf4)
	{
		return 1;
	}
	if(self.uses_at_current_location < level.var_82f744de)
	{
		return 0;
	}
	if(RandomInt(100) < 30)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_d83737d3
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x4760
	Size: 0xD0
	Parameters: 0
	Flags: Private
	Line Number: 1450
*/
function private function_d83737d3()
{
	if(isdefined(level.var_cfc8eddf))
	{
		[[level.var_cfc8eddf]]();
		return;
	}
	switch(level.players.size)
	{
		case 1:
		{
			level.var_82f744de = 1;
			level.var_d118bcf4 = 3;
			break;
		}
		case 2:
		{
			level.var_82f744de = 1;
			level.var_d118bcf4 = 4;
			break;
		}
		case 3:
		{
			level.var_82f744de = 3;
			level.var_d118bcf4 = 5;
			break;
		}
		case 4:
		{
			level.var_82f744de = 3;
			level.var_d118bcf4 = 6;
			break;
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: turn_on_fire_sale
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x4838
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 1498
*/
function turn_on_fire_sale()
{
	for(i = 0; i < level.bgb_machines.size; i++)
	{
		level.bgb_machines[i].old_cost = level.bgb_machines[i].base_cost;
		level.bgb_machines[i].base_cost = 10;
		if(!level.bgb_machines[i].var_4d6e7e5e)
		{
			level.bgb_machines[i].var_7ec446a0 = 1;
			level.bgb_machines[i] thread function_13565590();
		}
	}
}

/*
	Name: turn_off_fire_sale
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x4918
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1522
*/
function turn_off_fire_sale()
{
	for(i = 0; i < level.bgb_machines.size; i++)
	{
		level.bgb_machines[i].base_cost = level.bgb_machines[i].old_cost;
		if(!level.bgb_machines[i].var_4d6e7e5e && (isdefined(level.bgb_machines[i].var_7ec446a0) && level.bgb_machines[i].var_7ec446a0))
		{
			level.bgb_machines[i].var_7ec446a0 = undefined;
			level.bgb_machines[i] thread function_348263ec();
		}
	}
}

/*
	Name: function_348263ec
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x4A10
	Size: 0x88
	Parameters: 0
	Flags: Private
	Line Number: 1545
*/
function private function_348263ec()
{
	while(isdefined(self.var_492b876) || (isdefined(self.var_bc4509eb) && self.var_bc4509eb))
	{
		util::wait_network_frame();
	}
	if(level.zombie_vars["zombie_powerup_fire_sale_on"])
	{
		self.var_7ec446a0 = 1;
		self.base_cost = 10;
		return;
	}
	self thread function_3f75d3b(1);
}

/*
	Name: function_872660fc
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x4AA0
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 1570
*/
function function_872660fc()
{
	self function_3f75d3b(1);
	wait(0.1);
	post_selection_wait_duration = 7;
	if(isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]) && level.zombie_vars["zombie_powerup_fire_sale_on"])
	{
		current_sale_time = level.zombie_vars["zombie_powerup_fire_sale_time"];
		util::wait_network_frame();
		self thread fire_sale_fix();
		level.zombie_vars["zombie_powerup_fire_sale_time"] = current_sale_time;
		while(level.zombie_vars["zombie_powerup_fire_sale_time"] > 0)
		{
			wait(0.1);
		}
	}
	else
	{
		post_selection_wait_duration = post_selection_wait_duration + 5;
	}
	wait(post_selection_wait_duration);
	keys = getArrayKeys(level.bgb_machines);
	keys = Array::randomize(keys);
	for(i = 0; i < keys.size; i++)
	{
		if(self == level.bgb_machines[keys[i]] || level.bgb_machines[keys[i]].var_4d6e7e5e)
		{
			continue;
		}
		level.bgb_machines[keys[i]].var_4d6e7e5e = 1;
		level.bgb_machines[keys[i]] function_13565590();
		break;
	}
	return;
	~level.bgb_machines[keys[i]].var_4d6e7e5e;
}

/*
	Name: fire_sale_fix
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x4CA0
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1617
*/
function fire_sale_fix()
{
	if(!isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]))
	{
		return;
	}
	self.old_cost = self.base_cost;
	self thread function_13565590();
	self.base_cost = 10;
	util::wait_network_frame();
	level waittill("fire_sale_off");
	while(isdefined(self.var_bc4509eb) && self.var_bc4509eb)
	{
		wait(0.1);
	}
	self thread function_3f75d3b(1);
	self.base_cost = self.old_cost;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ca233e7d
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x4D68
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 1648
*/
function function_ca233e7d()
{
	self endon("zbarrier_state_change");
	clientfield::set("zm_bgb_machine_fx_state", 1);
	self SetZBarrierPieceState(0, "closed");
	self SetZBarrierPieceState(5, "closed");
	while(1)
	{
		wait(RandomFloatRange(180, 1800));
		self SetZBarrierPieceState(0, "opening");
		wait(RandomFloatRange(180, 1800));
		self SetZBarrierPieceState(0, "closing");
	}
}

/*
	Name: function_1174bcd9
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x4E58
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1673
*/
function function_1174bcd9()
{
	clientfield::set("zm_bgb_machine_fx_state", 4);
	self SetZBarrierPieceState(2, "open");
	self SetZBarrierPieceState(3, "open");
	self SetZBarrierPieceState(5, "closed");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e7f3a3f5
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x4EE8
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 1693
*/
function function_e7f3a3f5()
{
	self endon("zbarrier_state_change");
	self SetZBarrierPieceState(3, "closed");
	clientfield::set("zm_bgb_machine_fx_state", 2);
	self SetZBarrierPieceState(1, "opening");
	while(self GetZBarrierPieceState(1) == "opening")
	{
		wait(0.05);
	}
	self SetZBarrierPieceState(1, "closing");
	self SetZBarrierPieceState(3, "opening");
	while(self GetZBarrierPieceState(1) == "closing")
	{
		wait(0.05);
	}
	self notify("arrived");
	self thread function_561f90cb("initial");
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_4aa434eb
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x5028
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 1726
*/
function function_4aa434eb()
{
	self endon("zbarrier_state_change");
	self SetZBarrierPieceState(3, "open");
	clientfield::set("zm_bgb_machine_fx_state", 2);
	self SetZBarrierPieceState(1, "opening");
	while(self GetZBarrierPieceState(1) == "opening")
	{
		wait(0.05);
	}
	self SetZBarrierPieceState(1, "closing");
	self SetZBarrierPieceState(3, "closing");
	while(self GetZBarrierPieceState(1) == "closing")
	{
		wait(0.05);
	}
	self notify("left");
	self thread function_561f90cb("away");
}

/*
	Name: function_118970ca
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x5168
	Size: 0x308
	Parameters: 0
	Flags: None
	Line Number: 1756
*/
function function_118970ca()
{
	self endon("zbarrier_state_change");
	self SetZBarrierPieceState(3, "open");
	self SetZBarrierPieceState(5, "closed");
	clientfield::set("zm_bgb_machine_ghost_ball", !self.var_16d95df4);
	state = "opening";
	if(math::cointoss())
	{
		state = "closing";
	}
	self SetZBarrierPieceState(4, state);
	while(self GetZBarrierPieceState(4) == state)
	{
		wait(0.05);
	}
	self SetZBarrierPieceState(2, "opening");
	wait(1);
	clientfield::set("zm_bgb_machine_fx_state", 3);
	self notify("hash_c5d46831");
	if(isdefined(self.var_87dbeb74))
	{
		self thread function_c4003fd2();
	}
	endTime = GetTime() + 5500;
	while(endTime > GetTime())
	{
		if(isdefined(self))
		{
			if(isdefined(self.var_b287be) && isdefined(self.var_492b876))
			{
				if(self.var_492b876 meleeButtonPressed())
				{
					statsTableName = util::getStatsTableName();
					var_cf70582a = tableLookup(statsTableName, 0, level.bgb[self.var_b287be].item_index, 3);
					thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.var_492b876.name, "â¦SUBEVENT_SHAREWPâ¦ â¦" + var_cf70582a + "â¦ â¦SUBEVENT_SHAREWPHEREâ¦â¦SUBEVENT_DOTâ¦");
					self thread function_2b916647(self.var_b287be, self.var_492b876.origin);
					clientfield::set("zm_bgb_machine_fx_state", 4);
					self notify("trigger", self);
					return;
				}
			}
		}
		wait(0.048);
	}
	clientfield::set("zm_bgb_machine_fx_state", 4);
	self notify("trigger", level);
}

/*
	Name: function_2b916647
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x5478
	Size: 0x370
	Parameters: 2
	Flags: None
	Line Number: 1815
*/
function function_2b916647(bgb, origin)
{
	if(isdefined(self.Gumball))
	{
		self.Gumball delete();
	}
	if(isdefined(self.var_7ea509b4))
	{
		self.var_7ea509b4 delete();
	}
	new_origin = origin + AnglesToForward(VectorToAngles(self.origin - origin)) * -50;
	new_origin = (new_origin[0], new_origin[1], origin[2] + 50);
	self.Gumball = spawn("script_model", new_origin);
	self.Gumball endon("death");
	self.Gumball UseWeaponModel(level.var_adfa48c4, "wpn_t7_zmb_bubblegum_view", level.players[0] CalcWeaponOptions(level.bgb[bgb].camo_index, 0, 0));
	self.Gumball SetScale(7);
	self.Gumball clientfield::set("powerup_fx", 2);
	self.var_7ea509b4 = spawn("trigger_radius_use", new_origin, 0, 20, 20);
	self.var_7ea509b4 UseTriggerRequireLookAt();
	self.var_7ea509b4 TriggerIgnoreTeam();
	self.var_7ea509b4 setcursorhint("HINT_BGB", level.bgb[bgb].item_index);
	self.var_7ea509b4 setHintString(&"ZOMBIE_BGB_MACHINE_OFFERING");
	self.var_7ea509b4 playsound("zmb_spawn_powerup");
	self.Gumball thread function_ed0383c3();
	self.Gumball thread function_ea32cdaf(self.var_7ea509b4);
	while(1)
	{
		self.var_7ea509b4 waittill("trigger", player);
		if(zm_utility::is_player_valid(player))
		{
			self.var_7ea509b4 delete();
			player thread bgb::bgb_gumball_anim(bgb, 0, player function_a4f9891b());
			self.Gumball delete();
			return;
		}
	}
}

/*
	Name: function_ed0383c3
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x57F0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 1863
*/
function function_ed0383c3()
{
	self endon("death");
	for(;;)
	{
		waittime = RandomFloatRange(2.5, 5);
		yaw = RandomInt(360);
		if(yaw > 300)
		{
			yaw = 300;
		}
		else if(yaw < 60)
		{
			yaw = 60;
		}
		yaw = self.angles[1] + yaw;
		new_angles = (-60 + RandomInt(120), yaw, -45 + RandomInt(90));
		self RotateTo(new_angles, waittime, waittime * 0.5, waittime * 0.5);
		wait(RandomFloat(waittime - 0.1));
	}
}

/*
	Name: function_ea32cdaf
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x5940
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 1895
*/
function function_ea32cdaf(var_7ea509b4)
{
	self endon("death");
	for(i = 0; i < 20; i++)
	{
		if(i % 2)
		{
			self ghost();
		}
		else
		{
			self show();
		}
		if(i < 7)
		{
			wait(0.5);
			continue;
		}
		if(i < 12)
		{
			wait(0.25);
			continue;
		}
		wait(0.1);
	}
	var_7ea509b4 delete();
	self delete();
	return;
	i++;
}

/*
	Name: function_c4003fd2
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x5A30
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1936
*/
function function_c4003fd2()
{
	self endon("zbarrier_state_change");
	self endon("trigger");
	level util::clientNotify("bgb_give" + self GetEntityNumber());
	while(1)
	{
		self PlaySoundOnTag("zmb_bgb_machine_light_ready", "tag_fx_light_top_jnt");
		wait(0.75);
	}
}

/*
	Name: function_ed2e5150
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x5AB8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1958
*/
function function_ed2e5150()
{
	self endon("zbarrier_state_change");
	self SetZBarrierPieceState(3, "open");
	self SetZBarrierPieceState(5, "closed");
	clientfield::set("zm_bgb_machine_fx_state", 4);
	self SetZBarrierPieceState(2, "closing");
	while(self GetZBarrierPieceState(2) == "closing")
	{
		wait(0.05);
	}
	self notify("closed");
	return;
}

/*
	Name: function_b56ef180
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x5B90
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1983
*/
function function_b56ef180()
{
	curr_state = self function_8ae729a7();
	if(curr_state == "open" || curr_state == "close")
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_8ae729a7
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x5BE8
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 2003
*/
function function_8ae729a7()
{
	return self.state;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_561f90cb
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x5C00
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 2019
*/
function function_561f90cb(state)
{
	for(i = 0; i < self getnumzbarrierpieces(); i++)
	{
		self hidezbarrierpiece(i);
	}
	self notify("zbarrier_state_change");
	self [[level.var_cc480293]](state);
}

/*
	Name: function_415e922b
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x5C88
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 2039
*/
function function_415e922b(state)
{
	for(i = 0; i < self getnumzbarrierpieces(); i++)
	{
		self hidezbarrierpiece(i);
	}
	self notify("zbarrier_state_change");
	self [[level.var_cc480293]](state);
}

/*
	Name: function_cffffa44
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x5D10
	Size: 0x340
	Parameters: 1
	Flags: None
	Line Number: 2059
*/
function function_cffffa44(state)
{
	switch(state)
	{
		case "away":
		{
			self ShowZBarrierPiece(0);
			self ShowZBarrierPiece(5);
			self thread function_ca233e7d();
			self.state = "away";
			break;
		}
		case "arriving":
		{
			self ShowZBarrierPiece(1);
			self ShowZBarrierPiece(3);
			self thread function_e7f3a3f5();
			self.state = "arriving";
			break;
		}
		case "initial":
		{
			self ShowZBarrierPiece(2);
			self ShowZBarrierPiece(3);
			self ShowZBarrierPiece(5);
			self thread function_1174bcd9();
			self thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &function_ededc488);
			self.state = "initial";
			break;
		}
		case "open":
		{
			self ShowZBarrierPiece(2);
			self ShowZBarrierPiece(3);
			self ShowZBarrierPiece(4);
			self ShowZBarrierPiece(5);
			self thread function_118970ca();
			self.state = "open";
			break;
		}
		case "close":
		{
			self ShowZBarrierPiece(2);
			self ShowZBarrierPiece(3);
			self ShowZBarrierPiece(5);
			self thread function_ed2e5150();
			self.state = "close";
			break;
		}
		case "leaving":
		{
			self ShowZBarrierPiece(1);
			self ShowZBarrierPiece(3);
			self thread function_4aa434eb();
			self.state = "leaving";
			break;
		}
		default
		{
			if(isdefined(level.var_50c3449d))
			{
				self [[level.var_50c3449d]](state);
				break;
			}
		}
	}
}

/*
	Name: function_4fb7632c
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x6058
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 2137
*/
function function_4fb7632c()
{
	level endon("end_game");
	level notify("hash_4fb7632c");
	level endon("hash_4fb7632c");
	while(1)
	{
		level waittill("host_migration_end");
		if(!isdefined(level.bgb_machines))
		{
			continue;
		}
		foreach(bgb_machine in level.bgb_machines)
		{
			util::wait_network_frame();
		}
	}
}

/*
	Name: function_acf1c4da
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x6138
	Size: 0xC
	Parameters: 1
	Flags: None
	Line Number: 2166
*/
function function_acf1c4da(machine)
{
}

