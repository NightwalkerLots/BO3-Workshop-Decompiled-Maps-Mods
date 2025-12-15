#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_hb21_zm_weap_staff_utility;
#include scripts\zm\_load;
#include scripts\zm\_zm_perk_electric_cherry;
#include scripts\zm\_zm_weapons;

#namespace namespace_39f88dbc;

/*
	Name: __init__sytem__
	Namespace: namespace_39f88dbc
	Checksum: 0x216E6A1B
	Offset: 0x210
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_staff_lightning", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_39f88dbc
	Checksum: 0xAFA8AE8D
	Offset: 0x250
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
	Namespace: namespace_39f88dbc
	Checksum: 0xB1AD8138
	Offset: 0x280
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 54
*/
function localplayer_spawned(localClientNum)
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dc0a107
	Namespace: namespace_39f88dbc
	Checksum: 0x12755697
	Offset: 0x298
	Size: 0xC
	Parameters: 1
	Flags: None
	Line Number: 70
*/
function function_dc0a107(localClientNum)
{
}

