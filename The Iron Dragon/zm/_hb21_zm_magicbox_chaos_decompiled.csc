#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_magicbox;

#namespace namespace_97859df6;

/*
	Name: __init__sytem__
	Namespace: namespace_97859df6
	Checksum: 0xF3F9AD8A
	Offset: 0x508
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_magicbox_chaos", &__init__, &__main__, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_97859df6
	Checksum: 0xD5A170A9
	Offset: 0x550
	Size: 0x330
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	clientfield::register("zbarrier", "chaos_magicbox_amb_fx", 1, 2, "int", &function_b952db68, 0, 0);
	clientfield::register("zbarrier", "chaos_magicbox_debris_amb_fx", 1, 1, "int", &function_aeef8002, 0, 0);
	clientfield::register("zbarrier", "chaos_magicbox_open_fx", 1, 1, "int", &function_567dd5cf, 0, 0);
	clientfield::register("zbarrier", "chaos_magicbox_closed_fx", 1, 1, "int", &function_fcc49447, 0, 0);
	clientfield::register("zbarrier", "chaos_magicbox_leave_fx", 1, 1, "int", &function_509d124f, 0, 0);
	clientfield::register("zbarrier", "chaos_magicbox_arrive_fx", 1, 1, "int", &function_5e889721, 0, 0);
	clientfield::register("zbarrier", "chaos_magicbox_skull_fx", 1, 1, "int", &function_220e68cd, 0, 0);
	level._effect["chaos_box_blood"] = "harry/chaos_box/fx_chaos_box_blood_drip";
	level._effect["chaos_box_blue_eyes"] = "harry/chaos_box/fx_chaos_box_eye_blue_no_lf";
	level._effect["chaos_box_blue_lf_eyes"] = "harry/chaos_box/fx_chaos_box_eye_blue";
	level._effect["chaos_box_skull_eyes"] = "harry/chaos_box/fx_chaos_box_skull";
	level._effect["chaos_box_leave"] = "harry/chaos_box/fx_chaos_box_leave";
	level._effect["chaos_box_arrive"] = "harry/chaos_box/fx_chaos_box_arrive";
	level._effect["chaos_box_debris"] = "harry/chaos_box/fx_chaos_box_debris_glow";
	level._effect["chaos_box_lid"] = "harry/chaos_box/fx_chaos_box_lid_glow";
	level._effect["chaos_box_lid_drips"] = "harry/chaos_box/fx_chaos_box_lid_drips";
	level._effect["chaos_chest_light"] = "harry/chaos_box/fx_chaos_box_open_glow";
	level._effect["chaos_chest_light_closed"] = "harry/chaos_box/fx_chaos_box_closed_glow";
	return;
}

/*
	Name: __main__
	Namespace: namespace_97859df6
	Checksum: 0x9ACF73B8
	Offset: 0x888
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 67
*/
function __main__()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fcc49447
	Namespace: namespace_97859df6
	Checksum: 0xDDA1F029
	Offset: 0x898
	Size: 0x70
	Parameters: 7
	Flags: None
	Line Number: 83
*/
function function_fcc49447(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	self thread zm_magicbox::magicbox_glow_callback(var_3d850ea0, var_6998917a, level._effect["chaos_chest_light_closed"]);
}

/*
	Name: function_567dd5cf
	Namespace: namespace_97859df6
	Checksum: 0x5218854F
	Offset: 0x910
	Size: 0x120
	Parameters: 7
	Flags: None
	Line Number: 98
*/
function function_567dd5cf(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!isdefined(self.var_51de95c1))
	{
		self.var_51de95c1 = util::spawn_model(var_3d850ea0, "tag_origin", self.origin, self.angles);
	}
	if(var_6998917a)
	{
		self.var_51de95c1.snd = self.var_51de95c1 PlayLoopSound("zmb_chaos_magicbox_open_effect");
		continue;
	}
	self.var_51de95c1 StopLoopSound(self.var_51de95c1.snd, 1);
	self.var_51de95c1.snd = undefined;
	self thread zm_magicbox::magicbox_glow_callback(var_3d850ea0, var_6998917a, level._effect["chaos_chest_light"]);
}

