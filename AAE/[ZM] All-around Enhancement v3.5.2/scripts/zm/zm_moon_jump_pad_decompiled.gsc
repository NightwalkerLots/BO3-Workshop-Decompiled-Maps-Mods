#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_jump_pad;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zm_moon_gravity;

#namespace zm_moon_jump_pad;

/*
	Name: init
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x620
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 31
*/
function init()
{
	level._uses_jump_pads = 1;
	level moon_jump_pad_overrides();
	level thread moon_biodome_temptation_init();
	level thread moon_jump_pads_low_gravity();
	level thread moon_jump_pads_malfunctions();
	level thread moon_jump_pad_cushion_sound_init();
}

/*
	Name: moon_jump_pad_overrides
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x6B0
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function moon_jump_pad_overrides()
{
	level._jump_pad_override["biodome_logic"] = &moon_jump_pad_progression_end;
	level._jump_pad_override["low_grav"] = &moon_low_gravity_velocity;
	level._jump_pad_override["moon_vertical_jump"] = &moon_vertical_jump;
	level._jump_pad_poi_start_override = &moon_zombie_run_change;
	zm::register_player_damage_callback(&function_4b3d145d);
	level flag::init("pad_allow_anim_change");
	level._jump_pad_anim_change = [];
	level flag::set("pad_allow_anim_change");
	return;
}

/*
	Name: function_4b3d145d
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x7A0
	Size: 0x178
	Parameters: 11
	Flags: None
	Line Number: 74
*/
function function_4b3d145d(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex)
{
	if(sMeansOfDeath === "MOD_FALLING")
	{
		if(isdefined(self._padded) && self._padded)
		{
			e_cushion = ArrayGetClosest(self.origin, level.cushion_sound_triggers);
			if(self istouching(e_cushion))
			{
				return 0;
			}
			e_pad = ArrayGetClosest(self.origin, GetEntArray("trig_jump_pad", "targetname"));
			if(self istouching(e_pad))
			{
				return 0;
			}
		}
		var_7493f254 = 100 / self.maxhealth;
		return Int(iDamage * var_7493f254);
	}
	return iDamage;
}

/*
	Name: moon_jump_pad_progression_end
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x920
	Size: 0x170
	Parameters: 1
	Flags: None
	Line Number: 107
*/
function moon_jump_pad_progression_end(ent_player)
{
	if(isdefined(self.start.script_string))
	{
		ent_player.script_string = self.start.script_string;
	}
	if(isdefined(ent_player.script_string))
	{
		end_spot_array = self.destination;
		end_spot_array = Array::randomize(end_spot_array);
		for(i = 0; i < end_spot_array.size; i++)
		{
			if(isdefined(end_spot_array[i].script_string) && end_spot_array[i].script_string == ent_player.script_string)
			{
				end_point = end_spot_array[i];
				if(RandomInt(100) < 5 && !level._pad_powerup && isdefined(end_point.script_parameters))
				{
					temptation_array = level._biodome_tempt_arrays[end_point.script_parameters];
				}
				return end_point;
			}
		}
	}
}

