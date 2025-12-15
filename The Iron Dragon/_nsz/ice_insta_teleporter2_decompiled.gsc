#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\zm\_zm_score;

#namespace namespace_d454fbf1;

/*
	Name: function_9277d85a
	Namespace: namespace_d454fbf1
	Checksum: 0x118C67BD
	Offset: 0x1B0
	Size: 0x2B0
	Parameters: 0
	Flags: None
	Line Number: 16
*/
function function_9277d85a()
{
	level.var_f20096ec = 0;
	level.var_6bb04492 = struct::get("black_orgs2_0", "targetname");
	level.var_5f39b3b5 = [];
	for(i = 0; i < level.var_6bb04492.size; i++)
	{
		level.var_5f39b3b5[i] = struct::get(level.var_6bb04492[i].target, "targetname");
	}
	var_a386f406 = GetEntArray("teleport2_player_string", "targetname");
	var_80934dd5 = GetEntArray("teleport2_player", "targetname");
	for(i = 0; i < var_a386f406.size; i++)
	{
		var_a386f406[i] setcursorhint("HINT_NOICON");
		var_a386f406[i] setHintString(&"ZOMBIE_NEED_POWER");
	}
	function_1842c276();
	for(i = 0; i < var_a386f406.size; i++)
	{
		var_a386f406[i] delete();
	}
	for(i = 0; i < var_80934dd5.size; i++)
	{
		var_80934dd5[i] thread function_2143f2be(i);
	}
	level.var_6bb04492 = struct::get("black_orgs2_0", "targetname");
	level.var_5f39b3b5 = [];
	for(i = 0; i < level.var_6bb04492.size; i++)
	{
		level.var_5f39b3b5[i] = struct::get(level.var_6bb04492[i].target, "targetname");
	}
}

/*
	Name: function_2143f2be
	Namespace: namespace_d454fbf1
	Checksum: 0x9D851F40
	Offset: 0x468
	Size: 0x3C0
	Parameters: 1
	Flags: None
	Line Number: 59
*/
function function_2143f2be(player_num)
{
	while(1)
	{
		self waittill("trigger", player);
		wait(0.1);
		level.var_f20096ec = 1;
		playsoundatposition("robot_head_bg_03", (280, 1568, 0));
		wait(14);
		playsoundatposition("robot_alarm", (280, 1568, 0));
		FX = spawn("script_model", (280, 1568, 0));
		FX SetModel("tag_origin");
		PlayFXOnTag(level._effect["eject"], FX, "tag_origin");
		wait(7);
		playsoundatposition("exit", (280, 1568, 0));
		wait(2.5);
		FX delete();
		if(level.var_f20096ec == 1)
		{
			i = player GetEntityNumber();
			level.var_6bb04492[i] = struct::get("black_orgs2_" + i, "targetname");
			self SetStance("stand");
			player playlocalsound("teleport_in_npc");
			player DisableWeapons();
			player disableOffhandWeapons();
			player FreezeControls(1);
			player SetOrigin(level.var_6bb04492[i].origin);
			player SetPlayerAngles(level.var_6bb04492[i].angles);
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
	Name: function_1842c276
	Namespace: namespace_d454fbf1
	Checksum: 0xC947BAF3
	Offset: 0x830
	Size: 0xA4
	Parameters: 0
	Flags: None
	Line Number: 111
*/
function function_1842c276()
{
	level.var_bc261c77 setcursorhint("HINT_NOICON");
	level.var_468eed6e setcursorhint("HINT_NOICON");
	level.var_bc261c77 setHintString(&"ZOMBIE_NEED_POWER");
	level.var_468eed6e setHintString(&"ZOMBIE_NEED_POWER");
	level flag::wait_till("power_on");
}

