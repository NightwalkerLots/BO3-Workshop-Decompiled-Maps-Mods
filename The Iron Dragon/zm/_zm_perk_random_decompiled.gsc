#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;

#namespace zm_perk_random;

/*
	Name: __init__sytem__
	Namespace: zm_perk_random
	Checksum: 0x789AED8
	Offset: 0x6D0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 27
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_random", &__init__, &__main__, undefined);
	return;
	ERROR: Bad function call
}

/*
	Name: __init__
	Namespace: zm_perk_random
	Checksum: 0xA9CCC84C
	Offset: 0x718
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	level._random_zombie_perk_cost = 1500;
	clientfield::register("scriptmover", "perk_bottle_cycle_state", 5000, 2, "int");
	clientfield::register("zbarrier", "set_client_light_state", 5000, 2, "int");
	clientfield::register("zbarrier", "client_stone_emmissive_blink", 5000, 1, "int");
	clientfield::register("zbarrier", "init_perk_random_machine", 5000, 1, "int");
	clientfield::register("scriptmover", "turn_active_perk_light_green", 5000, 1, "int");
	clientfield::register("scriptmover", "turn_on_location_indicator", 5000, 1, "int");
	clientfield::register("zbarrier", "lightning_bolt_FX_toggle", 10000, 1, "int");
	clientfield::register("scriptmover", "turn_active_perk_ball_light", 5000, 1, "int");
	clientfield::register("scriptmover", "zone_captured", 5000, 1, "int");
	level._effect["perk_machine_light_yellow"] = "dlc1/castle/fx_wonder_fizz_light_yellow";
	level._effect["perk_machine_light_red"] = "dlc1/castle/fx_wonder_fizz_light_red";
	level._effect["perk_machine_light_green"] = "dlc1/castle/fx_wonder_fizz_light_green";
	level._effect["perk_machine_location"] = "fx/zombie/fx_wonder_fizz_lightning_all";
	level flag::init("machine_can_reset");
}

/*
	Name: __main__
	Namespace: zm_perk_random
	Checksum: 0x46C46C1A
	Offset: 0x970
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function __main__()
{
	if(!isdefined(level.perk_random_machine_count))
	{
		level.perk_random_machine_count = 1;
	}
	if(!isdefined(level.perk_random_machine_state_func))
	{
		level.perk_random_machine_state_func = &process_perk_random_machine_state;
	}
	/#
		level thread setup_devgui();
	#/
	level thread setup_perk_random_machines();
}

/*
	Name: setup_perk_random_machines
	Namespace: zm_perk_random
	Checksum: 0xA9384531
	Offset: 0x9E8
	Size: 0x80
	Parameters: 0
	Flags: Private
	Line Number: 99
*/
function private setup_perk_random_machines()
{
	waittillframeend;
	level.perk_bottle_weapon_array = ArrayCombine(level.machine_assets, level._custom_perks, 0, 1);
	level.perk_random_machines = GetEntArray("perk_random_machine", "targetname");
	level.perk_random_machine_count = level.perk_random_machines.size;
	perk_random_machine_init();
}

/*
	Name: perk_random_machine_init
	Namespace: zm_perk_random
	Checksum: 0xDB552FB4
	Offset: 0xA70
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 118
*/
function perk_random_machine_init()
{
	foreach(machine in level.perk_random_machines)
	{
		if(!isdefined(machine.cost))
		{
			machine.cost = 1500;
		}
		machine.current_perk_random_machine = 0;
		machine.uses_at_current_location = 0;
		machine create_perk_random_machine_unitrigger_stub();
		machine clientfield::set("init_perk_random_machine", 1);
		wait(0.5);
		machine thread set_perk_random_machine_state("power_off");
	}
	level.perk_random_machines = Array::randomize(level.perk_random_machines);
	init_starting_perk_random_machine_location();
}

