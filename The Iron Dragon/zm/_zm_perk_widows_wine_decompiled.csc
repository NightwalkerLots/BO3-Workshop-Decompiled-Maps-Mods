#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerup_ww_grenade;

#namespace zm_perk_widows_wine;

/*
	Name: __init__sytem__
	Namespace: zm_perk_widows_wine
	Checksum: 0xF865767B
	Offset: 0x2C0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_widows_wine", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_widows_wine
	Checksum: 0x70B4AF91
	Offset: 0x308
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_factory")
	{
		return;
	}
	if(isdefined(1) && 1)
	{
		enable_widows_wine_perk_for_level();
	}
}

/*
	Name: __main__
	Namespace: zm_perk_widows_wine
	Checksum: 0x7406349D
	Offset: 0x380
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function __main__()
{
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_factory")
	{
		return;
	}
	if(isdefined(1) && 1)
	{
		function_9882031c();
	}
}

/*
	Name: enable_widows_wine_perk_for_level
	Namespace: zm_perk_widows_wine
	Checksum: 0xA5F1566D
	Offset: 0x3F8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 79
*/
function enable_widows_wine_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_widowswine", &widows_wine_client_field_func, &widows_wine_code_callback_func);
	zm_perks::register_perk_effects("specialty_widowswine", "specialty_widowswine");
	zm_perks::register_perk_init_thread("specialty_widowswine", &init_widows_wine);
}

/*
	Name: init_widows_wine
	Namespace: zm_perk_widows_wine
	Checksum: 0x78D6471B
	Offset: 0x488
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 96
*/
function init_widows_wine()
{
	level._effect["specialty_widowswine"] = "harry/zm_perks/fx_perk_widows_wine_light";
	return;
	.var_0 = undefined;
}

/*
	Name: widows_wine_client_field_func
	Namespace: zm_perk_widows_wine
	Checksum: 0x8890B7DD
	Offset: 0x4B0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 113
*/
function widows_wine_client_field_func()
{
	clientfield::register("clientuimodel", "hudItems.perks.widows_wine", 1, 2, "int", undefined, 0, 1);
}

/*
	Name: widows_wine_code_callback_func
	Namespace: zm_perk_widows_wine
	Checksum: 0x9ACF73B8
	Offset: 0x4F8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 128
*/
function widows_wine_code_callback_func()
{
}

/*
	Name: function_9882031c
	Namespace: zm_perk_widows_wine
	Checksum: 0x6699299B
	Offset: 0x508
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 142
*/
function function_9882031c()
{
	clientfield::register("actor", "widows_wine_wrapping", 1, 1, "int", &widows_wine_wrap_cb, 0, 1);
	clientfield::register("vehicle", "widows_wine_wrapping", 1, 1, "int", &widows_wine_wrap_cb, 0, 0);
	clientfield::register("toplayer", "widows_wine_1p_contact_explosion", 1, 1, "counter", &widows_wine_1p_contact_explosion, 0, 0);
	level._effect["widows_wine_wrap"] = "zombie/fx_widows_wrap_torso_zmb";
}

/*
	Name: widows_wine_wrap_cb
	Namespace: zm_perk_widows_wine
	Checksum: 0xE93DC99
	Offset: 0x608
	Size: 0x198
	Parameters: 7
	Flags: None
	Line Number: 160
*/
function widows_wine_wrap_cb(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		if(isdefined(self) && isalive(self))
		{
			if(!isdefined(self.fx_widows_wine_wrap))
			{
				self.fx_widows_wine_wrap = PlayFXOnTag(localClientNum, level._effect["widows_wine_wrap"], self, "j_spineupper");
			}
			if(!isdefined(self.sndWidowsWine))
			{
				self playsound(0, "wpn_wwgrenade_cocoon_imp");
				self.sndWidowsWine = self PlayLoopSound("wpn_wwgrenade_cocoon_lp", 0.1);
			}
		}
	}
	else if(isdefined(self.fx_widows_wine_wrap))
	{
		stopfx(localClientNum, self.fx_widows_wine_wrap);
		self.fx_widows_wine_wrap = undefined;
	}
	if(isdefined(self.sndWidowsWine))
	{
		self playsound(0, "wpn_wwgrenade_cocoon_stop");
		self StopLoopSound(self.sndWidowsWine, 0.1);
	}
}

/*
	Name: widows_wine_1p_contact_explosion
	Namespace: zm_perk_widows_wine
	Checksum: 0x906D30F9
	Offset: 0x7A8
	Size: 0xA0
	Parameters: 7
	Flags: None
	Line Number: 199
*/
function widows_wine_1p_contact_explosion(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	owner = self GetOwner(localClientNum);
	if(isdefined(owner) && owner == GetLocalPlayer(localClientNum))
	{
		thread widows_wine_1p_contact_explosion_play(localClientNum);
	}
}

/*
	Name: widows_wine_1p_contact_explosion_play
	Namespace: zm_perk_widows_wine
	Checksum: 0x245D4B85
	Offset: 0x850
	Size: 0xBC
	Parameters: 1
	Flags: None
	Line Number: 218
*/
function widows_wine_1p_contact_explosion_play(localClientNum)
{
	tag = "tag_flash";
	if(!ViewmodelHasTag(localClientNum, tag))
	{
		tag = "tag_weapon";
		if(!ViewmodelHasTag(localClientNum, tag))
		{
			return;
		}
	}
	fx_contact_explosion = PlayViewmodelFX(localClientNum, "zombie/fx_widows_exp_1p_zmb", tag);
	wait(2);
	deletefx(localClientNum, fx_contact_explosion, 1);
}

