#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerup_double_points;
#include scripts\zm\_zm_powerup_full_ammo;
#include scripts\zm\_zm_powerup_zombie_blood;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_one_inch_punch;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zm_challenges_tomb;
#include scripts\zm\zm_tomb_vo;

#namespace zm_tomb_challenges;

/*
	Name: void
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x6F8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function void()
{
}

/*
	Name: challenges_init
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x708
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 47
*/
function challenges_init()
{
	level.zombie_init_done = &void;
	level.challenges_add_stats = &tomb_challenges_add_stats;
	zm_spawner::add_custom_zombie_spawn_logic(&bunker_volume_death_check);
	zm_spawner::add_custom_zombie_spawn_logic(&church_volume_death_check);
	level thread function_aa179645();
}

/*
	Name: function_aa179645
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x7A0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function function_aa179645()
{
	level flag::wait_till("initial_blackscreen_passed");
	wait(10);
	for(i = 0; i < level.a_giant_robots.size; i++)
	{
		level.a_giant_robots[i] SetIgnorePauseWorld(0);
	}
	spawner::add_global_spawn_function("axis", &function_6af80722);
	level thread function_cf85c66b();
	level thread function_871342f3();
}

/*
	Name: function_cf85c66b
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x880
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 89
*/
function function_cf85c66b()
{
	flags = Array("generator_under_attack", "three_robot_round");
	for(;;)
	{
		util::waittill_any_array(flags);
		level flag::wait_till_clear_any(flags);
		level.zombie_ai_limit = level.zombie_vars["zombie_max_ai"];
	}
}

/*
	Name: function_871342f3
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x900
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 110
*/
function function_871342f3(var_1b9c2b0c)
{
	flags = Array("end_of_round", "spawn_zombies");
	for(;;)
	{
		level util::waittill_any_array(flags);
		level.zombie_ai_limit = level.zombie_vars["zombie_max_ai"];
	}
}

/*
	Name: tomb_challenges_add_stats
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x978
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 130
*/
function tomb_challenges_add_stats()
{
	n_kills = 115;
	n_zone_caps = 6;
	N_POINTS_SPENT = 30000;
	n_boxes_filled = 4;
	namespace_a528e918::add_stat("zc_headshots", 0, &"ZM_TOMB_CH1", n_kills, undefined, &reward_packed_weapon);
	namespace_a528e918::add_stat("zc_zone_captures", 0, &"ZM_TOMB_CH2", n_zone_caps, undefined, &reward_powerup_max_ammo);
	namespace_a528e918::add_stat("zc_points_spent", 0, &"ZM_TOMB_CH3", N_POINTS_SPENT, undefined, &reward_double_tap, &track_points_spent);
	namespace_a528e918::add_stat("zc_boxes_filled", 1, &"ZM_TOMB_CHT", n_boxes_filled, undefined, &reward_one_inch_punch, &init_box_footprints);
	return;
}

/*
	Name: track_points_spent
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0xAB8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 153
*/
function track_points_spent()
{
	while(1)
	{
		level waittill("spent_points", player, points);
		player namespace_a528e918::increment_stat("zc_points_spent", points);
	}
}

/*
	Name: init_box_footprints
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0xB18
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 172
*/
function init_box_footprints()
{
	level.n_soul_boxes_completed = 0;
	level flag::init("vo_soul_box_intro_played");
	level flag::init("vo_soul_box_continue_played");
	a_boxes = GetEntArray("foot_box", "script_noteworthy");
	Array::thread_all(a_boxes, &box_footprint_think);
}

/*
	Name: function_6af80722
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0xBC0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 191
*/
function function_6af80722()
{
	if(self.archetype == "mechz")
	{
		self waittill("death");
		self footprint_zombie_killed(self.attacker);
		if(isdefined(self.m_claw_damage_trigger))
		{
			self.m_claw_damage_trigger delete();
		}
		wait(3);
		if(isdefined(self.m_claw))
		{
			self.m_claw delete();
		}
	}
}

