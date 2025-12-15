#include scripts\codescripts\struct;
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

#namespace namespace_15ff9b9f;

/*
	Name: __init__sytem__
	Namespace: namespace_15ff9b9f
	Checksum: 0x1933589A
	Offset: 0x530
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_beacon", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_15ff9b9f
	Checksum: 0xA7034721
	Offset: 0x570
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function __init__()
{
	level.beacons = [];
	zm_utility::register_tactical_grenade_for_level("t7_zombie_beacon");
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: namespace_15ff9b9f
	Checksum: 0x163EC2F1
	Offset: 0x5C8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function on_player_spawned()
{
	self thread player_handle_beacon();
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: player_handle_beacon
	Namespace: namespace_15ff9b9f
	Checksum: 0x15E01FB7
	Offset: 0x5F0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function player_handle_beacon()
{
	self notify("starting_beacon_watch");
	self endon("disconnect");
	self endon("starting_beacon_watch");
	attract_dist_diff = level.beacon_attract_dist_diff;
	if(!isdefined(attract_dist_diff))
	{
		attract_dist_diff = 45;
	}
	num_attractors = level.num_beacon_attractors;
	if(!isdefined(num_attractors))
	{
		num_attractors = 96;
	}
	max_attract_dist = level.beacon_attract_dist;
	if(!isdefined(max_attract_dist))
	{
		max_attract_dist = 1536;
	}
	while(1)
	{
		grenade = get_thrown_beacon();
		self thread player_throw_beacon(grenade, num_attractors, max_attract_dist, attract_dist_diff);
		wait(0.05);
	}
}

/*
	Name: player_throw_beacon
	Namespace: namespace_15ff9b9f
	Checksum: 0x615F0DB7
	Offset: 0x6F0
	Size: 0x490
	Parameters: 4
	Flags: None
	Line Number: 128
*/
function player_throw_beacon(grenade, num_attractors, max_attract_dist, attract_dist_diff)
{
	self endon("disconnect");
	self endon("starting_beacon_watch");
	if(isdefined(grenade))
	{
		grenade endon("death");
		grenade Hide();
		model = spawn("script_model", grenade.origin);
		model endon("weapon_beacon_timeout");
		model SetModel("wpn_t7_zmb_hd_g_strike_prop");
		model LinkTo(grenade);
		model.angles = grenade.angles;
		model.owner = self;
		grenade thread watch_for_dud(model);
		grenade waittill_not_moving();
		if(isdefined(level.grenade_planted))
		{
			self thread [[level.grenade_planted]](grenade, model);
		}
		if(isdefined(grenade))
		{
			if(isdefined(model))
			{
				if(isdefined(grenade.backlinked) && !grenade.backlinked)
				{
					model Unlink();
					model.origin = grenade.origin;
					model.angles = grenade.angles;
				}
				model Unlink();
				model useanimtree(-1);
				model.animName = "beacon";
				model.origin = grenade.origin;
				model.angles = (0, 0, 0);
				model thread weapon_beacon_anims();
			}
			grenade ResetMissileDetonationTime();
			valid_poi = zm_utility::is_point_inside_enabled_zone(grenade.origin);
			if(isdefined(level.check_valid_poi))
			{
				valid_poi = grenade [[level.check_valid_poi]](valid_poi);
			}
			if(valid_poi)
			{
				grenade zm_utility::create_zombie_point_of_interest(max_attract_dist, num_attractors, 10000);
				grenade.attract_to_origin = 1;
				grenade thread zm_utility::create_zombie_point_of_interest_attractor_positions(4, attract_dist_diff);
				grenade thread zm_utility::wait_for_attractor_positions_complete();
				model thread wait_and_explode(grenade);
				model.time_thrown = GetTime();
				PlayFXOnTag("harry/beacon/fx_beacon_glow", model, "tag_fx");
				playsoundatposition("wpn_beacon_alarm", grenade.origin);
				grenade.e_model = model;
				grenade PlayLoopSound("wpn_beacon_beep");
				model thread start_artillery_launch_normal(grenade);
				level.beacons[level.beacons.size] = grenade;
				continue;
			}
			grenade.script_noteworthy = undefined;
			level thread grenade_stolen_by_sam(grenade, model);
			return;
			continue;
		}
		grenade.script_noteworthy = undefined;
		level thread grenade_stolen_by_sam(grenade, model);
	}
}

/*
	Name: get_thrown_beacon
	Namespace: namespace_15ff9b9f
	Checksum: 0xEFD56BCC
	Offset: 0xB88
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 207
*/
function get_thrown_beacon()
{
	self endon("disconnect");
	self endon("starting_beacon_watch");
	while(1)
	{
		self waittill("grenade_fire", grenade, weapon);
		if(weapon.name == "t7_zombie_beacon")
		{
			grenade.use_grenade_special_long_bookmark = 1;
			grenade.grenade_multiattack_bookmark_count = 1;
			return grenade;
		}
		wait(0.05);
	}
}

