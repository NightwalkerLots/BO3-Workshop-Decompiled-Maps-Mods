#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_playerhealth;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_traps;
#include scripts\zm\_zm_utility;

#namespace namespace_c3ea7c24;

/*
	Name: __init__sytem__
	Namespace: namespace_c3ea7c24
	Checksum: 0xCB921FF
	Offset: 0x2D8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 27
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_trap_flinger", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_c3ea7c24
	Checksum: 0xE378B1E1
	Offset: 0x318
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function __init__()
{
	zm_traps::register_trap_basic_info("flipper", &function_7b74e9f6, undefined);
}

/*
	Name: function_7b74e9f6
	Namespace: namespace_c3ea7c24
	Checksum: 0xB8F5610C
	Offset: 0x350
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function function_7b74e9f6()
{
	self._trap_duration = 30;
	self._trap_cooldown_time = 60;
	self thread function_db9764db();
	self util::waittill_notify_or_timeout("trap_deactivate", self._trap_duration);
	self notify("trap_done");
}

/*
	Name: function_db9764db
	Namespace: namespace_c3ea7c24
	Checksum: 0x4EEC6102
	Offset: 0x3C8
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_db9764db()
{
	self endon("trap_done");
	while(isdefined(self))
	{
		self waittill("trigger", e_ent);
		if(!isdefined(e_ent) || (isdefined(e_ent.sessionstate) && (isdefined(e_ent.sessionstate == "spectator") && e_ent.sessionstate == "spectator")) || isdefined(e_ent.marked_for_death) || (isdefined(e_ent.var_c0965c1f) && e_ent.var_c0965c1f))
		{
			continue;
		}
		self._trap_movers[0] useanimtree(-1);
		self._trap_movers[0] AnimScripted("p7_fxanim_zm_stal_flinger_trap_anim", self._trap_movers[0].origin, self._trap_movers[0].angles, %p7_fxanim_zm_stal_flinger_trap_anim);
		self function_113589c9(self);
		wait(getanimlength("p7_fxanim_zm_stal_flinger_trap_anim"));
	}
}

/*
	Name: function_b9766ace
	Namespace: namespace_c3ea7c24
	Checksum: 0x3027B8B1
	Offset: 0x548
	Size: 0x108
	Parameters: 2
	Flags: None
	Line Number: 103
*/
function function_b9766ace(v_origin, v_angle)
{
	if(isalive(self) || (isdefined(self.health) && self.health > 0))
	{
		v_launch = v_angle * 300 + (0, 0, randomIntRange(100, 300));
	}
	if(!self IsRagdoll())
	{
		self StartRagdoll();
	}
	self LaunchRagdoll(v_launch);
	self zombie_utility::gib_random_parts();
	self DoDamage(self.health + 666, self.origin);
}

/*
	Name: function_113589c9
	Namespace: namespace_c3ea7c24
	Checksum: 0xABDBEFBD
	Offset: 0x658
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 128
*/
function function_113589c9(e_trap)
{
	level thread function_b31d58ab(self, self._trap_movers[0]);
	a_zombies = zombie_utility::get_round_enemy_array();
	for(i = 0; i < a_zombies.size; i++)
	{
		if(a_zombies[i] istouching(self))
		{
			if(!(isdefined(a_zombies[i].var_c0965c1f) && a_zombies[i].var_c0965c1f))
			{
				playsoundatposition("wpn_thundergun_proj_impact", a_zombies[i].origin);
				a_zombies[i] thread function_b9766ace(self._trap_movers[0].origin, AnglesToRight(self._trap_movers[0].angles + VectorScale((0, 1, 0), 180)));
				level notify("trap_kill", a_zombies[i], e_trap);
				if(isdefined(e_trap.activated_by_player) && isPlayer(e_trap.activated_by_player))
				{
					e_trap.activated_by_player zm_stats::increment_challenge_stat("ZOMBIE_HUNTER_KILL_TRAP");
				}
			}
		}
	}
}

/*
	Name: function_b31d58ab
	Namespace: namespace_c3ea7c24
	Checksum: 0x20BFD937
	Offset: 0x828
	Size: 0x1A0
	Parameters: 2
	Flags: None
	Line Number: 160
*/
function function_b31d58ab(e_trap, var_a7c049ac)
{
	var_3b5568c6 = struct::get_array(e_trap.target, "targetname");
	a_players = GetPlayers();
	for(i = 0; i < a_players.size; i++)
	{
		if(isdefined(a_players[i]._being_flung) && a_players[i]._being_flung || (isdefined(a_players[i].sessionstate == "spectator") && a_players[i].sessionstate == "spectator"))
		{
			continue;
		}
		if(a_players[i] istouching(e_trap))
		{
			a_players[i] thread function_3a856680(var_3b5568c6[i], Int(e_trap.script_parameters));
			playsoundatposition("wpn_thundergun_proj_impact", a_players[i].origin);
		}
	}
}

/*
	Name: function_3a856680
	Namespace: namespace_c3ea7c24
	Checksum: 0x6F7DEBDD
	Offset: 0x9D0
	Size: 0xB4
	Parameters: 2
	Flags: None
	Line Number: 188
*/
function function_3a856680(var_298fdb65, var_c4779bc3)
{
	self endon("death_or_disconnect");
	self zm_playerhealth::player_health_visionset();
	wait(0.05);
	self SetOrigin(var_298fdb65.origin);
	self SetVelocity(AnglesToForward(var_298fdb65.angles) * var_c4779bc3 + anglesToUp(var_298fdb65.angles) * 800);
}