/*
	Name: box_footprint_think
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0xC68
	Size: 0x760
	Parameters: 0
	Flags: None
	Line Number: 219
*/
function box_footprint_think()
{
	self.n_souls_absorbed = 0;
	self disconnectpaths();
	n_souls_required = 30;
	self thread watch_for_foot_stomp();
	wait(1);
	self clientfield::set("foot_print_box_glow", 1);
	wait(1);
	self clientfield::set("foot_print_box_glow", 0);
	while(self.n_souls_absorbed < n_souls_required)
	{
		self waittill("soul_absorbed", player);
		util::setClientSysState("aae_soulcounter", self.targetname + "," + self.n_souls_absorbed + "," + n_souls_required);
		if(self.n_souls_absorbed == 1)
		{
			self thread scene::Play("p7_fxanim_zm_ori_challenge_box_open_bundle", self);
			self util::delay(1, undefined, &clientfield::set, "foot_print_box_glow", 1);
			if(isdefined(player) && !level flag::get("vo_soul_box_intro_played"))
			{
				player util::delay(1.5, undefined, &zm_tomb_vo::richtofenrespondvoplay, "zm_box_start", 0, "vo_soul_box_intro_played");
			}
		}
		if(self.n_souls_absorbed == floor(n_souls_required / 4))
		{
			if(isdefined(player) && level flag::get("vo_soul_box_intro_played") && !level flag::get("vo_soul_box_continue_played"))
			{
				player thread zm_tomb_vo::richtofenrespondvoplay("zm_box_continue", 1, "vo_soul_box_continue_played");
			}
		}
		if(self.n_souls_absorbed == floor(n_souls_required / 2) || self.n_souls_absorbed == floor(n_souls_required / 1.3))
		{
			if(isdefined(player))
			{
				player zm_audio::create_and_play_dialog("soul_box", "zm_box_encourage");
			}
		}
		if(self.n_souls_absorbed == n_souls_required)
		{
			wait(1);
			self scene::Play("p7_fxanim_zm_ori_challenge_box_close_bundle", self);
		}
	}
	util::setClientSysState("aae_soulcounter", self.targetname + ",0,0");
	self notify("box_finished");
	level.n_soul_boxes_completed++;
	self scene::stop("p7_fxanim_zm_ori_challenge_box_close_bundle", self);
	e_volume = GetEnt(self.target, "targetname");
	e_volume delete();
	self util::delay(0.5, undefined, &clientfield::set, "foot_print_box_glow", 0);
	wait(2);
	self StopAnimScripted();
	v_start_angles = self.angles;
	self MoveZ(30, 1, 1);
	self.angles = v_start_angles;
	playsoundatposition("zmb_footprintbox_disappear", self.origin);
	wait(0.5);
	n_rotations = randomIntRange(5, 7);
	for(i = 0; i < n_rotations; i++)
	{
		v_rotate_angles = v_start_angles + (RandomFloatRange(-10, 10), RandomFloatRange(-10, 10), RandomFloatRange(-10, 10));
		n_rotate_time = RandomFloatRange(0.2, 0.4);
		self RotateTo(v_rotate_angles, n_rotate_time);
		self waittill("rotatedone");
	}
	self RotateTo(v_start_angles, 0.3);
	self MoveZ(-60, 0.5, 0.5);
	self waittill("rotatedone");
	trace_start = self.origin + VectorScale((0, 0, 1), 200);
	trace_end = self.origin;
	fx_trace = bullettrace(trace_start, trace_end, 0, self);
	playFX(level._effect["mech_booster_landing"], fx_trace["position"], AnglesToForward(self.angles), anglesToUp(self.angles));
	self waittill("movedone");
	level namespace_a528e918::increment_stat("zc_boxes_filled");
	if(isdefined(player))
	{
		if(level.n_soul_boxes_completed == 1)
		{
			player thread zm_tomb_vo::richtofenrespondvoplay("zm_box_complete");
		}
		else if(level.n_soul_boxes_completed == 4)
		{
			player thread zm_tomb_vo::richtofenrespondvoplay("zm_box_final_complete", 1);
		}
	}
	self connectpaths();
	self delete();
}

/*
	Name: watch_for_foot_stomp
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x13D0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 318
*/
function watch_for_foot_stomp()
{
	self endon("box_finished");
	while(1)
	{
		self waittill("robot_foot_stomp");
		self scene::Play("p7_fxanim_zm_ori_challenge_box_close_bundle", self);
		self clientfield::set("foot_print_box_glow", 0);
		self.n_souls_absorbed = 0;
		util::setClientSysState("aae_soulcounter", self.targetname + ",0,0");
		wait(5);
		self scene::stop("p7_fxanim_zm_ori_challenge_box_close_bundle", self);
	}
}

