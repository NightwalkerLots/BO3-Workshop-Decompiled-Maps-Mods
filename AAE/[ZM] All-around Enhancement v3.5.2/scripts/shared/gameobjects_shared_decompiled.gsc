#include scripts\shared\callbacks_shared;
#include scripts\shared\hostmigration_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\killstreaks_shared;
#include scripts\shared\math_shared;
#include scripts\shared\objpoints_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\tweakables_shared;
#include scripts\shared\util_shared;
#include scripts\shared\weapons_shared;

#namespace gameobjects;

/*
	Name: __init__sytem__
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x440
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("gameobjects", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x480
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	level.numGametypeReservedObjectives = 30;
	level.releasedObjectives = [];
	callback::on_spawned(&on_player_spawned);
	callback::on_disconnect(&on_disconnect);
	callback::on_laststand(&on_player_last_stand);
}

/*
	Name: main
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x508
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function main()
{
	level.vehiclesEnabled = GetGametypeSetting("vehiclesEnabled");
	level.vehiclesTimed = GetGametypeSetting("vehiclesTimed");
	level.objectivePingDelay = GetGametypeSetting("objectivePingTime");
	level.nonTeamBasedTeam = "allies";
	if(!isdefined(level.allowedGameObjects))
	{
		level.allowedGameObjects = [];
	}
	if(level.vehiclesEnabled)
	{
		level.allowedGameObjects[level.allowedGameObjects.size] = "vehicle";
		filter_script_vehicles_from_vehicle_descriptors(level.allowedGameObjects);
	}
	entities = GetEntArray();
	for(entity_index = entities.size - 1; entity_index >= 0; entity_index--)
	{
		entity = entities[entity_index];
		if(!entity_is_allowed(entity, level.allowedGameObjects))
		{
			entity delete();
		}
	}
	return;
}

/*
	Name: register_allowed_gameobject
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x678
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 95
*/
function register_allowed_gameobject(gameobject)
{
	if(!isdefined(level.allowedGameObjects))
	{
		level.allowedGameObjects = [];
	}
	level.allowedGameObjects[level.allowedGameObjects.size] = gameobject;
	return;
}

/*
	Name: clear_allowed_gameobjects
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x6C0
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 115
*/
function clear_allowed_gameobjects()
{
	level.allowedGameObjects = [];
}

/*
	Name: entity_is_allowed
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x6D8
	Size: 0x118
	Parameters: 2
	Flags: None
	Line Number: 130
*/
function entity_is_allowed(entity, allowed_game_modes)
{
	allowed = 1;
	if(isdefined(entity.script_gameobjectname) && entity.script_gameobjectname != "[all_modes]")
	{
		allowed = 0;
		gameobjectnames = StrTok(entity.script_gameobjectname, " ");
		for(i = 0; i < allowed_game_modes.size && !allowed; i++)
		{
			for(j = 0; j < gameobjectnames.size && !allowed; j++)
			{
				allowed = gameobjectnames[j] == allowed_game_modes[i];
			}
		}
	}
	return allowed;
}

/*
	Name: location_is_allowed
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x7F8
	Size: 0x130
	Parameters: 2
	Flags: None
	Line Number: 158
*/
function location_is_allowed(entity, location)
{
	allowed = 1;
	location_list = undefined;
	if(isdefined(entity.script_noteworthy))
	{
		location_list = entity.script_noteworthy;
	}
	if(isdefined(entity.script_location))
	{
		location_list = entity.script_location;
	}
	if(isdefined(location_list))
	{
		if(location_list == "[all_modes]")
		{
			allowed = 1;
		}
		else
		{
			allowed = 0;
			gameobjectlocations = StrTok(location_list, " ");
			for(j = 0; j < gameobjectlocations.size; j++)
			{
				if(gameobjectlocations[j] == location)
				{
					allowed = 1;
					break;
				}
			}
		}
	}
	return allowed;
}

/*
	Name: filter_script_vehicles_from_vehicle_descriptors
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x930
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 203
*/
function filter_script_vehicles_from_vehicle_descriptors(allowed_game_modes)
{
	vehicle_descriptors = GetEntArray("vehicle_descriptor", "targetname");
	script_vehicles = GetEntArray("script_vehicle", "classname");
	vehicles_to_remove = [];
	for(descriptor_index = 0; descriptor_index < vehicle_descriptors.size; descriptor_index++)
	{
		descriptor = vehicle_descriptors[descriptor_index];
		closest_distance_sq = 1E+12;
		closest_vehicle = undefined;
		for(vehicle_index = 0; vehicle_index < script_vehicles.size; vehicle_index++)
		{
			vehicle = script_vehicles[vehicle_index];
			dsquared = DistanceSquared(vehicle GetOrigin(), descriptor GetOrigin());
			if(dsquared < closest_distance_sq)
			{
				closest_distance_sq = dsquared;
				closest_vehicle = vehicle;
			}
		}
		if(isdefined(closest_vehicle))
		{
			if(!entity_is_allowed(descriptor, allowed_game_modes))
			{
				vehicles_to_remove[vehicles_to_remove.size] = closest_vehicle;
			}
		}
	}
	for(vehicle_index = 0; vehicle_index < vehicles_to_remove.size; vehicle_index++)
	{
		vehicles_to_remove[vehicle_index] delete();
	}
	return;
}

/*
	Name: on_player_spawned
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xB40
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 248
*/
function on_player_spawned()
{
	self endon("disconnect");
	level endon("game_ended");
	self thread on_death();
	self.touchTriggers = [];
	self.packObject = [];
	self.packIcon = [];
	self.carryObject = undefined;
	self.claimTrigger = undefined;
	self.canPickupObject = 1;
	self.disabledWeapon = 0;
	self.killedInUse = undefined;
}

/*
	Name: on_death
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xBD0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 273
*/
function on_death()
{
	level endon("game_ended");
	self endon("killOnDeathMonitor");
	self waittill("death");
	self thread gameObjects_dropped();
	return;
}

/*
	Name: on_disconnect
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xC18
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 292
*/
function on_disconnect()
{
	level endon("game_ended");
	self thread gameObjects_dropped();
}

/*
	Name: on_player_last_stand
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xC48
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 308
*/
function on_player_last_stand()
{
	self thread gameObjects_dropped();
}

/*
	Name: gameObjects_dropped
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xC70
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 323
*/
function gameObjects_dropped()
{
	if(isdefined(self.carryObject))
	{
		self.carryObject thread set_dropped();
	}
	if(isdefined(self.packObject) && self.packObject.size > 0)
	{
		foreach(item in self.packObject)
		{
			item thread set_dropped();
		}
	}
}

/*
	Name: create_carry_object
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xD50
	Size: 0xA28
	Parameters: 6
	Flags: None
	Line Number: 348
*/
function create_carry_object(ownerTeam, trigger, visuals, offset, objectiveName, hitSound)
{
	carryObject = spawnstruct();
	carryObject.type = "carryObject";
	carryObject.curorigin = trigger.origin;
	carryObject.entnum = trigger GetEntityNumber();
	carryObject.hitSound = hitSound;
	if(IsSubStr(trigger.classname, "use"))
	{
		carryObject.triggerType = "use";
	}
	else
	{
		carryObject.triggerType = "proximity";
	}
	trigger.baseOrigin = trigger.origin;
	carryObject.trigger = trigger;
	carryObject.useWeapon = undefined;
	if(!isdefined(offset))
	{
		offset = (0, 0, 0);
	}
	carryObject.offset3d = offset;
	carryObject.newStyle = 0;
	if(isdefined(objectiveName))
	{
		if(!SessionModeIsCampaignGame())
		{
			carryObject.newStyle = 1;
		}
	}
	else
	{
		objectiveName = &"";
	}
	for(index = 0; index < visuals.size; index++)
	{
		visuals[index].baseOrigin = visuals[index].origin;
		visuals[index].baseAngles = visuals[index].angles;
	}
	carryObject.visuals = visuals;
	carryObject _set_team(ownerTeam);
	carryObject.compassIcons = [];
	carryObject.objId = [];
	if(!carryObject.newStyle)
	{
		foreach(team in level.teams)
		{
			carryObject.objId[team] = get_next_obj_id();
		}
	}
	carryObject.objIDPingFriendly = 0;
	carryObject.objIDPingEnemy = 0;
	level.objIDStart = level.objIDStart + 2;
	if(!carryObject.newStyle)
	{
		if(level.teambased)
		{
			foreach(team in level.teams)
			{
				if(SessionModeIsCampaignGame())
				{
					if(team == "allies")
					{
						objective_add(carryObject.objId[team], "active", carryObject.curorigin, objectiveName);
					}
					else
					{
						objective_add(carryObject.objId[team], "invisible", carryObject.curorigin, objectiveName);
					}
				}
				else
				{
					objective_add(carryObject.objId[team], "invisible", carryObject.curorigin, objectiveName);
				}
				objective_team(carryObject.objId[team], team);
				carryObject.objPoints[team] = objPoints::create("objpoint_" + team + "_" + carryObject.entnum, carryObject.curorigin + offset, team, undefined);
				carryObject.objPoints[team].alpha = 0;
			}
		}
		else
		{
			objective_add(carryObject.objId[level.nonTeamBasedTeam], "invisible", carryObject.curorigin, objectiveName);
			carryObject.objPoints[level.nonTeamBasedTeam] = objPoints::create("objpoint_" + level.nonTeamBasedTeam + "_" + carryObject.entnum, carryObject.curorigin + offset, "all", undefined);
			carryObject.objPoints[level.nonTeamBasedTeam].alpha = 0;
		}
	}
	carryObject.objectiveId = get_next_obj_id();
	if(carryObject.newStyle)
	{
		objective_add(carryObject.objectiveId, "invisible", carryObject.curorigin, objectiveName);
	}
	carryObject.carrier = undefined;
	carryObject.isResetting = 0;
	carryObject.interactTeam = "none";
	carryObject.allowWeapons = 0;
	carryObject.visibleCarrierModel = undefined;
	carryObject.dropOffset = 0;
	carryObject.disallowRemoteControl = 0;
	carryObject.worldIcons = [];
	carryObject.carrierVisible = 0;
	carryObject.visibleTeam = "none";
	carryObject.worldIsWaypoint = [];
	carryObject.worldIcons_disabled = [];
	carryObject.carryIcon = undefined;
	carryObject.setDropped = undefined;
	carryObject.onDrop = undefined;
	carryObject.onPickup = undefined;
	carryObject.onReset = undefined;
	if(carryObject.triggerType == "use")
	{
		carryObject thread carry_object_use_think();
	}
	else
	{
		carryObject.numTouching["neutral"] = 0;
		carryObject.numTouching["none"] = 0;
		carryObject.touchList["neutral"] = [];
		carryObject.touchList["none"] = [];
		foreach(team in level.teams)
		{
			carryObject.numTouching[team] = 0;
			carryObject.touchList[team] = [];
		}
		carryObject.curProgress = 0;
		carryObject.useTime = 0;
		carryObject.useRate = 0;
		carryObject.claimTeam = "none";
		carryObject.claimPlayer = undefined;
		carryObject.lastClaimTeam = "none";
		carryObject.lastClaimTime = 0;
		carryObject.claimGracePeriod = 0;
		carryObject.mustMaintainClaim = 0;
		carryObject.canContestClaim = 0;
		carryObject.decayProgress = 0;
		carryObject.teamUseTimes = [];
		carryObject.teamUseTexts = [];
		carryObject.onUse = &set_picked_up;
		carryObject thread use_object_prox_think();
	}
	carryObject thread update_carry_object_origin();
	carryObject thread update_carry_object_objective_origin();
	return carryObject;
}

/*
	Name: carry_object_use_think
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x1780
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 503
*/
function carry_object_use_think()
{
	level endon("game_ended");
	self.trigger endon("destroyed");
	while(1)
	{
		self.trigger waittill("trigger", player);
		if(self.isResetting)
		{
			continue;
		}
		if(!isalive(player))
		{
			continue;
		}
		if(isdefined(player.laststand) && player.laststand)
		{
			continue;
		}
		if(!self can_interact_with(player))
		{
			continue;
		}
		if(!player.canPickupObject)
		{
			continue;
		}
		if(player.throwingGrenade)
		{
			continue;
		}
		if(isdefined(self.carrier))
		{
			continue;
		}
		if(player IsInVehicle())
		{
			continue;
		}
		if(player IsRemoteControlling() || player util::isUsingRemote())
		{
			continue;
		}
		if(isdefined(player.selectingLocation) && player.selectingLocation)
		{
			continue;
		}
		if(player IsWeaponViewOnlyLinked())
		{
			continue;
		}
		if(!player istouching(self.trigger))
		{
			continue;
		}
		self set_picked_up(player);
	}
}

