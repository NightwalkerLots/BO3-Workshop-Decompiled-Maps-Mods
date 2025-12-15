#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_605a4f26;

/*
	Name: __init__sytem__
	Namespace: namespace_605a4f26
	Checksum: 0xBF261773
	Offset: 0x4D8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 29
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_fix", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_605a4f26
	Checksum: 0x321E1935
	Offset: 0x520
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	callback::on_connect(&on_player_connect);
	clientfield::register("zbarrier", "bgb_machine", 1, 1, "int");
	clientfield::register("zbarrier", "bgb_set_state", 1, 4, "int");
	clientfield::register("zbarrier", "bgb_set_limit_type", 1, 4, "int");
	clientfield::register("zbarrier", "bgb_set_rarity", 1, 4, "int");
	clientfield::register("toplayer", "bgb_machine_buys", 1, 3, "int");
}

/*
	Name: __main__
	Namespace: namespace_605a4f26
	Checksum: 0x50162B3
	Offset: 0x640
	Size: 0x3D0
	Parameters: 0
	Flags: None
	Line Number: 64
*/
function __main__()
{
	if(!isdefined(level.var_5a072535))
	{
		level.var_5a072535 = &function_b2f238aa;
	}
	wait(0.05);
	function_4daf68ff();
	level.var_3cd5727 = struct::get_array("bgb_machine_use", "targetname");
	function_62051f89();
	thread function_3eed20b0();
	if(!isdefined(level.var_69626b81))
	{
		level.var_69626b81 = -1;
	}
	else if(level.var_69626b81 >= level.var_3cd5727.size || level.var_69626b81 < 0)
	{
		level.var_69626b81 = -1;
	}
	if(!isdefined(level.var_52e48c11))
	{
		level.var_52e48c11 = 0;
	}
	if(!isdefined(level.var_2f49c9f2))
	{
		level.var_2f49c9f2 = 1;
	}
	if(!isdefined(level.var_8a9168f3))
	{
		level.var_8a9168f3 = 0;
	}
	if(zm_utility::is_Classic() && level.enable_magic)
	{
		level flag::wait_till("initial_blackscreen_passed");
		wait(0.25);
		level.var_696b096c = [];
		var_17d8d9fc = [];
		if(level.var_69626b81 == -1)
		{
			var_17d8d9fc = level.var_3cd5727;
			continue;
		}
		var_aabc51b = [];
		var_e5d6719f = [];
		foreach(machine in Array::randomize(level.var_3cd5727))
		{
			if(isdefined(machine.script_string))
			{
				Array::add(var_aabc51b, machine);
				continue;
			}
			Array::add(var_e5d6719f, machine);
		}
		var_95a572a5 = ArrayCombine(var_aabc51b, var_e5d6719f, 1, 0);
		for(i = 0; i < level.var_69626b81; i++)
		{
			machine = var_95a572a5[i];
			Array::add(var_17d8d9fc, machine);
		}
		foreach(machine in var_17d8d9fc)
		{
			Array::add(level.var_696b096c, machine);
			machine.zbarrier function_415e922b("arriving");
			machine.active = 1;
		}
	}
}

/*
	Name: function_62051f89
	Namespace: namespace_605a4f26
	Checksum: 0x85873323
	Offset: 0xA18
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 142
*/
function function_62051f89()
{
	for(i = 0; i < level.var_3cd5727.size; i++)
	{
		level.var_3cd5727[i].orig_origin = level.var_3cd5727[i].origin;
		level.var_3cd5727[i] function_7a5dadb5();
		level.var_3cd5727[i].var_4dfbc13e = 0;
		level.var_3cd5727[i].active = 0;
		level.var_3cd5727[i].fire_sale = 0;
	}
	Array::thread_all(level.var_3cd5727, &function_d9f9a9c1);
}

