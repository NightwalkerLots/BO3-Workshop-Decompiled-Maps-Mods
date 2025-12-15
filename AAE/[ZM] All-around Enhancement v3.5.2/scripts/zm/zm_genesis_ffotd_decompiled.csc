#include scripts\codescripts\struct;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_utility;

#namespace namespace_b6963cd7;

/*
	Name: main_start
	Namespace: namespace_b6963cd7
	Checksum: 0x424F4353
	Offset: 0x1A8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 22
*/
function main_start()
{
	ai::add_archetype_spawn_function("keeper_companion", &function_a4f69458);
}

/*
	Name: main_end
	Namespace: namespace_b6963cd7
	Checksum: 0x424F4353
	Offset: 0x1E0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function main_end()
{
	return;
	.var_0 = undefined;
}

/*
	Name: function_a4f69458
	Namespace: namespace_b6963cd7
	Checksum: 0x424F4353
	Offset: 0x1F0
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 53
*/
function function_a4f69458(localClientNum)
{
	level.var_e7aa252c = self;
}

