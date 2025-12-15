#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\throttle_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace zm_weap_elemental_bow;

/*
	Name: __init__sytem__
	Namespace: zm_weap_elemental_bow
	Checksum: 0xA3930A10
	Offset: 0x638
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 25
*/
function autoexec __init__sytem__()
{
	system::register("_zm_weap_elemental_bow", &__init__, &__main__, undefined);
	return;
}

/*
	Name: __init__
	Namespace: zm_weap_elemental_bow
	Checksum: 0xA02D53E6
	Offset: 0x680
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 41
*/
function __init__()
{
	level.var_be94cdb = GetWeapon("elemental_bow");
	level.var_2ba21a4f = 1750;
	level.var_be2a3bf1 = 3500;
	level.var_e4bb1a5a = level.var_be2a3bf1 - level.var_2ba21a4f;
	level.var_1a828a16 = GetWeapon("elemental_bow4");
	clientfield::register("toplayer", "elemental_bow" + "_ambient_bow_fx", 1, 1, "int");
	clientfield::register("missile", "elemental_bow" + "_arrow_impact_fx", 1, 1, "int");
	clientfield::register("missile", "elemental_bow4" + "_arrow_impact_fx", 1, 1, "int");
	callback::on_connect(&function_30a3a950);
	SetDvar("bg_chargeShotUseOneAmmoForMultipleBullets", 0);
	SetDvar("bg_zm_dlc1_chargeShotMultipleBulletsForFullCharge", 2);
	function_9b385ca5();
	object = Throttle;
	function_9b385ca5();
	level.var_edf54a81 = object;
	Initialize(level.var_edf54a81, 6);
	thread function_c9dca87f();
}

/*
	Name: function_c9dca87f
	Namespace: zm_weap_elemental_bow
	Checksum: 0xF8CFDC0F
	Offset: 0x870
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_c9dca87f()
{
	a_array = GetEntArray("elemental_bow_pickup", "targetname");
	if(!isdefined(a_array) || !IsArray(a_array) || a_array.size < 1)
	{
		return;
	}
	foreach(e_trig in a_array)
	{
		e_trig thread pickup(GetWeapon(e_trig.script_string));
	}
}

/*
	Name: pickup
	Namespace: zm_weap_elemental_bow
	Checksum: 0x413AC407
	Offset: 0x988
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 95
*/
function pickup(w_weapon)
{
	self setHintString("Press and hold ^3&&1^7 to take " + w_weapon.displayName);
	while(isdefined(self))
	{
		self waittill("trigger", e_player);
		if(e_player laststand::player_is_in_laststand() || (isdefined(e_player.intermission) && e_player.intermission))
		{
			continue;
		}
		if(e_player zm_utility::in_revive_trigger())
		{
			return 0;
		}
		if(e_player.IS_DRINKING > 0)
		{
			return 0;
		}
		if(!zm_utility::is_player_valid(e_player))
		{
			return 0;
		}
		e_player thread function_c83b4a6(w_weapon);
	}
}

/*
	Name: function_c83b4a6
	Namespace: zm_weap_elemental_bow
	Checksum: 0x6DB5F733
	Offset: 0xA98
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 131
*/
function function_c83b4a6(w_weapon)
{
	self zm_weapons::weapon_give(w_weapon, undefined, undefined, undefined, 1);
}

/*
	Name: __main__
	Namespace: zm_weap_elemental_bow
	Checksum: 0x9ACF73B8
	Offset: 0xAD0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 146
*/
function __main__()
{
}

/*
	Name: function_30a3a950
	Namespace: zm_weap_elemental_bow
	Checksum: 0xEF4B0A01
	Offset: 0xAE0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 160
*/
function function_30a3a950()
{
	self thread function_59d385a8("elemental_bow");
	self thread function_1160e0e9("elemental_bow", "elemental_bow4");
	self thread function_a991479f("elemental_bow", "elemental_bow4", &function_415f0eae);
}

