#include scripts\codescripts\struct;
#include scripts\shared\_burnplayer;
#include scripts\shared\ai\archetype_utility;
#include scripts\shared\ai\systems\behavior_tree_utility;
#include scripts\shared\ai\systems\blackboard;
#include scripts\shared\ai\systems\debug;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_devgui;

#namespace namespace_57695b4d;

/*
	Name: __init__sytem__
	Namespace: namespace_57695b4d
	Checksum: 0xD1B91AD8
	Offset: 0x5B0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 35
*/
function autoexec __init__sytem__()
{
	system::register("zm_elemental_zombie", &__init__, undefined, undefined);
	return;
	continue;
}

/*
	Name: __init__
	Namespace: namespace_57695b4d
	Checksum: 0xC64ECB39
	Offset: 0x5F0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __init__()
{
	register_clientfields();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: register_clientfields
	Namespace: namespace_57695b4d
	Checksum: 0x8C7B9F7F
	Offset: 0x610
	Size: 0x128
	Parameters: 0
	Flags: Private
	Line Number: 69
*/
function private register_clientfields()
{
	clientfield::register("actor", "sparky_zombie_spark_fx", 1, 1, "int");
	clientfield::register("actor", "sparky_zombie_death_fx", 1, 1, "int");
	clientfield::register("actor", "napalm_zombie_death_fx", 1, 1, "int");
	clientfield::register("actor", "sparky_damaged_fx", 1, 1, "counter");
	clientfield::register("actor", "napalm_damaged_fx", 1, 1, "counter");
	clientfield::register("actor", "napalm_sfx", 1, 1, "int");
}

/*
	Name: function_1b1bb1b
	Namespace: namespace_57695b4d
	Checksum: 0xE785FDA6
	Offset: 0x740
	Size: 0x248
	Parameters: 0
	Flags: None
	Line Number: 89
*/
function function_1b1bb1b()
{
	var_fa0c7a14 = self;
	if(!isalive(var_fa0c7a14))
	{
		return;
	}
	var_902f20d5 = function_401b5e12("sparky");
	if(!isdefined(level.var_ffc5c301) || var_902f20d5 < level.var_ffc5c301)
	{
		if(!isdefined(var_fa0c7a14.is_elemental_zombie) || var_fa0c7a14.is_elemental_zombie == 0)
		{
			var_fa0c7a14.is_elemental_zombie = 1;
			var_fa0c7a14.var_9a02a614 = "sparky";
			var_fa0c7a14 clientfield::set("sparky_zombie_spark_fx", 1);
			var_fa0c7a14.health = Int(var_fa0c7a14.health * 1.5);
			var_fa0c7a14 thread function_d9226011();
			var_fa0c7a14 thread function_24644ad2();
			if(var_fa0c7a14.isCrawler === 1)
			{
				a_anims = Array("ai_zm_dlc1_zombie_crawl_turn_sparky_a", "ai_zm_dlc1_zombie_crawl_turn_sparky_b", "ai_zm_dlc1_zombie_crawl_turn_sparky_c", "ai_zm_dlc1_zombie_crawl_turn_sparky_d", "ai_zm_dlc1_zombie_crawl_turn_sparky_e");
				continue;
			}
			a_anims = Array("ai_zm_dlc1_zombie_turn_sparky_a", "ai_zm_dlc1_zombie_turn_sparky_b", "ai_zm_dlc1_zombie_turn_sparky_c", "ai_zm_dlc1_zombie_turn_sparky_d", "ai_zm_dlc1_zombie_turn_sparky_e");
			if(isdefined(var_fa0c7a14) && !isdefined(var_fa0c7a14.traverseStartNode))
			{
				var_fa0c7a14 animation::Play(Array::random(a_anims), var_fa0c7a14, undefined, 1, 0.2, 0.2);
			}
		}
	}
}

/*
	Name: function_f4defbc2
	Namespace: namespace_57695b4d
	Checksum: 0x77187E01
	Offset: 0x990
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 131
*/
function function_f4defbc2()
{
	if(isdefined(self))
	{
		var_fa0c7a14 = self;
		var_1ca69a28 = function_401b5e12("napalm");
		if(!isdefined(level.var_62f07e72) || var_1ca69a28 < level.var_62f07e72)
		{
			if(!isdefined(var_fa0c7a14.is_elemental_zombie) || var_fa0c7a14.is_elemental_zombie == 0)
			{
				var_fa0c7a14.is_elemental_zombie = 1;
				var_fa0c7a14.var_9a02a614 = "napalm";
				var_fa0c7a14 clientfield::set("arch_actor_fire_fx", 1);
				var_fa0c7a14 clientfield::set("napalm_sfx", 1);
				var_fa0c7a14.health = Int(var_fa0c7a14.health * 0.75);
				var_fa0c7a14 thread function_e94aef80();
				var_fa0c7a14 thread function_6d72b54d();
				var_fa0c7a14 zombie_utility::set_zombie_run_cycle("sprint");
			}
		}
	}
}