/*
	Name: weapon_beacon_anims
	Namespace: namespace_15ff9b9f
	Checksum: 0xDEFBEC67
	Offset: 0xC30
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 234
*/
function weapon_beacon_anims()
{
	self AnimScripted("o_zm_dlc5_zombie_homing_deploy", self.origin, self.angles, "o_zm_dlc5_zombie_homing_deploy");
	wait(getanimlength("o_zm_dlc5_zombie_homing_deploy"));
	self AnimScripted("o_zm_dlc5_zombie_homing_spin", self.origin, self.angles, "o_zm_dlc5_zombie_homing_spin");
}

/*
	Name: wait_and_explode
	Namespace: namespace_15ff9b9f
	Checksum: 0x49F4226
	Offset: 0xCC8
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 251
*/
function wait_and_explode(grenade)
{
	self endon("beacon_missile_launch");
	grenade waittill("robot_artillery_barrage");
	self notify("weapon_beacon_timeout");
	if(isdefined(grenade))
	{
		grenade notify("detonate");
	}
}

/*
	Name: start_artillery_launch_normal
	Namespace: namespace_15ff9b9f
	Checksum: 0xA5965E91
	Offset: 0xD20
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 272
*/
function start_artillery_launch_normal(grenade)
{
	self endon("weapon_beacon_timeout");
	self thread artillery_fx_logic(undefined, grenade);
	self notify("beacon_missile_launch");
	level.weapon_beacon_busy = 1;
	grenade.fuse_reset = 1;
	grenade.fuse_time = 100;
	grenade ResetMissileDetonationTime(100);
}

