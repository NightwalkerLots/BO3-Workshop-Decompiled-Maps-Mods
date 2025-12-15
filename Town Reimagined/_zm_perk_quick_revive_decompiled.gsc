#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;

#namespace zm_perk_quick_revive;

/*
	Name: __init__sytem__
	Namespace: zm_perk_quick_revive
	Checksum: 0xD006F80D
	Offset: 0x4B0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 30
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_quick_revive", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_quick_revive
	Checksum: 0xED12E21F
	Offset: 0x4F0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_quick_revive_perk_for_level();
	}
}

/*
	Name: enable_quick_revive_perk_for_level
	Namespace: zm_perk_quick_revive
	Checksum: 0x91604145
	Offset: 0x528
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function enable_quick_revive_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_quickrevive", "revive", &function_fa6302dd, &"ZOMBIE_PERK_QUICKREVIVE", GetWeapon("zombie_perk_bottle_revive"));
	zm_perks::register_perk_precache_func("specialty_quickrevive", &quick_revive_precache);
	zm_perks::register_perk_clientfields("specialty_quickrevive", &quick_revive_register_clientfield, &quick_revive_set_clientfield);
	zm_perks::register_perk_machine("specialty_quickrevive", &quick_revive_perk_machine_setup);
	zm_perks::register_perk_threads("specialty_quickrevive", &function_eae0379d, &function_a73df4ff);
	zm_perks::register_perk_host_migration_params("specialty_quickrevive", "vending_revive", "specialty_quickrevive");
	zm_perks::register_perk_machine_power_override("specialty_quickrevive", &function_ff319ef3);
	level.check_quickrevive_hotjoin = &function_5d9a2f7;
	level flag::init("solo_revive");
}

/*
	Name: quick_revive_precache
	Namespace: zm_perk_quick_revive
	Checksum: 0x2B7669DE
	Offset: 0x6D0
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 86
*/
function quick_revive_precache()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_quickrevive"] = "zombie/fx_perk_quick_revive_zmb";
		continue;
	}
	level._effect["specialty_quickrevive"] = "zombie/fx_perk_quick_revive_factory_zmb";
	level.machine_assets["specialty_quickrevive"] = spawnstruct();
	level.machine_assets["specialty_quickrevive"].weapon = GetWeapon("zombie_perk_bottle_revive");
	level.machine_assets["specialty_quickrevive"].off_model = "p7_zm_vending_revive";
	level.machine_assets["specialty_quickrevive"].on_model = "p7_zm_vending_revive";
}

/*
	Name: quick_revive_register_clientfield
	Namespace: zm_perk_quick_revive
	Checksum: 0x9ACF73B8
	Offset: 0x810
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 111
*/
function quick_revive_register_clientfield()
{
}

/*
	Name: quick_revive_set_clientfield
	Namespace: zm_perk_quick_revive
	Checksum: 0x4498247E
	Offset: 0x820
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 125
*/
function quick_revive_set_clientfield(state)
{
}

/*
	Name: quick_revive_perk_machine_setup
	Namespace: zm_perk_quick_revive
	Checksum: 0x37C8CF65
	Offset: 0x838
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 139
*/
function quick_revive_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_revive_jingle";
	use_trigger.script_string = "revive_perk";
	use_trigger.script_label = "mus_perks_revive_sting";
	use_trigger.target = "vending_revive";
	perk_machine.script_string = "revive_perk";
	perk_machine.targetname = "vending_revive";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "revive_perk";
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_eae0379d
	Namespace: zm_perk_quick_revive
	Checksum: 0xD494CF83
	Offset: 0x900
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 165
*/
function function_eae0379d(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_quickrevive", "t6_specialty_quickrevive");
	self thread function_94b2ca5();
	self notify("specialty_quickrevive" + "_start");
	return;
}

/*
	Name: function_a73df4ff
	Namespace: zm_perk_quick_revive
	Checksum: 0x557A0381
	Offset: 0x980
	Size: 0x68
	Parameters: 3
	Flags: None
	Line Number: 183
*/
function function_a73df4ff(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_quickrevive");
	self notify("perk_lost", str_perk);
	self notify("specialty_quickrevive" + "_stop");
}

