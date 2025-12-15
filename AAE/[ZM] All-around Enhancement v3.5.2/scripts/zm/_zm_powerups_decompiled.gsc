#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_bb;
#include scripts\zm\_util;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\aae_left_ges;

#namespace zm_powerups;

/*
	Name: init
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0xD00
	Size: 0x338
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function init()
{
	zombie_utility::set_zombie_var("zombie_insta_kill", 0, undefined, undefined, 1);
	zombie_utility::set_zombie_var("zombie_point_scalar", 1, undefined, undefined, 1);
	zombie_utility::set_zombie_var("zombie_drop_item", 0);
	zombie_utility::set_zombie_var("zombie_timer_offset", 350);
	zombie_utility::set_zombie_var("zombie_timer_offset_interval", 30);
	zombie_utility::set_zombie_var("zombie_powerup_fire_sale_on", 0);
	zombie_utility::set_zombie_var("zombie_powerup_fire_sale_time", 30);
	zombie_utility::set_zombie_var("zombie_powerup_bonfire_sale_on", 0);
	zombie_utility::set_zombie_var("zombie_powerup_bonfire_sale_time", 30);
	zombie_utility::set_zombie_var("zombie_powerup_insta_kill_on", 0, undefined, undefined, 1);
	zombie_utility::set_zombie_var("zombie_powerup_insta_kill_time", 30, undefined, undefined, 1);
	zombie_utility::set_zombie_var("zombie_powerup_double_points_on", 0, undefined, undefined, 1);
	zombie_utility::set_zombie_var("zombie_powerup_double_points_time", 30, undefined, undefined, 1);
	zombie_utility::set_zombie_var("zombie_powerup_drop_increment", 2000);
	zombie_utility::set_zombie_var("zombie_powerup_drop_max_per_round", 4);
	callback::on_connect(&init_player_zombie_vars);
	level._effect["powerup_on"] = "zombie/fx_powerup_on_green_zmb";
	level._effect["powerup_off"] = "zombie/fx_powerup_off_green_zmb";
	level._effect["powerup_grabbed"] = "zombie/fx_powerup_grab_green_zmb";
	level._effect["powerup_on_red"] = "zombie/fx_powerup_on_red_zmb";
	level._effect["powerup_grabbed_red"] = "zombie/fx_powerup_grab_red_zmb";
	level._effect["powerup_on_solo"] = "zombie/fx_powerup_on_solo_zmb";
	level._effect["powerup_grabbed_solo"] = "zombie/fx_powerup_grab_solo_zmb";
	level._effect["powerup_on_caution"] = "zombie/fx_powerup_on_caution_zmb";
	level._effect["powerup_grabbed_caution"] = "zombie/fx_powerup_grab_caution_zmb";
	init_powerups();
	if(!level.enable_magic)
	{
		return;
	}
	thread watch_for_drop();
}

/*
	Name: init_powerups
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x1040
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 89
*/
function init_powerups()
{
	level flag::init("zombie_drop_powerups");
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		level flag::set("zombie_drop_powerups");
	}
	if(!isdefined(level.active_powerups))
	{
		level.active_powerups = [];
	}
	add_zombie_powerup("insta_kill_ug", "zombie_skull", &"ZOMBIE_POWERUP_INSTA_KILL", &func_should_never_drop, 1, 0, 0, undefined, "powerup_instant_kill_ug", "zombie_powerup_insta_kill_ug_time", "zombie_powerup_insta_kill_ug_on", 1);
	if(isdefined(level.level_specific_init_powerups))
	{
		[[level.level_specific_init_powerups]]();
	}
	randomize_powerups();
	level.zombie_powerup_index = 0;
	randomize_powerups();
	level.rare_powerups_active = 0;
	level.firesale_vox_firstime = 0;
	level thread powerup_hud_monitor();
	clientfield::register("scriptmover", "powerup_fx", 1, GetMinBitCountForNum(5), "int");
}

/*
	Name: init_player_zombie_vars
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x11D8
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 124
*/
function init_player_zombie_vars()
{
	self.zombie_vars["zombie_powerup_insta_kill_ug_on"] = 0;
	self.zombie_vars["zombie_powerup_insta_kill_ug_time"] = 18;
	self.zombie_vars["zombie_powerup_insta_kill_on"] = 0;
	self.zombie_vars["zombie_powerup_insta_kill_time"] = 30;
	self.zombie_vars["zombie_powerup_double_points_on"] = 0;
	self.zombie_vars["zombie_powerup_double_points_time"] = 30;
	self.zombie_vars["zombie_insta_kill"] = 0;
	self.zombie_vars["zombie_point_scalar"] = 1;
	self._show_solo_hud = 1;
}

