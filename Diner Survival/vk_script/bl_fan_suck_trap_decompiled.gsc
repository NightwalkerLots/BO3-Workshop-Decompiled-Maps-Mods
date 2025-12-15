#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\animation_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_traps;
#include scripts\zm\_zm_utility;

#namespace namespace_6bb3d85d;

/*
	Name: __init__sytem__
	Namespace: namespace_6bb3d85d
	Checksum: 0x35EF374A
	Offset: 0x410
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 30
*/
function autoexec __init__sytem__()
{
	system::register("fan_suck_trap", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_6bb3d85d
	Checksum: 0x87BD9C68
	Offset: 0x450
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function __init__()
{
	thread function_604242ff();
	level flag::init("fan_trap_active");
	level.var_25bb9ad6 = 0;
	zm_traps::register_trap_basic_info("fan_suck_trap", &function_6922ec43, undefined);
}

/*
	Name: function_604242ff
	Namespace: namespace_6bb3d85d
	Checksum: 0x6388EC45
	Offset: 0x4C8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function function_604242ff()
{
	struct = struct::get("struct_tornado");
	level waittill("power_on");
	level.var_353277b6 = util::spawn_model("tag_origin", struct.origin, struct.angles);
	level.var_353277b6 PlayLoopSound("amb_ventilation_large");
}

/*
	Name: function_6922ec43
	Namespace: namespace_6bb3d85d
	Checksum: 0x59784281
	Offset: 0x560
	Size: 0x4D8
	Parameters: 0
	Flags: None
	Line Number: 81
*/
function function_6922ec43()
{
	self._trap_duration = 45;
	self._trap_cooldown_time = 90;
	self.var_f8d6e928 = 1;
	level flag::set("fan_trap_active");
	fans = [];
	var_2b5c2c92 = [];
	thread function_6acdb8e2();
	targets = GetEntArray(self.target, "targetname");
	foreach(target in targets)
	{
		if(target.script_notify == "fan_rotate")
		{
			if(!isdefined(fans))
			{
				fans = [];
			}
			else if(!IsArray(fans))
			{
				fans = Array(fans);
			}
		}
		fans[fans.size] = target;
		if(target.script_noteworthy == "trig_multiple")
		{
			var_9b9693e = target;
		}
	}
	var_d3f2025f = struct::get_array(var_9b9693e.target, "targetname");
	foreach(struct in var_d3f2025f)
	{
		struct thread spawn_fx(self);
	}
	var_758b0a87 = struct::get_array(self.target);
	foreach(fan in fans)
	{
		self thread function_a4998afa(fan);
	}
	foreach(player in GetPlayers())
	{
		player thread function_ccf129fc(var_9b9693e, self);
	}
	self thread function_14ce1a3d(var_9b9693e, var_758b0a87);
	self util::waittill_notify_or_timeout("trap_deactivate", self._trap_duration);
	foreach(fan in fans)
	{
		fan StopLoopSound(0.3);
	}
	self.var_f8d6e928 = 0;
	wait(0.2);
	level flag::clear("fan_trap_active");
	self notify("trap_done", fans, GetPlayers(), fans, var_d3f2025f, targets);
	thread function_98fbcc09();
}

/*
	Name: spawn_fx
	Namespace: namespace_6bb3d85d
	Checksum: 0x6D47E986
	Offset: 0xA40
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 147
*/
function spawn_fx(trig)
{
	var_56ad232d = util::spawn_model("tag_origin", self.origin, self.angles);
	PlayFXOnTag("Symbo/tornado_trap", var_56ad232d, "tag_origin");
	wait(trig._trap_duration);
	var_56ad232d StopLoopSound(0.5);
	var_56ad232d delete();
}

/*
	Name: function_a4998afa
	Namespace: namespace_6bb3d85d
	Checksum: 0x98C5A002
	Offset: 0xAF8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 166
*/
function function_a4998afa(fan)
{
	self endon("trap_done");
	while(1)
	{
		fan RotateYaw(360, 0.4);
		wait(0.4);
	}
}

/*
	Name: function_14ce1a3d
	Namespace: namespace_6bb3d85d
	Checksum: 0x3A483B6C
	Offset: 0xB48
	Size: 0xA8
	Parameters: 2
	Flags: None
	Line Number: 186
*/
function function_14ce1a3d(trig, var_758b0a87)
{
	self endon("trap_done");
	while(1)
	{
		trig waittill("trigger", ent);
		if(isPlayer(ent))
		{
			continue;
		}
		if(!(isdefined(ent.var_87a1e9d3) && ent.var_87a1e9d3))
		{
			ent thread function_f1d53887(var_758b0a87, self);
		}
	}
}

/*
	Name: function_f1d53887
	Namespace: namespace_6bb3d85d
	Checksum: 0x1055FCAB
	Offset: 0xBF8
	Size: 0x680
	Parameters: 2
	Flags: None
	Line Number: 213
*/
function function_f1d53887(var_758b0a87, trig)
{
	self endon("hash_2bdbd9a9");
	self.var_87a1e9d3 = 1;
	struct = ArrayGetClosest(self.origin, var_758b0a87);
	a_trace = GroundTrace(struct.origin, struct.origin + VectorScale((0, 0, -1), 1000), 0, self, 1, 1);
	if(a_trace["surfacetype"] != "none")
	{
		point = a_trace["position"];
	}
	n_lift_speed = randomIntRange(54, 98);
	v_away_from_source = VectorNormalize(self.origin - point);
	v_away_from_source = v_away_from_source * 3;
	v_away_from_source = (v_away_from_source[0], v_away_from_source[1], randomIntRange(250, 350));
	a_trace = PhysicsTraceEx(self.origin + VectorScale((0, 0, 1), 32), self.origin + v_away_from_source, VectorScale((-1, -1, -1), 16), VectorScale((1, 1, 1), 16), self);
	v_lift = a_trace["fraction"] * v_away_from_source;
	v_lift = v_lift + VectorScale((0, 0, -1), 24);
	n_lift_time = length(v_lift) / n_lift_speed;
	if(isdefined(self) && (isdefined(self.b_melee_kill) && self.b_melee_kill))
	{
		self SetPlayerCollision(0);
		if(!(isdefined(level.ignore_gravityspikes_ragdoll) && level.ignore_gravityspikes_ragdoll))
		{
			self StartRagdoll();
			self LaunchRagdoll(150 * anglesToUp(self.angles) - (v_away_from_source[0], v_away_from_source[1], 0));
		}
		self clientfield::set("ragdoll_impact_watch", 1);
		util::wait_network_frame();
	}
	else if(isdefined(self) && v_lift[2] > 0 && length(v_lift) > length(VectorScale((0, 0, -1), 24)))
	{
		self SetPlayerCollision(0);
		if(isdefined(self.missingLegs) && self.missingLegs)
		{
			self thread scene::Play("cin_zm_dlc1_zombie_crawler_talonspike_a_loop", self);
			continue;
		}
		self thread scene::Play("cin_zm_dlc1_zombie_talonspike_loop", self);
		self thread function_424fbb39(trig);
		self.mdl_trap_mover = util::spawn_model("tag_origin", self.origin, self.angles);
		self thread util::delete_on_death(self.mdl_trap_mover);
		self LinkTo(self.mdl_trap_mover, "tag_origin");
		self thread zombie_lift_wacky_rotate(n_lift_time);
		self.mdl_trap_mover moveto(struct.origin, n_lift_time);
		wait(n_lift_time);
		struct2 = struct::get(struct.target);
		self.mdl_trap_mover moveto(struct2.origin, 0.4);
		while(!self.mdl_trap_mover istouching(trig))
		{
			wait(0.05);
		}
		self notify("hash_4b450298");
		self scene::stop();
		self Unlink();
		self.mdl_trap_mover delete();
		self DoDamage(self.health + 666, self.origin);
		wait(0.05);
		if(!(isdefined(self.var_1122d06f) && self.var_1122d06f))
		{
			self thread zombie_utility::gib_random_parts();
		}
		wait(0.05);
		self playsound("");
		if(!(isdefined(self.var_1122d06f) && self.var_1122d06f))
		{
			GibServerUtils::Annihilate(self);
			continue;
		}
		self ghost();
		playFX("", self.origin);
		wait(0.1);
		self ghost();
	}
}

/*
	Name: function_424fbb39
	Namespace: namespace_6bb3d85d
	Checksum: 0x4775128F
	Offset: 0x1280
	Size: 0x210
	Parameters: 1
	Flags: None
	Line Number: 298
*/
function function_424fbb39(trig)
{
	self endon("hash_4b450298");
	trig waittill("trap_done");
	self notify("hash_2bdbd9a9");
	if(isdefined(self))
	{
		self Unlink();
		self scene::stop();
		self StartRagdoll(1);
		self clientfield::set("ragdoll_impact_watch", 1);
		v_land_pos = util::ground_position(self.origin, 1000);
		n_fall_dist = Abs(self.origin[2] - v_land_pos[2]);
		n_slam_wait = n_fall_dist / 200 * 0.75;
		if(n_slam_wait > 0)
		{
			wait(n_slam_wait);
		}
		if(isalive(self))
		{
			self DoDamage(self.health + 100, self.origin);
			if(!(isdefined(self.var_1122d06f) && self.var_1122d06f))
			{
				self zombie_utility::gib_random_parts();
				continue;
			}
			self ghost();
			playFX("", self.origin);
			self playsound("zmb_talon_ai_slam");
		}
		wait(5);
		self ghost();
	}
}

/*
	Name: corpse_off_navmesh_watcher
	Namespace: namespace_6bb3d85d
	Checksum: 0xC99768A4
	Offset: 0x1498
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 343
*/
function corpse_off_navmesh_watcher()
{
	self waittill("actor_corpse", e_corpse);
	v_pos = GetClosestPointOnNavMesh(e_corpse.origin, 256);
	if(!isdefined(v_pos) || e_corpse.origin[2] > v_pos[2] + 64)
	{
		e_corpse thread do_zombie_explode();
	}
}

/*
	Name: zombie_lift_wacky_rotate
	Namespace: namespace_6bb3d85d
	Checksum: 0x1A80B9B1
	Offset: 0x1538
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 363
*/
function zombie_lift_wacky_rotate(n_lift_time)
{
	self endon("death");
	while(1)
	{
		if(randomIntRange(0, 10) < 5)
		{
			continue;
		}
		negative_x = -1;
		if(randomIntRange(0, 10) < 5)
		{
			continue;
		}
		negative_z = -1;
		if(n_lift_time > 2)
		{
			continue;
		}
		self.mdl_trap_mover RotateTo((randomIntRange(90, 180) * negative_x, randomIntRange(-90, 90), randomIntRange(90, 180) * negative_z), 5, n_lift_time);
		self.mdl_trap_mover waittill("rotatedone");
	}
	return;
}

/*
	Name: do_zombie_explode
	Namespace: namespace_6bb3d85d
	Checksum: 0xB47F8D4D
	Offset: 0x1680
	Size: 0x60
	Parameters: 0
	Flags: Private
	Line Number: 398
*/
function private do_zombie_explode()
{
	util::wait_network_frame();
	if(isdefined(self))
	{
		self zombie_utility::zombie_eye_glow_stop();
		self util::delay(0.25, undefined, &zm_utility::self_delete);
		return;
	}
}

/*
	Name: function_ccf129fc
	Namespace: namespace_6bb3d85d
	Checksum: 0x697D6AEE
	Offset: 0x16E8
	Size: 0x128
	Parameters: 2
	Flags: None
	Line Number: 419
*/
function function_ccf129fc(var_9b9693e, var_5642bf65)
{
	self endon("death");
	self endon("disconnect");
	while(var_5642bf65.var_f8d6e928)
	{
		while(!self istouching(var_9b9693e) && var_5642bf65.var_f8d6e928)
		{
			wait(0.05);
		}
		if(!self hasPerk("specialty_lowgravity"))
		{
			self setPerk("specialty_lowgravity");
		}
		while(self istouching(var_9b9693e) && var_5642bf65.var_f8d6e928)
		{
			wait(0.05);
		}
		self unsetPerk("specialty_lowgravity");
	}
	self clearplayergravity();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a68f4cc3
	Namespace: namespace_6bb3d85d
	Checksum: 0xAE0E28A
	Offset: 0x1818
	Size: 0x1A8
	Parameters: 10
	Flags: None
	Line Number: 454
*/
function function_a68f4cc3(str_anim, v_origin, v_angles, n_rate, n_blend_in, n_blend_out, n_start_time, b_show_player_firstperson_weapon, b_unlink_after_completed, var_b9df27ec)
{
	if(!isdefined(v_origin))
	{
		v_origin = self.origin;
	}
	if(!isdefined(v_angles))
	{
		v_angles = self.angles;
	}
	if(!isdefined(n_rate))
	{
		n_rate = 1;
	}
	if(!isdefined(n_blend_in))
	{
		n_blend_in = 0.2;
	}
	if(!isdefined(n_blend_out))
	{
		n_blend_out = 0;
	}
	if(!isdefined(n_start_time))
	{
		n_start_time = 0;
	}
	if(!isdefined(b_show_player_firstperson_weapon))
	{
		b_show_player_firstperson_weapon = 0;
	}
	if(!isdefined(b_unlink_after_completed))
	{
		b_unlink_after_completed = 1;
	}
	if(!isdefined(var_b9df27ec))
	{
		var_b9df27ec = 0;
	}
	while(isdefined(self.var_7ec13089) && (isdefined(var_b9df27ec) && var_b9df27ec))
	{
		wait(0.05);
	}
	self.var_7ec13089 = str_anim;
	self notify("hash_e2ffb386");
	self animation::Play(str_anim, v_origin, v_angles, n_rate, n_blend_in, n_blend_out, n_start_time, b_show_player_firstperson_weapon, b_unlink_after_completed);
	self.var_7ec13089 = undefined;
	self notify("hash_5a6497b1");
}

/*
	Name: function_6acdb8e2
	Namespace: namespace_6bb3d85d
	Checksum: 0xBF40DAF8
	Offset: 0x19C8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 513
*/
function function_6acdb8e2()
{
	level.var_353277b6 stopsound("amb_ventilation_large");
	wait(0.05);
	level.var_353277b6 playsound("trap_fan_start");
	wait(1.5);
	level.var_353277b6 playsound("trap_fan_active");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_98fbcc09
	Namespace: namespace_6bb3d85d
	Checksum: 0x64D1FB92
	Offset: 0x1A48
	Size: 0x74
	Parameters: 0
	Flags: None
	Line Number: 534
*/
function function_98fbcc09()
{
	level.var_353277b6 stopsound("trap_fan_active");
	wait(0.05);
	level.var_353277b6 playsound("trap_fan_end");
	wait(8.5);
	level.var_353277b6 PlayLoopSound("amb_ventilation_large");
}

