#include scripts\codescripts\struct;
#include scripts\shared\_burnplayer;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\gameobjects_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\kj_jzm_playerhud;
#include scripts\zm\kj_jzm_rankicon;
#include scripts\zm\zmsavedata;

#namespace namespace_683dd809;

/*
	Name: __init__sytem__
	Namespace: namespace_683dd809
	Checksum: 0x46369238
	Offset: 0x8D0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 51
*/
function autoexec __init__sytem__()
{
	system::register("kj_jzm_xp", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_683dd809
	Checksum: 0x9ACF73B8
	Offset: 0x918
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function __init__()
{
}

/*
	Name: __main__
	Namespace: namespace_683dd809
	Checksum: 0x2619F59E
	Offset: 0x928
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function __main__()
{
	zm_spawner::register_zombie_death_event_callback(&function_85e0a818);
	level thread function_833a5dce();
	level thread function_5ed0a783();
}

/*
	Name: function_85e0a818
	Namespace: namespace_683dd809
	Checksum: 0x473B03E8
	Offset: 0x988
	Size: 0x230
	Parameters: 1
	Flags: None
	Line Number: 97
*/
function function_85e0a818(attacker)
{
	if(!isdefined(attacker) || !isPlayer(attacker))
	{
		return;
	}
	if(isdefined(self) && isdefined(self.damageMod) && self.damageMod == "MOD_MELEE")
	{
		attacker.var_b93089b6 = attacker.var_b93089b6 + 200;
		attacker.var_fdb8642e = attacker.var_fdb8642e + 200;
		if(!isdefined(attacker.var_832e614e))
		{
			attacker LUINotifyEvent(&"score_event", 2, &"", 200);
		}
	}
	else if(zm_utility::is_headshot(self.damageWeapon, self.damagelocation, self.damageMod))
	{
		attacker.var_b93089b6 = attacker.var_b93089b6 + 150;
		attacker.var_fdb8642e = attacker.var_fdb8642e + 150;
		if(!isdefined(attacker.var_832e614e))
		{
			attacker LUINotifyEvent(&"score_event", 2, &"", 150);
		}
	}
	else if(!isdefined(attacker.var_832e614e))
	{
		attacker.var_b93089b6 = attacker.var_b93089b6 + 100;
		attacker.var_fdb8642e = attacker.var_fdb8642e + 100;
		attacker LUINotifyEvent(&"score_event", 2, &"", 100);
	}
}

/*
	Name: function_c7aa6ee1
	Namespace: namespace_683dd809
	Checksum: 0xDE374B13
	Offset: 0xBC0
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 139
*/
function function_c7aa6ee1(players)
{
	level endon("game_ended");
	var_4ffba84c = 25;
	level waittill("end_of_round");
	for(;;)
	{
		var_4ffba84c = var_4ffba84c + 25;
		foreach(player in players)
		{
			if(!isdefined(player.var_4eb23f86))
			{
				player LUINotifyEvent(&"score_event", 2, &"Survived", var_4ffba84c * 2);
			}
			wait(0.15);
		}
		if(var_4ffba84c >= 1500)
		{
			var_4ffba84c = 1500;
		}
		else
		{
			var_4ffba84c = var_4ffba84c + 25;
		}
		level waittill("end_of_round");
	}
}

/*
	Name: function_4d739800
	Namespace: namespace_683dd809
	Checksum: 0xC1CD7F57
	Offset: 0xD08
	Size: 0x140
	Parameters: 2
	Flags: None
	Line Number: 177
*/
function function_4d739800(player, var_4ffba84c)
{
	var_4ffba84c = var_4ffba84c + 100;
	if(isdefined(player.var_43f5a8d3) && player.var_43f5a8d3)
	{
		var_4ffba84c = var_4ffba84c + 100;
	}
	if(!isdefined(player.var_4eb23f86))
	{
		player LUINotifyEvent(&"score_event", 2, &"Survived", var_4ffba84c);
	}
	if(isdefined(player.var_b93089b6) && isdefined(player.var_fdb8642e))
	{
		player.var_b93089b6 = player.var_b93089b6 + var_4ffba84c;
		player.var_fdb8642e = player.var_fdb8642e + var_4ffba84c;
	}
	wait(RandomFloat(1));
	player notify("hash_d21c96ae");
	wait(0.5);
	return;
}

/*
	Name: function_c52eaacc
	Namespace: namespace_683dd809
	Checksum: 0xE2D4B023
	Offset: 0xE50
	Size: 0x108
	Parameters: 2
	Flags: None
	Line Number: 209
*/
function function_c52eaacc(player, var_4ffba84c)
{
	var_4ffba84c = var_4ffba84c + 100;
	if(!isdefined(player.var_4eb23f86))
	{
		player LUINotifyEvent(&"score_event", 2, &"Survived", var_4ffba84c);
	}
	if(isdefined(player.var_b93089b6) && isdefined(player.var_fdb8642e))
	{
		player.var_b93089b6 = player.var_b93089b6 + var_4ffba84c;
		player.var_fdb8642e = player.var_fdb8642e + var_4ffba84c;
	}
	wait(RandomFloat(1));
	player notify("hash_d21c96ae");
	wait(0.5);
	return;
	ERROR: Bad function call
}

/*
	Name: function_4783af22
	Namespace: namespace_683dd809
	Checksum: 0x9B449E7A
	Offset: 0xF60
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 238
*/
function function_4783af22()
{
	doors1 = GetEntArray("zombie_door", "targetname");
	doors2 = GetEntArray("zombie_debris", "targetname");
	wait(0.1);
	targets = ArrayCombine(doors1, doors2, 1, 1);
	if(targets.size < 1)
	{
		return;
	}
	for(i = 0; i < targets.size; i++)
	{
		targets[i] thread function_28258259();
	}
}

/*
	Name: function_28258259
	Namespace: namespace_683dd809
	Checksum: 0x17F515D9
	Offset: 0x1058
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 264
*/
function function_28258259()
{
	self waittill("trigger", player);
	wait(2);
	if(isdefined(player) && !player IsTestClient())
	{
		if(!isdefined(player.var_4eb23f86))
		{
			player LUINotifyEvent(&"score_event", 2, &"Purchase", 200);
		}
		if(isdefined(player.var_b93089b6) && isdefined(player.var_fdb8642e))
		{
			player.var_b93089b6 = player.var_b93089b6 + 200;
			player.var_fdb8642e = player.var_fdb8642e + 200;
		}
		player notify("hash_d21c96ae");
		wait(0.75);
		player notify("hash_214f0d50");
		return;
	}
}

/*
	Name: function_833a5dce
	Namespace: namespace_683dd809
	Checksum: 0xAF4F9EE1
	Offset: 0x1188
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 296
*/
function function_833a5dce()
{
	level endon("game_ended");
	var_4efd0f29 = GetEnt("use_elec_switch", "targetname");
	if(isdefined(var_4efd0f29))
	{
		var_4efd0f29 waittill("trigger", player);
		if(isdefined(player))
		{
			if(player IsSplitscreen() && !player IsHost() || player IsTestClient())
			{
				return;
			}
			if(!isdefined(player.var_4eb23f86))
			{
				player LUINotifyEvent(&"score_event", 2, &"", 300);
			}
			if(isdefined(player.var_b93089b6) && isdefined(player.var_fdb8642e))
			{
				player.var_b93089b6 = player.var_b93089b6 + 300;
				player.var_fdb8642e = player.var_fdb8642e + 300;
				return;
			}
		}
	}
}

/*
	Name: function_5ed0a783
	Namespace: namespace_683dd809
	Checksum: 0xC7F48A5D
	Offset: 0x12F8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 333
*/
function function_5ed0a783()
{
	level endon("game_ended");
	for(;;)
	{
		level waittill("powerup_dropped", powerup);
		if(isdefined(powerup))
		{
			thread function_bc6916c(powerup);
		}
	}
}

/*
	Name: function_bc6916c
	Namespace: namespace_683dd809
	Checksum: 0x595CECEC
	Offset: 0x1350
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 356
*/
function function_bc6916c(powerup)
{
	level endon("game_ended");
	powerup endon("powerup_timedout");
	powerup endon("hacked");
	if(isdefined(powerup))
	{
		powerup waittill("powerup_grabbed");
		if(isdefined(powerup.power_up_grab_player))
		{
			player = powerup.power_up_grab_player;
			if(player IsSplitscreen() && !player IsHost() || player IsTestClient())
			{
				return;
			}
			if(!isdefined(player.var_4eb23f86))
			{
				player LUINotifyEvent(&"score_event", 2, &"", 100);
			}
			if(isdefined(player.var_b93089b6) && isdefined(player.var_fdb8642e))
			{
				player.var_b93089b6 = player.var_b93089b6 + 100;
				player.var_fdb8642e = player.var_fdb8642e + 100;
			}
			player notify("hash_d21c96ae");
			return;
		}
	}
}

/*
	Name: function_23e3970f
	Namespace: namespace_683dd809
	Checksum: 0xD7DC58B2
	Offset: 0x14E0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 396
*/
function function_23e3970f()
{
	self thread function_c73b1285();
	wait(0.15);
	self thread function_f1047169();
	wait(0.1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c73b1285
	Namespace: namespace_683dd809
	Checksum: 0xA27D7CA3
	Offset: 0x1530
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 416
*/
function function_c73b1285()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("perk_purchased");
		wait(0.25);
		if(!isdefined(self.var_4eb23f86))
		{
			self LUINotifyEvent(&"score_event", 2, &"Purchase", 300);
		}
		if(isdefined(self.var_b93089b6) && isdefined(self.var_fdb8642e))
		{
			self.var_b93089b6 = self.var_b93089b6 + 300;
			self.var_fdb8642e = self.var_fdb8642e + 300;
		}
		self notify("hash_d21c96ae");
		wait(0.75);
		self notify("hash_214f0d50");
	}
}

/*
	Name: function_f1047169
	Namespace: namespace_683dd809
	Checksum: 0x92BD111
	Offset: 0x1610
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 449
*/
function function_f1047169()
{
	level endon("game_ended");
	self endon("disconnect");
	var_21e18204 = 0;
	for(;;)
	{
		self util::waittill_any("user_grabbed_weapon", "weapon_give");
		self waittill("weapon_change", weapon);
		currentWeapon = self GetCurrentWeapon();
		if(isdefined(currentWeapon))
		{
			if(isdefined(level.weaponReviveTool) && currentWeapon == level.weaponReviveTool)
			{
				self waittill("weapon_change", weapon);
			}
			else if(currentWeapon.name == "zombie_knuckle_crack")
			{
			}
			else if(currentWeapon.name == "zombie_bgb_grab" || currentWeapon.name == "zombie_bgb_use")
			{
				self waittill("weapon_change", weapon);
			}
			else if(var_21e18204 != level.round_number)
			{
				var_21e18204 = level.round_number;
				if(!isdefined(self.var_4eb23f86))
				{
					self LUINotifyEvent(&"score_event", 2, &"Purchase", 250);
				}
				if(isdefined(self.var_b93089b6) && isdefined(self.var_fdb8642e))
				{
					self.var_b93089b6 = self.var_b93089b6 + 250;
					self.var_fdb8642e = self.var_fdb8642e + 250;
				}
				self notify("hash_d21c96ae");
				wait(0.75);
				self notify("hash_214f0d50");
			}
		}
	}
}

/*
	Name: function_df10d167
	Namespace: namespace_683dd809
	Checksum: 0xCFCC0301
	Offset: 0x1808
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 502
*/
function function_df10d167()
{
	self endon("disconnect");
	level endon("game_ended");
	for(;;)
	{
		self waittill("hash_d21c96ae");
		if(isdefined(self.var_b93089b6) && isdefined(self.var_188c9f4d))
		{
			frac = self.var_b93089b6 / self.var_188c9f4d;
			if(isdefined(frac))
			{
				self function_7e17e0b5(frac);
			}
		}
	}
}

/*
	Name: function_b14d16e3
	Namespace: namespace_683dd809
	Checksum: 0x27720D6A
	Offset: 0x1898
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 530
*/
function function_b14d16e3()
{
	frac = 0;
	additive = 0.02;
	for(;;)
	{
		self function_7e17e0b5(frac);
		frac = frac + additive;
		wait(0.05);
		if(frac > 1)
		{
		}
	}
	else
	{
	}
}

/*
	Name: function_a89ccb24
	Namespace: namespace_683dd809
	Checksum: 0xED6B382A
	Offset: 0x1918
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 558
*/
function function_a89ccb24()
{
	if(isdefined(self.var_188c9f4d))
	{
		self.var_188c9f4d = 25000;
	}
	else
	{
		self.var_188c9f4d = 25000;
	}
}

/*
	Name: function_23195bd7
	Namespace: namespace_683dd809
	Checksum: 0x8A97C4EF
	Offset: 0x1950
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 580
*/
function function_23195bd7()
{
	self.var_a351ac72 = 1;
	var_cd33bdb8 = self.var_fc421594 + ",Rank: " + self.var_1c43abc3;
	wait(0.05);
	if(isdefined(var_cd33bdb8))
	{
		self SetControllerUIModelValue("pegasus_player_notify", var_cd33bdb8);
		if(isdefined(self.var_b36224f8))
		{
			self playlocalsound(self.var_b36224f8);
		}
		wait(0.2);
	}
	self.var_a351ac72 = 0;
}

/*
	Name: function_41441df5
	Namespace: namespace_683dd809
	Checksum: 0xDBCA0731
	Offset: 0x1A00
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 607
*/
function function_41441df5()
{
	self function_a89ccb24();
	self thread function_df10d167();
	if(isdefined(self.var_b93089b6) && isdefined(self.var_188c9f4d))
	{
		frac = self.var_b93089b6 / self.var_188c9f4d;
		if(isdefined(frac))
		{
			self function_7e17e0b5(frac);
		}
	}
	self thread function_6a9c4639();
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: function_6a9c4639
	Namespace: namespace_683dd809
	Checksum: 0xBCEC2EB
	Offset: 0x1AB0
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 635
*/
function function_6a9c4639()
{
	self endon("disconnect");
	level endon("game_ended");
	Check = 1;
	for(;;)
	{
		self waittill("zom_kill");
		self waittill("zom_kill");
		self waittill("zom_kill");
		if(isdefined(self.var_b93089b6) && isdefined(self.var_188c9f4d))
		{
			frac = self.var_b93089b6 / self.var_188c9f4d;
			if(isdefined(frac))
			{
				self function_7e17e0b5(frac);
				if(self.var_b93089b6 >= self.var_188c9f4d)
				{
					self.var_70a24c4d = 1;
					self thread function_c929e2bc(Check);
				}
			}
		}
	}
}

/*
	Name: function_96bb889
	Namespace: namespace_683dd809
	Checksum: 0x24591B8A
	Offset: 0x1BA0
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 671
*/
function function_96bb889()
{
	if(!isdefined(self.var_cfc277c6))
	{
		self.var_cfc277c6 = self.var_1c43abc3;
	}
	if(!isdefined(self.var_1c43abc3) || !IsInt(self.var_1c43abc3) || self.var_1c43abc3 < 1 || self.var_1c43abc3 > 60000)
	{
		return 1;
	}
	if(self.var_1c43abc3 > self.var_cfc277c6 + 1)
	{
		return 1;
	}
	if(!isdefined(self.var_1c827122))
	{
		self.var_1c827122 = GetTime();
	}
	else if(GetTime() - self.var_1c827122 < 60000)
	{
		return 1;
	}
	if(self.var_3298b74b <= self.var_aa8af75b)
	{
		return 1;
	}
	if(!isdefined(self.var_70a24c4d) || self.var_70a24c4d != 1)
	{
		return 1;
	}
	if(self.var_a2be355 != self getXuid())
	{
		return 1;
	}
	self.var_1c827122 = GetTime();
	self.var_cfc277c6 = self.var_1c43abc3;
	return 0;
}

/*
	Name: function_c929e2bc
	Namespace: namespace_683dd809
	Checksum: 0x1F536F73
	Offset: 0x1D00
	Size: 0x2F8
	Parameters: 1
	Flags: None
	Line Number: 720
*/
function function_c929e2bc(Check)
{
	if(isdefined(self.var_1c43abc3))
	{
		self.var_1c43abc3++;
		if(!isdefined(Check) || Check != 1)
		{
			self.var_1c43abc3--;
			self.var_b93089b6 = 0;
			return;
		}
		if(self function_96bb889())
		{
			self.var_1c43abc3--;
			self.var_b93089b6 = 0;
			return;
		}
		self.var_bdddd23f = 1;
		if(self.var_1c43abc3 >= 1000)
		{
			if(isdefined(self.var_fc8b4a8d))
			{
				if(self.var_1c43abc3 >= 6000)
				{
					self.var_1c43abc3 = 6000;
					wait(0.05);
				}
				while(self.var_1c43abc3 >= 3000)
				{
					self.var_1c43abc3 = self.var_1c43abc3 - 3000;
					self.var_9d6730be = self.var_9d6730be + 2;
					wait(0.15);
				}
				if(self.var_1c43abc3 >= 1000)
				{
					self.var_9d6730be++;
				}
				self.var_1c43abc3 = 0;
				self namespace_11e193f1::function_89cedfa0(9, self.var_1c43abc3);
				wait(0.25);
				self namespace_11e193f1::function_89cedfa0(5, self.var_9d6730be);
			}
			else
			{
				self.var_1c43abc3 = 0;
				self.var_9d6730be++;
				self namespace_11e193f1::function_89cedfa0(9, self.var_1c43abc3);
				wait(0.25);
				self namespace_11e193f1::function_89cedfa0(5, self.var_9d6730be);
			}
		}
		else if(self.var_1c43abc3 < 1000)
		{
			self namespace_11e193f1::function_89cedfa0(9, self.var_1c43abc3);
		}
		self.var_70a24c4d = 0;
		if(isdefined(self.var_9d6730be))
		{
			var_d12888a5 = "JZMRank P" + self.var_9d6730be + " R" + self.var_1c43abc3;
		}
		else
		{
			var_d12888a5 = "JZMRank Rank " + self.var_1c43abc3;
		}
		self SetControllerUIModelValue("pegasus_player", var_d12888a5);
	}
	self function_340b2f4a();
	self.var_b93089b6 = 0;
	self namespace_11e193f1::function_89cedfa0(10, 0);
	self function_23195bd7();
	self.var_bdddd23f = 0;
}

/*
	Name: function_340b2f4a
	Namespace: namespace_683dd809
	Checksum: 0x83CB387E
	Offset: 0x2000
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 803
*/
function function_340b2f4a()
{
	if(isdefined(self.var_bdda35d9))
	{
		if(self.var_bdda35d9 == 270)
		{
			self namespace_e371a49c::function_e169666(self.var_1c43abc3);
			self namespace_32dd7dbd::function_e8a40676();
		}
	}
}

/*
	Name: function_7e17e0b5
	Namespace: namespace_683dd809
	Checksum: 0x6009CBCE
	Offset: 0x2060
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 825
*/
function function_7e17e0b5(frac)
{
	if(frac < 0.26)
	{
		function_c362246d(frac);
	}
	else if(frac < 0.51)
	{
		function_50e10827(frac);
	}
	else if(frac < 0.76)
	{
		function_879410aa(frac);
	}
	else if(frac > 0.75)
	{
		function_214a0be2(frac);
		return;
	}
}

/*
	Name: function_c362246d
	Namespace: namespace_683dd809
	Checksum: 0x92007DEA
	Offset: 0x2118
	Size: 0x2E8
	Parameters: 1
	Flags: None
	Line Number: 856
*/
function function_c362246d(frac)
{
	if(frac < 0.02)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0");
	}
	else if(frac < 0.04)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.02");
	}
	else if(frac < 0.06)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.04");
	}
	else if(frac < 0.08)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.06");
	}
	else if(frac < 0.1)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.08");
	}
	else if(frac < 0.12)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.10");
	}
	else if(frac < 0.14)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.12");
	}
	else if(frac < 0.16)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.14");
	}
	else if(frac < 0.18)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.16");
	}
	else if(frac < 0.2)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.18");
	}
	else if(frac < 0.22)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.20");
	}
	else if(frac < 0.24)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.22");
	}
	else if(frac < 0.26)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.24");
	}
}

