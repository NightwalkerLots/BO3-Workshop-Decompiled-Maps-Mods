#include scripts\_dobby\_db_zonewriter;
#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace namespace_efd7b5f5;

/*
	Name: __init__sytem__
	Namespace: namespace_efd7b5f5
	Checksum: 0x83CB0B3
	Offset: 0x1F0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec __init__sytem__()
{
	system::register("zm_t6_hud", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_efd7b5f5
	Checksum: 0x80C4799D
	Offset: 0x238
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	clientfield::register("clientuimodel", "db.MuleKick", 1, 1, "int", undefined, 0, 0);
	clientfield::register("clientuimodel", "db.InstakillUpgrade", 1, 3, "int", undefined, 0, 0);
	LuiLoad("ui.t6hud_zm_usermap");
	for(i = 0; i < 8; i++)
	{
		clientfield::register("world", "player_reviving" + i, 1, 1, "int", &function_69d76b09, 0, 1);
	}
}

/*
	Name: __main__
	Namespace: namespace_efd7b5f5
	Checksum: 0x9ACF73B8
	Offset: 0x340
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function __main__()
{
}

/*
	Name: function_69d76b09
	Namespace: namespace_efd7b5f5
	Checksum: 0x8AF6F172
	Offset: 0x350
	Size: 0xFC
	Parameters: 7
	Flags: None
	Line Number: 70
*/
function function_69d76b09(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	subStr = GetSubStr(fieldName, 15);
	playerNum = Int(subStr);
	if(newVal != oldVal)
	{
		model = GetUIModel(GetUIModelForController(localClientNum), "WorldSpaceIndicators.bleedOutModel" + playerNum + ".reviving");
		if(isdefined(model))
		{
			SetUIModelValue(model, newVal);
		}
	}
}