/*
	Name: footprint_zombie_killed
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x14A0
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 343
*/
function footprint_zombie_killed(attacker)
{
	a_volumes = GetEntArray("foot_box_volume", "script_noteworthy");
	foreach(e_volume in a_volumes)
	{
		if(self istouching(e_volume) && isdefined(attacker) && isPlayer(attacker))
		{
			self clientfield::set("foot_print_box_fx", 1);
			m_box = GetEnt(e_volume.target, "targetname");
			m_box.n_souls_absorbed++;
			m_box notify("soul_absorbed", attacker);
			return 1;
		}
	}
	return 0;
}

/*
	Name: reward_packed_weapon
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x1610
	Size: 0x358
	Parameters: 2
	Flags: None
	Line Number: 370
*/
function reward_packed_weapon(player, s_stat)
{
	if(!isdefined(s_stat.w_reward))
	{
		a_weapons = Array("ar_stg44", "smg_mp40_1940", "ar_damage");
		var_7e5dd894 = GetWeapon(Array::random(a_weapons));
		s_stat.w_reward = zm_weapons::get_upgrade_weapon(var_7e5dd894);
	}
	m_weapon = spawn("script_model", self.origin);
	m_weapon.angles = self.angles + VectorScale((0, 1, 0), 180);
	m_weapon playsound("zmb_spawn_powerup");
	m_weapon PlayLoopSound("zmb_spawn_powerup_loop", 0.5);
	STR_MODEL = GetWeaponModel(s_stat.w_reward);
	options = player zm_weapons::get_pack_a_punch_weapon_options(s_stat.w_reward);
	m_weapon UseWeaponModel(s_stat.w_reward, STR_MODEL, options);
	util::wait_network_frame();
	if(!namespace_a528e918::reward_rise_and_grab(m_weapon, 50, 2, 2, 10))
	{
		return 0;
	}
	weapon_limit = zm_utility::get_player_weapon_limit(player);
	Primaries = player getweaponslistprimaries();
	if(isdefined(Primaries) && Primaries.size >= weapon_limit)
	{
		player zm_weapons::weapon_give(s_stat.w_reward);
	}
	else
	{
		player zm_weapons::give_build_kit_weapon(s_stat.w_reward);
		player GiveStartAmmo(s_stat.w_reward);
	}
	player SwitchToWeapon(s_stat.w_reward);
	m_weapon StopLoopSound(0.1);
	player playsound("zmb_powerup_grabbed");
	m_weapon delete();
	return 1;
}

/*
	Name: reward_powerup_max_ammo
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x1970
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 418
*/
function reward_powerup_max_ammo(player, s_stat)
{
	return reward_powerup(player, "full_ammo");
}

/*
	Name: reward_powerup_double_points
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x19B0
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 433
*/
function reward_powerup_double_points(player, n_timeout)
{
	return reward_powerup(player, "double_points", n_timeout);
}

/*
	Name: reward_powerup_zombie_blood
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x19F0
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 448
*/
function reward_powerup_zombie_blood(player, n_timeout)
{
	return reward_powerup(player, "zombie_blood", n_timeout);
}

/*
	Name: reward_powerup
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x1A30
	Size: 0x2B0
	Parameters: 3
	Flags: None
	Line Number: 463
*/
function reward_powerup(player, str_powerup, n_timeout)
{
	if(!isdefined(n_timeout))
	{
		n_timeout = 10;
	}
	if(!isdefined(level.zombie_powerups[str_powerup]))
	{
		return;
	}
	s_powerup = level.zombie_powerups[str_powerup];
	m_reward = spawn("script_model", self.origin);
	m_reward.angles = self.angles + VectorScale((0, 1, 0), 180);
	m_reward SetModel(s_powerup.model_name);
	m_reward playsound("zmb_spawn_powerup");
	m_reward PlayLoopSound("zmb_spawn_powerup_loop", 0.5);
	util::wait_network_frame();
	if(!namespace_a528e918::reward_rise_and_grab(m_reward, 50, 2, 2, n_timeout))
	{
		return 0;
	}
	m_reward.hint = s_powerup.hint;
	if(!isdefined(player))
	{
		player = self.player_using;
	}
	switch(str_powerup)
	{
		case "full_ammo":
		{
			level thread zm_powerup_full_ammo::full_ammo_powerup(m_reward, player);
			player thread zm_powerups::powerup_vo("full_ammo");
			break;
		}
		case "double_points":
		{
			level thread zm_powerup_double_points::double_points_powerup(m_reward, player);
			player thread zm_powerups::powerup_vo("double_points");
			break;
		}
		case "zombie_blood":
		{
			level thread namespace_43a18dd5::zombie_blood_powerup(m_reward, player);
			break;
		}
	}
	wait(0.1);
	m_reward StopLoopSound(0.1);
	player playsound("zmb_powerup_grabbed");
	m_reward delete();
	return 1;
}

