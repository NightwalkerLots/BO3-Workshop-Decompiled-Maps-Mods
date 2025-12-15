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

#namespace namespace_89d026b5;

/*
	Name: __init__sytem__
	Namespace: namespace_89d026b5
	Checksum: 0x3F91C308
	Offset: 0x200
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_tomahawk", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_89d026b5
	Checksum: 0x51ABFACE
	Offset: 0x240
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function __init__()
{
	clientfield::register("actor", "play_tomahawk_hit_sound", 1, 1, "int", &function_8d475ee1, 0, 0);
}

/*
	Name: function_9e17c89b
	Namespace: namespace_89d026b5
	Checksum: 0xB0D9FFF3
	Offset: 0x298
	Size: 0x40
	Parameters: 7
	Flags: None
	Line Number: 53
*/
function function_9e17c89b(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
}

/*
	Name: function_8d475ee1
	Namespace: namespace_89d026b5
	Checksum: 0x4DEBAECC
	Offset: 0x2E0
	Size: 0x5C
	Parameters: 7
	Flags: None
	Line Number: 67
*/
function function_8d475ee1(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	self playsound(var_3d850ea0, "wpn_tomahawk_impact");
}

