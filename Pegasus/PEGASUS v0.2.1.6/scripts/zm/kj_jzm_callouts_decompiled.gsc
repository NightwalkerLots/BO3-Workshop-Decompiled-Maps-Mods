#include scripts\codescripts\struct;
#include scripts\shared\_burnplayer;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\bots\_bot;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
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

#namespace namespace_9aaa7736;

/*
	Name: __init__sytem__
	Namespace: namespace_9aaa7736
	Checksum: 0x5922636B
	Offset: 0xAC0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 44
*/
function autoexec __init__sytem__()
{
	system::register("kj_jzm_callouts", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_9aaa7736
	Checksum: 0x9ACF73B8
	Offset: 0xB08
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 59
*/
function __init__()
{
}

/*
	Name: __main__
	Namespace: namespace_9aaa7736
	Checksum: 0xF88EF69D
	Offset: 0xB18
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function __main__()
{
	level thread function_709049b2();
	return;
}

/*
	Name: function_d9064d69
	Namespace: namespace_9aaa7736
	Checksum: 0x218A7A9E
	Offset: 0xB40
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 89
*/
function function_d9064d69(var_a6c2dc79)
{
	foreach(player in GetPlayers())
	{
		if(!isdefined(player.var_3e958c62))
		{
			player IPrintLnBold(var_a6c2dc79);
		}
	}
}

/*
	Name: callouts
	Namespace: namespace_9aaa7736
	Checksum: 0xC2418721
	Offset: 0xC00
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 110
*/
function callouts()
{
	self.var_b15026f3 = "";
	self.var_a6c2dc79 = "";
	self.var_8e8b20bd = 0;
	if(!isdefined(level.var_eb7e28bd))
	{
		self thread function_244e5cd8();
	}
	self thread function_4d6a7e60();
	self thread function_2f754808();
	self thread function_e066fa6b();
	self thread function_f7893b16();
	wait(1.5);
}

/*
	Name: function_709049b2
	Namespace: namespace_9aaa7736
	Checksum: 0x8B4D322B
	Offset: 0xCC8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 136
*/
function function_709049b2()
{
	level endon("game_ended");
	for(;;)
	{
		level waittill("powerup_dropped", powerup);
		if(isdefined(powerup))
		{
			thread function_c4543e5c(powerup);
		}
	}
}

/*
	Name: function_c4543e5c
	Namespace: namespace_9aaa7736
	Checksum: 0xA5380DE0
	Offset: 0xD20
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 159
*/
function function_c4543e5c(powerup)
{
	level endon("game_ended");
	powerup endon("powerup_timedout");
	powerup endon("hacked");
	if(isdefined(powerup))
	{
		thread function_c9aecc4b(powerup);
		powerup waittill("powerup_grabbed");
		thread function_ee1434fb(powerup);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ee1434fb
	Namespace: namespace_9aaa7736
	Checksum: 0x97168E56
	Offset: 0xDA8
	Size: 0x378
	Parameters: 1
	Flags: None
	Line Number: 184
*/
function function_ee1434fb(powerup)
{
	player = powerup.power_up_grab_player;
	if(isdefined(player) && isdefined(player.var_1ad2f4ac) && isdefined(powerup.powerup_name))
	{
		if(powerup.powerup_name == "nuke")
		{
			var_a6c2dc79 = player.var_1ad2f4ac + ":^7 Nuke!";
			thread function_d9064d69(var_a6c2dc79);
			return;
		}
		else if(powerup.powerup_name == "double_points")
		{
			var_a6c2dc79 = player.var_1ad2f4ac + ":^7 Double Points";
			thread function_d9064d69(var_a6c2dc79);
			return;
		}
		else if(powerup.powerup_name == "insta_kill")
		{
			var_a6c2dc79 = player.var_1ad2f4ac + ":^7 Insta-Kill";
			thread function_d9064d69(var_a6c2dc79);
			return;
		}
		else if(powerup.powerup_name == "full_ammo")
		{
			var_a6c2dc79 = player.var_1ad2f4ac + ":^7 I got a Max Ammo";
			thread function_d9064d69(var_a6c2dc79);
			return;
		}
		else if(powerup.powerup_name == "minigun")
		{
			var_a6c2dc79 = player.var_1ad2f4ac + ":^7 I got a Death Machine";
			thread function_d9064d69(var_a6c2dc79);
			return;
		}
		else if(powerup.powerup_name == "fire_sale")
		{
			var_a6c2dc79 = player.var_1ad2f4ac + ":^7 Fire Sale";
			thread function_d9064d69(var_a6c2dc79);
			return;
		}
		else if(powerup.powerup_name == "free_perk")
		{
			var_a6c2dc79 = player.var_1ad2f4ac + ":^7 Free Perk everyone";
			thread function_d9064d69(var_a6c2dc79);
			return;
		}
		else if(powerup.powerup_name == "bonus_points_player")
		{
			var_a6c2dc79 = player.var_1ad2f4ac + ":^7 I like money";
			thread function_d9064d69(var_a6c2dc79);
			return;
		}
		else if(powerup.powerup_name == "bonfire_sale")
		{
			var_a6c2dc79 = player.var_1ad2f4ac + ":^7 Bonfire Sale";
			thread function_d9064d69(var_a6c2dc79);
			return;
		}
	}
}

/*
	Name: function_c9aecc4b
	Namespace: namespace_9aaa7736
	Checksum: 0x4503CE23
	Offset: 0x1128
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 256
*/
function function_c9aecc4b(powerup)
{
	if(powerup.powerup_name == "full_ammo")
	{
		var_a6c2dc79 = "^3Announcer: ^7Max Ammo, Reload";
		thread function_d9064d69(var_a6c2dc79);
		return;
	}
	else if(powerup.powerup_name == "free_perk")
	{
		var_a6c2dc79 = "^3Announcer: ^7Free Perk";
		thread function_d9064d69(var_a6c2dc79);
	}
}

/*
	Name: function_f7893b16
	Namespace: namespace_9aaa7736
	Checksum: 0x7BF0E4A1
	Offset: 0x11C8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 281
*/
function function_f7893b16()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("player_downed");
		if(isdefined(self) && self laststand::player_is_in_laststand())
		{
			curr_weap = self GetCurrentWeapon();
			if(isdefined(curr_weap))
			{
				self thread function_8fef2be9(curr_weap);
				self thread function_5a5c028a();
			}
		}
	}
}

/*
	Name: function_5a5c028a
	Namespace: namespace_9aaa7736
	Checksum: 0x2685B7B9
	Offset: 0x1278
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 310
*/
function function_5a5c028a()
{
	level endon("game_ended");
	self endon("disconnect");
	self endon("bled_out");
	self waittill("player_revived", reviver);
	if(isdefined(reviver))
	{
		if(reviver.name == self.name)
		{
			self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I'm Alive!";
			thread function_d9064d69(self.var_a6c2dc79);
		}
		else
		{
			self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 Thank you " + reviver.name;
			thread function_d9064d69(self.var_a6c2dc79);
		}
	}
}

/*
	Name: function_8fef2be9
	Namespace: namespace_9aaa7736
	Checksum: 0xC4D7AF31
	Offset: 0x1360
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 341
*/
function function_8fef2be9(curr_weap)
{
	if(curr_weap.name == "ray_gun" || curr_weap.name == "ray_gun_upgraded")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 Help, I have the raygun!";
		thread function_d9064d69(self.var_a6c2dc79);
		return;
	}
	if(curr_weap.name == "bo3_mark2" || curr_weap.name == "bo3_mark2_upgraded")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 Help, I have the raygun!";
		thread function_d9064d69(self.var_a6c2dc79);
		return;
	}
	else
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I'm down, someone revive me!";
		thread function_d9064d69(self.var_a6c2dc79);
	}
}

