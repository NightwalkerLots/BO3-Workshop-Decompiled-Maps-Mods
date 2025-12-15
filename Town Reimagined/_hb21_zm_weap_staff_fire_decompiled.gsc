#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
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

#namespace namespace_ec041286;

/*
	Name: __init__sytem__
	Namespace: namespace_ec041286
	Checksum: 0x52CF9064
	Offset: 0x6F8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 43
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_staff_fire", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_ec041286
	Checksum: 0xE3A96E40
	Offset: 0x738
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function __init__()
{
	callback::on_spawned(&function_1825f523);
	zm_utility::register_melee_weapon_for_level("t7_staff_fire_melee");
	zm_spawner::register_zombie_damage_callback(&staff_fire_zombie_damage_response);
	zm_spawner::register_zombie_death_event_callback(&staff_fire_death_event);
}

/*
	Name: function_1825f523
	Namespace: namespace_ec041286
	Checksum: 0x535CCD68
	Offset: 0x7C0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_1825f523()
{
	self thread function_999b9a3d();
}

/*
	Name: function_999b9a3d
	Namespace: namespace_ec041286
	Checksum: 0xA74F9986
	Offset: 0x7E8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 91
*/
function function_999b9a3d()
{
	self notify("watch_staff_fire_fired");
	self endon("disconnect");
	self endon("watch_staff_fire_fired");
	while(1)
	{
		self waittill("hash_3c96a1ed", e_projectile, str_weapon, var_16f4cf62);
		self SetInfraredVision(1);
		if(var_16f4cf62 >= 2)
		{
			e_projectile thread function_46813fa0(self, str_weapon, var_16f4cf62);
			if(!(isdefined(e_projectile.additional_shot) && e_projectile.additional_shot))
			{
				self function_337884c2(str_weapon, var_16f4cf62);
				continue;
			}
		}
		self function_9c219588(str_weapon);
	}
}

/*
	Name: function_9c219588
	Namespace: namespace_ec041286
	Checksum: 0xB050FA7A
	Offset: 0x900
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 123
*/
function function_9c219588(str_weapon)
{
	v_fwd = self GetWeaponForwardDir();
	fire_angles = VectorToAngles(v_fwd);
	fire_origin = self GetWeaponMuzzlePoint();
	trace = bullettrace(fire_origin, fire_origin + v_fwd * 100, 0, undefined);
	if(trace["fraction"] != 1)
	{
		return;
	}
	v_left_angles = (fire_angles[0], fire_angles[1] - 15, fire_angles[2]);
	v_left = AnglesToForward(v_left_angles);
	e_proj = self function_a2d9c5b2(str_weapon, fire_origin, v_left * 1000, self);
	e_proj.additional_shot = 1;
	v_right_angles = (fire_angles[0], fire_angles[1] + 15, fire_angles[2]);
	v_right = AnglesToForward(v_right_angles);
	e_proj = self function_a2d9c5b2(str_weapon, fire_origin, v_right * 1000, self);
	e_proj.additional_shot = 1;
}

/*
	Name: function_337884c2
	Namespace: namespace_ec041286
	Checksum: 0xB18C8FF3
	Offset: 0xB08
	Size: 0x130
	Parameters: 2
	Flags: None
	Line Number: 153
*/
function function_337884c2(str_weapon, var_16f4cf62)
{
	self endon("disconnect");
	self endon("death");
	self endon("weapon_change");
	n_shots = 1;
	if(var_16f4cf62 == 3)
	{
		n_shots = 2;
	}
	for(i = 1; i <= n_shots; i++)
	{
		wait(0.35);
		v_player_angles = VectorToAngles(self GetWeaponForwardDir());
		v_shot_start = self GetWeaponMuzzlePoint();
		v_shot_end = v_shot_start + AnglesToForward(v_player_angles) * 1000;
		self thread function_cc733793(str_weapon, var_16f4cf62);
	}
}