/*
	Name: function_7a5dadb5
	Namespace: namespace_605a4f26
	Checksum: 0xC478C6D8
	Offset: 0xB28
	Size: 0x2A8
	Parameters: 0
	Flags: None
	Line Number: 165
*/
function function_7a5dadb5()
{
	min_distance = undefined;
	var_19479802 = undefined;
	var_86bd4c9c = self.script_noteworthy + "_zbarrier";
	zbarriers = GetEntArray(var_86bd4c9c, "script_noteworthy");
	foreach(zbarrier in zbarriers)
	{
		Distance = Distance2DSquared(self.origin, zbarrier.origin);
		if(!isdefined(min_distance))
		{
			var_19479802 = zbarrier;
			min_distance = Distance;
			continue;
		}
		if(Distance < min_distance)
		{
			var_19479802 = zbarrier;
			min_distance = Distance;
		}
	}
	self.zbarrier = var_19479802;
	self.unitrigger_stub = spawnstruct();
	self.unitrigger_stub.origin = self.origin;
	self.unitrigger_stub.angles = self.angles;
	self.unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	self.unitrigger_stub.script_width = 45;
	self.unitrigger_stub.script_height = 72;
	self.unitrigger_stub.script_length = 45;
	self.unitrigger_stub.trigger_target = self;
	zm_unitrigger::unitrigger_force_per_player_triggers(self.unitrigger_stub, 1);
	self.unitrigger_stub.prompt_and_visibility_func = &function_d23fd7e5;
	self.zbarrier.owner = self;
	self.zbarrier clientfield::set("bgb_machine", 1);
	self.zbarrier function_415e922b("away");
}

/*
	Name: function_d23fd7e5
	Namespace: namespace_605a4f26
	Checksum: 0x7AEA864E
	Offset: 0xDD8
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 212
*/
function function_d23fd7e5(player)
{
	can_use = self function_19c5b79d(player);
	if(isdefined(self.hint_string))
	{
		if(isdefined(self.hint_parm1))
		{
			self setHintString(self.hint_string, self.hint_parm1);
			continue;
		}
		self setHintString(self.hint_string);
	}
	return can_use;
}

/*
	Name: function_19c5b79d
	Namespace: namespace_605a4f26
	Checksum: 0x2E720403
	Offset: 0xE70
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 237
*/
function function_19c5b79d(player)
{
	if(!self trigger_visible_to_player(player))
	{
		return 0;
	}
	cost = self.stub.trigger_target function_f868869c(player);
	if(self.stub.trigger_target.var_cf70582a == "take")
	{
		self setcursorhint("HINT_BGB", self.stub.trigger_target.var_d719e99b.stat_index);
		self.hint_string = &"ZOMBIE_BGB_MACHINE_OFFERING";
	}
	else if(cost === 0)
	{
		self setcursorhint("HINT_NOICON");
		self.hint_string = &"ZOMBIE_BGB_MACHINE_COMEBACK";
		continue;
	}
	self setcursorhint("HINT_NOICON");
	self.hint_string = &"ZOMBIE_BGB_MACHINE_AVAILABLE_CFILL";
	return 1;
}

/*
	Name: trigger_visible_to_player
	Namespace: namespace_605a4f26
	Checksum: 0x1227595E
	Offset: 0xFB8
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 270
*/
function trigger_visible_to_player(player)
{
	self setinvisibletoplayer(player);
	visible = 1;
	if(!zm_perks::vending_trigger_can_player_use(player))
	{
		visible = 0;
	}
	else if(isdefined(self.stub.trigger_target.var_6fcb8078))
	{
		var_6fcb8078 = self.stub.trigger_target.var_6fcb8078;
		if(player != var_6fcb8078 || zm_utility::is_placeable_mine(var_6fcb8078 GetCurrentWeapon()) || var_6fcb8078 zm_equipment::hacker_active())
		{
			visible = 0;
		}
	}
	if(!visible)
	{
		return 0;
	}
	self setvisibletoplayer(player);
	return 1;
}

