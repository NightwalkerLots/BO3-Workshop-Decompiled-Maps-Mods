#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;
#include scripts\zm\zmsavedata;

#namespace zm_perks;

/*
	Name: init
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x928
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function init()
{
	level.perk_purchase_limit = 4;
	perks_register_clientfield();
	if(!level.enable_magic)
	{
		return;
	}
	initialize_custom_perk_arrays();
	perk_machine_spawn_init();
	vending_weapon_upgrade_trigger = [];
	level thread function_69a508f0();
}

/*
	Name: function_69a508f0
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x9B0
	Size: 0x458
	Parameters: 0
	Flags: None
	Line Number: 64
*/
function function_69a508f0()
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	if(vending_triggers.size < 1)
	{
		return;
	}
	level.machine_assets = [];
	if(!isdefined(level.custom_vending_precaching))
	{
		level.custom_vending_precaching = &default_vending_precaching;
	}
	[[level.custom_vending_precaching]]();
	zombie_utility::set_zombie_var("zombie_perk_cost", 2000);
	Array::thread_all(vending_triggers, &vending_trigger_think);
	Array::thread_all(vending_triggers, &electric_perks_dialog);
	if(level._custom_perks.size > 0)
	{
		a_keys = getArrayKeys(level._custom_perks);
		for(i = 0; i < a_keys.size; i++)
		{
			if(isdefined(level._custom_perks[a_keys[i]].perk_machine_thread))
			{
				level thread [[level._custom_perks[a_keys[i]].perk_machine_thread]]();
			}
			if(isdefined(level._custom_perks[a_keys[i]].perk_machine_power_override_thread))
			{
				if(namespace_851dc78f::function_20dc5a15(a_keys[i]) || (level.script == "zm_tomb" && (a_keys[i] == "specialty_doubletap2" || a_keys[i] == "specialty_widowswine" || a_keys[i] == "specialty_deadshot" || a_keys[i] == "specialty_electriccherry")))
				{
					level thread [[level._custom_perks[a_keys[i]].perk_machine_power_override_thread]](a_keys[i]);
				}
				else if(level.script == "zm_sumpf" && a_keys[i] != "specialty_quickrevive" && a_keys[i] != "specialty_fastreload" && a_keys[i] != "specialty_additionalprimaryweapon" && a_keys[i] != "specialty_doubletap2" && a_keys[i] != "specialty_armorvest")
				{
					level thread [[level._custom_perks[a_keys[i]].perk_machine_power_override_thread]](a_keys[i]);
				}
				else
				{
					level thread [[level._custom_perks[a_keys[i]].perk_machine_power_override_thread]]();
					continue;
				}
			}
			if(isdefined(level._custom_perks[a_keys[i]].alias) && isdefined(level._custom_perks[a_keys[i]].radiant_machine_name) && isdefined(level._custom_perks[a_keys[i]].machine_light_effect))
			{
				level thread perk_machine_think(a_keys[i], level._custom_perks[a_keys[i]]);
			}
		}
	}
	else if(isdefined(level.quantum_bomb_register_result_func))
	{
		[[level.quantum_bomb_register_result_func]]("give_nearest_perk", &quantum_bomb_give_nearest_perk_result, 10, &quantum_bomb_give_nearest_perk_validation);
	}
	level thread perk_hostmigration();
}

/*
	Name: perk_machine_think
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0xE10
	Size: 0x5B8
	Parameters: 2
	Flags: None
	Line Number: 128
*/
function perk_machine_think(str_key, s_custom_perk)
{
	level notify(str_key + "_perk_machine_think");
	level endon(str_key + "_perk_machine_think");
	if(!isdefined(str_key) || !isdefined(s_custom_perk) || !isdefined(s_custom_perk.alias))
	{
		return;
	}
	str_endon = str_key + "_power_thread_end";
	level endon(str_endon);
	var_fb1cd1b2 = s_custom_perk.alias + "_on";
	str_off = s_custom_perk.alias + "_off";
	str_notify = str_key + "_power_on";
	while(1)
	{
		machine = GetEntArray(s_custom_perk.radiant_machine_name, "targetname");
		machine_triggers = GetEntArray(s_custom_perk.radiant_machine_name, "target");
		if(machine.size > 0)
		{
			machine[0] notify("perk_machine_think");
			machine[0] endon("perk_machine_think");
		}
		for(i = 0; i < machine.size; i++)
		{
			if(isdefined(level.machine_assets[str_key]) && isdefined(level.machine_assets[str_key].off_model))
			{
				machine[i] SetModel(level.machine_assets[str_key].off_model);
			}
			machine[i] solid();
		}
		level thread do_initial_power_off_callback(machine, str_key);
		Array::thread_all(machine_triggers, &set_power_on, 0);
		level waittill(var_fb1cd1b2);
		machine = GetEntArray(s_custom_perk.radiant_machine_name, "targetname");
		machine_triggers = GetEntArray(s_custom_perk.radiant_machine_name, "target");
		var_fd0c24bd = 1;
		if(isdefined(level.var_1bfd5a74) && level.var_1bfd5a74.size > 0)
		{
			for(i = 0; i < level.var_1bfd5a74.size; i++)
			{
				if(isdefined(level.var_1bfd5a74[i].script_noteworthy) && level.var_1bfd5a74[i].script_noteworthy == str_key)
				{
					var_fd0c24bd = 0;
				}
			}
		}
		for(i = 0; i < machine.size; i++)
		{
			machine[i] SetModel(level.machine_assets[str_key].on_model);
			if(var_fd0c24bd)
			{
				machine[i] vibrate(VectorScale((0, -1, 0), 100), 0.3, 0.4, 3);
			}
			machine[i] playsound("zmb_perks_power_on");
			machine[i] thread perk_fx(s_custom_perk.machine_light_effect);
			machine[i] thread play_loop_on_machine();
		}
		level notify(str_notify);
		Array::thread_all(machine_triggers, &set_power_on, 1);
		if(isdefined(level.machine_assets[str_key].power_on_callback))
		{
			Array::thread_all(machine, level.machine_assets[str_key].power_on_callback);
		}
		level waittill(str_off);
		machine = GetEntArray(s_custom_perk.radiant_machine_name, "targetname");
		machine_triggers = GetEntArray(s_custom_perk.radiant_machine_name, "target");
		if(isdefined(level.machine_assets[str_key].power_off_callback))
		{
			Array::thread_all(machine, level.machine_assets[str_key].power_off_callback);
		}
		Array::thread_all(machine, &turn_perk_off);
	}
}

/*
	Name: default_vending_precaching
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x13D0
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 212
*/
function default_vending_precaching()
{
	if(level._custom_perks.size > 0)
	{
		a_keys = getArrayKeys(level._custom_perks);
		for(i = 0; i < a_keys.size; i++)
		{
			if(isdefined(level._custom_perks[a_keys[i]].precache_func))
			{
				level [[level._custom_perks[a_keys[i]].precache_func]]();
			}
		}
	}
}

/*
	Name: do_initial_power_off_callback
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x1488
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 237
*/
function do_initial_power_off_callback(machine_array, perkname)
{
	if(!isdefined(level.machine_assets[perkname]))
	{
		return;
	}
	if(!isdefined(level.machine_assets[perkname].power_off_callback))
	{
		return;
	}
	wait(0.05);
	Array::thread_all(machine_array, level.machine_assets[perkname].power_off_callback);
}

/*
	Name: use_solo_revive
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x1510
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 261
*/
function use_solo_revive()
{
	if(isdefined(level.override_use_solo_revive))
	{
		return [[level.override_use_solo_revive]]();
	}
	players = GetPlayers();
	solo_mode = 0;
	if(players.size == 1 || (isdefined(level.force_solo_quick_revive) && level.force_solo_quick_revive))
	{
		solo_mode = 1;
	}
	level.using_solo_revive = solo_mode;
	return solo_mode;
}

/*
	Name: set_power_on
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x15A8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 287
*/
function set_power_on(state)
{
	if(isdefined(self) && isdefined(state))
	{
		self.power_on = state;
	}
}

/*
	Name: turn_perk_off
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x15E0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 305
*/
function turn_perk_off(ishidden)
{
	self notify("stop_loopsound");
	perk_fx(undefined, 1);
	return;
}

/*
	Name: play_loop_on_machine
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x1620
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 322
*/
function play_loop_on_machine()
{
	if(isdefined(level.sndPerksacolaLoopOverride))
	{
		return;
	}
	self PlayLoopSound("zmb_perks_machine_loop");
	self waittill("stop_loopsound");
	self StopLoopSound(2);
}

/*
	Name: perk_fx
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x1680
	Size: 0x178
	Parameters: 2
	Flags: None
	Line Number: 343
*/
function perk_fx(FX, turnOffFx)
{
	self endon("death");
	if(isdefined(turnOffFx))
	{
		self.perk_fx = 0;
		if(isdefined(self.b_keep_when_turned_off) && self.b_keep_when_turned_off && isdefined(self.s_fxloc))
		{
			self.s_fxloc delete();
		}
	}
	else
	{
		wait(3);
		if(!isdefined(self))
		{
			return;
		}
		if(!(isdefined(self.b_keep_when_turned_off) && self.b_keep_when_turned_off))
		{
			if(isdefined(self) && (!(isdefined(self.perk_fx) && self.perk_fx)))
			{
				PlayFXOnTag(level._effect[FX], self, "tag_origin");
				self.perk_fx = 1;
			}
		}
		else if(isdefined(self) && !isdefined(self.s_fxloc))
		{
			self.s_fxloc = util::spawn_model("tag_origin", self.origin);
			PlayFXOnTag(level._effect[FX], self.s_fxloc, "tag_origin");
			self.perk_fx = 1;
		}
	}
}

