#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm_bgb_machine;
#include scripts\zm\aae_core;

#namespace bgb;

/*
	Name: __init__sytem__
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x8B0
	Size: 0x630
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
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
		return;
	}
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: __init__
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0xEE8
	Size: 0x380
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	level.var_adfa48c4 = GetWeapon("zombie_bgb_grab");
	callback::on_localclient_connect(&on_player_connect);
	if(!isdefined(level.bgb))
	{
		level.bgb = [];
	}
	if(!isdefined(level.var_98ba48a2))
	{
		level.var_98ba48a2 = [];
	}
	clientfield::register("clientuimodel", "bgb_current", 1, 8, "int", &function_cec2dbda, 0, 0);
	clientfield::register("clientuimodel", "bgb_display", 1, 1, "int", undefined, 0, 0);
	clientfield::register("clientuimodel", "bgb_timer", 1, 8, "float", undefined, 0, 0);
	clientfield::register("clientuimodel", "bgb_activations_remaining", 1, 3, "int", undefined, 0, 0);
	clientfield::register("clientuimodel", "bgb_invalid_use", 1, 1, "counter", undefined, 0, 0);
	clientfield::register("clientuimodel", "bgb_one_shot_use", 1, 1, "counter", undefined, 0, 0);
	clientfield::register("toplayer", "bgb_blow_bubble", 1, 1, "counter", &function_f5d066f6, 0, 0);
	clientfield::register("toplayer", "bgb_blow_bubble_blue", 1, 1, "counter", &function_f5d066f6, 0, 0);
	clientfield::register("toplayer", "bgb_blow_bubble_green", 1, 1, "counter", &function_f5d066f6, 0, 0);
	clientfield::register("toplayer", "bgb_blow_bubble_yellow", 1, 1, "counter", &function_f5d066f6, 0, 0);
	level._effect["bgb_blow_bubble"] = "zombie/fx_bgb_bubble_blow_zmb";
	level._effect["bgb_blow_bubble_yellow"] = "custom/fx_bgb_bubble_blow_zmb_yellow";
	level._effect["bgb_blow_bubble_green"] = "custom/fx_bgb_bubble_blow_zmb_green";
	level._effect["bgb_blow_bubble_blue"] = "custom/fx_bgb_bubble_blow_zmb_blue";
}

/*
	Name: __main__
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x1270
	Size: 0x30
	Parameters: 0
	Flags: Private
	Line Number: 149
*/
function private __main__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	function_47aee2eb();
}

/*
	Name: on_player_connect
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x12A8
	Size: 0x40
	Parameters: 1
	Flags: Private
	Line Number: 168
*/
function private on_player_connect(localClientNum)
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	self thread function_e94a4b1b(localClientNum);
}

/*
	Name: function_e94a4b1b
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x12F0
	Size: 0x48
	Parameters: 1
	Flags: Private
	Line Number: 187
*/
function private function_e94a4b1b(localClientNum)
{
	if(isdefined(level.var_98ba48a2[localClientNum]))
	{
		return;
	}
	level.var_98ba48a2[localClientNum] = getbubblegumpack(localClientNum);
}

/*
	Name: function_47aee2eb
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x1340
	Size: 0x3A0
	Parameters: 0
	Flags: Private
	Line Number: 206
*/
function private function_47aee2eb()
{
	level.var_25bf35d1 = [];
	level.var_25bf35d1[level.var_25bf35d1.size] = "base";
	level.var_25bf35d1[level.var_25bf35d1.size] = "speckled";
	level.var_25bf35d1[level.var_25bf35d1.size] = "shiny";
	level.var_25bf35d1[level.var_25bf35d1.size] = "swirl";
	level.var_25bf35d1[level.var_25bf35d1.size] = "pinwheel";
	statsTableName = util::getStatsTableName();
	level.var_318929eb = [];
	keys = getArrayKeys(level.bgb);
	for(i = 0; i < keys.size; i++)
	{
		level.bgb[keys[i]].item_index = GetItemIndexFromRef(keys[i]);
		level.bgb[keys[i]].var_d277f374 = Int(tableLookup(statsTableName, 0, level.bgb[keys[i]].item_index, 16));
		if(0 == level.bgb[keys[i]].var_d277f374 || 4 == level.bgb[keys[i]].var_d277f374)
		{
			level.bgb[keys[i]].var_e0715b48 = 0;
		}
		else
		{
			level.bgb[keys[i]].var_e0715b48 = 1;
		}
		level.bgb[keys[i]].camo_index = Int(tableLookup(statsTableName, 0, level.bgb[keys[i]].item_index, 5));
		level.bgb[keys[i]].var_d3c80142 = "tag_gumball_" + level.bgb[keys[i]].var_c9e64d65;
		level.bgb[keys[i]].var_ece14434 = "tag_gumball_" + level.bgb[keys[i]].var_c9e64d65 + "_" + level.var_25bf35d1[level.bgb[keys[i]].var_d277f374];
		level.var_318929eb[level.bgb[keys[i]].item_index] = keys[i];
	}
}

