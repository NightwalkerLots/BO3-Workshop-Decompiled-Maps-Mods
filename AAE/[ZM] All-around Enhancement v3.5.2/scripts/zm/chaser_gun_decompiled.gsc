#include scripts\codescripts\struct;
#include scripts\shared\abilities\_ability_util;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\weapons\_heatseekingmissile;

#namespace namespace_b4c89eda;

/*
	Name: __init__sytem__
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x2B0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("chaser_gun", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x2F8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function __init__()
{
	callback::on_spawned(&watch_for_replay_gun);
	callback::on_spawned(&function_1d6686ce);
	game["locking_on_sound"] = "uin_alert_lockon_start";
	game["locked_on_sound"] = "uin_alert_lockon";
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __main__
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x370
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function __main__()
{
	callback::remove_on_spawned(&heatseekingmissile::on_player_spawned);
}

/*
	Name: function_1d6686ce
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x3A0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function function_1d6686ce()
{
	self heatseekingmissile::ClearIRTarget();
	thread StingerToggleLoop();
	return;
}

/*
	Name: StingerToggleLoop
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x3D8
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function StingerToggleLoop()
{
	self notify("StingerToggleLoop");
	self endon("StingerToggleLoop");
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self waittill("weapon_change", weapon);
		while(weapon.lockonType == "Legacy Single" && GetDvarString("aaeoption_lockon") != "1")
		{
			if(self GetWeaponAmmoClip(weapon) == 0)
			{
				wait(0.05);
				weapon = self GetCurrentWeapon();
				continue;
			}
			if(!heatseekingmissile::StingerWaitForAds())
			{
				break;
			}
			self thread heatseekingmissile::StingerIRTLoop(weapon);
			while(self heatseekingmissile::PlayerStingerAds())
			{
				wait(0.05);
			}
			self notify("stinger_IRT_off");
			self heatseekingmissile::ClearIRTarget();
			weapon = self GetCurrentWeapon();
		}
	}
}

/*
	Name: function_899205db
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x558
	Size: 0x210
	Parameters: 0
	Flags: None
	Line Number: 133
*/
function function_899205db()
{
	playerTargets = level.activePlayers;
	vehicleTargets = target_getArray();
	targetsAll = GetAITeamArray();
	targetsAll = ArrayCombine(targetsAll, playerTargets, 0, 0);
	targetsAll = ArrayCombine(targetsAll, vehicleTargets, 0, 0);
	targetsValid = [];
	for(idx = 0; idx < targetsAll.size; idx++)
	{
		if(level.teambased)
		{
			if(isdefined(targetsAll[idx].team) && targetsAll[idx].team != self.team)
			{
				if(self InsideAPReticleNoLock(targetsAll[idx]))
				{
					if(self LockSightTest(targetsAll[idx]))
					{
						targetsValid[targetsValid.size] = targetsAll[idx];
						continue;
					}
				}
			}
		}
		if(self InsideAPReticleNoLock(targetsAll[idx]))
		{
			if(isdefined(targetsAll[idx].owner) && self != targetsAll[idx].owner)
			{
				if(self LockSightTest(targetsAll[idx]))
				{
					targetsValid[targetsValid.size] = targetsAll[idx];
				}
			}
		}
	}
	return targetsValid;
}

/*
	Name: function_359fe34e
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x770
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 181
*/
function function_359fe34e(ent, weapon)
{
	if(!isalive(ent))
	{
		return 0;
	}
	if(ent.team === self.team)
	{
		return 0;
	}
	if(ent.ignoreme === 1)
	{
		return 0;
	}
	return 1;
}

/*
	Name: watch_for_replay_gun
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x7E8
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 208
*/
function watch_for_replay_gun()
{
	self endon("disconnect");
	self endon("death");
	self endon("death");
	self endon("bled_out");
	self endon("spawned_player");
	self endon("killReplayGunMonitor");
	chaser = GetWeapon("micromissile_launcher");
	var_c3dda44c = GetWeapon("micromissile_launcher_upgraded");
	self.is_still_valid_target_for_stinger_override = &function_359fe34e;
	self.get_stinger_target_override = &function_899205db;
	for(;;)
	{
		self waittill("weapon_change_complete", weapon);
		self WeaponLockFree();
		if(weapon == chaser)
		{
			self thread watch_lockon(weapon, 5);
		}
		if(weapon == var_c3dda44c)
		{
			self thread watch_lockon(weapon, 10);
		}
	}
}

