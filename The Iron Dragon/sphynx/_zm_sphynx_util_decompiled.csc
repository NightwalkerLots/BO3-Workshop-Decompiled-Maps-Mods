#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace namespace_fc1667eb;

/*
	Name: __init__sytem__
	Namespace: namespace_fc1667eb
	Checksum: 0x9E727679
	Offset: 0x1E8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("zm_sphynx_util", &__init__, &__main__, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_fc1667eb
	Checksum: 0x9ACF73B8
	Offset: 0x230
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
}

/*
	Name: __main__
	Namespace: namespace_fc1667eb
	Checksum: 0x9ACF73B8
	Offset: 0x240
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function __main__()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_35bd70cb
	Namespace: namespace_fc1667eb
	Checksum: 0x9AB48DFE
	Offset: 0x250
	Size: 0x172
	Parameters: 6
	Flags: None
	Line Number: 69
*/
function function_35bd70cb(origin, angle, perk, model, parameters, string)
{
	struct = struct::spawn(origin, angle);
	struct.angles = angle;
	struct.targetname = "zm_perk_machine";
	if(isdefined(perk))
	{
		struct.script_noteworthy = perk;
	}
	if(isdefined(parameters))
	{
		struct.script_parameters = parameters;
	}
	if(isdefined(model))
	{
		struct.model = model;
	}
	if(isdefined(string))
	{
		struct.script_string = string;
	}
	if(!isdefined(level.struct_class_names["targetname"]["zm_perk_machine"]))
	{
		level.struct_class_names["targetname"]["zm_perk_machine"] = [];
	}
	level.struct_class_names["targetname"]["zm_perk_machine"][level.struct_class_names["targetname"]["zm_perk_machine"].size] = struct;
	return struct;
}

