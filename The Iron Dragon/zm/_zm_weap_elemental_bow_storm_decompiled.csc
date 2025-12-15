#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_weap_elemental_bow;

#namespace namespace_156ea490;

/*
	Name: __init__sytem__
	Namespace: namespace_156ea490
	Checksum: 0x7D06BFBB
	Offset: 0x538
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("_zm_weap_elemental_bow_storm", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_156ea490
	Checksum: 0xB7845E6F
	Offset: 0x578
	Size: 0x378
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	clientfield::register("toplayer", "elemental_bow_storm" + "_ambient_bow_fx", 1, 1, "int", &function_c9069014, 0, 0);
	clientfield::register("missile", "elemental_bow_storm" + "_arrow_impact_fx", 1, 1, "int", &function_a0b4e163, 0, 0);
	clientfield::register("missile", "elemental_bow_storm4" + "_arrow_impact_fx", 1, 1, "int", &function_ce78f1a1, 0, 0);
	clientfield::register("scriptmover", "elem_storm_fx", 1, 1, "int", &function_3481f83b, 0, 0);
	clientfield::register("toplayer", "elem_storm_whirlwind_rumble", 1, 1, "int", &function_d6997d17, 0, 0);
	clientfield::register("scriptmover", "elem_storm_bolt_fx", 1, 1, "int", &function_3b5511c9, 0, 0);
	clientfield::register("scriptmover", "elem_storm_zap_ambient", 1, 1, "int", &function_ca0ac11f, 0, 0);
	clientfield::register("actor", "elem_storm_shock_fx", 1, 2, "int", &function_df6db522, 0, 0);
	level._effect["elem_storm_ambient_bow"] = "dlc1/zmb_weapon/fx_bow_storm_ambient_1p_zmb";
	level._effect["elem_storm_arrow_impact"] = "dlc1/zmb_weapon/fx_bow_storm_impact_zmb";
	level._effect["elem_storm_arrow_charged_impact"] = "dlc1/zmb_weapon/fx_bow_storm_impact_ug_zmb";
	level._effect["elem_storm_whirlwind_loop"] = "dlc1/zmb_weapon/fx_bow_storm_funnel_loop_zmb";
	level._effect["elem_storm_whirlwind_end"] = "dlc1/zmb_weapon/fx_bow_storm_funnel_end_zmb";
	level._effect["elem_storm_zap_ambient"] = "dlc1/zmb_weapon/fx_bow_storm_orb_zmb";
	level._effect["elem_storm_zap_bolt"] = "dlc1/zmb_weapon/fx_bow_storm_bolt_zap_zmb";
	level._effect["elem_storm_shock_eyes"] = "zombie/fx_tesla_shock_eyes_zmb";
	level._effect["elem_storm_shock"] = "zombie/fx_tesla_shock_zmb";
	level._effect["elem_storm_shock_nonfatal"] = "zombie/fx_bmode_shock_os_zod_zmb";
}

/*
	Name: function_c9069014
	Namespace: namespace_156ea490
	Checksum: 0x8C834CAC
	Offset: 0x8F8
	Size: 0x68
	Parameters: 7
	Flags: None
	Line Number: 69
*/
function function_c9069014(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self zm_weap_elemental_bow::function_783ddebf(localClientNum, newVal, "elem_storm_ambient_bow");
}

/*
	Name: function_a0b4e163
	Namespace: namespace_156ea490
	Checksum: 0xB8270E42
	Offset: 0x968
	Size: 0x78
	Parameters: 7
	Flags: None
	Line Number: 84
*/
function function_a0b4e163(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		playFX(localClientNum, level._effect["elem_storm_arrow_impact"], self.origin);
	}
}

/*
	Name: function_ce78f1a1
	Namespace: namespace_156ea490
	Checksum: 0xEC640803
	Offset: 0x9E8
	Size: 0x78
	Parameters: 7
	Flags: None
	Line Number: 102
*/
function function_ce78f1a1(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		playFX(localClientNum, level._effect["elem_storm_arrow_charged_impact"], self.origin);
	}
}

