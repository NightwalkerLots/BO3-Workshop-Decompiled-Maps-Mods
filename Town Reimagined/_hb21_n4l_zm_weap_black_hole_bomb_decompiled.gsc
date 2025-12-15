#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\animation_state_machine_utility;
#include scripts\shared\ai\systems\behavior_tree_utility;
#include scripts\shared\ai\systems\blackboard;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_utility;

#namespace namespace_9a3dc883;

/*
	Name: __init__sytem__
	Namespace: namespace_9a3dc883
	Checksum: 0x5C5F14D6
	Offset: 0x640
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 31
*/
function autoexec __init__sytem__()
{
	system::register("hb21_n4l_zm_weap_black_hole_bomb", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_9a3dc883
	Checksum: 0x1F67B6E4
	Offset: 0x680
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 46
*/
function __init__()
{
	zm_utility::register_tactical_grenade_for_level("t7_black_hole_bomb");
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombieShouldBeBlackHolePulled", &function_495d5c86);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeAction("zombieShouldBeBlackHolePulledAction", &zombieBlackHoleBombPullStart, &zombieBlackHoleBombPullUpdate, &zombieBlackHoleBombPullEnd);
	clientfield::register("scriptmover", "black_hole_bomb_vortex_fx", 12000, 2, "int");
	clientfield::register("actor", "black_hole_bomb_disintegrate", 12000, 1, "int");
	clientfield::register("actor", "black_hole_bomb_ai_slow_vortex_fx", 12000, 2, "int");
	visionset_mgr::register_info("visionset", "black_hole_bomb_vortex_visionset", 12000, 25, 30, 1, &visionset_mgr::ramp_in_out_thread_per_player, 1);
	visionset_mgr::register_info("overlay", "black_hole_bomb_vortex_blur", 12000, 25, 30, 1, &visionset_mgr::ramp_in_out_thread_per_player, 1);
	callback::on_spawned(&function_56e60bf5);
}

/*
	Name: function_495d5c86
	Namespace: namespace_9a3dc883
	Checksum: 0x54E97884
	Offset: 0x858
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 69
*/
function function_495d5c86(var_7a40f0e0)
{
	return isdefined(var_7a40f0e0.var_a5a04a3d);
}

/*
	Name: zombieBlackHoleBombPullStart
	Namespace: namespace_9a3dc883
	Checksum: 0x4C3A4EA4
	Offset: 0x880
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 84
*/
function zombieBlackHoleBombPullStart(var_7a40f0e0, var_2bb8c91e)
{
	var_7a40f0e0.var_d1f35adc = GetTime();
	var_7a40f0e0.var_7c42cfea = var_7a40f0e0.origin;
	AnimationStateNetworkUtility::RequestState(var_7a40f0e0, var_2bb8c91e);
	zombieUpdateBlackHoleBombPullState(var_7a40f0e0);
	return 5;
}

/*
	Name: zombieUpdateBlackHoleBombPullState
	Namespace: namespace_9a3dc883
	Checksum: 0x48D0F7A0
	Offset: 0x900
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 103
*/
function zombieUpdateBlackHoleBombPullState(var_7a40f0e0)
{
	var_e15afcb = DistanceSquared(var_7a40f0e0.origin, var_7a40f0e0._current_black_hole_bomb_origin);
	if(var_e15afcb < 16384)
	{
		var_7a40f0e0 clientfield::set("black_hole_bomb_ai_slow_vortex_fx", 0);
		var_7a40f0e0 clientfield::set("black_hole_bomb_disintegrate", 1);
		var_7a40f0e0._black_hole_bomb_collapse_death = 1;
	}
	else if(var_e15afcb < 1048576)
	{
		var_7a40f0e0 clientfield::set("black_hole_bomb_ai_slow_vortex_fx", 2);
		blackboard::SetBlackBoardAttribute(var_7a40f0e0, "_zombie_blackholebomb_pull_state", "bhb_pull_fast");
		if(self.var_32e9b0c0 !== "bhb_pull_fast")
		{
			var_7a40f0e0.var_32e9b0c0 = "bhb_pull_fast";
			var_7a40f0e0 ASMRequestSubstate("black_hole_bomb_pull@zombie");
		}
	}
	else if(var_e15afcb < 4227136 && self.var_32e9b0c0 !== "bhb_pull_slow")
	{
		var_7a40f0e0 clientfield::set("black_hole_bomb_ai_slow_vortex_fx", 1);
		blackboard::SetBlackBoardAttribute(var_7a40f0e0, "_zombie_blackholebomb_pull_state", "bhb_pull_slow");
		if(self.var_32e9b0c0 !== "bhb_pull_slow")
		{
			var_7a40f0e0.var_32e9b0c0 = "bhb_pull_slow";
			var_7a40f0e0 ASMRequestSubstate("black_hole_bomb_pull@zombie");
		}
	}
}

/*
	Name: zombieBlackHoleBombPullUpdate
	Namespace: namespace_9a3dc883
	Checksum: 0x855FBDAD
	Offset: 0xB08
	Size: 0x240
	Parameters: 2
	Flags: None
	Line Number: 144
*/
function zombieBlackHoleBombPullUpdate(var_7a40f0e0, var_2bb8c91e)
{
	if(!isdefined(var_7a40f0e0.var_a5a04a3d))
	{
		return 4;
	}
	zombieUpdateBlackHoleBombPullState(var_7a40f0e0);
	if(isdefined(var_7a40f0e0._black_hole_bomb_collapse_death) && var_7a40f0e0._black_hole_bomb_collapse_death)
	{
		var_7a40f0e0 playsound("wpn_black_hole_bomb_device_kill");
		var_7a40f0e0.skipAutoRagdoll = 1;
		var_7a40f0e0 DoDamage(var_7a40f0e0.health + 666, var_7a40f0e0.origin + VectorScale((0, 0, 1), 50), var_7a40f0e0._black_hole_bomb_tosser, undefined, undefined, "MOD_CRUSH");
		return 4;
	}
	if(!(isdefined(var_7a40f0e0.missingLegs) && var_7a40f0e0.missingLegs) && GetTime() - var_7a40f0e0.var_d1f35adc > 1000)
	{
		n_dist_sq = Distance2DSquared(var_7a40f0e0.origin, var_7a40f0e0.var_7c42cfea);
		if(n_dist_sq < 144)
		{
			var_7a40f0e0 SetAvoidanceMask("avoid all");
			var_7a40f0e0.cant_move = 1;
			if(isdefined(var_7a40f0e0.cant_move_cb))
			{
				var_7a40f0e0 [[var_7a40f0e0.cant_move_cb]]();
				continue;
			}
		}
		var_7a40f0e0 SetAvoidanceMask("avoid none");
		var_7a40f0e0.cant_move = 0;
		var_7a40f0e0.var_d1f35adc = GetTime();
		var_7a40f0e0.var_7c42cfea = var_7a40f0e0.origin;
	}
	return 5;
}

/*
	Name: zombieBlackHoleBombPullEnd
	Namespace: namespace_9a3dc883
	Checksum: 0xF25E334
	Offset: 0xD50
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 189
*/
function zombieBlackHoleBombPullEnd(var_7a40f0e0, var_2bb8c91e)
{
	var_7a40f0e0.var_d1f35adc = undefined;
	var_7a40f0e0.var_7c42cfea = undefined;
	return 4;
}

/*
	Name: function_56e60bf5
	Namespace: namespace_9a3dc883
	Checksum: 0x6F3D5C
	Offset: 0xD90
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 206
*/
function function_56e60bf5()
{
	self.var_2ebba328 = undefined;
	self.var_85b0d5e4 = undefined;
	self thread function_d6816b3d();
}

/*
	Name: function_d6816b3d
	Namespace: namespace_9a3dc883
	Checksum: 0x312DBB11
	Offset: 0xDC8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 223
*/
function function_d6816b3d()
{
	self endon("disconnect");
	self notify("hash_cb429d49");
	self endon("hash_cb429d49");
	while(1)
	{
		self waittill("grenade_fire", e_grenade, w_weapon);
		if(w_weapon.name == "t7_black_hole_bomb")
		{
			self thread function_c8181a7(e_grenade);
		}
	}
}

/*
	Name: function_c8181a7
	Namespace: namespace_9a3dc883
	Checksum: 0x123A09A7
	Offset: 0xE60
	Size: 0x270
	Parameters: 1
	Flags: None
	Line Number: 248
*/
function function_c8181a7(e_grenade)
{
	self endon("hash_90d695b6");
	e_grenade thread function_b5ec0a56();
	e_grenade waittill("stationary");
	b_valid_poi = zm_utility::check_point_in_enabled_zone(e_grenade.origin);
	if(!(isdefined(b_valid_poi) && b_valid_poi))
	{
		e_grenade black_hole_bomb_stolen_by_sam();
		return;
	}
	if(isdefined(level._black_hole_bomb_poi_override))
	{
		e_grenade thread [[level._black_hole_bomb_poi_override]]();
	}
	fuse_time = Int(GetWeapon("t7_black_hole_bomb").fusetime / 1000);
	e_grenade.targetname = "gersh_device_poi";
	e_grenade._black_hole_bomb_player = self;
	e_grenade zm_utility::create_zombie_point_of_interest(2056, 15, 0, 1, &black_hole_bomb_initial_attract_func, undefined);
	e_grenade.attract_to_origin = 1;
	e_grenade thread zm_utility::create_zombie_point_of_interest_attractor_positions(4, 10);
	e_grenade thread zm_utility::wait_for_attractor_positions_complete();
	e_grenade ResetMissileDetonationTime(fuse_time);
	e_grenade thread function_286ed34d();
	vortex = function_aeb179dc(e_grenade.origin);
	vortex thread function_5706469();
	wait(fuse_time);
	if(isdefined(e_grenade))
	{
		e_grenade zm_utility::deactivate_zombie_point_of_interest();
	}
	vortex clientfield::set("black_hole_bomb_vortex_fx", 0);
	vortex delete();
}

/*
	Name: function_b5ec0a56
	Namespace: namespace_9a3dc883
	Checksum: 0x9F61DB03
	Offset: 0x10D8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 293
*/
function function_b5ec0a56()
{
	self endon("hash_90d695b6");
	self endon("stationary");
	wait(5);
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(isalive(players[i]))
		{
			players[i] playlocalsound(level.zmb_laugh_alias);
		}
	}
	self notify("hash_90d695b6");
	return;
	waittillframeend;
}

/*
	Name: function_aeb179dc
	Namespace: namespace_9a3dc883
	Checksum: 0x35FEF5B5
	Offset: 0x11A0
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 321
*/
function function_aeb179dc(v_origin, var_d63bccba)
{
	if(!isdefined(var_d63bccba))
	{
		var_d63bccba = 1;
	}
	vortex = spawn("script_model", v_origin + VectorScale((0, 0, 1), 64));
	vortex SetModel("tag_origin");
	vortex clientfield::set("black_hole_bomb_vortex_fx", var_d63bccba);
	vortex.script_noteworthy = "black_hole_bomb_vortex";
	vortex thread function_f6d3d502();
	return vortex;
}

/*
	Name: black_hole_bomb_stolen_by_sam
	Namespace: namespace_9a3dc883
	Checksum: 0x444612E1
	Offset: 0x1270
	Size: 0x290
	Parameters: 0
	Flags: None
	Line Number: 345
*/
function black_hole_bomb_stolen_by_sam()
{
	e_model = spawn("script_model", self.origin);
	e_model.angles = self.angles;
	e_model SetModel(self.model);
	wait(0.05);
	self delete();
	direction = e_model.origin;
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
	PlayFXOnTag(level._effect["grenade_samantha_steal"], e_model, "tag_origin");
	e_model MoveZ(60, 1, 0.25, 0.25);
	e_model vibrate(direction, 1.5, 2.5, 1);
	e_model waittill("movedone");
	e_model delete();
}

/*
	Name: function_f6d3d502
	Namespace: namespace_9a3dc883
	Checksum: 0x39F48406
	Offset: 0x1508
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 387
*/
function function_f6d3d502()
{
	self endon("death");
	while(isdefined(self))
	{
		foreach(e_player in level.activePlayers)
		{
			if(isdefined(e_player))
			{
				if(DistanceSquared(e_player.origin, self.origin) < 262144)
				{
					e_player thread function_2abeee6f();
				}
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_2abeee6f
	Namespace: namespace_9a3dc883
	Checksum: 0xC8F19DAC
	Offset: 0x15F8
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 416
*/
function function_2abeee6f()
{
	self endon("disconnect");
	self.var_2ebba328 = 2.5;
	if(isdefined(self.var_85b0d5e4) && self.var_85b0d5e4 && isdefined(self.var_2ebba328))
	{
		return;
	}
	self.var_85b0d5e4 = 1;
	visionset_mgr::activate("visionset", "black_hole_bomb_vortex_visionset", self, 2, &function_ed4920a, 0.5);
	visionset_mgr::activate("overlay", "black_hole_bomb_vortex_blur", self, 2, &function_ed4920a, 0.5);
	while(self.var_2ebba328 > 0 && !self laststand::player_is_in_laststand() && isalive(self))
	{
		wait(0.05);
		self.var_2ebba328 = self.var_2ebba328 - 0.05;
	}
	self.var_2ebba328 = undefined;
	self notify("hash_573c3d75");
	wait(0.5);
	self.var_85b0d5e4 = undefined;
}

/*
	Name: function_ed4920a
	Namespace: namespace_9a3dc883
	Checksum: 0x27BC5E89
	Offset: 0x1750
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 448
*/
function function_ed4920a()
{
	self endon("death");
	self endon("disconnect");
	self endon("hash_573c3d75");
	while(isdefined(self.var_2ebba328) && self.var_2ebba328 > 0)
	{
		wait(0.05);
	}
}

/*
	Name: black_hole_bomb_initial_attract_func
	Namespace: namespace_9a3dc883
	Checksum: 0xDD7CCEFA
	Offset: 0x17A8
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 469
*/
function black_hole_bomb_initial_attract_func(ent_poi)
{
	self endon("death");
	if(isdefined(self.in_the_ground) && self.in_the_ground)
	{
		return;
	}
	if(isdefined(self.var_cca440e9) && self.var_cca440e9)
	{
		return;
	}
	if(isdefined(self.var_a5a04a3d) && self.var_a5a04a3d)
	{
		return;
	}
	self._distance_to_black_hole = 1410065408;
	self._current_black_hole_bomb_origin = ent_poi.origin;
	self._black_hole_bomb_tosser = ent_poi._black_hole_bomb_player;
	if(isdefined(level._black_hole_attract_override))
	{
		level [[level._black_hole_attract_override]]();
	}
	while(isdefined(ent_poi))
	{
		self._distance_to_black_hole = DistanceSquared(self.origin, self._current_black_hole_bomb_origin);
		if(self._distance_to_black_hole < 4227136)
		{
			self.var_a5a04a3d = 1;
		}
		wait(0.05);
	}
	self thread black_hole_bomb_escaped_zombie_reset();
}

/*
	Name: black_hole_bomb_escaped_zombie_reset
	Namespace: namespace_9a3dc883
	Checksum: 0x8CD10F3D
	Offset: 0x18E0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 513
*/
function black_hole_bomb_escaped_zombie_reset()
{
	self clientfield::set("black_hole_bomb_ai_slow_vortex_fx", 0);
	self._current_black_hole_bomb_origin = undefined;
	self.var_a5a04a3d = undefined;
	self.var_32e9b0c0 = undefined;
}

/*
	Name: function_5706469
	Namespace: namespace_9a3dc883
	Checksum: 0xDC4A2CE4
	Offset: 0x1928
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 531
*/
function function_5706469()
{
	self endon("delete");
	while(isdefined(self))
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(Distance2DSquared(players[i].origin, self.origin) < 16384 && !players[i] IsOnGround())
			{
				players[i] thread function_f726b365(self);
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_f726b365
	Namespace: namespace_9a3dc883
	Checksum: 0x87D0E932
	Offset: 0x1A18
	Size: 0x270
	Parameters: 1
	Flags: None
	Line Number: 558
*/
function function_f726b365(var_1f48c5b9)
{
	if(!BulletTracePassed(self GetEye(), var_1f48c5b9.origin, 0, self))
	{
		return;
	}
	black_hole_teleport_structs = struct::get_array("black_hole_respawn", "script_noteworthy");
	chosen_spot = undefined;
	if(!isdefined(black_hole_teleport_structs) || black_hole_teleport_structs.size == 0)
	{
		return;
	}
	black_hole_teleport_structs = Array::randomize(black_hole_teleport_structs);
	player_zone = self zm_utility::get_current_zone();
	for(i = 0; i < black_hole_teleport_structs.size; i++)
	{
		var_fc4710eb = black_hole_teleport_structs[i] function_c96f7764();
		if(!isdefined(var_fc4710eb))
		{
			continue;
		}
		if(zm_utility::check_point_in_enabled_zone(black_hole_teleport_structs[i].origin) && player_zone != var_fc4710eb)
		{
			chosen_spot = black_hole_teleport_structs[i];
			break;
		}
	}
	if(!isdefined(chosen_spot) && (isdefined(1) && 1))
	{
		for(i = 0; i < black_hole_teleport_structs.size; i++)
		{
			if(zm_utility::check_point_in_enabled_zone(black_hole_teleport_structs[i].origin))
			{
				chosen_spot = black_hole_teleport_structs[i];
				break;
			}
		}
	}
	else if(isdefined(chosen_spot))
	{
		if(isdefined(level.var_1c49aeae))
		{
			self [[level.var_1c49aeae]]();
		}
		playsoundatposition("zmb_black_hole_bomb_teleporter_out", var_1f48c5b9.origin);
		self thread function_6856ce60(chosen_spot);
	}
}

/*
	Name: function_c96f7764
	Namespace: namespace_9a3dc883
	Checksum: 0xE08909DD
	Offset: 0x1C90
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 617
*/
function function_c96f7764()
{
	temp_ent = spawn("script_origin", self.origin + VectorScale((0, 0, 1), 32));
	foreach(zone in level.zones)
	{
		if(!(isdefined(zone.is_enabled) && zone.is_enabled))
		{
			continue;
		}
		foreach(e_volume in zone.Volumes)
		{
			if(temp_ent istouching(e_volume))
			{
				temp_ent delete();
				return e_volume.targetname;
			}
		}
	}
	temp_ent delete();
	return undefined;
}

/*
	Name: function_6856ce60
	Namespace: namespace_9a3dc883
	Checksum: 0x4A97A792
	Offset: 0x1E40
	Size: 0x238
	Parameters: 1
	Flags: None
	Line Number: 649
*/
function function_6856ce60(struct)
{
	self endon("death");
	if(!isdefined(struct))
	{
		return;
	}
	prone_offset = VectorScale((0, 0, 1), 49);
	crouch_offset = VectorScale((0, 0, 1), 20);
	stand_offset = (0, 0, 0);
	destination = undefined;
	if(self GetStance() == "prone")
	{
		destination = struct.origin + prone_offset;
	}
	else if(self GetStance() == "crouch")
	{
		destination = struct.origin + crouch_offset;
		continue;
	}
	destination = struct.origin + stand_offset;
	if(isdefined(level._black_hole_teleport_override))
	{
		level [[level._black_hole_teleport_override]](self);
	}
	thread black_hole_bomb_create_exit_portal(struct.origin);
	self FreezeControls(1);
	self disableOffhandWeapons();
	self DisableWeapons();
	self DontInterpolate();
	self SetOrigin(destination);
	self SetPlayerAngles(struct.angles);
	self EnableOffhandWeapons();
	self enableWeapons();
	self FreezeControls(0);
	return;
	ERROR: Bad function call
}

/*
	Name: black_hole_bomb_create_exit_portal
	Namespace: namespace_9a3dc883
	Checksum: 0x74FC2BEF
	Offset: 0x2080
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 698
*/
function black_hole_bomb_create_exit_portal(v_origin)
{
	vortex = function_aeb179dc(v_origin, 1);
	playsoundatposition("zmb_black_hole_bomb_teleporter_go", v_origin);
	wait(4);
	vortex clientfield::set("black_hole_bomb_vortex_fx", 0);
	vortex delete();
}

/*
	Name: function_286ed34d
	Namespace: namespace_9a3dc883
	Checksum: 0x2CC49113
	Offset: 0x2118
	Size: 0xAC
	Parameters: 0
	Flags: None
	Line Number: 717
*/
function function_286ed34d()
{
	self playsound("wpn_black_hole_bomb_device_exp");
	self PlayLoopSound("wpn_black_hole_bomb_device_loop_close", 1);
	self PlayLoopSound("wpn_black_hole_bomb_device_loop_far", 1);
	v_origin = self.origin;
	self waittill("explode", position);
	playsoundatposition("wpn_black_hole_bomb_device_implode", v_origin);
}

