#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_genesis_round_bosses;

#namespace namespace_b6963cd7;

/*
	Name: main_start
	Namespace: namespace_b6963cd7
	Checksum: 0x424F4353
	Offset: 0x3B8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 26
*/
function main_start()
{
	var_6674aa0f = struct::get("upper_courtyard_landing_pad12");
	var_6674aa0f.origin = var_6674aa0f.origin + VectorScale((1, 0, 0), 30);
	level.var_2d0e5eb6 = &function_8921895f;
	level.var_92a78c17 = spawn("trigger_box", (101, -6298, -625), 0, 425, 178, 520);
	level.var_92a78c17.angles = VectorScale((0, 1, 0), 317.8);
	level thread function_81261f5b();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: main_end
	Namespace: namespace_b6963cd7
	Checksum: 0x424F4353
	Offset: 0x498
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function main_end()
{
	if(GetDvarInt("splitscreen_playerCount") <= 2)
	{
		spawncollision("collision_player_slick_wedge_32x256", "collider", (469.127, -6376.75, -1241), (282, 317.999, -90.001));
		spawncollision("collision_player_slick_wedge_32x256", "collider", (430.766, -6532.67, -1323), (282, 31.5004, -90.0014));
		spawncollision("collision_player_wall_128x128x10", "collider", (1518, 4436.25, 1312), VectorScale((0, 1, 0), 260.249));
	}
	level thread function_d7b99564();
}

/*
	Name: function_dce2d8a9
	Namespace: namespace_b6963cd7
	Checksum: 0x424F4353
	Offset: 0x5B0
	Size: 0x210
	Parameters: 1
	Flags: None
	Line Number: 69
*/
function function_dce2d8a9(str_zone)
{
	if(zm_zonemgr::any_player_in_zone(str_zone))
	{
		return 1;
	}
	switch(str_zone)
	{
		case "zm_theater_zone":
		{
			foreach(player in level.activePlayers)
			{
				x = player.origin[0];
				y = player.origin[1];
				z = player.origin[2];
				if(x > -1200 && x < -1170 && (y > -8570 && y < -8540) && (z > -1710 && z < -1500))
				{
					return 1;
				}
			}
			break;
		}
		case "zm_castle_power_zone":
		{
			foreach(player in level.activePlayers)
			{
				if(player istouching(level.var_92a78c17))
				{
					return 1;
				}
			}
			break;
		}
	}
	return 0;
}

/*
	Name: function_d51867e
	Namespace: namespace_b6963cd7
	Checksum: 0x424F4353
	Offset: 0x7C8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 116
*/
function function_d51867e()
{
	x = self.origin[0];
	y = self.origin[1];
	z = self.origin[2];
	if(x > -1200 && x < -1170 && (y > -8570 && y < -8540) && (z > -1710 && z < -1500))
	{
		return 1;
	}
	if(self istouching(level.var_92a78c17))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_8921895f
	Namespace: namespace_b6963cd7
	Checksum: 0x424F4353
	Offset: 0x8A8
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 142
*/
function function_8921895f()
{
	var_cdb0f86b = getArrayKeys(level.zombie_powerups);
	var_b4442b55 = Array("bonus_points_team", "shield_charge", "ww_grenade", "genesis_random_weapon");
	var_d7a75a6e = [];
	for(i = 0; i < var_cdb0f86b.size; i++)
	{
		b_should_skip = 0;
		foreach(var_68de493a in var_b4442b55)
		{
			if(var_cdb0f86b[i] == var_68de493a)
			{
				b_should_skip = 1;
			}
		}
		if(b_should_skip)
		{
			continue;
			continue;
		}
		var_d7a75a6e[var_d7a75a6e.size] = var_cdb0f86b[i];
	}
	var_d7a75a6e = Array::randomize(var_d7a75a6e);
	return var_d7a75a6e[0];
}

/*
	Name: function_d7b99564
	Namespace: namespace_b6963cd7
	Checksum: 0x424F4353
	Offset: 0xA38
	Size: 0x458
	Parameters: 0
	Flags: None
	Line Number: 178
*/
function function_d7b99564()
{
	var_e8eee856 = struct::spawn((5670.5, -1164, 353.5), VectorScale((0, 1, 0), 197));
	var_e8eee856.targetname = "zm_asylum_power_room_zone_spawners";
	var_e8eee856.zone_name = "zm_asylum_power_room_zone";
	var_e8eee856.script_int = 1;
	var_e8eee856.script_noteworthy = "riser_location";
	var_e8eee856.script_string = "find_flesh";
	var_e8eee856.is_enabled = 1;
	level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"] = [];
	if(!isdefined(level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"]))
	{
		level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"] = [];
	}
	else if(!IsArray(level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"]))
	{
		level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"] = Array(level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"]);
	}
	level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"][level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"].size] = var_e8eee856;
	var_c2ec6ded = struct::spawn((5214.43, -1441.85, 351.1));
	var_c2ec6ded.targetname = "zm_asylum_power_room_zone_spawners";
	var_c2ec6ded.zone_name = "zm_asylum_power_room_zone";
	var_c2ec6ded.script_int = 1;
	var_c2ec6ded.script_noteworthy = "riser_location";
	var_c2ec6ded.script_string = "find_flesh";
	var_c2ec6ded.is_enabled = 1;
	if(!isdefined(level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"]))
	{
		level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"] = [];
	}
	else if(!IsArray(level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"]))
	{
		level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"] = Array(level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"]);
	}
	level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"][level.zones["zm_asylum_power_room_zone"].a_loc_types["riser_location"].size] = var_c2ec6ded;
	level flag::wait_till("connect_asylum_kitchen_to_upstairs");
	var_e8eee856.is_enabled = 0;
	var_c2ec6ded.is_enabled = 0;
}

/*
	Name: function_81261f5b
	Namespace: namespace_b6963cd7
	Checksum: 0x424F4353
	Offset: 0xE98
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 228
*/
function function_81261f5b()
{
	while(1)
	{
		evt = level util::waittill_any_return("remote_spawn_mechz", "remote_spawn_margwa");
		if(evt == "remote_spawn_margwa")
		{
			namespace_6929903c::spawn_boss("margwa");
		}
		if(evt == "remote_spawn_mechz")
		{
			namespace_6929903c::spawn_boss("mechz");
		}
	}
}

