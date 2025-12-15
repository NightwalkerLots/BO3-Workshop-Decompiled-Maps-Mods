#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zm_genesis_util;

#namespace namespace_ed811526;

/*
	Name: init_clientfields
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0xE08
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function init_clientfields()
{
	clientfield::register("clientuimodel", "trialWidget.visible", 15000, 1, "int");
	clientfield::register("clientuimodel", "trialWidget.progress", 15000, 7, "float");
	clientfield::register("clientuimodel", "trialWidget.icon", 15000, 2, "int");
	clientfield::register("toplayer", "challenge1state", 15000, 2, "int");
	clientfield::register("toplayer", "challenge2state", 15000, 2, "int");
	clientfield::register("toplayer", "challenge3state", 15000, 2, "int");
	clientfield::register("toplayer", "challenge_board_eyes", 15000, 1, "int");
	clientfield::register("scriptmover", "challenge_board_base", 15000, 1, "int");
	clientfield::register("scriptmover", "challenge_board_reward", 15000, 1, "int");
}

/*
	Name: main
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0xFC8
	Size: 0x9F0
	Parameters: 0
	Flags: None
	Line Number: 65
*/
function main()
{
	level flag::init("all_challenges_completed");
	level flag::init("flag_init_player_challenges");
	if(GetDvarInt("com_maxclients") <= 4)
	{
		if(GetDvarInt("splitscreen"))
		{
			Array::run_all(GetEntArray("t_lookat_challenge_1", "targetname"), &delete);
			Array::run_all(GetEntArray("t_lookat_challenge_2", "targetname"), &delete);
			Array::run_all(GetEntArray("t_lookat_challenge_3", "targetname"), &delete);
			Array::thread_all(struct::get_array("s_challenge_trigger"), &struct::delete);
		}
		else
		{
			callback::on_spawned(&on_player_spawned);
			level.var_ff453c39 = spawnstruct();
			level.var_ff453c39.var_c17bb43c = [];
			level.var_ff453c39.var_33832377 = [];
			level.var_ff453c39.var_d80a90e = [];
			Array::add(level.var_ff453c39.var_c17bb43c, function_970609e0(1, &"ZM_GENESIS_CHALLENGE_1_1", 10, "update_challenge_1_1", &function_1ce88534));
			Array::add(level.var_ff453c39.var_c17bb43c, function_970609e0(1, &"ZM_GENESIS_CHALLENGE_1_2", 15, "update_challenge_1_2", &function_8eeff46f));
			Array::add(level.var_ff453c39.var_c17bb43c, function_970609e0(1, &"ZM_GENESIS_CHALLENGE_1_5", 10, "update_challenge_1_5", &function_84de9b90));
			Array::add(level.var_ff453c39.var_c17bb43c, function_970609e0(1, &"ZM_GENESIS_CHALLENGE_1_8", 1, "update_challenge_1_8", &function_72fed2e5));
			Array::add(level.var_ff453c39.var_c17bb43c, function_970609e0(1, &"ZM_GENESIS_CHALLENGE_1_10", 1, "update_challenge_1_10", &function_9592bd2c));
			Array::add(level.var_ff453c39.var_c17bb43c, function_970609e0(1, &"ZM_GENESIS_CHALLENGE_3_6", 1, "update_challenge_3_6", &function_896db2ad));
			Array::add(level.var_ff453c39.var_33832377, function_970609e0(2, &"ZM_GENESIS_CHALLENGE_2_2", 10, "update_challenge_2_2", &function_e4aef098));
			Array::add(level.var_ff453c39.var_33832377, function_970609e0(2, &"ZM_GENESIS_CHALLENGE_2_7", 1, "update_challenge_2_7", &function_a2bb54a5));
			Array::add(level.var_ff453c39.var_33832377, function_970609e0(2, &"ZM_GENESIS_CHALLENGE_2_8", 15, "update_challenge_2_8", &function_a01222));
			Array::add(level.var_ff453c39.var_33832377, function_970609e0(2, &"ZM_GENESIS_CHALLENGE_1_9", 10, "update_challenge_1_9", &function_4cfc587c));
			Array::add(level.var_ff453c39.var_33832377, function_970609e0(2, &"ZM_GENESIS_CHALLENGE_2_10", 10, "update_challenge_2_10", &function_748fccd9));
			Array::add(level.var_ff453c39.var_33832377, function_970609e0(2, &"ZM_GENESIS_CHALLENGE_2_11", 1, "update_challenge_2_11", &function_4e8d5270));
			Array::add(level.var_ff453c39.var_d80a90e, function_970609e0(3, &"ZM_GENESIS_CHALLENGE_3_1", 5, "update_challenge_3_1", &function_17664372));
			Array::add(level.var_ff453c39.var_d80a90e, function_970609e0(3, &"ZM_GENESIS_CHALLENGE_3_2", 1, "update_challenge_3_2", &function_f163c909));
			Array::add(level.var_ff453c39.var_d80a90e, function_970609e0(3, &"ZM_GENESIS_CHALLENGE_3_3", 1, "update_challenge_3_3", &function_cb614ea0));
			Array::add(level.var_ff453c39.var_d80a90e, function_970609e0(3, &"ZM_GENESIS_CHALLENGE_3_4", 1, "update_challenge_3_4", &function_d572a77f));
			Array::add(level.var_ff453c39.var_d80a90e, function_970609e0(3, &"ZM_GENESIS_CHALLENGE_3_9", 3, "update_challenge_3_9", &function_477a16ba));
			Array::add(level.var_ff453c39.var_d80a90e, function_970609e0(3, &"ZM_GENESIS_CHALLENGE_2_9", 1, "update_challenge_2_9", &function_26a28c8b));
			zm_spawner::register_zombie_death_event_callback(&function_905d9544);
			zm_spawner::register_zombie_damage_callback(&function_6267dc);
			level._margwa_damage_cb = &function_ca31caac;
			level thread function_89d8e005();
			level flag::set("flag_init_player_challenges");
			/#
				if(GetDvarInt("Dev Block strings are not supported") > 0)
				{
					function_b9b4ce34();
				}
			#/
		}
	}
	else
	{
		Array::run_all(GetEntArray("t_lookat_challenge_1", "targetname"), &delete);
		Array::run_all(GetEntArray("t_lookat_challenge_2", "targetname"), &delete);
		Array::run_all(GetEntArray("t_lookat_challenge_3", "targetname"), &delete);
		Array::thread_all(struct::get_array("s_challenge_trigger"), &struct::delete);
	}
}

/*
	Name: function_970609e0
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x19C0
	Size: 0xB0
	Parameters: 5
	Flags: None
	Line Number: 135
*/
function function_970609e0(n_challenge_index, var_3e1001b, n_challenge_count, str_challenge_notify, var_d675d6d8)
{
	s_challenge = spawnstruct();
	s_challenge.n_index = n_challenge_index;
	s_challenge.str_info = var_3e1001b;
	s_challenge.n_count = n_challenge_count;
	s_challenge.str_notify = str_challenge_notify;
	s_challenge.var_c0e6cb4e = var_d675d6d8;
	return s_challenge;
}

