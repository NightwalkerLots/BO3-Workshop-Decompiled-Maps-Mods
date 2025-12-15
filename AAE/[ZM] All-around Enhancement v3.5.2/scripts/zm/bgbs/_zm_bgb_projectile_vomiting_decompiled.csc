#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_utility;

#namespace namespace_a5a0319c;

/*
	Name: __init__sytem__
	Namespace: namespace_a5a0319c
	Checksum: 0x424F4353
	Offset: 0x1A0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_projectile_vomiting", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_a5a0319c
	Checksum: 0x424F4353
	Offset: 0x1E0
	Size: 0x40
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
	bgb::register("zm_bgb_projectile_vomiting", "rounds");
}

/*
	Name: function_6ac13208
	Namespace: namespace_a5a0319c
	Checksum: 0x424F4353
	Offset: 0x228
	Size: 0x40
	Parameters: 7
	Flags: None
	Line Number: 56
*/
function function_6ac13208(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
}

/*
	Name: function_6d325051
	Namespace: namespace_a5a0319c
	Checksum: 0x424F4353
	Offset: 0x270
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function function_6d325051()
{
}

