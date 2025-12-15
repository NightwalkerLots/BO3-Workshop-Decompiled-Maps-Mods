#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ffotd;
#include scripts\zm\zm_zod_margwa;
#include scripts\zm\zm_zod_robot;

#namespace namespace_b65ec48a;

/*
	Name: main_start
	Namespace: namespace_b65ec48a
	Checksum: 0x424F4353
	Offset: 0x4F8
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 26
*/
function main_start()
{
	level.var_42792b8b = 1;
	var_aab32ea1 = struct::get("zone_canal_junction", "script_noteworthy");
	var_eab52f41 = struct::get_array(var_aab32ea1.target, "targetname");
	foreach(var_fae9adb3 in var_eab52f41)
	{
		var_fae9adb3.origin = var_fae9adb3.origin + VectorScale((0, 0, 1), 12);
		switch(var_fae9adb3.script_int)
		{
			case 1:
			{
				var_fae9adb3.origin = var_fae9adb3.origin + VectorScale((-1, 0, 0), 7);
				break;
			}
			case 4:
			{
				var_fae9adb3.origin = var_fae9adb3.origin + VectorScale((1, 0, 0), 5);
				break;
			}
		}
	}
	level thread function_81261f5b();
}

/*
	Name: main_end
	Namespace: namespace_b65ec48a
	Checksum: 0x424F4353
	Offset: 0x6A0
	Size: 0x9D0
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function main_end()
{
	zm::spawn_life_brush((1296, -1916, 660), 128, 128);
	zm::spawn_life_brush((2497, -5395, 444), 256, 400);
	if(!zm_ffotd::optimize_for_splitscreen())
	{
		spawncollision("collision_clip_ramp_128x24", "collider", (4020.93, -4314, 334.084), (0, 90, 105));
		spawncollision("collision_clip_wall_64x64x10", "collider", (4992.73, -2742.56, 464), VectorScale((0, 1, 0), 315));
		spawncollision("collision_utility_wall_128x128x10", "collider", (4640, -4802, 702), VectorScale((0, 1, 0), 315));
		spawncollision("collision_utility_wall_128x128x10", "collider", (4550, -4806, 702), VectorScale((0, 1, 0), 225));
		spawncollision("collision_clip_wall_128x128x10", "collider", (1980, -5356, 390), (0, 0, 0));
		spawncollision("collision_player_wall_256x256x10", "collider", (2216, -4036, 254), VectorScale((0, 1, 0), 270));
		spawncollision("collision_player_32x32x32", "collider", (2494, -2717, -224), (0, 0, 0));
		spawncollision("collision_player_32x32x32", "collider", (2734, -2717, -224), (0, 0, 0));
		spawncollision("collision_player_32x32x32", "collider", (3174, -3141, -288), (0, 0, 0));
		spawncollision("collision_player_32x32x32", "collider", (2062, -3141, -288), (0, 0, 0));
		spawncollision("collision_player_slick_wedge_32x128", "collider", (2602, -4694, -298), (270, 180, 0));
	}
	zm::spawn_life_brush((1896, -8240, 240), 112, 148);
	zm::spawn_life_brush((2624, -2972, -504), 512, 72);
	if(!zm_ffotd::optimize_for_splitscreen())
	{
		spawncollision("collision_clip_ramp_128x24", "collider", (2100.11, -8145.07, 123.5), (353.999, 270, 19.3998));
		spawncollision("collision_clip_wall_256x256x10", "collider", (4496, -4824, 304), VectorScale((0, 1, 0), 45));
		spawncollision("collision_clip_ramp_128x24", "collider", (4433, -4726.27, 306), (270, 27.6804, -177.681));
	}
	var_bb51a7b = spawncollision("collision_clip_32x32x128", "collider", (1455, -3545, 126), VectorScale((0, 1, 0), 45));
	var_bb51a7b disconnectpaths();
	if(!zm_ffotd::optimize_for_splitscreen())
	{
		spawncollision("collision_clip_64x64x64", "collider", (2869, -4814, 260), VectorScale((0, 1, 0), 45));
		spawncollision("collision_clip_32x32x128", "collider", (1260, -8342, 440), VectorScale((0, 1, 0), 45));
		spawncollision("collision_clip_ramp_128x24", "collider", (1256, -8381, 440), (90, 0, 180));
		spawncollision("collision_clip_wall_128x128x10", "collider", (1286, -8300, 415), VectorScale((0, 1, 0), 315));
		spawncollision("collision_clip_wall_256x256x10", "collider", (4817, -3765, 629), VectorScale((0, 1, 0), 315));
		spawncollision("collision_player_wall_256x256x10", "collider", (2268, -5516, 376), VectorScale((0, 1, 0), 315));
	}
	zm::spawn_life_brush((2340, -3892, 256), 36, 128);
	if(!zm_ffotd::optimize_for_splitscreen())
	{
		spawncollision("collision_clip_wedge_32x256", "collider", (4017, -4376, 224), VectorScale((0, 1, 0), 90));
		spawncollision("collision_player_wall_128x128x10", "collider", (1139, -3424, 492), VectorScale((0, 1, 0), 270));
		spawncollision("collision_player_128x128x128", "collider", (2368, -4065, 297), (0, 0, 0));
		spawncollision("collision_player_128x128x128", "collider", (2410, -4065, 297), (0, 0, 0));
		spawncollision("collision_utility_wall_128x128x10", "collider", (3061, -3031, -495), VectorScale((0, 1, 0), 315));
		spawncollision("collision_utility_wall_128x128x10", "collider", (2173, -3033, -495), VectorScale((0, 1, 0), 225));
		spawncollision("collision_utility_wall_128x128x10", "collider", (3156, -5642, 179), VectorScale((0, 1, 0), 315));
	}
	var_970d875d = spawn("script_model", (4423, -3243, 516));
	var_970d875d SetModel("p7_zm_zod_burlesque_wood_column_01");
	var_970d875d.angles = VectorScale((0, 1, 0), 45);
	var_d6e7650f = spawn("script_model", (2158, -5517, 253.5));
	var_d6e7650f SetModel("p7_scaff_plywood_walkway_36x192");
	var_d6e7650f.angles = (0, 0, 0);
	var_83a52ee1 = spawn("script_model", (2604, -3622, -1199));
	var_83a52ee1 SetModel("p7_inf_vista_stalingrad_bldg_04_back");
	var_83a52ee1.angles = VectorScale((0, 1, 0), 270);
	var_cc9c38e8 = spawn("script_model", (2498, -4352.25, 130.75));
	var_cc9c38e8 SetModel("p7_plank_wood_broken_2x4x64_wet");
	var_cc9c38e8.angles = VectorScale((0, 1, 0), 180);
	var_3ea3a823 = spawn("script_model", (2498.25, -4354, 132.75));
	var_3ea3a823 SetModel("p7_plank_wood_broken_sml_2x4x64_wet");
	var_3ea3a823.angles = VectorScale((0, 0, -1), 180);
	var_31363875 = spawncollision("collision_bullet_wall_128x128x10", "collider", (363, -5228.5, 316.5), (0, 0, 0));
	var_31363875 thread function_320b9477();
	level thread function_e7337b94();
	return;
}

/*
	Name: function_320b9477
	Namespace: namespace_b65ec48a
	Checksum: 0x424F4353
	Offset: 0x1078
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 140
*/
function function_320b9477()
{
	level flag::wait_till("connect_start_to_junction");
	self delete();
}

