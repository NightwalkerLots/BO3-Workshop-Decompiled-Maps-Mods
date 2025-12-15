#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace zm_perk_electric_cherry;

/*
	Name: __init__sytem__
	Namespace: zm_perk_electric_cherry
	Checksum: 0x4887B612
	Offset: 0x380
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_electric_cherry", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: zm_perk_electric_cherry
	Checksum: 0x7B60FF2B
	Offset: 0x3C0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_electriccherry", &electric_cherry_client_field_func, &electric_cherry_code_callback_func);
	zm_perks::register_perk_effects("specialty_electriccherry", "electric_light");
	zm_perks::register_perk_init_thread("specialty_electriccherry", &init_electric_cherry);
}

/*
	Name: init_electric_cherry
	Namespace: zm_perk_electric_cherry
	Checksum: 0xA4B60603
	Offset: 0x450
	Size: 0x228
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function init_electric_cherry()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		level._effect["electric_light"] = "_t6/misc/fx_zombie_cola_revive_on";
	}
	RegisterClientField("allplayers", "electric_cherry_reload_fx", 1, 2, "int", &electric_cherry_reload_attack_fx, 0);
	clientfield::register("actor", "tesla_death_fx", 1, 1, "int", &tesla_death_fx_callback, 0, 0);
	clientfield::register("vehicle", "tesla_death_fx_veh", 10000, 1, "int", &tesla_death_fx_callback, 0, 0);
	clientfield::register("actor", "tesla_shock_eyes_fx", 1, 1, "int", &tesla_shock_eyes_fx_callback, 0, 0);
	clientfield::register("vehicle", "tesla_shock_eyes_fx_veh", 10000, 1, "int", &tesla_shock_eyes_fx_callback, 0, 0);
	level._effect["electric_cherry_explode"] = "dlc1/castle/fx_castle_electric_cherry_down";
	level._effect["electric_cherry_trail"] = "dlc1/castle/fx_castle_electric_cherry_trail";
	level._effect["tesla_death_cherry"] = "zombie/fx_tesla_shock_zmb";
	level._effect["tesla_shock_eyes_cherry"] = "zombie/fx_tesla_shock_eyes_zmb";
	level._effect["tesla_shock_cherry"] = "zombie/fx_bmode_shock_os_zod_zmb";
}

/*
	Name: electric_cherry_client_field_func
	Namespace: zm_perk_electric_cherry
	Checksum: 0x9F111A74
	Offset: 0x680
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function electric_cherry_client_field_func()
{
	clientfield::register("clientuimodel", "hudItems.perks.electric_cherry", 1, 2, "int", undefined, 0, 1);
	return;
}

/*
	Name: electric_cherry_code_callback_func
	Namespace: zm_perk_electric_cherry
	Checksum: 0x9ACF73B8
	Offset: 0x6C8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 96
*/
function electric_cherry_code_callback_func()
{
	return;
}

/*
	Name: electric_cherry_reload_attack_fx
	Namespace: zm_perk_electric_cherry
	Checksum: 0x190C6A82
	Offset: 0x6D8
	Size: 0x178
	Parameters: 7
	Flags: None
	Line Number: 111
*/
function electric_cherry_reload_attack_fx(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.electric_cherry_reload_fx))
	{
		stopfx(localClientNum, self.electric_cherry_reload_fx);
	}
	if(newVal == 1)
	{
		self.electric_cherry_reload_fx = PlayFXOnTag(localClientNum, level._effect["electric_cherry_explode"], self, "tag_origin");
	}
	else if(newVal == 2)
	{
		self.electric_cherry_reload_fx = PlayFXOnTag(localClientNum, level._effect["electric_cherry_explode"], self, "tag_origin");
	}
	else if(newVal == 3)
	{
		self.electric_cherry_reload_fx = PlayFXOnTag(localClientNum, level._effect["electric_cherry_explode"], self, "tag_origin");
	}
	else if(isdefined(self.electric_cherry_reload_fx))
	{
		stopfx(localClientNum, self.electric_cherry_reload_fx);
	}
	self.electric_cherry_reload_fx = undefined;
}

/*
	Name: tesla_death_fx_callback
	Namespace: zm_perk_electric_cherry
	Checksum: 0x964A05BC
	Offset: 0x858
	Size: 0x130
	Parameters: 7
	Flags: None
	Line Number: 146
*/
function tesla_death_fx_callback(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		str_tag = "J_SpineUpper";
		if(isdefined(self.str_tag_tesla_death_fx))
		{
			str_tag = self.str_tag_tesla_death_fx;
		}
		else if(isdefined(self.isdog) && self.isdog)
		{
			str_tag = "J_Spine1";
		}
		self.n_death_fx = PlayFXOnTag(localClientNum, level._effect["tesla_death_cherry"], self, str_tag);
		SetFXIgnorePause(localClientNum, self.n_death_fx, 1);
	}
	else if(isdefined(self.n_death_fx))
	{
		deletefx(localClientNum, self.n_death_fx, 1);
	}
	self.n_death_fx = undefined;
}

/*
	Name: tesla_shock_eyes_fx_callback
	Namespace: zm_perk_electric_cherry
	Checksum: 0x5FE886CB
	Offset: 0x990
	Size: 0x1C6
	Parameters: 7
	Flags: None
	Line Number: 179
*/
function tesla_shock_eyes_fx_callback(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		str_tag = "J_SpineUpper";
		if(isdefined(self.str_tag_tesla_shock_eyes_fx))
		{
			str_tag = self.str_tag_tesla_shock_eyes_fx;
		}
		else if(isdefined(self.isdog) && self.isdog)
		{
			str_tag = "J_Spine1";
		}
		self.n_shock_eyes_fx = PlayFXOnTag(localClientNum, level._effect["tesla_shock_eyes_cherry"], self, "J_Eyeball_LE");
		SetFXIgnorePause(localClientNum, self.n_shock_eyes_fx, 1);
		self.n_shock_fx = PlayFXOnTag(localClientNum, level._effect["tesla_death_cherry"], self, str_tag);
		SetFXIgnorePause(localClientNum, self.n_shock_fx, 1);
	}
	else if(isdefined(self.n_shock_eyes_fx))
	{
		deletefx(localClientNum, self.n_shock_eyes_fx, 1);
		self.n_shock_eyes_fx = undefined;
	}
	if(isdefined(self.n_shock_fx))
	{
		deletefx(localClientNum, self.n_shock_fx, 1);
		self.n_shock_fx = undefined;
	}
}