/*
	Name: function_1dbffc82
	Namespace: namespace_605a4f26
	Checksum: 0x26502626
	Offset: 0x10E0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 304
*/
function function_1dbffc82()
{
	self endon("kill_trigger");
	for(;;)
	{
		self waittill("trigger", player);
		self.stub.trigger_target notify("trigger", player);
	}
	return;
}

/*
	Name: function_4daf68ff
	Namespace: namespace_605a4f26
	Checksum: 0xBE6F735
	Offset: 0x1138
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 325
*/
function function_4daf68ff()
{
	index = 1;
	table = "gamedata/weapons/zm/zm_levelcommon_bgb.csv";
	for(row = TableLookupRow(table, index); isdefined(row); row = TableLookupRow(table, index))
	{
		name = zm_weapons::checkStringValid(row[0]);
		stat_index = Int(row[1]);
		camo_index = Int(row[2]);
		var_c9e64d65 = Int(row[3]);
		var_d277f374 = Int(row[4]);
		var_2df72bf7 = ToLower(row[5]) == "true";
		weight = float(row[6]);
		function_4913b743(name, stat_index, camo_index, var_c9e64d65, var_d277f374, var_2df72bf7, weight);
		index++;
	}
}

/*
	Name: function_4913b743
	Namespace: namespace_605a4f26
	Checksum: 0x7C860C29
	Offset: 0x1310
	Size: 0x150
	Parameters: 7
	Flags: None
	Line Number: 353
*/
function function_4913b743(name, stat_index, camo_index, var_c9e64d65, var_d277f374, var_2df72bf7, weight)
{
	struct = spawnstruct();
	if(!isdefined(level.var_d9a66f92))
	{
		level.var_d9a66f92 = [];
		level.var_d3c33034 = [];
	}
	if(weight < 0)
	{
		weight = 0;
	}
	struct.name = name;
	struct.stat_index = stat_index;
	struct.camo_index = camo_index;
	struct.var_c9e64d65 = var_c9e64d65;
	struct.var_d277f374 = var_d277f374;
	struct.var_2df72bf7 = var_2df72bf7;
	struct.weight = weight;
	level.var_d9a66f92[name] = struct;
	if(!var_2df72bf7)
	{
		level.var_d3c33034[name] = struct;
	}
}

/*
	Name: function_d9f9a9c1
	Namespace: namespace_605a4f26
	Checksum: 0xA93CD27A
	Offset: 0x1468
	Size: 0x3E8
	Parameters: 0
	Flags: None
	Line Number: 389
*/
function function_d9f9a9c1()
{
	player = undefined;
	self.var_6fcb8078 = undefined;
	self.var_cf70582a = "buy";
	for(;;)
	{
		self waittill("trigger", player);
		if(player == level)
		{
			continue;
		}
		cost = self function_f868869c(player);
		if(cost === 0)
		{
		}
		else if(!player zm_score::can_player_purchase(cost))
		{
			zm_utility::play_sound_at_pos("no_purchase", self.origin);
			player zm_audio::create_and_play_dialog("general", "outofmoney");
			continue;
		}
		self.var_6fcb8078 = player;
		thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
		self.var_4dfbc13e++;
		player.var_b1756758++;
		player clientfield::set_to_player("bgb_machine_buys", player.var_b1756758);
		player zm_score::minus_to_player_score(cost);
		self.var_d719e99b = function_1def7cd8(player);
		self.zbarrier function_415e922b("dispense");
		self.zbarrier waittill("hash_30d089c4");
		self.var_cf70582a = "take";
		thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &function_1dbffc82);
		reason = self util::waittill_any_timeout(5.5, "trigger");
		if(reason == "trigger")
		{
			self.zbarrier function_415e922b("bgb_taken");
			player thread function_e0bfd2c2(self.var_d719e99b);
		}
		thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
		self.zbarrier waittill("hash_fb19ac8e");
		if(self.fire_sale)
		{
			self.var_4dfbc13e--;
		}
		self.zbarrier function_415e922b("idle");
		player = undefined;
		self.var_6fcb8078 = undefined;
		self.var_cf70582a = "buy";
		if(!level.zombie_vars["zombie_powerup_fire_sale_on"])
		{
			self.fire_sale = 0;
		}
		if(!self.active && !level.zombie_vars["zombie_powerup_fire_sale_on"])
		{
			self.zbarrier function_415e922b("leaving");
			self.var_4dfbc13e = 0;
		}
		else if(self function_d8680cd2())
		{
			self thread function_872660fc();
			continue;
		}
		wait(0.5);
		thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &function_1dbffc82);
	}
}

