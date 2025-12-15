#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_magicbox;

#namespace namespace_7c0862bf;

/*
	Name: __init__sytem__
	Namespace: namespace_7c0862bf
	Checksum: 0xEE86EE89
	Offset: 0x200
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_magicbox_botd", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_7c0862bf
	Checksum: 0x471577F9
	Offset: 0x248
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	clientfield::register("zbarrier", "motd_magicbox_open_fx", 1, 1, "int", &function_e4422764, 0, 0);
	clientfield::register("zbarrier", "motd_magicbox_amb_fx", 1, 2, "int", &function_7a22836e, 0, 0);
	level._effect["motd_box_open"] = "harry/motd_mysterybox/fx_motd_mystery_box_use";
	level._effect["motd_box_amb"] = "harry/motd_mysterybox/fx_motd_mystery_box_loop";
}

/*
	Name: __main__
	Namespace: namespace_7c0862bf
	Checksum: 0x9ACF73B8
	Offset: 0x320
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function __main__()
{
}

/*
	Name: function_e4422764
	Namespace: namespace_7c0862bf
	Checksum: 0x2907AD5D
	Offset: 0x330
	Size: 0x70
	Parameters: 7
	Flags: None
	Line Number: 64
*/
function function_e4422764(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	self thread zm_magicbox::magicbox_glow_callback(var_3d850ea0, var_6998917a, level._effect["motd_box_open"]);
}

/*
	Name: function_7a22836e
	Namespace: namespace_7c0862bf
	Checksum: 0xCFD365DA
	Offset: 0x3A8
	Size: 0x1DC
	Parameters: 7
	Flags: None
	Line Number: 79
*/
function function_7a22836e(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!isdefined(self.fx_obj))
	{
		self.fx_obj = util::spawn_model(var_3d850ea0, "tag_origin", self.origin, self.angles);
	}
	if(isdefined(self.fx_obj.var_992b4eed))
	{
		stopfx(var_3d850ea0, self.fx_obj.var_992b4eed);
		self.fx_obj.var_992b4eed = undefined;
	}
	if(isdefined(self.fx_obj.var_8c5dd450))
	{
		self.fx_obj StopLoopSound(self.fx_obj.var_8c5dd450, 1);
		self.fx_obj.var_8c5dd450 = undefined;
	}
	if(var_6998917a == 1)
	{
		self.fx_obj.var_8c5dd450 = self.fx_obj PlayLoopSound("zmb_motd_magicbox_loop_low");
	}
	else if(var_6998917a == 2)
	{
		self.fx_obj.var_992b4eed = PlayFXOnTag(var_3d850ea0, level._effect["motd_box_amb"], self.fx_obj, "tag_origin");
		self.fx_obj.var_8c5dd450 = self.fx_obj PlayLoopSound("zmb_motd_magicbox_loop_high");
	}
}