/*
	Name: carry_object_prox_think
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x1958
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 572
*/
function carry_object_prox_think()
{
	level endon("game_ended");
	self.trigger endon("destroyed");
	while(1)
	{
		self.trigger waittill("trigger", player);
		if(self.isResetting)
		{
			continue;
		}
		if(!isalive(player))
		{
			continue;
		}
		if(isdefined(player.laststand) && player.laststand)
		{
			continue;
		}
		if(!self can_interact_with(player))
		{
			continue;
		}
		if(!player.canPickupObject)
		{
			continue;
		}
		if(player.throwingGrenade)
		{
			continue;
		}
		if(isdefined(self.carrier))
		{
			continue;
		}
		if(player IsInVehicle())
		{
			continue;
		}
		if(player IsRemoteControlling() || player util::isUsingRemote())
		{
			continue;
		}
		if(isdefined(player.selectingLocation) && player.selectingLocation)
		{
			continue;
		}
		if(player IsWeaponViewOnlyLinked())
		{
			continue;
		}
		if(!player istouching(self.trigger))
		{
			continue;
		}
		self set_picked_up(player);
	}
}

/*
	Name: pickup_object_delay
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x1B30
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 641
*/
function pickup_object_delay(origin)
{
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	self.canPickupObject = 0;
	while(DistanceSquared(self.origin, origin) > 4096)
	{
		break;
		wait(0.2);
	}
	self.canPickupObject = 1;
}

/*
	Name: set_picked_up
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x1BB0
	Size: 0x238
	Parameters: 1
	Flags: None
	Line Number: 665
*/
function set_picked_up(player)
{
	if(!isalive(player))
	{
		return;
	}
	if(self.type == "carryObject")
	{
		if(isdefined(player.carryObject))
		{
			if(isdefined(player.carryObject.swappable) && player.carryObject.swappable)
			{
				player.carryObject thread set_dropped();
			}
			else if(isdefined(self.onPickupFailed))
			{
				self [[self.onPickupFailed]](player);
				return;
			}
		}
		player give_object(self);
	}
	else if(self.type == "packObject")
	{
		if(isdefined(level.max_packObjects) && level.max_packObjects <= player.packObject.size)
		{
			if(isdefined(self.onPickupFailed))
			{
				self [[self.onPickupFailed]](player);
				return;
			}
		}
		player give_pack_object(self);
	}
	self set_carrier(player);
	self ghost_visuals();
	self.trigger.origin = self.trigger.origin + VectorScale((0, 0, 1), 10000);
	self notify("pickup_object");
	if(isdefined(self.onPickup))
	{
		self [[self.onPickup]](player);
	}
	self update_compass_icons();
	self update_world_icons();
	self update_objective();
}

/*
	Name: unlink_grenades
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x1DF0
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 722
*/
function unlink_grenades()
{
	radius = 32;
	origin = self.origin;
	grenades = GetEntArray("grenade", "classname");
	radiusSq = radius * radius;
	linkedGrenades = [];
	foreach(grenade in grenades)
	{
		if(DistanceSquared(origin, grenade.origin) < radiusSq)
		{
			if(grenade islinkedto(self))
			{
				grenade Unlink();
				linkedGrenades[linkedGrenades.size] = grenade;
			}
		}
	}
	waittillframeend;
	foreach(grenade in linkedGrenades)
	{
		grenade launch((RandomFloatRange(-5, 5), RandomFloatRange(-5, 5), 5));
	}
	return;
}

/*
	Name: ghost_visuals
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x2010
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 758
*/
function ghost_visuals()
{
	foreach(visual in self.visuals)
	{
		visual ghost();
		visual thread unlink_grenades();
	}
}

/*
	Name: update_carry_object_origin
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x20C0
	Size: 0x560
	Parameters: 0
	Flags: None
	Line Number: 777
*/
function update_carry_object_origin()
{
	level endon("game_ended");
	self.trigger endon("destroyed");
	if(self.newStyle)
	{
		return;
	}
	objPingDelay = level.objectivePingDelay;
	while(isdefined(self.carrier) && level.teambased)
	{
		self.curorigin = self.carrier.origin + VectorScale((0, 0, 1), 75);
		foreach(team in level.teams)
		{
			self.objPoints[team] objPoints::update_origin(self.curorigin);
		}
		if(self.visibleTeam == "friendly" || self.visibleTeam == "any" && self.objIDPingFriendly)
		{
			foreach(team in level.teams)
			{
				if(self is_friendly_team(team))
				{
					if(self.objPoints[team].isShown)
					{
						self.objPoints[team].alpha = self.objPoints[team].baseAlpha;
						self.objPoints[team] fadeOverTime(objPingDelay + 1);
						self.objPoints[team].alpha = 0;
					}
					objective_position(self.objId[team], self.curorigin);
				}
			}
		}
		else if(self.visibleTeam == "enemy" || self.visibleTeam == "any" && self.objIDPingEnemy)
		{
			if(!self is_friendly_team(team))
			{
				if(self.objPoints[team].isShown)
				{
					self.objPoints[team].alpha = self.objPoints[team].baseAlpha;
					self.objPoints[team] fadeOverTime(objPingDelay + 1);
					self.objPoints[team].alpha = 0;
				}
				objective_position(self.objId[team], self.curorigin);
			}
		}
		self util::wait_endon(objPingDelay, "dropped", "reset");
		continue;
		if(isdefined(self.carrier))
		{
			self.curorigin = self.carrier.origin + VectorScale((0, 0, 1), 75);
			self.objPoints[level.nonTeamBasedTeam] objPoints::update_origin(self.curorigin);
			objective_position(self.objId[level.nonTeamBasedTeam], self.curorigin);
			wait(0.05);
		}
		else if(level.teambased)
		{
			foreach(team in level.teams)
			{
				self.objPoints[team] objPoints::update_origin(self.curorigin + self.offset3d);
			}
		}
		else
		{
			self.objPoints[level.nonTeamBasedTeam] objPoints::update_origin(self.curorigin + self.offset3d);
		}
		wait(0.05);
	}
}

/*
	Name: update_carry_object_objective_origin
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x2628
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 856
*/
function update_carry_object_objective_origin()
{
	level endon("game_ended");
	self.trigger endon("destroyed");
	if(!self.newStyle)
	{
		return;
	}
	objPingDelay = level.objectivePingDelay;
	while(isdefined(self.carrier))
	{
		self.curorigin = self.carrier.origin;
		objective_position(self.objectiveId, self.curorigin);
		self util::wait_endon(objPingDelay, "dropped", "reset");
		continue;
		objective_position(self.objectiveId, self.curorigin);
		wait(0.05);
	}
}

/*
	Name: give_object
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x2710
	Size: 0x3E0
	Parameters: 1
	Flags: None
	Line Number: 886
*/
function give_object(object)
{
	/#
		Assert(!isdefined(self.carryObject));
	#/
	self.carryObject = object;
	self thread track_carrier(object);
	if(isdefined(object.carryWeapon))
	{
		if(isdefined(object.carryWeaponThink))
		{
			self thread [[object.carryWeaponThink]]();
		}
		for(count = 0; self IsMeleeing() && count < 10; count++)
		{
			wait(0.2);
		}
		self GiveWeapon(object.carryWeapon);
		if(self IsSwitchingWeapons())
		{
			self util::waittill_any_timeout(2, "weapon_change");
		}
		self SwitchToWeaponImmediate(object.carryWeapon);
		self setBlockWeaponPickup(object.carryWeapon, 1);
		self DisableWeaponCycling();
	}
	else if(!object.allowWeapons)
	{
		self util::_disableWeapon();
		self thread manual_drop_think();
	}
	self.disallowVehicleUsage = 1;
	if(isdefined(object.visibleCarrierModel))
	{
		self weapons::force_stowed_weapon_update();
	}
	if(!object.newStyle)
	{
		if(isdefined(object.carryIcon))
		{
			if(self IsSplitscreen())
			{
				self.carryIcon = hud::createIcon(object.carryIcon, 35, 35);
				self.carryIcon.x = -130;
				self.carryIcon.y = -90;
				self.carryIcon.horzAlign = "right";
				self.carryIcon.vertAlign = "bottom";
			}
			else
			{
				self.carryIcon = hud::createIcon(object.carryIcon, 50, 50);
				if(!object.allowWeapons)
				{
					self.carryIcon hud::setPoint("CENTER", "CENTER", 0, 60);
				}
				else
				{
					self.carryIcon.x = 130;
					self.carryIcon.y = -60;
					self.carryIcon.horzAlign = "user_left";
					self.carryIcon.vertAlign = "user_bottom";
				}
			}
			self.carryIcon.alpha = 0.75;
			self.carryIcon.hidewhileremotecontrolling = 1;
			self.carryIcon.hidewheninkillcam = 1;
		}
	}
}

/*
	Name: move_visuals_to_base
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x2AF8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 966
*/
function move_visuals_to_base()
{
	foreach(visual in self.visuals)
	{
		visual.origin = visual.baseOrigin;
		visual.angles = visual.baseAngles;
		visual DontInterpolate();
		visual show();
	}
}

/*
	Name: return_home
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x2BE0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 987
*/
function return_home()
{
	self.isResetting = 1;
	prev_origin = self.trigger.origin;
	self notify("reset");
	self move_visuals_to_base();
	self.trigger.origin = self.trigger.baseOrigin;
	self.curorigin = self.trigger.origin;
	if(isdefined(self.onReset))
	{
		self [[self.onReset]](prev_origin);
	}
	self clear_carrier();
	update_world_icons();
	update_compass_icons();
	update_objective();
	self.isResetting = 0;
}

/*
	Name: is_object_away_from_home
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x2CE0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1016
*/
function is_object_away_from_home()
{
	if(isdefined(self.carrier))
	{
		return 1;
	}
	if(DistanceSquared(self.trigger.origin, self.trigger.baseOrigin) > 4)
	{
		return 1;
	}
	return 0;
	ERROR: Bad function call
}

/*
	Name: set_position
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x2D40
	Size: 0x160
	Parameters: 2
	Flags: None
	Line Number: 1040
*/
function set_position(origin, angles)
{
	self.isResetting = 1;
	foreach(visual in self.visuals)
	{
		visual.origin = origin;
		visual.angles = angles;
		visual DontInterpolate();
		visual show();
	}
	self.trigger.origin = origin;
	self.curorigin = self.trigger.origin;
	self clear_carrier();
	update_world_icons();
	update_compass_icons();
	update_objective();
	self.isResetting = 0;
}

/*
	Name: set_drop_offset
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x2EA8
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 1069
*/
function set_drop_offset(height)
{
	self.dropOffset = height;
}

/*
	Name: set_dropped
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x2EC8
	Size: 0x6D8
	Parameters: 0
	Flags: None
	Line Number: 1084
*/
function set_dropped()
{
	if(isdefined(self.setDropped))
	{
		if([[self.setDropped]]())
		{
			return;
		}
	}
	self.isResetting = 1;
	self notify("dropped");
	startOrigin = (0, 0, 0);
	endOrigin = (0, 0, 0);
	body = undefined;
	if(isdefined(self.carrier) && self.carrier.team != "spectator")
	{
		startOrigin = self.carrier.origin + VectorScale((0, 0, 1), 20);
		endOrigin = self.carrier.origin - VectorScale((0, 0, 1), 2000);
		body = self.carrier.body;
	}
	else if(isdefined(self.safeOrigin))
	{
		startOrigin = self.safeOrigin + VectorScale((0, 0, 1), 20);
		endOrigin = self.safeOrigin - VectorScale((0, 0, 1), 20);
	}
	else
	{
		startOrigin = self.curorigin + VectorScale((0, 0, 1), 20);
		endOrigin = self.curorigin - VectorScale((0, 0, 1), 20);
	}
	trace_size = 10;
	trace = PhysicsTrace(startOrigin, endOrigin, (trace_size * -1, trace_size * -1, trace_size * -1), (trace_size, trace_size, trace_size), self, 32);
	droppingPlayer = self.carrier;
	self clear_carrier();
	if(isdefined(trace))
	{
		tempAngle = RandomFloat(360);
		dropOrigin = trace["position"] + (0, 0, self.dropOffset);
		if(trace["fraction"] < 1)
		{
			FORWARD = (cos(tempAngle), sin(tempAngle), 0);
			FORWARD = VectorNormalize(FORWARD - VectorScale(trace["normal"], VectorDot(FORWARD, trace["normal"])));
			if(SessionModeIsMultiplayerGame())
			{
				if(isdefined(trace["walkable"]))
				{
					if(trace["walkable"] == 0)
					{
						if(self should_be_reset(trace["position"][2], startOrigin[2], 1))
						{
							self thread return_home();
							self.isResetting = 0;
							return;
						}
						end_reflect = FORWARD * 1000 + trace["position"];
						reflect_trace = PhysicsTrace(trace["position"], end_reflect, (trace_size * -1, trace_size * -1, trace_size * -1), (trace_size, trace_size, trace_size), self, 32);
						if(isdefined(reflect_trace) && reflect_trace["normal"][2] < 0)
						{
							dropOrigin_reflect = reflect_trace["position"] + (0, 0, self.dropOffset);
							if(self should_be_reset(dropOrigin_reflect[2], trace["position"][2], 1))
							{
								self thread return_home();
								self.isResetting = 0;
								return;
							}
						}
					}
				}
			}
			dropAngles = VectorToAngles(FORWARD);
		}
		else
		{
			dropAngles = (0, tempAngle, 0);
		}
		foreach(visual in self.visuals)
		{
			visual.origin = dropOrigin;
			visual.angles = dropAngles;
			visual DontInterpolate();
			visual show();
		}
		self.trigger.origin = dropOrigin;
		self.curorigin = self.trigger.origin;
		self thread pickup_timeout(trace["position"][2], startOrigin[2]);
	}
	else
	{
		self move_visuals_to_base();
		self.trigger.origin = self.trigger.baseOrigin;
		self.curorigin = self.trigger.baseOrigin;
	}
	if(isdefined(self.onDrop))
	{
		self [[self.onDrop]](droppingPlayer);
	}
	self update_icons_and_objective();
	self.isResetting = 0;
}

