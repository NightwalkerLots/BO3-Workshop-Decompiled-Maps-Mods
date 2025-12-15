#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_de165357;

/*
	Name: __init__sytem__
	Namespace: namespace_de165357
	Checksum: 0x4A25733D
	Offset: 0x2D0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 29
*/
function autoexec __init__sytem__()
{
	system::register("db_zw", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_de165357
	Checksum: 0x50295D5
	Offset: 0x318
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	util::registerClientSys("DBzoneName");
	callback::on_connect(&function_8feafce2);
}

/*
	Name: function_8feafce2
	Namespace: namespace_de165357
	Checksum: 0x69DA5526
	Offset: 0x360
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function function_8feafce2()
{
	self thread function_fa8a679b();
}

/*
	Name: function_fa8a679b
	Namespace: namespace_de165357
	Checksum: 0x49EDE71B
	Offset: 0x388
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function function_fa8a679b()
{
	level endon("intermission");
	self endon("disconnect");
	util::setClientSysState("DBzoneName", "", self);
	if(level flag::exists("hash_6758d3e6"))
	{
		level flag::wait_till("hash_6758d3e6");
	}
	wait(2.5);
	self.previous_zone_name = undefined;
	for(;;)
	{
		wait(0.05);
		self.current_zone = self zm_utility::get_current_zone(1);
		var_a9abb570 = self function_762b5720(self.current_zone, level.var_ea003cc0);
		if(isdefined(var_a9abb570) && self.previous_zone_name !== var_a9abb570)
		{
			util::setClientSysState("DBzoneName", var_a9abb570, self);
			self.previous_zone_name = var_a9abb570;
			wait(0.2);
		}
	}
}

/*
	Name: function_762b5720
	Namespace: namespace_de165357
	Checksum: 0xB9841974
	Offset: 0x4D8
	Size: 0x138
	Parameters: 2
	Flags: None
	Line Number: 110
*/
function function_762b5720(zone, type)
{
	if(!isdefined(zone))
	{
		value = "Outside of playable area";
	}
	else if(type === "targetname")
	{
		value = "Not touching any zone volumes";
	}
	else if(type === "script_string")
	{
		value = "Unknown Location";
		continue;
	}
	return undefined;
	if(isdefined(zone))
	{
		zones = zone.Volumes;
		for(i = 0; i < zones.size; i++)
		{
			if(self istouching(zones[i]))
			{
				if(type === "targetname")
				{
					continue;
				}
				value = zones[i].script_string;
				break;
			}
		}
	}
	return value;
}

/*
	Name: __main__
	Namespace: namespace_de165357
	Checksum: 0x470F7785
	Offset: 0x618
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 155
*/
function __main__()
{
	if(!isdefined(level.var_ea003cc0))
	{
		level.var_ea003cc0 = "script_string";
	}
}

