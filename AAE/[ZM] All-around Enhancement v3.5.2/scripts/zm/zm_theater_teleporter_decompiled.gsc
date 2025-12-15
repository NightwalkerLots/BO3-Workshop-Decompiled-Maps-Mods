#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_utility;
#include scripts\zm\zm_theater_magic_box;

#namespace namespace_8847920b;

/*
	Name: __init__sytem__
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x9E8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 30
*/
function autoexec __init__sytem__()
{
	system::register("zm_theater_teleporter", &__init__, &__main__, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0xA30
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 47
*/
function __init__()
{
	visionset_mgr::register_info("overlay", "zm_theater_teleport", 21000, 61, 1, 1);
	clientfield::register("scriptmover", "extra_screen", 21000, 1, "int");
	clientfield::register("scriptmover", "teleporter_fx", 21000, 1, "counter");
	clientfield::register("allplayers", "player_teleport_fx", 21000, 1, "counter");
	clientfield::register("scriptmover", "play_fly_me_to_the_moon_fx", 21000, 1, "int");
	clientfield::register("world", "teleporter_initiate_fx", 21000, 1, "counter");
	clientfield::register("scriptmover", "teleporter_link_cable_mtl", 21000, 1, "int");
	callback::on_spawned(&init_player);
}

/*
	Name: __main__
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0xBB0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function __main__()
{
	level thread function_cb901457();
}

/*
	Name: function_cb901457
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0xBD8
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 84
*/
function function_cb901457()
{
	level flag::wait_till("initial_blackscreen_passed");
	level._audio_custom_weapon_check = &weapon_type_check_custom;
	level.audio_get_mod_type = &function_642e6aef;
	Array::thread_all(GetEntArray("location_egg", "targetname"), &location_egg_vox);
	level flag::wait_till("power_on");
	zm_audio::zmbVoxAdd("weapon_pickup", "wpck_flame", "wpck_flame", 100, 0);
	zm_audio::zmbVoxAdd("kill", "melee", "kill_close", 100, 0);
	zm_audio::zmbVoxAdd("kill", "flame", "kill_flame", 100, 0);
	zm_audio::zmbVoxAdd("general", "rebuild_boards", "board", 100, 0);
	traps = GetEntArray("zombie_trap", "targetname");
	Array::thread_all(traps, &function_3da42916);
}

/*
	Name: location_egg_vox
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0xDA8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 109
*/
function location_egg_vox()
{
	self waittill("trigger", player);
	type = "room_" + self.script_noteworthy;
	player zm_audio::create_and_play_dialog("eggs", type);
}

/*
	Name: weapon_type_check_custom
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0xE10
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 126
*/
function weapon_type_check_custom(weapon, magic_box)
{
	if(weapon.isDualWield)
	{
		return "dualwield";
		return;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_642e6aef
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0xE50
	Size: 0x3C0
	Parameters: 7
	Flags: None
	Line Number: 147
*/
function function_642e6aef(impact, mod, weapon, zombie, instakill, dist, player)
{
	var_adac242b = 4096;
	var_2c1bd1bd = 15376;
	var_af03c4a6 = 160000;
	if(weapon.name == "hero_annihilator")
	{
		return "annihilator";
	}
	if(zombie.damageWeapon.name == "sticky_grenade_widows_wine")
	{
		return "default";
	}
	if(zm_utility::is_placeable_mine(weapon))
	{
		if(!instakill)
		{
			return "betty";
		}
		return "weapon_instakill";
	}
	if(zombie.archetype == "zombie_quad")
	{
		return "quad";
	}
	if(zombie.damageWeapon.name == "cymbal_monkey")
	{
		if(instakill)
		{
			return "weapon_instakill";
		}
		return "monkey";
	}
	if(zombie.damageWeapon.name == "ray_gun" || (zombie.damageWeapon.name == "ray_gun_upgraded" && dist > var_af03c4a6))
	{
		if(!instakill)
		{
			return "ray";
		}
		return "weapon_instakill";
	}
	if(zm_utility::is_headshot(weapon, impact, mod) && dist >= var_af03c4a6)
	{
		return "headshot";
	}
	if(dist < var_adac242b)
	{
		return "closekill";
	}
	if(zm_utility::is_explosive_damage(mod) && weapon.name != "ray_gun" && weapon.name != "ray_gun_upgraded" && (!(isdefined(zombie.is_on_fire) && zombie.is_on_fire)))
	{
		if(!instakill)
		{
			return "explosive";
		}
		return "weapon_instakill";
	}
	if(weapon.doesFireDamage && (mod == "MOD_BURNED" || mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH"))
	{
		if(!instakill)
		{
			return "flame";
		}
		return "weapon_instakill";
	}
	if(!isdefined(impact))
	{
		impact = "";
	}
	if(mod != "MOD_MELEE" && zombie.missingLegs)
	{
		return "crawler";
	}
	if(mod != "MOD_BURNED" && dist < var_adac242b)
	{
		return "flame";
	}
	if(mod == "MOD_RIFLE_BULLET" || mod == "MOD_PISTOL_BULLET")
	{
		if(!instakill)
		{
			return "bullet";
		}
		return "weapon_instakill";
	}
	if(instakill)
	{
		return "default";
	}
	return "default";
}

/*
	Name: function_3da42916
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x1218
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 249
*/
function function_3da42916()
{
	for(i = 0; i < self._trap_use_trigs.size; i++)
	{
		self._trap_use_trigs[i] thread trap_use_think(self);
	}
	return;
}

/*
	Name: trap_use_think
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x1278
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 268
*/
function trap_use_think(trap)
{
	while(1)
	{
		self waittill("trigger", who);
		if(who zm_utility::in_revive_trigger())
		{
			continue;
		}
		if(who.IS_DRINKING > 0)
		{
			continue;
		}
		if(zm_utility::is_player_valid(who) && !trap._trap_in_use)
		{
			players = GetPlayers();
			if(who zm_score::can_player_purchase(trap.zombie_cost))
			{
				continue;
			}
			else
			{
			}
			if(trap.script_noteworthy == "electric")
			{
				who zm_audio::create_and_play_dialog("kill", "tesla");
			}
			else
			{
				who zm_audio::create_and_play_dialog("weapon_pickup", "wpck_flame");
			}
		}
	}
}

/*
	Name: teleporter_init
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x13C8
	Size: 0x440
	Parameters: 0
	Flags: None
	Line Number: 313
*/
function teleporter_init()
{
	level.teleport = [];
	level.teleport_delay = 1.8;
	level.teleport_cost = 0;
	level.teleport_ae_funcs = [];
	level.eeroomsinuse = undefined;
	level.second_hand = GetEnt("zom_clock_second_hand", "targetname");
	level.second_hand_angles = level.second_hand.angles;
	level.zombieTheaterTeleporterSeekLogicFunc = &zombieTheaterTeleporterSeekLogic;
	level flag::init("teleporter_linked");
	level flag::init("core_linked");
	SetDvar("theaterAftereffectOverride", "-1");
	poi1 = GetEnt("teleporter_poi1", "targetname");
	poi2 = GetEnt("teleporter_poi2", "targetname");
	players = GetPlayers();
	if(players.size > 1)
	{
		poi1 zm_utility::create_zombie_point_of_interest(undefined, 30, 0, 0);
		poi2 zm_utility::create_zombie_point_of_interest(256, 15, 0, 0);
	}
	else
	{
		poi1 zm_utility::create_zombie_point_of_interest(undefined, 35, 100, 0);
		poi2 zm_utility::create_zombie_point_of_interest(256, 10, 0, 0);
	}
	poi1 thread zm_utility::create_zombie_point_of_interest_attractor_positions(4, 45);
	poi2 thread zm_utility::create_zombie_point_of_interest_attractor_positions(4, 45);
	thread teleport_core_think(0);
	thread teleport_link_think();
	thread teleport_pad_think();
	thread theater_fly_me_to_the_moon_init();
	thread function_9272aa0();
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		util::setClientSysState("levelNotify", "pack_clock_start", players[i]);
	}
	if(!IsSplitscreen())
	{
		level.teleport_ae_funcs[level.teleport_ae_funcs.size] = &teleport_aftereffect_fov;
	}
	level.teleport_ae_funcs[level.teleport_ae_funcs.size] = &teleport_aftereffect_shellshock;
	level.teleport_ae_funcs[level.teleport_ae_funcs.size] = &teleport_aftereffect_shellshock_electric;
	level.teleport_ae_funcs[level.teleport_ae_funcs.size] = &teleport_aftereffect_bw_vision;
	level.teleport_ae_funcs[level.teleport_ae_funcs.size] = &teleport_aftereffect_red_vision;
	level.teleport_ae_funcs[level.teleport_ae_funcs.size] = &teleport_aftereffect_flashy_vision;
	level.teleport_ae_funcs[level.teleport_ae_funcs.size] = &teleport_aftereffect_flare_vision;
	scene::add_scene_func("p7_fxanim_zm_kino_wormhole_bundle", &function_d11d2c50, "play");
}

/*
	Name: init_player
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x1810
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 374
*/
function init_player()
{
	self.is_teleporting = 0;
	self.inteleportation = 0;
}

/*
	Name: function_9272aa0
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x1838
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 390
*/
function function_9272aa0()
{
	while(1)
	{
		level zombieTheaterTeleporterSeekLogic();
		wait(0.05);
	}
}

/*
	Name: teleport_core_think
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x1870
	Size: 0x350
	Parameters: 1
	Flags: None
	Line Number: 409
*/
function teleport_core_think(index)
{
	trigger_name = "trigger_teleport_pad_" + index;
	active = 0;
	User = undefined;
	trigger = GetEnt(trigger_name, "targetname");
	trigger setcursorhint("HINT_NOICON");
	trigger setHintString("");
	exploder::exploder("teleporter_light_red");
	if(isdefined(trigger))
	{
		while(!active)
		{
			level flag::wait_till("teleporter_linked");
			exploder::exploder("fxexp_200");
			exploder::kill_exploder("teleporter_light_red");
			exploder::exploder("teleporter_light_green");
			trigger setHintString(&"ZM_THEATER_USE_TELEPORTER");
			trigger waittill("trigger", User);
			if(zombie_utility::is_player_valid(User) && User zm_score::can_player_purchase(level.teleport_cost))
			{
				active = 1;
				exploder::kill_exploder("teleporter_light_green");
				exploder::exploder("teleporter_light_red");
				trigger setHintString("");
				User zm_score::minus_to_player_score(level.teleport_cost);
				exploder::kill_exploder("fxexp_200");
				level clientfield::increment("teleporter_initiate_fx");
				trigger player_teleporting(index);
				level.link_cable clientfield::set("teleporter_link_cable_mtl", 0);
				trigger setHintString(&"ZOMBIE_TELEPORT_COOLDOWN");
				wait(90);
				active = 0;
				exploder::delete_exploder_on_clients("fxexp_202");
				level flag::clear("teleporter_linked");
				level flag::clear("core_linked");
				exploder::kill_exploder("teleporter_light_red");
				exploder::exploder("teleporter_light_green");
			}
		}
	}
}

/*
	Name: teleport_link_think
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x1BC8
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 462
*/
function teleport_link_think()
{
	trigger_name = "trigger_teleport_pad_0";
	core = GetEnt(trigger_name, "targetname");
	User = undefined;
	while(1)
	{
		if(!level flag::get("core_linked"))
		{
			core setHintString(&"ZM_THEATER_LINK_CORE");
			core waittill("trigger", User);
			core playsound("evt_teleporter_activate_start");
			level flag::set("core_linked");
			core setHintString("");
			Pad = GetEnt(core.target, "targetname");
			Pad setHintString(&"ZM_THEATER_LINK_PAD");
		}
		util::wait_network_frame();
	}
}

/*
	Name: teleport_pad_hide_use
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x1D38
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 493
*/
function teleport_pad_hide_use()
{
	trigger_name = "trigger_teleport_pad_0";
	core = GetEnt(trigger_name, "targetname");
	Pad = GetEnt(core.target, "targetname");
	Pad setcursorhint("HINT_NOICON");
	level.link_cable = GetEnt("teleporter_link_cable", "targetname");
	Pad setHintString(&"ZOMBIE_NEED_POWER");
	level flag::wait_till("power_on");
	Pad setHintString(&"ZM_THEATER_START_CORE");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: teleport_pad_think
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x1E58
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 517
*/
function teleport_pad_think()
{
	trigger_name = "trigger_teleport_pad_0";
	core = GetEnt(trigger_name, "targetname");
	Pad = GetEnt(core.target, "targetname");
	User = undefined;
	while(1)
	{
		if(!level flag::get("teleporter_linked") && level flag::get("core_linked"))
		{
			Pad waittill("trigger", User);
			Pad setHintString("");
			Pad playsound("evt_teleporter_activate_finish");
			level flag::set("teleporter_linked");
			level.link_cable clientfield::set("teleporter_link_cable_mtl", 1);
		}
		util::wait_network_frame();
	}
}

/*
	Name: player_teleporting
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x1FD0
	Size: 0x468
	Parameters: 1
	Flags: None
	Line Number: 547
*/
function player_teleporting(index)
{
	var_1bea176e = [];
	self thread teleport_pad_player_fx(undefined);
	self thread teleport_2d_audio();
	self thread teleport_nuke(undefined, 300);
	wait(level.teleport_delay);
	exploder::exploder("fxexp_202");
	self notify("fx_done");
	var_1bea176e = self teleport_players(var_1bea176e, "projroom");
	if(!isdefined(var_1bea176e) || (isdefined(var_1bea176e) && var_1bea176e.size < 1))
	{
		return;
	}
	var_1bea176e = Array::filter(var_1bea176e, 0, &function_1488cf91);
	foreach(e_player in var_1bea176e)
	{
		e_player.var_35c3d096 = 1;
	}
	wait(30);
	var_1bea176e = Array::filter(var_1bea176e, 0, &function_1488cf91);
	level.extracam_screen clientfield::set("extra_screen", 0);
	if(RandomInt(100) > 24 && !isdefined(level.eeroomsinuse))
	{
		loc = "eerooms";
		level.eeroomsinuse = 1;
		if(RandomInt(100) > 65)
		{
			level thread eeroom_powerup_drop();
		}
	}
	else
	{
		loc = "theater";
		exploder::exploder(301);
	}
	self thread teleport_pad_player_fx(var_1bea176e);
	self thread teleport_2d_audio_specialroom_start(var_1bea176e);
	wait(level.teleport_delay);
	var_1bea176e = Array::filter(var_1bea176e, 0, &function_1488cf91);
	self notify("fx_done");
	self thread teleport_2d_audio_specialroom_go(var_1bea176e);
	self teleport_players(var_1bea176e, loc);
	if(isdefined(loc) && loc == "eerooms")
	{
		loc = "theater";
		wait(4);
		var_1bea176e = Array::filter(var_1bea176e, 0, &function_1488cf91);
		self thread teleport_2d_audio_specialroom_start(var_1bea176e);
		exploder::exploder(301);
		self thread teleport_pad_player_fx(var_1bea176e);
		wait(level.teleport_delay);
		var_1bea176e = Array::filter(var_1bea176e, 0, &function_1488cf91);
		self notify("fx_done");
		self thread teleport_2d_audio_specialroom_go(var_1bea176e);
		self teleport_players(var_1bea176e, loc);
	}
}

/*
	Name: teleport_trigger_invisible
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x2440
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 616
*/
function teleport_trigger_invisible(enable)
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i]))
		{
			self setinvisibletoplayer(players[i], enable);
		}
	}
	return;
}

/*
	Name: player_is_near_pad
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x24D0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 639
*/
function player_is_near_pad(player)
{
	if(player istouching(self))
	{
		return 1;
	}
	return 0;
}

/*
	Name: teleport_pad_player_fx
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x2508
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 658
*/
function teleport_pad_player_fx(players)
{
	self endon("fx_done");
	inprojroom = 0;
	if(!isdefined(players))
	{
		players = GetPlayers();
	}
	else
	{
		inprojroom = 1;
	}
	while(1)
	{
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(players[i]))
			{
				if(self player_is_near_pad(players[i]) || inprojroom)
				{
					continue;
				}
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_1488cf91
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x25E0
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 696
*/
function function_1488cf91(e_player)
{
	var_1de511b3 = GetEnt("teleportation_area", "targetname");
	result = isalive(e_player) && e_player.sessionstate !== "spectator" && e_player istouching(var_1de511b3);
	if(!result && isdefined(e_player))
	{
		e_player FreezeControls(0);
		e_player show();
		e_player Unlink();
	}
	return result;
}

/*
	Name: teleport_players
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x26D8
	Size: 0xB60
	Parameters: 2
	Flags: None
	Line Number: 719
*/
function teleport_players(var_1bea176e, loc)
{
	self endon("death");
	PLAYER_RADIUS = 16;
	dest_room = [];
	all_players = level.activePlayers;
	slot = undefined;
	start = undefined;
	if(loc == "projroom")
	{
		players = all_players;
	}
	else
	{
		players = var_1bea176e;
	}
	dest_room = get_array_spots("teleport_room_", dest_room);
	initialize_occupied_flag(dest_room);
	check_for_occupied_spots(dest_room, all_players, PLAYER_RADIUS);
	prone_offset = VectorScale((0, 0, 1), 49);
	crouch_offset = VectorScale((0, 0, 1), 20);
	stand_offset = (0, 0, 0);
	foreach(player in players)
	{
		if(loc == "projroom" && self player_is_near_pad(player) == 0)
		{
			continue;
		}
		else if(loc == "projroom" && self player_is_near_pad(player))
		{
			Array::add(var_1bea176e, player, 0);
		}
		player.is_teleporting = 1;
		player clientfield::increment("player_teleport_fx");
		player clientfield::set_to_player("player_dust_mote", 0);
		player FreezeControls(1);
		player Hide();
		util::wait_network_frame();
		slot = player.characterindex;
		start = 0;
		player.inteleportation = 1;
		visionset_mgr::activate("overlay", "zm_theater_teleport", player);
		if(player GetStance() == "prone")
		{
			desired_origin = dest_room[slot].origin + prone_offset;
			desired_offset = prone_offset;
		}
		else if(player GetStance() == "crouch")
		{
			desired_origin = dest_room[slot].origin + crouch_offset;
			desired_offset = crouch_offset;
		}
		else
		{
			desired_origin = dest_room[slot].origin + stand_offset;
			desired_offset = stand_offset;
		}
		util::setClientSysState("levelNotify", "black_box_start", player);
		player SetOrigin(dest_room[slot].origin);
		player SetPlayerAngles(dest_room[slot].angles);
		player.teleport_origin = spawn("script_origin", player.origin);
		player.teleport_origin.angles = player.angles;
		player LinkTo(player.teleport_origin);
		player thread function_7e0ed731(slot, desired_offset);
		dest_room[slot].occupied = 1;
		player PlayRumbleOnEntity("zm_castle_moon_explosion_rumble");
	}
	if(!isdefined(var_1bea176e) || (isdefined(var_1bea176e) && var_1bea176e.size < 1))
	{
		return;
	}
	wait(2);
	var_1bea176e = Array::filter(var_1bea176e, 0, &function_1488cf91);
	dest_room = [];
	if(loc == "projroom")
	{
		dest_room = get_array_spots("projroom_teleport_player", dest_room);
	}
	else if(loc == "eerooms")
	{
		level.eeroomsinuse = 1;
		dest_room = get_array_spots("ee_teleport_player", dest_room);
	}
	else if(loc == "theater")
	{
		if(isdefined(self.target))
		{
			ent = GetEnt(self.target, "targetname");
			self thread teleport_nuke(undefined, 20);
		}
		dest_room = get_array_spots("theater_teleport_player", dest_room);
	}
	initialize_occupied_flag(dest_room);
	check_for_occupied_spots(dest_room, all_players, PLAYER_RADIUS);
	var_1bea176e = Array::filter(var_1bea176e, 0, &function_1488cf91);
	foreach(player in var_1bea176e)
	{
		if(dest_room[0].occupied && dest_room[1].occupied && dest_room[2].occupied && dest_room[3].occupied)
		{
			dest_room[0].occupied = 0;
			dest_room[1].occupied = 0;
			dest_room[2].occupied = 0;
			dest_room[3].occupied = 0;
		}
		slot = randomIntRange(0, 4);
		start = 0;
		while(dest_room[slot].occupied && start < 4)
		{
			start++;
			slot++;
			if(slot >= 4)
			{
				slot = 0;
			}
		}
		dest_room[slot].occupied = 1;
		util::setClientSysState("levelNotify", "black_box_end", player);
		player notify("stop_teleport_fx");
		/#
			/#
				Assert(isdefined(player.teleport_origin));
			#/
		#/
		player.teleport_origin delete();
		player.teleport_origin = undefined;
		player SetOrigin(dest_room[slot].origin);
		player SetPlayerAngles(dest_room[slot].angles);
		player clientfield::increment("player_teleport_fx");
		player FreezeControls(0);
		player show();
		util::setClientSysState("levelNotify", "t2bfx", player);
		visionset_mgr::deactivate("overlay", "zm_theater_teleport", player);
		player teleport_aftereffects();
		if(loc == "projroom")
		{
			level.second_hand thread start_wall_clock();
			thread extra_cam_startup();
			player clientfield::set_to_player("player_dust_mote", 1);
		}
		else if(loc == "theater")
		{
			player.inteleportation = 0;
			player.var_35c3d096 = undefined;
			player clientfield::set_to_player("player_dust_mote", 1);
		}
		else
		{
			player notify("player_teleported", slot);
		}
		player.is_teleporting = 0;
	}
	if(loc == "projroom")
	{
		return var_1bea176e;
	}
	if(loc == "theater")
	{
		level.eeroomsinuse = undefined;
		exploder::exploder(302);
	}
}

/*
	Name: extra_cam_startup
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x3240
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 891
*/
function extra_cam_startup()
{
	wait(2);
	level.extracam_screen show();
	level.extracam_screen clientfield::set("extra_screen", 1);
	players = level.players;
	for(i = 0; i < players.size; i++)
	{
		util::setClientSysState("levelNotify", "camera_start", players[i]);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_array_spots
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x3300
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 915
*/
function get_array_spots(sName, spots)
{
	for(i = 0; i < 4; i++)
	{
		spots[i] = GetEnt(sName + i, "targetname");
	}
	return spots;
}

/*
	Name: initialize_occupied_flag
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x3378
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 934
*/
function initialize_occupied_flag(spots)
{
	for(i = 0; i < spots.size; i++)
	{
		spots[i].occupied = 0;
	}
}

/*
	Name: check_for_occupied_spots
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x33D0
	Size: 0x108
	Parameters: 3
	Flags: None
	Line Number: 952
*/
function check_for_occupied_spots(dest, players, PLAYER_RADIUS)
{
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i]))
		{
			for(j = 0; j < dest.size; j++)
			{
				if(!dest[j].occupied)
				{
					dist = Distance2D(dest[j].origin, players[i].origin);
					if(dist < PLAYER_RADIUS)
					{
						dest[j].occupied = 1;
					}
				}
			}
		}
	}
}

/*
	Name: teleport_2d_audio
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x34E0
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 983
*/
function teleport_2d_audio()
{
	self endon("fx_done");
	util::clientNotify("tpa");
	players = GetPlayers();
	wait(1.7);
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i]))
		{
			if(self player_is_near_pad(players[i]))
			{
				util::setClientSysState("levelNotify", "t2d", players[i]);
			}
		}
	}
}

