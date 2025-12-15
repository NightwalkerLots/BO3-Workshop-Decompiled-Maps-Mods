#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_ai_shared;
#include scripts\shared\vehicle_shared;
#include scripts\shared\vehicles\_auto_turret;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_traps;
#include scripts\zm\_zm_utility;

#namespace namespace_2a8101c8;

/*
	Name: __init__sytem__
	Namespace: namespace_2a8101c8
	Checksum: 0xDAAAEF75
	Offset: 0x380
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 29
*/
function autoexec __init__sytem__()
{
	system::register("hb21_sym_zm_trap_gate", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_2a8101c8
	Checksum: 0x7F214452
	Offset: 0x3C0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	zm_traps::register_trap_basic_info("gate", &function_32b73496, undefined);
}

/*
	Name: function_32b73496
	Namespace: namespace_2a8101c8
	Checksum: 0x2EEA8C3E
	Offset: 0x3F8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 59
*/
function function_32b73496()
{
	self._trap_duration = 40;
	self._trap_cooldown_time = 60;
	self notify("trap_activate");
	level notify("trap_activate", self);
	self thread function_28e30baf();
	self util::waittill_notify_or_timeout("trap_deactivate", self._trap_duration);
	self notify("trap_done");
}

/*
	Name: function_28e30baf
	Namespace: namespace_2a8101c8
	Checksum: 0xF98C4E20
	Offset: 0x488
	Size: 0x210
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function function_28e30baf()
{
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i] useanimtree(-1);
		e_damage_trigger = GetEnt(self._trap_movers[i].target, "targetname");
		e_damage_trigger EnableLinkTo();
		e_damage_trigger LinkTo(self._trap_movers[i], "gate_jnt");
		e_damage_trigger thread function_acac7d8b(self);
		self._trap_movers[i].var_f40ad016 = GetEnt(e_damage_trigger.target, "targetname");
		self._trap_movers[i].var_f40ad016 useanimtree(-1);
	}
	self function_27154d20();
	for(i = 0; i < self._trap_movers.size; i++)
	{
		while(self._trap_movers[i] IsPlayingAnimScripted())
		{
			wait(0.05);
		}
		e_damage_trigger = GetEnt(self._trap_movers[i].target, "targetname");
		e_damage_trigger Unlink();
	}
}

/*
	Name: function_27154d20
	Namespace: namespace_2a8101c8
	Checksum: 0xF45CF7CE
	Offset: 0x6A0
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 114
*/
function function_27154d20()
{
	self endon("trap_done");
	while(isdefined(self))
	{
		for(i = 0; i < self._trap_movers.size; i++)
		{
			self._trap_movers[i] AnimScripted("p7_fxanim_zm_castle_gate_door_smash_anim", self._trap_movers[i].origin, self._trap_movers[i].angles, "p7_fxanim_zm_castle_gate_door_smash_anim");
			self._trap_movers[i].var_f40ad016 AnimScripted("p7_fxanim_zm_castle_gate_base_smash_anim", self._trap_movers[i].var_f40ad016.origin, self._trap_movers[i].var_f40ad016.angles, "p7_fxanim_zm_castle_gate_base_smash_anim");
			if(isdefined(undefined))
			{
				wait(undefined);
				continue;
			}
			wait(getanimlength("p7_fxanim_zm_castle_gate_door_smash_anim"));
		}
	}
}

/*
	Name: function_acac7d8b
	Namespace: namespace_2a8101c8
	Checksum: 0x4B59FCC0
	Offset: 0x7F8
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 143
*/
function function_acac7d8b(e_trap)
{
	e_trap endon("trap_done");
	while(isdefined(self))
	{
		self waittill("trigger", e_ent);
		if(isdefined(e_ent.marked_for_death) || (isdefined(e_ent.var_75712315) && e_ent.var_75712315))
		{
			continue;
		}
		playsoundatposition("wpn_thundergun_proj_impact", e_ent.origin);
		if(isPlayer(e_ent))
		{
			e_ent DoDamage(e_ent.health + 666, e_ent.origin);
			continue;
		}
		e_ent thread function_50299e7e(e_trap);
	}
}

/*
	Name: function_50299e7e
	Namespace: namespace_2a8101c8
	Checksum: 0x1F1DAA1F
	Offset: 0x910
	Size: 0x1A4
	Parameters: 1
	Flags: None
	Line Number: 173
*/
function function_50299e7e(e_trap)
{
	if(isdefined(self.var_62560ef6))
	{
		self [[self.var_62560ef6]](e_trap);
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
	self DoDamage(self.health + 666, self.origin, e_trap);
	if(isdefined(e_trap.activated_by_player) && isPlayer(e_trap.activated_by_player))
	{
		e_trap.activated_by_player zm_stats::increment_challenge_stat("ZOMBIE_HUNTER_KILL_TRAP");
	}
}

