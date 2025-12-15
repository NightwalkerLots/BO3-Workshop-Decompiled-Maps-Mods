#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_bgb_machine;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_utility;
#include scripts\zm\gametypes\_zm_gametype;
#include scripts\zm\zmsavedata;

#namespace namespace_5b1d8f08;

/*
	Name: __init__
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0xD40
	Size: 0xA0
	Parameters: 0
	Flags: AutoExec
	Line Number: 28
*/
function autoexec __init__()
{
	level thread callback::on_spawned(&on_player_spawned);
	level thread function_1c1ddca4();
	level thread function_78414713();
	level thread function_8d8e07b3();
	level thread function_b1a9bd43();
	level thread function_d46d2da4();
}

/*
	Name: __main__
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0xDE8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function __main__()
{
}

/*
	Name: function_b1a9bd43
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0xDF8
	Size: 0xA18
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function function_b1a9bd43()
{
	level.var_2b00b5c5 = [];
	level.var_2b00b5c5[level.var_2b00b5c5.size] = "zm_bgb_eye_candy";
	level.var_2b00b5c5[level.var_2b00b5c5.size] = "zm_bgb_projectile_vomiting";
	level.var_2b00b5c5[level.var_2b00b5c5.size] = "zm_bgb_newtonian_negation";
	level.var_2b00b5c5[level.var_2b00b5c5.size] = "zm_bgb_tone_death";
	level.var_69876332 = [];
	level.var_69876332[level.var_69876332.size] = "zm_bgb_sword_flay";
	level.var_69876332[level.var_69876332.size] = "zm_bgb_alchemical_antithesis";
	level.var_69876332[level.var_69876332.size] = "zm_bgb_lucky_crit";
	level.var_69876332[level.var_69876332.size] = "zm_bgb_always_done_swiftly";
	level.var_69876332[level.var_69876332.size] = "zm_bgb_anywhere_but_here";
	level.var_69876332[level.var_69876332.size] = "zm_bgb_armamental_accomplishment";
	level.var_69876332[level.var_69876332.size] = "zm_bgb_arsenal_accelerator";
	level.var_69876332[level.var_69876332.size] = "zm_bgb_danger_closest";
	level.var_69876332[level.var_69876332.size] = "zm_bgb_firing_on_all_cylinders";
	level.var_69876332[level.var_69876332.size] = "zm_bgb_in_plain_sight";
	level.var_69876332[level.var_69876332.size] = "zm_bgb_stock_option";
	level.var_69876332[level.var_69876332.size] = "zm_bgb_coagulant";
	level.var_69876332[level.var_69876332.size] = "zm_bgb_arms_grace";
	level.var_69876332[level.var_69876332.size] = "zm_bgb_impatient";
	level.var_69876332[level.var_69876332.size] = "zm_bgb_now_you_see_me";
	level.var_9360c422 = [];
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_burned_out";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_aftertaste";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_board_games";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_board_to_death";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_crawl_space";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_dead_of_nuclear_winter";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_disorderly_combat";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_ephemeral_enhancement";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_fatal_contraption";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_idle_eyes";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_im_feelin_lucky";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_immolation_liquidation";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_kill_joy";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_licensed_contractor";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_mind_blown";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_respin_cycle";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_slaughter_slide";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_unquenchable";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_whos_keeping_score";
	level.var_9360c422[level.var_9360c422.size] = "zm_bgb_phoenix_up";
	level.var_6c2ae014 = [];
	level.var_6c2ae014[level.var_6c2ae014.size] = "zm_bgb_temporal_gift";
	level.var_6c2ae014[level.var_6c2ae014.size] = "zm_bgb_undead_man_walking";
	level.var_6c2ae014[level.var_6c2ae014.size] = "zm_bgb_on_the_house";
	level.var_6c2ae014[level.var_6c2ae014.size] = "zm_bgb_extra_credit";
	level.var_6c2ae014[level.var_6c2ae014.size] = "zm_bgb_bullet_boost";
	level.var_6c2ae014[level.var_6c2ae014.size] = "zm_bgb_cache_back";
	level.var_6c2ae014[level.var_6c2ae014.size] = "zm_bgb_crate_power";
	level.var_6c2ae014[level.var_6c2ae014.size] = "zm_bgb_fear_in_headlights";
	level.var_6c2ae014[level.var_6c2ae014.size] = "zm_bgb_soda_fountain";
	level.var_6c2ae014[level.var_6c2ae014.size] = "zm_bgb_wall_power";
	level.var_23fb938c = [];
	level.var_23fb938c[level.var_23fb938c.size] = "zm_bgb_head_drama";
	level.var_23fb938c[level.var_23fb938c.size] = "zm_bgb_killing_time";
	level.var_23fb938c[level.var_23fb938c.size] = "zm_bgb_perkaholic";
	level.var_23fb938c[level.var_23fb938c.size] = "zm_bgb_power_vacuum";
	level.var_23fb938c[level.var_23fb938c.size] = "zm_bgb_reign_drops";
	level.var_23fb938c[level.var_23fb938c.size] = "zm_bgb_round_robbin";
	level.var_23fb938c[level.var_23fb938c.size] = "zm_bgb_secret_shopper";
	level.var_23fb938c[level.var_23fb938c.size] = "zm_bgb_self_medication";
	level.var_23fb938c[level.var_23fb938c.size] = "zm_bgb_shopping_free";
	level.var_23fb938c[level.var_23fb938c.size] = "zm_bgb_profit_sharing";
	level.var_23fb938c[level.var_23fb938c.size] = "zm_bgb_near_death_experience";
	level.var_327c65fb = [];
	level.var_327c65fb[level.var_327c65fb.size] = "zm_bgb_flatulence_fulmination";
	level.var_327c65fb[level.var_327c65fb.size] = "zm_bgb_on_a_whim";
	level.var_327c65fb[level.var_327c65fb.size] = "zm_bgb_play_it_again_sam";
	level.var_327c65fb[level.var_327c65fb.size] = "zm_bgb_quacknarok";
	level.var_327c65fb[level.var_327c65fb.size] = "zm_bgb_bearly_alive";
	level.var_327c65fb[level.var_327c65fb.size] = "zm_bgb_prismatic_touch";
	level.var_46f5f47c = [];
	level.var_46f5f47c[level.var_46f5f47c.size] = "zm_bgb_nowhere_but_there";
	level.var_46f5f47c[level.var_46f5f47c.size] = "zm_bgb_point_drops";
	level.var_75222064 = [];
	level.var_75222064[level.var_75222064.size] = "zm_bgb_malevolent_presence";
	level.var_75222064[level.var_75222064.size] = "zm_bgb_power_to_the_people";
	level.var_75222064[level.var_75222064.size] = "zm_bgb_shields_up";
	level.var_75222064[level.var_75222064.size] = "zm_bgb_chilling_conclusion";
	level.var_75222064[level.var_75222064.size] = "zm_bgb_ctrl_z";
	level.var_75222064[level.var_75222064.size] = "zm_bgb_disorientated_distance";
	level.var_f8f06d9a = [];
	level.var_f8f06d9a[level.var_f8f06d9a.size] = "zm_bgb_arbitrary_armament";
	level.var_f8f06d9a[level.var_f8f06d9a.size] = "zm_bgb_here_they_rise";
	level.var_f8f06d9a[level.var_f8f06d9a.size] = "zm_bgb_next_rounds_on_me";
	level.var_f8f06d9a[level.var_f8f06d9a.size] = "zm_bgb_power_keg";
	level.var_f8f06d9a[level.var_f8f06d9a.size] = "zm_bgb_sucker_points";
	level.var_f8f06d9a[level.var_f8f06d9a.size] = "zm_bgb_bottomless_bullets";
	level.var_f8f06d9a[level.var_f8f06d9a.size] = "zm_bgb_conflagration_liquidation";
	level.var_f8f06d9a[level.var_f8f06d9a.size] = "zm_bgb_firearm_formulation";
	level.var_f8f06d9a[level.var_f8f06d9a.size] = "zm_bgb_join_the_party";
	level.var_9356501a = [];
	level.var_9356501a[level.var_9356501a.size] = "zm_bgb_miraculous_box";
	level.var_9356501a[level.var_9356501a.size] = "zm_bgb_armoured_up";
	level.var_9356501a[level.var_9356501a.size] = "zm_bgb_bullet_bucks";
	level.var_9356501a[level.var_9356501a.size] = "zm_bgb_exceptionally_equipped";
	level.var_9356501a[level.var_9356501a.size] = "zm_bgb_expenditure_exemption";
	level.var_9356501a[level.var_9356501a.size] = "zm_bgb_mighty_midas";
}

/*
	Name: function_d46d2da4
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x1818
	Size: 0x318
	Parameters: 0
	Flags: None
	Line Number: 175
*/
function function_d46d2da4()
{
	wait(1);
	level flag::wait_till("initial_blackscreen_passed");
	var_a95e1085 = [];
	refs = [];
	index = 1;
	for(row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index); isdefined(row); row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index))
	{
		var_71832171 = 0;
		var_803e329f = checkStringValid(row[2]);
		if(var_803e329f == "bubblegum" || var_803e329f == "bubblegum_consumable")
		{
			var_71832171 = 1;
		}
		var_d277f374 = Int(row[16]);
		var_a0ec4ef3 = checkStringValid(row[4]);
		if(isdefined(var_a0ec4ef3) && var_71832171)
		{
			var_a95e1085[var_a95e1085.size] = var_a0ec4ef3;
			refs[refs.size] = Int(row[0]);
		}
		index++;
	}
	for(i = 0; i < var_a95e1085.size; i++)
	{
		level.bgb[var_a95e1085[i]].item_index = refs[i];
		level.bgb[var_a95e1085[i]].var_d277f374 = Int(tableLookup("gamedata/stats/zm/zm_statstable.csv", 0, level.bgb[var_a95e1085[i]].item_index, 16));
		level.bgb[var_a95e1085[i]].var_e0715b48 = 0;
		level.bgb[var_a95e1085[i]].camo_index = Int(tableLookup("gamedata/stats/zm/zm_statstable.csv", 0, level.bgb[var_a95e1085[i]].item_index, 5));
		level.bgb[var_a95e1085[i]].var_b9af356d = 0;
	}
}

