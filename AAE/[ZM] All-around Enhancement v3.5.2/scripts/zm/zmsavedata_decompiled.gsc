#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\zm\_zm;
#include scripts\zm\banks;

#namespace namespace_11e193f1;

/*
	Name: function_89cedfa0
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x208
	Size: 0x20
	Parameters: 3
	Flags: None
	Line Number: 18
*/
function function_89cedfa0(index, value, valid)
{
}

/*
	Name: function_466e3f3e
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x230
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 32
*/
function function_466e3f3e(index)
{
}

/*
	Name: function_69424d4c
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x248
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 46
*/
function function_69424d4c(index)
{
}

/*
	Name: function_6425b622
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x260
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 60
*/
function function_6425b622(index)
{
}

/*
	Name: function_4f1b8b7c
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x278
	Size: 0x30
	Parameters: 3
	Flags: None
	Line Number: 74
*/
function function_4f1b8b7c(path, line, text)
{
	if(!isdefined(line))
	{
		line = 1;
	}
}

/*
	Name: function_260d0757
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x2B0
	Size: 0x30
	Parameters: 3
	Flags: None
	Line Number: 92
*/
function function_260d0757(path, line, text)
{
	if(!isdefined(line))
	{
		line = 1;
	}
}

/*
	Name: function_114eb75f
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x2E8
	Size: 0x30
	Parameters: 3
	Flags: None
	Line Number: 110
*/
function function_114eb75f(path, line, text)
{
	if(!isdefined(line))
	{
		line = 1;
	}
}

/*
	Name: function_829e88d2
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x320
	Size: 0x30
	Parameters: 3
	Flags: None
	Line Number: 128
*/
function function_829e88d2(path, line, text)
{
	if(!isdefined(line))
	{
		line = 1;
	}
}

/*
	Name: function_2812fe55
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x358
	Size: 0xE8
	Parameters: 2
	Flags: None
	Line Number: 146
*/
function function_2812fe55(index, value)
{
	if(!self IsTestClient() && isdefined(self) && isPlayer(self) && isdefined(index) && isdefined(value) && Int(index) && Int(value))
	{
		self LUINotifyEvent(&"ELMGData", 3, 2, Int(index), Int(value));
	}
}

/*
	Name: function_15dae02d
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x448
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 164
*/
function function_15dae02d(index)
{
	if(!self IsTestClient() && isdefined(self) && isPlayer(self) && isdefined(index) && Int(index))
	{
		self LUINotifyEvent(&"ELMGData", 3, 3, Int(index), 0);
	}
}

