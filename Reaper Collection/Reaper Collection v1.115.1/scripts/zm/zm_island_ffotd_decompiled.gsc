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
#include scripts\zm\_zm_ai_spiders;
#include scripts\zm\_zm_ai_thrasher;
#include scripts\zm\_zm_utility;

#namespace namespace_711c2fc8;

/*
	Name: main_start
	Namespace: namespace_711c2fc8
	Checksum: 0x424F4353
	Offset: 0x328
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 26
*/
function main_start()
{
	level thread function_b230ba5a();
	return;
}

/*
	Name: main_end
	Namespace: namespace_711c2fc8
	Checksum: 0x424F4353
	Offset: 0x350
	Size: 0x608
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function main_end()
{
	zm::spawn_life_brush((2870, -179, -480), 200, 360);
	zm::spawn_life_brush((-1964, 1146, 304), 128, 150);
	zm::spawn_life_brush((3070, -2257, -733), 96, 200);
	zm::spawn_life_brush((246, 3506, -424), 156, 128);
	zm::spawn_life_brush((-4573, 1301, -409), 256, 300);
	zm::spawn_life_brush((2190, 800, -213), 32, 128);
	zm::spawn_life_brush((1900, -24, -694), 196, 64);
	spawn("trigger_box", (-1100, 7740, -750), 0, 350, 200, 300) disconnectpaths();
	spawncollision("collision_monster_32x32x32", "collider", (272, 5120, -626), (0, 0, 0)) disconnectpaths();
	spawncollision("collision_monster_32x32x32", "collider", (225, 5120, -626), (0, 0, 0)) disconnectpaths();
	spawncollision("collision_player_256x256x256", "collider", (1759, 1186, -604), (0, 0, 0));
	spawncollision("collision_player_256x256x256", "collider", (1724, 1007, -599), (0, 0, 0));
	spawncollision("collision_player_64x64x64", "collider", (2202, 805, -250), (12, 45, 0));
	spawncollision("collision_player_64x64x64", "collider", (-432, 7041, -598.5), (0, 0, 0));
	spawncollision("collision_player_64x64x64", "collider", (486, 2522, -216), (0, 0, 0));
	spawncollision("collision_player_wall_128x128x10", "collider", (250, 5924, -482), VectorScale((0, 1, 0), 270));
	spawncollision("collision_player_32x32x32", "collider", (1614.5, 4558, -429), VectorScale((0, 1, 0), 10.2996));
	spawncollision("collision_player_wall_128x128x10", "collider", (-83.5, 3392.5, -335.5), (0, 0, 0));
	zm::spawn_kill_brush((-929.5, 2593, -500), 512, 64);
	zm::spawn_kill_brush((2763, -426, -608), 64, 96);
	zm::spawn_kill_brush((2877, -282, -702), 256, 32);
	spawncollision("collision_player_wall_128x128x10", "collider", (2950, 572, -640), VectorScale((0, 1, 0), 314.2));
	t_killbrush_1 = spawn("trigger_box", (2392, 596, -210), 0, 32, 512, 64);
	t_killbrush_1.angles = VectorScale((0, 1, 0), 45);
	t_killbrush_1.script_noteworthy = "kill_brush";
	if(level flag::get("solo_game"))
	{
		a_t_doors = GetEntArray("zombie_door", "targetname");
		foreach(t_door in a_t_doors)
		{
			if(t_door.zombie_cost >= 1000)
			{
				t_door.zombie_cost = t_door.zombie_cost - 250;
				t_door zm_utility::set_hint_string(t_door, "default_buy_door", t_door.zombie_cost);
			}
		}
		return;
	}
}

/*
	Name: function_b230ba5a
	Namespace: namespace_711c2fc8
	Checksum: 0x424F4353
	Offset: 0x960
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function function_b230ba5a()
{
	while(1)
	{
		var_7566e65f = level util::waittill_any_return("remote_spawn_thrasher", "remote_spawn_spider", "fill_all_plants");
		if(var_7566e65f == "remote_spawn_thrasher")
		{
			level thread namespace_756d2c3d::function_c75116aa(0);
		}
		if(var_7566e65f == "remote_spawn_spider")
		{
			level thread namespace_27f8b154::spawn_spiders();
		}
	}
}

