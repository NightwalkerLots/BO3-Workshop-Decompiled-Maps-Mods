#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_bc7ade0e;

/*
	Name: __init__sytem__
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x698
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 46
*/
function autoexec __init__sytem__()
{
	system::register("NOBEAR", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x6D8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function __init__()
{
	function_1a92256e();
}

/*
	Name: function_1a92256e
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x6F8
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_nobear", "customperk", 2000, &"ZM_REAP_MOD_PERK_NOBEAR", GetWeapon("zombie_perk_bottle_nobear"));
	zm_perks::register_perk_precache_func("specialty_nobear", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_nobear", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_nobear", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_nobear", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_nobear", "No Bear Brew", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_nobear", &"ZM_REAP_MOD_PERK_NOBEAR_DB", 2000, "No Bear Brew", "nobear", &function_3f3cba37, &function_8461f014);
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_nobear"] = 1;
	level.var_f24816b9 = [];
	level.chests = struct::get_array("treasure_chest_use", "targetname");
	Array::thread_all(level.chests, &function_543844c6);
	Array::thread_all(level.chests, &init_summon_box);
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x938
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 109
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_nobear"] = spawnstruct();
	level.machine_assets["specialty_nobear"].weapon = GetWeapon("zombie_perk_bottle_nobear");
	level.machine_assets["specialty_nobear"].off_model = "p7_zm_vending_nobear";
	level.machine_assets["specialty_nobear"].on_model = "p7_zm_vending_nobear_on";
}

/*
	Name: function_19157aff
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x9E0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 127
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x9F0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 141
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_nobear", "nobear", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0xA38
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 156
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_nobear_jingle";
	use_trigger.script_string = "specialty_nobear";
	use_trigger.script_label = "mus_perks_nobear_sting";
	use_trigger.target = "No Bear Brew";
	perk_machine.script_string = "specialty_nobear";
	perk_machine.targetname = "No Bear Brew";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_nobear";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0xB00
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 180
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_nobear"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_nobear"] = 1;
	level thread function_eef6bd7e();
	return;
}

/*
	Name: function_b4722825
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0xB98
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 210
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_nobear"] = 0;
	self.var_b5c2c258["specialty_nobear"] = undefined;
	self.var_d6aef449["specialty_nobear"] = undefined;
	return;
	continue;
}

/*
	Name: function_eef6bd7e
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0xBF8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 229
*/
function function_eef6bd7e()
{
	wait(1);
	if(isdefined(level.perk_random_machines))
	{
		for(i = 0; i < level.perk_random_machines.size; i++)
		{
			level.perk_random_machines[i] thread function_9a72a79d();
			level.perk_random_machines[i].unitrigger_stub.prompt_and_visibility_func = &perk_random_machine_trigger_update_prompt;
		}
		return;
	}
}

/*
	Name: function_9a72a79d
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0xC98
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 253
*/
function function_9a72a79d()
{
	self notify("hash_9a72a79d");
	self endon("hash_9a72a79d");
	while(1)
	{
		self waittill("trigger", player);
		if(player namespace_851dc78f::function_b690a849("specialty_nobear") && function_b8b0ef66() && self.stub.trigger_target.state == "away" && !isdefined(self.var_ab4a7a25))
		{
			self.var_ab4a7a25 = 1;
		}
		else if(player namespace_851dc78f::function_5f9a13b3("specialty_nobear"))
		{
			self.num_time_used = 0;
		}
	}
}

/*
	Name: function_543844c6
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0xD90
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 281
*/
function function_543844c6()
{
	while(1)
	{
		self waittill("trigger", User);
		if(isdefined(User) && User namespace_851dc78f::function_5f9a13b3("specialty_nobear"))
		{
			level.chest_accessed = 0;
			self.no_fly_away = 1;
			wait(2);
			self.no_fly_away = undefined;
		}
	}
}

/*
	Name: hack_trigger_think
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0xE10
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 306
*/
function hack_trigger_think(box)
{
	while(1)
	{
		if(isdefined(self))
		{
			players = GetPlayers();
			for(i = 0; i < players.size; i++)
			{
				player = players[i];
				qualifier_passed = box summon_box_qualifier(player);
				if(!player zm_equipment::hacker_active() && qualifier_passed && (!(isdefined(self.var_ab4a7a25) && self.var_ab4a7a25)))
				{
					self setinvisibletoplayer(player, 0);
					continue;
				}
				self setinvisibletoplayer(player, 1);
			}
			break;
		}
		else
		{
		}
		wait(0.1);
	}
}

/*
	Name: summon_box_qualifier
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0xF48
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 343
*/
function summon_box_qualifier(player)
{
	var_872e1a35 = level.chests[level.chest_index];
	if(!player namespace_851dc78f::function_b690a849("specialty_nobear"))
	{
		return 0;
	}
	if(!isalive(player))
	{
		return 0;
	}
	if(var_872e1a35 == self)
	{
		return 0;
	}
	if(isdefined(var_872e1a35.chest_user))
	{
		return 0;
	}
	if(player laststand::player_is_in_laststand())
	{
		return 0;
	}
	if(player zm_equipment::hacker_active())
	{
		return 0;
	}
	if(player throwbuttonpressed())
	{
		return 0;
	}
	if(player fragButtonPressed())
	{
		return 0;
	}
	if(isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]) && level.zombie_vars["zombie_powerup_fire_sale_on"])
	{
		return 0;
	}
	return 1;
}

