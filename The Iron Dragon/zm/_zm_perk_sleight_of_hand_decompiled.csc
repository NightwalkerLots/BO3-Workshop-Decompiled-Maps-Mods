#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_sleight_of_hand;

/*
	Name: __init__sytem__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x560DBE3
	Offset: 0x188
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_sleight_of_hand", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x192951BC
	Offset: 0x1D0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_sleight_of_hand_perk_for_level();
		return;
	}
}

/*
	Name: __main__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x35C8F01A
	Offset: 0x208
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_652c5c8b();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: enable_sleight_of_hand_perk_for_level
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xFA88852F
	Offset: 0x240
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function enable_sleight_of_hand_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_fastreload", &sleight_of_hand_client_field_func, &sleight_of_hand_code_callback_func);
	zm_perks::register_perk_effects("specialty_fastreload", "specialty_fastreload");
	zm_perks::register_perk_init_thread("specialty_fastreload", &init_sleight_of_hand);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: init_sleight_of_hand
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x4CBE775C
	Offset: 0x2D0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function init_sleight_of_hand()
{
	level._effect["specialty_fastreload"] = "harry/zm_perks/fx_perk_sleight_of_hand_light";
}

/*
	Name: sleight_of_hand_client_field_func
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x68404DC1
	Offset: 0x2F8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function sleight_of_hand_client_field_func()
{
	clientfield::register("clientuimodel", "hudItems.perks.sleight_of_hand", 1, 2, "int", undefined, 0, 1);
}

/*
	Name: sleight_of_hand_code_callback_func
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x9ACF73B8
	Offset: 0x340
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function sleight_of_hand_code_callback_func()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_652c5c8b
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x9ACF73B8
	Offset: 0x350
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 136
*/
function function_652c5c8b()
{
}