/*
	Name: teleport_2d_audio_nopad
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x35B8
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1011
*/
function teleport_2d_audio_nopad(player)
{
	self endon("fx_done");
	for(i = 0; i < player.size; i++)
	{
		if(isdefined(player[i]))
		{
			util::setClientSysState("levelNotify", "t2dn", player[i]);
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: teleport_2d_audio_specialroom_start
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x3640
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1035
*/
function teleport_2d_audio_specialroom_start(player)
{
	self endon("fx_done");
	for(i = 0; i < player.size; i++)
	{
		if(isdefined(player[i]))
		{
			util::setClientSysState("levelNotify", "tss", player[i]);
		}
	}
}

/*
	Name: teleport_2d_audio_specialroom_go
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x36C8
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1057
*/
function teleport_2d_audio_specialroom_go(player)
{
	self endon("fx_done");
	for(i = 0; i < player.size; i++)
	{
		if(isdefined(player[i]))
		{
			util::setClientSysState("levelNotify", "tsg", player[i]);
		}
	}
}

/*
	Name: teleport_nuke
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x3750
	Size: 0x1F0
	Parameters: 2
	Flags: None
	Line Number: 1079
*/
function teleport_nuke(max_zombies, range)
{
	zombies = GetAISpeciesArray("axis");
	zombies = util::get_array_of_closest(self.origin, zombies, undefined, max_zombies, range);
	for(i = 0; i < zombies.size; i++)
	{
		wait(RandomFloatRange(0.2, 0.3));
		if(!isdefined(zombies[i]))
		{
			continue;
		}
		if(isdefined(zombies[i].animName) && (zombies[i].animName != "boss_zombie" && zombies[i].animName != "ape_zombie" && zombies[i].animName != "zombie_dog") && zombies[i].health < 5000)
		{
			zombies[i] zombie_utility::zombie_head_gib();
		}
		zombies[i] DoDamage(zombies[i].health + 100, zombies[i].origin);
		playsoundatposition("nuked", zombies[i].origin);
	}
}

/*
	Name: teleporter_vo_play
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x3948
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 1109
*/
function teleporter_vo_play(vox_type, pre_wait)
{
	if(!isdefined(pre_wait))
	{
		pre_wait = 0;
	}
	index = zm_utility::get_player_index(self);
	plr = "plr_" + index + "_";
	wait(pre_wait);
	self zm_audio::create_and_play_dialog(plr, vox_type, 0.25);
}

/*
	Name: teleport_aftereffects
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x39E8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 1131
*/
function teleport_aftereffects()
{
	self thread [[level.teleport_ae_funcs[RandomInt(level.teleport_ae_funcs.size)]]]();
}

/*
	Name: teleport_aftereffect_shellshock
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x3A28
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1146
*/
function teleport_aftereffect_shellshock()
{
	/#
		println("Dev Block strings are not supported");
	#/
	self shellshock("explosion", 3);
}

/*
	Name: teleport_aftereffect_shellshock_electric
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x3A78
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1164
*/
function teleport_aftereffect_shellshock_electric()
{
	/#
		println("Dev Block strings are not supported");
	#/
	self shellshock("electrocution", 3);
	return;
}

/*
	Name: teleport_aftereffect_fov
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x3AC8
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 1183
*/
function teleport_aftereffect_fov()
{
	/#
		println("Dev Block strings are not supported");
	#/
	start_fov = 30;
	end_fov = 65;
	duration = 0.5;
	for(i = 0; i < duration; i = 0)
	{
		fov = start_fov + end_fov - start_fov * i / duration;
		wait(0.017);
	}
}

/*
	Name: teleport_aftereffect_bw_vision
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x3B98
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1208
*/
function teleport_aftereffect_bw_vision(localClientNum)
{
	/#
		println("Dev Block strings are not supported");
	#/
	visionset_mgr::activate("visionset", "cheat_bw_invert_contrast", self);
	wait(1.25);
	visionset_mgr::deactivate("visionset", "cheat_bw_invert_contrast", self);
}

/*
	Name: teleport_aftereffect_red_vision
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x3C18
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1228
*/
function teleport_aftereffect_red_vision(localClientNum)
{
	/#
		println("Dev Block strings are not supported");
	#/
	visionset_mgr::activate("visionset", "zombie_turned", self);
	wait(1.25);
	visionset_mgr::deactivate("visionset", "zombie_turned", self);
}

/*
	Name: teleport_aftereffect_flashy_vision
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x3C98
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 1248
*/
function teleport_aftereffect_flashy_vision(localClientNum)
{
	/#
		println("Dev Block strings are not supported");
	#/
	visionset_mgr::activate("visionset", "cheat_bw_invert_contrast", self);
	wait(0.4);
	visionset_mgr::deactivate("visionset", "cheat_bw_invert_contrast", self);
	visionset_mgr::activate("visionset", "cheat_bw_contrast", self);
	wait(1.2);
	visionset_mgr::deactivate("visionset", "cheat_bw_contrast", self);
}

/*
	Name: teleport_aftereffect_flare_vision
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x3D60
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1271
*/
function teleport_aftereffect_flare_vision(localClientNum)
{
	/#
		println("Dev Block strings are not supported");
	#/
	visionset_mgr::activate("visionset", "flare", self);
	wait(1.25);
	visionset_mgr::deactivate("visionset", "flare", self);
}

/*
	Name: zombieTheaterTeleporterSeekLogic
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x3DE0
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 1291
*/
function zombieTheaterTeleporterSeekLogic()
{
	inteleportcount = 0;
	nonteleportinvalidcount = 0;
	poi1 = GetEnt("teleporter_poi1", "targetname");
	poi2 = GetEnt("teleporter_poi2", "targetname");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i].inteleportation) && players[i].inteleportation == 1)
		{
			inteleportcount++;
		}
		if(!zombie_utility::is_player_valid(players[i]) && (!isdefined(players[i].inteleportation) || players[i].inteleportation == 0))
		{
			nonteleportinvalidcount++;
		}
	}
	if(inteleportcount > 0 && (inteleportcount == players.size || inteleportcount + nonteleportinvalidcount == players.size))
	{
		if(!poi1.poi_active && !poi2.poi_active)
		{
			poi1 zm_utility::activate_zombie_point_of_interest();
			poi2 zm_utility::activate_zombie_point_of_interest();
		}
	}
	else if(inteleportcount != players.size)
	{
		if(poi1.poi_active && poi2.poi_active)
		{
			if(isdefined(poi1.attractor_array))
			{
				poi1 zm_utility::deactivate_zombie_point_of_interest(1);
			}
			if(isdefined(poi2.attractor_array))
			{
				poi2 zm_utility::deactivate_zombie_point_of_interest(1);
			}
		}
	}
}

