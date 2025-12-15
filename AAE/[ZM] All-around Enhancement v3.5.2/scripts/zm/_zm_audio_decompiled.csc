#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_story_sub;

#namespace zm_audio;

/*
	Name: __init__sytem__
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xC10
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("zm_audio", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0xC50
	Size: 0x1A60
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function __init__()
{
	if(GetDvarString("ui_mapname") == "3391299194")
	{
		clientfield::register("allplayers", "charindex", 1, 10, "int", &charindex_cb, 0, 1);
	}
	else
	{
		clientfield::register("allplayers", "charindex", 1, 3, "int", &charindex_cb, 0, 1);
	}
	clientfield::register("toplayer", "isspeaking", 1, 1, "int", &isspeaking_cb, 0, 1);
	if(!isdefined(level.exert_sounds))
	{
		level.exert_sounds = [];
	}
	level.exert_sounds[0]["playerbreathinsound"] = "vox_exert_generic_inhale";
	level.exert_sounds[0]["playerbreathoutsound"] = "vox_exert_generic_exhale";
	level.exert_sounds[0]["playerbreathgaspsound"] = "vox_exert_generic_exhale";
	level.exert_sounds[0]["falldamage"] = "vox_exert_generic_pain";
	level.exert_sounds[0]["mantlesoundplayer"] = "vox_exert_generic_mantle";
	level.exert_sounds[0]["meleeswipesoundplayer"] = "vox_exert_generic_knifeswipe";
	level.exert_sounds[0]["dtplandsoundplayer"] = "vox_exert_generic_pain";
	if(GetDvarString("ui_mapname") == "3391299194")
	{
		level.exert_sounds[1]["meleeswipesoundplayer"][0] = "vox_plr_0_exert_melee_0";
		level.exert_sounds[1]["meleeswipesoundplayer"][1] = "vox_plr_0_exert_melee_1";
		level.exert_sounds[1]["meleeswipesoundplayer"][2] = "vox_plr_0_exert_melee_2";
		level.exert_sounds[1]["meleeswipesoundplayer"][3] = "vox_plr_0_exert_melee_3";
		level.exert_sounds[1]["meleeswipesoundplayer"][4] = "vox_plr_0_exert_melee_4";
		level.exert_sounds[2]["meleeswipesoundplayer"][0] = "vox_plr_1_exert_melee_0";
		level.exert_sounds[2]["meleeswipesoundplayer"][1] = "vox_plr_1_exert_melee_1";
		level.exert_sounds[2]["meleeswipesoundplayer"][2] = "vox_plr_1_exert_melee_2";
		level.exert_sounds[2]["meleeswipesoundplayer"][3] = "vox_plr_1_exert_melee_3";
		level.exert_sounds[2]["meleeswipesoundplayer"][4] = "vox_plr_1_exert_melee_4";
		level.exert_sounds[3]["meleeswipesoundplayer"][0] = "vox_plr_2_exert_melee_0";
		level.exert_sounds[3]["meleeswipesoundplayer"][1] = "vox_plr_2_exert_melee_1";
		level.exert_sounds[3]["meleeswipesoundplayer"][2] = "vox_plr_2_exert_melee_2";
		level.exert_sounds[3]["meleeswipesoundplayer"][3] = "vox_plr_2_exert_melee_3";
		level.exert_sounds[3]["meleeswipesoundplayer"][4] = "vox_plr_2_exert_melee_4";
		level.exert_sounds[4]["meleeswipesoundplayer"][0] = "vox_plr_3_exert_melee_0";
		level.exert_sounds[4]["meleeswipesoundplayer"][1] = "vox_plr_3_exert_melee_1";
		level.exert_sounds[4]["meleeswipesoundplayer"][2] = "vox_plr_3_exert_melee_2";
		level.exert_sounds[4]["meleeswipesoundplayer"][3] = "vox_plr_3_exert_melee_3";
		level.exert_sounds[4]["meleeswipesoundplayer"][4] = "vox_plr_3_exert_melee_4";
		level.exert_sounds[5]["meleeswipesoundplayer"][0] = "vox_plr_4_exert_melee_0";
		level.exert_sounds[5]["meleeswipesoundplayer"][1] = "vox_plr_4_exert_melee_1";
		level.exert_sounds[5]["meleeswipesoundplayer"][2] = "vox_plr_4_exert_melee_2";
		level.exert_sounds[5]["meleeswipesoundplayer"][3] = "vox_plr_4_exert_melee_3";
		level.exert_sounds[5]["meleeswipesoundplayer"][4] = "vox_plr_4_exert_melee_4";
		level.exert_sounds[6]["meleeswipesoundplayer"][0] = "vox_plr_5_exert_melee_0";
		level.exert_sounds[6]["meleeswipesoundplayer"][1] = "vox_plr_5_exert_melee_1";
		level.exert_sounds[6]["meleeswipesoundplayer"][2] = "vox_plr_5_exert_melee_2";
		level.exert_sounds[6]["meleeswipesoundplayer"][3] = "vox_plr_5_exert_melee_3";
		level.exert_sounds[6]["meleeswipesoundplayer"][4] = "vox_plr_5_exert_melee_4";
		level.exert_sounds[7]["meleeswipesoundplayer"][0] = "vox_plr_6_exert_melee_0";
		level.exert_sounds[7]["meleeswipesoundplayer"][1] = "vox_plr_6_exert_melee_1";
		level.exert_sounds[7]["meleeswipesoundplayer"][2] = "vox_plr_6_exert_melee_2";
		level.exert_sounds[7]["meleeswipesoundplayer"][3] = "vox_plr_6_exert_melee_3";
		level.exert_sounds[7]["meleeswipesoundplayer"][4] = "vox_plr_6_exert_melee_4";
		level.exert_sounds[8]["meleeswipesoundplayer"][0] = "vox_plr_7_exert_melee_0";
		level.exert_sounds[8]["meleeswipesoundplayer"][1] = "vox_plr_7_exert_melee_1";
		level.exert_sounds[8]["meleeswipesoundplayer"][2] = "vox_plr_7_exert_melee_2";
		level.exert_sounds[8]["meleeswipesoundplayer"][3] = "vox_plr_7_exert_melee_3";
		level.exert_sounds[8]["meleeswipesoundplayer"][4] = "vox_plr_7_exert_melee_4";
		level.exert_sounds[9]["meleeswipesoundplayer"][0] = "vox_plr_8_exert_melee_0";
		level.exert_sounds[9]["meleeswipesoundplayer"][1] = "vox_plr_8_exert_melee_1";
		level.exert_sounds[9]["meleeswipesoundplayer"][2] = "vox_plr_8_exert_melee_2";
		level.exert_sounds[9]["meleeswipesoundplayer"][3] = "vox_plr_8_exert_melee_3";
		level.exert_sounds[9]["meleeswipesoundplayer"][4] = "vox_plr_8_exert_melee_4";
		level.exert_sounds[10]["meleeswipesoundplayer"][0] = "vox_plr_9_exert_melee_0";
		level.exert_sounds[10]["meleeswipesoundplayer"][1] = "vox_plr_9_exert_melee_1";
		level.exert_sounds[10]["meleeswipesoundplayer"][2] = "vox_plr_9_exert_melee_2";
		level.exert_sounds[10]["meleeswipesoundplayer"][3] = "vox_plr_9_exert_melee_3";
		level.exert_sounds[10]["meleeswipesoundplayer"][4] = "vox_plr_9_exert_melee_4";
		level.exert_sounds[5]["falldamage"][0] = "vox_plr_4_exert_pain_0";
		level.exert_sounds[5]["falldamage"][1] = "vox_plr_4_exert_pain_1";
		level.exert_sounds[5]["falldamage"][2] = "vox_plr_4_exert_pain_2";
		level.exert_sounds[5]["falldamage"][3] = "vox_plr_4_exert_pain_3";
		level.exert_sounds[5]["falldamage"][4] = "vox_plr_4_exert_pain_4";
		level.exert_sounds[6]["falldamage"][0] = "vox_plr_5_exert_pain_0";
		level.exert_sounds[6]["falldamage"][1] = "vox_plr_5_exert_pain_1";
		level.exert_sounds[6]["falldamage"][2] = "vox_plr_5_exert_pain_2";
		level.exert_sounds[6]["falldamage"][3] = "vox_plr_5_exert_pain_3";
		level.exert_sounds[6]["falldamage"][4] = "vox_plr_5_exert_pain_4";
		level.exert_sounds[7]["falldamage"][0] = "vox_plr_6_exert_pain_0";
		level.exert_sounds[7]["falldamage"][1] = "vox_plr_6_exert_pain_1";
		level.exert_sounds[7]["falldamage"][2] = "vox_plr_6_exert_pain_2";
		level.exert_sounds[7]["falldamage"][3] = "vox_plr_6_exert_pain_3";
		level.exert_sounds[7]["falldamage"][4] = "vox_plr_6_exert_pain_4";
		level.exert_sounds[8]["falldamage"][0] = "vox_plr_7_exert_pain_0";
		level.exert_sounds[8]["falldamage"][1] = "vox_plr_7_exert_pain_1";
		level.exert_sounds[8]["falldamage"][2] = "vox_plr_7_exert_pain_2";
		level.exert_sounds[8]["falldamage"][3] = "vox_plr_7_exert_pain_3";
		level.exert_sounds[8]["falldamage"][4] = "vox_plr_7_exert_pain_4";
		level.exert_sounds[9]["falldamage"][0] = "vox_plr_8_exert_pain_0";
		level.exert_sounds[9]["falldamage"][1] = "vox_plr_8_exert_pain_1";
		level.exert_sounds[9]["falldamage"][2] = "vox_plr_8_exert_pain_2";
		level.exert_sounds[9]["falldamage"][3] = "vox_plr_8_exert_pain_3";
		level.exert_sounds[9]["falldamage"][4] = "vox_plr_8_exert_pain_4";
		level.exert_sounds[10]["falldamage"][0] = "vox_plr_9_exert_pain_0";
		level.exert_sounds[10]["falldamage"][1] = "vox_plr_9_exert_pain_1";
		level.exert_sounds[10]["falldamage"][2] = "vox_plr_9_exert_pain_2";
		level.exert_sounds[10]["falldamage"][3] = "vox_plr_9_exert_pain_3";
		level.exert_sounds[10]["falldamage"][4] = "vox_plr_9_exert_pain_4";
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
	level thread gameover_snapshot();
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x26B8
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 235
*/
function on_player_spawned(localClientNum)
{
}

