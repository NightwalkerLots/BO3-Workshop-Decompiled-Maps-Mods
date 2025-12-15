#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_score;
#include scripts\zm\zm_temple_ai_monkey;

#namespace namespace_654014fa;

/*
	Name: main
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x450
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 23
*/
function main()
{
	level function_cabfa50();
	level thread function_22cb9b37();
	level thread function_9138ebab();
	level thread function_9fe2a5f8();
	level thread function_b562d08a();
	level thread function_d1c3960f();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_cabfa50
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x4F0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function function_cabfa50()
{
	trigger = spawn("trigger_radius", (73, -375, 6), 0, 32, 32);
	trigger.targetname = "code_struct";
	trigger.script_noteworthy = "DPAD_UP DPAD_UP DPAD_DOWN BUTTON_A";
	trigger.script_string = "mb";
}

/*
	Name: function_22cb9b37
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x578
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function function_22cb9b37()
{
	triggers = GetEntArray("code_trigger", "targetname");
	Array::thread_all(triggers, &function_dbc801a5);
	return;
	ERROR: Bad function call
}

/*
	Name: function_dbc801a5
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x5D8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 81
*/
function function_dbc801a5()
{
	code = self.script_noteworthy;
	if(!isdefined(code))
	{
		code = "DPAD_UP DPAD_UP DPAD_DOWN DPAD_DOWN DPAD_LEFT DPAD_RIGHT DPAD_LEFT DPAD_RIGHT BUTTON_B BUTTON_A";
	}
	if(!isdefined(self.script_string))
	{
		self.script_string = "cash";
	}
	self.players = [];
	while(1)
	{
		self waittill("trigger", who);
		if(is_in_array(self.players, who))
		{
			continue;
		}
		who thread function_3a555f23(code, self);
	}
}

/*
	Name: function_3a555f23
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x698
	Size: 0x188
	Parameters: 2
	Flags: None
	Line Number: 114
*/
function function_3a555f23(code, trigger)
{
	if(!isdefined(trigger.players))
	{
		trigger.players = [];
	}
	else if(!IsArray(trigger.players))
	{
		trigger.players = Array(trigger.players);
	}
	trigger.players[trigger.players.size] = self;
	self thread function_3c690d1e(code);
	self thread function_3fd4b023(trigger);
	var_a238d86c = self util::waittill_any_return("code_correct", "stopped_touching_trigger", "death");
	self notify("hash_815b6c39");
	if(var_a238d86c == "code_correct")
	{
		trigger function_9969ac9b(self);
	}
	else
	{
		trigger.players = ArrayRemoveValue(trigger.players, self);
	}
}

/*
	Name: is_in_array
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x828
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 149
*/
function is_in_array(Array, item)
{
	foreach(index in Array)
	{
		if(index == item)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: array_remove
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x8C8
	Size: 0x120
	Parameters: 2
	Flags: None
	Line Number: 171
*/
function array_remove(Array, object)
{
	if(!isdefined(Array) && !isdefined(object))
	{
		return;
	}
	new_array = [];
	foreach(item in Array)
	{
		if(item != object)
		{
			if(!isdefined(new_array))
			{
				new_array = [];
			}
			else if(!IsArray(new_array))
			{
				new_array = Array(new_array);
			}
			new_array[new_array.size] = item;
		}
	}
	return new_array;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: array_removeundefined
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x9F0
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 207
*/
function array_removeundefined(Array)
{
	if(!isdefined(Array))
	{
		return;
	}
	new_array = [];
	foreach(item in Array)
	{
		if(isdefined(item))
		{
			if(!isdefined(new_array))
			{
				new_array = [];
			}
			else if(!IsArray(new_array))
			{
				new_array = Array(new_array);
			}
			new_array[new_array.size] = item;
		}
	}
	return new_array;
}

/*
	Name: function_9969ac9b
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0xAF8
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 242
*/
function function_9969ac9b(who)
{
	switch(self.script_string)
	{
		case "cash":
		{
			who zm_score::add_to_player_score(100);
			break;
		}
		default
		{
		}
	}
}

/*
	Name: function_3fd4b023
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0xB50
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 267
*/
function function_3fd4b023(trigger)
{
	self endon("hash_815b6c39");
	while(self istouching(trigger))
	{
		wait(0.1);
	}
	self notify("hash_54715dcd");
}

/*
	Name: function_3c690d1e
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0xBA8
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 287
*/
function function_3c690d1e(code)
{
	self endon("hash_815b6c39");
	codes = StrTok(code, " ");
	while(1)
	{
		for(i = 0; i < codes.size; i++)
		{
			button = codes[i];
			if(!self button_pressed(button, 0.3))
			{
				break;
			}
			if(!self function_c13da310(button, 0.3))
			{
				break;
			}
			if(i == codes.size - 1)
			{
				self notify("hash_6e455e7d");
				return;
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_c13da310
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0xCC0
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 324
*/
function function_c13da310(button, time)
{
	endTime = GetTime() + time * 1000;
	while(GetTime() < endTime)
	{
		if(!self function_8ecd205a(button))
		{
			return 1;
		}
		wait(0.01);
	}
	return 0;
}

/*
	Name: button_pressed
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0xD38
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 348
*/
function button_pressed(button, time)
{
	endTime = GetTime() + time * 1000;
	while(GetTime() < endTime)
	{
		if(self function_8ecd205a(button))
		{
			return 1;
		}
		wait(0.01);
	}
	return 0;
}

/*
	Name: function_9fe2a5f8
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0xDB0
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 372
*/
function function_9fe2a5f8()
{
	level flag::wait_till("initial_players_connected");
	var_9e00c8d5 = GetEntArray("slow_trigger", "targetname");
	for(t = 0; t < var_9e00c8d5.size; t++)
	{
		trig = var_9e00c8d5[t];
		if(!isdefined(trig.script_float))
		{
			trig.script_float = 0.5;
		}
		trig.var_dd0d8675 = 1;
		trig.var_1d2ae274 = trig.script_float / trig.var_dd0d8675;
		trig thread function_15f1ebea();
	}
}

/*
	Name: function_15f1ebea
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0xEC8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 399
*/
function function_15f1ebea()
{
	while(1)
	{
		self waittill("trigger", player);
		player notify("hash_5a1b6c4d");
		self trigger::function_thread(player, &function_9da3a2a3, &function_405ff7e2);
		wait(0.1);
	}
}

/*
	Name: function_9da3a2a3
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0xF48
	Size: 0x150
	Parameters: 2
	Flags: None
	Line Number: 420
*/
function function_9da3a2a3(player, endon_condition)
{
	player endon(endon_condition);
	if(isdefined(player))
	{
		prevtime = GetTime();
		while(player.moveSpeedScale > self.script_float)
		{
			wait(0.05);
			delta = GetTime() - prevtime;
			player.moveSpeedScale = player.moveSpeedScale - delta / 1000 * self.var_1d2ae274;
			prevtime = GetTime();
			player setMoveSpeedScale(player.moveSpeedScale);
		}
		player.moveSpeedScale = self.script_float;
		player AllowJump(0);
		player AllowSprint(0);
		player setMoveSpeedScale(self.script_float);
		player SetVelocity((0, 0, 0));
	}
}

/*
	Name: function_405ff7e2
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x10A0
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 452
*/
function function_405ff7e2(player)
{
	player endon("hash_5a1b6c4d");
	if(isdefined(player))
	{
		prevtime = GetTime();
		while(player.moveSpeedScale < 1)
		{
			wait(0.05);
			delta = GetTime() - prevtime;
			player.moveSpeedScale = player.moveSpeedScale + delta / 1000 * self.var_1d2ae274;
			prevtime = GetTime();
			player setMoveSpeedScale(player.moveSpeedScale);
		}
		player.moveSpeedScale = 1;
		player AllowJump(1);
		player AllowSprint(1);
		player setMoveSpeedScale(1);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_56dd6042
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x11C8
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 485
*/
function function_56dd6042()
{
	if(!isdefined(self.script_string))
	{
		self.script_string = "";
	}
	while(1)
	{
		/#
			box(self.origin, self.mins, self.maxs, 0, (1, 0, 0));
		#/
		corpses = GetCorpseArray();
		for(i = 0; i < corpses.size; i++)
		{
			corpse = corpses[i];
			/#
				box(corpse.orign, corpse.mins, corpse.maxs, 0, (1, 1, 0));
			#/
			if(corpse istouching(self))
			{
				self function_2850e0c2();
				return;
			}
		}
		wait(0.3);
	}
}

/*
	Name: function_2850e0c2
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x1310
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 523
*/
function function_2850e0c2()
{
}

/*
	Name: function_9138ebab
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x1320
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 537
*/
function function_9138ebab()
{
	triggers = GetEntArray("water_drop_trigger", "script_noteworthy");
	for(i = 0; i < triggers.size; i++)
	{
		trig = triggers[i];
		trig.var_839ef4da = 0.5;
		trig.var_98a50550 = 1;
		trig.watersheeting = 1;
		if(isdefined(trig.script_string))
		{
			if(trig.script_string == "sheetingonly")
			{
				trig.var_98a50550 = 0;
			}
			else if(trig.script_string == "dropsonly")
			{
				trig.watersheeting = 0;
			}
		}
		trig thread function_a78234c2();
	}
	return;
}

/*
	Name: function_a78234c2
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x1460
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 572
*/
function function_a78234c2()
{
	level flag::wait_till("initial_players_connected");
	wait(1);
	if(isdefined(self.script_flag))
	{
		level flag::wait_till(self.script_flag);
	}
	if(isdefined(self.script_float))
	{
		wait(self.script_float);
	}
	while(1)
	{
		self waittill("trigger", who);
		if(isPlayer(who))
		{
			self trigger::function_thread(who, &function_ccbda65b, &function_7b9c0362);
		}
		else if(isdefined(who.var_92ce1c50))
		{
			who thread [[who.var_92ce1c50]](self);
		}
	}
}

/*
	Name: function_ccbda65b
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x1578
	Size: 0x1B8
	Parameters: 2
	Flags: None
	Line Number: 608
*/
function function_ccbda65b(player, endon_string)
{
	if(isdefined(endon_string))
	{
		player endon(endon_string);
	}
	player notify("hash_e3adbb48");
	player endon("death");
	player endon("disconnect");
	player endon("spawned_spectator");
	if(player.sessionstate == "spectator")
	{
		return;
	}
	if(!isdefined(player.var_46d6d7f7))
	{
		player.var_46d6d7f7 = [];
	}
	if(isdefined(self.script_sound))
	{
		player playsound(self.script_sound);
	}
	if(self.var_98a50550)
	{
		if(!isdefined(player.var_46d6d7f7))
		{
			player.var_46d6d7f7 = [];
		}
		else if(!IsArray(player.var_46d6d7f7))
		{
			player.var_46d6d7f7 = Array(player.var_46d6d7f7);
		}
		player.var_46d6d7f7[player.var_46d6d7f7.size] = self;
		if(!self.watersheeting)
		{
			player SetWaterDrops(player function_16899c85());
		}
	}
	if(self.watersheeting)
	{
		self thread function_4dedd2e(player);
	}
}

/*
	Name: function_4dedd2e
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x1738
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 662
*/
function function_4dedd2e(player)
{
	player notify("hash_e3adbb48");
	player endon("death");
	player endon("disconnect");
	player endon("spawned_spectator");
	player endon("hash_1a92fdd4");
	player clientfield::set_to_player("floorrumble", 1);
	player thread function_63ef47db();
	visionset_mgr::activate("overlay", "zm_waterfall_postfx", player);
	return;
}

/*
	Name: function_7b9c0362
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x17F0
	Size: 0x158
	Parameters: 1
	Flags: None
	Line Number: 685
*/
function function_7b9c0362(player)
{
	if(!isdefined(player.var_46d6d7f7))
	{
		player.var_46d6d7f7 = [];
	}
	if(self.var_98a50550)
	{
		if(self.watersheeting)
		{
			player notify("hash_1a92fdd4");
			player clientfield::set_to_player("floorrumble", 0);
			player SetWaterDrops(player function_16899c85());
			visionset_mgr::deactivate("overlay", "zm_waterfall_postfx", player);
		}
		player.var_46d6d7f7 = array_remove(player.var_46d6d7f7, self);
		if(player.var_46d6d7f7.size == 0)
		{
			player function_a24fd169(0);
		}
		else
		{
			player SetWaterDrops(player function_16899c85());
		}
	}
}

/*
	Name: function_a24fd169
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x1950
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 722
*/
function function_a24fd169(delay)
{
	self endon("death");
	self endon("disconnect");
	self endon("hash_e3adbb48");
	wait(delay);
	self SetWaterDrops(0);
}

/*
	Name: function_16899c85
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x19A8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 741
*/
function function_16899c85()
{
	if(self.var_46d6d7f7.size > 0)
	{
		return 50;
	}
	return 0;
}

/*
	Name: function_b562d08a
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x19D0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 760
*/
function function_b562d08a()
{
	structs = struct::get_array("code_struct", "targetname");
	Array::thread_all(structs, &function_9d948077);
	return;
	.var_0 = undefined;
}

/*
	Name: function_9d948077
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x1A30
	Size: 0x248
	Parameters: 0
	Flags: None
	Line Number: 778
*/
function function_9d948077()
{
	code = self.script_noteworthy;
	if(!isdefined(code))
	{
		code = "DPAD_UP DPAD_DOWN DPAD_LEFT DPAD_RIGHT BUTTON_B BUTTON_A";
	}
	self.codes = StrTok(code, " ");
	if(!isdefined(self.script_string))
	{
		self.script_string = "cash";
	}
	self.reward = self.script_string;
	if(!isdefined(self.radius))
	{
		self.radius = 32;
	}
	self.radiusSq = self.radius * self.radius;
	var_78785ad6 = [];
	while(1)
	{
		players = GetPlayers();
		for(i = var_78785ad6.size - 1; i >= 0; i--)
		{
			player = var_78785ad6[i];
			if(!self function_a7da30c(player))
			{
				if(isdefined(player))
				{
					var_78785ad6 = array_remove(var_78785ad6, player);
					self notify("hash_63b551c8");
				}
				else
				{
					var_78785ad6 = array_removeundefined(var_78785ad6);
				}
			}
			players = array_remove(players, player);
		}
		for(i = 0; i < players.size; i++)
		{
			player = players[i];
			if(self function_a7da30c(player))
			{
				self thread function_cf76be77(player);
				var_78785ad6[var_78785ad6.size] = player;
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_cf76be77
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x1C80
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 840
*/
function function_cf76be77(player)
{
	self endon("hash_63b551c8");
	player endon("death");
	player endon("disconnect");
	while(1)
	{
		for(i = 0; i < self.codes.size; i++)
		{
			button = self.codes[i];
			if(!player button_pressed(button, 0.3))
			{
				break;
			}
			if(!player function_c13da310(button, 0.3))
			{
				break;
			}
			if(i == self.codes.size - 1)
			{
				self function_a6f0c56c(player);
				return;
			}
		}
		wait(0.1);
	}
	return;
	waittillframeend;
}

/*
	Name: function_a6f0c56c
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x1D98
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 880
*/
function function_a6f0c56c(player)
{
	switch(self.reward)
	{
		case "cash":
		{
			player zm_score::add_to_player_score(100);
			break;
		}
		case "mb":
		{
			util::setClientSysState("aae_soulcounter", "&AAE_TIP_TEMPLE_KEY_COMBO_EE_TITLE");
			namespace_cafc107d::monkey_ambient_gib_all();
			break;
		}
		default
		{
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_a7da30c
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x1E30
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 913
*/
function function_a7da30c(player)
{
	if(!zombie_utility::is_player_valid(player))
	{
		return 0;
	}
	if(Abs(self.origin[2] - player.origin[2]) > 30)
	{
		return 0;
	}
	if(Distance2DSquared(self.origin, player.origin) > self.radiusSq)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_63ef47db
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x1ED8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 940
*/
function function_63ef47db()
{
	self endon("hash_1a92fdd4");
	level waittill("intermission");
	self clientfield::set_to_player("floorrumble", 0);
}

/*
	Name: function_d1c3960f
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x1F20
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 957
*/
function function_d1c3960f()
{
	level.var_a8569208 = [];
	level.var_a8569208["BUTTON_RSHLDR"] = &fragButtonPressed;
	level.var_a8569208["BUTTON_LSHLDR"] = &SecondaryOffhandButtonPressed;
	level.var_a8569208["BUTTON_RSTICK"] = &meleeButtonPressed;
	level.var_a8569208["BUTTON_LSTICK"] = &SprintButtonPressed;
	level.var_a8569208["BUTTON_A"] = &JumpButtonPressed;
	level.var_a8569208["BUTTON_B"] = &StanceButtonPressed;
	level.var_a8569208["BUTTON_X"] = &ReloadButtonPressed;
	level.var_a8569208["BUTTON_Y"] = &WeaponSwitchButtonPressed;
	level.var_a8569208["DPAD_UP"] = &ActionSlotOneButtonPressed;
	level.var_a8569208["DPAD_LEFT"] = &ActionSlotThreeButtonPressed;
	level.var_a8569208["DPAD_RIGHT"] = &ActionSlotFourButtonPressed;
	level.var_a8569208["DPAD_DOWN"] = &ActionSlotTwoButtonPressed;
	level.var_a8569208["BUTTON_RTRIG"] = &AdsButtonPressed;
	level.var_a8569208["BUTTON_LTRIG"] = &AttackButtonPressed;
}

/*
	Name: function_8ecd205a
	Namespace: namespace_654014fa
	Checksum: 0x424F4353
	Offset: 0x20F8
	Size: 0x44
	Parameters: 1
	Flags: None
	Line Number: 986
*/
function function_8ecd205a(button)
{
	if(isdefined(level.var_a8569208))
	{
		if(isdefined(level.var_a8569208[button]))
		{
			return self [[level.var_a8569208[button]]]();
		}
	}
	return 0;
}

