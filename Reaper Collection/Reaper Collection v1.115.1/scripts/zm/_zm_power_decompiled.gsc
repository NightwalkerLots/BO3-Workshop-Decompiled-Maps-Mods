#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_utility;

#namespace zm_power;

/*
	Name: __init__sytem__
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x360
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 25
*/
function autoexec __init__sytem__()
{
	system::register("zm_power", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x3A8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function __init__()
{
	level.powered_items = [];
	level.local_power = [];
}

/*
	Name: __main__
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x3D0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function __main__()
{
	thread standard_powered_items();
	level thread electric_switch_init();
}

/*
	Name: electric_switch_init
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x408
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function electric_switch_init()
{
	trigs = GetEntArray("use_elec_switch", "targetname");
	if(isdefined(level.temporary_power_switch_logic))
	{
		Array::thread_all(trigs, level.temporary_power_switch_logic, trigs);
	}
	else
	{
		Array::thread_all(trigs, &electric_switch, trigs);
	}
}

/*
	Name: electric_switch
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x498
	Size: 0x558
	Parameters: 1
	Flags: None
	Line Number: 95
*/
function electric_switch(switch_array)
{
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.target))
	{
		ent_parts = GetEntArray(self.target, "targetname");
		struct_parts = struct::get_array(self.target, "targetname");
		foreach(ent in ent_parts)
		{
			if(isdefined(ent.script_noteworthy) && ent.script_noteworthy == "elec_switch")
			{
				master_switch = ent;
				master_switch notsolid();
			}
		}
		foreach(struct in struct_parts)
		{
			if(isdefined(struct.script_noteworthy) && struct.script_noteworthy == "elec_switch_fx")
			{
				fx_pos = struct;
			}
		}
	}
	while(isdefined(self))
	{
		self setHintString(&"ZOMBIE_ELECTRIC_SWITCH");
		self setvisibletoall();
		self waittill("trigger", User);
		self SetInvisibleToAll();
		if(isdefined(master_switch))
		{
			master_switch RotateRoll(-90, 0.3);
			master_switch playsound("zmb_switch_flip");
		}
		power_zone = undefined;
		if(isdefined(self.script_int))
		{
			power_zone = self.script_int;
		}
		level thread zm_perks::perk_unpause_all_perks(power_zone);
		if(isdefined(master_switch))
		{
			master_switch waittill("rotatedone");
			playFX(level._effect["switch_sparks"], fx_pos.origin);
			master_switch playsound("zmb_turn_on");
		}
		level turn_power_on_and_open_doors(power_zone);
		switchEntNum = self GetEntityNumber();
		if(isdefined(switchEntNum) && isdefined(User))
		{
			User RecordMapEvent(17, GetTime(), User.origin, level.round_number, switchEntNum);
		}
		if(!isdefined(self.script_noteworthy) || self.script_noteworthy != "allow_power_off")
		{
			self delete();
			return;
		}
		self setHintString(&"ZOMBIE_ELECTRIC_SWITCH_OFF");
		self setvisibletoall();
		self waittill("trigger", User);
		self SetInvisibleToAll();
		if(isdefined(master_switch))
		{
			master_switch RotateRoll(90, 0.3);
			master_switch playsound("zmb_switch_flip");
		}
		level thread zm_perks::perk_pause_all_perks(power_zone);
		if(isdefined(master_switch))
		{
			master_switch waittill("rotatedone");
		}
		if(isdefined(switchEntNum) && isdefined(User))
		{
			User RecordMapEvent(18, GetTime(), User.origin, level.round_number, switchEntNum);
		}
		level turn_power_off_and_close_doors(power_zone);
	}
}

/*
	Name: watch_global_power
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x9F8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 187
*/
function watch_global_power()
{
	while(1)
	{
		level flag::wait_till("power_on");
		level thread set_global_power(1);
		level flag::wait_till_clear("power_on");
		level thread set_global_power(0);
	}
}

