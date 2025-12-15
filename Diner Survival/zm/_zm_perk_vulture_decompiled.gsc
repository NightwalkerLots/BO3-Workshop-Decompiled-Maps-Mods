#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_pack_a_punch;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_272c5387;

/*
	Name: __init__sytem__
	Namespace: namespace_272c5387
	Checksum: 0x423B7289
	Offset: 0x670
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 30
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_vulture", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_272c5387
	Checksum: 0x8045EEFB
	Offset: 0x6B0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function __init__()
{
	enable_vulture_perk_for_level();
}

/*
	Name: enable_vulture_perk_for_level
	Namespace: namespace_272c5387
	Checksum: 0xA5BF21DC
	Offset: 0x6D0
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function enable_vulture_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_vultureaid", "vulture", 3000, &"VK_DESC_VULTURE", GetWeapon("zombie_perk_bottle_vulture"));
	zm_perks::register_perk_precache_func("specialty_vultureaid", &vulture_precache);
	zm_perks::register_perk_clientfields("specialty_vultureaid", &vulture_register_clientfield, &vulture_set_clientfield);
	zm_perks::register_perk_machine("specialty_vultureaid", &vulture_perk_machine_setup, &init_vulture);
	zm_perks::register_perk_host_migration_params("specialty_vultureaid", "vending_vulture", "vulture_light");
	zm_perks::register_perk_threads("specialty_vultureaid", &give_vulture_perk, &take_vulture_perk);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: vulture_precache
	Namespace: namespace_272c5387
	Checksum: 0xFFA98BA4
	Offset: 0x818
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 82
*/
function vulture_precache()
{
	if(isdefined(level.var_718865fc))
	{
		[[level.var_718865fc]]();
		return;
	}
	level._effect["vulture_light"] = "zombie/fx_perk_quick_revive_zmb";
	level.machine_assets["specialty_vultureaid"] = spawnstruct();
	level.machine_assets["specialty_vultureaid"].weapon = GetWeapon("zombie_perk_bottle_vulture");
	level.machine_assets["specialty_vultureaid"].off_model = "xela_perk_vulture_aid";
	level.machine_assets["specialty_vultureaid"].on_model = "xela_perk_vulture_aid";
}

/*
	Name: vulture_register_clientfield
	Namespace: namespace_272c5387
	Checksum: 0xE06A4E9F
	Offset: 0x900
	Size: 0x248
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function vulture_register_clientfield()
{
	clientfield::register("clientuimodel", "hudItems.perks.vultureaid", 1, 1, "int");
	clientfield::register("scriptmover", "vulture_stink_fx", 1, 1, "int");
	clientfield::register("actor", "vulture_stink_trail_fx", 1, 1, "int");
	clientfield::register("actor", "vulture_eye_glow", 1, 1, "int");
	clientfield::register("toplayer", "vulture_perk_active", 1, 1, "int");
	clientfield::register("toplayer", "sndVultureStink", 1, 1, "int");
	clientfield::register("toplayer", "vulture_perk_disease_meter", 1, 6, "int");
	clientfield::register("zbarrier", "vulture_perk_zbarrier", 1, 1, "int");
	clientfield::register("zbarrier", "vulture_perk_wunderfizz", 1, 1, "int");
	clientfield::register("scriptmover", "vulture_powerup", 1, 4, "int");
	clientfield::register("world", "vulture_perk_disable_solo_quick_revive_glow", 1, 1, "int");
	clientfield::register("zbarrier", "vulture_perk_enable_bgb_glow", 1, 1, "int");
}

/*
	Name: vulture_set_clientfield
	Namespace: namespace_272c5387
	Checksum: 0x8141FB15
	Offset: 0xB50
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 132
*/
function vulture_set_clientfield(state)
{
	self clientfield::set_player_uimodel("hudItems.perks.vultureaid", state);
}

/*
	Name: vulture_perk_machine_setup
	Namespace: namespace_272c5387
	Checksum: 0xEB68BAD1
	Offset: 0xB88
	Size: 0xD0
	Parameters: 4
	Flags: None
	Line Number: 147
*/
function vulture_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_vulture_jingle";
	use_trigger.script_string = "vulture_perk";
	use_trigger.script_label = "mus_perks_vulture_sting";
	use_trigger.target = "vending_vulture";
	perk_machine.script_string = "vulture_perk";
	perk_machine.targetname = "vending_vulture";
	bump_trigger.script_string = "vulture_perk";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "vulture_perk";
	}
}

