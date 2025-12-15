#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\sound_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_f56b53f0;

/*
	Name: init
	Namespace: namespace_f56b53f0
	Checksum: 0x94E3C41D
	Offset: 0x798
	Size: 0x88
	Parameters: 0
	Flags: AutoExec
	Line Number: 38
*/
function autoexec init()
{
	callback::on_connect(&function_82842955);
	level.var_45759efd = 0;
	level.var_d139cc74 = 1;
	level waittill("all_players_connected");
	wait(5);
	thread function_b30bb5d1();
	thread slowdown();
	thread function_533df5f9();
}

/*
	Name: function_82842955
	Namespace: namespace_f56b53f0
	Checksum: 0x6D5B1B8
	Offset: 0x828
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function function_82842955()
{
	self thread function_66c9c73f();
}

/*
	Name: function_b30bb5d1
	Namespace: namespace_f56b53f0
	Checksum: 0x49600B3C
	Offset: 0x850
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function function_b30bb5d1()
{
	modvar("fast_restart", "Use ^3/map_restart ^7instead.");
	SetDvar("fast_restart", "Use ^3/map_restart ^7instead.");
	thread function_724381b0();
	thread function_70628d51();
	thread function_4a6dbbcd();
}

/*
	Name: function_724381b0
	Namespace: namespace_f56b53f0
	Checksum: 0xC0B0928C
	Offset: 0x8D0
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function function_724381b0()
{
	modvar("devprints", "-1");
	SetDvar("devprints", -1);
	while(1)
	{
		if(GetDvarInt("devprints") != -1)
		{
			if(GetDvarInt("devprints") == 0)
			{
				IPrintLnBold("[^3Disabling Devprints^7]");
				level.var_7e622d79 = 0;
				SetDvar("devprints", -1);
				continue;
			}
			IPrintLnBold("[^3Enabling Devprints^7]");
			level.var_7e622d79 = 1;
			SetDvar("devprints", -1);
		}
		wait(0.1);
	}
}

/*
	Name: function_4a6dbbcd
	Namespace: namespace_f56b53f0
	Checksum: 0xD747ABCD
	Offset: 0x9F8
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 127
*/
function function_4a6dbbcd()
{
	level thread function_244fb1db();
	modvar("roundpause_enable", "-1");
	SetDvar("roundpause_enable", -1);
	while(1)
	{
		if(GetDvarInt("roundpause_enable") != -1)
		{
			if(GetDvarInt("roundpause_enable") == 0)
			{
				IPrintLnBold("[^3Disabling Round Pauses^7]");
				level.var_4279487d = 0;
				SetDvar("roundpause_enable", -1);
				continue;
			}
			IPrintLnBold("[^3Enabling Round Pauses^7]");
			level.var_4279487d = 1;
			SetDvar("roundpause_enable", -1);
		}
		wait(0.1);
	}
}

/*
	Name: function_244fb1db
	Namespace: namespace_f56b53f0
	Checksum: 0xEB65A563
	Offset: 0xB38
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 161
*/
function function_244fb1db()
{
	modvar("roundpause_skip", "-1");
	SetDvar("roundpause_skip", -1);
	while(1)
	{
		if(GetDvarInt("roundpause_skip") != -1)
		{
			IPrintLnBold("[^3Round Pause Skipped^7]");
			level notify("hash_caea17bb");
			SetDvar("roundpause_skip", -1);
		}
		wait(0.1);
	}
}

/*
	Name: function_316c7941
	Namespace: namespace_f56b53f0
	Checksum: 0xFF466A0D
	Offset: 0xBF8
	Size: 0x1A8
	Parameters: 2
	Flags: None
	Line Number: 187
*/
function function_316c7941(name, version)
{
	modvar("version", "^5" + name + " (^7Version: ^3" + version + "^5)");
	SetDvar("version", "^5" + name + " (^7Version: ^3" + version + "^5)");
	wait(10);
	modvar("version", "^5" + name + " (^7Version: ^3" + version + "^5)");
	SetDvar("version", "^5" + name + " (^7Version: ^3" + version + "^5)");
	while(1)
	{
		if(GetDvarInt("version") != 0)
		{
			IPrintLnBold("^5Version: ^3" + version);
			SetDvar("version", "^5" + name + " (^7Version: ^3" + version + "^5)");
		}
		wait(0.1);
	}
}

