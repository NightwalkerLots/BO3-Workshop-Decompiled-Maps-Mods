#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\challenges_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\weapons\_weaponobjects;
#include scripts\zm\_zm;
#include scripts\zm\_zm_elemental_zombies;

#namespace namespace_3df25fcf;

/*
	Name: __init__sytem__
	Namespace: namespace_3df25fcf
	Checksum: 0xDCE0E126
	Offset: 0x460
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("electroball_grenade", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_3df25fcf
	Checksum: 0x57A49DA9
	Offset: 0x4A0
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 41
*/
function __init__()
{
	level.proximityGrenadeDetectionRadius = GetDvarInt("scr_proximityGrenadeDetectionRadius", 180);
	level.proximityGrenadeGracePeriod = GetDvarFloat("scr_proximityGrenadeGracePeriod", 0.05);
	level.proximityGrenadeDOTDamageAmount = GetDvarInt("scr_proximityGrenadeDOTDamageAmount", 1);
	level.proximityGrenadeDOTDamageAmountHardcore = GetDvarInt("scr_proximityGrenadeDOTDamageAmountHardcore", 1);
	level.proximityGrenadeDOTDamageTime = GetDvarFloat("scr_proximityGrenadeDOTDamageTime", 0.2);
	level.proximityGrenadeDOTDamageInstances = GetDvarInt("scr_proximityGrenadeDOTDamageInstances", 4);
	level.proximityGrenadeActivationTime = GetDvarFloat("scr_proximityGrenadeActivationTime", 0.1);
	level.proximityGrenadeProtectedTime = GetDvarFloat("scr_proximityGrenadeProtectedTime", 0.45);
	level thread register();
	if(!isdefined(level.spawnProtectionTimeMS))
	{
		level.spawnProtectionTimeMS = 0;
	}
	callback::on_spawned(&on_player_spawned);
	callback::on_ai_spawned(&on_ai_spawned);
	zm::register_actor_damage_callback(&function_794a1b98);
}

/*
	Name: register
	Namespace: namespace_3df25fcf
	Checksum: 0xDF1A7BBF
	Offset: 0x680
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function register()
{
	clientfield::register("toplayer", "tazered", 1, 1, "int");
	clientfield::register("actor", "electroball_make_sparky", 1, 1, "int");
	clientfield::register("missile", "electroball_stop_trail", 1, 1, "int");
	clientfield::register("missile", "electroball_play_landed_fx", 1, 1, "int");
	clientfield::register("allplayers", "electroball_shock", 1, 1, "int");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_aec06193
	Namespace: namespace_3df25fcf
	Checksum: 0xE6A9C64
	Offset: 0x780
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function function_aec06193()
{
	if(isPlayer(self))
	{
		watcher = self weaponobjects::createProximityWeaponObjectWatcher("electroball_grenade", self.team);
		continue;
	}
	watcher = self weaponobjects::createProximityWeaponObjectWatcher("electroball_grenade", level.zombie_team);
	watcher.watchForFire = 1;
	watcher.hackable = 0;
	watcher.hackerToolRadius = level.equipmentHackerToolRadius;
	watcher.hackerToolTimeMs = level.equipmentHackerToolTimeMs;
	watcher.headicon = 0;
	watcher.activateFx = 1;
	watcher.ownerGetsAssist = 1;
	watcher.ignoreDirection = 1;
	watcher.immediateDetonation = 1;
	watcher.detectionGracePeriod = 0.05;
	watcher.detonateRadius = 64;
	watcher.onStun = &weaponobjects::weaponStun;
	watcher.stunTime = 1;
	watcher.onDetonateCallback = &proximityDetonate;
	watcher.activationDelay = 0.05;
	watcher.activateSound = "wpn_claymore_alert";
	watcher.immunespecialty = "specialty_immunetriggershock";
	watcher.onSpawn = &function_bacede77;
}

/*
	Name: function_bacede77
	Namespace: namespace_3df25fcf
	Checksum: 0xF7F69C5F
	Offset: 0x980
	Size: 0xF8
	Parameters: 2
	Flags: None
	Line Number: 130
*/
function function_bacede77(watcher, owner)
{
	self thread setupKillCamEnt();
	if(isPlayer(owner))
	{
		owner addweaponstat(self.weapon, "used", 1);
	}
	if(isdefined(self.weapon) && self.weapon.proximityDetonation > 0)
	{
		watcher.detonateRadius = self.weapon.proximityDetonation;
	}
	weaponobjects::onSpawnProximityWeaponObject(watcher, owner);
	self thread function_fd03d994();
	self thread function_373612b1();
}

/*
	Name: setupKillCamEnt
	Namespace: namespace_3df25fcf
	Checksum: 0x3EE8BA7F
	Offset: 0xA80
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 156
*/
function setupKillCamEnt()
{
	self endon("death");
	self util::waitTillNotMoving();
	self.killCamEnt = spawn("script_model", self.origin + VectorScale((0, 0, 1), 8));
	self thread cleanupKillCamEntOnDeath();
}