/*
	Name: function_220e68cd
	Namespace: namespace_97859df6
	Checksum: 0xE875549
	Offset: 0xA38
	Size: 0xD8
	Parameters: 7
	Flags: None
	Line Number: 124
*/
function function_220e68cd(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(isdefined(self.var_115f4c00))
	{
		stopfx(var_3d850ea0, self.var_115f4c00);
	}
	if(isdefined(var_6998917a) && var_6998917a)
	{
		e_model = self ZBarrierGetPiece(3);
		self.var_115f4c00 = PlayFXOnTag(var_3d850ea0, level._effect["chaos_box_skull_eyes"], e_model, "tag_skull_jnt");
	}
}

/*
	Name: function_5e889721
	Namespace: namespace_97859df6
	Checksum: 0xF036056D
	Offset: 0xB18
	Size: 0x150
	Parameters: 7
	Flags: None
	Line Number: 147
*/
function function_5e889721(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!isdefined(self.fx_obj))
	{
		self.fx_obj = util::spawn_model(var_3d850ea0, "tag_origin", self.origin, self.angles);
	}
	if(isdefined(self.fx_obj.var_332d158c))
	{
		stopfx(var_3d850ea0, self.fx_obj.var_332d158c);
		self.fx_obj.var_332d158c = undefined;
	}
	if(isdefined(var_6998917a) && var_6998917a)
	{
		self.fx_obj.var_332d158c = PlayFXOnTag(var_3d850ea0, level._effect["chaos_box_arrive"], self.fx_obj, "tag_origin");
		playsound(0, "zmb_chaos_magicbox_arriving", self.fx_obj.origin);
	}
}

/*
	Name: function_509d124f
	Namespace: namespace_97859df6
	Checksum: 0xD4044631
	Offset: 0xC70
	Size: 0x150
	Parameters: 7
	Flags: None
	Line Number: 175
*/
function function_509d124f(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!isdefined(self.fx_obj))
	{
		self.fx_obj = util::spawn_model(var_3d850ea0, "tag_origin", self.origin, self.angles);
	}
	if(isdefined(self.fx_obj.var_ea3529ae))
	{
		stopfx(var_3d850ea0, self.fx_obj.var_ea3529ae);
		self.fx_obj.var_ea3529ae = undefined;
	}
	if(isdefined(var_6998917a) && var_6998917a)
	{
		self.fx_obj.var_ea3529ae = PlayFXOnTag(var_3d850ea0, level._effect["chaos_box_leave"], self.fx_obj, "tag_origin");
		playsound(0, "zmb_chaos_magicbox_leaving", self.fx_obj.origin);
	}
}

