#include scripts\shared\ai_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;

#namespace namespace_ee79c167;

/*
	Name: init
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x608
	Size: 0x58
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec init()
{
	ai::add_ai_spawn_function(&function_2ec3ca8a);
	callback::on_localplayer_spawned(&function_dd179d9);
	thread function_b82fc90f();
}

/*
	Name: function_b82fc90f
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x668
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function function_b82fc90f()
{
	wait(1);
	controllerModel = GetUIModelForController(0);
	for(i = 24; i < 130; i++)
	{
		var_b7461ce7 = GetUIModel(GetUIModel(controllerModel, "AAE_ZombieHealthModel_" + i), "visibility");
		if(isdefined(var_b7461ce7))
		{
			SetUIModelValue(var_b7461ce7, 2);
		}
	}
	controllerModel = GetUIModelForController(1);
	for(i = 24; i < 130; i++)
	{
		var_b7461ce7 = GetUIModel(GetUIModel(controllerModel, "AAE_ZombieHealthModel_" + i), "visibility");
		if(isdefined(var_b7461ce7))
		{
			SetUIModelValue(var_b7461ce7, 2);
		}
	}
}

/*
	Name: function_dd179d9
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x7D0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 67
*/
function function_dd179d9(localClientNum)
{
	if(self != GetLocalPlayer(localClientNum))
	{
		return;
	}
	self thread function_4cb070bc();
	return;
	~;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4cb070bc
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x818
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 89
*/
function function_4cb070bc()
{
	self notify("hash_ca4fba15");
	self endon("hash_ca4fba15");
	self endon("entityshutdown");
	self endon("disconnect");
	while(1)
	{
		if(isdefined(level.var_2e25d5eb) && level.var_2e25d5eb.size)
		{
			zombie = self function_9ba9cf67();
			if(isdefined(zombie))
			{
				self.var_8cec461 = zombie GetEntityNumber();
			}
			else
			{
				self.var_8cec461 = undefined;
			}
		}
		else
		{
			self.var_8cec461 = undefined;
		}
		wait(0.016);
	}
}

/*
	Name: function_9ba9cf67
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x8F0
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 127
*/
function function_9ba9cf67()
{
	if(isdefined(level.var_2e25d5eb))
	{
		var_81e03bee = self GetCamPos();
		player_angles = self GetCamAngles();
		var_ce396ec9 = [];
		foreach(zombie in level.var_2e25d5eb)
		{
			if(Distance(zombie.origin, var_81e03bee) <= 400 && (!(isdefined(self.vehicleType) && self.vehicleType == "flinger_vehicle")))
			{
				var_e02a9a96 = util::within_fov(var_81e03bee, player_angles, zombie.origin, cos(50));
				if(var_e02a9a96)
				{
					trace = bullettrace(var_81e03bee, zombie.origin, 1, self, 1);
					if(Distance(trace["position"], zombie.origin) < 12)
					{
						var_ce396ec9[var_ce396ec9.size] = zombie;
					}
				}
			}
		}
		return ArrayGetClosest(var_81e03bee, var_ce396ec9, 250);
		return;
	}
}

/*
	Name: function_2ec3ca8a
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0xB00
	Size: 0x540
	Parameters: 1
	Flags: None
	Line Number: 164
*/
function function_2ec3ca8a(localClientNum)
{
	if(isdefined(self) && GetDvarString("tfoption_status") != "1")
	{
		if(isdefined(self.team))
		{
			if(self.team != "axis")
			{
				if(isdefined(self.vehicleType))
				{
					if(self.vehicleType == "spawner_enemy_boss_vehicle_siegebot_nikolai_dragon" || self.vehicleType == "spawner_enemy_boss_vehicle_siegebot_nikolai")
					{
						while(self.team != "axis")
						{
							wait(0.016);
						}
					}
					return;
				}
				else
				{
				}
			}
			return;
		}
		else
		{
		}
		var_8caad239 = Int(self GetEntityNumber());
		level notify("zombie_health_bar_spawn" + var_8caad239 + localClientNum, self.vehicleType == "veh_bo3_dlc_mil_b17_bomber");
		level endon("zombie_health_bar_spawn" + var_8caad239 + localClientNum);
		WaitRealTime(1);
		controllerModel = GetUIModelForController(localClientNum);
		var_556e9af2 = CreateUIModel(CreateUIModel(controllerModel, "AAE_ZombieHealthModel_" + var_8caad239), "progress");
		SetUIModelValue(var_556e9af2, 1);
		var_295c365b = CreateUIModel(CreateUIModel(controllerModel, "AAE_ZombieHealthModel_" + var_8caad239), "ai_icon");
		var_54fddfde = CreateUIModel(CreateUIModel(controllerModel, "AAE_ZombieHealthModel_" + var_8caad239), "position");
		var_b7461ce7 = CreateUIModel(CreateUIModel(controllerModel, "AAE_ZombieHealthModel_" + var_8caad239), "visibility");
		var_2589d116 = CreateUIModel(CreateUIModel(controllerModel, "AAE_ZombieHealthModel_" + var_8caad239), "ai_name");
		var_935d5e29 = GetUIModel(controllerModel, "hudItems.spawn_actor_healthbar");
		SetUIModelValue(var_295c365b, self function_2cf9d958(1));
		SetUIModelValue(var_2589d116, self function_2cf9d958());
		SetUIModelValue(var_935d5e29, var_8caad239);
		while(isdefined(self) && isalive(self))
		{
			wait(0.016);
			if(isdefined(self.team))
			{
				if(self.team != "axis")
				{
					if(isdefined(self.vehicleType) && (self.vehicleType == "veh_bo3_dlc_mil_b17_bomber" || self.vehicleType == "spawner_enemy_boss_vehicle_siegebot_nikolai_dragon" || self.vehicleType == "spawner_enemy_boss_vehicle_siegebot_nikolai"))
					{
					}
					else
					{
						SetUIModelValue(var_b7461ce7, 2);
						return;
					}
				}
			}
			var_736783e8 = self BulletTracePassed(localClientNum);
			if(var_736783e8)
			{
				origin = self function_ea3da1ac();
				SetUIModelValue(var_54fddfde, "" + origin[0] + "," + origin[1] + "," + origin[2]);
				SetUIModelValue(var_b7461ce7, var_736783e8);
			}
			else
			{
				SetUIModelValue(var_b7461ce7, 0);
			}
		}
		SetUIModelValue(var_556e9af2, 0);
		WaitRealTime(0.2);
		SetUIModelValue(var_b7461ce7, 2);
	}
}

/*
	Name: function_ea3da1ac
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x1048
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 252
*/
function function_ea3da1ac()
{
	if(isdefined(self.vehicleType) && self.vehicleType != "")
	{
		if(self.vehicleType == "spawner_enemy_boss_vehicle_siegebot_nikolai_dragon" || self.vehicleType == "spawner_enemy_boss_vehicle_siegebot_nikolai")
		{
			return self GetTagOrigin("tag_eye") + VectorScale((0, 0, 1), 50);
		}
		return self.origin + VectorScale((0, 0, 1), 50);
	}
	origin5 = self GetTagOrigin("j_head");
	if(isdefined(origin5) && isdefined(origin5[0]) && isdefined(origin5[1]) && isdefined(origin5[1]) && origin5 != (0, 0, 0))
	{
		return origin5 + VectorScale((0, 0, 1), 10);
	}
	origin3 = self GetEye();
	if(isdefined(origin3) && isdefined(origin3[0]) && isdefined(origin3[1]) && isdefined(origin3[1]) && origin3 != (0, 0, 0))
	{
		return origin3 + VectorScale((0, 0, 1), 10);
	}
	return self.origin;
}

/*
	Name: BulletTracePassed
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x11F8
	Size: 0x1B0
	Parameters: 1
	Flags: None
	Line Number: 285
*/
function BulletTracePassed(localClientNum)
{
	if(isdefined(self.vehicleType) && self.vehicleType == "flinger_vehicle")
	{
		return 0;
	}
	if(isdefined(self.vehicleType) && (self.vehicleType == "veh_bo3_dlc_mil_b17_bomber" || self.vehicleType == "spawner_enemy_boss_vehicle_siegebot_nikolai_dragon" || self.vehicleType == "spawner_enemy_boss_vehicle_siegebot_nikolai"))
	{
		return 1;
	}
	player = GetLocalPlayer(localClientNum);
	if(isdefined(player.var_8cec461) && player.var_8cec461 == self GetEntityNumber())
	{
		return 1;
	}
	camera_pos = GetLocalClientEyePos(localClientNum);
	v_trace = bullettrace(camera_pos, camera_pos + AnglesToForward(GetCamAnglesByLocalClientNum(localClientNum)) * 1000, 1, player, 1);
	if(isdefined(v_trace["entity"]) && v_trace["entity"] GetEntityNumber() == self GetEntityNumber())
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_2cf9d958
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x13B0
	Size: 0x666
	Parameters: 1
	Flags: None
	Line Number: 319
*/
function function_2cf9d958(bool)
{
	if(!isdefined(bool))
	{
		bool = 0;
	}
	var_8759ede1 = "t9_zombie_health_dot";
	var_525ec887 = "MENU_ENEMY";
	if(isdefined(self.model))
	{
		if(IsSubStr(self.model, "george"))
		{
			if(bool)
			{
				return "uie_ui_icon_minimap_zm_ai_boss";
			}
			else
			{
				return "George A. Romero";
			}
		}
		if(IsSubStr(self.model, "keeper"))
		{
			if(bool)
			{
				return "uie_ui_icon_minimap_zm_ai_special";
			}
			else
			{
				return "AAEP_KEEPER";
			}
		}
		if(IsSubStr(self.model, "sonic"))
		{
			if(bool)
			{
				return "uie_ui_icon_minimap_zm_ai_elite";
			}
			else
			{
				return "AAEP_SHRIEKER";
			}
		}
		if(IsSubStr(self.model, "napalm"))
		{
			if(bool)
			{
				return "uie_ui_icon_minimap_zm_ai_elite";
			}
			else
			{
				return "AAEP_NAPALM";
			}
		}
		if(IsSubStr(self.model, "monkey"))
		{
			if(bool)
			{
				return var_8759ede1;
			}
			else
			{
				return "AAEP_MONKEY";
			}
		}
		if(IsSubStr(self.model, "brutus"))
		{
			if(bool)
			{
				return "uie_ui_icon_minimap_zm_ai_elite";
			}
			else
			{
				return "Brutus";
			}
		}
		if(IsSubStr(self.model, "warden"))
		{
			if(bool)
			{
				return "uie_ui_icon_minimap_zm_ai_elite";
			}
			else
			{
				return "Brutus";
			}
		}
		if(IsSubStr(self.model, "nikolai"))
		{
			if(bool)
			{
				return "uie_ui_icon_minimap_zm_ai_elite";
			}
			else
			{
				return "EM_BACK_MP_ZMHD_NIKOLAI";
			}
		}
		if(IsSubStr(self.model, "richtofen"))
		{
			if(bool)
			{
				return "uie_ui_icon_minimap_zm_ai_elite";
			}
			else
			{
				return "EM_BACK_MP_ZMHD_RICHTOFEN";
			}
		}
		if(IsSubStr(self.model, "takeo"))
		{
			if(bool)
			{
				return "uie_ui_icon_minimap_zm_ai_elite";
			}
			else
			{
				return "EM_BACK_MP_ZMHD_TAKEO";
			}
		}
		if(IsSubStr(self.model, "dempsey"))
		{
			if(bool)
			{
				return "uie_ui_icon_minimap_zm_ai_elite";
			}
			else
			{
				return "EM_BACK_MP_ZMHD_DEMPSEY";
			}
		}
	}
	if(isdefined(self.str_name))
	{
		var_525ec887 = self.str_name;
	}
	else if(isdefined(self.vehicleType))
	{
		switch(self.vehicleType)
		{
			case "spawner_bo3_parasite_enemy_tool":
			{
				var_525ec887 = "AAEP_PARASITE";
				break;
			}
			case "spawner_bo3_parasite_elite_enemy_tool":
			{
				var_525ec887 = "AAEP_PARASITE";
				break;
			}
			case "spawner_enemy_zombie_vehicle_raps_suicide":
			{
				var_525ec887 = "AAEP_MEATBALL";
				break;
			}
			case "spawner_bo3_spider_enemy":
			{
				var_525ec887 = "MENU_PLAYER_EMBLEM_8";
				break;
			}
			case "spawner_bo3_spider_enemy_red":
			{
				var_525ec887 = "MENU_PLAYER_EMBLEM_8";
				break;
			}
			case "spawner_bo3_spider_friendly":
			{
				var_525ec887 = "MENU_PLAYER_EMBLEM_8";
				break;
			}
			case "spawner_enemy_boss_vehicle_siegebot_nikolai_dragon":
			{
				var_525ec887 = "EM_BACK_MP_ZMHD_NIKOLAI";
				var_8759ede1 = "uie_ui_icon_minimap_zm_ai_boss";
				break;
			}
			case "spawner_enemy_boss_vehicle_siegebot_nikolai":
			{
				var_525ec887 = "EM_BACK_MP_ZMHD_NIKOLAI";
				var_8759ede1 = "uie_ui_icon_minimap_zm_ai_boss";
				break;
			}
			case "spawner_zm_dlc3_vehicle_raps_nikolai":
			{
				var_525ec887 = "KILLSTREAK_RAPS";
				var_8759ede1 = "uie_ui_icon_minimap_zm_ai_boss";
				break;
			}
			case "veh_bo3_dlc_mil_b17_bomber":
			{
				var_525ec887 = "AAEP_ZNS_PLANE";
				break;
			}
			case "spawner_bo3_dlc_sentinel_drone":
			{
				var_525ec887 = "AAEP_DRONE";
				var_8759ede1 = "uie_ui_icon_minimap_zm_ai_special";
				break;
			}
		}
	}
	else
	{
		switch(self.archetype)
		{
			case "zombie":
			{
				var_525ec887 = "EM_ZOMBIE01";
				break;
			}
			case "monkey":
			{
				var_525ec887 = "AAEP_MONKEY";
				break;
			}
			case "zombie_dog":
			{
				var_525ec887 = "WEAPON_PISTOL_REVOLVER_UPGRADED";
				break;
			}
			case "zombie_napalm":
			{
				var_525ec887 = "AAEP_NAPALM";
				var_8759ede1 = "uie_ui_icon_minimap_zm_ai_elite";
				break;
			}
			case "astronaut":
			{
				var_525ec887 = "AAEP_ASTROUAUT";
				var_8759ede1 = "uie_ui_icon_minimap_zm_ai_elite";
				break;
			}
			case "zombie_sonic":
			{
				var_525ec887 = "AAEP_SHRIEKER";
				var_8759ede1 = "uie_ui_icon_minimap_zm_ai_elite";
				break;
			}
			case "thrasher":
			{
				var_525ec887 = "AAEP_THRASHER";
				var_8759ede1 = "uie_ui_icon_minimap_zm_ai_elite";
				break;
			}
			case "zombie_quad":
			{
				var_525ec887 = "AAEP_NOVA";
				break;
			}
			case "apothicon_fury":
			{
				var_525ec887 = "AAEP_FURY";
				var_8759ede1 = "uie_ui_icon_minimap_zm_ai_special";
				break;
			}
			case "mechz":
			{
				var_525ec887 = "AAEP_PANZER";
				var_8759ede1 = "uie_ui_icon_minimap_zm_ai_boss";
				break;
			}
			case "margwa":
			{
				var_525ec887 = "AAEP_MARGWA";
				var_8759ede1 = "uie_ui_icon_minimap_zm_ai_boss";
				break;
			}
			case "raz":
			{
				var_525ec887 = "AAEP_MANGLER";
				var_8759ede1 = "uie_ui_icon_minimap_zm_ai_elite";
				break;
			}
			case "cellbreaker":
			{
				var_525ec887 = "Brutus";
				var_8759ede1 = "uie_ui_icon_minimap_zm_ai_elite";
				break;
			}
		}
	}
	if(bool)
	{
		return var_8759ede1;
	}
	else
	{
		return var_525ec887;
	}
	return var_525ec887;
}