/*
	Name: cleanupKillCamEntOnDeath
	Namespace: namespace_3df25fcf
	Checksum: 0x3F9E2408
	Offset: 0xB00
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 174
*/
function cleanupKillCamEntOnDeath()
{
	self waittill("death");
	self.killCamEnt util::deleteAfterTime(4 + level.proximityGrenadeDOTDamageTime * level.proximityGrenadeDOTDamageInstances);
}

/*
	Name: proximityDetonate
	Namespace: namespace_3df25fcf
	Checksum: 0xC7C7F707
	Offset: 0xB50
	Size: 0x38
	Parameters: 3
	Flags: None
	Line Number: 190
*/
function proximityDetonate(attacker, weapon, target)
{
	weaponobjects::weaponDetonate(attacker, weapon);
}

/*
	Name: watchProximityGrenadeHitPlayer
	Namespace: namespace_3df25fcf
	Checksum: 0xB8931637
	Offset: 0xB90
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 205
*/
function watchProximityGrenadeHitPlayer(owner)
{
	self endon("death");
	self SetTeam(owner.team);
	while(1)
	{
		self waittill("grenade_bounce", pos, normal, ent, surface);
		if(isdefined(ent) && isPlayer(ent) && surface != "riotshield")
		{
			if(level.teambased && ent.team == self.owner.team)
			{
				continue;
			}
			self proximityDetonate(self.owner, self.weapon);
			return;
		}
	}
}

/*
	Name: performHudEffects
	Namespace: namespace_3df25fcf
	Checksum: 0xDA1E5AB6
	Offset: 0xCB0
	Size: 0x140
	Parameters: 2
	Flags: None
	Line Number: 234
*/
function performHudEffects(position, distanceToGrenade)
{
	forwardVec = VectorNormalize(AnglesToForward(self.angles));
	rightVec = VectorNormalize(AnglesToRight(self.angles));
	explosionVec = VectorNormalize(position - self.origin);
	fDot = VectorDot(explosionVec, forwardVec);
	rDot = VectorDot(explosionVec, rightVec);
	fAngle = ACos(fDot);
	rAngle = ACos(rDot);
}

/*
	Name: function_f5b08d03
	Namespace: namespace_3df25fcf
	Checksum: 0x16771204
	Offset: 0xDF8
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 255
*/
function function_f5b08d03()
{
	self endon("death");
	self endon("disconnect");
	while(1)
	{
		self waittill("damage", damage, eAttacker, dir, point, type, model, tag, part, weapon, flags);
		if(weapon.name == "electroball_grenade")
		{
			self damagePlayerInRadius(eAttacker);
		}
		wait(0.05);
	}
}

/*
	Name: damagePlayerInRadius
	Namespace: namespace_3df25fcf
	Checksum: 0x54A62BF2
	Offset: 0xEE8
	Size: 0x1F0
	Parameters: 1
	Flags: None
	Line Number: 280
*/
function damagePlayerInRadius(eAttacker)
{
	self notify("proximityGrenadeDamageStart");
	self endon("proximityGrenadeDamageStart");
	self endon("disconnect");
	self endon("death");
	eAttacker endon("disconnect");
	self clientfield::set("electroball_shock", 1);
	g_time = GetTime();
	if(self util::mayApplyScreenEffect())
	{
		self.lastShockedBy = eAttacker;
		self.shockEndTime = GetTime() + 100;
		self shellshock("electrocution", 0.1);
		self clientfield::set_to_player("tazered", 1);
	}
	self PlayRumbleOnEntity("proximity_grenade");
	self playsound("wpn_taser_mine_zap");
	if(!self hasPerk("specialty_proximityprotection"))
	{
		self thread watch_death();
		self util::show_hud(0);
		if(GetTime() - g_time < 100)
		{
			wait(GetTime() - g_time / 1000);
		}
		self util::show_hud(1);
		continue;
	}
	wait(level.proximityGrenadeProtectedTime);
	self clientfield::set_to_player("tazered", 0);
}

