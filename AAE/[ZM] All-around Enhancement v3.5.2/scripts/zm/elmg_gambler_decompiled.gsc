#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\gameobjects_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_clientdvar;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\aae_left_ges;
#include scripts\zm\bgbs\_zm_bgb_anywhere_but_here;
#include scripts\zm\bgbs\_zm_bgb_phoenix_up;
#include scripts\zm\bgbs\_zm_bgb_round_robbin;
#include scripts\zm\elmg_gambler_item;

#namespace namespace_82ce4a91;

/*
	Name: __init__sytem__
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0xBF0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 38
*/
function autoexec __init__sytem__()
{
	system::register("elmg_gambler", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0xC30
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function __init__()
{
	if(function_d9d9bda4())
	{
		thread function_cd387cf0();
		return;
	}
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_d9d9bda4
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0xC68
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 74
*/
function function_d9d9bda4()
{
	if(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver") && GetDvarString("tfoption_gambler") == "1")
	{
		return 0;
	}
	if(GetDvarInt("com_maxclients") >= 8)
	{
		if(level.script == "zm_zod" || level.script == "zm_stalingrad" || level.script == "zm_moon")
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: function_30c7dd6b
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0xD60
	Size: 0x1A8
	Parameters: 1
	Flags: None
	Line Number: 100
*/
function function_30c7dd6b(gambler)
{
	level endon("end_game");
	for(;;)
	{
		foreach(player in GetPlayers())
		{
			if(!player.var_17075ee)
			{
				if(isdefined(player.var_def06a03) && player.var_def06a03 >= 25)
				{
					player function_52988a8d(gambler.objectiveId, "^BBUTTON_COD_POINT_ICON^10", "-1");
				}
				else
				{
					player function_52988a8d(gambler.objectiveId, "^BBUTTON_COD_POINT_ICON^1000", "-1");
				}
			}
			if(isdefined(player.var_def06a03) && player.var_def06a03 >= 50)
			{
				player.var_888f3d5f = 2;
				continue;
			}
			player.var_888f3d5f = 1;
		}
		level waittill("start_of_round");
	}
}

/*
	Name: onUse
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0xF10
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 139
*/
function onUse(e_player)
{
	self thread function_5414b858(e_player);
}

/*
	Name: canInteractWithPlayer
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0xF40
	Size: 0x1E0
	Parameters: 1
	Flags: None
	Line Number: 154
*/
function canInteractWithPlayer(e_player)
{
	var_f329927f = (Int(self.origin[0]), Int(self.origin[1]), Int(self.origin[2]));
	eye = e_player GetEye();
	result = util::within_fov(eye, e_player getPlayerAngles(), var_f329927f, cos(GetDvarInt("ip_angles")));
	range = GetDvarInt("ip_range");
	result = Distance(e_player.origin, var_f329927f) <= range || Distance(eye, var_f329927f) <= range && result;
	if(result)
	{
		if(e_player GamepadUsedLast())
		{
			self gameobjects::set_use_time(0.35);
		}
		else
		{
			self gameobjects::set_use_time(0.05);
		}
	}
	return result;
}

/*
	Name: function_ff3bdd4b
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x1128
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 185
*/
function function_ff3bdd4b(origin)
{
	t_use = spawn("trigger_radius_use", origin, 0, 60, 60);
	t_use TriggerIgnoreTeam();
	t_use setvisibletoall();
	t_use SetTeamForTrigger("none");
	t_use setcursorhint("HINT_INTERACTIVE_PROMPT");
	t_use EnableLinkTo();
	var_db7c07b5 = gameobjects::create_use_object("any", t_use, [], (0, 0, 0), &"aaethreed_gambler", 0, 1);
	var_db7c07b5 gameobjects::allow_use("any");
	var_db7c07b5 gameobjects::set_owner_team("allies");
	var_db7c07b5 gameobjects::set_visible_team("any");
	var_db7c07b5.onUse = &onUse;
	var_db7c07b5.useWeapon = undefined;
	var_db7c07b5.keepWeapon = 1;
	var_db7c07b5.dontLinkPlayerToTrigger = 1;
	var_db7c07b5 gameobjects::set_use_time(0.35);
	var_db7c07b5.onBeginUse = undefined;
	var_db7c07b5.onEndUse = undefined;
	var_db7c07b5.canInteractWithPlayer = &canInteractWithPlayer;
	return var_db7c07b5;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_52988a8d
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x1338
	Size: 0x68
	Parameters: 3
	Flags: None
	Line Number: 219
*/
function function_52988a8d(objId, hint, var_36f79777)
{
	self util::setClientSysState("deadshot_keyline", "ip," + objId + "â¦" + hint + ":" + var_36f79777, self);
}

/*
	Name: function_5442133
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x13A8
	Size: 0x358
	Parameters: 0
	Flags: None
	Line Number: 234
*/
function function_5442133()
{
	pos = tableLookup("gamedata/tables/common/box_chance.csv", 24, GetDvarString("ui_mapname"), 29);
	if(isdefined(pos) && pos != "")
	{
		pos = StrTok(pos, "|");
		if(pos.size == 3)
		{
			angles = tableLookup("gamedata/tables/common/box_chance.csv", 24, GetDvarString("ui_mapname"), 31);
			var_32ffa65a = function_ff3bdd4b((float(pos[0]), float(pos[1]), float(pos[2])));
			var_f0c9c2e9 = tableLookup("gamedata/tables/common/box_chance.csv", 24, GetDvarString("ui_mapname"), 30);
			if(isdefined(var_f0c9c2e9) && var_f0c9c2e9 != "" && var_f0c9c2e9 != "0")
			{
				var_32ffa65a SetModel(var_f0c9c2e9);
			}
			return var_32ffa65a;
		}
	}
	pos = tableLookup("gamedata/tables/common/box_chance.csv", 24, level.script, 29);
	if(isdefined(pos) && pos != "")
	{
		pos = StrTok(pos, "|");
		if(pos.size == 3)
		{
			angles = tableLookup("gamedata/tables/common/box_chance.csv", 24, level.script, 31);
			var_32ffa65a = function_ff3bdd4b((float(pos[0]), float(pos[1]), float(pos[2])));
			var_f0c9c2e9 = tableLookup("gamedata/tables/common/box_chance.csv", 24, level.script, 30);
			if(isdefined(var_f0c9c2e9) && var_f0c9c2e9 != "" && var_f0c9c2e9 != "0")
			{
				var_32ffa65a SetModel(var_f0c9c2e9);
			}
			return var_32ffa65a;
		}
	}
}

/*
	Name: function_cd387cf0
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x1708
	Size: 0x270
	Parameters: 0
	Flags: None
	Line Number: 280
*/
function function_cd387cf0()
{
	level flag::wait_till("initial_blackscreen_passed");
	wait(5);
	if(GetDvarString("tfoption_zombs_always_sprint") == "1")
	{
		trigger = function_5442133();
		if(!isdefined(trigger))
		{
			return;
		}
		trigger.targetname = "elmg_gambler";
	}
	else
	{
		origin = function_3a83cf39();
		origin = beamtrace(origin + VectorScale((0, 0, 1), 5), origin - VectorScale((0, 0, 1), 100), 1, undefined, 0, 0)["position"] + VectorScale((0, 0, 1), 30);
		trigger = function_ff3bdd4b(origin);
		if(GetDvarString("aae_lite") == "")
		{
			trigger SetModel("gambler");
		}
		else
		{
			trigger SetModel("wpn_t7_uplink_ball_world");
		}
		trigger.targetname = "elmg_gambler";
		trigger clientfield::set("bank_keyline", 1);
	}
	namespace_8ba9a0c9::function_b7ca8f3c();
	thread function_30c7dd6b(trigger);
	if(GetDvarString("elmg_cheats") == "1" || GetDvarInt("sv_cheats"))
	{
		thread function_47223c94();
		thread function_281f62e5();
	}
	level.var_bd1b01f5 = &function_5414b858;
}

/*
	Name: function_281f62e5
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x1980
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 329
*/
function function_281f62e5()
{
	modvar("gambler_f", "");
	while(GetDvarString("gambler_f") != "")
	{
		origin = function_3a83cf39();
		iprintln(origin);
		level.activePlayers[0] SetOrigin(origin);
		IPrintLnBold(origin);
		SetDvar("gambler_f", "");
		wait(0.05);
	}
}

/*
	Name: function_47223c94
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x1A68
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 353
*/
function function_47223c94()
{
	modvar("gambler", "");
	while(GetDvarString("gambler") != "")
	{
		level.activePlayers[level.activePlayers.size - 1] thread [[level.var_7df5e788[GetDvarInt("gambler")].func]]();
		SetDvar("gambler", "");
		wait(0.05);
	}
}

/*
	Name: function_e26c11e
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x1B30
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 374
*/
function function_e26c11e()
{
	if(GetDvarString("tfoption_zombs_always_sprint") != "1")
	{
		self clientfield::set("bank_keyline", 1);
	}
}

/*
	Name: function_5414b858
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x1B88
	Size: 0x2C0
	Parameters: 1
	Flags: None
	Line Number: 392
*/
function function_5414b858(player)
{
	cost = 1000;
	if(isdefined(player.var_def06a03) && player.var_def06a03 >= 25)
	{
		cost = 10;
	}
	if(player.score < cost && !player bgb::is_enabled("zm_bgb_shopping_free"))
	{
		player thread zm_audio::create_and_play_dialog("general", "exert_sigh");
		player playlocalsound("zmb_no_cha_ching");
		return;
	}
	if(player.var_17075ee && isdefined(player.var_17075ee))
	{
		player playlocalsound("zmb_no_cha_ching");
		return;
	}
	if(player.var_888f3d5f <= 0 && isdefined(player.var_888f3d5f))
	{
		player playlocalsound("zmb_no_cha_ching");
		return;
	}
	if(player laststand::player_is_in_laststand())
	{
		player playlocalsound("zmb_no_cha_ching");
		return;
	}
	if(player.sessionstate == "spectator")
	{
		player playlocalsound("zmb_no_cha_ching");
		return;
	}
	if(!isalive(player) || !isdefined(player))
	{
		self playsound("zmb_no_cha_ching");
		return;
	}
	if(zm_utility::is_player_valid(player) && player zm_score::can_player_purchase(cost))
	{
		player thread zm_audio::create_and_play_dialog("general", "exert_laugh");
		player thread function_ce5b1a6f(self);
		player zm_score::minus_to_player_score(cost);
		player namespace_3d0867a6::function_18df83fb("point_out");
	}
}

/*
	Name: function_ce5b1a6f
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x1E50
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 449
*/
function function_ce5b1a6f(gambler)
{
	self endon("death");
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	self endon("spawned_player");
	self endon("death_or_disconnect");
	self.var_888f3d5f--;
	self.var_17075ee = 1;
	self function_52988a8d(gambler.objectiveId, "GAMBLER_RUN", "-1");
	self function_1d75ae6c();
	self thread function_d72a893c(gambler);
}

/*
	Name: function_1d75ae6c
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x1F28
	Size: 0x130
	Parameters: 3
	Flags: None
	Line Number: 474
*/
function function_1d75ae6c(time, sound, color)
{
	if(!isdefined(time))
	{
		time = 10;
	}
	if(!isdefined(sound))
	{
		sound = "elmg_mp_suitcase_pickup";
	}
	if(!isdefined(color))
	{
		color = 7;
	}
	if(isdefined(self) && isPlayer(self))
	{
		while(time)
		{
			self LUINotifyEvent(&"gambler_countdown", 2, time, color);
			self playlocalsound(sound);
			time--;
			wait(1);
		}
	}
	else
	{
		LUINotifyEvent(&"gambler_countdown", 2, time, color);
		playsoundatposition(sound, (0, 0, 0));
		time--;
		wait(1);
	}
	while(time)
	{
	}
}

/*
	Name: function_11bd1496
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x2060
	Size: 0x110
	Parameters: 5
	Flags: None
	Line Number: 520
*/
function function_11bd1496(var_344e1771, msg, forall, msg2, icon)
{
	if(!isdefined(var_344e1771))
	{
		var_344e1771 = " ";
	}
	if(!isdefined(msg))
	{
		msg = " ";
	}
	if(!isdefined(forall))
	{
		forall = 0;
	}
	if(!isdefined(msg2))
	{
		msg2 = " ";
	}
	if(!isdefined(icon))
	{
		icon = "gamblerabll";
	}
	if(forall)
	{
		level thread function_a667729f(msg, icon);
	}
	else
	{
		self thread function_a667729f(msg, icon);
	}
	iprintln(self.name, &"GAMBLER_GAMBLERD", var_344e1771);
	return;
	ERROR: Bad function call
}

/*
	Name: function_a667729f
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x2178
	Size: 0x100
	Parameters: 3
	Flags: None
	Line Number: 565
*/
function function_a667729f(msg, icon, desc)
{
	if(!isdefined(msg))
	{
		msg = " ";
	}
	if(!isdefined(icon))
	{
		icon = "blacktransparent";
	}
	if(!isdefined(desc))
	{
		desc = " ";
	}
	if(self == level)
	{
		util::setClientSysState("deadshot_keyline", "gamb," + icon + "~" + msg + "~" + desc);
	}
	else
	{
		util::setClientSysState("deadshot_keyline", "gamb," + icon + "~" + msg + "~" + desc, self);
	}
}

/*
	Name: function_96ca19e0
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x2280
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 599
*/
function function_96ca19e0(msg)
{
	if(!isdefined(msg))
	{
		msg = "";
	}
	self IPrintLnBold(msg);
	iprintln(msg);
}

/*
	Name: function_d72a893c
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x22E0
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 619
*/
function function_d72a893c(gambler)
{
	self notify("hash_d72a893c");
	self endon("hash_d72a893c");
	if(isdefined(level.var_7df5e788))
	{
		if(RandomInt(100) < 84)
		{
			self [[level.var_7df5e788[RandomInt(level.var_7df5e788.size)].func]]();
		}
		else
		{
			self [[level.var_7df5e788[0].func]]();
		}
	}
	if(isdefined(gambler))
	{
		if(self.var_888f3d5f > 0 && isdefined(self.var_888f3d5f))
		{
			if(isdefined(self.var_def06a03) && self.var_def06a03 >= 25)
			{
				self function_52988a8d(gambler.objectiveId, "^BBUTTON_COD_POINT_ICON^10", "-1");
			}
			else
			{
				self function_52988a8d(gambler.objectiveId, "^BBUTTON_COD_POINT_ICON^1000", "-1");
			}
		}
		else
		{
			self function_52988a8d(gambler.objectiveId, "GAMBLER_ONCE", "-1");
		}
	}
	self.var_17075ee = 0;
}

/*
	Name: function_c75d34c5
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x2488
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 665
*/
function function_c75d34c5(func)
{
	if(!isdefined(level.var_7df5e788))
	{
		level.var_7df5e788 = [];
	}
	if(isdefined(func))
	{
		struct = spawnstruct();
		struct.func = func;
		level.var_7df5e788[level.var_7df5e788.size] = struct;
	}
}

/*
	Name: function_6aff0624
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x2510
	Size: 0x270
	Parameters: 0
	Flags: None
	Line Number: 689
*/
function function_6aff0624()
{
	players = Array::randomize(level.activePlayers);
	foreach(player in players)
	{
		if(player laststand::player_is_in_laststand() && player != self)
		{
			target_player = player;
			continue;
		}
	}
	if(!isdefined(target_player))
	{
		foreach(player in players)
		{
			if(player != self)
			{
				target_player = player;
				continue;
			}
		}
	}
	else if(isdefined(target_player))
	{
		playsoundatposition("zmb_bgb_abh_teleport_out", self.origin);
		wait(0.1);
		self SetVelocity((0, 0, 0));
		self SetOrigin(target_player.origin);
		self show();
		self playsound("zmb_bgb_abh_teleport_in");
		playFX(level._effect["teleport_splash"], self.origin);
		playFX(level._effect["teleport_aoe"], self.origin);
		return target_player;
	}
	else
	{
		return self;
	}
}

/*
	Name: function_487b8d0b
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x2788
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 739
*/
function function_487b8d0b()
{
	self endon("disconnect");
	self endon("death");
	if(!isdefined(self.var_f5aae37e))
	{
		self.var_f5aae37e = 10000;
		self thread function_69f6a75f();
		while(self.var_f5aae37e >= 1)
		{
			wait(0.05);
			if(self zm_score::can_player_purchase(50) && self.sessionstate != "spectator")
			{
				self.var_f5aae37e = self.var_f5aae37e - 50;
				self zm_score::minus_to_player_score(50);
				self thread function_4d148ed0(50);
				if(isdefined(self.var_87ffa1cb))
				{
					self CloseLUIMenu(self.var_87ffa1cb);
				}
				self.var_87ffa1cb = self hud::function_1143b5c4("^5Money Leak^7\n       ^7" + self.var_f5aae37e + "/10000", 1, 250, 500, 1280, (1, 1, 1));
				wait(2.8);
			}
		}
		self notify("hash_a9d7be50");
		self function_11bd1496(&"ELMGT_GB_LEAKOVER", "ELMGT_GB_LEAKOVER");
		self playlocalsound("elmg_counter_uav_deactivate");
		self.var_f5aae37e = undefined;
		if(isdefined(self.var_87ffa1cb))
		{
			self CloseLUIMenu(self.var_87ffa1cb);
			self.var_87ffa1cb = undefined;
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_69f6a75f
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x2980
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 787
*/
function function_69f6a75f()
{
	self endon("disconnect");
	self endon("death");
	self endon("hash_a9d7be50");
	while(self.var_f5aae37e >= 1)
	{
		self waittill("damage");
		if(self zm_score::can_player_purchase(50) && self.sessionstate == "playing" && function_beceadbc())
		{
			if(self.var_f5aae37e >= 500)
			{
				self.var_f5aae37e = self.var_f5aae37e - 500;
			}
			self zm_score::minus_to_player_score(500);
			self thread function_4d148ed0(500);
		}
	}
}

/*
	Name: function_4d148ed0
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x2A68
	Size: 0x270
	Parameters: 1
	Flags: None
	Line Number: 817
*/
function function_4d148ed0(score)
{
	var_4d148ed0 = spawn("script_model", self GetEye() + VectorScale((0, 0, 1), 30));
	var_4d148ed0.angles = (RandomInt(180), RandomInt(180), RandomInt(180));
	var_4d148ed0 SetModel("zombie_z_money_icon");
	var_b216dd25 = spawn("trigger_radius", var_4d148ed0.origin, 0, 5, 5);
	var_b216dd25 setHintString("");
	var_b216dd25 setcursorhint("HINT_NOICON");
	var_b216dd25 SetMovingPlatformEnabled(1);
	var_b216dd25 EnableLinkTo();
	var_b216dd25.origin = var_4d148ed0.origin;
	var_b216dd25 LinkTo(var_4d148ed0);
	var_b216dd25 thread wait_for_pickup(var_4d148ed0, self, score);
	var_4d148ed0 physicslaunch(self GetEye() + VectorScale((0, 0, 1), 20), VectorScale((0, 0, 1), 20));
	var_4d148ed0 clientfield::set("powerup_fx", 4);
	var_4d148ed0 playsound("money_leak");
	var_4d148ed0 thread function_1ff9259d(var_b216dd25);
}

/*
	Name: function_1ff9259d
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x2CE0
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 846
*/
function function_1ff9259d(var_b5c3d03b)
{
	wait(60);
	if(isdefined(var_b5c3d03b))
	{
		var_b5c3d03b delete();
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: wait_for_pickup
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x2D40
	Size: 0x110
	Parameters: 3
	Flags: None
	Line Number: 869
*/
function wait_for_pickup(model, owner, score)
{
	self endon("death");
	for(;;)
	{
		self waittill("trigger", player);
		if(zm_utility::is_player_valid(player) && player != owner)
		{
			player namespace_3d0867a6::function_18df83fb("pickup");
			model playsound("money_leak_pickup");
			player.score = player.score + score;
			if(isdefined(model))
			{
				model delete();
			}
			if(isdefined(self))
			{
				self delete();
			}
		}
	}
}

/*
	Name: function_266595c9
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x2E58
	Size: 0x298
	Parameters: 0
	Flags: None
	Line Number: 902
*/
function function_266595c9()
{
	level notify("hash_95e6a111");
	level endon("hash_95e6a111");
	level endon("end_game");
	time = 120;
	while(time)
	{
		time--;
		foreach(player in GetPlayers())
		{
			player namespace_d87f1aa7::function_908a81cd("player_standingViewHeightâ¦41");
			if(isdefined(player.var_72064324))
			{
				player CloseLUIMenu(player.var_72064324);
				player.var_72064324 = undefined;
			}
			player.var_72064324 = player hud::function_1143b5c4("^5Dwarfs^7\n       ^7" + function_cec50efa(time), 1, 250, 550, 1280, (1, 1, 1));
		}
		wait(1);
	}
	foreach(player in level.activePlayers)
	{
		if(isdefined(player.var_72064324))
		{
			player CloseLUIMenu(player.var_72064324);
			player.var_72064324 = undefined;
		}
		player namespace_d87f1aa7::function_908a81cd("player_standingViewHeightâ¦60");
		player playlocalsound("zmb_vocals_zombie_death_whimsy");
		player thread function_a667729f("ELMGT_GB_DWARFOVER", "gamblerabll");
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_cec50efa
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x30F8
	Size: 0x1B0
	Parameters: 1
	Flags: None
	Line Number: 948
*/
function function_cec50efa(seconds)
{
	hours = 0;
	minutes = 0;
	if(seconds > 59)
	{
		minutes = Int(seconds / 60);
		seconds = Int(seconds * 1000) % 60000;
		seconds = seconds * 0.001;
		if(minutes > 59)
		{
			hours = Int(minutes / 60);
			minutes = Int(minutes * 1000) % 60000;
			minutes = minutes * 0.001;
		}
	}
	if(hours < 10)
	{
		hours = "0" + hours;
	}
	if(minutes < 10)
	{
		minutes = "0" + minutes;
	}
	seconds = Int(seconds);
	if(seconds < 10)
	{
		seconds = "0" + seconds;
	}
	combined = "" + minutes + ":" + seconds;
	return combined;
}

/*
	Name: function_e6981698
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x32B0
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 991
*/
function function_e6981698()
{
	level notify("hash_e6981698");
	level endon("hash_e6981698");
	wait(30);
	SetDvar("player_sustainAmmo", 0);
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] namespace_d87f1aa7::function_908a81cd("player_sustainAmmoâ¦0");
		players[i] playlocalsound("elmg_counter_uav_deactivate");
		players[i] thread function_a667729f("^2Fire suppression ends", "gamblerabll");
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8cf1101a
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x33B8
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1018
*/
function function_8cf1101a()
{
	level notify("hash_8cf1101a");
	level endon("hash_8cf1101a");
	wait(60);
	SetDvar("player_clipSizeMultiplier", 1);
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] namespace_d87f1aa7::function_908a81cd("player_clipSizeMultiplierâ¦1");
		if(i == 0)
		{
			players[0] thread zm_powerups::specific_powerup_drop("full_ammo", players[0].origin);
		}
	}
}

/*
	Name: function_cc5e608
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x34B0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1045
*/
function function_cc5e608()
{
	self notify("hash_cc5e608");
	self endon("hash_cc5e608");
	self endon("bled_out");
	self endon("player_revived");
	for(;;)
	{
		self.bleedout_time = 0;
		wait(0.048);
	}
}

/*
	Name: function_4afce14a
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x3508
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1068
*/
function function_4afce14a()
{
	self notify("hash_4afce14a");
	self endon("hash_4afce14a");
	self endon("disconnect");
	self endon("death");
	self namespace_d87f1aa7::function_908a81cd("elmg_skybox_rotateâ¦3");
	wait(66);
	self namespace_d87f1aa7::function_908a81cd("elmg_skybox_rotateâ¦0");
}

/*
	Name: function_c34649b8
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x3588
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1089
*/
function function_c34649b8()
{
	self notify("hash_c34649b8");
	self endon("hash_c34649b8");
	self endon("disconnect");
	self endon("death");
	self SetStance("prone");
	self namespace_d87f1aa7::function_908a81cd("cg_cameraRollOverrideâ¦90");
	wait(120);
	self playsoundtoplayer("zmb_bgb_eyecandy_" + RandomInt(4), self);
	self namespace_d87f1aa7::function_908a81cd("cg_cameraRollOverrideâ¦1");
	wait(1);
	self namespace_d87f1aa7::function_908a81cd("cg_cameraRollOverrideâ¦0");
}

/*
	Name: function_db8d44a6
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x3680
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 1114
*/
function function_db8d44a6()
{
	self notify("hash_db8d44a6");
	self endon("hash_db8d44a6");
	self endon("disconnect");
	self endon("death");
	self namespace_d87f1aa7::function_908a81cd("player_standingViewHeightâ¦41");
	time = 60;
	while(time)
	{
		time--;
		if(isdefined(self.var_72064324))
		{
			self CloseLUIMenu(self.var_72064324);
			self.var_72064324 = undefined;
		}
		self.var_72064324 = self hud::function_1143b5c4("^5Dwarfs^7\n       ^7" + time + "s", 1, 250, 550, 1280, (1, 1, 1));
		wait(1);
	}
	self playsoundtoplayer("zmb_vocals_zombie_death_whimsy", self);
	self namespace_d87f1aa7::function_908a81cd("player_standingViewHeightâ¦60");
	if(isdefined(self.var_72064324))
	{
		self CloseLUIMenu(self.var_72064324);
		self.var_72064324 = undefined;
	}
}

/*
	Name: function_9288c0b9
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x37F0
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 1152
*/
function function_9288c0b9()
{
	self notify("hash_9288c0b9");
	self endon("hash_9288c0b9");
	self endon("disconnect");
	self endon("death");
	self.var_494104fc = 23;
	self namespace_d87f1aa7::function_908a81cd("r_postFxIndexâ¦23");
	time = 60;
	while(time)
	{
		time--;
		if(isdefined(self.var_9288c0b9))
		{
			self CloseLUIMenu(self.var_9288c0b9);
			self.var_9288c0b9 = undefined;
		}
		self.var_9288c0b9 = self hud::function_1143b5c4("^5Pixel World^7\n       ^7" + time + "s", 1, 250, 450, 1280, (1, 1, 1));
		wait(1);
	}
	self function_11bd1496(&"ELMGT_GB_RW", "ELMGT_GB_RW", 0);
	self playsoundtoplayer("zmb_bgb_eyecandy_" + RandomInt(4), self);
	self namespace_d87f1aa7::function_908a81cd("r_postFxIndexâ¦-1");
	if(isdefined(self.var_9288c0b9))
	{
		self CloseLUIMenu(self.var_9288c0b9);
	}
	self.var_494104fc = undefined;
}

/*
	Name: function_36de84f4
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x39A8
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 1192
*/
function function_36de84f4()
{
	self endon("death");
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	self endon("spawned_player");
	self endon("death_or_disconnect");
	self endon("hash_908d0a8f");
	self thread function_908d0a8f();
	while(1)
	{
		foreach(weapon in self GetWeaponsList(1))
		{
			if(!self function_3e6ee6bf(weapon))
			{
				self SetWeaponAmmoClip(weapon, weapon.clipSize);
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_908d0a8f
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x3AF0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 1225
*/
function function_908d0a8f()
{
	self endon("death");
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	self endon("spawned_player");
	self endon("death_or_disconnect");
	self endon("hash_908d0a8f");
	wait(55);
	self function_1d75ae6c(5, "elmg_ui_mp_countdown", 5);
	self thread function_a667729f("GAMBLER_UNLIMIT2", "gamblerabll");
	self playlocalsound("elmg_counter_uav_deactivate");
	self notify("hash_908d0a8f");
}

/*
	Name: function_3e6ee6bf
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x3BD8
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 1251
*/
function function_3e6ee6bf(weapon)
{
	if(!isdefined(weapon))
	{
		weapon = self GetCurrentWeapon();
	}
	result = 0;
	foreach(weapon2 in self getweaponslistprimaries())
	{
		if(weapon2 == weapon)
		{
			result = 1;
		}
	}
	return result;
}

/*
	Name: function_a4124eb3
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x3CB8
	Size: 0x230
	Parameters: 0
	Flags: None
	Line Number: 1278
*/
function function_a4124eb3()
{
	wait(1);
	sec = 10;
	while(sec)
	{
		zombies = GetAITeamArray("axis");
		if(isdefined(zombies) && zombies.size > 0)
		{
			if(zombies.size == 1)
			{
				zombie = zombies[0];
			}
			else
			{
				zombie = zombies.size - 1;
				zombie = zombies[randomIntRange(0, zombie)];
			}
			if(isdefined(zombie) && isalive(zombie))
			{
				trace = bullettrace(zombie GetCentroid(), zombie.origin + VectorScale((0, 0, 1), 3000), 0, zombie, 1, 0);
				self function_a2d9c5b2(GetWeapon("launcher_standard_upgraded"), trace["position"], VectorScale((0, 0, -1), 5000));
				self function_a2d9c5b2(GetWeapon("launcher_standard_upgraded"), trace["position"], VectorScale((0, 0, -1), 5000));
				self function_a2d9c5b2(GetWeapon("launcher_standard_upgraded"), trace["position"], VectorScale((0, 0, -1), 5000));
			}
		}
		sec = sec - 1;
		wait(1);
	}
}

/*
	Name: function_62be5ec2
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x3EF0
	Size: 0xD0
	Parameters: 4
	Flags: None
	Line Number: 1319
*/
function function_62be5ec2(origin, weapon, time, delay)
{
	if(!isdefined(time))
	{
		time = 1;
	}
	if(!isdefined(delay))
	{
		delay = 0.5;
	}
	for(i = 0; i < time; i++)
	{
		self function_a2d9c5b2(weapon, origin, (randomIntRange(0, 200), randomIntRange(0, 200), -10000));
		wait(delay);
	}
}

/*
	Name: doAirstrike
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x3FC8
	Size: 0x1C0
	Parameters: 1
	Flags: None
	Line Number: 1346
*/
function doAirstrike(origin)
{
	switch(randomIntRange(0, 17))
	{
		case 0:
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
		{
			self thread function_62be5ec2(origin, GetWeapon("launcher_standard_upgraded"), 6);
			break;
		}
		case 6:
		case 7:
		case 8:
		case 9:
		case 10:
		case 11:
		{
			self thread function_62be5ec2(origin, GetWeapon("pistol_standard_upgraded"), 10, 0.2);
			break;
		}
		case 12:
		case 13:
		case 14:
		case 15:
		case 16:
		case 17:
		{
			self thread function_62be5ec2(origin, GetWeapon("ray_gun_upgraded"), 20, 0.1);
			break;
		}
		default
		{
			self thread function_62be5ec2(origin, GetWeapon("launcher_standard_upgraded"), 6);
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_73433683
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x4190
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 1399
*/
function function_73433683(origin)
{
	level endon("hash_abcf3ed0");
	model = spawn("script_model", origin);
	if(GetDvarString("aae_lite") == "")
	{
		model SetModel("gambler");
	}
	else
	{
		model SetModel("tag_origin");
	}
}

/*
	Name: function_3a83cf39
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x4240
	Size: 0x2D8
	Parameters: 0
	Flags: None
	Line Number: 1423
*/
function function_3a83cf39()
{
	pos = tableLookup("gamedata/tables/common/box_chance.csv", 24, GetDvarString("ui_mapname"), 28);
	if(isdefined(pos) && pos != "")
	{
		pos = StrTok(pos, "|");
		if(pos.size == 3)
		{
			return (float(pos[0]), float(pos[1]), float(pos[2]));
		}
	}
	pos = tableLookup("gamedata/tables/common/box_chance.csv", 24, level.script, 28);
	if(isdefined(pos) && pos != "")
	{
		pos = StrTok(pos, "|");
		if(pos.size == 3)
		{
			return (float(pos[0]), float(pos[1]), float(pos[2]));
		}
	}
	origin = (0, 0, 0);
	points = struct::get_array("initial_spawn", "script_noteworthy");
	if(!isdefined(points) || points.size == 0)
	{
		points = struct::get_array("initial_spawn_points", "targetname");
	}
	if(!isdefined(points) || points.size == 0)
	{
		points = GetEntArray("info_player_start", "classname");
	}
	if(isdefined(points[3]))
	{
		return points[3].origin;
	}
	if(!isdefined(origin) && isdefined(points[0]))
	{
		return points[0].origin + (10, 0, 20);
	}
	return origin;
}

/*
	Name: function_3002607b
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x4520
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 1474
*/
function function_3002607b()
{
	switch(level.script)
	{
		case "zm_asylum":
		case "zm_factory":
		case "zm_sumpf":
		case "zm_zod":
		{
			return GetWeapon("tesla_gun_upgraded");
			break;
		}
		case "zm_castle":
		{
			return GetWeapon("ray_gun_upgraded");
			break;
		}
		case "zm_island":
		{
			return GetWeapon("hero_mirg2000_upgraded");
			break;
		}
		case "zm_stalingrad":
		{
			return GetWeapon("raygun_mark3_upgraded");
			break;
		}
		case "zm_moon":
		{
			return GetWeapon("microwavegundw_upgraded");
			break;
		}
		case "zm_temple":
		{
			return GetWeapon("shrink_ray_upgraded");
			break;
		}
		case "zm_tomb":
		{
			return GetWeapon("raygun_mark2_upgraded");
			break;
		}
		default
		{
			return GetWeapon("thundergun_upgraded");
			break;
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_721cd569
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x4698
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1536
*/
function function_721cd569()
{
	players = [];
	foreach(player in GetPlayers())
	{
		if(player.sessionstate != "spectator")
		{
			players[players.size] = player;
		}
	}
	return players;
}

/*
	Name: function_fef85813
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x4760
	Size: 0x290
	Parameters: 0
	Flags: None
	Line Number: 1559
*/
function function_fef85813()
{
	if(zm_utility::is_player_valid(self, 0, 1) && !isdefined(self.var_5af67acf))
	{
		if(!self hasPerk("specialty_armorvest"))
		{
			self zm_perks::give_perk("specialty_armorvest", 0);
		}
		if(!self hasPerk("specialty_staminup"))
		{
			self zm_perks::give_perk("specialty_staminup", 0);
		}
		if(self laststand::player_is_in_laststand())
		{
			self zm_laststand::auto_revive(level, 0);
		}
		playsoundatposition("elmg_flag_spawned", (0, 0, 0));
		players = level.activePlayers;
		players = Array::randomize(players);
		self.var_5af67acf = 1;
		rider = self;
		foreach(player in players)
		{
			if(!isdefined(player.var_49afbfe1) && player != self)
			{
				if(player laststand::player_is_in_laststand())
				{
					player zm_laststand::auto_revive(level, 0);
				}
				player zm_utility::function_ea3a8353();
				player.var_49afbfe1 = 1;
				player playerLinkTo(rider, "torso_stabilizer", 0, 180, 180, 180, 180, 1);
				rider = player;
			}
		}
		self thread function_d0f4f497();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d0f4f497
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x49F8
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 1610
*/
function function_d0f4f497()
{
	self util::waittill_any_timeout(60, "bled_out", "player_downed", "disconnect", "death");
	foreach(player in GetPlayers())
	{
		if(isdefined(player.var_49afbfe1))
		{
			player Unlink();
			player.var_49afbfe1 = undefined;
			player zm_utility::function_adb1601b();
			if(isdefined(self))
			{
				player SetOrigin(self.origin);
			}
		}
	}
	if(isdefined(self))
	{
		self function_11bd1496("^5Human Tower Over", "^5Human Tower Over", 1);
		self.var_5af67acf = undefined;
	}
}

/*
	Name: function_3d5632ca
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x4B68
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1643
*/
function function_3d5632ca()
{
	self notify("hash_3d5632ca");
	self endon("hash_3d5632ca");
	self endon("bled_out");
	self endon("disconnect");
	self endon("death");
	self endon("hash_ee62c4f3");
	for(;;)
	{
		self util::setClientSysState("deadshot_keyline", "b,1", self);
		wait(0.9);
	}
}

/*
	Name: function_5471f2a
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x4BF0
	Size: 0x258
	Parameters: 0
	Flags: None
	Line Number: 1668
*/
function function_5471f2a()
{
	self notify("hash_ee62c4f3");
	self endon("bled_out");
	self endon("disconnect");
	self endon("death");
	self endon("hash_ee62c4f3");
	self thread function_175a0ef7();
	self thread function_3d5632ca();
	self setPerk("specialty_locdamagecountsasheadshot");
	for(;;)
	{
		self waittill("weapon_fired");
		zombies = self function_8c0b52b();
		if(zombies.size != 0)
		{
			var_3c30664e = self CantSeeEntities(zombies, cos(75), 0);
			foreach(ai in var_3c30664e)
			{
				ArrayRemoveValue(zombies, ai);
			}
			if(zombies.size != 0 && self GetCurrentWeapon().inventoryType == "primary")
			{
				zombie = ArrayGetClosest(self.origin, zombies);
				MagicBullet(self GetCurrentWeapon(), self GetTagOrigin("tag_flash"), zombie GetTagOrigin("j_head"), self);
				waittillframeend;
			}
		}
	}
}

/*
	Name: function_175a0ef7
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x4E50
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1709
*/
function function_175a0ef7()
{
	self endon("disconnect");
	self endon("death");
	self util::waittill_any_timeout(150, "bled_out");
	if(!self bgb::is_enabled("zm_bgb_head_drama"))
	{
		self unsetPerk("specialty_locdamagecountsasheadshot");
	}
	self notify("hash_ee62c4f3");
	self function_11bd1496("^5Smart Core Offline", "^5Smart Core Offline");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8c0b52b
	Namespace: namespace_82ce4a91
	Checksum: 0x424F4353
	Offset: 0x4F08
	Size: 0x17A
	Parameters: 0
	Flags: None
	Line Number: 1734
*/
function function_8c0b52b()
{
	ai = [];
	allai = GetAIArray();
	if(allai.size == 0)
	{
		return ai;
	}
	var_bd6badee = 1440000;
	foreach(NPC in allai)
	{
		if(isalive(NPC) && NPC.team == level.zombie_team && !NPC ishidden())
		{
			if(Distance2DSquared(NPC.origin, self.origin) >= var_bd6badee || (isdefined(NPC.aat_turned) && NPC.aat_turned))
			{
				continue;
			}
			ai[ai.size] = NPC;
		}
	}
	return ai;
}