/*
	Name: electric_perks_dialog
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x1800
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 388
*/
function electric_perks_dialog()
{
	self endon("death");
	wait(0.01);
	level flag::wait_till("start_zombie_round_logic");
	players = GetPlayers();
	if(players.size == 1)
	{
		return;
	}
	self endon("warning_dialog");
	level endon("switch_flipped");
	timer = 0;
	while(1)
	{
		wait(0.5);
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(!isdefined(players[i]))
			{
				continue;
			}
			dist = DistanceSquared(players[i].origin, self.origin);
			if(dist > 4900)
			{
				timer = 0;
				continue;
			}
			if(dist < 4900 && timer < 3)
			{
				wait(0.5);
				timer++;
			}
			if(dist < 4900 && timer == 3)
			{
				if(!isdefined(players[i]))
				{
					continue;
				}
				players[i] thread zm_utility::do_player_vo("vox_start", 5);
				wait(3);
				self notify("warning_dialog");
			}
		}
	}
}

/*
	Name: reset_vending_hint_string
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x19E8
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 446
*/
function reset_vending_hint_string()
{
	perk = self.script_noteworthy;
	Solo = use_solo_revive();
	if(isdefined(level._custom_perks))
	{
		if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].cost) && isdefined(level._custom_perks[perk].hint_string))
		{
			if(IsFunctionPtr(level._custom_perks[perk].cost))
			{
				n_cost = [[level._custom_perks[perk].cost]]();
			}
			else
			{
				n_cost = level._custom_perks[perk].cost;
			}
			if(!isdefined(level.var_543bac32[perk]))
			{
				self setHintString(level._custom_perks[perk].hint_string, n_cost);
			}
		}
	}
}

/*
	Name: vending_trigger_can_player_use
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x1B40
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 480
*/
function vending_trigger_can_player_use(player)
{
	if(player laststand::player_is_in_laststand() || (isdefined(player.intermission) && player.intermission))
	{
		return 0;
	}
	if(player zm_utility::in_revive_trigger())
	{
		return 0;
	}
	if(!player zm_magicbox::can_buy_weapon())
	{
		return 0;
	}
	if(player IsThrowingGrenade())
	{
		return 0;
	}
	if(player IsSwitchingWeapons())
	{
		return 0;
	}
	if(player.IS_DRINKING > 0)
	{
		return 0;
	}
	return 1;
}

/*
	Name: vending_trigger_think
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x1C30
	Size: 0x1058
	Parameters: 1
	Flags: None
	Line Number: 519
*/
function vending_trigger_think(start_on)
{
	if(!isdefined(start_on))
	{
		start_on = 0;
	}
	self endon("death");
	self notify("perk_think");
	self endon("perk_think");
	wait(0.01);
	perk = self.script_noteworthy;
	Solo = 0;
	level.revive_machine_is_solo = 0;
	if(isdefined(perk) && perk == "specialty_quickrevive")
	{
		level flag::wait_till("start_zombie_round_logic");
		Solo = use_solo_revive();
		self endon("stop_quickrevive_logic");
		level.quick_revive_trigger = self;
		if(Solo)
		{
			if(!(isdefined(level.revive_machine_is_solo) && level.revive_machine_is_solo))
			{
				if(!(isdefined(level.initial_quick_revive_power_off) && level.initial_quick_revive_power_off))
				{
					start_on = 1;
				}
				players = GetPlayers();
				foreach(player in players)
				{
					if(!isdefined(player.lives))
					{
						player.lives = 0;
					}
				}
				level zm::set_default_laststand_pistol(1);
			}
			level.revive_machine_is_solo = 1;
		}
	}
	self setHintString(&"ZOMBIE_NEED_POWER");
	self setcursorhint("HINT_NOICON");
	self UseTriggerRequireLookAt();
	cost = level.zombie_vars["zombie_perk_cost"];
	if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].cost))
	{
		if(IsInt(level._custom_perks[perk].cost))
		{
			cost = level._custom_perks[perk].cost;
		}
		else
		{
			cost = [[level._custom_perks[perk].cost]]();
		}
	}
	self.cost = cost;
	if(!start_on)
	{
		notify_name = perk + "_power_on";
		level waittill(notify_name);
	}
	if(!isdefined(level.var_fb76ba29) || level.var_fb76ba29 != level.round_number)
	{
		level.var_fb76ba29 = level.round_number;
		level._perkmachinenetworkchoke = 0;
	}
	if(!isdefined(level._perkmachinenetworkchoke))
	{
		level._perkmachinenetworkchoke = 0;
	}
	else if(isdefined(level._perkmachinenetworkchoke))
	{
		level._perkmachinenetworkchoke++;
	}
	for(i = 0; i < level._perkmachinenetworkchoke; i++)
	{
		util::wait_network_frame();
	}
	self thread sndPerksJingles_Timer();
	self thread check_player_has_perk(perk);
	if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].hint_string))
	{
		if(!isdefined(level.var_543bac32[perk]))
		{
			self setHintString(level._custom_perks[perk].hint_string, cost);
		}
	}
	for(;;)
	{
		self waittill("trigger", player);
		perk = self.script_noteworthy;
		index = zm_utility::get_player_index(player);
		if(!vending_trigger_can_player_use(player))
		{
			wait(0.1);
		}
		else if(isdefined(level.var_543bac32[perk]))
		{
			var_d2232c96 = util::within_fov(player GetEye(), player getPlayerAngles(), self.origin + VectorScale((0, 0, 1), 20), cos(40));
			var_e34a2336 = 5625;
			var_4711472c = DistanceSquared(player.origin, self.origin);
			if(var_4711472c > var_e34a2336 || !var_d2232c96 || (isdefined(player.var_1c066cab) && player.var_1c066cab != self))
			{
				wait(0.1);
			}
		}
		else
		{
			return_time = 1;
			player.var_312fee85 = player hud::createPrimaryProgressBar();
			player.var_5b3109a1 = newClientHudElem(player);
			player.var_312fee85 hud::updateBar(0.01, 1 / return_time);
			player.var_5b3109a1.alignX = "center";
			player.var_5b3109a1.alignY = "middle";
			player.var_5b3109a1.horzAlign = "center";
			player.var_5b3109a1.vertAlign = "bottom";
			player.var_5b3109a1.y = -113;
			if(player IsSplitscreen())
			{
				player.var_5b3109a1.y = -347;
			}
			player.var_5b3109a1.foreground = 1;
			player.var_5b3109a1.font = "default";
			player.var_5b3109a1.fontscale = 1.8;
			player.var_5b3109a1.alpha = 1;
			player.var_5b3109a1.color = (1, 1, 1);
			player.var_5b3109a1.hidewheninmenu = 1;
			player.var_5b3109a1 setText("RETURNING PERK...");
			while(player useButtonPressed() && return_time > 0)
			{
				return_time = return_time - 0.1;
				wait(0.1);
			}
			player.var_312fee85 hud::destroyElem();
			player.var_5b3109a1 destroy();
			if(return_time <= 0)
			{
				var_fdefbb45 = 0;
				if(IsFunctionPtr(level._custom_perks[perk].cost))
				{
					var_fdefbb45 = [[level._custom_perks[perk].cost]]();
				}
				else
				{
					var_fdefbb45 = level._custom_perks[perk].cost;
				}
				if(player namespace_851dc78f::function_b690a849(perk))
				{
					var_fdefbb45 = var_fdefbb45 + level.var_7280bfd8[perk].cost;
				}
				perk_str = perk + "_stop";
				player notify(perk_str);
				player zm_score::add_to_player_score(Int(var_fdefbb45 / 2));
			}
			else
			{
				var_2e32b5b2 = 0;
				if(namespace_851dc78f::function_20dc5a15(perk) && namespace_851dc78f::function_a7c76532(perk) && !player namespace_851dc78f::function_b690a849(perk) && player namespace_851dc78f::function_5f9a13b3(perk) || (!namespace_851dc78f::function_20dc5a15(perk) && namespace_851dc78f::function_a7c76532(perk) && !player namespace_851dc78f::function_b690a849(perk) && player hasPerk(perk)))
				{
					var_2e32b5b2 = 1;
				}
				else if(player namespace_851dc78f::function_42dc6a57(perk))
				{
					cheat = 0;
					if(cheat != 1)
					{
						self playsound("evt_perk_deny");
						player zm_audio::create_and_play_dialog("general", "sigh");
					}
				}
				else
				{
					valid = self [[level.custom_perk_validation]](player);
					if(!valid)
					{
					}
					else
					{
						current_cost = self.cost;
						if(player zm_pers_upgrades_functions::is_pers_double_points_active())
						{
							current_cost = player zm_pers_upgrades_functions::pers_upgrade_double_points_cost(current_cost);
						}
						if(var_2e32b5b2 && isdefined(level.var_7280bfd8) && isdefined(level.var_7280bfd8[perk]) && isdefined(level.var_7280bfd8[perk].cost))
						{
							current_cost = level.var_7280bfd8[perk].cost;
							if(isdefined(player.var_bc1d8ed3))
							{
								current_cost = player.var_bc1d8ed3;
							}
						}
						if(isdefined(perk == "specialty_quickrevive") && perk == "specialty_quickrevive" && !var_2e32b5b2 && isdefined(level.solo_lives_given) && level.solo_lives_given >= 3)
						{
							self playsound("evt_perk_deny");
							player zm_audio::create_and_play_dialog("general", "sigh");
						}
						else if(namespace_11e193f1::function_6dd41714("perks_cwprice") == 1)
						{
							if(var_2e32b5b2)
							{
								if(!isdefined(player.var_d6aef449))
								{
									player.var_d6aef449 = [];
								}
								current_cost = 1000 + 500 * player.var_d6aef449.size;
							}
							else if(!isdefined(player.num_perks))
							{
								player.num_perks = 0;
							}
							if(perk == "specialty_quickrevive" && (isdefined(level.using_solo_revive) && level.using_solo_revive))
							{
								current_cost = 500;
							}
							else
							{
								current_cost = 2500 + 500 * player.num_perks;
							}
						}
						if(!player zm_score::can_player_purchase(current_cost))
						{
							self playsound("evt_perk_deny");
							player zm_audio::create_and_play_dialog("general", "outofmoney");
						}
						else if(!var_2e32b5b2 && !player zm_utility::can_player_purchase_perk())
						{
							self playsound("evt_perk_deny");
							player zm_audio::create_and_play_dialog("general", "sigh");
						}
						else
						{
							sound = "evt_bottle_dispense";
							playsoundatposition(sound, self.origin);
							player zm_score::minus_to_player_score(current_cost);
							if(!var_2e32b5b2)
							{
								perkHash = -1;
								if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].hash_id))
								{
									perkHash = level._custom_perks[perk].hash_id;
								}
								player RecordMapEvent(29, GetTime(), self.origin, level.round_number, perkHash);
							}
							player.perk_purchased = perk;
							player notify("perk_purchased", perk);
							if(!var_2e32b5b2)
							{
								player notify("hash_968c9f42");
							}
							self thread zm_audio::sndPerksJingles_Player(1);
							self thread vending_trigger_post_think(player, perk, var_2e32b5b2);
						}
					}
					else
					{
					}
				}
				else if(isdefined(level.custom_perk_validation) && !var_2e32b5b2 && !namespace_851dc78f::function_20dc5a15(perk) && function_f300a024(perk))
				{
				}
			}
		}
		else if(player function_97a33421(perk))
		{
		}
	}
}

