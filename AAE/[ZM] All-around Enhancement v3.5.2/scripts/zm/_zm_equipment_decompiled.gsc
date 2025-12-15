#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace zm_equipment;

/*
	Name: __init__sytem__
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x430
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 30
*/
function autoexec __init__sytem__()
{
	system::register("zm_equipment", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x478
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function __init__()
{
	level.buildable_piece_count = 24;
	level._equipment_disappear_fx = "_t6/maps/zombie/fx_zmb_tranzit_electrap_explo";
	level.placeable_equipment_destroy_fn = [];
	if(!(isdefined(level._no_equipment_activated_clientfield) && level._no_equipment_activated_clientfield))
	{
		clientfield::register("scriptmover", "equipment_activated", 1, 4, "int");
	}
}

/*
	Name: __main__
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x4F8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function __main__()
{
	init_upgrade();
}

/*
	Name: signal_activated
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x518
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 81
*/
function signal_activated(VAL)
{
	if(!isdefined(VAL))
	{
		VAL = 1;
	}
	if(isdefined(level._no_equipment_activated_clientfield) && level._no_equipment_activated_clientfield)
	{
		return;
	}
	self endon("death");
	self clientfield::set("equipment_activated", VAL);
	for(i = 0; i < 2; i++)
	{
		util::wait_network_frame();
	}
	self clientfield::set("equipment_activated", 0);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: register
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x5E0
	Size: 0x200
	Parameters: 5
	Flags: None
	Line Number: 113
*/
function register(equipment_name, hint, howto_hint, hint_icon, equipmentVO)
{
	equipment = GetWeapon(equipment_name);
	struct = spawnstruct();
	if(!isdefined(level.zombie_equipment))
	{
		level.zombie_equipment = [];
	}
	struct.equipment = equipment;
	struct.hint = hint;
	struct.howto_hint = howto_hint;
	struct.hint_icon = hint_icon;
	struct.vox = equipmentVO;
	struct.triggers = [];
	struct.models = [];
	struct.notify_strings = spawnstruct();
	struct.notify_strings.activate = equipment.name + "_activate";
	struct.notify_strings.deactivate = equipment.name + "_deactivate";
	struct.notify_strings.taken = equipment.name + "_taken";
	struct.notify_strings.pickup = equipment.name + "_pickup";
	level.zombie_equipment[equipment] = struct;
}

/*
	Name: register_slot_watcher_override
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x7E8
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 146
*/
function register_slot_watcher_override(str_equipment, func_slot_watcher_override)
{
	level.a_func_equipment_slot_watcher_override[str_equipment] = func_slot_watcher_override;
}

/*
	Name: is_included
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x818
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 161
*/
function is_included(equipment)
{
	if(!isdefined(level.zombie_include_equipment))
	{
		return 0;
	}
	if(IsString(equipment))
	{
		equipment = GetWeapon(equipment);
	}
	return isdefined(level.zombie_include_equipment[equipment.rootweapon]);
}

/*
	Name: Include
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x890
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 184
*/
function Include(equipment_name)
{
	if(!isdefined(level.zombie_include_equipment))
	{
		level.zombie_include_equipment = [];
	}
	level.zombie_include_equipment[GetWeapon(equipment_name)] = 1;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: set_ammo_driven
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x8E0
	Size: 0xC0
	Parameters: 3
	Flags: None
	Line Number: 205
*/
function set_ammo_driven(equipment_name, start, refill_max_ammo)
{
	if(!isdefined(refill_max_ammo))
	{
		refill_max_ammo = 0;
	}
	level.zombie_equipment[GetWeapon(equipment_name)].notake = 1;
	level.zombie_equipment[GetWeapon(equipment_name)].start_ammo = start;
	level.zombie_equipment[GetWeapon(equipment_name)].refill_max_ammo = refill_max_ammo;
}

/*
	Name: limit
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x9A8
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 226
*/
function limit(equipment_name, limited)
{
	if(!isdefined(level._limited_equipment))
	{
		level._limited_equipment = [];
	}
	if(limited)
	{
		level._limited_equipment[level._limited_equipment.size] = GetWeapon(equipment_name);
	}
	else
	{
		ArrayRemoveValue(level._limited_equipment, GetWeapon(equipment_name), 0);
	}
}

/*
	Name: init_upgrade
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0xA48
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 252
*/
function init_upgrade()
{
	equipment_spawns = [];
	equipment_spawns = GetEntArray("zombie_equipment_upgrade", "targetname");
	for(i = 0; i < equipment_spawns.size; i++)
	{
		equipment_spawns[i].equipment = GetWeapon(equipment_spawns[i].zombie_equipment_upgrade);
		hint_string = get_hint(equipment_spawns[i].equipment);
		equipment_spawns[i] setHintString(hint_string);
		equipment_spawns[i] setcursorhint("HINT_NOICON");
		equipment_spawns[i] UseTriggerRequireLookAt();
		equipment_spawns[i] add_to_trigger_list(equipment_spawns[i].equipment);
		equipment_spawns[i] thread equipment_spawn_think();
	}
}

/*
	Name: get_hint
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0xBD8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 278
*/
function get_hint(equipment)
{
	/#
		Assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "Dev Block strings are not supported");
	#/
	return level.zombie_equipment[equipment].hint;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_howto_hint
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0xC40
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 297
*/
function get_howto_hint(equipment)
{
	/#
		Assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "Dev Block strings are not supported");
	#/
	return level.zombie_equipment[equipment].howto_hint;
}

/*
	Name: get_icon
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0xCA8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 315
*/
function get_icon(equipment)
{
	/#
		Assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "Dev Block strings are not supported");
	#/
	return level.zombie_equipment[equipment].hint_icon;
}

/*
	Name: get_notify_strings
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0xD10
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 333
*/
function get_notify_strings(equipment)
{
	/#
		Assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "Dev Block strings are not supported");
	#/
	return level.zombie_equipment[equipment].notify_strings;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: add_to_trigger_list
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0xD78
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 352
*/
function add_to_trigger_list(equipment)
{
	/#
		Assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "Dev Block strings are not supported");
	#/
	level.zombie_equipment[equipment].triggers[level.zombie_equipment[equipment].triggers.size] = self;
	level.zombie_equipment[equipment].models[level.zombie_equipment[equipment].models.size] = GetEnt(self.target, "targetname");
}

/*
	Name: equipment_spawn_think
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0xE50
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 371
*/
function equipment_spawn_think()
{
	self endon(self.zombie_equipment_upgrade + "_end");
	for(;;)
	{
		self waittill("trigger", player);
		if(player zm_utility::in_revive_trigger() || player.IS_DRINKING > 0)
		{
			wait(0.1);
		}
		else if(!is_limited(self.equipment) || !limited_in_use(self.equipment))
		{
			if(is_limited(self.equipment))
			{
				player setup_limited(self.equipment);
				if(isdefined(level.hacker_tool_positions))
				{
					new_pos = Array::random(level.hacker_tool_positions);
					self.origin = new_pos.trigger_org;
					model = GetEnt(self.target, "targetname");
					model.origin = new_pos.model_org;
					model.angles = new_pos.model_ang;
				}
			}
			player give(self.equipment);
		}
		else
		{
			wait(0.1);
		}
	}
}

/*
	Name: set_equipment_invisibility_to_player
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x1020
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 414
*/
function set_equipment_invisibility_to_player(equipment, invisible)
{
	triggers = level.zombie_equipment[equipment].triggers;
	for(i = 0; i < triggers.size; i++)
	{
		if(isdefined(triggers[i]))
		{
			triggers[i] setinvisibletoplayer(self, invisible);
		}
	}
	models = level.zombie_equipment[equipment].models;
	for(i = 0; i < models.size; i++)
	{
		if(isdefined(models[i]))
		{
			models[i] setinvisibletoplayer(self, invisible);
		}
	}
	return;
}

/*
	Name: take
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x1138
	Size: 0x280
	Parameters: 1
	Flags: None
	Line Number: 445
*/
function take(equipment)
{
	if(!isdefined(equipment))
	{
		equipment = self get_player_equipment();
	}
	if(!isdefined(equipment))
	{
		return;
	}
	if(equipment == level.weaponNone)
	{
		return;
	}
	if(!self has_player_equipment(equipment))
	{
		return;
	}
	current = 0;
	current_weapon = 0;
	if(isdefined(self get_player_equipment()) && equipment == self get_player_equipment())
	{
		current = 1;
	}
	if(equipment == self GetCurrentWeapon())
	{
		current_weapon = 1;
	}
	notify_strings = get_notify_strings(equipment);
	if(isdefined(self.current_equipment_active[equipment]) && self.current_equipment_active[equipment])
	{
		self.current_equipment_active[equipment] = 0;
		self notify(notify_strings.deactivate);
	}
	self notify(notify_strings.taken);
	self TakeWeapon(equipment);
	if(!is_limited(equipment) || (is_limited(equipment) && !limited_in_use(equipment)))
	{
		self set_equipment_invisibility_to_player(equipment, 0);
	}
	if(current)
	{
		self set_player_equipment(level.weaponNone);
		self SetActionSlot(2, "");
	}
	else
	{
		ArrayRemoveValue(self.deployed_equipment, equipment);
	}
	if(current_weapon)
	{
		self zm_weapons::switch_back_primary_weapon();
	}
}

/*
	Name: give
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x13C0
	Size: 0x260
	Parameters: 1
	Flags: None
	Line Number: 510
*/
function give(equipment)
{
	if(!isdefined(equipment))
	{
		return;
	}
	if(!isdefined(level.zombie_equipment[equipment]))
	{
		return;
	}
	if(GetDvarString("aaeoption_nopes") == "1" && equipment == level.var_f486078e)
	{
		return;
	}
	if(self has_player_equipment(equipment))
	{
		return;
	}
	self take();
	foreach(weapon in self GetWeaponsList(1))
	{
		if(isdefined(weapon.isRiotShield) && weapon.isRiotShield)
		{
			self TakeWeapon(weapon);
		}
	}
	self set_player_equipment(equipment);
	self GiveWeapon(equipment);
	self start_ammo(equipment);
	self thread show_hint(equipment);
	self set_equipment_invisibility_to_player(equipment, 1);
	self SetActionSlot(2, "weapon", equipment);
	self thread slot_watcher(equipment);
	self zm_audio::create_and_play_dialog("weapon_pickup", level.zombie_equipment[equipment].vox);
	self notify("player_given", equipment);
}

/*
	Name: buy
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x1628
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 557
*/
function buy(equipment)
{
	if(IsString(equipment))
	{
		equipment = GetWeapon(equipment);
	}
	if(isdefined(self.current_equipment) && equipment != self.current_equipment && self.current_equipment != level.weaponNone)
	{
		self take(self.current_equipment);
	}
	self notify("player_bought", equipment);
	self give(equipment);
	if(equipment.isRiotShield && isdefined(self.player_shield_reset_health))
	{
		self [[self.player_shield_reset_health]]();
		return;
	}
}

/*
	Name: slot_watcher
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x1718
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 586
*/
function slot_watcher(equipment)
{
	self notify("kill_equipment_slot_watcher");
	self endon("kill_equipment_slot_watcher");
	self endon("disconnect");
	self endon("death");
	notify_strings = get_notify_strings(equipment);
	while(1)
	{
		self waittill("weapon_change", curr_weapon, prev_weapon);
		if(self.sessionstate != "spectator")
		{
			self.prev_weapon_before_equipment_change = undefined;
			if(isdefined(prev_weapon) && level.weaponNone != prev_weapon)
			{
				prev_weapon_type = prev_weapon.inventoryType;
				if("primary" == prev_weapon_type || "altmode" == prev_weapon_type)
				{
					self.prev_weapon_before_equipment_change = prev_weapon;
				}
			}
			if(!isdefined(level.a_func_equipment_slot_watcher_override))
			{
				level.a_func_equipment_slot_watcher_override = [];
			}
			if(isdefined(level.a_func_equipment_slot_watcher_override[equipment.name]))
			{
				self [[level.a_func_equipment_slot_watcher_override[equipment.name]]](equipment, curr_weapon, prev_weapon, notify_strings);
			}
			else if(curr_weapon == equipment && !self.current_equipment_active[equipment])
			{
				self notify(notify_strings.activate);
				self.current_equipment_active[equipment] = 1;
			}
			else if(curr_weapon != equipment && self.current_equipment_active[equipment])
			{
				self notify(notify_strings.deactivate);
				self.current_equipment_active[equipment] = 0;
			}
		}
	}
}

/*
	Name: is_limited
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x1928
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 639
*/
function is_limited(equipment)
{
	if(isdefined(level._limited_equipment))
	{
		for(i = 0; i < level._limited_equipment.size; i++)
		{
			if(level._limited_equipment[i] == equipment)
			{
				return 1;
			}
		}
	}
	return 0;
}

/*
	Name: limited_in_use
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x1998
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 664
*/
function limited_in_use(equipment)
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		current_equipment = players[i] get_player_equipment();
		if(isdefined(current_equipment) && current_equipment == equipment)
		{
			return 1;
		}
	}
	if(isdefined(level.dropped_equipment) && isdefined(level.dropped_equipment[equipment]))
	{
		return 1;
	}
	return 0;
	~current_equipment;
}

