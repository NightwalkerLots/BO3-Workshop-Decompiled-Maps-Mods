#include scripts\codescripts\struct;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_bgb_machine;
#include scripts\zm\_zm_bgb_token;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_sub;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\bgbs\_zm_bgb_extra_credit;
#include scripts\zm\bgbs\_zm_bgb_reign_drops;
#include scripts\zm\gametypes\_globallogic_score;

#namespace bgb;

/*
	Name: __init__sytem__
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0xF68
	Size: 0x630
	Parameters: 0
	Flags: AutoExec
	Line Number: 44
*/
function autoexec __init__sytem__()
{
	if(function_9ae7fa6d())
	{
		system::register("bgb", &__init__, &__main__, undefined);
	}
	else
	{
		system::Ignore("zm_bgb_aftertaste");
		system::Ignore("zm_bgb_alchemical_antithesis");
		system::Ignore("zm_bgb_always_done_swiftly");
		system::Ignore("zm_bgb_anywhere_but_here");
		system::Ignore("zm_bgb_armamental_accomplishment");
		system::Ignore("zm_bgb_arms_grace");
		system::Ignore("zm_bgb_arsenal_accelerator");
		system::Ignore("zm_bgb_board_games");
		system::Ignore("zm_bgb_board_to_death");
		system::Ignore("zm_bgb_bullet_boost");
		system::Ignore("zm_bgb_cache_back");
		system::Ignore("zm_bgb_coagulant");
		system::Ignore("zm_bgb_crate_power");
		system::Ignore("zm_bgb_crawl_space");
		system::Ignore("zm_bgb_danger_closest");
		system::Ignore("zm_bgb_dead_of_nuclear_winter");
		system::Ignore("zm_bgb_disorderly_combat");
		system::Ignore("zm_bgb_ephemeral_enhancement");
		system::Ignore("zm_bgb_extra_credit");
		system::Ignore("zm_bgb_eye_candy");
		system::Ignore("zm_bgb_fatal_contraption");
		system::Ignore("zm_bgb_fear_in_headlights");
		system::Ignore("zm_bgb_firing_on_all_cylinders");
		system::Ignore("zm_bgb_flavor_hexed");
		system::Ignore("zm_bgb_head_drama");
		system::Ignore("zm_bgb_idle_eyes");
		system::Ignore("zm_bgb_immolation_liquidation");
		system::Ignore("zm_bgb_impatient");
		system::Ignore("zm_bgb_im_feelin_lucky");
		system::Ignore("zm_bgb_in_plain_sight");
		system::Ignore("zm_bgb_killing_time");
		system::Ignore("zm_bgb_kill_joy");
		system::Ignore("zm_bgb_licensed_contractor");
		system::Ignore("zm_bgb_lucky_crit");
		system::Ignore("zm_bgb_mind_blown");
		system::Ignore("zm_bgb_near_death_experience");
		system::Ignore("zm_bgb_newtonian_negation");
		system::Ignore("zm_bgb_now_you_see_me");
		system::Ignore("zm_bgb_on_the_house");
		system::Ignore("zm_bgb_perkaholic");
		system::Ignore("zm_bgb_phoenix_up");
		system::Ignore("zm_bgb_pop_shocks");
		system::Ignore("zm_bgb_power_vacuum");
		system::Ignore("zm_bgb_profit_sharing");
		system::Ignore("zm_bgb_projectile_vomiting");
		system::Ignore("zm_bgb_reign_drops");
		system::Ignore("zm_bgb_respin_cycle");
		system::Ignore("zm_bgb_round_robbin");
		system::Ignore("zm_bgb_secret_shopper");
		system::Ignore("zm_bgb_self_medication");
		system::Ignore("zm_bgb_shopping_free");
		system::Ignore("zm_bgb_slaughter_slide");
		system::Ignore("zm_bgb_soda_fountain");
		system::Ignore("zm_bgb_stock_option");
		system::Ignore("zm_bgb_sword_flay");
		system::Ignore("zm_bgb_temporal_gift");
		system::Ignore("zm_bgb_tone_death");
		system::Ignore("zm_bgb_unbearable");
		system::Ignore("zm_bgb_undead_man_walking");
		system::Ignore("zm_bgb_unquenchable");
		system::Ignore("zm_bgb_wall_power");
		system::Ignore("zm_bgb_whos_keeping_score");
	}
}

/*
	Name: __init__
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x15A0
	Size: 0x288
	Parameters: 0
	Flags: Private
	Line Number: 127
*/
function private __init__()
{
	callback::on_spawned(&on_player_spawned);
	level.var_adfa48c4 = GetWeapon("zombie_bgb_grab");
	level.var_c92b3b33 = GetWeapon("zombie_bgb_use");
	level.bgb = [];
	if(function_9ae7fa6d())
	{
		clientfield::register("clientuimodel", "bgb_current", 1, 8, "int");
		clientfield::register("clientuimodel", "bgb_display", 1, 1, "int");
		clientfield::register("clientuimodel", "bgb_timer", 1, 8, "float");
		clientfield::register("clientuimodel", "bgb_activations_remaining", 1, 3, "int");
		clientfield::register("clientuimodel", "bgb_invalid_use", 1, 1, "counter");
		clientfield::register("clientuimodel", "bgb_one_shot_use", 1, 1, "counter");
		clientfield::register("toplayer", "bgb_blow_bubble", 1, 1, "counter");
		clientfield::register("toplayer", "bgb_blow_bubble_blue", 1, 1, "counter");
		clientfield::register("toplayer", "bgb_blow_bubble_green", 1, 1, "counter");
		clientfield::register("toplayer", "bgb_blow_bubble_yellow", 1, 1, "counter");
		zm::register_vehicle_damage_callback(&vehicle_damage_override);
	}
}

/*
	Name: __main__
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x1830
	Size: 0x60
	Parameters: 0
	Flags: Private
	Line Number: 159
*/
function private __main__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	function_47aee2eb();
	/#
		level thread setup_devgui();
	#/
	level._effect["samantha_steal"] = "zombie/fx_monkey_lightning_zmb";
	return;
}

/*
	Name: on_player_spawned
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x1898
	Size: 0x60
	Parameters: 0
	Flags: Private
	Line Number: 183
*/
function private on_player_spawned()
{
	self.bgb = "none";
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	self function_52dbea8c();
	self thread function_e94a4b1b();
}

/*
	Name: function_52dbea8c
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x1900
	Size: 0x50
	Parameters: 0
	Flags: Private
	Line Number: 204
*/
function private function_52dbea8c()
{
	if(!(isdefined(self.var_c2d95bad) && self.var_c2d95bad))
	{
		self.var_c2d95bad = 1;
		self globallogic_score::initPersStat("bgb_tokens_gained_this_game", 0);
		self.var_f191a1fc = 0;
	}
}

/*
	Name: function_e94a4b1b
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x1958
	Size: 0x220
	Parameters: 0
	Flags: Private
	Line Number: 224
*/
function private function_e94a4b1b()
{
	if(isdefined(self.var_98ba48a2))
	{
		return;
	}
	self.var_98ba48a2 = self getbubblegumpack();
	self.var_8414308a = [];
	self.var_e610f362 = [];
	foreach(bgb in self.var_98ba48a2)
	{
		if(bgb == "weapon_null")
		{
			continue;
		}
		if(!(isdefined(level.bgb[bgb].var_e0715b48) && level.bgb[bgb].var_e0715b48))
		{
			continue;
		}
		self.var_e610f362[bgb] = spawnstruct();
		self.var_e610f362[bgb].var_e0b06b47 = 100;
		if(function_9ae7fa6d())
		{
			self.var_e610f362[bgb].var_e0b06b47 = 0;
		}
		self.var_e610f362[bgb].var_b75c376 = 0;
	}
	self.var_85da8a33 = 0;
	if(function_9ae7fa6d())
	{
		self clientfield::set_to_player("zm_bgb_machine_round_buys", self.var_85da8a33);
	}
	self function_959ccfd0();
	self thread function_94160e1d();
	self thread function_efd2e645();
}

/*
	Name: function_efd2e645
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x1B80
	Size: 0x1D0
	Parameters: 0
	Flags: Private
	Line Number: 271
*/
function private function_efd2e645()
{
	self endon("disconnect");
	self endon("death");
	if(!level flag::exists("consumables_reported"))
	{
		level flag::init("consumables_reported");
	}
	self flag::init("finished_reporting_consumables");
	self waittill("report_bgb_consumption");
	self thread take();
	self zm_stats::set_global_stat("bgb_tokens_gained_this_game", self.var_f191a1fc);
	foreach(bgb in self.var_98ba48a2)
	{
		if(!isdefined(self.var_e610f362[bgb]) || !self.var_e610f362[bgb].var_b75c376)
		{
			continue;
		}
		level flag::set("consumables_reported");
		zm_utility::increment_zm_dash_counter("end_consumables_count", self.var_e610f362[bgb].var_b75c376);
	}
	self flag::set("finished_reporting_consumables");
}

