#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
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

#namespace namespace_c40afdfc;

/*
	Name: init
	Namespace: namespace_c40afdfc
	Checksum: 0xFEFF116
	Offset: 0x4E8
	Size: 0x50
	Parameters: 0
	Flags: AutoExec
	Line Number: 38
*/
function autoexec init()
{
	level waittill("all_players_connected");
	wait(5);
	thread function_50704672();
	thread function_2bf1247c();
	thread function_fb9e92e5();
}

/*
	Name: function_50704672
	Namespace: namespace_c40afdfc
	Checksum: 0x3D118ED0
	Offset: 0x540
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function function_50704672()
{
	level.var_4025bbc9 = 0;
	zombie_utility::set_zombie_var("zombie_health_increase", 150, 0);
	zombie_utility::set_zombie_var("zombie_health_increase_multiplier", 0.1, 1);
	zombie_utility::set_zombie_var("zombie_health_start", 150, 0);
	zombie_utility::set_zombie_var("zombie_spawn_delay", 2, 1);
	zombie_utility::set_zombie_var("zombie_new_runner_interval", 35, 0);
	zombie_utility::set_zombie_var("zombie_max_ai", 24, 0);
	zombie_utility::set_zombie_var("zombie_ai_per_player", 6, 0);
	zombie_utility::set_zombie_var("below_world_check", -99999);
	zombie_utility::set_zombie_var("spectators_respawn", 1);
	zombie_utility::set_zombie_var("zombie_use_failsafe", 1);
	zombie_utility::set_zombie_var("zombie_move_speed_multiplier", 20, 0);
	zombie_utility::set_zombie_var("zombie_move_speed_multiplier_easy", 20, 0);
	level.zombie_move_speed = level.round_number * level.zombie_vars["zombie_move_speed_multiplier"];
}

/*
	Name: function_648356b9
	Namespace: namespace_c40afdfc
	Checksum: 0x36C7EA5D
	Offset: 0x708
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 85
*/
function function_648356b9()
{
	for(var_d9eeb03f = 0; var_d9eeb03f < 3; var_d9eeb03f++)
	{
		level.var_4025bbc9 = 1;
		zombie_utility::set_zombie_var("zombie_health_increase", 250, 0);
		zombie_utility::set_zombie_var("zombie_health_increase_multiplier", 0.2, 1);
		zombie_utility::set_zombie_var("zombie_health_start", 200, 0);
		zombie_utility::set_zombie_var("zombie_spawn_delay", 1.8, 1);
		zombie_utility::set_zombie_var("zombie_new_runner_interval", 10, 0);
		zombie_utility::set_zombie_var("zombie_max_ai", 26, 0);
		zombie_utility::set_zombie_var("zombie_ai_per_player", 8, 0);
		zombie_utility::set_zombie_var("below_world_check", -9999);
		zombie_utility::set_zombie_var("spectators_respawn", 1);
		zombie_utility::set_zombie_var("zombie_use_failsafe", 1);
		zombie_utility::set_zombie_var("zombie_move_speed_multiplier", 99, 0);
		zombie_utility::set_zombie_var("zombie_move_speed_multiplier_easy", 99, 0);
		level.zombie_move_speed = level.round_number * level.zombie_vars["zombie_move_speed_multiplier"];
		wait(10);
	}
}

/*
	Name: function_2bf1247c
	Namespace: namespace_c40afdfc
	Checksum: 0x6256A6D8
	Offset: 0x900
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 117
*/
function function_2bf1247c()
{
	level waittill("hash_659f5009");
	thread function_648356b9();
	namespace_f56b53f0::function_dbe7e78b("Hardcore Enabled");
	level.var_fc09d9d8 = 10;
	level.var_539333a5 = 1.1;
	level.var_8f600856 = 250;
	thread function_f3b3a9a6();
	while(level.round_number < 10)
	{
		wait(0.15);
	}
	level.var_fc09d9d8 = 15;
	level.var_539333a5 = 1.15;
	level.var_8f600856 = 1000;
	while(level.round_number < 20)
	{
		wait(0.15);
	}
	level.var_fc09d9d8 = 20;
	level.var_539333a5 = 1.2;
	level.var_8f600856 = 2500;
}

/*
	Name: function_fb9e92e5
	Namespace: namespace_c40afdfc
	Checksum: 0x55335B2E
	Offset: 0xA08
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 152
*/
function function_fb9e92e5()
{
	modvar("hardcore", "0");
	while(1)
	{
		if(GetDvarInt("hardcore") != 0)
		{
			IPrintLnBold("Hardcore Enabled");
			level notify("hash_659f5009");
			SetDvar("hardcore", 0);
			break;
		}
		wait(0.1);
	}
}

/*
	Name: function_f3b3a9a6
	Namespace: namespace_c40afdfc
	Checksum: 0xE3220732
	Offset: 0xAB0
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 178
*/
function function_f3b3a9a6()
{
	while(1)
	{
		enemies = GetAISpeciesArray("axis", "all");
		foreach(enemy in enemies)
		{
			rnd = randomIntRange(1, 100);
			oldhealth = enemy.health;
			tank = enemy.health + level.var_8f600856;
			if(rnd < level.var_fc09d9d8)
			{
				enemy ASMSetAnimationRate(level.var_539333a5);
				enemy setMoveSpeedScale(level.var_539333a5);
				enemy.health = tank;
				namespace_f56b53f0::function_dbe7e78b("^5(SZ) ^7Speed: ^3" + level.var_539333a5 + " ^7Chance: ^3" + level.var_fc09d9d8 + " ^7New Health: ^3" + enemy.health + " ^7Old Health: ^3" + oldhealth);
			}
		}
		wait(randomIntRange(32, 256));
	}
}