/*
	Name: sndPerksJingles_Timer
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x2C90
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 797
*/
function sndPerksJingles_Timer()
{
	self endon("death");
	self notify("sndPerksJingles_Timer");
	self endon("sndPerksJingles_Timer");
	if(isdefined(self.sndJingleCooldown))
	{
		self.sndJingleCooldown = 0;
	}
	while(1)
	{
		wait(RandomFloatRange(30, 60));
		if(randomIntRange(0, 100) <= 10 && (!(isdefined(self.sndJingleCooldown) && self.sndJingleCooldown)))
		{
			self thread sndPerksJingles_Player(0);
		}
	}
}

/*
	Name: sndPerksJingles_Player
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x2D50
	Size: 0x180
	Parameters: 1
	Flags: None
	Line Number: 826
*/
function sndPerksJingles_Player(type)
{
	self endon("death");
	if(!isdefined(self.sndJingleActive))
	{
		self.sndJingleActive = 0;
	}
	alias = self.script_sound;
	if(type == 1)
	{
		alias = self.script_label;
	}
	if(isdefined(level.musicsystem) && level.musicsystem.currentplaytype >= 4)
	{
		return;
	}
	self.str_jingle_alias = alias;
	if(!(isdefined(self.sndJingleActive) && self.sndJingleActive))
	{
		self.sndJingleActive = 1;
		self playsoundwithnotify(alias, "sndDone");
		playbacktime = soundgetplaybacktime(alias);
		if(!isdefined(playbacktime) || playbacktime <= 0)
		{
			waittime = 1;
		}
		else
		{
			waittime = playbacktime * 0.001;
		}
		wait(waittime);
		if(type == 0)
		{
			self.sndJingleCooldown = 1;
			self thread sndPerksJingles_Cooldown();
		}
		self.sndJingleActive = 0;
	}
}

/*
	Name: sndPerksJingles_Cooldown
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x2ED8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 876
*/
function sndPerksJingles_Cooldown()
{
	self endon("death");
	wait(45);
	self.sndJingleCooldown = 0;
}

/*
	Name: function_f300a024
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x2F00
	Size: 0x1F0
	Parameters: 1
	Flags: None
	Line Number: 893
*/
function function_f300a024(perk)
{
	if(level.script == "zm_tomb")
	{
		if(perk != "specialty_armorvest" && perk != "specialty_quickrevive" && perk != "specialty_fastreload" && perk != "specialty_staminup" && perk != "specialty_additionalprimaryweapon")
		{
			if(!isdefined(level.var_bfb968a) || !isdefined(level.var_bfb968a[perk]))
			{
				return 0;
			}
		}
		if(isdefined(level.var_5a036fa0[perk]) && level.var_5a036fa0[perk])
		{
			return 0;
		}
	}
	if(level.script == "zm_moon")
	{
		if(perk != "specialty_armorvest" && perk != "specialty_fastreload")
		{
			return 0;
		}
	}
	if(level.script == "zm_sumpf")
	{
		if(perk != "specialty_armorvest" && perk != "specialty_quickrevive" && perk != "specialty_fastreload" && perk != "specialty_doubletap2" && perk != "specialty_additionalprimaryweapon")
		{
			return 0;
		}
	}
	if(level.script == "zm_zod")
	{
		if(perk != "specialty_armorvest" && perk != "specialty_quickrevive" && perk != "specialty_fastreload" && perk != "specialty_doubletap2" && perk != "specialty_additionalprimaryweapon" && perk != "specialty_staminup" && perk != "specialty_widowswine")
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: vending_trigger_post_think
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x30F8
	Size: 0x280
	Parameters: 3
	Flags: None
	Line Number: 943
*/
function vending_trigger_post_think(player, perk, var_2e32b5b2)
{
	player endon("disconnect");
	player endon("end_game");
	player endon("perk_abort_drinking");
	if(!isdefined(var_2e32b5b2))
	{
		var_2e32b5b2 = 0;
	}
	gun = player perk_give_bottle_begin(perk);
	evt = player util::waittill_any_return("fake_death", "death", "player_downed", "weapon_change_complete", "perk_abort_drinking", "disconnect");
	if(evt == "weapon_change_complete")
	{
		player thread wait_give_perk(perk, 1, var_2e32b5b2);
	}
	player perk_give_bottle_end(gun, perk);
	if(player laststand::player_is_in_laststand() || (isdefined(player.intermission) && player.intermission))
	{
		return;
	}
	player notify("burp");
	if(var_2e32b5b2)
	{
		if(isdefined(level.var_7280bfd8[perk].var_2ebfb3f9))
		{
			player thread [[level.var_7280bfd8[perk].var_2ebfb3f9]]();
			return;
		}
	}
	if(isdefined(level.pers_upgrade_cash_back) && level.pers_upgrade_cash_back)
	{
		player zm_pers_upgrades_functions::cash_back_player_drinks_perk();
	}
	if(isdefined(level.pers_upgrade_perk_lose) && level.pers_upgrade_perk_lose)
	{
		player thread zm_pers_upgrades_functions::pers_upgrade_perk_lose_bought();
	}
	if(isdefined(level.perk_bought_func))
	{
		player [[level.perk_bought_func]](perk);
	}
	player.perk_purchased = undefined;
	if(!(isdefined(self.power_on) && self.power_on))
	{
		wait(1);
		perk_pause(self.script_noteworthy);
	}
}

/*
	Name: wait_give_perk
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x3380
	Size: 0x228
	Parameters: 3
	Flags: None
	Line Number: 1002
*/
function wait_give_perk(perk, bought, var_2e32b5b2)
{
	if(!isdefined(var_2e32b5b2))
	{
		var_2e32b5b2 = 0;
	}
	self endon("player_downed");
	self endon("disconnect");
	self endon("end_game");
	self endon("perk_abort_drinking");
	self util::waittill_any_timeout(0.5, "burp", "player_downed", "disconnect", "end_game", "perk_abort_drinking");
	if(!var_2e32b5b2)
	{
		self thread namespace_4b6e359c::function_75aa16e4(perk, level.var_7280bfd8[perk].clientfield_name, "overlayStyle", 0);
		self give_perk(perk, bought, var_2e32b5b2);
	}
	else if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_d6aef449[perk] = 1;
	if(isdefined(level.var_7280bfd8) && isdefined(level.var_7280bfd8[perk]) && isdefined(level.var_7280bfd8[perk].clientfield_name))
	{
		self thread namespace_4b6e359c::function_75aa16e4(perk, level.var_7280bfd8[perk].clientfield_name, "overlayStyle", 1);
	}
	if(isdefined(level.var_7280bfd8[perk].var_c2cc6d9b))
	{
		self thread [[level.var_7280bfd8[perk].var_c2cc6d9b]]();
	}
	if(isdefined(level.var_543bac32[perk]))
	{
		self thread function_fea048be(level.var_543bac32[perk] + 1);
	}
}

/*
	Name: return_retained_perks
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x35B0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 1047
*/
function return_retained_perks()
{
	if(isdefined(self._retain_perks_array))
	{
		keys = getArrayKeys(self._retain_perks_array);
		foreach(perk in keys)
		{
			if(isdefined(perk))
			{
				if(isdefined(self._retain_perks_array[perk]) && self._retain_perks_array[perk])
				{
					self give_perk(perk, 0);
				}
			}
		}
	}
}

/*
	Name: give_perk_presentation
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x36B0
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 1075
*/
function give_perk_presentation(perk)
{
	self endon("player_downed");
	self endon("disconnect");
	self endon("end_game");
	self endon("perk_abort_drinking");
	self zm_audio::playerExert("burp");
	if(isdefined(level.remove_perk_vo_delay) && level.remove_perk_vo_delay)
	{
		self zm_audio::create_and_play_dialog("perk", perk);
	}
	else
	{
		self util::delay(1.5, undefined, &zm_audio::create_and_play_dialog, "perk", perk);
	}
	self setblur(9, 0.1);
	wait(0.1);
	self setblur(0, 0.1);
	return;
	ERROR: Bad function call
}

/*
	Name: give_perk
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x37C8
	Size: 0x750
	Parameters: 3
	Flags: None
	Line Number: 1107
*/
function give_perk(perk, bought, var_2e32b5b2)
{
	if(!isdefined(var_2e32b5b2))
	{
		var_2e32b5b2 = 0;
	}
	if(level flag::exists("reap_collection_loaded") && !level flag::get("reap_collection_loaded"))
	{
		self IPrintLnBold("PERK ON HOLD UNTIL LOADING FINISHED");
		level flag::wait_till("reap_collection_loaded");
		wait(1);
	}
	if(!isdefined(level._custom_perks[perk]))
	{
		return;
	}
	if(!var_2e32b5b2)
	{
		self thread namespace_4b6e359c::function_75aa16e4(perk, level.var_7280bfd8[perk].clientfield_name, "overlayReset");
	}
	if(var_2e32b5b2 && isdefined(level.var_7280bfd8) && isdefined(level.var_7280bfd8[perk]) && isdefined(level.var_7280bfd8[perk].clientfield_name))
	{
		self thread namespace_4b6e359c::function_75aa16e4(perk, level.var_7280bfd8[perk].clientfield_name, "overlayStyle", 1);
	}
	else
	{
		self thread namespace_4b6e359c::function_75aa16e4(perk, level.var_7280bfd8[perk].clientfield_name, "overlayStyle", 0);
	}
	if(isdefined(level.var_543bac32) && isdefined(level.var_543bac32[perk]))
	{
		self thread function_fea048be(level.var_543bac32[perk]);
	}
	if(namespace_851dc78f::function_20dc5a15(perk))
	{
		if(!isdefined(self.var_b5c2c258))
		{
			self.var_b5c2c258 = [];
		}
		if(!isdefined(self.var_d6aef449))
		{
			self.var_d6aef449 = [];
		}
		self.var_b5c2c258[perk] = 1;
		self.num_perks++;
		self set_perk_clientfield(perk, 1);
		if(isdefined(bought) && bought)
		{
			self thread give_perk_presentation(perk);
			self notify("perk_bought", perk);
		}
		self thread perk_think(perk);
		if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].player_thread_give))
		{
			self thread [[level._custom_perks[perk].player_thread_give]]();
		}
		self notify("perk_acquired", bought && (level.script == "zm_zod" || level.script == "zm_genesis" || level.script == "zm_sumpf"));
	}
	else
	{
		self setPerk(perk);
		self.num_perks++;
		if(isdefined(bought) && bought)
		{
			self thread give_perk_presentation(perk);
			self notify("perk_bought", perk);
		}
		if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].player_thread_give))
		{
			self thread [[level._custom_perks[perk].player_thread_give]]();
		}
		self set_perk_clientfield(perk, 1);
		demo::bookmark("zm_player_perk", GetTime(), self);
		self zm_stats::increment_client_stat("perks_drank");
		self zm_stats::increment_client_stat(perk + "_drank");
		self zm_stats::increment_player_stat(perk + "_drank");
		self zm_stats::increment_player_stat("perks_drank");
		if(!isdefined(self.perk_history))
		{
			self.perk_history = [];
		}
		Array::add(self.perk_history, perk, 0);
		if(!isdefined(self.perks_active))
		{
			self.perks_active = [];
		}
		if(!isdefined(self.perks_active))
		{
			self.perks_active = [];
		}
		else if(!IsArray(self.perks_active))
		{
			self.perks_active = Array(self.perks_active);
		}
		self.perks_active[self.perks_active.size] = perk;
		self notify("perk_acquired");
		self thread perk_think(perk);
	}
	if(namespace_11e193f1::function_6dd41714("Cheats_perk_upgrade") == 1 || (namespace_11e193f1::function_6dd41714("gamemode_poa_enabled") == 1 && namespace_11e193f1::function_6dd41714("gamemode_poa_adv") == 1))
	{
		if(!isdefined(self.var_d6aef449))
		{
			self.var_d6aef449 = [];
		}
		if(isdefined(level.var_7280bfd8) && isdefined(level.var_7280bfd8[perk]))
		{
			self.var_d6aef449[perk] = 1;
			if(isdefined(level.var_7280bfd8) && isdefined(level.var_7280bfd8[perk]) && isdefined(level.var_7280bfd8[perk].clientfield_name))
			{
				self thread namespace_4b6e359c::function_75aa16e4(perk, level.var_7280bfd8[perk].clientfield_name, "overlayStyle", 1);
			}
			if(isdefined(level.var_7280bfd8[perk].var_c2cc6d9b))
			{
				self thread [[level.var_7280bfd8[perk].var_c2cc6d9b]]();
			}
		}
	}
	self thread function_68d19af2();
}

