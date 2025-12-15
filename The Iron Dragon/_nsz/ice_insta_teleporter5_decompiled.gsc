#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\zm\_zm_score;

#namespace namespace_92615ffe;

/*
	Name: function_9467b9b
	Namespace: namespace_92615ffe
	Checksum: 0x36A787C8
	Offset: 0x170
	Size: 0x2A0
	Parameters: 0
	Flags: None
	Line Number: 16
*/
function function_9467b9b()
{
	level.var_ddb7b3cd = struct::get("black_orgs5_0", "targetname");
	level.var_1c95fc0a = [];
	for(i = 0; i < level.var_ddb7b3cd.size; i++)
	{
		level.var_1c95fc0a[i] = struct::get(level.var_ddb7b3cd[i].target, "targetname");
	}
	var_e57a8ff9 = GetEntArray("teleport5_player_string", "targetname");
	var_e8bde9a = GetEntArray("teleport5_player", "targetname");
	for(i = 0; i < var_e57a8ff9.size; i++)
	{
		var_e57a8ff9[i] setcursorhint("HINT_NOICON");
		var_e57a8ff9[i] setHintString(&"ZOMBIE_NEED_POWER");
	}
	function_5a365e69();
	for(i = 0; i < var_e57a8ff9.size; i++)
	{
		var_e57a8ff9[i] delete();
	}
	for(i = 0; i < var_e8bde9a.size; i++)
	{
		var_e8bde9a[i] thread function_63378eb1(i);
	}
	level.var_ddb7b3cd = struct::get("black_orgs5_0", "targetname");
	level.var_1c95fc0a = [];
	for(i = 0; i < level.var_ddb7b3cd.size; i++)
	{
		level.var_1c95fc0a[i] = struct::get(level.var_ddb7b3cd[i].target, "targetname");
	}
}

/*
	Name: function_63378eb1
	Namespace: namespace_92615ffe
	Checksum: 0xF2A6AF61
	Offset: 0x418
	Size: 0x290
	Parameters: 1
	Flags: None
	Line Number: 58
*/
function function_63378eb1(player_num)
{
	while(1)
	{
		self waittill("trigger", player);
		i = player GetEntityNumber();
		level.var_ddb7b3cd[i] = struct::get("black_orgs5_" + i, "targetname");
		wait(0.1);
		self SetStance("stand");
		player playlocalsound("teleport_in_npc");
		player DisableWeapons();
		player disableOffhandWeapons();
		player FreezeControls(1);
		player SetOrigin(level.var_ddb7b3cd[i].origin);
		player SetPlayerAngles(level.var_ddb7b3cd[i].angles);
		wait(0.1);
		i = player GetEntityNumber();
		level.var_d1c4693f[i] = struct::get("black_orgs5_end" + i, "targetname");
		player enableWeapons();
		player EnableOffhandWeapons();
		player FreezeControls(0);
		player SetOrigin(level.var_d1c4693f[i].origin);
		player SetPlayerAngles(level.var_d1c4693f[i].angles);
		wait(0.05);
	}
}

/*
	Name: function_5a365e69
	Namespace: namespace_92615ffe
	Checksum: 0x78D6977C
	Offset: 0x6B0
	Size: 0xA4
	Parameters: 0
	Flags: None
	Line Number: 95
*/
function function_5a365e69()
{
	level.var_e94c740c setcursorhint("HINT_NOICON");
	level.var_1a93f415 setcursorhint("HINT_NOICON");
	level.var_e94c740c setHintString(&"ZOMBIE_NEED_POWER");
	level.var_1a93f415 setHintString(&"ZOMBIE_NEED_POWER");
	level flag::wait_till("power_on");
}

