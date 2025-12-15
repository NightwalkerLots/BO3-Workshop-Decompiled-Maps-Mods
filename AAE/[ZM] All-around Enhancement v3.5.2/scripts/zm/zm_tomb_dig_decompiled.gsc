#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\math_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_powerup_zombie_blood;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_tomb_main_quest;
#include scripts\zm\zm_tomb_utility;

#namespace zm_tomb_dig;

/*
	Name: init_shovel
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x7A8
	Size: 0x430
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function init_shovel()
{
	callback::on_connect(&init_shovel_player);
	a_shovel_pos = struct::get_array("shovel_location", "targetname");
	a_shovel_zone = [];
	foreach(s_shovel_pos in a_shovel_pos)
	{
		if(!isdefined(a_shovel_zone[s_shovel_pos.script_noteworthy]))
		{
			a_shovel_zone[s_shovel_pos.script_noteworthy] = [];
		}
		a_shovel_zone[s_shovel_pos.script_noteworthy][a_shovel_zone[s_shovel_pos.script_noteworthy].size] = s_shovel_pos;
	}
	foreach(a_zone in a_shovel_zone)
	{
		s_pos = a_zone[RandomInt(a_zone.size)];
		m_shovel = spawn("script_model", s_pos.origin);
		m_shovel.angles = s_pos.angles;
		m_shovel SetModel("p7_zm_ori_tool_shovel");
		generate_shovel_unitrigger(m_shovel);
	}
	level.get_player_perk_purchase_limit = &get_player_perk_purchase_limit;
	level.bonus_points_powerup_override = &bonus_points_powerup_override;
	level thread dig_powerups_tracking();
	level thread dig_spots_init();
	clientfield::register("world", "player0hasItem", 15000, 2, "int");
	clientfield::register("world", "player1hasItem", 15000, 2, "int");
	clientfield::register("world", "player2hasItem", 15000, 2, "int");
	clientfield::register("world", "player3hasItem", 15000, 2, "int");
	clientfield::register("world", "player0wearableItem", 15000, 1, "int");
	clientfield::register("world", "player1wearableItem", 15000, 1, "int");
	clientfield::register("world", "player2wearableItem", 15000, 1, "int");
	clientfield::register("world", "player3wearableItem", 15000, 1, "int");
}

/*
	Name: init_shovel_player
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0xBE0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 79
*/
function init_shovel_player()
{
	self.dig_vars["has_shovel"] = 0;
	self.dig_vars["has_upgraded_shovel"] = 0;
	self.dig_vars["has_helmet"] = 0;
	self.dig_vars["n_spots_dug"] = 0;
	self.dig_vars["n_losing_streak"] = 0;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: generate_shovel_unitrigger
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0xC58
	Size: 0x178
	Parameters: 1
	Flags: None
	Line Number: 100
*/
function generate_shovel_unitrigger(e_shovel)
{
	s_unitrigger_stub = spawnstruct();
	s_unitrigger_stub.origin = e_shovel.origin + VectorScale((0, 0, 1), 32);
	s_unitrigger_stub.angles = e_shovel.angles;
	s_unitrigger_stub.radius = 32;
	s_unitrigger_stub.script_length = 64;
	s_unitrigger_stub.script_width = 64;
	s_unitrigger_stub.script_height = 64;
	s_unitrigger_stub.cursor_hint = "HINT_NOICON";
	s_unitrigger_stub.hint_string = &"ZM_TOMB_SHPU";
	s_unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	s_unitrigger_stub.require_look_at = 1;
	s_unitrigger_stub.prompt_and_visibility_func = &shovel_trigger_prompt_and_visiblity;
	s_unitrigger_stub.e_shovel = e_shovel;
	zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger_stub, 1);
	zm_unitrigger::register_static_unitrigger(s_unitrigger_stub, &shovel_unitrigger_think);
}

/*
	Name: shovel_trigger_prompt_and_visiblity
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0xDD8
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 129
*/
function shovel_trigger_prompt_and_visiblity(e_player)
{
	can_use = self.stub shovel_prompt_update(e_player);
	self setinvisibletoplayer(e_player, !can_use);
	self setHintString(self.stub.hint_string);
	return can_use;
}

