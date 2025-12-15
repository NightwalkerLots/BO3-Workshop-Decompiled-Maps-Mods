#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_weap_elemental_bow;

#namespace namespace_efd1ef23;

/*
	Name: __init__sytem__
	Namespace: namespace_efd1ef23
	Checksum: 0xA0206BDF
	Offset: 0x630
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("_zm_weap_elemental_bow_demongate", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_efd1ef23
	Checksum: 0xD431781C
	Offset: 0x670
	Size: 0x3A0
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	clientfield::register("toplayer", "elemental_bow_demongate" + "_ambient_bow_fx", 1, 1, "int", &function_ce9a79bd, 0, 0);
	clientfield::register("missile", "elemental_bow_demongate" + "_arrow_impact_fx", 1, 1, "int", &function_e2bc2de8, 0, 0);
	clientfield::register("missile", "elemental_bow_demongate4" + "_arrow_impact_fx", 1, 1, "int", &function_6aff159c, 0, 0);
	clientfield::register("scriptmover", "demongate_portal_fx", 1, 1, "int", &function_b60106f1, 0, 0);
	clientfield::register("toplayer", "demongate_portal_rumble", 1, 1, "int", &function_2e7aea94, 0, 0);
	clientfield::register("scriptmover", "demongate_wander_locomotion_anim", 1, 1, "int", &function_b463a519, 0, 0);
	clientfield::register("scriptmover", "demongate_attack_locomotion_anim", 1, 1, "int", &function_ac6d79d2, 0, 0);
	clientfield::register("scriptmover", "demongate_chomper_fx", 1, 1, "int", &function_f763292d, 0, 0);
	clientfield::register("scriptmover", "demongate_chomper_bite_fx", 1, 1, "counter", &function_ac9c30de, 0, 0);
	level._effect["demongate_ambient_bow"] = "dlc1/zmb_weapon/fx_bow_demongate_ambient_1p_zmb";
	level._effect["demongate_arrow_impact"] = "dlc1/zmb_weapon/fx_bow_demongate_impact_zmb";
	level._effect["demongate_arrow_charged_impact"] = "dlc1/zmb_weapon/fx_bow_demongate_impact_ug_zmb";
	level._effect["demongate_chomper_trail"] = "dlc1/zmb_weapon/fx_bow_demonhead_trail_zmb";
	level._effect["demongate_chomper_bite"] = "dlc1/zmb_weapon/fx_bow_demonhead_bite_zmb";
	level._effect["demongate_chomper_end"] = "dlc1/zmb_weapon/fx_bow_demonhead_despawn_zmb";
	level._effect["demongate_portal_open"] = "dlc1/zmb_weapon/fx_bow_demongate_portal_open_zmb";
	level._effect["demongate_portal_loop"] = "dlc1/zmb_weapon/fx_bow_demongate_portal_loop_zmb";
	level._effect["demongate_portal_close"] = "dlc1/zmb_weapon/fx_bow_demongate_portal_close_zmb";
}

/*
	Name: function_ce9a79bd
	Namespace: namespace_efd1ef23
	Checksum: 0xBE37833
	Offset: 0xA18
	Size: 0x68
	Parameters: 7
	Flags: None
	Line Number: 71
*/
function function_ce9a79bd(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self zm_weap_elemental_bow::function_783ddebf(localClientNum, newVal, "demongate_ambient_bow");
}

/*
	Name: function_e2bc2de8
	Namespace: namespace_efd1ef23
	Checksum: 0xD07C1381
	Offset: 0xA88
	Size: 0x78
	Parameters: 7
	Flags: None
	Line Number: 86
*/
function function_e2bc2de8(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		playFX(localClientNum, level._effect["demongate_arrow_impact"], self.origin);
	}
}

/*
	Name: function_6aff159c
	Namespace: namespace_efd1ef23
	Checksum: 0xE51B55A1
	Offset: 0xB08
	Size: 0x78
	Parameters: 7
	Flags: None
	Line Number: 104
*/
function function_6aff159c(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		playFX(localClientNum, level._effect["demongate_arrow_charged_impact"], self.origin);
	}
}

