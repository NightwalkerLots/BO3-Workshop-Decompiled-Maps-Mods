#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_e423d491;

/*
	Name: __init__sytem__
	Namespace: namespace_e423d491
	Checksum: 0xC34521B0
	Offset: 0x180
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_icu", &__init__, &__main__, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_e423d491
	Checksum: 0x493D7FFE
	Offset: 0x1C8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_b765bce4();
	}
}

/*
	Name: __main__
	Namespace: namespace_e423d491
	Checksum: 0xE0353135
	Offset: 0x200
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_5ac3f592();
	}
}

/*
	Name: function_b765bce4
	Namespace: namespace_e423d491
	Checksum: 0xF43C9BF2
	Offset: 0x238
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function function_b765bce4()
{
	zm_perks::register_perk_clientfields("specialty_quieter", &function_79ad12fa, &function_db5d7bad);
	zm_perks::register_perk_effects("specialty_quieter", "specialty_quieter");
	zm_perks::register_perk_init_thread("specialty_quieter", &function_8b3b2ae3);
}

/*
	Name: function_8b3b2ae3
	Namespace: namespace_e423d491
	Checksum: 0xDFAB2C73
	Offset: 0x2C8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function function_8b3b2ae3()
{
	level._effect["specialty_quieter"] = "_logical_fx/perks/icu";
}

/*
	Name: function_79ad12fa
	Namespace: namespace_e423d491
	Checksum: 0x29E3B43A
	Offset: 0x2F0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function function_79ad12fa()
{
	clientfield::register("clientuimodel", "hudItems.perks.icu", 1, 2, "int", undefined, 0, 1);
}

/*
	Name: function_db5d7bad
	Namespace: namespace_e423d491
	Checksum: 0x9ACF73B8
	Offset: 0x338
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 117
*/
function function_db5d7bad()
{
}

/*
	Name: function_5ac3f592
	Namespace: namespace_e423d491
	Checksum: 0x9ACF73B8
	Offset: 0x348
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 131
*/
function function_5ac3f592()
{
}

