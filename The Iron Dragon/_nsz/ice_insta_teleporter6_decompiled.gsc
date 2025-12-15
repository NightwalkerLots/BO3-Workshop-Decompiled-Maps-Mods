#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\zm\_zm_score;

#namespace namespace_6c5ee595;

/*
	Name: function_6d7ee2ee
	Namespace: namespace_6c5ee595
	Checksum: 0xF571C29E
	Offset: 0x198
	Size: 0x2B0
	Parameters: 0
	Flags: None
	Line Number: 16
*/
function function_6d7ee2ee()
{
	level.var_a2dcc08c = 0;
	level.var_3ba2e36 = struct::get("black_orgs6_0", "targetname");
	level.var_2eb39f51 = [];
	for(i = 0; i < level.var_3ba2e36.size; i++)
	{
		level.var_2eb39f51[i] = struct::get(level.var_3ba2e36[i].target, "targetname");
	}
	var_b7d0a62 = GetEntArray("teleport6_player_string", "targetname");
	var_e8896431 = GetEntArray("teleport6_player", "targetname");
	for(i = 0; i < var_b7d0a62.size; i++)
	{
		var_b7d0a62[i] setcursorhint("HINT_NOICON");
		var_b7d0a62[i] setHintString(&"ZOMBIE_NEED_POWER");
	}
	function_8038d8d2();
	for(i = 0; i < var_b7d0a62.size; i++)
	{
		var_b7d0a62[i] delete();
	}
	for(i = 0; i < var_e8896431.size; i++)
	{
		var_e8896431[i] thread function_893a091a(i);
	}
	level.var_3ba2e36 = struct::get("black_orgs6_0", "targetname");
	level.var_2eb39f51 = [];
	for(i = 0; i < level.var_3ba2e36.size; i++)
	{
		level.var_2eb39f51[i] = struct::get(level.var_3ba2e36[i].target, "targetname");
	}
}

/*
	Name: function_893a091a
	Namespace: namespace_6c5ee595
	Checksum: 0x5E0A4CB3
	Offset: 0x450
	Size: 0x2B8
	Parameters: 1
	Flags: None
	Line Number: 59
*/
function function_893a091a(player_num)
{
	while(1)
	{
		self setHintString("Press and Hold ^3&&1^7 to exit the Robot Head");
		self waittill("trigger", player);
		i = player GetEntityNumber();
		level.var_3ba2e36[i] = struct::get("black_orgs6_" + i, "targetname");
		wait(0.1);
		level.var_a2dcc08c = 0;
		self SetStance("stand");
		player playlocalsound("teleport_in_npc");
		player DisableWeapons();
		player disableOffhandWeapons();
		player FreezeControls(1);
		player SetOrigin(level.var_3ba2e36[i].origin);
		player SetPlayerAngles(level.var_3ba2e36[i].angles);
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
	Name: function_8038d8d2
	Namespace: namespace_6c5ee595
	Checksum: 0xFC61B339
	Offset: 0x710
	Size: 0xA4
	Parameters: 0
	Flags: None
	Line Number: 98
*/
function function_8038d8d2()
{
	level.var_7856cfd3 setcursorhint("HINT_NOICON");
	level.var_8838ba7a setcursorhint("HINT_NOICON");
	level.var_7856cfd3 setHintString(&"ZOMBIE_NEED_POWER");
	level.var_8838ba7a setHintString(&"ZOMBIE_NEED_POWER");
	level flag::wait_till("power_on");
}

