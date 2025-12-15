#include scripts\codescripts\struct;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\weapons\_bouncingbetty;
#include scripts\shared\weapons\_weaponobjects;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_bgb_token;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_placeable_mine;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_octobomb;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_zod_shadowman;
#include scripts\zm\zm_zod_util;
#include scripts\zm\zm_zod_vo;

#namespace namespace_54c8dc69;

/*
	Name: __init__sytem__
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x13F0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 42
*/
function autoexec __init__sytem__()
{
	system::register("zm_zod_ee_side", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x1430
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function __init__()
{
	clientfield::register("world", "change_bouncingbetties", 1, 2, "int");
	clientfield::register("world", "lil_arnie_dance", 1, 1, "int");
	callback::add_weapon_watcher(&function_758cc281);
	callback::add_weapon_watcher(&function_a3213b07);
	zm_placeable_mine::add_mine_type("bouncingbetty_devil", &"MP_BOUNCINGBETTY_PICKUP");
	zm_placeable_mine::add_mine_type("bouncingbetty_holly", &"MP_BOUNCINGBETTY_PICKUP");
	for(i = 0; i < GetDvarInt("com_maxclients"); i++)
	{
		clientfield::register("world", "player" + i + "wearableItem", 15000, 2, "int");
	}
}

/*
	Name: main
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x1598
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 81
*/
function main()
{
	level flag::init("play_vocals");
	level flag::init("awarded_lion_gumball1");
	level flag::init("awarded_lion_gumball2");
	level flag::init("awarded_lion_gumball3");
	level flag::init("awarded_lion_gumball4");
	callback::on_spawned(&on_player_spawned);
	level.riotshield_melee_juke_callback = &function_c6930415;
	level flag::wait_till("all_players_spawned");
	level thread audio_recordings();
	level thread ciphers();
	level thread function_a59032c3();
	level thread function_e947749a();
	level thread function_b943cc04();
	level thread function_d0ee8a03();
	level thread function_67a4dabe();
	level thread function_de14e5a1();
	level thread function_523509c2();
	level thread function_5045e366();
	level thread spare_change();
	level thread function_f93dd0b9();
	level thread function_41ecaace();
}

/*
	Name: on_player_spawned
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x17D8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 116
*/
function on_player_spawned()
{
	self.var_8c06218 = 0;
	self thread function_7a56bf90();
	if(isdefined(self.var_d89174ae) && self.var_d89174ae)
	{
		self thread function_4d249743();
	}
	n_index = zm_utility::get_player_index(self) + 1;
	if(!level flag::get("awarded_lion_gumball" + n_index))
	{
		self thread function_7784eba6();
		return;
	}
}

/*
	Name: function_f93dd0b9
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x1890
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 142
*/
function function_f93dd0b9()
{
	level flag::wait_till("zones_initialized");
	level.var_94e23698 = [];
	var_7533f11 = struct::get_array("shadowman_map", "targetname");
	for(i = 0; i < var_7533f11.size; i++)
	{
		level.var_94e23698[var_7533f11[i].script_string] = var_7533f11[i];
		level.var_94e23698[var_7533f11[i].script_string] thread function_f2485365();
		level.var_94e23698[var_7533f11[i].script_string] thread function_f4bfd0b8();
		if(isdefined(level.var_94e23698[var_7533f11[i].script_string].script_noteworthy))
		{
			level.var_94e23698[var_7533f11[i].script_string] thread function_cbcaa042();
		}
	}
}

/*
	Name: function_f2485365
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x1A10
	Size: 0x210
	Parameters: 0
	Flags: None
	Line Number: 169
*/
function function_f2485365()
{
	level endon("_zombie_game_over");
	self endon("shadowman_leaves");
	if(self.script_string != "play_on_map_load")
	{
		level waittill(self.script_string);
	}
	if(self.script_int != 4)
	{
		self thread function_724b1463();
		self thread function_e00f4f2a();
	}
	self function_1a99877f();
	switch(self.script_int)
	{
		case 5:
		{
			self function_ff688e23();
			break;
		}
		case 0:
		{
			while(!zm_zonemgr::get_players_in_zone(self.script_string))
			{
				wait(0.05);
			}
			self function_188b8017();
			break;
		}
		case 1:
		{
			while(!zm_zonemgr::get_players_in_zone(self.script_string))
			{
				wait(0.05);
			}
			self function_cd7431a8();
			break;
		}
		case 2:
		{
			self function_82fac046();
			break;
		}
		case 3:
		{
			self function_fa56dab0();
			break;
		}
		case 4:
		{
			self function_b066a053();
			break;
		}
	}
	wait(3);
	self namespace_331b1e91::function_f25f7ff3();
	self namespace_331b1e91::function_57b6041b();
	self notify("shadowman_leaves");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f4bfd0b8
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x1C28
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 242
*/
function function_f4bfd0b8()
{
	level waittill("_zombie_game_over");
	if(isdefined(self.var_93dad597))
	{
		if(isdefined(self.var_93dad597))
		{
			self namespace_331b1e91::function_f25f7ff3();
		}
		if(isdefined(self.var_5afdc7fe))
		{
			self namespace_331b1e91::function_57b6041b();
		}
	}
}

/*
	Name: function_cbcaa042
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x1C90
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 268
*/
function function_cbcaa042()
{
	level endon("_zombie_game_over");
	self endon("shadowman_leaves");
	self waittill("shadowman_spawned");
	level.var_94e23698[self.script_noteworthy] notify("shadowman_leaves");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1a99877f
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x1CE0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 288
*/
function function_1a99877f()
{
	foreach(e_player in level.players)
	{
		self thread function_63d2d60e(e_player);
	}
}

/*
	Name: function_63d2d60e
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x1D78
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 306
*/
function function_63d2d60e(e_player)
{
	self endon("shadowman_leaves");
	while(1)
	{
		if(isdefined(e_player) && e_player namespace_b8707f8e::function_2d942575(self.var_93dad597, 1500))
		{
			e_player notify("hash_86ef5199");
			break;
		}
		wait(0.05);
	}
}

/*
	Name: function_82d8ec58
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x1DF0
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 330
*/
function function_82d8ec58()
{
	self endon("shadowman_leaves");
	while(1)
	{
		foreach(player in level.players)
		{
			if(isalive(player) && DistanceSquared(self.var_93dad597.origin, player.origin) < 16384)
			{
				self namespace_331b1e91::function_f25f7ff3();
				self namespace_331b1e91::function_57b6041b();
				self notify("shadowman_leaves");
				return;
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_ff688e23
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x1F20
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 359
*/
function function_ff688e23()
{
	level endon("_zombie_game_over");
	self namespace_331b1e91::shadowman_spawns(1, 1, 0);
	self namespace_331b1e91::function_8888a532(0, 1, 1);
	self notify("shadowman_spawned");
	level.players[0] waittill(self.script_parameters + "_vo_done");
	self thread function_fa2d33a4();
	self thread function_82d8ec58();
	level waittill("hash_5298c49");
}

/*
	Name: function_188b8017
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x1FE0
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 381
*/
function function_188b8017()
{
	level endon("_zombie_game_over");
	self endon("shadowman_leaves");
	self namespace_331b1e91::shadowman_spawns(0, 1);
	self namespace_331b1e91::function_8888a532(0, 1, 0);
	self notify("shadowman_spawned");
	var_bc9ce2d0 = zm_zonemgr::get_zone_from_position(self.origin, 1);
	if(isdefined(var_bc9ce2d0))
	{
		self endon(var_bc9ce2d0);
	}
	while(1)
	{
		foreach(e_player in level.activePlayers)
		{
			if(isdefined(e_player) && e_player namespace_b8707f8e::function_2d942575(self.var_93dad597, 1000))
			{
				return;
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_cd7431a8
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x2140
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 416
*/
function function_cd7431a8()
{
	level endon("_zombie_game_over");
	self endon("shadowman_leaves");
	self namespace_331b1e91::shadowman_spawns(0, 1);
	self namespace_331b1e91::function_8888a532(0, 1, 0);
	self notify("shadowman_spawned");
	var_bc9ce2d0 = zm_zonemgr::get_zone_from_position(self.origin, 1);
	while(!self.var_93dad597 zm_zonemgr::entity_in_zone(var_bc9ce2d0, 0))
	{
		wait(0.05);
	}
}

/*
	Name: function_82fac046
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x2200
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 440
*/
function function_82fac046()
{
	level endon("_zombie_game_over");
	if(self.script_string == "play_on_map_load")
	{
		self namespace_331b1e91::shadowman_spawns(1, 1, 0);
		self namespace_331b1e91::function_8888a532(0, 1, 1);
	}
	else
	{
		self namespace_331b1e91::shadowman_spawns(0, 1);
		self namespace_331b1e91::function_8888a532(0, 1);
	}
	self notify("shadowman_spawned");
	level.players[0] waittill(self.script_parameters + "_vo_done");
	if(self.script_string == "play_on_map_load")
	{
		wait(3);
	}
}

/*
	Name: function_fa56dab0
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x22F0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 471
*/
function function_fa56dab0()
{
	level endon("_zombie_game_over");
	self namespace_331b1e91::shadowman_spawns(0, 1);
	self namespace_331b1e91::function_8888a532(0, 1, 0);
	self notify("shadowman_spawned");
	wait(9);
}

/*
	Name: function_b066a053
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x2358
	Size: 0x2F8
	Parameters: 0
	Flags: None
	Line Number: 490
*/
function function_b066a053()
{
	level endon("_zombie_game_over");
	self endon("shadowman_leaves");
	foreach(var_707e0d1c in level.var_94e23698)
	{
		if(isdefined(var_707e0d1c) && var_707e0d1c !== self)
		{
			var_707e0d1c notify("shadowman_leaves");
		}
	}
	var_7a05a0de = GetEnt("quest_key_pickup", "targetname");
	var_7a05a0de ghost();
	self namespace_331b1e91::shadowman_spawns(0, 1, 0, 1);
	self.var_93dad597 HidePart("tag_weapon_right");
	v_origin = self.var_93dad597 GetTagOrigin("tag_weapon_right");
	self.var_14030b0f = spawn("script_model", v_origin);
	self.var_14030b0f SetModel("p7_fxanim_zm_zod_redemption_key_ritual_mod");
	self.var_14030b0f LinkTo(self.var_93dad597, "tag_weapon_right");
	self.var_14030b0f clientfield::set("item_glow_fx", 1);
	level.players[0] waittill(self.script_parameters + "_vo_done");
	self thread function_98c5d1e5();
	playsoundatposition("zmb_shadowman_transition", (0, 0, 0));
	self.var_14030b0f delete();
	self namespace_331b1e91::function_8888a532(0, 1, 0, 1);
	wait(0.05);
	self.var_5afdc7fe clientfield::set("shadowman_fx", 1);
	self.var_5afdc7fe playsound("zmb_shadowman_tele_in");
	self.var_93dad597 ghost();
	wait(3);
}

/*
	Name: function_98c5d1e5
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x2658
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 532
*/
function function_98c5d1e5()
{
	self endon("shadowman_leaves");
	while(1)
	{
		PlayRumbleOnPosition("zod_shadowman_transformed", self.origin);
		wait(0.1);
	}
}

/*
	Name: function_724b1463
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x26A0
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 552
*/
function function_724b1463()
{
	level endon("_zombie_game_over");
	self endon("shadowman_leaves");
	while(1)
	{
		foreach(player in level.players)
		{
			if(!isdefined(player.shadowman_appearances))
			{
				player.shadowman_appearances = [];
				Array::add(player.shadowman_appearances, self.script_string);
				continue;
			}
			if(player.shadowman_appearances.size > 0)
			{
				foreach(shadowman_appearance in player.shadowman_appearances)
				{
					if(shadowman_appearance == self.script_string)
					{
						var_a7167425 = 0;
						break;
						continue;
					}
					var_a7167425 = 1;
				}
				if(var_a7167425)
				{
					Array::add(player.shadowman_appearances, self.script_string);
					self thread function_1b5affd(player);
					continue;
				}
			}
			Array::add(player.shadowman_appearances, self.script_int);
			self thread function_1b5affd(player);
		}
		wait(0.05);
	}
}

/*
	Name: function_e00f4f2a
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x28E0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 602
*/
function function_e00f4f2a()
{
	var_3a813333 = self;
	self waittill("shadowman_leaves");
	foreach(player in level.players)
	{
		ArrayRemoveValue(player.shadowman_appearances, var_3a813333);
	}
	return;
}

/*
	Name: function_1b5affd
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x29A0
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 623
*/
function function_1b5affd(player)
{
	level endon("_zombie_game_over");
	self endon("shadowman_leaves");
	player endon("disconnect");
	self waittill("shadowman_spawned");
	self.var_93dad597 setvisibletoplayer(player);
	self.var_5afdc7fe setinvisibletoplayer(player);
	while(1)
	{
		var_85e18920 = 0;
		player waittill("lightning_strike");
		n_time_started = GetTime() / 1000;
		while(player.beastmode === 1)
		{
			n_time_current = GetTime() / 1000;
			n_time_elapsed = n_time_current - n_time_started;
			if(n_time_elapsed >= 0.75)
			{
				self.var_93dad597 setvisibletoplayer(player);
				wait(0.05);
				self.var_5afdc7fe setinvisibletoplayer(player);
				break;
			}
			else if(!var_85e18920)
			{
				self.var_5afdc7fe setvisibletoplayer(player);
				wait(0.05);
				self.var_93dad597 setinvisibletoplayer(player);
				var_85e18920 = 1;
			}
			wait(0.05);
		}
	}
}

/*
	Name: audio_recordings
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x2B70
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 669
*/
function audio_recordings()
{
	level.var_4a9b0bd3 = 0;
	a_s_recordings = struct::get_array("audio_recording");
	foreach(s_recording in a_s_recordings)
	{
		s_recording thread function_ccdce665();
	}
}

/*
	Name: function_b69c861
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x2C38
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 689
*/
function function_b69c861()
{
	s_portal = struct::get("maxis_portal");
	self FX::Play("portal_shortcut_closed", s_portal.origin, s_portal.angles, "recording_done");
}

/*
	Name: function_ccdce665
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x2CA8
	Size: 0x648
	Parameters: 0
	Flags: None
	Line Number: 705
*/
function function_ccdce665()
{
	if(isdefined(self.script_noteworthy))
	{
		level flag::wait_till(self.script_noteworthy);
	}
	switch(self.script_string)
	{
		case "lawyer":
		case "partner":
		case "producer":
		case "promoter":
		{
			n_delay = 10;
			n_rings = 2;
			var_a288248d = "zmb_zod_ee_phone_ring";
			break;
		}
		case "reporter":
		{
			n_delay = 0;
			n_rings = 2;
			var_a288248d = "zmb_zod_ee_phonebooth_ring";
			break;
		}
		default
		{
			n_delay = 2;
			n_rings = 1;
			var_a288248d = "zmb_zod_ee_phone_ring";
		}
	}
	wait(n_delay);
	if(isdefined(self.script_string) && self.script_string == "maxis")
	{
		self thread function_b69c861();
		var_a288248d = "zmb_zod_ee_phonemaxis_ring";
	}
	self create_unitrigger();
	self thread function_8faf1d24();
	e_temp = spawn("script_origin", self.origin);
	e_temp thread function_84b739e(n_rings, var_a288248d);
	self waittill("trigger_activated");
	e_temp stopsound(var_a288248d);
	if(isdefined(self.script_string) && self.script_string == "reporter")
	{
		level.var_4a9b0bd3++;
		self.script_string = self.script_string + level.var_4a9b0bd3;
	}
	var_c9fd3802 = [];
	switch(self.script_string)
	{
		case "lawyer":
		{
			var_c9fd3802 = Array("vox_lawy_callback_lawy_0", "vox_lawy_callback_lawy_1", "vox_lawy_callback_lawy_2");
			n_delay = 10;
			break;
		}
		case "maxis":
		{
			var_c9fd3802 = Array("vox_maxis_maxis_radio_0", "vox_maxis_maxis_radio_1", "vox_maxis_maxis_radio_2");
			break;
		}
		case "partner":
		{
			var_c9fd3802 = Array("vox_part_callback_part_0", "vox_part_callback_part_1", "vox_part_callback_part_2", "vox_part_callback_part_3", "vox_part_callback_part_4");
			n_delay = 10;
			break;
		}
		case "producer":
		{
			var_c9fd3802 = Array("vox_prod_callback_prod_0", "vox_prod_callback_prod_1", "vox_prod_callback_prod_2", "vox_prod_callback_prod_3");
			n_delay = 10;
			break;
		}
		case "promoter":
		{
			var_c9fd3802 = Array("vox_prom_callback_prom_0", "vox_prom_callback_prom_1", "vox_prom_callback_prom_2");
			n_delay = 10;
			break;
		}
		case "reporter1":
		{
			var_c9fd3802 = Array("vox_repo_reporter_log_1_0", "vox_repo_reporter_log_1_1", "vox_repo_reporter_log_1_2", "vox_repo_reporter_log_1_3", "vox_repo_reporter_log_1_4", "vox_repo_reporter_log_1_5", "vox_repo_reporter_log_1_6");
			break;
		}
		case "reporter2":
		{
			var_c9fd3802 = Array("vox_repo_reporter_log_2_0", "vox_repo_reporter_log_2_1", "vox_repo_reporter_log_2_2", "vox_repo_reporter_log_2_3", "vox_repo_reporter_log_2_4", "vox_repo_reporter_log_2_5");
			break;
		}
		case "reporter3":
		{
			var_c9fd3802 = Array("vox_repo_reporter_log_3_0", "vox_repo_reporter_log_3_1", "vox_repo_reporter_log_3_2", "vox_repo_reporter_log_3_3", "vox_repo_reporter_log_3_4", "vox_repo_reporter_log_3_5", "vox_repo_reporter_log_3_6");
			break;
		}
		case "shadowman_lawyer":
		{
			var_c9fd3802 = Array("vox_shad_victim_convo_lawy_0", "vox_lawy_victim_convo_lawy_1", "vox_shad_victim_convo_lawy_2", "vox_lawy_victim_convo_lawy_3", "vox_shad_victim_convo_lawy_4", "vox_lawy_victim_convo_lawy_5");
			break;
		}
		case "shadowman_partner":
		{
			var_c9fd3802 = Array("vox_shad_victim_convo_part_0", "vox_part_victim_convo_part_1", "vox_shad_victim_convo_part_2", "vox_part_victim_convo_part_3", "vox_shad_victim_convo_part_4", "vox_part_victim_convo_part_5", "vox_shad_victim_convo_part_6", "vox_part_victim_convo_part_7");
			break;
		}
		case "shadowman_producer":
		{
			var_c9fd3802 = Array("vox_shad_victim_convo_prod_0", "vox_prod_victim_convo_prod_1", "vox_shad_victim_convo_prod_2", "vox_prod_victim_convo_prod_3", "vox_shad_victim_convo_prod_4", "vox_prod_victim_convo_prod_5");
			break;
		}
		case "shadowman_promoter":
		{
			var_c9fd3802 = Array("vox_shad_victim_convo_prom_0", "vox_prom_victim_convo_prom_1", "vox_shad_victim_convo_prom_2", "vox_prom_victim_convo_prom_3", "vox_shad_victim_convo_prom_4", "vox_prom_victim_convo_prom_5", "vox_shad_victim_convo_prom_6", "vox_prom_victim_convo_prom_7");
			break;
		}
	}
	e_temp function_e7a3a98f(var_c9fd3802);
	e_temp delete();
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
	self notify("hash_c46ee2c1");
}

/*
	Name: function_84b739e
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x32F8
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 838
*/
function function_84b739e(n_rings, alias)
{
	if(!isdefined(n_rings))
	{
		n_rings = 1;
	}
	self endon("trigger_activated");
	for(i = 0; i < n_rings; i++)
	{
		self playsound(alias);
		wait(4);
	}
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_e7a3a98f
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x3380
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 865
*/
function function_e7a3a98f(var_c9fd3802)
{
	namespace_b8707f8e::function_218256bd(1);
	foreach(str_line in var_c9fd3802)
	{
		thread namespace_cc012897::Send(str_line);
		self playsoundwithnotify(str_line, str_line + "wait");
		self waittill(str_line + "wait");
		wait(0.05);
	}
	namespace_b8707f8e::function_218256bd(0);
	return;
	~;
}

/*
	Name: function_a59032c3
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x3490
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 890
*/
function function_a59032c3()
{
	level.var_89ad28cd = 0;
	a_radio = GetEntArray("hs_radio", "targetname");
	Array::thread_all(a_radio, &function_68e137c8);
	while(1)
	{
		level waittill("hash_da6d056e");
		if(level.var_89ad28cd == a_radio.size)
		{
			break;
		}
	}
	if(level flag::get("play_vocals"))
	{
		level thread zm_audio::sndmusicsystem_playstate("snakeskinboots");
		level thread audio::unlockfrontendmusic("mus_snake_skin_boots_intro");
	}
	else
	{
		level thread zm_audio::sndmusicsystem_playstate("snakeskinboots_instr");
		level thread audio::unlockfrontendmusic("mus_snake_skin_instrumental_intro");
	}
}

/*
	Name: function_68e137c8
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x35C8
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 925
*/
function function_68e137c8()
{
	self create_unitrigger();
	self PlayLoopSound("zmb_zod_radio_loop", 1);
	self thread function_8faf1d24(VectorScale((0, 0, 1), 255), "hs1");
	while(level.var_89ad28cd < 3)
	{
		self waittill("trigger_activated");
		level flag::toggle("play_vocals");
		if(!(isdefined(self.b_activated) && self.b_activated))
		{
			self.b_activated = 1;
			level.var_89ad28cd++;
			level notify("hash_da6d056e");
			self StopLoopSound(0.2);
		}
		self playsound("zmb_zod_radio_activate");
		if(isdefined(level.musicsystem.currentplaytype) && level.musicsystem.currentplaytype >= 4 || (isdefined(level.musicsystemoverride) && level.musicsystemoverride))
		{
			continue;
		}
	}
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
}

/*
	Name: function_e947749a
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x3748
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 960
*/
function function_e947749a()
{
	level.var_d98fa1f1 = 0;
	a_items = GetEntArray("hs_item", "targetname");
	Array::thread_all(a_items, &function_47965455);
	while(1)
	{
		level waittill("hash_bcead67a");
		if(level.var_d98fa1f1 == a_items.size)
		{
			break;
		}
	}
	a_items = struct::get_array("hs_item_stage", "targetname");
	foreach(s_item in a_items)
	{
		mdl_item = util::spawn_model(s_item.model, s_item.origin, s_item.angles);
		if(s_item.model == "p7_zm_zod_hidden_songs_mic_stand")
		{
			mdl_item thread function_b6296b8b();
		}
	}
}

/*
	Name: function_47965455
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x38F0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 994
*/
function function_47965455()
{
	self create_unitrigger();
	self thread function_8faf1d24(VectorScale((0, 0, 1), 255), "hs2");
	self waittill("trigger_activated");
	playsoundatposition("zmb_zod_ee_item_pickup", self.origin);
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
	level.var_d98fa1f1++;
	level notify("hash_bcead67a");
	self delete();
}

/*
	Name: function_b6296b8b
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x39B0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 1016
*/
function function_b6296b8b()
{
	self create_unitrigger();
	while(1)
	{
		self waittill("trigger_activated");
		if(isdefined(level.musicsystem.currentplaytype) && level.musicsystem.currentplaytype >= 4 || (isdefined(level.musicsystemoverride) && level.musicsystemoverride))
		{
			continue;
			break;
		}
		else
		{
		}
	}
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
	level thread zm_audio::sndmusicsystem_playstate("coldhardcash");
	level thread audio::unlockfrontendmusic("mus_cold_hard_cash_intro");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: ciphers
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x3A98
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 1048
*/
function ciphers()
{
	mdl_brick = GetEnt("brick_cipher", "targetname");
	mdl_brick thread function_b730f44e();
	mdl_picture = GetEnt("picture_cipher", "targetname");
	mdl_picture thread function_60e591f5();
	var_6a19ae41 = GetEnt("hyena", "targetname");
	var_6a19ae41 thread function_7e754365();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b730f44e
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x3B68
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1070
*/
function function_b730f44e()
{
	self create_unitrigger();
	self waittill("trigger_activated");
	self MoveZ(164, 2);
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
	self waittill("movedone");
	self delete();
}

/*
	Name: function_60e591f5
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x3BF0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1090
*/
function function_60e591f5()
{
	self setcandamage(1);
	self waittill("damage");
	self physicslaunch(self.origin + (2, 0, 8), (2, 2, 5));
	wait(30);
	self delete();
}

/*
	Name: function_7e754365
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x3C70
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 1109
*/
function function_7e754365()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: function_523509c2
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x3DB8
	Size: 0x468
	Parameters: 0
	Flags: None
	Line Number: 1129
*/
function function_523509c2()
{
	var_839c79fb = 0;
	/#
		if(GetDvarInt("Dev Block strings are not supported") > 0)
		{
			var_839c79fb = 1;
		}
	#/
	if(!var_839c79fb)
	{
		for(var_8d01bd08 = 0; var_8d01bd08 != 6; var_8d01bd08++)
		{
			level waittill("hash_1a2d33d7");
		}
	}
	var_4a7285b7 = 0;
	/#
		if(GetDvarInt("Dev Block strings are not supported") > 1)
		{
			var_4a7285b7 = 1;
		}
	#/
	if(!var_4a7285b7)
	{
		level.a_hearts = [];
		var_fad038a6 = struct::get_array("margwa_heart");
		foreach(var_a3b2752a in var_fad038a6)
		{
			mdl_heart = util::spawn_model("p7_zm_zod_margwa_heart_alive", var_a3b2752a.origin, var_a3b2752a.angles);
			mdl_heart thread function_9a436d7f();
			if(!isdefined(level.a_hearts))
			{
				level.a_hearts = [];
			}
			else if(!IsArray(level.a_hearts))
			{
				level.a_hearts = Array(level.a_hearts);
			}
			level.a_hearts[level.a_hearts.size] = mdl_heart;
		}
		level thread function_51b665f0();
		while(1)
		{
			var_9094458d = 0;
			foreach(mdl_heart in level.a_hearts)
			{
				if(isdefined(mdl_heart.var_168e6657) && mdl_heart.var_168e6657)
				{
					var_9094458d = 1;
					break;
				}
			}
			if(!var_9094458d)
			{
				break;
			}
			wait(0.05);
		}
		level notify("hash_e87ace62");
		Array::run_all(level.a_hearts, &delete);
	}
	var_baa93c97 = struct::get_array("margwa_shiny", "targetname");
	var_baa93c97 = Array::randomize(var_baa93c97);
	for(i = 0; i < level.players.size; i++)
	{
		var_b81be463 = var_baa93c97[i];
		mdl_shiny = util::spawn_model("tag_origin", var_b81be463.origin, var_b81be463.angles);
		mdl_shiny thread function_68f6dbc2();
	}
	level.margwa_smash_damage_callback = &function_e8628610;
	level.margwa_damage_override_callback = &function_e6f86e4d;
	playsoundatposition("zmb_vocals_margwa_death", (0, 0, 0));
}

/*
	Name: function_9a436d7f
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x4228
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 1214
*/
function function_9a436d7f()
{
	level endon("hash_e87ace62");
	self setcandamage(1);
	self.var_168e6657 = 1;
	while(1)
	{
		self waittill("damage", n_damage, e_attacker);
		if(isdefined(e_attacker.on_train) && e_attacker.on_train && level.o_zod_train flag::get("moving"))
		{
			self Hide();
			self.var_168e6657 = 0;
			level notify("hash_34141bc5");
			e_attacker playsound("zmb_vocals_margwa_pain_small");
			level waittill("hash_47c53d3");
			self show();
			self.var_168e6657 = 1;
			self thread function_8faf1d24(VectorScale((1, 0, 0), 255), "<3", 1, "damage");
		}
		else
		{
			self Hide();
			wait(0.15);
			self show();
		}
	}
}

/*
	Name: function_51b665f0
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x43C0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1252
*/
function function_51b665f0()
{
	level endon("hash_e87ace62");
	while(1)
	{
		level waittill("hash_34141bc5");
		for(i = 0; i < 2; i++)
		{
			level.o_zod_train flag::wait_till("moving");
			level.o_zod_train flag::wait_till("cooldown");
		}
		level notify("hash_47c53d3");
	}
}

/*
	Name: function_e8628610
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x4468
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1277
*/
function function_e8628610(var_225347e1)
{
	if(isdefined(self.var_d89174ae) && self.var_d89174ae)
	{
		n_damage = 124.5;
		self DoDamage(n_damage, var_225347e1.origin);
		return 1;
	}
	return 0;
}

/*
	Name: function_e6f86e4d
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x44D8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1298
*/
function function_e6f86e4d(n_damage)
{
	var_6be53fb8 = n_damage;
	if(isPlayer(self) && (isdefined(self.var_d89174ae) && self.var_d89174ae))
	{
		var_6be53fb8 = n_damage * 1.15;
	}
	return var_6be53fb8;
}

/*
	Name: function_68f6dbc2
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x4548
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 1318
*/
function function_68f6dbc2()
{
	wait(1);
	self clientfield::set("pod_sprayer_glint", 1);
	self create_unitrigger(&"ZM_ZOD_MH_MARGWA_HEAD");
	self waittill("trigger_activated", player);
	if(!(isdefined(player.var_d89174ae) && player.var_d89174ae))
	{
		player thread function_4d249743();
	}
	player playsound("zmb_vocals_margwa_pain_small");
	player.var_d89174ae = 1;
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
	self clientfield::set("pod_sprayer_glint", 0);
	self delete();
}

/*
	Name: function_4d249743
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x4680
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1345
*/
function function_4d249743()
{
	self endon("death");
	self notify("hash_83563f7e");
	self endon("hash_83563f7e");
	level clientfield::set("player" + self.entity_num + "wearableItem", 1);
	while(1)
	{
		self Attach("p7_zm_zod_margwa_head", "j_head");
		self flag::wait_till("in_beastmode");
		self Detach("p7_zm_zod_margwa_head", "j_head");
		self flag::wait_till_clear("in_beastmode");
	}
}

/*
	Name: function_d0ee8a03
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x4778
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 1370
*/
function function_d0ee8a03()
{
	mdl_ticket = GetEnt("laundry_ticket", "targetname");
	mdl_ticket setcandamage(1);
	mdl_ticket.health = 999999;
	while(1)
	{
		mdl_ticket waittill("damage", n_damage, e_attacker, v_dir, v_loc, str_type, STR_MODEL, str_tag, str_part, w_weapon);
		if(str_type == "MOD_GRENADE_SPLASH" && DistanceSquared(mdl_ticket.origin, v_loc) < 4096)
		{
			break;
		}
	}
	s_target = struct::get(mdl_ticket.target);
	mdl_ticket.origin = s_target.origin;
	mdl_ticket.angles = s_target.angles;
	mdl_ticket create_unitrigger();
	mdl_ticket waittill("trigger_activated", e_player);
	mdl_ticket delete();
	e_player zm_score::add_to_player_score(500);
}

/*
	Name: function_67a4dabe
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x4968
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 1402
*/
function function_67a4dabe()
{
	level.var_f11300cd = 0;
	b_skip = 0;
	/#
		if(GetDvarInt("Dev Block strings are not supported") > 0)
		{
			b_skip = 1;
		}
	#/
	if(b_skip == 0)
	{
		namespace_8e578893::function_2d5dfb29(&function_4a0f0038);
		level waittill("hash_6e41959b");
		ArrayRemoveValue(level.var_7806fb91, &function_4a0f0038);
	}
	level.octobomb_attack_callback = &function_bfe0c3eb;
	level waittill("hash_8b3094ce");
	level.octobomb_attack_callback = &function_31ef8fd4;
	level waittill("hash_21edb6b6");
	foreach(player in level.activePlayers)
	{
		if(player hasweapon(level.w_octobomb))
		{
			player _zm_weap_octobomb::player_give_octobomb("octobomb_upgraded");
		}
	}
	level.zombie_weapons[level.w_octobomb].is_in_box = 0;
	level.zombie_weapons[level.w_octobomb_upgraded].is_in_box = 1;
}

/*
	Name: function_4a0f0038
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x4B50
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 1443
*/
function function_4a0f0038(e_attacker, str_means_of_death, weapon)
{
	if(weapon === level.w_octobomb)
	{
		level.var_f11300cd++;
		if(level.var_f11300cd == 100)
		{
			level notify("hash_6e41959b");
		}
	}
}

/*
	Name: function_bfe0c3eb
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x4BB0
	Size: 0x1E0
	Parameters: 1
	Flags: None
	Line Number: 1465
*/
function function_bfe0c3eb(var_187d070c)
{
	var_52d8dc8d = GetEntArray("arnie_item", "targetname");
	foreach(var_f0a178a2 in var_52d8dc8d)
	{
		var_b1720580 = Distance2DSquared(var_f0a178a2.origin, var_187d070c.origin);
		if(var_b1720580 < 16384)
		{
			if(var_52d8dc8d.size == 1)
			{
				level notify("hash_8b3094ce");
			}
			s_spot = struct::get(var_f0a178a2.script_noteworthy);
			var_1ff2613d = util::spawn_model(s_spot.model, s_spot.origin, s_spot.angles);
			var_1ff2613d.targetname = "arnie_stage_item";
			if(isdefined(s_spot.script_float))
			{
				var_1ff2613d SetScale(s_spot.script_float);
			}
			var_f0a178a2 delete();
			break;
		}
	}
}

/*
	Name: function_31ef8fd4
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x4D98
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 1500
*/
function function_31ef8fd4(var_187d070c)
{
	var_150c4640 = struct::get("lil_arnie_stage_center");
	var_b1720580 = Distance2DSquared(var_150c4640.origin, var_187d070c.origin);
	if(var_b1720580 < 16384)
	{
		level.octobomb_attack_callback = undefined;
		var_187d070c.b_special_octobomb = 1;
		level thread function_c4842cb1(var_187d070c);
	}
}

/*
	Name: function_c4842cb1
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x4E50
	Size: 0x270
	Parameters: 1
	Flags: None
	Line Number: 1522
*/
function function_c4842cb1(var_187d070c)
{
	var_187d070c delete();
	var_4d0fab9c = GetEntArray("arnie_stage_item", "targetname");
	foreach(mdl_item in var_4d0fab9c)
	{
		mdl_item delete();
		util::wait_network_frame();
	}
	var_150c4640 = struct::get("lil_arnie_stage_center");
	foreach(player in level.activePlayers)
	{
		player zm_utility::increment_ignoreme();
	}
	playsoundatposition("zmb_zod_ee_arniedance", var_150c4640.origin);
	level clientfield::set("lil_arnie_dance", 1);
	wait(24);
	foreach(player in level.activePlayers)
	{
		player zm_utility::decrement_ignoreme();
	}
	level notify("hash_21edb6b6");
}

/*
	Name: function_41ecaace
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x50C8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 1556
*/
function function_41ecaace()
{
	level flag::wait_till("ritual_pap_complete");
	a_pictures = GetEntArray("scream_pic", "targetname");
	foreach(mdl_picture in a_pictures)
	{
		mdl_picture thread function_8cffc675();
	}
	return;
}

/*
	Name: function_8cffc675
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x51A8
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 1577
*/
function function_8cffc675()
{
	level endon("hash_b94b6391");
	while(1)
	{
		self waittill("trigger", player);
		if(zm_utility::is_player_valid(player) && function_12b65d38(player GetCurrentWeapon(), "sniper") && player util::is_ads())
		{
			break;
		}
		wait(0.05);
	}
	player playlocalsound("zmb_zod_egg_scream");
	player.var_92fcfed8 = player OpenLUIMenu("JumpScare");
	wait(0.55);
	if(isdefined(player.var_92fcfed8))
	{
		player CloseLUIMenu(player.var_92fcfed8);
	}
	self delete();
	level notify("hash_b94b6391");
}

/*
	Name: function_12b65d38
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x5300
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 1610
*/
function function_12b65d38(w_current, str_class)
{
	if(IsSubStr(w_current.name, str_class))
	{
		return 1;
	}
	return 0;
}

/*
	Name: spare_change
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x5348
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 1629
*/
function spare_change()
{
	a_triggers = GetEntArray("audio_bump_trigger", "targetname");
	foreach(t_audio_bump in a_triggers)
	{
		if(t_audio_bump.script_sound === "zmb_perks_bump_bottle")
		{
			t_audio_bump thread check_for_change();
		}
	}
}

/*
	Name: check_for_change
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x5428
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1651
*/
function check_for_change()
{
	while(1)
	{
		self waittill("trigger", e_player);
		if(e_player GetStance() == "prone")
		{
			e_player zm_score::add_to_player_score(100);
			zm_utility::play_sound_at_pos("purchase", e_player.origin);
			break;
		}
		wait(0.15);
	}
}

/*
	Name: function_7a56bf90
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x54D0
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 1676
*/
function function_7a56bf90()
{
	self endon("death");
	self.var_c2faf069 = 0;
	self.var_e20230e3 = 0;
	while(1)
	{
		self waittill("weapon_melee_juke");
		if(isdefined(self.b_has_upgraded_shield) && self.b_has_upgraded_shield)
		{
			continue;
		}
		if(isdefined(self.hasRiotShield) && self.hasRiotShield)
		{
			self waittill("shield_juke_done");
			self notify("hash_4438d786", self.var_c2faf069);
			if(self.var_c2faf069 >= 10)
			{
				self playsoundtoplayer("zmb_zod_ee_bowling_strike", self);
				self.var_e20230e3++;
			}
			else
			{
				self.var_e20230e3 = 0;
			}
			if(self.var_e20230e3 == 12)
			{
				self playsoundtoplayer("zmb_zod_ee_bowling_cheer", self);
				self zm_equipment::buy("zod_riotshield_upgraded");
				self.b_has_upgraded_shield = 1;
				self.var_e20230e3 = 0;
				return;
			}
			self.var_c2faf069 = 0;
		}
		wait(0.05);
	}
	return;
	continue;
}

/*
	Name: function_c6930415
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x5630
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 1727
*/
function function_c6930415(a_enemies)
{
	foreach(e_enemy in a_enemies)
	{
		if(!(isdefined(e_enemy.bowling_pin) && e_enemy.bowling_pin))
		{
			e_enemy.bowling_pin = 1;
			self.var_c2faf069 = self.var_c2faf069 + 1;
		}
	}
}

/*
	Name: function_fa2d33a4
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x5700
	Size: 0x378
	Parameters: 0
	Flags: None
	Line Number: 1749
*/
function function_fa2d33a4()
{
	level endon("hash_5298c49");
	self endon("shadowman_leaves");
	level.var_cfee9316 = 0;
	var_93dad597 = self.var_93dad597;
	var_93dad597.trigger = GetEnt("play_on_map_load_trigger", "targetname");
	var_93dad597.trigger TriggerEnable(0);
	for(i = 1; i <= 3; i++)
	{
		level waittill("start_of_round");
		var_93dad597.trigger TriggerEnable(1);
		var_93dad597 thread function_b0ea6013();
		var_93dad597 function_b3430866();
		level notify("hash_ab07012");
		var_93dad597.trigger TriggerEnable(0);
		level.var_cfee9316++;
		var_9ef6b569 = level.var_cfee9316 * 5;
		if(level.next_wasp_round <= var_9ef6b569)
		{
			level.next_wasp_round = 5 + level.wasp_round_count * 10 + randomIntRange(-1, 1);
			level.wasp_round_count++;
		}
		if(level.n_next_raps_round <= var_9ef6b569)
		{
			level.n_next_raps_round = 10 + level.raps_round_count * 10 + randomIntRange(-1, 1);
			level.raps_round_count++;
		}
		if(level.var_bf361dc0 < var_9ef6b569)
		{
			level.var_bf361dc0 = level.var_bf361dc0 + randomIntRange(3, 6);
			level.var_b383deb1++;
			if(level.var_bf361dc0 <= 12)
			{
				if(level.var_bf361dc0 == level.n_next_raps_round)
				{
					level.var_bf361dc0 = level.var_bf361dc0 + 2;
				}
				else if(level.var_bf361dc0 == level.n_next_raps_round + 1)
				{
					level.var_bf361dc0 = level.var_bf361dc0 + 1;
				}
			}
		}
		foreach(player in level.players)
		{
			player.var_8c06218 = 0;
		}
		level thread function_9baef344();
	}
	var_93dad597.trigger delete();
	level notify("hash_5298c49");
}

/*
	Name: function_9baef344
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x5A80
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1813
*/
function function_9baef344()
{
	if(level.var_cfee9316 > 0)
	{
		playsoundatposition("zmb_zod_ee_roundskip", (0, 0, 0));
		level thread function_456b7848(level.var_cfee9316);
		new_round = level.var_cfee9316 * 5;
		bgb_token::function_c2f81136(new_round - level.round_number);
		level.skip_alive_at_round_end_xp = 1;
		level zm_utility::zombie_goto_round(new_round);
		return;
	}
	.var_0 = undefined;
}

/*
	Name: function_b0ea6013
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x5B38
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1838
*/
function function_b0ea6013()
{
	level endon("hash_5298c49");
	level endon("hash_ab07012");
	wait(5);
	if(isdefined(self.trigger))
	{
		self.trigger delete();
	}
	level notify("hash_5298c49");
}

/*
	Name: function_b3430866
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x5B98
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 1860
*/
function function_b3430866()
{
	self endon("death");
	self thread function_f11d743f();
	while(1)
	{
		var_e66e7864 = 1;
		foreach(player in level.players)
		{
			if(!(isdefined(player.var_8c06218) && player.var_8c06218))
			{
				var_e66e7864 = 0;
				break;
			}
		}
		if(var_e66e7864)
		{
			self.trigger TriggerEnable(0);
			break;
		}
		wait(0.05);
	}
	self notify("hash_dc49142d");
}

/*
	Name: function_f11d743f
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x5CC8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1895
*/
function function_f11d743f()
{
	self endon("death");
	self endon("hash_dc49142d");
	while(1)
	{
		self.trigger waittill("damage", n_damage, e_attacker);
		if(!(isdefined(e_attacker.var_8c06218) && e_attacker.var_8c06218))
		{
			e_attacker.var_8c06218 = 1;
		}
	}
}

/*
	Name: function_456b7848
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x5D58
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 1919
*/
function function_456b7848(var_c69ea03b)
{
	n_score = 0;
	for(i = 0; i < var_c69ea03b; i++)
	{
		switch(i)
		{
			case 0:
			{
				n_score = n_score + 1000;
				break;
			}
			case 1:
			{
				n_score = n_score + 3000;
				break;
			}
			case 2:
			{
				n_score = n_score + 7000;
				break;
			}
		}
	}
	foreach(player in level.players)
	{
		player zm_score::add_to_player_score(n_score);
	}
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b943cc04
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x5EA0
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 1962
*/
function function_b943cc04()
{
	level endon("hash_41eedc1");
	level.var_4c7e4e43 = GetEntArray("holly_cart", "targetname");
	level.var_6432377d = GetEntArray("devil_cart", "targetname");
	level.var_ee921bdc = level.var_4c7e4e43.size;
	level.var_a1445a76 = level.var_6432377d.size;
	/#
		if(GetDvarInt("Dev Block strings are not supported") > 0)
		{
			level.var_ee921bdc = 1;
		}
	#/
	level.var_71279923 = GetWeapon("bouncingbetty");
	namespace_8e578893::function_2d5dfb29(&function_b134ab6c);
	level thread function_41eedc1();
	level waittill("hash_25ff6e8", str_weapon);
	var_7a2a8066 = GetWeapon(str_weapon);
	foreach(player in level.activePlayers)
	{
		if(player hasweapon(level.var_71279923))
		{
			player zm_weapons::weapon_take(level.var_71279923);
			player zm_weapons::weapon_give(var_7a2a8066);
		}
	}
	if(str_weapon == "bouncingbetty_devil")
	{
		level clientfield::set("change_bouncingbetties", 1);
	}
	else
	{
		level clientfield::set("change_bouncingbetties", 2);
	}
	level notify("hash_41eedc1");
}

/*
	Name: function_41eedc1
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x6120
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 2009
*/
function function_41eedc1()
{
	level waittill("hash_41eedc1");
	ArrayRemoveValue(level.var_7806fb91, &function_b134ab6c);
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_b134ab6c
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x6168
	Size: 0x338
	Parameters: 3
	Flags: None
	Line Number: 2028
*/
function function_b134ab6c(e_attacker, str_means_of_death, w_weapon)
{
	if(!isdefined(w_weapon) || w_weapon != level.var_71279923)
	{
		return;
	}
	foreach(mdl_cart in level.var_4c7e4e43)
	{
		if(isdefined(mdl_cart.b_damaged) && mdl_cart.b_damaged)
		{
			continue;
		}
		if(DistanceSquared(mdl_cart.origin, self.origin) < 40000)
		{
			if(level.var_a1445a76 < level.var_6432377d.size)
			{
				level notify("hash_41eedc1");
				return;
			}
			mdl_cart playsound("zmb_zod_ee_cakefight_devil");
			mdl_cart.b_damaged = 1;
			level.var_ee921bdc--;
			playFX(level._effect["lght_marker_flare"], mdl_cart.origin);
			if(level.var_ee921bdc == 0)
			{
				level notify("hash_25ff6e8", "bouncingbetty_devil");
				return;
			}
		}
	}
	foreach(mdl_cart in level.var_6432377d)
	{
		if(isdefined(mdl_cart.b_damaged) && mdl_cart.b_damaged)
		{
			continue;
		}
		if(DistanceSquared(mdl_cart.origin, self.origin) < 40000)
		{
			if(level.var_ee921bdc < level.var_4c7e4e43.size)
			{
				level notify("hash_41eedc1");
				return;
			}
			mdl_cart playsound("zmb_zod_ee_cakefight_angel");
			mdl_cart.b_damaged = 1;
			level.var_a1445a76--;
			playFX(level._effect["lght_marker_flare"], mdl_cart.origin);
			if(level.var_a1445a76 == 0)
			{
				level notify("hash_25ff6e8", "bouncingbetty_holly");
				return;
			}
		}
	}
}

/*
	Name: function_758cc281
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x64A8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 2094
*/
function function_758cc281()
{
	createBouncingBettyWatcher("bouncingbetty_devil");
}

/*
	Name: function_a3213b07
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x64D0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 2109
*/
function function_a3213b07()
{
	createBouncingBettyWatcher("bouncingbetty_holly");
}

/*
	Name: function_284bb3f1
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x64F8
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 2124
*/
function function_284bb3f1(watcher, owner)
{
	self bouncingbetty::onSpawnBouncingBetty(watcher, owner);
}

/*
	Name: function_1bf9d0bf
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x6538
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 2139
*/
function function_1bf9d0bf(watcher, owner)
{
	self bouncingbetty::onSpawnBouncingBetty(watcher, owner);
}

/*
	Name: createBouncingBettyWatcher
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x6578
	Size: 0x1D0
	Parameters: 1
	Flags: None
	Line Number: 2154
*/
function createBouncingBettyWatcher(str_weapon)
{
	watcher = self weaponobjects::createProximityWeaponObjectWatcher(str_weapon, self.team);
	if(str_weapon == "bouncingbetty_devil")
	{
		watcher.onSpawn = &function_284bb3f1;
	}
	else
	{
		watcher.onSpawn = &function_1bf9d0bf;
	}
	watcher.watchForFire = 1;
	watcher.onDetonateCallback = &bouncingbetty::bouncingBettyDetonate;
	watcher.activateSound = "wpn_betty_alert";
	watcher.hackable = 1;
	watcher.hackerToolRadius = level.equipmentHackerToolRadius;
	watcher.hackerToolTimeMs = level.equipmentHackerToolTimeMs;
	watcher.ownerGetsAssist = 1;
	watcher.ignoreDirection = 1;
	watcher.immediateDetonation = 1;
	watcher.immunespecialty = "specialty_immunetriggerbetty";
	watcher.detectionMinDist = level.bettyMinDist;
	watcher.detectionGracePeriod = level.bettyGracePeriod;
	watcher.detonateRadius = level.bettyRadius;
	watcher.stun = &weaponobjects::weaponStun;
	watcher.stunTime = level.bettyStunTime;
	watcher.activationDelay = level.bettyActivationDelay;
}

/*
	Name: function_de14e5a1
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x6750
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 2193
*/
function function_de14e5a1()
{
	level.var_4cde8c2c = struct::get_array("lion_mouth");
	level thread function_78758203();
}

/*
	Name: function_78758203
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x6798
	Size: 0x358
	Parameters: 0
	Flags: None
	Line Number: 2209
*/
function function_78758203()
{
	var_45be765 = struct::get("gum_bank");
	var_45be765 create_unitrigger();
	var_45be765.var_ab341779 = [];
	while(1)
	{
		var_45be765 waittill("trigger_activated", e_user);
		n_index = zm_utility::get_player_index(e_user) + 1;
		if(isdefined(e_user.var_339fc6c6) && e_user.var_339fc6c6)
		{
			e_user.var_339fc6c6 = undefined;
			level flag::set("awarded_lion_gumball" + n_index);
			var_45be765.var_251c3637 = struct::get("window_ball" + n_index);
			var_45be765.var_ab341779[n_index] = util::spawn_model("p7_zm_zod_bubblegum_machine_gumball_white", var_45be765.var_251c3637.origin);
			var_45be765.var_ab341779[n_index] thread function_63dde189();
		}
		else if(isdefined(var_45be765.var_ab341779[n_index]) && isdefined(var_45be765.var_ab341779[n_index].var_6cb12f5c))
		{
			if(isdefined(e_user.IS_DRINKING) && e_user.IS_DRINKING > 0)
			{
				wait(0.1);
				continue;
			}
			if(e_user GetCurrentWeapon() == level.weaponNone)
			{
				wait(0.1);
				continue;
			}
			current_weapon = level.weaponNone;
			if(zm_utility::is_player_valid(e_user))
			{
				current_weapon = e_user GetCurrentWeapon();
			}
			if(zm_utility::is_player_valid(e_user) && !e_user.IS_DRINKING > 0 && !zm_utility::is_placeable_mine(current_weapon) && !zm_equipment::is_equipment(current_weapon) && !e_user zm_utility::is_player_revive_tool(current_weapon) && !current_weapon.isHeroWeapon)
			{
				e_user thread bgb::bgb_gumball_anim(var_45be765.var_ab341779[n_index].var_6cb12f5c, 0);
				var_45be765.var_ab341779[n_index] delete();
			}
		}
	}
}

/*
	Name: function_63dde189
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x6AF8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 2262
*/
function function_63dde189()
{
	level waittill("between_round_over");
	level waittill("between_round_over");
	self.var_6cb12f5c = bgb::function_d51db887();
	self SetScale(2);
	return;
}

/*
	Name: function_7784eba6
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x6B50
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 2281
*/
function function_7784eba6()
{
	self endon("death");
	n_index = zm_utility::get_player_index(self) + 1;
	level endon("awarded_lion_gumball" + n_index);
	self.var_fc66e122 = [];
	while(1)
	{
		self waittill("grenade_fire", e_grenade, w_weapon);
		if(w_weapon == level.w_widows_wine_grenade)
		{
			self thread function_b0c6ab(e_grenade);
		}
	}
}

/*
	Name: function_b0c6ab
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x6C08
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 2307
*/
function function_b0c6ab(e_grenade)
{
	self endon("death");
	while(isdefined(e_grenade))
	{
		var_ac44693b = e_grenade.origin;
		wait(0.1);
	}
	var_dae4e184 = 0;
	var_be3ff756 = undefined;
	var_d29e4cff = undefined;
	n_dist_sq = DistanceSquared(level.var_4cde8c2c[0].origin, var_ac44693b);
	if(n_dist_sq <= 160000)
	{
		foreach(s_mouth in level.var_4cde8c2c)
		{
			n_dist_sq = DistanceSquared(s_mouth.origin, var_ac44693b);
			if(n_dist_sq <= 36)
			{
				var_be3ff756 = s_mouth;
				var_d29e4cff = n_index;
				if(!isdefined(self.var_fc66e122[n_index]))
				{
					self.var_fc66e122[n_index] = s_mouth;
					var_dae4e184 = 1;
					if(self.var_fc66e122.size == level.var_4cde8c2c.size)
					{
						self function_edf5d07();
						break;
					}
				}
			}
		}
	}
	else if(!var_dae4e184)
	{
		self.var_fc66e122 = [];
		if(isdefined(var_be3ff756))
		{
			self.var_fc66e122[var_d29e4cff] = var_be3ff756;
		}
	}
}

/*
	Name: function_edf5d07
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x6E18
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 2361
*/
function function_edf5d07()
{
	self endon("death");
	n_index = zm_utility::get_player_index(self) + 1;
	var_251c3637 = struct::get("lion_mouth_ball" + n_index);
	var_ab341779 = util::spawn_model("p7_zm_zod_bubblegum_machine_gumball_white", var_251c3637.origin);
	var_ab341779 create_unitrigger();
	var_ab341779 playsound("zmb_zod_ee_liontamer_roar");
	while(1)
	{
		var_ab341779 waittill("trigger_activated", e_user);
		if(e_user == self)
		{
			e_user playsound("zmb_zod_ee_liontamer_pickup");
			break;
		}
	}
	self.var_339fc6c6 = 1;
	zm_unitrigger::unregister_unitrigger(var_ab341779.s_unitrigger);
	var_ab341779 delete();
}

/*
	Name: function_5045e366
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x6F78
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 2393
*/
function function_5045e366()
{
	level flag::wait_till("ritual_pap_complete");
	while(!level.zones["zone_junction_start"].is_occupied && !level.zones["zone_junction_slums"].is_occupied && !level.zones["zone_junction_canal"].is_occupied && !level.zones["zone_junction_theater"].is_occupied)
	{
		wait(1);
	}
	s_start = struct::get("alcatraz_plane_start");
	mdl_plane = util::spawn_model("p7_zm_der_alcatraz_plane", s_start.origin, s_start.angles);
	s_end = struct::get(s_start.target);
	mdl_plane moveto(s_end.origin, 30);
	mdl_plane PlayLoopSound("zmb_zod_ee_motd_plane", 5);
	mdl_plane waittill("movedone");
	mdl_plane delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8faf1d24
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x7128
	Size: 0x108
	Parameters: 4
	Flags: None
	Line Number: 2421
*/
function function_8faf1d24(v_color, str_print, n_scale, str_endon)
{
	if(!isdefined(v_color))
	{
		v_color = VectorScale((0, 0, 1), 255);
	}
	if(!isdefined(str_print))
	{
		str_print = "+";
	}
	if(!isdefined(n_scale))
	{
		n_scale = 0.25;
	}
	if(!isdefined(str_endon))
	{
		str_endon = "trigger_activated";
	}
	/#
		if(GetDvarInt("Dev Block strings are not supported") == 0)
		{
			return;
		}
		if(isdefined(str_endon))
		{
			self endon(str_endon);
		}
		origin = self.origin;
		while(1)
		{
			print3d(origin, str_print, v_color, n_scale);
			wait(0.1);
		}
	#/
}

/*
	Name: create_unitrigger
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x7238
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 2467
*/
function create_unitrigger(str_hint)
{
	s_unitrigger = spawnstruct();
	s_unitrigger.origin = self.origin;
	s_unitrigger.angles = self.angles;
	s_unitrigger.script_unitrigger_type = "unitrigger_radius_use";
	s_unitrigger.cursor_hint = "HINT_NOICON";
	s_unitrigger.str_hint = str_hint;
	s_unitrigger.prompt_and_visibility_func = &unitrigger_prompt_and_visibility;
	s_unitrigger.related_parent = self;
	s_unitrigger.radius = 64;
	self.s_unitrigger = s_unitrigger;
	zm_unitrigger::register_static_unitrigger(s_unitrigger, &unitrigger_logic);
	return;
}

/*
	Name: unitrigger_prompt_and_visibility
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x7340
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 2493
*/
function unitrigger_prompt_and_visibility(player)
{
	b_visible = 1;
	if(isdefined(player.beastmode) && player.beastmode)
	{
		b_visible = 0;
	}
	else if(isdefined(self.stub.str_hint))
	{
		self setHintString(self.stub.str_hint);
	}
	return b_visible;
}

/*
	Name: unitrigger_logic
	Namespace: namespace_54c8dc69
	Checksum: 0x424F4353
	Offset: 0x73D8
	Size: 0xA4
	Parameters: 0
	Flags: None
	Line Number: 2517
*/
function unitrigger_logic()
{
	self endon("death");
	while(1)
	{
		self waittill("trigger", player);
		if(player zm_utility::in_revive_trigger())
		{
			continue;
		}
		if(player.IS_DRINKING > 0)
		{
			continue;
		}
		if(!zm_utility::is_player_valid(player))
		{
			continue;
		}
		self.stub.related_parent notify("trigger_activated", player);
	}
}

