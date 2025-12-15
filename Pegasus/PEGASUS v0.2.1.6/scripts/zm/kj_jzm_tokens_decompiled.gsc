#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\kj_jzm_playerhud;
#include scripts\zm\zmsavedata;

#namespace namespace_6d708c3b;

/*
	Name: function_2932b50
	Namespace: namespace_6d708c3b
	Checksum: 0x38C53EBB
	Offset: 0x468
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 41
*/
function function_2932b50()
{
	self function_524e86e7();
	if(isdefined(self.var_e9d0cac4) && self.var_e9d0cac4 > 0)
	{
		var_a802d58a = self.var_e9d0cac4;
		return;
	}
	else
	{
	}
	self function_e41aa87d();
	self function_6e17227c();
	self function_29d84627();
	if(var_a802d58a != self.var_e9d0cac4)
	{
		self namespace_11e193f1::function_89cedfa0(16, self.var_e9d0cac4);
	}
}

/*
	Name: function_524e86e7
	Namespace: namespace_6d708c3b
	Checksum: 0x7FABAD2A
	Offset: 0x538
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function function_524e86e7()
{
	self.var_e9d0cac4 = self namespace_11e193f1::function_69424d4c(16);
	wait(0.2);
	self.var_b4286cb = self namespace_11e193f1::function_69424d4c(17);
	self thread function_4153b136();
	wait(0.1);
	if(isdefined(self.var_f642e0ea))
	{
		return;
	}
}

/*
	Name: function_4153b136
	Namespace: namespace_6d708c3b
	Checksum: 0xD9864D57
	Offset: 0x5C0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function function_4153b136()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("hash_214f0d50");
		if(isdefined(self.var_b4286cb))
		{
			self.var_b4286cb++;
			self IPrintLnBold("Token XP = ^3" + self.var_b4286cb + " ^7/ ^210");
			if(self.var_b4286cb >= 10)
			{
				self namespace_11e193f1::function_89cedfa0(17, 0);
				self.var_b4286cb = 0;
				self function_494e7020();
			}
			else
			{
				self namespace_11e193f1::function_89cedfa0(17, self.var_b4286cb);
			}
		}
	}
}

/*
	Name: function_494e7020
	Namespace: namespace_6d708c3b
	Checksum: 0xF0A8118
	Offset: 0x6A8
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 129
*/
function function_494e7020()
{
	if(!isdefined(self.var_e9d0cac4))
	{
		self.var_e9d0cac4 = 0;
	}
	if(isdefined(self.var_c2f86460) && GetPlayers().size > 1)
	{
		self function_8a7aea99();
	}
	else
	{
		self.var_e9d0cac4++;
		self namespace_11e193f1::function_89cedfa0(16, self.var_e9d0cac4);
		self function_6e72846a();
	}
	self IPrintLnBold("+1 Pegasus Token");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8a7aea99
	Namespace: namespace_6d708c3b
	Checksum: 0xD790ADA9
	Offset: 0x778
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 160
*/
function function_8a7aea99()
{
	players = GetPlayers();
	foreach(player in players)
	{
		if(!player IsTestClient())
		{
			if(isdefined(self.var_e9d0cac4))
			{
				self.var_e9d0cac4++;
				self namespace_11e193f1::function_89cedfa0(16, self.var_e9d0cac4);
				self function_6e72846a();
			}
		}
	}
}

/*
	Name: function_6e72846a
	Namespace: namespace_6d708c3b
	Checksum: 0x36FCF013
	Offset: 0x878
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 187
*/
function function_6e72846a()
{
	if(isdefined(self.var_f642e0ea))
	{
		return;
	}
	if(isdefined(self.var_e9d0cac4))
	{
		if(isdefined(self.var_bdddd23f) && self.var_bdddd23f)
		{
			while(self.var_bdddd23f)
			{
				wait(0.5);
			}
		}
		self playlocalsound("zmb_bgb_token");
		var_ed3587b4 = "JZMToken" + self.var_e9d0cac4;
		if(isdefined(var_ed3587b4))
		{
			self SetControllerUIModelValue("pegasus_player", var_ed3587b4);
		}
	}
}

/*
	Name: function_e41aa87d
	Namespace: namespace_6d708c3b
	Checksum: 0xAA2B7100
	Offset: 0x938
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 221
*/
function function_e41aa87d()
{
	start_points = self namespace_11e193f1::function_69424d4c(18);
	if(start_points == 0)
	{
		return;
	}
	else if(start_points == 1 && self.var_e9d0cac4 > 0)
	{
		self.var_e9d0cac4--;
		self zm_score::add_to_player_score(5000);
	}
	else if(start_points == 2 && self.var_e9d0cac4 > 1)
	{
		self.var_e9d0cac4 = self.var_e9d0cac4 - 2;
		self zm_score::add_to_player_score(10000);
	}
	else if(start_points == 3 && self.var_e9d0cac4 > 2)
	{
		self.var_e9d0cac4 = self.var_e9d0cac4 - 3;
		self zm_score::add_to_player_score(15000);
	}
	else if(start_points == 4 && self.var_e9d0cac4 > 3)
	{
		self.var_e9d0cac4 = self.var_e9d0cac4 - 4;
		self zm_score::add_to_player_score(20000);
	}
}

/*
	Name: function_6e17227c
	Namespace: namespace_6d708c3b
	Checksum: 0x3F4C4CD7
	Offset: 0xAB0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 260
*/
function function_6e17227c()
{
	health_regen = self namespace_11e193f1::function_69424d4c(19);
	if(health_regen == 0)
	{
		return;
	}
	if(self.var_e9d0cac4 > 0)
	{
		self.var_e9d0cac4--;
		self.var_7c8f1ce5 = 1;
		self.playerHealth_RegularRegenDelay = 1200;
		self.longRegenTime = 2500;
	}
}

/*
	Name: function_29d84627
	Namespace: namespace_6d708c3b
	Checksum: 0xA3AF5F38
	Offset: 0xB30
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 286
*/
function function_29d84627()
{
	var_287a50f0 = self namespace_11e193f1::function_69424d4c(20);
	if(var_287a50f0 == 0)
	{
		return;
	}
	else if(var_287a50f0 == 1)
	{
		self function_90e94a8e();
	}
	else if(var_287a50f0 == 2)
	{
		self function_fb79032e();
	}
	else if(var_287a50f0 == 3)
	{
		self function_adcbf8dd();
	}
	else if(var_287a50f0 == 4)
	{
		self function_aff0cb34();
	}
	else if(var_287a50f0 == 5)
	{
		self function_c7e8b440();
	}
	wait(0.05);
}

/*
	Name: function_90e94a8e
	Namespace: namespace_6d708c3b
	Checksum: 0xF5C6111C
	Offset: 0xC40
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 326
*/
function function_90e94a8e()
{
	if(self.var_e9d0cac4 > 1)
	{
		self.var_e9d0cac4 = self.var_e9d0cac4 - 2;
		self thread function_a258615b();
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_a258615b
	Namespace: namespace_6d708c3b
	Checksum: 0x8548CFBC
	Offset: 0xC88
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 347
*/
function function_a258615b()
{
	level endon("game_ended");
	self endon("disconnect");
	level waittill("end_of_round");
	level waittill("start_of_round");
	weap = self GetCurrentWeapon();
	self thread AAT::acquire(weap);
}

/*
	Name: function_fb79032e
	Namespace: namespace_6d708c3b
	Checksum: 0x9547449B
	Offset: 0xD08
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 367
*/
function function_fb79032e()
{
	if(self.var_e9d0cac4 > 1)
	{
		self.var_e9d0cac4 = self.var_e9d0cac4 - 2;
		self thread function_7b7997d1(3);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7b7997d1
	Namespace: namespace_6d708c3b
	Checksum: 0xEDBE759A
	Offset: 0xD58
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 388
*/
function function_7b7997d1(var_7543e3f5)
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		level waittill("between_round_over");
		if(level.round_number >= var_7543e3f5)
		{
			self thread function_ecc65746();
			self thread function_ed6607d9();
		}
	}
	else
	{
	}
}

/*
	Name: function_ecc65746
	Namespace: namespace_6d708c3b
	Checksum: 0x625A1CBE
	Offset: 0xDD8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 416
*/
function function_ecc65746()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("user_grabbed_weapon");
		self waittill("weapon_change");
		current_weapon = self GetCurrentWeapon();
		if(isdefined(self) && self validation(current_weapon))
		{
			self TakeWeapon(current_weapon);
			var_aabb4aee = zm_weapons::get_upgrade_weapon(current_weapon);
			self zm_weapons::weapon_give(var_aabb4aee, undefined, undefined, 1);
		}
	}
}

/*
	Name: validation
	Namespace: namespace_6d708c3b
	Checksum: 0x239DCE51
	Offset: 0xEC0
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 444
*/
function validation(weap)
{
	if(isdefined(self.zombie_vars["zombie_powerup_minigun_on"]) && self.zombie_vars["zombie_powerup_minigun_on"])
	{
		return 0;
	}
	if(!zm_utility::is_player_valid(self) || zm_equipment::is_equipment(weap))
	{
		return 0;
	}
	return zm_weapons::can_upgrade_weapon(weap);
	ERROR: Bad function call
}

/*
	Name: function_ed6607d9
	Namespace: namespace_6d708c3b
	Checksum: 0x85BB5445
	Offset: 0xF58
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 468
*/
function function_ed6607d9()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("weapon_give");
		self waittill("weapon_change");
		current_weapon = self GetCurrentWeapon();
		if(isdefined(self) && self validation(current_weapon))
		{
			self TakeWeapon(current_weapon);
			var_aabb4aee = zm_weapons::get_upgrade_weapon(current_weapon);
			self zm_weapons::weapon_give(var_aabb4aee, undefined, undefined, 1);
		}
	}
}