/*
	Name: on_player_connect
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x1A78
	Size: 0x2B8
	Parameters: 0
	Flags: None
	Line Number: 156
*/
function on_player_connect()
{
	level flag::wait_till("flag_init_player_challenges");
	self flag::init("flag_player_collected_reward_1");
	self flag::init("flag_player_collected_reward_2");
	self flag::init("flag_player_collected_reward_3");
	self flag::init("flag_player_completed_challenge_1");
	self flag::init("flag_player_completed_challenge_2");
	self flag::init("flag_player_completed_challenge_3");
	self flag::init("flag_player_initialized_reward");
	if(GetDvarInt("com_maxclients") <= 4)
	{
		self.var_ff453c39 = spawnstruct();
		self.var_ff453c39.var_c17bb43c = [];
		self.var_ff453c39.var_33832377 = [];
		self.var_ff453c39.var_d80a90e = [];
		self.var_ff453c39.var_c17bb43c = Array::random(level.var_ff453c39.var_c17bb43c);
		self.var_ff453c39.var_33832377 = Array::random(level.var_ff453c39.var_33832377);
		self.var_ff453c39.var_d80a90e = Array::random(level.var_ff453c39.var_d80a90e);
		ArrayRemoveValue(level.var_ff453c39.var_c17bb43c, self.var_ff453c39.var_c17bb43c);
		ArrayRemoveValue(level.var_ff453c39.var_33832377, self.var_ff453c39.var_33832377);
		ArrayRemoveValue(level.var_ff453c39.var_d80a90e, self.var_ff453c39.var_d80a90e);
		self thread function_b7156b15();
	}
}