/*
	Name: function_17afeda7
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x1B38
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 219
*/
function function_17afeda7()
{
	self endon("disconnect");
	wait(2);
	level flag::wait_till("initial_blackscreen_passed");
	self.var_e610f362 = [];
}

/*
	Name: function_8d8e07b3
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x1B80
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 237
*/
function function_8d8e07b3()
{
	while(1)
	{
		level waittill("end_of_round");
		foreach(player in GetPlayers())
		{
			player notify("hash_33a40cb");
		}
	}
	return;
	~;
}

/*
	Name: on_player_spawned
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x1C30
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 261
*/
function on_player_spawned()
{
	self thread function_9fc09a56();
	self thread function_17afeda7();
}

/*
	Name: function_47a2dced
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x1C70
	Size: 0x240
	Parameters: 1
	Flags: None
	Line Number: 277
*/
function function_47a2dced(var_f86554d7)
{
	if(!isdefined(level.bgb[var_f86554d7]))
	{
		IPrintLnBold(var_f86554d7 + " was disabled by map");
	}
	if(var_f86554d7 == "zm_bgb_nowhere_but_there" && namespace_11e193f1::function_6dd41714("gamemode_gumgame_nbt") == 1)
	{
		return 0;
	}
	if(var_f86554d7 == "zm_bgb_shields_up" && namespace_11e193f1::function_6dd41714("gamemode_gumgame_shields_up") == 1)
	{
		return 0;
	}
	if(var_f86554d7 == "zm_bgb_point_drops" && namespace_11e193f1::function_6dd41714("gamemode_gumgame_point_drop") == 1)
	{
		return 0;
	}
	if(var_f86554d7 == "zm_bgb_perkaholic" && namespace_11e193f1::function_6dd41714("gamemode_gumgame_perka") == 1)
	{
		return 0;
	}
	if(level.bgb[var_f86554d7].var_c9e64d65 == "rounds" && namespace_11e193f1::function_6dd41714("gamemode_gumgame_blue") == 1)
	{
		return 0;
	}
	if(level.bgb[var_f86554d7].var_c9e64d65 == "time" && namespace_11e193f1::function_6dd41714("gamemode_gumgame_green") == 1)
	{
		return 0;
	}
	if(level.bgb[var_f86554d7].var_c9e64d65 == "event" && namespace_11e193f1::function_6dd41714("gamemode_gumgame_orange") == 1)
	{
		return 0;
	}
	if(level.bgb[var_f86554d7].var_c9e64d65 == "activated" && namespace_11e193f1::function_6dd41714("gamemode_gumgame_purple") == 1)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_1c1ddca4
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x1EB8
	Size: 0x680
	Parameters: 0
	Flags: None
	Line Number: 328
*/
function function_1c1ddca4()
{
	wait(2);
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_enabled") == 0)
	{
		return;
	}
	level.var_230b3923 = [];
	if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_whimsical") == 0)
	{
		for(i = 0; i < level.var_2b00b5c5.size; i++)
		{
			if(function_47a2dced(level.var_2b00b5c5[i]))
			{
				level.var_230b3923[level.var_230b3923.size] = level.var_2b00b5c5[i];
			}
		}
		wait(0.1);
		if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_custom") == 0)
		{
			for(i = 0; i < level.var_327c65fb.size; i++)
			{
				if(function_47a2dced(level.var_327c65fb[i]))
				{
					level.var_230b3923[level.var_230b3923.size] = level.var_327c65fb[i];
				}
			}
		}
	}
	wait(0.1);
	if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_classics") == 0)
	{
		for(i = 0; i < level.var_69876332.size; i++)
		{
			if(function_47a2dced(level.var_69876332[i]))
			{
				level.var_230b3923[level.var_230b3923.size] = level.var_69876332[i];
			}
		}
		wait(0.1);
		if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_custom") == 0)
		{
			for(i = 0; i < level.var_46f5f47c.size; i++)
			{
				if(function_47a2dced(level.var_46f5f47c[i]))
				{
					level.var_230b3923[level.var_230b3923.size] = level.var_46f5f47c[i];
				}
			}
		}
	}
	wait(0.1);
	if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_mega") == 0)
	{
		for(i = 0; i < level.var_9360c422.size; i++)
		{
			if(function_47a2dced(level.var_9360c422[i]))
			{
				level.var_230b3923[level.var_230b3923.size] = level.var_9360c422[i];
			}
		}
		wait(0.1);
		if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_custom") == 0)
		{
			for(i = 0; i < level.var_75222064.size; i++)
			{
				if(function_47a2dced(level.var_75222064[i]))
				{
					level.var_230b3923[level.var_230b3923.size] = level.var_75222064[i];
				}
			}
		}
	}
	wait(0.1);
	if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_rare") == 0)
	{
		for(i = 0; i < level.var_6c2ae014.size; i++)
		{
			if(function_47a2dced(level.var_6c2ae014[i]))
			{
				level.var_230b3923[level.var_230b3923.size] = level.var_6c2ae014[i];
			}
		}
		wait(0.1);
		if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_custom") == 0)
		{
			for(i = 0; i < level.var_f8f06d9a.size; i++)
			{
				if(function_47a2dced(level.var_f8f06d9a[i]))
				{
					level.var_230b3923[level.var_230b3923.size] = level.var_f8f06d9a[i];
				}
			}
		}
	}
	wait(0.1);
	if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_ultra") == 0)
	{
		for(i = 0; i < level.var_23fb938c.size; i++)
		{
			if(function_47a2dced(level.var_23fb938c[i]))
			{
				level.var_230b3923[level.var_230b3923.size] = level.var_23fb938c[i];
			}
		}
		wait(0.1);
		if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_custom") == 0)
		{
			for(i = 0; i < level.var_9356501a.size; i++)
			{
				if(function_47a2dced(level.var_9356501a[i]))
				{
					level.var_230b3923[level.var_230b3923.size] = level.var_9356501a[i];
				}
			}
		}
	}
	wait(0.1);
	level notify("hash_397efe95");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_skip_mid_round") == 0)
		{
			players[i] notify("hash_33a40cb");
		}
	}
}

