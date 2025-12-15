#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_equipment;
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

#namespace namespace_93d68851;

/*
	Name: __init__sytem__
	Namespace: namespace_93d68851
	Checksum: 0x6D77C65D
	Offset: 0x6A0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 37
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_tombstone", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_93d68851
	Checksum: 0xA31C19FE
	Offset: 0x6E0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_5b93268c();
	}
}

/*
	Name: function_5b93268c
	Namespace: namespace_93d68851
	Checksum: 0xC01CA2FF
	Offset: 0x718
	Size: 0x3A0
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_5b93268c()
{
	zm_perks::register_perk_basic_info("specialty_tombstone", "tombstone", 2000, "Hold ^3[{+activate}]^7 for Tombstone [Cost: &&1]", GetWeapon("zombie_perk_bottle_tombstone"));
	zm_perks::register_perk_precache_func("specialty_tombstone", &function_ed8727c6);
	zm_perks::register_perk_clientfields("specialty_tombstone", &function_dd8faefc, &function_81952d4d);
	zm_perks::register_perk_machine("specialty_tombstone", &function_583d0271);
	zm_perks::register_perk_threads("specialty_tombstone", &function_6caf5771, &function_9a08dc2b);
	zm_perks::register_perk_host_migration_params("specialty_tombstone", "vending_tombstone", "specialty_tombstone");
	level.playerSuicideAllowed = 1;
	level.canPlayerSuicide = &function_135c5c11;
	callback::on_spawned(&function_d1df0ee3);
	level thread function_5bbe231b();
	callback::on_disconnect(&function_cea5c83b);
	callback::on_connect(&function_5a4d4265);
	if(level.script == "zm_zod")
	{
		namespace_b8afaefc::function_8fd06793((848, -5631, 384), VectorScale((0, 1, 0), 90), "specialty_tombstone", "zombie_vending_tombstone");
	}
	if(level.script == "zm_factory")
	{
		namespace_b8afaefc::function_8fd06793((-584, 536, -6), VectorScale((0, 1, 0), 90), "specialty_tombstone", "zombie_vending_tombstone");
	}
	if(level.script == "zm_castle")
	{
		namespace_b8afaefc::function_8fd06793((792, 2447, 640), VectorScale((0, 1, 0), 180), "specialty_tombstone", "zombie_vending_tombstone");
	}
	if(level.script == "zm_island")
	{
		namespace_b8afaefc::function_8fd06793((490, 1840, -345), (0, 0, 0), "specialty_tombstone", "zombie_vending_tombstone");
	}
	if(level.script == "zm_stalingrad")
	{
		namespace_b8afaefc::function_8fd06793((-521, 5135, 304), VectorScale((0, 1, 0), 180), "specialty_tombstone", "zombie_vending_tombstone");
	}
	if(level.script == "zm_genesis")
	{
		namespace_b8afaefc::function_8fd06793((-92, -7161, -1311), VectorScale((0, 1, 0), 180), "specialty_tombstone", "zombie_vending_tombstone");
	}
}

/*
	Name: function_ed8727c6
	Namespace: namespace_93d68851
	Checksum: 0x3CCEDEC8
	Offset: 0xAC0
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 122
*/
function function_ed8727c6()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_tombstone"] = "zombie/fx_perk_sleight_of_hand_zmb";
		continue;
	}
	level._effect["specialty_tombstone"] = "zombie/fx_perk_sleight_of_hand_factory_zmb";
	level.machine_assets["specialty_tombstone"] = spawnstruct();
	level.machine_assets["specialty_tombstone"].weapon = GetWeapon("zombie_perk_bottle_tombstone");
	level.machine_assets["specialty_tombstone"].off_model = "zombie_vending_tombstone";
	level.machine_assets["specialty_tombstone"].on_model = "zombie_vending_tombstone_on";
}

/*
	Name: function_dd8faefc
	Namespace: namespace_93d68851
	Checksum: 0x9ACF73B8
	Offset: 0xC00
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 147
*/
function function_dd8faefc()
{
}

