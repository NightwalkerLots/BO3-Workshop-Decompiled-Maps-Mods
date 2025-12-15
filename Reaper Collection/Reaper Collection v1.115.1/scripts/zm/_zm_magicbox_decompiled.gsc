#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_daily_challenges;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace zm_magicbox;

/*
	Name: __init__sytem__
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x7B8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 33
*/
function autoexec __init__sytem__()
{
	system::register("zm_magicbox", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x800
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function __init__()
{
	level.start_chest_name = "start_chest";
	level._effect["lght_marker"] = "zombie/fx_weapon_box_marker_zmb";
	level._effect["lght_marker_flare"] = "zombie/fx_weapon_box_marker_fl_zmb";
	level._effect["poltergeist"] = "zombie/fx_barrier_buy_zmb";
	clientfield::register("zbarrier", "magicbox_open_glow", 1, 1, "int");
	clientfield::register("zbarrier", "magicbox_closed_glow", 1, 1, "int");
	clientfield::register("zbarrier", "zbarrier_show_sounds", 1, 1, "counter");
	clientfield::register("zbarrier", "zbarrier_leave_sounds", 1, 1, "counter");
	level thread magicbox_host_migration();
}

/*
	Name: __main__
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x948
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function __main__()
{
	if(!isdefined(level.chest_joker_model))
	{
		level.chest_joker_model = "p7_zm_teddybear";
	}
	if(!isdefined(level.magic_box_zbarrier_state_func))
	{
		level.magic_box_zbarrier_state_func = &process_magic_box_zbarrier_state;
	}
	if(!isdefined(level.magic_box_check_equipment))
	{
		level.magic_box_check_equipment = &default_magic_box_check_equipment;
	}
	wait(0.05);
	if(zm_utility::is_Classic())
	{
		level.chests = struct::get_array("treasure_chest_use", "targetname");
		treasure_chest_init(level.start_chest_name);
	}
}

/*
	Name: treasure_chest_init
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0xA10
	Size: 0x2F8
	Parameters: 1
	Flags: None
	Line Number: 103
*/
function treasure_chest_init(start_chest_name)
{
	level flag::init("moving_chest_enabled");
	level flag::init("moving_chest_now");
	level flag::init("chest_has_been_used");
	level.chest_moves = 0;
	level.chest_level = 0;
	if(level.chests.size == 0)
	{
		return;
	}
	for(i = 0; i < level.chests.size; i++)
	{
		level.chests[i].box_hacks = [];
		level.chests[i].orig_origin = level.chests[i].origin;
		level.chests[i] get_chest_pieces();
		if(isdefined(level.chests[i].zombie_cost))
		{
			level.chests[i].old_cost = level.chests[i].zombie_cost;
			continue;
		}
		level.chests[i].old_cost = 950;
	}
	if(!level.enable_magic)
	{
		foreach(Chest in level.chests)
		{
			Chest hide_chest();
		}
		return;
	}
	level.chest_accessed = 0;
	if(level.chests.size > 1)
	{
		level flag::set("moving_chest_enabled");
		level.chests = Array::randomize(level.chests);
	}
	else
	{
		level.chest_index = 0;
		level.chests[0].no_fly_away = 1;
	}
	init_starting_chest_location(start_chest_name);
	Array::thread_all(level.chests, &treasure_chest_think);
}

/*
	Name: init_starting_chest_location
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0xD10
	Size: 0x3D0
	Parameters: 1
	Flags: None
	Line Number: 159
*/
function init_starting_chest_location(start_chest_name)
{
	level.chest_index = 0;
	start_chest_found = 0;
	if(level.chests.size == 1)
	{
		start_chest_found = 1;
		if(isdefined(level.chests[level.chest_index].zbarrier))
		{
			level.chests[level.chest_index].zbarrier set_magic_box_zbarrier_state("initial");
			level.chests[level.chest_index] thread box_encounter_vo();
		}
	}
	else
	{
		for(i = 0; i < level.chests.size; i++)
		{
			if(isdefined(level.random_pandora_box_start) && level.random_pandora_box_start == 1)
			{
				if(start_chest_found || (isdefined(level.chests[i].start_exclude) && level.chests[i].start_exclude == 1))
				{
					level.chests[i] hide_chest();
				}
				else
				{
					level.chest_index = i;
					level.chests[level.chest_index].hidden = 0;
					if(isdefined(level.chests[level.chest_index].zbarrier))
					{
						level.chests[level.chest_index].zbarrier set_magic_box_zbarrier_state("initial");
						level.chests[level.chest_index] thread box_encounter_vo();
					}
					start_chest_found = 1;
					continue;
				}
			}
			if(start_chest_found || !isdefined(level.chests[i].script_noteworthy) || !IsSubStr(level.chests[i].script_noteworthy, start_chest_name))
			{
				level.chests[i] hide_chest();
				continue;
			}
			level.chest_index = i;
			level.chests[level.chest_index].hidden = 0;
			if(isdefined(level.chests[level.chest_index].zbarrier))
			{
				level.chests[level.chest_index].zbarrier set_magic_box_zbarrier_state("initial");
				level.chests[level.chest_index] thread box_encounter_vo();
			}
			start_chest_found = 1;
		}
	}
	if(!isdefined(level.pandora_show_func))
	{
		if(isdefined(level.custom_pandora_show_func))
		{
			level.pandora_show_func = level.custom_pandora_show_func;
		}
		else
		{
			level.pandora_show_func = &default_pandora_show_func;
		}
	}
	level.chests[level.chest_index] thread [[level.pandora_show_func]]();
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: set_treasure_chest_cost
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x10E8
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 237
*/
function set_treasure_chest_cost(cost)
{
	level.zombie_treasure_chest_cost = cost;
}

/*
	Name: get_chest_pieces
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x1108
	Size: 0x2A0
	Parameters: 0
	Flags: None
	Line Number: 252
*/
function get_chest_pieces()
{
	self.chest_box = GetEnt(self.script_noteworthy + "_zbarrier", "script_noteworthy");
	self.chest_rubble = [];
	rubble = GetEntArray(self.script_noteworthy + "_rubble", "script_noteworthy");
	for(i = 0; i < rubble.size; i++)
	{
		if(DistanceSquared(self.origin, rubble[i].origin) < 10000)
		{
			self.chest_rubble[self.chest_rubble.size] = rubble[i];
		}
	}
	self.zbarrier = GetEnt(self.script_noteworthy + "_zbarrier", "script_noteworthy");
	if(isdefined(self.zbarrier))
	{
		self.zbarrier ZBarrierPieceUseBoxRiseLogic(3);
		self.zbarrier ZBarrierPieceUseBoxRiseLogic(4);
	}
	self.unitrigger_stub = spawnstruct();
	self.unitrigger_stub.origin = self.origin + AnglesToRight(self.angles) * -22.5;
	self.unitrigger_stub.angles = self.angles;
	self.unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	self.unitrigger_stub.script_width = 104;
	self.unitrigger_stub.script_height = 50;
	self.unitrigger_stub.script_length = 45;
	self.unitrigger_stub.trigger_target = self;
	zm_unitrigger::unitrigger_force_per_player_triggers(self.unitrigger_stub, 1);
	self.unitrigger_stub.prompt_and_visibility_func = &boxtrigger_update_prompt;
	self.zbarrier.owner = self;
}

/*
	Name: boxtrigger_update_prompt
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x13B0
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 293
*/
function boxtrigger_update_prompt(player)
{
	can_use = self boxstub_update_prompt(player);
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
	Name: boxstub_update_prompt
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x1448
	Size: 0x198
	Parameters: 1
	Flags: None
	Line Number: 320
*/
function boxstub_update_prompt(player)
{
	if(!self trigger_visible_to_player(player))
	{
		return 0;
	}
	if(isdefined(level.func_magicbox_update_prompt_use_override))
	{
		if([[level.func_magicbox_update_prompt_use_override]]())
		{
			return 0;
		}
	}
	self.hint_parm1 = undefined;
	if(isdefined(self.stub.trigger_target.grab_weapon_hint) && self.stub.trigger_target.grab_weapon_hint)
	{
		cursor_hint = "HINT_WEAPON";
		cursor_hint_weapon = self.stub.trigger_target.grab_weapon;
		self setcursorhint(cursor_hint, cursor_hint_weapon);
		if(isdefined(level.magic_box_check_equipment) && [[level.magic_box_check_equipment]](cursor_hint_weapon))
		{
			self.hint_string = &"ZOMBIE_TRADE_EQUIP_FILL";
		}
		else
		{
			self.hint_string = &"ZOMBIE_TRADE_WEAPON_FILL";
		}
	}
	else
	{
		self setcursorhint("HINT_NOICON");
		self.hint_parm1 = self.stub.trigger_target.zombie_cost;
		self.hint_string = zm_utility::get_hint_string(self, "default_treasure_chest");
	}
	return 1;
}

/*
	Name: default_magic_box_check_equipment
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x15E8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 367
*/
function default_magic_box_check_equipment(weapon)
{
	return zm_utility::is_offhand_weapon(weapon);
}

/*
	Name: trigger_visible_to_player
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x1618
	Size: 0x190
	Parameters: 1
	Flags: None
	Line Number: 382
*/
function trigger_visible_to_player(player)
{
	self setinvisibletoplayer(player);
	visible = 1;
	if(isdefined(self.stub.trigger_target.chest_user) && !isdefined(self.stub.trigger_target.box_rerespun))
	{
		if(player != self.stub.trigger_target.chest_user || zm_utility::is_placeable_mine(self.stub.trigger_target.chest_user GetCurrentWeapon()) || self.stub.trigger_target.chest_user zm_equipment::hacker_active())
		{
			visible = 0;
		}
	}
	else if(!player can_buy_weapon())
	{
		visible = 0;
	}
	if(isdefined(level.var_4cfe011a))
	{
		visible = 0;
	}
	if(player bgb::is_enabled("zm_bgb_disorderly_combat"))
	{
		visible = 0;
	}
	if(!visible)
	{
		return 0;
	}
	self setvisibletoplayer(player);
	return 1;
}

/*
	Name: magicbox_unitrigger_think
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x17B0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 423
*/
function magicbox_unitrigger_think()
{
	self endon("kill_trigger");
	while(1)
	{
		self waittill("trigger", player);
		self.stub.trigger_target notify("trigger", player);
	}
}

/*
	Name: play_crazi_sound
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x1810
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 443
*/
function play_crazi_sound()
{
	self playlocalsound(level.zmb_laugh_alias);
}

/*
	Name: show_chest
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x1840
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 458
*/
function show_chest()
{
	self.zbarrier set_magic_box_zbarrier_state("arriving");
	self.zbarrier util::waittill_any_timeout(5, "arrived");
	self thread [[level.pandora_show_func]]();
	self.zbarrier clientfield::set("magicbox_closed_glow", 1);
	thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &magicbox_unitrigger_think);
	self.zbarrier clientfield::increment("zbarrier_show_sounds");
	self.hidden = 0;
	if(isdefined(self.box_hacks["summon_box"]))
	{
		self [[self.box_hacks["summon_box"]]](0);
	}
}

/*
	Name: hide_chest
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x1958
	Size: 0x220
	Parameters: 1
	Flags: None
	Line Number: 483
*/
function hide_chest(doBoxLeave)
{
	if(isdefined(self.unitrigger_stub))
	{
		thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
	}
	if(isdefined(self.pandora_light))
	{
		self.pandora_light delete();
	}
	self.zbarrier clientfield::set("magicbox_closed_glow", 0);
	self.hidden = 1;
	if(isdefined(self.box_hacks) && isdefined(self.box_hacks["summon_box"]))
	{
		self [[self.box_hacks["summon_box"]]](1);
	}
	if(isdefined(self.zbarrier))
	{
		if(isdefined(doBoxLeave) && doBoxLeave)
		{
			self.zbarrier clientfield::increment("zbarrier_leave_sounds");
			level thread zm_audio::sndAnnouncerPlayVox("boxmove");
			self.zbarrier thread magic_box_zbarrier_leave();
			self.zbarrier waittill("left");
			playFX(level._effect["poltergeist"], self.zbarrier.origin, anglesToUp(self.zbarrier.angles), AnglesToForward(self.zbarrier.angles));
			playsoundatposition("zmb_box_poof", self.zbarrier.origin);
		}
		else
		{
			self.zbarrier thread set_magic_box_zbarrier_state("away");
		}
	}
}

/*
	Name: magic_box_zbarrier_leave
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x1B80
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 527
*/
function magic_box_zbarrier_leave()
{
	self set_magic_box_zbarrier_state("leaving");
	self waittill("left");
	self set_magic_box_zbarrier_state("away");
}

/*
	Name: default_pandora_fx_func
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x1BD8
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 544
*/
function default_pandora_fx_func()
{
	self endon("death");
	self.pandora_light = spawn("script_model", self.zbarrier.origin);
	self.pandora_light.angles = self.zbarrier.angles + VectorScale((-1, 0, -1), 90);
	self.pandora_light SetModel("tag_origin");
	if(!(isdefined(level._box_initialized) && level._box_initialized))
	{
		level flag::wait_till("start_zombie_round_logic");
		level._box_initialized = 1;
	}
	wait(1);
	if(isdefined(self) && isdefined(self.pandora_light))
	{
		PlayFXOnTag(level._effect["lght_marker"], self.pandora_light, "tag_origin");
	}
}

/*
	Name: default_pandora_show_func
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x1D00
	Size: 0x98
	Parameters: 3
	Flags: None
	Line Number: 572
*/
function default_pandora_show_func(anchor, anchorTarget, pieces)
{
	if(!isdefined(self.pandora_light))
	{
		if(!isdefined(level.pandora_fx_func))
		{
			level.pandora_fx_func = &default_pandora_fx_func;
		}
		self thread [[level.pandora_fx_func]]();
	}
	playFX(level._effect["lght_marker_flare"], self.pandora_light.origin);
}

/*
	Name: unregister_unitrigger_on_kill_think
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x1DA0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 595
*/
function unregister_unitrigger_on_kill_think()
{
	self notify("unregister_unitrigger_on_kill_think");
	self endon("unregister_unitrigger_on_kill_think");
	self waittill("kill_chest_think");
	thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
}

/*
	Name: treasure_chest_think
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x1DF0
	Size: 0xDD0
	Parameters: 0
	Flags: None
	Line Number: 613
*/
function treasure_chest_think()
{
	self endon("kill_chest_think");
	User = undefined;
	user_cost = undefined;
	self.box_rerespun = undefined;
	self.weapon_out = undefined;
	self thread unregister_unitrigger_on_kill_think();
	while(1)
	{
		if(!isdefined(self.forced_user))
		{
			self waittill("trigger", User);
			if(User == level)
			{
				continue;
			}
		}
		else
		{
			User = self.forced_user;
		}
		if(User zm_utility::in_revive_trigger())
		{
			wait(0.1);
			continue;
		}
		if(User.IS_DRINKING > 0)
		{
			wait(0.1);
			continue;
		}
		if(isdefined(self.disabled) && self.disabled)
		{
			wait(0.1);
			continue;
		}
		if(User GetCurrentWeapon() == level.weaponNone)
		{
			wait(0.1);
			continue;
		}
		if(isdefined(self.being_removed) && self.being_removed)
		{
			wait(0.1);
			continue;
		}
		reduced_cost = undefined;
		if(isdefined(self.auto_open) && zm_utility::is_player_valid(User))
		{
			if(!isdefined(self.no_charge))
			{
				User zm_score::minus_to_player_score(self.zombie_cost);
				user_cost = self.zombie_cost;
			}
			else
			{
				user_cost = 0;
			}
			self.chest_user = User;
			break;
		}
		else if(zm_utility::is_player_valid(User) && User zm_score::can_player_purchase(self.zombie_cost))
		{
			User zm_score::minus_to_player_score(self.zombie_cost);
			user_cost = self.zombie_cost;
			self.chest_user = User;
			break;
		}
		else if(isdefined(reduced_cost) && User zm_score::can_player_purchase(reduced_cost))
		{
			User zm_score::minus_to_player_score(reduced_cost);
			user_cost = reduced_cost;
			self.chest_user = User;
			break;
		}
		else if(!User zm_score::can_player_purchase(self.zombie_cost))
		{
			zm_utility::play_sound_at_pos("no_purchase", self.origin);
			User zm_audio::create_and_play_dialog("general", "outofmoney");
			continue;
		}
		wait(0.05);
	}
	level flag::set("chest_has_been_used");
	demo::bookmark("zm_player_use_magicbox", GetTime(), User);
	User zm_stats::increment_client_stat("use_magicbox");
	User zm_stats::increment_player_stat("use_magicbox");
	User zm_stats::increment_challenge_stat("SURVIVALIST_BUY_MAGIC_BOX");
	User zm_daily_challenges::increment_magic_box();
	if(isdefined(level._magic_box_used_VO))
	{
		User thread [[level._magic_box_used_VO]]();
	}
	self thread watch_for_emp_close();
	self._box_open = 1;
	self._box_opened_by_fire_sale = 0;
	if(isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]) && level.zombie_vars["zombie_powerup_fire_sale_on"] && !isdefined(self.auto_open) && self [[level._zombiemode_check_firesale_loc_valid_func]]())
	{
		self._box_opened_by_fire_sale = 1;
	}
	if(isdefined(self.chest_lid))
	{
		self.chest_lid thread treasure_chest_lid_open();
	}
	if(isdefined(self.zbarrier))
	{
		zm_utility::play_sound_at_pos("open_chest", self.origin);
		zm_utility::play_sound_at_pos("music_chest", self.origin);
		self.zbarrier set_magic_box_zbarrier_state("open");
	}
	self.timedOut = 0;
	self.weapon_out = 1;
	self.zbarrier thread treasure_chest_weapon_spawn(self, User);
	if(isdefined(level.custom_treasure_chest_glowfx))
	{
		self.zbarrier thread [[level.custom_treasure_chest_glowfx]]();
	}
	else
	{
		self.zbarrier thread treasure_chest_glowfx();
	}
	thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
	self.zbarrier util::waittill_any("randomization_done", "box_hacked_respin");
	if(level flag::get("moving_chest_now") && !self._box_opened_by_fire_sale && isdefined(user_cost))
	{
		User zm_score::add_to_player_score(user_cost, 0, "magicbox_bear");
	}
	if(level flag::get("moving_chest_now") && !level.zombie_vars["zombie_powerup_fire_sale_on"] && !self._box_opened_by_fire_sale)
	{
		self thread treasure_chest_move(self.chest_user);
	}
	else if(!(isdefined(self.unbearable_respin) && self.unbearable_respin))
	{
		self.grab_weapon_hint = 1;
		self.grab_weapon = self.zbarrier.weapon;
		self.chest_user = User;
		weaponIdx = undefined;
		if(isdefined(self.grab_weapon))
		{
			weaponIdx = MatchRecordGetWeaponIndex(self.grab_weapon);
		}
		if(isdefined(weaponIdx))
		{
			User RecordMapEvent(10, GetTime(), User.origin, level.round_number, weaponIdx);
		}
		thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &magicbox_unitrigger_think);
		if(isdefined(self.zbarrier) && (!(isdefined(self.zbarrier.closed_by_emp) && self.zbarrier.closed_by_emp)))
		{
			self thread treasure_chest_timeout();
		}
	}
	while(!(isdefined(self.closed_by_emp) && self.closed_by_emp))
	{
		self waittill("trigger", grabber);
		self.weapon_out = undefined;
		if(isdefined(level.magic_box_grab_by_anyone) && level.magic_box_grab_by_anyone)
		{
			if(isPlayer(grabber))
			{
				User = grabber;
			}
		}
		if(isdefined(grabber.IS_DRINKING) && grabber.IS_DRINKING > 0)
		{
			wait(0.1);
			continue;
		}
		if(grabber == User && User GetCurrentWeapon() == level.weaponNone)
		{
			wait(0.1);
			continue;
		}
		if(grabber != level && (isdefined(self.box_rerespun) && self.box_rerespun))
		{
			User = grabber;
		}
		if(grabber == User || grabber == level)
		{
			self.box_rerespun = undefined;
			current_weapon = level.weaponNone;
			if(zm_utility::is_player_valid(User))
			{
				current_weapon = User GetCurrentWeapon();
			}
			if(grabber == User && zm_utility::is_player_valid(User) && !User.IS_DRINKING > 0 && !zm_utility::is_placeable_mine(current_weapon) && !zm_equipment::is_equipment(current_weapon) && !User zm_utility::is_player_revive_tool(current_weapon) && !current_weapon.isHeroWeapon && !current_weapon.isgadget)
			{
				weaponIdx = undefined;
				if(isdefined(self.zbarrier) && isdefined(self.zbarrier.weapon))
				{
					weaponIdx = MatchRecordGetWeaponIndex(self.zbarrier.weapon);
				}
				if(isdefined(weaponIdx))
				{
					User RecordMapEvent(11, GetTime(), User.origin, level.round_number, weaponIdx);
				}
				self notify("user_grabbed_weapon");
				User notify("user_grabbed_weapon");
				User thread treasure_chest_give_weapon(self.zbarrier.weapon);
				demo::bookmark("zm_player_grabbed_magicbox", GetTime(), User);
				User zm_stats::increment_client_stat("grabbed_from_magicbox");
				User zm_stats::increment_player_stat("grabbed_from_magicbox");
				break;
			}
			else if(grabber == level)
			{
				self.timedOut = 1;
				weaponIdx = undefined;
				if(isdefined(self.zbarrier) && isdefined(self.zbarrier.weapon))
				{
					weaponIdx = MatchRecordGetWeaponIndex(self.zbarrier.weapon);
				}
				if(isdefined(weaponIdx))
				{
					User RecordMapEvent(12, GetTime(), User.origin, level.round_number, weaponIdx);
					break;
				}
			}
		}
		wait(0.05);
	}
	self.grab_weapon_hint = 0;
	self.zbarrier notify("weapon_grabbed");
	if(!(isdefined(self._box_opened_by_fire_sale) && self._box_opened_by_fire_sale))
	{
		level.chest_accessed = level.chest_accessed + 1;
	}
	thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
	if(isdefined(self.chest_lid))
	{
		self.chest_lid thread treasure_chest_lid_close(self.timedOut);
	}
	if(isdefined(self.zbarrier))
	{
		self.zbarrier set_magic_box_zbarrier_state("close");
		zm_utility::play_sound_at_pos("close_chest", self.origin);
		self.zbarrier waittill("closed");
		wait(1);
	}
	else
	{
		wait(3);
	}
	if(isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]) && level.zombie_vars["zombie_powerup_fire_sale_on"] && self [[level._zombiemode_check_firesale_loc_valid_func]]() || self == level.chests[level.chest_index])
	{
		thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &magicbox_unitrigger_think);
	}
	self._box_open = 0;
	self._box_opened_by_fire_sale = 0;
	self.unbearable_respin = undefined;
	self.chest_user = undefined;
	self notify("chest_accessed");
	self thread treasure_chest_think();
}

