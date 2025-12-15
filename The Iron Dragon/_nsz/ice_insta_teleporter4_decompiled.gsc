#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\zm\_zm_score;

#namespace namespace_b863da67;

/*
	Name: function_8cf8a984
	Namespace: namespace_b863da67
	Checksum: 0xC12E84BD
	Offset: 0x170
	Size: 0x2A0
	Parameters: 0
	Flags: None
	Line Number: 16
*/
function function_8cf8a984()
{
	level.var_b7b53964 = struct::get("black_orgs4_0", "targetname");
	level.var_42994a47 = [];
	for(i = 0; i < level.var_b7b53964.size; i++)
	{
		level.var_42994a47[i] = struct::get(level.var_b7b53964[i].target, "targetname");
	}
	var_bf781590 = GetEntArray("teleport4_player_string", "targetname");
	var_348e5903 = GetEntArray("teleport4_player", "targetname");
	for(i = 0; i < var_bf781590.size; i++)
	{
		var_bf781590[i] setcursorhint("HINT_NOICON");
		var_bf781590[i] setHintString(&"ZOMBIE_NEED_POWER");
	}
	function_3433e400();
	for(i = 0; i < var_bf781590.size; i++)
	{
		var_bf781590[i] delete();
	}
	for(i = 0; i < var_348e5903.size; i++)
	{
		var_348e5903[i] thread function_3d351448(i);
	}
	level.var_b7b53964 = struct::get("black_orgs4_0", "targetname");
	level.var_42994a47 = [];
	for(i = 0; i < level.var_b7b53964.size; i++)
	{
		level.var_42994a47[i] = struct::get(level.var_b7b53964[i].target, "targetname");
	}
}

/*
	Name: function_3d351448
	Namespace: namespace_b863da67
	Checksum: 0xCDB8862A
	Offset: 0x418
	Size: 0x290
	Parameters: 1
	Flags: None
	Line Number: 58
*/
function function_3d351448(player_num)
{
	while(1)
	{
		self waittill("trigger", player);
		i = player GetEntityNumber();
		level.var_b7b53964[i] = struct::get("black_orgs4_" + i, "targetname");
		wait(0.1);
		self SetStance("stand");
		player playlocalsound("teleport_in_npc");
		player DisableWeapons();
		player disableOffhandWeapons();
		player FreezeControls(1);
		player SetOrigin(level.var_b7b53964[i].origin);
		player SetPlayerAngles(level.var_b7b53964[i].angles);
		wait(0.1);
		i = player GetEntityNumber();
		level.var_f510be2a[i] = struct::get("black_orgs4_end" + i, "targetname");
		player enableWeapons();
		player EnableOffhandWeapons();
		player FreezeControls(0);
		player SetOrigin(level.var_f510be2a[i].origin);
		player SetPlayerAngles(level.var_f510be2a[i].angles);
		wait(0.05);
	}
}

/*
	Name: function_3433e400
	Namespace: namespace_b863da67
	Checksum: 0xFD2153F5
	Offset: 0x6B0
	Size: 0xA4
	Parameters: 0
	Flags: None
	Line Number: 95
*/
function function_3433e400()
{
	level.var_750fc195 setcursorhint("HINT_NOICON");
	level.var_8ed0a68c setcursorhint("HINT_NOICON");
	level.var_750fc195 setHintString(&"ZOMBIE_NEED_POWER");
	level.var_8ed0a68c setHintString(&"ZOMBIE_NEED_POWER");
	level flag::wait_till("power_on");
}

