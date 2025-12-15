#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_hb21_zm_weap_staff_utility;
#include scripts\zm\_load;
#include scripts\zm\_zm_weapons;

#namespace namespace_ec041286;

/*
	Name: __init__sytem__
	Namespace: namespace_ec041286
	Checksum: 0x9FC6FF02
	Offset: 0x1F8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_staff_fire", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_ec041286
	Checksum: 0xDF78C380
	Offset: 0x238
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
	Namespace: namespace_ec041286
	Checksum: 0xFB0AE4E9
	Offset: 0x268
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 54
*/
function localplayer_spawned(localClientNum)
{
}

/*
	Name: function_a787aa75
	Namespace: namespace_ec041286
	Checksum: 0xAF00518A
	Offset: 0x280
	Size: 0xC
	Parameters: 1
	Flags: None
	Line Number: 68
*/
function function_a787aa75(localClientNum)
{
}

