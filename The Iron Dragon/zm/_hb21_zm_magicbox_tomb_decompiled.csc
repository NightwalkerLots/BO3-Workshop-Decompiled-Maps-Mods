#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_magicbox;

#namespace namespace_5a18af94;

/*
	Name: __init__sytem__
	Namespace: namespace_5a18af94
	Checksum: 0xA3F6C37E
	Offset: 0x3B8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_magicbox_tomb", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_5a18af94
	Checksum: 0xFAB20DFE
	Offset: 0x400
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	clientfield::register("zbarrier", "tomb_magicbox_initial_fx", 1, 1, "int", &function_a8288a68, 0, 0);
	clientfield::register("zbarrier", "tomb_magicbox_amb_fx", 1, 2, "int", &function_6e12e800, 0, 0);
	clientfield::register("zbarrier", "tomb_magicbox_open_fx", 1, 1, "int", &function_9329536e, 0, 0);
	clientfield::register("zbarrier", "tomb_magicbox_leaving_fx", 1, 1, "int", &function_3f2ef8f8, 0, 0);
	level._effect["box_powered"] = "dlc5/tomb/fx_tomb_magicbox_on";
	level._effect["box_unpowered"] = "dlc5/tomb/fx_tomb_magicbox_off";
	level._effect["box_gone_ambient"] = "dlc5/tomb/fx_tomb_magicbox_amb_base";
	level._effect["box_here_ambient"] = "dlc5/tomb/fx_tomb_magicbox_amb_slab";
	level._effect["box_is_open"] = "dlc5/tomb/fx_tomb_magicbox_open";
	level._effect["box_is_open_beam_left"] = "dlc5/tomb/fx_tomb_magicbox_beam_tgt_left";
	level._effect["box_is_open_beam_right"] = "dlc5/tomb/fx_tomb_magicbox_beam_tgt_right";
	level._effect["box_portal"] = "dlc5/tomb/fx_tomb_magicbox_portal";
	level._effect["box_is_leaving"] = "dlc5/tomb/fx_tomb_magicbox_leave";
}

/*
	Name: __main__
	Namespace: namespace_5a18af94
	Checksum: 0x9ACF73B8
	Offset: 0x628
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 59
*/
function __main__()
{
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_3f2ef8f8
	Namespace: namespace_5a18af94
	Checksum: 0xFE515632
	Offset: 0x638
	Size: 0x118
	Parameters: 7
	Flags: None
	Line Number: 76
*/
function function_3f2ef8f8(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!isdefined(self.fx_obj))
	{
		self.fx_obj = util::spawn_model(var_3d850ea0, "tag_origin", self.origin, self.angles);
	}
	if(isdefined(self.fx_obj.var_6217501d))
	{
		stopfx(var_3d850ea0, self.fx_obj.var_6217501d);
		self.fx_obj.var_6217501d = undefined;
	}
	if(var_6998917a)
	{
		self.fx_obj.var_6217501d = PlayFXOnTag(var_3d850ea0, level._effect["box_is_leaving"], self.fx_obj, "tag_origin");
		return;
	}
}

/*
	Name: function_9329536e
	Namespace: namespace_5a18af94
	Checksum: 0xBD86E982
	Offset: 0x758
	Size: 0x188
	Parameters: 7
	Flags: None
	Line Number: 104
*/
function function_9329536e(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!isdefined(self.fx_obj))
	{
		self.fx_obj = util::spawn_model(var_3d850ea0, "tag_origin", self.origin, self.angles);
	}
	if(!var_6998917a)
	{
		stopfx(var_3d850ea0, self.fx_obj.var_80194315);
		self.fx_obj StopLoopSound(self.fx_obj.var_51de95c1, 1);
		self notify("hash_90e6e5c7");
	}
	else if(var_6998917a)
	{
		self.fx_obj.var_80194315 = PlayFXOnTag(var_3d850ea0, level._effect["box_is_open"], self.fx_obj, "tag_origin");
		self.fx_obj.var_51de95c1 = self.fx_obj PlayLoopSound(" zmb_hellbox_open_effect");
		self thread function_b714c89b(var_3d850ea0);
	}
}

