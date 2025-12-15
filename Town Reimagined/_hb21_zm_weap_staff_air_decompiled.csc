#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_hb21_zm_weap_staff_utility;
#include scripts\zm\_load;
#include scripts\zm\_zm_weapons;

#namespace namespace_6d0a1fae;

/*
	Name: __init__sytem__
	Namespace: namespace_6d0a1fae
	Checksum: 0xF2469DA8
	Offset: 0x1D8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_staff_air", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_6d0a1fae
	Checksum: 0x5F322B9B
	Offset: 0x218
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	callback::on_localplayer_spawned(&localplayer_spawned);
}

/*
	Name: localplayer_spawned
	Namespace: namespace_6d0a1fae
	Checksum: 0x19D6BED3
	Offset: 0x248
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 54
*/
function localplayer_spawned(localClientNum)
{
}

/*
	Name: function_1d4865dd
	Namespace: namespace_6d0a1fae
	Checksum: 0xF644B067
	Offset: 0x260
	Size: 0xC
	Parameters: 1
	Flags: None
	Line Number: 68
*/
function function_1d4865dd(localClientNum)
{
}

