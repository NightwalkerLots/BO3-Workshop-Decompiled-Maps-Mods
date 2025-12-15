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
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerup_utility;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace vulture;

/*
	Name: __init__sytem__
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x810
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 48
*/
function autoexec __init__sytem__()
{
	system::register("VULTURE", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x850
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function __init__()
{
	function_1a92256e();
	return;
	continue;
}

/*
	Name: function_1a92256e
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x870
	Size: 0x240
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_vulture", "customperk", 3000, &"ZM_REAP_MOD_PERK_VULTURE", GetWeapon("zombie_perk_bottle_vulture"));
	zm_perks::register_perk_precache_func("specialty_vulture", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_vulture", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_vulture", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_vulture", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_vulture", "Vulture-Aid", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_vulture", &"ZM_REAP_MOD_PERK_VULTURE_DB", 2000, "Vulture-Aid", "vulture");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_vulture"] = 1;
	level thread function_3e35e8a2();
	zm_spawner::add_custom_zombie_spawn_logic(&function_1c612efa);
	namespace_3b75c34a::function_4e972a8e(&function_402e4160);
	zm_spawner::register_zombie_death_event_callback(&function_ffa0e780);
	callback::on_spawned(&on_player_spawned);
	level thread function_cedf08f5();
}

/*
	Name: function_8bd87e3d
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xAB8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 112
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_vulture"] = spawnstruct();
	level.machine_assets["specialty_vulture"].weapon = GetWeapon("zombie_perk_bottle_vulture");
	level.machine_assets["specialty_vulture"].off_model = "p6_zm_vending_vultureaid";
	level.machine_assets["specialty_vulture"].on_model = "p6_zm_vending_vultureaid_on";
}

/*
	Name: function_19157aff
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xB60
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 130
*/
function function_19157aff()
{
	clientfield::register("zbarrier", "vulture_aid_magicbox", 1, 1, "int");
	clientfield::register("zbarrier", "vulture_aid_pap", 1, 1, "int");
	clientfield::register("clientuimodel", "vulture_aid_vision", 1, 1, "int");
	clientfield::register("actor", "vulture_perk_stink", 1, 1, "int");
	clientfield::register("world", "vulture_reset", 1, 1, "int");
}

/*
	Name: function_99c1452c
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xC60
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 149
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_vulture", "vulture", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xCA8
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 164
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_vulture";
	use_trigger.script_label = "";
	use_trigger.target = "Vulture-Aid";
	perk_machine.script_string = "specialty_vulture";
	perk_machine.targetname = "Vulture-Aid";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_vulture";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xD70
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 188
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_vulture"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_vulture"] = 1;
	self clientfield::set_player_uimodel("vulture_aid_vision", 1);
	self.var_5428e1e8 = 1;
	level thread function_4f78b238();
}

/*
	Name: function_b4722825
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xE38
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 219
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_vulture"] = 0;
	self.var_b5c2c258["specialty_vulture"] = undefined;
	self.var_d6aef449["specialty_vulture"] = undefined;
	self clientfield::set_player_uimodel("vulture_aid_vision", 0);
	return;
	++;
}

/*
	Name: function_4f78b238
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xEB8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 239
*/
function function_4f78b238()
{
	level clientfield::set("vulture_reset", 1);
	wait(0.5);
	level clientfield::set("vulture_reset", 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3e35e8a2
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xF10
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 258
*/
function function_3e35e8a2()
{
	wait(1);
	vending_weapon_upgrade_trigger = zm_pap_util::get_triggers();
	if(vending_weapon_upgrade_trigger.size > 0)
	{
		for(i = 0; i < vending_weapon_upgrade_trigger.size; i++)
		{
			if(isdefined(vending_weapon_upgrade_trigger[i].target))
			{
				PaP = GetEnt(vending_weapon_upgrade_trigger[i].target, "targetname");
				if(PaP IsZBarrier())
				{
					PaP clientfield::set("vulture_aid_pap", 1);
				}
			}
		}
	}
	else if(level.chests.size >= 1)
	{
		for(i = 0; i < level.chests.size; i++)
		{
			level.chests[i] thread function_fdf52bd0();
		}
	}
	else if(level flag::exists("reap_collection_loaded") && !level flag::get("reap_collection_loaded"))
	{
		level flag::wait_till("reap_collection_loaded");
		wait(1);
	}
}

/*
	Name: function_fdf52bd0
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x10C0
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 300
*/
function function_fdf52bd0()
{
	is_active = 0;
	while(isdefined(self))
	{
		if(self == level.chests[level.chest_index] || (isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]) && level.zombie_vars["zombie_powerup_fire_sale_on"]) && !is_active)
		{
			is_active = 1;
			if(isdefined(self.zbarrier) && self.zbarrier IsZBarrier())
			{
				self.zbarrier clientfield::set("vulture_aid_magicbox", 1);
			}
		}
		else if(!(self == level.chests[level.chest_index] || (isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]) && level.zombie_vars["zombie_powerup_fire_sale_on"])) && is_active)
		{
			is_active = 0;
			if(isdefined(self.zbarrier) && self.zbarrier IsZBarrier())
			{
				self.zbarrier clientfield::set("vulture_aid_magicbox", 0);
			}
		}
		wait(1);
	}
}

