#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace zm_perk_electric_cherry;

/*
	Name: __init__sytem__
	Namespace: zm_perk_electric_cherry
	Checksum: 0xD5BE14AE
	Offset: 0x3A8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_electric_cherry", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_electric_cherry
	Checksum: 0xE026253E
	Offset: 0x3E8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_factory" || script == "zm_zod")
	{
		return;
	}
	if(isdefined(1) && 1)
	{
		enable_electric_cherry_perk_for_level();
	}
}

/*
	Name: enable_electric_cherry_perk_for_level
	Namespace: zm_perk_electric_cherry
	Checksum: 0x6CBB57F2
	Offset: 0x470
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function enable_electric_cherry_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_electriccherry", &electric_cherry_client_field_func, &electric_cherry_code_callback_func);
	zm_perks::register_perk_effects("specialty_electriccherry", "specialty_electriccherry");
	zm_perks::register_perk_init_thread("specialty_electriccherry", &function_8fdc802d);
}

/*
	Name: function_8fdc802d
	Namespace: zm_perk_electric_cherry
	Checksum: 0xCB053B48
	Offset: 0x500
	Size: 0x288
	Parameters: 0
	Flags: None
	Line Number: 74
*/
function function_8fdc802d()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_electriccherry"] = "zombie/fx_perk_quick_revive_zmb";
		continue;
	}
	level._effect["specialty_electriccherry"] = "zombie/fx_perk_quick_revive_factory_zmb";
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
	Checksum: 0x9ACF73B8
	Offset: 0x790
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function electric_cherry_client_field_func()
{
}

/*
	Name: electric_cherry_code_callback_func
	Namespace: zm_perk_electric_cherry
	Checksum: 0x9ACF73B8
	Offset: 0x7A0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 119
*/
function electric_cherry_code_callback_func()
{
}

/*
	Name: electric_cherry_reload_attack_fx
	Namespace: zm_perk_electric_cherry
	Checksum: 0xD2B18D
	Offset: 0x7B0
	Size: 0x178
	Parameters: 7
	Flags: None
	Line Number: 133
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
	Checksum: 0x141E4673
	Offset: 0x930
	Size: 0x130
	Parameters: 7
	Flags: None
	Line Number: 168
*/
function tesla_death_fx_callback(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		str_tag = "j_spineupper";
		if(isdefined(self.str_tag_tesla_death_fx))
		{
			str_tag = self.str_tag_tesla_death_fx;
		}
		else if(isdefined(self.isdog) && self.isdog)
		{
			str_tag = "j_spine1";
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
	Checksum: 0xE7034BD2
	Offset: 0xA68
	Size: 0x1C6
	Parameters: 7
	Flags: None
	Line Number: 201
*/
function tesla_shock_eyes_fx_callback(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		str_tag = "j_spineupper";
		if(isdefined(self.str_tag_tesla_shock_eyes_fx))
		{
			str_tag = self.str_tag_tesla_shock_eyes_fx;
		}
		else if(isdefined(self.isdog) && self.isdog)
		{
			str_tag = "j_spine1";
		}
		self.n_shock_eyes_fx = PlayFXOnTag(localClientNum, level._effect["tesla_shock_eyes_cherry"], self, "j_eyeball_le");
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

