#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_aae_zombie_health_bar;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_laststand_bar;
#include scripts\zm\_zm_powerup_purifier;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_sub;
#include scripts\zm\_zm_t8_za;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\_zm_weap_tesla;
#include scripts\zm\_zm_weapons;
#include scripts\zm\aae_left_ges;
#include scripts\zm\aae_phd;
#include scripts\zm\bgbs\_zm_bgb_burned_out;
#include scripts\zm\chaser_gun;
#include scripts\zm\elmg_flashlight;
#include scripts\zm\share_points_powerup;
#include scripts\zm\weaponsmoketrails;

#namespace namespace_46c704e6;

/*
	Name: __init__sytem__
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0xF18
	Size: 0x58
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::Ignore("zm_bgb_fix");
	system::register("aae_core", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0xF78
	Size: 0x440
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function __init__()
{
	util::REGISTER_SYSTEM("deadshot_keyline", &function_4eab4974);
	level.using_zombie_powerups = 1;
	players = GetDvarInt("com_maxclients");
	MapName = GetDvarString("mapname");
	if(players >= 5)
	{
		for(i = 4; i < players; i++)
		{
			if(MapName == "zm_pot_noahj" || MapName == "zm_moon" || MapName == "zm_tomb" || MapName == "zm_stalingrad" || MapName == "zm_genesis")
			{
				RegisterClientField("world", "player" + i + "wearableItem", 21000, 5, "int", &zm_utility::setSharedInventoryUIModels, 0);
			}
			if(MapName == "zm_tomb")
			{
				clientfield::register("world", "player" + i + "hasItem", 15000, 2, "int", &zm_utility::setSharedInventoryUIModels, 0, 0);
			}
			if(MapName == "zm_castle")
			{
				RegisterClientField("world", "player" + i + "hasItem", 1, 1, "int", &zm_utility::setSharedInventoryUIModels, 0);
			}
			if(MapName == "zm_leviathan")
			{
				RegisterClientField("world", "player" + i + "wearableItem", 1, 4, "int", &zm_utility::setSharedInventoryUIModels, 0);
				RegisterClientField("world", "player" + i + "hasItem", 1, 4, "int", &zm_utility::setSharedInventoryUIModels, 0);
			}
		}
	}
	else if(MapName == "zm_zod" || MapName == "zm_castle" || MapName == "zm_island")
	{
		for(i = 0; i < GetDvarInt("com_maxclients"); i++)
		{
			RegisterClientField("world", "player" + i + "wearableItem", 15000, 2, "int", &zm_utility::setSharedInventoryUIModels, 0);
		}
	}
	clientfield::register("clientuimodel", "hudItems.aaePerkSlot", 21000, 4, "int", undefined, 0, 0);
	clientfield::register("scriptmover", "bank_keyline", 21000, GetMinBitCountForNum(2), "int", &function_6bd3013d, 0, 0);
	clientfield::register("clientuimodel", "hudItems.aaeWeapTradeBool", 21000, GetMinBitCountForNum(5), "int", undefined, 0, 0);
}

/*
	Name: __main__
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x13C0
	Size: 0x2A8
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function __main__()
{
	_zm_weap_tesla::init();
	namespace_57a45b87::init();
	SetDvar("chat_LastMs", GetDvarInt("chat_LastMs") + 1);
	SetDvar("player_standingViewHeight", 60);
	SetDvar("player_sustainAmmo", 0);
	SetDvar("elmg_unammo", 0);
	SetDvar("r_postFxIndex", -1);
	SetDvar("aae_aar", "");
	SetDvar("aar_gametime", "");
	SetDvar("aae_aargum", 0);
	level.var_2e169608 = [];
	duplicate_render::set_dr_filter_offscreen("elmg_keyline", 30, "elmg_keyline_active", undefined, 2, "mc/hud_outline_model_z_white", 1);
	duplicate_render::set_dr_filter_offscreen("deadshotplus_keyline", 33, "deadshotplus_keyline_active", undefined, 2, "mc/hud_outline_model_z_red", 1);
	level.var_2e25d5eb = [];
	ai::add_ai_spawn_function(&function_1e1da047);
	thread function_1ab871ca();
	callback::on_spawned(&function_2cbf4e7);
	callback::on_localplayer_spawned(&function_a90d6728);
	callback::on_localplayer_spawned(&function_b0703f90);
	callback::on_spawned(&function_fbbf1630);
	thread function_ca36eb6();
	thread function_eff51712();
	thread function_7a36329b();
	thread function_fa14c46d();
	thread function_be679176();
}

/*
	Name: function_ca36eb6
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x1670
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 146
*/
function function_ca36eb6()
{
	thread function_f9d080ae(0);
	if(IsSplitscreen())
	{
		thread function_f9d080ae(1);
	}
}

/*
	Name: spawned_callback
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x16C0
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 165
*/
function spawned_callback(localClientNum)
{
	if(isdefined(self) && isdefined(self.vehicleType))
	{
		self thread function_1e1da047(localClientNum);
		if(GetDvarString("tfoption_status") == "0")
		{
			self thread namespace_ee79c167::function_2ec3ca8a(localClientNum);
		}
		if(isdefined(level.var_1e7492a8))
		{
			self thread [[level.var_1e7492a8]](localClientNum);
		}
	}
}

/*
	Name: function_1ab871ca
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x1768
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 191
*/
function function_1ab871ca()
{
	wait(0.2);
	level.var_1e7492a8 = level._customVehicleCBFunc;
	level._customVehicleCBFunc = &spawned_callback;
}

