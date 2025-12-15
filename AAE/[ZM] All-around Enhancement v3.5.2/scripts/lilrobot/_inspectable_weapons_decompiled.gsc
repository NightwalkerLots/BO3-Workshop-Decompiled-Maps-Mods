#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace namespace_917c15bb;

/*
	Name: __init__sytem__
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0x2A8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("inspectable", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0x2E8
	Size: 0x320
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	callback::on_spawned(&function_db8c7c17);
	function_f3798296(GetWeapon("iw6_lsat"), 4.5);
	function_f3798296(GetWeapon("iw6_lsat_up"), 4.5);
	if(GetDvarString("aae_lite") != "1")
	{
		function_f3798296(GetWeapon("pistol_burst"), 4.3);
		function_f3798296(GetWeapon("k7_raygun_mark3_upgraded"), 3.56);
		function_f3798296(GetWeapon("k7_raygun_mark3"), 3.56);
		function_f3798296(GetWeapon("launcher_standard_upgraded"), 4.8666);
		function_f3798296(GetWeapon("thundergun"), 5.0666);
		function_f3798296(GetWeapon("thundergun_upgraded_og"), 5.0666);
		function_f3798296(GetWeapon("tesla_gun"), 6.63);
		function_f3798296(GetWeapon("tesla_gun_upgraded"), 6.63);
		function_f3798296(GetWeapon("shotgun_precision_upgraded"), 5.02);
		function_f3798296(GetWeapon("shotgun_precision"), 5.02);
		function_f3798296(GetWeapon("ar_peacekeeper_upgraded"), 5.1333);
		function_f3798296(GetWeapon("ray_gun"), 7.733);
		function_f3798296(GetWeapon("ray_gun_upgraded_cw"), 7.733);
	}
}

/*
	Name: function_4681ec99
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0x610
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function function_4681ec99()
{
	self.var_8ed070f5 = 0;
}

/*
	Name: function_80b825eb
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0x628
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 81
*/
function function_80b825eb()
{
	return 0;
}

