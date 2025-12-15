#include scripts\shared\ai\zombie_utility;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\vk_script\_zm_vk_general;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_449e30ba;

/*
	Name: init
	Namespace: namespace_449e30ba
	Checksum: 0xE32BB8A9
	Offset: 0x3E8
	Size: 0x88
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec init()
{
	level.var_afd0fe55 = 1;
	level.var_cd5928ef = 1;
	level.var_3293b92e = 0;
	level.var_3188d4da = 0;
	zm_spawner::register_zombie_damage_callback(&function_4b489278);
	zm_spawner::register_zombie_death_event_callback(&function_783aede1);
	thread function_58e35aa4();
	return;
}

/*
	Name: function_58e35aa4
	Namespace: namespace_449e30ba
	Checksum: 0xDAA3D38E
	Offset: 0x478
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function function_58e35aa4()
{
	modvar("hitmarkers", "0");
	modvar("hitmarkers_sound", "0");
	modvar("skalvish", "0");
	thread function_70760d6e();
	thread function_c5cc1a41();
	thread function_b90939c4();
	thread function_9a83b461();
	thread function_1d6a99cd();
	thread function_307f832e();
	thread Zombie_Counter();
}

/*
	Name: function_4b489278
	Namespace: namespace_449e30ba
	Checksum: 0x49507523
	Offset: 0x558
	Size: 0xB8
	Parameters: 13
	Flags: None
	Line Number: 66
*/
function function_4b489278(mod, HIT_LOCATION, hit_origin, player, amount, weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	self thread function_1114d19b(mod, HIT_LOCATION, hit_origin, player, amount, weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel);
	return 0;
	ERROR: Bad function call
}

/*
	Name: function_783aede1
	Namespace: namespace_449e30ba
	Checksum: 0xBF0FBF1C
	Offset: 0x618
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 83
*/
function function_783aede1(player)
{
	self thread function_41b85b21(player);
	return 0;
}

/*
	Name: function_70760d6e
	Namespace: namespace_449e30ba
	Checksum: 0xB55DF3F1
	Offset: 0x648
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 99
*/
function function_70760d6e()
{
	SetDvar("hitmarkers", 1);
	while(1)
	{
		if(GetDvarInt("hitmarkers") == 0)
		{
			level.var_afd0fe55 = 0;
		}
		if(GetDvarInt("hitmarkers") == 1)
		{
			level.var_afd0fe55 = 1;
		}
		wait(0.15);
	}
}

/*
	Name: function_c5cc1a41
	Namespace: namespace_449e30ba
	Checksum: 0x19EA3D56
	Offset: 0x6E0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 126
*/
function function_c5cc1a41()
{
	wait(1);
	while(1)
	{
		while(isdefined(level.var_afd0fe55) && level.var_afd0fe55)
		{
			wait(0.15);
		}
		IPrintLnBold("Hitmarkers Disabled");
		while(!(isdefined(level.var_afd0fe55) && level.var_afd0fe55))
		{
			wait(0.15);
		}
		IPrintLnBold("Hitmarkers Enabled");
	}
}

/*
	Name: function_b90939c4
	Namespace: namespace_449e30ba
	Checksum: 0x78C60A16
	Offset: 0x780
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 154
*/
function function_b90939c4()
{
	SetDvar("hitmarkers_sound", 1);
	while(1)
	{
		if(GetDvarInt("hitmarkers_sound") == 0)
		{
			level.var_cd5928ef = 0;
		}
		if(GetDvarInt("hitmarkers_sound") == 1)
		{
			level.var_cd5928ef = 1;
		}
		wait(0.15);
	}
}

/*
	Name: function_9a83b461
	Namespace: namespace_449e30ba
	Checksum: 0xC7C2951C
	Offset: 0x818
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 181
*/
function function_9a83b461()
{
	wait(1);
	while(1)
	{
		while(isdefined(level.var_cd5928ef) && level.var_cd5928ef)
		{
			wait(0.15);
		}
		IPrintLnBold("Hitmarkers Sound Disabled");
		while(!(isdefined(level.var_cd5928ef) && level.var_cd5928ef))
		{
			wait(0.15);
		}
		IPrintLnBold("Hitmarkers Sound Enabled");
	}
}

