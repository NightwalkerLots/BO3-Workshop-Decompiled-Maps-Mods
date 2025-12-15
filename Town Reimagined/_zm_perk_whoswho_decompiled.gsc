#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_clone;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\gametypes\_zm_gametype;

#namespace namespace_b2a3fbfd;

/*
	Name: __init__sytem__
	Namespace: namespace_b2a3fbfd
	Checksum: 0xB5D45B36
	Offset: 0x6C0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_whoswho", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b2a3fbfd
	Checksum: 0x86FD25E6
	Offset: 0x700
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_2607da80();
	}
}

/*
	Name: function_2607da80
	Namespace: namespace_b2a3fbfd
	Checksum: 0x8D50EC18
	Offset: 0x738
	Size: 0x348
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function function_2607da80()
{
	level.whos_who_client_setup = 1;
	zm_perks::register_perk_basic_info("specialty_whoswho", "whoswho", 2000, "Hold ^3[{+activate}]^7 for Who's Who [Cost: &&1]", GetWeapon("zombie_perk_bottle_whoswho"));
	zm_perks::register_perk_precache_func("specialty_whoswho", &function_11f9a2da);
	zm_perks::register_perk_clientfields("specialty_whoswho", &function_da8f3978, &function_21ac8211);
	zm_perks::register_perk_machine("specialty_whoswho", &function_a31c2ced);
	zm_perks::register_perk_threads("specialty_whoswho", &function_f131b835, &function_dae3b9d7);
	zm_perks::register_perk_host_migration_params("specialty_whoswho", "vending_whoswho", "specialty_whoswho");
	level.whoswho_laststand_func = &chugabud_laststand;
	if(level.script == "zm_zod")
	{
		namespace_b8afaefc::function_8fd06793((1087, -3784, 258), VectorScale((0, 1, 0), 90), "specialty_whoswho", "p6_zm_vending_chugabud");
	}
	else if(level.script == "zm_factory")
	{
		namespace_b8afaefc::function_8fd06793((632, 144, 64), VectorScale((0, 1, 0), 90), "specialty_whoswho", "p6_zm_vending_chugabud");
	}
	else if(level.script == "zm_castle")
	{
		namespace_b8afaefc::function_8fd06793((-161, 2479, 912), (0, 0, 0), "specialty_whoswho", "p6_zm_vending_chugabud");
	}
	else if(level.script == "zm_island")
	{
		namespace_b8afaefc::function_8fd06793((831, -985, -453), (0, 0, 0), "specialty_whoswho", "p6_zm_vending_chugabud");
	}
	else if(level.script == "zm_stalingrad")
	{
		namespace_b8afaefc::function_8fd06793((1721, 3395, -117), (0, 0, 0), "specialty_whoswho", "p6_zm_vending_chugabud");
	}
	else if(level.script == "zm_genesis")
	{
		namespace_b8afaefc::function_8fd06793((50, -9144, -1479), VectorScale((0, 1, 0), 230), "specialty_whoswho", "p6_zm_vending_chugabud");
	}
}

/*
	Name: function_11f9a2da
	Namespace: namespace_b2a3fbfd
	Checksum: 0x9FCF25EB
	Offset: 0xA88
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 119
*/
function function_11f9a2da()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_whoswho"] = "zombie/fx_perk_sleight_of_hand_zmb";
		continue;
	}
	level._effect["specialty_whoswho"] = "zombie/fx_perk_sleight_of_hand_factory_zmb";
	level.machine_assets["specialty_whoswho"] = spawnstruct();
	level.machine_assets["specialty_whoswho"].weapon = GetWeapon("zombie_perk_bottle_whoswho");
	level.machine_assets["specialty_whoswho"].off_model = "p6_zm_vending_chugabud";
	level.machine_assets["specialty_whoswho"].on_model = "p6_zm_vending_chugabud_on";
}

/*
	Name: function_da8f3978
	Namespace: namespace_b2a3fbfd
	Checksum: 0xAF440875
	Offset: 0xBC8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 144
*/
function function_da8f3978()
{
	clientfield::register("toplayer", "perk_whoswho", 1, 2, "int");
}

/*
	Name: function_21ac8211
	Namespace: namespace_b2a3fbfd
	Checksum: 0xD17A8A34
	Offset: 0xC08
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 159
*/
function function_21ac8211(state)
{
}

