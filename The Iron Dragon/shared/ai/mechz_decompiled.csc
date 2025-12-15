#include scripts\shared\ai_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\visionset_mgr_shared;

#namespace mechz;

/*
	Name: main
	Namespace: mechz
	Checksum: 0x52F98501
	Offset: 0x748
	Size: 0x3B0
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec main()
{
	clientfield::register("actor", "mechz_ft", 5000, 1, "int", &MechzClientUtils::mechzFlamethrowerCallback, 0, 0);
	clientfield::register("actor", "mechz_faceplate_detached", 5000, 2, "int", &MechzClientUtils::mechz_detach_faceplate, 0, 0);
	clientfield::register("actor", "mechz_powercap_detached", 5000, 1, "int", &MechzClientUtils::mechz_detach_powercap, 0, 0);
	clientfield::register("actor", "mechz_claw_detached", 5000, 2, "int", &MechzClientUtils::mechz_detach_claw, 0, 0);
	clientfield::register("actor", "mechz_115_gun_firing", 5000, 1, "int", &MechzClientUtils::mechz_115_gun_muzzle_flash, 0, 0);
	clientfield::register("actor", "mechz_rknee_armor_detached", 5000, 1, "int", &MechzClientUtils::mechz_detach_rknee_armor, 0, 0);
	clientfield::register("actor", "mechz_lknee_armor_detached", 5000, 1, "int", &MechzClientUtils::mechz_detach_lknee_armor, 0, 0);
	clientfield::register("actor", "mechz_rshoulder_armor_detached", 5000, 1, "int", &MechzClientUtils::mechz_detach_rshoulder_armor, 0, 0);
	clientfield::register("actor", "mechz_lshoulder_armor_detached", 5000, 1, "int", &MechzClientUtils::mechz_detach_lshoulder_armor, 0, 0);
	clientfield::register("actor", "mechz_headlamp_off", 5000, 2, "int", &MechzClientUtils::mechz_headlamp_off, 0, 0);
	clientfield::register("actor", "mechz_face", 1, 3, "int", &MechzClientUtils::mechzFaceCallback, 0, 0);
	ai::add_archetype_spawn_function("mechz", &MechzClientUtils::mechzSpawn);
	level._mechz_face = [];
	level._mechz_face[1] = "ai_face_zombie_generic_attack_1";
	level._mechz_face[2] = "ai_face_zombie_generic_death_1";
	level._mechz_face[3] = "ai_face_zombie_generic_idle_1";
	level._mechz_face[4] = "ai_face_zombie_generic_pain_1";
}

/*
	Name: Precache
	Namespace: mechz
	Checksum: 0xA32E3DD9
	Offset: 0xB00
	Size: 0x1E0
	Parameters: 0
	Flags: AutoExec
	Line Number: 48
*/
function autoexec Precache()
{
	level._effect["fx_mech_wpn_flamethrower"] = "dlc1/castle/fx_mech_wpn_flamethrower";
	level._effect["fx_mech_dmg_armor_face"] = "dlc1/castle/fx_mech_dmg_armor_face";
	level._effect["fx_mech_dmg_armor"] = "dlc1/castle/fx_mech_dmg_armor";
	level._effect["fx_mech_dmg_armor"] = "dlc1/castle/fx_mech_dmg_armor";
	level._effect["fx_wpn_115_muz"] = "dlc1/castle/fx_wpn_115_muz";
	level._effect["fx_mech_dmg_armor"] = "dlc1/castle/fx_mech_dmg_armor";
	level._effect["fx_mech_dmg_armor"] = "dlc1/castle/fx_mech_dmg_armor";
	level._effect["fx_mech_dmg_armor"] = "dlc1/castle/fx_mech_dmg_armor";
	level._effect["fx_mech_dmg_armor"] = "dlc1/castle/fx_mech_dmg_armor";
	level._effect["fx_mech_head_light"] = "dlc1/castle/fx_mech_head_light";
	level._effect["fx_mech_dmg_sparks"] = "dlc1/castle/fx_mech_dmg_sparks";
	level._effect["fx_mech_dmg_knee_sparks"] = "dlc1/castle/fx_mech_dmg_knee_sparks";
	level._effect["fx_mech_dmg_sparks"] = "dlc1/castle/fx_mech_dmg_sparks";
	level._effect["fx_mech_foot_step"] = "dlc1/castle/fx_mech_foot_step";
	level._effect["fx_mech_light_dmg"] = "dlc1/castle/fx_mech_light_dmg";
	level._effect["fx_mech_foot_step_steam"] = "dlc1/castle/fx_mech_foot_step_steam";
	level._effect["fx_mech_dmg_body_light"] = "dlc1/castle/fx_mech_dmg_body_light";
}