/*
	Name: moon_low_gravity_velocity
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0xA98
	Size: 0x5B8
	Parameters: 2
	Flags: None
	Line Number: 142
*/
function moon_low_gravity_velocity(ent_start_point, struct_end_point)
{
	end_point = struct_end_point;
	start_point = ent_start_point;
	z_velocity = undefined;
	z_dist = undefined;
	fling_this_way = undefined;
	world_gravity = GetDvarInt("bg_gravity");
	gravity_pulls = -13.3;
	top_velocity_sq = 810000;
	forward_scaling = 1;
	end_spot = struct_end_point.origin;
	if(!(isdefined(self.script_airspeed) && self.script_airspeed))
	{
		rand_end = (RandomFloatRange(0.1, 1.2), RandomFloatRange(0.1, 1.2), 0);
		rand_scale = RandomInt(100);
		rand_spot = VectorScale(rand_end, rand_scale);
		end_spot = struct_end_point.origin + rand_spot;
	}
	pad_dist = Distance(start_point.origin, end_spot);
	z_dist = end_spot[2] - start_point.origin[2];
	jump_velocity = end_spot - start_point.origin;
	if(z_dist > 40 && z_dist < 135)
	{
		z_dist = z_dist * 0.2;
		forward_scaling = 0.8;
		/#
			if(GetDvarInt("Dev Block strings are not supported"))
			{
				z_dist = z_dist * GetDvarFloat("Dev Block strings are not supported");
				forward_scaling = GetDvarFloat("Dev Block strings are not supported");
			}
		#/
	}
	else if(z_dist >= 135)
	{
		z_dist = z_dist * 0.2;
		forward_scaling = 0.7;
		/#
			if(GetDvarInt("Dev Block strings are not supported"))
			{
				z_dist = z_dist * GetDvarFloat("Dev Block strings are not supported");
				forward_scaling = GetDvarFloat("Dev Block strings are not supported");
			}
		#/
	}
	else if(z_dist < 0)
	{
		z_dist = z_dist * 0.1;
		forward_scaling = 0.95;
		/#
			if(GetDvarInt("Dev Block strings are not supported"))
			{
				z_dist = z_dist * GetDvarFloat("Dev Block strings are not supported");
				forward_scaling = GetDvarFloat("Dev Block strings are not supported");
			}
		#/
	}
	N_REDUCTION = 0.035;
	/#
		if(GetDvarFloat("Dev Block strings are not supported") > 0)
		{
			N_REDUCTION = GetDvarFloat("Dev Block strings are not supported");
		}
	#/
	z_velocity = N_REDUCTION * 0.75 * z_dist * world_gravity;
	if(z_velocity < 0)
	{
		z_velocity = z_velocity * -1;
	}
	if(z_dist < 0)
	{
		z_dist = z_dist * -1;
	}
	jump_time = sqrt(2 * pad_dist / world_gravity);
	jump_time_2 = sqrt(z_dist / world_gravity);
	jump_time = jump_time + jump_time_2;
	if(jump_time < 0)
	{
		jump_time = jump_time * -1;
	}
	x = jump_velocity[0] * forward_scaling / jump_time;
	y = jump_velocity[1] * forward_scaling / jump_time;
	z = z_velocity / jump_time;
	fling_this_way = (x, y, z);
	jump_info = [];
	jump_info[0] = fling_this_way;
	jump_info[1] = jump_time;
	return jump_info;
}

/*
	Name: moon_vertical_jump
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x1058
	Size: 0x398
	Parameters: 2
	Flags: None
	Line Number: 243
*/
function moon_vertical_jump(ent_start_point, struct_end_point)
{
	end_point = struct_end_point;
	start_point = ent_start_point;
	z_velocity = undefined;
	z_dist = undefined;
	fling_this_way = undefined;
	world_gravity = GetDvarInt("bg_gravity");
	gravity_pulls = -13.3;
	top_velocity_sq = 810000;
	forward_scaling = 0.9;
	end_random_scale = (RandomFloatRange(-1, 1), RandomFloatRange(-1, 1), 0);
	vel_random = (randomIntRange(2, 6), randomIntRange(2, 6), 0);
	pad_dist = Distance(start_point.origin, end_point.origin);
	jump_velocity = end_point.origin - start_point.origin;
	z_dist = end_point.origin[2] - start_point.origin[2];
	z_dist = z_dist * 1.5;
	z_velocity = 0.0024 * z_dist * world_gravity;
	if(z_velocity < 0)
	{
		z_velocity = z_velocity * -1;
	}
	if(z_dist < 0)
	{
		z_dist = z_dist * -1;
	}
	jump_time = sqrt(2 * pad_dist / world_gravity);
	jump_time_2 = sqrt(2 * z_dist / world_gravity);
	jump_time = jump_time + jump_time_2;
	if(jump_time < 0)
	{
		jump_time = jump_time * -1;
	}
	x = jump_velocity[0] * forward_scaling / jump_time;
	y = jump_velocity[1] * forward_scaling / jump_time;
	z = z_velocity / jump_time;
	fling_vel = (x, y, z) + vel_random;
	fling_this_way = (x, y, z);
	jump_info = [];
	jump_info[0] = fling_this_way;
	jump_info[1] = jump_time;
	return jump_info;
}

