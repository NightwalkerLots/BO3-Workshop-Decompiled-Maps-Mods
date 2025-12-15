#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_clientdvar;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\bgbs\_zm_bgb_burned_out;
#include scripts\zm\timedplay;

#namespace namespace_452f006e;

/*
	Name: init
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x630
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 30
*/
function init()
{
	thread function_c6e11604();
	thread no_powerups();
	callback::on_spawned(&init_player);
	thread function_2a2258ed();
	level.round_wait_func = &namespace_88adf060::round_wait_override;
	level.zombie_vars["zombie_between_round_time"] = 0;
	level.zombie_round_start_delay = 0;
	setscoreboardcolumns("pointstowin", "score", "kills", "headshots", "humiliated", "plants", "stabs", "captures", "returns");
	level.var_25c11ce1 = Array("launcher_warmachinemp", "micromissile_launcher", "sniper_chargeshot", "spike_launcher", "elmg_tempset", "lmg_death__machine");
}

/*
	Name: no_powerups
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x768
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function no_powerups()
{
	level endon("end_game");
	level flag::wait_till("initial_blackscreen_passed");
	level._custom_powerups["full_ammo"].grab_powerup = &function_5d65e887;
	level.zombie_powerups["full_ammo"].only_affects_grabber = 1;
	level.zmAnnouncerVox["full_ammo"] = "";
	if(isdefined(level.next_dog_round))
	{
		level.next_dog_round = 0;
	}
	if(isdefined(level.next_monkey_round))
	{
		level.next_monkey_round = 0;
	}
	if(isdefined(level.n_next_raps_round))
	{
		level.n_next_raps_round = 0;
	}
	if(isdefined(level.n_next_raz_round))
	{
		level.n_next_raz_round = 0;
	}
	if(isdefined(level.var_a78effc7))
	{
		level.var_a78effc7 = 0;
	}
	if(isdefined(level.n_next_spider_round))
	{
		level.n_next_spider_round = 0;
	}
	if(isdefined(level.var_ebc4830))
	{
		level.var_ebc4830 = 0;
	}
	if(isdefined(level.next_wasp_round))
	{
		level.next_wasp_round = 0;
	}
	if(isdefined(level.var_783db6ab))
	{
		level.var_783db6ab = 0;
	}
	if(isdefined(level.powerup_drop_count))
	{
		level.powerup_drop_count = 0;
	}
	for(;;)
	{
		level.powerup_drop_count = 0;
		zombie_utility::set_zombie_var("zombie_spawn_delay", 0.3, 1);
		wait(1);
	}
}

/*
	Name: init_player
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x930
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 118
*/
function init_player()
{
	self endon("disconnect");
	self endon("death");
	self notify("hash_177d3944");
	self endon("hash_177d3944");
	level.whoswho_laststand_func = &function_733d89cb;
	level flag::wait_till("start_zombie_round_logic");
	self zm_weapons::give_build_kit_weapon(level.start_weapon);
	wait(1);
	self thread function_5db810fd();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5db810fd
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x9E0
	Size: 0x680
	Parameters: 0
	Flags: None
	Line Number: 143
*/
function function_5db810fd()
{
	self notify("hash_5db810fd");
	self endon("hash_5db810fd");
	self endon("disconnect");
	self endon("death");
	self endon("hash_2e3184ce");
	self.pers["humiliated"] = 0;
	self.humiliated = 0;
	self.var_98dcee6a = 0;
	self.var_d40e9574 = 0;
	self.var_d40e9574 = 0;
	self.score_total = 0;
	self.var_98dcee6a = level.var_e33b7dcd[self.var_d40e9574].points;
	self function_49a6ae0f();
	self thread function_da2e7aa7();
	self thread unlimitedammo();
	self thread function_fe40b32e();
	points = self.score_total;
	for(;;)
	{
		wait(0.1);
		while(isdefined(self.var_5784b1ae))
		{
			wait(0.05);
		}
		self.var_98dcee6a = self.var_98dcee6a - self.score_total - points;
		points = self.score_total;
		self.pointstowin = self.var_d40e9574 + 1;
		self.pers["pointstowin"] = self.pointstowin;
		self.var_9e1cfff9 hud::updateBar(level.var_e33b7dcd[self.var_d40e9574].points - self.var_98dcee6a / level.var_e33b7dcd[self.var_d40e9574].points);
		if(self.var_98dcee6a <= 0)
		{
			if(self.var_d40e9574 + 1 >= level.var_e33b7dcd.size)
			{
				level.var_b7d14a45 = self.name;
				level.custom_game_over_hud_elem = &function_792d465e;
				level notify("end_game");
				level notify("hash_2e3184ce", self.name);
			}
			self.IS_DRINKING = 0;
			currentWeapon = self GetCurrentWeapon();
			foreach(weapon in self getweaponslistprimaries())
			{
				if(weapon != currentWeapon)
				{
					self TakeWeapon(weapon);
				}
			}
			self.var_d40e9574 = math::clamp(self.var_d40e9574 + 1, 0, level.var_e33b7dcd.size - 1);
			if(GetDvarInt("tfoption_gungame") == 1)
			{
				if(math::cointoss())
				{
					var_65ddf7d1 = level.var_e33b7dcd[self.var_d40e9574].weapon;
				}
				else
				{
					var_65ddf7d1 = zm_weapons::get_upgrade_weapon(level.var_e33b7dcd[self.var_d40e9574].weapon, 1);
				}
			}
			else
			{
				var_65ddf7d1 = level.var_e33b7dcd[self.var_d40e9574].weapon;
			}
			weapon = self zm_weapons::give_build_kit_weapon(var_65ddf7d1);
			if(zm_weapons::is_weapon_upgraded(weapon))
			{
				self AAT::acquire(weapon);
			}
			self DisableWeaponCycling();
			if(self.var_d40e9574 == 1)
			{
				self function_92dca8b7(weapon, 1);
			}
			else
			{
				self function_92dca8b7(weapon, 0);
			}
			self.var_98dcee6a = level.var_e33b7dcd[self.var_d40e9574].points;
			self.var_e4c92539 setText(self.var_d40e9574 + 1 + "/" + level.var_e33b7dcd.size);
			self.var_9e1cfff9 hud::updateBar(level.var_e33b7dcd[self.var_d40e9574].points - self.var_98dcee6a / level.var_e33b7dcd[self.var_d40e9574].points);
			namespace_22b67853::function_f105c5b1("gun_up", self);
			self playlocalsound("zmb_bgb_disorderly_weap_switch");
			self zm_utility::function_ea3a8353();
			if(self isusingoffhand())
			{
				self forceoffhandend();
			}
			self SwitchToWeapon(weapon);
			self util::waittill_notify_or_timeout("weapon_change_complete", 3);
			self TakeWeapon(currentWeapon);
			self zm_utility::function_adb1601b();
		}
	}
}

/*
	Name: function_5d65e887
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x1068
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 250
*/
function function_5d65e887(player)
{
	player.var_98dcee6a = 0;
}

/*
	Name: function_fe40b32e
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x1090
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 265
*/
function function_fe40b32e()
{
	self notify("hash_fe40b32e");
	self endon("hash_fe40b32e");
	self endon("disconnect");
	self endon("death");
	level waittill("end_game");
	self.ignoreme = 1;
	self FreezeControls(1);
	if(isdefined(self.var_cb8d0620))
	{
		self.var_cb8d0620 destroy();
		self.var_cb8d0620 = undefined;
	}
	if(isdefined(self.var_a9a5dd62))
	{
		self.var_a9a5dd62 destroy();
		self.var_a9a5dd62 = undefined;
	}
}

/*
	Name: function_da2e7aa7
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x1168
	Size: 0x338
	Parameters: 0
	Flags: None
	Line Number: 296
*/
function function_da2e7aa7()
{
	self notify("hash_da2e7aa7");
	self endon("hash_da2e7aa7");
	level endon("end_game");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		weapon = self GetCurrentWeapon();
		if(!self check_valid_weapon(weapon))
		{
			var_1b6f691b = level.var_e33b7dcd[self.var_d40e9574].weapon;
			self.IS_DRINKING = 0;
			self DisableWeaponCycling();
			if(self zm_weapons::has_weapon_or_upgrade(var_1b6f691b))
			{
				foreach(var_3306a4c5 in self getweaponslistprimaries())
				{
					if(var_3306a4c5.rootweapon == var_1b6f691b)
					{
						if(self isusingoffhand())
						{
							self forceoffhandend();
						}
						self SwitchToWeapon(var_3306a4c5);
						continue;
					}
					self TakeWeapon(var_3306a4c5);
				}
			}
			else
			{
				foreach(var_3306a4c5 in self getweaponslistprimaries())
				{
					self TakeWeapon(var_3306a4c5);
				}
				weapon = self zm_weapons::give_build_kit_weapon(var_1b6f691b);
				if(zm_weapons::is_weapon_upgraded(weapon))
				{
					self AAT::acquire(weapon);
				}
				self function_92dca8b7(weapon, 0);
				if(self isusingoffhand())
				{
					self forceoffhandend();
				}
				self SwitchToWeaponImmediate(weapon);
			}
		}
		self waittill("weapon_change");
	}
	return;
	ERROR: Bad function call
}