/*
	Name: init_vulture
	Namespace: namespace_272c5387
	Checksum: 0xB9FB22F7
	Offset: 0xC60
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 172
*/
function init_vulture()
{
	util::registerClientSys("vulture_drop_fx");
	level.perk_vulture = spawnstruct();
	level.perk_vulture.zombie_stink_array = [];
	level.perk_vulture.drop_slots_for_network = 0;
	level.perk_vulture.last_stink_zombie_spawned = 0;
	zm_spawner::add_custom_zombie_spawn_logic(&vulture_zombie_spawn_func);
	zm_spawner::register_zombie_death_event_callback(&function_e8361a7);
	level thread vulture_perk_watch_mystery_box();
	level thread vulture_perk_watch_fire_sale();
	level thread vulture_handle_solo_quick_revive();
	level thread function_acec4086();
	level.powerup_fx_func = &function_d40d07e1;
	level.perk_vulture.invalid_bonus_ammo_weapons = [];
	initialize_bonus_entity_pool();
	initialize_stink_entity_pool();
	callback::on_connect(&vulture_player_connect_callback);
	util::registerClientSys("setPerkOverlayStyle");
	return;
}

/*
	Name: function_acec4086
	Namespace: namespace_272c5387
	Checksum: 0x69CCE3E6
	Offset: 0xE08
	Size: 0x230
	Parameters: 0
	Flags: None
	Line Number: 204
*/
function function_acec4086()
{
	util::wait_network_frame();
	pap_triggers = GetEntArray("vk_tra_pap", "targetname");
	foreach(var_43c55147 in pap_triggers)
	{
		var_1e95234a = GetEnt(var_43c55147.target, "targetname");
		var_128603d2 = GetEnt(var_1e95234a.target, "targetname");
		var_128603d2 thread function_7b2c3328();
	}
	foreach(machine in level.var_a8e9ba4e)
	{
		machine thread function_41cc7416();
	}
	foreach(machine in level.perk_random_machines)
	{
		machine thread function_ea4fa23();
	}
}

/*
	Name: function_7b2c3328
	Namespace: namespace_272c5387
	Checksum: 0xDE132380
	Offset: 0x1040
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 234
*/
function function_7b2c3328()
{
	while(1)
	{
		if(self.state != "hidden")
		{
			continue;
		}
		wait(0.05);
	}
}

/*
	Name: function_41cc7416
	Namespace: namespace_272c5387
	Checksum: 0x95413499
	Offset: 0x1078
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 256
*/
function function_41cc7416()
{
	while(1)
	{
		if(self.state == "initial" || self.state == "open")
		{
			self clientfield::set("vulture_perk_enable_bgb_glow", 1);
			continue;
		}
		self clientfield::set("vulture_perk_enable_bgb_glow", 0);
		wait(0.05);
	}
}

/*
	Name: function_ea4fa23
	Namespace: namespace_272c5387
	Checksum: 0x5BCF6631
	Offset: 0x1100
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 280
*/
function function_ea4fa23()
{
	while(1)
	{
		if(self.state == "initial" || self.state == "idle" || self.state == "vending")
		{
			self clientfield::set("vulture_perk_wunderfizz", 1);
			continue;
		}
		self clientfield::set("vulture_perk_wunderfizz", 0);
		wait(0.05);
	}
}

/*
	Name: function_d40d07e1
	Namespace: namespace_272c5387
	Checksum: 0x3B4C7607
	Offset: 0x11A0
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 304
*/
function function_d40d07e1()
{
	if(self.only_affects_grabber)
	{
		self clientfield::set("powerup_fx", 2);
		self clientfield::set("vulture_powerup", 2);
	}
	else if(self.any_team)
	{
		self clientfield::set("powerup_fx", 4);
		self clientfield::set("vulture_powerup", 3);
	}
	else if(self.zombie_grabbable)
	{
		self clientfield::set("powerup_fx", 3);
		self clientfield::set("vulture_powerup", 4);
		continue;
	}
	self clientfield::set("powerup_fx", 1);
	self clientfield::set("vulture_powerup", 1);
}