/*
	Name: watch_lockon
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x938
	Size: 0x5F0
	Parameters: 3
	Flags: None
	Line Number: 245
*/
function watch_lockon(weapon, var_4f9edda8, var_648ad5d2)
{
	if(!isdefined(var_4f9edda8))
	{
		var_4f9edda8 = 5;
	}
	if(!isdefined(var_648ad5d2))
	{
		var_648ad5d2 = 0;
	}
	self endon("disconnect");
	self endon("death");
	self endon("death");
	self endon("bled_out");
	self endon("spawned_player");
	self endon("weapon_change");
	lockLength = self getLockOnSpeed();
	self.multiLockList = [];
	for(;;)
	{
		wait(0.05);
		ADS = self PlayerAds() == 1;
		if(ADS || var_648ad5d2)
		{
			do
			{
				done = 1;
				foreach(target in self.multiLockList)
				{
					if(target.apLockFinalized)
					{
						if(!IsStillValidTarget(weapon, target.apTarget))
						{
							self ClearAPTarget(weapon, target);
							done = 0;
							break;
						}
					}
				}
			}
			while(!!done);
			inLockingState = 0;
			do
			{
				done = 1;
				for(i = 0; i < self.multiLockList.size; i++)
				{
					target = self.multiLockList[i];
					if(target.apLocking)
					{
						if(!IsStillValidTarget(weapon, target.apTarget))
						{
							self ClearAPTarget(weapon, target);
							done = 0;
							break;
						}
						inLockingState = 1;
						timePassed = GetTime() - target.apLockStartTime;
						if(timePassed < lockLength)
						{
							continue;
						}
						/#
							Assert(isdefined(target.apTarget));
						#/
						target.apLockFinalized = 1;
						target.apLocking = 0;
						target.apLockPending = 0;
						self WeaponLockFinalize(target.apTarget, i);
						self thread SeekerSound(weapon.lockonSeekerLockedSound, weapon.lockonSeekerLockedSoundLoops, target.apSoundId);
						target.apTarget notify("missile_lock", self, weapon);
					}
				}
			}
			while(!!done);
			if(!inLockingState)
			{
				do
				{
					done = 1;
					for(i = 0; i < self.multiLockList.size; i++)
					{
						target = self.multiLockList[i];
						if(target.apLockPending)
						{
							if(!IsStillValidTarget(weapon, target.apTarget))
							{
								self ClearAPTarget(weapon, target);
								done = 0;
								break;
							}
							target.apLockStartTime = GetTime();
							target.apLockFinalized = 0;
							target.apLockPending = 0;
							target.apLocking = 1;
							self thread SeekerSound(weapon.lockonSeekerSearchSound, weapon.lockonSeekerSearchSoundLoops, target.apSoundId);
							done = 1;
							break;
						}
					}
				}
				while(!!done);
			}
			if(self.multiLockList.size >= var_4f9edda8)
			{
			}
			bestTarget = self GetBestTarget(weapon);
			self DestroyLockOnCanceledMessage();
			self WeaponLockStart(bestTarget.apTarget, self.multiLockList.size);
			self.multiLockList[self.multiLockList.size] = bestTarget;
		}
		else
		{
			if(!isdefined(bestTarget) && self.multiLockList.size == 0)
			{
			}
			else if(isdefined(bestTarget) && self.multiLockList.size < var_4f9edda8)
			{
			}
			else
			{
				self ClearAPTarget(weapon);
			}
		}
	}
}