/*
	Name: on_player_disconnect
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x1D38
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 192
*/
function on_player_disconnect()
{
	level flag::wait_till("flag_init_player_challenges");
	if(GetDvarInt("com_maxclients") <= 4)
	{
		var_a879fa43 = self GetEntityNumber();
		Array::add(level.var_ff453c39.var_c17bb43c, self.var_ff453c39.var_c17bb43c);
		Array::add(level.var_ff453c39.var_33832377, self.var_ff453c39.var_33832377);
		Array::add(level.var_ff453c39.var_d80a90e, self.var_ff453c39.var_d80a90e);
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x1E40
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 214
*/
function on_player_spawned()
{
	if(GetDvarInt("com_maxclients") <= 4)
	{
		self.var_b5c08e44 = [];
		self thread function_a235a040();
		self thread function_188466cb();
	}
}

/*
	Name: function_188466cb
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x1EA8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 234
*/
function function_188466cb()
{
	self endon("death");
	level flag::wait_till_all(Array("start_zombie_round_logic", "challenge_boards_ready"));
	var_a879fa43 = self GetEntityNumber();
	self clientfield::set_to_player("challenge_board_eyes", 1);
}

/*
	Name: function_a235a040
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x1F40
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 252
*/
function function_a235a040()
{
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self function_2983de0c();
		level waittill("end_of_round");
	}
}

/*
	Name: function_2983de0c
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x1F90
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 273
*/
function function_2983de0c()
{
	self.var_b5c08e44["prison_island"] = 0;
	self.var_b5c08e44["asylum_island"] = 0;
	self.var_b5c08e44["temple_island"] = 0;
	self.var_b5c08e44["prototype_island"] = 0;
	self.var_b5c08e44["start_island"] = 0;
}

/*
	Name: function_e8547a5b
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x2008
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 292
*/
function function_e8547a5b(str_challenge)
{
	if(self.var_f121cc22 !== str_challenge)
	{
		self.var_f121cc22 = str_challenge;
		self LUINotifyEvent(&"trial_set_description", 1, self.var_f121cc22);
		return;
	}
}

/*
	Name: function_27f6c3cd
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x2068
	Size: 0xE8
	Parameters: 2
	Flags: None
	Line Number: 312
*/
function function_27f6c3cd(player, n_challenge_index)
{
	switch(n_challenge_index)
	{
		case 1:
		{
			player function_e8547a5b(player.var_ff453c39.var_c17bb43c.str_info);
			break;
		}
		case 2:
		{
			player function_e8547a5b(player.var_ff453c39.var_33832377.str_info);
			break;
		}
		case 3:
		{
			player function_e8547a5b(player.var_ff453c39.var_d80a90e.str_info);
			break;
		}
	}
}

/*
	Name: function_33e91747
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x2158
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 344
*/
function function_33e91747(n_challenge_index, var_fe2fb4b9)
{
	self clientfield::set_to_player("challenge" + n_challenge_index + "state", var_fe2fb4b9);
}

/*
	Name: function_23c9ffd3
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x21A8
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 359
*/
function function_23c9ffd3(trigger)
{
	self notify("hash_23c9ffd3");
	self endon("hash_23c9ffd3");
	while(1)
	{
		wait(0.5);
		if(!isdefined(self))
		{
			break;
		}
		if(!isdefined(trigger) || Distance(self.origin, trigger.stub.origin) > trigger.stub.radius)
		{
			self clientfield::set_player_uimodel("trialWidget.visible", 0);
			break;
		}
	}
}

/*
	Name: function_343b3db7
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x2270
	Size: 0x2B0
	Parameters: 0
	Flags: None
	Line Number: 388
*/
function function_343b3db7()
{
	level flag::init("challenge_boards_ready");
	if(GetDvarInt("com_maxclients") <= 4)
	{
		level.var_92fc3c34 = [];
		for(x = 0; x < 4; x++)
		{
			str_name = "challenge_board_" + x;
			mdl_board = GetEnt(str_name, "targetname");
			if(!isdefined(level.var_92fc3c34))
			{
				level.var_92fc3c34 = [];
			}
			else if(!IsArray(level.var_92fc3c34))
			{
				level.var_92fc3c34 = Array(level.var_92fc3c34);
			}
			level.var_92fc3c34[level.var_92fc3c34.size] = mdl_board;
			v_origin = mdl_board GetTagOrigin("tag_fx_skull_top");
			v_angles = mdl_board GetTagAngles("tag_fx_skull_top");
			mdl_board thread scene::Play("p7_fxanim_zm_gen_challenge_prizestone_close_bundle", mdl_board);
			wait(0.2);
			mdl_board clientfield::set("challenge_board_base", 1);
		}
		level flag::set("challenge_boards_ready");
		for(i = 1; i <= 3; i++)
		{
			foreach(t_lookat in GetEntArray("t_lookat_challenge_" + i, "targetname"))
			{
				t_lookat SetInvisibleToAll();
			}
		}
		return;
	}
}

/*
	Name: function_b7156b15
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x2528
	Size: 0x388
	Parameters: 0
	Flags: None
	Line Number: 435
*/
function function_b7156b15()
{
	self endon("disconnect");
	self endon("death");
	self thread function_2ce855f3(self.var_ff453c39.var_c17bb43c);
	self thread function_2ce855f3(self.var_ff453c39.var_33832377);
	self thread function_2ce855f3(self.var_ff453c39.var_d80a90e);
	self thread function_fbbc8608(self.var_ff453c39.var_c17bb43c.n_index, "flag_player_completed_challenge_1");
	self thread function_fbbc8608(self.var_ff453c39.var_33832377.n_index, "flag_player_completed_challenge_2");
	self thread function_fbbc8608(self.var_ff453c39.var_d80a90e.n_index, "flag_player_completed_challenge_3");
	self thread function_974d5f1d();
	a_n_challenge = [];
	var_e01fcddc = [];
	var_a879fa43 = self GetEntityNumber();
	for(i = 1; i <= 3; i++)
	{
		var_f2dc9f0b = [];
		foreach(t_lookat in GetEntArray("t_lookat_challenge_" + i, "targetname"))
		{
			if(t_lookat.script_int == var_a879fa43)
			{
				t_lookat setvisibletoplayer(self);
				var_e01fcddc[i] = t_lookat;
				break;
			}
			a_n_challenge[i] = i;
		}
		self thread function_a2d25f82(i, var_a879fa43);
	}
	foreach(s_challenge in struct::get_array("s_challenge_trigger"))
	{
		if(s_challenge.script_int == var_a879fa43)
		{
			s_challenge function_4e61a018(var_e01fcddc, a_n_challenge);
			break;
		}
	}
}

/*
	Name: function_4e61a018
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x28B8
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 484
*/
function function_4e61a018(var_e01fcddc, a_n_challenge)
{
	self zm_unitrigger::create_unitrigger("", 128, &function_3ae0d6d5);
	self.s_unitrigger.require_look_at = 0;
	self.s_unitrigger.inactive_reassess_time = 0.1;
	zm_unitrigger::unitrigger_force_per_player_triggers(self.s_unitrigger, 1);
	self.s_unitrigger.a_n_challenge = a_n_challenge;
	self.var_e01fcddc = var_e01fcddc;
	self thread function_424b6fe8();
	return;
	~self.var_e01fcddc;
}

/*
	Name: function_424b6fe8
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x2988
	Size: 0x3F0
	Parameters: 0
	Flags: None
	Line Number: 507
*/
function function_424b6fe8()
{
	while(1)
	{
		self waittill("trigger_activated", e_who);
		var_e6b3078d = e_who GetEntityNumber();
		if(self.script_int == var_e6b3078d)
		{
			if(e_who flag::get("flag_player_initialized_reward"))
			{
				if(self.mdl_reward.var_15fa438f == 2)
				{
					w_current = e_who GetCurrentWeapon();
					if(zm_utility::is_placeable_mine(w_current) || zm_equipment::is_equipment(w_current) || w_current == level.weaponNone || (isdefined(w_current.isHeroWeapon) && w_current.isHeroWeapon) || (isdefined(w_current.isgadget) && w_current.isgadget))
					{
						continue;
					}
					if(e_who bgb::is_enabled("zm_bgb_disorderly_combat"))
					{
						continue;
					}
				}
				else if(self.mdl_reward.var_15fa438f == 3)
				{
					a_perks = e_who GetPerks();
					if(a_perks.size == level._custom_perks.size)
					{
						continue;
					}
				}
				e_who PlayRumbleOnEntity("zm_stalingrad_interact_rumble");
				self.s_unitrigger.playertrigger[e_who.entity_num] function_cb2c15eb(e_who, "");
				e_who function_640cd978(self.mdl_reward, var_e6b3078d);
				if(isdefined(self.mdl_reward))
				{
					self.mdl_reward delete();
				}
			}
			else
			{
				for(i = 1; i <= 3; i++)
				{
					if(e_who function_3f67a723(self.var_e01fcddc[i].origin, 15, 0) && Distance(e_who.origin, self.origin) < 500)
					{
						if(isdefined(e_who.var_c981566c) && e_who.var_c981566c)
						{
							break;
						}
						if(e_who flag::get("flag_player_completed_challenge_" + i) && !e_who flag::get("flag_player_collected_reward_" + i))
						{
							e_who PlayRumbleOnEntity("zm_stalingrad_interact_rumble");
							self.s_unitrigger.playertrigger[e_who.entity_num] function_cb2c15eb(e_who, "");
							self function_1d22626(e_who, i);
							break;
						}
					}
				}
			}
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1d22626
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x2D80
	Size: 0x4D0
	Parameters: 2
	Flags: None
	Line Number: 581
*/
function function_1d22626(e_player, var_15fa438f)
{
	e_player endon("disconnect");
	var_7bb343ef = VectorScale((0, 1, 0), 90);
	a_s_rewards = struct::get_array("s_challenge_reward", "targetname");
	var_e6b3078d = e_player GetEntityNumber();
	foreach(var_4bcd3b3a in a_s_rewards)
	{
		if(var_4bcd3b3a.script_int == var_e6b3078d)
		{
			break;
		}
	}
	switch(var_15fa438f)
	{
		case 1:
		{
			var_17b3dc96 = "p7_zm_power_up_max_ammo";
			var_4bcd3b3a.var_e1513629 = VectorScale((0, 0, 1), 6);
			var_4bcd3b3a.var_b90d551 = var_7bb343ef;
			break;
		}
		case 2:
		{
			a_str_weapon = [];
			if(!isdefined(a_str_weapon))
			{
				a_str_weapon = [];
			}
			else if(!IsArray(a_str_weapon))
			{
				a_str_weapon = Array(a_str_weapon);
			}
			a_str_weapon[a_str_weapon.size] = "lmg_cqb_upgraded";
			if(!isdefined(a_str_weapon))
			{
				a_str_weapon = [];
			}
			else if(!IsArray(a_str_weapon))
			{
				a_str_weapon = Array(a_str_weapon);
			}
			a_str_weapon[a_str_weapon.size] = "ar_damage_upgraded";
			if(!isdefined(a_str_weapon))
			{
				a_str_weapon = [];
			}
			else if(!IsArray(a_str_weapon))
			{
				a_str_weapon = Array(a_str_weapon);
			}
			a_str_weapon[a_str_weapon.size] = "smg_versatile_upgraded";
			var_17b3dc96 = Array::random(a_str_weapon);
			var_6b215f76 = AnglesToRight(var_4bcd3b3a.angles) * 5 + AnglesToForward(var_4bcd3b3a.angles) * -2;
			var_4bcd3b3a.var_e1513629 = var_6b215f76 + (0, 0, 1);
			var_4bcd3b3a.var_b90d551 = var_7bb343ef;
			break;
		}
		case 3:
		{
			var_17b3dc96 = "zombie_pickup_perk_bottle";
			var_1bfa1f7e = AnglesToForward(var_4bcd3b3a.angles) * -2;
			var_4bcd3b3a.var_e1513629 = var_1bfa1f7e + VectorScale((0, 0, 1), 7);
			var_4bcd3b3a.var_b90d551 = var_7bb343ef;
			break;
		}
	}
	e_player.var_c981566c = 1;
	mdl_board = level.var_92fc3c34[var_e6b3078d];
	mdl_board scene::Play("p7_fxanim_zm_gen_challenge_prizestone_open_bundle", mdl_board);
	mdl_board clientfield::set("challenge_board_reward", 1);
	self function_b1f54cb4(e_player, var_4bcd3b3a, var_17b3dc96, 30);
	self.mdl_reward clientfield::set("powerup_fx", 1);
	self.mdl_reward.var_15fa438f = var_15fa438f;
	e_player flag::set("flag_player_initialized_reward");
	self thread function_1ad9d1a0(e_player, -30, var_e6b3078d);
}

/*
	Name: function_1ad9d1a0
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x3258
	Size: 0xD8
	Parameters: 3
	Flags: None
	Line Number: 669
*/
function function_1ad9d1a0(e_player, n_dist, var_e6b3078d)
{
	self endon("hash_422dba45");
	self.mdl_reward MoveZ(n_dist, 12, 6);
	self.mdl_reward waittill("movedone");
	if(isdefined(e_player))
	{
		e_player flag::clear("flag_player_initialized_reward");
		e_player.var_c981566c = undefined;
	}
	if(isdefined(self.mdl_reward))
	{
		self.mdl_reward delete();
	}
	function_d57066e8(var_e6b3078d);
	return;
}

/*
	Name: function_b1f54cb4
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x3338
	Size: 0x190
	Parameters: 4
	Flags: None
	Line Number: 697
*/
function function_b1f54cb4(e_player, var_4bcd3b3a, var_17b3dc96, var_21d0cf95)
{
	if(isdefined(self.mdl_reward))
	{
		self notify("hash_422dba45");
	}
	var_51a2f105 = var_4bcd3b3a.origin + var_4bcd3b3a.var_e1513629;
	var_9ef5a0dc = var_4bcd3b3a.angles + var_4bcd3b3a.var_b90d551;
	switch(var_17b3dc96)
	{
		case "ar_damage_upgraded":
		case "lmg_cqb_upgraded":
		case "smg_versatile_upgraded":
		{
			self.mdl_reward = zm_utility::spawn_buildkit_weapon_model(e_player, GetWeapon(var_17b3dc96), undefined, var_51a2f105, var_9ef5a0dc);
			self.mdl_reward.str_weapon_name = var_17b3dc96;
			break;
		}
		default
		{
			self.mdl_reward = util::spawn_model(var_17b3dc96, var_51a2f105, var_9ef5a0dc);
			break;
		}
	}
	self.mdl_reward MoveZ(var_21d0cf95, 1);
	playsoundatposition("evt_prize_rise", self.origin);
	self.mdl_reward waittill("movedone");
}

/*
	Name: function_d57066e8
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x34D0
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 736
*/
function function_d57066e8(var_e6b3078d)
{
	mdl_board = level.var_92fc3c34[var_e6b3078d];
	mdl_board scene::Play("p7_fxanim_zm_gen_challenge_prizestone_close_bundle", mdl_board);
	mdl_board clientfield::set("challenge_board_reward", 0);
}

/*
	Name: function_a2d25f82
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x3540
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 753
*/
function function_a2d25f82(var_15fa438f, var_a879fa43)
{
	self endon("disconnect");
	self endon("death");
	/#
		self endon("hash_f9ff0ae7");
	#/
	self flag::wait_till("flag_player_completed_challenge_" + var_15fa438f);
	STR_MODEL = "p7_zm_gen_challenge_medal_0" + var_15fa438f;
	mdl_board = level.var_92fc3c34[var_a879fa43];
	mdl_board Attach(STR_MODEL, function_94a89297(var_15fa438f));
}

/*
	Name: function_94a89297
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x3610
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 776
*/
function function_94a89297(var_15fa438f)
{
	switch(var_15fa438f)
	{
		case 1:
		{
			return "tag_medal_easy";
			break;
		}
		case 2:
		{
			return "tag_medal_med";
			break;
		}
		default
		{
			return "tag_medal_hard";
			break;
		}
	}
}

/*
	Name: function_fbbc8608
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x3678
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 808
*/
function function_fbbc8608(n_challenge_index, var_d4adfa57)
{
	self endon("disconnect");
	self endon("death");
	self flag::wait_till(var_d4adfa57);
	var_ea22a0bf = "";
	if(n_challenge_index == 1)
	{
		var_ea22a0bf = self.var_ff453c39.var_c17bb43c.str_info;
	}
	else if(n_challenge_index == 2)
	{
		var_ea22a0bf = self.var_ff453c39.var_33832377.str_info;
	}
	else
	{
		var_ea22a0bf = self.var_ff453c39.var_d80a90e.str_info;
	}
	self LUINotifyEvent(&"trial_complete", 3, &"ZM_GENESIS_CHALLENGE_COMPLETE", var_ea22a0bf, n_challenge_index - 1);
}

/*
	Name: function_3ae0d6d5
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x3790
	Size: 0x3F0
	Parameters: 1
	Flags: None
	Line Number: 839
*/
function function_3ae0d6d5(e_player)
{
	if(self.stub.related_parent.script_int == e_player GetEntityNumber())
	{
		b_is_looking = 0;
		if(e_player flag::get("flag_player_initialized_reward"))
		{
			self function_cb2c15eb(e_player, &"ZM_GENESIS_CHALLENGE_REWARD_TAKE");
			if(self.stub.related_parent.mdl_reward.var_15fa438f == 3)
			{
				a_perks = e_player GetPerks();
				if(a_perks.size == level._custom_perks.size)
				{
					self function_cb2c15eb(e_player, "");
				}
			}
			b_is_looking = 1;
			return 1;
		}
		for(i = 1; i <= 3; i++)
		{
			if(e_player function_3f67a723(self.stub.related_parent.var_e01fcddc[i].origin, 15, 0) && Distance(e_player.origin, self.stub.origin) < 500)
			{
				self function_27f6c3cd(e_player, i);
				e_player clientfield::set_player_uimodel("trialWidget.icon", i - 1);
				e_player clientfield::set_player_uimodel("trialWidget.visible", 1);
				e_player clientfield::set_player_uimodel("trialWidget.progress", e_player.var_5315d90d[i]);
				e_player thread function_23c9ffd3(self);
				if(!e_player flag::get("flag_player_completed_challenge_" + i))
				{
					self function_cb2c15eb(e_player, "");
					b_is_looking = 1;
					return 1;
				}
				if(!e_player flag::get("flag_player_collected_reward_" + i) && (!(isdefined(e_player.var_c981566c) && e_player.var_c981566c)))
				{
					self function_cb2c15eb(e_player, &"ZM_GENESIS_CHALLENGE_REWARD");
					b_is_looking = 1;
					return 1;
				}
				self function_cb2c15eb(e_player, "");
				b_is_looking = 1;
				return 1;
			}
		}
		if(!b_is_looking)
		{
			self function_cb2c15eb(e_player, "");
			e_player clientfield::set_player_uimodel("trialWidget.visible", 0);
			return 0;
		}
	}
	else
	{
		self function_cb2c15eb(e_player, "");
		return 0;
	}
}

/*
	Name: function_3f67a723
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x3B88
	Size: 0xB0
	Parameters: 4
	Flags: None
	Line Number: 908
*/
function function_3f67a723(origin, var_a0fa82de, do_trace, e_ignore)
{
	if(!isdefined(var_a0fa82de))
	{
		var_a0fa82de = 90;
	}
	var_a0fa82de = AbsAngleClamp360(var_a0fa82de);
	var_303bd275 = cos(var_a0fa82de * 0.5);
	if(self util::is_player_looking_at(origin, var_303bd275, do_trace, e_ignore))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_640cd978
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x3C40
	Size: 0x1D8
	Parameters: 2
	Flags: None
	Line Number: 933
*/
function function_640cd978(mdl_reward, var_e6b3078d)
{
	switch(mdl_reward.var_15fa438f)
	{
		case 1:
		{
			level thread zm_powerups::specific_powerup_drop("full_ammo", self.origin);
			playsoundatposition("evt_grab_powerup", self.origin);
			break;
		}
		case 2:
		{
			if(isdefined(mdl_reward.str_weapon_name))
			{
				w_reward = GetWeapon(mdl_reward.str_weapon_name);
			}
			self thread swap_weapon(w_reward);
			playsoundatposition("evt_grab_weapon", self.origin);
			break;
		}
		case 3:
		{
			self thread function_6131520e();
			playsoundatposition("evt_grab_perk", self.origin);
			break;
		}
	}
	self flag::set("flag_player_collected_reward_" + mdl_reward.var_15fa438f);
	self flag::clear("flag_player_initialized_reward");
	self function_33e91747(mdl_reward.var_15fa438f, 2);
	level thread function_d57066e8(var_e6b3078d);
	self.var_c981566c = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: swap_weapon
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x3E20
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 979
*/
function swap_weapon(w_new)
{
	w_current = self GetCurrentWeapon();
	if(!zm_utility::is_player_valid(self))
	{
		return;
	}
	if(self.IS_DRINKING > 0)
	{
		return;
	}
	if(zm_utility::is_placeable_mine(w_current) || zm_equipment::is_equipment(w_current) || w_current == level.weaponNone)
	{
		return;
	}
	if(!self hasweapon(w_new.rootweapon, 1))
	{
		if(w_current.type === "melee")
		{
			self function_3420bc2f(w_new);
		}
		else
		{
			self take_old_weapon_and_give_new(w_current, w_new);
		}
	}
	else
	{
		self giveMaxAmmo(w_new);
	}
}

/*
	Name: take_old_weapon_and_give_new
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x3F68
	Size: 0xD8
	Parameters: 2
	Flags: None
	Line Number: 1021
*/
function take_old_weapon_and_give_new(w_current, w_new)
{
	a_w_primaries = self getweaponslistprimaries();
	if(isdefined(a_w_primaries) && a_w_primaries.size >= zm_utility::get_player_weapon_limit(self))
	{
		self TakeWeapon(w_current);
	}
	var_6fc96b00 = self zm_weapons::give_build_kit_weapon(w_new);
	self GiveWeapon(var_6fc96b00);
	self SwitchToWeapon(var_6fc96b00);
	return;
}

/*
	Name: function_3420bc2f
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4048
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 1044
*/
function function_3420bc2f(w_new)
{
	a_w_inventory = self GetWeaponsList(1);
	foreach(w_inventory in a_w_inventory)
	{
		if(w_inventory.type === "melee")
		{
			self TakeWeapon(w_inventory);
			break;
		}
	}
	var_6fc96b00 = self zm_weapons::give_build_kit_weapon(w_new);
	self GiveWeapon(var_6fc96b00);
}

/*
	Name: function_6131520e
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4168
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 1069
*/
function function_6131520e()
{
	self endon("disconnect");
	self endon("death");
	a_str_perks = getArrayKeys(level._custom_perks);
	a_str_perks = Array::randomize(a_str_perks);
	foreach(str_perk in a_str_perks)
	{
		if(!self hasPerk(str_perk))
		{
			self zm_perks::give_perk(str_perk, 0);
			break;
		}
	}
}

/*
	Name: function_1adeaa1c
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4278
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 1095
*/
function function_1adeaa1c()
{
	var_4562cc04 = level.perk_purchase_limit;
	if(self flag::get("flag_player_collected_reward_3"))
	{
		var_4562cc04++;
	}
	return var_4562cc04;
}

/*
	Name: function_1ce88534
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x42C0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1115
*/
function function_1ce88534()
{
	self endon("hash_72d86ab9");
	self endon("disconnect");
	self endon("death");
	if(!isdefined(self.var_11e81afa))
	{
		self.var_11e81afa = 0;
	}
	if(!isdefined(self.var_ca877c33))
	{
		self.var_ca877c33 = 0;
	}
	self thread function_9b1e43e5();
	self thread function_c120be4e();
	return;
}

/*
	Name: function_9b1e43e5
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4350
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1143
*/
function function_9b1e43e5()
{
	self endon("hash_72d86ab9");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_ac4cc18c", ai_zombie, e_attacker);
		if(e_attacker === self && self.var_11e81afa < 5)
		{
			self.var_11e81afa++;
			self notify("hash_c1783c94");
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c120be4e
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x43E8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1171
*/
function function_c120be4e()
{
	self endon("hash_72d86ab9");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("zombie_zapped");
		if(self.var_ca877c33 < 5)
		{
			self.var_ca877c33++;
			self notify("hash_c1783c94");
		}
	}
}

/*
	Name: function_8eeff46f
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4458
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1197
*/
function function_8eeff46f()
{
	self endon("hash_72d86ab9");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_98ea05", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_337fabcf");
		}
	}
}

/*
	Name: function_68ed7a06
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x44C8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1222
*/
function function_68ed7a06()
{
	self endon("hash_72d86ab9");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		str_result = level util::waittill_any("all_rifts_destroyed", "chaos_round_timeout");
		if(str_result === "all_rifts_destroyed")
		{
			self notify("hash_d7d3166");
		}
	}
	return;
	~str_result;
}

/*
	Name: function_aae115f9
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4558
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1249
*/
function function_aae115f9()
{
	self endon("hash_72d86ab9");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_10ed65db", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_4f70cd59");
		}
	}
}

