#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;

#namespace bgb_machine;

/*
	Name: __init__sytem__
	Namespace: bgb_machine
	Checksum: 0xBA26ADE9
	Offset: 0xF0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 15
*/
function autoexec __init__sytem__()
{
	system::register("bgb_machine", &__init__, undefined, undefined);
	return;
	.var_0 = undefined;
}

/*
	Name: __init__
	Namespace: bgb_machine
	Checksum: 0x16AF8987
	Offset: 0x130
	Size: 0x3C
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	clientfield::register("toplayer", "zm_bgb_machine_round_buys", 1, 3, "int", undefined, 0, 0);
}

