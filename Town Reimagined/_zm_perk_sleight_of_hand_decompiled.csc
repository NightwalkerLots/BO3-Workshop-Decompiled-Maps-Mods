#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace zm_perk_sleight_of_hand;

/*
	Name: __init__sytem__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xE47BEF43
	Offset: 0x1D0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_sleight_of_hand", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x13A90277
	Offset: 0x210
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 34
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
	Name: enable_sleight_of_hand_perk_for_level
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x695D675F
	Offset: 0x248
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 53
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
	Checksum: 0x369BBF6B
	Offset: 0x2D8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function init_sleight_of_hand()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_fastreload"] = "zombie/fx_perk_sleight_of_hand_zmb";
		continue;
	}
	level._effect["specialty_fastreload"] = "zombie/fx_perk_sleight_of_hand_factory_zmb";
	return;
	.var_60707e62 = undefined;
}

/*
	Name: sleight_of_hand_client_field_func
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x9ACF73B8
	Offset: 0x380
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 95
*/
function sleight_of_hand_client_field_func()
{
}

/*
	Name: sleight_of_hand_code_callback_func
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x9ACF73B8
	Offset: 0x390
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 109
*/
function sleight_of_hand_code_callback_func()
{
}