/*
	Name: function_4eab4974
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x17A8
	Size: 0xA68
	Parameters: 2
	Flags: None
	Line Number: 208
*/
function function_4eab4974(localClientNum, message)
{
	if(IsSubStr(message, ","))
	{
		player = GetLocalPlayer(localClientNum);
		controllerModel = GetUIModelForController(localClientNum);
		var_21bd093f = GetUIModel(controllerModel, "hudItems.Center_Hints");
		var_656577f7 = GetUIModel(controllerModel, "hudItems.elmgdeadshot");
		var_1f93d790 = GetUIModel(controllerModel, "hudItems.elmgmulekick");
		var_12d0b392 = GetUIModel(controllerModel, "hudItems.paplv");
		var_1de69ded = GetUIModel(controllerModel, "hudItems.boostboot");
		var_131f8ad6 = GetUIModel(controllerModel, "hudItems.aaecmd");
		var_568d8f55 = GetUIModel(controllerModel, "hudItems.powerup_timer");
		var_fa3ab798 = GetUIModel(controllerModel, "hudItems.damagenum_model");
		var_cde9f622 = StrTok(message, ",");
		var_bd6a7982 = var_cde9f622[0];
		var_d95b9b0c = var_cde9f622[1];
		if(var_cde9f622.size == 3)
		{
			var_dfe775ea = var_cde9f622[2];
		}
		if(var_bd6a7982 == "at")
		{
			player thread function_9e2f4e39(localClientNum, Int(var_d95b9b0c), var_dfe775ea);
			return;
		}
		if(var_bd6a7982 == "d")
		{
			if(Int(var_d95b9b0c))
			{
				SetUIModelValue(var_656577f7, 1);
				player.var_91a1c4d9 = 1;
			}
			else
			{
				SetUIModelValue(var_656577f7, 0);
				player.var_91a1c4d9 = undefined;
				return;
			}
		}
		if(var_bd6a7982 == "i")
		{
			var_e47fba32 = GetUIModel(controllerModel, "hudItems.aae_inspect_ui");
			SetUIModelValue(var_e47fba32, float(var_d95b9b0c));
			return;
		}
		if(var_bd6a7982 == "r")
		{
			player notify(var_d95b9b0c);
			return;
		}
		if(var_bd6a7982 == "m")
		{
			if(Int(var_d95b9b0c))
			{
				SetUIModelValue(var_1f93d790, 1);
			}
			else
			{
				SetUIModelValue(var_1f93d790, 0);
				return;
			}
		}
		if(var_bd6a7982 == "p")
		{
			SetUIModelValue(var_12d0b392, Int(var_d95b9b0c));
			return;
		}
		if(var_bd6a7982 == "b")
		{
			SetUIModelValue(var_1de69ded, 1);
			playsound(0, "hud_boot", player.origin);
			return;
		}
		if(var_bd6a7982 == "hide")
		{
			var_255b3a4e = player function_94a844a2();
			if(var_d95b9b0c == "1")
			{
				if(!IsSplitscreen())
				{
					var_255b3a4e Hide();
					self Hide();
					player Hide();
				}
			}
			else
			{
				var_255b3a4e show();
				self show();
				player show();
				return;
			}
		}
		if(var_bd6a7982 == "e")
		{
			SetUIModelValue(var_21bd093f, var_d95b9b0c);
			return;
		}
		if(var_bd6a7982 == "zc")
		{
			namespace_b02b3342::function_70f1289f(localClientNum, var_d95b9b0c);
			return;
		}
		if(var_bd6a7982 == "hp")
		{
			self namespace_11beec63::function_44032ff3(localClientNum, "hp," + var_d95b9b0c + "," + var_dfe775ea);
			return;
		}
		if(var_bd6a7982 == "fl")
		{
			self namespace_11beec63::flashlight(localClientNum, "1");
			return;
		}
		if(var_bd6a7982 == "cmd")
		{
			SetUIModelValue(var_131f8ad6, var_d95b9b0c);
			return;
		}
		if(var_bd6a7982 == "pups")
		{
			SetUIModelValue(var_568d8f55, var_d95b9b0c);
			return;
		}
		if(var_bd6a7982 == "st")
		{
			self namespace_cc012897::result(localClientNum, var_d95b9b0c);
			return;
		}
		if(var_bd6a7982 == "light")
		{
			SetDvar("r_exposureTweak", 1);
			wait(1E-05);
			if(GetDvarInt("r_exposureValue"))
			{
				SetDvar("r_exposureTweak", 0);
			}
			else
			{
				SetDvar("r_exposureValue", 4);
				return;
			}
		}
		if(var_bd6a7982 == "dn")
		{
			SetUIModelValue(var_fa3ab798, var_d95b9b0c);
		}
		if(var_bd6a7982 == "gamb")
		{
			var_f5f8941a = GetUIModel(controllerModel, "hudItems.factory_notif");
			SetUIModelValue(var_f5f8941a, var_d95b9b0c);
			return;
		}
		if(var_bd6a7982 == "rami")
		{
			var_35212351 = GetUIModel(controllerModel, "hudItems.aaerampage");
			SetUIModelValue(var_35212351, var_d95b9b0c == "1");
			return;
		}
		if(var_bd6a7982 == "dvar")
		{
			if(IsSubStr(var_d95b9b0c, "â¦"))
			{
				var_cde9f622 = StrTok(var_d95b9b0c, "â¦");
				var_6eef7ae2 = var_cde9f622[0];
				dvar_value = var_cde9f622[1];
				SetDvar(var_6eef7ae2, dvar_value);
				return;
			}
		}
		if(var_bd6a7982 == "ip")
		{
			var_7926c388 = StrTok(var_d95b9b0c, "â¦");
			obj_model = GetUIModel(controllerModel, "objective" + var_7926c388[0]);
			if(IsSubStr(var_7926c388[1], "state"))
			{
				var_28e985d4 = StrTok(var_d95b9b0c, ":");
				var_995eefc6 = GetUIModel(obj_model, "state");
				SetUIModelValue(var_995eefc6, Int(var_28e985d4[1]));
			}
			else
			{
				var_8dda3fa7 = GetUIModel(obj_model, "hintstring");
				SetUIModelValue(var_8dda3fa7, var_7926c388[1]);
			}
		}
	}
}

