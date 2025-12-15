#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\zm\_zm_score;

#namespace namespace_c03cdda1;

/*
	Name: function_e407ea
	Namespace: namespace_c03cdda1
	Checksum: 0x3AC0E0EE
	Offset: 0x1A8
	Size: 0x2B0
	Parameters: 0
	Flags: None
	Line Number: 16
*/
function function_e407ea()
{
	level.var_a2dcc08c = 0;
	level.var_36e894d0 = struct::get("black_orgs_0", "targetname");
	level.var_85894d4b = [];
	for(i = 0; i < level.var_36e894d0.size; i++)
	{
		level.var_85894d4b[i] = struct::get(level.var_36e894d0[i].target, "targetname");
	}
	var_db2f6dac = GetEntArray("teleport_player_string", "targetname");
	var_b2a902ad = GetEntArray("teleport_player", "targetname");
	for(i = 0; i < var_db2f6dac.size; i++)
	{
		var_db2f6dac[i] setcursorhint("HINT_NOICON");
		var_db2f6dac[i] setHintString(&"ZOMBIE_NEED_POWER");
	}
	wait_for_power();
	for(i = 0; i < var_db2f6dac.size; i++)
	{
		var_db2f6dac[i] delete();
	}
	for(i = 0; i < var_b2a902ad.size; i++)
	{
		var_b2a902ad[i] thread function_a066b974(i);
	}
	level.var_36e894d0 = struct::get("black_orgs_0", "targetname");
	level.var_85894d4b = [];
	for(i = 0; i < level.var_36e894d0.size; i++)
	{
		level.var_85894d4b[i] = struct::get(level.var_36e894d0[i].target, "targetname");
	}
}

/*
	Name: function_a066b974
	Namespace: namespace_c03cdda1
	Checksum: 0xB9004541
	Offset: 0x460
	Size: 0x3F0
	Parameters: 1
	Flags: None
	Line Number: 59
*/
function function_a066b974(player_num)
{
	while(1)
	{
		self waittill("trigger", player);
		wait(0.1);
		level.var_a2dcc08c = 1;
		playsoundatposition("robot_head_bg_03", (-969, 1744, -6));
		wait(14);
		playsoundatposition("robot_alarm", (-969, 1744, -6));
		FX = spawn("script_model", (-969, 1744, -6));
		FX.angles = VectorScale((0, 1, 0), 335);
		FX SetModel("tag_origin");
		PlayFXOnTag(level._effect["eject"], FX, "tag_origin");
		wait(7);
		playsoundatposition("exit", (-969, 1744, -6));
		wait(2.5);
		FX delete();
		if(level.var_a2dcc08c == 1)
		{
			i = player GetEntityNumber();
			level.var_36e894d0[i] = struct::get("black_orgs_" + i, "targetname");
			self SetStance("stand");
			player playlocalsound("teleport_in_npc");
			player DisableWeapons();
			player disableOffhandWeapons();
			player FreezeControls(1);
			player SetOrigin(level.var_36e894d0[i].origin);
			player SetPlayerAngles(level.var_36e894d0[i].angles);
			wait(0.1);
			i = player GetEntityNumber();
			level.var_60f9c426[i] = struct::get("black_orgs_end" + i, "targetname");
			player enableWeapons();
			player EnableOffhandWeapons();
			player FreezeControls(0);
			player SetOrigin(level.var_60f9c426[i].origin);
			player SetPlayerAngles(level.var_60f9c426[i].angles);
			wait(0.05);
			continue;
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: wait_for_power
	Namespace: namespace_c03cdda1
	Checksum: 0xE52A84CF
	Offset: 0x858
	Size: 0xA4
	Parameters: 0
	Flags: None
	Line Number: 114
*/
function wait_for_power()
{
	level.teleport_trigger setcursorhint("HINT_NOICON");
	level.var_728374e6 setcursorhint("HINT_NOICON");
	level.teleport_trigger setHintString(&"ZOMBIE_NEED_POWER");
	level.var_728374e6 setHintString(&"ZOMBIE_NEED_POWER");
	level flag::wait_till("power_on");
}

