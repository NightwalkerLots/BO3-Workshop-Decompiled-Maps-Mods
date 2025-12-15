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
#include scripts\zm\kj_jzm_gamemodes;
#include scripts\zm\kj_jzm_waypoints;
#include scripts\zm\zmsavedata;

#namespace namespace_f8c4cfb7;

/*
	Name: function_4dc5673d
	Namespace: namespace_f8c4cfb7
	Checksum: 0x2062EE2
	Offset: 0x12C8
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function function_4dc5673d()
{
	var_b1bbae3e = self namespace_11e193f1::function_69424d4c(29);
	if(var_b1bbae3e == 0)
	{
		return;
	}
	else if(var_b1bbae3e == 1)
	{
		self thread function_ba298029();
	}
	else if(var_b1bbae3e == 2)
	{
		self thread function_e02bfa92();
	}
	else if(var_b1bbae3e == 3)
	{
		self thread function_62e74fb();
	}
	else if(var_b1bbae3e == 4)
	{
		self thread function_2c30ef64();
	}
	else if(var_b1bbae3e == 5)
	{
		self thread function_4be2147f();
	}
	wait(0.15);
	self IPrintLnBold(self.var_1ad2f4ac + ": ^7Backpack is ready");
}

/*
	Name: function_ba298029
	Namespace: namespace_f8c4cfb7
	Checksum: 0x665A5424
	Offset: 0x1400
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function function_ba298029()
{
	level endon("game_ended");
	self endon("disconnect");
	while(self ActionSlotOneButtonPressed() && !self useButtonPressed())
	{
		self AllowJump(0);
		self playlocalsound("mpl_plr_emp_deactivate");
		self SetControllerUIModelValue("pegasus_player", "JZMCommandsopenpage1");
		wait(0.1);
		self.var_b257fb52 = 1;
		self function_3c5b5058();
		self AllowJump(1);
		self.var_b257fb52 = 0;
		wait(0.05);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e02bfa92
	Namespace: namespace_f8c4cfb7
	Checksum: 0xDF6AAB78
	Offset: 0x1508
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 122
*/
function function_e02bfa92()
{
	level endon("game_ended");
	self endon("disconnect");
	while(self ActionSlotTwoButtonPressed() && !self useButtonPressed())
	{
		self AllowJump(0);
		self playlocalsound("mpl_plr_emp_deactivate");
		self SetControllerUIModelValue("pegasus_player", "JZMCommandsopenpage1");
		wait(0.1);
		self.var_b257fb52 = 1;
		self function_3c5b5058();
		self AllowJump(1);
		self.var_b257fb52 = 0;
		wait(0.05);
	}
}

/*
	Name: function_62e74fb
	Namespace: namespace_f8c4cfb7
	Checksum: 0x450CA318
	Offset: 0x1610
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 150
*/
function function_62e74fb()
{
	level endon("game_ended");
	self endon("disconnect");
	while(self ActionSlotFourButtonPressed() && !self useButtonPressed())
	{
		self AllowJump(0);
		self playlocalsound("mpl_plr_emp_deactivate");
		self SetControllerUIModelValue("pegasus_player", "JZMCommandsopenpage1");
		wait(0.1);
		self.var_b257fb52 = 1;
		self function_3c5b5058();
		self AllowJump(1);
		self.var_b257fb52 = 0;
		wait(0.05);
	}
}

/*
	Name: function_2c30ef64
	Namespace: namespace_f8c4cfb7
	Checksum: 0xC6EFBD4D
	Offset: 0x1718
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 178
*/
function function_2c30ef64()
{
	level endon("game_ended");
	self endon("disconnect");
	while(self ActionSlotThreeButtonPressed() && !self useButtonPressed())
	{
		self AllowJump(0);
		self playlocalsound("mpl_plr_emp_deactivate");
		self SetControllerUIModelValue("pegasus_player", "JZMCommandsopenpage1");
		wait(0.1);
		self.var_b257fb52 = 1;
		self function_3c5b5058();
		self AllowJump(1);
		self.var_b257fb52 = 0;
		wait(0.05);
	}
}

/*
	Name: function_4be2147f
	Namespace: namespace_f8c4cfb7
	Checksum: 0x965EAC43
	Offset: 0x1820
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 206
*/
function function_4be2147f()
{
	level endon("game_ended");
	self endon("disconnect");
	while(self AdsButtonPressed() && self meleeButtonPressed())
	{
		self AllowJump(0);
		self playlocalsound("mpl_plr_emp_deactivate");
		self SetControllerUIModelValue("pegasus_player", "JZMCommandsopenpage1");
		self.var_b257fb52 = 1;
		wait(0.4);
		self function_3c5b5058();
		self AllowJump(1);
		self.var_b257fb52 = 0;
		wait(0.05);
	}
}

