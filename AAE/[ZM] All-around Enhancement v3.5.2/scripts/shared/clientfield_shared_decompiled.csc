#include scripts\shared\system_shared;

#namespace clientfield;

/*
	Name: init
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x4E0
	Size: 0x78
	Parameters: 0
	Flags: AutoExec
	Line Number: 14
*/
function autoexec init()
{
	SetDvar("flushingamesub", 0);
	SetDvar("isChating", "");
	system::Ignore("zm_flashlight");
	thread function_f9a5da67();
	thread function_1ee13dca();
}

/*
	Name: function_1ee13dca
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x560
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function function_1ee13dca()
{
	wait(2);
	while(1)
	{
		if(GetDvarInt("Axios_delay") > 0)
		{
			while(GetDvarInt("Axios_delay") > 0)
			{
				SetDvar("Axios_delay", GetDvarInt("Axios_delay") - 1);
				WaitRealTime(1);
			}
			SetDvar("Axios_delay", 0);
		}
		wait(0.001);
	}
}

/*
	Name: function_f9a5da67
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x620
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function function_f9a5da67()
{
	wait(2);
	while(1)
	{
		if(GetDvarString("lua_iprintbold") != "")
		{
			function_39659176(0, 2000, GetDvarString("lua_iprintbold"));
			SetDvar("lua_iprintbold", "");
		}
		wait(0.001);
	}
}

/*
	Name: game_start_time
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x6C0
	Size: 0x148
	Parameters: 7
	Flags: None
	Line Number: 85
*/
function game_start_time(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	level notify("game_start_time" + localClientNum);
	level endon("game_start_time" + localClientNum);
	model = CreateUIModel(GetUIModelForController(localClientNum), "hudItems.time.game_start_time");
	if(Int(newVal) < 500)
	{
		SetUIModelValue(model, 0);
		return;
	}
	while(1)
	{
		level.var_aafa3cb3 = level.serverTime - newVal;
		if(level.var_aafa3cb3 < 1)
		{
			SetUIModelValue(model, 0);
		}
		else
		{
			SetUIModelValue(model, level.var_aafa3cb3);
		}
		wait(0.001);
	}
}

/*
	Name: round_complete_time
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x810
	Size: 0xD8
	Parameters: 7
	Flags: None
	Line Number: 120
*/
function round_complete_time(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), "hudItems.time.round_complete_time");
	if(isdefined(level.var_aafa3cb3) && newVal)
	{
		SetUIModelValue(model, level.var_aafa3cb3);
	}
	else
	{
		SetUIModelValue(model, newVal * 1000);
	}
}

/*
	Name: game_end_time
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x8F0
	Size: 0xF8
	Parameters: 7
	Flags: None
	Line Number: 143
*/
function game_end_time(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), "hudItems.time.game_end_time");
	if(isdefined(level.var_aafa3cb3) && newVal)
	{
		SetDvar("aar_gametime", level.var_aafa3cb3);
		SetUIModelValue(model, level.var_aafa3cb3);
	}
	else
	{
		SetUIModelValue(model, newVal * 1000);
	}
}

/*
	Name: quest_complete_time
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x9F0
	Size: 0xD8
	Parameters: 7
	Flags: None
	Line Number: 167
*/
function quest_complete_time(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	model = CreateUIModel(GetUIModelForController(localClientNum), "hudItems.time.quest_complete_time");
	if(isdefined(level.var_aafa3cb3) && newVal)
	{
		SetUIModelValue(model, level.var_aafa3cb3);
	}
	else
	{
		SetUIModelValue(model, newVal * 1000);
	}
}

/*
	Name: gameplay_started_callback
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0xAD0
	Size: 0xE0
	Parameters: 7
	Flags: None
	Line Number: 190
*/
function gameplay_started_callback(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		model = GetUIModel(GetUIModelForController(localClientNum), "hudItems.aaeIntroBlack");
		SetUIModelValue(model, 0);
		wait(0.1);
		SetUIModelValue(model, 2);
	}
	SetDvar("cg_isGameplayActive", newVal);
}

/*
	Name: register
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0xBB8
	Size: 0x1E8
	Parameters: 8
	Flags: None
	Line Number: 212
*/
function register(str_pool_name, str_name, n_version, n_bits, str_type, func_callback, var_3debd71e, var_37d3ccda)
{
	if(str_name == "gameplay_started")
	{
		func_callback = &gameplay_started_callback;
	}
	if(str_name == "game_start_time")
	{
		func_callback = &game_start_time;
	}
	if(str_name == "round_complete_time")
	{
		func_callback = &round_complete_time;
	}
	if(str_name == "game_end_time")
	{
		func_callback = &game_end_time;
	}
	if(str_name == "quest_complete_time")
	{
		func_callback = &quest_complete_time;
	}
	if(GetDvarString("mapname") == "zm_moon" && str_name == "astro_name_index")
	{
		func_callback = &set_astro_name;
	}
	if(GetDvarString("mapname") == "zm_theater" && str_name == "player_teleport_fx")
	{
		func_callback = &function_2b23adc9;
	}
	if(str_name == "in_igc")
	{
		func_callback = &in_igc;
	}
	if(function_90b279c9(str_name))
	{
		RegisterClientField(str_pool_name, str_name, n_version, n_bits, str_type, func_callback, var_3debd71e, var_37d3ccda);
	}
}

