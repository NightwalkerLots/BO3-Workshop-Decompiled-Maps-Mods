#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_quick_revive;

/*
	Name: __init__sytem__
	Namespace: zm_perk_quick_revive
	Checksum: 0x28710870
	Offset: 0x178
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_quick_revive", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_quick_revive
	Checksum: 0xFAEB0D56
	Offset: 0x1C0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_quick_revive_perk_for_level();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __main__
	Namespace: zm_perk_quick_revive
	Checksum: 0x80C70C3D
	Offset: 0x1F8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_ef1171f6();
	}
}

/*
	Name: enable_quick_revive_perk_for_level
	Namespace: zm_perk_quick_revive
	Checksum: 0x817B57E1
	Offset: 0x230
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function enable_quick_revive_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_quickrevive", &quick_revive_client_field_func, &quick_revive_callback_func);
	zm_perks::register_perk_effects("specialty_quickrevive", "specialty_quickrevive");
	zm_perks::register_perk_init_thread("specialty_quickrevive", &function_18817b27);
}

/*
	Name: function_18817b27
	Namespace: zm_perk_quick_revive
	Checksum: 0x7228C8A
	Offset: 0x2C0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function function_18817b27()
{
	level._effect["specialty_quickrevive"] = "harry/zm_perks/fx_perk_quick_revive_light";
}

/*
	Name: quick_revive_client_field_func
	Namespace: zm_perk_quick_revive
	Checksum: 0xA130E67F
	Offset: 0x2E8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function quick_revive_client_field_func()
{
	clientfield::register("clientuimodel", "hudItems.perks.quick_revive", 1, 2, "int", undefined, 0, 1);
}

/*
	Name: quick_revive_callback_func
	Namespace: zm_perk_quick_revive
	Checksum: 0x9ACF73B8
	Offset: 0x330
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 117
*/
function quick_revive_callback_func()
{
}

/*
	Name: function_ef1171f6
	Namespace: zm_perk_quick_revive
	Checksum: 0x9ACF73B8
	Offset: 0x340
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 131
*/
function function_ef1171f6()
{
}

