#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\fx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;

#namespace namespace_9a3dc883;

/*
	Name: __init__sytem__
	Namespace: namespace_9a3dc883
	Checksum: 0xABD7138B
	Offset: 0x408
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("hb21_n4l_zm_weap_black_hole_bomb", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_9a3dc883
	Checksum: 0xD1A22E4D
	Offset: 0x448
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function __init__()
{
	clientfield::register("scriptmover", "black_hole_bomb_vortex_fx", 12000, 2, "int", &function_9e751c1a, 0, 0);
	clientfield::register("actor", "black_hole_bomb_disintegrate", 12000, 1, "int", &function_498d8759, 0, 0);
	clientfield::register("actor", "black_hole_bomb_ai_slow_vortex_fx", 12000, 2, "int", &function_8773df59, 0, 0);
	visionset_mgr::register_visionset_info("black_hole_bomb_vortex_visionset", 1, 30, undefined, "zm_idgun_vortex");
	visionset_mgr::register_overlay_info_style_speed_blur("black_hole_bomb_vortex_blur", 1, 30, 0.08, 0.75, 0.9);
	duplicate_render::set_dr_filter_framebuffer("black_hole_bomb_dissolve", 10, "black_hole_bomb_dissolve_on", undefined, 0, "mc/mtl_c_zom_dlc3_zombie_dissolve_base", 0);
	callback::on_localplayer_spawned(&function_56e60bf5);
}

/*
	Name: function_56e60bf5
	Namespace: namespace_9a3dc883
	Checksum: 0xE89DEE2D
	Offset: 0x5E0
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 59
*/
function function_56e60bf5(n_local_client)
{
	self thread function_377a07c6(n_local_client);
}

/*
	Name: function_377a07c6
	Namespace: namespace_9a3dc883
	Checksum: 0x6BC15240
	Offset: 0x610
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 74
*/
function function_377a07c6(n_local_client)
{
	self endon("disconnect");
	self endon("entityshutdown");
	self notify("hash_377a07c6");
	self endon("hash_377a07c6");
	while(1)
	{
		level waittill("Notetrack", var_5e305751, note);
		if(var_5e305751 == n_local_client && note == "wpn_bhbomb_switch")
		{
			self MapShaderConstant(n_local_client, 0, "scriptVector2", 0, 1, 0, 0);
		}
	}
}

/*
	Name: function_9e751c1a
	Namespace: namespace_9a3dc883
	Checksum: 0xA8D4F352
	Offset: 0x6D0
	Size: 0x150
	Parameters: 7
	Flags: None
	Line Number: 100
*/
function function_9e751c1a(n_local_client, n_old, n_new, b_new_ent, b_initial_snap, str_field, b_was_time_jump)
{
	if(isdefined(self.fx_slow_vortex))
	{
		KillFX(n_local_client, self.fx_slow_vortex);
	}
	if(n_new == 1)
	{
		self.fx_slow_vortex = PlayFXOnTag(n_local_client, "dlc3/stalingrad/fx_raygun_l_projectile_blackhole_lg", self, "tag_origin");
		self PlayRumbleOnEntity(n_local_client, "artillery_rumble");
		self thread function_c84223c9(n_local_client);
	}
	else if(n_new == 2)
	{
		self.fx_slow_vortex = PlayFXOnTag(n_local_client, "harry/gersh/fx_gersh_teleport_out", self, "tag_origin");
		self PlayRumbleOnEntity(n_local_client, "artillery_rumble");
		self thread function_c84223c9(n_local_client);
	}
}

/*
	Name: function_c84223c9
	Namespace: namespace_9a3dc883
	Checksum: 0x5CB04C90
	Offset: 0x828
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 130
*/
function function_c84223c9(n_local_client)
{
	self notify("vortex_shake_and_rumble");
	self endon("vortex_shake_and_rumble");
	self endon("entity_shutdown");
	while(isdefined(self))
	{
		self PlayRumbleOnEntity(n_local_client, "raygun_mark3_vortex_lg");
		wait(0.083);
	}
}

/*
	Name: function_498d8759
	Namespace: namespace_9a3dc883
	Checksum: 0xE9942359
	Offset: 0x898
	Size: 0x118
	Parameters: 7
	Flags: None
	Line Number: 152
*/
function function_498d8759(n_local_client, n_old, n_new, b_new_ent, b_initial_snap, str_field, b_was_time_jump)
{
	self endon("entity_shutdown");
	self duplicate_render::set_dr_flag("black_hole_bomb_dissolve_on", n_new);
	self duplicate_render::update_dr_filters(n_local_client);
	self.n_dissolve = 1;
	while(isdefined(self) && self.n_dissolve > 0)
	{
		self MapShaderConstant(n_local_client, 0, "scriptVector0", self.n_dissolve);
		self.n_dissolve = self.n_dissolve - 0.03;
		wait(0.01);
	}
	if(isdefined(self))
	{
		self MapShaderConstant(n_local_client, 0, "scriptVector0", 0);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8e63a8c
	Namespace: namespace_9a3dc883
	Checksum: 0xBF1D224B
	Offset: 0x9B8
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 182
*/
function function_8e63a8c(n_local_client, b_blacken)
{
	self endon("entity_shutdown");
	if(!isdefined(self.n_blacken))
	{
		self.n_blacken = 0;
	}
	if(b_blacken)
	{
		while(isdefined(self) && self.n_blacken < 1)
		{
			self.n_blacken = self.n_blacken + 0.3;
			self MapShaderConstant(n_local_client, 0, "scriptVector0", self.n_blacken);
			wait(0.01);
		}
	}
	else
	{
		self.n_blacken = self.n_blacken - 0.3;
		self MapShaderConstant(n_local_client, 0, "scriptVector0", self.n_blacken);
		wait(0.01);
	}
	while(isdefined(self) && self.n_blacken > 0)
	{
	}
}

/*
	Name: function_8773df59
	Namespace: namespace_9a3dc883
	Checksum: 0xB547CC19
	Offset: 0xAD0
	Size: 0x154
	Parameters: 7
	Flags: None
	Line Number: 219
*/
function function_8773df59(n_local_client, n_old, n_new, b_new_ent, b_initial_snap, str_field, b_was_time_jump)
{
	if(n_new)
	{
		if(isdefined(self.var_88667103) && self.var_88667103 == n_new)
		{
			return;
		}
		if(isdefined(self.var_a2ecef21))
		{
			KillFX(n_local_client, self.var_a2ecef21);
		}
		FX = "dlc3/stalingrad/fx_raygun_l_projectile_blackhole_sm_hit";
		if(n_new == 2)
		{
			FX = "dlc3/stalingrad/fx_raygun_l_projectile_blackhole_lg_hit";
		}
		self.var_a2ecef21 = PlayFXOnTag(n_local_client, FX, self, "j_spineupper");
		self.var_88667103 = n_new;
		self thread function_8e63a8c(n_local_client, 1);
		continue;
	}
	self.var_88667103 = undefined;
	KillFX(n_local_client, self.var_a2ecef21);
	self thread function_8e63a8c(n_local_client, 0);
}

