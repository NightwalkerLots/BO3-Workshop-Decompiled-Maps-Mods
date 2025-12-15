#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_utility;

#namespace namespace_e822cb43;

/*
	Name: __init__sytem__
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x1B0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_weap_shrink_ray", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x1F8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	clientfield::register("actor", "fun_size", 5000, 1, "int", &function_891e0258, 0, 0);
}

/*
	Name: __main__
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x250
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __main__()
{
}

/*
	Name: function_891e0258
	Namespace: namespace_e822cb43
	Checksum: 0x424F4353
	Offset: 0x260
	Size: 0x60
	Parameters: 7
	Flags: None
	Line Number: 66
*/
function function_891e0258(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self function_ec8b2835(newVal);
	self.var_f71294d7 = newVal;
}

