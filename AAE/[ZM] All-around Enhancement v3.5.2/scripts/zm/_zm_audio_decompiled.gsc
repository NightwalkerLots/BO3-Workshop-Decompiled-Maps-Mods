#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\music_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace zm_audio;

/*
	Name: __init__sytem__
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x1418
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 29
*/
function autoexec __init__sytem__()
{
	system::register("zm_audio", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x1458
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	if(GetDvarString("ui_mapname") == "3391299194")
	{
		clientfield::register("allplayers", "charindex", 1, 10, "int");
	}
	else
	{
		clientfield::register("allplayers", "charindex", 1, 3, "int");
	}
	clientfield::register("toplayer", "isspeaking", 1, 1, "int");
	level.audio_get_mod_type = &get_mod_type;
	level zmbVox();
	callback::on_connect(&init_audio_functions);
	switch(level.script)
	{
		case "zm_moon":
		{
			level function_708d8f98();
			break;
		}
		case "zm_genesis":
		{
			level function_25d41fcb();
			break;
		}
		case "zm_zod":
		{
			level function_44e59d8e();
			break;
			break;
		}
		case "zm_prototype":
		{
		}
		default
		{
			level sndAnnouncer_Init();
			break;
		}
	}
}

/*
	Name: SetExertVoice
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x1618
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 97
*/
function SetExertVoice(exert_id)
{
	self.player_exert_id = exert_id;
	self clientfield::set("charindex", self.player_exert_id);
}

/*
	Name: playerExert
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x1660
	Size: 0x218
	Parameters: 2
	Flags: None
	Line Number: 113
*/
function playerExert(EXERT, notifywait)
{
	if(!isdefined(notifywait))
	{
		notifywait = 0;
	}
	if(isdefined(self.isSpeaking) && self.isSpeaking || (isdefined(self.isexerting) && self.isexerting))
	{
		return;
	}
	if(isdefined(self.beastmode) && self.beastmode)
	{
		return;
	}
	id = level.exert_sounds[0][EXERT];
	if(isdefined(self.player_exert_id))
	{
		if(!isdefined(level.exert_sounds) || !isdefined(level.exert_sounds[self.player_exert_id]) || !isdefined(level.exert_sounds[self.player_exert_id][EXERT]))
		{
			return;
		}
		if(IsArray(level.exert_sounds[self.player_exert_id][EXERT]))
		{
			id = Array::random(level.exert_sounds[self.player_exert_id][EXERT]);
		}
		else
		{
			id = level.exert_sounds[self.player_exert_id][EXERT];
		}
	}
	if(isdefined(id))
	{
		self.isexerting = 1;
		if(notifywait)
		{
			self playsoundwithnotify(id, "done_exerting");
			self waittill("done_exerting");
			self.isexerting = 0;
		}
		else
		{
			self thread exert_timer();
			if(id == "evt_belch")
			{
				self playlocalsound(id);
			}
			else
			{
				self playsound(id);
			}
		}
	}
}

/*
	Name: exert_timer
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x1880
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 177
*/
function exert_timer()
{
	self endon("disconnect");
	self endon("death");
	wait(RandomFloatRange(1.5, 3));
	self.isexerting = 0;
}

/*
	Name: zmbVox
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x18C8
	Size: 0x19A8
	Parameters: 0
	Flags: None
	Line Number: 195
*/
function zmbVox()
{
	level.votimer = [];
	level.vox = zmbVoxCreate();
	if(isdefined(level._zmbVoxLevelSpecific))
	{
		level thread [[level._zmbVoxLevelSpecific]]();
	}
	if(isdefined(level._zmbVoxGametypeSpecific))
	{
		level thread [[level._zmbVoxGametypeSpecific]]();
	}
	announcer_ent = spawn("script_origin", (0, 0, 0));
	level.vox zmbVoxInitSpeaker("announcer", "vox_zmba_", announcer_ent);
	level.exert_sounds[0]["burp"] = "evt_belch";
	level.exert_sounds[0]["hitmed"] = "null";
	level.exert_sounds[0]["hitlrg"] = "null";
	if(GetDvarString("ui_mapname") == "3162919826")
	{
		level.exert_sounds[5]["burp"][0] = "evt_belch";
		level.exert_sounds[5]["burp"][1] = "evt_belch";
		level.exert_sounds[5]["burp"][2] = "evt_belch";
		level.exert_sounds[6]["burp"][0] = "evt_belch";
		level.exert_sounds[6]["burp"][1] = "evt_belch";
		level.exert_sounds[6]["burp"][2] = "evt_belch";
		level.exert_sounds[7]["burp"][0] = "evt_belch";
		level.exert_sounds[7]["burp"][1] = "evt_belch";
		level.exert_sounds[7]["burp"][2] = "evt_belch";
		level.exert_sounds[8]["burp"][0] = "evt_belch";
		level.exert_sounds[8]["burp"][1] = "evt_belch";
		level.exert_sounds[8]["burp"][2] = "evt_belch";
		level.exert_sounds[9]["burp"][0] = "evt_belch";
		level.exert_sounds[9]["burp"][1] = "evt_belch";
		level.exert_sounds[9]["burp"][2] = "evt_belch";
		level.exert_sounds[10]["burp"][0] = "evt_belch";
		level.exert_sounds[10]["burp"][1] = "evt_belch";
		level.exert_sounds[10]["burp"][2] = "evt_belch";
		level.exert_sounds[5]["hitmed"][0] = "vox_plr_4_exert_pain_0";
		level.exert_sounds[5]["hitmed"][1] = "vox_plr_4_exert_pain_1";
		level.exert_sounds[5]["hitmed"][2] = "vox_plr_4_exert_pain_2";
		level.exert_sounds[5]["hitmed"][3] = "vox_plr_4_exert_pain_3";
		level.exert_sounds[5]["hitmed"][4] = "vox_plr_4_exert_pain_4";
		level.exert_sounds[6]["hitmed"][0] = "vox_plr_5_exert_pain_0";
		level.exert_sounds[6]["hitmed"][1] = "vox_plr_5_exert_pain_1";
		level.exert_sounds[6]["hitmed"][2] = "vox_plr_5_exert_pain_2";
		level.exert_sounds[6]["hitmed"][3] = "vox_plr_5_exert_pain_3";
		level.exert_sounds[6]["hitmed"][4] = "vox_plr_5_exert_pain_4";
		level.exert_sounds[7]["hitmed"][0] = "vox_plr_6_exert_pain_0";
		level.exert_sounds[7]["hitmed"][1] = "vox_plr_6_exert_pain_1";
		level.exert_sounds[7]["hitmed"][2] = "vox_plr_6_exert_pain_2";
		level.exert_sounds[7]["hitmed"][3] = "vox_plr_6_exert_pain_3";
		level.exert_sounds[7]["hitmed"][4] = "vox_plr_6_exert_pain_4";
		level.exert_sounds[8]["hitmed"][0] = "vox_plr_7_exert_pain_0";
		level.exert_sounds[8]["hitmed"][1] = "vox_plr_7_exert_pain_1";
		level.exert_sounds[8]["hitmed"][2] = "vox_plr_7_exert_pain_2";
		level.exert_sounds[8]["hitmed"][3] = "vox_plr_7_exert_pain_3";
		level.exert_sounds[8]["hitmed"][4] = "vox_plr_7_exert_pain_4";
		level.exert_sounds[9]["hitmed"][0] = "vox_plr_8_exert_pain_0";
		level.exert_sounds[9]["hitmed"][1] = "vox_plr_8_exert_pain_1";
		level.exert_sounds[9]["hitmed"][2] = "vox_plr_8_exert_pain_2";
		level.exert_sounds[9]["hitmed"][3] = "vox_plr_8_exert_pain_3";
		level.exert_sounds[9]["hitmed"][4] = "vox_plr_8_exert_pain_4";
		level.exert_sounds[10]["hitmed"][0] = "vox_plr_9_exert_pain_0";
		level.exert_sounds[10]["hitmed"][1] = "vox_plr_9_exert_pain_1";
		level.exert_sounds[10]["hitmed"][2] = "vox_plr_9_exert_pain_2";
		level.exert_sounds[10]["hitmed"][3] = "vox_plr_9_exert_pain_3";
		level.exert_sounds[10]["hitmed"][4] = "vox_plr_9_exert_pain_4";
		level.exert_sounds[5]["hitlrg"][0] = "vox_plr_4_exert_pain_0";
		level.exert_sounds[5]["hitlrg"][1] = "vox_plr_4_exert_pain_1";
		level.exert_sounds[5]["hitlrg"][2] = "vox_plr_4_exert_pain_2";
		level.exert_sounds[5]["hitlrg"][3] = "vox_plr_4_exert_pain_3";
		level.exert_sounds[5]["hitlrg"][4] = "vox_plr_4_exert_pain_4";
		level.exert_sounds[6]["hitlrg"][0] = "vox_plr_5_exert_pain_0";
		level.exert_sounds[6]["hitlrg"][1] = "vox_plr_5_exert_pain_1";
		level.exert_sounds[6]["hitlrg"][2] = "vox_plr_5_exert_pain_2";
		level.exert_sounds[6]["hitlrg"][3] = "vox_plr_5_exert_pain_3";
		level.exert_sounds[6]["hitlrg"][4] = "vox_plr_5_exert_pain_4";
		level.exert_sounds[7]["hitlrg"][0] = "vox_plr_6_exert_pain_0";
		level.exert_sounds[7]["hitlrg"][1] = "vox_plr_6_exert_pain_1";
		level.exert_sounds[7]["hitlrg"][2] = "vox_plr_6_exert_pain_2";
		level.exert_sounds[7]["hitlrg"][3] = "vox_plr_6_exert_pain_3";
		level.exert_sounds[7]["hitlrg"][4] = "vox_plr_6_exert_pain_4";
		level.exert_sounds[8]["hitlrg"][0] = "vox_plr_7_exert_pain_0";
		level.exert_sounds[8]["hitlrg"][1] = "vox_plr_7_exert_pain_1";
		level.exert_sounds[8]["hitlrg"][2] = "vox_plr_7_exert_pain_2";
		level.exert_sounds[8]["hitlrg"][3] = "vox_plr_7_exert_pain_3";
		level.exert_sounds[8]["hitlrg"][4] = "vox_plr_7_exert_pain_4";
		level.exert_sounds[9]["hitlrg"][0] = "vox_plr_8_exert_pain_0";
		level.exert_sounds[9]["hitlrg"][1] = "vox_plr_8_exert_pain_1";
		level.exert_sounds[9]["hitlrg"][2] = "vox_plr_8_exert_pain_2";
		level.exert_sounds[9]["hitlrg"][3] = "vox_plr_8_exert_pain_3";
		level.exert_sounds[9]["hitlrg"][4] = "vox_plr_8_exert_pain_4";
		level.exert_sounds[10]["hitlrg"][0] = "vox_plr_9_exert_pain_0";
		level.exert_sounds[10]["hitlrg"][1] = "vox_plr_9_exert_pain_1";
		level.exert_sounds[10]["hitlrg"][2] = "vox_plr_9_exert_pain_2";
		level.exert_sounds[10]["hitlrg"][3] = "vox_plr_9_exert_pain_3";
		level.exert_sounds[10]["hitlrg"][4] = "vox_plr_9_exert_pain_4";
	}
	if(GetDvarString("ui_mapname") == "3391299194")
	{
		level.exert_sounds[5]["burp"][0] = "evt_belch";
		level.exert_sounds[5]["burp"][1] = "evt_belch";
		level.exert_sounds[5]["burp"][2] = "evt_belch";
		level.exert_sounds[6]["burp"][0] = "evt_belch";
		level.exert_sounds[6]["burp"][1] = "evt_belch";
		level.exert_sounds[6]["burp"][2] = "evt_belch";
		level.exert_sounds[7]["burp"][0] = "evt_belch";
		level.exert_sounds[7]["burp"][1] = "evt_belch";
		level.exert_sounds[7]["burp"][2] = "evt_belch";
		level.exert_sounds[8]["burp"][0] = "evt_belch";
		level.exert_sounds[8]["burp"][1] = "evt_belch";
		level.exert_sounds[8]["burp"][2] = "evt_belch";
		level.exert_sounds[9]["burp"][0] = "evt_belch";
		level.exert_sounds[9]["burp"][1] = "evt_belch";
		level.exert_sounds[9]["burp"][2] = "evt_belch";
		level.exert_sounds[10]["burp"][0] = "evt_belch";
		level.exert_sounds[10]["burp"][1] = "evt_belch";
		level.exert_sounds[10]["burp"][2] = "evt_belch";
		level.exert_sounds[5]["hitmed"][0] = "vox_plr_4_exert_pain_0";
		level.exert_sounds[5]["hitmed"][1] = "vox_plr_4_exert_pain_1";
		level.exert_sounds[5]["hitmed"][2] = "vox_plr_4_exert_pain_2";
		level.exert_sounds[5]["hitmed"][3] = "vox_plr_4_exert_pain_3";
		level.exert_sounds[5]["hitmed"][4] = "vox_plr_4_exert_pain_4";
		level.exert_sounds[6]["hitmed"][0] = "vox_plr_5_exert_pain_0";
		level.exert_sounds[6]["hitmed"][1] = "vox_plr_5_exert_pain_1";
		level.exert_sounds[6]["hitmed"][2] = "vox_plr_5_exert_pain_2";
		level.exert_sounds[6]["hitmed"][3] = "vox_plr_5_exert_pain_3";
		level.exert_sounds[6]["hitmed"][4] = "vox_plr_5_exert_pain_4";
		level.exert_sounds[7]["hitmed"][0] = "vox_plr_6_exert_pain_0";
		level.exert_sounds[7]["hitmed"][1] = "vox_plr_6_exert_pain_1";
		level.exert_sounds[7]["hitmed"][2] = "vox_plr_6_exert_pain_2";
		level.exert_sounds[7]["hitmed"][3] = "vox_plr_6_exert_pain_3";
		level.exert_sounds[7]["hitmed"][4] = "vox_plr_6_exert_pain_4";
		level.exert_sounds[8]["hitmed"][0] = "vox_plr_7_exert_pain_0";
		level.exert_sounds[8]["hitmed"][1] = "vox_plr_7_exert_pain_1";
		level.exert_sounds[8]["hitmed"][2] = "vox_plr_7_exert_pain_2";
		level.exert_sounds[8]["hitmed"][3] = "vox_plr_7_exert_pain_3";
		level.exert_sounds[8]["hitmed"][4] = "vox_plr_7_exert_pain_4";
		level.exert_sounds[9]["hitmed"][0] = "vox_plr_8_exert_pain_0";
		level.exert_sounds[9]["hitmed"][1] = "vox_plr_8_exert_pain_1";
		level.exert_sounds[9]["hitmed"][2] = "vox_plr_8_exert_pain_2";
		level.exert_sounds[9]["hitmed"][3] = "vox_plr_8_exert_pain_3";
		level.exert_sounds[9]["hitmed"][4] = "vox_plr_8_exert_pain_4";
		level.exert_sounds[10]["hitmed"][0] = "vox_plr_9_exert_pain_0";
		level.exert_sounds[10]["hitmed"][1] = "vox_plr_9_exert_pain_1";
		level.exert_sounds[10]["hitmed"][2] = "vox_plr_9_exert_pain_2";
		level.exert_sounds[10]["hitmed"][3] = "vox_plr_9_exert_pain_3";
		level.exert_sounds[10]["hitmed"][4] = "vox_plr_9_exert_pain_4";
		level.exert_sounds[5]["hitlrg"][0] = "vox_plr_4_exert_pain_0";
		level.exert_sounds[5]["hitlrg"][1] = "vox_plr_4_exert_pain_1";
		level.exert_sounds[5]["hitlrg"][2] = "vox_plr_4_exert_pain_2";
		level.exert_sounds[5]["hitlrg"][3] = "vox_plr_4_exert_pain_3";
		level.exert_sounds[5]["hitlrg"][4] = "vox_plr_4_exert_pain_4";
		level.exert_sounds[6]["hitlrg"][0] = "vox_plr_5_exert_pain_0";
		level.exert_sounds[6]["hitlrg"][1] = "vox_plr_5_exert_pain_1";
		level.exert_sounds[6]["hitlrg"][2] = "vox_plr_5_exert_pain_2";
		level.exert_sounds[6]["hitlrg"][3] = "vox_plr_5_exert_pain_3";
		level.exert_sounds[6]["hitlrg"][4] = "vox_plr_5_exert_pain_4";
		level.exert_sounds[7]["hitlrg"][0] = "vox_plr_6_exert_pain_0";
		level.exert_sounds[7]["hitlrg"][1] = "vox_plr_6_exert_pain_1";
		level.exert_sounds[7]["hitlrg"][2] = "vox_plr_6_exert_pain_2";
		level.exert_sounds[7]["hitlrg"][3] = "vox_plr_6_exert_pain_3";
		level.exert_sounds[7]["hitlrg"][4] = "vox_plr_6_exert_pain_4";
		level.exert_sounds[8]["hitlrg"][0] = "vox_plr_7_exert_pain_0";
		level.exert_sounds[8]["hitlrg"][1] = "vox_plr_7_exert_pain_1";
		level.exert_sounds[8]["hitlrg"][2] = "vox_plr_7_exert_pain_2";
		level.exert_sounds[8]["hitlrg"][3] = "vox_plr_7_exert_pain_3";
		level.exert_sounds[8]["hitlrg"][4] = "vox_plr_7_exert_pain_4";
		level.exert_sounds[9]["hitlrg"][0] = "vox_plr_8_exert_pain_0";
		level.exert_sounds[9]["hitlrg"][1] = "vox_plr_8_exert_pain_1";
		level.exert_sounds[9]["hitlrg"][2] = "vox_plr_8_exert_pain_2";
		level.exert_sounds[9]["hitlrg"][3] = "vox_plr_8_exert_pain_3";
		level.exert_sounds[9]["hitlrg"][4] = "vox_plr_8_exert_pain_4";
		level.exert_sounds[10]["hitlrg"][0] = "vox_plr_9_exert_pain_0";
		level.exert_sounds[10]["hitlrg"][1] = "vox_plr_9_exert_pain_1";
		level.exert_sounds[10]["hitlrg"][2] = "vox_plr_9_exert_pain_2";
		level.exert_sounds[10]["hitlrg"][3] = "vox_plr_9_exert_pain_3";
		level.exert_sounds[10]["hitlrg"][4] = "vox_plr_9_exert_pain_4";
	}
	if(isdefined(level.setupCustomCharacterExerts))
	{
		[[level.setupCustomCharacterExerts]]();
	}
	if(IsSubStr(GetDvarString("ui_mapname"), "zm_") && level.script != "zm_prototype")
	{
		level thread function_e22c9e56();
	}
}

/*
	Name: function_e22c9e56
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x3278
	Size: 0x298
	Parameters: 0
	Flags: None
	Line Number: 394
*/
function function_e22c9e56()
{
	level flag::wait_till("start_zombie_round_logic");
	level.exert_sounds[1]["burp"] = "evt_belch";
	level.exert_sounds[2]["burp"] = "evt_belch";
	level.exert_sounds[3]["burp"] = "evt_belch";
	level.exert_sounds[4]["burp"] = "evt_belch";
	switch(level.script)
	{
		case "zm_cosmodrome":
		case "zm_factory":
		case "zm_genesis":
		case "zm_island":
		case "zm_k7":
		case "zm_moon":
		case "zm_stalingrad":
		case "zm_temple":
		case "zm_theater":
		{
			level.pack_a_punch.power_on_callback = &function_11e42fa9;
			break;
		}
	}
	level flag::wait_till("initial_blackscreen_passed");
	if(isdefined(level.perk_random_machines) && level.perk_random_machines.size > 0)
	{
		for(i = 0; i < level.perk_random_machines.size; i++)
		{
			level.perk_random_machines[i].script_sound = "mus_perks_fizz_jingle";
			level.perk_random_machines[i] thread function_c81cd4bf();
		}
		for(;;)
		{
			wait(0.5);
			for(i = 0; i < level.perk_random_machines.size; i++)
			{
				if(function_c09fd563(level.perk_random_machines[i].script_int) && level.perk_random_machines[i].current_perk_random_machine)
				{
					level.perk_random_machines[i] thread sndPerksJingles_Player(0);
					return;
				}
			}
		}
	}
	else if(level.script == "zm_moon")
	{
		function_11e42fa9();
	}
}

/*
	Name: function_c09fd563
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x3518
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 454
*/
function function_c09fd563(n_power_index)
{
	if(isdefined(n_power_index))
	{
		str_power = "power_on" + n_power_index;
		n_power_on = level flag::get(str_power);
	}
	else if(isdefined(level.zm_custom_perk_random_power_flag))
	{
		n_power_on = level flag::get(level.zm_custom_perk_random_power_flag);
	}
	else
	{
		n_power_on = level flag::get("power_on");
	}
	return n_power_on;
}

/*
	Name: function_11e42fa9
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x35D8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 482
*/
function function_11e42fa9()
{
	if(isdefined(level.pack_a_punch.triggers))
	{
		foreach(var_aa37ce2d in level.pack_a_punch.triggers)
		{
			var_aa37ce2d.script_sound = "mus_perks_packa_jingle_full";
			var_aa37ce2d thread sndPerksJingles_Player(0);
			var_aa37ce2d thread sndPerksJingles_Timer();
		}
	}
}

/*
	Name: init_audio_functions
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x36C0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 505
*/
function init_audio_functions()
{
	self thread zombie_behind_vox();
	self thread player_killstreak_timer();
	if(isdefined(level._custom_zombie_oh_shit_vox_func))
	{
		self thread [[level._custom_zombie_oh_shit_vox_func]]();
	}
	else
	{
		self thread oh_shit_vox();
	}
}

/*
	Name: zombie_behind_vox
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x3738
	Size: 0x310
	Parameters: 0
	Flags: None
	Line Number: 529
*/
function zombie_behind_vox()
{
	level endon("unloaded");
	self endon("death_or_disconnect");
	if(!isdefined(level._zbv_vox_last_update_time))
	{
		level._zbv_vox_last_update_time = 0;
		level._audio_zbv_shared_ent_list = zombie_utility::get_zombie_array();
	}
	while(1)
	{
		wait(1);
		t = GetTime();
		if(t > level._zbv_vox_last_update_time + 1000)
		{
			level._zbv_vox_last_update_time = t;
			level._audio_zbv_shared_ent_list = zombie_utility::get_zombie_array();
		}
		zombs = level._audio_zbv_shared_ent_list;
		played_sound = 0;
		for(i = 0; i < zombs.size; i++)
		{
			if(!isdefined(zombs[i]))
			{
				continue;
			}
			if(zombs[i].isdog)
			{
				continue;
			}
			dist = 150;
			z_dist = 50;
			alias = level.vox_behind_zombie;
			if(isdefined(zombs[i].zombie_move_speed))
			{
				switch(zombs[i].zombie_move_speed)
				{
					case "walk":
					{
						dist = 150;
						break;
					}
					case "run":
					{
						dist = 175;
						break;
					}
					case "sprint":
					{
						dist = 200;
						break;
					}
					case "super_sprint":
					{
						dist = 225;
						break;
					}
				}
			}
			if(DistanceSquared(zombs[i].origin, self.origin) < dist * dist)
			{
				yaw = self zm_utility::GetYawToSpot(zombs[i].origin);
				z_diff = self.origin[2] - zombs[i].origin[2];
				if(yaw < -95 || yaw > 95 && Abs(z_diff) < 50)
				{
					zombs[i] notify("bhtn_action_notify", "behind");
					played_sound = 1;
					break;
				}
			}
		}
		if(played_sound)
		{
			wait(3.5);
		}
	}
}

/*
	Name: oh_shit_vox
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x3A50
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 617
*/
function oh_shit_vox()
{
	self endon("death_or_disconnect");
	while(1)
	{
		wait(1);
		players = GetPlayers();
		zombs = zombie_utility::get_round_enemy_array();
		if(players.size >= 1)
		{
			close_zombs = 0;
			for(i = 0; i < zombs.size; i++)
			{
				if(isdefined(zombs[i].favoriteenemy) && zombs[i].favoriteenemy == self || !isdefined(zombs[i].favoriteenemy))
				{
					if(DistanceSquared(zombs[i].origin, self.origin) < 62500)
					{
						close_zombs++;
					}
				}
			}
			if(close_zombs > 4)
			{
				self create_and_play_dialog("general", "oh_shit");
				wait(4);
			}
		}
	}
}

/*
	Name: player_killstreak_timer
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x3BC8
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 657
*/
function player_killstreak_timer()
{
	self endon("disconnect");
	self endon("death");
	self endon("death");
	if(GetDvarString("zombie_kills") == "")
	{
		SetDvar("zombie_kills", "7");
	}
	if(GetDvarString("zombie_kill_timer") == "")
	{
		SetDvar("zombie_kill_timer", "5");
	}
	kills = GetDvarInt("zombie_kills");
	time = GetDvarInt("zombie_kill_timer");
	if(!isdefined(self.timerIsrunning))
	{
		self.timerIsrunning = 0;
		self.killcounter = 0;
	}
	while(1)
	{
		self waittill("zom_kill", zomb);
		if(isdefined(zomb._black_hole_bomb_collapse_death) && zomb._black_hole_bomb_collapse_death == 1)
		{
			continue;
		}
		if(isdefined(zomb.microwavegun_death) && zomb.microwavegun_death)
		{
			continue;
		}
		self.killcounter++;
		if(self.timerIsrunning != 1)
		{
			self.timerIsrunning = 1;
			self thread timer_actual(kills, time);
		}
	}
}

/*
	Name: player_zombie_kill_vox
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x3DB8
	Size: 0x1F8
	Parameters: 4
	Flags: None
	Line Number: 707
*/
function player_zombie_kill_vox(HIT_LOCATION, player, mod, zombie)
{
	weapon = player GetCurrentWeapon();
	weapon = zm_weapons::get_base_weapon(weapon);
	dist = DistanceSquared(player.origin, zombie.origin);
	if(!isdefined(level.zombie_vars[player.team]["zombie_insta_kill"]))
	{
		level.zombie_vars[player.team]["zombie_insta_kill"] = 0;
	}
	instakill = level.zombie_vars[player.team]["zombie_insta_kill"];
	death = [[level.audio_get_mod_type]](HIT_LOCATION, mod, weapon, zombie, instakill, dist, player);
	if(weapon.name == "hero_annihilator")
	{
		death = "annihilator";
	}
	if(!isdefined(death))
	{
		return undefined;
	}
	if(!(isdefined(player.force_wait_on_kill_line) && player.force_wait_on_kill_line))
	{
		player.force_wait_on_kill_line = 1;
		player create_and_play_dialog("kill", death);
		wait(2);
		if(isdefined(player))
		{
			player.force_wait_on_kill_line = 0;
		}
	}
}

/*
	Name: get_response_chance
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x3FB8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 748
*/
function get_response_chance(event)
{
	if(!isdefined(level.response_chances[event]))
	{
		return 0;
	}
	return level.response_chances[event];
}

/*
	Name: get_mod_type
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x3FF0
	Size: 0x390
	Parameters: 7
	Flags: None
	Line Number: 767
*/
function get_mod_type(impact, mod, weapon, zombie, instakill, dist, player)
{
	close_dist = 4096;
	far_dist = 160000;
	if(weapon.name == "hero_annihilator")
	{
		return "annihilator";
	}
	if(zm_utility::is_placeable_mine(weapon))
	{
		if(!instakill)
		{
			return "betty";
		}
		else
		{
			return "weapon_instakill";
		}
	}
	if(zombie.damageWeapon.name == "cymbal_monkey")
	{
		if(instakill)
		{
			return "weapon_instakill";
		}
		else
		{
			return "monkey";
		}
	}
	if(weapon.name == "ray_gun" || weapon.name == "raygun_mark2" && dist > far_dist)
	{
		if(!instakill)
		{
			return "raygun";
		}
		else
		{
			return "weapon_instakill";
		}
	}
	if(zm_utility::is_headshot(weapon, impact, mod) && dist >= far_dist)
	{
		return "headshot";
	}
	if(mod == "MOD_MELEE" || mod == "MOD_UNKNOWN" && dist < close_dist)
	{
		if(!instakill)
		{
			return "melee";
		}
		else
		{
			return "melee_instakill";
		}
	}
	if(zm_utility::is_explosive_damage(mod) && weapon.name != "ray_gun" && weapon.name != "raygun_mark2" && (!(isdefined(zombie.is_on_fire) && zombie.is_on_fire)))
	{
		if(!instakill)
		{
			return "explosive";
		}
		else
		{
			return "weapon_instakill";
		}
	}
	if(weapon.doesFireDamage && (mod == "MOD_BURNED" || mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH"))
	{
		if(!instakill)
		{
			return "flame";
		}
		else
		{
			return "weapon_instakill";
		}
	}
	if(!isdefined(impact))
	{
		impact = "";
	}
	if(mod == "MOD_RIFLE_BULLET" || mod == "MOD_PISTOL_BULLET")
	{
		if(!instakill)
		{
			return "bullet";
		}
		else
		{
			return "weapon_instakill";
		}
	}
	if(instakill)
	{
		return "default";
	}
	if(mod != "MOD_MELEE" && zombie.missingLegs)
	{
		return "crawler";
	}
	if(mod != "MOD_BURNED" && dist < close_dist)
	{
		return "close";
	}
	return "default";
	continue;
}

/*
	Name: timer_actual
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x4388
	Size: 0xD8
	Parameters: 2
	Flags: None
	Line Number: 886
*/
function timer_actual(kills, time)
{
	self endon("disconnect");
	self endon("death");
	self endon("death");
	timer = GetTime() + time * 1000;
	while(GetTime() < timer)
	{
		if(self.killcounter > kills)
		{
			self create_and_play_dialog("kill", "streak");
			wait(1);
			self.killcounter = 0;
			timer = -1;
		}
		wait(0.1);
	}
	wait(10);
	self.killcounter = 0;
	self.timerIsrunning = 0;
}

/*
	Name: zmbVoxCreate
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x4468
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 918
*/
function zmbVoxCreate()
{
	vox = spawnstruct();
	vox.speaker = [];
	return vox;
	vox.speaker++;
}

/*
	Name: zmbVoxInitSpeaker
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x44A8
	Size: 0xB8
	Parameters: 3
	Flags: None
	Line Number: 936
*/
function zmbVoxInitSpeaker(speaker, prefix, ent)
{
	ent.zmbVoxID = speaker;
	if(!isdefined(self.speaker[speaker]))
	{
		self.speaker[speaker] = spawnstruct();
		self.speaker[speaker].alias = [];
	}
	self.speaker[speaker].prefix = prefix;
	self.speaker[speaker].ent = ent;
}

/*
	Name: custom_kill_damaged_VO
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x4568
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 958
*/
function custom_kill_damaged_VO(player)
{
	self notify("sound_damage_player_updated");
	self endon("death");
	self endon("sound_damage_player_updated");
	self.sound_damage_player = player;
	wait(2);
	self.sound_damage_player = undefined;
}

/*
	Name: loadPlayerVoiceCategories
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x45C0
	Size: 0x240
	Parameters: 1
	Flags: None
	Line Number: 978
*/
function loadPlayerVoiceCategories(table)
{
	level.votimer = [];
	level.sndPlayerVox = [];
	index = 0;
	for(row = TableLookupRow(table, index); isdefined(row); row = TableLookupRow(table, index))
	{
		category = checkStringValid(row[0]);
		subcategory = checkStringValid(row[1]);
		suffix = checkStringValid(row[2]);
		percentage = Int(row[3]);
		if(percentage <= 0)
		{
			percentage = 100;
		}
		response = checkStringTrue(row[4]);
		if(isdefined(response) && response)
		{
			for(i = 0; i < 4; i++)
			{
				zmbVoxAdd(category, subcategory + "_resp_" + i, suffix + "_resp_" + i, 50, 0);
			}
		}
		delayBeforePlayAgain = checkIntValid(row[5]);
		zmbVoxAdd(category, subcategory, suffix, percentage, response, delayBeforePlayAgain);
		index++;
	}
	return;
	.var_0 = undefined;
}

/*
	Name: checkStringValid
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x4808
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 1019
*/
function checkStringValid(STR)
{
	if(STR != "")
	{
		return STR;
	}
	return undefined;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: checkStringTrue
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x4838
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 1039
*/
function checkStringTrue(STR)
{
	if(!isdefined(STR))
	{
		return 0;
	}
	if(STR != "")
	{
		if(ToLower(STR) == "true")
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: checkIntValid
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x4898
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 1065
*/
function checkIntValid(value, defaultValue)
{
	if(!isdefined(defaultValue))
	{
		defaultValue = 0;
	}
	if(!isdefined(value))
	{
		return defaultValue;
	}
	if(value == "")
	{
		return defaultValue;
	}
	return Int(value);
	ERROR: Exception occured: Stack empty.
}

/*
	Name: zmbVoxAdd
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x4908
	Size: 0x228
	Parameters: 6
	Flags: None
	Line Number: 1093
*/
function zmbVoxAdd(category, subcategory, suffix, percentage, response, delayBeforePlayAgain)
{
	if(!isdefined(delayBeforePlayAgain))
	{
		delayBeforePlayAgain = 0;
	}
	/#
		Assert(isdefined(category));
	#/
	/#
		Assert(isdefined(subcategory));
	#/
	/#
		Assert(isdefined(suffix));
	#/
	/#
		Assert(isdefined(percentage));
	#/
	/#
		Assert(isdefined(response));
	#/
	/#
		Assert(isdefined(delayBeforePlayAgain));
	#/
	vox = level.sndPlayerVox;
	if(!isdefined(vox[category]))
	{
		vox[category] = [];
	}
	if(isdefined(vox[category][subcategory]))
	{
		vox[category][subcategory] delete();
	}
	vox[category][subcategory] = spawnstruct();
	vox[category][subcategory].suffix = suffix;
	vox[category][subcategory].percentage = percentage;
	vox[category][subcategory].response = response;
	vox[category][subcategory].delayBeforePlayAgain = delayBeforePlayAgain;
	zm_utility::create_vox_timer(subcategory);
}

/*
	Name: function_15c8551a
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x4B38
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 1144
*/
function function_15c8551a()
{
	self endon("disconnect");
	self notify("hash_15c8551a");
	self endon("hash_15c8551a");
	self.var_7ed94a50 = 1;
	wait(0.5);
	self.var_7ed94a50 = undefined;
	self.var_7011e588 = undefined;
	self TakeWeapon(GetWeapon("octobomb"));
	self TakeWeapon(GetWeapon("cymbal_monkey"));
	self GiveWeapon(GetWeapon("zombie_knuckle_crack"));
	self SwitchToWeapon(GetWeapon("zombie_knuckle_crack"));
}

/*
	Name: create_and_play_dialog
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x4C38
	Size: 0x368
	Parameters: 3
	Flags: None
	Line Number: 1169
*/
function create_and_play_dialog(category, subcategory, force_variant)
{
	if(isdefined(subcategory) && subcategory == "pap_wait" && isdefined(self.var_7011e588))
	{
		self thread function_15c8551a();
	}
	if(!isdefined(level.sndPlayerVox))
	{
		return 0;
	}
	if(!isdefined(level.sndPlayerVox[category]))
	{
		return 0;
	}
	if(!isdefined(level.sndPlayerVox[category][subcategory]))
	{
		if(GetDvarString("vo_test") == "1")
		{
			iprintln("cant load: " + category + " " + subcategory);
		}
		return 0;
	}
	if(isdefined(level.sndVoxOverride) && level.sndVoxOverride || (isdefined(self.isSpeaking) && self.isSpeaking && (!(isdefined(self.b_wait_if_busy) && self.b_wait_if_busy))))
	{
		if(GetDvarString("vo_test") == "1")
		{
			iprintln("player busy0: " + category + " " + subcategory);
		}
		return 0;
	}
	suffix = level.sndPlayerVox[category][subcategory].suffix;
	percentage = level.sndPlayerVox[category][subcategory].percentage;
	prefix = shouldPlayerSpeak(self, category, subcategory, percentage);
	if(!isdefined(prefix))
	{
		if(GetDvarString("vo_test") == "1")
		{
			iprintln("player busy1: " + category + " " + subcategory + " " + prefix + " " + suffix);
		}
		return 0;
	}
	sound_to_play = self zmbVoxGetLineVariant(prefix, suffix, force_variant);
	if(isdefined(sound_to_play))
	{
		self thread do_player_or_npc_playvox(sound_to_play, category, subcategory);
		return 1;
	}
	if(GetDvarString("vo_test") == "1")
	{
		iprintln("variant cant find: " + category + " " + subcategory + " " + prefix + " " + suffix);
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: do_player_or_npc_playvox
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x4FA8
	Size: 0x460
	Parameters: 3
	Flags: None
	Line Number: 1234
*/
function do_player_or_npc_playvox(sound_to_play, category, subcategory)
{
	self endon("death_or_disconnect");
	if(self flag::exists("in_beastmode") && self flag::get("in_beastmode"))
	{
		return;
	}
	if(!isdefined(self.isSpeaking))
	{
		self.isSpeaking = 0;
	}
	if(self.isSpeaking)
	{
		if(GetDvarString("vo_test") == "1")
		{
			iprintln("player busy2: " + sound_to_play);
			return;
		}
	}
	waittime = 1;
	if(!self areNearbySpeakersActive() || (isdefined(self.ignoreNearbySpkrs) && self.ignoreNearbySpkrs))
	{
		self.speakingLine = sound_to_play;
		self.isSpeaking = 1;
		if(isPlayer(self))
		{
			self clientfield::set_to_player("isspeaking", 1);
		}
		playbacktime = soundgetplaybacktime(sound_to_play);
		if(!isdefined(playbacktime))
		{
			if(GetDvarString("vo_test") == "1")
			{
				iprintln("playbacktime undefined: " + sound_to_play);
				return;
			}
		}
		if(playbacktime >= 0)
		{
			playbacktime = playbacktime * 0.001;
		}
		else
		{
			playbacktime = 1;
		}
		if(isdefined(level._do_player_or_npc_playvox_override))
		{
			if(GetDvarString("vo_test") == "1")
			{
				iprintln("calling func ptr: " + sound_to_play);
			}
			self thread [[level._do_player_or_npc_playvox_override]](sound_to_play, playbacktime);
			wait(playbacktime);
		}
		else if(GetDvarString("vo_test") == "1")
		{
			iprintln("start play: " + sound_to_play);
		}
		thread namespace_cc012897::Send(sound_to_play, "all");
		self PlaySoundOnTag(sound_to_play, "J_Head");
		wait(playbacktime);
		if(isPlayer(self) && isdefined(self.last_vo_played_time))
		{
			if(GetTime() < self.last_vo_played_time + 5000)
			{
				self.last_vo_played_time = GetTime();
				waittime = 7;
			}
		}
		wait(waittime);
		self.isSpeaking = 0;
		if(isPlayer(self))
		{
			self clientfield::set_to_player("isspeaking", 0);
		}
		if(!level flag::get("solo_game") && (isdefined(level.sndPlayerVox[category][subcategory].response) && level.sndPlayerVox[category][subcategory].response))
		{
			if(isdefined(level.vox_response_override) && level.vox_response_override)
			{
				level thread setup_response_line_override(self, category, subcategory);
			}
			else
			{
				level thread setup_response_line(self, category, subcategory);
			}
		}
	}
}

/*
	Name: setup_response_line_override
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x5410
	Size: 0x130
	Parameters: 3
	Flags: None
	Line Number: 1333
*/
function setup_response_line_override(player, category, subcategory)
{
	if(isdefined(level._audio_custom_response_line))
	{
		self thread [[level._audio_custom_response_line]](player, category, subcategory);
	}
	else
	{
		switch(player.characterindex)
		{
			case 0:
			{
				level setup_hero_rival(player, 1, 2, category, subcategory);
				break;
			}
			case 1:
			{
				level setup_hero_rival(player, 2, 3, category, subcategory);
				break;
			}
			case 3:
			{
				level setup_hero_rival(player, 0, 1, category, subcategory);
				break;
			}
			case 2:
			{
				level setup_hero_rival(player, 3, 0, category, subcategory);
				break;
			}
		}
		return;
	}
}

/*
	Name: setup_hero_rival
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x5548
	Size: 0x2E0
	Parameters: 5
	Flags: None
	Line Number: 1378
*/
function setup_hero_rival(player, hero, rival, category, type)
{
	players = GetPlayers();
	hero_player = undefined;
	rival_player = undefined;
	foreach(ent in players)
	{
		if(ent.characterindex == hero)
		{
			hero_player = ent;
			continue;
		}
		if(ent.characterindex == rival)
		{
			rival_player = ent;
		}
	}
	if(isdefined(hero_player) && isdefined(rival_player))
	{
		if(RandomInt(100) > 50)
		{
			hero_player = undefined;
		}
		else
		{
			rival_player = undefined;
		}
	}
	if(isdefined(hero_player) && DistanceSquared(player.origin, hero_player.origin) < 250000)
	{
		if(isdefined(player.isSamantha) && player.isSamantha)
		{
			hero_player create_and_play_dialog(category, type + "_s");
		}
		else
		{
			hero_player create_and_play_dialog(category, type + "_hr");
		}
	}
	else if(isdefined(rival_player) && DistanceSquared(player.origin, rival_player.origin) < 250000)
	{
		if(isdefined(player.isSamantha) && player.isSamantha)
		{
			rival_player create_and_play_dialog(category, type + "_s");
		}
		else
		{
			rival_player create_and_play_dialog(category, type + "_riv");
		}
	}
}

/*
	Name: setup_response_line
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x5830
	Size: 0x118
	Parameters: 3
	Flags: None
	Line Number: 1440
*/
function setup_response_line(player, category, subcategory)
{
	players = Array::get_all_closest(player.origin, level.activePlayers);
	players_that_can_respond = Array::exclude(players, player);
	if(players_that_can_respond.size == 0)
	{
		return;
	}
	player_to_respond = players_that_can_respond[0];
	if(DistanceSquared(player.origin, player_to_respond.origin) < 250000)
	{
		player_to_respond create_and_play_dialog(category, subcategory + "_resp_" + player.characterindex);
	}
}

/*
	Name: shouldPlayerSpeak
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x5950
	Size: 0x1D0
	Parameters: 4
	Flags: None
	Line Number: 1465
*/
function shouldPlayerSpeak(player, category, subcategory, percentage)
{
	if(!isdefined(player))
	{
		return undefined;
	}
	if(!player zm_utility::is_player())
	{
		return undefined;
	}
	if(player zm_utility::is_player())
	{
		if(player.sessionstate != "playing")
		{
			return undefined;
		}
		if(player laststand::player_is_in_laststand() && (subcategory != "revive_down" || subcategory != "revive_up"))
		{
			return undefined;
		}
		if(player IsPlayerUnderwater())
		{
			return undefined;
		}
	}
	if(isdefined(player.dontspeak) && player.dontspeak)
	{
		return undefined;
	}
	if(percentage < randomIntRange(1, 101))
	{
		return undefined;
	}
	if(isVoxOnCooldown(player, category, subcategory))
	{
		return undefined;
	}
	index = zm_utility::get_player_index(player);
	if(isdefined(player.isSamantha) && player.isSamantha)
	{
		index = 4;
	}
	return "vox_plr_" + index + "_";
}

/*
	Name: isVoxOnCooldown
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x5B28
	Size: 0x128
	Parameters: 3
	Flags: None
	Line Number: 1520
*/
function isVoxOnCooldown(player, category, subcategory)
{
	if(level.sndPlayerVox[category][subcategory].delayBeforePlayAgain <= 0)
	{
		return 0;
	}
	fullname = category + subcategory;
	if(!isdefined(player.voxTimer))
	{
		player.voxTimer = [];
	}
	if(!isdefined(player.voxTimer[fullname]))
	{
		player.voxTimer[fullname] = GetTime();
		return 0;
	}
	time = GetTime();
	if(time - player.voxTimer[fullname] <= level.sndPlayerVox[category][subcategory].delayBeforePlayAgain * 1000)
	{
		return 1;
	}
	player.voxTimer[fullname] = time;
	return 0;
}

/*
	Name: function_3eed1e04
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x5C58
	Size: 0x1A8
	Parameters: 1
	Flags: None
	Line Number: 1555
*/
function function_3eed1e04(aliasPrefix)
{
	var_b3ae5382 = 0;
	for(i = 1; i < 50; i++)
	{
		if(SoundExists(aliasPrefix + "_" + i))
		{
			var_b3ae5382 = i;
			break;
		}
	}
	if(!var_b3ae5382)
	{
		return var_b3ae5382;
	}
	var_73eebf17 = RandomInt(10);
	if(!var_73eebf17)
	{
		return var_b3ae5382;
	}
	for(a = 0; a < var_73eebf17; a++)
	{
		var_578aeb9c = 0;
		start_index = var_b3ae5382 + 1;
		max_index = var_b3ae5382 + 50;
		for(z = start_index; z < max_index; z++)
		{
			if(SoundExists(aliasPrefix + "_" + z))
			{
				var_578aeb9c = 1;
				var_b3ae5382 = z;
				break;
			}
		}
		if(!var_578aeb9c)
		{
			return var_b3ae5382;
		}
	}
	return var_b3ae5382;
}

/*
	Name: zmbVoxGetLineVariant
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x5E08
	Size: 0x218
	Parameters: 3
	Flags: None
	Line Number: 1607
*/
function zmbVoxGetLineVariant(prefix, suffix, force_variant)
{
	if(!isdefined(self.sound_dialog))
	{
		self.sound_dialog = [];
		self.sound_dialog_available = [];
	}
	if(!isdefined(self.sound_dialog[suffix]))
	{
		num_variants = zm_spawner::get_number_variants(prefix + suffix);
		if(num_variants <= 0)
		{
			num_variants = function_3eed1e04(prefix + suffix);
			if(num_variants <= 0)
			{
				return undefined;
			}
			else
			{
				return prefix + suffix + "_" + num_variants;
			}
		}
		for(i = 0; i < num_variants; i++)
		{
			self.sound_dialog[suffix][i] = i;
		}
		self.sound_dialog_available[suffix] = [];
	}
	if(self.sound_dialog_available[suffix].size <= 0)
	{
		for(i = 0; i < self.sound_dialog[suffix].size; i++)
		{
			self.sound_dialog_available[suffix][i] = self.sound_dialog[suffix][i];
		}
	}
	Variation = Array::random(self.sound_dialog_available[suffix]);
	ArrayRemoveValue(self.sound_dialog_available[suffix], Variation);
	if(isdefined(force_variant))
	{
		Variation = force_variant;
	}
	return prefix + suffix + "_" + Variation;
}

/*
	Name: areNearbySpeakersActive
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x6028
	Size: 0x1B0
	Parameters: 1
	Flags: None
	Line Number: 1661
*/
function areNearbySpeakersActive(radius)
{
	if(!isdefined(radius))
	{
		radius = 1000;
	}
	nearbySpeakerActive = 0;
	speakers = GetPlayers();
	foreach(person in speakers)
	{
		if(self == person)
		{
			continue;
		}
		if(person zm_utility::is_player())
		{
			if(person.sessionstate != "playing")
			{
				continue;
			}
			if(person laststand::player_is_in_laststand())
			{
				continue;
			}
		}
		if(isdefined(person.isSpeaking) && person.isSpeaking && (!(isdefined(person.ignoreNearbySpkrs) && person.ignoreNearbySpkrs)))
		{
			if(DistanceSquared(self.origin, person.origin) < radius * radius)
			{
				nearbySpeakerActive = 1;
			}
		}
	}
	return nearbySpeakerActive;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: musicState_Create
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x61E0
	Size: 0x2C8
	Parameters: 8
	Flags: None
	Line Number: 1708
*/
function musicState_Create(stateName, playType, musName1, musName2, musName3, musName4, musName5, musName6)
{
	if(!isdefined(playType))
	{
		playType = 1;
	}
	if(!isdefined(level.musicsystem))
	{
		level.musicsystem = spawnstruct();
		level.musicsystem.Queue = 0;
		level.musicsystem.currentplaytype = 0;
		level.musicsystem.currentSet = undefined;
		level.musicsystem.states = [];
	}
	level.musicsystem.states[stateName] = spawnstruct();
	level.musicsystem.states[stateName].playType = playType;
	level.musicsystem.states[stateName].musArray = Array();
	if(isdefined(musName1))
	{
		Array::add(level.musicsystem.states[stateName].musArray, musName1);
	}
	if(isdefined(musName2))
	{
		Array::add(level.musicsystem.states[stateName].musArray, musName2);
	}
	if(isdefined(musName3))
	{
		Array::add(level.musicsystem.states[stateName].musArray, musName3);
	}
	if(isdefined(musName4))
	{
		Array::add(level.musicsystem.states[stateName].musArray, musName4);
	}
	if(isdefined(musName5))
	{
		Array::add(level.musicsystem.states[stateName].musArray, musName5);
	}
	if(isdefined(musName6))
	{
		Array::add(level.musicsystem.states[stateName].musArray, musName6);
	}
}

/*
	Name: sndMusicSystem_CreateState
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x64B0
	Size: 0x1D8
	Parameters: 4
	Flags: None
	Line Number: 1761
*/
function sndMusicSystem_CreateState(state, stateName, playType, delay)
{
	if(!isdefined(playType))
	{
		playType = 1;
	}
	if(!isdefined(delay))
	{
		delay = 0;
	}
	if(!isdefined(level.musicsystem))
	{
		level.musicsystem = spawnstruct();
		level.musicsystem.ent = spawn("script_origin", (0, 0, 0));
		level.musicsystem.Queue = 0;
		level.musicsystem.currentplaytype = 0;
		level.musicsystem.currentstate = undefined;
		level.musicsystem.states = [];
	}
	m = level.musicsystem;
	if(!isdefined(m.states[state]))
	{
		m.states[state] = spawnstruct();
		m.states[state] = Array();
	}
	m.states[state][m.states[state].size].stateName = stateName;
	m.states[state][m.states[state].size].playType = playType;
}

/*
	Name: sndmusicsystem_playstate
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x6690
	Size: 0x1B8
	Parameters: 1
	Flags: None
	Line Number: 1800
*/
function sndmusicsystem_playstate(state)
{
	if(!isdefined(level.musicsystem))
	{
		return;
	}
	m = level.musicsystem;
	if(!isdefined(m.states[state]))
	{
		return;
	}
	s = level.musicsystem.states[state];
	playType = s.playType;
	if(m.currentplaytype > 0)
	{
		if(playType == 1)
		{
			return;
		}
		else if(playType == 2)
		{
			level thread sndMusicSystem_QueueState(state);
		}
		else if(playType > m.currentplaytype || (playType == 3 && m.currentplaytype == 3))
		{
			if(isdefined(level.musicsystemoverride) && level.musicsystemoverride && playType != 5)
			{
				return;
			}
			else
			{
				level sndmusicsystem_stopandflush();
				level thread playState(state);
			}
		}
	}
	else if(!(isdefined(level.musicsystemoverride) && level.musicsystemoverride) || playType == 5)
	{
		level thread playState(state);
	}
}

/*
	Name: playState
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x6850
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 1852
*/
function playState(state)
{
	level endon("sndStateStop");
	m = level.musicsystem;
	musArray = level.musicsystem.states[state].musArray;
	if(musArray.size <= 0)
	{
		return;
	}
	musToPlay = musArray[randomIntRange(0, musArray.size)];
	m.currentplaytype = m.states[state].playType;
	m.currentstate = state;
	wait(0.1);
	if(isdefined(level.sndPlayStateOverride))
	{
		perplayer = level [[level.sndPlayStateOverride]](state);
		if(!(isdefined(perplayer) && perplayer))
		{
			music::setmusicstate(musToPlay);
		}
	}
	else
	{
		music::setmusicstate(musToPlay);
	}
	aliasname = "mus_" + musToPlay + "_intro";
	playbacktime = soundgetplaybacktime(aliasname);
	if(!isdefined(playbacktime) || playbacktime <= 0)
	{
		waittime = 1;
	}
	else
	{
		waittime = playbacktime * 0.001;
	}
	wait(waittime);
	m.currentplaytype = 0;
	m.currentstate = undefined;
}

/*
	Name: sndMusicSystem_QueueState
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x6A50
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 1902
*/
function sndMusicSystem_QueueState(state)
{
	level endon("sndQueueFlush");
	m = level.musicsystem;
	count = 0;
	if(isdefined(m.Queue) && m.Queue)
	{
		return;
	}
	else
	{
		m.Queue = 1;
		while(m.currentplaytype > 0)
		{
			wait(0.5);
			count++;
			if(count >= 25)
			{
				m.Queue = 0;
				return;
			}
		}
		level thread playState(state);
		m.Queue = 0;
	}
}

/*
	Name: sndmusicsystem_stopandflush
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x6B48
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1939
*/
function sndmusicsystem_stopandflush()
{
	level notify("sndQueueFlush");
	level.musicsystem.Queue = 0;
	level notify("sndStateStop");
	level.musicsystem.currentplaytype = 0;
	level.musicsystem.currentstate = undefined;
}

/*
	Name: sndMusicSystem_IsAbleToPlay
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x6BA8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1958
*/
function sndMusicSystem_IsAbleToPlay()
{
	if(!isdefined(level.musicsystem))
	{
		return 0;
	}
	if(!isdefined(level.musicsystem.currentplaytype))
	{
		return 0;
	}
	if(level.musicsystem.currentplaytype >= 4)
	{
		return 0;
	}
	return 1;
}

/*
	Name: sndMusicSystem_LocationsInit
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x6C00
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 1985
*/
function sndMusicSystem_LocationsInit(locationArray)
{
	if(!isdefined(locationArray) || locationArray.size <= 0)
	{
		return;
	}
	level.musicsystem.locationArray = locationArray;
	level thread sndMusicSystem_Locations(locationArray);
}

/*
	Name: sndMusicSystem_Locations
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x6C60
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 2005
*/
function sndMusicSystem_Locations(locationArray)
{
	numCut = 0;
	level.sndLastZone = undefined;
	while(1)
	{
		level waittill("newzoneActive", activeZone);
		wait(0.1);
		if(!sndLocationShouldPlay(locationArray, activeZone))
		{
			continue;
		}
		level thread sndmusicsystem_playstate(activeZone);
		locationArray = sndCurrentLocationArray(locationArray, activeZone, numCut, 3);
		level.sndLastZone = activeZone;
		if(numCut >= 3)
		{
			numCut = 0;
		}
		else
		{
			numCut++;
		}
		level waittill("between_round_over");
	}
}

/*
	Name: sndLocationShouldPlay
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x6D58
	Size: 0x128
	Parameters: 2
	Flags: None
	Line Number: 2042
*/
function sndLocationShouldPlay(Array, activeZone)
{
	shouldPlay = 0;
	if(level.musicsystem.currentplaytype >= 3)
	{
		level thread sndLocationQueue(activeZone);
		return shouldPlay;
	}
	foreach(place in Array)
	{
		if(place == activeZone)
		{
			shouldPlay = 1;
		}
	}
	if(shouldPlay == 0)
	{
		return shouldPlay;
	}
	if(zm_zonemgr::any_player_in_zone(activeZone))
	{
		shouldPlay = 1;
	}
	else
	{
		shouldPlay = 0;
	}
	return shouldPlay;
}

/*
	Name: sndCurrentLocationArray
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x6E88
	Size: 0xF0
	Parameters: 4
	Flags: None
	Line Number: 2082
*/
function sndCurrentLocationArray(current_array, activeZone, numCut, num)
{
	if(numCut >= num)
	{
		current_array = level.musicsystem.locationArray;
	}
	foreach(place in current_array)
	{
		if(place == activeZone)
		{
			ArrayRemoveValue(current_array, place);
			break;
		}
	}
	return current_array;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: sndLocationQueue
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x6F80
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 2111
*/
function sndLocationQueue(zone)
{
	level endon("newzoneActive");
	while(level.musicsystem.currentplaytype >= 3)
	{
		wait(0.5);
	}
	level notify("newzoneActive", zone);
}

/*
	Name: sndMusicSystem_EESetup
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x6FD8
	Size: 0x338
	Parameters: 6
	Flags: None
	Line Number: 2131
*/
function sndMusicSystem_EESetup(state, origin1, origin2, origin3, origin4, origin5)
{
	if(GetDvarString("ui_mapname") == "3391299194")
	{
		return;
	}
	var_3ced4bd3 = Array();
	if(isdefined(origin1))
	{
		if(!isdefined(var_3ced4bd3))
		{
			var_3ced4bd3 = [];
		}
		else if(!IsArray(var_3ced4bd3))
		{
			var_3ced4bd3 = Array(var_3ced4bd3);
		}
	}
	var_3ced4bd3[var_3ced4bd3.size] = origin1;
	if(isdefined(origin2))
	{
		if(!isdefined(var_3ced4bd3))
		{
			var_3ced4bd3 = [];
		}
		else if(!IsArray(var_3ced4bd3))
		{
			var_3ced4bd3 = Array(var_3ced4bd3);
		}
	}
	var_3ced4bd3[var_3ced4bd3.size] = origin2;
	if(isdefined(origin3))
	{
		if(!isdefined(var_3ced4bd3))
		{
			var_3ced4bd3 = [];
		}
		else if(!IsArray(var_3ced4bd3))
		{
			var_3ced4bd3 = Array(var_3ced4bd3);
		}
	}
	var_3ced4bd3[var_3ced4bd3.size] = origin3;
	if(isdefined(origin4))
	{
		if(!isdefined(var_3ced4bd3))
		{
			var_3ced4bd3 = [];
		}
		else if(!IsArray(var_3ced4bd3))
		{
			var_3ced4bd3 = Array(var_3ced4bd3);
		}
	}
	var_3ced4bd3[var_3ced4bd3.size] = origin4;
	if(isdefined(origin5))
	{
		if(!isdefined(var_3ced4bd3))
		{
			var_3ced4bd3 = [];
		}
		else if(!IsArray(var_3ced4bd3))
		{
			var_3ced4bd3 = Array(var_3ced4bd3);
		}
	}
	var_3ced4bd3[var_3ced4bd3.size] = origin5;
	if(var_3ced4bd3.size > 0)
	{
		level.var_8e46c49e = var_3ced4bd3.size;
		level.var_98528449 = 0;
		foreach(origin in var_3ced4bd3)
		{
			level thread sndMusicSystem_EEWait(origin, state);
		}
		return;
	}
	ERROR: Bad function call
}

/*
	Name: sndMusicSystem_EEWait
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x7318
	Size: 0x160
	Parameters: 2
	Flags: None
	Line Number: 2221
*/
function sndMusicSystem_EEWait(origin, state)
{
	if(GetDvarString("ui_mapname") == "3391299194")
	{
		return;
	}
	temp_ent = spawn("script_origin", origin);
	temp_ent PlayLoopSound("zmb_meteor_loop");
	temp_ent thread secretUse("main_music_egg_hit", VectorScale((0, 1, 0), 255), &sndMusicSystem_EEOverride);
	temp_ent waittill("main_music_egg_hit", player);
	temp_ent StopLoopSound(1);
	player playsound("zmb_meteor_activate");
	level.var_98528449++;
	if(level.var_98528449 >= level.var_8e46c49e)
	{
		level notify("hash_a1b1dadb");
		level thread sndmusicsystem_playstate(state);
	}
	temp_ent delete();
	return;
}

/*
	Name: sndMusicSystem_EEOverride
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x7480
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 2253
*/
function sndMusicSystem_EEOverride(arg1, arg2)
{
	if(GetDvarString("ui_mapname") == "3391299194")
	{
		return;
	}
	if(isdefined(level.musicsystem.currentplaytype) && level.musicsystem.currentplaytype >= 4)
	{
		return 0;
	}
	return 1;
}

/*
	Name: secretUse
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x74F8
	Size: 0x1D0
	Parameters: 5
	Flags: None
	Line Number: 2276
*/
function secretUse(notify_string, color, qualifier_func, arg1, arg2)
{
	if(GetDvarString("ui_mapname") == "3391299194")
	{
		return;
		waittillframeend;
	}
	while(1)
	{
		if(!isdefined(self))
		{
			return;
		}
		/#
			print3d(self.origin, "Dev Block strings are not supported", color, 1);
		#/
		players = level.players;
		foreach(player in players)
		{
			qualifier_passed = 1;
			if(isdefined(qualifier_func))
			{
				qualifier_passed = player [[qualifier_func]](arg1, arg2);
			}
			if(qualifier_passed && DistanceSquared(self.origin, player.origin) < 4096)
			{
				if(player laststand::is_facing(self))
				{
					if(player useButtonPressed())
					{
						self notify(notify_string, player);
						return;
					}
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_708d8f98
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x76D0
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 2326
*/
function function_708d8f98()
{
	if(!isdefined(level.zmAnnouncerPrefix))
	{
		level.zmAnnouncerPrefix = "vox_" + "zmba" + "_";
	}
	sndAnnouncerVoxAdd("carpenter", "powerup_carpenter_0");
	sndAnnouncerVoxAdd("insta_kill", "powerup_instakill_0");
	sndAnnouncerVoxAdd("double_points", "powerup_doublepoints_0");
	sndAnnouncerVoxAdd("nuke", "powerup_nuke_0");
	sndAnnouncerVoxAdd("full_ammo", "powerup_maxammo_0");
	sndAnnouncerVoxAdd("fire_sale", "powerup_firesale_0");
	sndAnnouncerVoxAdd("minigun", "powerup_deathmachine_0");
	sndAnnouncerVoxAdd("bouns_points_player", "powerups_bonus_7");
	sndAnnouncerVoxAdd("boxmove", "event_magicbox_0");
	sndAnnouncerVoxAdd("dogstart", "event_dogstart_0");
	sndAnnouncerVoxAdd("powerup_negative", "powerup_negative");
	sndAnnouncerVoxAdd("points_negative", "points_negative");
	sndAnnouncerVoxAdd("bonus_points_team", "points_positive");
	sndAnnouncerVoxAdd("random_weapon", "random_weapon");
	sndAnnouncerVoxAdd("random", "random");
}

/*
	Name: sndAnnouncer_Init
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x78F0
	Size: 0x240
	Parameters: 0
	Flags: None
	Line Number: 2359
*/
function sndAnnouncer_Init()
{
	if(!isdefined(level.zmAnnouncerPrefix))
	{
		level.zmAnnouncerPrefix = "vox_" + "zmba" + "_";
	}
	sndAnnouncerVoxAdd("boxmove", "event_magicbox_0");
	sndAnnouncerVoxAdd("dogstart", "event_dogstart_0");
	if(GetDvarString("ui_mapname") == "3391299194")
	{
		return;
	}
	sndAnnouncerVoxAdd("carpenter", "powerup_carpenter_0");
	sndAnnouncerVoxAdd("insta_kill", "powerup_instakill_0");
	sndAnnouncerVoxAdd("double_points", "powerup_doublepoints_0");
	sndAnnouncerVoxAdd("nuke", "powerup_nuke_0");
	sndAnnouncerVoxAdd("full_ammo", "powerup_maxammo_0");
	sndAnnouncerVoxAdd("fire_sale", "powerup_firesale_0");
	sndAnnouncerVoxAdd("minigun", "powerup_death_machine_0");
	sndAnnouncerVoxAdd("bouns_points_player", "powerups_bonus_7");
	sndAnnouncerVoxAdd("powerup_negative", "powerup_negative");
	sndAnnouncerVoxAdd("points_negative", "points_negative");
	sndAnnouncerVoxAdd("bonus_points_team", "points_positive");
	sndAnnouncerVoxAdd("random_weapon", "random_weapon");
	sndAnnouncerVoxAdd("random", "random");
}

/*
	Name: function_25d41fcb
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x7B38
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 2396
*/
function function_25d41fcb()
{
	level.zmAnnouncerPrefix = "vox_abcd_";
	sndAnnouncerVoxAdd("carpenter", "powerups_carpenter_6");
	sndAnnouncerVoxAdd("insta_kill", "powerups_insta_3");
	sndAnnouncerVoxAdd("double_points", "powerups_double_2");
	sndAnnouncerVoxAdd("nuke", "powerups_nuke_0");
	sndAnnouncerVoxAdd("full_ammo", "powerups_ammo_1");
	sndAnnouncerVoxAdd("fire_sale", "powerups_firesale_5");
	sndAnnouncerVoxAdd("minigun", "powerups_mingun_4");
	sndAnnouncerVoxAdd("bouns_points_player", "powerups_bonus_7");
	sndAnnouncerVoxAdd("bonus_points_team", "points_positive");
	sndAnnouncerVoxAdd("boxmove", "event_magicbox_0");
	sndAnnouncerVoxAdd("dogstart", "event_dogstart_0");
}

/*
	Name: function_44e59d8e
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x7CB8
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 2422
*/
function function_44e59d8e()
{
	level.zmAnnouncerPrefix = "vox_shad_";
	sndAnnouncerVoxAdd("carpenter", "powerup_cerpenter_6");
	sndAnnouncerVoxAdd("insta_kill", "powerup_insta_3");
	sndAnnouncerVoxAdd("double_points", "powerup_double_2");
	sndAnnouncerVoxAdd("nuke", "powerup_nuke_0");
	sndAnnouncerVoxAdd("full_ammo", "powerup_ammo_1");
	sndAnnouncerVoxAdd("fire_sale", "powerup_firesale_5");
	sndAnnouncerVoxAdd("minigun", "powerup_minigun_4");
	sndAnnouncerVoxAdd("bouns_points_player", "powerup_bonus_7");
	sndAnnouncerVoxAdd("boxmove", "event_magicbox_0");
	sndAnnouncerVoxAdd("dogstart", "event_dogstart_0");
}

/*
	Name: sndAnnouncerVoxAdd
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x7E18
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 2447
*/
function sndAnnouncerVoxAdd(type, suffix)
{
	if(!isdefined(level.zmAnnouncerVox))
	{
		level.zmAnnouncerVox = Array();
	}
	level.zmAnnouncerVox[type] = suffix;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: sndAnnouncerPlayVox
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x7E70
	Size: 0x2D8
	Parameters: 3
	Flags: None
	Line Number: 2468
*/
function sndAnnouncerPlayVox(type, player, var_e7ec256f)
{
	if(!isdefined(var_e7ec256f))
	{
		var_e7ec256f = 0;
	}
	if(!isdefined(level.zmAnnouncerVox[type]))
	{
		return;
	}
	prefix = level.zmAnnouncerPrefix;
	suffix = level.zmAnnouncerVox[type];
	if(isdefined(var_e7ec256f) && var_e7ec256f && level.script == "zm_moon")
	{
		if(prefix == "vox_zmbar_")
		{
			prefix = "vox_rich_";
			prefix = "zmb_" + prefix;
		}
	}
	if(SoundExists(prefix + suffix))
	{
		if(isdefined(level.var_720cfa56))
		{
			if(isdefined(level.var_720cfa56[prefix + suffix]))
			{
				return;
			}
		}
		else
		{
			level.var_720cfa56 = [];
		}
		level.var_720cfa56[prefix + suffix] = 1;
		if(!isdefined(player))
		{
			if(isdefined(level.zmAnnouncerTalking) && level.zmAnnouncerTalking)
			{
				while(isdefined(level.zmAnnouncerTalking) && level.zmAnnouncerTalking)
				{
					wait(0.048);
				}
				wait(0.048);
			}
			if(isdefined(level.zmAnnouncerTalking) && level.zmAnnouncerTalking)
			{
				while(isdefined(level.zmAnnouncerTalking) && level.zmAnnouncerTalking)
				{
					wait(0.048);
				}
			}
			level.zmAnnouncerTalking = 1;
			namespace_cc012897::Send(prefix + suffix);
			playsoundatposition(prefix + suffix, (0, 0, 0));
			var_53a95046 = soundgetplaybacktime(prefix + suffix) / 1000;
			if(var_53a95046 > 1.2)
			{
				wait(1.2);
			}
			else
			{
				wait(var_53a95046);
			}
			level.zmAnnouncerTalking = 0;
		}
		else
		{
			player thread namespace_cc012897::Send(prefix + suffix, "player");
			player playsoundtoplayer(prefix + suffix, player);
		}
		level.var_720cfa56[prefix + suffix] = undefined;
	}
}

/*
	Name: zmbAIVox_NotifyConvert
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x8150
	Size: 0x320
	Parameters: 1
	Flags: None
	Line Number: 2552
*/
function zmbAIVox_NotifyConvert(model)
{
	if(GetDvarString("ui_mapname") == "3391299194")
	{
		self thread function_24d9631b(model);
		return;
	}
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	self thread zmbAIVox_PlayDeath();
	self thread zmbAIVox_PlayElectrocution();
	while(1)
	{
		self waittill("bhtn_action_notify", notify_string);
		if(notify_string == "ambient" && self.zombie_move_speed == "super_sprint")
		{
			notify_string = "sprint";
		}
		switch(notify_string)
		{
			case "pain":
			{
				level thread zmbAIVox_PlayVox(self, notify_string, 1, 9);
				break;
			}
			case "death":
			{
				self thread function_b23255ce();
				break;
			}
			case "behind":
			{
				level thread zmbAIVox_PlayVox(self, notify_string, 1, 9);
				break;
			}
			case "attack_melee":
			{
				if(!isdefined(self.animName) || (self.animName != "zombie" && self.animName != "quad_zombie"))
				{
					level thread zmbAIVox_PlayVox(self, notify_string, 1, 8, 1);
					break;
				}
			}
			case "attack_melee_zhd":
			{
				level thread zmbAIVox_PlayVox(self, "attack_melee", 1, 8, 1);
				break;
			}
			case "electrocute":
			{
				level thread zmbAIVox_PlayVox(self, notify_string, 1, 7);
				break;
			}
			case "close":
			{
				level thread zmbAIVox_PlayVox(self, notify_string, 1, 6);
				break;
			}
			case "ambient":
			case "crawler":
			case "sprint":
			case "super_sprint":
			case "taunt":
			case "teardown":
			{
				level thread zmbAIVox_PlayVox(self, notify_string, 0);
				break;
			}
			default
			{
				if(isdefined(level._zmbAIVox_SpecialType))
				{
					if(isdefined(level._zmbAIVox_SpecialType[notify_string]))
					{
						level thread zmbAIVox_PlayVox(self, notify_string, 0);
						break;
					}
				}
			}
		}
	}
}

/*
	Name: zmbAIVox_PlayVox
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x8478
	Size: 0x380
	Parameters: 5
	Flags: None
	Line Number: 2646
*/
function zmbAIVox_PlayVox(zombie, type, override, priority, delayAmbientVox)
{
	if(!isdefined(delayAmbientVox))
	{
		delayAmbientVox = 0;
	}
	zombie endon("death");
	if(!isdefined(zombie))
	{
		return;
	}
	if(!isdefined(zombie.voicePrefix))
	{
		return;
	}
	if(!isdefined(priority))
	{
		priority = 1;
	}
	if(!isdefined(zombie.currentvoxpriority))
	{
		zombie.currentvoxpriority = 1;
	}
	if(!isdefined(self.delayAmbientVox))
	{
		self.delayAmbientVox = 0;
	}
	if(type == "ambient" || type == "sprint" || type == "super_sprint" || type == "crawler" && (isdefined(self.delayAmbientVox) && self.delayAmbientVox))
	{
		return;
	}
	if(delayAmbientVox)
	{
		self.delayAmbientVox = 1;
		self thread zmbAIVox_AmbientDelay();
	}
	alias = "zmb_vocals_" + zombie.voicePrefix + "_" + type;
	if(sndIsNetworkSafe())
	{
		if(isdefined(override) && override)
		{
			if(isdefined(zombie.currentvox) && priority > zombie.currentvoxpriority)
			{
				zombie stopsound(zombie.currentvox);
			}
			if(type == "death" || type == "death_whimsy")
			{
				zombie playsound(alias);
				return;
			}
		}
		if(zombie.talking === 1 && priority < zombie.currentvoxpriority)
		{
			return;
		}
		zombie.talking = 1;
		if(zombie is_last_zombie() && type == "ambient")
		{
			alias = alias + "_loud";
		}
		zombie.currentvox = alias;
		zombie.currentvoxpriority = priority;
		zombie PlaySoundOnTag(alias, "j_head");
		playbacktime = soundgetplaybacktime(alias);
		if(!isdefined(playbacktime))
		{
			playbacktime = 1;
		}
		if(playbacktime >= 0)
		{
			playbacktime = playbacktime * 0.001;
		}
		else
		{
			playbacktime = 1;
		}
		wait(playbacktime);
		zombie.talking = 0;
		zombie.currentvox = undefined;
		zombie.currentvoxpriority = 1;
	}
}

/*
	Name: function_b23255ce
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x8800
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 2739
*/
function function_b23255ce()
{
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.var_e6343efa) && self.var_e6343efa)
	{
		level thread zmbAIVox_PlayVox(self, "quack_ee_alfat", 1, 10);
		return;
	}
	if(isdefined(self.bgb_tone_death) && self.bgb_tone_death)
	{
		level thread zmbAIVox_PlayVox(self, "death_whimsy", 1, 10);
		return;
	}
	level thread zmbAIVox_PlayVox(self, "death", 1, 10);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: zmbAIVox_PlayDeath
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x88C0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 2770
*/
function zmbAIVox_PlayDeath()
{
	self endon("disconnect");
	self waittill("death", attacker, meansOfDeath);
	if(isdefined(self))
	{
		self thread function_b23255ce();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: zmbAIVox_PlayElectrocution
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x8920
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 2792
*/
function zmbAIVox_PlayElectrocution()
{
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("damage", amount, attacker, direction_vec, point, type, tagName, modelName, partName, weapon);
		if(weapon.name == "zombie_beast_lightning_dwl" || weapon.name == "zombie_beast_lightning_dwl2" || weapon.name == "zombie_beast_lightning_dwl3")
		{
			self notify("bhtn_action_notify", "electrocute");
		}
	}
}

/*
	Name: zmbAIVox_AmbientDelay
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x8A38
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 2816
*/
function zmbAIVox_AmbientDelay()
{
	self notify("sndAmbientDelay");
	self endon("sndAmbientDelay");
	self endon("death");
	self endon("disconnect");
	self endon("death");
	wait(2);
	self.delayAmbientVox = 0;
}

/*
	Name: networkSafeReset
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x8A98
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 2837
*/
function networkSafeReset()
{
	while(1)
	{
		level._numZmbAIVox = 0;
		util::wait_network_frame();
	}
}

/*
	Name: sndIsNetworkSafe
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x8AD0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 2856
*/
function sndIsNetworkSafe()
{
	if(!isdefined(level._numZmbAIVox))
	{
		level thread networkSafeReset();
	}
	if(level._numZmbAIVox >= 2)
	{
		return 0;
	}
	level._numZmbAIVox++;
	return 1;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: is_last_zombie
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x8B20
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2882
*/
function is_last_zombie()
{
	if(zombie_utility::get_current_zombie_count() <= 1)
	{
		return 1;
	}
	return 0;
}

/*
	Name: sndRadioSetup
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x8B50
	Size: 0x468
	Parameters: 7
	Flags: None
	Line Number: 2901
*/
function sndRadioSetup(alias_prefix, is_sequential, origin1, origin2, origin3, origin4, origin5)
{
	if(!isdefined(is_sequential))
	{
		is_sequential = 0;
	}
	radio = spawnstruct();
	radio.counter = 1;
	radio.alias_prefix = alias_prefix;
	radio.isplaying = 0;
	radio.Array = Array();
	if(isdefined(origin1))
	{
		if(!isdefined(radio.Array))
		{
			radio.Array = [];
		}
		else if(!IsArray(radio.Array))
		{
			radio.Array = Array(radio.Array);
		}
	}
	radio.Array[radio.Array.size] = origin1;
	if(isdefined(origin2))
	{
		if(!isdefined(radio.Array))
		{
			radio.Array = [];
		}
		else if(!IsArray(radio.Array))
		{
			radio.Array = Array(radio.Array);
		}
	}
	radio.Array[radio.Array.size] = origin2;
	if(isdefined(origin3))
	{
		if(!isdefined(radio.Array))
		{
			radio.Array = [];
		}
		else if(!IsArray(radio.Array))
		{
			radio.Array = Array(radio.Array);
		}
	}
	radio.Array[radio.Array.size] = origin3;
	if(isdefined(origin4))
	{
		if(!isdefined(radio.Array))
		{
			radio.Array = [];
		}
		else if(!IsArray(radio.Array))
		{
			radio.Array = Array(radio.Array);
		}
	}
	radio.Array[radio.Array.size] = origin4;
	if(isdefined(origin5))
	{
		if(!isdefined(radio.Array))
		{
			radio.Array = [];
		}
		else if(!IsArray(radio.Array))
		{
			radio.Array = Array(radio.Array);
		}
	}
	radio.Array[radio.Array.size] = origin5;
	if(radio.Array.size > 0)
	{
		for(i = 0; i < radio.Array.size; i++)
		{
			level thread sndRadioWait(radio.Array[i], radio, is_sequential, i + 1);
		}
	}
}

/*
	Name: sndRadioWait
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x8FC0
	Size: 0x268
	Parameters: 4
	Flags: None
	Line Number: 2991
*/
function sndRadioWait(origin, radio, is_sequential, num)
{
	temp_ent = spawn("script_origin", origin);
	temp_ent thread secretUse("sndRadioHit", VectorScale((0, 0, 1), 255), &sndRadio_Override, radio);
	temp_ent waittill("hash_678c47ee", player);
	if(!(isdefined(is_sequential) && is_sequential))
	{
		var_48a5e056 = num;
	}
	else
	{
		var_48a5e056 = radio.counter;
	}
	var_aae31f82 = radio.alias_prefix + var_48a5e056;
	var_c3d43d75 = zm_spawner::get_number_variants(var_aae31f82);
	if(var_c3d43d75 > 0)
	{
		radio.isplaying = 1;
		for(i = 0; i < var_c3d43d75; i++)
		{
			temp_ent playsound(var_aae31f82 + "_" + i);
			playbacktime = soundgetplaybacktime(var_aae31f82 + "_" + i);
			thread namespace_cc012897::Send(var_aae31f82 + "_" + i);
			if(!isdefined(playbacktime))
			{
				playbacktime = 1;
			}
			if(playbacktime >= 0)
			{
				playbacktime = playbacktime * 0.001;
			}
			else
			{
				playbacktime = 1;
			}
			wait(playbacktime);
		}
	}
	radio.counter++;
	radio.isplaying = 0;
	temp_ent delete();
}

/*
	Name: sndRadio_Override
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x9230
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 3044
*/
function sndRadio_Override(arg1, arg2)
{
	if(isdefined(arg1) && arg1.isplaying == 1)
	{
		return 0;
	}
	return 1;
}

/*
	Name: sndPerksJingles_Timer
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x9278
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 3063
*/
function sndPerksJingles_Timer()
{
	self endon("death");
	self notify("sndPerksJingles_Timer");
	self endon("sndPerksJingles_Timer");
	if(level.script == "zm_prototype")
	{
		return;
	}
	if(isdefined(self.sndJingleCooldown))
	{
		self.sndJingleCooldown = 0;
	}
	while(1)
	{
		wait(RandomFloatRange(30, 60));
		if(randomIntRange(0, 100) <= 10 && (!(isdefined(self.sndJingleCooldown) && self.sndJingleCooldown)))
		{
			self thread sndPerksJingles_Player(0);
		}
	}
}

/*
	Name: function_fc1be732
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x9350
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 3096
*/
function function_fc1be732(perk)
{
	if(level.script == "zm_zod")
	{
		switch(perk)
		{
			case "specialty_quickrevive":
			{
				return "mus_perks_revive_jingle_zod";
			}
			case "specialty_deadshot":
			{
				return "mus_perks_deadshot_jingle_zod";
			}
			case "specialty_armorvest":
			{
				return "mus_perks_jugganog_jingle_zod";
			}
			case "specialty_fastreload":
			{
				return "mus_perks_speed_jingle_zod";
			}
			case "specialty_widowswine":
			{
				return "mus_perks_widow_jingle";
			}
			case "specialty_staminup":
			{
				return "mus_perks_stamin_jingle_zod";
			}
			case "specialty_additionalprimaryweapon":
			{
				return "mus_perks_mulekick_jingle_zod";
			}
			case "specialty_doubletap2":
			{
				return "mus_perks_doubletap_jingle_zod";
			}
		}
	}
	switch(perk)
	{
		case "specialty_quickrevive":
		{
			return "mus_perks_revive_jingle";
		}
		case "specialty_deadshot":
		{
			return "mus_perks_deadshot_jingle";
		}
		case "specialty_armorvest":
		{
			return "mus_perks_jugganog_jingle";
		}
		case "specialty_fastreload":
		{
			return "mus_perks_speed_jingle";
		}
		case "specialty_widowswine":
		{
			return "mus_perks_widow_jingle";
		}
		case "specialty_tombstone":
		{
			return "mus_perks_tombstone_jingle";
		}
		case "specialty_phdflopper":
		{
			return "mus_perks_phdflopper_jingle";
		}
		case "specialty_staminup":
		{
			return "mus_perks_stamin_jingle";
		}
		case "specialty_additionalprimaryweapon":
		{
			return "mus_perks_mulekick_jingle";
		}
		case "specialty_doubletap2":
		{
			return "mus_perks_doubletap_jingle";
		}
	}
}

/*
	Name: function_adb3e950
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x94C0
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 3191
*/
function function_adb3e950(perk)
{
	if(level.script == "zm_zod")
	{
		switch(perk)
		{
			case "specialty_quickrevive":
			{
				return "mus_perks_revive_sting_zod";
			}
			case "specialty_deadshot":
			{
				return "mus_perks_deadshot_sting_zod";
			}
			case "specialty_armorvest":
			{
				return "mus_perks_jugganog_sting_zod";
			}
			case "specialty_fastreload":
			{
				return "mus_perks_speed_sting_zod";
			}
			case "specialty_widowswine":
			{
				return "mus_perks_widow_sting";
			}
			case "specialty_staminup":
			{
				return "mus_perks_stamin_sting";
			}
			case "specialty_additionalprimaryweapon":
			{
				return "mus_perks_mulekick_sting_zod";
			}
			case "specialty_doubletap2":
			{
				return "mus_perks_doubletap_sting_zod";
			}
		}
	}
	switch(perk)
	{
		case "specialty_quickrevive":
		{
			return "mus_perks_revive_sting";
		}
		case "specialty_deadshot":
		{
			return "mus_perks_deadshot_sting";
		}
		case "specialty_armorvest":
		{
			return "mus_perks_jugganog_sting";
		}
		case "specialty_fastreload":
		{
			return "mus_perks_speed_sting";
		}
		case "specialty_widowswine":
		{
			return "mus_perks_widow_sting";
		}
		case "specialty_tombstone":
		{
			return "mus_perks_tombstone_sting";
		}
		case "specialty_phdflopper":
		{
			return "mus_perks_phdflopper_sting";
		}
		case "specialty_staminup":
		{
			return "mus_perks_stamin_sting";
		}
		case "specialty_additionalprimaryweapon":
		{
			return "mus_perks_mulekick_sting";
		}
		case "specialty_doubletap2":
		{
			return "mus_perks_doubletap_sting";
		}
	}
}

/*
	Name: function_bdac178a
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x9630
	Size: 0x248
	Parameters: 0
	Flags: None
	Line Number: 3286
*/
function function_bdac178a()
{
	level endon("end_game");
	level flag::wait_till("initial_blackscreen_passed");
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		vending_triggers[i].script_label = function_adb3e950(vending_triggers[i].script_noteworthy);
		vending_triggers[i].script_sound = function_fc1be732(vending_triggers[i].script_noteworthy);
		vending_triggers[i].sndJingleCooldown = 0;
		vending_triggers[i] notify("sndPerksJingles_Timer");
	}
	var_e3955304 = vending_triggers[RandomInt(vending_triggers.size)];
	if(randomIntRange(0, 100) <= 10 && (!(isdefined(var_e3955304.sndJingleCooldown) && var_e3955304.sndJingleCooldown)))
	{
		var_e3955304 thread sndPerksJingles_Player(0);
	}
	for(;;)
	{
		wait(RandomFloatRange(30, 60));
		var_e3955304 = vending_triggers[RandomInt(vending_triggers.size)];
		if(randomIntRange(0, 100) <= 10 && (!(isdefined(var_e3955304.sndJingleCooldown) && var_e3955304.sndJingleCooldown)))
		{
			var_e3955304 thread sndPerksJingles_Player(0);
		}
	}
}

/*
	Name: function_83cf340e
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x9880
	Size: 0x2F8
	Parameters: 0
	Flags: None
	Line Number: 3324
*/
function function_83cf340e()
{
	self endon("death");
	self notify("hash_fcec914f");
	self endon("hash_fcec914f");
	if(level.script == "zm_tomb")
	{
		self.script_sound = "mus_perks_tomb_jingle";
		self.script_label = "mus_perks_tomb_sting";
	}
	else if(level.script == "zm_zod")
	{
		self.script_label = function_adb3e950(self.script_noteworthy);
		self.script_sound = function_fc1be732(self.script_noteworthy);
	}
	if(isdefined(self.script_label) && self.script_label != "")
	{
	}
	else
	{
		self.script_label = function_adb3e950(self.script_noteworthy);
	}
	if(isdefined(self.script_sound) && self.script_sound != "")
	{
	}
	else
	{
		self.script_sound = function_fc1be732(self.script_noteworthy);
		if(!isdefined(self.script_sound))
		{
			return;
		}
	}
	if(isdefined(self.sndJingleCooldown))
	{
		self.sndJingleCooldown = 0;
	}
	level flag::wait_till("initial_blackscreen_passed");
	self notify("sndPerksJingles_Timer");
	while(!(isdefined(self.power_on) && self.power_on == 1) || self.machine ishidden() || !self IsTriggerEnabled())
	{
		wait(0.05);
	}
	if(level.script == "zm_tomb")
	{
		self thread sndPerksJingles_Player(0);
	}
	while(1)
	{
		while(!(isdefined(self.power_on) && self.power_on == 1) || self.machine ishidden() || !self IsTriggerEnabled())
		{
			wait(0.05);
		}
		wait(RandomFloatRange(30, 60));
		if(randomIntRange(0, 100) <= 10 && (!(isdefined(self.sndJingleCooldown) && self.sndJingleCooldown)))
		{
			self thread sndPerksJingles_Player(0);
		}
	}
}

/*
	Name: function_93cab1cd
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x9B80
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 3395
*/
function function_93cab1cd()
{
	self endon("death");
	self notify("sndPerksJingles_Timer");
	self endon("sndPerksJingles_Timer");
	if(isdefined(self.sndJingleCooldown))
	{
		self.sndJingleCooldown = 0;
	}
	while(1)
	{
		while(!self.var_4d6e7e5e)
		{
			wait(0.5);
		}
		wait(RandomFloatRange(30, 60));
		if(randomIntRange(0, 100) <= 10 && (!(isdefined(self.sndJingleCooldown) && self.sndJingleCooldown)))
		{
			self thread sndPerksJingles_Player(0);
		}
	}
}

/*
	Name: function_c81cd4bf
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x9C58
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 3428
*/
function function_c81cd4bf()
{
	self endon("death");
	self notify("sndPerksJingles_Timer");
	self endon("sndPerksJingles_Timer");
	if(isdefined(self.sndJingleCooldown))
	{
		self.sndJingleCooldown = 0;
	}
	while(1)
	{
		while(!function_c09fd563(self.script_int) || !self.current_perk_random_machine)
		{
			wait(0.5);
		}
		wait(RandomFloatRange(30, 60));
		if(randomIntRange(0, 100) <= 10 && (!(isdefined(self.sndJingleCooldown) && self.sndJingleCooldown)))
		{
			self thread sndPerksJingles_Player(0);
		}
	}
}

/*
	Name: sndPerksJingles_Player
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x9D50
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 3461
*/
function sndPerksJingles_Player(type)
{
	self endon("death");
	if(isdefined(self.sndJingleActive) && self.sndJingleActive)
	{
		return;
	}
	if(!isdefined(self.sndJingleActive))
	{
		self.sndJingleActive = 0;
	}
	alias = self.script_sound;
	if(type == 1)
	{
		alias = self.script_label;
	}
	self.str_jingle_alias = alias;
	if(!(isdefined(self.sndJingleActive) && self.sndJingleActive))
	{
		self.sndJingleActive = 1;
		playsoundatposition(alias, self.origin + VectorScale((0, 0, 1), 20));
		if(type == 0)
		{
			self.sndJingleCooldown = 1;
		}
		playbacktime = soundgetplaybacktime(alias);
		if(!isdefined(playbacktime) || playbacktime <= 0)
		{
			wait(1);
		}
		else
		{
			wait(playbacktime / 1000);
		}
		if(type == 0)
		{
			self thread sndPerksJingles_Cooldown();
		}
		self.sndJingleActive = 0;
	}
}

/*
	Name: sndPerksJingles_Cooldown
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x9EC0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 3513
*/
function sndPerksJingles_Cooldown()
{
	self endon("death");
	wait(45);
	self.sndJingleCooldown = 0;
}

/*
	Name: sndConversation_Init
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x9EE8
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 3530
*/
function sndConversation_Init(name, specialEndon)
{
	if(!isdefined(specialEndon))
	{
		specialEndon = undefined;
	}
	if(!isdefined(level.sndConversations))
	{
		level.sndConversations = Array();
	}
	level.sndConversations[name] = spawnstruct();
	level.sndConversations[name].specialEndon = specialEndon;
}

/*
	Name: sndConversation_AddLine
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x9F78
	Size: 0x2A8
	Parameters: 4
	Flags: None
	Line Number: 3554
*/
function sndConversation_AddLine(name, line, player_or_random, ignorePlayer)
{
	if(!isdefined(ignorePlayer))
	{
		ignorePlayer = 5;
	}
	thisConvo = level.sndConversations[name];
	if(!isdefined(thisConvo.line))
	{
		thisConvo.line = Array();
	}
	if(!isdefined(thisConvo.player))
	{
		thisConvo.player = Array();
	}
	if(!isdefined(thisConvo.ignorePlayer))
	{
		thisConvo.ignorePlayer = Array();
	}
	if(!isdefined(thisConvo.line))
	{
		thisConvo.line = [];
	}
	else if(!IsArray(thisConvo.line))
	{
		thisConvo.line = Array(thisConvo.line);
	}
	thisConvo.line[thisConvo.line.size] = line;
	if(!isdefined(thisConvo.player))
	{
		thisConvo.player = [];
	}
	else if(!IsArray(thisConvo.player))
	{
		thisConvo.player = Array(thisConvo.player);
	}
	thisConvo.player[thisConvo.player.size] = player_or_random;
	if(!isdefined(thisConvo.ignorePlayer))
	{
		thisConvo.ignorePlayer = [];
	}
	else if(!IsArray(thisConvo.ignorePlayer))
	{
		thisConvo.ignorePlayer = Array(thisConvo.ignorePlayer);
	}
	thisConvo.ignorePlayer[thisConvo.ignorePlayer.size] = ignorePlayer;
}

/*
	Name: sndConversation_Play
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xA228
	Size: 0x2D8
	Parameters: 1
	Flags: None
	Line Number: 3612
*/
function sndConversation_Play(name)
{
	thisConvo = level.sndConversations[name];
	level endon("sndConvoInterrupt");
	if(isdefined(thisConvo.specialEndon))
	{
		level endon(thisConvo.specialEndon);
	}
	while(isAnyoneTalking())
	{
		wait(0.5);
	}
	while(isdefined(level.sndVoxOverride) && level.sndVoxOverride)
	{
		wait(0.5);
	}
	level.sndVoxOverride = 1;
	for(i = 0; i < thisConvo.line.size; i++)
	{
		if(thisConvo.player[i] == 4)
		{
			speaker = getRandomCharacter(thisConvo.ignorePlayer[i]);
		}
		else
		{
			speaker = getSpecificCharacter(thisConvo.player[i]);
		}
		if(!isdefined(speaker))
		{
			continue;
		}
		if(isCurrentSpeakerAbleToTalk(speaker))
		{
			level.currentConvoPlayer = speaker;
			if(isdefined(level.vox_name_complete))
			{
				level.currentConvoLine = thisConvo.line[i];
			}
			else
			{
				level.currentConvoLine = "vox_plr_" + speaker.characterindex + "_" + thisConvo.line[i];
				speaker thread sndConvoInterrupt();
			}
			speaker PlaySoundOnTag(level.currentConvoLine, "J_Head");
			var_53a95046 = soundgetplaybacktime(level.currentConvoLine);
			thread namespace_cc012897::Send(level.currentConvoLine, "all");
			waitPlayBackTime(level.currentConvoLine);
			level notify("sndConvoLineDone");
		}
	}
	level.sndVoxOverride = 0;
	level notify("sndConversationDone");
	level.currentConvoLine = undefined;
	level.currentConvoPlayer = undefined;
}

/*
	Name: sndConvoStopCurrentConversation
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xA508
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 3678
*/
function sndConvoStopCurrentConversation()
{
	level notify("sndConvoInterrupt");
	level notify("sndConversationDone");
	level.sndVoxOverride = 0;
	if(isdefined(level.currentConvoPlayer) && isdefined(level.currentConvoLine))
	{
		level.currentConvoPlayer stopsound(level.currentConvoLine);
		level.currentConvoLine = undefined;
		level.currentConvoPlayer = undefined;
	}
}

/*
	Name: waitPlayBackTime
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xA588
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 3701
*/
function waitPlayBackTime(alias)
{
	playbacktime = soundgetplaybacktime(alias);
	if(!isdefined(playbacktime))
	{
		playbacktime = 1;
	}
	if(playbacktime >= 0)
	{
		playbacktime = playbacktime * 0.001;
	}
	else
	{
		playbacktime = 1;
	}
	wait(playbacktime);
}

/*
	Name: isCurrentSpeakerAbleToTalk
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xA608
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 3729
*/
function isCurrentSpeakerAbleToTalk(player)
{
	if(!isdefined(player))
	{
		return 0;
	}
	if(player.sessionstate != "playing")
	{
		return 0;
	}
	if(isdefined(player.laststand) && player.laststand)
	{
		return 0;
	}
	return 1;
}

/*
	Name: getRandomCharacter
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xA678
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 3756
*/
function getRandomCharacter(Ignore)
{
	Array = level.players;
	Array::randomize(Array);
	foreach(guy in Array)
	{
		if(guy.characterindex == Ignore)
		{
			continue;
		}
		return guy;
	}
	return undefined;
}

/*
	Name: getSpecificCharacter
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xA748
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 3781
*/
function getSpecificCharacter(charIndex)
{
	foreach(guy in level.players)
	{
		if(guy.characterindex == charIndex)
		{
			return guy;
		}
	}
	return undefined;
}

/*
	Name: isAnyoneTalking
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xA7F0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 3803
*/
function isAnyoneTalking()
{
	foreach(player in level.players)
	{
		if(isdefined(player.isSpeaking) && player.isSpeaking)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: sndConvoInterrupt
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xA898
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 3825
*/
function sndConvoInterrupt()
{
	level endon("sndConvoLineDone");
	while(1)
	{
		if(!isdefined(self))
		{
			return;
		}
		max_dist_squared = 0;
		check_pos = self.origin;
		count = 0;
		foreach(player in level.players)
		{
			if(self == player)
			{
				continue;
			}
			if(Distance2DSquared(player.origin, self.origin) >= 810000)
			{
				count++;
			}
		}
		if(count == level.players.size - 1)
		{
			break;
		}
		wait(0.25);
	}
	level thread sndConvoStopCurrentConversation();
}

/*
	Name: water_vox
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xA9F0
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 3867
*/
function water_vox()
{
	self endon("death");
	self endon("disconnect");
	level endon("end_game");
	self.voxUnderwaterTime = 0;
	self.voxEmergeBreath = 0;
	self.voxDrowning = 0;
	while(1)
	{
		if(self IsPlayerUnderwater())
		{
			if(!self.voxUnderwaterTime && !self.voxEmergeBreath)
			{
				self vo_clear_underwater();
				self.voxUnderwaterTime = GetTime();
			}
			else if(self.voxUnderwaterTime)
			{
				if(GetTime() > self.voxUnderwaterTime + 3000)
				{
					self.voxUnderwaterTime = 0;
					self.voxEmergeBreath = 1;
				}
			}
		}
		else if(self.voxDrowning)
		{
			self playerExert("underwater_gasp");
			self.voxDrowning = 0;
			self.voxEmergeBreath = 0;
		}
		if(self.voxEmergeBreath)
		{
			self playerExert("underwater_emerge");
			self.voxEmergeBreath = 0;
		}
		else
		{
			self.voxUnderwaterTime = 0;
		}
		wait(0.05);
	}
}

/*
	Name: vo_clear_underwater
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xAB68
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 3922
*/
function vo_clear_underwater()
{
	self stopsounds();
	self notify("stop_vo_convo");
	self.str_vo_being_spoken = "";
	self.n_vo_priority = 0;
	self.isSpeaking = 0;
	level.sndVoxOverride = 0;
	b_in_a_e_speakers = 0;
	foreach(e_checkme in level.a_e_speakers)
	{
		if(e_checkme == self)
		{
			b_in_a_e_speakers = 1;
			break;
		}
	}
	if(isdefined(b_in_a_e_speakers) && b_in_a_e_speakers)
	{
		ArrayRemoveValue(level.a_e_speakers, self);
	}
}

/*
	Name: sndPlayerHitAlert
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xAC98
	Size: 0xD0
	Parameters: 4
	Flags: None
	Line Number: 3955
*/
function sndPlayerHitAlert(e_victim, str_meansofdeath, e_inflictor, weapon)
{
	if(!(isdefined(level.sndZHDAudio) && level.sndZHDAudio))
	{
		return;
	}
	if(!isPlayer(self))
	{
		return;
	}
	if(!CheckForValidMod(str_meansofdeath))
	{
		return;
	}
	if(!CheckForValidWeapon(weapon))
	{
		return;
	}
	if(!CheckForValidAIType(e_victim))
	{
		return;
	}
	str_alias = "zmb_hit_alert";
	self thread sndPlayerHitAlert_PlaySound(str_alias);
}

/*
	Name: sndPlayerHitAlert_PlaySound
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xAD70
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 3991
*/
function sndPlayerHitAlert_PlaySound(str_alias)
{
	self endon("disconnect");
	if(self.hitSoundTracker)
	{
		self.hitSoundTracker = 0;
		self playsoundtoplayer(str_alias, self);
		wait(0.05);
		self.hitSoundTracker = 1;
	}
}

/*
	Name: CheckForValidMod
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xADD0
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 4013
*/
function CheckForValidMod(str_meansofdeath)
{
	if(!isdefined(str_meansofdeath))
	{
		return 0;
	}
	switch(str_meansofdeath)
	{
		case "MOD_CRUSH":
		case "MOD_GRENADE_SPLASH":
		case "MOD_HIT_BY_OBJECT":
		case "MOD_MELEE":
		case "MOD_MELEE_ASSASSINATE":
		case "MOD_MELEE_WEAPON_BUTT":
		{
			return 0;
		}
	}
	return 1;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: CheckForValidWeapon
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xAE40
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 4045
*/
function CheckForValidWeapon(weapon)
{
	return 1;
}

/*
	Name: CheckForValidAIType
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xAE58
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 4060
*/
function CheckForValidAIType(e_victim)
{
	return 1;
}

/*
	Name: function_24d9631b
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xAE70
	Size: 0x308
	Parameters: 1
	Flags: None
	Line Number: 4075
*/
function function_24d9631b(character)
{
	self endon("hash_f49a0cb");
	self endon("hash_82223b0f");
	level endon("hash_d4d277fe");
	self thread function_3162cf37(character);
	self thread zmbAIVox_PlayElectrocution();
	while(1)
	{
		self waittill("hash_9083ca66", notify_string);
		switch(notify_string)
		{
			case "pain":
			{
				level thread function_559ffd8c(self, character, notify_string, 1, 9);
				break;
			}
			case "death":
			{
				if(isdefined(self.bgb_tone_death) && self.bgb_tone_death)
				{
					level thread function_559ffd8c(self, character, "death_whimsy", 1, 10);
				}
				else
				{
					level thread function_559ffd8c(self, character, notify_string, 1, 10);
					break;
				}
			}
			case "behind":
			{
				level thread function_559ffd8c(self, character, notify_string, 1, 9);
				break;
			}
			case "attack_melee":
			{
				if(!isdefined(self.animName) || (self.animName != "zombie" && self.animName != "quad_zombie"))
				{
					level thread function_559ffd8c(self, character, notify_string, 1, 8, 1);
					break;
				}
			}
			case "attack_melee_zhd":
			{
				level thread function_559ffd8c(self, character, "attack_melee", 1, 8, 1);
				break;
			}
			case "electrocute":
			{
				level thread function_559ffd8c(self, character, notify_string, 1, 7);
				break;
			}
			case "close":
			{
				level thread function_559ffd8c(self, character, notify_string, 1, 6);
				break;
			}
			case "ambient":
			case "crawler":
			case "sprint":
			case "taunt":
			case "teardown":
			{
				level thread function_559ffd8c(self, character, notify_string, 0);
				break;
			}
			default
			{
				if(isdefined(level._zmbAIVox_SpecialType))
				{
					if(isdefined(level._zmbAIVox_SpecialType[notify_string]))
					{
						level thread function_559ffd8c(self, character, notify_string, 0);
						break;
					}
				}
			}
		}
	}
	return;
	.var_60707e62 = undefined;
}

/*
	Name: function_559ffd8c
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xB180
	Size: 0x4B8
	Parameters: 6
	Flags: None
	Line Number: 4168
*/
function function_559ffd8c(zombie, character, type, override, priority, delayAmbientVox)
{
	if(!isdefined(delayAmbientVox))
	{
		delayAmbientVox = 0;
	}
	zombie endon("hash_f49a0cb");
	if(!isdefined(zombie))
	{
		return;
	}
	if(!isdefined(zombie.voicePrefix))
	{
		return;
	}
	if(!isdefined(priority))
	{
		priority = 1;
	}
	if(!isdefined(zombie.currentvoxpriority))
	{
		zombie.currentvoxpriority = 1;
	}
	if(!isdefined(self.delayAmbientVox))
	{
		self.delayAmbientVox = 0;
	}
	if(type == "ambient" || type == "sprint" || (type == "crawler" && (isdefined(self.delayAmbientVox) && self.delayAmbientVox)))
	{
		return;
	}
	if(delayAmbientVox)
	{
		self.delayAmbientVox = 1;
		self thread zmbAIVox_AmbientDelay();
	}
	var_b55d3ee7 = "";
	if(character == "zom_mario_halloween_yoshi")
	{
		var_b55d3ee7 = "vox_zmb_hl_yoshi";
	}
	else if(character == "zom_mario_halloween_luigi")
	{
		var_b55d3ee7 = "vox_zmb_hl_luigi";
	}
	else if(character == "zom_mario_halloween_peach")
	{
		var_b55d3ee7 = "vox_zmb_hl_peach";
	}
	else if(character == "zom_mario_halloween_toadette")
	{
		var_b55d3ee7 = "vox_zmb_hl_toadette";
	}
	else if(character == "zom_mario_halloween_wario")
	{
		var_b55d3ee7 = "vox_zmb_hl_wario";
	}
	else if(character == "zom_mario_halloween_waluigi")
	{
		var_b55d3ee7 = "vox_zmb_hl_waluigi";
	}
	else if(character == "zom_mario_halloween_donkey_kong")
	{
		var_b55d3ee7 = "vox_zmb_hl_dk";
	}
	else if(character == "zom_mario_halloween_bowser_jr")
	{
		var_b55d3ee7 = "vox_zmb_hl_bws_jr";
	}
	else if(character == "zom_mario_halloween_diddy_kong")
	{
		var_b55d3ee7 = "vox_zmb_hl_diddy_k";
	}
	else if(character == "zom_mario_halloween_mario")
	{
		var_b55d3ee7 = "vox_zmb_hl_mario";
	}
	alias = var_b55d3ee7 + "_" + type;
	if(sndIsNetworkSafe())
	{
		if(isdefined(override) && override)
		{
			if(isdefined(zombie.currentvox) && priority > zombie.currentvoxpriority)
			{
				zombie stopsound(zombie.currentvox);
			}
			if(type == "death" || type == "death_whimsy")
			{
				zombie playsound(alias);
				return;
			}
		}
		if(zombie.talking === 1 && priority < zombie.currentvoxpriority)
		{
			return;
		}
		zombie.talking = 1;
		if(zombie is_last_zombie() && type == "ambient")
		{
			alias = alias + "_loud";
		}
		zombie.currentvox = alias;
		zombie.currentvoxpriority = priority;
		zombie PlaySoundOnTag(alias, "j_head");
		playbacktime = soundgetplaybacktime(alias);
		if(!isdefined(playbacktime))
		{
			playbacktime = 1;
		}
		if(playbacktime >= 0)
		{
			playbacktime = playbacktime * 0.001;
		}
		else
		{
			playbacktime = 1;
		}
		wait(playbacktime);
		zombie.talking = 0;
		zombie.currentvox = undefined;
		zombie.currentvoxpriority = 1;
	}
}

/*
	Name: function_3162cf37
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xB640
	Size: 0xA4
	Parameters: 1
	Flags: None
	Line Number: 4302
*/
function function_3162cf37(character)
{
	self endon("hash_82223b0f");
	self waittill("hash_f49a0cb", attacker, meansOfDeath);
	if(isdefined(self))
	{
		if(isdefined(self.bgb_tone_death) && self.bgb_tone_death)
		{
			level thread zmbAIVox_PlayVox(self, character, "death_whimsy", 1);
		}
		else
		{
			level thread zmbAIVox_PlayVox(self, character, "death", 1);
		}
	}
}

