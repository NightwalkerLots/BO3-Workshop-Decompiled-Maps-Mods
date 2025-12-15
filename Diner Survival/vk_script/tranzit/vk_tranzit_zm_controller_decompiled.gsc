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

#namespace namespace_85fb539c;

/*
	Name: init
	Namespace: namespace_85fb539c
	Checksum: 0xD572C2AC
	Offset: 0x640
	Size: 0x98
	Parameters: 0
	Flags: AutoExec
	Line Number: 37
*/
function autoexec init()
{
	clientfield::register("toplayer", "custom_set_eye_color", 1, 4, "int");
	level waittill("hash_f938585a");
	thread function_402d2606();
	thread function_1f04fb80();
	thread function_258e26b3();
	thread debug();
	thread function_c7d8dba7();
}

/*
	Name: function_258e26b3
	Namespace: namespace_85fb539c
	Checksum: 0xC999B04C
	Offset: 0x6E0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function function_258e26b3()
{
	level.var_4011a94e = "samantha";
	level notify("hash_7aaada6a");
	while(level.round_number < 25)
	{
		wait(0.1);
	}
	level waittill("hash_7c194194");
	thread function_d778ded();
}

/*
	Name: function_d778ded
	Namespace: namespace_85fb539c
	Checksum: 0x307E0098
	Offset: 0x748
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function function_d778ded()
{
	a = 0;
	while(1)
	{
		wait(0.05);
		foreach(player in GetPlayers())
		{
			if(isdefined(player.zombie_vars["zombie_powerup_minigun_on"]) && player.zombie_vars["zombie_powerup_minigun_on"])
			{
				a = 1;
			}
		}
		if(a)
		{
			a = 0;
			continue;
			continue;
			break;
		}
	}
	level.zombie_powerup_weapon["minigun"] = GetWeapon("vk_tra_spc_minigun_lvl2");
	return;
	wait(GetPlayers());
}

/*
	Name: function_402d2606
	Namespace: namespace_85fb539c
	Checksum: 0x32D3B91E
	Offset: 0x878
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 116
*/
function function_402d2606()
{
	level waittill("end_game");
	wait(0.1);
	foreach(player in GetPlayers())
	{
		if(level.var_4011a94e == "samantha")
		{
			thread namespace_f56b53f0::function_dbe7e78b("Samantha Laugh");
			player playlocalsound("vk_zmb_laugh_samantha");
		}
		if(level.var_4011a94e == "richtofen")
		{
			thread namespace_f56b53f0::function_dbe7e78b("Richtofen Laugh");
			player playlocalsound("vk_zmb_laugh_richtofen");
		}
		if(level.var_4011a94e == "avagadro")
		{
			thread namespace_f56b53f0::function_dbe7e78b("Avagadro Laugh");
			player playlocalsound("vk_zmb_laugh_avagadro");
		}
		if(level.var_4011a94e == "monty")
		{
			thread namespace_f56b53f0::function_dbe7e78b("Monty Laugh");
			player playlocalsound("vk_zmb_laugh_monty");
		}
	}
}

