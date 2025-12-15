#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\math_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_chaos_mod;
#include scripts\zm\_zm_da_perk_slots;
#include scripts\zm\_zm_emote_menu;
#include scripts\zm\_zm_gumgame;
#include scripts\zm\_zm_leveling;
#include scripts\zm\_zm_perk_additions;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_weap_rayzorback;
#include scripts\zm\bgb\_zm_bgb_all_custom;
#include scripts\zm\zmperkoverlaystyles;

#namespace ZCLASSIC;

/*
	Name: main
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x320
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 31
*/
function main()
{
	level.var_f55ff70b = 0;
	util::REGISTER_SYSTEM("setHudHintstring", &function_a3e3b292);
	if(!(isdefined(level.var_f55ff70b) && level.var_f55ff70b))
	{
		clientfield::register("clientuimodel", "salami_key", 1, 1, "int", &function_4b92b49a, 0, 1);
	}
	level._zombie_gameModePrecache = &onPrecacheGameType;
	level._zombie_gamemodeMain = &onStartGameType;
}

/*
	Name: onPrecacheGameType
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x3F8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function onPrecacheGameType()
{
}

/*
	Name: onStartGameType
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x408
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 67
*/
function onStartGameType()
{
}

/*
	Name: function_4b92b49a
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x418
	Size: 0x1C0
	Parameters: 7
	Flags: None
	Line Number: 81
*/
function function_4b92b49a(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(newVal)
	{
		if(isdefined(level.var_b3c23ec9) && isdefined(level.var_b3c23ec9[localClientNum]) && isdefined(level.var_b3c23ec9[localClientNum][1]) && isdefined(level.var_b3c23ec9[localClientNum][1].var_cc38f8bd) && isdefined(level.var_b3c23ec9[localClientNum][1].var_cc38f8bd[localClientNum]))
		{
			level.var_b3c23ec9[localClientNum][1].var_cc38f8bd[localClientNum] SetModel("p7_fxanim_zm_zod_redemption_salami_key_ritual_mod");
			level.var_b3c23ec9[localClientNum][2].var_cc38f8bd[localClientNum] SetModel("p7_fxanim_zm_zod_redemption_salami_key_ritual_mod");
			level.var_b3c23ec9[localClientNum][3].var_cc38f8bd[localClientNum] SetModel("p7_fxanim_zm_zod_redemption_salami_key_ritual_mod");
			level.var_b3c23ec9[localClientNum][4].var_cc38f8bd[localClientNum] SetModel("p7_fxanim_zm_zod_redemption_salami_key_ritual_mod");
			return;
		}
	}
}

/*
	Name: function_a3e3b292
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x5E0
	Size: 0xE4
	Parameters: 3
	Flags: None
	Line Number: 106
*/
function function_a3e3b292(localClientNum, newState, oldState)
{
	if(!isdefined(newState))
	{
		return;
	}
	var_21aa4d87 = StrTok(newState, "|");
	if(!isdefined(var_21aa4d87) || (isdefined(var_21aa4d87) && var_21aa4d87.size < 2))
	{
		return;
	}
	model = CreateUIModel(GetUIModelForController(localClientNum), "hudItems.ReapMod." + var_21aa4d87[0]);
	SetUIModelValue(model, var_21aa4d87[1]);
}