/*
	Name: function_47aee2eb
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x1D58
	Size: 0x428
	Parameters: 0
	Flags: Private
	Line Number: 305
*/
function private function_47aee2eb()
{
	statsTableName = util::getStatsTableName();
	keys = getArrayKeys(level.bgb);
	level.var_25bf35d1 = [];
	level.var_25bf35d1[level.var_25bf35d1.size] = "base";
	level.var_25bf35d1[level.var_25bf35d1.size] = "speckled";
	level.var_25bf35d1[level.var_25bf35d1.size] = "shiny";
	level.var_25bf35d1[level.var_25bf35d1.size] = "swirl";
	level.var_25bf35d1[level.var_25bf35d1.size] = "pinwheel";
	for(i = 0; i < keys.size; i++)
	{
		level.bgb[keys[i]].item_index = GetItemIndexFromRef(keys[i]);
		level.bgb[keys[i]].var_d277f374 = Int(tableLookup(statsTableName, 0, level.bgb[keys[i]].item_index, 16));
		if(0 == level.bgb[keys[i]].var_d277f374 || 4 == level.bgb[keys[i]].var_d277f374)
		{
			level.bgb[keys[i]].var_e0715b48 = 1;
		}
		else
		{
			level.bgb[keys[i]].var_e0715b48 = 1;
		}
		level.bgb[keys[i]].camo_index = Int(tableLookup(statsTableName, 0, level.bgb[keys[i]].item_index, 5));
		var_cf65a2c0 = tableLookup(statsTableName, 0, level.bgb[keys[i]].item_index, 15);
		level.bgb[keys[i]].var_d3c80142 = "tag_gumball_" + level.bgb[keys[i]].var_c9e64d65;
		level.bgb[keys[i]].var_ece14434 = "tag_gumball_" + level.bgb[keys[i]].var_c9e64d65 + "_" + level.var_25bf35d1[level.bgb[keys[i]].var_d277f374];
		if(IsSubStr(var_cf65a2c0, "dlc"))
		{
			level.bgb[keys[i]].var_b9af356d = Int(var_cf65a2c0[3]);
			continue;
		}
		level.bgb[keys[i]].var_b9af356d = 0;
	}
}

/*
	Name: function_94160e1d
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x2188
	Size: 0xF0
	Parameters: 0
	Flags: Private
	Line Number: 350
*/
function private function_94160e1d()
{
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		var_bc5cda7b = level util::waittill_any_return("between_round_over", "restart_round");
		if(isdefined(level.var_4824bb2d))
		{
			if(!(isdefined(self [[level.var_4824bb2d]]()) && self [[level.var_4824bb2d]]()))
			{
				continue;
			}
		}
		if(var_bc5cda7b === "restart_round")
		{
			level waittill("between_round_over");
		}
		else
		{
			self.var_85da8a33 = 0;
			if(function_9ae7fa6d())
			{
				self clientfield::set_to_player("zm_bgb_machine_round_buys", self.var_85da8a33);
			}
		}
	}
}

/*
	Name: setup_devgui
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x2280
	Size: 0x268
	Parameters: 0
	Flags: Private
	Line Number: 389
*/
function private setup_devgui()
{
	/#
		SetDvar("Dev Block strings are not supported", "Dev Block strings are not supported");
		SetDvar("Dev Block strings are not supported", -1);
		var_33b4e7c1 = "Dev Block strings are not supported";
		keys = getArrayKeys(level.bgb);
		foreach(key in keys)
		{
			AddDebugCommand(var_33b4e7c1 + key + "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported" + key + "Dev Block strings are not supported");
		}
		AddDebugCommand(var_33b4e7c1 + "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported");
		AddDebugCommand(var_33b4e7c1 + "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported");
		for(i = 0; i < 4; i++)
		{
			playerNum = i + 1;
			AddDebugCommand(var_33b4e7c1 + "Dev Block strings are not supported" + playerNum + "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported" + i + "Dev Block strings are not supported");
		}
		level thread function_70fe94ae();
	#/
}

/*
	Name: function_70fe94ae
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x24F0
	Size: 0x80
	Parameters: 0
	Flags: Private
	Line Number: 421
*/
function private function_70fe94ae()
{
	/#
		for(;;)
		{
			var_fe9a7d67 = GetDvarString("Dev Block strings are not supported");
			if(var_fe9a7d67 != "Dev Block strings are not supported")
			{
				function_dea9a9da(var_fe9a7d67);
			}
			SetDvar("Dev Block strings are not supported", "Dev Block strings are not supported");
			wait(0.5);
		}
	#/
}

/*
	Name: function_dea9a9da
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x2578
	Size: 0xF8
	Parameters: 1
	Flags: Private
	Line Number: 447
*/
function private function_dea9a9da(var_a961d470)
{
	/#
		var_a7032a9 = GetDvarInt("Dev Block strings are not supported");
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(var_a7032a9 != -1 && var_a7032a9 != i)
			{
				continue;
			}
			if("Dev Block strings are not supported" == var_a961d470)
			{
				players[i] thread take();
				continue;
			}
			players[i] thread bgb_gumball_anim(var_a961d470, 0);
		}
		return;
	#/
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ef47b774
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x2678
	Size: 0x148
	Parameters: 0
	Flags: Private
	Line Number: 480
*/
function private function_ef47b774()
{
	/#
		self.var_94ee23e0 = newClientHudElem(self);
		self.var_94ee23e0.elemType = "Dev Block strings are not supported";
		self.var_94ee23e0.font = "Dev Block strings are not supported";
		self.var_94ee23e0.fontscale = 1.8;
		self.var_94ee23e0.horzAlign = "Dev Block strings are not supported";
		self.var_94ee23e0.vertAlign = "Dev Block strings are not supported";
		self.var_94ee23e0.alignX = "Dev Block strings are not supported";
		self.var_94ee23e0.alignY = "Dev Block strings are not supported";
		self.var_94ee23e0.x = 15;
		self.var_94ee23e0.y = 35;
		self.var_94ee23e0.sort = 2;
		self.var_94ee23e0.color = (1, 1, 1);
		self.var_94ee23e0.alpha = 1;
		self.var_94ee23e0.hidewheninmenu = 1;
	#/
}

/*
	Name: function_b33a98c7
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x27C8
	Size: 0x1F8
	Parameters: 2
	Flags: Private
	Line Number: 510
*/
function private function_b33a98c7(name, var_2741876d)
{
	/#
		if(!isdefined(self.var_94ee23e0))
		{
			return;
		}
		if(isdefined(var_2741876d))
		{
			self clientfield::set_player_uimodel("Dev Block strings are not supported", 1);
		}
		else
		{
			self clientfield::set_player_uimodel("Dev Block strings are not supported", 0);
		}
		self notify("hash_ad571a66");
		self endon("hash_ad571a66");
		self endon("disconnect");
		self endon("death");
		self.var_94ee23e0 fadeOverTime(0.05);
		self.var_94ee23e0.alpha = 1;
		prefix = "Dev Block strings are not supported";
		var_fc8642f1 = name;
		if(IsSubStr(name, prefix))
		{
			var_fc8642f1 = GetSubStr(name, prefix.size);
		}
		if(isdefined(var_2741876d))
		{
			self.var_94ee23e0 setText("Dev Block strings are not supported" + var_fc8642f1 + "Dev Block strings are not supported" + var_2741876d + "Dev Block strings are not supported");
		}
		else
		{
			self.var_94ee23e0 setText("Dev Block strings are not supported" + var_fc8642f1);
		}
		wait(1);
		if("Dev Block strings are not supported" == name)
		{
			self.var_94ee23e0 fadeOverTime(1);
			self.var_94ee23e0.alpha = 0;
		}
	#/
}

/*
	Name: function_47db72b6
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x29C8
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 564
*/
function function_47db72b6(bgb)
{
	/#
		PrintTopRightln(bgb + "Dev Block strings are not supported" + self.var_e610f362[bgb].var_e0b06b47, (1, 1, 1));
		PrintTopRightln(bgb + "Dev Block strings are not supported" + self.var_e610f362[bgb].var_b75c376, (1, 1, 1));
		var_e4140345 = self.var_e610f362[bgb].var_e0b06b47 - self.var_e610f362[bgb].var_b75c376;
		PrintTopRightln(bgb + "Dev Block strings are not supported" + var_e4140345, (1, 1, 1));
	#/
}

