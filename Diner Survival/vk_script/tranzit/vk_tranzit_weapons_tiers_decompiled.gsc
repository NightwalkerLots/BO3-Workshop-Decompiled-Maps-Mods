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
#include scripts\zm\_zm_perk_directionalfire;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_f6342174;

/*
	Name: init
	Namespace: namespace_f6342174
	Checksum: 0x1E35B85C
	Offset: 0x380
	Size: 0x10
	Parameters: 0
	Flags: AutoExec
	Line Number: 38
*/
function autoexec init()
{
	level waittill("hash_f938585a");
}

