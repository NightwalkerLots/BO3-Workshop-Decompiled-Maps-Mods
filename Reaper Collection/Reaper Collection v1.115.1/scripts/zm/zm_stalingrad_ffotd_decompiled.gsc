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
#include scripts\zm\_zm_ai_raz;
#include scripts\zm\_zm_ai_sentinel_drone;
#include scripts\zm\_zm_elemental_zombies;
#include scripts\zm\_zm_utility;
#include scripts\zm\zm_stalingrad_pap_quest;

#namespace namespace_15d4d4c0;

/*
	Name: main_start
	Namespace: namespace_15d4d4c0
	Checksum: 0x424F4353
	Offset: 0x3B8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 28
*/
function main_start()
{
	level thread force_spawn();
	spawncollision("collision_player_wall_256x256x10", "collider", (988, 3524, 380), VectorScale((0, 1, 0), 90));
	spawncollision("collision_player_wall_256x256x10", "collider", (988, 3524, 636), VectorScale((0, 1, 0), 90));
	spawncollision("collision_player_64x64x128", "collider", (-1184, 2947, 224), VectorScale((0, -1, 0), 45));
	spawncollision("collision_player_64x64x128", "collider", (-1224, 2971, 224), VectorScale((0, -1, 0), 17));
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: main_end
	Namespace: namespace_15d4d4c0
	Checksum: 0x424F4353
	Offset: 0x4C0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function main_end()
{
	level function_30409839();
}

/*
	Name: function_30409839
	Namespace: namespace_15d4d4c0
	Checksum: 0x424F4353
	Offset: 0x4E8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 64
*/
function function_30409839()
{
	var_5d655ddb = struct::get_array("intermission", "targetname");
	foreach(var_13e6937b in var_5d655ddb)
	{
		if(var_13e6937b.origin == (-3106, 2242, 653))
		{
			var_13e6937b struct::delete();
			return;
		}
	}
}

/*
	Name: force_spawn
	Namespace: namespace_15d4d4c0
	Checksum: 0x424F4353
	Offset: 0x5D0
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function force_spawn()
{
	while(1)
	{
		var_7566e65f = level util::waittill_any_return("remote_spawn_raz", "remote_spawn_drop_pod", "remote_spawn_sentinel_drone", "stalingrad_fire_zombie", "stalingrad_electric_zombie");
		if(var_7566e65f == "remote_spawn_raz")
		{
			level thread function_ff89f41d();
		}
		if(var_7566e65f == "remote_spawn_drop_pod")
		{
			a_s_radio = struct::get_array("drop_pod_radio", "targetname");
			level thread namespace_b57650e4::function_809fbbff(a_s_radio[RandomInt(a_s_radio.size)].script_string);
		}
		if(var_7566e65f == "remote_spawn_sentinel_drone")
		{
			level thread function_d71e9101();
		}
		if(var_7566e65f == "stalingrad_fire_zombie")
		{
			level thread function_74c999cd();
		}
		if(var_7566e65f == "stalingrad_electric_zombie")
		{
			level thread function_d60988b8();
		}
	}
}

/*
	Name: function_ff89f41d
	Namespace: namespace_15d4d4c0
	Checksum: 0x424F4353
	Offset: 0x748
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 126
*/
function function_ff89f41d()
{
	for(i = 0; i < level.activePlayers.size; i++)
	{
		namespace_1c31c03d::function_665a13cd();
		namespace_1c31c03d::function_665a13cd();
		namespace_1c31c03d::function_665a13cd();
	}
}

/*
	Name: function_d71e9101
	Namespace: namespace_15d4d4c0
	Checksum: 0x424F4353
	Offset: 0x7B8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 146
*/
function function_d71e9101()
{
	for(i = 0; i < level.activePlayers.size; i++)
	{
		namespace_8bc21961::spawn_sentinel();
		namespace_8bc21961::spawn_sentinel();
		namespace_8bc21961::spawn_sentinel();
	}
}

/*
	Name: function_d60988b8
	Namespace: namespace_15d4d4c0
	Checksum: 0x424F4353
	Offset: 0x828
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 166
*/
function function_d60988b8()
{
	spawners = GetSpawnerArray("zombie_sentinel_zombie_spawner", "script_noteworthy");
	var_7b36b21e = 20;
	while(var_7b36b21e > 0)
	{
		ai_zombie = zombie_utility::spawn_zombie(spawners[0], "sentinel_riser", level.var_60454acf);
		if(isdefined(ai_zombie))
		{
			var_7b36b21e--;
			ai_zombie clientfield::set("sentinel_zombie_spawn_fx", 1);
			playsoundatposition("zmb_sentinel_res_spawn", level.var_60454acf.origin);
		}
		wait(0.1);
	}
}

/*
	Name: function_74c999cd
	Namespace: namespace_15d4d4c0
	Checksum: 0x424F4353
	Offset: 0x918
	Size: 0x114
	Parameters: 0
	Flags: None
	Line Number: 193
*/
function function_74c999cd()
{
	level endon("hash_7cd417f3");
	while(1)
	{
		a_ai = GetAIArray();
		for(i = 0; i < a_ai.size; i++)
		{
			if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie" && (!isdefined(a_ai[i].is_elemental_zombie) || a_ai[i].is_elemental_zombie == 0))
			{
				a_ai[i] thread namespace_57695b4d::function_f4defbc2();
			}
		}
		wait(0.1);
	}
}

