#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_additionalprimaryweapon;

/*
	Name: __init__sytem__
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x7DC84A8F
	Offset: 0x1C0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_additionalprimaryweapon", &__init__, &__main__, undefined);
	return;
	ERROR: Bad function call
}

/*
	Name: __init__
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xE3B3F090
	Offset: 0x208
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_additional_primary_weapon_perk_for_level();
	}
}

/*
	Name: __main__
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xF7C307A
	Offset: 0x240
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_7699414c();
	}
}

/*
	Name: enable_additional_primary_weapon_perk_for_level
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x8FA0A515
	Offset: 0x278
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function enable_additional_primary_weapon_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_additionalprimaryweapon", &additional_primary_weapon_client_field_func, &additional_primary_weapon_code_callback_func);
	zm_perks::register_perk_effects("specialty_additionalprimaryweapon", "specialty_additionalprimaryweapon");
	zm_perks::register_perk_init_thread("specialty_additionalprimaryweapon", &function_a7b918e9);
}

/*
	Name: function_a7b918e9
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x71672AD3
	Offset: 0x308
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function function_a7b918e9()
{
	level._effect["specialty_additionalprimaryweapon"] = "harry/zm_perks/fx_perk_mule_kick";
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: additional_primary_weapon_client_field_func
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xBD7D9977
	Offset: 0x330
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function additional_primary_weapon_client_field_func()
{
	clientfield::register("clientuimodel", "additional_primary_weapon_ui_glow", 1, 1, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "hudItems.perks.additional_primary_weapon", 1, 2, "int", undefined, 0, 1);
}

/*
	Name: additional_primary_weapon_code_callback_func
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x9ACF73B8
	Offset: 0x3B0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function additional_primary_weapon_code_callback_func()
{
}

/*
	Name: function_7699414c
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x9ACF73B8
	Offset: 0x3C0
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 134
*/
function function_7699414c()
{
}