/*
	Name: function_50e10827
	Namespace: namespace_683dd809
	Checksum: 0x542F816C
	Offset: 0x2408
	Size: 0x2E8
	Parameters: 1
	Flags: None
	Line Number: 922
*/
function function_50e10827(frac)
{
	if(frac < 0.28)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.26");
	}
	else if(frac < 0.3)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.28");
	}
	else if(frac < 0.32)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.30");
	}
	else if(frac < 0.34)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.32");
	}
	else if(frac < 0.36)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.34");
	}
	else if(frac < 0.38)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.36");
	}
	else if(frac < 0.4)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.38");
	}
	else if(frac < 0.42)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.40");
	}
	else if(frac < 0.44)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.42");
	}
	else if(frac < 0.46)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.44");
	}
	else if(frac < 0.48)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.46");
	}
	else if(frac < 0.5)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.48");
	}
	else if(frac < 0.52)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.50");
	}
}

/*
	Name: function_879410aa
	Namespace: namespace_683dd809
	Checksum: 0x77051EE2
	Offset: 0x26F8
	Size: 0x2B0
	Parameters: 1
	Flags: None
	Line Number: 988
*/
function function_879410aa(frac)
{
	if(frac < 0.54)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.52");
	}
	else if(frac < 0.56)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.54");
	}
	else if(frac < 0.58)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.56");
	}
	else if(frac < 0.6)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.58");
	}
	else if(frac < 0.62)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.60");
	}
	else if(frac < 0.64)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.62");
	}
	else if(frac < 0.66)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.64");
	}
	else if(frac < 0.68)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.66");
	}
	else if(frac < 0.7)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.68");
	}
	else if(frac < 0.72)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.70");
	}
	else if(frac < 0.74)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.72");
	}
	else if(frac < 0.76)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.74");
	}
}

/*
	Name: function_214a0be2
	Namespace: namespace_683dd809
	Checksum: 0xFCD37B28
	Offset: 0x29B0
	Size: 0x2E4
	Parameters: 1
	Flags: None
	Line Number: 1050
*/
function function_214a0be2(frac)
{
	if(frac < 0.78)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.76");
	}
	else if(frac < 0.8)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.78");
	}
	else if(frac < 0.82)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.80");
	}
	else if(frac < 0.84)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.82");
	}
	else if(frac < 0.86)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.84");
	}
	else if(frac < 0.88)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.86");
	}
	else if(frac < 0.9)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.88");
	}
	else if(frac < 0.92)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.90");
	}
	else if(frac < 0.94)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.92");
	}
	else if(frac < 0.96)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.94");
	}
	else if(frac < 0.98)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.96");
	}
	else if(frac < 1)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle0.98");
	}
	else if(frac >= 1)
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMCircle1");
	}
}