/*
	Name: on_player_connect
	Namespace: namespace_605a4f26
	Checksum: 0x95DE83BF
	Offset: 0x1858
	Size: 0x28
	Parameters: 0
	Flags: Private
	Line Number: 467
*/
function private on_player_connect()
{
	self.var_b1756758 = 0;
	self thread function_4ec6d67c();
}

/*
	Name: function_4ec6d67c
	Namespace: namespace_605a4f26
	Checksum: 0xC9F89616
	Offset: 0x1888
	Size: 0x48
	Parameters: 0
	Flags: Private
	Line Number: 483
*/
function private function_4ec6d67c()
{
	self endon("disconnect");
	for(;;)
	{
		level waittill("between_round_over");
		self.var_b1756758 = 0;
		self clientfield::set_to_player("bgb_machine_buys", 0);
	}
}

/*
	Name: function_f868869c
	Namespace: namespace_605a4f26
	Checksum: 0x754EBA0C
	Offset: 0x18D8
	Size: 0x190
	Parameters: 1
	Flags: None
	Line Number: 504
*/
function function_f868869c(player)
{
	var_f38dab22 = Int(floor(level.round_number / 10));
	var_f38dab22 = min(var_f38dab22, 10);
	if(level.zombie_vars["zombie_powerup_fire_sale_on"])
	{
		base_cost = 10;
		continue;
	}
	base_cost = 500;
	switch(player.var_b1756758)
	{
		case 0:
		{
			cost = base_cost;
			break;
		}
		case 1:
		{
			cost = Int(base_cost + 1000 * pow(2, var_f38dab22));
			break;
		}
		case 2:
		{
			cost = Int(500 + base_cost + 1000 * pow(2, var_f38dab22 + 1));
			break;
		}
		default
		{
			cost = 0;
			break;
		}
	}
	return cost;
	ERROR: Bad function call
}

/*
	Name: function_1def7cd8
	Namespace: namespace_605a4f26
	Checksum: 0x206EFF1C
	Offset: 0x1A70
	Size: 0x2C8
	Parameters: 1
	Flags: None
	Line Number: 551
*/
function function_1def7cd8(player)
{
	if(level.var_8a9168f3)
	{
		if(!isdefined(player.var_98ba48a2))
		{
			player.var_98ba48a2 = player getbubblegumpack();
			player.var_98ba48a2 = Array::randomize(player.var_98ba48a2);
		}
		key = Array::pop(player.var_98ba48a2, 0, 0);
		if(player.var_98ba48a2.size == 0)
		{
			player.var_98ba48a2 = undefined;
			continue;
		}
	}
	ARR = level.var_d9a66f92;
	players = GetPlayers();
	if(players.size == 1 && level.var_2f49c9f2)
	{
		ARR = level.var_d3c33034;
	}
	var_5b64fdb9 = 0;
	foreach(bgb in getArrayKeys(ARR))
	{
		var_5b64fdb9 = var_5b64fdb9 + ARR[bgb].weight;
	}
	var_73a8892c = RandomFloatRange(0, var_5b64fdb9);
	var_926a1a59 = 0;
	foreach(bgb in getArrayKeys(ARR))
	{
		var_926a1a59 = var_926a1a59 + ARR[bgb].weight;
		if(var_926a1a59 > var_73a8892c)
		{
			key = bgb;
			break;
		}
	}
	return level.var_d9a66f92[key];
}

