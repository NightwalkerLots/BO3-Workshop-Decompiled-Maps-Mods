#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm_weapons;

#namespace namespace_7529ddc1;

/*
	Name: __init__sytem__
	Namespace: namespace_7529ddc1
	Checksum: 0xA3C9D828
	Offset: 0x1B8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_one_inch_punch", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_7529ddc1
	Checksum: 0x4E0FB4AD
	Offset: 0x1F8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	callback::on_localplayer_spawned(&localplayer_spawned);
}

/*
	Name: localplayer_spawned
	Namespace: namespace_7529ddc1
	Checksum: 0x2E0E5A3
	Offset: 0x228
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 52
*/
function localplayer_spawned(localClientNum)
{
	self thread monitor_melee_swipe(localClientNum);
}

/*
	Name: monitor_melee_swipe
	Namespace: namespace_7529ddc1
	Checksum: 0x1F7F823A
	Offset: 0x258
	Size: 0x54
	Parameters: 1
	Flags: None
	Line Number: 67
*/
function monitor_melee_swipe(localClientNum)
{
	self endon("disconnect");
	self notify("stop_monitor_melee_swipe");
	self endon("stop_monitor_melee_swipe");
	while(1)
	{
		self waittill("weapon_melee", weapon);
	}
}