/*
	Name: function_94a844a2
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x2218
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 407
*/
function function_94a844a2()
{
	if(isdefined(level.activePlayers))
	{
		foreach(player in level.activePlayers)
		{
			if(player.name == self.name)
			{
				return player;
			}
		}
	}
	return self;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8e24fb8d
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x22C8
	Size: 0xD0
	Parameters: 2
	Flags: None
	Line Number: 433
*/
function function_8e24fb8d(localClientNum, zombie)
{
	if(level.script == "zm_cosmodrome")
	{
		if(isdefined(zombie.archetype) && zombie.archetype == "monkey")
		{
			return 1;
		}
	}
	if(self.team == zombie.team)
	{
		return 0;
	}
	if(isdefined(self.var_91a1c4d9))
	{
		return 1;
	}
	if(GetDvarString("r_postFxIndex") == "1")
	{
		return 1;
	}
	return zombie function_17af874c();
}

/*
	Name: function_17af874c
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x23A0
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 467
*/
function function_17af874c()
{
	if(GetDvarString("aaeoption_lastzombie") == "1")
	{
		return 0;
	}
	if(isdefined(level.var_2e25d5eb) && level.var_2e25d5eb.size)
	{
		if(isdefined(self.archetype) && self.archetype == "zombie")
		{
			result = 0;
			foreach(ai in level.var_2e25d5eb)
			{
				if(isdefined(ai) && isdefined(ai.archetype) && ai.archetype == "zombie")
				{
					result++;
				}
				if(result > 1)
				{
					return 0;
				}
			}
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_9e23c9e2
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x24E8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 505
*/
function function_9e23c9e2()
{
	self util::waittill_any("death", "entityshutdown");
	if(isdefined(self.archetype) && self.archetype != "")
	{
		self function_ab262ae5();
	}
	ArrayRemoveValue(level.var_2e25d5eb, self);
}

/*
	Name: function_1e1da047
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x2570
	Size: 0x260
	Parameters: 1
	Flags: None
	Line Number: 525
*/
function function_1e1da047(localClientNum)
{
	self endon("death");
	self endon("entityshutdown");
	self thread function_9e23c9e2();
	player = GetLocalPlayer(localClientNum);
	if(isdefined(self.team) && player.team != self.team)
	{
		ArrayInsert(level.var_2e25d5eb, self, level.var_2e25d5eb.size);
	}
	wait(1);
	while(self IsInScritpedAnim())
	{
		wait(0.016);
	}
	if(isdefined(self.archetype) && self.archetype != "")
	{
		self function_ab262ae5();
	}
	while(isdefined(self) && (isdefined(self.archetype) || isdefined(self.vehicleType)))
	{
		wait(0.016);
		while(!player function_8e24fb8d(localClientNum, self))
		{
			wait(0.016);
		}
		if(player function_8e24fb8d(localClientNum, self))
		{
			self duplicate_render::set_dr_flag("deadshotplus_keyline_active", 1);
			self duplicate_render::update_dr_filters(localClientNum);
			self thread wait_for_death(localClientNum, player);
		}
		while(player function_8e24fb8d(localClientNum, self))
		{
			wait(0.016);
		}
		if(!player function_8e24fb8d(localClientNum, self))
		{
			self duplicate_render::set_dr_flag("deadshotplus_keyline_active", 0);
			self duplicate_render::update_dr_filters(localClientNum);
		}
	}
}

/*
	Name: wait_for_death
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x27D8
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 579
*/
function wait_for_death(localClientNum, player)
{
	self notify("wait_for_death");
	self endon("wait_for_death");
	self endon("entityshutdown");
	while(isalive(self))
	{
		wait(0.016);
	}
	self function_ab3b9e8();
	self duplicate_render::set_dr_flag("deadshotplus_keyline_active", 0);
	self duplicate_render::update_dr_filters(localClientNum);
}

/*
	Name: function_9473bb9c
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x2890
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 603
*/
function function_9473bb9c()
{
	if(!isdefined(self.model))
	{
		return 0;
	}
	if(self.model == "p7_mp_scavenger_pack" || self.model == "t6_wpn_trophy_system_view" || self.model == "wpn_t7_trophy_system")
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_6bd3013d
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x28F0
	Size: 0x1D0
	Parameters: 7
	Flags: None
	Line Number: 626
*/
function function_6bd3013d(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(self.model == "p7_zm_zod_bubblegum_machine_no_lion")
	{
		self thread function_a6f96721(localClientNum);
		return;
	}
	if(isdefined(self.FX))
	{
		if(!self function_9473bb9c())
		{
			deletefx(localClientNum, self.FX);
			self.FX = undefined;
		}
		if(isdefined(newVal) && newVal == 2)
		{
		}
		else
		{
			self duplicate_render::set_dr_flag("elmg_keyline_active", 0);
			self duplicate_render::update_dr_filters(localClientNum);
		}
	}
	else if(isdefined(newVal) && newVal == 2)
	{
	}
	else if(self.model == "gambler" || self.model == "wpn_t7_uplink_ball_world")
	{
	}
	else
	{
		self duplicate_render::set_dr_flag("elmg_keyline_active", 1);
		self duplicate_render::update_dr_filters(localClientNum);
	}
	self function_23ff0c52(localClientNum, function_fb1c996c(self.model));
}

/*
	Name: function_23ff0c52
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x2AC8
	Size: 0xC8
	Parameters: 3
	Flags: None
	Line Number: 673
*/
function function_23ff0c52(localClientNum, FX, tag)
{
	if(!isdefined(tag))
	{
		tag = "tag_origin";
	}
	if(!isdefined(FX))
	{
		return;
	}
	self util::waittill_dobj(localClientNum);
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.FX))
	{
		deletefx(localClientNum, self.FX);
	}
	self.FX = PlayFXOnTag(localClientNum, FX, self, "tag_origin");
}

/*
	Name: function_a6f96721
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x2B98
	Size: 0x380
	Parameters: 1
	Flags: None
	Line Number: 705
*/
function function_a6f96721(localClientNum)
{
	self util::waittill_dobj(localClientNum);
	if(!isdefined(self))
	{
		return;
	}
	PlayFXOnTag(localClientNum, level._effect["zm_bgb_machine_available"], self, "tag_origin");
	PlayFXOnTag(localClientNum, level._effect["zm_bgb_machine_light_interior"], self, "tag_fx_glass_cntr_jnt");
	num = self GetEntityNumber();
	self.FX = [];
	for(;;)
	{
		result = level util::waittill_any_return("bgb_buy" + num, "bgb_give" + num, "bgb_take" + num);
		if(result == "bgb_buy" + num)
		{
			if(isdefined(self.FX["bgb_buy"]))
			{
				deletefx(localClientNum, self.FX["bgb_buy"]);
			}
			if(isdefined(self.FX["bgb_give"]))
			{
				deletefx(localClientNum, self.FX["bgb_give"]);
			}
			self.FX["bgb_buy"] = PlayFXOnTag(localClientNum, level._effect["zm_bgb_machine_flying_elec"], self, "tag_fx_glass_cntr_jnt");
		}
		else if(result == "bgb_give" + num)
		{
			if(isdefined(self.FX["bgb_buy"]))
			{
				deletefx(localClientNum, self.FX["bgb_buy"]);
			}
			if(isdefined(self.FX["bgb_give"]))
			{
				deletefx(localClientNum, self.FX["bgb_give"]);
			}
			self.FX["bgb_give"] = PlayFXOnTag(localClientNum, level._effect["zm_bgb_machine_gumball_halo"], self, "tag_gumball_ghost");
			self thread function_ca47687b(localClientNum);
		}
		else if(result == "bgb_take" + num || result == "bgb_timeout" + num)
		{
			if(isdefined(self.FX["bgb_buy"]))
			{
				deletefx(localClientNum, self.FX["bgb_buy"]);
			}
			if(isdefined(self.FX["bgb_give"]))
			{
				deletefx(localClientNum, self.FX["bgb_give"]);
			}
		}
	}
}

/*
	Name: function_ca47687b
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x2F20
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 768
*/
function function_ca47687b(localClientNum)
{
	num = self GetEntityNumber();
	self endon("bgb_buy" + num);
	self endon("bgb_take" + num);
	wait(7);
	if(isdefined(self.FX["bgb_buy"]))
	{
		deletefx(localClientNum, self.FX["bgb_buy"]);
	}
	if(isdefined(self.FX["bgb_give"]))
	{
		deletefx(localClientNum, self.FX["bgb_give"]);
	}
}

/*
	Name: function_fb1c996c
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x3000
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 794
*/
function function_fb1c996c(model)
{
	switch(model)
	{
		case "t6_wpn_trophy_system_view":
		{
			return level._effect["powerup_on_caution"];
			break;
		}
		case "gambler":
		case "wpn_t7_trophy_system":
		case "wpn_t7_uplink_ball_world":
		{
			return level._effect["powerup_on_red"];
			break;
		}
		default
		{
			return level._effect["powerup_on_solo"];
			break;
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fbbf1630
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x3098
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 830
*/
function function_fbbf1630(localClientNum)
{
	self notify("hash_fbbf1630");
	self endon("hash_fbbf1630");
	self endon("disconnect");
	self endon("entityshutdown");
	nums = 5;
	while(nums)
	{
		if(!isdefined(level.activePlayers))
		{
			level.activePlayers = [];
		}
		else
		{
			level.activePlayers[self GetEntityNumber()] = self;
		}
		nums--;
		SetDvar("activeplayers", level.activePlayers.size);
		WaitRealTime(2);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ea3da1ac
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x3168
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 865
*/
function function_ea3da1ac()
{
	origin = self GetTagOrigin("j_head");
	if(isdefined(origin) && origin != self.origin)
	{
		return origin + VectorScale((0, 0, 1), 12);
	}
	origin = self GetTagOrigin("j_jaw_upper");
	if(isdefined(origin) && origin != self.origin)
	{
		return origin + VectorScale((0, 0, 1), 25);
	}
	if(isdefined(self.origin) && IsVec(self.origin))
	{
		return self.origin;
	}
	return (0, 0, 0);
}

/*
	Name: void
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x3258
	Size: 0x40
	Parameters: 7
	Flags: Private
	Line Number: 894
*/
function private void(localClientNum, oldValue, newValue, bNewEnt, bInitialSnap, fieldName, wasDemoJump)
{
}

/*
	Name: function_fa14c46d
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x32A0
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 908
*/
function function_fa14c46d()
{
	SetDvar("elmg_skybox_rotate", 0);
	value = 0;
	while(1)
	{
		WaitRealTime(1);
		while(GetDvarInt("elmg_skybox_rotate") == 3)
		{
			value = value + 2;
			SetDvar("r_skyRotation", value);
			if(value == 360)
			{
				value = 0;
			}
			WaitRealTime(0.03333333);
		}
		SetDvar("r_skyRotation", 0);
	}
}

/*
	Name: function_eff51712
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x3378
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 939
*/
function function_eff51712()
{
	while(1)
	{
		wait(0.001);
		if(GetDvarString("og") != "")
		{
			function_39659176(0, 2000, "GetLocalClientEyePos: " + GetLocalClientEyePos(0));
			function_39659176(0, 2000, "GetLocalClientPos: " + getlocalclientpos(0));
			function_39659176(0, 2000, "GetCamPosByLocalClientNum: " + GetCamPosByLocalClientNum(0));
			function_39659176(0, 2000, "GetCamAnglesByLocalClientNum: " + GetCamAnglesByLocalClientNum(0));
			function_39659176(0, 2000, "GetLocalClientAngles: " + GetLocalClientAngles(0));
			while(GetDvarString("og") != "")
			{
				wait(0.001);
			}
		}
	}
}

/*
	Name: function_be45f345
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x3500
	Size: 0x190
	Parameters: 1
	Flags: None
	Line Number: 969
*/
function function_be45f345(player)
{
	player_origin = player GetTagOrigin("head");
	eye = self GetEye();
	trace = beamtrace(eye, player_origin, 1, self, 1);
	if(!Distance(player_origin, trace["position"]) < 50)
	{
		player_origin = player GetTagOrigin("pelvis");
		trace = beamtrace(eye, player_origin, 1, self, 1);
		if(!Distance(player_origin, trace["position"]) < 50)
		{
			trace = beamtrace(eye, player.origin, 1, self, 1);
			return Distance(player_origin, trace["position"]) < 50;
		}
	}
	return 1;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_de148f21
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x3698
	Size: 0x190
	Parameters: 2
	Flags: None
	Line Number: 998
*/
function function_de148f21(eyePos, current_player)
{
	if(isdefined(level.activePlayers))
	{
		player_angles = self GetCamAngles();
		var_27239834 = [];
		foreach(player in level.activePlayers)
		{
			if(isdefined(player) && player != current_player && Distance(player.origin, eyePos) > 300)
			{
				var_3f4b6f03 = util::within_fov(eyePos, player_angles, player GetTagOrigin("j_spinelower"), cos(5));
				if(var_3f4b6f03)
				{
					var_27239834[var_27239834.size] = player;
				}
			}
		}
		return ArrayGetClosest(eyePos, var_27239834);
		return;
	}
}

/*
	Name: function_940c9471
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x3830
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 1030
*/
function function_940c9471(ent_num)
{
	if(isdefined(level.activePlayers) && level.activePlayers.size)
	{
		players = [];
		foreach(player in level.activePlayers)
		{
			if(player != self)
			{
				players[players.size] = player;
			}
		}
		player = ArrayGetClosest(self.origin, players);
		if(isdefined(player))
		{
			return player GetEntityNumber();
		}
	}
	return ent_num;
}

/*
	Name: function_f9d080ae
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x3940
	Size: 0x810
	Parameters: 1
	Flags: None
	Line Number: 1061
*/
function function_f9d080ae(localClientNum)
{
	var_8c310847 = GetDvarInt("com_maxclients");
	while(!isdefined(GetLocalPlayer(localClientNum)))
	{
		wait(0.016);
	}
	controllerModel = GetUIModelForController(localClientNum);
	var_5c3db93a = CreateUIModel(controllerModel, "hudItems.aaeWeapTradeEnt");
	var_984e6e1a = [];
	for(i = 0; i < var_8c310847; i++)
	{
		var_984e6e1a[i] = CreateUIModel(controllerModel, "hudItems.OHealthbar" + i);
	}
	while(1)
	{
		wait(0.001);
		var_53388350 = GetLocalPlayer(localClientNum);
		player_num = var_53388350 GetEntityNumber();
		var_b322abbb = GetCamPosByLocalClientNum(localClientNum);
		var_756ca7bd = GetDvarInt("cg_drawThroughWalls");
		var_81915c72 = undefined;
		SetUIModelValue(var_5c3db93a, var_53388350 function_940c9471(player_num));
		if(var_8c310847 > 4 && isdefined(level.activePlayers[player_num]) && isdefined(level.activePlayers[player_num].laststand))
		{
			var_81915c72 = var_53388350 function_de148f21(var_b322abbb, level.activePlayers[player_num]);
		}
		if(isdefined(level.activePlayers) && IsArray(level.activePlayers) && level.activePlayers.size != 0)
		{
			if(IsIGCActive(localClientNum))
			{
				for(i = 0; i < var_8c310847; i++)
				{
					SetUIModelValue(var_984e6e1a[i], "0");
				}
			}
			else
			{
				for(i = 0; i < var_8c310847; i++)
				{
					if(isdefined(level.activePlayers) && isdefined(level.activePlayers[i]) && isalive(level.activePlayers[i]))
					{
						player = level.activePlayers[i];
						if(i != player_num || IsThirdPerson(localClientNum))
						{
							if(var_756ca7bd)
							{
								var_ee0a4c29 = player function_ea3da1ac();
								dis = Distance(var_ee0a4c29, var_b322abbb);
								priority = player function_57ace3bc(var_b322abbb, var_ee0a4c29, player_num);
								if(isdefined(var_81915c72) && var_81915c72 === player)
								{
									dis = 0;
									priority = 9999;
								}
								var_cc071500 = "0";
								x_offset = 0;
								if(var_ee0a4c29[2] > player.origin[2])
								{
									x_offset = var_ee0a4c29[2] - player.origin[2];
								}
								if(isdefined(var_53388350.team) && (var_53388350.team == "axis" || var_53388350.team == "allies") && var_53388350.team != player.team)
								{
									var_cc071500 = "1";
								}
								SetUIModelValue(var_984e6e1a[player GetEntityNumber()], "" + x_offset + "," + dis + "," + priority + "," + var_cc071500);
							}
							else if(var_53388350 function_be45f345(player))
							{
								var_ee0a4c29 = player function_ea3da1ac();
								dis = Distance(var_ee0a4c29, var_b322abbb);
								priority = player function_57ace3bc(var_b322abbb, var_ee0a4c29, player_num);
								var_cc071500 = "0";
								x_offset = 0;
								if(var_ee0a4c29[2] > player.origin[2])
								{
									x_offset = var_ee0a4c29[2] - player.origin[2];
								}
								if(isdefined(var_53388350.team) && (var_53388350.team == "axis" || var_53388350.team == "allies") && var_53388350.team != player.team)
								{
									var_cc071500 = "1";
								}
								SetUIModelValue(var_984e6e1a[player GetEntityNumber()], "" + x_offset + "," + dis + "," + priority + "," + var_cc071500);
							}
							else
							{
								SetUIModelValue(var_984e6e1a[player GetEntityNumber()], "0");
							}
						}
						else
						{
							SetUIModelValue(var_984e6e1a[i], "0");
							continue;
						}
					}
					SetUIModelValue(var_984e6e1a[i], "0");
				}
			}
		}
		else if(GetDvarInt("flushingamesub") == 1)
		{
			flushsubtitles(localClientNum);
		}
	}
}

/*
	Name: function_9e2f4e39
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x4158
	Size: 0xE0
	Parameters: 3
	Flags: None
	Line Number: 1177
*/
function function_9e2f4e39(localClientNum, state, Number)
{
	controllerModel = GetUIModelForController(localClientNum);
	var_ba1a96a5 = GetUIModel(controllerModel, "hudItems.aat_cooldown_timer");
	self notify("hash_755c918f");
	if(state)
	{
		self thread function_755c918f(Int(Number), var_ba1a96a5);
	}
	else
	{
		self thread function_732fe720(Int(Number), var_ba1a96a5);
	}
}

/*
	Name: function_732fe720
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x4240
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 1202
*/
function function_732fe720(timer, model)
{
	self endon("hash_755c918f");
	self endon("disconnect");
	self endon("entityshutdown");
	SetUIModelValue(model, timer + "%");
	WaitRealTime(1);
	SetUIModelValue(model, "");
}

/*
	Name: function_755c918f
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x42C8
	Size: 0xD8
	Parameters: 2
	Flags: None
	Line Number: 1222
*/
function function_755c918f(timer, model)
{
	self endon("hash_755c918f");
	self endon("disconnect");
	self endon("entityshutdown");
	startTime = GetTime();
	endTime = startTime + Int(timer) * 10;
	while(endTime > startTime)
	{
		startTime = GetTime();
		SetUIModelValue(model, endTime - startTime);
		wait(0.001);
	}
	SetUIModelValue(model, "");
}

/*
	Name: function_57ace3bc
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x43A8
	Size: 0xF0
	Parameters: 3
	Flags: None
	Line Number: 1248
*/
function function_57ace3bc(var_b322abbb, var_ee0a4c29, player_num)
{
	if(isdefined(level.activePlayers) && IsArray(level.activePlayers) && level.activePlayers.size > 0)
	{
		player_array = Array::get_all_closest(var_b322abbb, level.activePlayers);
		for(i = 0; i < player_array.size; i++)
		{
			if(isdefined(player_array[i]) && player_array[i] == self)
			{
				return Int("-" + i + 2);
			}
		}
	}
	return 0;
}

/*
	Name: function_e9d9c5cf
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x44A0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1274
*/
function function_e9d9c5cf()
{
	return Int(length(self getvelocity()) * 0.09144);
}

/*
	Name: function_45037772
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x44F0
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 1289
*/
function function_45037772(localClientNum)
{
	origin = getlocalclientpos(localClientNum);
	trace = beamtrace(origin + VectorScale((0, 0, 1), 20), origin - VectorScale((0, 0, 1), 5000000), 1, self);
	return !self IsPlayerSprinting() && (self getvelocity() == (0, 0, 0) || Distance(origin, trace["position"]) < 5);
}

/*
	Name: function_975983de
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x45D0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 1306
*/
function function_975983de()
{
	trace = beamtrace(self.origin + VectorScale((0, 0, 1), 100), self.origin - VectorScale((0, 0, 1), 5000000), 1, self);
	if(trace["position"][2] >= self.origin[2])
	{
		return 0;
	}
	return Distance(trace["position"], self.origin) * 0.0254;
}

/*
	Name: function_d124b5e6
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x4690
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 1326
*/
function function_d124b5e6(localClientNum)
{
	eye = GetLocalClientEyePos(localClientNum);
	anglesforward = AnglesToForward(GetLocalClientAngles(localClientNum));
	var_b29a610c = eye + anglesforward * 14.5;
	return Distance(beamtrace(var_b29a610c, eye + anglesforward * 100000, 1, self)["position"], var_b29a610c) * 0.0254;
}

/*
	Name: function_14ff519c
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x4778
	Size: 0x1F0
	Parameters: 2
	Flags: None
	Line Number: 1344
*/
function function_14ff519c(controllerModel, localClientNum)
{
	self endon("entityshutdown");
	self notify("hash_14ff519c");
	self endon("hash_14ff519c");
	self endon("disconnect");
	if(self != GetLocalPlayer(localClientNum))
	{
		return;
	}
	distance_moved = GetUIModel(controllerModel, "hudItems.distance_moved");
	time = 0;
	Distance = 0;
	current_time = 0;
	last_origin = (0, 0, 0);
	for(;;)
	{
		wait(1E-05);
		if(self != GetLocalPlayer(localClientNum))
		{
			return;
		}
		time = GetTime();
		if(self getvelocity() != (0, 0, 0))
		{
			while(self getvelocity() != (0, 0, 0))
			{
				last_origin = self.origin;
				wait(1E-05);
				current_time = GetTime() - time;
				Distance = Distance + Distance(last_origin, self.origin);
				SetUIModelValue(distance_moved, "" + current_time + "," + Distance * 0.0254);
			}
			WaitRealTime(2);
		}
		Distance = 0;
		current_time = 0;
		SetUIModelValue(distance_moved, "");
	}
}

/*
	Name: function_66e4ce04
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x4970
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 1395
*/
function function_66e4ce04(localClientNum)
{
	if(self hasPerk(localClientNum, "specialty_staminup"))
	{
		return 12;
	}
	return 4;
}

/*
	Name: function_25e105
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x49B0
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1414
*/
function function_25e105(localClientNum)
{
	if(self hasPerk(localClientNum, "specialty_staminup"))
	{
		if(self.var_18c006a4 < 12000)
		{
			return 1;
		}
	}
	else if(self.var_18c006a4 < 4000)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_3bb893c4
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x4A20
	Size: 0x228
	Parameters: 1
	Flags: None
	Line Number: 1440
*/
function function_3bb893c4(localClientNum)
{
	if(!isdefined(self.var_18c006a4))
	{
		self.var_18c006a4 = 4000;
	}
	if(!isdefined(self.sprintStartTime))
	{
		self.sprintStartTime = GetTime();
	}
	if(!isdefined(self.var_f702f65e))
	{
		self.var_f702f65e = 4000;
	}
	currentTime = GetTime();
	elapsedTime = currentTime - self.sprintStartTime;
	if(self IsPlayerSprinting())
	{
		if(self.var_18c006a4 > self.var_f702f65e)
		{
			self.var_18c006a4 = self.var_f702f65e;
		}
		self.var_18c006a4 = self.var_18c006a4 - 1000 * elapsedTime / 1000;
		if(self.var_18c006a4 < 0)
		{
			self.var_18c006a4 = 0;
		}
	}
	else
	{
		var_e2916db6 = self function_66e4ce04(localClientNum) * 1000;
		if(var_e2916db6 != self.var_f702f65e)
		{
			self.var_f702f65e = var_e2916db6;
		}
		if(self function_25e105(localClientNum))
		{
			self.var_18c006a4 = self.var_18c006a4 + 1000 * elapsedTime / 1000;
		}
	}
	var_36092124 = self.var_18c006a4 / self.var_f702f65e;
	self.sprintStartTime = currentTime;
	if(var_36092124 >= 1 || self hasPerk(localClientNum, "specialty_unlimitedsprint") || GetDvarInt("player_sprintUnlimited") || GetDvarString("aaeoption_staminabar") == "1")
	{
		return 2;
	}
	return var_36092124;
}

/*
	Name: function_accf7d19
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x4C50
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 1499
*/
function function_accf7d19(localClientNum)
{
	weapon = GetCurrentWeapon(localClientNum);
	if(IsSubStr(weapon.name, "reddot") || IsSubStr(weapon.name, "ir") || IsSubStr(weapon.name, "dualoptic") || IsSubStr(weapon.name, "acog"))
	{
		return 0;
	}
	return GetDvarString("aim_status") == "3";
}

/*
	Name: function_d53774d0
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x4D50
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 1519
*/
function function_d53774d0(localClientNum)
{
	currentTime = GetTime();
	elapsedTime = currentTime - self.var_3f59e516;
	if(self function_accf7d19(localClientNum))
	{
		self.BREATH = self.BREATH + 1000 * elapsedTime / 1000;
		if(self.BREATH > 1000)
		{
			self.BREATH = 1000;
		}
	}
	else
	{
		self.BREATH = self.BREATH - 1000 * elapsedTime / 1000 * 6;
		if(self.BREATH < 0)
		{
			self.BREATH = 0;
		}
	}
	self.var_3f59e516 = currentTime;
	var_6a4f4bdb = self.BREATH / 1000;
	return var_6a4f4bdb;
}

/*
	Name: function_a90d6728
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x4E58
	Size: 0xE90
	Parameters: 1
	Flags: None
	Line Number: 1554
*/
function function_a90d6728(localClientNum)
{
	self endon("entityshutdown");
	self notify("hash_a90d6728");
	self endon("hash_a90d6728");
	self endon("disconnect");
	if(self != GetLocalPlayer(localClientNum))
	{
		return;
	}
	controllerModel = GetUIModelForController(localClientNum);
	var_cd8a00ae = GetUIModel(controllerModel, "hudItems.centercrosshair");
	var_c4255eef = GetUIModel(controllerModel, "hudItems.playerfiring");
	var_a84eb91f = GetUIModel(controllerModel, "hudItems.hm_stance");
	var_476918d1 = GetUIModel(controllerModel, "hudItems.speedmeter");
	var_92da5738 = GetUIModel(controllerModel, "hudItems.highmeter");
	var_49cb990a = GetUIModel(controllerModel, "hudItems.grenadefuse");
	IsOnGround = GetUIModel(controllerModel, "hudItems.isOnGround");
	var_4fb9de34 = GetUIModel(controllerModel, "hudItems.distancecounter");
	SetUIModelValue(var_49cb990a, 0);
	var_74187fe9 = GetUIModel(controllerModel, "hudItems.elmgplayersta");
	var_e47fba32 = GetUIModel(controllerModel, "hudItems.aae_inspect_ui");
	self.BREATH = 0;
	self.var_3f59e516 = GetTime();
	self thread function_14ff519c(controllerModel, localClientNum);
	SetDvar("aae_aar", 1);
	for(;;)
	{
		wait(1E-05);
		if(self != GetLocalPlayer(localClientNum))
		{
			return;
		}
		if(GetDvarString("aaeoption_spawn_dust") != "")
		{
			if(GetDvarString("aaeoption_spawn_dust") == "1")
			{
				if(!isdefined(level.var_7dd0f8f4))
				{
					level.var_7dd0f8f4 = [];
					level.var_7dd0f8f4["rise_burst_snow"] = level._effect["rise_burst_snow"];
					level.var_7dd0f8f4["rise_billow_snow"] = level._effect["rise_billow_snow"];
					level.var_7dd0f8f4["rise_dust_snow"] = level._effect["rise_dust_snow"];
					level.var_7dd0f8f4["rise_burst"] = level._effect["rise_burst"];
					level.var_7dd0f8f4["rise_billow"] = level._effect["rise_billow"];
					level.var_7dd0f8f4["rise_dust"] = level._effect["rise_dust"];
					level.var_7dd0f8f4["rise_burst_water"] = level._effect["rise_burst_water"];
					level.var_7dd0f8f4["rise_billow_water"] = level._effect["rise_billow_water"];
					level.var_7dd0f8f4["rise_dust_water"] = level._effect["rise_dust_water"];
				}
				level._effect["rise_burst_snow"] = "";
				level._effect["rise_billow_snow"] = "";
				level._effect["rise_dust_snow"] = "";
				level._effect["rise_burst"] = "";
				level._effect["rise_billow"] = "";
				level._effect["rise_dust"] = "";
				level._effect["rise_burst_water"] = "";
				level._effect["rise_billow_water"] = "";
				level._effect["rise_dust_water"] = "";
			}
			else if(isdefined(level.var_7dd0f8f4))
			{
				level._effect["rise_burst_snow"] = level.var_7dd0f8f4["rise_burst_snow"];
				level._effect["rise_billow_snow"] = level.var_7dd0f8f4["rise_billow_snow"];
				level._effect["rise_dust_snow"] = level.var_7dd0f8f4["rise_dust_snow"];
				level._effect["rise_burst"] = level.var_7dd0f8f4["rise_burst"];
				level._effect["rise_billow"] = level.var_7dd0f8f4["rise_billow"];
				level._effect["rise_dust"] = level.var_7dd0f8f4["rise_dust"];
				level._effect["rise_burst_water"] = level.var_7dd0f8f4["rise_burst_water"];
				level._effect["rise_billow_water"] = level.var_7dd0f8f4["rise_billow_water"];
				level._effect["rise_dust_water"] = level.var_7dd0f8f4["rise_dust_water"];
			}
		}
		if(GetDvarString("aaeoption_rgb_eye") != "")
		{
			if(GetDvarString("aaeoption_rgb_eye") == "1")
			{
				if(!isdefined(level.var_e63ec582))
				{
					level.var_e63ec582 = level._override_eye_fx;
				}
				level._override_eye_fx = "custom/eye/zombie_eye_custom";
			}
			else if(isdefined(level.var_e63ec582))
			{
				level._override_eye_fx = level.var_e63ec582;
			}
		}
		SetDvar("cg_thirdperson", GetDvarInt("aae_thirdperson"));
		thirdperson = IsThirdPerson(localClientNum);
		SetDvar("cg_drawMinimap", GetDvarInt("aaeoption_nozoom"));
		SetDvar("cg_drawThroughWalls", GetDvarString("aaeoption_seewall") != "1");
		SetUIModelValue(var_4fb9de34, self function_d124b5e6(localClientNum));
		SetUIModelValue(var_74187fe9, self function_3bb893c4(localClientNum));
		if(self function_45037772(localClientNum))
		{
			SetUIModelValue(IsOnGround, 1);
		}
		else
		{
			SetUIModelValue(IsOnGround, 0);
		}
		if(GetDvarInt("aaeoption_forcelod"))
		{
			SetDvar("r_modelLodBias", 10);
			SetDvar("r_lodBiasRigid", -1000);
		}
		else
		{
			SetDvar("r_modelLodBias", 1);
			SetDvar("r_lodBiasRigid", 0);
		}
		if(GetDvarInt("aaeoption_sm"))
		{
			SetUIModelValue(var_476918d1, self function_e9d9c5cf());
			SetUIModelValue(var_92da5738, self function_975983de());
		}
		else
		{
			SetUIModelValue(var_476918d1, -1);
		}
		if(GetUIModelValue(var_e47fba32) > 0)
		{
			SetDvar("cg_drawcrosshair", 0);
		}
		else if(GetDvarInt("aaeoption_centercross") || thirdperson)
		{
			SetUIModelValue(var_cd8a00ae, "blacktransparent");
			if(Int(GetUIModelValue(var_49cb990a)) == 0)
			{
				SetDvar("cg_drawcrosshair", 1);
			}
		}
		else if(self IsPlayerSprinting() && !self hasPerk(localClientNum, "specialty_sprintequipment"))
		{
			if(Int(GetUIModelValue(var_49cb990a)) == 0)
			{
				if(!IsSplitscreen())
				{
					SetDvar("cg_drawcrosshair", 0);
				}
			}
			SetUIModelValue(var_cd8a00ae, "reticle_sprint");
		}
		else if(Int(GetUIModelValue(var_49cb990a)) == 0)
		{
			SetDvar("cg_drawcrosshair", 1);
		}
		SetUIModelValue(var_cd8a00ae, "reticle_dot_small");
		if(self IsPlayerFiring())
		{
			SetUIModelValue(var_c4255eef, "1");
		}
		else
		{
			SetUIModelValue(var_c4255eef, "0");
		}
		var_9d83893c = self hasPerk(localClientNum, "specialty_deadshot");
		has_laser = self function_8761e27c(localClientNum);
		if(self IsPlayerSliding() || self isplayerwallrunning())
		{
			if(var_9d83893c)
			{
				SetUIModelValue(var_a84eb91f, 7);
			}
			else
			{
				SetUIModelValue(var_a84eb91f, 19);
			}
		}
		else
		{
			var_44e0d5d8 = Int(Distance(self.origin, self GetCamPos()));
			if(length(self getvelocity()))
			{
				if(var_44e0d5d8 > 50)
				{
					if(var_9d83893c)
					{
						SetUIModelValue(var_a84eb91f, 5);
					}
					else
					{
						SetUIModelValue(var_a84eb91f, 15);
					}
				}
				else if(var_44e0d5d8 > 38)
				{
					if(var_9d83893c)
					{
						SetUIModelValue(var_a84eb91f, 2);
					}
					else
					{
						SetUIModelValue(var_a84eb91f, 5);
					}
				}
				else
				{
					SetUIModelValue(var_a84eb91f, 0);
				}
			}
			else if(var_44e0d5d8 > 50)
			{
				if(var_9d83893c)
				{
					SetUIModelValue(var_a84eb91f, 5);
				}
				else
				{
					SetUIModelValue(var_a84eb91f, 8);
				}
			}
			else
			{
				SetUIModelValue(var_a84eb91f, 0);
			}
		}
	}
}

/*
	Name: function_8761e27c
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x5CF0
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 1785
*/
function function_8761e27c(localClientNum)
{
	weapon = GetCurrentWeapon(localClientNum);
	if(IsSubStr(weapon, "+steadyaim"))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_b0703f90
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x5D50
	Size: 0x238
	Parameters: 1
	Flags: None
	Line Number: 1805
*/
function function_b0703f90(localClientNum)
{
	player = GetLocalPlayer(localClientNum);
	if(player != self)
	{
		return;
	}
	self notify("hash_b0703f90");
	self endon("hash_b0703f90");
	self endon("entityshutdown");
	self endon("disconnect");
	MapName = GetDvarString("mapname");
	if(MapName == "zm_castle" || MapName == "zm_genesis")
	{
		castle = 1;
	}
	controllerModel = GetUIModelForController(localClientNum);
	var_e7f486d9 = GetUIModel(controllerModel, "hudItems.hideboostbar");
	var_1de69ded = GetUIModel(controllerModel, "hudItems.boostboot");
	while(1)
	{
		if(GetDvarInt("slide_forceBaseSlide"))
		{
			if(self hasPerk(localClientNum, "specialty_lowgravity") && isdefined(castle))
			{
				SetUIModelValue(var_e7f486d9, 1);
				SetUIModelValue(var_1de69ded, 1);
				while(self hasPerk(localClientNum, "specialty_lowgravity"))
				{
					wait(0.016);
				}
			}
			else
			{
				SetUIModelValue(var_e7f486d9, 0);
			}
		}
		else
		{
			SetUIModelValue(var_e7f486d9, 1);
		}
		wait(0.016);
	}
}

/*
	Name: function_2cbf4e7
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x5F90
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 1860
*/
function function_2cbf4e7(localClientNum)
{
	self notify("hash_2cbf4e7");
	self endon("hash_2cbf4e7");
	self endon("entityshutdown");
	self endon("disconnect");
	if(!self isLocalPlayer() || !isdefined(self getlocalclientnumber()) || localClientNum != self getlocalclientnumber())
	{
		return;
	}
	controllerModel = GetUIModelForController(localClientNum);
	var_96f92aeb = GetUIModel(controllerModel, "hudItems.elmgscorevalue");
	player_num = "" + self GetEntityNumber() + "=";
	SetUIModelValue(var_96f92aeb, player_num + self.score);
	self.var_70578808 = self.score;
	while(1)
	{
		if(self.score != self.var_70578808)
		{
			self thread function_ae339f30(localClientNum, var_96f92aeb, self.var_70578808, player_num);
			wait(0.1);
		}
		wait(1E-05);
	}
}

/*
	Name: function_ae339f30
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x6138
	Size: 0x1C8
	Parameters: 4
	Flags: None
	Line Number: 1896
*/
function function_ae339f30(localClientNum, var_96f92aeb, var_70578808, player_num)
{
	if(Abs(var_70578808 - self.score) < 3)
	{
		self.var_70578808 = self.score;
		SetUIModelValue(var_96f92aeb, player_num + self.score);
		return;
	}
	self notify("hash_ae339f30");
	self endon("hash_ae339f30");
	self endon("entityshutdown");
	self endon("disconnect");
	var_afc5c189 = GetRealTime() + 300;
	start = GetRealTime();
	currentTime = GetRealTime();
	while(currentTime < var_afc5c189)
	{
		currentTime = GetRealTime();
		self.var_70578808 = LerpFloat(var_70578808, self.score, currentTime - start / var_afc5c189 - start);
		SetUIModelValue(var_96f92aeb, player_num + Int(self.var_70578808));
		wait(1E-05);
	}
}

/*
	Name: function_177033f2
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x6308
	Size: 0x1E0
	Parameters: 2
	Flags: None
	Line Number: 1930
*/
function function_177033f2(localClientNum, newValue)
{
	self notify("hash_ae339f30");
	self endon("hash_ae339f30");
	self endon("entityshutdown");
	self endon("disconnect");
	player_num = "" + self GetEntityNumber() + "=";
	controllerModel = GetUIModelForController(localClientNum);
	var_96f92aeb = GetUIModel(controllerModel, "hudItems.elmgscorevalue");
	startTime = GetRealTime();
	timeSinceLastUpdate = 0;
	if(!isdefined(self.var_c3fe5022))
	{
		self.var_c3fe5022 = 0;
	}
	oldValue = self.var_c3fe5022;
	self.var_c3fe5022 = newValue;
	ms = 500;
	while(timeSinceLastUpdate <= ms)
	{
		timeSinceLastUpdate = GetRealTime() - startTime;
		lerpValue = LerpFloat(oldValue, newValue, timeSinceLastUpdate / ms);
		SetUIModelValue(var_96f92aeb, player_num + Int(lerpValue));
		wait(0.001);
	}
}

/*
	Name: function_7a36329b
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x64F0
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1967
*/
function function_7a36329b()
{
	function_d0011063();
	wait(1);
	level.mechz_detach_claw_override = &void;
	if(GetDvarString("tfoption_dw") == "1" && isdefined(level.weaponZMThunderGunUpgraded) && level.weaponZMThunderGunUpgraded != GetWeapon("thundergun_upgraded_og"))
	{
		level.weaponZMThunderGunUpgraded = GetWeapon("thundergun_upgraded_og");
	}
}

/*
	Name: function_d0011063
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x65A8
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 1988
*/
function function_d0011063()
{
	if(GetDvarInt("aae_lite") != 1)
	{
		MapName = GetDvarString("ui_mapname");
		if(MapName == "zm_zod" || MapName == "zm_factory" || MapName == "zm_castle" || MapName == "zm_island" || MapName == "zm_genesis" || MapName == "zm_prototype" || MapName == "zm_asylum" || MapName == "zm_sumpf" || MapName == "zm_theater" || MapName == "zm_cosmodrome" || MapName == "zm_temple" || MapName == "zm_moon" || MapName == "zm_tomb")
		{
			zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/elmg_weapons.csv", 1);
		}
		else
		{
			zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/mk3.csv", 1);
			zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/elmg_weapons.csv", 1);
		}
		if(MapName == "zm_zod")
		{
			zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/dg2.csv", 1);
			return;
		}
	}
	~MapName;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d6bd37c8
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x6758
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 2022
*/
function function_d6bd37c8()
{
	result = 1;
	var_f927f647 = GetDvarInt("tfoption_elmg");
	if(isdefined(var_f927f647) && var_f927f647 == 1)
	{
		result = 0;
	}
	return result;
}

/*
	Name: function_be679176
	Namespace: namespace_46c704e6
	Checksum: 0x424F4353
	Offset: 0x67C0
	Size: 0x92
	Parameters: 0
	Flags: None
	Line Number: 2043
*/
function function_be679176()
{
	level endon("end_game");
	for(;;)
	{
		level waittill("hash_7913b59", player_num, state);
		if(isdefined(level.activePlayers[player_num]))
		{
			if("EnterLaststand" == state)
			{
				level.activePlayers[player_num].laststand = 1;
			}
			else
			{
				level.activePlayers[player_num].laststand = undefined;
			}
		}
	}
}

