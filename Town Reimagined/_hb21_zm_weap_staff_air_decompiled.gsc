#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
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

#namespace namespace_6d0a1fae;

/*
	Name: __init__sytem__
	Namespace: namespace_6d0a1fae
	Checksum: 0x63458652
	Offset: 0x8C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 41
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_staff_air", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_6d0a1fae
	Checksum: 0x91BD3C32
	Offset: 0x908
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function __init__()
{
	callback::on_spawned(&function_6b4a2c4b);
	zm_utility::register_melee_weapon_for_level("t7_staff_air_melee");
	zm_spawner::register_zombie_damage_callback(&staff_air_zombie_damage_response);
	zm_spawner::register_zombie_death_event_callback(&staff_air_death_event);
	return;
}

/*
	Name: function_6b4a2c4b
	Namespace: namespace_6d0a1fae
	Checksum: 0x37A9AB95
	Offset: 0x990
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function function_6b4a2c4b()
{
	self thread function_cd18f765();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_cd18f765
	Namespace: namespace_6d0a1fae
	Checksum: 0x9052EF72
	Offset: 0x9B8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function function_cd18f765()
{
	self notify("watch_staff_air_fired");
	self endon("disconnect");
	self endon("watch_staff_air_fired");
	while(1)
	{
		self waittill("hash_aef5ca55", e_projectile, str_weapon, var_16f4cf62);
		self function_3a804a46(str_weapon, var_16f4cf62);
		if(var_16f4cf62 >= 2)
		{
			e_projectile thread staff_air_find_source(str_weapon.name, self, var_16f4cf62);
			continue;
		}
		e_projectile thread namespace_951345fe::function_880d6c62();
	}
}

/*
	Name: staff_air_zombie_damage_response
	Namespace: namespace_6d0a1fae
	Checksum: 0x61D99325
	Offset: 0xA98
	Size: 0xB8
	Parameters: 13
	Flags: None
	Line Number: 120
*/
function staff_air_zombie_damage_response(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(self is_staff_air_damage())
	{
		self thread function_128bdffd(str_mod, w_weapon, e_player, n_amount);
		return 1;
	}
	return 0;
}

