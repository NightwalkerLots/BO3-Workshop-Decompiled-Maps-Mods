#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_audio_zhd;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\zm_temple_sq_skits;

#namespace namespace_c3b98877;

/*
	Name: main
	Namespace: namespace_c3b98877
	Checksum: 0x424F4353
	Offset: 0x2D0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 22
*/
function main()
{
	level._audio_custom_weapon_check = &weapon_type_check_custom;
	level._custom_intro_vox = &intro_vox_or_skit;
	level._audio_alias_override = &audio_alias_override;
	level thread setup_music_egg();
	level thread function_6d5ecc2a("location_maze");
	level thread function_6d5ecc2a("location_waterfall");
	level thread function_6d5ecc2a("mine_see");
	level thread function_8e7c8fe0();
	level thread function_45b4acf2();
	return;
}

/*
	Name: audio_alias_override
	Namespace: namespace_c3b98877
	Checksum: 0x424F4353
	Offset: 0x3D0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 46
*/
function audio_alias_override()
{
	level.plr_vox["kill"]["explosive"] = "kill_explosive";
	level.plr_vox["kill"]["explosive_response"] = undefined;
}

/*
	Name: function_d4b7774a
	Namespace: namespace_c3b98877
	Checksum: 0x424F4353
	Offset: 0x420
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function function_d4b7774a()
{
	wait(10);
}

/*
	Name: function_8e7c8fe0
	Namespace: namespace_c3b98877
	Checksum: 0x424F4353
	Offset: 0x438
	Size: 0x2D8
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_8e7c8fe0()
{
	level waittill("end_game");
	wait(2);
	winner = undefined;
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i]._has_anti115) && players[i]._has_anti115 == 1)
		{
			winner = players[i];
			break;
		}
	}
	if(isdefined(winner))
	{
		num = winner.characterindex;
		if(isdefined(winner.zm_random_char))
		{
			num = winner.zm_random_char;
		}
		if(num == 3)
		{
			foreach(player in GetPlayers())
			{
				player playlocalsound("vox_plr_3_gameover_1");
			}
			var_53a95046 = soundgetplaybacktime("vox_plr_3_gameover_1");
			thread namespace_cc012897::Send("vox_plr_3_gameover_1", "all", var_53a95046);
		}
		else
		{
			foreach(player in GetPlayers())
			{
				player playlocalsound("vox_plr_3_gameover_0");
			}
			var_53a95046 = soundgetplaybacktime("vox_plr_3_gameover_0");
			thread namespace_cc012897::Send("vox_plr_3_gameover_0", "all", var_53a95046);
		}
	}
}

/*
	Name: weapon_type_check_custom
	Namespace: namespace_c3b98877
	Checksum: 0x424F4353
	Offset: 0x718
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 129
*/
function weapon_type_check_custom(weapon, magic_box)
{
	if(IsSubStr(weapon.name, "upgraded"))
	{
		return "upgrade";
	}
	w_root = weapon.rootweapon;
	return level.zombie_weapons[w_root].vox;
	waittillframeend;
}

/*
	Name: setup_music_egg
	Namespace: namespace_c3b98877
	Checksum: 0x424F4353
	Offset: 0x7A0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 150
*/
function setup_music_egg()
{
	level thread namespace_52adc03e::function_e753d4f();
	level flag::wait_till("snd_song_completed");
	level thread zm_audio::sndmusicsystem_playstate("pareidolia");
}

/*
	Name: intro_vox_or_skit
	Namespace: namespace_c3b98877
	Checksum: 0x424F4353
	Offset: 0x808
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 167
*/
function intro_vox_or_skit()
{
	playsoundatposition("evt_warp_in", (0, 0, 0));
	wait(3);
	players = GetPlayers();
	if(players.size == 4 && randomIntRange(0, 101) <= 10)
	{
		if(randomIntRange(0, 101) <= 10)
		{
			players[randomIntRange(0, players.size)] thread zm_audio::create_and_play_dialog("eggs", "rod");
		}
		else
		{
			num = randomIntRange(0, 2);
			level thread namespace_435c2400::start_skit("start" + num, players);
		}
	}
	else
	{
		players[randomIntRange(0, players.size)] thread zm_audio::create_and_play_dialog("general", "start");
	}
}

/*
	Name: function_6d5ecc2a
	Namespace: namespace_c3b98877
	Checksum: 0x424F4353
	Offset: 0x990
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 200
*/
function function_6d5ecc2a(place)
{
	wait(3);
	struct = struct::get("vox_" + place, "targetname");
	if(!isdefined(struct))
	{
		return;
	}
	var_5cb1355d = spawn("trigger_radius", struct.origin - VectorScale((0, 0, 1), 100), 0, 250, 200);
	while(1)
	{
		var_5cb1355d waittill("trigger", who);
		if(isPlayer(who))
		{
			who thread zm_audio::create_and_play_dialog("general", place);
			if(place == "location_maze")
			{
				wait(90);
				break;
			}
			else
			{
			}
		}
	}
	var_5cb1355d delete();
}

/*
	Name: function_45b4acf2
	Namespace: namespace_c3b98877
	Checksum: 0x424F4353
	Offset: 0xAD0
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 238
*/
function function_45b4acf2()
{
	var_18d6690a = GetEntArray("zhdsnd_pans", "targetname");
	Array::thread_all(var_18d6690a, &function_19277046);
	n_count = 0;
	a_order = Array(1, 1, 5);
	if(var_18d6690a.size <= 0)
	{
		return;
	}
	while(1)
	{
		level waittill("hash_ab740a84", num);
		if(num == a_order[n_count])
		{
			n_count++;
			if(n_count >= 3)
			{
				break;
			}
		}
		else
		{
			n_count = 0;
		}
	}
	level flag::set("snd_zhdegg_activate");
}

/*
	Name: function_19277046
	Namespace: namespace_c3b98877
	Checksum: 0x424F4353
	Offset: 0xBF8
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 277
*/
function function_19277046()
{
	level endon("hash_f9e823ac");
	while(1)
	{
		self waittill("damage", damage, attacker, dir, loc, str_type, model, tag, part, weapon, flags);
		if(!level flag::get("gongs_resonating"))
		{
			continue;
		}
		if(!isPlayer(attacker))
		{
			continue;
		}
		if(weapon != level.start_weapon)
		{
			continue;
		}
		if(str_type != "MOD_PISTOL_BULLET")
		{
			continue;
		}
		level notify("hash_ab740a84", self.script_int);
		playsoundatposition("zmb_zhd_plate_hit", self.origin);
	}
}