/*
	Name: setup_limited
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x1A60
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 693
*/
function setup_limited(equipment)
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] set_equipment_invisibility_to_player(equipment, 1);
	}
	self thread release_limited_on_disconnect(equipment);
	self thread release_limited_on_taken(equipment);
}

/*
	Name: release_limited_on_taken
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x1B10
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 714
*/
function release_limited_on_taken(equipment)
{
	self endon("disconnect");
	self endon("death");
	notify_strings = get_notify_strings(equipment);
	self util::waittill_either(notify_strings.taken, "spawned_spectator");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] set_equipment_invisibility_to_player(equipment, 0);
	}
}

/*
	Name: release_limited_on_disconnect
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x1BF8
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 737
*/
function release_limited_on_disconnect(equipment)
{
	notify_strings = get_notify_strings(equipment);
	self endon(notify_strings.taken);
	self waittill("disconnect");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(isalive(players[i]))
		{
			players[i] set_equipment_invisibility_to_player(equipment, 0);
		}
	}
}

/*
	Name: is_active
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x1CE0
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 762
*/
function is_active(equipment)
{
	if(isdefined(self.var_a32f5476) && self.var_a32f5476 && isdefined(level.var_f486078e) && equipment === level.var_f486078e)
	{
		return 1;
	}
	if(!isdefined(self.current_equipment_active) || !isdefined(self.current_equipment_active[equipment]))
	{
		return 0;
	}
	return self.current_equipment_active[equipment];
}

