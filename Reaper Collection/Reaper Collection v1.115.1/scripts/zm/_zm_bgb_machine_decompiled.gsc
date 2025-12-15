#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\zmsavedata;

#namespace bgb_machine;

/*
	Name: __init__sytem__
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x5A0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 33
*/
function autoexec __init__sytem__()
{
	system::register("bgb_machine", &__init__, &__main__, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x5E8
	Size: 0x180
	Parameters: 0
	Flags: Private
	Line Number: 50
*/
function private __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	callback::on_connect(&on_player_connect);
	callback::on_disconnect(&on_player_disconnect);
	clientfield::register("zbarrier", "zm_bgb_machine", 1, 1, "int");
	clientfield::register("zbarrier", "zm_bgb_machine_selection", 1, 8, "int");
	clientfield::register("zbarrier", "zm_bgb_machine_fx_state", 1, 3, "int");
	clientfield::register("zbarrier", "zm_bgb_machine_ghost_ball", 1, 1, "int");
	clientfield::register("toplayer", "zm_bgb_machine_round_buys", 10000, 3, "int");
	level thread function_4fb7632c();
	if(!isdefined(level.var_42792b8b))
	{
		level.var_42792b8b = 0;
	}
}

/*
	Name: __main__
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x770
	Size: 0x130
	Parameters: 0
	Flags: Private
	Line Number: 80
*/
function private __main__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	if(!isdefined(level.var_6cb6a683))
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
	/#
		level thread setup_devgui();
	#/
	level thread function_8115371();
	return;
}

/*
	Name: on_player_connect
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x8A8
	Size: 0x38
	Parameters: 0
	Flags: Private
	Line Number: 139
*/
function private on_player_connect()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	level thread function_d83737d3();
}

/*
	Name: on_player_disconnect
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x8E8
	Size: 0x38
	Parameters: 0
	Flags: Private
	Line Number: 158
*/
function private on_player_disconnect()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	level thread function_d83737d3();
}

/*
	Name: setup_devgui
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x928
	Size: 0x8
	Parameters: 0
	Flags: Private
	Line Number: 177
*/
function private setup_devgui()
{
}

/*
	Name: function_95dc1528
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x938
	Size: 0x8
	Parameters: 0
	Flags: Private
	Line Number: 191
*/
function private function_95dc1528()
{
}

/*
	Name: function_8115371
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x948
	Size: 0xB8
	Parameters: 0
	Flags: Private
	Line Number: 205
*/
function private function_8115371()
{
	wait(0.05);
	var_393242b8 = GetEntArray("bgb_machine_fix_zbarrier", "script_noteworthy");
	for(i = 0; i < var_393242b8.size; i++)
	{
		var_393242b8[i].targetname = "bgb_machine_use";
	}
	level.bgb_machines = GetEntArray("bgb_machine_use", "targetname");
	function_62051f89();
}

/*
	Name: function_a9d07b71
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0xA08
	Size: 0x78
	Parameters: 0
	Flags: Private
	Line Number: 227
*/
function private function_a9d07b71()
{
	var_393242b8 = GetEntArray("bgb_machine_fix_zbarrier", "targetname");
	for(i = 0; i < var_393242b8.size; i++)
	{
		var_393242b8[i].targetname = "bgb_machine_use";
	}
}

