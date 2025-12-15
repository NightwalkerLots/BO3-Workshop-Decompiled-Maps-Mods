#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm_pack_a_punch;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perk_deadshot;
#include scripts\zm\_zm_perk_doubletap2;
#include scripts\zm\_zm_perk_electric_cherry;
#include scripts\zm\_zm_perk_juggernaut;
#include scripts\zm\_zm_perk_quick_revive;
#include scripts\zm\_zm_perk_sleight_of_hand;
#include scripts\zm\_zm_perk_staminup;
#include scripts\zm\_zm_perk_widows_wine;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerup_double_points;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_powerup_free_perk;
#include scripts\zm\_zm_powerup_full_ammo;
#include scripts\zm\_zm_powerup_insta_kill;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zm_usermap;

#namespace namespace_5c45359e;

/*
	Name: __init__
	Namespace: namespace_5c45359e
	Checksum: 0x89A20CCA
	Offset: 0x710
	Size: 0x1B0
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__()
{
	clientfield::register("toplayer", "flashlight_fx_view", 1, 4, "int", &function_964a11c, 0, 0);
	clientfield::register("allplayers", "flashlight_fx_world", 1, 4, "int", &function_e1b9d1bd, 0, 0);
	level._effect["vk_fx_flashlight_high_view"] = "vk_fx/zm/_vk_zm_flashlight_high_view";
	level._effect["vk_fx_flashlight_high_world"] = "vk_fx/zm/_vk_zm_flashlight_high_world";
	level._effect["vk_fx_flashlight_high_head"] = "vk_fx/lights/_vm_flashlight_head";
	level._effect["vk_fx_flashlight_medium_view"] = "vk_fx/zm/_vk_zm_flashlight_medium_view";
	level._effect["vk_fx_flashlight_medium_world"] = "vk_fx/zm/_vk_zm_flashlight_medium_world";
	level._effect["vk_fx_flashlight_medium_head"] = "vk_fx/lights/_vm_flashlight_head_dark";
	level._effect["vk_fx_flashlight_low_view"] = "vk_fx/zm/_vk_zm_flashlight_low_view";
	level._effect["vk_fx_flashlight_low_world"] = "vk_fx/zm/_vk_zm_flashlight_low_world";
	level._effect["vk_fx_flashlight_low_head"] = "vk_fx/lights/_vm_flashlight_head_dark";
	level._effect["flashlight_fx_loop_view_moths"] = "custom/flashlight/flashlight_loop_view_moths";
}

/*
	Name: function_964a11c
	Namespace: namespace_5c45359e
	Checksum: 0xBFE5E64E
	Offset: 0x8C8
	Size: 0x500
	Parameters: 7
	Flags: None
	Line Number: 66
*/
function function_964a11c(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		if(isdefined(self.var_96c7b2fc))
		{
			KillFX(localClientNum, self.var_96c7b2fc);
		}
		if(isdefined(self.var_d2792797))
		{
			KillFX(localClientNum, self.var_d2792797);
		}
		var_f161afa2 = level._effect["vk_fx_flashlight_high_view"];
		self.var_96c7b2fc = PlayViewmodelFX(localClientNum, var_f161afa2, "tag_flash");
		var_2bebbccb = level._effect["vk_fx_flashlight_high_head"];
		self.var_a4f777ad = PlayFXOnTag(localClientNum, var_2bebbccb, self, "tag_head");
		var_a9241b31 = level._effect["flashlight_fx_loop_view_moths"];
		self.var_d2792797 = PlayFXOnTag(localClientNum, var_a9241b31, self, "j_spine4");
		playsound(localClientNum, "1_flashlight_click", self.origin);
	}
	else if(newVal == 2)
	{
		if(isdefined(self.var_96c7b2fc))
		{
			KillFX(localClientNum, self.var_96c7b2fc);
		}
		if(isdefined(self.var_d2792797))
		{
			KillFX(localClientNum, self.var_d2792797);
		}
		var_f161afa2 = level._effect["vk_fx_flashlight_medium_view"];
		self.var_96c7b2fc = PlayViewmodelFX(localClientNum, var_f161afa2, "tag_flash");
		var_2bebbccb = level._effect["vk_fx_flashlight_medium_head"];
		self.var_a4f777ad = PlayFXOnTag(localClientNum, var_2bebbccb, self, "tag_head");
		var_a9241b31 = level._effect["flashlight_fx_loop_view_moths"];
		self.var_d2792797 = PlayFXOnTag(localClientNum, var_a9241b31, self, "j_spine4");
		playsound(localClientNum, "1_flashlight_click", self.origin);
	}
	else if(newVal == 3)
	{
		if(isdefined(self.var_96c7b2fc))
		{
			KillFX(localClientNum, self.var_96c7b2fc);
		}
		if(isdefined(self.var_d2792797))
		{
			KillFX(localClientNum, self.var_d2792797);
		}
		var_f161afa2 = level._effect["vk_fx_flashlight_low_view"];
		self.var_96c7b2fc = PlayViewmodelFX(localClientNum, var_f161afa2, "tag_flash");
		var_2bebbccb = level._effect["vk_fx_flashlight_low_head"];
		self.var_a4f777ad = PlayFXOnTag(localClientNum, var_2bebbccb, self, "tag_head");
		var_a9241b31 = level._effect["flashlight_fx_loop_view_moths"];
		self.var_d2792797 = PlayFXOnTag(localClientNum, var_a9241b31, self, "j_spine4");
		playsound(localClientNum, "1_flashlight_click", self.origin);
	}
	else if(newVal == 0)
	{
		if(isdefined(self.var_96c7b2fc))
		{
			KillFX(localClientNum, self.var_96c7b2fc);
			self.var_96c7b2fc = undefined;
			KillFX(localClientNum, self.var_a4f777ad);
			self.var_a4f777ad = undefined;
			playsound(localClientNum, "1_flashlight_click", self.origin);
		}
		if(isdefined(self.var_d2792797))
		{
			KillFX(localClientNum, self.var_d2792797);
			self.var_d2792797 = undefined;
		}
	}
}