/*
	Name: shovel_prompt_update
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0xE60
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 147
*/
function shovel_prompt_update(e_player)
{
	if(!self unitrigger_stub_show_hint_prompt_valid(e_player))
	{
		return 0;
	}
	self.hint_string = &"ZM_TOMB_SHPU";
	if(isdefined(e_player.dig_vars["has_shovel"]) && e_player.dig_vars["has_shovel"])
	{
		self.hint_string = &"ZM_TOMB_SHAG";
	}
	return 1;
}

/*
	Name: function_6e5f017f
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0xEF0
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 171
*/
function function_6e5f017f(n_player)
{
	return "player" + n_player + "wearableItem";
}

/*
	Name: function_f4768ce9
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0xF18
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 186
*/
function function_f4768ce9(n_player)
{
	return "player" + n_player + "hasItem";
}

/*
	Name: shovel_unitrigger_think
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0xF40
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 201
*/
function shovel_unitrigger_think()
{
	self endon("kill_trigger");
	while(1)
	{
		self waittill("trigger", e_player);
		if(e_player != self.parent_player)
		{
			continue;
		}
		if(!(isdefined(e_player.dig_vars["has_shovel"]) && e_player.dig_vars["has_shovel"]))
		{
			e_player.dig_vars["has_shovel"] = 1;
			e_player playsound("zmb_craftable_pickup");
			e_player dig_reward_dialog("pickup_shovel");
			n_player = e_player GetEntityNumber();
			level clientfield::set(function_f4768ce9(n_player), 1);
			e_player thread dig_disconnect_watch(n_player, self.stub.e_shovel.origin, self.stub.e_shovel.angles);
			self.stub.e_shovel delete();
			zm_unitrigger::unregister_unitrigger(self.stub);
		}
	}
}

/*
	Name: dig_reward_dialog
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x10E8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 235
*/
function dig_reward_dialog(str_category)
{
	if(!(isdefined(self.dig_vo_cooldown) && self.dig_vo_cooldown))
	{
		self zm_utility::do_player_general_vox("digging", str_category);
	}
}

/*
	Name: dig_reward_vo_cooldown
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x1138
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 253
*/
function dig_reward_vo_cooldown()
{
	self endon("disconnect");
	self.dig_vo_cooldown = 1;
	wait(60);
	self.dig_vo_cooldown = undefined;
}

/*
	Name: unitrigger_stub_show_hint_prompt_valid
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x1170
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 271
*/
function unitrigger_stub_show_hint_prompt_valid(e_player)
{
	if(!zombie_utility::is_player_valid(e_player))
	{
		self.hint_string = "";
		return 0;
	}
	return 1;
}

/*
	Name: dig_disconnect_watch
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x11B8
	Size: 0xF8
	Parameters: 3
	Flags: None
	Line Number: 291
*/
function dig_disconnect_watch(n_player, v_origin, v_angles)
{
	self waittill("disconnect");
	level clientfield::set(function_f4768ce9(n_player), 0);
	level clientfield::set(function_6e5f017f(n_player), 0);
	m_shovel = spawn("script_model", v_origin);
	m_shovel.angles = v_angles;
	m_shovel SetModel("p7_zm_ori_tool_shovel");
	generate_shovel_unitrigger(m_shovel);
}

/*
	Name: dig_spots_init
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x12B8
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 312
*/
function dig_spots_init()
{
	while(!level flag::exists("start_zombie_round_logic"))
	{
		wait(0.5);
	}
	level flag::wait_till("start_zombie_round_logic");
	level.n_dig_spots_cur = 0;
	level.n_dig_spots_max = 15;
	level.a_dig_spots = struct::get_array("dig_spot", "targetname");
	foreach(s_dig_spot in level.a_dig_spots)
	{
		if(!isdefined(s_dig_spot.angles))
		{
			s_dig_spot.angles = (0, 0, 0);
		}
		if(isdefined(s_dig_spot.script_noteworthy) && s_dig_spot.script_noteworthy == "initial_spot")
		{
			s_dig_spot thread dig_spot_spawn();
		}
		else
		{
			s_dig_spot.dug = 1;
		}
		s_dig_spot.str_zone = zm_zonemgr::get_zone_from_position(s_dig_spot.origin + VectorScale((0, 0, 1), 32), 1);
		if(!isdefined(s_dig_spot.str_zone))
		{
			s_dig_spot.str_zone = "";
		}
		util::wait_network_frame();
	}
	level thread dig_spots_respawn();
}

