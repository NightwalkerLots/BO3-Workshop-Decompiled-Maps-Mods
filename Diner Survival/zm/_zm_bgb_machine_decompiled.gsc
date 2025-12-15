#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;

#namespace bgb_machine;

/*
	Name: __init__sytem__
	Namespace: bgb_machine
	Checksum: 0x998BA111
	Offset: 0xF0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 15
*/
function autoexec __init__sytem__()
{
	system::register("bgb_machine", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: bgb_machine
	Checksum: 0x85E02003
	Offset: 0x130
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 30
*/
function __init__()
{
	clientfield::register("toplayer", "zm_bgb_machine_round_buys", 1, 3, "int");
}

/*
	Name: turn_on_fire_sale
	Namespace: bgb_machine
	Checksum: 0x9ACF73B8
	Offset: 0x170
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function turn_on_fire_sale()
{
}

/*
	Name: turn_off_fire_sale
	Namespace: bgb_machine
	Checksum: 0x9ACF73B8
	Offset: 0x180
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 59
*/
function turn_off_fire_sale()
{
}

