#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\sound_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\vk_script\_zm_vk_general;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_8d243edb;

/*
	Name: init
	Namespace: namespace_8d243edb
	Checksum: 0xC0B68754
	Offset: 0x458
	Size: 0x48
	Parameters: 0
	Flags: AutoExec
	Line Number: 37
*/
function autoexec init()
{
	level waittill("hash_f938585a");
	level.var_323a641a = 0;
	level.var_d1da0582 = 0;
	level.var_15bc5bb0 = 5;
	thread function_8505d133();
}

/*
	Name: function_9374232
	Namespace: namespace_8d243edb
	Checksum: 0x9A3EF0EA
	Offset: 0x4A8
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function function_9374232()
{
	wait(0.1);
	namespace_f56b53f0::function_dbe7e78b("Logic");
	level waittill("hash_7c194194");
	wait(0.05);
	foreach(player in GetPlayers())
	{
		Earthquake(0.2, 0.2, self.origin, 400);
		self playlocalsound("milestone_reached");
	}
	wait(0.05);
	if(level.var_d1da0582 == level.var_15bc5bb0)
	{
	}
	else if(level.var_d1da0582 == 7 || level.var_d1da0582 == 10)
	{
		GetPlayers()[0] thread function_30483f5b();
		continue;
	}
	GetPlayers()[0] thread function_268f7ff0();
}

/*
	Name: function_268f7ff0
	Namespace: namespace_8d243edb
	Checksum: 0x2B3A029E
	Offset: 0x648
	Size: 0x258
	Parameters: 0
	Flags: None
	Line Number: 89
*/
function function_268f7ff0()
{
	namespace_f56b53f0::function_dbe7e78b("Drop");
	var_a7a3aed0 = Array("double_points", "insta_kill", "full_ammo", "carpenter", "bonus_points_player");
	var_6449d119 = Array::randomize(var_a7a3aed0);
	powerup = var_6449d119[0];
	location = GetClosestPointOnNavMesh(self.origin + VectorScale(AnglesToForward(self.angles), 100), 50);
	powerup_team = undefined;
	powerup_location = undefined;
	pickup_delay = undefined;
	powerup_player = undefined;
	b_stay_forever = 0;
	if(var_6449d119 == "bonus_points_player")
	{
		foreach(player in GetPlayers())
		{
			zm_powerups::specific_powerup_drop(powerup, GetClosestPointOnNavMesh(player.origin + VectorScale(AnglesToForward(player.angles), 100), 50), powerup_team, powerup_location, pickup_delay, powerup_player, b_stay_forever);
		}
		continue;
	}
	zm_powerups::specific_powerup_drop(powerup, location, powerup_team, powerup_location, pickup_delay, powerup_player, b_stay_forever);
}

/*
	Name: function_30483f5b
	Namespace: namespace_8d243edb
	Checksum: 0x1B4A3EFF
	Offset: 0x8A8
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 122
*/
function function_30483f5b()
{
	namespace_f56b53f0::function_dbe7e78b("Perk");
	powerup = "free_perk";
	location = GetClosestPointOnNavMesh(self.origin + VectorScale(AnglesToForward(self.angles), 100), 50);
	powerup_team = undefined;
	powerup_location = undefined;
	pickup_delay = undefined;
	powerup_player = undefined;
	b_stay_forever = 0;
	zm_powerups::specific_powerup_drop(powerup, location, powerup_team, powerup_location, pickup_delay, powerup_player, b_stay_forever);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8505d133
	Namespace: namespace_8d243edb
	Checksum: 0x5DD93182
	Offset: 0x9A8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 147
*/
function function_8505d133()
{
	n_max = 0;
	var_d26703c0 = 5;
	while(n_max < 50)
	{
		wait(0.05);
		level.var_e08da98[n_max] = var_d26703c0;
		var_d26703c0 = var_d26703c0 + 5;
		n_max++;
	}
	wait(10);
	var_aa788acc = n_max - 1;
	namespace_f56b53f0::function_dbe7e78b("Final Milestone Round = ^3" + level.var_e08da98[var_aa788acc] + " ^7(^5" + var_aa788acc + "^7)");
	thread function_bcaac1ed();
}

/*
	Name: function_bcaac1ed
	Namespace: namespace_8d243edb
	Checksum: 0x1AAC62EC
	Offset: 0xA90
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 174
*/
function function_bcaac1ed()
{
	while(1)
	{
		level waittill("start_of_round");
		foreach(var_d17f0e68 in level.var_e08da98)
		{
			if(level.round_number == var_d17f0e68)
			{
				level.var_323a641a = 1;
				namespace_f56b53f0::function_dbe7e78b("Milestone Pending");
			}
		}
		if(isdefined(level.var_323a641a) && level.var_323a641a)
		{
			level waittill("end_of_round");
			level.var_d1da0582++;
			thread function_9374232();
			level notify("hash_d8d3b54b", level.var_e08da98);
			namespace_f56b53f0::function_dbe7e78b("Total Milestones: ^3" + level.var_d1da0582);
			level.var_323a641a = 0;
			continue;
		}
		level.var_323a641a = 0;
	}
}

/*
	Name: function_a4fde264
	Namespace: namespace_8d243edb
	Checksum: 0xF94A102B
	Offset: 0xBF0
	Size: 0x30C
	Parameters: 0
	Flags: None
	Line Number: 211
*/
function function_a4fde264()
{
	level.var_9ba4ad4a = 1;
	level notify("hash_6781e446");
	wait(randomIntRange(3, 8));
	foreach(player in GetPlayers())
	{
		player playlocalsound("vk_tra_controller_switch_rumbling");
	}
	var_e2a39df0 = 0;
	var_98fa099a = 0;
	while(var_e2a39df0 < 30)
	{
		foreach(player in GetPlayers())
		{
			Earthquake(0.1 + var_98fa099a, 0.1, player.origin, 500);
		}
		wait(0.1);
		var_98fa099a = var_98fa099a + 0.005;
		var_e2a39df0++;
	}
	foreach(player in GetPlayers())
	{
		player playlocalsound("vk_zm_ann_" + level.var_4011a94e + "_switch");
		Earthquake(1, 0.5, player.origin, 500);
	}
	namespace_f56b53f0::function_dbe7e78b("^5Survival Night");
	level.var_48ea0a78 = 1;
	level notify("hash_6636ecec", GetPlayers(), GetPlayers(), GetPlayers());
	wait(9);
	GetPlayers()[0] thread function_30483f5b();
}

