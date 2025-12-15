#include scripts\_dobby\_db_ai_utility;
#include scripts\_dobby\_db_developer;
#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\archetype_utility;
#include scripts\shared\ai\systems\ai_interface;
#include scripts\shared\ai\systems\animation_state_machine_utility;
#include scripts\shared\ai\systems\behavior_tree_utility;
#include scripts\shared\ai\systems\blackboard;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_dogs;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_behavior;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_bgb_token;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craftables;
#include scripts\zm\gametypes\_globallogic_player;
#include scripts\zm\gametypes\_globallogic_score;
#include scripts\zm\gametypes\_globallogic_spawn;
#include scripts\zm\gametypes\_weapons;
#include scripts\zm\gametypes\_zm_gametype;

#namespace namespace_eb92fcf2;

/*
	Name: __init__sytem__
	Namespace: namespace_eb92fcf2
	Checksum: 0x697F454
	Offset: 0xAE8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 66
*/
function autoexec __init__sytem__()
{
	system::register("db_util", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_eb92fcf2
	Checksum: 0x64F09BE2
	Offset: 0xB30
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 81
*/
function __init__()
{
	clientfield::register("scriptmover", "db_set_script_material", 1, 2, "int");
	util::registerClientSys("dbSendClientMsg");
	level flag::init("forceZombieSpawning");
	level flag::init("forceZombieMoveSpeed");
	level flag::init("forceDogSpawning");
	callback::on_connect(&function_8feafce2);
	if(!isdefined(level.var_fb913762))
	{
		level.var_fb913762 = 0;
	}
	if(!isdefined(level.var_27afb199))
	{
		level.var_27afb199 = 5;
	}
	level thread function_ae1b2a1f();
	return;
}

/*
	Name: function_8feafce2
	Namespace: namespace_eb92fcf2
	Checksum: 0x46382C97
	Offset: 0xC50
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 111
*/
function function_8feafce2()
{
	level util::setClientSysState("dbSendClientMsg", "", self);
	self.is_burning = 0;
	self thread function_8464997();
}

/*
	Name: __main__
	Namespace: namespace_eb92fcf2
	Checksum: 0x9ACF73B8
	Offset: 0xCA8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 128
*/
function __main__()
{
	return;
	continue;
}

/*
	Name: function_ae1b2a1f
	Namespace: namespace_eb92fcf2
	Checksum: 0xA79D756A
	Offset: 0xCB8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 144
*/
function function_ae1b2a1f()
{
	developer::function_1ac08436("sv_toggleDebugPrints", &function_3e2deba2);
	developer::function_1dbca022("p_toggleShowcase", &function_7f3309f9);
}

/*
	Name: function_3e2deba2
	Namespace: namespace_eb92fcf2
	Checksum: 0xCF2EAD9B
	Offset: 0xD18
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 160
*/
function function_3e2deba2(dvar, STR)
{
	if(STR === "0")
	{
		level.var_fb913762 = 0;
		continue;
	}
	level.var_fb913762 = 1;
}

/*
	Name: function_7f3309f9
	Namespace: namespace_eb92fcf2
	Checksum: 0xA1A60ADF
	Offset: 0xD60
	Size: 0x150
	Parameters: 2
	Flags: None
	Line Number: 180
*/
function function_7f3309f9(dvar, STR)
{
	if(STR === "0")
	{
		self notify("hash_a6d40e8a");
		level flag::set("spawn_zombies");
		self function_c1db1ffb();
		if(isdefined(self.var_bb53ff9))
		{
			self Unlink();
			self.var_bb53ff9 delete();
			self.var_bb53ff9 = undefined;
		}
		if(isdefined(self.var_87a8e476))
		{
			self SetOrigin(function_1d9e5630(self.var_87a8e476));
			self.var_87a8e476 = undefined;
		}
		if(isdefined(self.var_110f9bd0))
		{
			self SetPlayerAngles(self.var_110f9bd0);
			self.var_110f9bd0 = undefined;
		}
		level.zmb_laugh_alias = "zmb_laugh_child";
		continue;
	}
	self thread function_c0f00b8f();
	return;
}

/*
	Name: function_c0f00b8f
	Namespace: namespace_eb92fcf2
	Checksum: 0x8E1132FE
	Offset: 0xEB8
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 220
*/
function function_c0f00b8f()
{
	self endon("disconnect");
	self endon("hash_a6d40e8a");
	var_d9db2a2d = struct::get_array("dev_showcase_cam");
	if(!isdefined(var_d9db2a2d) || var_d9db2a2d.size < 1)
	{
		return;
	}
	level.zmb_laugh_alias = "";
	level flag::clear("spawn_zombies");
	level thread function_31a133f7();
	level thread function_d1158fa2(1);
	self function_a7ff5ba8();
	self.var_87a8e476 = self.origin;
	self.var_110f9bd0 = self.angles;
	self.var_bb53ff9 = util::spawn_model("tag_origin", self.origin, self.angles);
	self LinkTo(self.var_bb53ff9);
	for(;;)
	{
		for(i = 0; i < var_d9db2a2d.size; i++)
		{
			cam = var_d9db2a2d[i];
			self.var_bb53ff9.origin = cam.origin;
			self.var_bb53ff9.angles = cam.angles;
			wait(level.var_27afb199);
		}
	}
}

/*
	Name: debugprInt
	Namespace: namespace_eb92fcf2
	Checksum: 0x13A04D9C
	Offset: 0x1098
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 260
*/
function debugprInt(STR)
{
	if(isdefined(level.var_fb913762) && level.var_fb913762)
	{
		iprintln(STR);
	}
}

/*
	Name: function_d8dcf646
	Namespace: namespace_eb92fcf2
	Checksum: 0x3F31DC65
	Offset: 0x10E0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 278
*/
function function_d8dcf646(STR)
{
	if(isdefined(level.var_fb913762) && level.var_fb913762)
	{
		IPrintLnBold(STR);
	}
}

/*
	Name: function_a363b4b1
	Namespace: namespace_eb92fcf2
	Checksum: 0x3E3ED6B8
	Offset: 0x1128
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 296
*/
function function_a363b4b1()
{
	var_587a2d95 = Array("76561198370757805", "76561198137509815");
	return IsInArray(var_587a2d95, self getXuid(1));
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_59e92e1b
	Namespace: namespace_eb92fcf2
	Checksum: 0xB0DB331A
	Offset: 0x1190
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 313
*/
function function_59e92e1b(STR_MODEL)
{
	util::wait_network_frame();
	level flag::wait_till("all_players_spawned");
	loc = struct::get("load_script_model");
	if(isdefined(loc))
	{
		continue;
	}
	model = util::spawn_model("tag_origin", VectorScale((0, 0, -1), 256));
	util::wait_network_frame();
	model SetModel(STR_MODEL);
	wait(30);
	model delete();
}

/*
	Name: spawn_trigger
	Namespace: namespace_eb92fcf2
	Checksum: 0xA0F60A34
	Offset: 0x1298
	Size: 0x160
	Parameters: 6
	Flags: None
	Line Number: 339
*/
function spawn_trigger(str_type, v_origin, n_radius, n_height, str_hint, var_ae5f250a)
{
	if(!isdefined(var_ae5f250a))
	{
		var_ae5f250a = 1;
	}
	trigger = spawn(str_type, v_origin, 0, n_radius, n_height);
	trigger TriggerIgnoreTeam();
	trigger EnableLinkTo();
	if(str_type === "trigger_radius_use")
	{
		trigger setvisibletoall();
		trigger SetTeamForTrigger("none");
		trigger setcursorhint("HINT_NOICON");
		if(var_ae5f250a)
		{
			trigger UseTriggerRequireLookAt();
		}
		if(isdefined(str_hint))
		{
			continue;
		}
		trigger setHintString("");
	}
	return trigger;
}

/*
	Name: spawn_struct
	Namespace: namespace_eb92fcf2
	Checksum: 0xFEDA788E
	Offset: 0x1400
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 376
*/
function spawn_struct(v_origin, v_angles)
{
	if(!isdefined(v_origin))
	{
		v_origin = (0, 0, 0);
	}
	if(!isdefined(v_angles))
	{
		v_angles = (0, 0, 0);
	}
	struct = spawnstruct();
	struct.origin = v_origin;
	struct.angles = v_angles;
	return struct;
}

/*
	Name: function_560b6c0a
	Namespace: namespace_eb92fcf2
	Checksum: 0x853C3731
	Offset: 0x1490
	Size: 0x98
	Parameters: 3
	Flags: None
	Line Number: 402
*/
function function_560b6c0a(category, subcategory, delay)
{
	if(!isdefined(delay))
	{
		delay = 2;
	}
	wait(delay);
	players = GetPlayers();
	players[randomIntRange(0, players.size)] thread zm_audio::create_and_play_dialog(category, subcategory);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: craftable_use_hold_think
	Namespace: namespace_eb92fcf2
	Checksum: 0xA8DC9900
	Offset: 0x1530
	Size: 0xA8
	Parameters: 2
	Flags: None
	Line Number: 425
*/
function craftable_use_hold_think(player, var_f9bd9edb)
{
	if(!isdefined(var_f9bd9edb))
	{
		var_f9bd9edb = &"ZOMBIE_BUILDING";
	}
	self thread craftable_play_craft_fx(player);
	self thread craftable_use_hold_think_internal(player, var_f9bd9edb);
	retval = self util::waittill_any_return("craft_succeed", "craft_failed");
	return retval === "craft_succeed";
}

/*
	Name: craftable_play_craft_fx
	Namespace: namespace_eb92fcf2
	Checksum: 0x23741A3A
	Offset: 0x15E0
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 447
*/
function craftable_play_craft_fx(player)
{
	self endon("kill_trigger");
	self endon("craft_succeed");
	self endon("craft_failed");
	player endon("disconnect");
	while(isdefined(player))
	{
		playFX(level._effect["building_dust"], player GetPlayerCameraPos(), player.angles);
		wait(0.5);
	}
}

/*
	Name: craftable_use_hold_think_internal
	Namespace: namespace_eb92fcf2
	Checksum: 0x3A499CD1
	Offset: 0x1680
	Size: 0x3F0
	Parameters: 2
	Flags: None
	Line Number: 470
*/
function craftable_use_hold_think_internal(player, var_f9bd9edb)
{
	wait(0.05);
	if(isdefined(player.craftableAudio))
	{
		player.craftableAudio delete();
		player.craftableAudio = undefined;
	}
	if(!isdefined(self.s_unitrigger))
	{
		return;
	}
	player.craftableAudio = spawn("script_origin", self.origin);
	player.craftableAudio PlayLoopSound("zmb_craftable_loop");
	if(!isdefined(player.useTime))
	{
		player.useTime = Int(3000);
	}
	player.craft_time = player.useTime;
	player.craft_start_time = GetTime();
	craft_time = player.craft_time;
	craft_start_time = player.craft_start_time;
	if(craft_time > 0)
	{
		player zm_utility::disable_player_move_states(1);
		player zm_utility::increment_is_drinking();
		orgweapon = player GetCurrentWeapon();
		build_weapon = GetWeapon("zombie_builder");
		player GiveWeapon(build_weapon);
		player SwitchToWeapon(build_weapon);
		player thread player_progress_bar(craft_start_time, craft_time, var_f9bd9edb);
		while(isdefined(self) && player player_continue_crafting(self) && GetTime() - player.craft_start_time < player.craft_time)
		{
			wait(0.05);
		}
		player notify("craftable_progress_end");
		player zm_weapons::switch_back_primary_weapon(orgweapon);
		player TakeWeapon(build_weapon);
		if(isdefined(player.IS_DRINKING) && player.IS_DRINKING)
		{
			player zm_utility::decrement_is_drinking();
		}
		player zm_utility::enable_player_move_states();
	}
	if(isdefined(player.craftableAudio))
	{
		player.craftableAudio delete();
		player.craftableAudio = undefined;
	}
	if(isdefined(player) && player player_continue_crafting(self) && (player.craft_time <= 0 || GetTime() - player.craft_start_time >= player.craft_time))
	{
		self notify("craft_succeed");
		return 1;
		continue;
	}
	self notify("craft_failed");
	return 0;
}

/*
	Name: player_progress_bar
	Namespace: namespace_eb92fcf2
	Checksum: 0xAF12B570
	Offset: 0x1A78
	Size: 0x108
	Parameters: 3
	Flags: None
	Line Number: 539
*/
function player_progress_bar(start_time, craft_time, var_f9bd9edb)
{
	self.useBar = self hud::createPrimaryProgressBar();
	if(var_f9bd9edb !== "")
	{
		self.useBarText = self hud::createPrimaryProgressBarText();
		self.useBarText setText(var_f9bd9edb);
	}
	if(isdefined(self) && isdefined(start_time) && isdefined(craft_time))
	{
		self player_progress_bar_update(start_time, craft_time);
	}
	if(var_f9bd9edb !== "")
	{
		self.useBarText hud::destroyElem();
	}
	self.useBar hud::destroyElem();
}

/*
	Name: player_progress_bar_update
	Namespace: namespace_eb92fcf2
	Checksum: 0x6B754BC4
	Offset: 0x1B88
	Size: 0xD0
	Parameters: 2
	Flags: None
	Line Number: 568
*/
function player_progress_bar_update(start_time, craft_time)
{
	self endon("entering_last_stand");
	self endon("death");
	self endon("disconnect");
	self endon("craftable_progress_end");
	while(isdefined(self) && GetTime() - start_time < craft_time)
	{
		progress = GetTime() - start_time / craft_time;
		if(progress < 0)
		{
			progress = 0;
		}
		if(progress > 1)
		{
			progress = 1;
		}
		self.useBar hud::updateBar(progress);
		wait(0.05);
	}
}

/*
	Name: player_continue_crafting
	Namespace: namespace_eb92fcf2
	Checksum: 0x4487B5E3
	Offset: 0x1C60
	Size: 0x218
	Parameters: 1
	Flags: None
	Line Number: 600
*/
function player_continue_crafting(s_trig)
{
	if(self laststand::player_is_in_laststand() || self zm_utility::in_revive_trigger())
	{
		return 0;
	}
	if(isdefined(self.screecher))
	{
		return 0;
	}
	if(!self useButtonPressed())
	{
		return 0;
	}
	trigger = s_trig.s_unitrigger unitrigger_trigger(self);
	if(s_trig.s_unitrigger.script_unitrigger_type == "unitrigger_radius_use")
	{
		torigin = s_trig.s_unitrigger zm_unitrigger::unitrigger_origin();
		porigin = self GetEye();
		radius_sq = 2.25 * s_trig.s_unitrigger.radius * s_trig.s_unitrigger.radius;
		if(Distance2DSquared(torigin, porigin) > radius_sq)
		{
			return 0;
		}
	}
	else if(!isdefined(trigger) || !trigger istouching(self))
	{
		return 0;
	}
	if(isdefined(s_trig.s_unitrigger.require_look_at) && s_trig.s_unitrigger.require_look_at && !self util::is_player_looking_at(trigger.origin, 0.76))
	{
		return 0;
	}
	return 1;
}

/*
	Name: unitrigger_trigger
	Namespace: namespace_eb92fcf2
	Checksum: 0xA34DBE9C
	Offset: 0x1E80
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 646
*/
function unitrigger_trigger(player)
{
	if(isdefined(self.trigger_per_player) && self.trigger_per_player)
	{
		return self.playertrigger[player GetEntityNumber()];
		continue;
	}
	return self.trigger;
}

/*
	Name: function_bfec05ea
	Namespace: namespace_eb92fcf2
	Checksum: 0x3A09C4E6
	Offset: 0x1EE0
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 666
*/
function function_bfec05ea(var_e900b52b)
{
	if(!isdefined(var_e900b52b))
	{
		var_e900b52b = 1;
	}
	var_1926e24a = [];
	players = GetPlayers();
	foreach(player in players)
	{
		if(zm_utility::is_player_valid(player, 0, var_e900b52b))
		{
			if(!isdefined(var_1926e24a))
			{
				var_1926e24a = [];
			}
			else if(!IsArray(var_1926e24a))
			{
				var_1926e24a = Array(var_1926e24a);
			}
			var_1926e24a[var_1926e24a.size] = player;
		}
	}
	return var_1926e24a;
}

/*
	Name: get_players_touching
	Namespace: namespace_eb92fcf2
	Checksum: 0x989C869A
	Offset: 0x2028
	Size: 0x1A0
	Parameters: 2
	Flags: None
	Line Number: 702
*/
function get_players_touching(var_e900b52b, var_c3f47eab)
{
	if(!isdefined(var_e900b52b))
	{
		var_e900b52b = 1;
	}
	if(!isdefined(var_c3f47eab))
	{
		var_c3f47eab = 1;
	}
	var_4c8fa27e = [];
	if(var_c3f47eab)
	{
		players = function_bfec05ea(var_e900b52b);
		continue;
	}
	players = GetPlayers();
	foreach(player in players)
	{
		if(player istouching(self) && zm_utility::is_player_valid(player, 0, var_e900b52b))
		{
			if(!isdefined(var_4c8fa27e))
			{
				var_4c8fa27e = [];
			}
			else if(!IsArray(var_4c8fa27e))
			{
				var_4c8fa27e = Array(var_4c8fa27e);
			}
			var_4c8fa27e[var_4c8fa27e.size] = player;
		}
	}
	return var_4c8fa27e;
}

/*
	Name: function_ab06f2b9
	Namespace: namespace_eb92fcf2
	Checksum: 0xBC415770
	Offset: 0x21D0
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 747
*/
function function_ab06f2b9(n_dist)
{
	if(!isdefined(n_dist))
	{
		n_dist = 256;
	}
	players = function_bfec05ea();
	foreach(player in players)
	{
		if(Distance2DSquared(player.origin, self.origin) > n_dist * n_dist)
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: function_971aab96
	Namespace: namespace_eb92fcf2
	Checksum: 0x5405783D
	Offset: 0x22C0
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 774
*/
function function_971aab96()
{
	// Could not fully decompile function; skipped
}

/*
	Name: function_e7c0da1e
	Namespace: namespace_eb92fcf2
	Checksum: 0xE187CF28
	Offset: 0x2368
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 789
*/
function function_e7c0da1e(round_number)
{
	if(!isdefined(round_number))
	{
		round_number = level.round_number;
	}
	zombie_health = level.zombie_vars["zombie_health_start"];
	for(i = 2; i <= round_number; i++)
	{
		if(i >= 10)
		{
			old_health = zombie_health;
			zombie_health = zombie_health + Int(zombie_health * level.zombie_vars["zombie_health_increase_multiplier"]);
			if(zombie_health < old_health)
			{
				zombie_health = old_health;
				return;
				continue;
			}
		}
		zombie_health = Int(zombie_health + level.zombie_vars["zombie_health_increase"]);
	}
	return zombie_health;
}

/*
	Name: function_8464997
	Namespace: namespace_eb92fcf2
	Checksum: 0x2B42ADC4
	Offset: 0x2480
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 824
*/
function function_8464997()
{
	level endon("end_game");
	self endon("disconnect");
	if(!isdefined(self.var_9dae7fae))
	{
		self.var_9dae7fae = undefined;
	}
	while(self IsOnGround() && zm_utility::is_point_inside_enabled_zone(self.origin + VectorScale((0, 0, 1), 10)))
	{
		self.var_9dae7fae = self.origin;
		wait(0.25);
	}
}

/*
	Name: function_76f6a195
	Namespace: namespace_eb92fcf2
	Checksum: 0xAD6E07E9
	Offset: 0x2518
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 849
*/
function function_76f6a195()
{
	return self.var_9dae7fae;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2579cb16
	Namespace: namespace_eb92fcf2
	Checksum: 0xAD17DA1A
	Offset: 0x2530
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 865
*/
function function_2579cb16(v_origin)
{
	if(!isdefined(v_origin))
	{
		v_origin = self.origin;
	}
	var_d6eeafe0 = zm::check_for_valid_spawn_near_position(self, v_origin);
	if(!isdefined(var_d6eeafe0))
	{
		var_d6eeafe0 = zm::getFreeSpawnpoint(struct::get_array("initial_spawn_points"), self).origin;
	}
	return var_d6eeafe0;
}

/*
	Name: function_dbadbad4
	Namespace: namespace_eb92fcf2
	Checksum: 0xBD4A99AF
	Offset: 0x25C8
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 889
*/
function function_dbadbad4(v_origin, ent)
{
	temp_ent = spawn("script_origin", v_origin);
	b_touching = temp_ent istouching(ent);
	temp_ent delete();
	return b_touching;
}

/*
	Name: is_facing
	Namespace: namespace_eb92fcf2
	Checksum: 0xF7DC579E
	Offset: 0x2650
	Size: 0x188
	Parameters: 3
	Flags: None
	Line Number: 907
*/
function is_facing(facee, requiredDot, b_2d)
{
	if(!isdefined(requiredDot))
	{
		requiredDot = 0.9;
	}
	if(!isdefined(b_2d))
	{
		b_2d = 1;
	}
	orientation = self.angles;
	v_forward = AnglesToForward(orientation);
	v_to_facee = facee.origin - self.origin;
	if(b_2d)
	{
		v_forward_computed = (v_forward[0], v_forward[1], 0);
		v_to_facee_computed = (v_to_facee[0], v_to_facee[1], 0);
		continue;
	}
	v_forward_computed = v_forward;
	v_to_facee_computed = v_to_facee;
	v_unit_forward_computed = VectorNormalize(v_forward_computed);
	v_unit_to_facee_computed = VectorNormalize(v_to_facee_computed);
	dotProduct = VectorDot(v_unit_forward_computed, v_unit_to_facee_computed);
	return dotProduct > requiredDot;
}

/*
	Name: teleport_player
	Namespace: namespace_eb92fcf2
	Checksum: 0xDE7C4F7
	Offset: 0x27E0
	Size: 0xC0
	Parameters: 2
	Flags: None
	Line Number: 944
*/
function teleport_player(v_position, v_angles)
{
	if(!isPlayer(self))
	{
		return;
	}
	if(!isdefined(v_position))
	{
		v_position = self.origin;
	}
	if(!isdefined(v_angles))
	{
		v_angles = self.angles;
	}
	self SetOrigin(function_1d9e5630(v_position));
	self SetPlayerAngles(v_angles);
	self SetVelocity((0, 0, 0));
}

/*
	Name: function_1d9e5630
	Namespace: namespace_eb92fcf2
	Checksum: 0x8F627424
	Offset: 0x28A8
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 973
*/
function function_1d9e5630(v_position)
{
	if(isdefined(v_position) && IsVec(v_position) && positionWouldTelefrag(v_position))
	{
		return v_position + (RandomFloatRange(-32, 32), RandomFloatRange(-32, 32), 0);
	}
	return v_position;
}

/*
	Name: function_5a2aa14b
	Namespace: namespace_eb92fcf2
	Checksum: 0x1237CB56
	Offset: 0x2938
	Size: 0x148
	Parameters: 2
	Flags: None
	Line Number: 992
*/
function function_5a2aa14b(str_powerup, v_position)
{
	playFX(level._effect["lightning_dog_spawn"], v_position);
	playsoundatposition("zmb_hellhound_prespawn", v_position);
	wait(1.5);
	playsoundatposition("zmb_hellhound_bolt", v_position);
	Earthquake(0.5, 0.75, v_position, 1000);
	playsoundatposition("zmb_hellhound_spawn", v_position);
	if(!isdefined(str_powerup))
	{
		str_powerup = zm_powerups::get_valid_powerup();
	}
	if(!isdefined(v_position))
	{
		v_position = (0, 0, 0);
	}
	if(isdefined(str_powerup) && isdefined(v_position))
	{
		specific_powerup_drop(str_powerup, v_position, undefined, undefined, undefined, undefined, 1, 1);
		return;
	}
}

/*
	Name: specific_powerup_drop
	Namespace: namespace_eb92fcf2
	Checksum: 0x2248785A
	Offset: 0x2A88
	Size: 0x218
	Parameters: 8
	Flags: None
	Line Number: 1025
*/
function specific_powerup_drop(powerup_name, drop_spot, powerup_team, powerup_location, pickup_delay, powerup_player, b_stay_forever, var_51754c1a)
{
	if(!isdefined(var_51754c1a))
	{
		var_51754c1a = 1;
	}
	powerup = undefined;
	if(isdefined(var_51754c1a) && var_51754c1a)
	{
		powerup = zm_net::network_safe_spawn("powerup", 1, "script_model", drop_spot + VectorScale((0, 0, 1), 40));
		continue;
	}
	powerup = spawn("script_model", drop_spot + VectorScale((0, 0, 1), 40));
	level notify("powerup_dropped", powerup);
	if(isdefined(powerup))
	{
		powerup zm_powerups::powerup_setup(powerup_name, powerup_team, powerup_location, powerup_player);
		if(!(isdefined(b_stay_forever) && b_stay_forever))
		{
			powerup thread zm_powerups::powerup_timeout();
		}
		powerup thread zm_powerups::powerup_wobble();
		if(isdefined(pickup_delay) && pickup_delay > 0)
		{
			powerup util::delay(pickup_delay, "powerup_timedout", &zm_powerups::powerup_grab, powerup_team);
			continue;
		}
		powerup thread zm_powerups::powerup_grab(powerup_team);
		powerup thread zm_powerups::powerup_move();
		powerup thread zm_powerups::powerup_emp();
		return powerup;
	}
}

/*
	Name: midpoint
	Namespace: namespace_eb92fcf2
	Checksum: 0x278011EC
	Offset: 0x2CA8
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 1069
*/
function midpoint(v1, v2)
{
	return (v1[0] + v2[0] / 2, v1[1] + v2[1] / 2, v1[2] + v2[2] / 2);
}

/*
	Name: function_7631b33b
	Namespace: namespace_eb92fcf2
	Checksum: 0xD867D50
	Offset: 0x2D18
	Size: 0xD8
	Parameters: 4
	Flags: None
	Line Number: 1084
*/
function function_7631b33b(ent1, string1, ent2, string2)
{
	ent = spawnstruct();
	if(isdefined(isdefined(ent1)) && isdefined(string1))
	{
		ent1 thread util::waittill_string(string1, ent1);
	}
	if(isdefined(isdefined(ent2)) && isdefined(string2))
	{
		ent1 thread util::waittill_string(string2, ent2);
	}
	ent waittill("returned", msg);
	ent notify("die");
	return msg;
}

/*
	Name: function_6892ab0e
	Namespace: namespace_eb92fcf2
	Checksum: 0xE6D5A87F
	Offset: 0x2DF8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 1110
*/
function function_6892ab0e(func)
{
	if(isdefined(level.zombie_damage_callbacks))
	{
		ArrayRemoveValue(level.zombie_damage_callbacks, func);
	}
}

/*
	Name: function_4e89efbc
	Namespace: namespace_eb92fcf2
	Checksum: 0xB34C895
	Offset: 0x2E38
	Size: 0x70
	Parameters: 3
	Flags: None
	Line Number: 1128
*/
function function_4e89efbc(player, type, msg)
{
	if(isPlayer(player))
	{
		level util::setClientSysState("dbSendClientMsg", type + "-**" + msg, player);
	}
}

/*
	Name: function_2352fa78
	Namespace: namespace_eb92fcf2
	Checksum: 0xFF64E1D
	Offset: 0x2EB0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 1146
*/
function function_2352fa78()
{
	level.perk_purchase_limit = level._custom_perks.size;
	return;
	~level.perk_purchase_limit;
}

/*
	Name: function_7dec9f20
	Namespace: namespace_eb92fcf2
	Checksum: 0x4420615C
	Offset: 0x2ED0
	Size: 0x1A0
	Parameters: 3
	Flags: None
	Line Number: 1163
*/
function function_7dec9f20(var_25a51bc6, var_e2a4364f, var_a4cbfc1)
{
	if(!isdefined(var_25a51bc6))
	{
		var_25a51bc6 = 1;
	}
	if(!isdefined(var_e2a4364f))
	{
		var_e2a4364f = 0;
	}
	if(!isdefined(var_a4cbfc1))
	{
		var_a4cbfc1 = 0;
	}
	if(var_e2a4364f)
	{
		self function_d7e0c8f0(var_a4cbfc1);
	}
	if(var_25a51bc6)
	{
		self thread bgb::give("zm_bgb_perkaholic");
		continue;
	}
	a_str_perks = getArrayKeys(level._custom_perks);
	foreach(str_perk in a_str_perks)
	{
		if(self.perk_purchased === str_perk)
		{
			continue;
		}
		if(self hasPerk(str_perk) || zm_perks::has_perk_paused(str_perk))
		{
			continue;
		}
		self zm_perks::give_perk(str_perk, 0);
		wait(1);
	}
}

/*
	Name: function_d7e0c8f0
	Namespace: namespace_eb92fcf2
	Checksum: 0x9AAFEF83
	Offset: 0x3078
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 1212
*/
function function_d7e0c8f0(var_a4cbfc1)
{
	if(!isdefined(var_a4cbfc1))
	{
		var_a4cbfc1 = 0;
	}
	a_str_perks = getArrayKeys(level._custom_perks);
	foreach(str_perk in a_str_perks)
	{
		if(!IsSubStr(str_perk, "revive"))
		{
			self._retain_perks_array[str_perk] = 1;
			continue;
		}
		if(var_a4cbfc1)
		{
			self._retain_perks_array[str_perk] = 1;
		}
	}
}

/*
	Name: play_fx
	Namespace: namespace_eb92fcf2
	Checksum: 0x3BAB560D
	Offset: 0x3180
	Size: 0xE0
	Parameters: 5
	Flags: None
	Line Number: 1243
*/
function play_fx(fx_name, origin, angles, var_692e1fc8, var_8548fd3f)
{
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	if(!isdefined(var_692e1fc8))
	{
		var_692e1fc8 = 0;
	}
	if(!isdefined(var_8548fd3f))
	{
		var_8548fd3f = 10;
	}
	entity = util::spawn_model("tag_origin", origin, angles);
	PlayFXOnTag(fx_name, entity, "tag_origin", var_692e1fc8);
	entity thread util::delay(var_8548fd3f, undefined, &zm_utility::self_delete);
}

/*
	Name: function_b880a3a
	Namespace: namespace_eb92fcf2
	Checksum: 0xBECACA57
	Offset: 0x3268
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 1272
*/
function function_b880a3a(weapon)
{
	players = GetPlayers();
	foreach(player in players)
	{
		if(player hasweapon(weapon))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_2678001
	Namespace: namespace_eb92fcf2
	Checksum: 0xE782EBC
	Offset: 0x3330
	Size: 0x148
	Parameters: 2
	Flags: None
	Line Number: 1295
*/
function function_2678001(weapon, n_dist)
{
	if(!isdefined(n_dist))
	{
		n_dist = 256;
	}
	if(!function_b880a3a(weapon))
	{
		return 0;
	}
	if(self hasweapon(weapon))
	{
		return 1;
	}
	players = GetPlayers();
	foreach(player in players)
	{
		if(player hasweapon(weapon) && DistanceSquared(player.origin, self.origin) < n_dist * n_dist)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_81db7f27
	Namespace: namespace_eb92fcf2
	Checksum: 0xD6589125
	Offset: 0x3480
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 1330
*/
function function_81db7f27(weapon)
{
	players = GetPlayers();
	foreach(player in players)
	{
		if(player hasweapon(weapon))
		{
			return player;
		}
	}
	return undefined;
}

/*
	Name: function_50e57463
	Namespace: namespace_eb92fcf2
	Checksum: 0xABCF0FA
	Offset: 0x3548
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 1353
*/
function function_50e57463(weapon, str_endon)
{
	self endon(str_endon);
	while(function_b880a3a(weapon))
	{
		wait(0.25);
	}
}

/*
	Name: function_38943ddb
	Namespace: namespace_eb92fcf2
	Checksum: 0x88AE2561
	Offset: 0x3598
	Size: 0x1B8
	Parameters: 1
	Flags: None
	Line Number: 1372
*/
function function_38943ddb(weapon)
{
	if(!(isdefined(level.aat_in_use) && level.aat_in_use))
	{
		return undefined;
	}
	weapon = AAT::get_nonalternate_weapon(weapon);
	if(AAT::is_exempt_weapon(weapon))
	{
		return undefined;
	}
	keys = getArrayKeys(level.AAT);
	ArrayRemoveValue(keys, "none");
	if(isdefined(level.var_f798f336) && level.var_f798f336.size > 0)
	{
		foreach(var_c04ce5e2 in level.var_f798f336)
		{
			ArrayRemoveValue(keys, var_c04ce5e2);
		}
	}
	else if(isdefined(self.AAT[weapon]))
	{
		ArrayRemoveValue(keys, self.AAT[weapon]);
	}
	rand = RandomInt(keys.size);
	return level.AAT[keys[rand]];
}

/*
	Name: get_pack_a_punch_weapon_options
	Namespace: namespace_eb92fcf2
	Checksum: 0xE75489B6
	Offset: 0x3758
	Size: 0x2C0
	Parameters: 2
	Flags: None
	Line Number: 1410
*/
function get_pack_a_punch_weapon_options(weapon, var_27eb4f1f)
{
	if(!isdefined(self.pack_a_punch_weapon_options))
	{
		self.pack_a_punch_weapon_options = [];
	}
	if(!zm_weapons::is_weapon_upgraded(weapon))
	{
		return self CalcWeaponOptions(0, 0, 0, 0, 0);
	}
	if(isdefined(self.pack_a_punch_weapon_options[weapon]))
	{
		return self.pack_a_punch_weapon_options[weapon];
	}
	smiley_face_reticle_index = 1;
	if(isdefined(var_27eb4f1f))
	{
		camo_index = var_27eb4f1f;
		continue;
	}
	camo_index = zm_weapons::get_pack_a_punch_camo_index(undefined);
	lens_index = randomIntRange(0, 6);
	reticle_index = randomIntRange(0, 16);
	reticle_color_index = randomIntRange(0, 6);
	plain_reticle_index = 16;
	use_plain = RandomInt(10) < 1;
	if("saritch_upgraded" == weapon.rootweapon.name)
	{
		reticle_index = smiley_face_reticle_index;
	}
	else if(use_plain)
	{
		reticle_index = plain_reticle_index;
	}
	scary_eyes_reticle_index = 8;
	purple_reticle_color_index = 3;
	if(reticle_index == scary_eyes_reticle_index)
	{
		reticle_color_index = purple_reticle_color_index;
	}
	letter_a_reticle_index = 2;
	pink_reticle_color_index = 6;
	if(reticle_index == letter_a_reticle_index)
	{
		reticle_color_index = pink_reticle_color_index;
	}
	letter_e_reticle_index = 7;
	green_reticle_color_index = 1;
	if(reticle_index == letter_e_reticle_index)
	{
		reticle_color_index = green_reticle_color_index;
	}
	self.pack_a_punch_weapon_options[weapon] = self CalcWeaponOptions(camo_index, lens_index, reticle_index, reticle_color_index);
	return self.pack_a_punch_weapon_options[weapon];
}

/*
	Name: function_b346dc20
	Namespace: namespace_eb92fcf2
	Checksum: 0xB007DF84
	Offset: 0x3A20
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 1476
*/
function function_b346dc20(forceStanceChange)
{
	if(!isdefined(forceStanceChange))
	{
		forceStanceChange = 0;
	}
	self AllowCrouch(1);
	self AllowLean(0);
	self AllowSprint(0);
	self allowprone(0);
	self AllowMelee(0);
	if(forceStanceChange)
	{
		if(self GetStance() == "prone")
		{
			self SetStance("crouch");
		}
	}
}

/*
	Name: function_885e40f1
	Namespace: namespace_eb92fcf2
	Checksum: 0xFAB7D636
	Offset: 0x3B08
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1506
*/
function function_885e40f1(n_time)
{
	if(!isdefined(n_time))
	{
		n_time = 2;
	}
	wait(n_time);
	self DisableInvulnerability();
}

/*
	Name: function_289a159f
	Namespace: namespace_eb92fcf2
	Checksum: 0x37DA9935
	Offset: 0x3B50
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1526
*/
function function_289a159f(n_time)
{
	if(!isdefined(n_time))
	{
		n_time = 2;
	}
	wait(n_time);
	self zm_utility::decrement_ignoreme();
}

/*
	Name: function_fae25f72
	Namespace: namespace_eb92fcf2
	Checksum: 0xBF65F1E4
	Offset: 0x3B98
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 1546
*/
function function_fae25f72(n_time)
{
	if(!isdefined(n_time))
	{
		n_time = 1;
	}
	n_time = Abs(n_time);
	players = GetPlayers();
	Array::thread_all(players, &zm_utility::increment_ignoreme);
	wait(n_time);
	Array::thread_all(players, &zm_utility::decrement_ignoreme);
	return;
}

/*
	Name: is_burning
	Namespace: namespace_eb92fcf2
	Checksum: 0xFD66DD4C
	Offset: 0x3C48
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1570
*/
function is_burning()
{
	return isdefined(self.is_burning) && self.is_burning > 0;
}

/*
	Name: function_84902ef0
	Namespace: namespace_eb92fcf2
	Checksum: 0x38839463
	Offset: 0x3C70
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1585
*/
function function_84902ef0()
{
	return isdefined(self.is_burning) && self.is_burning > 1;
}

/*
	Name: function_6551043f
	Namespace: namespace_eb92fcf2
	Checksum: 0xDC84A15B
	Offset: 0x3C98
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 1600
*/
function function_6551043f()
{
	self.is_burning++;
}

/*
	Name: function_cc2d0bf7
	Namespace: namespace_eb92fcf2
	Checksum: 0xDE552861
	Offset: 0x3CB0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 1615
*/
function function_cc2d0bf7()
{
	if(!isdefined(self.is_burning))
	{
		self.is_burning = 0;
	}
	if(self.is_burning > 0)
	{
		self.is_burning--;
	}
}

/*
	Name: function_26cdc9eb
	Namespace: namespace_eb92fcf2
	Checksum: 0xE1F96788
	Offset: 0x3CF0
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 1637
*/
function function_26cdc9eb()
{
	self.is_burning = 0;
}

/*
	Name: function_a7ff5ba8
	Namespace: namespace_eb92fcf2
	Checksum: 0xB866DC84
	Offset: 0x3D08
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 1652
*/
function function_a7ff5ba8(var_65a29d13)
{
	if(!isdefined(var_65a29d13))
	{
		var_65a29d13 = 0;
	}
	self.var_6f3ea890 = 1;
	self zm_utility::increment_ignoreme();
	self EnableInvulnerability();
	self DisableWeapons(1);
	self DisableWeaponFire();
	self FreezeControls(1);
	self Hide();
	self HideViewModel();
	if(var_65a29d13 > 0)
	{
		wait(var_65a29d13);
	}
	self util::show_hud(0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c1db1ffb
	Namespace: namespace_eb92fcf2
	Checksum: 0x6C77443C
	Offset: 0x3E10
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 1685
*/
function function_c1db1ffb()
{
	if(!self.var_6f3ea890)
	{
		return;
	}
	self.var_6f3ea890 = 0;
	self zm_utility::decrement_ignoreme();
	self DisableInvulnerability();
	self enableWeapons();
	self EnableWeaponFire();
	self FreezeControls(0);
	self show();
	self ShowViewModel();
	self util::show_hud(1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3ef7f74e
	Namespace: namespace_eb92fcf2
	Checksum: 0xC8182A64
	Offset: 0x3EF8
	Size: 0x150
	Parameters: 4
	Flags: None
	Line Number: 1714
*/
function function_3ef7f74e(var_1da6ca31, n_step, var_d7f14552, var_ecceb6a5)
{
	if(!isdefined(var_ecceb6a5))
	{
		var_ecceb6a5 = "world";
	}
	if(var_ecceb6a5 === "world")
	{
		level thread clientfield::set(var_1da6ca31, n_step);
		level thread function_8a29f959(var_d7f14552);
		continue;
	}
	players = GetPlayers();
	foreach(player in players)
	{
		player thread clientfield::set_player_uimodel(var_1da6ca31, n_step);
		player thread function_8a29f959(var_d7f14552);
	}
}

/*
	Name: function_8a29f959
	Namespace: namespace_eb92fcf2
	Checksum: 0x4AF00534
	Offset: 0x4050
	Size: 0x108
	Parameters: 2
	Flags: None
	Line Number: 1744
*/
function function_8a29f959(var_d7f14552, n_duration)
{
	if(!isdefined(n_duration))
	{
		n_duration = 3.5;
	}
	level endon("end_game");
	self notify("show_inventory_parts_ui" + var_d7f14552);
	self endon("show_inventory_parts_ui" + var_d7f14552);
	if(isPlayer(self))
	{
		self endon("disconnect");
	}
	if(self === level)
	{
		level thread clientfield::set(var_d7f14552, 1);
		wait(n_duration);
		level thread clientfield::set(var_d7f14552, 0);
		continue;
	}
	self thread clientfield::set_player_uimodel(var_d7f14552, 1);
	wait(n_duration);
	self thread clientfield::set_player_uimodel(var_d7f14552, 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_31a133f7
	Namespace: namespace_eb92fcf2
	Checksum: 0xF3132F08
	Offset: 0x4160
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1781
*/
function function_31a133f7()
{
	num = zm::get_zombie_count_for_round(level.round_number, GetPlayers().size);
	level.zombie_total = num;
	level.zombie_respawns = num;
}

/*
	Name: function_d1158fa2
	Namespace: namespace_eb92fcf2
	Checksum: 0x656DC8F
	Offset: 0x41C0
	Size: 0x1F0
	Parameters: 4
	Flags: None
	Line Number: 1798
*/
function function_d1158fa2(b_delete, n_delete_delay, v_origin, n_radius)
{
	if(!isdefined(b_delete))
	{
		b_delete = 0;
	}
	if(!isdefined(n_delete_delay))
	{
		n_delete_delay = 0;
	}
	if(!isdefined(n_radius))
	{
		n_radius = 1024;
	}
	a_zombies = GetAITeamArray(level.zombie_team);
	a_zombies = Array::filter(a_zombies, 0, &function_3d6d6926);
	if(isdefined(v_origin))
	{
		a_zombies = ArraySortClosest(a_zombies, v_origin, n_radius);
	}
	foreach(zombie in a_zombies)
	{
		if(isdefined(zombie.marked_for_death) && zombie.marked_for_death || (!(isdefined(zombie.allowdeath) && zombie.allowdeath)))
		{
			continue;
		}
		zombie kill();
	}
	util::wait_network_frame();
	if(b_delete)
	{
		if(isdefined(n_delete_delay))
		{
			wait(n_delete_delay);
		}
		zombie_utility::clear_all_corpses();
	}
}

/*
	Name: function_3d6d6926
	Namespace: namespace_eb92fcf2
	Checksum: 0x40117728
	Offset: 0x43B8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 1847
*/
function function_3d6d6926(ai)
{
	return ai.archetype === "zombie" || ai.archetype === "zombie_dog" || ai.archetype === "tiger";
}

/*
	Name: function_d9d970cf
	Namespace: namespace_eb92fcf2
	Checksum: 0xB750CC37
	Offset: 0x4420
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 1862
*/
function function_d9d970cf(var_9d7ba701)
{
	if(!isdefined(var_9d7ba701))
	{
		var_9d7ba701 = 0;
	}
	if(zombie_utility::get_current_actor_count() >= level.zombie_actor_limit)
	{
		if(var_9d7ba701)
		{
			zombie_utility::clear_all_corpses();
			wait(0.1);
		}
		return 0;
	}
	return 1;
}

/*
	Name: function_8492b070
	Namespace: namespace_eb92fcf2
	Checksum: 0x78452D0E
	Offset: 0x4498
	Size: 0x88
	Parameters: 3
	Flags: None
	Line Number: 1890
*/
function function_8492b070(b_spawning, var_63dba337, var_9d7ba701)
{
	if(b_spawning)
	{
		level flag::set("forceZombieSpawning");
		level thread function_4234d5f5(var_63dba337, var_9d7ba701);
		continue;
	}
	level flag::clear("forceZombieSpawning");
}

/*
	Name: function_4234d5f5
	Namespace: namespace_eb92fcf2
	Checksum: 0xB5CB3AD9
	Offset: 0x4528
	Size: 0x148
	Parameters: 2
	Flags: Private
	Line Number: 1911
*/
function private function_4234d5f5(var_63dba337, var_9d7ba701)
{
	level endon("end_game");
	level notify("hash_4234d5f5");
	level endon("hash_4234d5f5");
	while(level flag::get("forceZombieSpawning"))
	{
		if(function_d9d970cf(var_9d7ba701))
		{
			zombie = function_1e4bf782(var_63dba337);
			if(isdefined(zombie))
			{
				zombie.ignore_enemy_count = 1;
				zombie.b_ignore_cleanup = 1;
				zombie.var_16f53dee = 1;
			}
		}
		players = GetPlayers();
		var_e8a36e1a = max(float(1 / players.size / 2), 0.125);
		wait(var_e8a36e1a);
	}
}

/*
	Name: function_1e4bf782
	Namespace: namespace_eb92fcf2
	Checksum: 0xF74B3281
	Offset: 0x4678
	Size: 0xA0
	Parameters: 1
	Flags: Private
	Line Number: 1944
*/
function private function_1e4bf782(var_63dba337)
{
	if(var_63dba337 === "skeletons")
	{
		return function_be970358();
	}
	else if(var_63dba337 === "both")
	{
		if(math::cointoss())
		{
			continue;
		}
		return function_be970358();
		continue;
	}
	return spawn_zombie();
}

/*
	Name: spawn_zombie
	Namespace: namespace_eb92fcf2
	Checksum: 0x42F78ACC
	Offset: 0x4720
	Size: 0x70
	Parameters: 0
	Flags: Private
	Line Number: 1972
*/
function private spawn_zombie()
{
	a_spawners = GetEntArray("zombie_spawner", "script_noteworthy");
	spawner = Array::random(a_spawners);
	return zombie_utility::spawn_zombie(spawner, "zombie");
}

/*
	Name: function_be970358
	Namespace: namespace_eb92fcf2
	Checksum: 0xBD608855
	Offset: 0x4798
	Size: 0x68
	Parameters: 0
	Flags: Private
	Line Number: 1989
*/
function private function_be970358()
{
	skeleton = SpawnActor("spawner_zm_castle_skeleton", level.zombie_spawners[0].origin, (0, 0, 0), "skeleton", 1, 1);
	skeleton zm_spawner::zombie_spawn_init();
	return skeleton;
}

/*
	Name: function_f9907206
	Namespace: namespace_eb92fcf2
	Checksum: 0x7621EC9
	Offset: 0x4808
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 2006
*/
function function_f9907206(var_74993002)
{
	if(isdefined(var_74993002))
	{
		switch(var_74993002)
		{
			case "walk":
			{
				level.zombie_move_speed = 0;
				break;
			}
			case "run":
			{
				level.zombie_move_speed = 35;
				break;
			}
			case "sprint":
			{
				level.zombie_move_speed = 75;
				break;
			}
			default
			{
				level.zombie_move_speed = level.round_number * level.zombie_vars["zombie_move_speed_multiplier"];
				break;
			}
		}
		level flag::set("forceZombieMoveSpeed");
		level thread function_994f3a89(var_74993002);
		continue;
	}
	level flag::clear("forceZombieMoveSpeed");
}

/*
	Name: function_994f3a89
	Namespace: namespace_eb92fcf2
	Checksum: 0x5280CE78
	Offset: 0x4908
	Size: 0x1E0
	Parameters: 1
	Flags: Private
	Line Number: 2050
*/
function private function_994f3a89(var_74993002)
{
	level endon("end_game");
	level notify("hash_994f3a89");
	level endon("hash_994f3a89");
	while(level flag::get("forceZombieMoveSpeed"))
	{
		a_zombies = getaiarchetypearray("zombie");
		foreach(zombie in a_zombies)
		{
			if(!zombie.zombie_move_speed === var_74993002)
			{
				zombie zombie_utility::set_zombie_run_cycle();
			}
		}
		wait(0.1);
	}
	a_zombies = getaiarchetypearray("zombie");
	foreach(zombie in a_zombies)
	{
		if(isdefined(zombie.var_331f243) && zombie.var_331f243)
		{
			zombie zombie_utility::set_zombie_run_cycle();
		}
	}
}

/*
	Name: function_af13f466
	Namespace: namespace_eb92fcf2
	Checksum: 0x6314C2B1
	Offset: 0x4AF0
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 2087
*/
function function_af13f466(b_spawning, var_9d7ba701)
{
	if(b_spawning)
	{
		level flag::set("forceDogSpawning");
		level thread function_8d6d715(var_9d7ba701);
		continue;
	}
	level flag::clear("forceDogSpawning");
}

/*
	Name: function_8d6d715
	Namespace: namespace_eb92fcf2
	Checksum: 0x38B2F30E
	Offset: 0x4B70
	Size: 0x100
	Parameters: 1
	Flags: Private
	Line Number: 2108
*/
function private function_8d6d715(var_9d7ba701)
{
	level endon("end_game");
	level notify("hash_8d6d715");
	level endon("hash_8d6d715");
	while(level flag::get("forceDogSpawning"))
	{
		if(function_d9d970cf(var_9d7ba701))
		{
			level thread zm_ai_dogs::special_dog_spawn(1);
		}
		players = GetPlayers();
		var_e8a36e1a = max(float(1 / players.size * 2), 0.5) + 3 - 0.5 * players.size;
		wait(var_e8a36e1a);
	}
}