/*
	Name: vulture_player_connect_callback
	Namespace: namespace_272c5387
	Checksum: 0x116E8931
	Offset: 0x12E0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 336
*/
function vulture_player_connect_callback()
{
	self.perk_vulture = spawnstruct();
	self.vulture_stink_value = 0;
	self thread end_game_turn_off_vulture_overlay();
	return;
}

/*
	Name: end_game_turn_off_vulture_overlay
	Namespace: namespace_272c5387
	Checksum: 0xE2458DF8
	Offset: 0x1328
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 354
*/
function end_game_turn_off_vulture_overlay()
{
	self endon("disconnect");
	level waittill("end_game");
	self thread take_vulture_perk();
	return;
	++;
}

/*
	Name: give_vulture_perk
	Namespace: namespace_272c5387
	Checksum: 0x11C8DB59
	Offset: 0x1368
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 373
*/
function give_vulture_perk()
{
	if(!(isdefined(self.perk_vulture.active) && self.perk_vulture.active))
	{
		self.perk_vulture.active = 1;
		self clientfield::set_to_player("vulture_perk_active", 1);
		self thread function_9475e10c();
	}
}

/*
	Name: take_vulture_perk
	Namespace: namespace_272c5387
	Checksum: 0x9BC08691
	Offset: 0x13F0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 393
*/
function take_vulture_perk()
{
	if(isdefined(self.perk_vulture.active) && self.perk_vulture.active)
	{
		self.perk_vulture.active = 0;
		self clientfield::set_to_player("vulture_perk_active", 0);
		self notify("vulture_perk_lost");
		self _handle_zombie_stink(0);
	}
}

/*
	Name: vulture_perk_add_invalid_bonus_ammo_weapon
	Namespace: namespace_272c5387
	Checksum: 0xDBD9FF2F
	Offset: 0x1480
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 414
*/
function vulture_perk_add_invalid_bonus_ammo_weapon(w_weapon)
{
	level.perk_vulture.invalid_bonus_ammo_weapons[level.perk_vulture.invalid_bonus_ammo_weapons.size] = w_weapon;
}

/*
	Name: vulture_zombie_spawn_func
	Namespace: namespace_272c5387
	Checksum: 0x390F93EF
	Offset: 0x14C0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 429
*/
function vulture_zombie_spawn_func()
{
	self endon("death");
	if(!(isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area))
	{
		self waittill("completed_emerging_into_playable_area");
	}
	self clientfield::set("vulture_eye_glow", 1);
	if(self should_zombie_have_stink())
	{
		self.stink_ent = get_unused_stink_ent();
		if(isdefined(self.stink_ent))
		{
			self.is_stink_zombie = 1;
			self clientfield::set("vulture_stink_trail_fx", 1);
			level.perk_vulture.last_stink_zombie_spawned = GetTime();
		}
	}
}

/*
	Name: function_e8361a7
	Namespace: namespace_272c5387
	Checksum: 0x3435237
	Offset: 0x15A0
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 459
*/
function function_e8361a7()
{
	self clientfield::set("vulture_eye_glow", 0);
	v_origin = zm_utility::GROUNDPOS(self.origin + VectorScale((0, 0, 1), 5));
	if(isdefined(self.is_stink_zombie) && self.is_stink_zombie)
	{
		self clientfield::set("vulture_stink_trail_fx", 0);
		level thread function_6800b672(v_origin, self.stink_ent);
	}
	else if(isdefined(self.attacker) && isPlayer(self.attacker) && (isdefined(self.attacker.perk_vulture.active) && self.attacker.perk_vulture.active))
	{
		str_identifier = "_" + self GetEntityNumber() + "_" + GetTime();
		self.attacker thread function_fa484813(v_origin, str_identifier);
	}
}