/*
	Name: function_415f0eae
	Namespace: zm_weap_elemental_bow
	Checksum: 0x200B74ED
	Offset: 0xB68
	Size: 0x160
	Parameters: 5
	Flags: None
	Line Number: 177
*/
function function_415f0eae(weapon, v_position, radius, attacker, normal)
{
	var_9abed733 = function_b0c6a600(weapon.name);
	if(weapon.name == "elemental_bow4")
	{
		attacker clientfield::set(var_9abed733 + "_arrow_impact_fx", 1);
		a_zombies = Array::get_all_closest(v_position, GetAITeamArray(level.zombie_team), undefined, undefined, 128);
		a_zombies = Array::filter(a_zombies, 0, &function_6fe8c72e, v_position);
		Array::thread_all(a_zombies, &function_3285e668, self, v_position);
		continue;
	}
	attacker clientfield::set(var_9abed733 + "_arrow_impact_fx", 1);
}

/*
	Name: function_6fe8c72e
	Namespace: zm_weap_elemental_bow
	Checksum: 0x4F4FF39A
	Offset: 0xCD0
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 201
*/
function function_6fe8c72e(ai_enemy, impact_org)
{
	return isalive(ai_enemy) && (!(isdefined(ai_enemy.var_a940fc8b) && ai_enemy.var_a940fc8b)) && BulletTracePassed(ai_enemy GetCentroid(), impact_org + VectorScale((0, 0, 1), 48), 0, undefined);
}

/*
	Name: function_3285e668
	Namespace: zm_weap_elemental_bow
	Checksum: 0xB4D2590D
	Offset: 0xD70
	Size: 0x208
	Parameters: 2
	Flags: None
	Line Number: 216
*/
function function_3285e668(e_player, impact_org)
{
	self endon("death");
	if(self.archetype === "mechz")
	{
		return;
	}
	self.var_a940fc8b = 1;
	n_damage = 2233;
	if(self.health > 2233)
	{
		self thread function_e7b203f6(impact_org);
		continue;
	}
	self StartRagdoll();
	n_dist = Distance2D(self.origin, impact_org);
	var_206be3a1 = 128 - n_dist / 128;
	var_7397b986 = VectorNormalize(self GetCentroid() - impact_org);
	if(var_7397b986[2] < 0.8)
	{
		var_7397b986 = (var_7397b986[0], var_7397b986[1], 0.8);
	}
	self LaunchRagdoll(var_7397b986 * 96 * var_206be3a1);
	wait(0.1);
	self zm_spawner::zombie_explodes_intopieces(0);
	if(isdefined(self))
	{
		WaitInQueue(level.var_edf54a81);
		if(isdefined(self))
		{
			self DoDamage(n_damage, self.origin, e_player, e_player, undefined, "MOD_PROJECTILE_SPLASH", 0, level.var_1a828a16);
			self.var_a940fc8b = 0;
		}
	}
}

/*
	Name: function_59d385a8
	Namespace: zm_weap_elemental_bow
	Checksum: 0x905133DD
	Offset: 0xF80
	Size: 0x210
	Parameters: 1
	Flags: None
	Line Number: 262
*/
function function_59d385a8(var_9abed733)
{
	self endon("death");
	w_bow = GetWeapon(var_9abed733);
	while(1)
	{
		self waittill("weapon_change", var_9f85aad5, var_6efca128);
		if(var_9f85aad5 === w_bow)
		{
			if(!(isdefined(self.var_b86c39fe) && self.var_b86c39fe))
			{
				if(isdefined(self.hintelem))
				{
					self.hintelem setText("");
					self.hintelem destroy();
				}
				if(self IsSplitscreen())
				{
					self thread zm_equipment::show_hint_text("Press ^3[{+attack}]^7 to shoot\nHold ^3[{+attack}]^7 to shoot a charged shot\nCharged shots use extra arrows", 8, 1, 150);
					continue;
				}
				self thread zm_equipment::show_hint_text("Press ^3[{+attack}]^7 to shoot\nHold ^3[{+attack}]^7 to shoot a charged shot\nCharged shots use extra arrows", 8);
				self.var_b86c39fe = 1;
			}
			if(isdefined(level.var_8506b53f))
			{
				self thread [[level.var_8506b53f]]();
			}
			self util::waittill_any_timeout(1, "weapon_change_complete", "death");
			self clientfield::set_to_player(var_9abed733 + "_ambient_bow_fx", 1);
		}
		else if(var_6efca128 === w_bow)
		{
			self clientfield::set_to_player(var_9abed733 + "_ambient_bow_fx", 0);
			self StopRumble("bow_draw_loop");
		}
	}
}

