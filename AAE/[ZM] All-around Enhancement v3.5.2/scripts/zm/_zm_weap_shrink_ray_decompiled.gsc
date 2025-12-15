#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_utility;

#namespace namespace_e822cb43;

/*
	Name: __init__sytem__
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x1090
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 25
*/
function autoexec __init__sytem__()
{
	system::register("zm_weap_shrink_ray", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x10D8
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function __init__()
{
	clientfield::register("actor", "fun_size", 5000, 1, "int");
	level.var_ac0866f = [];
	zombie_utility::set_zombie_var("shrink_ray_fling_range", 480);
	level._effect["shrink_ray_stepped_on"] = "dlc5/temple/fx_ztem_zombie_mini_squish";
	level._effect["shrink_ray_stepped_on_in_water"] = "dlc5/temple/fx_ztem_zombie_mini_drown";
	level._effect["shrink_ray_stepped_on_no_gore"] = "dlc5/temple/fx_ztem_monkey_shrink";
	level._effect["shrink"] = "dlc5/zmb_weapon/fx_shrink_ray_zombie_shrink";
	level._effect["unshrink"] = "dlc5/zmb_weapon/fx_shrink_ray_zombie_unshrink";
	callback::on_spawned(&function_37ce705e);
	level.var_c50bd012 = [];
	level.var_f812085 = GetWeapon("shrink_ray");
	level.var_953f69a0 = GetWeapon("shrink_ray_upgraded");
	zm::register_player_damage_callback(&function_19171a77);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __main__
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x1258
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function __main__()
{
	level.var_cc49958b = &function_28a1794f;
	level thread function_28a1794f();
	if(isdefined(level.var_cc49958b))
	{
		[[level.var_cc49958b]]();
	}
}

/*
	Name: add_shrinkable_object
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x12B0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 89
*/
function add_shrinkable_object(ent)
{
	Array::add(level.var_c50bd012, ent, 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: remove_shrinkable_object
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x12E8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 106
*/
function remove_shrinkable_object(ent)
{
	ArrayRemoveValue(level.var_c50bd012, ent);
}

/*
	Name: function_ebf92008
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x1320
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 121
*/
function function_ebf92008()
{
	while(1)
	{
		level.var_1b24c8b0 = 0;
		util::wait_network_frame();
	}
}

/*
	Name: function_37ce705e
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x1358
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 140
*/
function function_37ce705e()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self waittill("weapon_fired");
		currentWeapon = self GetCurrentWeapon();
		if(currentWeapon == level.var_f812085 || currentWeapon == level.var_953f69a0)
		{
			self thread function_fe7a4182(currentWeapon == level.var_953f69a0);
		}
	}
}

/*
	Name: function_19171a77
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x13F0
	Size: 0xA8
	Parameters: 13
	Flags: None
	Line Number: 165
*/
function function_19171a77(e_inflictor, e_attacker, n_damage, n_dflags, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, psOffsetTime, b_damage_from_underneath, n_model_index, str_part_name)
{
	if(isdefined(e_inflictor))
	{
		if(isdefined(e_inflictor.shrinked) && e_inflictor.shrinked)
		{
			return 5;
		}
	}
	return n_damage;
}

/*
	Name: function_fe7a4182
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x14A0
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 187
*/
function function_fe7a4182(upgraded)
{
	zombies = function_66ab6f95(upgraded, 0);
	objects = function_66ab6f95(upgraded, 1);
	zombies = ArrayCombine(zombies, objects, 1, 0);
	maxshrinks = 1000;
	for(i = 0; i < zombies.size && i < maxshrinks; i++)
	{
		if(isai(zombies[i]))
		{
			zombies[i] thread function_dd384ad7(upgraded, self);
			continue;
		}
		zombies[i] notify("shrunk", upgraded);
	}
}

/*
	Name: function_20c24bab
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x15D8
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 214
*/
function function_20c24bab(upgraded, player)
{
	damage = 10;
	self DoDamage(damage, player.origin, player, undefined, "projectile");
	self function_9ae4cf1b(damage, (0, 1, 0));
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_9af5d92d
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x1660
	Size: 0x150
	Parameters: 2
	Flags: None
	Line Number: 233
*/
function function_9af5d92d(upgraded, attacker)
{
	if(isdefined(self.shrinked) && self.shrinked)
	{
		return;
	}
	self.shrinked = 1;
	nummodels = self getattachsize();
	for(i = nummodels - 1; i >= 0; i--)
	{
		model = self getAttachModelName(i);
		self Detach(model);
		var_89a773f5 = level.var_ac0866f[model];
		if(isdefined(var_89a773f5))
		{
			self Attach(var_89a773f5);
		}
	}
	var_87aa5c26 = level.var_ac0866f[self.model];
	if(isdefined(var_87aa5c26))
	{
		self SetModel(var_87aa5c26);
	}
}

/*
	Name: vector_scale
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x17B8
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 268
*/
function vector_scale(vec, scale)
{
	vec = vec * scale;
	return vec;
}

/*
	Name: function_dd384ad7
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x17E8
	Size: 0xB20
	Parameters: 2
	Flags: None
	Line Number: 284
*/
function function_dd384ad7(upgraded, attacker)
{
	self endon("death");
	if(isdefined(self.shrinked) && self.shrinked)
	{
		return;
	}
	if(!isdefined(self.var_bb09c29a))
	{
		self.var_bb09c29a = 0;
	}
	var_50d1f39 = 2.5;
	if(self.animName == "sonic_zombie")
	{
		if(self.var_bb09c29a == 0)
		{
			var_50d1f39 = 0.75;
		}
		else if(self.var_bb09c29a == 1)
		{
			var_50d1f39 = 1.5;
		}
		else
		{
			var_50d1f39 = 2.5;
		}
	}
	else if(self.animName == "napalm_zombie")
	{
		if(self.var_bb09c29a == 0)
		{
			var_50d1f39 = 0.75;
		}
		else if(self.var_bb09c29a == 1)
		{
			var_50d1f39 = 1.5;
		}
		else
		{
			var_50d1f39 = 2.5;
		}
	}
	else
	{
		var_50d1f39 = 2.5;
		var_50d1f39 = var_50d1f39 + RandomFloatRange(0, 0.5);
	}
	if(upgraded)
	{
		var_50d1f39 = var_50d1f39 * 2;
	}
	self.var_bb09c29a++;
	var_f1754347 = 0;
	if(IsActor(self))
	{
		self clientfield::set("fun_size", 1);
		self PushPlayer(0);
	}
	self notify("shrink");
	self.shrinked = 1;
	self.var_2209ea1b = attacker;
	self.kill_on_wine_coccon = 1;
	if(!isdefined(attacker.var_e5e4e1e5))
	{
		attacker.var_e5e4e1e5 = [];
	}
	if(!isdefined(attacker.var_e5e4e1e5[self.animName]))
	{
		attacker.var_e5e4e1e5[self.animName] = 0;
	}
	attacker.var_e5e4e1e5[self.animName]++;
	var_cd13f0ff = self.model;
	health = self.health;
	if(isdefined(self.animName) && self.animName == "monkey_zombie")
	{
		if(isdefined(self.shrink_ray_fling))
		{
			self [[self.shrink_ray_fling]](attacker);
		}
		else
		{
			fling_range_squared = level.zombie_vars["shrink_ray_fling_range"] * level.zombie_vars["shrink_ray_fling_range"];
			view_pos = attacker GetWeaponMuzzlePoint();
			test_origin = self GetCentroid();
			test_range_squared = DistanceSquared(view_pos, test_origin);
			dist_mult = fling_range_squared - test_range_squared / fling_range_squared;
			fling_vec = VectorNormalize(test_origin - view_pos);
			fling_vec = (fling_vec[0], fling_vec[1], Abs(fling_vec[2]));
			fling_vec = vector_scale(fling_vec, 100 + 100 * dist_mult);
			self DoDamage(self.health + 666, attacker.origin, attacker);
			self notsolid();
			self StartRagdoll();
			self LaunchRagdoll(fling_vec);
		}
	}
	else if(self function_f23d2379())
	{
		self function_6140a171(attacker);
	}
	else
	{
		self playsound("evt_shrink");
		self.var_2209ea1b thread zm_audio::create_and_play_dialog("kill", "shrink");
		self thread function_259d2f7a("shrink", "J_MainRoot");
		var_939fbc94 = self.meleeDamage;
		self.meleeDamage = 5;
		self.no_gib = 1;
		self zombie_utility::zombie_eye_glow_stop();
		attachedmodels = [];
		attachedtags = [];
		hatModel = self.hatModel;
		nummodels = self getattachsize();
		for(i = nummodels - 1; i >= 0; i--)
		{
			model = self getAttachModelName(i);
			tag = self getAttachTagName(i);
			ishat = isdefined(self.hatModel) && self.hatModel == model;
			if(ishat)
			{
				self.hatModel = undefined;
			}
			attachedmodels[attachedmodels.size] = model;
			attachedtags[attachedtags.size] = tag;
			self Detach(model);
			var_89a773f5 = level.var_ac0866f[model];
			if(isdefined(var_89a773f5))
			{
				self Attach(var_89a773f5);
				if(ishat)
				{
					self.hatModel = var_89a773f5;
				}
			}
		}
		var_87aa5c26 = level.var_ac0866f[self.model];
		if(isdefined(var_87aa5c26))
		{
			self SetModel(var_87aa5c26);
		}
		if(!self.missingLegs)
		{
			self setPhysParams(8, -2, 32);
		}
		else
		{
			self AllowPitchAngle(0);
			newOrigin = self.origin + VectorScale((0, 0, 1), 10);
			self teleport(newOrigin, self.angles);
			self setPhysParams(8, -16, 10);
		}
		self.health = 1;
		self thread function_6d284e94();
		self thread function_643fa9c8();
		self thread watch_for_death();
		self.zombie_board_tear_down_callback = &function_8b44a1f8;
		if(isdefined(self.var_399caee8))
		{
			self [[self.var_399caee8]]();
		}
		wait(var_50d1f39);
		self playsound("evt_unshrink");
		self thread function_259d2f7a("unshrink", "J_MainRoot");
		wait(0.5);
		self.zombie_board_tear_down_callback = undefined;
		if(isdefined(self.var_c1d20f2f))
		{
			self [[self.var_c1d20f2f]]();
		}
		nummodels = self getattachsize();
		for(i = nummodels - 1; i >= 0; i--)
		{
			model = self getAttachModelName(i);
			tag = self getAttachTagName(i);
			self Detach(model);
		}
		self.hatModel = hatModel;
		for(i = 0; i < attachedmodels.size; i++)
		{
			self Attach(attachedmodels[i]);
		}
		self SetModel(var_cd13f0ff);
		if(!self.missingLegs)
		{
			self setPhysParams(15, 0, 72);
		}
		else
		{
			self setPhysParams(15, 0, 24);
			self AllowPitchAngle(1);
		}
		self.health = health;
		self.meleeDamage = var_939fbc94;
		self.no_gib = 0;
	}
	self zombie_utility::zombie_eye_glow();
	if(IsActor(self))
	{
		self clientfield::set("fun_size", 0);
		self PushPlayer(0);
	}
	self notify("hash_50b900c3");
	self.shrinked = 0;
	self.var_2209ea1b = undefined;
	self.kill_on_wine_coccon = undefined;
}

/*
	Name: function_f23d2379
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x2310
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 500
*/
function function_f23d2379()
{
	if(isdefined(self GetLinkedEnt()))
	{
		return 1;
	}
	if(isdefined(self.sliding) && self.sliding)
	{
		return 1;
	}
	if(isdefined(self.in_the_ceiling) && self.in_the_ceiling)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_6d284e94
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x2380
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 527
*/
function function_6d284e94()
{
	self endon("hash_50b900c3");
	self endon("stepped_on");
	self endon("kicked");
	self endon("death");
	wait(RandomFloatRange(0.2, 0.5));
	while(1)
	{
		self playsound("zmb_mini_ambient");
		wait(RandomFloatRange(1, 2.25));
	}
}

/*
	Name: function_259d2f7a
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x2428
	Size: 0x48
	Parameters: 3
	Flags: None
	Line Number: 551
*/
function function_259d2f7a(fxName, var_80afd72e, offset)
{
	PlayFXOnTag(level._effect[fxName], self, "tag_origin");
}

/*
	Name: function_206493fd
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x2478
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 566
*/
function function_206493fd(alias)
{
	self endon("death");
	wait(RandomFloat(0.5));
	self zm_utility::play_sound_on_ent(alias);
}

/*
	Name: function_643fa9c8
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x24C8
	Size: 0x2F0
	Parameters: 0
	Flags: None
	Line Number: 583
*/
function function_643fa9c8()
{
	self endon("death");
	self endon("hash_50b900c3");
	self PushPlayer(0);
	self.var_f0dec186 = spawn("trigger_radius", self.origin, 0, 85, 80);
	self.var_f0dec186 setHintString("");
	self.var_f0dec186 setcursorhint("HINT_NOICON");
	self.var_f0dec186 EnableLinkTo();
	self.var_f0dec186 LinkTo(self);
	self.var_f0dec186 thread function_2c318bd(self);
	self.var_f0dec186 endon("death");
	while(1)
	{
		self.var_f0dec186 waittill("trigger", who);
		if(!isPlayer(who))
		{
			continue;
		}
		if(!(isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area))
		{
			continue;
		}
		if(isdefined(self.magic_bullet_shield) && self.magic_bullet_shield)
		{
			continue;
		}
		movement = who GetNormalizedMovement();
		if(length(movement) < 0.1)
		{
			continue;
		}
		toEnemy = self.origin - who.origin;
		toEnemy = (toEnemy[0], toEnemy[1], 0);
		toEnemy = VectorNormalize(toEnemy);
		forward_view_angles = AnglesToForward(who.angles);
		var_884fd8ec = VectorDot(forward_view_angles, toEnemy);
		if(var_884fd8ec > 0.5 && movement[0] > 0)
		{
			self notify("kicked");
			who notify("hash_49423c6f");
			self function_867ec02b(who);
		}
		else
		{
			self notify("stepped_on");
			self function_6140a171(who);
		}
	}
}

/*
	Name: function_2c318bd
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x27C0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 644
*/
function function_2c318bd(e_watched)
{
	self endon("death");
	e_watched waittill("death");
	self delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: watch_for_death
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x2808
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 663
*/
function watch_for_death()
{
	self endon("hash_50b900c3");
	self endon("stepped_on");
	self endon("kicked");
	self waittill("death");
	self function_6140a171();
}

/*
	Name: function_12c1fddf
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x2860
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 682
*/
function function_12c1fddf(v_launch)
{
	if(!isdefined(level.var_6d0abb4c))
	{
		level.var_6d0abb4c = 0;
	}
	if(level.var_6d0abb4c < 5)
	{
		level.var_6d0abb4c++;
		self LaunchRagdoll(v_launch);
		wait(3);
		level.var_6d0abb4c--;
	}
}

/*
	Name: function_867ec02b
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x28D0
	Size: 0x2A8
	Parameters: 1
	Flags: None
	Line Number: 707
*/
function function_867ec02b(killer)
{
	if(level flag::get("world_is_paused"))
	{
		self SetIgnorePauseWorld(1);
	}
	self thread function_9ac50518();
	kickAngles = killer.angles;
	kickAngles = kickAngles + (RandomFloatRange(-30, -20), RandomFloatRange(-5, 5), 0);
	launchDir = AnglesToForward(kickAngles);
	if(killer issprinting())
	{
		launchForce = RandomFloatRange(350, 400);
	}
	else
	{
		vel = killer getvelocity();
		speed = length(vel);
		scale = math::clamp(speed / 190, 0.1, 1);
		launchForce = RandomFloatRange(200 * scale, 250 * scale);
	}
	self notsolid();
	self StartRagdoll();
	self thread function_12c1fddf(launchDir * launchForce);
	util::wait_network_frame();
	killer thread zm_audio::create_and_play_dialog("kill", "shrunken");
	self DoDamage(self.health + 666, self.origin, killer);
	if(isdefined(self.var_f0dec186))
	{
		self.var_f0dec186 delete();
	}
}

/*
	Name: function_9ac50518
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x2B80
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 750
*/
function function_9ac50518()
{
	if(!isdefined(level.var_1b24c8b0))
	{
		level thread function_ebf92008();
	}
	if(level.var_1b24c8b0 > 3)
	{
		return;
	}
	level.var_1b24c8b0++;
	playsoundatposition("zmb_mini_kicked", self.origin);
	return;
	waittillframeend;
}

/*
	Name: function_6140a171
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x2BF0
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 776
*/
function function_6140a171(killer)
{
	playsoundatposition("zmb_mini_squashed", self.origin);
	if(level flag::get("world_is_paused"))
	{
		self SetIgnorePauseWorld(1);
	}
	playFX(level._effect["shrink_ray_stepped_on_no_gore"], self.origin);
	self thread zombie_utility::zombie_eye_glow_stop();
	util::wait_network_frame();
	self Hide();
	self DoDamage(self.health + 666, self.origin, killer);
	if(isdefined(self.var_f0dec186))
	{
		self.var_f0dec186 delete();
	}
}

/*
	Name: function_66ab6f95
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x2D28
	Size: 0x588
	Parameters: 2
	Flags: None
	Line Number: 804
*/
function function_66ab6f95(upgraded, var_5eafa9ab)
{
	range = 480;
	radius = 60;
	if(upgraded)
	{
		range = 1200;
		radius = 84;
	}
	var_91820d09 = [];
	view_pos = self GetWeaponMuzzlePoint();
	test_list = undefined;
	if(var_5eafa9ab)
	{
		test_list = level.var_c50bd012;
		range = range * 5;
	}
	else
	{
		test_list = GetAISpeciesArray(level.zombie_team, "all");
	}
	zombies = util::get_array_of_closest(view_pos, test_list, undefined, undefined, range * 1.1);
	if(!isdefined(zombies))
	{
		return;
	}
	range_squared = range * range;
	radius_squared = radius * radius;
	forward_view_angles = self GetWeaponForwardDir();
	end_pos = view_pos + VectorScale(forward_view_angles, range);
	/#
		if(2 == GetDvarInt("Dev Block strings are not supported"))
		{
			near_circle_pos = view_pos + VectorScale(forward_view_angles, 2);
			circle(near_circle_pos, radius, (1, 0, 0), 0, 0, 100);
			line(near_circle_pos, end_pos, (0, 0, 1), 1, 0, 100);
			circle(end_pos, radius, (1, 0, 0), 0, 0, 100);
		}
	#/
	for(i = 0; i < zombies.size; i++)
	{
		if(!isdefined(zombies[i]) || (isai(zombies[i]) && !isalive(zombies[i])))
		{
			continue;
		}
		if(isdefined(zombies[i].shrinked) && zombies[i].shrinked)
		{
			zombies[i] function_9ae4cf1b("shrinked", (1, 0, 0));
			continue;
		}
		if(isdefined(zombies[i].no_shrink) && zombies[i].no_shrink)
		{
			zombies[i] function_9ae4cf1b("no_shrink", (1, 0, 0));
			continue;
		}
		test_origin = zombies[i] GetCentroid();
		test_range_squared = DistanceSquared(view_pos, test_origin);
		if(test_range_squared > range_squared)
		{
			zombies[i] function_9ae4cf1b("range", (1, 0, 0));
			break;
		}
		normal = VectorNormalize(test_origin - view_pos);
		dot = VectorDot(forward_view_angles, normal);
		if(0 > dot)
		{
			zombies[i] function_9ae4cf1b("dot", (1, 0, 0));
			continue;
		}
		radial_origin = PointOnSegmentNearestToPoint(view_pos, end_pos, test_origin);
		if(DistanceSquared(test_origin, radial_origin) > radius_squared)
		{
			zombies[i] function_9ae4cf1b("cylinder", (1, 0, 0));
			continue;
		}
		if(0 == zombies[i] damageConeTrace(view_pos, self))
		{
			zombies[i] function_9ae4cf1b("cone", (1, 0, 0));
			continue;
		}
		var_91820d09[var_91820d09.size] = zombies[i];
	}
	return var_91820d09;
	~var_91820d09[var_91820d09.size];
}

/*
	Name: function_9ae4cf1b
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x32B8
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 900
*/
function function_9ae4cf1b(msg, color)
{
	/#
		if(!GetDvarInt("Dev Block strings are not supported"))
		{
			return;
		}
		if(!isdefined(color))
		{
			color = (1, 1, 1);
		}
		print3d(self.origin + VectorScale((0, 0, 1), 60), msg, color, 1, 1, 40);
		return;
	#/
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8b44a1f8
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x3348
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 927
*/
function function_8b44a1f8()
{
	self endon("death");
	self endon("hash_50b900c3");
	while(1)
	{
		taunt_anim = Array::random(level._zombie_board_taunt["zombie"]);
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_28a1794f
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x33A8
	Size: 0x42A
	Parameters: 0
	Flags: None
	Line Number: 949
*/
function function_28a1794f()
{
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_napalm_body"] = "c_t7_zm_dlchd_shangrila_napalm_mini_fb";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_sonic_body"] = "c_t7_zm_dlchd_shangrila_sonic_mini_fb";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_vietcong_head"] = "c_t7_zm_dlchd_shangrila_vietcong_mini_head";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_vietcong_body"] = "c_t7_zm_dlchd_shangrila_vietcong_mini_body";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_nva_head"] = "c_t7_zm_dlchd_shangrila_nva_mini_head";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_nva_head2"] = "c_t7_zm_dlchd_shangrila_nva_mini_head2";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_nva_body"] = "c_t7_zm_dlchd_shangrila_nva_mini_body";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_head"] = "c_t7_zm_dlchd_shangrila_fem_mini_head";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_body"] = "c_t7_zm_dlchd_shangrila_fem_mini_body";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_body2"] = "c_t7_zm_dlchd_shangrila_fem_mini_body2";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_g_blegsoff2"] = "c_t7_zm_dlchd_shangrila_mini_fem_g_blegsoff2";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_g_llegoff2"] = "c_t7_zm_dlchd_shangrila_mini_fem_g_llegoff2";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_g_loclean2"] = "c_t7_zm_dlchd_shangrila_mini_fem_g_loclean2";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_g_rarmoff2"] = "c_t7_zm_dlchd_shangrila_mini_fem_g_rarmoff2";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_g_rlegoff2"] = "c_t7_zm_dlchd_shangrila_mini_fem_g_rlegoff2";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_g_upclean2"] = "c_t7_zm_dlchd_shangrila_mini_fem_g_upclean2";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_g_larmoff2"] = "c_t7_zm_dlchd_shangrila_mini_fem_g_larmoff2";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_g_blegsoff"] = "c_t7_zm_dlchd_shangrila_mini_fem_g_blegsoff";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_g_llegoff"] = "c_t7_zm_dlchd_shangrila_mini_fem_g_llegoff";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_g_loclean"] = "c_t7_zm_dlchd_shangrila_mini_fem_g_loclean";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_g_rarmoff"] = "c_t7_zm_dlchd_shangrila_mini_fem_g_rarmoff";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_g_rlegoff"] = "c_t7_zm_dlchd_shangrila_mini_fem_g_rlegoff";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_g_upclean"] = "c_t7_zm_dlchd_shangrila_mini_fem_g_upclean";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_fem_g_larmoff"] = "c_t7_zm_dlchd_shangrila_mini_fem_g_larmoff";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_nva_g_blegsoff"] = "c_t7_zm_dlchd_shangrila_nva_mini_g_blegsoff";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_nva_g_llegoff"] = "c_t7_zm_dlchd_shangrila_nva_mini_g_llegoff";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_nva_g_loclean"] = "c_t7_zm_dlchd_shangrila_nva_mini_g_loclean";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_nva_g_rarmoff"] = "c_t7_zm_dlchd_shangrila_nva_mini_g_rarmoff";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_nva_g_rlegoff"] = "c_t7_zm_dlchd_shangrila_nva_mini_g_rlegoff";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_nva_g_upclean"] = "c_t7_zm_dlchd_shangrila_nva_mini_g_upclean";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_nva_g_larmoff"] = "c_t7_zm_dlchd_shangrila_nva_mini_g_larmoff";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_vietcong_g_blegsoff"] = "c_t7_zm_dlchd_shangrila_vietcong_mini_g_blegsoff";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_vietcong_g_llegoff"] = "c_t7_zm_dlchd_shangrila_vietcong_mini_g_llegoff";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_vietcong_g_loclean"] = "c_t7_zm_dlchd_shangrila_vietcong_mini_g_loclean";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_vietcong_g_rarmoff"] = "c_t7_zm_dlchd_shangrila_vietcong_mini_g_rarmoff";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_vietcong_g_rlegoff"] = "c_t7_zm_dlchd_shangrila_vietcong_mini_g_rlegoff";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_vietcong_g_upclean"] = "c_t7_zm_dlchd_shangrila_vietcong_mini_g_upclean";
	level.var_ac0866f["c_t7_zm_dlchd_shangrila_vietcong_g_larmoff"] = "c_t7_zm_dlchd_shangrila_vietcong_mini_g_larmoff";
}

