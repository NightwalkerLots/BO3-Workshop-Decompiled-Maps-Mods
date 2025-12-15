#include scripts\codescripts\struct;
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

#namespace namespace_c1974c3d;

/*
	Name: __init__sytem__
	Namespace: namespace_c1974c3d
	Checksum: 0xAA54E149
	Offset: 0x300
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 25
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_trap_flogger", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: __init__
	Namespace: namespace_c1974c3d
	Checksum: 0x7C72DB40
	Offset: 0x340
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 43
*/
function __init__()
{
	zm_traps::register_trap_basic_info("rotating", &function_c969ec33, undefined);
}

/*
	Name: function_c969ec33
	Namespace: namespace_c1974c3d
	Checksum: 0x6BC9D401
	Offset: 0x378
	Size: 0x380
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function function_c969ec33()
{
	self._trap_duration = 30;
	self._trap_cooldown_time = 60;
	self EnableLinkTo();
	self LinkTo(self._trap_movers[0]);
	a_targets = GetEntArray(self.target, "targetname");
	for(i = 0; i < a_targets.size; i++)
	{
		if(a_targets[i].script_noteworthy == "belt")
		{
			a_targets[i] SetModel("p7_zm_gen_flogger_trap_belt_on");
			playsoundatposition("evt_motor_start", a_targets[i].origin);
			a_targets[i] PlayLoopSound("evt_motor_loop", 0.5);
			continue;
		}
		if(a_targets[i].script_noteworthy == "mover")
		{
			a_targets[i] PlayLoopSound("evt_cent_lowend_loop", 0.5);
		}
	}
	self thread function_a9cfe48();
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i] RotatePitch(Int(self._trap_duration * 360), self._trap_duration, 6, 6);
	}
	self util::waittill_notify_or_timeout("trap_deactivate", self._trap_duration);
	self Unlink();
	for(i = 0; i < a_targets.size; i++)
	{
		if(a_targets[i].script_noteworthy == "belt")
		{
			a_targets[i] SetModel("p7_zm_gen_flogger_trap_belt");
			playsoundatposition("evt_motor_stop", a_targets[i].origin);
			a_targets[i] StopLoopSound(0.5);
			continue;
		}
		if(a_targets[i].script_noteworthy == "mover")
		{
			a_targets[i] StopLoopSound(0.5);
		}
	}
	self notify("trap_done");
}

/*
	Name: function_a9cfe48
	Namespace: namespace_c1974c3d
	Checksum: 0xDDB9B5C4
	Offset: 0x700
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 113
*/
function function_a9cfe48()
{
	self endon("trap_done");
	while(1)
	{
		self waittill("trigger", e_ent);
		if(!isdefined(e_ent) || (isdefined(e_ent.sessionstate) && (isdefined(e_ent.sessionstate == "spectator") && e_ent.sessionstate == "spectator")) || (isdefined(e_ent.marked_for_death) && e_ent.marked_for_death) || (isdefined(e_ent.var_a4a35780) && e_ent.var_a4a35780))
		{
			continue;
		}
		if(isPlayer(e_ent))
		{
			if(e_ent GetStance() == "stand")
			{
				e_ent DoDamage(50, e_ent.origin + VectorScale((0, 0, 1), 20));
				e_ent SetStance("crouch");
				continue;
			}
		}
		e_ent thread function_559f0d25(self);
	}
}

/*
	Name: function_559f0d25
	Namespace: namespace_c1974c3d
	Checksum: 0x8F8596E9
	Offset: 0x890
	Size: 0x1DC
	Parameters: 1
	Flags: None
	Line Number: 146
*/
function function_559f0d25(e_trap)
{
	playsoundatposition("wpn_thundergun_proj_impact", self.origin);
	if(isdefined(self.var_a153f4ef))
	{
		self [[self.var_a153f4ef]](e_trap);
		return;
	}
	else if(isdefined(self.trap_reaction_func))
	{
		self [[self.trap_reaction_func]](e_trap);
		return;
	}
	self.marked_for_death = 1;
	v_ang = VectorToAngles(e_trap.origin - self.origin);
	var_504aa06c = VectorScale(AnglesToForward(v_ang + VectorScale((0, 1, 0), 180)), 200);
	level notify("trap_kill", self, e_trap);
	self thread zombie_utility::gib_random_parts();
	self StartRagdoll();
	self LaunchRagdoll(var_504aa06c);
	util::wait_network_frame();
	self DoDamage(self.health, self.origin, e_trap);
	if(isdefined(e_trap.activated_by_player) && isPlayer(e_trap.activated_by_player))
	{
		e_trap.activated_by_player zm_stats::increment_challenge_stat("ZOMBIE_HUNTER_KILL_TRAP");
	}
}

