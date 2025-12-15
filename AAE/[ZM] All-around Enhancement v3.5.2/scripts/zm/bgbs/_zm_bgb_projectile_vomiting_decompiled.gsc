#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_utility;

#namespace namespace_a5a0319c;

/*
	Name: __init__sytem__
	Namespace: namespace_a5a0319c
	Checksum: 0x424F4353
	Offset: 0x218
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_projectile_vomiting", &__init__, undefined, "bgb");
}

/*
	Name: __init__
	Namespace: namespace_a5a0319c
	Checksum: 0x424F4353
	Offset: 0x258
	Size: 0x58
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
	bgb::register("zm_bgb_projectile_vomiting", "rounds", 5, &enable, undefined, undefined);
}

/*
	Name: enable
	Namespace: namespace_a5a0319c
	Checksum: 0x424F4353
	Offset: 0x2B8
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function enable()
{
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	self endon("hash_994d5e9e");
	self thread function_2f5ba94e();
	if(bgb::function_f345a8ce("zm_bgb_projectile_vomiting"))
	{
		return;
	}
	zombies = getaiarchetypearray("zombie");
	foreach(zombie in zombies)
	{
		zombie Attach("p8_zmb_duck_float", "j_mainroot");
		zombie.var_e6343efa = 1;
	}
	spawner::add_global_spawn_function("axis", &function_b57258a);
}

/*
	Name: function_2f5ba94e
	Namespace: namespace_a5a0319c
	Checksum: 0x424F4353
	Offset: 0x418
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 86
*/
function function_2f5ba94e()
{
	self util::waittill_any("disconnect", "bled_out", "bgb_update");
	if(bgb::function_72936116("zm_bgb_projectile_vomiting"))
	{
		return;
	}
	spawner::remove_global_spawn_function("axis", &function_b57258a);
}

/*
	Name: function_b57258a
	Namespace: namespace_a5a0319c
	Checksum: 0x424F4353
	Offset: 0x4A0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_b57258a()
{
	wait(0.5);
	if(self.archetype === "zombie" && isalive(self))
	{
		self Attach("p8_zmb_duck_float", "j_mainroot");
		self.var_e6343efa = 1;
	}
}

/*
	Name: disable
	Namespace: namespace_a5a0319c
	Checksum: 0x424F4353
	Offset: 0x510
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 126
*/
function disable()
{
}

/*
	Name: actor_death_override
	Namespace: namespace_a5a0319c
	Checksum: 0x424F4353
	Offset: 0x520
	Size: 0x4C
	Parameters: 1
	Flags: None
	Line Number: 140
*/
function actor_death_override(attacker)
{
	if(isdefined(self.archetype) && self.archetype === "zombie")
	{
		self playsound("quack_ee_alfat");
	}
}