/*
	Name: moon_biodome_temptation_init
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x13F8
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 297
*/
function moon_biodome_temptation_init()
{
	level._biodome_tempt_arrays = [];
	level._biodome_tempt_arrays["struct_tempt_left_medium_start"] = struct::get_array("struct_tempt_left_medium_start", "targetname");
	level._biodome_tempt_arrays["struct_tempt_right_medium_start"] = struct::get_array("struct_tempt_right_medium_start", "targetname");
	level._biodome_tempt_arrays["struct_tempt_left_tall"] = struct::get_array("struct_tempt_left_tall", "targetname");
	level._biodome_tempt_arrays["struct_tempt_middle_tall"] = struct::get_array("struct_tempt_middle_tall", "targetname");
	level._biodome_tempt_arrays["struct_tempt_right_tall"] = struct::get_array("struct_tempt_right_tall", "targetname");
	level._biodome_tempt_arrays["struct_tempt_left_medium_end"] = struct::get_array("struct_tempt_left_medium_end", "targetname");
	level._biodome_tempt_arrays["struct_tempt_right_medium_end"] = struct::get_array("struct_tempt_right_medium_end", "targetname");
	level._pad_powerup = 0;
	level flag::wait_till("start_zombie_round_logic");
	level thread moon_biodome_random_pad_temptation();
}

/*
	Name: moon_biodome_random_pad_temptation
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x15A8
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 322
*/
function moon_biodome_random_pad_temptation()
{
	level endon("end_game");
	structs = struct::get_array("struct_biodome_temptation", "script_noteworthy");
	while(1)
	{
		rand = RandomInt(structs.size);
		if(isdefined(level._biodome_tempt_arrays[structs[rand].targetname]))
		{
			tempt_array = level._biodome_tempt_arrays[structs[rand].targetname];
			tempt_array = Array::randomize(tempt_array);
			if(isdefined(level.zones["forest_zone"]) && (isdefined(level.zones["forest_zone"].is_enabled) && level.zones["forest_zone"].is_enabled) && !level._pad_powerup)
			{
				level thread moon_biodome_powerup_temptation(tempt_array);
			}
		}
		wait(randomIntRange(60, 180));
	}
}

