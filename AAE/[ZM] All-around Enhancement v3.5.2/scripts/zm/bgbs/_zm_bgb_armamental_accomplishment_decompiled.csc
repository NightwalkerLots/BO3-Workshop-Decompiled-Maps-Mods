#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_utility;

#namespace namespace_4754119d;

/*
	Name: __init__sytem__
	Namespace: namespace_4754119d
	Checksum: 0x424F4353
	Offset: 0x168
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_armamental_accomplishment", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_4754119d
	Checksum: 0x424F4353
	Offset: 0x1A8
	Size: 0x3C
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	bgb::register("zm_bgb_armamental_accomplishment", "activated");
}