/*
	Name: ClearAPTarget
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0xF30
	Size: 0x260
	Parameters: 2
	Flags: None
	Line Number: 382
*/
function ClearAPTarget(weapon, whom)
{
	if(!isdefined(self.multiLockList))
	{
		self.multiLockList = [];
	}
	if(isdefined(whom))
	{
		for(i = 0; i < self.multiLockList.size; i++)
		{
			if(whom.apTarget == self.multiLockList[i].apTarget)
			{
				self.multiLockList[i].apTarget notify("missile_unlocked");
				self notify("stop_sound" + whom.apSoundId);
				self WeaponLockRemoveSlot(i);
				ArrayRemoveValue(self.multiLockList, whom, 0);
				break;
			}
		}
	}
	else
	{
		for(i = 0; i < self.multiLockList.size; i++)
		{
			self.multiLockList[i].apTarget notify("missile_unlocked");
			self notify("stop_sound" + self.multiLockList[i].apSoundId);
		}
		self.multiLockList = [];
	}
	if(self.multiLockList.size == 0)
	{
		self StopRumble("stinger_lock_rumble");
		self WeaponLockRemoveSlot(-1);
		if(isdefined(weapon))
		{
			if(isdefined(weapon.lockonSeekerSearchSound))
			{
				self StopLocalSound(weapon.lockonSeekerSearchSound);
			}
			if(isdefined(weapon.lockonSeekerLockedSound))
			{
				self StopLocalSound(weapon.lockonSeekerLockedSound);
			}
		}
		self DestroyLockOnCanceledMessage();
	}
}

/*
	Name: DestroyLockOnCanceledMessage
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x1198
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 440
*/
function DestroyLockOnCanceledMessage()
{
	return;
	continue;
}

/*
	Name: DisplayLockOnCanceledMessage
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x11A8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 456
*/
function DisplayLockOnCanceledMessage()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_a_target
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x11B8
	Size: 0x2F0
	Parameters: 1
	Flags: None
	Line Number: 472
*/
function get_a_target(weapon)
{
	origin = self GetWeaponMuzzlePoint();
	FORWARD = self GetWeaponForwardDir();
	targets = self get_potential_targets();
	if(!isdefined(targets))
	{
		return undefined;
	}
	if(!isdefined(weapon.lockOnScreenRadius) || weapon.lockOnScreenRadius < 1)
	{
		return undefined;
	}
	validTargets = [];
	should_wait = 0;
	for(i = 0; i < targets.size; i++)
	{
		if(should_wait)
		{
			wait(0.05);
			origin = self GetWeaponMuzzlePoint();
			FORWARD = self GetWeaponForwardDir();
			should_wait = 0;
		}
		testTarget = targets[i];
		if(!is_valid_target(testTarget))
		{
			continue;
		}
		testOrigin = get_target_lock_on_origin(testTarget);
		test_range = Distance(origin, testOrigin);
		if(test_range > weapon.lockOnMaxRange || test_range < weapon.lockOnMinRange)
		{
			continue;
		}
		normal = VectorNormalize(testOrigin - origin);
		dot = VectorDot(FORWARD, normal);
		if(0 > dot)
		{
			continue;
		}
		if(!self inside_screen_crosshair_radius(testOrigin, weapon))
		{
			continue;
		}
		cansee = self can_see_projected_crosshair(testTarget, testOrigin, origin, FORWARD, test_range);
		should_wait = 1;
		if(cansee)
		{
			validTargets[validTargets.size] = testTarget;
		}
	}
	return pick_a_target_from(validTargets);
}

/*
	Name: get_potential_targets
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x14B0
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 537
*/
function get_potential_targets()
{
	potentialTargets = [];
	aiTargets = GetAITeamArray("axis");
	if(aiTargets.size > 0)
	{
		potentialTargets = ArrayCombine(potentialTargets, aiTargets, 1, 0);
	}
	playerTargets = self GetEnemies();
	if(playerTargets.size > 0)
	{
		potentialTargets = ArrayCombine(potentialTargets, playerTargets, 1, 0);
	}
	if(potentialTargets.size == 0)
	{
		return undefined;
	}
	return potentialTargets;
}

