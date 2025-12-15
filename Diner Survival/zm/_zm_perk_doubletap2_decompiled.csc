#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_doubletap2;

/*
	Name: __init__sytem__
	Namespace: zm_perk_doubletap2
	Checksum: 0xE7205880
	Offset: 0x1A0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_doubletap2", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_doubletap2
	Checksum: 0x88742885
	Offset: 0x1E0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	enable_doubletap2_perk_for_level();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: enable_doubletap2_perk_for_level
	Namespace: zm_perk_doubletap2
	Checksum: 0xDA8CD1DB
	Offset: 0x200
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function enable_doubletap2_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_doubletap2", &doubletap2_client_field_func, &doubletap2_code_callback_func);
	zm_perks::register_perk_effects("specialty_doubletap2", "doubletap2_light");
	zm_perks::register_perk_init_thread("specialty_doubletap2", &init_doubletap2);
}

/*
	Name: init_doubletap2
	Namespace: zm_perk_doubletap2
	Checksum: 0x262D5910
	Offset: 0x290
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 67
*/
function init_doubletap2()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		level._effect["doubletap2_light"] = "zombie/fx_perk_doubletap2_zmb";
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: doubletap2_client_field_func
	Namespace: zm_perk_doubletap2
	Checksum: 0xA13FA885
	Offset: 0x2D0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function doubletap2_client_field_func()
{
	clientfield::register("clientuimodel", "hudItems.perks.doubletap2", 1, 2, "int", undefined, 0, 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: doubletap2_code_callback_func
	Namespace: zm_perk_doubletap2
	Checksum: 0x9ACF73B8
	Offset: 0x318
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function doubletap2_code_callback_func()
{
}

