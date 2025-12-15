#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;

#namespace namespace_ac1a876c;

/*
	Name: __init__sytem__
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x2F8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 31
*/
function autoexec __init__sytem__()
{
	system::register("zm_powerup_empty_perk", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x338
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 46
*/
function __init__()
{
	zm_powerups::register_powerup("empty_perk", &function_59e7b1f8);
	if(ToLower(GetDvarString("g_gametype")) != "zcleansed")
	{
		zm_powerups::add_zombie_powerup("empty_perk", "zombie_pickup_perk_bottle", &"", &zm_powerups::func_should_never_drop, 1, 0, 0);
		zm_powerups::powerup_set_statless_powerup("empty_perk");
	}
	level.get_player_perk_purchase_limit = &get_player_perk_purchase_limit;
}

/*
	Name: function_59e7b1f8
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x418
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 67
*/
function function_59e7b1f8(player)
{
	player thread function_ba8751f2();
}

/*
	Name: function_ba8751f2
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x448
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 82
*/
function function_ba8751f2()
{
	if(!isdefined(self.player_perk_purchase_limit))
	{
		self.player_perk_purchase_limit = level.perk_purchase_limit;
	}
	self.player_perk_purchase_limit++;
}

/*
	Name: get_player_perk_purchase_limit
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x478
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 101
*/
function get_player_perk_purchase_limit()
{
	if(isdefined(self.player_perk_purchase_limit))
	{
		return level.perk_purchase_limit + self.player_perk_purchase_limit;
	}
	return level.perk_purchase_limit;
}

/*
	Name: function_ac499d74
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x4B0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function function_ac499d74()
{
}

/*
	Name: function_5d69c3e
	Namespace: namespace_ac1a876c
	Checksum: 0x424F4353
	Offset: 0x4C0
	Size: 0xC
	Parameters: 1
	Flags: None
	Line Number: 134
*/
function function_5d69c3e(cmd)
{
}

