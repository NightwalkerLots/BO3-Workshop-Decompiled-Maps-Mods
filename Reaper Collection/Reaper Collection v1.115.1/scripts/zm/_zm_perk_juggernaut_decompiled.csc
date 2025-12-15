#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_juggernaut;

/*
	Name: __init__sytem__
	Namespace: zm_perk_juggernaut
	Checksum: 0x424F4353
	Offset: 0x1B0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_juggernaut", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_juggernaut
	Checksum: 0x424F4353
	Offset: 0x1F0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_armorvest", &juggernaut_client_field_func, &juggernaut_code_callback_func);
	zm_perks::register_perk_effects("specialty_armorvest", "zombie/fx_perk_quick_revive_zmb");
	zm_perks::register_perk_init_thread("specialty_armorvest", &init_juggernaut);
}

/*
	Name: init_juggernaut
	Namespace: zm_perk_juggernaut
	Checksum: 0x424F4353
	Offset: 0x280
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function init_juggernaut()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		level._effect["jugger_light"] = "zombie/fx_perk_quick_revive_zmb";
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["p7_zm_vending_jugg"] = "specialty_armorvest";
			level.var_9438a32d["p7_zm_vending_jugg"] = "specialty_armorvest";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_armorvest"]))
			{
				level._effect["vulture_waypoint_" + "specialty_armorvest"] = "vulture_fx/vulture_waypoint_" + "specialty_armorvest";
			}
		}
	}
}

/*
	Name: juggernaut_client_field_func
	Namespace: zm_perk_juggernaut
	Checksum: 0x424F4353
	Offset: 0x360
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function juggernaut_client_field_func()
{
	return;
	ERROR: Bad function call
}

/*
	Name: juggernaut_code_callback_func
	Namespace: zm_perk_juggernaut
	Checksum: 0x424F4353
	Offset: 0x370
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function juggernaut_code_callback_func()
{
}

