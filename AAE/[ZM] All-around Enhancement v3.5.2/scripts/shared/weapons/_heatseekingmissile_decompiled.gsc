#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\challenges_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\dev_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\weapons\_weapon_utils;

#namespace heatseekingmissile;

/*
	Name: init_shared
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x308
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 21
*/
function init_shared()
{
	game["locking_on_sound"] = "uin_alert_lockon_start";
	game["locked_on_sound"] = "uin_alert_lockon";
	callback::on_spawned(&on_player_spawned);
	level.fx_flare = "killstreaks/fx_heli_chaff";
	/#
		SetDvar("Dev Block strings are not supported", "Dev Block strings are not supported");
	#/
}

/*
	Name: on_player_spawned
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x398
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function on_player_spawned()
{
	self endon("disconnect");
	self ClearIRTarget();
	thread StingerToggleLoop();
	self thread StingerFiredNotify();
}

/*
	Name: ClearIRTarget
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x3F0
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function ClearIRTarget()
{
	self notify("stop_lockon_sound");
	self notify("stop_locked_sound");
	self.stingerlocksound = undefined;
	self StopRumble("stinger_lock_rumble");
	self.stingerLockStartTime = 0;
	self.stingerLockStarted = 0;
	self.stingerLockFinalized = 0;
	self.stingerLockDetected = 0;
	if(isdefined(self.stingerTarget))
	{
		self.stingerTarget notify("missile_unlocked");
		self LockingOn(self.stingerTarget, 0);
		self LockedOn(self.stingerTarget, 0);
	}
	self.stingerTarget = undefined;
	self WeaponLockFree();
	self weaponlocktargettooclose(0);
	self WeaponLockNoClearance(0);
	self StopLocalSound(game["locking_on_sound"]);
	self StopLocalSound(game["locked_on_sound"]);
	self DestroyLockOnCanceledMessage();
	return;
}

/*
	Name: StingerFiredNotify
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x578
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 96
*/
function StingerFiredNotify()
{
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("missile_fire", missile, weapon);
		/#
			thread debug_missile(missile);
		#/
		if(weapon.lockonType == "Legacy Single")
		{
			if(isdefined(self.stingerTarget) && self.stingerLockFinalized)
			{
				self.stingerTarget notify("stinger_fired_at_me", missile, weapon, self);
			}
		}
	}
}

/*
	Name: debug_missile
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x638
	Size: 0x248
	Parameters: 1
	Flags: None
	Line Number: 126
*/
function debug_missile(missile)
{
	/#
		level notify("debug_missile");
		level endon("debug_missile");
		level.debug_missile_dots = [];
		while(1)
		{
			if(GetDvarInt("Dev Block strings are not supported", 0) == 0)
			{
				wait(0.5);
				continue;
			}
			if(isdefined(missile))
			{
				missile_info = spawnstruct();
				missile_info.origin = missile.origin;
				target = missile missile_gettarget();
				if(isdefined(target))
				{
				}
				else
				{
				}
				missile_info.targetEntNum = undefined;
				if(!isdefined(level.debug_missile_dots))
				{
					level.debug_missile_dots = [];
				}
				else if(!IsArray(level.debug_missile_dots))
				{
					level.debug_missile_dots = Array(level.debug_missile_dots);
				}
				level.debug_missile_dots[level.debug_missile_dots.size] = missile_info;
			}
			foreach(missile_info in level.debug_missile_dots)
			{
				if(isdefined(missile_info.targetEntNum))
				{
				}
				else
				{
				}
				dot_color = (0, 1, 0);
				util::debug_sphere(missile_info.origin, 10, dot_color, 0.66, 1);
			}
			wait(0.05);
		}
	#/
}

/*
	Name: StingerWaitForAds
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x888
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 187
*/
function StingerWaitForAds()
{
	while(!self PlayerStingerAds())
	{
		wait(0.05);
		currentWeapon = self GetCurrentWeapon();
		if(currentWeapon.lockonType != "Legacy Single")
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: StingerToggleLoop
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x900
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 211
*/
function StingerToggleLoop()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self waittill("weapon_change", weapon);
		while(weapon.lockonType == "Legacy Single")
		{
			if(self GetWeaponAmmoClip(weapon) == 0)
			{
				wait(0.05);
				weapon = self GetCurrentWeapon();
				continue;
			}
			if(!StingerWaitForAds())
			{
				break;
			}
			self thread StingerIRTLoop(weapon);
			while(self PlayerStingerAds())
			{
				wait(0.05);
			}
			self notify("stinger_IRT_off");
			self ClearIRTarget();
			weapon = self GetCurrentWeapon();
		}
	}
}