/*
	Name: function_b60106f1
	Namespace: namespace_efd1ef23
	Checksum: 0x7A19AA0E
	Offset: 0xB88
	Size: 0x1A8
	Parameters: 7
	Flags: None
	Line Number: 122
*/
function function_b60106f1(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		playFX(localClientNum, level._effect["demongate_portal_open"], self.origin, AnglesToForward(self.angles));
		self.var_94ee7be5 = self PlayLoopSound("zmb_demongate_portal_lp", 1);
		wait(0.45);
		self.var_ba12da24 = playFX(localClientNum, level._effect["demongate_portal_loop"], self.origin, AnglesToForward(self.angles));
		continue;
	}
	deletefx(localClientNum, self.var_ba12da24, 0);
	playFX(localClientNum, level._effect["demongate_portal_close"], self.origin, AnglesToForward(self.angles));
	if(isdefined(self.var_94ee7be5))
	{
		self StopLoopSound(self.var_94ee7be5, 1);
	}
}

/*
	Name: function_2e7aea94
	Namespace: namespace_efd1ef23
	Checksum: 0x328DB09E
	Offset: 0xD38
	Size: 0x70
	Parameters: 7
	Flags: None
	Line Number: 150
*/
function function_2e7aea94(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self thread function_f6239855(localClientNum);
		continue;
	}
	self notify("hash_792bae11");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f6239855
	Namespace: namespace_efd1ef23
	Checksum: 0xDFD327C3
	Offset: 0xDB0
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 172
*/
function function_f6239855(localClientNum)
{
	level endon("demo_jump");
	self endon("hash_792bae11");
	self endon("death");
	while(isdefined(self))
	{
		self PlayRumbleOnEntity(localClientNum, "zod_idgun_vortex_interior");
		wait(0.075);
	}
}

/*
	Name: function_b463a519
	Namespace: namespace_efd1ef23
	Checksum: 0x71F82766
	Offset: 0xE18
	Size: 0xA0
	Parameters: 7
	Flags: None
	Line Number: 194
*/
function function_b463a519(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(!self HasAnimTree())
	{
		self useanimtree(-1);
	}
	if(newVal)
	{
		self SetAnim("ai_zm_dlc1_chomper_a_demongate_swarm_locomotion_f_notrans");
	}
}

/*
	Name: function_ac6d79d2
	Namespace: namespace_efd1ef23
	Checksum: 0xB8A938D7
	Offset: 0xEC0
	Size: 0xA0
	Parameters: 7
	Flags: None
	Line Number: 216
*/
function function_ac6d79d2(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(!self HasAnimTree())
	{
		self useanimtree(-1);
	}
	if(newVal)
	{
		self SetAnim("ai_zm_dlc1_chomper_a_demongate_swarm_locomotion_f_notrans");
	}
}

/*
	Name: function_f763292d
	Namespace: namespace_efd1ef23
	Checksum: 0xD9283F0C
	Offset: 0xF68
	Size: 0x160
	Parameters: 7
	Flags: None
	Line Number: 238
*/
function function_f763292d(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self endon("entityshutdown");
	if(newVal)
	{
		if(isdefined(self.var_68766ec))
		{
			deletefx(localClientNum, self.var_68766ec, 1);
		}
		self.var_68766ec = PlayFXOnTag(localClientNum, level._effect["demongate_chomper_trail"], self, "tag_fx");
		return;
	}
	else if(isdefined(self.var_68766ec))
	{
		deletefx(localClientNum, self.var_68766ec, 0);
		self.var_68766ec = undefined;
	}
	self playsound(0, "zmb_demongate_chomper_disappear");
	PlayFXOnTag(localClientNum, level._effect["demongate_chomper_end"], self, "tag_fx");
	wait(0.4);
	self Hide();
}

/*
	Name: function_ac9c30de
	Namespace: namespace_efd1ef23
	Checksum: 0x7C65C9FA
	Offset: 0x10D0
	Size: 0xFC
	Parameters: 7
	Flags: None
	Line Number: 271
*/
function function_ac9c30de(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self endon("entityshutdown");
	if(isdefined(self.var_5a634926))
	{
		stopfx(localClientNum, self.var_5a634926);
	}
	self playsound(0, "zmb_demongate_chomper_bite");
	self.var_5a634926 = playFX(localClientNum, level._effect["demongate_chomper_bite"], self.origin);
	wait(0.1);
	if(isdefined(self.var_5a634926))
	{
		stopfx(localClientNum, self.var_5a634926);
	}
}

