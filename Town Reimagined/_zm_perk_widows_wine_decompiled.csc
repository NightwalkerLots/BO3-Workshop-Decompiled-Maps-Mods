#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerup_ww_grenade;

#namespace zm_perk_widows_wine;

/*
	Name: __init__sytem__
	Namespace: zm_perk_widows_wine
	Checksum: 0xF734399D
	Offset: 0x328
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_widows_wine", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_widows_wine
	Checksum: 0x4206EDDF
	Offset: 0x368
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 35
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
	Name: enable_widows_wine_perk_for_level
	Namespace: zm_perk_widows_wine
	Checksum: 0x91CD947B
	Offset: 0x3E0
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function enable_widows_wine_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_widowswine", &widows_wine_client_field_func, &widows_wine_code_callback_func);
	zm_perks::register_perk_effects("specialty_widowswine", "specialty_widowswine");
	zm_perks::register_perk_init_thread("specialty_widowswine", &init_widows_wine);
	clientfield::register("toplayer", "widows_wine_1p_contact_explosion", 1, 1, "counter", &widows_wine_1p_contact_explosion, 0, 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: init_widows_wine
	Namespace: zm_perk_widows_wine
	Checksum: 0x7A3783F6
	Offset: 0x4B8
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function init_widows_wine()
{
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_zod" || script == "zm_genesis")
	{
		level._effect["specialty_widowswine"] = "zombie/fx_perk_widows_wine_zmb";
	}
	else if(script == "zm_factory")
	{
		level._effect["specialty_widowswine"] = "zombie/fx_perk_juggernaut_factory_zmb";
	}
	else if(namespace_b8afaefc::function_fc92a42d())
	{
		level._effect["specialty_widowswine"] = "zombie/fx_perk_juggernaut_zmb";
		continue;
	}
	level._effect["specialty_widowswine"] = "zombie/fx_perk_juggernaut_factory_zmb";
	level._effect["widows_wine_wrap"] = "zombie/fx_widows_wrap_torso_zmb";
}

/*
	Name: widows_wine_client_field_func
	Namespace: zm_perk_widows_wine
	Checksum: 0x75E53B19
	Offset: 0x5D8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 108
*/
function widows_wine_client_field_func()
{
	clientfield::register("actor", "widows_wine_wrapping", 1, 1, "int", &widows_wine_wrap_cb, 0, 1);
	clientfield::register("vehicle", "widows_wine_wrapping", 1, 1, "int", &widows_wine_wrap_cb, 0, 0);
}

/*
	Name: widows_wine_code_callback_func
	Namespace: zm_perk_widows_wine
	Checksum: 0x9ACF73B8
	Offset: 0x678
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 124
*/
function widows_wine_code_callback_func()
{
}

/*
	Name: widows_wine_wrap_cb
	Namespace: zm_perk_widows_wine
	Checksum: 0xF24A030E
	Offset: 0x688
	Size: 0x198
	Parameters: 7
	Flags: None
	Line Number: 138
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
	Checksum: 0x7CE9B9C0
	Offset: 0x828
	Size: 0xA0
	Parameters: 7
	Flags: None
	Line Number: 177
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
	Checksum: 0x25E58BC2
	Offset: 0x8D0
	Size: 0xBC
	Parameters: 1
	Flags: None
	Line Number: 196
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