/*
	Name: function_b87d2d5d
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x1718
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 352
*/
function function_b87d2d5d()
{
	if(level.round_number < 10)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_7dae7ed9
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x1740
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 371
*/
function function_7dae7ed9()
{
	self endon("powerup_grabbed");
	self endon("death");
	self endon("powerup_reset");
	self zm_powerups::powerup_show(1);
	wait(600);
	for(i = 0; i < 40; i++)
	{
		if(i % 2)
		{
			self zm_powerups::powerup_show(0);
		}
		else
		{
			self zm_powerups::powerup_show(1);
		}
		if(i < 15)
		{
			wait(0.5);
			continue;
		}
		if(i < 25)
		{
			wait(0.25);
			continue;
		}
		wait(0.1);
	}
	self notify("powerup_timedout");
	self zm_powerups::powerup_delete();
}

/*
	Name: moon_biodome_powerup_temptation
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x1858
	Size: 0x4D0
	Parameters: 1
	Flags: None
	Line Number: 414
*/
function moon_biodome_powerup_temptation(struct_array)
{
	powerup = spawn("script_model", struct_array[0].origin);
	level thread moon_biodome_temptation_active(powerup);
	powerup endon("powerup_grabbed");
	powerup endon("powerup_timedout");
	temptation_array = Array("fire_sale", "insta_kill", "nuke", "double_points", "carpenter", "random_weapon");
	randomWeapon = Array("quantum_bomb", "black_hole_bomb", "microwavegundw", "lmg_cqb", "shotgun_fullauto", "ray_gun", "ar_famas", "lmg_rpk", "pistol_m1911_upgraded");
	temptation_index = 0;
	spot_index = 0;
	first_time = 1;
	struct = undefined;
	rotation = 0;
	temptation_array = Array::randomize(temptation_array);
	while(isdefined(powerup))
	{
		if(temptation_array[temptation_index] == "random_weapon" && function_b87d2d5d())
		{
			level.zombie_powerups["random_weapon"].weapon = GetWeapon(randomWeapon[RandomInt(randomWeapon.size)]);
			powerup.weapon = level.zombie_powerups["random_weapon"].weapon;
			powerup UseWeaponModel(powerup.weapon);
		}
		else
		{
			temptation_index++;
			if(temptation_index >= temptation_array.size)
			{
				temptation_index = 0;
			}
		}
		if(temptation_array[temptation_index] == "fire_sale" && (level.zombie_vars["zombie_powerup_fire_sale_on"] == 1 || level.chest_moves == 0))
		{
			temptation_index++;
			if(temptation_index >= temptation_array.size)
			{
				temptation_index = 0;
			}
			powerup zm_powerups::powerup_setup(temptation_array[temptation_index]);
		}
		else
		{
			powerup zm_powerups::powerup_setup(temptation_array[temptation_index]);
		}
		if(powerup.powerup_name == "random_weapon")
		{
			powerup UseWeaponModel(powerup.weapon);
		}
		if(first_time)
		{
			if(powerup.powerup_name == "random_weapon")
			{
				powerup thread function_7dae7ed9();
			}
			else
			{
				powerup thread zm_powerups::powerup_timeout();
			}
			powerup thread zm_powerups::powerup_wobble();
			powerup thread zm_powerups::powerup_grab();
			first_time = 0;
		}
		powerup.origin = struct_array[spot_index].origin;
		if(rotation == 0)
		{
			wait(15);
			rotation++;
		}
		else if(rotation == 1)
		{
			wait(7.5);
			rotation++;
		}
		else if(rotation == 2)
		{
			wait(2.5);
			rotation++;
		}
		else
		{
			wait(1.5);
			rotation++;
		}
		temptation_index++;
		if(temptation_index >= temptation_array.size)
		{
			temptation_index = 0;
		}
		spot_index++;
		if(spot_index >= struct_array.size)
		{
			spot_index = 0;
		}
	}
}

/*
	Name: moon_biodome_temptation_active
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x1D30
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 519
*/
function moon_biodome_temptation_active(ent_powerup)
{
	level._pad_powerup = 1;
	while(isdefined(ent_powerup))
	{
		wait(0.1);
	}
	level._pad_powerup = 0;
}

/*
	Name: moon_jump_pads_low_gravity
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x1D78
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 539
*/
function moon_jump_pads_low_gravity()
{
	level endon("end_game");
	biodome_pads = GetEntArray("biodome_pads", "script_noteworthy");
	biodome_compromised = 0;
	while(!biodome_compromised)
	{
		level waittill("digger_arm_smash", digger, zone);
		if(digger == "biodome" && IsArray(zone) && zone[0] == "forest_zone")
		{
			biodome_compromised = 1;
		}
	}
	for(i = 0; i < biodome_pads.size; i++)
	{
		biodome_pads[i].script_string = "low_grav";
	}
}

/*
	Name: moon_jump_pads_malfunctions
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x1E90
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 568
*/
function moon_jump_pads_malfunctions()
{
	level endon("end_game");
	jump_pad_triggers = GetEntArray("trig_jump_pad", "targetname");
	level flag::wait_till("start_zombie_round_logic");
	wait(2);
	level._dome_malfunction_pads = [];
	for(i = 0; i < jump_pad_triggers.size; i++)
	{
		Pad = jump_pad_triggers[i];
		if(isdefined(Pad.script_label))
		{
			if(Pad.script_label == "pad_labs_low")
			{
				Array::add(level._dome_malfunction_pads, Pad, 0);
				continue;
			}
			if(Pad.script_label == "pad_magic_box_low")
			{
				Array::add(level._dome_malfunction_pads, Pad, 0);
				continue;
			}
			if(Pad.script_label == "pad_teleporter_low")
			{
				Array::add(level._dome_malfunction_pads, Pad, 0);
			}
		}
	}
	/#
		if(level._dome_malfunction_pads.size == 0)
		{
			println("Dev Block strings are not supported");
			return;
		}
	#/
	level flag::wait_till("power_on");
	for(i = 0; i < level._dome_malfunction_pads.size; i++)
	{
		level._dome_malfunction_pads[i] thread moon_pad_malfunction_think();
	}
}

/*
	Name: moon_pad_malfunction_think
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x20A0
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 620
*/
function moon_pad_malfunction_think()
{
	level endon("end_game");
	pad_hook = spawn("script_model", self.origin);
	pad_hook SetModel("tag_origin");
	while(isdefined(self))
	{
		wait(randomIntRange(30, 60));
		/#
			println("Dev Block strings are not supported");
		#/
		pad_hook playsound("zmb_turret_down");
		pad_hook clientfield::set("dome_malfunction_pad", 1);
		util::wait_network_frame();
		self TriggerEnable(0);
		wait(randomIntRange(10, 30));
		pad_hook playsound("zmb_turret_startup");
		pad_hook clientfield::set("dome_malfunction_pad", 0);
		util::wait_network_frame();
		self TriggerEnable(1);
		/#
			println("Dev Block strings are not supported");
		#/
	}
}

/*
	Name: moon_zombie_run_change
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x2248
	Size: 0x258
	Parameters: 1
	Flags: None
	Line Number: 656
*/
function moon_zombie_run_change(ent_poi)
{
	self endon("death");
	if(isdefined(self._pad_chase) && self._pad_chase)
	{
		return;
	}
	if(isdefined(self.animName) && self.animName == "astro_zombie")
	{
		return;
	}
	if(isdefined(self.script_string) && self.script_string == "riser")
	{
		while(isdefined(self.in_the_ground) && self.in_the_ground)
		{
			wait(0.05);
		}
	}
	else if(!(isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area))
	{
		return;
	}
	self._pad_chase = 1;
	low_grav = 0;
	chase_anim = undefined;
	curr_zone = self zm_utility::get_current_zone();
	if(!isdefined(curr_zone) && isdefined(self.zone_name))
	{
		curr_zone = self.zone_name;
	}
	if(isdefined(curr_zone) && isdefined(level.zones[curr_zone].Volumes[0].script_string) && level.zones[curr_zone].Volumes[0].script_string == "lowgravity")
	{
		low_grav = 1;
	}
	self thread zm_moon_gravity::gravity_zombie_update(low_grav);
	if(self.animName == "zombie" || self.animName == "quad_zombie")
	{
		self.var_41a233b3 = self.zombie_move_speed;
		if(low_grav && self.zombie_move_speed != "jump_pad_super_sprint")
		{
			self zombie_utility::set_zombie_run_cycle("jump_pad_super_sprint");
		}
		else
		{
			self zombie_utility::set_zombie_run_cycle("super_sprint");
		}
	}
	self thread moon_stop_running_to_catch();
	return;
}

/*
	Name: jump_pad_store_movement_anim
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x24A8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 717
*/
function jump_pad_store_movement_anim()
{
	self endon("death");
	current_anim = self.run_combatanim;
	anim_keys = getArrayKeys(level.scr_anim[self.animName]);
	for(j = 0; j < anim_keys.size; j++)
	{
		if(level.scr_anim[self.animName][anim_keys[j]] == current_anim)
		{
			return anim_keys[j];
		}
	}
}

/*
	Name: moon_stop_running_to_catch
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x2568
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 741
*/
function moon_stop_running_to_catch()
{
	self endon("death");
	if(!(isdefined(self._pad_chase) && self._pad_chase))
	{
		return;
	}
	if(isdefined(self.animName) && self.animName == "astro_zombie")
	{
		return;
	}
	while(isdefined(self._pad_follow) && self._pad_follow)
	{
		wait(0.05);
	}
	low_grav = 0;
	curr_zone = self zm_utility::get_current_zone();
	if(isdefined(curr_zone) && isdefined(level.zones[curr_zone].Volumes[0].script_string) && level.zones[curr_zone].Volumes[0].script_string == "lowgravity")
	{
		low_grav = 1;
	}
	anim_set = undefined;
	self zombie_utility::set_zombie_run_cycle(self.var_41a233b3);
	self.var_41a233b3 = undefined;
	self._pad_chase = 0;
}

/*
	Name: moon_jump_pad_cushion_sound_init
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x26C0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 778
*/
function moon_jump_pad_cushion_sound_init()
{
	level flag::wait_till("start_zombie_round_logic");
	level.cushion_sound_triggers = GetEntArray("trig_cushion_sound", "targetname");
	if(level.cushion_sound_triggers.size)
	{
		Array::thread_all(level.cushion_sound_triggers, &moon_jump_pad_cushion_play_sound);
	}
}

/*
	Name: moon_jump_pad_cushion_play_sound
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x2750
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 798
*/
function moon_jump_pad_cushion_play_sound()
{
	while(isdefined(self))
	{
		self waittill("trigger", who);
		if(isPlayer(who) && (isdefined(who._padded) && who._padded))
		{
			self playsound("evt_jump_pad_land");
		}
	}
}

/*
	Name: function_d4f0f4fe
	Namespace: zm_moon_jump_pad
	Checksum: 0x424F4353
	Offset: 0x27D8
	Size: 0x64
	Parameters: 0
	Flags: None
	Line Number: 820
*/
function function_d4f0f4fe()
{
	if(isdefined(self.script_int))
	{
		level clientfield::increment("jump_pad_pulse", self.script_int);
	}
	else
	{
		playFX(level._effect["jump_pad_jump"], self.origin);
	}
}