/*
	Name: reward_double_tap
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x1CE8
	Size: 0x258
	Parameters: 2
	Flags: None
	Line Number: 526
*/
function reward_double_tap(player, s_stat)
{
	m_reward = spawn("script_model", self.origin);
	m_reward.angles = self.angles + VectorScale((0, 1, 0), 180);
	STR_MODEL = GetWeaponModel(GetWeapon("zombie_perk_bottle_doubletap"));
	m_reward SetModel(STR_MODEL);
	m_reward playsound("zmb_spawn_powerup");
	m_reward PlayLoopSound("zmb_spawn_powerup_loop", 0.5);
	util::wait_network_frame();
	if(!namespace_a528e918::reward_rise_and_grab(m_reward, 50, 2, 2, 10))
	{
		return 0;
	}
	if(player hasPerk("specialty_doubletap2") || player zm_perks::has_perk_paused("specialty_doubletap2"))
	{
		m_reward thread bottle_reject_sink(player);
		return 0;
	}
	m_reward StopLoopSound(0.1);
	player playsound("zmb_powerup_grabbed");
	player notify("perk_purchased", "specialty_doubletap2");
	m_reward thread zm_perks::vending_trigger_post_think(player, "specialty_doubletap2");
	m_reward ghost();
	player waittill("burp");
	wait(1.2);
	m_reward delete();
	return 1;
}

/*
	Name: bottle_reject_sink
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x1F48
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 565
*/
function bottle_reject_sink(player)
{
	n_time = 1;
	player playlocalsound(level.zmb_laugh_alias);
	self thread namespace_a528e918::reward_sink(0, 61, n_time);
	wait(n_time);
	self delete();
}

/*
	Name: reward_one_inch_punch
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x1FC8
	Size: 0x1C0
	Parameters: 2
	Flags: None
	Line Number: 584
*/
function reward_one_inch_punch(player, s_stat)
{
	m_reward = spawn("script_model", self.origin);
	m_reward.angles = self.angles + VectorScale((0, 1, 0), 180);
	m_reward SetModel("tag_origin");
	PlayFXOnTag(level._effect["staff_soul"], m_reward, "tag_origin");
	m_reward playsound("zmb_spawn_powerup");
	m_reward PlayLoopSound("zmb_spawn_powerup_loop", 0.5);
	util::wait_network_frame();
	if(!namespace_a528e918::reward_rise_and_grab(m_reward, 50, 2, 2, 10))
	{
		return 0;
	}
	player thread _zm_weap_one_inch_punch::one_inch_punch_melee_attack();
	m_reward StopLoopSound(0.1);
	player playsound("zmb_powerup_grabbed");
	m_reward delete();
	player thread one_inch_punch_watch_for_death(s_stat);
	return 1;
}

/*
	Name: one_inch_punch_watch_for_death
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x2190
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 615
*/
function one_inch_punch_watch_for_death(s_stat)
{
	self endon("disconnect");
	self endon("death");
	self notify("hash_172a6b21");
	self endon("hash_172a6b21");
	while(isdefined(self))
	{
		s_stat.b_reward_claimed = 0;
		s_stat.a_b_player_rewarded[self.characterindex] = 0;
		wait(0.048);
	}
}

