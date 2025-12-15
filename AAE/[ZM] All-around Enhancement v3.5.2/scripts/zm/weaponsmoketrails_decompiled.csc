#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\math_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_utility;
#include scripts\zm\aae_core;

#namespace namespace_57a45b87;

/*
	Name: init
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0xE08
	Size: 0x348
	Parameters: 0
	Flags: None
	Line Number: 19
*/
function init()
{
	level.var_32b27310 = [];
	level.var_32b27310[level.var_32b27310.size] = "revolver";
	level.var_32b27310[level.var_32b27310.size] = "shotgun";
	level.var_32b27310[level.var_32b27310.size] = "sniper";
	level.var_32b27310[level.var_32b27310.size] = "launcher";
	level.var_32b27310[level.var_32b27310.size] = "hero";
	level.var_32b27310[level.var_32b27310.size] = "lmg";
	level.var_32b27310[level.var_32b27310.size] = "minigun";
	level.var_32b27310[level.var_32b27310.size] = "death";
	level.var_32b27310[level.var_32b27310.size] = "mini_gun";
	level._effect["ray_muzzle_smoke_trail"] = "mikeray/ray_muzzle_smoke_trail";
	level._effect["3rd_crosshair"] = "custom/3rd_crosshair/3rd_crosshair";
	level.weaponNone = GetWeapon("none");
	callback::on_localplayer_spawned(&on_spawned);
	function_89eec951();
	thread function_5129fa64();
	thread function_2859bf6d();
	thread function_229776c3();
	SetDvar("ip_range", 50);
	SetDvar("ip_angles", 80);
	level.var_36d88358 = 0;
	level.var_d1e33c75 = [];
	level.var_c7d820c5 = [];
	level.var_4783eff6 = [];
	level.var_252eab66 = [];
	level.var_d48405c5 = 0;
	level.var_d1e33c75[0] = (0, 0, 0);
	level.var_c7d820c5[0] = (0, 0, 0);
	level.var_4783eff6[0] = (0, 0, 0);
	level thread function_70f77879(0);
	level thread function_8e185260(0);
	level thread function_1a08bc12(0);
	if(IsSplitscreen())
	{
		level.var_d1e33c75[1] = (0, 0, 0);
		level.var_c7d820c5[1] = (0, 0, 0);
		level.var_4783eff6[1] = (0, 0, 0);
		level thread function_70f77879(1);
		level thread function_8e185260(1);
	}
}

/*
	Name: function_229776c3
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x1158
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function function_229776c3()
{
	framecount = 0;
	startTime = GetRealTime() + 1000;
	new_time = GetRealTime();
	for(;;)
	{
		wait(0.0001);
		framecount++;
		new_time = GetRealTime();
		if(startTime <= new_time)
		{
			level.var_5c2bb1a = framecount;
			startTime = new_time + 1000;
			framecount = 0;
		}
	}
}

/*
	Name: function_2859bf6d
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x1218
	Size: 0x268
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function function_2859bf6d()
{
	wait(5);
	while(GetDvarString("mt") != "")
	{
		string = GetDvarString("mt");
		if(string == "t")
		{
			var_8316441 = GetLocalClientEyePos(0);
			function_39659176(0, 2000, "Top Right Set");
		}
		if(string == "b")
		{
			var_2adea339 = GetLocalClientEyePos(0);
			function_39659176(0, 2000, "Bottom Left Set");
		}
		if(isdefined(var_2adea339) && isdefined(var_8316441))
		{
			var_2adea339 = var_2adea339 + VectorScale((-1, 1, 0), 512);
			var_8316441 = var_8316441 + VectorScale((1, -1, 0), 512);
			SetUIModelValue(GetUIModel(GetUIModelForController(0), "hudItems.minimap_test"), "" + Int(var_8316441[0]) + "," + Int(var_8316441[1]) + "," + Int(var_2adea339[0]) + "," + Int(var_2adea339[1]));
			function_39659176(0, 2000, "Arrow Loaded");
		}
		SetDvar("mt", "");
		wait(0.01);
	}
}

/*
	Name: function_89eec951
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x1488
	Size: 0x6A8
	Parameters: 0
	Flags: None
	Line Number: 140
*/
function function_89eec951()
{
	util::REGISTER_SYSTEM("aae_soulcounter", &function_daff49dc);
	switch(GetDvarString("mapname"))
	{
		case "zm_zod":
		{
			break;
		}
		case "zm_castle":
		{
			function_a173a4be((1198.17, 2910.44, 526.082), "EM_T7_LOOT_DECAL_DRAGON", "dragon0");
			function_a173a4be((-855.154, 3953.53, 806.404), "EM_T7_LOOT_DECAL_DRAGON", "dragon1");
			function_a173a4be((-765.791, 2254.39, 291.578), "EM_T7_LOOT_DECAL_DRAGON", "dragon2");
			function_a173a4be((-1350.3, 2415.46, 185), "ZM_CASTLE_BOW_STORM", "lighting");
			function_a173a4be((-1350.1, 2097.07, 185), "ZM_CASTLE_BOW_WOLF", "wolf");
			function_a173a4be((-1033.09, 2096.55, 185), "ZM_CASTLE_BOW_DEMON", "void");
			function_a173a4be((-1033.3, 2411.98, 185), "ZM_CASTLE_BOW_RUNE", "fire");
			function_a173a4be((-1020.89, 2087.39, 630), "ZM_CASTLE_BOW_WOLF", "aq_wh_bones_courtyard");
			function_a173a4be((1161.33, 1242.02, 235), "ZM_CASTLE_BOW_WOLF", "aq_wh_bones_road");
			function_a173a4be((-89.2148, 2540.54, 210), "ZM_CASTLE_BOW_WOLF", "aq_wh_bones_undercroft");
			function_a173a4be((-1334.1, 2167.69, 698.538), "Keepers", "keepers1");
			function_a173a4be((1485.35, 1184.53, 261.947), "Keepers", "keepers2");
			function_a173a4be((-67.5807, 3811.74, 872.452), "Keepers", "keepers3");
			function_a173a4be((-827.532, 390.73, 457.003), "Keepers", "keepers4");
			break;
		}
		case "zm_genesis":
		{
			function_a173a4be((-3822, 612, -211), "ZOMBIE_WEAPON_OCTOBOMB", "octobomb");
			function_a173a4be((0, 0, 0), "AAEP_KEEPER", "ai_companion");
			break;
		}
		case "zm_moon":
		{
			function_a173a4be((186, 3798, -500), "^7", "tank1");
			function_a173a4be((-100, 4086, -500), "^7", "tank2");
			function_a173a4be((-99, 3795, -500), "^7", "tank3");
			function_a173a4be((190, 4082, -500), "^7", "tank4");
			break;
		}
		case "zm_tomb":
		{
			function_a173a4be((670.77, 635.616, 149.475), "^7", "pf2806_auto1");
			function_a173a4be((2751.6, -87.3991, 208.322), "^7", "pf2806_auto4");
			function_a173a4be((665.472, -1819.89, 290.844), "^7", "pf2806_auto6");
			function_a173a4be((-2142, -269.833, 232.565), "^7", "pf2806_auto8");
			function_a173a4be((914.837, -2639.38, 348.474), "^7", "church_tablet");
			function_a173a4be((-116.323, 4451.99, -324.251), "^7", "bunker_tablet");
			break;
		}
		case "zm_temple":
		{
			function_3c877eb0((73, -375, 6), "AAE_TIP_TEMPLE_KEY_COMBO_EE_TITLE", "AAE_TIP_TEMPLE_KEY_COMBO_EE_CONTENT");
			break;
		}
	}
	return;
	++;
}

/*
	Name: function_daff49dc
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x1B38
	Size: 0x348
	Parameters: 2
	Flags: None
	Line Number: 211
*/
function function_daff49dc(localClientNum, var_500ad457)
{
	if(self != GetLocalPlayer(localClientNum) && var_500ad457 == "")
	{
		return;
	}
	if(var_500ad457[0] == "&")
	{
		var_cc2ec028 = StrTok(var_500ad457, "&");
		if(var_cc2ec028.size == 1)
		{
			function_b7a12883(var_cc2ec028[0]);
		}
		else if(var_cc2ec028.size == 5)
		{
			function_3c877eb0((float(var_cc2ec028[2]), float(var_cc2ec028[3]), float(var_cc2ec028[4])), var_cc2ec028[0], var_cc2ec028[1]);
		}
		else if(var_cc2ec028.size == 3)
		{
			controllerModel = GetUIModelForController(localClientNum);
			var_aa9022e1 = GetUIModel(controllerModel, "hudItems.unitrigger_hint");
			SetUIModelValue(var_aa9022e1, var_500ad457);
			return;
		}
	}
	var_cc2ec028 = StrTok(var_500ad457, ",");
	if(var_cc2ec028.size == 3)
	{
		var_ab7c0e1a = var_cc2ec028[0];
		var_ab9d6cb6 = Int(var_cc2ec028[1]);
		var_42e5fdb3 = Int(var_cc2ec028[2]);
	}
	else
	{
		var_ab7c0e1a = var_cc2ec028[0];
		var_ab9d6cb6 = Int(var_cc2ec028[1]);
		var_42e5fdb3 = Int(var_cc2ec028[2]);
		var_3cbcbc81 = var_cc2ec028[3];
	}
	if(isdefined(level.var_d5e4387b[var_ab7c0e1a]))
	{
		level.var_d5e4387b[var_ab7c0e1a].current = var_ab9d6cb6;
		level.var_d5e4387b[var_ab7c0e1a].max = var_42e5fdb3;
	}
	if(isdefined(var_3cbcbc81) && var_3cbcbc81 != "")
	{
		level.var_d5e4387b[var_ab7c0e1a].name = function_3517347b(var_3cbcbc81);
	}
}

/*
	Name: function_3517347b
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x1E88
	Size: 0x150
	Parameters: 1
	Flags: None
	Line Number: 271
*/
function function_3517347b(name)
{
	switch(name)
	{
		case "keeper_demongate":
		{
			return MakeLocalizedString("AAEP_KEEPER") + " - " + MakeLocalizedString("AAE_VOID");
			break;
		}
		case "keeper_rune_prison":
		{
			return MakeLocalizedString("AAEP_KEEPER") + " - " + MakeLocalizedString("AAE_FIRE");
			break;
		}
		case "keeper_storm":
		{
			return MakeLocalizedString("AAEP_KEEPER") + " - " + MakeLocalizedString("AAE_LIGHTING");
			break;
		}
		case "keeper_wolf_howl":
		{
			return MakeLocalizedString("AAEP_KEEPER") + " - " + MakeLocalizedString("AAE_WOLF");
			break;
		}
		default
		{
			return name;
		}
	}
	return name;
}

/*
	Name: function_1f8c12ac
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x1FE0
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 313
*/
function function_1f8c12ac()
{
	for(;;)
	{
		wait(0.001);
		if(isdefined(level.var_b08abcf8) && IsArray(level.var_b08abcf8))
		{
			for(i = 0; i < 4; i++)
			{
				if(isdefined(level.var_b08abcf8[i]))
				{
					SetDvar("viewmodel_p0_move" + i + 3, "!" + level.var_b08abcf8[i] + ";0 0 -100000;0 0 0");
					continue;
				}
				SetDvar("viewmodel_p0_move" + i + 3, "");
			}
		}
		else
		{
			for(i = 3; i < 7; i++)
			{
				SetDvar("viewmodel_p0_move" + i, "");
			}
		}
	}
}

