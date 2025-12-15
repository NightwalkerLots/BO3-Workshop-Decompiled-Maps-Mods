#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\challenges_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\entityheadicons_shared;
#include scripts\shared\killcam_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\weapons\_weaponobjects;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_weapons;

#namespace satchel_charge;

/*
	Name: init_shared
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x748
	Size: 0x50
	Parameters: 0
	Flags: AutoExec
	Line Number: 30
*/
function autoexec init_shared()
{
	if(GetDvarString("aae_lite") == "")
	{
		callback::add_weapon_watcher(&createSatchelWatcher);
		return;
	}
}

/*
	Name: createSatchelWatcher
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x7A0
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function createSatchelWatcher()
{
	watcher = self weaponobjects::createUseWeaponObjectWatcher("nukebomb", self.team);
	watcher.altDetonate = 1;
	watcher.watchForFire = 1;
	watcher.hackable = 1;
	watcher.hackerToolRadius = level.equipmentHackerToolRadius;
	watcher.hackerToolTimeMs = level.equipmentHackerToolTimeMs;
	watcher.headicon = 0;
	watcher.onDetonateCallback = &satchelDetonate;
	watcher.onSpawn = &satchelSpawn;
	watcher.onStun = &weaponobjects::weaponStun;
	watcher.stunTime = 1;
	watcher.altweapon = GetWeapon("satchel_charge_detonator");
	watcher.ownerGetsAssist = 1;
	watcher.detonateStationary = 1;
	watcher.detonationDelay = 0;
	watcher.detonationSound = "wpn_claymore_alert";
	watcher.proximityAlarmActivateSound = "uin_c4_enemy_detection_alert";
	watcher.immunespecialty = "specialty_immunetriggerc4";
	watcher.pickup = &function_86107b55;
}

/*
	Name: satchelDetonate
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x968
	Size: 0x180
	Parameters: 3
	Flags: None
	Line Number: 82
*/
function satchelDetonate(attacker, weapon, target)
{
	if(isdefined(weapon) && weapon.isValid)
	{
		if(isdefined(attacker))
		{
			if(self.owner util::IsEnemyPlayer(attacker))
			{
				attacker challenges::destroyedExplosive(weapon);
				scoreevents::processScoreEvent("destroyed_c4", attacker, self.owner, weapon);
			}
		}
	}
	weaponobjects::weaponDetonate(attacker, weapon);
	if(GetDvarInt("aaeoption_c4ending") && self.owner.score >= 150000 && zm::get_round_number() >= 35)
	{
		thread zm_powerup_nuke::grab_nuke(self.owner.owner);
		self.owner.score = self.owner.score - 150000;
		level.custom_game_over_hud_elem = &function_e2f48bbe;
		level notify("end_game");
	}
}

/*
	Name: function_e2f48bbe
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0xAF0
	Size: 0x2D8
	Parameters: 3
	Flags: None
	Line Number: 115
*/
function function_e2f48bbe(player, game_over, survived)
{
	game_over.alignX = "center";
	game_over.alignY = "middle";
	game_over.horzAlign = "center";
	game_over.vertAlign = "middle";
	game_over.y = game_over.y - 130;
	game_over.foreground = 1;
	game_over.fontscale = 3;
	game_over.alpha = 0;
	game_over.color = (1, 1, 1);
	game_over.hidewheninmenu = 1;
	game_over setText("^1K ^2A ^3B ^4O ^5O ^6M");
	game_over fadeOverTime(1);
	game_over.alpha = 1;
	if(player IsSplitscreen())
	{
		game_over.fontscale = 2;
		game_over.y = game_over.y + 40;
	}
	survived.alignX = "center";
	survived.alignY = "middle";
	survived.horzAlign = "center";
	survived.vertAlign = "middle";
	survived.y = survived.y - 100;
	survived.foreground = 1;
	survived.fontscale = 2;
	survived.alpha = 0;
	survived.color = (1, 1, 1);
	survived.hidewheninmenu = 1;
	if(player IsSplitscreen())
	{
		survived.fontscale = 1.5;
		survived.y = survived.y + 40;
	}
	survived fadeOverTime(1);
	survived.alpha = 1;
}