/*
	Name: function_d8680cd2
	Namespace: namespace_605a4f26
	Checksum: 0x18AE0510
	Offset: 0x1D40
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 602
*/
function function_d8680cd2()
{
	if(level.var_69626b81 == -1)
	{
		return 0;
	}
	else if(level.var_52e48c11)
	{
		return 0;
	}
	return self.var_4dfbc13e >= 3;
}

/*
	Name: function_872660fc
	Namespace: namespace_605a4f26
	Checksum: 0xB4ACF6EB
	Offset: 0x1D80
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 625
*/
function function_872660fc()
{
	self.zbarrier function_415e922b("leaving");
	self.var_4dfbc13e = 0;
	wait(10);
	var_e2223417 = Array::exclude(level.var_3cd5727, level.var_696b096c);
	var_7b98ade5 = Array::random(var_e2223417);
	level.var_696b096c = Array::exclude(level.var_696b096c, self);
	Array::add(level.var_696b096c, var_7b98ade5);
	if(var_7b98ade5.zbarrier.state == "away")
	{
		var_7b98ade5.zbarrier function_415e922b("arriving");
	}
	self.active = 0;
	var_7b98ade5.active = 1;
}

/*
	Name: function_3eed20b0
	Namespace: namespace_605a4f26
	Checksum: 0x3AE39BE1
	Offset: 0x1EC0
	Size: 0x130
	Parameters: 0
	Flags: Private
	Line Number: 652
*/
function private function_3eed20b0()
{
	for(;;)
	{
		level waittill("fire_sale_on");
		foreach(machine in level.var_3cd5727)
		{
			machine thread function_6126ab1e();
		}
		level waittill("fire_sale_off");
		foreach(machine in level.var_3cd5727)
		{
			machine thread function_2cbc21f();
		}
	}
}

