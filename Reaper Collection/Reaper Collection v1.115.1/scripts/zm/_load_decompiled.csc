#include scripts\codescripts\struct;
#include scripts\shared\_oob;
#include scripts\shared\abilities\_ability_player;
#include scripts\shared\archetype_shared\archetype_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\clientfaceanim_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\footsteps_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\load_shared;
#include scripts\shared\music_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\turret_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_ambient;
#include scripts\zm\_callbacks;
#include scripts\zm\_destructible;
#include scripts\zm\_global_fx;
#include scripts\zm\_radiant_live_update;
#include scripts\zm\_sticky_grenade;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_playerhealth;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_traps;
#include scripts\zm\craftables\_zm_craftables;
#include scripts\zm\gametypes\_weaponobjects;

#namespace load;

/*
	Name: levelNotifyHandler
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0x630
	Size: 0x40
	Parameters: 3
	Flags: None
	Line Number: 44
*/
function levelNotifyHandler(clientNum, state, oldState)
{
	if(state != "")
	{
		level notify(state, clientNum);
	}
}

/*
	Name: warnMissileLocking
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0x678
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 62
*/
function warnMissileLocking(localClientNum, set)
{
}

/*
	Name: warnMissileLocked
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0x698
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 76
*/
function warnMissileLocked(localClientNum, set)
{
}

/*
	Name: warnMissileFired
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0x6B8
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 90
*/
function warnMissileFired(localClientNum, set)
{
}

/*
	Name: main
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0x6D8
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function main()
{
	zm::init();
	level thread server_time();
	level thread util::init_utility();
	util::REGISTER_SYSTEM("levelNotify", &levelNotifyHandler);
	register_clientfields();
	level.createFX_disable_fx = GetDvarInt("disable_fx") == 1;
	if(isdefined(level._uses_sticky_grenades) && level._uses_sticky_grenades)
	{
		level thread _sticky_grenade::main();
	}
	system::wait_till("all");
	level thread art_review();
	level flagsys::set("load_main_complete");
}

/*
	Name: server_time
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0x800
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 131
*/
function server_time()
{
	for(;;)
	{
		level.serverTime = getServerTime(0);
		wait(0.01);
	}
}

/*
	Name: register_clientfields
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0x838
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 150
*/
function register_clientfields()
{
	clientfield::register("allplayers", "zmbLastStand", 1, 1, "int", &zm::laststand, 0, 1);
	clientfield::register("clientuimodel", "zmhud.swordEnergy", 1, 7, "float", undefined, 0, 0);
	clientfield::register("clientuimodel", "zmhud.swordState", 1, 4, "int", undefined, 0, 0);
	clientfield::register("clientuimodel", "zmhud.swordChargeUpdate", 1, 1, "counter", undefined, 0, 0);
}

/*
	Name: checkStringValid
	Namespace: load
	Checksum: 0x424F4353
	Offset: 0x938
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 168
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
	Offset: 0x968
	Size: 0x8AE
	Parameters: 0
	Flags: None
	Line Number: 187
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