/*
	Name: function_2b23adc9
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0xDA8
	Size: 0x108
	Parameters: 7
	Flags: None
	Line Number: 262
*/
function function_2b23adc9(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(!isdefined(self.var_5c4ad807))
	{
		self.var_5c4ad807 = [];
	}
	if(isdefined(self.var_5c4ad807[localClientNum]))
	{
		deletefx(localClientNum, self.var_5c4ad807[localClientNum]);
		self.var_5c4ad807[localClientNum] = undefined;
	}
	self.var_5c4ad807[localClientNum] = PlayFXOnTag(localClientNum, level._effect["teleport_player_flash"], self, "j_spinelower");
	SetFXIgnorePause(localClientNum, self.var_5c4ad807[localClientNum], 1);
}

/*
	Name: in_igc
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0xEB8
	Size: 0x360
	Parameters: 7
	Flags: None
	Line Number: 287
*/
function in_igc(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	player = GetLocalPlayer(localClientNum);
	n_entnum = player GetEntityNumber();
	b_igc_active = 0;
	if(newVal & 1 << n_entnum)
	{
		b_igc_active = 1;
	}
	players = GetDvarInt("com_maxclients");
	if(players < 5)
	{
		if(!GetDvarInt("aaeoption_blackbar"))
		{
			if(b_igc_active)
			{
				if(!isdefined(level.var_e0c6d9da))
				{
					level.var_e0c6d9da = GetDvarFloat("cg_fovscale");
					level thread function_b4231b1a(level.var_e0c6d9da, 1.25);
				}
				if(!isdefined(level.old_fov))
				{
					level.old_fov = GetDvarFloat("cg_fov_default");
					level thread function_e8a29ccc(level.old_fov, 113);
				}
			}
			else if(isdefined(level.var_e0c6d9da))
			{
				level thread function_b4231b1a(GetDvarFloat("cg_fovscale"), level.var_e0c6d9da);
			}
			level.var_e0c6d9da = undefined;
			if(isdefined(level.old_fov))
			{
				level thread function_e8a29ccc(GetDvarFloat("cg_fov_default"), level.old_fov);
			}
			level.old_fov = undefined;
			controllerModel = GetUIModelForController(localClientNum);
			var_98708c1d = GetUIModel(controllerModel, "hudItems.blackbar");
			SetUIModelValue(var_98708c1d, b_igc_active);
		}
		else if(b_igc_active)
		{
			if(!isdefined(level.old_fov))
			{
				level.old_fov = GetDvarFloat("cg_fov_default");
				level thread function_e8a29ccc(level.old_fov, 90);
			}
		}
		else if(isdefined(level.old_fov))
		{
			level thread function_e8a29ccc(GetDvarFloat("cg_fov_default"), level.old_fov);
		}
		level.old_fov = undefined;
		IGCactive(localClientNum, b_igc_active);
	}
}

/*
	Name: function_b4231b1a
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x1220
	Size: 0x120
	Parameters: 2
	Flags: None
	Line Number: 355
*/
function function_b4231b1a(current, target)
{
	level notify("hash_b4231b1a");
	level endon("hash_b4231b1a");
	var_78bc2c60 = GetRealTime();
	var_afc5c189 = var_78bc2c60 + 1200;
	start = var_78bc2c60;
	currentTime = var_78bc2c60;
	while(currentTime <= var_afc5c189)
	{
		currentTime = GetRealTime();
		var_a05b4028 = LerpFloat(current, target, currentTime - start / var_afc5c189 - start);
		if(isdefined(var_a05b4028))
		{
			SetDvar("cg_fovscale", var_a05b4028);
		}
		wait(0.001);
	}
}

/*
	Name: function_e8a29ccc
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x1348
	Size: 0x120
	Parameters: 2
	Flags: None
	Line Number: 385
*/
function function_e8a29ccc(current, target)
{
	level notify("hash_e8a29ccc");
	level endon("hash_e8a29ccc");
	var_78bc2c60 = GetRealTime();
	var_afc5c189 = var_78bc2c60 + 1200;
	start = var_78bc2c60;
	currentTime = var_78bc2c60;
	while(currentTime <= var_afc5c189)
	{
		currentTime = GetRealTime();
		var_a05b4028 = LerpFloat(current, target, currentTime - start / var_afc5c189 - start);
		if(isdefined(var_a05b4028))
		{
			SetDvar("cg_fov_default", var_a05b4028);
		}
		wait(0.001);
	}
}

