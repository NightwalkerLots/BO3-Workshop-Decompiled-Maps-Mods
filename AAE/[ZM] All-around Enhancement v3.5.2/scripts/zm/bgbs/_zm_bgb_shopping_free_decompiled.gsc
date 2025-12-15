#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_utility;

#namespace namespace_18c49b5a;

/*
	Name: __init__sytem__
	Namespace: namespace_18c49b5a
	Checksum: 0x424F4353
	Offset: 0x170
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_shopping_free", &__init__, undefined, "bgb");
}

/*
	Name: __init__
	Namespace: namespace_18c49b5a
	Checksum: 0x424F4353
	Offset: 0x1B0
	Size: 0x68
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
	bgb::register("zm_bgb_shopping_free", "time", 60, &enable, &disable, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: enable
	Namespace: namespace_18c49b5a
	Checksum: 0x424F4353
	Offset: 0x220
	Size: 0xB0
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
	if(GetDvarString("tfoption_spfreemus") != "1")
	{
		self stopsound("zerobuy");
		wait(0.05);
		self playsoundwithnotify("zerobuy", "zerobuy", "j_head");
	}
}

/*
	Name: disable
	Namespace: namespace_18c49b5a
	Checksum: 0x424F4353
	Offset: 0x2D8
	Size: 0x24
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function disable()
{
	self stopsound("zerobuy");
}

