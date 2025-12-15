#include scripts\shared\util_shared;

#namespace namespace_cc012897;

/*
	Name: function_88207f40
	Namespace: namespace_cc012897
	Checksum: 0x424F4353
	Offset: 0x188
	Size: 0xE8
	Parameters: 1
	Flags: Private
	Line Number: 14
*/
function private function_88207f40(MapName)
{
	switch(MapName)
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
		case "zm_tomb":
		{
			return 1;
		}
		case "zm_die":
		{
			return 1;
		}
		case "zm_asylum":
		{
			return 1;
		}
		case "zm_theater":
		{
			return 1;
		}
		case "zm_cosmodrome":
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: result
	Namespace: namespace_cc012897
	Checksum: 0x424F4353
	Offset: 0x278
	Size: 0x2B8
	Parameters: 2
	Flags: None
	Line Number: 88
*/
function result(localClientNum, message)
{
	MapName = GetDvarString("mapname");
	if(!isdefined(level.var_8b464307))
	{
		level.var_8b464307 = function_88207f40(MapName);
	}
	if(isdefined(level.var_8b464307))
	{
		var_8a08f6b1 = StrTok(message, "â¦");
		if(var_8a08f6b1.size == 2)
		{
			sub = ToLower(var_8a08f6b1[0]);
			time = Int(var_8a08f6b1[1]);
			time = time + 1000;
			var_5c251ebd = function_3be4cd97();
			var_e7cd70d6 = tableLookup("gamedata/tables/common/stroy_" + var_5c251ebd + "sub_zc_gum.csv", 1, sub, 2);
			if(isdefined(var_e7cd70d6) && var_e7cd70d6 != "")
			{
				function_39659176(localClientNum, time, var_e7cd70d6);
			}
			else
			{
				var_e7cd70d6 = tableLookup("gamedata/tables/common/stroy_" + var_5c251ebd + "sub_" + MapName + "_1.csv", 1, sub, 2);
				if(isdefined(var_e7cd70d6) && var_e7cd70d6 != "")
				{
					function_39659176(localClientNum, time, var_e7cd70d6);
				}
				else
				{
					var_e7cd70d6 = tableLookup("gamedata/tables/common/stroy_" + var_5c251ebd + "sub_" + MapName + "_2.csv", 1, sub, 2);
					if(isdefined(var_e7cd70d6) && var_e7cd70d6 != "")
					{
						function_39659176(localClientNum, time, var_e7cd70d6);
					}
				}
			}
		}
	}
}

/*
	Name: function_3be4cd97
	Namespace: namespace_cc012897
	Checksum: 0x424F4353
	Offset: 0x538
	Size: 0x46
	Parameters: 0
	Flags: None
	Line Number: 139
*/
function function_3be4cd97()
{
	var_5c251ebd = GetDvarString("loc_availableLanguages");
	if(var_5c251ebd == "sc_")
	{
		return "sc_";
	}
	return "en_";
}