/*
	Name: function_62e1cbb9
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0xDD0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 164
*/
function function_62e1cbb9()
{
	result = 1;
	if(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver") && GetDvarString("tfoption_c4nuke") == "1")
	{
		result = 0;
	}
	return result;
}

/*
	Name: satchelSpawn
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0xE80
	Size: 0x118
	Parameters: 2
	Flags: None
	Line Number: 184
*/
function satchelSpawn(watcher, owner)
{
	self endon("death");
	self thread weaponobjects::onSpawnUseWeaponObject(watcher, owner);
	if(!(isdefined(self.previouslyHacked) && self.previouslyHacked))
	{
		if(isdefined(owner))
		{
			owner addweaponstat(self.weapon, "used", 1);
		}
		self PlayLoopSound("uin_c4_air_alarm_loop");
		self util::waittill_notify_or_timeout("stationary", 10);
		delayTimeSec = self.weapon.proximityalarmactivationdelay / 1000;
		if(delayTimeSec > 0)
		{
			wait(delayTimeSec);
		}
		self StopLoopSound(0.1);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: on_spawn_retrieve_trigger
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0xFA0
	Size: 0x60
	Parameters: 2
	Flags: Private
	Line Number: 217
*/
function private on_spawn_retrieve_trigger(watcher, player)
{
	self weaponobjects::onSpawnRetrievableWeaponObject(watcher, player);
	if(isdefined(self.pickupTrigger))
	{
		self.pickupTrigger SetHintLowPriority(0);
	}
}

/*
	Name: adjust_trigger_origin
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x1008
	Size: 0x28
	Parameters: 1
	Flags: Private
	Line Number: 236
*/
function private adjust_trigger_origin(origin)
{
	origin = origin + VectorScale((0, 0, 1), 20);
	return origin;
}

/*
	Name: function_86107b55
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x1038
	Size: 0x100
	Parameters: 0
	Flags: Private
	Line Number: 252
*/
function private function_86107b55()
{
	player = self.owner;
	wpn_type = self.weapon;
	if(!player hasweapon(wpn_type))
	{
		player zm_weapons::weapon_give(wpn_type, undefined, undefined, 1, undefined);
		self delete();
	}
	else
	{
		clip_ammo = player GetWeaponAmmoClip(wpn_type);
		var_84a38f6c = clip_ammo + 1;
		player SetWeaponAmmoClip(wpn_type, var_84a38f6c);
		self delete();
	}
}

/*
	Name: function_7af9197f
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x1140
	Size: 0x58
	Parameters: 2
	Flags: Private
	Line Number: 280
*/
function private function_7af9197f(trigger, player)
{
	self thread function_4b1101d7(trigger, player);
	self thread function_18e7de52(trigger, player);
}

/*
	Name: function_4b1101d7
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x11A0
	Size: 0x78
	Parameters: 2
	Flags: Private
	Line Number: 296
*/
function private function_4b1101d7(trigger, player)
{
	self endon("delete");
	self endon("death");
	while(1)
	{
		if(!isdefined(trigger))
		{
			return;
		}
		trigger TriggerEnable(1);
		trigger LinkTo(self);
	}
}

/*
	Name: function_18e7de52
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x1220
	Size: 0x70
	Parameters: 2
	Flags: Private
	Line Number: 321
*/
function private function_18e7de52(trigger, player)
{
	self endon("delete");
	self endon("death");
	while(1)
	{
		if(!isdefined(trigger))
		{
			return;
		}
		trigger Unlink();
		trigger TriggerEnable(0);
	}
}

/*
	Name: player_exit_level
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x1298
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 346
*/
function player_exit_level()
{
	self AllowStand(1);
	self AllowCrouch(0);
	self allowprone(0);
}

/*
	Name: function_968297db
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x12F0
	Size: 0xD8
	Parameters: 0
	Flags: AutoExec
	Line Number: 363
*/
function autoexec function_968297db()
{
	if(GetDvarString("aae_lite") == "")
	{
		level.incendiaryfireDamage = 50;
		level.incendiaryfireDamageHardcore = 50;
		level.incendiaryfireDuration = GetDvarInt("scr_incendiaryfireDuration", 5);
		level.incendiaryfxDuration = 5;
		level.incendiaryDamageRadius = GetDvarInt("scr_incendiaryDamageRadius", 125);
		level.incendiaryfireDamageTickTime = 0.3;
		level.incendiaryDamageThisTick = [];
		callback::on_spawned(&create_incendiary_watcher);
		return;
	}
}

/*
	Name: create_incendiary_watcher
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x13D0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 389
*/
function create_incendiary_watcher()
{
	watcher = self weaponobjects::createUseWeaponObjectWatcher("incendiary_grenade2", self.team);
	watcher.onSpawn = &incendiary_system_spawn;
}

/*
	Name: incendiary_system_spawn
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x1428
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 405
*/
function incendiary_system_spawn(watcher, player)
{
	player endon("death");
	player endon("disconnect");
	level endon("game_ended");
	player addweaponstat(self.weapon, "used", 1);
	thread watchForExplode(player);
}

/*
	Name: watchForExplode
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x14A8
	Size: 0x158
	Parameters: 1
	Flags: None
	Line Number: 424
*/
function watchForExplode(owner)
{
	self endon("hacked");
	self endon("delete");
	killCamEnt = spawn("script_model", self.origin);
	killCamEnt util::deleteAfterTime(15);
	killCamEnt.startTime = GetTime();
	killCamEnt LinkTo(self);
	killCamEnt setWeapon(self.weapon);
	killCamEnt killcam::store_killcam_entity_on_entity(self);
	self waittill("projectile_impact_explode", origin, normal, surface);
	killCamEnt Unlink();
	playsoundatposition("wpn_incendiary_core_start", self.origin);
	generateLocations(origin, owner, normal, killCamEnt);
}

/*
	Name: getstepoutdistance
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x1608
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 450
*/
function getstepoutdistance(normal)
{
	if(normal[2] < 0.5)
	{
		stepoutdistance = normal * GetDvarInt("scr_incendiary_stepout_wall", 50);
	}
	else
	{
		stepoutdistance = normal * GetDvarInt("scr_incendiary_stepout_ground", 12);
	}
	return stepoutdistance;
}

/*
	Name: generateLocations
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x1690
	Size: 0x2B0
	Parameters: 4
	Flags: None
	Line Number: 473
*/
function generateLocations(position, owner, normal, killCamEnt)
{
	startpos = position + getstepoutdistance(normal);
	desiredEndPos = startpos + VectorScale((0, 0, 1), 60);
	physTrace = PhysicsTrace(startpos, desiredEndPos, VectorScale((-1, -1, -1), 4), VectorScale((1, 1, 1), 4), self, 1);
	if(physTrace["fraction"] < 1)
	{
	}
	else
	{
	}
	goalpos = desiredEndPos;
	killCamEnt moveto(goalpos, 0.5);
	rotation = RandomInt(360);
	if(normal[2] < 0.1)
	{
		black = VectorScale((1, 1, 1), 0.1);
		trace = hitPos(startpos, startpos + normal * -1 * 70 + (0, 0, -1) * 70, black);
		tracePosition = trace["position"];
		incendiaryGrenade = GetWeapon("incendiary_fire");
		if(trace["fraction"] < 0.9)
		{
			wallnormal = trace["normal"];
			SpawnTimedFX(incendiaryGrenade, trace["position"], wallnormal, level.incendiaryfireDuration, self.team);
		}
	}
	fxCount = GetDvarInt("scr_incendiary_fx_count", 6);
	spawnAllLocs(owner, startpos, normal, 1, rotation, killCamEnt, fxCount);
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: getLocationForFX
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x1948
	Size: 0xB8
	Parameters: 5
	Flags: None
	Line Number: 516
*/
function getLocationForFX(startpos, fxIndex, fxCount, defaultDistance, rotation)
{
	currentAngle = 360 / fxCount * fxIndex;
	cosCurrent = cos(currentAngle + rotation);
	sinCurrent = sin(currentAngle + rotation);
	return startpos + (defaultDistance * cosCurrent, defaultDistance * sinCurrent, 0);
}

/*
	Name: spawnAllLocs
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x1A08
	Size: 0x528
	Parameters: 7
	Flags: None
	Line Number: 534
*/
function spawnAllLocs(owner, startpos, normal, multiplier, rotation, killCamEnt, fxCount)
{
	defaultDistance = GetDvarInt("scr_incendiary_trace_distance", 220) * multiplier;
	defaultDropDistance = GetDvarInt("scr_incendiary_trace_down_distance", 90);
	colorArray = [];
	colorArray[colorArray.size] = (0.9, 0.2, 0.2);
	colorArray[colorArray.size] = (0.2, 0.9, 0.2);
	colorArray[colorArray.size] = (0.2, 0.2, 0.9);
	colorArray[colorArray.size] = VectorScale((1, 1, 1), 0.9);
	locations = [];
	locations["color"] = [];
	locations["loc"] = [];
	locations["tracePos"] = [];
	locations["distSqrd"] = [];
	locations["fxtoplay"] = [];
	locations["radius"] = [];
	for(fxIndex = 0; fxIndex < fxCount; fxIndex++)
	{
		locations["point"][fxIndex] = getLocationForFX(startpos, fxIndex, fxCount, defaultDistance, rotation);
		locations["color"][fxIndex] = colorArray[fxIndex % colorArray.size];
	}
	for(count = 0; count < fxCount; count++)
	{
		trace = hitPos(startpos, locations["point"][count], locations["color"][count]);
		tracePosition = trace["position"];
		locations["tracePos"][count] = tracePosition;
		if(trace["fraction"] < 0.7)
		{
			locations["loc"][count] = tracePosition;
			locations["normal"][count] = trace["normal"];
			continue;
		}
		average = startpos / 2 + tracePosition / 2;
		trace = hitPos(average, average - (0, 0, defaultDropDistance), locations["color"][count]);
		if(trace["fraction"] != 1)
		{
			locations["loc"][count] = trace["position"];
			locations["normal"][count] = trace["normal"];
		}
	}
	incendiaryGrenade = GetWeapon("incendiary_fire");
	SpawnTimedFX(incendiaryGrenade, startpos, normal, level.incendiaryfireDuration, self.team);
	level.incendiaryDamageRadius = GetDvarInt("scr_incendiaryDamageRadius", level.incendiaryDamageRadius);
	thread damageEffectArea(owner, startpos, level.incendiaryDamageRadius, level.incendiaryDamageRadius, killCamEnt);
	for(count = 0; count < locations["point"].size; count++)
	{
		if(isdefined(locations["loc"][count]))
		{
			normal = locations["normal"][count];
			SpawnTimedFX(incendiaryGrenade, locations["loc"][count], normal, level.incendiaryfireDuration, self.team);
		}
	}
}

/*
	Name: damageEffectArea
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x1F38
	Size: 0x218
	Parameters: 5
	Flags: None
	Line Number: 598
*/
function damageEffectArea(owner, position, radius, height, killCamEnt)
{
	trigger_radius_position = position - (0, 0, height);
	trigger_radius_height = height * 2;
	fireEffectArea = spawn("trigger_radius", trigger_radius_position, 0, radius, trigger_radius_height);
	if(isdefined(level.rapsOnBurnRaps))
	{
		owner thread [[level.rapsOnBurnRaps]](fireEffectArea);
	}
	loopWaitTime = level.incendiaryfireDamageTickTime;
	durationOfIncendiary = level.incendiaryfireDuration;
	while(durationOfIncendiary > 0)
	{
		durationOfIncendiary = durationOfIncendiary - loopWaitTime;
		damageApplied = 0;
		potential_targets = self getPotentialTargets(owner);
		foreach(target in potential_targets)
		{
			self tryToApplyFireDamage(target, owner, position, fireEffectArea, loopWaitTime, killCamEnt);
		}
		wait(loopWaitTime);
	}
	if(isdefined(killCamEnt))
	{
		killCamEnt entityheadicons::destroyEntityHeadIcons();
	}
	fireEffectArea delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: getPotentialTargets
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x2158
	Size: 0x328
	Parameters: 1
	Flags: None
	Line Number: 639
*/
function getPotentialTargets(owner)
{
	if(isdefined(owner))
	{
	}
	else
	{
	}
	owner_team = undefined;
	if(level.teambased && isdefined(owner_team) && level.friendlyfire == 0)
	{
		if(owner_team == "axis")
		{
		}
		else
		{
		}
		enemy_team = "axis";
		potential_targets = [];
		potential_targets = ArrayCombine(potential_targets, GetPlayers(enemy_team), 0, 0);
		potential_targets = ArrayCombine(potential_targets, GetAITeamArray(enemy_team), 0, 0);
		potential_targets = ArrayCombine(potential_targets, GetVehicleTeamArray(enemy_team), 0, 0);
		potential_targets[potential_targets.size] = owner;
		return potential_targets;
	}
	all_targets = [];
	all_targets = ArrayCombine(all_targets, level.players, 0, 0);
	all_targets = ArrayCombine(all_targets, GetAIArray(), 0, 0);
	all_targets = ArrayCombine(all_targets, GetVehicleArray(), 0, 0);
	if(level.friendlyfire > 0)
	{
		return all_targets;
	}
	potential_targets = [];
	foreach(target in all_targets)
	{
		if(!isdefined(target))
		{
			continue;
		}
		if(!isdefined(target.team))
		{
			continue;
		}
		if(isdefined(owner))
		{
			if(target != owner)
			{
				if(!isdefined(owner_team))
				{
					continue;
				}
				if(target.team == owner_team)
				{
					continue;
				}
			}
		}
		else if(!isdefined(self))
		{
			continue;
		}
		if(!isdefined(self.team))
		{
			continue;
		}
		if(target.team == self.team)
		{
			continue;
		}
		potential_targets[potential_targets.size] = target;
	}
	return potential_targets;
}

/*
	Name: tryToApplyFireDamage
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x2488
	Size: 0x140
	Parameters: 6
	Flags: None
	Line Number: 724
*/
function tryToApplyFireDamage(target, owner, position, fireEffectArea, resetFireTime, killCamEnt)
{
	if(!isdefined(target.infireArea) || target.infireArea == 0)
	{
		if(target istouching(fireEffectArea) && (!isdefined(target.sessionstate) || target.sessionstate == "playing"))
		{
			trace = bullettrace(position, target GetShootAtPos(), 0, target, 1);
			if(trace["fraction"] == 1)
			{
				target.lastburnedBy = owner;
				target thread damageInFireArea(fireEffectArea, killCamEnt, trace, position, resetFireTime);
			}
		}
	}
}

/*
	Name: damageInFireArea
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x25D0
	Size: 0x190
	Parameters: 5
	Flags: None
	Line Number: 750
*/
function damageInFireArea(fireEffectArea, killCamEnt, trace, position, resetFireTime)
{
	self endon("disconnect");
	self endon("death");
	self endon("death");
	timer = 0;
	health = self.maxhealth;
	health = health / 3.5;
	damage = Int(health);
	if(level.hardcoreMode)
	{
		damage = level.incendiaryfireDamageHardcore;
	}
	if(canDoFireDamage(killCamEnt, self, resetFireTime) && !isPlayer(self))
	{
		self DoDamage(damage, fireEffectArea.origin, self.lastburnedBy, killCamEnt, "none", "MOD_BURNED", 0, GetWeapon("incendiary_fire"));
		entnum = self GetEntityNumber();
		self thread sndFireDamage();
	}
}

/*
	Name: sndFireDamage
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x2768
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 781
*/
function sndFireDamage()
{
	self notify("sndFire");
	self endon("death");
	self endon("disconnect");
	self endon("death");
	self endon("sndFire");
	if(!isdefined(self.sndFireEnt))
	{
		self.sndFireEnt = spawn("script_origin", self.origin);
		self.sndFireEnt LinkTo(self, "tag_origin");
		self.sndFireEnt playsound("chr_burn_start");
		self thread sndFireDamage_DeleteEnt(self.sndFireEnt);
	}
	self.sndFireEnt PlayLoopSound("chr_burn_start_loop", 0.5);
	wait(3);
	self.sndFireEnt delete();
	self.sndFireEnt = undefined;
}

/*
	Name: sndFireDamage_DeleteEnt
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x28A0
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 811
*/
function sndFireDamage_DeleteEnt(ent)
{
	self endon("disconnect");
	self endon("death");
	self waittill("death");
	if(isdefined(ent))
	{
		ent delete();
	}
}

/*
	Name: hitPos
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x2900
	Size: 0x50
	Parameters: 3
	Flags: None
	Line Number: 832
*/
function hitPos(start, end, color)
{
	trace = bullettrace(start, end, 0, undefined);
	return trace;
}

/*
	Name: canDoFireDamage
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x2958
	Size: 0x88
	Parameters: 3
	Flags: None
	Line Number: 848
*/
function canDoFireDamage(killCamEnt, victim, resetFireTime)
{
	entnum = victim GetEntityNumber();
	if(!isdefined(level.incendiaryDamageThisTick[entnum]))
	{
		level.incendiaryDamageThisTick[entnum] = 0;
		level thread resetFireDamage(entnum, resetFireTime);
		return 1;
	}
	return 0;
}

/*
	Name: resetFireDamage
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x29E8
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 870
*/
function resetFireDamage(entnum, time)
{
	if(time > 0.05)
	{
		wait(time - 0.05);
	}
	level.incendiaryDamageThisTick[entnum] = undefined;
}

/*
	Name: zombie_speed
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x2A30
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 889
*/
function zombie_speed()
{
	self notify("hash_a9864356");
	self endon("hash_a9864356");
	self.var_adeb391b = 1;
	self SetEntityPaused(1);
	self zombie_utility::set_zombie_run_cycle_restore_from_override();
	wait(0.1);
	self util::waittill_any_timeout(3, "death", "widows_wine_slow");
	self SetEntityPaused(0);
	if(!isalive(self) || !isdefined(self))
	{
		return;
	}
	self endon("death");
	while(isdefined(self))
	{
		self zombie_utility::set_zombie_run_cycle_override_value("walk");
		wait(1);
	}
}

/*
	Name: function_dc16e276
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x2B40
	Size: 0xD8
	Parameters: 0
	Flags: AutoExec
	Line Number: 921
*/
function autoexec function_dc16e276()
{
	if(GetDvarString("aae_lite") == "")
	{
		level.lightninggun_arc_range = 300;
		level.lightninggun_arc_range_sq = level.lightninggun_arc_range * level.lightninggun_arc_range;
		level.lightninggun_arc_speed = 650;
		level.lightninggun_arc_speed_sq = level.lightninggun_arc_speed * level.lightninggun_arc_speed;
		level.lightninggun_arc_fx_min_range = 1;
		level.lightninggun_arc_fx_min_range_sq = level.lightninggun_arc_fx_min_range * level.lightninggun_arc_fx_min_range;
		zm::register_zombie_damage_override_callback(&on_damage_lightninggun);
		zm::register_vehicle_damage_callback(&function_a020694);
		return;
	}
}

/*
	Name: lightninggun_start_damage_effects
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x2C20
	Size: 0x308
	Parameters: 1
	Flags: None
	Line Number: 947
*/
function lightninggun_start_damage_effects(eAttacker)
{
	self endon("death");
	if(isdefined(self))
	{
		self.electrifiedBy = eAttacker;
		self.zombie_tesla_hit = 1;
		if(isVehicle(self))
		{
			FX = PlayFXOnTag("zombie/fx_tesla_shock_eyes_zmb", self, "tag_body");
			fx2 = PlayFXOnTag("_t6/maps/zombie/fx_zombie_bar_break_lite", self, "tag_enter_driver");
			FX3 = PlayFXOnTag("_t6/maps/zombie/fx_zombie_bar_break", self, "tag_origin");
			var_fb2c4b25 = PlayFXOnTag("_t6/maps/zombie/fx_zmb_tanzit_upgrade", self, "tag_driver");
			var_d529d0bc = PlayFXOnTag("_t6/maps/zombie/fx_fog_zombie_amb", self, "tag_player");
			var_47313ff7 = PlayFXOnTag("_t6/maps/zombie/fx_fog_zombie_amb", self, "tag_flash");
		}
		else
		{
			FX = PlayFXOnTag("zombie/fx_tesla_shock_eyes_zmb", self, "j_eyeball_le");
			fx2 = PlayFXOnTag("_t6/maps/zombie/fx_zombie_bar_break_lite", self, "j_wrist_le");
			FX3 = PlayFXOnTag("_t6/maps/zombie/fx_zombie_bar_break", self, "j_wrist_ri");
			var_fb2c4b25 = PlayFXOnTag("_t6/maps/zombie/fx_zmb_tanzit_upgrade", self, "j_spineupper");
			var_d529d0bc = PlayFXOnTag("_t6/maps/zombie/fx_fog_zombie_amb", self, "j_shoulder_le");
			var_47313ff7 = PlayFXOnTag("_t6/maps/zombie/fx_fog_zombie_amb", self, "j_shoulder_ri");
		}
	}
	wait(1);
	if(isdefined(self) && isalive(self))
	{
		if(IsSubStr(self.model, "margwa"))
		{
			self kill();
		}
		else
		{
			self DoDamage(self.health + 1, self.origin, eAttacker);
		}
		if(isdefined(self) && isdefined(self.electrifiedBy))
		{
			self.electrifiedBy = undefined;
		}
	}
}

/*
	Name: function_3c1a24eb
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x2F30
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 1001
*/
function function_3c1a24eb()
{
	zombie_move = spawn("script_model", self.origin);
	zombie_move SetModel("tag_origin");
	self LinkTo(zombie_move);
	zombie_move rotate(VectorScale((0, 1, 0), 200));
	zombie_move moveto(self.origin + VectorScale((0, 0, 1), 30), 2);
	zombie_move waittill("movedone");
	zombie_move delete();
	return;
	ERROR: Bad function call
}

/*
	Name: function_65e39f0e
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x3020
	Size: 0x430
	Parameters: 5
	Flags: None
	Line Number: 1024
*/
function function_65e39f0e(eAttacker, eInflictor, weapon, meansOfDeath, damage)
{
	if(!isalive(self) || !isdefined(self))
	{
		return;
	}
	if(isdefined(self.zombie_tesla_hit) && self.zombie_tesla_hit)
	{
		return;
	}
	self endon("death");
	if(isVehicle(self))
	{
		FX = PlayFXOnTag("zombie/fx_tesla_shock_eyes_zmb", self, "tag_body");
		fx2 = PlayFXOnTag("_t6/maps/zombie/fx_zombie_bar_break_lite", self, "tag_enter_driver");
		FX3 = PlayFXOnTag("_t6/maps/zombie/fx_zombie_bar_break", self, "tag_origin");
		var_fb2c4b25 = PlayFXOnTag("_t6/maps/zombie/fx_zmb_tanzit_upgrade", self, "tag_driver");
		var_d529d0bc = PlayFXOnTag("_t6/maps/zombie/fx_fog_zombie_amb", self, "tag_player");
		var_47313ff7 = PlayFXOnTag("_t6/maps/zombie/fx_fog_zombie_amb", self, "tag_flash");
	}
	else
	{
		FX = PlayFXOnTag("zombie/fx_tesla_shock_eyes_zmb", self, "j_eyeball_le");
		fx2 = PlayFXOnTag("_t6/maps/zombie/fx_zombie_bar_break_lite", self, "j_wrist_le");
		FX3 = PlayFXOnTag("_t6/maps/zombie/fx_zombie_bar_break", self, "j_wrist_ri");
		var_fb2c4b25 = PlayFXOnTag("_t6/maps/zombie/fx_zmb_tanzit_upgrade", self, "j_spineupper");
		var_d529d0bc = PlayFXOnTag("_t6/maps/zombie/fx_fog_zombie_amb", self, "j_shoulder_le");
		var_47313ff7 = PlayFXOnTag("_t6/maps/zombie/fx_fog_zombie_amb", self, "j_shoulder_ri");
	}
	for(var_11ec13b9 = 3; isdefined(self) && isalive(self) && var_11ec13b9; var_11ec13b9--)
	{
		self.electrifiedBy = eAttacker;
		self.zombie_tesla_hit = 1;
		arc_source_pos = self GetTagOrigin("j_spineupper");
		if(isVehicle(self))
		{
			arc_source_pos = self GetTagOrigin("tag_body");
		}
		eAttacker lightninggun_find_arc_targets(eAttacker, self, self.origin, arc_source_pos);
		wait(2);
	}
	if(isdefined(self) && isalive(self))
	{
		if(IsSubStr(self.model, "margwa"))
		{
			self kill();
		}
		else
		{
			self DoDamage(self.health + 1, self.origin, eAttacker);
		}
		if(isdefined(self) && isdefined(self.electrifiedBy))
		{
			self.electrifiedBy = undefined;
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: lightninggun_arc_fx
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x3458
	Size: 0x148
	Parameters: 3
	Flags: None
	Line Number: 1094
*/
function lightninggun_arc_fx(arc_source_pos, arc_target_pos, distanceSq)
{
	waittime = 0.2;
	if(level.lightninggun_arc_speed_sq > 100 && distanceSq > 1)
	{
		waittime = distanceSq / level.lightninggun_arc_speed_sq;
	}
	fxOrg = spawn("script_model", arc_source_pos);
	fxOrg SetModel("tag_origin");
	FX = PlayFXOnTag("_t6/maps/zombie/fx_zombie_tesla_neck_spurt", fxOrg, "tag_origin");
	playsoundatposition("wpn_lightning_gun_bounce", fxOrg.origin);
	fxOrg moveto(arc_target_pos, waittime);
	fxOrg waittill("movedone");
	fxOrg delete();
}

/*
	Name: lightninggun_arc
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x35A8
	Size: 0xD0
	Parameters: 6
	Flags: None
	Line Number: 1120
*/
function lightninggun_arc(eAttacker, arc_source, arc_source_origin, arc_source_pos, arc_target_pos, distanceSq)
{
	if(!isdefined(self) || !isalive(self))
	{
		return;
	}
	if(isdefined(self.zombie_tesla_hit) && self.zombie_tesla_hit)
	{
		return;
	}
	distanceSq = DistanceSquared(self.origin, arc_source_origin);
	if(distanceSq > level.lightninggun_arc_range_sq)
	{
		return;
	}
	if(!isdefined(arc_source))
	{
		return;
	}
	self thread lightninggun_start_damage_effects(eAttacker);
}

/*
	Name: lightninggun_find_arc_targets
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x3680
	Size: 0x238
	Parameters: 4
	Flags: None
	Line Number: 1152
*/
function lightninggun_find_arc_targets(eAttacker, arc_source, arc_source_origin, arc_source_pos)
{
	delay = 0.05;
	allEnemyAlivePlayers = GetAITeamArray("axis");
	var_78e79842 = GetVehicleTeamArray("axis");
	allEnemyAlivePlayers = ArrayCombine(allEnemyAlivePlayers, var_78e79842, 0, 0);
	allEnemyAlivePlayers = ArraySortClosest(allEnemyAlivePlayers, arc_source_origin, allEnemyAlivePlayers.size, 0, level.lightninggun_arc_range);
	foreach(player in allEnemyAlivePlayers)
	{
		distanceSq = DistanceSquared(player.origin, arc_source_origin);
		if(isVehicle(player))
		{
			var_631bf680 = player GetTagOrigin("tag_body");
		}
		else
		{
			var_631bf680 = player GetTagOrigin("j_spineupper");
		}
		player lightninggun_arc_fx(arc_source_pos, var_631bf680, distanceSq);
		player thread lightninggun_arc(eAttacker, arc_source, arc_source_origin, arc_source_pos, var_631bf680, distanceSq);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: lightninggun_damage_response
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x38C0
	Size: 0x140
	Parameters: 5
	Flags: None
	Line Number: 1187
*/
function lightninggun_damage_response(eAttacker, eInflictor, weapon, meansOfDeath, damage)
{
	if(!isalive(self) || !isdefined(self))
	{
		return;
	}
	if(isdefined(self.zombie_tesla_hit) && self.zombie_tesla_hit)
	{
		return;
	}
	arc_source = self;
	arc_source_origin = self.origin;
	arc_source_pos = self GetTagOrigin("j_spineupper");
	if(isVehicle(self))
	{
		arc_source_pos = self GetTagOrigin("tag_body");
	}
	self thread lightninggun_start_damage_effects(eAttacker);
	wait(1);
	eAttacker thread lightninggun_find_arc_targets(eAttacker, arc_source, arc_source_origin, arc_source_pos);
}

/*
	Name: on_damage_lightninggun
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x3A08
	Size: 0x148
	Parameters: 13
	Flags: None
	Line Number: 1219
*/
function on_damage_lightninggun(willBeKilled, inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(IsSubStr(weapon.rootweapon.name, "elmg_tempset") && isPlayer(attacker) && isdefined(weapon))
	{
		if(IsSubStr(weapon.rootweapon.name, "upgraded"))
		{
			self thread function_65e39f0e(attacker, inflictor, weapon, meansOfDeath, damage);
		}
		else
		{
			self thread lightninggun_damage_response(attacker, inflictor, weapon, meansOfDeath, damage);
		}
	}
}

/*
	Name: function_a020694
	Namespace: satchel_charge
	Checksum: 0x424F4353
	Offset: 0x3B58
	Size: 0xD8
	Parameters: 15
	Flags: None
	Line Number: 1244
*/
function function_a020694(eInflictor, player, damage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, modelIndex, partName, vSurfaceNormal)
{
	if(IsSubStr(weapon.rootweapon.name, "elmg_tempset"))
	{
		self thread lightninggun_damage_response(player, undefined, weapon, sMeansOfDeath, damage);
	}
	return damage;
}