/*
	Name: function_3481f83b
	Namespace: namespace_156ea490
	Checksum: 0xE2D2182C
	Offset: 0xA68
	Size: 0x100
	Parameters: 7
	Flags: None
	Line Number: 120
*/
function function_3481f83b(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self endon("entityshutdown");
	if(newVal)
	{
		self.var_9bb8d19f = PlayFXOnTag(localClientNum, level._effect["elem_storm_whirlwind_loop"], self, "tag_origin");
	}
	else if(isdefined(self.var_9bb8d19f))
	{
		deletefx(localClientNum, self.var_9bb8d19f, 0);
		self.var_9bb8d19f = undefined;
	}
	wait(0.4);
	playFX(localClientNum, level._effect["elem_storm_whirlwind_end"], self.origin);
}

/*
	Name: function_d6997d17
	Namespace: namespace_156ea490
	Checksum: 0xE824145
	Offset: 0xB70
	Size: 0x70
	Parameters: 7
	Flags: None
	Line Number: 146
*/
function function_d6997d17(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self thread function_13904425(localClientNum);
		continue;
	}
	self notify("hash_1655bd41");
}

/*
	Name: function_13904425
	Namespace: namespace_156ea490
	Checksum: 0x870A3CE1
	Offset: 0xBE8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 166
*/
function function_13904425(localClientNum)
{
	level endon("demo_jump");
	self endon("hash_1655bd41");
	self endon("death");
	while(isdefined(self))
	{
		self PlayRumbleOnEntity(localClientNum, "zod_idgun_vortex_interior");
		wait(0.075);
	}
}

/*
	Name: function_3b5511c9
	Namespace: namespace_156ea490
	Checksum: 0x4749FB70
	Offset: 0xC50
	Size: 0x100
	Parameters: 7
	Flags: None
	Line Number: 188
*/
function function_3b5511c9(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		if(isdefined(self.var_11e9749))
		{
			deletefx(localClientNum, self.var_11e9749, 0);
			self.var_11e9749 = undefined;
		}
		v_forward = AnglesToForward(self.angles);
		v_up = anglesToUp(self.angles);
		self.var_11e9749 = PlayFXOnTag(localClientNum, level._effect["elem_storm_zap_bolt"], self, "tag_origin");
	}
}

/*
	Name: function_ca0ac11f
	Namespace: namespace_156ea490
	Checksum: 0x92E69A97
	Offset: 0xD58
	Size: 0xA8
	Parameters: 7
	Flags: None
	Line Number: 213
*/
function function_ca0ac11f(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self.var_7bb2e440 = PlayFXOnTag(localClientNum, level._effect["elem_storm_zap_ambient"], self, "tag_origin");
		continue;
	}
	deletefx(localClientNum, self.var_7bb2e440, 0);
	self.var_7bb2e440 = undefined;
}

/*
	Name: function_df6db522
	Namespace: namespace_156ea490
	Checksum: 0x30F1EC8C
	Offset: 0xE08
	Size: 0x25E
	Parameters: 7
	Flags: None
	Line Number: 234
*/
function function_df6db522(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(self isai())
	{
		continue;
	}
	tag = "tag_origin";
	switch(newVal)
	{
		case 0:
		{
			if(isdefined(self.var_af09f4f3))
			{
				deletefx(localClientNum, self.var_af09f4f3, 1);
			}
			if(isdefined(self.var_12fd0fd6))
			{
				deletefx(localClientNum, self.var_12fd0fd6, 1);
			}
			if(isdefined(self.var_fbf240b0))
			{
				deletefx(localClientNum, self.var_fbf240b0, 1);
			}
			self.var_af09f4f3 = undefined;
			self.var_12fd0fd6 = undefined;
			self.var_b51a6dc6 = undefined;
			break;
		}
		case 1:
		{
			if(!isdefined(self.var_12fd0fd6))
			{
				self.var_12fd0fd6 = PlayFXOnTag(localClientNum, level._effect["elem_storm_shock"], self, tag);
				break;
			}
		}
		case 2:
		{
			if(!isdefined(self.var_af09f4f3))
			{
				self.var_5b06fe60 = PlayFXOnTag(localClientNum, level._effect["elem_storm_shock_eyes"], self, "J_Eyeball_LE");
			}
			if(!isdefined(self.var_12fd0fd6))
			{
				self.var_12fd0fd6 = PlayFXOnTag(localClientNum, level._effect["elem_storm_shock"], self, tag);
			}
			if(!isdefined(self.var_fbf240b0))
			{
				self.var_fbf240b0 = PlayFXOnTag(localClientNum, level._effect["elem_storm_shock_nonfatal"], self, tag);
				break;
			}
		}
	}
}

