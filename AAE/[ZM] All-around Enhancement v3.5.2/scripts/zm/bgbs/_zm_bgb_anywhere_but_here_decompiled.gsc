#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_93b7f03;

/*
	Name: __init__sytem__
	Namespace: namespace_93b7f03
	Checksum: 0x424F4353
	Offset: 0x388
	Size: 0x88
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_anywhere_but_here", &__init__, undefined, "bgb");
	level._effect["teleport_splash"] = "zombie/fx_bgb_anywhere_but_here_teleport_zmb";
	level._effect["teleport_aoe"] = "zombie/fx_bgb_anywhere_but_here_teleport_aoe_zmb";
	level._effect["teleport_aoe_kill"] = "zombie/fx_bgb_anywhere_but_here_teleport_aoe_kill_zmb";
}

/*
	Name: __init__
	Namespace: namespace_93b7f03
	Checksum: 0x424F4353
	Offset: 0x418
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	bgb::register("zm_bgb_anywhere_but_here", "activated", 2, undefined, undefined, &validation, &activation);
	bgb::function_4cda71bf("zm_bgb_anywhere_but_here", 1);
}

/*
	Name: function_3842d2eb
	Namespace: namespace_93b7f03
	Checksum: 0x424F4353
	Offset: 0x4A8
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function function_3842d2eb()
{
	var_a0392c55 = [];
	foreach(player in level.activePlayers)
	{
		if(player laststand::player_is_in_laststand() && player != self)
		{
			var_a0392c55[var_a0392c55.size] = player;
		}
	}
	if(var_a0392c55.size)
	{
		var_a0392c55 = Array::randomize(var_a0392c55);
	}
	else
	{
		var_a0392c55 = [];
		foreach(player in level.activePlayers)
		{
			if(player != self)
			{
				var_a0392c55[var_a0392c55.size] = player;
			}
		}
		if(var_a0392c55.size)
		{
			var_a0392c55 = Array::randomize(var_a0392c55);
		}
		else
		{
			return self.origin;
		}
	}
	return var_a0392c55[0];
}

/*
	Name: activation
	Namespace: namespace_93b7f03
	Checksum: 0x424F4353
	Offset: 0x660
	Size: 0x550
	Parameters: 0
	Flags: None
	Line Number: 108
*/
function activation()
{
	zm_utility::increment_ignoreme();
	if(isdefined(level.var_2c12d9a6))
	{
		var_68140f76 = self [[level.var_2c12d9a6]]();
	}
	else
	{
		var_68140f76 = self function_728dfe3();
	}
	self zm_utility::create_streamer_hint(var_68140f76.origin, (0, 0, 0), 10);
	self function_d110e0f1();
	playsoundatposition("zmb_bgb_abh_teleport_out", self.origin);
	if(isdefined(var_68140f76) && var_68140f76.origin)
	{
		self SetOrigin(var_68140f76.origin);
	}
	else
	{
		self SetOrigin(self function_3842d2eb());
	}
	self function_2cb3d5c8();
	var_3c5e6535 = self.origin + VectorScale((0, 0, 1), 60);
	a_ai = GetAITeamArray(level.zombie_team);
	a_closest = [];
	ai_closest = undefined;
	if(a_ai.size)
	{
		a_closest = ArraySortClosest(a_ai, self.origin);
		foreach(ai in a_closest)
		{
			var_9518d12f = ai SightConeTrace(var_3c5e6535, self);
			if(var_9518d12f > 0.2)
			{
				ai_closest = ai;
				break;
			}
		}
		if(isdefined(ai_closest))
		{
			self SetPlayerAngles(VectorToAngles(ai_closest GetCentroid() - var_3c5e6535));
		}
	}
	if(isdefined(level.var_2300a8ad))
	{
		self [[level.var_2300a8ad]]();
	}
	playFX(level._effect["teleport_splash"], self.origin);
	playFX(level._effect["teleport_aoe"], self.origin);
	a_ai = GetAIArray();
	var_aca0d7c7 = ArraySortClosest(a_ai, self.origin, a_ai.size, 0, 200);
	foreach(ai in var_aca0d7c7)
	{
		if(IsActor(ai))
		{
			if(ai.archetype === "zombie")
			{
				playFX(level._effect["teleport_aoe_kill"], ai GetTagOrigin("j_spineupper"));
			}
			else
			{
				playFX(level._effect["teleport_aoe_kill"], ai.origin);
			}
			ai.marked_for_recycle = 1;
			ai.has_been_damaged_by_player = 0;
			ai DoDamage(ai.health + 1000, self.origin, self);
		}
	}
	self playsound("zmb_bgb_abh_teleport_in");
	self function_5e86506e();
	self zm_utility::clear_streamer_hint();
	zm_utility::decrement_ignoreme();
}

