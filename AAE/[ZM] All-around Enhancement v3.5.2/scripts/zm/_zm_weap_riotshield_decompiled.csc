#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_weapons;

#namespace zm_equip_shield;

/*
	Name: __init__sytem__
	Namespace: zm_equip_shield
	Checksum: 0x424F4353
	Offset: 0x1A0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_equip_shield", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_equip_shield
	Checksum: 0x424F4353
	Offset: 0x1E0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	callback::on_spawned(&player_on_spawned);
	clientfield::register("clientuimodel", "zmInventory.shield_health", 11000, 4, "float", undefined, 0, 0);
}

/*
	Name: player_on_spawned
	Namespace: zm_equip_shield
	Checksum: 0x424F4353
	Offset: 0x248
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 50
*/
function player_on_spawned(localClientNum)
{
	self thread watch_weapon_changes(localClientNum);
}

/*
	Name: watch_weapon_changes
	Namespace: zm_equip_shield
	Checksum: 0x424F4353
	Offset: 0x278
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 65
*/
function watch_weapon_changes(localClientNum)
{
	self endon("disconnect");
	self endon("entityshutdown");
	while(isdefined(self))
	{
		self waittill("weapon_change", weapon);
		if(weapon.isRiotShield)
		{
			self thread lock_weapon_models(localClientNum, weapon);
		}
	}
}

/*
	Name: lock_weapon_model
	Namespace: zm_equip_shield
	Checksum: 0x424F4353
	Offset: 0x2F8
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 89
*/
function lock_weapon_model(model)
{
	if(isdefined(model))
	{
		if(!isdefined(level.model_locks))
		{
			level.model_locks = [];
		}
		if(!isdefined(level.model_locks[model]))
		{
			level.model_locks[model] = 0;
		}
		if(level.model_locks[model] < 1)
		{
			ForceStreamXModel(model);
		}
		level.model_locks[model]++;
	}
}

/*
	Name: unlock_weapon_model
	Namespace: zm_equip_shield
	Checksum: 0x424F4353
	Offset: 0x398
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 119
*/
function unlock_weapon_model(model)
{
	if(isdefined(model))
	{
		if(!isdefined(level.model_locks))
		{
			level.model_locks = [];
		}
		if(!isdefined(level.model_locks[model]))
		{
			level.model_locks[model] = 0;
		}
		level.model_locks[model]--;
		if(level.model_locks[model] < 1)
		{
			StopForceStreamingXModel(model);
		}
	}
}

/*
	Name: lock_weapon_models
	Namespace: zm_equip_shield
	Checksum: 0x424F4353
	Offset: 0x438
	Size: 0x104
	Parameters: 2
	Flags: None
	Line Number: 149
*/
function lock_weapon_models(localClientNum, weapon)
{
	lock_weapon_model(weapon.worlddamagedmodel1);
	lock_weapon_model(weapon.worlddamagedmodel2);
	lock_weapon_model(weapon.worlddamagedmodel3);
	self util::waittill_any("weapon_change", "disconnect", "entityshutdown");
	unlock_weapon_model(weapon.worlddamagedmodel1);
	unlock_weapon_model(weapon.worlddamagedmodel2);
	unlock_weapon_model(weapon.worlddamagedmodel3);
}

