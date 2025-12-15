#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\_zm_weapons;

#namespace namespace_dc53ad81;

/*
	Name: __init__
	Namespace: namespace_dc53ad81
	Checksum: 0x9ACF73B8
	Offset: 0x1C8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 23
*/
function __init__()
{
}

/*
	Name: function_ce79b152
	Namespace: namespace_dc53ad81
	Checksum: 0x5D8A5A0E
	Offset: 0x1D8
	Size: 0x1DC
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function function_ce79b152()
{
	while(1)
	{
		level waittill("hash_d5fbb6f5");
		foreach(player in GetPlayers())
		{
			primary_weapons = player GetWeaponsList(1);
			foreach(weap in primary_weapons)
			{
				if(weap.name == "zod_riotshield")
				{
					player riotshield::player_damage_shield(-1500);
					player giveMaxAmmo("zod_riotshield");
					continue;
				}
				if(weap.name == "zod_riotshield_upgraded")
				{
					player riotshield::player_damage_shield(-1500);
					player giveMaxAmmo("zod_riotshield_upgraded");
				}
			}
		}
	}
}

