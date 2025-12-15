#include scripts\codescripts\struct;
#include scripts\shared\math_shared;
#include scripts\zm\_zm_stats;
#include scripts\zm\gametypes\_zm_gametype;

#namespace ZCLASSIC;

/*
	Name: main
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x130
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 17
*/
function main()
{
	if(GetDvarString("mapname") == "zm_mori2")
	{
		level.var_ce4509a = "survival";
	}
	zm_gametype::main();
	level.onPrecacheGameType = &onPrecacheGameType;
	level.onStartGameType = &onStartGameType;
	level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
	level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
}

/*
	Name: onPrecacheGameType
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x1E8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function onPrecacheGameType()
{
	level.playerSuicideAllowed = 1;
	level.canPlayerSuicide = &zm_gametype::canPlayerSuicide;
}

/*
	Name: onStartGameType
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x218
	Size: 0x154
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function onStartGameType()
{
	level.spawnMins = (0, 0, 0);
	level.spawnMaxs = (0, 0, 0);
	structs = struct::get_array("player_respawn_point", "targetname");
	foreach(struct in structs)
	{
		level.spawnMins = math::expand_mins(level.spawnMins, struct.origin);
		level.spawnMaxs = math::expand_maxs(level.spawnMaxs, struct.origin);
	}
	level.mapCenter = math::find_box_center(level.spawnMins, level.spawnMaxs);
	setMapCenter(level.mapCenter);
}

