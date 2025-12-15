#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_sub;
#include scripts\zm\_zm_utility;

#namespace zm_weapons;

/*
	Name: __init__sytem__
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x350
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("zm_weapons", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x398
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	level flag::init("weapon_table_loaded");
	level flag::init("weapon_wallbuys_created");
	callback::on_localclient_connect(&on_player_connect);
	level.var_e7d6379d = [];
}

/*
	Name: __main__
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x410
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function __main__()
{
	level thread function_d318b6da();
}

/*
	Name: function_d318b6da
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x438
	Size: 0x110
	Parameters: 0
	Flags: Private
	Line Number: 69
*/
function private function_d318b6da()
{
	while(!isdefined(level.var_e7d6379d))
	{
		wait(1);
	}
	while(level.var_e7d6379d.size < 1)
	{
		wait(1);
	}
	for(i = 0; i < level.var_e7d6379d.size; i++)
	{
		weapon = level.var_e7d6379d[i];
		if(!is_wallbuy(weapon) || level.weapon_costs[weapon.name].cost > 950 && weapon != level.weaponNone)
		{
			AddZombieBoxWeapon(weapon, weapon.worldmodel, weapon.isDualWield);
		}
	}
	level.var_e7d6379d = undefined;
}

/*
	Name: on_player_connect
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x550
	Size: 0x2D8
	Parameters: 1
	Flags: Private
	Line Number: 100
*/
function private on_player_connect(localClientNum)
{
	if(GetMigrationStatus(localClientNum))
	{
		return;
	}
	ResetWeaponCosts(localClientNum);
	level flag::wait_till("weapon_table_loaded");
	level flag::wait_till("weapon_wallbuys_created");
	if(GetDvarString("ui_mapname", "") == "3303537924")
	{
		foreach(weaponCost in level.weapon_costs)
		{
			if(is_wallbuy(weaponCost.weapon))
			{
				SetWeaponCosts(localClientNum, weaponCost.weapon, weaponCost.cost, 0, 0);
			}
		}
		var_b7b8556e = 250;
		while(1)
		{
			SetWeaponCosts(localClientNum, GetWeapon("complex_shield"), var_b7b8556e, 0, 0);
			level waittillmatch("hash_f3406923");
			var_b7b8556e = var_b7b8556e + 250;
		}
	}
	else
	{
		foreach(weaponCost in level.weapon_costs)
		{
			player_cost = compute_player_weapon_ammo_cost(weaponCost.weapon, weaponCost.ammo_cost, weaponCost.upgraded);
			SetWeaponCosts(localClientNum, weaponCost.weapon, weaponCost.cost, weaponCost.ammo_cost, player_cost);
		}
	}
}

/*
	Name: is_weapon_included
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x830
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 146
*/
function is_weapon_included(weapon)
{
	if(!isdefined(level._included_weapons))
	{
		return 0;
	}
	return isdefined(level._included_weapons[weapon.rootweapon]);
}

/*
	Name: compute_player_weapon_ammo_cost
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x870
	Size: 0x120
	Parameters: 5
	Flags: None
	Line Number: 165
*/
function compute_player_weapon_ammo_cost(weapon, cost, upgraded, n_base_non_wallbuy_cost, n_upgraded_non_wallbuy_cost)
{
	if(!isdefined(n_base_non_wallbuy_cost))
	{
		n_base_non_wallbuy_cost = 750;
	}
	if(!isdefined(n_upgraded_non_wallbuy_cost))
	{
		n_upgraded_non_wallbuy_cost = 5000;
	}
	w_root = weapon.rootweapon;
	if(upgraded)
	{
		if(is_wallbuy(level.zombie_weapons_upgraded[w_root]))
		{
			n_ammo_cost = 4000;
		}
		else
		{
			n_ammo_cost = n_upgraded_non_wallbuy_cost;
		}
	}
	else if(is_wallbuy(w_root))
	{
		n_ammo_cost = cost;
		n_ammo_cost = zm_utility::halve_score(n_ammo_cost);
	}
	else
	{
		n_ammo_cost = n_base_non_wallbuy_cost;
	}
	return n_ammo_cost;
}

