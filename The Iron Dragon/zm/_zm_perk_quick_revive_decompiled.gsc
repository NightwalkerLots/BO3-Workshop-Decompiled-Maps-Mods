#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_utility;

#namespace zm_perk_quick_revive;

/*
	Name: __init__sytem__
	Namespace: zm_perk_quick_revive
	Checksum: 0x8B689B3A
	Offset: 0x3E0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_quick_revive", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_quick_revive
	Checksum: 0xEE93D82C
	Offset: 0x428
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_quick_revive_perk_for_level();
	}
}

/*
	Name: __main__
	Namespace: zm_perk_quick_revive
	Checksum: 0x21AAB229
	Offset: 0x460
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_ef1171f6();
	}
}

/*
	Name: enable_quick_revive_perk_for_level
	Namespace: zm_perk_quick_revive
	Checksum: 0x4E19F7E3
	Offset: 0x498
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 75
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
	level flag::init("solo_revive");
}

/*
	Name: quick_revive_precache
	Namespace: zm_perk_quick_revive
	Checksum: 0xD86A8C6E
	Offset: 0x628
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function quick_revive_precache()
{
	level._effect["specialty_quickrevive"] = "harry/zm_perks/fx_perk_quick_revive_light";
	level.machine_assets["specialty_quickrevive"] = spawnstruct();
	level.machine_assets["specialty_quickrevive"].weapon = GetWeapon("zombie_perk_bottle_revive");
	level.machine_assets["specialty_quickrevive"].off_model = "p7_zm_vending_revive";
	level.machine_assets["specialty_quickrevive"].on_model = "p7_zm_vending_revive";
}

/*
	Name: quick_revive_register_clientfield
	Namespace: zm_perk_quick_revive
	Checksum: 0xFAEAC2FD
	Offset: 0x6F0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 116
*/
function quick_revive_register_clientfield()
{
	clientfield::register("clientuimodel", "hudItems.perks.quick_revive", 1, 2, "int");
}

/*
	Name: quick_revive_set_clientfield
	Namespace: zm_perk_quick_revive
	Checksum: 0xFF4227BA
	Offset: 0x730
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 131
*/
function quick_revive_set_clientfield(n_state)
{
	if(n_state != 0 && (level namespace_b8afaefc::function_9f353429("specialty_quickrevive") || self namespace_b8afaefc::function_9f353429("specialty_quickrevive")))
	{
		n_state = 2;
	}
	self clientfield::set_player_uimodel("hudItems.perks.quick_revive", n_state);
}

/*
	Name: quick_revive_perk_machine_setup
	Namespace: zm_perk_quick_revive
	Checksum: 0x5A10BB3E
	Offset: 0x7C0
	Size: 0x100
	Parameters: 4
	Flags: None
	Line Number: 150
*/
function quick_revive_perk_machine_setup(var_39cc5a0b, var_8bcf7b93, var_3189c3fc, e_collision)
{
	var_39cc5a0b.script_sound = "mus_perks_revive_jingle";
	var_39cc5a0b.script_string = "revive_perk";
	var_39cc5a0b.script_label = "mus_perks_revive_sting";
	var_39cc5a0b.target = "vending_revive";
	var_8bcf7b93.script_string = "revive_perk";
	var_8bcf7b93.targetname = "vending_revive";
	if(isdefined(var_3189c3fc))
	{
		var_3189c3fc.script_string = "revive_perk";
	}
	var_8bcf7b93 thread namespace_b8afaefc::function_2a628bd("specialty_quickrevive", "i_fxt_zmb_perk_revive", (0.082352, 1, 1));
}

/*
	Name: function_eae0379d
	Namespace: zm_perk_quick_revive
	Checksum: 0xAFE3E99C
	Offset: 0x8C8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 175
*/
function function_eae0379d()
{
	namespace_b8afaefc::function_ffb18d9f("specialty_quickrevive", "3.0.4");
	if(level namespace_b8afaefc::function_9f353429("specialty_quickrevive"))
	{
		self namespace_b8afaefc::function_7932e598("specialty_quickrevive");
	}
	if(self namespace_b8afaefc::function_9f353429("specialty_quickrevive"))
	{
		return;
	}
	self thread function_e86cd368(1);
}

/*
	Name: function_a73df4ff
	Namespace: zm_perk_quick_revive
	Checksum: 0xDFC31179
	Offset: 0x978
	Size: 0x20
	Parameters: 3
	Flags: None
	Line Number: 199
*/
function function_a73df4ff(b_pause, str_perk, str_result)
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ff319ef3
	Namespace: zm_perk_quick_revive
	Checksum: 0x7FEFF669
	Offset: 0x9A0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 215
