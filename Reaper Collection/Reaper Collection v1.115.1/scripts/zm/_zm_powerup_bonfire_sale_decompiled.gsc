#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;

#namespace zm_powerup_bonfire_sale;

/*
	Name: __init__sytem__
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x424F4353
	Offset: 0x348
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 25
*/
function autoexec __init__sytem__()
{
	system::register("zm_powerup_bonfire_sale", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x424F4353
	Offset: 0x390
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function __init__()
{
	zm_powerups::register_powerup("bonfire_sale", &grab_bonfire_sale);
	if(ToLower(GetDvarString("g_gametype")) != "zcleansed")
	{
		zm_powerups::add_zombie_powerup("bonfire_sale", "zombie_bonfiresale", &"ZOMBIE_POWERUP_MAX_AMMO", &zm_powerups::func_should_never_drop, 0, 0, 0, undefined, "powerup_bon_fire", "zombie_powerup_bonfire_sale_time", "zombie_powerup_bonfire_sale_on");
		zm_powerups::powerup_set_statless_powerup("bonfire_sale");
	}
}

/*
	Name: __main__
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x424F4353
	Offset: 0x470
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function __main__()
{
	level thread setup_bonfiresale_audio();
}

/*
	Name: grab_bonfire_sale
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x424F4353
	Offset: 0x498
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 75
*/
function grab_bonfire_sale(player)
{
	level thread start_bonfire_sale(self);
	player thread zm_powerups::powerup_vo("firesale");
}

/*
	Name: start_bonfire_sale
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x424F4353
	Offset: 0x4E8
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 91
*/
function start_bonfire_sale(item)
{
	level notify("powerup_bonfire_sale");
	level endon("powerup_bonfire_sale");
	temp_ent = spawn("script_origin", (0, 0, 0));
	temp_ent PlayLoopSound("zmb_double_point_loop");
	level.zombie_vars["zombie_powerup_bonfire_sale_on"] = 1;
	level thread toggle_bonfire_sale_on();
	level.zombie_vars["zombie_powerup_bonfire_sale_time"] = 30;
	if(bgb::is_team_enabled("zm_bgb_temporal_gift"))
	{
		level.zombie_vars["zombie_powerup_bonfire_sale_time"] = level.zombie_vars["zombie_powerup_bonfire_sale_time"] + 30;
	}
	while(level.zombie_vars["zombie_powerup_bonfire_sale_time"] > 0)
	{
		wait(0.05);
		level.zombie_vars["zombie_powerup_bonfire_sale_time"] = level.zombie_vars["zombie_powerup_bonfire_sale_time"] - 0.05;
	}
	level.zombie_vars["zombie_powerup_bonfire_sale_on"] = 0;
	level notify("bonfire_sale_off");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] playsound("zmb_points_loop_off");
	}
	temp_ent delete();
}

/*
	Name: toggle_bonfire_sale_on
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x424F4353
	Offset: 0x6D8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 129
*/
function toggle_bonfire_sale_on()
{
	level endon("powerup_bonfire_sale");
	if(!isdefined(level.zombie_vars["zombie_powerup_bonfire_sale_on"]))
	{
		return;
	}
	if(level.zombie_vars["zombie_powerup_bonfire_sale_on"])
	{
		if(isdefined(level.bonfire_init_func))
		{
			level thread [[level.bonfire_init_func]]();
		}
		level waittill("bonfire_sale_off");
	}
}

/*
	Name: setup_bonfiresale_audio
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x424F4353
	Offset: 0x748
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 156
*/
function setup_bonfiresale_audio()
{
	wait(2);
	intercom = GetEntArray("intercom", "targetname");
	while(1)
	{
		while(level.zombie_vars["zombie_powerup_fire_sale_on"] == 0)
		{
			wait(0.2);
		}
		for(i = 0; i < intercom.size; i++)
		{
			intercom[i] thread play_bonfiresale_audio();
		}
		while(level.zombie_vars["zombie_powerup_fire_sale_on"] == 1)
		{
			wait(0.1);
		}
		level notify("firesale_over");
	}
}

/*
	Name: play_bonfiresale_audio
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x424F4353
	Offset: 0x840
	Size: 0x8C
	Parameters: 0
	Flags: None
	Line Number: 188
*/
function play_bonfiresale_audio()
{
	if(isdefined(level.sndFiresaleMusOff) && level.sndFiresaleMusOff)
	{
		return;
	}
	if(isdefined(level.sndAnnouncerIsRich) && level.sndAnnouncerIsRich)
	{
		self PlayLoopSound("mus_fire_sale_rich");
	}
	else
	{
		self PlayLoopSound("mus_fire_sale");
	}
	level waittill("firesale_over");
	self StopLoopSound();
}