/*
	Name: function_1c612efa
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1248
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 335
*/
function function_1c612efa()
{
	self endon("death");
	while(isdefined(self) && self.ai_state != "zombie_think")
	{
		wait(0.1);
	}
	if(isdefined(self) && !isVehicle(self) && self.archetype == "zombie")
	{
		self thread function_33f8dcb0();
	}
}

/*
	Name: function_cedf08f5
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x12D8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 358
*/
function function_cedf08f5()
{
	while(1)
	{
		level waittill("between_round_over");
		level.var_c5ab0e9f = 0;
		level.var_2fbf96b8 = 0;
	}
	return;
}

/*
	Name: function_ffa0e780
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1318
	Size: 0x268
	Parameters: 0
	Flags: None
	Line Number: 379
*/
function function_ffa0e780()
{
	if(!function_2437d60e())
	{
		return;
	}
	if(isdefined(self.no_powerups) && self.no_powerups)
	{
		return;
	}
	if(self.archetype != "zombie")
	{
		return;
	}
	if(!isdefined(level.var_c5ab0e9f))
	{
		level.var_c5ab0e9f = 0;
	}
	if(isdefined(self.var_ef04caed))
	{
		self clientfield::set("vulture_perk_stink", 0);
		level.var_2fbf96b8 = level.var_2fbf96b8 - 1;
		var_8be4db6f = spawn("script_model", self.origin + VectorScale((0, 0, 1), 5));
		var_8be4db6f SetModel("tag_origin");
		var_8be4db6f.targetname = "vulture_aid_stink";
		var_8be4db6f thread function_a32eadf6();
	}
	else if(RandomInt(100) < 40 && !isdefined(self.var_ef04caed) && level.var_c5ab0e9f < 6)
	{
		drop_model = "p6_zm_perk_vulture_points";
		var_2c0c6c13 = &function_4e2b324a;
		if(RandomInt(100) < 50)
		{
			drop_model = "p6_zm_perk_vulture_ammo";
			var_2c0c6c13 = &function_7597a375;
		}
		level.var_c5ab0e9f++;
		var_8be4db6f = spawn("script_model", self.origin + VectorScale((0, 0, 1), 10));
		var_8be4db6f SetModel(drop_model);
		var_8be4db6f.targetname = "vulture_powerup";
		var_8be4db6f thread function_bea77567();
		var_8be4db6f thread function_4c77eb8d(var_2c0c6c13);
	}
}

/*
	Name: function_a32eadf6
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1588
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 434
*/
function function_a32eadf6()
{
	self thread function_7f339566();
	wait(12);
	self delete();
}

/*
	Name: function_33f8dcb0
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x15C8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 451
*/
function function_33f8dcb0()
{
	if(!isdefined(level.var_2fbf96b8))
	{
		level.var_2fbf96b8 = 0;
	}
	if(level.var_2fbf96b8 < 3 && RandomInt(100) < 30)
	{
		self.var_ef04caed = 1;
		level.var_2fbf96b8 = level.var_2fbf96b8 + 1;
		self clientfield::set("vulture_perk_stink", 1);
	}
}