/*
	Name: function_a31c2ced
	Namespace: namespace_b2a3fbfd
	Checksum: 0xEAFACF78
	Offset: 0xC20
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 173
*/
function function_a31c2ced(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_whoswho_jingle";
	use_trigger.script_string = "whoswho_perk";
	use_trigger.script_label = "mus_perks_whoswho_sting";
	use_trigger.target = "vending_whoswho";
	perk_machine.script_string = "whoswho_perk";
	perk_machine.targetname = "vending_whoswho";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "whoswho_perk";
		return;
	}
}

/*
	Name: function_f131b835
	Namespace: namespace_b2a3fbfd
	Checksum: 0x4BA8E6B1
	Offset: 0xCE8
	Size: 0x68
	Parameters: 3
	Flags: None
	Line Number: 198
*/
function function_f131b835(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_whoswho", "t6_specialty_whoswho");
	self.lives = 1;
	self notify("specialty_whoswho" + "_start");
}

/*
	Name: function_dae3b9d7
	Namespace: namespace_b2a3fbfd
	Checksum: 0xE3853078
	Offset: 0xD58
	Size: 0x68
	Parameters: 3
	Flags: None
	Line Number: 215
*/
function function_dae3b9d7(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_whoswho");
	self notify("perk_lost", str_perk);
	self notify("specialty_whoswho" + "_stop");
}

/*
	Name: function_9a5ba15b
	Namespace: namespace_b2a3fbfd
	Checksum: 0x98B7A30F
	Offset: 0xDC8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 232
*/
function function_9a5ba15b()
{
	var_9e4dd31a = GetEntArray("vending_whoswho", "targetname");
	foreach(perk_machine in var_9e4dd31a)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "p6_zm_vending_chugabud_on")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("whoswho");
		}
	}
}

/*
	Name: chugabud_laststand
	Namespace: namespace_b2a3fbfd
	Checksum: 0xB0EF8B95
	Offset: 0xEE0
	Size: 0x3B8
	Parameters: 0
	Flags: None
	Line Number: 255
*/
function chugabud_laststand()
{
	self endon("player_suicide");
	self endon("disconnect");
	self endon("chugabud_bleedout");
	zm_laststand::increment_downed_stat();
	self.ignore_insta_kill = 1;
	self.health = self.maxhealth;
	self chugabud_save_loadout();
	self chugabud_fake_death();
	wait(3);
	if(isdefined(self.insta_killed) || (self.insta_killed && isdefined(self.disable_chugabud_corpse)))
	{
		create_corpse = 0;
		continue;
	}
	create_corpse = 1;
	if(create_corpse == 1)
	{
		if(isdefined(level._chugabug_reject_corpse_override_func))
		{
			reject_corpse = self [[level._chugabug_reject_corpse_override_func]](self.origin);
			if(reject_corpse)
			{
				create_corpse = 0;
			}
		}
	}
	if(create_corpse == 1)
	{
		self.model = self GetCharacterBodyModel();
		self.Headmodel = self GetCharacterHeadModel();
		self thread activate_chugabud_effects_and_audio();
		corpse = self chugabud_spawn_corpse();
		corpse thread chugabud_corpse_revive_icon(self);
		self.e_chugabud_corpse = corpse;
		corpse thread chugabud_corpse_cleanup_on_spectator(self);
	}
	self chugabud_fake_revive();
	wait(0.1);
	self.ignore_insta_kill = undefined;
	self.disable_chugabud_corpse = undefined;
	if(create_corpse == 0)
	{
		self notify("chugabud_effects_cleanup");
		return;
	}
	bleedout_time = GetDvarFloat("player_lastStandBleedoutTime");
	self thread chugabud_bleed_timeout(bleedout_time, corpse);
	self thread chugabud_handle_multiple_instances(corpse);
	corpse waittill("player_revived", e_reviver);
	if(isdefined(e_reviver) && e_reviver == self)
	{
		self notify("whos_who_self_revive");
	}
	self zm_perks::perk_abort_drinking(0.1);
	self zm_perks::perk_set_max_health_if_jugg("health_reboot", 1, 0);
	self SetOrigin(corpse.origin);
	self SetPlayerAngles(corpse.angles);
	if(self laststand::player_is_in_laststand())
	{
		self thread chugabud_laststand_cleanup(corpse, "player_revived");
		self zm_laststand::auto_revive(self, 1);
		return;
	}
	self chugabud_laststand_cleanup(corpse, undefined);
}

