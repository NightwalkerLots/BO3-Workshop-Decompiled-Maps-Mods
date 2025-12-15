#include scripts\shared\flag_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_zod_margwa;

#namespace namespace_61e3933;

/*
	Name: __init__sytem__
	Namespace: namespace_61e3933
	Checksum: 0x424F4353
	Offset: 0x2C8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("zm_zod_gamemodes", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_61e3933
	Checksum: 0x424F4353
	Offset: 0x310
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
}

/*
	Name: __main__
	Namespace: namespace_61e3933
	Checksum: 0x424F4353
	Offset: 0x320
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function __main__()
{
	function_dcf365a8();
	thread function_f9c48e77();
	level.var_9b0e8260 = &namespace_d17e1da0::function_8bcb72e9;
	level thread function_4766c9ec();
}

/*
	Name: function_4766c9ec
	Namespace: namespace_61e3933
	Checksum: 0x424F4353
	Offset: 0x380
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 68
*/
function function_4766c9ec()
{
	level endon("hash_a8854cf3");
	level flag::wait_till("initial_blackscreen_passed");
	for(;;)
	{
		players = zm_zonemgr::get_players_in_zone("zone_junction_start", 1);
		if(isdefined(players) && IsArray(players))
		{
			foreach(player in players)
			{
				if(isPlayer(player))
				{
					if(!player flag::get("in_beastmode"))
					{
						level flag::set("connect_start_to_junction");
						return;
					}
				}
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_f9c48e77
	Namespace: namespace_61e3933
	Checksum: 0x424F4353
	Offset: 0x4D8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 103
*/
function function_f9c48e77()
{
	level flag::wait_till("ee_book");
	level.var_421ff75e = 1;
	for(i = 1; i < 4; i++)
	{
		level thread function_aa59a3dc(i);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_aa59a3dc
	Namespace: namespace_61e3933
	Checksum: 0x424F4353
	Offset: 0x558
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 125
*/
function function_aa59a3dc(i)
{
	level endon("hash_53e673b7");
	level waittill("hash_fbc505ba");
	rail = GetEnt("ee_district_rail_electrified_" + i, "targetname");
	rail waittill("trigger", e_player);
	while(1)
	{
		level flag::wait_till_clear("ee_district_rail_electrified_" + i);
		rail notify("trigger", e_player);
		wait(0.05);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dcf365a8
	Namespace: namespace_61e3933
	Checksum: 0x424F4353
	Offset: 0x620
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 151
*/
function function_dcf365a8()
{
	zm_powerups::register_powerup("beast_mana", &function_fb2447d7);
	if(ToLower(GetDvarString("g_gametype")) != "zcleansed")
	{
		zm_powerups::add_zombie_powerup("beast_mana", "p7_zm_zod_beast_basin", &"ZM_ZOD_POWERUP_BEAST_MANA", &function_12546e2, 0, 0, 0);
	}
}

/*
	Name: function_12546e2
	Namespace: namespace_61e3933
	Checksum: 0x424F4353
	Offset: 0x6C8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 170
*/
function function_12546e2()
{
	result = level flag::get("ritual_pap_complete");
	if(result)
	{
		return 0;
	}
	return RandomInt(100) >= 75;
}

/*
	Name: function_fb2447d7
	Namespace: namespace_61e3933
	Checksum: 0x424F4353
	Offset: 0x728
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 190
*/
function function_fb2447d7(player)
{
	level thread function_98d4dd81(self, player);
	player thread zm_powerups::powerup_vo("bonus_points_solo");
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_98d4dd81
	Namespace: namespace_61e3933
	Checksum: 0x424F4353
	Offset: 0x778
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 209
*/
function function_98d4dd81(item, player)
{
	foreach(player in level.activePlayers)
	{
		player.beastmana = 1;
		player.beastlives++;
	}
	level thread function_5cff02a2(item, player.team);
}

/*
	Name: function_5cff02a2
	Namespace: namespace_61e3933
	Checksum: 0x424F4353
	Offset: 0x848
	Size: 0x128
	Parameters: 2
	Flags: None
	Line Number: 229
*/
function function_5cff02a2(drop_item, player_team)
{
	self endon("disconnect");
	hudelem = hud::createServerFontString("objective", 2, player_team);
	hudelem hud::setPoint("TOP", undefined, 0, level.zombie_vars["zombie_timer_offset"] - level.zombie_vars["zombie_timer_offset_interval"] * 2);
	hudelem.sort = 0.5;
	hudelem.alpha = 0;
	hudelem fadeOverTime(0.5);
	hudelem.alpha = 1;
	if(isdefined(drop_item))
	{
		hudelem.label = drop_item.hint;
	}
	hudelem thread full_ammo_move_hud(player_team);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: full_ammo_move_hud
	Namespace: namespace_61e3933
	Checksum: 0x424F4353
	Offset: 0x978
	Size: 0xD4
	Parameters: 1
	Flags: None
	Line Number: 257
*/
function full_ammo_move_hud(player_team)
{
	players = GetPlayers(player_team);
	players[0] playsoundtoteam("zmb_full_ammo", player_team);
	wait(0.5);
	move_fade_time = 1.5;
	self fadeOverTime(move_fade_time);
	self MoveOverTime(move_fade_time);
	self.y = 270;
	self.alpha = 0;
	wait(move_fade_time);
	self destroy();
}

