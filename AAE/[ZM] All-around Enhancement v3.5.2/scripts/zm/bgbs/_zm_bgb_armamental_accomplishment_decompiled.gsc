#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_utility;

#namespace namespace_4754119d;

/*
	Name: __init__sytem__
	Namespace: namespace_4754119d
	Checksum: 0x424F4353
	Offset: 0x250
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_armamental_accomplishment", &__init__, undefined, "bgb");
}

/*
	Name: __init__
	Namespace: namespace_4754119d
	Checksum: 0x424F4353
	Offset: 0x290
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	bgb::register("zm_bgb_armamental_accomplishment", "activated", 3, undefined, undefined, &validation, &activation);
}

/*
	Name: validation
	Namespace: namespace_4754119d
	Checksum: 0x424F4353
	Offset: 0x300
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function validation()
{
	var_a0392c55 = self function_3842d2eb();
	if(var_a0392c55.size)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_3842d2eb
	Namespace: namespace_4754119d
	Checksum: 0x424F4353
	Offset: 0x348
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 76
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
	return var_a0392c55;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: activation
	Namespace: namespace_4754119d
	Checksum: 0x424F4353
	Offset: 0x438
	Size: 0x320
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function activation()
{
	var_a0392c55 = self function_3842d2eb();
	self zm_utility::create_streamer_hint(var_a0392c55[0].origin, (0, 0, 0), 10);
	self function_d110e0f1();
	self SetOrigin(var_a0392c55[0].origin);
	self playsound("zmb_bgb_abh_teleport_in");
	playFX(level._effect["teleport_splash"], self.origin);
	playFX(level._effect["teleport_aoe"], self.origin);
	var_a0392c55[0] zm_laststand::auto_revive(self);
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
	self function_5e86506e();
	self zm_utility::clear_streamer_hint();
}

/*
	Name: function_d110e0f1
	Namespace: namespace_4754119d
	Checksum: 0x424F4353
	Offset: 0x760
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 147
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
	Namespace: namespace_4754119d
	Checksum: 0x424F4353
	Offset: 0x910
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 174
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
}

/*
	Name: function_a21de5c3
	Namespace: namespace_4754119d
	Checksum: 0x424F4353
	Offset: 0xAC0
	Size: 0xBC
	Parameters: 1
	Flags: None
	Line Number: 202
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