/*
	Name: function_ff319ef3
	Namespace: zm_perk_quick_revive
	Checksum: 0xFD57737B
	Offset: 0x9F0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 200
*/
function function_ff319ef3()
{
	function_8a15cc20();
}

/*
	Name: function_94b2ca5
	Namespace: zm_perk_quick_revive
	Checksum: 0x20247D3B
	Offset: 0xA10
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 215
*/
function function_94b2ca5()
{
	if(zm_perks::use_solo_revive())
	{
		self.lives = 1;
		if(!isdefined(level.solo_lives_given))
		{
			level.solo_lives_given = 0;
		}
		if(isdefined(level.solo_game_free_player_quickrevive))
		{
			level.solo_game_free_player_quickrevive = undefined;
			continue;
		}
		level.solo_lives_given++;
		if(level.solo_lives_given >= 3)
		{
			level flag::set("solo_revive");
		}
		self thread function_9b08a050("specialty_quickrevive");
	}
}

/*
	Name: function_fa6302dd
	Namespace: zm_perk_quick_revive
	Checksum: 0x27FD9737
	Offset: 0xAC8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 248
*/
function function_fa6302dd()
{
	Solo = zm_perks::use_solo_revive();
	if(Solo)
	{
		return 500;
		continue;
	}
	return 1500;
}

/*
	Name: function_8a15cc20
	Namespace: zm_perk_quick_revive
	Checksum: 0xFDE277A4
	Offset: 0xB08
	Size: 0x718
	Parameters: 0
	Flags: None
	Line Number: 269
*/
function function_8a15cc20()
{
	level endon("stop_quickrevive_logic");
	level flag::wait_till("start_zombie_round_logic");
	solo_mode = 0;
	if(zm_perks::use_solo_revive())
	{
		solo_mode = 1;
	}
	if(solo_mode && (!(isdefined(level.solo_revive_init) && level.solo_revive_init)))
	{
		level.solo_revive_init = 1;
	}
	while(1)
	{
		machine = GetEntArray("vending_revive", "targetname");
		machine_triggers = GetEntArray("vending_revive", "target");
		for(i = 0; i < machine.size; i++)
		{
			if(flag::exists("solo_game") && flag::exists("solo_revive") && level flag::get("solo_game") && level flag::get("solo_revive"))
			{
				machine[i] Hide();
			}
			machine[i] SetModel(level.machine_assets["specialty_quickrevive"].off_model);
			if(isdefined(level.quick_revive_final_pos))
			{
				level.quick_revive_default_origin = level.quick_revive_final_pos;
			}
			if(!isdefined(level.quick_revive_default_origin))
			{
				level.quick_revive_default_origin = machine[i].origin;
				level.quick_revive_default_angles = machine[i].angles;
			}
			level.quick_revive_machine = machine[i];
		}
		Array::thread_all(machine_triggers, &zm_perks::set_power_on, 0);
		if(isdefined(level.initial_quick_revive_power_off) && level.initial_quick_revive_power_off)
		{
			level waittill("revive_on");
		}
		else if(!solo_mode)
		{
			level waittill("revive_on");
		}
		level notify("revive_on");
		for(i = 0; i < machine.size; i++)
		{
			if(isdefined(machine[i].classname) && machine[i].classname == "script_model")
			{
				if(isdefined(machine[i].script_noteworthy) && machine[i].script_noteworthy == "clip")
				{
					machine_clip = machine[i];
					continue;
				}
				machine[i] SetModel(level.machine_assets["specialty_quickrevive"].on_model);
				machine[i] playsound("zmb_perks_power_on");
				machine[i] vibrate(VectorScale((0, -1, 0), 100), 0.3, 0.4, 3);
				machine_model = machine[i];
				machine[i] thread zm_perks::perk_fx("specialty_quickrevive");
				machine[i] notify("stop_loopsound");
				machine[i] thread zm_perks::play_loop_on_machine();
				if(isdefined(machine_triggers[i]))
				{
					machine_clip = machine_triggers[i].clip;
				}
				if(isdefined(machine_triggers[i]))
				{
					blocker_model = machine_triggers[i].blocker_model;
				}
			}
		}
		util::wait_network_frame();
		if(solo_mode && isdefined(machine_model) && (!(isdefined(machine_model.ishidden) && machine_model.ishidden)))
		{
			machine_model thread function_a1a78155(machine_clip, blocker_model);
		}
		Array::thread_all(machine_triggers, &zm_perks::set_power_on, 1);
		if(isdefined(level.machine_assets["specialty_quickrevive"].power_on_callback))
		{
			Array::thread_all(machine, level.machine_assets["specialty_quickrevive"].power_on_callback);
		}
		level notify("specialty_quickrevive_power_on");
		if(isdefined(machine_model))
		{
			machine_model.ishidden = 0;
		}
		notify_str = level util::waittill_any_return("revive_off", "revive_hide");
		should_hide = 0;
		if(notify_str == "revive_hide")
		{
			should_hide = 1;
		}
		if(isdefined(level.machine_assets["specialty_quickrevive"].power_off_callback))
		{
			Array::thread_all(machine, level.machine_assets["specialty_quickrevive"].power_off_callback);
		}
		for(i = 0; i < machine.size; i++)
		{
			if(isdefined(machine[i].classname) && machine[i].classname == "script_model")
			{
				machine[i] zm_perks::turn_perk_off(should_hide);
			}
		}
	}
}

