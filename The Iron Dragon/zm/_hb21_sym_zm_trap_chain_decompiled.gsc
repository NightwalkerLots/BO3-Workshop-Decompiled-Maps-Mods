#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_traps;
#include scripts\zm\_zm_utility;

#namespace namespace_6027939c;

/*
	Name: __init__sytem__
	Namespace: namespace_6027939c
	Checksum: 0x41BD9BFF
	Offset: 0x5B8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 27
*/
function autoexec __init__sytem__()
{
	system::register("hb21_sym_zm_trap_chain", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_6027939c
	Checksum: 0x4B5B8C5B
	Offset: 0x600
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function __init__()
{
	if(!isdefined(level._zombiemode_trap_use_funcs))
	{
		level._zombiemode_trap_use_funcs = [];
	}
	zm_traps::register_trap_basic_info("chain", &function_caad1a2a, undefined);
	level._zombiemode_trap_use_funcs["chain"] = &function_4bdc1fef;
}

/*
	Name: __main__
	Namespace: namespace_6027939c
	Checksum: 0xE69062EE
	Offset: 0x670
	Size: 0x2F0
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function __main__()
{
	a_traps = GetEntArray("zombie_trap", "targetname");
	if(!isdefined(a_traps) || !IsArray(a_traps) || a_traps.size < 1)
	{
		return;
	}
	for(i = 0; i < a_traps.size; i++)
	{
		if(isdefined(a_traps[i].script_noteworthy) && a_traps[i].script_noteworthy == "chain")
		{
			a_targets = GetEntArray(a_traps[i].target, "targetname");
			for(t = 0; t < a_targets.size; t++)
			{
				if(isdefined(a_targets[t].script_noteworthy) && a_targets[t].script_noteworthy == "switch")
				{
					a_targets[t] useanimtree(-1);
					a_targets[t] AnimScripted("p7_fxanim_zm_zod_chain_trap_heart_low_anim", a_targets[t].origin, a_targets[t].angles, "p7_fxanim_zm_zod_chain_trap_heart_low_anim");
					a_targets[t] PlayLoopSound("evt_chain_trap_heartbeat");
					continue;
				}
				if(isdefined(a_targets[t].script_noteworthy) && a_targets[t].script_noteworthy == "mover")
				{
					a_targets[t] useanimtree(-1);
					a_targets[t] AnimScripted("p7_fxanim_zm_zod_chain_trap_end_idle_anim", a_targets[t].origin, a_targets[t].angles, "p7_fxanim_zm_zod_chain_trap_end_idle_anim");
					a_targets[t] PlayLoopSound("evt_chain_trap_idle");
				}
			}
		}
	}
}

/*
	Name: function_4bdc1fef
	Namespace: namespace_6027939c
	Checksum: 0x926EB2C2
	Offset: 0x968
	Size: 0x348
	Parameters: 1
	Flags: None
	Line Number: 104
*/
function function_4bdc1fef(e_trap)
{
	while(isdefined(self))
	{
		self waittill("trigger", e_player);
		if(e_player zm_utility::in_revive_trigger() || e_player.IS_DRINKING > 0)
		{
			continue;
		}
		if(zm_utility::is_player_valid(e_player) && !e_trap._trap_in_use)
		{
			if(e_player zm_score::can_player_purchase(e_trap.zombie_cost))
			{
				e_player zm_score::minus_to_player_score(e_trap.zombie_cost);
				continue;
			}
			playsoundatposition("zmb_trap_deny", e_trap.origin);
			e_player zm_audio::create_and_play_dialog("general", "outofmoney");
			continue;
			e_trap.activated_by_player = e_player;
			e_trap._trap_in_use = 1;
			e_trap zm_traps::trap_set_string(&"ZOMBIE_TRAP_ACTIVE");
			zm_utility::play_sound_at_pos("purchase", e_player.origin);
			if(!(isdefined(level.b_trap_start_custom_vo) && level.b_trap_start_custom_vo))
			{
				e_player zm_audio::create_and_play_dialog("trap", "start");
			}
			if(e_trap._trap_switches.size)
			{
				e_trap thread function_c34113f5();
				e_trap waittill("switch_activated");
			}
			e_trap TriggerEnable(1);
			e_trap thread [[e_trap._trap_activate_func]]();
			e_trap waittill("trap_done");
			e_trap TriggerEnable(0);
			e_trap._trap_cooling_down = 1;
			e_trap zm_traps::trap_set_string(&"ZOMBIE_TRAP_COOLDOWN");
			wait(e_trap._trap_cooldown_time);
			e_trap._trap_cooling_down = 0;
			playsoundatposition("zmb_trap_ready", e_trap.origin);
			if(isdefined(level.sndTrapFunc))
			{
				level thread [[level.sndTrapFunc]](e_trap, 0);
			}
			e_trap notify("available");
			e_trap._trap_in_use = 0;
			e_trap zm_traps::trap_set_string(&"ZOMBIE_BUTTON_BUY_TRAP", e_trap.zombie_cost);
		}
	}
}

/*
	Name: function_c34113f5
	Namespace: namespace_6027939c
	Checksum: 0xAF331075
	Offset: 0xCB8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 166
*/
function function_c34113f5()
{
	self thread function_247f86e2();
	wait(getanimlength("p7_fxanim_zm_zod_chain_trap_heart_pull_anim") / 2);
	self notify("switch_activated");
	self waittill("trap_done");
	self thread function_55d7321a();
	self waittill("available");
	self thread function_254b91b5();
}

/*
	Name: function_caad1a2a
	Namespace: namespace_6027939c
	Checksum: 0xCB3159EF
	Offset: 0xD50
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 187
*/
function function_caad1a2a()
{
	self._trap_duration = 40;
	self._trap_cooldown_time = 60;
	self notify("trap_activate");
	level notify("trap_activate", self);
	playsoundatposition("evt_chain_trap_start", self.origin);
	self thread function_a748b9c();
	var_58bca934 = util::spawn_model("tag_origin", self.origin, self.angles);
	var_58bca934 PlayLoopSound("evt_chain_trap_loop", 1);
	self thread function_a37b193a();
	self util::waittill_notify_or_timeout("trap_deactivate", self._trap_duration - 3);
	self thread function_5088108e();
	var_58bca934 StopLoopSound(3);
	self util::waittill_notify_or_timeout("trap_deactivate", 3);
	var_58bca934 delete();
	playsoundatposition("evt_chain_trap_stop", self.origin);
	self notify("trap_done");
}

/*
	Name: function_a37b193a
	Namespace: namespace_6027939c
	Checksum: 0x57D0676C
	Offset: 0xF00
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 217
*/
function function_a37b193a()
{
	self endon("trap_done");
	while(isdefined(self))
	{
		self waittill("trigger", e_ent);
		if(isdefined(e_ent.marked_for_death) && e_ent.marked_for_death || (isdefined(e_ent.var_f7ed1497) && e_ent.var_f7ed1497))
		{
			continue;
		}
		if(isPlayer(e_ent))
		{
			if(e_ent function_679da569())
			{
				continue;
			}
			playsoundatposition("wpn_thundergun_proj_impact", e_ent.origin);
			e_ent DoDamage(e_ent.health, e_ent.origin);
			continue;
		}
		e_ent thread function_59007626(self);
	}
}

/*
	Name: function_59007626
	Namespace: namespace_6027939c
	Checksum: 0xD0959CF6
	Offset: 0x1038
	Size: 0x1C0
	Parameters: 1
	Flags: None
	Line Number: 251
*/
function function_59007626(e_trap)
{
	playsoundatposition("wpn_thundergun_proj_impact", self.origin);
	if(isdefined(self.var_b6ca43cc))
	{
		self [[self.var_b6ca43cc]](e_trap);
		return;
	}
	else if(isdefined(self.trap_reaction_func))
	{
		self [[self.trap_reaction_func]](e_trap);
		return;
	}
	self.marked_for_death = 1;
	level notify("trap_kill", self, e_trap);
	if(isdefined(self.isdog) && self.isdog)
	{
		continue;
	}
	str_tag = "j_spineupper";
	playFX(level._effect["zombie_guts_explosion"], self GetTagOrigin(str_tag));
	self zombie_utility::gib_random_parts();
	self ghost();
	self DoDamage(self.health, self.origin, e_trap);
	if(isdefined(e_trap.activated_by_player) && isPlayer(e_trap.activated_by_player))
	{
		e_trap.activated_by_player zm_stats::increment_challenge_stat("ZOMBIE_HUNTER_KILL_TRAP");
	}
}

/*
	Name: function_247f86e2
	Namespace: namespace_6027939c
	Checksum: 0xB15DA0A
	Offset: 0x1200
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 291
*/
function function_247f86e2()
{
	for(i = 0; i < self._trap_switches.size; i++)
	{
		self._trap_switches[i] AnimScripted("p7_fxanim_zm_zod_chain_trap_heart_pull_anim", self._trap_switches[i].origin, self._trap_switches[i].angles, "p7_fxanim_zm_zod_chain_trap_heart_pull_anim");
	}
	self._trap_switches[i] StopLoopSound();
	wait(getanimlength("p7_fxanim_zm_zod_chain_trap_heart_pull_anim"));
	for(i = 0; i < self._trap_switches.size; i++)
	{
		self._trap_switches[i] AnimScripted("p7_fxanim_zm_zod_chain_trap_heart_fast_anim", self._trap_switches[i].origin, self._trap_switches[i].angles, "p7_fxanim_zm_zod_chain_trap_heart_fast_anim");
	}
}

/*
	Name: function_55d7321a
	Namespace: namespace_6027939c
	Checksum: 0x5F470DB4
	Offset: 0x1350
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 315
*/
function function_55d7321a()
{
	for(i = 0; i < self._trap_switches.size; i++)
	{
		self._trap_switches[i] AnimScripted("p7_fxanim_zm_zod_chain_trap_heart_med_anim", self._trap_switches[i].origin, self._trap_switches[i].angles, "p7_fxanim_zm_zod_chain_trap_heart_med_anim");
	}
}

/*
	Name: function_254b91b5
	Namespace: namespace_6027939c
	Checksum: 0x6A98D2C
	Offset: 0x13E8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 333
*/
function function_254b91b5()
{
	for(i = 0; i < self._trap_switches.size; i++)
	{
		self._trap_switches[i] AnimScripted("p7_fxanim_zm_zod_chain_trap_heart_low_anim", self._trap_switches[i].origin, self._trap_switches[i].angles, "p7_fxanim_zm_zod_chain_trap_heart_low_anim");
	}
	self._trap_switches[i] PlayLoopSound("evt_chain_trap_heartbeat");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a748b9c
	Namespace: namespace_6027939c
	Checksum: 0x3EAE215
	Offset: 0x14A8
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 354
*/
function function_a748b9c()
{
	if(isdefined(self.script_string))
	{
		continue;
	}
	var_fa7465ea = "p7_fxanim_zm_zod_chain_trap_start_anim";
	if(isdefined(self.script_string))
	{
		continue;
	}
	var_de6d555 = "p7_fxanim_zm_zod_chain_trap_on_anim";
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i] AnimScripted(var_fa7465ea, self._trap_movers[i].origin, self._trap_movers[i].angles, var_fa7465ea);
	}
	wait(getanimlength(var_fa7465ea));
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i] AnimScripted(var_de6d555, self._trap_movers[i].origin, self._trap_movers[i].angles, var_de6d555);
	}
	return;
}