/*
	Name: include_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x998
	Size: 0x2B0
	Parameters: 5
	Flags: None
	Line Number: 209
*/
function include_weapon(weapon_name, display_in_box, cost, ammo_cost, upgraded)
{
	if(!isdefined(upgraded))
	{
		upgraded = 0;
	}
	if(!isdefined(level._included_weapons))
	{
		level._included_weapons = [];
	}
	weapon = GetWeapon(weapon_name);
	level._included_weapons[weapon] = weapon;
	if(!isdefined(level.weapon_costs))
	{
		level.weapon_costs = [];
	}
	if(!isdefined(level.weapon_costs[weapon_name]))
	{
		level.weapon_costs[weapon_name] = spawnstruct();
		level.weapon_costs[weapon_name].weapon = weapon;
	}
	level.weapon_costs[weapon_name].cost = cost;
	if(!isdefined(ammo_cost) || ammo_cost == 0)
	{
		ammo_cost = zm_utility::round_up_to_ten(Int(cost * 0.5));
	}
	level.weapon_costs[weapon_name].ammo_cost = ammo_cost;
	level.weapon_costs[weapon_name].upgraded = upgraded;
	if(isdefined(display_in_box) && !display_in_box)
	{
		return;
	}
	if(!isdefined(level._resetZombieBoxWeapons))
	{
		level._resetZombieBoxWeapons = 1;
		ResetZombieBoxWeapons();
	}
	if(!isdefined(weapon.worldmodel))
	{
		thread util::error("Missing worldmodel for weapon " + weapon_name + " (or weapon may be missing from fastfile).");
		return;
	}
	if(isdefined(level.var_e7d6379d))
	{
		level.var_e7d6379d[level.var_e7d6379d.size] = weapon;
	}
	else if(!is_wallbuy(weapon) || cost > 950 && weapon != level.weaponNone)
	{
		AddZombieBoxWeapon(weapon, weapon.worldmodel, weapon.isDualWield);
	}
}

/*
	Name: include_upgraded_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xC50
	Size: 0xC8
	Parameters: 5
	Flags: None
	Line Number: 271
*/
function include_upgraded_weapon(weapon_name, upgrade_name, display_in_box, cost, ammo_cost)
{
	include_weapon(upgrade_name, display_in_box, cost, ammo_cost, 1);
	if(!isdefined(level.zombie_weapons_upgraded))
	{
		level.zombie_weapons_upgraded = [];
	}
	weapon = GetWeapon(weapon_name);
	upgrade = GetWeapon(upgrade_name);
	level.zombie_weapons_upgraded[upgrade] = weapon;
	return;
}

/*
	Name: is_weapon_upgraded
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xD20
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 294
*/
function is_weapon_upgraded(weapon)
{
	rootweapon = weapon.rootweapon;
	if(isdefined(level.zombie_weapons_upgraded[rootweapon]))
	{
		return 1;
	}
	return 0;
}