/*
	Name: function_6126ab1e
	Namespace: namespace_605a4f26
	Checksum: 0x6A700605
	Offset: 0x1FF8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 679
*/
function function_6126ab1e()
{
	self.fire_sale = 1;
	if(self.zbarrier.state == "away" || self.zbarrier.state == "leaving")
	{
		if(self.zbarrier.state == "leaving")
		{
			self.zbarrier waittill("away");
		}
		if(!level.zombie_vars["zombie_powerup_fire_sale_on"])
		{
			return;
		}
		self.zbarrier function_415e922b("arriving");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2cbc21f
	Namespace: namespace_605a4f26
	Checksum: 0x96659542
	Offset: 0x20B0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 708
*/
function function_2cbc21f()
{
	if(self.zbarrier.state == "idle")
	{
		self.fire_sale = 0;
		if(!self.active)
		{
			thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
			self.zbarrier function_415e922b("leaving");
		}
	}
}

/*
	Name: function_e0bfd2c2
	Namespace: namespace_605a4f26
	Checksum: 0xC5023620
	Offset: 0x2128
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 731
*/
function function_e0bfd2c2(bgb)
{
	weapon = self function_4828057d(bgb);
	evt = self util::waittill_any_return("fake_death", "death", "player_downed", "weapon_change_complete", "perk_abort_drinking", "disconnect");
	if(self laststand::player_is_in_laststand() || (isdefined(self.intermission) && self.intermission))
	{
		zm_utility::enable_player_move_states();
		return;
	}
	self notify("hash_fcbbef99", bgb.name);
	self thread bgb::give(bgb.name);
	self function_82ed683b(weapon);
	if(bgb.var_c9e64d65 == 1)
	{
		self thread zm_audio::create_and_play_dialog("bgb", "buy");
		continue;
	}
	self thread zm_audio::create_and_play_dialog("bgb", "eat");
	return;
	bgb.var_0 = undefined;
}

/*
	Name: function_4828057d
	Namespace: namespace_605a4f26
	Checksum: 0x34F30C80
	Offset: 0x22B8
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 763
*/
function function_4828057d(bgb)
{
	self zm_utility::increment_is_drinking();
	self zm_utility::disable_player_move_states(1);
	original_weapon = self GetCurrentWeapon();
	var_37e7af81 = GetWeapon("zombie_bgb_grab");
	var_37e7af81 = self getbuildkitweapon(var_37e7af81, 0);
	weapon_options = self getbuildkitweaponoptions(var_37e7af81, bgb.camo_index);
	acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(var_37e7af81, 0);
	self GiveWeapon(var_37e7af81, weapon_options, acvi);
	self SwitchToWeapon(var_37e7af81);
	self playsound("zmb_bgb_powerup_default");
	return original_weapon;
}

/*
	Name: function_82ed683b
	Namespace: namespace_605a4f26
	Checksum: 0xB8ADF97A
	Offset: 0x2420
	Size: 0x230
	Parameters: 1
	Flags: None
	Line Number: 788
*/
function function_82ed683b(original_weapon)
{
	self endon("perk_abort_drinking");
	/#
		Assert(!original_weapon.isPerkBottle);
	#/
	/#
		Assert(original_weapon != level.weaponReviveTool);
	#/
	self zm_utility::enable_player_move_states();
	weapon = GetWeapon("zombie_bgb_grab");
	if(self laststand::player_is_in_laststand() || (isdefined(self.intermission) && self.intermission))
	{
		self TakeWeapon(weapon);
		return;
	}
	self TakeWeapon(weapon);
	if(self zm_utility::is_multiple_drinking())
	{
		self zm_utility::decrement_is_drinking();
		return;
	}
	else if(original_weapon != level.weaponNone && !zm_utility::is_placeable_mine(original_weapon) && !zm_equipment::is_equipment_that_blocks_purchase(original_weapon))
	{
		self zm_weapons::switch_back_primary_weapon(original_weapon);
		if(zm_utility::is_melee_weapon(original_weapon))
		{
			self zm_utility::decrement_is_drinking();
			return;
			continue;
		}
	}
	self zm_weapons::switch_back_primary_weapon();
	self waittill("weapon_change_complete");
	if(!self laststand::player_is_in_laststand() && (!(isdefined(self.intermission) && self.intermission)))
	{
		self zm_utility::decrement_is_drinking();
	}
}

/*
	Name: function_415e922b
	Namespace: namespace_605a4f26
	Checksum: 0xE442F7E4
	Offset: 0x2658
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 838
*/
function function_415e922b(state)
{
	for(i = 0; i < self getnumzbarrierpieces(); i++)
	{
		self hidezbarrierpiece(i);
	}
	self notify("zbarrier_state_change");
	self [[level.var_5a072535]](state);
}

/*
	Name: function_b2f238aa
	Namespace: namespace_605a4f26
	Checksum: 0xC40109E7
	Offset: 0x26E0
	Size: 0x290
	Parameters: 1
	Flags: None
	Line Number: 858
*/
function function_b2f238aa(state)
{
	self notify(state);
	self.state = state;
	switch(state)
	{
		case "away":
		{
			self ShowZBarrierPiece(1);
			self thread function_af73d05f();
			break;
		}
		case "arriving":
		{
			self ShowZBarrierPiece(1);
			self ShowZBarrierPiece(3);
			self thread function_df083b4();
			break;
		}
		case "idle":
		{
			self ShowZBarrierPiece(0);
			self ShowZBarrierPiece(3);
			self ShowZBarrierPiece(5);
			self thread function_ffdcd313();
			break;
		}
		case "dispense":
		{
			self ShowZBarrierPiece(2);
			self ShowZBarrierPiece(3);
			self ShowZBarrierPiece(4);
			self ShowZBarrierPiece(5);
			self thread function_58218d44();
			break;
		}
		case "bgb_taken":
		{
			self ShowZBarrierPiece(2);
			self ShowZBarrierPiece(3);
			self ShowZBarrierPiece(5);
			self thread function_6983b6d6();
			break;
		}
		case "leaving":
		{
			self ShowZBarrierPiece(1);
			self ShowZBarrierPiece(3);
			self thread function_dae69e9a();
			break;
			break;
		}
		default
		{
		}
	}
	return;
	~self.state;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_af73d05f
	Namespace: namespace_605a4f26
	Checksum: 0x79C48829
	Offset: 0x2978
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 929
*/
function function_af73d05f()
{
	self clientfield::set("bgb_set_state", 5);
}

/*
	Name: function_df083b4
	Namespace: namespace_605a4f26
	Checksum: 0x2E9AC718
	Offset: 0x29A8
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 944
*/
function function_df083b4()
{
	self SetZBarrierPieceState(1, "opening");
	self clientfield::set("bgb_set_state", 6);
	while(self GetZBarrierPieceState(1) == "opening")
	{
		wait(0.1);
	}
	self SetZBarrierPieceState(1, "closing");
	self SetZBarrierPieceState(3, "opening");
	while(self GetZBarrierPieceState(3) == "opening")
	{
		wait(0.1);
	}
	self function_415e922b("idle");
	thread zm_unitrigger::register_static_unitrigger(self.owner.unitrigger_stub, &function_1dbffc82);
}

/*
	Name: function_ffdcd313
	Namespace: namespace_605a4f26
	Checksum: 0x6F788790
	Offset: 0x2AE8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 972
*/
function function_ffdcd313()
{
	self SetZBarrierPieceState(3, "open");
	self clientfield::set("bgb_set_state", 1);
}

/*
	Name: function_58218d44
	Namespace: namespace_605a4f26
	Checksum: 0xF722FAD1
	Offset: 0x2B38
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 988
*/
function function_58218d44()
{
	self endon("hash_6983b6d6");
	self clientfield::set("bgb_set_limit_type", self.owner.var_d719e99b.var_c9e64d65);
	self clientfield::set("bgb_set_rarity", self.owner.var_d719e99b.var_d277f374);
	self SetZBarrierPieceState(4, "opening");
	self SetZBarrierPieceState(3, "open");
	self SetZBarrierPieceState(5, "open");
	self clientfield::set("bgb_set_state", 2);
	wait(2);
	self SetZBarrierPieceState(2, "opening");
	self hidezbarrierpiece(4);
	wait(1);
	self clientfield::set("bgb_set_state", 3);
	self notify("hash_30d089c4");
	wait(5.5);
	self clientfield::set("bgb_set_state", 1);
	wait(4);
	self notify("hash_fb19ac8e");
}

/*
	Name: function_6983b6d6
	Namespace: namespace_605a4f26
	Checksum: 0x1515E507
	Offset: 0x2CF8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1019
*/
function function_6983b6d6()
{
	self SetZBarrierPieceState(2, "closing");
	self SetZBarrierPieceState(3, "open");
	self SetZBarrierPieceState(5, "open");
	self clientfield::set("bgb_set_state", 1);
	wait(3);
	self notify("hash_fb19ac8e");
	return;
}

/*
	Name: function_dae69e9a
	Namespace: namespace_605a4f26
	Checksum: 0x9FDE1A78
	Offset: 0x2DA0
	Size: 0x104
	Parameters: 0
	Flags: None
	Line Number: 1040
*/
function function_dae69e9a()
{
	self SetZBarrierPieceState(1, "opening");
	self clientfield::set("bgb_set_state", 4);
	while(self GetZBarrierPieceState(1) == "opening")
	{
		wait(0.1);
	}
	self SetZBarrierPieceState(1, "closing");
	self SetZBarrierPieceState(3, "closing");
	while(self GetZBarrierPieceState(3) == "closing")
	{
		wait(0.1);
	}
	self function_415e922b("away");
}

