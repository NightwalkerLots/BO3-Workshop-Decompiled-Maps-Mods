#include scripts\codescripts\struct;
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
#include scripts\zm\_load;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_89d026b5;

/*
	Name: __init__sytem__
	Namespace: namespace_89d026b5
	Checksum: 0x8B8AF7BB
	Offset: 0x6D0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 36
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_tomahawk", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_89d026b5
	Checksum: 0x868B0DE0
	Offset: 0x710
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __init__()
{
	clientfield::register("actor", "play_tomahawk_hit_sound", 1, 1, "int");
	callback::on_spawned(&function_ea66660);
	level thread tomahawk_pickup();
	zm_powerups::set_weapon_ignore_max_ammo(GetWeapon("t6_zombie_tomahawk"));
	zm_powerups::set_weapon_ignore_max_ammo(GetWeapon("t6_zombie_tomahawk_upgraded"));
	level.a_tomahawk_pickup_funcs = [];
	zm_utility::register_tactical_grenade_for_level("t6_zombie_tomahawk");
	zm_utility::register_tactical_grenade_for_level("t6_zombie_tomahawk_upgraded");
}

/*
	Name: function_ea66660
	Namespace: namespace_89d026b5
	Checksum: 0xD6292780
	Offset: 0x818
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 74
*/
function function_ea66660()
{
	self thread function_fd8bd3e6();
	self thread function_d4755bc6();
}

/*
	Name: function_fd8bd3e6
	Namespace: namespace_89d026b5
	Checksum: 0x3580693
	Offset: 0x858
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function function_fd8bd3e6()
{
	self endon("death_or_disconnect");
	self notify("hash_fd8bd3e6");
	self endon("hash_fd8bd3e6");
	while(isdefined(self))
	{
		self waittill("grenade_fire", e_grenade, w_weapon, var_3bd20123);
		if(!IsSubStr(w_weapon.name, "tomahawk"))
		{
			continue;
		}
		e_grenade.low_level_instant_kill_charge = 1;
		self notify("throwing_tomahawk");
		if(isdefined(self.n_tomahawk_cooking_time))
		{
			e_grenade.n_cookedtime = e_grenade.birthtime - self.n_tomahawk_cooking_time;
			continue;
		}
		e_grenade.n_cookedtime = 0;
		self thread function_84f800d8(e_grenade);
		self thread tomahawk_thrown(e_grenade);
	}
}

/*
	Name: function_d4755bc6
	Namespace: namespace_89d026b5
	Checksum: 0xA520477B
	Offset: 0x988
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 125
*/
function function_d4755bc6()
{
	self endon("death_or_disconnect");
	self notify("hash_d4755bc6");
	self endon("hash_d4755bc6");
	while(isdefined(self))
	{
		self waittill("grenade_pullback", w_weapon);
		if(!IsSubStr(w_weapon.name, "tomahawk"))
		{
			continue;
		}
		self thread function_9b409c61();
		self thread function_db6a1bb8();
		self.n_tomahawk_cooking_time = GetTime();
		self util::waittill_either("grenade_fire", "grenade_throw_cancelled");
		wait(0.05);
		self.n_tomahawk_cooking_time = undefined;
	}
}

/*
	Name: function_9b409c61
	Namespace: namespace_89d026b5
	Checksum: 0x299D2630
	Offset: 0xA78
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 156
*/
function function_9b409c61()
{
	self endon("death_or_disconnect");
	self endon("grenade_fire");
	waittillframeend;
	while(self IsThrowingGrenade())
	{
		wait(0.05);
	}
	self notify("grenade_throw_cancelled");
}

/*
	Name: function_db6a1bb8
	Namespace: namespace_89d026b5
	Checksum: 0xABBBB658
	Offset: 0xAD8
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 178
*/
function function_db6a1bb8()
{
	self endon("death_or_disconnect");
	self endon("grenade_fire");
	waittillframeend;
	var_917ae55f = 1000;
	while(isdefined(self))
	{
		n_time = GetTime() - self.n_tomahawk_cooking_time;
		var_2b9228fe = self zm_utility::get_player_tactical_grenade();
		if(n_time >= var_917ae55f)
		{
			if(var_2b9228fe.name == "t6_zombie_tomahawk_upgraded")
			{
				PlayFXOnTag("harry/tomahawk/fx_tomahawk_charge_up_ug", self, "tag_origin");
				continue;
			}
			PlayFXOnTag("harry/tomahawk/fx_tomahawk_charge_up", self, "tag_origin");
			var_917ae55f = var_917ae55f + 1000;
			self PlayRumbleOnEntity("reload_small");
		}
		if(var_917ae55f > 2400 && var_2b9228fe.name != "t6_zombie_tomahawk_upgraded")
		{
			return;
		}
		else if(var_917ae55f >= 3400)
		{
			return;
			continue;
		}
		wait(0.05);
	}
	return;
}

