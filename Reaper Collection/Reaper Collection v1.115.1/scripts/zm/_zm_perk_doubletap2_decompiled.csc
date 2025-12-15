#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_doubletap2;

/*
	Name: __init__sytem__
	Namespace: zm_perk_doubletap2
	Checksum: 0x424F4353
	Offset: 0x1C0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_doubletap2", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: zm_perk_doubletap2
	Checksum: 0x424F4353
	Offset: 0x200
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	enable_doubletap2_perk_for_level();
}

/*
	Name: enable_doubletap2_perk_for_level
	Namespace: zm_perk_doubletap2
	Checksum: 0x424F4353
	Offset: 0x220
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function enable_doubletap2_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_doubletap2", &doubletap2_client_field_func, &doubletap2_code_callback_func);
	zm_perks::register_perk_effects("specialty_doubletap2", "zombie/fx_perk_quick_revive_zmb");
	zm_perks::register_perk_init_thread("specialty_doubletap2", &init_doubletap2);
}

/*
	Name: init_doubletap2
	Namespace: zm_perk_doubletap2
	Checksum: 0x424F4353
	Offset: 0x2B0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function init_doubletap2()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		level._effect["doubletap2_light"] = "zombie/fx_perk_quick_revive_zmb";
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["p7_zm_vending_doubletap2"] = "specialty_doubletap2";
			level.var_9438a32d["p7_zm_vending_doubletap2"] = "specialty_doubletap2";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_doubletap2"]))
			{
				level._effect["vulture_waypoint_" + "specialty_doubletap2"] = "vulture_fx/vulture_waypoint_" + "specialty_doubletap2";
			}
		}
	}
}

/*
	Name: doubletap2_client_field_func
	Namespace: zm_perk_doubletap2
	Checksum: 0x424F4353
	Offset: 0x390
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function doubletap2_client_field_func()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: doubletap2_code_callback_func
	Namespace: zm_perk_doubletap2
	Checksum: 0x424F4353
	Offset: 0x3A0
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 109
*/
function doubletap2_code_callback_func()
{
}