/*
	Name: function_c7783423
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x2AC8
	Size: 0x60
	Parameters: 1
	Flags: Private
	Line Number: 584
*/
function private function_c7783423(bgb)
{
	if(!isdefined(self.var_e610f362[bgb]) || (!(isdefined(level.bgb[bgb].var_e0715b48) && level.bgb[bgb].var_e0715b48)))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_66a597c1
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x2B30
	Size: 0x158
	Parameters: 1
	Flags: None
	Line Number: 603
*/
function function_66a597c1(bgb)
{
	if(!function_c7783423(bgb))
	{
		return;
	}
	if(isdefined(level.bgb[bgb].var_35e23ba2) && ![[level.bgb[bgb].var_35e23ba2]]())
	{
		return;
	}
	self.var_e610f362[bgb].var_b75c376++;
	self flag::set("used_consumable");
	zm_utility::increment_zm_dash_counter("consumables_used", 1);
	if(level flag::exists("first_consumables_used"))
	{
		level flag::set("first_consumables_used");
	}
	self LUINotifyEvent(&"zombie_bgb_used", 1, level.bgb[bgb].item_index);
	/#
		function_47db72b6(bgb);
	#/
}

/*
	Name: function_f59fbff
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x2C90
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 636
*/
function function_f59fbff(bgb)
{
	if(!isdefined(self.var_e610f362[bgb]))
	{
		return 1;
	}
	var_3232aae6 = 999;
	var_8e01583 = self.var_e610f362[bgb].var_b75c376;
	var_c6b3f8bc = var_3232aae6 - var_8e01583;
	return 0 < var_c6b3f8bc;
}

/*
	Name: function_c3e0b2ba
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x2D18
	Size: 0xC8
	Parameters: 2
	Flags: Private
	Line Number: 658
*/
function private function_c3e0b2ba(bgb, activating)
{
	if(!(isdefined(level.bgb[bgb].var_7ca0e2a7) && level.bgb[bgb].var_7ca0e2a7))
	{
		return;
	}
	var_b0106e56 = self EnableInvulnerability();
	self util::waittill_any_timeout(2, "bgb_bubble_blow_complete");
	if(isdefined(self) && (!(isdefined(var_b0106e56) && var_b0106e56)))
	{
		self DisableInvulnerability();
	}
}

/*
	Name: bgb_gumball_anim
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x2DE8
	Size: 0x4C0
	Parameters: 3
	Flags: None
	Line Number: 682
*/
function bgb_gumball_anim(bgb, activating, var_948241a0)
{
	if(!isdefined(var_948241a0))
	{
		var_948241a0 = 1;
	}
	self endon("disconnect");
	self endon("death");
	level endon("end_game");
	succeeded = 0;
	if(function_9ae7fa6d())
	{
		if(activating)
		{
			if(!var_948241a0 || self laststand::player_is_in_laststand())
			{
				func = &function_b616fe7a;
				if(bgb == "zm_bgb_phoenix_up")
				{
					func = &function_a2fbdf5b;
				}
				if(isdefined(level.bgb[bgb].var_7ea552f4) && level.bgb[bgb].var_7ea552f4 || self [[func]](1))
				{
					self clientfield::increment_to_player("bgb_blow_bubble");
					wait(0.7);
					self zm_audio::create_and_play_dialog("bgb", "eat");
					self notify("hash_83da9d01", bgb);
					self.var_aa1915a5 = 1;
					self thread function_eb4b1160(bgb);
					return 1;
				}
				return 0;
			}
		}
		gun = self function_bb702b0a(bgb, activating, var_948241a0);
		evt = self util::waittill_any_return("fake_death", "death", "player_downed", "weapon_change_complete", "disconnect", "bgb_chew_no_weapon");
		if(evt == "weapon_change_complete" || evt == "bgb_chew_no_weapon")
		{
			succeeded = 1;
			if(activating)
			{
				if(isdefined(level.bgb[bgb].var_7ea552f4) && level.bgb[bgb].var_7ea552f4 || self function_b616fe7a(1))
				{
					self notify("hash_83da9d01", bgb);
					self function_103ebe74();
					self thread function_eb4b1160(bgb);
				}
				else
				{
					succeeded = 0;
				}
			}
			else
			{
				self notify("hash_fcbbef99", bgb);
				self thread give(bgb);
				self zm_stats::increment_client_stat("bgbs_chewed");
				self zm_stats::increment_player_stat("bgbs_chewed");
				self zm_stats::increment_challenge_stat("GUM_GOBBLER_CONSUME");
				self AddDStat("ItemStats", level.bgb[bgb].item_index, "stats", "used", "statValue", 1);
				health = 0;
				if(isdefined(self.health))
				{
					health = self.health;
				}
				self RecordMapEvent(4, GetTime(), self.origin, level.round_number, level.bgb[bgb].item_index, health);
				demo::bookmark("zm_player_bgb_grab", GetTime(), self);
				if(SessionModeIsOnlineGame())
				{
					util::function_a4c90358("zm_bgb_consumed", 1);
				}
			}
		}
		if(var_948241a0)
		{
			self function_a4493f0e(gun, bgb, activating);
		}
	}
	return succeeded;
}

/*
	Name: function_eb4b1160
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x32B0
	Size: 0xB8
	Parameters: 1
	Flags: Private
	Line Number: 773
*/
function private function_eb4b1160(bgb)
{
	self endon("disconnect");
	self endon("death");
	self function_9b5dc008(1);
	self do_one_shot_use();
	self notify("hash_95b677dc");
	self [[level.bgb[bgb].var_6fa3d682]]();
	self function_9b5dc008(0);
	self function_1565b2f5();
}

/*
	Name: function_f6845bf
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x3370
	Size: 0x50
	Parameters: 2
	Flags: Private
	Line Number: 795
*/
function private function_f6845bf(bgb, activating)
{
	if(level.bgb[bgb].var_c9e64d65 != "activated" || activating)
	{
		return level.var_c92b3b33;
	}
	return level.var_adfa48c4;
}

/*
	Name: function_bb702b0a
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x33C8
	Size: 0x160
	Parameters: 3
	Flags: Private
	Line Number: 814
*/
function private function_bb702b0a(bgb, activating, var_948241a0)
{
	if(function_9ae7fa6d())
	{
		weapon = function_f6845bf(bgb, activating);
		if(var_948241a0)
		{
			self zm_utility::increment_is_drinking();
			self zm_utility::disable_player_move_states(1);
			var_e3d21ca6 = self GetCurrentWeapon();
			self GiveWeapon(weapon, self CalcWeaponOptions(level.bgb[bgb].camo_index, 0, 0));
			self thread function_7bf48821(weapon, bgb, var_948241a0);
			self SwitchToWeapon(weapon);
			return var_e3d21ca6;
		}
		self thread function_7bf48821(weapon, bgb, var_948241a0);
		return;
	}
}

/*
	Name: function_7bf48821
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x3530
	Size: 0x188
	Parameters: 3
	Flags: Private
	Line Number: 844
*/
function private function_7bf48821(weapon, bgb, var_948241a0)
{
	self notify("hash_7bf48821");
	self endon("hash_7bf48821");
	self endon("disconnect");
	self endon("bled_out");
	if(weapon === level.var_c92b3b33)
	{
		if(!var_948241a0)
		{
			self clientfield::increment_to_player(function_ffa694f9(bgb));
			wait(0.7);
			self notify("hash_cc4eb97d");
			self zm_audio::create_and_play_dialog("bgb", "eat");
			return;
		}
		else
		{
			self waittill("weapon_change_complete");
			self clientfield::increment_to_player(function_ffa694f9(bgb));
			wait(0.7);
			self zm_audio::create_and_play_dialog("bgb", "eat");
			return;
		}
	}
	self zm_audio::create_and_play_dialog("bgb", "buy");
	if(!var_948241a0)
	{
		wait(0.2);
		self notify("hash_cc4eb97d");
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_a4493f0e
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x36C0
	Size: 0x280
	Parameters: 3
	Flags: Private
	Line Number: 889
*/
function private function_a4493f0e(var_e3d21ca6, bgb, activating)
{
	/#
		/#
			Assert(!var_e3d21ca6.isPerkBottle);
		#/
	#/
	/#
		/#
			Assert(var_e3d21ca6 != level.weaponReviveTool);
		#/
	#/
	while(self IsSwitchingWeapons())
	{
		wait(0.05);
	}
	self zm_utility::enable_player_move_states();
	weapon = function_f6845bf(bgb, activating);
	if(self laststand::player_is_in_laststand() || (isdefined(self.intermission) && self.intermission))
	{
		self TakeWeapon(weapon);
		return;
	}
	self TakeWeapon(weapon);
	if(self zm_utility::is_multiple_drinking())
	{
		self zm_utility::decrement_is_drinking();
		return;
	}
	if(var_e3d21ca6 != level.weaponNone && !zm_utility::is_placeable_mine(var_e3d21ca6) && !zm_equipment::is_equipment_that_blocks_purchase(var_e3d21ca6))
	{
		self zm_weapons::switch_back_primary_weapon(var_e3d21ca6);
		if(zm_utility::is_melee_weapon(var_e3d21ca6))
		{
			wait(0.1);
			self zm_utility::decrement_is_drinking();
			return;
		}
	}
	else
	{
		self zm_weapons::switch_back_primary_weapon();
	}
	self util::waittill_any_timeout(1, "weapon_change_complete");
	if(!self laststand::player_is_in_laststand() && (!(isdefined(self.intermission) && self.intermission)))
	{
		wait(0.1);
		self zm_utility::decrement_is_drinking();
	}
}

/*
	Name: function_ffa694f9
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x3948
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 950
*/
function function_ffa694f9(bgb)
{
	switch(level.bgb[bgb].var_c9e64d65)
	{
		case "rounds":
		{
			return "bgb_blow_bubble_blue";
			break;
		}
		case "time":
		{
			return "bgb_blow_bubble_green";
			break;
		}
		case "event":
		{
			return "bgb_blow_bubble_yellow";
			break;
		}
	}
	return "bgb_blow_bubble";
}

/*
	Name: function_3fe79b9
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x39C8
	Size: 0x90
	Parameters: 0
	Flags: Private
	Line Number: 983
*/
function private function_3fe79b9()
{
	self notify("hash_f8dba1d1");
	self notify("hash_d701de2e");
	if(function_9ae7fa6d())
	{
		self clientfield::set_player_uimodel("bgb_display", 0);
		self clientfield::set_player_uimodel("bgb_activations_remaining", 0);
	}
	self clear_timer();
}

/*
	Name: function_f8dba1d1
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x3A60
	Size: 0x590
	Parameters: 0
	Flags: Private
	Line Number: 1005
*/
function private function_f8dba1d1()
{
	self endon("disconnect");
	self endon("death");
	self endon("hash_994d5e9e");
	self notify("hash_f8dba1d1");
	self endon("hash_f8dba1d1");
	if(function_9ae7fa6d())
	{
		self clientfield::set_player_uimodel("bgb_display", 1);
	}
	self thread function_5fc6d844(self.bgb);
	switch(level.bgb[self.bgb].var_c9e64d65)
	{
		case "activated":
		{
			if(self.bgb == "zm_bgb_phoenix_up")
			{
				self thread function_cb7cc5a6();
			}
			else
			{
				self thread function_d701de2e();
			}
			for(i = level.bgb[self.bgb].limit; i > 0; i--)
			{
				level.bgb[self.bgb].var_32fa3cb7 = i;
				if(level.bgb[self.bgb].var_336ffc4e)
				{
					function_497386b0();
				}
				else
				{
					self set_timer(i, level.bgb[self.bgb].limit);
				}
				if(function_9ae7fa6d())
				{
					self clientfield::set_player_uimodel("bgb_activations_remaining", i);
				}
				self thread function_b33a98c7(self.bgb, i);
				self waittill("hash_20e4f529");
				while(isdefined(self function_e2bcf80c()) && self function_e2bcf80c())
				{
					wait(0.05);
				}
				self playsoundtoplayer("zmb_bgb_power_decrement", self);
			}
			level.bgb[self.bgb].var_32fa3cb7 = 0;
			self playsoundtoplayer("zmb_bgb_power_done_delayed", self);
			self set_timer(0, level.bgb[self.bgb].limit);
			while(isdefined(self.var_aa1915a5) && self.var_aa1915a5)
			{
				wait(0.05);
			}
			break;
		}
		case "time":
		{
			self thread function_b33a98c7(self.bgb);
			self thread run_timer(level.bgb[self.bgb].limit);
			wait(level.bgb[self.bgb].limit);
			self playsoundtoplayer("zmb_bgb_power_done", self);
			break;
		}
		case "rounds":
		{
			self thread function_b33a98c7(self.bgb);
			count = level.bgb[self.bgb].limit + 1;
			for(i = 0; i < count; i++)
			{
				self set_timer(count - i, count);
				level waittill("end_of_round");
				self playsoundtoplayer("zmb_bgb_power_decrement", self);
			}
			self playsoundtoplayer("zmb_bgb_power_done_delayed", self);
			break;
		}
		case "event":
		{
			self thread function_b33a98c7(self.bgb);
			self function_63a399b7(1);
			self [[level.bgb[self.bgb].limit]]();
			self playsoundtoplayer("zmb_bgb_power_done_delayed", self);
			break;
		}
		default
		{
			/#
				/#
					Assert(0, "Dev Block strings are not supported" + self.bgb + "Dev Block strings are not supported" + level.bgb[self.bgb].var_c9e64d65 + "Dev Block strings are not supported");
				#/
			#/
		}
	}
	self thread take();
}

/*
	Name: function_7ad7537e
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x3FF8
	Size: 0x80
	Parameters: 0
	Flags: Private
	Line Number: 1112
*/
function private function_7ad7537e()
{
	self endon("disconnect");
	self endon("death");
	self endon("hash_994d5e9e");
	self notify("hash_7ad7537e");
	self endon("hash_7ad7537e");
	self waittill("bled_out");
	self notify("hash_eecacfa5");
	wait(0.1);
	self thread take();
}

/*
	Name: function_d701de2e
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4080
	Size: 0x258
	Parameters: 0
	Flags: Private
	Line Number: 1135
*/
function private function_d701de2e()
{
	self endon("disconnect");
	self endon("death");
	self notify("hash_d701de2e");
	self endon("hash_d701de2e");
	if("activated" != level.bgb[self.bgb].var_c9e64d65)
	{
		return;
	}
	if(level.script == "zm_leviathan" || level.script == "zm_daybreak")
	{
		self thread zm_equipment::show_hint_text("^3[{+actionslot 4}]^7 " + MakeLocalizedString("MENU_USE_GOBBLEGUM"), 8);
		var_e40c3375 = 1;
	}
	var_948241a0 = 1;
	while(1)
	{
		wait(0.05);
		if(isdefined(var_e40c3375))
		{
			while(self ActionSlotFourButtonPressed())
			{
				wait(0.05);
			}
			while(!self ActionSlotFourButtonPressed() || self IsSwitchingWeapons())
			{
				wait(0.05);
			}
		}
		else
		{
			self waittill("hash_10c37787");
		}
		if(self GetCurrentWeapon() == level.var_c92b3b33 || self GetCurrentWeapon() == level.var_adfa48c4)
		{
			continue;
		}
		if(isdefined(self.IS_DRINKING) && self.IS_DRINKING)
		{
			var_948241a0 = 0;
		}
		if(self laststand::player_is_in_laststand())
		{
			var_948241a0 = 0;
		}
		if(!self function_b616fe7a(0, var_948241a0))
		{
			continue;
		}
		if(self bgb_gumball_anim(self.bgb, 1, var_948241a0))
		{
			var_948241a0 = 0;
			self notify("hash_20e4f529", self.bgb);
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_659254a9
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x42E0
	Size: 0x48
	Parameters: 1
	Flags: Private
	Line Number: 1205
*/
function private function_659254a9(var_948241a0)
{
	if(isdefined(var_948241a0) && var_948241a0 || !isdefined(var_948241a0))
	{
		if(self laststand::player_is_in_laststand())
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_1815745
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4330
	Size: 0x50
	Parameters: 1
	Flags: Private
	Line Number: 1227
*/
function private function_1815745(var_948241a0)
{
	if(isdefined(var_948241a0) && var_948241a0 || !isdefined(var_948241a0))
	{
		if(isdefined(self.IS_DRINKING) && self.IS_DRINKING)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_b616fe7a
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4388
	Size: 0x170
	Parameters: 2
	Flags: Private
	Line Number: 1249
*/
function private function_b616fe7a(b_chewing, var_948241a0)
{
	if(!isdefined(b_chewing))
	{
		b_chewing = 0;
	}
	var_bb1d9487 = isdefined(level.bgb[self.bgb].validation_func) && !self [[level.bgb[self.bgb].validation_func]]();
	var_847ec8da = isdefined(level.var_9cef605e) && !self [[level.var_9cef605e]]();
	if(!b_chewing && self function_1815745(var_948241a0) || (isdefined(self.var_aa1915a5) && self.var_aa1915a5) || self function_659254a9(var_948241a0) || var_bb1d9487 || var_847ec8da)
	{
		if(function_9ae7fa6d())
		{
			self clientfield::increment_uimodel("bgb_invalid_use");
		}
		self playlocalsound("zmb_bgb_deny_plr");
		return 0;
	}
	return 1;
}

/*
	Name: function_a2fbdf5b
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4500
	Size: 0x190
	Parameters: 1
	Flags: Private
	Line Number: 1279
*/
function private function_a2fbdf5b(b_chewing)
{
	if(!isdefined(b_chewing))
	{
		b_chewing = 0;
	}
	var_bb1d9487 = isdefined(level.bgb[self.bgb].validation_func) && !self [[level.bgb[self.bgb].validation_func]]();
	var_847ec8da = isdefined(level.var_9cef605e) && !self [[level.var_9cef605e]]();
	if(self laststand::player_is_in_laststand() && (!(isdefined(self.var_aa1915a5) && self.var_aa1915a5)) && !var_bb1d9487 && !var_847ec8da)
	{
		return 1;
	}
	if(!b_chewing && (isdefined(self.IS_DRINKING) && self.IS_DRINKING) || (isdefined(self.var_aa1915a5) && self.var_aa1915a5) || var_bb1d9487 || var_847ec8da)
	{
		if(function_9ae7fa6d())
		{
			self clientfield::increment_uimodel("bgb_invalid_use");
		}
		self playlocalsound("zmb_bgb_deny_plr");
		return 0;
	}
	return 1;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5fc6d844
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4698
	Size: 0xB8
	Parameters: 1
	Flags: Private
	Line Number: 1314
*/
function private function_5fc6d844(bgb)
{
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	self endon("hash_994d5e9e");
	if(isdefined(level.bgb[bgb].var_50fe45f6) && level.bgb[bgb].var_50fe45f6)
	{
		function_650ca64(6);
		return;
	}
	else
	{
	}
	self waittill("hash_10c37787");
	self thread take();
}

/*
	Name: function_650ca64
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4758
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 1342
*/
function function_650ca64(n_value)
{
	self function_1e12cfb2("bgb");
	if(function_9ae7fa6d())
	{
		self clientfield::set_player_uimodel("bgb_activations_remaining", n_value);
	}
}

/*
	Name: function_eabb0903
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x47C0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1361
*/
function function_eabb0903(n_value)
{
	if(function_9ae7fa6d())
	{
		self clientfield::set_player_uimodel("bgb_activations_remaining", 0);
	}
}

/*
	Name: function_336ffc4e
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4808
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 1379
*/
function function_336ffc4e(name)
{
	level.bgb[name].var_336ffc4e = 1;
}

/*
	Name: do_one_shot_use
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4838
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1394
*/
function do_one_shot_use(skip_demo_bookmark)
{
	if(!isdefined(skip_demo_bookmark))
	{
		skip_demo_bookmark = 0;
	}
	if(function_9ae7fa6d())
	{
		self clientfield::increment_uimodel("bgb_one_shot_use");
	}
	if(!skip_demo_bookmark)
	{
		demo::bookmark("zm_player_bgb_activate", GetTime(), self);
	}
}

/*
	Name: function_103ebe74
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x48C0
	Size: 0x10
	Parameters: 0
	Flags: Private
	Line Number: 1420
*/
function private function_103ebe74()
{
	self.var_aa1915a5 = 1;
}

/*
	Name: function_1565b2f5
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x48D8
	Size: 0x20
	Parameters: 0
	Flags: Private
	Line Number: 1435
*/
function private function_1565b2f5()
{
	self.var_aa1915a5 = 0;
	self notify("hash_1565b2f5");
}

/*
	Name: function_9b5dc008
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4900
	Size: 0x18
	Parameters: 1
	Flags: Private
	Line Number: 1451
*/
function private function_9b5dc008(var_71740755)
{
	self.var_3244073f = var_71740755;
}

/*
	Name: function_e2bcf80c
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4920
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 1466
*/
function function_e2bcf80c()
{
	return isdefined(self.var_3244073f) && self.var_3244073f;
}

/*
	Name: is_active
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4940
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1481
*/
function is_active(name)
{
	if(!isdefined(self.bgb))
	{
		return 0;
	}
	return self.bgb == name && (isdefined(self.var_3244073f) && self.var_3244073f);
}

/*
	Name: is_team_active
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4988
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 1500
*/
function is_team_active(name)
{
	foreach(player in level.players)
	{
		if(player is_active(name))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_f345a8ce
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4A38
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1522
*/
function function_f345a8ce(name)
{
	if(!isdefined(level.bgb[name]))
	{
		return 0;
	}
	var_ad8303b0 = level.bgb[name].ref_count;
	level.bgb[name].ref_count++;
	return var_ad8303b0;
}

/*
	Name: function_72936116
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4AA8
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 1543
*/
function function_72936116(name)
{
	if(!isdefined(level.bgb[name]))
	{
		return 0;
	}
	level.bgb[name].ref_count--;
	return level.bgb[name].ref_count;
}

/*
	Name: calc_remaining_duration_lerp
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4B08
	Size: 0x98
	Parameters: 2
	Flags: Private
	Line Number: 1563
*/
function private calc_remaining_duration_lerp(start_time, end_time)
{
	if(0 >= end_time - start_time)
	{
		return 0;
	}
	now = GetTime();
	frac = float(end_time - now) / float(end_time - start_time);
	return math::clamp(frac, 0, 1);
}

/*
	Name: function_f9fad8b3
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4BA8
	Size: 0xF8
	Parameters: 2
	Flags: Private
	Line Number: 1584
*/
function private function_f9fad8b3(var_eeab9300, percent)
{
	self endon("disconnect");
	self endon("death");
	self endon("hash_f9fad8b3");
	start_time = GetTime();
	end_time = start_time + 1000;
	var_6d8b0ec7 = var_eeab9300;
	while(var_6d8b0ec7 > percent)
	{
		var_6d8b0ec7 = LerpFloat(percent, var_eeab9300, calc_remaining_duration_lerp(start_time, end_time));
		if(function_9ae7fa6d())
		{
			self clientfield::set_player_uimodel("bgb_timer", var_6d8b0ec7);
		}
		wait(0.05);
	}
}

/*
	Name: function_63a399b7
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4CA8
	Size: 0xC8
	Parameters: 1
	Flags: Private
	Line Number: 1613
*/
function private function_63a399b7(percent)
{
	self notify("hash_f9fad8b3");
	if(function_9ae7fa6d())
	{
		var_eeab9300 = self clientfield::get_player_uimodel("bgb_timer");
	}
	if(percent < var_eeab9300 && 0.1 <= var_eeab9300 - percent)
	{
		self thread function_f9fad8b3(var_eeab9300, percent);
	}
	else
	{
		self clientfield::set_player_uimodel("bgb_timer", percent);
	}
}

/*
	Name: function_497386b0
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4D78
	Size: 0x20
	Parameters: 0
	Flags: Private
	Line Number: 1640
*/
function private function_497386b0()
{
	self function_63a399b7(1);
}

/*
	Name: set_timer
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4DA0
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 1655
*/
function set_timer(current, max)
{
	self function_63a399b7(current / max);
}

/*
	Name: run_timer
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4DE0
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 1670
*/
function run_timer(max)
{
	self endon("disconnect");
	self endon("death");
	self notify("hash_40cdac02");
	self endon("hash_40cdac02");
	for(current = max; current > 0; current = max)
	{
		self set_timer(current, max);
		wait(0.05);
	}
	if(self is_enabled("zm_bgb_idle_eyes") || self is_enabled("zm_bgb_killing_time"))
	{
		self thread function_ba4bfefc();
	}
	else
	{
		self clear_timer();
		return;
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: clear_timer
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4EE8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 1704
*/
function clear_timer()
{
	self function_63a399b7(0);
	self notify("hash_40cdac02");
}

/*
	Name: function_ba4bfefc
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4F20
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1720
*/
function function_ba4bfefc()
{
	wait(0.048);
	if(self is_enabled("zm_bgb_idle_eyes") || self is_enabled("zm_bgb_killing_time"))
	{
		self function_63a399b7(1);
		self notify("hash_40cdac02");
	}
	else
	{
		self function_63a399b7(0);
		self notify("hash_40cdac02");
	}
}

/*
	Name: register
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x4FC8
	Size: 0x290
	Parameters: 7
	Flags: None
	Line Number: 1745
*/
function register(name, var_c9e64d65, limit, var_205ab425, var_f6f70764, validation_func, var_6fa3d682)
{
	if(function_9ae7fa6d())
	{
		level.bgb[name] = spawnstruct();
		level.bgb[name].name = name;
		level.bgb[name].var_c9e64d65 = var_c9e64d65;
		switch(name)
		{
			case "zm_bgb_killing_time":
			{
				limit = 2;
				break;
			}
			case "zm_bgb_in_plain_sight":
			{
				limit = 4;
				break;
			}
			case "zm_bgb_danger_closest":
			{
				limit = 20;
				break;
			}
			case "zm_bgb_licensed_contractor":
			{
				limit = 5;
				break;
			}
			case "zm_bgb_im_feelin_lucky":
			{
				limit = 5;
				break;
			}
			case "zm_bgb_phoenix_up":
			{
				validation_func = &function_ff644e58;
				var_6fa3d682 = &function_2a58b4e5;
				break;
			}
			case "zm_bgb_reign_drops":
			{
				var_6fa3d682 = &function_3e809c22;
				break;
			}
			case "zm_bgb_undead_man_walking":
			{
				var_f6f70764 = &take;
				level.bgb[name].var_50fe45f6 = 1;
				break;
			}
		}
		level.bgb[name].limit = limit;
		level.bgb[name].var_205ab425 = var_205ab425;
		level.bgb[name].var_f6f70764 = var_f6f70764;
		if("activated" == var_c9e64d65)
		{
			level.bgb[name].validation_func = validation_func;
			level.bgb[name].var_6fa3d682 = var_6fa3d682;
			level.bgb[name].var_336ffc4e = 0;
		}
		level.bgb[name].ref_count = 0;
	}
}

/*
	Name: function_3422638b
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x5260
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 1820
*/
function function_3422638b(name, var_d99aa464)
{
	/#
		/#
			Assert(isdefined(level.bgb[name]), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
		#/
	#/
	level.bgb[name].var_d99aa464 = var_d99aa464;
}

/*
	Name: function_e22c6124
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x52D8
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 1840
*/
function function_e22c6124(name, var_bfbb61c1)
{
	/#
		/#
			Assert(isdefined(level.bgb[name]), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
		#/
	#/
	level.bgb[name].var_bfbb61c1 = var_bfbb61c1;
}

/*
	Name: function_2b341a2e
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x5350
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 1860
*/
function function_2b341a2e(name, var_5c0ccc6f)
{
	/#
		/#
			Assert(isdefined(level.bgb[name]), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
		#/
	#/
	level.bgb[name].var_5c0ccc6f = var_5c0ccc6f;
}

/*
	Name: register_lost_perk_override
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x53C8
	Size: 0x98
	Parameters: 3
	Flags: None
	Line Number: 1880
*/
function register_lost_perk_override(name, lost_perk_override_func, lost_perk_override_func_always_run)
{
	/#
		/#
			Assert(isdefined(level.bgb[name]), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
		#/
	#/
	level.bgb[name].lost_perk_override_func = lost_perk_override_func;
	level.bgb[name].lost_perk_override_func_always_run = lost_perk_override_func_always_run;
}

/*
	Name: function_ff4b2998
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x5468
	Size: 0xB8
	Parameters: 3
	Flags: None
	Line Number: 1901
*/
function function_ff4b2998(name, var_e25efdfd, var_cdcc8fcd)
{
	/#
		/#
			Assert(isdefined(level.bgb[name]), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
		#/
	#/
	if(name == "zm_bgb_profit_sharing")
	{
		var_e25efdfd = &function_3b01b8c4;
	}
	level.bgb[name].var_e25efdfd = var_e25efdfd;
	level.bgb[name].var_cdcc8fcd = var_cdcc8fcd;
}

/*
	Name: function_3b01b8c4
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x5528
	Size: 0x290
	Parameters: 3
	Flags: None
	Line Number: 1926
*/
function function_3b01b8c4(n_points, str_awarded_by, var_1ed9bd9b)
{
	if(str_awarded_by == "zm_bgb_profit_sharing")
	{
		return n_points;
	}
	if(level.activePlayers.size == 1)
	{
		if("zm_bgb_profit_sharing" == self function_51fc7e9d())
		{
			self zm_score::add_to_player_score(n_points, 1, "zm_bgb_profit_sharing");
		}
	}
	switch(str_awarded_by)
	{
		case "bgb_machine_ghost_ball":
		case "equip_hacker":
		case "magicbox_bear":
		case "reviver":
		{
			return n_points;
			break;
		}
		default
		{
		}
	}
	if(!var_1ed9bd9b)
	{
		foreach(e_player in level.players)
		{
			if(isdefined(e_player) && "zm_bgb_profit_sharing" == e_player function_51fc7e9d())
			{
				if(isdefined(e_player.var_6638f10b) && Array::contains(e_player.var_6638f10b, self))
				{
					e_player thread zm_score::add_to_player_score(n_points, 1, "zm_bgb_profit_sharing");
				}
			}
		}
	}
	else if(isdefined(self.var_6638f10b) && self.var_6638f10b.size > 0)
	{
		foreach(e_player in self.var_6638f10b)
		{
			if(isdefined(e_player))
			{
				e_player thread zm_score::add_to_player_score(n_points, 1, "zm_bgb_profit_sharing");
			}
		}
	}
	return n_points;
}

/*
	Name: function_4cda71bf
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x57C0
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 1989
*/
function function_4cda71bf(name, var_7ca0e2a7)
{
	/#
		/#
			Assert(isdefined(level.bgb[name]), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
		#/
	#/
	level.bgb[name].var_7ca0e2a7 = var_7ca0e2a7;
}

/*
	Name: function_93da425
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x5838
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 2009
*/
function function_93da425(name, var_35e23ba2)
{
	/#
		/#
			Assert(isdefined(level.bgb[name]), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
		#/
	#/
	level.bgb[name].var_35e23ba2 = var_35e23ba2;
}

/*
	Name: function_2060b89
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x58B0
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 2029
*/
function function_2060b89(name)
{
	/#
		/#
			Assert(isdefined(level.bgb[name]), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
		#/
	#/
	level.bgb[name].var_50fe45f6 = 1;
}

/*
	Name: function_f132da9c
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x5920
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 2049
*/
function function_f132da9c(name)
{
	/#
		/#
			Assert(isdefined(level.bgb[name]), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
		#/
	#/
	level.bgb[name].var_7ea552f4 = 1;
}

/*
	Name: function_d35f60a1
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x5990
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 2069
*/
function function_d35f60a1(name)
{
	self give(name);
}

/*
	Name: function_be9d0730
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x59C0
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 2084
*/
function function_be9d0730(name)
{
	if(GetDvarInt("tfoption_gungame"))
	{
		switch(name)
		{
			case "zm_bgb_disorderly_combat":
			{
				return "none";
			}
			case "zm_bgb_extra_credit":
			{
				return "none";
			}
			case "zm_bgb_profit_sharing":
			{
				return "none";
			}
			case "zm_bgb_reign_drops":
			{
				return "none";
			}
			case "zm_bgb_round_robbin":
			{
				return "none";
			}
			case "zm_bgb_whos_keeping_score":
			{
				return "none";
			}
			case "zm_bgb_power_vacuum":
			{
				return "none";
			}
			default
			{
				return name;
			}
		}
	}
	return name;
}

/*
	Name: give
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x5A88
	Size: 0x2B0
	Parameters: 1
	Flags: None
	Line Number: 2137
*/
function give(name)
{
	if(!isdefined(name))
	{
		name = "none";
	}
	if(function_9ae7fa6d())
	{
		self thread take();
		if("none" == name)
		{
			return;
		}
		/#
			/#
				Assert(isdefined(level.bgb[name]), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
			#/
		#/
		self notify("hash_994d5e9e", name, self.bgb);
		self notify("bgb_update_give_" + name);
		self.bgb = name;
		self clientfield::set_player_uimodel("bgb_current", level.bgb[name].item_index);
		self LUINotifyEvent(&"zombie_bgb_notification", 1, level.bgb[name].item_index);
		if(isdefined(level.bgb[name].var_205ab425))
		{
			self thread [[level.bgb[name].var_205ab425]]();
		}
		if(isdefined("activated" == level.bgb[name].var_c9e64d65))
		{
			self function_1e12cfb2("bgb");
		}
		self thread function_f8dba1d1();
		self thread function_7ad7537e();
		if(isdefined(level.bgb[name]))
		{
			statsTableName = util::getStatsTableName();
			var_cf70582a = tableLookup(statsTableName, 0, level.bgb[name].item_index, 3);
			thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦" + "â¦SUBEVENT_GOTWPâ¦ â¦" + var_cf70582a + "â¦â¦SUBEVENT_DOTâ¦");
		}
	}
}

/*
	Name: take
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x5D40
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 2189
*/
function take()
{
	if(function_9ae7fa6d())
	{
		if("none" == self.bgb)
		{
			return;
		}
		self function_1e12cfb2("");
		self thread function_b33a98c7("none");
		if(isdefined(level.bgb[self.bgb].var_f6f70764))
		{
			self thread [[level.bgb[self.bgb].var_f6f70764]]();
		}
		self function_3fe79b9();
		self notify("hash_994d5e9e", "none", self.bgb);
		self notify("bgb_update_take_" + self.bgb);
		self.bgb = "none";
	}
}

/*
	Name: function_51fc7e9d
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x5E50
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 2220
*/
function function_51fc7e9d()
{
	return self.bgb;
}

/*
	Name: is_enabled
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x5E68
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 2235
*/
function is_enabled(name)
{
	/#
		/#
			Assert(isdefined(self.bgb));
		#/
	#/
	if(isdefined(self.bgb))
	{
		return self.bgb == name;
	}
	return 0;
}

/*
	Name: function_58be9c43
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x5EC0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 2259
*/
function function_58be9c43()
{
	/#
		/#
			Assert(isdefined(self.bgb));
		#/
	#/
	return self.bgb !== "none";
	~;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: is_team_enabled
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x5F08
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 2281
*/
function is_team_enabled(str_name)
{
	foreach(player in level.players)
	{
		/#
			/#
				Assert(isdefined(player.bgb));
			#/
		#/
		if(player.bgb == str_name)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: get_player_dropped_powerup_origin
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x5FE0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 2308
*/
function get_player_dropped_powerup_origin()
{
	var_587cd8a0 = self.origin + VectorScale(AnglesToForward(self.angles), 60) + VectorScale((0, 0, 1), 5);
	self zm_stats::increment_challenge_stat("GUM_GOBBLER_POWERUPS");
	return var_587cd8a0;
}

/*
	Name: function_fd8f9131
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x6048
	Size: 0x608
	Parameters: 1
	Flags: None
	Line Number: 2325
*/
function function_fd8f9131(powerup)
{
	playable_area = GetEntArray("player_volume", "script_noteworthy");
	if(isdefined(level.activePlayers) && level.activePlayers.size > 0)
	{
		player = ArrayGetClosest(powerup.origin, level.activePlayers);
		playable_area = ArraySortClosest(playable_area, player.origin);
		foreach(area in playable_area)
		{
			if(zm_zonemgr::zone_is_enabled(area.targetname))
			{
				nd_closest = area;
				break;
			}
		}
	}
	else
	{
		playable_area = ArraySortClosest(playable_area, powerup.origin);
		foreach(area in playable_area)
		{
			if(zm_zonemgr::zone_is_enabled(area.targetname))
			{
				nd_closest = area;
				break;
			}
		}
	}
	if(!isdefined(nd_closest))
	{
		return;
	}
	var_cad2d1bb = (0, RandomFloatRange(-179, 179), 0);
	if(isdefined(player))
	{
		player_eye = player GetEye();
		trace = GroundTrace(player_eye, nd_closest.origin + AnglesToForward(var_cad2d1bb) * RandomFloatRange(80, 200), 0, player);
		origin = trace["position"];
		origin = origin + AnglesToForward(VectorToAngles(player_eye - origin)) * 60;
	}
	else
	{
		trace = GroundTrace(nd_closest.origin, nd_closest.origin + AnglesToForward(var_cad2d1bb) * RandomFloatRange(80, 300), 0, powerup);
		origin = trace["position"];
		origin = origin + AnglesToForward(VectorToAngles(nd_closest.origin - origin)) * 60;
	}
	trace = GroundTrace(origin, origin - VectorScale((0, 0, 1), 100000), 0, powerup);
	if(Distance(trace["position"], nd_closest.origin) > 3000)
	{
		trace = GroundTrace(nd_closest.origin, nd_closest.origin - VectorScale((0, 0, 1), 100000), 0, powerup);
	}
	navmesh = GetClosestPointOnNavMesh(trace["position"]);
	if(isdefined(navmesh))
	{
		var_589ced30 = navmesh + VectorScale((0, 0, 1), 40);
	}
	else
	{
		var_589ced30 = trace["position"] + VectorScale((0, 0, 1), 40);
	}
	var_8a69f8c0 = DistanceSquared(var_589ced30, powerup.origin);
	n_travel_time = math::linear_map(var_8a69f8c0, 100, 250000, 0.1, 3);
	if(n_travel_time <= 0.5)
	{
		n_accel = 0;
	}
	else
	{
		n_accel = 0.25;
	}
	powerup.var_5c641a8f = 1;
	powerup moveto(var_589ced30, n_travel_time, n_accel, n_accel);
	wait(n_travel_time);
	powerup.var_5c641a8f = undefined;
}

/*
	Name: function_6aed371b
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x6658
	Size: 0x118
	Parameters: 2
	Flags: None
	Line Number: 2411
*/
function function_6aed371b(powerup, origin)
{
	var_589ced30 = origin + VectorScale((0, 0, 1), 40);
	var_8a69f8c0 = DistanceSquared(var_589ced30, powerup.origin);
	n_travel_time = math::linear_map(var_8a69f8c0, 100, 250000, 0.1, 3);
	if(n_travel_time <= 0.5)
	{
		n_accel = 0;
	}
	else
	{
		n_accel = 0.25;
	}
	powerup.var_5c641a8f = 1;
	powerup moveto(var_589ced30, n_travel_time, n_accel, n_accel);
	wait(n_travel_time);
	powerup.var_5c641a8f = undefined;
}

/*
	Name: function_dea74fb0
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x6778
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 2440
*/
function function_dea74fb0(str_powerup, v_origin)
{
	if(!isdefined(v_origin))
	{
		v_origin = self get_player_dropped_powerup_origin();
	}
	powerup = zm_powerups::function_5240fdfe(str_powerup, v_origin, undefined, undefined, undefined, undefined, undefined, 1);
	if(powerup.powerup_name == "bonus_points_player")
	{
		powerup.bonus_points_powerup_override = &namespace_828507ab::function_3258dd42;
	}
	level thread function_fcf134ab(powerup);
}

/*
	Name: function_fcf134ab
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x6848
	Size: 0x1D8
	Parameters: 1
	Flags: None
	Line Number: 2464
*/
function function_fcf134ab(powerup)
{
	if(isdefined(powerup))
	{
		powerup endon("death");
		if(!powerup zm::in_enabled_playable_area() && !powerup zm::in_life_brush())
		{
			function_fd8f9131(powerup);
		}
		else
		{
			trace = beamtrace(powerup.origin + VectorScale((0, 0, 1), 20), powerup.origin - VectorScale((0, 0, 1), 10000), 0, powerup);
			if(Distance(trace["position"], powerup.origin) > 55)
			{
				function_6aed371b(powerup, trace["position"]);
				if(!powerup zm::in_enabled_playable_area() && !powerup zm::in_life_brush())
				{
					function_fd8f9131(powerup);
				}
			}
			else if(Distance(trace["position"], powerup.origin) < 40)
			{
				function_6aed371b(powerup, trace["position"]);
			}
		}
	}
}

/*
	Name: function_434235f9
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x6A28
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 2502
*/
function function_434235f9(powerup)
{
	function_fcf134ab(powerup);
}

/*
	Name: actor_damage_override
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x6A58
	Size: 0x150
	Parameters: 12
	Flags: None
	Line Number: 2517
*/
function actor_damage_override(inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return damage;
	}
	if(isPlayer(attacker))
	{
		name = attacker function_51fc7e9d();
		if(name !== "none" && isdefined(level.bgb[name]) && isdefined(level.bgb[name].var_d99aa464))
		{
			damage = [[level.bgb[name].var_d99aa464]](inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType);
		}
	}
	return damage;
}

/*
	Name: vehicle_damage_override
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x6BB0
	Size: 0x178
	Parameters: 15
	Flags: None
	Line Number: 2544
*/
function vehicle_damage_override(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, modelIndex, partName, vSurfaceNormal)
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return iDamage;
	}
	if(isPlayer(eAttacker))
	{
		name = eAttacker function_51fc7e9d();
		if(name !== "none" && isdefined(level.bgb[name]) && isdefined(level.bgb[name].var_bfbb61c1))
		{
			iDamage = [[level.bgb[name].var_bfbb61c1]](eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, modelIndex, partName, vSurfaceNormal);
		}
	}
	return iDamage;
}

/*
	Name: actor_death_override
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x6D30
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 2571
*/
function actor_death_override(attacker)
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return 0;
	}
	if(isPlayer(attacker))
	{
		name = attacker function_51fc7e9d();
		if(name !== "none" && isdefined(level.bgb[name]) && isdefined(level.bgb[name].var_5c0ccc6f))
		{
			damage = [[level.bgb[name].var_5c0ccc6f]](attacker);
		}
	}
	return damage;
}

/*
	Name: lost_perk_override
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x6E10
	Size: 0x258
	Parameters: 1
	Flags: None
	Line Number: 2598
*/
function lost_perk_override(perk)
{
	b_result = 0;
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return b_result;
	}
	if(!(isdefined(self.laststand) && self.laststand))
	{
		return b_result;
	}
	keys = getArrayKeys(level.bgb);
	for(i = 0; i < keys.size; i++)
	{
		name = keys[i];
		if(isdefined(level.bgb[name].lost_perk_override_func_always_run) && level.bgb[name].lost_perk_override_func_always_run && isdefined(level.bgb[name].lost_perk_override_func))
		{
			b_result = [[level.bgb[name].lost_perk_override_func]](perk, self, undefined);
			if(b_result)
			{
				return b_result;
			}
		}
	}
	foreach(player in level.activePlayers)
	{
		name = player function_51fc7e9d();
		if(name !== "none" && isdefined(level.bgb[name]) && isdefined(level.bgb[name].lost_perk_override_func))
		{
			b_result = [[level.bgb[name].lost_perk_override_func]](perk, self, player);
			if(b_result)
			{
				return b_result;
			}
		}
	}
	return b_result;
}

/*
	Name: add_to_player_score_override
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x7070
	Size: 0x1C8
	Parameters: 2
	Flags: None
	Line Number: 2647
*/
function add_to_player_score_override(n_points, str_awarded_by)
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return n_points;
	}
	var_8b4008d0 = self function_51fc7e9d();
	keys = getArrayKeys(level.bgb);
	for(i = 0; i < keys.size; i++)
	{
		var_23359ff6 = keys[i];
		if(var_23359ff6 === var_8b4008d0)
		{
			continue;
		}
		if(isdefined(level.bgb[var_23359ff6].var_cdcc8fcd) && level.bgb[var_23359ff6].var_cdcc8fcd && isdefined(level.bgb[var_23359ff6].var_e25efdfd))
		{
			n_points = [[level.bgb[var_23359ff6].var_e25efdfd]](n_points, str_awarded_by, 0);
		}
	}
	if(var_8b4008d0 !== "none" && isdefined(level.bgb[var_8b4008d0]) && isdefined(level.bgb[var_8b4008d0].var_e25efdfd))
	{
		n_points = [[level.bgb[var_8b4008d0].var_e25efdfd]](n_points, str_awarded_by, 1);
	}
	return n_points;
}

/*
	Name: function_d51db887
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x7240
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 2684
*/
function function_d51db887()
{
	keys = Array::randomize(getArrayKeys(level.bgb));
	for(i = 0; i < keys.size; i++)
	{
		if(level.bgb[keys[i]].var_d277f374 != 1)
		{
			continue;
		}
		if(level.bgb[keys[i]].var_b9af356d > 0)
		{
			continue;
		}
		return keys[i];
	}
}

/*
	Name: function_4ed517b9
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x7310
	Size: 0x218
	Parameters: 3
	Flags: None
	Line Number: 2711
*/
function function_4ed517b9(n_max_distance, var_98a3e738, var_287a7adb)
{
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	self endon("hash_994d5e9e");
	self.var_6638f10b = [];
	while(1)
	{
		foreach(e_player in level.players)
		{
			if(e_player == self)
			{
				continue;
			}
			Array::remove_undefined(self.var_6638f10b);
			var_368e2240 = Array::contains(self.var_6638f10b, e_player);
			var_50fd5a04 = zm_utility::is_player_valid(e_player, 0, 1) && function_2469cfe8(n_max_distance, self, e_player);
			if(!var_368e2240 && var_50fd5a04)
			{
				Array::add(self.var_6638f10b, e_player, 0);
				if(isdefined(var_98a3e738))
				{
					self thread [[var_98a3e738]](e_player);
					continue;
				}
			}
			if(var_368e2240 && !var_50fd5a04)
			{
				ArrayRemoveValue(self.var_6638f10b, e_player);
				if(isdefined(var_287a7adb))
				{
					self thread [[var_287a7adb]](e_player);
				}
			}
		}
		wait(0.05);
	}
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2469cfe8
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x7530
	Size: 0x80
	Parameters: 3
	Flags: Private
	Line Number: 2764
*/
function private function_2469cfe8(n_distance, var_d21815c4, var_441f84ff)
{
	var_31dc18aa = n_distance * n_distance;
	var_2931dc75 = DistanceSquared(var_d21815c4.origin, var_441f84ff.origin);
	if(var_2931dc75 <= var_31dc18aa)
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ca189700
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x75B8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 2786
*/
function function_ca189700()
{
	if(function_9ae7fa6d())
	{
		self clientfield::increment_uimodel("bgb_invalid_use");
		self playlocalsound("zmb_bgb_deny_plr");
	}
}

/*
	Name: suspend_weapon_cycling
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x7618
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2805
*/
function suspend_weapon_cycling()
{
	self flag::clear("bgb_weapon_cycling");
}

/*
	Name: resume_weapon_cycling
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x7648
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2820
*/
function resume_weapon_cycling()
{
	self flag::set("bgb_weapon_cycling");
}

/*
	Name: function_959ccfd0
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x7678
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 2835
*/
function function_959ccfd0()
{
	if(!self flag::exists("bgb_weapon_cycling"))
	{
		self flag::init("bgb_weapon_cycling");
	}
	self flag::set("bgb_weapon_cycling");
}

/*
	Name: function_378bff5d
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x76E8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2854
*/
function function_378bff5d()
{
	self flag::wait_till("bgb_weapon_cycling");
	return;
}

/*
	Name: function_41ed378b
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x7718
	Size: 0x1B8
	Parameters: 1
	Flags: None
	Line Number: 2870
*/
function function_41ed378b(perk)
{
	self notify("revive_and_return_perk_on_bgb_activation" + perk);
	self endon("revive_and_return_perk_on_bgb_activation" + perk);
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	if(perk == "specialty_widowswine")
	{
		var_376ad33c = self GetWeaponAmmoClip(self.current_lethal_grenade);
	}
	self waittill("player_revived", e_reviver);
	if(isdefined(self.var_df0decf1) && self.var_df0decf1 || (isdefined(e_reviver) && (isdefined(self.bgb) && self is_enabled("zm_bgb_near_death_experience")) || (isdefined(e_reviver.bgb) && e_reviver is_enabled("zm_bgb_near_death_experience"))))
	{
		if(zm_perks::use_solo_revive() && perk == "specialty_quickrevive")
		{
			level.solo_game_free_player_quickrevive = 1;
		}
		wait(0.05);
		self thread zm_perks::give_perk(perk, 0);
		if(perk == "specialty_widowswine" && isdefined(var_376ad33c))
		{
			self SetWeaponAmmoClip(self.current_lethal_grenade, var_376ad33c);
		}
	}
}

/*
	Name: bgb_revive_watcher
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x78D8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 2907
*/
function bgb_revive_watcher()
{
	self endon("disconnect");
	self endon("death");
	self endon("death");
	self.var_df0decf1 = 1;
	self waittill("player_revived", e_reviver);
	wait(0.05);
	if(isdefined(self.var_df0decf1) && self.var_df0decf1)
	{
		self notify("bgb_revive");
		self.var_df0decf1 = undefined;
	}
}

/*
	Name: function_9ae7fa6d
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x7960
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 2932
*/
function function_9ae7fa6d()
{
	if(GetDvarString("ui_mapname") == "2948041413")
	{
		return 0;
	}
	if(GetDvarInt("com_maxclients") > 5)
	{
		return 0;
	}
	else
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_1e12cfb2
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x79C8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 2959
*/
function function_1e12cfb2(ACTION)
{
	if(level.script == "zm_leviathan")
	{
	}
	else
	{
		self SetActionSlot(1, ACTION);
	}
}

/*
	Name: function_762ace8f
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x7A18
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 2980
*/
function function_762ace8f()
{
	if(self laststand::player_is_in_laststand())
	{
		return self useButtonPressed();
	}
	return self ActionSlotOneButtonPressed();
}

/*
	Name: function_cb7cc5a6
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x7A70
	Size: 0x248
	Parameters: 0
	Flags: Private
	Line Number: 2999
*/
function private function_cb7cc5a6()
{
	self endon("disconnect");
	self endon("death");
	self notify("hash_d701de2e");
	self endon("hash_d701de2e");
	if(level.script == "zm_leviathan" || level.script == "zm_daybreak")
	{
		self thread zm_equipment::show_hint_text("^3[{+actionslot 4}]^7 " + MakeLocalizedString("MENU_USE_GOBBLEGUM"), 8);
		var_e40c3375 = 1;
	}
	var_948241a0 = 1;
	while(1)
	{
		wait(0.05);
		if(isdefined(var_e40c3375))
		{
			while(self ActionSlotFourButtonPressed())
			{
				wait(0.05);
			}
			while(!self ActionSlotFourButtonPressed() || self IsSwitchingWeapons())
			{
				wait(0.05);
			}
		}
		else
		{
			wait(0.05);
			while(!self function_762ace8f() || self IsSwitchingWeapons())
			{
				wait(0.05);
			}
		}
		while(self function_762ace8f())
		{
		}
		if(self GetCurrentWeapon() == level.var_c92b3b33 || self GetCurrentWeapon() == level.var_adfa48c4)
		{
			continue;
		}
		if(!self function_a2fbdf5b(0))
		{
			continue;
		}
		if(self bgb_gumball_anim(self.bgb, 1, var_948241a0))
		{
			var_948241a0 = 0;
			self notify("hash_20e4f529", self.bgb);
		}
	}
}

/*
	Name: function_ff644e58
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x7CC0
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 3062
*/
function function_ff644e58()
{
	players = level.players;
	foreach(player in players)
	{
		if(isdefined(player.var_df0decf1) && player.var_df0decf1)
		{
			return 0;
		}
		if(isdefined(level.var_11b06c2f) && self [[level.var_11b06c2f]](player, 1, 1))
		{
			return 1;
		}
		if(player laststand::player_is_in_laststand())
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_2a58b4e5
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x7DD0
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 3093
*/
function function_2a58b4e5()
{
	playsoundatposition("zmb_bgb_phoenix_activate", (0, 0, 0));
	if(level.activePlayers.size == 1)
	{
		level.activePlayers[0] thread bgb_revive_watcher();
		level.activePlayers[0] zm_laststand::auto_revive(level, 0);
		return;
	}
	foreach(player in level.activePlayers)
	{
		if(player laststand::player_is_in_laststand())
		{
			player thread bgb_revive_watcher();
			player zm_laststand::auto_revive(self, 0);
		}
	}
}

/*
	Name: function_3e809c22
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x7F10
	Size: 0x204
	Parameters: 0
	Flags: None
	Line Number: 3122
*/
function function_3e809c22()
{
	self endon("disconnect");
	self endon("bled_out");
	util::wait_network_frame(1);
	level function_dea74fb0("bonus_points_player", self namespace_7084af67::function_ed573cc2(1));
	level function_dea74fb0("double_points", self namespace_7084af67::function_ed573cc2(2));
	level function_dea74fb0("carpenter", self namespace_7084af67::function_ed573cc2(3));
	level function_dea74fb0("free_perk", self namespace_7084af67::function_ed573cc2(4));
	level function_dea74fb0("full_ammo", self namespace_7084af67::function_ed573cc2(5));
	level function_dea74fb0("insta_kill", self namespace_7084af67::function_ed573cc2(6));
	level function_dea74fb0("fire_sale", self namespace_7084af67::function_ed573cc2(7));
	level function_dea74fb0("minigun", self namespace_7084af67::function_ed573cc2(8));
	level function_dea74fb0("nuke", self namespace_7084af67::function_ed573cc2(9));
	self.var_b90dda44 = 1;
	self thread namespace_7084af67::function_7892610e();
}