/*
	Name: init_hint_hudelem
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x1D68
	Size: 0x88
	Parameters: 6
	Flags: None
	Line Number: 785
*/
function init_hint_hudelem(x, y, alignX, alignY, fontscale, alpha)
{
	self.x = x;
	self.y = y;
	self.alignX = alignX;
	self.alignY = alignY;
	self.fontscale = fontscale;
	self.alpha = alpha;
	self.sort = 20;
}

/*
	Name: setup_client_hintelem
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x1DF8
	Size: 0x168
	Parameters: 3
	Flags: None
	Line Number: 806
*/
function setup_client_hintelem(ypos, font_scale, text)
{
	if(!isdefined(ypos))
	{
		ypos = 220;
	}
	if(!isdefined(font_scale))
	{
		font_scale = 1.25;
	}
	self endon("death");
	self endon("disconnect");
	self endon("death");
	if(isdefined(self.hintElem2))
	{
		wait(0.1);
		self CloseLUIMenu(self.hintElem2);
		wait(0.2);
	}
	hint = &"ZM_ZOD_EXIT_BEAST_MODE_HINT";
	var_fdf7a64c = &"ZM_ZOD_EXIT_BEAST_MODE_HINT_COOP";
	if(text == hint || text == var_fdf7a64c)
	{
		self.hintElem2 = self hud::function_1143b5c4(text, 2, 0, 509, 1280, (1, 1, 1), 23, "0,200,1");
	}
	else
	{
		self.hintElem2 = self hud::function_1143b5c4(text, 2, 0, 309, 1280, (1, 1, 1), 23, "0,200,1");
	}
}

