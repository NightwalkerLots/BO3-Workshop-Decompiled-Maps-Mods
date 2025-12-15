#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_weap_elemental_bow;

#namespace namespace_d37f1c72;

/*
	Name: __init__sytem__
	Namespace: namespace_d37f1c72
	Checksum: 0x4E190957
	Offset: 0x638
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("_zm_weap_elemental_bow_wolf_howl", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_d37f1c72
	Checksum: 0x44D02742
	Offset: 0x678
	Size: 0x480
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	clientfield::register("toplayer", "elemental_bow_wolf_howl" + "_ambient_bow_fx", 1, 1, "int", &function_b9d4876a, 0, 0);
	clientfield::register("missile", "elemental_bow_wolf_howl" + "_arrow_impact_fx", 1, 1, "int", &function_b6426acd, 0, 0);
	clientfield::register("scriptmover", "elemental_bow_wolf_howl4" + "_arrow_impact_fx", 1, 1, "int", &function_25ad7dcf, 0, 0);
	clientfield::register("toplayer", "wolf_howl_muzzle_flash", 1, 1, "int", &function_664b876d, 0, 0);
	clientfield::register("scriptmover", "wolf_howl_arrow_charged_trail", 1, 1, "int", &function_72a47b2c, 0, 0);
	clientfield::register("scriptmover", "wolf_howl_arrow_charged_spiral", 1, 1, "int", &function_9569ef2b, 0, 0);
	clientfield::register("actor", "wolf_howl_slow_snow_fx", 1, 1, "int", &function_37d6b2bd, 0, 0);
	clientfield::register("actor", "zombie_hit_by_wolf_howl_charge", 1, 1, "int", &function_35593b6a, 0, 0);
	clientfield::register("actor", "zombie_explode_fx", 1, 1, "counter", &function_3dbb2f52, 0, 0);
	clientfield::register("actor", "zombie_explode_fx", -1, 1, "counter", &function_3dbb2f52, 0, 0);
	clientfield::register("actor", "wolf_howl_zombie_explode_fx", 1, 1, "counter", &function_3dbb2f52, 0, 0);
	level._effect["wolf_howl_ambient_bow"] = "dlc1/zmb_weapon/fx_bow_wolf_ambient_1p_zmb";
	level._effect["wolf_howl_arrow_impact"] = "dlc1/zmb_weapon/fx_bow_wolf_impact_zmb";
	level._effect["wolf_howl_arrow_charged_impact"] = "dlc1/zmb_weapon/fx_bow_wolf_impact_ug_zmb";
	level._effect["wolf_howl_slow_torso"] = "dlc1/zmb_weapon/fx_bow_wolf_wrap_torso";
	level._effect["wolf_howl_charge_spiral"] = "dlc1/zmb_weapon/fx_bow_wolf_arrow_spiral_ug_zmb";
	level._effect["wolf_howl_charge_trail"] = "dlc1/zmb_weapon/fx_bow_wolf_arrow_trail_ug_zmb";
	level._effect["wolf_howl_arrow_trail"] = "dlc1/zmb_weapon/fx_bow_wolf_arrow_trail_zmb";
	level._effect["wolf_howl_muzzle_flash"] = "dlc1/zmb_weapon/fx_bow_wolf_muz_flash_ug_1p_zmb";
	level._effect["zombie_trail_wolf_howl_hit"] = "dlc1/zmb_weapon/fx_bow_wolf_torso_trail";
	level._effect["zombie_wolf_howl_hit_explode"] = "dlc1/castle/fx_tesla_trap_body_exp";
	duplicate_render::set_dr_filter_framebuffer("ghostly", 10, "ghostly_on", undefined, 0, "mc/mtl_c_zom_der_zombie_body1_ghost", 0);
}

/*
	Name: function_b9d4876a
	Namespace: namespace_d37f1c72
	Checksum: 0x8D6BDCB3
	Offset: 0xB00
	Size: 0x68
	Parameters: 7
	Flags: None
	Line Number: 75
*/
function function_b9d4876a(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self zm_weap_elemental_bow::function_783ddebf(localClientNum, newVal, "wolf_howl_ambient_bow");
}