/*
	Name: dig_spots_respawn
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x14D8
	Size: 0x3E8
	Parameters: 1
	Flags: None
	Line Number: 356
*/
function dig_spots_respawn(a_dig_spots)
{
	while(1)
	{
		level waittill("end_of_round");
		wait(2);
		a_dig_spots = Array::randomize(level.a_dig_spots);
		n_respawned = 0;
		n_respawned_max = 3;
		if(level.weather_snow > 0)
		{
			n_respawned_max = 0;
		}
		else if(level.weather_rain > 0)
		{
			n_respawned_max = 5;
		}
		if(level.weather_snow == 0)
		{
			n_respawned_max = n_respawned_max + RandomInt(GetPlayers().size);
		}
		for(i = 0; i < a_dig_spots.size; i++)
		{
			if(isdefined(a_dig_spots[i].dug) && a_dig_spots[i].dug && n_respawned < n_respawned_max && level.n_dig_spots_cur <= level.n_dig_spots_max)
			{
				a_dig_spots[i].dug = undefined;
				a_dig_spots[i] thread dig_spot_spawn();
				util::wait_network_frame();
				n_respawned++;
			}
		}
		if(level.weather_snow > 0 && level.ice_staff_pieces.size > 0)
		{
			foreach(s_staff in level.ice_staff_pieces)
			{
				a_staff_spots = [];
				n_active_mounds = 0;
				foreach(s_dig_spot in level.a_dig_spots)
				{
					if(isdefined(s_dig_spot.str_zone) && IsSubStr(s_dig_spot.str_zone, s_staff.zone_substr))
					{
						if(!(isdefined(s_dig_spot.dug) && s_dig_spot.dug))
						{
							n_active_mounds++;
							continue;
						}
						a_staff_spots[a_staff_spots.size] = s_dig_spot;
					}
				}
				if(n_active_mounds < 2 && a_staff_spots.size > 0 && level.n_dig_spots_cur <= level.n_dig_spots_max)
				{
					n_index = RandomInt(a_staff_spots.size);
					a_staff_spots[n_index].dug = undefined;
					a_staff_spots[n_index] thread dig_spot_spawn();
					ArrayRemoveIndex(a_staff_spots, n_index);
					n_active_mounds++;
					util::wait_network_frame();
				}
			}
		}
	}
}

/*
	Name: dig_spot_spawn
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x18C8
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 429
*/
function dig_spot_spawn()
{
	level.n_dig_spots_cur++;
	self.m_dig = spawn("script_model", self.origin + VectorScale((0, 0, -1), 40));
	self.m_dig SetModel("p7_zm_ori_dig_mound");
	self.m_dig.angles = self.angles;
	self.m_dig moveto(self.origin, 3, 0, 1);
	self.m_dig waittill("movedone");
	t_dig = zm_tomb_utility::tomb_spawn_trigger_radius(self.origin + VectorScale((0, 0, 1), 20), 100, 1);
	t_dig.prompt_and_visibility_func = &dig_spot_trigger_visibility;
	t_dig.require_look_at = 1;
	t_dig waittill_dug(self);
	zm_unitrigger::unregister_unitrigger(t_dig);
	t_dig = undefined;
	self.m_dig delete();
	self.m_dig = undefined;
}

/*
	Name: dig_spot_trigger_visibility
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x1A48
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 457
*/
function dig_spot_trigger_visibility(player)
{
	if(isdefined(player.dig_vars["has_shovel"]) && player.dig_vars["has_shovel"])
	{
		self setHintString(&"ZM_TOMB_X2D");
	}
	else
	{
		self setHintString(&"ZM_TOMB_NS");
	}
	return 1;
}