/*
	Name: function_adcbf8dd
	Namespace: namespace_6d708c3b
	Checksum: 0x7F849E23
	Offset: 0x1040
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 496
*/
function function_adcbf8dd()
{
	if(self.var_e9d0cac4 > 1)
	{
		self.var_e9d0cac4 = self.var_e9d0cac4 - 2;
		self.var_f16438a3 = 1;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_aff0cb34
	Namespace: namespace_6d708c3b
	Checksum: 0x5069E87C
	Offset: 0x1080
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 517
*/
function function_aff0cb34()
{
	if(self.var_e9d0cac4 > 1)
	{
		self.var_e9d0cac4 = self.var_e9d0cac4 - 2;
		self.var_c2f86460 = 1;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c7e8b440
	Namespace: namespace_6d708c3b
	Checksum: 0xEF786C7C
	Offset: 0x10C0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 538
*/
function function_c7e8b440()
{
	if(self.var_e9d0cac4 > 1)
	{
		self.var_e9d0cac4 = self.var_e9d0cac4 - 2;
		self thread function_c8a98f1c();
		return;
	}
}

/*
	Name: function_c8a98f1c
	Namespace: namespace_6d708c3b
	Checksum: 0x1B11E08C
	Offset: 0x1108
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 558
*/
function function_c8a98f1c()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("player_downed");
		self thread function_76ae81e9();
	}
}

/*
	Name: function_76ae81e9
	Namespace: namespace_6d708c3b
	Checksum: 0x7D414948
	Offset: 0x1150
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 579
*/
function function_76ae81e9()
{
	level endon("game_ended");
	self endon("disconnect");
	self endon("player_revived");
	origin = self.origin + VectorScale((0, 0, 1), 45);
	self IPrintLnBold("Tombskull origin: " + origin);
	self waittill("bled_out");
	wait(1);
	skull = spawn("script_model", origin);
	skull SetModel("p7_zm_power_up_insta_kill");
	skull.only_affects_grabber = 1;
	wait(0.5);
	skull thread zm_powerups::powerup_wobble_fx();
	self thread function_31b94d7a(skull);
	self thread function_beef3819(skull);
}

/*
	Name: function_beef3819
	Namespace: namespace_6d708c3b
	Checksum: 0xF570F403
	Offset: 0x1280
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 607
*/
function function_beef3819(skull)
{
	level endon("game_ended");
	self endon("disconnect");
	while(isdefined(skull))
	{
		if(isalive(self))
		{
			if(Distance2D(skull.origin, self.origin) < 55)
			{
				skull delete();
				break;
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_31b94d7a
	Namespace: namespace_6d708c3b
	Checksum: 0x160C0188
	Offset: 0x1328
	Size: 0x9C
	Parameters: 1
	Flags: None
	Line Number: 635
*/
function function_31b94d7a(skull)
{
	level endon("game_ended");
	var_4d9d8ba8 = level.round_number;
	level waittill("end_of_round");
	if(!isdefined(skull))
	{
		return;
	}
	if(var_4d9d8ba8 == level.round_number)
	{
		level waittill("end_of_round");
	}
	if(isdefined(skull))
	{
		self IPrintLnBold("Tombskull timed out");
		skull delete();
	}
}