/*
	Name: validation
	Namespace: namespace_93b7f03
	Checksum: 0x424F4353
	Offset: 0xBB8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 193
*/
function validation()
{
	if(isdefined(level.var_9aaae7ae))
	{
		return [[level.var_9aaae7ae]]();
	}
	return 1;
}

/*
	Name: function_728dfe3
	Namespace: namespace_93b7f03
	Checksum: 0x424F4353
	Offset: 0xBE8
	Size: 0x420
	Parameters: 0
	Flags: None
	Line Number: 212
*/
function function_728dfe3()
{
	var_a6abcc5d = zm_zonemgr::get_zone_from_position(self.origin + VectorScale((0, 0, 1), 32), 0);
	if(!isdefined(var_a6abcc5d))
	{
		var_a6abcc5d = self.zone_name;
	}
	if(isdefined(var_a6abcc5d))
	{
		var_c30975d2 = level.zones[var_a6abcc5d];
	}
	var_97786609 = struct::get_array("player_respawn_point", "targetname");
	if(!isdefined(var_97786609))
	{
		var_97786609 = [];
	}
	MapName = GetDvarString("mapname");
	ui_mapname = GetDvarString("ui_mapname");
	if(ui_mapname[0] != "z")
	{
		var_97786609 = ArrayCombine(var_97786609, struct::get_array("struct_black_hole_teleport", "targetname"), 0, 0);
		var_97786609 = ArrayCombine(var_97786609, struct::get_array("bhb_teleport_struct", "targetname"), 0, 0);
	}
	var_bbf77908 = [];
	foreach(var_68140f76 in var_97786609)
	{
		respawn_points = undefined;
		if(ui_mapname[0] != "z")
		{
			if(IsArray(var_68140f76))
			{
				var_68140f76 = Array::random(var_68140f76);
			}
		}
		if(zm_utility::is_point_inside_enabled_zone(var_68140f76.origin, var_c30975d2))
		{
			if(!isdefined(var_bbf77908))
			{
				var_bbf77908 = [];
			}
			else if(!IsArray(var_bbf77908))
			{
				var_bbf77908 = Array(var_bbf77908);
			}
			var_bbf77908[var_bbf77908.size] = var_68140f76;
		}
	}
	if(isdefined(level.var_2d4e3645))
	{
		var_bbf77908 = [[level.var_2d4e3645]](var_bbf77908);
	}
	var_59fe7f49 = undefined;
	if(var_bbf77908.size > 0)
	{
		var_59fe7f49 = Array::random(var_bbf77908);
		var_46b9bbf8 = struct::get_array(var_59fe7f49.target, "targetname");
		foreach(var_dbd59eb2 in var_46b9bbf8)
		{
			n_script_int = self.characterindex + 1;
			if(var_dbd59eb2.script_int === n_script_int)
			{
				var_59fe7f49 = var_dbd59eb2;
			}
		}
	}
	return var_59fe7f49;
}

/*
	Name: function_d110e0f1
	Namespace: namespace_93b7f03
	Checksum: 0x424F4353
	Offset: 0x1010
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 290
*/
function function_d110e0f1()
{
	var_81e03bee = self GetPlayerCameraPos();
	player_angles = self getPlayerAngles();
	camera = spawn("script_model", var_81e03bee + AnglesToForward(player_angles) * 10);
	camera thread function_a21de5c3(self);
	camera SetModel("tag_origin");
	camera.angles = player_angles;
	self CameraSetPosition(camera);
	self CameraSetLookAt();
	self CameraActivate(1);
	camera moveto((var_81e03bee[0], var_81e03bee[1], self.origin[2]), 0.25);
	wait(0.25);
	self CameraActivate(0);
	camera delete();
}

/*
	Name: function_5e86506e
	Namespace: namespace_93b7f03
	Checksum: 0x424F4353
	Offset: 0x11C0
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 317
*/
function function_5e86506e()
{
	var_81e03bee = self GetPlayerCameraPos();
	player_angles = self getPlayerAngles();
	camera_origin = var_81e03bee + AnglesToForward(player_angles) * 10;
	camera = spawn("script_model", camera_origin + VectorScale((0, 0, 1), 60));
	camera thread function_a21de5c3(self);
	camera SetModel("tag_origin");
	camera.angles = player_angles;
	self CameraSetPosition(camera);
	self CameraSetLookAt();
	self CameraActivate(1);
	camera moveto(camera_origin, 0.25);
	wait(0.25);
	self CameraActivate(0);
	camera delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a21de5c3
	Namespace: namespace_93b7f03
	Checksum: 0x424F4353
	Offset: 0x1370
	Size: 0xBC
	Parameters: 1
	Flags: None
	Line Number: 347
*/
function function_a21de5c3(player)
{
	self endon("death");
	result = player util::waittill_any_return("disconnect", "bled_out", "death");
	if(isdefined(player) && isdefined(result) && result == "bled_out")
	{
		player CameraActivate(0);
		player enableWeapons();
	}
	self delete();
}