/*
	Name: function_1d6a99cd
	Namespace: namespace_449e30ba
	Checksum: 0xF3A5FEDB
	Offset: 0x8B8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 209
*/
function function_1d6a99cd()
{
	SetDvar("skalvish", 0);
	while(1)
	{
		if(GetDvarInt("skalvish") == 0)
		{
			level.var_3293b92e = 0;
		}
		if(GetDvarInt("skalvish") == 1)
		{
			level.var_3293b92e = 1;
		}
		wait(0.15);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_307f832e
	Namespace: namespace_449e30ba
	Checksum: 0x7B3C60BD
	Offset: 0x948
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 238
*/
function function_307f832e()
{
	wait(1);
	while(1)
	{
		while(isdefined(level.var_3293b92e) && level.var_3293b92e)
		{
			wait(0.15);
		}
		IPrintLnBold("Skalvish Disabled");
		while(!(isdefined(level.var_3293b92e) && level.var_3293b92e))
		{
			wait(0.15);
		}
		IPrintLnBold("Skalvish Enabled");
	}
}

/*
	Name: function_1114d19b
	Namespace: namespace_449e30ba
	Checksum: 0x44E1A50
	Offset: 0x9E8
	Size: 0x308
	Parameters: 13
	Flags: None
	Line Number: 266
*/
function function_1114d19b(mod, HIT_LOCATION, hit_origin, player, amount, weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(isdefined(level.var_afd0fe55) && level.var_afd0fe55)
	{
		if(isdefined(level.var_cd5928ef) && level.var_cd5928ef)
		{
			if(HIT_LOCATION == "helmet")
			{
			}
			else if(isdefined(level.var_3293b92e) && level.var_3293b92e)
			{
				player playlocalsound("sk_hitmarker_normal");
				continue;
			}
			player playlocalsound("vk_hitmarker_normal");
			team = player.team;
			if(level.zombie_vars[team]["zombie_point_scalar"] == 2)
			{
				player playlocalsound("vk_hitmarker_doublepoints");
			}
		}
		if(player.var_5ace6d11 != 1)
		{
			player.hud_damagefeedback.alpha = 0;
			player.hud_damagefeedback.x = -16;
			player.hud_damagefeedback.y = -16;
			player.hud_damagefeedback SetShader("robit_hitmarker", 32, 32);
			player.hud_damagefeedback.color = (1, 1, 1);
			w_damage = zm_weapons::get_nonalternate_weapon(weapon);
			weaponClass = util::getWeaponClass(w_damage);
			if(isdefined(level.var_cd5928ef) && level.var_cd5928ef)
			{
				if(HIT_LOCATION == "helmet")
				{
					if(weaponClass == "weapon_sniper")
					{
						player playlocalsound("prj_bullet_impact_head_sniper");
					}
				}
			}
			player.hud_damagefeedback.alpha = 1;
			player.hud_damagefeedback fadeOverTime(1);
			player.hud_damagefeedback.alpha = 0;
		}
		return 0;
	}
	return 0;
}

/*
	Name: function_41b85b21
	Namespace: namespace_449e30ba
	Checksum: 0x43A05D85
	Offset: 0xCF8
	Size: 0x580
	Parameters: 1
	Flags: None
	Line Number: 325
*/
function function_41b85b21(player)
{
	if(isdefined(level.var_afd0fe55) && level.var_afd0fe55)
	{
		player.var_5ace6d11 = 1;
		player.hud_damagefeedback.alpha = 0;
		player.hud_damagefeedback SetShader("robit_hitmarker_death", 64, 64);
		player.hud_damagefeedback.color = (1, 1, 1);
		str_damagemod = self.damageMod;
		w_damage = self.damageWeapon;
		w_damage = zm_weapons::get_nonalternate_weapon(w_damage);
		weaponClass = util::getWeaponClass(w_damage);
		if(isdefined(level.var_cd5928ef) && level.var_cd5928ef)
		{
			if(zm_utility::is_headshot(w_damage, self.damagelocation, str_damagemod))
			{
				if(weaponClass == "weapon_sniper")
				{
					player playlocalsound("prj_bullet_impact_head_sniper");
				}
				else if(isdefined(level.var_3293b92e) && level.var_3293b92e)
				{
					player playlocalsound("sk_hitmarker_headshot");
					continue;
				}
				player playlocalsound("vk_hitmarker_headshot");
				continue;
			}
			player playlocalsound("vk_hitmarker_kill");
			team = player.team;
			if(level.zombie_vars[team]["zombie_insta_kill"] == 1)
			{
				player playlocalsound("vk_hitmarker_instakill");
			}
			if(level.zombie_vars[team]["zombie_point_scalar"] == 2)
			{
				player playlocalsound("vk_hitmarker_doublepoints_kill");
			}
			gun = player GetCurrentWeapon();
			if(gun.weapClass == "spread")
			{
				player playlocalsound("hm_shotgun_flesh");
			}
			level.var_aa3c15d3--;
			if(level.var_3188d4da <= 1)
			{
				if(!(isdefined(level.dog_intermission) && level.dog_intermission))
				{
					if(self.targetname == "zombie_ochilon_boss" || self.targetname == "mechz" || self.targetname == "zombie_dog" || self.targetname == "zombie_dog_spawner" || self.targetname == "margwa" || self.targetname == "zombie_wasp" || self.script_noteworthy == "special_dog")
					{
					}
					else if(isdefined(level.var_3293b92e) && level.var_3293b92e)
					{
						player playlocalsound("sk_hitmarker_final");
						continue;
					}
					player playlocalsound("final_zombie_kill");
				}
				if(isdefined(level.dog_intermission) && level.dog_intermission)
				{
					player playlocalsound("hm_dog_kill");
					if(isdefined(level.var_6b2a2480) && level.var_6b2a2480)
					{
						player playlocalsound("final_zombie_kill");
					}
				}
			}
		}
		player.hud_damagefeedback ScaleOverTime(0.1, 32, 32);
		player.hud_damagefeedback.x = -32;
		player.hud_damagefeedback.y = -32;
		player.hud_damagefeedback MoveOverTime(0.1);
		player.hud_damagefeedback.x = -16;
		player.hud_damagefeedback.y = -16;
		player.hud_damagefeedback.alpha = 1;
		player.hud_damagefeedback fadeOverTime(0.9);
		player.hud_damagefeedback.alpha = 0;
		player thread function_41273c37();
		return 0;
	}
	return 0;
}

/*
	Name: function_41273c37
	Namespace: namespace_449e30ba
	Checksum: 0xFBE6E83A
	Offset: 0x1280
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 418
*/
function function_41273c37(player)
{
	wait(1.3);
	self.var_5ace6d11 = 0;
}

/*
	Name: function_96164ecb
	Namespace: namespace_449e30ba
	Checksum: 0x1DABA4EB
	Offset: 0x12A8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 434
*/
function function_96164ecb()
{
	level flag::wait_till("initial_blackscreen_passed");
	thread function_10d75cde();
	while(isdefined(level.var_afd0fe55) && level.var_afd0fe55)
	{
		level waittill("zombie_total_set");
		wait(0.05);
		level.var_aa3c15d3 = level.zombie_total + 2;
	}
}

/*
	Name: function_10d75cde
	Namespace: namespace_449e30ba
	Checksum: 0x81827E63
	Offset: 0x1328
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 456
*/
function function_10d75cde()
{
	level flag::wait_till("initial_blackscreen_passed");
	wait(5);
	while(1)
	{
		level.var_6b2a2480 = 0;
		level waittill("last_ai_down", e_last);
		level.var_6b2a2480 = 1;
		wait(1);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: Zombie_Counter
	Namespace: namespace_449e30ba
	Checksum: 0x8AE8A903
	Offset: 0x13A0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 481
*/
function Zombie_Counter()
{
	thread function_5a472f2f();
	while(1)
	{
		var_de17d71e = zombie_utility::get_current_zombie_count() + level.zombie_total;
		level.var_3188d4da = var_de17d71e;
		if(var_de17d71e == 0)
		{
			wait(1);
			continue;
		}
		wait(0.1);
	}
}

/*
	Name: function_5a472f2f
	Namespace: namespace_449e30ba
	Checksum: 0xCBA5E121
	Offset: 0x1420
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 507
*/
function function_5a472f2f()
{
	old_count = 0;
	while(1)
	{
		if(level.var_3188d4da == old_count)
		{
			wait(0.1);
			continue;
		}
		old_count = level.var_3188d4da;
		wait(0.1);
	}
}

