#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_weapons;

#namespace zm_weap_thundergun;

/*
	Name: __init__sytem__
	Namespace: zm_weap_thundergun
	Checksum: 0x424F4353
	Offset: 0x168
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_weap_thundergun", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_weap_thundergun
	Checksum: 0x424F4353
	Offset: 0x1B0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	level.weaponZMThunderGun = GetWeapon("thundergun");
	level.weaponZMThunderGunUpgraded = GetWeapon("thundergun_upgraded");
}

/*
	Name: __main__
	Namespace: zm_weap_thundergun
	Checksum: 0x424F4353
	Offset: 0x200
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function __main__()
{
	callback::on_localplayer_spawned(&localplayer_spawned);
}

/*
	Name: localplayer_spawned
	Namespace: zm_weap_thundergun
	Checksum: 0x424F4353
	Offset: 0x230
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 64
*/
function localplayer_spawned(localClientNum)
{
	self thread watch_for_thunderguns(localClientNum);
}

/*
	Name: watch_for_thunderguns
	Namespace: zm_weap_thundergun
	Checksum: 0x424F4353
	Offset: 0x260
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 79
*/
function watch_for_thunderguns(localClientNum)
{
	self endon("disconnect");
	self notify("watch_for_thunderguns");
	self endon("watch_for_thunderguns");
	while(isdefined(self))
	{
		self waittill("weapon_change", w_new_weapon, w_old_weapon);
		if(w_new_weapon == level.weaponZMThunderGun || w_new_weapon == level.weaponZMThunderGunUpgraded)
		{
			self thread thundergun_fx_power_cell(localClientNum, w_new_weapon);
		}
	}
}

/*
	Name: thundergun_fx_power_cell
	Namespace: zm_weap_thundergun
	Checksum: 0x424F4353
	Offset: 0x308
	Size: 0x158
	Parameters: 2
	Flags: None
	Line Number: 104
*/
function thundergun_fx_power_cell(localClientNum, w_weapon)
{
	self endon("disconnect");
	self endon("weapon_change");
	self endon("entityshutdown");
	n_old_ammo = -1;
	n_shader_val = 0;
	while(1)
	{
		wait(0.1);
		if(!isdefined(self))
		{
			return;
		}
		n_ammo = GetWeaponAmmoClip(localClientNum, w_weapon);
		if(n_old_ammo > 0 && n_old_ammo != n_ammo)
		{
			thundergun_fx_fire(localClientNum);
		}
		n_old_ammo = n_ammo;
		if(n_ammo == 0)
		{
			self MapShaderConstant(localClientNum, 0, "scriptVector2", 0, 0, 0, 0);
		}
		else
		{
			n_shader_val = 4 - n_ammo;
			self MapShaderConstant(localClientNum, 0, "scriptVector2", 0, 1, n_shader_val, 0);
		}
	}
}

/*
	Name: thundergun_fx_fire
	Namespace: zm_weap_thundergun
	Checksum: 0x424F4353
	Offset: 0x468
	Size: 0x2C
	Parameters: 1
	Flags: None
	Line Number: 146
*/
function thundergun_fx_fire(localClientNum)
{
	playsound(localClientNum, "wpn_thunder_breath", (0, 0, 0));
}

