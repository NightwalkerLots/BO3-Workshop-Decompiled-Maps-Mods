#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_util_shared;
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
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_ab667430;

/*
	Name: __init__sytem__
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x910
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 48
*/
function autoexec __init__sytem__()
{
	system::register("DA_TOMBSTONE", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x950
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function __init__()
{
	function_1a92256e();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1a92256e
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x970
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_da_tombstone", "customperk", 2000, &"ZM_REAP_MOD_PERK_TOMBSTONE", GetWeapon("zombie_perk_bottle_da_tombstone"));
	zm_perks::register_perk_precache_func("specialty_da_tombstone", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_da_tombstone", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_da_tombstone", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_da_tombstone", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_da_tombstone", "Tombstone Soda", "tombstone_da_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_da_tombstone", &"ZM_REAP_MOD_PERK_TOMBSTONE_DB", 2000, "Tombstone Soda", "da_tombstone");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_da_tombstone"] = 1;
	callback::on_spawned(&on_player_spawned);
	return;
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0xB30
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 108
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_da_tombstone"] = spawnstruct();
	level.machine_assets["specialty_da_tombstone"].weapon = GetWeapon("zombie_perk_bottle_da_tombstone");
	level.machine_assets["specialty_da_tombstone"].off_model = "cz_zombie_vending_da_tombstone_off";
	level.machine_assets["specialty_da_tombstone"].on_model = "cz_zombie_vending_da_tombstone";
}

/*
	Name: function_19157aff
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0xBD8
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 126
*/
function function_19157aff()
{
	visionset_mgr::register_info("visionset", "zm_tombstone", 1, 100, 31, 1, &visionset_mgr::ramp_in_out_thread_per_player, 1);
	visionset_mgr::register_info("overlay", "zm_tombstone_blur", 1, 24, 30, 1, &visionset_mgr::ramp_in_out_thread_per_player, 1);
	clientfield::register("clientuimodel", "player_tombstone", 1, 1, "int");
}

/*
	Name: function_99c1452c
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0xCA8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 143
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_da_tombstone", "da_tombstone", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0xCF0
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 158
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_tombstone_jingle";
	use_trigger.script_string = "specialty_da_tombstone";
	use_trigger.script_label = "mus_perks_tombstone_sting";
	use_trigger.target = "Tombstone Soda";
	perk_machine.script_string = "specialty_da_tombstone";
	perk_machine.targetname = "Tombstone Soda";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_da_tombstone";
		return;
	}
	bump_trigger.var_0 = undefined;
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0xDB8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 184
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_da_tombstone"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_da_tombstone"] = 1;
	return;
}

/*
	Name: function_b4722825
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0xE40
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 213
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_da_tombstone"] = 0;
	self.var_b5c2c258["specialty_da_tombstone"] = undefined;
	self.var_d6aef449["specialty_da_tombstone"] = undefined;
}

/*
	Name: function_1275e2ff
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0xEA0
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 230
*/
function function_1275e2ff()
{
	if(isdefined(self.beastmode) && self.beastmode || self GetCurrentWeapon().name == "zombie_beast_grapple_dwr")
	{
		return 0;
	}
	if(!self zm_magicbox::can_buy_weapon() || self zm_utility::has_powerup_weapon())
	{
		return 0;
	}
	if(self bgb::is_enabled("zm_bgb_disorderly_combat") && (!isdefined(self.var_bc4459b1) || (isdefined(self.var_bc4459b1) && GetTime() >= self.var_bc4459b1 + 1)))
	{
		self.var_bc4459b1 = GetTime();
		return 0;
	}
	if(self IsSwitchingWeapons())
	{
		return 0;
	}
	if(isdefined(self.var_97c73248))
	{
		return 0;
	}
	return 1;
}

/*
	Name: on_player_spawned
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0xFB0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 266
*/
function on_player_spawned()
{
	self thread function_809cc120();
	self thread function_7c5b2a58();
	self thread function_ef8f2cab();
	self thread function_fd04e42d();
}

/*
	Name: function_809cc120
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x1020
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 284
*/
function function_809cc120()
{
	self endon("disconnect");
	self notify("hash_809cc120");
	self endon("hash_809cc120");
	self.var_b88a074c = [];
	while(1)
	{
		self util::waittill_any("fake_death", "death", "player_downed", "weapon_change_complete");
		primaryWeapons = self getweaponslistprimaries();
		if(!self laststand::player_is_in_laststand() && !isdefined(self.var_59c285cf))
		{
			self.var_b88a074c = [];
			for(i = 0; i < primaryWeapons.size; i++)
			{
				self.var_b88a074c[self.var_b88a074c.size] = primaryWeapons[i];
			}
		}
		wait(1);
	}
}

/*
	Name: function_7c5b2a58
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x1140
	Size: 0x270
	Parameters: 0
	Flags: None
	Line Number: 316
*/
function function_7c5b2a58()
{
	self endon("disconnect");
	self notify("hash_7c5b2a58");
	self endon("hash_7c5b2a58");
	if(!isdefined(self.var_69d36a2c))
	{
		self.var_69d36a2c = [];
	}
	while(1)
	{
		self util::waittill_any("perk_purchased", "burp", "fake_death", "death", "player_downed", "perk_acquired");
		if(!isdefined(self.perks_active))
		{
			self.perks_active = [];
		}
		if(self.perks_active.size > 0)
		{
			for(i = 0; i < self.perks_active.size; i++)
			{
				perk = self.perks_active[i];
				if(perk == "specialty_da_tombstone")
				{
					continue;
				}
				has_perk = namespace_851dc78f::function_20dc5a15(perk) && self namespace_851dc78f::function_5f9a13b3(perk) || (!namespace_851dc78f::function_20dc5a15(perk) && self hasPerk(perk));
				if(has_perk && !IsInArray(self.var_69d36a2c, perk))
				{
					if(!isdefined(self.var_69d36a2c))
					{
						self.var_69d36a2c = [];
					}
					else if(!IsArray(self.var_69d36a2c))
					{
						self.var_69d36a2c = Array(self.var_69d36a2c);
					}
					self.var_69d36a2c[self.var_69d36a2c.size] = perk;
					continue;
				}
				if(!has_perk && IsInArray(self.var_69d36a2c, perk))
				{
					ArrayRemoveValue(self.var_69d36a2c, perk, 0);
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_fd04e42d
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x13B8
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 375
*/
function function_fd04e42d()
{
	self endon("disconnect");
	self notify("hash_6642bcf0");
	self endon("hash_6642bcf0");
	while(1)
	{
		if(self namespace_851dc78f::function_5f9a13b3("specialty_da_tombstone"))
		{
			if(!(self hasPerk("specialty_quickrevive") && zm_perks::use_solo_revive()))
			{
				if(!self hasPerk("specialty_whoswho"))
				{
					self setPerk("specialty_whoswho");
				}
				level.whoswho_laststand_func = &function_1392349;
				if(!isdefined(self.lives) || self.lives < 1)
				{
					self.lives = 1;
				}
			}
			else if(self hasPerk("specialty_whoswho"))
			{
				self unsetPerk("specialty_whoswho");
			}
			level.whoswho_laststand_func = undefined;
			self.var_60ebed9e = 1;
			if(self namespace_851dc78f::function_b690a849("specialty_da_tombstone"))
			{
				self.var_60ebed9e = 2;
			}
		}
		else if(!self laststand::player_is_in_laststand() && !isdefined(self.var_59c285cf))
		{
			if(self hasPerk("specialty_whoswho"))
			{
				self unsetPerk("specialty_whoswho");
			}
			level.whoswho_laststand_func = undefined;
			self.var_60ebed9e = undefined;
		}
		wait(1);
	}
}

/*
	Name: function_ef8f2cab
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x15D8
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 430
*/
function function_ef8f2cab()
{
	self endon("disconnect");
	self notify("hash_ef8f2cab");
	self endon("hash_ef8f2cab");
	while(1)
	{
		self waittill("player_downed");
		if(isdefined(self.var_59c285cf))
		{
			thread visionset_mgr::deactivate("visionset", "zm_tombstone", self);
			thread visionset_mgr::deactivate("overlay", "zm_tombstone_blur", self);
			self clientfield::set_player_uimodel("player_tombstone", 0);
			if(GetPlayers().size > 1)
			{
				self.bleedout_time = 0;
			}
		}
		else if(isdefined(self.var_60ebed9e))
		{
			self thread function_4696d273(self.var_60ebed9e);
			self thread function_50f23dee();
		}
		wait(0.05);
	}
}

/*
	Name: function_b8493158
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x1700
	Size: 0x568
	Parameters: 1
	Flags: None
	Line Number: 467
*/
function function_b8493158(var_66c0af4d)
{
	self endon("disconnect");
	fxOrg = spawn("script_model", self.origin + VectorScale((0, 0, 1), 30));
	fxOrg SetModel("cz_zombie_vending_da_tombstone_grave");
	fxOrg.angles = (0, 0, 0);
	fxOrg thread function_76b186ca();
	fxOrg thread function_73859cf3();
	fxOrg.var_69d36a2c = self.var_69d36a2c;
	fxOrg.var_b88a074c = self.var_b88a074c;
	result = self util::waittill_any_return("tombstone_cache_active", "tombstone_cache_destroy");
	if(result == "tombstone_cache_destroy")
	{
		wait(0.3);
		if(isdefined(fxOrg))
		{
			fxOrg delete();
			return;
		}
	}
	t_use = spawn("trigger_radius", fxOrg.origin, 0, 40, 130);
	t_use setcursorhint("HINT_NOICON");
	t_use.targetname = "tombstone_stash";
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] == self)
		{
			t_use setinvisibletoplayer(players[i], 0);
			continue;
		}
		t_use setinvisibletoplayer(players[i], 1);
	}
	t_use setHintString(&"ZM_REAP_MOD_PERK_TOMBSTONE_CACHE");
	fxOrg thread function_9fea1eba(self, t_use);
	while(isdefined(fxOrg) && isdefined(t_use))
	{
		t_use waittill("trigger", player);
		if(player == self && player zm_magicbox::can_buy_weapon() && !player zm_utility::has_powerup_weapon() && !player bgb::is_enabled("zm_bgb_disorderly_combat") && player useButtonPressed())
		{
			if(isdefined(fxOrg.var_69d36a2c) && fxOrg.var_69d36a2c.size > 0)
			{
				for(i = 0; i < fxOrg.var_69d36a2c.size; i++)
				{
					player thread zm_perks::give_perk(fxOrg.var_69d36a2c[i]);
				}
			}
			else if(isdefined(fxOrg.var_b88a074c) && fxOrg.var_b88a074c.size > 0)
			{
				primaryWeapons = player getweaponslistprimaries();
				for(i = 0; i < primaryWeapons.size; i++)
				{
					if(zm_weapons::is_weapon_included(primaryWeapons[i]) || zm_weapons::is_weapon_upgraded(primaryWeapons[i]))
					{
						player TakeWeapon(primaryWeapons[i]);
					}
				}
				wait(0.1);
				while(!player function_1275e2ff())
				{
					wait(0.1);
				}
				for(i = 0; i < fxOrg.var_b88a074c.size; i++)
				{
					weap = player zm_weapons::weapon_give(fxOrg.var_b88a074c[i]);
					player SwitchToWeaponImmediate(weap);
				}
			}
			fxOrg delete();
		}
		wait(0.1);
	}
	t_use delete();
}

/*
	Name: function_9fea1eba
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x1C70
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 552
*/
function function_9fea1eba(player, trig)
{
	player util::waittill_any_timeout(300, "disconnect", "tombstone_cache_destroy", "end_game");
	if(isdefined(self))
	{
		self delete();
	}
	if(isdefined(trig))
	{
		trig delete();
	}
}

/*
	Name: function_76b186ca
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x1D00
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 575
*/
function function_76b186ca()
{
	while(isdefined(self))
	{
		self RotateYaw(360, 6);
		wait(5.9);
	}
}

/*
	Name: function_73859cf3
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x1D40
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 594
*/
function function_73859cf3()
{
	while(isdefined(self))
	{
		self moveto((self.origin[0], self.origin[1], self.origin[2] - 10), 2, 0.5, 0.5);
		self waittill("movedone");
		if(isdefined(self))
		{
			self moveto((self.origin[0], self.origin[1], self.origin[2] + 10), 2, 0.5, 0.5);
			self waittill("movedone");
		}
	}
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_4696d273
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x1E30
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 621
*/
function function_4696d273(var_66c0af4d)
{
	self endon("disconnect");
	if(!isdefined(self.var_96a7943e))
	{
		self.var_96a7943e = namespace_851dc78f::function_122a9928("center", "top", "center", "top", 0, 150, 1, (1, 1, 1), &"ZM_REAP_MOD_PERK_TOMBSTONE_BLEEDOUT", 1.5);
		return;
	}
	else
	{
	}
	HOLD_TIME = 0;
	progressbar = undefined;
	while(self laststand::player_is_in_laststand())
	{
		if(self useButtonPressed())
		{
			HOLD_TIME = HOLD_TIME + 0.1;
		}
		else
		{
			HOLD_TIME = 0;
		}
		wait(0.1);
		if(HOLD_TIME > 0 && !isdefined(progressbar))
		{
			progressbar = self hud::createPrimaryProgressBar();
			progressbar hud::updateBar(0.01, 1);
		}
		else if(isdefined(progressbar) && HOLD_TIME == 0)
		{
			progressbar hud::destroyElem();
		}
		if(HOLD_TIME >= 1)
		{
			self thread function_e78fc8d5(var_66c0af4d);
			break;
		}
	}
	if(isdefined(self.var_96a7943e))
	{
		self.var_96a7943e destroy();
	}
	if(isdefined(progressbar))
	{
		progressbar hud::destroyElem();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1392349
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x2030
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 682
*/
function function_1392349()
{
	var_66c0af4d = self.var_60ebed9e;
	self endon("disconnect");
	self thread function_50f23dee();
	self zm_laststand::increment_downed_stat();
	self notify("fake_death");
	self SetStance("prone");
	wait(1);
	self thread function_e78fc8d5(var_66c0af4d);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e78fc8d5
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x20D0
	Size: 0x890
	Parameters: 1
	Flags: None
	Line Number: 706
*/
function function_e78fc8d5(var_66c0af4d)
{
	self endon("disconnect");
	self endon("hash_6179c72");
	self endon("death");
	self endon("bled_out");
	self notify("hash_306d1425");
	if(isdefined(self.var_59c285cf) && self.var_59c285cf)
	{
		return;
	}
	self namespace_851dc78f::function_c65ada05("specialty_da_tombstone");
	self SetStance("stand");
	self.ignore_insta_kill = 1;
	self.health = 1;
	self Hide();
	self.var_59c285cf = 1;
	if(self hasPerk("specialty_whoswho"))
	{
		self unsetPerk("specialty_whoswho");
	}
	if(var_66c0af4d == 2)
	{
		self thread function_b8493158(var_66c0af4d);
		if(isdefined(self.var_69d36a2c) && self.var_69d36a2c.size > 0)
		{
			for(i = 0; i < self.var_69d36a2c.size; i++)
			{
				if(self.var_69d36a2c[i] != "specialty_da_tombstone")
				{
					self thread zm_perks::give_perk(self.var_69d36a2c[i]);
				}
			}
		}
	}
	self.var_60ebed9e = undefined;
	model = spawn("script_model", self.origin);
	model.angles = self.angles;
	model.IsActor = 0;
	model SetModel(self GetCharacterBodyModel());
	Headmodel = self GetCharacterHeadModel();
	if(isdefined(Headmodel))
	{
		model Attach(Headmodel);
	}
	helmetModel = self GetCharacterHelmetModel();
	if(isdefined(helmetModel))
	{
		model Attach(helmetModel);
	}
	model.owner = self;
	model useanimtree(-1);
	model AnimScripted("pb_laststand_idle", model.origin, model.angles, %pb_laststand_idle);
	model.targetname = "tombstone_downed_player";
	playsoundatposition("zmb_bgb_abh_teleport_out", self.origin);
	self FreezeControls(1);
	self zm_laststand::auto_revive(self);
	var_2620d692 = self namespace_851dc78f::function_7d15591a("left", "top", "fullscreen", "fullscreen", 0, 0, 1, "white", 640, 480, (0, 0, 0), 5);
	wait(0.1);
	self playsound("zmb_bgb_abh_teleport_in");
	zm_utility::increment_ignoreme();
	var_68140f76 = self move_away_from_edges();
	self SetVelocity((0, 0, 0));
	if(isdefined(var_68140f76))
	{
		self SetOrigin(var_68140f76);
	}
	wait(0.5);
	self.ignore_insta_kill = undefined;
	playFX(level._effect["teleport_splash"], self.origin);
	playFX(level._effect["teleport_aoe"], self.origin);
	self FreezeControls(0);
	self show();
	var_2620d692 destroy();
	thread visionset_mgr::activate("overlay", "zm_tombstone_blur", self, 0.5, &function_59ec746, 0.5);
	thread visionset_mgr::activate("visionset", "zm_tombstone", self, 0.5, &function_59ec746, 0.5);
	self clientfield::set_player_uimodel("player_tombstone", 1);
	wait(0.5);
	zm_utility::decrement_ignoreme();
	model thread function_a4f1459f(self, var_66c0af4d);
	bleedout_time = GetDvarFloat("player_lastStandBleedoutTime");
	if(isdefined(self.n_bleedout_time_multiplier))
	{
		bleedout_time = bleedout_time * self.n_bleedout_time_multiplier;
	}
	bleedout_time = bleedout_time - 1;
	bleedout_time = Int(bleedout_time);
	self.var_c14187ca = namespace_851dc78f::function_122a9928("right", "bottom", "center", "bottom", -20, -50, 1, (1, 1, 1), undefined, 1.5, undefined, 1);
	self.var_64a8c46c = namespace_851dc78f::function_122a9928("left", "bottom", "center", "bottom", -16, -50, 1, (1, 1, 1), "SECONDS LEFT", 1.5);
	self.var_c14187ca setValue(bleedout_time);
	while(bleedout_time > 0)
	{
		wait(1);
		bleedout_time = bleedout_time - 1;
		self.var_c14187ca setValue(bleedout_time);
	}
	self notify("hash_469f72e5");
	thread visionset_mgr::deactivate("visionset", "zm_tombstone", self);
	thread visionset_mgr::deactivate("overlay", "zm_tombstone_blur", self);
	self clientfield::set_player_uimodel("player_tombstone", 0);
	wait(0.05);
	self DisableInvulnerability();
	self DoDamage(self.health + 1000, self.origin);
	wait(0.05);
	if(GetPlayers().size > 1)
	{
		self.bleedout_time = 0;
	}
}

/*
	Name: function_59ec746
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x2968
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 826
*/
function function_59ec746()
{
	self endon("death");
	self endon("disconnect");
	self endon("hash_6179c72");
	while(isdefined(self.var_59c285cf) && self.var_59c285cf)
	{
		wait(0.05);
	}
}

/*
	Name: function_a4f1459f
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x29C0
	Size: 0x738
	Parameters: 2
	Flags: None
	Line Number: 847
*/
function function_a4f1459f(player, var_66c0af4d)
{
	self endon("disconnect");
	self endon("hash_469f72e5");
	self endon("bled_out");
	self.team = player.team;
	self thread zm_laststand::revive_trigger_spawn();
	var_5b5817a8 = NewHudElem();
	self.var_b3b2e36c = var_5b5817a8;
	var_5b5817a8.x = self.origin[0];
	var_5b5817a8.y = self.origin[1];
	var_5b5817a8.z = self.origin[2] + 30;
	var_5b5817a8.alpha = 1;
	var_5b5817a8.archived = 1;
	var_5b5817a8 SetShader("tombstone_revive_icon", 5, 5);
	var_5b5817a8 setWaypoint(1);
	var_5b5817a8.hidewheninmenu = 1;
	var_5b5817a8.immunetodemogamehudsettings = 1;
	self thread function_5d201b3e(player);
	self waittill("stop_revive_trigger");
	var_2620d692 = player namespace_851dc78f::function_7d15591a("left", "top", "fullscreen", "fullscreen", 0, 0, 1, "white", 640, 480, (0, 0, 0), 5);
	player SetVelocity((0, 0, 0));
	player SetOrigin(self.origin);
	player FreezeControls(1);
	wait(0.1);
	player FreezeControls(0);
	thread visionset_mgr::deactivate("visionset", "zm_tombstone", player);
	thread visionset_mgr::deactivate("overlay", "zm_tombstone_blur", player);
	player clientfield::set_player_uimodel("player_tombstone", 0);
	player.var_59c285cf = undefined;
	player notify("hash_c9fd4a02");
	var_2620d692 destroy();
	player notify("hash_6179c72");
	player notify("player_revived");
	var_d484651 = undefined;
	if(isdefined(player.var_69d36a2c) && player.var_69d36a2c.size > 0)
	{
		for(i = 0; i < player.var_69d36a2c.size; i++)
		{
			if(namespace_851dc78f::function_20dc5a15(player.var_69d36a2c[i]) && player namespace_851dc78f::function_5f9a13b3(player.var_69d36a2c[i]) || (!namespace_851dc78f::function_20dc5a15(player.var_69d36a2c[i]) && player hasPerk(player.var_69d36a2c[i])))
			{
				player namespace_851dc78f::function_c65ada05(player.var_69d36a2c[i]);
			}
			if(player.var_69d36a2c[i] == "specialty_additionalprimaryweapon")
			{
				var_c63cb7e3 = [];
				primaryWeapons = player getweaponslistprimaries();
				for(i = 0; i < primaryWeapons.size; i++)
				{
					if(zm_weapons::is_weapon_included(primaryWeapons[i]) || zm_weapons::is_weapon_upgraded(primaryWeapons[i]))
					{
						var_c63cb7e3[var_c63cb7e3.size] = primaryWeapons[i];
					}
				}
				for(i = 0; i < var_c63cb7e3.size; i++)
				{
					if(i == 0)
					{
						player SwitchToWeapon(var_c63cb7e3[i]);
					}
					if(i > 1)
					{
						var_d484651 = var_c63cb7e3[i];
						player TakeWeapon(var_c63cb7e3[i]);
					}
				}
			}
		}
		wait(0.1);
		var_73868ade = 0;
		var_2e746e85 = 4;
		if(var_66c0af4d == 2)
		{
			var_2e746e85 = player.var_69d36a2c.size;
			if(var_2e746e85 < 8)
			{
				var_2e746e85 = 8;
			}
		}
		for(i = 0; i < player.var_69d36a2c.size; i++)
		{
			if(isdefined(player.var_69d36a2c[i]))
			{
				if(player.var_69d36a2c[i] != "specialty_da_tombstone" && var_73868ade < var_2e746e85)
				{
					var_73868ade++;
					player zm_perks::give_perk(player.var_69d36a2c[i]);
					if(isdefined(var_d484651) && player.var_69d36a2c[i] == "specialty_additionalprimaryweapon")
					{
						weap = player zm_weapons::weapon_give(var_d484651);
					}
				}
			}
		}
	}
	player.var_69d36a2c = undefined;
}

/*
	Name: function_5d201b3e
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x3100
	Size: 0x178
	Parameters: 1
	Flags: None
	Line Number: 955
*/
function function_5d201b3e(player)
{
	result = player util::waittill_any_return("disconnect", "tombstone_bleedout", "tombstone_revive", "death", "bled_out");
	wait(0.1);
	if(result == "tombstone_revive")
	{
		self thread zm_laststand::auto_revive(self, 0);
	}
	player notify("player_revived");
	self notify("player_revived");
	self.reviveTrigger delete();
	self.reviveTrigger = undefined;
	self.var_b3b2e36c destroy();
	self.var_b3b2e36c = undefined;
	self delete();
	if(isdefined(player) && isdefined(player.var_c14187ca))
	{
		player.var_c14187ca hud::destroyElem();
	}
	if(isdefined(player) && isdefined(player.var_64a8c46c))
	{
		player.var_64a8c46c hud::destroyElem();
	}
}

/*
	Name: move_away_from_edges
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x3280
	Size: 0x338
	Parameters: 0
	Flags: None
	Line Number: 990
*/
function move_away_from_edges()
{
	var_3e6b2307 = undefined;
	v_orig = self.origin;
	n_z_correct = 0;
	queryResult = PositionQuery_Source_Navigation(self.origin, 500, 3000, Int(1500), 2, 10);
	if(queryResult.data.size)
	{
		queryResult.data = Array::randomize(queryResult.data);
		foreach(point in queryResult.data)
		{
			if(BulletTracePassed(point.origin + VectorScale((0, 0, 1), 20), v_orig + VectorScale((0, 0, 1), 20), 0, self, undefined, 0, 0))
			{
				if(self.origin[2] > queryResult.origin[2])
				{
					n_z_correct = self.origin[2] - queryResult.origin[2];
				}
				test_ent = spawn("script_model", point.origin + (0, 0, n_z_correct));
				test_ent SetModel("tag_origin");
				if(test_ent zm::in_enabled_playable_area())
				{
					var_3e6b2307 = point.origin + (0, 0, n_z_correct);
					test_ent delete();
					break;
				}
				test_ent delete();
				wait(0.05);
			}
		}
	}
	else if(isdefined(var_3e6b2307))
	{
		return var_3e6b2307;
	}
	else
	{
		new_origin = undefined;
		if(isdefined(level.check_valid_spawn_override))
		{
			new_origin = [[level.check_valid_spawn_override]](self);
		}
		if(!isdefined(new_origin))
		{
			new_origin = zm::check_for_valid_spawn_near_team(self, 1);
		}
		if(isdefined(new_origin))
		{
			return new_origin.origin;
		}
	}
	return var_3e6b2307;
}

/*
	Name: function_50f23dee
	Namespace: namespace_ab667430
	Checksum: 0x424F4353
	Offset: 0x35C0
	Size: 0x166
	Parameters: 0
	Flags: None
	Line Number: 1053
*/
function function_50f23dee()
{
	self endon("disconnect");
	result = self util::waittill_any_return("bled_out", "tombstone_revive", "death");
	self.var_59c285cf = undefined;
	thread visionset_mgr::deactivate("visionset", "zm_tombstone", self);
	thread visionset_mgr::deactivate("overlay", "zm_tombstone_blur", self);
	self clientfield::set_player_uimodel("player_tombstone", 0);
	if(result == "bled_out")
	{
		wait(2);
		num = level.zombie_total;
		for(num = num + zombie_utility::get_current_zombie_count(); num > 3; num = num + zombie_utility::get_current_zombie_count())
		{
			wait(0.05);
			num = level.zombie_total;
		}
		self zm::spectator_respawn_player();
		self notify("hash_5876f312", num + zombie_utility::get_current_zombie_count());
		else
		{
		}
	}
}

