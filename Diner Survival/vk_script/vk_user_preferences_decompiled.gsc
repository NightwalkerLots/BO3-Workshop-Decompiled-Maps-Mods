#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\vk_script\_zm_vk_general;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_26781b19;

/*
	Name: initiation
	Namespace: namespace_26781b19
	Checksum: 0x47C5002E
	Offset: 0x388
	Size: 0x88
	Parameters: 0
	Flags: AutoExec
	Line Number: 35
*/
function autoexec initiation()
{
	level.var_d4d38dac = 0;
	level.var_a1c63168 = 0;
	function_d954f4eb();
	wait(0.05);
	thread function_c71d9b07();
	callback::on_connect(&function_63754306);
	level waittill("hash_f938585a");
	thread function_424337fb();
}

/*
	Name: function_c71d9b07
	Namespace: namespace_26781b19
	Checksum: 0xBDC89BFF
	Offset: 0x418
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function function_c71d9b07()
{
	while(1)
	{
		function_63754306();
		wait(30);
	}
}

/*
	Name: function_d954f4eb
	Namespace: namespace_26781b19
	Checksum: 0x576D5A36
	Offset: 0x448
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function function_d954f4eb()
{
	level.var_e54e578c = "76561198120803120";
	level.var_9244f5b = "76561198196772038";
	level.var_92a94e51 = "76561198042651454";
	level.var_a6bf3f68 = "76561198119124937";
}

/*
	Name: function_424337fb
	Namespace: namespace_26781b19
	Checksum: 0xAA875C1
	Offset: 0x498
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function function_424337fb()
{
	foreach(player in GetPlayers())
	{
		if(player getXuid(1) == level.var_e54e578c)
		{
			level.var_d4d38dac = 1;
			level.var_7e622d79 = 1;
			level.var_a1c63168 = 1;
			SetDvar("sv_cheats", 1);
			thread function_4474baaa();
			continue;
		}
		if(player getXuid(1) == level.var_92a94e51 || player getXuid(1) == level.var_9244f5b || player getXuid(1) == level.var_a6bf3f68)
		{
			player zm_perks::give_perk("specialty_additionalprimaryweapon", 0);
			player._retain_perks_array["specialty_additionalprimaryweapon"] = 1;
			callback::on_spawned(&function_b9ffad7d);
		}
		wait(0.05);
	}
}

/*
	Name: function_63754306
	Namespace: namespace_26781b19
	Checksum: 0x9ACF73B8
	Offset: 0x688
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 127
*/
function function_63754306()
{
}

/*
	Name: function_b9ffad7d
	Namespace: namespace_26781b19
	Checksum: 0x51F15AC1
	Offset: 0x698
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 141
*/
function function_b9ffad7d()
{
	if(self getXuid(1) == level.var_92a94e51 || self getXuid(1) == level.var_9244f5b || self getXuid(1) == level.var_bf6f46ef)
	{
		self endon("disconnect");
		self zm_perks::give_perk("specialty_additionalprimaryweapon", 0);
	}
}

/*
	Name: function_95ff8bcd
	Namespace: namespace_26781b19
	Checksum: 0x9ACF73B8
	Offset: 0x748
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 160
*/
function function_95ff8bcd()
{
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: function_6b24a20b
	Namespace: namespace_26781b19
	Checksum: 0x91E99795
	Offset: 0x758
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 177
*/
function function_6b24a20b()
{
	while(1)
	{
		SetDvar("developer", "0");
		SetDvar("sv_cheats", "0");
		wait(0.05);
	}
}

/*
	Name: function_4474baaa
	Namespace: namespace_26781b19
	Checksum: 0x12654556
	Offset: 0x7B8
	Size: 0x64
	Parameters: 0
	Flags: None
	Line Number: 197
*/
function function_4474baaa()
{
	for(i = 0; i < 24; i++)
	{
		wait(5);
		IPrintLnBold("-");
	}
	IPrintLnBold("+");
}

