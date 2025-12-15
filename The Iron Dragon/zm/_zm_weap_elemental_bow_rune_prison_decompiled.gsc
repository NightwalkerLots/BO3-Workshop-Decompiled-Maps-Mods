#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai_shared;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_elemental_bow;
#include scripts\zm\_zm_weapons;

#namespace namespace_2d73d751;

/*
	Name: __init__sytem__
	Namespace: namespace_2d73d751
	Checksum: 0xAE360D21
	Offset: 0x580
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 34
*/
function autoexec __init__sytem__()
{
	system::register("_zm_weap_elemental_bow_rune_prison", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_2d73d751
	Checksum: 0x40FF6F91
	Offset: 0x5C8
	Size: 0x230
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function __init__()
{
	level.var_fb620116 = GetWeapon("elemental_bow_rune_prison");
	level.var_791ba87b = GetWeapon("elemental_bow_rune_prison4");
	clientfield::register("toplayer", "elemental_bow_rune_prison" + "_ambient_bow_fx", 1, 1, "int");
	clientfield::register("missile", "elemental_bow_rune_prison" + "_arrow_impact_fx", 1, 1, "int");
	clientfield::register("missile", "elemental_bow_rune_prison4" + "_arrow_impact_fx", 1, 1, "int");
	clientfield::register("scriptmover", "runeprison_rock_fx", 1, 1, "int");
	clientfield::register("scriptmover", "runeprison_explode_fx", 1, 1, "int");
	clientfield::register("scriptmover", "runeprison_lava_geyser_fx", 1, 1, "int");
	clientfield::register("actor", "runeprison_lava_geyser_dot_fx", 1, 1, "int");
	clientfield::register("actor", "runeprison_zombie_charring", 1, 1, "int");
	clientfield::register("actor", "runeprison_zombie_death_skull", 1, 1, "int");
	callback::on_connect(&function_56e0cf3b);
}

/*
	Name: __main__
	Namespace: namespace_2d73d751
	Checksum: 0x9ACF73B8
	Offset: 0x800
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function __main__()
{
	return;
	ERROR: Bad function call
}

/*
	Name: function_56e0cf3b
	Namespace: namespace_2d73d751
	Checksum: 0x594673A9
	Offset: 0x810
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 91
*/
function function_56e0cf3b()
{
	self thread zm_weap_elemental_bow::function_59d385a8("elemental_bow_rune_prison");
	self thread zm_weap_elemental_bow::function_1160e0e9("elemental_bow_rune_prison", "elemental_bow_rune_prison4");
	self thread zm_weap_elemental_bow::function_a991479f("elemental_bow_rune_prison", "elemental_bow_rune_prison4", &function_d53f8009);
}

/*
	Name: function_d53f8009
	Namespace: namespace_2d73d751
	Checksum: 0x20EB7C39
	Offset: 0x898
	Size: 0xB8
	Parameters: 5
	Flags: None
	Line Number: 108
*/
function function_d53f8009(weapon, position, radius, attacker, normal)
{
	if(IsSubStr(weapon.name, "elemental_bow_rune_prison4"))
	{
		level thread function_2ccb27b8(self, position, weapon.name, attacker, 1);
		continue;
	}
	level thread function_3ae298c7(self, position, weapon.name, attacker);
}

/*
	Name: function_2ccb27b8
	Namespace: namespace_2d73d751
	Checksum: 0x1C8F1964
	Offset: 0x958
	Size: 0x860
	Parameters: 5
	Flags: None
	Line Number: 128
*/
function function_2ccb27b8(e_player, v_hit_origin, str_weapon_name, var_d628726d, b_first)
{
	if(b_first)
	{
		e_player.var_7b8599cd = &function_974aed8;
		v_spawn_pos = e_player zm_weap_elemental_bow::function_665a02cd(v_hit_origin, str_weapon_name, var_d628726d, 48, e_player.var_7b8599cd);
		if(b_first)
		{
			if(isdefined(v_spawn_pos))
			{
				continue;
			}
			var_983082ca = v_hit_origin;
			var_a2baa405 = Array::get_all_closest(var_983082ca, GetAITeamArray(level.zombie_team), undefined, undefined, 256);
			var_a2baa405 = Array::filter(var_a2baa405, 0, &zm_weap_elemental_bow::function_69533776);
			var_a2baa405 = Array::filter(var_a2baa405, 0, &function_c7ee5b28, var_983082ca);
			if(GetDvarInt("splitscreen_playerCount") > 2)
			{
				var_a2baa405 = Array::clamp_size(var_a2baa405, 6);
				continue;
			}
			var_a2baa405 = Array::clamp_size(var_a2baa405, 12);
			foreach(ai_enemy in var_a2baa405)
			{
				ai_enemy thread function_2ccb27b8(e_player, v_hit_origin, str_weapon_name, var_d628726d, 0);
			}
			if(var_a2baa405.size)
			{
				return;
				continue;
			}
		}
	}
	v_spawn_pos = function_cadaa9b1(self);
	if(!isdefined(v_spawn_pos))
	{
		return;
	}
	if(isdefined(v_spawn_pos))
	{
		var_2399b361 = util::spawn_model("tag_origin", v_spawn_pos, (0, randomIntRange(0, 360), 0));
		if(isai(self) && isalive(self))
		{
			self.var_e2ca1e00 = 1;
			self.var_a940fc8b = 1;
			self LinkTo(var_2399b361);
			self SetPlayerCollision(0);
			self thread function_691aee0e();
		}
	}
	var_2399b361 clientfield::set("runeprison_rock_fx", 1);
	self thread function_4a078682(v_spawn_pos);
	if(isdefined(self) && isalive(self))
	{
		if(isdefined(self.isdog) && self.isdog || (isdefined(self.missingLegs) && self.missingLegs))
		{
			self DoDamage(self.health, var_2399b361.origin, e_player, e_player, undefined, "MOD_BURNED", 0, level.var_791ba87b);
		}
	}
	wait(1.8 + 0.07 * b_first);
	var_2399b361 clientfield::set("runeprison_explode_fx", 1);
	if(isdefined(self) && isalive(self) && self.archetype === "zombie")
	{
		self notify("hash_2033027c", var_a2baa405, v_spawn_pos);
		self clientfield::set("runeprison_zombie_charring", 1);
	}
	wait(2);
	if(isdefined(self) && isai(self) && isalive(self))
	{
		if(self.archetype === "mechz")
		{
			var_a6efc579 = level.mechz_health;
			n_damage = var_a6efc579 * 0.2 / 0.2;
			self.var_e2ca1e00 = 0;
			self.var_a940fc8b = 0;
			self scene::stop("ai_zm_dlc1_soldat_runeprison_struggle_loop");
			self DoDamage(n_damage, var_2399b361.origin, e_player, e_player, undefined, "MOD_PROJECTILE_SPLASH", 0, level.var_791ba87b);
			self thread function_859fc3e3();
		}
		else if(self.archetype === "zombie")
		{
			if(math::cointoss())
			{
				GibServerUtils::GibHead(self);
				self clientfield::set("runeprison_zombie_death_skull", 1);
			}
			self DoDamage(self.health, var_2399b361.origin, e_player, e_player, undefined, "MOD_BURNED", 0, level.var_791ba87b);
		}
		self SetPlayerCollision(1);
		self Unlink();
	}
	var_a2baa405 = Array::get_all_closest(var_2399b361.origin, GetAITeamArray(level.zombie_team), undefined, undefined, 96);
	var_a2baa405 = Array::filter(var_a2baa405, 0, &zm_weap_elemental_bow::function_69533776);
	var_a2baa405 = Array::filter(var_a2baa405, 0, &function_a4b8b94c);
	foreach(ai_target in var_a2baa405)
	{
		ai_target DoDamage(ai_target.health, var_2399b361.origin, e_player, e_player, undefined, "MOD_BURNED", 0, level.var_791ba87b);
	}
	var_2399b361 clientfield::set("runeprison_rock_fx", 0);
	wait(6);
	var_2399b361 delete();
	return;
	ERROR: Bad function call
}

/*
	Name: function_4a078682
	Namespace: namespace_2d73d751
	Checksum: 0xE6C93B6C
	Offset: 0x11C0
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 243
*/
function function_4a078682(v_pos)
{
	wait(0.1);
	var_a2baa405 = Array::get_all_closest(v_pos, GetAITeamArray(level.zombie_team), undefined, undefined, 96);
	var_a2baa405 = Array::filter(var_a2baa405, 0, &zm_weap_elemental_bow::function_69533776);
	var_a2baa405 = Array::filter(var_a2baa405, 0, &function_f304e20e);
	var_a2baa405 = Array::clamp_size(var_a2baa405, 2);
	foreach(ai_target in var_a2baa405)
	{
		ai_target thread zm_weap_elemental_bow::function_e7b203f6(v_pos);
	}
}

/*
	Name: function_859fc3e3
	Namespace: namespace_2d73d751
	Checksum: 0x5EAEC0E2
	Offset: 0x1328
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 266
*/
function function_859fc3e3()
{
	self endon("death");
	self.var_3c1a46b4 = 1;
	wait(16);
	self.var_3c1a46b4 = 0;
}

/*
	Name: function_c7ee5b28
	Namespace: namespace_2d73d751
	Checksum: 0x8C7ECB2E
	Offset: 0x1360
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 284
*/
function function_c7ee5b28(ai_enemy, var_983082ca)
{
	return !(isdefined(ai_enemy.var_e2ca1e00) && ai_enemy.var_e2ca1e00) && (BulletTracePassed(ai_enemy GetCentroid(), var_983082ca, 0, undefined) || BulletTracePassed(ai_enemy GetCentroid(), var_983082ca + VectorScale((0, 0, 1), 48), 0, undefined));
}

/*
	Name: function_f304e20e
	Namespace: namespace_2d73d751
	Checksum: 0x27B052AB
	Offset: 0x1418
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 299
*/
function function_f304e20e(ai_enemy)
{
	return !(isdefined(ai_enemy.var_e2ca1e00) && ai_enemy.var_e2ca1e00) && (!(isdefined(ai_enemy.KNOCKDOWN) && ai_enemy.KNOCKDOWN)) && (!(isdefined(ai_enemy.missingLegs) && ai_enemy.missingLegs));
}

/*
	Name: function_a4b8b94c
	Namespace: namespace_2d73d751
	Checksum: 0x20AD3697
	Offset: 0x14A0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 314
*/
function function_a4b8b94c(ai_enemy)
{
	return !(isdefined(ai_enemy.var_e2ca1e00) && ai_enemy.var_e2ca1e00);
}

/*
	Name: function_691aee0e
	Namespace: namespace_2d73d751
	Checksum: 0x9F590105
	Offset: 0x14D8
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 329
*/
function function_691aee0e()
{
	self endon("death");
	wait(0.1);
	if(self.archetype === "zombie")
	{
		var_c661f4ef = randomIntRange(1, 5);
		self thread scene::Play("ai_zm_dlc1_zombie_runeprison_locked_struggle_0" + var_c661f4ef, self);
		self waittill("hash_2033027c");
		wait(0.5);
		self scene::Play("ai_zm_dlc1_zombie_runeprison_death_loop_0" + randomIntRange(1, 5), self);
	}
	else if(self.archetype === "mechz")
	{
		self scene::Play("ai_zm_dlc1_soldat_runeprison_struggle_loop", self);
	}
}

/*
	Name: function_3ae298c7
	Namespace: namespace_2d73d751
	Checksum: 0xF8E3F65E
	Offset: 0x15D8
	Size: 0x1E0
	Parameters: 4
	Flags: None
	Line Number: 357
*/
function function_3ae298c7(e_player, v_hit_origin, str_weapon_name, var_d628726d)
{
	v_spawn_pos = e_player zm_weap_elemental_bow::function_665a02cd(v_hit_origin, str_weapon_name, var_d628726d, 32);
	if(!isdefined(v_spawn_pos))
	{
		return;
	}
	var_3852e6c5 = util::spawn_model("tag_origin", v_spawn_pos);
	var_3852e6c5 clientfield::set("runeprison_lava_geyser_fx", 1);
	for(n_timer = 0; n_timer < 3; n_timer = 0)
	{
		var_a2baa405 = Array::get_all_closest(var_3852e6c5.origin, GetAITeamArray(level.zombie_team), undefined, undefined, 48);
		var_a2baa405 = Array::filter(var_a2baa405, 0, &zm_weap_elemental_bow::function_69533776);
		var_a2baa405 = Array::filter(var_a2baa405, 0, &function_f624c85d, var_3852e6c5);
		Array::thread_all(var_a2baa405, &function_79952ba9, var_3852e6c5, e_player);
		wait(0.05);
	}
	wait(6);
	var_3852e6c5 delete();
}

/*
	Name: function_f624c85d
	Namespace: namespace_2d73d751
	Checksum: 0xDD941032
	Offset: 0x17C0
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 388
*/
function function_f624c85d(ai_enemy, var_3852e6c5)
{
	return !(isdefined(ai_enemy.var_ae49400d) && ai_enemy.var_ae49400d);
}

/*
	Name: function_79952ba9
	Namespace: namespace_2d73d751
	Checksum: 0xAC4543D2
	Offset: 0x1800
	Size: 0x228
	Parameters: 2
	Flags: None
	Line Number: 403
*/
function function_79952ba9(var_3852e6c5, e_player)
{
	self endon("death");
	self.var_ae49400d = 1;
	n_timer = 0;
	if(self.archetype === "mechz")
	{
		var_a6efc579 = level.mechz_health;
		N_MAX_DAMAGE = var_a6efc579 * 0.05 / 0.2;
		str_mod = "MOD_PROJECTILE_SPLASH";
	}
	else if(level.zombie_health > 2482)
	{
		continue;
	}
	N_MAX_DAMAGE = level.zombie_health;
	str_mod = "MOD_UNKNOWN";
	self clientfield::set("runeprison_lava_geyser_dot_fx", 1);
	var_c7c71445 = N_MAX_DAMAGE * 0.3;
	self DoDamage(var_c7c71445, self.origin, e_player, e_player, undefined, str_mod, 0, level.var_fb620116);
	var_31506189 = N_MAX_DAMAGE * 0.1;
	while(n_timer < 6 && var_c7c71445 < N_MAX_DAMAGE)
	{
		n_delay = RandomFloatRange(0.4, 1);
		wait(n_delay);
		n_timer = n_timer + n_delay;
		self DoDamage(var_31506189, self.origin, e_player, e_player, undefined, str_mod, 0, level.var_fb620116);
		var_c7c71445 = var_c7c71445 + var_31506189;
	}
	self clientfield::set("runeprison_lava_geyser_dot_fx", 0);
	self.var_ae49400d = 0;
}

/*
	Name: function_cadaa9b1
	Namespace: namespace_2d73d751
	Checksum: 0x3672310
	Offset: 0x1A30
	Size: 0x150
	Parameters: 1
	Flags: None
	Line Number: 446
*/
function function_cadaa9b1(ai_enemy)
{
	n_z_diff = 24;
	while(isdefined(ai_enemy) && isalive(ai_enemy) && (!(isdefined(ai_enemy.var_a940fc8b) && ai_enemy.var_a940fc8b)) && n_z_diff > 12)
	{
		a_trace = bullettrace(ai_enemy.origin, ai_enemy.origin - VectorScale((0, 0, 1), 1000), 0, undefined);
		n_z_diff = ai_enemy.origin[2] - a_trace["position"][2];
		wait(0.1);
	}
	if(isdefined(ai_enemy) && isalive(ai_enemy) && (!(isdefined(ai_enemy.var_a940fc8b) && ai_enemy.var_a940fc8b)))
	{
		return ai_enemy.origin;
	}
	return undefined;
}

/*
	Name: function_974aed8
	Namespace: namespace_2d73d751
	Checksum: 0xF2C47491
	Offset: 0x1B88
	Size: 0x7C
	Parameters: 3
	Flags: None
	Line Number: 472
*/
function function_974aed8(str_weapon_name, v_source, v_destination)
{
	wait(0.1);
	if(str_weapon_name == "elemental_bow_rune_prison4")
	{
		continue;
	}
	str_weapon_name = "elemental_bow_rune_prison_ricochet";
	MagicBullet(GetWeapon(str_weapon_name), v_source, v_destination, self);
}