/*
	Name: function_cc733793
	Namespace: namespace_ec041286
	Checksum: 0x670A9B8
	Offset: 0xC40
	Size: 0x100
	Parameters: 2
	Flags: None
	Line Number: 183
*/
function function_cc733793(str_weapon, var_16f4cf62)
{
	v_player_angles = VectorToAngles(self GetWeaponForwardDir());
	v_shot_start = self GetWeaponMuzzlePoint();
	v_shot_end = v_shot_start + AnglesToForward(v_player_angles) * 1000;
	e_proj = MagicBullet(str_weapon, v_shot_start, v_shot_end, self);
	e_proj.additional_shot = 1;
	e_proj function_46813fa0(self, str_weapon, var_16f4cf62);
	return;
}

/*
	Name: function_46813fa0
	Namespace: namespace_ec041286
	Checksum: 0x1320E8EA
	Offset: 0xD48
	Size: 0x418
	Parameters: 3
	Flags: None
	Line Number: 204
*/
function function_46813fa0(e_attacker, str_weapon, var_16f4cf62)
{
	self util::waittill_any("grenade_bounce", "stationary", "death", "explode");
	if(!isdefined(self))
	{
		return;
	}
	v_pos = self.origin;
	self thread namespace_951345fe::function_880d6c62();
	ent = spawn("script_origin", v_pos);
	ent SetModel("tag_origin");
	ent.angles = self.angles;
	ent PlayLoopSound("wpn_firestaff_proj_loop", 1);
	ent PlayLoopSound("wpn_firestaff_grenade_loop", 1);
	PlayFXOnTag("harry/staff/fire/fx_staff_fire_aoe", ent, "tag_origin");
	playsoundatposition("wpn_firestaff_upgraded_proj_impact", ent.origin);
	n_alive_time = 5;
	aoe_radius = 80;
	if(var_16f4cf62 == 3)
	{
		aoe_radius = 100;
	}
	damage = function_bb1e2502(str_weapon.name, var_16f4cf62);
	n_step_size = 0.2;
	while(n_alive_time > 0)
	{
		if(n_alive_time - n_step_size <= 0)
		{
			aoe_radius = aoe_radius * 2;
		}
		a_targets = GetAISpeciesArray("axis", "all");
		a_targets = util::get_array_of_closest(v_pos, a_targets, undefined, undefined, aoe_radius);
		wait(n_step_size);
		n_alive_time = n_alive_time - n_step_size;
		_a213 = a_targets;
		for(_k213 = getFirstArrayKey(_a213); isdefined(_k213); _k213 = getFirstArrayKey(_a213))
		{
			e_target = _a213[_k213];
			b_trace_pass = BulletTracePassed(ent.origin, e_target GetTagOrigin("j_spine4"), 0, e_target);
			if(isdefined(e_target) && b_trace_pass && isalive(e_target) && (!(isdefined(e_target.var_f8de3d9) && e_target.var_f8de3d9)))
			{
				e_target thread function_f7210721(str_weapon, e_attacker, damage, var_16f4cf62);
			}
		}
	}
	wait(1);
	playsoundatposition("wpn_firestaff_upgraded_proj_impact", ent.origin);
	ent delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: staff_fire_zombie_damage_response
	Namespace: namespace_ec041286
	Checksum: 0x92747AAA
	Offset: 0x1168
	Size: 0xB8
	Parameters: 13
	Flags: None
	Line Number: 266
*/
function staff_fire_zombie_damage_response(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(self is_staff_fire_damage())
	{
		self thread function_a8df72d5(str_mod, w_weapon, e_player, n_amount);
		return 1;
	}
	return 0;
}

/*
	Name: function_a8df72d5
	Namespace: namespace_ec041286
	Checksum: 0xA4C420C3
	Offset: 0x1228
	Size: 0x1A8
	Parameters: 4
	Flags: None
	Line Number: 286
*/
function function_a8df72d5(mod, damageWeapon, player, amount)
{
	player endon("disconnect");
	if(!isalive(self))
	{
		return;
	}
	if(mod != "MOD_BURNED")
	{
		pct_from_center = amount - 1 / 10;
		pct_damage = 0.5 + 0.5 * pct_from_center;
		if(isdefined(self namespace_951345fe::function_8b325b40()) && self namespace_951345fe::function_8b325b40())
		{
			self thread function_6c1533b4(damageWeapon, player, pct_damage);
			continue;
		}
		var_9e79cf1 = function_bb1e2502(damageWeapon.name, 0);
		self DoDamage(var_9e79cf1, self.origin, player, player, 0, "MOD_BURNED", -1, damageWeapon);
		if(isalive(self))
		{
			self thread function_f7210721(damageWeapon, player, pct_damage, player.var_900bd247);
		}
	}
}

/*
	Name: staff_fire_death_event
	Namespace: namespace_ec041286
	Checksum: 0xF5A32E60
	Offset: 0x13D8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 321
*/
function staff_fire_death_event(attacker)
{
	if(is_staff_fire_damage())
	{
		self thread function_1b510b78();
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1b510b78
	Namespace: namespace_ec041286
	Checksum: 0x9F8418BC
	Offset: 0x1420
	Size: 0x300
	Parameters: 0
	Flags: None
	Line Number: 342
*/
function function_1b510b78()
{
	if(isdefined(self.marked_for_death) && self.marked_for_death)
	{
		return;
	}
	self.staff_hit = 1;
	self.marked_for_death = 1;
	self thread zombie_death::flame_death_fx();
	self thread zombie_utility::zombie_eye_glow_stop();
	if(!(isdefined(self.missingLegs) && self.missingLegs) && (!(isdefined(self namespace_951345fe::function_8b325b40()) && self namespace_951345fe::function_8b325b40())) && isdefined(self))
	{
		anims = RandomInt(5);
		if(anims == 0)
		{
			anim_to_play = "ai_zm_dlc5_zombie_firestaff_death_collapse_a";
		}
		else if(anims == 1)
		{
			anim_to_play = "ai_zm_dlc5_zombie_firestaff_death_collapse_b";
		}
		else if(anims == 2)
		{
			anim_to_play = "ai_zm_dlc5_zombie_firestaff_death_walking_a";
		}
		else if(anims == 3)
		{
			anim_to_play = "ai_zm_dlc5_zombie_firestaff_death_walking_b";
			continue;
		}
		anim_to_play = "ai_zm_dlc5_zombie_firestaff_death_walking_c";
		end_pos = zombie_utility::getAnimEndPos(anim_to_play);
		trace_pos = playerphysicstrace(self.origin, end_pos);
		if(end_pos != trace_pos)
		{
			anims = RandomInt(2);
			if(anims == 0)
			{
				anim_to_play = "ai_zm_dlc5_zombie_firestaff_death_collapse_a";
				continue;
			}
			anim_to_play = "ai_zm_dlc5_zombie_firestaff_death_collapse_b";
			continue;
		}
		self AnimScripted(anim_to_play, self.origin, self.angles, anim_to_play);
		wait(getanimlength(anim_to_play));
		anims = RandomInt(2);
		if(anims == 0)
		{
			anim_to_play = "ai_zm_dlc5_zombie_firestaff_death_collapse_a";
			continue;
		}
		anim_to_play = "ai_zm_dlc5_zombie_firestaff_death_collapse_b";
		if(!isdefined(self))
		{
			return;
		}
		self AnimScripted(anim_to_play, self.origin, self.angles, anim_to_play);
		wait(getanimlength(anim_to_play));
		if(isdefined(self))
		{
			self StartRagdoll();
			return;
		}
	}
}

/*
	Name: function_c5c292af
	Namespace: namespace_ec041286
	Checksum: 0x2C17BD02
	Offset: 0x1728
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 419
*/
function function_c5c292af(n_duration)
{
	self endon("death");
	wait(n_duration);
	self.var_f8de3d9 = 0;
	self notify("stop_flame_damage");
}

/*
	Name: function_f7210721
	Namespace: namespace_ec041286
	Checksum: 0x632FC7B1
	Offset: 0x1768
	Size: 0x220
	Parameters: 4
	Flags: None
	Line Number: 437
*/
function function_f7210721(damageWeapon, e_attacker, pct_damage, var_16f4cf62)
{
	if(!isalive(self))
	{
		return;
	}
	if(!isdefined(pct_damage))
	{
		pct_damage = 1;
	}
	if(isdefined(self.var_f8de3d9) && self.var_f8de3d9)
	{
		return;
	}
	self thread zombie_death::flame_death_fx();
	was_on_fire = isdefined(self.var_f8de3d9) && self.var_f8de3d9;
	n_initial_dmg = function_bb1e2502(damageWeapon.name, var_16f4cf62) * pct_damage;
	if(damageWeapon.name == "t7_staff_fire_upgraded")
	{
		is_upgraded = 1;
	}
	if(is_upgraded && pct_damage > 0.5 && n_initial_dmg > self.health && math::cointoss())
	{
		self DoDamage(self.health, self.origin, e_attacker, e_attacker, 0, "MOD_BURNED", -1, damageWeapon);
		if(math::cointoss())
		{
			self thread namespace_951345fe::zombie_gib_all();
			continue;
		}
		self thread namespace_951345fe::zombie_gib_guts();
		return;
	}
	self endon("death");
	if(!was_on_fire)
	{
		self.var_f8de3d9 = 1;
		self thread function_37a33657();
		wait(0.5);
		self thread function_6c04b9e3(e_attacker, damageWeapon, pct_damage);
	}
}

/*
	Name: function_5908cc20
	Namespace: namespace_ec041286
	Checksum: 0x7B0FC74F
	Offset: 0x1990
	Size: 0x1E0
	Parameters: 2
	Flags: None
	Line Number: 489
*/
function function_5908cc20(do_stun, run_cycle)
{
	if(!isalive(self))
	{
		return;
	}
	if(!isdefined(self.ai_state) || self.ai_state != "zombie_think")
	{
		return;
	}
	if(isdefined(self.in_the_ground) && self.in_the_ground)
	{
		return;
	}
	if(isdefined(self.var_edd94f05) && self.var_edd94f05)
	{
		return;
	}
	if(!(isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area))
	{
		return;
	}
	if(isdefined(self.missingLegs) && self.missingLegs)
	{
		self zombie_utility::set_zombie_run_cycle(run_cycle);
		continue;
	}
	self.var_edd94f05 = 1;
	anims = RandomInt(5);
	if(anims == 0)
	{
		anim_to_play = "ai_zm_dlc5_zombie_afterlife_stun_a";
	}
	else if(anims == 1)
	{
		anim_to_play = "ai_zm_dlc5_zombie_afterlife_stun_b";
	}
	else if(anims == 2)
	{
		anim_to_play = "ai_zm_dlc5_zombie_afterlife_stun_c";
	}
	else if(anims == 3)
	{
		anim_to_play = "ai_zm_dlc5_zombie_afterlife_stun_d";
		continue;
	}
	anim_to_play = "ai_zm_dlc5_zombie_afterlife_stun_e";
	self AnimScripted(anim_to_play, self.origin, self.angles, anim_to_play);
	wait(getanimlength(anim_to_play));
	self.var_edd94f05 = undefined;
}

/*
	Name: function_37a33657
	Namespace: namespace_ec041286
	Checksum: 0xDCC6915E
	Offset: 0x1B78
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 551
*/
function function_37a33657()
{
	if(!isalive(self))
	{
		return;
	}
	if(!isdefined(self.ai_state) || self.ai_state != "zombie_think")
	{
		return;
	}
	if(isdefined(self.in_the_ground) && self.in_the_ground)
	{
		return;
	}
	if(!(isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area))
	{
		return;
	}
	if(isdefined(self.missingLegs) && self.missingLegs)
	{
		return;
	}
	self thread function_5908cc20();
}

/*
	Name: function_bb1e2502
	Namespace: namespace_ec041286
	Checksum: 0x6479757D
	Offset: 0x1C28
	Size: 0xA0
	Parameters: 2
	Flags: None
	Line Number: 586
*/
function function_bb1e2502(damageWeapon, var_16f4cf62)
{
	switch(damageWeapon)
	{
		case "t7_staff_fire":
		{
			return 2050;
		}
		case "t7_staff_fire_upgraded":
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
	Name: function_80ad3a1a
	Namespace: namespace_ec041286
	Checksum: 0x54825819
	Offset: 0x1CD0
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 628
*/
function function_80ad3a1a(damageWeapon, var_16f4cf62)
{
	switch(damageWeapon)
	{
		case "t7_staff_fire":
		{
			return 75;
		}
		case "t7_staff_fire_upgraded":
		{
			if(var_16f4cf62 == 3)
			{
				return 450;
			}
			else if(var_16f4cf62 == 2)
			{
				return 300;
				continue;
			}
			return 150;
		}
		case "t7_one_inch_punch_upgraded":
		{
			return 250;
		}
		default
		{
			return self.health;
		}
	}
}

/*
	Name: function_6c04b9e3
	Namespace: namespace_ec041286
	Checksum: 0xC028CCE1
	Offset: 0x1D68
	Size: 0x148
	Parameters: 3
	Flags: None
	Line Number: 670
*/
function function_6c04b9e3(e_attacker, damageWeapon, pct_damage)
{
	e_attacker endon("disconnect");
	self endon("death");
	self endon("stop_flame_damage");
	n_damage = function_80ad3a1a(damageWeapon.name, e_attacker.var_900bd247);
	n_duration = 8;
	n_damage = n_damage * pct_damage;
	self thread function_c5c292af(n_duration);
	while(1)
	{
		if(isdefined(e_attacker) && isPlayer(e_attacker))
		{
			if(e_attacker zm_powerups::is_insta_kill_active())
			{
				n_damage = self.health;
			}
		}
		self DoDamage(n_damage, self.origin, e_attacker, e_attacker, 0, "MOD_BURNED", -1, damageWeapon);
		wait(1);
	}
}

/*
	Name: function_6c1533b4
	Namespace: namespace_ec041286
	Checksum: 0x7DEB68E0
	Offset: 0x1EB8
	Size: 0xA8
	Parameters: 3
	Flags: None
	Line Number: 703
*/
function function_6c1533b4(damageWeapon, e_attacker, pct_damage)
{
	self endon("death");
	n_initial_dmg = function_bb1e2502(damageWeapon.name, e_attacker.var_900bd247);
	if(n_initial_dmg > 0)
	{
		self DoDamage(n_initial_dmg, self.origin, e_attacker, e_attacker, 0, "MOD_BURNED", -1, damageWeapon);
	}
}

/*
	Name: is_staff_fire_damage
	Namespace: namespace_ec041286
	Checksum: 0xCAB72B97
	Offset: 0x1F68
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 723
*/
function is_staff_fire_damage()
{
	if(isdefined(self) && isdefined(self.damageWeapon) && isdefined(self.damageWeapon.name) && (self.damageWeapon.name == "t7_staff_fire" || self.damageWeapon.name == "t7_staff_fire_upgraded" || (self.damageWeapon.name == "t7_one_inch_punch_upgraded" && self.attacker namespace_7529ddc1::function_924e32bf() == "fire")))
	{
		return 1;
	}
	return 0;
}