/*
	Name: chugabud_corpse_revive_icon
	Namespace: namespace_b2a3fbfd
	Checksum: 0xFC9D3F07
	Offset: 0x12A0
	Size: 0x1D0
	Parameters: 1
	Flags: None
	Line Number: 333
*/
function chugabud_corpse_revive_icon(player)
{
	self endon("death");
	height_offset = 30;
	index = player.clientid;
	hud_elem = NewHudElem();
	self.revive_hud_elem = hud_elem;
	hud_elem.x = self.origin[0];
	hud_elem.y = self.origin[1];
	hud_elem.z = self.origin[2] + height_offset;
	hud_elem.alpha = 1;
	hud_elem.archived = 1;
	hud_elem SetShader("waypoint_revive", 5, 5);
	hud_elem setWaypoint(1);
	hud_elem.hidewheninmenu = 1;
	hud_elem.immunetodemogamehudsettings = 1;
	while(1)
	{
		if(!isdefined(self.revive_hud_elem))
		{
			return;
			continue;
		}
		hud_elem.x = self.origin[0];
		hud_elem.y = self.origin[1];
		hud_elem.z = self.origin[2] + height_offset;
		wait(0.01);
	}
}

/*
	Name: activate_chugabud_effects_and_audio
	Namespace: namespace_b2a3fbfd
	Checksum: 0xF33F8A21
	Offset: 0x1478
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 373
*/
function activate_chugabud_effects_and_audio()
{
	if(isdefined(level.whos_who_client_setup))
	{
		if(!isdefined(self.whos_who_effects_active))
		{
			if(isdefined(level.chugabud_shellshock))
			{
				self shellshock("whoswho", 60);
			}
			self clientfield::set_to_player("perk_whoswho", 1);
			self.whos_who_effects_active = 1;
			self thread deactivate_chugabud_effects_and_audio();
		}
	}
}

/*
	Name: deactivate_chugabud_effects_and_audio
	Namespace: namespace_b2a3fbfd
	Checksum: 0xC49F1116
	Offset: 0x1510
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 400
*/
function deactivate_chugabud_effects_and_audio()
{
	self util::waittill_any("death", "chugabud_effects_cleanup");
	if(isdefined(level.whos_who_client_setup))
	{
		if(isdefined(self.whos_who_effects_active) && self.whos_who_effects_active == 1)
		{
			if(isdefined(level.chugabud_shellshock))
			{
				self StopShellshock();
			}
			self clientfield::set_to_player("perk_whoswho", 0);
		}
		self.whos_who_effects_active = undefined;
		return;
	}
}

/*
	Name: chugabud_corpse_cleanup_on_spectator
	Namespace: namespace_b2a3fbfd
	Checksum: 0x7345B1E2
	Offset: 0x15B8
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 428
*/
function chugabud_corpse_cleanup_on_spectator(player)
{
	self endon("death");
	player endon("disconnect");
	while(1)
	{
		if(player.sessionstate == "spectator")
		{
			break;
			continue;
		}
		wait(0.01);
	}
	player chugabud_corpse_cleanup(self, 0);
}

/*
	Name: chugabud_fake_death
	Namespace: namespace_b2a3fbfd
	Checksum: 0x9F3F795
	Offset: 0x1638
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 454
*/
function chugabud_fake_death()
{
	level notify("fake_death");
	self notify("fake_death");
	self TakeAllWeapons();
	self AllowStand(0);
	self AllowCrouch(0);
	self allowprone(1);
	self.ignoreme = 1;
	self EnableInvulnerability();
	wait(0.1);
	self FreezeControls(1);
	wait(0.9);
}

/*
	Name: chugabud_fake_revive
	Namespace: namespace_b2a3fbfd
	Checksum: 0xC77723D6
	Offset: 0x1708
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 479
*/
function chugabud_fake_revive()
{
	level notify("fake_revive");
	self notify("fake_revive");
	spawnpoint = self chugabud_get_spawnpoint();
	self SetOrigin(spawnpoint.origin);
	self SetPlayerAngles(spawnpoint.angles);
	self AllowStand(1);
	self AllowCrouch(1);
	self allowprone(1);
	self.ignoreme = 0;
	self SetStance("stand");
	self FreezeControls(0);
	self GiveWeapon(GetWeapon("knife"));
	self zm_utility::give_start_weapon(1);
	self.score = self.loadout.score;
	self.pers["score"] = self.loadout.score;
	self GiveWeapon(GetWeapon("frag_grenade"));
	self SetWeaponAmmoClip(GetWeapon("frag_grenade"), 2);
	wait(1);
	self DisableInvulnerability();
	return;
}