/*
	Name: set_astro_name
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x1470
	Size: 0xF0
	Parameters: 7
	Flags: None
	Line Number: 415
*/
function set_astro_name(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(!isdefined(level.var_c6380bc8))
	{
		function_8d8284d3();
	}
	if(level.var_c6380bc8 == "false")
	{
		astro_name = tableLookup("gamedata/tables/zm/zm_astro_names.csv", 0, newVal - 1, 1);
		self SetDrawName(astro_name);
	}
	else
	{
		self SetDrawName(level.var_c6380bc8[newVal - 1]);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8d8284d3
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x1568
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 444
*/
function function_8d8284d3()
{
	dvar = GetDvarString("recentplayers");
	if(dvar == "false" || dvar == "")
	{
		level.var_c6380bc8 = "false";
		return;
	}
	level.var_6225e4bb = function_1556496c("gamedata/tables/zm/zm_astro_names.csv");
	level.var_c6380bc8 = [];
	var_9ecbbde9 = StrTok(dvar, "Â¨");
	z = 0;
	for(i = 0; i < level.var_6225e4bb; i++)
	{
		level.var_c6380bc8[i] = var_9ecbbde9[z];
		z++;
		if(z == var_9ecbbde9.size)
		{
			z = 0;
		}
	}
}

/*
	Name: get
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x1698
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 477
*/
function get(field_name)
{
	if(function_90b279c9(field_name))
	{
		if(self == level)
		{
			return CodeGetWorldClientField(field_name);
		}
		return CodeGetClientField(self, field_name);
	}
}

/*
	Name: get_to_player
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x1700
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 499
*/
function get_to_player(field_name)
{
	if(function_90b279c9(field_name))
	{
		return CodeGetPlayerStateClientField(self, field_name);
	}
}

/*
	Name: get_player_uimodel
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x1748
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 517
*/
function get_player_uimodel(field_name)
{
	if(function_90b279c9(field_name))
	{
		return CodeGetUIModelClientField(self, field_name);
	}
}

/*
	Name: function_90b279c9
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x1790
	Size: 0x474
	Parameters: 1
	Flags: None
	Line Number: 535
*/
function function_90b279c9(cf)
{
	if(GetDvarString("mapname") == "zm_castle" && (cf == "low_grav_powerup_triggered" || cf == "zombie_wall_dust"))
	{
		return 0;
	}
	if(cf == "force_stream")
	{
		return 0;
	}
	if(cf == "flashlight_fx_view" || cf == "flashlight_fx_world")
	{
		return 0;
	}
	if(cf == "clientfield_perk_intro_fx")
	{
		return 0;
	}
	if(cf == "sndZombieContext")
	{
		return 0;
	}
	if(cf == "zombie_keyline_render")
	{
		return 0;
	}
	if(cf == "mechz_claw_detached")
	{
		return 0;
	}
	if(cf == "hudItems.doublePointsActive")
	{
		return 0;
	}
	if(IsSubStr(cf, "Hitmarker"))
	{
		return 0;
	}
	if(IsSubStr(cf, "ShowReticle"))
	{
		return 0;
	}
	if(IsSubStr(cf, "mulekick"))
	{
		return 0;
	}
	if(IsSubStr(cf, "laststand_update"))
	{
		return 0;
	}
	if(IsSubStr(cf, "score_cf_"))
	{
		return 0;
	}
	if(IsSubStr(cf, "trialWidget") || IsSubStr(cf, "pillar") && GetDvarString("mapname") == "zm_island" && GetDvarInt("com_maxclients") >= 5)
	{
		return 0;
	}
	if(IsSubStr(cf, "trialWidget") || cf == "pr_b" || cf == "pr_c" || cf == "pr_l_c" || cf == "challenge_grave_fire" && GetDvarString("mapname") == "zm_stalingrad" && GetDvarInt("com_maxclients") >= 5)
	{
		return 0;
	}
	if(IsSubStr(cf, "trialWidget") || cf == "challenge1state" || cf == "challenge2state" || cf == "challenge3state" || cf == "challenge_board_eyes" || cf == "challenge_board_base" || cf == "challenge_board_reward" && GetDvarString("mapname") == "zm_genesis" && GetDvarInt("com_maxclients") >= 5)
	{
		return 0;
	}
	if(IsSubStr(cf, "mechz") && IsSubStr(cf, "detached") && (level.script == "zm_castle" || level.script == "zm_genesis" || level.script == "zm_tomb"))
	{
		return 0;
	}
	if(IsSubStr(cf, "raz") && IsSubStr(cf, "detach") && level.script == "zm_stalingrad")
	{
		return 0;
	}
	return 1;
}