/*
	Name: function_1a958da0
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x4F8
	Size: 0x178
	Parameters: 1
	Flags: None
	Line Number: 182
*/
function function_1a958da0(index)
{
	if(!self IsTestClient() && isdefined(self) && isPlayer(self) && isdefined(index) && Int(index))
	{
		self endon("disconnect");
		self LUINotifyEvent(&"ELMGData", 3, 4, Int(index), 0);
		for(;;)
		{
			self waittill("menuresponse", menu, response);
			if(IsSubStr(response, "ELMGDataGet") && menu == "restartgamepopup" && Int(StrTok(response, "=")[2]) == index)
			{
				return Int(StrTok(response, "=")[1]);
			}
		}
	}
	return 0;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_9ec531f4
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x678
	Size: 0xE8
	Parameters: 2
	Flags: None
	Line Number: 212
*/
function function_9ec531f4(index, value)
{
	if(!self IsTestClient() && isdefined(self) && isPlayer(self) && isdefined(index) && isdefined(value) && Int(index) && Int(value))
	{
		self LUINotifyEvent(&"ELMGData", 3, 5, Int(index), Int(value));
	}
}

/*
	Name: function_d7942e29
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x768
	Size: 0x268
	Parameters: 1
	Flags: None
	Line Number: 230
*/
function function_d7942e29(bool)
{
	if(!isdefined(bool))
	{
		bool = 1;
	}
	self endon("hash_2fa4464b");
	if(isdefined(self) && self != level && self IsTestClient())
	{
		return 0;
	}
	if(isdefined(self) && isPlayer(self))
	{
		self endon("disconnect");
		if(bool == 1)
		{
			self LUINotifyEvent(&"ELMGData", 3, 6, 1, 0);
			for(;;)
			{
				self waittill("menuresponse", menu, response);
				if(IsSubStr(response, "ELMGDataStats") && menu == "restartgamepopup")
				{
					return Int(StrTok(response, "=")[1]);
				}
			}
		}
		else if(isdefined(self.var_bef468a3))
		{
			self LUINotifyEvent(&"ELMGData", 3, 6, 2, 0);
			return 1;
		}
	}
	else
	{
		foreach(player in GetPlayers())
		{
			if(isdefined(player.var_bef468a3) && !player IsTestClient())
			{
				player LUINotifyEvent(&"ELMGData", 3, 6, 2, 0);
			}
		}
	}
	return 0;
}

/*
	Name: function_66a72324
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x9D8
	Size: 0x1A8
	Parameters: 1
	Flags: None
	Line Number: 285
*/
function function_66a72324(var_4710af72)
{
	if(!isdefined(var_4710af72))
	{
		var_4710af72 = 0;
	}
	if(var_4710af72 && GetDvarString("tfoption_bank") == "1")
	{
		return 0;
	}
	if(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver"))
	{
		if(GetDvarInt("tfoption_higher_health") >= 11 || GetDvarInt("tfoption_extra_cash") || GetDvarInt("tfoption_melee_bonus") || GetDvarInt("tfoption_headshot_bonus") || GetDvarInt("tfoption_start_points" != 500) || GetDvarInt("tfoption_better_nuke"))
		{
			return 0;
		}
	}
	else
	{
		return 0;
	}
	if(GetDvarInt("elmg_cheats") || GetDvarInt("sv_cheats"))
	{
		return 0;
	}
	if(isdefined(level.var_3c40c482))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_be47242b
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0xB88
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 327
*/
function function_be47242b()
{
	thread function_84aa3282();
	callback::on_connect(&function_d5616227);
	level.var_15dae02d = &function_15dae02d;
}

/*
	Name: function_d5616227
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0xBE0
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 344
*/
function function_d5616227()
{
	self endon("disconnect");
	if(GetDvarInt("elmg_cheats") != 1)
	{
		SetDvar("sv_cheats", 0);
	}
	if(function_66a72324())
	{
		while(!isdefined(self.var_1da7a07d))
		{
			wait(0.05);
		}
		self.var_def06a03 = 0;
		for(i = 0; i < 10; i++)
		{
			if(isdefined(self.var_bef468a3) && self.var_bef468a3 == 1)
			{
				self.var_def06a03 = self function_1a958da0(5);
				return;
			}
			else
			{
				self notify("hash_2fa4464b");
				self thread function_149dca78();
			}
			wait(2);
		}
	}
}

/*
	Name: function_149dca78
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0xD00
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 385
*/
function function_149dca78()
{
	self endon("hash_2fa4464b");
	self.var_bef468a3 = self function_d7942e29(1);
	return;
}

/*
	Name: function_84aa3282
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0xD38
	Size: 0x330
	Parameters: 0
	Flags: None
	Line Number: 402
*/
function function_84aa3282()
{
	level endon("end_game");
	level endon("game_ended");
	level waittill("hash_f938585a");
	if(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver") && (GetDvarInt("tfoption_higher_health") >= 112 || GetDvarInt("tfoption_extra_cash") || GetDvarInt("tfoption_melee_bonus") || GetDvarInt("tfoption_headshot_bonus") || GetDvarInt("tfoption_start_points" != 500) || GetDvarInt("tfoption_better_nuke")))
	{
		thread banks::function_b63a1fa0();
		return;
	}
	if(function_f67270e2())
	{
		thread banks::function_b63a1fa0();
		return;
	}
	thread function_7456b7eb();
	while(!isdefined(level.var_41b62535))
	{
		if(function_f67270e2())
		{
			thread banks::function_b63a1fa0();
			return;
		}
		wait(0.048);
	}
	for(;;)
	{
		wait(0.048);
		if(zm::get_round_number() < 7)
		{
			foreach(player in level.players)
			{
				if(player.var_e40938e9 >= 120000)
				{
					thread banks::function_b63a1fa0();
					return;
				}
			}
		}
		else
		{
			foreach(player in level.players)
			{
				if(player.var_e40938e9 >= 1000000)
				{
					thread banks::function_b63a1fa0();
					return;
				}
			}
		}
	}
}

/*
	Name: function_7456b7eb
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x1070
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 465
*/
function function_7456b7eb()
{
	level endon("end_game");
	level endon("game_ended");
	level waittill("earned_points");
	level.var_41b62535 = 1;
	return;
	~level.var_41b62535;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f67270e2
	Namespace: namespace_11e193f1
	Checksum: 0x424F4353
	Offset: 0x10B0
	Size: 0x92
	Parameters: 0
	Flags: None
	Line Number: 486
*/
function function_f67270e2()
{
	foreach(player in level.players)
	{
		if(player.score > 500)
		{
			return 1;
		}
	}
	return 0;
}