/*
	Name: init
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xD70
	Size: 0x728
	Parameters: 0
	Flags: None
	Line Number: 314
*/
function init()
{
	spawn_list = [];
	spawnable_weapon_spawns = struct::get_array("weapon_upgrade", "targetname");
	if(GetDvarString("mapname") == "zm_zod")
	{
		for(i = 0; i < spawnable_weapon_spawns.size; i++)
		{
			if(isdefined(spawnable_weapon_spawns[i].zombie_weapon_upgrade) && spawnable_weapon_spawns[i].zombie_weapon_upgrade == "smg_versatile" && spawnable_weapon_spawns[i].origin == (2335.29, -6720.29, 312))
			{
				spawnable_weapon_spawns[i].origin = (2629.63, -7197.64, 313.796);
			}
		}
	}
	spawnable_weapon_spawns = ArrayCombine(spawnable_weapon_spawns, struct::get_array("bowie_upgrade", "targetname"), 1, 0);
	spawnable_weapon_spawns = ArrayCombine(spawnable_weapon_spawns, struct::get_array("sickle_upgrade", "targetname"), 1, 0);
	spawnable_weapon_spawns = ArrayCombine(spawnable_weapon_spawns, struct::get_array("tazer_upgrade", "targetname"), 1, 0);
	spawnable_weapon_spawns = ArrayCombine(spawnable_weapon_spawns, struct::get_array("buildable_wallbuy", "targetname"), 1, 0);
	if(isdefined(level.use_autofill_wallbuy) && level.use_autofill_wallbuy)
	{
		spawnable_weapon_spawns = ArrayCombine(spawnable_weapon_spawns, level.active_autofill_wallbuys, 1, 0);
	}
	if(!(isdefined(level.headshots_only) && level.headshots_only))
	{
		spawnable_weapon_spawns = ArrayCombine(spawnable_weapon_spawns, struct::get_array("claymore_purchase", "targetname"), 1, 0);
	}
	location = level.scr_zm_map_start_location;
	if(location == "default" || location == "" && isdefined(level.default_start_location))
	{
		location = level.default_start_location;
	}
	match_string = level.scr_zm_ui_gametype;
	if("" != location)
	{
		match_string = match_string + "_" + location;
	}
	match_string_plus_space = " " + match_string;
	for(i = 0; i < spawnable_weapon_spawns.size; i++)
	{
		spawnable_weapon = spawnable_weapon_spawns[i];
		spawnable_weapon.weapon = GetWeapon(spawnable_weapon.zombie_weapon_upgrade);
		if(isdefined(spawnable_weapon.zombie_weapon_upgrade) && spawnable_weapon.weapon.isgrenadeweapon && (isdefined(level.headshots_only) && level.headshots_only))
		{
			continue;
		}
		if(!isdefined(spawnable_weapon.script_noteworthy) || spawnable_weapon.script_noteworthy == "")
		{
			spawn_list[spawn_list.size] = spawnable_weapon;
			continue;
		}
		matches = StrTok(spawnable_weapon.script_noteworthy, ",");
		for(j = 0; j < matches.size; j++)
		{
			if(matches[j] == match_string || matches[j] == match_string_plus_space)
			{
				spawn_list[spawn_list.size] = spawnable_weapon;
			}
		}
	}
	level._active_wallbuys = [];
	for(i = 0; i < spawn_list.size; i++)
	{
		spawn_list[i].script_label = spawn_list[i].zombie_weapon_upgrade + "_" + spawn_list[i].origin;
		level._active_wallbuys[spawn_list[i].script_label] = spawn_list[i];
		numBits = 2;
		if(isdefined(level._wallbuy_override_num_bits))
		{
			numBits = level._wallbuy_override_num_bits;
		}
		clientfield::register("world", spawn_list[i].script_label, 1, numBits, "int", &wallbuy_callback, 0, 1);
		target_struct = struct::get(spawn_list[i].target, "targetname");
		if(spawn_list[i].targetname == "buildable_wallbuy")
		{
			bits = 4;
			if(isdefined(level.buildable_wallbuy_weapons))
			{
				bits = GetMinBitCountForNum(level.buildable_wallbuy_weapons.size + 1);
			}
			clientfield::register("world", spawn_list[i].script_label + "_idx", 1, bits, "int", &wallbuy_callback_idx, 0, 1);
		}
	}
	level flag::set("weapon_wallbuys_created");
	callback::on_localclient_connect(&wallbuy_player_connect);
}

