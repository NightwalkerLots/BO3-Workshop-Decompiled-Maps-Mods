#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_hb21_zm_weap_one_inch_punch;
#include scripts\zm\_hb21_zm_weap_staff_utility;
#include scripts\zm\_load;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_18deef8b;

/*
	Name: __init__sytem__
	Namespace: namespace_18deef8b
	Checksum: 0xECB82AE1
	Offset: 0x760
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 43
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_staff_water", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_18deef8b
	Checksum: 0xF502A630
	Offset: 0x7A0
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function __init__()
{
	clientfield::register("actor", "ai_freezeover", 12000, 1, "int");
	zm_utility::register_melee_weapon_for_level("t7_staff_water_melee");
	callback::on_spawned(&function_fac077c2);
	zm_spawner::register_zombie_damage_callback(&function_c2263c34);
	zm_spawner::register_zombie_death_event_callback(&staff_water_death_event);
}

/*
	Name: function_fac077c2
	Namespace: namespace_18deef8b
	Checksum: 0xCB185167
	Offset: 0x858
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_fac077c2()
{
	self thread function_6c7a70a0();
}

/*
	Name: function_6c7a70a0
	Namespace: namespace_18deef8b
	Checksum: 0xAF8730ED
	Offset: 0x880
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function function_6c7a70a0()
{
	self notify("watch_staff_water_fired");
	self endon("disconnect");
	self endon("watch_staff_water_fired");
	while(1)
	{
		self waittill("hash_9b46a224", e_projectile, str_weapon, var_16f4cf62);
		if(var_16f4cf62 >= 2)
		{
			e_projectile thread staff_water_position_source(self, var_16f4cf62 * 3, str_weapon);
		}
	}
}

/*
	Name: function_c2263c34
	Namespace: namespace_18deef8b
	Checksum: 0xBDD4A120
	Offset: 0x928
	Size: 0xC8
	Parameters: 13
	Flags: None
	Line Number: 117
*/
function function_c2263c34(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(self is_staff_water_damage() && str_mod != "MOD_RIFLE_BULLET")
	{
		self thread function_85c833b0(str_mod, w_weapon, e_player, n_amount);
		return 1;
	}
	return 0;
}

/*
	Name: function_85c833b0
	Namespace: namespace_18deef8b
	Checksum: 0xD0C6D6E8
	Offset: 0x9F8
	Size: 0x250
	Parameters: 4
	Flags: None
	Line Number: 137
*/
function function_85c833b0(str_mod, str_weapon, e_player, amount)
{
	self endon("death");
	n_damage = function_f79b01db(str_weapon.name, e_player.var_900bd247);
	is_upgraded = str_weapon.name == "t7_staff_water_upgraded";
	if(isdefined(self namespace_951345fe::function_8b325b40()) && self namespace_951345fe::function_8b325b40())
	{
		self thread function_3936e2b1(e_player, is_upgraded);
		return;
	}
	if(e_player zm_powerups::is_insta_kill_active())
	{
		self DoDamage(self.health, self.origin, e_player, e_player, 0, "MOD_RIFLE_BULLET", -1, str_weapon);
		return;
		continue;
	}
	self DoDamage(n_damage, self.origin, e_player, e_player, 0, "MOD_RIFLE_BULLET", -1, str_weapon);
	if(!isalive(self))
	{
		return;
	}
	if(isdefined(self.var_999b22c1) && self.var_999b22c1)
	{
		return;
	}
	if(isdefined(self.is_on_ice) && self.is_on_ice)
	{
		return;
	}
	if(isdefined(self.staff_hit) && self.staff_hit)
	{
		return;
	}
	self.is_on_ice = 1;
	self ASMSetAnimationRate(0.3);
	wait(RandomFloatRange(1.8, 2.3));
	self.is_on_ice = 0;
	self ASMSetAnimationRate(1);
	return;
}

/*
	Name: function_f79b01db
	Namespace: namespace_18deef8b
	Checksum: 0x8D3182CB
	Offset: 0xC50
	Size: 0xA0
	Parameters: 2
	Flags: None
	Line Number: 188
*/
function function_f79b01db(damageWeapon, var_16f4cf62)
{
	switch(damageWeapon)
	{
		case "t7_staff_water":
		{
			return 2050;
		}
		case "t7_staff_water_upgraded":
		{
			if(isdefined(var_16f4cf62) && var_16f4cf62 == 3)
			{
				return 20000;
			}
			else if(isdefined(var_16f4cf62) && var_16f4cf62 == 2)
			{
				return 11500;
				continue;
			}
			return 3300;
		}
		case "t7_one_inch_punch_upgraded":
		{
			return 11275;
		}
		default
		{
			return 0;
		}
	}
}