/*
	Name: function_e1b9d1bd
	Namespace: namespace_5c45359e
	Checksum: 0x25BC26E
	Offset: 0xDD0
	Size: 0x286
	Parameters: 7
	Flags: None
	Line Number: 150
*/
function function_e1b9d1bd(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		var_d665442b = GetLocalPlayer(localClientNum);
		if(isdefined(self.var_bac3a61d))
		{
			KillFX(localClientNum, self.var_bac3a61d);
		}
		if(var_d665442b != self)
		{
			var_252de07b = level._effect["vk_fx_flashlight_high_world"];
			self.var_bac3a61d = PlayFXOnTag(localClientNum, var_252de07b, self, "tag_flash");
		}
	}
	if(newVal == 2)
	{
		var_d665442b = GetLocalPlayer(localClientNum);
		if(isdefined(self.var_bac3a61d))
		{
			KillFX(localClientNum, self.var_bac3a61d);
		}
		if(var_d665442b != self)
		{
			var_252de07b = level._effect["vk_fx_flashlight_medium_world"];
			self.var_bac3a61d = PlayFXOnTag(localClientNum, var_252de07b, self, "tag_flash");
		}
	}
	if(newVal == 3)
	{
		var_d665442b = GetLocalPlayer(localClientNum);
		if(isdefined(self.var_bac3a61d))
		{
			KillFX(localClientNum, self.var_bac3a61d);
		}
		if(var_d665442b != self)
		{
			var_252de07b = level._effect["vk_fx_flashlight_low_world"];
			self.var_bac3a61d = PlayFXOnTag(localClientNum, var_252de07b, self, "tag_flash");
		}
	}
	else if(newVal == 0)
	{
		if(isdefined(self.var_bac3a61d))
		{
			KillFX(localClientNum, self.var_bac3a61d);
			self.var_bac3a61d = undefined;
		}
	}
}