/*
	Name: waittill_dug
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x1AD0
	Size: 0x4E8
	Parameters: 1
	Flags: None
	Line Number: 480
*/
function waittill_dug(s_dig_spot)
{
	while(1)
	{
		self waittill("trigger", player);
		if(isdefined(player.dig_vars["has_shovel"]) && player.dig_vars["has_shovel"])
		{
			player playsound("evt_dig");
			s_dig_spot.dug = 1;
			level.n_dig_spots_cur--;
			playFX(level._effect["digging"], self.origin);
			player clientfield::set_to_player("player_rumble_and_shake", 1);
			s_staff_piece = s_dig_spot zm_tomb_main_quest::dig_spot_get_staff_piece(player);
			if(isdefined(s_staff_piece))
			{
				s_staff_piece zm_tomb_main_quest::show_ice_staff_piece(self.origin);
				player dig_reward_dialog("dig_staff_part");
			}
			else
			{
				n_good_chance = 50;
				if(player.dig_vars["n_spots_dug"] == 0 || player.dig_vars["n_losing_streak"] == 3)
				{
					player.dig_vars["n_losing_streak"] = 0;
					n_good_chance = 100;
				}
				if(player.dig_vars["has_upgraded_shovel"])
				{
					if(!player.dig_vars["has_helmet"])
					{
						n_helmet_roll = RandomInt(100);
						if(n_helmet_roll >= 95)
						{
							player.dig_vars["has_helmet"] = 1;
							level clientfield::set(function_6e5f017f(player GetEntityNumber()), 1);
							player playsoundtoplayer("zmb_squest_golden_anything", player);
							player thread function_85eef9f2();
							return;
						}
					}
					n_good_chance = 70;
				}
				n_prize_roll = RandomInt(100);
				if(n_prize_roll > n_good_chance)
				{
					if(math::cointoss())
					{
						player dig_reward_dialog("dig_grenade");
						self thread dig_up_grenade(player);
					}
					else
					{
						player dig_reward_dialog("dig_zombie");
						self thread dig_up_zombie(player, s_dig_spot);
					}
					player.dig_vars["n_losing_streak"]++;
				}
				else if(math::cointoss())
				{
					self thread dig_up_powerup(player);
				}
				else
				{
					player dig_reward_dialog("dig_gun");
					self thread dig_up_weapon(player);
				}
			}
			if(!player.dig_vars["has_upgraded_shovel"])
			{
				player.dig_vars["n_spots_dug"]++;
				if(player.dig_vars["n_spots_dug"] >= 30)
				{
					player.dig_vars["has_upgraded_shovel"] = 1;
					player thread ee_zombie_blood_dig();
					level clientfield::set(function_f4768ce9(player GetEntityNumber()), 2);
					player playsoundtoplayer("zmb_squest_golden_anything", player);
					return;
				}
			}
		}
	}
	return;
}

/*
	Name: dig_up_zombie
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x1FC0
	Size: 0x1D8
	Parameters: 2
	Flags: None
	Line Number: 574
*/
function dig_up_zombie(player, s_dig_spot)
{
	ai_zombie = zombie_utility::spawn_zombie(level.dig_spawners[0]);
	ai_zombie endon("death");
	ai_zombie ghost();
	e_linker = spawn("script_origin", (0, 0, 0));
	e_linker.origin = ai_zombie.origin;
	e_linker.angles = ai_zombie.angles;
	ai_zombie LinkTo(e_linker);
	e_linker moveto(player.origin + VectorScale((1, 1, 0), 100), 0.1);
	e_linker waittill("movedone");
	ai_zombie Unlink();
	e_linker delete();
	ai_zombie show();
	ai_zombie playsound("evt_zombie_dig_dirt");
	ai_zombie zm_tomb_utility::dug_zombie_rise(s_dig_spot);
	find_flesh_struct_string = "find_flesh";
	ai_zombie notify("zombie_custom_think_done", find_flesh_struct_string);
}

