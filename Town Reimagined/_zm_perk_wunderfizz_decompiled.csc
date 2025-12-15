#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm_weapons;

#namespace namespace_f52ad288;

/*
	Name: __init__sytem__
	Namespace: namespace_f52ad288
	Checksum: 0xFEFB5C7D
	Offset: 0x1A8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_wunderfizz", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_f52ad288
	Checksum: 0x9ACF73B8
	Offset: 0x1E8
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
}

