#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\zm\_zm_score;

#namespace namespace_f0461d7b;

/*
	Name: function_8aeed638
	Namespace: namespace_f0461d7b
	Checksum: 0x2FC69555
	Offset: 0x198
	Size: 0x2B0
	Parameters: 0
	Flags: None
	Line Number: 16
*/
function function_8aeed638()
{
	level.var_f20096ec = 0;
	level.var_4fbf2308 = struct::get("black_orgs8_0", "targetname");
	level.var_1fd73e73 = [];
	for(i = 0; i < level.var_4fbf2308.size; i++)
	{
		level.var_1fd73e73[i] = struct::get(level.var_4fbf2308[i].target, "targetname");
	}
	var_8795d27c = GetEntArray("teleport8_player_string", "targetname");
	var_9c846f5f = GetEntArray("teleport8_player", "targetname");
	for(i = 0; i < var_8795d27c.size; i++)
	{
		var_8795d27c[i] setcursorhint("HINT_NOICON");
		var_8795d27c[i] setHintString(&"ZOMBIE_NEED_POWER");
	}
	function_fc51a0ec();
	for(i = 0; i < var_8795d27c.size; i++)
	{
		var_8795d27c[i] delete();
	}
	for(i = 0; i < var_9c846f5f.size; i++)
	{
		var_9c846f5f[i] thread function_a52b2aa4(i);
	}
	level.var_4fbf2308 = struct::get("black_orgs8_0", "targetname");
	level.var_1fd73e73 = [];
	for(i = 0; i < level.var_4fbf2308.size; i++)
	{
		level.var_1fd73e73[i] = struct::get(level.var_4fbf2308[i].target, "targetname");
	}
}

/*
	Name: function_a52b2aa4
	Namespace: namespace_f0461d7b
	Checksum: 0x52107E4B
	Offset: 0x450
	Size: 0x2B8
	Parameters: 1
	Flags: None
	Line Number: 59
*/
function function_a52b2aa4(player_num)
{
	while(1)
	{
		self setHintString("Press and Hold ^3&&1^7 to exit the Robot Head");
		self waittill("trigger", player);
		i = player GetEntityNumber();
		level.var_4fbf2308[i] = struct::get("black_orgs8_" + i, "targetname");
		wait(0.1);
		level.var_f20096ec = 0;
		self SetStance("stand");
		player playlocalsound("teleport_in_npc");
		player DisableWeapons();
		player disableOffhandWeapons();
		player FreezeControls(1);
		player SetOrigin(level.var_4fbf2308[i].origin);
		player SetPlayerAngles(level.var_4fbf2308[i].angles);
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
	Name: function_fc51a0ec
	Namespace: namespace_f0461d7b
	Checksum: 0xD37DC7
	Offset: 0x710
	Size: 0xA4
	Parameters: 0
	Flags: None
	Line Number: 98
*/
function function_fc51a0ec()
{
	level.var_b3017ec1 setcursorhint("HINT_NOICON");
	level.var_bf00c8a8 setcursorhint("HINT_NOICON");
	level.var_b3017ec1 setHintString(&"ZOMBIE_NEED_POWER");
	level.var_bf00c8a8 setHintString(&"ZOMBIE_NEED_POWER");
	level flag::wait_till("power_on");
}

