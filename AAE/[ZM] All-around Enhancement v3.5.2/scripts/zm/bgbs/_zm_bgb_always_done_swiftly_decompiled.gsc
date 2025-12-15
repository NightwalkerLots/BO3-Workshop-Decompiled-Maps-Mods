#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\table_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_utility;
#include scripts\zm\aats\_zm_aat_turned;

#namespace namespace_d7f1b6c4;

/*
	Name: __init__sytem__
	Namespace: namespace_d7f1b6c4
	Checksum: 0x424F4353
	Offset: 0x2C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 29
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_always_done_swiftly", &__init__, undefined, "bgb");
}

/*
	Name: __init__
	Namespace: namespace_d7f1b6c4
	Checksum: 0x424F4353
	Offset: 0x308
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	bgb::register("zm_bgb_always_done_swiftly", "activated", 2, undefined, undefined, &validation, &activation);
}

/*
	Name: validation
	Namespace: namespace_d7f1b6c4
	Checksum: 0x424F4353
	Offset: 0x378
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function validation()
{
	a_ai_targets = self function_880a86b2();
	if(a_ai_targets.size)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_880a86b2
	Namespace: namespace_d7f1b6c4
	Checksum: 0x424F4353
	Offset: 0x3C0
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 83
*/
function function_880a86b2()
{
	a_ai_targets = GetAISpeciesArray(level.zombie_team, "all");
	zombies = [];
	foreach(ai in a_ai_targets)
	{
		if(ai.archetype == "zombie")
		{
			zombies[zombies.size] = ai;
		}
	}
	zombies = Array::remove_dead(zombies);
	zombies = Array::remove_undefined(zombies);
	if(zombies.size)
	{
		zombies = ArraySortClosest(zombies, self GetOrigin(), zombies.size, 0, 400);
		return zombies;
	}
	else
	{
		return zombies;
	}
}

/*
	Name: activation
	Namespace: namespace_d7f1b6c4
	Checksum: 0x424F4353
	Offset: 0x528
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 117
*/
function activation()
{
	a_ai_targets = self function_880a86b2();
	foreach(zombie in a_ai_targets)
	{
		zombie thread function_64706a31();
	}
}

/*
	Name: function_64706a31
	Namespace: namespace_d7f1b6c4
	Checksum: 0x424F4353
	Offset: 0x5E0
	Size: 0x104
	Parameters: 0
	Flags: None
	Line Number: 136
*/
function function_64706a31()
{
	self thread clientfield::set("zm_aat_turned", 1);
	self thread zm_aat_turned::zombie_death_time_limit(self);
	self.team = "allies";
	self.aat_turned = 1;
	self.n_aat_turned_zombie_kills = 0;
	self.allowdeath = 0;
	self.allowPain = 0;
	self.no_gib = 1;
	if(math::cointoss())
	{
		if(self.zombie_arms_position == "up")
		{
			self.variant_type = 6;
		}
		else
		{
			self.variant_type = 7;
		}
	}
	else if(self.zombie_arms_position == "up")
	{
		self.variant_type = 7;
	}
	else
	{
		self.variant_type = 8;
	}
}

