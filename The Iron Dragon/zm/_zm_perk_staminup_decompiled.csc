#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_staminup;

/*
	Name: __init__sytem__
	Namespace: zm_perk_staminup
	Checksum: 0x2B39A866
	Offset: 0x160
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_staminup", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_staminup
	Checksum: 0xC4F8426E
	Offset: 0x1A8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_staminup_perk_for_level();
		return;
	}
}

/*
	Name: __main__
	Namespace: zm_perk_staminup
	Checksum: 0x192CE68A
	Offset: 0x1E0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_6c3e53e0();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: enable_staminup_perk_for_level
	Namespace: zm_perk_staminup
	Checksum: 0x37EA7A56
	Offset: 0x218
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function enable_staminup_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_staminup", &staminup_client_field_func, &staminup_callback_func);
	zm_perks::register_perk_effects("specialty_staminup", "specialty_staminup");
	zm_perks::register_perk_init_thread("specialty_staminup", &function_97cc5591);
}

/*
	Name: function_97cc5591
	Namespace: zm_perk_staminup
	Checksum: 0xB58F42D2
	Offset: 0x2A8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 88
*/
function function_97cc5591()
{
	level._effect["specialty_staminup"] = "harry/zm_perks/fx_perk_stamin_up";
}

/*
	Name: staminup_client_field_func
	Namespace: zm_perk_staminup
	Checksum: 0xF874500D
	Offset: 0x2D0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 103
*/
function staminup_client_field_func()
{
	clientfield::register("clientuimodel", "hudItems.perks.marathon", 1, 2, "int", undefined, 0, 1);
	return;
	~;
}

/*
	Name: staminup_callback_func
	Namespace: zm_perk_staminup
	Checksum: 0x9ACF73B8
	Offset: 0x318
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function staminup_callback_func()
{
}

/*
	Name: function_6c3e53e0
	Namespace: zm_perk_staminup
	Checksum: 0x9ACF73B8
	Offset: 0x328
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 134
*/
function function_6c3e53e0()
{
}