/*
	Name: watch_for_emp_close
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x2BC8
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 878
*/
function watch_for_emp_close()
{
	self endon("chest_accessed");
	self.closed_by_emp = 0;
	if(!zm_utility::should_watch_for_emp())
	{
		return;
	}
	if(isdefined(self.zbarrier))
	{
		self.zbarrier.closed_by_emp = 0;
	}
	while(1)
	{
		level waittill("emp_detonate", origin, radius);
		if(DistanceSquared(origin, self.origin) < radius * radius)
		{
			break;
		}
	}
	if(level flag::get("moving_chest_now"))
	{
		return;
	}
	self.closed_by_emp = 1;
	if(isdefined(self.zbarrier))
	{
		self.zbarrier.closed_by_emp = 1;
		self.zbarrier notify("box_hacked_respin");
		if(isdefined(self.zbarrier.weapon_model))
		{
			self.zbarrier.weapon_model notify("kill_weapon_movement");
		}
		if(isdefined(self.zbarrier.weapon_model_dw))
		{
			self.zbarrier.weapon_model_dw notify("kill_weapon_movement");
		}
	}
	wait(0.1);
	self notify("trigger", level);
}

/*
	Name: can_buy_weapon
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x2D58
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 930
*/
function can_buy_weapon()
{
	if(isdefined(self.IS_DRINKING) && self.IS_DRINKING > 0)
	{
		return 0;
	}
	if(self zm_equipment::hacker_active())
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
	if(current_weapon.isHeroWeapon || current_weapon.isgadget)
	{
		return 0;
	}
	return 1;
}