/*
	Name: function_299148e4
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0x638
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 96
*/
function function_299148e4(weapon)
{
	if(weapon.var_8638ffb9 && isdefined(weapon.var_8638ffb9))
	{
		return 1;
	}
	if(self GetWeaponAmmoClip(weapon) >= weapon.clipSize)
	{
		return 1;
	}
	if(self GetWeaponAmmoStock(weapon) <= 0)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_8294f79e
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0x6D0
	Size: 0x2E8
	Parameters: 0
	Flags: None
	Line Number: 123
*/
function function_8294f79e()
{
	if(self GetStance() == "prone" || self.sessionstate == "spectator" || self AttackButtonPressed() || self meleeButtonPressed() || self WeaponSwitchButtonPressed() || self function_e2e4a173() || self ActionSlotFourButtonPressed() || self ActionSlotOneButtonPressed() || self ActionSlotThreeButtonPressed() || self ActionSlotTwoButtonPressed() || self AdsButtonPressed() || self function_c1c8570() || self ChangeSeatButtonPressed() || self fragButtonPressed() || self inventoryButtonPressed() || self OffhandSpecialButtonPressed() || self PrimaryButtonPressedLocal() || self function_863deafe() || self SecondaryOffhandButtonPressed() || self throwbuttonpressed() || self SprintButtonPressed() || self IsPlayerSwimming() || self IsPlayerUnderwater() || self IsWallRunning() || self function_679da569() || self issprinting() || self IsReloading() || self IsSwitchingWeapons() || self isusingoffhand() || self IsThrowingGrenade())
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5b4f970e
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0x9C0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 143
*/
function function_5b4f970e()
{
	self notify("hash_fee6d2c4");
	self endon("hash_fee6d2c4");
	level endon("end_game");
	self.var_f603493e = 0;
	for(;;)
	{
		weapon = self GetCurrentWeapon();
		if(!(isdefined(self.afk) && self.afk == 1) && self getvelocity() == (0, 0, 0) && self IsOnGround() && self function_6516d030(weapon) && self function_299148e4(weapon) && !self function_8294f79e())
		{
			self.var_f603493e++;
			if(self.var_f603493e >= 10)
			{
				self notify("hash_20e2a1b3");
				self.var_f603493e = 0;
			}
		}
		else
		{
			self.var_f603493e = 0;
		}
		wait(1);
	}
}

/*
	Name: function_db8c7c17
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0xB10
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 179
*/
function function_db8c7c17()
{
	self endon("disconnect");
	self endon("death");
	self notify("hash_9189aee6");
	self endon("hash_9189aee6");
	level endon("end_game");
	self thread function_5b4f970e();
	self thread function_8af581a();
	for(;;)
	{
		self waittill("hash_20e2a1b3");
		weapon = self GetCurrentWeapon();
		var_26f740b9 = self function_6516d030(weapon);
		if(var_26f740b9 > 0 && self function_299148e4(weapon) && !self function_8294f79e())
		{
			self thread function_65a2e1d6(var_26f740b9);
		}
	}
}

/*
	Name: function_8af581a
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0xC38
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 210
*/
function function_8af581a()
{
	self endon("disconnect");
	self endon("death");
	self notify("hash_8af581a");
	self endon("hash_8af581a");
	level endon("end_game");
	for(;;)
	{
		wait(0.05);
		if(self GamepadUsedLast())
		{
			if(self SprintButtonPressed() && self ReloadButtonPressed())
			{
				self notify("hash_20e2a1b3");
			}
		}
		else if(self ReloadButtonPressed())
		{
			self notify("hash_20e2a1b3");
		}
		while(self ReloadButtonPressed())
		{
			wait(0.05);
		}
	}
}

/*
	Name: function_53918d7f
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0xD28
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 248
*/
function function_53918d7f()
{
}

/*
	Name: function_c389c47b
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0xD38
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 262
*/
function function_c389c47b()
{
	return;
}

/*
	Name: function_348b94c1
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0xD48
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 277
*/
function function_348b94c1()
{
}

/*
	Name: function_f3798296
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0xD58
	Size: 0x1A0
	Parameters: 2
	Flags: None
	Line Number: 291
*/
function function_f3798296(var_4d304636, iTime)
{
	if(var_4d304636 == level.weaponNone || !isdefined(var_4d304636))
	{
		return;
	}
	if(!isdefined(level.var_3f8c8095))
	{
		level.var_3f8c8095 = [];
	}
	foreach(var_3f8c8095 in level.var_3f8c8095)
	{
		if(var_4d304636.rootweapon.name == var_3f8c8095.weapon.name)
		{
			return;
		}
	}
	struct = spawnstruct();
	struct.weapon = var_4d304636;
	struct.iTime = iTime;
	if(!isdefined(level.var_3f8c8095))
	{
		level.var_3f8c8095 = [];
	}
	else if(!IsArray(level.var_3f8c8095))
	{
		level.var_3f8c8095 = Array(level.var_3f8c8095);
	}
	level.var_3f8c8095[level.var_3f8c8095.size] = struct;
	return;
	ERROR: Bad function call
}

/*
	Name: function_9d7def6a
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0xF00
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 334
*/
function function_9d7def6a(var_4d304636)
{
	return 0;
}

/*
	Name: function_6516d030
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0xF18
	Size: 0x318
	Parameters: 1
	Flags: None
	Line Number: 349
*/
function function_6516d030(var_4d304636)
{
	if(!isdefined(var_4d304636) || level.weaponNone === var_4d304636)
	{
		return 0;
	}
	foreach(var_3f8c8095 in level.var_3f8c8095)
	{
		if(var_4d304636.rootweapon.name == var_3f8c8095.weapon.name)
		{
			return var_3f8c8095.iTime;
		}
	}
	if(IsSubStr(var_4d304636.name, "log") || IsSubStr(var_4d304636.name, "apex") || IsSubStr(var_4d304636.name, "h1") || IsSubStr(var_4d304636.name, "s2") || IsSubStr(var_4d304636.name, "t8") || IsSubStr(var_4d304636.name, "iw8") || IsSubStr(var_4d304636.name, "t9") || IsSubStr(var_4d304636.name, "h2"))
	{
		if(IsSubStr(var_4d304636.name, "ray") || IsSubStr(var_4d304636.name, "thunder") || IsSubStr(var_4d304636.name, "tesla") || IsSubStr(var_4d304636.name, "hero") || IsSubStr(var_4d304636.name, "staff") || IsSubStr(var_4d304636.name, "elemental"))
		{
			return 0;
		}
		return 4.5;
	}
	return 0;
}

/*
	Name: function_7af78cbd
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0x1238
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 383
*/
function function_7af78cbd()
{
	self endon("disconnect");
	self notify("hash_39c443be");
	self.var_8ed070f5 = 0;
}

/*
	Name: function_65a2e1d6
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0x1268
	Size: 0x138
	Parameters: 1
	Flags: Private
	Line Number: 400
*/
function private function_65a2e1d6(var_26f740b9)
{
	self notify("hash_4abc7cd5");
	self endon("hash_4abc7cd5");
	self endon("disconnect");
	if(!self IsSplitscreen())
	{
		var_26f740b9 = var_26f740b9 - 0.5;
		if(var_26f740b9 < 0.07)
		{
			var_26f740b9 = var_26f740b9 + 0.5;
		}
		util::setClientSysState("deadshot_keyline", "i," + var_26f740b9, self);
	}
	self SetLowReady(1);
	wait(0.11);
	self SetLowReady(0);
	self.var_f603493e = 0;
	if(!self IsSplitscreen())
	{
		self function_5ef9c9df(var_26f740b9);
		util::setClientSysState("deadshot_keyline", "i,0", self);
	}
}

/*
	Name: function_5ef9c9df
	Namespace: namespace_917c15bb
	Checksum: 0x424F4353
	Offset: 0x13A8
	Size: 0x1BC
	Parameters: 1
	Flags: None
	Line Number: 435
*/
function function_5ef9c9df(var_26f740b9)
{
	self endon("disconnect");
	self endon("weapon_change");
	self endon("weapon_fired");
	self endon("hash_7812f695");
	self endon("weapon_melee_juke");
	self endon("weapon_melee_charge");
	self endon("weapon_melee");
	self endon("grenade_fire");
	self endon("missile_fire");
	self endon("grenade_pullback");
	self endon("reload_start");
	self endon("sprint_begin");
	self endon("hash_80cb64f2");
	self endon("wallrun_begin");
	self endon("swimming_begin");
	self endon("hash_f9c9bf74");
	self endon("Play");
	self endon("NEW_STATE");
	endTime = GetTime() + var_26f740b9 * 1000;
	while(!self IsReloading() && !self IsSwitchingWeapons() && !self issprinting() && !self IsSliding() && !self IsSlamming() && self GetStance() != "prone" && endTime > GetTime())
	{
		self.var_f603493e = 0;
		wait(0.001);
	}
}