/*
	Name: function_e066fa6b
	Namespace: namespace_9aaa7736
	Checksum: 0x5F79F9C9
	Offset: 0x1480
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 372
*/
function function_e066fa6b()
{
	level endon("game_ended");
	self endon("disconnect");
	a_str_perks = getArrayKeys(level._custom_perks);
	if(isdefined(a_str_perks))
	{
		var_c8afdd2 = a_str_perks.size;
	}
	for(;;)
	{
		self waittill("perk_purchased", str_perk);
		wait(0.05);
		if(isdefined(self.num_perks))
		{
			if(isdefined(var_c8afdd2))
			{
				if(self.num_perks == var_c8afdd2 - 1)
				{
					self.var_b93089b6 = self.var_b93089b6 + 1000;
					self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I'm a perkaholic! ^2 +1000XP";
					thread function_d9064d69(self.var_a6c2dc79);
				}
			}
		}
	}
	else
	{
		return;
	}
	else
	{
	}
	else
	{
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_6fd3fe08
	Namespace: namespace_9aaa7736
	Checksum: 0x4715F994
	Offset: 0x1588
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 421
*/
function function_6fd3fe08()
{
	doors1 = GetEntArray("zombie_door", "targetname");
	doors2 = GetEntArray("zombie_debris", "targetname");
	wait(0.05);
	targets = ArrayCombine(doors1, doors2, 1, 1);
	for(i = 0; i < targets.size; i++)
	{
		targets[i] thread function_301782b();
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_301782b
	Namespace: namespace_9aaa7736
	Checksum: 0x430108BF
	Offset: 0x1670
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 445
*/
function function_301782b()
{
	while(isdefined(self))
	{
		self waittill("trigger", player);
		wait(0.05);
		if(isdefined(player) && !player IsTestClient() && !isdefined(player.var_3e958c62))
		{
			doors_purchased = player.pers["doors_purchased"];
			if(isdefined(player.var_8e8b20bd) && isdefined(doors_purchased))
			{
				if(player.var_8e8b20bd != doors_purchased)
				{
					player.var_8e8b20bd = doors_purchased;
					if(doors_purchased == 1)
					{
						player.var_a6c2dc79 = player.var_1ad2f4ac + ":^7 I've bought^2 1 ^7door";
						thread function_d9064d69(player.var_a6c2dc79);
						break;
					}
					else
					{
						player.var_a6c2dc79 = player.var_1ad2f4ac + ":^7 I've bought^2 " + doors_purchased + " ^7doors";
						thread function_d9064d69(player.var_a6c2dc79);
						break;
					}
				}
			}
		}
	}
}

/*
	Name: function_2f754808
	Namespace: namespace_9aaa7736
	Checksum: 0x3CC249F2
	Offset: 0x1808
	Size: 0x258
	Parameters: 0
	Flags: None
	Line Number: 487
*/
function function_2f754808()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("zom_kill");
		var_940a9f6e = self.pers["kills"];
		if(var_940a9f6e > 1000)
		{
		}
		else
		{
			switch(var_940a9f6e)
			{
				case 50:
				{
					self.var_b93089b6 = self.var_b93089b6 + 50;
					self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got 50 kills! ^2 +50XP";
					thread function_d9064d69(self.var_a6c2dc79);
					break;
				}
				case 100:
				{
					self.var_b93089b6 = self.var_b93089b6 + 100;
					self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got 100 ^7kills! ^2 +100XP";
					thread function_d9064d69(self.var_a6c2dc79);
					break;
				}
				case 250:
				{
					self.var_b93089b6 = self.var_b93089b6 + 250;
					self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got 250 ^7kills! ^2 +250XP";
					thread function_d9064d69(self.var_a6c2dc79);
					break;
				}
				case 500:
				{
					self.var_b93089b6 = self.var_b93089b6 + 500;
					self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got 500 ^7kills! ^2 +500XP";
					thread function_d9064d69(self.var_a6c2dc79);
					break;
				}
				case 750:
				{
					self.var_b93089b6 = self.var_b93089b6 + 750;
					self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got 750 ^7kills! ^2 +750XP";
					thread function_d9064d69(self.var_a6c2dc79);
					break;
				}
				case 1000:
				{
					self.var_b93089b6 = self.var_b93089b6 + 1000;
					self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got 1000 ^7kills! ^2 +1000XP";
					thread function_d9064d69(self.var_a6c2dc79);
					break;
				}
			}
		}
	}
}

/*
	Name: function_4d6a7e60
	Namespace: namespace_9aaa7736
	Checksum: 0x143EB14F
	Offset: 0x1A68
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 559
*/
function function_4d6a7e60()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("perk_purchased", str_perk);
		self thread function_5dff51d5();
		if(isdefined(str_perk))
		{
			self function_68f14a25(str_perk);
			if(isdefined(self.var_a6c2dc79))
			{
				thread function_d9064d69(self.var_a6c2dc79);
			}
		}
	}
}

