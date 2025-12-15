#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_random;
#include scripts\zm\_zm_perks;

#namespace zm_perk_phdflopper;

/*
	Name: __init__sytem__
	Namespace: zm_perk_phdflopper
	Checksum: 0x235B4592
	Offset: 0x1C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_phdflopper", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_phdflopper
	Checksum: 0xCEE3685D
	Offset: 0x208
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_phdflopper", &function_7941370e, &function_74e43265);
	zm_perks::register_perk_effects("specialty_phdflopper", "vending_phd_light");
	zm_perks::register_perk_init_thread("specialty_phdflopper", &init_phd_flopper);
	return;
}

/*
	Name: init_phd_flopper
	Namespace: zm_perk_phdflopper
	Checksum: 0x2D9DE1B
	Offset: 0x298
	Size: 0x38
	Parameters: 0
	Flags: Private
	Line Number: 52
*/
function private init_phd_flopper()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		level._effect["vending_phd_light"] = "_mikeyray/perks/phd/fx_perk_phd";
	}
}

/*
	Name: function_7941370e
	Namespace: zm_perk_phdflopper
	Checksum: 0x4AB939E8
	Offset: 0x2D8
	Size: 0x40
	Parameters: 0
	Flags: Private
	Line Number: 70
*/
function private function_7941370e()
{
	clientfield::register("clientuimodel", "hudItems.perks.phdflopper", 1, 2, "int", undefined, 0, 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_74e43265
	Namespace: zm_perk_phdflopper
	Checksum: 0x9ACF73B8
	Offset: 0x320
	Size: 0x4
	Parameters: 0
	Flags: Private
	Line Number: 87
*/
function private function_74e43265()
{
}

