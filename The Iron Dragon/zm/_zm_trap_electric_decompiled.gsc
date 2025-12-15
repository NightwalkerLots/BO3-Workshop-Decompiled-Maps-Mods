#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_traps;
#include scripts\zm\_zm_utility;

#namespace zm_trap_electric;

/*
	Name: __init__sytem__
	Namespace: zm_trap_electric
	Checksum: 0x660828CF
	Offset: 0x3B8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("zm_trap_electric", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_trap_electric
	Checksum: 0xAE61D7D3
	Offset: 0x3F8
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	level._effect["elec_torso"] = "zombie/fx_elec_player_torso_zmb";
	level._effect["elec_md"] = "zombie/fx_elec_player_md_zmb";
	level._effect["elec_sm"] = "zombie/fx_elec_player_sm_zmb";
	zm_traps::register_trap_basic_info("electric", &trap_activate_electric, &trap_audio);
	zm_traps::register_trap_damage("electric", &player_damage, &damage);
	if(!isdefined(level.vsmgr_prio_overlay_zm_trap_electrified))
	{
		level.vsmgr_prio_overlay_zm_trap_electrified = 60;
	}
	visionset_mgr::register_info("overlay", "zm_trap_electric", 1, level.vsmgr_prio_overlay_zm_trap_electrified, 15, 1, &visionset_mgr::duration_lerp_thread_per_player, 0);
	level.trap_electric_visionset_registered = 1;
	a_traps = struct::get_array("trap_electric", "targetname");
	foreach(trap in a_traps)
	{
		clientfield::register("world", trap.script_noteworthy, 1, 1, "int");
	}
}

/*
	Name: trap_activate_electric
	Namespace: zm_trap_electric
	Checksum: 0x316D55B8
	Offset: 0x600
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function trap_activate_electric()
{
	self._trap_duration = 40;
	self._trap_cooldown_time = 60;
	if(isdefined(level.sndTrapFunc))
	{
		level thread [[level.sndTrapFunc]](self, 1);
	}
	self notify("trap_activate");
	level notify("trap_activate", self);
	level clientfield::set(self.target, 1);
	fx_points = struct::get_array(self.target, "targetname");
	for(i = 0; i < fx_points.size; i++)
	{
		util::wait_network_frame();
		fx_points[i] thread trap_audio(self);
	}
	self thread zm_traps::trap_damage();
	self util::waittill_notify_or_timeout("trap_deactivate", self._trap_duration);
	self notify("trap_done");
	level clientfield::set(self.target, 0);
}

/*
	Name: trap_audio
	Namespace: zm_trap_electric
	Checksum: 0x1BE2E706
	Offset: 0x780
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 102
*/
function trap_audio(trap)
{
	sound_origin = spawn("script_origin", self.origin);
	sound_origin playsound("wpn_zmb_inlevel_trap_start");
	sound_origin PlayLoopSound("wpn_zmb_inlevel_trap_loop");
	self thread play_electrical_sound(trap);
	trap util::waittill_any_timeout(trap._trap_duration, "trap_done");
	if(isdefined(sound_origin))
	{
		playsoundatposition("wpn_zmb_inlevel_trap_stop", sound_origin.origin);
		sound_origin StopLoopSound();
		wait(0.05);
		sound_origin delete();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: play_electrical_sound
	Namespace: zm_trap_electric
	Checksum: 0x1310F7EF
	Offset: 0x8A8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 130
*/
function play_electrical_sound(trap)
{
	trap endon("trap_done");
	while(1)
	{
		wait(RandomFloatRange(0.1, 0.5));
		playsoundatposition("amb_sparks", self.origin);
	}
}

/*
	Name: player_damage
	Namespace: zm_trap_electric
	Checksum: 0x3A956A0C
	Offset: 0x918
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 150
*/
function player_damage()
{
	if(!(isdefined(self.b_no_trap_damage) && self.b_no_trap_damage))
	{
		self thread zm_traps::player_elec_damage();
	}
}

/*
	Name: damage
	Namespace: zm_trap_electric
	Checksum: 0x45655BD2
	Offset: 0x950
	Size: 0x38C
	Parameters: 1
	Flags: None
	Line Number: 168
*/
function damage(trap)
{
	self endon("death");
	n_param = RandomInt(100);
	self.marked_for_death = 1;
	if(isdefined(trap.activated_by_player) && isPlayer(trap.activated_by_player))
	{
		trap.activated_by_player zm_stats::increment_challenge_stat("ZOMBIE_HUNTER_KILL_TRAP");
		if(isdefined(trap.activated_by_player.zapped_zombies))
		{
			trap.activated_by_player.zapped_zombies++;
			trap.activated_by_player notify("zombie_zapped");
		}
	}
	if(isdefined(self.animName) && self.animName != "zombie_dog" && IsActor(self))
	{
		if(n_param > 90 && level.burning_zombies.size < 6)
		{
			level.burning_zombies[level.burning_zombies.size] = self;
			self thread zm_traps::zombie_flame_watch();
			self playsound("zmb_ignite");
			self thread zombie_death::flame_death_fx();
			PlayFXOnTag(level._effect["character_fire_death_torso"], self, "J_SpineLower");
			wait(RandomFloat(1.25));
			continue;
		}
		refs[0] = "guts";
		refs[1] = "right_arm";
		refs[2] = "left_arm";
		refs[3] = "right_leg";
		refs[4] = "left_leg";
		refs[5] = "no_legs";
		refs[6] = "head";
		self.a.gib_ref = refs[RandomInt(refs.size)];
		playsoundatposition("wpn_zmb_electrap_zap", self.origin);
		self thread zm_traps::electroctute_death_fx();
		self notify("bhtn_action_notify", "electrocute");
		wait(RandomFloat(1.25));
		self playsound("wpn_zmb_electrap_zap");
	}
	if(isdefined(self.fire_damage_func))
	{
		self [[self.fire_damage_func]](trap);
		continue;
	}
	level notify("trap_kill", self, trap);
	self DoDamage(self.health + 666, self.origin, trap);
}

