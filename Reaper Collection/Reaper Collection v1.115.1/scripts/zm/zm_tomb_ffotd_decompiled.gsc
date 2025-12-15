#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\math_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_mechz;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_tomb_mech;

#namespace zm_tomb_ffotd;

/*
	Name: main_start
	Namespace: zm_tomb_ffotd
	Checksum: 0x424F4353
	Offset: 0x2E8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 26
*/
function main_start()
{
	level.added_initial_streamer_blackscreen = 2;
	level thread spawned_collision_ffotd();
	level thread function_3fd88dcb();
	level.var_361ee139 = &function_acf1c4da;
	level thread function_81261f5b();
}

/*
	Name: main_end
	Namespace: zm_tomb_ffotd
	Checksum: 0x424F4353
	Offset: 0x360
	Size: 0x2B0
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function main_end()
{
	spawncollision("collision_player_256x256x256", "collider", (11200, -6722, -132), (0, 0, 0));
	spawncollision("collision_player_wall_256x256x10", "collider", (-339.75, 83, 448), (0, 0, 0));
	spawncollision("collision_player_cylinder_32x256", "collider", (167, 404, 442), (0, 0, 0));
	spawncollision("collision_player_wall_256x256x10", "collider", (55, 391, 450), VectorScale((0, 1, 0), 270));
	spawncollision("collision_player_wall_256x256x10", "collider", (70.75, -379, 555), VectorScale((0, 1, 0), 270));
	spawncollision("collision_player_wall_256x256x10", "collider", (-130.25, -356.5, 545.25), VectorScale((0, 1, 0), 180));
	spawncollision("collision_player_wedge_32x256", "collider", (2196.91, -634.245, 224), VectorScale((0, 1, 0), 289.698));
	level.var_144b78ee = spawncollision("collision_player_wedge_32x256", "collider", (-2148.74, 571, 237.5), VectorScale((0, 1, 0), 7.6));
	t_killbrush_1 = spawn("trigger_box", (54.5, -372.5, 130.5), 0, 350, 100, 250);
	t_killbrush_1.angles = (0, 0, 0);
	t_killbrush_1.script_noteworthy = "kill_brush";
	t_killbrush_2 = spawn("trigger_box", (83, 387, 130.5), 0, 300, 100, 250);
	t_killbrush_2.angles = (0, 0, 0);
	t_killbrush_2.script_noteworthy = "kill_brush";
}

/*
	Name: function_3fd88dcb
	Namespace: zm_tomb_ffotd
	Checksum: 0x424F4353
	Offset: 0x618
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function function_3fd88dcb()
{
	level flagsys::wait_till("start_zombie_round_logic");
	level flag::wait_till("activate_zone_farm");
	if(isdefined(level.var_144b78ee))
	{
		level.var_144b78ee delete();
	}
}

/*
	Name: spawned_collision_ffotd
	Namespace: zm_tomb_ffotd
	Checksum: 0x424F4353
	Offset: 0x690
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function spawned_collision_ffotd()
{
	level flagsys::wait_till("start_zombie_round_logic");
}

/*
	Name: function_acf1c4da
	Namespace: zm_tomb_ffotd
	Checksum: 0x424F4353
	Offset: 0x6C0
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 108
*/
function function_acf1c4da(machine)
{
	if(isdefined(level.bgb[machine.var_b287be]) && level.bgb[machine.var_b287be].var_c9e64d65 == "activated")
	{
		if(self.characterindex == 0)
		{
			self zm_audio::create_and_play_dialog("bgb", "buy", self function_af29034());
			return;
		}
		self zm_audio::create_and_play_dialog("bgb", "buy");
	}
	else
	{
		self zm_audio::create_and_play_dialog("bgb", "eat");
	}
}

/*
	Name: function_af29034
	Namespace: zm_tomb_ffotd
	Checksum: 0x424F4353
	Offset: 0x7B8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 135
*/
function function_af29034()
{
	if(!isdefined(self.var_52b965ea) || self.var_52b965ea.size <= 0)
	{
		self.var_52b965ea = Array(0, 1, 2, 3);
		self.var_52b965ea = Array::randomize(self.var_52b965ea);
	}
	var_1b07cebe = self.var_52b965ea[0];
	self.var_52b965ea = Array::remove_index(self.var_52b965ea, 0);
	return var_1b07cebe;
}

/*
	Name: function_81261f5b
	Namespace: zm_tomb_ffotd
	Checksum: 0x424F4353
	Offset: 0x870
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 157
*/
function function_81261f5b()
{
	while(1)
	{
		level waittill("hash_d36a8645");
		s_loc = function_27b9fdd3();
		if(!isdefined(s_loc))
		{
			continue;
		}
		ai = namespace_ef567265::spawn_mechz(s_loc, 1);
		wait(0.05);
		ai clientfield::set("tomb_mech_eye", 1);
		ai thread namespace_baebcb1::mechz_death();
		ai.no_widows_wine = 1;
		level thread namespace_baebcb1::response_to_air_raid_siren_vo();
		ai thread namespace_baebcb1::mechz_hint_vo();
	}
}

/*
	Name: function_27b9fdd3
	Namespace: zm_tomb_ffotd
	Checksum: 0x424F4353
	Offset: 0x970
	Size: 0x23E
	Parameters: 0
	Flags: None
	Line Number: 187
*/
function function_27b9fdd3()
{
	var_fffe05f0 = Array::randomize(level.mechz_locations);
	var_1fae6c0 = [];
	for(i = 0; i < var_fffe05f0.size; i++)
	{
		s_loc = var_fffe05f0[i];
		str_zone = zm_zonemgr::get_zone_from_position(s_loc.origin, 1);
		if(isdefined(str_zone) && level.zones[str_zone].is_occupied)
		{
			var_1fae6c0[var_1fae6c0.size] = s_loc;
		}
	}
	if(var_1fae6c0.size == 0)
	{
		for(i = 0; i < var_fffe05f0.size; i++)
		{
			s_loc = var_fffe05f0[i];
			str_zone = zm_zonemgr::get_zone_from_position(s_loc.origin, 1);
			if(isdefined(str_zone) && level.zones[str_zone].is_active)
			{
				var_1fae6c0[var_1fae6c0.size] = s_loc;
			}
		}
	}
	else if(var_1fae6c0.size > 0)
	{
		return var_1fae6c0[0];
	}
	foreach(s_loc in var_fffe05f0)
	{
		str_zone = zm_zonemgr::get_zone_from_position(s_loc.origin, 0);
		if(isdefined(str_zone))
		{
			return s_loc;
		}
	}
	return var_fffe05f0[0];
}

