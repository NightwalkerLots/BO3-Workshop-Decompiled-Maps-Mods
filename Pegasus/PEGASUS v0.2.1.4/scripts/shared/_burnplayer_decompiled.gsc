#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\damagefeedback_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace burnplayer;

/*
	Name: __init__sytem__
	Namespace: burnplayer
	Checksum: 0xA0EC4162
	Offset: 0x190
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("burnplayer", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: burnplayer
	Checksum: 0xA6616AA1
	Offset: 0x1D0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	clientfield::register("allplayers", "burn", 1, 1, "int");
	clientfield::register("playercorpse", "burned_effect", 1, 1, "int");
}

/*
	Name: SetPlayerBurning
	Namespace: burnplayer
	Checksum: 0xACBEC981
	Offset: 0x240
	Size: 0xF8
	Parameters: 5
	Flags: None
	Line Number: 49
*/
function SetPlayerBurning(duration, interval, damagePerInterval, attacker, weapon)
{
	if(isdefined(self.var_d43adbdf) && self.var_d43adbdf)
	{
		return;
	}
	self clientfield::set("burn", 1);
	self thread WatchBurnTimer(duration);
	self thread WatchBurnDamage(interval, damagePerInterval, attacker, weapon);
	self thread WatchForWater();
	self thread WatchBurnFinished();
	self PlayLoopSound("chr_burn_loop_overlay");
	return;
}

/*
	Name: TakingBurnDamage
	Namespace: burnplayer
	Checksum: 0xBEB6A5AC
	Offset: 0x340
	Size: 0xB0
	Parameters: 3
	Flags: None
	Line Number: 74
*/
function TakingBurnDamage(eAttacker, weapon, sMeansOfDeath)
{
	if(isdefined(self.doing_scripted_burn_damage))
	{
		self.doing_scripted_burn_damage = undefined;
		return;
	}
	if(weapon == level.weaponNone)
	{
		return;
	}
	if(weapon.burnDuration == 0)
	{
		return;
	}
	self SetPlayerBurning(weapon.burnDuration / 1000, weapon.burnDamageInterval / 1000, weapon.burnDamage, eAttacker, weapon);
}

/*
	Name: WatchBurnFinished
	Namespace: burnplayer
	Checksum: 0x1734A115
	Offset: 0x3F8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function WatchBurnFinished()
{
	self endon("disconnect");
	self util::waittill_any("death", "burn_finished");
	self clientfield::set("burn", 0);
	self StopLoopSound(1);
}

/*
	Name: WatchBurnTimer
	Namespace: burnplayer
	Checksum: 0x4BED6573
	Offset: 0x470
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 120
*/
function WatchBurnTimer(duration)
{
	self notify("BurnPlayer_WatchBurnTimer");
	self endon("BurnPlayer_WatchBurnTimer");
	self endon("disconnect");
	self endon("death");
	wait(duration);
	self notify("burn_finished");
}

/*
	Name: WatchBurnDamage
	Namespace: burnplayer
	Checksum: 0x81C913C6
	Offset: 0x4D0
	Size: 0xC8
	Parameters: 4
	Flags: None
	Line Number: 140
*/
function WatchBurnDamage(interval, damage, attacker, weapon)
{
	if(damage == 0)
	{
		return;
	}
	self endon("disconnect");
	self endon("death");
	self endon("BurnPlayer_WatchBurnTimer");
	self endon("burn_finished");
	while(1)
	{
		wait(interval);
		self.doing_scripted_burn_damage = 1;
		self DoDamage(damage, self.origin, attacker, undefined, undefined, "MOD_BURNED", 0, weapon);
		self.doing_scripted_burn_damage = undefined;
	}
}

/*
	Name: WatchForWater
	Namespace: burnplayer
	Checksum: 0x2115D070
	Offset: 0x5A0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 169
*/
function WatchForWater()
{
	self endon("disconnect");
	self endon("death");
	self endon("burn_finished");
	while(1)
	{
		if(self IsPlayerUnderwater())
		{
			self notify("burn_finished");
		}
		wait(0.05);
	}
}