/*
	Name: zombies_goto_position
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x4060
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 1343
*/
function zombies_goto_position(position)
{
	self endon("death");
	self endon("bad_path");
	orig_radius = self.goalRadius;
	self.ignoreall = 1;
	self.goalRadius = 128;
	/#
		IPrintLnBold("Dev Block strings are not supported", orig_radius);
	#/
	self setgoalpos(position.origin + (RandomFloatRange(-40, 40), RandomFloatRange(-40, 40), 0));
	self waittill("goal");
	self.ignoreall = 0;
	self.goalRadius = orig_radius;
	self OrientMode("face point", level.extracam_screen.origin);
}

/*
	Name: start_wall_clock
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x4188
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1370
*/
function start_wall_clock()
{
	self RotatePitch(180, 0.05);
	self waittill("rotatedone");
	for(clocktime = 0; clocktime != 30; clocktime++)
	{
		self RotatePitch(6, 0.1);
		wait(1);
	}
	wait(5);
	self RotateTo(level.second_hand_angles, 0.05);
}

/*
	Name: eeroom_powerup_drop
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x4238
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 1393
*/
function eeroom_powerup_drop()
{
	struct_array = struct::get_array("struct_random_powerup_post_teleport", "targetname");
	powerup_array = [];
	powerup_array[powerup_array.size] = "nuke";
	powerup_array[powerup_array.size] = "insta_kill";
	powerup_array[powerup_array.size] = "double_points";
	powerup_array[powerup_array.size] = "carpenter";
	powerup_array[powerup_array.size] = "fire_sale";
	powerup_array[powerup_array.size] = "full_ammo";
	powerup_array[powerup_array.size] = "minigun";
	struct_array = Array::randomize(struct_array);
	powerup_array = Array::randomize(powerup_array);
	level thread zm_powerups::specific_powerup_drop(powerup_array[0], struct_array[0].origin);
}