/*
	Name: function_2cba29a8
	Namespace: namespace_b65ec48a
	Checksum: 0x424F4353
	Offset: 0x10C0
	Size: 0xF8
	Parameters: 4
	Flags: None
	Line Number: 156
*/
function function_2cba29a8(zone, pos, radius, height)
{
	if(!isdefined(level.var_e7337b94))
	{
		level.var_e7337b94 = [];
	}
	if(!isdefined(level.var_e7337b94[zone]))
	{
		level.var_e7337b94[zone] = [];
	}
	else if(!IsArray(level.var_e7337b94[zone]))
	{
		level.var_e7337b94[zone] = Array(level.var_e7337b94[zone]);
	}
	level.var_e7337b94[zone][level.var_e7337b94[zone].size] = zm::spawn_kill_brush(pos, radius, height);
}

/*
	Name: function_e7337b94
	Namespace: namespace_b65ec48a
	Checksum: 0x424F4353
	Offset: 0x11C0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 183
*/
function function_e7337b94()
{
	level.var_e7337b94 = [];
	function_2cba29a8("canal", (1031, -1726, 450), 128, 160);
	function_2cba29a8("canal", (818, -1512, 450), 128, 160);
	wait(1);
	level.var_4e5a7cb5 = level.player_out_of_playable_area_monitor_callback;
	level.player_out_of_playable_area_monitor_callback = &player_out_of_playable_area_monitor_callback;
}

/*
	Name: player_out_of_playable_area_monitor_callback
	Namespace: namespace_b65ec48a
	Checksum: 0x424F4353
	Offset: 0x1268
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 203
*/
function player_out_of_playable_area_monitor_callback()
{
	if(isdefined(self.kill_brush))
	{
		train = level.o_zod_train;
		station = train.var_97fef807;
		if(isdefined(self.on_train) && self.on_train || !train flag::get("moving"))
		{
			if(isdefined(station) && isdefined(level.var_e7337b94[station]))
			{
				if(IsInArray(level.var_e7337b94[station], self.kill_brush))
				{
					return 0;
				}
			}
		}
	}
	if(isdefined(level.var_4e5a7cb5))
	{
		return self [[level.var_4e5a7cb5]]();
	}
	return 1;
}

/*
	Name: function_81261f5b
	Namespace: namespace_b65ec48a
	Checksum: 0x424F4353
	Offset: 0x1358
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 237
*/
function function_81261f5b()
{
	while(1)
	{
		var_7566e65f = level util::waittill_any_return("remote_spawn_margwa", "remote_spawn_robot");
		if(var_7566e65f == "remote_spawn_margwa")
		{
			var_225347e1 = namespace_d17e1da0::function_8bcb72e9(1);
		}
		if(var_7566e65f == "remote_spawn_robot")
		{
			var_6c4a101d = struct::get("robot_callbox_" + level.var_1181e09b[0], "script_noteworthy");
			IPrintLnBold(var_6c4a101d.var_d42f02cf);
			level thread namespace_2cce1885::function_99d41d5f(GetPlayers()[0], var_6c4a101d.unitrigger_stub, 3);
		}
	}
}