/*
	Name: initialize_bonus_entity_pool
	Namespace: namespace_272c5387
	Checksum: 0x86632C64
	Offset: 0x1710
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 485
*/
function initialize_bonus_entity_pool()
{
	level.perk_vulture.bonus_drop_ent_pool = [];
	for(i = 0; i < 20; i++)
	{
		e_temp = spawn("script_model", (0, 0, 0));
		e_temp SetModel("tag_origin");
		e_temp.in_use = 0;
		if(!isdefined(level.perk_vulture.bonus_drop_ent_pool))
		{
			level.perk_vulture.bonus_drop_ent_pool = [];
		}
		else if(!IsArray(level.perk_vulture.bonus_drop_ent_pool))
		{
			level.perk_vulture.bonus_drop_ent_pool = Array(level.perk_vulture.bonus_drop_ent_pool);
		}
		level.perk_vulture.bonus_drop_ent_pool[level.perk_vulture.bonus_drop_ent_pool.size] = e_temp;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: initialize_stink_entity_pool
	Namespace: namespace_272c5387
	Checksum: 0x3E99E7E0
	Offset: 0x1858
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 517
*/
function initialize_stink_entity_pool()
{
	level.perk_vulture.stink_ent_pool = [];
	for(i = 0; i < 4; i++)
	{
		e_temp = spawn("script_model", (0, 0, 0));
		e_temp SetModel("tag_origin");
		e_temp.in_use = 0;
		if(!isdefined(level.perk_vulture.stink_ent_pool))
		{
			level.perk_vulture.stink_ent_pool = [];
		}
		else if(!IsArray(level.perk_vulture.stink_ent_pool))
		{
			level.perk_vulture.stink_ent_pool = Array(level.perk_vulture.stink_ent_pool);
		}
		level.perk_vulture.stink_ent_pool[level.perk_vulture.stink_ent_pool.size] = e_temp;
	}
}

/*
	Name: get_unused_bonus_ent
	Namespace: namespace_272c5387
	Checksum: 0xAA85BB84
	Offset: 0x19A0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 547
*/
function get_unused_bonus_ent()
{
	e_found = undefined;
	for(i = 0; i < level.perk_vulture.bonus_drop_ent_pool.size; i++)
	{
		if(!level.perk_vulture.bonus_drop_ent_pool[i].in_use)
		{
			e_found = level.perk_vulture.bonus_drop_ent_pool[i];
			e_found.in_use = 1;
			break;
		}
	}
	return e_found;
}

/*
	Name: get_unused_stink_ent
	Namespace: namespace_272c5387
	Checksum: 0x952D0A57
	Offset: 0x1A50
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 572
*/
function get_unused_stink_ent()
{
	e_found = undefined;
	for(i = 0; i < level.perk_vulture.stink_ent_pool.size; i++)
	{
		if(!level.perk_vulture.stink_ent_pool[i].in_use)
		{
			e_found = level.perk_vulture.stink_ent_pool[i];
			e_found.in_use = 1;
			break;
		}
	}
	return e_found;
}

/*
	Name: should_do_vulture_drop
	Namespace: namespace_272c5387
	Checksum: 0xB7AEFE37
	Offset: 0x1B00
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 597
*/
function should_do_vulture_drop(v_death_origin)
{
	b_is_inside_playable_area = zm_utility::check_point_in_enabled_zone(v_death_origin, 1);
	b_network_slots_available = level.perk_vulture.drop_slots_for_network < 5;
	b_passed_roll = RandomInt(100) > 35;
	return b_is_inside_playable_area && b_network_slots_available && b_passed_roll;
}

/*
	Name: should_zombie_have_stink
	Namespace: namespace_272c5387
	Checksum: 0x57C4D4F6
	Offset: 0x1BA0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 615
*/
function should_zombie_have_stink()
{
	b_is_zombie = isdefined(self.animName) && self.animName == "zombie";
	b_cooldown_up = GetTime() - level.perk_vulture.last_stink_zombie_spawned > 12000;
	b_roll_passed = RandomInt(100) > 50;
	return b_is_zombie && b_roll_passed && b_cooldown_up;
	ERROR: Bad function call
}

/*
	Name: vulture_drop_count_increment
	Namespace: namespace_272c5387
	Checksum: 0xD3119DB7
	Offset: 0x1C40
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 634
*/
function vulture_drop_count_increment()
{
	level.perk_vulture.drop_slots_for_network++;
	wait(0.25);
	level.perk_vulture.drop_slots_for_network--;
}

/*
	Name: function_fa484813
	Namespace: namespace_272c5387
	Checksum: 0xB4676398
	Offset: 0x1C78
	Size: 0x360
	Parameters: 2
	Flags: None
	Line Number: 651
*/
function function_fa484813(v_origin, str_identifier)
{
	if(!should_do_vulture_drop(v_origin))
	{
		return;
	}
	e_temp = get_unused_bonus_ent();
	if(!isdefined(e_temp))
	{
		return;
	}
	level thread vulture_drop_count_increment();
	var_a644f632 = "vulture_drop_timeout" + str_identifier;
	var_7918f5b9 = "vulture_drop_pickup" + str_identifier;
	STR_MODEL = "";
	var_f7b433c6 = undefined;
	switch(RandomInt(2))
	{
		case 0:
		{
			STR_MODEL = "p7_zm_perk_vulture_ammo";
			var_f7b433c6 = &function_5e8ba46d;
			break;
		}
		case 1:
		{
			STR_MODEL = "p7_zm_perk_vulture_points";
			var_f7b433c6 = &function_9354cd02;
			break;
		}
	}
	e_temp.origin = v_origin + VectorScale((0, 0, 1), 15);
	e_temp SetModel(STR_MODEL);
	e_temp show();
	e_temp SetInvisibleToAll();
	e_temp setvisibletoplayer(self);
	util::setClientSysState("vulture_drop_fx", "1|" + str_identifier + "|" + e_temp.origin[0] + "|" + e_temp.origin[1] + "|" + e_temp.origin[2], self);
	e_temp thread function_e29e6867(self, var_a644f632, var_7918f5b9);
	e_temp thread function_9acb5f6a(self, var_a644f632, var_7918f5b9);
	evt = self util::waittill_any_return(var_a644f632, var_7918f5b9, "disconnect", "vulture_perk_lost");
	var_a49e66f7 = "false";
	if(evt == var_7918f5b9)
	{
		self [[var_f7b433c6]]();
		var_a49e66f7 = "true";
	}
	util::setClientSysState("vulture_drop_fx", "0|" + str_identifier + "|" + var_a49e66f7, self);
	e_temp.in_use = 0;
	e_temp ghost();
}

/*
	Name: function_e29e6867
	Namespace: namespace_272c5387
	Checksum: 0x1DFA141F
	Offset: 0x1FE0
	Size: 0x180
	Parameters: 3
	Flags: None
	Line Number: 712
*/
function function_e29e6867(player, var_a644f632, var_7918f5b9)
{
	player endon("disconnect");
	player endon("vulture_perk_lost");
	player endon(var_7918f5b9);
	n_multiplier = 0;
	b_show = 1;
	for(i = 0; i < 240; i = 0)
	{
		if(i < 120)
		{
			n_multiplier = 120;
		}
		else if(i < 160)
		{
			n_multiplier = 10;
		}
		else if(i < 200)
		{
			n_multiplier = 5;
			continue;
		}
		n_multiplier = 2;
		if(b_show)
		{
			self show();
			self SetInvisibleToAll();
			self setvisibletoplayer(player);
			continue;
		}
		self ghost();
		b_show = !b_show;
		wait(0.05 * n_multiplier);
	}
	player notify(var_a644f632, i + n_multiplier);
}

/*
	Name: function_9acb5f6a
	Namespace: namespace_272c5387
	Checksum: 0xCFD9887B
	Offset: 0x2168
	Size: 0x98
	Parameters: 3
	Flags: None
	Line Number: 759
*/
function function_9acb5f6a(player, var_a644f632, var_7918f5b9)
{
	player endon("disconnect");
	player endon("vulture_perk_lost");
	player endon(var_a644f632);
	wait(0.05);
	while(1)
	{
		if(DistanceSquared(self.origin, player.origin) < 1024)
		{
			player notify(var_7918f5b9);
			return;
		}
		wait(0.05);
	}
}

/*
	Name: function_5e8ba46d
	Namespace: namespace_272c5387
	Checksum: 0xCD6F49F1
	Offset: 0x2208
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 786
*/
function function_5e8ba46d()
{
	var_f391b751 = self GetCurrentWeapon();
	if(is_valid_ammo_bonus_weapon(var_f391b751))
	{
		n_ammo_count_current = self GetWeaponAmmoStock(var_f391b751);
		n_ammo_count_max = var_f391b751.maxAmmo;
		n_ammo_refunded = math::clamp(Int(n_ammo_count_max * RandomFloat(0.025)), 1, n_ammo_count_max);
		self SetWeaponAmmoStock(var_f391b751, math::clamp(n_ammo_count_current + n_ammo_refunded, 0, n_ammo_count_max));
		self playsoundtoplayer("zmb_vulture_drop_pickup_ammo", self);
	}
}

/*
	Name: function_9354cd02
	Namespace: namespace_272c5387
	Checksum: 0x134B0491
	Offset: 0x2340
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 809
*/
function function_9354cd02()
{
	n_multiplier = randomIntRange(1, 5);
	self zm_score::player_add_points("vulture", 5 * n_multiplier);
	self playsoundtoplayer("zmb_vulture_drop_pickup_money", self);
	return;
}

/*
	Name: is_valid_ammo_bonus_weapon
	Namespace: namespace_272c5387
	Checksum: 0xB235411D
	Offset: 0x23B8
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 827
*/
function is_valid_ammo_bonus_weapon(w_weapon)
{
	if(w_weapon == level.weaponNone || w_weapon == level.weaponZMFists)
	{
		return 0;
	}
	if(zm_utility::is_placeable_mine(w_weapon) || zm_equipment::is_equipment(w_weapon))
	{
		return 0;
	}
	weapon = zm_weapons::get_base_weapon(w_weapon);
	if(IsInArray(level.perk_vulture.invalid_bonus_ammo_weapons, weapon))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_6800b672
	Namespace: namespace_272c5387
	Checksum: 0xFE8672DA
	Offset: 0x2478
	Size: 0x188
	Parameters: 2
	Flags: None
	Line Number: 855
*/
function function_6800b672(v_origin, e_temp)
{
	e_temp.origin = v_origin;
	e_temp show();
	util::wait_network_frame();
	e_temp clientfield::set("vulture_stink_fx", 1);
	if(!isdefined(level.perk_vulture.zombie_stink_array))
	{
		level.perk_vulture.zombie_stink_array = [];
	}
	else if(!IsArray(level.perk_vulture.zombie_stink_array))
	{
		level.perk_vulture.zombie_stink_array = Array(level.perk_vulture.zombie_stink_array);
	}
	level.perk_vulture.zombie_stink_array[level.perk_vulture.zombie_stink_array.size] = e_temp;
	wait(16);
	e_temp clientfield::set("vulture_stink_fx", 0);
	e_temp.in_use = 0;
	e_temp ghost();
	ArrayRemoveValue(level.perk_vulture.zombie_stink_array, e_temp, 0);
}

/*
	Name: function_9475e10c
	Namespace: namespace_272c5387
	Checksum: 0xDCAA8099
	Offset: 0x2608
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 887
*/
function function_9475e10c()
{
	self endon("disconnect");
	self endon("vulture_perk_lost");
	self.perk_vulture.is_in_zombie_stink = 0;
	while(1)
	{
		b_is_in_stink = 0;
		for(i = 0; i < level.perk_vulture.zombie_stink_array.size; i++)
		{
			e_point = level.perk_vulture.zombie_stink_array[i];
			if(DistanceSquared(e_point.origin, self.origin) < 4900)
			{
				b_is_in_stink = 1;
				break;
			}
		}
		self _handle_zombie_stink(b_is_in_stink);
		wait(0.05);
	}
}

/*
	Name: _handle_zombie_stink
	Namespace: namespace_272c5387
	Checksum: 0x3DC4E246
	Offset: 0x2708
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 919
*/
function _handle_zombie_stink(b_player_inside_radius)
{
	if(b_player_inside_radius)
	{
		if(!(isdefined(self.perk_vulture.is_in_zombie_stink) && self.perk_vulture.is_in_zombie_stink))
		{
			self.perk_vulture.is_in_zombie_stink = 1;
			self thread function_ff8dabfd();
		}
	}
	else if(isdefined(self.perk_vulture.is_in_zombie_stink) && self.perk_vulture.is_in_zombie_stink)
	{
		self.perk_vulture.is_in_zombie_stink = 0;
		self thread function_25bad5c2();
		return;
	}
}

/*
	Name: function_ff8dabfd
	Namespace: namespace_272c5387
	Checksum: 0x99881D16
	Offset: 0x27C8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 947
*/
function function_ff8dabfd()
{
	self thread _ramp_up_stink_overlay();
	while(self.vulture_stink_value < 4)
	{
		wait(0.05);
	}
	self set_ignoreme(1);
}

/*
	Name: function_25bad5c2
	Namespace: namespace_272c5387
	Checksum: 0x969073AD
	Offset: 0x2828
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 967
*/
function function_25bad5c2()
{
	self endon("disconnect");
	self notify("vulture_perk_stop_zombie_reacquire_player");
	self endon("vulture_perk_stop_zombie_reacquire_player");
	self thread _ramp_down_stink_overlay();
	while(self.vulture_stink_value > 0)
	{
		wait(0.05);
	}
	self set_ignoreme(0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: set_ignoreme
	Namespace: namespace_272c5387
	Checksum: 0x4AEFAA15
	Offset: 0x28A0
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 992
*/
function set_ignoreme(b_ignoreme)
{
	if(!isdefined(self.perk_vulture.ignoreme))
	{
		self.perk_vulture.ignoreme = 0;
	}
	if(b_ignoreme != self.perk_vulture.ignoreme)
	{
		self.perk_vulture.ignoreme = b_ignoreme;
		if(b_ignoreme)
		{
			self zm_utility::increment_ignoreme();
			continue;
		}
		self zm_utility::decrement_ignoreme();
		return;
	}
}

/*
	Name: _ramp_up_stink_overlay
	Namespace: namespace_272c5387
	Checksum: 0xF35D4791
	Offset: 0x2940
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1021
*/
function _ramp_up_stink_overlay()
{
	self endon("disconnect");
	self notify("vulture_perk_stink_ramp_up_done");
	self endon("vulture_perk_stink_ramp_up_done");
	self clientfield::set_to_player("sndVultureStink", 1);
	while(isdefined(self.perk_vulture.is_in_zombie_stink) && self.perk_vulture.is_in_zombie_stink)
	{
		self.vulture_stink_value++;
		if(self.vulture_stink_value > 32)
		{
			self.vulture_stink_value = 32;
		}
		self function_75aa16e4("vultureaid", 1);
		wait(0.25);
	}
}

/*
	Name: _ramp_down_stink_overlay
	Namespace: namespace_272c5387
	Checksum: 0xCD8583F6
	Offset: 0x2A08
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1049
*/
function _ramp_down_stink_overlay()
{
	self endon("disconnect");
	self notify("vulture_perk_stink_ramp_down_done");
	self endon("vulture_perk_stink_ramp_down_done");
	self clientfield::set_to_player("sndVultureStink", 0);
	while(!(isdefined(self.perk_vulture.is_in_zombie_stink) && self.perk_vulture.is_in_zombie_stink) && self.vulture_stink_value > 0)
	{
		self.vulture_stink_value = self.vulture_stink_value - 2;
		if(self.vulture_stink_value < 0 || (!(isdefined(self.perk_vulture.active) && self.perk_vulture.active)))
		{
			self.vulture_stink_value = 0;
		}
		self function_75aa16e4("vultureaid", 0);
		wait(0.25);
	}
}

/*
	Name: vulture_perk_watch_mystery_box
	Namespace: namespace_272c5387
	Checksum: 0x258A8BE9
	Offset: 0x2B10
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 1077
*/
function vulture_perk_watch_mystery_box()
{
	util::wait_network_frame();
	while(1)
	{
		foreach(box in level.var_61a44884)
		{
			util::wait_network_frame();
			if(isdefined(box.var_32e4a758) && box.var_32e4a758)
			{
				box vulture_perk_shows_mystery_box(1);
				continue;
			}
			box vulture_perk_shows_mystery_box(0);
		}
		util::wait_network_frame();
	}
}

/*
	Name: function_86c690dc
	Namespace: namespace_272c5387
	Checksum: 0x64A8A052
	Offset: 0x2C30
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 1106
*/
function function_86c690dc(ent, b_show)
{
	ent vulture_perk_shows_mystery_box(b_show);
	IPrintLnBold("Mysterybox : Vulture Aid Called");
}

/*
	Name: vulture_perk_shows_mystery_box
	Namespace: namespace_272c5387
	Checksum: 0xC1A1AE7D
	Offset: 0x2C80
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 1122
*/
function vulture_perk_shows_mystery_box(b_show)
{
	self clientfield::set("vulture_perk_zbarrier", b_show);
}

/*
	Name: vulture_perk_watch_fire_sale
	Namespace: namespace_272c5387
	Checksum: 0x7A2F0E7C
	Offset: 0x2CB8
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 1137
*/
function vulture_perk_watch_fire_sale()
{
	util::wait_network_frame();
	while(1)
	{
		level waittill("powerup_fire_sale");
		for(i = 0; i < level.chests.size; i++)
		{
			if(i != level.chest_index)
			{
				level.chests[i] thread vulture_fire_sale_box_fx_enable();
			}
		}
		level waittill("fire_sale_off");
		for(i = 0; i < level.chests.size; i++)
		{
			if(i != level.chest_index)
			{
				level.chests[i] thread vulture_fire_sale_box_fx_disable();
			}
		}
	}
}

/*
	Name: vulture_fire_sale_box_fx_enable
	Namespace: namespace_272c5387
	Checksum: 0xF1597880
	Offset: 0x2DB8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1171
*/
function vulture_fire_sale_box_fx_enable()
{
	if(self.zbarrier.state == "arriving")
	{
		self.zbarrier waittill("arrived");
	}
	self.zbarrier clientfield::set("vulture_perk_zbarrier", 1);
	return;
	ERROR: Bad function call
}

/*
	Name: vulture_fire_sale_box_fx_disable
	Namespace: namespace_272c5387
	Checksum: 0x98DFABD
	Offset: 0x2E18
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1192
*/
function vulture_fire_sale_box_fx_disable()
{
	self.zbarrier clientfield::set("vulture_perk_zbarrier", 0);
}

/*
	Name: vulture_handle_solo_quick_revive
	Namespace: namespace_272c5387
	Checksum: 0xD132E2C7
	Offset: 0x2E48
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1207
*/
function vulture_handle_solo_quick_revive()
{
	level flag::wait_till("initial_blackscreen_passed");
	if(zm_perks::use_solo_revive())
	{
		level flag::wait_till("solo_revive");
		level clientfield::set("vulture_perk_disable_solo_quick_revive_glow", 1);
	}
}

/*
	Name: _refund_oldest_ballistic_knife
	Namespace: namespace_272c5387
	Checksum: 0x2C55C2A3
	Offset: 0x2EC8
	Size: 0x2C0
	Parameters: 1
	Flags: None
	Line Number: 1227
*/
function _refund_oldest_ballistic_knife(str_weapon)
{
	self endon("death");
	self endon("disconnect");
	self endon("vulture_perk_lost");
	if(isdefined(self.weaponObjectWatcherArray) && self.weaponObjectWatcherArray.size > 0)
	{
		b_found_weapon_object = 0;
		for(i = 0; i < self.weaponObjectWatcherArray.size; i++)
		{
			if(isdefined(self.weaponObjectWatcherArray[i].weapon) && self.weaponObjectWatcherArray[i].weapon == str_weapon.name)
			{
				s_found = self.weaponObjectWatcherArray[i];
				break;
			}
		}
		if(isdefined(s_found))
		{
			if(isdefined(s_found.objectArray) && s_found.objectArray.size > 0)
			{
				e_oldest = undefined;
				for(i = 0; i < s_found.objectArray.size; i++)
				{
					if(isdefined(s_found.objectArray[i]))
					{
						if(!isdefined(s_found.objectArray[i].retrievableTrigger) || !isdefined(s_found.objectArray[i].retrievableTrigger.owner) || s_found.objectArray[i].retrievableTrigger.owner != self || !isdefined(s_found.objectArray[i].birthtime))
						{
							continue;
						}
						if(!isdefined(e_oldest))
						{
							e_oldest = s_found.objectArray[i];
						}
						if(s_found.objectArray[i].birthtime < e_oldest.birthtime)
						{
							e_oldest = s_found.objectArray[i];
						}
					}
				}
				if(isdefined(e_oldest))
				{
					e_oldest.retrievableTrigger.force_pickup = 1;
					e_oldest.retrievableTrigger notify("trigger", self);
				}
			}
		}
	}
}

/*
	Name: function_75aa16e4
	Namespace: namespace_272c5387
	Checksum: 0x18897A43
	Offset: 0x3190
	Size: 0x8C
	Parameters: 2
	Flags: None
	Line Number: 1286
*/
function function_75aa16e4(var_fa534065, var_d1ba62b2)
{
	if(self.sessionstate == "spectator")
	{
		return;
	}
	var_c899e066 = "";
	var_c899e066 = var_c899e066 + var_fa534065;
	var_c899e066 = var_c899e066 + "|" + var_d1ba62b2;
	self util::setClientSysState("setPerkOverlayStyle", var_c899e066, self);
}