/*
	Name: function_dbe7e78b
	Namespace: namespace_f56b53f0
	Checksum: 0x461E44A7
	Offset: 0xDA8
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 215
*/
function function_dbe7e78b(VAL, bold)
{
	if(!isdefined(VAL))
	{
		VAL = "Empty";
	}
	if(!isdefined(bold))
	{
		bold = 1;
	}
	if(isdefined(level.var_d4d38dac) && level.var_d4d38dac && (isdefined(level.var_d139cc74) && level.var_d139cc74) && (isdefined(level.var_7e622d79) && level.var_7e622d79))
	{
		if(isdefined(bold) && bold)
		{
			IPrintLnBold(VAL);
			continue;
		}
		iprintln(VAL);
	}
}

/*
	Name: function_dc398f1f
	Namespace: namespace_f56b53f0
	Checksum: 0x3258705C
	Offset: 0xE78
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 246
*/
function function_dc398f1f(state)
{
	wait(1);
	if(isdefined(state) && state)
	{
		level.var_f569a524 = 1;
		wait(0.05);
		level flag::set("power_on");
		wait(0.05);
		util::clientNotify("ZPO");
		if(!isdefined(level.var_571f49fd))
		{
			level.var_571f49fd = 3;
		}
		level flag::wait_till("initial_blackscreen_passed");
		wait(0.5);
		level util::set_lighting_state(level.var_571f49fd);
		continue;
	}
	thread function_dbe7e78b("Power Off");
}

/*
	Name: oneshot
	Namespace: namespace_f56b53f0
	Checksum: 0xBF848763
	Offset: 0xF78
	Size: 0x130
	Parameters: 4
	Flags: None
	Line Number: 278
*/
function oneshot(FX, time, loc, angles)
{
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	var_960d2e99 = util::spawn_model("tag_origin", loc, angles);
	for(attempts = 0; !isdefined(var_960d2e99) && attempts < 5; attempts++)
	{
		var_960d2e99 = util::spawn_model("tag_origin", loc, angles);
		wait(0.05);
	}
	n_fx = PlayFXOnTag(FX, var_960d2e99, "tag_origin");
	wait(time);
	var_960d2e99 delete();
	n_fx delete();
}

/*
	Name: loopFX
	Namespace: namespace_f56b53f0
	Checksum: 0x37F706A9
	Offset: 0x10B0
	Size: 0xE8
	Parameters: 2
	Flags: None
	Line Number: 306
*/
function loopFX(FX, loc)
{
	var_960d2e99 = util::spawn_model("tag_origin", loc, self.angles);
	while(!isdefined(var_960d2e99))
	{
		var_960d2e99 = util::spawn_model("tag_origin", loc, self.angles);
		wait(0.05);
	}
	n_fx = PlayFXOnTag(FX, var_960d2e99, "tag_origin");
	return var_960d2e99;
	while(isdefined(var_960d2e99))
	{
		wait(0.15);
	}
	n_fx delete();
}