/*
	Name: theater_fly_me_to_the_moon_init
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x4370
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1419
*/
function theater_fly_me_to_the_moon_init()
{
	var_37cacae8 = GetEnt("trigger_jump", "targetname");
	to_the_moon_alice_trigger = GetEnt("trigger_fly_me_to_the_moon", "targetname");
	var_37cacae8 thread function_2cdd3a26();
	to_the_moon_alice_trigger thread theater_fly_me_to_the_moon();
}

/*
	Name: function_2cdd3a26
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x4408
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 1437
*/
function function_2cdd3a26()
{
	self endon("death");
	self.a_e_players = [];
	while(1)
	{
		self waittill("trigger", e_player);
		if(IsInArray(self.a_e_players, e_player))
		{
			continue;
		}
		if(!isdefined(self.a_e_players))
		{
			self.a_e_players = [];
		}
		else if(!IsArray(self.a_e_players))
		{
			self.a_e_players = Array(self.a_e_players);
		}
		self.a_e_players[self.a_e_players.size] = e_player;
		if(!isdefined(e_player._moon_jumps))
		{
			e_player._moon_jumps = 0;
		}
		e_player thread function_edc40283(self);
		e_player thread function_bc057378(self);
	}
}

/*
	Name: function_edc40283
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x4530
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 1476
*/
function function_edc40283(var_4e54c41)
{
	self endon("exit_trigger");
	self endon("death");
	var_4e54c41 endon("death");
	while(self._moon_jumps < 5)
	{
		if(self JumpButtonPressed())
		{
			self._moon_jumps = self._moon_jumps + 1;
			wait(0.9);
		}
		wait(0.05);
	}
	self notify("hash_7bde7d2d");
}