/*
	Name: delay_set_exert_id
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x26D0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 249
*/
function delay_set_exert_id(newVal)
{
	self endon("entityshutdown");
	self endon("sndEndExertOverride");
	wait(0.5);
	self.player_exert_id = newVal;
}

/*
	Name: charindex_cb
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x2710
	Size: 0xA8
	Parameters: 7
	Flags: None
	Line Number: 267
*/
function charindex_cb(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(!bNewEnt)
	{
		self.player_exert_id = newVal;
		self._first_frame_exert_id_recieved = 1;
		self notify("sndEndExertOverride");
	}
	else if(!isdefined(self._first_frame_exert_id_recieved))
	{
		self._first_frame_exert_id_recieved = 1;
		self thread delay_set_exert_id(newVal);
		return;
	}
}

/*
	Name: isspeaking_cb
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x27C0
	Size: 0x60
	Parameters: 7
	Flags: None
	Line Number: 293
*/
function isspeaking_cb(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(!bNewEnt)
	{
		self.isSpeaking = newVal;
	}
	else
	{
		self.isSpeaking = 0;
	}
}

/*
	Name: zmbMusLooper
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x2828
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 315
*/
function zmbMusLooper()
{
	ent = spawn(0, (0, 0, 0), "script_origin");
	playsound(0, "mus_zmb_gamemode_start", (0, 0, 0));
	wait(10);
	ent PlayLoopSound("mus_zmb_gamemode_loop", 0.05);
	ent thread waitfor_music_stop();
}

