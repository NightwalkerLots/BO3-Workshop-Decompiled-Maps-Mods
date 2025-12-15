#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace namespace_de165357;

/*
	Name: __init__sytem__
	Namespace: namespace_de165357
	Checksum: 0x2AAAB3FD
	Offset: 0x160
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("db_zw", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_de165357
	Checksum: 0x4662BC00
	Offset: 0x1A0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	util::REGISTER_SYSTEM("DBzoneName", &function_84579e43);
}

/*
	Name: function_84579e43
	Namespace: namespace_de165357
	Checksum: 0x7AB41F0
	Offset: 0x1D8
	Size: 0xA8
	Parameters: 3
	Flags: None
	Line Number: 49
*/
function function_84579e43(localClientNum, newVal, oldVal)
{
	self cf(localClientNum, oldVal, newVal, 0, undefined, "zoneNameInHUD", 0);
	model = GetUIModel(GetUIModelForController(localClientNum), "zoneNameInHUD");
	SetUIModelValue(model, newVal);
}

/*
	Name: cf
	Namespace: namespace_de165357
	Checksum: 0x5843D035
	Offset: 0x288
	Size: 0x94
	Parameters: 7
	Flags: None
	Line Number: 66
*/
function cf(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), fieldName);
	SetUIModelValue(model, newVal);
}

