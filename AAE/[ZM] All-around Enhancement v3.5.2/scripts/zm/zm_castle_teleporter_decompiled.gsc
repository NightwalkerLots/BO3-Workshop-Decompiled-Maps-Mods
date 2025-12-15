#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_timer;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_elemental_bow_wolf_howl;
#include scripts\zm\zm_castle_ee;
#include scripts\zm\zm_castle_mechz;
#include scripts\zm\zm_castle_vo;

#namespace namespace_fa1b0620;

/*
	Name: __init__sytem__
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x7A0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 33
*/
function autoexec __init__sytem__()
{
	system::register("zm_castle_teleporter", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x7E8
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function __init__()
{
	level.dog_melee_range = 130;
	level.teleport = [];
	level.active_links = 0;
	level.countdown = 0;
	level.n_teleport_delay = 2;
	level.n_teleport_cooldown = 45;
	/#
		if(GetDvarInt("Dev Block strings are not supported") > 0)
		{
			level.n_teleport_cooldown = 3;
		}
	#/
	level.is_cooldown = 0;
	level.n_teleport_time = 0;
	level.var_47f4765c = 0;
	level flag::init("castle_teleporter_used");
	visionset_mgr::register_info("overlay", "zm_factory_teleport", 5000, 61, 1, 1);
	visionset_mgr::register_info("overlay", "zm_castle_transported", 1, 20, 15, 1, &visionset_mgr::duration_lerp_thread_per_player, 0);
	clientfield::register("world", "ee_quest_time_travel_ready", 5000, 1, "int");
	clientfield::register("toplayer", "ee_quest_back_in_time_teleport_fx", 5000, 1, "int");
	clientfield::register("toplayer", "ee_quest_back_in_time_postfx", 5000, 1, "int");
	clientfield::register("toplayer", "ee_quest_back_in_time_sfx", 5000, 1, "int");
}

/*
	Name: __main__
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x9E8
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 84
*/
function __main__()
{
	a_e_trig = GetEntArray("trigger_teleport_pad", "targetname");
	foreach(e_trig in a_e_trig)
	{
		level.var_27b3c884[n_index] = e_trig;
		e_trig thread teleport_pad_think();
	}
	level.no_dog_clip = 1;
	level.teleport_ae_funcs = [];
	if(!IsSplitscreen())
	{
		level.teleport_ae_funcs[level.teleport_ae_funcs.size] = &teleport_aftereffect_fov;
	}
	level.teleport_ae_funcs[level.teleport_ae_funcs.size] = &teleport_aftereffect_shellshock;
	level.teleport_ae_funcs[level.teleport_ae_funcs.size] = &teleport_aftereffect_shellshock_electric;
	level.teleport_ae_funcs[level.teleport_ae_funcs.size] = &teleport_aftereffect_bw_vision;
	level.teleport_ae_funcs[level.teleport_ae_funcs.size] = &teleport_aftereffect_red_vision;
	level.teleport_ae_funcs[level.teleport_ae_funcs.size] = &teleport_aftereffect_flashy_vision;
	level.teleport_ae_funcs[level.teleport_ae_funcs.size] = &teleport_aftereffect_flare_vision;
	thread function_602c54a6();
}

/*
	Name: function_602c54a6
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0xBE0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 117
*/
function function_602c54a6()
{
	level endon("hash_b23d0ee1");
	level endon("end_game");
	level flag::wait_till("rune_prison_magma_ball");
	var_effd0eae = GetEntArray("aq_rp_runic_circle_volume", "script_noteworthy");
	thread function_b34903fc(var_effd0eae);
	while(1)
	{
		function_ba2e3f8f();
		wait(0.05);
	}
}

/*
	Name: function_ba2e3f8f
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0xC80
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 141
*/
function function_ba2e3f8f()
{
	if(isdefined(level.var_c62829c7) && (isdefined(level.var_c62829c7.var_122a2dda) && level.var_c62829c7.var_122a2dda))
	{
		wait(0.3);
		jump_pads = GetEntArray("player_vehicle", "targetname");
		foreach(pads in jump_pads)
		{
			if(level.var_c62829c7 islinkedto(pads))
			{
				var_3e910dc4 = pads;
				continue;
			}
		}
		if(GetDvarInt("firebow_slowmo") != 1)
		{
			var_3e910dc4 thread function_9c7547a1(level.var_c62829c7);
		}
		while(isdefined(level.var_c62829c7) && (isdefined(level.var_c62829c7.var_122a2dda) && level.var_c62829c7.var_122a2dda))
		{
			wait(0.05);
		}
	}
}

/*
	Name: function_9c7547a1
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0xE20
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 176
*/
function function_9c7547a1(player)
{
	player endon("disconnect");
	self endon("death");
	old_speed = self GetSpeedMPH();
	self SetSpeedImmediate(10, 15, 5);
	while(!player useButtonPressed())
	{
		wait(0.05);
	}
	self SetSpeedImmediate(old_speed, 15, 5);
}

/*
	Name: function_b34903fc
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0xED8
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 199
*/
function function_b34903fc(var_effd0eae)
{
	level endon("hash_b23d0ee1");
	while(1)
	{
		if(var_effd0eae[0] flag::get("runic_circle_activated") && var_effd0eae[1] flag::get("runic_circle_activated") && var_effd0eae[2] flag::get("runic_circle_activated"))
		{
			level notify("hash_b23d0ee1");
		}
		wait(0.05);
	}
}

/*
	Name: pad_manager
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0xF88
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 222
*/
function pad_manager()
{
	foreach(t_trig in level.var_27b3c884)
	{
		t_trig setHintString(&"ZOMBIE_TELEPORT_COOLDOWN");
		t_trig teleport_trigger_invisible(0);
	}
	level.is_cooldown = 1;
	Array::thread_all(level.var_27b3c884, &function_68ebacd3);
	wait(level.n_teleport_cooldown);
	level.is_cooldown = 0;
	foreach(t_trig in level.var_27b3c884)
	{
		if(level flag::get("rocket_firing"))
		{
			t_trig setHintString(&"ZM_CASTLE_TELEPORT_LOCKED");
			continue;
		}
		if(isdefined(t_trig.var_1c5080fe) && t_trig.var_1c5080fe)
		{
			t_trig setHintString(&"ZM_CASTLE_TELEPORT_USE", 500);
			continue;
		}
		t_trig setHintString(&"ZOMBIE_LINK_TPAD");
	}
}

/*
	Name: function_68ebacd3
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x1198
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 259
*/
function function_68ebacd3()
{
	self.var_eb37ce09 = undefined;
	wait(10);
	while(level.is_cooldown)
	{
		if(!isdefined(self.var_eb37ce09))
		{
			foreach(e_player in level.activePlayers)
			{
				if(e_player istouching(self))
				{
					if(!level flag::get("rocket_firing"))
					{
						self thread function_798f36c();
						continue;
					}
				}
			}
		}
		wait(0.4);
	}
}

/*
	Name: function_798f36c
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x12A0
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 293
*/
function function_798f36c()
{
	self.var_eb37ce09 = GetTime();
	playsoundatposition("vox_maxis_teleporter_pa_recharging_0", self.origin);
	while(level.is_cooldown)
	{
		if(GetTime() - self.var_eb37ce09 > 16000)
		{
			foreach(e_player in level.activePlayers)
			{
				if(e_player istouching(self))
				{
					self.var_eb37ce09 = GetTime();
					playsoundatposition("vox_maxis_teleporter_pa_recharging_0", self.origin);
					continue;
				}
			}
		}
		wait(1);
	}
	self.var_eb37ce09 = undefined;
	wait(3);
	playsoundatposition("vox_maxis_teleporter_pa_available_0", self.origin);
}

/*
	Name: function_ee24bc2e
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x13F8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 328
*/
function function_ee24bc2e()
{
	foreach(t_trig in level.var_27b3c884)
	{
		if(level flag::get("rocket_firing"))
		{
			t_trig setHintString(&"ZM_CASTLE_TELEPORT_LOCKED");
			continue;
		}
		if(level.is_cooldown == 1)
		{
			t_trig setHintString(&"ZOMBIE_TELEPORT_COOLDOWN");
			continue;
		}
		t_trig setHintString(&"ZM_CASTLE_TELEPORT_USE", 500);
	}
}

/*
	Name: update_trigger_visibility
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x1510
	Size: 0xF8
	Parameters: 0
	Flags: Private
	Line Number: 356
*/
function private update_trigger_visibility()
{
	self endon("death");
	while(1)
	{
		for(i = 0; i < level.players.size; i++)
		{
			if(DistanceSquared(level.players[i].origin, self.origin) < 16384)
			{
				if(level.players[i].IS_DRINKING > 0)
				{
					self setinvisibletoplayer(level.players[i], 1);
					continue;
				}
				self setinvisibletoplayer(level.players[i], 0);
			}
		}
		wait(0.25);
	}
}

/*
	Name: teleport_pad_think
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x1610
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 387
*/
function teleport_pad_think()
{
	self setcursorhint("HINT_NOICON");
	self setHintString(&"ZOMBIE_NEED_POWER");
	level flag::wait_till("power_on");
	for(i = 0; i < level.zombie_damage_callbacks.size; i++)
	{
		if(level.zombie_damage_callbacks[i] == &namespace_d37f1c72::function_5fded2aa)
		{
			level.zombie_damage_callbacks[i] = &function_1d12c39b;
		}
	}
	self thread teleport_pad_active_think();
	self thread update_trigger_visibility();
}

/*
	Name: function_1d12c39b
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x1718
	Size: 0x198
	Parameters: 13
	Flags: None
	Line Number: 413
*/
function function_1d12c39b(mod, HIT_LOCATION, hit_origin, e_player, amount, weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(isalive(self) && (!(isdefined(self.isdog) && self.isdog)) && IsSubStr(weapon.name, "elemental_bow_wolf_howl") && mod !== "MOD_MELEE")
	{
		self notify("hash_8985bb6f");
		self clientfield::set("wolf_howl_slow_snow_fx", 1);
		if(self.archetype === "mechz")
		{
			self DoDamage(amount, hit_origin, e_player, e_player, undefined, "MOD_PROJECTILE_SPLASH", 0, level.var_e93874ed);
		}
		else
		{
			self DoDamage(self.health, self.origin, e_player, e_player, undefined, "MOD_UNKNOWN", 0, level.var_e93874ed);
		}
		return 1;
	}
	return 0;
}

/*
	Name: teleport_pad_active_think
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x18B8
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 442
*/
function teleport_pad_active_think()
{
	self setcursorhint("HINT_NOICON");
	self.var_1c5080fe = 1;
	e_player = undefined;
	self setHintString(&"ZM_CASTLE_TELEPORT_USE", 500);
	exploder::exploder("fxexp_100");
	while(1)
	{
		self waittill("trigger", e_player);
		if(zm_utility::is_player_valid(e_player) && !level.is_cooldown && !level flag::get("rocket_firing") && level flag::get("time_travel_teleporter_ready"))
		{
			if(function_6b3344b4())
			{
				if(!function_ad16f13c(e_player))
				{
					continue;
				}
				self playsound("evt_teleporter_warmup");
				self function_264f93ff(1, 0);
			}
		}
		else if(zm_utility::is_player_valid(e_player) && !level.is_cooldown && !level flag::get("rocket_firing"))
		{
			if(!function_ad16f13c(e_player))
			{
				continue;
			}
			self playsound("evt_teleporter_warmup");
			self function_264f93ff(0);
		}
	}
}

/*
	Name: function_ad16f13c
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x1AC0
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 486
*/
function function_ad16f13c(e_who)
{
	if(e_who.IS_DRINKING > 0)
	{
		return 0;
	}
	if(e_who zm_utility::in_revive_trigger())
	{
		return 0;
	}
	if(zm_utility::is_player_valid(e_who))
	{
		if(!e_who zm_score::can_player_purchase(500))
		{
			e_who zm_audio::create_and_play_dialog("general", "transport_deny");
			return 0;
		}
		e_who zm_score::minus_to_player_score(500);
		return 1;
	}
	return 0;
}

/*
	Name: function_6b3344b4
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x1B98
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 519
*/
function function_6b3344b4()
{
	a_e_trig = GetEntArray("trigger_teleport_pad", "targetname");
	var_d30fe07b = 1;
	players = level.activePlayers;
	foreach(player in players)
	{
		var_1a19680c = 0;
		foreach(e_trig in a_e_trig)
		{
			if(player istouching(e_trig))
			{
				var_1a19680c = 1;
			}
		}
		if(!isalive(player) || !var_1a19680c)
		{
			var_d30fe07b = 0;
		}
	}
	return var_d30fe07b;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_264f93ff
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x1D40
	Size: 0x598
	Parameters: 2
	Flags: None
	Line Number: 553
*/
function function_264f93ff(var_edc2ee2a, var_66f7e6b9)
{
	if(!isdefined(var_edc2ee2a))
	{
		var_edc2ee2a = 0;
	}
	if(!isdefined(var_66f7e6b9))
	{
		var_66f7e6b9 = 0;
	}
	Array::thread_all(level.var_27b3c884, &teleport_trigger_invisible, 1);
	if(var_edc2ee2a && !var_66f7e6b9)
	{
		level.disable_nuke_delay_spawning = 1;
		level flag::clear("spawn_zombies");
		namespace_c93e4c32::function_5db6ba34();
	}
	time_since_last_teleport = GetTime() - level.n_teleport_time;
	exploder::exploder("fxexp_101");
	self thread function_f5a06c(level.n_teleport_delay);
	if(!var_edc2ee2a)
	{
		self thread teleport_nuke(20, 300);
	}
	if(var_edc2ee2a && !var_66f7e6b9)
	{
		level thread namespace_c93e4c32::function_2c1aa78f();
	}
	foreach(player in level.activePlayers)
	{
		if(player.zone_name === "zone_v10_pad")
		{
			player zm_utility::create_streamer_hint(struct::get_array(self.target, "targetname")[0].origin, struct::get_array(self.target, "targetname")[0].angles, 1);
		}
		if(var_edc2ee2a)
		{
			if(var_66f7e6b9)
			{
				player clientfield::set_to_player("ee_quest_back_in_time_sfx", 0);
				continue;
			}
			player clientfield::set_to_player("ee_quest_back_in_time_sfx", 1);
		}
	}
	wait(level.n_teleport_delay);
	self notify("fx_done");
	if(var_edc2ee2a && !var_66f7e6b9)
	{
		if(!level flag::get("dimension_set"))
		{
			namespace_c93e4c32::function_3918d831("safe_code_past");
		}
	}
	self teleport_players(var_edc2ee2a, var_66f7e6b9);
	if(var_edc2ee2a)
	{
		if(var_66f7e6b9)
		{
			if(self.script_int === 0)
			{
				level thread function_e421dd3f();
			}
			else
			{
				s_spawn_pos = struct::get("ee_mechz_time_lab", "targetname");
				playFX(level._effect["lightning_dog_spawn"], s_spawn_pos.origin);
				ai_mechz = namespace_48131a3f::function_314d744b(0, s_spawn_pos, 0);
				ai_mechz.no_damage_points = 1;
				ai_mechz.deathpoints_already_given = 1;
				ai_mechz.exclude_cleanup_adding_to_total = 1;
			}
			level flag::set("spawn_zombies");
			level.disable_nuke_delay_spawning = 0;
		}
		else
		{
			wait(0.5);
			level notify("hash_59b7ed");
		}
	}
	if(level.is_cooldown == 0 && !level flag::get("time_travel_teleporter_ready"))
	{
		thread pad_manager();
	}
	wait(2);
	ss = struct::get("teleporter_powerup", "targetname");
	if(isdefined(ss))
	{
		ss thread zm_powerups::special_powerup_drop(ss.origin);
	}
	level.n_teleport_time = GetTime();
	if(var_edc2ee2a && !var_66f7e6b9)
	{
		level flag::clear("time_travel_teleporter_ready");
		wait(33);
		self function_264f93ff(1, 1);
		level thread namespace_97ddfc0d::function_8b0b26a6();
		namespace_c93e4c32::function_71152937();
		return;
	}
}

/*
	Name: function_e421dd3f
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x22E0
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 665
*/
function function_e421dd3f()
{
	level notify("hash_bff04a2b");
	level endon("hash_bff04a2b");
	var_9e5ac8d1 = GetEnt("trig_mechz_ee_a10", "targetname");
	var_9e5ac8d1 waittill("trigger", e_who);
	s_spawn_pos = ArrayGetClosest(e_who.origin, level.zm_loc_types["mechz_location"]);
	if(isPlayer(e_who) && isdefined(s_spawn_pos))
	{
		ai_mechz = namespace_48131a3f::function_314d744b(0, s_spawn_pos, 1);
		ai_mechz.no_damage_points = 1;
		ai_mechz.deathpoints_already_given = 1;
		ai_mechz.exclude_cleanup_adding_to_total = 1;
	}
}

/*
	Name: teleport_trigger_invisible
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x2410
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 691
*/
function teleport_trigger_invisible(enable)
{
	players = GetPlayers();
	foreach(player in players)
	{
		self setinvisibletoplayer(player, enable);
	}
	return;
}

/*
	Name: player_is_near_pad
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x24D0
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 711
*/
function player_is_near_pad(player)
{
	n_dist_sq = DistanceSquared(player.origin, self.origin);
	if(n_dist_sq < 30625)
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f5a06c
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x2530
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 732
*/
function function_f5a06c(n_duration)
{
	Array::thread_all(level.activePlayers, &teleport_pad_player_fx, self, n_duration);
}

/*
	Name: teleport_pad_player_fx
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x2578
	Size: 0x170
	Parameters: 2
	Flags: None
	Line Number: 747
*/
function teleport_pad_player_fx(var_7d7ca0ea, n_duration)
{
	var_7d7ca0ea endon("fx_done");
	n_start_time = GetTime();
	n_total_time = 0;
	while(n_total_time < n_duration)
	{
		if(var_7d7ca0ea player_is_near_pad(self))
		{
			visionset_mgr::activate("overlay", "zm_factory_teleport", self, n_duration, n_duration);
			self PlayRumbleOnEntity("zm_castle_pulsing_rumble");
			while(n_total_time < n_duration && var_7d7ca0ea player_is_near_pad(self))
			{
				n_current_time = GetTime();
				n_total_time = n_current_time - n_start_time / 1000;
				util::wait_network_frame();
			}
			visionset_mgr::deactivate("overlay", "zm_factory_teleport", self);
		}
		n_current_time = GetTime();
		n_total_time = n_current_time - n_start_time / 1000;
		util::wait_network_frame();
	}
}

/*
	Name: teleport_players
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x26F0
	Size: 0x8A8
	Parameters: 2
	Flags: None
	Line Number: 782
*/
function teleport_players(var_edc2ee2a, var_66f7e6b9)
{
	if(!isdefined(var_edc2ee2a))
	{
		var_edc2ee2a = 0;
	}
	if(!isdefined(var_66f7e6b9))
	{
		var_66f7e6b9 = 0;
	}
	level flag::set("castle_teleporter_used");
	n_player_radius = 24;
	if(var_edc2ee2a && !var_66f7e6b9)
	{
		var_764d9cb = struct::get_array("past_laboratory_telepoints", "targetname");
	}
	else
	{
		var_764d9cb = struct::get_array(self.target, "targetname");
	}
	var_492a5e1e = struct::get_array("teleport_room_pos", "targetname");
	a_players_touching = [];
	var_daad3c3c = VectorScale((0, 0, 1), 49);
	var_6b55b1c4 = VectorScale((0, 0, 1), 20);
	var_3abe10e2 = (0, 0, 0);
	for(i = 0; i < level.activePlayers.size; i++)
	{
		player = level.activePlayers[i];
		if(var_edc2ee2a)
		{
			if(var_66f7e6b9)
			{
				level flag::clear("time_travel_teleporter_ready");
			}
		}
		v_dest_origin = var_764d9cb[i].origin;
		var_a9d3e161 = var_764d9cb[i].angles;
		if(var_edc2ee2a || self player_is_near_pad(player))
		{
			if(var_edc2ee2a && var_66f7e6b9)
			{
				player clientfield::set_to_player("ee_quest_back_in_time_postfx", 0);
			}
			if(var_edc2ee2a)
			{
				if(var_66f7e6b9)
				{
					player clientfield::set_to_player("ee_quest_back_in_time_sfx", 0);
				}
				else
				{
					player clientfield::set_to_player("ee_quest_back_in_time_sfx", 1);
				}
			}
			if(isdefined(var_492a5e1e[i]))
			{
				visionset_mgr::deactivate("overlay", "zm_trap_electric", player);
				if(var_edc2ee2a)
				{
					player clientfield::set_to_player("ee_quest_back_in_time_teleport_fx", 1);
				}
				else
				{
					visionset_mgr::activate("overlay", "zm_factory_teleport", player);
				}
				player.b_teleporting = 1;
				if(player GetStance() == "prone")
				{
					desired_origin = var_492a5e1e[i].origin + var_daad3c3c;
				}
				else if(player GetStance() == "crouch")
				{
					desired_origin = var_492a5e1e[i].origin + var_6b55b1c4;
				}
				else
				{
					desired_origin = var_492a5e1e[i].origin + var_3abe10e2;
				}
				Array::add(a_players_touching, player, 0);
				player.var_601ebf01 = util::spawn_model("tag_origin", player.origin, player.angles);
				player LinkTo(player.var_601ebf01);
				player DontInterpolate();
				player.var_601ebf01 DontInterpolate();
				player.var_601ebf01.origin = desired_origin;
				player.var_601ebf01.angles = var_492a5e1e[i].angles;
				player Hide();
				util::wait_network_frame();
				if(isdefined(player))
				{
					util::setClientSysState("levelNotify", "black_box_start", player);
					player.var_601ebf01.angles = var_492a5e1e[i].angles;
					continue;
				}
			}
		}
		visionset_mgr::deactivate("overlay", "zm_factory_teleport", player);
	}
	wait(2);
	Array::random(var_764d9cb) thread teleport_nuke(undefined, 300);
	for(i = 0; i < level.activePlayers.size; i++)
	{
		util::setClientSysState("levelNotify", "black_box_end", level.activePlayers[i]);
	}
	util::wait_network_frame();
	for(i = 0; i < a_players_touching.size; i++)
	{
		player = a_players_touching[i];
		if(!isdefined(player))
		{
			continue;
		}
		player Unlink();
		if(positionWouldTelefrag(var_764d9cb[i].origin))
		{
			player SetOrigin(var_764d9cb[i].origin + (RandomFloatRange(-16, 16), RandomFloatRange(-16, 16), 0));
		}
		else
		{
			player SetOrigin(var_764d9cb[i].origin);
		}
		player SetPlayerAngles(var_764d9cb[i].angles);
		if(var_edc2ee2a)
		{
			player clientfield::set_to_player("ee_quest_back_in_time_teleport_fx", 0);
		}
		visionset_mgr::deactivate("overlay", "zm_factory_teleport", player);
		player show();
		player.b_teleporting = undefined;
		player thread teleport_aftereffects();
		player zm_utility::clear_streamer_hint();
		player.var_601ebf01 delete();
	}
	level.var_47f4765c++;
	if(level.var_47f4765c == 1 || level.var_47f4765c % 3 == 0)
	{
		playsoundatposition("vox_maxis_teleporter_pa_success_0", var_764d9cb[0].origin);
	}
	exploder::exploder("fxexp_102");
}

/*
	Name: function_4a0d1595
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x2FA0
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 932
*/
function function_4a0d1595()
{
	wait(0.05);
}

/*
	Name: teleport_2d_audio
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x2FB8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 947
*/
function teleport_2d_audio()
{
	self endon("fx_done");
	while(1)
	{
		players = GetPlayers();
		wait(1.7);
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(players[i]))
			{
				if(self player_is_near_pad(players[i]))
				{
					util::setClientSysState("levelNotify", "t2d", players[i]);
				}
			}
		}
	}
}

/*
	Name: teleport_nuke
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x3090
	Size: 0x1A8
	Parameters: 2
	Flags: None
	Line Number: 977
*/
function teleport_nuke(max_zombies, range)
{
	zombies = GetAISpeciesArray(level.zombie_team);
	zombies = util::get_array_of_closest(self.origin, zombies, undefined, max_zombies, range);
	for(i = 0; i < zombies.size; i++)
	{
		wait(RandomFloatRange(0.2, 0.3));
		if(!isdefined(zombies[i]))
		{
			continue;
		}
		if(zm_utility::is_magic_bullet_shield_enabled(zombies[i]))
		{
			continue;
		}
		if(zombies[i].archetype === "mechz")
		{
			continue;
		}
		if(!zombies[i].isdog)
		{
			zombies[i] zombie_utility::zombie_head_gib();
		}
		zombies[i] DoDamage(10000, zombies[i].origin);
		playsoundatposition("nuked", zombies[i].origin);
	}
}

/*
	Name: teleporter_wire_wait
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x3240
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 1015
*/
function teleporter_wire_wait(index)
{
	targ = struct::get("pad_" + index + "_wire", "targetname");
	if(!isdefined(targ))
	{
		return;
	}
	while(isdefined(targ))
	{
		if(isdefined(targ.target))
		{
			target = struct::get(targ.target, "targetname");
			wait(0.1);
			targ = target;
			break;
		}
		else
		{
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: teleport_aftereffects
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x3308
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 1049
*/
function teleport_aftereffects(var_edc2ee2a, var_66f7e6b9)
{
	if(GetDvarString("castleAftereffectOverride") == "-1")
	{
		self thread [[level.teleport_ae_funcs[RandomInt(level.teleport_ae_funcs.size)]]]();
	}
	else
	{
		self thread [[level.teleport_ae_funcs[Int(GetDvarString("castleAftereffectOverride"))]]]();
	}
}

/*
	Name: teleport_aftereffect_shellshock
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x33C0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1071
*/
function teleport_aftereffect_shellshock()
{
	/#
		println("Dev Block strings are not supported");
	#/
	self shellshock("explosion", 4);
	return;
	ERROR: Bad function call
}

/*
	Name: teleport_aftereffect_shellshock_electric
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x3410
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1091
*/
function teleport_aftereffect_shellshock_electric()
{
	/#
		println("Dev Block strings are not supported");
	#/
	self shellshock("electrocution", 4);
}

/*
	Name: teleport_aftereffect_fov
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x3460
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1109
*/
function teleport_aftereffect_fov()
{
	util::setClientSysState("levelNotify", "tae", self);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: teleport_aftereffect_bw_vision
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x3490
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 1127
*/
function teleport_aftereffect_bw_vision(localClientNum)
{
	util::setClientSysState("levelNotify", "tae", self);
}

/*
	Name: teleport_aftereffect_red_vision
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x34C8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 1142
*/
function teleport_aftereffect_red_vision(localClientNum)
{
	util::setClientSysState("levelNotify", "tae", self);
}

/*
	Name: teleport_aftereffect_flashy_vision
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x3500
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 1157
*/
function teleport_aftereffect_flashy_vision(localClientNum)
{
	util::setClientSysState("levelNotify", "tae", self);
}

/*
	Name: teleport_aftereffect_flare_vision
	Namespace: namespace_fa1b0620
	Checksum: 0x424F4353
	Offset: 0x3538
	Size: 0x2C
	Parameters: 1
	Flags: None
	Line Number: 1172
*/
function teleport_aftereffect_flare_vision(localClientNum)
{
	util::setClientSysState("levelNotify", "tae", self);
}

