#include scripts\codescripts\struct;
#include scripts\shared\util_shared;
#include scripts\zm\bgbs\_zm_bgb_aftertaste;
#include scripts\zm\bgbs\_zm_bgb_alchemical_antithesis;
#include scripts\zm\bgbs\_zm_bgb_always_done_swiftly;
#include scripts\zm\bgbs\_zm_bgb_anywhere_but_here;
#include scripts\zm\bgbs\_zm_bgb_armamental_accomplishment;
#include scripts\zm\bgbs\_zm_bgb_arms_grace;
#include scripts\zm\bgbs\_zm_bgb_arsenal_accelerator;
#include scripts\zm\bgbs\_zm_bgb_board_games;
#include scripts\zm\bgbs\_zm_bgb_board_to_death;
#include scripts\zm\bgbs\_zm_bgb_bullet_boost;
#include scripts\zm\bgbs\_zm_bgb_burned_out;
#include scripts\zm\bgbs\_zm_bgb_cache_back;
#include scripts\zm\bgbs\_zm_bgb_coagulant;
#include scripts\zm\bgbs\_zm_bgb_crate_power;
#include scripts\zm\bgbs\_zm_bgb_crawl_space;
#include scripts\zm\bgbs\_zm_bgb_danger_closest;
#include scripts\zm\bgbs\_zm_bgb_dead_of_nuclear_winter;
#include scripts\zm\bgbs\_zm_bgb_disorderly_combat;
#include scripts\zm\bgbs\_zm_bgb_ephemeral_enhancement;
#include scripts\zm\bgbs\_zm_bgb_extra_credit;
#include scripts\zm\bgbs\_zm_bgb_eye_candy;
#include scripts\zm\bgbs\_zm_bgb_fatal_contraption;
#include scripts\zm\bgbs\_zm_bgb_fear_in_headlights;
#include scripts\zm\bgbs\_zm_bgb_firing_on_all_cylinders;
#include scripts\zm\bgbs\_zm_bgb_flavor_hexed;
#include scripts\zm\bgbs\_zm_bgb_head_drama;
#include scripts\zm\bgbs\_zm_bgb_idle_eyes;
#include scripts\zm\bgbs\_zm_bgb_im_feelin_lucky;
#include scripts\zm\bgbs\_zm_bgb_immolation_liquidation;
#include scripts\zm\bgbs\_zm_bgb_impatient;
#include scripts\zm\bgbs\_zm_bgb_in_plain_sight;
#include scripts\zm\bgbs\_zm_bgb_kill_joy;
#include scripts\zm\bgbs\_zm_bgb_killing_time;
#include scripts\zm\bgbs\_zm_bgb_licensed_contractor;
#include scripts\zm\bgbs\_zm_bgb_lucky_crit;
#include scripts\zm\bgbs\_zm_bgb_mind_blown;
#include scripts\zm\bgbs\_zm_bgb_near_death_experience;
#include scripts\zm\bgbs\_zm_bgb_newtonian_negation;
#include scripts\zm\bgbs\_zm_bgb_now_you_see_me;
#include scripts\zm\bgbs\_zm_bgb_on_the_house;
#include scripts\zm\bgbs\_zm_bgb_perkaholic;
#include scripts\zm\bgbs\_zm_bgb_phoenix_up;
#include scripts\zm\bgbs\_zm_bgb_pop_shocks;
#include scripts\zm\bgbs\_zm_bgb_power_vacuum;
#include scripts\zm\bgbs\_zm_bgb_profit_sharing;
#include scripts\zm\bgbs\_zm_bgb_projectile_vomiting;
#include scripts\zm\bgbs\_zm_bgb_reign_drops;
#include scripts\zm\bgbs\_zm_bgb_respin_cycle;
#include scripts\zm\bgbs\_zm_bgb_round_robbin;
#include scripts\zm\bgbs\_zm_bgb_secret_shopper;
#include scripts\zm\bgbs\_zm_bgb_self_medication;
#include scripts\zm\bgbs\_zm_bgb_shopping_free;
#include scripts\zm\bgbs\_zm_bgb_slaughter_slide;
#include scripts\zm\bgbs\_zm_bgb_soda_fountain;
#include scripts\zm\bgbs\_zm_bgb_stock_option;
#include scripts\zm\bgbs\_zm_bgb_sword_flay;
#include scripts\zm\bgbs\_zm_bgb_temporal_gift;
#include scripts\zm\bgbs\_zm_bgb_tone_death;
#include scripts\zm\bgbs\_zm_bgb_unbearable;
#include scripts\zm\bgbs\_zm_bgb_undead_man_walking;
#include scripts\zm\bgbs\_zm_bgb_unquenchable;
#include scripts\zm\bgbs\_zm_bgb_wall_power;
#include scripts\zm\bgbs\_zm_bgb_whos_keeping_score;