/*
	Name: pick_a_target_from
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x1588
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 567
*/
function pick_a_target_from(targets)
{
	if(!isdefined(targets))
	{
		return undefined;
	}
	bestTarget = undefined;
	bestTargetDistanceSquared = undefined;
	for(i = 0; i < targets.size; i++)
	{
		target = targets[i];
		if(is_valid_target(target))
		{
			targetDistanceSquared = DistanceSquared(self.origin, target.origin);
			if(!isdefined(bestTarget) || !isdefined(bestTargetDistanceSquared))
			{
				bestTarget = target;
				bestTargetDistanceSquared = targetDistanceSquared;
				continue;
			}
			if(targetDistanceSquared < bestTargetDistanceSquared)
			{
				bestTarget = target;
				bestTargetDistanceSquared = targetDistanceSquared;
			}
		}
	}
	return bestTarget;
}

/*
	Name: trace
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x16B0
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 607
*/
function trace(from, to)
{
	return bullettrace(from, to, 0, self)["position"];
}

/*
	Name: can_see_projected_crosshair
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x16F8
	Size: 0xF0
	Parameters: 5
	Flags: None
	Line Number: 622
*/
function can_see_projected_crosshair(target, target_origin, player_origin, player_forward, Distance)
{
	crosshair = player_origin + player_forward * Distance;
	collided = target trace(target_origin, crosshair);
	if(Distance2DSquared(crosshair, collided) > 9)
	{
		return 0;
	}
	collided = self trace(player_origin, crosshair);
	if(Distance2DSquared(crosshair, collided) > 9)
	{
		return 0;
	}
	return 1;
}

/*
	Name: is_valid_target
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x17F0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 648
*/
function is_valid_target(ent)
{
	return isdefined(ent) && isalive(ent);
}

/*
	Name: inside_screen_crosshair_radius
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x1828
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 663
*/
function inside_screen_crosshair_radius(testOrigin, weapon)
{
	radius = weapon.lockOnScreenRadius;
	return self inside_screen_radius(testOrigin, radius);
}

/*
	Name: inside_screen_lockon_radius
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x1880
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 679
*/
function inside_screen_lockon_radius(targetOrigin)
{
	radius = self getLockOnRadius();
	return self inside_screen_radius(targetOrigin, radius);
	ERROR: Exception occured: Stack empty.
}

/*
	Name: inside_screen_radius
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x18D8
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 696
*/
function inside_screen_radius(targetOrigin, radius)
{
	return Target_OriginIsInCircle(targetOrigin, self, 65, radius);
}

/*
	Name: get_target_lock_on_origin
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x1920
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 711
*/
function get_target_lock_on_origin(target)
{
	return self GetReplayGunLockOnOrigin(target);
}

/*
	Name: GetBestTarget
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x1950
	Size: 0x540
	Parameters: 1
	Flags: None
	Line Number: 726
*/
function GetBestTarget(weapon)
{
	playerTargets = GetPlayers();
	vehicleTargets = target_getArray();
	targetsAll = GetAITeamArray();
	targetsAll = ArrayCombine(targetsAll, playerTargets, 0, 0);
	targetsAll = ArrayCombine(targetsAll, vehicleTargets, 0, 0);
	targetsValid = [];
	for(idx = 0; idx < targetsAll.size; idx++)
	{
		if(level.teambased)
		{
			if(isdefined(targetsAll[idx].team) && targetsAll[idx].team != self.team)
			{
				if(self InsideAPReticleNoLock(targetsAll[idx]))
				{
					if(self LockSightTest(targetsAll[idx]))
					{
						targetsValid[targetsValid.size] = targetsAll[idx];
						continue;
					}
				}
			}
		}
		if(self InsideAPReticleNoLock(targetsAll[idx]))
		{
			if(isdefined(targetsAll[idx].owner) && self != targetsAll[idx].owner)
			{
				if(self LockSightTest(targetsAll[idx]))
				{
					targetsValid[targetsValid.size] = targetsAll[idx];
				}
			}
		}
	}
	if(targetsValid.size == 0)
	{
		return undefined;
	}
	playerForward = AnglesToForward(self getPlayerAngles());
	dots = [];
	for(i = 0; i < targetsValid.size; i++)
	{
		newItem = spawnstruct();
		newItem.index = i;
		newItem.dot = VectorDot(playerForward, VectorNormalize(targetsValid[i].origin - self.origin));
		Array::insertion_sort(dots, &TargetInsertionSortCompare, newItem);
	}
	index = 0;
	foreach(dot in dots)
	{
		found = 0;
		foreach(Lock in self.multiLockList)
		{
			if(Lock.apTarget == targetsValid[dot.index])
			{
				found = 1;
			}
		}
		if(found)
		{
			continue;
		}
		newentry = spawnstruct();
		newentry.apTarget = targetsValid[dot.index];
		newentry.apLockStartTime = GetTime();
		newentry.apLockPending = 1;
		newentry.apLocking = 0;
		newentry.apLockFinalized = 0;
		newentry.apLostSightlineTime = 0;
		newentry.apSoundId = RandomInt(2147483647);
		return newentry;
	}
	return undefined;
}