/*
	Name: function_dc684c2f
	Namespace: namespace_89d026b5
	Checksum: 0x46543E07
	Offset: 0xC48
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 223
*/
function function_dc684c2f(e_player)
{
	e_player endon("disconnect");
	var_2b9228fe = e_player zm_utility::get_player_tactical_grenade();
	if(self.n_cookedtime > 1000 && self.n_cookedtime < 2000)
	{
		if(var_2b9228fe.name == "t6_zombie_tomahawk_upgraded")
		{
			return 4.5;
		}
		return 1.5;
	}
	else if(self.n_cookedtime > 2000 && self.n_cookedtime < 3000)
	{
		if(var_2b9228fe.name == "t6_zombie_tomahawk_upgraded")
		{
			return 6;
		}
		return 2;
	}
	else if(self.n_cookedtime >= 3000 && var_2b9228fe.name != "t6_zombie_tomahawk_upgraded")
	{
		return 2;
	}
	else if(self.n_cookedtime >= 3000)
	{
		return 3;
	}
	return 1;
}

/*
	Name: tomahawk_thrown
	Namespace: namespace_89d026b5
	Checksum: 0x6DDDDD7
	Offset: 0xD78
	Size: 0x608
	Parameters: 1
	Flags: None
	Line Number: 264
*/
function tomahawk_thrown(e_grenade)
{
	self endon("disconnect");
	e_grenade endon("in_hellhole");
	PlayFXOnTag("harry/tomahawk/fx_tomahawk_charged_trail", e_grenade, "tag_origin");
	e_grenade util::waittill_either("death", "time_out");
	var_38cdea23 = e_grenade.origin;
	a_zombies = GetAISpeciesArray("axis", "all");
	n_grenade_charge_power = e_grenade function_dc684c2f(self);
	a_zombies = util::get_array_of_closest(var_38cdea23, a_zombies, undefined, undefined, 200);
	a_powerups = util::get_array_of_closest(var_38cdea23, level.active_powerups, undefined, undefined, 200);
	if(isdefined(level.a_tomahawk_pickup_funcs))
	{
		_a243 = level.a_tomahawk_pickup_funcs;
		for(_k243 = getFirstArrayKey(_a243); isdefined(_k243); _k243 = getFirstArrayKey(_a243))
		{
			var_48eb9e7f = _a243[_k243];
			if([[var_48eb9e7f]](e_grenade, n_grenade_charge_power))
			{
				return;
			}
		}
	}
	else if(isdefined(a_powerups) && a_powerups.size > 0)
	{
		var_c5ee6b4f = tomahawk_spawn(var_38cdea23, n_grenade_charge_power);
		var_c5ee6b4f.n_grenade_charge_power = n_grenade_charge_power;
		_a256 = a_powerups;
		for(_k256 = getFirstArrayKey(_a256); isdefined(_k256); _k256 = getFirstArrayKey(_a256))
		{
			var_93eb638b = _a256[_k256];
			var_93eb638b.origin = var_38cdea23;
			var_93eb638b LinkTo(var_c5ee6b4f);
			var_c5ee6b4f.var_fe164e09 = a_powerups;
		}
		self thread tomahawk_return_player(var_c5ee6b4f, 0);
		return;
	}
	if(!isdefined(a_zombies))
	{
		var_c5ee6b4f = tomahawk_spawn(var_38cdea23, n_grenade_charge_power);
		var_c5ee6b4f.n_grenade_charge_power = n_grenade_charge_power;
		self thread tomahawk_return_player(var_c5ee6b4f, 0);
		return;
		continue;
	}
	_a276 = a_zombies;
	for(_k276 = getFirstArrayKey(_a276); isdefined(_k276); _k276 = getFirstArrayKey(_a276))
	{
		ai_zombie = _a276[_k276];
		ai_zombie.var_9eb9f302 = 0;
	}
	if(isdefined(a_zombies[0]) && isalive(a_zombies[0]))
	{
		v_zombiepos = a_zombies[0].origin;
		if(DistanceSquared(var_38cdea23, v_zombiepos) <= 4900)
		{
			a_zombies[0] clientfield::set("play_tomahawk_hit_sound", 1);
			n_tomahawk_damage = function_44e79302(a_zombies[0], n_grenade_charge_power, e_grenade);
			a_zombies[0] DoDamage(n_tomahawk_damage, var_38cdea23, self, e_grenade, "none", "MOD_GRENADE", 0, GetWeapon("t6_zombie_tomahawk"));
			a_zombies[0].var_9eb9f302 = 1;
			self zm_score::add_to_player_score(10);
			self thread tomahawk_ricochet_attack(var_38cdea23, n_grenade_charge_power);
			continue;
		}
		var_c5ee6b4f = tomahawk_spawn(var_38cdea23, n_grenade_charge_power);
		var_c5ee6b4f.n_grenade_charge_power = n_grenade_charge_power;
		self thread tomahawk_return_player(var_c5ee6b4f, 0);
		continue;
	}
	var_c5ee6b4f = tomahawk_spawn(var_38cdea23, n_grenade_charge_power);
	var_c5ee6b4f.n_grenade_charge_power = n_grenade_charge_power;
	if(isdefined(e_grenade))
	{
		e_grenade delete();
	}
	self thread tomahawk_return_player(var_c5ee6b4f, 0);
}