/*
	Name: function_24644ad2
	Namespace: namespace_57695b4d
	Checksum: 0x40FEA88C
	Offset: 0xB10
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 164
*/
function function_24644ad2()
{
	self endon("entityshutdown");
	self endon("death");
	while(1)
	{
		self waittill("damage");
		if(RandomInt(100) < 50)
		{
			self clientfield::increment("sparky_damaged_fx");
		}
		wait(0.05);
	}
}

/*
	Name: function_6d72b54d
	Namespace: namespace_57695b4d
	Checksum: 0xBD48D2AB
	Offset: 0xB90
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 189
*/
function function_6d72b54d()
{
	self endon("entityshutdown");
	self endon("death");
	while(1)
	{
		self waittill("damage");
		if(RandomInt(100) < 50)
		{
			self clientfield::increment("napalm_damaged_fx");
		}
		wait(0.05);
	}
}

/*
	Name: function_d9226011
	Namespace: namespace_57695b4d
	Checksum: 0xA3D6C945
	Offset: 0xC10
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 214
*/
function function_d9226011()
{
	var_fa0c7a14 = self;
	var_fa0c7a14 waittill("death");
	if(!isdefined(var_fa0c7a14) || var_fa0c7a14.nuked === 1)
	{
		return;
	}
	var_fa0c7a14 clientfield::set("sparky_zombie_death_fx", 1);
	var_fa0c7a14 zombie_utility::gib_random_parts();
	GibServerUtils::Annihilate(var_fa0c7a14);
	radiusdamage(var_fa0c7a14.origin + VectorScale((0, 0, 1), 35), 128, 70, 30, self, "MOD_EXPLOSIVE");
}

/*
	Name: function_e94aef80
	Namespace: namespace_57695b4d
	Checksum: 0xE95F22C
	Offset: 0xCF0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 238
*/
function function_e94aef80()
{
	var_fa0c7a14 = self;
	var_fa0c7a14 waittill("death");
	if(!isdefined(var_fa0c7a14) || var_fa0c7a14.nuked === 1)
	{
		return;
	}
	var_fa0c7a14 clientfield::set("napalm_zombie_death_fx", 1);
	var_fa0c7a14 zombie_utility::gib_random_parts();
	GibServerUtils::Annihilate(var_fa0c7a14);
	var_fa0c7a14.custom_player_shellshock = &function_e43b1ad1;
	radiusdamage(var_fa0c7a14.origin + VectorScale((0, 0, 1), 35), 128, 70, 30, self, "MOD_EXPLOSIVE");
}

/*
	Name: function_e43b1ad1
	Namespace: namespace_57695b4d
	Checksum: 0xDB3F92E5
	Offset: 0xDF0
	Size: 0x78
	Parameters: 5
	Flags: None
	Line Number: 263
*/
function function_e43b1ad1(n_damage, e_attacker, v_direction, v_point, str_mod)
{
	if(GetDvarString("blurpain") == "on")
	{
		self shellshock("pain_zm", 0.5);
	}
}

/*
	Name: function_181f65f7
	Namespace: namespace_57695b4d
	Checksum: 0x70E5E50E
	Offset: 0xE70
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 281
*/
function function_181f65f7(pos, range)
{
	var_dc6fd644 = function_a70f4ed5();
	a_zombies = Array::get_all_closest(pos, var_dc6fd644, undefined, undefined, range);
	return a_zombies;
}

/*
	Name: function_a70f4ed5
	Namespace: namespace_57695b4d
	Checksum: 0x2E9DE34D
	Offset: 0xEE0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 298
*/
function function_a70f4ed5()
{
	a_zombies = getaiarchetypearray("zombie");
	a_filtered_zombies = Array::filter(a_zombies, 0, &function_b804eb62);
	return a_filtered_zombies;
}

/*
	Name: function_201e8a84
	Namespace: namespace_57695b4d
	Checksum: 0x5D5B38B1
	Offset: 0xF50
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 315
*/
function function_201e8a84(str_type)
{
	a_zombies = getaiarchetypearray("zombie");
	a_filtered_zombies = Array::filter(a_zombies, 0, &function_8092e6bf, str_type);
	return a_filtered_zombies;
	ERROR: Bad function call
}

/*
	Name: function_401b5e12
	Namespace: namespace_57695b4d
	Checksum: 0x3053D3D1
	Offset: 0xFC8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 333
*/
function function_401b5e12(str_type)
{
	a_zombies = function_201e8a84(str_type);
	return a_zombies.size;
}

/*
	Name: function_8092e6bf
	Namespace: namespace_57695b4d
	Checksum: 0xDD61FB95
	Offset: 0x1008
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 349
*/
function function_8092e6bf(var_fa0c7a14, str_type)
{
	return var_fa0c7a14.var_4df9307b === str_type;
}

/*
	Name: function_b804eb62
	Namespace: namespace_57695b4d
	Checksum: 0x34E5B485
	Offset: 0x1038
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 364
*/
function function_b804eb62(var_fa0c7a14)
{
	return var_fa0c7a14.is_elemental_zombie !== 1;
}