/*
	Name: StingerIRTLoop
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0xA40
	Size: 0x678
	Parameters: 1
	Flags: None
	Line Number: 252
*/
function StingerIRTLoop(weapon)
{
	self endon("disconnect");
	self endon("death");
	self endon("stinger_IRT_off");
	lockLength = self getLockOnSpeed();
	if(IsSubStr(weapon.name, "upgraded"))
	{
		lockLength = 0;
	}
	for(;;)
	{
		wait(0.05);
		if(self.stingerLockFinalized)
		{
			passed = SoftSightTest();
			if(!passed)
			{
			}
			else if(!self IsStillValidTarget(self.stingerTarget, weapon) || self InsideStingerReticleLocked(self.stingerTarget, weapon) == 0)
			{
				self SetWeaponLockOnPercent(weapon, 0);
				self ClearIRTarget();
			}
			else if(!self.stingerTarget.locked_on)
			{
				self.stingerTarget notify("missile_lock", self, self GetCurrentWeapon());
			}
			self LockingOn(self.stingerTarget, 0);
			self LockedOn(self.stingerTarget, 1);
			if(isdefined(weapon))
			{
				setFriendlyFlags(weapon, self.stingerTarget);
			}
			thread LoopLocalLockSound(game["locked_on_sound"], 0.75);
		}
		else if(self.stingerLockStarted)
		{
			if(!self IsStillValidTarget(self.stingerTarget, weapon) || self InsideStingerReticleLocked(self.stingerTarget, weapon) == 0)
			{
				self SetWeaponLockOnPercent(weapon, 0);
				self ClearIRTarget();
			}
			self LockingOn(self.stingerTarget, 1);
			self LockedOn(self.stingerTarget, 0);
			setFriendlyFlags(weapon, self.stingerTarget);
			passed = SoftSightTest();
			timePassed = GetTime() - self.stingerLockStartTime;
			self SetWeaponLockOnPercent(weapon, timePassed / lockLength * 100);
			setFriendlyFlags(weapon, self.stingerTarget);
			Assert(isdefined(self.stingerTarget));
			self notify("stop_lockon_sound");
			self.stingerLockFinalized = 1;
			self WeaponLockFinalize(self.stingerTarget);
		}
		else
		{
			if(isdefined(weapon))
			{
			}
			if(!passed)
			{
			}
			else
			{
				if(isdefined(weapon))
				{
				}
				if(timePassed < lockLength)
				{
				}
				else
				{
					else
					{
						bestTarget = self GetBestStingerTarget(weapon);
						if(!isdefined(bestTarget) || (isdefined(self.stingerTarget) && self.stingerTarget != bestTarget))
						{
							self DestroyLockOnCanceledMessage();
							if(self.stingerLockDetected == 1)
							{
								self WeaponLockFree();
								self.stingerLockDetected = 0;
							}
						}
						else if(!self LockSightTest(bestTarget))
						{
							self DestroyLockOnCanceledMessage();
						}
						else if(isdefined(bestTarget.lockOnDelay) && bestTarget.lockOnDelay)
						{
							self DisplayLockOnCanceledMessage();
						}
						else if(!TargetWithinRangeOfPlaySpace(bestTarget))
						{
							self DisplayLockOnCanceledMessage();
						}
						else
						{
							self DestroyLockOnCanceledMessage();
							if(self InsideStingerReticleLocked(bestTarget, weapon) == 0)
							{
								if(self.stingerLockDetected == 0)
								{
									self WeaponLockDetect(bestTarget);
								}
								self.stingerLockDetected = 1;
								if(isdefined(weapon))
								{
									setFriendlyFlags(weapon, bestTarget);
								}
							}
							else
							{
								self.stingerLockDetected = 0;
								InitLockField(bestTarget);
								self.stingerTarget = bestTarget;
								self.stingerLockStartTime = GetTime();
								self.stingerLockStarted = 1;
								self.stingerLostSightlineTime = 0;
								self WeaponLockStart(bestTarget);
								self thread LoopLocalSeekSound(game["locking_on_sound"], 0.6);
							}
						}
					}
				}
				/#
				#/
			}
		}
	}
}