/*
	Name: function_84de9b90
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x45C8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1274
*/
function function_84de9b90()
{
	self endon("hash_72d86ab9");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_646a26b1", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_296e52f0");
		}
	}
}

/*
	Name: function_f6e60acb
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4638
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1299
*/
function function_f6e60acb()
{
	self endon("hash_72d86ab9");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_944787dd", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_9b75c22b");
		}
	}
}

/*
	Name: function_d0e39062
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x46A8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1324
*/
function function_d0e39062()
{
	self endon("hash_72d86ab9");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("island_dweller", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_757347c2");
		}
	}
}

/*
	Name: function_72fed2e5
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4718
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1349
*/
function function_72fed2e5()
{
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.FillBuffer(Int32 numBytes)
   at System.IO.BinaryReader.ReadInt32()
   at Cerberus.Logic.BlackOps3Script.LoadEndSwitch() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\BlackOps3Script.cs:line 24892
   at Cerberus.Logic.Decompiler.FindSwitchCase() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 377
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 218
}

/*
	Name: function_4cfc587c
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4790
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1369
*/
function function_4cfc587c()
{
	self endon("hash_98dae522");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_92ad8590", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_f18c0fdc");
		}
	}
}

/*
	Name: function_9592bd2c
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4800
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1394
*/
function function_9592bd2c()
{
	self endon("hash_72d86ab9");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_7e8efe7c");
		self notify("hash_846f038c");
	}
}