/*
	Name: function_81952d4d
	Namespace: namespace_93d68851
	Checksum: 0x66968B45
	Offset: 0xC10
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 161
*/
function function_81952d4d(state)
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_583d0271
	Namespace: namespace_93d68851
	Checksum: 0xAAFDDD6D
	Offset: 0xC28
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 177
*/
function function_583d0271(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_tombstone_jingle";
	use_trigger.script_string = "tombstone_perk";
	use_trigger.script_label = "mus_perks_tombstone_sting";
	use_trigger.target = "vending_tombstone";
	perk_machine.script_string = "tombstone_perk";
	perk_machine.targetname = "vending_tombstone";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "tombstone_perk";
		return;
	}
}

/*
	Name: function_6caf5771
	Namespace: namespace_93d68851
	Checksum: 0x55EC1E3A
	Offset: 0xCF0
	Size: 0x60
	Parameters: 3
	Flags: None
	Line Number: 202
*/
function function_6caf5771(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_tombstone", "t6_specialty_tombstone");
	self notify("specialty_tombstone" + "_start");
}

/*
	Name: function_9a08dc2b
	Namespace: namespace_93d68851
	Checksum: 0xE17B4BDD
	Offset: 0xD58
	Size: 0x68
	Parameters: 3
	Flags: None
	Line Number: 218
*/
function function_9a08dc2b(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_tombstone");
	self notify("perk_lost", str_perk);
	self notify("specialty_tombstone" + "_stop");
}

/*
	Name: function_5068a95f
	Namespace: namespace_93d68851
	Checksum: 0xFF9173F7
	Offset: 0xDC8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 235
*/
function function_5068a95f()
{
	var_cd4b7be6 = GetEntArray("vending_tombstone", "targetname");
	foreach(perk_machine in var_cd4b7be6)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "zombie_vending_tombstone_on")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("tombstone");
		}
	}
}