/*
	Name: set_weapon_ignore_max_ammo
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x12A8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 147
*/
function set_weapon_ignore_max_ammo(weapon)
{
	if(!isdefined(level.zombie_weapons_no_max_ammo))
	{
		level.zombie_weapons_no_max_ammo = [];
	}
	level.zombie_weapons_no_max_ammo[weapon] = 1;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: powerup_hud_monitor
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x12E8
	Size: 0x7F8
	Parameters: 0
	Flags: None
	Line Number: 168
*/
function powerup_hud_monitor()
{
	level flag::wait_till("start_zombie_round_logic");
	if(isdefined(level.current_game_module) && level.current_game_module == 2)
	{
		return;
	}
	flashing_timers = [];
	flashing_values = [];
	flashing_timer = 10;
	flashing_delta_time = 0;
	flashing_is_on = 0;
	flashing_value = 3;
	flashing_min_timer = 0.15;
	while(flashing_timer >= flashing_min_timer)
	{
		if(flashing_timer < 5)
		{
			flashing_delta_time = 0.1;
		}
		else
		{
			flashing_delta_time = 0.2;
		}
		if(flashing_is_on)
		{
			flashing_timer = flashing_timer - flashing_delta_time - 0.05;
			flashing_value = 2;
		}
		else
		{
			flashing_timer = flashing_timer - flashing_delta_time;
			flashing_value = 3;
		}
		flashing_timers[flashing_timers.size] = flashing_timer;
		flashing_values[flashing_values.size] = flashing_value;
		flashing_is_on = !flashing_is_on;
	}
	client_fields = [];
	powerup_keys = getArrayKeys(level.zombie_powerups);
	for(powerup_key_index = 0; powerup_key_index < powerup_keys.size; powerup_key_index++)
	{
		if(isdefined(level.zombie_powerups[powerup_keys[powerup_key_index]].client_field_name))
		{
			powerup_name = powerup_keys[powerup_key_index];
			client_fields[powerup_name] = spawnstruct();
			client_fields[powerup_name].client_field_name = level.zombie_powerups[powerup_name].client_field_name;
			client_fields[powerup_name].only_affects_grabber = level.zombie_powerups[powerup_name].only_affects_grabber;
			client_fields[powerup_name].time_name = level.zombie_powerups[powerup_name].time_name;
			client_fields[powerup_name].on_name = level.zombie_powerups[powerup_name].on_name;
		}
	}
	client_field_keys = getArrayKeys(client_fields);
	var_1460827c = [];
	var_1460827c[0] = 30;
	var_1460827c[1] = 30;
	var_1460827c[2] = 30;
	var_1460827c[3] = 30;
	var_1460827c[4] = 30;
	var_1460827c[5] = 30;
	var_1460827c[6] = 30;
	var_9cac77fc = [];
	var_9cac77fc["powerup_instant_kill"] = 0;
	var_9cac77fc["powerup_double_points"] = 1;
	var_9cac77fc["powerup_fire_sale"] = 2;
	var_9cac77fc["powerup_bon_fire"] = 3;
	var_9cac77fc["powerup_mini_gun"] = 4;
	var_9cac77fc["powerup_zombie_blood"] = 5;
	var_9cac77fc["powerup_purifier"] = 6;
	var_a963c361 = "";
	while(1)
	{
		wait(0.05);
		waittillframeend;
		players = level.players;
		for(playerIndex = 0; playerIndex < players.size; playerIndex++)
		{
			for(client_field_key_index = 0; client_field_key_index < client_field_keys.size; client_field_key_index++)
			{
				player = players[playerIndex];
				if(isdefined(level.powerup_player_valid))
				{
					if(![[level.powerup_player_valid]](player))
					{
						continue;
					}
				}
				client_field_name = client_fields[client_field_keys[client_field_key_index]].client_field_name;
				time_name = client_fields[client_field_keys[client_field_key_index]].time_name;
				on_name = client_fields[client_field_keys[client_field_key_index]].on_name;
				powerup_timer = undefined;
				powerup_on = undefined;
				if(client_fields[client_field_keys[client_field_key_index]].only_affects_grabber)
				{
					if(isdefined(player._show_solo_hud) && player._show_solo_hud == 1)
					{
						powerup_timer = player.zombie_vars[time_name];
						powerup_on = player.zombie_vars[on_name];
					}
				}
				else if(isdefined(level.zombie_vars[player.team][time_name]))
				{
					powerup_timer = level.zombie_vars[player.team][time_name];
					powerup_on = level.zombie_vars[player.team][on_name];
				}
				else if(isdefined(level.zombie_vars[time_name]))
				{
					powerup_timer = level.zombie_vars[time_name];
					powerup_on = level.zombie_vars[on_name];
				}
				if(isdefined(powerup_timer) && isdefined(powerup_on))
				{
					player set_clientfield_powerups(client_field_name, powerup_timer, powerup_on, flashing_timers, flashing_values);
					if(isdefined(var_9cac77fc[client_field_name]))
					{
						var_1460827c[var_9cac77fc[client_field_name]] = Int(powerup_timer) + 1;
						continue;
					}
				}
				player clientfield::set_to_player(client_field_name, 0);
			}
			var_a963c361 = "" + var_1460827c[0] + "." + var_1460827c[1] + "." + var_1460827c[2] + "." + var_1460827c[3] + "." + var_1460827c[4] + "." + var_1460827c[5] + "." + var_1460827c[6];
			players[playerIndex] function_bfb79eb9(var_a963c361);
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_bfb79eb9
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x1AE8
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 307
*/
function function_bfb79eb9(strings)
{
	if(!isdefined(self.var_9930953b))
	{
		self.var_9930953b = strings;
	}
	if(strings == self.var_9930953b)
	{
		return;
	}
	self.var_9930953b = strings;
	util::setClientSysState("deadshot_keyline", "pups," + strings, self);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: set_clientfield_powerups
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x1B60
	Size: 0x110
	Parameters: 5
	Flags: None
	Line Number: 333
*/
function set_clientfield_powerups(clientfield_name, powerup_timer, powerup_on, flashing_timers, flashing_values)
{
	if(powerup_on)
	{
		if(powerup_timer < 10)
		{
			flashing_value = 3;
			for(i = flashing_timers.size - 1; i > 0; i--)
			{
				if(powerup_timer < flashing_timers[i])
				{
					flashing_value = flashing_values[i];
					break;
				}
			}
			self clientfield::set_to_player(clientfield_name, flashing_value);
		}
		else
		{
			self clientfield::set_to_player(clientfield_name, 1);
		}
	}
	else
	{
		self clientfield::set_to_player(clientfield_name, 0);
	}
}

/*
	Name: randomize_powerups
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x1C78
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 371
*/
function randomize_powerups()
{
	if(!isdefined(level.zombie_powerup_array))
	{
		level.zombie_powerup_array = [];
	}
	else
	{
		level.zombie_powerup_array = Array::randomize(level.zombie_powerup_array);
	}
}

/*
	Name: get_next_powerup
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x1CC8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 393
*/
function get_next_powerup()
{
	powerup = level.zombie_powerup_array[level.zombie_powerup_index];
	level.zombie_powerup_index++;
	if(level.zombie_powerup_index >= level.zombie_powerup_array.size)
	{
		level.zombie_powerup_index = 0;
		randomize_powerups();
	}
	return powerup;
}

/*
	Name: get_valid_powerup
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x1D30
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 415
*/
function get_valid_powerup()
{
	if(isdefined(level.zombie_powerup_boss))
	{
		i = level.zombie_powerup_boss;
		level.zombie_powerup_boss = undefined;
		return level.zombie_powerup_array[i];
	}
	if(isdefined(level.zombie_powerup_ape))
	{
		powerup = level.zombie_powerup_ape;
		level.zombie_powerup_ape = undefined;
		return powerup;
	}
	for(i = 0; i < 100; i++)
	{
		powerup = get_next_powerup();
		if(isdefined(level.zombie_powerups[powerup]) && [[level.zombie_powerups[powerup].func_should_drop_with_regular_powerups]]())
		{
			return powerup;
		}
	}
	return powerup;
}

/*
	Name: minigun_no_drop
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x1E20
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 450
*/
function minigun_no_drop()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i].zombie_vars["zombie_powerup_minigun_on"] == 1)
		{
			return 1;
		}
	}
	if(!level flag::get("power_on"))
	{
		if(level flag::get("solo_game"))
		{
			if(!isdefined(level.solo_lives_given) || level.solo_lives_given == 0)
			{
				return 1;
			}
		}
		else
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: watch_for_drop
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x1F10
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 487
*/
function watch_for_drop()
{
	level endon("unloaded");
	level flag::wait_till("start_zombie_round_logic");
	level flag::wait_till("begin_spawning");
	wait(0.05);
	players = level.activePlayers;
	score_to_drop = players.size * level.zombie_vars["zombie_score_start_" + players.size + "p"] + level.zombie_vars["zombie_powerup_drop_increment"];
	while(1)
	{
		level flag::wait_till("zombie_drop_powerups");
		players = level.activePlayers;
		curr_total_score = 0;
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(players[i].score_total))
			{
				curr_total_score = curr_total_score + players[i].score_total;
			}
		}
		if(curr_total_score > score_to_drop)
		{
			level.zombie_vars["zombie_powerup_drop_increment"] = level.zombie_vars["zombie_powerup_drop_increment"] * 1.14;
			score_to_drop = curr_total_score + level.zombie_vars["zombie_powerup_drop_increment"];
			level.zombie_vars["zombie_drop_item"] = 1;
		}
		wait(0.5);
	}
}

/*
	Name: get_random_powerup_name
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x20F0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 527
*/
function get_random_powerup_name()
{
	powerup_keys = getArrayKeys(level.zombie_powerups);
	powerup_keys = Array::randomize(powerup_keys);
	return powerup_keys[0];
}

/*
	Name: get_regular_random_powerup_name
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x2140
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 544
*/
function get_regular_random_powerup_name()
{
	powerup_keys = getArrayKeys(level.zombie_powerups);
	powerup_keys = Array::randomize(powerup_keys);
	for(i = 0; i < powerup_keys.size; i++)
	{
		if([[level.zombie_powerups[powerup_keys[i]].func_should_drop_with_regular_powerups]]())
		{
			return powerup_keys[i];
		}
	}
	return powerup_keys[0];
}

/*
	Name: add_zombie_powerup
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x21F0
	Size: 0x2D0
	Parameters: 13
	Flags: None
	Line Number: 568
*/
function add_zombie_powerup(powerup_name, model_name, hint, func_should_drop_with_regular_powerups, only_affects_grabber, any_team, zombie_grabbable, FX, client_field_name, time_name, on_name, clientfield_version, player_specific)
{
	if(!isdefined(clientfield_version))
	{
		clientfield_version = 1;
	}
	if(!isdefined(player_specific))
	{
		player_specific = 0;
	}
	if(isdefined(level.zombie_include_powerups) && (!(isdefined(level.zombie_include_powerups[powerup_name]) && level.zombie_include_powerups[powerup_name])))
	{
		return;
	}
	if(!isdefined(level.zombie_powerup_array))
	{
		level.zombie_powerup_array = [];
	}
	struct = spawnstruct();
	if(!isdefined(level.zombie_powerups))
	{
		level.zombie_powerups = [];
	}
	struct.powerup_name = powerup_name;
	struct.model_name = model_name;
	struct.weapon_classname = "script_model";
	struct.hint = hint;
	struct.func_should_drop_with_regular_powerups = func_should_drop_with_regular_powerups;
	struct.only_affects_grabber = only_affects_grabber;
	struct.any_team = any_team;
	struct.zombie_grabbable = zombie_grabbable;
	struct.var_b17826ec = HashString(powerup_name);
	struct.player_specific = player_specific;
	struct.can_pick_up_in_last_stand = 1;
	if(isdefined(FX))
	{
		struct.FX = FX;
	}
	level.zombie_powerups[powerup_name] = struct;
	level.zombie_powerup_array[level.zombie_powerup_array.size] = powerup_name;
	add_zombie_special_drop(powerup_name);
	if(isdefined(client_field_name))
	{
		clientfield::register("toplayer", client_field_name, clientfield_version, 2, "int");
		struct.client_field_name = client_field_name;
		struct.time_name = time_name;
		struct.on_name = on_name;
	}
}

/*
	Name: powerup_set_can_pick_up_in_last_stand
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x24C8
	Size: 0x30
	Parameters: 2
	Flags: None
	Line Number: 628
*/
function powerup_set_can_pick_up_in_last_stand(powerup_name, b_can_pick_up)
{
	level.zombie_powerups[powerup_name].can_pick_up_in_last_stand = b_can_pick_up;
}

/*
	Name: powerup_set_prevent_pick_up_if_drinking
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x2500
	Size: 0x30
	Parameters: 2
	Flags: None
	Line Number: 643
*/
function powerup_set_prevent_pick_up_if_drinking(powerup_name, b_prevent_pick_up)
{
	level._custom_powerups[powerup_name].prevent_pick_up_if_drinking = b_prevent_pick_up;
}

/*
	Name: powerup_set_player_specific
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x2538
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 658
*/
function powerup_set_player_specific(powerup_name, b_player_specific)
{
	if(!isdefined(b_player_specific))
	{
		b_player_specific = 1;
	}
	level.zombie_powerups[powerup_name].player_specific = b_player_specific;
}

/*
	Name: powerup_set_statless_powerup
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x2588
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 677
*/
function powerup_set_statless_powerup(powerup_name)
{
	if(!isdefined(level.zombie_statless_powerups))
	{
		level.zombie_statless_powerups = [];
	}
	level.zombie_statless_powerups[powerup_name] = 1;
}

/*
	Name: add_zombie_special_drop
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x25C8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 696
*/
function add_zombie_special_drop(powerup_name)
{
	if(!isdefined(level.zombie_special_drop_array))
	{
		level.zombie_special_drop_array = [];
	}
	level.zombie_special_drop_array[level.zombie_special_drop_array.size] = powerup_name;
}

/*
	Name: include_zombie_powerup
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x2610
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 715
*/
function include_zombie_powerup(powerup_name)
{
	if(!isdefined(level.zombie_include_powerups))
	{
		level.zombie_include_powerups = [];
	}
	level.zombie_include_powerups[powerup_name] = 1;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: powerup_remove_from_regular_drops
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x2650
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 736
*/
function powerup_remove_from_regular_drops(powerup_name)
{
	/#
		Assert(isdefined(level.zombie_powerups));
	#/
	/#
		Assert(isdefined(level.zombie_powerups[powerup_name]));
	#/
	level.zombie_powerups[powerup_name].func_should_drop_with_regular_powerups = &func_should_never_drop;
}

/*
	Name: powerup_round_start
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x26D8
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 757
*/
function powerup_round_start()
{
	level.powerup_drop_count = 0;
}

/*
	Name: powerup_drop
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x26F0
	Size: 0x438
	Parameters: 1
	Flags: None
	Line Number: 772
*/
function powerup_drop(drop_point)
{
	if(isdefined(level.custom_zombie_powerup_drop))
	{
		b_outcome = [[level.custom_zombie_powerup_drop]](drop_point);
		if(isdefined(b_outcome) && b_outcome)
		{
			return;
		}
	}
	if(level.powerup_drop_count >= level.zombie_vars["zombie_powerup_drop_max_per_round"])
	{
		return;
	}
	if(GetDvarString("tfoption_more_powerups") == "0")
	{
		return;
	}
	if(!isdefined(level.zombie_include_powerups) || level.zombie_include_powerups.size == 0)
	{
		return;
	}
	rand_drop = RandomInt(100);
	if(bgb::is_team_enabled("zm_bgb_power_vacuum") && rand_drop < 20)
	{
		debug = "zm_bgb_power_vacuum";
	}
	else if(rand_drop > 2)
	{
		if(!level.zombie_vars["zombie_drop_item"])
		{
			return;
		}
		debug = "score";
	}
	else
	{
		debug = "random";
	}
	playable_area = GetEntArray("player_volume", "script_noteworthy");
	level.powerup_drop_count++;
	powerup = zm_net::network_safe_spawn("powerup", 1, "script_model", drop_point + VectorScale((0, 0, 1), 40));
	valid_drop = 0;
	for(i = 0; i < playable_area.size; i++)
	{
		if(powerup istouching(playable_area[i]))
		{
			valid_drop = 1;
			break;
		}
	}
	if(valid_drop && level.rare_powerups_active)
	{
		pos = (drop_point[0], drop_point[1], drop_point[2] + 42);
		if(check_for_rare_drop_override(pos))
		{
			level.zombie_vars["zombie_drop_item"] = 0;
			valid_drop = 0;
		}
	}
	if(!valid_drop)
	{
		level.powerup_drop_count--;
		powerup delete();
		return;
	}
	if(isdefined(debug) && debug == "score")
	{
		if(isdefined(level.var_b3649053))
		{
			level.powerup_drop_count--;
			powerup delete();
			return;
		}
		else
		{
			level.var_b3649053 = 1;
		}
	}
	level notify("hash_c5065002", powerup);
	powerup powerup_setup();
	powerup thread powerup_timeout();
	powerup thread powerup_wobble();
	powerup thread powerup_grab();
	powerup thread powerup_move();
	powerup thread powerup_emp();
	level.zombie_vars["zombie_drop_item"] = 0;
	level notify("powerup_dropped", powerup);
	if(isdefined(level.var_b3649053))
	{
		level.var_b3649053 = undefined;
	}
}

/*
	Name: specific_powerup_drop
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x2B30
	Size: 0x1E8
	Parameters: 9
	Flags: None
	Line Number: 876
*/
function specific_powerup_drop(powerup_name, drop_spot, powerup_team, powerup_location, pickup_delay, powerup_player, b_stay_forever, var_23f0eadd, level_notify)
{
	powerup = zm_net::network_safe_spawn("powerup", 1, "script_model", drop_spot + VectorScale((0, 0, 1), 40));
	level notify("hash_c5065002", powerup);
	if(isdefined(powerup))
	{
		powerup.var_23f0eadd = var_23f0eadd;
		powerup powerup_setup(powerup_name, powerup_team, powerup_location, powerup_player);
		if(!(isdefined(b_stay_forever) && b_stay_forever))
		{
			powerup thread powerup_timeout();
		}
		powerup thread powerup_wobble();
		if(isdefined(pickup_delay) && pickup_delay > 0)
		{
			powerup util::delay(pickup_delay, "powerup_timedout", &powerup_grab, powerup_team);
		}
		else
		{
			powerup thread powerup_grab(powerup_team);
		}
		powerup thread powerup_move();
		powerup thread powerup_emp();
		if(!(isdefined(level_notify) && level_notify))
		{
			level notify("powerup_dropped", powerup);
		}
		return powerup;
	}
}

/*
	Name: function_5240fdfe
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x2D20
	Size: 0x1E0
	Parameters: 9
	Flags: None
	Line Number: 917
*/
function function_5240fdfe(powerup_name, drop_spot, powerup_team, powerup_location, pickup_delay, powerup_player, b_stay_forever, var_23f0eadd, level_notify)
{
	powerup = spawn("script_model", drop_spot + VectorScale((0, 0, 1), 40));
	level notify("hash_c5065002", powerup);
	if(isdefined(powerup))
	{
		powerup.var_23f0eadd = var_23f0eadd;
		powerup powerup_setup(powerup_name, powerup_team, powerup_location, powerup_player);
		if(!(isdefined(b_stay_forever) && b_stay_forever))
		{
			powerup thread powerup_timeout();
		}
		powerup thread powerup_wobble();
		if(isdefined(pickup_delay) && pickup_delay > 0)
		{
			powerup util::delay(pickup_delay, "powerup_timedout", &powerup_grab, powerup_team);
		}
		else
		{
			powerup thread powerup_grab(powerup_team);
		}
		powerup thread powerup_move();
		powerup thread powerup_emp();
		if(!(isdefined(level_notify) && level_notify))
		{
			level notify("powerup_dropped", powerup);
		}
		return powerup;
	}
}

/*
	Name: special_powerup_drop
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x2F08
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 958
*/
function special_powerup_drop(drop_point)
{
	if(!isdefined(level.zombie_include_powerups) || level.zombie_include_powerups.size == 0)
	{
		return;
	}
	powerup = spawn("script_model", drop_point + VectorScale((0, 0, 1), 40));
	playable_area = GetEntArray("player_volume", "script_noteworthy");
	valid_drop = 0;
	for(i = 0; i < playable_area.size; i++)
	{
		if(powerup istouching(playable_area[i]))
		{
			valid_drop = 1;
			break;
		}
	}
	if(!valid_drop)
	{
		powerup delete();
		return;
	}
	powerup special_drop_setup();
}

/*
	Name: powerup_setup
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x3050
	Size: 0x758
	Parameters: 6
	Flags: None
	Line Number: 993
*/
function powerup_setup(powerup_override, powerup_team, powerup_location, powerup_player, shouldplaysound, var_c3e7d8d6)
{
	if(!isdefined(shouldplaysound))
	{
		shouldplaysound = 1;
	}
	if(!isdefined(var_c3e7d8d6))
	{
		var_c3e7d8d6 = 0;
	}
	powerup = undefined;
	if(!isdefined(powerup_override))
	{
		powerup = get_valid_powerup();
	}
	else
	{
		powerup = powerup_override;
		if("tesla" == powerup && tesla_powerup_active())
		{
			powerup = "minigun";
		}
	}
	struct = level.zombie_powerups[powerup];
	if(isdefined(powerup_team))
	{
		self.powerup_team = powerup_team;
	}
	if(isdefined(powerup_location))
	{
		self.powerup_location = powerup_location;
	}
	if(isdefined(powerup_player))
	{
		self.powerup_player = powerup_player;
	}
	else
	{
		Assert(!(isdefined(struct.player_specific) && struct.player_specific), "Dev Block strings are not supported");
	}
	/#
	#/
	self.powerup_name = struct.powerup_name;
	self.hint = struct.hint;
	self.only_affects_grabber = struct.only_affects_grabber;
	self.any_team = struct.any_team;
	self.zombie_grabbable = struct.zombie_grabbable;
	self.func_should_drop_with_regular_powerups = struct.func_should_drop_with_regular_powerups;
	if(isdefined(level._custom_powerups) && isdefined(level._custom_powerups[powerup]) && isdefined(level._custom_powerups[powerup].setup_powerup))
	{
		self [[level._custom_powerups[powerup].setup_powerup]]();
	}
	else
	{
		self function_5b71e526(self.origin, struct.model_name);
	}
	demo::bookmark("zm_powerup_dropped", GetTime(), undefined, undefined, 1);
	if(isdefined(struct.FX))
	{
		self.FX = struct.FX;
	}
	if(isdefined(struct.can_pick_up_in_last_stand))
	{
		self.can_pick_up_in_last_stand = struct.can_pick_up_in_last_stand;
	}
	playsoundatposition("zmb_spawn_powerup", self.origin);
	self PlayLoopSound("zmb_spawn_powerup_loop");
	level.active_powerups[level.active_powerups.size] = self;
	if(var_c3e7d8d6)
	{
		if(level.var_1dfebc8e != 0)
		{
			if(!var_c3e7d8d6)
			{
				if(struct.only_affects_grabber == 1)
				{
					FX = spawn("script_model", self.origin);
					FX SetModel("tag_origin");
					PlayFXOnTag("_mori2/t8_powerup_pre_drop_solo", FX, "tag_origin");
					self PlayLoopSound("zm_t8_powerup_pre_spawn");
					wait(1.5);
					self StopLoopSound(1);
					FX delete();
					fx2 = spawn("script_model", self.origin);
					fx2 SetModel("tag_origin");
					PlayFXOnTag("_mori2/t8_powerup_pre_drop_pop_solo", fx2, "tag_origin");
					fx2 PlaySoundOnTag("zm_t8_powerup_pop", "tag_origin");
					fx2 thread function_38b15c8f(1);
				}
				else
				{
					FX = spawn("script_model", self.origin);
					FX SetModel("tag_origin");
					PlayFXOnTag("_mori2/t8_powerup_pre_drop", FX, "tag_origin");
					self PlayLoopSound("zm_t8_powerup_pre_spawn");
					wait(1.5);
					self StopLoopSound(1);
					FX delete();
					fx2 = spawn("script_model", self.origin);
					fx2 SetModel("tag_origin");
					PlayFXOnTag("_mori2/t8_powerup_pre_drop_pop", fx2, "tag_origin");
					fx2 PlaySoundOnTag("zm_t8_powerup_pop", "tag_origin");
					fx2 thread function_38b15c8f(2);
				}
			}
		}
		if(isdefined(level._custom_powerups) && isdefined(level._custom_powerups[powerup]) && isdefined(level._custom_powerups[powerup].setup_powerup))
		{
			self [[level._custom_powerups[powerup].setup_powerup]]();
		}
		else
		{
			self SetModel(struct.model_name);
			self.var_23f0eadd = 1;
			self SetScale(1);
		}
		if(isdefined(shouldplaysound) && shouldplaysound)
		{
			playsoundatposition("zmb_spawn_powerup", self.origin);
		}
	}
}

/*
	Name: function_38b15c8f
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x37B0
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 1126
*/
function function_38b15c8f(w)
{
	wait(w);
	self delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_12af56d3
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x37E0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 1144
*/
function function_12af56d3()
{
	self endon("death");
	wait(1.5);
	self delete();
}

/*
	Name: function_5b71e526
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x3818
	Size: 0x1F8
	Parameters: 2
	Flags: None
	Line Number: 1161
*/
function function_5b71e526(drop_spot, STR_MODEL)
{
	self endon("powerup_grabbed");
	n_delay = self function_6bb9b8a6(drop_spot);
	if(isdefined(level.var_f9ad7f5e))
	{
		self thread [[level.var_f9ad7f5e]]();
	}
	else
	{
		n_fx = self function_af00c326();
		if(n_fx == 1 && n_delay)
		{
			self.var_842395ba = util::spawn_model("tag_origin", self.origin, self.angles);
			self.var_842395ba clientfield::set("powerup_fx", 5);
			self.var_842395ba thread function_12af56d3();
			self clientfield::set("powerup_fx", 5);
		}
	}
	if(n_delay)
	{
		playsoundatposition("zmb_powerup_intro_start", self.origin);
		self PlayLoopSound("zmb_powerup_intro_loop");
	}
	level notify("hash_b8b6381d");
	if(n_delay)
	{
		wait(n_delay);
		level notify("hash_b8b6381d");
		self StopLoopSound();
	}
	self SetScale(1);
	self.var_23f0eadd = 1;
	self SetModel(STR_MODEL);
}

/*
	Name: function_6bb9b8a6
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x3A18
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 1207
*/
function function_6bb9b8a6(drop_spot)
{
	if(self function_af00c326() == 1)
	{
		e_player = zm_utility::get_closest_player(drop_spot);
		if(isdefined(level.var_3bad7bdd) && level.var_3bad7bdd || (isdefined(self.var_23f0eadd) && self.var_23f0eadd))
		{
			return 0;
		}
		if(!isdefined(e_player))
		{
			return 1.5;
		}
		n_distance = Distance(e_player.origin, drop_spot);
		if(n_distance > 128)
		{
			return 0;
		}
		if(n_distance < 8)
		{
			return 1.5;
		}
		n_delay = math::linear_map(n_distance, 8, 128, 1.5, 0);
		return n_delay;
	}
	return 0;
}

/*
	Name: function_af00c326
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x3B40
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1245
*/
function function_af00c326()
{
	if(self.any_team)
	{
		return 4;
	}
	else if(self.only_affects_grabber)
	{
		return 2;
	}
	else if(self.zombie_grabbable)
	{
		return 3;
	}
	else
	{
		return 1;
	}
}

/*
	Name: special_drop_setup
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x3B90
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 1275
*/
function special_drop_setup()
{
	powerup = undefined;
	if(isdefined(level.powerup_special_drop_override))
	{
		powerup = [[level.powerup_special_drop_override]]();
	}
	else
	{
		powerup = get_valid_powerup();
	}
	if(isdefined(powerup))
	{
		playFX(level._effect["lightning_dog_spawn"], self.origin);
		playsoundatposition("zmb_hellhound_prespawn", self.origin);
		wait(1.5);
		playsoundatposition("zmb_hellhound_bolt", self.origin);
		Earthquake(0.5, 0.75, self.origin, 1000);
		playsoundatposition("zmb_hellhound_spawn", self.origin);
		self powerup_setup(powerup);
		self thread powerup_timeout();
		self thread powerup_wobble();
		self thread powerup_grab();
		self thread powerup_move();
		self thread powerup_emp();
	}
}

/*
	Name: powerup_zombie_grab_trigger_cleanup
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x3D48
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 1313
*/
function powerup_zombie_grab_trigger_cleanup(trigger)
{
	self util::waittill_any("powerup_timedout", "powerup_grabbed", "hacked");
	self StopLoopSound();
	trigger delete();
}

/*
	Name: powerup_zombie_grab
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x3DC0
	Size: 0x340
	Parameters: 1
	Flags: None
	Line Number: 1330
*/
function powerup_zombie_grab(powerup_team)
{
	self endon("powerup_timedout");
	self endon("powerup_grabbed");
	self endon("hacked");
	zombie_grab_trigger = spawn("trigger_radius", self.origin - VectorScale((0, 0, 1), 40), 9, 32, 72);
	zombie_grab_trigger EnableLinkTo();
	zombie_grab_trigger LinkTo(self);
	zombie_grab_trigger SetTeamForTrigger(level.zombie_team);
	self thread powerup_zombie_grab_trigger_cleanup(zombie_grab_trigger);
	poi_dist = 300;
	if(isdefined(level._zombie_grabbable_poi_distance_override))
	{
		poi_dist = level._zombie_grabbable_poi_distance_override;
	}
	zombie_grab_trigger zm_utility::create_zombie_point_of_interest(poi_dist, 2, 0, 1, undefined, undefined, powerup_team);
	while(isdefined(self))
	{
		zombie_grab_trigger waittill("trigger", who);
		if(isdefined(level._powerup_grab_check))
		{
			if(!self [[level._powerup_grab_check]](who))
			{
				continue;
			}
		}
		else if(!isdefined(who) || !isai(who))
		{
			continue;
		}
		playFX(level._effect["powerup_grabbed_red"], self.origin);
		if(isdefined(level._custom_powerups) && isdefined(level._custom_powerups[self.powerup_name]) && isdefined(level._custom_powerups[self.powerup_name].grab_powerup))
		{
			b_continue = self [[level._custom_powerups[self.powerup_name].grab_powerup]]();
			if(isdefined(b_continue) && b_continue)
			{
				continue;
			}
		}
		else if(isdefined(level._zombiemode_powerup_zombie_grab))
		{
			level thread [[level._zombiemode_powerup_zombie_grab]](self);
		}
		if(isdefined(level._game_mode_powerup_zombie_grab))
		{
			level thread [[level._game_mode_powerup_zombie_grab]](self, who);
			else
			{
			}
		}
		level thread zm_audio::sndAnnouncerPlayVox(self.powerup_name);
		wait(0.1);
		playsoundatposition("zmb_powerup_grabbed", self.origin);
		self StopLoopSound();
		self thread powerup_delete_delayed();
		self notify("powerup_grabbed");
	}
}

/*
	Name: powerup_grab
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x4108
	Size: 0x928
	Parameters: 1
	Flags: None
	Line Number: 1399
*/
function powerup_grab(powerup_team)
{
	if(isdefined(self) && self.zombie_grabbable)
	{
		self thread powerup_zombie_grab(powerup_team);
		return;
	}
	self endon("powerup_timedout");
	self endon("powerup_grabbed");
	range_squared = 4096;
	while(isdefined(self))
	{
		if(isdefined(self.powerup_player))
		{
			grabbers = [];
			grabbers[0] = self.powerup_player;
		}
		else if(isdefined(level.powerup_grab_get_players_override))
		{
			grabbers = [[level.powerup_grab_get_players_override]]();
		}
		else
		{
			grabbers = GetPlayers();
		}
		if(isdefined(self.var_5c641a8f))
		{
			wait(0.1);
			continue;
		}
		for(i = 0; i < grabbers.size; i++)
		{
			grabber = grabbers[i];
			if(isalive(grabber.owner) && isPlayer(grabber.owner))
			{
				player = grabber.owner;
			}
			else if(isPlayer(grabber))
			{
				player = grabber;
			}
			if(self.only_affects_grabber && !isdefined(player))
			{
				continue;
			}
			if(isdefined(player.IS_DRINKING) && player.IS_DRINKING > 0 && isdefined(level._custom_powerups) && isdefined(level._custom_powerups[self.powerup_name]) && (isdefined(level._custom_powerups[self.powerup_name].prevent_pick_up_if_drinking) && level._custom_powerups[self.powerup_name].prevent_pick_up_if_drinking))
			{
				continue;
			}
			if(self.powerup_name == "minigun" || self.powerup_name == "purifier" || self.powerup_name == "tesla" || self.powerup_name == "random_weapon" && (!isPlayer(grabber) || player laststand::player_is_in_laststand() || (player useButtonPressed() && player zm_utility::in_revive_trigger()) || player bgb::is_enabled("zm_bgb_disorderly_combat")))
			{
				continue;
			}
			if(!(isdefined(self.can_pick_up_in_last_stand) && self.can_pick_up_in_last_stand) && player laststand::player_is_in_laststand())
			{
				continue;
			}
			ignore_range = 0;
			if(grabber.ignore_range_powerup === self)
			{
				grabber.ignore_range_powerup = undefined;
				ignore_range = 1;
			}
			if(DistanceSquared(grabber.origin, self.origin) < range_squared || ignore_range)
			{
				if(isdefined(level._powerup_grab_check))
				{
					if(!self [[level._powerup_grab_check]](player))
					{
						continue;
					}
				}
				if(isdefined(level._custom_powerups) && isdefined(level._custom_powerups[self.powerup_name]) && isdefined(level._custom_powerups[self.powerup_name].grab_powerup))
				{
					b_continue = self [[level._custom_powerups[self.powerup_name].grab_powerup]](player);
					if(isdefined(b_continue) && b_continue)
					{
						continue;
					}
				}
				else
				{
					switch(self.powerup_name)
					{
						case "teller_withdrawl":
						{
							level thread teller_withdrawl(self, player);
							break;
						}
						default
						{
							if(isdefined(level._zombiemode_powerup_grab))
							{
								level thread [[level._zombiemode_powerup_grab]](self, player);
								else
								{
									break;
								}
							}
						}
					}
				}
				demo::bookmark("zm_player_powerup_grabbed", GetTime(), player);
				if(isdefined(self.var_b17826ec))
				{
					player RecordMapEvent(23, GetTime(), grabber.origin, level.round_number, self.var_b17826ec);
				}
				if(should_award_stat(self.powerup_name) && isPlayer(player))
				{
					player zm_stats::increment_client_stat("drops");
					player zm_stats::increment_player_stat("drops");
					player zm_stats::increment_client_stat(self.powerup_name + "_pickedup");
					player zm_stats::increment_player_stat(self.powerup_name + "_pickedup");
					player zm_stats::increment_challenge_stat("SURVIVALIST_POWERUP");
				}
				if(isdefined(level.var_485f98ff))
				{
					self thread [[level.var_485f98ff]]();
				}
				else if(self.any_team)
				{
					playFX(level._effect["powerup_grabbed_caution"], self.origin);
				}
				else if(self.only_affects_grabber)
				{
					playFX(level._effect["powerup_grabbed_solo"], self.origin);
				}
				else
				{
					playFX(level._effect["powerup_grabbed"], self.origin);
				}
				if(isdefined(self.stolen) && self.stolen)
				{
					level notify("monkey_see_monkey_dont_achieved");
				}
				if(isdefined(self.grabbed_level_notify))
				{
					level notify(self.grabbed_level_notify);
				}
				self.claimed = 1;
				self.power_up_grab_player = player;
				if(isdefined(player) && isPlayer(player))
				{
					player namespace_3d0867a6::function_18df83fb("pickup");
				}
				wait(0.1);
				playsoundatposition("zmb_powerup_grabbed", self.origin);
				self StopLoopSound();
				self Hide();
				if(self.powerup_name != "fire_sale")
				{
					if(isdefined(self.power_up_grab_player))
					{
						if(isdefined(level.powerup_intro_vox))
						{
							level thread [[level.powerup_intro_vox]](self);
							return;
						}
						else if(isdefined(level.powerup_vo_available))
						{
							can_say_vo = [[level.powerup_vo_available]]();
							if(!can_say_vo)
							{
								self thread powerup_delete_delayed();
								self notify("powerup_grabbed");
								return;
							}
						}
					}
				}
				if(isdefined(self.only_affects_grabber) && self.only_affects_grabber)
				{
					level thread zm_audio::sndAnnouncerPlayVox(self.powerup_name, player);
				}
				else
				{
					level thread zm_audio::sndAnnouncerPlayVox(self.powerup_name);
				}
				self thread powerup_delete_delayed();
				self notify("powerup_grabbed");
			}
		}
		wait(0.1);
	}
}

/*
	Name: get_closest_window_repair
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x4A38
	Size: 0x140
	Parameters: 2
	Flags: None
	Line Number: 1595
*/
function get_closest_window_repair(windows, origin)
{
	current_window = undefined;
	shortest_distance = undefined;
	for(i = 0; i < windows.size; i++)
	{
		if(zm_utility::all_chunks_intact(windows, windows[i].barrier_chunks))
		{
			continue;
		}
		if(!isdefined(current_window))
		{
			current_window = windows[i];
			shortest_distance = DistanceSquared(current_window.origin, origin);
			continue;
		}
		if(DistanceSquared(windows[i].origin, origin) < shortest_distance)
		{
			current_window = windows[i];
			shortest_distance = DistanceSquared(windows[i].origin, origin);
		}
	}
	return current_window;
}

/*
	Name: powerup_vo
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x4B80
	Size: 0x1C0
	Parameters: 1
	Flags: None
	Line Number: 1630
*/
function powerup_vo(type)
{
	self endon("death");
	self endon("disconnect");
	if(!isPlayer(self))
	{
		return;
	}
	if(isdefined(level.powerup_vo_available))
	{
		if(![[level.powerup_vo_available]]())
		{
			return;
		}
	}
	if(isdefined(level.var_60074393) && level.var_60074393 && isdefined(level.var_4011a94e))
	{
		foreach(player in GetPlayers())
		{
			player playlocalsound("vk_zm_ann_" + level.var_4011a94e + "_" + type);
		}
	}
	wait(RandomFloatRange(2, 2.5));
	if(type == "tesla")
	{
		self zm_audio::create_and_play_dialog("weapon_pickup", type);
	}
	else
	{
		self zm_audio::create_and_play_dialog("powerup", type);
	}
	if(isdefined(level.custom_powerup_vo_response))
	{
		level [[level.custom_powerup_vo_response]](self, type);
	}
}

/*
	Name: powerup_wobble_fx
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x4D48
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1677
*/
function powerup_wobble_fx()
{
	self endon("death");
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(level.powerup_fx_func))
	{
		self thread [[level.powerup_fx_func]]();
		return;
	}
	if(self.any_team)
	{
		self clientfield::set("powerup_fx", 4);
	}
	else if(self.only_affects_grabber)
	{
		self clientfield::set("powerup_fx", 2);
	}
	else if(self.zombie_grabbable)
	{
		self clientfield::set("powerup_fx", 3);
	}
	else
	{
		self clientfield::set("powerup_fx", 1);
	}
}

/*
	Name: powerup_wobble
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x4E40
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 1717
*/
function powerup_wobble()
{
	self endon("powerup_grabbed");
	self endon("powerup_timedout");
	self thread powerup_wobble_fx();
	while(isdefined(self))
	{
		waittime = RandomFloatRange(2.5, 5);
		yaw = RandomInt(360);
		if(yaw > 300)
		{
			yaw = 300;
		}
		else if(yaw < 60)
		{
			yaw = 60;
		}
		yaw = self.angles[1] + yaw;
		new_angles = (-60 + RandomInt(120), yaw, -45 + RandomInt(90));
		self RotateTo(new_angles, waittime, waittime * 0.5, waittime * 0.5);
		if(isdefined(self.worldgundw))
		{
			self.worldgundw RotateTo(new_angles, waittime, waittime * 0.5, waittime * 0.5);
		}
		wait(RandomFloat(waittime - 0.1));
	}
}

/*
	Name: powerup_show
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5000
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 1755
*/
function powerup_show(visible)
{
	if(!visible)
	{
		self ghost();
		if(isdefined(self.worldgundw))
		{
			self.worldgundw ghost();
		}
	}
	else
	{
		self show();
		if(isdefined(self.worldgundw))
		{
			self.worldgundw show();
		}
		if(isdefined(self.powerup_player))
		{
			self SetInvisibleToAll();
			self setvisibletoplayer(self.powerup_player);
			if(isdefined(self.worldgundw))
			{
				self.worldgundw SetInvisibleToAll();
				self.worldgundw setvisibletoplayer(self.powerup_player);
			}
		}
	}
}

/*
	Name: powerup_timeout
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5128
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 1795
*/
function powerup_timeout()
{
	if(isdefined(level._powerup_timeout_override) && !isdefined(self.powerup_team))
	{
		self thread [[level._powerup_timeout_override]]();
		return;
	}
	self endon("powerup_grabbed");
	self endon("death");
	self endon("powerup_reset");
	self powerup_show(1);
	wait_time = 15;
	if(isdefined(level._powerup_timeout_custom_time))
	{
		time = [[level._powerup_timeout_custom_time]](self);
		if(time == 0)
		{
			return;
		}
		wait_time = time;
	}
	if(bgb::is_team_enabled("zm_bgb_temporal_gift"))
	{
		wait_time = wait_time + 30;
	}
	wait(wait_time);
	for(i = 0; i < 40; i++)
	{
		if(i % 2)
		{
			self powerup_show(0);
		}
		else
		{
			self powerup_show(1);
		}
		if(i < 15)
		{
			wait(0.5);
			continue;
		}
		if(i < 25)
		{
			wait(0.25);
			continue;
		}
		wait(0.1);
	}
	self notify("powerup_timedout");
	self powerup_delete();
}

/*
	Name: powerup_delete
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x52F0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1857
*/
function powerup_delete()
{
	ArrayRemoveValue(level.active_powerups, self, 0);
	if(isdefined(self.worldgundw))
	{
		self.worldgundw delete();
	}
	self delete();
}

/*
	Name: powerup_delete_delayed
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5360
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1877
*/
function powerup_delete_delayed(time)
{
	if(isdefined(time))
	{
		wait(time);
	}
	else
	{
		wait(0.01);
	}
	self powerup_delete();
}

/*
	Name: is_insta_kill_active
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x53A8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1900
*/
function is_insta_kill_active()
{
	if(level.zombie_vars[self.team]["zombie_insta_kill"] || (isdefined(self.zombie_vars["zombie_insta_kill"]) && self.zombie_vars["zombie_insta_kill"]) || (isdefined(self.personal_instakill) && self.personal_instakill))
	{
		return 1;
	}
	return 0;
	~;
}

/*
	Name: check_for_instakill
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5420
	Size: 0x2E8
	Parameters: 3
	Flags: None
	Line Number: 1920
*/
function check_for_instakill(player, mod, HIT_LOCATION)
{
	if(isdefined(player) && isalive(player) && isdefined(level.check_for_instakill_override))
	{
		if(!self [[level.check_for_instakill_override]](player))
		{
			return;
		}
		if(player.use_weapon_type == "MOD_MELEE")
		{
			player.last_kill_method = "MOD_MELEE";
		}
		else
		{
			player.last_kill_method = "MOD_UNKNOWN";
		}
		modName = zm_utility::remove_mod_from_methodofdeath(mod);
		if(!(isdefined(self.no_gib) && self.no_gib))
		{
			self zombie_utility::zombie_head_gib();
		}
		self.health = 1;
		self DoDamage(self.health + 666, self.origin, player, self, HIT_LOCATION, modName);
		player notify("zombie_killed");
	}
	if(isdefined(player) && isalive(player) && player is_insta_kill_active())
	{
		if(zm_utility::is_magic_bullet_shield_enabled(self))
		{
			return;
		}
		if(isdefined(self.instakill_func))
		{
			b_result = self thread [[self.instakill_func]](player, mod, HIT_LOCATION);
			if(isdefined(b_result) && b_result)
			{
				return;
			}
		}
		if(player.use_weapon_type == "MOD_MELEE")
		{
			player.last_kill_method = "MOD_MELEE";
		}
		else
		{
			player.last_kill_method = "MOD_UNKNOWN";
		}
		modName = zm_utility::remove_mod_from_methodofdeath(mod);
		if(!level flag::get("special_round") && (!(isdefined(self.no_gib) && self.no_gib)))
		{
			self zombie_utility::zombie_head_gib();
		}
		self.health = 1;
		self DoDamage(self.health + 666, self.origin, player, self, HIT_LOCATION, modName);
		player notify("zombie_killed");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: point_doubler_on_hud
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5710
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 1990
*/
function point_doubler_on_hud(drop_item, player_team)
{
	self endon("disconnect");
	if(level.zombie_vars[player_team]["zombie_powerup_double_points_on"])
	{
		level.zombie_vars[player_team]["zombie_powerup_double_points_time"] = 30;
		return;
	}
	level.zombie_vars[player_team]["zombie_powerup_double_points_on"] = 1;
	level thread time_remaining_on_point_doubler_powerup(player_team);
}

/*
	Name: time_remaining_on_point_doubler_powerup
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x57B0
	Size: 0x198
	Parameters: 1
	Flags: None
	Line Number: 2012
*/
function time_remaining_on_point_doubler_powerup(player_team)
{
	temp_ent = spawn("script_origin", (0, 0, 0));
	temp_ent PlayLoopSound("zmb_double_point_loop");
	while(level.zombie_vars[player_team]["zombie_powerup_double_points_time"] >= 0)
	{
		wait(0.05);
		level.zombie_vars[player_team]["zombie_powerup_double_points_time"] = level.zombie_vars[player_team]["zombie_powerup_double_points_time"] - 0.05;
	}
	level.zombie_vars[player_team]["zombie_powerup_double_points_on"] = 0;
	players = GetPlayers(player_team);
	for(i = 0; i < players.size; i++)
	{
		players[i] playsound("zmb_points_loop_off");
	}
	temp_ent StopLoopSound(2);
	level.zombie_vars[player_team]["zombie_powerup_double_points_time"] = 30;
	temp_ent delete();
	return;
	continue;
}

/*
	Name: devil_dialog_delay
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5950
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 2044
*/
function devil_dialog_delay()
{
	wait(1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: check_for_rare_drop_override
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5968
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 2061
*/
function check_for_rare_drop_override(pos)
{
	if(level flagsys::get("ape_round"))
	{
		return 0;
	}
	return 0;
}

/*
	Name: tesla_powerup_active
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x59A8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 2080
*/
function tesla_powerup_active()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i].zombie_vars["zombie_powerup_tesla_on"])
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: print_powerup_drop
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5A28
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 2103
*/
function print_powerup_drop(powerup, type)
{
}

/*
	Name: register_carpenter_node
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5A48
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 2117
*/
function register_carpenter_node(node, callback)
{
	if(!isdefined(level._additional_carpenter_nodes))
	{
		level._additional_carpenter_nodes = [];
	}
	node._post_carpenter_callback = callback;
	level._additional_carpenter_nodes[level._additional_carpenter_nodes.size] = node;
}

/*
	Name: is_carpenter_boards_upgraded
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5AA8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2137
*/
function is_carpenter_boards_upgraded()
{
	if(isdefined(level.pers_carpenter_boards_active) && level.pers_carpenter_boards_active == 1)
	{
		return 1;
	}
	return 0;
}

/*
	Name: func_should_never_drop
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5AD8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2156
*/
function func_should_never_drop()
{
	return 0;
	ERROR: Bad function call
}

/*
	Name: func_should_always_drop
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5AE8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2172
*/
function func_should_always_drop()
{
	return 1;
}

/*
	Name: powerup_move
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5AF8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 2187
*/
function powerup_move()
{
	self endon("powerup_timedout");
	self endon("powerup_grabbed");
	drag_speed = 75;
	while(1)
	{
		self waittill("move_powerup", moveto, Distance);
		drag_vector = moveto - self.origin;
		range_squared = LengthSquared(drag_vector);
		if(range_squared > Distance * Distance)
		{
			drag_vector = VectorNormalize(drag_vector);
			drag_vector = Distance * drag_vector;
			moveto = self.origin + drag_vector;
		}
		self.origin = moveto;
	}
}

/*
	Name: powerup_emp
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5C00
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 2217
*/
function powerup_emp()
{
	self endon("powerup_timedout");
	self endon("powerup_grabbed");
	if(!zm_utility::should_watch_for_emp())
	{
		return;
	}
	while(1)
	{
		level waittill("emp_detonate", origin, radius);
		if(DistanceSquared(origin, self.origin) < radius * radius)
		{
			playFX(level._effect["powerup_off"], self.origin);
			self thread powerup_delete_delayed();
			self notify("powerup_timedout");
		}
	}
}

/*
	Name: get_powerups
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5CE8
	Size: 0xF8
	Parameters: 2
	Flags: None
	Line Number: 2247
*/
function get_powerups(origin, radius)
{
	if(isdefined(origin) && isdefined(radius))
	{
		powerups = [];
		foreach(powerup in level.active_powerups)
		{
			if(DistanceSquared(origin, powerup.origin) < radius * radius)
			{
				powerups[powerups.size] = powerup;
			}
		}
		return powerups;
	}
	return level.active_powerups;
}

/*
	Name: should_award_stat
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5DE8
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 2274
*/
function should_award_stat(powerup_name)
{
	if(powerup_name == "teller_withdrawl" || powerup_name == "blue_monkey" || powerup_name == "free_perk" || powerup_name == "bonus_points_player")
	{
		return 0;
	}
	if(isdefined(level.zombie_statless_powerups) && isdefined(level.zombie_statless_powerups[powerup_name]) && level.zombie_statless_powerups[powerup_name])
	{
		return 0;
	}
	return 1;
}

/*
	Name: teller_withdrawl
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5E78
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 2297
*/
function teller_withdrawl(powerup, player)
{
	player zm_score::add_to_player_score(powerup.value);
}

/*
	Name: show_on_hud
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5EB8
	Size: 0x120
	Parameters: 2
	Flags: None
	Line Number: 2312
*/
function show_on_hud(player_team, str_powerup)
{
	self endon("disconnect");
	str_index_on = "zombie_powerup_" + str_powerup + "_on";
	str_index_time = "zombie_powerup_" + str_powerup + "_time";
	if(level.zombie_vars[player_team][str_index_on])
	{
		level.zombie_vars[player_team][str_index_time] = 30;
		if(bgb::is_team_enabled("zm_bgb_temporal_gift"))
		{
			level.zombie_vars[player_team][str_index_time] = level.zombie_vars[player_team][str_index_time] + 30;
			return;
		}
	}
	level.zombie_vars[player_team][str_index_on] = 1;
	level thread time_remaining_on_powerup(player_team, str_powerup);
}

/*
	Name: time_remaining_on_powerup
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x5FE0
	Size: 0x218
	Parameters: 2
	Flags: None
	Line Number: 2340
*/
function time_remaining_on_powerup(player_team, str_powerup)
{
	str_index_on = "zombie_powerup_" + str_powerup + "_on";
	str_index_time = "zombie_powerup_" + str_powerup + "_time";
	str_sound_loop = "zmb_" + str_powerup + "_loop";
	str_sound_off = "zmb_" + str_powerup + "_loop_off";
	temp_ent = spawn("script_origin", (0, 0, 0));
	temp_ent PlayLoopSound(str_sound_loop);
	if(bgb::is_team_enabled("zm_bgb_temporal_gift"))
	{
		level.zombie_vars[player_team][str_index_time] = level.zombie_vars[player_team][str_index_time] + 30;
	}
	while(level.zombie_vars[player_team][str_index_time] >= 0)
	{
		wait(0.05);
		level.zombie_vars[player_team][str_index_time] = level.zombie_vars[player_team][str_index_time] - 0.05;
	}
	level.zombie_vars[player_team][str_index_on] = 0;
	GetPlayers()[0] playsoundtoteam(str_sound_off, player_team);
	temp_ent StopLoopSound(2);
	level.zombie_vars[player_team][str_index_time] = 30;
	temp_ent delete();
}

/*
	Name: weapon_powerup
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x6200
	Size: 0x1F8
	Parameters: 4
	Flags: None
	Line Number: 2374
*/
function weapon_powerup(ent_player, time, str_weapon, allow_cycling)
{
	if(!isdefined(allow_cycling))
	{
		allow_cycling = 0;
	}
	str_weapon_on = "zombie_powerup_" + str_weapon + "_on";
	str_weapon_time_over = str_weapon + "_time_over";
	ent_player notify("replace_weapon_powerup");
	ent_player._show_solo_hud = 1;
	ent_player.has_specific_powerup_weapon[str_weapon] = 1;
	ent_player.has_powerup_weapon = 1;
	ent_player zm_utility::increment_is_drinking();
	if(allow_cycling)
	{
		ent_player EnableWeaponCycling();
	}
	ent_player._zombie_weapon_before_powerup[str_weapon] = ent_player GetCurrentWeapon();
	ent_player GiveWeapon(level.zombie_powerup_weapon[str_weapon]);
	ent_player SwitchToWeapon(level.zombie_powerup_weapon[str_weapon]);
	ent_player.zombie_vars[str_weapon_on] = 1;
	level thread weapon_powerup_countdown(ent_player, str_weapon_time_over, time, str_weapon);
	level thread weapon_powerup_replace(ent_player, str_weapon_time_over, str_weapon);
	level thread weapon_powerup_change(ent_player, str_weapon_time_over, str_weapon);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: weapon_powerup_change
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x6400
	Size: 0x130
	Parameters: 3
	Flags: None
	Line Number: 2412
*/
function weapon_powerup_change(ent_player, str_gun_return_notify, str_weapon)
{
	ent_player endon("death");
	ent_player endon("disconnect");
	ent_player endon("player_downed");
	ent_player endon(str_gun_return_notify);
	ent_player endon("replace_weapon_powerup");
	while(1)
	{
		ent_player waittill("weapon_change", newWeapon, oldWeapon);
		if(newWeapon != level.weaponNone && newWeapon != level.zombie_powerup_weapon[str_weapon])
		{
			break;
		}
		else if(!ent_player IsThrowingGrenade() && !ent_player isMantling() && newWeapon != level.zombie_powerup_weapon[str_weapon])
		{
			break;
		}
	}
	level thread weapon_powerup_remove(ent_player, str_gun_return_notify, str_weapon, 0);
}

/*
	Name: weapon_powerup_countdown
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x6538
	Size: 0x130
	Parameters: 4
	Flags: None
	Line Number: 2444
*/
function weapon_powerup_countdown(ent_player, str_gun_return_notify, time, str_weapon)
{
	ent_player endon("death");
	ent_player endon("disconnect");
	ent_player endon("player_downed");
	ent_player endon(str_gun_return_notify);
	ent_player endon("replace_weapon_powerup");
	str_weapon_time = "zombie_powerup_" + str_weapon + "_time";
	ent_player.zombie_vars[str_weapon_time] = time;
	if(bgb::is_team_enabled("zm_bgb_temporal_gift"))
	{
		ent_player.zombie_vars[str_weapon_time] = ent_player.zombie_vars[str_weapon_time] + 30;
	}
	[[level._custom_powerups[str_weapon].weapon_countdown]](ent_player, str_weapon_time);
	level thread weapon_powerup_remove(ent_player, str_gun_return_notify, str_weapon, 1);
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: weapon_powerup_replace
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x6670
	Size: 0x100
	Parameters: 3
	Flags: None
	Line Number: 2474
*/
function weapon_powerup_replace(ent_player, str_gun_return_notify, str_weapon)
{
	ent_player endon("death");
	ent_player endon("disconnect");
	ent_player endon("player_downed");
	ent_player endon(str_gun_return_notify);
	str_weapon_on = "zombie_powerup_" + str_weapon + "_on";
	ent_player waittill("replace_weapon_powerup");
	ent_player TakeWeapon(level.zombie_powerup_weapon[str_weapon]);
	ent_player.zombie_vars[str_weapon_on] = 0;
	ent_player.has_specific_powerup_weapon[str_weapon] = 0;
	ent_player.has_powerup_weapon = 0;
	ent_player zm_utility::decrement_is_drinking();
}

/*
	Name: weapon_powerup_remove
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x6778
	Size: 0x138
	Parameters: 4
	Flags: None
	Line Number: 2499
*/
function weapon_powerup_remove(ent_player, str_gun_return_notify, str_weapon, b_switch_back_weapon)
{
	if(!isdefined(b_switch_back_weapon))
	{
		b_switch_back_weapon = 1;
	}
	ent_player endon("death");
	ent_player endon("player_downed");
	str_weapon_on = "zombie_powerup_" + str_weapon + "_on";
	ent_player TakeWeapon(level.zombie_powerup_weapon[str_weapon]);
	ent_player.zombie_vars[str_weapon_on] = 0;
	ent_player._show_solo_hud = 0;
	ent_player.has_specific_powerup_weapon[str_weapon] = 0;
	ent_player.has_powerup_weapon = 0;
	ent_player notify(str_gun_return_notify);
	ent_player zm_utility::decrement_is_drinking();
	if(b_switch_back_weapon)
	{
		ent_player zm_weapons::switch_back_primary_weapon(ent_player._zombie_weapon_before_powerup[str_weapon]);
		return;
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: weapon_watch_gunner_downed
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x68B8
	Size: 0x158
	Parameters: 1
	Flags: None
	Line Number: 2534
*/
function weapon_watch_gunner_downed(str_weapon)
{
	str_notify = str_weapon + "_time_over";
	str_weapon_on = "zombie_powerup_" + str_weapon + "_on";
	if(!isdefined(self.has_specific_powerup_weapon) || (!(isdefined(self.has_specific_powerup_weapon[str_weapon]) && self.has_specific_powerup_weapon[str_weapon])))
	{
		return;
	}
	primaryWeapons = self getweaponslistprimaries();
	for(i = 0; i < primaryWeapons.size; i++)
	{
		if(primaryWeapons[i] == level.zombie_powerup_weapon[str_weapon])
		{
			self TakeWeapon(level.zombie_powerup_weapon[str_weapon]);
		}
	}
	self notify(str_notify);
	self.zombie_vars[str_weapon_on] = 0;
	self._show_solo_hud = 0;
	wait(0.05);
	self.has_specific_powerup_weapon[str_weapon] = 0;
	self.has_powerup_weapon = 0;
}

/*
	Name: register_powerup
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x6A18
	Size: 0xE8
	Parameters: 3
	Flags: None
	Line Number: 2568
*/
function register_powerup(str_powerup, func_grab_powerup, func_setup)
{
	/#
		Assert(isdefined(str_powerup), "Dev Block strings are not supported");
	#/
	_register_undefined_powerup(str_powerup);
	if(isdefined(func_grab_powerup))
	{
		if(!isdefined(level._custom_powerups[str_powerup].grab_powerup))
		{
			level._custom_powerups[str_powerup].grab_powerup = func_grab_powerup;
		}
	}
	if(isdefined(func_setup))
	{
		if(!isdefined(level._custom_powerups[str_powerup].setup_powerup))
		{
			level._custom_powerups[str_powerup].setup_powerup = func_setup;
		}
	}
}

/*
	Name: _register_undefined_powerup
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x6B08
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 2600
*/
function _register_undefined_powerup(str_powerup)
{
	if(!isdefined(level._custom_powerups))
	{
		level._custom_powerups = [];
	}
	if(!isdefined(level._custom_powerups[str_powerup]))
	{
		level._custom_powerups[str_powerup] = spawnstruct();
		include_zombie_powerup(str_powerup);
	}
}

/*
	Name: register_powerup_weapon
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x6B88
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 2623
*/
function register_powerup_weapon(str_powerup, func_countdown)
{
	/#
		Assert(isdefined(str_powerup), "Dev Block strings are not supported");
	#/
	_register_undefined_powerup(str_powerup);
	if(isdefined(func_countdown))
	{
		if(!isdefined(level._custom_powerups[str_powerup].weapon_countdown))
		{
			level._custom_powerups[str_powerup].weapon_countdown = func_countdown;
		}
	}
}