/*
	Name: function_5088108e
	Namespace: namespace_6027939c
	Checksum: 0xE719BEAD
	Offset: 0x1640
	Size: 0x286
	Parameters: 0
	Flags: None
	Line Number: 388
*/
function function_5088108e()
{
	if(isdefined(self.script_string))
	{
		continue;
	}
	var_6fb78761 = "p7_fxanim_zm_zod_chain_trap_end_anim";
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i] AnimScripted("p7_fxanim_zm_zod_chain_trap_symbol_on_anim", self._trap_movers[i].origin, self._trap_movers[i].angles, "p7_fxanim_zm_zod_chain_trap_symbol_on_anim");
	}
	wait(getanimlength("p7_fxanim_zm_zod_chain_trap_symbol_on_anim"));
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i] AnimScripted(var_6fb78761, self._trap_movers[i].origin, self._trap_movers[i].angles, var_6fb78761);
	}
	wait(getanimlength(var_6fb78761));
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i] AnimScripted("p7_fxanim_zm_zod_chain_trap_symbol_off_anim", self._trap_movers[i].origin, self._trap_movers[i].angles, "p7_fxanim_zm_zod_chain_trap_symbol_off_anim");
	}
	self waittill("available");
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i] AnimScripted("p7_fxanim_zm_zod_chain_trap_end_idle_anim", self._trap_movers[i].origin, self._trap_movers[i].angles, "p7_fxanim_zm_zod_chain_trap_end_idle_anim");
	}
}