#namespace MechzClientUtils;

/*
	Name: mechzSpawn
	Namespace: MechzClientUtils
	Checksum: 0xEBEFF8BA
	Offset: 0xCE8
	Size: 0x88
	Parameters: 1
	Flags: Private
	Line Number: 81
*/
function private mechzSpawn(localClientNum)
{
	level._footstepCBFuncs[self.archetype] = &mechzProcessFootstep;
	level thread mechzSndContext(self);
	self.headlight_fx = PlayFXOnTag(localClientNum, level._effect["fx_mech_head_light"], self, "tag_headlamp_FX");
	self.headlamp_on = 1;
}

/*
	Name: mechzSndContext
	Namespace: MechzClientUtils
	Checksum: 0xF2B4DF8B
	Offset: 0xD78
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 99
*/
function mechzSndContext(mechz)
{
	wait(1);
	if(isdefined(mechz))
	{
		mechz setsoundentcontext("movement", "normal");
		return;
	}
}

/*
	Name: mechzProcessFootstep
	Namespace: MechzClientUtils
	Checksum: 0x12AD230C
	Offset: 0xDC8
	Size: 0x2A8
	Parameters: 5
	Flags: None
	Line Number: 119
*/
function mechzProcessFootstep(localClientNum, pos, surface, Notetrack, bone)
{
	e_player = GetLocalPlayer(localClientNum);
	n_dist = DistanceSquared(pos, e_player.origin);
	n_mechz_dist = 1000000;
	if(n_mechz_dist > 0)
	{
		n_scale = n_mechz_dist - n_dist / n_mechz_dist;
		continue;
		return;
	}
	if(n_scale > 1 || n_scale < 0)
	{
		return;
	}
	if(n_scale <= 0.01)
	{
		return;
	}
	earthquake_scale = n_scale * 0.1;
	if(earthquake_scale > 0.01)
	{
		e_player Earthquake(earthquake_scale, 0.1, pos, n_dist);
	}
	if(n_scale <= 1 && n_scale > 0.8)
	{
		e_player PlayRumbleOnEntity(localClientNum, "shotgun_fire");
	}
	else if(n_scale <= 0.8 && n_scale > 0.4)
	{
		e_player PlayRumbleOnEntity(localClientNum, "damage_heavy");
		continue;
	}
	e_player PlayRumbleOnEntity(localClientNum, "reload_small");
	FX = PlayFXOnTag(localClientNum, level._effect["fx_mech_foot_step"], self, bone);
	if(bone == "j_ball_le")
	{
		steam_bone = "tag_foot_steam_le";
		continue;
	}
	steam_bone = "tag_foot_steam_ri";
	steam_fx = PlayFXOnTag(localClientNum, level._effect["fx_mech_foot_step_steam"], self, steam_bone);
}

/*
	Name: mechzFlamethrowerCallback
	Namespace: MechzClientUtils
	Checksum: 0x3442A417
	Offset: 0x1078
	Size: 0x160
	Parameters: 7
	Flags: Private
	Line Number: 173
*/
function private mechzFlamethrowerCallback(localClientNum, oldValue, newValue, bNewEnt, bInitialSnap, fieldName, wasDemoJump)
{
	switch(newValue)
	{
		case 1:
		{
			self.fire_beam_id = BeamLaunch(localClientNum, self, "tag_flamethrower_fx", undefined, "none", "flamethrower_beam_3p_zm_mechz");
			self playsound(0, "wpn_flame_thrower_start_mechz");
			self.sndLoopID = self PlayLoopSound("wpn_flame_thrower_loop_mechz");
			break;
		}
		case 0:
		{
			self notify("stopFlamethrower");
			if(isdefined(self.fire_beam_id))
			{
				BeamKill(localClientNum, self.fire_beam_id);
				self playsound(0, "wpn_flame_thrower_stop_mechz");
				self StopLoopSound(self.sndLoopID);
				break;
			}
		}
	}
}