/*
	Name: function_fea048be
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x3F20
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1236
*/
function function_fea048be(num)
{
	if(isdefined(self.var_fea048be) && self.var_fea048be)
	{
		return;
	}
	self.var_fea048be = 1;
	self LUINotifyEvent(&"perk_info_popup", 1, Int(num));
	wait(1);
	self.var_fea048be = undefined;
}

/*
	Name: function_68d19af2
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x3FA8
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 1258
*/
function function_68d19af2()
{
	self endon("disconnect");
	self notify("hash_68d19af2");
	self endon("hash_68d19af2");
	wait(0.5);
	a_str_perks = getArrayKeys(level._custom_perks);
	for(i = 0; i < a_str_perks.size; i++)
	{
		perk = a_str_perks[i];
		if(!namespace_851dc78f::function_20dc5a15(perk) && self hasPerk(perk) || (namespace_851dc78f::function_20dc5a15(perk) && self namespace_851dc78f::function_5f9a13b3(perk)))
		{
			var_2e32b5b2 = 0;
			if(self namespace_851dc78f::function_b690a849(perk))
			{
				var_2e32b5b2 = 1;
			}
			if(var_2e32b5b2 && isdefined(level.var_7280bfd8) && isdefined(level.var_7280bfd8[perk]) && isdefined(level.var_7280bfd8[perk].clientfield_name))
			{
				self thread namespace_4b6e359c::function_75aa16e4(perk, level.var_7280bfd8[perk].clientfield_name, "overlayStyle", 1);
			}
			else
			{
				self thread namespace_4b6e359c::function_75aa16e4(perk, level.var_7280bfd8[perk].clientfield_name, "overlayStyle", 0);
			}
		}
		wait(0.15);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: perk_set_max_health_if_jugg
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x41B0
	Size: 0x220
	Parameters: 3
	Flags: None
	Line Number: 1300
*/
function perk_set_max_health_if_jugg(str_perk, set_preMaxHealth, clamp_health_to_max_health)
{
	if(!isdefined(str_perk))
	{
		return;
	}
	n_max_total_health = undefined;
	switch(str_perk)
	{
		case "specialty_armorvest":
		{
			if(set_preMaxHealth)
			{
				self.preMaxHealth = self.maxhealth;
			}
			n_max_total_health = self.maxhealth + level.zombie_vars["zombie_perk_juggernaut_health"];
			break;
		}
		case "jugg_upgrade":
		{
			if(set_preMaxHealth)
			{
				self.preMaxHealth = self.maxhealth;
			}
			if(self hasPerk("specialty_armorvest"))
			{
				n_max_total_health = n_max_total_health + level.zombie_vars["zombie_perk_juggernaut_health"];
			}
			else
			{
				n_max_total_health = level.zombie_vars["player_base_health"];
				break;
			}
		}
		case "health_reboot":
		{
			n_max_total_health = level.zombie_vars["player_base_health"];
			if(isdefined(self.n_player_health_boost))
			{
				n_max_total_health = n_max_total_health + self.n_player_health_boost;
			}
			if(self hasPerk("specialty_armorvest"))
			{
				n_max_total_health = n_max_total_health + level.zombie_vars["zombie_perk_juggernaut_health"];
			}
		}
	}
	if(isdefined(n_max_total_health))
	{
		if(self zm_pers_upgrades_functions::pers_jugg_active())
		{
			n_max_total_health = n_max_total_health + level.pers_jugg_upgrade_health_bonus;
		}
		self.maxhealth = n_max_total_health;
		self setmaxhealth(n_max_total_health);
		if(isdefined(clamp_health_to_max_health) && clamp_health_to_max_health == 1)
		{
			if(self.health > self.maxhealth)
			{
				self.health = self.maxhealth;
			}
		}
	}
}

/*
	Name: check_player_has_perk
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x43D8
	Size: 0xC80
	Parameters: 1
	Flags: None
	Line Number: 1375
*/
function check_player_has_perk(perk)
{
	self notify("check_player_has_perk");
	self endon("check_player_has_perk");
	self endon("death");
	dist = 16384;
	var_e34a2336 = 5625;
	while(1)
	{
		perk = self.script_noteworthy;
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			var_d2232c96 = util::within_fov(players[i] GetEye(), players[i] getPlayerAngles(), self.origin + VectorScale((0, 0, 1), 20), cos(40));
			var_4711472c = DistanceSquared(players[i].origin, self.origin);
			var_c58a1363 = !players[i] namespace_851dc78f::function_42dc6a57(perk) && self vending_trigger_can_player_use(players[i]) && !players[i] zm_utility::in_revive_trigger() && !zm_equipment::is_equipment_that_blocks_purchase(players[i] GetCurrentWeapon()) && !players[i] zm_equipment::hacker_active() && self IsTriggerEnabled();
			if(players[i] function_97a33421(perk))
			{
				self setinvisibletoplayer(players[i], 0);
				if(isdefined(players[i].var_1c066cab) && players[i].var_1c066cab == self)
				{
					players[i].var_1c066cab = undefined;
					players[i] LUINotifyEvent(&"perk_machine_trigger_popup", 1, Int(-1));
				}
				self setHintString(&"ZM_REAP_MOD_PERK_RETURN");
				self setinvisibletoplayer(players[i], 0);
			}
			else if(!var_c58a1363)
			{
				if(isdefined(players[i].var_1c066cab) && players[i].var_1c066cab == self)
				{
					players[i].var_1c066cab = undefined;
					players[i] LUINotifyEvent(&"perk_machine_trigger_popup", 1, Int(-1));
				}
				self setinvisibletoplayer(players[i], 1);
				continue;
			}
			else
			{
				self setinvisibletoplayer(players[i], 0);
			}
			if(var_4711472c < dist)
			{
				if(isdefined(isdefined(level.var_bfb968a) && isdefined(level.var_bfb968a[perk])) && isdefined(level.var_bfb968a) && isdefined(level.var_bfb968a[perk]) && (!(isdefined(isdefined(self.power_on) && self.power_on) && isdefined(self.power_on) && self.power_on)))
				{
					self setHintString(&"ZOMBIE_NEED_POWER");
				}
				else if(players[i] function_97a33421(perk))
				{
					self setHintString(&"ZM_REAP_MOD_PERK_RETURN");
				}
				else if(namespace_851dc78f::function_20dc5a15(perk) && namespace_851dc78f::function_a7c76532(perk) && !players[i] namespace_851dc78f::function_b690a849(perk) && players[i] namespace_851dc78f::function_5f9a13b3(perk) || (!namespace_851dc78f::function_20dc5a15(perk) && namespace_851dc78f::function_a7c76532(perk) && !players[i] namespace_851dc78f::function_b690a849(perk) && players[i] hasPerk(perk)))
				{
					if(!isdefined(level.var_543bac32[perk]))
					{
						self setHintString(level.var_7280bfd8[perk].desc, level.var_7280bfd8[perk].cost);
					}
					else
					{
						self setHintString("");
						if(var_d2232c96 && var_4711472c < var_e34a2336)
						{
							if(!isdefined(players[i].var_1c066cab))
							{
								players[i].var_1c066cab = self;
								if(namespace_11e193f1::function_6dd41714("perks_cwprice") == 1)
								{
									if(!isdefined(players[i].var_d6aef449))
									{
										players[i].var_d6aef449 = [];
									}
									players[i] LUINotifyEvent(&"perk_machine_trigger_popup", 2, Int(level.var_543bac32[perk] + 1), 2 + players[i].var_d6aef449.size);
								}
								else
								{
									players[i] LUINotifyEvent(&"perk_machine_trigger_popup", 1, Int(level.var_543bac32[perk] + 1));
								}
							}
						}
						else if(isdefined(players[i].var_1c066cab) && players[i].var_1c066cab == self)
						{
							players[i].var_1c066cab = undefined;
							players[i] LUINotifyEvent(&"perk_machine_trigger_popup", 1, Int(-1));
						}
					}
				}
				else if(players[i] namespace_851dc78f::function_9615be2a(perk))
				{
					if(IsFunctionPtr(level._custom_perks[perk].cost))
					{
						n_cost = [[level._custom_perks[perk].cost]]();
					}
					else
					{
						n_cost = level._custom_perks[perk].cost;
					}
					if(!isdefined(level.var_543bac32[perk]))
					{
						self setHintString(level._custom_perks[perk].hint_string, n_cost);
					}
					else
					{
						self setHintString("");
						if(var_d2232c96 && var_4711472c < var_e34a2336)
						{
							if(!isdefined(players[i].var_1c066cab))
							{
								players[i].var_1c066cab = self;
								if(perk == "specialty_quickrevive" && (isdefined(level.using_solo_revive) && level.using_solo_revive))
								{
									if(!isdefined(level.solo_lives_given) || level.solo_lives_given <= 3)
									{
										players[i] LUINotifyEvent(&"perk_machine_trigger_popup", 1, Int(124));
									}
								}
								else
								{
									players[i].var_1c066cab = self;
									if(namespace_11e193f1::function_6dd41714("perks_cwprice") == 1)
									{
										if(!isdefined(players[i].num_perks))
										{
											players[i].num_perks = 0;
										}
										players[i] LUINotifyEvent(&"perk_machine_trigger_popup", 2, Int(level.var_543bac32[perk]), 5 + players[i].num_perks);
									}
									else
									{
										players[i] LUINotifyEvent(&"perk_machine_trigger_popup", 1, Int(level.var_543bac32[perk]));
									}
								}
							}
						}
						else if(isdefined(players[i].var_1c066cab) && players[i].var_1c066cab == self)
						{
							players[i].var_1c066cab = undefined;
							players[i] LUINotifyEvent(&"perk_machine_trigger_popup", 1, Int(-1));
						}
					}
				}
			}
			if(!var_d2232c96 && isdefined(players[i].var_1c066cab) && players[i].var_1c066cab == self && var_4711472c >= var_e34a2336)
			{
				players[i].var_1c066cab = undefined;
				players[i] LUINotifyEvent(&"perk_machine_trigger_popup", 1, Int(-1));
			}
		}
		wait(0.1);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_97a33421
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x5060
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 1538
*/
function function_97a33421(perk)
{
	if(!level flag::get("reap_collection_loaded"))
	{
		return 0;
	}
	if(namespace_11e193f1::function_6dd41714("perks_refund") == 0)
	{
		return 0;
	}
	if(namespace_851dc78f::function_20dc5a15(perk) && !self namespace_851dc78f::function_5f9a13b3(perk) || (!namespace_851dc78f::function_20dc5a15(perk) && !self hasPerk(perk)))
	{
		return 0;
	}
	if(self GetStance() == "crouch" && self function_679da569() == 0 && !self namespace_851dc78f::function_9615be2a(perk))
	{
		return 1;
	}
	return 0;
}

/*
	Name: vending_set_hintstring
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x5190
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 1569
*/
function vending_set_hintstring(perk)
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: perk_think
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x51A8
	Size: 0x3B8
	Parameters: 1
	Flags: None
	Line Number: 1585
*/
function perk_think(perk)
{
	self endon("disconnect");
	perk_str = perk + "_stop";
	result = self util::waittill_any_return("fake_death", "death", "player_downed", perk_str);
	while(self bgb::lost_perk_override(perk))
	{
		result = self util::waittill_any_return("fake_death", "death", "player_downed", perk_str);
	}
	do_retain = 1;
	if(use_solo_revive() && perk == "specialty_quickrevive")
	{
		do_retain = 0;
	}
	if(do_retain)
	{
		if(isdefined(self._retain_perks) && self._retain_perks)
		{
			return;
		}
		else if(isdefined(self._retain_perks_array) && (isdefined(self._retain_perks_array[perk]) && self._retain_perks_array[perk]))
		{
			return;
		}
	}
	if(!namespace_851dc78f::function_20dc5a15(perk))
	{
		self unsetPerk(perk);
	}
	self.num_perks--;
	if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].player_thread_take))
	{
		self thread [[level._custom_perks[perk].player_thread_take]](0, perk_str, result);
	}
	if(isdefined(level.var_7280bfd8[perk].var_a26c0247))
	{
		self thread [[level.var_7280bfd8[perk].var_a26c0247]]();
	}
	self set_perk_clientfield(perk, 0);
	self.perk_purchased = undefined;
	if(isdefined(level.perk_lost_func))
	{
		self [[level.perk_lost_func]](perk);
	}
	if(isdefined(self.perks_active) && IsInArray(self.perks_active, perk))
	{
		ArrayRemoveValue(self.perks_active, perk, 0);
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_d6aef449[perk] = undefined;
	if(isdefined(level.var_7280bfd8) && isdefined(level.var_7280bfd8[perk]))
	{
		self thread namespace_4b6e359c::function_75aa16e4(perk, level.var_7280bfd8[perk].clientfield_name, "overlayStyle", 0);
		if(isdefined(level.var_7280bfd8[perk].var_5cac3f9))
		{
			self thread [[level.var_7280bfd8[perk].var_5cac3f9]]();
		}
	}
	if(namespace_11e193f1::function_6dd41714("cheats_uqr") == 1)
	{
		level.solo_lives_given = 0;
	}
	self notify("perk_lost");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: set_perk_clientfield
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x5568
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 1665
*/
function set_perk_clientfield(perk, state)
{
	if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].clientfield_set))
	{
		self [[level._custom_perks[perk].clientfield_set]](state);
	}
}

