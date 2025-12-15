#include scripts\codescripts\struct;
#include scripts\shared\abilities\_ability_player;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai\zombie_vortex;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\throttle_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_hero_weapon;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace zm_weap_gravityspikes;

/*
	Name: __init__sytem__
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x980
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 44
*/
function autoexec __init__sytem__()
{
	system::register("zm_weap_gravityspikes", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x9C0
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 59
*/
function __init__()
{
	level.n_zombies_lifted_for_ragdoll = 0;
	level.SPIKES_CHOP_CONE_RANGE = 120;
	level.spikes_chop_cone_range_sq = level.SPIKES_CHOP_CONE_RANGE * level.SPIKES_CHOP_CONE_RANGE;
	function_9b385ca5();
	level.ai_gravity_throttle = Throttle;
	Initialize(level.ai_gravity_throttle, 2);
	function_9b385ca5();
	level.ai_spikes_chop_throttle = Throttle;
	Initialize(level.ai_spikes_chop_throttle, 6);
	register_clientfields();
	callback::on_connect(&on_connect_func_for_gravityspikes);
	zm_hero_weapon::register_hero_weapon("hero_gravityspikes_melee");
	zm_hero_weapon::register_hero_weapon_wield_unwield_callbacks("hero_gravityspikes_melee", &wield_gravityspikes, &unwield_gravityspikes);
	zm_hero_weapon::register_hero_weapon_power_callbacks("hero_gravityspikes_melee", undefined, &gravityspikes_power_expired);
	zm::register_player_damage_callback(&player_invulnerable_during_gravityspike_slam);
	zm_hero_weapon::register_hero_recharge_event(GetWeapon("hero_gravityspikes_melee"), &gravityspikes_power_override);
}

/*
	Name: register_clientfields
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0xB70
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 89
*/
function register_clientfields()
{
	clientfield::register("actor", "gravity_slam_down", 1, 1, "int");
	clientfield::register("scriptmover", "gravity_trap_fx", 1, 1, "int");
	clientfield::register("scriptmover", "gravity_trap_spike_spark", 1, 1, "int");
	clientfield::register("scriptmover", "gravity_trap_destroy", 1, 1, "counter");
	clientfield::register("scriptmover", "gravity_trap_location", 1, 1, "int");
	clientfield::register("scriptmover", "gravity_slam_fx", 1, 1, "int");
	clientfield::register("toplayer", "gravity_slam_player_fx", 1, 1, "counter");
	clientfield::register("actor", "sparky_beam_fx", 1, 1, "int");
	clientfield::register("actor", "sparky_zombie_fx", 1, 1, "int");
	clientfield::register("actor", "sparky_zombie_trail_fx", 1, 1, "int");
	clientfield::register("toplayer", "gravity_trap_rumble", 1, 1, "int");
	clientfield::register("actor", "ragdoll_impact_watch", 1, 1, "int");
	clientfield::register("actor", "gravity_spike_zombie_explode_fx", 12000, 1, "counter");
}

/*
	Name: on_connect_func_for_gravityspikes
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0xDF0
	Size: 0x208
	Parameters: 0
	Flags: Private
	Line Number: 116
*/
function private on_connect_func_for_gravityspikes()
{
	self endon("disconnect");
	self endon("bled_out");
	self endon("death");
	self endon("gravity_spike_expired");
	w_gravityspike = GetWeapon("hero_gravityspikes_melee");
	self update_gravityspikes_state(0);
	self.b_gravity_trap_spikes_in_ground = 0;
	self.disable_hero_power_charging = 0;
	self.b_gravity_trap_fx_on = 0;
	self thread reset_after_bleeding_out();
	do
	{
		self waittill("new_hero_weapon", weapon);
	}
	while(!weapon != w_gravityspike);
	if(isdefined(self.a_gravityspikes_prev_ammo_clip) && isdefined(self.a_gravityspikes_prev_ammo_clip["hero_gravityspikes_melee"]))
	{
		self SetWeaponAmmoClip(w_gravityspike, self.a_gravityspikes_prev_ammo_clip["hero_gravityspikes_melee"]);
		self.a_gravityspikes_prev_ammo_clip = undefined;
	}
	else
	{
		self SetWeaponAmmoClip(w_gravityspike, w_gravityspike.clipSize);
	}
	if(isdefined(self.saved_spike_power))
	{
		self GadgetPowerSet(self GadgetGetSlot(w_gravityspike), self.saved_spike_power);
		self.saved_spike_power = undefined;
	}
	else
	{
		self GadgetPowerSet(self GadgetGetSlot(w_gravityspike), 100);
	}
	self.gravity_trap_unitrigger_stub = undefined;
	self thread weapon_drop_watcher();
	self thread weapon_change_watcher();
}

/*
	Name: reset_after_bleeding_out
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x1000
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 166
*/
function reset_after_bleeding_out()
{
	self endon("disconnect");
	w_gravityspike = GetWeapon("hero_gravityspikes_melee");
	if(isdefined(self.b_has_gravityspikes) && self.b_has_gravityspikes)
	{
		util::wait_network_frame();
		self zm_weapons::weapon_give(w_gravityspike, 0, 1);
		self update_gravityspikes_state(2);
	}
	self waittill("bled_out");
	if(self hasweapon(w_gravityspike))
	{
		self.b_has_gravityspikes = 1;
		self.saved_spike_power = self GadgetPowerGet(self GadgetGetSlot(w_gravityspike));
		if(self.saved_spike_power >= 100)
		{
			self.saved_spike_power = undefined;
		}
		self.a_gravityspikes_prev_ammo_clip["hero_gravityspikes_melee"] = self GetWeaponAmmoClip(w_gravityspike);
	}
	if(isdefined(self.gravity_trap_unitrigger_stub))
	{
		zm_unitrigger::unregister_unitrigger(self.gravity_trap_unitrigger_stub);
		self.gravity_trap_unitrigger_stub = undefined;
	}
	self waittill("spawned_player");
	self thread on_connect_func_for_gravityspikes();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: gravityspikes_power_override
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x11A0
	Size: 0x3C0
	Parameters: 2
	Flags: None
	Line Number: 208
*/
function gravityspikes_power_override(e_player, ai_enemy)
{
	if(e_player laststand::player_is_in_laststand())
	{
		return;
	}
	if(ai_enemy.damageWeapon === GetWeapon("hero_gravityspikes_melee"))
	{
		return;
	}
	if(isdefined(e_player.disable_hero_power_charging) && e_player.disable_hero_power_charging)
	{
		return;
	}
	if(isdefined(e_player) && isdefined(e_player.hero_power))
	{
		w_gravityspike = GetWeapon("hero_gravityspikes_melee");
		if(isdefined(ai_enemy.heroweapon_kill_power))
		{
			n_perk_factor = 1;
			if(e_player hasPerk("specialty_overcharge"))
			{
				n_perk_factor = GetDvarFloat("gadgetPowerOverchargePerkScoreFactor");
			}
			if(isdefined(ai_enemy.damageWeapon) && (IsSubStr(ai_enemy.damageWeapon.name, "elemental_bow_demongate") || IsSubStr(ai_enemy.damageWeapon.name, "elemental_bow_run_prison") || IsSubStr(ai_enemy.damageWeapon.name, "elemental_bow_storm") || IsSubStr(ai_enemy.damageWeapon.name, "elemental_bow_wolf_howl")))
			{
				n_perk_factor = 0.25;
			}
			e_player.hero_power = e_player.hero_power + n_perk_factor * ai_enemy.heroweapon_kill_power;
			e_player.hero_power = math::clamp(e_player.hero_power, 0, 100);
			if(e_player.hero_power >= e_player.hero_power_prev)
			{
				e_player GadgetPowerSet(e_player GadgetGetSlot(w_gravityspike), e_player.hero_power);
				e_player clientfield::set_player_uimodel("zmhud.swordEnergy", e_player.hero_power / 100);
				e_player clientfield::increment_uimodel("zmhud.swordChargeUpdate");
				if(e_player.hero_power == 100)
				{
					e_player SetWeaponAmmoClip(w_gravityspike, w_gravityspike.clipSize);
				}
			}
			if(e_player.hero_power >= 100)
			{
				e_player update_gravityspikes_state(2);
				if(!e_player hasweapon(w_gravityspike))
				{
					e_player GiveWeapon(w_gravityspike);
				}
			}
		}
	}
}

/*
	Name: wield_gravityspikes
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x1568
	Size: 0x180
	Parameters: 1
	Flags: None
	Line Number: 270
*/
function wield_gravityspikes(wpn_gravityspikes)
{
	self zm_hero_weapon::default_wield(wpn_gravityspikes);
	if(!(isdefined(self.b_used_spikes) && self.b_used_spikes))
	{
		if(isdefined(self.hintelem))
		{
			self.hintelem setText("");
			self.hintelem destroy();
		}
		if(MakeLocalizedString("ZM_CASTLE_GRAVITYSPIKE_INSTRUCTIONS") == "ZM_CASTLE_GRAVITYSPIKE_INSTRUCTIONS")
		{
			self thread zm_equipment::show_hint_text("Press ^3[{+speed_throw}]^7 for Anti-Gravity Trap\nPress ^3[{+attack}]^7 for Anti-Gravity Slam\nPress ^3[{+lookstick}]^7 for Melee Attack", 3);
		}
		else
		{
			self thread zm_equipment::show_hint_text(&"ZM_CASTLE_GRAVITYSPIKE_INSTRUCTIONS", 3);
		}
		self.b_used_spikes = 1;
	}
	self update_gravityspikes_state(3);
	self thread gravityspikes_attack_watcher(wpn_gravityspikes);
	self thread gravityspikes_stuck_above_zombie_watcher(wpn_gravityspikes);
	self thread gravityspikes_altfire_watcher(wpn_gravityspikes);
	self thread gravityspikes_swipe_watcher(wpn_gravityspikes);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: unwield_gravityspikes
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x16F0
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 309
*/
function unwield_gravityspikes(wpn_gravityspikes)
{
	self zm_hero_weapon::default_unwield(wpn_gravityspikes);
	self notify("gravityspikes_attack_watchers_end");
	if(isdefined(self.b_gravity_trap_spikes_in_ground) && self.b_gravity_trap_spikes_in_ground)
	{
		self.disable_hero_power_charging = 1;
		self thread zm_hero_weapon::continue_draining_hero_weapon(wpn_gravityspikes);
		self thread gravity_trap_loop(self.v_gravity_trap_pos, wpn_gravityspikes);
	}
}

/*
	Name: weapon_drop_watcher
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x1790
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 331
*/
function weapon_drop_watcher()
{
	self endon("disconnect");
	while(1)
	{
		self waittill("weapon_switch_started", w_current);
		if(zm_utility::is_hero_weapon(w_current))
		{
			self SetWeaponAmmoClip(w_current, 0);
		}
	}
}

/*
	Name: weapon_change_watcher
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x1800
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 354
*/
function weapon_change_watcher()
{
	self endon("disconnect");
	while(1)
	{
		self waittill("weapon_change", w_current, w_previous);
		if(zm_utility::is_hero_weapon(w_current))
		{
			if(isdefined(w_previous) && w_previous.inventoryType == "primary")
			{
				self.w_gravityspikes_wpn_prev = w_previous;
			}
			else
			{
				var_86fce9c3 = self getweaponslistprimaries();
				if(var_86fce9c3.size && isdefined(var_86fce9c3[0]))
				{
					self.w_gravityspikes_wpn_prev = var_86fce9c3[0];
				}
				else
				{
					self.w_gravityspikes_wpn_prev = GetWeapon("knife");
				}
			}
		}
	}
}

/*
	Name: gravityspikes_attack_watcher
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x1908
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 392
*/
function gravityspikes_attack_watcher(wpn_gravityspikes)
{
	self endon("gravityspikes_attack_watchers_end");
	self endon("disconnect");
	self endon("bled_out");
	self endon("death");
	self endon("gravity_spike_expired");
	while(1)
	{
		self waittill("weapon_melee_power", weapon);
		if(weapon == wpn_gravityspikes)
		{
			self PlayRumbleOnEntity("talon_spike");
			self thread knockdown_zombies_slam();
			self thread no_damage_gravityspikes_slam();
		}
	}
}

/*
	Name: gravityspikes_stuck_above_zombie_watcher
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x19D8
	Size: 0x4E8
	Parameters: 1
	Flags: None
	Line Number: 421
*/
function gravityspikes_stuck_above_zombie_watcher(wpn_gravityspikes)
{
	self endon("gravityspikes_attack_watchers_end");
	self endon("disconnect");
	self endon("bled_out");
	self endon("death");
	self endon("gravity_spike_expired");
	first_half_traces = 1;
	while(zm_utility::is_player_valid(self))
	{
		if(!self IsSlamming())
		{
			wait(0.05);
			continue;
		}
		while(self IsSlamming() && self GetCurrentWeapon() == wpn_gravityspikes)
		{
			player_angles = self getPlayerAngles();
			forward_vec = AnglesToForward((0, player_angles[1], 0));
			if(forward_vec[0] == 0 && forward_vec[1] == 0 && forward_vec[2] == 0)
			{
				wait(0.05);
				continue;
			}
			forward_right_45_vec = RotatePoint(forward_vec, VectorScale((0, 1, 0), 45));
			forward_left_45_vec = RotatePoint(forward_vec, VectorScale((0, -1, 0), 45));
			right_vec = AnglesToRight(player_angles);
			end_height = -35;
			start_point = self.origin + VectorScale((0, 0, 1), 50);
			end_point = self.origin + (0, 0, end_height);
			end_radius = 30;
			trace_end_points = [];
			if(first_half_traces)
			{
				trace_end_points[0] = end_point + VectorScale(forward_vec, end_radius);
				trace_end_points[1] = end_point + VectorScale(right_vec, end_radius);
				trace_end_points[2] = end_point - VectorScale(right_vec, end_radius);
				first_half_traces = 0;
			}
			else
			{
				trace_end_points[0] = end_point + VectorScale(forward_right_45_vec, end_radius);
				trace_end_points[1] = end_point + VectorScale(forward_left_45_vec, end_radius);
				trace_end_points[2] = end_point - VectorScale(forward_vec, end_radius);
				first_half_traces = 1;
			}
			for(i = 0; i < 3; i++)
			{
				trace = bullettrace(start_point, trace_end_points[i], 1, self);
				/#
					if(GetDvarInt("Dev Block strings are not supported", 0) > 0)
					{
						line(start_point, trace_end_points[i], (1, 1, 1), 1, 0, 60);
						recordLine(start_point, trace_end_points[i], (1, 1, 1), "Dev Block strings are not supported", self);
					}
				#/
				if(trace["fraction"] < 1)
				{
					if(IsActor(trace["entity"]) && trace["entity"].health > 0 && (trace["entity"].archetype == "zombie" || trace["entity"].archetype == "zombie_dog"))
					{
						self thread knockdown_zombies_slam();
						self thread no_damage_gravityspikes_slam();
						wait(1);
						break;
					}
				}
			}
			wait(0.05);
		}
		wait(0.05);
	}
}

/*
	Name: function_79c0582b
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x1EC8
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 504
*/
function function_79c0582b(weapon)
{
	self endon("disconnect");
	wait(0.515);
	self setSpawnWeapon(self.w_gravityspikes_wpn_prev);
	self AllowMelee(1);
	self function_8fa8a0c8(1);
	self zm_weapons::switch_back_primary_weapon(self.w_gravityspikes_wpn_prev, 1);
	self EnableWeaponCycling();
	self SetWeaponAmmoClip(weapon, 0);
}

/*
	Name: gravityspikes_altfire_watcher
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x1F90
	Size: 0x178
	Parameters: 1
	Flags: None
	Line Number: 526
*/
function gravityspikes_altfire_watcher(wpn_gravityspikes)
{
	self endon("gravityspikes_attack_watchers_end");
	self endon("disconnect");
	self endon("bled_out");
	self endon("death");
	self endon("gravity_spike_expired");
	if(level.script == "zm_jcook_house")
	{
		level.var_2ca76a39 = 0;
	}
	for(;;)
	{
		self waittill("weapon_melee_power_left", weapon);
		if(weapon == wpn_gravityspikes && self gravity_spike_position_valid())
		{
			self thread function_79c0582b(weapon);
			self playsound("wpn_talon_spike_plant");
			self function_8fa8a0c8(0);
			self AllowMelee(0);
			self DisableWeaponCycling();
			self thread plant_gravity_trap(wpn_gravityspikes);
			if(level.script == "zm_jcook_house")
			{
				level.var_2ca76a39 = 1;
				wait(1);
				level.var_2ca76a39 = 0;
				return;
			}
		}
	}
}

/*
	Name: gravity_spike_position_valid
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x2110
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 569
*/
function gravity_spike_position_valid()
{
	if(isdefined(level.gravityspike_position_check))
	{
		return self [[level.gravityspike_position_check]]();
	}
	if(IsPointOnNavMesh(self.origin, self))
	{
		return 1;
		return;
	}
	waittillframeend;
}

/*
	Name: chop_actor
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x2160
	Size: 0xF8
	Parameters: 3
	Flags: None
	Line Number: 593
*/
function chop_actor(ai, leftswing, weapon)
{
	if(!isdefined(weapon))
	{
		weapon = level.weaponNone;
	}
	self endon("disconnect");
	if(!isdefined(ai) || !isalive(ai))
	{
		return;
	}
	if(3594 >= ai.health)
	{
		ai.ignoreMelee = 1;
	}
	WaitInQueue(level.ai_spikes_chop_throttle);
	ai DoDamage(3594, self.origin, self, self, "none", "MOD_UNKNOWN", 0, weapon);
	util::wait_network_frame();
}

/*
	Name: chop_zombies
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x2260
	Size: 0x2F0
	Parameters: 3
	Flags: None
	Line Number: 623
*/
function chop_zombies(first_time, leftswing, weapon)
{
	if(!isdefined(weapon))
	{
		weapon = level.weaponNone;
	}
	view_pos = self GetWeaponMuzzlePoint();
	forward_view_angles = self GetWeaponForwardDir();
	zombie_list = GetAITeamArray(level.zombie_team);
	foreach(ai in zombie_list)
	{
		if(!isdefined(ai) || !isalive(ai))
		{
			continue;
		}
		if(first_time)
		{
			ai.chopped = 0;
		}
		else if(isdefined(ai.chopped) && ai.chopped)
		{
			continue;
		}
		test_origin = ai GetCentroid();
		dist_sq = DistanceSquared(view_pos, test_origin);
		dist_to_check = level.spikes_chop_cone_range_sq;
		if(dist_sq > dist_to_check)
		{
			continue;
		}
		normal = VectorNormalize(test_origin - view_pos);
		dot = VectorDot(forward_view_angles, normal);
		if(dot <= 0)
		{
			continue;
		}
		if(0 == ai damageConeTrace(view_pos, self))
		{
			continue;
		}
		ai.chopped = 1;
		if(isdefined(ai.chop_actor_cb))
		{
			self thread [[ai.chop_actor_cb]](ai, self, weapon);
			continue;
		}
		self thread chop_actor(ai, leftswing, weapon);
	}
}

/*
	Name: spikesarc_swipe
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x2558
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 683
*/
function spikesarc_swipe(player)
{
	player endon("gravityspikes_attack_watchers_end");
	player endon("disconnect");
	player endon("bled_out");
	player endon("death");
	player endon("gravity_spike_expired");
	player endon("weapon_change");
	player thread chop_zombies(1, 1, self);
	wait(0.3);
	player thread chop_zombies(0, 1, self);
	wait(0.5);
	player thread chop_zombies(0, 0, self);
}

/*
	Name: gravityspikes_swipe_watcher
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x2628
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 708
*/
function gravityspikes_swipe_watcher(wpn_gravityspikes)
{
	self endon("gravityspikes_attack_watchers_end");
	self endon("disconnect");
	self endon("bled_out");
	self endon("death");
	self endon("gravity_spike_expired");
	while(1)
	{
		self waittill("weapon_melee", weapon);
		weapon thread spikesarc_swipe(self);
	}
}

/*
	Name: gravityspikes_power_update
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x26B8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 732
*/
function gravityspikes_power_update(player)
{
	if(!(isdefined(player.disable_hero_power_charging) && player.disable_hero_power_charging))
	{
		player GadgetPowerSet(0, 100);
		player update_gravityspikes_state(2);
	}
}

/*
	Name: gravityspikes_power_expired
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x2728
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 751
*/
function gravityspikes_power_expired(weapon)
{
	self zm_hero_weapon::default_power_empty(weapon);
	self notify("stop_draining_hero_weapon");
	self notify("gravityspikes_timer_end");
}

/*
	Name: player_invulnerable_during_gravityspike_slam
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x2770
	Size: 0xA8
	Parameters: 11
	Flags: None
	Line Number: 768
*/
function player_invulnerable_during_gravityspike_slam(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex)
{
	if(self.gravityspikes_state === 3 && (self IsSlamming() || (isdefined(self.gravityspikes_slam) && self.gravityspikes_slam)))
	{
		return 0;
	}
	return -1;
}

/*
	Name: no_damage_gravityspikes_slam
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x2820
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 787
*/
function no_damage_gravityspikes_slam()
{
	self.gravityspikes_slam = 1;
	wait(1.5);
	self.gravityspikes_slam = 0;
}

/*
	Name: player_near_gravity_vortex
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x2850
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 804
*/
function player_near_gravity_vortex(v_vortex_origin)
{
	self endon("disconnect");
	self endon("bled_out");
	self endon("death");
	while(isdefined(self.b_gravity_trap_spikes_in_ground) && self.b_gravity_trap_spikes_in_ground && self.gravityspikes_state === 3)
	{
		foreach(e_player in level.activePlayers)
		{
			if(isdefined(e_player) && (!(isdefined(e_player.idgun_vision_on) && e_player.idgun_vision_on)))
			{
				if(Distance(e_player.origin, v_vortex_origin) < float(64))
				{
					e_player thread zombie_vortex::player_vortex_visionset("zm_idgun_vortex");
					if(!(isdefined(e_player.vortex_rumble) && e_player.vortex_rumble))
					{
						self thread player_vortex_rumble(e_player, v_vortex_origin);
					}
				}
			}
		}
		wait(0.05);
	}
}

/*
	Name: player_vortex_rumble
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x29F8
	Size: 0xF8
	Parameters: 2
	Flags: None
	Line Number: 839
*/
function player_vortex_rumble(e_player, v_vortex_origin)
{
	e_player endon("disconnect");
	e_player endon("bled_out");
	e_player endon("death");
	e_player.vortex_rumble = 1;
	e_player clientfield::set_to_player("gravity_trap_rumble", 1);
	while(Distance(e_player.origin, v_vortex_origin) < float(64) && self.gravityspikes_state === 3)
	{
		wait(0.05);
	}
	e_player clientfield::set_to_player("gravity_trap_rumble", 0);
	e_player.vortex_rumble = undefined;
}

/*
	Name: plant_gravity_trap
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x2AF8
	Size: 0x330
	Parameters: 1
	Flags: None
	Line Number: 864
*/
function plant_gravity_trap(wpn_gravityspikes)
{
	self endon("disconnect");
	self endon("bled_out");
	self endon("death");
	v_right = AnglesToRight(self.angles);
	v_spawn_pos_right = self.origin + VectorScale((0, 0, 1), 32);
	v_spawn_pos_left = v_spawn_pos_right;
	a_trace = PhysicsTraceEx(v_spawn_pos_right, v_spawn_pos_right + v_right * 24, VectorScale((-1, -1, -1), 16), VectorScale((1, 1, 1), 16), self);
	v_spawn_pos_right = v_spawn_pos_right + v_right * a_trace["fraction"] * 24;
	a_trace = PhysicsTraceEx(v_spawn_pos_left, v_spawn_pos_left + v_right * -24, VectorScale((-1, -1, -1), 16), VectorScale((1, 1, 1), 16), self);
	v_spawn_pos_left = v_spawn_pos_left + v_right * a_trace["fraction"] * -24;
	v_spawn_pos_right = util::ground_position(v_spawn_pos_right, 1000, 24);
	v_spawn_pos_left = util::ground_position(v_spawn_pos_left, 1000, 24);
	a_v_spawn_pos = Array(v_spawn_pos_right, v_spawn_pos_left);
	self create_gravity_trap_spikes_in_ground(a_v_spawn_pos);
	if(self IsOnGround())
	{
		v_gravity_trap_pos = self.origin + VectorScale((0, 0, 1), 32);
	}
	else
	{
		v_gravity_trap_pos = util::ground_position(self.origin, 1000, length(VectorScale((0, 0, 1), 32)));
	}
	self gravity_trap_fx_on(v_gravity_trap_pos);
	self.b_gravity_trap_spikes_in_ground = 1;
	self.v_gravity_trap_pos = v_gravity_trap_pos;
	self notify("gravity_trap_planted");
	self thread player_near_gravity_vortex(v_gravity_trap_pos);
	self thread destroy_gravity_trap_spikes_in_ground();
	self util::waittill_any("gravity_trap_spikes_retrieved", "disconnect", "bled_out");
	if(isdefined(self))
	{
		self.b_gravity_trap_spikes_in_ground = 0;
		self.disable_hero_power_charging = 0;
		self notify("destroy_ground_spikes");
	}
}

/*
	Name: function_b2848d32
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x2E30
	Size: 0x158
	Parameters: 1
	Flags: None
	Line Number: 913
*/
function function_b2848d32(e_revivee)
{
	if(self laststand::player_is_in_laststand())
	{
		return 0;
	}
	if(!isalive(self))
	{
		return 0;
	}
	if(self.team != e_revivee.team)
	{
		return 0;
	}
	if(isdefined(self.is_zombie) && self.is_zombie)
	{
		return 0;
	}
	if(isdefined(level.can_revive) && ![[level.can_revive]](e_revivee))
	{
		return 0;
	}
	if(isdefined(level.can_revive_game_module) && ![[level.can_revive_game_module]](e_revivee))
	{
		return 0;
	}
	if(isdefined(self.is_gravity_trap_fx_on) && self.is_gravity_trap_fx_on)
	{
		n_gravity_trap_radius_sq = 16384;
		v_gravity_trap_origin = self.mdl_gravity_trap_fx_source.origin;
		if(e_revivee check_for_range_and_los(v_gravity_trap_origin, 96, n_gravity_trap_radius_sq))
		{
			e_revivee thread function_9e981bb4();
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_9e981bb4
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x2F90
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 962
*/
function function_9e981bb4()
{
	self notify("hash_9e981bb4");
	self endon("hash_9e981bb4");
	self endon("bled_out");
	self endon("disconnect");
	self waittill("player_revived", e_reviver);
	wait(0.2);
	if(isdefined(self.var_b76283a))
	{
		foreach(perk in self.var_b76283a)
		{
			if(!self hasPerk(perk))
			{
				self zm_perks::give_perk(perk, 0);
			}
		}
		self.var_b76283a = undefined;
	}
}

/*
	Name: gravity_trap_loop
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x30B0
	Size: 0x348
	Parameters: 2
	Flags: None
	Line Number: 993
*/
function gravity_trap_loop(v_gravity_trap_pos, wpn_gravityspikes)
{
	self endon("gravity_trap_spikes_retrieved");
	self endon("disconnect");
	self endon("bled_out");
	self endon("death");
	self.is_gravity_trap_fx_on = 1;
	n_gravity_trap_radius_sq = 16384;
	v_gravity_trap_origin = self.mdl_gravity_trap_fx_source.origin;
	var_281ccbc1 = self zm_laststand::register_revive_override(&function_b2848d32);
	while(1)
	{
		if(self check_for_range_and_los(v_gravity_trap_origin, 96, n_gravity_trap_radius_sq))
		{
			if(self laststand::player_is_in_laststand())
			{
				self zm_laststand::auto_revive(self, 1);
			}
		}
		if(self zm_hero_weapon::is_hero_weapon_in_use() && self.hero_power > 0)
		{
			a_zombies = GetAITeamArray(level.zombie_team);
			a_zombies = Array::filter(a_zombies, 0, &gravityspikes_target_filtering);
			Array::thread_all(a_zombies, &gravity_trap_check, self);
		}
		else if(self.is_gravity_trap_fx_on)
		{
			if(isdefined(var_281ccbc1))
			{
				self zm_laststand::deregister_revive_override(var_281ccbc1);
			}
			self gravity_trap_fx_off();
			self.is_gravity_trap_fx_on = 0;
			self update_gravityspikes_state(4);
			if(level.script == "zm_der_hafen")
			{
				var_2d8f0b24 = GetAISpeciesArray("axis");
				for(i = 0; i < var_2d8f0b24.size; i++)
				{
					if(isdefined(var_2d8f0b24[i].var_2dce8d67) && var_2d8f0b24[i].var_2dce8d67)
					{
						var_2d8f0b24[i].var_76922c5d = 0;
					}
				}
				self.var_2460a553 = 0;
			}
			util::wait_network_frame();
			if(self zm_hero_weapon::is_hero_weapon_in_use())
			{
				self gravityspikes_power_expired(wpn_gravityspikes);
			}
			self thread function_3a6a11a0();
			return;
		}
		wait(0.1);
	}
	return;
	ERROR: Bad function call
}

/*
	Name: gravity_trap_check
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x3400
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 1063
*/
function gravity_trap_check(player)
{
	player endon("gravity_trap_spikes_retrieved");
	player endon("disconnect");
	player endon("bled_out");
	player endon("death");
	/#
		/#
			Assert(isdefined(level.ai_gravity_throttle));
		#/
	#/
	/#
		/#
			Assert(isdefined(player));
		#/
	#/
	n_gravity_trap_radius_sq = 16384;
	v_gravity_trap_origin = player.mdl_gravity_trap_fx_source.origin;
	if(!isdefined(self) || !isalive(self))
	{
		return;
	}
	if(self check_for_range_and_los(v_gravity_trap_origin, 96, n_gravity_trap_radius_sq))
	{
		if(self.in_gravity_trap === 1)
		{
			return;
		}
		self.in_gravity_trap = 1;
		if(level.script == "zm_der_hafen")
		{
			if(isdefined(self.var_2dce8d67) && self.var_2dce8d67)
			{
				self.var_76922c5d = 1;
			}
		}
		WaitInQueue(level.ai_gravity_throttle);
		if(isdefined(self) && isalive(self))
		{
			self zombie_lift(player, v_gravity_trap_origin, 0, randomIntRange(184, 284), VectorScale((0, 0, -1), 24), randomIntRange(64, 128));
		}
	}
}

/*
	Name: create_gravity_trap_spikes_in_ground
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x35F0
	Size: 0x178
	Parameters: 1
	Flags: None
	Line Number: 1117
*/
function create_gravity_trap_spikes_in_ground(a_v_spawn_pos)
{
	if(!isdefined(self.mdl_gravity_trap_spikes))
	{
		self.mdl_gravity_trap_spikes = [];
	}
	for(i = 0; i < a_v_spawn_pos.size; i++)
	{
		if(!isdefined(self.mdl_gravity_trap_spikes[i]))
		{
			self.mdl_gravity_trap_spikes[i] = util::spawn_model("wpn_zmb_dlc1_talon_spike_single_world", a_v_spawn_pos[i]);
		}
		self.mdl_gravity_trap_spikes[i].origin = a_v_spawn_pos[i];
		self.mdl_gravity_trap_spikes[i].angles = self.angles;
		self.mdl_gravity_trap_spikes[i] show();
		wait(0.05);
		self.mdl_gravity_trap_spikes[i] thread gravity_spike_planted_play();
		self.mdl_gravity_trap_spikes[i] clientfield::set("gravity_trap_spike_spark", 1);
		if(isdefined(level.gravity_trap_spike_watcher))
		{
			[[level.gravity_trap_spike_watcher]](self.mdl_gravity_trap_spikes[i]);
		}
	}
	return;
}

/*
	Name: gravity_spike_planted_play
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x3770
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 1153
*/
function gravity_spike_planted_play()
{
	wait(2);
	self thread scene::Play("cin_zm_dlc1_spike_plant_loop", self);
	return;
}

/*
	Name: destroy_gravity_trap_spikes_in_ground
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x37A8
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 1170
*/
function destroy_gravity_trap_spikes_in_ground()
{
	mdl_spike_source = self.mdl_gravity_trap_fx_source;
	mdl_gravity_trap_spikes = self.mdl_gravity_trap_spikes;
	self util::waittill_any("destroy_ground_spikes", "disconnect", "bled_out");
	if(isdefined(mdl_spike_source))
	{
		mdl_spike_source clientfield::set("gravity_trap_location", 0);
		mdl_spike_source ghost();
		if(!isdefined(self))
		{
			mdl_spike_source delete();
		}
	}
	if(!isdefined(mdl_gravity_trap_spikes))
	{
		return;
	}
	for(i = 0; i < mdl_gravity_trap_spikes.size; i++)
	{
		mdl_gravity_trap_spikes[i] thread scene::stop("cin_zm_dlc1_spike_plant_loop");
		mdl_gravity_trap_spikes[i] clientfield::set("gravity_trap_spike_spark", 0);
		mdl_gravity_trap_spikes[i] ghost();
		if(!isdefined(self))
		{
			mdl_gravity_trap_spikes[i] delete();
		}
	}
}

/*
	Name: gravity_trap_fx_on
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x3938
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 1210
*/
function gravity_trap_fx_on(v_spawn_pos)
{
	if(!isdefined(self.mdl_gravity_trap_fx_source))
	{
		self.mdl_gravity_trap_fx_source = util::spawn_model("tag_origin", v_spawn_pos);
	}
	self.mdl_gravity_trap_fx_source.origin = v_spawn_pos;
	self.mdl_gravity_trap_fx_source show();
	wait(0.05);
	self.mdl_gravity_trap_fx_source clientfield::set("gravity_trap_fx", 1);
}

/*
	Name: gravity_trap_fx_off
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x39E0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 1232
*/
function gravity_trap_fx_off()
{
	if(!isdefined(self.mdl_gravity_trap_fx_source))
	{
		return;
	}
	self.mdl_gravity_trap_fx_source clientfield::set("gravity_trap_fx", 0);
	self.mdl_gravity_trap_fx_source clientfield::set("gravity_trap_location", 1);
}

/*
	Name: create_gravity_trap_unitrigger
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x3A48
	Size: 0x130
	Parameters: 2
	Flags: None
	Line Number: 1252
*/
function create_gravity_trap_unitrigger(v_origin, wpn_gravityspikes)
{
	if(isdefined(self.gravity_trap_unitrigger_stub))
	{
		return;
	}
	unitrigger_stub = spawnstruct();
	unitrigger_stub.origin = v_origin;
	unitrigger_stub.script_unitrigger_type = "unitrigger_radius_use";
	unitrigger_stub.cursor_hint = "HINT_NOICON";
	unitrigger_stub.radius = 128;
	unitrigger_stub.require_look_at = 0;
	unitrigger_stub.gravityspike_owner = self;
	unitrigger_stub.wpn_gravityspikes = wpn_gravityspikes;
	self.gravity_trap_unitrigger_stub = unitrigger_stub;
	zm_unitrigger::unitrigger_force_per_player_triggers(unitrigger_stub, 1);
	unitrigger_stub.prompt_and_visibility_func = &gravity_trap_trigger_visibility;
	zm_unitrigger::register_static_unitrigger(unitrigger_stub, &gravity_trap_trigger_think);
}

/*
	Name: gravity_trap_trigger_visibility
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x3B80
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 1282
*/
function gravity_trap_trigger_visibility(player)
{
	return 0;
}

/*
	Name: gravity_trap_trigger_think
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x3B98
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1297
*/
function gravity_trap_trigger_think()
{
	while(1)
	{
		self waittill("trigger", player);
		if(player zm_utility::in_revive_trigger())
		{
			continue;
		}
		if(player.IS_DRINKING > 0)
		{
			continue;
		}
		if(!zm_utility::is_player_valid(self.stub.gravityspike_owner))
		{
			continue;
		}
		level thread gravity_trap_trigger_activate(self.stub, player);
		break;
	}
}

/*
	Name: function_f77d5188
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x3C50
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1329
*/
function function_f77d5188()
{
	zombies = GetAISpeciesArray("all", "all");
	foreach(zombie in zombies)
	{
		if(isdefined(zombie.in_gravity_trap) && zombie.in_gravity_trap)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_3a6a11a0
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x3D28
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1352
*/
function function_3a6a11a0()
{
	self endon("disconnect");
	self endon("bled_out");
	while(function_f77d5188())
	{
		wait(0.01);
	}
	self notify("gravity_trap_spikes_retrieved");
	self playlocalsound("fly_equipment_pickup");
}

/*
	Name: gravity_trap_trigger_activate
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x3D98
	Size: 0x170
	Parameters: 2
	Flags: None
	Line Number: 1374
*/
function gravity_trap_trigger_activate(trig_stub, player)
{
	if(player == trig_stub.gravityspike_owner && isdefined(trig_stub) && isdefined(player))
	{
		player notify("gravity_trap_spikes_retrieved");
		player playsound("fly_talon_pickup");
		if(player.gravityspikes_state == 3)
		{
			player.w_gravityspikes_wpn_prev = player GetCurrentWeapon();
			player GiveWeapon(trig_stub.wpn_gravityspikes);
			player giveMaxAmmo(trig_stub.wpn_gravityspikes);
			player SetWeaponAmmoClip(trig_stub.wpn_gravityspikes, trig_stub.wpn_gravityspikes.clipSize);
			player SwitchToWeapon(trig_stub.wpn_gravityspikes);
		}
		zm_unitrigger::unregister_unitrigger(trig_stub);
		player.gravity_trap_unitrigger_stub = undefined;
	}
}

/*
	Name: update_gravityspikes_state
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x3F10
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 1403
*/
function update_gravityspikes_state(n_gravityspikes_state)
{
	self.gravityspikes_state = n_gravityspikes_state;
}

/*
	Name: update_gravityspikes_energy
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x3F30
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1418
*/
function update_gravityspikes_energy(n_gravityspikes_power)
{
	self.n_gravityspikes_power = n_gravityspikes_power;
	self clientfield::set_player_uimodel("zmhud.swordEnergy", self.n_gravityspikes_power);
}

/*
	Name: check_for_range_and_los
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x3F78
	Size: 0xF8
	Parameters: 3
	Flags: None
	Line Number: 1434
*/
function check_for_range_and_los(v_attack_source, n_allowed_z_diff, n_radius_sq)
{
	if(isalive(self))
	{
		n_z_diff = self.origin[2] - v_attack_source[2];
		if(Abs(n_z_diff) < n_allowed_z_diff)
		{
			if(Distance2DSquared(self.origin, v_attack_source) < n_radius_sq)
			{
				v_offset = VectorScale((0, 0, 1), 50);
				if(BulletTracePassed(self.origin + v_offset, v_attack_source + v_offset, 0, self))
				{
					return 1;
				}
			}
		}
	}
	return 0;
}

/*
	Name: gravityspikes_target_filtering
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x4078
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 1464
*/
function gravityspikes_target_filtering(ai_enemy)
{
	b_callback_result = 1;
	if(isdefined(level.gravityspikes_target_filter_callback))
	{
		b_callback_result = [[level.gravityspikes_target_filter_callback]](ai_enemy);
	}
	return b_callback_result;
}

/*
	Name: zombie_lift
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x40C8
	Size: 0x870
	Parameters: 6
	Flags: None
	Line Number: 1484
*/
function zombie_lift(player, v_attack_source, n_push_away, n_lift_height, v_lift_offset, n_lift_speed)
{
	wpn_gravityspikes = GetWeapon("hero_gravityspikes_melee");
	if(level.script == "zm_der_hafen")
	{
		if(!(isdefined(self.var_2dce8d67) && self.var_2dce8d67))
		{
			player.var_2460a553++;
			player.var_891e144++;
			if(player.var_2460a553 == 15)
			{
				player notify("hash_1cec3f02");
			}
			if(player.var_891e144 >= 50 && level.var_db2d9950 == 1)
			{
				level notify("hash_b46a50a");
				level.var_db2d9950 = 0;
			}
		}
	}
	if(isdefined(self.zombie_lift_override))
	{
		self thread [[self.zombie_lift_override]](player, v_attack_source, n_push_away, n_lift_height, v_lift_offset, n_lift_speed);
		return;
	}
	if(isdefined(self.isdog) && self.isdog || (isdefined(self.ignore_zombie_lift) && self.ignore_zombie_lift))
	{
		self.no_powerups = 1;
		self DoDamage(self.health + 100, self.origin, player, player, undefined, "MOD_UNKNOWN", 0, wpn_gravityspikes);
		self playsound("zmb_talon_electrocute_swt");
	}
	else if(level.script == "zm_der_hafen")
	{
		if(isdefined(self.var_2dce8d67) && self.var_2dce8d67)
		{
			return;
		}
	}
	if(level.n_zombies_lifted_for_ragdoll < 12)
	{
		if(level.script == "zm_der_hafen")
		{
			self.var_78363acf = 1;
		}
		self thread track_lifted_for_ragdoll_count();
		v_away_from_source = VectorNormalize(self.origin - v_attack_source);
		v_away_from_source = v_away_from_source * n_push_away;
		v_away_from_source = (v_away_from_source[0], v_away_from_source[1], n_lift_height);
		a_trace = PhysicsTraceEx(self.origin + VectorScale((0, 0, 1), 32), self.origin + v_away_from_source, VectorScale((-1, -1, -1), 16), VectorScale((1, 1, 1), 16), self);
		v_lift = a_trace["fraction"] * v_away_from_source;
		v_lift = v_lift + v_lift_offset;
		n_lift_time = length(v_lift) / n_lift_speed;
		if(isdefined(self) && (isdefined(self.b_melee_kill) && self.b_melee_kill))
		{
			if(!(isdefined(level.ignore_gravityspikes_ragdoll) && level.ignore_gravityspikes_ragdoll))
			{
				self StartRagdoll();
				self LaunchRagdoll(150 * anglesToUp(self.angles) + (v_away_from_source[0], v_away_from_source[1], 0));
			}
			self clientfield::set("ragdoll_impact_watch", 1);
			self clientfield::set("sparky_zombie_trail_fx", 1);
			util::wait_network_frame();
		}
		else if(isdefined(self) && v_lift[2] > 0 && length(v_lift) > length(v_lift_offset))
		{
			self clientfield::set("sparky_beam_fx", 1);
			self clientfield::set("sparky_zombie_fx", 1);
			self playsound("zmb_talon_electrocute");
			if(isdefined(self.missingLegs) && self.missingLegs)
			{
				self thread scene::Play("cin_zm_dlc1_zombie_crawler_talonspike_a_loop", self);
			}
			else
			{
				self thread scene::Play("cin_zm_dlc1_zombie_talonspike_loop", self);
			}
			self.mdl_trap_mover = util::spawn_model("tag_origin", self.origin, self.angles);
			self thread util::delete_on_death(self.mdl_trap_mover);
			self LinkTo(self.mdl_trap_mover, "tag_origin");
			self.mdl_trap_mover moveto(self.origin + v_lift, n_lift_time, 0, n_lift_time * 0.4);
			self thread zombie_lift_wacky_rotate(n_lift_time, player);
			self thread gravity_trap_notify_watcher(player);
			self waittill("gravity_trap_complete");
			if(isdefined(self))
			{
				self Unlink();
				self scene::stop();
				self StartRagdoll(1);
				self clientfield::set("gravity_slam_down", 1);
				self clientfield::set("sparky_beam_fx", 0);
				self clientfield::set("sparky_zombie_fx", 0);
				self clientfield::set("sparky_zombie_trail_fx", 1);
				self thread corpse_off_navmesh_watcher();
				self clientfield::set("ragdoll_impact_watch", 1);
				v_land_pos = util::ground_position(self.origin, 1000);
				n_fall_dist = Abs(self.origin[2] - v_land_pos[2]);
				n_slam_wait = n_fall_dist / 200 * 0.75;
				if(n_slam_wait > 0)
				{
					wait(n_slam_wait);
				}
			}
		}
		if(isalive(self))
		{
			self zombie_kill_and_gib(player);
			self playsound("zmb_talon_ai_slam");
		}
	}
	else
	{
		self zombie_kill_and_gib(player);
		self playsound("zmb_talon_ai_slam");
		return;
	}
}

/*
	Name: gravity_trap_notify_watcher
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x4940
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 1611
*/
function gravity_trap_notify_watcher(player)
{
	self endon("gravity_trap_complete");
	self thread gravity_trap_timeout_watcher();
	util::waittill_any_ents(self, "death", player, "gravity_trap_spikes_retrieved", player, "gravityspikes_timer_end", player, "disconnect", player, "bled_out");
	self notify("gravity_trap_complete");
}

/*
	Name: gravity_trap_timeout_watcher
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x49D8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1629
*/
function gravity_trap_timeout_watcher()
{
	self endon("gravity_trap_complete");
	self.mdl_trap_mover util::waittill_any_timeout(4, "movedone", "gravity_trap_complete");
	if(isalive(self) && (!(isdefined(self.b_melee_kill) && self.b_melee_kill)))
	{
		wait(RandomFloatRange(0.2, 1));
	}
	self notify("gravity_trap_complete");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: zombie_lift_wacky_rotate
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x4A80
	Size: 0x150
	Parameters: 2
	Flags: None
	Line Number: 1652
*/
function zombie_lift_wacky_rotate(n_lift_time, player)
{
	player endon("gravityspikes_timer_end");
	self endon("death");
	while(1)
	{
		if(randomIntRange(0, 10) < 5)
		{
		}
		else
		{
		}
		negative_x = -1;
		if(randomIntRange(0, 10) < 5)
		{
		}
		else
		{
		}
		negative_z = -1;
		if(n_lift_time > 2)
		{
		}
		else
		{
		}
		self.mdl_trap_mover RotateTo((randomIntRange(90, 180) * negative_x, randomIntRange(-90, 90), randomIntRange(90, 180) * negative_z), 5, n_lift_time);
		self.mdl_trap_mover waittill("rotatedone");
	}
}

/*
	Name: zombie_kill_and_gib
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x4BD8
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 1693
*/
function zombie_kill_and_gib(player)
{
	wpn_gravityspikes = GetWeapon("hero_gravityspikes_melee");
	self.no_powerups = 1;
	self DoDamage(self.health + 100, self.origin, player, player, undefined, "MOD_UNKNOWN", 0, wpn_gravityspikes);
	if(1)
	{
		n_random = RandomInt(100);
		if(n_random >= 20)
		{
			self zombie_utility::gib_random_parts();
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: track_lifted_for_ragdoll_count
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x4CB0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1720
*/
function track_lifted_for_ragdoll_count()
{
	level.n_zombies_lifted_for_ragdoll++;
	self waittill("death");
	level.n_zombies_lifted_for_ragdoll--;
}

/*
	Name: corpse_off_navmesh_watcher
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x4CD8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1737
*/
function corpse_off_navmesh_watcher()
{
	self waittill("actor_corpse", e_corpse);
	v_pos = GetClosestPointOnNavMesh(e_corpse.origin, 256);
	if(!isdefined(v_pos) || e_corpse.origin[2] > v_pos[2] + 64)
	{
		e_corpse thread do_zombie_explode();
	}
}

/*
	Name: do_zombie_explode
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x4D78
	Size: 0x98
	Parameters: 0
	Flags: Private
	Line Number: 1757
*/
function private do_zombie_explode()
{
	util::wait_network_frame();
	if(isdefined(self))
	{
		self zombie_utility::zombie_eye_glow_stop();
		self clientfield::increment("gravity_spike_zombie_explode_fx");
		self ghost();
		self util::delay(0.25, undefined, &zm_utility::self_delete);
		return;
	}
}

/*
	Name: gravity_spike_melee_kill
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x4E18
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 1780
*/
function gravity_spike_melee_kill(v_position, player)
{
	self.b_melee_kill = 1;
	n_gravity_spike_melee_radius_sq = 40000;
	if(self check_for_range_and_los(v_position, 96, n_gravity_spike_melee_radius_sq))
	{
		self zombie_lift(player, v_position, 128, randomIntRange(128, 200), (0, 0, 0), randomIntRange(150, 200));
	}
}

/*
	Name: knockdown_zombies_slam
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x4ED8
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 1800
*/
function knockdown_zombies_slam()
{
	v_forward = AnglesToForward(self getPlayerAngles());
	v_pos = self.origin + VectorScale(v_forward, 24);
	a_ai = GetAITeamArray(level.zombie_team);
	a_ai = Array::filter(a_ai, 0, &gravityspikes_target_filtering);
	if(level.script == "zm_der_hafen")
	{
		var_2d8f0b24 = GetAISpeciesArray("axis");
		for(i = 0; i < var_2d8f0b24.size; i++)
		{
			if(var_2d8f0b24[i].is_avogadro == 1)
			{
				ArrayRemoveValue(a_ai, var_2d8f0b24[i]);
			}
		}
	}
	a_ai_kill_zombies = ArraySortClosest(a_ai, v_pos, a_ai.size, 0, 200);
	Array::thread_all(a_ai_kill_zombies, &gravity_spike_melee_kill, v_pos, self);
	a_ai_slam_zombies = ArraySortClosest(a_ai, v_pos, a_ai.size, 200, 400);
	Array::thread_all(a_ai_slam_zombies, &zombie_slam_direction, v_pos);
	self thread play_slam_fx(v_pos);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: play_slam_fx
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x50F8
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 1837
*/
function play_slam_fx(v_pos)
{
	mdl_fx_pos = util::spawn_model("tag_origin", v_pos, VectorScale((-1, 0, 0), 90));
	wait(0.05);
	mdl_fx_pos clientfield::set("gravity_slam_fx", 1);
	self clientfield::increment_to_player("gravity_slam_player_fx");
	wait(0.05);
	mdl_fx_pos delete();
}

/*
	Name: zombie_slam_direction
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x51B0
	Size: 0x290
	Parameters: 1
	Flags: None
	Line Number: 1857
*/
function zombie_slam_direction(v_position)
{
	self endon("death");
	if(!self.archetype === "zombie")
	{
		return;
	}
	self.KNOCKDOWN = 1;
	v_zombie_to_player = v_position - self.origin;
	v_zombie_to_player_2d = VectorNormalize((v_zombie_to_player[0], v_zombie_to_player[1], 0));
	v_zombie_forward = AnglesToForward(self.angles);
	v_zombie_forward_2d = VectorNormalize((v_zombie_forward[0], v_zombie_forward[1], 0));
	v_zombie_right = AnglesToRight(self.angles);
	v_zombie_right_2d = VectorNormalize((v_zombie_right[0], v_zombie_right[1], 0));
	v_dot = VectorDot(v_zombie_to_player_2d, v_zombie_forward_2d);
	if(v_dot >= 0.5)
	{
		self.knockdown_direction = "front";
		self.getup_direction = "getup_back";
	}
	else if(v_dot < 0.5 && v_dot > -0.5)
	{
		v_dot = VectorDot(v_zombie_to_player_2d, v_zombie_right_2d);
		if(v_dot > 0)
		{
			self.knockdown_direction = "right";
			if(math::cointoss())
			{
				self.getup_direction = "getup_back";
			}
			else
			{
				self.getup_direction = "getup_belly";
			}
		}
		else
		{
			self.knockdown_direction = "left";
			self.getup_direction = "getup_belly";
		}
	}
	else
	{
		self.knockdown_direction = "back";
		self.getup_direction = "getup_belly";
	}
	wait(1);
	self.KNOCKDOWN = 0;
}

/*
	Name: function_81889ac5
	Namespace: zm_weap_gravityspikes
	Checksum: 0x424F4353
	Offset: 0x5448
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 1917
*/
function function_81889ac5()
{
}

