#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\flag_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_utility;

#namespace namespace_88adf060;

/*
	Name: round_wait_override
	Namespace: namespace_88adf060
	Checksum: 0x424F4353
	Offset: 0x1B8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 18
*/
function round_wait_override()
{
	level endon("restart_round");
	level endon("kill_round");
	wait(1);
	while(1)
	{
		should_wait = level.zombie_total > 0 || level.intermission;
		if(!should_wait)
		{
			return;
		}
		if(level flag::get("end_round_wait"))
		{
			return;
		}
		wait(1);
	}
}

/*
	Name: function_97b4fac5
	Namespace: namespace_88adf060
	Checksum: 0x424F4353
	Offset: 0x248
	Size: 0x2C0
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function function_97b4fac5()
{
	level.round_wait_func = &round_wait_override;
	level.custom_game_over_hud_elem = &function_a31d6fb8;
	wait(0.5);
	level.next_dog_round = 9999;
	level.zombie_vars["zombie_between_round_time"] = 0;
	level.zombie_round_start_delay = 0;
	level.var_be0b76dc = [];
	if(isdefined(level.var_d70d8449))
	{
		level.var_d70d8449 destroy();
	}
	level.var_d70d8449 = NewHudElem();
	level.var_9d7722be = 1;
	if(!isdefined(level.var_be0b76dc["timed_hud_offset"]))
	{
		level.var_be0b76dc["timed_hud_offset"] = 0;
	}
	level.var_e95fa01e = spawnstruct();
	level.var_e95fa01e.days = 0;
	level.var_e95fa01e.hours = 0;
	level.var_e95fa01e.minutes = 0;
	level.var_e95fa01e.seconds = 0;
	level.var_e95fa01e.var_af657d58 = 0;
	level.var_d70d8449.foreground = 1;
	level.var_d70d8449.sort = 2;
	level.var_d70d8449.hidewheninmenu = 0;
	level.var_d70d8449.fontscale = 1;
	level.var_d70d8449.alignX = "left";
	level.var_d70d8449.alignY = "bottom";
	level.var_d70d8449.horzAlign = "left";
	level.var_d70d8449.vertAlign = "bottom";
	level.var_d70d8449.x = 100;
	level.var_d70d8449.y = -65 + level.var_be0b76dc["timed_hud_offset"];
	level.var_d70d8449.alpha = 0;
	level flag::wait_till("initial_blackscreen_passed");
	level.var_d70d8449 SetTimerUp(0);
	thread function_19b7f470();
	level.var_d70d8449.alpha = 1;
}

/*
	Name: function_19b7f470
	Namespace: namespace_88adf060
	Checksum: 0x424F4353
	Offset: 0x510
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 100
*/
function function_19b7f470()
{
	level endon("end_game");
	while(1)
	{
		if(level.var_e95fa01e.seconds >= 59)
		{
			level.var_e95fa01e.seconds = 0;
			level.var_e95fa01e.minutes++;
		}
		if(level.var_e95fa01e.minutes >= 59)
		{
			level.var_e95fa01e.minutes = 0;
			level.var_e95fa01e.hours++;
		}
		if(level.var_e95fa01e.hours >= 23)
		{
			level.var_e95fa01e.hours = 0;
			level.var_e95fa01e.days++;
		}
		level.var_e95fa01e.seconds++;
		level.var_e95fa01e.var_af657d58++;
		wait(1);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a31d6fb8
	Namespace: namespace_88adf060
	Checksum: 0x424F4353
	Offset: 0x610
	Size: 0x4E8
	Parameters: 3
	Flags: None
	Line Number: 138
*/
function function_a31d6fb8(player, game_over, survived)
{
	level.var_d70d8449 destroy();
	var_745b732e = newClientHudElem(player);
	game_over.alignX = "center";
	game_over.alignY = "middle";
	game_over.horzAlign = "center";
	game_over.vertAlign = "middle";
	game_over.y = game_over.y - 130;
	game_over.foreground = 1;
	game_over.fontscale = 3;
	game_over.alpha = 0;
	game_over.color = (1, 1, 1);
	game_over.hidewheninmenu = 1;
	game_over setText("Game Over!");
	game_over fadeOverTime(1);
	game_over.alpha = 1;
	if(player IsSplitscreen())
	{
		game_over.fontscale = 2;
		game_over.y = game_over.y + 40;
	}
	var_ab4c8924 = "";
	var_167c2aa6 = "";
	var_cd8cca36 = "";
	var_85f241f0 = "";
	if(level.var_e95fa01e.seconds > 0)
	{
		var_ab4c8924 = level.var_e95fa01e.seconds + "s ";
	}
	if(level.var_e95fa01e.minutes > 0)
	{
		var_167c2aa6 = level.var_e95fa01e.minutes + "m ";
	}
	if(level.var_e95fa01e.hours > 0)
	{
		var_cd8cca36 = level.var_e95fa01e.hours + "h ";
	}
	if(level.var_e95fa01e.days > 0)
	{
		var_85f241f0 = level.var_e95fa01e.days + "d ";
	}
	if(var_85f241f0 + var_cd8cca36 + var_167c2aa6 + var_ab4c8924 == "")
	{
		var_ab4c8924 = "0s";
	}
	var_745b732e.alignX = "center";
	var_745b732e.alignY = "middle";
	var_745b732e.horzAlign = "center";
	var_745b732e.vertAlign = "middle";
	var_745b732e.y = var_745b732e.y - 100;
	var_745b732e.foreground = 1;
	var_745b732e.fontscale = 2;
	var_745b732e.alpha = 0;
	var_745b732e.color = (1, 1, 1);
	var_745b732e.hidewheninmenu = 1;
	if(player IsSplitscreen())
	{
		var_745b732e.fontscale = 1.5;
		var_745b732e.y = var_745b732e.y + 40;
	}
	survived.y = survived.y - 999;
	var_745b732e setText("You survived " + var_85f241f0 + var_cd8cca36 + var_167c2aa6 + var_ab4c8924);
	var_745b732e fadeOverTime(1);
	var_745b732e.alpha = 1;
	thread function_299f59a3(var_745b732e);
}

/*
	Name: function_299f59a3
	Namespace: namespace_88adf060
	Checksum: 0x424F4353
	Offset: 0xB00
	Size: 0x34
	Parameters: 1
	Flags: None
	Line Number: 216
*/
function function_299f59a3(hud)
{
	wait(level.zombie_vars["zombie_intermission_time"]);
	hud destroy();
}