/*
	Name: function_5dff51d5
	Namespace: namespace_9aaa7736
	Checksum: 0x9BFA609A
	Offset: 0x1B08
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 588
*/
function function_5dff51d5()
{
	self waittill("weapon_change");
	wait(3.75);
	if(isdefined(self.var_7355dabe))
	{
		self AllowSprint(0);
		self IPrintLnBold("STEALTH SHOOTER, Disabling Sprint");
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_68f14a25
	Namespace: namespace_9aaa7736
	Checksum: 0xB3DDF12F
	Offset: 0x1B70
	Size: 0x2C8
	Parameters: 1
	Flags: None
	Line Number: 611
*/
function function_68f14a25(str_perk)
{
	if(str_perk == "specialty_additionalprimaryweapon")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2MULE KICK";
		return;
	}
	else if(str_perk == "specialty_armorvest")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2JUGGER-NOG";
		return;
	}
	else if(str_perk == "specialty_deadshot")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2DEADSHOT DAIQUIRI";
		return;
	}
	else if(str_perk == "specialty_doubletap2")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2DOUBLE TAP";
		return;
	}
	else if(str_perk == "specialty_electriccherry")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2ELECTRIC CHERRY";
		return;
	}
	else if(str_perk == "specialty_fastreload")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2SPEED COLA";
		return;
	}
	else if(str_perk == "specialty_phdflopper")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2P.H.D. FLOPPER";
		return;
	}
	else if(str_perk == "specialty_quickrevive")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2QUICK REVIVE";
		return;
	}
	else if(str_perk == "specialty_staminup")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2STAMIN-UP";
		return;
	}
	else if(str_perk == "specialty_widowswine")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2WIDOWS WINE";
		return;
	}
	else if(str_perk == "specialty_tombstone")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2TOMBSTONE";
		return;
	}
	else if(str_perk == "specialty_vultureaid")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2VULTURES AID";
		return;
	}
	else if(str_perk == "specialty_whoswho")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2WHOS WHO";
		return;
	}
	else if(str_perk == "specialty_immunetriggerc4")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2DIVINE ALE";
		return;
	}
	self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got ^2" + str_perk;
}