/*
	Name: function_128bdffd
	Namespace: namespace_6d0a1fae
	Checksum: 0xF49C73E1
	Offset: 0xB58
	Size: 0x98
	Parameters: 4
	Flags: None
	Line Number: 140
*/
function function_128bdffd(mod, damageWeapon, player, amount)
{
	player endon("disconnect");
	if(!isalive(self))
	{
		return;
	}
	if(!(isdefined(self namespace_951345fe::function_8b325b40()) && self namespace_951345fe::function_8b325b40()))
	{
		self thread function_d3ecdb82(damageWeapon, player);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: staff_air_death_event
	Namespace: namespace_6d0a1fae
	Checksum: 0x5682AFA7
	Offset: 0xBF8
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 165
*/
function staff_air_death_event(attacker)
{
	if(is_staff_air_damage() && self.damageMod != "MOD_MELEE")
	{
		if(isdefined(self namespace_951345fe::function_8b325b40()) && self namespace_951345fe::function_8b325b40())
		{
			return 0;
		}
		self thread function_5bf68c40(attacker);
		return 1;
	}
	return 0;
}

/*
	Name: function_5bf68c40
	Namespace: namespace_6d0a1fae
	Checksum: 0xBFDFB492
	Offset: 0xC90
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 189
*/
function function_5bf68c40(attacker)
{
	self thread zombie_utility::zombie_eye_glow_stop();
	if(isdefined(level.ragdoll_limit_check) && ![[level.ragdoll_limit_check]]())
	{
		level thread staff_air_gib(self);
		continue;
	}
	self StartRagdoll();
	self LaunchRagdoll(function_8d9f42ba(attacker, self));
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3a804a46
	Namespace: namespace_6d0a1fae
	Checksum: 0xF9E7B98D
	Offset: 0xD38
	Size: 0x278
	Parameters: 2
	Flags: None
	Line Number: 213
*/
function function_3a804a46(str_weapon, var_16f4cf62)
{
	n_damage = function_3a2d170a(str_weapon.name, var_16f4cf62);
	if(str_weapon.name == "t7_staff_air_upgraded")
	{
		n_fov = 60;
		n_range = 600;
		continue;
	}
	n_fov = 45;
	n_range = 400;
	fire_angles = self getPlayerAngles();
	fire_origin = self GetPlayerCameraPos();
	a_targets = GetAISpeciesArray("axis", "all");
	a_targets = util::get_array_of_closest(self.origin, a_targets, undefined, 12, n_range);
	_a675 = a_targets;
	for(_k675 = getFirstArrayKey(_a675); isdefined(_k675); _k675 = getFirstArrayKey(_a675))
	{
		target = _a675[_k675];
		if(isai(target))
		{
			if(util::within_fov(fire_origin, fire_angles, target GetTagOrigin("j_spine4"), cos(n_fov)))
			{
				if(self zm_powerups::is_insta_kill_active())
				{
					n_damage = target.health;
				}
				target DoDamage(n_damage, target.origin, self, self, 0, "MOD_IMPACT", -1, str_weapon);
			}
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: staff_air_find_source
	Namespace: namespace_6d0a1fae
	Checksum: 0x8EF5E6E7
	Offset: 0xFB8
	Size: 0x228
	Parameters: 3
	Flags: None
	Line Number: 258
*/
function staff_air_find_source(str_weapon, player, var_16f4cf62)
{
	self util::waittill_any("grenade_bounce", "stationary", "death", "explode");
	if(!isdefined(self))
	{
		return;
	}
	v_pos = self.origin;
	ent = spawn("script_origin", v_pos);
	ent SetModel("tag_origin");
	ent thread namespace_951345fe::function_e300dd3();
	self namespace_951345fe::function_880d6c62();
	playsoundatposition("wpn_airstaff_tornado_impact", ent.origin);
	ent PlayLoopSound("wpn_airstaff_proj_loop", 1);
	PlayFXOnTag("harry/staff/air/fx_staff_wind_aoe", ent, "tag_origin");
	n_lifetime_sec = 10;
	for(i = 0; i < n_lifetime_sec; i++)
	{
		for(c = 0; c < 10; c++)
		{
			ent function_e8816da2(var_16f4cf62, str_weapon, player);
			wait(0.1);
		}
	}
	playsoundatposition("wpn_airstaff_tornado_impact", ent.origin);
	ent delete();
	return;
}

/*
	Name: function_e8816da2
	Namespace: namespace_6d0a1fae
	Checksum: 0xF79FFD3B
	Offset: 0x11E8
	Size: 0x338
	Parameters: 3
	Flags: None
	Line Number: 297
*/
function function_e8816da2(var_16f4cf62, str_weapon, player)
{
	self endon("death");
	n_range = function_acea1e84(var_16f4cf62);
	self.n_charge_level = var_16f4cf62;
	a_zombies = staff_air_zombie_range(self.origin, n_range);
	a_zombies = util::get_array_of_closest(self.origin, a_zombies);
	i = 0;
	while(i < a_zombies.size)
	{
		if(!isdefined(a_zombies[i]) || a_zombies[i].ai_state != "zombie_think" || (isdefined(a_zombies[i] namespace_951345fe::function_8b325b40()) && a_zombies[i] namespace_951345fe::function_8b325b40()) || (isdefined(a_zombies[i].staff_hit) && a_zombies[i].staff_hit) || (isdefined(a_zombies[i]._whirlwind_attract_anim) && a_zombies[i]._whirlwind_attract_anim))
		{
			i++;
			continue;
			continue;
		}
		v_offset = (10, 10, 32);
		trace = BulletTracePassed(self.origin + v_offset, a_zombies[i].origin + v_offset, 0, 0);
		if(!trace || !isdefined(a_zombies[i]) || !isalive(a_zombies[i]))
		{
			i++;
			continue;
			continue;
		}
		v_offset = (-10, -10, 64);
		trace = BulletTracePassed(self.origin + v_offset, a_zombies[i].origin + v_offset, 0, 0);
		if(!trace || !isdefined(a_zombies[i]) || !isalive(a_zombies[i]))
		{
			i++;
			continue;
			continue;
		}
		a_zombies[i] thread function_6ebf0349(self, str_weapon, player, var_16f4cf62);
		wait(0.5);
		i++;
	}
}

/*
	Name: function_6ebf0349
	Namespace: namespace_6d0a1fae
	Checksum: 0xBC2E6957
	Offset: 0x1528
	Size: 0x118
	Parameters: 4
	Flags: None
	Line Number: 345
*/
function function_6ebf0349(e_whirlwind, str_weapon, player, var_16f4cf62)
{
	if(isdefined(self.e_linker))
	{
		return;
	}
	if(isdefined(self.staff_hit) && self.staff_hit)
	{
		return;
	}
	self.staff_hit = 1;
	self function_2274fffe(e_whirlwind, var_16f4cf62);
	if(isdefined(self) && isdefined(e_whirlwind))
	{
		self DoDamage(self.health, self.origin, player, player, 0, "MOD_IMPACT", -1, GetWeapon(str_weapon));
		level thread staff_air_gib(self);
	}
	if(isdefined(self))
	{
		self StopAnimScripted(0.3);
	}
}

/*
	Name: function_2274fffe
	Namespace: namespace_6d0a1fae
	Checksum: 0x475523DA
	Offset: 0x1648
	Size: 0x2D0
	Parameters: 2
	Flags: None
	Line Number: 378
*/
function function_2274fffe(e_whirlwind, var_16f4cf62)
{
	if(isdefined(self.e_linker))
	{
		return;
	}
	self.e_linker = spawn("script_model", (0, 0, 0));
	self.e_linker SetModel("tag_origin");
	self.e_linker.origin = self.origin;
	self.e_linker.angles = VectorToAngles(self.origin - e_whirlwind.origin);
	self LinkTo(self.e_linker);
	if(isdefined(e_whirlwind))
	{
		n_dist_sq = Distance2DSquared(e_whirlwind.origin, self.origin);
	}
	n_fling_range_sq = 900;
	wait(0.05);
	while(isalive(self) && n_dist_sq > n_fling_range_sq && isdefined(e_whirlwind) && (!(isdefined(self namespace_951345fe::function_8b325b40()) && self namespace_951345fe::function_8b325b40())))
	{
		n_dist_sq = Distance2DSquared(e_whirlwind.origin, self.origin);
		if(isdefined(self.ai_state) && self.ai_state == "zombie_think")
		{
			b_supercharged = var_16f4cf62 == 3;
			n_movetime = 1;
			if(b_supercharged)
			{
				n_movetime = 0.5;
			}
			self thread function_ae9da9ff(e_whirlwind, b_supercharged);
			self.e_linker moveto(e_whirlwind.origin, n_movetime);
		}
		wait(0.05);
	}
	self.staff_hit = undefined;
	self.e_linker Unlink();
	self.e_linker delete();
	self notify("reached_whirlwind");
	self playsound("wpn_airstaff_tornado_impact");
}

/*
	Name: function_acea1e84
	Namespace: namespace_6d0a1fae
	Checksum: 0x535B470D
	Offset: 0x1920
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 428
*/
function function_acea1e84(n_charge)
{
	switch(n_charge)
	{
		case 1:
		{
			n_range = 100;
			break;
		}
		default
		{
			n_range = 250;
			break;
		}
	}
	return n_range;
}

/*
	Name: staff_air_zombie_range
	Namespace: namespace_6d0a1fae
	Checksum: 0x1F14E487
	Offset: 0x1980
	Size: 0x188
	Parameters: 2
	Flags: None
	Line Number: 456
*/
function staff_air_zombie_range(v_source, n_range)
{
	a_enemies = [];
	a_zombies = GetAISpeciesArray("axis", "all");
	a_zombies = util::get_array_of_closest(v_source, a_zombies);
	n_range_sq = n_range * n_range;
	if(isdefined(a_zombies))
	{
		i = 0;
		while(i < a_zombies.size)
		{
			if(!isdefined(a_zombies[i]))
			{
				i++;
				continue;
				continue;
			}
			v_zombie_pos = a_zombies[i].origin;
			if(isdefined(a_zombies[i].staff_hit) && a_zombies[i].staff_hit == 1)
			{
				i++;
				continue;
			}
			else if(DistanceSquared(v_source, v_zombie_pos) > n_range_sq)
			{
				i++;
				continue;
				continue;
			}
			a_enemies[a_enemies.size] = a_zombies[i];
			i++;
		}
	}
	return a_enemies;
}

/*
	Name: function_8d9f42ba
	Namespace: namespace_6d0a1fae
	Checksum: 0x60592A15
	Offset: 0x1B10
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 502
*/
function function_8d9f42ba(e_attacker, ai_target)
{
	v_launch = VectorNormalize(ai_target.origin - e_attacker.origin) * randomIntRange(125, 150) + (0, 0, randomIntRange(75, 150));
	return v_launch;
}

/*
	Name: staff_air_gib
	Namespace: namespace_6d0a1fae
	Checksum: 0xF0068E19
	Offset: 0x1BA8
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 518
*/
function staff_air_gib(ai_zombie)
{
	if(math::cointoss())
	{
		ai_zombie thread namespace_951345fe::zombie_gib_all();
	}
	ai_zombie thread namespace_951345fe::zombie_gib_guts();
}

/*
	Name: function_d3ecdb82
	Namespace: namespace_6d0a1fae
	Checksum: 0xCBDF80DD
	Offset: 0x1C00
	Size: 0x630
	Parameters: 2
	Flags: None
	Line Number: 537
*/
function function_d3ecdb82(w_weapon, e_player)
{
	self endon("death");
	if(!isalive(self))
	{
		return;
	}
	if(isdefined(self namespace_951345fe::function_8b325b40()) && self namespace_951345fe::function_8b325b40())
	{
		return;
	}
	if(isdefined(self.isdog) && self.isdog)
	{
		return;
	}
	if(!isdefined(self.ai_state) || self.ai_state != "zombie_think")
	{
		return;
	}
	if(isdefined(self.marked_for_death) && self.marked_for_death)
	{
		return;
	}
	if(isdefined(self.staff_hit) && self.staff_hit)
	{
		return;
	}
	if(isdefined(self.var_550f1824) && self.var_550f1824)
	{
		return;
	}
	self.var_550f1824 = 1;
	if(self.damageyaw <= -135 || self.damageyaw >= 135)
	{
		if(isdefined(self.missingLegs) && self.missingLegs)
		{
			anims = RandomInt(2);
			if(anims == 0)
			{
				fallAnim = "ai_zombie_thundergun_hit_armslegsforward";
			}
			else if(anims == 1)
			{
				fallAnim = "ai_zombie_thundergun_hit_doublebounce";
				continue;
			}
			fallAnim = "ai_zombie_thundergun_hit_forwardtoface";
			continue;
		}
		anims = RandomInt(6);
		if(anims == 0)
		{
			fallAnim = "ai_zombie_thundergun_hit_armslegsforward";
		}
		else if(anims == 1)
		{
			fallAnim = "ai_zombie_thundergun_hit_doublebounce";
		}
		else if(anims == 2)
		{
			fallAnim = "ai_zombie_thundergun_hit_upontoback";
		}
		else if(anims == 3)
		{
			fallAnim = "ai_zombie_thundergun_hit_forwardtoface";
		}
		else if(anims == 4)
		{
			fallAnim = "ai_zombie_thundergun_hit_flatonback";
		}
		else if(anims == 5)
		{
			fallAnim = "ai_zombie_thundergun_hit_faceplant";
			continue;
		}
		fallAnim = "ai_zombie_thundergun_hit_deadfallknee";
		if(fallAnim == "ai_zombie_thundergun_hit_deadfallknee" || fallAnim == "ai_zombie_thundergun_hit_forwardtoface" || fallAnim == "ai_zombie_thundergun_hit_faceplant")
		{
			if(self.zombie_move_speed == "sprint")
			{
				getupAnim = "ai_zombie_thundergun_sprinter_getup_a";
			}
			else if(self.zombie_move_speed == "run")
			{
				getupAnim = "ai_zombie_thundergun_getup_quick_a";
				continue;
			}
			getupAnim = "ai_zombie_thundergun_getup_a";
		}
		else if(self.zombie_move_speed == "sprint")
		{
			getupAnim = "ai_zombie_thundergun_sprinter_getup";
		}
		else if(self.zombie_move_speed == "run")
		{
			anims = RandomInt(1);
			if(anims == 0)
			{
				getupAnim = "ai_zombie_thundergun_getup_quick_b";
				continue;
			}
			getupAnim = "ai_zombie_thundergun_getup_quick_c";
			continue;
		}
		anims = RandomInt(2);
		if(anims == 0)
		{
			getupAnim = "ai_zombie_thundergun_getup";
		}
		else if(anims == 1)
		{
			getupAnim = "ai_zombie_thundergun_getup_b";
			continue;
		}
		getupAnim = "ai_zombie_thundergun_getup_c";
	}
	else if(self.damageyaw > -135 && self.damageyaw < -45)
	{
		anims = RandomInt(1);
		if(anims == 0)
		{
			fallAnim = "ai_zombie_thundergun_hit_jackiespin_right";
			continue;
		}
		fallAnim = "ai_zombie_thundergun_hit_legsout_right";
		getupAnim = "ai_zombie_thundergun_getup_a";
	}
	else if(self.damageyaw > 45 && self.damageyaw < 135)
	{
		anims = RandomInt(1);
		if(anims == 0)
		{
			fallAnim = "ai_zombie_thundergun_hit_legsout_left";
			continue;
		}
		fallAnim = "ai_zombie_thundergun_hit_jackiespin_left";
		getupAnim = "ai_zombie_thundergun_getup_a";
		continue;
	}
	fallAnim = "ai_zombie_thundergun_hit_stumblefall";
	anims = RandomInt(2);
	if(anims == 0)
	{
		getupAnim = "ai_zombie_thundergun_getup";
	}
	else if(anims == 0)
	{
		getupAnim = "ai_zombie_thundergun_getup_b";
		continue;
	}
	getupAnim = "ai_zombie_thundergun_getup_c";
	self AnimScripted(fallAnim, self.origin, self.angles, fallAnim);
	wait(getanimlength(fallAnim) - 0.5);
	if(!isdefined(self) || !isalive(self) || (isdefined(self.missingLegs) && self.missingLegs))
	{
		return;
	}
	self.var_550f1824 = undefined;
	self AnimScripted(getupAnim, self.origin, self.angles, getupAnim);
	wait(getanimlength(getupAnim));
	return;
}

/*
	Name: function_ae9da9ff
	Namespace: namespace_6d0a1fae
	Checksum: 0x7AD0E681
	Offset: 0x2238
	Size: 0x1D0
	Parameters: 2
	Flags: None
	Line Number: 710
*/
function function_ae9da9ff(v_attract_point, b_move_fast)
{
	self endon("death");
	level endon("whirlwind_stopped");
	if(!isdefined(b_move_fast))
	{
		b_move_fast = 0;
	}
	if(isdefined(self._whirlwind_attract_anim) && self._whirlwind_attract_anim)
	{
		return;
	}
	v_angles_to_source = VectorToAngles(v_attract_point.origin - self.origin);
	v_source_to_target = VectorToAngles(self.origin - v_attract_point.origin);
	anims = RandomInt(4);
	if(anims == 0)
	{
		anim_to_play = "ai_zm_dlc5_zombie_airstaff_death_vacuumed_midair_a";
	}
	else if(anims == 1)
	{
		anim_to_play = "ai_zm_dlc5_zombie_airstaff_death_vacuumed_midair_b";
	}
	else if(anims == 2)
	{
		anim_to_play = "ai_zm_dlc5_zombie_airstaff_death_vacuumed_midair_c";
		continue;
	}
	anim_to_play = "ai_zm_dlc5_zombie_airstaff_death_vacuumed_midair_d";
	self AnimScripted(anim_to_play, self.origin, self.angles, anim_to_play);
	self.ignoreall = 1;
	self._whirlwind_attract_anim = 1;
	self waittill("reached_whirlwind");
	self._whirlwind_attract_anim = undefined;
	self.ignoreall = 0;
	self thread scene::stop(anim_to_play, self);
	return;
}

/*
	Name: function_3a2d170a
	Namespace: namespace_6d0a1fae
	Checksum: 0xA8EF06D
	Offset: 0x2410
	Size: 0xA0
	Parameters: 2
	Flags: None
	Line Number: 759
*/
function function_3a2d170a(damageWeapon, var_16f4cf62)
{
	switch(damageWeapon)
	{
		case "t7_staff_air":
		{
			return 2050;
		}
		case "t7_staff_air_upgraded":
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
	Name: is_staff_air_damage
	Namespace: namespace_6d0a1fae
	Checksum: 0x75F4C774
	Offset: 0x24B8
	Size: 0x6C
	Parameters: 0
	Flags: None
	Line Number: 801
*/
function is_staff_air_damage()
{
	if(isdefined(self) && isdefined(self.damageWeapon) && isdefined(self.damageWeapon.name) && (self.damageWeapon.name == "t7_staff_air" || self.damageWeapon.name == "t7_staff_air_upgraded"))
	{
		return 1;
	}
	return 0;
}