/*
	Name: show_hint
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x1F68
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 847
*/
function show_hint(equipment)
{
	self notify("kill_previous_show_equipment_hint_thread");
	self endon("kill_previous_show_equipment_hint_thread");
	self endon("death");
	self endon("disconnect");
	self endon("death");
	if(isdefined(self.do_not_display_equipment_pickup_hint) && self.do_not_display_equipment_pickup_hint)
	{
		return;
	}
	wait(0.5);
	text = get_howto_hint(equipment);
	self show_hint_text(text);
}

/*
	Name: show_hint_text
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x2020
	Size: 0x1D8
	Parameters: 4
	Flags: None
	Line Number: 873
*/
function show_hint_text(text, show_for_time, font_scale, ypos)
{
	if(!isdefined(show_for_time))
	{
		show_for_time = 3.2;
	}
	if(!isdefined(font_scale))
	{
		font_scale = 1.25;
	}
	if(!isdefined(ypos))
	{
		ypos = 220;
	}
	if(text == &"ZOMBIE_ROCKET_HINT" || text == &"ZM_ZOD_ROCKET_HINT")
	{
		weapon = self GetCurrentWeapon();
		if(weapon.name == "zod_riotshield" || weapon.name == "zod_riotshield_upgraded")
		{
			return;
		}
		else
		{
		}
	}
	self notify("hash_b7508552");
	self endon("hash_b7508552");
	self endon("disconnect");
	self endon("death");
	wait(0.05);
	self setup_client_hintelem(ypos, font_scale, text);
	if(show_for_time < 3.2)
	{
		show_for_time = 4;
	}
	wait(show_for_time);
	if(isdefined(self.hintElem2))
	{
		wait(0.1);
		self SetLUIMenuData(self.hintElem2, "fadeOverTime", "1,200,0");
		wait(0.3);
		self CloseLUIMenu(self.hintElem2);
		self.hintElem2 = undefined;
	}
}

