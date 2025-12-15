#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_ac9a276e;

/*
	Name: __init__sytem__
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x7A8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 48
*/
function autoexec __init__sytem__()
{
	system::register("REPAIRMAN", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x7E8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function __init__()
{
	function_1a92256e();
}

/*
	Name: function_1a92256e
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x808
	Size: 0x248
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_repairman", "repairman", 2000, &"ZM_REAP_MOD_PERK_REPAIRMAN", GetWeapon("zombie_perk_bottle_repairman"));
	zm_perks::register_perk_precache_func("specialty_repairman", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_repairman", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_repairman", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_repairman", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_repairman", "Repairman Rum", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_repairman", &"ZM_REAP_MOD_PERK_REPAIRMAN_DB", 1500, "Repairman Rum", "repairman");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_repairman"] = 1;
	level.exterior_goals = struct::get_array("exterior_goal", "targetname");
	Array::thread_all(level.exterior_goals, &blocker_init);
	callback::on_spawned(&on_player_spawned);
	level thread function_b0115929();
	spawner::add_global_spawn_function("axis", &function_25c713f0);
	return;
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0xA58
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 110
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_repairman"] = spawnstruct();
	level.machine_assets["specialty_repairman"].weapon = GetWeapon("zombie_perk_bottle_repairman");
	level.machine_assets["specialty_repairman"].off_model = "p7_zm_vending_repairman";
	level.machine_assets["specialty_repairman"].on_model = "p7_zm_vending_repairman_on";
}

/*
	Name: function_19157aff
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0xB00
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 128
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0xB10
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 142
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_repairman", "repairman", "SetIconActive", state);
	level notify("hash_481042ec");
}

/*
	Name: function_edb3a90b
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0xB68
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 158
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_repairman_jingle";
	use_trigger.script_string = "specialty_repairman";
	use_trigger.script_label = "mus_perks_repairman_sting";
	use_trigger.target = "Repairman Rum";
	perk_machine.script_string = "specialty_repairman";
	perk_machine.targetname = "Repairman Rum";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_repairman";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0xC30
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 182
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_repairman"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_repairman"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0xCB8
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 210
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_repairman"] = 0;
	self.var_b5c2c258["specialty_repairman"] = undefined;
	self.var_d6aef449["specialty_repairman"] = undefined;
}

/*
	Name: function_b0115929
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0xD18
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 227
*/
function function_b0115929()
{
	wait(1);
	if(!isdefined(level.perk_damage_override))
	{
		level.perk_damage_override = [];
	}
	Array::add(level.perk_damage_override, &function_2121c77, 0);
}

/*
	Name: on_player_spawned
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0xD70
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 247
*/
function on_player_spawned()
{
	self thread function_a6566b3a();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a6566b3a
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0xD98
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 264
*/
function function_a6566b3a()
{
	self endon("disconnect");
	self notify("hash_a6566b3a");
	self endon("hash_a6566b3a");
	while(1)
	{
		self waittill("boarding_window", var_c62a5d83);
		if(self namespace_851dc78f::function_5f9a13b3("specialty_repairman"))
		{
			self thread function_8eb5196d(var_c62a5d83);
		}
	}
}

/*
	Name: function_8eb5196d
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0xE20
	Size: 0x388
	Parameters: 1
	Flags: None
	Line Number: 289
*/
function function_8eb5196d(var_c62a5d83)
{
	carp_ent = spawn("script_origin", (0, 0, 0));
	carp_ent PlayLoopSound("evt_carpenter");
	for(num_chunks_checked = 0; num_chunks_checked < 20; num_chunks_checked++)
	{
		if(zm_utility::all_chunks_intact(var_c62a5d83, var_c62a5d83.barrier_chunks))
		{
			break;
		}
		chunk = zm_utility::get_random_destroyed_chunk(var_c62a5d83, var_c62a5d83.barrier_chunks);
		if(!isdefined(chunk))
		{
			break;
		}
		if(self namespace_851dc78f::function_b690a849("specialty_repairman"))
		{
			self handle_post_board_repair_rewards(40, self, 4);
		}
		else
		{
			self handle_post_board_repair_rewards(20, self, 2);
		}
		var_c62a5d83 thread replace_chunk(var_c62a5d83, chunk, undefined, self namespace_851dc78f::function_b690a849("specialty_repairman"), self);
		last_repaired_chunk = chunk;
		if(!isdefined(var_c62a5d83.explosives))
		{
			var_c62a5d83.explosives = 0;
		}
		var_c62a5d83.var_add4dbae = self;
		var_c62a5d83.explosives++;
		if(isdefined(var_c62a5d83.clip))
		{
			var_c62a5d83.clip TriggerEnable(1);
			var_c62a5d83.clip disconnectpaths();
		}
		else
		{
			zm_blockers::blocker_disconnect_paths(var_c62a5d83.neg_start, var_c62a5d83.neg_end);
		}
		util::wait_network_frame();
	}
	if(isdefined(var_c62a5d83.zbarrier) && isdefined(last_repaired_chunk))
	{
		while(var_c62a5d83.zbarrier GetZBarrierPieceState(last_repaired_chunk) == "closing")
		{
			wait(0.05);
		}
		if(isdefined(var_c62a5d83._post_carpenter_callback))
		{
			var_c62a5d83 [[var_c62a5d83._post_carpenter_callback]]();
		}
	}
	else if(isdefined(last_repaired_chunk))
	{
		while(last_repaired_chunk.state == "mid_repair")
		{
			wait(0.05);
		}
	}
	carp_ent StopLoopSound(1);
	carp_ent playsoundwithnotify("evt_carpenter_end", "sound_done");
	carp_ent waittill("sound_done");
	carp_ent delete();
}

/*
	Name: blocker_init
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x11B0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 365
*/
function blocker_init()
{
	level waittill("hash_481042ec");
	level._custom_powerups["carpenter"].grab_powerup = &grab_carpenter;
	level.use_new_carpenter_func = &start_carpenter_new;
	level notify("stop_blocker_think");
	wait(0.1);
	self thread blocker_think();
}

/*
	Name: blocker_think
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x1238
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 385
*/
function blocker_think()
{
	level endon("stop_blocker_think");
	if(!isdefined(level._blocker_choke))
	{
		level thread zm_blockers::blocker_choke();
	}
	use_choke = 0;
	if(isdefined(level._use_choke_blockers) && level._use_choke_blockers == 1)
	{
		use_choke = 1;
	}
	while(1)
	{
		wait(0.5);
		if(use_choke)
		{
			if(level._blocker_choke > 3)
			{
				wait(0.05);
			}
		}
		level._blocker_choke++;
		if(zm_utility::all_chunks_intact(self, self.barrier_chunks))
		{
			continue;
		}
		if(zm_utility::no_valid_repairable_boards(self, self.barrier_chunks))
		{
			continue;
		}
		self blocker_trigger_think();
	}
}

/*
	Name: blocker_trigger_think
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x1340
	Size: 0x9C8
	Parameters: 0
	Flags: None
	Line Number: 430
*/
function blocker_trigger_think()
{
	self endon("blocker_hacked");
	if(isdefined(level.no_board_repair) && level.no_board_repair)
	{
		return;
	}
	level endon("stop_blocker_think");
	if(isdefined(self.zombie_cost))
	{
		cost = self.zombie_cost;
	}
	else
	{
		cost = 10;
	}
	original_cost = cost;
	if(!isdefined(self.unitrigger_stub))
	{
		if(isdefined(self.trigger_location))
		{
			trigger_location = self.trigger_location;
			if(isdefined(trigger_location.radius))
			{
				radius = trigger_location.radius;
			}
			else
			{
				radius = 94.21;
			}
			if(isdefined(trigger_location.height))
			{
				height = trigger_location.height;
			}
			else
			{
				height = 94.21;
			}
		}
		else
		{
			trigger_location = self;
			radius = 94.21;
			height = 94.21;
		}
		trigger_pos = zm_utility::GROUNDPOS(trigger_location.origin) + VectorScale((0, 0, 1), 4);
		self.unitrigger_stub = spawnstruct();
		self.unitrigger_stub.origin = trigger_pos;
		self.unitrigger_stub.radius = radius;
		self.unitrigger_stub.height = height;
		self.unitrigger_stub.script_unitrigger_type = "unitrigger_radius";
		self.unitrigger_stub.hint_string = zm_utility::get_hint_string(self, "default_reward_barrier_piece");
		self.unitrigger_stub.cursor_hint = "HINT_NOICON";
		self.unitrigger_stub.trigger_target = self;
		self.unitrigger_stub.prompt_and_visibility_func = &zm_blockers::blockertrigger_update_prompt;
		zm_unitrigger::unitrigger_force_per_player_triggers(self.unitrigger_stub, 1);
		zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &zm_blockers::blocker_unitrigger_think);
		zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
		if(!isdefined(trigger_location.angles))
		{
			trigger_location.angles = (0, 0, 0);
		}
		self.unitrigger_stub.origin = zm_utility::GROUNDPOS(trigger_location.origin) + VectorScale((0, 0, 1), 4) + AnglesToForward(trigger_location.angles) * -11;
	}
	self thread zm_blockers::trigger_delete_on_repair();
	thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &zm_blockers::blocker_unitrigger_think);
	while(1)
	{
		self waittill("trigger", player);
		if(!zm_utility::is_player_valid(player))
		{
			continue;
		}
		if(zm_utility::all_chunks_intact(self, self.barrier_chunks) || zm_utility::no_valid_repairable_boards(self, self.barrier_chunks))
		{
			self notify("all_boards_repaired");
			return;
		}
		if(isdefined(level._zm_blocker_trigger_think_return_override) && self [[level._zm_blocker_trigger_think_return_override]](player))
		{
			return;
		}
		players = GetPlayers();
		trigger = self.unitrigger_stub zm_unitrigger::unitrigger_trigger(player);
		if(zm_blockers::player_fails_blocker_repair_trigger_preamble(player, players, trigger, 0))
		{
			continue;
		}
		player notify("boarding_window", self);
		chunk = zm_utility::get_random_destroyed_chunk(self, self.barrier_chunks);
		if(!isdefined(chunk))
		{
			continue;
		}
		if(isdefined(self.zbarrier))
		{
			self thread replace_chunk(self, chunk, player namespace_851dc78f::has_perk("specialty_repairman"), 0, player);
		}
		else if(isdefined(chunk.script_parameter) && (chunk.script_parameters == "repair_board" || chunk.script_parameters == "barricade_vents"))
		{
			if(isdefined(chunk.unbroken_section))
			{
				chunk show();
				chunk solid();
				chunk.unbroken_section zm_utility::self_delete();
			}
		}
		else
		{
			chunk show();
		}
		if(!isdefined(chunk.script_parameters) || chunk.script_parameters == "board" || chunk.script_parameters == "repair_board" || chunk.script_parameters == "barricade_vents")
		{
			if(!isdefined(level.use_clientside_board_fx) || !level.use_clientside_board_fx)
			{
				if(!isdefined(chunk.material) || chunk.material != "rock")
				{
					chunk zm_utility::play_sound_on_ent("rebuild_barrier_piece");
					playsoundatposition("zmb_cha_ching", (0, 0, 0));
				}
			}
		}
		if(chunk.script_parameters == "bar")
		{
			chunk zm_utility::play_sound_on_ent("rebuild_barrier_piece");
			playsoundatposition("zmb_cha_ching", (0, 0, 0));
			if(isdefined(chunk.script_noteworthy) && (chunk.script_noteworthy == "3" || chunk.script_noteworthy == "5"))
			{
				chunk Hide();
			}
		}
		self thread replace_chunk(self, chunk, player namespace_851dc78f::has_perk("specialty_repairman"), 0, player);
		if(isdefined(self.clip))
		{
			self.clip TriggerEnable(1);
			self.clip disconnectpaths();
		}
		else
		{
			zm_blockers::blocker_disconnect_paths(self.neg_start, self.neg_end);
		}
		self zm_blockers::do_post_chunk_repair_delay(player zm_blockers::has_blocker_affecting_perk());
		if(self namespace_851dc78f::function_b690a849("specialty_repairman"))
		{
			self handle_post_board_repair_rewards(40, self, 4);
		}
		else if(player namespace_851dc78f::function_5f9a13b3("specialty_repairman"))
		{
			player handle_post_board_repair_rewards(cost * 2, self, 2);
		}
		else
		{
			player handle_post_board_repair_rewards(cost, self, 1);
		}
		if(zm_utility::all_chunks_intact(self, self.barrier_chunks))
		{
			self notify("all_boards_repaired");
			player zm_blockers::increment_window_repaired();
			return;
		}
		if(zm_utility::no_valid_repairable_boards(self, self.barrier_chunks))
		{
			self notify("no_valid_boards");
			player zm_blockers::increment_window_repaired(self);
			return;
		}
	}
	return;
}

/*
	Name: replace_chunk
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x1D10
	Size: 0x328
	Parameters: 6
	Flags: None
	Line Number: 610
*/
function replace_chunk(barrier, chunk, perk, upgrade, via_powerup, player)
{
	if(!isdefined(barrier.zbarrier))
	{
		chunk zm_blockers::update_states("mid_repair");
		/#
			fallback_initiated::Assert(isdefined(chunk.og_origin));
		#/
		/#
			fallback_initiated::Assert(isdefined(chunk.og_angles));
		#/
		sound = "rebuild_barrier_hover";
		if(isdefined(chunk.script_presound))
		{
			sound = chunk.script_presound;
		}
	}
	has_perk = 0;
	if(isdefined(perk))
	{
		has_perk = 1;
	}
	if(!isdefined(via_powerup) && isdefined(sound))
	{
		zm_utility::play_sound_at_pos(sound, chunk.origin);
	}
	if(upgrade)
	{
		barrier.zbarrier ZBarrierPieceUseDefaultModel(chunk);
		barrier.zbarrier.chunk_health[chunk] = 100;
	}
	else
	{
		barrier.zbarrier ZBarrierPieceUseDefaultModel(chunk);
		barrier.zbarrier.chunk_health[chunk] = 0;
	}
	scalar = 1;
	if(has_perk)
	{
		if(namespace_851dc78f::function_5f9a13b3("specialty_fastreload"))
		{
			scalar = 0.31;
		}
	}
	if(isdefined(player) && player namespace_851dc78f::function_5f9a13b3("specialty_repairman"))
	{
		scalar = 0.1;
	}
	barrier.zbarrier ShowZBarrierPiece(chunk);
	barrier.zbarrier SetZBarrierPieceState(chunk, "closing", scalar);
	waitDuration = barrier.zbarrier GetZBarrierPieceAnimLengthForState(chunk, "closing", scalar);
	if(isdefined(player) && player namespace_851dc78f::function_5f9a13b3("specialty_repairman"))
	{
		waitDuration = 0.05;
	}
	wait(waitDuration);
}

/*
	Name: handle_post_board_repair_rewards
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x2040
	Size: 0x150
	Parameters: 3
	Flags: None
	Line Number: 678
*/
function handle_post_board_repair_rewards(cost, zbarrier, var_7c65146)
{
	self zm_stats::increment_client_stat("boards");
	self zm_stats::increment_player_stat("boards");
	if(isdefined(self.pers["boards"]) && self.pers["boards"] % 10 == 0)
	{
		self zm_audio::create_and_play_dialog("general", "rebuild_boards");
	}
	self.rebuild_barrier_reward = self.rebuild_barrier_reward + 10;
	if(self.rebuild_barrier_reward < level.zombie_vars["rebuild_barrier_cap_per_round"] * var_7c65146)
	{
		self zm_score::player_add_points("rebuild_board", cost);
		self zm_utility::play_sound_on_ent("purchase");
	}
	if(isdefined(self.board_repair))
	{
		self.board_repair = self.board_repair + 1;
		return;
	}
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_68e704b0
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x2198
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 711
*/
function function_68e704b0()
{
	wait(0.2);
	self.var_2121c77--;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2121c77
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x21B8
	Size: 0xD0
	Parameters: 10
	Flags: None
	Line Number: 729
*/
function function_2121c77(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!(isdefined(self.var_2121c77) && self.var_2121c77 > 0))
	{
		return undefined;
	}
	switch(sMeansOfDeath)
	{
		case "MOD_EXPLOSIVE":
		case "MOD_EXPLOSIVE_SPLASH":
		case "MOD_GRENADE":
		case "MOD_GRENADE_SPLASH":
		{
			iDamage = 0;
			return 0;
			break;
		}
		default
		{
		}
	}
	if(eAttacker == self)
	{
		return 0;
	}
	return undefined;
}

/*
	Name: function_25c713f0
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x2290
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 767
*/
function function_25c713f0()
{
	self endon("death");
	while(1)
	{
		self waittill("bhtn_action_notify", type);
		if(isdefined(type) && "teardown" == type && isdefined(self.first_node))
		{
			if(isdefined(self.first_node.var_add4dbae) && zm_utility::is_player_valid(self.first_node.var_add4dbae) && isdefined(self.first_node.explosives) && self.first_node.explosives > 0)
			{
				self.first_node.explosives--;
				wait(1);
				player = self.first_node.var_add4dbae;
				if(!isdefined(player.var_2121c77))
				{
					player.var_2121c77 = 0;
				}
				player.var_2121c77++;
				player thread function_68e704b0();
				player MagicGrenadeType(GetWeapon("frag_grenade_slaughter_slide"), self.first_node.origin, VectorScale((0, 0, 1), 0), 0.1);
			}
		}
		wait(0.1);
	}
}

/*
	Name: grab_carpenter
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x2428
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 803
*/
function grab_carpenter(player)
{
	if(player namespace_851dc78f::function_b690a849("specialty_repairman"))
	{
		level.var_d9b003fb = player;
	}
	else
	{
		level.var_d9b003fb = undefined;
	}
	if(isdefined(level.use_new_carpenter_func))
	{
		level thread [[level.use_new_carpenter_func]](self.origin);
	}
	else
	{
		level thread start_carpenter(self.origin);
	}
	player thread zm_powerups::powerup_vo("carpenter");
}

/*
	Name: start_carpenter
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x24E8
	Size: 0x328
	Parameters: 1
	Flags: None
	Line Number: 834
*/
function start_carpenter(origin)
{
	window_boards = struct::get_array("exterior_goal", "targetname");
	Total = level.exterior_goals.size;
	carp_ent = spawn("script_origin", (0, 0, 0));
	carp_ent PlayLoopSound("evt_carpenter");
	while(1)
	{
		windows = get_closest_window_repair(window_boards, origin);
		if(!isdefined(windows))
		{
			carp_ent StopLoopSound(1);
			carp_ent playsoundwithnotify("evt_carpenter_end", "sound_done");
			carp_ent waittill("sound_done");
			break;
		}
		else
		{
			ArrayRemoveValue(window_boards, windows);
		}
		while(1)
		{
			if(zm_utility::all_chunks_intact(windows, windows.barrier_chunks))
			{
				break;
			}
			chunk = zm_utility::get_random_destroyed_chunk(windows, windows.barrier_chunks);
			if(!isdefined(chunk))
			{
				break;
			}
			windows thread zm_blockers::replace_chunk(windows, chunk, undefined, zm_powerups::is_carpenter_boards_upgraded(), 1);
			if(isdefined(windows.clip))
			{
				windows.clip TriggerEnable(1);
				windows.clip disconnectpaths();
			}
			else
			{
				zm_blockers::blocker_disconnect_paths(windows.neg_start, windows.neg_end);
			}
			util::wait_network_frame();
			wait(0.05);
		}
		util::wait_network_frame();
	}
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::player_add_points("carpenter_powerup", 200);
	}
	carp_ent delete();
}

/*
	Name: get_closest_window_repair
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x2818
	Size: 0x140
	Parameters: 2
	Flags: None
	Line Number: 898
*/
function get_closest_window_repair(windows, origin)
{
	current_window = undefined;
	shortest_distance = undefined;
	for(i = 0; i < windows.size; i++)
	{
		if(zm_utility::all_chunks_intact(windows, windows[i].barrier_chunks))
		{
			continue;
		}
		if(!isdefined(current_window))
		{
			current_window = windows[i];
			shortest_distance = DistanceSquared(current_window.origin, origin);
			continue;
		}
		if(DistanceSquared(windows[i].origin, origin) < shortest_distance)
		{
			current_window = windows[i];
			shortest_distance = DistanceSquared(windows[i].origin, origin);
		}
	}
	return current_window;
}

/*
	Name: start_carpenter_new
	Namespace: namespace_ac9a276e
	Checksum: 0x424F4353
	Offset: 0x2960
	Size: 0x52A
	Parameters: 1
	Flags: None
	Line Number: 933
*/
function start_carpenter_new(origin)
{
	level.carpenter_powerup_active = 1;
	window_boards = struct::get_array("exterior_goal", "targetname");
	if(isdefined(level._additional_carpenter_nodes))
	{
		window_boards = ArrayCombine(window_boards, level._additional_carpenter_nodes, 0, 0);
	}
	carp_ent = spawn("script_origin", (0, 0, 0));
	carp_ent PlayLoopSound("evt_carpenter");
	boards_near_players = zm_powerup_carpenter::get_near_boards(window_boards);
	boards_far_from_players = zm_powerup_carpenter::get_far_boards(window_boards);
	level zm_powerup_carpenter::repair_far_boards(boards_far_from_players, isdefined(level.var_d9b003fb));
	for(i = 0; i < boards_near_players.size; i++)
	{
		window = boards_near_players[i];
		num_chunks_checked = 0;
		last_repaired_chunk = undefined;
		while(1)
		{
			if(zm_utility::all_chunks_intact(window, window.barrier_chunks))
			{
				break;
			}
			chunk = zm_utility::get_random_destroyed_chunk(window, window.barrier_chunks);
			if(!isdefined(chunk))
			{
				break;
			}
			window thread replace_chunk(window, chunk, 1, 0, level.var_d9b003fb);
			last_repaired_chunk = chunk;
			if(isdefined(level.var_d9b003fb))
			{
				if(!isdefined(window.explosives))
				{
					window.explosives = 0;
				}
				window.var_add4dbae = level.var_d9b003fb;
				window.explosives++;
			}
			if(isdefined(window.clip))
			{
				window.clip TriggerEnable(1);
				window.clip disconnectpaths();
			}
			else
			{
				zm_blockers::blocker_disconnect_paths(window.neg_start, window.neg_end);
			}
			util::wait_network_frame();
			num_chunks_checked++;
			if(num_chunks_checked >= 20)
			{
				break;
			}
		}
		if(isdefined(window.zbarrier))
		{
			if(isdefined(last_repaired_chunk))
			{
				while(window.zbarrier GetZBarrierPieceState(last_repaired_chunk) == "closing")
				{
					wait(0.05);
				}
				if(isdefined(window._post_carpenter_callback))
				{
					window [[window._post_carpenter_callback]]();
					continue;
				}
			}
		}
		while(isdefined(last_repaired_chunk) && last_repaired_chunk.state == "mid_repair")
		{
			wait(0.05);
		}
	}
	carp_ent StopLoopSound(1);
	carp_ent playsoundwithnotify("evt_carpenter_end", "sound_done");
	carp_ent waittill("sound_done");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] namespace_851dc78f::function_b690a849("specialty_repairman"))
		{
			players[i] zm_score::player_add_points("carpenter_powerup", 400);
			continue;
		}
		players[i] zm_score::player_add_points("carpenter_powerup", 200);
	}
	carp_ent delete();
	level notify("carpenter_finished");
	level.carpenter_powerup_active = undefined;
}

