#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_magicbox;

#namespace namespace_92e7c3d1;

/*
	Name: __init__sytem__
	Namespace: namespace_92e7c3d1
	Checksum: 0x9DBCB5DE
	Offset: 0x230
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_magicbox_soe", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_92e7c3d1
	Checksum: 0xE95B76A6
	Offset: 0x278
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	clientfield::register("zbarrier", "soe_magicbox_initial_fx", 1, 1, "int", &function_7e86abb7, 0, 0);
	clientfield::register("zbarrier", "soe_magicbox_amb_sound", 1, 1, "int", &function_a10f6d0a, 0, 0);
	clientfield::register("zbarrier", "soe_magicbox_open_fx", 1, 3, "int", &function_1eeca523, 0, 0);
	level._effect["soe_box_open"] = "zombie/fx_weapon_box_open_zod_zmb";
	level._effect["soe_box_closed"] = "zombie/fx_weapon_box_closed_zod_zmb";
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __main__
	Namespace: namespace_92e7c3d1
	Checksum: 0x9ACF73B8
	Offset: 0x398
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function __main__()
{
}

/*
	Name: function_7e86abb7
	Namespace: namespace_92e7c3d1
	Checksum: 0x6392E6C3
	Offset: 0x3A8
	Size: 0xC0
	Parameters: 7
	Flags: None
	Line Number: 67
*/
function function_7e86abb7(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!isdefined(self.fx_obj))
	{
		self.fx_obj = util::spawn_model(var_3d850ea0, "tag_origin", self.origin, self.angles);
		continue;
		return;
	}
	if(var_6998917a)
	{
		self.fx_obj.var_a58f56b7 = self.fx_obj PlayLoopSound("zmb_hellbox_amb_low");
	}
}

/*
	Name: function_a10f6d0a
	Namespace: namespace_92e7c3d1
	Checksum: 0x2F7338E2
	Offset: 0x470
	Size: 0x1A8
	Parameters: 7
	Flags: None
	Line Number: 91
*/
function function_a10f6d0a(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!isdefined(self.fx_obj))
	{
		self.fx_obj = util::spawn_model(var_3d850ea0, "tag_origin", self.origin, self.angles);
	}
	if(isdefined(self.fx_obj.var_a58f56b7))
	{
		self.fx_obj StopLoopSound(self.fx_obj.var_a58f56b7, 1);
		self.fx_obj.var_a58f56b7 = undefined;
	}
	if(!var_6998917a)
	{
		self.fx_obj.var_a58f56b7 = self.fx_obj PlayLoopSound("zmb_hellbox_amb_low");
		playsound(0, "zmb_soe_magicbox_leave", self.fx_obj.origin);
	}
	else if(var_6998917a)
	{
		self.fx_obj.var_a58f56b7 = self.fx_obj PlayLoopSound("zmb_hellbox_amb_low");
		playsound(0, "zmb_soe_magicbox_arrive", self.fx_obj.origin);
	}
}

/*
	Name: function_1eeca523
	Namespace: namespace_92e7c3d1
	Checksum: 0x7BA26E69
	Offset: 0x620
	Size: 0x276
	Parameters: 7
	Flags: None
	Line Number: 124
*/
function function_1eeca523(var_3d850ea0, var_3bf16bb3, var_6998917a, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(!isdefined(self.fx_obj))
	{
		self.fx_obj = util::spawn_model(var_3d850ea0, "tag_origin", self.origin, self.angles);
	}
	if(!isdefined(self.var_51de95c1))
	{
		self.var_51de95c1 = util::spawn_model(var_3d850ea0, "tag_origin", self.origin, self.angles);
	}
	switch(var_6998917a)
	{
		case 0:
		case 3:
		{
			if(isdefined(self.fx_obj.var_d80b0e0e))
			{
				stopfx(var_3d850ea0, self.fx_obj.var_d80b0e0e);
			}
			self.fx_obj.var_d80b0e0e = PlayFXOnTag(var_3d850ea0, level._effect["soe_box_closed"], self.fx_obj, "tag_origin");
			self.var_51de95c1 StopAllLoopSounds(1);
			break;
		}
		case 1:
		{
			if(isdefined(self.fx_obj.var_d80b0e0e))
			{
				stopfx(var_3d850ea0, self.fx_obj.var_d80b0e0e);
			}
			self.fx_obj.var_d80b0e0e = PlayFXOnTag(var_3d850ea0, level._effect["soe_box_open"], self.fx_obj, "tag_origin");
			self.var_51de95c1 PlayLoopSound("zmb_soe_magicbox_open_effect");
			break;
		}
		case 2:
		{
			self.fx_obj delete();
			self.var_51de95c1 delete();
			break;
		}
	}
}

