#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craft_shield;

#namespace rocketshield;

/*
	Name: __init__sytem__
	Namespace: rocketshield
	Checksum: 0x5235C6F9
	Offset: 0x5E8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 35
*/
function autoexec __init__sytem__()
{
	system::register("zm_weap_rocketshield", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: rocketshield
	Checksum: 0x5AEFAB36
	Offset: 0x630
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function __init__()
{
	zm_craft_shield::init("craft_shield_zm", "zod_riotshield", "wpn_t7_zmb_zod_rocket_shield_world");
	clientfield::register("allplayers", "rs_ammo", 1, 1, "int");
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	level.weaponRiotshield = GetWeapon("zod_riotshield");
	zm_equipment::register("zod_riotshield", &"ZOMBIE_EQUIP_RIOTSHIELD_PICKUP_HINT_STRING", &"ZOMBIE_EQUIP_RIOTSHIELD_HOWTO", undefined, "riotshield");
	level.weaponRiotshieldUpgraded = GetWeapon("zod_riotshield_upgraded");
	zm_equipment::register("zod_riotshield_upgraded", &"ZOMBIE_EQUIP_RIOTSHIELD_PICKUP_HINT_STRING", &"ZOMBIE_EQUIP_RIOTSHIELD_HOWTO", undefined, "riotshield");
}

/*
	Name: __main__
	Namespace: rocketshield
	Checksum: 0x10A5CA26
	Offset: 0x778
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function __main__()
{
	zm_equipment::register_for_level("zod_riotshield");
	zm_equipment::Include("zod_riotshield");
	zm_equipment::set_ammo_driven("zod_riotshield", level.weaponRiotshield.startammo, 1);
	zm_equipment::register_for_level("zod_riotshield_upgraded");
	zm_equipment::Include("zod_riotshield_upgraded");
	zm_equipment::set_ammo_driven("zod_riotshield_upgraded", level.weaponRiotshieldUpgraded.startammo, 1);
	SetDvar("juke_enabled", 1);
	zombie_utility::set_zombie_var("riotshield_fling_damage_shield", 100);
	zombie_utility::set_zombie_var("riotshield_knockdown_damage_shield", 15);
	zombie_utility::set_zombie_var("riotshield_juke_damage_shield", 0);
	zombie_utility::set_zombie_var("riotshield_fling_force_juke", 175);
	zombie_utility::set_zombie_var("riotshield_fling_range", 120);
	zombie_utility::set_zombie_var("riotshield_gib_range", 120);
	zombie_utility::set_zombie_var("riotshield_knockdown_range", 120);
	level thread spawn_recharge_tanks();
	level.riotshield_damage_callback = &player_damage_rocketshield;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: on_player_connect
	Namespace: rocketshield
	Checksum: 0x6E6CF7DB
	Offset: 0x970
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function on_player_connect()
{
	self thread watchFirstUse();
}

/*
	Name: watchFirstUse
	Namespace: rocketshield
	Checksum: 0x89855C6B
	Offset: 0x998
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 119
*/
function watchFirstUse()
{
	self endon("disconnect");
	while(isdefined(self))
	{
		self waittill("weapon_change", newWeapon);
		if(newWeapon.name == "zod_riotshield" || newWeapon.name == "zod_riotshield_upgraded")
		{
			break;
		}
	}
	self.rocket_shield_hint_shown = 1;
	zm_equipment::show_hint_text(&"ZOMBIE_ROCKET_HINT", 5);
}

/*
	Name: on_player_spawned
	Namespace: rocketshield
	Checksum: 0x8E1F8731
	Offset: 0xA40
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 144
*/
function on_player_spawned()
{
	self.player_shield_apply_damage = &player_damage_rocketshield;
	self thread player_watch_shield_juke();
	self thread player_watch_ammo_change();
	self thread player_watch_max_ammo();
	self thread player_watch_upgraded_pickup_from_table();
}

/*
	Name: player_watch_ammo_change
	Namespace: rocketshield
	Checksum: 0x6188094E
	Offset: 0xAC8
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 163
*/
function player_watch_ammo_change()
{
	self notify("player_watch_ammo_change");
	self endon("player_watch_ammo_change");
	for(;;)
	{
		self waittill("equipment_ammo_changed", equipment);
		if(IsString(equipment))
		{
			equipment = GetWeapon(equipment);
		}
		if(equipment == GetWeapon("zod_riotshield") || equipment == GetWeapon("zod_riotshield_upgraded"))
		{
			self thread check_weapon_ammo(equipment);
		}
	}
}

/*
	Name: player_watch_max_ammo
	Namespace: rocketshield
	Checksum: 0xD2FB094D
	Offset: 0xB98
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 191
*/
function player_watch_max_ammo()
{
	self notify("player_watch_max_ammo");
	self endon("player_watch_max_ammo");
	for(;;)
	{
		self waittill("zmb_max_ammo");
		wait(0.05);
		if(isdefined(self.hasRiotShield) && self.hasRiotShield)
		{
			self thread check_weapon_ammo(self.weaponRiotshield);
		}
	}
}

/*
	Name: check_weapon_ammo
	Namespace: rocketshield
	Checksum: 0x9E4ED45C
	Offset: 0xC08
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 216
*/
function check_weapon_ammo(weapon)
{
	wait(0.05);
	if(isdefined(self))
	{
		ammo = self GetWeaponAmmoClip(weapon);
		self clientfield::set("rs_ammo", ammo);
	}
}

/*
	Name: player_watch_upgraded_pickup_from_table
	Namespace: rocketshield
	Checksum: 0xF7783D19
	Offset: 0xC78
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 236
*/
function player_watch_upgraded_pickup_from_table()
{
	self notify("player_watch_upgraded_pickup_from_table");
	self endon("player_watch_upgraded_pickup_from_table");
	str_wpn_name = level.weaponRiotshield.name;
	str_notify = str_wpn_name + "_pickup_from_table";
	for(;;)
	{
		self waittill(str_notify);
		if(isdefined(self.b_has_upgraded_shield) && self.b_has_upgraded_shield)
		{
			self zm_equipment::buy("zod_riotshield_upgraded");
		}
	}
}

/*
	Name: player_damage_rocketshield
	Namespace: rocketshield
	Checksum: 0xF91A8EB2
	Offset: 0xD18
	Size: 0xB0
	Parameters: 4
	Flags: None
	Line Number: 262
*/
function player_damage_rocketshield(iDamage, bHeld, fromCode, smod)
{
	if(!isdefined(fromCode))
	{
		fromCode = 0;
	}
	if(!isdefined(smod))
	{
		smod = "MOD_UNKNOWN";
	}
	shieldDamage = iDamage;
	if(smod === "MOD_EXPLOSIVE")
	{
		shieldDamage = shieldDamage + iDamage * 2;
	}
	self riotshield::player_damage_shield(shieldDamage, bHeld, fromCode, smod);
}

/*
	Name: player_watch_shield_juke
	Namespace: rocketshield
	Checksum: 0x3F02C211
	Offset: 0xDD0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 290
*/
function player_watch_shield_juke()
{
	self notify("player_watch_shield_juke");
	self endon("player_watch_shield_juke");
	for(;;)
	{
		self waittill("weapon_melee_juke", weapon);
		if(weapon.isRiotShield)
		{
			self disableOffhandWeapons();
			self playsound("zmb_rocketshield_start");
			self riotshield_melee_juke(weapon);
			self playsound("zmb_rocketshield_end");
			self EnableOffhandWeapons();
			self thread check_weapon_ammo(weapon);
			self notify("shield_juke_done");
		}
	}
}

/*
	Name: riotshield_melee_juke
	Namespace: rocketshield
	Checksum: 0x2FA630EB
	Offset: 0xED0
	Size: 0x298
	Parameters: 1
	Flags: None
	Line Number: 320
*/
function riotshield_melee_juke(weapon)
{
	self endon("weapon_melee");
	self endon("weapon_melee_power");
	self endon("weapon_melee_charge");
	start_time = GetTime();
	if(!isdefined(level.riotshield_knockdown_enemies))
	{
		level.riotshield_knockdown_enemies = [];
	}
	if(!isdefined(level.riotshield_knockdown_gib))
	{
		level.riotshield_knockdown_gib = [];
	}
	if(!isdefined(level.riotshield_fling_enemies))
	{
		level.riotshield_fling_enemies = [];
	}
	if(!isdefined(level.riotshield_fling_vecs))
	{
		level.riotshield_fling_vecs = [];
	}
	while(start_time + 3000 > GetTime())
	{
		self PlayRumbleOnEntity("zod_shield_juke");
		FORWARD = AnglesToForward(self getPlayerAngles());
		shield_damage = 0;
		enemies = riotshield_get_juke_enemies_in_range();
		if(isdefined(level.riotshield_melee_juke_callback) && IsFunctionPtr(level.riotshield_melee_juke_callback))
		{
			[[level.riotshield_melee_juke_callback]](enemies);
		}
		foreach(zombie in enemies)
		{
			self playsound("zmb_rocketshield_imp");
			zombie thread riotshield::riotshield_fling_zombie(self, zombie.fling_vec, 0);
			shield_damage = shield_damage + level.zombie_vars["riotshield_juke_damage_shield"];
		}
		if(shield_damage)
		{
			self riotshield::player_damage_shield(shield_damage, 0);
		}
		level.riotshield_knockdown_enemies = [];
		level.riotshield_knockdown_gib = [];
		level.riotshield_fling_enemies = [];
		level.riotshield_fling_vecs = [];
		wait(0.1);
	}
}

/*
	Name: riotshield_get_juke_enemies_in_range
	Namespace: rocketshield
	Checksum: 0x87E5A17E
	Offset: 0x1170
	Size: 0x358
	Parameters: 0
	Flags: None
	Line Number: 380
*/
function riotshield_get_juke_enemies_in_range()
{
	view_pos = self.origin;
	zombies = Array::get_all_closest(view_pos, GetAITeamArray(level.zombie_team), undefined, undefined, 120);
	if(!isdefined(zombies))
	{
		return;
	}
	FORWARD = AnglesToForward(self getPlayerAngles());
	up = anglesToUp(self getPlayerAngles());
	segment_start = view_pos + 36 * FORWARD;
	segment_end = segment_start + 120 - 36 * FORWARD;
	fling_force = level.zombie_vars["riotshield_fling_force_juke"];
	fling_force_vlo = fling_force * 0.5;
	fling_force_vhi = fling_force * 0.6;
	enemies = [];
	for(i = 0; i < zombies.size; i++)
	{
		if(!isdefined(zombies[i]) || !isalive(zombies[i]))
		{
			continue;
		}
		if(zombies[i].archetype == "margwa")
		{
			continue;
		}
		test_origin = zombies[i] GetCentroid();
		radial_origin = PointOnSegmentNearestToPoint(segment_start, segment_end, test_origin);
		lateral = test_origin - radial_origin;
		if(Abs(lateral[2]) > 72)
		{
			continue;
		}
		lateral = (lateral[0], lateral[1], 0);
		len = length(lateral);
		if(len > 36)
		{
			continue;
		}
		lateral = (lateral[0], lateral[1], 0);
		zombies[i].fling_vec = fling_force * FORWARD + RandomFloatRange(fling_force_vlo, fling_force_vhi) * up;
		enemies[enemies.size] = zombies[i];
	}
	return enemies;
}

/*
	Name: spawn_recharge_tanks
	Namespace: rocketshield
	Checksum: 0x36A2A11
	Offset: 0x14D0
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 436
*/
function spawn_recharge_tanks()
{
	level flag::wait_till("all_players_spawned");
	n_spawned = 0;
	n_charges = level.players.size + 3;
	a_e_spawnpoints = Array::randomize(struct::get_array("zod_shield_charge"));
	foreach(e_spawnpoint in a_e_spawnpoints)
	{
		if(isdefined(e_spawnpoint.spawned) && e_spawnpoint.spawned)
		{
			n_spawned++;
		}
	}
	foreach(e_spawnpoint in a_e_spawnpoints)
	{
		if(n_spawned < n_charges)
		{
			if(!(isdefined(e_spawnpoint.spawned) && e_spawnpoint.spawned))
			{
				e_spawnpoint thread create_bottle_unitrigger(e_spawnpoint.origin, e_spawnpoint.angles);
				n_spawned++;
				continue;
			}
			break;
		}
	}
	level waittill("start_of_round");
	level thread spawn_recharge_tanks();
}

/*
	Name: create_bottle_unitrigger
	Namespace: rocketshield
	Checksum: 0x1A0CC59A
	Offset: 0x16F8
	Size: 0x290
	Parameters: 2
	Flags: None
	Line Number: 476
*/
function create_bottle_unitrigger(v_origin, v_angles)
{
	s_struct = self;
	if(self == level)
	{
		s_struct = spawnstruct();
		s_struct.origin = v_origin;
		s_struct.angles = v_angles;
	}
	width = 128;
	height = 128;
	length = 128;
	unitrigger_stub = spawnstruct();
	unitrigger_stub.origin = v_origin;
	unitrigger_stub.angles = v_angles;
	unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	unitrigger_stub.cursor_hint = "HINT_NOICON";
	unitrigger_stub.script_width = width;
	unitrigger_stub.script_height = height;
	unitrigger_stub.script_length = length;
	unitrigger_stub.require_look_at = 0;
	unitrigger_stub.mdl_shield_recharge = spawn("script_model", v_origin);
	modelName = "p7_zm_zod_nitrous_tank";
	if(isdefined(s_struct.model) && IsString(s_struct.model))
	{
		modelName = s_struct.model;
	}
	unitrigger_stub.mdl_shield_recharge SetModel(modelName);
	unitrigger_stub.mdl_shield_recharge.angles = v_angles;
	s_struct.spawned = 1;
	unitrigger_stub.shield_recharge_spawnpoint = s_struct;
	unitrigger_stub.prompt_and_visibility_func = &bottle_trigger_visibility;
	zm_unitrigger::register_static_unitrigger(unitrigger_stub, &shield_recharge_trigger_think);
	return unitrigger_stub;
}

/*
	Name: bottle_trigger_visibility
	Namespace: rocketshield
	Checksum: 0xD991B217
	Offset: 0x1990
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 522
*/
function bottle_trigger_visibility(player)
{
	self setHintString(&"ZOMBIE_PICKUP_BOTTLE");
	if(!(isdefined(player.hasRiotShield) && player.hasRiotShield) || player getammocount(player.weaponRiotshield) == player.weaponRiotshield.maxAmmo)
	{
		b_is_invis = 1;
		continue;
	}
	b_is_invis = 0;
	self setinvisibletoplayer(player, b_is_invis);
	return !b_is_invis;
}

/*
	Name: shield_recharge_trigger_think
	Namespace: rocketshield
	Checksum: 0x404347B0
	Offset: 0x1A68
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 545
*/
function shield_recharge_trigger_think()
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
		level thread bottle_trigger_activate(self.stub, player);
		break;
	}
}

/*
	Name: bottle_trigger_activate
	Namespace: rocketshield
	Checksum: 0xF8D9C1B5
	Offset: 0x1B18
	Size: 0x10A
	Parameters: 2
	Flags: None
	Line Number: 577
*/
function bottle_trigger_activate(trig_stub, player)
{
	trig_stub notify("bottle_collected");
	if(isdefined(player.hasRiotShield) && player.hasRiotShield)
	{
		player zm_equipment::change_ammo(player.weaponRiotshield, 1);
	}
	v_origin = trig_stub.mdl_shield_recharge.origin;
	v_angles = trig_stub.mdl_shield_recharge.angles;
	trig_stub.mdl_shield_recharge delete();
	zm_unitrigger::unregister_unitrigger(trig_stub);
	trig_stub.shield_recharge_spawnpoint.spawned = undefined;
}