/*
	Name: default_box_move_logic
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x2E48
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 970
*/
function default_box_move_logic()
{
	index = -1;
	for(i = 0; i < level.chests.size; i++)
	{
		if(IsSubStr(level.chests[i].script_noteworthy, "move" + level.chest_moves + 1) && i != level.chest_index)
		{
			index = i;
			break;
		}
	}
	if(index != -1)
	{
		level.chest_index = index;
	}
	else
	{
		level.chest_index++;
	}
	if(level.chest_index >= level.chests.size)
	{
		temp_chest_name = level.chests[level.chest_index - 1].script_noteworthy;
		level.chest_index = 0;
		level.chests = Array::randomize(level.chests);
		if(temp_chest_name == level.chests[level.chest_index].script_noteworthy)
		{
			level.chest_index++;
		}
	}
}

/*
	Name: treasure_chest_move
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x2FC0
	Size: 0x380
	Parameters: 1
	Flags: None
	Line Number: 1011
*/
function treasure_chest_move(player_vox)
{
	level waittill("weapon_fly_away_start");
	players = GetPlayers();
	Array::thread_all(players, &play_crazi_sound);
	if(isdefined(player_vox))
	{
		player_vox util::delay(randomIntRange(2, 7), undefined, &zm_audio::create_and_play_dialog, "general", "box_move");
	}
	level waittill("weapon_fly_away_end");
	if(isdefined(self.zbarrier))
	{
		self hide_chest(1);
	}
	wait(0.1);
	post_selection_wait_duration = 7;
	if(level.zombie_vars["zombie_powerup_fire_sale_on"] == 1 && self [[level._zombiemode_check_firesale_loc_valid_func]]())
	{
		current_sale_time = level.zombie_vars["zombie_powerup_fire_sale_time"];
		util::wait_network_frame();
		self thread fire_sale_fix();
		level.zombie_vars["zombie_powerup_fire_sale_time"] = current_sale_time;
		while(level.zombie_vars["zombie_powerup_fire_sale_time"] > 0)
		{
			wait(0.1);
		}
	}
	else
	{
		post_selection_wait_duration = post_selection_wait_duration + 5;
	}
	level.verify_chest = 0;
	if(isdefined(level._zombiemode_custom_box_move_logic))
	{
		[[level._zombiemode_custom_box_move_logic]]();
	}
	else
	{
		default_box_move_logic();
	}
	if(isdefined(level.chests[level.chest_index].box_hacks["summon_box"]))
	{
		level.chests[level.chest_index] [[level.chests[level.chest_index].box_hacks["summon_box"]]](0);
	}
	wait(post_selection_wait_duration);
	playFX(level._effect["poltergeist"], level.chests[level.chest_index].zbarrier.origin, anglesToUp(level.chests[level.chest_index].zbarrier.angles), AnglesToForward(level.chests[level.chest_index].zbarrier.angles));
	level.chests[level.chest_index] show_chest();
	level flag::clear("moving_chest_now");
	self.zbarrier.chest_moving = 0;
}

