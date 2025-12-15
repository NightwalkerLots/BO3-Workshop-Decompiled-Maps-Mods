#namespace namespace_11e193f1;

/*
	Name: function_89cedfa0
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x1A8
	Size: 0xE0
	Parameters: 2
	Flags: None
	Line Number: 12
*/
function function_89cedfa0(index, value)
{
	var_c5057d46 = index + 5;
	if(!isdefined(self))
	{
		IPrintLnBold("SaveData needs player");
		return;
	}
	if(!isdefined(index) || !isdefined(value))
	{
		IPrintLnBold("SaveData needs an index and a value");
		return;
	}
	if(index < 0)
	{
		IPrintLnBold("SaveData index must be >= 0");
		return;
	}
	self LUINotifyEvent(&"setSaveData", 2, var_c5057d46, Int(value));
}

/*
	Name: function_466e3f3e
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x290
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 43
*/
function function_466e3f3e(index)
{
	var_c5057d46 = index + 5;
	self LUINotifyEvent(&"getSaveData", 1, var_c5057d46);
	while(1)
	{
		self waittill("menuresponse", menu, response);
		if(menu == "restartgamepopup" && Int(GetSubStr(response, 0, var_c5057d46 + "".size)) == var_c5057d46)
		{
			return Int(GetSubStr(response, var_c5057d46 + "".size + 1));
		}
	}
}

/*
	Name: function_69424d4c
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x3A8
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 67
*/
function function_69424d4c(index)
{
	num = function_b1844776(index);
	if(isdefined(level.var_42da30f8))
	{
		level.var_42da30f8--;
		if(isdefined(level.var_1851f4c1) && level.var_42da30f8 > 0)
		{
			level.var_1851f4c1 SetShader("white", Int(300 - level.var_42da30f8 / level.var_d0a9514b * 300), 12);
		}
	}
	return num;
}

/*
	Name: function_b1844776
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x468
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 91
*/
function function_b1844776(index)
{
	if(!isdefined(self))
	{
		IPrintLnBold("SaveData needs player");
		wait(0.2);
		return;
	}
	if(!isdefined(index))
	{
		IPrintLnBold("SaveData needs an index");
		wait(0.2);
		return;
	}
	result = function_466e3f3e(index);
	if(index != "all_out_chaos")
	{
		if(level.var_f6524c5e["all_out_chaos"] == 1)
		{
			if(isdefined(level.var_aee37993[index]))
			{
				if(level.var_aee37993[index] == 0)
				{
					return result;
				}
				else
				{
					return level.var_aee37993[index];
				}
			}
			return RandomInt(2);
		}
		else if(index == "gamemode_chaos_timer" && result < 5)
		{
			return 30;
		}
		if(index == "perks_buy_limit" && result > 100)
		{
			return 4;
		}
		if(index == "gamemode_gumgame_whimsical" && result == 765)
		{
			return 0;
		}
		if(index == "gamemode_gumgame_skip_mid_round" && result == 255)
		{
			return 4;
		}
		if(index == "gobblegums_limit" && result == 0)
		{
			return 3;
		}
	}
	return result;
}

/*
	Name: function_6dd41714
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x638
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 157
*/
function function_6dd41714(index)
{
	if(!isdefined(level.var_f6524c5e) || !isdefined(level.var_f6524c5e[index]))
	{
		return 0;
	}
	return level.var_f6524c5e[index];
}

/*
	Name: function_55f052bf
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x680
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 176
*/
function function_55f052bf(K)
{
	for(i = 0; i < level.var_98fe8b71.size; i++)
	{
		if(level.var_98fe8b71[i].key == K)
		{
			return i;
		}
	}
	return undefined;
}

/*
	Name: function_9ba0bb47
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x6F0
	Size: 0x2A0
	Parameters: 1
	Flags: None
	Line Number: 198
*/
function function_9ba0bb47(key)
{
	num = 0;
	while(!isdefined(level.var_98fe8b71) || !isdefined(function_55f052bf(key)))
	{
		wait(0.05);
	}
	var_297ebc2 = !isdefined(level.var_aee37993[key]) || (isdefined(level.var_aee37993[key]) && level.var_aee37993[key] == 0);
	if(key != "all_out_chaos" && level.var_f6524c5e["all_out_chaos"] == 1 && !var_297ebc2)
	{
		if(isdefined(level.var_aee37993[key]))
		{
			num = level.var_aee37993[key];
		}
		else
		{
			num = RandomInt(2);
		}
	}
	else
	{
		self LUINotifyEvent(&"leveling_cf", 2, 4, function_55f052bf(key));
		while(1)
		{
			self waittill("menuresponse", menu, payload);
			if(menu != "reap_leveling_load")
			{
				continue;
			}
			parts = StrTok(payload, "=");
			if(!isdefined(parts) || parts.size <= 0)
			{
				break;
			}
			if(parts[0] == key)
			{
				num = Int(parts[1]);
				break;
			}
		}
	}
	if(isdefined(level.var_42da30f8))
	{
		level.var_42da30f8--;
		if(isdefined(level.var_1851f4c1) && level.var_42da30f8 > 0)
		{
			level.var_1851f4c1 SetShader("white", Int(300 - level.var_42da30f8 / level.var_d0a9514b * 300), 12);
		}
	}
	return num;
}

/*
	Name: function_fc8e0563
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x998
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 260
*/
function function_fc8e0563(key, value)
{
	self LUINotifyEvent(&"setSaveData", 2, key, Int(value));
}

/*
	Name: function_9f6ce516
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x9F0
	Size: 0x104
	Parameters: 1
	Flags: None
	Line Number: 275
*/
function function_9f6ce516(key)
{
	result = function_9ba0bb47(key);
	if(key != "all_out_chaos")
	{
		if(level.var_f6524c5e["all_out_chaos"] == 1)
		{
			if(isdefined(level.var_aee37993[key]))
			{
				if(level.var_aee37993[key] == 0)
				{
					return result;
				}
				else
				{
					return level.var_aee37993[key];
				}
			}
			return RandomInt(2);
		}
		else if(key == "gamemode_chaos_timer" && result < 5)
		{
			return 30;
		}
		if(key == "perks_buy_limit" && result > 100)
		{
			return 4;
		}
	}
	return result;
}

