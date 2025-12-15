#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_ai_shared;
#include scripts\shared\vehicle_shared;
#include scripts\shared\vehicles\_auto_turret;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_playerhealth;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_traps;
#include scripts\zm\_zm_utility;

#namespace namespace_43042162;

/*
	Name: __init__sytem__
	Namespace: namespace_43042162
	Checksum: 0xEB112D12
	Offset: 0x3E0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 30
*/
function autoexec __init__sytem__()
{
	system::register("hb21_sym_zm_trap_acid", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_43042162
	Checksum: 0x4A3AB66D
	Offset: 0x420
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function __init__()
{
	clientfield::register("actor", "trap_acid_ai_disintegrate", 1, 1, "int");
	clientfield::register("vehicle", "trap_acid_ai_disintegrate", 1, 1, "int");
	a_traps = struct::get_array("trap_acid", "targetname");
	foreach(e_trap in a_traps)
	{
		clientfield::register("world", e_trap.script_noteworthy, 1, 1, "int");
	}
	zm_traps::register_trap_basic_info("acid", &function_c7fd97f0, undefined);
}

/*
	Name: function_c7fd97f0
	Namespace: namespace_43042162
	Checksum: 0x7CDBDB45
	Offset: 0x588
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 67
*/
function function_c7fd97f0()
{
	self._trap_duration = 40;
	self._trap_cooldown_time = 60;
	self notify("trap_activate");
	level notify("trap_activate", self);
	var_58bca934 = util::spawn_model("tag_origin", self.origin, self.angles);
	var_58bca934 PlayLoopSound("evt_acid_trap_loop", 3);
	level clientfield::set(self.target, 1);
	self thread function_26f6b69d();
	self util::waittill_notify_or_timeout("trap_deactivate", self._trap_duration - 3);
	level clientfield::set(self.target, 0);
	var_58bca934 StopLoopSound(3);
	self util::waittill_notify_or_timeout("trap_deactivate", 3);
	var_58bca934 delete();
	self notify("trap_done");
}

/*
	Name: function_26f6b69d
	Namespace: namespace_43042162
	Checksum: 0x99D3138B
	Offset: 0x708
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 95
*/
function function_26f6b69d()
{
	self endon("trap_done");
	while(isdefined(self))
	{
		self waittill("trigger", e_ent);
		if(isdefined(e_ent.var_d56bb8df) && e_ent.var_d56bb8df || (isdefined(e_ent.marked_for_death) && e_ent.marked_for_death) || (isdefined(e_ent.var_d8b92033) && e_ent.var_d8b92033))
		{
			continue;
		}
		if(isPlayer(e_ent))
		{
			e_ent thread function_1c29044e(15, self);
			continue;
		}
		e_ent thread function_6e9c6f69(self);
	}
}

/*
	Name: function_6e9c6f69
	Namespace: namespace_43042162
	Checksum: 0x67335487
	Offset: 0x810
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 124
*/
function function_6e9c6f69(e_trap)
{
	n_damage = Int(self.maxhealth / 100 * 15);
	if(self.health <= n_damage)
	{
		self function_243d184(e_trap);
		continue;
	}
	self thread function_1c29044e(n_damage, e_trap);
	return;
}

/*
	Name: function_243d184
	Namespace: namespace_43042162
	Checksum: 0xF0C8D914
	Offset: 0x8A8
	Size: 0x1B0
	Parameters: 1
	Flags: None
	Line Number: 146
*/
function function_243d184(e_trap)
{
	playsoundatposition("zmb_acid_death", self.origin);
	if(isdefined(self.var_36582b50))
	{
		self [[self.var_36582b50]](e_trap);
		return;
	}
	else if(isdefined(self.trap_reaction_func))
	{
		self [[self.trap_reaction_func]](e_trap);
		return;
	}
	self.marked_for_death = 1;
	level notify("trap_kill", self, e_trap);
	self clientfield::set("trap_acid_ai_disintegrate", 1);
	self clientfield::set("zombie_has_eyes", 0);
	self function_9c035de4();
	if(isdefined(self) && isalive(self))
	{
		self DoDamage(self.health + 666, self.origin, e_trap);
	}
	self ghost();
	if(isdefined(e_trap.activated_by_player) && isPlayer(e_trap.activated_by_player))
	{
		e_trap.activated_by_player zm_stats::increment_challenge_stat("ZOMBIE_HUNTER_KILL_TRAP");
	}
}

/*
	Name: function_9c035de4
	Namespace: namespace_43042162
	Checksum: 0xEED445E9
	Offset: 0xA60
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function function_9c035de4()
{
	self endon("death");
	if(isdefined(self.archetype) && self.archetype == "zombie")
	{
		var_ed08978e = Array("ai_zombie_acid_stun_a", "ai_zombie_acid_stun_b", "ai_zombie_acid_stun_c", "ai_zombie_acid_stun_d", "ai_zombie_acid_stun_e")[RandomInt(5)];
		self AnimScripted(var_ed08978e, self.origin, self.angles, var_ed08978e);
		wait(1);
		continue;
	}
	wait(0.25);
}

/*
	Name: function_1c29044e
	Namespace: namespace_43042162
	Checksum: 0x877D3472
	Offset: 0xB30
	Size: 0xAA
	Parameters: 2
	Flags: None
	Line Number: 208
*/
function function_1c29044e(n_damage, e_trap)
{
	self notify("hash_1c29044e");
	self endon("hash_1c29044e");
	self endon("death_or_disconnect");
	if(isPlayer(self))
	{
		self zm_playerhealth::player_health_visionset();
	}
	self DoDamage(n_damage, self.origin, e_trap);
	self.var_d56bb8df = 1;
	wait(0.25);
	self.var_d56bb8df = undefined;
}