/*
	Name: staff_water_death_event
	Namespace: namespace_18deef8b
	Checksum: 0x2A56B572
	Offset: 0xCF8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 230
*/
function staff_water_death_event(attacker)
{
	if(self is_staff_water_damage())
	{
		self thread staff_water_kill_zombie(attacker, self.damageWeapon);
	}
}

/*
	Name: staff_water_position_source
	Namespace: namespace_18deef8b
	Checksum: 0x3E35D8D2
	Offset: 0xD48
	Size: 0x3D0
	Parameters: 3
	Flags: None
	Line Number: 248
*/
function staff_water_position_source(player, n_lifetime_sec, str_weapon)
{
	player endon("disconnect");
	self util::waittill_any("grenade_bounce", "stationary", "death", "explode");
	if(!isdefined(self))
	{
		return;
	}
	v_detonate = playerphysicstrace(self.origin + VectorScale((0, 0, 1), 80), self.origin - VectorScale((0, 0, 1), 1000));
	ent = spawn("script_origin", v_detonate);
	ent SetModel("tag_origin");
	ent PlayLoopSound("wpn_waterstaff_loop", 1);
	PlayFXOnTag("harry/staff/water/fx_staff_water_aoe", ent, "tag_origin");
	ent thread namespace_951345fe::function_e300dd3();
	self thread namespace_951345fe::function_880d6c62();
	for(i = 0; i < n_lifetime_sec; i++)
	{
		for(c = 0; c < 10; c++)
		{
			a_zombies = GetAISpeciesArray("axis", "all");
			_a317 = a_zombies;
			for(_k317 = getFirstArrayKey(_a317); isdefined(_k317); _k317 = getFirstArrayKey(_a317))
			{
				zombie = _a317[_k317];
				if(!(isdefined(zombie.is_on_ice) && zombie.is_on_ice))
				{
					if(DistanceSquared(v_detonate, zombie.origin) <= 30625)
					{
						b_trace_pass = BulletTracePassed(ent.origin, zombie GetTagOrigin("j_spine4"), 0, zombie);
						if(b_trace_pass && isdefined(zombie) && isalive(zombie))
						{
							zombie.var_afbd62a2 = 1;
							zombie DoDamage(1, zombie.origin, player, player, 0, "MOD_PROJECTILE", -1, str_weapon);
						}
					}
				}
			}
			wait(0.1);
		}
	}
	playsoundatposition("wpn_waterstaff_impact", ent.origin);
	ent delete();
}

/*
	Name: staff_water_kill_zombie
	Namespace: namespace_18deef8b
	Checksum: 0xD77247AB
	Offset: 0x1120
	Size: 0x258
	Parameters: 2
	Flags: None
	Line Number: 302
*/
function staff_water_kill_zombie(player, str_weapon)
{
	if(isdefined(self.var_999b22c1))
	{
		return;
	}
	if(isdefined(self.staff_hit) && self.staff_hit)
	{
		return;
	}
	self.marked_for_death = 1;
	if(isdefined(self.var_afbd62a2) && self.var_afbd62a2)
	{
		self clientfield::set("ai_freezeover", 1);
		if(!(isdefined(self.missingLegs) && self.missingLegs))
		{
			anims = RandomInt(4);
			if(anims == 0)
			{
				anim_to_play = "ai_zm_dlc5_zombie_death_icestaff_a";
			}
			else if(anims == 1)
			{
				anim_to_play = "ai_zm_dlc5_zombie_death_icestaff_b";
			}
			else if(anims == 2)
			{
				anim_to_play = "ai_zm_dlc5_zombie_death_icestaff_c";
			}
			else if(anims == 3)
			{
				anim_to_play = "ai_zm_dlc5_zombie_death_icestaff_d";
				continue;
			}
			anim_to_play = "ai_zm_dlc5_zombie_death_icestaff_e";
			continue;
		}
		anims = RandomInt(1);
		if(anims == 0)
		{
			anim_to_play = "ai_zombie_dlc4_crawl_freeze_death_01";
			continue;
		}
		anim_to_play = "ai_zombie_dlc4_crawl_freeze_death_02";
		self AnimScripted(anim_to_play, self.origin, self.angles, anim_to_play);
		wait(getanimlength(anim_to_play));
		continue;
	}
	self function_d3ba746e();
	if(isdefined(self))
	{
		self function_cb34a5d();
	}
	if(isdefined(self))
	{
		self DoDamage(self.health, self.origin, player, player, 0, "MOD_RIFLE_BULLET", -1, str_weapon);
	}
}