/*
	Name: delay
	Namespace: namespace_f56b53f0
	Checksum: 0x231330AE
	Offset: 0x11A0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 333
*/
function delay()
{
	wait(0.05);
	if(level.round_number > 8)
	{
		wait(0.05);
	}
	if(level.round_number > 16)
	{
		wait(0.05);
	}
	if(level.round_number > 32)
	{
		wait(0.05);
		return;
	}
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_83973ee
	Namespace: namespace_f56b53f0
	Checksum: 0xBDE2DA9C
	Offset: 0x1200
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 363
*/
function function_83973ee()
{
	triggers = GetEntArray("ammo_crate", "targetname");
	foreach(trigger in triggers)
	{
		trigger thread function_a35a864c();
	}
	return;
	wait(triggers);
}

/*
	Name: function_a35a864c
	Namespace: namespace_f56b53f0
	Checksum: 0x4A8728BF
	Offset: 0x12C0
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 384
*/
function function_a35a864c()
{
	model = GetEnt(self.target, "targetname");
	loc = model.origin;
	time = 2;
	FX = "vk_fx/zm/_vk_zm_ammocrate_recieve";
	sound = "ammo_crate";
	self setHintString("Hold ^3[{+activate}]^7 to use ammo crate");
	self setcursorhint("HINT_NOICON");
	self waittill("trigger", player);
	model delete();
	self delete();
	weapon = player GetCurrentWeapon();
	player giveMaxAmmo(weapon);
	player playlocalsound(sound);
	thread oneshot(FX, time, loc);
}

/*
	Name: ignored
	Namespace: namespace_f56b53f0
	Checksum: 0x3E785084
	Offset: 0x1450
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 412
*/
function ignored(time)
{
	foreach(player in GetPlayers())
	{
		player zm_utility::increment_ignoreme();
	}
	wait(time);
	foreach(player in GetPlayers())
	{
		player zm_utility::decrement_ignoreme();
	}
}

/*
	Name: slowdown
	Namespace: namespace_f56b53f0
	Checksum: 0x3FAC6F37
	Offset: 0x1588
	Size: 0x2A8
	Parameters: 0
	Flags: None
	Line Number: 435
*/
function slowdown()
{
	triggers = GetEntArray("slowdown_trigger", "targetname");
	while(1)
	{
		foreach(player in GetPlayers())
		{
			player.var_80d478c2 = 0;
		}
		wait(0.1);
		foreach(trig in triggers)
		{
			foreach(player in GetPlayers())
			{
				if(player istouching(trig))
				{
					player.var_80d478c2 = 1;
				}
			}
		}
		foreach(player in GetPlayers())
		{
			if(isdefined(player.var_80d478c2) && player.var_80d478c2)
			{
				player.var_d0ca6f48 = 1;
				continue;
			}
			player.var_d0ca6f48 = 0;
		}
	}
}

/*
	Name: function_ec06f6d5
	Namespace: namespace_f56b53f0
	Checksum: 0xF60DD55B
	Offset: 0x1838
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 477
*/
function function_ec06f6d5()
{
	while(1)
	{
		wait(0.05);
		foreach(player in GetPlayers())
		{
			if(player istouching(self))
			{
				player.var_d0ca6f48 = 1;
				continue;
			}
			player.var_d0ca6f48 = 0;
		}
	}
}

/*
	Name: function_cb339fa7
	Namespace: namespace_f56b53f0
	Checksum: 0x3BA0EEC7
	Offset: 0x1910
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 504
*/
function function_cb339fa7()
{
	while(1)
	{
		self waittill("trigger", player);
		self thread trigger::function_thread(player, &function_609c817e, &function_6160d294);
	}
}

/*
	Name: function_609c817e
	Namespace: namespace_f56b53f0
	Checksum: 0x23C23FE4
	Offset: 0x1978
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 523
*/
function function_609c817e(player, endon_string)
{
	player endon("death");
	player endon("disconnect");
	player endon(endon_string);
	if(isdefined(player) && !laststand::player_is_in_laststand())
	{
		player setMoveSpeedScale(player getMoveSpeedScale() - 0.4);
		player.var_3e62943e = 1;
		player allowslide(0);
		player AllowSprint(1);
		player AllowJump(1);
		player allowprone(0);
	}
}

/*
	Name: function_6160d294
	Namespace: namespace_f56b53f0
	Checksum: 0x5F3C1586
	Offset: 0x1A90
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 549
*/
function function_6160d294(player)
{
	player endon("death");
	player endon("disconnect");
	if(isdefined(player) && !laststand::player_is_in_laststand())
	{
		player setMoveSpeedScale(player getMoveSpeedScale() + 0.4);
		player.var_3e62943e = 0;
		player AllowJump(1);
		player AllowSprint(1);
		player allowprone(1);
		player allowslide(1);
	}
}

/*
	Name: function_533df5f9
	Namespace: namespace_f56b53f0
	Checksum: 0x6554362F
	Offset: 0x1B90
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 574
*/
function function_533df5f9()
{
	modvar("vk_screenshots", "0");
	SetDvar("vk_screenshots", 0);
	while(1)
	{
		if(GetDvarInt("vk_screenshots") != 0)
		{
			if(isdefined(level.var_d4d38dac) && level.var_d4d38dac)
			{
				thread function_70eff3eb();
			}
			SetDvar("vk_screenshots", 0);
		}
		wait(0.15);
	}
}

/*
	Name: function_70eff3eb
	Namespace: namespace_f56b53f0
	Checksum: 0xA2B5D5D2
	Offset: 0x1C48
	Size: 0x688
	Parameters: 0
	Flags: None
	Line Number: 602
*/
function function_70eff3eb()
{
	locs = struct::get_array("p_screenshots");
	foreach(player in GetPlayers())
	{
		if(player getXuid(1) == level.var_e54e578c)
		{
			var_81e03bee = player;
		}
	}
	level.player_out_of_playable_area_monitor = 0;
	level.var_d139cc74 = 0;
	var_81e03bee zm_utility::increment_ignoreme();
	SetDvar("developer", 0);
	SetDvar("ai_disableSpawn", 1);
	foreach(zombie in zombie_utility::get_round_enemy_array())
	{
		zombie kill();
	}
	wait(0.05);
	var_e86f88b5 = player.origin;
	var_68b3565f = player.angles;
	var_81e03bee EnableInvulnerability();
	var_81e03bee SetPlayerCollision(0);
	var_81e03bee FreezeControls(1);
	var_81e03bee setClientUIVisibilityFlag("hud_visible", 0);
	var_81e03bee setClientUIVisibilityFlag("weapon_hud_visible", 0);
	var_81e03bee DisableWeapons();
	var_81e03bee AllowMelee(0);
	var_81e03bee AllowAds(0);
	var_81e03bee disableOffhandWeapons();
	var_81e03bee DisableWeaponCycling();
	var_81e03bee Hide();
	wait(0.5);
	foreach(loc in locs)
	{
		pos = util::spawn_model("tag_origin", loc.origin + VectorScale((0, 0, -1), 60), loc.angles);
		wait(0.05);
		var_81e03bee SetOrigin(pos.origin);
		var_81e03bee SetPlayerAngles(pos.angles);
		var_81e03bee LinkTo(pos);
		wait(0.05);
		var_81e03bee SetOrigin(pos.origin);
		var_81e03bee SetPlayerAngles(pos.angles);
		wait(6);
		var_81e03bee Unlink();
		wait(0.05);
		pos delete();
	}
	wait(0.1);
	var_81e03bee SetOrigin(var_e86f88b5);
	var_81e03bee SetPlayerAngles(var_68b3565f);
	var_81e03bee DisableInvulnerability();
	var_81e03bee setClientUIVisibilityFlag("hud_visible", 1);
	var_81e03bee setClientUIVisibilityFlag("weapon_hud_visible", 1);
	var_81e03bee enableWeapons();
	var_81e03bee AllowMelee(1);
	var_81e03bee AllowAds(1);
	var_81e03bee EnableOffhandWeapons();
	var_81e03bee EnableWeaponCycling();
	var_81e03bee FreezeControls(0);
	var_81e03bee show();
	wait(0.05);
	level.player_out_of_playable_area_monitor = 1;
	level.var_d139cc74 = 1;
	var_81e03bee zm_utility::decrement_ignoreme();
	SetDvar("developer", 2);
	SetDvar("ai_disableSpawn", 0);
}

/*
	Name: function_1b5937fb
	Namespace: namespace_f56b53f0
	Checksum: 0x1242FC91
	Offset: 0x22D8
	Size: 0x350
	Parameters: 3
	Flags: None
	Line Number: 682
*/
function function_1b5937fb(player, var_dbe7e78b, var_767132d1)
{
	if(!isdefined(var_dbe7e78b))
	{
		var_dbe7e78b = 0;
	}
	if(!isdefined(var_767132d1))
	{
		var_767132d1 = 1;
	}
	state = 1;
	current_weapon = player GetCurrentWeapon();
	if(!zm_utility::is_player_valid(player))
	{
		state = 0;
		function_30644fff(var_dbe7e78b, "Invalid Player");
	}
	if(player IsSliding())
	{
		state = 0;
		function_30644fff(var_dbe7e78b, "Sliding");
	}
	if(player.IS_DRINKING > 0)
	{
		state = 0;
		function_30644fff(var_dbe7e78b, "Drinking Perk");
	}
	if(zm_utility::is_placeable_mine(current_weapon))
	{
		state = 0;
		function_30644fff(var_dbe7e78b, "Placable Mine");
	}
	if(zm_equipment::is_equipment(current_weapon))
	{
		state = 0;
		function_30644fff(var_dbe7e78b, "Equipment");
	}
	if(player zm_utility::is_player_revive_tool(current_weapon))
	{
		state = 0;
		function_30644fff(var_dbe7e78b, "Revive Tool");
	}
	if(player IsSwitchingWeapons())
	{
		state = 0;
		function_30644fff(var_dbe7e78b, "Switching Weapons");
	}
	if(player IsThrowingGrenade())
	{
		state = 0;
		function_30644fff(var_dbe7e78b, "Throwing Grenade");
	}
	if(player IsReloading() && !var_767132d1)
	{
		state = 0;
		function_30644fff(var_dbe7e78b, "Reloading");
	}
	if(current_weapon == level.zombie_powerup_weapon["minigun"])
	{
		state = 0;
		function_30644fff(var_dbe7e78b, "Minigun");
	}
	if(player laststand::player_is_in_laststand())
	{
		state = 0;
		function_30644fff(var_dbe7e78b, "Downed");
	}
	function_30644fff(var_dbe7e78b, state);
	return state;
}

/*
	Name: function_30644fff
	Namespace: namespace_f56b53f0
	Checksum: 0xE9446FFC
	Offset: 0x2630
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 763
*/
function function_30644fff(bool, string)
{
	if(!isdefined(bool))
	{
		bool = 0;
	}
	if(!isdefined(string))
	{
		string = "";
	}
	if(bool)
	{
		IPrintLnBold("^3Trig Use Check: ^6" + string);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: clamp
	Namespace: namespace_f56b53f0
	Checksum: 0x7DBD41F4
	Offset: 0x26A0
	Size: 0xF8
	Parameters: 4
	Flags: None
	Line Number: 791
*/
function clamp(value, min, max, rounding)
{
	if(!isdefined(value))
	{
		value = 1;
	}
	if(!isdefined(min))
	{
		min = 0;
	}
	if(!isdefined(max))
	{
		max = 1000;
	}
	if(!isdefined(rounding))
	{
		rounding = "false";
	}
	if(value < min)
	{
		value = min;
	}
	if(value > max)
	{
		value = max;
	}
	if(rounding == "floor")
	{
		floor(value);
	}
	if(rounding == "ceil")
	{
		ceil(value);
	}
	return value;
}

/*
	Name: function_ea19e0af
	Namespace: namespace_f56b53f0
	Checksum: 0xFB01A8E
	Offset: 0x27A0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 838
*/
function function_ea19e0af()
{
	var_c552cee = randomIntRange(0, 100);
	if(var_c552cee < 50)
	{
		bool = 1;
		continue;
	}
	bool = 0;
	return bool;
}

/*
	Name: function_66c9c73f
	Namespace: namespace_f56b53f0
	Checksum: 0xF52A329
	Offset: 0x2800
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 860
*/
function function_66c9c73f()
{
	wait(15);
	self.var_d0ca6f48 = 0;
	self.var_3a324238 = 0;
	self.var_5176180b = 0;
	self.var_ada1f46a = 0;
	while(1)
	{
		wait(0.1);
		speed_scale = 1;
		if(isdefined(self.var_d0ca6f48) && self.var_d0ca6f48)
		{
			speed_scale = speed_scale - 0.3;
			if(isdefined(self.var_ada1f46a) && self.var_ada1f46a)
			{
				speed_scale = speed_scale * 1.12;
			}
		}
		if(isdefined(self.var_3a324238) && self.var_3a324238)
		{
			speed_scale = speed_scale + 0.5;
		}
		if(isdefined(self.var_5176180b) && self.var_5176180b)
		{
			speed_scale = speed_scale * 0.5;
		}
		if(isdefined(self.var_ada1f46a) && self.var_ada1f46a)
		{
			speed_scale = speed_scale * 1.03;
		}
		self function_fa4aae9f(self.var_d0ca6f48);
		self setMoveSpeedScale(speed_scale);
	}
}

/*
	Name: function_fa4aae9f
	Namespace: namespace_f56b53f0
	Checksum: 0x2CA05C8E
	Offset: 0x2978
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 906
*/
function function_fa4aae9f(bool)
{
	self endon("death");
	self endon("disconnect");
	if(!(isdefined(self.var_60e306f4) && self.var_60e306f4))
	{
		if(isdefined(bool) && bool && !self laststand::player_is_in_laststand() && isdefined(self))
		{
			self allowslide(0);
			self allowprone(0);
			continue;
		}
		self allowslide(1);
		self allowprone(1);
	}
}

/*
	Name: FX
	Namespace: namespace_f56b53f0
	Checksum: 0x2A34BD7D
	Offset: 0x2A58
	Size: 0x498
	Parameters: 7
	Flags: None
	Line Number: 933
*/
function FX(effect, var_5c4511, crucial, timeout, debug, loc, rot)
{
	if(!isdefined(effect))
	{
		effect = "";
	}
	if(!isdefined(var_5c4511))
	{
		var_5c4511 = "";
	}
	if(!isdefined(crucial))
	{
		crucial = 0;
	}
	if(!isdefined(timeout))
	{
		timeout = 0;
	}
	if(!isdefined(debug))
	{
		debug = 0;
	}
	if(!isdefined(loc))
	{
		loc = (0, 0, 0);
	}
	if(!isdefined(rot))
	{
		rot = (0, 0, 0);
	}
	if(debug)
	{
		thread function_dbe7e78b("Spawning FX: '^3" + effect + "^7' at '^3" + loc + "^7' (^3" + rot + "^7) | Crucial: '^2" + crucial + "^7' | Timeout: '^2" + timeout + "^7'");
	}
	if(!var_5c4511 == "" || !isdefined(var_5c4511))
	{
		STR = struct::get(var_5c4511, "targetname");
		if(isdefined(STR))
		{
			loc = STR.origin;
			rot = STR.angles;
		}
		else if(debug)
		{
			thread function_dbe7e78b("^1[X]^3 FX Failed '^7" + effect + "^3' (Can't find Struct: '^7" + var_5c4511 + "^3' ^1[X]");
		}
	}
	if(crucial)
	{
		attempts = 0;
		var_22c19c08 = undefined;
		var_ee752f19 = undefined;
		while(!isdefined(var_22c19c08) || !isdefined(var_ee752f19) && attempts < 9)
		{
			if(!isdefined(var_22c19c08))
			{
				var_22c19c08 = util::spawn_model("tag_origin", loc, rot);
			}
			if(!isdefined(var_ee752f19))
			{
				var_ee752f19 = PlayFXOnTag(effect, var_22c19c08, "tag_origin");
			}
			attempts++;
			wait(0.05);
		}
		continue;
	}
	var_22c19c08 = util::spawn_model("tag_origin", loc, rot);
	var_ee752f19 = PlayFXOnTag(effect, var_22c19c08, "tag_origin");
	if(!isdefined(var_22c19c08) || !isdefined(var_ee752f19))
	{
		if(debug)
		{
			thread function_dbe7e78b("^1[X]^3 FX Failed '^7" + effect + "^3' ^1[X]");
		}
		var_ee752f19 delete();
		var_22c19c08 delete();
		return undefined;
	}
	else if(timeout > 0)
	{
		return undefined;
		wait(timeout);
		var_ee752f19 delete();
		var_22c19c08 delete();
		if(debug)
		{
			thread function_dbe7e78b("Deleting effect: '^3" + effect + "^7' (^5Timed Out^7)");
			continue;
		}
	}
	return var_22c19c08;
	var_22c19c08 waittill("hash_784ac7d2");
	var_ee752f19 delete();
	var_22c19c08 delete();
	if(debug)
	{
		thread function_dbe7e78b("Deleting effect: '^3" + effect + "^7' (^5Kill Notified^7)");
	}
}

/*
	Name: function_70628d51
	Namespace: namespace_f56b53f0
	Checksum: 0x8B04106F
	Offset: 0x2EF8
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 1044
*/
function function_70628d51()
{
	// Could not fully decompile function; skipped
}

/*
	Name: function_1e0087c4
	Namespace: namespace_f56b53f0
	Checksum: 0x35C68E6E
	Offset: 0x30F0
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 1059
*/
function function_1e0087c4(var_ad818af9)
{
	if(isdefined(level.AAT[var_ad818af9].immune_result_indirect[self.archetype]) && level.AAT[var_ad818af9].immune_result_indirect[self.archetype])
	{
		return 0;
	}
	if(!isdefined(self) || !isalive(self))
	{
		return 0;
	}
	if(isdefined(self.barricade_enter) && self.barricade_enter)
	{
		return 0;
	}
	if(isdefined(self.is_traversing) && self.is_traversing)
	{
		return 0;
	}
	if(!(isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area))
	{
		return 0;
	}
	if(isdefined(self.is_leaping) && self.is_leaping)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_de45d812
	Namespace: namespace_f56b53f0
	Checksum: 0x43F31BE2
	Offset: 0x31F0
	Size: 0x168
	Parameters: 4
	Flags: None
	Line Number: 1098
*/
function function_de45d812(FX, loc, timeout, rot)
{
	if(!isdefined(timeout))
	{
		timeout = 30;
	}
	if(!isdefined(rot))
	{
		rot = VectorScale((1, 0, 0), 270);
	}
	var_f0acca4b = util::spawn_model("tag_origin", loc, rot);
	wait(0.05);
	var_da690608 = PlayFXOnTag(FX, var_f0acca4b, "tag_origin");
	level.var_45759efd++;
	function_dbe7e78b("^6[^2" + level.var_45759efd + "^6] ^7Spawn Effect '^5" + FX + "^7' at position '^3" + loc + "^7' ^1Model: " + isdefined(var_f0acca4b) + " FX: " + isdefined(var_da690608), 0);
	wait(timeout);
	var_da690608 delete();
	wait(0.05);
	var_f0acca4b delete();
}

/*
	Name: function_ac0e82f7
	Namespace: namespace_f56b53f0
	Checksum: 0x203D77DE
	Offset: 0x3360
	Size: 0x198
	Parameters: 4
	Flags: None
	Line Number: 1129
*/
function function_ac0e82f7(FX, ent, tag, timeout)
{
	if(!isdefined(tag))
	{
		tag = "tag_origin";
	}
	if(!isdefined(timeout))
	{
		timeout = 30;
	}
	var_f0acca4b = util::spawn_model("tag_origin", ent.origin, ent.angles);
	var_f0acca4b LinkTo(ent);
	wait(0.05);
	var_da690608 = PlayFXOnTag(FX, var_f0acca4b, "tag_origin");
	level.var_45759efd++;
	function_dbe7e78b("^6[^2" + level.var_45759efd + "^6] ^7Spawn Effect '^5" + FX + "^7' at position '^3" + ent.origin + "^7' ^1Model: " + isdefined(var_f0acca4b) + " FX: " + isdefined(var_da690608), 0);
	wait(timeout);
	var_da690608 delete();
	wait(0.05);
	var_f0acca4b delete();
}

/*
	Name: function_324dc206
	Namespace: namespace_f56b53f0
	Checksum: 0xA69C198
	Offset: 0x3500
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 1161
*/
function function_324dc206(sound)
{
}

/*
	Name: function_44c594d1
	Namespace: namespace_f56b53f0
	Checksum: 0xF9D9B482
	Offset: 0x3518
	Size: 0x164
	Parameters: 0
	Flags: None
	Line Number: 1175
*/
function function_44c594d1()
{
	SetDvar("r_exposureTweak", 1);
	var_cb497214 = GetDvarFloat("r_exposureValue");
	var_eb6918fe = 0;
	var_386f56e0 = 0;
	time_out = 0;
	while(var_386f56e0 < 10)
	{
		var_eb6918fe = var_eb6918fe + 0.2;
		SetDvar("r_exposureValue", var_cb497214 - var_eb6918fe);
		wait(0.05);
		var_386f56e0++;
	}
	wait(0.05);
	while(time_out < 10)
	{
		var_eb6918fe = var_eb6918fe + 0.2;
		SetDvar("r_exposureValue", var_cb497214 + var_eb6918fe);
		wait(0.05);
		time_out++;
	}
	SetDvar("r_exposureValue", var_cb497214);
	SetDvar("r_exposureTweak", 0);
}

