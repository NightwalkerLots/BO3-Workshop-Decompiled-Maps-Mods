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

#namespace namespace_a8433520;

/*
	Name: __init__sytem__
	Namespace: namespace_a8433520
	Checksum: 0xA3299130
	Offset: 0x3D0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 29
*/
function autoexec __init__sytem__()
{
	system::register("hb21_sym_zm_trap_fan", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_a8433520
	Checksum: 0xF8F28A50
	Offset: 0x410
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	clientfield::register("scriptmover", "acid_trap_fx", 1, 1, "int");
	zm_traps::register_trap_basic_info("fan", &function_8cefd72e, undefined);
}

/*
	Name: function_8cefd72e
	Namespace: namespace_a8433520
	Checksum: 0x81375478
	Offset: 0x478
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function function_8cefd72e()
{
	self._trap_duration = 40;
	self._trap_cooldown_time = 60;
	self notify("trap_activate");
	level notify("trap_activate", self);
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i] thread function_a6a0d3d7();
	}
	self thread function_ad3d5123();
	self util::waittill_notify_or_timeout("trap_deactivate", self._trap_duration);
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i] thread function_37c33e70();
	}
	wait(1);
	self notify("trap_done");
}

/*
	Name: function_ad3d5123
	Namespace: namespace_a8433520
	Checksum: 0x51CFC2F5
	Offset: 0x5A0
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function function_ad3d5123()
{
	self endon("trap_done");
	while(isdefined(self))
	{
		self waittill("trigger", e_ent);
		if(isdefined(e_ent.marked_for_death) && e_ent.marked_for_death || (isdefined(e_ent.var_98f3774b) && e_ent.var_98f3774b))
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
			e_ent DoDamage(self.health, e_ent.origin);
			continue;
		}
		e_ent thread function_6e210af6(self);
	}
}

/*
	Name: function_6e210af6
	Namespace: namespace_a8433520
	Checksum: 0x304DCCCA
	Offset: 0x6D0
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 124
*/
function function_6e210af6(e_trap)
{
	playsoundatposition("wpn_thundergun_proj_impact", self.origin);
	if(isdefined(self.var_4a6f1528))
	{
		self [[self.var_4a6f1528]](e_trap);
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
		return;
	}
}

/*
	Name: function_a6a0d3d7
	Namespace: namespace_a8433520
	Checksum: 0xA648F35F
	Offset: 0x8A0
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 165
*/
function function_a6a0d3d7()
{
	self playsound("evt_fan_trap_start");
	self useanimtree(-1);
	self AnimScripted("fxanim_zom_al_trap_fan_start_anim", self.origin, self.angles, "fxanim_zom_al_trap_fan_start_anim");
	wait(getanimlength("fxanim_zom_al_trap_fan_start_anim"));
	self PlayLoopSound("evt_fan_trap_loop");
	self clientfield::set("acid_trap_fx", 1);
	self AnimScripted("fxanim_zom_al_trap_fan_idle_anim", self.origin, self.angles, "fxanim_zom_al_trap_fan_idle_anim");
}

/*
	Name: function_37c33e70
	Namespace: namespace_a8433520
	Checksum: 0x1358D8C8
	Offset: 0x9B8
	Size: 0x94
	Parameters: 0
	Flags: None
	Line Number: 186
*/
function function_37c33e70()
{
	self StopLoopSound(1);
	self clientfield::set("acid_trap_fx", 0);
	self AnimScripted("fxanim_zom_al_trap_fan_end_anim", self.origin, self.angles, "fxanim_zom_al_trap_fan_end_anim");
	self playsound("evt_fan_trap_stop");
}