/*
	Name: function_62051f89
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0xA88
	Size: 0x1F8
	Parameters: 0
	Flags: Private
	Line Number: 246
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
		level.bgb_machines[i] function_c4ed49b();
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
	function_a5bbc4ee();
	Array::thread_all(level.bgb_machines, &function_d9f9a9c1);
}

/*
	Name: function_a5bbc4ee
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0xC88
	Size: 0x218
	Parameters: 0
	Flags: Private
	Line Number: 286
*/
function private function_a5bbc4ee()
{
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
	Offset: 0xEA8
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 327
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
	Offset: 0xFF8
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 351
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
	Offset: 0x1090
	Size: 0x1C8
	Parameters: 2
	Flags: None
	Line Number: 378
*/
function function_6c7a96b4(player, base_cost)
{
	if(player.var_85da8a33 < 1 && GetDvarInt("scr_firstGumFree") === 1)
	{
		return 0;
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
	cost = 500;
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
	if(500 != base_cost)
	{
		cost = cost - 500 - base_cost;
	}
	return cost;
}

/*
	Name: function_ec0482ba
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1260
	Size: 0x248
	Parameters: 1
	Flags: None
	Line Number: 426
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
	Offset: 0x14B0
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 486
*/
function trigger_visible_to_player(player)
{
	self setinvisibletoplayer(player);
	visible = 1;
	if(!player zm_magicbox::can_buy_weapon())
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
	Name: function_ededc488
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1578
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 516
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
	Offset: 0x15D8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 536
*/
function function_13565590()
{
	self function_561f90cb("arriving");
	self waittill("arrived");
	self.hidden = 0;
}

/*
	Name: function_3f75d3b
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1620
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 553
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
	Offset: 0x16C8
	Size: 0x140
	Parameters: 1
	Flags: Private
	Line Number: 579
*/
function private function_5bd3a49b(player)
{
	if(namespace_11e193f1::function_6dd41714("gobblegums_any_gum") == 1)
	{
		self.var_b287be = function_9b84d8c6();
		clientfield::set("zm_bgb_machine_selection", level.bgb[self.var_b287be].item_index);
		return 1;
	}
	if(!player.var_8414308a.size)
	{
		player.var_8414308a = Array::randomize(player.var_98ba48a2);
	}
	self.var_b287be = Array::pop_front(player.var_8414308a);
	clientfield::set("zm_bgb_machine_selection", level.bgb[self.var_b287be].item_index);
	return player bgb::function_f59fbff(self.var_b287be);
}

/*
	Name: function_9b84d8c6
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1810
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 606
*/
function function_9b84d8c6()
{
	var_a95e1085 = [];
	num = undefined;
	index = 1;
	for(row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index); isdefined(row); row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index))
	{
		var_71832171 = 0;
		var_803e329f = checkStringValid(row[2]);
		if(var_803e329f == "bubblegum" || var_803e329f == "bubblegum_consumable")
		{
			var_71832171 = 1;
		}
		var_d277f374 = Int(row[16]);
		var_a0ec4ef3 = checkStringValid(row[4]);
		if(!isdefined(num) || (isdefined(num) && num == var_d277f374))
		{
			if(isdefined(var_a0ec4ef3) && var_71832171)
			{
				var_a95e1085[var_a95e1085.size] = var_a0ec4ef3;
			}
		}
		index++;
		if(index == 101)
		{
			index++;
		}
	}
	return var_a95e1085[RandomInt(var_a95e1085.size)];
}

/*
	Name: checkStringValid
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x19D0
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 647
*/
function checkStringValid(STR)
{
	if(STR != "")
	{
		return STR;
	}
	return undefined;
}

/*
	Name: function_d9f9a9c1
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1A00
	Size: 0x848
	Parameters: 0
	Flags: None
	Line Number: 666
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
		if(User.IS_DRINKING > 0)
		{
			wait(0.1);
			continue;
		}
		if(isdefined(self.disabled) && self.disabled)
		{
			wait(0.1);
			continue;
		}
		if(User GetCurrentWeapon() == level.weaponNone)
		{
			wait(0.1);
			continue;
		}
		var_625e97d1 = 0;
		cost = function_6c7a96b4(User, self.base_cost);
		if(zm_utility::is_player_valid(User) && User zm_score::can_player_purchase(cost))
		{
			User zm_score::minus_to_player_score(cost);
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
	self.var_16d95df4 = self thread function_5bd3a49b(User);
	self thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
	self function_561f90cb("open");
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
			if(isdefined(grabber.IS_DRINKING) && grabber.IS_DRINKING > 0)
			{
				wait(0.1);
				continue;
			}
			if(grabber == User && User GetCurrentWeapon() == level.weaponNone)
			{
				wait(0.1);
				continue;
			}
			if(grabber == User || grabber == level)
			{
				current_weapon = level.weaponNone;
				if(zm_utility::is_player_valid(User))
				{
					current_weapon = User GetCurrentWeapon();
				}
				if(grabber == User && zm_utility::is_player_valid(User) && !User.IS_DRINKING > 0 && !zm_utility::is_placeable_mine(current_weapon) && !zm_equipment::is_equipment(current_weapon) && !User zm_utility::is_player_revive_tool(current_weapon) && !current_weapon.isHeroWeapon && !current_weapon.isgadget)
				{
					self notify("hash_69873c12");
					User notify("hash_69873c12");
					var_2c6b4c12 = 1;
					User thread namespace_851dc78f::givegobblegum(namespace_851dc78f::function_b4705b81(self.var_b287be));
					if(isdefined(level.var_173cfd1e))
					{
						User thread [[level.var_173cfd1e]](self);
					}
					else
					{
						User thread function_acf1c4da(self);
						break;
					}
				}
				else if(grabber == level)
				{
					break;
				}
			}
			wait(0.05);
		}
		if(grabber == User)
		{
			self function_561f90cb("close");
			self waittill("closed");
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
	}
	self thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
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
	Offset: 0x2250
	Size: 0x80
	Parameters: 0
	Flags: Private
	Line Number: 842
*/
function private function_d8680cd2()
{
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
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d83737d3
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x22D8
	Size: 0xD0
	Parameters: 0
	Flags: Private
	Line Number: 875
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
}

/*
	Name: turn_on_fire_sale
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x23B0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 921
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
	Offset: 0x2490
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 945
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
	Offset: 0x2588
	Size: 0x88
	Parameters: 0
	Flags: Private
	Line Number: 968
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
	Offset: 0x2618
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 993
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
}

/*
	Name: fire_sale_fix
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2818
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1038
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
}

/*
	Name: function_ca233e7d
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x28E0
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 1067
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
	Offset: 0x29D0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1092
*/
function function_1174bcd9()
{
	clientfield::set("zm_bgb_machine_fx_state", 4);
	self SetZBarrierPieceState(2, "open");
	self SetZBarrierPieceState(3, "open");
	self SetZBarrierPieceState(5, "closed");
}

/*
	Name: function_e7f3a3f5
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2A60
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 1110
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
	ERROR: Bad function call
}

/*
	Name: function_4aa434eb
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2BA0
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 1142
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
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_118970ca
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2CE0
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 1174
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
	wait(5.5);
	clientfield::set("zm_bgb_machine_fx_state", 4);
	self thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
	while(self GetZBarrierPieceState(2) == "opening")
	{
		wait(0.05);
	}
	self notify("trigger", level);
	return;
	ERROR: Bad function call
}

/*
	Name: function_ed2e5150
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2EB8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1216
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
}

/*
	Name: function_b56ef180
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2F90
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1240
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
	Offset: 0x2FE8
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 1260
*/
function function_8ae729a7()
{
	return self.state;
}

/*
	Name: function_561f90cb
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x3000
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1275
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
	Name: function_cffffa44
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x3088
	Size: 0x340
	Parameters: 1
	Flags: None
	Line Number: 1295
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
	return;
	ERROR: Bad function call
}

/*
	Name: function_4fb7632c
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x33D0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 1375
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
	Offset: 0x34B0
	Size: 0xA4
	Parameters: 1
	Flags: None
	Line Number: 1404
*/
function function_acf1c4da(machine)
{
	if(isdefined(level.bgb[machine.var_b287be]) && level.bgb[machine.var_b287be].var_c9e64d65 == "activated")
	{
		self zm_audio::create_and_play_dialog("bgb", "buy");
	}
	else
	{
		self zm_audio::create_and_play_dialog("bgb", "eat");
	}
}

