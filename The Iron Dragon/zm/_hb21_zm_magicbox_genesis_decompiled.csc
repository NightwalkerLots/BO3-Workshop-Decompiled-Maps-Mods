#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_magicbox;

#namespace namespace_b5c890bc;

/*
	Name: __init__sytem__
	Namespace: namespace_b5c890bc
	Checksum: 0xA20E254A
	Offset: 0x1D8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_magicbox_genesis", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b5c890bc
	Checksum: 0x5E8F9946
	Offset: 0x220
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	clientfield::register("zbarrier", "genesis_magicbox_open_glow", 1, 1, "int", &function_965c888d, 0, 0);
	clientfield::register("zbarrier", "genesis_magicbox_closed_glow", 1, 1, "int", &function_b0149539, 0, 0);
	level._effect["genesis_chest_light"] = "zombie/fx_weapon_box_open_glow_genesis";
	level._effect["genesis_chest_light_closed"] = "zombie/fx_weapon_box_closed_glow_genesis";
	return;
}

/*
	Name: __main__
	Namespace: namespace_b5c890bc
	Checksum: 0x9ACF73B8
	Offset: 0x2F8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function __main__()
{
}

/*
	Name: function_b0149539
	Namespace: namespace_b5c890bc
	Checksum: 0x9DF10B43
	Offset: 0x308
	Size: 0x70
	Parameters: 7
	Flags: None
	Line Number: 65
*/
function function_b0149539(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	self thread zm_magicbox::magicbox_glow_callback(var_3d850ea0, var_6998917a, level._effect["genesis_chest_light_closed"]);
}

/*
	Name: function_965c888d
	Namespace: namespace_b5c890bc
	Checksum: 0x884A5A41
	Offset: 0x380
	Size: 0x6C
	Parameters: 7
	Flags: None
	Line Number: 80
*/
function function_965c888d(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	self thread zm_magicbox::magicbox_glow_callback(var_3d850ea0, var_6998917a, level._effect["genesis_chest_light"]);
}

