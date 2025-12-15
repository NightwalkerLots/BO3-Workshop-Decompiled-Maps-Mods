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
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_b20e5028;

/*
	Name: __init__sytem__
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x628
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 47
*/
function autoexec __init__sytem__()
{
	system::register("timeslip", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x668
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function __init__()
{
	function_1a92256e();
}

/*
	Name: function_1a92256e
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x688
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_timeslip", "timeslip", 2000, &"ZM_REAP_MOD_PERK_TIMESLIP", GetWeapon("zombie_perk_bottle_timeslip"));
	zm_perks::register_perk_precache_func("specialty_timeslip", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_timeslip", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_timeslip", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_timeslip", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_timeslip", "Timeslip", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_timeslip", &"ZM_REAP_MOD_PERK_TIMESLIP_DB", 1500, "Timeslip", "timeslip");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_timeslip"] = 1;
	level thread function_6c43a5c8();
	level thread function_92ff046a();
	level.hero_power_update = &hero_power_event_callback;
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x888
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_timeslip"] = spawnstruct();
	level.machine_assets["specialty_timeslip"].weapon = GetWeapon("zombie_perk_bottle_timeslip");
	level.machine_assets["specialty_timeslip"].off_model = "cz_vending_timeslip2_off";
	level.machine_assets["specialty_timeslip"].on_model = "cz_vending_timeslip2";
}

/*
	Name: function_19157aff
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x930
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 125
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x940
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 139
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_timeslip", "timeslip", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x988
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 154
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_timeslip";
	use_trigger.script_label = "";
	use_trigger.target = "Timeslip";
	perk_machine.script_string = "specialty_timeslip";
	perk_machine.targetname = "Timeslip";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_timeslip";
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0xA50
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 180
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_timeslip"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_timeslip"] = 1;
	if(isdefined(level.magic_box_zbarrier_state_func) && level.magic_box_zbarrier_state_func != &function_2b97c342)
	{
		level.var_247f8cb = level.magic_box_zbarrier_state_func;
	}
}

/*
	Name: function_b4722825
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0xB08
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 212
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_timeslip"] = 0;
	self.var_b5c2c258["specialty_timeslip"] = undefined;
	self.var_d6aef449["specialty_timeslip"] = undefined;
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_6c43a5c8
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0xB68
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 232
*/
function function_6c43a5c8()
{
	var_fb1cd1b2 = "specialty_timeslip" + "_power_on";
	str_off = "specialty_timeslip" + "_off";
	while(1)
	{
		level waittill(var_fb1cd1b2);
		level.var_1dfdb431 = 1;
		level waittill(str_off);
		level.var_1dfdb431 = 0;
		wait(0.01);
	}
}

/*
	Name: function_575c219c
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0xBF0
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 256
*/
function function_575c219c()
{
	wait(5);
	while(level.var_1dfdb431)
	{
		while(isdefined(level.var_2a48ed87))
		{
			wait(0.1);
		}
		machine = GetEntArray("Timeslip", "targetname");
		for(i = 0; i < machine.size; i++)
		{
			machine[i] useanimtree(-1);
			machine[i] AnimScripted("anim_notify", machine[i].origin, machine[i].angles, %cz_timeslip_hourglass_rotate);
		}
		wait(6.5);
	}
}

/*
	Name: function_92ff046a
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0xD10
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 285
*/
function function_92ff046a()
{
	while(1)
	{
		ents = GetEntArray();
		for(i = 0; i < ents.size; i++)
		{
			if(isdefined(ents[i]._trap_cooldown_time) && !isdefined(ents[i].var_b3f185a))
			{
				ents[i].var_b3f185a = 1;
				ents[i] thread function_80598dea();
			}
		}
		level waittill("between_round_over");
		wait(0.01);
	}
}

/*
	Name: function_80598dea
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0xDF0
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 313
*/
function function_80598dea()
{
	original_time = self._trap_cooldown_time;
	while(1)
	{
		while(!(isdefined(self._trap_in_use) && self._trap_in_use) && (!isdefined(self.activated_by_player) || (isdefined(self.activated_by_player) && !isPlayer(self.activated_by_player))))
		{
			wait(1);
		}
		wait(1);
		if(isdefined(self.activated_by_player) && isPlayer(self.activated_by_player) && self.activated_by_player namespace_851dc78f::function_5f9a13b3("specialty_timeslip"))
		{
			self._trap_cooldown_time = Int(original_time / 2);
		}
		else
		{
			self._trap_cooldown_time = original_time;
		}
		while(isdefined(self._trap_in_use) && self._trap_in_use)
		{
			wait(1);
		}
	}
}

/*
	Name: hero_power_event_callback
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0xF18
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 348
*/
function hero_power_event_callback(e_player, ai_enemy)
{
	w_hero = e_player.current_hero_weapon;
	if(isdefined(level.a_func_hero_power_update) && isdefined(level.a_func_hero_power_update[w_hero]))
	{
		level [[level.a_func_hero_power_update[w_hero]]](e_player, ai_enemy);
	}
	else
	{
		level hero_power_event(e_player, ai_enemy);
	}
}

/*
	Name: hero_power_event
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0xFB0
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 371
*/
function hero_power_event(player, ai_enemy)
{
	if(isdefined(player) && player zm_utility::has_player_hero_weapon() && !player.hero_weapon_state === 3 && (!(isdefined(player.disable_hero_power_charging) && player.disable_hero_power_charging)))
	{
		player player_hero_power_event(ai_enemy);
		return;
	}
}

/*
	Name: player_hero_power_event
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x1048
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 390
*/
function player_hero_power_event(ai_enemy)
{
	if(isdefined(self))
	{
		w_current = self zm_utility::get_player_hero_weapon();
		if(isdefined(ai_enemy.heroweapon_kill_power))
		{
			perkFactor = 1;
			if(self hasPerk("specialty_overcharge"))
			{
				perkFactor = GetDvarFloat("gadgetPowerOverchargePerkScoreFactor");
			}
			if(self namespace_851dc78f::function_b690a849("specialty_timeslip"))
			{
				perkFactor = 1.25;
			}
			self.hero_power = self.hero_power + perkFactor * ai_enemy.heroweapon_kill_power;
			self.hero_power = math::clamp(self.hero_power, 0, 100);
			if(self.hero_power != self.hero_power_prev)
			{
				self GadgetPowerSet(0, self.hero_power);
				self clientfield::set_player_uimodel("zmhud.swordEnergy", self.hero_power / 100);
				self clientfield::increment_uimodel("zmhud.swordChargeUpdate");
			}
		}
	}
}

/*
	Name: function_2b97c342
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x11F0
	Size: 0x2C0
	Parameters: 1
	Flags: None
	Line Number: 428
*/
function function_2b97c342(state)
{
	switch(state)
	{
		case "open":
		{
			self ShowZBarrierPiece(2);
			if(isdefined(self.chest_user) && self.chest_user namespace_851dc78f::function_5f9a13b3("specialty_timeslip"))
			{
				self thread magic_box_opens(self.chest_user);
			}
			else
			{
				self thread magic_box_opens();
			}
			self.state = "open";
			break;
		}
	}
	if(isdefined(level.var_247f8cb))
	{
		self [[level.var_247f8cb]](state);
		return;
	}
	switch(state)
	{
		case "away":
		{
			self ShowZBarrierPiece(0);
			self.state = "away";
			break;
		}
		case "arriving":
		{
			self ShowZBarrierPiece(1);
			self thread zm_magicbox::magic_box_arrives();
			self.state = "arriving";
			break;
		}
		case "initial":
		{
			self ShowZBarrierPiece(1);
			self thread zm_magicbox::magic_box_initial();
			thread zm_unitrigger::register_static_unitrigger(self.owner.unitrigger_stub, &zm_magicbox::magicbox_unitrigger_think);
			self.state = "initial";
			break;
		}
		case "close":
		{
			self ShowZBarrierPiece(2);
			self thread zm_magicbox::magic_box_closes();
			self.state = "close";
			break;
		}
		case "leaving":
		{
			self ShowZBarrierPiece(1);
			self thread zm_magicbox::magic_box_leaves();
			self.state = "leaving";
			break;
		}
		default
		{
			if(isdefined(level.custom_magicbox_state_handler))
			{
				self [[level.custom_magicbox_state_handler]](state);
				break;
			}
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: magic_box_opens
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x14B8
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 512
*/
function magic_box_opens(player)
{
	if(isdefined(player) && player namespace_851dc78f::function_b690a849("specialty_timeslip"))
	{
		self SetZBarrierPieceState(2, "opening", 0.1);
	}
	else if(isdefined(player) && player namespace_851dc78f::function_5f9a13b3("specialty_timeslip"))
	{
		self SetZBarrierPieceState(2, "opening", 0.5);
	}
	else
	{
		self SetZBarrierPieceState(2, "opening");
	}
	while(self GetZBarrierPieceState(2) == "opening")
	{
		wait(0.1);
	}
	self notify("opened");
}

/*
	Name: on_player_spawned
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x15D8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 543
*/
function on_player_spawned()
{
}

/*
	Name: function_b690a849
	Namespace: namespace_b20e5028
	Checksum: 0x424F4353
	Offset: 0x15E8
	Size: 0x22
	Parameters: 1
	Flags: None
	Line Number: 557
*/
function function_b690a849(perk)
{
	return namespace_851dc78f::function_b690a849(perk);
}

