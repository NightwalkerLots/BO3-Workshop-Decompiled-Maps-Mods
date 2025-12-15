#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\challenges_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\weapons\_weaponobjects;
#include scripts\zm\_zm;
#include scripts\zm\_zm_weapons;

#namespace spike_charge;

/*
	Name: __init__sytem__
	Namespace: spike_charge
	Checksum: 0x424F4353
	Offset: 0x250
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("spike_charge", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: spike_charge
	Checksum: 0x424F4353
	Offset: 0x290
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function __init__()
{
	if(GetDvarString("aae_lite") == "")
	{
		callback::add_weapon_watcher(&createSpikeLauncherWatcher);
		callback::add_weapon_watcher(&function_c0713d77);
	}
}

/*
	Name: function_c0713d77
	Namespace: spike_charge
	Checksum: 0x424F4353
	Offset: 0x308
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 59
*/
function function_c0713d77()
{
	watcher = self weaponobjects::createUseWeaponObjectWatcher("spike_charge_upgraded", self.team);
	watcher.altName = "spike_launcher_upgraded";
	watcher.altweapon = GetWeapon("spike_launcher_upgraded");
	watcher.altDetonate = 1;
	watcher.watchForFire = 1;
	watcher.hackable = 1;
	watcher.hackerToolRadius = level.equipmentHackerToolRadius;
	watcher.hackerToolTimeMs = level.equipmentHackerToolTimeMs;
	watcher.headicon = 0;
	watcher.onDetonateCallback = &spikeDetonate;
	watcher.onStun = &weaponobjects::weaponStun;
	watcher.stunTime = 1;
	watcher.ownerGetsAssist = 1;
	watcher.detonateStationary = 0;
	watcher.detonationDelay = 0;
	watcher.detonationSound = "wpn_claymore_alert";
	watcher.onDetonationHandle = &spikesDetonating;
	self thread watchSpikeLauncherItemCountChanged(watcher);
}

/*
	Name: createSpikeLauncherWatcher
	Namespace: spike_charge
	Checksum: 0x424F4353
	Offset: 0x4C0
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 91
*/
function createSpikeLauncherWatcher()
{
	watcher = self weaponobjects::createUseWeaponObjectWatcher("spike_charge", self.team);
	watcher.altName = "spike_launcher";
	watcher.altweapon = GetWeapon("spike_launcher");
	watcher.altDetonate = 1;
	watcher.watchForFire = 1;
	watcher.hackable = 1;
	watcher.hackerToolRadius = level.equipmentHackerToolRadius;
	watcher.hackerToolTimeMs = level.equipmentHackerToolTimeMs;
	watcher.headicon = 0;
	watcher.onDetonateCallback = &spikeDetonate;
	watcher.onStun = &weaponobjects::weaponStun;
	watcher.stunTime = 1;
	watcher.ownerGetsAssist = 1;
	watcher.detonateStationary = 0;
	watcher.detonationDelay = 0;
	watcher.detonationSound = "wpn_claymore_alert";
	watcher.onDetonationHandle = &spikesDetonating;
	self thread watchSpikeLauncherItemCountChanged(watcher);
}

/*
	Name: spikeDetonate
	Namespace: spike_charge
	Checksum: 0x424F4353
	Offset: 0x678
	Size: 0x60
	Parameters: 3
	Flags: None
	Line Number: 123
*/
function spikeDetonate(attacker, weapon, target)
{
	if(isdefined(weapon) && weapon.isValid)
	{
	}
	thread delayedSpikeDetonation(attacker, weapon);
}

/*
	Name: delayedSpikeDetonation
	Namespace: spike_charge
	Checksum: 0x424F4353
	Offset: 0x6E0
	Size: 0xF0
	Parameters: 2
	Flags: None
	Line Number: 141
*/
function delayedSpikeDetonation(attacker, weapon)
{
	if(!isdefined(self.owner.spikeDelay))
	{
		self.owner.spikeDelay = 0;
	}
	delayTime = self.owner.spikeDelay;
	owner = self.owner;
	self.owner.spikeDelay = self.owner.spikeDelay + 0.3;
	waittillframeend;
	wait(delayTime);
	owner.spikeDelay = owner.spikeDelay - 0.3;
	if(isdefined(self))
	{
		self weaponobjects::weaponDetonate(attacker, weapon);
	}
}

/*
	Name: spikesDetonating
	Namespace: spike_charge
	Checksum: 0x424F4353
	Offset: 0x7D8
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 169
*/
function spikesDetonating(watcher)
{
	spikeCount = self getSpikeLauncherActiveSpikeCount(watcher);
	if(spikeCount > 0)
	{
		self SetControllerUIModelValue("spikeLauncherCounter.blasting", 1);
		wait(2);
		self SetControllerUIModelValue("spikeLauncherCounter.blasting", 0);
	}
}

/*
	Name: watchSpikeLauncherItemCountChanged
	Namespace: spike_charge
	Checksum: 0x424F4353
	Offset: 0x868
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 190
*/
function watchSpikeLauncherItemCountChanged(watcher)
{
	self notify("watchSpikeLauncherItemCountChanged");
	self endon("watchSpikeLauncherItemCountChanged");
	self endon("death");
	self endon("bled_out");
	self endon("disconnect");
	self endon("death");
	lastItemCount = undefined;
	for(;;)
	{
		self waittill("weapon_change", weapon);
		while(weapon.name == "spike_launcher" || weapon.name == "spike_launcher_upgraded")
		{
			currentItemCount = self getSpikeLauncherActiveSpikeCount(watcher);
			if(currentItemCount !== lastItemCount)
			{
				self SetControllerUIModelValue("spikeLauncherCounter.spikesReady", currentItemCount);
				lastItemCount = currentItemCount;
			}
			wait(0.1);
			weapon = self GetCurrentWeapon();
		}
	}
}

/*
	Name: getSpikeLauncherActiveSpikeCount
	Namespace: spike_charge
	Checksum: 0x424F4353
	Offset: 0x9B0
	Size: 0x13A
	Parameters: 1
	Flags: None
	Line Number: 226
*/
function getSpikeLauncherActiveSpikeCount(watcher)
{
	grenades = GetEntArray("grenade", "classname", 1);
	var_dd8738a9 = 0;
	foreach(grenade in grenades)
	{
		if(grenade.weapon.name == "spike_charge_upgraded" || grenade.weapon.name == "spike_charge" && isdefined(grenade.owner) && grenade.owner === self)
		{
			var_dd8738a9++;
		}
	}
	return var_dd8738a9;
}