/*
	Name: proximityDeathWait
	Namespace: namespace_3df25fcf
	Checksum: 0x5885195
	Offset: 0x10E0
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 323
*/
function proximityDeathWait(owner)
{
	self waittill("death");
	self notify("deleteSound");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: deleteEntOnOwnerDeath
	Namespace: namespace_3df25fcf
	Checksum: 0xFF17819
	Offset: 0x1110
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 341
*/
function deleteEntOnOwnerDeath(owner)
{
	self thread deleteEntOnTimeout();
	self thread deleteEntAfterTime();
	self endon("delete");
	owner waittill("death");
	self notify("deleteSound");
	return;
	++;
}

/*
	Name: deleteEntAfterTime
	Namespace: namespace_3df25fcf
	Checksum: 0xC475212B
	Offset: 0x1180
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 362
*/
function deleteEntAfterTime()
{
	self endon("delete");
	wait(10);
	self notify("deleteSound");
}

/*
	Name: deleteEntOnTimeout
	Namespace: namespace_3df25fcf
	Checksum: 0x4228B7E3
	Offset: 0x11B0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 379
*/
function deleteEntOnTimeout()
{
	self endon("delete");
	self waittill("deleteSound");
	self delete();
}

/*
	Name: watch_death
	Namespace: namespace_3df25fcf
	Checksum: 0xCF75E4EF
	Offset: 0x11F0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 396
*/
function watch_death()
{
	self endon("disconnect");
	self notify("proximity_cleanup");
	self endon("proximity_cleanup");
	self waittill("death");
	self StopRumble("proximity_grenade");
	self setblur(0, 0);
	self util::show_hud(1);
	self clientfield::set_to_player("tazered", 0);
	return;
}

/*
	Name: on_player_spawned
	Namespace: namespace_3df25fcf
	Checksum: 0xB56B64CF
	Offset: 0x12A0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 419
*/
function on_player_spawned()
{
	if(isPlayer(self))
	{
		self thread function_aec06193();
		self thread begin_other_grenade_tracking();
		self thread function_f5b08d03();
		return;
	}
}

/*
	Name: on_ai_spawned
	Namespace: namespace_3df25fcf
	Checksum: 0xF1931475
	Offset: 0x1310
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 440
*/
function on_ai_spawned()
{
	if(self.archetype === "mechz")
	{
		self thread function_aec06193();
		self thread begin_other_grenade_tracking();
	}
}

/*
	Name: begin_other_grenade_tracking
	Namespace: namespace_3df25fcf
	Checksum: 0x84F3A864
	Offset: 0x1360
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 459
*/
function begin_other_grenade_tracking()
{
	self endon("death");
	self endon("disconnect");
	self notify("proximityTrackingStart");
	self endon("proximityTrackingStart");
	for(;;)
	{
		self waittill("grenade_fire", grenade, weapon, cookTime);
		if(weapon.rootweapon.name == "electroball_grenade")
		{
			grenade thread watchProximityGrenadeHitPlayer(self);
		}
	}
}

/*
	Name: function_fd03d994
	Namespace: namespace_3df25fcf
	Checksum: 0x5AB92F61
	Offset: 0x1410
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 485
*/
function function_fd03d994()
{
	self endon("death");
	self endon("disconnect");
	self endon("delete");
	self waittill("grenade_bounce");
	while(1)
	{
		var_5e26875b = namespace_57695b4d::function_a70f4ed5();
		var_5e26875b = ArraySortClosest(var_5e26875b, self.origin);
		var_9243375 = namespace_57695b4d::function_401b5e12("sparky");
		if(!isdefined(level.var_56b1466b) || var_9243375 < level.var_56b1466b)
		{
			if(!isdefined(level.var_c29f95c3) || GetTime() - level.var_c29f95c3 >= 0.5)
			{
				foreach(ai_zombie in var_5e26875b)
				{
					dist_sq = DistanceSquared(self.origin, ai_zombie.origin);
					if(dist_sq <= 9216 && ai_zombie.is_elemental_zombie !== 1 && ai_zombie.var_b549d940 !== 1)
					{
						ai_zombie clientfield::set("electroball_make_sparky", 1);
						ai_zombie namespace_57695b4d::function_1b1bb1b();
						level.var_c29f95c3 = GetTime();
						break;
					}
				}
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_373612b1
	Namespace: namespace_3df25fcf
	Checksum: 0xA7269DC7
	Offset: 0x1630
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 527
*/
function function_373612b1()
{
	self endon("death");
	self endon("disconnect");
	self endon("delete");
	self waittill("grenade_bounce");
	self clientfield::set("electroball_stop_trail", 1);
	self SetModel("tag_origin");
	self clientfield::set("electroball_play_landed_fx", 1);
	if(!isdefined(level.a_electroball_grenades))
	{
		level.a_electroball_grenades = [];
	}
	Array::add(level.a_electroball_grenades, self);
}

/*
	Name: function_794a1b98
	Namespace: namespace_3df25fcf
	Checksum: 0x8131C24D
	Offset: 0x1700
	Size: 0xD0
	Parameters: 12
	Flags: None
	Line Number: 553
*/
function function_794a1b98(inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(isdefined(weapon) && weapon.rootweapon.name === "electroball_grenade")
	{
		if(isdefined(attacker) && self.team === attacker.team)
		{
			return 0;
		}
		if(self.var_b549d940 === 1)
		{
			return 0;
		}
	}
	return -1;
}

