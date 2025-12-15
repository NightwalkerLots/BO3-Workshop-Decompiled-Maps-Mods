#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_hero_weapon;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_766d6099;

/*
	Name: __init__sytem__
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x8D8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 35
*/
function autoexec __init__sytem__()
{
	system::register("zm_genesis_portals", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x918
	Size: 0x2F8
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function __init__()
{
	clientfield::register("toplayer", "player_stargate_fx", 15000, 1, "int");
	clientfield::register("toplayer", "player_light_exploder", 15000, 4, "int");
	clientfield::register("world", "genesis_light_exposure", 15000, 1, "int");
	clientfield::register("world", "power_pad_sheffield", 15000, 1, "int");
	clientfield::register("world", "power_pad_prison", 15000, 1, "int");
	clientfield::register("world", "power_pad_asylum", 15000, 1, "int");
	clientfield::register("world", "power_pad_temple", 15000, 1, "int");
	clientfield::register("toplayer", "hint_verruckt_portal_top", 15000, 1, "int");
	clientfield::register("toplayer", "hint_verruckt_portal_bottom", 15000, 1, "int");
	clientfield::register("toplayer", "hint_temple_portal_top", 15000, 1, "int");
	clientfield::register("toplayer", "hint_temple_portal_bottom", 15000, 1, "int");
	clientfield::register("toplayer", "hint_sheffield_portal_top", 15000, 1, "int");
	clientfield::register("toplayer", "hint_sheffield_portal_bottom", 15000, 1, "int");
	clientfield::register("toplayer", "hint_prison_portal_top", 15000, 1, "int");
	clientfield::register("toplayer", "hint_prison_portal_bottom", 15000, 1, "int");
	callback::on_connect(&function_cfc89ca);
	return;
}

/*
	Name: function_16616103
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0xC18
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 82
*/
function function_16616103()
{
	level flag::init("verruct_portal");
	level thread create_portal("verruckt", "verruct_portal");
	level thread function_e4ff383e("power_on4", "verruct_portal");
	level flag::init("temple_portal");
	level thread create_portal("temple", "temple_portal");
	level thread function_e4ff383e("power_on3", "temple_portal");
	level flag::init("sheffield_portal");
	level thread create_portal("sheffield", "sheffield_portal");
	level thread function_e4ff383e("power_on2", "sheffield_portal");
	level flag::init("prison_portal");
	level thread create_portal("prison", "prison_portal");
	level thread function_e4ff383e("power_on1", "prison_portal");
	return;
}

/*
	Name: function_e4ff383e
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0xDE8
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 109
*/
function function_e4ff383e(var_49e3dd2e, var_d16ec704)
{
	level flag::wait_till(var_49e3dd2e);
	level flag::set(var_d16ec704);
}

/*
	Name: function_ff160813
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0xE38
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 125
*/
function function_ff160813()
{
	while(1)
	{
		if(level flag::get("power_on1") && level flag::get("power_on3") && level flag::get("power_on4"))
		{
			break;
		}
		wait(1);
	}
	level flag::set("sheffield_portal");
	return;
	++;
}

/*
	Name: create_portal
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0xEE0
	Size: 0x1F8
	Parameters: 2
	Flags: None
	Line Number: 150
*/
function create_portal(str_id, var_776628b2)
{
	width = 192;
	height = 128;
	length = 192;
	var_d42f02cf = str_id;
	s_loc = struct::get(var_d42f02cf, "targetname");
	function_4a4784d4(var_d42f02cf, 0);
	if(isdefined(var_776628b2))
	{
		level flag::wait_till(var_776628b2);
	}
	level thread function_53e2c53d(var_d42f02cf);
	level thread function_1e956fba(var_d42f02cf);
	var_6bca29ec = "close_portal_" + str_id;
	var_2c5f1c2a = "open_portal_" + str_id;
	while(1)
	{
		level util::waittill_any("close_all_portals", var_6bca29ec);
		level thread function_7fa2f44(var_d42f02cf);
		level.var_ccae6720 = 1;
		function_4a4784d4(var_d42f02cf, 0);
		level util::waittill_any("open_all_portals", var_2c5f1c2a);
		level thread function_53e2c53d(var_d42f02cf);
		level.var_ccae6720 = 0;
		function_4a4784d4(var_d42f02cf, 1);
	}
}

/*
	Name: function_a90ab0d7
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x10E0
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 189
*/
function function_a90ab0d7()
{
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
		level thread function_53e2c53d(self.stub.var_d42f02cf);
		level thread function_1e956fba(self.stub.var_d42f02cf);
		break;
	}
}

/*
	Name: function_53e2c53d
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x11B8
	Size: 0x298
	Parameters: 1
	Flags: None
	Line Number: 222
*/
function function_53e2c53d(var_d42f02cf)
{
	switch(var_d42f02cf)
	{
		case "prison":
		{
			level clientfield::set("power_pad_prison", 1);
			if(GetDvarInt("splitscreen_playerCount") < 3)
			{
				level thread scene::Play("prison_power_door", "targetname");
				level thread scene::Play("prison_power_door2", "targetname");
				break;
			}
		}
		case "sheffield":
		{
			level clientfield::set("power_pad_sheffield", 1);
			if(GetDvarInt("splitscreen_playerCount") < 3)
			{
				level thread scene::Play("sheffield_power_door", "targetname");
				level thread scene::Play("sheffield_power_door2", "targetname");
				break;
			}
		}
		case "temple":
		{
			level clientfield::set("power_pad_temple", 1);
			if(GetDvarInt("splitscreen_playerCount") < 3)
			{
				level thread scene::Play("temple_power_door", "targetname");
				level thread scene::Play("temple_power_door2", "targetname");
				break;
			}
		}
		case "verruckt":
		{
			level clientfield::set("power_pad_asylum", 1);
			if(GetDvarInt("splitscreen_playerCount") < 3)
			{
				level thread scene::Play("verruckt_power_door", "targetname");
				level thread scene::Play("verruckt_power_door2", "targetname");
				break;
			}
		}
	}
}

/*
	Name: function_7fa2f44
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x1458
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 279
*/
function function_7fa2f44(var_d42f02cf)
{
	switch(var_d42f02cf)
	{
		case "sheffield":
		{
			exploder::stop_exploder("fxexp_212");
			break;
		}
		case "temple":
		{
			exploder::stop_exploder("fxexp_242");
			break;
		}
		case "verruckt":
		{
			exploder::stop_exploder("fxexp_232");
			break;
		}
		case "prison":
		{
			exploder::stop_exploder("fxexp_222");
			break;
		}
	}
}

/*
	Name: function_1e956fba
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x1518
	Size: 0x420
	Parameters: 1
	Flags: None
	Line Number: 316
*/
function function_1e956fba(var_d42f02cf)
{
	function_4a4784d4(var_d42f02cf, 1);
	var_de1f2abc = GetEntArray(var_d42f02cf + "_portal_top", "script_noteworthy");
	var_ebfa395 = function_ca448a30(var_de1f2abc, "teleport_trigger", "targetname");
	var_a70f04bd = function_ca448a30(var_de1f2abc, "teleport_clip", "targetname");
	var_58afe656 = GetEntArray(var_d42f02cf + "_portal_bottom", "script_noteworthy");
	var_50fc4fb = function_ca448a30(var_58afe656, "teleport_trigger", "targetname");
	var_852a023 = function_ca448a30(var_58afe656, "teleport_clip", "targetname");
	var_ebfa395[0].e_dest = var_50fc4fb[0];
	var_50fc4fb[0].e_dest = var_ebfa395[0];
	var_1693bd2 = GetNodeArray(var_d42f02cf + "_portal_node", "script_noteworthy");
	foreach(var_9110bac3 in var_1693bd2)
	{
		var_e8b9ac31 = DistanceSquared(var_9110bac3.origin, var_ebfa395[0].origin);
		var_6d6d9e09 = DistanceSquared(var_9110bac3.origin, var_50fc4fb[0].origin);
		if(var_e8b9ac31 < var_6d6d9e09)
		{
			var_9110bac3.portal_trig = var_ebfa395[0];
			continue;
		}
		var_9110bac3.portal_trig = var_50fc4fb[0];
	}
	wait(2);
	var_ebfa395[0] thread portal_think();
	foreach(e_clip in var_a70f04bd)
	{
		e_clip delete();
	}
	var_50fc4fb[0] thread portal_think();
	foreach(e_clip in var_852a023)
	{
		e_clip delete();
	}
}

/*
	Name: function_4a4784d4
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x1940
	Size: 0xD8
	Parameters: 2
	Flags: None
	Line Number: 362
*/
function function_4a4784d4(var_d42f02cf, b_enabled)
{
	var_1693bd2 = GetNodeArray(var_d42f02cf + "_portal_node", "script_noteworthy");
	foreach(var_9110bac3 in var_1693bd2)
	{
		SetEnableNode(var_9110bac3, b_enabled);
	}
}

/*
	Name: portal_think
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x1A20
	Size: 0x1F0
	Parameters: 1
	Flags: None
	Line Number: 381
*/
function portal_think(b_show_fx)
{
	self.var_71abf438 = struct::get_array(self.target, "targetname");
	if(!isdefined(b_show_fx))
	{
		b_show_fx = 1;
	}
	if(isdefined(self.script_string))
	{
		str_zone = self.script_string;
	}
	if(isdefined(self.e_dest) && isdefined(self.e_dest.script_noteworthy))
	{
		var_759fb311 = self.e_dest.script_noteworthy;
	}
	while(1)
	{
		self waittill("trigger", var_5ee55fde);
		if(isdefined(level.var_ccae6720) && level.var_ccae6720)
		{
			continue;
		}
		if(isdefined(var_5ee55fde.b_teleporting) && var_5ee55fde.b_teleporting)
		{
			continue;
		}
		if(isPlayer(var_5ee55fde))
		{
			if(var_5ee55fde GetStance() != "prone")
			{
				playFX(level._effect["portal_3p"], var_5ee55fde.origin);
				var_5ee55fde playlocalsound("zmb_teleporter_teleport_2d");
				playsoundatposition("zmb_teleporter_teleport_out", var_5ee55fde.origin);
				var_5ee55fde thread function_d0ff7e09(b_show_fx, self.var_71abf438, str_zone, self.origin, var_759fb311);
			}
		}
	}
}

/*
	Name: function_d0ff7e09
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x1C18
	Size: 0x8D8
	Parameters: 5
	Flags: None
	Line Number: 430
*/
function function_d0ff7e09(show_fx, var_71abf438, str_zone, v_portal, var_759fb311)
{
	if(!isdefined(show_fx))
	{
		show_fx = 1;
	}
	self endon("disconnect");
	self endon("death");
	self notify("gravityspikes_attack_watchers_end");
	self.b_teleporting = 1;
	self.teleport_location = self.origin;
	self.var_71abf438 = var_71abf438;
	if(isdefined(var_759fb311))
	{
		self clientfield::set_to_player("hint_" + var_759fb311, 1);
	}
	if(show_fx)
	{
		self clientfield::set_to_player("player_stargate_fx", 1);
	}
	n_pos = self.characterindex;
	prone_offset = VectorScale((0, 0, 1), 49);
	crouch_offset = VectorScale((0, 0, 1), 20);
	stand_offset = (0, 0, 0);
	a_ai_enemies = GetAITeamArray("axis");
	a_ai_enemies = ArraySort(a_ai_enemies, v_portal, 1, 99, 768);
	Array::thread_all(a_ai_enemies, &function_7807150a);
	level.n_cleanup_manager_restart_time = 19;
	level.n_cleanup_manager_restart_time = level.n_cleanup_manager_restart_time + GetTime() / 1000;
	image_room = struct::get("teleport_room_" + n_pos, "targetname");
	var_d9543609 = undefined;
	self FreezeControls(1);
	self SetLowReady(1);
	util::wait_network_frame();
	if(self GetStance() == "prone")
	{
		desired_origin = image_room.origin + prone_offset;
	}
	else if(self GetStance() == "crouch")
	{
		desired_origin = image_room.origin + crouch_offset;
	}
	else
	{
		desired_origin = image_room.origin + stand_offset;
	}
	self.teleport_origin = util::spawn_model("tag_origin", self.origin, self.angles);
	self playerlinktoabsolute(self.teleport_origin, "tag_origin");
	self.teleport_origin.origin = desired_origin;
	self.teleport_origin.angles = image_room.angles;
	util::wait_network_frame();
	self.teleport_origin.angles = image_room.angles;
	if(isdefined(str_zone))
	{
		zm_zonemgr::enable_zone(str_zone);
	}
	if(isdefined(var_759fb311))
	{
		switch(var_759fb311)
		{
			case "prison_portal_bottom":
			case "sheffield_portal_bottom":
			case "temple_portal_bottom":
			case "verruckt_portal_bottom":
			{
				self function_eec1f014("prototype", 10, 1);
				break;
			}
			case "sheffield_portal_top":
			{
				self function_eec1f014("start", 2, 1);
				break;
			}
			case "prison_portal_top":
			{
				self function_eec1f014("prison", 4, 1);
				break;
			}
			case "verruckt_portal_top":
			{
				self function_eec1f014("asylum", 6, 1);
				break;
			}
			case "temple_portal_top":
			{
				self function_eec1f014("temple", 8, 1);
				break;
			}
		}
	}
	wait(3.3);
	self SetLowReady(0);
	wait(0.7);
	if(show_fx)
	{
		self clientfield::set_to_player("player_stargate_fx", 0);
	}
	a_players = GetPlayers();
	ArrayRemoveValue(a_players, self);
	s_pos = Array::random(var_71abf438);
	if(a_players.size > 0)
	{
		var_cefa4b63 = 0;
		while(!var_cefa4b63)
		{
			var_cefa4b63 = 1;
			s_pos = Array::random(var_71abf438);
			foreach(var_3bc10d31 in a_players)
			{
				var_f2c93934 = Distance(var_3bc10d31.origin, s_pos.origin);
				if(var_f2c93934 < 32)
				{
					var_cefa4b63 = 0;
				}
			}
			wait(0.05);
		}
	}
	playFX(level._effect["portal_3p"], s_pos.origin);
	self Unlink();
	playsoundatposition("zmb_teleporter_teleport_in", s_pos.origin);
	self thread function_bfba39d8();
	self SetOrigin(s_pos.origin);
	self SetPlayerAngles(s_pos.angles);
	self.zone_name = self zm_utility::get_current_zone();
	self.last_valid_position = self.origin;
	if(!IsPointOnNavMesh(self.origin, self))
	{
		position = GetClosestPointOnNavMesh(self.origin, 100, 15);
		if(isdefined(position))
		{
			self.last_valid_position = position;
		}
	}
	level thread function_483df985(s_pos);
	self FreezeControls(level.intermission);
	if(isdefined(var_759fb311))
	{
		self clientfield::set_to_player("hint_" + var_759fb311, 0);
		/#
			function_57805da3("Dev Block strings are not supported" + var_759fb311);
		#/
	}
	self.b_teleporting = 0;
	self thread zm_audio::create_and_play_dialog("portal", "travel");
}

/*
	Name: function_bfba39d8
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x24F8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 587
*/
function function_bfba39d8()
{
	util::wait_network_frame();
	if(isdefined(self.teleport_origin))
	{
		self.teleport_origin delete();
		self.teleport_origin = undefined;
	}
}

/*
	Name: function_483df985
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x2548
	Size: 0x468
	Parameters: 1
	Flags: None
	Line Number: 607
*/
function function_483df985(s_pos)
{
	a_ai = GetAIArray();
	var_aca0d7c7 = ArraySortClosest(a_ai, s_pos.origin, a_ai.size, 0, 260);
	foreach(ai in var_aca0d7c7)
	{
		if(IsActor(ai) && (!isdefined(level.var_e7aa252c) || ai != level.var_e7aa252c))
		{
			if(ai.archetype === "zombie")
			{
				playFX(level._effect["beast_return_aoe_kill"], ai GetTagOrigin("j_spineupper"));
			}
			else
			{
				playFX(level._effect["beast_return_aoe_kill"], ai.origin);
			}
			ai.has_been_damaged_by_player = 0;
			ai.deathpoints_already_given = 1;
			ai.no_powerups = 1;
			if(!(isdefined(ai.exclude_cleanup_adding_to_total) && ai.exclude_cleanup_adding_to_total))
			{
				level.zombie_total++;
				level.zombie_respawns++;
				ai.var_4d11bb60 = 1;
				if(isdefined(ai.maxhealth) && ai.health < ai.maxhealth)
				{
					if(!isdefined(level.a_zombie_respawn_health[ai.archetype]))
					{
						level.a_zombie_respawn_health[ai.archetype] = [];
					}
					if(!isdefined(level.a_zombie_respawn_health[ai.archetype]))
					{
						level.a_zombie_respawn_health[ai.archetype] = [];
					}
					else if(!IsArray(level.a_zombie_respawn_health[ai.archetype]))
					{
						level.a_zombie_respawn_health[ai.archetype] = Array(level.a_zombie_respawn_health[ai.archetype]);
					}
					level.a_zombie_respawn_health[ai.archetype][level.a_zombie_respawn_health[ai.archetype].size] = ai.health;
				}
				ai zombie_utility::reset_attack_spot();
			}
			switch(ai.archetype)
			{
				case "margwa":
				{
					if(isdefined(ai.canStun) && ai.canStun)
					{
						ai.reactStun = 1;
						break;
					}
				}
				case "mechz":
				{
					if(!(isdefined(ai.stun) && ai.stun) && ai.stumble_stun_cooldown_time < GetTime())
					{
						ai.stun = 1;
						break;
					}
				}
				default
				{
					ai kill();
					break;
				}
			}
		}
	}
}

/*
	Name: function_7807150a
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x29B8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 687
*/
function function_7807150a()
{
	if(!(isdefined(self.b_ignore_cleanup) && self.b_ignore_cleanup))
	{
		self notify("hash_450c36af");
		self endon("death");
		self endon("hash_450c36af");
		self.b_ignore_cleanup = 1;
		self.var_b6b1080c = 1;
		wait(10);
		self.b_ignore_cleanup = undefined;
		self.var_b6b1080c = undefined;
	}
}

/*
	Name: function_eb1242c8
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x2A30
	Size: 0x2C0
	Parameters: 1
	Flags: None
	Line Number: 712
*/
function function_eb1242c8(var_5ee55fde)
{
	var_5ee55fde endon("death");
	var_5ee55fde.b_teleporting = 1;
	var_5ee55fde PathMode("dont move");
	playFX(level._effect["portal_3p"], var_5ee55fde.origin);
	playsoundatposition("zmb_teleporter_teleport_out", var_5ee55fde.origin);
	var_5ee55fde notsolid();
	util::wait_network_frame();
	image_room = struct::get("teleport_room_zombies", "targetname");
	if(IsActor(var_5ee55fde))
	{
		var_5ee55fde ForceTeleport(image_room.origin, image_room.angles);
	}
	else
	{
		var_5ee55fde.origin = image_room.origin;
		var_5ee55fde.angles = image_room.angles;
	}
	wait(5);
	var_97bf7ab1 = Array::random(self.var_71abf438);
	if(IsActor(var_5ee55fde))
	{
		var_5ee55fde ForceTeleport(var_97bf7ab1.origin, var_97bf7ab1.angles);
	}
	else
	{
		var_5ee55fde.origin = var_97bf7ab1.origin;
		var_5ee55fde.angles = var_97bf7ab1.angles;
	}
	playsoundatposition("zmb_teleporter_teleport_in", var_97bf7ab1.origin);
	playFX(level._effect["portal_3p"], var_97bf7ab1.origin);
	var_5ee55fde solid();
	wait(1);
	var_5ee55fde PathMode("move allowed");
	var_5ee55fde.b_teleporting = 0;
}

/*
	Name: function_cfc89ca
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x2CF8
	Size: 0x478
	Parameters: 0
	Flags: None
	Line Number: 760
*/
function function_cfc89ca()
{
	self endon("disconnect");
	self endon("death");
	level endon("hash_c9cb5160");
	level flag::wait_till("start_zombie_round_logic");
	self.var_fe12a779 = [];
	self.var_fe12a779["start"] = 0;
	self.var_fe12a779["prison"] = 0;
	self.var_fe12a779["asylum"] = 0;
	self.var_fe12a779["temple"] = 0;
	self.var_fe12a779["prototype"] = 0;
	while(1)
	{
		if(isdefined(self.island_name) && (!(isdefined(self.var_122a2dda) && self.var_122a2dda)))
		{
			switch(self.island_name)
			{
				case "start_island":
				{
					self function_eec1f014("start", 2, 1);
					self function_eec1f014("prison", 3, 0);
					self function_eec1f014("asylum", 5, 0);
					self function_eec1f014("temple", 7, 0);
					self function_eec1f014("prototype", 9, 0);
					break;
				}
				case "prison_island":
				{
					self function_eec1f014("prison", 4, 1);
					self function_eec1f014("start", 1, 0);
					self function_eec1f014("asylum", 5, 0);
					self function_eec1f014("temple", 7, 0);
					self function_eec1f014("prototype", 9, 0);
					break;
				}
				case "asylum_island":
				{
					self function_eec1f014("asylum", 6, 1);
					self function_eec1f014("start", 1, 0);
					self function_eec1f014("prison", 3, 0);
					self function_eec1f014("temple", 7, 0);
					self function_eec1f014("prototype", 9, 0);
					break;
				}
				case "temple_island":
				{
					self function_eec1f014("temple", 8, 1);
					self function_eec1f014("start", 1, 0);
					self function_eec1f014("prison", 3, 0);
					self function_eec1f014("asylum", 5, 0);
					self function_eec1f014("prototype", 9, 0);
					break;
				}
				case "prototype_island":
				{
					self function_eec1f014("prototype", 10, 1);
					self function_eec1f014("start", 1, 0);
					self function_eec1f014("prison", 3, 0);
					self function_eec1f014("asylum", 5, 0);
					self function_eec1f014("temple", 7, 0);
					break;
				}
			}
		}
		wait(0.05);
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_eec1f014
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x3178
	Size: 0xA0
	Parameters: 3
	Flags: None
	Line Number: 841
*/
function function_eec1f014(str_name, n_value, b_toggle)
{
	if(self.var_fe12a779[str_name] == b_toggle)
	{
		self clientfield::set_to_player("player_light_exploder", n_value);
		util::wait_network_frame();
		if(self.var_fe12a779[str_name])
		{
			self.var_fe12a779[str_name] = 0;
		}
		else
		{
			self.var_fe12a779[str_name] = 1;
		}
	}
}

/*
	Name: function_b64d33a7
	Namespace: namespace_766d6099
	Checksum: 0x424F4353
	Offset: 0x3220
	Size: 0x6E
	Parameters: 0
	Flags: None
	Line Number: 868
*/
function function_b64d33a7()
{
	level waittill("start_zombie_round_logic");
	wait(120);
	while(1)
	{
		level clientfield::set("genesis_light_exposure", 1);
		wait(5);
		level clientfield::set("genesis_light_exposure", 0);
		wait(120);
	}
}