*/
function function_ff319ef3()
{
	function_8a15cc20();
	return;
	ERROR: Bad function call
}

/*
	Name: function_ef1171f6
	Namespace: zm_perk_quick_revive
	Checksum: 0xE6F22BE0
	Offset: 0x9C0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 232
*/
function function_ef1171f6()
{
	level.check_quickrevive_hotjoin = &function_5d9a2f7;
	if(isdefined(1) && 1)
	{
		namespace_b8afaefc::function_38f810ea("specialty_quickrevive");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e86cd368
	Namespace: zm_perk_quick_revive
	Checksum: 0xD7B25B70
	Offset: 0xA10
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 253
*/
function function_e86cd368(b_enabled)
{
	if(isdefined(b_enabled) && b_enabled)
	{
		self thread function_94b2ca5();
	}
}

/*
	Name: function_94b2ca5
	Namespace: zm_perk_quick_revive
	Checksum: 0x7D64122D
	Offset: 0xA50
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 271
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
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fa6302dd
	Namespace: zm_perk_quick_revive
	Checksum: 0x279F537D
	Offset: 0xB08
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 306
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
	Checksum: 0xC132E498
	Offset: 0xB48
	Size: 0x728
	Parameters: 0
	Flags: None
	Line Number: 327
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
		else if(!(isdefined(solo_mode) && solo_mode))
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
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_e114993
	Namespace: zm_perk_quick_revive
	Checksum: 0x97213FBA
	Offset: 0x1278
	Size: 0x678
	Parameters: 2
	Flags: None
	Line Number: 446
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
		level notify("specialty_quickrevive" + "_power_on");
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
	Checksum: 0x4419D917
	Offset: 0x18F8
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 584
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
}

/*
	Name: function_5d9a2f7
	Namespace: zm_perk_quick_revive
	Checksum: 0x613441DC
	Offset: 0x19A0
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 609
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
	}
}

/*
	Name: function_a1a78155
	Namespace: zm_perk_quick_revive
	Checksum: 0xA1D89AF9
	Offset: 0x1B28
	Size: 0x390
	Parameters: 2
	Flags: None
	Line Number: 650
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
	Checksum: 0xF8796231
	Offset: 0x1EC0
	Size: 0x4F0
	Parameters: 1
	Flags: None
	Line Number: 722
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
	}
}

/*
	Name: function_7bd6670c
	Namespace: zm_perk_quick_revive
	Checksum: 0x5CEFBEE1
	Offset: 0x23B8
	Size: 0x400
	Parameters: 0
	Flags: None
	Line Number: 800
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
	Checksum: 0x2C4B682C
	Offset: 0x27C0
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 879
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
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_654d5402
	Namespace: zm_perk_quick_revive
	Checksum: 0x184C4401
	Offset: 0x28E0
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 909
*/
function function_654d5402(poweron)
{
	foreach(item in level.powered_items)
	{
		if(isdefined(item.target) && isdefined(item.target.script_noteworthy) && item.target.script_noteworthy == "specialty_quickrevive")
		{
			if(item.power && !poweron)
			{
				if(!isdefined(item.powered_count))
				{
					item.powered_count = 0;
				}
				else if(item.powered_count > 0)
				{
					item.powered_count--;
				}
			}
			else if(!item.power && poweron)
			{
				if(!isdefined(item.powered_count))
				{
					item.powered_count = 0;
				}
				item.powered_count++;
			}
			if(!isdefined(item.depowered_count))
			{
				item.depowered_count = 0;
			}
			item.power = poweron;
		}
	}
}

/*
	Name: function_9b08a050
	Namespace: zm_perk_quick_revive
	Checksum: 0x5504B79A
	Offset: 0x2AB0
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 953
*/
function function_9b08a050(revive_trigger_noteworthy)
{
	self endon("death");
	revive_perk_triggers = GetEntArray(revive_trigger_noteworthy, "script_noteworthy");
	foreach(revive_perk_trigger in revive_perk_triggers)
	{
		self thread function_c0dc6341(revive_perk_trigger);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c0dc6341
	Namespace: zm_perk_quick_revive
	Checksum: 0xD99639E2
	Offset: 0x2B88
	Size: 0xAC
	Parameters: 1
	Flags: None
	Line Number: 975
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

