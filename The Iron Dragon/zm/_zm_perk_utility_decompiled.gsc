#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\gameobjects_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_b8afaefc;

/*
	Name: __init__sytem__
	Namespace: namespace_b8afaefc
	Checksum: 0x9ECFF72C
	Offset: 0x5C0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 25
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_utility", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b8afaefc
	Checksum: 0x55798247
	Offset: 0x608
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function __init__()
{
	clientfield::register("scriptmover", "set_objective_id", 1, GetMinBitCountForNum(128), "int");
	clientfield::register("scriptmover", "remove_objective_id", 1, GetMinBitCountForNum(1), "int");
	clientfield::register("zbarrier", "set_objective_id", 1, GetMinBitCountForNum(128), "int");
	clientfield::register("zbarrier", "remove_objective_id", 1, GetMinBitCountForNum(1), "int");
}

/*
	Name: __main__
	Namespace: namespace_b8afaefc
	Checksum: 0xDCB1AC95
	Offset: 0x718
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		zm_perks::spare_change();
	}
	if(isdefined(1) && 1)
	{
		level.no_target_override = &no_target_override;
	}
	level.weaponZMDeathThroe = GetWeapon("t6_bare_hands_death");
	level.perk_lost_func = &function_f33b7cc;
	gameobjects::main();
	level.numGametypeReservedObjectives = 1;
	level.var_57aa3b49 = [];
	level.var_57aa3b49["specialty"] = [];
	level.var_57aa3b49["mystery_box"] = [];
	level.var_57aa3b49["wonderfizz"] = [];
	level.var_57aa3b49["gobble_gum"] = [];
	level.var_57aa3b49["pack_a_punch"] = [];
	level.var_57aa3b49["wallbuy"] = [];
}

/*
	Name: validate_and_set_no_target_position
	Namespace: namespace_b8afaefc
	Checksum: 0x71325C3D
	Offset: 0x850
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 91
*/
function validate_and_set_no_target_position(position)
{
	if(isdefined(position))
	{
		goal_point = GetClosestPointOnNavMesh(position.origin, 100);
		if(isdefined(goal_point))
		{
			self SetGoal(goal_point);
			self.has_exit_point = 1;
			return 1;
		}
	}
	return 0;
}

/*
	Name: no_target_override
	Namespace: namespace_b8afaefc
	Checksum: 0x145D9E2E
	Offset: 0x8D8
	Size: 0x340
	Parameters: 1
	Flags: None
	Line Number: 116
*/
function no_target_override(zombie)
{
	if(isdefined(zombie.has_exit_point))
	{
		return;
	}
	players = level.players;
	dist_zombie = 0;
	dist_player = 0;
	dest = 0;
	if(isdefined(level.zm_loc_types["dog_location"]))
	{
		locs = Array::randomize(level.zm_loc_types["dog_location"]);
		for(i = 0; i < locs.size; i++)
		{
			found_point = 0;
			foreach(player in players)
			{
				if(player laststand::player_is_in_laststand())
				{
					continue;
				}
				away = VectorNormalize(self.origin - player.origin);
				endPos = self.origin + VectorScale(away, 600);
				dist_zombie = DistanceSquared(locs[i].origin, endPos);
				dist_player = DistanceSquared(locs[i].origin, player.origin);
				if(dist_zombie < dist_player)
				{
					dest = i;
					found_point = 1;
					continue;
				}
				found_point = 0;
			}
			if(found_point)
			{
				if(zombie validate_and_set_no_target_position(locs[i]))
				{
					return;
				}
			}
		}
	}
	escape_position = zombie get_escape_position_in_current_zone();
	if(zombie validate_and_set_no_target_position(escape_position))
	{
		return;
	}
	escape_position = zombie get_escape_position();
	if(zombie validate_and_set_no_target_position(escape_position))
	{
		return;
	}
	zombie.has_exit_point = 1;
	zombie SetGoal(zombie.origin);
}

/*
	Name: get_escape_position
	Namespace: namespace_b8afaefc
	Checksum: 0x996F4CF1
	Offset: 0xC20
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 183
*/
function get_escape_position()
{
	self endon("death");
	str_zone = self.zone_name;
	if(!isdefined(str_zone))
	{
		str_zone = self.zone_name;
	}
	if(isdefined(str_zone))
	{
		a_zones = get_adjacencies_to_zone(str_zone);
		a_wait_locations = get_wait_locations_in_zones(a_zones);
		s_farthest = self get_farthest_wait_location(a_wait_locations);
	}
	return s_farthest;
}

/*
	Name: get_wait_locations_in_zones
	Namespace: namespace_b8afaefc
	Checksum: 0x34AA76D0
	Offset: 0xCE0
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 210
*/
function get_wait_locations_in_zones(a_zones)
{
	a_wait_locations = [];
	foreach(zone in a_zones)
	{
		a_wait_locations = function_41d88412(a_wait_locations, level.zones[zone].a_loc_types["dog_location"]);
	}
	return a_wait_locations;
}

