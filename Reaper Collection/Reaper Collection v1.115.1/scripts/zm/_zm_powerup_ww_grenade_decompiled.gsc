#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace zm_powerup_ww_grenade;

/*
	Name: __init__sytem__
	Namespace: zm_powerup_ww_grenade
	Checksum: 0x424F4353
	Offset: 0x368
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 32
*/
function autoexec __init__sytem__()
{
	system::register("zm_powerup_ww_grenade", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_powerup_ww_grenade
	Checksum: 0x424F4353
	Offset: 0x3A8
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 47
*/
function __init__()
{
	zm_powerups::register_powerup("ww_grenade", &grab_ww_grenade);
	if(ToLower(GetDvarString("g_gametype")) != "zcleansed")
	{
		zm_powerups::add_zombie_powerup("ww_grenade", "p7_zm_power_up_widows_wine", &"ZOMBIE_POWERUP_WW_GRENADE", &zm_powerups::func_should_never_drop, 1, 0, 0);
		zm_powerups::powerup_set_player_specific("ww_grenade", 1);
	}
}

/*
	Name: grab_ww_grenade
	Namespace: zm_powerup_ww_grenade
	Checksum: 0x424F4353
	Offset: 0x478
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 67
*/
function grab_ww_grenade(player)
{
	level thread ww_grenade_powerup(self, player);
	player thread zm_powerups::powerup_vo("bonus_points_solo");
	return;
}

/*
	Name: ww_grenade_powerup
	Namespace: zm_powerup_ww_grenade
	Checksum: 0x424F4353
	Offset: 0x4C8
	Size: 0x144
	Parameters: 2
	Flags: None
	Line Number: 84
*/
function ww_grenade_powerup(item, player)
{
	if(!player laststand::player_is_in_laststand() && !player.sessionstate == "spectator")
	{
		if(player hasPerk("specialty_widowswine"))
		{
			change = 1;
			oldammo = player GetWeaponAmmoClip(player.current_lethal_grenade);
			maxAmmo = player.current_lethal_grenade.startammo;
			newAmmo = Int(min(maxAmmo, max(0, oldammo + change)));
			player SetWeaponAmmoClip(player.current_lethal_grenade, newAmmo);
		}
	}
}

