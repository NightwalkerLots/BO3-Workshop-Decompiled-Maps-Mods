#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\music_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;

#namespace namespace_cb7a4283;

/*
	Name: __init__sytem__
	Namespace: namespace_cb7a4283
	Checksum: 0xEDF4EEBC
	Offset: 0x338
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("ambient_room", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_cb7a4283
	Checksum: 0xC1211C4A
	Offset: 0x378
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	level.var_f2922fba = "sound/ambients/vk_tra_shared_ambient_mod.csv";
	if(!isdefined(level.var_60332ce5))
	{
		if(isdefined(undefined))
		{
			continue;
		}
		level.var_60332ce5 = function_bc346c96();
	}
	level.var_255e709f = 0;
	level.var_da023af2 = [];
	level.var_bbdcbf14 = "";
	callback::on_localclient_connect(&function_4e972a40);
}

/*
	Name: function_4e972a40
	Namespace: namespace_cb7a4283
	Checksum: 0x8DBDE64E
	Offset: 0x418
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 63
*/
function function_4e972a40(localClientNum)
{
	if(IsSplitScreenHost(localClientNum))
	{
		level thread function_e6025b1e(localClientNum);
	}
}

/*
	Name: function_e6025b1e
	Namespace: namespace_cb7a4283
	Checksum: 0x16DE99FD
	Offset: 0x460
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 81
*/
function function_e6025b1e(localClientNum)
{
	var_da023af2 = GetEntArray(localClientNum, "ambient_room", "targetname");
	foreach(var_cb7a4283 in var_da023af2)
	{
		var_cb7a4283 thread function_a5c260a5(localClientNum);
	}
}

/*
	Name: function_a5c260a5
	Namespace: namespace_cb7a4283
	Checksum: 0xE57D9C3C
	Offset: 0x538
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 100
*/
function function_a5c260a5(localClientNum)
{
	if(!isdefined(level.var_da023af2))
	{
		level.var_da023af2 = [];
	}
	else if(!IsArray(level.var_da023af2))
	{
		level.var_da023af2 = Array(level.var_da023af2);
	}
	level.var_da023af2[level.var_da023af2.size] = self;
	self._localClientNum = localClientNum;
	while(1)
	{
		self waittill("trigger", trigPlayer);
		self thread trigger::function_thread(trigPlayer, &function_8aa40925, &function_bf589afe);
	}
}

