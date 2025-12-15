#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_traps;
#include scripts\zm\_zm_utility;

#namespace namespace_75e0af07;

/*
	Name: __init__sytem__
	Namespace: namespace_75e0af07
	Checksum: 0xD167FF4
	Offset: 0x300
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 26
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_trap_centrifuge", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_75e0af07
	Checksum: 0xF3B03ACF
	Offset: 0x340
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 41
*/
function __init__()
{
	zm_traps::register_trap_basic_info("centrifuge", &function_2823df91, undefined);
	clientfield::register("scriptmover", "centrifuge_lights", 1, 1, "int");
}

/*
	Name: function_2823df91
	Namespace: namespace_75e0af07
	Checksum: 0x6D414DFB
	Offset: 0x3A8
	Size: 0x3A8
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function function_2823df91()
{
	self._trap_duration = 30;
	self._trap_cooldown_time = 60;
	self EnableLinkTo();
	self LinkTo(self._trap_movers[0]);
	self thread function_374e3f62();
	old_angles = self._trap_movers[0].angles;
	self._trap_movers[0] playsound("evt_cent_alarm");
	self._trap_movers[0] playsound("evt_cent_start");
	self._trap_movers[0] clientfield::set("centrifuge_lights", 1);
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i] RotateYaw(360, 5, 4.5);
	}
	wait(5);
	step = 1.5;
	self._trap_movers[0] PlayLoopSound("evt_cent_lowend_loop", 0.6);
	self._trap_movers[0] PlayLoopSound("evt_cent_mach_loop", 0.6);
	for(t = 0; t < self._trap_duration; t = 0)
	{
		for(i = 0; i < self._trap_movers.size; i++)
		{
			self._trap_movers[i] RotateYaw(360, step);
		}
		wait(step);
	}
	self._trap_movers[0] StopLoopSound(2);
	self._trap_movers[0] playsound("evt_cent_end");
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i] RotateYaw(360, 5, 0, 4.5);
	}
	wait(5);
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i].angles = old_angles;
	}
	self Unlink();
	self._trap_movers[0] clientfield::set("centrifuge_lights", 0);
	self notify("trap_done", t + step);
}

/*
	Name: function_374e3f62
	Namespace: namespace_75e0af07
	Checksum: 0x8BD1D06B
	Offset: 0x758
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 110
*/
function function_374e3f62()
{
	self endon("trap_done");
	while(1)
	{
		self waittill("trigger", e_ent);
		if(!isdefined(e_ent) || (isdefined(e_ent.sessionstate) && (isdefined(e_ent.sessionstate == "spectator") && e_ent.sessionstate == "spectator")) || (isdefined(e_ent.marked_for_death) && e_ent.marked_for_death) || (isdefined(e_ent.var_d85077c0) && e_ent.var_d85077c0))
		{
			continue;
		}
		if(isPlayer(e_ent))
		{
			if(e_ent GetStance() == "stand")
			{
				e_ent DoDamage(50, e_ent.origin);
				e_ent SetStance("crouch");
				continue;
			}
		}
		e_ent thread function_20f984d3(self);
	}
}

/*
	Name: function_20f984d3
	Namespace: namespace_75e0af07
	Checksum: 0xB81666C6
	Offset: 0x8D8
	Size: 0x1BC
	Parameters: 1
	Flags: None
	Line Number: 143
*/
function function_20f984d3(e_trap)
{
	playsoundatposition("wpn_thundergun_proj_impact", self.origin);
	if(isdefined(self.var_8474012f))
	{
		self [[self.var_8474012f]](e_trap);
		return;
	}
	else if(isdefined(self.trap_reaction_func))
	{
		self [[self.trap_reaction_func]](e_trap);
		return;
	}
	self.marked_for_death = 1;
	v_ang = VectorToAngles(e_trap.origin - self.origin);
	var_504aa06c = VectorScale(AnglesToRight(v_ang), 200);
	level notify("trap_kill", self, e_trap);
	GibServerUtils::GibHead(self);
	self StartRagdoll();
	self LaunchRagdoll(var_504aa06c);
	self DoDamage(self.health, self.origin, e_trap);
	if(isdefined(e_trap.activated_by_player) && isPlayer(e_trap.activated_by_player))
	{
		e_trap.activated_by_player zm_stats::increment_challenge_stat("ZOMBIE_HUNTER_KILL_TRAP");
	}
}