/*
	Name: function_56b65fd3
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4858
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1416
*/
function function_56b65fd3()
{
	self endon("hash_98dae522");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_11ab530d", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_fb461733");
		}
	}
}

/*
	Name: function_e4aef098
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x48C8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1441
*/
function function_e4aef098()
{
	self endon("hash_98dae522");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_b1a8571a", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_893ea7f8");
		}
	}
}

/*
	Name: function_ab16b01
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4938
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 1466
*/
function function_ab16b01()
{
	level flagsys::wait_till("start_zombie_round_logic");
	self endon("hash_98dae522");
	self endon("disconnect");
	self endon("death");
	var_259ad2d8 = GetEnt("apothicon_island", "targetname");
	level flag::wait_till_all(Array("power_on1", "power_on2", "power_on3", "power_on4"));
	while(1)
	{
		self waittill("hash_a8c34632");
		start_round = level.round_number;
		while(self istouching(var_259ad2d8) && level.round_number - start_round < 3)
		{
			wait(1);
		}
		if(level.round_number - start_round >= 3)
		{
			self notify("hash_af412261");
		}
	}
}

/*
	Name: function_c8bdcf0e
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4A80
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1499
*/
function function_c8bdcf0e()
{
	self endon("hash_98dae522");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_c2b1dec7");
		n_start_time = GetTime();
		function_ac2bad00(n_start_time, 120);
		if(n_start_time < 120)
		{
			self notify("hash_6d4d866e");
		}
	}
}