/*
	Name: get_adjacencies_to_zone
	Namespace: namespace_b8afaefc
	Checksum: 0x8533C735
	Offset: 0xDB8
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 230
*/
function get_adjacencies_to_zone(str_zone)
{
	a_adjacencies = [];
	a_adjacencies[0] = str_zone;
	a_adjacent_zones = getArrayKeys(level.zones[str_zone].adjacent_zones);
	for(i = 0; i < a_adjacent_zones.size; i++)
	{
		if(level.zones[str_zone].adjacent_zones[a_adjacent_zones[i]].is_connected)
		{
			if(!isdefined(a_adjacencies))
			{
				a_adjacencies = [];
			}
			else if(!IsArray(a_adjacencies))
			{
				a_adjacencies = Array(a_adjacencies);
			}
		}
		a_adjacencies[a_adjacencies.size] = a_adjacent_zones[i];
	}
	return a_adjacencies;
}

/*
	Name: get_escape_position_in_current_zone
	Namespace: namespace_b8afaefc
	Checksum: 0x624F6372
	Offset: 0xEE0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 263
*/
function get_escape_position_in_current_zone()
{
	self endon("death");
	str_zone = self.zone_name;
	if(!isdefined(str_zone))
	{
		str_zone = self.zone_name;
	}
	if(isdefined(str_zone))
	{
		a_wait_locations = get_wait_locations_in_zone(str_zone);
		if(isdefined(a_wait_locations))
		{
			s_farthest = self get_farthest_wait_location(a_wait_locations);
		}
	}
	return s_farthest;
}

/*
	Name: function_41d88412
	Namespace: namespace_b8afaefc
	Checksum: 0xB0321C09
	Offset: 0xF88
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 292
*/
function function_41d88412(var_fc01d778, var_6e0946b3)
{
	temp_array = [];
	for(i = 0; i < var_fc01d778.size; i++)
	{
		Array::add(temp_array, var_fc01d778[i]);
	}
	for(i = 0; i < var_6e0946b3.size; i++)
	{
		Array::add(temp_array, var_6e0946b3[i]);
	}
	return temp_array;
}

/*
	Name: get_wait_locations_in_zone
	Namespace: namespace_b8afaefc
	Checksum: 0xFCA41FEF
	Offset: 0x1048
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 316
*/
function get_wait_locations_in_zone(zone)
{
	if(isdefined(level.zones[zone].a_loc_types["dog_location"]))
	{
		a_wait_locations = [];
		a_wait_locations = function_41d88412(a_wait_locations, level.zones[zone].a_loc_types["dog_location"]);
		return a_wait_locations;
	}
	return undefined;
}

/*
	Name: get_farthest_wait_location
	Namespace: namespace_b8afaefc
	Checksum: 0x3353B745
	Offset: 0x10D8
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 337
*/
function get_farthest_wait_location(a_wait_locations)
{
	if(!isdefined(a_wait_locations) || a_wait_locations.size == 0)
	{
		return undefined;
	}
	n_farthest_index = 0;
	n_distance_farthest = 0;
	for(i = 0; i < a_wait_locations.size; i++)
	{
		n_distance_sq = DistanceSquared(self.origin, a_wait_locations[i].origin);
		if(n_distance_sq > n_distance_farthest)
		{
			n_distance_farthest = n_distance_sq;
			n_farthest_index = i;
		}
	}
	return a_wait_locations[n_farthest_index];
}

/*
	Name: function_bb73e08b
	Namespace: namespace_b8afaefc
	Checksum: 0x5B79A240
	Offset: 0x11B8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 367
*/
function function_bb73e08b()
{
	if(!isdefined(level.perk_purchase_limit))
	{
		return 0;
	}
	var_58cb170d = level.perk_purchase_limit;
	if(isdefined(self.var_4353e41b) && self.var_4353e41b > 0)
	{
		var_58cb170d = var_58cb170d + self.var_4353e41b;
	}
	return var_58cb170d;
}

