#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_one_inch_punch;
#include scripts\zm\zm_tomb_chamber;
#include scripts\zm\zm_tomb_ee_main;
#include scripts\zm\zm_tomb_utility;
#include scripts\zm\zm_tomb_vo;

#namespace zm_tomb_ee_main_step_6;

/*
	Name: init
	Namespace: zm_tomb_ee_main_step_6
	Checksum: 0x424F4353
	Offset: 0x3E0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 27
*/
function init()
{
	zm_sidequests::declare_sidequest_stage("little_girl_lost", "step_6", &init_stage, &stage_logic, &exit_stage);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: init_stage
	Namespace: zm_tomb_ee_main_step_6
	Checksum: 0x424F4353
	Offset: 0x440
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function init_stage()
{
	level.var_29735471 = [];
	level.var_29735471["fire"] = level.var_4f241554;
	level.var_29735471["air"] = level.var_e27d2514;
	level.var_29735471["lightning"] = level.var_590c486e;
	level.var_29735471["ice"] = level.var_af96dd85;
	level.var_29735471["upgraded"] = level.var_75ef78a0;
	level._cur_stage_name = "step_6";
	zm_spawner::add_custom_zombie_spawn_logic(&ruins_fist_glow_monitor);
	return;
}

/*
	Name: stage_logic
	Namespace: zm_tomb_ee_main_step_6
	Checksum: 0x424F4353
	Offset: 0x518
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 68
*/
function stage_logic()
{
	level flag::wait_till("ee_all_players_upgraded_punch");
	util::wait_network_frame();
	zm_sidequests::stage_completed("little_girl_lost", level._cur_stage_name);
}

/*
	Name: exit_stage
	Namespace: zm_tomb_ee_main_step_6
	Checksum: 0x424F4353
	Offset: 0x578
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 85
*/
function exit_stage(success)
{
	level notify("hash_ee01811f");
}

/*
	Name: ruins_fist_glow_monitor
	Namespace: zm_tomb_ee_main_step_6
	Checksum: 0x424F4353
	Offset: 0x5A0
	Size: 0x240
	Parameters: 0
	Flags: None
	Line Number: 100
*/
function ruins_fist_glow_monitor()
{
	if(level flag::get("ee_all_players_upgraded_punch"))
	{
		return;
	}
	if(isdefined(self.zone_name) && self.zone_name == "ug_bottom_zone")
	{
		wait(0.1);
		self clientfield::set("ee_zombie_fist_fx", 1);
		self.has_soul = 1;
		while(isalive(self))
		{
			self waittill("damage", amount, inflictor, direction, point, type, tagName, modelName, partName, weapon, iDFlags);
			if(!isdefined(inflictor.n_ee_punch_souls))
			{
				inflictor.n_ee_punch_souls = 0;
				inflictor.b_punch_upgraded = 0;
			}
			if(self.has_soul && inflictor.n_ee_punch_souls < 20 && isdefined(weapon) && weapon == level.var_653c9585 && (isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area))
			{
				self clientfield::set("ee_zombie_fist_fx", 0);
				self.has_soul = 0;
				playsoundatposition("zmb_squest_punchtime_punched", self.origin);
				inflictor.n_ee_punch_souls++;
				if(inflictor.n_ee_punch_souls == 20)
				{
					level thread spawn_punch_upgrade_tablet(self.origin, inflictor);
				}
			}
		}
	}
}

/*
	Name: spawn_punch_upgrade_tablet
	Namespace: zm_tomb_ee_main_step_6
	Checksum: 0x424F4353
	Offset: 0x7E8
	Size: 0x4F0
	Parameters: 2
	Flags: None
	Line Number: 144
*/
function spawn_punch_upgrade_tablet(v_origin, e_player)
{
	m_tablet = spawn("script_model", v_origin + VectorScale((0, 0, 1), 50));
	m_tablet SetModel("p7_zm_ori_tablet_stone");
	m_fx = spawn("script_model", m_tablet.origin);
	m_fx SetModel("tag_origin");
	m_fx SetInvisibleToAll();
	m_fx setvisibletoplayer(e_player);
	m_tablet LinkTo(m_fx);
	PlayFXOnTag(level._effect["special_glow"], m_fx, "tag_origin");
	m_fx thread rotate_punch_upgrade_tablet();
	m_tablet PlayLoopSound("zmb_squest_punchtime_tablet_loop", 0.5);
	m_tablet SetInvisibleToAll();
	m_tablet setvisibletoplayer(e_player);
	while(isdefined(e_player) && !e_player istouching(m_tablet))
	{
		wait(0.05);
	}
	m_tablet delete();
	m_fx delete();
	e_player playsound("zmb_squest_punchtime_tablet_pickup");
	if(isdefined(e_player))
	{
		e_player thread hud::fade_to_black_for_x_sec(0, 0.3, 0.5, 0.5, "white");
		a_zombies = GetAISpeciesArray(level.zombie_team, "all");
		foreach(zombie in a_zombies)
		{
			if(Distance2DSquared(e_player.origin, zombie.origin) < 65536 && (!(isdefined(zombie.is_mechz) && zombie.is_mechz)) && (!(isdefined(zombie.missingLegs) && zombie.missingLegs)) && (isdefined(zombie.completed_emerging_into_playable_area) && zombie.completed_emerging_into_playable_area))
			{
				zombie.v_punched_from = e_player.origin;
				zombie animcustom(&_zm_weap_one_inch_punch::knockdown_zombie_animate);
			}
		}
		wait(1);
		e_player.b_punch_upgraded = 1;
		e_player thread one_inch_punch_melee_attack();
		a_players = GetPlayers();
		foreach(player in a_players)
		{
			if(!isdefined(player.b_punch_upgraded) || !player.b_punch_upgraded)
			{
				return;
			}
		}
		level flag::set("ee_all_players_upgraded_punch");
	}
}

/*
	Name: function_a39b57a4
	Namespace: zm_tomb_ee_main_step_6
	Checksum: 0x424F4353
	Offset: 0xCE0
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 202
*/
function function_a39b57a4()
{
	self endon("disconnect");
	self endon("death");
	self notify("hash_a39b57a4");
	self endon("hash_a39b57a4");
	while(1)
	{
		self waittill("weapon_change");
		self.str_punch_element = self function_5436676a();
		var_b935cea8 = level.var_29735471[self.str_punch_element];
		if(!self hasweapon(var_b935cea8))
		{
			self GiveWeapon(level.var_29735471[self.str_punch_element]);
		}
		self zm_utility::set_player_melee_weapon(level.var_29735471[self.str_punch_element]);
	}
}

/*
	Name: function_39f1722a
	Namespace: zm_tomb_ee_main_step_6
	Checksum: 0x424F4353
	Offset: 0xDD8
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 231
*/
function function_39f1722a()
{
	var_294d0f22 = Array(level.var_653c9585, level.var_4f241554, level.var_e27d2514, level.var_590c486e, level.var_af96dd85, level.var_75ef78a0, level.var_9d7b544c, level.var_ee516197);
	foreach(var_8b64e473 in var_294d0f22)
	{
		self TakeWeapon(var_8b64e473);
	}
}

/*
	Name: one_inch_punch_melee_attack
	Namespace: zm_tomb_ee_main_step_6
	Checksum: 0x424F4353
	Offset: 0xED0
	Size: 0x350
	Parameters: 0
	Flags: None
	Line Number: 250
*/
function one_inch_punch_melee_attack()
{
	self endon("disconnect");
	self endon("death");
	self endon("stop_one_inch_punch_attack");
	if(!(isdefined(self.one_inch_punch_flag_has_been_init) && self.one_inch_punch_flag_has_been_init))
	{
		self flag::init("melee_punch_cooldown");
	}
	self.one_inch_punch_flag_has_been_init = 1;
	self.widows_wine_knife_override = &_zm_weap_one_inch_punch::widows_wine_knife_override;
	current_melee_weapon = self zm_utility::get_player_melee_weapon();
	self TakeWeapon(current_melee_weapon);
	if(isdefined(self.b_punch_upgraded) && self.b_punch_upgraded)
	{
		w_weapon = self GetCurrentWeapon();
		self zm_utility::disable_player_move_states(1);
		self GiveWeapon(level.var_ee516197);
		self SwitchToWeapon(level.var_ee516197);
		self util::waittill_any("player_downed", "weapon_change_complete");
		self SwitchToWeapon(w_weapon);
		self zm_utility::enable_player_move_states();
		self TakeWeapon(level.var_ee516197);
		self thread function_a39b57a4();
	}
	else
	{
		w_weapon = self GetCurrentWeapon();
		self zm_utility::disable_player_move_states(1);
		self GiveWeapon(level.var_9d7b544c);
		self SwitchToWeapon(level.var_9d7b544c);
		self util::waittill_any("player_downed", "weapon_change_complete");
		self SwitchToWeapon(w_weapon);
		self zm_utility::enable_player_move_states();
		self TakeWeapon(level.var_9d7b544c);
		self GiveWeapon(level.var_653c9585);
		self zm_utility::set_player_melee_weapon(level.var_653c9585);
		self thread zm_audio::create_and_play_dialog("perk", "one_inch");
	}
	self thread _zm_weap_one_inch_punch::monitor_melee_swipe();
}

/*
	Name: rotate_punch_upgrade_tablet
	Namespace: zm_tomb_ee_main_step_6
	Checksum: 0x424F4353
	Offset: 0x1228
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 302
*/
function rotate_punch_upgrade_tablet()
{
	self endon("death");
	while(1)
	{
		self RotateYaw(360, 5);
		self waittill("rotatedone");
	}
	return;
	waittillframeend;
}

/*
	Name: function_5436676a
	Namespace: zm_tomb_ee_main_step_6
	Checksum: 0x424F4353
	Offset: 0x1278
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 324
*/
function function_5436676a()
{
	if(self hasweapon(level.a_elemental_staffs_upgraded["staff_fire_upgraded"]))
	{
		return "fire";
	}
	if(self hasweapon(level.a_elemental_staffs_upgraded["staff_air_upgraded"]))
	{
		return "air";
	}
	if(self hasweapon(level.a_elemental_staffs_upgraded["staff_lightning_upgraded"]))
	{
		return "lightning";
	}
	if(self hasweapon(level.a_elemental_staffs_upgraded["staff_water_upgraded"]))
	{
		return "ice";
	}
	return "upgraded";
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ac7d02cc
	Namespace: zm_tomb_ee_main_step_6
	Checksum: 0x424F4353
	Offset: 0x1350
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 356
*/
function function_ac7d02cc(str_punch_element)
{
	if(isdefined(self.characterindex))
	{
		if(self.characterindex == 0 && str_punch_element == "lightning")
		{
			self thread function_88bbaa4(str_punch_element);
		}
		if(self.characterindex == 1 && str_punch_element == "fire")
		{
			self thread function_88bbaa4(str_punch_element);
		}
		if(self.characterindex == 2 && str_punch_element == "air")
		{
			self thread function_88bbaa4(str_punch_element);
		}
		if(self.characterindex == 3 && str_punch_element == "ice")
		{
			self thread function_88bbaa4(str_punch_element);
		}
	}
}

/*
	Name: function_88bbaa4
	Namespace: zm_tomb_ee_main_step_6
	Checksum: 0x424F4353
	Offset: 0x1458
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 389
*/
function function_88bbaa4(str_punch_element)
{
	level endon("end_game");
	self endon("disconnect");
	self endon("death");
	self endon("hash_2006a8c");
	while(isdefined(self))
	{
		self setcharacterbodystyle(3);
		if(!self hasweapon(GetWeapon(self function_5ec99915())))
		{
			self setcharacterbodystyle(0);
			self notify("hash_2006a8c");
		}
		wait(0.048);
	}
}

/*
	Name: function_5ec99915
	Namespace: zm_tomb_ee_main_step_6
	Checksum: 0x424F4353
	Offset: 0x1528
	Size: 0x6A
	Parameters: 0
	Flags: None
	Line Number: 417
*/
function function_5ec99915()
{
	switch(self.characterindex)
	{
		case 0:
		{
			return "staff_lightning_upgraded";
			break;
		}
		case 1:
		{
			return "staff_fire_upgraded";
			break;
		}
		case 2:
		{
			return "staff_air_upgraded";
			break;
		}
		case 3:
		{
			return "staff_water_upgraded";
			break;
		}
	}
}