/*
	Name: function_a6438679
	Namespace: namespace_97859df6
	Checksum: 0xFA543CD1
	Offset: 0xDC8
	Size: 0x1B8
	Parameters: 3
	Flags: None
	Line Number: 203
*/
function function_a6438679(var_3d850ea0, n_model_index, var_9491b158)
{
	if(!isdefined(var_9491b158))
	{
		var_9491b158 = 0;
	}
	e_model = self ZBarrierGetPiece(n_model_index);
	for(i = 1; i < 19; i++)
	{
		if(i > 9)
		{
		}
		else if(var_9491b158)
		{
			continue;
		}
		self.var_572c2670[self.var_572c2670.size] = PlayFXOnTag(var_3d850ea0, level._effect["chaos_box_blue_eyes"], "chaos_box_blue_lf_eyes", "");
	}
	if(var_9491b158)
	{
		continue;
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
	if(var_9491b158)
	{
		continue;
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7f5497eb
	Namespace: namespace_97859df6
	Checksum: 0xA58BF751
	Offset: 0xF88
	Size: 0x140
	Parameters: 3
	Flags: None
	Line Number: 247
*/
function function_7f5497eb(var_3d850ea0, n_model_index, var_426c7d51)
{
	if(!isdefined(var_426c7d51))
	{
		var_426c7d51 = 0;
	}
	e_model = self ZBarrierGetPiece(n_model_index);
	for(i = 1; i < 5; i++)
	{
		self.var_572c2670[self.var_572c2670.size] = PlayFXOnTag(var_3d850ea0, level._effect["chaos_box_blood"], e_model, "tag_fx_mouth_0" + i);
	}
	if(!var_426c7d51)
	{
		return;
	}
	for(i = 5; i < 9; i++)
	{
		self.var_572c2670[self.var_572c2670.size] = PlayFXOnTag(var_3d850ea0, level._effect["chaos_box_blood"], e_model, "tag_fx_mouth_0" + i);
	}
}

/*
	Name: function_aeef8002
	Namespace: namespace_97859df6
	Checksum: 0xE0FD0C5
	Offset: 0x10D0
	Size: 0x128
	Parameters: 7
	Flags: None
	Line Number: 278
*/
function function_aeef8002(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!isdefined(self.fx_obj))
	{
		self.fx_obj = util::spawn_model(var_3d850ea0, "tag_origin", self.origin, self.angles);
	}
	if(isdefined(self.fx_obj.var_455d8e30))
	{
		stopfx(var_3d850ea0, self.fx_obj.var_ea3529ae);
		self.fx_obj.var_455d8e30 = undefined;
	}
	if(var_6998917a)
	{
		self.fx_obj.var_455d8e30 = PlayFXOnTag(var_3d850ea0, level._effect["chaos_box_debris"], self ZBarrierGetPiece(0), "tag_origin");
	}
}

/*
	Name: function_b952db68
	Namespace: namespace_97859df6
	Checksum: 0xE31A5F79
	Offset: 0x1200
	Size: 0x3FC
	Parameters: 7
	Flags: None
	Line Number: 305
*/
function function_b952db68(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!isdefined(self.var_572c2670))
	{
		self.var_572c2670 = [];
	}
	if(!isdefined(self.fx_obj))
	{
		self.fx_obj = util::spawn_model(var_3d850ea0, "tag_origin", self.origin, self.angles);
	}
	if(isdefined(self.var_572c2670) && IsArray(self.var_572c2670) && self.var_572c2670.size > 0)
	{
		for(i = 0; i < self.var_572c2670.size; i++)
		{
			stopfx(var_3d850ea0, self.var_572c2670[i]);
		}
		self.var_572c2670 = [];
	}
	self.var_572c2670[self.var_572c2670.size] = PlayFXOnTag(var_3d850ea0, level._effect["chaos_box_lid"], self ZBarrierGetPiece(1), "j_lid");
	self.var_572c2670[self.var_572c2670.size] = PlayFXOnTag(var_3d850ea0, level._effect["chaos_box_lid"], self ZBarrierGetPiece(2), "j_lid");
	self.var_572c2670[self.var_572c2670.size] = PlayFXOnTag(var_3d850ea0, level._effect["chaos_box_lid"], self ZBarrierGetPiece(5), "j_lid");
	if(var_6998917a == 1)
	{
		function_a6438679(var_3d850ea0, 1);
		function_a6438679(var_3d850ea0, 2);
		function_a6438679(var_3d850ea0, 5);
		function_7f5497eb(var_3d850ea0, 1, 1);
		function_7f5497eb(var_3d850ea0, 2, 1);
		function_7f5497eb(var_3d850ea0, 5, 1);
	}
	if(var_6998917a == 2)
	{
		self.var_572c2670[self.var_572c2670.size] = PlayFXOnTag(var_3d850ea0, level._effect["chaos_box_lid_drips"], self ZBarrierGetPiece(5), "j_lid");
		function_a6438679(var_3d850ea0, 1, 1);
		function_a6438679(var_3d850ea0, 2, 1);
		function_a6438679(var_3d850ea0, 5, 1);
		function_7f5497eb(var_3d850ea0, 1);
		function_7f5497eb(var_3d850ea0, 2);
		function_7f5497eb(var_3d850ea0, 5);
	}
}

