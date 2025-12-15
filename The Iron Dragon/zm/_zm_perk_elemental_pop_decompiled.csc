#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_e0544f6b;

/*
	Name: __init__sytem__
	Namespace: namespace_e0544f6b
	Checksum: 0xAF654660
	Offset: 0x198
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_elemental_pop", &__init__, &__main__, undefined);
	return;
	ERROR: Bad function call
}

/*
	Name: __init__
	Namespace: namespace_e0544f6b
	Checksum: 0xB6091DA7
	Offset: 0x1E0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_4088d59a();
	}
}

/*
	Name: __main__
	Namespace: namespace_e0544f6b
	Checksum: 0x74303DEF
	Offset: 0x218
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_aea2ce74();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4088d59a
	Namespace: namespace_e0544f6b
	Checksum: 0xBEAB47F
	Offset: 0x250
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_4088d59a()
{
	zm_perks::register_perk_clientfields("specialty_combat_efficiency", &function_16bef3dc, &function_c0fd8487);
	zm_perks::register_perk_effects("specialty_combat_efficiency", "specialty_combat_efficiency");
	zm_perks::register_perk_init_thread("specialty_combat_efficiency", &function_a2032c35);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a2032c35
	Namespace: namespace_e0544f6b
	Checksum: 0xC9FDE7E5
	Offset: 0x2E0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 91
*/
function function_a2032c35()
{
	level._effect["specialty_combat_efficiency"] = "harry/zm_perks/fx_perk_elementalpop_light";
}

/*
	Name: function_16bef3dc
	Namespace: namespace_e0544f6b
	Checksum: 0x7EDE1B87
	Offset: 0x308
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_16bef3dc()
{
	clientfield::register("clientuimodel", "hudItems.perks.elemental_pop", 1, 2, "int", undefined, 0, 1);
}

/*
	Name: function_c0fd8487
	Namespace: namespace_e0544f6b
	Checksum: 0x9ACF73B8
	Offset: 0x350
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 121
*/
function function_c0fd8487()
{
}

/*
	Name: function_aea2ce74
	Namespace: namespace_e0544f6b
	Checksum: 0x2E676778
	Offset: 0x360
	Size: 0x3C
	Parameters: 0
	Flags: None
	Line Number: 135
*/
function function_aea2ce74()
{
	clientfield::register("clientuimodel", "elemental_pop_ui_glow", 1, 1, "int", undefined, 0, 1);
}