/*
	Name: dig_up_powerup
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x21A0
	Size: 0x280
	Parameters: 1
	Flags: None
	Line Number: 604
*/
function dig_up_powerup(player)
{
	powerup = spawn("script_model", self.origin);
	powerup endon("powerup_grabbed");
	powerup endon("powerup_timedout");
	a_rare_powerups = dig_get_rare_powerups(player);
	powerup_item = undefined;
	if(level.dig_n_powerups_spawned + level.powerup_drop_count > 4 || level.dig_last_prize_rare || a_rare_powerups.size == 0 || RandomInt(100) < 80)
	{
		if(level.dig_n_zombie_bloods_spawned < 1 && RandomInt(100) > 70)
		{
			powerup_item = "zombie_blood";
			level.dig_n_zombie_bloods_spawned++;
			level.dig_n_powerups_spawned++;
			player dig_reward_dialog("dig_powerup");
		}
		else
		{
			powerup_item = "bonus_points_player";
			player dig_reward_dialog("dig_cash");
		}
		level.dig_last_prize_rare = 0;
	}
	else
	{
		powerup_item = a_rare_powerups[RandomInt(a_rare_powerups.size)];
		level.dig_last_prize_rare = 1;
		level.dig_n_powerups_spawned++;
		player dig_reward_dialog("dig_powerup");
		dig_set_powerup_spawned(powerup_item);
	}
	powerup zm_powerups::powerup_setup(powerup_item);
	powerup MoveZ(40, 0.6);
	powerup waittill("movedone");
	powerup thread zm_powerups::powerup_timeout();
	powerup thread zm_powerups::powerup_wobble();
	powerup thread zm_powerups::powerup_grab();
}

/*
	Name: dig_get_rare_powerups
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x2428
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 653
*/
function dig_get_rare_powerups(player)
{
	a_rare_powerups = [];
	a_possible_powerups = Array("nuke", "double_points");
	if(level.dig_magic_box_moved && !dig_has_powerup_spawned("fire_sale"))
	{
		if(!isdefined(a_possible_powerups))
		{
			a_possible_powerups = [];
		}
		else if(!IsArray(a_possible_powerups))
		{
			a_possible_powerups = Array(a_possible_powerups);
		}
		a_possible_powerups[a_possible_powerups.size] = "fire_sale";
	}
	if(player.dig_vars["has_upgraded_shovel"])
	{
		a_possible_powerups = ArrayCombine(a_possible_powerups, Array("insta_kill", "full_ammo"), 0, 0);
	}
	foreach(powerup in a_possible_powerups)
	{
		if(!dig_has_powerup_spawned(powerup))
		{
			if(!isdefined(a_rare_powerups))
			{
				a_rare_powerups = [];
			}
			else if(!IsArray(a_rare_powerups))
			{
				a_rare_powerups = Array(a_rare_powerups);
			}
			a_rare_powerups[a_rare_powerups.size] = powerup;
		}
	}
	return a_rare_powerups;
}

/*
	Name: dig_up_grenade
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x2638
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 701
*/
function dig_up_grenade(player)
{
	player endon("disconnect");
	v_spawnpt = self.origin;
	w_grenade = GetWeapon("frag_grenade");
	n_rand = randomIntRange(0, 4);
	player MagicGrenadeType(w_grenade, v_spawnpt, VectorScale((0, 0, 1), 300), 3);
	player playsound("evt_grenade_digup");
	if(n_rand)
	{
		wait(0.3);
		if(math::cointoss())
		{
			player MagicGrenadeType(w_grenade, v_spawnpt, (50, 50, 300), 3);
			return;
		}
	}
}

