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
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_2cb7caef;

/*
	Name: __init__sytem__
	Namespace: namespace_2cb7caef
	Checksum: 0xAABD9EF8
	Offset: 0x678
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 43
*/
function autoexec __init__sytem__()
{
	system::register("kj_jzm_rewards", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_2cb7caef
	Checksum: 0x9ACF73B8
	Offset: 0x6C0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function __init__()
{
}

/*
	Name: __main__
	Namespace: namespace_2cb7caef
	Checksum: 0x4759FD20
	Offset: 0x6D0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function __main__()
{
	level thread function_9968d592();
	level thread function_8949c14e();
}

/*
	Name: function_220163bc
	Namespace: namespace_2cb7caef
	Checksum: 0x20F7740
	Offset: 0x710
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 88
*/
function function_220163bc()
{
	level endon("game_ended");
	self endon("disconnect");
	if(isdefined(self.var_9d6730be))
	{
		prestige = self.var_9d6730be;
		if(prestige > 0)
		{
			self function_b0b2bd5f(prestige);
		}
	}
	if(isdefined(self.var_1c43abc3))
	{
		rank = self.var_1c43abc3;
		if(rank <= 300)
		{
			self function_618471ed(rank);
		}
		else
		{
			self function_f570c64d(rank);
		}
	}
	level.perk_purchase_limit = level.perk_purchase_limit + self.perk_purchase_limit;
}

/*
	Name: function_b0b2bd5f
	Namespace: namespace_2cb7caef
	Checksum: 0xD3AC68A
	Offset: 0x800
	Size: 0x308
	Parameters: 1
	Flags: None
	Line Number: 125
*/
function function_b0b2bd5f(prestige)
{
	if(prestige >= 5)
	{
		self.var_15511cdf = self.var_15511cdf + 30;
	}
	if(prestige >= 6)
	{
		self zm_weapons::weapon_give(GetWeapon("hero_annihilator"), undefined, undefined, 1);
		wait(0.25);
	}
	if(prestige >= 7)
	{
		self.var_53d81061 = self.var_53d81061 - 3;
		if(!isdefined(self.var_1f28099c))
		{
			self.var_1f28099c = [];
		}
		else if(!IsArray(self.var_1f28099c))
		{
			self.var_1f28099c = Array(self.var_1f28099c);
		}
		self.var_1f28099c[self.var_1f28099c.size] = "specialty_unlimitedsprint";
	}
	if(prestige >= 9)
	{
		self thread function_495f18c1();
		self.var_dd7af6c9 = self.var_dd7af6c9 + 3;
	}
	if(prestige >= 10)
	{
		self.var_15511cdf = self.var_15511cdf + 60;
		if(isdefined(level.weaponRiotshield))
		{
			if(level.weaponRiotshield == "zod_riotshield")
			{
				self zm_weapons::weapon_give(GetWeapon("zod_riotshield"), undefined, undefined, 1);
				wait(0.25);
			}
			else if(level.weaponRiotshield == "dragonshield")
			{
				self zm_weapons::weapon_give(GetWeapon("dragonshield"), undefined, undefined, 1);
				wait(0.25);
			}
			else if(level.weaponRiotshield == "tomb_shield")
			{
				self zm_weapons::weapon_give(GetWeapon("tomb_shield"), undefined, undefined, 1);
				wait(0.25);
			}
			else if(level.weaponRiotshield == "castle_riotshield")
			{
				self zm_weapons::weapon_give(GetWeapon("castle_riotshield"), undefined, undefined, 1);
				wait(0.25);
			}
			else if(level.weaponRiotshield == "island_riotshield")
			{
				self zm_weapons::weapon_give(GetWeapon("island_riotshield"), undefined, undefined, 1);
				wait(0.25);
			}
		}
	}
}

/*
	Name: function_618471ed
	Namespace: namespace_2cb7caef
	Checksum: 0xF626FE0C
	Offset: 0xB10
	Size: 0x368
	Parameters: 1
	Flags: None
	Line Number: 198
*/
function function_618471ed(rank)
{
	if(rank >= 300)
	{
		if(!isdefined(self.var_1f28099c))
		{
			self.var_1f28099c = [];
		}
		else if(!IsArray(self.var_1f28099c))
		{
			self.var_1f28099c = Array(self.var_1f28099c);
		}
		self.var_1f28099c[self.var_1f28099c.size] = "specialty_fastweaponswitch";
		wait(0.05);
	}
	if(rank >= 220)
	{
		self zm_weapons::weapon_give(GetWeapon("bouncingbetty"), undefined, undefined, 1);
		wait(0.25);
	}
	if(rank >= 200)
	{
		if(!isdefined(self.var_1f28099c))
		{
			self.var_1f28099c = [];
		}
		else if(!IsArray(self.var_1f28099c))
		{
			self.var_1f28099c = Array(self.var_1f28099c);
		}
		self.var_1f28099c[self.var_1f28099c.size] = "specialty_fastmantle";
	}
	if(rank >= 180)
	{
		self.var_dd7af6c9++;
	}
	if(rank >= 160)
	{
		if(!isdefined(self.var_1f28099c))
		{
			self.var_1f28099c = [];
		}
		else if(!IsArray(self.var_1f28099c))
		{
			self.var_1f28099c = Array(self.var_1f28099c);
		}
		self.var_1f28099c[self.var_1f28099c.size] = "specialty_sprintfire";
		wait(0.05);
	}
	if(rank >= 140)
	{
		self.var_15511cdf = self.var_15511cdf + 10;
	}
	if(rank >= 90)
	{
		self.var_53d81061 = self.var_53d81061 - 3;
	}
	if(rank >= 60)
	{
		self.var_dd7af6c9++;
	}
	if(rank >= 50)
	{
		if(!isdefined(self.var_1f28099c))
		{
			self.var_1f28099c = [];
		}
		else if(!IsArray(self.var_1f28099c))
		{
			self.var_1f28099c = Array(self.var_1f28099c);
		}
		self.var_1f28099c[self.var_1f28099c.size] = "specialty_fastmeleerecovery";
	}
	if(rank >= 40)
	{
		self.perk_purchase_limit++;
	}
	if(rank >= 20)
	{
		self.var_15511cdf = self.var_15511cdf + 10;
	}
	self function_83a6d6f();
	self function_82362181();
	self function_25593bd9();
}

/*
	Name: function_f570c64d
	Namespace: namespace_2cb7caef
	Checksum: 0x26F3A019
	Offset: 0xE80
	Size: 0x608
	Parameters: 1
	Flags: None
	Line Number: 294
*/
function function_f570c64d(rank)
{
	if(rank >= 980)
	{
		self.var_31fb8f37 = 1;
		self notify("hash_31fb8f37");
		wait(0.05);
	}
	if(rank >= 960)
	{
		if(!isdefined(self.var_1f28099c))
		{
			self.var_1f28099c = [];
		}
		else if(!IsArray(self.var_1f28099c))
		{
			self.var_1f28099c = Array(self.var_1f28099c);
		}
		self.var_1f28099c[self.var_1f28099c.size] = "specialty_stalker";
	}
	if(rank >= 940)
	{
		self.var_bcb71243 = 1;
	}
	if(rank >= 920)
	{
		if(!isdefined(self.var_1f28099c))
		{
			self.var_1f28099c = [];
		}
		else if(!IsArray(self.var_1f28099c))
		{
			self.var_1f28099c = Array(self.var_1f28099c);
		}
		self.var_1f28099c[self.var_1f28099c.size] = "specialty_sprintgrenadetactical";
		wait(0.05);
	}
	if(rank >= 900)
	{
		self.var_d43adbdf = 1;
	}
	if(rank >= 860)
	{
		self.var_15511cdf = self.var_15511cdf + 10;
	}
	if(rank >= 840)
	{
		if(!isdefined(self.var_1f28099c))
		{
			self.var_1f28099c = [];
		}
		else if(!IsArray(self.var_1f28099c))
		{
			self.var_1f28099c = Array(self.var_1f28099c);
		}
		self.var_1f28099c[self.var_1f28099c.size] = "specialty_sprintrecovery";
	}
	if(rank >= 820)
	{
		self.perk_purchase_limit++;
	}
	if(rank >= 780)
	{
		if(!isdefined(self.var_1f28099c))
		{
			self.var_1f28099c = [];
		}
		else if(!IsArray(self.var_1f28099c))
		{
			self.var_1f28099c = Array(self.var_1f28099c);
		}
		self.var_1f28099c[self.var_1f28099c.size] = "specialty_fastads";
		wait(0.05);
	}
	if(rank >= 760)
	{
		self.var_dd7af6c9++;
	}
	if(rank >= 740)
	{
		self.var_15511cdf = self.var_15511cdf + 10;
	}
	if(rank >= 720)
	{
		if(!isdefined(self.var_1f28099c))
		{
			self.var_1f28099c = [];
		}
		else if(!IsArray(self.var_1f28099c))
		{
			self.var_1f28099c = Array(self.var_1f28099c);
		}
		self.var_1f28099c[self.var_1f28099c.size] = "specialty_sprintrecovery";
	}
	if(rank >= 660)
	{
		self.var_15511cdf = self.var_15511cdf + 10;
	}
	if(rank >= 640)
	{
		self.var_53d81061 = self.var_53d81061 - 3;
	}
	if(rank >= 600)
	{
		self.var_dd7af6c9++;
	}
	if(rank >= 560)
	{
		if(!isdefined(self.var_1f28099c))
		{
			self.var_1f28099c = [];
		}
		else if(!IsArray(self.var_1f28099c))
		{
			self.var_1f28099c = Array(self.var_1f28099c);
		}
		self.var_1f28099c[self.var_1f28099c.size] = "specialty_fastequipmentuse";
		wait(0.05);
	}
	if(rank >= 540)
	{
		self.perk_purchase_limit++;
	}
	if(rank >= 500)
	{
		self.var_71a2ebb6 = 1;
	}
	if(rank >= 480)
	{
		self.var_dd7af6c9++;
	}
	if(rank >= 460)
	{
		if(!isdefined(self.var_1f28099c))
		{
			self.var_1f28099c = [];
		}
		else if(!IsArray(self.var_1f28099c))
		{
			self.var_1f28099c = Array(self.var_1f28099c);
		}
		self.var_1f28099c[self.var_1f28099c.size] = "specialty_sprintequipment";
	}
	if(rank >= 360)
	{
		self.var_15511cdf = self.var_15511cdf + 10;
	}
	if(rank >= 340)
	{
		if(!isdefined(self.var_1f28099c))
		{
			self.var_1f28099c = [];
		}
		else if(!IsArray(self.var_1f28099c))
		{
			self.var_1f28099c = Array(self.var_1f28099c);
		}
		self.var_1f28099c[self.var_1f28099c.size] = "specialty_sprintgrenadelethal";
	}
	if(rank >= 320)
	{
		self.perk_purchase_limit++;
	}
	self function_618471ed(rank);
	return;
}

/*
	Name: function_83a6d6f
	Namespace: namespace_2cb7caef
	Checksum: 0x99B3E2DB
	Offset: 0x1490
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 471
*/
function function_83a6d6f()
{
	if(isdefined(self.var_1f28099c) && self.var_1f28099c.size > 0)
	{
		foreach(specialty in self.var_1f28099c)
		{
			self setPerk(specialty);
		}
		return;
	}
}

/*
	Name: function_d8a2d037
	Namespace: namespace_2cb7caef
	Checksum: 0x71702533
	Offset: 0x1548
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 493
*/
function function_d8a2d037()
{
	if(isdefined(self.var_ce402c11) && isdefined(self.var_15511cdf))
	{
		self.n_player_health_boost = self.var_15511cdf;
		self zm_perks::perk_set_max_health_if_jugg("health_reboot", 0, 1);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e4d31720
	Namespace: namespace_2cb7caef
	Checksum: 0xD56A3339
	Offset: 0x15A0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 514
*/
function function_e4d31720()
{
	weapon = self GetCurrentWeapon();
	if(isdefined(weapon))
	{
		self giveMaxAmmo(weapon);
	}
}

/*
	Name: function_8949c14e
	Namespace: namespace_2cb7caef
	Checksum: 0xAEB5527
	Offset: 0x15F8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 533
*/
function function_8949c14e()
{
	wait(0.05);
	if(isdefined(level.player_damage_callbacks))
	{
		foreach(player in GetPlayers())
		{
			if(isdefined(player.var_bcb71243))
			{
				Array::add(level.player_damage_callbacks, &function_278d19c, 0);
				break;
			}
		}
	}
}

/*
	Name: function_278d19c
	Namespace: namespace_2cb7caef
	Checksum: 0x26EE57C0
	Offset: 0x16D8
	Size: 0x90
	Parameters: 10
	Flags: None
	Line Number: 559
*/
function function_278d19c(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!isdefined(sMeansOfDeath))
	{
		return undefined;
	}
	if(sMeansOfDeath == "MOD_FALLING" || sMeansOfDeath == "MOD_IMPACT")
	{
		iDamage = 0;
	}
	return iDamage;
}

/*
	Name: function_9968d592
	Namespace: namespace_2cb7caef
	Checksum: 0xD21A6DDB
	Offset: 0x1770
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 582
*/
function function_9968d592()
{
	level endon("game_ended");
	self endon("disconnect");
	level waittill("between_round_over");
	if(isdefined(level._custom_perks) && !isdefined(level._custom_perks["specialty_widowswine"]))
	{
		return;
	}
	if(isdefined(level._custom_perks) && !isdefined(level._custom_perks["specialty_phdflopper"]))
	{
		thread zm_perks::register_perk_damage_override_func(&function_52500da2);
	}
}

/*
	Name: function_52500da2
	Namespace: namespace_2cb7caef
	Checksum: 0xC9CA5D67
	Offset: 0x1810
	Size: 0xE8
	Parameters: 10
	Flags: None
	Line Number: 607
*/
function function_52500da2(e_inflictor, e_attacker, n_damage, var_df862ae6, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_ed5eb273)
{
	if(!self hasPerk("specialty_widowswine") && !isdefined(self.var_71a2ebb6))
	{
		return undefined;
	}
	switch(str_means_of_death)
	{
		case "MOD_EXPLOSIVE":
		case "MOD_EXPLOSIVE_SPLASH":
		case "MOD_FALLING":
		case "MOD_GRENADE":
		case "MOD_GRENADE_SPLASH":
		case "MOD_PROJECTILE":
		case "MOD_PROJECTILE_SPLASH":
		{
			return 0;
			break;
		}
		default
		{
		}
	}
	return undefined;
}

/*
	Name: function_495f18c1
	Namespace: namespace_2cb7caef
	Checksum: 0xD2FCC9F0
	Offset: 0x1900
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 643
*/
function function_495f18c1()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("player_downed");
		wait(1);
		if(isdefined(self) && self laststand::player_is_in_laststand())
		{
			thread function_96341151(self);
		}
	}
}

/*
	Name: function_96341151
	Namespace: namespace_2cb7caef
	Checksum: 0xAA67EF32
	Offset: 0x1970
	Size: 0x190
	Parameters: 1
	Flags: None
	Line Number: 668
*/
function function_96341151(downed_player)
{
	level endon("game_ended");
	downed_player endon("disconnect");
	downed_player endon("player_revived");
	downed_player endon("bled_out");
	revived = 0;
	players = GetPlayers();
	while(revived == 1)
	{
		break;
		foreach(player in players)
		{
			if(isdefined(downed_player.reviveTrigger) && isdefined(downed_player.reviveTrigger.beingRevived) && downed_player.reviveTrigger.beingRevived)
			{
				if(downed_player != player && !revived)
				{
					player EnableInvulnerability();
					player thread function_1c9cad63();
					revived = 1;
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_1c9cad63
	Namespace: namespace_2cb7caef
	Checksum: 0x4CA92BD2
	Offset: 0x1B08
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 705
*/
function function_1c9cad63()
{
	wait(2);
	if(isdefined(self))
	{
		self DisableInvulnerability();
	}
}

/*
	Name: function_265e80b7
	Namespace: namespace_2cb7caef
	Checksum: 0xE8F799CF
	Offset: 0x1B38
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 724
*/
function function_265e80b7()
{
	self.var_ab096b62 = 1;
}

/*
	Name: function_39aad81b
	Namespace: namespace_2cb7caef
	Checksum: 0x65CDEC87
	Offset: 0x1B50
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 739
*/
function function_39aad81b()
{
	self.n_bleedout_time_multiplier = 2;
}

/*
	Name: function_25593bd9
	Namespace: namespace_2cb7caef
	Checksum: 0x4D0A7F61
	Offset: 0x1B68
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 754
*/
function function_25593bd9()
{
	if(GetPlayers().size > 1)
	{
		return;
	}
	else
	{
		self thread function_2f9076ae();
		return;
	}
}

/*
	Name: function_2f9076ae
	Namespace: namespace_2cb7caef
	Checksum: 0xC8F9580A
	Offset: 0x1BB0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 777
*/
function function_2f9076ae()
{
	if(isdefined(level.solo_lives_given))
	{
		if(isdefined(self.var_53d81061))
		{
			level.solo_lives_given = self.var_53d81061;
			var_70eb194a = level.solo_lives_given * -1 + 3;
		}
	}
}

/*
	Name: function_82362181
	Namespace: namespace_2cb7caef
	Checksum: 0x4E7C5B1F
	Offset: 0x1C08
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 799
*/
function function_82362181()
{
	if(!isdefined(self.var_331f639e))
	{
		return;
	}
	if(isdefined(self.var_dd7af6c9) && self.var_dd7af6c9 < 1)
	{
		return;
	}
	self.var_c2d0b318 = Array();
	self.var_6579c892 = Array();
	self thread function_f92d0957();
	self thread function_37f9bf7d();
}

/*
	Name: function_f92d0957
	Namespace: namespace_2cb7caef
	Checksum: 0x1BA03282
	Offset: 0x1CA8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 825
*/
function function_f92d0957()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("perk_purchased", str_perk);
		if(isdefined(str_perk) && str_perk != "specialty_quickrevive")
		{
			if(!isdefined(self.var_c2d0b318))
			{
				self.var_c2d0b318 = [];
			}
			else if(!IsArray(self.var_c2d0b318))
			{
				self.var_c2d0b318 = Array(self.var_c2d0b318);
			}
			self.var_c2d0b318[self.var_c2d0b318.size] = str_perk;
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_37f9bf7d
	Namespace: namespace_2cb7caef
	Checksum: 0xB3CD8850
	Offset: 0x1D70
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 859
*/
function function_37f9bf7d()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("player_revived", reviver);
		wait(0.5);
		if(isdefined(self.var_c2d0b318) && self.var_c2d0b318.size > 0)
		{
			self function_98b0b50f();
			self.var_c2d0b318 = Array();
			self function_9cb67f0c();
		}
	}
}

/*
	Name: function_98b0b50f
	Namespace: namespace_2cb7caef
	Checksum: 0x721EC2E0
	Offset: 0x1E18
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 886
*/
function function_98b0b50f()
{
	count = 0;
	foreach(str_perk in self.var_c2d0b318)
	{
		if(isdefined(self.var_dd7af6c9) && count < self.var_dd7af6c9)
		{
			count++;
			self zm_perks::give_perk(str_perk);
			wait(0.1);
			if(!isdefined(self.var_6579c892))
			{
				self.var_6579c892 = [];
			}
			else if(!IsArray(self.var_6579c892))
			{
				self.var_6579c892 = Array(self.var_6579c892);
			}
			self.var_6579c892[self.var_6579c892.size] = str_perk;
		}
	}
}

/*
	Name: function_9cb67f0c
	Namespace: namespace_2cb7caef
	Checksum: 0x1FE57579
	Offset: 0x1F58
	Size: 0xFC
	Parameters: 0
	Flags: None
	Line Number: 919
*/
function function_9cb67f0c()
{
	foreach(str_perk in self.var_6579c892)
	{
		if(!isdefined(self.var_c2d0b318))
		{
			self.var_c2d0b318 = [];
		}
		else if(!IsArray(self.var_c2d0b318))
		{
			self.var_c2d0b318 = Array(self.var_c2d0b318);
		}
		self.var_c2d0b318[self.var_c2d0b318.size] = str_perk;
	}
	self.var_6579c892 = Array();
}