/*
	Name: TargetInsertionSortCompare
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x1E98
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 812
*/
function TargetInsertionSortCompare(a, b)
{
	if(a.dot < b.dot)
	{
		return -1;
	}
	if(a.dot > b.dot)
	{
		return 1;
	}
	return 0;
}

/*
	Name: InsideAPReticleNoLock
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x1F00
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 835
*/
function InsideAPReticleNoLock(target)
{
	radius = self getLockOnRadius();
	return Target_IsInCircle(target, self, 65, radius);
	.var_60707e62 = undefined;
}

/*
	Name: InsideAPReticleLocked
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x1F60
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 852
*/
function InsideAPReticleLocked(target)
{
	radius = self getLockOnLossRadius();
	if(self GetCurrentWeapon() == GetWeapon("micromissile_launcher_upgraded"))
	{
		radius = 100000;
	}
	return Target_IsInCircle(target, self, 65, radius);
	ERROR: Bad function call
}

/*
	Name: IsStillValidTarget
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x1FF8
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 873
*/
function IsStillValidTarget(weapon, ent)
{
	if(!isdefined(ent))
	{
		return 0;
	}
	if(!InsideAPReticleLocked(ent))
	{
		return 0;
	}
	if(!isalive(ent))
	{
		return 0;
	}
	if(!LockSightTest(ent))
	{
		return 0;
	}
	return 1;
}

/*
	Name: SeekerSound
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x2088
	Size: 0x108
	Parameters: 3
	Flags: None
	Line Number: 904
*/
function SeekerSound(alias, looping, id)
{
	self notify("stop_sound" + id);
	self endon("bled_out");
	self endon("stop_sound" + id);
	self endon("disconnect");
	self endon("death");
	self endon("death");
	if(isdefined(alias))
	{
		self PlayRumbleOnEntity("stinger_lock_rumble");
		time = soundgetplaybacktime(alias) * 0.001;
		do
		{
			self playlocalsound(alias);
			wait(time);
		}
		while(!looping);
		self StopRumble("stinger_lock_rumble");
	}
}

/*
	Name: LockSightTest
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x2198
	Size: 0x180
	Parameters: 1
	Flags: None
	Line Number: 936
*/
function LockSightTest(target)
{
	eyePos = self GetEye();
	if(!isdefined(target))
	{
		return 0;
	}
	if(!isalive(target))
	{
		return 0;
	}
	pos = target GetShootAtPos();
	if(isdefined(pos))
	{
		passed = BulletTracePassed(eyePos, pos, 0, target, undefined, 1, 1);
		if(passed)
		{
			return 1;
		}
	}
	pos = target GetCentroid();
	if(isdefined(pos))
	{
		passed = BulletTracePassed(eyePos, pos, 0, target, undefined, 1, 1);
		if(passed)
		{
			return 1;
		}
	}
	pos = target.origin;
	passed = BulletTracePassed(eyePos, pos, 0, target, undefined, 1, 1);
	if(passed)
	{
		return 1;
	}
	return 0;
}