/*
	Name: perk_hud_destroy
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x55D8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 1683
*/
function perk_hud_destroy(perk)
{
	self.perk_hud[perk] zm_utility::destroy_hud();
	self.perk_hud[perk] = undefined;
}

/*
	Name: perk_hud_grey
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x5618
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 1699
*/
function perk_hud_grey(perk, grey_on_off)
{
	if(grey_on_off)
	{
		self.perk_hud[perk].alpha = 0.3;
	}
	else
	{
		self.perk_hud[perk].alpha = 1;
	}
}

/*
	Name: perk_give_bottle_begin
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x5680
	Size: 0x228
	Parameters: 1
	Flags: None
	Line Number: 1721
*/
function perk_give_bottle_begin(perk)
{
	self zm_utility::increment_is_drinking();
	self zm_utility::disable_player_move_states(1);
	original_weapon = self GetCurrentWeapon();
	weapon = "";
	if(isdefined(level.var_b82f654b) && isdefined(level.var_b82f654b[perk]))
	{
		weapon = GetWeapon("zombie_perk_bottle_template");
		if(isdefined(level.var_10a6f246[perk]))
		{
			weapon = GetWeapon(level.var_10a6f246[perk]);
		}
		weapon = self getbuildkitweapon(weapon, 0);
		weapon_options = self getbuildkitweaponoptions(weapon, level.var_b82f654b[perk]);
		acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(weapon, 0);
		self GiveWeapon(weapon, weapon_options, acvi);
		self SwitchToWeapon(weapon);
		return original_weapon;
	}
	if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].perk_bottle_weapon))
	{
		weapon = level._custom_perks[perk].perk_bottle_weapon;
	}
	self GiveWeapon(weapon);
	self SwitchToWeapon(weapon);
	return original_weapon;
}

