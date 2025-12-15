#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_552d9932;

/*
	Name: __init__sytem__
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0x1D0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("NUKA_COLA", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0x210
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_nukacola", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_nukacola", "revive_light");
	zm_perks::register_perk_init_thread("specialty_nukacola", &function_d820cf1a);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0x2A0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["cz_zombie_vending_nuka_cola"] = "specialty_nukacola";
			level.var_9438a32d["cz_zombie_vending_nuka_cola_off"] = "specialty_nukacola";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_nukacola"]))
			{
				level._effect["vulture_waypoint_" + "specialty_nukacola"] = "vulture_fx/vulture_waypoint_" + "specialty_nukacola";
			}
		}
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0x360
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_124e3889()
{
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0x370
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 91
*/
function function_75dd2cd4()
{
}

