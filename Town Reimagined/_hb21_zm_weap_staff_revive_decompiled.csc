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

#namespace namespace_bacf4821;

/*
	Name: __init__sytem__
	Namespace: namespace_bacf4821
	Checksum: 0xFFF3268C
	Offset: 0x1E0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_staff_revive", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_bacf4821
	Checksum: 0x9ACF73B8
	Offset: 0x220
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function __init__()
{
}