/*
	Name: function_84f800d8
	Namespace: namespace_89d026b5
	Checksum: 0x2BDE3A48
	Offset: 0x1388
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 353
*/
function function_84f800d8(e_grenade)
{
	self endon("death_or_disconnect");
	e_grenade endon("death");
	wait(0.5);
	e_grenade notify("time_out");
	return;
}

/*
	Name: tomahawk_ricochet_attack
	Namespace: namespace_89d026b5
	Checksum: 0x5A84D01F
	Offset: 0x13D0
	Size: 0x140
	Parameters: 2
	Flags: None
	Line Number: 372
*/
function tomahawk_ricochet_attack(var_38cdea23, var_d47dc3fb)
{
	self endon("death_or_disconnect");
	a_zombies = GetAISpeciesArray("axis", "all");
	a_zombies = util::get_array_of_closest(var_38cdea23, a_zombies, undefined, undefined, 200);
	a_zombies = Array::reverse(a_zombies);
	if(!isdefined(a_zombies))
	{
		var_c5ee6b4f = tomahawk_spawn(var_38cdea23, var_d47dc3fb);
		var_c5ee6b4f.n_grenade_charge_power = var_d47dc3fb;
		self thread tomahawk_return_player(var_c5ee6b4f, 0);
		return;
	}
	var_c5ee6b4f = tomahawk_spawn(var_38cdea23, var_d47dc3fb);
	var_c5ee6b4f.n_grenade_charge_power = var_d47dc3fb;
	self thread tomahawk_attack_zombies(var_c5ee6b4f, a_zombies);
}