/*
	Name: function_6826dd10
	Namespace: namespace_b8afaefc
	Checksum: 0xD395B445
	Offset: 0x1220
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 391
*/
function function_6826dd10()
{
	var_24c919ce = self function_bb73e08b();
	var_268883f5 = self zm_perks::get_perk_array();
	if(isdefined(var_268883f5) && var_268883f5.size >= var_24c919ce)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_16ec4908
	Namespace: namespace_b8afaefc
	Checksum: 0xDB8A1EFB
	Offset: 0x1298
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 412
*/
function function_16ec4908()
{
	var_af3bae05 = level._random_perk_machine_perk_list;
	if(!isdefined(var_af3bae05) || var_af3bae05.size < 1)
	{
		return 0;
	}
	var_cea0cbd5 = 0;
	for(i = 0; i < var_af3bae05.size; i++)
	{
		if(self function_9f353429(var_af3bae05[i]))
		{
			continue;
		}
		if(level function_9f353429(var_af3bae05[i]))
		{
			continue;
		}
		var_cea0cbd5++;
	}
	return var_cea0cbd5;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_38f810ea
	Namespace: namespace_b8afaefc
	Checksum: 0x37396550
	Offset: 0x1368
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 446
*/
function function_38f810ea(perk)
{
	if(!isdefined(level._random_perk_machine_perk_list))
	{
		level._random_perk_machine_perk_list = [];
	}
	if(isdefined(level._random_perk_machine_perk_list) && level._random_perk_machine_perk_list.size > 0)
	{
		for(i = 0; i < level._random_perk_machine_perk_list.size; i++)
		{
			if(level._random_perk_machine_perk_list[i] === perk)
			{
				return;
			}
		}
	}
	level._random_perk_machine_perk_list[level._random_perk_machine_perk_list.size] = perk;
}

/*
	Name: function_711257e3
	Namespace: namespace_b8afaefc
	Checksum: 0x8F902D7B
	Offset: 0x1410
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 475
*/
function function_711257e3(perk)
{
	if(!isdefined(level._random_perk_machine_perk_list))
	{
		level._random_perk_machine_perk_list = [];
	}
	if(isdefined(level._random_perk_machine_perk_list) && level._random_perk_machine_perk_list.size > 0)
	{
		for(i = 0; i < level._random_perk_machine_perk_list.size; i++)
		{
			if(level._random_perk_machine_perk_list[i] === perk)
			{
				return 1;
			}
		}
	}
	return 0;
}

/*
	Name: function_424e1b4a
	Namespace: namespace_b8afaefc
	Checksum: 0xF8EA1954
	Offset: 0x14A8
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 504
*/
function function_424e1b4a(perk)
{
	if(!isdefined(level.var_dc75b9d6))
	{
		level.var_dc75b9d6 = [];
	}
	if(!function_711257e3(perk))
	{
		return;
	}
	if(!isdefined(level.var_dc75b9d6))
	{
		level.var_dc75b9d6 = [];
	}
	else if(!IsArray(level.var_dc75b9d6))
	{
		level.var_dc75b9d6 = Array(level.var_dc75b9d6);
	}
	level.var_dc75b9d6[level.var_dc75b9d6.size] = perk;
	ArrayRemoveValue(level._random_perk_machine_perk_list, perk);
}

/*
	Name: function_b1f8b271
	Namespace: namespace_b8afaefc
	Checksum: 0x62240A10
	Offset: 0x1578
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 536
*/
function function_b1f8b271(perk)
{
	if(!isdefined(level.var_dc75b9d6))
	{
		level.var_dc75b9d6 = [];
	}
	if(!isdefined(level._random_perk_machine_perk_list))
	{
		level._random_perk_machine_perk_list = [];
	}
	if(!function_8ec19631(perk) || function_711257e3(perk))
	{
		return;
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
	ArrayRemoveValue(level.var_dc75b9d6, perk);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8ec19631
	Namespace: namespace_b8afaefc
	Checksum: 0x60667294
	Offset: 0x1678
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 575
*/
function function_8ec19631(perk)
{
	if(!isdefined(level.var_dc75b9d6))
	{
		level.var_dc75b9d6 = [];
	}
	for(i = 0; i < level.var_dc75b9d6.size; i++)
	{
		if(level.var_dc75b9d6[i] == perk)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_e8ddc112
	Namespace: namespace_b8afaefc
	Checksum: 0x6DCEEB1B
	Offset: 0x16F0
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 601
*/
function function_e8ddc112(perk, var_27782c31)
{
	if(!isdefined(var_27782c31))
	{
		var_27782c31 = 1;
	}
	if(!isdefined(level.disabled_perks))
	{
		level.disabled_perks = [];
	}
	if(isdefined(var_27782c31) && var_27782c31)
	{
		level.disabled_perks[perk] = 1;
		continue;
	}
	level.disabled_perks[perk] = 0;
	function_a579146d(perk, var_27782c31);
	function_424e1b4a(perk);
}

/*
	Name: function_2362125f
	Namespace: namespace_b8afaefc
	Checksum: 0xAF264A6B
	Offset: 0x17A8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 631
*/
function function_2362125f(perk)
{
	if(!isdefined(level.disabled_perks))
	{
		level.disabled_perks = [];
	}
	level.disabled_perks[perk] = 0;
	function_4a56ba60(perk);
	function_b1f8b271(perk);
	return;
}

/*
	Name: _hasPerk
	Namespace: namespace_b8afaefc
	Checksum: 0xEC4ECB5
	Offset: 0x1818
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 653
*/
function _hasPerk(str_perk, var_253e5e2e)
{
	if(!isdefined(var_253e5e2e))
	{
		var_253e5e2e = 1;
	}
	if(self hasPerk(str_perk) || (isdefined(var_253e5e2e) && var_253e5e2e && self function_9f353429(str_perk)))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_f33b7cc
	Namespace: namespace_b8afaefc
	Checksum: 0xA89D2A95
	Offset: 0x18A0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 676
*/
function function_f33b7cc(str_perk)
{
	if(self function_9f353429(str_perk))
	{
		self.disabled_perks[str_perk] = 0;
	}
}

/*
	Name: function_9f353429
	Namespace: namespace_b8afaefc
	Checksum: 0xD8C8E4E0
	Offset: 0x18E0
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 694
*/
function function_9f353429(perk)
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	if(!isdefined(self.disabled_perks[perk]))
	{
		self.disabled_perks[perk] = 0;
	}
	return self.disabled_perks[perk];
}

/*
	Name: function_a579146d
	Namespace: namespace_b8afaefc
	Checksum: 0x96AEA9B6
	Offset: 0x1940
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 717
*/
function function_a579146d(perk, var_27782c31)
{
	if(!isdefined(var_27782c31))
	{
		var_27782c31 = 1;
	}
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] function_7932e598(perk, var_27782c31);
	}
}

/*
	Name: function_4a56ba60
	Namespace: namespace_b8afaefc
	Checksum: 0x437334A
	Offset: 0x19E0
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 740
*/
function function_4a56ba60(perk)
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] function_6ade6191(perk);
	}
}

/*
	Name: function_7932e598
	Namespace: namespace_b8afaefc
	Checksum: 0xCEEE47B0
	Offset: 0x1A60
	Size: 0x198
	Parameters: 2
	Flags: None
	Line Number: 759
*/
function function_7932e598(perk, var_27782c31)
{
	if(!isdefined(var_27782c31))
	{
		var_27782c31 = 1;
	}
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	if(isdefined(self.disabled_perks[perk]) && self.disabled_perks[perk])
	{
		return;
	}
	if(!self hasPerk(perk))
	{
		return;
	}
	if(isdefined(var_27782c31) && var_27782c31)
	{
		self.disabled_perks[perk] = 1;
		continue;
	}
	self.disabled_perks[perk] = 0;
	self unsetPerk(perk);
	self.num_perks--;
	if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].player_thread_take))
	{
		self thread [[level._custom_perks[perk].player_thread_take]](1);
	}
	if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].clientfield_set))
	{
		self thread [[level._custom_perks[perk].clientfield_set]](2);
	}
	self notify(perk + "_paused");
}