/*
	Name: function_9fc09a56
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x2540
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 468
*/
function function_9fc09a56()
{
	self endon("disconnect");
	self notify("hash_71d49081");
	self endon("hash_71d49081");
	wait(2);
	level flag::wait_till("reap_collection_loaded");
	level waittill("hash_397efe95");
	self thread function_7d63f204();
	while(1)
	{
		self waittill("hash_33a40cb");
		wait(1);
		while(self function_faa266a5())
		{
			wait(0.01);
		}
		self thread givegobblegum();
		wait(5);
		var_33636f4a = self function_9b84d8c6();
		if(!isdefined(var_33636f4a))
		{
			break;
		}
	}
}

/*
	Name: function_faa266a5
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x2648
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 505
*/
function function_faa266a5()
{
	if(isdefined(self.IS_DRINKING) && self.IS_DRINKING != 0)
	{
		return 1;
	}
	if(self IsThrowingGrenade())
	{
		return 1;
	}
	if(self IsSwitchingWeapons())
	{
		return 1;
	}
	if(self laststand::player_is_in_laststand() || (isdefined(self.intermission) && self.intermission))
	{
		return 1;
	}
	if(!self zm_magicbox::can_buy_weapon())
	{
		return 1;
	}
	if(self zm_utility::has_powerup_weapon())
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7d63f204
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x2730
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 545
*/
function function_7d63f204()
{
	while(1)
	{
		if(!isdefined(self.bgb) || (isdefined(self.bgb) && self.bgb == "none"))
		{
			if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_skip_mid_round") == 0)
			{
				self notify("hash_33a40cb");
			}
		}
		wait(1);
	}
}

/*
	Name: function_9b84d8c6
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x27A8
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 570
*/
function function_9b84d8c6()
{
	if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_no_pack") == 1)
	{
		filtered = [];
		for(i = 0; i < level.var_230b3923.size; i++)
		{
			if(level.var_230b3923[i] != self getbubblegumpack()[0] && level.var_230b3923[i] != self getbubblegumpack()[1] && level.var_230b3923[i] != self getbubblegumpack()[2] && level.var_230b3923[i] != self getbubblegumpack()[3] && level.var_230b3923[i] != self getbubblegumpack()[4])
			{
				filtered[filtered.size] = level.var_230b3923[i];
			}
		}
		var_33636f4a = filtered[RandomInt(filtered.size)];
		return function_b4705b81(var_33636f4a);
	}
	var_33636f4a = level.var_230b3923[RandomInt(level.var_230b3923.size)];
	return function_b4705b81(var_33636f4a);
}

/*
	Name: checkStringValid
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x29A8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 599
*/
function checkStringValid(STR)
{
	if(STR != "")
	{
		return STR;
	}
	return undefined;
}

/*
	Name: function_b4705b81
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x29D8
	Size: 0x218
	Parameters: 1
	Flags: None
	Line Number: 618
*/
function function_b4705b81(var_33636f4a)
{
	gametype = GetDvarString("ui_gametype");
	index = 1;
	for(row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index); isdefined(row); row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index))
	{
		var_a0ec4ef3 = checkStringValid(row[4]);
		if(var_a0ec4ef3 == var_33636f4a)
		{
			break;
		}
		index++;
		if(index == 101)
		{
			index++;
		}
	}
	struct = spawnstruct();
	struct.name = var_a0ec4ef3;
	struct.UI = checkStringValid(row[3]);
	struct.camoIndex = Int(row[5]);
	struct.hud = checkStringValid(row[6]);
	struct.description = checkStringValid(row[7]);
	struct.var_d277f374 = Int(row[16]);
	struct.activation = checkStringValid(row[20]);
	return struct;
	ERROR: Bad function call
}