/*
	Name: function_1160e0e9
	Namespace: zm_weap_elemental_bow
	Checksum: 0x7A9D4AEF
	Offset: 0x1198
	Size: 0xB0
	Parameters: 3
	Flags: None
	Line Number: 311
*/
function function_1160e0e9(w_bow, var_169edd0c, var_3c5eca15)
{
	if(!isdefined(var_3c5eca15))
	{
		var_3c5eca15 = undefined;
	}
	self endon("death");
	if(!isdefined(var_3c5eca15))
	{
		return;
	}
	while(1)
	{
		self waittill("missile_fire", projectile, weapon);
		if(IsSubStr(weapon.name, w_bow))
		{
			self thread [[var_3c5eca15]](projectile, weapon);
		}
	}
}

/*
	Name: function_9504ee38
	Namespace: zm_weap_elemental_bow
	Checksum: 0x22657EE6
	Offset: 0x1250
	Size: 0x1A8
	Parameters: 1
	Flags: None
	Line Number: 342
*/
function function_9504ee38(str_weapon_name)
{
	if(!isdefined(str_weapon_name))
	{
		return 0;
	}
	if(str_weapon_name == "elemental_bow" || str_weapon_name == "elemental_bow2" || str_weapon_name == "elemental_bow3" || str_weapon_name == "elemental_bow4" || str_weapon_name == "elemental_bow_demongate" || str_weapon_name == "elemental_bow_demongate2" || str_weapon_name == "elemental_bow_demongate3" || str_weapon_name == "elemental_bow_demongate4" || str_weapon_name == "elemental_bow_rune_prison" || str_weapon_name == "elemental_bow_rune_prison_ricochet" || str_weapon_name == "elemental_bow_rune_prison2" || str_weapon_name == "elemental_bow_rune_prison3" || str_weapon_name == "elemental_bow_rune_prison4" || str_weapon_name == "elemental_bow_rune_prison4_ricochet" || str_weapon_name == "elemental_bow_storm" || str_weapon_name == "elemental_bow_storm_ricochet" || str_weapon_name == "elemental_bow_storm2" || str_weapon_name == "elemental_bow_storm3" || str_weapon_name == "elemental_bow_storm4" || str_weapon_name == "elemental_bow_storm4_ricochet" || str_weapon_name == "elemental_bow_wolf_howl" || str_weapon_name == "elemental_bow_wolf_howl2" || str_weapon_name == "elemental_bow_wolf_howl3" || str_weapon_name == "elemental_bow_wolf_howl4")
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_11efb44d
	Namespace: zm_weap_elemental_bow
	Checksum: 0xD38DDBAB
	Offset: 0x1400
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 365
*/
function function_11efb44d(str_weapon_name)
{
	if(!isdefined(str_weapon_name))
	{
		return 0;
	}
	if(str_weapon_name == "elemental_bow4" || str_weapon_name == "elemental_bow_demongate4" || str_weapon_name == "elemental_bow_rune_prison4" || str_weapon_name == "elemental_bow_rune_prison4_ricochet" || str_weapon_name == "elemental_bow_storm4" || str_weapon_name == "elemental_bow_storm4_ricochet" || str_weapon_name == "elemental_bow_wolf_howl4")
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_f2955907
	Namespace: zm_weap_elemental_bow
	Checksum: 0xA655E09A
	Offset: 0x14A0
	Size: 0x248
	Parameters: 2
	Flags: None
	Line Number: 388
*/
function function_f2955907(str_weapon_name, var_25c1c42e)
{
	if(!isdefined(str_weapon_name))
	{
		return 0;
	}
	switch(var_25c1c42e)
	{
		case "elemental_bow":
		{
			if(str_weapon_name == "elemental_bow" || str_weapon_name == "elemental_bow2" || str_weapon_name == "elemental_bow3" || str_weapon_name == "elemental_bow4")
			{
				return 1;
				break;
			}
		}
		case "elemental_bow_demongate":
		{
			if(str_weapon_name == "elemental_bow_demongate" || str_weapon_name == "elemental_bow_demongate2" || str_weapon_name == "elemental_bow_demongate3" || str_weapon_name == "elemental_bow_demongate4")
			{
				return 1;
				break;
			}
		}
		case "elemental_bow_rune_prison":
		{
			if(str_weapon_name == "elemental_bow_rune_prison" || str_weapon_name == "elemental_bow_rune_prison_ricochet" || str_weapon_name == "elemental_bow_rune_prison2" || str_weapon_name == "elemental_bow_rune_prison3" || str_weapon_name == "elemental_bow_rune_prison4" || str_weapon_name == "elemental_bow_rune_prison4_ricochet")
			{
				return 1;
				break;
			}
		}
		case "elemental_bow_storm":
		{
			if(str_weapon_name == "elemental_bow_storm" || str_weapon_name == "elemental_bow_storm_ricochet" || str_weapon_name == "elemental_bow_storm2" || str_weapon_name == "elemental_bow_storm3" || str_weapon_name == "elemental_bow_storm4" || str_weapon_name == "elemental_bow_storm4_ricochet")
			{
				return 1;
				break;
			}
		}
		case "elemental_bow_wolf_howl":
		{
			if(str_weapon_name == "elemental_bow_wolf_howl" || str_weapon_name == "elemental_bow_wolf_howl2" || str_weapon_name == "elemental_bow_wolf_howl3" || str_weapon_name == "elemental_bow_wolf_howl4")
			{
				return 1;
				break;
			}
		}
		default
		{
			/#
				/#
					Assert(0, "Dev Block strings are not supported");
					break;
				#/
			#/
		}
	}
	return 0;
}

/*
	Name: function_41a3169b
	Namespace: zm_weap_elemental_bow
	Checksum: 0xAC7FA90C
	Offset: 0x16F0
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 459
*/
function function_41a3169b(str_weapon_name)
{
	if(!isdefined(str_weapon_name))
	{
		return 0;
	}
	if(str_weapon_name == "elemental_bow_demongate" || str_weapon_name == "elemental_bow_demongate2" || str_weapon_name == "elemental_bow_demongate3" || str_weapon_name == "elemental_bow_demongate4" || str_weapon_name == "elemental_bow_rune_prison" || str_weapon_name == "elemental_bow_rune_prison_ricochet" || str_weapon_name == "elemental_bow_rune_prison2" || str_weapon_name == "elemental_bow_rune_prison3" || str_weapon_name == "elemental_bow_rune_prison4" || str_weapon_name == "elemental_bow_rune_prison4_ricochet" || str_weapon_name == "elemental_bow_storm" || str_weapon_name == "elemental_bow_storm_ricochet" || str_weapon_name == "elemental_bow_storm2" || str_weapon_name == "elemental_bow_storm3" || str_weapon_name == "elemental_bow_storm4" || str_weapon_name == "elemental_bow_storm4_ricochet" || str_weapon_name == "elemental_bow_wolf_howl" || str_weapon_name == "elemental_bow_wolf_howl2" || str_weapon_name == "elemental_bow_wolf_howl3" || str_weapon_name == "elemental_bow_wolf_howl4")
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_a991479f
	Namespace: zm_weap_elemental_bow
	Checksum: 0xE02ABD14
	Offset: 0x1860
	Size: 0x1C0
	Parameters: 3
	Flags: None
	Line Number: 482
*/
function function_a991479f(w_bow, var_169edd0c, var_e76a7710)
{
	if(!isdefined(var_e76a7710))
	{
		var_e76a7710 = undefined;
	}
	self endon("death");
	while(1)
	{
		self waittill("projectile_impact", weapon, v_position, radius, e_projectile, normal);
		var_c59715f9 = function_b0c6a600(weapon.name);
		if(var_c59715f9 == w_bow || var_c59715f9 == var_169edd0c)
		{
			if(var_c59715f9 != "elemental_bow" && var_c59715f9 != "elemental_bow_wolf_howl4" && isdefined(e_projectile.birthtime))
			{
				if(GetTime() - e_projectile.birthtime <= 150)
				{
					radiusdamage(v_position, 32, level.zombie_health, level.zombie_health, self, "MOD_UNKNOWN", weapon);
				}
			}
			self thread function_8c51e661(var_c59715f9, v_position);
			if(isdefined(var_e76a7710))
			{
				self thread [[var_e76a7710]](weapon, v_position, radius, e_projectile, normal);
			}
			self thread function_9068f6e4(weapon, v_position);
		}
	}
}

/*
	Name: function_8c51e661
	Namespace: zm_weap_elemental_bow
	Checksum: 0xC7393B31
	Offset: 0x1A28
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 522
*/
function function_8c51e661(var_c59715f9, v_position)
{
	if(var_c59715f9 === "elemental_bow_wolf_howl4")
	{
		return;
	}
	Array::thread_all(getaiarchetypearray("mechz"), &function_bb903d1d, self, var_c59715f9, v_position);
	return;
	~;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_bb903d1d
	Namespace: zm_weap_elemental_bow
	Checksum: 0x758280C
	Offset: 0x1AA0
	Size: 0x388
	Parameters: 3
	Flags: None
	Line Number: 544
*/
function function_bb903d1d(e_player, var_c59715f9, v_position)
{
	var_8608982 = 0;
	var_c46a3f86 = 0;
	var_190ac134 = 0;
	if(!IsSubStr(var_c59715f9, "4"))
	{
		var_190ac134 = 1;
		var_8a4806bb = 9216;
		var_c23df038 = 96;
		var_a484d8c1 = 0.25;
	}
	else if(var_c59715f9 == "elemental_bow4")
	{
		var_190ac134 = 1;
		var_8a4806bb = 20736;
		var_c23df038 = 144;
		var_a484d8c1 = 0.1;
	}
	var_d5d3e3d = DistanceSquared(v_position, self.origin);
	var_dad11536 = DistanceSquared(v_position, self GetTagOrigin("j_neck"));
	if(var_d5d3e3d < 1600 || var_dad11536 < 2304)
	{
		var_8608982 = 1;
		var_c46a3f86 = 1;
	}
	else if(var_190ac134 && (var_d5d3e3d < var_8a4806bb || var_dad11536 < var_8a4806bb))
	{
		var_8608982 = 1;
		var_c46a3f86 = 1 - var_a484d8c1;
		if(var_d5d3e3d < var_dad11536)
		{
			continue;
		}
		var_c46a3f86 = var_d5d3e3d * sqrt(var_dad11536) / var_c23df038;
		var_c46a3f86 = 1 - var_c46a3f86;
	}
	if(var_8608982)
	{
		var_8c20fc25 = level.mechz_health;
		if(isdefined(level.var_70c83900))
		{
			var_8c20fc25 = math::clamp(var_8c20fc25, 0, level.var_70c83900);
		}
		if(var_c59715f9 == "elemental_bow")
		{
			var_aa02134e = function_341f074(0.15, 0.03);
		}
		else if(var_c59715f9 == "elemental_bow4")
		{
			var_aa02134e = function_341f074(0.25, 0.12);
		}
		else if(!IsSubStr(var_c59715f9, "4"))
		{
			var_aa02134e = 0.1;
			continue;
		}
		var_aa02134e = 0.35;
		var_95e3dfb6 = var_8c20fc25 * var_aa02134e / 0.2;
		var_95e3dfb6 = var_95e3dfb6 * var_c46a3f86;
		self DoDamage(var_95e3dfb6, self.origin, e_player, e_player, undefined, "MOD_PROJECTILE_SPLASH", 0, level.var_be94cdb);
	}
}

/*
	Name: function_341f074
	Namespace: zm_weap_elemental_bow
	Checksum: 0x6AC76A17
	Offset: 0x1E30
	Size: 0xC0
	Parameters: 2
	Flags: None
	Line Number: 618
*/
function function_341f074(var_9d67bc95, var_884914fb)
{
	if(level.mechz_health < level.var_2ba21a4f)
	{
		var_aa02134e = var_9d67bc95;
	}
	else if(level.mechz_health > level.var_be2a3bf1)
	{
		var_aa02134e = var_884914fb;
		continue;
	}
	var_a30981f9 = level.mechz_health - level.var_2ba21a4f;
	var_c7425fa4 = var_a30981f9 / level.var_e4bb1a5a;
	var_aa02134e = var_9d67bc95 - var_9d67bc95 - var_884914fb * var_c7425fa4;
	return var_aa02134e;
}

/*
	Name: function_9068f6e4
	Namespace: zm_weap_elemental_bow
	Checksum: 0x4D7B0848
	Offset: 0x1EF8
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 645
*/
function function_9068f6e4(weapon, v_position)
{
	util::wait_network_frame();
	radiusdamage(v_position, 24, 1, 1, self, undefined, weapon);
}

/*
	Name: function_69533776
	Namespace: zm_weap_elemental_bow
	Checksum: 0x48F3C6BE
	Offset: 0x1F50
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 661
*/
function function_69533776(ai_enemy)
{
	b_callback_result = 1;
	if(isdefined(level.var_8880179d))
	{
		b_callback_result = [[level.var_8880179d]](ai_enemy);
	}
	return isdefined(ai_enemy) && isalive(ai_enemy) && !ai_enemy IsRagdoll() && (!(isdefined(ai_enemy.var_a940fc8b) && ai_enemy.var_a940fc8b)) && (!(isdefined(ai_enemy.var_cfab1aef) && ai_enemy.var_cfab1aef)) && b_callback_result;
}

/*
	Name: function_e7b203f6
	Namespace: zm_weap_elemental_bow
	Checksum: 0xED2BF722
	Offset: 0x2030
	Size: 0x2C8
	Parameters: 1
	Flags: None
	Line Number: 681
*/
function function_e7b203f6(var_de8fda51)
{
	self endon("death");
	if(!(isdefined(self.KNOCKDOWN) && self.KNOCKDOWN) && (!(isdefined(self.missingLegs) && self.missingLegs)))
	{
		self.KNOCKDOWN = 1;
		self SetPlayerCollision(0);
		var_8b2731a6 = var_de8fda51 - self.origin;
		var_ac3eb0f = VectorNormalize((var_8b2731a6[0], var_8b2731a6[1], 0));
		v_zombie_forward = VectorNormalize((AnglesToForward(self.angles)[0], AnglesToForward(self.angles)[1], 0));
		v_zombie_right = VectorNormalize((AnglesToRight(self.angles)[0], AnglesToRight(self.angles)[1], 0));
		v_dot = VectorDot(var_ac3eb0f, v_zombie_forward);
		if(v_dot >= 0.5)
		{
			self.knockdown_direction = "front";
			self.getup_direction = "getup_back";
		}
		else if(v_dot < 0.5 && v_dot > -0.5)
		{
			v_dot = VectorDot(var_ac3eb0f, v_zombie_right);
			if(v_dot > 0)
			{
				self.knockdown_direction = "right";
				if(math::cointoss())
				{
					self.getup_direction = "getup_back";
					continue;
				}
				self.getup_direction = "getup_belly";
				continue;
			}
			self.knockdown_direction = "left";
			self.getup_direction = "getup_belly";
			continue;
		}
		self.knockdown_direction = "back";
		self.getup_direction = "getup_belly";
		wait(2.5);
		self SetPlayerCollision(1);
		self.KNOCKDOWN = 0;
	}
}

/*
	Name: function_665a02cd
	Namespace: zm_weap_elemental_bow
	Checksum: 0x57F2AAB6
	Offset: 0x2300
	Size: 0x250
	Parameters: 5
	Flags: None
	Line Number: 734
*/
function function_665a02cd(v_hit_origin, str_weapon_name, var_d628726d, var_abb14a44, var_382d96e7)
{
	if(!isdefined(var_382d96e7))
	{
		var_382d96e7 = undefined;
	}
	var_2ac940ea = AnglesToForward(var_d628726d.angles);
	if(var_2ac940ea[2] != -1)
	{
		var_77cd5ddb = VectorNormalize(var_2ac940ea * -1);
		var_efd7bb19 = v_hit_origin + var_77cd5ddb * var_abb14a44;
		continue;
	}
	var_efd7bb19 = v_hit_origin + (0, 0, 1);
	a_trace = bullettrace(var_efd7bb19, var_efd7bb19 - VectorScale((0, 0, 1), 1000), 0, undefined);
	var_abb14a44 = var_efd7bb19[2] - a_trace["position"][2];
	var_9abed733 = function_b0c6a600(str_weapon_name);
	if(!IsPointOnNavMesh(a_trace["position"]))
	{
		var_d628726d clientfield::set(var_9abed733 + "_arrow_impact_fx", 1);
		return undefined;
	}
	if(var_abb14a44 > 72)
	{
		if(isdefined(var_382d96e7))
		{
			self thread [[var_382d96e7]](str_weapon_name, var_efd7bb19, a_trace["position"]);
			continue;
		}
		self thread function_80270f41(str_weapon_name, var_efd7bb19, a_trace["position"]);
		return undefined;
	}
	var_d628726d clientfield::set(var_9abed733 + "_arrow_impact_fx", 1);
	return a_trace["position"];
}

/*
	Name: function_80270f41
	Namespace: zm_weap_elemental_bow
	Checksum: 0x3BE16BA0
	Offset: 0x2558
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 780
*/
function function_80270f41(str_weapon_name, v_source, v_destination)
{
	wait(0.1);
	MagicBullet(GetWeapon(str_weapon_name), v_source, v_destination, self);
}

/*
	Name: function_b0c6a600
	Namespace: zm_weap_elemental_bow
	Checksum: 0x3C015FDD
	Offset: 0x25B8
	Size: 0xFE
	Parameters: 1
	Flags: None
	Line Number: 796
*/
function function_b0c6a600(str_weapon_name)
{
	var_c59715f9 = str_weapon_name;
	if(IsSubStr(var_c59715f9, "ricochet"))
	{
		var_c4b39c6c = function_4d1b4da2(var_c59715f9, "_ricochet");
		var_c59715f9 = var_c4b39c6c[0];
	}
	if(IsSubStr(var_c59715f9, "2"))
	{
		var_c59715f9 = StrTok(var_c59715f9, "2")[0];
	}
	if(IsSubStr(var_c59715f9, "3"))
	{
		var_c59715f9 = StrTok(var_c59715f9, "3")[0];
	}
	return var_c59715f9;
}