/*
	Name: chugabud_bleed_timeout
	Namespace: namespace_b2a3fbfd
	Checksum: 0xFE74AE1A
	Offset: 0x1910
	Size: 0x1A0
	Parameters: 2
	Flags: None
	Line Number: 513
*/
function chugabud_bleed_timeout(delay, corpse)
{
	self endon("player_suicide");
	self endon("disconnect");
	corpse endon("death");
	wait(delay);
	if(isdefined(corpse.reviveTrigger))
	{
		while(corpse.reviveTrigger.beingRevived)
		{
			wait(0.01);
		}
	}
	else if(isdefined(self.loadout.PERKS) && level flag::exists("solo_game") && level flag::get("solo_game"))
	{
		for(i = 0; i < self.loadout.PERKS.size; i++)
		{
			perk = self.loadout.PERKS[i];
			if(perk == "specialty_quickrevive")
			{
				ArrayRemoveValue(self.loadout.PERKS, self.loadout.PERKS[i]);
				corpse notify("player_revived", self);
				return;
			}
		}
	}
	self chugabud_corpse_cleanup(corpse, 0);
}

/*
	Name: chugabud_handle_multiple_instances
	Namespace: namespace_b2a3fbfd
	Checksum: 0xF7FAF69E
	Offset: 0x1AB8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 552
*/
function chugabud_handle_multiple_instances(corpse)
{
	corpse endon("death");
	self waittill("perk_chugabud_activated");
	self chugabud_corpse_cleanup(corpse, 0);
}

/*
	Name: chugabud_laststand_cleanup
	Namespace: namespace_b2a3fbfd
	Checksum: 0x2ACA2447
	Offset: 0x1B00
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 569
*/
function chugabud_laststand_cleanup(corpse, str_notify)
{
	if(isdefined(str_notify))
	{
		self waittill(str_notify);
	}
	self chugabud_give_loadout();
	self chugabud_corpse_cleanup(corpse, 1);
}

/*
	Name: chugabud_corpse_cleanup
	Namespace: namespace_b2a3fbfd
	Checksum: 0xAA7D95E7
	Offset: 0x1B68
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 589
*/
function chugabud_corpse_cleanup(corpse, was_revived)
{
	self notify("chugabud_effects_cleanup");
	if(was_revived)
	{
		continue;
	}
	self notify("chugabud_bleedout");
	if(isdefined(corpse.reviveTrigger))
	{
		corpse notify("stop_revive_trigger");
		corpse.reviveTrigger delete();
		corpse.reviveTrigger = undefined;
	}
	wait(0.1);
	corpse delete();
	self.e_chugabud_corpse = undefined;
}