/*
	Name: is_wallbuy
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x14A0
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 409
*/
function is_wallbuy(w_to_check)
{
	w_base = w_to_check.rootweapon;
	foreach(s_wallbuy in level._active_wallbuys)
	{
		if(s_wallbuy.weapon == w_base)
		{
			return 1;
		}
	}
	if(isdefined(level._additional_wallbuy_weapons))
	{
		if(IsInArray(level._additional_wallbuy_weapons, w_base))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: wallbuy_player_connect
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1590
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 439
*/
function wallbuy_player_connect(localClientNum)
{
	keys = getArrayKeys(level._active_wallbuys);
	for(i = 0; i < keys.size; i++)
	{
		wallbuy = level._active_wallbuys[keys[i]];
		FX = level._effect["870mcs_zm_fx"];
		if(isdefined(level._effect[wallbuy.zombie_weapon_upgrade + "_fx"]))
		{
			FX = level._effect[wallbuy.zombie_weapon_upgrade + "_fx"];
		}
		target_struct = struct::get(wallbuy.target, "targetname");
		target_model = zm_utility::spawn_buildkit_weapon_model(localClientNum, wallbuy.weapon, undefined, target_struct.origin, target_struct.angles);
		target_model Hide();
		target_model.parent_struct = target_struct;
		wallbuy.models[localClientNum] = target_model;
	}
}

/*
	Name: wallbuy_callback
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1738
	Size: 0x580
	Parameters: 7
	Flags: None
	Line Number: 468
*/
function wallbuy_callback(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(bInitialSnap)
	{
		while(!isdefined(level._active_wallbuys) || !isdefined(level._active_wallbuys[fieldName]))
		{
			wait(0.05);
		}
	}
	struct = level._active_wallbuys[fieldName];
	switch(newVal)
	{
		case 0:
		{
			struct.models[localClientNum].origin = struct.models[localClientNum].parent_struct.origin;
			struct.models[localClientNum].angles = struct.models[localClientNum].parent_struct.angles;
			struct.models[localClientNum] Hide();
			break;
		}
		case 1:
		{
			if(bInitialSnap)
			{
				if(!isdefined(struct.models))
				{
					while(!isdefined(struct.models))
					{
						wait(0.05);
					}
					while(!isdefined(struct.models[localClientNum]))
					{
						wait(0.05);
					}
				}
				struct.models[localClientNum] show();
				struct.models[localClientNum].origin = struct.models[localClientNum].parent_struct.origin;
			}
			else
			{
				wait(0.05);
				if(localClientNum == 0)
				{
					playsound(0, "zmb_weap_wall", struct.origin);
				}
				vec_offset = (0, 0, 0);
				if(isdefined(struct.models[localClientNum].parent_struct.script_vector))
				{
					vec_offset = struct.models[localClientNum].parent_struct.script_vector;
				}
				if(struct.models[localClientNum].model == "wpn_t7_smg_vmp_world" && GetDvarString("mapname") == "zm_zod" && struct.models[localClientNum].parent_struct.origin == (2333.88, -6718.88, 310))
				{
					origin = (2629.63, -7197.64, 313.796);
					struct.models[localClientNum].origin = origin + AnglesToRight(struct.models[localClientNum].angles + vec_offset) * 8;
					struct.models[localClientNum] show();
					struct.models[localClientNum] moveto(origin, 1);
				}
				else
				{
					struct.models[localClientNum].origin = struct.models[localClientNum].parent_struct.origin + AnglesToRight(struct.models[localClientNum].angles + vec_offset) * 8;
					struct.models[localClientNum] show();
					struct.models[localClientNum] moveto(struct.models[localClientNum].parent_struct.origin, 1);
					break;
				}
			}
		}
		case 2:
		{
			if(isdefined(level.wallbuy_callback_hack_override))
			{
				struct.models[localClientNum] [[level.wallbuy_callback_hack_override]]();
				break;
			}
		}
	}
}

/*
	Name: wallbuy_callback_idx
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1CC0
	Size: 0x480
	Parameters: 7
	Flags: None
	Line Number: 554
*/
function wallbuy_callback_idx(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	basefield = GetSubStr(fieldName, 0, fieldName.size - 4);
	struct = level._active_wallbuys[basefield];
	if(newVal == 0)
	{
		if(isdefined(struct.models[localClientNum]))
		{
			struct.models[localClientNum] Hide();
		}
	}
	else if(newVal > 0)
	{
		weaponName = level.buildable_wallbuy_weapons[newVal - 1];
		weapon = GetWeapon(weaponName);
		if(!isdefined(struct.models))
		{
			struct.models = [];
		}
		if(!isdefined(struct.models[localClientNum]))
		{
			target_struct = struct::get(struct.target, "targetname");
			model = undefined;
			if(isdefined(level.buildable_wallbuy_weapon_models[weaponName]))
			{
				model = level.buildable_wallbuy_weapon_models[weaponName];
			}
			angles = target_struct.angles;
			if(isdefined(level.buildable_wallbuy_weapon_angles[weaponName]))
			{
				switch(level.buildable_wallbuy_weapon_angles[weaponName])
				{
					case 90:
					{
						angles = VectorToAngles(AnglesToRight(angles));
						break;
					}
					case 180:
					{
						angles = VectorToAngles(AnglesToForward(angles) * -1);
						break;
					}
					case 270:
					{
						angles = VectorToAngles(AnglesToRight(angles) * -1);
						break;
					}
				}
			}
			target_model = zm_utility::spawn_buildkit_weapon_model(localClientNum, weapon, undefined, target_struct.origin, angles);
			target_model Hide();
			target_model.parent_struct = target_struct;
			struct.models[localClientNum] = target_model;
			if(isdefined(struct.FX[localClientNum]))
			{
				stopfx(localClientNum, struct.FX[localClientNum]);
				struct.FX[localClientNum] = undefined;
			}
			FX = level._effect["870mcs_zm_fx"];
			if(isdefined(level._effect[weaponName + "_fx"]))
			{
				FX = level._effect[weaponName + "_fx"];
			}
			struct.FX[localClientNum] = playFX(localClientNum, FX, struct.origin, AnglesToForward(struct.angles), anglesToUp(struct.angles), 0.1);
			level notify("wallbuy_updated");
		}
	}
}

/*
	Name: checkStringValid
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x2148
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 633
*/
function checkStringValid(STR)
{
	if(STR != "")
	{
		return STR;
	}
	return undefined;
	continue;
}

/*
	Name: load_weapon_spec_from_table
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x2178
	Size: 0x5F0
	Parameters: 2
	Flags: None
	Line Number: 653
*/
function load_weapon_spec_from_table(table, first_row)
{
	if(!isdefined(level.var_344268ad))
	{
		level.var_344268ad = 1;
	}
	gametype = GetDvarString("ui_gametype");
	index = 1;
	for(row = TableLookupRow(table, index); isdefined(row); row = TableLookupRow(table, index))
	{
		weapon_name = checkStringValid(row[0]);
		upgrade_name = checkStringValid(row[1]);
		hint = checkStringValid(row[2]);
		cost = Int(row[3]);
		weaponVO = checkStringValid(row[4]);
		weaponVOresp = checkStringValid(row[5]);
		ammo_cost = undefined;
		if("" != row[6])
		{
			ammo_cost = Int(row[6]);
		}
		create_vox = checkStringValid(row[7]);
		is_zcleansed = ToLower(row[8]) == "true";
		in_box = ToLower(row[9]) != "false";
		upgrade_in_box = ToLower(row[10]) == "true";
		is_limited = ToLower(row[11]) == "true";
		limit = Int(row[12]);
		upgrade_limit = Int(row[13]);
		content_restrict = row[14];
		wallbuy_autospawn = ToLower(row[15]) == "true";
		WEAPON_CLASS = checkStringValid(row[16]);
		is_wonder_weapon = ToLower(row[18]) == "true";
		force_attachments = "";
		if(weapon_name == "tesla_gun" && GetDvarString("mapname") == "zm_theater")
		{
			weapon_name = undefined;
		}
		if(weapon_name == "melee_katana")
		{
			if(GetDvarInt("aae_lite") != 1)
			{
				cost = 10000;
			}
			else
			{
				cost = 500;
			}
		}
		include_weapon(weapon_name, in_box, cost, ammo_cost, 0);
		if(isdefined(upgrade_name))
		{
			include_upgraded_weapon(weapon_name, upgrade_name, upgrade_in_box, cost, 4500);
		}
		weapon = GetWeapon(weapon_name);
		if(!isdefined(level.wallbuy_autofill_weapons))
		{
			level.wallbuy_autofill_weapons = [];
			level.wallbuy_autofill_weapons["all"] = [];
		}
		level.wallbuy_autofill_weapons["all"][weapon] = wallbuy_autospawn;
		if(WEAPON_CLASS != "")
		{
			if(!isdefined(level.wallbuy_autofill_weapons[WEAPON_CLASS]))
			{
				level.wallbuy_autofill_weapons[WEAPON_CLASS] = [];
			}
			level.wallbuy_autofill_weapons[WEAPON_CLASS][weapon] = weapon;
			if(upgrade_name != "")
			{
				weapon_upgrade = GetWeapon(upgrade_name);
				level.wallbuy_autofill_weapons[WEAPON_CLASS][weapon_upgrade] = weapon_upgrade;
			}
		}
		index++;
	}
	level flag::set("weapon_table_loaded");
}

/*
	Name: autofill_wallbuys_init
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x2770
	Size: 0x6A6
	Parameters: 0
	Flags: None
	Line Number: 741
*/
function autofill_wallbuys_init()
{
	Wallbuys = struct::get_array("wallbuy_autofill", "targetname");
	if(!isdefined(Wallbuys) || Wallbuys.size == 0 || !isdefined(level.wallbuy_autofill_weapons) || level.wallbuy_autofill_weapons.size == 0)
	{
		return;
	}
	level.use_autofill_wallbuy = 1;
	array_keys["all"] = getArrayKeys(level.wallbuy_autofill_weapons["all"]);
	index = 0;
	class_all = [];
	level.active_autofill_wallbuys = [];
	foreach(wallbuy in Wallbuys)
	{
		WEAPON_CLASS = wallbuy.script_string;
		weapon = undefined;
		if(isdefined(WEAPON_CLASS) && WEAPON_CLASS != "")
		{
			if(!isdefined(array_keys[WEAPON_CLASS]) && isdefined(level.wallbuy_autofill_weapons[WEAPON_CLASS]))
			{
				array_keys[WEAPON_CLASS] = getArrayKeys(level.wallbuy_autofill_weapons[WEAPON_CLASS]);
			}
			if(isdefined(array_keys[WEAPON_CLASS]))
			{
				for(i = 0; i < array_keys[WEAPON_CLASS].size; i++)
				{
					if(level.wallbuy_autofill_weapons["all"][array_keys[WEAPON_CLASS][i]])
					{
						weapon = array_keys[WEAPON_CLASS][i];
						level.wallbuy_autofill_weapons["all"][weapon] = 0;
						break;
					}
				}
				continue;
			}
			else
			{
			}
		}
		else
		{
			class_all[class_all.size] = wallbuy;
			continue;
		}
		if(!isdefined(weapon))
		{
			continue;
		}
		wallbuy.zombie_weapon_upgrade = weapon.name;
		wallbuy.weapon = weapon;
		right = AnglesToRight(wallbuy.angles);
		wallbuy.origin = wallbuy.origin - right * 2;
		wallbuy.target = "autofill_wallbuy_" + index;
		target_struct = spawnstruct();
		target_struct.targetname = wallbuy.target;
		target_struct.angles = wallbuy.angles;
		target_struct.origin = wallbuy.origin;
		model = wallbuy.weapon.worldmodel;
		target_struct.model = model;
		target_struct struct::init();
		level.active_autofill_wallbuys[level.active_autofill_wallbuys.size] = wallbuy;
		index++;
	}
	foreach(wallbuy in class_all)
	{
		weapon_name = undefined;
		for(i = 0; i < array_keys["all"].size; i++)
		{
			if(level.wallbuy_autofill_weapons["all"][array_keys["all"][i]])
			{
				weapon = array_keys["all"][i];
				level.wallbuy_autofill_weapons["all"][weapon] = 0;
				break;
			}
		}
		if(!isdefined(weapon))
		{
			break;
		}
		wallbuy.zombie_weapon_upgrade = weapon.name;
		wallbuy.weapon = weapon;
		right = AnglesToRight(wallbuy.angles);
		wallbuy.origin = wallbuy.origin - right * 2;
		wallbuy.target = "autofill_wallbuy_" + index;
		target_struct = spawnstruct();
		target_struct.targetname = wallbuy.target;
		target_struct.angles = wallbuy.angles;
		target_struct.origin = wallbuy.origin;
		model = wallbuy.weapon.worldmodel;
		target_struct.model = model;
		target_struct struct::init();
		level.active_autofill_wallbuys[level.active_autofill_wallbuys.size] = wallbuy;
		index++;
	}
}

