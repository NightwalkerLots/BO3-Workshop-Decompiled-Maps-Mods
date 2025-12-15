#include scripts\shared\ai\mechz;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_electroball_grenade;
#include scripts\zm\_zm_elemental_zombies;

#namespace namespace_ef567265;

/*
	Name: __init__sytem__
	Namespace: namespace_ef567265
	Checksum: 0x4E3C0B75
	Offset: 0x330
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_ai_mechz", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_ef567265
	Checksum: 0x2CB16895
	Offset: 0x378
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	clientfield::register("scriptmover", "mechz_claw", 1, 1, "int", &function_64df6efe, 0, 0);
	clientfield::register("actor", "mechz_wpn_source", 1, 1, "int", &function_e03ee5dc, 0, 0);
	clientfield::register("toplayer", "mechz_grab", 1, 1, "int", &function_515a1d53, 0, 0);
	clientfield::register("actor", "tomb_mech_eye", 1, 1, "int", &function_e5688b65, 0, 0);
	level._effect["mechz_claw"] = "dlc5/tomb/fx_tomb_mech_wpn_claw";
	level._effect["mechz_wpn_source"] = "dlc5/tomb/fx_tomb_mech_wpn_source";
	level.mechz_detach_claw_override = &mechz_detach_claw_override;
	level.var_26a85e09 = &function_26a85e09;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __main__
	Namespace: namespace_ef567265
	Checksum: 0xC41162D4
	Offset: 0x510
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function __main__()
{
	visionset_mgr::register_overlay_info_style_burn("mechz_player_burn", 5000, 15, 1.5);
}

/*
	Name: mechz_detach_claw_override
	Namespace: namespace_ef567265
	Checksum: 0x380E81F
	Offset: 0x548
	Size: 0x140
	Parameters: 7
	Flags: Private
	Line Number: 73
*/
function private mechz_detach_claw_override(var_3d850ea0, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(var_ee3cd374 == 2)
	{
		continue;
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
	PlayFXOnTag(var_3d850ea0, level._effect["fx_mech_dmg_armor"], self, "tag_grappling_source_fx");
	self playsound(0, "zmb_ai_mechz_destruction");
	PlayFXOnTag(var_3d850ea0, level._effect["fx_mech_dmg_sparks"], self, "tag_grappling_source_fx");
}

/*
	Name: function_26a85e09
	Namespace: namespace_ef567265
	Checksum: 0x5DF46EBD
	Offset: 0x690
	Size: 0x138
	Parameters: 7
	Flags: None
	Line Number: 96
*/
function function_26a85e09(var_3d850ea0, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(var_ee3cd374 == 2)
	{
		continue;
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
	PlayFXOnTag(var_3d850ea0, level._effect["fx_mech_dmg_armor_face"], self, "j_faceplate");
	self setsoundentcontext("movement", "loud");
	self playsound(0, "zmb_ai_mechz_faceplate");
}

/*
	Name: function_e5688b65
	Namespace: namespace_ef567265
	Checksum: 0x18F00BEB
	Offset: 0x7D0
	Size: 0x70
	Parameters: 7
	Flags: None
	Line Number: 119
*/
function function_e5688b65(var_3d850ea0, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	waittillframeend;
	self MapShaderConstant(var_3d850ea0, 0, "scriptVector2", 0, var_ee3cd374, 3, 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_64df6efe
	Namespace: namespace_ef567265
	Checksum: 0x3683D53
	Offset: 0x848
	Size: 0x78
	Parameters: 7
	Flags: Private
	Line Number: 137
*/
function private function_64df6efe(var_3d850ea0, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(var_ee3cd374)
	{
		PlayFXOnTag(var_3d850ea0, level._effect["mechz_claw"], self, "tag_origin");
	}
}

/*
	Name: function_e03ee5dc
	Namespace: namespace_ef567265
	Checksum: 0x39787638
	Offset: 0x8C8
	Size: 0xB8
	Parameters: 7
	Flags: Private
	Line Number: 155
*/
function private function_e03ee5dc(var_3d850ea0, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(var_ee3cd374)
	{
		self.var_54aea031 = PlayFXOnTag(var_3d850ea0, level._effect["mechz_wpn_source"], self, "j_elbow_le");
	}
	else if(isdefined(self.var_54aea031))
	{
		stopfx(var_3d850ea0, self.var_54aea031);
		self.var_54aea031 = undefined;
	}
}

/*
	Name: function_515a1d53
	Namespace: namespace_ef567265
	Checksum: 0xDBD851BA
	Offset: 0x988
	Size: 0x74
	Parameters: 7
	Flags: Private
	Line Number: 178
*/
function private function_515a1d53(var_3d850ea0, var_6e653641, var_ee3cd374, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(var_ee3cd374)
	{
		self function_21fc862d();
		continue;
	}
	self function_fedaa2a6();
}