/*
	Name: fire_sale_fix
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x3348
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 1072
*/
function fire_sale_fix()
{
	if(!isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]))
	{
		return;
	}
	if(level.zombie_vars["zombie_powerup_fire_sale_on"])
	{
		self.old_cost = 950;
		self thread show_chest();
		self.zombie_cost = 10;
		self.unitrigger_stub zm_utility::unitrigger_set_hint_string(self, "default_treasure_chest", self.zombie_cost);
		util::wait_network_frame();
		level waittill("fire_sale_off");
		while(isdefined(self._box_open) && self._box_open)
		{
			wait(0.1);
		}
		self hide_chest(1);
		self.zombie_cost = self.old_cost;
	}
}

/*
	Name: check_for_desirable_chest_location
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x3448
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 1105
*/
function check_for_desirable_chest_location()
{
	if(!isdefined(level.desirable_chest_location))
	{
		return level.chest_index;
	}
	if(level.chests[level.chest_index].script_noteworthy == level.desirable_chest_location)
	{
		level.desirable_chest_location = undefined;
		return level.chest_index;
	}
	for(i = 0; i < level.chests.size; i++)
	{
		if(level.chests[i].script_noteworthy == level.desirable_chest_location)
		{
			level.desirable_chest_location = undefined;
			return i;
		}
	}
	level.desirable_chest_location = undefined;
	return level.chest_index;
}

