#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_clientdvar;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_placeable_mine;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_3f64bff6;

/*
	Name: __init__sytem__
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x738
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 42
*/
function autoexec __init__sytem__()
{
	system::register("elmg_powerups", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x780
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function __init__()
{
}

/*
	Name: __main__
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x790
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function __main__()
{
	level thread function_1c43dede();
}

/*
	Name: function_1c43dede
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x7B8
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 86
*/
function function_1c43dede()
{
	level flag::wait_till("start_zombie_round_logic");
	if(bgb::function_9ae7fa6d() && isdefined(level.bgb_machines) && !level.bgb_machines.size && !GetDvarInt("tfoption_bgb"))
	{
		zm_powerups::register_powerup("bgb_drop", &function_604440b, &function_947c953c);
		zm_powerups::add_zombie_powerup("bgb_drop", "p7_zm_zod_bubblegum_machine_with_lion", "", &function_f159addb, 1, 0, 0);
		zm_powerups::powerup_set_prevent_pick_up_if_drinking("bgb_drop", 1);
	}
	level.zombie_powerups["carpenter"].func_should_drop_with_regular_powerups = &func_should_drop_carpenter;
	level flag::wait_till("power_on");
	zm_powerups::register_powerup("free_perk_solo", &function_f2870af7);
	zm_powerups::add_zombie_powerup("free_perk_solo", "zombie_pickup_perk_bottle", &"ZOMBIE_POWERUP_FREE_PERK", &function_689c13e5, 1, 0, 0);
}

/*
	Name: function_446c3734
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x980
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 111
*/
function function_446c3734()
{
	for(i = 0; i < level.activePlayers.size; i++)
	{
		if(level.activePlayers[i] hasRiotShield() && !Int(level.activePlayers[i] clientfield::get_player_uimodel("zmInventory.shield_health")) == 1)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: func_should_drop_carpenter
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0xA28
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 133
*/
function func_should_drop_carpenter()
{
	if(zm_powerup_carpenter::get_num_window_destroyed() >= 5 || function_446c3734())
	{
		return 1;
	}
	return 0;
	~;
}

/*
	Name: function_604440b
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0xA68
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 153
*/
function function_604440b(player)
{
	self thread function_b62c84a8(player);
}

/*
	Name: function_abdcae8c
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0xA98
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 168
*/
function function_abdcae8c(num)
{
	foreach(player in GetPlayers())
	{
		if(player GetEntityNumber() == num)
		{
			return player;
		}
	}
}

/*
	Name: function_947c953c
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0xB48
	Size: 0x308
	Parameters: 0
	Flags: None
	Line Number: 189
*/
function function_947c953c()
{
	var_9d8064ad = getArrayKeys(level.bgb);
	self.bgb = Array::random(var_9d8064ad);
	if(!isdefined(level.bgb[self.bgb]))
	{
		self.bgb = "zm_bgb_flavor_hexed";
	}
	if(GetDvarInt("aaeoption_bgb_drop") == 2)
	{
		var_bd25814d = [];
		foreach(player in level.players)
		{
			foreach(bgb in player getbubblegumpack())
			{
				if(isdefined(level.bgb[bgb]))
				{
					var_bd25814d[var_bd25814d.size] = bgb;
				}
			}
		}
		if(var_bd25814d.size > 0)
		{
			self.bgb = Array::random(var_bd25814d);
		}
	}
	else
	{
		player = function_abdcae8c(GetDvarInt("aaeoption_bgb_drop") - 3);
		if(isdefined(player) && isPlayer(player))
		{
			bgb = Array::random(player getbubblegumpack());
			if(isdefined(level.bgb[bgb]))
			{
				self.bgb = bgb;
			}
		}
	}
	self UseWeaponModel(level.var_adfa48c4, "wpn_t7_zmb_bubblegum_view", level.players[0] CalcWeaponOptions(level.bgb[self.bgb].camo_index, 0, 0));
	self SetScale(7);
}

/*
	Name: function_b62c84a8
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0xE58
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 241
*/
function function_b62c84a8(player)
{
	if(player GetCurrentWeapon() == level.var_c92b3b33 || player GetCurrentWeapon() == level.var_adfa48c4)
	{
		return;
	}
	player bgb::take();
	player bgb::give(self.bgb);
	player notify("bgb_flavor_hexed_give_" + self.bgb);
}

/*
	Name: function_f159addb
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0xF08
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 262
*/
function function_f159addb()
{
	if(GetDvarString("aaeoption_bgb_drop") == "1")
	{
		return 0;
	}
	return 1;
}

/*
	Name: grab_fire_sale
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0xF40
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 281
*/
function grab_fire_sale(player)
{
	self thread function_113fb977(player);
}

/*
	Name: function_113fb977
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0xF70
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 296
*/
function function_113fb977(player)
{
	while(firesale_chest_is_leaving())
	{
		wait(0.05);
	}
	if(isdefined(level._custom_powerups["fire_sale"].var_d4974158))
	{
		self [[level._custom_powerups["fire_sale"].var_d4974158]](player);
	}
}

/*
	Name: firesale_chest_is_leaving
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0xFF0
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 318
*/
function firesale_chest_is_leaving()
{
	if(isdefined(level.chests))
	{
		for(i = 0; i < level.chests.size; i++)
		{
			if(i !== level.chest_index)
			{
				if(level.chests[i].zbarrier.state === "leaving" || level.chests[i].zbarrier.state === "open" || level.chests[i].zbarrier.state === "close" || level.chests[i].zbarrier.state === "closing")
				{
					return 1;
				}
			}
		}
	}
	return 0;
}

/*
	Name: grab_full_ammo
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x1100
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 346
*/
function grab_full_ammo(player)
{
	level thread full_ammo_powerup(self, player);
	player thread zm_powerups::powerup_vo("full_ammo");
}

/*
	Name: full_ammo_powerup
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x1150
	Size: 0x6F0
	Parameters: 2
	Flags: None
	Line Number: 362
*/
function full_ammo_powerup(drop_item, player)
{
	players = GetPlayers(player.team);
	if(isdefined(level._get_game_module_players))
	{
		players = [[level._get_game_module_players]](player);
	}
	level notify("zmb_max_ammo_level");
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(level.check_player_is_ready_for_ammo))
		{
			if([[level.check_player_is_ready_for_ammo]](players[i]) == 0)
			{
				continue;
			}
		}
		primary_weapons = players[i] GetWeaponsList(1);
		players[i] notify("zmb_max_ammo");
		players[i] notify("zmb_lost_knife");
		players[i] zm_placeable_mine::disable_all_prompts_for_player();
		for(x = 0; x < primary_weapons.size; x++)
		{
			if(level.headshots_only && zm_utility::is_lethal_grenade(primary_weapons[x]))
			{
				continue;
			}
			if(isdefined(level.zombie_include_equipment) && isdefined(level.zombie_include_equipment[primary_weapons[x]]) && (!(isdefined(level.zombie_equipment[primary_weapons[x]].refill_max_ammo) && level.zombie_equipment[primary_weapons[x]].refill_max_ammo)))
			{
				continue;
			}
			if(isdefined(level.zombie_weapons_no_max_ammo) && isdefined(level.zombie_weapons_no_max_ammo[primary_weapons[x].name]))
			{
				continue;
			}
			if(zm_utility::is_hero_weapon(primary_weapons[x]))
			{
				continue;
			}
			if(level.script == "zm_castle")
			{
				if(isdefined(players[i].var_e8e28d9e) && isdefined(players[i].var_8f97fa0b))
				{
					players[i].var_8f97fa0b = 60;
					players[i].var_e8e28d9e = 60;
				}
			}
			if(players[i] hasweapon(primary_weapons[x]))
			{
				players[i] SetWeaponAmmoClip(primary_weapons[x], primary_weapons[x].clipSize);
				if(isdefined(primary_weapons[x].dualWieldWeapon))
				{
					players[i] SetWeaponAmmoClip(primary_weapons[x].dualWieldWeapon, primary_weapons[x].dualWieldWeapon.clipSize);
				}
				if(isdefined(primary_weapons[x].altweapon))
				{
					players[i] SetWeaponAmmoClip(primary_weapons[x].altweapon, primary_weapons[x].altweapon.clipSize);
					players[i] giveMaxAmmo(primary_weapons[x].altweapon);
				}
				players[i] giveMaxAmmo(primary_weapons[x]);
			}
		}
	}
	if(level.script == "zm_castle")
	{
		level.var_7df95fd1["elemental_bow_rune_prison"] = 75;
		level.var_7df95fd1["elemental_bow_wolf"] = 75;
		level.var_7df95fd1["elemental_bow_storm"] = 75;
		level.var_7df95fd1["elemental_bow_demongate"] = 75;
		level.var_67616e8e["elemental_bow_rune_prison"] = 75;
		level.var_67616e8e["elemental_bow_wolf"] = 75;
		level.var_67616e8e["elemental_bow_storm"] = 75;
		level.var_67616e8e["elemental_bow_demongate"] = 75;
	}
	if(level.script == "zm_tomb" && isdefined(level.a_elemental_staffs_upgraded) && isdefined(level.a_elemental_staffs))
	{
		foreach(staff_upgraded in level.a_elemental_staffs_upgraded)
		{
			staff_upgraded.prev_ammo_clip = staff_upgraded.w_weapon.clipSize;
			staff_upgraded.prev_ammo_stock = staff_upgraded.w_weapon.startammo;
		}
		foreach(staff in level.a_elemental_staffs)
		{
			staff.prev_ammo_clip = staff.w_weapon.clipSize;
			staff.prev_ammo_stock = staff.w_weapon.startammo;
		}
	}
	level thread full_ammo_on_hud(drop_item, player.team);
}

/*
	Name: full_ammo_on_hud
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x1848
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 462
*/
function full_ammo_on_hud(drop_item, player_team)
{
	players = GetPlayers(player_team);
	players[0] playsoundtoteam("zmb_full_ammo", player_team);
	if(isdefined(drop_item))
	{
		LUINotifyEvent(&"zombie_notification", 1, drop_item.hint);
	}
}

/*
	Name: grab_carpenter
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x18E8
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 482
*/
function grab_carpenter(player)
{
	foreach(player in level.activePlayers)
	{
		player thread function_356221c5();
	}
	if(isdefined(level._custom_powerups["carpenter"].var_d4974158))
	{
		self thread [[level._custom_powerups["carpenter"].var_d4974158]](player);
	}
}

/*
	Name: function_356221c5
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x19C8
	Size: 0x2B0
	Parameters: 0
	Flags: None
	Line Number: 504
*/
function function_356221c5()
{
	if(isdefined(self.var_f6dca7a8) && isdefined(self.var_f6dca7a8.var_554b726a))
	{
		shield = self.var_f6dca7a8.var_554b726a;
		weapon = shield.weapon;
		if(isdefined(weapon))
		{
			shield.health = weapon.weaponstarthitpoints;
			shield UseWeaponModel(weapon);
			self clientfield::set_player_uimodel("zmInventory.shield_health", 1);
		}
	}
	wait(0.2);
	foreach(weapon in self GetWeaponsList(1))
	{
		if(weapon.isRiotShield && self clientfield::get_player_uimodel("zmInventory.shield_health") != 1)
		{
			if(weapon == self GetCurrentWeapon())
			{
				self zm_equipment::take(weapon);
				self.hasRiotShield = 0;
				self.hasRiotShieldEquipped = 0;
				self zm_weapons::weapon_give(weapon, 0, 0, 1, 0);
				self SwitchToWeaponImmediate(weapon);
			}
			else
			{
				self zm_equipment::take(weapon);
				self.hasRiotShield = 0;
				self.hasRiotShieldEquipped = 0;
				self zm_weapons::weapon_give(weapon, 0, 0, 1, 0);
			}
			namespace_22b67853::function_f105c5b1("shield_fix", self);
		}
	}
	if(isdefined(self.var_def06a03) && self.var_def06a03 >= 50)
	{
		self zm_score::add_to_player_score(200);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: grab_nuke
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x1C80
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 558
*/
function grab_nuke(player)
{
	level thread nuke_powerup(self, player.team);
	player thread zm_powerups::powerup_vo("nuke");
	zombies = GetAITeamArray(level.zombie_team);
	player.zombie_nuked = ArraySort(zombies, self.origin);
	player notify("nuke_triggered");
}

/*
	Name: nuke_powerup
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x1D30
	Size: 0x530
	Parameters: 2
	Flags: None
	Line Number: 577
*/
function nuke_powerup(drop_item, player_team)
{
	level thread function_82aa5ec8(3);
	location = drop_item.origin;
	if(isdefined(drop_item.FX))
	{
		playFX(drop_item.FX, location);
	}
	level thread nuke_flash(player_team);
	zombies = GetAITeamArray(level.zombie_team);
	zombies = ArraySort(zombies, location);
	zombies_nuked = [];
	for(i = 0; i < zombies.size; i++)
	{
		if(isdefined(zombies[i].ignore_nuke) && zombies[i].ignore_nuke)
		{
			continue;
		}
		if(isdefined(zombies[i].marked_for_death) && zombies[i].marked_for_death)
		{
			continue;
		}
		if(isdefined(zombies[i].nuke_damage_func))
		{
			zombies[i] thread [[zombies[i].nuke_damage_func]]();
			continue;
		}
		if(zm_utility::is_magic_bullet_shield_enabled(zombies[i]))
		{
			continue;
		}
		zombies[i].marked_for_death = 1;
		if(!(isdefined(zombies[i].nuked) && zombies[i].nuked) && !zm_utility::is_magic_bullet_shield_enabled(zombies[i]))
		{
			zombies[i].nuked = 1;
			zombies_nuked[zombies_nuked.size] = zombies[i];
			zombies[i] clientfield::increment("zm_nuked");
		}
	}
	for(i = 0; i < zombies_nuked.size; i++)
	{
		if(!isdefined(zombies_nuked[i]))
		{
			continue;
		}
		if(zm_utility::is_magic_bullet_shield_enabled(zombies_nuked[i]))
		{
			continue;
		}
		if(!(isdefined(zombies_nuked[i].isdog) && zombies_nuked[i].isdog))
		{
			if(!(isdefined(zombies_nuked[i].no_gib) && zombies_nuked[i].no_gib))
			{
				zombies_nuked[i] zombie_utility::zombie_head_gib();
			}
			zombies_nuked[i] playsound("evt_nuked");
		}
		zombies_nuked[i] DoDamage(zombies_nuked[i].health + 666, zombies_nuked[i].origin);
	}
	if(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver") && GetDvarString("tfoption_better_nuke") == "1")
	{
		var_50b98424 = zombies_nuked.size * GetDvarInt("tfoption_better_nuke_points");
		if(var_50b98424 < 400)
		{
			var_50b98424 = 400;
		}
	}
	else
	{
		var_50b98424 = 400;
	}
	level notify("nuke_complete");
	players = GetPlayers(player_team);
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::player_add_points("nuke_powerup", var_50b98424);
	}
	return;
	ERROR: Bad function call
}

/*
	Name: nuke_flash
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x2268
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 668
*/
function nuke_flash(team)
{
	playsoundatposition("evt_nuke_flash", (0, 0, 0));
	LUI::screen_flash(0.2, 0.5, 1, 0.8, "white");
}

/*
	Name: function_82aa5ec8
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x22D8
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 684
*/
function function_82aa5ec8(n_spawn_delay)
{
	level endon("disable_nuke_delay_spawning");
	if(isdefined(level.disable_nuke_delay_spawning) && level.disable_nuke_delay_spawning)
	{
		return;
	}
	b_spawn_zombies_before_nuke = level flag::get("spawn_zombies");
	level flag::clear("spawn_zombies");
	level waittill("nuke_complete");
	if(isdefined(level.disable_nuke_delay_spawning) && level.disable_nuke_delay_spawning)
	{
		return;
	}
	wait(n_spawn_delay);
	if(b_spawn_zombies_before_nuke)
	{
		level flag::set("spawn_zombies");
	}
}

/*
	Name: function_1cdeea19
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x23A8
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 715
*/
function function_1cdeea19(player)
{
	bomb_origin = player.origin + VectorScale((0, 0, 1), 40);
	level thread function_14fe3f87(self, player.team, player, bomb_origin);
	zombies = GetAITeamArray(level.zombie_team);
	player.zombie_nuked = ArraySort(zombies, self.origin);
}

/*
	Name: function_145da77e
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x2460
	Size: 0x198
	Parameters: 4
	Flags: None
	Line Number: 733
*/
function function_145da77e(player, drop_item, player_team, bomb_origin)
{
	nuke = spawn("script_model", drop_item.origin + VectorScale((0, 0, 1), 185));
	nuke.angles = VectorScale((1, 0, 0), 90);
	nuke SetModel("p7_zm_power_up_nuke");
	nuke moveto(drop_item.origin, 0.47);
	nuke playsound("zmb_nuke_incoming");
	nuke waittill("movedone");
	player thread zm_powerups::powerup_vo("nuke");
	nuke delete();
	playFX("zombie/fx_powerup_nuke_zmb", bomb_origin);
	level thread nuke_flash(player_team);
	Earthquake(0.6, 2.4, drop_item.origin, 700);
}

/*
	Name: function_14fe3f87
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x2600
	Size: 0x480
	Parameters: 4
	Flags: None
	Line Number: 758
*/
function function_14fe3f87(drop_item, player_team, player, bomb_origin)
{
	player notify("nuke_triggered");
	level thread function_82aa5ec8(3);
	location = drop_item.origin;
	level thread function_145da77e(player, drop_item, player_team, bomb_origin);
	wait(0.5);
	zombies = GetAITeamArray(level.zombie_team);
	zombies = ArraySort(zombies, location);
	zombies_nuked = [];
	for(i = 0; i < zombies.size; i++)
	{
		if(isdefined(zombies[i].ignore_nuke) && zombies[i].ignore_nuke)
		{
			continue;
		}
		if(isdefined(zombies[i].marked_for_death) && zombies[i].marked_for_death)
		{
			continue;
		}
		if(isdefined(zombies[i].nuke_damage_func))
		{
			zombies[i] thread [[zombies[i].nuke_damage_func]]();
			continue;
		}
		if(zm_utility::is_magic_bullet_shield_enabled(zombies[i]))
		{
			continue;
		}
		zombies[i].marked_for_death = 1;
		if(!(isdefined(zombies[i].nuked) && zombies[i].nuked) && !zm_utility::is_magic_bullet_shield_enabled(zombies[i]))
		{
			zombies[i].nuked = 1;
			zombies_nuked[zombies_nuked.size] = zombies[i];
			zombies[i] clientfield::increment("zm_nuked");
		}
	}
	for(i = 0; i < zombies_nuked.size; i++)
	{
		wait(RandomFloatRange(0.1, 0.7));
		if(!isdefined(zombies_nuked[i]))
		{
			continue;
		}
		if(zm_utility::is_magic_bullet_shield_enabled(zombies_nuked[i]))
		{
			continue;
		}
		if(!(isdefined(zombies_nuked[i].isdog) && zombies_nuked[i].isdog))
		{
			if(!(isdefined(zombies_nuked[i].no_gib) && zombies_nuked[i].no_gib))
			{
				zombies_nuked[i] zombie_utility::zombie_head_gib();
			}
			zombies_nuked[i] playsound("evt_nuked");
		}
		zombies_nuked[i] DoDamage(zombies_nuked[i].health + 666, zombies_nuked[i].origin);
	}
	level notify("nuke_complete");
	players = GetPlayers(player_team);
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::player_add_points("nuke_powerup", 400);
	}
	return;
}

/*
	Name: grab_free_perk
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x2A88
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 835
*/
function grab_free_perk(player)
{
	level thread free_perk_powerup(self);
}

/*
	Name: free_perk_powerup
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x2AB8
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 850
*/
function free_perk_powerup(item)
{
	for(i = 0; i < level.activePlayers.size; i++)
	{
		level.activePlayers[i] give_random_perk();
	}
}

/*
	Name: give_random_perk
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x2B18
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 868
*/
function give_random_perk()
{
	a_str_perks = getArrayKeys(level._custom_perks);
	PERKS = [];
	for(i = 0; i < a_str_perks.size; i++)
	{
		perk = a_str_perks[i];
		if(isdefined(self.perk_purchased) && self.perk_purchased == perk)
		{
			continue;
		}
		if(perk == "specialty_flakjacket" && isdefined(level.var_c84f236a))
		{
			continue;
		}
		if(!self hasPerk(perk) && !self zm_perks::has_perk_paused(perk))
		{
			PERKS[PERKS.size] = perk;
		}
	}
	if(PERKS.size > 0)
	{
		PERKS = Array::randomize(PERKS);
		self zm_perks::give_perk(PERKS[0]);
	}
	else
	{
		self zm_score::add_to_player_score(1000);
	}
}

/*
	Name: function_f2870af7
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x2C98
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 909
*/
function function_f2870af7(player)
{
	player thread function_4d80dff3();
	return;
	.var_0 = undefined;
}

/*
	Name: function_4d80dff3
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x2CC8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 926
*/
function function_4d80dff3()
{
	if(!self laststand::player_is_in_laststand() && !self.sessionstate == "spectator")
	{
		free_perk = self zm_perks::give_random_perk();
		if(isdefined(free_perk) && isdefined(level.perk_bought_func))
		{
			self [[level.perk_bought_func]](free_perk);
			return;
		}
	}
}

/*
	Name: function_689c13e5
	Namespace: namespace_3f64bff6
	Checksum: 0x424F4353
	Offset: 0x2D58
	Size: 0x15A
	Parameters: 0
	Flags: None
	Line Number: 949
*/
function function_689c13e5()
{
	if(!level flag::get("power_on "))
	{
		return 0;
	}
	var_39a08fa2 = 0;
	foreach(player in level.activePlayers)
	{
		if(player bgb::is_enabled("zm_bgb_unquenchable") || player bgb::is_enabled("zm_bgb_soda_fountain"))
		{
			return 0;
		}
		if(player.num_perks <= player zm_utility::get_player_perk_purchase_limit())
		{
			return 0;
		}
		if(player.num_perks < level._custom_perks.size)
		{
			var_39a08fa2 = 1;
		}
	}
	return var_39a08fa2 && math::cointoss();
}