/*
	Name: update_icons_and_objective
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x35A8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1194
*/
function update_icons_and_objective()
{
	self update_compass_icons();
	self update_world_icons();
	self update_objective();
}

/*
	Name: set_carrier
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x3600
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 1211
*/
function set_carrier(carrier)
{
	self.carrier = carrier;
	Objective_SetPlayerUsing(self.objectiveId, carrier);
	self thread update_visibility_according_to_radar();
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_carrier
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x3658
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 1231
*/
function get_carrier()
{
	return self.carrier;
}

/*
	Name: clear_carrier
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x3670
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1246
*/
function clear_carrier()
{
	if(!isdefined(self.carrier))
	{
		return;
	}
	self.carrier take_object(self);
	Objective_ClearPlayerUsing(self.objectiveId, self.carrier);
	self.carrier = undefined;
	self notify("carrier_cleared");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: is_touching_any_trigger
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x36E0
	Size: 0xB8
	Parameters: 3
	Flags: None
	Line Number: 1270
*/
function is_touching_any_trigger(triggers, minZ, maxZ)
{
	foreach(trigger in triggers)
	{
		if(self istouchingswept(trigger, minZ, maxZ))
		{
			return 1;
		}
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: is_touching_any_trigger_key_value
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x37A0
	Size: 0x60
	Parameters: 4
	Flags: None
	Line Number: 1293
*/
function is_touching_any_trigger_key_value(value, key, minZ, maxZ)
{
	return self is_touching_any_trigger(GetEntArray(value, key), minZ, maxZ);
}

/*
	Name: should_be_reset
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x3808
	Size: 0x1E0
	Parameters: 3
	Flags: None
	Line Number: 1308
*/
function should_be_reset(minZ, maxZ, testHurtTriggers)
{
	if(self.visuals[0] is_touching_any_trigger_key_value("minefield", "targetname", minZ, maxZ))
	{
		return 1;
	}
	if(isdefined(testHurtTriggers) && testHurtTriggers && self.visuals[0] is_touching_any_trigger_key_value("trigger_hurt", "classname", minZ, maxZ))
	{
		return 1;
	}
	if(self.visuals[0] is_touching_any_trigger(level.oob_triggers, minZ, maxZ))
	{
		return 1;
	}
	Elevators = GetEntArray("script_elevator", "targetname");
	foreach(elevator in Elevators)
	{
		/#
			Assert(isdefined(elevator.occupy_volume));
		#/
		if(self.visuals[0] istouchingswept(elevator.occupy_volume, minZ, maxZ))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: pickup_timeout
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x39F0
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 1346
*/
function pickup_timeout(minZ, maxZ)
{
	self endon("pickup_object");
	self endon("reset");
	wait(0.05);
	if(self should_be_reset(minZ, maxZ, 1))
	{
		self thread return_home();
		return;
	}
	if(isdefined(self.pickupTimeoutOverride))
	{
		self thread [[self.pickupTimeoutOverride]]();
	}
	else if(isdefined(self.autoResetTime))
	{
		wait(self.autoResetTime);
		if(!isdefined(self.carrier))
		{
			self thread return_home();
		}
	}
}

/*
	Name: take_object
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x3AC0
	Size: 0x2F0
	Parameters: 1
	Flags: None
	Line Number: 1380
*/
function take_object(object)
{
	if(isdefined(object.visibleCarrierModel))
	{
		self weapons::detach_all_weapons();
	}
	shouldEnableWeapon = 1;
	if(isdefined(object.carryWeapon) && !isdefined(self.player_disconnected))
	{
		shouldEnableWeapon = 0;
		self thread wait_take_carry_weapon(object.carryWeapon);
	}
	if(object.type == "carryObject")
	{
		if(isdefined(self.carryIcon))
		{
			self.carryIcon hud::destroyElem();
		}
		self.carryObject = undefined;
	}
	else if(object.type == "packObject")
	{
		if(isdefined(self.packIcon) && self.packIcon.size > 0)
		{
			for(i = 0; i < self.packIcon.size; i++)
			{
				if(isdefined(self.packIcon[i].script_string))
				{
					if(self.packIcon[i].script_string == object.packIcon)
					{
						elem = self.packIcon[i];
						ArrayRemoveValue(self.packIcon, elem);
						elem hud::destroyElem();
						self thread adjust_remaining_packIcons();
					}
				}
			}
		}
		ArrayRemoveValue(self.packObject, object);
	}
	if(!isalive(self) || isdefined(self.player_disconnected))
	{
		return;
	}
	self notify("drop_object");
	self.disallowVehicleUsage = 0;
	if(object.triggerType == "proximity")
	{
		self thread pickup_object_delay(object.trigger.origin);
	}
	if(isdefined(object.visibleCarrierModel))
	{
		self weapons::force_stowed_weapon_update();
	}
	if(!object.allowWeapons && shouldEnableWeapon)
	{
		self util::_enableWeapon();
	}
}

/*
	Name: wait_take_carry_weapon
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x3DB8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1450
*/
function wait_take_carry_weapon(weapon)
{
	self thread take_carry_weapon_on_death(weapon);
	wait(max(0, weapon.fireTime - 0.1));
	self take_carry_weapon(weapon);
}

/*
	Name: take_carry_weapon_on_death
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x3E28
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1467
*/
function take_carry_weapon_on_death(weapon)
{
	self endon("take_carry_weapon");
	self waittill("death");
	self take_carry_weapon(weapon);
	return;
}

/*
	Name: take_carry_weapon
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x3E70
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 1485
*/
function take_carry_weapon(weapon)
{
	self notify("take_carry_weapon");
	if(self hasweapon(weapon, 1))
	{
		ballWeapon = GetWeapon("ball");
		currWeapon = self GetCurrentWeapon();
		if(weapon == ballWeapon && currWeapon === ballWeapon)
		{
			self killstreaks::switch_to_last_non_killstreak_weapon(undefined, 1);
		}
		self setBlockWeaponPickup(weapon, 0);
		self TakeWeapon(weapon);
		self EnableWeaponCycling();
		if(level.gametype == "ball")
		{
			self EnableOffhandWeapons();
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: track_carrier
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x3F98
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 1518
*/
function track_carrier(object)
{
	level endon("game_ended");
	self endon("disconnect");
	self endon("death");
	self endon("drop_object");
	wait(0.05);
	while(isdefined(object.carrier) && object.carrier == self && isalive(self))
	{
		if(self IsOnGround())
		{
			trace = bullettrace(self.origin + VectorScale((0, 0, 1), 20), self.origin - VectorScale((0, 0, 1), 20), 0, undefined);
			if(trace["fraction"] < 1)
			{
				object.safeOrigin = trace["position"];
			}
		}
		wait(0.05);
	}
}

/*
	Name: manual_drop_think
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x40D0
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 1549
*/
function manual_drop_think()
{
	level endon("game_ended");
	self endon("disconnect");
	self endon("death");
	self endon("drop_object");
	while(self AttackButtonPressed() || self fragButtonPressed() || self SecondaryOffhandButtonPressed() || self meleeButtonPressed())
	{
		wait(0.05);
		continue;
		while(!self AttackButtonPressed() && !self fragButtonPressed() && !self SecondaryOffhandButtonPressed() && !self meleeButtonPressed())
		{
			wait(0.05);
		}
		if(isdefined(self.carryObject) && !self useButtonPressed())
		{
			self.carryObject thread set_dropped();
		}
	}
}

/*
	Name: create_use_object
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x4228
	Size: 0xA48
	Parameters: 7
	Flags: None
	Line Number: 1580
*/
function create_use_object(ownerTeam, trigger, visuals, offset, objectiveName, allowInitialHoldDelay, allowWeaponCyclingDuringHold)
{
	if(!isdefined(allowInitialHoldDelay))
	{
		allowInitialHoldDelay = 0;
	}
	if(!isdefined(allowWeaponCyclingDuringHold))
	{
		allowWeaponCyclingDuringHold = 0;
	}
	trigger.var_31e1665f = 1;
	useObject = spawn("script_model", trigger.origin);
	useObject.angles = trigger.angles;
	useObject.type = "useObject";
	useObject.curorigin = trigger.origin;
	useObject.entnum = trigger GetEntityNumber();
	useObject.keyObject = undefined;
	if(IsSubStr(trigger.classname, "use"))
	{
		useObject.triggerType = "use";
	}
	else
	{
		useObject.triggerType = "proximity";
	}
	useObject.trigger = trigger;
	useObject EnableLinkTo();
	useObject LinkTo(trigger);
	for(index = 0; index < visuals.size; index++)
	{
		visuals[index].baseOrigin = visuals[index].origin;
		visuals[index].baseAngles = visuals[index].angles;
	}
	useObject.visuals = visuals;
	useObject _set_team(ownerTeam);
	if(!isdefined(offset))
	{
		offset = (0, 0, 0);
	}
	useObject.offset3d = offset;
	useObject.newStyle = 0;
	if(isdefined(objectiveName))
	{
		useObject.newStyle = 1;
	}
	else
	{
		objectiveName = &"";
	}
	useObject.compassIcons = [];
	useObject.objId = [];
	if(!useObject.newStyle)
	{
		foreach(team in level.teams)
		{
			useObject.objId[team] = get_next_obj_id();
		}
		if(level.teambased)
		{
			foreach(team in level.teams)
			{
				if(SessionModeIsCampaignGame())
				{
					objective_add(useObject.objId["allies"], "active", useObject.curorigin, objectiveName);
					break;
				}
				else
				{
					objective_add(useObject.objId[team], "invisible", useObject.curorigin, objectiveName);
				}
				objective_team(useObject.objId[team], team);
			}
		}
		else
		{
			objective_add(useObject.objId[level.nonTeamBasedTeam], "invisible", useObject.curorigin, objectiveName);
		}
	}
	useObject.objectiveId = get_next_obj_id();
	if(useObject.newStyle)
	{
		if(SessionModeIsCampaignGame())
		{
			objective_add(useObject.objectiveId, "invisible", useObject, objectiveName);
			useObject.keepWeapon = 1;
		}
		else
		{
			objective_add(useObject.objectiveId, "invisible", useObject, objectiveName);
			useObject.keepWeapon = 1;
		}
	}
	if(!useObject.newStyle)
	{
		if(level.teambased)
		{
			foreach(team in level.teams)
			{
				useObject.objPoints[team] = objPoints::create("objpoint_" + team + "_" + useObject.entnum, useObject.curorigin + offset, team, undefined);
				useObject.objPoints[team].alpha = 0;
			}
		}
		else
		{
			useObject.objPoints[level.nonTeamBasedTeam] = objPoints::create("objpoint_allies_" + useObject.entnum, useObject.curorigin + offset, "all", undefined);
			useObject.objPoints[level.nonTeamBasedTeam].alpha = 0;
		}
	}
	useObject.interactTeam = "none";
	useObject.worldIcons = [];
	useObject.visibleTeam = "none";
	useObject.worldIsWaypoint = [];
	useObject.worldIcons_disabled = [];
	useObject.onUse = undefined;
	useObject.onCantUse = undefined;
	useObject.useText = "default";
	useObject.useTime = 10000;
	useObject clear_progress();
	useObject.decayProgress = 0;
	if(useObject.triggerType == "proximity")
	{
		useObject.numTouching["neutral"] = 0;
		useObject.numTouching["none"] = 0;
		useObject.touchList["neutral"] = [];
		useObject.touchList["none"] = [];
		foreach(team in level.teams)
		{
			useObject.numTouching[team] = 0;
			useObject.touchList[team] = [];
		}
		useObject.teamUseTimes = [];
		useObject.teamUseTexts = [];
		useObject.useRate = 0;
		useObject.claimTeam = "none";
		useObject.claimPlayer = undefined;
		useObject.lastClaimTeam = "none";
		useObject.lastClaimTime = 0;
		useObject.claimGracePeriod = 1;
		useObject.mustMaintainClaim = 0;
		useObject.canContestClaim = 0;
		useObject thread use_object_prox_think();
	}
	else
	{
		useObject.useRate = 1;
		useObject thread use_object_use_think(!allowInitialHoldDelay, !allowWeaponCyclingDuringHold);
	}
	return useObject;
}

/*
	Name: set_key_object
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x4C78
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 1740
*/
function set_key_object(object)
{
	if(!isdefined(object))
	{
		self.keyObject = undefined;
		return;
	}
	if(!isdefined(self.keyObject))
	{
		self.keyObject = [];
	}
	self.keyObject[self.keyObject.size] = object;
}

/*
	Name: has_key_object
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x4CD0
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 1764
*/
function has_key_object(use)
{
	if(!isdefined(use.keyObject))
	{
		return 0;
	}
	for(x = 0; x < use.keyObject.size; x++)
	{
		if(isdefined(self.carryObject) && self.carryObject == use.keyObject[x])
		{
			return 1;
			continue;
		}
		if(isdefined(self.packObject))
		{
			for(i = 0; i < self.packObject.size; i++)
			{
				if(self.packObject[i] == use.keyObject[x])
				{
					return 1;
				}
			}
		}
	}
	return 0;
}

/*
	Name: use_object_use_think
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x4DD0
	Size: 0x388
	Parameters: 2
	Flags: None
	Line Number: 1801
*/
function use_object_use_think(disableInitialHoldDelay, disableWeaponCyclingDuringHold)
{
	self.trigger endon("destroyed");
	if(self.useTime > 0 && disableInitialHoldDelay)
	{
		self.trigger function_58dfa989();
	}
	while(1)
	{
		self.trigger waittill("trigger", player);
		if(level.gameended)
		{
			continue;
		}
		if(!isalive(player))
		{
			continue;
		}
		if(!self can_interact_with(player))
		{
			continue;
		}
		if(player IsInVehicle())
		{
			continue;
		}
		if(isdefined(self.keyObject) && !player has_key_object(self))
		{
			if(isdefined(self.onCantUse))
			{
				self [[self.onCantUse]](player);
				continue;
			}
		}
		if(isdefined(self.canInteractWithPlayer) && ![[self.canInteractWithPlayer]](player))
		{
			while(isdefined(player) && player istouching(self.trigger) && player useButtonPressed() && isdefined(self.canInteractWithPlayer) && ![[self.canInteractWithPlayer]](player))
			{
				wait(0.05);
			}
			if(isdefined(player) && player istouching(self.trigger) && player useButtonPressed() && isdefined(self.canInteractWithPlayer) && [[self.canInteractWithPlayer]](player))
			{
				continue;
			}
			else
			{
			}
		}
		result = 1;
		if(self.useTime > 0)
		{
			if(isdefined(self.onBeginUse))
			{
				if(isdefined(self.classObj))
				{
					onBeginUse(self.classObj);
				}
				else
				{
					self [[self.onBeginUse]](player);
				}
			}
			team = player.pers["team"];
			result = self use_hold_think(player, disableWeaponCyclingDuringHold);
			if(isdefined(self.onEndUse))
			{
				self [[self.onEndUse]](team, player, result);
			}
		}
		if(!(isdefined(result) && result))
		{
			continue;
		}
		if(isdefined(self.onUse))
		{
			if(isdefined(self.onUse_thread) && self.onUse_thread)
			{
				self thread use_object_OnUse(player);
			}
			else
			{
				self use_object_OnUse(player);
			}
		}
	}
}

/*
	Name: use_object_OnUse
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x5160
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1898
*/
function use_object_OnUse(player)
{
	level endon("game_ended");
	self.trigger endon("destroyed");
	if(isdefined(self.classObj))
	{
		onUse(self.classObj);
	}
	else
	{
		self [[self.onUse]](player);
	}
}

/*
	Name: get_earliest_claim_player
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x51D0
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 1922
*/
function get_earliest_claim_player()
{
	/#
		Assert(self.claimTeam != "Dev Block strings are not supported");
	#/
	team = self.claimTeam;
	earliestPlayer = self.claimPlayer;
	if(self.touchList[team].size > 0)
	{
		earliestTime = undefined;
		players = getArrayKeys(self.touchList[team]);
		for(index = 0; index < players.size; index++)
		{
			touchdata = self.touchList[team][players[index]];
			if(!isdefined(earliestTime) || touchdata.startTime < earliestTime)
			{
				earliestPlayer = touchdata.player;
				earliestTime = touchdata.startTime;
			}
		}
	}
	return earliestPlayer;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: use_object_prox_think
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x5328
	Size: 0x740
	Parameters: 0
	Flags: None
	Line Number: 1957
*/
function use_object_prox_think()
{
	level endon("game_ended");
	self.trigger endon("destroyed");
	self thread prox_trigger_think();
	while(1)
	{
		if(self.useTime && self.curProgress >= self.useTime)
		{
			self clear_progress();
			creditPlayer = get_earliest_claim_player();
			if(isdefined(self.onEndUse))
			{
				self [[self.onEndUse]](self get_claim_team(), creditPlayer, isdefined(creditPlayer));
			}
			if(isdefined(creditPlayer) && isdefined(self.onUse))
			{
				self [[self.onUse]](creditPlayer);
			}
			if(!self.mustMaintainClaim)
			{
				self set_claim_team("none");
				self.claimPlayer = undefined;
			}
		}
		if(self.claimTeam != "none")
		{
			if(self use_object_locked_for_team(self.claimTeam))
			{
				if(isdefined(self.onEndUse))
				{
					self [[self.onEndUse]](self get_claim_team(), self.claimPlayer, 0);
				}
				self set_claim_team("none");
				self.claimPlayer = undefined;
				self clear_progress();
			}
			else if(self.useTime && (!self.mustMaintainClaim || self get_owner_team() != self get_claim_team()))
			{
				if(self.decayProgress && !self.numTouching[self.claimTeam])
				{
					if(isdefined(self.claimPlayer))
					{
						if(isdefined(self.onEndUse))
						{
							self [[self.onEndUse]](self get_claim_team(), self.claimPlayer, 0);
						}
						self.claimPlayer = undefined;
					}
					decayScale = 0;
					if(self.decayTime)
					{
						decayScale = self.useTime / self.decayTime;
					}
					self.curProgress = self.curProgress - 50 * self.useRate * decayScale;
					if(self.curProgress <= 0)
					{
						self clear_progress();
					}
					self update_current_progress();
					if(isdefined(self.onUseUpdate))
					{
						self [[self.onUseUpdate]](self get_claim_team(), self.curProgress / self.useTime, 50 * self.useRate * decayScale / self.useTime);
					}
					if(self.curProgress == 0)
					{
						self set_claim_team("none");
					}
				}
				else if(!self.numTouching[self.claimTeam])
				{
					if(isdefined(self.onEndUse))
					{
						self [[self.onEndUse]](self get_claim_team(), self.claimPlayer, 0);
					}
					self set_claim_team("none");
					self.claimPlayer = undefined;
				}
				else
				{
					self.curProgress = self.curProgress + 50 * self.useRate;
					self update_current_progress();
					if(isdefined(self.onUseUpdate))
					{
						self [[self.onUseUpdate]](self get_claim_team(), self.curProgress / self.useTime, 50 * self.useRate / self.useTime);
					}
				}
			}
			else if(!self.mustMaintainClaim)
			{
				if(isdefined(self.onUse))
				{
					self [[self.onUse]](self.claimPlayer);
				}
				if(!self.mustMaintainClaim)
				{
					self set_claim_team("none");
					self.claimPlayer = undefined;
				}
			}
			else if(!self.numTouching[self.claimTeam])
			{
				if(isdefined(self.onUnoccupied))
				{
					self [[self.onUnoccupied]]();
				}
				self set_claim_team("none");
				self.claimPlayer = undefined;
			}
			else if(self.canContestClaim)
			{
				numOther = get_num_touching_except_team(self.claimTeam);
				if(numOther > 0)
				{
					if(isdefined(self.onContested))
					{
						self [[self.onContested]]();
					}
					self set_claim_team("none");
					self.claimPlayer = undefined;
				}
			}
		}
		else if(self.curProgress > 0 && GetTime() - self.lastClaimTime > self.claimGracePeriod * 1000)
		{
			self clear_progress();
		}
		if(self.mustMaintainClaim && self get_owner_team() != "none")
		{
			if(!self.numTouching[self get_owner_team()])
			{
				if(isdefined(self.onUnoccupied))
				{
					self [[self.onUnoccupied]]();
				}
			}
			else if(self.canContestClaim && self.lastClaimTeam != "none" && self.numTouching[self.lastClaimTeam])
			{
				numOther = get_num_touching_except_team(self.lastClaimTeam);
				if(numOther == 0)
				{
					if(isdefined(self.onUncontested))
					{
						self [[self.onUncontested]](self.lastClaimTeam);
					}
				}
			}
		}
		wait(0.05);
		hostmigration::waitTillHostMigrationDone();
	}
}

/*
	Name: use_object_locked_for_team
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x5A70
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 2120
*/
function use_object_locked_for_team(team)
{
	if(isdefined(self.teamLock) && isdefined(level.teams[team]))
	{
		return self.teamLock[team];
	}
	return 0;
}

/*
	Name: can_claim
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x5AB8
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 2139
*/
function can_claim(player)
{
	if(isdefined(self.carrier))
	{
		return 0;
	}
	if(self.canContestClaim)
	{
		numOther = get_num_touching_except_team(player.pers["team"]);
		if(numOther != 0)
		{
			return 0;
		}
	}
	if(!isdefined(self.keyObject) || player has_key_object(self))
	{
		return 1;
	}
	return 0;
}

/*
	Name: prox_trigger_think
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x5B58
	Size: 0x3D0
	Parameters: 0
	Flags: None
	Line Number: 2170
*/
function prox_trigger_think()
{
	level endon("game_ended");
	self.trigger endon("destroyed");
	entityNumber = self.entnum;
	if(!isdefined(self.trigger.remote_control_player_can_trigger))
	{
		self.trigger.remote_control_player_can_trigger = 0;
	}
	while(1)
	{
		self.trigger waittill("trigger", player);
		if(!isPlayer(player))
		{
			continue;
		}
		if(player.using_map_vehicle === 1)
		{
			if(!isdefined(self.allow_map_vehicles) || self.allow_map_vehicles == 0)
			{
				continue;
			}
		}
		if(!isalive(player) || self use_object_locked_for_team(player.pers["team"]))
		{
			continue;
		}
		if(isdefined(player.laststand) && player.laststand)
		{
			continue;
		}
		if(player.spawntime == GetTime())
		{
			continue;
		}
		if(self.trigger.remote_control_player_can_trigger == 0)
		{
			if(player IsRemoteControlling() || player util::isUsingRemote())
			{
				continue;
			}
		}
		if(isdefined(player.selectingLocation) && player.selectingLocation)
		{
			continue;
		}
		if(player IsWeaponViewOnlyLinked())
		{
			continue;
		}
		if(self is_excluded(player))
		{
			continue;
		}
		if(isdefined(self.canUseObject) && ![[self.canUseObject]](player))
		{
			continue;
		}
		if(self can_interact_with(player) && self.claimTeam == "none")
		{
			if(self can_claim(player))
			{
				set_claim_team(player.pers["team"]);
				self.claimPlayer = player;
				relativeTeam = self get_relative_team(player.pers["team"]);
				if(isdefined(self.teamUseTimes[relativeTeam]))
				{
					self.useTime = self.teamUseTimes[relativeTeam];
				}
				if(self.useTime && isdefined(self.onBeginUse))
				{
					self [[self.onBeginUse]](self.claimPlayer);
				}
			}
			else if(isdefined(self.onCantUse))
			{
				self [[self.onCantUse]](player);
			}
		}
		if(isalive(player) && !isdefined(player.touchTriggers[entityNumber]))
		{
			player thread trigger_touch_think(self);
		}
	}
}

/*
	Name: is_excluded
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x5F30
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 2266
*/
function is_excluded(player)
{
	if(!isdefined(self.exclusions))
	{
		return 0;
	}
	foreach(exclusion in self.exclusions)
	{
		if(exclusion istouching(player))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: clear_progress
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x5FF0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 2292
*/
function clear_progress()
{
	self.curProgress = 0;
	self update_current_progress();
	if(isdefined(self.onUseClear))
	{
		self [[self.onUseClear]]();
	}
}

/*
	Name: set_claim_team
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x6038
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 2312
*/
function set_claim_team(newTeam)
{
	/#
		Assert(newTeam != self.claimTeam);
	#/
	if(self.claimTeam == "none" && GetTime() - self.lastClaimTime > self.claimGracePeriod * 1000)
	{
		self clear_progress();
	}
	else if(newTeam != "none" && newTeam != self.lastClaimTeam)
	{
		self clear_progress();
	}
	self.lastClaimTeam = self.claimTeam;
	self.lastClaimTime = GetTime();
	self.claimTeam = newTeam;
	self update_use_rate();
}

/*
	Name: get_claim_team
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x6138
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 2341
*/
function get_claim_team()
{
	return self.claimTeam;
}

/*
	Name: continue_trigger_touch_think
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x6150
	Size: 0x228
	Parameters: 2
	Flags: None
	Line Number: 2356
*/
function continue_trigger_touch_think(team, object)
{
	if(!isalive(self))
	{
		return 0;
	}
	if(self.using_map_vehicle === 1)
	{
		if(!isdefined(object.allow_map_vehicles) || object.allow_map_vehicles == 0)
		{
			return 0;
		}
	}
	else if(!isdefined(object) || !isdefined(object.trigger) || !isdefined(object.trigger.remote_control_player_can_trigger) || object.trigger.remote_control_player_can_trigger == 0)
	{
		if(self IsInVehicle())
		{
			return 0;
		}
		else if(self IsRemoteControlling() || self util::isUsingRemote())
		{
			return 0;
		}
	}
	else if(self IsInVehicle() && (!(self IsRemoteControlling() || self util::isUsingRemote())))
	{
		return 0;
	}
	if(self use_object_locked_for_team(team))
	{
		return 0;
	}
	if(isdefined(self.laststand) && self.laststand)
	{
		return 0;
	}
	if(!isdefined(object) || !isdefined(object.trigger))
	{
		return 0;
	}
	if(!object.trigger IsTriggerEnabled())
	{
		return 0;
	}
	if(!self istouching(object.trigger))
	{
		return 0;
	}
	return 1;
}

/*
	Name: trigger_touch_think
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x6380
	Size: 0x3A8
	Parameters: 1
	Flags: None
	Line Number: 2417
*/
function trigger_touch_think(object)
{
	team = self.pers["team"];
	score = 1;
	object.numTouching[team] = object.numTouching[team] + score;
	if(object.useTime)
	{
		object update_use_rate();
	}
	touchName = "player" + self.clientid;
	struct = spawnstruct();
	struct.player = self;
	struct.startTime = GetTime();
	object.touchList[team][touchName] = struct;
	Objective_SetPlayerUsing(object.objectiveId, self);
	self.touchTriggers[object.entnum] = object.trigger;
	if(isdefined(object.onTouchUse))
	{
		object [[object.onTouchUse]](self);
	}
	while(self continue_trigger_touch_think(team, object))
	{
		if(object.useTime)
		{
			self update_prox_bar(object, 0);
		}
		wait(0.05);
	}
	if(isdefined(self))
	{
		if(object.useTime)
		{
			self update_prox_bar(object, 1);
		}
		self.touchTriggers[object.entnum] = undefined;
		Objective_ClearPlayerUsing(object.objectiveId, self);
	}
	if(level.gameended)
	{
		return;
	}
	object.touchList[team][touchName] = undefined;
	object.numTouching[team] = object.numTouching[team] - score;
	if(object.numTouching[team] < 1)
	{
		object.numTouching[team] = 0;
	}
	if(object.useTime)
	{
		if(object.numTouching[team] <= 0 && object.curProgress >= object.useTime)
		{
			object.curProgress = object.useTime - 1;
			object update_current_progress();
		}
	}
	if(isdefined(self) && isdefined(object.onEndTouchUse))
	{
		object [[object.onEndTouchUse]](self);
	}
	object update_use_rate();
}

/*
	Name: update_prox_bar
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x6730
	Size: 0x5B0
	Parameters: 2
	Flags: None
	Line Number: 2489
*/
function update_prox_bar(object, forceRemove)
{
	if(object.newStyle)
	{
		return;
	}
	if(!forceRemove && object.decayProgress)
	{
		if(!object can_interact_with(self))
		{
			if(isdefined(self.proxBar))
			{
				self.proxBar hud::hideElem();
			}
			if(isdefined(self.proxBarText))
			{
				self.proxBarText hud::hideElem();
				return;
			}
		}
		else if(!isdefined(self.proxBar))
		{
			self.proxBar = hud::createPrimaryProgressBar();
			self.proxBar.lastUseRate = -1;
		}
		if(self.pers["team"] == object.claimTeam)
		{
			if(self.proxBar.bar.color != (1, 1, 1))
			{
				self.proxBar.bar.color = (1, 1, 1);
				self.proxBar.lastUseRate = -1;
			}
		}
		else if(self.proxBar.bar.color != (1, 0, 0))
		{
			self.proxBar.bar.color = (1, 0, 0);
			self.proxBar.lastUseRate = -1;
		}
	}
	else if(forceRemove || !object can_interact_with(self) || self.pers["team"] != object.claimTeam)
	{
		if(isdefined(self.proxBar))
		{
			self.proxBar hud::hideElem();
		}
		if(isdefined(self.proxBarText))
		{
			self.proxBarText hud::hideElem();
			return;
		}
	}
	if(!isdefined(self.proxBar))
	{
		self.proxBar = hud::createPrimaryProgressBar();
		self.proxBar.lastUseRate = -1;
		self.proxBar.lastHostMigrationState = 0;
	}
	if(self.proxBar.hidden)
	{
		self.proxBar hud::showElem();
		self.proxBar.lastUseRate = -1;
		self.proxBar.lastHostMigrationState = 0;
	}
	if(!isdefined(self.proxBarText))
	{
		self.proxBarText = hud::createPrimaryProgressBarText();
		self.proxBarText setText(object.useText);
	}
	if(self.proxBarText.hidden)
	{
		self.proxBarText hud::showElem();
		self.proxBarText setText(object.useText);
	}
	if(self.proxBar.lastUseRate != object.useRate || self.proxBar.lastHostMigrationState != isdefined(level.hostMigrationTimer))
	{
		if(object.curProgress > object.useTime)
		{
			object.curProgress = object.useTime;
		}
		if(object.decayProgress && self.pers["team"] != object.claimTeam)
		{
			if(object.curProgress > 0)
			{
				progress = object.curProgress / object.useTime;
				rate = 1000 / object.useTime * object.useRate * -1;
				if(isdefined(level.hostMigrationTimer))
				{
					rate = 0;
				}
				self.proxBar hud::updateBar(progress, rate);
			}
		}
		else
		{
			progress = object.curProgress / object.useTime;
			rate = 1000 / object.useTime * object.useRate;
			if(isdefined(level.hostMigrationTimer))
			{
				rate = 0;
			}
			self.proxBar hud::updateBar(progress, rate);
		}
		self.proxBar.lastHostMigrationState = isdefined(level.hostMigrationTimer);
		self.proxBar.lastUseRate = object.useRate;
	}
}

/*
	Name: get_num_touching_except_team
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x6CE8
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 2606
*/
function get_num_touching_except_team(ignoreTeam)
{
	numTouching = 0;
	foreach(team in level.teams)
	{
		if(ignoreTeam == team)
		{
			continue;
		}
		numTouching = numTouching + self.numTouching[team];
	}
	return numTouching;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: update_use_rate
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x6DB0
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 2631
*/
function update_use_rate()
{
	numClaimants = self.numTouching[self.claimTeam];
	numOther = 0;
	numOther = get_num_touching_except_team(self.claimTeam);
	self.useRate = 0;
	if(self.decayProgress)
	{
		if(numClaimants && !numOther)
		{
			self.useRate = numClaimants;
		}
		else if(!numClaimants && numOther)
		{
			self.useRate = numOther;
		}
		else if(!numClaimants && !numOther)
		{
			self.useRate = 0;
		}
	}
	else if(numClaimants && !numOther)
	{
		self.useRate = numClaimants;
	}
	if(isdefined(self.onUpdateUseRate))
	{
		self [[self.onUpdateUseRate]]();
	}
}

/*
	Name: use_hold_think
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x6EC8
	Size: 0x498
	Parameters: 2
	Flags: None
	Line Number: 2672
*/
function use_hold_think(player, disableWeaponCyclingDuringHold)
{
	player notify("use_hold");
	if(!(isdefined(self.dontLinkPlayerToTrigger) && self.dontLinkPlayerToTrigger))
	{
		if(!SessionModeIsMultiplayerGame())
		{
			gameobject_link = util::spawn_model("tag_origin", player.origin, player.angles);
			player playerLinkTo(gameobject_link);
		}
		else
		{
			player playerLinkTo(self.trigger);
			player PlayerLinkedOffsetEnable();
		}
	}
	player ClientClaimTrigger(self.trigger);
	player.claimTrigger = self.trigger;
	useWeapon = self.useWeapon;
	if(isdefined(useWeapon))
	{
		player GiveWeapon(useWeapon);
		player SetWeaponAmmoStock(useWeapon, 0);
		player SetWeaponAmmoClip(useWeapon, 0);
		player SwitchToWeapon(useWeapon);
	}
	else if(self.keepWeapon !== 1)
	{
		player util::_disableWeapon();
	}
	self clear_progress();
	self.inUse = 1;
	self.useRate = 0;
	Objective_SetPlayerUsing(self.objectiveId, player);
	player thread personal_use_bar(self);
	if(disableWeaponCyclingDuringHold)
	{
		player DisableWeaponCycling();
		enableWeaponCyclingAfterHold = 1;
	}
	result = use_hold_think_loop(player);
	self.inUse = 0;
	if(isdefined(player))
	{
		if(enableWeaponCyclingAfterHold === 1)
		{
			player EnableWeaponCycling();
		}
		Objective_ClearPlayerUsing(self.objectiveId, player);
		self clear_progress();
		if(isdefined(player.attachedUseModel))
		{
			player Detach(player.attachedUseModel, "tag_inhand");
			player.attachedUseModel = undefined;
		}
		player notify("done_using");
		if(isdefined(useWeapon))
		{
			player thread take_use_weapon(useWeapon);
		}
		player.claimTrigger = undefined;
		player ClientReleaseTrigger(self.trigger);
		if(isdefined(useWeapon))
		{
			player killstreaks::switch_to_last_non_killstreak_weapon();
		}
		else if(self.keepWeapon !== 1)
		{
			player util::_enableWeapon();
		}
		if(!(isdefined(self.dontLinkPlayerToTrigger) && self.dontLinkPlayerToTrigger))
		{
			player Unlink();
		}
		if(!isalive(player))
		{
			player.killedInUse = 1;
		}
		if(level.gameended)
		{
			player WaitThenFreezePlayerControlsIfGameEndedStill();
		}
	}
	if(isdefined(gameobject_link))
	{
		gameobject_link delete();
	}
	return result;
}

/*
	Name: WaitThenFreezePlayerControlsIfGameEndedStill
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x7368
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 2772
*/
function WaitThenFreezePlayerControlsIfGameEndedStill(wait_time)
{
	if(!isdefined(wait_time))
	{
		wait_time = 1;
	}
	player = self;
	wait(wait_time);
	if(isdefined(player) && level.gameended)
	{
		player FreezeControls(1);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: take_use_weapon
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x73E0
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 2798
*/
function take_use_weapon(useWeapon)
{
	self endon("use_hold");
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	while(self GetCurrentWeapon() == useWeapon && !self.throwingGrenade)
	{
		wait(0.05);
	}
	self TakeWeapon(useWeapon);
}

/*
	Name: continue_hold_think_loop
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x7470
	Size: 0x208
	Parameters: 4
	Flags: None
	Line Number: 2821
*/
function continue_hold_think_loop(player, waitForWeapon, timedOut, useTime)
{
	maxWaitTime = 1.5;
	if(!isalive(player))
	{
		return 0;
	}
	if(isdefined(player.laststand) && player.laststand)
	{
		return 0;
	}
	if(self.curProgress >= useTime)
	{
		return 0;
	}
	if(!player useButtonPressed())
	{
		return 0;
	}
	if(player.throwingGrenade)
	{
		return 0;
	}
	if(player IsInVehicle())
	{
		return 0;
	}
	if(player IsRemoteControlling() || player util::isUsingRemote())
	{
		return 0;
	}
	if(isdefined(player.selectingLocation) && player.selectingLocation)
	{
		return 0;
	}
	if(player IsWeaponViewOnlyLinked())
	{
		return 0;
	}
	if(!player istouching(self.trigger))
	{
		if(!isdefined(player.cursorHintEnt) || player.cursorHintEnt != self)
		{
			return 0;
		}
	}
	if(!self.useRate && !waitForWeapon)
	{
		return 0;
	}
	if(waitForWeapon && timedOut > maxWaitTime)
	{
		return 0;
	}
	if(isdefined(self.interrupted) && self.interrupted)
	{
		return 0;
	}
	if(level.gameended)
	{
		return 0;
	}
	return 1;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: update_current_progress
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x7680
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 2897
*/
function update_current_progress()
{
	if(self.useTime)
	{
		if(isdefined(self.curProgress))
		{
			progress = float(self.curProgress) / self.useTime;
		}
		else
		{
			progress = 0;
		}
		Objective_SetProgress(self.objectiveId, math::clamp(progress, 0, 1));
	}
}

/*
	Name: use_hold_think_loop
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x7718
	Size: 0x1B0
	Parameters: 1
	Flags: None
	Line Number: 2923
*/
function use_hold_think_loop(player)
{
	self endon("disabled");
	useWeapon = self.useWeapon;
	waitForWeapon = 1;
	timedOut = 0;
	useTime = self.useTime;
	while(self continue_hold_think_loop(player, waitForWeapon, timedOut, useTime))
	{
		timedOut = timedOut + 0.05;
		if(!isdefined(useWeapon) || player GetCurrentWeapon() == useWeapon)
		{
			self.curProgress = self.curProgress + 50 * self.useRate;
			self update_current_progress();
			self.useRate = 1;
			waitForWeapon = 0;
		}
		else
		{
			self.useRate = 0;
		}
		if(SessionModeIsMultiplayerGame())
		{
			if(self.curProgress >= useTime)
			{
				return 1;
			}
			wait(0.05);
		}
		else
		{
			wait(0.05);
			if(self.curProgress >= useTime)
			{
				util::wait_network_frame();
				return 1;
			}
		}
		hostmigration::waitTillHostMigrationDone();
	}
	return 0;
}

/*
	Name: personal_use_bar
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x78D0
	Size: 0x388
	Parameters: 1
	Flags: None
	Line Number: 2976
*/
function personal_use_bar(object)
{
	self endon("disconnect");
	if(object.newStyle)
	{
		return;
	}
	if(isdefined(self.useBar))
	{
		return;
	}
	self.useBar = hud::createPrimaryProgressBar();
	self.useBarText = hud::createPrimaryProgressBarText();
	self.useBarText setText(object.useText);
	useTime = object.useTime;
	lastRate = -1;
	lastHostMigrationState = isdefined(level.hostMigrationTimer);
	while(isalive(self) && object.inUse && !level.gameended)
	{
		if(lastRate != object.useRate || lastHostMigrationState != isdefined(level.hostMigrationTimer))
		{
			if(object.curProgress > useTime)
			{
				object.curProgress = useTime;
			}
			if(object.decayProgress && self.pers["team"] != object.claimTeam)
			{
				if(object.curProgress > 0)
				{
					progress = object.curProgress / useTime;
					rate = 1000 / useTime * object.useRate * -1;
					if(isdefined(level.hostMigrationTimer))
					{
						rate = 0;
					}
					self.proxBar hud::updateBar(progress, rate);
				}
			}
			else
			{
				progress = object.curProgress / useTime;
				rate = 1000 / useTime * object.useRate;
				if(isdefined(level.hostMigrationTimer))
				{
					rate = 0;
				}
				self.useBar hud::updateBar(progress, rate);
			}
			if(!object.useRate)
			{
				self.useBar hud::hideElem();
				self.useBarText hud::hideElem();
			}
			else
			{
				self.useBar hud::showElem();
				self.useBarText hud::showElem();
			}
		}
		lastRate = object.useRate;
		lastHostMigrationState = isdefined(level.hostMigrationTimer);
		wait(0.05);
	}
	self.useBar hud::destroyElem();
	self.useBarText hud::destroyElem();
	return;
}

/*
	Name: update_trigger
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x7C60
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 3054
*/
function update_trigger()
{
	if(self.triggerType != "use")
	{
		return;
	}
	if(self.interactTeam == "none")
	{
		self.trigger TriggerEnable(0);
	}
	else if(self.interactTeam == "any" || !level.teambased)
	{
		self.trigger TriggerEnable(1);
		self.trigger SetTeamForTrigger("none");
	}
	else if(self.interactTeam == "friendly")
	{
		self.trigger TriggerEnable(1);
		if(isdefined(level.teams[self.ownerTeam]))
		{
			self.trigger SetTeamForTrigger(self.ownerTeam);
		}
		else
		{
			self.trigger TriggerEnable(0);
		}
	}
	else if(self.interactTeam == "enemy")
	{
		self.trigger TriggerEnable(1);
		self.trigger SetExcludeTeamForTrigger(self.ownerTeam);
	}
}

/*
	Name: update_objective
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x7E00
	Size: 0x290
	Parameters: 0
	Flags: None
	Line Number: 3098
*/
function update_objective()
{
	if(!self.newStyle)
	{
		return;
	}
	objective_team(self.objectiveId, self.ownerTeam);
	if(self.visibleTeam == "any")
	{
		objective_state(self.objectiveId, "active");
		objective_visibleteams(self.objectiveId, level.spawnsystem.iSPAWN_TEAMMASK["all"]);
	}
	else if(self.visibleTeam == "friendly")
	{
		objective_state(self.objectiveId, "active");
		objective_visibleteams(self.objectiveId, level.spawnsystem.iSPAWN_TEAMMASK[self.ownerTeam]);
	}
	else if(self.visibleTeam == "enemy")
	{
		objective_state(self.objectiveId, "active");
		~;
		objective_visibleteams(self.objectiveId, level.spawnsystem.iSPAWN_TEAMMASK["all"] & level.spawnsystem.iSPAWN_TEAMMASK[self.ownerTeam]);
	}
	else
	{
		objective_state(self.objectiveId, "invisible");
		objective_visibleteams(self.objectiveId, 0);
	}
	if(self.type == "carryObject" || self.type == "packObject")
	{
		if(isalive(self.carrier))
		{
			Objective_OnEntity(self.objectiveId, self.carrier);
		}
		else if(isdefined(self.objectiveOnVisuals) && self.objectiveOnVisuals)
		{
			Objective_OnEntity(self.objectiveId, self.visuals[0]);
		}
		else
		{
			objective_clearentity(self.objectiveId);
		}
	}
}

/*
	Name: update_world_icons
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8098
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 3153
*/
function update_world_icons()
{
	if(self.visibleTeam == "any")
	{
		update_world_icon("friendly", 1);
		update_world_icon("enemy", 1);
	}
	else if(self.visibleTeam == "friendly")
	{
		update_world_icon("friendly", 1);
		update_world_icon("enemy", 0);
	}
	else if(self.visibleTeam == "enemy")
	{
		update_world_icon("friendly", 0);
		update_world_icon("enemy", 1);
	}
	else
	{
		update_world_icon("friendly", 0);
		update_world_icon("enemy", 0);
	}
}

/*
	Name: update_world_icon
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x81D0
	Size: 0x330
	Parameters: 2
	Flags: None
	Line Number: 3187
*/
function update_world_icon(relativeTeam, showIcon)
{
	if(self.newStyle)
	{
		return;
	}
	if(!isdefined(self.worldIcons[relativeTeam]))
	{
		showIcon = 0;
	}
	updateTeams = get_update_teams(relativeTeam);
	for(index = 0; index < updateTeams.size; index++)
	{
		if(!level.teambased && updateTeams[index] != level.nonTeamBasedTeam)
		{
			continue;
		}
		opName = "objpoint_" + updateTeams[index] + "_" + self.entnum;
		objPoint = objPoints::get_by_name(opName);
		objPoint notify("stop_flashing_thread");
		objPoint thread objPoints::stop_flashing();
		if(showIcon)
		{
			objPoint SetShader(self.worldIcons[relativeTeam], level.objPointSize, level.objPointSize);
			objPoint fadeOverTime(0.05);
			objPoint.alpha = objPoint.baseAlpha;
			objPoint.isShown = 1;
			isWaypoint = 1;
			if(isdefined(self.worldIsWaypoint[relativeTeam]))
			{
				isWaypoint = self.worldIsWaypoint[relativeTeam];
			}
			if(isdefined(self.compassIcons[relativeTeam]))
			{
				objPoint setWaypoint(isWaypoint, self.worldIcons[relativeTeam]);
			}
			else
			{
				objPoint setWaypoint(isWaypoint);
			}
			if(self.type == "carryObject" || self.type == "packObject")
			{
				if(isdefined(self.carrier) && !should_ping_object(relativeTeam))
				{
					objPoint SetTargetEnt(self.carrier);
				}
				else
				{
					objPoint ClearTargetEnt();
					continue;
				}
			}
		}
		objPoint fadeOverTime(0.05);
		objPoint.alpha = 0;
		objPoint.isShown = 0;
		objPoint ClearTargetEnt();
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: update_compass_icons
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8508
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 3259
*/
function update_compass_icons()
{
	if(self.visibleTeam == "any")
	{
		update_compass_icon("friendly", 1);
		update_compass_icon("enemy", 1);
	}
	else if(self.visibleTeam == "friendly")
	{
		update_compass_icon("friendly", 1);
		update_compass_icon("enemy", 0);
	}
	else if(self.visibleTeam == "enemy")
	{
		update_compass_icon("friendly", 0);
		update_compass_icon("enemy", 1);
	}
	else
	{
		update_compass_icon("friendly", 0);
		update_compass_icon("enemy", 0);
	}
}

/*
	Name: update_compass_icon
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8640
	Size: 0x270
	Parameters: 2
	Flags: None
	Line Number: 3293
*/
function update_compass_icon(relativeTeam, showIcon)
{
	if(self.newStyle)
	{
		return;
	}
	updateTeams = get_update_teams(relativeTeam);
	for(index = 0; index < updateTeams.size; index++)
	{
		showIconThisTeam = showIcon;
		if(!showIconThisTeam && should_show_compass_due_to_radar(updateTeams[index]))
		{
			showIconThisTeam = 1;
		}
		if(level.teambased)
		{
			objId = self.objId[updateTeams[index]];
		}
		else
		{
			objId = self.objId[level.nonTeamBasedTeam];
		}
		if(!isdefined(self.compassIcons[relativeTeam]) || !showIconThisTeam)
		{
			if(!SessionModeIsCampaignGame())
			{
				objective_state(objId, "invisible");
				continue;
			}
		}
		objective_icon(objId, self.compassIcons[relativeTeam]);
		if(!SessionModeIsCampaignGame())
		{
			objective_state(objId, "active");
		}
		if(self.type == "carryObject" || self.type == "packObject")
		{
			if(isalive(self.carrier) && !should_ping_object(relativeTeam))
			{
				Objective_OnEntity(objId, self.carrier);
				continue;
			}
			if(!SessionModeIsCampaignGame())
			{
				objective_clearentity(objId);
			}
			objective_position(objId, self.curorigin);
		}
	}
	return;
}

/*
	Name: hide_waypoint
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x88B8
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 3355
*/
function hide_waypoint(e_player)
{
	if(isdefined(e_player))
	{
		/#
			Assert(isPlayer(e_player), "Dev Block strings are not supported");
		#/
		Objective_SetInvisibleToPlayer(self.objectiveId, e_player);
	}
	else
	{
		Objective_SetInvisibleToAll(self.objectiveId);
	}
}

/*
	Name: show_waypoint
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8950
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 3380
*/
function show_waypoint(e_player)
{
	if(isdefined(e_player))
	{
		/#
			Assert(isPlayer(e_player), "Dev Block strings are not supported");
		#/
		Objective_SetVisibleToPlayer(self.objectiveId, e_player);
	}
	else
	{
		Objective_SetVisibleToAll(self.objectiveId);
		return;
	}
}

/*
	Name: should_ping_object
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x89E8
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 3406
*/
function should_ping_object(relativeTeam)
{
	if(relativeTeam == "friendly" && self.objIDPingFriendly)
	{
		return 1;
	}
	else if(relativeTeam == "enemy" && self.objIDPingEnemy)
	{
		return 1;
	}
	return 0;
}

/*
	Name: get_update_teams
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8A48
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 3429
*/
function get_update_teams(relativeTeam)
{
	updateTeams = [];
	if(level.teambased)
	{
		if(relativeTeam == "friendly")
		{
			foreach(team in level.teams)
			{
				if(self is_friendly_team(team))
				{
					updateTeams[updateTeams.size] = team;
				}
			}
		}
		else if(relativeTeam == "enemy")
		{
			foreach(team in level.teams)
			{
				if(!self is_friendly_team(team))
				{
					updateTeams[updateTeams.size] = team;
				}
			}
		}
	}
	else if(relativeTeam == "friendly")
	{
		updateTeams[updateTeams.size] = level.nonTeamBasedTeam;
	}
	else
	{
		updateTeams[updateTeams.size] = "axis";
	}
	return updateTeams;
}

/*
	Name: should_show_compass_due_to_radar
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8C18
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 3476
*/
function should_show_compass_due_to_radar(team)
{
	showCompass = 0;
	if(!isdefined(self.carrier))
	{
		return 0;
	}
	if(self.carrier hasPerk("specialty_gpsjammer") == 0)
	{
		if(killstreaks::HasUAV(team))
		{
			showCompass = 1;
		}
	}
	if(killstreaks::HasSatellite(team))
	{
		showCompass = 1;
	}
	return showCompass;
}

/*
	Name: update_visibility_according_to_radar
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8CC0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 3507
*/
function update_visibility_according_to_radar()
{
	self endon("death");
	self endon("carrier_cleared");
	while(1)
	{
		level waittill("radar_status_change");
		self update_compass_icons();
	}
}

/*
	Name: _set_team
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8D10
	Size: 0xB8
	Parameters: 1
	Flags: Private
	Line Number: 3528
*/
function private _set_team(team)
{
	self.ownerTeam = team;
	if(team != "any")
	{
		self.team = team;
		foreach(visual in self.visuals)
		{
			visual.team = team;
		}
	}
}

/*
	Name: set_owner_team
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8DD0
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 3551
*/
function set_owner_team(team)
{
	self _set_team(team);
	self update_trigger();
	self update_icons_and_objective();
}

/*
	Name: get_owner_team
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8E30
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 3568
*/
function get_owner_team()
{
	return self.ownerTeam;
}

/*
	Name: set_decay_time
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8E48
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 3583
*/
function set_decay_time(time)
{
	self.decayTime = Int(time * 1000);
}

/*
	Name: set_use_time
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8E88
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 3598
*/
function set_use_time(time)
{
	self.useTime = Int(time * 1000);
	return;
}

/*
	Name: set_use_text
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8EC8
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 3614
*/
function set_use_text(text)
{
	self.useText = text;
}

/*
	Name: set_team_use_time
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8EE8
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 3629
*/
function set_team_use_time(relativeTeam, time)
{
	self.teamUseTimes[relativeTeam] = Int(time * 1000);
	return;
}

/*
	Name: set_team_use_text
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8F38
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 3645
*/
function set_team_use_text(relativeTeam, text)
{
	self.teamUseTexts[relativeTeam] = text;
}

/*
	Name: set_use_hint_text
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8F68
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 3660
*/
function set_use_hint_text(text)
{
	self.trigger setHintString(text);
}

/*
	Name: allow_carry
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8FA0
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 3675
*/
function allow_carry(relativeTeam)
{
	allow_use(relativeTeam);
}

/*
	Name: allow_use
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x8FD0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 3690
*/
function allow_use(relativeTeam)
{
	self.interactTeam = relativeTeam;
	update_trigger();
}

/*
	Name: set_visible_team
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9008
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 3706
*/
function set_visible_team(relativeTeam)
{
	self.visibleTeam = relativeTeam;
	if(!tweakables::getTweakableValue("hud", "showobjicons"))
	{
		self.visibleTeam = "none";
	}
	update_icons_and_objective();
}

/*
	Name: set_model_visibility
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9078
	Size: 0x190
	Parameters: 1
	Flags: None
	Line Number: 3726
*/
function set_model_visibility(visibility)
{
	if(visibility)
	{
		for(index = 0; index < self.visuals.size; index++)
		{
			self.visuals[index] show();
			if(self.visuals[index].classname == "script_brushmodel" || self.visuals[index].classname == "script_model")
			{
				self.visuals[index] thread make_solid();
			}
		}
	}
	else
	{
		for(index = 0; index < self.visuals.size; index++)
		{
			self.visuals[index] ghost();
			if(self.visuals[index].classname == "script_brushmodel" || self.visuals[index].classname == "script_model")
			{
				self.visuals[index] notify("changing_solidness");
				self.visuals[index] notsolid();
			}
		}
		return;
	}
}

/*
	Name: make_solid
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9210
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 3764
*/
function make_solid()
{
	self endon("death");
	self notify("changing_solidness");
	self endon("changing_solidness");
	while(1)
	{
		for(i = 0; i < level.players.size; i++)
		{
			if(level.players[i] istouching(self))
			{
				break;
			}
		}
		if(i == level.players.size)
		{
			self solid();
			break;
		}
		wait(0.05);
	}
}

/*
	Name: set_carrier_visible
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x92D8
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 3797
*/
function set_carrier_visible(relativeTeam)
{
	self.carrierVisible = relativeTeam;
}

/*
	Name: set_can_use
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x92F8
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 3812
*/
function set_can_use(relativeTeam)
{
	self.useTeam = relativeTeam;
}

/*
	Name: set_2d_icon
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9318
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 3827
*/
function set_2d_icon(relativeTeam, shader)
{
	self.compassIcons[relativeTeam] = shader;
	update_compass_icons();
	return;
}

/*
	Name: set_3d_icon
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9360
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 3844
*/
function set_3d_icon(relativeTeam, shader)
{
	if(!isdefined(shader))
	{
		self.worldIcons_disabled[relativeTeam] = 1;
	}
	else
	{
		self.worldIcons_disabled[relativeTeam] = 0;
	}
	self.worldIcons[relativeTeam] = shader;
	update_world_icons();
}

/*
	Name: set_3d_icon_color
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x93D8
	Size: 0x130
	Parameters: 3
	Flags: None
	Line Number: 3868
*/
function set_3d_icon_color(relativeTeam, v_color, alpha)
{
	updateTeams = get_update_teams(relativeTeam);
	for(index = 0; index < updateTeams.size; index++)
	{
		if(!level.teambased && updateTeams[index] != level.nonTeamBasedTeam)
		{
			continue;
		}
		opName = "objpoint_" + updateTeams[index] + "_" + self.entnum;
		objPoint = objPoints::get_by_name(opName);
		if(isdefined(objPoint))
		{
			if(isdefined(v_color))
			{
				objPoint.color = v_color;
			}
			if(isdefined(alpha))
			{
				objPoint.alpha = alpha;
			}
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: set_objective_color
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9510
	Size: 0x130
	Parameters: 3
	Flags: None
	Line Number: 3905
*/
function set_objective_color(relativeTeam, v_color, alpha)
{
	if(!isdefined(alpha))
	{
		alpha = 1;
	}
	if(self.newStyle)
	{
		objective_setcolor(self.objectiveId, v_color[0], v_color[1], v_color[2], alpha);
	}
	else
	{
		a_teams = get_update_teams(relativeTeam);
		for(index = 0; index < a_teams.size; index++)
		{
			if(!level.teambased && a_teams[index] != level.nonTeamBasedTeam)
			{
				continue;
			}
			objective_setcolor(self.objId[a_teams[index]], v_color[0], v_color[1], v_color[2], alpha);
		}
	}
}

/*
	Name: set_objective_entity
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9648
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 3939
*/
function set_objective_entity(entity)
{
	if(self.newStyle)
	{
		if(isdefined(self.objectiveId))
		{
			Objective_OnEntity(self.objectiveId, entity);
		}
	}
	else
	{
		a_teams = get_update_teams(self.interactTeam);
		foreach(str_team in a_teams)
		{
			Objective_OnEntity(self.objId[str_team], entity);
		}
	}
}

/*
	Name: get_objective_ids
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9758
	Size: 0x1D0
	Parameters: 1
	Flags: None
	Line Number: 3968
*/
function get_objective_ids(str_team)
{
	a_objective_ids = [];
	if(isdefined(self.newStyle) && self.newStyle)
	{
		if(!isdefined(a_objective_ids))
		{
			a_objective_ids = [];
		}
		else if(!IsArray(a_objective_ids))
		{
			a_objective_ids = Array(a_objective_ids);
		}
		a_objective_ids[a_objective_ids.size] = self.objectiveId;
	}
	else
	{
		a_keys = getArrayKeys(self.objId);
		for(i = 0; i < a_keys.size; i++)
		{
			if(!isdefined(str_team) || str_team == a_keys[i])
			{
				if(!isdefined(a_objective_ids))
				{
					a_objective_ids = [];
				}
				else if(!IsArray(a_objective_ids))
				{
					a_objective_ids = Array(a_objective_ids);
				}
				a_objective_ids[a_objective_ids.size] = self.objId[a_keys[i]];
			}
		}
		if(!isdefined(a_objective_ids))
		{
			a_objective_ids = [];
		}
		else if(!IsArray(a_objective_ids))
		{
			a_objective_ids = Array(a_objective_ids);
		}
		a_objective_ids[a_objective_ids.size] = self.objectiveId;
	}
	return a_objective_ids;
}

/*
	Name: hide_icon_distance_and_los
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9930
	Size: 0x1F8
	Parameters: 4
	Flags: None
	Line Number: 4024
*/
function hide_icon_distance_and_los(v_color, hide_distance, los_check, ignore_ent)
{
	self endon("disabled");
	self endon("destroyed_complete");
	while(1)
	{
		Hide = 0;
		if(isdefined(self.worldIcons_disabled["friendly"]) && self.worldIcons_disabled["friendly"] == 1)
		{
			Hide = 1;
		}
		if(!Hide)
		{
			Hide = 1;
			for(i = 0; i < level.players.size; i++)
			{
				n_dist = Distance(level.players[i].origin, self.curorigin);
				if(n_dist < hide_distance)
				{
					if(isdefined(los_check) && los_check)
					{
						b_cansee = level.players[i] gameobject_is_player_looking_at(self.curorigin, 0.8, 1, ignore_ent, 42);
						if(b_cansee)
						{
							Hide = 0;
							break;
							continue;
						}
					}
					Hide = 0;
					break;
				}
			}
		}
		else if(Hide)
		{
			self set_3d_icon_color("friendly", v_color, 0);
		}
		else
		{
			self set_3d_icon_color("friendly", v_color, 1);
		}
		wait(0.05);
	}
}

/*
	Name: gameobject_is_player_looking_at
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9B30
	Size: 0x240
	Parameters: 5
	Flags: None
	Line Number: 4080
*/
function gameobject_is_player_looking_at(origin, dot, do_trace, ignore_ent, ignore_trace_distance)
{
	/#
		Assert(isPlayer(self), "Dev Block strings are not supported");
	#/
	if(!isdefined(dot))
	{
		dot = 0.7;
	}
	if(!isdefined(do_trace))
	{
		do_trace = 1;
	}
	eye = self util::get_eye();
	delta_vec = AnglesToForward(VectorToAngles(origin - eye));
	view_vec = AnglesToForward(self getPlayerAngles());
	new_dot = VectorDot(delta_vec, view_vec);
	if(new_dot >= dot)
	{
		if(do_trace)
		{
			trace = bullettrace(eye, origin, 0, ignore_ent);
			if(trace["position"] == origin)
			{
				return 1;
			}
			else if(isdefined(ignore_trace_distance))
			{
				n_mag = Distance(origin, eye);
				n_dist = Distance(trace["position"], eye);
				n_delta = Abs(n_dist - n_mag);
				if(n_delta <= ignore_trace_distance)
				{
					return 1;
				}
			}
		}
		else
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: hide_icons
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9D78
	Size: 0x190
	Parameters: 1
	Flags: None
	Line Number: 4135
*/
function hide_icons(team)
{
	if(self.visibleTeam == "any" || self.visibleTeam == "friendly")
	{
		hide_friendly = 1;
	}
	else
	{
		hide_friendly = 0;
	}
	if(self.visibleTeam == "any" || self.visibleTeam == "enemy")
	{
		hide_enemy = 1;
	}
	else
	{
		hide_enemy = 0;
	}
	self.hidden_compassIcon = [];
	self.hidden_worldIcon = [];
	if(hide_friendly == 1)
	{
		self.hidden_compassIcon["friendly"] = self.compassIcons["friendly"];
		self.hidden_worldIcon["friendly"] = self.worldIcons["friendly"];
	}
	if(hide_enemy == 1)
	{
		self.hidden_compassIcon["enemy"] = self.compassIcons["enemyy"];
		self.hidden_worldIcon["enemy"] = self.worldIcons["enemy"];
	}
	self set_2d_icon(team, undefined);
	self set_3d_icon(team, undefined);
}

/*
	Name: show_icons
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9F10
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 4179
*/
function show_icons(team)
{
	if(isdefined(self.hidden_compassIcon[team]))
	{
		self set_2d_icon(team, self.hidden_compassIcon[team]);
	}
	if(isdefined(self.hidden_worldIcon[team]))
	{
		self set_3d_icon(team, self.hidden_worldIcon[team]);
	}
}

/*
	Name: set_3d_use_icon
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9F98
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 4201
*/
function set_3d_use_icon(relativeTeam, shader)
{
	self.worldUseIcons[relativeTeam] = shader;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: set_3d_is_waypoint
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9FC8
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 4218
*/
function set_3d_is_waypoint(relativeTeam, waypoint)
{
	self.worldIsWaypoint[relativeTeam] = waypoint;
}

/*
	Name: set_carry_icon
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0x9FF8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 4233
*/
function set_carry_icon(shader)
{
	/#
		Assert(self.type == "Dev Block strings are not supported", "Dev Block strings are not supported");
	#/
	self.carryIcon = shader;
}

/*
	Name: set_visible_carrier_model
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xA048
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 4251
*/
function set_visible_carrier_model(visibleModel)
{
	self.visibleCarrierModel = visibleModel;
}

/*
	Name: get_visible_carrier_model
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xA068
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 4266
*/
function get_visible_carrier_model()
{
	return self.visibleCarrierModel;
}

/*
	Name: destroy_object
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xA080
	Size: 0x190
	Parameters: 3
	Flags: None
	Line Number: 4281
*/
function destroy_object(deleteTrigger, forceHide, b_connect_paths)
{
	if(!isdefined(b_connect_paths))
	{
		b_connect_paths = 0;
	}
	if(!isdefined(forceHide))
	{
		forceHide = 1;
	}
	self disable_object(forceHide);
	foreach(visual in self.visuals)
	{
		if(b_connect_paths)
		{
			visual connectpaths();
		}
		if(isdefined(visual))
		{
			visual ghost();
			visual delete();
		}
	}
	self.trigger notify("destroyed");
	if(isdefined(deleteTrigger) && deleteTrigger)
	{
		self.trigger delete();
	}
	else
	{
		self.trigger TriggerEnable(1);
	}
	self notify("destroyed_complete");
}

/*
	Name: disable_object
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xA218
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 4326
*/
function disable_object(forceHide)
{
	self notify("disabled");
	if(self.type == "carryObject" || self.type == "packObject" || (isdefined(forceHide) && forceHide))
	{
		if(isdefined(self.carrier))
		{
			self.carrier take_object(self);
		}
		for(index = 0; index < self.visuals.size; index++)
		{
			if(isdefined(self.visuals[index]))
			{
				self.visuals[index] ghost();
			}
		}
	}
	self.trigger TriggerEnable(0);
	self set_visible_team("none");
	if(isdefined(self.objectiveId))
	{
		objective_clearentity(self.objectiveId);
	}
}

/*
	Name: enable_object
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xA368
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 4361
*/
function enable_object(forceShow)
{
	if(self.type == "carryObject" || self.type == "packObject" || (isdefined(forceShow) && forceShow))
	{
		for(index = 0; index < self.visuals.size; index++)
		{
			self.visuals[index] show();
		}
	}
	self.trigger TriggerEnable(1);
	self set_visible_team("any");
	if(isdefined(self.objectiveId))
	{
		Objective_OnEntity(self.objectiveId, self);
	}
}

/*
	Name: get_relative_team
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xA470
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 4388
*/
function get_relative_team(team)
{
	if(self.ownerTeam == "any")
	{
		return "friendly";
	}
	if(team == self.ownerTeam)
	{
		return "friendly";
	}
	else if(team == get_enemy_team(self.ownerTeam))
	{
		return "enemy";
	}
	else
	{
		return "neutral";
	}
}

/*
	Name: is_friendly_team
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xA4F8
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 4418
*/
function is_friendly_team(team)
{
	if(!level.teambased)
	{
		return 1;
	}
	if(self.ownerTeam == "any")
	{
		return 1;
	}
	if(self.ownerTeam == team)
	{
		return 1;
	}
	return 0;
}

/*
	Name: can_interact_with
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xA550
	Size: 0x1A8
	Parameters: 1
	Flags: None
	Line Number: 4445
*/
function can_interact_with(player)
{
	if(player.using_map_vehicle === 1)
	{
		if(!isdefined(self.allow_map_vehicles) || self.allow_map_vehicles == 0)
		{
			return 0;
		}
	}
	team = player.pers["team"];
	switch(self.interactTeam)
	{
		case "none":
		{
			return 0;
		}
		case "any":
		{
			return 1;
		}
		case "friendly":
		{
			if(level.teambased)
			{
				if(team == self.ownerTeam)
				{
					return 1;
				}
				else
				{
					return 0;
				}
			}
			else if(player == self.ownerTeam)
			{
				return 1;
			}
			else
			{
				return 0;
			}
		}
		case "enemy":
		{
			if(level.teambased)
			{
				if(team != self.ownerTeam)
				{
					return 1;
				}
				else if(isdefined(self.decayProgress) && self.decayProgress && self.curProgress > 0)
				{
					return 1;
				}
				else
				{
					return 0;
				}
			}
			else if(player != self.ownerTeam)
			{
				return 1;
			}
			else
			{
				return 0;
			}
		}
		default
		{
			/#
				Assert(0, "Dev Block strings are not supported");
			#/
			return 0;
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: is_team
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xA700
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 4535
*/
function is_team(team)
{
	switch(team)
	{
		case "any":
		case "neutral":
		case "none":
		{
			return 1;
			break;
		}
	}
	if(isdefined(level.teams[team]))
	{
		return 1;
	}
	return 0;
}

/*
	Name: is_relative_team
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xA768
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 4564
*/
function is_relative_team(relativeTeam)
{
	switch(relativeTeam)
	{
		case "any":
		case "enemy":
		case "friendly":
		case "none":
		{
			return 1;
			break;
		}
		default
		{
			return 0;
			break;
		}
	}
}

/*
	Name: get_enemy_team
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xA7C8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 4594
*/
function get_enemy_team(team)
{
	switch(team)
	{
		case "neutral":
		{
			return "none";
			break;
		}
		case "allies":
		{
			return "axis";
			break;
		}
		default
		{
			return "allies";
			break;
		}
	}
}

/*
	Name: get_next_obj_id
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xA830
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 4626
*/
function get_next_obj_id()
{
	nextID = 0;
	if(level.releasedObjectives.size > 0)
	{
		nextID = level.releasedObjectives[level.releasedObjectives.size - 1];
		level.releasedObjectives[level.releasedObjectives.size - 1] = undefined;
	}
	else
	{
		nextID = level.numGametypeReservedObjectives;
		level.numGametypeReservedObjectives++;
	}
	/#
		if(nextID >= 128)
		{
			println("Dev Block strings are not supported");
		}
	#/
	if(nextID > 127)
	{
		nextID = 127;
	}
	return nextID;
}

/*
	Name: release_obj_id
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xA8F0
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 4662
*/
function release_obj_id(objId)
{
	/#
		Assert(objId < level.numGametypeReservedObjectives);
	#/
	for(i = 0; i < level.releasedObjectives.size; i++)
	{
		if(objId == level.releasedObjectives[i] && objId == 127)
		{
			return;
		}
		/#
			/#
				Assert(objId != level.releasedObjectives[i]);
			#/
		#/
	}
	level.releasedObjectives[level.releasedObjectives.size] = objId;
	objective_setcolor(objId, 1, 1, 1, 1);
	objective_state(objId, "empty");
}

/*
	Name: release_all_objective_ids
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xAA10
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 4694
*/
function release_all_objective_ids()
{
	if(isdefined(self.objId))
	{
		a_keys = getArrayKeys(self.objId);
		for(i = 0; i < a_keys.size; i++)
		{
			release_obj_id(self.objId[a_keys[i]]);
		}
	}
	else if(isdefined(self.objectiveId))
	{
		release_obj_id(self.objectiveId);
		return;
	}
}

/*
	Name: get_label
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xAAC8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 4721
*/
function get_label()
{
	label = self.trigger.script_label;
	if(!isdefined(label))
	{
		label = "";
		return label;
	}
	if(label[0] != "_")
	{
		return "_" + label;
	}
	return label;
}

/*
	Name: must_maintain_claim
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xAB38
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 4746
*/
function must_maintain_claim(enabled)
{
	self.mustMaintainClaim = enabled;
}

/*
	Name: can_contest_claim
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xAB58
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 4761
*/
function can_contest_claim(enabled)
{
	self.canContestClaim = enabled;
}

/*
	Name: set_flags
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xAB78
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 4776
*/
function set_flags(flags)
{
	Objective_SetGamemodeFlags(self.objectiveId, flags);
}

/*
	Name: get_flags
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xABB0
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 4791
*/
function get_flags(flags)
{
	return Objective_GetGamemodeFlags(self.objectiveId);
}

/*
	Name: create_pack_object
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xABE0
	Size: 0x998
	Parameters: 5
	Flags: None
	Line Number: 4806
*/
function create_pack_object(ownerTeam, trigger, visuals, offset, objectiveName)
{
	if(!isdefined(level.max_packObjects))
	{
		level.max_packObjects = 4;
	}
	/#
		Assert(level.max_packObjects < 5, "Dev Block strings are not supported");
	#/
	packObject = spawnstruct();
	packObject.type = "packObject";
	packObject.curorigin = trigger.origin;
	packObject.entnum = trigger GetEntityNumber();
	if(IsSubStr(trigger.classname, "use"))
	{
		packObject.triggerType = "use";
	}
	else
	{
		packObject.triggerType = "proximity";
	}
	trigger.baseOrigin = trigger.origin;
	packObject.trigger = trigger;
	packObject.useWeapon = undefined;
	if(!isdefined(offset))
	{
		offset = (0, 0, 0);
	}
	packObject.offset3d = offset;
	packObject.newStyle = 0;
	if(isdefined(objectiveName))
	{
		if(!SessionModeIsCampaignGame())
		{
			packObject.newStyle = 1;
		}
	}
	else
	{
		objectiveName = &"";
	}
	for(index = 0; index < visuals.size; index++)
	{
		visuals[index].baseOrigin = visuals[index].origin;
		visuals[index].baseAngles = visuals[index].angles;
	}
	packObject.visuals = visuals;
	packObject _set_team(ownerTeam);
	packObject.compassIcons = [];
	packObject.objId = [];
	if(!packObject.newStyle)
	{
		foreach(team in level.teams)
		{
			packObject.objId[team] = get_next_obj_id();
		}
	}
	packObject.objIDPingFriendly = 0;
	packObject.objIDPingEnemy = 0;
	level.objIDStart = level.objIDStart + 2;
	if(!packObject.newStyle)
	{
		if(level.teambased)
		{
			foreach(team in level.teams)
			{
				objective_add(packObject.objId[team], "invisible", packObject.curorigin);
				objective_team(packObject.objId[team], team);
				packObject.objPoints[team] = objPoints::create("objpoint_" + team + "_" + packObject.entnum, packObject.curorigin + offset, team, undefined);
				packObject.objPoints[team].alpha = 0;
			}
		}
		else
		{
			objective_add(packObject.objId[level.nonTeamBasedTeam], "invisible", packObject.curorigin);
			packObject.objPoints[level.nonTeamBasedTeam] = objPoints::create("objpoint_" + level.nonTeamBasedTeam + "_" + packObject.entnum, packObject.curorigin + offset, "all", undefined);
			packObject.objPoints[level.nonTeamBasedTeam].alpha = 0;
		}
	}
	packObject.objectiveId = get_next_obj_id();
	if(packObject.newStyle)
	{
		objective_add(packObject.objectiveId, "invisible", packObject.curorigin, objectiveName);
	}
	packObject.carrier = undefined;
	packObject.isResetting = 0;
	packObject.interactTeam = "none";
	packObject.allowWeapons = 1;
	packObject.visibleCarrierModel = undefined;
	packObject.dropOffset = 0;
	packObject.worldIcons = [];
	packObject.carrierVisible = 0;
	packObject.visibleTeam = "none";
	packObject.worldIsWaypoint = [];
	packObject.worldIcons_disabled = [];
	packObject.packIcon = undefined;
	packObject.setDropped = undefined;
	packObject.onDrop = undefined;
	packObject.onPickup = undefined;
	packObject.onReset = undefined;
	if(packObject.triggerType == "use")
	{
		packObject thread carry_object_use_think();
	}
	else
	{
		packObject.numTouching["neutral"] = 0;
		packObject.numTouching["none"] = 0;
		packObject.touchList["neutral"] = [];
		packObject.touchList["none"] = [];
		foreach(team in level.teams)
		{
			packObject.numTouching[team] = 0;
			packObject.touchList[team] = [];
		}
		packObject.curProgress = 0;
		packObject.useTime = 0;
		packObject.useRate = 0;
		packObject.claimTeam = "none";
		packObject.claimPlayer = undefined;
		packObject.lastClaimTeam = "none";
		packObject.lastClaimTime = 0;
		packObject.claimGracePeriod = 0;
		packObject.mustMaintainClaim = 0;
		packObject.canContestClaim = 0;
		packObject.decayProgress = 0;
		packObject.teamUseTimes = [];
		packObject.teamUseTexts = [];
		packObject.onUse = &set_picked_up;
		packObject thread use_object_prox_think();
	}
	packObject thread update_carry_object_origin();
	packObject thread update_carry_object_objective_origin();
	return packObject;
}

/*
	Name: give_pack_object
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xB580
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 4952
*/
function give_pack_object(object)
{
	self.packObject[self.packObject.size] = object;
	self thread track_carrier(object);
	if(!object.newStyle)
	{
		if(isdefined(object.packIcon))
		{
			if(self IsSplitscreen())
			{
				elem = hud::createIcon(object.packIcon, 25, 25);
				elem.y = -90;
				elem.horzAlign = "right";
				elem.vertAlign = "bottom";
			}
			else
			{
				elem = hud::createIcon(object.packIcon, 35, 35);
				elem.y = -110;
				elem.horzAlign = "user_right";
				elem.vertAlign = "user_bottom";
			}
			elem.x = get_packIcon_offset(self.packIcon.size);
			elem.alpha = 0.75;
			elem.hidewhileremotecontrolling = 1;
			elem.hidewheninkillcam = 1;
			elem.script_string = object.packIcon;
			self.packIcon[self.packIcon.size] = elem;
		}
	}
}

/*
	Name: get_packIcon_offset
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xB770
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 4994
*/
function get_packIcon_offset(index)
{
	if(!isdefined(index))
	{
		index = 0;
	}
	if(self IsSplitscreen())
	{
		SIZE = 25;
		base = -130;
	}
	else
	{
		SIZE = 35;
		base = -40;
	}
	Int = base - SIZE * index;
	return Int;
}

/*
	Name: adjust_remaining_packIcons
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xB810
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 5024
*/
function adjust_remaining_packIcons()
{
	if(!isdefined(self.packIcon))
	{
		return;
	}
	if(self.packIcon.size > 0)
	{
		for(i = 0; i < self.packIcon.size; i++)
		{
			self.packIcon[i].x = get_packIcon_offset(i);
		}
	}
}

/*
	Name: set_pack_icon
	Namespace: gameobjects
	Checksum: 0x424F4353
	Offset: 0xB898
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 5049
*/
function set_pack_icon(shader)
{
	/#
		Assert(self.type == "Dev Block strings are not supported", "Dev Block strings are not supported");
	#/
	self.packIcon = shader;
}

