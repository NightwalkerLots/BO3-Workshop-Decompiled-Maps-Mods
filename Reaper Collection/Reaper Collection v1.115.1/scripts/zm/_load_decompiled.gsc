#include scripts\codescripts\struct;
#include scripts\shared\_oob;
#include scripts\shared\abilities\_ability_player;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\archetype_shared\archetype_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\hud_message_shared;
#include scripts\shared\load_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\music_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\serverfaceanim_shared;
#include scripts\shared\system_shared;
#include scripts\shared\turret_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_art;
#include scripts\zm\_callbacks;
#include scripts\zm\_destructible;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_behavior;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_bot;
#include scripts\zm\_zm_clone;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_playerhealth;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_traps;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\gametypes\_clientids;
#include scripts\zm\gametypes\_scoreboard;
#include scripts\zm\gametypes\_serversettings;
#include scripts\zm\gametypes\_shellshock;
#include scripts\zm\gametypes\_spawnlogic;
#include scripts\zm\gametypes\_spectating;
#include scripts\zm\gametypes\_weaponobjects;

#namespace load;

/*
	Name: main
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0x900
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function main()
{
	zm::init();
	level._loadStarted = 1;
	register_clientfields();
	level.aiTriggerSpawnFlags = getaitriggerflags();
	level.vehicleTriggerSpawnFlags = getvehicletriggerflags();
	level thread start_intro_screen_zm();
	setup_traversals();
	footsteps();
	system::wait_till("all");
	level thread art_review();
	level flagsys::set("load_main_complete");
}

/*
	Name: footsteps
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0x9F8
	Size: 0x240
	Parameters: 0
	Flags: None
	Line Number: 86
*/
function footsteps()
{
	if(isdefined(level.FX_exclude_footsteps) && level.FX_exclude_footsteps)
	{
		return;
	}
	zombie_utility::setFootstepEffect("asphalt", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setFootstepEffect("brick", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setFootstepEffect("carpet", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setFootstepEffect("cloth", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setFootstepEffect("concrete", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setFootstepEffect("dirt", "_t6/bio/player/fx_footstep_sand");
	zombie_utility::setFootstepEffect("foliage", "_t6/bio/player/fx_footstep_sand");
	zombie_utility::setFootstepEffect("gravel", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setFootstepEffect("grass", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setFootstepEffect("metal", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setFootstepEffect("mud", "_t6/bio/player/fx_footstep_mud");
	zombie_utility::setFootstepEffect("paper", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setFootstepEffect("plaster", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setFootstepEffect("rock", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setFootstepEffect("sand", "_t6/bio/player/fx_footstep_sand");
	zombie_utility::setFootstepEffect("water", "_t6/bio/player/fx_footstep_water");
	zombie_utility::setFootstepEffect("wood", "_t6/bio/player/fx_footstep_dust");
}

/*
	Name: setup_traversals
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0xC40
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 121
*/
function setup_traversals()
{
	return;
}

/*
	Name: start_intro_screen_zm
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0xC50
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 136
*/
function start_intro_screen_zm()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] LUI::screen_fade_out(0, undefined);
		players[i] FreezeControls(1);
	}
	wait(1);
}

/*
	Name: register_clientfields
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0xCF0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 157
*/
function register_clientfields()
{
	clientfield::register("allplayers", "zmbLastStand", 1, 1, "int");
	clientfield::register("clientuimodel", "zmhud.swordEnergy", 1, 7, "float");
	clientfield::register("clientuimodel", "zmhud.swordState", 1, 4, "int");
	clientfield::register("clientuimodel", "zmhud.swordChargeUpdate", 1, 1, "counter");
}

/*
	Name: checkStringValid
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0xDC0
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 175
*/
function checkStringValid(STR)
{
	if(STR != "")
	{
		return STR;
	}
	return undefined;
}

/*
	Name: function_c3a3e63
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0xDF0
	Size: 0x8AE
	Parameters: 0
	Flags: None
	Line Number: 194
*/
function function_c3a3e63()
{
	if(level.script == "zm_zod" || level.script == "zm_factory" || level.script == "zm_castle" || level.script == "zm_island" || level.script == "zm_stalingrad" || level.script == "zm_genesis" || level.script == "zm_tomb" || level.script == "zm_sumpf" || level.script == "zm_theater" || level.script == "zm_cosmodrome" || level.script == "zm_temple" || level.script == "zm_moon" || level.script == "zm_asylum" || level.script == "zm_prototype")
	{
		return;
	}
	rifle = [];
	sniper = [];
	smg = [];
	LMG = [];
	pistol = [];
	shotgun = [];
	launcher = [];
	wonder = [];
	table = "gamedata/weapons/zm/zm_levelcommon_weapons.csv";
	index = 1;
	for(row = TableLookupRow(table, index); isdefined(row); row = TableLookupRow(table, index))
	{
		weapon_name = checkStringValid(row[0]);
		WEAPON_CLASS = checkStringValid(row[16]);
		is_wonder_weapon = ToLower(row[18]) == "true";
		if(is_wonder_weapon)
		{
		}
		else if(WEAPON_CLASS == "pistol")
		{
			pistol[pistol.size] = weapon_name;
		}
		else if(WEAPON_CLASS == "rifle")
		{
			rifle[rifle.size] = weapon_name;
		}
		else if(WEAPON_CLASS == "lmg")
		{
			LMG[LMG.size] = weapon_name;
		}
		else if(WEAPON_CLASS == "shotgun")
		{
			shotgun[shotgun.size] = weapon_name;
		}
		else if(WEAPON_CLASS == "smg")
		{
			smg[smg.size] = weapon_name;
		}
		else if(WEAPON_CLASS == "sniper")
		{
			sniper[sniper.size] = weapon_name;
		}
		else if(WEAPON_CLASS == "launcher")
		{
			launcher[launcher.size] = weapon_name;
		}
		index++;
	}
	var_24c32564 = [];
	var_7ea9c657 = [];
	var_55cd3b4c = [];
	var_f79304bc = [];
	var_190804e1 = [];
	var_abf519d8 = [];
	var_276f17b = [];
	var_e1f9f377 = [];
	var_c4b68c6c = [];
	Wallbuys = struct::get_array("weapon_upgrade", "targetname");
	for(i = 0; i < Wallbuys.size; i++)
	{
		weapon = Wallbuys[i].zombie_weapon_upgrade;
		if(isdefined(var_24c32564[weapon]))
		{
			Wallbuys[i].zombie_weapon_upgrade = var_24c32564[weapon];
			continue;
		}
		gun = GetWeapon(weapon);
		weapClass = gun.weapClass;
		if(weapClass == "rifle")
		{
			if(gun.isSniperWeapon)
			{
				var_cd5ceaeb = sniper[var_55cd3b4c.size];
				if(!isdefined(var_cd5ceaeb))
				{
					var_cd5ceaeb = sniper[0];
				}
				var_55cd3b4c[var_55cd3b4c.size] = var_cd5ceaeb;
				Wallbuys[i].zombie_weapon_upgrade = var_cd5ceaeb;
				var_24c32564[weapon] = var_cd5ceaeb;
			}
			else
			{
				var_cd5ceaeb = rifle[var_7ea9c657.size];
				if(!isdefined(var_cd5ceaeb))
				{
					var_cd5ceaeb = rifle[0];
				}
				var_7ea9c657[var_7ea9c657.size] = var_cd5ceaeb;
				Wallbuys[i].zombie_weapon_upgrade = var_cd5ceaeb;
				var_24c32564[weapon] = var_cd5ceaeb;
				continue;
			}
		}
		if(weapClass == "pistol" || weapClass == "pistolspread" || weapClass == "pistol spread")
		{
			var_cd5ceaeb = pistol[var_abf519d8.size];
			if(!isdefined(var_cd5ceaeb))
			{
				var_cd5ceaeb = pistol[0];
			}
			var_abf519d8[var_abf519d8.size] = var_cd5ceaeb;
			Wallbuys[i].zombie_weapon_upgrade = var_cd5ceaeb;
			var_24c32564[weapon] = var_cd5ceaeb;
			continue;
		}
		if(weapClass == "mg")
		{
			var_cd5ceaeb = LMG[var_190804e1.size];
			if(!isdefined(var_cd5ceaeb))
			{
				var_cd5ceaeb = LMG[0];
			}
			var_190804e1[var_190804e1.size] = var_cd5ceaeb;
			Wallbuys[i].zombie_weapon_upgrade = var_cd5ceaeb;
			var_24c32564[weapon] = var_cd5ceaeb;
			continue;
		}
		if(weapClass == "smg")
		{
			var_cd5ceaeb = smg[var_f79304bc.size];
			if(!isdefined(var_cd5ceaeb))
			{
				var_cd5ceaeb = smg[0];
			}
			var_f79304bc[var_f79304bc.size] = var_cd5ceaeb;
			Wallbuys[i].zombie_weapon_upgrade = var_cd5ceaeb;
			var_24c32564[weapon] = var_cd5ceaeb;
			continue;
		}
		if(weapClass == "spread")
		{
			var_cd5ceaeb = shotgun[var_276f17b.size];
			if(!isdefined(var_cd5ceaeb))
			{
				var_cd5ceaeb = shotgun[0];
			}
			var_276f17b[var_276f17b.size] = var_cd5ceaeb;
			Wallbuys[i].zombie_weapon_upgrade = var_cd5ceaeb;
			var_24c32564[weapon] = var_cd5ceaeb;
			continue;
		}
		if(weapClass == "rocketlauncher")
		{
			var_cd5ceaeb = launcher[var_e1f9f377.size];
			if(!isdefined(var_cd5ceaeb))
			{
				var_cd5ceaeb = launcher[0];
			}
			var_e1f9f377[var_e1f9f377.size] = var_cd5ceaeb;
			Wallbuys[i].zombie_weapon_upgrade = var_cd5ceaeb;
			var_24c32564[weapon] = var_cd5ceaeb;
		}
	}
}