/*
	Name: dig_up_weapon
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x2758
	Size: 0x4D8
	Parameters: 1
	Flags: None
	Line Number: 730
*/
function dig_up_weapon(digger)
{
	var_43f586fe = Array(GetWeapon("pistol_c96"), GetWeapon("ar_marksman"), GetWeapon("shotgun_pump"));
	var_63eba41d = Array(GetWeapon("sniper_fastsemi"), GetWeapon("shotgun_fullauto"));
	if(digger.dig_vars["has_upgraded_shovel"])
	{
		var_63eba41d = ArrayCombine(var_63eba41d, Array(GetWeapon("bouncingbetty"), GetWeapon("ar_stg44"), GetWeapon("smg_standard"), GetWeapon("smg_mp40_1940"), GetWeapon("shotgun_precision")), 0, 0);
	}
	var_59d5868d = undefined;
	if(RandomInt(100) < 90)
	{
		var_59d5868d = var_43f586fe[getArrayKeys(var_43f586fe)[RandomInt(getArrayKeys(var_43f586fe).size)]];
	}
	else
	{
		var_59d5868d = var_63eba41d[getArrayKeys(var_63eba41d)[RandomInt(getArrayKeys(var_63eba41d).size)]];
	}
	v_spawnpt = self.origin + VectorScale((0, 0, 1), 40);
	v_spawnang = (0, 0, 0);
	v_angles = digger getPlayerAngles();
	v_angles = (0, v_angles[1], 0) + VectorScale((0, 1, 0), 90) + v_spawnang;
	m_weapon = zm_utility::spawn_buildkit_weapon_model(digger, var_59d5868d, undefined, v_spawnpt, v_angles);
	m_weapon.angles = v_angles;
	m_weapon PlayLoopSound("evt_weapon_digup");
	m_weapon thread timer_til_despawn(v_spawnpt, -40);
	m_weapon endon("dig_up_weapon_timed_out");
	PlayFXOnTag(level._effect["powerup_on_solo"], m_weapon, "tag_origin");
	m_weapon.trigger = zm_tomb_utility::tomb_spawn_trigger_radius(v_spawnpt, 100, 1, undefined, &function_3674f451);
	m_weapon.trigger.cursor_hint = "HINT_WEAPON";
	m_weapon.trigger.cursor_hint_weapon = var_59d5868d;
	m_weapon.trigger waittill("trigger", player);
	m_weapon.trigger notify("weapon_grabbed");
	m_weapon.trigger thread swap_weapon(var_59d5868d, player);
	if(isdefined(m_weapon.trigger))
	{
		zm_unitrigger::unregister_unitrigger(m_weapon.trigger);
		m_weapon.trigger = undefined;
	}
	if(isdefined(m_weapon))
	{
		m_weapon delete();
	}
	if(player != digger)
	{
		digger notify("dig_up_weapon_shared");
	}
}

/*
	Name: function_3674f451
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x2C38
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 788
*/
function function_3674f451(player)
{
	if(!zm_utility::is_player_valid(player) || player.IS_DRINKING > 0 || !player zm_magicbox::can_buy_weapon() || player bgb::is_enabled("zm_bgb_disorderly_combat"))
	{
		self setcursorhint("HINT_NOICON");
		return 0;
	}
	self setcursorhint("HINT_WEAPON", self.stub.cursor_hint_weapon);
	return 1;
}

/*
	Name: swap_weapon
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x2D08
	Size: 0x228
	Parameters: 2
	Flags: None
	Line Number: 809
*/
function swap_weapon(var_375664a9, e_player)
{
	var_1bcd223d = e_player GetCurrentWeapon();
	if(!zombie_utility::is_player_valid(e_player) || (isdefined(e_player.IS_DRINKING) && e_player.IS_DRINKING) || zm_utility::is_placeable_mine(var_1bcd223d) || zm_equipment::is_equipment(var_1bcd223d) || var_1bcd223d == GetWeapon("none") || e_player zm_equipment::hacker_active())
	{
		return;
	}
	if(isdefined(level.revive_tool) && level.revive_tool == var_1bcd223d)
	{
		return;
	}
	var_6c6831af = e_player GetWeaponsList(1);
	foreach(weapon in var_6c6831af)
	{
		w_base = zm_weapons::get_base_weapon(weapon);
		w_upgraded = zm_weapons::get_upgrade_weapon(weapon);
		if(var_375664a9 === w_base || var_375664a9 === w_upgraded)
		{
			e_player giveMaxAmmo(weapon);
			return;
		}
	}
	e_player zm_weapons::weapon_give(var_375664a9);
}