/*
	Name: unlimitedammo
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x14A8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 362
*/
function unlimitedammo()
{
	self notify("hash_aa65b22d");
	self endon("hash_aa65b22d");
	level endon("end_game");
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self function_4d772bd1();
		self util::waittill_any("reload_start", "weapon_fired", "weapon_change");
	}
}

/*
	Name: function_4d772bd1
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x1538
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 386
*/
function function_4d772bd1()
{
	weapon = self GetCurrentWeapon();
	self setPerk("specialty_whoswho");
	self.lives = 10;
	if(self getammocount(weapon) < 2)
	{
		self giveMaxAmmo(weapon);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: check_valid_weapon
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x15D0
	Size: 0x410
	Parameters: 1
	Flags: None
	Line Number: 409
*/
function check_valid_weapon(player_weapon)
{
	if(self hasweapon(GetWeapon("none")) || player_weapon == GetWeapon("none"))
	{
		return 0;
	}
	if(!isdefined(player_weapon.inventoryType))
	{
		return 0;
	}
	if(player_weapon == GetWeapon("zombie_knuckle_crack") || player_weapon == GetWeapon("zombie_builder"))
	{
		return 1;
	}
	if(player_weapon.inventoryType != "primary" && self getweaponslistprimaries().size == 1 || player_weapon == level.zombie_powerup_weapon["minigun"] || player_weapon == level.zombie_powerup_weapon["purifier"])
	{
		return 1;
	}
	foreach(perk in level._custom_perks)
	{
		if(!isdefined(perk) || !isdefined(perk.perk_bottle_weapon))
		{
			continue;
		}
		if(perk.perk_bottle_weapon == player_weapon)
		{
			return 1;
		}
	}
	if(player_weapon == GetWeapon("zombie_bgb_grab") || player_weapon == GetWeapon("zombie_bgb_use"))
	{
		return 1;
	}
	if(player_weapon == GetWeapon("syrette_zod_beast") || player_weapon == GetWeapon("beast_zm") || player_weapon == GetWeapon("zombie_beast_grapple_dwr") || player_weapon == GetWeapon("zombie_beast_lightning_dwr") || player_weapon == GetWeapon("zombie_beast_lightning_dwl") || player_weapon == GetWeapon("zombie_beast_lightning_dwl2") || player_weapon == GetWeapon("zombie_beast_lightning_dwl3"))
	{
		return 1;
	}
	self.IS_DRINKING = 0;
	self DisableWeaponCycling();
	return player_weapon.rootweapon == level.var_e33b7dcd[self.var_d40e9574].weapon.rootweapon || player_weapon.rootweapon == level.var_e33b7dcd[self.var_d40e9574].upgrade.rootweapon || player_weapon.rootweapon == level.var_e33b7dcd[self.var_d40e9574].weapon.altweapon || player_weapon.rootweapon == level.var_e33b7dcd[self.var_d40e9574].upgrade.altweapon;
}

/*
	Name: function_733d89cb
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x19E8
	Size: 0x420
	Parameters: 0
	Flags: None
	Line Number: 461
*/
function function_733d89cb()
{
	level endon("end_game");
	self endon("disconnect");
	self notify("clear_red_flashing_overlay");
	self.var_5784b1ae = 1;
	self.IS_DRINKING = 0;
	self.var_12653ed = self.var_d40e9574;
	self.var_d40e9574 = math::clamp(self.var_d40e9574 - 1, 0, level.var_e33b7dcd.size - 1);
	self.var_98dcee6a = level.var_e33b7dcd[self.var_d40e9574].points;
	self.health = self.maxhealth;
	self.var_e4c92539 setText(self.var_d40e9574 + 1 + "/" + level.var_e33b7dcd.size);
	self.var_9e1cfff9 hud::updateBar(level.var_e33b7dcd[self.var_d40e9574].points - self.var_98dcee6a / level.var_e33b7dcd[self.var_d40e9574].points);
	self thread namespace_403823cc::result();
	self playsound("zmb_bgb_powerup_burnedout");
	self.pers["humiliated"]++;
	self.humiliated = self.pers["humiliated"];
	if(self.var_d40e9574 != self.var_12653ed)
	{
		namespace_22b67853::function_f105c5b1("gun_down", self);
		foreach(weapon in self getweaponslistprimaries())
		{
			self TakeWeapon(weapon);
		}
		if(GetDvarInt("tfoption_gungame") == 1)
		{
			if(math::cointoss())
			{
				var_65ddf7d1 = level.var_e33b7dcd[self.var_d40e9574].weapon;
			}
			else
			{
				var_65ddf7d1 = zm_weapons::get_upgrade_weapon(level.var_e33b7dcd[self.var_d40e9574].weapon, 1);
			}
		}
		else
		{
			var_65ddf7d1 = level.var_e33b7dcd[self.var_d40e9574].weapon;
		}
		weapon = self zm_weapons::give_build_kit_weapon(var_65ddf7d1);
		if(zm_weapons::is_weapon_upgraded(weapon))
		{
			self AAT::acquire(weapon);
		}
		self DisableWeaponCycling();
		self function_92dca8b7(self getweaponslistprimaries()[0], 0);
		if(self isusingoffhand())
		{
			self forceoffhandend();
		}
		self SwitchToWeaponImmediate(self getweaponslistprimaries()[0]);
	}
	self.var_5784b1ae = undefined;
}

/*
	Name: function_728c37d
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x1E10
	Size: 0x550
	Parameters: 0
	Flags: None
	Line Number: 526
*/
function function_728c37d()
{
	while(!isdefined(level.zombie_weapons) || (isdefined(level.zombie_weapons) && level.zombie_weapons.size <= 0))
	{
		wait(0.048);
	}
	if(!isdefined(level.var_e33b7dcd))
	{
		if(isdefined(level.var_2a2258ed))
		{
			[[level.var_2a2258ed]]();
			return;
		}
		weapons = [];
		weapons["wonder"] = [];
		weapons["mg"] = [];
		weapons["rifle"] = [];
		weapons["smg"] = [];
		weapons["melee"] = [];
		weapons["rocketlauncher"] = [];
		weapons["spread"] = [];
		weapons["pistol"] = [];
		foreach(key in getArrayKeys(level.zombie_weapons))
		{
			zm_weapons = level.zombie_weapons[key];
			if(zm_weapons.is_in_box)
			{
				if(key.type != "melee")
				{
					if(zm_weapons.is_wonder_weapon)
					{
						weapons["wonder"][weapons["wonder"].size] = zm_weapons;
						continue;
					}
					if(isdefined(key) && isdefined(key.weapClass) && isdefined(weapons[key.weapClass]))
					{
						weapons[key.weapClass][weapons[key.weapClass].size] = zm_weapons;
					}
				}
			}
		}
		level.var_e33b7dcd = [];
		foreach(key in getArrayKeys(weapons))
		{
			foreach(var_7b0bed51 in Array::randomize(weapons[key]))
			{
				if(isdefined(var_7b0bed51.weapon) && isdefined(var_7b0bed51.upgrade))
				{
					level.var_e33b7dcd[level.var_e33b7dcd.size] = function_32a88bc4(var_7b0bed51.weapon, var_7b0bed51.upgrade, choose_class(key));
				}
			}
		}
	}
	level.var_490974b1 = [];
	level.var_490974b1["wonder"] = randomIntRange(3, 4) * 1000;
	level.var_490974b1["mg"] = randomIntRange(2, 3) * 2000;
	level.var_490974b1["rifle"] = randomIntRange(2, 3) * 1500;
	level.var_490974b1["smg"] = randomIntRange(1, 2) * 2000;
	level.var_490974b1["spread"] = randomIntRange(1, 2) * 1000;
	level.var_490974b1["pistol"] = randomIntRange(1, 2) * 1000;
	level.var_490974b1["rocketlauncher"] = randomIntRange(1, 2) * 1000;
	level.var_490974b1["melee"] = 1000;
}

/*
	Name: function_32a88bc4
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x2368
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 600
*/
function function_32a88bc4(weapon, upgraded, points)
{
	weap = spawnstruct();
	weap.upgrade = upgraded;
	weap.weapon = weapon;
	weap.points = points;
	return weap;
}

/*
	Name: choose_class
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x23E8
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 619
*/
function choose_class(weap_class)
{
	if(isdefined(level.var_490974b1[weap_class]))
	{
		return level.var_490974b1[weap_class];
	}
	return randomIntRange(1, 3) * 1000;
}

/*
	Name: function_2a2258ed
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x2440
	Size: 0x7F0
	Parameters: 0
	Flags: None
	Line Number: 638
*/
function function_2a2258ed()
{
	level.var_490974b1 = [];
	level.var_490974b1["wonder"] = randomIntRange(3, 4) * 1000;
	level.var_490974b1["mg"] = randomIntRange(2, 3) * 2000;
	level.var_490974b1["rifle"] = randomIntRange(2, 3) * 1500;
	level.var_490974b1["smg"] = randomIntRange(1, 2) * 2000;
	level.var_490974b1["spread"] = randomIntRange(1, 2) * 1000;
	level.var_490974b1["pistol"] = randomIntRange(1, 2) * 1000;
	level.var_490974b1["rocketlauncher"] = randomIntRange(1, 2) * 1000;
	level.var_490974b1["melee"] = 1000;
	while(!isdefined(level.zombie_weapons) || (isdefined(level.zombie_weapons) && level.zombie_weapons.size <= 0))
	{
		wait(0.048);
	}
	weapons = [];
	weapons["wonder"] = [];
	weapons["mg"] = [];
	weapons["rifle"] = [];
	weapons["smg"] = [];
	weapons["melee"] = [];
	weapons["rocketlauncher"] = [];
	weapons["spread"] = [];
	weapons["pistol"] = [];
	foreach(key in getArrayKeys(level.zombie_weapons))
	{
		zm_weapons = level.zombie_weapons[key];
		if(zm_weapons.is_in_box)
		{
			if(key.type != "melee" && !IsSubStr(key.name, "launcher_multi"))
			{
				if(zm_weapons.is_wonder_weapon)
				{
					weapons["wonder"][weapons["wonder"].size] = zm_weapons;
					continue;
				}
				if(isdefined(key) && isdefined(key.weapClass) && isdefined(weapons[key.weapClass]))
				{
					weapons[key.weapClass][weapons[key.weapClass].size] = zm_weapons;
					continue;
				}
			}
		}
		if(IsInArray(level.var_25c11ce1, key.name))
		{
			if(key.type != "melee")
			{
				if(zm_weapons.is_wonder_weapon)
				{
					weapons["wonder"][weapons["wonder"].size] = zm_weapons;
					continue;
				}
				if(isdefined(key) && isdefined(key.weapClass) && isdefined(weapons[key.weapClass]))
				{
					weapons[key.weapClass][weapons[key.weapClass].size] = zm_weapons;
				}
			}
		}
	}
	level.var_e33b7dcd = [];
	var_f7a7fd5b = GetDvarInt("tfoption_gungame");
	foreach(key in getArrayKeys(weapons))
	{
		foreach(var_7b0bed51 in Array::randomize(weapons[key]))
		{
			if(isdefined(var_7b0bed51.weapon) && isdefined(var_7b0bed51.upgrade))
			{
				switch(var_f7a7fd5b)
				{
					case 4:
					{
						level.var_e33b7dcd[level.var_e33b7dcd.size] = function_32a88bc4(var_7b0bed51.upgrade, var_7b0bed51.upgrade, choose_class(key));
						break;
					}
					case 3:
					{
						level.var_e33b7dcd[level.var_e33b7dcd.size] = function_32a88bc4(var_7b0bed51.weapon, var_7b0bed51.upgrade, choose_class(key));
						break;
					}
					case 2:
					{
						level.var_e33b7dcd[level.var_e33b7dcd.size] = function_32a88bc4(var_7b0bed51.weapon, var_7b0bed51.upgrade, choose_class(key));
						level.var_e33b7dcd[level.var_e33b7dcd.size] = function_32a88bc4(var_7b0bed51.upgrade, var_7b0bed51.upgrade, choose_class(key));
						break;
					}
					case 1:
					{
						level.var_e33b7dcd[level.var_e33b7dcd.size] = function_32a88bc4(var_7b0bed51.weapon, var_7b0bed51.upgrade, choose_class(key));
						break;
					}
				}
			}
		}
	}
}

/*
	Name: function_c6e11604
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x2C38
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 744
*/
function function_c6e11604()
{
	level flag::wait_till("initial_blackscreen_passed");
	disable_triggers(GetEntArray("weapon_upgrade", "targetname"));
	disable_triggers(GetEntArray("sickle_upgrade", "targetname"));
	disable_triggers(GetEntArray("bowie_upgrade", "targetname"));
	level.func_override_wallbuy_prompt = &disable_weapon;
	Array::run_all(level.chests, &zm_magicbox::hide_chest, 0);
}

/*
	Name: disable_weapon
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x2D38
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 764
*/
function disable_weapon(player)
{
	self.stub.hint_string = &"MENU_UNAVAILABLE_CAPS";
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7f0e83d
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x2D68
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 781
*/
function function_7f0e83d(PERKS)
{
	foreach(trigger in GetEntArray("zombie_vending_upgrade", "targetname"))
	{
		if(Array::contains(PERKS, trigger.script_noteworthy))
		{
			trigger delete();
		}
	}
}

/*
	Name: disable_triggers
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x2E48
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 802
*/
function disable_triggers(triggers)
{
	if(isdefined(triggers))
	{
		foreach(trigger in triggers)
		{
			trigger delete();
		}
	}
}

/*
	Name: function_812bff07
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x2EF0
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 823
*/
function function_812bff07(triggers)
{
	if(isdefined(triggers))
	{
		foreach(trigger in triggers)
		{
			thread zm_unitrigger::unregister_unitrigger(trigger);
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_49a6ae0f
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x2F98
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 846
*/
function function_49a6ae0f()
{
	if(isdefined(self.var_9e1cfff9))
	{
		self.var_9e1cfff9 destroy();
	}
	if(isdefined(self.var_e4c92539))
	{
		self.var_e4c92539 destroy();
	}
	self.var_9e1cfff9 = hud::createPrimaryProgressBar();
	self.var_9e1cfff9 hud::setPoint(undefined, undefined, 0, 190);
	self.var_9e1cfff9.hidewheninmenu = 1;
	self.var_9e1cfff9.bar.hidewheninmenu = 1;
	self.var_9e1cfff9.barFrame.hidewheninmenu = 1;
	self.var_e4c92539 = self hud::createPrimaryProgressBarText();
	self.var_e4c92539 hud::setPoint(undefined, undefined, 0, 175);
	if(self IsSplitscreen())
	{
		self.var_e4c92539 hud::setPoint(undefined, undefined, 0, 107);
	}
	self.var_e4c92539.hidewheninmenu = 1;
	self.var_e4c92539.label = &"ELMGT_GG_LV";
	self.var_e4c92539 setText(self.var_d40e9574 + 1 + "/" + level.var_e33b7dcd.size);
	self.var_9e1cfff9 hud::updateBar(level.var_e33b7dcd[self.var_d40e9574].points - self.var_98dcee6a / level.var_e33b7dcd[self.var_d40e9574].points);
}

/*
	Name: function_792d465e
	Namespace: namespace_452f006e
	Checksum: 0x424F4353
	Offset: 0x31B8
	Size: 0x254
	Parameters: 3
	Flags: None
	Line Number: 883
*/
function function_792d465e(player, elem, survived)
{
	elem.alignX = "center";
	elem.alignY = "middle";
	elem.horzAlign = "center";
	elem.vertAlign = "middle";
	elem.y = elem.y - 130;
	elem.foreground = 1;
	elem.fontscale = 3;
	elem.alpha = 0;
	elem.color = (1, 1, 1);
	elem.hidewheninmenu = 1;
	if(isdefined(level.var_b7d14a45))
	{
		elem.label = &"ELMGT_WINER";
		elem setText(level.var_b7d14a45);
	}
	else
	{
		elem.label = &"";
		elem setText("GAME OVER");
	}
	elem fadeOverTime(1);
	elem.alpha = 1;
	if(player IsSplitscreen())
	{
		elem.fontscale = 2;
		elem.y = elem.y + 40;
	}
	survived.alignX = "center";
	survived.alignY = "middle";
	survived.horzAlign = "center";
	survived.vertAlign = "middle";
	survived.y = survived.y - 90000;
}

