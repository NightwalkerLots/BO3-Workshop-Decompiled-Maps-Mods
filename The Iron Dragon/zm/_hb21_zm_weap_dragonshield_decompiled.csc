#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\_zm_weapons;

#namespace namespace_4cfd21fd;

/*
	Name: __init__sytem__
	Namespace: namespace_4cfd21fd
	Checksum: 0x449DCAF
	Offset: 0x1A0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_dragonshield", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_4cfd21fd
	Checksum: 0x99B97FE4
	Offset: 0x1E0
	Size: 0x5A
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_stalingrad" || script == "zm_genesis")
	{
		return;
	}
}