/*
	Name: function_b8f8e263
	Namespace: namespace_cb7a4283
	Checksum: 0x3CAB74A7
	Offset: 0x628
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 129
*/
function function_b8f8e263()
{
	var_97d21baa = function_4b13c440();
	function_6badb40d("current active rooms: " + var_97d21baa.size);
	var_3d3a4804 = undefined;
	var_f9b9ae96 = 0;
	if(var_97d21baa.size > 0)
	{
		foreach(var_1828644b in var_97d21baa)
		{
			if(isdefined(var_1828644b.script_ambientpriority))
			{
				if(var_1828644b.script_ambientpriority >= var_f9b9ae96)
				{
					var_f9b9ae96 = var_1828644b.script_ambientpriority;
					var_3d3a4804 = var_1828644b;
					continue;
				}
			}
			function_6badb40d("WARNING: script_ambientpriority is not defined!");
		}
		if(isdefined(var_3d3a4804.script_ambientroom))
		{
			function_6badb40d(var_1828644b.script_ambientroom + " is active now!");
			function_f8208163(var_3d3a4804.script_ambientroom);
			continue;
		}
		function_6badb40d("WARNING: script_ambientroom is not defined!");
		continue;
	}
	function_6badb40d("falling back to default room: " + level.var_60332ce5);
	function_f8208163(level.var_60332ce5);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f8208163
	Namespace: namespace_cb7a4283
	Checksum: 0x61EB2157
	Offset: 0x830
	Size: 0x238
	Parameters: 1
	Flags: None
	Line Number: 175
*/
function function_f8208163(var_cb7a4283)
{
	var_be113504 = tableLookup(level.var_f2922fba, 0, var_cb7a4283, 0);
	if(isdefined(var_be113504) && var_be113504 == var_cb7a4283)
	{
		if(var_cb7a4283 != level.var_bbdcbf14)
		{
			level.var_bbdcbf14 = var_cb7a4283;
			forceambientroom(var_cb7a4283);
			var_b1c17d48 = function_819d4e6e(var_cb7a4283);
			setsoundcontext(var_b1c17d48.var_eda17bc5, var_b1c17d48.var_1737c60a);
			setsoundcontext(var_b1c17d48.var_c79f015c, var_b1c17d48.var_3d3a4073);
			setsoundcontext(var_b1c17d48.var_39a67097, var_b1c17d48.var_cb32d138);
			function_6badb40d("EntityContextType0: " + var_b1c17d48.var_eda17bc5 + " - EntityContextValue0: " + var_b1c17d48.var_1737c60a);
			function_6badb40d("EntityContextType1: " + var_b1c17d48.var_c79f015c + " - EntityContextValue1: " + var_b1c17d48.var_3d3a4073);
			function_6badb40d("EntityContextType2: " + var_b1c17d48.var_39a67097 + " - EntityContextValue2: " + var_b1c17d48.var_cb32d138);
			continue;
		}
		function_6badb40d("current room is already active");
		continue;
	}
	function_6badb40d("ERROR: " + var_cb7a4283 + " is not defined in the table");
}

/*
	Name: function_8aa40925
	Namespace: namespace_cb7a4283
	Checksum: 0x65A26FE9
	Offset: 0xA70
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 209
*/
function function_8aa40925(trigPlayer)
{
	localClientNum = self._localClientNum;
	if(trigPlayer isPlayer() && trigPlayer isLocalPlayer())
	{
		if(isdefined(trigPlayer getlocalclientnumber()) && localClientNum == trigPlayer getlocalclientnumber())
		{
			self.is_active = 1;
			function_b8f8e263();
		}
	}
}

/*
	Name: function_bf589afe
	Namespace: namespace_cb7a4283
	Checksum: 0x55662226
	Offset: 0xB20
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 232
*/
function function_bf589afe(trigPlayer)
{
	localClientNum = self._localClientNum;
	if(trigPlayer isPlayer() && trigPlayer isLocalPlayer())
	{
		if(isdefined(trigPlayer getlocalclientnumber()) && localClientNum == trigPlayer getlocalclientnumber())
		{
			self.is_active = 0;
			function_b8f8e263();
		}
	}
}

/*
	Name: function_819d4e6e
	Namespace: namespace_cb7a4283
	Checksum: 0xF34F0323
	Offset: 0xBD0
	Size: 0x1B0
	Parameters: 1
	Flags: None
	Line Number: 255
*/
function function_819d4e6e(var_cb7a4283)
{
	var_b1c17d48 = spawnstruct();
	var_b1c17d48.var_eda17bc5 = tableLookup(level.var_f2922fba, 0, var_cb7a4283, 6);
	var_b1c17d48.var_1737c60a = tableLookup(level.var_f2922fba, 0, var_cb7a4283, 7);
	var_b1c17d48.var_c79f015c = tableLookup(level.var_f2922fba, 0, var_cb7a4283, 8);
	var_b1c17d48.var_3d3a4073 = tableLookup(level.var_f2922fba, 0, var_cb7a4283, 9);
	var_b1c17d48.var_39a67097 = tableLookup(level.var_f2922fba, 0, var_cb7a4283, 10);
	var_b1c17d48.var_cb32d138 = tableLookup(level.var_f2922fba, 0, var_cb7a4283, 11);
	var_b1c17d48.var_d8621685 = tableLookup(level.var_f2922fba, 0, var_cb7a4283, 12);
	var_b1c17d48.var_e6a3e41c = tableLookup(level.var_f2922fba, 0, var_cb7a4283, 13);
	return var_b1c17d48;
}

/*
	Name: function_bc346c96
	Namespace: namespace_cb7a4283
	Checksum: 0x69051CEE
	Offset: 0xD88
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 279
*/
function function_bc346c96()
{
	return tableLookup(level.var_f2922fba, 2, "yes", 0);
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4b13c440
	Namespace: namespace_cb7a4283
	Checksum: 0x34477593
	Offset: 0xDC0
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 295
*/
function function_4b13c440()
{
	var_97d21baa = [];
	foreach(var_cb7a4283 in level.var_da023af2)
	{
		if(isdefined(var_cb7a4283.is_active) && var_cb7a4283.is_active)
		{
			if(!isdefined(var_97d21baa))
			{
				var_97d21baa = [];
			}
			else if(!IsArray(var_97d21baa))
			{
				var_97d21baa = Array(var_97d21baa);
			}
			var_97d21baa[var_97d21baa.size] = var_cb7a4283;
		}
	}
	return var_97d21baa;
}

/*
	Name: function_6badb40d
	Namespace: namespace_cb7a4283
	Checksum: 0xE4595593
	Offset: 0xED0
	Size: 0x2C
	Parameters: 1
	Flags: None
	Line Number: 326
*/
function function_6badb40d(VAL)
{
	if(level.var_255e709f)
	{
		IPrintLnBold(VAL);
	}
}