/*
	Name: function_6ade6191
	Namespace: namespace_b8afaefc
	Checksum: 0x748E3BD7
	Offset: 0x1C00
	Size: 0x158
	Parameters: 1
	Flags: None
	Line Number: 806
*/
function function_6ade6191(perk)
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	if(!(isdefined(self.disabled_perks[perk]) && self.disabled_perks[perk]))
	{
		return;
	}
	if(self hasPerk(perk))
	{
		return;
	}
	self.disabled_perks[perk] = 0;
	self setPerk(perk);
	self.num_perks++;
	if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].player_thread_give))
	{
		self thread [[level._custom_perks[perk].player_thread_give]]();
	}
	if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].clientfield_set))
	{
		self thread [[level._custom_perks[perk].clientfield_set]](1);
	}
	self notify(perk + "_unpaused");
}

/*
	Name: give_random_perk
	Namespace: namespace_b8afaefc
	Checksum: 0x7624D759
	Offset: 0x1D60
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 844
*/
function give_random_perk()
{
	random_perk = undefined;
	a_str_perks = getArrayKeys(level._custom_perks);
	PERKS = [];
	for(i = 0; i < a_str_perks.size; i++)
	{
		perk = a_str_perks[i];
		if(isdefined(self.perk_purchased) && self.perk_purchased == perk)
		{
			continue;
		}
		if(!self hasPerk(perk) && !self function_9f353429(perk) && !level function_9f353429(perk))
		{
			PERKS[PERKS.size] = perk;
		}
	}
	if(PERKS.size > 0)
	{
		PERKS = Array::randomize(PERKS);
		random_perk = PERKS[0];
		self zm_perks::give_perk(random_perk);
		continue;
	}
	self playsoundtoplayer(level.zmb_laugh_alias, self);
	return random_perk;
}