/*
	Name: function_1f04fb80
	Namespace: namespace_85fb539c
	Checksum: 0x7DFB9685
	Offset: 0xA58
	Size: 0x4A8
	Parameters: 0
	Flags: None
	Line Number: 155
*/
function function_1f04fb80()
{
	while(1)
	{
		level waittill("hash_7aaada6a");
		thread namespace_f56b53f0::function_dbe7e78b("^1ZM CONTROLLER ^2>> ^4UPDATE");
		if(level.var_4011a94e == "samantha")
		{
			thread namespace_f56b53f0::function_dbe7e78b("^3Samantha");
			level._effect["powerup_grabbed"] = "vk_fx/zm/_vk_zm_powerup_samantha_grab";
			level._effect["powerup_grabbed_solo"] = "vk_fx/zm/_vk_zm_powerup_samantha_grab";
			level._effect["dog_eye_glow"] = "vk_fx/zm/_vk_zm_dog_eyes_samantha";
			foreach(player in GetPlayers())
			{
				player clientfield::set_to_player("custom_set_eye_color", 1);
			}
		}
		else if(level.var_4011a94e == "richtofen")
		{
			thread namespace_f56b53f0::function_dbe7e78b("^5Richtofen");
			level._effect["powerup_grabbed"] = "vk_fx/zm/_vk_zm_powerup_richtofen_grab";
			level._effect["powerup_grabbed_solo"] = "vk_fx/zm/_vk_zm_powerup_richtofen_grab";
			level._effect["dog_eye_glow"] = "vk_fx/zm/_vk_zm_dog_eyes_richtofen";
			foreach(player in GetPlayers())
			{
				player clientfield::set_to_player("custom_set_eye_color", 2);
			}
		}
		else if(level.var_4011a94e == "avagadro")
		{
			thread namespace_f56b53f0::function_dbe7e78b("^7Avagadro");
			level._effect["powerup_grabbed"] = "vk_fx/zm/_vk_zm_powerup_avogadro_grab";
			level._effect["powerup_grabbed_solo"] = "vk_fx/zm/_vk_zm_powerup_avogadro_grab";
			level._effect["dog_eye_glow"] = "vk_fx/zm/_vk_zm_dog_eyes_avogadro";
			foreach(player in GetPlayers())
			{
				player clientfield::set_to_player("custom_set_eye_color", 3);
			}
		}
		else if(level.var_4011a94e == "monty")
		{
			thread namespace_f56b53f0::function_dbe7e78b("^1Monty");
			level._effect["powerup_grabbed"] = "vk_fx/zm/_vk_zm_powerup_monty_grab";
			level._effect["powerup_grabbed_solo"] = "vk_fx/zm/_vk_zm_powerup_monty_grab";
			level._effect["dog_eye_glow"] = "vk_fx/zm/_vk_zm_dog_eyes_monty";
			foreach(player in GetPlayers())
			{
				player clientfield::set_to_player("custom_set_eye_color", 4);
			}
		}
		wait(0.05);
	}
}

/*
	Name: debug
	Namespace: namespace_85fb539c
	Checksum: 0x8F8F521D
	Offset: 0xF08
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 219
*/
function debug()
{
	modvar("vk_zm_controller", "");
	SetDvar("vk_zm_controller", "");
	while(1)
	{
		if(GetDvarString("vk_zm_controller") != "")
		{
			string = GetDvarString("vk_zm_controller");
			if(string == "samantha" || string == "richtofen" || string == "avagadro" || string == "monty")
			{
				level.var_4011a94e = string;
			}
			level notify("hash_7aaada6a");
			SetDvar("vk_zm_controller", "");
		}
		wait(0.1);
	}
}

/*
	Name: function_c7d8dba7
	Namespace: namespace_85fb539c
	Checksum: 0xC02D8B6C
	Offset: 0x1030
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 249
*/
function function_c7d8dba7()
{
	wait(1);
	level._effect["powerup_grabbed"] = "vk_fx/zm/_vk_zm_powerup_samantha_grab";
	level._effect["powerup_grabbed_solo"] = "vk_fx/zm/_vk_zm_powerup_samantha_grab";
}

/*
	Name: function_c35b57af
	Namespace: namespace_85fb539c
	Checksum: 0xBE9F1A26
	Offset: 0x1080
	Size: 0xFA
	Parameters: 1
	Flags: None
	Line Number: 266
*/
function function_c35b57af(type)
{
	namespace_f56b53f0::function_dbe7e78b("Playing Announcer Sound: '^3vk_zm_ann_" + level.var_4011a94e + "_" + type + "^7'");
	foreach(player in GetPlayers())
	{
		player playlocalsound("vk_zm_ann_" + level.var_4011a94e + "_" + type);
	}
}