/*
	Name: function_e114993
	Namespace: zm_perk_quick_revive
	Checksum: 0xD9B7E8A1
	Offset: 0x1228
	Size: 0x668
	Parameters: 2
	Flags: None
	Line Number: 385
*/
function function_e114993(machine_clip, solo_mode)
{
	if(isdefined(level.revive_machine_spawned) && (!(isdefined(level.revive_machine_spawned) && level.revive_machine_spawned)))
	{
		return;
	}
	wait(0.1);
	power_state = 0;
	if(isdefined(solo_mode) && solo_mode)
	{
		power_state = 1;
		should_pause = 1;
		players = GetPlayers();
		foreach(player in players)
		{
			if(isdefined(player.lives) && player.lives > 0 && power_state)
			{
				should_pause = 0;
				continue;
			}
			if(isdefined(player.lives) && player.lives < 1)
			{
				should_pause = 1;
			}
		}
		if(should_pause)
		{
			zm_perks::perk_pause("specialty_quickrevive");
			continue;
		}
		zm_perks::perk_unpause("specialty_quickrevive");
		if(isdefined(level.solo_revive_init) && level.solo_revive_init && level flag::get("solo_revive"))
		{
			function_d371d2df(machine_clip);
			return;
		}
		function_654d5402(1);
		function_7bd6670c();
		function_bfdf9de();
		level notify("revive_off", players);
		wait(0.1);
		level notify("stop_quickrevive_logic");
	}
	else if(!(isdefined(level._dont_unhide_quickervive_on_hotjoin) && level._dont_unhide_quickervive_on_hotjoin))
	{
		function_7bd6670c();
		level notify("revive_off");
		wait(0.1);
	}
	level notify("revive_hide");
	level notify("stop_quickrevive_logic");
	function_bfdf9de();
	triggers = GetEntArray("zombie_vending", "targetname");
	foreach(trigger in triggers)
	{
		if(!isdefined(trigger.script_noteworthy))
		{
			continue;
		}
		if(trigger.script_noteworthy == "specialty_quickrevive")
		{
			if(isdefined(trigger.script_int))
			{
				if(level flag::get("power_on" + trigger.script_int))
				{
					power_state = 1;
					continue;
				}
			}
			if(level flag::get("power_on"))
			{
				power_state = 1;
			}
		}
	}
	function_654d5402(power_state);
	level thread function_8a15cc20();
	if(power_state)
	{
		zm_perks::perk_unpause("specialty_quickrevive");
		level notify("revive_on", triggers);
		wait(0.1);
		level notify("specialty_quickrevive_power_on");
		continue;
	}
	zm_perks::perk_pause("specialty_quickrevive");
	if(!(isdefined(solo_mode) && solo_mode))
	{
		return;
	}
	should_pause = 1;
	players = GetPlayers();
	foreach(player in players)
	{
		if(!zm_utility::is_player_valid(player))
		{
			continue;
		}
		if(player hasPerk("specialty_quickrevive"))
		{
			if(!isdefined(player.lives))
			{
				player.lives = 0;
			}
			if(!isdefined(level.solo_lives_given))
			{
				level.solo_lives_given = 0;
			}
			level.solo_lives_given++;
			player.lives++;
			if(isdefined(player.lives) && player.lives > 0 && power_state)
			{
				should_pause = 0;
				continue;
			}
			should_pause = 1;
		}
	}
	if(should_pause)
	{
		zm_perks::perk_pause("specialty_quickrevive");
		continue;
	}
	zm_perks::perk_unpause("specialty_quickrevive");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e5888b86
	Namespace: zm_perk_quick_revive
	Checksum: 0x8B753895
	Offset: 0x1898
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 523
*/
function function_e5888b86(solo_mode)
{
	if(!isdefined(solo_mode))
	{
		solo_mode = 0;
	}
	clip = undefined;
	if(isdefined(level.quick_revive_machine_clip))
	{
		clip = level.quick_revive_machine_clip;
	}
	level._custom_perks["specialty_quickrevive"].cost = function_fa6302dd();
	level.quick_revive_machine thread function_e114993(clip, solo_mode);
	return;
	level._custom_perks["specialty_quickrevive"].var_0 = undefined;
}

/*
	Name: function_5d9a2f7
	Namespace: zm_perk_quick_revive
	Checksum: 0xCBF86458
	Offset: 0x1940
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 550
*/
function function_5d9a2f7()
{
	level notify("notify_check_quickrevive_for_hotjoin");
	level endon("notify_check_quickrevive_for_hotjoin");
	solo_mode = 0;
	should_update = 0;
	wait(0.05);
	players = GetPlayers();
	if(players.size == 1 || (isdefined(level.force_solo_quick_revive) && level.force_solo_quick_revive))
	{
		solo_mode = 1;
		if(!level flag::get("solo_game"))
		{
			should_update = 1;
		}
		level flag::set("solo_game");
	}
	else if(level flag::get("solo_game"))
	{
		should_update = 1;
	}
	level flag::clear("solo_game");
	level.using_solo_revive = solo_mode;
	level.revive_machine_is_solo = solo_mode;
	zm::set_default_laststand_pistol(solo_mode);
	if(should_update && isdefined(level.quick_revive_machine))
	{
		function_e5888b86(solo_mode);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a1a78155
	Namespace: zm_perk_quick_revive
	Checksum: 0xE412D41E
	Offset: 0x1AC8
	Size: 0x390
	Parameters: 2
	Flags: None
	Line Number: 593
*/
function function_a1a78155(machine_clip, blocker_model)
{
	if(level flag::exists("solo_revive") && level flag::get("solo_revive") && !level flag::get("solo_game"))
	{
		return;
	}
	if(isdefined(machine_clip))
	{
		level.quick_revive_machine_clip = machine_clip;
	}
	level notify("revive_solo_fx");
	level endon("revive_solo_fx");
	self endon("death");
	level flag::wait_till("solo_revive");
	if(isdefined(level.revive_solo_fx_func))
	{
		level thread [[level.revive_solo_fx_func]]();
	}
	wait(2);
	self playsound("zmb_box_move");
	playsoundatposition("zmb_whoosh", self.origin);
	if(isdefined(self._linked_ent))
	{
		self Unlink();
	}
	self moveto(self.origin + VectorScale((0, 0, 1), 40), 3);
	if(isdefined(level.custom_vibrate_func))
	{
		[[level.custom_vibrate_func]](self);
		continue;
	}
	direction = self.origin;
	direction = (direction[1], direction[0], 0);
	if(direction[1] < 0 || (direction[0] > 0 && direction[1] > 0))
	{
		direction = (direction[0], direction[1] * -1, 0);
	}
	else if(direction[0] < 0)
	{
		direction = (direction[0] * -1, direction[1], 0);
	}
	self vibrate(direction, 10, 0.5, 5);
	self waittill("movedone");
	playFX(level._effect["poltergeist"], self.origin);
	playsoundatposition("zmb_box_poof", self.origin);
	if(isdefined(self.FX))
	{
		self.FX Unlink();
		self.FX delete();
	}
	if(isdefined(machine_clip))
	{
		machine_clip Hide();
		machine_clip connectpaths();
	}
	if(isdefined(blocker_model))
	{
		blocker_model show();
	}
	level notify("revive_hide");
}

/*
	Name: function_d371d2df
	Namespace: zm_perk_quick_revive
	Checksum: 0xC63AB0E7
	Offset: 0x1E60
	Size: 0x4F0
	Parameters: 1
	Flags: None
	Line Number: 665
*/
function function_d371d2df(machine_clip)
{
	if(isdefined(level.solo_revive_init) && level.solo_revive_init && level flag::get("solo_revive") && isdefined(level.quick_revive_machine))
	{
		triggers = GetEntArray("zombie_vending", "targetname");
		foreach(trigger in triggers)
		{
			if(!isdefined(trigger.script_noteworthy))
			{
				continue;
			}
			if(trigger.script_noteworthy == "specialty_quickrevive")
			{
				trigger TriggerEnable(0);
			}
		}
		foreach(item in level.powered_items)
		{
			if(isdefined(item.target) && isdefined(item.target.script_noteworthy) && item.target.script_noteworthy == "specialty_quickrevive")
			{
				item.power = 1;
				item.self_powered = 1;
			}
		}
		if(isdefined(level.quick_revive_machine.original_pos))
		{
			level.quick_revive_default_origin = level.quick_revive_machine.original_pos;
			level.quick_revive_default_angles = level.quick_revive_machine.original_angles;
		}
		move_org = level.quick_revive_default_origin;
		if(isdefined(level.quick_revive_linked_ent))
		{
			move_org = level.quick_revive_linked_ent.origin;
			if(isdefined(level.quick_revive_linked_ent_offset))
			{
				move_org = move_org + level.quick_revive_linked_ent_offset;
			}
			level.quick_revive_machine Unlink();
		}
		level.quick_revive_machine moveto(move_org + VectorScale((0, 0, 1), 40), 3);
		direction = level.quick_revive_machine.origin;
		direction = (direction[1], direction[0], 0);
		if(direction[1] < 0 || (direction[0] > 0 && direction[1] > 0))
		{
			direction = (direction[0], direction[1] * -1, 0);
		}
		else if(direction[0] < 0)
		{
			direction = (direction[0] * -1, direction[1], 0);
		}
		level.quick_revive_machine vibrate(direction, 10, 0.5, 4);
		level.quick_revive_machine waittill("movedone");
		level.quick_revive_machine Hide();
		level.quick_revive_machine.ishidden = 1;
		if(isdefined(level.quick_revive_machine_clip))
		{
			level.quick_revive_machine_clip Hide();
			level.quick_revive_machine_clip connectpaths();
		}
		playFX(level._effect["poltergeist"], level.quick_revive_machine.origin);
		if(isdefined(level.quick_revive_trigger) && isdefined(level.quick_revive_trigger.blocker_model))
		{
			level.quick_revive_trigger.blocker_model show();
		}
		level notify("revive_hide", level.powered_items, triggers);
		return;
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7bd6670c
	Namespace: zm_perk_quick_revive
	Checksum: 0x2F8C08E2
	Offset: 0x2358
	Size: 0x400
	Parameters: 0
	Flags: None
	Line Number: 746
*/
function function_7bd6670c()
{
	while(zm_perks::players_are_in_perk_area(level.quick_revive_machine))
	{
		wait(0.05);
	}
	if(isdefined(level.quick_revive_machine_clip))
	{
		level.quick_revive_machine_clip show();
		level.quick_revive_machine_clip disconnectpaths();
	}
	if(isdefined(level.quick_revive_final_pos))
	{
		level.quick_revive_machine.origin = level.quick_revive_final_pos;
	}
	playFX(level._effect["poltergeist"], level.quick_revive_machine.origin);
	if(isdefined(level.quick_revive_trigger) && isdefined(level.quick_revive_trigger.blocker_model))
	{
		level.quick_revive_trigger.blocker_model Hide();
	}
	level.quick_revive_machine show();
	if(isdefined(level.quick_revive_machine.original_pos))
	{
		level.quick_revive_default_origin = level.quick_revive_machine.original_pos;
		level.quick_revive_default_angles = level.quick_revive_machine.original_angles;
	}
	direction = level.quick_revive_machine.origin;
	direction = (direction[1], direction[0], 0);
	if(direction[1] < 0 || (direction[0] > 0 && direction[1] > 0))
	{
		direction = (direction[0], direction[1] * -1, 0);
	}
	else if(direction[0] < 0)
	{
		direction = (direction[0] * -1, direction[1], 0);
	}
	org = level.quick_revive_default_origin;
	if(isdefined(level.quick_revive_linked_ent))
	{
		org = level.quick_revive_linked_ent.origin;
		if(isdefined(level.quick_revive_linked_ent_offset))
		{
			org = org + level.quick_revive_linked_ent_offset;
		}
	}
	if(!(isdefined(level.quick_revive_linked_ent_moves) && level.quick_revive_linked_ent_moves) && level.quick_revive_machine.origin != org)
	{
		level.quick_revive_machine moveto(org, 3);
		level.quick_revive_machine vibrate(direction, 10, 0.5, 2.9);
		level.quick_revive_machine waittill("movedone");
		level.quick_revive_machine.angles = level.quick_revive_default_angles;
	}
	else if(isdefined(level.quick_revive_linked_ent))
	{
		org = level.quick_revive_linked_ent.origin;
		if(isdefined(level.quick_revive_linked_ent_offset))
		{
			org = org + level.quick_revive_linked_ent_offset;
		}
		level.quick_revive_machine.origin = org;
	}
	level.quick_revive_machine vibrate(VectorScale((0, -1, 0), 100), 0.3, 0.4, 3);
	if(isdefined(level.quick_revive_linked_ent))
	{
		level.quick_revive_machine LinkTo(level.quick_revive_linked_ent);
	}
	level.quick_revive_machine.ishidden = 0;
}

/*
	Name: function_bfdf9de
	Namespace: zm_perk_quick_revive
	Checksum: 0xF43AAD15
	Offset: 0x2760
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 825
*/
function function_bfdf9de()
{
	triggers = GetEntArray("zombie_vending", "targetname");
	foreach(trigger in triggers)
	{
		if(!isdefined(trigger.script_noteworthy))
		{
			continue;
		}
		if(trigger.script_noteworthy == "specialty_quickrevive")
		{
			trigger notify("stop_quickrevive_logic", triggers);
			trigger thread zm_perks::vending_trigger_think();
			trigger TriggerEnable(1);
		}
	}
	return;
	triggers++;
}

/*
	Name: function_654d5402
	Namespace: zm_perk_quick_revive
	Checksum: 0x15C140F1
	Offset: 0x2880
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 855
*/
function function_654d5402()
{
	// Could not fully decompile function; skipped
}

/*
	Name: function_9b08a050
	Namespace: zm_perk_quick_revive
	Checksum: 0x7973C00F
	Offset: 0x2A50
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 870
*/
function function_9b08a050(revive_trigger_noteworthy)
{
	self endon("death");
	revive_perk_triggers = GetEntArray(revive_trigger_noteworthy, "script_noteworthy");
	foreach(revive_perk_trigger in revive_perk_triggers)
	{
		self thread function_c0dc6341(revive_perk_trigger);
	}
}

/*
	Name: function_c0dc6341
	Namespace: zm_perk_quick_revive
	Checksum: 0x93C5F824
	Offset: 0x2B28
	Size: 0xAC
	Parameters: 1
	Flags: None
	Line Number: 890
*/
function function_c0dc6341(revive_perk_trigger)
{
	self endon("death");
	revive_perk_trigger setinvisibletoplayer(self);
	if(level.solo_lives_given >= 3)
	{
		revive_perk_trigger TriggerEnable(0);
		if(isdefined(level._solo_revive_machine_expire_func))
		{
			revive_perk_trigger [[level._solo_revive_machine_expire_func]]();
			return;
		}
	}
	while(self.lives > 0)
	{
		wait(0.05);
	}
	revive_perk_trigger setvisibletoplayer(self);
}