/*
	Name: function_fc92a42d
	Namespace: namespace_b8afaefc
	Checksum: 0x589E4E82
	Offset: 0x1EF8
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 882
*/
function function_fc92a42d()
{
	if(level.script == "zm_factory" || level.script == "zm_zod" || level.script == "zm_castle" || level.script == "zm_island" || level.script == "zm_stalingrad" || level.script == "zm_genesis" || level.script == "zm_prototype" || level.script == "zm_asylum" || level.script == "zm_sumpf" || level.script == "zm_theater" || level.script == "zm_cosmodrome" || level.script == "zm_temple" || level.script == "zm_moon" || level.script == "zm_tomb")
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_8fd06793
	Namespace: namespace_b8afaefc
	Checksum: 0xA61FFBEB
	Offset: 0x2028
	Size: 0x288
	Parameters: 4
	Flags: None
	Line Number: 901
*/
function function_8fd06793(origin, angles, perk, model)
{
	t_use = spawn("trigger_radius_use", origin + VectorScale((0, 0, 1), 60), 0, 40, 80);
	t_use.targetname = "zombie_vending";
	t_use.script_noteworthy = perk;
	t_use TriggerIgnoreTeam();
	perk_machine = spawn("script_model", origin);
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	perk_machine.angles = angles;
	perk_machine SetModel(model);
	bump_trigger = spawn("trigger_radius", origin + VectorScale((0, 0, 1), 30), 0, 40, 80);
	bump_trigger.script_activated = 1;
	bump_trigger.script_sound = "zmb_perks_bump_bottle";
	bump_trigger.targetname = "audio_bump_trigger";
	collision = spawn("script_model", origin, 1);
	collision.angles = angles;
	collision SetModel("zm_collision_perks1");
	collision.script_noteworthy = "clip";
	collision disconnectpaths();
	t_use.clip = collision;
	t_use.machine = perk_machine;
	t_use.bump = bump_trigger;
	[[level._custom_perks[perk].perk_machine_set_kvps]](t_use, perk_machine, bump_trigger, collision);
}

/*
	Name: function_cfe6acb0
	Namespace: namespace_b8afaefc
	Checksum: 0x7F3E32B4
	Offset: 0x22B8
	Size: 0x5F0
	Parameters: 1
	Flags: None
	Line Number: 939
*/
function function_cfe6acb0(perk)
{
	str_endon = perk + "_power_thread_end";
	level endon(str_endon);
	var_fb1cd1b2 = perk + "_on";
	str_off = perk + "_off";
	str_notify = perk + "_power_on";
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_tomb")
	{
		level flag::wait_till("initial_blackscreen_passed");
		level.zone_capture.perk_machines_always_on[level.zone_capture.perk_machines_always_on.size] = perk;
		machine = GetEntArray(level._custom_perks[perk].radiant_machine_name, "targetname");
		machine_triggers = GetEntArray(level._custom_perks[perk].radiant_machine_name, "target");
		for(i = 0; i < machine.size; i++)
		{
			machine[i] SetModel(level.machine_assets[perk].on_model);
			machine[i] vibrate(VectorScale((0, -1, 0), 100), 0.3, 0.4, 3);
			machine[i] playsound("zmb_perks_power_on");
			machine[i] thread zm_perks::perk_fx(level._custom_perks[perk].machine_light_effect);
			machine[i] thread zm_perks::play_loop_on_machine();
		}
		level notify(str_notify);
		return;
	}
	level flag::wait_till("initial_blackscreen_passed");
	while(1)
	{
		machine = GetEntArray(level._custom_perks[perk].radiant_machine_name, "targetname");
		machine_triggers = GetEntArray(level._custom_perks[perk].radiant_machine_name, "target");
		for(i = 0; i < machine.size; i++)
		{
			machine[i] SetModel(level.machine_assets[perk].on_model);
			machine[i] vibrate(VectorScale((0, -1, 0), 100), 0.3, 0.4, 3);
			machine[i] playsound("zmb_perks_power_on");
			machine[i] thread zm_perks::perk_fx(level._custom_perks[perk].machine_light_effect);
			machine[i] thread zm_perks::play_loop_on_machine();
		}
		level notify(str_notify);
		Array::thread_all(machine_triggers, &zm_perks::set_power_on, 1);
		if(isdefined(level.machine_assets[perk].power_on_callback))
		{
			Array::thread_all(machine, level.machine_assets[perk].power_on_callback);
		}
		level waittill(str_off);
		if(isdefined(level.machine_assets[perk].power_off_callback))
		{
			Array::thread_all(machine, level.machine_assets[perk].power_off_callback);
		}
		Array::thread_all(machine, &zm_perks::turn_perk_off);
		for(i = 0; i < machine.size; i++)
		{
			machine[i] SetModel(level.machine_assets[perk].off_model);
		}
		level thread zm_perks::do_initial_power_off_callback(machine, perk);
		Array::thread_all(machine_triggers, &zm_perks::set_power_on, 0);
		level waittill(var_fb1cd1b2);
	}
}

/*
	Name: function_f4c6e254
	Namespace: namespace_b8afaefc
	Checksum: 0xA1986D1C
	Offset: 0x28B0
	Size: 0x140
	Parameters: 3
	Flags: None
	Line Number: 1009
*/
function function_f4c6e254(var_5df46675, str_perk, var_11cd8a0c)
{
	if(!isdefined(var_11cd8a0c))
	{
		var_11cd8a0c = undefined;
	}
	self endon("death_or_disconnect");
	if(IsArray(var_5df46675))
	{
		for(i = 0; i < var_5df46675.size; i++)
		{
			self thread function_f4c6e254(var_5df46675[i], str_perk, var_11cd8a0c);
		}
		return;
	}
	while(1)
	{
		while(self hasPerk(var_5df46675))
		{
			wait(0.05);
		}
		if(!self hasPerk(str_perk) && (isdefined(var_11cd8a0c) && !function_66226416(var_11cd8a0c)))
		{
			break;
		}
		self setPerk(var_5df46675);
	}
}

/*
	Name: function_66226416
	Namespace: namespace_b8afaefc
	Checksum: 0x8FB194CC
	Offset: 0x29F8
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 1048
*/
function function_66226416(var_11cd8a0c)
{
	if(!IsArray(var_11cd8a0c))
	{
		if(self bgb::is_enabled(var_11cd8a0c) || self bgb::is_active(var_11cd8a0c))
		{
			return 1;
		}
		return 0;
	}
	for(i = 0; i < var_11cd8a0c.size; i++)
	{
		if(self bgb::is_enabled(var_11cd8a0c[i]) || self bgb::is_active(var_11cd8a0c[i]))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_ffb18d9f
	Namespace: namespace_b8afaefc
	Checksum: 0x1C4C2435
	Offset: 0x2AD0
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 1078
*/
function function_ffb18d9f(str_perk, var_3fe146ff)
{
	if(isdefined(0) && 0)
	{
		IPrintLnBold("HARRY : " + str_perk + " : " + var_3fe146ff);
		return;
	}
}

/*
	Name: function_2a628bd
	Namespace: namespace_b8afaefc
	Checksum: 0xEC7B8259
	Offset: 0x2B28
	Size: 0x350
	Parameters: 3
	Flags: None
	Line Number: 1097
*/
function function_2a628bd(var_4cadff43, image, colour)
{
	if(!isdefined(colour))
	{
		colour = (1, 1, 1);
	}
	function_d54fcd63();
	var_c786412a = "waypoint_vulture";
	if(var_4cadff43 == "wallbuy")
	{
		var_c786412a = "waypoint_vulture_wallbuy";
	}
	if(var_4cadff43 == "mystery_box")
	{
		var_c786412a = "waypoint_vulture_magicbox";
	}
	if(var_4cadff43 == "pack_a_punch")
	{
		var_c786412a = "waypoint_vulture_pap";
	}
	var_d1d08ffa = gameobjects::get_next_obj_id();
	self clientfield::set("set_objective_id", var_d1d08ffa);
	objective_add(var_d1d08ffa, "active", self, istring(var_c786412a));
	Objective_SetInvisibleToAll(var_d1d08ffa);
	function_78931f1b(var_d1d08ffa, "vulture_icon", MakeLocalizedString(image));
	function_78931f1b(var_d1d08ffa, "vulture_icon_colour", MakeLocalizedString("" + colour[0] + "," + colour[1] + "," + colour[2]));
	if(var_4cadff43 == "mystery_box")
	{
		level.var_57aa3b49["mystery_box"][level.var_57aa3b49["mystery_box"].size] = self;
	}
	else if(var_4cadff43 == "gobble_gum")
	{
		level.var_57aa3b49["gobble_gum"][level.var_57aa3b49["gobble_gum"].size] = self;
	}
	else if(var_4cadff43 == "pack_a_punch")
	{
		level.var_57aa3b49["pack_a_punch"][level.var_57aa3b49["pack_a_punch"].size] = self;
	}
	else if(var_4cadff43 == "wallbuy")
	{
		level.var_57aa3b49["wallbuy"][level.var_57aa3b49["wallbuy"].size] = self;
	}
	else if(var_4cadff43 == "wonderfizz")
	{
		level.var_57aa3b49["wonderfizz"][level.var_57aa3b49["wonderfizz"].size] = self;
		continue;
	}
	self.var_4cadff43 = var_4cadff43;
	level.var_57aa3b49["specialty"][level.var_57aa3b49["specialty"].size] = self;
	self.n_obj_id = var_d1d08ffa;
}

/*
	Name: function_8959be7a
	Namespace: namespace_b8afaefc
	Checksum: 0xCD7E6ADE
	Offset: 0x2E80
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 1159
*/
function function_8959be7a(player)
{
	var_d1d08ffa = gameobjects::get_next_obj_id();
	self clientfield::set("set_objective_id", var_d1d08ffa);
	objective_add(var_d1d08ffa, "active", self, istring("waypoint_whoswho"));
	Objective_SetVisibleToAll(var_d1d08ffa);
	function_78931f1b(var_d1d08ffa, "priority", 10);
	function_78931f1b(var_d1d08ffa, "whoswho_clone_name", player.playerName);
	function_78931f1b(var_d1d08ffa, "whoswho_clone_bleedout_percent", 1);
	function_78931f1b(var_d1d08ffa, "whoswho_clone_revive_percent", 0);
	self.n_obj_id = var_d1d08ffa;
}

/*
	Name: function_740302d5
	Namespace: namespace_b8afaefc
	Checksum: 0xED594862
	Offset: 0x2FC0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1182
*/
function function_740302d5()
{
	self clientfield::set("remove_objective_id", 1);
	objective_delete(self.n_obj_id);
	gameobjects::release_obj_id(self.n_obj_id);
}

/*
	Name: function_da82dcec
	Namespace: namespace_b8afaefc
	Checksum: 0x1D23EF0E
	Offset: 0x3020
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1199
*/
function function_da82dcec()
{
	while(!level flag::exists("initial_blackscreen_passed"))
	{
		wait(0.05);
	}
	if(!level flag::get("initial_blackscreen_passed"))
	{
		level flag::wait_till("initial_blackscreen_passed");
	}
}

/*
	Name: function_d54fcd63
	Namespace: namespace_b8afaefc
	Checksum: 0x5D07102
	Offset: 0x30A0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1221
*/
function function_d54fcd63()
{
	while(!level flag::exists("all_players_connected"))
	{
		wait(0.05);
	}
	if(!level flag::get("all_players_connected"))
	{
		level flag::wait_till("all_players_connected");
	}
}

/*
	Name: function_8d8398be
	Namespace: namespace_b8afaefc
	Checksum: 0x2148249E
	Offset: 0x3120
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 1243
*/
function function_8d8398be()
{
	if(!isdefined(self.var_9ddde58b))
	{
		self.var_9ddde58b = 0;
	}
	self.var_9ddde58b++;
	self.ignoreall = self.var_9ddde58b > 0;
}

/*
	Name: function_c73660a6
	Namespace: namespace_b8afaefc
	Checksum: 0x4D2F8A43
	Offset: 0x3160
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1263
*/
function function_c73660a6()
{
	if(!isdefined(self.var_9ddde58b))
	{
		self.var_9ddde58b = 0;
	}
	if(self.var_9ddde58b > 0)
	{
		self.var_9ddde58b--;
	}
	else
	{
		ASSERTMSG("Dev Block strings are not supported");
	}
	/#
	#/
	self.ignoreall = self.var_9ddde58b > 0;
}

/*
	Name: function_11acd189
	Namespace: namespace_b8afaefc
	Checksum: 0xD1500FA2
	Offset: 0x31D0
	Size: 0x130
	Parameters: 6
	Flags: None
	Line Number: 1292
*/
function function_11acd189(v_origin, var_af93b2de, var_379ef6a0, var_bd74aa4e, var_ab2c8500, str_tag)
{
	if(!isdefined(str_tag))
	{
		str_tag = undefined;
	}
	if(isalive(self) || (isdefined(self.health) && self.health > 0))
	{
		v_launch = VectorNormalize(self.origin - v_origin) * randomIntRange(var_af93b2de, var_379ef6a0) + (0, 0, randomIntRange(var_bd74aa4e, var_ab2c8500));
	}
	if(!self IsRagdoll())
	{
		self StartRagdoll();
	}
	self LaunchRagdoll(v_launch, str_tag);
	return;
	ERROR: Bad function call
}

/*
	Name: function_2b316f0f
	Namespace: namespace_b8afaefc
	Checksum: 0x1E3E1121
	Offset: 0x3308
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 1321
*/
function function_2b316f0f(origin)
{
	var_64701a98 = GetEntArray("player_no_spawn_volume", "targetname");
	if(!isdefined(var_64701a98) || var_64701a98.size < 1)
	{
		return 0;
	}
	if(!isdefined(level.e_check_point))
	{
		level.e_check_point = spawn("script_origin", origin + VectorScale((0, 0, 1), 40));
		continue;
	}
	level.e_check_point.origin = origin + VectorScale((0, 0, 1), 40);
	one_valid_zone = 0;
	for(i = 0; i < var_64701a98.size; i++)
	{
		if(level.e_check_point istouching(var_64701a98[i]))
		{
			one_valid_zone = 1;
			break;
		}
	}
	return one_valid_zone;
}

/*
	Name: get_player_spawn_point
	Namespace: namespace_b8afaefc
	Checksum: 0xEEB9A067
	Offset: 0x3448
	Size: 0x1E8
	Parameters: 5
	Flags: None
	Line Number: 1356
*/
function get_player_spawn_point(n_min, n_max, n_half_height, var_b61860b6, var_fcfb6ea)
{
	if(!isdefined(n_min))
	{
		n_min = 800;
	}
	if(!isdefined(n_max))
	{
		n_max = 1200;
	}
	if(!isdefined(n_half_height))
	{
		n_half_height = 200;
	}
	if(!isdefined(var_b61860b6))
	{
		var_b61860b6 = 32;
	}
	if(!isdefined(var_fcfb6ea))
	{
		var_fcfb6ea = 16;
	}
	v_position = self.origin;
	var_33b07b35 = PositionQuery_Source_Navigation(v_position, n_min, n_max, n_half_height, var_b61860b6, var_fcfb6ea);
	if(var_33b07b35.data.size)
	{
		a_s_locs = Array::randomize(var_33b07b35.data);
		if(isdefined(a_s_locs))
		{
			foreach(s_loc in a_s_locs)
			{
				if(zm_utility::check_point_in_enabled_zone(s_loc.origin, 1, level.active_zones) && !function_2b316f0f(s_loc.origin))
				{
					return s_loc;
				}
			}
		}
	}
	return undefined;
	a_s_locs;
}

/*
	Name: function_6a2f41dc
	Namespace: namespace_b8afaefc
	Checksum: 0x20A6429B
	Offset: 0x3638
	Size: 0x2F0
	Parameters: 0
	Flags: None
	Line Number: 1408
*/
function function_6a2f41dc()
{
	var_3d7f8325 = spawnstruct();
	if(self GetCurrentWeapon() != level.weaponNone && IsWeapon(self GetCurrentWeapon()) && !zm_utility::is_offhand_weapon(self GetCurrentWeapon()))
	{
		continue;
	}
	var_3d7f8325.var_1bcd223d = undefined;
	if(self GetStowedWeapon() != level.weaponNone && IsWeapon(self GetStowedWeapon()))
	{
		continue;
	}
	var_3d7f8325.var_2a13e55e = undefined;
	var_3d7f8325.var_a6dce36c = [];
	if(isdefined(self.score))
	{
		continue;
	}
	var_3d7f8325.n_score = 0;
	var_a6dce36c = self GetWeaponsList();
	for(i = 0; i < var_a6dce36c.size; i++)
	{
		if(isdefined(var_a6dce36c[i]) && var_a6dce36c[i] != level.weaponNone && zm_weapons::is_weapon_included(var_a6dce36c[i]) || zm_weapons::is_weapon_upgraded(var_a6dce36c[i]))
		{
			Array::add(var_3d7f8325.var_a6dce36c, zm_weapons::get_player_weapondata(self, var_a6dce36c[i]), 0);
		}
	}
	if(isdefined(self zm_perks::get_perk_array()))
	{
		continue;
	}
	var_3d7f8325.a_perks = [];
	if(isdefined(self.disabled_perks) && IsArray(self.disabled_perks))
	{
		continue;
	}
	var_3d7f8325.var_291f166f = [];
	var_3d7f8325.var_79157148 = self.var_79157148;
	return var_3d7f8325;
}

/*
	Name: give_player_loadout
	Namespace: namespace_b8afaefc
	Checksum: 0x134A4F1B
	Offset: 0x3930
	Size: 0x792
	Parameters: 6
	Flags: None
	Line Number: 1459
*/
function give_player_loadout(var_3d7f8325, var_40401112, var_66d28d41, var_87ce6ee, var_697bc97b, var_4ddd0a45)
{
	if(!isdefined(var_40401112))
	{
		var_40401112 = 1;
	}
	if(!isdefined(var_66d28d41))
	{
		var_66d28d41 = 0;
	}
	if(!isdefined(var_87ce6ee))
	{
		var_87ce6ee = 0;
	}
	if(!isdefined(var_697bc97b))
	{
		var_697bc97b = [];
	}
	if(!isdefined(var_4ddd0a45))
	{
		var_4ddd0a45 = [];
	}
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	if(isdefined(var_40401112) && var_40401112)
	{
		self TakeAllWeapons();
	}
	if(isdefined(var_87ce6ee) && var_87ce6ee)
	{
		if(isdefined(self zm_perks::get_perk_array()) && IsArray(self zm_perks::get_perk_array()))
		{
			continue;
		}
		var_7a0022ca = [];
		var_7a0022ca = ArrayCombine(var_7a0022ca, self.disabled_perks, 0, 1);
		var_a88e52a5 = ArrayCombine(var_3d7f8325.a_perks, var_3d7f8325.var_291f166f, 0, 1);
		var_ec68f9ba = Array::exclude(var_a88e52a5, var_7a0022ca);
		for(i = 0; i < var_ec68f9ba.size; i++)
		{
			self [[level._custom_perks[var_ec68f9ba[i]].clientfield_set]](0);
			if(self function_9f353429(var_ec68f9ba[i]))
			{
				continue;
			}
			self unsetPerk(var_ec68f9ba[i]);
			self.num_perks--;
			self [[level._custom_perks[var_ec68f9ba[i]].player_thread_take]]();
			self notify(var_ec68f9ba[i] + "_stop", self zm_perks::get_perk_array());
		}
	}
	else if(isdefined(var_3d7f8325.a_perks))
	{
		continue;
	}
	a_perks = [];
	if(isdefined(var_3d7f8325.var_291f166f) && IsArray(var_3d7f8325.var_291f166f) && var_3d7f8325.var_291f166f.size > 0)
	{
		for(i = 0; i < var_3d7f8325.var_291f166f.size; i++)
		{
			if(isdefined(var_3d7f8325.var_291f166f[i]))
			{
				if(!IsInArray(a_perks, var_3d7f8325.var_291f166f[i]))
				{
					a_perks[var_3d7f8325.var_291f166f[i]] = 1;
				}
				self function_7932e598(var_3d7f8325.var_291f166f[i]);
			}
		}
	}
	for(i = 0; i < a_perks.size; i++)
	{
		if(IsInArray(var_697bc97b, a_perks[i]))
		{
			continue;
		}
		if(flag::exists("solo_game") && flag::exists("solo_revive") && level flag::get("solo_game") && level flag::get("solo_revive") && a_perks[i] == "specialty_quickrevive")
		{
			level.solo_lives_given--;
			continue;
		}
		if(a_perks[i] == "specialty_additionalprimaryweapon" && !self hasPerk("specialty_additionalprimaryweapon"))
		{
			if(isdefined(self.var_79157148) && IsArray(self.var_79157148))
			{
				continue;
			}
			var_79157148 = var_3d7f8325.var_79157148;
			self.var_79157148 = undefined;
			self zm_perks::give_perk(a_perks[i]);
			self.var_79157148 = var_79157148;
			continue;
		}
		self zm_perks::give_perk(a_perks[i]);
	}
	for(i = 0; i < var_3d7f8325.var_a6dce36c.size; i++)
	{
		if(isdefined(var_3d7f8325.var_a6dce36c[i]["weapon"]) && !IsInArray(var_4ddd0a45, var_3d7f8325.var_a6dce36c[i]["weapon"].name) && (zm_utility::is_offhand_weapon(var_3d7f8325.var_a6dce36c[i]["weapon"]) || self getweaponslistprimaries().size < zm_utility::get_player_weapon_limit(self)))
		{
			self zm_weapons::weapondata_give(var_3d7f8325.var_a6dce36c[i]);
		}
	}
	if(isdefined(var_3d7f8325.var_2a13e55e) && self hasweapon(var_3d7f8325.var_2a13e55e))
	{
		self SetStowedWeapon(var_3d7f8325.var_2a13e55e);
	}
	if(isdefined(var_66d28d41) && var_66d28d41)
	{
		continue;
	}
	var_daa436bb = &SwitchToWeapon;
	if(!isdefined(var_3d7f8325.var_1bcd223d))
	{
		self [[var_daa436bb]]();
		continue;
	}
	self [[var_daa436bb]](var_3d7f8325.var_1bcd223d);
}

