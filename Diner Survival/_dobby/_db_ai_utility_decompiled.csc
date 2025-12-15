#include scripts\_dobby\_db_utility;
#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\music_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;

#namespace namespace_298a9862;

/*
	Name: __init__sytem__
	Namespace: namespace_298a9862
	Checksum: 0x3477FB69
	Offset: 0x1A8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("ai_util", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_298a9862
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