/*
	Name: function_3c5b5058
	Namespace: namespace_f8c4cfb7
	Checksum: 0x2F2B6305
	Offset: 0x1928
	Size: 0x790
	Parameters: 0
	Flags: None
	Line Number: 234
*/
function function_3c5b5058()
{
	level endon("game_ended");
	self endon("disconnect");
	while(self meleeButtonPressed())
	{
		self SetControllerUIModelValue("pegasus_player", "JZMCommandsclose");
		self playlocalsound("uin_alert_lockon_start");
		wait(0.1);
		break;
		continue;
		if(self ActionSlotOneButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate1");
			var_cf48e4ec = zombie_utility::get_current_zombie_count() + level.zombie_total;
			if(var_cf48e4ec == 1)
			{
				self thread function_e41bd9c7();
			}
			else
			{
				self thread function_ddf957eb();
			}
			wait(0.1);
			break;
		}
		else if(self ActionSlotTwoButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate2");
			wait(0.1);
			if(level.round_number - level.var_946e6fa7 >= 20)
			{
				self thread namespace_afd88775::function_716bfa70();
			}
			else
			{
				IPrintLnBold(self.var_1ad2f4ac + ": ^7You must survive a total of 20 rounds before exfil is unlocked");
				break;
			}
		}
		else if(self ActionSlotFourButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate3");
			wait(0.1);
			self function_2bce8b80();
			break;
		}
		else if(self ActionSlotThreeButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate4");
			if(!isdefined(self.var_3d231107))
			{
				self.var_3d231107 = gameobjects::get_next_obj_id();
			}
			wait(0.1);
			self playlocalsound("fly_argus_ping");
			self namespace_bc075b67::function_d03146db();
			break;
		}
		else if(self useButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate5");
			self function_1cfab065();
			wait(0.1);
			break;
		}
		else if(self WeaponSwitchButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate6");
			if(!isdefined(self.var_c77b20b7))
			{
				self.var_c77b20b7 = gameobjects::get_next_obj_id();
			}
			wait(0.1);
			self function_d4aa14a1();
			break;
		}
		else if(self JumpButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate7");
			wait(0.1);
			self thread function_496580e9();
			break;
		}
		else if(self StanceButtonPressed())
		{
			self playlocalsound("zmb_player_disapparate");
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate8");
			self function_33072f44();
			self playlocalsound("zmb_player_disapparate");
			wait(0.1);
			break;
		}
		else if(self AdsButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsopenpage2");
			self playlocalsound("mpl_plr_emp_deactivate");
			wait(0.5);
			self function_311af814();
			break;
		}
		else if(self SecondaryOffhandButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsclose");
			self playlocalsound("mpl_plr_emp_deactivate");
			wait(0.55);
			if(isdefined(self.var_a1e304db) && !self.var_a1e304db)
			{
				self.var_a1e304db = 1;
				self SetControllerUIModelValue("pegasus_player", "JZMHudSlide");
				if(isdefined(self.var_a73bce6b))
				{
					self.var_a73bce6b.alpha = 0;
				}
				if(isdefined(self.var_7e6b6d74))
				{
					self.var_7e6b6d74.alpha = 0;
				}
			}
			else if(isdefined(self.var_a1e304db) && self.var_a1e304db)
			{
				self.var_a1e304db = 0;
				self SetControllerUIModelValue("pegasus_player", "JZMHud");
				if(isdefined(self.var_a73bce6b))
				{
					self.var_a73bce6b.alpha = 1;
				}
				if(isdefined(self.var_7e6b6d74))
				{
					self.var_7e6b6d74.alpha = 1;
				}
			}
			else if(!isdefined(self.var_a1e304db))
			{
				self.var_a1e304db = 1;
				self SetControllerUIModelValue("pegasus_player", "JZMHudSlide");
				if(isdefined(self.var_a73bce6b))
				{
					self.var_a73bce6b.alpha = 0;
				}
				if(isdefined(self.var_7e6b6d74))
				{
					self.var_7e6b6d74.alpha = 0;
					break;
				}
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_311af814
	Namespace: namespace_f8c4cfb7
	Checksum: 0x1FF84D33
	Offset: 0x20C0
	Size: 0x438
	Parameters: 0
	Flags: None
	Line Number: 395
*/
function function_311af814()
{
	level endon("game_ended");
	self endon("disconnect");
	while(self meleeButtonPressed())
	{
		self SetControllerUIModelValue("pegasus_player", "JZMCommandsclose");
		self playlocalsound("uin_alert_lockon_start");
		wait(0.1);
		break;
		continue;
		if(self ActionSlotOneButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate1");
			wait(0.1);
			self function_cfd5628d();
			break;
		}
		else if(self ActionSlotTwoButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate2");
			wait(0.1);
			self namespace_afd88775::function_44298ab9();
			break;
		}
		else if(self ActionSlotFourButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate3");
			wait(0.1);
			self function_97566059();
			break;
		}
		else if(self ActionSlotThreeButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate4");
			wait(0.1);
			self function_fc8f20ee();
			break;
		}
		else if(self useButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate5");
			wait(0.1);
			self function_2470cec7();
			break;
		}
		else if(self WeaponSwitchButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate6");
			wait(0.1);
			self function_4a8a2452();
			break;
		}
		else if(self JumpButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate7");
			wait(0.1);
			self function_ba63e67e();
			break;
		}
		else if(self StanceButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsactivate8");
			wait(0.1);
			self function_88cf1842();
			break;
		}
		else if(self AdsButtonPressed())
		{
			self SetControllerUIModelValue("pegasus_player", "JZMCommandsclose");
			wait(0.1);
			self function_c3dc2891();
			break;
		}
		wait(0.05);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2470cec7
	Namespace: namespace_f8c4cfb7
	Checksum: 0x47DDE94F
	Offset: 0x2500
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 485
*/
function function_2470cec7()
{
	if(isdefined(self.var_17170311) && !self.var_17170311)
	{
		self.var_17170311 = 1;
		self SetClientThirdPerson(1);
	}
	else if(isdefined(self.var_17170311) && self.var_17170311)
	{
		self.var_17170311 = 0;
		self SetClientThirdPerson(0);
	}
	else if(!isdefined(self.var_17170311))
	{
		self.var_17170311 = 1;
		self SetClientThirdPerson(1);
		return;
	}
}

/*
	Name: function_91b2366a
	Namespace: namespace_f8c4cfb7
	Checksum: 0x5400A118
	Offset: 0x25C0
	Size: 0x2A0
	Parameters: 0
	Flags: None
	Line Number: 515
*/
function function_91b2366a()
{
	if(IsInArray(Array("none", "zombie_bgb_grab", "zombie_bgb_use", "minigun", "microwavegun", "microwavegun_upgraded", "microwavegundw", "microwavegundw_upgraded", "microwavegunlh", "microwavegunlh_upgraded", "staff_revive", "staff_water", "staff_water_upgraded", "staff_water_upgraded2", "staff_water_upgraded3", "staff_bolt", "staff_bolt_upgraded", "staff_bolt_upgraded2", "staff_bolt_upgraded3", "staff_fire", "staff_fire_upgraded", "staff_fire_upgraded2", "staff_fire_upgraded3", "staff_air", "staff_air_upgraded", "staff_air_upgraded2", "staff_air_upgraded3"), self.var_9ef95201) || IsInArray(Array("ray_gun", "ray_gun_upgraded", "thundergun", "thundergun_upgraded", "cosmodrome_thundergun", "cosmodrome_thundergun_upgraded", "genesis_thundergun", "genesis_thundergun_upgraded", "theater_thundergun", "theater_thundergun_upgraded", "tesla_gun", "tesla_gun_upgraded", "asylum_tesla_gun", "asylum_tesla_gun_upgraded", "factory_tesla_gun", "factory_tesla_gun_upgraded", "sumpf_tesla_gun", "sumpf_tesla_gun_upgraded", "raygun_mark2", "raygun_mark2_upgraded", "asylum_raygun_mark2", "asylum_raygun_mark2_upgraded", "cosmodrome_raygun_mark2", "cosmodrome_raygun_mark2_upgraded", "moon_raygun_mark2", "moon_raygun_mark2_upgraded", "theater_raygun_mark2", "theater_raygun_mark2_upgraded", "hero_mirg2000", "hero_mirg2000_upgraded", "raygun_mark3", "raygun_mark3_upgraded", "idgun_0", "idgun_1", "idgun_2", "idgun_3", "idgun_genesis_0", "idgun_genesis_0_upgraded", "shrink_ray", "shrink_ray_upgraded"), self.var_9ef95201))
	{
		self IPrintLnBold("Weapon Boost Invalid");
		return 1;
	}
	else
	{
		return 0;
	}
}

/*
	Name: function_c3dc2891
	Namespace: namespace_f8c4cfb7
	Checksum: 0x1C8EA59E
	Offset: 0x2868
	Size: 0x460
	Parameters: 0
	Flags: None
	Line Number: 538
*/
function function_c3dc2891()
{
	var_fc8af13 = self getcurrentweaponaltweapon();
	if(isdefined(var_fc8af13))
	{
		if(var_fc8af13.name != "none")
		{
			return;
		}
	}
	weapon = self GetCurrentWeapon();
	wait(0.05);
	weapon_name = weapon.name;
	if(isdefined(weapon))
	{
		if(IsInArray(Array("none", "zombie_bgb_grab", "zombie_bgb_use", "minigun", "microwavegun", "microwavegun_upgraded", "microwavegundw", "microwavegundw_upgraded", "microwavegunlh", "microwavegunlh_upgraded", "staff_revive", "staff_water", "staff_water_upgraded", "staff_water_upgraded2", "staff_water_upgraded3", "staff_bolt", "staff_bolt_upgraded", "staff_bolt_upgraded2", "staff_bolt_upgraded3", "staff_fire", "staff_fire_upgraded", "staff_fire_upgraded2", "staff_fire_upgraded3", "staff_air", "staff_air_upgraded", "staff_air_upgraded2", "staff_air_upgraded3"), weapon_name))
		{
			self IPrintLnBold("Apply Camo Invalid: ^1Weapon");
			return;
		}
		else if(IsInArray(Array("ray_gun", "ray_gun_upgraded", "thundergun", "thundergun_upgraded", "cosmodrome_thundergun", "cosmodrome_thundergun_upgraded", "genesis_thundergun", "genesis_thundergun_upgraded", "theater_thundergun", "theater_thundergun_upgraded", "tesla_gun", "tesla_gun_upgraded", "asylum_tesla_gun", "asylum_tesla_gun_upgraded", "factory_tesla_gun", "factory_tesla_gun_upgraded", "sumpf_tesla_gun", "sumpf_tesla_gun_upgraded", "raygun_mark2", "raygun_mark2_upgraded", "asylum_raygun_mark2", "asylum_raygun_mark2_upgraded", "cosmodrome_raygun_mark2", "cosmodrome_raygun_mark2_upgraded", "moon_raygun_mark2", "moon_raygun_mark2_upgraded", "theater_raygun_mark2", "theater_raygun_mark2_upgraded", "hero_mirg2000", "hero_mirg2000_upgraded", "raygun_mark3", "raygun_mark3_upgraded", "idgun_0", "idgun_1", "idgun_2", "idgun_3", "idgun_genesis_0", "idgun_genesis_0_upgraded", "shrink_ray", "shrink_ray_upgraded"), weapon_name))
		{
			self IPrintLnBold("Apply Camo Invalid: ^1Weapon");
			return;
		}
		else if(zm_utility::is_hero_weapon(weapon) || zm_equipment::is_equipment(weapon))
		{
			self IPrintLnBold("Apply Camo Invalid: ^1Hero Weapon Or Equipment");
			return;
		}
		else if(WeaponHasAttachment(weapon, "gl"))
		{
			self IPrintLnBold("Apply Camo Invalid: ^1Weapon Attachment Grenade Launcher");
			return;
		}
		else if(isdefined(self.var_709323d5))
		{
			self function_c8540b60(weapon, self CalcWeaponOptions(self.var_709323d5, 0, 0));
			IPrintLnBold(self.var_1ad2f4ac + ": ^5Applied Camo");
		}
	}
}

/*
	Name: function_ba63e67e
	Namespace: namespace_f8c4cfb7
	Checksum: 0xFDD83A2D
	Offset: 0x2CD0
	Size: 0x258
	Parameters: 0
	Flags: None
	Line Number: 591
*/
function function_ba63e67e()
{
	var_c5baf4bc = self.characterindex + 1;
	rank = self.var_1c43abc3;
	prestige = self.var_9d6730be;
	if(isdefined(var_c5baf4bc))
	{
		if(var_c5baf4bc < 0 || var_c5baf4bc > 8)
		{
			self.characterindex = 0;
			var_c5baf4bc = 0;
		}
		if(var_c5baf4bc < 4)
		{
			self.characterindex = var_c5baf4bc;
			self setcharacterbodytype(var_c5baf4bc);
		}
		if(var_c5baf4bc == 5)
		{
			if(rank >= 70 || prestige >= 5)
			{
				self.characterindex = var_c5baf4bc;
				self setcharacterbodytype(var_c5baf4bc);
			}
		}
		else if(var_c5baf4bc == 6)
		{
			if(rank >= 240 || prestige >= 5)
			{
				self.characterindex = var_c5baf4bc;
				self setcharacterbodytype(var_c5baf4bc);
			}
		}
		else if(var_c5baf4bc == 7)
		{
			if(rank >= 400 || prestige >= 5)
			{
				self.characterindex = var_c5baf4bc;
				self setcharacterbodytype(var_c5baf4bc);
			}
		}
		else if(var_c5baf4bc == 8)
		{
			if(rank >= 680 || prestige >= 5)
			{
				self.characterindex = var_c5baf4bc;
				self setcharacterbodytype(var_c5baf4bc);
			}
		}
		else if(var_c5baf4bc == 4 && prestige >= 5)
		{
			self.characterindex = var_c5baf4bc;
			self setcharacterbodytype(var_c5baf4bc);
		}
	}
}

/*
	Name: function_cfd5628d
	Namespace: namespace_f8c4cfb7
	Checksum: 0x73111DB8
	Offset: 0x2F30
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 658
*/
function function_cfd5628d()
{
	if(isdefined(self.var_9d6730be) && self.var_9d6730be < 1)
	{
		self IPrintLnBold("^5COSMETIC: ^2ALIEN HEAD ^7- Unlocked at Prestige 1");
		return;
	}
	wait(0.35);
	if(isdefined(self.var_858a1a67) && !self.var_858a1a67)
	{
		self IPrintLnBold("Reattach Cosmetic: Alien Head");
		self.var_858a1a67 = 1;
		wait(1);
		self thread function_ea126733();
	}
	else if(isdefined(self.var_858a1a67) && self.var_858a1a67)
	{
		self IPrintLnBold("Detach Cosmetic: Alien Head");
		self.var_858a1a67 = 0;
		wait(1);
		self notify("hash_a221024a");
	}
	else if(!isdefined(self.var_858a1a67))
	{
		self IPrintLnBold("Attach Cosmetic: Alien Head");
		self.var_858a1a67 = 1;
		wait(1);
		self thread function_ea126733();
	}
}

/*
	Name: function_ea126733
	Namespace: namespace_f8c4cfb7
	Checksum: 0xD0D1F881
	Offset: 0x3090
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 699
*/
function function_ea126733()
{
	self endon("hash_a221024a");
	level endon("game_ended");
	self endon("disconnect");
	self IPrintLnBold("^5COSMETIC: ^2Alien Head ^7- Track raygun refills");
	for(;;)
	{
		wait(5);
		primaryWeapons = self getweaponslistprimaries();
		foreach(weapon in primaryWeapons)
		{
			if(weapon.name == "ray_gun" || weapon.name == "ray_gun_upgraded")
			{
				weap = GetWeapon(weapon.name);
				self SetWeaponAmmoClip(weapon, weap.clipSize);
				self SetWeaponAmmoStock(weapon, weap.maxAmmo);
			}
		}
		level waittill("start_of_round");
		level waittill("start_of_round");
	}
}

/*
	Name: function_fc8f20ee
	Namespace: namespace_f8c4cfb7
	Checksum: 0x9BF02CC8
	Offset: 0x3238
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 733
*/
function function_fc8f20ee()
{
	if(isdefined(self.var_9d6730be) && self.var_9d6730be < 9)
	{
		self IPrintLnBold("^5COSMETIC: ^2SODA HAT ^7- Unlocked at Prestige 9");
		return;
	}
	wait(0.35);
	if(isdefined(self.var_83c10bfc) && !self.var_83c10bfc)
	{
		self.var_83c10bfc = 1;
		self thread function_6a727b3e();
		self IPrintLnBold("^5COSMETIC: ^2SODA HAT ^7- ATTACHED");
	}
	else if(isdefined(self.var_83c10bfc) && self.var_83c10bfc)
	{
		self notify("hash_72987bdd");
		self.var_83c10bfc = 0;
		self IPrintLnBold("^5COSMETIC: ^2SODA HAT ^7- DETACH");
	}
	else if(!isdefined(self.var_83c10bfc))
	{
		self.var_83c10bfc = 1;
		self thread function_6a727b3e();
		self IPrintLnBold("^5COSMETIC: ^2SODA HAT ^7- ATTACHED");
	}
}

/*
	Name: function_6a727b3e
	Namespace: namespace_f8c4cfb7
	Checksum: 0xD4DD9552
	Offset: 0x3388
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 771
*/
function function_6a727b3e()
{
	self endon("hash_72987bdd");
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		level waittill("end_of_round");
		level waittill("end_of_round");
		level waittill("end_of_round");
		self zm_perks::give_random_perk();
		self IPrintLnBold("^5COSMETIC: ^2SODA HAT ^7- FREE PERK");
	}
}

/*
	Name: function_88cf1842
	Namespace: namespace_f8c4cfb7
	Checksum: 0xE901B4D0
	Offset: 0x3418
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 796
*/
function function_88cf1842()
{
	if(isdefined(self.var_9d6730be) && self.var_9d6730be < 6)
	{
		self IPrintLnBold("^5COSMETIC: ^2ROSHI'S TURTLE SHELL ^7- Unlocked at Prestige 6");
		return;
	}
	wait(0.35);
	if(isdefined(self.var_45045ecc) && !self.var_45045ecc)
	{
		self.var_45045ecc = 1;
		self IPrintLnBold("^5COSMETIC: ^2ROSHI'S TURTLE SHELL ^7- ATTACHED");
	}
	else if(isdefined(self.var_45045ecc) && self.var_45045ecc)
	{
		self.var_45045ecc = 0;
		self IPrintLnBold("^5COSMETIC: ^2ROSHI'S TURTLE SHELL ^7- DETACHED");
	}
	else if(!isdefined(self.var_45045ecc))
	{
		self.var_45045ecc = 1;
		self IPrintLnBold("^5COSMETIC: ^2ROSHI'S TURTLE SHELL ^7- ATTACHED");
	}
}

/*
	Name: function_97566059
	Namespace: namespace_f8c4cfb7
	Checksum: 0x29FD95D
	Offset: 0x3528
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 831
*/
function function_97566059()
{
	if(isdefined(self.var_9d6730be) && self.var_9d6730be < 4)
	{
		self IPrintLnBold("^5COSMETIC: ^2PEGASUS WINGS ^7- Unlocked at Prestige 4");
		return;
	}
	wait(0.35);
	if(isdefined(self.var_8b621e0f) && !self.var_8b621e0f)
	{
		self.var_8b621e0f = 1;
		self setPerk("specialty_movefaster");
		self IPrintLnBold("^5COSMETIC: ^2PEGASUS WINGS ^7- ATTACHED");
	}
	else if(isdefined(self.var_8b621e0f) && self.var_8b621e0f)
	{
		self.var_8b621e0f = 0;
		self unsetPerk("specialty_movefaster");
		self IPrintLnBold("^5COSMETIC: ^2PEGASUS WINGS ^7- DETACHED");
	}
	else if(!isdefined(self.var_8b621e0f))
	{
		self.var_8b621e0f = 1;
		self setPerk("specialty_movefaster");
		self IPrintLnBold("^5COSMETIC: ^2PEGASUS WINGS ^7- ATTACHED");
	}
}

/*
	Name: function_a765abbb
	Namespace: namespace_f8c4cfb7
	Checksum: 0x9F4A78F5
	Offset: 0x3698
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 869
*/
function function_a765abbb()
{
	if(isdefined(self.var_2c04a93f) && self.var_2c04a93f)
	{
		self.var_2c04a93f = 0;
		self Detach("pegasus_backpack", "tag_stowed_back");
	}
	else if(isdefined(self.var_8b621e0f) && self.var_8b621e0f)
	{
		self.var_8b621e0f = 0;
	}
	else if(isdefined(self.var_45045ecc) && self.var_45045ecc)
	{
		self.var_45045ecc = 0;
	}
	wait(1);
}

/*
	Name: function_4a8a2452
	Namespace: namespace_f8c4cfb7
	Checksum: 0x83A70CDA
	Offset: 0x3740
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 897
*/
function function_4a8a2452()
{
	if(isdefined(self.var_9d6730be) && self.var_9d6730be < 3)
	{
		self IPrintLnBold("^5COSMETIC: ^2HEALING CIRCLE ^7- Unlocked at Prestige 3");
		return;
	}
	wait(0.35);
	if(!isdefined(self.var_eadeedc4))
	{
		self function_5eb74eb4();
		self IPrintLnBold("^5COSMETIC: ^2HEALING CIRCLE ^7- ATTACHED");
	}
	else if(isdefined(self.var_eadeedc4))
	{
		self function_fd945c4f();
		self IPrintLnBold("^5COSMETIC: ^2HEALING CIRCLE ^7- DETACHED");
	}
}

/*
	Name: function_5eb74eb4
	Namespace: namespace_f8c4cfb7
	Checksum: 0xC39C1A2D
	Offset: 0x3820
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 927
*/
function function_5eb74eb4()
{
	self.var_eadeedc4 = spawn("script_model", self.origin);
	self.var_eadeedc4 SetModel("tag_origin");
	self.var_eadeedc4 LinkTo(self);
	wait(0.05);
	self.playerHealth_RegularRegenDelay = 1200;
	self.longRegenTime = 2500;
	self.var_ab096b62 = 2;
	self.n_bleedout_time_multiplier = 2;
	self thread function_83438928();
}

/*
	Name: function_fd945c4f
	Namespace: namespace_f8c4cfb7
	Checksum: 0x4FCC2D8
	Offset: 0x38E0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 950
*/
function function_fd945c4f()
{
	self.var_eadeedc4 delete();
	if(!isdefined(self.var_7c8f1ce5))
	{
		self.playerHealth_RegularRegenDelay = 2400;
		self.longRegenTime = 5000;
	}
	wait(0.25);
	if(isdefined(self.var_a73bce6b))
	{
		self.var_a73bce6b setValue(self.health);
	}
	self.var_ab096b62 = 3;
	self.n_bleedout_time_multiplier = 1;
	wait(0.1);
	self notify("hash_6b35f63d");
}

/*
	Name: function_83438928
	Namespace: namespace_f8c4cfb7
	Checksum: 0x723E4FF9
	Offset: 0x3990
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 979
*/
function function_83438928()
{
	self endon("hash_6b35f63d");
	level endon("game_ended");
	self endon("disconnect");
	if(!isdefined(self.var_15511cdf))
	{
		self.var_15511cdf = 0;
	}
	if(!isdefined(self.var_23ad7901))
	{
		self.var_23ad7901 = 0;
	}
	for(;;)
	{
		level waittill("end_of_round");
		wait(2.2);
		if(isdefined(self.var_15511cdf))
		{
			self.var_15511cdf = self.var_15511cdf + 2;
			self.var_23ad7901 = self.var_23ad7901 + 2;
			self.n_player_health_boost = self.var_15511cdf;
			self zm_perks::perk_set_max_health_if_jugg("health_reboot", 0, 1);
			wait(0.25);
			if(isdefined(self.var_a73bce6b))
			{
				self.var_a73bce6b setValue(self.health);
			}
		}
	}
}

/*
	Name: function_e41bd9c7
	Namespace: namespace_f8c4cfb7
	Checksum: 0x28D30DD
	Offset: 0x3AA8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1021
*/
function function_e41bd9c7()
{
	self thread function_c2cd6e8e();
	zombies = GetAISpeciesArray("axis");
	for(K = 0; K < zombies.size; K++)
	{
		zombies[K].missingLegs = 1;
		break;
	}
}

/*
	Name: function_c2cd6e8e
	Namespace: namespace_f8c4cfb7
	Checksum: 0x99D8E2BD
	Offset: 0x3B38
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1042
*/
function function_c2cd6e8e()
{
	self.var_a8a43865 = 0;
	level waittill("start_of_round");
	self.var_a8a43865 = 1;
}

/*
	Name: function_ddf957eb
	Namespace: namespace_f8c4cfb7
	Checksum: 0x2FC83A62
	Offset: 0x3B68
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1059
*/
function function_ddf957eb()
{
	if(isdefined(self.var_a56a9550))
	{
		if(isdefined(self.var_49a07362) && self.var_49a07362)
		{
			self.var_49a07362 = 0;
			self SetControllerUIModelValue("pegasus_player_progress", "JZMBardivine0");
			self [[self.var_a56a9550]]();
			level waittill("start_of_round");
			wait(8);
			self.var_49a07362 = 1;
			self SetControllerUIModelValue("pegasus_player_progress", "JZMBardivine1");
		}
	}
}

/*
	Name: function_2bce8b80
	Namespace: namespace_f8c4cfb7
	Checksum: 0x33500B6D
	Offset: 0x3C20
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1086
*/
function function_2bce8b80()
{
	level endon("game_ended");
	if(self.score < 1000)
	{
		self IPrintLnBold("^1Insufficient Points");
		return;
	}
	var_a638c0c2 = GetClosestPointOnNavMesh(self.origin + VectorScale((0, 0, 1), 60) + AnglesToForward(self getPlayerAngles()) * 110, 100, 15);
	wait(0.05);
	if(isdefined(var_a638c0c2))
	{
		self playlocalsound("zmb_cha_ching");
		self thread function_e7439feb(var_a638c0c2);
	}
}

/*
	Name: function_e7439feb
	Namespace: namespace_f8c4cfb7
	Checksum: 0x35A47CD8
	Offset: 0x3D18
	Size: 0x150
	Parameters: 1
	Flags: None
	Line Number: 1113
*/
function function_e7439feb(var_a638c0c2)
{
	var_d8d1d8be = spawn("script_model", var_a638c0c2 + VectorScale((0, 0, 1), 40));
	var_d8d1d8be SetModel("tag_origin");
	var_d8d1d8be.var_4cd06ff7 = 1;
	var_d8d1d8be.only_affects_grabber = 1;
	if(isdefined(self))
	{
		playsoundatposition("zmb_spawn_powerup", self.origin);
		self zm_score::minus_to_player_score(1000);
		wait(0.1);
		if(isdefined(var_d8d1d8be))
		{
			var_d8d1d8be PlayLoopSound("zmb_spawn_powerup_loop");
			wait(0.1);
			thread function_9680558a(var_d8d1d8be);
			var_d8d1d8be thread zm_powerups::powerup_wobble();
			var_d8d1d8be thread zm_powerups::powerup_timeout();
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_9680558a
	Namespace: namespace_f8c4cfb7
	Checksum: 0xFD6053A
	Offset: 0x3E70
	Size: 0x198
	Parameters: 1
	Flags: None
	Line Number: 1147
*/
function function_9680558a(var_d8d1d8be)
{
	level endon("game_ended");
	var_d8d1d8be endon("powerup_timedout");
	wait(1.5);
	var_d8d1d8be SetModel("zombie_z_money_icon");
	players = GetPlayers();
	while(isdefined(var_d8d1d8be))
	{
		foreach(player in players)
		{
			if(Distance2D(player.origin, var_d8d1d8be.origin) < 50)
			{
				playsoundatposition("zmb_powerup_grabbed", player.origin);
				player zm_score::add_to_player_score(1000);
				var_d8d1d8be notify("powerup_grabbed");
				wait(0.05);
				var_d8d1d8be delete();
				break;
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_1cfab065
	Namespace: namespace_f8c4cfb7
	Checksum: 0xEF00B677
	Offset: 0x4010
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 1182
*/
function function_1cfab065()
{
	if(isdefined(self))
	{
		self SetControllerUIModelValue("pegasus_player_progress", "JZMSyrette");
		self PlayLoopSound("evt_laststand_loop");
		currentWeapon = self GetCurrentWeapon();
		clip_ammo = self GetWeaponAmmoClip(currentWeapon);
		stock_ammo = self GetWeaponAmmoStock(currentWeapon);
		if(isdefined(level.weaponReviveTool))
		{
			self zm_weapons::weapon_give(level.weaponReviveTool, 0, 0, 1, 0);
			self SwitchToWeapon(level.weaponReviveTool);
		}
		self AllowMelee(0);
		self disableOffhandWeapons();
		self DisableWeaponCycling();
		self disableUsability();
		wait(1.5);
		self.health = self.maxhealth;
		self AllowMelee(1);
		self EnableOffhandWeapons();
		self EnableWeaponCycling();
		self enableUsability();
		self StopLoopSound();
		self playlocalsound("chr_health_laststand_exit");
		self function_35d2a0ab(currentWeapon, clip_ammo, stock_ammo);
		self SetControllerUIModelValue("pegasus_player_progress", "JZMInstahealed");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_35d2a0ab
	Namespace: namespace_f8c4cfb7
	Checksum: 0x3FBBC4A0
	Offset: 0x4290
	Size: 0xF8
	Parameters: 3
	Flags: None
	Line Number: 1225
*/
function function_35d2a0ab(currentWeapon, clip_ammo, stock_ammo)
{
	var_bb876152 = self GetCurrentWeapon();
	if(currentWeapon.name != "minigun")
	{
		self TakeWeapon(var_bb876152);
		self zm_weapons::weapon_give(currentWeapon, undefined, undefined, 1);
		self SetWeaponAmmoClip(currentWeapon, clip_ammo);
		self SetWeaponAmmoStock(currentWeapon, stock_ammo);
	}
	else
	{
		self TakeWeapon(var_bb876152);
	}
}

/*
	Name: function_d4aa14a1
	Namespace: namespace_f8c4cfb7
	Checksum: 0x199F7A86
	Offset: 0x4390
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1251
*/
function function_d4aa14a1()
{
	if(isdefined(self))
	{
		weapon = self GetCurrentWeapon();
		if(isdefined(weapon))
		{
			if(weapon.name != "knife" && weapon.name != "bowie_knife" && weapon.name != "minigun")
			{
				item = self dropitem(weapon);
				self function_98595582(item, weapon);
				return;
			}
		}
	}
}

/*
	Name: function_98595582
	Namespace: namespace_f8c4cfb7
	Checksum: 0x63BFF866
	Offset: 0x4468
	Size: 0xF8
	Parameters: 2
	Flags: None
	Line Number: 1278
*/
function function_98595582(item, weapon)
{
	level endon("game_ended");
	if(isdefined(self.var_dde1833d))
	{
		self.var_dde1833d delete();
		objective_delete(self.var_c77b20b7);
	}
	wait(0.5);
	self.var_dde1833d = spawn("script_model", item.origin + VectorScale((0, 0, -1), 50));
	self.var_dde1833d SetModel("tag_origin");
	self namespace_bc075b67::function_a7dde5ed(weapon);
	self thread WatchPickup(item);
}

/*
	Name: WatchPickup
	Namespace: namespace_f8c4cfb7
	Checksum: 0x138F45A5
	Offset: 0x4568
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1303
*/
function WatchPickup(item)
{
	level endon("game_ended");
	item waittill("trigger", player);
	if(isdefined(self.var_dde1833d))
	{
		self.var_dde1833d delete();
		objective_delete(self.var_c77b20b7);
	}
}

/*
	Name: function_496580e9
	Namespace: namespace_f8c4cfb7
	Checksum: 0x501013EF
	Offset: 0x45E8
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 1324
*/
function function_496580e9()
{
	if(self.var_9d6730be < 10)
	{
		if(self.var_1c43abc3 < 100)
		{
			self IPrintLnBold("LASER ATTACHMENT: UNLOCKED AT RANK 100 OR PRESTIGE 10");
			return;
		}
	}
	if(isdefined(self.var_397ff547) && self.var_397ff547)
	{
		self.var_397ff547 = 0;
		self clientfield::set_to_player("red_laser_fx_view", 0);
		self clientfield::set("red_laser_fx_world", 0);
		self unsetPerk("specialty_bulletaccuracy");
	}
	else if(isdefined(self.var_397ff547) && !self.var_397ff547)
	{
		self.var_397ff547 = 1;
		self clientfield::set_to_player("red_laser_fx_view", 1);
		self clientfield::set("red_laser_fx_world", 1);
		self setPerk("specialty_bulletaccuracy");
	}
	else if(!isdefined(self.var_397ff547))
	{
		self.var_397ff547 = 1;
		self clientfield::set_to_player("red_laser_fx_view", 1);
		self clientfield::set("red_laser_fx_world", 1);
		self setPerk("specialty_bulletaccuracy");
	}
}

/*
	Name: function_33072f44
	Namespace: namespace_f8c4cfb7
	Checksum: 0xA8F542DF
	Offset: 0x47C0
	Size: 0x2B0
	Parameters: 0
	Flags: None
	Line Number: 1367
*/
function function_33072f44()
{
	if(isdefined(self))
	{
		var_85e2cd63 = self.origin + VectorScale((0, 0, 1), 500);
		player_spot = self.origin + VectorScale((0, 0, 1), 70);
		if(isdefined(var_85e2cd63) && isdefined(player_spot))
		{
			angles = VectorToAngles(self.origin - var_85e2cd63);
			if(isdefined(angles))
			{
				self EnableInvulnerability();
				self FreezeControls(1);
				self DisableWeapons();
				self setClientUIVisibilityFlag("hud_visible", 0);
				self setClientUIVisibilityFlag("weapon_hud_visible", 0);
				self FreezeControls(1);
				self StartCameraTween(4);
				self CameraSetPosition(var_85e2cd63);
				self function_c5ac7d70(angles);
				self CameraActivate(1);
				wait(4);
				self StartCameraTween(4);
				self CameraSetPosition(player_spot);
				self function_c5ac7d70(angles);
				self CameraActivate(1);
				wait(4);
				self setClientUIVisibilityFlag("hud_visible", 1);
				self setClientUIVisibilityFlag("weapon_hud_visible", 1);
				self FreezeControls(0);
				self enableWeapons();
				self CameraActivate(0);
				self DisableInvulnerability();
				return;
			}
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c31d5b84
	Namespace: namespace_f8c4cfb7
	Checksum: 0x60C9C6A8
	Offset: 0x4A78
	Size: 0x2F0
	Parameters: 2
	Flags: None
	Line Number: 1417
*/
function function_c31d5b84(rank, prestige)
{
	var_dd218e0b = self namespace_11e193f1::function_69424d4c(11);
	if(var_dd218e0b == 0)
	{
		return;
	}
	if(var_dd218e0b == 1)
	{
		if(rank >= 10 || prestige >= 8)
		{
			self thread function_de6334b8();
		}
	}
	else if(var_dd218e0b == 2)
	{
		if(rank >= 120 || prestige >= 8)
		{
			self.var_8812205c = 1;
		}
	}
	else if(var_dd218e0b == 3)
	{
		if(rank >= 260 || prestige >= 8)
		{
			self.var_a56a9550 = &function_3bf28310;
			wait(RandomFloat(0.5));
			if(!isdefined(level.var_f904e4a7))
			{
				level.var_f904e4a7 = 1;
				spawner::add_archetype_spawn_function("zombie", &function_2a6641cc);
			}
		}
	}
	else if(var_dd218e0b == 4)
	{
		if(rank >= 380 || prestige >= 8)
		{
			self thread function_bbeb8dbc();
		}
	}
	else if(var_dd218e0b == 5)
	{
		if(rank >= 520 || prestige >= 8)
		{
			self thread function_31e42a85();
		}
	}
	else if(var_dd218e0b == 6)
	{
		if(rank >= 620 || prestige >= 8)
		{
			self thread function_4f92e43();
			self.var_a56a9550 = &function_fa30d561;
		}
	}
	else if(var_dd218e0b == 7)
	{
		if(rank >= 800 || prestige >= 8)
		{
			self thread function_1a4a519c();
			self.var_a56a9550 = &function_a217a29d;
		}
	}
	else if(var_dd218e0b == 8)
	{
		if(rank >= 1000 || prestige >= 8)
		{
			self thread function_de6334b8();
			self.var_8812205c = 1;
			self thread function_6fde3f6e();
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_de6334b8
	Namespace: namespace_f8c4cfb7
	Checksum: 0xA8312161
	Offset: 0x4D70
	Size: 0x210
	Parameters: 0
	Flags: None
	Line Number: 1504
*/
function function_de6334b8()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("damage", damage, attacker, direction, point, type, tagName, modelName, partName, weapon, iDFlags);
		if(isai(attacker))
		{
			zombies = GetAISpeciesArray("axis");
			for(K = 0; K < zombies.size; K++)
			{
				if(Distance2D(self.origin, zombies[K].origin) < 200)
				{
					zombies[K] thread zombie_burning_fx();
					zombies[K] thread zombie_burning_watch();
					zombies[K] thread function_54cfba88();
				}
			}
			wait(0.75);
			self.var_49a07362 = 0;
			self SetControllerUIModelValue("pegasus_player_progress", "JZMBardivine0");
			level waittill("start_of_round");
			wait(6);
			self SetControllerUIModelValue("pegasus_player_progress", "JZMBardivine1");
		}
	}
}

/*
	Name: function_54cfba88
	Namespace: namespace_f8c4cfb7
	Checksum: 0x81E14B97
	Offset: 0x4F88
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 1543
*/
function function_54cfba88()
{
	self endon("death");
	self playsound("zmb_vocals_zombie_death_fire");
	self.marked_for_death = 1;
	if(!(isdefined(self.isdog) && self.isdog))
	{
		if(!(isdefined(self.no_gib) && self.no_gib))
		{
			self zombie_utility::zombie_head_gib();
		}
	}
	wait(1);
	if(isdefined(self))
	{
		self DoDamage(self.health + 666, self.origin);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: zombie_burning_fx
	Namespace: namespace_f8c4cfb7
	Checksum: 0x808396F7
	Offset: 0x5048
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 1574
*/
function zombie_burning_fx()
{
	self endon("death");
	if(isdefined(self.is_on_fire) && self.is_on_fire)
	{
		return;
	}
	self.is_on_fire = 1;
	self thread zombie_death::on_fire_timeout();
	if(isdefined(level._effect) && isdefined(level._effect["lava_burning"]))
	{
		if(!self.isdog)
		{
			PlayFXOnTag(level._effect["lava_burning"], self, "J_SpineLower");
		}
	}
	if(isdefined(level._effect) && isdefined(level._effect["character_fire_death_sm"]))
	{
		if(RandomInt(2) > 1)
		{
			tagArray = [];
			tagArray[0] = "J_Elbow_LE";
			tagArray[1] = "J_Elbow_RI";
			tagArray[2] = "J_Knee_RI";
			tagArray[3] = "J_Knee_LE";
			tagArray = Array::randomize(tagArray);
			PlayFXOnTag(level._effect["character_fire_death_sm"], self, tagArray[0]);
		}
		else
		{
			tagArray[0] = "J_Wrist_RI";
			tagArray[1] = "J_Wrist_LE";
			if(!isdefined(self.a.gib_ref) || self.a.gib_ref != "no_legs")
			{
				tagArray[2] = "J_Ankle_RI";
				tagArray[3] = "J_Ankle_LE";
			}
			tagArray = Array::randomize(tagArray);
			PlayFXOnTag(level._effect["character_fire_death_sm"], self, tagArray[0]);
		}
	}
}

/*
	Name: zombie_burning_audio
	Namespace: namespace_f8c4cfb7
	Checksum: 0xAE823CBB
	Offset: 0x52A0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1627
*/
function zombie_burning_audio()
{
	self PlayLoopSound("zmb_fire_loop");
	self util::waittill_either("stop_flame_damage", "death");
	if(isdefined(self) && isalive(self))
	{
		self StopLoopSound(0.25);
	}
}

/*
	Name: player_burning_audio
	Namespace: namespace_f8c4cfb7
	Checksum: 0x627193FD
	Offset: 0x5338
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1647
*/
function player_burning_audio()
{
	fire_ent = spawn("script_model", self.origin);
	util::wait_network_frame();
	fire_ent LinkTo(self);
	fire_ent PlayLoopSound("evt_plr_fire_loop");
	self util::waittill_any("stop_flame_damage", "stop_flame_sounds", "death", "disconnect");
	fire_ent delete();
}

/*
	Name: zombie_burning_watch
	Namespace: namespace_f8c4cfb7
	Checksum: 0xB0323454
	Offset: 0x5410
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1667
*/
function zombie_burning_watch()
{
	self util::waittill_any("stop_flame_damage", "death");
	ArrayRemoveValue(level.burning_zombies, self);
}

/*
	Name: function_6522ed05
	Namespace: namespace_f8c4cfb7
	Checksum: 0x4AFB310C
	Offset: 0x5460
	Size: 0x320
	Parameters: 0
	Flags: None
	Line Number: 1683
*/
function function_6522ed05()
{
	self endon("disconnect");
	current_speed = self getMoveSpeedScale();
	self PlayLoopSound("zmb_buildable_loop");
	self setMoveSpeedScale(0);
	currentWeapon = self GetCurrentWeapon();
	clip_ammo = self GetWeaponAmmoClip(currentWeapon);
	stock_ammo = self GetWeaponAmmoStock(currentWeapon);
	weapon = GetWeapon("zombie_knuckle_crack");
	if(!isdefined(level.var_b2b28d30))
	{
		MapName = GetDvarString("mapname");
		if(MapName == "zm_prototype" || MapName == "zm_asylum" || MapName == "zm_sumpf")
		{
			level.var_b2b28d30 = 1;
		}
		else
		{
			level.var_b2b28d30 = 0;
		}
	}
	if(isdefined(level.var_b2b28d30) && level.var_b2b28d30)
	{
		wait(1.6);
	}
	else if(currentWeapon != level.weaponNone && !zm_utility::is_placeable_mine(currentWeapon) && !zm_equipment::is_equipment(currentWeapon) && currentWeapon.name != "zombie_bgb_grab" && currentWeapon.name != "zombie_bgb_use")
	{
		self TakeWeapon(currentWeapon);
		self GiveWeapon(weapon);
		self SwitchToWeapon(weapon);
		wait(1.6);
		self TakeWeapon(weapon);
		self function_35d2a0ab(currentWeapon, clip_ammo, stock_ammo);
	}
	self StopLoopSound();
	self setMoveSpeedScale(current_speed);
	self playsound("zmb_buildable_complete");
	if(current_speed < 1)
	{
		self setMoveSpeedScale(1);
	}
}

/*
	Name: function_3bf28310
	Namespace: namespace_f8c4cfb7
	Checksum: 0xFE0B2B99
	Offset: 0x5788
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 1737
*/
function function_3bf28310()
{
	self notify("hash_41d06d5a");
	if(isdefined(self.var_d73caf1e))
	{
		self.var_d73caf1e delete();
		wait(0.25);
	}
	var_a638c0c2 = GetClosestPointOnNavMesh(self.origin + VectorScale((0, 0, 1), 60) + AnglesToForward(self getPlayerAngles()) * 110, 100, 15);
	while(!isdefined(var_a638c0c2))
	{
		self IPrintLnBold("^1Location undefined");
		var_a638c0c2 = GetClosestPointOnNavMesh(self.origin + VectorScale((0, 0, 1), 60) + AnglesToForward(self getPlayerAngles()) * 110, 100, 15);
		wait(0.1);
	}
	self.var_d73caf1e = spawn("script_model", var_a638c0c2);
	var_c5e842b5 = VectorToAngles(self.origin - self.var_d73caf1e.origin);
	self.var_d73caf1e.angles = var_c5e842b5;
	self.var_d73caf1e RotateYaw(-90, 0.05);
	self.var_d73caf1e waittill("rotatedone");
	self.var_d73caf1e SetModel("chemist_toxic_growth");
	self.var_d73caf1e.health = 10;
	self thread function_6522ed05();
	self function_4c1f2603();
	level notify("hash_7a1c4177", self);
	self thread function_30f7e06f();
}

/*
	Name: function_4c1f2603
	Namespace: namespace_f8c4cfb7
	Checksum: 0x98E9FE29
	Offset: 0x5A08
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1775
*/
function function_4c1f2603()
{
	scaler = 0;
	while(isdefined(self.var_d73caf1e))
	{
		scaler = scaler + 0.2;
		self.var_d73caf1e SetScale(scaler);
		wait(0.05);
		if(scaler > 6)
		{
			break;
		}
	}
}

/*
	Name: function_30f7e06f
	Namespace: namespace_f8c4cfb7
	Checksum: 0x3680183
	Offset: 0x5A80
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1800
*/
function function_30f7e06f()
{
	level endon("game_ended");
	self endon("disconnect");
	self endon("hash_41d06d5a");
	while(isdefined(self.var_d73caf1e))
	{
		if(self.var_d73caf1e.health <= 0)
		{
			self.var_d73caf1e delete();
			break;
		}
		wait(0.5);
	}
}

/*
	Name: function_2a6641cc
	Namespace: namespace_f8c4cfb7
	Checksum: 0x72F1608A
	Offset: 0x5B00
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 1826
*/
function function_2a6641cc()
{
	self endon("death");
	level endon("game_ended");
	wait(3);
	if(!isdefined(self) || !isalive(self))
	{
		return;
	}
	while(!isdefined(self.completed_emerging_into_playable_area))
	{
		wait(1);
	}
	foreach(player in GetPlayers())
	{
		if(isdefined(player.var_d73caf1e))
		{
			self thread function_96afca5a(player);
		}
	}
	while(isalive(self))
	{
		level waittill("hash_7a1c4177", player);
		if(isdefined(player) && isdefined(self))
		{
			self thread function_96afca5a(player);
		}
	}
}

/*
	Name: function_96afca5a
	Namespace: namespace_f8c4cfb7
	Checksum: 0x52000F3D
	Offset: 0x5C60
	Size: 0x178
	Parameters: 1
	Flags: None
	Line Number: 1866
*/
function function_96afca5a(player)
{
	self endon("death");
	level endon("game_ended");
	ai_target = player.var_d73caf1e;
	self.var_e0377699 = 0;
	for(;;)
	{
		wait(0.05);
		if(!isdefined(ai_target))
		{
			if(isdefined(self))
			{
				self ASMSetAnimationRate(1);
				continue;
			}
		}
		else if(isdefined(self))
		{
			if(Distance2D(self.origin, ai_target.origin) < 80 && !self.var_e0377699)
			{
				self.var_e0377699 = 1;
				self ASMSetAnimationRate(0.5);
				ai_target.health--;
				wait(2);
			}
			else if(Distance2D(self.origin, ai_target.origin) > 80 && self.var_e0377699)
			{
				self.var_e0377699 = 0;
				self ASMSetAnimationRate(1);
				wait(2);
			}
		}
	}
}

/*
	Name: function_bbeb8dbc
	Namespace: namespace_f8c4cfb7
	Checksum: 0x144DD145
	Offset: 0x5DE0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 1912
*/
function function_bbeb8dbc()
{
	level endon("game_ended");
	self endon("disconnect");
	while(self IsSliding())
	{
		self setblur(1.5, 0.1);
		self SetVelocity(self getvelocity() * 2);
		while(self IsSliding())
		{
			wait(0.1);
		}
		self setblur(0, 0.1);
		wait(0.1);
	}
}

/*
	Name: function_31e42a85
	Namespace: namespace_f8c4cfb7
	Checksum: 0xC93ABA00
	Offset: 0x5EC0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 1939
*/
function function_31e42a85()
{
	level endon("game_ended");
	self endon("disconnect");
	var_c77d73b9 = self.score;
	while(isdefined(var_c77d73b9))
	{
		if(var_c77d73b9 != self.score)
		{
			var_92375180 = var_c77d73b9 - self.score;
			var_4aef4bd3 = Int(var_92375180 * 0.15);
			if(var_4aef4bd3 > 0)
			{
				self zm_score::add_to_player_score(var_4aef4bd3);
			}
			wait(0.25);
			var_c77d73b9 = self.score;
		}
		wait(0.5);
	}
}

/*
	Name: function_4f92e43
	Namespace: namespace_f8c4cfb7
	Checksum: 0x262AD2E1
	Offset: 0x5FA0
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 1971
*/
function function_4f92e43()
{
	level endon("game_ended");
	self endon("disconnect");
	level waittill("end_of_round");
	if(!isdefined(self.var_15511cdf))
	{
		self.var_15511cdf = 0;
	}
	while(isdefined(self.var_15511cdf))
	{
		self.var_15511cdf = self.var_15511cdf + 2;
		self.n_player_health_boost = self.var_15511cdf;
		self zm_perks::perk_set_max_health_if_jugg("health_reboot", 0, 1);
		wait(0.25);
		if(isdefined(self.var_a73bce6b))
		{
			self.var_a73bce6b setValue(self.health);
		}
		level waittill("start_of_round");
		wait(4);
	}
	return;
}

/*
	Name: function_fa30d561
	Namespace: namespace_f8c4cfb7
	Checksum: 0x1872994C
	Offset: 0x6090
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 2006
*/
function function_fa30d561()
{
	players = GetPlayers();
	foreach(player in players)
	{
		if(player laststand::player_is_in_laststand())
		{
			player thread zm_laststand::auto_revive(self, 0);
			wait(0.2);
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1a4a519c
	Namespace: namespace_f8c4cfb7
	Checksum: 0x173AD5B4
	Offset: 0x6168
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 2031
*/
function function_1a4a519c()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		foreach(powerup in level.active_powerups)
		{
			if(isdefined(powerup) && Distance2D(powerup.origin, self.origin) < 800 && !isdefined(powerup.var_4cd06ff7))
			{
				powerup.var_4cd06ff7 = 1;
				powerup notify("movedone");
				powerup moveto(self.origin + VectorScale((0, 0, 1), 45), 1.5);
			}
		}
		wait(1);
	}
}

/*
	Name: function_a217a29d
	Namespace: namespace_f8c4cfb7
	Checksum: 0x59315993
	Offset: 0x62B0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 2060
*/
function function_a217a29d()
{
	var_a638c0c2 = GetClosestPointOnNavMesh(self.origin + VectorScale((0, 0, 1), 60) + AnglesToForward(self getPlayerAngles()) * 110, 100, 15);
	wait(0.05);
	if(isdefined(var_a638c0c2))
	{
		thread zm_powerups::specific_powerup_drop(Array::random(level.zombie_powerup_array), var_a638c0c2);
	}
}

/*
	Name: function_6fde3f6e
	Namespace: namespace_f8c4cfb7
	Checksum: 0x3556B727
	Offset: 0x6370
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 2080
*/
function function_6fde3f6e()
{
	for(;;)
	{
		level waittill("end_of_round");
		if(isdefined(self.hasRiotShield) && self.hasRiotShield)
		{
			if(isdefined(level.weaponRiotshield) && self hasweapon(level.weaponRiotshield))
			{
				self TakeWeapon(level.weaponRiotshield);
				level waittill("start_of_round");
				wait(4);
				self zm_weapons::weapon_give(level.weaponRiotshield, undefined, undefined, 1);
			}
		}
	}
}