/*
	Name: perk_give_bottle_end
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x58B0
	Size: 0x2E8
	Parameters: 2
	Flags: None
	Line Number: 1760
*/
function perk_give_bottle_end(original_weapon, perk)
{
	self endon("perk_abort_drinking");
	/#
		fallback_initiated::Assert(!original_weapon.isPerkBottle);
	#/
	/#
		fallback_initiated::Assert(original_weapon != level.weaponReviveTool);
	#/
	self zm_utility::enable_player_move_states();
	weapon = "";
	if(isdefined(level.var_b82f654b) && level.var_b82f654b[perk])
	{
		weapon = GetWeapon("zombie_perk_bottle_template");
		if(isdefined(level.var_10a6f246[perk]))
		{
			weapon = GetWeapon(level.var_10a6f246[perk]);
		}
	}
	else if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].perk_bottle_weapon))
	{
		weapon = level._custom_perks[perk].perk_bottle_weapon;
	}
	if(self laststand::player_is_in_laststand() || (isdefined(self.intermission) && self.intermission))
	{
		self TakeWeapon(weapon);
		return;
	}
	self TakeWeapon(weapon);
	if(self zm_utility::is_multiple_drinking())
	{
		self zm_utility::decrement_is_drinking();
		return;
	}
	else if(original_weapon != level.weaponNone && !zm_utility::is_placeable_mine(original_weapon) && !zm_equipment::is_equipment_that_blocks_purchase(original_weapon))
	{
		self zm_weapons::switch_back_primary_weapon(original_weapon);
		if(zm_utility::is_melee_weapon(original_weapon))
		{
			self zm_utility::decrement_is_drinking();
			return;
		}
	}
	else
	{
		self zm_weapons::switch_back_primary_weapon();
	}
	self waittill("weapon_change_complete");
	if(!self laststand::player_is_in_laststand() && (!(isdefined(self.intermission) && self.intermission)))
	{
		self zm_utility::decrement_is_drinking();
	}
}

/*
	Name: perk_abort_drinking
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x5BA0
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 1824
*/
function perk_abort_drinking(post_delay)
{
	if(self.IS_DRINKING)
	{
		self notify("perk_abort_drinking");
		self zm_utility::decrement_is_drinking();
		self zm_utility::enable_player_move_states();
		if(isdefined(post_delay))
		{
			wait(post_delay);
		}
	}
}

/*
	Name: give_random_perk
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x5C08
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 1848
*/
function give_random_perk()
{
	random_perk = undefined;
	a_str_perks = getArrayKeys(level._custom_perks);
	PERKS = [];
	for(i = 0; i < a_str_perks.size; i++)
	{
		perk = a_str_perks[i];
		if(isdefined(self.perk_purchased) && self.perk_purchased == perk)
		{
			continue;
		}
		if(!namespace_851dc78f::function_20dc5a15(perk) && !self hasPerk(perk) || (namespace_851dc78f::function_20dc5a15(perk) && !self namespace_851dc78f::function_5f9a13b3(perk)))
		{
			PERKS[PERKS.size] = perk;
		}
	}
	if(PERKS.size > 0)
	{
		PERKS = Array::randomize(PERKS);
		random_perk = PERKS[0];
		self give_perk(random_perk);
	}
	else
	{
		self playsoundtoplayer(level.zmb_laugh_alias, self);
	}
	return random_perk;
}

/*
	Name: lose_random_perk
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x5DA8
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 1888
*/
function lose_random_perk()
{
	a_str_perks = getArrayKeys(level._custom_perks);
	PERKS = [];
	for(i = 0; i < a_str_perks.size; i++)
	{
		perk = a_str_perks[i];
		if(isdefined(self.perk_purchased) && self.perk_purchased == perk)
		{
			continue;
		}
		if(!namespace_851dc78f::function_20dc5a15(perk) && self hasPerk(perk) || (namespace_851dc78f::function_20dc5a15(perk) && self namespace_851dc78f::function_5f9a13b3(perk)) || self has_perk_paused(perk))
		{
			PERKS[PERKS.size] = perk;
		}
	}
	if(PERKS.size > 0)
	{
		PERKS = Array::randomize(PERKS);
		perk = PERKS[0];
		perk_str = perk + "_stop";
		self notify(perk_str);
		if(use_solo_revive() && perk == "specialty_quickrevive")
		{
			if(namespace_11e193f1::function_6dd41714("cheats_uqr") == 1)
			{
				level.solo_lives_given = 0;
			}
			self.lives--;
		}
	}
}

/*
	Name: update_perk_hud
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x5F90
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1931
*/
function update_perk_hud()
{
	if(isdefined(self.perk_hud))
	{
		keys = getArrayKeys(self.perk_hud);
		for(i = 0; i < self.perk_hud.size; i++)
		{
			self.perk_hud[keys[i]].x = i * 30;
		}
	}
}

/*
	Name: quantum_bomb_give_nearest_perk_validation
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x6028
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 1953
*/
function quantum_bomb_give_nearest_perk_validation(position)
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	range_squared = 32400;
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(isdefined(vending_triggers[i]) && isdefined(vending_triggers[i].origin))
		{
			if(DistanceSquared(vending_triggers[i].origin, position) < range_squared)
			{
				return 1;
			}
		}
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: quantum_bomb_give_nearest_perk_result
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x6108
	Size: 0x260
	Parameters: 1
	Flags: None
	Line Number: 1981
*/
function quantum_bomb_give_nearest_perk_result(position)
{
	[[level.quantum_bomb_play_mystery_effect_func]](position);
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	nearest = 0;
	for(i = 1; i < vending_triggers.size; i++)
	{
		if(DistanceSquared(vending_triggers[i].origin, position) < DistanceSquared(vending_triggers[nearest].origin, position))
		{
			nearest = i;
		}
	}
	players = GetPlayers();
	perk = vending_triggers[nearest].script_noteworthy;
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(player.sessionstate == "spectator" || player laststand::player_is_in_laststand())
		{
			continue;
		}
		if(!player hasPerk(perk) && (!isdefined(player.perk_purchased) || player.perk_purchased != perk) && RandomInt(5))
		{
			if(player == self)
			{
				self thread zm_audio::create_and_play_dialog("kill", "quant_good");
			}
			player give_perk(perk);
			player [[level.quantum_bomb_play_player_effect_func]]();
		}
	}
}

/*
	Name: perk_pause
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x6370
	Size: 0x1C0
	Parameters: 1
	Flags: None
	Line Number: 2024
*/
function perk_pause(perk)
{
	if(isdefined(level.dont_unset_perk_when_machine_paused) && level.dont_unset_perk_when_machine_paused)
	{
		return;
	}
	for(j = 0; j < GetPlayers().size; j++)
	{
		player = GetPlayers()[j];
		if(!isdefined(player.disabled_perks))
		{
			player.disabled_perks = [];
		}
		player.disabled_perks[perk] = isdefined(player.disabled_perks[perk]) && player.disabled_perks[perk] || player hasPerk(perk);
		if(player.disabled_perks[perk])
		{
			if(!namespace_851dc78f::function_20dc5a15(perk))
			{
				self unsetPerk(perk);
			}
			player set_perk_clientfield(perk, 2);
			if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].player_thread_take))
			{
				player thread [[level._custom_perks[perk].player_thread_take]](1);
			}
		}
	}
}

/*
	Name: perk_unpause
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x6538
	Size: 0x1B8
	Parameters: 1
	Flags: None
	Line Number: 2063
*/
function perk_unpause(perk)
{
	if(isdefined(level.dont_unset_perk_when_machine_paused) && level.dont_unset_perk_when_machine_paused)
	{
		return;
	}
	if(!isdefined(perk))
	{
		return;
	}
	for(j = 0; j < GetPlayers().size; j++)
	{
		player = GetPlayers()[j];
		if(isdefined(player.disabled_perks) && (isdefined(player.disabled_perks[perk]) && player.disabled_perks[perk]))
		{
			player.disabled_perks[perk] = 0;
			player set_perk_clientfield(perk, 1);
			if(!namespace_851dc78f::function_20dc5a15(perk))
			{
				player setPerk(perk);
			}
			player perk_set_max_health_if_jugg(perk, 0, 0);
			if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].player_thread_give))
			{
				player thread [[level._custom_perks[perk].player_thread_give]]();
			}
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: perk_pause_all_perks
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x66F8
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 2105
*/
function perk_pause_all_perks(power_zone)
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	foreach(trigger in vending_triggers)
	{
		if(!isdefined(power_zone))
		{
			perk_pause(trigger.script_noteworthy);
			continue;
		}
		if(isdefined(trigger.script_int) && trigger.script_int == power_zone)
		{
			perk_pause(trigger.script_noteworthy);
		}
	}
}

/*
	Name: perk_unpause_all_perks
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x6828
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 2132
*/
function perk_unpause_all_perks(power_zone)
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	foreach(trigger in vending_triggers)
	{
		if(!isdefined(power_zone))
		{
			perk_unpause(trigger.script_noteworthy);
			continue;
		}
		if(isdefined(trigger.script_int) && trigger.script_int == power_zone)
		{
			perk_unpause(trigger.script_noteworthy);
		}
	}
}

