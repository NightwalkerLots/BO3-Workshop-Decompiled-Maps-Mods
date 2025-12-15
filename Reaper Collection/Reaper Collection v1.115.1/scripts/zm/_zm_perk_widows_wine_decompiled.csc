#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerup_ww_grenade;

#namespace zm_perk_widows_wine;

/*
	Name: __init__sytem__
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x310
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_widows_wine", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x350
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_widowswine", &widows_wine_client_field_func, &widows_wine_code_callback_func);
	zm_perks::register_perk_effects("specialty_widowswine", "zombie/fx_perk_quick_revive_zmb");
	zm_perks::register_perk_init_thread("specialty_widowswine", &init_widows_wine);
}

/*
	Name: init_widows_wine
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x3E0
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function init_widows_wine()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["p7_zm_vending_widows_wine_off"] = "specialty_widowswine";
			level.var_9438a32d["p7_zm_vending_widows_wine"] = "specialty_widowswine";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_widowswine"]))
			{
				level._effect["vulture_waypoint_" + "specialty_widowswine"] = "vulture_fx/vulture_waypoint_" + "specialty_widowswine";
			}
		}
		level._effect["widow_light"] = "zombie/fx_perk_quick_revive_zmb";
		level._effect["widows_wine_wrap"] = "zombie/fx_widows_wrap_torso_zmb";
	}
}

/*
	Name: widows_wine_client_field_func
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x4D8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 82
*/
function widows_wine_client_field_func()
{
	clientfield::register("toplayer", "widows_wine_1p_contact_explosion", 1, 1, "counter", &widows_wine_1p_contact_explosion, 0, 0);
	clientfield::register("actor", "widows_wine_wrapping", 1, 1, "int", &widows_wine_wrap_cb, 0, 1);
	clientfield::register("vehicle", "widows_wine_wrapping", 1, 1, "int", &widows_wine_wrap_cb, 0, 0);
}

/*
	Name: widows_wine_code_callback_func
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x5C0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 99
*/
function widows_wine_code_callback_func()
{
	return;
	ERROR: Bad function call
}

/*
	Name: widows_wine_wrap_cb
	Namespace: zm_perk_widows_wine
	Checksum: 0x424F4353
	Offset: 0x5D0
	Size: 0x198
	Parameters: 7
	Flags: None
	Line Number: 115
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
	Checksum: 0x424F4353
	Offset: 0x770
	Size: 0xA0
	Parameters: 7
	Flags: None
	Line Number: 154
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
	Checksum: 0x424F4353
	Offset: 0x818
	Size: 0xBC
	Parameters: 1
	Flags: None
	Line Number: 173
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

