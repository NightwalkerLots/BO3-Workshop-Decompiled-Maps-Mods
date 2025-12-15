#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\beam_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace namespace_52adc03e;

/*
	Name: __init__sytem__
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x700
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("zm_audio_zhd", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x748
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	clientfield::register("scriptmover", "snd_zhdegg", 21000, 2, "int", &function_97d247be, 0, 0);
	clientfield::register("scriptmover", "snd_zhdegg_arm", 21000, 1, "counter", &function_e312f684, 0, 0);
	level._effect["zhdegg_ballerina_appear"] = "dlc3/stalingrad/fx_main_impact_success";
	level._effect["zhdegg_ballerina_disappear"] = "dlc3/stalingrad/fx_main_impact_success";
	level._effect["zhdegg_arm_appear"] = "dlc3/stalingrad/fx_dirt_hand_burst_challenges";
	level thread setup_personality_character_exerts();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __main__
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x850
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function __main__()
{
	level thread function_41750326();
}

/*
	Name: function_41750326
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x878
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function function_41750326()
{
	util::waitforclient(0);
	level.var_f64bfe30 = [];
	level.var_f64bfe30["zm_prototype"] = "mus_zombie_wave_loop";
	level.var_f64bfe30["zm_asylum"] = "mus_zombie_wave_loop";
	level.var_f64bfe30["zm_sumpf"] = "mus_sumpf_underscore";
	level.var_f64bfe30["zm_cosmodrome"] = "mus_cosmo_underscore";
	level.var_f64bfe30["zm_temple"] = "mus_temple_underscore";
	level.var_f64bfe30["zm_moon"] = "mus_moon_underscore";
	level.var_f64bfe30["zm_theater"] = "mus_theatre_underscore";
	MapName = GetDvarString("mapname");
	if(MapName == "zm_prototype" || MapName == "zm_sumpf" || MapName == "zm_temple")
	{
		level.var_b6342abd = function_a3e2d661(MapName);
		level.var_eb526c90 = spawn(0, (0, 0, 0), "script_origin");
		level.var_9433cf5a = level.var_eb526c90 PlayLoopSound(level.var_b6342abd, 2);
	}
	else
	{
		level thread function_e7009a68(MapName);
	}
	if(MapName == "zm_prototype" || MapName == "zm_asylum")
	{
		var_164e28a0 = spawn(0, (0, 0, 0), "script_origin");
		var_efd2d56f = var_164e28a0 PlayLoopSound("mus_zombie_wave_loop2", 2);
	}
}

/*
	Name: function_97d247be
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0xAD0
	Size: 0x110
	Parameters: 7
	Flags: None
	Line Number: 112
*/
function function_97d247be(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		if(newVal == 1)
		{
			playFX(localClientNum, level._effect["zhdegg_ballerina_appear"], self.origin);
			playsound(0, "zmb_sam_egg_appear", self.origin);
		}
	}
	else
	{
		playFX(localClientNum, level._effect["zhdegg_ballerina_disappear"], self.origin);
		playsound(0, "zmb_sam_egg_disappear", self.origin);
	}
}

/*
	Name: function_e312f684
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0xBE8
	Size: 0x80
	Parameters: 7
	Flags: None
	Line Number: 139
*/
function function_e312f684(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		playFX(localClientNum, level._effect["zhdegg_arm_appear"], self.origin, (0, 0, 1));
	}
}