/*
	Name: has_perk_paused
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x6958
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 2159
*/
function has_perk_paused(perk)
{
	if(isdefined(self.disabled_perks) && isdefined(self.disabled_perks[perk]) && self.disabled_perks[perk])
	{
		return 1;
	}
	return 0;
	~;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: getVendingMachineNotify
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x69A8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 2180
*/
function getVendingMachineNotify()
{
	if(!isdefined(self))
	{
		return "";
	}
	str_perk = undefined;
	if(isdefined(level._custom_perks[self.script_noteworthy]) && isdefined(isdefined(level._custom_perks[self.script_noteworthy].alias)))
	{
		str_perk = level._custom_perks[self.script_noteworthy].alias;
	}
	return str_perk;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: perk_machine_removal
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x6A38
	Size: 0x298
	Parameters: 2
	Flags: None
	Line Number: 2205
*/
function perk_machine_removal(machine, replacement_model)
{
	if(!isdefined(machine))
	{
		return;
	}
	trig = GetEnt(machine, "script_noteworthy");
	machine_model = undefined;
	if(isdefined(trig))
	{
		trig notify("warning_dialog");
		if(isdefined(trig.target))
		{
			parts = GetEntArray(trig.target, "targetname");
			for(i = 0; i < parts.size; i++)
			{
				if(isdefined(parts[i].classname) && parts[i].classname == "script_model")
				{
					machine_model = parts[i];
					continue;
				}
				if(isdefined(parts[i].script_noteworthy && parts[i].script_noteworthy == "clip"))
				{
					model_clip = parts[i];
					continue;
				}
				parts[i] delete();
			}
		}
		else if(isdefined(replacement_model) && isdefined(machine_model))
		{
			machine_model SetModel(replacement_model);
		}
		else if(!isdefined(replacement_model) && isdefined(machine_model))
		{
			machine_model delete();
			if(isdefined(model_clip))
			{
				model_clip delete();
			}
			if(isdefined(trig.clip))
			{
				trig.clip delete();
			}
		}
		if(isdefined(trig.bump))
		{
			trig.bump delete();
		}
		trig delete();
	}
}

/*
	Name: perk_machine_spawn_init
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x6CD8
	Size: 0x9E8
	Parameters: 0
	Flags: None
	Line Number: 2268
*/
function perk_machine_spawn_init()
{
	match_string = "";
	location = level.scr_zm_map_start_location;
	if(location == "default" || location == "" && isdefined(level.default_start_location))
	{
		location = level.default_start_location;
	}
	match_string = level.scr_zm_ui_gametype + "_perks_" + location;
	a_s_spawn_pos = [];
	if(isdefined(level.override_perk_targetname))
	{
		structs = struct::get_array(level.override_perk_targetname, "targetname");
	}
	else
	{
		structs = struct::get_array("zm_perk_machine", "targetname");
	}
	points = GetEntArray("zm_perk_machine", "targetname");
	if(isdefined(points) && points.size > 0)
	{
		structs = ArrayCombine(structs, points, 0, 0);
	}
	foreach(struct in structs)
	{
		if(isdefined(struct.script_string))
		{
			tokens = StrTok(struct.script_string, " ");
			foreach(token in tokens)
			{
				if(token == match_string)
				{
					a_s_spawn_pos[a_s_spawn_pos.size] = struct;
				}
			}
			continue;
		}
		a_s_spawn_pos[a_s_spawn_pos.size] = struct;
	}
	if(a_s_spawn_pos.size == 0)
	{
		return;
	}
	if(isdefined(level.randomize_perk_machine_location) && level.randomize_perk_machine_location)
	{
		a_s_random_perk_locs = struct::get_array("perk_random_machine_location", "targetname");
		if(a_s_random_perk_locs.size > 0)
		{
			a_s_random_perk_locs = Array::randomize(a_s_random_perk_locs);
		}
		n_random_perks_assigned = 0;
	}
	foreach(s_spawn_pos in a_s_spawn_pos)
	{
		perk = s_spawn_pos.script_noteworthy;
		if(isdefined(perk) && isdefined(s_spawn_pos.model))
		{
			if(isdefined(level.randomize_perk_machine_location) && level.randomize_perk_machine_location && a_s_random_perk_locs.size > 0 && isdefined(s_spawn_pos.script_notify))
			{
				s_new_loc = a_s_random_perk_locs[n_random_perks_assigned];
				s_spawn_pos.origin = s_new_loc.origin;
				s_spawn_pos.angles = s_new_loc.angles;
				if(isdefined(s_new_loc.script_int))
				{
					s_spawn_pos.script_int = s_new_loc.script_int;
				}
				if(isdefined(s_new_loc.target))
				{
					s_tell_location = struct::get(s_new_loc.target);
					if(isdefined(s_tell_location))
					{
						util::spawn_model("p7_zm_perk_bottle_broken_" + perk, s_tell_location.origin, s_tell_location.angles);
					}
				}
				n_random_perks_assigned++;
			}
			var_7aef55f1 = s_spawn_pos.origin;
			var_2c81877f = s_spawn_pos.angles;
			if(isdefined(s_spawn_pos.var_7aef55f1))
			{
				var_7aef55f1 = s_spawn_pos.var_7aef55f1;
				var_2c81877f = s_spawn_pos.var_2c81877f;
			}
			t_use = spawn("trigger_radius_use", var_7aef55f1 + VectorScale((0, 0, 1), 30), 0, 40, 130);
			t_use.targetname = "zombie_vending";
			t_use.script_noteworthy = perk;
			if(isdefined(s_spawn_pos.script_int))
			{
				t_use.script_int = s_spawn_pos.script_int;
			}
			t_use TriggerIgnoreTeam();
			perk_machine = spawn("script_model", var_7aef55f1);
			if(!isdefined(var_2c81877f))
			{
				var_2c81877f = (0, 0, 0);
			}
			perk_machine.angles = var_2c81877f;
			perk_machine SetModel(s_spawn_pos.model);
			bump_trigger = undefined;
			if(isdefined(level._no_vending_machine_auto_collision) && level._no_vending_machine_auto_collision && !isdefined(s_spawn_pos.var_72f90ab3))
			{
				collision = undefined;
			}
			else
			{
				collision = spawn("script_model", var_7aef55f1, 1);
				collision.angles = var_2c81877f;
				collision SetModel("zm_collision_perks1");
				collision.script_noteworthy = "clip";
				collision disconnectpaths();
			}
			t_use.clip = collision;
			t_use.machine = perk_machine;
			t_use.bump = bump_trigger;
			if(isdefined(s_spawn_pos.script_notify))
			{
				perk_machine.script_notify = s_spawn_pos.script_notify;
			}
			if(isdefined(s_spawn_pos.target))
			{
				perk_machine.target = s_spawn_pos.target;
			}
			if(isdefined(s_spawn_pos.blocker_model))
			{
				t_use.blocker_model = s_spawn_pos.blocker_model;
			}
			if(isdefined(s_spawn_pos.script_int))
			{
				perk_machine.script_int = s_spawn_pos.script_int;
			}
			if(isdefined(s_spawn_pos.turn_on_notify))
			{
				perk_machine.turn_on_notify = s_spawn_pos.turn_on_notify;
			}
			t_use.script_sound = "mus_perks_speed_jingle";
			t_use.script_string = "speedcola_perk";
			t_use.script_label = "mus_perks_speed_sting";
			t_use.target = "vending_sleight";
			perk_machine.script_string = "speedcola_perk";
			perk_machine.targetname = "vending_sleight";
			if(isdefined(bump_trigger))
			{
				bump_trigger.script_string = "speedcola_perk";
			}
			if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].perk_machine_set_kvps))
			{
				[[level._custom_perks[perk].perk_machine_set_kvps]](t_use, perk_machine, bump_trigger, collision);
			}
			if(isdefined(s_spawn_pos.var_bf2b5a74))
			{
				s_spawn_pos delete();
			}
		}
	}
}