/*
	Name: function_ac2bad00
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4B10
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 1526
*/
function function_ac2bad00(n_start_time, var_8d05fd02)
{
	level endon("hash_b66ef55c");
	level endon("kill_round");
	level endon("hash_3859a73e");
	n_total_time = 0;
	while(n_total_time < var_8d05fd02)
	{
		n_current_time = GetTime();
		n_total_time = n_current_time - n_start_time / 1000;
		util::wait_network_frame();
	}
}

/*
	Name: function_eec04977
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4BA8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1550
*/
function function_eec04977()
{
	self endon("hash_98dae522");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_661aa774");
		str_result = level util::waittill_any("power_ritual_aborted", "power_ritual_completed", "non_melee_damage");
		if(str_result === "power_ritual_completed")
		{
			self notify("hash_935000d7");
		}
	}
}

/*
	Name: function_7cb8da3c
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4C50
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1576
*/
function function_7cb8da3c()
{
	self endon("hash_98dae522");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_1c04ac7f", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_2148919c");
		}
	}
}

/*
	Name: function_a2bb54a5
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4CC0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1601
*/
function function_a2bb54a5()
{
	self endon("hash_98dae522");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_e15c8839", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_474b0c05");
		}
	}
}

/*
	Name: function_a01222
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4D30
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1626
*/
function function_a01222()
{
	self endon("hash_98dae522");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("hash_d46a1dc6");
		self notify("hash_a52fc982");
	}
}

/*
	Name: function_26a28c8b
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4D88
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1648
*/
function function_26a28c8b()
{
	self endon("hash_bedd5f8b");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_8dbe1895", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_cb3243eb");
		}
	}
}

/*
	Name: function_748fccd9
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4DF8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1673
*/
function function_748fccd9()
{
	self endon("hash_98dae522");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("hash_21c74868");
		self notify("hash_622edeb9");
	}
}

/*
	Name: function_4e8d5270
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4E50
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1695
*/
function function_4e8d5270()
{
	self endon("hash_98dae522");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("hash_36abd341");
		self notify("hash_3c2c6450");
	}
}

/*
	Name: function_17664372
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4EA8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1717
*/
function function_17664372()
{
	self endon("hash_bedd5f8b");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_f312481d", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_2e126bd2");
		}
	}
}

/*
	Name: function_f163c909
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4F18
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1742
*/
function function_f163c909()
{
	spawner::add_archetype_spawn_function("mechz", &function_8c4a46cf, self);
	self thread function_78a15a9();
}

/*
	Name: function_8c4a46cf
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x4F68
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 1758
*/
function function_8c4a46cf(e_player)
{
	e_player endon("hash_bedd5f8b");
	e_player endon("disconnect");
	self endon("hash_da235077");
	self waittill("death", e_attacker, n_damage, w_weapon, v_point, v_dir);
	if(e_attacker === e_player)
	{
		e_attacker notify("hash_80ff169");
		return;
	}
}

/*
	Name: function_78a15a9
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5008
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1781
*/
function function_78a15a9()
{
	self endon("hash_bedd5f8b");
	self endon("disconnect");
	self endon("death");
	self endon("hash_80ff169");
	while(1)
	{
		self waittill("damage", n_damage, e_attacker);
		if(e_attacker.archetype === "mechz" || e_attacker.archetype === "margwa")
		{
			e_attacker notify("hash_da235077");
		}
	}
}

/*
	Name: function_cb614ea0
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x50C0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1807
*/
function function_cb614ea0()
{
	self endon("hash_bedd5f8b");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("hash_bf458b1e");
		self notify("hash_e20d7700");
	}
	return;
}