/*
	Name: reward_beacon
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x2218
	Size: 0x200
	Parameters: 2
	Flags: None
	Line Number: 639
*/
function reward_beacon(player, s_stat)
{
	m_reward = spawn("script_model", self.origin);
	m_reward.angles = self.angles + VectorScale((0, 1, 0), 180);
	STR_MODEL = GetWeaponModel(level.var_25ef5fab);
	m_reward SetModel(STR_MODEL);
	m_reward playsound("zmb_spawn_powerup");
	m_reward PlayLoopSound("zmb_spawn_powerup_loop", 0.5);
	util::wait_network_frame();
	if(!namespace_a528e918::reward_rise_and_grab(m_reward, 50, 2, 2, 10))
	{
		return 0;
	}
	player zm_weapons::weapon_give(level.var_25ef5fab);
	if(isdefined(level.zombie_include_weapons[level.var_25ef5fab]) & !level.zombie_include_weapons[level.var_25ef5fab])
	{
		level.zombie_include_weapons[level.var_25ef5fab] = 1;
		level.zombie_weapons[level.var_25ef5fab].is_in_box = 1;
	}
	m_reward StopLoopSound(0.1);
	player playsound("zmb_powerup_grabbed");
	m_reward delete();
	return 1;
}

/*
	Name: GetWeaponModel
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x2420
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 674
*/
function GetWeaponModel(weapon)
{
	return weapon.worldmodel;
}

/*
	Name: bunker_volume_death_check
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x2448
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 689
*/
function bunker_volume_death_check()
{
	self waittill("death");
	if(!isdefined(self))
	{
		return;
	}
	volume_name = "oneinchpunch_bunker_volume";
	volume = GetEnt(volume_name, "targetname");
	attacker = self.attacker;
	if(isdefined(attacker) && isPlayer(attacker))
	{
		if(attacker.sq_one_inch_punch_stage == 5 && (self.damageMod == "MOD_MELEE" || self.damageWeapon.name == "tomb_shield"))
		{
			if(self istouching(volume))
			{
				wait(1);
				if(attacker.sq_one_inch_punch_kills >= 20)
				{
					util::setClientSysState("aae_soulcounter", "bunker_tablet,0,0", attacker);
					attacker notify("hash_ae1ec8d3");
				}
				else
				{
					util::setClientSysState("aae_soulcounter", "bunker_tablet," + attacker.sq_one_inch_punch_kills + "," + 20, attacker);
					attacker thread function_e2a848ae("bunker", "bunker_tablet,0,0");
					return;
				}
			}
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: church_volume_death_check
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x2608
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 733
*/
function church_volume_death_check()
{
	self waittill("death");
	if(!isdefined(self))
	{
		return;
	}
	volume_name = "oneinchpunch_church_volume";
	volume = GetEnt(volume_name, "targetname");
	attacker = self.attacker;
	if(isdefined(attacker) && isPlayer(attacker))
	{
		if(attacker.sq_one_inch_punch_stage == 2 && (self.damageMod == "MOD_MELEE" || self.damageWeapon.name == "tomb_shield"))
		{
			if(self istouching(volume))
			{
				wait(1);
				if(attacker.sq_one_inch_punch_stage != 2)
				{
					util::setClientSysState("aae_soulcounter", "church_tablet,0,0", attacker);
					attacker notify("hash_8c27a741");
					return;
				}
				if(attacker.sq_one_inch_punch_kills >= 20)
				{
					util::setClientSysState("aae_soulcounter", "church_tablet,0,0", attacker);
					attacker notify("hash_8c27a741");
				}
				else
				{
					util::setClientSysState("aae_soulcounter", "church_tablet," + attacker.sq_one_inch_punch_kills + "," + 20, attacker);
					attacker thread function_e2a848ae("church", "church_tablet,0,0");
				}
			}
		}
	}
}

/*
	Name: function_e2a848ae
	Namespace: zm_tomb_challenges
	Checksum: 0x424F4353
	Offset: 0x2818
	Size: 0x7C
	Parameters: 2
	Flags: None
	Line Number: 781
*/
function function_e2a848ae(var_712477a9, state)
{
	self endon("disconnect");
	self notify("stop_" + var_712477a9 + "_soulcont");
	self endon("stop_" + var_712477a9 + "_soulcont");
	self waittill("bled_out");
	util::setClientSysState("aae_soulcounter", state, self);
}