/*
	Name: register
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x16E8
	Size: 0x168
	Parameters: 2
	Flags: None
	Line Number: 246
*/
function register(name, var_c9e64d65)
{
	/#
		/#
			Assert(isdefined(name), "Dev Block strings are not supported");
		#/
	#/
	/#
		/#
			Assert("Dev Block strings are not supported" != name, "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported");
		#/
	#/
	/#
		/#
			Assert(!isdefined(level.bgb[name]), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
		#/
	#/
	/#
		/#
			Assert(isdefined(var_c9e64d65), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
		#/
	#/
	if(function_9ae7fa6d())
	{
		level.bgb[name] = spawnstruct();
		level.bgb[name].name = name;
		level.bgb[name].var_c9e64d65 = var_c9e64d65;
	}
}

/*
	Name: function_78c4bfa
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x1858
	Size: 0x180
	Parameters: 2
	Flags: Private
	Line Number: 286
*/
function private function_78c4bfa(localClientNum, time)
{
	self endon("death");
	self endon("entityshutdown");
	if(IsDemoPlaying())
	{
		return;
	}
	if(!isdefined(self.bgb) || !isdefined(level.bgb[self.bgb]))
	{
		return;
	}
	switch(level.bgb[self.bgb].var_c9e64d65)
	{
		case "activated":
		{
			color = (25, 0, 50) / 255;
			break;
		}
		case "event":
		{
			color = (100, 50, 0) / 255;
			break;
		}
		case "rounds":
		{
			color = (1, 149, 244) / 255;
			break;
		}
		case "time":
		{
			color = (19, 244, 20) / 255;
			break;
			return;
		}
		default
		{
		}
	}
	self SetControllerLightbarColor(localClientNum, color);
	wait(time);
	if(isdefined(self))
	{
		self SetControllerLightbarColor(localClientNum);
	}
}

/*
	Name: function_cec2dbda
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x19E0
	Size: 0x88
	Parameters: 7
	Flags: Private
	Line Number: 343
*/
function private function_cec2dbda(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(function_9ae7fa6d())
	{
		self.bgb = level.var_318929eb[newVal];
		self thread function_78c4bfa(localClientNum, 3);
	}
}

/*
	Name: function_c8a1c86
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x1A70
	Size: 0xB8
	Parameters: 2
	Flags: Private
	Line Number: 362
*/
function private function_c8a1c86(localClientNum, FX)
{
	if(isdefined(self.var_d7197e33))
	{
		deletefx(localClientNum, self.var_d7197e33, 1);
	}
	if(isdefined(FX))
	{
		self.var_d7197e33 = PlayFXOnCamera(localClientNum, FX);
		SetFXIgnorePause(localClientNum, self.var_d7197e33, 1);
		self playsound(0, "zmb_bgb_blow_bubble_plr");
	}
}

/*
	Name: function_f5d066f6
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x1B30
	Size: 0x118
	Parameters: 7
	Flags: Private
	Line Number: 386
*/
function private function_f5d066f6(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	FX = level._effect["bgb_blow_bubble"];
	switch(fieldName)
	{
		case "bgb_blow_bubble_blue":
		{
			FX = level._effect["bgb_blow_bubble_blue"];
			break;
		}
		case "bgb_blow_bubble_green":
		{
			FX = level._effect["bgb_blow_bubble_green"];
			break;
		}
		case "bgb_blow_bubble_yellow":
		{
			FX = level._effect["bgb_blow_bubble_yellow"];
			break;
		}
	}
	function_c8a1c86(localClientNum, FX);
	self thread function_78c4bfa(localClientNum, 0.5);
}

/*
	Name: function_9ae7fa6d
	Namespace: bgb
	Checksum: 0x424F4353
	Offset: 0x1C50
	Size: 0x5C
	Parameters: 0
	Flags: None
	Line Number: 421
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

