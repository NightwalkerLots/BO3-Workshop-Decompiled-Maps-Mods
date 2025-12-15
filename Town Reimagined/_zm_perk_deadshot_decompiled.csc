#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace zm_perk_deadshot;

/*
	Name: __init__sytem__
	Namespace: zm_perk_deadshot
	Checksum: 0x3573A113
	Offset: 0x1D0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_deadshot", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_deadshot
	Checksum: 0x42F0969E
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
		enable_deadshot_perk_for_level();
	}
}

/*
	Name: enable_deadshot_perk_for_level
	Namespace: zm_perk_deadshot
	Checksum: 0x1616C1B9
	Offset: 0x248
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function enable_deadshot_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_deadshot", &deadshot_client_field_func, &deadshot_code_callback_func);
	zm_perks::register_perk_effects("specialty_deadshot", "specialty_deadshot");
	zm_perks::register_perk_init_thread("specialty_deadshot", &function_a19da408);
	return;
	waittillframeend;
}

/*
	Name: function_a19da408
	Namespace: zm_perk_deadshot
	Checksum: 0xD0103EF6
	Offset: 0x2D8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function function_a19da408()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_deadshot"] = "zombie/fx_perk_daiquiri_zmb";
		continue;
	}
	level._effect["specialty_deadshot"] = "zombie/fx_perk_daiquiri_factory_zmb";
}

/*
	Name: deadshot_client_field_func
	Namespace: zm_perk_deadshot
	Checksum: 0xB216E956
	Offset: 0x380
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function deadshot_client_field_func()
{
	clientfield::register("toplayer", "deadshot_perk", 1, 1, "int", &function_45926e63, 0, 1);
}

/*
	Name: deadshot_code_callback_func
	Namespace: zm_perk_deadshot
	Checksum: 0x9ACF73B8
	Offset: 0x3D8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function deadshot_code_callback_func()
{
	return;
}

/*
	Name: function_45926e63
	Namespace: zm_perk_deadshot
	Checksum: 0xC8D13A4D
	Offset: 0x3E8
	Size: 0xF4
	Parameters: 7
	Flags: None
	Line Number: 122
*/
function function_45926e63(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(!self isLocalPlayer() || IsSpectating(localClientNum, 0) || (isdefined(level.localPlayers[localClientNum]) && self GetEntityNumber() != level.localPlayers[localClientNum] GetEntityNumber()))
	{
		return;
	}
	if(newVal)
	{
		self UseAlternateAimParams();
		continue;
	}
	self ClearAlternateAimParams();
}