/*
	Name: setup_personality_character_exerts
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0xC70
	Size: 0x4E0
	Parameters: 0
	Flags: None
	Line Number: 157
*/
function setup_personality_character_exerts()
{
	util::waitforclient(0);
	level.exert_sounds[1]["meleeswipesoundplayer"][0] = "vox_plr_0_exert_knife_swipe_0";
	level.exert_sounds[1]["meleeswipesoundplayer"][1] = "vox_plr_0_exert_knife_swipe_1";
	level.exert_sounds[1]["meleeswipesoundplayer"][2] = "vox_plr_0_exert_knife_swipe_2";
	level.exert_sounds[1]["meleeswipesoundplayer"][3] = "vox_plr_0_exert_knife_swipe_3";
	level.exert_sounds[1]["meleeswipesoundplayer"][4] = "vox_plr_0_exert_knife_swipe_4";
	level.exert_sounds[2]["meleeswipesoundplayer"][0] = "vox_plr_1_exert_knife_swipe_0";
	level.exert_sounds[2]["meleeswipesoundplayer"][1] = "vox_plr_1_exert_knife_swipe_1";
	level.exert_sounds[2]["meleeswipesoundplayer"][2] = "vox_plr_1_exert_knife_swipe_2";
	level.exert_sounds[2]["meleeswipesoundplayer"][3] = "vox_plr_1_exert_knife_swipe_3";
	level.exert_sounds[2]["meleeswipesoundplayer"][4] = "vox_plr_1_exert_knife_swipe_4";
	level.exert_sounds[3]["meleeswipesoundplayer"][0] = "vox_plr_2_exert_knife_swipe_0";
	level.exert_sounds[3]["meleeswipesoundplayer"][1] = "vox_plr_2_exert_knife_swipe_1";
	level.exert_sounds[3]["meleeswipesoundplayer"][2] = "vox_plr_2_exert_knife_swipe_2";
	level.exert_sounds[3]["meleeswipesoundplayer"][3] = "vox_plr_2_exert_knife_swipe_3";
	level.exert_sounds[3]["meleeswipesoundplayer"][4] = "vox_plr_2_exert_knife_swipe_4";
	level.exert_sounds[4]["meleeswipesoundplayer"][0] = "vox_plr_3_exert_knife_swipe_0";
	level.exert_sounds[4]["meleeswipesoundplayer"][1] = "vox_plr_3_exert_knife_swipe_1";
	level.exert_sounds[4]["meleeswipesoundplayer"][2] = "vox_plr_3_exert_knife_swipe_2";
	level.exert_sounds[4]["meleeswipesoundplayer"][3] = "vox_plr_3_exert_knife_swipe_3";
	level.exert_sounds[4]["meleeswipesoundplayer"][4] = "vox_plr_3_exert_knife_swipe_4";
	level.exert_sounds[1]["playerbreathinsound"][0] = "vox_plr_0_exert_inhale_0";
	level.exert_sounds[2]["playerbreathinsound"][0] = "vox_plr_1_exert_inhale_0";
	level.exert_sounds[3]["playerbreathinsound"][0] = "vox_plr_2_exert_inhale_0";
	level.exert_sounds[4]["playerbreathinsound"][0] = "vox_plr_3_exert_inhale_0";
	level.exert_sounds[1]["playerbreathoutsound"][0] = "vox_plr_0_exert_exhale_0";
	level.exert_sounds[2]["playerbreathoutsound"][0] = "vox_plr_1_exert_exhale_0";
	level.exert_sounds[3]["playerbreathoutsound"][0] = "vox_plr_2_exert_exhale_0";
	level.exert_sounds[4]["playerbreathoutsound"][0] = "vox_plr_3_exert_exhale_0";
	level.exert_sounds[1]["playerbreathgaspsound"][0] = "vox_plr_0_exert_exhale_0";
	level.exert_sounds[2]["playerbreathgaspsound"][0] = "vox_plr_1_exert_exhale_0";
	level.exert_sounds[3]["playerbreathgaspsound"][0] = "vox_plr_2_exert_exhale_0";
	level.exert_sounds[4]["playerbreathgaspsound"][0] = "vox_plr_3_exert_exhale_0";
	return;
	ERROR: Bad function call
}

/*
	Name: function_e7009a68
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x1158
	Size: 0x270
	Parameters: 1
	Flags: None
	Line Number: 206
*/
function function_e7009a68(MapName)
{
	while(!isdefined(level.var_eb526c90))
	{
		wait(1);
	}
	music = function_a3e2d661(MapName);
	if(music == "")
	{
		return;
	}
	level.var_b6342abd = music;
	level.var_eb526c90 stopsounds();
	if(MapName == "zm_moon")
	{
		earth = (22226, -38897, -622);
		controllerModel = GetUIModelForController(0);
		var_6106fdc9 = GetUIModel(controllerModel, "hudItems.aaeMoonRound");
		for(;;)
		{
			wait(0.01);
			player_pos = getlocalclientpos(0);
			if(Distance(earth, player_pos) > 15000)
			{
				level.var_9433cf5a = level.var_eb526c90 PlayLoopSound(level.var_b6342abd, 2);
				SetUIModelValue(var_6106fdc9, "1");
				while(Distance(earth, player_pos) > 15000)
				{
					player_pos = getlocalclientpos(0);
					wait(0.01);
				}
				level.var_eb526c90 stopsounds();
				SetUIModelValue(var_6106fdc9, "0");
			}
			else
			{
				SetUIModelValue(var_6106fdc9, "0");
			}
		}
	}
	else
	{
		level.var_9433cf5a = level.var_eb526c90 PlayLoopSound(level.var_b6342abd, 2);
	}
}

/*
	Name: function_a3e2d661
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x13D0
	Size: 0x36
	Parameters: 1
	Flags: None
	Line Number: 262
*/
function function_a3e2d661(MapName)
{
	if(isdefined(level.var_f64bfe30[MapName]))
	{
		return level.var_f64bfe30[MapName];
	}
	return "";
}