/*
	Name: function_d3ba746e
	Namespace: namespace_18deef8b
	Checksum: 0x7B9235A3
	Offset: 0x1380
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 371
*/
function function_d3ba746e()
{
	if(isdefined(self namespace_951345fe::function_8b325b40()) && self namespace_951345fe::function_8b325b40())
	{
		return;
	}
	self.var_999b22c1 = 1;
	self.staff_hit = 1;
	anim_to_play = undefined;
	if(!(isdefined(self.isdog) && self.isdog))
	{
		PlayFXOnTag("harry/staff/water/fx_staff_water_zombie_freeze", self, "j_spinelower");
		if(!(isdefined(self.missingLegs) && self.missingLegs))
		{
			anims = RandomInt(4);
			if(anims == 0)
			{
				anim_to_play = "ai_zombie_dlc4_freeze_death_a";
			}
			else if(anims == 1)
			{
				anim_to_play = "ai_zombie_dlc4_freeze_death_b";
			}
			else if(anims == 2)
			{
				anim_to_play = "ai_zombie_dlc4_freeze_death_c";
			}
			else if(anims == 3)
			{
				anim_to_play = "ai_zombie_dlc4_freeze_death_d";
				continue;
			}
			anim_to_play = "ai_zombie_dlc4_freeze_death_e";
			continue;
		}
		anims = RandomInt(1);
		if(anims == 0)
		{
			anim_to_play = "ai_zombie_dlc4_crawl_freeze_death_01";
			continue;
		}
		anim_to_play = "ai_zombie_dlc4_crawl_freeze_death_02";
	}
	if(!isdefined(anim_to_play))
	{
		return;
	}
	self AnimScripted(anim_to_play, self.origin, self.angles, anim_to_play);
	wait(4);
}

/*
	Name: function_cb34a5d
	Namespace: namespace_18deef8b
	Checksum: 0x9BFE3B9E
	Offset: 0x1570
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 432
*/
function function_cb34a5d()
{
	if(isdefined(self namespace_951345fe::function_8b325b40()) && self namespace_951345fe::function_8b325b40())
	{
		return;
	}
	if(isdefined(self))
	{
		v_fx = self GetTagOrigin("j_spinelower");
		playFX("harry/staff/water/fx_staff_water_impact", v_fx);
		playsoundatposition("wpn_waterstaff_impact", v_fx);
		self function_5fe69cf0("normal");
	}
}

/*
	Name: function_5fe69cf0
	Namespace: namespace_18deef8b
	Checksum: 0x551D18FA
	Offset: 0x1640
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 457
*/
function function_5fe69cf0(gib_type)
{
	gibArray = [];
	gibArray[gibArray.size] = level._ZOMBIE_GIB_PIECE_INDEX_ALL;
	self gib(gib_type, gibArray);
	self ghost();
	wait(0.4);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_3936e2b1
	Namespace: namespace_18deef8b
	Checksum: 0xD1058198
	Offset: 0x16D8
	Size: 0xF8
	Parameters: 2
	Flags: None
	Line Number: 480
*/
function function_3936e2b1(e_player, is_upgraded)
{
	self endon("death");
	if(isdefined(self.is_on_ice) && self.is_on_ice)
	{
		return;
	}
	self.is_on_ice = 1;
	if(is_upgraded)
	{
		self DoDamage(3300, self.origin, e_player, e_player, 0, "MOD_RIFLE_BULLET", -1, GetWeapon("t7_staff_water_upgraded"));
		continue;
	}
	self DoDamage(2050, self.origin, e_player, e_player, 0, "MOD_RIFLE_BULLET", -1, GetWeapon("t7_staff_water"));
	wait(1);
	self.is_on_ice = 0;
}

/*
	Name: is_staff_water_damage
	Namespace: namespace_18deef8b
	Checksum: 0xE56747D5
	Offset: 0x17D8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 508
*/
function is_staff_water_damage()
{
	if(isdefined(self.damageWeapon.name) && (self.damageWeapon.name == "t7_staff_water" || self.damageWeapon.name == "t7_staff_water_upgraded" || (self.damageWeapon.name == "t7_one_inch_punch_upgraded" && self.attacker namespace_7529ddc1::function_924e32bf() == "ice")))
	{
		return 1;
	}
	return 0;
}