/*
	Name: function_b6426acd
	Namespace: namespace_d37f1c72
	Checksum: 0x2B3595A0
	Offset: 0xB70
	Size: 0x78
	Parameters: 7
	Flags: None
	Line Number: 90
*/
function function_b6426acd(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		playFX(localClientNum, level._effect["wolf_howl_arrow_impact"], self.origin);
	}
}

/*
	Name: function_25ad7dcf
	Namespace: namespace_d37f1c72
	Checksum: 0x5CFCC173
	Offset: 0xBF0
	Size: 0x78
	Parameters: 7
	Flags: None
	Line Number: 108
*/
function function_25ad7dcf(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		playFX(localClientNum, level._effect["wolf_howl_arrow_charged_impact"], self.origin);
	}
}

/*
	Name: function_664b876d
	Namespace: namespace_d37f1c72
	Checksum: 0x9F8DC9E2
	Offset: 0xC70
	Size: 0x78
	Parameters: 7
	Flags: None
	Line Number: 126
*/
function function_664b876d(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		PlayViewmodelFX(localClientNum, level._effect["wolf_howl_muzzle_flash"], "tag_flash");
	}
}

/*
	Name: function_72a47b2c
	Namespace: namespace_d37f1c72
	Checksum: 0xB43E8AB0
	Offset: 0xCF0
	Size: 0xA0
	Parameters: 7
	Flags: None
	Line Number: 144
*/
function function_72a47b2c(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self.var_db166c8f = PlayFXOnTag(localClientNum, level._effect["wolf_howl_charge_trail"], self, "tag_origin");
		continue;
	}
	deletefx(localClientNum, self.var_db166c8f, 0);
}

/*
	Name: function_9569ef2b
	Namespace: namespace_d37f1c72
	Checksum: 0x42E0CF96
	Offset: 0xD98
	Size: 0xA0
	Parameters: 7
	Flags: None
	Line Number: 164
*/
function function_9569ef2b(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self.var_d86a55d6 = PlayFXOnTag(localClientNum, level._effect["wolf_howl_charge_spiral"], self, "tag_origin");
		continue;
	}
	deletefx(localClientNum, self.var_d86a55d6, 0);
	return;
	ERROR: Bad function call
}

/*
	Name: function_37d6b2bd
	Namespace: namespace_d37f1c72
	Checksum: 0x80B3FB95
	Offset: 0xE40
	Size: 0xC8
	Parameters: 7
	Flags: None
	Line Number: 186
*/
function function_37d6b2bd(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		if(!isdefined(self.var_64c5c79d))
		{
			self.var_64c5c79d = PlayFXOnTag(localClientNum, level._effect["wolf_howl_slow_torso"], self, "j_spineupper");
		}
	}
	else if(isdefined(self.var_64c5c79d))
	{
		deletefx(localClientNum, self.var_64c5c79d, 0);
		self.var_64c5c79d = undefined;
		return;
	}
	self.var_64c5c79d++;
}

/*
	Name: function_35593b6a
	Namespace: namespace_d37f1c72
	Checksum: 0xF7D1F3A
	Offset: 0xF10
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 214
*/
function function_35593b6a(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self endon("entityshutdown");
	if(newVal)
	{
		PlayFXOnTag(localClientNum, level._effect["zombie_trail_wolf_howl_hit"], self, "j_spine4");
		self duplicate_render::set_dr_flag("ghostly_on", newVal);
		self duplicate_render::update_dr_filters(localClientNum);
	}
}

/*
	Name: function_3dbb2f52
	Namespace: namespace_d37f1c72
	Checksum: 0x403FA4C5
	Offset: 0xFD0
	Size: 0x8C
	Parameters: 7
	Flags: None
	Line Number: 235
*/
function function_3dbb2f52(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self endon("entityshutdown");
	self util::waittill_dobj(localClientNum);
	PlayFXOnTag(localClientNum, level._effect["zombie_wolf_howl_hit_explode"], self, "j_spine4");
}

