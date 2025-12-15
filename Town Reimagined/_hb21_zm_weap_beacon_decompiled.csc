#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm_weapons;

#namespace namespace_15ff9b9f;

/*
	Name: __init__sytem__
	Namespace: namespace_15ff9b9f
	Checksum: 0x56D07220
	Offset: 0x1C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_beacon", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_15ff9b9f
	Checksum: 0x9ACF73B8
	Offset: 0x208
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function __init__()
{
}