/*
	Name: init_summon_box
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x1090
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 395
*/
function init_summon_box()
{
	wait(1);
	level flag::wait_till("start_zombie_round_logic");
	height = 72;
	radius = 80;
	trigger = spawn("trigger_radius_use", self.origin, 0, radius, height);
	trigger TriggerIgnoreTeam();
	trigger UseTriggerRequireLookAt();
	trigger setcursorhint("HINT_NOICON");
	trigger thread hack_trigger_think(self);
	trigger setHintString(&"ZM_REAP_MOD_PERK_NOBEAR_BOX");
	while(1)
	{
		trigger waittill("trigger", player);
		qualifier_passed = self summon_box_qualifier(player);
		if(qualifier_passed)
		{
			self thread function_c1e3a754(trigger);
		}
		wait(0.05);
	}
}

/*
	Name: function_c1e3a754
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x1210
	Size: 0x1E0
	Parameters: 1
	Flags: None
	Line Number: 429
*/
function function_c1e3a754(trigger)
{
	trigger.var_ab4a7a25 = 1;
	level.chests[level.chest_index] zm_magicbox::hide_chest();
	wait(1);
	index = -1;
	for(i = 0; i < level.chests.size; i++)
	{
		if(level.chests[i] == self)
		{
			index = i;
			break;
		}
	}
	level.chest_index = index;
	playFX(level._effect["poltergeist"], level.chests[level.chest_index].zbarrier.origin, anglesToUp(level.chests[level.chest_index].zbarrier.angles), AnglesToForward(level.chests[level.chest_index].zbarrier.angles));
	level.chests[level.chest_index] zm_magicbox::show_chest();
	level flag::clear("moving_chest_now");
	self.zbarrier.chest_moving = 0;
	level waittill("start_of_round");
	trigger.var_ab4a7a25 = 0;
}

/*
	Name: function_3f3cba37
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x13F8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 462
*/
function function_3f3cba37()
{
	self thread function_5a748fbd();
	return;
}

/*
	Name: function_8461f014
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x1420
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 478
*/
function function_8461f014()
{
	self notify("hash_8461f014");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5a748fbd
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x1440
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 495
*/
function function_5a748fbd()
{
	self notify("hash_5a748fbd");
	self endon("hash_5a748fbd");
	self endon("hash_8461f014");
	while(1)
	{
		wait(0.1);
		wait(randomIntRange(90, 150));
		var_872e1a35 = level.chests[level.chest_index];
		if(self namespace_851dc78f::function_b690a849("specialty_nobear") && (!(isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]) && level.zombie_vars["zombie_powerup_fire_sale_on"])) && isdefined(var_872e1a35) && !isdefined(var_872e1a35.chest_user))
		{
			if(Distance(self.origin, var_872e1a35.origin) < 350)
			{
				self zm_score::add_to_player_score(var_872e1a35.zombie_cost);
				var_872e1a35 notify("trigger", self);
				wait(randomIntRange(90, 150));
			}
		}
	}
}

/*
	Name: perk_random_machine_trigger_update_prompt
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x15A0
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 527
*/
function perk_random_machine_trigger_update_prompt(player)
{
	can_use = self perk_random_machine_stub_update_prompt(player);
	if(isdefined(self.hint_string))
	{
		if(isdefined(self.hint_parm1))
		{
			self setHintString(self.hint_string, self.hint_parm1);
		}
		else
		{
			self setHintString(self.hint_string);
		}
	}
	return can_use;
}