/*
	Name: function_d572a77f
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5118
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1830
*/
function function_d572a77f()
{
	self endon("hash_bedd5f8b");
	self endon("disconnect");
	self endon("death");
	var_f434985b = 0;
	var_2576a2b = 0;
	while(1)
	{
		str_result = self util::waittill_any_return("flag_player_completed_challenge_3", "disconnect", "fire_margwa_death", "shadow_margwa_death");
		if(str_result == "fire_margwa_death")
		{
			var_f434985b = 1;
		}
		else if(str_result == "shadow_margwa_death")
		{
			var_2576a2b = 1;
		}
		if(var_f434985b && var_2576a2b)
		{
			self notify("hash_ec1ecfdf");
		}
	}
}

/*
	Name: function_af702d16
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5210
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1865
*/
function function_af702d16()
{
	level flagsys::wait_till("start_zombie_round_logic");
	self endon("hash_bedd5f8b");
	self endon("disconnect");
	self endon("death");
	level flag::wait_till_all(Array("power_on1", "power_on2", "power_on3", "power_on4"));
	if(level.round_number <= 5)
	{
		self notify("hash_c61c5576");
	}
}

/*
	Name: function_896db2ad
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x52C8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1888
*/
function function_896db2ad()
{
	self endon("hash_72d86ab9");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_9a954bfc", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_a019db0d");
		}
	}
}

/*
	Name: function_636b3844
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5338
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1913
*/
function function_636b3844()
{
	self endon("hash_bedd5f8b");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_22e3a570", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_7a1760a4");
		}
	}
}