/*
	Name: init_starting_perk_random_machine_location
	Namespace: zm_perk_random
	Checksum: 0xBD03BB95
	Offset: 0xBC8
	Size: 0x140
	Parameters: 0
	Flags: Private
	Line Number: 147
*/
function private init_starting_perk_random_machine_location()
{
	b_starting_machine_found = 0;
	for(i = 0; i < level.perk_random_machines.size; i++)
	{
		if(isdefined(level.perk_random_machines[i].script_noteworthy) && IsSubStr(level.perk_random_machines[i].script_noteworthy, "start_perk_random_machine") && (!(isdefined(b_starting_machine_found) && b_starting_machine_found)))
		{
			level.perk_random_machines[i].current_perk_random_machine = 1;
			level.perk_random_machines[i] thread machine_think();
			level.perk_random_machines[i] thread set_perk_random_machine_state("initial");
			b_starting_machine_found = 1;
			continue;
		}
		level.perk_random_machines[i] thread wait_for_power();
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: create_perk_random_machine_unitrigger_stub
	Namespace: zm_perk_random
	Checksum: 0x252E35D8
	Offset: 0xD10
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 176
*/
function create_perk_random_machine_unitrigger_stub()
{
	self.unitrigger_stub = spawnstruct();
	self.unitrigger_stub.script_width = 70;
	self.unitrigger_stub.script_height = 30;
	self.unitrigger_stub.script_length = 40;
	self.unitrigger_stub.origin = self.origin + AnglesToRight(self.angles) * self.unitrigger_stub.script_length + anglesToUp(self.angles) * self.unitrigger_stub.script_height / 2;
	self.unitrigger_stub.angles = self.angles;
	self.unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	self.unitrigger_stub.trigger_target = self;
	zm_unitrigger::unitrigger_force_per_player_triggers(self.unitrigger_stub, 1);
	self.unitrigger_stub.prompt_and_visibility_func = &perk_random_machine_trigger_update_prompt;
	self.unitrigger_stub.script_int = self.script_int;
	thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &perk_random_unitrigger_think);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: perk_random_machine_trigger_update_prompt
	Namespace: zm_perk_random
	Checksum: 0xD404FCA3
	Offset: 0xEA0
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 204
*/
function perk_random_machine_trigger_update_prompt(player)
{
	can_use = self perk_random_machine_stub_update_prompt(player);
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
	Name: perk_random_machine_stub_update_prompt
	Namespace: zm_perk_random
	Checksum: 0x4D139019
	Offset: 0xF38
	Size: 0x278
	Parameters: 1
	Flags: None
	Line Number: 229
*/
function perk_random_machine_stub_update_prompt(player)
{
	self setcursorhint("HINT_NOICON");
	if(!self trigger_visible_to_player(player))
	{
		return 0;
	}
	self.hint_parm1 = undefined;
	n_power_on = is_power_on(self.stub.script_int);
	if(!n_power_on)
	{
		self.hint_string = &"ZOMBIE_NEED_POWER";
		return 0;
	}
	else if(self.stub.trigger_target.state == "idle" || self.stub.trigger_target.state == "vending")
	{
		n_purchase_limit = player zm_utility::get_player_perk_purchase_limit();
		if(!player zm_utility::can_player_purchase_perk())
		{
			self.hint_string = &"ZOMBIE_RANDOM_PERK_TOO_MANY";
			if(isdefined(n_purchase_limit))
			{
				self.hint_parm1 = n_purchase_limit;
			}
			return 0;
		}
		else if(isdefined(self.stub.trigger_target.machine_user))
		{
			if(isdefined(self.stub.trigger_target.grab_perk_hint) && self.stub.trigger_target.grab_perk_hint)
			{
				self.hint_string = &"ZOMBIE_RANDOM_PERK_PICKUP";
				return 1;
				continue;
			}
			self.hint_string = "";
			return 0;
			continue;
		}
		n_purchase_limit = player zm_utility::get_player_perk_purchase_limit();
		if(!player zm_utility::can_player_purchase_perk())
		{
			self.hint_string = &"ZOMBIE_RANDOM_PERK_TOO_MANY";
			if(isdefined(n_purchase_limit))
			{
				self.hint_parm1 = n_purchase_limit;
			}
			return 0;
			continue;
		}
		self.hint_string = &"ZOMBIE_RANDOM_PERK_BUY";
		self.hint_parm1 = level._random_zombie_perk_cost;
		return 1;
		continue;
	}
	self.hint_string = &"ZOMBIE_RANDOM_PERK_ELSEWHERE";
	return 0;
}

/*
	Name: trigger_visible_to_player
	Namespace: zm_perk_random
	Checksum: 0x99821B
	Offset: 0x11B8
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 297
*/
function trigger_visible_to_player(player)
{
	self setinvisibletoplayer(player);
	visible = 1;
	if(isdefined(self.stub.trigger_target.machine_user))
	{
		if(player != self.stub.trigger_target.machine_user || zm_utility::is_placeable_mine(self.stub.trigger_target.machine_user GetCurrentWeapon()))
		{
			visible = 0;
		}
	}
	else if(!player can_buy_perk())
	{
		visible = 0;
	}
	if(!visible)
	{
		return 0;
	}
	if(player player_has_all_available_perks())
	{
		return 0;
	}
	self setvisibletoplayer(player);
	return 1;
}

/*
	Name: player_has_all_available_perks
	Namespace: zm_perk_random
	Checksum: 0x64129329
	Offset: 0x12E8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 334
*/
function player_has_all_available_perks()
{
	for(i = 0; i < level._random_perk_machine_perk_list.size; i++)
	{
		if(!self hasPerk(level._random_perk_machine_perk_list[i]))
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: can_buy_perk
	Namespace: zm_perk_random
	Checksum: 0xF97134F7
	Offset: 0x1348
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 356
*/
function can_buy_perk()
{
	if(isdefined(self.IS_DRINKING) && self.IS_DRINKING > 0)
	{
		return 0;
	}
	current_weapon = self GetCurrentWeapon();
	if(zm_utility::is_placeable_mine(current_weapon) || zm_equipment::is_equipment_that_blocks_purchase(current_weapon))
	{
		return 0;
	}
	if(self zm_utility::in_revive_trigger())
	{
		return 0;
	}
	if(current_weapon == level.weaponNone)
	{
		return 0;
	}
	return 1;
}

/*
	Name: perk_random_unitrigger_think
	Namespace: zm_perk_random
	Checksum: 0x80A81C05
	Offset: 0x13F8
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 388
*/
function perk_random_unitrigger_think(player)
{
	self endon("kill_trigger");
	while(1)
	{
		self waittill("trigger", player);
		self.stub.trigger_target notify("trigger", player);
	}
}

/*
	Name: machine_think
	Namespace: zm_perk_random
	Checksum: 0x4CC80DB
	Offset: 0x1458
	Size: 0x670
	Parameters: 0
	Flags: None
	Line Number: 408
*/
function machine_think()
{
	level notify("machine_think");
	level endon("machine_think");
	self.num_time_used = 0;
	self.num_til_moved = randomIntRange(3, 7);
	if(self.state !== "initial" || "idle")
	{
		self thread set_perk_random_machine_state("arrive");
		self waittill("arrived");
		self thread set_perk_random_machine_state("initial");
		wait(1);
	}
	if(isdefined(level.zm_custom_perk_random_power_flag))
	{
		level flag::wait_till(level.zm_custom_perk_random_power_flag);
	}
	else
	{
		wait(1);
	}
	while(!is_power_on(self.script_int))
	{
	}
	self thread set_perk_random_machine_state("idle");
	if(isdefined(level.bottle_spawn_location))
	{
		level.bottle_spawn_location delete();
	}
	level.bottle_spawn_location = spawn("script_model", self.origin);
	level.bottle_spawn_location SetModel("tag_origin");
	level.bottle_spawn_location.angles = self.angles;
	level.bottle_spawn_location.origin = level.bottle_spawn_location.origin + VectorScale((0, 0, 1), 65);
	while(1)
	{
		self waittill("trigger", player);
		level flag::clear("machine_can_reset");
		if(!player zm_score::can_player_purchase(level._random_zombie_perk_cost))
		{
			self playsound("evt_perk_deny");
			continue;
		}
		self.machine_user = player;
		self.num_time_used++;
		player zm_stats::increment_client_stat("use_perk_random");
		player zm_stats::increment_player_stat("use_perk_random");
		player zm_score::minus_to_player_score(level._random_zombie_perk_cost);
		self thread set_perk_random_machine_state("vending");
		if(isdefined(level.perk_random_vo_func_usemachine) && isdefined(player))
		{
			player thread [[level.perk_random_vo_func_usemachine]]();
		}
		while(1)
		{
			random_perk = get_weighted_random_perk(player);
			self playsound("zmb_rand_perk_start");
			self PlayLoopSound("zmb_rand_perk_loop", 1);
			wait(1);
			self notify("bottle_spawned");
			self thread start_perk_bottle_cycling();
			self thread perk_bottle_motion();
			model = get_perk_weapon_model(random_perk);
			wait(3);
			self notify("done_cycling");
			if(self.num_time_used >= self.num_til_moved && level.perk_random_machine_count > 1)
			{
				level.bottle_spawn_location SetModel("wpn_t7_zmb_perk_bottle_bear_world");
				self StopLoopSound(0.5);
				self thread set_perk_random_machine_state("leaving");
				wait(3);
				player zm_score::add_to_player_score(level._random_zombie_perk_cost);
				level.bottle_spawn_location SetModel("tag_origin");
				self thread machine_selector();
				self clientfield::set("lightning_bolt_FX_toggle", 0);
				self.machine_user = undefined;
				break;
				continue;
			}
			level.bottle_spawn_location SetModel(model);
			self playsound("zmb_rand_perk_bottle");
			self.grab_perk_hint = 1;
			self thread grab_check(player, random_perk);
			self thread time_out_check();
			self util::waittill_either("grab_check", "time_out_check");
			self.grab_perk_hint = 0;
			self playsound("zmb_rand_perk_stop");
			self StopLoopSound(0.5);
			self.machine_user = undefined;
			level.bottle_spawn_location SetModel("tag_origin");
			self thread set_perk_random_machine_state("idle");
			break;
		}
		level flag::wait_till("machine_can_reset");
	}
}

/*
	Name: grab_check
	Namespace: zm_perk_random
	Checksum: 0x3E2712E7
	Offset: 0x1AD0
	Size: 0x268
	Parameters: 2
	Flags: None
	Line Number: 514
*/
function grab_check(player, random_perk)
{
	self endon("time_out_check");
	perk_is_bought = 0;
	while(!perk_is_bought)
	{
		self waittill("trigger", e_triggerer);
		if(e_triggerer == player)
		{
			if(isdefined(player.IS_DRINKING) && player.IS_DRINKING > 0)
			{
				wait(0.1);
				continue;
			}
			if(player zm_utility::can_player_purchase_perk())
			{
				perk_is_bought = 1;
				continue;
			}
			self playsound("evt_perk_deny");
			self notify("time_out_or_perk_grab");
			return;
		}
	}
	player zm_stats::increment_client_stat("grabbed_from_perk_random");
	player zm_stats::increment_player_stat("grabbed_from_perk_random");
	player thread monitor_when_player_acquires_perk();
	self notify("grab_check");
	self notify("time_out_or_perk_grab");
	player notify("perk_purchased", random_perk);
	gun = player zm_perks::perk_give_bottle_begin(random_perk);
	evt = player util::waittill_any_ex("fake_death", "death", "player_downed", "weapon_change_complete", self, "time_out_check");
	if(evt == "weapon_change_complete")
	{
		player thread zm_perks::wait_give_perk(random_perk, 1);
	}
	player zm_perks::perk_give_bottle_end(gun, random_perk);
	if(!(isdefined(player.has_drunk_wunderfizz) && player.has_drunk_wunderfizz))
	{
		player.has_drunk_wunderfizz = 1;
	}
}

/*
	Name: monitor_when_player_acquires_perk
	Namespace: zm_perk_random
	Checksum: 0x9A761491
	Offset: 0x1D40
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 567
*/
function monitor_when_player_acquires_perk()
{
	self util::waittill_any("perk_acquired", "death_or_disconnect", "player_downed");
	level flag::set("machine_can_reset");
}

/*
	Name: time_out_check
	Namespace: zm_perk_random
	Checksum: 0x9302CBE
	Offset: 0x1DA0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 583
*/
function time_out_check()
{
	self endon("grab_check");
	wait(10);
	self notify("time_out_check");
	level flag::set("machine_can_reset");
}

/*
	Name: wait_for_power
	Namespace: zm_perk_random
	Checksum: 0xE518AFFD
	Offset: 0x1DF0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 601
*/
function wait_for_power()
{
	if(isdefined(self.script_int))
	{
		str_wait = "power_on" + self.script_int;
		level flag::wait_till(str_wait);
	}
	else if(isdefined(level.zm_custom_perk_random_power_flag))
	{
		level flag::wait_till(level.zm_custom_perk_random_power_flag);
		continue;
	}
	level flag::wait_till("power_on");
	self thread set_perk_random_machine_state("away");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: machine_selector
	Namespace: zm_perk_random
	Checksum: 0xC8BBBDCE
	Offset: 0x1EB0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 629
*/
function machine_selector()
{
	if(level.perk_random_machines.size == 1)
	{
		new_machine = level.perk_random_machines[0];
		new_machine thread machine_think();
	}
	else
	{
		new_machine = level.perk_random_machines[RandomInt(level.perk_random_machines.size)];
		new_machine.current_perk_random_machine = 1;
		self.current_perk_random_machine = 0;
		wait(10);
		new_machine thread machine_think();
		return;
	}
	do
	{
	}
	while(!new_machine.current_perk_random_machine == 1);
	ERROR: Exception occured: Stack empty.
}

/*
	Name: include_perk_in_random_rotation
	Namespace: zm_perk_random
	Checksum: 0x81F5656D
	Offset: 0x1F80
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 662
*/
function include_perk_in_random_rotation(perk)
{
	if(!isdefined(level._random_perk_machine_perk_list))
	{
		level._random_perk_machine_perk_list = [];
	}
	if(!isdefined(level._random_perk_machine_perk_list))
	{
		level._random_perk_machine_perk_list = [];
	}
	else if(!IsArray(level._random_perk_machine_perk_list))
	{
		level._random_perk_machine_perk_list = Array(level._random_perk_machine_perk_list);
	}
	level._random_perk_machine_perk_list[level._random_perk_machine_perk_list.size] = perk;
}

/*
	Name: get_weighted_random_perk
	Namespace: zm_perk_random
	Checksum: 0xC1B481E4
	Offset: 0x2020
	Size: 0x150
	Parameters: 1
	Flags: None
	Line Number: 689
*/
function get_weighted_random_perk(player)
{
	keys = Array::randomize(getArrayKeys(level._random_perk_machine_perk_list));
	if(isdefined(level.custom_random_perk_weights))
	{
		keys = player [[level.custom_random_perk_weights]]();
	}
	/#
		forced_perk = GetDvarString("Dev Block strings are not supported");
		if(forced_perk != "Dev Block strings are not supported" && isdefined(level._random_perk_machine_perk_list[forced_perk]))
		{
			ArrayInsert(keys, forced_perk, 0);
		}
	#/
	for(i = 0; i < keys.size; i++)
	{
		if(player hasPerk(level._random_perk_machine_perk_list[keys[i]]))
		{
			continue;
			continue;
		}
		return level._random_perk_machine_perk_list[keys[i]];
	}
	return level._random_perk_machine_perk_list[keys[0]];
}

/*
	Name: perk_bottle_motion
	Namespace: zm_perk_random
	Checksum: 0xA751D41D
	Offset: 0x2178
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 725
*/
function perk_bottle_motion()
{
	putOutTime = 3;
	putBackTime = 10;
	v_float = AnglesToForward(self.angles - (0, 90, 0)) * 10;
	level.bottle_spawn_location.origin = self.origin + (0, 0, 53);
	level.bottle_spawn_location.angles = self.angles;
	level.bottle_spawn_location.origin = level.bottle_spawn_location.origin - v_float;
	level.bottle_spawn_location moveto(level.bottle_spawn_location.origin + v_float, putOutTime, putOutTime * 0.5);
	level.bottle_spawn_location.angles = level.bottle_spawn_location.angles + (0, 0, 10);
	level.bottle_spawn_location RotateYaw(720, putOutTime, putOutTime * 0.5);
	self waittill("done_cycling");
	level.bottle_spawn_location.angles = self.angles;
	level.bottle_spawn_location moveto(level.bottle_spawn_location.origin - v_float, putBackTime, putBackTime * 0.5);
	level.bottle_spawn_location RotateYaw(90, putBackTime, putBackTime * 0.5);
}

/*
	Name: start_perk_bottle_cycling
	Namespace: zm_perk_random
	Checksum: 0xE7AA5A8B
	Offset: 0x2388
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 752
*/
function start_perk_bottle_cycling()
{
	self endon("done_cycling");
	array_key = getArrayKeys(level.perk_bottle_weapon_array);
	timer = 0;
	while(1)
	{
		for(i = 0; i < array_key.size; i++)
		{
			if(isdefined(level.perk_bottle_weapon_array[array_key[i]].weapon))
			{
				model = GetWeaponModel(level.perk_bottle_weapon_array[array_key[i]].weapon);
				continue;
			}
			model = GetWeaponModel(level.perk_bottle_weapon_array[array_key[i]].perk_bottle_weapon);
			level.bottle_spawn_location SetModel(model);
			wait(0.2);
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: get_perk_weapon_model
	Namespace: zm_perk_random
	Checksum: 0xEFB9F55E
	Offset: 0x24C8
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 786
*/
function get_perk_weapon_model(perk)
{
	weapon = level.machine_assets[perk].weapon;
	if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].perk_bottle_weapon))
	{
		weapon = level._custom_perks[perk].perk_bottle_weapon;
	}
	return GetWeaponModel(weapon);
}

/*
	Name: perk_random_vending
	Namespace: zm_perk_random
	Checksum: 0x3AEAE60E
	Offset: 0x2568
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 806
*/
function perk_random_vending()
{
	self clientfield::set("client_stone_emmissive_blink", 1);
	self thread perk_random_loop_anim(5, "opening", "opening");
	self thread perk_random_loop_anim(3, "closing", "closing");
	self thread perk_random_vend_sfx();
	self notify("vending");
	self waittill("bottle_spawned");
	self SetZBarrierPieceState(4, "opening");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: perk_random_loop_anim
	Namespace: zm_perk_random
	Checksum: 0x4524B0FA
	Offset: 0x2640
	Size: 0xE8
	Parameters: 3
	Flags: None
	Line Number: 829
*/
function perk_random_loop_anim(n_piece, s_anim_1, s_anim_2)
{
	self endon("zbarrier_state_change");
	current_state = self.state;
	while(self.state == current_state)
	{
		self SetZBarrierPieceState(n_piece, s_anim_1);
		while(self GetZBarrierPieceState(n_piece) == s_anim_1)
		{
			wait(0.05);
		}
		self SetZBarrierPieceState(n_piece, s_anim_2);
		while(self GetZBarrierPieceState(n_piece) == s_anim_2)
		{
			wait(0.05);
		}
	}
}

/*
	Name: perk_random_vend_sfx
	Namespace: zm_perk_random
	Checksum: 0xCDA53A7D
	Offset: 0x2730
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 858
*/
function perk_random_vend_sfx()
{
	self PlayLoopSound("zmb_rand_perk_sparks");
	level.bottle_spawn_location PlayLoopSound("zmb_rand_perk_vortex");
	self waittill("zbarrier_state_change");
	self StopLoopSound();
	level.bottle_spawn_location StopLoopSound();
}

/*
	Name: perk_random_initial
	Namespace: zm_perk_random
	Checksum: 0x99D216BC
	Offset: 0x27B8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 877
*/
function perk_random_initial()
{
	self SetZBarrierPieceState(3, "opening");
}

/*
	Name: perk_random_idle
	Namespace: zm_perk_random
	Checksum: 0xA1FFD589
	Offset: 0x27E8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 892
*/
function perk_random_idle()
{
	self clientfield::set("client_stone_emmissive_blink", 0);
	if(isdefined(level.perk_random_idle_effects_override))
	{
		self [[level.perk_random_idle_effects_override]]();
		continue;
	}
	self clientfield::set("lightning_bolt_FX_toggle", 1);
	while(self.state == "idle")
	{
		wait(0.05);
	}
	self clientfield::set("lightning_bolt_FX_toggle", 0);
}

/*
	Name: perk_random_arrive
	Namespace: zm_perk_random
	Checksum: 0x9D6794F3
	Offset: 0x2898
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 918
*/
function perk_random_arrive()
{
	while(self GetZBarrierPieceState(0) == "opening")
	{
		wait(0.05);
	}
	self notify("arrived");
}

/*
	Name: perk_random_leaving
	Namespace: zm_perk_random
	Checksum: 0xC4452688
	Offset: 0x28E8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 937
*/
function perk_random_leaving()
{
	while(self GetZBarrierPieceState(0) == "closing")
	{
		wait(0.05);
	}
	wait(0.05);
	self thread set_perk_random_machine_state("away");
}

/*
	Name: set_perk_random_machine_state
	Namespace: zm_perk_random
	Checksum: 0x757709AA
	Offset: 0x2950
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 957
*/
function set_perk_random_machine_state(state)
{
	wait(0.1);
	for(i = 0; i < self getnumzbarrierpieces(); i++)
	{
		self hidezbarrierpiece(i);
	}
	self notify("zbarrier_state_change");
	self [[level.perk_random_machine_state_func]](state);
}

/*
	Name: process_perk_random_machine_state
	Namespace: zm_perk_random
	Checksum: 0x733457F5
	Offset: 0x29E0
	Size: 0x4A0
	Parameters: 1
	Flags: None
	Line Number: 978
*/
function process_perk_random_machine_state(state)
{
	switch(state)
	{
		case "arrive":
		{
			self ShowZBarrierPiece(0);
			self ShowZBarrierPiece(1);
			self SetZBarrierPieceState(0, "opening");
			self SetZBarrierPieceState(1, "opening");
			self clientfield::set("set_client_light_state", 1);
			self thread perk_random_arrive();
			self.state = "arrive";
			break;
		}
		case "idle":
		{
			self ShowZBarrierPiece(5);
			self ShowZBarrierPiece(2);
			self SetZBarrierPieceState(2, "opening");
			self clientfield::set("set_client_light_state", 1);
			self.state = "idle";
			self thread perk_random_idle();
			break;
		}
		case "power_off":
		{
			self ShowZBarrierPiece(2);
			self SetZBarrierPieceState(2, "closing");
			self clientfield::set("set_client_light_state", 0);
			self.state = "power_off";
			break;
		}
		case "vending":
		{
			self ShowZBarrierPiece(5);
			self ShowZBarrierPiece(3);
			self ShowZBarrierPiece(4);
			self clientfield::set("set_client_light_state", 1);
			self.state = "vending";
			self thread perk_random_vending();
			break;
		}
		case "leaving":
		{
			self ShowZBarrierPiece(1);
			self ShowZBarrierPiece(0);
			self SetZBarrierPieceState(0, "closing");
			self SetZBarrierPieceState(1, "closing");
			self clientfield::set("set_client_light_state", 3);
			self thread perk_random_leaving();
			self.state = "leaving";
			break;
		}
		case "away":
		{
			self ShowZBarrierPiece(2);
			self SetZBarrierPieceState(2, "closing");
			self clientfield::set("set_client_light_state", 3);
			self.state = "away";
			break;
		}
		case "initial":
		{
			self ShowZBarrierPiece(3);
			self SetZBarrierPieceState(3, "opening");
			self ShowZBarrierPiece(5);
			self clientfield::set("set_client_light_state", 0);
			self.state = "initial";
			break;
		}
		default
		{
			if(isdefined(level.custom_perk_random_state_handler))
			{
				self [[level.custom_perk_random_state_handler]](state);
				break;
			}
		}
	}
}

/*
	Name: machine_sounds
	Namespace: zm_perk_random
	Checksum: 0x9EFE738
	Offset: 0x2E88
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 1070
*/
function machine_sounds()
{
	level endon("machine_think");
	while(1)
	{
		level waittill("pmstrt");
		rndprk_ent = spawn("script_origin", self.origin);
		rndprk_ent stopsounds();
		state_switch = level util::waittill_any_return("pmstop", "pmmove", "machine_think");
		rndprk_ent StopLoopSound(1);
		if(state_switch == "pmstop")
		{
			continue;
		}
		rndprk_ent delete();
	}
}

/*
	Name: GetWeaponModel
	Namespace: zm_perk_random
	Checksum: 0xE8739B53
	Offset: 0x2F78
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 1098
*/
function GetWeaponModel(weapon)
{
	return weapon.worldmodel;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: is_power_on
	Namespace: zm_perk_random
	Checksum: 0x6BA80A00
	Offset: 0x2FA0
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 1114
*/
function is_power_on(n_power_index)
{
	if(isdefined(n_power_index))
	{
		str_power = "power_on" + n_power_index;
		n_power_on = level flag::get(str_power);
	}
	else if(isdefined(level.zm_custom_perk_random_power_flag))
	{
		n_power_on = level flag::get(level.zm_custom_perk_random_power_flag);
		continue;
	}
	n_power_on = level flag::get("power_on");
	return n_power_on;
}

/*
	Name: setup_devgui
	Namespace: zm_perk_random
	Checksum: 0xB8485B1C
	Offset: 0x3060
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1140
*/
function setup_devgui()
{
	/#
		level.perk_random_devgui_callback = &wunderfizz_devgui_callback;
		return;
	#/
}

/*
	Name: wunderfizz_devgui_callback
	Namespace: zm_perk_random
	Checksum: 0xF70EECF2
	Offset: 0x3088
	Size: 0x1D6
	Parameters: 1
	Flags: None
	Line Number: 1158
*/
function wunderfizz_devgui_callback(cmd)
{
	/#
		players = GetPlayers();
		a_e_wunderfizzes = GetEntArray("Dev Block strings are not supported", "Dev Block strings are not supported");
		e_wunderfizz = ArrayGetClosest(GetPlayers()[0].origin, a_e_wunderfizzes);
		switch(cmd)
		{
			case "Dev Block strings are not supported":
			{
				e_wunderfizz thread set_perk_random_machine_state("Dev Block strings are not supported");
				break;
			}
			case "Dev Block strings are not supported":
			{
				e_wunderfizz thread set_perk_random_machine_state("Dev Block strings are not supported");
				break;
			}
			case "Dev Block strings are not supported":
			{
				e_wunderfizz thread set_perk_random_machine_state("Dev Block strings are not supported");
				e_wunderfizz notify("bottle_spawned");
				break;
			}
			case "Dev Block strings are not supported":
			{
				e_wunderfizz thread set_perk_random_machine_state("Dev Block strings are not supported");
				break;
			}
			case "Dev Block strings are not supported":
			{
				e_wunderfizz thread set_perk_random_machine_state("Dev Block strings are not supported");
				break;
			}
			case "Dev Block strings are not supported":
			{
				e_wunderfizz thread set_perk_random_machine_state("Dev Block strings are not supported");
				break;
			}
			case "Dev Block strings are not supported":
			{
				e_wunderfizz thread set_perk_random_machine_state("Dev Block strings are not supported");
				break;
			}
		}
	#/
}