/*
	Name: function_b714c89b
	Namespace: namespace_5a18af94
	Checksum: 0x9203006F
	Offset: 0x8E8
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 134
*/
function function_b714c89b(var_3d850ea0)
{
	wait(0.5);
	self.fx_obj.var_a5875243 = PlayFXOnTag(var_3d850ea0, level._effect["box_portal"], self.fx_obj, "tag_origin");
	self waittill("hash_90e6e5c7");
	stopfx(var_3d850ea0, self.fx_obj.var_a5875243);
}

/*
	Name: function_a8288a68
	Namespace: namespace_5a18af94
	Checksum: 0x94ECE92E
	Offset: 0x980
	Size: 0x108
	Parameters: 7
	Flags: None
	Line Number: 152
*/
function function_a8288a68(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!isdefined(self.fx_obj))
	{
		self.fx_obj = util::spawn_model(var_3d850ea0, "tag_origin", self.origin, self.angles);
	}
	if(isdefined(self.fx_obj.var_e4e4bc8e))
	{
		self.fx_obj StopLoopSound(self.fx_obj.var_e4e4bc8e, 1);
		self.fx_obj.var_e4e4bc8e = undefined;
	}
	if(var_6998917a)
	{
		self.fx_obj.var_e4e4bc8e = self.fx_obj PlayLoopSound("zmb_hellbox_amb_low");
		return;
	}
}

/*
	Name: function_6e12e800
	Namespace: namespace_5a18af94
	Checksum: 0xCDC16E62
	Offset: 0xA90
	Size: 0x4EC
	Parameters: 7
	Flags: None
	Line Number: 180
*/
function function_6e12e800(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!isdefined(self.fx_obj))
	{
		self.fx_obj = util::spawn_model(var_3d850ea0, "tag_origin", self.origin, self.angles);
	}
	if(isdefined(self.fx_obj.var_e4e4bc8e))
	{
		self.fx_obj StopLoopSound(self.fx_obj.var_e4e4bc8e, 1);
		self.fx_obj.var_e4e4bc8e = undefined;
	}
	if(isdefined(self.fx_obj.var_992b4eed))
	{
		stopfx(var_3d850ea0, self.fx_obj.var_992b4eed);
		self.fx_obj.var_992b4eed = undefined;
	}
	if(isdefined(self.fx_obj.var_9eb800bb))
	{
		stopfx(var_3d850ea0, self.fx_obj.var_9eb800bb);
		self.fx_obj.var_9eb800bb = undefined;
	}
	if(var_6998917a == 0)
	{
		self.fx_obj.var_e4e4bc8e = self.fx_obj PlayLoopSound("zmb_hellbox_amb_low");
		playsound(0, "zmb_hellbox_leave", self.fx_obj.origin);
		stopfx(var_3d850ea0, self.fx_obj.var_992b4eed);
	}
	else if(var_6998917a == 1)
	{
		self.fx_obj.var_9eb800bb = PlayFXOnTag(var_3d850ea0, level._effect["box_unpowered"], self.fx_obj, "tag_origin");
		self.fx_obj.var_992b4eed = PlayFXOnTag(var_3d850ea0, level._effect["box_here_ambient"], self.fx_obj, "tag_origin");
		self.fx_obj.var_e4e4bc8e = self.fx_obj PlayLoopSound("zmb_hellbox_amb_low");
		playsound(0, "zmb_hellbox_arrive", self.fx_obj.origin);
	}
	else if(var_6998917a == 2)
	{
		self.fx_obj.var_9eb800bb = PlayFXOnTag(var_3d850ea0, level._effect["box_powered"], self.fx_obj, "tag_origin");
		self.fx_obj.var_992b4eed = PlayFXOnTag(var_3d850ea0, level._effect["box_here_ambient"], self.fx_obj, "tag_origin");
		self.fx_obj.var_e4e4bc8e = self.fx_obj PlayLoopSound("zmb_hellbox_amb_high");
		playsound(0, "zmb_hellbox_arrive", self.fx_obj.origin);
	}
	else if(var_6998917a == 3)
	{
		self.fx_obj.var_9eb800bb = PlayFXOnTag(var_3d850ea0, level._effect["box_unpowered"], self.fx_obj, "tag_origin");
		self.fx_obj.var_992b4eed = PlayFXOnTag(var_3d850ea0, level._effect["box_gone_ambient"], self.fx_obj, "tag_origin");
		self.fx_obj.var_e4e4bc8e = self.fx_obj PlayLoopSound("zmb_hellbox_amb_high");
		playsound(0, "zmb_hellbox_leave", self.fx_obj.origin);
	}
}