/*
	Name: rotateroll_box
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x3518
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1138
*/
function rotateroll_box()
{
	angles = 40;
	angles2 = 0;
	while(isdefined(self))
	{
		self RotateRoll(angles + angles2, 0.5);
		wait(0.7);
		angles2 = 40;
		self RotateRoll(angles * -2, 0.5);
		wait(0.7);
	}
}

/*
	Name: verify_chest_is_open
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x35B8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1162
*/
function verify_chest_is_open()
{
	for(i = 0; i < level.open_chest_location.size; i++)
	{
		if(isdefined(level.open_chest_location[i]))
		{
			if(level.open_chest_location[i] == level.chests[level.chest_index].script_noteworthy)
			{
				level.verify_chest = 1;
				return;
			}
		}
	}
	level.verify_chest = 0;
}

/*
	Name: treasure_chest_timeout
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x3650
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1188
*/
function treasure_chest_timeout()
{
	self endon("user_grabbed_weapon");
	self.zbarrier endon("box_hacked_respin");
	self.zbarrier endon("box_hacked_rerespin");
	wait(12);
	self notify("trigger", level);
}

/*
	Name: treasure_chest_lid_open
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x36A0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1207
*/
function treasure_chest_lid_open()
{
	openRoll = 105;
	openTime = 0.5;
	self RotateRoll(105, openTime, openTime * 0.5);
	zm_utility::play_sound_at_pos("open_chest", self.origin);
	zm_utility::play_sound_at_pos("music_chest", self.origin);
}

/*
	Name: treasure_chest_lid_close
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x3740
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 1226
*/
function treasure_chest_lid_close(timedOut)
{
	closeRoll = -105;
	closeTime = 0.5;
	self RotateRoll(closeRoll, closeTime, closeTime * 0.5);
	zm_utility::play_sound_at_pos("close_chest", self.origin);
	self notify("lid_closed");
}

/*
	Name: treasure_chest_CanPlayerReceiveWeapon
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x37D8
	Size: 0x1A0
	Parameters: 3
	Flags: None
	Line Number: 1245
*/
function treasure_chest_CanPlayerReceiveWeapon(player, weapon, pap_triggers)
{
	if(!zm_weapons::get_is_in_box(weapon))
	{
		return 0;
	}
	if(isdefined(player) && player zm_weapons::has_weapon_or_upgrade(weapon))
	{
		return 0;
	}
	if(!zm_weapons::limited_weapon_below_quota(weapon, player, pap_triggers))
	{
		return 0;
	}
	if(!player zm_weapons::player_can_use_content(weapon))
	{
		return 0;
	}
	if(isdefined(level.custom_magic_box_selection_logic))
	{
		if(![[level.custom_magic_box_selection_logic]](weapon, player, pap_triggers))
		{
			return 0;
		}
	}
	if(weapon.name == "ray_gun")
	{
		if(player zm_weapons::has_weapon_or_upgrade(GetWeapon("raygun_mark2")))
		{
			return 0;
		}
	}
	if(weapon.name == "raygun_mark2")
	{
		if(player zm_weapons::has_weapon_or_upgrade(GetWeapon("ray_gun")))
		{
			return 0;
		}
	}
	if(isdefined(player) && isdefined(level.special_weapon_magicbox_check))
	{
		return player [[level.special_weapon_magicbox_check]](weapon);
	}
	return 1;
}

/*
	Name: treasure_chest_ChooseWeightedRandomWeapon
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x3980
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 1301
*/
function treasure_chest_ChooseWeightedRandomWeapon(player)
{
	keys = Array::randomize(getArrayKeys(level.zombie_weapons));
	if(isdefined(level.CustomRandomWeaponWeights))
	{
		keys = player [[level.CustomRandomWeaponWeights]](keys);
	}
	pap_triggers = zm_pap_util::get_triggers();
	for(i = 0; i < keys.size; i++)
	{
		if(treasure_chest_CanPlayerReceiveWeapon(player, keys[i], pap_triggers))
		{
			return keys[i];
		}
	}
	return keys[0];
	ERROR: Exception occured: Stack empty.
}

/*
	Name: weapon_show_hint_choke
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x3A78
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 1330
*/
function weapon_show_hint_choke()
{
	level._weapon_show_hint_choke = 0;
	while(1)
	{
		wait(0.05);
		level._weapon_show_hint_choke = 0;
	}
}

/*
	Name: decide_hide_show_hint
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x3AB0
	Size: 0x368
	Parameters: 4
	Flags: None
	Line Number: 1350
*/
function decide_hide_show_hint(endon_notify, second_endon_notify, onlyplayer, can_buy_weapon_extra_check_func)
{
	self endon("death");
	if(isdefined(endon_notify))
	{
		self endon(endon_notify);
	}
	if(isdefined(second_endon_notify))
	{
		self endon(second_endon_notify);
	}
	if(!isdefined(level._weapon_show_hint_choke))
	{
		level thread weapon_show_hint_choke();
	}
	use_choke = 0;
	if(isdefined(level._use_choke_weapon_hints) && level._use_choke_weapon_hints == 1)
	{
		use_choke = 1;
	}
	while(1)
	{
		last_update = GetTime();
		if(isdefined(self.chest_user) && !isdefined(self.box_rerespun))
		{
			if(zm_utility::is_placeable_mine(self.chest_user GetCurrentWeapon()) || self.chest_user zm_equipment::hacker_active())
			{
				self setinvisibletoplayer(self.chest_user);
			}
			else
			{
				self setvisibletoplayer(self.chest_user);
			}
		}
		else if(isdefined(onlyplayer))
		{
			if(onlyplayer can_buy_weapon() && (!isdefined(can_buy_weapon_extra_check_func) || onlyplayer [[can_buy_weapon_extra_check_func]](self.weapon)) && !onlyplayer bgb::is_enabled("zm_bgb_disorderly_combat"))
			{
				self setinvisibletoplayer(onlyplayer, 0);
			}
			else
			{
				self setinvisibletoplayer(onlyplayer, 1);
			}
		}
		else
		{
			players = GetPlayers();
			for(i = 0; i < players.size; i++)
			{
				if(players[i] can_buy_weapon() && (!isdefined(can_buy_weapon_extra_check_func) || players[i] [[can_buy_weapon_extra_check_func]](self.weapon)) && !players[i] bgb::is_enabled("zm_bgb_disorderly_combat"))
				{
					self setinvisibletoplayer(players[i], 0);
					continue;
				}
				self setinvisibletoplayer(players[i], 1);
			}
		}
		if(use_choke)
		{
			while(level._weapon_show_hint_choke > 4 && GetTime() < last_update + 150)
			{
				wait(0.05);
			}
		}
		else
		{
			wait(0.1);
		}
		level._weapon_show_hint_choke++;
	}
}

/*
	Name: get_left_hand_weapon_model_name
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x3E20
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 1433
*/
function get_left_hand_weapon_model_name(weapon)
{
	dw_weapon = weapon.dualWieldWeapon;
	if(dw_weapon != level.weaponNone)
	{
		return dw_weapon.worldmodel;
	}
	return weapon.worldmodel;
}

