#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_deadshot;

/*
	Name: __init__sytem__
	Namespace: zm_perk_deadshot
	Checksum: 0x93F86178
	Offset: 0x1B8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_deadshot", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_deadshot
	Checksum: 0x84444E3B
	Offset: 0x200
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_deadshot_perk_for_level();
	}
}

/*
	Name: __main__
	Namespace: zm_perk_deadshot
	Checksum: 0x5DC27B47
	Offset: 0x238
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_69a73be1();
	}
}

/*
	Name: enable_deadshot_perk_for_level
	Namespace: zm_perk_deadshot
	Checksum: 0xE4E0B622
	Offset: 0x270
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function enable_deadshot_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_deadshot", &deadshot_client_field_func, &deadshot_code_callback_func);
	zm_perks::register_perk_effects("specialty_deadshot", "specialty_deadshot");
	zm_perks::register_perk_init_thread("specialty_deadshot", &function_a19da408);
}

/*
	Name: function_a19da408
	Namespace: zm_perk_deadshot
	Checksum: 0x46BFD8CE
	Offset: 0x300
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 86
*/
function function_a19da408()
{
	level._effect["specialty_deadshot"] = "harry/zm_perks/fx_perk_daiquiri_light";
	return;
}

/*
	Name: deadshot_client_field_func
	Namespace: zm_perk_deadshot
	Checksum: 0x4DAEC235
	Offset: 0x328
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function deadshot_client_field_func()
{
	clientfield::register("clientuimodel", "hudItems.perks.dead_shot", 1, 2, "int", undefined, 0, 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: deadshot_code_callback_func
	Namespace: zm_perk_deadshot
	Checksum: 0x9ACF73B8
	Offset: 0x370
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 119
*/
function deadshot_code_callback_func()
{
}

/*
	Name: function_69a73be1
	Namespace: zm_perk_deadshot
	Checksum: 0x91D35650
	Offset: 0x380
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 133
*/
function function_69a73be1()
{
	clientfield::register("clientuimodel", "dead_shot_ui_glow", 1, 1, "int", undefined, 0, 1);
	clientfield::register("toplayer", "deadshot_perk", 1, 1, "int", &function_45926e63, 0, 1);
}

/*
	Name: function_45926e63
	Namespace: zm_perk_deadshot
	Checksum: 0xA48BDCB0
	Offset: 0x410
	Size: 0x104
	Parameters: 7
	Flags: None
	Line Number: 149
*/
function function_45926e63(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!self isLocalPlayer() || IsSpectating(var_3d850ea0, 0) || (isdefined(level.localPlayers[var_3d850ea0]) && self GetEntityNumber() != level.localPlayers[var_3d850ea0] GetEntityNumber()))
	{
		return;
	}
	if(isdefined(var_6998917a) && var_6998917a)
	{
		self UseAlternateAimParams();
		continue;
	}
	self ClearAlternateAimParams();
}

