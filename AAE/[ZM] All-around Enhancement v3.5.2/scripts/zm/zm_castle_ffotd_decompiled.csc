#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_utility;

#namespace namespace_6b519a03;

/*
	Name: main_start
	Namespace: namespace_6b519a03
	Checksum: 0x424F4353
	Offset: 0x190
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 21
*/
function main_start()
{
	level._effect["zm_castle_bossfight_light"] = "zm_castle_bossfight_light";
	callback::on_localclient_connect(&on_player_connect);
	var_a62cd68b = FindStaticModelIndex((414, 3524.5, 697));
	HideStaticModel(var_a62cd68b);
}

/*
	Name: main_end
	Namespace: namespace_6b519a03
	Checksum: 0x424F4353
	Offset: 0x220
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function main_end()
{
}

/*
	Name: on_player_connect
	Namespace: namespace_6b519a03
	Checksum: 0x424F4353
	Offset: 0x230
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 53
*/
function on_player_connect(localClientNum)
{
	self endon("disconnect");
	level waittill("hash_51d7bc7c");
	FX = playFX(localClientNum, level._effect["zm_castle_bossfight_light"], (-3009.57, 6968.44, 138.125));
}