/*
	Name: function_415eb306
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x2128
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 350
*/
function function_415eb306()
{
	for(;;)
	{
		wait(0.001);
		if(isdefined(level.var_e643a13f) && IsArray(level.var_e643a13f))
		{
			for(i = 0; i < 4; i++)
			{
				if(isdefined(level.var_e643a13f[i]))
				{
					SetDvar("viewmodel_p1_move" + i + 3, "!" + level.var_e643a13f[i] + ";0 0 -100000;0 0 0");
					continue;
				}
				SetDvar("viewmodel_p1_move" + i + 3, "");
			}
		}
		else
		{
			for(i = 3; i < 7; i++)
			{
				SetDvar("viewmodel_p1_move" + i, "");
			}
		}
	}
}

/*
	Name: function_4d1c0b69
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x2270
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 387
*/
function function_4d1c0b69()
{
	if(isdefined(level.var_b08abcf8) && IsArray(level.var_b08abcf8))
	{
		for(i = 0; i < 4; i++)
		{
			if(isdefined(level.var_b08abcf8[i]))
			{
				SetDvar("viewmodel_p0_move" + i + 3, "!" + level.var_b08abcf8[i] + ";0 0 -100000;0 0 0");
				continue;
			}
			SetDvar("viewmodel_p0_move" + i + 3, "");
		}
	}
	else
	{
		for(i = 3; i < 7; i++)
		{
			SetDvar("viewmodel_p0_move" + i, "");
		}
	}
	if(isdefined(level.var_e643a13f) && IsArray(level.var_e643a13f))
	{
		for(i = 0; i < 4; i++)
		{
			if(isdefined(level.var_e643a13f[i]))
			{
				SetDvar("viewmodel_p1_move" + i + 3, "!" + level.var_e643a13f[i] + ";0 0 -100000;0 0 0");
				continue;
			}
			SetDvar("viewmodel_p1_move" + i + 3, "");
		}
	}
	else
	{
		for(i = 3; i < 7; i++)
		{
			SetDvar("viewmodel_p1_move" + i, "");
		}
	}
}

/*
	Name: function_c4a79bb7
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x24C8
	Size: 0x100
	Parameters: 2
	Flags: None
	Line Number: 439
*/
function function_c4a79bb7(tag, localClientNum)
{
	if(isdefined(localClientNum) && localClientNum != 0)
	{
		if(!isdefined(level.var_e643a13f))
		{
			level.var_e643a13f = [];
		}
		if(!IsInArray(level.var_e643a13f, tag))
		{
			level.var_e643a13f[level.var_e643a13f.size] = tag;
		}
		function_66b36f2c(localClientNum);
		return;
	}
	if(!isdefined(level.var_b08abcf8))
	{
		level.var_b08abcf8 = [];
	}
	if(!IsInArray(level.var_b08abcf8, tag))
	{
		level.var_b08abcf8[level.var_b08abcf8.size] = tag;
	}
	function_66b36f2c(localClientNum);
}

/*
	Name: function_882a0a3c
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x25D0
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 475
*/
function function_882a0a3c(tag, localClientNum)
{
	if(isdefined(localClientNum) && localClientNum != 0)
	{
		if(isdefined(level.var_e643a13f))
		{
			ArrayRemoveValue(level.var_e643a13f, tag);
		}
		function_66b36f2c(localClientNum);
		return;
	}
	if(isdefined(level.var_b08abcf8))
	{
		ArrayRemoveValue(level.var_b08abcf8, tag);
	}
	function_66b36f2c(localClientNum);
}

/*
	Name: function_66b36f2c
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x2690
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 503
*/
function function_66b36f2c(localClientNum)
{
	function_4d1c0b69();
	controllerModel = GetUIModelForController(localClientNum);
	var_131f8ad6 = GetUIModel(controllerModel, "hudItems.aaecmd");
	SetUIModelValue(var_131f8ad6, "force_refresh_viewmodel_cmd");
}

/*
	Name: function_5129fa64
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x2720
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 521
*/
function function_5129fa64()
{
	while(1)
	{
		if(GetDvarString("tmode_test") != "")
		{
			foreach(player in GetLocalPlayers())
			{
				player function_471a18c7(GetDvarInt("tmode_test"));
			}
			SetDvar("tmode_test", "");
		}
		wait(0.05);
	}
}

/*
	Name: on_spawned
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x2830
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 547
*/
function on_spawned(localClientNum)
{
	self notify("hash_1028bf94");
	self endon("hash_1028bf94");
	self endon("entityshutdown");
	self endon("disconnect");
	self thread function_ce095ad5(localClientNum);
	if(self != GetLocalPlayer(localClientNum))
	{
		return;
	}
	wait(0.01);
	self.var_fdd04d1a = 0;
	self.var_aad1f7d4 = 0;
	self thread function_98fdfca8(localClientNum);
	self thread function_dca397cc(localClientNum);
	self thread function_46acb78d(localClientNum);
	self thread function_d8dba7de(localClientNum);
	self thread function_e77d3fda(localClientNum);
	self thread function_3cce3ef6(localClientNum);
	self thread function_aa3d5f28(localClientNum);
	self thread function_cee9ae41(localClientNum);
	self thread function_4ac761c7(localClientNum);
	self thread function_d73c5a3d(localClientNum);
	if(!IsSplitscreen())
	{
		self thread function_9ff670f1(localClientNum);
	}
	self thread function_486d2601(localClientNum);
}

/*
	Name: function_ce095ad5
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x2A00
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 588
*/
function function_ce095ad5(localClientNum)
{
	self notify("hash_ce095ad5");
	self endon("hash_ce095ad5");
	self endon("entityshutdown");
	self endon("disconnect");
	while(self != GetLocalPlayer(localClientNum))
	{
		return;
		self waittill("hash_804238a6", objId);
		self thread function_68d44557(localClientNum, Int(objId));
	}
}

/*
	Name: function_84d3978b
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x2AB0
	Size: 0x1F8
	Parameters: 2
	Flags: None
	Line Number: 612
*/
function function_84d3978b(localClientNum, var_f329927f)
{
	if(!isdefined(localClientNum) || !isdefined(var_f329927f) || self IsPlayerFiring() || IsThrowingGrenade(localClientNum) || IsMeleeing(localClientNum) || IsOnTurret(localClientNum))
	{
		return 0;
	}
	var_f329927f = (Int(var_f329927f[0]), Int(var_f329927f[1]), Int(var_f329927f[2]));
	eye = GetLocalClientEyePos(localClientNum);
	result = util::within_fov(eye, GetLocalClientAngles(localClientNum), var_f329927f, cos(GetDvarInt("ip_angles")));
	range = GetDvarInt("ip_range");
	result = Distance(getlocalclientpos(localClientNum), var_f329927f) <= range || Distance(eye, var_f329927f) <= range && result;
	return result;
}

/*
	Name: function_3eeed15
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x2CB0
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 636
*/
function function_3eeed15(localClientNum)
{
	origin = getlocalclientpos(localClientNum);
	trace = beamtrace(origin + VectorScale((0, 0, 1), 20), origin - VectorScale((0, 0, 1), 5000), 1, self);
	return Distance(origin, trace["position"]) < 6;
}

/*
	Name: function_68d44557
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x2D58
	Size: 0x1B0
	Parameters: 2
	Flags: None
	Line Number: 653
*/
function function_68d44557(localClientNum, objId)
{
	self notify("watch_interactiveprompt_touching" + objId);
	self endon("watch_interactiveprompt_touching" + objId);
	self endon("entityshutdown");
	self endon("disconnect");
	controllerModel = GetUIModelForController(localClientNum);
	obj_model = GetUIModel(controllerModel, "objective" + objId);
	var_df365ba4 = GetUIModel(obj_model, "touching");
	objective = ServerObjective_GetObjectiveEntity(localClientNum, objId);
	if(isdefined(objective))
	{
		var_42fea2ec = 1;
	}
	else
	{
		objective = ServerObjective_GetObjectiveOrigin(localClientNum, objId);
	}
	for(;;)
	{
		wait(0.001);
		if(isdefined(var_42fea2ec))
		{
			SetUIModelValue(var_df365ba4, self function_84d3978b(localClientNum, objective.origin));
		}
		else
		{
			SetUIModelValue(var_df365ba4, self function_84d3978b(localClientNum, objective));
		}
	}
}

/*
	Name: function_486d2601
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x2F10
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 695
*/
function function_486d2601(localClientNum)
{
	self notify("hash_486d2601");
	self endon("hash_486d2601");
	self endon("entityshutdown");
	self endon("disconnect");
	controllerModel = GetUIModelForController(localClientNum);
	var_970eaf9e = GetUIModel(controllerModel, "hudItems.player_fps");
	for(;;)
	{
		SetUIModelValue(var_970eaf9e, level.var_5c2bb1a);
		WaitRealTime(2.2);
	}
}

/*
	Name: function_a173a4be
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x2FC8
	Size: 0xC0
	Parameters: 3
	Flags: None
	Line Number: 720
*/
function function_a173a4be(origin, name, var_dfa6b9a9)
{
	if(!isdefined(level.var_d5e4387b))
	{
		level.var_d5e4387b = [];
	}
	struct = spawnstruct();
	struct.origin = origin;
	struct.var_dfa6b9a9 = var_dfa6b9a9;
	struct.name = name;
	struct.current = 0;
	struct.max = 0;
	level.var_d5e4387b[var_dfa6b9a9] = struct;
}

/*
	Name: function_3c877eb0
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x3090
	Size: 0x100
	Parameters: 3
	Flags: None
	Line Number: 745
*/
function function_3c877eb0(origin, title, content)
{
	if(!isdefined(level.var_cced80bc))
	{
		level.var_cced80bc = [];
	}
	if(!isdefined(level.var_cced80bc[title]))
	{
		struct = spawnstruct();
		struct.origin = origin;
		if(IsSubStr(title, "aaewps"))
		{
			struct = function_b6a63543(struct, content);
		}
		else
		{
			struct.title = title;
			struct.content = content;
		}
		level.var_cced80bc[title] = struct;
	}
}

