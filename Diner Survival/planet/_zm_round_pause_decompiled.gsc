#include scripts\codescripts\struct;
#include scripts\planet\_planet_utilities;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\vk_script\_zm_vk_general;
#include scripts\vk_script\tranzit\vk_tranzit_zm_milestones;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_9218da2;

/*
	Name: __init__sytem__
	Namespace: namespace_9218da2
	Checksum: 0x9EB4517D
	Offset: 0x3C8
	Size: 0x30
	Parameters: 0
	Flags: AutoExec
	Line Number: 32
*/
function autoexec __init__sytem__()
{
	system::register("pl_pauseRound", undefined, &main, undefined);
	return;
}

/*
	Name: main
	Namespace: namespace_9218da2
	Checksum: 0x458CBC30
	Offset: 0x400
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function main()
{
	level.var_4279487d = 1;
	level.var_fdf234d5 = 20;
	level.var_55e72051 = level.var_fdf234d5 * 2;
	level.round_end_custom_logic = &function_20e9296d;
	level.var_608dc267 = 0;
	level thread function_caea17bb();
	callback::on_disconnect(&function_84686447);
	callback::on_laststand(&function_d6d694d);
}

/*
	Name: function_20e9296d
	Namespace: namespace_9218da2
	Checksum: 0x26B14DF1
	Offset: 0x4B0
	Size: 0x3D0
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function function_20e9296d()
{
	if(isdefined(level.var_323a641a) && level.var_323a641a)
	{
		players = GetPlayers();
		level.var_608dc267 = 1;
		wait(9);
		foreach(player in players)
		{
			player playlocalsound("round_vote_prompt");
		}
		level thread function_e62fd395();
		level.var_99044fff = 0;
		if(isdefined(level.var_4279487d) && level.var_4279487d)
		{
			foreach(player in players)
			{
				if(player.sessionstate != "spectator" || (!(isdefined(player util::is_bot()) && player util::is_bot())))
				{
					level.var_99044fff++;
					player thread function_b25c447f();
				}
			}
		}
		function_e1b9e496(0, players.size);
		var_4f94b248 = level.var_99044fff;
		while(level.var_99044fff > 0)
		{
			wait(0.05);
		}
		if(level.var_4011a94e == "samantha" && level.var_d1da0582 == level.var_15bc5bb0 && (isdefined(level.var_eaf50aaa) && level.var_eaf50aaa))
		{
			level.var_4011a94e = "richtofen";
			level notify("hash_7aaada6a", players, players);
		}
		thread function_1c29b6c7();
		wait(0.5);
		level.var_608dc267 = 0;
		level notify("hash_7c194194");
		wait(0.05);
		foreach(player in GetPlayers())
		{
			player notify("hash_5c3d12c", GetPlayers());
			if(isdefined(level.var_4011a94e))
			{
				player playlocalsound("vk_round_switch_" + level.var_4011a94e);
			}
		}
		if(level.var_d1da0582 == level.var_15bc5bb0 && (isdefined(level.var_eaf50aaa) && level.var_eaf50aaa))
		{
			namespace_8d243edb::function_a4fde264();
		}
		namespace_f56b53f0::function_dbe7e78b("Round Pause Ended");
	}
}

/*
	Name: function_b25c447f
	Namespace: namespace_9218da2
	Checksum: 0x28DCF4C3
	Offset: 0x888
	Size: 0xA8
	Parameters: 0
	Flags: Private
	Line Number: 136
*/
function private function_b25c447f()
{
	self endon("disconnect");
	self.var_f7360a46 = 0;
	wait(1);
	while(isdefined(self))
	{
		wait(0.05);
		if(self meleeButtonPressed() || self.sessionstate == "spectator")
		{
			level.var_99044fff--;
			self.var_f7360a46 = 1;
			level notify("hash_eb4a40dc");
			self playlocalsound("round_vote_accept");
			break;
		}
	}
}

/*
	Name: function_e1b9e496
	Namespace: namespace_9218da2
	Checksum: 0x553F2064
	Offset: 0x938
	Size: 0x190
	Parameters: 2
	Flags: Private
	Line Number: 165
*/
function private function_e1b9e496(requiredPlayers, var_8d1ccbc8)
{
	foreach(player in GetPlayers())
	{
		player notify("hash_5c3d12c", GetPlayers());
		if(player.sessionstate == "spectator")
		{
			continue;
		}
		var_748e94b6 = "^3" + requiredPlayers + "/" + var_8d1ccbc8 + "^7";
		if(isdefined(player.var_f7360a46) && player.var_f7360a46)
		{
			player thread namespace_d947f615::function_ccf94cf1(var_748e94b6 + " players have voted to skip!", "roundHasSkippedOrUpdateRequired", 1.2, 320, 450);
			continue;
		}
		player thread namespace_d947f615::function_ccf94cf1("Press ^3[{+melee}]^7 to ready up " + var_748e94b6, "roundHasSkippedOrUpdateRequired", 1.2, 320, 450);
	}
}

/*
	Name: function_e62fd395
	Namespace: namespace_9218da2
	Checksum: 0x3EE80005
	Offset: 0xAD0
	Size: 0x70
	Parameters: 0
	Flags: Private
	Line Number: 194
*/
function private function_e62fd395()
{
	level endon("start_of_round");
	while(1)
	{
		wait(0.05);
		level waittill("hash_eb4a40dc");
		SIZE = GetPlayers().size;
		function_e1b9e496(SIZE - level.var_99044fff, SIZE);
	}
}

/*
	Name: function_84686447
	Namespace: namespace_9218da2
	Checksum: 0xC659E13C
	Offset: 0xB48
	Size: 0x50
	Parameters: 0
	Flags: Private
	Line Number: 216
*/
function private function_84686447()
{
	if(isdefined(level.var_608dc267) && level.var_608dc267 && (!(isdefined(self.var_f7360a46) && self.var_f7360a46)))
	{
		level.var_99044fff--;
		level notify("hash_eb4a40dc");
	}
}

/*
	Name: function_d6d694d
	Namespace: namespace_9218da2
	Checksum: 0x74197128
	Offset: 0xBA0
	Size: 0x98
	Parameters: 0
	Flags: Private
	Line Number: 235
*/
function function_d6d694d()
{
	// Could not fully decompile function; skipped
}

/*
	Name: function_1c29b6c7
	Namespace: namespace_9218da2
	Checksum: 0x6B39DE43
	Offset: 0xC40
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 250
*/
function function_1c29b6c7()
{
	level flag::clear("spawn_zombies");
	wait(0.05);
	if(level.var_fdf234d5 > level.var_55e72051)
	{
		level.var_fdf234d5 = level.var_55e72051;
	}
	timer = level.var_fdf234d5;
	wait(timer);
	level.var_fdf234d5++;
	level flag::set("spawn_zombies");
}

/*
	Name: function_caea17bb
	Namespace: namespace_9218da2
	Checksum: 0xB504879B
	Offset: 0xCE0
	Size: 0x4C
	Parameters: 0
	Flags: None
	Line Number: 274
*/
function function_caea17bb()
{
	while(1)
	{
		level waittill("hash_caea17bb");
		namespace_f56b53f0::function_dbe7e78b("Round Pause Ended");
		level.var_99044fff = 0;
		wait(0.05);
	}
}

