#include scripts\shared\callbacks_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_utility;

#namespace namespace_b02b3342;

/*
	Name: main
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0x270
	Size: 0xA8
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec main()
{
	if(GetDvarString("ui_mapname") != "2671909054")
	{
		callback::on_connect(&connected);
		level.var_a42322a1 = function_e3cd744c();
		level.var_8506cc0d = 1;
		level.var_7648389a = 0.5;
		level.var_9e836e07 = 0;
		level.var_b3315ff1 = 0;
		level.var_971c9c28 = 0;
		return;
	}
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: init
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0x320
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function init()
{
	level.var_e2c4731b = [];
}

/*
	Name: function_b5bdb742
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0x338
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 59
*/
function function_b5bdb742(zone)
{
	foreach(z in level.var_e2c4731b)
	{
		if(z == zone)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: connected
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0x3D8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 81
*/
function connected()
{
	if(level.var_f2251f30)
	{
		[[level.var_f2251f30]]();
	}
	self thread function_2bd068b1();
}

/*
	Name: function_2bd068b1
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0x418
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 100
*/
function function_2bd068b1()
{
	level endon("intermission");
	self endon("disconnect");
	zone = self get_player_zone();
	level flag::wait_till("initial_blackscreen_passed");
	wait(1);
	var_180e9ed = "";
	self thread function_d12eb636();
	while(1)
	{
		zone = self get_player_zone();
		zone_name = self function_121e1821(zone, "Name");
		if(var_180e9ed != zone_name)
		{
			self function_a0fb3a25(zone_name);
			var_180e9ed = zone_name;
			if(level.var_8506cc0d == 1)
			{
				wait(level.var_9e836e07 + level.var_b3315ff1 + level.var_971c9c28);
			}
			else
			{
				wait(level.var_b3315ff1);
			}
			wait(level.var_7648389a);
		}
		wait(0.05);
	}
}

/*
	Name: function_d12eb636
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0x578
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 141
*/
function function_d12eb636()
{
	level waittill("intermission");
	wait(0.2);
	self function_a0fb3a25("^7");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_121e1821
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0x5B8
	Size: 0x2E8
	Parameters: 2
	Flags: None
	Line Number: 160
*/
function function_121e1821(zone, type)
{
	if(!isdefined(type))
	{
		type = "Name";
	}
	if(isdefined(level.var_a42322a1) && level.var_a42322a1 == 1 && type == "Name")
	{
		if(level.zone_keys.size != 0 && isdefined(level.zone_keys) && isdefined(level.zones))
		{
			for(z = 0; z < level.zone_keys.size; z++)
			{
				zone_name = level.zone_keys[z];
				zone = level.zones[zone_name];
				for(i = 0; i < zone.Volumes.size; i++)
				{
					if(self istouching(zone.Volumes[i]))
					{
						return zone_name;
					}
				}
			}
			return "HEROES_GENDER_UNKNOWN";
		}
	}
	else if(type == "Name")
	{
		if(function_c21afcb7(zone))
		{
			value = "HEROES_GENDER_UNKNOWN";
		}
		else
		{
			value = "";
		}
	}
	else
	{
		value = "";
	}
	zones = zone.Volumes;
	if(!isdefined(zone))
	{
		return value;
	}
	for(i = 0; i < zones.size; i++)
	{
		if(self istouching(zones[i]))
		{
			if(type == "Snd")
			{
				return zones[i].script_sound;
			}
			if(isdefined(zones[i].script_string) && zones[i].script_string.size > 0)
			{
				value = zones[i].script_string;
				break;
			}
			if(isdefined(zones[i].targetname) && zones[i].targetname.size > 0)
			{
				value = zones[i].targetname;
				break;
			}
		}
	}
	return value;
}

/*
	Name: function_c21afcb7
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0x8A8
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 238
*/
function function_c21afcb7(zone)
{
	zones = zone.Volumes;
	for(i = 0; i < zones.size; i++)
	{
		if(isdefined(zones[i].script_string) && zones[i].script_string != "" && zones[i].script_string != " ")
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_9adf3826
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0x968
	Size: 0xA0
	Parameters: 2
	Flags: None
	Line Number: 261
*/
function function_9adf3826(zone, name)
{
	zones = GetEntArray(zone, "targetname");
	for(i = 0; i < zones.size; i++)
	{
		if(!isdefined(zones[i].script_string))
		{
			zones[i].script_string = name;
		}
	}
}

/*
	Name: function_bbd46cb0
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0xA10
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 283
*/
function function_bbd46cb0(FIN)
{
	level.var_b3315ff1 = FIN;
}

/*
	Name: function_ccb1ce6f
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0xA30
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 298
*/
function function_ccb1ce6f(var_19054267)
{
	level.var_971c9c28 = var_19054267;
}

/*
	Name: function_c14b9829
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0xA50
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 313
*/
function function_c14b9829(fTime)
{
	level.var_9e836e07 = fTime;
}

/*
	Name: function_31a37a3c
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0xA70
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 328
*/
function function_31a37a3c(var_71680ff4)
{
	level.var_8506cc0d = var_71680ff4;
}

/*
	Name: function_a5a7a6ec
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0xA90
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 343
*/
function function_a5a7a6ec(snd)
{
	level.var_6ecf578c = snd;
}

/*
	Name: get_player_zone
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0xAB0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 358
*/
function get_player_zone()
{
	return self zm_utility::get_current_zone(1);
}

/*
	Name: function_e3cd744c
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0xAD8
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 373
*/
function function_e3cd744c()
{
	switch(GetDvarString("ui_mapname"))
	{
		case "zm_zod":
		{
			return 1;
		}
		case "zm_factory":
		{
			return 1;
		}
		case "zm_castle":
		{
			return 1;
		}
		case "zm_island":
		{
			return 1;
		}
		case "zm_stalingrad":
		{
			return 1;
		}
		case "zm_genesis":
		{
			return 1;
		}
		case "zm_theater":
		{
			return 1;
		}
		case "zm_prototype":
		{
			return 1;
		}
		case "zm_asylum":
		{
			return 1;
		}
		case "zm_sumpf":
		{
			return 1;
		}
		case "zm_moon":
		{
			return 1;
		}
		case "zm_temple":
		{
			return 1;
		}
		case "zm_cosmodrome":
		{
			return 1;
		}
		case "zm_tomb":
		{
			return 1;
		}
		case "2112576356":
		{
			return 1;
		}
		case "2271346839":
		{
			return 1;
		}
		case "2910206016":
		{
			return 1;
		}
		case "3373649394":
		{
			return 1;
		}
		case "2272246143":
		{
			return 1;
		}
		case "1406022761":
		{
			return 1;
		}
		case "1624257987":
		{
			return 1;
		}
		case "1680193042":
		{
			return 1;
		}
		case "2769856061":
		{
			return 1;
		}
		case "3558354570":
		{
			return 1;
		}
		case "3435762796":
		{
			return 1;
		}
	}
}

/*
	Name: function_55ea5af3
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0xC68
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 490
*/
function function_55ea5af3()
{
}

/*
	Name: function_a0fb3a25
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0xC78
	Size: 0x7C
	Parameters: 1
	Flags: None
	Line Number: 504
*/
function function_a0fb3a25(var_72055a75)
{
	if(isdefined(var_72055a75) && var_72055a75 != "" && var_72055a75 != " ")
	{
		util::setClientSysState("deadshot_keyline", "zc," + self GetEntityNumber() + "â¦" + var_72055a75);
	}
}

