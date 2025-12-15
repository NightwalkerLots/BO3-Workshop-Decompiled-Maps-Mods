#include scripts\_dobby\t6\_zm_t6_hud;
#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\postfx_raindrops;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\vk_script\tranzit\vk_tranzit_flashlight;
#include scripts\vk_script\tranzit\vk_tranzit_main_shared;
#include scripts\vk_script\tranzit\vk_tranzit_zm_controller;
#include scripts\zm\_ambient_room;
#include scripts\zm\_load;
#include scripts\zm\_zm_ai_dogs;
#include scripts\zm\_zm_bgb_fix;
#include scripts\zm\_zm_pack_a_punch;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perk_deadshot;
#include scripts\zm\_zm_perk_directionalfire;
#include scripts\zm\_zm_perk_doubletap2;
#include scripts\zm\_zm_perk_electric_cherry;
#include scripts\zm\_zm_perk_juggernaut;
#include scripts\zm\_zm_perk_quick_revive;
#include scripts\zm\_zm_perk_random;
#include scripts\zm\_zm_perk_sleight_of_hand;
#include scripts\zm\_zm_perk_staminup;
#include scripts\zm\_zm_perk_vulture;
#include scripts\zm\_zm_perk_widows_wine;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerup_double_points;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_powerup_free_perk;
#include scripts\zm\_zm_powerup_full_ammo;
#include scripts\zm\_zm_powerup_insta_kill;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_trap_electric;
#include scripts\zm\_zm_weapons;
#include scripts\zm\logical\perks\_zm_perk_icu;
#include scripts\zm\perks\_zm_perk_phdflopper;
#include scripts\zm\zm_usermap;

#namespace namespace_a1b179a4;

/*
	Name: main
	Namespace: namespace_a1b179a4
	Checksum: 0x371B43A4
	Offset: 0x6D8
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function main()
{
	level._effect["player_rain"] = "custom/env/fx_rain_player_z_heavy";
	clientfield::register("world", "rain_fx_stop", 1, 1, "int", &function_49df1c8a, 0, 0);
	level.var_d6dee9aa = 1;
	clientfield::register("world", "decal_toggle", 1, 1, "int", &function_ea8dcadf, 0, 0);
	level.var_5a123578 = function_244f59e6("decalrain");
	zm_usermap::main();
	include_weapons();
	util::waitforclient(0);
	players = GetLocalPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_7603b61d(i);
	}
}

/*
	Name: include_weapons
	Namespace: namespace_a1b179a4
	Checksum: 0x16A64852
	Offset: 0x858
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 81
*/
function include_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/vk_wpn_table_tranzit_shared.csv", 1);
}

/*
	Name: function_49df1c8a
	Namespace: namespace_a1b179a4
	Checksum: 0x599C9FDE
	Offset: 0x888
	Size: 0x60
	Parameters: 7
	Flags: None
	Line Number: 96
*/
function function_49df1c8a(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		level.var_d6dee9aa = 0;
		continue;
	}
	level.var_d6dee9aa = 1;
}

/*
	Name: function_ea8dcadf
	Namespace: namespace_a1b179a4
	Checksum: 0xE617D963
	Offset: 0x8F0
	Size: 0xD8
	Parameters: 7
	Flags: None
	Line Number: 116
*/
function function_ea8dcadf(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		for(i = 0; i < level.var_5a123578.size; i++)
		{
			function_733db26(level.var_5a123578[i]);
		}
		continue;
	}
	for(i = 0; i < level.var_5a123578.size; i++)
	{
		function_c879924d(level.var_5a123578[i]);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7603b61d
	Namespace: namespace_a1b179a4
	Checksum: 0xCFA4F815
	Offset: 0x9D0
	Size: 0x1EA
	Parameters: 1
	Flags: None
	Line Number: 144
*/
function function_7603b61d(localClientNum)
{
	self endon("disconnect");
	self endon("entityshutdown");
	self.var_67a8ff39 = spawn(localClientNum, self.origin, "script_model");
	self.var_67a8ff39 SetModel("tag_origin");
	self.rain_fx = PlayFXOnTag(localClientNum, level._effect["player_rain"], self.var_67a8ff39, "tag_origin");
	SetFXIgnorePause(localClientNum, self.rain_fx, 1);
	function_7a6170fb(localClientNum, self.rain_fx);
	while(1)
	{
		WaitRealTime(0.1);
		if(level.var_d6dee9aa)
		{
			if(!isdefined(self.rain_fx))
			{
				self.rain_fx = PlayFXOnTag(localClientNum, level._effect["player_rain"], self.var_67a8ff39, "tag_origin");
				SetFXIgnorePause(localClientNum, self.rain_fx, 1);
				function_7a6170fb(localClientNum, self.rain_fx);
			}
			self.var_67a8ff39.origin = self.origin;
		}
		else if(isdefined(self.rain_fx))
		{
			deletefx(localClientNum, self.rain_fx);
			self.rain_fx = undefined;
		}
	}
}