/*
	Name: start_ammo
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x2200
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 929
*/
function start_ammo(equipment)
{
	if(self hasweapon(equipment))
	{
		maxAmmo = 1;
		if(isdefined(level.zombie_equipment[equipment].notake) && level.zombie_equipment[equipment].notake)
		{
			maxAmmo = level.zombie_equipment[equipment].start_ammo;
		}
		self SetWeaponAmmoClip(equipment, maxAmmo);
		self notify("equipment_ammo_changed", equipment);
		return maxAmmo;
	}
	return 0;
}

/*
	Name: change_ammo
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x22D0
	Size: 0x140
	Parameters: 2
	Flags: None
	Line Number: 955
*/
function change_ammo(equipment, change)
{
	if(self hasweapon(equipment))
	{
		oldammo = self GetWeaponAmmoClip(equipment);
		maxAmmo = 1;
		if(isdefined(level.zombie_equipment[equipment].notake) && level.zombie_equipment[equipment].notake)
		{
			maxAmmo = level.zombie_equipment[equipment].start_ammo;
		}
		newAmmo = Int(min(maxAmmo, max(0, oldammo + change)));
		self SetWeaponAmmoClip(equipment, newAmmo);
		self notify("equipment_ammo_changed", equipment);
		return newAmmo;
	}
	return 0;
}