/*
	Name: TargetWithinRangeOfPlaySpace
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x10C0
	Size: 0x170
	Parameters: 1
	Flags: None
	Line Number: 395
*/
function TargetWithinRangeOfPlaySpace(target)
{
	/#
		if(GetDvarInt("Dev Block strings are not supported", 0) > 0)
		{
			extraRadiusDvar = GetDvarInt("Dev Block strings are not supported", 5000);
			if(isdefined(level.missileLockPlaySpaceCheckExtraRadius))
			{
			}
			else if(extraRadiusDvar != 0)
			{
				level.missileLockPlaySpaceCheckExtraRadius = extraRadiusDvar;
				level.missileLockPlaySpaceCheckRadiusSqr = undefined;
			}
		}
	#/
	if(level.missileLockPlaySpaceCheckEnabled === 1)
	{
		if(!isdefined(target))
		{
			return 0;
		}
		if(!isdefined(level.playSpaceCenter))
		{
			level.playSpaceCenter = util::GetPlaySpaceCenter();
		}
		if(!isdefined(level.missileLockPlaySpaceCheckRadiusSqr))
		{
			level.missileLockPlaySpaceCheckRadiusSqr = util::GetPlaySpaceMaxWidth() * 0.5 + level.missileLockPlaySpaceCheckExtraRadius * util::GetPlaySpaceMaxWidth() * 0.5 + level.missileLockPlaySpaceCheckExtraRadius;
		}
		if(Distance2DSquared(target.origin, level.playSpaceCenter) > level.missileLockPlaySpaceCheckRadiusSqr)
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: DestroyLockOnCanceledMessage
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1238
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 443
*/
function DestroyLockOnCanceledMessage()
{
	return;
}

/*
	Name: DisplayLockOnCanceledMessage
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1248
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 458
*/
function DisplayLockOnCanceledMessage()
{
}

/*
	Name: GetBestStingerTarget
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1258
	Size: 0x3C0
	Parameters: 1
	Flags: None
	Line Number: 472
*/
function GetBestStingerTarget(weapon)
{
	targetsAll = [];
	if(isdefined(self.get_stinger_target_override))
	{
		targetsAll = self [[self.get_stinger_target_override]]();
	}
	else
	{
		targetsAll = target_getArray();
	}
	targetsValid = [];
	for(idx = 0; idx < targetsAll.size; idx++)
	{
		/#
			if(GetDvarString("Dev Block strings are not supported") == "Dev Block strings are not supported")
			{
				if(self InsideStingerReticleNoLock(targetsAll[idx], weapon))
				{
					targetsValid[targetsValid.size] = targetsAll[idx];
					continue;
				}
			}
		#/
		target = targetsAll[idx];
		if(level.teambased || level.use_team_based_logic_for_locking_on === 1)
		{
			if(isdefined(target.team) && target.team != self.team)
			{
				if(self InsideStingerReticleDetect(target, weapon))
				{
					if(!isdefined(self.is_valid_target_for_stinger_override) || self [[self.is_valid_target_for_stinger_override]](target))
					{
						hascamo = isdefined(target.camo_state) && target.camo_state == 1 && !self hasPerk("specialty_showenemyequipment");
						if(!hascamo)
						{
							targetsValid[targetsValid.size] = target;
							continue;
						}
					}
				}
			}
		}
		if(self InsideStingerReticleDetect(target, weapon))
		{
			if(isdefined(target.owner) && self != target.owner || (isPlayer(target) && self != target))
			{
				if(!isdefined(self.is_valid_target_for_stinger_override) || self [[self.is_valid_target_for_stinger_override]](target))
				{
					targetsValid[targetsValid.size] = target;
				}
			}
		}
	}
	if(targetsValid.size == 0)
	{
		return undefined;
	}
	bestTarget = targetsValid[0];
	if(targetsValid.size > 1)
	{
		closestRatio = 0;
		foreach(target in targetsValid)
		{
			Ratio = RatioDistanceFromScreenCenter(target, weapon);
			if(Ratio > closestRatio)
			{
				closestRatio = Ratio;
				bestTarget = target;
			}
		}
	}
	return bestTarget;
}

/*
	Name: CalcLockOnRadius
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1620
	Size: 0x100
	Parameters: 2
	Flags: None
	Line Number: 557
*/
function CalcLockOnRadius(target, weapon)
{
	radius = self getLockOnRadius();
	if(isdefined(weapon) && isdefined(weapon.lockOnScreenRadius) && weapon.lockOnScreenRadius > radius)
	{
		radius = weapon.lockOnScreenRadius;
	}
	if(isdefined(level.lockOnCloseRange) && isdefined(level.lockOnCloseRadiusScaler))
	{
		dist2 = DistanceSquared(target.origin, self.origin);
		if(dist2 < level.lockOnCloseRange * level.lockOnCloseRange)
		{
			radius = radius * level.lockOnCloseRadiusScaler;
		}
	}
	return radius;
}

/*
	Name: CalcLockOnLossRadius
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1728
	Size: 0x100
	Parameters: 2
	Flags: None
	Line Number: 585
*/
function CalcLockOnLossRadius(target, weapon)
{
	radius = self getLockOnLossRadius();
	if(isdefined(weapon) && isdefined(weapon.lockOnScreenRadius) && weapon.lockOnScreenRadius > radius)
	{
		radius = weapon.lockOnScreenRadius;
	}
	if(isdefined(level.lockOnCloseRange) && isdefined(level.lockOnCloseRadiusScaler))
	{
		dist2 = DistanceSquared(target.origin, self.origin);
		if(dist2 < level.lockOnCloseRange * level.lockOnCloseRange)
		{
			radius = radius * level.lockOnCloseRadiusScaler;
		}
	}
	return radius;
}

/*
	Name: RatioDistanceFromScreenCenter
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1830
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 613
*/
function RatioDistanceFromScreenCenter(target, weapon)
{
	radius = CalcLockOnRadius(target, weapon);
	return Target_ScaleMinMaxRadius(target, self, 65, 0, radius);
}

/*
	Name: InsideStingerReticleDetect
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1898
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 629
*/
function InsideStingerReticleDetect(target, weapon)
{
	radius = CalcLockOnRadius(target, weapon);
	return Target_IsInCircle(target, self, 65, radius);
}

/*
	Name: InsideStingerReticleNoLock
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1900
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 645
*/
function InsideStingerReticleNoLock(target, weapon)
{
	radius = CalcLockOnRadius(target, weapon);
	return Target_IsInCircle(target, self, 65, radius);
}

/*
	Name: InsideStingerReticleLocked
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1968
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 661
*/
function InsideStingerReticleLocked(target, weapon)
{
	if(IsSubStr(weapon.name, "_upgraded"))
	{
		return 1;
	}
	radius = CalcLockOnLossRadius(target, weapon);
	return Target_IsInCircle(target, self, 65, radius);
}

/*
	Name: IsStillValidTarget
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1A00
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 681
*/
function IsStillValidTarget(ent, weapon)
{
	if(!isdefined(ent))
	{
		return 0;
	}
	if(isdefined(self.is_still_valid_target_for_stinger_override))
	{
		return self [[self.is_still_valid_target_for_stinger_override]](ent, weapon);
	}
	if(!Target_IsTarget(ent) && (!(isdefined(ent.allowContinuedLockonAfterInvis) && ent.allowContinuedLockonAfterInvis)))
	{
		return 0;
	}
	if(!InsideStingerReticleDetect(ent, weapon))
	{
		return 0;
	}
	return 1;
}

/*
	Name: PlayerStingerAds
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1AB8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 712
*/
function PlayerStingerAds()
{
	return self PlayerAds() == 1;
}

/*
	Name: LoopLocalSeekSound
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1AE8
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 727
*/
function LoopLocalSeekSound(alias, interval)
{
	self endon("stop_lockon_sound");
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self PlaySoundForLocalPlayer(alias);
		self PlayRumbleOnEntity("stinger_lock_rumble");
		wait(interval / 2);
	}
	return;
}

/*
	Name: PlaySoundForLocalPlayer
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1B70
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 751
*/
function PlaySoundForLocalPlayer(alias)
{
	if(self IsInVehicle())
	{
		sound_target = self GetVehicleOccupied();
		if(isdefined(sound_target))
		{
			sound_target playsoundtoplayer(alias, self);
		}
	}
	else
	{
		self playlocalsound(alias);
	}
}

/*
	Name: LoopLocalLockSound
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1C08
	Size: 0x158
	Parameters: 2
	Flags: None
	Line Number: 777
*/
function LoopLocalLockSound(alias, interval)
{
	self endon("stop_locked_sound");
	self endon("disconnect");
	self endon("death");
	if(isdefined(self.stingerlocksound))
	{
		return;
	}
	self.stingerlocksound = 1;
	for(;;)
	{
		self PlaySoundForLocalPlayer(alias);
		self PlayRumbleOnEntity("stinger_lock_rumble");
		wait(interval / 6);
		self PlaySoundForLocalPlayer(alias);
		self PlayRumbleOnEntity("stinger_lock_rumble");
		wait(interval / 6);
		self PlaySoundForLocalPlayer(alias);
		self PlayRumbleOnEntity("stinger_lock_rumble");
		wait(interval / 6);
		self StopRumble("stinger_lock_rumble");
	}
	self.stingerlocksound = undefined;
}

/*
	Name: LockSightTest
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1D68
	Size: 0x220
	Parameters: 1
	Flags: None
	Line Number: 813
*/
function LockSightTest(target)
{
	cameraPos = self GetPlayerCameraPos();
	if(!isdefined(target))
	{
		return 0;
	}
	if(isdefined(target.parent))
	{
		passed = BulletTracePassed(cameraPos, target.origin, 0, target, target.parent);
	}
	else
	{
		passed = BulletTracePassed(cameraPos, target.origin, 0, target);
	}
	if(passed)
	{
		return 1;
	}
	front = target GetPointInBounds(1, 0, 0);
	if(isdefined(target.parent))
	{
		passed = BulletTracePassed(cameraPos, front, 0, target, target.parent);
	}
	else
	{
		passed = BulletTracePassed(cameraPos, front, 0, target);
	}
	if(passed)
	{
		return 1;
	}
	back = target GetPointInBounds(-1, 0, 0);
	if(isdefined(target.parent))
	{
		passed = BulletTracePassed(cameraPos, back, 0, target, target.parent);
	}
	else
	{
		passed = BulletTracePassed(cameraPos, back, 0, target);
	}
	if(passed)
	{
		return 1;
	}
	return 0;
}

/*
	Name: SoftSightTest
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x1F90
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 871
*/
function SoftSightTest()
{
	LOST_SIGHT_LIMIT = 500;
	if(self LockSightTest(self.stingerTarget))
	{
		self.stingerLostSightlineTime = 0;
		return 1;
	}
	if(self.stingerLostSightlineTime == 0)
	{
		self.stingerLostSightlineTime = GetTime();
	}
	timePassed = GetTime() - self.stingerLostSightlineTime;
	if(timePassed >= LOST_SIGHT_LIMIT)
	{
		self ClearIRTarget();
		return 0;
	}
	return 1;
}

/*
	Name: InitLockField
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x2040
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 902
*/
function InitLockField(target)
{
	if(isdefined(target.locking_on))
	{
		return;
	}
	target.locking_on = 0;
	target.locked_on = 0;
	target.locking_on_hacking = 0;
	return;
}

/*
	Name: LockingOn
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x20A0
	Size: 0xF8
	Parameters: 2
	Flags: None
	Line Number: 924
*/
function LockingOn(target, Lock)
{
	/#
		Assert(isdefined(target.locking_on));
	#/
	clientNum = self GetEntityNumber();
	if(Lock)
	{
		target notify("locking_on");
		target.locking_on = target.locking_on | 1 << clientNum;
		self thread watchClearLockingOn(target, clientNum);
	}
	else
	{
		self notify("locking_on_cleared");
		~target.locking_on;
		target.locking_on = target.locking_on & 1 << clientNum;
	}
}

/*
	Name: watchClearLockingOn
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x21A0
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 954
*/
function watchClearLockingOn(target, clientNum)
{
	target endon("death");
	self endon("locking_on_cleared");
	self util::waittill_any("death", "disconnect");
	~;
	target.locking_on = target.locking_on & 1 << clientNum;
}

/*
	Name: LockedOn
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x2220
	Size: 0xE8
	Parameters: 2
	Flags: None
	Line Number: 973
*/
function LockedOn(target, Lock)
{
	/#
		Assert(isdefined(target.locked_on));
	#/
	clientNum = self GetEntityNumber();
	if(Lock)
	{
		target.locked_on = target.locked_on | 1 << clientNum;
		self thread watchClearLockedOn(target, clientNum);
	}
	else
	{
		self notify("locked_on_cleared");
		~target.locked_on;
		target.locked_on = target.locked_on & 1 << clientNum;
	}
}

/*
	Name: TargetingHacking
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x2310
	Size: 0xF8
	Parameters: 2
	Flags: None
	Line Number: 1002
*/
function TargetingHacking(target, Lock)
{
	/#
		Assert(isdefined(target.locking_on_hacking));
	#/
	clientNum = self GetEntityNumber();
	if(Lock)
	{
		target notify("locking_on_hacking");
		target.locking_on_hacking = target.locking_on_hacking | 1 << clientNum;
		self thread watchClearHacking(target, clientNum);
	}
	else
	{
		self notify("locking_on_hacking_cleared");
		~target.locking_on_hacking;
		target.locking_on_hacking = target.locking_on_hacking & 1 << clientNum;
	}
}

/*
	Name: watchClearHacking
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x2410
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 1032
*/
function watchClearHacking(target, clientNum)
{
	target endon("death");
	self endon("locking_on_hacking_cleared");
	self util::waittill_any("death", "disconnect");
	~;
	target.locking_on_hacking = target.locking_on_hacking & 1 << clientNum;
}

/*
	Name: setFriendlyFlags
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x2490
	Size: 0x530
	Parameters: 2
	Flags: None
	Line Number: 1051
*/
function setFriendlyFlags(weapon, target)
{
	if(!self IsInVehicle())
	{
		self setFriendlyHacking(weapon, target);
		self setFriendlyTargetting(weapon, target);
		self setFriendlyTargetLocked(weapon, target);
		if(isdefined(level.killstreakMaxHealthFunction))
		{
			if(isdefined(target.useVTOLTime) && isdefined(level.vtol))
			{
				killstreakEndTime = level.vtol.killstreakEndTime;
				if(isdefined(killstreakEndTime))
				{
					self settargetedentityendtime(weapon, killstreakEndTime);
				}
			}
			else if(isdefined(target.killstreakEndTime))
			{
				self settargetedentityendtime(weapon, target.killstreakEndTime);
			}
			else if(isdefined(target.parentStruct) && isdefined(target.parentStruct.killstreakEndTime))
			{
				self settargetedentityendtime(weapon, target.parentStruct.killstreakEndTime);
			}
			else
			{
				self settargetedentityendtime(weapon, 0);
			}
			self settargetedmissilesremaining(weapon, 0);
			killstreakType = target.killstreakType;
			if(!isdefined(target.killstreakType) && isdefined(target.parentStruct) && isdefined(target.parentStruct.killstreakType))
			{
				killstreakType = target.parentStruct.killstreakType;
			}
			else if(isdefined(target.useVTOLTime) && isdefined(level.vtol.killstreakType))
			{
				killstreakType = level.vtol.killstreakType;
			}
			if(isdefined(killstreakType) && isdefined(level.killstreakBundle[killstreakType]))
			{
				if(isdefined(target.forceOneMissile))
				{
					self settargetedmissilesremaining(weapon, 1);
				}
				else if(isdefined(target.useVTOLTime) && isdefined(level.vtol) && isdefined(level.vtol.totalRocketHits) && isdefined(level.vtol.missileToDestroy))
				{
					self settargetedmissilesremaining(weapon, level.vtol.missileToDestroy - level.vtol.totalRocketHits);
				}
				else
				{
					maxhealth = [[level.killstreakMaxHealthFunction]](killstreakType);
					damageTaken = target.damageTaken;
					if(!isdefined(damageTaken) && isdefined(target.parentStruct))
					{
						damageTaken = target.parentStruct.damageTaken;
					}
					if(isdefined(target.missileTrackDamage))
					{
						damageTaken = target.missileTrackDamage;
					}
					if(isdefined(damageTaken) && isdefined(maxhealth))
					{
						damagePerRocket = maxhealth / level.killstreakBundle[killstreakType].ksRocketsToKill + 1;
						remainingHealth = maxhealth - damageTaken;
						if(remainingHealth > 0)
						{
							missilesRemaining = Int(ceil(remainingHealth / damagePerRocket));
							if(isdefined(target.numFlares) && target.numFlares > 0)
							{
								missilesRemaining = missilesRemaining + target.numFlares;
							}
							if(isdefined(target.flak_drone))
							{
								missilesRemaining = missilesRemaining + 1;
							}
							self settargetedmissilesremaining(weapon, missilesRemaining);
							return;
						}
					}
				}
			}
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: setFriendlyHacking
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x29C8
	Size: 0xC0
	Parameters: 2
	Flags: None
	Line Number: 1148
*/
function setFriendlyHacking(weapon, target)
{
	if(level.teambased)
	{
		friendlyHackingMask = target.locking_on_hacking;
		if(isdefined(friendlyHackingMask))
		{
			friendlyHacking = 0;
			clientNum = self GetEntityNumber();
			~clientNum;
			friendlyHackingMask = friendlyHackingMask & 1 << clientNum;
			if(friendlyHackingMask != 0)
			{
				friendlyHacking = 1;
			}
			self SetWeaponFriendlyHacking(weapon, friendlyHacking);
		}
	}
}

/*
	Name: setFriendlyTargetting
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x2A90
	Size: 0xC0
	Parameters: 2
	Flags: None
	Line Number: 1178
*/
function setFriendlyTargetting(weapon, target)
{
	if(level.teambased)
	{
		friendlyTargetingMask = target.locking_on;
		if(isdefined(friendlyTargetingMask))
		{
			friendlyTargeting = 0;
			clientNum = self GetEntityNumber();
			~clientNum;
			friendlyTargetingMask = friendlyTargetingMask & 1 << clientNum;
			if(friendlyTargetingMask != 0)
			{
				friendlyTargeting = 1;
			}
			self SetWeaponFriendlyTargeting(weapon, friendlyTargeting);
			return;
		}
	}
	ERROR: Bad function call
}

/*
	Name: setFriendlyTargetLocked
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x2B58
	Size: 0xF0
	Parameters: 2
	Flags: None
	Line Number: 1210
*/
function setFriendlyTargetLocked(weapon, target)
{
	if(level.teambased)
	{
		friendlyTargetLocked = 0;
		friendlyLockingOnMask = target.locked_on;
		if(isdefined(friendlyLockingOnMask))
		{
			friendlyTargetLocked = 0;
			clientNum = self GetEntityNumber();
			~clientNum;
			friendlyLockingOnMask = friendlyLockingOnMask & 1 << clientNum;
			if(friendlyLockingOnMask != 0)
			{
				friendlyTargetLocked = 1;
			}
		}
		if(friendlyTargetLocked == 0)
		{
			friendlyTargetLocked = target MissileTarget_isOtherPlayerMissileIncoming(self);
		}
		self SetWeaponFriendlyTargetLocked(weapon, friendlyTargetLocked);
	}
}

/*
	Name: watchClearLockedOn
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x2C50
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 1245
*/
function watchClearLockedOn(target, clientNum)
{
	self endon("locked_on_cleared");
	self util::waittill_any("death", "disconnect");
	if(isdefined(target))
	{
		~;
		target.locked_on = target.locked_on & 1 << clientNum;
	}
}

/*
	Name: MissileTarget_LockOnMonitor
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x2CD0
	Size: 0x230
	Parameters: 3
	Flags: None
	Line Number: 1266
*/
function MissileTarget_LockOnMonitor(player, endon1, endon2)
{
	self endon("death");
	if(isdefined(endon1))
	{
		self endon(endon1);
	}
	if(isdefined(endon2))
	{
		self endon(endon2);
	}
	while(Target_IsTarget(self))
	{
		if(self MissileTarget_isMissileIncoming())
		{
			self clientfield::set("heli_warn_fired", 1);
			self clientfield::set("heli_warn_locked", 0);
			self clientfield::set("heli_warn_targeted", 0);
		}
		else if(isdefined(self.locked_on) && self.locked_on)
		{
			self clientfield::set("heli_warn_locked", 1);
			self clientfield::set("heli_warn_fired", 0);
			self clientfield::set("heli_warn_targeted", 0);
		}
		else if(isdefined(self.locking_on) && self.locking_on)
		{
			self clientfield::set("heli_warn_targeted", 1);
			self clientfield::set("heli_warn_fired", 0);
			self clientfield::set("heli_warn_locked", 0);
		}
		else
		{
			self clientfield::set("heli_warn_fired", 0);
			self clientfield::set("heli_warn_targeted", 0);
			self clientfield::set("heli_warn_locked", 0);
		}
		wait(0.1);
	}
}

/*
	Name: _incomingMissile
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x2F08
	Size: 0xE0
	Parameters: 2
	Flags: None
	Line Number: 1317
*/
function _incomingMissile(missile, attacker)
{
	if(!isdefined(self.incoming_missile))
	{
		self.incoming_missile = 0;
	}
	if(!isdefined(self.incoming_missile_owner))
	{
		self.incoming_missile_owner = [];
	}
	if(!isdefined(self.incoming_missile_owner[attacker.entnum]))
	{
		self.incoming_missile_owner[attacker.entnum] = 0;
	}
	self.incoming_missile++;
	self.incoming_missile_owner[attacker.entnum]++;
	attacker LockedOn(self, 1);
	self thread _incomingMissileTracker(missile, attacker);
}

/*
	Name: _incomingMissileTracker
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x2FF0
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 1347
*/
function _incomingMissileTracker(missile, attacker)
{
	self endon("death");
	attacker_entnum = attacker.entnum;
	missile waittill("death");
	self.incoming_missile--;
	self.incoming_missile_owner[attacker_entnum]--;
	if(self.incoming_missile_owner[attacker_entnum] == 0)
	{
		self.incoming_missile_owner[attacker_entnum] = undefined;
	}
	if(isdefined(attacker))
	{
		attacker LockedOn(self, 0);
	}
	/#
		Assert(self.incoming_missile >= 0);
	#/
}

/*
	Name: MissileTarget_isMissileIncoming
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x30C0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1377
*/
function MissileTarget_isMissileIncoming()
{
	if(!isdefined(self.incoming_missile))
	{
		return 0;
	}
	if(self.incoming_missile)
	{
		return 1;
	}
	return 0;
}

/*
	Name: MissileTarget_isOtherPlayerMissileIncoming
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x30F0
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1400
*/
function MissileTarget_isOtherPlayerMissileIncoming(attacker)
{
	if(!isdefined(self.incoming_missile_owner))
	{
		return 0;
	}
	if(self.incoming_missile_owner.size == 0)
	{
		return 0;
	}
	if(self.incoming_missile_owner.size == 1 && isdefined(self.incoming_missile_owner[attacker.entnum]))
	{
		return 0;
	}
	return 1;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: MissileTarget_HandleIncomingMissile
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x3160
	Size: 0xE0
	Parameters: 4
	Flags: None
	Line Number: 1428
*/
function MissileTarget_HandleIncomingMissile(responseFunc, endon1, endon2, allowDirectDamage)
{
	level endon("game_ended");
	self endon("death");
	if(isdefined(endon1))
	{
		self endon(endon1);
	}
	if(isdefined(endon2))
	{
		self endon(endon2);
	}
	for(;;)
	{
		self waittill("stinger_fired_at_me", missile, weapon, attacker);
		_incomingMissile(missile, attacker);
		if(isdefined(responseFunc))
		{
			[[responseFunc]](missile, attacker, weapon, endon1, endon2, allowDirectDamage);
		}
	}
}

/*
	Name: MissileTarget_ProximityDetonateIncomingMissile
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x3248
	Size: 0x50
	Parameters: 3
	Flags: None
	Line Number: 1461
*/
function MissileTarget_ProximityDetonateIncomingMissile(endon1, endon2, allowDirectDamage)
{
	MissileTarget_HandleIncomingMissile(&MissileTarget_ProximityDetonate, endon1, endon2, allowDirectDamage);
}

/*
	Name: _missileDetonate
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x32A0
	Size: 0x198
	Parameters: 6
	Flags: None
	Line Number: 1476
*/
function _missileDetonate(attacker, weapon, range, minDamage, maxDamage, allowDirectDamage)
{
	origin = self.origin;
	target = self missile_gettarget();
	self detonate();
	if(allowDirectDamage === 1 && isdefined(target) && isdefined(target.origin))
	{
		if(isdefined(target.locked_missile_min_distsq))
		{
		}
		else
		{
		}
		minDistSq = range * range;
		distSq = DistanceSquared(self.origin, target.origin);
		if(distSq < minDistSq)
		{
			target DoDamage(maxDamage, origin, attacker, self, "none", "MOD_PROJECTILE", 0, weapon);
		}
	}
	radiusdamage(origin, range, maxDamage, minDamage, attacker, "MOD_PROJECTILE_SPLASH", weapon);
}

/*
	Name: MissileTarget_ProximityDetonate
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x3440
	Size: 0x340
	Parameters: 6
	Flags: None
	Line Number: 1509
*/
function MissileTarget_ProximityDetonate(missile, attacker, weapon, endon1, endon2, allowDirectDamage)
{
	level endon("game_ended");
	missile endon("death");
	if(isdefined(endon1))
	{
		self endon(endon1);
	}
	if(isdefined(endon2))
	{
		self endon(endon2);
	}
	mindist = DistanceSquared(missile.origin, self.origin);
	lastCenter = self.origin;
	if(isdefined(Target_GetOffset(self)))
	{
	}
	else
	{
	}
	missile Missile_SetTarget(self, (0, 0, 0));
	if(isdefined(self.missileTargetMissDistance))
	{
		missedDistanceSq = self.missileTargetMissDistance * self.missileTargetMissDistance;
	}
	else
	{
		missedDistanceSq = 250000;
	}
	flareDistanceSq = 12250000;
	while(!isdefined(self))
	{
		center = lastCenter;
		continue;
		center = self.origin;
		lastCenter = center;
		curDist = DistanceSquared(missile.origin, center);
		if(curDist < flareDistanceSq && isdefined(self.numFlares) && self.numFlares > 0)
		{
			self.numFlares--;
			self thread MissileTarget_PlayFlareFx();
			self challenges::trackAssists(attacker, 0, 1);
			newTarget = self MissileTarget_DeployFlares(missile.origin, missile.angles);
			if(isdefined(Target_GetOffset(newTarget)))
			{
			}
			else
			{
			}
			missile Missile_SetTarget(newTarget, (0, 0, 0));
			missileTarget = newTarget;
			return;
		}
		if(curDist < mindist)
		{
			mindist = curDist;
		}
		if(curDist > mindist)
		{
			if(curDist > missedDistanceSq)
			{
				return;
			}
			missile thread _missileDetonate(attacker, weapon, 500, 600, 600, allowDirectDamage);
			return;
		}
		wait(0.05);
	}
}

/*
	Name: MissileTarget_PlayFlareFx
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x3788
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 1589
*/
function MissileTarget_PlayFlareFx()
{
	if(!isdefined(self))
	{
		return;
	}
	flare_fx = level.fx_flare;
	if(isdefined(self.fx_flare))
	{
		flare_fx = self.fx_flare;
	}
	if(isdefined(self.flare_ent))
	{
		PlayFXOnTag(flare_fx, self.flare_ent, "tag_origin");
	}
	else
	{
		PlayFXOnTag(flare_fx, self, "tag_origin");
	}
	if(isdefined(self.owner))
	{
		self playsoundtoplayer("veh_huey_chaff_drop_plr", self.owner);
	}
	self playsound("veh_huey_chaff_explo_npc");
}

/*
	Name: MissileTarget_DeployFlares
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x3878
	Size: 0x2C8
	Parameters: 2
	Flags: None
	Line Number: 1625
*/
function MissileTarget_DeployFlares(origin, angles)
{
	vec_toForward = AnglesToForward(self.angles);
	vec_toRight = AnglesToRight(self.angles);
	vec_toMissileForward = AnglesToForward(angles);
	delta = self.origin - origin;
	dot = VectorDot(vec_toMissileForward, vec_toRight);
	sign = 1;
	if(dot > 0)
	{
		sign = -1;
	}
	flare_dir = VectorNormalize(VectorScale(vec_toForward, -0.5) + VectorScale(vec_toRight, sign));
	velocity = VectorScale(flare_dir, randomIntRange(200, 400));
	velocity = (velocity[0], velocity[1], velocity[2] - randomIntRange(10, 100));
	flareOrigin = self.origin;
	flareOrigin = flareOrigin + VectorScale(flare_dir, randomIntRange(600, 800));
	flareOrigin = flareOrigin + VectorScale((0, 0, 1), 500);
	if(isdefined(self.flareOffset))
	{
		flareOrigin = flareOrigin + self.flareOffset;
	}
	flareObject = spawn("script_origin", flareOrigin);
	flareObject.angles = self.angles;
	flareObject SetModel("tag_origin");
	flareObject MoveGravity(velocity, 5);
	flareObject thread util::deleteAfterTime(5);
	/#
		self thread debug_tracker(flareObject);
	#/
	return flareObject;
}

/*
	Name: debug_tracker
	Namespace: heatseekingmissile
	Checksum: 0x424F4353
	Offset: 0x3B48
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 1668
*/
function debug_tracker(target)
{
	/#
		target endon("death");
		while(1)
		{
			util::debug_sphere(target.origin, 10, (1, 0, 0), 1, 1);
			wait(0.05);
		}
	#/
}

