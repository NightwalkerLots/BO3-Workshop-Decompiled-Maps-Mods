#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_hb21_zm_magicbox_botd;
#include scripts\zm\_hb21_zm_magicbox_chaos;
#include scripts\zm\_hb21_zm_magicbox_genesis;
#include scripts\zm\_hb21_zm_magicbox_soe;
#include scripts\zm\_hb21_zm_magicbox_tomb;
#include scripts\zm\_zm_magicbox;

#namespace namespace_f6cf66d3;

/*
	Name: __init__sytem__
	Namespace: namespace_f6cf66d3
	Checksum: 0x6556EE73
	Offset: 0x260
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_magicbox", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_f6cf66d3
	Checksum: 0xC9EA7FF7
	Offset: 0x2A8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	clientfield::register("zbarrier", "default_zbarrier_show_sounds", 1, 1, "counter", &magicbox_show_sounds_callback, 0, 0);
	clientfield::register("zbarrier", "default_zbarrier_leave_sounds", 1, 1, "counter", &magicbox_leave_sounds_callback, 0, 0);
}

/*
	Name: __main__
	Namespace: namespace_f6cf66d3
	Checksum: 0x9ACF73B8
	Offset: 0x348
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function __main__()
{
}

/*
	Name: magicbox_show_sounds_callback
	Namespace: namespace_f6cf66d3
	Checksum: 0xDDAC3E2C
	Offset: 0x358
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 67
*/
function magicbox_show_sounds_callback(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	playsound(var_3d850ea0, "zmb_box_poof_land2", self.origin);
	playsound(var_3d850ea0, "zmb_couch_slam2", self.origin);
	playsound(var_3d850ea0, "zmb_box_poof2", self.origin);
}

/*
	Name: magicbox_leave_sounds_callback
	Namespace: namespace_f6cf66d3
	Checksum: 0x7800016A
	Offset: 0x418
	Size: 0x8C
	Parameters: 7
	Flags: None
	Line Number: 84
*/
function magicbox_leave_sounds_callback(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	playsound(var_3d850ea0, "zmb_box_move2", self.origin);
	playsound(var_3d850ea0, "zmb_whoosh2", self.origin);
}

