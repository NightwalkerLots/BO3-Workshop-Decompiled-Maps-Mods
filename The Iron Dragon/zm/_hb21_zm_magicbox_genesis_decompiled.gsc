#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;

#namespace namespace_b5c890bc;

/*
	Name: __init__sytem__
	Namespace: namespace_b5c890bc
	Checksum: 0x41D32C36
	Offset: 0x298
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_magicbox_genesis", &__init__, &__main__, undefined);
	return;
	ERROR: Bad function call
}

/*
	Name: __init__
	Namespace: namespace_b5c890bc
	Checksum: 0x20FF7C1
	Offset: 0x2E0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	if(!isdefined(level.var_ef01f1df))
	{
		level.var_ef01f1df = [];
	}
	clientfield::register("zbarrier", "genesis_magicbox_open_glow", 1, 1, "int");
	clientfield::register("zbarrier", "genesis_magicbox_closed_glow", 1, 1, "int");
	level._effect["genesis_light_marker"] = "zombie/fx_weapon_box_marker_genesis";
	if(isdefined(level.var_ef01f1df["zbarrier_zmcore_magicbox_genesis"]))
	{
		return;
	}
	s_struct = spawnstruct();
	s_struct.var_7b8dbea1 = &function_a2e128fd;
	s_struct.var_779d45c = &function_a9c0d6f0;
	s_struct.var_d31d4f9b = &function_c59237a7;
	s_struct.var_b498419b = &function_f3bb81f1;
	level.var_ef01f1df["zbarrier_zmcore_magicbox_genesis"] = s_struct;
}

/*
	Name: __main__
	Namespace: namespace_b5c890bc
	Checksum: 0x9ACF73B8
	Offset: 0x430
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function __main__()
{
	return;
}

/*
	Name: function_a2e128fd
	Namespace: namespace_b5c890bc
	Checksum: 0xF4C658E1
	Offset: 0x440
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 85
*/
function function_a2e128fd(b_hide)
{
	if(b_hide)
	{
		continue;
	}
}

/*
	Name: function_a9c0d6f0
	Namespace: namespace_b5c890bc
	Checksum: 0x80B8D2E5
	Offset: 0x460
	Size: 0x40
	Parameters: 3
	Flags: None
	Line Number: 103
*/
function function_a9c0d6f0(var_b1a4293e, var_491f1716, a_pieces)
{
	if(!isdefined(self.pandora_light))
	{
		self thread function_c59237a7();
	}
}

/*
	Name: function_c59237a7
	Namespace: namespace_b5c890bc
	Checksum: 0xD3832F9C
	Offset: 0x4A8
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 121
*/
function function_c59237a7()
{
	self endon("death");
	self.pandora_light = spawn("script_model", self.zbarrier.origin);
	self.pandora_light.angles = self.zbarrier.angles + VectorScale((-1, 0, -1), 90);
	self.pandora_light SetModel("tag_origin");
	if(!(isdefined(level._box_initialized) && level._box_initialized))
	{
		level flag::wait_till("start_zombie_round_logic");
		level._box_initialized = 1;
	}
	wait(1);
	if(isdefined(self) && isdefined(self.pandora_light))
	{
		PlayFXOnTag(level._effect["genesis_light_marker"], self.pandora_light, "tag_origin");
	}
}

/*
	Name: function_f3bb81f1
	Namespace: namespace_b5c890bc
	Checksum: 0x737D7F54
	Offset: 0x5D0
	Size: 0xC4
	Parameters: 0
	Flags: None
	Line Number: 149
*/
function function_f3bb81f1()
{
	self clientfield::set("genesis_magicbox_open_glow", 1);
	self clientfield::set("genesis_magicbox_closed_glow", 0);
	var_7b1cce72 = self util::waittill_any_return("weapon_grabbed", "box_moving");
	self clientfield::set("genesis_magicbox_open_glow", 0);
	if("box_moving" != var_7b1cce72)
	{
		self clientfield::set("genesis_magicbox_closed_glow", 1);
	}
}