/*
	Name: timer_til_despawn
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x2F38
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 844
*/
function timer_til_despawn(v_float, n_dist)
{
	self endon("weapon_grabbed");
	putBackTime = 12;
	self MoveZ(n_dist, putBackTime, putBackTime * 0.5);
	self waittill("movedone");
	self notify("dig_up_weapon_timed_out");
	if(isdefined(self.trigger))
	{
		zm_unitrigger::unregister_unitrigger(self.trigger);
		self.trigger = undefined;
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: get_player_perk_purchase_limit
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x3008
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 872
*/
function get_player_perk_purchase_limit()
{
	if(isdefined(self.player_perk_purchase_limit))
	{
		return self.player_perk_purchase_limit;
	}
	return level.perk_purchase_limit;
}

/*
	Name: increment_player_perk_purchase_limit
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x3030
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 891
*/
function increment_player_perk_purchase_limit()
{
	if(!isdefined(self.player_perk_purchase_limit))
	{
		self.player_perk_purchase_limit = level.perk_purchase_limit;
	}
	if(self.player_perk_purchase_limit < 8)
	{
		self.player_perk_purchase_limit++;
	}
}

/*
	Name: ee_zombie_blood_dig
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x3070
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 913
*/
function ee_zombie_blood_dig()
{
	self endon("disconnect");
	n_z_spots_found = 0;
	a_z_spots = struct::get_array("zombie_blood_dig_spot", "targetname");
	self.t_zombie_blood_dig = spawn("trigger_radius_use", (0, 0, 0), 0, 100, 50);
	self.t_zombie_blood_dig.e_unique_player = self;
	self.t_zombie_blood_dig TriggerIgnoreTeam();
	self.t_zombie_blood_dig setcursorhint("HINT_NOICON");
	self.t_zombie_blood_dig setHintString(&"ZM_TOMB_X2D");
	self.t_zombie_blood_dig namespace_43a18dd5::make_zombie_blood_entity();
	while(n_z_spots_found < 4)
	{
		a_randomized = Array::randomize(a_z_spots);
		n_index = undefined;
		for(i = 0; i < a_randomized.size; i++)
		{
			if(!isdefined(a_randomized[i].n_player))
			{
				n_index = i;
				break;
			}
		}
		s_z_spot = a_randomized[n_index];
		s_z_spot.n_player = self GetEntityNumber();
		s_z_spot create_zombie_blood_dig_spot(self);
		n_z_spots_found++;
		level waittill("end_of_round");
	}
	self.t_zombie_blood_dig delete();
}

/*
	Name: ee_zombie_blood_dig_disconnect_watch
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x3290
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 955
*/
function ee_zombie_blood_dig_disconnect_watch()
{
	self waittill("disconnect");
	if(isdefined(self.t_zombie_blood_dig))
	{
		self.t_zombie_blood_dig delete();
	}
	a_z_spots = struct::get_array("zombie_blood_dig_spot", "targetname");
	foreach(s_pos in a_z_spots)
	{
		if(isdefined(s_pos.n_player) && s_pos.n_player == self GetEntityNumber())
		{
			s_pos.n_player = undefined;
		}
		if(isdefined(s_pos.m_dig))
		{
			s_pos delete();
		}
	}
}

/*
	Name: create_zombie_blood_dig_spot
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x33D8
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 986
*/
function create_zombie_blood_dig_spot(e_player)
{
	self.m_dig = spawn("script_model", self.origin + VectorScale((0, 0, -1), 40));
	self.m_dig.angles = self.angles;
	self.m_dig SetModel("p7_zm_ori_dig_mound_blood");
	self.m_dig namespace_43a18dd5::make_zombie_blood_entity();
	self.m_dig moveto(self.origin, 3, 0, 1);
	self.m_dig waittill("movedone");
	self.m_dig.e_unique_player = e_player;
	e_player.t_zombie_blood_dig.origin = self.origin + VectorScale((0, 0, 1), 20);
	e_player.t_zombie_blood_dig waittill_zombie_blood_dug(self);
}

/*
	Name: waittill_zombie_blood_dug
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x3510
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 1009
*/
function waittill_zombie_blood_dug(s_dig_spot)
{
	self endon("death");
	while(1)
	{
		self waittill("trigger", player);
		if(isdefined(player.dig_vars["has_shovel"]) && player.dig_vars["has_shovel"])
		{
			player.t_zombie_blood_dig.origin = (0, 0, 0);
			player playsound("evt_dig");
			playFX(level._effect["digging"], self.origin);
			s_dig_spot.m_dig delete();
			spawn_perk_upgrade_bottle(s_dig_spot.origin, player);
			return;
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: spawn_perk_upgrade_bottle
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x3638
	Size: 0x218
	Parameters: 2
	Flags: None
	Line Number: 1039
*/
function spawn_perk_upgrade_bottle(v_origin, e_player)
{
	m_bottle = spawn("script_model", v_origin + VectorScale((0, 0, 1), 40));
	m_bottle SetModel("zombie_pickup_perk_bottle");
	m_bottle.angles = VectorScale((1, 0, 0), 10);
	m_bottle SetInvisibleToAll();
	m_bottle setvisibletoplayer(e_player);
	m_fx = spawn("script_model", m_bottle.origin);
	m_fx SetModel("tag_origin");
	m_fx SetInvisibleToAll();
	m_fx setvisibletoplayer(e_player);
	PlayFXOnTag(level._effect["special_glow"], m_fx, "tag_origin");
	m_bottle LinkTo(m_fx);
	m_fx thread rotate_perk_upgrade_bottle();
	while(isdefined(e_player) && !e_player istouching(m_bottle))
	{
		wait(0.05);
	}
	m_bottle delete();
	m_fx delete();
	if(isdefined(e_player))
	{
		e_player increment_player_perk_purchase_limit();
	}
}

/*
	Name: rotate_perk_upgrade_bottle
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x3858
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1075
*/
function rotate_perk_upgrade_bottle()
{
	self endon("death");
	while(1)
	{
		self RotateYaw(360, 5);
		self waittill("rotatedone");
	}
}

/*
	Name: bonus_points_powerup_override
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x38A8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 1095
*/
function bonus_points_powerup_override()
{
	points = randomIntRange(1, 6) * 50;
	return points;
}

/*
	Name: dig_powerups_tracking
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x38E8
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 1111
*/
function dig_powerups_tracking()
{
	level endon("end_game");
	level.dig_powerups_tracking = [];
	level.dig_magic_box_moved = 0;
	level.dig_last_prize_rare = 0;
	level.dig_n_zombie_bloods_spawned = 0;
	level.dig_n_powerups_spawned = 0;
	while(1)
	{
		level waittill("end_of_round");
		foreach(value in level.dig_powerups_tracking)
		{
			level.dig_powerups_tracking[str_powerup] = 0;
		}
		level.dig_n_zombie_bloods_spawned = 0;
		level.dig_n_powerups_spawned = 0;
	}
}

/*
	Name: dig_has_powerup_spawned
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x39E8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1141
*/
function dig_has_powerup_spawned(str_powerup)
{
	if(!isdefined(level.dig_powerups_tracking[str_powerup]))
	{
		level.dig_powerups_tracking[str_powerup] = 0;
	}
	return level.dig_powerups_tracking[str_powerup];
}

/*
	Name: dig_set_powerup_spawned
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x3A30
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 1160
*/
function dig_set_powerup_spawned(str_powerup)
{
	level.dig_powerups_tracking[str_powerup] = 1;
	return;
	ERROR: Bad function call
}

/*
	Name: function_85eef9f2
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x3A58
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1177
*/
function function_85eef9f2()
{
	if(!isdefined(self.var_8e065802))
	{
		self.var_8e065802 = spawnstruct();
	}
	self.var_8e065802.model = "c_t7_zm_dlchd_origins_golden_helmet";
	self.var_8e065802.tag = "j_head";
	self.var_ae07e72c = "golden_helmet";
	self Attach(self.var_8e065802.model, self.var_8e065802.tag);
	if(self.characterindex == 1)
	{
		self setcharacterbodystyle(2);
	}
}

/*
	Name: setup_dig_devgui
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x3B30
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1203
*/
function setup_dig_devgui()
{
	level.a_dig_spots = struct::get_array("dig_spot", "targetname");
	level.dig_spawners = GetEntArray("zombie_spawner_dig", "script_noteworthy");
}

/*
	Name: watch_devgui_dig
	Namespace: zm_tomb_dig
	Checksum: 0x424F4353
	Offset: 0x3B90
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 1219
*/
function watch_devgui_dig()
{
}

