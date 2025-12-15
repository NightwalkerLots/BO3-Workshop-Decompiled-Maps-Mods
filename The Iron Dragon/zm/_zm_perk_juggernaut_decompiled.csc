#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_juggernaut;

/*
	Name: __init__sytem__
	Namespace: zm_perk_juggernaut
	Checksum: 0xC51B4501
	Offset: 0x168
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_juggernaut", &__init__, &__main__, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: zm_perk_juggernaut
	Checksum: 0x5038180F
	Offset: 0x1B0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_juggernaut_perk_for_level();
	}
}

/*
	Name: __main__
	Namespace: zm_perk_juggernaut
	Checksum: 0x51CC53BC
	Offset: 0x1E8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_a1f13bb3();
	}
}

/*
	Name: enable_juggernaut_perk_for_level
	Namespace: zm_perk_juggernaut
	Checksum: 0xA5DEB79F
	Offset: 0x220
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function enable_juggernaut_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_armorvest", &juggernaut_client_field_func, &juggernaut_code_callback_func);
	zm_perks::register_perk_effects("specialty_armorvest", "specialty_armorvest");
	zm_perks::register_perk_init_thread("specialty_armorvest", &function_3c1e52f2);
}

/*
	Name: function_3c1e52f2
	Namespace: zm_perk_juggernaut
	Checksum: 0x39EA7A87
	Offset: 0x2B0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function function_3c1e52f2()
{
	level._effect["specialty_armorvest"] = "harry/zm_perks/fx_perk_juggernaut";
}

/*
	Name: juggernaut_client_field_func
	Namespace: zm_perk_juggernaut
	Checksum: 0xC968BCD1
	Offset: 0x2D8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function juggernaut_client_field_func()
{
	clientfield::register("clientuimodel", "hudItems.perks.juggernaut", 1, 2, "int", undefined, 0, 1);
}

/*
	Name: juggernaut_code_callback_func
	Namespace: zm_perk_juggernaut
	Checksum: 0x9ACF73B8
	Offset: 0x320
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 117
*/
function juggernaut_code_callback_func()
{
}

/*
	Name: function_a1f13bb3
	Namespace: zm_perk_juggernaut
	Checksum: 0x9ACF73B8
	Offset: 0x330
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 131
*/
function function_a1f13bb3()
{
}

