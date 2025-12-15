#include scripts\codescripts\struct;
#include scripts\shared\system_shared;

#namespace namespace_e227a608;

/*
	Name: __init__sytem__
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0xD8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 15
*/
function autoexec __init__sytem__()
{
	system::register("_zm_emote_menu", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x118
	Size: 0x1C
	Parameters: 0
	Flags: None
	Line Number: 30
*/
function __init__()
{
	LuiLoad("ui.emotes.Emote_Menu");
}