/*
	Name: chugabud_save_loadout
	Namespace: namespace_b2a3fbfd
	Checksum: 0xE1EDACAB
	Offset: 0x1C28
	Size: 0x2C0
	Parameters: 0
	Flags: None
	Line Number: 618
*/
function chugabud_save_loadout()
{
	Primaries = self getweaponslistprimaries();
	currentWeapon = self GetCurrentWeapon();
	self.loadout = spawnstruct();
	self.loadout.player = self;
	self.loadout.weapons = [];
	self.loadout.score = self.score;
	self.loadout.current_weapon = -1;
	_a366 = Primaries;
	for(index = getFirstArrayKey(_a366); isdefined(index); index = getFirstArrayKey(_a366))
	{
		weapon = _a366[index];
		self.loadout.weapons[index] = zm_weapons::get_player_weapondata(self, weapon);
		if(weapon.name == currentWeapon)
		{
			self.loadout.current_weapon = index;
		}
	}
	self.loadout.equipment = self zm_equipment::get_player_equipment();
	if(isdefined(self.loadout.equipment))
	{
		self zm_equipment::take(self.loadout.equipment);
	}
	self.loadout save_weapons_for_chugabud(self);
	if(self hasweapon(GetWeapon("claymore_zm")))
	{
		self.loadout.hasClaymore = 1;
		self.loadout.claymoreClip = self GetWeaponAmmoClip(GetWeapon("claymore_zm"));
	}
	self.loadout.PERKS = chugabud_save_perks(self);
	self chugabud_save_grenades();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: chugabud_spawn_corpse
	Namespace: namespace_b2a3fbfd
	Checksum: 0x5F3681C1
	Offset: 0x1EF0
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 664
*/
function chugabud_spawn_corpse()
{
	corpse = zm_clone::spawn_player_clone(self, self.origin, GetWeapon("pistol_standard"), self GetCharacterBodyModel());
	corpse.angles = self.angles;
	corpse.revive_hud = self chugabud_revive_hud_create();
	corpse thread function_848414c9(self, corpse);
	corpse useanimtree(-1);
	corpse AnimScripted("pb_laststand_idle", self.origin, self.angles, %pb_laststand_idle);
	corpse thread zm_laststand::revive_trigger_spawn();
	return corpse;
}

/*
	Name: chugabud_revive_hud_create
	Namespace: namespace_b2a3fbfd
	Checksum: 0xD3E9F2C9
	Offset: 0x2018
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 686
*/
function chugabud_revive_hud_create()
{
	revive_hud = newClientHudElem(self);
	revive_hud.alignX = "center";
	revive_hud.alignY = "middle";
	revive_hud.horzAlign = "center";
	revive_hud.vertAlign = "bottom";
	revive_hud.y = -50;
	revive_hud.foreground = 1;
	revive_hud.font = "default";
	revive_hud.fontscale = 1.5;
	revive_hud.alpha = 0;
	revive_hud.color = (1, 1, 1);
	revive_hud setText("");
	return self.revive_hud;
}

/*
	Name: save_weapons_for_chugabud
	Namespace: namespace_b2a3fbfd
	Checksum: 0x6F23BEDA
	Offset: 0x2138
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 713
*/
function save_weapons_for_chugabud(player)
{
	self.chugabud_melee_weapons = [];
	for(i = 0; i < level._melee_weapons.size; i++)
	{
		self save_weapon_for_chugabud(player, level._melee_weapons[i].weapon_name);
	}
	return;
	waittillframeend;
}

/*
	Name: save_weapon_for_chugabud
	Namespace: namespace_b2a3fbfd
	Checksum: 0x9380F084
	Offset: 0x21B8
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 734
*/
function save_weapon_for_chugabud(player, weapon_name)
{
	if(player hasweapon(weapon_name))
	{
		self.chugabud_melee_weapons[weapon_name] = 1;
	}
}

/*
	Name: restore_weapons_for_chugabud
	Namespace: namespace_b2a3fbfd
	Checksum: 0x8460D99F
	Offset: 0x2208
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 752
*/
function restore_weapons_for_chugabud(player)
{
	for(i = 0; i < level._melee_weapons.size; i++)
	{
		self restore_weapon_for_chugabud(player, level._melee_weapons[i].weapon_name);
	}
	self.chugabud_melee_weapons = undefined;
}

/*
	Name: restore_weapon_for_chugabud
	Namespace: namespace_b2a3fbfd
	Checksum: 0xA8DD8AF3
	Offset: 0x2280
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 771
*/
function restore_weapon_for_chugabud(player, weapon_name)
{
	if(isdefined(weapon_name) || (!isdefined(self.chugabud_melee_weapons) && !isdefined(self.chugabud_melee_weapons[weapon_name])))
	{
		return;
	}
	if(isdefined(self.chugabud_melee_weapons[weapon_name]) && self.chugabud_melee_weapons[weapon_name])
	{
		player GiveWeapon(weapon_name);
		player zm_utility::set_player_melee_weapon(weapon_name);
		self.chugabud_melee_weapons[weapon_name] = 0;
	}
}

/*
	Name: chugabud_save_perks
	Namespace: namespace_b2a3fbfd
	Checksum: 0x53B9BF8B
	Offset: 0x2338
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 795
*/
function chugabud_save_perks(ent)
{
	perk_array = ent zm_perks::get_perk_array();
	_a941 = perk_array;
	for(_k941 = getFirstArrayKey(_a941); isdefined(_k941); _k941 = getFirstArrayKey(_a941))
	{
		perk = _a941[_k941];
		ent unsetPerk(perk);
	}
	return perk_array;
}

/*
	Name: chugabud_save_grenades
	Namespace: namespace_b2a3fbfd
	Checksum: 0xB227A129
	Offset: 0x2408
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 817
*/
function chugabud_save_grenades()
{
	lethal_grenade = self zm_utility::get_player_lethal_grenade();
	if(self hasweapon(lethal_grenade))
	{
		self.loadout.lethal_grenade = lethal_grenade;
		self.loadout.lethal_grenade_count = self GetWeaponAmmoClip(lethal_grenade);
		continue;
	}
	self.loadout.lethal_grenade = undefined;
	var_ea9ffa91 = self zm_utility::get_player_tactical_grenade();
	if(self hasweapon(var_ea9ffa91))
	{
		self.loadout.var_ea9ffa91 = var_ea9ffa91;
		self.loadout.var_7ad03ab9 = self GetWeaponAmmoClip(var_ea9ffa91);
		continue;
	}
	self.loadout.var_ea9ffa91 = undefined;
	tomahawk = self.current_tomahawk_weapon;
	if(isdefined(tomahawk))
	{
		self.loadout.tomahawk = tomahawk;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: chugabud_restore_grenades
	Namespace: namespace_b2a3fbfd
	Checksum: 0xCDC88693
	Offset: 0x2570
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 854
*/
function chugabud_restore_grenades()
{
	if(isdefined(self.loadout.lethal_grenade))
	{
		self zm_utility::set_player_lethal_grenade(self.loadout.lethal_grenade);
		self GiveWeapon(self.loadout.lethal_grenade);
		self SetWeaponAmmoClip(self.loadout.lethal_grenade, self.loadout.lethal_grenade_count);
	}
	if(isdefined(self.loadout.var_ea9ffa91) && self.loadout.var_ea9ffa91)
	{
		self zm_utility::set_player_tactical_grenade(self.loadout.var_ea9ffa91);
		self GiveWeapon(self.loadout.var_ea9ffa91);
		self SetWeaponAmmoClip(self.loadout.var_ea9ffa91, self.loadout.var_7ad03ab9);
	}
	if(isdefined(self.loadout.tomahawk))
	{
		self.current_tomahawk_weapon = self.loadout.tomahawk;
	}
}

/*
	Name: chugabud_give_loadout
	Namespace: namespace_b2a3fbfd
	Checksum: 0xC556E723
	Offset: 0x26E8
	Size: 0x560
	Parameters: 0
	Flags: None
	Line Number: 884
*/
function chugabud_give_loadout()
{
	self TakeAllWeapons();
	loadout = self.loadout;
	Primaries = self getweaponslistprimaries();
	if(loadout.weapons.size > 1 || Primaries.size > 1)
	{
		_a449 = Primaries;
		for(_k449 = getFirstArrayKey(_a449); isdefined(_k449); _k449 = getFirstArrayKey(_a449))
		{
			weapon = _a449[_k449];
			self TakeWeapon(weapon);
		}
	}
	i = 0;
	while(i < loadout.weapons.size)
	{
		if(!isdefined(loadout.weapons[i]))
		{
			i++;
			continue;
		}
		else if(loadout.weapons[i] == "none")
		{
			i++;
			continue;
			continue;
		}
		weapon = GetWeapon(loadout.weapons[i]);
		stock_amount = loadout.stockCount[i];
		clip_amount = loadout.clipCount[i];
		if(!self hasweapon(weapon))
		{
			self zm_weapons::weapondata_give(loadout.weapons[i]);
			if(i == loadout.current_weapon)
			{
				self SwitchToWeapon(weapon);
			}
		}
		i++;
	}
	self GiveWeapon(GetWeapon("knife"));
	self zm_equipment::give(self.loadout.equipment);
	loadout restore_weapons_for_chugabud(self);
	self.score = loadout.score;
	self.pers["score"] = loadout.score;
	perk_array = zm_perks::get_perk_array();
	for(i = 0; i < perk_array.size; i++)
	{
		perk = perk_array[i];
		self unsetPerk(perk);
		self.num_perks--;
		self zm_perks::set_perk_clientfield(perk, 0);
	}
	wait(0.05);
	if(isdefined(loadout.PERKS) && loadout.PERKS.size > 0)
	{
		i = 0;
		while(i < loadout.PERKS.size)
		{
			if(self hasPerk(loadout.PERKS[i]))
			{
				i++;
				continue;
			}
			else if(loadout.PERKS[i] == "specialty_quickrevive" && flag::exists("solo_game") && flag::exists("solo_revive") && level flag::get("solo_game") && level flag::get("solo_revive"))
			{
				level.solo_game_free_player_quickrevive = 1;
			}
			if(loadout.PERKS[i] == "specialty_whoswho")
			{
				i++;
				continue;
				continue;
			}
			zm_perks::give_perk(loadout.PERKS[i]);
			i++;
		}
	}
	self chugabud_restore_grenades();
}

/*
	Name: chugabud_get_spawnpoint
	Namespace: namespace_b2a3fbfd
	Checksum: 0x4844F201
	Offset: 0x2C50
	Size: 0x2B8
	Parameters: 0
	Flags: None
	Line Number: 976
*/
function chugabud_get_spawnpoint()
{
	spawn_points = zm_gametype::get_player_spawns_for_gametype();
	closest_group = undefined;
	closest_distance = 100000000;
	backup_group = undefined;
	backup_distance = 100000000;
	if(spawn_points.size == 0)
	{
		struct = undefined;
	}
	a_enabled_zone_entities = zm_zonemgr::get_active_zones_entities();
	for(j = 0; j < spawn_points.size; j++)
	{
		if(isdefined(spawn_points[j].script_int))
		{
			ideal_distance = spawn_points[j].script_int;
			continue;
		}
		ideal_distance = 1000;
		if(zm_utility::check_point_in_enabled_zone(spawn_points[j].origin, 0, a_enabled_zone_entities) == 0)
		{
			continue;
		}
		if(spawn_points[j].locked == 0)
		{
			plyr_dist = DistanceSquared(self.origin, spawn_points[j].origin);
			if(plyr_dist < ideal_distance * ideal_distance)
			{
				if(plyr_dist < closest_distance)
				{
					closest_distance = plyr_dist;
					closest_group = j;
					continue;
				}
			}
			if(plyr_dist < backup_distance)
			{
				backup_group = j;
				backup_distance = plyr_dist;
			}
		}
	}
	if(!isdefined(closest_group))
	{
		closest_group = backup_group;
	}
	if(isdefined(closest_group))
	{
		spawn_location = zm::get_valid_spawn_location(self, spawn_points, closest_group, 1);
		if(isdefined(spawn_location))
		{
			struct = spawn_location;
		}
	}
	if(!isdefined(struct))
	{
		Spawnpoints = struct::get_array("initial_spawn_points", "targetname");
		struct = zm::getFreeSpawnpoint(Spawnpoints, self);
	}
	return struct;
}

/*
	Name: function_dc25aef3
	Namespace: namespace_b2a3fbfd
	Checksum: 0xD4040DB9
	Offset: 0x2F10
	Size: 0x138
	Parameters: 2
	Flags: None
	Line Number: 1049
*/
function function_dc25aef3(player, corpse)
{
	player endon("death");
	self endon("delete");
	player endon("chugabud_bleedout");
	self endon("hash_c2017926");
	var_996ee15a = GetDvarFloat("player_lastStandBleedoutTime");
	var_f018c579 = GetDvarFloat("player_lastStandBleedoutTime");
	while(1)
	{
		fraction = var_f018c579 / var_996ee15a;
		self.color = (1, fraction, 0);
		if(isdefined(corpse.reviveTrigger.beingRevived) && corpse.reviveTrigger.beingRevived)
		{
			self.color = (1, 1, 1);
		}
		var_f018c579 = var_f018c579 - 0.1;
		wait(0.1);
	}
	self notify("hash_c2017926");
}

/*
	Name: function_848414c9
	Namespace: namespace_b2a3fbfd
	Checksum: 0xE9839885
	Offset: 0x3050
	Size: 0x14C
	Parameters: 2
	Flags: None
	Line Number: 1081
*/
function function_848414c9(player, corpse)
{
	height_offset = 30;
	hud_elem = NewHudElem();
	hud_elem.x = self.origin[0];
	hud_elem.y = self.origin[1];
	hud_elem.z = self.origin[2] + height_offset;
	hud_elem.color = (1, 1, 0);
	hud_elem setWaypoint(0, "mtl_waypoint_revive");
	hud_elem.hidewheninmenu = 1;
	hud_elem.immunetodemogamehudsettings = 1;
	hud_elem thread function_dc25aef3(player, corpse);
	self.revive_hud_elem = hud_elem;
	corpse waittill("stop_revive_trigger");
	hud_elem destroy();
}

