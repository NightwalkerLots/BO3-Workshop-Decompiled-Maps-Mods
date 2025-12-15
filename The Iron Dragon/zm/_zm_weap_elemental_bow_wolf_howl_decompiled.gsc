#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_elemental_bow;
#include scripts\zm\_zm_weapons;

#namespace namespace_d37f1c72;

/*
	Name: __init__sytem__
	Namespace: namespace_d37f1c72
	Checksum: 0x65715049
	Offset: 0x538
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 34
*/
function autoexec __init__sytem__()
{
	system::register("_zm_weap_elemental_bow_wolf_howl", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_d37f1c72
	Checksum: 0x3AAD4BCF
	Offset: 0x580
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function __init__()
{
	level.var_e93874ed = GetWeapon("elemental_bow_wolf_howl");
	level.var_25702528 = GetWeapon("elemental_bow_wolf_howl4");
	clientfield::register("toplayer", "elemental_bow_wolf_howl" + "_ambient_bow_fx", 1, 1, "int");
	clientfield::register("missile", "elemental_bow_wolf_howl" + "_arrow_impact_fx", 1, 1, "int");
	clientfield::register("scriptmover", "elemental_bow_wolf_howl4" + "_arrow_impact_fx", 1, 1, "int");
	clientfield::register("toplayer", "wolf_howl_muzzle_flash", 1, 1, "int");
	clientfield::register("scriptmover", "wolf_howl_arrow_charged_trail", 1, 1, "int");
	clientfield::register("scriptmover", "wolf_howl_arrow_charged_spiral", 1, 1, "int");
	clientfield::register("actor", "wolf_howl_slow_snow_fx", 1, 1, "int");
	clientfield::register("actor", "zombie_hit_by_wolf_howl_charge", 1, 1, "int");
	clientfield::register("actor", "wolf_howl_zombie_explode_fx", 1, 1, "counter");
	callback::on_connect(&function_e32f1368);
	zm_spawner::register_zombie_damage_callback(&function_13709225);
}

/*
	Name: __main__
	Namespace: namespace_d37f1c72
	Checksum: 0x9ACF73B8
	Offset: 0x7D8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function __main__()
{
}

/*
	Name: function_e32f1368
	Namespace: namespace_d37f1c72
	Checksum: 0xC4DE7951
	Offset: 0x7E8
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function function_e32f1368()
{
	self endon("disconnect");
	self thread zm_weap_elemental_bow::function_59d385a8("elemental_bow_wolf_howl");
	self thread zm_weap_elemental_bow::function_1160e0e9("elemental_bow_wolf_howl", "elemental_bow_wolf_howl4", &function_4de6c386);
	self thread zm_weap_elemental_bow::function_a991479f("elemental_bow_wolf_howl", "elemental_bow_wolf_howl4", &function_1793374);
	while(1)
	{
		self waittill("weapon_change", newWeapon);
		if(newWeapon.name === "elemental_bow_wolf_howl")
		{
			break;
		}
	}
	function_62fa02ea();
}

/*
	Name: function_4de6c386
	Namespace: namespace_d37f1c72
	Checksum: 0x4936C135
	Offset: 0x8D8
	Size: 0xA8
	Parameters: 2
	Flags: None
	Line Number: 117
*/
function function_4de6c386(projectile, weapon)
{
	if(weapon.name == "elemental_bow_wolf_howl4")
	{
		v_target_pos = projectile.origin + (0, 0, 0) + AnglesToForward(projectile.angles) * 64;
		projectile thread function_ccfe9b1c();
		self thread function_2fd04263(v_target_pos);
		return;
	}
}

/*
	Name: function_1793374
	Namespace: namespace_d37f1c72
	Checksum: 0xB63AC443
	Offset: 0x988
	Size: 0x78
	Parameters: 5
	Flags: None
	Line Number: 138
*/
function function_1793374(weapon, position, radius, attacker, normal)
{
	if(weapon.name != "elemental_bow_wolf_howl4")
	{
		attacker clientfield::set("elemental_bow_wolf_howl" + "_arrow_impact_fx", 1);
		return;
	}
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_ccfe9b1c
	Namespace: namespace_d37f1c72
	Checksum: 0x474F2E2B
	Offset: 0xA08
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 159
*/
function function_ccfe9b1c()
{
	self endon("death");
	util::wait_network_frame();
	self delete();
}

/*
	Name: function_2fd04263
	Namespace: namespace_d37f1c72
	Checksum: 0x58921346
	Offset: 0xA50
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 176
*/
function function_2fd04263(v_target_pos)
{
	v_player_angles = AnglesToForward(self getPlayerAngles());
	v_up = anglesToUp(self getPlayerAngles());
	var_bab4a936 = length(v_target_pos - self GetEye());
	a_trace = bullettrace(self GetEye(), v_target_pos, 0, self);
	if(a_trace["fraction"] < 1)
	{
		var_839ecff7 = self function_3fe8ea85(a_trace["position"], v_player_angles, v_up, 1);
		util::wait_network_frame();
		if(isdefined(var_839ecff7))
		{
			function_2fae3b86(a_trace["position"], var_839ecff7);
			continue;
		}
	}
	function_472d536b(self, v_target_pos, v_player_angles, v_up, 1);
}

/*
	Name: function_472d536b
	Namespace: namespace_d37f1c72
	Checksum: 0xBEAF6CFA
	Offset: 0xBF8
	Size: 0x3F8
	Parameters: 6
	Flags: None
	Line Number: 205
*/
function function_472d536b(e_player, v_target_pos, v_player_angles, v_up, var_42d5af81, var_839ecff7)
{
	if(!isdefined(var_839ecff7))
	{
		var_839ecff7 = undefined;
	}
	if(!zm_utility::is_player_valid(e_player))
	{
		return;
	}
	if(var_42d5af81)
	{
		var_839ecff7 = e_player function_3fe8ea85(v_target_pos, v_player_angles, v_up, var_42d5af81);
		if(isdefined(var_839ecff7))
		{
			function_680eabca(var_839ecff7, 1);
		}
	}
	if(isdefined(var_839ecff7))
	{
		var_1fa8c127 = var_839ecff7[0];
		var_1f9ea39b = var_839ecff7[1];
		var_ad973460 = var_839ecff7[2];
		var_1fa8c127.v_start_pos = v_target_pos;
		n_percent = 2560 - var_1fa8c127.var_1aaed85a;
		if(var_42d5af81)
		{
			continue;
		}
		v_target_pos = v_target_pos - (0, 0, 0) * 2;
		a_trace = bullettrace(v_target_pos, v_target_pos + v_player_angles * n_percent, 0, e_player);
		var_460f31d6 = a_trace["fraction"] * n_percent;
		if(var_460f31d6 > 32)
		{
			var_1fa8c127.var_1aaed85a = var_1fa8c127.var_1aaed85a + var_460f31d6;
			v_target_pos = a_trace["position"] - v_player_angles * 32;
			var_bfcef734 = var_460f31d6 / 1920;
			var_bc5cda7b = "none";
			if(var_bfcef734 > 0)
			{
				var_1fa8c127 moveto(v_target_pos, var_bfcef734, var_bfcef734 * 0.3, 0);
				level thread function_d281053d(e_player, var_839ecff7, v_player_angles);
				level thread function_284ad16b(var_839ecff7);
				if(var_42d5af81)
				{
					level thread function_7fb94969(e_player, var_839ecff7);
				}
				var_bc5cda7b = var_1fa8c127 util::waittill_any_return("movedone", "mechz_impact");
			}
			if(var_bc5cda7b != "mechz_impact" && var_42d5af81)
			{
				v_target_pos = var_1fa8c127.origin;
				var_eca96ec1 = GetNavMeshFaceNormal(var_1fa8c127.origin, 2560);
				if(isdefined(var_eca96ec1))
				{
					v_up = var_eca96ec1;
					v_player_angles = VectorCross(v_up, AnglesToRight(var_1f9ea39b.angles));
					level thread function_472d536b(e_player, v_target_pos, v_player_angles, v_up, 0, var_839ecff7);
					return;
				}
			}
		}
		function_2fae3b86(var_1fa8c127.origin, var_839ecff7);
	}
}

/*
	Name: function_62fa02ea
	Namespace: namespace_d37f1c72
	Checksum: 0xFD6C92D5
	Offset: 0xFF8
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 281
*/
function function_62fa02ea()
{
	if(!isdefined(self.var_d369359b))
	{
		for(i = 0; i < 2; i++)
		{
			self.var_d369359b[i] = zm_net::network_safe_spawn("wolf_howl_charge_base", 2, "script_model", (100, 300, -200));
			self.var_d369359b[i] SetModel("tag_origin");
			self.var_d369359b[i].in_use = 0;
		}
		for(i = 0; i < 2; i++)
		{
			self.var_27c94417[i] = zm_net::network_safe_spawn("wolf_howl_charge_viz_wolf01", 2, "script_model", (100, 300, -200));
			self.var_27c94417[i] SetModel("tag_origin");
		}
		for(i = 0; i < 2; i++)
		{
			self.var_b5c1d4dc[i] = zm_net::network_safe_spawn("wolf_howl_charge_viz_wolf02", 2, "script_model", (100, 300, -200));
			self.var_b5c1d4dc[i] SetModel("tag_origin");
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3fe8ea85
	Namespace: namespace_d37f1c72
	Checksum: 0xCF1310EE
	Offset: 0x11D8
	Size: 0x278
	Parameters: 4
	Flags: None
	Line Number: 316
*/
function function_3fe8ea85(v_target_pos, v_player_angles, v_up, var_42d5af81)
{
	var_85cad2b5 = VectorToAngles(v_player_angles);
	n_z_offset = v_up * -24;
	v_spawn_pos = v_target_pos;
	n_model_index = undefined;
	if(!isdefined(self.var_d369359b))
	{
		function_62fa02ea();
	}
	if(var_42d5af81)
	{
		foreach(var_1fa8c127 in self.var_d369359b)
		{
			if(!var_1fa8c127.in_use)
			{
				var_1fa8c127.in_use = 1;
				var_1fa8c127.var_1aaed85a = 0;
				n_model_index = n_index;
				break;
			}
		}
	}
	else if(isdefined(n_model_index))
	{
		self.var_d369359b[n_model_index].origin = v_spawn_pos;
		self.var_d369359b[n_model_index].angles = (var_85cad2b5[0], var_85cad2b5[1], 0);
		if(var_42d5af81)
		{
			self.var_27c94417[n_model_index].origin = v_spawn_pos + n_z_offset;
			self.var_27c94417[n_model_index].angles = var_85cad2b5;
			self.var_b5c1d4dc[n_model_index].origin = v_spawn_pos - n_z_offset;
			self.var_b5c1d4dc[n_model_index].angles = var_85cad2b5;
		}
		return Array(self.var_d369359b[n_model_index], self.var_27c94417[n_model_index], self.var_b5c1d4dc[n_model_index]);
	}
	return undefined;
}

/*
	Name: function_d281053d
	Namespace: namespace_d37f1c72
	Checksum: 0xD9EE96A6
	Offset: 0x1458
	Size: 0x5B8
	Parameters: 3
	Flags: None
	Line Number: 365
*/
function function_d281053d(e_player, var_839ecff7, v_player_angles)
{
	var_1fa8c127 = var_839ecff7[0];
	var_1fa8c127 endon("movedone");
	var_1fa8c127 endon("hash_b850f1f5");
	var_f2471ea0 = 409600;
	var_85cad2b5 = VectorToAngles(v_player_angles);
	n_offset = 192 * 2;
	var_69a2fa6d = 32;
	while(1)
	{
		a_zombies = GetAITeamArray(level.zombie_team);
		a_filtered_zombies = Array::get_all_closest(var_1fa8c127.origin, a_zombies, undefined, undefined, n_offset);
		a_filtered_zombies = Array::filter(a_filtered_zombies, 0, &zm_weap_elemental_bow::function_69533776);
		a_filtered_zombies = Array::filter(a_filtered_zombies, 0, &function_8a4ae6c5);
		if(a_filtered_zombies.size)
		{
			var_6180cd39 = var_1fa8c127.origin;
			var_d57e5c1b = var_6180cd39 + v_player_angles * n_offset;
			var_8bf31275 = Distance(var_1fa8c127.origin, var_1fa8c127.v_start_pos);
			if(var_8bf31275 < 256)
			{
				var_f17995b7 = var_8bf31275 / 256;
				n_max_distance = 64 - var_69a2fa6d * var_f17995b7;
				continue;
			}
			n_max_distance = 32;
			foreach(ai_enemy in a_filtered_zombies)
			{
				v_enemy_origin = ai_enemy GetCentroid();
				var_9df1d108 = PointOnSegmentNearestToPoint(var_6180cd39, var_d57e5c1b, v_enemy_origin);
				var_8b15f0f1 = var_9df1d108 - v_enemy_origin;
				if(Abs(var_8b15f0f1[2]) > 72)
				{
					continue;
				}
				var_8b15f0f1 = (var_8b15f0f1[0], var_8b15f0f1[1], 0);
				n_length = length(var_8b15f0f1);
				if(n_length > n_max_distance)
				{
					continue;
				}
				ai_enemy.var_8be489f7 = 1;
				if(ai_enemy.archetype === "mechz")
				{
					if(n_length < 24)
					{
						level thread function_fb649a47(e_player, ai_enemy, var_1fa8c127);
						continue;
					}
					ai_enemy.var_8be489f7 = 0;
					continue;
				}
				if(zm_utility::is_player_valid(e_player) && (level.round_number < 26 || (level.round_number >= 26 && DistanceSquared(e_player.origin, ai_enemy.origin) < var_f2471ea0)))
				{
					ai_enemy.var_a940fc8b = 1;
					n_dist_percent = 75 * n_length / n_max_distance;
					var_73adee40 = VectorToAngles(ai_enemy.origin - var_1fa8c127.origin);
					if(var_73adee40[1] - var_85cad2b5[1] > 0)
					{
						continue;
					}
					var_1d6987c3 = -1;
					n_dist_percent = n_dist_percent * var_1d6987c3;
					v_launch = VectorNormalize(AnglesToForward((0, var_85cad2b5[1] + n_dist_percent, 0)));
					level thread function_4504bc80(e_player, ai_enemy, v_launch);
					continue;
				}
				ai_enemy thread function_cc54b76(var_9df1d108);
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_8a4ae6c5
	Namespace: namespace_d37f1c72
	Checksum: 0x6F3346D5
	Offset: 0x1A18
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 450
*/
function function_8a4ae6c5(ai_enemy)
{
	return !(isdefined(ai_enemy.var_8be489f7) && ai_enemy.var_8be489f7);
}

/*
	Name: function_4504bc80
	Namespace: namespace_d37f1c72
	Checksum: 0x20C8A7C0
	Offset: 0x1A50
	Size: 0x160
	Parameters: 3
	Flags: None
	Line Number: 465
*/
function function_4504bc80(e_player, ai_enemy, v_launch)
{
	if(ai_enemy.archetype === "zombie")
	{
		var_eb34766d = 45;
		var_261e1883 = 90;
		ai_enemy StartRagdoll();
		ai_enemy LaunchRagdoll(90 * v_launch + (0, 0, RandomFloatRange(var_eb34766d, var_261e1883)));
		ai_enemy thread function_50cc7239();
		wait(0.1);
		ai_enemy clientfield::set("zombie_hit_by_wolf_howl_charge", 1);
	}
	ai_enemy DoDamage(ai_enemy.health, ai_enemy.origin, e_player, e_player, undefined, "MOD_UNKNOWN", 0, level.var_25702528);
	ai_enemy.var_8be489f7 = 0;
	ai_enemy.var_a940fc8b = 0;
}

/*
	Name: function_50cc7239
	Namespace: namespace_d37f1c72
	Checksum: 0xB739DAAB
	Offset: 0x1BB8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 492
*/
function function_50cc7239()
{
	self endon("actor_corpse");
	self thread function_ae9024d8();
	wait(0.7 + RandomFloat(0.5));
	self notify("hash_fd48628f");
	self thread do_zombie_explode();
}

/*
	Name: function_ae9024d8
	Namespace: namespace_d37f1c72
	Checksum: 0x61CFB695
	Offset: 0x1C28
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 511
*/
function function_ae9024d8()
{
	self endon("hash_fd48628f");
	self waittill("actor_corpse", e_corpse);
	e_corpse thread do_zombie_explode();
}

/*
	Name: do_zombie_explode
	Namespace: namespace_d37f1c72
	Checksum: 0x3B6CB868
	Offset: 0x1C70
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 528
*/
function do_zombie_explode()
{
	self zombie_utility::zombie_eye_glow_stop();
	self clientfield::increment("wolf_howl_zombie_explode_fx");
	self ghost();
	self util::delay(0.25, undefined, &zm_utility::self_delete);
}

/*
	Name: function_cc54b76
	Namespace: namespace_d37f1c72
	Checksum: 0xC4F63700
	Offset: 0x1CF8
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 546
*/
function function_cc54b76(ai_zombie)
{
	self endon("death");
	if(isdefined(self.isdog) && self.isdog)
	{
		n_damage = level.zombie_health;
	}
	else if(self.archetype === "zombie")
	{
		n_damage = level.zombie_health * 0.5;
		continue;
	}
	n_damage = 0;
	if(n_damage > 0)
	{
		self thread zm_weap_elemental_bow::function_e7b203f6(ai_zombie);
		self DoDamage(n_damage, self.origin, self, self, undefined, "MOD_UNKNOWN", 0, level.var_25702528);
		wait(2.5);
		self.var_8be489f7 = 0;
	}
}

/*
	Name: function_fb649a47
	Namespace: namespace_d37f1c72
	Checksum: 0xEB8EEA76
	Offset: 0x1DF0
	Size: 0x150
	Parameters: 3
	Flags: None
	Line Number: 578
*/
function function_fb649a47(e_player, ai_mechz, var_1fa8c127)
{
	wait(0.1);
	if(isdefined(ai_mechz) && isalive(ai_mechz))
	{
		var_1e196720 = level.mechz_health;
		n_damage = var_1e196720 * 0.4 / 0.2;
		ai_mechz DoDamage(n_damage, ai_mechz GetCentroid(), e_player, e_player, undefined, "MOD_PROJECTILE_SPLASH", 0, level.var_25702528);
		v_hit_origin = ai_mechz GetCentroid() - AnglesToForward(var_1fa8c127.angles) * 96;
		var_1fa8c127.origin = v_hit_origin;
		wait(0.05);
		var_1fa8c127 notify("hash_b850f1f5");
		ai_mechz.var_8be489f7 = 0;
	}
}

/*
	Name: function_2fae3b86
	Namespace: namespace_d37f1c72
	Checksum: 0xCC320977
	Offset: 0x1F48
	Size: 0x298
	Parameters: 2
	Flags: None
	Line Number: 604
*/
function function_2fae3b86(v_hit_pos, var_839ecff7)
{
	var_1fa8c127 = var_839ecff7[0];
	var_1f9ea39b = var_839ecff7[1];
	var_ad973460 = var_839ecff7[2];
	var_1fa8c127 clientfield::set("elemental_bow_wolf_howl4" + "_arrow_impact_fx", 1);
	var_1fa8c127 notify("hash_9940a3e");
	a_zombies = GetAITeamArray(level.zombie_team);
	a_filtered_zombies = Array::get_all_closest(v_hit_pos, a_zombies, undefined, undefined, 256);
	a_filtered_zombies = Array::filter(a_filtered_zombies, 0, &zm_weap_elemental_bow::function_69533776);
	a_filtered_zombies = Array::filter(a_filtered_zombies, 0, &function_8a4ae6c5);
	foreach(ai_enemy in a_filtered_zombies)
	{
		ai_enemy thread function_cc54b76(v_hit_pos);
	}
	var_1fa8c127 clientfield::set("wolf_howl_arrow_charged_trail", 0);
	var_1f9ea39b clientfield::set("wolf_howl_arrow_charged_spiral", 0);
	var_ad973460 clientfield::set("wolf_howl_arrow_charged_spiral", 0);
	function_680eabca(var_839ecff7, 0);
	var_1fa8c127.in_use = 0;
	util::wait_network_frame();
	var_1fa8c127 clientfield::set("elemental_bow_wolf_howl4" + "_arrow_impact_fx", 0);
	return;
	ERROR: Bad function call
}

/*
	Name: function_680eabca
	Namespace: namespace_d37f1c72
	Checksum: 0x35A83453
	Offset: 0x21E8
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 640
*/
function function_680eabca(var_839ecff7, b_show)
{
	if(b_show)
	{
		Array::run_all(var_839ecff7, &show);
		continue;
	}
	Array::run_all(var_839ecff7, &ghost);
}

/*
	Name: function_284ad16b
	Namespace: namespace_d37f1c72
	Checksum: 0x11186E4D
	Offset: 0x2258
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 660
*/
function function_284ad16b(var_839ecff7)
{
	var_1fa8c127 = var_839ecff7[0];
	var_1f9ea39b = var_839ecff7[1];
	var_ad973460 = var_839ecff7[2];
	var_1fa8c127 endon("movedone");
	var_1fa8c127 endon("hash_b850f1f5");
	var_1fa8c127 thread function_d0275a39(var_1f9ea39b, 1);
	var_1fa8c127 thread function_d0275a39(var_ad973460, -1);
	while(1)
	{
		var_1fa8c127 RotateRoll(360, 0.6);
		wait(0.6);
	}
}

/*
	Name: function_d0275a39
	Namespace: namespace_d37f1c72
	Checksum: 0x14EC134A
	Offset: 0x2340
	Size: 0xA0
	Parameters: 2
	Flags: None
	Line Number: 686
*/
function function_d0275a39(var_f32c22, var_5cf34103)
{
	self endon("movedone");
	self endon("hash_b850f1f5");
	while(1)
	{
		v_up = anglesToUp(self.angles);
		v_offset = v_up * 24 * var_5cf34103;
		var_f32c22.origin = self.origin + v_offset;
		wait(0.05);
	}
}

/*
	Name: function_7fb94969
	Namespace: namespace_d37f1c72
	Checksum: 0x512B1E4B
	Offset: 0x23E8
	Size: 0x100
	Parameters: 2
	Flags: None
	Line Number: 709
*/
function function_7fb94969(e_player, var_839ecff7)
{
	var_1fa8c127 = var_839ecff7[0];
	var_1f9ea39b = var_839ecff7[1];
	var_ad973460 = var_839ecff7[2];
	var_1fa8c127 endon("hash_9940a3e");
	if(zm_utility::is_player_valid(e_player))
	{
		e_player clientfield::set_to_player("wolf_howl_muzzle_flash", 1);
	}
	var_1fa8c127 clientfield::set("wolf_howl_arrow_charged_trail", 1);
	var_1f9ea39b clientfield::set("wolf_howl_arrow_charged_spiral", 1);
	var_ad973460 clientfield::set("wolf_howl_arrow_charged_spiral", 1);
}

/*
	Name: function_13709225
	Namespace: namespace_d37f1c72
	Checksum: 0x9BAB6FB7
	Offset: 0x24F0
	Size: 0x130
	Parameters: 13
	Flags: None
	Line Number: 734
*/
function function_13709225(mod, HIT_LOCATION, hit_origin, e_player, amount, weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(isalive(self) && (!(isdefined(self.isdog) && self.isdog)) && IsSubStr(weapon.name, "elemental_bow_wolf_howl") && mod !== "MOD_MELEE")
	{
		if(weapon.name != "elemental_bow_wolf_howl4")
		{
			self notify("hash_125ddb15");
			self thread function_125ddb15(e_player, amount, hit_origin, weapon);
		}
		return 1;
	}
	return 0;
}

/*
	Name: function_125ddb15
	Namespace: namespace_d37f1c72
	Checksum: 0x8B90DC0B
	Offset: 0x2628
	Size: 0x398
	Parameters: 4
	Flags: None
	Line Number: 758
*/
function function_125ddb15(e_player, n_damage, v_hit_origin, weapon)
{
	self endon("death");
	self endon("hash_125ddb15");
	self clientfield::set("wolf_howl_slow_snow_fx", 1);
	if(isdefined(level.zombie_vars[e_player.team]["zombie_insta_kill"]) && level.zombie_vars[e_player.team]["zombie_insta_kill"])
	{
		if(self.archetype === "mechz")
		{
			self DoDamage(n_damage, v_hit_origin, e_player, e_player, undefined, "MOD_PROJECTILE_SPLASH", 0, level.var_e93874ed);
			continue;
		}
		self DoDamage(self.health, self.origin, e_player, e_player, undefined, "MOD_UNKNOWN", 0, level.var_e93874ed);
		continue;
	}
	self thread function_941e308();
	if(Distance2DSquared(v_hit_origin, self.origin) < 9216)
	{
		self zm_weap_elemental_bow::function_e7b203f6(v_hit_origin);
	}
	n_timer = 0;
	var_fb2fa4bb = 1;
	if(!isdefined(self.var_e43edc00))
	{
		self.var_e43edc00 = 1;
	}
	while(var_fb2fa4bb > 0.7)
	{
		var_fb2fa4bb = var_fb2fa4bb - var_fb2fa4bb - 0.7 * 0.2;
		if(var_fb2fa4bb < 0.71)
		{
			var_fb2fa4bb = 0.7;
		}
		if(var_fb2fa4bb < self.var_e43edc00)
		{
			continue;
		}
		self.var_e43edc00 = self.var_e43edc00;
		self ASMSetAnimationRate(self.var_e43edc00);
		n_timer = n_timer + 0.1;
		wait(0.1);
	}
	self ASMSetAnimationRate(0.7);
	wait(4);
	n_timer = 0;
	self.var_e43edc00 = 0.73;
	while(self.var_e43edc00 < 1)
	{
		self.var_e43edc00 = self.var_e43edc00 + self.var_e43edc00 - 0.7 * 0.05;
		if(self.var_e43edc00 > 1)
		{
			self.var_e43edc00 = 1;
		}
		self ASMSetAnimationRate(self.var_e43edc00);
		n_timer = n_timer + 0.1;
		wait(0.1);
	}
	self clientfield::set("wolf_howl_slow_snow_fx", 0);
	self.var_e43edc00 = 1;
	self ASMSetAnimationRate(1);
}

/*
	Name: function_941e308
	Namespace: namespace_d37f1c72
	Checksum: 0xEF5CA10
	Offset: 0x29C8
	Size: 0x34
	Parameters: 0
	Flags: None
	Line Number: 830
*/
function function_941e308()
{
	self waittill("death");
	if(isdefined(self))
	{
		self ASMSetAnimationRate(1);
	}
}