/*
	Name: disappear_fx
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x2418
	Size: 0xA8
	Parameters: 3
	Flags: None
	Line Number: 983
*/
function disappear_fx(origin, FX, angles)
{
	effect = level._equipment_disappear_fx;
	if(isdefined(FX))
	{
		effect = FX;
	}
	if(isdefined(angles))
	{
		playFX(effect, origin, AnglesToForward(angles));
	}
	else
	{
		playFX(effect, origin);
	}
	wait(1.1);
}

/*
	Name: register_for_level
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x24C8
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 1011
*/
function register_for_level(weaponName)
{
	weapon = GetWeapon(weaponName);
	if(is_equipment(weapon) || weapon === level.weaponNone)
	{
		return;
	}
	if(!isdefined(level.zombie_equipment_list))
	{
		level.zombie_equipment_list = [];
	}
	level.zombie_equipment_list[weapon] = weapon;
}

/*
	Name: is_equipment
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x2558
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 1035
*/
function is_equipment(weapon)
{
	if(!isdefined(weapon) || !isdefined(level.zombie_equipment_list) || (isdefined(weapon) && weapon === level.weaponNone))
	{
		return 0;
	}
	return isdefined(level.zombie_equipment_list[weapon]);
}

/*
	Name: is_equipment_that_blocks_purchase
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x25B8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 1054
*/
function is_equipment_that_blocks_purchase(weapon)
{
	return is_equipment(weapon);
}

/*
	Name: is_player_equipment
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x25E8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 1069
*/
function is_player_equipment(weapon)
{
	if(!isdefined(weapon) || !isdefined(self.current_equipment))
	{
		return 0;
	}
	return self.current_equipment == weapon;
}

/*
	Name: has_deployed_equipment
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x2628
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 1088
*/
function has_deployed_equipment(weapon)
{
	if(!isdefined(weapon) || !isdefined(self.deployed_equipment) || self.deployed_equipment.size < 1)
	{
		return 0;
	}
	for(i = 0; i < self.deployed_equipment.size; i++)
	{
		if(self.deployed_equipment[i] == weapon)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: has_player_equipment
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x26C0
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 1114
*/
function has_player_equipment(weapon)
{
	if(self GetCurrentWeapon() != weapon && self hasweapon(weapon) && isdefined(weapon.isRiotShield) && weapon.isRiotShield && isdefined(level.a_uts_craftables) && level.a_uts_craftables.size > 0)
	{
		table = ArrayGetClosest(self.origin, level.a_uts_craftables);
		if(Distance(table.origin, self.origin) < 76 && self DamageRiotShield(0) < 1500)
		{
			return 0;
		}
	}
	return self is_player_equipment(weapon) || self has_deployed_equipment(weapon);
}

/*
	Name: get_player_equipment
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x2808
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 1137
*/
function get_player_equipment()
{
	equipment = level.weaponNone;
	if(isdefined(self.current_equipment))
	{
		equipment = self.current_equipment;
	}
	return equipment;
}

/*
	Name: hacker_active
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x2848
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 1157
*/
function hacker_active()
{
	return self is_active(GetWeapon("equip_hacker"));
}

/*
	Name: set_player_equipment
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x2880
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 1172
*/
function set_player_equipment(weapon)
{
	if(!isdefined(self.current_equipment_active))
	{
		self.current_equipment_active = [];
	}
	if(isdefined(weapon))
	{
		self.current_equipment_active[weapon] = 0;
	}
	if(!isdefined(self.equipment_got_in_round))
	{
		self.equipment_got_in_round = [];
	}
	if(isdefined(weapon))
	{
		self.equipment_got_in_round[weapon] = level.round_number;
	}
	self notify("new_equipment", weapon);
	self.current_equipment = weapon;
}

/*
	Name: init_player_equipment
	Namespace: zm_equipment
	Checksum: 0x424F4353
	Offset: 0x2920
	Size: 0x24
	Parameters: 0
	Flags: None
	Line Number: 1204
*/
function init_player_equipment()
{
	self set_player_equipment(level.zombie_equipment_player_init);
}