/*
	Name: function_6d7c9123
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x53A8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1938
*/
function function_6d7c9123()
{
	self endon("hash_bedd5f8b");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("hash_d290d94f", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_8428b983");
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_477a16ba
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5418
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1965
*/
function function_477a16ba()
{
	self endon("hash_bedd5f8b");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("hash_7b1b2d");
		self notify("hash_5e263f1a");
	}
}

/*
	Name: function_905d9544
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5470
	Size: 0x288
	Parameters: 1
	Flags: None
	Line Number: 1987
*/
function function_905d9544(e_attacker)
{
	if(isPlayer(e_attacker))
	{
		if(self.archetype === "apothicon_fury")
		{
			if(zm_utility::is_headshot(self.damageWeapon, self.damagelocation, self.damageMod))
			{
				level notify("hash_646a26b1", e_attacker);
			}
		}
		if(isdefined(self.traversal))
		{
			if(isdefined(self.traversal.startnode))
			{
				if(self.traversal.startnode.script_noteworthy === "flinger_traversal")
				{
					e_attacker notify("hash_21c74868");
				}
			}
		}
		if(self.archetype === "zombie")
		{
			self thread check_island(e_attacker);
		}
		if(isdefined(e_attacker.island_name) && isdefined(self.island_name))
		{
			if(e_attacker.island_name !== self.island_name)
			{
				level notify("hash_f312481d", e_attacker);
			}
		}
		if(self.archetype === "margwa")
		{
			if(self.var_b6802ed1[e_attacker.playerNum] <= 3)
			{
				e_attacker notify("hash_bf458b1e");
			}
			if(self.element_type === "fire")
			{
				e_attacker notify("hash_52be64f0");
			}
			else if(self.element_type === "shadow")
			{
				e_attacker notify("hash_85628bcc");
			}
			if(self.zone_name === "apothicon_interior_zone")
			{
				e_attacker notify("hash_7b1b2d");
			}
		}
	}
	else if(isdefined(e_attacker) && e_attacker.archetype === "turret")
	{
		if(isdefined(e_attacker.activated_by_player))
		{
			e_attacker.activated_by_player notify("hash_93091f5f");
			level notify("hash_93091f5f");
			self thread check_island(e_attacker.activated_by_player);
		}
	}
}

/*
	Name: check_island
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5700
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 2060
*/
function check_island(player)
{
	if(isdefined(self.island_name))
	{
		var_bc09c7dd = 1;
		switch(self.island_name)
		{
			case "asylum_island":
			case "prison_island":
			case "prototype_island":
			case "start_island":
			case "temple_island":
			{
				player.var_b5c08e44[self.island_name]++;
				a_str_keys = getArrayKeys(player.var_b5c08e44);
				foreach(str_key in a_str_keys)
				{
					if(player.var_b5c08e44[str_key] < 5)
					{
						var_bc09c7dd = 0;
					}
				}
				if(var_bc09c7dd)
				{
					player notify("hash_36abd341");
					break;
				}
			}
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_6267dc
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5868
	Size: 0xC8
	Parameters: 13
	Flags: None
	Line Number: 2104
*/
function function_6267dc(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, v_direction, str_tag, STR_MODEL, str_part, n_flags, e_inflictor, n_chargeLevel)
{
	if(isPlayer(e_inflictor))
	{
		if(!(isdefined(zm_utility::is_melee_weapon(w_weapon)) && zm_utility::is_melee_weapon(w_weapon)))
		{
			level notify("hash_afd74e11");
		}
	}
	return 0;
}

/*
	Name: function_2ce855f3
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5938
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 2126
*/
function function_2ce855f3(s_challenge)
{
	self endon("disconnect");
	self endon("death");
	/#
		self endon("hash_f9ff0ae7");
	#/
	if(isdefined(s_challenge.var_c0e6cb4e))
	{
		self thread [[s_challenge.var_c0e6cb4e]]();
	}
	n_challenge_count = s_challenge.n_count;
	if(!isdefined(self.var_5315d90d))
	{
		self.var_5315d90d = [];
	}
	self.var_5315d90d[s_challenge.n_index] = 0;
	var_ea184c3d = n_challenge_count;
	while(n_challenge_count > 0)
	{
		self waittill(s_challenge.str_notify);
		n_challenge_count--;
		self.var_5315d90d[s_challenge.n_index] = 1 - n_challenge_count / var_ea184c3d;
	}
	self function_33e91747(s_challenge.n_index, 1);
	self flag::set("flag_player_completed_challenge_" + s_challenge.n_index);
	return;
}

/*
	Name: function_974d5f1d
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5AA0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 2165
*/
function function_974d5f1d()
{
	self endon("disconnect");
	self endon("death");
	a_flags = Array("flag_player_completed_challenge_1", "flag_player_completed_challenge_2", "flag_player_completed_challenge_3");
	self flag::wait_till_all(a_flags);
	level notify("hash_41370469");
}

/*
	Name: function_89d8e005
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5B28
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 2184
*/
function function_89d8e005()
{
	level.var_c28313cd = 0;
	callback::on_disconnect(&function_b1cd865a);
	while(1)
	{
		level waittill("hash_41370469");
		level.var_c28313cd++;
		if(level.var_c28313cd >= level.players.size)
		{
			level flag::set("all_challenges_completed");
			break;
		}
	}
}

/*
	Name: function_b1cd865a
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5BC0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 2210
*/
function function_b1cd865a()
{
	if(level.var_c28313cd >= level.players.size)
	{
		level flag::set("all_challenges_completed");
	}
}

/*
	Name: function_ca31caac
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5C00
	Size: 0x110
	Parameters: 12
	Flags: None
	Line Number: 2228
*/
function function_ca31caac(inflictor, attacker, damage, dFlags, mod, weapon, point, dir, hitLoc, offsetTime, boneIndex, modelIndex)
{
	if(GetDvarInt("com_maxclients") <= 4)
	{
		if(isPlayer(attacker))
		{
			if(!isdefined(self.var_b6802ed1))
			{
				self.var_b6802ed1 = [];
			}
			if(!isdefined(self.var_b6802ed1[attacker.playerNum]))
			{
				self.var_b6802ed1[attacker.playerNum] = 0;
			}
			self.var_b6802ed1[attacker.playerNum]++;
		}
	}
}

/*
	Name: function_b9b4ce34
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5D18
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2257
*/
function function_b9b4ce34()
{
	/#
		zm_devgui::function_4acecab5(&function_16ba3a1e);
		AddDebugCommand("Dev Block strings are not supported");
		AddDebugCommand("Dev Block strings are not supported");
		AddDebugCommand("Dev Block strings are not supported");
		AddDebugCommand("Dev Block strings are not supported");
		AddDebugCommand("Dev Block strings are not supported");
		AddDebugCommand("Dev Block strings are not supported");
		return;
	#/
}

/*
	Name: function_16ba3a1e
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x5DE0
	Size: 0x418
	Parameters: 1
	Flags: None
	Line Number: 2281
*/
function function_16ba3a1e(cmd)
{
	/#
		switch(cmd)
		{
			case "Dev Block strings are not supported":
			{
				level flag::set("Dev Block strings are not supported");
				return 1;
			}
			case "Dev Block strings are not supported":
			{
				foreach(e_player in level.players)
				{
					e_player flag::set("Dev Block strings are not supported");
					e_player notify("hash_fb393ffe");
					e_player.var_5315d90d[1] = 1;
					e_player function_33e91747(1, 1);
				}
				return 1;
			}
			case "Dev Block strings are not supported":
			{
				foreach(e_player in level.players)
				{
					e_player flag::set("Dev Block strings are not supported");
					e_player notify("hash_d536c595");
					e_player.var_5315d90d[2] = 1;
					e_player function_33e91747(2, 1);
				}
				return 1;
			}
			case "Dev Block strings are not supported":
			{
				foreach(e_player in level.players)
				{
					e_player flag::set("Dev Block strings are not supported");
					e_player notify("hash_af344b2c");
					e_player.var_5315d90d[3] = 1;
					e_player function_33e91747(3, 1);
				}
				return 1;
			}
			case "Dev Block strings are not supported":
			{
				level function_dcfe1b91();
				foreach(e_player in level.players)
				{
					e_player function_224232f4();
				}
				return 1;
			}
			case "Dev Block strings are not supported":
			{
				foreach(e_player in level.players)
				{
					e_player function_224232f4();
				}
				return 1;
			}
		}
		return 0;
	#/
}

/*
	Name: function_224232f4
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x6200
	Size: 0x270
	Parameters: 0
	Flags: None
	Line Number: 2356
*/
function function_224232f4()
{
	/#
		self notify("hash_f9ff0ae7");
		self flag::clear("Dev Block strings are not supported");
		self flag::clear("Dev Block strings are not supported");
		self flag::clear("Dev Block strings are not supported");
		self flag::clear("Dev Block strings are not supported");
		self flag::clear("Dev Block strings are not supported");
		self flag::clear("Dev Block strings are not supported");
		self thread function_2ce855f3(self.var_ff453c39.var_c17bb43c);
		self thread function_2ce855f3(self.var_ff453c39.var_33832377);
		self thread function_2ce855f3(self.var_ff453c39.var_d80a90e);
		var_a879fa43 = self GetEntityNumber();
		for(i = 1; i <= 3; i++)
		{
			self.var_5315d90d[i] = 0;
			self function_33e91747(i, 0);
			foreach(var_c6c0252b in struct::get_array("Dev Block strings are not supported" + i, "Dev Block strings are not supported"))
			{
				if(var_c6c0252b.script_int == var_a879fa43)
				{
					break;
				}
			}
		}
	#/
}

/*
	Name: function_dcfe1b91
	Namespace: namespace_ed811526
	Checksum: 0x424F4353
	Offset: 0x6478
	Size: 0x452
	Parameters: 0
	Flags: None
	Line Number: 2395
*/
function function_dcfe1b91()
{
	/#
		foreach(e_player in level.players)
		{
			if(!isdefined(level.var_ff453c39.var_c17bb43c))
			{
				level.var_ff453c39.var_c17bb43c = [];
			}
			else if(!IsArray(level.var_ff453c39.var_c17bb43c))
			{
				level.var_ff453c39.var_c17bb43c = Array(level.var_ff453c39.var_c17bb43c);
			}
			level.var_ff453c39.var_c17bb43c[level.var_ff453c39.var_c17bb43c.size] = e_player.var_ff453c39.var_c17bb43c;
			if(!isdefined(level.var_ff453c39.var_33832377))
			{
				level.var_ff453c39.var_33832377 = [];
			}
			else if(!IsArray(level.var_ff453c39.var_33832377))
			{
				level.var_ff453c39.var_33832377 = Array(level.var_ff453c39.var_33832377);
			}
			level.var_ff453c39.var_33832377[level.var_ff453c39.var_33832377.size] = e_player.var_ff453c39.var_33832377;
			if(!isdefined(level.var_ff453c39.var_d80a90e))
			{
				level.var_ff453c39.var_d80a90e = [];
			}
			else if(!IsArray(level.var_ff453c39.var_d80a90e))
			{
				level.var_ff453c39.var_d80a90e = Array(level.var_ff453c39.var_d80a90e);
			}
			level.var_ff453c39.var_d80a90e[level.var_ff453c39.var_d80a90e.size] = e_player.var_ff453c39.var_d80a90e;
		}
		foreach(e_player in level.players)
		{
			e_player.var_ff453c39.var_c17bb43c = Array::random(level.var_ff453c39.var_c17bb43c);
			e_player.var_ff453c39.var_33832377 = Array::random(level.var_ff453c39.var_33832377);
			e_player.var_ff453c39.var_d80a90e = Array::random(level.var_ff453c39.var_d80a90e);
			ArrayRemoveValue(level.var_ff453c39.var_c17bb43c, e_player.var_ff453c39.var_c17bb43c);
			ArrayRemoveValue(level.var_ff453c39.var_33832377, e_player.var_ff453c39.var_33832377);
			ArrayRemoveValue(level.var_ff453c39.var_d80a90e, e_player.var_ff453c39.var_d80a90e);
		}
	#/
}

