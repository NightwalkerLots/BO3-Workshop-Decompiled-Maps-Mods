#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_cymbal_monkey;
#include scripts\zm\_zm_weap_dragon_gauntlet;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zm_stalingrad_vo;

#namespace namespace_e0675efb;

/*
	Name: __init__sytem__
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0xF08
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 34
*/
function autoexec __init__sytem__()
{
	system::register("zm_stalingrad_challenges", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0xF50
	Size: 0x228
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function __init__()
{
	clientfield::register("toplayer", "challenge_grave_fire", 12000, 2, "int");
	clientfield::register("scriptmover", "challenge_arm_reveal", 12000, 1, "counter");
	clientfield::register("toplayer", "pr_b", 12000, 3, "int");
	clientfield::register("toplayer", "pr_c", 12000, 3, "int");
	clientfield::register("toplayer", "pr_l_c", 12000, 1, "int");
	clientfield::register("missile", "pr_gm_e_fx", 12000, 1, "int");
	clientfield::register("scriptmover", "pr_g_c_fx", 12000, 1, "int");
	clientfield::register("toplayer", "challenge1state", 14000, 2, "int");
	clientfield::register("toplayer", "challenge2state", 14000, 2, "int");
	clientfield::register("toplayer", "challenge3state", 14000, 2, "int");
	level flag::init("pr_m");
	level flag::init("dragon_gauntlet_acquired");
}

/*
	Name: __main__
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x1180
	Size: 0x730
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function __main__()
{
	level._challenges = spawnstruct();
	level._challenges.var_4687355c = [];
	level._challenges.var_b88ea497 = [];
	level._challenges.var_928c2a2e = [];
	level thread function_b2413e04();
	Array::add(level._challenges.var_4687355c, function_970609e0(1, &"ZM_STALINGRAD_CHALLENGE_1_1", 10, "update_challenge_1_1", &function_960bfb56));
	Array::add(level._challenges.var_4687355c, function_970609e0(1, &"ZM_STALINGRAD_CHALLENGE_1_2", 3, "update_challenge_1_2", &function_f1c59ae));
	Array::add(level._challenges.var_4687355c, function_970609e0(1, &"ZM_STALINGRAD_CHALLENGE_1_3", 5, "update_challenge_1_3", &function_76bcffc2));
	Array::add(level._challenges.var_4687355c, function_970609e0(1, &"ZM_STALINGRAD_CHALLENGE_1_4", 3, "update_challenge_1_4", &function_dec401c2));
	Array::add(level._challenges.var_4687355c, function_970609e0(1, &"ZM_STALINGRAD_CHALLENGE_1_5", 5, "update_challenge_1_5", &function_c169b7dd));
	Array::add(level._challenges.var_4687355c, function_970609e0(1, &"ZM_STALINGRAD_CHALLENGE_1_6", 1, "update_challenge_1_6", &function_5efd7abf));
	Array::add(level._challenges.var_b88ea497, function_970609e0(2, &"ZM_STALINGRAD_CHALLENGE_2_1", 10, "update_challenge_2_1", &function_4322fb5f));
	Array::add(level._challenges.var_b88ea497, function_970609e0(2, &"ZM_STALINGRAD_CHALLENGE_2_2", 30, "update_challenge_2_2", &function_f427e9ad));
	Array::add(level._challenges.var_b88ea497, function_970609e0(2, &"ZM_STALINGRAD_CHALLENGE_2_3", 40, "update_challenge_2_3", &function_4e107409));
	Array::add(level._challenges.var_b88ea497, function_970609e0(2, &"ZM_STALINGRAD_CHALLENGE_2_4", 45, "update_challenge_2_4", &function_81adc498));
	Array::add(level._challenges.var_b88ea497, function_970609e0(2, &"ZM_STALINGRAD_CHALLENGE_2_5", 10, "update_challenge_2_5", &function_64e8cc03));
	Array::add(level._challenges.var_b88ea497, function_970609e0(2, &"ZM_STALINGRAD_CHALLENGE_2_6", 1, "update_challenge_2_6", &function_31d5f655));
	Array::add(level._challenges.var_928c2a2e, function_970609e0(3, &"ZM_STALINGRAD_CHALLENGE_3_1", 1, "update_challenge_3_1", &function_75fdfc25));
	Array::add(level._challenges.var_928c2a2e, function_970609e0(3, &"ZM_STALINGRAD_CHALLENGE_3_2", 3, "update_challenge_3_2", &function_2bf9f9d4));
	Array::add(level._challenges.var_928c2a2e, function_970609e0(3, &"ZM_STALINGRAD_CHALLENGE_3_3", 100, "update_challenge_3_3", &function_dcbd7aec));
	Array::add(level._challenges.var_928c2a2e, function_970609e0(3, &"ZM_STALINGRAD_CHALLENGE_3_4", 60, "update_challenge_3_4", &function_3d0619b6));
	Array::add(level._challenges.var_928c2a2e, function_970609e0(3, &"ZM_STALINGRAD_CHALLENGE_3_5", 6, "update_challenge_3_5", &function_cdeaa5f));
	Array::add(level._challenges.var_928c2a2e, function_970609e0(3, &"ZM_STALINGRAD_CHALLENGE_3_6", 6, "update_challenge_3_6", &function_e480fc42));
	callback::on_connect(&on_player_connect);
	callback::on_disconnect(&on_player_disconnect);
	callback::on_spawned(&on_player_spawned);
	level.get_player_perk_purchase_limit = &function_1adeaa1c;
	/#
		function_b9b4ce34();
	#/
}

/*
	Name: function_970609e0
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x18B8
	Size: 0xC8
	Parameters: 5
	Flags: None
	Line Number: 119
*/
function function_970609e0(n_challenge_index, var_3e1001b, n_challenge_count, str_challenge_notify, var_d675d6d8)
{
	if(!isdefined(var_d675d6d8))
	{
		var_d675d6d8 = undefined;
	}
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
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x1988
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 144
*/
function on_player_connect()
{
	level flag::wait_till("initial_blackscreen_passed");
	if(self GetEntityNumber() <= 3)
	{
		if(GetDvarInt("com_maxclients") <= 4)
		{
			self thread function_b7156b15();
			self thread function_4ca86c86();
		}
		else if(self GetEntityNumber() == 0)
		{
			self thread function_b7156b15();
			self thread function_4ca86c86();
		}
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x1A70
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 172
*/
function on_player_spawned()
{
	if(self GetEntityNumber() <= 3)
	{
		if(GetDvarInt("com_maxclients") <= 4)
		{
			self thread function_914c6e38();
			self thread function_99985d03();
			self thread function_be89247c();
		}
		else if(self GetEntityNumber() == 0)
		{
			self thread function_914c6e38();
			self thread function_99985d03();
			self thread function_be89247c();
		}
	}
}

/*
	Name: function_f21fcf6b
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x1B68
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 201
*/
function function_f21fcf6b()
{
	if(GetDvarInt("com_maxclients") <= 4)
	{
		return 1;
	}
	else if(self GetEntityNumber() == 0)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

/*
	Name: on_player_disconnect
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x1BC8
	Size: 0x268
	Parameters: 0
	Flags: None
	Line Number: 227
*/
function on_player_disconnect()
{
	if(self function_f21fcf6b())
	{
		if(!isdefined(level._challenges.var_4687355c))
		{
			level._challenges.var_4687355c = [];
		}
		else if(!IsArray(level._challenges.var_4687355c))
		{
			level._challenges.var_4687355c = Array(level._challenges.var_4687355c);
		}
		level._challenges.var_4687355c[level._challenges.var_4687355c.size] = self._challenges.var_4687355c;
		if(!isdefined(level._challenges.var_b88ea497))
		{
			level._challenges.var_b88ea497 = [];
		}
		else if(!IsArray(level._challenges.var_b88ea497))
		{
			level._challenges.var_b88ea497 = Array(level._challenges.var_b88ea497);
		}
		level._challenges.var_b88ea497[level._challenges.var_b88ea497.size] = self._challenges.var_b88ea497;
		if(!isdefined(level._challenges.var_928c2a2e))
		{
			level._challenges.var_928c2a2e = [];
		}
		else if(!IsArray(level._challenges.var_928c2a2e))
		{
			level._challenges.var_928c2a2e = Array(level._challenges.var_928c2a2e);
		}
		level._challenges.var_928c2a2e[level._challenges.var_928c2a2e.size] = self._challenges.var_928c2a2e;
		n_player_number = self GetEntityNumber();
		level notify("player_disconnected_" + n_player_number);
	}
}

/*
	Name: function_b7156b15
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x1E38
	Size: 0x5A0
	Parameters: 0
	Flags: None
	Line Number: 273
*/
function function_b7156b15()
{
	self endon("disconnect");
	self endon("death");
	self flag::init("flag_player_collected_reward_1");
	self flag::init("flag_player_collected_reward_2");
	self flag::init("flag_player_collected_reward_3");
	self flag::init("flag_player_collected_reward_4");
	self flag::init("flag_player_collected_reward_5");
	self flag::init("flag_player_completed_challenge_1");
	self flag::init("flag_player_completed_challenge_2");
	self flag::init("flag_player_completed_challenge_3");
	self flag::init("flag_player_completed_challenge_4");
	if(level flag::get("gauntlet_quest_complete"))
	{
		self flag::set("flag_player_completed_challenge_4");
	}
	self flag::init("flag_player_initialized_reward");
	level flag::wait_till("initial_players_connected");
	self._challenges = spawnstruct();
	self._challenges.var_4687355c = Array::random(level._challenges.var_4687355c);
	self._challenges.var_b88ea497 = Array::random(level._challenges.var_b88ea497);
	do
	{
		self._challenges.var_928c2a2e = Array::random(level._challenges.var_928c2a2e);
	}
	while(!(level flag::get("solo_game") && level.players.size == 1 && self._challenges.var_928c2a2e.str_notify == "update_challenge_3_4"));
	ArrayRemoveValue(level._challenges.var_4687355c, self._challenges.var_4687355c);
	ArrayRemoveValue(level._challenges.var_b88ea497, self._challenges.var_b88ea497);
	ArrayRemoveValue(level._challenges.var_928c2a2e, self._challenges.var_928c2a2e);
	self thread function_2ce855f3(self._challenges.var_4687355c);
	self thread function_2ce855f3(self._challenges.var_b88ea497);
	self thread function_2ce855f3(self._challenges.var_928c2a2e);
	self thread function_fbbc8608(self._challenges.var_4687355c.n_index, "flag_player_completed_challenge_1");
	self thread function_fbbc8608(self._challenges.var_b88ea497.n_index, "flag_player_completed_challenge_2");
	self thread function_fbbc8608(self._challenges.var_928c2a2e.n_index, "flag_player_completed_challenge_3");
	self thread function_974d5f1d();
	n_player_number = self GetEntityNumber();
	for(i = 1; i <= 4; i++)
	{
		self thread function_a2d25f82(i);
	}
	foreach(s_challenge in struct::get_array("s_challenge_trigger"))
	{
		if(s_challenge.script_int == n_player_number)
		{
			s_challenge function_4e61a018();
			break;
		}
	}
}

/*
	Name: function_914c6e38
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x23E0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 335
*/
function function_914c6e38()
{
	self clientfield::set_to_player("challenge_grave_fire", self GetEntityNumber());
	return;
	ERROR: Bad function call
}

/*
	Name: function_99985d03
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x2420
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 352
*/
function function_99985d03()
{
	self flag::clear("flag_player_collected_reward_" + 4);
}

/*
	Name: function_4e61a018
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x2450
	Size: 0x330
	Parameters: 0
	Flags: None
	Line Number: 367
*/
function function_4e61a018()
{
	self zm_unitrigger::create_unitrigger("", 128, &function_3ae0d6d5);
	self.s_unitrigger.require_look_at = 0;
	self.s_unitrigger.inactive_reassess_time = 0.1;
	zm_unitrigger::unitrigger_force_per_player_triggers(self.s_unitrigger, 1);
	self.var_b2a5207f = GetEnt("challenge_gravestone_" + self.script_int, "targetname");
	self.var_407ba908 = [];
	if(!isdefined(self.var_407ba908))
	{
		self.var_407ba908 = [];
	}
	else if(!IsArray(self.var_407ba908))
	{
		self.var_407ba908 = Array(self.var_407ba908);
	}
	self.var_407ba908[self.var_407ba908.size] = "ar_famas_upgraded";
	if(!isdefined(self.var_407ba908))
	{
		self.var_407ba908 = [];
	}
	else if(!IsArray(self.var_407ba908))
	{
		self.var_407ba908 = Array(self.var_407ba908);
	}
	self.var_407ba908[self.var_407ba908.size] = "ar_garand_upgraded";
	if(!isdefined(self.var_407ba908))
	{
		self.var_407ba908 = [];
	}
	else if(!IsArray(self.var_407ba908))
	{
		self.var_407ba908 = Array(self.var_407ba908);
	}
	self.var_407ba908[self.var_407ba908.size] = "smg_mp40_upgraded";
	if(!isdefined(self.var_407ba908))
	{
		self.var_407ba908 = [];
	}
	else if(!IsArray(self.var_407ba908))
	{
		self.var_407ba908 = Array(self.var_407ba908);
	}
	self.var_407ba908[self.var_407ba908.size] = "special_crossbow_dw_upgraded";
	if(!isdefined(self.var_407ba908))
	{
		self.var_407ba908 = [];
	}
	else if(!IsArray(self.var_407ba908))
	{
		self.var_407ba908 = Array(self.var_407ba908);
	}
	self.var_407ba908[self.var_407ba908.size] = "launcher_multi_upgraded";
	self.var_407ba908 = Array::randomize(self.var_407ba908);
	self.var_d86e8be = 0;
	self thread function_424b6fe8();
	return;
	~self.var_d86e8be;
}

/*
	Name: function_fbbc8608
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x2788
	Size: 0x130
	Parameters: 2
	Flags: None
	Line Number: 437
*/
function function_fbbc8608(n_challenge_index, var_d4adfa57)
{
	self endon("disconnect");
	self endon("death");
	self flag::wait_till(var_d4adfa57);
	challenge_description = "";
	if(n_challenge_index == 1)
	{
		challenge_description = self._challenges.var_4687355c.str_info;
	}
	else if(n_challenge_index == 2)
	{
		challenge_description = self._challenges.var_b88ea497.str_info;
	}
	else
	{
		challenge_description = self._challenges.var_928c2a2e.str_info;
	}
	self LUINotifyEvent(&"trial_complete", 3, &"ZM_STALINGRAD_CHALLENGE_COMPLETE", challenge_description, n_challenge_index - 1);
	level scoreevents::processScoreEvent("solo_challenge_stalingrad", self);
}

/*
	Name: function_e8547a5b
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x28C0
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 469
*/
function function_e8547a5b(str_challenge)
{
	if(self.var_f121cc22 !== str_challenge)
	{
		self.var_f121cc22 = str_challenge;
		self LUINotifyEvent(&"trial_set_description", 1, self.var_f121cc22);
	}
}

/*
	Name: function_27f6c3cd
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x2920
	Size: 0x120
	Parameters: 2
	Flags: None
	Line Number: 488
*/
function function_27f6c3cd(player, n_challenge_index)
{
	switch(n_challenge_index)
	{
		case 1:
		{
			player function_e8547a5b(player._challenges.var_4687355c.str_info);
			break;
		}
		case 2:
		{
			player function_e8547a5b(player._challenges.var_b88ea497.str_info);
			break;
		}
		case 3:
		{
			player function_e8547a5b(player._challenges.var_928c2a2e.str_info);
			break;
		}
		case 4:
		{
			player function_e8547a5b(player function_a107e8a5());
		}
	}
}

/*
	Name: function_33e91747
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x2A48
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 524
*/
function function_33e91747(n_challenge_index, var_fe2fb4b9)
{
	self clientfield::set_to_player("challenge" + n_challenge_index + "state", var_fe2fb4b9);
}

/*
	Name: function_23c9ffd3
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x2A98
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 539
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
	Name: function_3ae0d6d5
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x2B60
	Size: 0x5D8
	Parameters: 1
	Flags: None
	Line Number: 568
*/
function function_3ae0d6d5(e_player)
{
	if(self.stub.related_parent.script_int == e_player GetEntityNumber())
	{
		if(e_player flag::get("flag_player_initialized_reward"))
		{
			self function_cb2c15eb(e_player, &"ZM_STALINGRAD_CHALLENGE_REWARD_TAKE");
			if(self.stub.related_parent.mdl_reward.var_15fa438f == 2)
			{
				w_current = e_player GetCurrentWeapon();
				if(zm_utility::is_placeable_mine(w_current) || zm_equipment::is_equipment(w_current) || w_current == level.weaponNone || (isdefined(w_current.isHeroWeapon) && w_current.isHeroWeapon) || (isdefined(w_current.isgadget) && w_current.isgadget))
				{
					self function_cb2c15eb(e_player, "");
					return 0;
				}
			}
			else if(self.stub.related_parent.mdl_reward.var_15fa438f == 3)
			{
				a_perks = e_player GetPerks();
				if(a_perks.size == level._custom_perks.size)
				{
					self function_cb2c15eb(e_player, "");
					return 0;
				}
			}
			return 1;
		}
		for(i = 1; i <= 4; i++)
		{
			var_18c0ce2f = self.stub.related_parent.var_b2a5207f GetTagOrigin("tag_0" + i);
			if(e_player function_3f67a723(var_18c0ce2f, 15, 0) && Distance(e_player.origin, self.stub.origin) < 500)
			{
				self function_27f6c3cd(e_player, i);
				e_player clientfield::set_player_uimodel("trialWidget.icon", i - 1);
				e_player clientfield::set_player_uimodel("trialWidget.visible", 1);
				if(i == 4)
				{
					e_player clientfield::set_player_uimodel("trialWidget.progress", e_player clientfield::get_player_uimodel("zmInventory.progress_egg"));
				}
				else
				{
					e_player clientfield::set_player_uimodel("trialWidget.progress", e_player.var_873a3e27[i]);
				}
				if(!e_player flag::get("flag_player_completed_challenge_" + i))
				{
					self function_cb2c15eb(e_player, "");
					e_player thread function_23c9ffd3(self);
					b_is_looking = 1;
					return 1;
				}
				if(!e_player flag::get("flag_player_collected_reward_" + i) && (!(isdefined(e_player.var_c981566c) && e_player.var_c981566c)))
				{
					self function_cb2c15eb(e_player, &"ZM_STALINGRAD_CHALLENGE_REWARD");
					e_player thread function_23c9ffd3(self);
					b_is_looking = 1;
					return 1;
				}
				self function_cb2c15eb(e_player, "");
				e_player thread function_23c9ffd3(self);
				b_is_looking = 1;
				return 1;
			}
		}
		if(e_player function_9ffe5c12())
		{
			self function_cb2c15eb(e_player, &"ZM_STALINGRAD_GRAVE_FIRE");
			e_player clientfield::set_player_uimodel("trialWidget.visible", 0);
			return 1;
		}
		self function_cb2c15eb(e_player, "");
		e_player clientfield::set_player_uimodel("trialWidget.visible", 0);
		return 0;
	}
	self function_cb2c15eb(e_player, "");
	return 0;
}

/*
	Name: function_3f67a723
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x3140
	Size: 0xB0
	Parameters: 4
	Flags: None
	Line Number: 655
*/
function function_3f67a723(origin, arc_angle_degrees, do_trace, e_ignore)
{
	if(!isdefined(arc_angle_degrees))
	{
		arc_angle_degrees = 90;
	}
	arc_angle_degrees = AbsAngleClamp360(arc_angle_degrees);
	dot = cos(arc_angle_degrees * 0.5);
	if(self util::is_player_looking_at(origin, dot, do_trace, e_ignore))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_424b6fe8
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x31F8
	Size: 0x490
	Parameters: 0
	Flags: None
	Line Number: 680
*/
function function_424b6fe8()
{
	while(1)
	{
		self waittill("trigger_activated", e_who);
		if(self.script_int == e_who GetEntityNumber())
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
				e_who clientfield::increment_to_player("interact_rumble");
				self.s_unitrigger.playertrigger[e_who.entity_num] function_cb2c15eb(e_who, "");
				e_who function_640cd978(self.mdl_reward);
				if(isdefined(self.mdl_reward))
				{
					self.mdl_reward delete();
				}
			}
			else
			{
				for(i = 1; i <= 4; i++)
				{
					var_18c0ce2f = self.var_b2a5207f GetTagOrigin("tag_0" + i);
					if(e_who function_3f67a723(var_18c0ce2f, 15, 0) && Distance(e_who.origin, self.origin) < 500)
					{
						if(isdefined(e_who.var_c981566c) && e_who.var_c981566c)
						{
							break;
						}
						if(e_who flag::get("flag_player_completed_challenge_" + i) && !e_who flag::get("flag_player_collected_reward_" + i))
						{
							e_who clientfield::increment_to_player("interact_rumble");
							self.s_unitrigger.playertrigger[e_who.entity_num] function_cb2c15eb(e_who, "");
							self function_1d22626(e_who, i);
							break;
						}
					}
				}
				if(e_who function_9ffe5c12())
				{
					self.s_unitrigger.playertrigger[e_who.entity_num] function_cb2c15eb(e_who, "");
					self function_1d22626(e_who, 5);
					e_who thread function_a231bc42();
				}
			}
		}
	}
}

/*
	Name: function_a2d25f82
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x3690
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 758
*/
function function_a2d25f82(var_15fa438f)
{
	self endon("disconnect");
	self endon("death");
	/#
		self endon("hash_f9ff0ae7");
	#/
	self flag::wait_till("flag_player_completed_challenge_" + var_15fa438f);
	self thread namespace_dcf9c464::function_73928e79();
}

/*
	Name: function_1d22626
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x3708
	Size: 0x3F0
	Parameters: 2
	Flags: None
	Line Number: 779
*/
function function_1d22626(e_player, var_15fa438f)
{
	e_player endon("disconnect");
	var_7bb343ef = VectorScale((0, 1, 0), 90);
	a_s_rewards = struct::get_array("s_challenge_reward", "targetname");
	foreach(var_4bcd3b3a in a_s_rewards)
	{
		if(var_4bcd3b3a.script_int == e_player GetEntityNumber())
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
			var_17b3dc96 = self.var_407ba908[self.var_d86e8be];
			if(self.var_d86e8be == self.var_407ba908.size - 1)
			{
				self.var_d86e8be = 0;
			}
			else
			{
				self.var_d86e8be++;
			}
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
		case 4:
		{
			var_17b3dc96 = "wpn_t7_zmb_dlc3_gauntlet_dragon_world";
			var_4bcd3b3a.var_e1513629 = VectorScale((1, 0, 0), 2);
			var_4bcd3b3a.var_b90d551 = VectorScale((-1, 0, 0), 100);
			break;
		}
		case 5:
		{
			var_17b3dc96 = "wpn_t7_zmb_monkey_bomb_world";
			var_4bcd3b3a.var_e1513629 = (0, 0, 1);
			var_4bcd3b3a.var_b90d551 = var_7bb343ef;
			break;
		}
	}
	e_player.var_c981566c = 1;
	self function_b1f54cb4(e_player, var_4bcd3b3a, var_17b3dc96, 30);
	self.mdl_reward clientfield::set("powerup_fx", 1);
	self.mdl_reward.var_15fa438f = var_15fa438f;
	e_player flag::set("flag_player_initialized_reward");
	self thread function_1ad9d1a0(e_player, -30);
}

/*
	Name: function_1ad9d1a0
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x3B00
	Size: 0x1A0
	Parameters: 2
	Flags: None
	Line Number: 857
*/
function function_1ad9d1a0(e_player, n_dist)
{
	self endon("hash_422dba45");
	self.mdl_hand MoveZ(n_dist, 12, 6);
	self.var_2a9b65c7 MoveZ(n_dist, 12, 6);
	self.var_79dc7980 MoveZ(n_dist, 12, 6);
	self.mdl_reward MoveZ(n_dist, 12, 6);
	self.mdl_hand PlayLoopSound("zmb_challenge_skel_arm_lp", 1);
	self.mdl_hand waittill("movedone");
	if(isdefined(e_player))
	{
		e_player flag::clear("flag_player_initialized_reward");
		e_player.var_c981566c = undefined;
	}
	if(isdefined(self.mdl_reward))
	{
		self.mdl_reward delete();
	}
	self.mdl_hand delete();
	self.var_2a9b65c7 delete();
	self.var_79dc7980 delete();
}

/*
	Name: function_b1f54cb4
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x3CA8
	Size: 0x530
	Parameters: 4
	Flags: None
	Line Number: 890
*/
function function_b1f54cb4(e_player, var_4bcd3b3a, var_17b3dc96, var_21d0cf95)
{
	var_f6c28cea = (2, 0, -6.5);
	var_e97ebb83 = (3.5, 0, -18.5);
	var_f39a667b = (1, 0, -1);
	var_48cc013c = VectorScale((1, 0, 0), 90);
	if(!isdefined(self.mdl_hand))
	{
		self.mdl_hand = util::spawn_model("c_zom_dlc1_skeleton_zombie_body_s_rarm", var_4bcd3b3a.origin, var_4bcd3b3a.angles);
		self.var_2a9b65c7 = util::spawn_model("p7_skulls_bones_arm_lower", var_4bcd3b3a.origin + var_f6c28cea, VectorScale((1, 0, 0), 180));
		self.var_79dc7980 = util::spawn_model("p7_skulls_bones_arm_lower", var_4bcd3b3a.origin + var_e97ebb83, VectorScale((1, 0, 0), 180));
	}
	else
	{
		self notify("hash_422dba45");
		self.mdl_hand StopLoopSound(0.25);
		self.mdl_hand moveto(var_4bcd3b3a.origin, 1);
		self.var_2a9b65c7 moveto(var_4bcd3b3a.origin + var_f6c28cea, 1);
		self.var_79dc7980 moveto(var_4bcd3b3a.origin + var_e97ebb83, 1);
		self.mdl_hand waittill("movedone");
		if(isdefined(self.mdl_hand.var_9cab68e0) && self.mdl_hand.var_9cab68e0)
		{
			self.mdl_hand.origin = self.mdl_hand.origin - var_f39a667b;
			self.mdl_hand.angles = self.mdl_hand.angles - var_48cc013c;
			self.mdl_hand.var_9cab68e0 = undefined;
		}
	}
	var_51a2f105 = var_4bcd3b3a.origin + var_4bcd3b3a.var_e1513629;
	var_9ef5a0dc = var_4bcd3b3a.angles + var_4bcd3b3a.var_b90d551;
	switch(var_17b3dc96)
	{
		case "ar_famas_upgraded":
		case "ar_garand_upgraded":
		case "launcher_multi_upgraded":
		case "smg_mp40_upgraded":
		case "special_crossbow_dw_upgraded":
		{
			self.mdl_reward = zm_utility::spawn_buildkit_weapon_model(e_player, GetWeapon(var_17b3dc96), undefined, var_51a2f105, var_9ef5a0dc);
			self.mdl_reward.str_weapon_name = var_17b3dc96;
			break;
		}
		case "wpn_t7_zmb_dlc3_gauntlet_dragon_world":
		{
			self.mdl_reward = util::spawn_model(var_17b3dc96, var_51a2f105, var_9ef5a0dc);
			self.mdl_hand.origin = self.mdl_hand.origin + var_f39a667b;
			self.mdl_hand.angles = self.mdl_hand.angles + var_48cc013c;
			self.mdl_hand.var_9cab68e0 = 1;
			break;
		}
		default
		{
			self.mdl_reward = util::spawn_model(var_17b3dc96, var_51a2f105, var_9ef5a0dc);
			break;
		}
	}
	self.mdl_hand MoveZ(var_21d0cf95, 1);
	self.var_2a9b65c7 MoveZ(var_21d0cf95, 1);
	self.var_79dc7980 MoveZ(var_21d0cf95, 1);
	self.mdl_reward MoveZ(var_21d0cf95, 1);
	self.mdl_hand playsound("zmb_challenge_skel_arm_up");
	wait(0.05);
	self.mdl_hand clientfield::increment("challenge_arm_reveal");
	self.mdl_hand waittill("movedone");
	self.mdl_hand clientfield::increment("challenge_arm_reveal");
}

/*
	Name: function_640cd978
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x41E0
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 966
*/
function function_640cd978(mdl_reward)
{
	switch(mdl_reward.var_15fa438f)
	{
		case 1:
		{
			level thread zm_powerups::specific_powerup_drop("full_ammo", self.origin);
			break;
		}
		case 2:
		{
			if(isdefined(mdl_reward.str_weapon_name))
			{
				w_reward = GetWeapon(mdl_reward.str_weapon_name);
			}
			self thread swap_weapon(w_reward);
			break;
		}
		case 3:
		{
			self thread function_6131520e();
			break;
		}
		case 4:
		{
			self namespace_2ef08cd1::function_99a68dd();
			self notify("hash_4e21f047");
			level flag::set("dragon_gauntlet_acquired");
			break;
		}
		case 5:
		{
			self function_c46e4bfe();
			break;
		}
	}
	self flag::set("flag_player_collected_reward_" + mdl_reward.var_15fa438f);
	if(mdl_reward.var_15fa438f > 0 && mdl_reward.var_15fa438f < 4)
	{
		self function_33e91747(mdl_reward.var_15fa438f, 2);
	}
	self flag::clear("flag_player_initialized_reward");
	self.var_c981566c = undefined;
}

/*
	Name: swap_weapon
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x43D0
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 1021
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
		self take_old_weapon_and_give_new(w_current, w_new);
	}
	else
	{
		self giveMaxAmmo(w_new);
		return;
	}
	w_new.var_0 = undefined;
}

/*
	Name: take_old_weapon_and_give_new
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x44E0
	Size: 0xD8
	Parameters: 2
	Flags: None
	Line Number: 1058
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
}

/*
	Name: function_3420bc2f
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x45C0
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 1080
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
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x46E0
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 1105
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
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x47F0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 1131
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
	Name: function_a107e8a5
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x4838
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 1151
*/
function function_a107e8a5()
{
	if(level flag::get("gauntlet_step_4_complete"))
	{
		return &"ZM_STALINGRAD_CHALLENGE_4_6";
	}
	if(level flag::get("gauntlet_step_3_complete"))
	{
		return &"ZM_STALINGRAD_CHALLENGE_4_5";
	}
	if(level flag::get("gauntlet_step_2_complete"))
	{
		return &"ZM_STALINGRAD_CHALLENGE_4_4";
	}
	if(level flag::get("egg_awakened"))
	{
		return &"ZM_STALINGRAD_CHALLENGE_4_3";
	}
	if(level flag::get("dragon_egg_acquired"))
	{
		return &"ZM_STALINGRAD_CHALLENGE_4_2";
	}
	return &"ZM_STALINGRAD_CHALLENGE_4_1";
}

/*
	Name: function_960bfb56
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x4918
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1186
*/
function function_960bfb56()
{
	self endon("disconnect");
	self endon("death");
	level.var_940aa0f3 = self;
	zm_spawner::register_zombie_death_event_callback(&function_f08cb3ce);
	self thread function_e425ba86();
	self flag::wait_till("flag_player_completed_challenge_1");
	zm_spawner::deregister_zombie_death_event_callback(&function_f08cb3ce);
	level.var_940aa0f3 = undefined;
}

/*
	Name: function_f08cb3ce
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x49C8
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1208
*/
function function_f08cb3ce(e_attacker)
{
	if(isdefined(self) && self.var_9a02a614 === "napalm" && e_attacker === level.var_940aa0f3)
	{
		if(zm_utility::is_headshot(self.damageWeapon, self.damagelocation, self.damageMod))
		{
			e_attacker notify("hash_c1783c94");
		}
	}
}

/*
	Name: function_e425ba86
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x4A48
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1229
*/
function function_e425ba86()
{
	self endon("hash_72d86ab9");
	self waittill("disconnect");
	zm_spawner::deregister_zombie_death_event_callback(&function_f08cb3ce);
	level.var_940aa0f3 = undefined;
}

/*
	Name: function_f1c59ae
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x4A98
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1247
*/
function function_f1c59ae()
{
	self endon("disconnect");
	self endon("death");
	self.var_c678bf7b = [];
	while(self.var_c678bf7b.size < 3)
	{
		self waittill("hash_2e47bc4a");
		if(!Array::contains(self.var_c678bf7b, level.var_9d19c7e))
		{
			Array::add(self.var_c678bf7b, level.var_9d19c7e);
			self notify("hash_337fabcf");
		}
	}
	self.var_c678bf7b = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_76bcffc2
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x4B40
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1276
*/
function function_76bcffc2()
{
	self endon("hash_72d86ab9");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("raz_arm_detach", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_d7d3166");
		}
	}
	return;
	~;
}

/*
	Name: function_dec401c2
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x4BB0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1303
*/
function function_dec401c2()
{
	self endon("disconnect");
	self endon("death");
	while(!self flag::get("flag_player_completed_challenge_1"))
	{
		self waittill("hash_2d087eca");
		self notify("hash_4f70cd59");
	}
}

/*
	Name: function_c169b7dd
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x4C10
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1324
*/
function function_c169b7dd()
{
	self endon("hash_72d86ab9");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("raz_mask_destroyed", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_296e52f0");
		}
	}
}

/*
	Name: function_5efd7abf
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x4C80
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1349
*/
function function_5efd7abf()
{
	self endon("disconnect");
	self endon("death");
	self endon("hash_72d86ab9");
	while(1)
	{
		self waittill("hash_690aad79");
		self thread function_8494f9a2();
	}
}

/*
	Name: function_8494f9a2
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x4CE0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1371
*/
function function_8494f9a2()
{
	self endon("player_downed");
	self endon("disconnect");
	self endon("death");
	self notify("hash_2dcfeeb9");
	self endon("hash_2dcfeeb9");
	wait(5);
	self notify("hash_9b75c22b");
	return;
	ERROR: Bad function call
}

/*
	Name: function_4322fb5f
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x4D40
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 1394
*/
function function_4322fb5f()
{
	self endon("disconnect");
	self endon("death");
	var_d0e8cd34 = GetEnt("finger_trap_slide_trigger", "targetname");
	level.var_7ee8825e = self;
	while(!self flag::get("flag_player_completed_challenge_2"))
	{
		self waittill("hash_ad9aba38");
		while(level flag::get("finger_trap_on") && !self flag::get("flag_player_completed_challenge_2"))
		{
			var_d0e8cd34 waittill("trigger", e_who);
			if(e_who === self && self IsSliding())
			{
				self function_2e7f6910();
			}
		}
	}
	level.var_7ee8825e = undefined;
}

/*
	Name: function_2e7f6910
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x4E78
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1425
*/
function function_2e7f6910()
{
	self endon("disconnect");
	self endon("death");
	self endon("hash_b7166543");
	var_ac9fe035 = 3;
	self util::delay_notify(var_ac9fe035, "stop_slide_kill_watcher");
	while(!self flag::get("flag_player_completed_challenge_2"))
	{
		self waittill("hash_2637f64f");
		self notify("hash_fb461733");
	}
}

/*
	Name: function_f427e9ad
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x4F20
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1449
*/
function function_f427e9ad()
{
	self endon("disconnect");
	self endon("death");
	level.var_7d70299a = self;
	zm_spawner::register_zombie_death_event_callback(&function_9903d501);
	self thread function_b44b0c5d();
	self flag::wait_till("flag_player_completed_challenge_2");
	zm_spawner::deregister_zombie_death_event_callback(&function_9903d501);
	level.var_7d70299a = undefined;
}

/*
	Name: function_9903d501
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x4FD0
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 1471
*/
function function_9903d501(e_attacker)
{
	if(isdefined(self) && self.damageWeapon === GetWeapon("dragonshield") && e_attacker === level.var_7d70299a)
	{
		e_attacker notify("hash_893ea7f8");
	}
}

/*
	Name: function_b44b0c5d
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5030
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1489
*/
function function_b44b0c5d()
{
	self endon("hash_98dae522");
	self waittill("disconnect");
	zm_spawner::deregister_zombie_death_event_callback(&function_9903d501);
	level.var_7d70299a = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4e107409
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5080
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1509
*/
function function_4e107409()
{
	self endon("hash_98dae522");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("hash_696f953");
		self notify("hash_af412261");
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_81adc498
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x50D8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1533
*/
function function_81adc498()
{
	self endon("disconnect");
	self endon("death");
	self.var_e34aa037 = 0;
	while(!self flag::get("flag_player_completed_challenge_2"))
	{
		self waittill("hash_3d742bf8");
		self notify("hash_6d4d866e");
	}
	self.var_e34aa037 = undefined;
}

/*
	Name: function_64e8cc03
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5150
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1556
*/
function function_64e8cc03()
{
	self endon("disconnect");
	self endon("death");
	level.var_33f7b0fc = self;
	zm_spawner::register_zombie_death_event_callback(&function_f99f9ce7);
	self thread function_f65cfb93();
	self flag::wait_till("flag_player_completed_challenge_2");
	zm_spawner::deregister_zombie_death_event_callback(&function_f99f9ce7);
	level.var_33f7b0fc = undefined;
	return;
}

/*
	Name: function_f99f9ce7
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5200
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1579
*/
function function_f99f9ce7(e_attacker)
{
	if(isdefined(self) && self.var_9a02a614 === "sparky" && e_attacker === level.var_33f7b0fc)
	{
		if(zm_utility::is_headshot(self.damageWeapon, self.damagelocation, self.damageMod))
		{
			e_attacker notify("hash_935000d7");
		}
	}
}

/*
	Name: function_f65cfb93
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5280
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1600
*/
function function_f65cfb93()
{
	self endon("hash_98dae522");
	self waittill("disconnect");
	zm_spawner::deregister_zombie_death_event_callback(&function_f99f9ce7);
	level.var_33f7b0fc = undefined;
}

/*
	Name: function_31d5f655
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x52D0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1618
*/
function function_31d5f655()
{
	self endon("hash_98dae522");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("hash_f7608efe", n_kill_count);
		if(n_kill_count >= 8)
		{
			self notify("hash_2148919c");
		}
	}
}

/*
	Name: function_75fdfc25
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5340
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1643
*/
function function_75fdfc25()
{
	self endon("hash_bedd5f8b");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("hash_2e47bc4a");
		self thread function_638f34fd();
	}
}

/*
	Name: function_638f34fd
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x53A0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1665
*/
function function_638f34fd()
{
	self endon("hash_4cea57aa");
	self endon("bled_out");
	self endon("disconnect");
	self endon("death");
	var_3275089e = 0;
	level waittill("between_round_over");
	while(var_3275089e < 4)
	{
		level waittill("end_of_round");
		var_3275089e++;
	}
	self notify("hash_2e126bd2");
}

/*
	Name: function_2bf9f9d4
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5430
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1691
*/
function function_2bf9f9d4()
{
	self endon("disconnect");
	self endon("death");
	self.var_f12fd515 = [];
	while(self.var_f12fd515.size < 3)
	{
		self waittill("hash_e442448", n_kill_count, str_location);
		if(n_kill_count >= 3)
		{
			if(!Array::contains(self.var_f12fd515, str_location))
			{
				Array::add(self.var_f12fd515, str_location);
				self notify("hash_80ff169");
			}
		}
	}
	self.var_f12fd515 = undefined;
}

/*
	Name: function_dcbd7aec
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x54F8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1721
*/
function function_dcbd7aec()
{
	self endon("disconnect");
	self endon("death");
	level.var_c6d8defd = self;
	zm_spawner::register_zombie_death_event_callback(&function_22664e38);
	self thread function_cf22215c();
	self flag::wait_till("flag_player_completed_challenge_3");
	zm_spawner::deregister_zombie_death_event_callback(&function_22664e38);
	level.var_c6d8defd = undefined;
}

/*
	Name: function_22664e38
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x55A8
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 1743
*/
function function_22664e38(e_attacker)
{
	if(isdefined(self) && (self.damageWeapon === GetWeapon("launcher_dragon_fire") || self.damageWeapon === GetWeapon("launcher_dragon_fire_upgraded")))
	{
		if(isdefined(e_attacker) && e_attacker.player === level.var_c6d8defd)
		{
			e_attacker.player notify("hash_e20d7700");
		}
	}
}

/*
	Name: function_cf22215c
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5648
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1764
*/
function function_cf22215c()
{
	self endon("hash_bedd5f8b");
	self waittill("disconnect");
	zm_spawner::deregister_zombie_death_event_callback(&function_22664e38);
	level.var_c6d8defd = undefined;
}

/*
	Name: function_3d0619b6
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5698
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1782
*/
function function_3d0619b6()
{
	self endon("disconnect");
	self endon("death");
	level.var_471bf3e9 = self;
	zm_spawner::register_zombie_death_event_callback(&function_b3fffcec);
	self thread function_c54980a6();
	self flag::wait_till("flag_player_completed_challenge_3");
	zm_spawner::deregister_zombie_death_event_callback(&function_b3fffcec);
	level.var_471bf3e9 = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b3fffcec
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5748
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1806
*/
function function_b3fffcec(e_attacker)
{
	if(isdefined(self) && self.damageWeapon === GetWeapon("turret_bo3_germans_zm_stalingrad"))
	{
		if(level.var_ffcc580a.var_3a61625b === level.var_471bf3e9)
		{
			level.var_471bf3e9 notify("hash_ec1ecfdf");
		}
	}
}

/*
	Name: function_c54980a6
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x57B8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1827
*/
function function_c54980a6()
{
	self endon("hash_bedd5f8b");
	self waittill("disconnect");
	zm_spawner::deregister_zombie_death_event_callback(&function_b3fffcec);
	level.var_471bf3e9 = undefined;
}

/*
	Name: function_cdeaa5f
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5808
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1845
*/
function function_cdeaa5f()
{
	self endon("hash_bedd5f8b");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("all_sentinel_arms_destroyed", b_same_arms_attacker, e_attacker);
		if(isdefined(b_same_arms_attacker) && b_same_arms_attacker && e_attacker === self)
		{
			self notify("hash_c61c5576");
		}
	}
}

/*
	Name: function_e480fc42
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5898
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1870
*/
function function_e480fc42()
{
	self endon("hash_bedd5f8b");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		level waittill("sentinel_camera_destroyed", e_attacker);
		if(e_attacker === self)
		{
			self notify("hash_a019db0d");
		}
	}
}

/*
	Name: function_2ce855f3
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5908
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 1895
*/
function function_2ce855f3(s_challenge)
{
	self endon("disconnect");
	self endon("death");
	/#
		self endon("hash_f9ff0ae7");
		self endon("Dev Block strings are not supported" + s_challenge.n_index);
	#/
	if(isdefined(s_challenge.var_c0e6cb4e))
	{
		self thread [[s_challenge.var_c0e6cb4e]]();
	}
	if(!isdefined(self.var_873a3e27))
	{
		self.var_873a3e27 = [];
	}
	self.var_873a3e27[s_challenge.n_index] = 0;
	n_challenge_count = s_challenge.n_count;
	var_ea184c3d = s_challenge.n_count;
	while(n_challenge_count > 0)
	{
		self waittill(s_challenge.str_notify);
		n_challenge_count--;
		self.var_873a3e27[s_challenge.n_index] = 1 - n_challenge_count / var_ea184c3d;
	}
	self flag::set("flag_player_completed_challenge_" + s_challenge.n_index);
	self thread function_c79e93d1();
	if(s_challenge.n_index > 0 && s_challenge.n_index < 4)
	{
		self function_33e91747(s_challenge.n_index, 1);
	}
}

/*
	Name: function_c79e93d1
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5AD8
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 1938
*/
function function_c79e93d1()
{
	a_flags = Array("flag_player_completed_challenge_1", "flag_player_completed_challenge_2", "flag_player_completed_challenge_3");
	foreach(flag in a_flags)
	{
		if(!self flag::get(flag))
		{
			self playsoundtoplayer("zmb_challenge_complete", self);
			return;
		}
	}
	self playsoundtoplayer("zmb_challenge_complete_all", self);
}

/*
	Name: function_974d5f1d
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5BE8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1962
*/
function function_974d5f1d()
{
	self endon("disconnect");
	self endon("death");
	a_flags = Array("flag_player_completed_challenge_1", "flag_player_completed_challenge_2", "flag_player_completed_challenge_3");
	self flag::wait_till_all(a_flags);
	self notify("hash_41370469");
}

/*
	Name: function_b2413e04
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5C70
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1981
*/
function function_b2413e04()
{
	var_fbc34b78 = GetEntArray("pr_g", "script_label");
	Array::run_all(var_fbc34b78, &Hide);
	level.var_b766c4a8 = 0;
	zm_spawner::register_zombie_death_event_callback(&function_60e1ca5f);
}

/*
	Name: function_60e1ca5f
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5D00
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 1999
*/
function function_60e1ca5f(e_attacker)
{
	if(isdefined(self) && (self.damageWeapon === level.weaponZMCymbalMonkey || self.damageWeapon === level.w_cymbal_monkey_upgraded) && isPlayer(e_attacker))
	{
		level.var_b766c4a8++;
		/#
			if(isdefined(level.var_f9c3fe97) && level.var_f9c3fe97)
			{
				level.var_b766c4a8 = 50;
			}
		#/
		if(level.var_b766c4a8 >= 50)
		{
			level thread function_d632a808(self.origin);
			zm_spawner::deregister_zombie_death_event_callback(&function_60e1ca5f);
			level.var_b766c4a8 = undefined;
		}
	}
}

/*
	Name: function_d632a808
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5DE8
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 2029
*/
function function_d632a808(var_51a2f105)
{
	var_dbd219ed = util::spawn_model("p7_zm_ctl_canteen", var_51a2f105 + VectorScale((0, 0, 1), 48));
	PlayFXOnTag(level._effect["drop_pod_reward_glow"], var_dbd219ed, "tag_origin");
	var_dbd219ed zm_unitrigger::create_unitrigger("");
	var_dbd219ed waittill("trigger_activated", e_who);
	e_who clientfield::increment_to_player("interact_rumble");
	var_dbd219ed zm_unitrigger::unregister_unitrigger(var_dbd219ed.s_unitrigger);
	var_dbd219ed delete();
	level flag::set("pr_m");
	return;
	ERROR: Bad function call
}

/*
	Name: function_4ca86c86
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x5F18
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 2053
*/
function function_4ca86c86()
{
	var_77797571 = struct::get_array("pr_b_spawn", "targetname");
	foreach(var_4af818ae in var_77797571)
	{
		if(var_4af818ae.script_int == self GetEntityNumber())
		{
			var_4af818ae thread function_d5da2be8(self);
		}
	}
	var_977659a7 = struct::get_array("pr_c_spawn", "targetname");
	foreach(var_238c2594 in var_977659a7)
	{
		if(var_238c2594.script_int == self GetEntityNumber())
		{
			var_238c2594 thread function_38091734(self);
		}
	}
	self thread function_1fa81bf0();
}

/*
	Name: function_be89247c
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x60F8
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 2084
*/
function function_be89247c()
{
	if(!(isdefined(self.b_has_bouquet) && self.b_has_bouquet))
	{
		self clientfield::set_to_player("pr_b", self GetEntityNumber());
	}
	else
	{
		self clientfield::set_to_player("pr_b", 4);
	}
	if(!(isdefined(self.b_has_candle) && self.b_has_candle))
	{
		self clientfield::set_to_player("pr_c", self GetEntityNumber());
	}
	else
	{
		self clientfield::set_to_player("pr_c", 4);
		return;
	}
}

/*
	Name: function_d5da2be8
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x61E8
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 2115
*/
function function_d5da2be8(var_7ee6d8e6)
{
	self zm_unitrigger::create_unitrigger("");
	while(1)
	{
		self waittill("trigger_activated", e_who);
		if(e_who == var_7ee6d8e6)
		{
			e_who.b_has_bouquet = 1;
			e_who clientfield::set_to_player("pr_b", 4);
			e_who playsound("zmb_bouquet_pickup");
			break;
		}
	}
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
}

/*
	Name: function_38091734
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x62C0
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 2142
*/
function function_38091734(var_7ee6d8e6)
{
	level endon("player_disconnected_" + self.script_int);
	var_7ee6d8e6 function_34a8c625(self);
	var_7ee6d8e6 clientfield::set_to_player("pr_l_c", 1);
	self zm_unitrigger::create_unitrigger("");
	while(1)
	{
		self waittill("trigger_activated", e_who);
		if(e_who == var_7ee6d8e6)
		{
			e_who.b_has_candle = 1;
			e_who clientfield::set_to_player("pr_c", 4);
			e_who playsound("zmb_candle_pickup");
			break;
		}
	}
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
}

/*
	Name: function_34a8c625
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x63E8
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 2172
*/
function function_34a8c625(s_candle)
{
	self endon("death");
	while(1)
	{
		self waittill("hash_10fa975d");
		var_7dda366c = self GetWeaponMuzzlePoint();
		var_9c5bd97c = self GetWeaponForwardDir();
		var_ae93125 = 1440000;
		var_cb78916d = s_candle.origin;
		var_8112eb05 = DistanceSquared(var_7dda366c, var_cb78916d);
		v_normal = VectorNormalize(var_cb78916d - var_7dda366c);
		n_dot = VectorDot(var_9c5bd97c, v_normal);
		if(var_8112eb05 <= var_ae93125 && 0 <= n_dot)
		{
			return;
		}
	}
}

/*
	Name: function_1fa81bf0
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x6528
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 2202
*/
function function_1fa81bf0()
{
	self endon("death");
	self endon("hash_8b3a62f7");
	a_s_rewards = struct::get_array("s_challenge_reward", "targetname");
	foreach(var_4bcd3b3a in a_s_rewards)
	{
		if(var_4bcd3b3a.script_int == self GetEntityNumber())
		{
			break;
		}
	}
	level flag::wait_till("pr_m");
	while(1)
	{
		self waittill("grenade_fire", grenade, weapon);
		if(weapon === level.weaponZMCymbalMonkey || weapon === level.w_cymbal_monkey_upgraded)
		{
			grenade waittill("stationary");
			var_31dc18aa = 1600;
			var_2931dc75 = DistanceSquared(grenade.origin, var_4bcd3b3a.origin);
			if(var_2931dc75 <= var_31dc18aa)
			{
				self.var_621ab6ef = 1;
				self function_14e16a1c(grenade);
				self.var_621ab6ef = undefined;
			}
		}
	}
}

/*
	Name: function_14e16a1c
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x6718
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 2243
*/
function function_14e16a1c(e_grenade)
{
	self endon("death");
	e_grenade endon("death");
	self waittill("hash_4c1b1a28");
	e_grenade clientfield::set("pr_gm_e_fx", 1);
	util::wait_network_frame();
	e_grenade delete();
	return;
}

/*
	Name: function_9ffe5c12
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x67A0
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 2264
*/
function function_9ffe5c12()
{
	if(level flag::get("pr_m") && (isdefined(self.b_has_bouquet) && self.b_has_bouquet) && (isdefined(self.b_has_candle) && self.b_has_candle) && (isdefined(self.var_621ab6ef) && self.var_621ab6ef) && !self flag::get("flag_player_collected_reward_5"))
	{
		var_36d214f8 = struct::get_array("challenge_fire_struct", "targetname");
		foreach(var_47398c71 in var_36d214f8)
		{
			if(var_47398c71.script_int == self GetEntityNumber())
			{
				if(self function_3f67a723(var_47398c71.origin, 15, 0) && Distance(self.origin, var_47398c71.origin) < 500)
				{
					return 1;
				}
			}
		}
	}
	return 0;
}

/*
	Name: function_a231bc42
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x6968
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 2293
*/
function function_a231bc42()
{
	self notify("hash_4c1b1a28");
	n_ent_num = self GetEntityNumber();
	mdl_bouquet = GetEnt("pr_g_b_" + n_ent_num, "targetname");
	mdl_bouquet show();
	mdl_candle = GetEnt("pr_g_c_" + n_ent_num, "targetname");
	mdl_candle show();
	mdl_candle clientfield::set("pr_g_c_fx", 1);
	var_eaad475 = GetEnt("pr_g_cn_" + n_ent_num, "targetname");
	var_eaad475 show();
	self waittill("disconnect");
	mdl_candle clientfield::set("pr_g_c_fx", 0);
	mdl_bouquet Hide();
	mdl_candle Hide();
	var_eaad475 Hide();
	return;
}

/*
	Name: function_c46e4bfe
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x6B10
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 2322
*/
function function_c46e4bfe()
{
	self notify("hash_8b3a62f7");
	level.zombie_weapons[level.weaponZMCymbalMonkey].is_in_box = 0;
	level.zombie_weapons[level.w_cymbal_monkey_upgraded].is_in_box = 1;
	self _zm_weap_cymbal_monkey::player_give_cymbal_monkey_upgraded();
}

/*
	Name: function_b9b4ce34
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x6B80
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 2340
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
		AddDebugCommand("Dev Block strings are not supported");
		if(GetDvarInt("Dev Block strings are not supported") > 0)
		{
			AddDebugCommand("Dev Block strings are not supported");
		}
	#/
}

/*
	Name: function_16ba3a1e
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x6C98
	Size: 0x510
	Parameters: 1
	Flags: None
	Line Number: 2368
*/
function function_16ba3a1e(cmd)
{
	/#
		switch(cmd)
		{
			case "Dev Block strings are not supported":
			{
				foreach(e_player in level.players)
				{
					e_player flag::set("Dev Block strings are not supported");
					e_player notify("hash_fb393ffe");
					e_player.var_873a3e27[1] = 1;
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
					e_player.var_873a3e27[2] = 1;
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
					e_player.var_873a3e27[3] = 1;
					e_player function_33e91747(3, 1);
				}
				return 1;
			}
			case "Dev Block strings are not supported":
			{
				foreach(e_player in level.players)
				{
					e_player flag::set("Dev Block strings are not supported");
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
			case "Dev Block strings are not supported":
			{
				foreach(e_player in level.players)
				{
					e_player function_f506b074();
				}
				return 1;
			}
		}
		return 0;
		return;
	#/
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_224232f4
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x71B0
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 2456
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
		self thread function_2ce855f3(self._challenges.var_4687355c);
		self thread function_2ce855f3(self._challenges.var_b88ea497);
		self thread function_2ce855f3(self._challenges.var_928c2a2e);
		for(i = 1; i <= 3; i++)
		{
			self thread function_a2d25f82(i);
		}
		return;
	#/
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dcfe1b91
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x7348
	Size: 0x458
	Parameters: 0
	Flags: None
	Line Number: 2488
*/
function function_dcfe1b91()
{
	/#
		foreach(e_player in level.players)
		{
			if(!isdefined(level._challenges.var_4687355c))
			{
				level._challenges.var_4687355c = [];
			}
			else if(!IsArray(level._challenges.var_4687355c))
			{
				level._challenges.var_4687355c = Array(level._challenges.var_4687355c);
			}
			level._challenges.var_4687355c[level._challenges.var_4687355c.size] = e_player._challenges.var_4687355c;
			if(!isdefined(level._challenges.var_b88ea497))
			{
				level._challenges.var_b88ea497 = [];
			}
			else if(!IsArray(level._challenges.var_b88ea497))
			{
				level._challenges.var_b88ea497 = Array(level._challenges.var_b88ea497);
			}
			level._challenges.var_b88ea497[level._challenges.var_b88ea497.size] = e_player._challenges.var_b88ea497;
			if(!isdefined(level._challenges.var_928c2a2e))
			{
				level._challenges.var_928c2a2e = [];
			}
			else if(!IsArray(level._challenges.var_928c2a2e))
			{
				level._challenges.var_928c2a2e = Array(level._challenges.var_928c2a2e);
			}
			level._challenges.var_928c2a2e[level._challenges.var_928c2a2e.size] = e_player._challenges.var_928c2a2e;
		}
		foreach(e_player in level.players)
		{
			e_player._challenges.var_4687355c = Array::random(level._challenges.var_4687355c);
			e_player._challenges.var_b88ea497 = Array::random(level._challenges.var_b88ea497);
			e_player._challenges.var_928c2a2e = Array::random(level._challenges.var_928c2a2e);
			ArrayRemoveValue(level._challenges.var_4687355c, e_player._challenges.var_4687355c);
			ArrayRemoveValue(level._challenges.var_b88ea497, e_player._challenges.var_b88ea497);
			ArrayRemoveValue(level._challenges.var_928c2a2e, e_player._challenges.var_928c2a2e);
		}
	#/
}

/*
	Name: function_f506b074
	Namespace: namespace_e0675efb
	Checksum: 0x424F4353
	Offset: 0x77A8
	Size: 0x3C
	Parameters: 0
	Flags: None
	Line Number: 2543
*/
function function_f506b074()
{
	/#
		level flag::set("Dev Block strings are not supported");
		self.b_has_bouquet = 1;
		self.b_has_candle = 1;
	#/
}