/*
	Name: function_4c77eb8d
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1660
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 475
*/
function function_4c77eb8d(EFF)
{
	self endon("powerup_timedout");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] namespace_851dc78f::function_5f9a13b3("specialty_vulture"))
		{
			self playsoundtoplayer("vulture_aid_powerup_drop", players[i]);
		}
	}
	self PlayLoopSound("vulture_aid_powerup_loop");
	while(isdefined(self))
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] namespace_851dc78f::function_5f9a13b3("specialty_vulture") && DistanceSquared(self.origin, players[i].origin) < 900)
			{
				players[i] thread [[EFF]]();
				self playsoundtoplayer("vulture_aid_powerup_pickup", players[i]);
				self notify("hash_b6ee58cb");
				self StopLoopSound(2);
				level.var_c5ab0e9f--;
				self delete();
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_7597a375
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1868
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 516
*/
function function_7597a375()
{
	ammo = RandomInt(3) + 1;
	gun = self GetCurrentWeapon();
	if(self namespace_851dc78f::function_b690a849("specialty_vulture"))
	{
		ammo = ammo * 2;
	}
	if(!zm_weapons::is_wonder_weapon(gun) || gun == GetWeapon("ray_gun"))
	{
		if(isdefined(level.var_daebd49c))
		{
			self [[level.var_daebd49c]](gun, ammo);
		}
		else
		{
			self SetWeaponAmmoStock(gun, self GetWeaponAmmoStock(gun) + ammo);
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4e2b324a
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1988
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 549
*/
function function_4e2b324a()
{
	points = 1 + RandomInt(5) * 5;
	if(level.intermission)
	{
		return;
	}
	if(self namespace_851dc78f::function_b690a849("specialty_vulture"))
	{
		points = points * 2;
	}
	self playsoundtoplayer("vulture_aid_powerup_money", self);
	n_points_to_add_to_currency = bgb::add_to_player_score_override(points, "");
	self.score = self.score + n_points_to_add_to_currency;
	self.pers["score"] = self.score;
	self IncrementPlayerStat("scoreEarned", n_points_to_add_to_currency);
	level notify("earned_points", self, points);
	self.score_total = self.score_total + points;
	level.score_total = level.score_total + points;
}

/*
	Name: function_bea77567
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1AD0
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 580
*/
function function_bea77567()
{
	self endon("hash_b6ee58cb");
	for(i = 0; i < 40; i++)
	{
		if(i % 2)
		{
			self ghost();
		}
		else
		{
			self show();
			self SetInvisibleToAll();
			players = GetPlayers();
			for(a = 0; a < players.size; a++)
			{
				if(players[a] namespace_851dc78f::function_5f9a13b3("specialty_vulture"))
				{
					self setinvisibletoplayer(players[a], 0);
				}
			}
		}
		if(i < 15)
		{
			wait(0.5);
			continue;
		}
		if(i < 25)
		{
			wait(0.25);
			continue;
		}
		wait(0.1);
	}
	self notify("powerup_timedout");
	self StopLoopSound(2);
	level.var_c5ab0e9f--;
	self delete();
	return;
}

/*
	Name: function_402e4160
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1C70
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 631
*/
function function_402e4160()
{
	wait(0.1);
	if(!isdefined(self))
	{
		return;
	}
	struct = level.zombie_powerups[self.powerup_name];
	var_8be4db6f = spawn("script_model", self.origin);
	var_8be4db6f SetModel("tag_origin");
	var_8be4db6f namespace_851dc78f::function_4621bbdd("scriptmover", "vulture_powerup_on", 1);
	while(isdefined(self))
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] namespace_851dc78f::function_5f9a13b3("specialty_vulture"))
			{
				var_8be4db6f setinvisibletoplayer(players[i], 0);
				continue;
			}
			var_8be4db6f setinvisibletoplayer(players[i], 1);
		}
		var_8be4db6f.origin = self.origin;
		wait(0.1);
	}
	var_8be4db6f namespace_851dc78f::function_4621bbdd("scriptmover", "vulture_powerup_on", 1);
	var_8be4db6f delete();
}

/*
	Name: function_7f339566
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1E48
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 671
*/
function function_7f339566()
{
	while(isdefined(self))
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] namespace_851dc78f::function_5f9a13b3("specialty_vulture"))
			{
				self setinvisibletoplayer(players[i], 0);
				continue;
			}
			self setinvisibletoplayer(players[i], 1);
		}
		wait(0.1);
	}
}

/*
	Name: function_2437d60e
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1F20
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 699
*/
function function_2437d60e()
{
	exists = 0;
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] namespace_851dc78f::function_5f9a13b3("specialty_vulture"))
		{
			exists = 1;
		}
	}
	return exists;
}

/*
	Name: on_player_spawned
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1FB8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 723
*/
function on_player_spawned()
{
	self thread function_695fdd8a();
	self thread function_7b88c3a0();
}

