#include scripts\codescripts\struct;
#include scripts\zm\kj_jzm_playerhud;

#namespace ZCLASSIC;

/*
	Name: main
	Namespace: ZCLASSIC
	Checksum: 0x34D3151D
	Offset: 0xC8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 15
*/
function main()
{
	LuiLoad("ui.HUDInject.HUDInject");
	level._zombie_gameModePrecache = &onPrecacheGameType;
	level._zombie_gamemodeMain = &onStartGameType;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: onPrecacheGameType
	Namespace: ZCLASSIC
	Checksum: 0x9ACF73B8
	Offset: 0x120
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function onPrecacheGameType()
{
}

/*
	Name: onStartGameType
	Namespace: ZCLASSIC
	Checksum: 0x9ACF73B8
	Offset: 0x130
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function onStartGameType()
{
}

