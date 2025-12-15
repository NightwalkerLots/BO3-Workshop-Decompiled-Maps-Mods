#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\zm\_zm_score;

#namespace namespace_ae528188;

/*
	Name: function_d4aedb19
	Namespace: namespace_ae528188
	Checksum: 0xB241DEF6
	Offset: 0x170
	Size: 0x2A0
	Parameters: 0
	Flags: None
	Line Number: 16
*/
function function_d4aedb19()
{
	level.var_91b2befb = struct::get("black_orgs3_0", "targetname");
	level.var_71c92020 = [];
	for(i = 0; i < level.var_91b2befb.size; i++)
	{
		level.var_71c92020[i] = struct::get(level.var_23b054c3[i].target, "targetname");
	}
	var_c9896e6f = GetEntArray("teleport3_player_string", "targetname");
	var_5a90d36c = GetEntArray("teleport3_player", "targetname");
	for(i = 0; i < var_c9896e6f.size; i++)
	{
		var_c9896e6f[i] setcursorhint("HINT_NOICON");
		var_c9896e6f[i] setHintString(&"ZOMBIE_NEED_POWER");
	}
	function_3e453cdf();
	for(i = 0; i < var_c9896e6f.size; i++)
	{
		var_c9896e6f[i] delete();
	}
	for(i = 0; i < var_5a90d36c.size; i++)
	{
		var_5a90d36c[i] thread function_47466d27(i);
	}
	level.var_91b2befb = struct::get("black_orgs3_0", "targetname");
	level.var_71c92020 = [];
	for(i = 0; i < level.var_91b2befb.size; i++)
	{
		level.var_71c92020[i] = struct::get(level.var_91b2befb[i].target, "targetname");
	}
}

/*
	Name: function_47466d27
	Namespace: namespace_ae528188
	Checksum: 0x75FDCC39
	Offset: 0x418
	Size: 0x290
	Parameters: 1
	Flags: None
	Line Number: 58
*/
function function_47466d27(player_num)
{
	while(1)
	{
		self waittill("trigger", player);
		i = player GetEntityNumber();
		level.var_91b2befb[i] = struct::get("black_orgs3_" + i, "targetname");
		wait(0.1);
		self SetStance("stand");
		player playlocalsound("teleport_in_npc");
		player DisableWeapons();
		player disableOffhandWeapons();
		player FreezeControls(1);
		player SetOrigin(level.var_91b2befb[i].origin);
		player SetPlayerAngles(level.var_91b2befb[i].angles);
		wait(0.1);
		i = player GetEntityNumber();
		level.var_f8602f4d[i] = struct::get("black_orgs3_end" + i, "targetname");
		player enableWeapons();
		player EnableOffhandWeapons();
		player FreezeControls(0);
		player SetOrigin(level.var_f8602f4d[i].origin);
		player SetPlayerAngles(level.var_f8602f4d[i].angles);
		wait(0.05);
	}
}

/*
	Name: function_3e453cdf
	Namespace: namespace_ae528188
	Checksum: 0x62885996
	Offset: 0x6B0
	Size: 0xA4
	Parameters: 0
	Flags: None
	Line Number: 95
*/
function function_3e453cdf()
{
	level.var_a10abaee setcursorhint("HINT_NOICON");
	level.var_61aa4ef7 setcursorhint("HINT_NOICON");
	level.var_a10abaee setHintString(&"ZOMBIE_NEED_POWER");
	level.var_61aa4ef7 setHintString(&"ZOMBIE_NEED_POWER");
	level flag::wait_till("power_on");
}

