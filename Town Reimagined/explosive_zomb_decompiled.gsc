#include scripts\codescripts\struct;
#include scripts\shared\_burnplayer;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_b85fbe51;

/*
	Name: __init__sytem__
	Namespace: namespace_b85fbe51
	Checksum: 0x4B7869BD
	Offset: 0x368
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 33
*/
function autoexec __init__sytem__()
{
	system::register("explosive_zomb", &__init__, &__main__, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_b85fbe51
	Checksum: 0x88B8ED17
	Offset: 0x3B0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function __init__()
{
	callback::on_connect(&function_6334417b);
	zm_spawner::add_custom_zombie_spawn_logic(&function_bf17db9c);
	zm_spawner::register_zombie_death_event_callback(&watch_for_death);
}

/*
	Name: __main__
	Namespace: namespace_b85fbe51
	Checksum: 0x9ACF73B8
	Offset: 0x420
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 67
*/
function __main__()
{
}

/*
	Name: function_bf17db9c
	Namespace: namespace_b85fbe51
	Checksum: 0x97EDDF26
	Offset: 0x430
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 81
*/
function function_bf17db9c()
{
	var_3bf16dd6 = GetEntArray("trig_fire", "targetname");
	foreach(trig in var_3bf16dd6)
	{
		self thread function_cab6de8b(trig);
	}
}

/*
	Name: function_cab6de8b
	Namespace: namespace_b85fbe51
	Checksum: 0x15071C77
	Offset: 0x4F8
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 100
*/
function function_cab6de8b(trig)
{
	self endon("death");
	level.var_38ff2464 = 0;
	while(1)
	{
		if(self istouching(trig))
		{
			self.var_38ff2464 = 1;
			self.flame_fx_timeout = 15;
			self thread zombie_death::flame_death_fx();
			wait(15);
			self.var_38ff2464 = 0;
			break;
		}
		wait(0.05);
	}
}

/*
	Name: watch_for_death
	Namespace: namespace_b85fbe51
	Checksum: 0x4734613E
	Offset: 0x598
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 129
*/
function watch_for_death()
{
	if(self.var_38ff2464 == 1)
	{
		self thread zombie_explodes_intopieces(0);
		self thread ragdollDeath();
		self ghost();
		self playsound("explode_bo2");
		playFX("explosions/fx_exp_generic_aerial_sm", self.origin);
		self clientfield::set("zombie_ragdoll_explode", 1);
		foreach(player in GetPlayers())
		{
			if(Distance2DSquared(player.origin, self.origin) < 5000)
			{
				player burnplayer::SetPlayerBurning(1, 0, 0, undefined, undefined);
				player DoDamage(40, self.origin);
				player shellshock("explosion", 0.6);
				Earthquake(0.2, 0.6, self.origin, 200);
			}
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: zombie_explodes_intopieces
	Namespace: namespace_b85fbe51
	Checksum: 0x50C69EDE
	Offset: 0x7A0
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 164
*/
function zombie_explodes_intopieces(random_gibs)
{
	if(isdefined(self) && IsActor(self))
	{
		if(!random_gibs || RandomInt(100) < 50)
		{
			GibServerUtils::GibHead(self);
		}
		if(!random_gibs || RandomInt(100) < 50)
		{
			GibServerUtils::GibLeftArm(self);
		}
		if(!random_gibs || RandomInt(100) < 50)
		{
			GibServerUtils::GibRightArm(self);
		}
		if(!random_gibs || RandomInt(100) < 50)
		{
			GibServerUtils::GibLegs(self);
		}
	}
	GibServerUtils::Annihilate(self);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: ragdollDeath
	Namespace: namespace_b85fbe51
	Checksum: 0x7F06FEA1
	Offset: 0x8F0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 200
*/
function ragdollDeath()
{
	lastOrg = self.origin;
	moveVec = (0, 0, 0);
	for(;;)
	{
		wait(0.05);
		force = Distance(self.origin, lastOrg);
		lastOrg = self.origin;
		if(self.health == 1)
		{
			self.a.nodeath = 1;
			self StartRagdoll();
			wait(0.05);
			PhysicsExplosionSphere(lastOrg, 600, 0, force * 0.1);
			return;
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_6334417b
	Namespace: namespace_b85fbe51
	Checksum: 0x8BD1E819
	Offset: 0x9D8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 232
*/
function function_6334417b()
{
	var_3bf16dd6 = GetEntArray("trig_fire", "targetname");
	foreach(trig in var_3bf16dd6)
	{
		self thread function_7166e65f(trig);
	}
}

/*
	Name: function_7166e65f
	Namespace: namespace_b85fbe51
	Checksum: 0x4CF9AF3B
	Offset: 0xAA0
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 251
*/
function function_7166e65f(trig)
{
	while(1)
	{
		if(self istouching(trig))
		{
			self burnplayer::SetPlayerBurning(0.5, 0, 0, undefined, undefined);
			self DoDamage(10, self.origin);
			wait(1);
		}
		wait(0.05);
	}
}

