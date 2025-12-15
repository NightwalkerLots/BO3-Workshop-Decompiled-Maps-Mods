#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_utility;

#namespace namespace_3ab5ff91;

/*
	Name: __init__sytem__
	Namespace: namespace_3ab5ff91
	Checksum: 0x424F4353
	Offset: 0x208
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_arsenal_accelerator", &__init__, undefined, "bgb");
}

/*
	Name: __init__
	Namespace: namespace_3ab5ff91
	Checksum: 0x424F4353
	Offset: 0x248
	Size: 0xE0
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
	clientfield::register("allplayers", "zm_bgb_arsenal_accelerator_3p_fx", 15000, 1, "int");
	clientfield::register("toplayer", "zm_bgb_arsenal_accelerator_1p_fx", 15000, 1, "int");
	bgb::register("zm_bgb_arsenal_accelerator", "time", 240, &enable, &disable, undefined);
	zm::register_player_damage_callback(&function_974879cf);
}

/*
	Name: enable
	Namespace: namespace_3ab5ff91
	Checksum: 0x424F4353
	Offset: 0x330
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 59
*/
function enable()
{
	self clientfield::set("zm_bgb_arsenal_accelerator_3p_fx", 1);
	self clientfield::set_to_player("zm_bgb_arsenal_accelerator_1p_fx", 1);
	self thread function_2b7cd0ed();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: disable
	Namespace: namespace_3ab5ff91
	Checksum: 0x424F4353
	Offset: 0x398
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function disable()
{
	self notify("hash_9363ccbc");
	self clientfield::set("zm_bgb_arsenal_accelerator_3p_fx", 0);
	self clientfield::set_to_player("zm_bgb_arsenal_accelerator_1p_fx", 0);
}

/*
	Name: function_2b7cd0ed
	Namespace: namespace_3ab5ff91
	Checksum: 0x424F4353
	Offset: 0x3F8
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 95
*/
function function_2b7cd0ed()
{
	self endon("spawned_player");
	level endon("end_game");
	self endon("bled_out");
	self endon("disconnect");
	self endon("death");
	self endon("hash_9363ccbc");
	while(self getnormalhealth() < 1 && self getvelocity() != 0)
	{
		self bgb::do_one_shot_use(1);
		while(self getnormalhealth() < 1 && self getvelocity() != 0)
		{
			self setnormalhealth(self getnormalhealth() + 0.1);
			wait(0.05);
		}
		if(self getnormalhealth() >= 0.5)
		{
			self notify("clear_red_flashing_overlay");
		}
		wait(0.05);
	}
}

/*
	Name: function_974879cf
	Namespace: namespace_3ab5ff91
	Checksum: 0x424F4353
	Offset: 0x558
	Size: 0xE0
	Parameters: 11
	Flags: None
	Line Number: 129
*/
function function_974879cf(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex)
{
	if(self bgb::is_enabled("zm_bgb_arsenal_accelerator"))
	{
		if(iDamage > self.health && self.health > 2)
		{
			self bgb::do_one_shot_use(1);
			return Int(self.health - 1);
		}
	}
	return -1;
}