/*
	Name: function_b6a63543
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x3198
	Size: 0x810
	Parameters: 2
	Flags: None
	Line Number: 778
*/
function function_b6a63543(struct, content)
{
	weapon = GetWeapon(content);
	struct.title = MakeLocalizedString(weapon.displayName);
	weaponStats = "";
	if(weapon.fireType == "Melee")
	{
		weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_FIRETYPE") + ":   " + weapon.fireType + "\n";
		weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_MELEETIME") + ":   " + weapon.var_1c2be088 + "\n";
		weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_DAMAGE") + ":   " + weapon.meleeDamage + "\n";
		var_7f225853 = ceil(7000 / weapon.meleeDamage);
		weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_STK") + ":   " + var_7f225853;
	}
	else if(IsSubStr(content, "shotgun") && weapon.shotCount)
	{
		weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_SHOTCOUNT") + ":   " + weapon.shotCount + "\n";
	}
	weaponStats = weaponStats + MakeLocalizedString("MPUI_FIRE_RATE") + ":   " + Int(60 / weapon.fireTime) + " RPM\n";
	if(weapon.isBoltAction)
	{
		var_66bcc6cb = tableLookup("gamedata/tables/common/box_chance.csv", 0, content, 2);
		if(var_66bcc6cb != "")
		{
			weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_BOLTTIME") + ":   " + var_66bcc6cb + "s\n";
		}
	}
	weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_FIRETYPE") + ":   " + weapon.fireType + "\n";
	weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_RELOADTIME") + ":   " + weapon.reloadTime + "s\n";
	weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_MAGSIZE") + ":   " + weapon.clipSize + "\n";
	if(weapon.var_4e80eb9 > 10)
	{
		weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_STOCKAMMO") + ":   " + weapon.maxAmmo + "\n";
		damage = tableLookup("gamedata/tables/common/box_chance.csv", 0, content, 1);
		if(damage != "")
		{
			weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_STOCKAMMO") + ":   " + weapon.maxAmmo + "\n";
			weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_DAMAGE") + ":   " + damage + "\n";
			damage = Int(damage);
			if(IsSubStr(content, "shotgun") && weapon.shotCount > 1)
			{
				damage = damage * weapon.shotCount;
			}
			var_7f225853 = ceil(7000 / damage);
			weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_STK") + ":   " + var_7f225853;
		}
		else
		{
			weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_DAMAGE") + ":   " + weapon.var_4e80eb9 + "\n";
			var_7f225853 = ceil(7000 / weapon.var_4e80eb9);
			weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_STK") + ":   " + var_7f225853;
		}
	}
	else
	{
		damage = tableLookup("gamedata/tables/common/box_chance.csv", 0, content, 1);
		if(damage != "")
		{
			weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_STOCKAMMO") + ":   " + weapon.maxAmmo + "\n";
			weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_DAMAGE") + ":   " + damage + "\n";
			damage = Int(damage);
			if(IsSubStr(content, "shotgun") && weapon.shotCount > 1)
			{
				damage = damage * weapon.shotCount;
			}
			var_7f225853 = ceil(7000 / damage);
			weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_STK") + ":   " + var_7f225853;
		}
		else
		{
			weaponStats = weaponStats + MakeLocalizedString("AAE_TIP_STOCKAMMO") + ":   " + weapon.maxAmmo;
		}
	}
	struct.content = weaponStats;
	return struct;
}

/*
	Name: function_b7a12883
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x39B0
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 864
*/
function function_b7a12883(title)
{
	if(isdefined(level.var_cced80bc) && isdefined(level.var_cced80bc[title]))
	{
		level.var_cced80bc[title] delete();
		level.var_cced80bc[title] = undefined;
	}
}

/*
	Name: function_a79ccbc3
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x3A10
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 883
*/
function function_a79ccbc3(localClientNum)
{
	if(isdefined(level.var_cced80bc) && level.var_cced80bc.size)
	{
		var_81e03bee = GetCamPosByLocalClientNum(localClientNum);
		player_angles = GetCamAnglesByLocalClientNum(localClientNum);
		var_7186e3f7 = [];
		foreach(var_40bbb391 in level.var_cced80bc)
		{
			if(isdefined(var_40bbb391))
			{
				if(Distance(var_40bbb391.origin, var_81e03bee) <= 300)
				{
					var_29db2692 = util::within_fov(var_81e03bee, player_angles, var_40bbb391.origin, cos(50));
					if(var_29db2692)
					{
						trace = bullettrace(var_81e03bee, var_40bbb391.origin, 1, self, 1);
						if(Distance(trace["position"], var_40bbb391.origin) < 20)
						{
							var_7186e3f7[var_7186e3f7.size] = var_40bbb391;
						}
					}
				}
			}
		}
		return ArrayGetClosest(var_81e03bee, var_7186e3f7, 300);
		return;
	}
}