/*
	Name: get_perk_machine_start_state
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x76C8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 2434
*/
function get_perk_machine_start_state(perk)
{
	if(isdefined(level.vending_machines_powered_on_at_start) && level.vending_machines_powered_on_at_start)
	{
		return 1;
	}
	if(perk == "specialty_quickrevive")
	{
		/#
			fallback_initiated::Assert(isdefined(level.revive_machine_is_solo));
		#/
		return level.revive_machine_is_solo;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: perks_register_clientfield
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x7738
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 2461
*/
function perks_register_clientfield()
{
	if(isdefined(level._custom_perks))
	{
		a_keys = getArrayKeys(level._custom_perks);
		for(i = 0; i < a_keys.size; i++)
		{
			if(isdefined(level._custom_perks[a_keys[i]].clientfield_register))
			{
				level [[level._custom_perks[a_keys[i]].clientfield_register]]();
			}
		}
	}
}

/*
	Name: thread_bump_trigger
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x7808
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 2486
*/
function thread_bump_trigger()
{
	for(;;)
	{
		self waittill("trigger", trigPlayer);
		trigPlayer playsound(self.script_sound);
		while(zm_utility::is_player_valid(trigPlayer) && trigPlayer istouching(self))
		{
			wait(0.5);
		}
	}
}

/*
	Name: players_are_in_perk_area
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x7890
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 2509
*/
function players_are_in_perk_area(perk_machine)
{
	perk_area_origin = level.quick_revive_default_origin;
	if(isdefined(perk_machine._linked_ent))
	{
		perk_area_origin = perk_machine._linked_ent.origin;
		if(isdefined(perk_machine._linked_ent_offset))
		{
			perk_area_origin = perk_area_origin + perk_machine._linked_ent_offset;
		}
	}
	in_area = 0;
	players = GetPlayers();
	dist_check = 9216;
	foreach(player in players)
	{
		if(DistanceSquared(player.origin, perk_area_origin) < dist_check)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: perk_hostmigration
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x7A00
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 2543
*/
function perk_hostmigration()
{
	level endon("end_game");
	level notify("perk_hostmigration");
	level endon("perk_hostmigration");
	while(1)
	{
		level waittill("host_migration_end");
		if(isdefined(level._custom_perks) && level._custom_perks.size > 0)
		{
			a_keys = getArrayKeys(level._custom_perks);
			foreach(key in a_keys)
			{
				if(isdefined(level._custom_perks[key].radiant_machine_name) && isdefined(level._custom_perks[key].machine_light_effect))
				{
					level thread host_migration_func(level._custom_perks[key], key);
				}
			}
		}
	}
}

/*
	Name: host_migration_func
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x7B58
	Size: 0x138
	Parameters: 2
	Flags: None
	Line Number: 2575
*/
function host_migration_func(s_custom_perk, keyName)
{
	a_machines = GetEntArray(s_custom_perk.radiant_machine_name, "targetname");
	foreach(perk in a_machines)
	{
		if(isdefined(perk.model) && perk.model == level.machine_assets[keyName].on_model)
		{
			perk perk_fx(undefined, 1);
			perk thread perk_fx(s_custom_perk.machine_light_effect);
		}
	}
}

/*
	Name: spare_change
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x7C98
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 2598
*/
function spare_change(str_trigger, str_sound)
{
	if(!isdefined(str_trigger))
	{
		str_trigger = "audio_bump_trigger";
	}
	if(!isdefined(str_sound))
	{
		str_sound = "zmb_perks_bump_bottle";
	}
	a_t_audio = GetEntArray(str_trigger, "targetname");
	foreach(t_audio_bump in a_t_audio)
	{
		if(t_audio_bump.script_sound === str_sound)
		{
			t_audio_bump thread check_for_change();
		}
	}
}

/*
	Name: check_for_change
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x7DB0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 2628
*/
function check_for_change()
{
	self endon("death");
	while(1)
	{
		self waittill("trigger", player);
		if(player GetStance() == "prone")
		{
			player zm_score::add_to_player_score(100);
			zm_utility::play_sound_at_pos("purchase", player.origin);
			break;
		}
		wait(0.1);
	}
	return;
	~;
}

/*
	Name: get_perk_array
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x7E60
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 2656
*/
function get_perk_array()
{
	perk_array = [];
	if(level._custom_perks.size > 0)
	{
		a_keys = getArrayKeys(level._custom_perks);
		for(i = 0; i < a_keys.size; i++)
		{
			if(self hasPerk(a_keys[i]))
			{
				perk_array[perk_array.size] = a_keys[i];
			}
		}
	}
	return perk_array;
}

/*
	Name: initialize_custom_perk_arrays
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x7F18
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 2683
*/
function initialize_custom_perk_arrays()
{
	if(!isdefined(level._custom_perks))
	{
		level._custom_perks = [];
	}
}

/*
	Name: register_revive_success_perk_func
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x7F40
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 2701
*/
function register_revive_success_perk_func(revive_func)
{
	if(!isdefined(level.a_revive_success_perk_func))
	{
		level.a_revive_success_perk_func = [];
	}
	level.a_revive_success_perk_func[level.a_revive_success_perk_func.size] = revive_func;
	return;
	ERROR: Bad function call
}

/*
	Name: register_perk_basic_info
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x7F88
	Size: 0x1A8
	Parameters: 5
	Flags: None
	Line Number: 2722
*/
function register_perk_basic_info(str_perk, str_alias, n_perk_cost, str_hint_string, w_perk_bottle_weapon)
{
	/#
		fallback_initiated::Assert(isdefined(str_perk), "Dev Block strings are not supported");
	#/
	/#
		fallback_initiated::Assert(isdefined(str_alias), "Dev Block strings are not supported");
	#/
	/#
		fallback_initiated::Assert(isdefined(n_perk_cost), "Dev Block strings are not supported");
	#/
	/#
		fallback_initiated::Assert(isdefined(str_hint_string), "Dev Block strings are not supported");
	#/
	/#
		fallback_initiated::Assert(isdefined(w_perk_bottle_weapon), "Dev Block strings are not supported");
	#/
	_register_undefined_perk(str_perk);
	level._custom_perks[str_perk].alias = str_alias;
	level._custom_perks[str_perk].hash_id = HashString(str_alias);
	level._custom_perks[str_perk].cost = n_perk_cost;
	level._custom_perks[str_perk].hint_string = str_hint_string;
	level._custom_perks[str_perk].perk_bottle_weapon = w_perk_bottle_weapon;
}

/*
	Name: register_perk_machine
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x8138
	Size: 0x100
	Parameters: 3
	Flags: None
	Line Number: 2757
*/
function register_perk_machine(str_perk, func_perk_machine_setup, func_perk_machine_thread)
{
	/#
		fallback_initiated::Assert(isdefined(str_perk), "Dev Block strings are not supported");
	#/
	/#
		fallback_initiated::Assert(isdefined(func_perk_machine_setup), "Dev Block strings are not supported");
	#/
	_register_undefined_perk(str_perk);
	if(!isdefined(level._custom_perks[str_perk].perk_machine_set_kvps))
	{
		level._custom_perks[str_perk].perk_machine_set_kvps = func_perk_machine_setup;
	}
	if(!isdefined(level._custom_perks[str_perk].perk_machine_thread) && isdefined(func_perk_machine_thread))
	{
		level._custom_perks[str_perk].perk_machine_thread = func_perk_machine_thread;
	}
}

/*
	Name: register_perk_machine_power_override
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x8240
	Size: 0xC0
	Parameters: 2
	Flags: None
	Line Number: 2786
*/
function register_perk_machine_power_override(str_perk, func_perk_machine_power_override)
{
	/#
		fallback_initiated::Assert(isdefined(str_perk), "Dev Block strings are not supported");
	#/
	/#
		fallback_initiated::Assert(isdefined(func_perk_machine_power_override), "Dev Block strings are not supported");
	#/
	_register_undefined_perk(str_perk);
	if(!isdefined(level._custom_perks[str_perk].perk_machine_power_override_thread) && isdefined(func_perk_machine_power_override))
	{
		level._custom_perks[str_perk].perk_machine_power_override_thread = func_perk_machine_power_override;
	}
}

/*
	Name: register_perk_precache_func
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x8308
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 2811
*/
function register_perk_precache_func(str_perk, func_precache)
{
	/#
		fallback_initiated::Assert(isdefined(str_perk), "Dev Block strings are not supported");
	#/
	/#
		fallback_initiated::Assert(isdefined(func_precache), "Dev Block strings are not supported");
	#/
	_register_undefined_perk(str_perk);
	if(!isdefined(level._custom_perks[str_perk].precache_func))
	{
		level._custom_perks[str_perk].precache_func = func_precache;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: register_perk_threads
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x83C8
	Size: 0x100
	Parameters: 3
	Flags: None
	Line Number: 2838
*/
function register_perk_threads(str_perk, func_give_player_perk, func_take_player_perk)
{
	/#
		fallback_initiated::Assert(isdefined(str_perk), "Dev Block strings are not supported");
	#/
	/#
		fallback_initiated::Assert(isdefined(func_give_player_perk), "Dev Block strings are not supported");
	#/
	_register_undefined_perk(str_perk);
	if(!isdefined(level._custom_perks[str_perk].player_thread_give))
	{
		level._custom_perks[str_perk].player_thread_give = func_give_player_perk;
	}
	if(isdefined(func_take_player_perk))
	{
		if(!isdefined(level._custom_perks[str_perk].player_thread_take))
		{
			level._custom_perks[str_perk].player_thread_take = func_take_player_perk;
		}
	}
}

/*
	Name: register_perk_clientfields
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x84D0
	Size: 0x120
	Parameters: 3
	Flags: None
	Line Number: 2870
*/
function register_perk_clientfields(str_perk, func_clientfield_register, func_clientfield_set)
{
	/#
		fallback_initiated::Assert(isdefined(str_perk), "Dev Block strings are not supported");
	#/
	/#
		fallback_initiated::Assert(isdefined(func_clientfield_register), "Dev Block strings are not supported");
	#/
	/#
		fallback_initiated::Assert(isdefined(func_clientfield_set), "Dev Block strings are not supported");
	#/
	_register_undefined_perk(str_perk);
	if(!isdefined(level._custom_perks[str_perk].clientfield_register))
	{
		level._custom_perks[str_perk].clientfield_register = func_clientfield_register;
	}
	if(!isdefined(level._custom_perks[str_perk].clientfield_set))
	{
		level._custom_perks[str_perk].clientfield_set = func_clientfield_set;
	}
}

/*
	Name: register_perk_host_migration_params
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x85F8
	Size: 0x120
	Parameters: 3
	Flags: None
	Line Number: 2902
*/
function register_perk_host_migration_params(str_perk, str_radiant_name, str_effect_name)
{
	/#
		fallback_initiated::Assert(isdefined(str_perk), "Dev Block strings are not supported");
	#/
	/#
		fallback_initiated::Assert(isdefined(str_radiant_name), "Dev Block strings are not supported");
	#/
	/#
		fallback_initiated::Assert(isdefined(str_effect_name), "Dev Block strings are not supported");
	#/
	_register_undefined_perk(str_perk);
	if(!isdefined(level._custom_perks[str_perk].radiant_name))
	{
		level._custom_perks[str_perk].radiant_machine_name = str_radiant_name;
	}
	if(!isdefined(level._custom_perks[str_perk].light_effect))
	{
		level._custom_perks[str_perk].machine_light_effect = str_effect_name;
	}
}

/*
	Name: _register_undefined_perk
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x8720
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 2934
*/
function _register_undefined_perk(str_perk)
{
	if(!isdefined(level._custom_perks))
	{
		level._custom_perks = [];
	}
	if(!isdefined(level._custom_perks[str_perk]))
	{
		level._custom_perks[str_perk] = spawnstruct();
	}
}

/*
	Name: register_perk_damage_override_func
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x8788
	Size: 0x6C
	Parameters: 1
	Flags: None
	Line Number: 2956
*/
function register_perk_damage_override_func(func_damage_override)
{
	/#
		fallback_initiated::Assert(isdefined(func_damage_override), "Dev Block strings are not supported");
	#/
	if(!isdefined(level.perk_damage_override))
	{
		level.perk_damage_override = [];
	}
	Array::add(level.perk_damage_override, func_damage_override, 0);
}

