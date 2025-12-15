#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;

#namespace zm_weap_elemental_bow;

/*
	Name: __init__sytem__
	Namespace: zm_weap_elemental_bow
	Checksum: 0xBECEFBE5
	Offset: 0x298
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 16
*/
function autoexec __init__sytem__()
{
	system::register("_zm_weap_elemental_bow", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_weap_elemental_bow
	Checksum: 0xF60E3D4F
	Offset: 0x2D8
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 31
*/
function __init__()
{
	clientfield::register("toplayer", "elemental_bow" + "_ambient_bow_fx", 1, 1, "int", &function_8b26f07e, 0, 0);
	clientfield::register("missile", "elemental_bow" + "_arrow_impact_fx", 1, 1, "int", &function_4e8aa99, 0, 0);
	clientfield::register("missile", "elemental_bow4" + "_arrow_impact_fx", 1, 1, "int", &function_56011eb, 0, 0);
	level._effect["elemental_bow_ambient_bow"] = "dlc1/zmb_weapon/fx_bow_default_ambient_1p_zmb";
	level._effect["elemental_bow_arrow_impact"] = "dlc1/zmb_weapon/fx_bow_default_impact_zmb";
	level._effect["elemental_bow_arrow_charged_impact"] = "dlc1/zmb_weapon/fx_bow_default_impact_ug_zmb";
	SetDvar("bg_chargeShotUseOneAmmoForMultipleBullets", 0);
	SetDvar("bg_zm_dlc1_chargeShotMultipleBulletsForFullCharge", 2);
}

/*
	Name: function_8b26f07e
	Namespace: zm_weap_elemental_bow
	Checksum: 0x2CB9CC04
	Offset: 0x468
	Size: 0x68
	Parameters: 7
	Flags: None
	Line Number: 53
*/
function function_8b26f07e(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self function_783ddebf(localClientNum, newVal, "elemental_bow_ambient_bow");
}

/*
	Name: function_4e8aa99
	Namespace: zm_weap_elemental_bow
	Checksum: 0x612BDAC1
	Offset: 0x4D8
	Size: 0x78
	Parameters: 7
	Flags: None
	Line Number: 68
*/
function function_4e8aa99(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		playFX(localClientNum, level._effect["elemental_bow_arrow_impact"], self.origin);
		return;
	}
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_56011eb
	Namespace: zm_weap_elemental_bow
	Checksum: 0x5F650238
	Offset: 0x558
	Size: 0x78
	Parameters: 7
	Flags: None
	Line Number: 89
*/
function function_56011eb(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		playFX(localClientNum, level._effect["elemental_bow_arrow_charged_impact"], self.origin);
	}
}

/*
	Name: function_c302ae0e
	Namespace: zm_weap_elemental_bow
	Checksum: 0x22B0E0AD
	Offset: 0x5D8
	Size: 0xA8
	Parameters: 2
	Flags: None
	Line Number: 107
*/
function function_c302ae0e(localClientNum, str_fx_name)
{
	if(isdefined(self.var_91275658) && isdefined(self.var_91275658[str_fx_name]))
	{
		deletefx(localClientNum, self.var_91275658[str_fx_name], 1);
	}
	if(isdefined(self.var_b729d0c1) && isdefined(self.var_b729d0c1[str_fx_name]))
	{
		deletefx(localClientNum, self.var_b729d0c1[str_fx_name], 1);
	}
}

/*
	Name: function_783ddebf
	Namespace: zm_weap_elemental_bow
	Checksum: 0x56729556
	Offset: 0x688
	Size: 0x112
	Parameters: 3
	Flags: None
	Line Number: 129
*/
function function_783ddebf(localClientNum, newVal, str_fx_name)
{
	function_c302ae0e(localClientNum, str_fx_name);
	if(newVal)
	{
		if(!IsSpectating(localClientNum))
		{
			currentWeapon = GetCurrentWeapon(localClientNum);
			if(IsSubStr(currentWeapon.name, "elemental_bow"))
			{
				self.var_91275658[str_fx_name] = PlayViewmodelFX(localClientNum, level._effect[str_fx_name], "tag_fx_02");
				self.var_b729d0c1[str_fx_name] = PlayViewmodelFX(localClientNum, level._effect[str_fx_name], "tag_fx_03");
			}
		}
	}
}