/*
	Name: waitfor_music_stop
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x28C8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 334
*/
function waitfor_music_stop()
{
	level waittill("stpm");
	self StopAllLoopSounds(0.1);
	playsound(0, "mus_zmb_gamemode_end", (0, 0, 0));
	wait(1);
	self delete();
}

/*
	Name: playerFallDamageSound
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x2938
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 353
*/
function playerFallDamageSound(client_num, firstperson)
{
	self playerExert(client_num, "falldamage");
}

/*
	Name: clientVoiceSetup
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x2978
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 368
*/
function clientVoiceSetup()
{
	callback::on_localclient_connect(&audio_player_connect);
	players = GetLocalPlayers();
	for(i = 0; i < players.size; i++)
	{
		thread audio_player_connect(i);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: audio_player_connect
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x2A00
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 390
*/
function audio_player_connect(localClientNum)
{
	thread sndVoNotifyPlain(localClientNum, "playerbreathinsound");
	thread sndVoNotifyPlain(localClientNum, "playerbreathoutsound");
	thread sndVoNotifyPlain(localClientNum, "playerbreathgaspsound");
	thread sndVoNotifyPlain(localClientNum, "mantlesoundplayer");
	thread sndVoNotifyPlain(localClientNum, "meleeswipesoundplayer");
	thread sndVoNotifyDTP(localClientNum, "dtplandsoundplayer");
}

/*
	Name: playerExert
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x2AD8
	Size: 0x160
	Parameters: 2
	Flags: None
	Line Number: 410
*/
function playerExert(localClientNum, EXERT)
{
	if(isdefined(self.isSpeaking) && self.isSpeaking == 1)
	{
		return;
	}
	if(isdefined(self.beast_mode) && self.beast_mode)
	{
		return;
	}
	id = level.exert_sounds[0][EXERT];
	if(IsArray(level.exert_sounds[0][EXERT]))
	{
		id = Array::random(level.exert_sounds[0][EXERT]);
	}
	if(isdefined(self.player_exert_id))
	{
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
		self playsound(localClientNum, id);
		return;
	}
	~id;
}

/*
	Name: sndVoNotifyDTP
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x2C40
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 454
*/
function sndVoNotifyDTP(localClientNum, notifyString)
{
	level notify("kill_sndVoNotifyDTP" + localClientNum + notifyString);
	level endon("kill_sndVoNotifyDTP" + localClientNum + notifyString);
	player = undefined;
	while(!isdefined(player))
	{
		player = GetNonPredictedLocalPlayer(localClientNum);
		wait(0.05);
	}
	player endon("disconnect");
	for(;;)
	{
		player waittill(notifyString, surfaceType);
		player playerExert(localClientNum, notifyString);
	}
}

/*
	Name: sndMeleeSwipe
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x2D10
	Size: 0x208
	Parameters: 2
	Flags: None
	Line Number: 482
*/
function sndMeleeSwipe(localClientNum, notifyString)
{
	player = undefined;
	while(!isdefined(player))
	{
		player = GetNonPredictedLocalPlayer(localClientNum);
		wait(0.05);
	}
	player endon("disconnect");
	for(;;)
	{
		player waittill(notifyString);
		currentWeapon = GetCurrentWeapon(localClientNum);
		if(isdefined(level.sndNoMeleeOnClient) && level.sndNoMeleeOnClient)
		{
			return;
		}
		if(isdefined(player.is_player_zombie) && player.is_player_zombie)
		{
			playsound(0, "zmb_melee_whoosh_zmb_plr", player.origin);
		}
		else if(currentWeapon.name == "bowie_knife")
		{
			playsound(0, "zmb_bowie_swing_plr", player.origin);
		}
		else if(currentWeapon.name == "spoon_zm_alcatraz")
		{
			playsound(0, "zmb_spoon_swing_plr", player.origin);
		}
		else if(currentWeapon.name == "spork_zm_alcatraz")
		{
			playsound(0, "zmb_spork_swing_plr", player.origin);
		}
		else
		{
			playsound(0, "zmb_melee_whoosh_plr", player.origin);
		}
	}
}

/*
	Name: sndVoNotifyPlain
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x2F20
	Size: 0xE8
	Parameters: 2
	Flags: None
	Line Number: 532
*/
function sndVoNotifyPlain(localClientNum, notifyString)
{
	level notify("kill_sndVoNotifyPlain" + localClientNum + notifyString);
	level endon("kill_sndVoNotifyPlain" + localClientNum + notifyString);
	player = undefined;
	while(!isdefined(player))
	{
		player = GetNonPredictedLocalPlayer(localClientNum);
		wait(0.05);
	}
	player endon("disconnect");
	for(;;)
	{
		player waittill(notifyString);
		if(isdefined(player.is_player_zombie) && player.is_player_zombie)
		{
		}
		else
		{
			player playerExert(localClientNum, notifyString);
		}
	}
}

/*
	Name: end_gameover_snapshot
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x3010
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 566
*/
function end_gameover_snapshot()
{
	level util::waittill_any("demo_jump", "demo_player_switch", "snd_clear_script_duck");
	wait(1);
	audio::snd_set_snapshot("default");
	level thread gameover_snapshot();
}

/*
	Name: gameover_snapshot
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x3088
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 584
*/
function gameover_snapshot()
{
	level waittill("zesn");
	audio::snd_set_snapshot("zmb_game_over");
	level thread end_gameover_snapshot();
	return;
}

/*
	Name: sndSetZombieContext
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x30D8
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 602
*/
function sndSetZombieContext(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		self setsoundentcontext("grass", "no_grass");
	}
	else
	{
		self setsoundentcontext("grass", "in_grass");
	}
}

/*
	Name: sndZmbLaststand
	Namespace: zm_audio
	Checksum: 0x424F4353
	Offset: 0x3178
	Size: 0x14C
	Parameters: 7
	Flags: None
	Line Number: 624
*/
function sndZmbLaststand(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		playsound(localClientNum, "chr_health_laststand_enter", (0, 0, 0));
		self.inLastStand = 1;
		setsoundcontext("laststand", "active");
		if(!IsSplitscreen())
		{
			forceambientroom("sndHealth_LastStand");
		}
	}
	else if(isdefined(self.inLastStand) && self.inLastStand)
	{
		playsound(localClientNum, "chr_health_laststand_exit", (0, 0, 0));
		self.inLastStand = 0;
		if(!IsSplitscreen())
		{
			forceambientroom("");
		}
	}
	setsoundcontext("laststand", "");
}

