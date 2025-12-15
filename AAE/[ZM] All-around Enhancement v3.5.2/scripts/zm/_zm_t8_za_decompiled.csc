#include scripts\shared\util_shared;

#namespace namespace_b02b3342;

/*
	Name: function_88207f40
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0x290
	Size: 0x298
	Parameters: 0
	Flags: Private
	Line Number: 14
*/
function private function_88207f40()
{
	level.var_a42322a1 = function_e3cd744c();
	level.var_c806fcb3 = [];
	level.var_c806fcb3["a"] = 1;
	level.var_c806fcb3["b"] = 1;
	level.var_c806fcb3["c"] = 1;
	level.var_c806fcb3["d"] = 1;
	level.var_c806fcb3["e"] = 1;
	level.var_c806fcb3["f"] = 1;
	level.var_c806fcb3["g"] = 1;
	level.var_c806fcb3["h"] = 1;
	level.var_c806fcb3["i"] = 1;
	level.var_c806fcb3["j"] = 1;
	level.var_c806fcb3["k"] = 1;
	level.var_c806fcb3["l"] = 1;
	level.var_c806fcb3["m"] = 1;
	level.var_c806fcb3["n"] = 1;
	level.var_c806fcb3["o"] = 1;
	level.var_c806fcb3["p"] = 1;
	level.var_c806fcb3["q"] = 1;
	level.var_c806fcb3["r"] = 1;
	level.var_c806fcb3["s"] = 1;
	level.var_c806fcb3["t"] = 1;
	level.var_c806fcb3["u"] = 1;
	level.var_c806fcb3["v"] = 1;
	level.var_c806fcb3["w"] = 1;
	level.var_c806fcb3["x"] = 1;
	level.var_c806fcb3["y"] = 1;
	level.var_c806fcb3["z"] = 1;
	return;
}

/*
	Name: function_70f1289f
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0x530
	Size: 0x188
	Parameters: 2
	Flags: None
	Line Number: 57
*/
function function_70f1289f(var_3d850ea0, var_72055a75)
{
	if(GetDvarString("aaeoption_za") == "1")
	{
		return;
	}
	if(!isdefined(level.var_a42322a1))
	{
		function_88207f40();
	}
	zone_array = StrTok(var_72055a75, "â¦");
	player = GetLocalPlayer(var_3d850ea0);
	if(player GetEntityNumber() == Int(zone_array[0]))
	{
		model = GetUIModel(GetUIModelForController(var_3d850ea0), "hudItems.za");
		model2 = GetUIModel(GetUIModelForController(var_3d850ea0), "hudItems.za2");
		player function_8a77e21a(model, zone_array[1], var_3d850ea0, model2);
	}
}

/*
	Name: function_8a77e21a
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0x6C0
	Size: 0x3F8
	Parameters: 4
	Flags: None
	Line Number: 87
*/
function function_8a77e21a(model, zone_name, localClientNum, model2)
{
	if(isdefined(level.var_a42322a1) && level.var_a42322a1)
	{
		if(zone_name == "zone_start")
		{
			zoneName = MakeLocalizedString(tableLookup("gamedata/tables/common/zonename.csv", 6, GetDvarString("mapname"), function_3be4cd97() + 5));
			self thread function_540722f0(model, zoneName, model2);
			return;
		}
		if(zone_name == "bridge_zone")
		{
			zoneName = MakeLocalizedString(tableLookup("gamedata/tables/common/zonename.csv", 11, GetDvarString("mapname"), function_3be4cd97() + 10));
			self thread function_540722f0(model, zoneName, model2);
			return;
		}
		if(zone_name == "start_zone")
		{
			zoneName = MakeLocalizedString(tableLookup("gamedata/tables/common/zonename.csv", 16, GetDvarString("mapname"), function_3be4cd97() + 15));
			if(zoneName == "")
			{
				zoneName = MakeLocalizedString(tableLookup("gamedata/tables/common/zonename.csv", 16, GetDvarString("ui_mapname"), function_3be4cd97() + 15));
			}
			self thread function_540722f0(model, zoneName, model2);
			return;
		}
		if(zone_name == "generator_zone")
		{
			zoneName = MakeLocalizedString(tableLookup("gamedata/tables/common/zonename.csv", 21, GetDvarString("mapname"), function_3be4cd97() + 20));
			self thread function_540722f0(model, zoneName, model2);
			return;
		}
		if(Int(tableLookup("gamedata/tables/common/zonename.csv", 0, zone_name, 1)) == 1)
		{
			zoneName = MakeLocalizedString(tableLookup("gamedata/tables/common/zonename.csv", 0, zone_name, function_3be4cd97()));
			self thread function_540722f0(model, zoneName, model2);
			return;
		}
	}
	self thread function_540722f0(model, MakeLocalizedString(zone_name), model2);
}

/*
	Name: function_540722f0
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0xAC0
	Size: 0x388
	Parameters: 3
	Flags: None
	Line Number: 139
*/
function function_540722f0(model, string, model2)
{
	if(!isdefined(self.var_946d7154))
	{
		self.var_946d7154 = string;
	}
	else if(self.var_946d7154 == string)
	{
		return;
	}
	else
	{
		self.var_946d7154 = string;
	}
	self notify("hash_540722f0");
	self endon("hash_540722f0");
	var_5ffc3ccc = "";
	if(string == "" || string == " " || string == "  ")
	{
		SetUIModelValue(model, var_5ffc3ccc);
		return;
	}
	else
	{
		SetUIModelValue(model, "_");
	}
	if(IsSubStr(string, "_"))
	{
		var_df6d7db4 = StrTok(string, "_");
		string = var_5ffc3ccc;
		for(i = 0; i < var_df6d7db4.size; i++)
		{
			text = var_df6d7db4[i];
			var_df98308 = "";
			for(z = 0; z < text.size; z++)
			{
				if(z == 0)
				{
					var_df98308 = toupper(text[z]);
					continue;
				}
				var_df98308 = var_df98308 + text[z];
			}
			string = string + var_df98308 + " ";
		}
	}
	else if(isdefined(level.var_c806fcb3[string[0]]))
	{
		var_df98308 = "";
		for(z = 0; z < string.size; z++)
		{
			if(z == 0)
			{
				var_df98308 = toupper(string[z]);
				continue;
			}
			var_df98308 = var_df98308 + string[z];
		}
		string = var_df98308;
	}
	SetUIModelValue(model2, string);
	for(i = 0; i < string.size; i++)
	{
		WaitRealTime(0.032);
		var_5ffc3ccc = var_5ffc3ccc + string[i];
		if(i == string.size - 1)
		{
			SetUIModelValue(model, var_5ffc3ccc);
			continue;
		}
		SetUIModelValue(model, var_5ffc3ccc + "_");
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3be4cd97
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0xE50
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function function_3be4cd97()
{
	switch(GetDvarString("loc_availableLanguages"))
	{
		case "sc_":
		{
			return 3;
			break;
		}
		case "tc_":
		{
			return 3;
			break;
		}
		case "es_":
		{
			return 4;
			break;
		}
		case "it_":
		{
			return 5;
			break;
		}
		default
		{
			return 2;
			break;
		}
	}
}

/*
	Name: function_e3cd744c
	Namespace: namespace_b02b3342
	Checksum: 0x424F4353
	Offset: 0xEE0
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 267
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
	return 0;
}

