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

#namespace namespace_9e7298d7;

/*
	Name: initiation
	Namespace: namespace_9e7298d7
	Checksum: 0xBCBA6C79
	Offset: 0x490
	Size: 0x50
	Parameters: 0
	Flags: AutoExec
	Line Number: 34
*/
function autoexec initiation()
{
	zm_spawner::register_zombie_death_event_callback(&watch_for_death);
	level waittill("all_players_connected");
	wait(5);
	thread function_a8f90b44();
	return;
	ERROR: Bad function call
}

/*
	Name: function_a8f90b44
	Namespace: namespace_9e7298d7
	Checksum: 0xA34147DC
	Offset: 0x4E8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function function_a8f90b44()
{
	foreach(player in GetPlayers())
	{
		player thread function_fda883e9();
	}
	return;
	waittillframeend;
}

/*
	Name: function_fda883e9
	Namespace: namespace_9e7298d7
	Checksum: 0xF1087C13
	Offset: 0x588
	Size: 0x2E0
	Parameters: 0
	Flags: None
	Line Number: 74
*/
function function_fda883e9()
{
	kills = self.pers["kills"];
	headshots = self.pers["headshots"];
	self.var_f0cce92b = 0;
	self thread function_d0319ba0();
	self thread function_7f15d111();
	while(1)
	{
		while(kills == self.pers["kills"])
		{
			wait(0.05);
		}
		if(headshots == self.pers["headshots"])
		{
			self.var_f0cce92b = 0;
		}
		if(self.var_f0cce92b > 25 && self.var_f0cce92b < 50)
		{
			self playlocalsound("evt_headshots_00");
			zm_score::add_to_player_score(30);
			self.var_cdab067f = 1;
		}
		if(self.var_f0cce92b > 50 && self.var_f0cce92b < 100)
		{
			self playlocalsound("evt_headshots_01");
			zm_score::add_to_player_score(60);
			self.var_cdab067f = 2;
		}
		if(self.var_f0cce92b > 100 && self.var_f0cce92b < 150)
		{
			self playlocalsound("evt_headshots_02");
			zm_score::add_to_player_score(90);
			self.var_cdab067f = 3;
		}
		if(self.var_f0cce92b > 150 && self.var_f0cce92b < 200)
		{
			self playlocalsound("evt_headshots_03");
			zm_score::add_to_player_score(120);
			self.var_cdab067f = 4;
		}
		if(self.var_f0cce92b > 200)
		{
			self playlocalsound("evt_headshots_04");
			zm_score::add_to_player_score(150);
			self.var_cdab067f = 5;
		}
		kills = self.pers["kills"];
		headshots = self.pers["headshots"];
		self.var_f0cce92b++;
	}
}

/*
	Name: function_7f15d111
	Namespace: namespace_9e7298d7
	Checksum: 0x1D3C15C7
	Offset: 0x870
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 137
*/
function function_7f15d111()
{
	self.var_cdab067f = 0;
	while(self.var_cdab067f < 1)
	{
		wait(0.05);
	}
	self playlocalsound("evt_headshots_pr_00");
	self thread function_f9caff1e("double_points");
	while(self.var_cdab067f < 2)
	{
		wait(0.05);
	}
	self playlocalsound("evt_headshots_pr_01");
	self thread function_f9caff1e("insta_kill");
	while(self.var_cdab067f < 3)
	{
		wait(0.05);
	}
	self playlocalsound("evt_headshots_pr_02");
	self thread function_f9caff1e("nuke");
	while(self.var_cdab067f < 4)
	{
		wait(0.05);
	}
	self playlocalsound("evt_headshots_pr_03");
	self thread function_f9caff1e("full_ammo");
	while(self.var_cdab067f < 5)
	{
		wait(0.05);
	}
	self playlocalsound("evt_headshots_pr_03");
	wait(0.05);
	self playlocalsound("evt_headshots_final");
	self zm_perks::give_perk("specialty_deadshot");
}

/*
	Name: function_f9caff1e
	Namespace: namespace_9e7298d7
	Checksum: 0xCDEBB42A
	Offset: 0xA70
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 184
*/
function function_f9caff1e(hot)
{
	loc = CheckNavMeshDirection(self.origin, AnglesToForward(self.angles), 90, 20);
	drop = hot;
	powerup = drop;
	location = loc;
	powerup_team = undefined;
	powerup_location = undefined;
	pickup_delay = undefined;
	powerup_player = undefined;
	b_stay_forever = 1;
	zm_powerups::specific_powerup_drop(powerup, location, powerup_team, powerup_location, pickup_delay, powerup_player, b_stay_forever);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: watch_for_death
	Namespace: namespace_9e7298d7
	Checksum: 0x4BBC28E2
	Offset: 0xB80
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 210
*/
function watch_for_death()
{
	level notify("hash_8f012424", self GetTagOrigin("j_head"));
}

/*
	Name: function_d0319ba0
	Namespace: namespace_9e7298d7
	Checksum: 0x51F453A8
	Offset: 0xBB8
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function function_d0319ba0()
{
	while(1)
	{
		level waittill("hash_8f012424", origin);
		if(self.var_f0cce92b > 25 && self.var_f0cce92b < 50)
		{
			playFX("vk_fx/zm/_vk_zm_headshot_combo_1", origin);
		}
		if(self.var_f0cce92b > 50 && self.var_f0cce92b < 100)
		{
			playFX("vk_fx/zm/_vk_zm_headshot_combo_2", origin);
		}
		if(self.var_f0cce92b > 100 && self.var_f0cce92b < 150)
		{
			playFX("vk_fx/zm/_vk_zm_headshot_combo_3", origin);
		}
		if(self.var_f0cce92b > 150 && self.var_f0cce92b < 200)
		{
			playFX("vk_fx/zm/_vk_zm_headshot_combo_4", origin);
		}
		if(self.var_f0cce92b > 200)
		{
			playFX("vk_fx/zm/_vk_zm_headshot_combo_5", origin);
		}
	}
}

