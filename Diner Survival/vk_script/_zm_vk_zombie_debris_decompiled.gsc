#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\sound_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_895b7712;

/*
	Name: init
	Namespace: namespace_895b7712
	Checksum: 0xCB6D24C4
	Offset: 0x368
	Size: 0x30
	Parameters: 0
	Flags: AutoExec
	Line Number: 35
*/
function autoexec init()
{
	level waittill("all_players_connected");
	wait(5);
	thread function_1dfed2e5();
}

/*
	Name: function_1dfed2e5
	Namespace: namespace_895b7712
	Checksum: 0x9FB4761E
	Offset: 0x3A0
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function function_1dfed2e5()
{
	debris_triggers = GetEntArray("zombie_debris", "targetname");
	foreach(var_a421f1e1 in debris_triggers)
	{
		if(var_a421f1e1.script_sound == "vk_ignore_deb")
		{
			continue;
		}
		var_a421f1e1 thread function_154438d4();
		wait(0.05);
		var_71dcfbf5 = GetEntArray(var_a421f1e1.target, "targetname");
		foreach(fxModel in var_71dcfbf5)
		{
			PlayFXOnTag("vk_fx/zm/_vk_zm_debris_glow", fxModel, "tag_origin");
			var_35fae982 = randomIntRange(3, 16) / 30;
			var_e665f23e = randomIntRange(3, 6);
			fxModel Bobbing((0, 0, 1), var_35fae982, var_e665f23e);
			wait(0.05);
		}
	}
}

/*
	Name: function_154438d4
	Namespace: namespace_895b7712
	Checksum: 0xC613EDE9
	Offset: 0x5C8
	Size: 0x24
	Parameters: 0
	Flags: None
	Line Number: 85
*/
function function_154438d4()
{
	self sound::loop_on_entity("amb_floating_rocks_loop");
}

