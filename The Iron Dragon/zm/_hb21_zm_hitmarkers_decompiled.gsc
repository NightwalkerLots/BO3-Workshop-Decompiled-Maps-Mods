#include scripts\codescripts\struct;
#include scripts\shared\damagefeedback_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_spawner;

#namespace namespace_8db78adf;

/*
	Name: __init__sytem__
	Namespace: namespace_8db78adf
	Checksum: 0x374EA7F
	Offset: 0x120
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_hitmarkers", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_8db78adf
	Checksum: 0x5D3BBD47
	Offset: 0x168
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	zm::register_zombie_damage_override_callback(&zombie_damage_event);
	zm_spawner::register_zombie_death_event_callback(&zombie_death_event);
}

/*
	Name: __main__
	Namespace: namespace_8db78adf
	Checksum: 0xBCF99DD9
	Offset: 0x1B8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function __main__()
{
	level.allowHitMarkers = 1;
	level.growing_hitmarker = 1;
}

/*
	Name: zombie_damage_event
	Namespace: namespace_8db78adf
	Checksum: 0x3EEF2CC4
	Offset: 0x1E0
	Size: 0xF8
	Parameters: 13
	Flags: None
	Line Number: 65
*/
function zombie_damage_event(willBeKilled, inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(isdefined(attacker) && isPlayer(attacker) && !willBeKilled && (!(isdefined(self.noHitMarkers) && self.noHitMarkers)))
	{
		attacker thread damagefeedback::update(meansOfDeath, inflictor, undefined, weapon);
		attacker damagefeedback::damage_feedback_growth(self, meansOfDeath, weapon);
		return;
	}
}

/*
	Name: zombie_death_event
	Namespace: namespace_8db78adf
	Checksum: 0x461BFA89
	Offset: 0x2E0
	Size: 0x9C
	Parameters: 1
	Flags: None
	Line Number: 85
*/
function zombie_death_event(e_player)
{
	if(isdefined(e_player) && isPlayer(e_player) && (!(isdefined(self.noHitMarkers) && self.noHitMarkers)))
	{
		e_player thread damagefeedback::update(self.damageMod, self.damageInflictor, undefined, self.damageWeapon);
		e_player damagefeedback::damage_feedback_growth(self, self.damageMod, self.damageWeapon);
	}
}