/*
	Name: function_7b88c3a0
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1FF8
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 739
*/
function function_7b88c3a0()
{
	self endon("disconnect");
	self notify("hash_7b88c3a0");
	self endon("hash_7b88c3a0");
	while(1)
	{
		self waittill("weapon_melee");
		if(namespace_851dc78f::function_5f9a13b3("specialty_vulture"))
		{
			vending_triggers = GetEntArray("Vulture-Aid", "targetname");
			for(i = 0; i < vending_triggers.size; i++)
			{
				if(DistanceSquared(self.origin, vending_triggers[i].origin) < 4096)
				{
					if(util::within_fov(self GetEye(), self getPlayerAngles(), vending_triggers[i].origin + VectorScale((0, 0, 1), 40), cos(40)))
					{
						if(isdefined(self.var_5428e1e8) && !self.var_5428e1e8)
						{
							self.var_5428e1e8 = 1;
							IPrintLnBold("Vulture Waypoints Enabled");
							self clientfield::set_player_uimodel("vulture_aid_vision", 1);
						}
						else
						{
							self.var_5428e1e8 = 0;
							IPrintLnBold("Vulture Waypoints Disabled");
							self clientfield::set_player_uimodel("vulture_aid_vision", 0);
						}
						wait(1);
					}
				}
			}
		}
	}
}

/*
	Name: function_695fdd8a
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x2200
	Size: 0x498
	Parameters: 0
	Flags: None
	Line Number: 786
*/
function function_695fdd8a()
{
	self endon("disconnect");
	self notify("hash_695fdd8a");
	self endon("hash_695fdd8a");
	while(1)
	{
		if(self namespace_851dc78f::function_5f9a13b3("specialty_vulture"))
		{
			var_6ebbd942 = 0;
			stinks = GetEntArray("vulture_aid_stink", "targetname");
			if(isdefined(stinks) && stinks.size > 0)
			{
				for(i = 0; i < stinks.size; i++)
				{
					if(DistanceSquared(stinks[i].origin, self.origin) < 900)
					{
						var_6ebbd942 = 1;
					}
				}
			}
			else if(var_6ebbd942)
			{
				if(!isdefined(self.var_590a125d))
				{
					self thread namespace_4b6e359c::function_75aa16e4("specialty_vulture", "vulture", "overlayStyleGreen", 1);
					self.var_590a125d = newClientHudElem(self);
					self.var_590a125d.x = 0;
					self.var_590a125d.y = 0;
					self.var_590a125d.alpha = 0;
					self.var_590a125d.horzAlign = "fullscreen";
					self.var_590a125d.vertAlign = "fullscreen";
					self.var_590a125d.foreground = 1;
					self.var_590a125d SetShader("vulture_hud_glow_stink", 640, 480);
					self PlayLoopSound("vulture_aid_stink_loop");
					self playsoundtoplayer("vulture_aid_stink_start", self);
				}
				if(!isdefined(self.var_d7ed2a7d))
				{
					self zm_utility::increment_ignoreme();
					self.var_d7ed2a7d = 0;
				}
				if(self.var_d7ed2a7d < 10)
				{
					self.var_d7ed2a7d = self.var_d7ed2a7d + 1;
				}
				self.var_590a125d.alpha = self.var_d7ed2a7d / 10;
			}
			else if(isdefined(self.var_d7ed2a7d))
			{
				if(self.var_d7ed2a7d > 0)
				{
					if(self namespace_851dc78f::function_b690a849("specialty_vulture"))
					{
						self.var_d7ed2a7d = self.var_d7ed2a7d - 0.2;
					}
					else
					{
						self.var_d7ed2a7d = self.var_d7ed2a7d - 1;
					}
				}
				if(self.var_d7ed2a7d <= 0)
				{
					self zm_utility::decrement_ignoreme();
					self.var_d7ed2a7d = undefined;
					self.var_590a125d destroy();
					self thread namespace_4b6e359c::function_75aa16e4("specialty_vulture", "vulture", "overlayStyleGreen", 0);
					self playsoundtoplayer("vulture_aid_stink_stop", self);
					self StopLoopSound();
				}
				if(isdefined(self.var_590a125d))
				{
					self.var_590a125d.alpha = self.var_d7ed2a7d / 10;
				}
			}
		}
		else if(isdefined(self.var_d7ed2a7d))
		{
			self zm_utility::decrement_ignoreme();
		}
		self.var_d7ed2a7d = undefined;
		if(isdefined(self.var_590a125d))
		{
			self.var_590a125d destroy();
			self thread namespace_4b6e359c::function_75aa16e4("specialty_vulture", "vulture", "perk_icon_green_glow", 0);
		}
		wait(0.1);
	}
}

