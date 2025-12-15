#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_clientdvar;
#include scripts\zm\_zm;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_1958c5da;

/*
	Name: __init__sytem__
	Namespace: namespace_1958c5da
	Checksum: 0x424F4353
	Offset: 0x270
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 25
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_impatient", &__init__, undefined, "bgb");
}

/*
	Name: __init__
	Namespace: namespace_1958c5da
	Checksum: 0x424F4353
	Offset: 0x2B0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	bgb::register("zm_bgb_impatient", "activated", 3, undefined, undefined, &validation, &activation);
}

/*
	Name: validation
	Namespace: namespace_1958c5da
	Checksum: 0x424F4353
	Offset: 0x320
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 59
*/
function validation()
{
	return !bgb::is_team_active("zm_bgb_impatient") && !GetDvarInt("player_sustainAmmo");
	ERROR: Exception occured: Stack empty.
}

/*
	Name: activation
	Namespace: namespace_1958c5da
	Checksum: 0x424F4353
	Offset: 0x368
	Size: 0x280
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function activation()
{
	self endon("disconnect");
	self endon("bled_out");
	level thread function_b831dd1(self);
	foreach(player in level.players)
	{
		player namespace_d87f1aa7::function_908a81cd("elmg_unammoâ¦1");
		player namespace_d87f1aa7::function_908a81cd("player_sustainAmmoâ¦1");
		weapon = player GetCurrentWeapon();
		player SetWeaponAmmoClip(weapon, 1);
		if(isdefined(weapon.dualWieldWeapon))
		{
			player SetWeaponAmmoClip(weapon.dualWieldWeapon, 1);
		}
	}
	wait(0.1);
	foreach(player in level.players)
	{
		weapon = player GetCurrentWeapon();
		player SetWeaponAmmoClip(weapon, weapon.clipSize);
		if(isdefined(weapon.dualWieldWeapon))
		{
			player SetWeaponAmmoClip(weapon.dualWieldWeapon, weapon.dualWieldWeapon.clipSize);
		}
	}
	self bgb::run_timer(60);
	self notify("hash_d22ba27d");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b831dd1
	Namespace: namespace_1958c5da
	Checksum: 0x424F4353
	Offset: 0x5F0
	Size: 0x25A
	Parameters: 1
	Flags: None
	Line Number: 117
*/
function function_b831dd1(player)
{
	player util::waittill_any_return("disconnect", "bled_out", "uammo_over", "death");
	foreach(player in level.players)
	{
		player namespace_d87f1aa7::function_908a81cd("elmg_unammoâ¦0");
		player namespace_d87f1aa7::function_908a81cd("player_sustainAmmoâ¦0");
		weapon = player GetCurrentWeapon();
		player SetWeaponAmmoClip(weapon, 1);
		if(isdefined(weapon.dualWieldWeapon))
		{
			player SetWeaponAmmoClip(weapon.dualWieldWeapon, 1);
		}
	}
	wait(0.1);
	foreach(player in level.players)
	{
		weapon = player GetCurrentWeapon();
		player SetWeaponAmmoClip(weapon, weapon.clipSize);
		if(isdefined(weapon.dualWieldWeapon))
		{
			player SetWeaponAmmoClip(weapon.dualWieldWeapon, weapon.dualWieldWeapon.clipSize);
		}
	}
}

