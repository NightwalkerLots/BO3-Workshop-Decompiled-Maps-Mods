#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\hud_message_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_faller;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_server_throttle;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_weapons;

#namespace namespace_d96d7247;

/*
	Name: function_6e36800
	Namespace: namespace_d96d7247
	Checksum: 0x424F4353
	Offset: 0x380
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function function_6e36800()
{
	level flag::wait_till("initial_blackscreen_passed");
	while(1)
	{
		function_c28f91fe(zombie_utility::get_current_zombie_count() + level.zombie_total);
		wait(0.05);
	}
}

/*
	Name: function_c28f91fe
	Namespace: namespace_d96d7247
	Checksum: 0x424F4353
	Offset: 0x3F0
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 58
*/
function function_c28f91fe(num)
{
	if(num < 1)
	{
		num = 0;
	}
	if(!isdefined(level.var_60a9917b))
	{
		level.var_60a9917b = num;
		LUINotifyEvent(&"elmg_zcounter", 1, num);
	}
	else if(level.var_60a9917b != num)
	{
		level.var_60a9917b = num;
		LUINotifyEvent(&"elmg_zcounter", 1, num);
		return;
	}
}

/*
	Name: function_cf9cbbb
	Namespace: namespace_d96d7247
	Checksum: 0x424F4353
	Offset: 0x498
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function function_cf9cbbb()
{
	return;
}

/*
	Name: function_c21ff941
	Namespace: namespace_d96d7247
	Checksum: 0x424F4353
	Offset: 0x4A8
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 102
*/
function function_c21ff941(hudArray)
{
}

/*
	Name: function_21bd5d89
	Namespace: namespace_d96d7247
	Checksum: 0x424F4353
	Offset: 0x4C0
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 116
*/
function function_21bd5d89(hudArray)
{
}

/*
	Name: function_aa339d24
	Namespace: namespace_d96d7247
	Checksum: 0x424F4353
	Offset: 0x4D8
	Size: 0x38
	Parameters: 6
	Flags: None
	Line Number: 130
*/
function function_aa339d24(var_d78b8c6a, var_879907e9, var_80a57fef, var_5aa30586, foreground, fontscale)
{
}

/*
	Name: function_7c5503de
	Namespace: namespace_d96d7247
	Checksum: 0x424F4353
	Offset: 0x518
	Size: 0x20
	Parameters: 3
	Flags: None
	Line Number: 144
*/
function function_7c5503de(newcolor, newAlpha, fadetime)
{
}

/*
	Name: function_a2ecdb47
	Namespace: namespace_d96d7247
	Checksum: 0x424F4353
	Offset: 0x540
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 158
*/
function function_a2ecdb47(var_ec404e3d, fadetime)
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c5126328
	Namespace: namespace_d96d7247
	Checksum: 0x424F4353
	Offset: 0x560
	Size: 0x14
	Parameters: 2
	Flags: None
	Line Number: 174
*/
function function_c5126328(var_e14a6a24, fadetime)
{
}

