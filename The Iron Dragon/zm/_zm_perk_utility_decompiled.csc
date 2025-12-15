#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;

#namespace namespace_b8afaefc;

/*
	Name: __init__sytem__
	Namespace: namespace_b8afaefc
	Checksum: 0x68CC53D8
	Offset: 0x218
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_utility", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b8afaefc
	Checksum: 0x88F46BF5
	Offset: 0x258
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	clientfield::register("scriptmover", "remove_objective_id", 1, GetMinBitCountForNum(1), "int", &function_61f0038d, 0, 0);
	clientfield::register("scriptmover", "set_objective_id", 1, GetMinBitCountForNum(128), "int", &function_2bd6017c, 0, 0);
	clientfield::register("zbarrier", "remove_objective_id", 1, GetMinBitCountForNum(1), "int", &function_61f0038d, 0, 0);
	clientfield::register("zbarrier", "set_objective_id", 1, GetMinBitCountForNum(128), "int", &function_2bd6017c, 0, 0);
	callback::on_localplayer_spawned(&on_localplayer_spawned);
	level.var_7390523c = [];
	level.var_7390523c[0] = [];
	level.var_7390523c[1] = [];
}

/*
	Name: function_fc92a42d
	Namespace: namespace_b8afaefc
	Checksum: 0xB9BBF1DF
	Offset: 0x410
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function function_fc92a42d()
{
	script = ToLower(GetDvarString("mapname"));
	switch(script)
	{
		case "zm_asylum":
		case "zm_castle":
		case "zm_cosmodrome":
		case "zm_factory":
		case "zm_genesis":
		case "zm_island":
		case "zm_moon":
		case "zm_prototype":
		case "zm_stalingrad":
		case "zm_sumpf":
		case "zm_temple":
		case "zm_theater":
		case "zm_tomb":
		case "zm_zod":
		{
			return 1;
		}
		default
		{
			return 0;
		}
	}
}

/*
	Name: on_localplayer_spawned
	Namespace: namespace_b8afaefc
	Checksum: 0x8C843E11
	Offset: 0x4E8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 94
*/
function on_localplayer_spawned(var_8ac4743c)
{
	self thread function_93c2d353(var_8ac4743c);
}

/*
	Name: function_93c2d353
	Namespace: namespace_b8afaefc
	Checksum: 0x2064819A
	Offset: 0x518
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 109
*/
function function_93c2d353(var_8ac4743c)
{
	self notify("hash_93c2d353");
	self endon("hash_93c2d353");
	self endon("disconnect");
	self endon("death");
	while(isdefined(self))
	{
		function_7043a5f0(var_8ac4743c);
		wait(0.016);
	}
}

/*
	Name: function_61f0038d
	Namespace: namespace_b8afaefc
	Checksum: 0xAC8940FD
	Offset: 0x588
	Size: 0xC0
	Parameters: 7
	Flags: None
	Line Number: 132
*/
function function_61f0038d(var_8ac4743c, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, var_c3bd3206)
{
	str_field_name = "objective" + self.n_obj_id;
	SetUIModelValue(GetUIModel(GetUIModelForController(var_8ac4743c), str_field_name + ".priority"), -100);
	ArrayRemoveValue(level.var_7390523c[var_8ac4743c], self);
}

/*
	Name: function_2bd6017c
	Namespace: namespace_b8afaefc
	Checksum: 0xADDB50E6
	Offset: 0x650
	Size: 0xD0
	Parameters: 7
	Flags: None
	Line Number: 149
*/
function function_2bd6017c(var_8ac4743c, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, var_c3bd3206)
{
	self.n_obj_id = var_ee3cd374;
	level.var_7390523c[var_8ac4743c][level.var_7390523c[var_8ac4743c].size] = self;
	str_field_name = "objective" + self.n_obj_id;
	SetUIModelValue(CreateUIModel(GetUIModelForController(var_8ac4743c), str_field_name + ".priority"), -100);
}

/*
	Name: function_7043a5f0
	Namespace: namespace_b8afaefc
	Checksum: 0xF5597D82
	Offset: 0x728
	Size: 0x236
	Parameters: 1
	Flags: None
	Line Number: 167
*/
function function_7043a5f0(var_8ac4743c)
{
	var_7390523c[var_8ac4743c] = Array::get_all_closest(GetLocalPlayers()[var_8ac4743c].origin, level.var_7390523c[var_8ac4743c]);
	if(isdefined(level.var_7390523c[var_8ac4743c]) && IsArray(level.var_7390523c[var_8ac4743c]) && level.var_7390523c[var_8ac4743c].size > 0)
	{
		for(i = 0; i < var_7390523c[var_8ac4743c].size; i++)
		{
			str_field_name = "objective" + var_7390523c[var_8ac4743c][i].n_obj_id;
			SetUIModelValue(GetUIModel(GetUIModelForController(var_8ac4743c), str_field_name + ".priority"), -100);
		}
		var_a8564a44 = -1;
		for(i = 0; i < var_7390523c[var_8ac4743c].size; i++)
		{
			if(!isdefined(var_7390523c[var_8ac4743c][i].n_obj_id))
			{
				continue;
			}
			str_field_name = "objective" + var_7390523c[var_8ac4743c][i].n_obj_id;
			SetUIModelValue(GetUIModel(GetUIModelForController(var_8ac4743c), str_field_name + ".priority"), var_a8564a44);
			var_a8564a44 = var_a8564a44 - 1;
		}
	}
}

