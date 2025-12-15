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
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_de74c222;

/*
	Name: __init__sytem__
	Namespace: namespace_de74c222
	Checksum: 0xF72004A
	Offset: 0x348
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 36
*/
function autoexec __init__sytem__()
{
	system::register("zm_weap_ammo_counter", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_de74c222
	Checksum: 0x3E56C47C
	Offset: 0x388
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function __init__()
{
	clientfield::register("toplayer", "ammo_counter", 9000, 2, "int");
	callback::on_connect(&on_player_connect);
}

/*
	Name: on_player_connect
	Namespace: namespace_de74c222
	Checksum: 0xFB818ACF
	Offset: 0x3E8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function on_player_connect()
{
	self thread function_2a01d7a3();
}

/*
	Name: function_2a01d7a3
	Namespace: namespace_de74c222
	Checksum: 0x81506CFF
	Offset: 0x410
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 84
*/
function function_2a01d7a3()
{
	self endon("disconnect");
	while(1)
	{
		self clientfield::set_to_player("ammo_counter", 1);
		self waittill("reload_start");
		self clientfield::set_to_player("ammo_counter", 0);
		while(self IsReloading())
		{
			wait(0.05);
		}
	}
}