/*
	Name: function_5bbe231b
	Namespace: namespace_93d68851
	Checksum: 0xD2B76FFD
	Offset: 0xEE0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 258
*/
function function_5bbe231b()
{
	wait(0.05);
	level flag::wait_till("initial_blackscreen_passed");
	level.var_f1926933 = 1;
	level.playerSuicideAllowed = 1;
	level.canPlayerSuicide = &function_135c5c11;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d1df0ee3
	Namespace: namespace_93d68851
	Checksum: 0xE2570E0F
	Offset: 0xF48
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 279
*/
function function_d1df0ee3()
{
	self endon("death");
	level endon("hash_bf25069d");
	self.var_48d1f34b = undefined;
	self.var_256dc3a6 = undefined;
	self.var_59d5492c = undefined;
	self.var_d2a75427 = undefined;
	self.var_9bb1f064 = undefined;
	while(1)
	{
		if(self laststand::player_is_in_laststand())
		{
			wait(0.05);
			continue;
		}
		lethal_grenade = self zm_utility::get_player_lethal_grenade();
		if(isdefined(lethal_grenade))
		{
			var_a5139109 = self GetWeaponAmmoClip(lethal_grenade);
			if(!isdefined(self.var_48d1f34b) || self.var_48d1f34b != lethal_grenade)
			{
				self.var_48d1f34b = lethal_grenade;
			}
			if(!isdefined(self.var_59d5492c) || self.var_59d5492c != var_a5139109)
			{
				self.var_59d5492c = var_a5139109;
			}
		}
		var_ea9ffa91 = self zm_utility::get_player_tactical_grenade();
		if(isdefined(var_ea9ffa91))
		{
			var_bb0f83f6 = self GetWeaponAmmoClip(var_ea9ffa91);
			if(!isdefined(self.var_256dc3a6) || self.var_256dc3a6 != var_ea9ffa91)
			{
				self.var_256dc3a6 = var_ea9ffa91;
			}
			if(!isdefined(self.var_d2a75427) || self.var_d2a75427 != var_bb0f83f6)
			{
				self.var_d2a75427 = var_bb0f83f6;
			}
		}
		tomahawk = self.current_tomahawk_weapon;
		if(isdefined(tomahawk))
		{
			if(!isdefined(self.var_9bb1f064) || self.var_9bb1f064 != tomahawk)
			{
				self.var_9bb1f064 = tomahawk;
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_135c5c11
	Namespace: namespace_93d68851
	Checksum: 0x9F1FD26D
	Offset: 0x1168
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 343
*/
function function_135c5c11()
{
	if(self hasPerk("specialty_tombstone"))
	{
		self thread tombstone_spawn();
		return 1;
	}
	return 0;
}

/*
	Name: tombstone_spawn
	Namespace: namespace_93d68851
	Checksum: 0xD0F1BB68
	Offset: 0x11B8
	Size: 0x268
	Parameters: 0
	Flags: None
	Line Number: 363
*/
function tombstone_spawn()
{
	DC = spawn("script_model", self.origin + VectorScale((0, 0, 1), 40));
	DC.angles = self.angles;
	DC SetModel("tag_origin");
	dc_icon = spawn("script_model", self.origin + VectorScale((0, 0, 1), 40));
	dc_icon.angles = self.angles;
	dc_icon SetModel("ch_tombstone1");
	dc_icon LinkTo(DC);
	DC.icon = dc_icon;
	DC.script_noteworthy = "player_tombstone_model";
	DC.player = self;
	DC thread tombstone_wobble();
	DC thread tombstone_revived(self);
	DC.loadout = self function_e071f6c2();
	result = self util::waittill_any_return("player_revived", "spawned_player", "disconnect");
	if(result == "player_revived" || result == "disconnect")
	{
		DC notify("tombstone_timedout");
		dc_icon Unlink();
		dc_icon delete();
		DC delete();
		return;
	}
	DC thread tombstone_timeout();
	DC thread tombstone_grab();
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: tombstone_revived
	Namespace: namespace_93d68851
	Checksum: 0xB8595AD0
	Offset: 0x1428
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 404
*/
function tombstone_revived(player)
{
	self endon("tombstone_timedout");
	player endon("disconnect");
	shown = 1;
	while(isdefined(self) && isdefined(player))
	{
		if(isdefined(player.reviveTrigger) && isdefined(player.reviveTrigger.beingRevived) && player.reviveTrigger.beingRevived)
		{
			if(shown)
			{
				shown = 0;
				self.icon Hide();
			}
		}
		else if(!shown)
		{
			shown = 1;
			self.icon show();
		}
		wait(0.05);
	}
}

/*
	Name: function_e071f6c2
	Namespace: namespace_93d68851
	Checksum: 0x42254182
	Offset: 0x1528
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 438
*/
function function_e071f6c2()
{
	loadout = spawnstruct();
	loadout.weapons = self zm_weapons::player_get_loadout();
	loadout.PERKS = self zm_perks::get_perk_array();
	loadout.equipment = self zm_equipment::get_player_equipment();
	if(isdefined(loadout.equipment))
	{
		self zm_equipment::take(loadout.equipment);
	}
	loadout save_weapons_for_tombstone(self);
	self function_52cb27fc(loadout);
	return loadout;
}

/*
	Name: tombstone_save_perks
	Namespace: namespace_93d68851
	Checksum: 0x22645F06
	Offset: 0x1618
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 463
*/
function tombstone_save_perks(ent)
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
	Name: tombstone_grab
	Namespace: namespace_93d68851
	Checksum: 0x78E0F271
	Offset: 0x16E8
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 485
*/
function tombstone_grab()
{
	self endon("tombstone_timedout");
	wait(1);
	while(isdefined(self))
	{
		players = GetPlayers();
		i = 0;
		while(i < players.size)
		{
			if(players[i].is_zombie)
			{
				i++;
				continue;
			}
			else if(isdefined(self.player) && players[i] == self.player)
			{
				dist = Distance(players[i].origin, self.origin);
				if(dist < 64)
				{
					playFX(level._effect["powerup_grabbed"], self.origin);
					playFX(level._effect["powerup_grabbed_wave"], self.origin);
					players[i] tombstone_give(self.loadout);
					wait(0.1);
					playsoundatposition("zmb_powerup_grabbed", self.origin);
					self StopLoopSound();
					self.icon Unlink();
					self.icon delete();
					self delete();
					self notify("tombstone_grabbed");
					players[i] notify("dance_on_my_grave");
				}
			}
			i++;
		}
		util::wait_network_frame();
	}
}

/*
	Name: tombstone_give
	Namespace: namespace_93d68851
	Checksum: 0xA3A624E8
	Offset: 0x1928
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 534
*/
function tombstone_give(loadout)
{
	self zm_weapons::player_give_loadout(loadout.weapons, 1, 1);
	foreach(perk in loadout.PERKS)
	{
		if(perk == "specialty_tombstone")
		{
			continue;
		}
		if(self hasPerk(perk))
		{
			continue;
		}
		self zm_perks::give_perk(perk, 0);
	}
	loadout restore_weapons_for_tombstone(self);
	self function_84b0586d(loadout);
}

/*
	Name: tombstone_wobble
	Namespace: namespace_93d68851
	Checksum: 0xD1C7D832
	Offset: 0x1A60
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 563
*/
function tombstone_wobble()
{
	self endon("tombstone_grabbed");
	self endon("tombstone_timedout");
	if(isdefined(self))
	{
		wait(1);
		PlayFXOnTag(level._effect["powerup_on"], self, "tag_origin");
		playsoundatposition("zmb_spawn_powerup", self.origin);
		self PlayLoopSound("zmb_spawn_powerup_loop");
	}
	while(isdefined(self))
	{
		self RotateYaw(360, 3);
		wait(2.9);
	}
}

/*
	Name: tombstone_timeout
	Namespace: namespace_93d68851
	Checksum: 0x84821454
	Offset: 0x1B30
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 591
*/
function tombstone_timeout()
{
	self endon("tombstone_grabbed");
	self thread function_bd52231e();
	wait(48.5);
	i = 0;
	while(i < 40)
	{
		if(i % 2)
		{
			self.icon ghost();
			continue;
		}
		self.icon show();
		if(i < 15)
		{
			wait(0.5);
			i++;
			continue;
		}
		else if(i < 25)
		{
			wait(0.25);
			i++;
			continue;
			continue;
		}
		wait(0.1);
		i++;
	}
	self notify("tombstone_timedout");
	self.icon Unlink();
	self.icon delete();
	self delete();
}

/*
	Name: function_bd52231e
	Namespace: namespace_93d68851
	Checksum: 0xE151E79A
	Offset: 0x1C80
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 637
*/
function function_bd52231e()
{
	self endon("tombstone_grabbed");
	self endon("tombstone_timedout");
	player = self.player;
	self thread function_3e59d0dc(player);
	while(1)
	{
		player playsoundtoplayer("zmb_tombstone_timer_count", player);
		wait(1);
	}
}

/*
	Name: function_3e59d0dc
	Namespace: namespace_93d68851
	Checksum: 0xA7E43F4
	Offset: 0x1D08
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 660
*/
function function_3e59d0dc(player)
{
	self endon("tombstone_grabbed");
	self waittill("tombstone_timedout");
	player playsoundtoplayer("zmb_tombstone_timer_out", player);
}

/*
	Name: save_weapons_for_tombstone
	Namespace: namespace_93d68851
	Checksum: 0xE35787D7
	Offset: 0x1D58
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 677
*/
function save_weapons_for_tombstone(player)
{
	self.tombstone_melee_weapons = [];
	for(i = 0; i < level._melee_weapons.size; i++)
	{
		self save_weapon_for_tombstone(player, level._melee_weapons[i].weapon_name);
	}
}

/*
	Name: save_weapon_for_tombstone
	Namespace: namespace_93d68851
	Checksum: 0x3AECBA32
	Offset: 0x1DD8
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 696
*/
function save_weapon_for_tombstone(player, weapon_name)
{
	if(player hasweapon(GetWeapon(weapon_name)))
	{
		self.tombstone_melee_weapons[weapon_name] = 1;
	}
}

/*
	Name: restore_weapons_for_tombstone
	Namespace: namespace_93d68851
	Checksum: 0xD772DB78
	Offset: 0x1E38
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 714
*/
function restore_weapons_for_tombstone(player)
{
	for(i = 0; i < level._melee_weapons.size; i++)
	{
		self restore_weapon_for_tombstone(player, level._melee_weapons[i].weapon_name);
	}
	self.tombstone_melee_weapons = undefined;
}

/*
	Name: restore_weapon_for_tombstone
	Namespace: namespace_93d68851
	Checksum: 0x69D82C15
	Offset: 0x1EB0
	Size: 0xC0
	Parameters: 2
	Flags: None
	Line Number: 733
*/
function restore_weapon_for_tombstone(player, weapon_name)
{
	if(isdefined(weapon_name) || (!isdefined(self.tombstone_melee_weapons) && !isdefined(self.tombstone_melee_weapons[weapon_name])))
	{
		return;
	}
	if(isdefined(self.tombstone_melee_weapons[weapon_name]) && self.tombstone_melee_weapons[weapon_name])
	{
		player GiveWeapon(GetWeapon(weapon_name));
		player zm_utility::set_player_melee_weapon(weapon_name);
		self.tombstone_melee_weapons[weapon_name] = 0;
	}
}

/*
	Name: function_52cb27fc
	Namespace: namespace_93d68851
	Checksum: 0x69AC810F
	Offset: 0x1F78
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 757
*/
function function_52cb27fc(loadout)
{
	lethal_grenade = self.var_48d1f34b;
	if(isdefined(lethal_grenade) && isdefined(self.var_59d5492c))
	{
		loadout.lethal_grenade = lethal_grenade;
		loadout.lethal_grenade_count = self.var_59d5492c;
		continue;
	}
	loadout.lethal_grenade = undefined;
	var_ea9ffa91 = self.var_256dc3a6;
	if(isdefined(var_ea9ffa91) && isdefined(self.var_d2a75427))
	{
		loadout.var_ea9ffa91 = var_ea9ffa91;
		loadout.var_7ad03ab9 = self.var_d2a75427;
		continue;
	}
	loadout.var_ea9ffa91 = undefined;
	tomahawk = self.var_9bb1f064;
	if(isdefined(tomahawk))
	{
		loadout.tomahawk = tomahawk;
	}
}

/*
	Name: function_84b0586d
	Namespace: namespace_93d68851
	Checksum: 0xF11BF650
	Offset: 0x2090
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 792
*/
function function_84b0586d(loadout)
{
	if(isdefined(loadout.lethal_grenade))
	{
		self zm_utility::set_player_lethal_grenade(loadout.lethal_grenade);
		self GiveWeapon(loadout.lethal_grenade);
		self SetWeaponAmmoClip(loadout.lethal_grenade, loadout.lethal_grenade_count);
	}
	if(isdefined(loadout.var_ea9ffa91))
	{
		self zm_utility::set_player_tactical_grenade(loadout.var_ea9ffa91);
		self GiveWeapon(loadout.var_ea9ffa91);
		self SetWeaponAmmoClip(loadout.var_ea9ffa91, loadout.var_7ad03ab9);
	}
	if(isdefined(loadout.tomahawk))
	{
		self.current_tomahawk_weapon = loadout.tomahawk;
	}
}

/*
	Name: function_b6ce2f01
	Namespace: namespace_93d68851
	Checksum: 0x9F83D0D5
	Offset: 0x21E0
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 822
*/
function function_b6ce2f01()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] hasPerk("specialty_tombstone"))
		{
			players[i] function_9a08dc2b();
		}
	}
	machines = GetEntArray("zombie_vending", "targetname");
	if(isdefined(machines) && machines.size > 0)
	{
		for(i = 0; i < machines.size; i++)
		{
			if(machines[i].script_noteworthy == "specialty_tombstone")
			{
				machines[i] Hide();
				machines[i] TriggerEnable(0);
				machines[i].machine Hide();
				playFX(level._effect["poltergeist"], machines[i].origin);
				playsoundatposition("zmb_box_poof", machines[i].origin);
			}
		}
	}
	level.var_f1926933 = undefined;
	level.playerSuicideAllowed = 0;
	level.canPlayerSuicide = undefined;
	level notify("hash_bf25069d");
}

/*
	Name: function_c260f95d
	Namespace: namespace_93d68851
	Checksum: 0x5107292F
	Offset: 0x23F0
	Size: 0x370
	Parameters: 0
	Flags: None
	Line Number: 863
*/
function function_c260f95d()
{
	zm_perks::register_perk_basic_info("specialty_tombstone", "tombstone", 2000, "Hold ^3[{+activate}]^7 for Tombstone [Cost: &&1]", GetWeapon("zombie_perk_bottle_tombstone"));
	zm_perks::register_perk_precache_func("specialty_tombstone", &function_ed8727c6);
	zm_perks::register_perk_clientfields("specialty_tombstone", &function_dd8faefc, &function_81952d4d);
	zm_perks::register_perk_machine("specialty_tombstone", &function_583d0271);
	zm_perks::register_perk_threads("specialty_tombstone", &function_6caf5771, &function_9a08dc2b);
	zm_perks::register_perk_host_migration_params("specialty_tombstone", "vending_tombstone", "specialty_tombstone");
	machines = GetEntArray("zombie_vending", "targetname");
	if(isdefined(machines) && machines.size > 0)
	{
		for(i = 0; i < machines.size; i++)
		{
			if(machines[i].script_noteworthy == "specialty_tombstone")
			{
				machines[i] show();
				machines[i] TriggerEnable(1);
				machines[i].machine show();
				machines[i] zm_perks::perk_fx(level._effect["specialty_tombstone"]);
				playFX(level._effect["poltergeist"], machines[i].origin);
				playsoundatposition("zmb_box_poof", machines[i].origin);
			}
		}
	}
	level.playerSuicideAllowed = 1;
	level.canPlayerSuicide = &function_135c5c11;
	callback::on_spawned(&function_d1df0ee3);
	level thread function_5bbe231b();
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_d1df0ee3();
	}
}

/*
	Name: tombstone_hostmigration
	Namespace: namespace_93d68851
	Checksum: 0xED2D5131
	Offset: 0x2768
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 908
*/
function tombstone_hostmigration()
{
	level endon("end_game");
	level notify("tombstone_hostmigration");
	level endon("tombstone_hostmigration");
	while(1)
	{
		level waittill("host_migration_end");
		tombstones = GetEntArray("player_tombstone_model", "script_noteworthy");
		_a564 = tombstones;
		for(_k564 = getFirstArrayKey(_a564); isdefined(_k564); _k564 = getFirstArrayKey(_a564))
		{
			model = _a564[_k564];
			PlayFXOnTag(level._effect["powerup_on"], model, "tag_origin");
		}
	}
}

/*
	Name: function_cf412d52
	Namespace: namespace_93d68851
	Checksum: 0x89737D3D
	Offset: 0x2888
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 936
*/
function function_cf412d52()
{
	wait(0.05);
	level flag::wait_till("initial_blackscreen_passed");
	wait(2);
	players = GetPlayers();
	if(players.size < 2)
	{
		function_b6ce2f01();
	}
}

/*
	Name: function_cea5c83b
	Namespace: namespace_93d68851
	Checksum: 0xC4699075
	Offset: 0x2908
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 958
*/
function function_cea5c83b()
{
	players = GetPlayers();
	if(players.size > 1 && isdefined(level.var_f1926933) && level.var_f1926933)
	{
		return;
	}
	function_b6ce2f01();
}

/*
	Name: function_5a4d4265
	Namespace: namespace_93d68851
	Checksum: 0xC49E35E9
	Offset: 0x2970
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 978
*/
function function_5a4d4265()
{
	if(isdefined(level.var_f1926933) && level.var_f1926933)
	{
		return;
	}
	function_c260f95d();
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: function_4d5bc83c
	Namespace: namespace_93d68851
	Checksum: 0x833FDB1A
	Offset: 0x29A8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1000
*/
function function_4d5bc83c()
{
	wait(0.05);
	level flag::wait_till("initial_blackscreen_passed");
	while(1)
	{
		wait(10);
		IPrintLnBold("TOMBSTONE OFF");
		function_b6ce2f01();
		wait(10);
		IPrintLnBold("TOMBSTONE ON");
		function_c260f95d();
	}
}

