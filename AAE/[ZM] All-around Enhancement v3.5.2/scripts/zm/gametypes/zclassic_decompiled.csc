#include scripts\codescripts\struct;

#namespace ZCLASSIC;

/*
	Name: main
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0x98
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 14
*/
function main()
{
	level._zombie_gameModePrecache = &onPrecacheGameType;
	level._zombie_gamemodeMain = &onStartGameType;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: onPrecacheGameType
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0xD8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function onPrecacheGameType()
{
	return;
}

/*
	Name: onStartGameType
	Namespace: ZCLASSIC
	Checksum: 0x424F4353
	Offset: 0xE8
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 47
*/
function onStartGameType()
{
}

