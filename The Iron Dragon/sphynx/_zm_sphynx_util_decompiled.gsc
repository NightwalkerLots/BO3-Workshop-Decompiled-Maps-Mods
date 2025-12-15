#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_dogs;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_behavior;
#include scripts\zm\_zm_behavior_utility;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_placeable_mine;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_puppet;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_448750e;

/*
	Name: __init__sytem__
	Namespace: namespace_448750e
	Checksum: 0xB81493BF
	Offset: 0xAF0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 65
*/
function autoexec __init__sytem__()
{
	system::register("zm_sphynx_util", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_448750e
	Checksum: 0x9ACF73B8
	Offset: 0xB30
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function __init__()
{
}

/*
	Name: function_af0d010c
	Namespace: namespace_448750e
	Checksum: 0xFCC3A80F
	Offset: 0xB40
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 94
*/
function function_af0d010c(var_ca834ab8)
{
	level.zombie_vars["zombie_between_round_time"] = var_ca834ab8;
	return;
	~level.zombie_vars["zombie_between_round_time"];
}

/*
	Name: function_3c86d486
	Namespace: namespace_448750e
	Checksum: 0xDDC95000
	Offset: 0xB70
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 111
*/
function function_3c86d486(weapon_name)
{
	level.zombie_weapons[GetWeapon(weapon_name)].is_in_box = 1;
}

/*
	Name: function_49626e93
	Namespace: namespace_448750e
	Checksum: 0xCC47DD7D
	Offset: 0xBB0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 126
*/
function function_49626e93()
{
	zm_audio::loadPlayerVoiceCategories("gamedata/audio/zm/zm_castle_vox.csv");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b4d3d8c3
	Namespace: namespace_448750e
	Checksum: 0x52F34D35
	Offset: 0xBD8
	Size: 0x70
	Parameters: 4
	Flags: None
	Line Number: 143
*/
function function_b4d3d8c3(soundAlias, timeMin, var_788fd180, var_3d2b9196)
{
	self endon(var_3d2b9196);
	while(isdefined(self))
	{
		playsoundatposition(soundAlias, self.origin);
		wait(randomIntRange(timeMin, var_788fd180));
	}
}

/*
	Name: function_3d8bf035
	Namespace: namespace_448750e
	Checksum: 0xE2C86191
	Offset: 0xC50
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 163
*/
function function_3d8bf035(var_5493df8a)
{
	level endon("end_game");
	while(isdefined(self))
	{
		level waittill("start_of_round");
		if(level.round_number >= var_5493df8a)
		{
			break;
		}
	}
	zombie_utility::set_zombie_var("zombie_health_increase_multiplier", 0, 1, 2);
}

/*
	Name: function_4cc8861a
	Namespace: namespace_448750e
	Checksum: 0x8317D0C8
	Offset: 0xCC0
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 187
*/
function function_4cc8861a(var_f8fb9f96, var_d3d8af77)
{
	level endon("end_game");
	while(isdefined(self))
	{
		level waittill("start_of_round");
		level.zombie_actor_limit = var_f8fb9f96 + var_d3d8af77 * GetPlayers().size;
		level.zombie_ai_limit = var_f8fb9f96 + var_d3d8af77 * GetPlayers().size;
	}
}

/*
	Name: function_4f26535b
	Namespace: namespace_448750e
	Checksum: 0x7CEA9764
	Offset: 0xD50
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 208
*/
function function_4f26535b()
{
	callback::on_spawned(&function_8dfee555);
	return;
	~;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8dfee555
	Namespace: namespace_448750e
	Checksum: 0xB432C30F
	Offset: 0xD80
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 226
*/
function function_8dfee555()
{
	self endon("bled_out");
	self endon("spawned_player");
	self endon("disconnect");
	for(;;)
	{
		level waittill("carpenter_finished");
		foreach(weapon in self GetWeaponsList(1))
		{
			if(isdefined(weapon.isRiotShield) && weapon.isRiotShield)
			{
				self giveMaxAmmo(weapon);
				self riotshield::player_damage_shield(weapon.weaponstarthitpoints * -1);
				IPrintLnBold("Fixed riotshield: " + weapon.weaponstarthitpoints);
			}
		}
	}
}

/*
	Name: function_a007f893
	Namespace: namespace_448750e
	Checksum: 0x79B7028
	Offset: 0xED0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 256
*/
function function_a007f893()
{
	callback::on_spawned(&function_6770a13e);
}

/*
	Name: function_6770a13e
	Namespace: namespace_448750e
	Checksum: 0x352CF911
	Offset: 0xF00
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 271
*/
function function_6770a13e()
{
	self endon("bled_out");
	self endon("spawned_player");
	self endon("disconnect");
	for(;;)
	{
		self waittill("zmb_max_ammo");
		foreach(weapon in self GetWeaponsList(1))
		{
			if(isdefined(weapon.clipSize) && weapon.clipSize > 0)
			{
				self SetWeaponAmmoClip(weapon, weapon.clipSize);
			}
		}
	}
}

/*
	Name: function_67f91b3a
	Namespace: namespace_448750e
	Checksum: 0xAF8DC9C5
	Offset: 0x1010
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 299
*/
function function_67f91b3a()
{
	callback::on_spawned(&function_2b59a3e3);
	zm_spawner::register_zombie_damage_callback(&function_90cf794);
	zm_spawner::register_zombie_death_event_callback(&function_88c1e2ab);
}

/*
	Name: function_90cf794
	Namespace: namespace_448750e
	Checksum: 0x214900BC
	Offset: 0x1080
	Size: 0x4C0
	Parameters: 13
	Flags: None
	Line Number: 316
*/
function function_90cf794(mod, HIT_LOCATION, hit_origin, player, amount, weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	w_damage = zm_weapons::get_nonalternate_weapon(weapon);
	weaponClass = util::getWeaponClass(w_damage);
	if(HIT_LOCATION == "helmet" && weaponClass == "weapon_sniper")
	{
		player playlocalsound("mp_hit_indication_3d");
	}
	if(isdefined(player.var_48a41684) && player.var_48a41684)
	{
		player playlocalsound("zmb_death_gibs");
		if(level.zombie_vars[player.team]["zombie_insta_kill"] == 1)
		{
			player playlocalsound("mp_hit_indication_3d");
			player.var_5ace6d11 = 1;
			player.hud_damagefeedback.alpha = 0;
			player.hud_damagefeedback.x = 0;
			player.hud_damagefeedback.y = 0;
			player.hud_damagefeedback.alignX = "center";
			player.hud_damagefeedback.alignY = "middle";
			player.hud_damagefeedback.horzAlign = "center";
			player.hud_damagefeedback.vertAlign = "middle";
			player.hud_damagefeedback SetShader("robit_hitmarker_death", 56, 56);
			player.hud_damagefeedback.color = (1, 1, 1);
			player.hud_damagefeedback.alpha = 1;
			player.hud_damagefeedback ScaleOverTime(0.2, 32, 32);
			wait(0.8);
			player.hud_damagefeedback fadeOverTime(0.2);
			player.hud_damagefeedback.alpha = 0;
			player.var_5ace6d11 = 0;
		}
		else if(player.var_5ace6d11 != 1)
		{
			player.hud_damagefeedback.alpha = 0;
			player.hud_damagefeedback.x = 0;
			player.hud_damagefeedback.y = 0;
			player.hud_damagefeedback.alignX = "center";
			player.hud_damagefeedback.alignY = "middle";
			player.hud_damagefeedback.horzAlign = "center";
			player.hud_damagefeedback.vertAlign = "middle";
			player.hud_damagefeedback SetShader("robit_hitmarker", 32, 32);
			player.hud_damagefeedback.color = (1, 1, 1);
			player.hud_damagefeedback.alpha = 1;
			wait(0.8);
			player.hud_damagefeedback fadeOverTime(0.4);
			player.hud_damagefeedback.alpha = 0;
			player.var_5ace6d11 = 0;
		}
	}
	return 0;
}

/*
	Name: function_88c1e2ab
	Namespace: namespace_448750e
	Checksum: 0x8365FD78
	Offset: 0x1548
	Size: 0x2C0
	Parameters: 1
	Flags: None
	Line Number: 378
*/
function function_88c1e2ab(player)
{
	str_damagemod = self.damageMod;
	w_damage = self.damageWeapon;
	w_damage = zm_weapons::get_nonalternate_weapon(w_damage);
	weaponClass = util::getWeaponClass(w_damage);
	if(zm_utility::is_headshot(w_damage, self.damagelocation, str_damagemod) && weaponClass == "weapon_sniper")
	{
		self playlocalsound("mp_hit_indication_3d");
	}
	if(isdefined(player.var_48a41684) && player.var_48a41684)
	{
		player playlocalsound("mp_hit_indication_3d");
		player.var_5ace6d11 = 1;
		player.hud_damagefeedback.alpha = 0;
		player.hud_damagefeedback.x = 0;
		player.hud_damagefeedback.y = 0;
		player.hud_damagefeedback.alignX = "center";
		player.hud_damagefeedback.alignY = "middle";
		player.hud_damagefeedback.horzAlign = "center";
		player.hud_damagefeedback.vertAlign = "middle";
		player.hud_damagefeedback SetShader("robit_hitmarker_death", 56, 56);
		player.hud_damagefeedback.color = (1, 1, 1);
		player.hud_damagefeedback.alpha = 1;
		player.hud_damagefeedback ScaleOverTime(0.2, 32, 32);
		wait(0.8);
		player.hud_damagefeedback fadeOverTime(0.2);
		player.hud_damagefeedback.alpha = 0;
		player.var_5ace6d11 = 0;
	}
	return 0;
}

/*
	Name: function_a800bfcb
	Namespace: namespace_448750e
	Checksum: 0xD169DD3B
	Offset: 0x1810
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 421
*/
function function_a800bfcb()
{
	foreach(player in GetPlayers())
	{
		player.var_48a41684 = 0;
	}
}

/*
	Name: function_7e746856
	Namespace: namespace_448750e
	Checksum: 0x813BCD32
	Offset: 0x18A8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 439
*/
function function_7e746856()
{
	callback::on_spawned(&function_2b59a3e3);
	zm::register_zombie_damage_override_callback(&function_6450c49c);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2b59a3e3
	Namespace: namespace_448750e
	Checksum: 0xD367A2E3
	Offset: 0x18F8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 457
*/
function function_2b59a3e3()
{
	self endon("bled_out");
	self endon("spawned_player");
	self endon("disconnect");
	self.var_48a41684 = 1;
}

/*
	Name: show_hit_marker
	Namespace: namespace_448750e
	Checksum: 0xF0DFF3B3
	Offset: 0x1938
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 475
*/
function show_hit_marker(death)
{
	if(isdefined(self) && isdefined(self.hud_damagefeedback))
	{
		if(isdefined(death) && death)
		{
			self.hud_damagefeedback SetShader("damage_feedback_glow_orange", 24, 48);
			continue;
		}
		self.hud_damagefeedback SetShader("damage_feedback", 24, 48);
		self.hud_damagefeedback.alpha = 1;
		self.hud_damagefeedback fadeOverTime(1);
		self.hud_damagefeedback.alpha = 0;
	}
}

/*
	Name: function_6450c49c
	Namespace: namespace_448750e
	Checksum: 0x862B6BA6
	Offset: 0x1A10
	Size: 0xD0
	Parameters: 13
	Flags: None
	Line Number: 501
*/
function function_6450c49c(death, inflictor, attacker, damage, flags, mod, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(isdefined(attacker) && isPlayer(attacker))
	{
		if(isdefined(attacker.var_48a41684) && attacker.var_48a41684)
		{
			attacker show_hit_marker(death);
		}
	}
}

/*
	Name: function_10dcc000
	Namespace: namespace_448750e
	Checksum: 0x8C7E79D
	Offset: 0x1AE8
	Size: 0x80
	Parameters: 4
	Flags: None
	Line Number: 522
*/
function function_10dcc000()
{
	// Could not fully decompile function; skipped
}

/*
	Name: function_742b6f66
	Namespace: namespace_448750e
	Checksum: 0xD9215C45
	Offset: 0x1B70
	Size: 0x150
	Parameters: 4
	Flags: None
	Line Number: 537
*/
function function_742b6f66(targetname, var_9432817, var_92700ed4, loopSound)
{
	while(1)
	{
		Array::thread_all(GetEntArray(targetname, "targetname"), &function_7cc69b6, var_9432817, loopSound);
		level.var_b2106339 = 0;
		while(level.var_b2106339 < GetEntArray(targetname, "targetname").size)
		{
			wait(1);
		}
		foreach(player in GetPlayers())
		{
			player playsoundtoplayer(var_92700ed4, player);
		}
		wait(200);
	}
}

/*
	Name: function_7cc69b6
	Namespace: namespace_448750e
	Checksum: 0x1D09F0C7
	Offset: 0x1CC8
	Size: 0x100
	Parameters: 2
	Flags: None
	Line Number: 565
*/
function function_7cc69b6(var_9432817, loopSound)
{
	self.var_3f213c83 = function_3e4bb6e6("", "trigger_radius_use", self.origin, 40, 80);
	if(isdefined(loopSound))
	{
		self PlayLoopSound(loopSound);
	}
	while(isdefined(self))
	{
		self.var_3f213c83 waittill("trigger", player);
		if(isdefined(var_9432817))
		{
			playsoundatposition(var_9432817, self.var_3f213c83.origin);
		}
		self StopLoopSound(2);
		level.var_b2106339++;
		self.var_3f213c83 delete();
	}
}

/*
	Name: function_ab3e9bbb
	Namespace: namespace_448750e
	Checksum: 0x69C82EDB
	Offset: 0x1DD0
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 595
*/
function function_ab3e9bbb(Distance)
{
	j = 0;
	foreach(player in GetPlayers())
	{
		if(Distance(self.origin, player.origin) < Distance && zm_utility::is_player_valid(player) || !player laststand::player_is_in_laststand())
		{
			j++;
		}
	}
	if(j == GetPlayers().size)
	{
		return 1;
		continue;
	}
	return 0;
}

/*
	Name: function_48b3149f
	Namespace: namespace_448750e
	Checksum: 0x3D5D326E
	Offset: 0x1F00
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 623
*/
function function_48b3149f()
{
	j = 0;
	foreach(player in GetPlayers())
	{
		if(player istouching(self) && zm_utility::is_player_valid(player) || !player laststand::player_is_in_laststand())
		{
			j++;
		}
	}
	if(j == GetPlayers().size)
	{
		return 1;
		continue;
	}
	return 0;
}

/*
	Name: function_c814c1b3
	Namespace: namespace_448750e
	Checksum: 0xF725FDC7
	Offset: 0x2010
	Size: 0x90
	Parameters: 4
	Flags: None
	Line Number: 651
*/
function function_c814c1b3(var_b7ec3553, var_1ca5ecb2, var_eb1fa221, var_a8adead0)
{
	level.var_2016e866[0] = var_b7ec3553;
	level.var_2016e866[1] = var_1ca5ecb2;
	level.var_2016e866[2] = var_eb1fa221;
	level.var_2016e866[3] = var_a8adead0;
	level.giveCustomLoadout = &function_65c8a9fb;
}

/*
	Name: function_65c8a9fb
	Namespace: namespace_448750e
	Checksum: 0xBEF8C7FE
	Offset: 0x20A8
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 670
*/
function function_65c8a9fb(b_switch_weapon)
{
	if(!isdefined(self.hasCompletedSuperEE))
	{
		self.hasCompletedSuperEE = self zm_stats::get_global_stat("DARKOPS_GENESIS_SUPER_EE") > 0;
	}
	if(self.hasCompletedSuperEE)
	{
		self zm_weapons::weapon_give(GetWeapon(Array::random(level.var_2016e866[self.characterindex])), 0, 0, 1, 0);
		self giveMaxAmmo(level.start_weapon);
		self zm_weapons::weapon_give(level.super_ee_weapon, 0, 0, 1, b_switch_weapon);
		continue;
	}
	self zm_weapons::weapon_give(GetWeapon(Array::random(level.var_2016e866[self.characterindex])), 0, 0, 1, b_switch_weapon);
}

/*
	Name: function_37b0af2a
	Namespace: namespace_448750e
	Checksum: 0x30D8A1B6
	Offset: 0x21F0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 696
*/
function function_37b0af2a(weapons_list)
{
	level.var_e1f53465 = weapons_list;
	level.giveCustomLoadout = &give_start_weapon;
}

/*
	Name: give_start_weapon
	Namespace: namespace_448750e
	Checksum: 0x456E6461
	Offset: 0x2228
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 712
*/
function give_start_weapon(b_switch_weapon)
{
	if(!isdefined(self.hasCompletedSuperEE))
	{
		self.hasCompletedSuperEE = self zm_stats::get_global_stat("DARKOPS_GENESIS_SUPER_EE") > 0;
	}
	if(self.hasCompletedSuperEE)
	{
		self zm_weapons::weapon_give(GetWeapon(Array::random(level.var_e1f53465)), 0, 0, 1, 0);
		self giveMaxAmmo(level.start_weapon);
		self zm_weapons::weapon_give(level.super_ee_weapon, 0, 0, 1, b_switch_weapon);
		continue;
	}
	self zm_weapons::weapon_give(GetWeapon(Array::random(level.var_e1f53465)), 0, 0, 1, b_switch_weapon);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_840ccc3b
	Namespace: namespace_448750e
	Checksum: 0x5734FBBF
	Offset: 0x2360
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 740
*/
function function_840ccc3b(weapon)
{
	level.start_weapon = GetWeapon(weapon);
}

/*
	Name: function_58f78a24
	Namespace: namespace_448750e
	Checksum: 0xFCFCB032
	Offset: 0x2398
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 755
*/
function function_58f78a24(weapon)
{
	level.default_laststandpistol = GetWeapon(weapon);
	level.default_solo_laststandpistol = GetWeapon(weapon);
	level.laststandpistol = level.default_laststandpistol;
	level thread zm::last_stand_pistol_rank_init();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f3c8704f
	Namespace: namespace_448750e
	Checksum: 0x9A97CBD4
	Offset: 0x2418
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 775
*/
function function_f3c8704f(weapon)
{
	level.default_laststandpistol = GetWeapon(weapon);
	level.default_solo_laststandpistol = GetWeapon(weapon);
	level.laststandpistol = level.default_laststandpistol;
	level.start_weapon = level.default_laststandpistol;
	level thread zm::last_stand_pistol_rank_init();
}

/*
	Name: function_b1921758
	Namespace: namespace_448750e
	Checksum: 0xBC9840A5
	Offset: 0x24A8
	Size: 0x1C8
	Parameters: 3
	Flags: None
	Line Number: 794
*/
function function_b1921758(var_a6c23910, var_e38dcc58, var_ac38c126)
{
	if(!isdefined(var_a6c23910))
	{
		var_a6c23910 = 5;
	}
	if(!isdefined(var_e38dcc58))
	{
		var_e38dcc58 = 18;
	}
	if(!isdefined(var_ac38c126))
	{
		var_ac38c126 = 24;
	}
	level endon("intermission");
	level flag::init("non_stop_dog_spawning");
	level flag::set("non_stop_dog_spawning");
	wait(0.05);
	var_ca1598c6 = var_a6c23910;
	var_c33ae6e4 = var_e38dcc58;
	var_a7653ae6 = var_ac38c126;
	while(1)
	{
		var_daa6bbd3 = level.zombie_total;
		while(var_daa6bbd3 >= var_ca1598c6)
		{
			wait(randomIntRange(var_c33ae6e4, var_a7653ae6));
			var_145c329d = zombie_utility::get_current_zombie_count();
			var_daa6bbd3 = var_145c329d + level.zombie_total;
			if(var_145c329d < level.zombie_ai_limit && (isdefined(level flag::get("non_stop_dog_spawning")) && level flag::get("non_stop_dog_spawning")))
			{
				zm_ai_dogs::special_dog_spawn(1);
			}
		}
	}
}

/*
	Name: function_3e4bb6e6
	Namespace: namespace_448750e
	Checksum: 0x6E90F4E6
	Offset: 0x2678
	Size: 0x128
	Parameters: 5
	Flags: None
	Line Number: 841
*/
function function_3e4bb6e6(hintString, trigger_type, origin, radius, height)
{
	if(!isdefined(hintString))
	{
		hintString = "No hintstring set";
	}
	if(!isdefined(trigger_type))
	{
		trigger_type = "trigger_radius_use";
	}
	if(!isdefined(radius))
	{
		radius = 40;
	}
	if(!isdefined(height))
	{
		height = 80;
	}
	trigger = spawn(trigger_type, origin, 0, radius, height);
	trigger setHintString(hintString);
	trigger TriggerIgnoreTeam();
	trigger setvisibletoall();
	trigger setcursorhint("HINT_NOICON");
	return trigger;
}

/*
	Name: function_81c46b2a
	Namespace: namespace_448750e
	Checksum: 0xF1B1F5C3
	Offset: 0x27A8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 877
*/
function function_81c46b2a(rounds)
{
	for(i = 0; i <= rounds; i++)
	{
		level waittill("start_of_round");
	}
	return;
	continue;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_35bd70cb
	Namespace: namespace_448750e
	Checksum: 0xD0505F40
	Offset: 0x27F8
	Size: 0x178
	Parameters: 6
	Flags: None
	Line Number: 898
*/
function function_35bd70cb(origin, angle, perk, model, parameters, string)
{
	struct = struct::spawn(origin, angle);
	struct.angles = angle;
	struct.targetname = "zm_perk_machine";
	if(isdefined(perk))
	{
		struct.script_noteworthy = perk;
	}
	if(isdefined(parameters))
	{
		struct.script_parameters = parameters;
	}
	if(isdefined(model))
	{
		struct.model = model;
	}
	if(isdefined(string))
	{
		struct.script_string = string;
	}
	if(!isdefined(level.struct_class_names["targetname"]["zm_perk_machine"]))
	{
		level.struct_class_names["targetname"]["zm_perk_machine"] = [];
	}
	level.struct_class_names["targetname"]["zm_perk_machine"][level.struct_class_names["targetname"]["zm_perk_machine"].size] = struct;
	return struct;
}

/*
	Name: function_850ce7cb
	Namespace: namespace_448750e
	Checksum: 0x13E33358
	Offset: 0x2978
	Size: 0x210
	Parameters: 3
	Flags: None
	Line Number: 937
*/
function function_850ce7cb(perk, origin, angles)
{
	triggers = GetEntArray(perk, "script_noteworthy");
	if(triggers.size > 0)
	{
		t_use = triggers[0];
		t_use.origin = origin + VectorScale((0, 0, 1), 60);
		if(isdefined(t_use.machine))
		{
			t_use.machine.origin = origin;
			t_use.machine.angles = angles;
		}
		if(isdefined(t_use.bump))
		{
			t_use.bump.origin = origin + VectorScale((0, 0, 1), 20);
			t_use.bump.angles = angles;
		}
		if(isdefined(t_use.s_fxloc))
		{
			t_use.s_fxloc.origin = origin;
			t_use.s_fxloc.angles = angles;
		}
		if(isdefined(t_use.clip))
		{
			t_use.clip connectpaths();
			t_use.clip.origin = origin;
			t_use.clip.angles = angles;
			t_use.clip disconnectpaths();
		}
	}
	wait(0.05);
}

/*
	Name: function_95a748c3
	Namespace: namespace_448750e
	Checksum: 0x3904EDFF
	Offset: 0x2B90
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 980
*/
function function_95a748c3(damage)
{
	self endon("death");
	self endon("disconnect");
	if(!(isdefined(self.is_burning) && self.is_burning) && !self laststand::player_is_in_laststand())
	{
		self.is_burning = 1;
		if(isdefined(level.trap_fire_visionset_registered) && level.trap_fire_visionset_registered)
		{
			visionset_mgr::activate("overlay", "zm_trap_burn", self, 1.25, 1.25);
			continue;
		}
		self setburn(1.25);
		self notify("burned");
		if(!self hasPerk("specialty_armorvest") || self.health - 100 < 1)
		{
			radiusdamage(self.origin, 10, self.health + 100, self.health + 100);
			self.is_burning = undefined;
			continue;
		}
		self DoDamage(damage, self.origin);
		wait(0.1);
		self.is_burning = undefined;
	}
}

/*
	Name: player_max_ammo
	Namespace: namespace_448750e
	Checksum: 0x22BA52B7
	Offset: 0x2D20
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 1016
*/
function player_max_ammo()
{
	weapons_list = self GetWeaponsList(1);
	foreach(weapon in weapons_list)
	{
		if(weapon != level.weaponNone)
		{
			self SetWeaponOverheating(0, 0);
			max = weapon.maxAmmo;
			if(isdefined(max))
			{
				self SetWeaponAmmoStock(weapon, max);
			}
			if(isdefined(self zm_utility::get_player_tactical_grenade()))
			{
				self giveMaxAmmo(self zm_utility::get_player_tactical_grenade());
			}
			if(isdefined(self zm_utility::get_player_lethal_grenade()))
			{
				self giveMaxAmmo(self zm_utility::get_player_lethal_grenade());
			}
		}
	}
}

/*
	Name: function_a165ed6f
	Namespace: namespace_448750e
	Checksum: 0xFE856658
	Offset: 0x2EB0
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 1051
*/
function function_a165ed6f()
{
	weap = self GetCurrentWeapon();
	weapon = zm_weapons::get_upgrade_weapon(weap, 0);
	if(isdefined(level.aat_in_use) && level.aat_in_use)
	{
		self thread AAT::acquire(weapon);
	}
	weapon.camo_index = self zm_weapons::get_pack_a_punch_weapon_options(weapon);
	self TakeWeapon(weap);
	self GiveWeapon(weapon, weapon.camo_index);
	self giveMaxAmmo(weapon);
	self SwitchToWeapon(weapon);
	zm_utility::play_sound_at_pos("zmb_perks_packa_ready", self);
}

/*
	Name: function_b0c8d53c
	Namespace: namespace_448750e
	Checksum: 0x7A578582
	Offset: 0x2FE8
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 1077
*/
function function_b0c8d53c()
{
	weap = self GetCurrentWeapon();
	weapon = zm_weapons::get_upgrade_weapon(weap, 0);
	weapon.camo_index = self zm_weapons::get_pack_a_punch_weapon_options(weapon);
	self TakeWeapon(weap);
	self GiveWeapon(weapon, weapon.camo_index);
	self giveMaxAmmo(weapon);
	self SwitchToWeapon(weapon);
	zm_utility::play_sound_at_pos("zmb_perks_packa_ready", self);
}

/*
	Name: function_2d4daf17
	Namespace: namespace_448750e
	Checksum: 0xF9A0A253
	Offset: 0x30F8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 1099
*/
function function_2d4daf17()
{
	weap = self GetCurrentWeapon();
	weapon = zm_weapons::get_base_weapon(weap);
	self TakeWeapon(weap);
	self GiveWeapon(weapon, self zm_weapons::get_pack_a_punch_weapon_options(weapon));
	self GiveStartAmmo(weapon);
	self SwitchToWeapon(weapon);
	zm_utility::play_sound_at_pos("zmb_perks_packa_ready", self);
}

/*
	Name: function_75041ada
	Namespace: namespace_448750e
	Checksum: 0x880C5C63
	Offset: 0x31E0
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 1120
*/
function function_75041ada(Distance)
{
	if(!isdefined(Distance))
	{
		Distance = 8000;
	}
	direction = self getPlayerAngles();
	direction_vec = AnglesToForward(direction);
	eye = self GetEye();
	scale = Distance;
	direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
	trace = bullettrace(eye, eye + direction_vec, 0, undefined);
	final_pos = trace["position"];
	return final_pos;
}

/*
	Name: take_all_perks
	Namespace: namespace_448750e
	Checksum: 0xA6F1BAB7
	Offset: 0x3300
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1146
*/
function take_all_perks()
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	if(vending_triggers.size < 1)
	{
		debug_print(0, "No perk machines found in map");
		return;
	}
	foreach(var_3a51e779 in getArrayKeys(level._custom_perks))
	{
		self zm_perks::lose_random_perk();
		wait(0.5);
	}
}

/*
	Name: take_perk
	Namespace: namespace_448750e
	Checksum: 0x4C6CE9F1
	Offset: 0x3408
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 1171
*/
function take_perk(perk)
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	if(vending_triggers.size < 1)
	{
		debug_print(0, "No perk machines found in map");
		return;
	}
	if(!isdefined(perk))
	{
		self zm_perks::lose_random_perk();
		continue;
	}
	perk_str = perk + "_stop";
	self notify(perk_str);
	if(use_solo_revive() && perk == "specialty_quickrevive")
	{
		self.lives--;
	}
}

/*
	Name: use_solo_revive
	Namespace: namespace_448750e
	Checksum: 0x2D7E788A
	Offset: 0x34E8
	Size: 0x90
	Parameters: 0
	Flags: Private
	Line Number: 1202
*/
function private use_solo_revive()
{
	if(isdefined(level.override_use_solo_revive))
	{
		return [[level.override_use_solo_revive]]();
	}
	players = GetPlayers();
	solo_mode = 0;
	if(players.size == 1 || (isdefined(level.force_solo_quick_revive) && level.force_solo_quick_revive))
	{
		solo_mode = 1;
	}
	level.using_solo_revive = solo_mode;
	return solo_mode;
}

/*
	Name: function_7dec9f20
	Namespace: namespace_448750e
	Checksum: 0x75FF17C0
	Offset: 0x3580
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 1228
*/
function function_7dec9f20()
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	if(vending_triggers.size < 1)
	{
		debug_print(0, "No perk machines found in map");
		return;
	}
	foreach(var_3a51e779 in getArrayKeys(level._custom_perks))
	{
		self zm_perks::give_perk(var_3a51e779, 0);
		wait(0.5);
	}
}

/*
	Name: function_b7b478f4
	Namespace: namespace_448750e
	Checksum: 0xC7753551
	Offset: 0x3690
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 1253
*/
function function_b7b478f4(perk)
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	if(vending_triggers.size < 1)
	{
		debug_print(0, "No perk machines found in map");
		return;
	}
	if(!isdefined(perk))
	{
		self zm_perks::give_random_perk();
		continue;
	}
	self zm_perks::give_perk(perk, 0);
}

/*
	Name: function_17d4f8b6
	Namespace: namespace_448750e
	Checksum: 0x7252AA2C
	Offset: 0x3740
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1279
*/
function function_17d4f8b6()
{
	level waittill("hash_f938585a");
	level flag::clear("power_off");
	level flag::set("power_on");
}

/*
	Name: function_321f175c
	Namespace: namespace_448750e
	Checksum: 0x442B807D
	Offset: 0x3798
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1296
*/
function function_321f175c()
{
	level waittill("hash_f938585a");
	level flag::clear("power_on");
	level flag::set("power_off");
	level clientfield::set("zombie_power_off", 0);
	level notify("power_off");
	return;
	ERROR: Bad function call
}

/*
	Name: function_87d59061
	Namespace: namespace_448750e
	Checksum: 0xE451E50
	Offset: 0x3820
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 1317
*/
function function_87d59061(camo_index)
{
	self function_c8540b60(self GetCurrentWeapon(), self CalcWeaponOptions(camo_index, 0, 0));
}

/*
	Name: function_a61842a5
	Namespace: namespace_448750e
	Checksum: 0xCC5CFF8
	Offset: 0x3878
	Size: 0xF8
	Parameters: 2
	Flags: None
	Line Number: 1332
*/
function function_a61842a5(origin, angles)
{
	foreach(zombie in GetAITeamArray("axis"))
	{
		if(!isdefined(angles))
		{
			zombie ForceTeleport(origin, zombie.angles, 1);
			continue;
		}
		zombie ForceTeleport(origin, angles, 1);
	}
}

/*
	Name: function_171dccf2
	Namespace: namespace_448750e
	Checksum: 0xEF2F3C37
	Offset: 0x3978
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 1355
*/
function function_171dccf2()
{
	level flag::clear("spawn_zombies");
	a_ai_enemies = GetAITeamArray("axis");
	foreach(ai_enemy in a_ai_enemies)
	{
		level.zombie_total++;
		level.zombie_respawns++;
		ai_enemy kill();
	}
	return;
}

/*
	Name: function_2e69f2c4
	Namespace: namespace_448750e
	Checksum: 0x6B16E91A
	Offset: 0x3A60
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1378
*/
function function_2e69f2c4()
{
	level flag::set("spawn_zombies");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8824774d
	Namespace: namespace_448750e
	Checksum: 0x11517205
	Offset: 0x3A90
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 1395
*/
function function_8824774d(round_number)
{
	if(!isdefined(round_number))
	{
		round_number = undefined;
	}
	if(!isdefined(round_number))
	{
		round_number = zm::get_round_number();
	}
	if(round_number == zm::get_round_number())
	{
		return;
	}
	if(round_number < 0)
	{
		return;
	}
	/#
		level notify("kill_round");
	#/
	level notify("end_of_round");
	level.zombie_total = 0;
	zm::set_round_number(round_number);
	round_number = zm::get_round_number();
	zombie_utility::ai_calculate_health(round_number);
	SetRoundsPlayed(round_number);
	foreach(zombie in zombie_utility::get_round_enemy_array())
	{
		zombie kill();
	}
	if(level.gamedifficulty == 0)
	{
		level.zombie_move_speed = round_number * level.zombie_vars["zombie_move_speed_multiplier_easy"];
		continue;
	}
	level.zombie_move_speed = round_number * level.zombie_vars["zombie_move_speed_multiplier"];
	level.zombie_vars["zombie_spawn_delay"] = [[level.func_get_zombie_spawn_delay]](round_number);
	level.sndGotoRoundOccurred = 1;
	level waittill("between_round_over");
}

/*
	Name: function_fab5784
	Namespace: namespace_448750e
	Checksum: 0xFD719750
	Offset: 0x3CA0
	Size: 0xA8
	Parameters: 4
	Flags: None
	Line Number: 1447
*/
function function_fab5784(targetname, item_name, var_aecafcb6, var_c51687a1)
{
	level flag::init(var_aecafcb6);
	wait(1);
	level flag::wait_till("initial_blackscreen_passed");
	Array::thread_all(GetEntArray(targetname, "targetname"), &function_81905d01, item_name, var_aecafcb6, var_c51687a1);
	return;
	continue;
}

/*
	Name: function_81905d01
	Namespace: namespace_448750e
	Checksum: 0xD918593E
	Offset: 0x3D50
	Size: 0x1F8
	Parameters: 3
	Flags: None
	Line Number: 1467
*/
function function_81905d01(item_name, var_aecafcb6, var_c51687a1)
{
	if(!isdefined(item_name))
	{
		item_name = "Item";
	}
	self.trigger = spawn("trigger_radius_use", self.origin, 0, 64, 64);
	self.trigger TriggerIgnoreTeam();
	self.trigger setvisibletoall();
	self.trigger SetTeamForTrigger("none");
	self.trigger UseTriggerRequireLookAt();
	self.trigger setcursorhint("HINT_NOICON");
	self.trigger setHintString("Hold ^3&&1^7 to Pickup " + item_name);
	while(isdefined(self))
	{
		self.trigger waittill("trigger", player);
		if(player zm_utility::in_revive_trigger() || player.IS_DRINKING > 0 || !zm_utility::is_player_valid(player))
		{
			continue;
		}
		playsoundatposition(var_c51687a1, self.origin);
		level flag::set(var_aecafcb6);
		self.trigger delete();
		self delete();
	}
}

/*
	Name: function_242998b7
	Namespace: namespace_448750e
	Checksum: 0x60ED3167
	Offset: 0x3F50
	Size: 0x110
	Parameters: 4
	Flags: None
	Line Number: 1504
*/
function function_242998b7(origin, angles, var_36549c96, var_1545e5bb)
{
	var_aa37ce2d = level.pack_a_punch.triggers[0];
	var_aa37ce2d EnableLinkTo();
	var_aa37ce2d.clip LinkTo(var_aa37ce2d.zbarrier);
	var_aa37ce2d LinkTo(var_aa37ce2d.zbarrier);
	var_aa37ce2d.zbarrier LinkTo(var_aa37ce2d, "tag_origin");
	var_aa37ce2d moveto(origin, var_36549c96, var_1545e5bb);
	var_aa37ce2d RotateTo(angles, var_36549c96);
}

/*
	Name: function_12c54801
	Namespace: namespace_448750e
	Checksum: 0x69C9398F
	Offset: 0x4068
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1525
*/
function function_12c54801()
{
	level flag::init("infinite_zombie_spawning");
	level flag::set("infinite_zombie_spawning");
	wait(0.5);
	while(level flag::get("infinite_zombie_spawning"))
	{
		wait(0.05);
		if(zombie_utility::get_current_zombie_count() < level.zombie_ai_limit)
		{
			level.zombie_total = level.zombie_ai_limit;
		}
		self waittill("death");
		level.zombie_respawns++;
	}
}

/*
	Name: function_dc1b7f5b
	Namespace: namespace_448750e
	Checksum: 0x3E3EF671
	Offset: 0x4130
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1552
*/
function function_dc1b7f5b()
{
	level flag::clear("infinite_zombie_spawning");
	return;
}

/*
	Name: function_c89e8fe0
	Namespace: namespace_448750e
	Checksum: 0x5B65A238
	Offset: 0x4160
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 1568
*/
function function_c89e8fe0(perk)
{
	zm_perks::perk_machine_removal(perk);
	level._custom_perks = Array::remove_index(level._custom_perks, perk, 1);
}

/*
	Name: function_a28937e2
	Namespace: namespace_448750e
	Checksum: 0x7AC6A93F
	Offset: 0x41B8
	Size: 0x78
	Parameters: 5
	Flags: None
	Line Number: 1584
*/
function function_a28937e2(targetname, points, var_80c2013a, var_87d5cc47, var_9e4db9f1)
{
	Array::thread_all(GetEntArray(targetname, "targetname"), &function_fc508d0f, points, var_80c2013a, var_87d5cc47, var_9e4db9f1);
}

/*
	Name: function_fc508d0f
	Namespace: namespace_448750e
	Checksum: 0xB0F855DE
	Offset: 0x4238
	Size: 0x198
	Parameters: 4
	Flags: None
	Line Number: 1599
*/
function function_fc508d0f(points, var_80c2013a, var_87d5cc47, var_9e4db9f1)
{
	self setcandamage(1);
	while(isdefined(self))
	{
		self waittill("damage", n_damage, e_attacker, v_dir, v_loc, str_type, STR_MODEL, str_tag, str_part, w_weapon);
		if(isdefined(var_80c2013a) && GetWeapon(var_80c2013a) != w_weapon)
		{
			continue;
		}
		if(isdefined(var_87d5cc47) && var_87d5cc47 && !zm_weapons::is_weapon_upgraded(w_weapon))
		{
			continue;
		}
		if(isdefined(var_9e4db9f1))
		{
			e_attacker playsoundtoplayer(var_9e4db9f1, e_attacker);
		}
		Array::thread_all(GetPlayers(), &function_a3774da7, points);
		self delete();
	}
}

/*
	Name: debug_print
	Namespace: namespace_448750e
	Checksum: 0x8D7B5033
	Offset: 0x43D8
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 1632
*/
function debug_print(type, print)
{
	if(type == 0 || type == undefined || type == "")
	{
		IPrintLnBold("^1 Debug: ^7" + print);
		continue;
	}
	iprintln("^1 Debug: ^7" + print);
}

/*
	Name: function_a3774da7
	Namespace: namespace_448750e
	Checksum: 0x72ECFAF5
	Offset: 0x4468
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 1652
*/
function function_a3774da7(amount)
{
	if(!isdefined(amount))
	{
		amount = 500;
	}
	self zm_score::add_to_player_score(amount);
	zm_utility::play_sound_at_pos("purchase", self.origin);
	return;
}

/*
	Name: function_f552b2e9
	Namespace: namespace_448750e
	Checksum: 0xC1335C5D
	Offset: 0x44D0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1673
*/
function function_f552b2e9(amount)
{
	if(!isdefined(amount))
	{
		amount = 500;
	}
	self zm_score::minus_to_player_score(amount);
}

/*
	Name: function_df15062a
	Namespace: namespace_448750e
	Checksum: 0xC2ADC7FE
	Offset: 0x4518
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1692
*/
function function_df15062a()
{
	if(SessionModeIsMultiplayerGame())
	{
		self notify("hash_cc103064");
	}
	self AllowCrouch(1);
	self allowprone(1);
	self AllowStand(1);
	self AllowJump(1);
	self AllowMelee(1);
	self AllowSprint(1);
	self setMoveSpeedScale(1);
	self EnableWeaponCycling();
	self EnableOffhandWeapons();
}

/*
	Name: function_a2b97522
	Namespace: namespace_448750e
	Checksum: 0x419CAF73
	Offset: 0x4620
	Size: 0x5D0
	Parameters: 4
	Flags: None
	Line Number: 1719
*/
function function_a2b97522(var_ff5fe3bd, var_31771afb, var_4aa5d9e4, var_ea935255)
{
	start = var_ff5fe3bd.origin;
	forward_dir = AnglesToForward(var_ff5fe3bd.angles);
	end = start + forward_dir * var_31771afb;
	trace = bullettrace(start, end, 0, undefined);
	final_pos = trace["position"];
	if(var_4aa5d9e4 function_ea1ff2ee(start, final_pos, var_ea935255))
	{
		return final_pos;
	}
	forward_dir = AnglesToForward(var_ff5fe3bd.angles - VectorScale((0, 1, 0), 45));
	end = start + forward_dir * var_31771afb;
	trace = bullettrace(start, end, 0, undefined);
	final_pos = trace["position"];
	if(var_4aa5d9e4 function_ea1ff2ee(start, final_pos, var_ea935255))
	{
		return final_pos;
	}
	forward_dir = AnglesToForward(var_ff5fe3bd.angles + VectorScale((0, 1, 0), 45));
	end = start + forward_dir * var_31771afb;
	trace = bullettrace(start, end, 0, undefined);
	final_pos = trace["position"];
	if(var_4aa5d9e4 function_ea1ff2ee(start, final_pos, var_ea935255))
	{
		return final_pos;
	}
	forward_dir = AnglesToForward(var_ff5fe3bd.angles - VectorScale((0, 1, 0), 90));
	end = start + forward_dir * var_31771afb;
	trace = bullettrace(start, end, 0, undefined);
	final_pos = trace["position"];
	if(var_4aa5d9e4 function_ea1ff2ee(start, final_pos, var_ea935255))
	{
		return final_pos;
	}
	forward_dir = AnglesToForward(var_ff5fe3bd.angles + VectorScale((0, 1, 0), 90));
	end = start + forward_dir * var_31771afb;
	trace = bullettrace(start, end, 0, undefined);
	final_pos = trace["position"];
	if(var_4aa5d9e4 function_ea1ff2ee(start, final_pos, var_ea935255))
	{
		return final_pos;
	}
	forward_dir = AnglesToForward(var_ff5fe3bd.angles - VectorScale((0, 1, 0), 135));
	end = start + forward_dir * var_31771afb;
	trace = bullettrace(start, end, 0, undefined);
	final_pos = trace["position"];
	if(var_4aa5d9e4 function_ea1ff2ee(start, final_pos, var_ea935255))
	{
		return final_pos;
	}
	forward_dir = AnglesToForward(var_ff5fe3bd.angles + VectorScale((0, 1, 0), 135));
	end = start + forward_dir * var_31771afb;
	trace = bullettrace(start, end, 0, undefined);
	final_pos = trace["position"];
	if(var_4aa5d9e4 function_ea1ff2ee(start, final_pos, var_ea935255))
	{
		return final_pos;
	}
	forward_dir = AnglesToForward(var_ff5fe3bd.angles + VectorScale((0, 1, 0), 180));
	end = start + forward_dir * var_31771afb;
	trace = bullettrace(start, end, 0, undefined);
	final_pos = trace["position"];
	if(var_4aa5d9e4 function_ea1ff2ee(start, final_pos, var_ea935255))
	{
		return final_pos;
	}
	final_pos = var_ff5fe3bd.origin;
	if(var_4aa5d9e4 function_ea1ff2ee(start, final_pos, var_ea935255))
	{
		return final_pos;
	}
}

/*
	Name: function_ea1ff2ee
	Namespace: namespace_448750e
	Checksum: 0xCE80A0D1
	Offset: 0x4BF8
	Size: 0x90
	Parameters: 3
	Flags: None
	Line Number: 1803
*/
function function_ea1ff2ee(start, final_pos, radius)
{
	if(IsPointOnNavMesh(final_pos, radius * 2.5) && TracePassedOnNavMesh(start, final_pos, radius))
	{
		if(self MayMoveFromPointToPoint(start, final_pos, 0, 0))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_3efe5ad0
	Namespace: namespace_448750e
	Checksum: 0xAAACFADE
	Offset: 0x4C90
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 1825
*/
function function_3efe5ad0(stance)
{
	if(!isdefined(stance))
	{
		stance = self GetStance();
	}
	self SetVelocity((0, 0, 0));
	self SetStance(stance);
	self AllowedStances(stance);
	if(SessionModeIsMultiplayerGame())
	{
		self thread function_882c3446(stance);
	}
	self AllowJump(0);
	self AllowMelee(0);
	self AllowSprint(0);
	self setMoveSpeedScale(0);
	self DisableWeaponCycling();
	self disableOffhandWeapons();
}

/*
	Name: function_882c3446
	Namespace: namespace_448750e
	Checksum: 0x7DD7B1E5
	Offset: 0x4DD0
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1856
*/
function function_882c3446(stance)
{
	self endon("death");
	self endon("disconnect");
	self endon("entering_last_stand");
	self endon("hash_cc103064");
	while(1)
	{
		self SetStance(stance);
		wait(0.05);
	}
}

/*
	Name: give_hero_weapon
	Namespace: namespace_448750e
	Checksum: 0x18F3DE6E
	Offset: 0x4E40
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 1879
*/
function give_hero_weapon(w_weapon)
{
	w_previous = self GetCurrentWeapon();
	self zm_weapons::weapon_give(w_weapon);
	self GadgetPowerSet(0, 99);
	self SwitchToWeapon(w_weapon);
	self waittill("weapon_change_complete");
	self SetLowReady(1);
	self SwitchToWeapon(w_previous);
	self util::waittill_any_timeout(1, "weapon_change_complete");
	self SetLowReady(0);
	self GadgetPowerSet(0, 100);
}

/*
	Name: function_c0e61153
	Namespace: namespace_448750e
	Checksum: 0x4EECBAFA
	Offset: 0x4F60
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1903
*/
function function_c0e61153(var_83318f89)
{
	level endon("end_game");
	while(!isdefined(level.machine_assets))
	{
		wait(0.05);
	}
	level.perk_purchase_limit = var_83318f89;
	return;
}

/*
	Name: function_124468ca
	Namespace: namespace_448750e
	Checksum: 0xA061E741
	Offset: 0x4FA8
	Size: 0x390
	Parameters: 3
	Flags: None
	Line Number: 1924
*/
function function_124468ca(var_d16d9d4, var_7f1e490f, var_591bcea6)
{
	if(!isdefined(var_d16d9d4))
	{
		var_d16d9d4 = "";
	}
	if(!isdefined(var_7f1e490f))
	{
		var_7f1e490f = "";
	}
	if(!isdefined(var_591bcea6))
	{
		var_591bcea6 = "";
	}
	wait(1);
	level flag::wait_till("initial_blackscreen_passed");
	intro_hud = [];
	str_text = Array(var_d16d9d4, var_7f1e490f, var_591bcea6);
	for(i = 0; i < str_text.size; i++)
	{
		intro_hud[i] = NewHudElem();
		intro_hud[i].x = 20;
		intro_hud[i].y = -250 + 20 * i;
		if(IsSplitscreen())
		{
			continue;
		}
		intro_hud[i].fontscale = 1.75;
		intro_hud[i].alignX = "LEFT";
		intro_hud[i].alignY = "BOTTOM";
		intro_hud[i].horzAlign = "LEFT";
		intro_hud[i].vertAlign = "BOTTOM";
		intro_hud[i].color = (1, 1, 1);
		intro_hud[i].alpha = 1;
		intro_hud[i].sort = 0;
		intro_hud[i].foreground = 1;
		intro_hud[i].hidewheninmenu = 1;
		intro_hud[i].archived = 0;
		intro_hud[i].showplayerteamhudelemtospectator = 1;
		intro_hud[i] setText(str_text[i]);
		intro_hud[i] SetTypewriterFX(100, 10000 - 3000 * i, 3000);
		wait(3);
	}
	wait(10);
	foreach(hudelem in intro_hud)
	{
		hudelem destroy();
	}
}

/*
	Name: function_81a5b7c9
	Namespace: namespace_448750e
	Checksum: 0x7E808BC4
	Offset: 0x5340
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 1984
*/
function function_81a5b7c9(origin, powerup)
{
	if(!isdefined(powerup))
	{
		powerup = "full_ammo";
	}
	while(!level.passed_introscreen)
	{
		wait(0.05);
	}
	level thread zm_powerups::specific_powerup_drop(powerup, origin.origin, undefined, undefined, undefined, undefined, 1);
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_95d4a940
	Namespace: namespace_448750e
	Checksum: 0x9C3DE26D
	Offset: 0x53C0
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 2010
*/
function function_95d4a940(origin, var_bc7a8f47)
{
	if(!isdefined(var_bc7a8f47))
	{
		var_bc7a8f47 = Array("full_ammo", "fire_sale", "insta_kill", "double_points");
	}
	while(!level.passed_introscreen)
	{
		wait(0.05);
	}
	level thread zm_powerups::specific_powerup_drop(Array::random(var_bc7a8f47), origin.origin, undefined, undefined, undefined, undefined, 1);
}

/*
	Name: function_813780cf
	Namespace: namespace_448750e
	Checksum: 0x399B4523
	Offset: 0x5478
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 2033
*/
function function_813780cf(Distance)
{
	if(!isdefined(Distance))
	{
		Distance = 250;
	}
	self endon("death");
	while(isdefined(self))
	{
		var_dc518be1 = ArrayGetClosest(self.origin, GetPlayers());
		if(isdefined(var_dc518be1))
		{
			dist = Distance(self.origin, var_dc518be1.origin);
			if(dist < Distance)
			{
				angles = self function_ab9afa24(var_dc518be1.origin);
				self RotateTo(angles - VectorScale((0, 1, 0), 90), 0.2);
			}
			else if(self.angles != self.original_angles)
			{
				self RotateTo(self.original_angles, 0.5);
			}
		}
		wait(0.3);
	}
}

/*
	Name: function_ab9afa24
	Namespace: namespace_448750e
	Checksum: 0xA3488CA7
	Offset: 0x55E8
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 2070
*/
function function_ab9afa24(origin)
{
	v_to_enemy = (origin - self.origin[0], origin - self.origin[1], 0);
	v_to_enemy = VectorNormalize(v_to_enemy);
	goalAngles = VectorToAngles(v_to_enemy);
	return goalAngles;
}

/*
	Name: function_2f7fca13
	Namespace: namespace_448750e
	Checksum: 0x4E113939
	Offset: 0x5678
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 2088
*/
function function_2f7fca13(rotateSpeed)
{
	while(isdefined(self))
	{
		self RotateYaw(360, rotateSpeed);
		wait(rotateSpeed);
	}
}

/*
	Name: function_2917b6ba
	Namespace: namespace_448750e
	Checksum: 0xABCFCB71
	Offset: 0x56C0
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 2107
*/
function function_2917b6ba(var_df20f103, var_620c330d)
{
	if(!isdefined(var_df20f103))
	{
		var_df20f103 = 6;
	}
	if(!isdefined(var_620c330d))
	{
		var_620c330d = 7;
	}
	while(isdefined(self))
	{
		var_ec3f8524 = randomIntRange(var_df20f103, var_620c330d);
		self RotateYaw(360, var_ec3f8524);
		wait(var_ec3f8524);
	}
}

/*
	Name: function_e1859039
	Namespace: namespace_448750e
	Checksum: 0xC0A27E49
	Offset: 0x5758
	Size: 0x120
	Parameters: 5
	Flags: None
	Line Number: 2135
*/
function function_e1859039(var_466503ff, var_278b47c3, var_aa7689cd, var_df20f103, var_620c330d)
{
	if(!isdefined(var_466503ff))
	{
		var_466503ff = 3.5;
	}
	if(!isdefined(var_278b47c3))
	{
		var_278b47c3 = 6;
	}
	if(!isdefined(var_aa7689cd))
	{
		var_aa7689cd = 9;
	}
	if(!isdefined(var_df20f103))
	{
		var_df20f103 = 6;
	}
	if(!isdefined(var_620c330d))
	{
		var_620c330d = 7;
	}
	self Bobbing((0, 0, 1), var_466503ff, randomIntRange(var_278b47c3, var_aa7689cd));
	while(isdefined(self))
	{
		var_ec3f8524 = randomIntRange(var_df20f103, var_620c330d);
		self RotateYaw(360, var_ec3f8524);
		wait(var_ec3f8524);
	}
}

/*
	Name: function_b46dc4b
	Namespace: namespace_448750e
	Checksum: 0xA63D1EB7
	Offset: 0x5880
	Size: 0x1D8
	Parameters: 5
	Flags: None
	Line Number: 2176
*/
function function_b46dc4b(str_hint, n_radius, func_prompt_and_visibility, func_unitrigger_logic, s_trigger_type)
{
	if(!isdefined(n_radius))
	{
		n_radius = 64;
	}
	if(!isdefined(func_prompt_and_visibility))
	{
		func_prompt_and_visibility = &zm_unitrigger::unitrigger_prompt_and_visibility;
	}
	if(!isdefined(func_unitrigger_logic))
	{
		func_unitrigger_logic = &unitrigger_logic;
	}
	if(!isdefined(s_trigger_type))
	{
		s_trigger_type = "unitrigger_radius_use";
	}
	self.s_unitrigger = spawnstruct();
	self.s_unitrigger.origin = self.origin;
	self.s_unitrigger.angles = self.angles;
	self.s_unitrigger.script_unitrigger_type = "unitrigger_box_use";
	self.s_unitrigger.cursor_hint = "HINT_NOICON";
	self.s_unitrigger.hint_string = str_hint;
	self.s_unitrigger.script_width = 128;
	self.s_unitrigger.script_height = 128;
	self.s_unitrigger.script_length = 128;
	self.s_unitrigger.require_look_at = 0;
	self.s_unitrigger.related_parent = self;
	self.s_unitrigger.radius = n_radius;
	self.s_unitrigger.prompt_and_visibility_func = func_prompt_and_visibility;
	zm_unitrigger::register_static_unitrigger(self.s_unitrigger, func_unitrigger_logic);
}

/*
	Name: function_d412c1f9
	Namespace: namespace_448750e
	Checksum: 0xCFFCEFE0
	Offset: 0x5A60
	Size: 0x1F0
	Parameters: 5
	Flags: None
	Line Number: 2220
*/
function function_d412c1f9(str_hint, n_radius, func_prompt_and_visibility, func_unitrigger_logic, s_trigger_type)
{
	if(!isdefined(n_radius))
	{
		n_radius = 64;
	}
	if(!isdefined(func_prompt_and_visibility))
	{
		func_prompt_and_visibility = &zm_unitrigger::unitrigger_prompt_and_visibility;
	}
	if(!isdefined(func_unitrigger_logic))
	{
		func_unitrigger_logic = &unitrigger_logic;
	}
	if(!isdefined(s_trigger_type))
	{
		s_trigger_type = "unitrigger_radius_use";
	}
	self.s_unitrigger = spawnstruct();
	self.s_unitrigger.origin = self.origin;
	self.s_unitrigger.angles = self.angles;
	self.s_unitrigger.script_unitrigger_type = "unitrigger_box_use";
	self.s_unitrigger.cursor_hint = "HINT_NOICON";
	self.s_unitrigger.hint_string = str_hint;
	self.s_unitrigger.script_width = 128;
	self.s_unitrigger.script_height = 128;
	self.s_unitrigger.script_length = 128;
	self.s_unitrigger.require_look_at = 0;
	self.s_unitrigger.related_parent = self;
	self.s_unitrigger.radius = n_radius;
	zm_unitrigger::unitrigger_force_per_player_triggers(self.s_unitrigger, 1);
	self.s_unitrigger.prompt_and_visibility_func = func_prompt_and_visibility;
	zm_unitrigger::register_static_unitrigger(self.s_unitrigger, func_unitrigger_logic);
}

/*
	Name: unitrigger_logic
	Namespace: namespace_448750e
	Checksum: 0xE92E7F71
	Offset: 0x5C58
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 2265
*/
function unitrigger_logic()
{
	self endon("death");
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
		self.stub.related_parent notify("trigger_activated", player);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: progress_bar
	Namespace: namespace_448750e
	Checksum: 0xB1B23DED
	Offset: 0x5D08
	Size: 0x138
	Parameters: 7
	Flags: None
	Line Number: 2299
*/
function progress_bar(targetname, var_65f7e192, useTime, var_4d946dfb, var_2a744ac6, var_ecb6bc69, offset)
{
	var_7e439421 = function_3e4bb6e6("Hold ^3&&1^7 to " + var_65f7e192, "trigger_radius_use", GetEnt(targetname, "targetname").origin + offset, 40, 80);
	for(result = 0; !result; result = 0)
	{
		var_7e439421 waittill("trigger", player);
	}
	player playsound(var_ecb6bc69);
	var_7e439421 delete();
}

/*
	Name: function_63b18b4f
	Namespace: namespace_448750e
	Checksum: 0x9CFF57E4
	Offset: 0x5E48
	Size: 0xE8
	Parameters: 5
	Flags: None
	Line Number: 2320
*/
function function_63b18b4f(player, targetname, useTime, var_4d946dfb, var_2a744ac6)
{
	if(isdefined(useTime))
	{
		self.useTime = Int(useTime * 1000);
	}
	self thread zm_craftables::craftable_play_craft_fx(player);
	self thread function_16dfef08(player, targetname, var_4d946dfb, var_2a744ac6);
	retval = self util::waittill_any_return("craft_succeed", "craft_failed");
	if(retval == "craft_succeed")
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_16dfef08
	Namespace: namespace_448750e
	Checksum: 0xFCA3E1ED
	Offset: 0x5F38
	Size: 0x3F8
	Parameters: 4
	Flags: None
	Line Number: 2346
*/
function function_16dfef08(player, targetname, var_4d946dfb, var_2a744ac6)
{
	wait(0.01);
	if(!isdefined(self))
	{
		if(isdefined(player.craftableAudio))
		{
			player.craftableAudio delete();
			player.craftableAudio = undefined;
			return;
		}
	}
	if(!isdefined(self.useTime))
	{
		self.useTime = Int(3000);
	}
	self.craft_time = self.useTime;
	self.craft_start_time = GetTime();
	craft_time = self.craft_time;
	craft_start_time = self.craft_start_time;
	if(craft_time > 0)
	{
		player zm_utility::disable_player_move_states(1);
		player zm_utility::increment_is_drinking();
		orgweapon = player GetCurrentWeapon();
		build_weapon = GetWeapon("zombie_builder");
		player GiveWeapon(build_weapon);
		player SwitchToWeapon(build_weapon);
		player thread function_3d7ad849(craft_start_time, craft_time, var_4d946dfb);
		while(isdefined(self) && player function_9acb782(targetname) && GetTime() - self.craft_start_time < self.craft_time)
		{
			wait(0.01);
			if(isdefined(player) && !isdefined(player.craftableAudio))
			{
				player.craftableAudio = spawn("script_origin", player.origin);
				player.craftableAudio PlayLoopSound(var_2a744ac6);
			}
		}
		if(isdefined(player.craftableAudio))
		{
			player.craftableAudio delete();
			player.craftableAudio = undefined;
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
	if(isdefined(self) && player function_9acb782(targetname) && (self.craft_time <= 0 || GetTime() - self.craft_start_time >= self.craft_time))
	{
		self notify("craft_succeed");
	}
	else if(isdefined(player.craftableAudio))
	{
		player.craftableAudio delete();
		player.craftableAudio = undefined;
	}
	self notify("craft_failed");
}

/*
	Name: function_3d7ad849
	Namespace: namespace_448750e
	Checksum: 0xD44D10E7
	Offset: 0x6338
	Size: 0x100
	Parameters: 3
	Flags: None
	Line Number: 2420
*/
function function_3d7ad849(start_time, craft_time, var_4d946dfb)
{
	self.useBar = self hud::createPrimaryProgressBar();
	self.useBarText = self hud::createPrimaryProgressBarText();
	if(!isdefined(var_4d946dfb))
	{
		var_4d946dfb = &"ZOMBIE_BUILDING";
	}
	self.useBarText setText(var_4d946dfb);
	if(isdefined(self) && isdefined(start_time) && isdefined(craft_time))
	{
		self zm_craftables::player_progress_bar_update(start_time, craft_time);
	}
	self.useBarText hud::destroyElem();
	self.useBar hud::destroyElem();
}

/*
	Name: function_9acb782
	Namespace: namespace_448750e
	Checksum: 0xF446CC5
	Offset: 0x6440
	Size: 0x1BE
	Parameters: 1
	Flags: None
	Line Number: 2447
*/
function function_9acb782(targetname)
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
	trigger = GetEnt(targetname, "targetname");
	script_unitrigger_type = "unitrigger_radius_use";
	radius = 40;
	if(script_unitrigger_type == "unitrigger_radius_use")
	{
		torigin = trigger.origin;
		porigin = self GetEye();
		radius_sq = 2.25 * radius * radius;
		if(Distance2DSquared(torigin, porigin) > radius_sq)
		{
			return 0;
		}
	}
	else if(!isdefined(trigger) || !trigger istouching(self))
	{
		return 0;
	}
	if(!self util::is_player_looking_at(trigger.origin, 0.76))
	{
		return 0;
	}
	return 1;
}