/*
	Name: function_bc057378
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x45C8
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 1503
*/
function function_bc057378(var_4e54c41)
{
	self endon("hash_7bde7d2d");
	var_4e54c41 endon("death");
	while(self istouching(var_4e54c41))
	{
		wait(0.05);
	}
	if(self._moon_jumps < 5)
	{
		self._moon_jumps = 0;
	}
	self notify("exit_trigger");
	ArrayRemoveValue(var_4e54c41.a_e_players, self);
}

/*
	Name: theater_fly_me_to_the_moon
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x4668
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 1529
*/
function theater_fly_me_to_the_moon()
{
	self endon("hash_64fcb4a6");
	self setHintString("");
	self setcursorhint("HINT_NOICON");
	while(isdefined(self))
	{
		self waittill("trigger", e_player);
		if(!isdefined(e_player._moon_jumps) || e_player._moon_jumps < 5)
		{
			wait(0.05);
			continue;
		}
		if(isdefined(e_player._moon_jumps) && e_player._moon_jumps >= 5)
		{
			level theater_moon_jump_go();
			e_player._moon_jumps = undefined;
		}
	}
}

/*
	Name: theater_moon_jump_go
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x4768
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 1560
*/
function theater_moon_jump_go()
{
	ship = GetEnt("model_zombie_rocket", "targetname");
	ship_base_origin = ship.origin;
	wait(0.05);
	ship clientfield::set("play_fly_me_to_the_moon_fx", 1);
	ship MoveZ(120, 3, 0.7, 0);
	ship waittill("movedone");
	ship clientfield::set("play_fly_me_to_the_moon_fx", 0);
	ship delete();
	var_4e54c41 = GetEnt("trigger_jump", "targetname");
	var_4e54c41 notify("hash_88782877");
	to_the_moon_alice_trigger = GetEnt("trigger_fly_me_to_the_moon", "targetname");
	to_the_moon_alice_trigger delete();
}

/*
	Name: function_7e0ed731
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x48D8
	Size: 0x100
	Parameters: 2
	Flags: None
	Line Number: 1586
*/
function function_7e0ed731(var_f7b84b84, v_offset)
{
	self endon("disconnect");
	n_room = var_f7b84b84 + 1;
	var_2d8dac7a = "teleport_room_fx_" + n_room;
	var_b4c5584f = struct::get(var_2d8dac7a, "targetname");
	var_5a10e76c = struct::spawn(var_b4c5584f.origin - v_offset, var_b4c5584f.angles);
	if(isdefined(var_5a10e76c))
	{
		waittillframeend;
		var_5a10e76c scene::Play("p7_fxanim_zm_kino_wormhole_bundle");
		var_5a10e76c struct::delete();
	}
}

/*
	Name: function_d11d2c50
	Namespace: namespace_8847920b
	Checksum: 0x424F4353
	Offset: 0x49E0
	Size: 0x64
	Parameters: 1
	Flags: None
	Line Number: 1611
*/
function function_d11d2c50(a_ents)
{
	a_ents["fxanim_kino_wormhole"] SetIgnorePauseWorld(1);
	wait(0.05);
	a_ents["fxanim_kino_wormhole"] clientfield::increment("teleporter_fx");
}