/*
	Name: tomahawk_attack_zombies
	Namespace: namespace_89d026b5
	Checksum: 0xEA5282CF
	Offset: 0x1518
	Size: 0x368
	Parameters: 2
	Flags: None
	Line Number: 400
*/
function tomahawk_attack_zombies(var_c5ee6b4f, a_zombies)
{
	self endon("disconnect");
	if(!isdefined(a_zombies))
	{
		self thread tomahawk_return_player(var_c5ee6b4f, 0);
		return;
	}
	if(a_zombies.size <= 4)
	{
		n_attack_limit = a_zombies.size;
		continue;
	}
	n_attack_limit = 4;
	for(i = 0; i < n_attack_limit; i++)
	{
		if(isdefined(a_zombies[i]) && isalive(a_zombies[i]))
		{
			tag = "j_head";
			if(isdefined(a_zombies[i].isdog) && a_zombies[i].isdog)
			{
				tag = "j_spine1";
			}
			if(isdefined(a_zombies[i].var_9eb9f302) && !a_zombies[i].var_9eb9f302)
			{
				v_target = a_zombies[i] GetTagOrigin(tag);
				var_c5ee6b4f moveto(v_target, 0.3);
				var_c5ee6b4f waittill("movedone");
				if(isdefined(a_zombies[i]) && isalive(a_zombies[i]))
				{
					if(self.current_tactical_grenade.name == "t6_zombie_tomahawk_upgraded")
					{
						PlayFXOnTag("harry/tomahawk/fx_tomahawk_impact_ug", a_zombies[i], tag);
						continue;
					}
					PlayFXOnTag("harry/tomahawk/fx_tomahawk_impact", a_zombies[i], tag);
					a_zombies[i] clientfield::set("play_tomahawk_hit_sound", 1);
					n_tomahawk_damage = function_44e79302(a_zombies[i], var_c5ee6b4f.n_grenade_charge_power, var_c5ee6b4f);
					a_zombies[i] DoDamage(n_tomahawk_damage, var_c5ee6b4f.origin, self, var_c5ee6b4f, "none", "MOD_GRENADE", 0, GetWeapon("t6_zombie_tomahawk"));
					a_zombies[i].var_9eb9f302 = 1;
					self zm_score::add_to_player_score(10);
				}
			}
		}
		wait(0.2);
	}
	self thread tomahawk_return_player(var_c5ee6b4f, n_attack_limit);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: tomahawk_return_player
	Namespace: namespace_89d026b5
	Checksum: 0xD31BCD73
	Offset: 0x1888
	Size: 0x2B0
	Parameters: 2
	Flags: None
	Line Number: 462
*/
function tomahawk_return_player(var_c5ee6b4f, n_zombies_hit)
{
	self endon("disconnect");
	self PlayLoopSound("wpn_tomahawk_incoming");
	n_dist = Distance2DSquared(var_c5ee6b4f.origin, self.origin);
	if(!isdefined(n_zombies_hit))
	{
		n_zombies_hit = 5;
	}
	while(n_dist > 4096)
	{
		var_c5ee6b4f moveto(self GetEye(), 0.25);
		if(n_zombies_hit < 5)
		{
			self tomahawk_check_for_zombie(var_c5ee6b4f);
			n_zombies_hit++;
		}
		wait(0.1);
		n_dist = Distance2DSquared(var_c5ee6b4f.origin, self GetEye());
	}
	if(isdefined(var_c5ee6b4f.var_fe164e09))
	{
		_a470 = var_c5ee6b4f.var_fe164e09;
		for(_k470 = getFirstArrayKey(_a470); isdefined(_k470); _k470 = getFirstArrayKey(_a470))
		{
			var_93eb638b = _a470[_k470];
			if(isdefined(var_93eb638b))
			{
				var_93eb638b.origin = self.origin;
			}
		}
	}
	var_c5ee6b4f delete();
	self playsoundtoplayer("wpn_tomahawk_catch_plr", self);
	self playsound("wpn_tomahawk_catch_npc");
	wait(5);
	self playsoundtoplayer("wpn_tomahawk_cooldown", self);
	self giveMaxAmmo(self.current_tactical_grenade);
	a_zombies = GetAISpeciesArray("axis", "all");
}

/*
	Name: tomahawk_check_for_zombie
	Namespace: namespace_89d026b5
	Checksum: 0xD0BB1179
	Offset: 0x1B40
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 513
*/
function tomahawk_check_for_zombie(e_grenade)
{
	self endon("disconnect");
	e_grenade endon("death");
	a_zombies = GetAISpeciesArray("axis", "all");
	a_zombies = util::get_array_of_closest(e_grenade.origin, a_zombies, undefined, undefined, 200);
	if(isdefined(a_zombies[0]) && Distance2DSquared(e_grenade.origin, a_zombies[0].origin) <= 10000)
	{
		if(isdefined(a_zombies[0].var_9eb9f302) && !a_zombies[0].var_9eb9f302)
		{
			self tomahawk_hit_zombie(a_zombies[0], e_grenade);
		}
	}
}

/*
	Name: tomahawk_hit_zombie
	Namespace: namespace_89d026b5
	Checksum: 0x3938111B
	Offset: 0x1C60
	Size: 0x260
	Parameters: 2
	Flags: None
	Line Number: 538
*/
function tomahawk_hit_zombie(e_zombie, e_grenade)
{
	self endon("disconnect");
	if(isdefined(e_zombie) && isalive(e_zombie))
	{
		if(isdefined(e_zombie.isdog) && e_zombie.isdog)
		{
			continue;
		}
		str_tag = "j_head";
		v_target = e_zombie GetTagOrigin(str_tag);
		e_grenade moveto(v_target, 0.3);
		e_grenade waittill("movedone");
		current_tactical_grenade = self zm_utility::get_player_tactical_grenade();
		if(isdefined(e_zombie) && isalive(e_zombie))
		{
			if(current_tactical_grenade.name == "t6_zombie_tomahawk_upgraded")
			{
				PlayFXOnTag("harry/tomahawk/fx_tomahawk_impact_ug", e_zombie, str_tag);
				continue;
			}
			PlayFXOnTag("harry/tomahawk/fx_tomahawk_impact", e_zombie, str_tag);
			e_zombie clientfield::set("play_tomahawk_hit_sound", 1);
			n_tomahawk_damage = function_44e79302(e_zombie, e_grenade.n_grenade_charge_power, e_grenade);
			e_zombie DoDamage(n_tomahawk_damage, e_grenade.origin, self, e_grenade, "none", "MOD_GRENADE", 0, GetWeapon("t6_zombie_tomahawk"));
			e_zombie.var_9eb9f302 = 1;
			self zm_score::add_to_player_score(10);
			return;
		}
	}
	continue;
}

/*
	Name: tomahawk_spawn
	Namespace: namespace_89d026b5
	Checksum: 0xE060413E
	Offset: 0x1EC8
	Size: 0x1C0
	Parameters: 2
	Flags: None
	Line Number: 581
*/
function tomahawk_spawn(var_38cdea23, var_41e59314)
{
	var_c5ee6b4f = spawn("script_model", var_38cdea23);
	if(self.current_tactical_grenade.name == "t6_zombie_tomahawk_upgraded")
	{
		var_c5ee6b4f SetModel(function_1c8adcb0(GetWeapon("t6_zombie_tomahawk_upgraded")));
		PlayFXOnTag("harry/tomahawk/fx_tomahawk_trail_ug", var_c5ee6b4f, "tag_origin");
		continue;
	}
	var_c5ee6b4f SetModel(function_1c8adcb0(GetWeapon("t6_zombie_tomahawk")));
	PlayFXOnTag("harry/tomahawk/fx_tomahawk_trail", var_c5ee6b4f, "tag_origin");
	var_c5ee6b4f thread tomahawk_spin();
	var_c5ee6b4f PlayLoopSound("wpn_tomahawk_spin");
	if(isdefined(var_41e59314) && var_41e59314 > 1)
	{
		PlayFXOnTag("harry/tomahawk/fx_tomahawk_charged_trail", var_c5ee6b4f, "tag_origin");
	}
	var_c5ee6b4f.low_level_instant_kill_charge = 1;
	return var_c5ee6b4f;
}

/*
	Name: tomahawk_spin
	Namespace: namespace_89d026b5
	Checksum: 0x8580E91D
	Offset: 0x2090
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 612
*/
function tomahawk_spin()
{
	self endon("death");
	while(isdefined(self))
	{
		self RotatePitch(90, 0.2);
		wait(0.15);
	}
}

/*
	Name: function_44e79302
	Namespace: namespace_89d026b5
	Checksum: 0x487D53B1
	Offset: 0x20D8
	Size: 0x140
	Parameters: 3
	Flags: None
	Line Number: 632
*/
function function_44e79302(var_75d5a11b, n_tomahawk_power, var_c5ee6b4f)
{
	if(n_tomahawk_power > 2)
	{
		return var_75d5a11b.health + 1;
	}
	else if(level.round_number >= 10 && level.round_number < 13 && var_c5ee6b4f.low_level_instant_kill_charge <= 3)
	{
		var_c5ee6b4f.low_level_instant_kill_charge = var_c5ee6b4f.low_level_instant_kill_charge + 1;
		return var_75d5a11b.health + 1;
	}
	else if(level.round_number >= 13 && level.round_number < 15 && var_c5ee6b4f.low_level_instant_kill_charge <= 2)
	{
		var_c5ee6b4f.low_level_instant_kill_charge = var_c5ee6b4f.low_level_instant_kill_charge + 1;
		return var_75d5a11b.health + 1;
		continue;
	}
	return 1000 * n_tomahawk_power;
}

/*
	Name: tomahawk_pickup
	Namespace: namespace_89d026b5
	Checksum: 0xDC3B98EF
	Offset: 0x2220
	Size: 0x340
	Parameters: 0
	Flags: None
	Line Number: 662
*/
function tomahawk_pickup()
{
	s_pos_tomahawk = struct::get("tomahawk_pickup_pos", "targetname");
	if(isdefined(s_pos_tomahawk))
	{
		var_c5ee6b4f = spawn("script_model", s_pos_tomahawk.origin);
		var_c5ee6b4f SetModel(function_1c8adcb0(GetWeapon("t6_zombie_tomahawk")));
		var_c5ee6b4f thread tomahawk_pickup_spin();
		var_c5ee6b4f PlayLoopSound("amb_tomahawk_swirl");
		e_trigger = spawn("trigger_radius_use", s_pos_tomahawk.origin, 0, 100, 150);
		e_trigger UseTriggerRequireLookAt();
		e_trigger TriggerIgnoreTeam();
		e_trigger setHintString("Press and hold ^3&&1^7 for Hell's Retriever");
		e_trigger setcursorhint("HINT_NOICON");
		e_trigger thread tomahawk_pickup_trigger("t6_zombie_tomahawk");
	}
	s_pos_tomahawk = struct::get("tomahawk_upgraded_pickup_pos", "targetname");
	if(isdefined(s_pos_tomahawk))
	{
		var_c5ee6b4f = spawn("script_model", s_pos_tomahawk.origin);
		var_c5ee6b4f SetModel(function_1c8adcb0(GetWeapon("t6_zombie_tomahawk_upgraded")));
		var_c5ee6b4f thread tomahawk_pickup_spin();
		var_c5ee6b4f PlayLoopSound("amb_tomahawk_swirl");
		e_trigger = spawn("trigger_radius_use", s_pos_tomahawk.origin, 0, 100, 150);
		e_trigger UseTriggerRequireLookAt();
		e_trigger TriggerIgnoreTeam();
		e_trigger setHintString("Press and hold ^3&&1^7 for Hell's Redeemer");
		e_trigger setcursorhint("HINT_NOICON");
		e_trigger thread tomahawk_pickup_trigger("t6_zombie_tomahawk_upgraded");
	}
}

/*
	Name: tomahawk_pickup_trigger
	Namespace: namespace_89d026b5
	Checksum: 0xBA09204A
	Offset: 0x2568
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 704
*/
function tomahawk_pickup_trigger(var_3b8b4cf7)
{
	var_3a916c19 = GetWeapon(var_3b8b4cf7);
	var_2358ca00 = GetWeapon(var_3b8b4cf7 + "_flourish");
	while(isdefined(self))
	{
		self waittill("trigger", e_player);
		if(e_player hasweapon(var_3a916c19))
		{
			continue;
		}
		e_player zm_weapons::weapon_give(var_3a916c19, 0, 0, 1, 0);
		e_player GiveWeapon(var_2358ca00);
		e_player SwitchToWeapon(var_2358ca00);
		e_player zm_utility::disable_player_move_states(1);
		e_player util::waittill_any("death_or_disconnect", "player_downed", "weapon_change_complete");
		e_player zm_utility::enable_player_move_states();
		e_player TakeWeapon(var_2358ca00);
		e_player thread tomahawk_tutorial_hint(var_3a916c19);
	}
}

/*
	Name: tomahawk_pickup_spin
	Namespace: namespace_89d026b5
	Checksum: 0xBEBEA1BA
	Offset: 0x26F8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 736
*/
function tomahawk_pickup_spin()
{
	self endon("death");
	while(isdefined(self))
	{
		self RotateYaw(90, 1);
		wait(0.15);
	}
}

/*
	Name: tomahawk_tutorial_hint
	Namespace: namespace_89d026b5
	Checksum: 0x5BCD6924
	Offset: 0x2740
	Size: 0x16C
	Parameters: 1
	Flags: None
	Line Number: 756
*/
function tomahawk_tutorial_hint(w_weapon)
{
	self endon("disconnect");
	var_ee245e79 = newClientHudElem(self);
	var_ee245e79.alignX = "center";
	var_ee245e79.alignY = "middle";
	var_ee245e79.horzAlign = "center";
	var_ee245e79.vertAlign = "bottom";
	var_ee245e79.y = -120;
	var_ee245e79.foreground = 1;
	var_ee245e79.font = "default";
	var_ee245e79.fontscale = 1.5;
	var_ee245e79.alpha = 1;
	var_ee245e79.color = (1, 1, 1);
	var_ee245e79 setText("Press [{+smoke}] to Throw the " + w_weapon.displayName);
	self util::waittill_any_timeout(5, "throwing_tomahawk", "death");
	var_ee245e79 destroy();
}