/*
	Name: givegobblegum
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x2BF8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 657
*/
function givegobblegum()
{
	var_33636f4a = function_9b84d8c6();
	if(!isdefined(var_33636f4a))
	{
		IPrintLnBold("YOUR CURRENT GUMGAME SETTINGS HAVE DISABLED ALL GOBBLEGUMS!");
		return;
	}
	if(namespace_11e193f1::function_6dd41714("gamemode_gumgame_skip_eat") == 0)
	{
		self thread namespace_851dc78f::givegobblegum(var_33636f4a, 1);
	}
	else
	{
		self thread namespace_851dc78f::givegobblegum(var_33636f4a, 0);
		return;
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_78414713
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x2CA0
	Size: 0x258
	Parameters: 0
	Flags: None
	Line Number: 688
*/
function function_78414713()
{
	level.var_d776839c = 0;
	level.var_d453a2ed = 0;
	wait(2);
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("gobblegums_first_free") == 1)
	{
		SetDvar("scr_firstGumFree", 1);
	}
	else
	{
		SetDvar("scr_firstGumFree", 0);
	}
	level.var_6cb6a683 = namespace_11e193f1::function_6dd41714("gobblegums_limit");
	if(level.var_6cb6a683 < 0)
	{
		level.var_6cb6a683 = 0;
	}
	if(level.var_6cb6a683 > 10)
	{
		level.var_6cb6a683 = 10;
	}
	if(namespace_11e193f1::function_6dd41714("gobblegums_limit_mode") == 0)
	{
		level.var_d776839c = 1000;
		level.var_d453a2ed = 1;
		for(i = 0; i < level.bgb_machines.size; i++)
		{
			level.bgb_machines[i] thread function_13565590();
		}
	}
	else
	{
		level.var_d776839c = 2;
		level.var_d453a2ed = 1;
		var_ed3848d8 = 0;
		for(i = 0; i < level.bgb_machines.size; i++)
		{
			if(var_ed3848d8 >= level.var_d776839c || !isdefined(level.bgb_machines[i].script_noteworthy) || !IsSubStr(level.bgb_machines[i].script_noteworthy, "start_bgb_machine"))
			{
				continue;
			}
			var_ed3848d8++;
			level.bgb_machines[i] thread function_13565590();
		}
	}
}

/*
	Name: function_13565590
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x2F00
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 747
*/
function function_13565590()
{
	if(isdefined(level.spiders_enabled))
	{
		var_122ad180 = GetEntArray("bgb_web_trigger", "targetname");
		foreach(trigger in var_122ad180)
		{
			if(trigger istouching(self))
			{
				trigger waittill("hash_bbf62f57");
				self.disabled = 0;
				wait(0.1);
			}
		}
	}
	else if(self.state == "away")
	{
		self.hidden = 0;
		self.var_4d6e7e5e = 1;
		self function_561f90cb("initial");
	}
}

/*
	Name: function_561f90cb
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x3048
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 780
*/
function function_561f90cb(state)
{
	for(i = 0; i < self getnumzbarrierpieces(); i++)
	{
		self hidezbarrierpiece(i);
	}
	self notify("zbarrier_state_change");
	self [[level.var_cc480293]](state);
}

