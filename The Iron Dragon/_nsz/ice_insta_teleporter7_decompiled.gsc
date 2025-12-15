#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\zm\_zm_score;

#namespace namespace_465c6b2c;

/*
	Name: function_833d181d
	Namespace: namespace_465c6b2c
	Checksum: 0x5978212
	Offset: 0x198
	Size: 0x2B0
	Parameters: 0
	Flags: None
	Line Number: 16
*/
function function_833d181d()
{
	level.var_b03e1999 = 0;
	level.var_29bca89f = struct::get("black_orgs7_0", "targetname");
	level.var_de6027ec = [];
	for(i = 0; i < level.var_29bca89f.size; i++)
	{
		level.var_de6027ec[i] = struct::get(level.var_29bca89f[i].target, "targetname");
	}
	var_317f84cb = GetEntArray("teleport7_player_string", "targetname");
	var_c286e9c8 = GetEntArray("teleport7_player", "targetname");
	for(i = 0; i < var_317f84cb.size; i++)
	{
		var_317f84cb[i] setcursorhint("HINT_NOICON");
		var_317f84cb[i] setHintString(&"ZOMBIE_NEED_POWER");
	}
	function_a63b533b();
	for(i = 0; i < var_317f84cb.size; i++)
	{
		var_317f84cb[i] delete();
	}
	for(i = 0; i < var_c286e9c8.size; i++)
	{
		var_c286e9c8[i] thread function_af3c8383(i);
	}
	level.var_29bca89f = struct::get("black_orgs7_0", "targetname");
	level.var_de6027ec = [];
	for(i = 0; i < level.var_29bca89f.size; i++)
	{
		level.var_de6027ec[i] = struct::get(level.var_29bca89f[i].target, "targetname");
	}
}

/*
	Name: function_af3c8383
	Namespace: namespace_465c6b2c
	Checksum: 0xC04FB88C
	Offset: 0x450
	Size: 0x2B8
	Parameters: 1
	Flags: None
	Line Number: 59
*/
function function_af3c8383(player_num)
{
	while(1)
	{
		self setHintString("Press and Hold ^3&&1^7 to exit the Robot Head");
		self waittill("trigger", player);
		i = player GetEntityNumber();
		level.var_29bca89f[i] = struct::get("black_orgs7_" + i, "targetname");
		wait(0.1);
		level.var_b03e1999 = 0;
		self SetStance("stand");
		player playlocalsound("teleport_in_npc");
		player DisableWeapons();
		player disableOffhandWeapons();
		player FreezeControls(1);
		player SetOrigin(level.var_29bca89f[i].origin);
		player SetPlayerAngles(level.var_29bca89f[i].angles);
		wait(0.1);
		i = player GetEntityNumber();
		level.var_60f9c426[i] = struct::get("black_orgs_end" + i, "targetname");
		player enableWeapons();
		player EnableOffhandWeapons();
		player FreezeControls(0);
		player SetOrigin(level.var_60f9c426[i].origin);
		player SetPlayerAngles(level.var_60f9c426[i].angles);
		wait(0.05);
	}
}

/*
	Name: function_a63b533b
	Namespace: namespace_465c6b2c
	Checksum: 0x8D97D4B2
	Offset: 0x710
	Size: 0xA4
	Parameters: 0
	Flags: None
	Line Number: 98
*/
function function_a63b533b()
{
	level.var_e2b487fa setcursorhint("HINT_NOICON");
	level.var_1ddb0253 setcursorhint("HINT_NOICON");
	level.var_e2b487fa setHintString(&"ZOMBIE_NEED_POWER");
	level.var_1ddb0253 setHintString(&"ZOMBIE_NEED_POWER");
	level flag::wait_till("power_on");
}