/*
	Name: standard_powered_items
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0xA80
	Size: 0x3C0
	Parameters: 0
	Flags: None
	Line Number: 208
*/
function standard_powered_items()
{
	level flag::wait_till("start_zombie_round_logic");
	wait(1);
	level flag::wait_till("reap_collection_loaded");
	wait(2);
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	foreach(trigger in vending_triggers)
	{
		powered_on = zm_perks::get_perk_machine_start_state(trigger.script_noteworthy);
		powered_perk = add_powered_item(&perk_power_on, &perk_power_off, &perk_range, &cost_low_if_local, 0, powered_on, trigger);
		if(isdefined(trigger.script_int))
		{
			powered_perk thread zone_controlled_perk(trigger.script_int);
		}
	}
	zombie_doors = GetEntArray("zombie_door", "targetname");
	foreach(door in zombie_doors)
	{
		if(isdefined(door.script_noteworthy) && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door"))
		{
			add_powered_item(&door_power_on, &door_power_off, &door_range, &cost_door, 0, 0, door);
			continue;
		}
		if(isdefined(door.script_noteworthy) && door.script_noteworthy == "local_electric_door")
		{
			power_sources = 0;
			if(!(isdefined(level.power_local_doors_globally) && level.power_local_doors_globally))
			{
				power_sources = 1;
			}
			add_powered_item(&door_local_power_on, &door_local_power_off, &door_range, &cost_door, power_sources, 0, door);
		}
	}
	thread watch_global_power();
	return;
}

/*
	Name: zone_controlled_perk
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0xE48
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 256
*/
function zone_controlled_perk(zone)
{
	while(1)
	{
		power_flag = "power_on" + zone;
		level flag::wait_till(power_flag);
		self thread perk_power_on();
		level flag::wait_till_clear(power_flag);
		self thread perk_power_off();
	}
}

/*
	Name: add_powered_item
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0xEE0
	Size: 0x138
	Parameters: 7
	Flags: None
	Line Number: 278
*/
function add_powered_item(power_on_func, power_off_func, range_func, cost_func, power_sources, self_powered, target)
{
	powered = spawnstruct();
	powered.power_on_func = power_on_func;
	powered.power_off_func = power_off_func;
	powered.range_func = range_func;
	powered.power_sources = power_sources;
	powered.self_powered = self_powered;
	powered.target = target;
	powered.cost_func = cost_func;
	powered.power = self_powered;
	powered.powered_count = self_powered;
	powered.depowered_count = 0;
	level.powered_items[level.powered_items.size] = powered;
	return powered;
	continue;
}

/*
	Name: remove_powered_item
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1020
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 306
*/
function remove_powered_item(powered)
{
	ArrayRemoveValue(level.powered_items, powered, 0);
}

/*
	Name: add_temp_powered_item
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1058
	Size: 0x1C8
	Parameters: 7
	Flags: None
	Line Number: 321
*/
function add_temp_powered_item(power_on_func, power_off_func, range_func, cost_func, power_sources, self_powered, target)
{
	powered = add_powered_item(power_on_func, power_off_func, range_func, cost_func, power_sources, self_powered, target);
	if(isdefined(level.local_power))
	{
		foreach(localpower in level.local_power)
		{
			if(powered [[powered.range_func]](1, localpower.origin, localpower.radius))
			{
				powered change_power(1, localpower.origin, localpower.radius);
				if(!isdefined(localpower.added_list))
				{
					localpower.added_list = [];
				}
				localpower.added_list[localpower.added_list.size] = powered;
			}
		}
	}
	thread watch_temp_powered_item(powered);
	return powered;
}

/*
	Name: watch_temp_powered_item
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1228
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 353
*/
function watch_temp_powered_item(powered)
{
	powered.target waittill("death");
	remove_powered_item(powered);
	if(isdefined(level.local_power))
	{
		foreach(localpower in level.local_power)
		{
			if(isdefined(localpower.added_list))
			{
				ArrayRemoveValue(localpower.added_list, powered, 0);
			}
			if(isdefined(localpower.enabled_list))
			{
				ArrayRemoveValue(localpower.enabled_list, powered, 0);
			}
		}
	}
}

/*
	Name: change_power_in_radius
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1360
	Size: 0xF0
	Parameters: 3
	Flags: None
	Line Number: 383
*/
function change_power_in_radius(delta, origin, radius)
{
	changed_list = [];
	for(i = 0; i < level.powered_items.size; i++)
	{
		powered = level.powered_items[i];
		if(powered.power_sources != 2)
		{
			if(powered [[powered.range_func]](delta, origin, radius))
			{
				powered change_power(delta, origin, radius);
				changed_list[changed_list.size] = powered;
			}
		}
	}
	return changed_list;
}

/*
	Name: change_power
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1458
	Size: 0xA8
	Parameters: 3
	Flags: None
	Line Number: 411
*/
function change_power(delta, origin, radius)
{
	if(delta > 0)
	{
		if(!self.power)
		{
			self.power = 1;
			self [[self.power_on_func]](origin, radius);
		}
		self.powered_count++;
	}
	else if(delta < 0)
	{
		if(self.power)
		{
			self.power = 0;
			self [[self.power_off_func]](origin, radius);
		}
		self.depowered_count++;
	}
}

/*
	Name: revert_power_to_list
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1508
	Size: 0x88
	Parameters: 4
	Flags: None
	Line Number: 443
*/
function revert_power_to_list(delta, origin, radius, powered_list)
{
	for(i = 0; i < powered_list.size; i++)
	{
		powered = powered_list[i];
		powered revert_power(delta, origin, radius);
	}
}

/*
	Name: revert_power
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1598
	Size: 0x130
	Parameters: 4
	Flags: None
	Line Number: 462
*/
function revert_power(delta, origin, radius, powered_list)
{
	if(delta > 0)
	{
		self.depowered_count--;
		/#
			fallback_initiated::Assert(self.depowered_count >= 0, "Dev Block strings are not supported");
		#/
		if(self.depowered_count == 0 && self.powered_count > 0 && !self.power)
		{
			self.power = 1;
			self [[self.power_on_func]](origin, radius);
		}
	}
	else if(delta < 0)
	{
		self.powered_count--;
		/#
			fallback_initiated::Assert(self.powered_count >= 0, "Dev Block strings are not supported");
		#/
		if(self.powered_count == 0 && self.power)
		{
			self.power = 0;
			self [[self.power_off_func]](origin, radius);
		}
	}
}

/*
	Name: add_local_power
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x16D0
	Size: 0xA0
	Parameters: 2
	Flags: None
	Line Number: 500
*/
function add_local_power(origin, radius)
{
	localpower = spawnstruct();
	localpower.origin = origin;
	localpower.radius = radius;
	localpower.enabled_list = change_power_in_radius(1, origin, radius);
	level.local_power[level.local_power.size] = localpower;
	return localpower;
}

/*
	Name: move_local_power
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1778
	Size: 0x1E0
	Parameters: 2
	Flags: None
	Line Number: 520
*/
function move_local_power(localpower, origin)
{
	changed_list = [];
	for(i = 0; i < level.powered_items.size; i++)
	{
		powered = level.powered_items[i];
		if(powered.power_sources == 2)
		{
			continue;
		}
		waspowered = IsInArray(localpower.enabled_list, powered);
		ispowered = powered [[powered.range_func]](1, origin, localpower.radius);
		if(ispowered && !waspowered)
		{
			powered change_power(1, origin, localpower.radius);
			localpower.enabled_list[localpower.enabled_list.size] = powered;
			continue;
		}
		if(!ispowered && waspowered)
		{
			powered revert_power(-1, localpower.origin, localpower.radius, localpower.enabled_list);
			ArrayRemoveValue(localpower.enabled_list, powered, 0);
		}
	}
	localpower.origin = origin;
	return localpower;
}

/*
	Name: end_local_power
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1960
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 558
*/
function end_local_power(localpower)
{
	if(isdefined(localpower.enabled_list))
	{
		revert_power_to_list(-1, localpower.origin, localpower.radius, localpower.enabled_list);
	}
	localpower.enabled_list = undefined;
	if(isdefined(localpower.added_list))
	{
		revert_power_to_list(-1, localpower.origin, localpower.radius, localpower.added_list);
	}
	localpower.added_list = undefined;
	ArrayRemoveValue(level.local_power, localpower, 0);
	return;
	localpower.var_0 = undefined;
}

/*
	Name: has_local_power
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1A50
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 585
*/
function has_local_power(origin)
{
	if(isdefined(level.local_power))
	{
		foreach(localpower in level.local_power)
		{
			if(DistanceSquared(localpower.origin, origin) < localpower.radius * localpower.radius)
			{
				return 1;
			}
		}
	}
	return 0;
}

/*
	Name: get_powered_item_cost
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1B28
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 610
*/
function get_powered_item_cost()
{
	if(!(isdefined(self.power) && self.power))
	{
		return 0;
	}
	if(isdefined(level._power_global) && level._power_global && !self.power_sources == 1)
	{
		return 0;
	}
	cost = [[self.cost_func]]();
	power_sources = self.powered_count;
	if(power_sources < 1)
	{
		power_sources = 1;
	}
	return cost / power_sources;
}

/*
	Name: get_local_power_cost
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1BD0
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 639
*/
function get_local_power_cost(localpower)
{
	cost = 0;
	if(isdefined(localpower) && isdefined(localpower.enabled_list))
	{
		foreach(powered in localpower.enabled_list)
		{
			cost = cost + powered get_powered_item_cost();
		}
	}
	else if(isdefined(localpower) && isdefined(localpower.added_list))
	{
		foreach(powered in localpower.added_list)
		{
			cost = cost + powered get_powered_item_cost();
		}
	}
	return cost;
}

/*
	Name: set_global_power
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1D60
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 669
*/
function set_global_power(on_off)
{
	demo::bookmark("zm_power", GetTime(), undefined, undefined, 1);
	level._power_global = on_off;
	for(i = 0; i < level.powered_items.size; i++)
	{
		powered = level.powered_items[i];
		if(isdefined(powered.target) && powered.power_sources != 1)
		{
			powered global_power(on_off);
			util::wait_network_frame();
		}
	}
}

/*
	Name: global_power
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1E40
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 694
*/
function global_power(on_off)
{
	if(on_off)
	{
		if(!self.power)
		{
			self.power = 1;
			self [[self.power_on_func]]();
		}
		self.powered_count++;
	}
	else
	{
		self.powered_count--;
		/#
			fallback_initiated::Assert(self.powered_count >= 0, "Dev Block strings are not supported");
		#/
		if(self.powered_count == 0 && self.power)
		{
			self.power = 0;
			self [[self.power_off_func]]();
		}
	}
}

/*
	Name: never_power_on
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1EF8
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 729
*/
function never_power_on(origin, radius)
{
}

/*
	Name: never_power_off
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1F18
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 743
*/
function never_power_off(origin, radius)
{
}

/*
	Name: cost_negligible
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1F38
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 757
*/
function cost_negligible()
{
	if(isdefined(self.one_time_cost))
	{
		cost = self.one_time_cost;
		self.one_time_cost = undefined;
		return cost;
	}
	return 0;
}

/*
	Name: cost_low_if_local
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1F78
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 778
*/
function cost_low_if_local()
{
	if(isdefined(self.one_time_cost))
	{
		cost = self.one_time_cost;
		self.one_time_cost = undefined;
		return cost;
	}
	if(isdefined(level._power_global) && level._power_global)
	{
		return 0;
	}
	if(isdefined(self.self_powered) && self.self_powered)
	{
		return 0;
	}
	return 1;
}

/*
	Name: cost_high
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x1FF0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 807
*/
function cost_high()
{
	if(isdefined(self.one_time_cost))
	{
		cost = self.one_time_cost;
		self.one_time_cost = undefined;
		return cost;
	}
	return 10;
}

/*
	Name: door_range
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x2030
	Size: 0x70
	Parameters: 3
	Flags: None
	Line Number: 828
*/
function door_range(delta, origin, radius)
{
	if(delta < 0)
	{
		return 0;
	}
	if(DistanceSquared(self.target.origin, origin) < radius * radius)
	{
		return 1;
	}
	return 0;
}

/*
	Name: door_power_on
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x20A8
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 851
*/
function door_power_on(origin, radius)
{
	self.target.power_on = 1;
	self.target notify("power_on");
}

/*
	Name: door_power_off
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x20F0
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 867
*/
function door_power_off(origin, radius)
{
	self.target notify("power_off");
	self.target.power_on = 0;
}

/*
	Name: door_local_power_on
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x2138
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 883
*/
function door_local_power_on(origin, radius)
{
	self.target.local_power_on = 1;
	self.target notify("local_power_on");
}

/*
	Name: door_local_power_off
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x2180
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 899
*/
function door_local_power_off(origin, radius)
{
	self.target notify("local_power_off");
	self.target.local_power_on = 0;
}

/*
	Name: cost_door
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x21C8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 915
*/
function cost_door()
{
	if(isdefined(self.target.power_cost))
	{
		if(!isdefined(self.one_time_cost))
		{
			self.one_time_cost = 0;
		}
		self.one_time_cost = self.one_time_cost + self.target.power_cost;
		self.target.power_cost = 0;
	}
	if(isdefined(self.one_time_cost))
	{
		cost = self.one_time_cost;
		self.one_time_cost = undefined;
		return cost;
	}
	return 0;
}

/*
	Name: zombie_range
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x2268
	Size: 0x88
	Parameters: 3
	Flags: None
	Line Number: 945
*/
function zombie_range(delta, origin, radius)
{
	if(delta > 0)
	{
		return 0;
	}
	self.zombies = Array::get_all_closest(origin, zombie_utility::get_round_enemy_array(), undefined, undefined, radius);
	if(!isdefined(self.zombies))
	{
		return 0;
	}
	self.power = 1;
	return 1;
}

/*
	Name: zombie_power_off
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x22F8
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 970
*/
function zombie_power_off(origin, radius)
{
	for(i = 0; i < self.zombies.size; i++)
	{
		self.zombies[i] thread stun_zombie();
		wait(0.05);
	}
	return;
	ERROR: Bad function call
}

/*
	Name: stun_zombie
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x2368
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 991
*/
function stun_zombie()
{
	self endon("death");
	self notify("stun_zombie");
	self endon("stun_zombie");
	if(self.health <= 0)
	{
		return;
	}
	if(isdefined(self.ignore_inert) && self.ignore_inert)
	{
		return;
	}
	if(isdefined(self.stun_zombie))
	{
		self thread [[self.stun_zombie]]();
		return;
		return;
	}
}

/*
	Name: perk_range
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x23E0
	Size: 0xF8
	Parameters: 3
	Flags: None
	Line Number: 1022
*/
function perk_range(delta, origin, radius)
{
	if(isdefined(self.target))
	{
		perkorigin = self.target.origin;
		if(isdefined(self.target.trigger_off) && self.target.trigger_off)
		{
			perkorigin = self.target.realorigin;
		}
		else if(isdefined(self.target.disabled) && self.target.disabled)
		{
			perkorigin = perkorigin + VectorScale((0, 0, 1), 10000);
		}
		if(DistanceSquared(perkorigin, origin) < radius * radius)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: perk_power_on
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x24E0
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 1053
*/
function perk_power_on(origin, radius)
{
	level notify(self.target zm_perks::getVendingMachineNotify() + "_on");
	zm_perks::perk_unpause(self.target.script_noteworthy);
}

/*
	Name: perk_power_off
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x2548
	Size: 0x140
	Parameters: 2
	Flags: None
	Line Number: 1069
*/
function perk_power_off(origin, radius)
{
	notify_name = self.target zm_perks::getVendingMachineNotify();
	if(isdefined(notify_name) && notify_name == "revive")
	{
		if(level flag::exists("solo_game") && level flag::get("solo_game"))
		{
			return;
		}
	}
	self.target notify("death");
	self.target thread zm_perks::vending_trigger_think();
	if(isdefined(self.target.perk_hum))
	{
		self.target.perk_hum delete();
	}
	zm_perks::perk_pause(self.target.script_noteworthy);
	level notify(self.target zm_perks::getVendingMachineNotify() + "_off");
}

/*
	Name: turn_power_on_and_open_doors
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x2690
	Size: 0x2D8
	Parameters: 1
	Flags: None
	Line Number: 1099
*/
function turn_power_on_and_open_doors(power_zone)
{
	wait(1);
	level flag::wait_till("reap_collection_loaded");
	wait(2);
	level.local_doors_stay_open = 1;
	level.power_local_doors_globally = 1;
	if(!isdefined(power_zone))
	{
		level flag::set("power_on");
		level clientfield::set("zombie_power_on", 0);
	}
	else
	{
		level flag::set("power_on" + power_zone);
		level clientfield::set("zombie_power_on", power_zone);
	}
	zombie_doors = GetEntArray("zombie_door", "targetname");
	foreach(door in zombie_doors)
	{
		if(!isdefined(door.script_noteworthy))
		{
			continue;
		}
		if(!isdefined(power_zone) && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door"))
		{
			door notify("power_on");
			continue;
		}
		if(isdefined(door.script_int) && door.script_int == power_zone && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door"))
		{
			door notify("power_on");
			if(isdefined(level.temporary_power_switch_logic))
			{
				door.power_on = 1;
				continue;
			}
		}
		if(isdefined(door.script_int) && door.script_int == power_zone && door.script_noteworthy === "local_electric_door")
		{
			door notify("local_power_on");
		}
	}
}

/*
	Name: turn_power_off_and_close_doors
	Namespace: zm_power
	Checksum: 0x424F4353
	Offset: 0x2970
	Size: 0x2D6
	Parameters: 1
	Flags: None
	Line Number: 1154
*/
function turn_power_off_and_close_doors(power_zone)
{
	level.local_doors_stay_open = 0;
	level.power_local_doors_globally = 0;
	if(!isdefined(power_zone))
	{
		level flag::clear("power_on");
		level clientfield::set("zombie_power_off", 0);
	}
	else
	{
		level flag::clear("power_on" + power_zone);
		level clientfield::set("zombie_power_off", power_zone);
	}
	zombie_doors = GetEntArray("zombie_door", "targetname");
	foreach(door in zombie_doors)
	{
		if(!isdefined(door.script_noteworthy))
		{
			continue;
		}
		if(!isdefined(power_zone) && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door"))
		{
			door notify("power_on");
			continue;
		}
		if(isdefined(door.script_int) && door.script_int == power_zone && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door"))
		{
			door notify("power_on");
			if(isdefined(level.temporary_power_switch_logic))
			{
				door.power_on = 0;
				door setHintString(&"ZOMBIE_NEED_POWER");
				door notify("kill_door_think");
				door thread zm_blockers::door_think();
				continue;
			}
		}
		if(isdefined(door.script_noteworthy) && door.script_noteworthy == "local_electric_door")
		{
			door notify("local_power_on");
		}
	}
}