#namespace namespace_11beec63;

/*
	Name: main
	Namespace: namespace_11beec63
	Checksum: 0x424F4353
	Offset: 0xC00
	Size: 0x20
	Parameters: 0
	Flags: AutoExec
	Line Number: 78
*/
function autoexec main()
{
	level._effect["aae_custom_flashlight"] = "custom/aae_custom_flashlight";
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: flashlight
	Namespace: namespace_11beec63
	Checksum: 0x424F4353
	Offset: 0xC28
	Size: 0x168
	Parameters: 2
	Flags: None
	Line Number: 95
*/
function flashlight(localClientNum, var_eae72df0)
{
	if(IsSubStr(var_eae72df0, "hp"))
	{
		self function_44032ff3(localClientNum, var_eae72df0);
		return;
	}
	if(self != GetLocalPlayer(localClientNum) && var_eae72df0 != "1")
	{
		return;
	}
	playsound(localClientNum, "flashlight_click_1st", self.origin);
	if(!isdefined(self.var_daf1ded9))
	{
		self.var_daf1ded9 = [];
	}
	if(isdefined(self.var_daf1ded9[localClientNum]))
	{
		deletefx(localClientNum, self.var_daf1ded9[localClientNum]);
		self.var_daf1ded9[localClientNum] = undefined;
	}
	else
	{
		self.var_daf1ded9[localClientNum] = PlayFXOnCamera(localClientNum, level._effect["aae_custom_flashlight"]);
		SetFXIgnorePause(localClientNum, self.var_daf1ded9[localClientNum], 1);
	}
}

/*
	Name: function_44032ff3
	Namespace: namespace_11beec63
	Checksum: 0x424F4353
	Offset: 0xD98
	Size: 0x1E0
	Parameters: 2
	Flags: None
	Line Number: 133
*/
function function_44032ff3(localClientNum, state)
{
	controllerModel = GetUIModelForController(localClientNum);
	var_cde9f622 = StrTok(state, ",");
	stage = Int(var_cde9f622[1]);
	player_num = Int(var_cde9f622[2]);
	var_34eaeb8b = GetUIModel(GetUIModelForController(localClientNum), "WorldSpaceIndicators.bleedOutModel" + player_num + ".stateFlags");
	var_fd291fd3 = GetUIModel(GetUIModelForController(localClientNum), "WorldSpaceIndicators.bleedOutModel" + player_num + ".clockPercent");
	if(stage == 3)
	{
		SetUIModelValue(var_34eaeb8b, 2);
	}
	else
	{
		SetUIModelValue(var_34eaeb8b, stage);
	}
	if(stage == 2)
	{
		self thread function_82ac3ebb(localClientNum, var_fd291fd3);
	}
	if(stage == 3)
	{
		self thread function_564f5084(localClientNum, var_fd291fd3);
	}
}

/*
	Name: function_d70dd2e0
	Namespace: namespace_11beec63
	Checksum: 0x424F4353
	Offset: 0xF80
	Size: 0x1A8
	Parameters: 2
	Flags: None
	Line Number: 169
*/
function function_d70dd2e0(newValue, localClientNum)
{
	self notify("hash_d70dd2e0");
	self endon("hash_d70dd2e0");
	controllerModel = GetUIModelForController(localClientNum);
	var_598e1bb9 = CreateUIModel(controllerModel, "hudItems.elmgplayerHealthvalue");
	startTime = GetRealTime();
	timeSinceLastUpdate = 0;
	if(!isdefined(self.var_2ce28768))
	{
		self.var_2ce28768 = newValue;
		SetUIModelValue(var_598e1bb9, newValue);
		return;
	}
	oldValue = self.var_2ce28768;
	self.var_2ce28768 = newValue;
	ms = 150;
	while(timeSinceLastUpdate <= ms)
	{
		timeSinceLastUpdate = GetRealTime() - startTime;
		lerpValue = LerpFloat(oldValue, newValue, timeSinceLastUpdate / ms);
		SetUIModelValue(var_598e1bb9, Int(lerpValue));
		wait(0.016);
	}
}

/*
	Name: function_2e7e83f2
	Namespace: namespace_11beec63
	Checksum: 0x424F4353
	Offset: 0x1130
	Size: 0x168
	Parameters: 2
	Flags: None
	Line Number: 205
*/
function function_2e7e83f2(newValue, localClientNum)
{
	if(!isdefined(newValue))
	{
		newValue = 44;
	}
	self notify("hash_2e7e83f2");
	self endon("hash_2e7e83f2");
	controllerModel = GetUIModelForController(localClientNum);
	var_38a61125 = CreateUIModel(controllerModel, "hudItems.elmgbleeding_bar");
	startTime = GetRealTime();
	timeSinceLastUpdate = 0;
	oldValue = newValue - 1;
	while(timeSinceLastUpdate <= 1)
	{
		timeSinceLastUpdate = GetRealTime() - startTime / 1000;
		lerpValue = LerpFloat(newValue, oldValue, timeSinceLastUpdate) / 44;
		SetUIModelValue(var_38a61125, lerpValue);
		wait(0.016);
	}
}

/*
	Name: function_82ac3ebb
	Namespace: namespace_11beec63
	Checksum: 0x424F4353
	Offset: 0x12A0
	Size: 0x118
	Parameters: 2
	Flags: None
	Line Number: 237
*/
function function_82ac3ebb(localClientNum, var_9eb5ed66)
{
	self notify("hash_2e7e83f2");
	self notify("hash_82ac3ebb");
	self endon("hash_82ac3ebb");
	startTime = GetTime();
	timeSinceLastUpdate = 0;
	SetUIModelValue(var_9eb5ed66, 0);
	oldValue = 0;
	newValue = 3;
	while(timeSinceLastUpdate <= 3)
	{
		timeSinceLastUpdate = GetTime() - startTime / 1000;
		lerpValue = LerpFloat(oldValue, newValue, timeSinceLastUpdate / 3) / 3;
		SetUIModelValue(var_9eb5ed66, lerpValue);
		wait(0.016);
	}
}

/*
	Name: function_564f5084
	Namespace: namespace_11beec63
	Checksum: 0x424F4353
	Offset: 0x13C0
	Size: 0x108
	Parameters: 2
	Flags: None
	Line Number: 266
*/
function function_564f5084(localClientNum, var_9eb5ed66)
{
	self notify("hash_2e7e83f2");
	self notify("hash_82ac3ebb");
	self endon("hash_82ac3ebb");
	startTime = GetTime();
	timeSinceLastUpdate = 0;
	SetUIModelValue(var_9eb5ed66, 0);
	oldValue = 0;
	newValue = 1;
	while(timeSinceLastUpdate <= 10000)
	{
		timeSinceLastUpdate = GetTime() - startTime;
		lerpValue = LerpFloat(oldValue, newValue, timeSinceLastUpdate / 10000);
		SetUIModelValue(var_9eb5ed66, lerpValue);
		wait(0.016);
	}
}

