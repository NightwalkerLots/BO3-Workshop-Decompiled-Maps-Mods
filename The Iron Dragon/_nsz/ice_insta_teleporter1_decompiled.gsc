#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\zm\_zm_score;

#namespace namespace_fa57765a;

/*
	Name: function_dd0733a7
	Namespace: namespace_fa57765a
	Checksum: 0x6A62B95
	Offset: 0x1B0
	Size: 0x2B0
	Parameters: 0
	Flags: None
	Line Number: 16
*/
function function_dd0733a7()
{
	level.var_b03e1999 = 0;
	level.var_45adca29 = struct::get("black_orgs1_0", "targetname");
	level.var_dc6b4c4e = [];
	for(i = 0; i < level.var_45adca29.size; i++)
	{
		level.var_dc6b4c4e[i] = struct::get(level.var_45adca29[i].target, "targetname");
	}
	var_7d84799d = GetEntArray("teleport1_player_string", "targetname");
	var_a695c83e = GetEntArray("teleport1_player", "targetname");
	for(i = 0; i < var_7d84799d.size; i++)
	{
		var_7d84799d[i] setcursorhint("HINT_NOICON");
		var_7d84799d[i] setHintString(&"ZOMBIE_NEED_POWER");
	}
	function_f240480d();
	for(i = 0; i < var_7d84799d.size; i++)
	{
		var_7d84799d[i] delete();
	}
	for(i = 0; i < var_a695c83e.size; i++)
	{
		var_a695c83e[i] thread function_fb417855(i);
	}
	level.var_45adca29 = struct::get("black_orgs1_0", "targetname");
	level.var_dc6b4c4e = [];
	for(i = 0; i < level.var_45adca29.size; i++)
	{
		level.var_dc6b4c4e[i] = struct::get(level.var_45adca29[i].target, "targetname");
	}
}

/*
	Name: function_fb417855
	Namespace: namespace_fa57765a
	Checksum: 0x4C2BD30C
	Offset: 0x468
	Size: 0x3E0
	Parameters: 1
	Flags: None
	Line Number: 59
*/
function function_fb417855(player_num)
{
	while(1)
	{
		self waittill("trigger", player);
		wait(0.1);
		level.var_b03e1999 = 1;
		playsoundatposition("robot_head_bg_03", (-350.5, 1658.5, -14));
		wait(14);
		playsoundatposition("robot_alarm", (-350.5, 1658.5, -14));
		FX = spawn("script_model", (-350.5, 1658.5, -14));
		FX SetModel("tag_origin");
		PlayFXOnTag(level._effect["eject"], FX, "tag_origin");
		wait(7);
		playsoundatposition("exit", (-350.5, 1658.5, -14));
		wait(2.5);
		FX delete();
		if(level.var_b03e1999 == 1)
		{
			i = player GetEntityNumber();
			level.var_45adca29[i] = struct::get("black_orgs1_" + i, "targetname");
			self SetStance("stand");
			player playlocalsound("teleport_in_npc");
			player DisableWeapons();
			player disableOffhandWeapons();
			player FreezeControls(1);
			player SetOrigin(level.var_45adca29[i].origin);
			player SetPlayerAngles(level.var_45adca29[i].angles);
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
}

/*
	Name: function_f240480d
	Namespace: namespace_fa57765a
	Checksum: 0x55C36A5D
	Offset: 0x850
	Size: 0xA4
	Parameters: 0
	Flags: None
	Line Number: 111
*/
function function_f240480d()
{
	level.var_5cf9e8d0 setcursorhint("HINT_NOICON");
	level.var_a7044849 setcursorhint("HINT_NOICON");
	level.var_5cf9e8d0 setHintString(&"ZOMBIE_NEED_POWER");
	level.var_a7044849 setHintString(&"ZOMBIE_NEED_POWER");
	level flag::wait_till("power_on");
}