/*
	Name: function_7858c8a1
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x3C20
	Size: 0x278
	Parameters: 1
	Flags: None
	Line Number: 923
*/
function function_7858c8a1(localClientNum)
{
	if(isdefined(level.var_d5e4387b) && level.var_d5e4387b.size)
	{
		var_81e03bee = GetCamPosByLocalClientNum(localClientNum);
		player_angles = GetCamAnglesByLocalClientNum(localClientNum);
		var_7186e3f7 = [];
		foreach(var_40bbb391 in level.var_d5e4387b)
		{
			if(isdefined(var_40bbb391.var_dfa6b9a9) && var_40bbb391.var_dfa6b9a9 == "ai_companion" && isdefined(level.var_e7aa252c))
			{
				var_40bbb391.origin = level.var_e7aa252c.origin + VectorScale((0, 0, 1), 40);
			}
			if(var_40bbb391.max && Distance(var_40bbb391.origin, var_81e03bee) <= 1000)
			{
				var_29db2692 = util::within_fov(var_81e03bee, player_angles, var_40bbb391.origin, cos(50));
				if(var_29db2692)
				{
					trace = bullettrace(var_81e03bee, var_40bbb391.origin, 1, self, 1);
					if(Distance(trace["position"], var_40bbb391.origin) < 12)
					{
						var_7186e3f7[var_7186e3f7.size] = var_40bbb391;
					}
				}
			}
		}
		return ArrayGetClosest(var_81e03bee, var_7186e3f7, 1000);
		return;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_10b80a9a
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x3EA0
	Size: 0x218
	Parameters: 1
	Flags: None
	Line Number: 966
*/
function function_10b80a9a(localClientNum)
{
	self notify("hash_10b80a9a");
	self endon("hash_10b80a9a");
	self endon("entityshutdown");
	self endon("disconnect");
	controllerModel = GetUIModelForController(localClientNum);
	var_c1133222 = GetUIModel(controllerModel, "hudItems.tip_hints");
	SetUIModelValue(var_c1133222, "0");
	for(;;)
	{
		wait(0.001);
		if(self != GetLocalPlayer(localClientNum))
		{
			return;
		}
		if(GetDvarString("aaeoption_tiphint") == "1")
		{
			SetUIModelValue(var_c1133222, "0");
		}
		else
		{
			soulbox = function_a79ccbc3(localClientNum);
			if(isdefined(soulbox))
			{
				value = "" + soulbox.origin[0] + "," + soulbox.origin[1] + "," + soulbox.origin[2] + "," + soulbox.title + "," + soulbox.content;
				SetUIModelValue(var_c1133222, value);
			}
			else
			{
				SetUIModelValue(var_c1133222, "0");
			}
		}
	}
}

/*
	Name: function_dc460bc2
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x40C0
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 1012
*/
function function_dc460bc2(weapon)
{
	if(weapon.type == "bullet" || weapon.type == "projectile")
	{
		return 1;
	}
	if(weapon.type == "grenade" && (weapon.offhandslot == "Tactical grenade" || weapon.offhandslot == "Lethal grenade" || weapon.offhandslot == "Specific use" || weapon.offhandslot == "Equipment"))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_b1d1eee7
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x41A8
	Size: 0x70
	Parameters: 1
	Flags: Private
	Line Number: 1035
*/
function private function_b1d1eee7(weapon)
{
	if(weapon.isDualWield)
	{
		if(weapon.dualWieldWeapon.unlimitedammo)
		{
			return "â|";
		}
		return "" + weapon.dualWieldWeapon.clipSize + "|";
	}
	return "";
}

/*
	Name: function_aa379421
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x4220
	Size: 0x38
	Parameters: 1
	Flags: Private
	Line Number: 1058
*/
function private function_aa379421(weapon)
{
	if(weapon.unlimitedammo)
	{
		return "â";
	}
	return weapon.clipSize;
}

/*
	Name: function_54e4108f
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x4260
	Size: 0x50
	Parameters: 1
	Flags: Private
	Line Number: 1077
*/
function private function_54e4108f(weapon)
{
	if(weapon.unlimitedammo || weapon.isClipOnly)
	{
		return "";
	}
	return "/" + weapon.maxAmmo;
}

/*
	Name: function_35ce1c06
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x42B8
	Size: 0xE0
	Parameters: 1
	Flags: Private
	Line Number: 1096
*/
function private function_35ce1c06(weapon)
{
	if(weapon.isAltMode && weapon.altweapon.inventoryType == "item")
	{
		if(weapon.altweapon.unlimitedammo)
		{
			return "_â";
		}
		if(weapon.altweapon.isClipOnly)
		{
			return "_" + weapon.altweapon.clipSize;
		}
		else
		{
			return "_" + weapon.altweapon.maxAmmo + weapon.altweapon.clipSize;
		}
	}
	return "";
}

/*
	Name: function_cee9ae41
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x43A0
	Size: 0x630
	Parameters: 1
	Flags: None
	Line Number: 1126
*/
function function_cee9ae41(localClientNum)
{
	self notify("hash_cee9ae41");
	self endon("hash_cee9ae41");
	self endon("entityshutdown");
	self endon("disconnect");
	controllerModel = GetUIModelForController(localClientNum);
	var_abb54b62 = GetUIModel(controllerModel, "hudItems.wallbuy_hints");
	var_c1133222 = GetUIModel(controllerModel, "hudItems.soul_count");
	var_76a7d545 = GetUIModel(controllerModel, "hudItems.tip_hints");
	SetUIModelValue(var_c1133222, "0");
	SetUIModelValue(var_abb54b62, "0");
	SetUIModelValue(var_76a7d545, "0");
	while(self != GetLocalPlayer(localClientNum))
	{
		return;
		wait(0.001);
		if(!GetDvarInt("aaeoption_wallbuy"))
		{
			wallbuy = self function_1dadafc1();
			if(isdefined(wallbuy))
			{
				cost = "$0";
				if(isdefined(level.weapon_costs[wallbuy.weapon.name]))
				{
					cost = "$" + level.weapon_costs[wallbuy.weapon.name].cost;
				}
				weapon = wallbuy.weapon;
				if(function_dc460bc2(weapon))
				{
					cost = cost + " - " + function_b1d1eee7(wallbuy.weapon) + function_aa379421(wallbuy.weapon) + function_54e4108f(wallbuy.weapon) + function_35ce1c06(wallbuy.weapon);
				}
				SetUIModelValue(var_abb54b62, "" + wallbuy.origin[0] + "," + wallbuy.origin[1] + "," + wallbuy.origin[2] + "," + wallbuy.weapon.displayName + "," + cost);
			}
			else
			{
				SetUIModelValue(var_abb54b62, "0");
			}
		}
		else
		{
			SetUIModelValue(var_abb54b62, "0");
		}
		if(!GetDvarInt("aaeoption_tiphint"))
		{
			soulbox = function_7858c8a1(localClientNum);
			tip = function_a79ccbc3(localClientNum);
			if(isdefined(soulbox))
			{
				value = "" + soulbox.origin[0] + "," + soulbox.origin[1] + "," + soulbox.origin[2] + "," + soulbox.current + "/" + soulbox.max + "," + soulbox.name;
				SetUIModelValue(var_c1133222, value);
			}
			else
			{
				SetUIModelValue(var_c1133222, "0");
			}
			if(isdefined(tip))
			{
				value = "" + tip.origin[0] + "," + tip.origin[1] + "," + tip.origin[2] + "," + tip.title + "," + tip.content;
				SetUIModelValue(var_76a7d545, value);
			}
			else
			{
				SetUIModelValue(var_76a7d545, "0");
			}
		}
		else
		{
			SetUIModelValue(var_76a7d545, "0");
			SetUIModelValue(var_c1133222, "0");
		}
	}
}

/*
	Name: function_1dadafc1
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x49D8
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 1210
*/
function function_1dadafc1()
{
	if(isdefined(level._active_wallbuys))
	{
		var_81e03bee = self GetCamPos();
		player_angles = self GetCamAngles();
		var_99dbb79f = [];
		foreach(wallbuy in level._active_wallbuys)
		{
			if(Distance(wallbuy.origin, var_81e03bee) <= 500)
			{
				var_4bbf29d2 = util::within_fov(var_81e03bee, player_angles, wallbuy.origin, cos(30));
				if(var_4bbf29d2)
				{
					trace = bullettrace(var_81e03bee, wallbuy.origin, 1, self, 1);
					if(Distance(trace["position"], wallbuy.origin) < 4)
					{
						var_99dbb79f[var_99dbb79f.size] = wallbuy;
					}
				}
			}
		}
		return ArrayGetClosest(var_81e03bee, var_99dbb79f, 500);
		return;
	}
}

/*
	Name: function_aa3d5f28
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x4BC8
	Size: 0x3C0
	Parameters: 1
	Flags: None
	Line Number: 1247
*/
function function_aa3d5f28(localClientNum)
{
	self notify("hash_aa3d5f28");
	self endon("hash_aa3d5f28");
	self endon("entityshutdown");
	self endon("disconnect");
	self thread function_dc3d9f02(localClientNum);
	controllerModel = GetUIModelForController(localClientNum);
	var_3fbd9ad8 = GetUIModel(controllerModel, "hudItems.is_holo_attachment");
	var_d3522db9 = GetUIModel(controllerModel, "hudItems.weaponcliponly");
	var_131f8ad6 = GetUIModel(controllerModel, "hudItems.aaecmd");
	for(;;)
	{
		self waittill("weapon_change", weapon, w_old_weapon);
		SetUIModelValue(var_131f8ad6, "force_refresh_bulletdeplete");
		if(weapon.name == "zombie_bgb_grab")
		{
			SetDvar("aae_aargum", GetDvarInt("aae_aargum") + 1);
		}
		if(weapon.name == "falling")
		{
			self function_21fc862d();
		}
		if(w_old_weapon.name == "falling")
		{
			self function_fedaa2a6();
		}
		if(weapon != level.weaponNone)
		{
			if(isdefined(weapon.isClipOnly) && weapon.isClipOnly || (isdefined(weapon.reloadTime) && weapon.reloadTime == 0))
			{
				SetUIModelValue(var_d3522db9, 1);
			}
			else
			{
				SetUIModelValue(var_d3522db9, 0);
			}
		}
		if(IsSubStr(weapon.name, "+holo"))
		{
			SetUIModelValue(var_3fbd9ad8, "holo");
		}
		else if(IsSubStr(weapon.name, "+reflex"))
		{
			SetUIModelValue(var_3fbd9ad8, "reflex");
		}
		else
		{
			SetUIModelValue(var_3fbd9ad8, "0");
		}
		if(IsSubStr(weapon.name, "t9"))
		{
			SetDvar("viewmodel_p" + localClientNum + "_hide0", "!j_bullet;;01-20");
		}
		else
		{
			SetDvar("viewmodel_p" + localClientNum + "_hide0", "!j_bullet;;0-20");
		}
	}
}

/*
	Name: function_dc3d9f02
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x4F90
	Size: 0x2D8
	Parameters: 1
	Flags: None
	Line Number: 1318
*/
function function_dc3d9f02(localClientNum)
{
	self notify("hash_dc3d9f02");
	self endon("hash_dc3d9f02");
	self endon("entityshutdown");
	self endon("disconnect");
	controllerModel = GetUIModelForController(localClientNum);
	var_c38c4a15 = GetUIModel(controllerModel, "hudItems.is_reloading");
	for(;;)
	{
		result = self util::waittill_any_return("reload_start", "reload");
		if(result == "reload_start")
		{
			SetUIModelValue(var_c38c4a15, 1);
			self.var_c38c4a15 = 1;
			weapon = GetCurrentWeapon(localClientNum);
			weapon_name = weapon.rootweapon.name;
			if(IsSubStr(weapon.name, "lmg_heavy") && IsSubStr(weapon.name, "fastreload"))
			{
				weapon_name = "lmg_heavy_fastreload";
			}
			if(IsSubStr(weapon.name, "lmg_light") && IsSubStr(weapon.name, "fastreload"))
			{
				weapon_name = "lmg_light_fastreload";
			}
			var_26fa4f80 = tableLookup("gamedata/tables/common/box_chance.csv", 8, weapon_name, 9);
			if(isdefined(var_26fa4f80) && var_26fa4f80 != "")
			{
				self thread function_d3ee284a(localClientNum, float(var_26fa4f80));
			}
			else
			{
				self thread function_d3ee284a(localClientNum);
			}
		}
		else
		{
			self.var_c38c4a15 = 0;
			SetUIModelValue(var_c38c4a15, 0);
			SetDvar("bullet_depletion_disabled", 0);
		}
	}
}

/*
	Name: function_d3ee284a
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x5270
	Size: 0xF8
	Parameters: 2
	Flags: None
	Line Number: 1372
*/
function function_d3ee284a(localClientNum, reloadTime)
{
	if(!isdefined(reloadTime))
	{
		reloadTime = 4;
	}
	self notify("hash_d3ee284a");
	self endon("hash_d3ee284a");
	self endon("entityshutdown");
	self endon("disconnect");
	self endon("reload");
	if(self hasPerk(localClientNum, "specialty_fastreload"))
	{
		reloadTime = reloadTime / 2;
	}
	endTime = GetTime() + reloadTime * 1000;
	while(endTime >= GetTime())
	{
		wait(0.001);
	}
	SetDvar("bullet_depletion_disabled", 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3cce3ef6
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x5370
	Size: 0x248
	Parameters: 1
	Flags: None
	Line Number: 1407
*/
function function_3cce3ef6(localClientNum)
{
	self notify("hash_3cce3ef6");
	self endon("hash_3cce3ef6");
	self endon("entityshutdown");
	self endon("disconnect");
	controllerModel = GetUIModelForController(localClientNum);
	var_49cb990a = GetUIModel(controllerModel, "hudItems.grenadefuse");
	grenade = GetWeapon("frag_grenade");
	for(;;)
	{
		self waittill("Notetrack");
		if(IsThrowingGrenade(localClientNum) && (ViewmodelHasTag(localClientNum, "tag_pin_animate") || ViewmodelHasTag(localClientNum, "j_pin_ring") || ViewmodelHasTag(localClientNum, "j_pin")) && GetDvarString("aaeoption_grenade") != "1" && GetCurrentWeapon(localClientNum) == level.weaponNone && hasweapon(localClientNum, grenade))
		{
			SetDvar("cg_drawcrosshair", 0);
			SetUIModelValue(var_49cb990a, grenade.fusetime - 50);
			while(IsThrowingGrenade(localClientNum))
			{
				wait(0.0001);
			}
			SetUIModelValue(var_49cb990a, 0);
			SetDvar("cg_drawcrosshair", 1);
		}
	}
}

/*
	Name: function_70f77879
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x55C0
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 1443
*/
function function_70f77879(localClientNum)
{
	for(;;)
	{
		wait(0.001);
		if(GetDvarInt("aaeoption_hudmove") != 1)
		{
			controllerModel = GetUIModelForController(localClientNum);
			var_7d5f9c41 = GetUIModel(controllerModel, "hudItems.ui_move");
			level.var_c7d820c5[localClientNum] = function_4b3257c8(localClientNum);
			if(isdefined(level.var_4783eff6[localClientNum]))
			{
				if(!isdefined(level.var_252eab66[localClientNum]))
				{
					level.var_252eab66[localClientNum] = 1;
					level thread function_252eab66(level.var_4783eff6[localClientNum], var_7d5f9c41, 220, localClientNum);
				}
			}
		}
	}
}

/*
	Name: function_252eab66
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x56D8
	Size: 0x1B8
	Parameters: 4
	Flags: None
	Line Number: 1475
*/
function function_252eab66(old_angles, model, time, localClientNum)
{
	level notify("AAELerpToSmoothUIMoving" + localClientNum);
	level endon("AAELerpToSmoothUIMoving" + localClientNum);
	var_78bc2c60 = GetRealTime();
	var_afc5c189 = var_78bc2c60 + time;
	start = var_78bc2c60;
	currentTime = var_78bc2c60;
	while(currentTime < var_afc5c189)
	{
		currentTime = GetRealTime();
		var_4783eff6 = LerpVector(old_angles, level.var_c7d820c5[localClientNum], currentTime - start / var_afc5c189 - start);
		if(isdefined(var_4783eff6))
		{
			level.var_4783eff6[localClientNum] = var_4783eff6;
			SetUIModelValue(model, "" + level.var_4783eff6[localClientNum][0] + "," + level.var_4783eff6[localClientNum][1] + "," + level.var_4783eff6[localClientNum][2]);
			wait(0.001);
			level.var_252eab66[localClientNum] = undefined;
		}
		else
		{
			wait(0.001);
		}
	}
}

/*
	Name: function_4b3257c8
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x5898
	Size: 0x220
	Parameters: 1
	Flags: None
	Line Number: 1511
*/
function function_4b3257c8(localClientNum)
{
	if(IsThirdPerson(localClientNum))
	{
		return (0, 0, 0);
	}
	if(isdefined(level.var_d1e33c75[localClientNum]))
	{
		var_62620b2 = Project3Dto2D(localClientNum, level.var_d1e33c75[localClientNum]);
		var_ffc61123 = var_62620b2[0] - 640;
		var_d9c396ba = var_62620b2[1] - 360;
		if(var_ffc61123 < 0)
		{
			var_ffc61123 = Abs(var_ffc61123);
		}
		else
		{
			var_ffc61123 = var_ffc61123 * -1;
		}
		if(var_d9c396ba < 0)
		{
			var_d9c396ba = Abs(var_d9c396ba);
		}
		else
		{
			var_d9c396ba = var_d9c396ba * -1;
		}
		limit = 10;
		var_ffc61123 = math::clamp(var_ffc61123, limit * -1, limit);
		var_d9c396ba = math::clamp(var_d9c396ba, limit * -1, limit);
		camAngles = GetCamAnglesByLocalClientNum(localClientNum);
		var_338334f7 = math::clamp(camAngles[2], -1, 1);
		if(var_338334f7 > 0)
		{
			var_338334f7 = var_338334f7 * -1;
		}
		else
		{
			var_338334f7 = Abs(var_338334f7);
		}
		return (var_ffc61123, var_d9c396ba, var_338334f7);
	}
	return (0, 0, 0);
}

/*
	Name: function_8e185260
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x5AC0
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 1566
*/
function function_8e185260(localClientNum)
{
	for(;;)
	{
		view_angles = GetCamAnglesByLocalClientNum(localClientNum);
		view_pos = GetCamPosByLocalClientNum(localClientNum);
		wait(0.001);
		level.var_d1e33c75[localClientNum] = view_pos + AnglesToForward(view_angles) * 200;
	}
}

/*
	Name: function_98fdfca8
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x5B58
	Size: 0x298
	Parameters: 1
	Flags: None
	Line Number: 1587
*/
function function_98fdfca8(localClientNum)
{
	self notify("hash_98fdfca8");
	self endon("hash_98fdfca8");
	self endon("entityshutdown");
	self endon("disconnect");
	while(self != GetLocalPlayer(localClientNum))
	{
		return;
		self waittill("weapon_fired");
		if(GetDvarString("m_mouseSensitivity2") == "")
		{
			SetDvar("m_mouseSensitivity2", GetDvarFloat("m_mouseSensitivity"));
		}
		SetDvar("m_mouseSensitivity", GetDvarFloat("m_mouseSensitivity2"));
		weapon = GetCurrentWeapon(localClientNum);
		if(GetDvarString("aaeoption_kick") != "1")
		{
			self thread function_9566fb7c(localClientNum, weapon);
			self thread function_b1018208();
		}
		if(isdefined(self.var_765f4936) && !self.var_aad1f7d4)
		{
			deletefx(localClientNum, self.var_765f4936);
			self.var_765f4936 = undefined;
		}
		if(GetDvarString("aaeoption_smoke") == "1")
		{
			wait(0.001);
		}
		else if(!ViewmodelHasTag(localClientNum, "tag_flash"))
		{
			wait(0.001);
		}
		else if(!IsWeapon(weapon))
		{
			wait(0.001);
		}
		else if(weapon.type != "bullet")
		{
			wait(0.001);
		}
		else if(self.var_aad1f7d4)
		{
			wait(0.001);
		}
		else
		{
			self thread function_9f97ddfc(localClientNum);
		}
	}
}

/*
	Name: function_9566fb7c
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x5DF8
	Size: 0x1E0
	Parameters: 2
	Flags: None
	Line Number: 1650
*/
function function_9566fb7c(localClientNum, weapon)
{
	if(weapon.isDualWield)
	{
		return;
	}
	if(!IsSplitscreen() && GetDvarInt("cg_gun_y") == 0 && GetDvarInt("cg_gun_z") == 0)
	{
		if(IsSubStr(weapon.name, "shotgun_precision"))
		{
			self thread function_5753c5da(localClientNum, 70, 70, 4, -4, 0, 0, 0, 0, 0, 1);
		}
		else if(IsSubStr(weapon.name, "shotgun_pump"))
		{
			self thread function_5753c5da(localClientNum, 30, 30, 3, -3, 0, 0, 0, 0, 1, 1);
		}
		else if(weapon.unlimitedammo || weapon.isGasWeapon || weapon.clipSize > 400)
		{
			self thread function_5753c5da(localClientNum);
		}
		else
		{
			self thread function_5753c5da(localClientNum, 5, 30, 1.4, -4, 1, 1, 1, 0, 0, 1);
		}
	}
}

/*
	Name: function_5753c5da
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x5FE0
	Size: 0x4C8
	Parameters: 11
	Flags: None
	Line Number: 1687
*/
function function_5753c5da(localClientNum, intro_time, var_c518752, var_fb0b00ff, var_9a27377d, var_79b7e30c, var_c7a14c38, var_b37dedff, var_ed856279, var_6b7cd982, var_c6c25201)
{
	if(!isdefined(intro_time))
	{
		intro_time = 40;
	}
	if(!isdefined(var_c518752))
	{
		var_c518752 = 100;
	}
	if(!isdefined(var_fb0b00ff))
	{
		var_fb0b00ff = 0.15;
	}
	if(!isdefined(var_9a27377d))
	{
		var_9a27377d = -2;
	}
	if(!isdefined(var_79b7e30c))
	{
		var_79b7e30c = 0;
	}
	if(!isdefined(var_c7a14c38))
	{
		var_c7a14c38 = 0;
	}
	if(!isdefined(var_b37dedff))
	{
		var_b37dedff = 0;
	}
	if(!isdefined(var_ed856279))
	{
		var_ed856279 = 0;
	}
	if(!isdefined(var_6b7cd982))
	{
		var_6b7cd982 = 1;
	}
	if(!isdefined(var_c6c25201))
	{
		var_c6c25201 = 1;
	}
	if(IsADS(localClientNum) && var_6b7cd982)
	{
		return;
	}
	self notify("hash_5753c5da");
	self endon("hash_5753c5da");
	startTime = GetTime();
	timeSinceLastUpdate = 0;
	if(var_79b7e30c)
	{
		var_27a55984 = 0;
	}
	else
	{
		var_27a55984 = GetDvarFloat("cg_gun_x");
	}
	if(var_c7a14c38 && !IsADS(localClientNum) || (var_b37dedff && IsADS(localClientNum)))
	{
		var_fb0b00ff = var_fb0b00ff / 1.4;
	}
	newValue = var_27a55984 - var_fb0b00ff;
	oldValue = var_27a55984;
	if(var_ed856279)
	{
		if(math::cointoss())
		{
			while(timeSinceLastUpdate <= intro_time && GetDvarInt("cg_gun_x") <= 0)
			{
				timeSinceLastUpdate = GetTime() - startTime;
				lerpValue = LerpFloat(oldValue, newValue, timeSinceLastUpdate / intro_time);
				if(isdefined(lerpValue) && GetDvarFloat("cg_gun_x") > var_9a27377d)
				{
					SetDvar("cg_gun_x", lerpValue);
				}
				if(var_c6c25201)
				{
					wait(0.001);
				}
				else
				{
					WaitRealTime(0.015);
				}
			}
		}
		else
		{
			WaitRealTime(intro_time / 1000);
		}
	}
	else
	{
		timeSinceLastUpdate = GetTime() - startTime;
		lerpValue = LerpFloat(oldValue, newValue, timeSinceLastUpdate / intro_time);
		if(isdefined(lerpValue) && GetDvarFloat("cg_gun_x") > var_9a27377d)
		{
			SetDvar("cg_gun_x", lerpValue);
		}
		if(var_c6c25201)
		{
			wait(0.001);
		}
		else
		{
			WaitRealTime(0.015);
		}
	}
	while(timeSinceLastUpdate <= intro_time && GetDvarInt("cg_gun_x") <= 0)
	{
	}
	startTime = GetTime();
	timeSinceLastUpdate = 0;
	while(timeSinceLastUpdate <= var_c518752 && GetDvarInt("cg_gun_x") <= 0)
	{
		timeSinceLastUpdate = GetTime() - startTime;
		lerpValue = LerpFloat(GetDvarFloat("cg_gun_x"), 0, timeSinceLastUpdate / var_c518752);
		if(isdefined(lerpValue))
		{
			SetDvar("cg_gun_x", lerpValue);
		}
		if(var_c6c25201)
		{
			wait(0.001);
		}
		else
		{
			WaitRealTime(0.015);
		}
	}
}

/*
	Name: function_dca397cc
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x64B0
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 1829
*/
function function_dca397cc(localClientNum)
{
	self notify("hash_dca397cc");
	self endon("hash_dca397cc");
	self endon("entityshutdown");
	self endon("disconnect");
	while(self != GetLocalPlayer(localClientNum))
	{
		return;
		self waittill("weapon_change");
		self.var_fdd04d1a = 0;
		if(isdefined(self.var_765f4936))
		{
			deletefx(localClientNum, self.var_765f4936);
			self.var_765f4936 = undefined;
		}
	}
}

/*
	Name: function_9f97ddfc
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x6568
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 1858
*/
function function_9f97ddfc(localClientNum)
{
	self.var_fdd04d1a++;
	self notify("hash_9f97ddfc");
	self endon("hash_9f97ddfc");
	self endon("weapon_change");
	self endon("entityshutdown");
	self endon("disconnect");
	if(self.var_fdd04d1a < 16)
	{
		return;
	}
	WaitRealTime(0.5);
	self thread function_b9501df7(localClientNum, level._effect["ray_muzzle_smoke_trail"]);
}

/*
	Name: function_46acb78d
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x6610
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 1884
*/
function function_46acb78d(localClientNum)
{
	self notify("hash_46acb78d");
	self endon("hash_46acb78d");
	self endon("entityshutdown");
	self endon("disconnect");
	while(self != GetLocalPlayer(localClientNum))
	{
		return;
		while(self IsPlayerFiring())
		{
			wait(0.0023);
		}
		if(self.var_fdd04d1a != 0)
		{
			self.var_fdd04d1a--;
		}
		wait(1);
	}
}

/*
	Name: function_b9501df7
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x66B8
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 1915
*/
function function_b9501df7(localClientNum, FX)
{
	self endon("entityshutdown");
	self endon("disconnect");
	self.var_fdd04d1a = 0;
	self.var_765f4936 = PlayViewmodelFX(localClientNum, FX, "tag_flash");
	self.var_aad1f7d4 = 1;
	util::server_wait(localClientNum, 4.5, 0.001);
	self.var_aad1f7d4 = 0;
}

/*
	Name: function_8355789
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x6758
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 1936
*/
function function_8355789(localClientNum)
{
	return GetLocalClientEyePos(localClientNum);
}

/*
	Name: function_d8dba7de
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x6788
	Size: 0x4A8
	Parameters: 1
	Flags: None
	Line Number: 1951
*/
function function_d8dba7de(localClientNum)
{
	self notify("hash_d8dba7de");
	self endon("hash_d8dba7de");
	self endon("entityshutdown");
	self endon("disconnect");
	controllerModel = GetUIModelForController(localClientNum);
	crosshair = GetUIModel(controllerModel, "hudItems.3rdCrosshair");
	SetUIModelValue(crosshair, "0");
	while(isdefined(self))
	{
		wait(0.0001);
		if(self != GetLocalPlayer(localClientNum))
		{
			return;
		}
		if(IsThirdPerson(localClientNum) && GetLocalPlayer(localClientNum).name == self.name)
		{
			if(GetDvarString("cg_thirdpersonmode") == "Fixed")
			{
				SetDvar("cg_thirdpersonrange", 60);
				SetDvar("cg_thirdpersonangle", -0.5);
				SetDvar("cg_thirdpersonsideoffset", 30);
				SetDvar("cg_thirdpersoncamoffsetup", -10);
				SetDvar("cg_thirdpersonupoffset", 0);
				while(isdefined(self) && IsThirdPerson(localClientNum))
				{
					cam_pos = self function_8355789(localClientNum);
					trace = bullettrace(cam_pos, cam_pos + AnglesToForward(GetCamAnglesByLocalClientNum(localClientNum)) * 100000, 1, self, 1);
					var_c3e731d4 = trace["position"];
					if(isdefined(trace["entity"]) && (isdefined(trace["entity"].archetype) || isdefined(trace["entity"].vehicleType)) && isalive(trace["entity"]))
					{
						SetUIModelValue(crosshair, "" + var_c3e731d4[0] + "," + var_c3e731d4[1] + "," + var_c3e731d4[2] + ",1");
					}
					else
					{
						SetUIModelValue(crosshair, "" + var_c3e731d4[0] + "," + var_c3e731d4[1] + "," + var_c3e731d4[2] + ",0");
					}
					wait(1E-05);
				}
				SetUIModelValue(crosshair, "0");
				if(!isdefined(self))
				{
					return;
				}
			}
			else
			{
				SetUIModelValue(crosshair, "0");
				SetDvar("cg_thirdpersonrange", 90);
				SetDvar("cg_thirdpersonangle", 90);
				SetDvar("cg_thirdpersonsideoffset", 0);
				SetDvar("cg_thirdpersoncamoffsetup", 0);
				SetDvar("cg_thirdpersonupoffset", -30);
			}
		}
	}
}

/*
	Name: function_fb8d005d
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x6C38
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 2020
*/
function function_fb8d005d(localClientNum)
{
	origin = self GetCamAngles();
	if(isdefined(origin))
	{
		return origin;
	}
	origin = GetLocalClientAngles(localClientNum);
	if(isdefined(origin))
	{
		return origin;
	}
	return self.angles;
}

/*
	Name: function_cd5f1f16
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x6CB0
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 2045
*/
function function_cd5f1f16(localClientNum)
{
	origin = self GetCamPos();
	if(isdefined(origin) && origin != self.origin && origin != (0, 0, 0))
	{
		return origin;
	}
	origin = GetLocalClientEyePos(localClientNum);
	if(isdefined(origin) && origin != self.origin && origin != (0, 0, 0))
	{
		return origin;
	}
	origin = self GetTagOrigin("tag_eye");
	if(isdefined(origin) && origin != self.origin && origin != (0, 0, 0))
	{
		return origin;
	}
	return self.origin + VectorScale((0, 0, 1), 75);
}

/*
	Name: function_e77d3fda
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x6DC8
	Size: 0x5F8
	Parameters: 1
	Flags: None
	Line Number: 2075
*/
function function_e77d3fda(localClientNum)
{
	self notify("hash_e77d3fda");
	self endon("hash_e77d3fda");
	self endon("disconnect");
	self endon("entityshutdown");
	self endon("death");
	level endon("zesn");
	self.var_f2fedd0c = 0;
	self.var_98223dda = 0;
	while(self != GetLocalPlayer(localClientNum))
	{
		return;
		self waittill("weapon_fired");
		weapon = GetCurrentWeapon(localClientNum);
		if(!isdefined(weapon) || !isdefined(weapon.weapClass) || !isdefined(weapon.type))
		{
			wait(0.016);
		}
		else
		{
			self.fireTime = weapon.fireTime / 2;
			if(GetDvarInt("aaeoption_lowammo"))
			{
			}
			else if(weapon.type == "melee" || weapon.weapClass == "melee" || weapon.isDualWield || weapon.unlimitedammo)
			{
				wait(0.016);
			}
			else if(weapon.type != "bullet")
			{
				wait(0.016);
			}
			else if(weapon.clipSize < 8)
			{
				wait(0.016);
			}
			else if(function_821703e0(weapon))
			{
				wait(0.016);
			}
			else
			{
				ammo = GetWeaponAmmoClip(localClientNum, weapon);
				if(ammo < 0)
				{
					wait(0.016);
				}
				else
				{
					percentage = ammo / weapon.clipSize;
					var_b8ec7bf9 = undefined;
					if(weapon.clipSize <= 5)
					{
						if(percentage <= 1 && percentage >= 0.8)
						{
							var_b8ec7bf9 = "quiet_1";
						}
						else if(percentage <= 0.8 && percentage >= 0.6)
						{
							var_b8ec7bf9 = "med_0";
						}
						else if(percentage <= 0.6 && percentage >= 0.4)
						{
							var_b8ec7bf9 = "med_1";
						}
						else if(percentage <= 0.4 && percentage >= 0.2)
						{
							var_b8ec7bf9 = "loud_0";
						}
						else if(percentage <= 0.2)
						{
							var_b8ec7bf9 = "loud_1";
						}
					}
					else if(weapon.clipSize <= 20)
					{
						if(percentage <= 0.6 && percentage >= 0.5)
						{
							var_b8ec7bf9 = "quiet_0";
						}
						else if(percentage <= 0.5 && percentage >= 0.4)
						{
							var_b8ec7bf9 = "quiet_1";
						}
						else if(percentage <= 0.4 && percentage >= 0.3)
						{
							var_b8ec7bf9 = "med_0";
						}
						else if(percentage <= 0.3 && percentage >= 0.2)
						{
							var_b8ec7bf9 = "med_1";
						}
						else if(percentage <= 0.2 && percentage >= 0.1)
						{
							var_b8ec7bf9 = "loud_0";
						}
						else if(percentage <= 0.1)
						{
							var_b8ec7bf9 = "loud_1";
						}
					}
					else if(percentage <= 0.35 && percentage >= 0.3)
					{
						var_b8ec7bf9 = "quiet_0";
					}
					else if(percentage <= 0.3 && percentage >= 0.25)
					{
						var_b8ec7bf9 = "quiet_1";
					}
					else if(percentage <= 0.25 && percentage >= 0.2)
					{
						var_b8ec7bf9 = "med_0";
					}
					else if(percentage <= 0.2 && percentage >= 0.15)
					{
						var_b8ec7bf9 = "med_1";
					}
					else if(percentage <= 0.15 && percentage >= 0.1)
					{
						var_b8ec7bf9 = "loud_0";
					}
					else if(percentage <= 0.1)
					{
						var_b8ec7bf9 = "loud_1";
					}
					type = "metal_";
					if(isdefined(var_b8ec7bf9))
					{
						playsound(localClientNum, "wpn_mag_low_" + type + var_b8ec7bf9);
					}
				}
			}
		}
	}
}

/*
	Name: function_821703e0
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x73C8
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 2222
*/
function function_821703e0(weapon)
{
	for(i = 0; i < level.var_32b27310.size; i++)
	{
		if(IsSubStr(weapon.name, level.var_32b27310[i]))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_1a08bc12
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x7440
	Size: 0x918
	Parameters: 1
	Flags: None
	Line Number: 2244
*/
function function_1a08bc12(localClientNum)
{
	if(IsSplitscreen())
	{
		return;
	}
	controllerModel = GetUIModelForController(localClientNum);
	var_7c900785 = CreateUIModel(controllerModel, "hudItems.extracamhint");
	SetUIModelValue(var_7c900785, "");
	for(;;)
	{
		wait(0.001);
		var_9366b869 = GetDvarInt("aaeoption_extracam");
		if(var_9366b869)
		{
			if(!isdefined(level.activePlayers[var_9366b869 - 1]) && var_9366b869 != 11)
			{
			}
			else if(isdefined(level.cam))
			{
				level.cam delete();
			}
			level.cam = spawn(localClientNum, (0, 0, 0), "script_origin");
			level.cam SetExtraCam(3, 538, 303);
			level.cam function_a41474b(3, 12);
			if(var_9366b869 == 11)
			{
				controllerModel = GetUIModelForController(localClientNum);
				var_7c900785 = GetUIModel(controllerModel, "hudItems.extracamhint");
				SetUIModelValue(var_7c900785, "AAEOPTIONS_BACKHEAD");
				while(GetDvarInt("aaeoption_extracam") == var_9366b869)
				{
					player = GetLocalPlayer(localClientNum);
					neck = player GetTagOrigin("j_neck");
					trace = beamtrace(neck, neck - AnglesToForward(player.angles) * 30, 1, player);
					level.cam.origin = trace["position"];
					level.cam.angles = player.angles + VectorScale((0, 1, 0), 180);
					level.cam function_a41474b(3, 20);
					wait(0.001);
				}
			}
			else if(GetDvarInt("aaeoption_extracam_doa"))
			{
				otherPlayer = level.activePlayers[var_9366b869 - 1];
				controllerModel = GetUIModelForController(localClientNum);
				var_7c900785 = GetUIModel(controllerModel, "hudItems.extracamhint");
				SetUIModelValue(var_7c900785, otherPlayer.name);
				while(isdefined(otherPlayer) && GetDvarInt("aaeoption_extracam") == var_9366b869 && GetDvarInt("aaeoption_extracam_doa"))
				{
					level.cam function_a41474b(3, 10);
					player_origin = otherPlayer GetTagOrigin("j_neck");
					trace = beamtrace(player_origin, player_origin + VectorScale((0, 0, 1), 200), 1, otherPlayer);
					level.cam.origin = trace["position"];
					level.cam.angles = (90, otherPlayer.angles[1], 0);
					wait(0.001);
				}
			}
			else
			{
				otherPlayer = level.activePlayers[var_9366b869 - 1];
				controllerModel = GetUIModelForController(localClientNum);
				var_7c900785 = GetUIModel(controllerModel, "hudItems.extracamhint");
				SetUIModelValue(var_7c900785, otherPlayer.name);
				while(isdefined(otherPlayer) && GetDvarInt("aaeoption_extracam") == var_9366b869 && !GetDvarInt("aaeoption_extracam_doa"))
				{
					var_4d974839 = otherPlayer GetTagOrigin("tag_eye");
					if(!isdefined(var_4d974839) || var_4d974839 == otherPlayer.origin)
					{
						var_6bc32539 = otherPlayer GetTagOrigin("j_head3");
						if(!isdefined(var_6bc32539))
						{
							var_6bc32539 = otherPlayer GetTagOrigin("j_head");
							level.cam function_a41474b(3, 12);
							level.cam.angles = otherPlayer.angles;
							level.cam.origin = var_6bc32539 + AnglesToForward(level.cam.angles) * 15;
						}
						else
						{
							level.cam function_a41474b(3, 20);
							var_6826daf5 = otherPlayer GetTagAngles("j_head3");
							level.cam.angles = (var_6826daf5[0], var_6826daf5[1], 0);
							level.cam.origin = var_6bc32539 + anglesToUp(var_6826daf5) * 10 + AnglesToForward(var_6826daf5) * 20;
						}
					}
					else
					{
						level.cam function_a41474b(3, 12);
						var_d4d0609b = otherPlayer GetTagAngles("tag_eye");
						level.cam.angles = (var_d4d0609b[0], var_d4d0609b[1] + 20, 0);
						level.cam.origin = var_4d974839 + AnglesToRight(var_d4d0609b) * -2 + anglesToUp(var_d4d0609b) * -5 + AnglesToForward(var_d4d0609b) * 1;
					}
					wait(0.001);
				}
			}
		}
		else if(isdefined(level.cam))
		{
			controllerModel = GetUIModelForController(localClientNum);
			var_7c900785 = GetUIModel(controllerModel, "hudItems.extracamhint");
			SetUIModelValue(var_7c900785, "");
			level.cam ClearExtraCam();
			level.cam delete();
		}
	}
}

/*
	Name: function_9ff670f1
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x7D60
	Size: 0x338
	Parameters: 1
	Flags: None
	Line Number: 2360
*/
function function_9ff670f1(localClientNum)
{
	self notify("hash_9ff670f1");
	self endon("hash_9ff670f1");
	self endon("entityshutdown");
	self endon("disconnect");
	var_e3b262f9 = VectorScale((0, 0, 1), 0);
	offset = 15;
	var_9aa51500 = 15;
	var_385a3ec4 = 90;
	var_71b33d5e = 1;
	min_speed = 140;
	controllerModel = GetUIModelForController(localClientNum);
	var_131f8ad6 = GetUIModel(controllerModel, "hudItems.aaecmd");
	self notify("hash_d01d4de5");
	self notify("hash_b275b2c5");
	self notify("hash_58140e65");
	self.var_c519aca3 = 0;
	self.var_b7cb6da3 = 0;
	self.var_e0833c8b = 0;
	level.var_b275b2c5 = undefined;
	level.var_58140e65 = undefined;
	function_7e66b783(0.001);
	SetDvar("viewmodel_p0_move0", "!tag_fill_light;0 0 0;0 0 0");
	SetUIModelValue(var_131f8ad6, "force_refresh_viewmodel_cmd");
	while(self != GetLocalPlayer(localClientNum))
	{
		return;
		self waittill("weapon_change", weapon);
		if(function_546e62b1(weapon) && !GetDvarInt("aaeoption_autolean"))
		{
			self thread function_d01d4de5(var_131f8ad6, localClientNum, var_e3b262f9, offset, var_9aa51500, var_385a3ec4, var_71b33d5e, min_speed, weapon);
		}
		else
		{
			self notify("hash_d01d4de5");
			self notify("hash_b275b2c5");
			self notify("hash_58140e65");
			self.var_c519aca3 = 0;
			self.var_b7cb6da3 = 0;
			self.var_e0833c8b = 0;
			level.var_b275b2c5 = undefined;
			level.var_58140e65 = undefined;
			function_7e66b783(0.001);
			if(GetDvarString("gunpos") != "1")
			{
				SetDvar("viewmodel_p0_move0", "!tag_fill_light;0 0 0;0 0 0");
				SetUIModelValue(var_131f8ad6, "force_refresh_viewmodel_cmd");
			}
		}
	}
}

/*
	Name: function_546e62b1
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x80A0
	Size: 0x378
	Parameters: 1
	Flags: Private
	Line Number: 2423
*/
function private function_546e62b1(weapon)
{
	if(isdefined(weapon))
	{
		if(weapon.inventoryType === "primary" && !weapon.isDualWield)
		{
			if(IsSubStr(weapon.viewmodels, "t7") || IsSubStr(weapon.viewmodels, "t8") || IsSubStr(weapon.viewmodels, "t9") || IsSubStr(weapon.viewmodels, "iw8") || IsSubStr(weapon.viewmodels, "t4") || IsSubStr(weapon.viewmodels, "s1") || IsSubStr(weapon.viewmodels, "s2") || IsSubStr(weapon.viewmodels, "s4") || IsSubStr(weapon.viewmodels, "t5") || IsSubStr(weapon.viewmodels, "t6"))
			{
				return 1;
			}
			if(IsSubStr(weapon.name, "t7") || IsSubStr(weapon.name, "t8") || IsSubStr(weapon.name, "t9") || IsSubStr(weapon.name, "iw8") || IsSubStr(weapon.name, "t4") || IsSubStr(weapon.name, "s1") || IsSubStr(weapon.name, "s2") || IsSubStr(weapon.name, "s4") || IsSubStr(weapon.name, "t5") || IsSubStr(weapon.name, "t6"))
			{
				return 1;
			}
		}
	}
	return 0;
}

/*
	Name: function_d01d4de5
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x8420
	Size: 0x3E8
	Parameters: 9
	Flags: None
	Line Number: 2452
*/
function function_d01d4de5(var_131f8ad6, localClientNum, var_e3b262f9, offset, var_9aa51500, var_385a3ec4, var_71b33d5e, min_speed, weapon)
{
	self notify("hash_d01d4de5");
	self endon("hash_d01d4de5");
	self endon("entityshutdown");
	self endon("disconnect");
	for(;;)
	{
		wait(0.001);
		if(self != GetLocalPlayer(localClientNum))
		{
			return;
		}
		var_4eac142f = self function_4eac142f(localClientNum, var_e3b262f9, offset, var_9aa51500, var_385a3ec4, var_71b33d5e);
		var_6567041d = self function_54122d77(min_speed, var_4eac142f[1]);
		var_a4b940fd = var_6567041d / 0.3;
		if(isdefined(level.var_ea266897))
		{
			self.var_e0833c8b = 0;
		}
		else
		{
			self.var_e0833c8b = var_4eac142f[0] / 0.8;
		}
		if(weapon.unlimitedammo || weapon.isGasWeapon || weapon.clipSize > 400)
		{
			self.var_b7cb6da3 = 0;
		}
		else
		{
			self.var_b7cb6da3 = var_4eac142f[0];
		}
		if(self.var_b7cb6da3 != self.var_c519aca3)
		{
			if(Abs(self.var_b7cb6da3 - self.var_c519aca3) > 0.1)
			{
				if(!isdefined(level.var_b275b2c5))
				{
					level.var_b275b2c5 = 1;
					self thread function_b275b2c5(var_131f8ad6, localClientNum, self.var_c519aca3, var_6567041d);
				}
			}
			else if(Abs(self.var_b7cb6da3 - self.var_c519aca3) < 0.1)
			{
				level.var_b275b2c5 = undefined;
				self.var_c519aca3 = self.var_b7cb6da3;
				if(GetDvarString("gunpos") != "1")
				{
					SetDvar("viewmodel_p0_move0", "!tag_ads;0 0 0;0 0 " + self.var_c519aca3);
					SetUIModelValue(var_131f8ad6, "force_refresh_viewmodel_cmd");
				}
			}
		}
		if(self.var_e0833c8b != level.var_36d88358)
		{
			if(Abs(self.var_e0833c8b - level.var_36d88358) > 0.1)
			{
				if(!isdefined(level.var_58140e65))
				{
					level.var_58140e65 = 1;
					self thread function_58140e65(var_131f8ad6, localClientNum, level.var_36d88358, var_a4b940fd);
				}
			}
			else if(Abs(self.var_e0833c8b - level.var_36d88358) < 0.1)
			{
				level.var_58140e65 = undefined;
				function_7e66b783(self.var_e0833c8b);
			}
		}
	}
}

/*
	Name: function_b1018208
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x8810
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 2534
*/
function function_b1018208()
{
	if(!isdefined(!self.fireTime) || !self.fireTime)
	{
		self.var_98223dda = 0;
		return;
	}
	self notify("hash_b1018208");
	self endon("hash_b1018208");
	self endon("disconnect");
	delay = 0.1;
	var_6c678e16 = 1;
	if(self.var_f2fedd0c == 0)
	{
		self.var_f2fedd0c = 1;
		self.var_98223dda = var_6c678e16 * -1;
		util::server_wait(0, delay, 0.001);
		self.var_98223dda = var_6c678e16;
		util::server_wait(0, delay, 0.001);
	}
	else
	{
		self.var_f2fedd0c = 0;
		self.var_98223dda = var_6c678e16;
		util::server_wait(0, delay, 0.001);
		self.var_98223dda = var_6c678e16 * -1;
		util::server_wait(0, delay, 0.001);
	}
	self.var_98223dda = 0;
}

/*
	Name: function_4eac142f
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x8998
	Size: 0xE8
	Parameters: 6
	Flags: None
	Line Number: 2575
*/
function function_4eac142f(localClientNum, var_e3b262f9, offset, var_9aa51500, var_385a3ec4, var_71b33d5e)
{
	if(isdefined(level.var_ea266897))
	{
		return Array(-15, 0);
	}
	var_10e1ed49 = self function_9b6a8450(localClientNum, var_e3b262f9, offset, var_9aa51500, var_385a3ec4, var_71b33d5e);
	if(var_10e1ed49 == 0 && self.var_98223dda)
	{
		return Array(self.var_98223dda, 1);
	}
	return Array(var_10e1ed49, 0);
}

/*
	Name: function_54122d77
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x8A88
	Size: 0xE0
	Parameters: 2
	Flags: None
	Line Number: 2599
*/
function function_54122d77(min_speed, var_3e630a8c)
{
	if(!isdefined(var_3e630a8c))
	{
		var_3e630a8c = 0;
	}
	if(var_3e630a8c)
	{
		if(isdefined(self.fireTime))
		{
			return self.fireTime * 1000;
		}
		return 100;
	}
	speed = length(self getvelocity());
	if(speed > min_speed)
	{
		speed = min_speed;
	}
	var_a05b4028 = LerpFloat(600, 200, speed / min_speed);
	if(isdefined(var_a05b4028))
	{
		return var_a05b4028;
	}
	return 400;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_b275b2c5
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x8B70
	Size: 0x1A8
	Parameters: 4
	Flags: None
	Line Number: 2638
*/
function function_b275b2c5(var_131f8ad6, localClientNum, old_angles, time)
{
	self notify("hash_b275b2c5");
	self endon("hash_b275b2c5");
	var_78bc2c60 = GetTime();
	var_afc5c189 = var_78bc2c60 + time;
	start = var_78bc2c60;
	currentTime = var_78bc2c60;
	while(currentTime < var_afc5c189)
	{
		currentTime = GetTime();
		var_a05b4028 = LerpFloat(old_angles, self.var_b7cb6da3, currentTime - start / var_afc5c189 - start);
		if(isdefined(var_a05b4028))
		{
			self.var_c519aca3 = Int(var_a05b4028 * 100) / 100;
			if(GetDvarString("gunpos") != "1")
			{
				SetDvar("viewmodel_p0_move0", "!tag_ads;0 0 0;0 0 " + self.var_c519aca3);
				SetUIModelValue(var_131f8ad6, "force_refresh_viewmodel_cmd");
			}
			wait(0.001);
			level.var_b275b2c5 = undefined;
		}
		else
		{
			wait(0.001);
		}
	}
}

/*
	Name: function_58140e65
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x8D20
	Size: 0x148
	Parameters: 4
	Flags: None
	Line Number: 2678
*/
function function_58140e65(var_131f8ad6, localClientNum, old_angles, time)
{
	self notify("hash_58140e65");
	self endon("hash_58140e65");
	var_78bc2c60 = GetTime();
	var_afc5c189 = var_78bc2c60 + time;
	start = var_78bc2c60;
	currentTime = var_78bc2c60;
	while(currentTime < var_afc5c189)
	{
		currentTime = GetTime();
		var_a05b4028 = LerpFloat(old_angles, self.var_e0833c8b, currentTime - start / var_afc5c189 - start);
		if(isdefined(var_a05b4028))
		{
			function_7e66b783(Int(var_a05b4028 * 1000) / 1000);
			wait(0.001);
			level.var_58140e65 = undefined;
		}
		else
		{
			wait(0.001);
		}
	}
}

/*
	Name: function_9b6a8450
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x8E70
	Size: 0x3D8
	Parameters: 6
	Flags: None
	Line Number: 2713
*/
function function_9b6a8450(localClientNum, var_e3b262f9, offset, var_9aa51500, var_385a3ec4, var_71b33d5e)
{
	if(self isplayerwallrunning() || self IsPlayerSliding() || self IsPlayerSwimming() || self IsPlayerSprinting())
	{
		return 0;
	}
	player_eye_pos = GetLocalClientEyePos(localClientNum);
	player_angles = GetCamAnglesByLocalClientNum(localClientNum);
	player_eye_pos = player_eye_pos - AnglesToForward(player_angles) * Distance2D(player_eye_pos, self.origin);
	var_69c0d6c9 = AnglesToForward(player_angles);
	var_8603d46c = AnglesToRight(player_angles);
	player_velocity = self getvelocity();
	var_1a3bf3d2 = var_69c0d6c9 * var_385a3ec4;
	var_12b9c7a2 = player_eye_pos + var_e3b262f9 + VectorScale(var_69c0d6c9, 0) + VectorScale(player_velocity, 0.01);
	var_1d18b298 = beamtrace(var_12b9c7a2, var_12b9c7a2 - var_8603d46c * offset, 0, self, 1)["position"];
	var_f7b40347 = beamtrace(var_12b9c7a2, var_12b9c7a2 + var_8603d46c * offset, 0, self, 1)["position"];
	var_7775d8b2 = beamtrace(var_1d18b298, var_1d18b298 + var_1a3bf3d2, 0, self, 1)["position"];
	var_8735a0af = beamtrace(var_f7b40347, var_f7b40347 + var_1a3bf3d2, 0, self, 1)["position"];
	var_c994ae21 = Distance(var_1d18b298, var_7775d8b2);
	var_61410784 = Distance(var_f7b40347, var_8735a0af);
	var_65479737 = Abs(var_61410784 - var_c994ae21);
	if(var_65479737 > var_385a3ec4)
	{
		var_65479737 = var_385a3ec4;
	}
	var_9aa51500 = var_9aa51500 * var_65479737 / var_385a3ec4;
	if(var_c994ae21 < var_61410784)
	{
		var_71b33d5e = var_385a3ec4 - var_c994ae21 / var_385a3ec4;
		return var_9aa51500 * var_71b33d5e;
	}
	else
	{
		var_71b33d5e = var_385a3ec4 - var_61410784 / var_385a3ec4;
		return var_9aa51500 * var_71b33d5e * -1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4ac761c7
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x9250
	Size: 0x318
	Parameters: 1
	Flags: None
	Line Number: 2763
*/
function function_4ac761c7(localClientNum)
{
	self notify("hash_4ac761c7");
	self endon("hash_4ac761c7");
	self endon("entityshutdown");
	self endon("disconnect");
	controllerModel = GetUIModelForController(localClientNum);
	var_f904eff5 = GetUIModel(controllerModel, "hudItems.reload_cancle");
	var_e2861108 = GetUIModel(controllerModel, "currentWeapon.ammoInClip");
	var_b71eaadf = GetUIModel(controllerModel, "currentWeapon.ammoStock");
	var_a41563b9 = GetUIModel(controllerModel, "currentWeapon.ammoClipPercentage");
	var_4d1678a3 = -1;
	while(1)
	{
		wait(0.001);
		weapon = GetCurrentWeapon(localClientNum).rootweapon;
		weapon_clip = GetUIModelValue(var_e2861108);
		if(self function_3b3ead2(weapon, weapon_clip, var_4d1678a3))
		{
			if(self IsPlayerSprinting())
			{
				if(self hasPerk(localClientNum, "specialty_fastequipmentuse"))
				{
					weapon_stock = GetUIModelValue(var_b71eaadf);
					if(GetUIModelValue(var_a41563b9) >= 1 || weapon_stock < 1)
					{
						self thread function_52389936(var_f904eff5);
						self waittill("reload");
					}
				}
			}
			else
			{
				weapon_clip = GetUIModelValue(var_e2861108);
				wait(0.001);
				weapon_clip = GetUIModelValue(var_e2861108);
				if(self IsPlayerSprinting() && self function_3b3ead2(weapon, weapon_clip, var_4d1678a3))
				{
					self thread function_52389936(var_f904eff5);
				}
			}
			while(!self IsPlayerSprinting() && self function_3b3ead2(weapon, weapon_clip, var_4d1678a3))
			{
			}
		}
	}
}

/*
	Name: function_52389936
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x9570
	Size: 0x58
	Parameters: 1
	Flags: Private
	Line Number: 2821
*/
function private function_52389936(var_f904eff5)
{
	SetUIModelValue(var_f904eff5, "weapnext");
	wait(0.0001);
	SetUIModelValue(var_f904eff5, "weapprev");
}

/*
	Name: function_3b3ead2
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x95D0
	Size: 0xF0
	Parameters: 3
	Flags: None
	Line Number: 2838
*/
function function_3b3ead2(weapon, weapon_clip, var_4d1678a3)
{
	if(self IsPlayerFiring())
	{
		return 0;
	}
	if(self.IsSwitchingWeapons || (!(isdefined(self.var_c38c4a15) && self.var_c38c4a15)))
	{
		return 0;
	}
	if(weapon_clip < 1)
	{
		return 0;
	}
	if(isdefined(weapon))
	{
		return !weapon.unlimitedammo && !weapon.isClipOnly && weapon.isPrimary && !weapon.isAltMode && weapon.maxAmmo && weapon.startammo;
	}
	return 0;
}

/*
	Name: function_d73c5a3d
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x96C8
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 2869
*/
function function_d73c5a3d(localClientNum)
{
	self notify("hash_d73c5a3d");
	self endon("hash_d73c5a3d");
	self endon("entityshutdown");
	self endon("disconnect");
	self.IsSwitchingWeapons = 0;
	controllerModel = GetUIModelForController(localClientNum);
	var_f32bd2c = GetUIModel(controllerModel, "hudItems.aae_inspect_ui_rpm");
	while(1)
	{
		self waittill("weapon_change", weapon, w_old_weapon);
		SetUIModelValue(var_f32bd2c, function_680731ca(weapon));
		self.IsSwitchingWeapons = 1;
		wait(0.1);
		self.IsSwitchingWeapons = 0;
	}
}

/*
	Name: function_7e66b783
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x97D8
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 2898
*/
function function_7e66b783(roll)
{
	if(level.var_36d88358 != roll)
	{
		level.var_36d88358 = roll;
		if(roll != 0)
		{
			SetDvar("cg_cameraRollOverride", roll);
		}
	}
}

/*
	Name: function_680731ca
	Namespace: namespace_57a45b87
	Checksum: 0x424F4353
	Offset: 0x9838
	Size: 0x64A
	Parameters: 1
	Flags: None
	Line Number: 2920
*/
function function_680731ca(weapon)
{
	if(!isdefined(weapon))
	{
		return "WEAPON";
	}
	if(weapon.name == "none")
	{
		return "WEAPON";
	}
	weapon = GetWeapon(weapon.rootweapon.name);
	if(IsSubStr(weapon.name, "pistol"))
	{
		return "MPUI_PISTOL";
	}
	if(IsSubStr(weapon.name, "ar_"))
	{
		return "MPUI_ASSAULT_RIFLE";
	}
	if(IsSubStr(weapon.name, "smg"))
	{
		return "MPUI_SUB_MACHINE_GUN";
	}
	if(IsSubStr(weapon.name, "lmg"))
	{
		return "MPUI_LIGHT_MACHINE_GUN";
	}
	if(IsSubStr(weapon.name, "sniper"))
	{
		return "MPUI_WEAPON_SNIPER";
	}
	if(IsSubStr(weapon.name, "shotgun"))
	{
		return "MPUI_SHOTGUN";
	}
	if(IsSubStr(weapon.name, "launcher"))
	{
		return "MPUI_WEAPON_LAUNCHER";
	}
	if(IsSubStr(weapon.name, "ray") || IsSubStr(weapon.name, "thunder") || IsSubStr(weapon.name, "tesla") || IsSubStr(weapon.name, "hero") || IsSubStr(weapon.name, "idgun") || IsSubStr(weapon.name, "staff") || IsSubStr(weapon.name, "elemental"))
	{
		return "AAE_TIP_WONDERWEAPON";
	}
	if(isdefined(level.wallbuy_autofill_weapons))
	{
		if(isdefined(level.wallbuy_autofill_weapons["pistol"]) && isdefined(level.wallbuy_autofill_weapons["pistol"][weapon]))
		{
			return "MPUI_PISTOL";
		}
		if(isdefined(level.wallbuy_autofill_weapons["rifle"]) && isdefined(level.wallbuy_autofill_weapons["rifle"][weapon]))
		{
			return "MPUI_ASSAULT_RIFLE";
		}
		if(isdefined(level.wallbuy_autofill_weapons["smg"]) && isdefined(level.wallbuy_autofill_weapons["smg"][weapon]))
		{
			return "MPUI_SUB_MACHINE_GUN";
		}
		if(isdefined(level.wallbuy_autofill_weapons["shotgun"]) && isdefined(level.wallbuy_autofill_weapons["shotgun"][weapon]))
		{
			return "MPUI_SHOTGUN";
		}
		if(isdefined(level.wallbuy_autofill_weapons["lmg"]) && isdefined(level.wallbuy_autofill_weapons["lmg"][weapon]))
		{
			return "MPUI_LIGHT_MACHINE_GUN";
		}
		if(isdefined(level.wallbuy_autofill_weapons["lmg"]) && isdefined(level.wallbuy_autofill_weapons["mg"][weapon]))
		{
			return "MPUI_LIGHT_MACHINE_GUN";
		}
		if(isdefined(level.wallbuy_autofill_weapons["special"]) && isdefined(level.wallbuy_autofill_weapons["special"][weapon]))
		{
			return "MPUI_WEAPON_SPECIAL";
		}
		if(isdefined(level.wallbuy_autofill_weapons["sniper"]) && isdefined(level.wallbuy_autofill_weapons["sniper"][weapon]))
		{
			return "MPUI_WEAPON_SNIPER";
		}
	}
	if(weapon.isSniperWeapon)
	{
		return "MPUI_WEAPON_SNIPER";
	}
	if(weapon.weapClass == "pistol")
	{
		return "MPUI_PISTOL";
	}
	if(weapon.weapClass == "rifle")
	{
		return "MPUI_ASSAULT_RIFLE";
	}
	if(weapon.weapClass == "smg")
	{
		return "MPUI_SUB_MACHINE_GUN";
	}
	if(weapon.weapClass == "mg")
	{
		return "MPUI_LIGHT_MACHINE_GUN";
	}
	if(weapon.weapClass == "spread" || weapon.weapClass == "pistol spread")
	{
		return "MPUI_SHOTGUN";
	}
	if(weapon.isGasWeapon)
	{
		return "AAE_TIP_GASWEAPON";
	}
	if(weapon.isBoltAction)
	{
		return "MPUI_BOLT_ACTION_CAPS";
	}
	if(weapon.isRocketLauncher || weapon.isProjectileWeapon)
	{
		return "MPUI_WEAPON_LAUNCHER";
	}
	if(weapon.shotCount > 3)
	{
		return "MPUI_SHOTGUN";
	}
	return weapon.fireType;
}