/*
	Name: perk_random_machine_stub_update_prompt
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x1638
	Size: 0x278
	Parameters: 1
	Flags: None
	Line Number: 554
*/
function perk_random_machine_stub_update_prompt(player)
{
	self setcursorhint("HINT_NOICON");
	if(!self trigger_visible_to_player(player))
	{
		return 0;
	}
	self.hint_parm1 = undefined;
	n_power_on = is_power_on(self.stub.script_int);
	if(!n_power_on)
	{
		self.hint_string = &"ZOMBIE_NEED_POWER";
		return 0;
	}
	else if(self.stub.trigger_target.state == "idle" || self.stub.trigger_target.state == "vending")
	{
		n_purchase_limit = player zm_utility::get_player_perk_purchase_limit();
		if(!player zm_utility::can_player_purchase_perk())
		{
			self.hint_string = &"ZOMBIE_RANDOM_PERK_TOO_MANY";
			if(isdefined(n_purchase_limit))
			{
				self.hint_parm1 = n_purchase_limit;
			}
			return 0;
		}
		else if(isdefined(self.stub.trigger_target.machine_user))
		{
			if(isdefined(self.stub.trigger_target.grab_perk_hint) && self.stub.trigger_target.grab_perk_hint)
			{
				self.hint_string = &"ZOMBIE_RANDOM_PERK_PICKUP";
				return 1;
			}
			else
			{
				self.hint_string = "";
				return 0;
			}
		}
		else
		{
			n_purchase_limit = player zm_utility::get_player_perk_purchase_limit();
			if(!player zm_utility::can_player_purchase_perk())
			{
				self.hint_string = &"ZOMBIE_RANDOM_PERK_TOO_MANY";
				if(isdefined(n_purchase_limit))
				{
					self.hint_parm1 = n_purchase_limit;
				}
				return 0;
			}
			else
			{
				self.hint_string = &"ZOMBIE_RANDOM_PERK_BUY";
				self.hint_parm1 = level._random_zombie_perk_cost;
				return 1;
			}
		}
	}
	else
	{
		self.hint_string = &"ZOMBIE_RANDOM_PERK_ELSEWHERE";
		return 0;
	}
}

/*
	Name: trigger_visible_to_player
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x18B8
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 630
*/
function trigger_visible_to_player(player)
{
	self setinvisibletoplayer(player);
	visible = 1;
	if(isdefined(self.stub.trigger_target.machine_user))
	{
		if(player != self.stub.trigger_target.machine_user || zm_utility::is_placeable_mine(self.stub.trigger_target.machine_user GetCurrentWeapon()))
		{
			visible = 0;
		}
	}
	else if(!player can_buy_perk())
	{
		visible = 0;
	}
	if(!visible)
	{
		return 0;
	}
	if(player player_has_all_available_perks())
	{
		return 0;
	}
	self setvisibletoplayer(player);
	return 1;
}

/*
	Name: player_has_all_available_perks
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x19E8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 667
*/
function player_has_all_available_perks()
{
	for(i = 0; i < level._random_perk_machine_perk_list.size; i++)
	{
		if(namespace_851dc78f::function_20dc5a15(level._random_perk_machine_perk_list[i]) && !self namespace_851dc78f::function_5f9a13b3(level._random_perk_machine_perk_list[i]) || (!namespace_851dc78f::function_20dc5a15(level._random_perk_machine_perk_list[i]) && !self hasPerk(level._random_perk_machine_perk_list[i])))
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: can_buy_perk
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x1AC0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 689
*/
function can_buy_perk()
{
	if(isdefined(self.IS_DRINKING) && self.IS_DRINKING > 0)
	{
		return 0;
	}
	current_weapon = self GetCurrentWeapon();
	if(zm_utility::is_placeable_mine(current_weapon) || zm_equipment::is_equipment_that_blocks_purchase(current_weapon))
	{
		return 0;
	}
	if(self zm_utility::in_revive_trigger())
	{
		return 0;
	}
	if(current_weapon == level.weaponNone)
	{
		return 0;
	}
	return 1;
}

/*
	Name: is_power_on
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x1B70
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 721
*/
function is_power_on(n_power_index)
{
	if(isdefined(n_power_index))
	{
		str_power = "power_on" + n_power_index;
		n_power_on = level flag::get(str_power);
	}
	else if(isdefined(level.zm_custom_perk_random_power_flag))
	{
		n_power_on = level flag::get(level.zm_custom_perk_random_power_flag);
	}
	else
	{
		n_power_on = level flag::get("power_on");
	}
	return n_power_on;
}

/*
	Name: function_b8b0ef66
	Namespace: namespace_bc7ade0e
	Checksum: 0x424F4353
	Offset: 0x1C30
	Size: 0x9A
	Parameters: 0
	Flags: None
	Line Number: 749
*/
function function_b8b0ef66()
{
	if(isdefined(level.var_6fca1652) && level.var_6fca1652)
	{
		return 0;
	}
	for(i = 0; i < level.perk_random_machines.size; i++)
	{
		if(level.perk_random_machines[i].current_perk_random_machine == 1)
		{
			if(level.perk_random_machines[i].state == "idle")
			{
				return 1;
			}
		}
	}
	return 0;
}