/*
	Name: clean_up_hacked_box
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x3E80
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1453
*/
function clean_up_hacked_box()
{
	self waittill("box_hacked_respin");
	self endon("box_spin_done");
	if(isdefined(self.weapon_model))
	{
		self.weapon_model delete();
		self.weapon_model = undefined;
	}
	if(isdefined(self.weapon_model_dw))
	{
		self.weapon_model_dw delete();
		self.weapon_model_dw = undefined;
	}
	self hidezbarrierpiece(3);
	self hidezbarrierpiece(4);
	self SetZBarrierPieceState(3, "closed");
	self SetZBarrierPieceState(4, "closed");
}

/*
	Name: treasure_chest_firesale_active
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x3F78
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 1483
*/
function treasure_chest_firesale_active()
{
	return isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]) && level.zombie_vars["zombie_powerup_fire_sale_on"];
}

/*
	Name: treasure_chest_should_move
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x3FB0
	Size: 0x268
	Parameters: 2
	Flags: None
	Line Number: 1498
*/
function treasure_chest_should_move(Chest, player)
{
	if(GetDvarString("magic_chest_movable") == "1" && (!(isdefined(Chest._box_opened_by_fire_sale) && Chest._box_opened_by_fire_sale)) && !treasure_chest_firesale_active() && self [[level._zombiemode_check_firesale_loc_valid_func]]())
	{
		random = RandomInt(100);
		if(!isdefined(level.chest_min_move_usage))
		{
			level.chest_min_move_usage = 4;
		}
		if(level.chest_accessed < level.chest_min_move_usage)
		{
			chance_of_joker = -1;
		}
		else
		{
			chance_of_joker = level.chest_accessed + 20;
			if(level.chest_moves == 0 && level.chest_accessed >= 8)
			{
				chance_of_joker = 100;
			}
			if(level.chest_accessed >= 4 && level.chest_accessed < 8)
			{
				if(random < 15)
				{
					chance_of_joker = 100;
				}
				else
				{
					chance_of_joker = -1;
				}
			}
			if(level.chest_moves > 0)
			{
				if(level.chest_accessed >= 8 && level.chest_accessed < 13)
				{
					if(random < 30)
					{
						chance_of_joker = 100;
					}
					else
					{
						chance_of_joker = -1;
					}
				}
				if(level.chest_accessed >= 13)
				{
					if(random < 50)
					{
						chance_of_joker = 100;
					}
					else
					{
						chance_of_joker = -1;
					}
				}
			}
		}
		if(isdefined(Chest.no_fly_away))
		{
			chance_of_joker = -1;
		}
		if(isdefined(level._zombiemode_chest_joker_chance_override_func))
		{
			chance_of_joker = [[level._zombiemode_chest_joker_chance_override_func]](chance_of_joker);
		}
		if(chance_of_joker > random)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: spawn_joker_weapon_model
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x4220
	Size: 0x88
	Parameters: 4
	Flags: None
	Line Number: 1581
*/
function spawn_joker_weapon_model(player, model, origin, angles)
{
	weapon_model = spawn("script_model", origin);
	if(isdefined(angles))
	{
		weapon_model.angles = angles;
	}
	weapon_model SetModel(model);
	return weapon_model;
}

/*
	Name: treasure_chest_weapon_locking
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x42B0
	Size: 0x120
	Parameters: 3
	Flags: None
	Line Number: 1602
*/
function treasure_chest_weapon_locking(player, weapon, onOff)
{
	if(isdefined(self.locked_model))
	{
		self.locked_model delete();
		self.locked_model = undefined;
	}
	if(onOff)
	{
		if(weapon == level.weaponNone)
		{
			self.locked_model = spawn_joker_weapon_model(player, level.chest_joker_model, self.origin, (0, 0, 0));
		}
		else
		{
			self.locked_model = zm_utility::spawn_buildkit_weapon_model(player, weapon, undefined, self.origin, (0, 0, 0));
		}
		self.locked_model ghost();
		self.locked_model namespace_851dc78f::function_4621bbdd("scriptmover", "force_stream", 1);
	}
}

/*
	Name: function_f3755133
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x43D8
	Size: 0x2A0
	Parameters: 2
	Flags: None
	Line Number: 1634
*/
function function_f3755133(number_cycles, box)
{
	model = spawn("script_model", self.origin);
	model.angles = (box.angles[0] * -1, box.angles[1] + 180, box.angles[2] * -1);
	if(isdefined(level.custom_magicbox_float_height))
	{
		v_float = anglesToUp(box.angles) * level.custom_magicbox_float_height;
	}
	else
	{
		v_float = anglesToUp(box.angles) * 40;
	}
	time = number_cycles * 0.04;
	model moveto(model.origin + v_float, time);
	for(i = 0; i < number_cycles; i++)
	{
		keys = Array::randomize(getArrayKeys(level.zombie_weapons));
		weapon = keys[0];
		var_ad167f48 = weapon.worldmodel;
		model SetModel(var_ad167f48);
		model UseWeaponHideTags(weapon);
		if(i < 20)
		{
			wait(0.05);
			continue;
		}
		if(i < 30)
		{
			wait(0.1);
			continue;
		}
		if(i < 35)
		{
			wait(0.2);
			continue;
		}
		if(i < 38)
		{
			wait(0.3);
		}
	}
	model delete();
}

/*
	Name: treasure_chest_weapon_spawn
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x4680
	Size: 0xAF0
	Parameters: 3
	Flags: None
	Line Number: 1688
*/
function treasure_chest_weapon_spawn(Chest, player, respin)
{
	self endon("box_hacked_respin");
	self thread clean_up_hacked_box();
	/#
		fallback_initiated::Assert(isdefined(player));
	#/
	self.chest_moving = 0;
	move_the_box = treasure_chest_should_move(Chest, player);
	preferred_weapon = undefined;
	if(move_the_box)
	{
		preferred_weapon = level.weaponNone;
	}
	else
	{
		preferred_weapon = treasure_chest_ChooseWeightedRandomWeapon(player);
	}
	Chest treasure_chest_weapon_locking(player, preferred_weapon, 1);
	self.weapon = level.weaponNone;
	modelName = undefined;
	rand = undefined;
	number_cycles = 40;
	if(player namespace_851dc78f::function_5f9a13b3("specialty_timeslip"))
	{
		number_cycles = Int(number_cycles / 3);
	}
	if(player namespace_851dc78f::function_b690a849("specialty_timeslip"))
	{
		number_cycles = 3;
	}
	if(isdefined(Chest.zbarrier))
	{
		if(isdefined(level.custom_magic_box_do_weapon_rise))
		{
			Chest.zbarrier thread [[level.custom_magic_box_do_weapon_rise]]();
		}
		else if(player namespace_851dc78f::function_5f9a13b3("specialty_timeslip"))
		{
			Chest.zbarrier thread function_f3755133(number_cycles, self);
		}
		else
		{
			Chest.zbarrier thread magic_box_do_weapon_rise();
		}
	}
	for(i = 0; i < number_cycles; i++)
	{
		if(i < 20)
		{
			wait(0.05);
			continue;
		}
		if(i < 30)
		{
			wait(0.1);
			continue;
		}
		if(i < 35)
		{
			wait(0.2);
			continue;
		}
		if(i < 38)
		{
			wait(0.3);
		}
	}
	if(isdefined(level.custom_magic_box_weapon_wait))
	{
		[[level.custom_magic_box_weapon_wait]]();
	}
	new_firesale = move_the_box && treasure_chest_firesale_active();
	if(new_firesale)
	{
		move_the_box = 0;
		preferred_weapon = treasure_chest_ChooseWeightedRandomWeapon(player);
	}
	if(!move_the_box && treasure_chest_CanPlayerReceiveWeapon(player, preferred_weapon, zm_pap_util::get_triggers()))
	{
		rand = preferred_weapon;
	}
	else
	{
		rand = treasure_chest_ChooseWeightedRandomWeapon(player);
	}
	self.weapon = rand;
	if(isdefined(level.func_magicbox_weapon_spawned))
	{
		self thread [[level.func_magicbox_weapon_spawned]](self.weapon);
	}
	wait(0.1);
	if(isdefined(level.custom_magicbox_float_height))
	{
		v_float = anglesToUp(self.angles) * level.custom_magicbox_float_height;
	}
	else
	{
		v_float = anglesToUp(self.angles) * 40;
	}
	self.model_dw = undefined;
	self.weapon_model = zm_utility::spawn_buildkit_weapon_model(player, rand, undefined, self.origin + v_float, (self.angles[0] * -1, self.angles[1] + 180, self.angles[2] * -1));
	if(rand.isDualWield)
	{
		dweapon = rand;
		if(isdefined(rand.dualWieldWeapon) && rand.dualWieldWeapon != level.weaponNone)
		{
			dweapon = rand.dualWieldWeapon;
		}
		self.weapon_model_dw = zm_utility::spawn_buildkit_weapon_model(player, dweapon, undefined, self.weapon_model.origin - VectorScale((1, 1, 1), 3), self.weapon_model.angles);
	}
	if(move_the_box && (!(level.zombie_vars["zombie_powerup_fire_sale_on"] && self [[level._zombiemode_check_firesale_loc_valid_func]]())))
	{
		self.weapon_model SetModel(level.chest_joker_model);
		if(isdefined(self.weapon_model_dw))
		{
			self.weapon_model_dw delete();
			self.weapon_model_dw = undefined;
		}
		if(isPlayer(Chest.chest_user) && Chest.chest_user bgb::is_enabled("zm_bgb_unbearable"))
		{
			level.chest_accessed = 0;
			Chest.unbearable_respin = 1;
			Chest.chest_user notify("zm_bgb_unbearable", Chest);
			Chest waittill("forever");
		}
		self.chest_moving = 1;
		level flag::set("moving_chest_now");
		level.chest_accessed = 0;
		level.chest_moves++;
	}
	self notify("randomization_done");
	if(isdefined(self.chest_moving) && self.chest_moving)
	{
		if(isdefined(level.chest_joker_custom_movement))
		{
			self [[level.chest_joker_custom_movement]]();
		}
		else
		{
			v_origin = self.weapon_model.origin;
			self.weapon_model delete();
			self.weapon_model = spawn("script_model", v_origin);
			self.weapon_model SetModel(level.chest_joker_model);
			self.weapon_model.angles = self.angles + VectorScale((0, 1, 0), 180);
			wait(0.5);
			level notify("weapon_fly_away_start");
			wait(2);
			if(isdefined(self.weapon_model))
			{
				v_fly_away = self.origin + anglesToUp(self.angles) * 500;
				self.weapon_model moveto(v_fly_away, 4, 3);
			}
			if(isdefined(self.weapon_model_dw))
			{
				v_fly_away = self.origin + anglesToUp(self.angles) * 500;
				self.weapon_model_dw moveto(v_fly_away, 4, 3);
			}
			self.weapon_model waittill("movedone");
			self.weapon_model delete();
			if(isdefined(self.weapon_model_dw))
			{
				self.weapon_model_dw delete();
				self.weapon_model_dw = undefined;
			}
			self notify("box_moving");
			level notify("weapon_fly_away_end");
		}
	}
	else if(!isdefined(respin))
	{
		if(isdefined(Chest.box_hacks["respin"]))
		{
			self [[Chest.box_hacks["respin"]]](Chest, player);
		}
	}
	else if(isdefined(Chest.box_hacks["respin_respin"]))
	{
		self [[Chest.box_hacks["respin_respin"]]](Chest, player);
	}
	if(isdefined(level.custom_magic_box_timer_til_despawn))
	{
		self.weapon_model thread [[level.custom_magic_box_timer_til_despawn]](self);
	}
	else
	{
		self.weapon_model thread timer_til_despawn(v_float);
	}
	if(isdefined(self.weapon_model_dw))
	{
		if(isdefined(level.custom_magic_box_timer_til_despawn))
		{
			self.weapon_model_dw thread [[level.custom_magic_box_timer_til_despawn]](self);
		}
		else
		{
			self.weapon_model_dw thread timer_til_despawn(v_float);
		}
	}
	self waittill("weapon_grabbed");
	if(!Chest.timedOut)
	{
		if(isdefined(self.weapon_model))
		{
			self.weapon_model delete();
		}
		if(isdefined(self.weapon_model_dw))
		{
			self.weapon_model_dw delete();
		}
	}
	Chest treasure_chest_weapon_locking(player, preferred_weapon, 0);
	self.weapon = level.weaponNone;
	self notify("box_spin_done");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: chest_get_min_usage
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5178
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1916
*/
function chest_get_min_usage()
{
	min_usage = 4;
	return min_usage;
}

/*
	Name: chest_get_max_usage
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x51A0
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 1932
*/
function chest_get_max_usage()
{
	max_usage = 6;
	players = GetPlayers();
	if(level.chest_moves == 0)
	{
		if(players.size == 1)
		{
			max_usage = 3;
		}
		else if(players.size == 2)
		{
			max_usage = 4;
		}
		else if(players.size == 3)
		{
			max_usage = 5;
		}
		else
		{
			max_usage = 6;
		}
	}
	else if(players.size == 1)
	{
		max_usage = 4;
	}
	else if(players.size == 2)
	{
		max_usage = 4;
	}
	else if(players.size == 3)
	{
		max_usage = 5;
	}
	else
	{
		max_usage = 7;
	}
	return max_usage;
}

/*
	Name: timer_til_despawn
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x52C0
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 1984
*/
function timer_til_despawn(v_float)
{
	self endon("kill_weapon_movement");
	putBackTime = 12;
	self moveto(self.origin - v_float * 0.85, putBackTime, putBackTime * 0.5);
	wait(putBackTime);
	if(isdefined(self))
	{
		self delete();
		return;
	}
	ERROR: Bad function call
}

/*
	Name: treasure_chest_glowfx
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5350
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 2008
*/
function treasure_chest_glowfx()
{
	self clientfield::set("magicbox_open_glow", 1);
	self clientfield::set("magicbox_closed_glow", 0);
	ret_val = self util::waittill_any_return("weapon_grabbed", "box_moving");
	self clientfield::set("magicbox_open_glow", 0);
	if("box_moving" != ret_val)
	{
		self clientfield::set("magicbox_closed_glow", 1);
	}
}

/*
	Name: treasure_chest_give_weapon
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5420
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 2030
*/
function treasure_chest_give_weapon(weapon)
{
	self.last_box_weapon = GetTime();
	if(weapon.name == "ray_gun" || weapon.name == "raygun_mark2")
	{
		playsoundatposition("mus_raygun_stinger", (0, 0, 0));
	}
	if(should_upgrade_weapon(self, weapon))
	{
		if(self zm_weapons::can_upgrade_weapon(weapon))
		{
			weapon = zm_weapons::get_upgrade_weapon(weapon);
			self notify("zm_bgb_crate_power_used");
		}
	}
	if(zm_utility::is_hero_weapon(weapon) && !self hasweapon(weapon))
	{
		self give_hero_weapon(weapon);
	}
	else
	{
		w_give = self zm_weapons::weapon_give(weapon, 0, 1);
		if(isdefined(weapon))
		{
			self thread AAT::remove(w_give);
		}
	}
}

/*
	Name: give_hero_weapon
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5590
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 2069
*/
function give_hero_weapon(weapon)
{
	w_previous = self GetCurrentWeapon();
	self zm_weapons::weapon_give(weapon);
	self GadgetPowerSet(0, 99);
	self SwitchToWeapon(weapon);
	self waittill("weapon_change_complete");
	self SetLowReady(1);
	self SwitchToWeapon(w_previous);
	self util::waittill_any_timeout(1, "weapon_change_complete");
	self SetLowReady(0);
	self GadgetPowerSet(0, 100);
	return;
	continue;
}

/*
	Name: should_upgrade_weapon
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x56B0
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 2095
*/
function should_upgrade_weapon(player, weapon)
{
	if(isdefined(level.magicbox_should_upgrade_weapon_override))
	{
		return [[level.magicbox_should_upgrade_weapon_override]](player, weapon);
	}
	if(player bgb::is_enabled("zm_bgb_crate_power"))
	{
		return 1;
	}
	return 0;
}

/*
	Name: magic_box_initial
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5718
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 2118
*/
function magic_box_initial()
{
	self SetZBarrierPieceState(1, "open");
	self clientfield::set("magicbox_closed_glow", 1);
}

/*
	Name: magic_box_arrives
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5768
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 2134
*/
function magic_box_arrives()
{
	self SetZBarrierPieceState(1, "opening");
	while(self GetZBarrierPieceState(1) == "opening")
	{
		wait(0.05);
	}
	self notify("arrived");
}

/*
	Name: magic_box_leaves
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x57D8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 2154
*/
function magic_box_leaves()
{
	self SetZBarrierPieceState(1, "closing");
	while(self GetZBarrierPieceState(1) == "closing")
	{
		wait(0.1);
	}
	self notify("left");
}

/*
	Name: magic_box_opens
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5848
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 2174
*/
function magic_box_opens()
{
	self SetZBarrierPieceState(2, "opening");
	while(self GetZBarrierPieceState(2) == "opening")
	{
		wait(0.1);
	}
	self notify("opened");
}

/*
	Name: magic_box_closes
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x58B8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 2194
*/
function magic_box_closes()
{
	self SetZBarrierPieceState(2, "closing");
	while(self GetZBarrierPieceState(2) == "closing")
	{
		wait(0.1);
	}
	self notify("closed");
}

/*
	Name: magic_box_do_weapon_rise
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5928
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 2214
*/
function magic_box_do_weapon_rise()
{
	self endon("box_hacked_respin");
	self SetZBarrierPieceState(3, "closed");
	self SetZBarrierPieceState(4, "closed");
	util::wait_network_frame();
	self ZBarrierPieceUseBoxRiseLogic(3);
	self ZBarrierPieceUseBoxRiseLogic(4);
	self ShowZBarrierPiece(3);
	self ShowZBarrierPiece(4);
	self SetZBarrierPieceState(3, "opening");
	self SetZBarrierPieceState(4, "opening");
	while(self GetZBarrierPieceState(3) != "open")
	{
		wait(0.5);
	}
	self hidezbarrierpiece(3);
	self hidezbarrierpiece(4);
}

/*
	Name: magic_box_do_teddy_flyaway
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5A90
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 2244
*/
function magic_box_do_teddy_flyaway()
{
	self ShowZBarrierPiece(3);
	self SetZBarrierPieceState(3, "closing");
}

/*
	Name: is_chest_active
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5AD8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 2260
*/
function is_chest_active()
{
	curr_state = self.zbarrier get_magic_box_zbarrier_state();
	if(level flag::get("moving_chest_now"))
	{
		return 0;
	}
	if(curr_state == "open" || curr_state == "close")
	{
		return 1;
	}
	return 0;
	ERROR: Bad function call
}

/*
	Name: get_magic_box_zbarrier_state
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5B58
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 2285
*/
function get_magic_box_zbarrier_state()
{
	return self.state;
}

/*
	Name: set_magic_box_zbarrier_state
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5B70
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 2300
*/
function set_magic_box_zbarrier_state(state)
{
	for(i = 0; i < self getnumzbarrierpieces(); i++)
	{
		self hidezbarrierpiece(i);
	}
	self notify("zbarrier_state_change");
	self [[level.magic_box_zbarrier_state_func]](state);
}

/*
	Name: process_magic_box_zbarrier_state
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5BF8
	Size: 0x240
	Parameters: 1
	Flags: None
	Line Number: 2320
*/
function process_magic_box_zbarrier_state(state)
{
	switch(state)
	{
		case "away":
		{
			self ShowZBarrierPiece(0);
			self.state = "away";
			break;
		}
		case "arriving":
		{
			self ShowZBarrierPiece(1);
			self thread magic_box_arrives();
			self.state = "arriving";
			break;
		}
		case "initial":
		{
			self ShowZBarrierPiece(1);
			self thread magic_box_initial();
			thread zm_unitrigger::register_static_unitrigger(self.owner.unitrigger_stub, &magicbox_unitrigger_think);
			self.state = "initial";
			break;
		}
		case "open":
		{
			self ShowZBarrierPiece(2);
			self thread magic_box_opens();
			self.state = "open";
			break;
		}
		case "close":
		{
			self ShowZBarrierPiece(2);
			self thread magic_box_closes();
			self.state = "close";
			break;
		}
		case "leaving":
		{
			self ShowZBarrierPiece(1);
			self thread magic_box_leaves();
			self.state = "leaving";
			break;
		}
		default
		{
			if(isdefined(level.custom_magicbox_state_handler))
			{
				self [[level.custom_magicbox_state_handler]](state);
				break;
			}
		}
	}
}

/*
	Name: magicbox_host_migration
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5E40
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 2387
*/
function magicbox_host_migration()
{
	level endon("end_game");
	level notify("mb_hostmigration");
	level endon("mb_hostmigration");
	while(1)
	{
		level waittill("host_migration_end");
		if(!isdefined(level.chests))
		{
			continue;
		}
		foreach(Chest in level.chests)
		{
			if(!(isdefined(Chest.hidden) && Chest.hidden))
			{
				if(isdefined(Chest) && isdefined(Chest.pandora_light))
				{
					PlayFXOnTag(level._effect["lght_marker"], Chest.pandora_light, "tag_origin");
				}
			}
			util::wait_network_frame();
		}
	}
	return;
}

/*
	Name: box_encounter_vo
	Namespace: zm_magicbox
	Checksum: 0x424F4353
	Offset: 0x5F98
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 2424
*/
function box_encounter_vo()
{
	level flag::wait_till("initial_blackscreen_passed");
	self endon("left");
	while(1)
	{
		foreach(player in GetPlayers())
		{
			distanceFromPlayerToBox = DistanceSquared(player.origin, self.origin);
			if(distanceFromPlayerToBox < 160000 && player zm_utility::is_player_looking_at(self.origin))
			{
				player zm_audio::create_and_play_dialog("box", "encounter");
				return;
			}
		}
		wait(0.5);
	}
}