/*
	Name: function_244e5cd8
	Namespace: namespace_9aaa7736
	Checksum: 0xBD91D6A8
	Offset: 0x1E40
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 696
*/
function function_244e5cd8()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self util::waittill_any("user_grabbed_weapon", "weapon_give");
		self waittill("weapon_change");
		curr_weap = self GetCurrentWeapon();
		wait(0.25);
		if(curr_weap == level.weaponReviveTool)
		{
			self waittill("weapon_change");
		}
		else
		{
			self.var_b15026f3 = MakeLocalizedString(curr_weap.displayName);
			self function_2c73e0d9(curr_weap);
			if(isdefined(self.var_a6c2dc79))
			{
				thread function_d9064d69(self.var_a6c2dc79);
			}
		}
	}
}

/*
	Name: function_2c73e0d9
	Namespace: namespace_9aaa7736
	Checksum: 0x70211AF4
	Offset: 0x1F40
	Size: 0x21A
	Parameters: 1
	Flags: None
	Line Number: 732
*/
function function_2c73e0d9(weap)
{
	if(weap.name == "ray_gun" || weap.name == "ray_gun_upgraded")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 Let's go! I got the ^2" + self.var_b15026f3;
		return;
	}
	if(weap.name == "bo3_mark2" || weap.name == "bo3_mark2_upgraded")
	{
		self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 Let's go!! ^2" + self.var_b15026f3;
		return;
	}
	var_580e60d7 = randomIntRange(1, 7);
	wait(0.1);
	switch(var_580e60d7)
	{
		case 1:
		{
			self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I got a ^2" + self.var_b15026f3;
			break;
		}
		case 2:
		{
			self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I grabbed a ^2" + self.var_b15026f3;
			break;
		}
		case 3:
		{
			self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I bought the ^2" + self.var_b15026f3;
			break;
		}
		case 4:
		{
			self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 I found a ^2" + self.var_b15026f3;
			break;
		}
		case 5:
		{
			self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 ^2" + self.var_b15026f3 + "^7 here";
			break;
		}
		case 6:
		{
			self.var_a6c2dc79 = self.var_1ad2f4ac + ":^7 ^2" + self.var_b15026f3 + "^7 over here";
			break;
		}
	}
}