/*
	Name: mechz_detach_faceplate
	Namespace: MechzClientUtils
	Checksum: 0x9AF8B9BD
	Offset: 0x11E0
	Size: 0x1A8
	Parameters: 7
	Flags: None
	Line Number: 208
*/
function mechz_detach_faceplate(localClientNum, oldValue, newValue, bNewEnt, bInitialSnap, fieldName, wasDemoJump)
{
	if(isdefined(level.var_26a85e09))
	{
		self [[level.var_26a85e09]](localClientNum, oldValue, newValue, bNewEnt, bInitialSnap, fieldName, wasDemoJump);
		return;
	}
	pos = self GetTagOrigin("j_faceplate");
	ang = self GetTagAngles("j_faceplate");
	velocity = self getvelocity();
	dynEnt = CreateDynEntAndLaunch(localClientNum, "c_zom_mech_faceplate", pos, ang, self.origin, velocity);
	PlayFXOnTag(localClientNum, level._effect["fx_mech_dmg_armor_face"], self, "j_faceplate");
	self setsoundentcontext("movement", "loud");
	self playsound(0, "zmb_ai_mechz_faceplate");
}

/*
	Name: mechz_detach_powercap
	Namespace: MechzClientUtils
	Checksum: 0x58749B80
	Offset: 0x1390
	Size: 0x180
	Parameters: 7
	Flags: None
	Line Number: 234
*/
function mechz_detach_powercap(localClientNum, oldValue, newValue, bNewEnt, bInitialSnap, fieldName, wasDemoJump)
{
	pos = self GetTagOrigin("tag_powersupply");
	ang = self GetTagAngles("tag_powersupply");
	velocity = self getvelocity();
	dynEnt = CreateDynEntAndLaunch(localClientNum, "c_zom_mech_powersupply_cap", pos, ang, self.origin, velocity);
	PlayFXOnTag(localClientNum, level._effect["fx_mech_dmg_armor"], self, "tag_powersupply");
	self playsound(0, "zmb_ai_mechz_destruction");
	self.MECHZ_POWERCORE_FX = PlayFXOnTag(localClientNum, level._effect["fx_mech_dmg_body_light"], self, "tag_powersupply");
}

/*
	Name: mechz_detach_claw
	Namespace: MechzClientUtils
	Checksum: 0x33CC3A60
	Offset: 0x1518
	Size: 0x1B0
	Parameters: 7
	Flags: None
	Line Number: 255
*/
function mechz_detach_claw(localClientNum, oldValue, newValue, bNewEnt, bInitialSnap, fieldName, wasDemoJump)
{
	if(isdefined(level.mechz_detach_claw_override))
	{
		self [[level.mechz_detach_claw_override]](localClientNum, oldValue, newValue, bNewEnt, bInitialSnap, fieldName, wasDemoJump);
		return;
	}
	pos = self GetTagOrigin("tag_gun_spin");
	ang = self GetTagAngles("tag_gun_spin");
	velocity = self getvelocity();
	dynEnt = CreateDynEntAndLaunch(localClientNum, "c_zom_mech_gun_barrel", pos, ang, self.origin, velocity);
	PlayFXOnTag(localClientNum, level._effect["fx_mech_dmg_armor"], self, "tag_gun_spin");
	self playsound(0, "zmb_ai_mechz_destruction");
	PlayFXOnTag(localClientNum, level._effect["fx_mech_dmg_sparks"], self, "tag_gun_spin");
	return;
	ERROR: Bad function call
}

/*
	Name: mechz_115_gun_muzzle_flash
	Namespace: MechzClientUtils
	Checksum: 0x7CD55518
	Offset: 0x16D0
	Size: 0x70
	Parameters: 7
	Flags: None
	Line Number: 283
*/
function mechz_115_gun_muzzle_flash(localClientNum, oldValue, newValue, bNewEnt, bInitialSnap, fieldName, wasDemoJump)
{
	PlayFXOnTag(localClientNum, level._effect["fx_wpn_115_muz"], self, "tag_gun_barrel2");
}

/*
	Name: mechz_detach_rknee_armor
	Namespace: MechzClientUtils
	Checksum: 0xF06A18BB
	Offset: 0x1748
	Size: 0x170
	Parameters: 7
	Flags: None
	Line Number: 298
*/
function mechz_detach_rknee_armor(localClientNum, oldValue, newValue, bNewEnt, bInitialSnap, fieldName, wasDemoJump)
{
	pos = self GetTagOrigin("j_knee_attach_ri");
	ang = self GetTagAngles("j_knee_attach_ri");
	velocity = self getvelocity();
	dynEnt = CreateDynEntAndLaunch(localClientNum, "c_zom_mech_armor_knee_right", pos, ang, pos, velocity);
	PlayFXOnTag(localClientNum, level._effect["fx_mech_dmg_armor"], self, "j_knee_attach_ri");
	self playsound(0, "zmb_ai_mechz_destruction");
	PlayFXOnTag(localClientNum, level._effect["fx_mech_dmg_knee_sparks"], self, "j_knee_attach_ri");
}

