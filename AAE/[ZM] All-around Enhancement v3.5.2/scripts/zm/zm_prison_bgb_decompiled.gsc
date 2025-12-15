#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\bgbs\_zm_bgb_anywhere_but_here;

#namespace namespace_c42a3a58;

/*
	Name: init
	Namespace: namespace_c42a3a58
	Checksum: 0x424F4353
	Offset: 0x338
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function init()
{
	level.added_initial_streamer_blackscreen = 0.475;
	level.var_2c12d9a6 = &function_87e8d1cb;
	level.customHudReveal = &customHudReveal;
}

/*
	Name: customHudReveal
	Namespace: namespace_c42a3a58
	Checksum: 0x424F4353
	Offset: 0x388
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function customHudReveal()
{
	self endon("disconnect");
	self endon("death");
	level flag::wait_till("afterlife_start_over");
	self setClientUIVisibilityFlag("hud_visible", 1);
	self setClientUIVisibilityFlag("weapon_hud_visible", 1);
}

/*
	Name: function_87e8d1cb
	Namespace: namespace_c42a3a58
	Checksum: 0x424F4353
	Offset: 0x408
	Size: 0xAC
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function function_87e8d1cb()
{
	str_player_zone = self zm_zonemgr::get_player_zone();
	if(str_player_zone == "z_bridge")
	{
		Respawns = struct::get_array("z_bridge_player_respawns", "targetname");
		var_68140f76 = Array::random(Respawns);
	}
	else
	{
		var_68140f76 = self namespace_93b7f03::function_728dfe3();
	}
	return var_68140f76;
}