/*
	Name: artillery_fx_logic
	Namespace: namespace_15ff9b9f
	Checksum: 0x80AE302D
	Offset: 0xDC0
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 293
*/
function artillery_fx_logic(sp_giant_robot, grenade)
{
	wait(0.5);
	wait(3);
	self thread artillery_barrage_logic(grenade);
	wait(1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: artillery_barrage_logic
	Namespace: namespace_15ff9b9f
	Checksum: 0x3A08F53B
	Offset: 0xE10
	Size: 0x240
	Parameters: 2
	Flags: None
	Line Number: 313
*/
function artillery_barrage_logic(grenade, b_ee)
{
	if(!isdefined(b_ee))
	{
		b_ee = 0;
	}
	if(isdefined(b_ee) && b_ee)
	{
		continue;
	}
	a_v_land_offsets = self build_weap_beacon_landing_offsets();
	a_v_start_offsets = self build_weap_beacon_start_offsets();
	n_num_missiles = 5;
	n_clientfield = 1;
	self.a_v_land_spots = [];
	self.a_v_start_spots = [];
	for(i = 0; i < n_num_missiles; i++)
	{
		self.a_v_start_spots[i] = self.origin + a_v_start_offsets[i];
		self.a_v_land_spots[i] = self.origin + a_v_land_offsets[i];
		v_start_trace = self.a_v_start_spots[i] - VectorScale((0, 0, 1), 5000);
		trace = bullettrace(v_start_trace, self.a_v_land_spots[i], 0, undefined);
		self.a_v_land_spots[i] = trace["position"];
		wait(0.05);
	}
	i = 0;
	while(i < n_num_missiles)
	{
		self thread wait_and_do_weapon_beacon_damage(i);
		util::wait_network_frame();
		if(i == 0)
		{
			wait(1);
			i++;
			continue;
			continue;
		}
		wait(0.25);
		i++;
	}
	wait(2);
	grenade delete();
	return;
}

/*
	Name: delay_delete
	Namespace: namespace_15ff9b9f
	Checksum: 0xA91C8331
	Offset: 0x1058
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 368
*/
function delay_delete()
{
	self endon("death");
	wait(1);
	self delete();
}

/*
	Name: wait_and_do_weapon_beacon_damage
	Namespace: namespace_15ff9b9f
	Checksum: 0xA050B3E3
	Offset: 0x1090
	Size: 0x3B8
	Parameters: 1
	Flags: None
	Line Number: 385
*/
function wait_and_do_weapon_beacon_damage(index)
{
	model = spawn("script_model", self.a_v_start_spots[index]);
	model SetModel("tag_origin");
	model moveto(self.a_v_land_spots[index], 3);
	PlayFXOnTag("harry/beacon/fx_beacon_artillery_trail", model, "tag_origin");
	wait(3);
	model thread delay_delete();
	playFX("harry/beacon/fx_beacon_artillery_explode", self.a_v_land_spots[index]);
	playsoundatposition("wpn_beacon_explode", self.a_v_land_spots[index]);
	v_damage_origin = self.a_v_land_spots[index];
	level.n_weap_beacon_zombie_thrown_count = 0;
	a_zombies_to_kill = [];
	a_zombies = GetAISpeciesArray("axis", "all");
	_a969 = a_zombies;
	for(_k969 = getFirstArrayKey(_a969); isdefined(_k969); _k969 = getFirstArrayKey(_a969))
	{
		zombie = _a969[_k969];
		n_distance = Distance(zombie.origin, v_damage_origin);
		if(n_distance <= 200)
		{
			n_damage = math::linear_map(n_distance, 200, 0, 7000, 8000);
			if(n_damage >= zombie.health)
			{
				a_zombies_to_kill[a_zombies_to_kill.size] = zombie;
				break;
				continue;
			}
			zombie DoDamage(n_damage, zombie.origin, self.owner, undefined, 0, "MOD_GRENADE_SPLASH", 0, GetWeapon("t7_zombie_beacon"));
		}
	}
	if(index == 0)
	{
		radiusdamage(self.origin + VectorScale((0, 0, 1), 12), 192, 20, 20, self.owner, "MOD_GRENADE_SPLASH", GetWeapon("t7_zombie_beacon"));
		self ghost();
		self StopAnimScripted(0);
	}
	level thread weap_beacon_zombie_death(self, a_zombies_to_kill);
	self thread weap_beacon_rumble();
}

/*
	Name: weap_beacon_zombie_death
	Namespace: namespace_15ff9b9f
	Checksum: 0x2762958
	Offset: 0x1450
	Size: 0x150
	Parameters: 2
	Flags: None
	Line Number: 436
*/
function weap_beacon_zombie_death(model, a_zombies_to_kill)
{
	n_interval = 0;
	i = 0;
	while(i < a_zombies_to_kill.size)
	{
		zombie = a_zombies_to_kill[i];
		if(!isdefined(zombie) || !isalive(zombie))
		{
			i++;
			continue;
			continue;
		}
		zombie DoDamage(zombie.health, zombie.origin, model.owner, model.owner, 0, "MOD_GRENADE_SPLASH", 0, GetWeapon("t7_zombie_beacon"));
		n_interval++;
		zombie thread weapon_beacon_launch_ragdoll();
		if(n_interval >= 4)
		{
			util::wait_network_frame();
			n_interval = 0;
		}
		i++;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: weapon_beacon_launch_ragdoll
	Namespace: namespace_15ff9b9f
	Checksum: 0x76EF1D66
	Offset: 0x15A8
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 473
*/
function weapon_beacon_launch_ragdoll()
{
	if(isdefined(self.is_mechz) && self.is_mechz)
	{
		return;
	}
	if(isdefined(self.is_giant_robot) && self.is_giant_robot)
	{
		return;
	}
	if(level.n_weap_beacon_zombie_thrown_count >= 5)
	{
		return;
	}
	level.n_weap_beacon_zombie_thrown_count++;
	if(isdefined(level.ragdoll_limit_check) && ![[level.ragdoll_limit_check]]())
	{
		level thread weap_beacon_gib(self);
		return;
	}
	self StartRagdoll();
	n_x = randomIntRange(50, 150);
	n_y = randomIntRange(50, 150);
	if(math::cointoss())
	{
		n_x = n_x * -1;
	}
	if(math::cointoss())
	{
		n_y = n_y * -1;
	}
	v_launch = (n_x, n_y, randomIntRange(75, 250));
	self LaunchRagdoll(v_launch);
}

/*
	Name: weap_beacon_gib
	Namespace: namespace_15ff9b9f
	Checksum: 0xF6F41365
	Offset: 0x1738
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 518
*/
function weap_beacon_gib(ai_zombie)
{
	a_gib_ref = [];
	a_gib_ref[0] = level._ZOMBIE_GIB_PIECE_INDEX_ALL;
	ai_zombie gib("normal", a_gib_ref);
	return;
	~a_gib_ref[0];
}

/*
	Name: weap_beacon_rumble
	Namespace: namespace_15ff9b9f
	Checksum: 0x6CC7F2C2
	Offset: 0x1790
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 537
*/
function weap_beacon_rumble()
{
	a_players = GetPlayers();
	_a1087 = a_players;
	for(_k1087 = getFirstArrayKey(_a1087); isdefined(_k1087); _k1087 = getFirstArrayKey(_a1087))
	{
		player = _a1087[_k1087];
		if(isalive(player) && isdefined(player))
		{
			if(Distance2DSquared(player.origin, self.origin) < 250000)
			{
				player shellshock("explosion", 2.5);
			}
		}
	}
}

/*
	Name: build_weap_beacon_landing_offsets
	Namespace: namespace_15ff9b9f
	Checksum: 0xD5198E15
	Offset: 0x18B0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 564
*/
function build_weap_beacon_landing_offsets()
{
	a_offsets = [];
	a_offsets[0] = (0, 0, 1);
	a_offsets[1] = VectorScale((0, 0, 1), 72);
	a_offsets[2] = VectorScale((0, 0, 1), 72);
	a_offsets[3] = VectorScale((0, 0, 1), 72);
	a_offsets[4] = VectorScale((0, 0, 1), 72);
	return a_offsets;
}

/*
	Name: build_weap_beacon_start_offsets
	Namespace: namespace_15ff9b9f
	Checksum: 0xC77C4DD5
	Offset: 0x1938
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 585
*/
function build_weap_beacon_start_offsets()
{
	a_offsets = [];
	a_offsets[0] = VectorScale((0, 0, 1), 8500);
	a_offsets[1] = (-6500, 6500, 8500);
	a_offsets[2] = (6500, 6500, 8500);
	a_offsets[3] = (6500, -6500, 8500);
	a_offsets[4] = (-6500, -6500, 8500);
	return a_offsets;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: waittill_not_moving
	Namespace: namespace_15ff9b9f
	Checksum: 0xCF04196
	Offset: 0x19D8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 607
*/
function waittill_not_moving()
{
	self endon("death");
	prev_origin = self.origin;
	while(isdefined(self))
	{
		wait(0.05);
		if(prev_origin == self.origin)
		{
			break;
		}
		prev_origin = self.origin;
	}
}

/*
	Name: beacon_cleanup
	Namespace: namespace_15ff9b9f
	Checksum: 0xFE15B28E
	Offset: 0x1A38
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 632
*/
function beacon_cleanup(parent)
{
	while(isdefined(self))
	{
		if(!isdefined(parent))
		{
			if(isdefined(self) && isdefined(self.dud) && self.dud)
			{
				wait(6);
			}
			if(isdefined(self.simulacrum))
			{
				self.simulacrum delete();
			}
			self delete();
			return;
		}
		wait(0.05);
	}
}

/*
	Name: watch_for_dud
	Namespace: namespace_15ff9b9f
	Checksum: 0x7CA483B
	Offset: 0x1AD8
	Size: 0x108
	Parameters: 2
	Flags: None
	Line Number: 663
*/
function watch_for_dud(model, actor)
{
	self endon("death");
	self waittill("grenade_dud");
	model.dud = 1;
	self.monk_scream_vox = 1;
	wait(3);
	if(isdefined(model))
	{
		model delete();
	}
	if(isdefined(actor))
	{
		actor delete();
	}
	if(isdefined(self.damagearea))
	{
		self.damagearea delete();
	}
	if(isdefined(self.e_model))
	{
		self.e_model delete();
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: grenade_stolen_by_sam
	Namespace: namespace_15ff9b9f
	Checksum: 0xE32F9C5A
	Offset: 0x1BE8
	Size: 0x2FC
	Parameters: 3
	Flags: None
	Line Number: 702
*/
function grenade_stolen_by_sam(ent_grenade, ent_model, ent_actor)
{
	if(!isdefined(ent_model))
	{
		return;
	}
	direction = ent_model.origin;
	direction = (direction[1], direction[0], 0);
	if(direction[1] < 0 || (direction[0] > 0 && direction[1] > 0))
	{
		direction = (direction[0], direction[1] * -1, 0);
	}
	else if(direction[0] < 0)
	{
		direction = (direction[0] * -1, direction[1], 0);
	}
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(isalive(players[i]))
		{
			players[i] playlocalsound(level.zmb_laugh_alias);
		}
	}
	PlayFXOnTag(level._effect["grenade_samantha_steal"], ent_model, "tag_origin");
	ent_model MoveZ(60, 1, 0.25, 0.25);
	ent_model vibrate(direction, 1.5, 2.5, 1);
	ent_model waittill("movedone");
	if(isdefined(self.damagearea))
	{
		self.damagearea delete();
	}
	ent_model delete();
	if(isdefined(ent_actor))
	{
		ent_actor delete();
	}
	if(isdefined(ent_grenade))
	{
		if(isdefined(ent_grenade.damagearea))
		{
			ent_grenade.damagearea delete();
		}
		if(isdefined(ent_grenade.e_model))
		{
			ent_grenade.e_model delete();
		}
		if(isdefined(ent_grenade))
		{
			ent_grenade delete();
		}
	}
}