/*
	Name: mechz_detach_lknee_armor
	Namespace: MechzClientUtils
	Checksum: 0xB3387D0C
	Offset: 0x18C0
	Size: 0x170
	Parameters: 7
	Flags: None
	Line Number: 319
*/
function mechz_detach_lknee_armor(localClientNum, oldValue, newValue, bNewEnt, bInitialSnap, fieldName, wasDemoJump)
{
	pos = self GetTagOrigin("j_knee_attach_le");
	ang = self GetTagAngles("j_knee_attach_le");
	velocity = self getvelocity();
	dynEnt = CreateDynEntAndLaunch(localClientNum, "c_zom_mech_armor_knee_left", pos, ang, pos, velocity);
	PlayFXOnTag(localClientNum, level._effect["fx_mech_dmg_armor"], self, "j_knee_attach_le");
	self playsound(0, "zmb_ai_mechz_destruction");
	PlayFXOnTag(localClientNum, level._effect["fx_mech_dmg_knee_sparks"], self, "j_knee_attach_le");
}

/*
	Name: mechz_detach_rshoulder_armor
	Namespace: MechzClientUtils
	Checksum: 0x6383EB80
	Offset: 0x1A38
	Size: 0x170
	Parameters: 7
	Flags: None
	Line Number: 340
*/
function mechz_detach_rshoulder_armor(localClientNum, oldValue, newValue, bNewEnt, bInitialSnap, fieldName, wasDemoJump)
{
	pos = self GetTagOrigin("j_shoulderarmor_ri");
	ang = self GetTagAngles("j_shoulderarmor_ri");
	velocity = self getvelocity();
	dynEnt = CreateDynEntAndLaunch(localClientNum, "c_zom_mech_armor_shoulder_right", pos, ang, pos, velocity);
	PlayFXOnTag(localClientNum, level._effect["fx_mech_dmg_armor"], self, "j_shoulderarmor_ri");
	self playsound(0, "zmb_ai_mechz_destruction");
	PlayFXOnTag(localClientNum, level._effect["fx_mech_dmg_sparks"], self, "j_shoulderarmor_ri");
}

/*
	Name: mechz_detach_lshoulder_armor
	Namespace: MechzClientUtils
	Checksum: 0x96854527
	Offset: 0x1BB0
	Size: 0x170
	Parameters: 7
	Flags: None
	Line Number: 361
*/
function mechz_detach_lshoulder_armor(localClientNum, oldValue, newValue, bNewEnt, bInitialSnap, fieldName, wasDemoJump)
{
	pos = self GetTagOrigin("j_shoulderarmor_le");
	ang = self GetTagAngles("j_shoulderarmor_le");
	velocity = self getvelocity();
	dynEnt = CreateDynEntAndLaunch(localClientNum, "c_zom_mech_armor_shoulder_left", pos, ang, pos, velocity);
	PlayFXOnTag(localClientNum, level._effect["fx_mech_dmg_armor"], self, "j_shoulderarmor_le");
	self playsound(0, "zmb_ai_mechz_destruction");
	PlayFXOnTag(localClientNum, level._effect["fx_mech_dmg_sparks"], self, "j_shoulderarmor_le");
}

/*
	Name: mechz_headlamp_off
	Namespace: MechzClientUtils
	Checksum: 0x1B6D844D
	Offset: 0x1D28
	Size: 0xD0
	Parameters: 7
	Flags: None
	Line Number: 382
*/
function mechz_headlamp_off(localClientNum, oldValue, newValue, bNewEnt, bInitialSnap, fieldName, wasDemoJump)
{
	if(self.headlamp_on === 1 && newValue != 0 && isdefined(self.headlight_fx))
	{
		stopfx(localClientNum, self.headlight_fx);
		self.headlamp_on = 0;
		if(newValue == 2)
		{
			PlayFXOnTag(localClientNum, level._effect["fx_mech_foot_step"], self, "tag_headlamp_fx");
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: mechzFaceCallback
	Namespace: MechzClientUtils
	Checksum: 0x3DC14CE5
	Offset: 0x1E00
	Size: 0xC8
	Parameters: 7
	Flags: Private
	Line Number: 407
*/
function private mechzFaceCallback(localClientNum, oldValue, newValue, bNewEnt, bInitialSnap, fieldName, wasDemoJump)
{
	if(newValue)
	{
		if(isdefined(self.prevFaceAnim))
		{
			self ClearAnim(self.prevFaceAnim, 0.2);
		}
		faceAnim = level._mechz_face[newValue];
		self SetAnim(faceAnim, 1, 0.2, 1);
		self.prevFaceAnim = faceAnim;
	}
}

