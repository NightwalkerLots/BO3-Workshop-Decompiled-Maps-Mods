#include scripts\codescripts\struct;
#include scripts\shared\_burnplayer;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\bots\_bot;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\gameobjects_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\kj_jzm_backpack;
#include scripts\zm\kj_jzm_instamachine;
#include scripts\zm\kj_jzm_tokens;
#include scripts\zm\kj_jzm_xp;
#include scripts\zm\kj_jzm_zombieboss;
#include scripts\zm\zmsavedata;

#namespace namespace_afd88775;

/*
	Name: __init__sytem__
	Namespace: namespace_afd88775
	Checksum: 0x6CC91168
	Offset: 0xDB8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 58
*/
function autoexec __init__sytem__()
{
	system::register("kj_jzm_gamemodes", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_afd88775
	Checksum: 0x9ACF73B8
	Offset: 0xE00
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function __init__()
{
}

/*
	Name: __main__
	Namespace: namespace_afd88775
	Checksum: 0x8418B4D9
	Offset: 0xE10
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function __main__()
{
	level.chest_joker_model = "tag_origin";
	level.var_946e6fa7 = level.round_number;
}

/*
	Name: function_716bfa70
	Namespace: namespace_afd88775
	Checksum: 0x9CCBC95C
	Offset: 0xE40
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 103
*/
function function_716bfa70()
{
	if(!self IsHost())
	{
		if(isdefined(self.var_1ad2f4ac))
		{
			IPrintLnBold(self.var_1ad2f4ac + "^7: Tried to Exfil, waiting for the leader");
			return;
		}
	}
	if(isdefined(level.var_2db5576c))
	{
		return;
	}
	else
	{
		level.var_2db5576c = 1;
		if(isdefined(self.var_1ad2f4ac))
		{
			IPrintLnBold(self.var_1ad2f4ac + "^7: Called for an Exfil");
		}
	}
	var_9434eb78 = self.origin + VectorScale((0, 0, 1), 35);
	var_606f09a3 = spawn("script_model", self.origin + VectorScale((0, 0, 1), 10000));
	var_606f09a3 SetModel("alien_exfil_spaceship");
	var_606f09a3 moveto(var_9434eb78, 10);
	var_606f09a3 waittill("movedone");
	IPrintLnBold("EXFIL SPACESHIP HAS ARRIVED");
	thread function_efe18f2c(var_606f09a3);
	wait(0.5);
	thread function_90de67e7(var_606f09a3);
}

/*
	Name: function_efe18f2c
	Namespace: namespace_afd88775
	Checksum: 0x83BAD433
	Offset: 0xFF8
	Size: 0x240
	Parameters: 1
	Flags: None
	Line Number: 146
*/
function function_efe18f2c(var_606f09a3)
{
	level endon("game_ended");
	var_71fe6ead = spawn("trigger_radius_use", var_606f09a3 GetTagOrigin("tag_origin"), 0, 32, 32);
	var_71fe6ead setcursorhint("HINT_NOICON");
	var_71fe6ead setHintString("Hold [{+activate}] to Exfil");
	var_71fe6ead SetTeamForTrigger("allies");
	for(;;)
	{
		var_71fe6ead waittill("trigger", player);
		player EnableInvulnerability();
		player SetElectrified(3);
		player playlocalsound("zmb_electrocute_zombie");
		var_f067608f = spawn("script_model", player.origin);
		var_f067608f SetModel("tag_origin");
		player LinkTo(var_f067608f);
		wait(0.1);
		player notify("stop_player_out_of_playable_area_monitor");
		player zm_utility::increment_ignoreme();
		var_f067608f moveto(var_606f09a3 GetTagOrigin("tag_end"), 3, 1.75, 0.5);
		var_f067608f waittill("movedone");
		var_f067608f delete();
		player DisableWeapons();
	}
}

/*
	Name: function_90de67e7
	Namespace: namespace_afd88775
	Checksum: 0xF19F4BEC
	Offset: 0x1240
	Size: 0x238
	Parameters: 1
	Flags: None
	Line Number: 182
*/
function function_90de67e7(var_606f09a3)
{
	level endon("game_ended");
	var_a0be62f0 = spawn("trigger_radius_use", var_606f09a3 GetTagOrigin("tag_reward_trig"), 0, 32, 32);
	var_a0be62f0 setcursorhint("HINT_NOICON");
	var_a0be62f0 setHintString("Hold [{+activate}] to claim your reward");
	var_a0be62f0 SetTeamForTrigger("allies");
	wait(1.5);
	var_407c99a9 = 0;
	players = GetPlayers();
	bots = 0;
	foreach(player in players)
	{
		if(player IsTestClient())
		{
			bots++;
		}
	}
	for(;;)
	{
		var_a0be62f0 waittill("trigger", player);
		if(!player IsTestClient())
		{
			var_a0be62f0 setinvisibletoplayer(player, 1);
			wait(0.5);
			var_407c99a9++;
			player function_d3f5610();
			wait(0.1);
			if(var_407c99a9 + bots >= players.size)
			{
				wait(3.5);
				level notify("end_game");
			}
		}
	}
}

/*
	Name: function_d3f5610
	Namespace: namespace_afd88775
	Checksum: 0x40FF6608
	Offset: 0x1480
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 229
*/
function function_d3f5610()
{
	if(isdefined(level.var_946e6fa7))
	{
		var_2799f63d = level.round_number - level.var_946e6fa7;
		self IPrintLnBold("^2Rounds Survived: " + var_2799f63d);
		if(var_2799f63d < 25)
		{
			self function_9ca8c86(0);
			wait(2);
		}
		else if(var_2799f63d < 50)
		{
			self function_9ca8c86(1);
			wait(2);
		}
		else if(var_2799f63d < 75)
		{
			self function_9ca8c86(2);
			wait(2);
		}
		else if(var_2799f63d < 100)
		{
			self function_9ca8c86(3);
			wait(2);
		}
		else if(var_2799f63d < 200)
		{
			self function_9ca8c86(4);
			wait(2);
		}
		else if(var_2799f63d >= 200)
		{
			self function_9ca8c86(5);
			wait(2);
			return;
		}
	}
}

/*
	Name: function_9ca8c86
	Namespace: namespace_afd88775
	Checksum: 0x6ADBA387
	Offset: 0x15F8
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 279
*/
function function_9ca8c86(var_ac062c79)
{
	if(isdefined(self.var_1c43abc3))
	{
		self.var_70a24c4d = 1;
		self.var_1c43abc3 = self.var_1c43abc3 + var_ac062c79;
		self.var_cfc277c6 = self.var_1c43abc3;
		self namespace_683dd809::function_c929e2bc(self.var_70a24c4d);
		self.var_70a24c4d = 0;
	}
}

/*
	Name: function_3a631f89
	Namespace: namespace_afd88775
	Checksum: 0x44A3BA8A
	Offset: 0x1670
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 301
*/
function function_3a631f89(var_ac062c79)
{
	if(isdefined(self.var_e9d0cac4))
	{
		self.var_e9d0cac4 = self.var_e9d0cac4 + var_ac062c79;
		self namespace_6d708c3b::function_494e7020();
	}
}

/*
	Name: function_b68b5eb5
	Namespace: namespace_afd88775
	Checksum: 0xBAA5BB20
	Offset: 0x16C0
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 320
*/
function function_b68b5eb5(players)
{
	self function_9217ea9e();
	self namespace_ec725530::function_ca7860d8(players);
	self function_eea3b04a();
	self function_2739fbbf();
	wait(0.2);
	if(isdefined(level.dogs_enabled) && level.dogs_enabled)
	{
		self function_8c32d8a0();
		self function_352d3b9b();
	}
}

/*
	Name: function_66f1be4a
	Namespace: namespace_afd88775
	Checksum: 0x66883569
	Offset: 0x1780
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 344
*/
function function_66f1be4a()
{
	self function_87cea4d8();
	self function_8334b209();
	self function_7a21de81();
	self function_e44fa35d();
}

/*
	Name: function_87cea4d8
	Namespace: namespace_afd88775
	Checksum: 0xFD8C4519
	Offset: 0x17F0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 362
*/
function function_87cea4d8()
{
	var_9d4d04eb = self namespace_11e193f1::function_69424d4c(37);
	if(var_9d4d04eb == 0)
	{
		level.no_powerups = 1;
		return;
	}
	zombie_utility::set_zombie_var("zombie_powerup_drop_max_per_round", var_9d4d04eb);
}

/*
	Name: function_8334b209
	Namespace: namespace_afd88775
	Checksum: 0xD3D15390
	Offset: 0x1858
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 383
*/
function function_8334b209()
{
	var_af1488be = self namespace_11e193f1::function_69424d4c(38);
	if(var_af1488be == 0)
	{
		return;
	}
	level.aat_in_use = 0;
}

/*
	Name: trig_ent
	Namespace: namespace_afd88775
	Checksum: 0x6DC8C1
	Offset: 0x18A0
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 403
*/
function trig_ent()
{
	level endon("game_ended");
	for(;;)
	{
		level waittill("zmb_max_ammo_level");
		foreach(player in GetPlayers())
		{
			player.var_5a946b20 = player getweaponslistprimaries();
			foreach(gun in player.var_5a946b20)
			{
				weap = GetWeapon(gun.name);
				player SetWeaponAmmoClip(gun, weap.clipSize);
			}
		}
	}
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_6c58e595
	Namespace: namespace_afd88775
	Checksum: 0x54843FEC
	Offset: 0x1A30
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 434
*/
function function_6c58e595()
{
	level endon("game_ended");
	for(;;)
	{
		level waittill("carpenter_finished");
		foreach(player in GetPlayers())
		{
			thread function_cdb9bcaf(player);
		}
	}
}

/*
	Name: function_cdb9bcaf
	Namespace: namespace_afd88775
	Checksum: 0xD2F0AFAD
	Offset: 0x1AE8
	Size: 0x150
	Parameters: 1
	Flags: None
	Line Number: 457
*/
function function_cdb9bcaf(player)
{
	primary_weapons = player GetWeaponsList(1);
	foreach(weap in primary_weapons)
	{
		if(weap.name == "zod_riotshield")
		{
			player TakeWeapon(GetWeapon("zod_riotshield"));
			wait(1);
			player zm_weapons::weapon_give(GetWeapon("zod_riotshield"), undefined, undefined, 1);
			player IPrintLnBold(player.var_1ad2f4ac + ": SHIELD HEALTH REPLENISHED");
		}
	}
	return;
}

/*
	Name: function_7a21de81
	Namespace: namespace_afd88775
	Checksum: 0xCDEC8157
	Offset: 0x1C40
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 483
*/
function function_7a21de81()
{
	var_544c735 = self namespace_11e193f1::function_69424d4c(39);
	if(var_544c735 < 4)
	{
		return;
	}
	level.additionalprimaryweapon_limit = var_544c735;
}

/*
	Name: function_e44fa35d
	Namespace: namespace_afd88775
	Checksum: 0x8282D917
	Offset: 0x1C90
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 503
*/
function function_e44fa35d()
{
	var_830d9b2b = self namespace_11e193f1::function_69424d4c(40);
	if(var_830d9b2b == 0)
	{
		return;
	}
	level.perk_purchase_limit = 100;
}

/*
	Name: function_f90e3ea5
	Namespace: namespace_afd88775
	Checksum: 0x1855DA55
	Offset: 0x1CE0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 523
*/
function function_f90e3ea5()
{
	level endon("game_ended");
	self endon("death");
	if(isdefined(self))
	{
		if(isdefined(level.var_ab882166))
		{
			health = level.var_ab882166;
			self waittill("visible");
			self util::magic_bullet_shield();
			if(isdefined(self.health) && isdefined(self.maxhealth))
			{
				self.health = self.health + health;
				self.maxhealth = self.maxhealth + health;
			}
			else
			{
				self.health = health;
				self.maxhealth = health;
			}
			wait(1);
			self util::stop_magic_bullet_shield();
			return;
		}
	}
	self.maxhealth++;
}

/*
	Name: function_8c32d8a0
	Namespace: namespace_afd88775
	Checksum: 0xE6031BDE
	Offset: 0x1DC8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 562
*/
function function_8c32d8a0()
{
	next_dog_round = self namespace_11e193f1::function_69424d4c(46);
	if(next_dog_round == 0)
	{
		return;
	}
	else if(next_dog_round == 1)
	{
		level.next_dog_round = 999;
		return;
	}
	level.next_dog_round = next_dog_round;
	level thread dog_round_tracker(next_dog_round);
	wait(0.05);
}

/*
	Name: dog_round_tracker
	Namespace: namespace_afd88775
	Checksum: 0xC4A3B800
	Offset: 0x1E58
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 589
*/
function dog_round_tracker(next_dog_round)
{
	level endon("game_ended");
	for(;;)
	{
		var_46c36f30 = level.next_dog_round;
		level waittill("dog_round_ending");
		wait(4);
		level.next_dog_round = var_46c36f30 + next_dog_round;
	}
}

/*
	Name: function_a04fb04
	Namespace: namespace_afd88775
	Checksum: 0xDC40F89E
	Offset: 0x1EB8
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 611
*/
function function_a04fb04()
{
	level endon("game_ended");
	self endon("death");
	players = GetPlayers();
	for(;;)
	{
		foreach(player in players)
		{
			if(Distance2D(self.origin, player.origin) > 100 && Distance2D(self.origin, player.origin) < 2000)
			{
				if(BulletTracePassed(player.origin + VectorScale((0, 0, 1), 45), self GetEye(), 0, undefined))
				{
					self thread function_2ca9e497(player);
					wait(randomIntRange(1, 3));
				}
			}
		}
		wait(1);
	}
}

/*
	Name: function_2ca9e497
	Namespace: namespace_afd88775
	Checksum: 0xE432764
	Offset: 0x2040
	Size: 0x220
	Parameters: 1
	Flags: None
	Line Number: 643
*/
function function_2ca9e497(player)
{
	self ASMSetAnimationRate(0.05);
	var_31920c31 = spawn("script_model", self GetTagOrigin("j_head"));
	var_31920c31 SetModel("wpn_t7_grenade_zmb_semtex_view");
	var_31920c31 SetScale(1.75);
	var_31920c31.any_team = 1;
	wait(0.25);
	var_31920c31 zm_powerups::powerup_wobble_fx();
	var_31920c31 moveto(player.origin + VectorScale((0, 0, 1), 50), 0.4);
	if(isdefined(level.var_aaf34298))
	{
		self ASMSetAnimationRate(level.var_aaf34298);
	}
	else
	{
		self ASMSetAnimationRate(1);
	}
	var_31920c31 waittill("movedone");
	if(Distance2D(var_31920c31.origin, player.origin) < 100)
	{
		player SetElectrified(0.5);
		player playlocalsound("zmb_electrocute_zombie");
		player DoDamage(10, player.origin);
	}
	var_31920c31 delete();
}

/*
	Name: function_352d3b9b
	Namespace: namespace_afd88775
	Checksum: 0xBD488E7
	Offset: 0x2268
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 681
*/
function function_352d3b9b()
{
	var_4d028782 = self namespace_11e193f1::function_69424d4c(47);
	if(var_4d028782 == 0)
	{
		level.var_ab882166 = 800;
		spawner::add_archetype_spawn_function("zombie_dog", &function_f90e3ea5);
		return;
	}
	level.var_ab882166 = var_4d028782;
	spawner::add_archetype_spawn_function("zombie_dog", &function_f90e3ea5);
	thread function_610ef0a6(var_4d028782);
}

/*
	Name: function_610ef0a6
	Namespace: namespace_afd88775
	Checksum: 0x6A1D0E8
	Offset: 0x2330
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 705
*/
function function_610ef0a6(var_4d028782)
{
	level endon("game_ended");
	level waittill("dog_round_starting");
	for(;;)
	{
		level waittill("dog_round_starting");
		wait(0.2);
		if(isdefined(level.var_ab882166))
		{
			level.var_ab882166 = level.var_ab882166 + var_4d028782;
			IPrintLnBold("Set New Dog Health: " + level.var_ab882166);
		}
	}
}

/*
	Name: function_984294f5
	Namespace: namespace_afd88775
	Checksum: 0xB13B0435
	Offset: 0x23B8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 731
*/
function function_984294f5()
{
	self endon("death");
	wait(0.4);
	if(isdefined(self))
	{
		self thread function_3f1f9afa();
	}
}

/*
	Name: function_3f1f9afa
	Namespace: namespace_afd88775
	Checksum: 0x2C4536F4
	Offset: 0x23F8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 751
*/
function function_3f1f9afa()
{
	self.cant_move_cb = &cant_move;
}

/*
	Name: cant_move
	Namespace: namespace_afd88775
	Checksum: 0x3E63EB75
	Offset: 0x2420
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 766
*/
function cant_move()
{
	self PushActors(0);
	self.enablePushTime = GetTime() + 250;
}

/*
	Name: function_ca931ea8
	Namespace: namespace_afd88775
	Checksum: 0x42FBBF21
	Offset: 0x2458
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 782
*/
function function_ca931ea8()
{
	level.disable_nuke_delay_spawning = 1;
	zombie_utility::set_zombie_var("zombie_spawn_delay", 0.1, 1, 2);
	level thread function_7046f538();
}

/*
	Name: function_7046f538
	Namespace: namespace_afd88775
	Checksum: 0x3A960184
	Offset: 0x24B8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 799
*/
function function_7046f538()
{
	level endon("game_ended");
	for(;;)
	{
		level waittill("start_of_round");
		zombie_utility::set_zombie_var("zombie_spawn_delay", 0.1, 1, 2);
	}
}

/*
	Name: function_8b66896a
	Namespace: namespace_afd88775
	Checksum: 0xBDE92AA5
	Offset: 0x2508
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 819
*/
function function_8b66896a()
{
	var_44f554ca = 0;
	if(var_44f554ca < 101)
	{
		var_44f554ca = 100;
	}
	var_e861a01d = 0;
	if(var_e861a01d < 1)
	{
		if(var_44f554ca == 100)
		{
			return;
		}
		var_e861a01d = 1;
	}
	var_e861a01d = var_e861a01d / 10;
	thread function_4230bdd1(var_44f554ca, var_e861a01d);
}

/*
	Name: function_4230bdd1
	Namespace: namespace_afd88775
	Checksum: 0xDF6A5BF1
	Offset: 0x25A0
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 849
*/
function function_4230bdd1(var_44f554ca, var_e861a01d)
{
	level endon("game_ended");
	for(;;)
	{
		zombie_utility::set_zombie_var("zombie_health_increase", var_44f554ca, 0, 2);
		zombie_utility::set_zombie_var("zombie_health_increase_multiplier", var_e861a01d, 1, 2);
		level waittill("start_of_round");
		wait(1.35);
	}
}

/*
	Name: function_1d57ce73
	Namespace: namespace_afd88775
	Checksum: 0x1EEE3F64
	Offset: 0x2630
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 871
*/
function function_1d57ce73()
{
	var_8978f0ab = 0;
	if(var_8978f0ab < 151)
	{
		return;
	}
	zombie_utility::set_zombie_var("zombie_health_start", var_8978f0ab, 0, 2);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2739fbbf
	Namespace: namespace_afd88775
	Checksum: 0x7CB042F7
	Offset: 0x2680
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 893
*/
function function_2739fbbf()
{
	sprinters = self namespace_11e193f1::function_69424d4c(45);
	if(sprinters == 0)
	{
		return;
	}
	level thread zombie_speed(99, 1090);
}

/*
	Name: zombie_speed
	Namespace: namespace_afd88775
	Checksum: 0xC8754A4F
	Offset: 0x26E0
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 913
*/
function zombie_speed(var_5863d389, var_c70a9d01)
{
	level endon("game_ended");
	for(;;)
	{
		wait(1.2);
		zombie_utility::set_zombie_var("zombie_move_speed_multiplier", var_5863d389, 0);
		zombie_utility::set_zombie_var("zombie_move_speed_multiplier_easy", var_5863d389, 0);
		level.zombie_move_speed = var_c70a9d01;
		level waittill("start_of_round");
	}
}

/*
	Name: function_eea3b04a
	Namespace: namespace_afd88775
	Checksum: 0xB738C5D9
	Offset: 0x2768
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 936
*/
function function_eea3b04a()
{
	ai_limit = self namespace_11e193f1::function_69424d4c(44);
	if(ai_limit == 0)
	{
		return;
	}
	level.zombie_ai_limit = 64;
	level.zombie_actor_limit = 64;
}

/*
	Name: function_9217ea9e
	Namespace: namespace_afd88775
	Checksum: 0x18AA3CC
	Offset: 0x27C0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 957
*/
function function_9217ea9e()
{
	var_871d9cbb = self namespace_11e193f1::function_69424d4c(41);
	wait(0.05);
	if(var_871d9cbb == 0)
	{
		level.var_bc4bfe7c = 1;
		return;
	}
	else if(var_871d9cbb == 1)
	{
		return;
	}
	else if(var_871d9cbb == 2)
	{
		level.var_33a8b9af = "0.9,0,0";
		return;
	}
	else if(var_871d9cbb == 3)
	{
		if(isdefined(self.var_22bfad1a))
		{
			level.var_33a8b9af = self.var_22bfad1a;
			return;
		}
	}
	else if(var_871d9cbb == 4)
	{
		level.var_5eeabc5e = 1;
		return;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_710ca4a5
	Namespace: namespace_afd88775
	Checksum: 0x32F7D82A
	Offset: 0x28A0
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1002
*/
function function_710ca4a5()
{
	players = GetPlayers();
	self function_498655d6(players);
	wait(0.25);
	self function_b169aca2();
	self function_27a7fbe1();
	self function_67e51be8();
	self function_199c685d();
	self function_84ecdb06(players);
}

/*
	Name: function_67e51be8
	Namespace: namespace_afd88775
	Checksum: 0xFF7CA664
	Offset: 0x2968
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1024
*/
function function_67e51be8()
{
	var_c27ddd7 = self namespace_11e193f1::function_69424d4c(34);
	if(var_c27ddd7 == 0)
	{
		return;
	}
	level.pack_a_punch_camo_index = var_c27ddd7;
}

/*
	Name: function_199c685d
	Namespace: namespace_afd88775
	Checksum: 0xEFF2D057
	Offset: 0x29B8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1044
*/
function function_199c685d()
{
	var_10ca5a00 = self namespace_11e193f1::function_69424d4c(35);
	if(var_10ca5a00 == 0)
	{
		return;
	}
	level.pack_a_punch_camo_index_number_variants = var_10ca5a00;
}

/*
	Name: function_84ecdb06
	Namespace: namespace_afd88775
	Checksum: 0xA27EB27A
	Offset: 0x2A08
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 1064
*/
function function_84ecdb06(players)
{
	var_9e04441b = self namespace_11e193f1::function_69424d4c(36);
	if(var_9e04441b == 0)
	{
		return;
	}
	level.var_d28e2684 = 1;
	self function_f0641f7d(players);
	level thread trig_ent();
	level thread function_6c58e595();
	spawner::add_archetype_spawn_function("zombie", &function_984294f5);
	wait(0.05);
	return;
}

/*
	Name: function_c9933a48
	Namespace: namespace_afd88775
	Checksum: 0xDAF5A063
	Offset: 0x2AD8
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 1090
*/
function function_c9933a48(players)
{
	level.var_a1c18c53 = Array();
	foreach(player in players)
	{
		if(!player IsTestClient())
		{
			player thread function_894659c();
		}
	}
}

/*
	Name: function_894659c
	Namespace: namespace_afd88775
	Checksum: 0x181D8929
	Offset: 0x2BA8
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 1112
*/
function function_894659c()
{
	level endon("game_ended");
	self endon("disconnect");
	level waittill("end_of_round");
	var_737ffc10 = undefined;
	while(isdefined(self.zone_name))
	{
		if(var_737ffc10 != self.zone_name)
		{
			var_72055a75 = "JZMZone" + self.zone_name;
			var_737ffc10 = self.zone_name;
			self SetControllerUIModelValue("pegasus_player", var_72055a75);
		}
		if(!IsInArray(level.var_a1c18c53, self.zone_name))
		{
			if(!isdefined(level.var_a1c18c53))
			{
				level.var_a1c18c53 = [];
			}
			else if(!IsArray(level.var_a1c18c53))
			{
				level.var_a1c18c53 = Array(level.var_a1c18c53);
			}
			level.var_a1c18c53[level.var_a1c18c53.size] = self.zone_name;
		}
		if(level.var_a1c18c53.size > 7)
		{
			if(self IsHost())
			{
				level thread function_deedf630();
			}
			wait(0.25);
			self thread function_72d44184();
			break;
		}
		wait(1);
	}
	return;
}

/*
	Name: function_deedf630
	Namespace: namespace_afd88775
	Checksum: 0x7E0F5597
	Offset: 0x2D58
	Size: 0x248
	Parameters: 0
	Flags: None
	Line Number: 1163
*/
function function_deedf630()
{
	level endon("game_ended");
	players = GetPlayers();
	foreach(player in players)
	{
		if(player IsTestClient())
		{
			ArrayRemoveValue(players, player);
		}
	}
	for(;;)
	{
		level waittill("start_of_round");
		wait(1.5);
		options = level.var_a1c18c53;
		reward = Array::randomize(options)[0];
		IPrintLnBold("Survive 1 Round Inside Zone: " + reward);
		level.var_f0936115 = reward;
		level waittill("end_of_round");
		foreach(player in players)
		{
			if(isdefined(player.var_43f5a8d3) && player.var_43f5a8d3)
			{
				player IPrintLnBold(player.var_1ad2f4ac + ": ^6DANGER ZONE REWARD");
				player.var_b93089b6 = player.var_b93089b6 + 100;
			}
		}
	}
	return;
}

/*
	Name: function_72d44184
	Namespace: namespace_afd88775
	Checksum: 0xE7A8CDDF
	Offset: 0x2FA8
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 1205
*/
function function_72d44184()
{
	level endon("game_ended");
	self endon("disconnect");
	var_737ffc10 = undefined;
	while(isdefined(self.zone_name))
	{
		if(var_737ffc10 != self.zone_name)
		{
			var_72055a75 = "JZMZone" + self.zone_name;
			var_737ffc10 = self.zone_name;
			self SetControllerUIModelValue("pegasus_player", var_72055a75);
		}
		if(isdefined(level.var_f0936115) && level.var_f0936115 == self.zone_name)
		{
			self function_208313db(var_737ffc10);
			level waittill("start_of_round");
			wait(2.5);
			self.var_43f5a8d3 = undefined;
		}
		wait(1);
	}
	return;
}

/*
	Name: function_208313db
	Namespace: namespace_afd88775
	Checksum: 0x71019DA4
	Offset: 0x30A8
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 1240
*/
function function_208313db(var_737ffc10)
{
	level endon("game_ended");
	self endon("disconnect");
	level endon("end_of_round");
	IPrintLnBold(self.var_1ad2f4ac + ": ^3ENTERED DANGER ZONE");
	self.var_43f5a8d3 = 1;
	while(isdefined(self.zone_name))
	{
		if(var_737ffc10 != self.zone_name)
		{
			var_72055a75 = "JZMZone" + self.zone_name;
			var_737ffc10 = self.zone_name;
			self SetControllerUIModelValue("pegasus_player", var_72055a75);
			IPrintLnBold(self.var_1ad2f4ac + ": ^3LEFT DANGER ZONE");
			self.var_43f5a8d3 = undefined;
			level waittill("end_of_round");
			break;
		}
		wait(1);
	}
}

/*
	Name: function_498655d6
	Namespace: namespace_afd88775
	Checksum: 0x8610E0A3
	Offset: 0x31D0
	Size: 0x2A0
	Parameters: 1
	Flags: None
	Line Number: 1273
*/
function function_498655d6(players)
{
	game_mode = self namespace_11e193f1::function_69424d4c(31);
	if(game_mode == 0)
	{
		return;
	}
	else if(game_mode == 1)
	{
		wait(0.25);
		self function_14396a79(players);
		self function_702355d0();
		wait(0.5);
	}
	else if(game_mode == 2)
	{
		level.var_eb7e28bd = 1;
		level.no_powerups = 1;
		wait(0.25);
		self function_898ac1f9(1, 1);
		wait(0.5);
	}
	else if(game_mode == 3)
	{
		function_9f15063c();
	}
	else if(game_mode == 4)
	{
		function_bebbc34a();
	}
	else if(game_mode == 5)
	{
		level.headshots_only = 1;
	}
	else if(game_mode == 6)
	{
		function_c9933a48(players);
	}
	else if(game_mode == 7)
	{
		function_9e9943eb();
	}
	else if(game_mode == 8)
	{
		if(isdefined(level.var_d70d8449))
		{
			return;
		}
		level.round_wait_func = &function_87f7ba9f;
		level.next_dog_round = 999;
		function_ca931ea8();
	}
	else if(game_mode == 9)
	{
		if(isdefined(level.var_d70d8449))
		{
			return;
		}
		level.round_wait_func = &function_87f7ba9f;
		function_ca931ea8();
	}
	else if(game_mode == 10)
	{
		function_d69a70db();
		function_39a5be7e();
		return;
	}
	level.var_b7835ba = level.var_b7835ba + 100;
	return;
	ERROR: Bad function call
}

/*
	Name: function_87f7ba9f
	Namespace: namespace_afd88775
	Checksum: 0x859936BF
	Offset: 0x3478
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1355
*/
function function_87f7ba9f()
{
	level endon("restart_round");
	level endon("kill_round");
	wait(1);
	for(;;)
	{
		should_wait = level.zombie_total > 0 || level.intermission;
		if(!should_wait)
		{
			return;
		}
		if(level flag::get("end_round_wait"))
		{
			return;
		}
		wait(1);
	}
}

/*
	Name: function_bebbc34a
	Namespace: namespace_afd88775
	Checksum: 0xD4A361B5
	Offset: 0x3500
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 1385
*/
function function_bebbc34a()
{
	if(level flag::get("power_on"))
	{
		return;
	}
	visionSetNaked("zombie_noire", 1);
	level thread function_378faf4b();
}

/*
	Name: function_378faf4b
	Namespace: namespace_afd88775
	Checksum: 0x4B3BAE88
	Offset: 0x3568
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 1405
*/
function function_378faf4b()
{
	level flag::wait_till("power_on");
	wait(1);
	visionSetNaked(GetDvarString("mapname"), 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_9f15063c
	Namespace: namespace_afd88775
	Checksum: 0x572ED79D
	Offset: 0x35D0
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 1424
*/
function function_9f15063c()
{
	doors1 = GetEntArray("zombie_door", "targetname");
	doors2 = GetEntArray("zombie_debris", "targetname");
	wait(0.05);
	for(i = 0; i < doors1.size; i++)
	{
		if(isdefined(doors1[i].zombie_cost))
		{
			doors1[i].zombie_cost = 999999;
			doors1[i] setHintString("LOCKED DOOR^2 $^3" + doors1[i].zombie_cost);
		}
	}
	for(i = 0; i < doors2.size; i++)
	{
		if(isdefined(doors2[i].zombie_cost))
		{
			doors2[i].zombie_cost = 999999;
			doors2[i] setHintString("LOCKED BARRIER^2 $^3" + doors2[i].zombie_cost);
		}
	}
	return;
}

/*
	Name: function_d69a70db
	Namespace: namespace_afd88775
	Checksum: 0x2CE9E644
	Offset: 0x3768
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 1458
*/
function function_d69a70db()
{
	types = Array("zombie_door", "zombie_airlock_buy");
	foreach(type in types)
	{
		zombie_doors = GetEntArray(type, "targetname");
		for(i = 0; i < zombie_doors.size; i++)
		{
			if(zombie_doors[i]._door_open == 0)
			{
				zombie_doors[i] thread function_cb3791cc();
			}
		}
	}
	level.player_out_of_playable_area_monitor_callback = &function_94dc460b;
	function_dc3f4cad();
}

/*
	Name: function_94dc460b
	Namespace: namespace_afd88775
	Checksum: 0x51E48C41
	Offset: 0x38C0
	Size: 0x8
	Parameters: 0
	Flags: Private
	Line Number: 1486
*/
function private function_94dc460b()
{
	return 0;
}

/*
	Name: function_cb3791cc
	Namespace: namespace_afd88775
	Checksum: 0xD45D3D21
	Offset: 0x38D0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 1501
*/
function function_cb3791cc()
{
	while(isdefined(self.door_is_moving) && self.door_is_moving)
	{
		wait(0.1);
	}
	self zm_blockers::door_opened(0);
}

/*
	Name: function_dc3f4cad
	Namespace: namespace_afd88775
	Checksum: 0x5818556C
	Offset: 0x3918
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 1520
*/
function function_dc3f4cad()
{
	if(isdefined(level.openalldebris))
	{
		return;
	}
	level.openalldebris = 1;
	zombie_debris = GetEntArray("zombie_debris", "targetname");
	foreach(Debris in zombie_debris)
	{
		Debris.zombie_cost = 0;
		Debris notify("trigger", self, 1);
	}
}

/*
	Name: function_39a5be7e
	Namespace: namespace_afd88775
	Checksum: 0xD6DECE71
	Offset: 0x3A08
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 1545
*/
function function_39a5be7e()
{
	if(level flag::get("power_on"))
	{
		return;
	}
	arrays = Array("use_elec_switch", "zombie_vending", "zombie_door");
	presets = Array("elec", "power", "master");
	for(e = 0; e < 3; e++)
	{
		array_size = arrays[e].size;
	}
	for(e = 0; e < array_size; e++)
	{
		level flag::set("power_on" + e);
	}
	foreach(preset in presets)
	{
		trig = GetEnt("use_" + preset + "_switch", "targetname");
		if(isdefined(trig))
		{
			trig notify("trigger", self);
			break;
		}
	}
	level flag::set("power_on");
}

/*
	Name: function_898ac1f9
	Namespace: namespace_afd88775
	Checksum: 0x3C421A8B
	Offset: 0x3C18
	Size: 0x468
	Parameters: 2
	Flags: None
	Line Number: 1583
*/
function function_898ac1f9(var_15879d61, var_6b9f203)
{
	level.var_625ab5ef = getArrayKeys(level.zombie_weapons);
	wait(0.15);
	level.var_5de6729 = getArrayKeys(level.zombie_weapons_upgraded);
	wait(0.2);
	foreach(weapon in getArrayKeys(level.zombie_weapons))
	{
		if(weapon.name == "bowie_knife" || weapon.name == "bouncingbetty" || weapon.name == "cymbal_monkey" || weapon.name == "frag_grenade" || weapon.name == "knife" || weapon.name == "hero_gravityspikes_melee" || weapon.name == "octobomb" || weapon.name == "hero_annihilator" || weapon == level.weaponRiotshield || weapon.name == "pistol_standard" || weapon.name == "cymbal_monkey_upgraded" || weapon.name == "pistol_m1911" || weapon.name == level.zombie_powerup_weapon["minigun"] || weapon.name == "none" || weapon.name == "hero_gravityspikes" || weapon.name == "launcher_dragon_fire" || weapon.name == "launcher_dragon_strike" || weapon.name == "dragon_gauntlet_flamethrower" || weapon.name == "octobomb_upgraded")
		{
			ArrayRemoveValue(level.var_625ab5ef, weapon);
		}
	}
	var_bf26f46d = GetWeapon("cymbal_monkey_upgraded");
	ArrayRemoveValue(level.var_5de6729, level.weaponNone);
	ArrayRemoveValue(level.var_5de6729, var_bf26f46d);
	players = GetPlayers();
	foreach(player in players)
	{
		if(!player IsTestClient())
		{
			player function_ac376a5f(level.var_625ab5ef, level.var_5de6729, var_15879d61, var_6b9f203);
		}
	}
	wait(0.1);
	function_2de1939d();
}

/*
	Name: function_ac376a5f
	Namespace: namespace_afd88775
	Checksum: 0xC2D4F527
	Offset: 0x4088
	Size: 0xE0
	Parameters: 4
	Flags: None
	Line Number: 1621
*/
function function_ac376a5f(var_625ab5ef, var_5de6729, var_15879d61, var_6b9f203)
{
	foreach(weapon in self getweaponslistprimaries())
	{
		self zm_weapons::weapon_take(weapon);
	}
	self thread function_ecaca9d7(var_625ab5ef, var_5de6729, var_15879d61, var_6b9f203);
	return;
	ERROR: Bad function call
}

/*
	Name: function_ecaca9d7
	Namespace: namespace_afd88775
	Checksum: 0xB93B11AF
	Offset: 0x4170
	Size: 0x268
	Parameters: 4
	Flags: None
	Line Number: 1642
*/
function function_ecaca9d7(var_625ab5ef, var_5de6729, var_15879d61, var_6b9f203)
{
	level endon("game_ended");
	self endon("disconnect");
	while(var_625ab5ef.size > 0)
	{
		var_8561b1fb = Array::random(var_625ab5ef);
		foreach(weapon in self getweaponslistprimaries())
		{
			self zm_weapons::weapon_take(weapon);
		}
		wait(0.25);
		ArrayRemoveValue(var_625ab5ef, var_8561b1fb);
		weapon_name = MakeLocalizedString(var_8561b1fb.displayName);
		self IPrintLnBold("^5Gun Game Weapon ^3(" + var_625ab5ef.size + ") ^2" + weapon_name);
		self zm_weapons::weapon_give(var_8561b1fb, undefined, undefined, 1);
		self function_6c098318();
		continue;
		if(var_625ab5ef.size < 1)
		{
			if(var_6b9f203)
			{
				self thread function_412b944d(var_5de6729, var_15879d61, var_6b9f203);
			}
			else
			{
				self thread function_ecaca9d7(level.var_625ab5ef, level.var_5de6729, var_15879d61, var_6b9f203);
				break;
			}
		}
		for(kills = 0; kills < var_15879d61; kills++)
		{
			self waittill("zom_kill");
		}
	}
}

/*
	Name: function_412b944d
	Namespace: namespace_afd88775
	Checksum: 0x68AD2E29
	Offset: 0x43E0
	Size: 0x230
	Parameters: 3
	Flags: None
	Line Number: 1689
*/
function function_412b944d(var_5de6729, var_15879d61, var_6b9f203)
{
	level endon("game_ended");
	self endon("disconnect");
	while(var_5de6729.size > 0)
	{
		var_8561b1fb = Array::random(var_5de6729);
		foreach(weapon in self getweaponslistprimaries())
		{
			self zm_weapons::weapon_take(weapon);
		}
		wait(0.25);
		ArrayRemoveValue(var_5de6729, var_8561b1fb);
		weapon_name = MakeLocalizedString(var_8561b1fb.displayName);
		self IPrintLnBold("Gun Game Weapon ^3(" + var_5de6729.size + ") ^2" + weapon_name);
		self zm_weapons::weapon_give(var_8561b1fb, undefined, undefined, 1);
		self function_6c098318();
		continue;
		if(var_5de6729.size < 1)
		{
			self thread function_ecaca9d7(level.var_625ab5ef, level.var_5de6729, var_15879d61, var_6b9f203);
			break;
		}
		for(kills = 0; kills < var_15879d61; kills++)
		{
			self waittill("zom_kill");
		}
	}
}

/*
	Name: function_6c098318
	Namespace: namespace_afd88775
	Checksum: 0x7DD03E8
	Offset: 0x4618
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1729
*/
function function_6c098318()
{
	if(!isdefined(self.var_4eb23f86))
	{
		self LUINotifyEvent(&"score_event", 2, &"PROMOTED", 10);
	}
	if(isdefined(self.var_b93089b6) && isdefined(self.var_fdb8642e))
	{
		self.var_b93089b6 = self.var_b93089b6 + 10;
		self.var_fdb8642e = self.var_fdb8642e + 10;
	}
}

/*
	Name: function_2de1939d
	Namespace: namespace_afd88775
	Checksum: 0xADC39102
	Offset: 0x46A0
	Size: 0x350
	Parameters: 0
	Flags: None
	Line Number: 1752
*/
function function_2de1939d()
{
	triggers = GetEntArray("weapon_upgrade", "targetname");
	triggers = ArrayCombine(triggers, GetEntArray("bowie_upgrade", "targetname"), 1, 0);
	triggers = ArrayCombine(triggers, GetEntArray("sickle_upgrade", "targetname"), 1, 0);
	triggers = ArrayCombine(triggers, GetEntArray("tazer_upgrade", "targetname"), 1, 0);
	triggers = ArrayCombine(triggers, GetEntArray("claymore_purchase", "targetname"), 1, 0);
	triggers = ArrayCombine(triggers, GetEntArray("zombie_vending_upgrade", "targetname"), 1, 0);
	foreach(trigger in triggers)
	{
		trigger delete();
	}
	foreach(unitrigger in level._spawned_wallbuys)
	{
		zm_unitrigger::unregister_unitrigger(unitrigger);
		zm_unitrigger::unregister_unitrigger(unitrigger.stub);
	}
	foreach(trigger in zm_pap_util::get_triggers())
	{
		trigger delete();
	}
	level.chests[level.chest_index] zm_magicbox::hide_chest(1);
	return;
	ERROR: Bad function call
}

/*
	Name: function_14396a79
	Namespace: namespace_afd88775
	Checksum: 0xB2443C12
	Offset: 0x49F8
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 1788
*/
function function_14396a79(players)
{
	foreach(player in players)
	{
		if(!player IsTestClient())
		{
			player thread function_c68b820a();
		}
	}
}

/*
	Name: function_c68b820a
	Namespace: namespace_afd88775
	Checksum: 0x5BBE396C
	Offset: 0x4AB0
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 1809
*/
function function_c68b820a()
{
	level endon("game_ended");
	self endon("disconnect");
	self notify("noHealthOverlay");
	self notify("playerHealthRegen");
	for(;;)
	{
		self waittill("damage", damage, attacker, direction, point, type, tagName, modelName, partName, weapon, iDFlags);
		if(attacker.team == level.zombie_team)
		{
			wait(0.1);
			self shellshock("mp_radiation_high", 0.5);
		}
		wait(0.5);
	}
}

/*
	Name: function_702355d0
	Namespace: namespace_afd88775
	Checksum: 0x8AC5AEFB
	Offset: 0x4BC8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1837
*/
function function_702355d0()
{
	callback::on_spawned(&function_b04065f6);
	callback::on_ai_spawned(&function_d0ab687);
	return;
	ERROR: Bad function call
}

/*
	Name: function_b04065f6
	Namespace: namespace_afd88775
	Checksum: 0xC94E8A1B
	Offset: 0x4C18
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1855
*/
function function_b04065f6()
{
	wait(2);
	self notify("noHealthOverlay");
	self notify("playerHealthRegen");
}

/*
	Name: function_d0ab687
	Namespace: namespace_afd88775
	Checksum: 0x7C613210
	Offset: 0x4C48
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 1872
*/
function function_d0ab687()
{
	level endon("game_ended");
	self endon("death");
	if(!isdefined(self.completed_emerging_into_playable_area))
	{
		self waittill("completed_emerging_into_playable_area");
	}
	while(isdefined(self))
	{
		if(ZombieBehavior::zombieShouldMeleeCondition(self))
		{
			if(self.zombie_move_speed != "walk")
			{
				self.var_540aa155 = self.zombie_move_speed;
				self.zombie_move_speed = "walk";
			}
		}
		else if(isdefined(self.var_540aa155))
		{
			self.zombie_move_speed = self.var_540aa155;
			self.var_540aa155 = undefined;
		}
		wait(0.05);
	}
}

/*
	Name: function_f0641f7d
	Namespace: namespace_afd88775
	Checksum: 0x6F36E282
	Offset: 0x4D18
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 1909
*/
function function_f0641f7d(players)
{
	foreach(player in players)
	{
		if(!player IsTestClient())
		{
			player thread function_86e4e73e();
		}
	}
}

/*
	Name: function_86e4e73e
	Namespace: namespace_afd88775
	Checksum: 0x1D9501AF
	Offset: 0x4DD0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 1930
*/
function function_86e4e73e()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("bled_out");
		wait(4);
		if(self.sessionstate == "spectator")
		{
			self thread zm::spectator_respawn_player();
		}
	}
}

/*
	Name: function_27a7fbe1
	Namespace: namespace_afd88775
	Checksum: 0xCC3977EE
	Offset: 0x4E38
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1955
*/
function function_27a7fbe1()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: function_84028f1c
	Namespace: namespace_afd88775
	Checksum: 0x5F872116
	Offset: 0x4EB0
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1975
*/
function function_84028f1c()
{
	level.var_e8e1cf29 = Array("bouncingbetty", "cymbal_monkey", "bowie_knife", "ray_gun", "ar_accurate", "ar_cqb", "ar_standard", "lmg_cqb", "lmg_heavy", "lmg_light", "pistol_burst", "pistol_fullauto", "shotgun_pump", "shotgun_semiauto", "launcher_standard", "smg_capacity", "smg_fastfire", "sniper_fastbolt", "sniper_fastsemi", "smg_sten");
}

/*
	Name: function_5fc9733a
	Namespace: namespace_afd88775
	Checksum: 0xFC30BBD0
	Offset: 0x4F78
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 1990
*/
function function_5fc9733a()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		level waittill("start_of_round");
		wait(7);
		if(level.round_number == 15)
		{
			self thread namespace_86dc1221::function_d79e5beb();
		}
	}
	else
	{
	}
}

/*
	Name: function_b169aca2
	Namespace: namespace_afd88775
	Checksum: 0x5E92E322
	Offset: 0x4FE0
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 2018
*/
function function_b169aca2()
{
	if(GetPlayers().size >= 4)
	{
		return;
	}
	bots = self namespace_11e193f1::function_69424d4c(32);
	if(bots == 0)
	{
		return;
	}
	SetDvar("bot_difficulty", "3");
	SetDvar("bot_AllowMovement", "1");
	SetDvar("bot_PressAttackBtn", "1");
	SetDvar("bot_PressMeleeBtn", "1");
	var_691ea1c = 0;
	while(var_691ea1c < bots && GetPlayers().size < 4)
	{
		var_691ea1c++;
		var_37837a52 = AddTestClient();
		wait(0.5);
		var_37837a52 [[level.spawnPlayer]]();
		wait(0.5);
		var_37837a52 thread on_bot_connect(self);
		wait(1.5);
	}
}

/*
	Name: on_bot_connect
	Namespace: namespace_afd88775
	Checksum: 0xDF29EC1B
	Offset: 0x5160
	Size: 0x1D0
	Parameters: 1
	Flags: None
	Line Number: 2056
*/
function on_bot_connect(host)
{
	self.var_9d6730be = 0;
	self.var_1c43abc3 = 1000;
	self.var_fc421594 = "uie_t7_codcaster_faction2";
	self.var_fdb8642e = 0;
	self.var_1ad2f4ac = "^6" + self.name;
	self.var_b93089b6 = 0;
	self.var_e9d0cac4 = 0;
	self.var_b4286cb = 0;
	self.var_709323d5 = 17;
	self.linker = spawn("script_model", self.origin);
	self LinkTo(self.linker);
	level flag::wait_till("spawn_zombies");
	wait(0.05);
	if(isdefined(self.linker))
	{
		self.linker delete();
	}
	self function_b1137aae();
	self function_d9b17bcf();
	self function_32d2a35b();
	self function_2c63449b();
	self thread function_789d7dfb(host);
	self.n_player_health_boost = 250;
	self zm_perks::perk_set_max_health_if_jugg("health_reboot", 0, 1);
}

/*
	Name: function_32d2a35b
	Namespace: namespace_afd88775
	Checksum: 0xE7E69B20
	Offset: 0x5338
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 2094
*/
function function_32d2a35b()
{
	if(isdefined(self.var_1ad2f4ac))
	{
		var_32d2a35b = self.var_1ad2f4ac + ": ^2Connected";
		IPrintLnBold(var_32d2a35b);
	}
	else
	{
		var_32d2a35b = self.name + ": ^2Connected";
		IPrintLnBold(var_32d2a35b);
	}
}

/*
	Name: function_b1137aae
	Namespace: namespace_afd88775
	Checksum: 0x335CABF3
	Offset: 0x53B8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 2118
*/
function function_b1137aae()
{
	self.var_397ff547 = 1;
	self clientfield::set_to_player("red_laser_fx_view", 1);
	self clientfield::set("red_laser_fx_world", 1);
}

/*
	Name: function_d9b17bcf
	Namespace: namespace_afd88775
	Checksum: 0xC8F9D3E
	Offset: 0x5418
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 2135
*/
function function_d9b17bcf()
{
	self.var_2c04a93f = 1;
	self Attach("pegasus_backpack", "tag_stowed_back");
}

/*
	Name: function_308bcb3
	Namespace: namespace_afd88775
	Checksum: 0x45A76582
	Offset: 0x5458
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 2151
*/
function function_308bcb3()
{
	level waittill("end_game");
	IPrintLnBold(self.var_1ad2f4ac + ": ^7Match XP ^2" + self.var_fdb8642e);
}

/*
	Name: function_2c63449b
	Namespace: namespace_afd88775
	Checksum: 0x48C3E514
	Offset: 0x54A0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 2167
*/
function function_2c63449b()
{
	MapName = GetDvarString("mapname");
	if(MapName == "zm_zod")
	{
		return;
	}
	self.characterindex = 4;
	wait(0.5);
	self setcharacterbodytype(self.characterindex);
	wait(0.25);
	return;
}

/*
	Name: function_44298ab9
	Namespace: namespace_afd88775
	Checksum: 0xB10993E
	Offset: 0x5520
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 2191
*/
function function_44298ab9()
{
	if(isdefined(level.var_41f4c43))
	{
		level.var_41f4c43++;
		if(level.var_41f4c43 == 1 || level.var_41f4c43 > 3)
		{
			level.var_41f4c43 = 1;
			self IPrintLnBold("BOT TOGGLE: FOLLOW HOST");
		}
		else if(level.var_41f4c43 == 2)
		{
			self IPrintLnBold("BOT TOGGLE: CAMP");
		}
		else if(level.var_41f4c43 == 3)
		{
			self IPrintLnBold("BOT TOGGLE: WANDER & OPEN DOORS");
		}
	}
	else if(!isdefined(level.var_41f4c43))
	{
		level.var_41f4c43 = 1;
		self IPrintLnBold("BOT TOGGLE: FOLLOW HOST");
	}
}

/*
	Name: function_5a6d6bd7
	Namespace: namespace_afd88775
	Checksum: 0x259845D0
	Offset: 0x5628
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 2227
*/
function function_5a6d6bd7()
{
	level endon("game_ended");
	doors = GetEntArray("zombie_door", "targetname");
	Debris = GetEntArray("zombie_debris", "targetname");
	zombie_doors = ArrayCombine(doors, Debris, 1, 1);
	if(zombie_doors.size < 1)
	{
		return;
	}
	while(level.var_41f4c43 == 2)
	{
		var_6a6585a0 = ArrayGetClosest(self.origin + VectorScale((0, 0, 1), 60), zombie_doors);
		if(Distance2D(var_6a6585a0, self.origin) < 250)
		{
			self BotSetGoal(var_6a6585a0, 50);
			if(Distance2D(var_6a6585a0, self.origin) < 60)
			{
				self BotTapButton(3);
				ArrayRemoveValue(zombie_doors, var_6a6585a0);
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_47384834
	Namespace: namespace_afd88775
	Checksum: 0xBF7DC151
	Offset: 0x57D0
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 2263
*/
function function_47384834(host)
{
	level endon("intermission");
	map = GetDvarString("mapname", "NOTHING");
	while(map == "zm_moon")
	{
		var_c02a23f7 = self zm_equipment::get_player_equipment();
		Suit = host zm_equipment::get_player_equipment();
		if(var_c02a23f7 != Suit)
		{
			self zm_equipment::take(var_c02a23f7);
			self zm_equipment::give(Suit);
			self zm_equipment::set_player_equipment(Suit);
			self SetActionSlot(2, "weapon", Suit);
			self SwitchToWeapon(Suit);
		}
		wait(5);
	}
}

/*
	Name: bot_think
	Namespace: namespace_afd88775
	Checksum: 0xC17F0A3A
	Offset: 0x5908
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 2293
*/
function bot_think(host)
{
	level endon("game_ended");
	while(!isdefined(host.reviveTrigger))
	{
		self BotTapButton(3);
		self bot::stuck_resolution();
		self bot::sprint_to_goal();
		self BotTapButton(3);
		wait(2);
	}
	return;
}

/*
	Name: function_5e722440
	Namespace: namespace_afd88775
	Checksum: 0x860927AA
	Offset: 0x59A8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 2317
*/
function function_5e722440()
{
	if(isdefined(self.var_f61c489c))
	{
		self.var_f61c489c delete();
	}
	self.var_f61c489c = spawn("script_model", self.origin);
	self.var_f61c489c SetModel("tag_origin");
	self LinkTo(self.var_f61c489c);
}

/*
	Name: function_765583f
	Namespace: namespace_afd88775
	Checksum: 0x20C5755E
	Offset: 0x5A48
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 2338
*/
function function_765583f()
{
	level endon("game_ended");
	for(;;)
	{
		level waittill("between_round_over");
		if(level.round_number <= 1)
		{
			self zm_weapons::weapon_give(GetWeapon("pistol_burst"), undefined, undefined, 1);
		}
		else if(level.round_number < 4)
		{
			self zm_weapons::weapon_give(GetWeapon("smg_fastfire"), undefined, undefined, 1);
		}
		else if(level.round_number < 8)
		{
			self zm_weapons::weapon_give(GetWeapon("shotgun_fullauto"), undefined, undefined, 1);
		}
		else if(level.round_number < 12)
		{
			self zm_weapons::weapon_give(GetWeapon("ar_standard"), undefined, undefined, 1);
		}
		else if(level.round_number < 16)
		{
			self zm_weapons::weapon_give(GetWeapon("ar_cqb"), undefined, undefined, 1);
		}
		else if(level.round_number >= 17)
		{
			self zm_weapons::weapon_give(GetWeapon("lmg_cqb"), undefined, undefined, 1);
		}
		self namespace_f8c4cfb7::function_c3dc2891();
	}
}

/*
	Name: function_789d7dfb
	Namespace: namespace_afd88775
	Checksum: 0x9768050D
	Offset: 0x5C30
	Size: 0x408
	Parameters: 1
	Flags: None
	Line Number: 2382
*/
function function_789d7dfb(host)
{
	level endon("game_ended");
	host endon("disconnect");
	var_a10a3208 = 1;
	self thread bot_think(host);
	self thread function_765583f();
	self thread function_47384834(host);
	level.var_41f4c43 = 1;
	for(;;)
	{
		foreach(player in level.players)
		{
			if(isdefined(host) && isdefined(level.var_41f4c43))
			{
				if(level.var_41f4c43 == 1)
				{
					self BotSetGoal(host.origin, 90);
				}
				else if(level.var_41f4c43 == 2)
				{
					if(isdefined(var_a10a3208) && var_a10a3208)
					{
						var_a10a3208 = 0;
						self AllowJump(0);
						self AllowStand(0);
						self BotPressButton(9);
						self function_5e722440();
					}
				}
				else if(level.var_41f4c43 == 3)
				{
					if(isdefined(self.var_f61c489c))
					{
						self.var_f61c489c delete();
					}
					if(isdefined(var_a10a3208) && !var_a10a3208)
					{
						var_a10a3208 = 1;
						self AllowJump(1);
						self AllowStand(1);
						self thread function_5a6d6bd7();
					}
				}
				while(isdefined(player.reviveTrigger) && isalive(player))
				{
					level.var_41f4c43 = 0;
					if(isdefined(self.var_f61c489c))
					{
						self.var_f61c489c delete();
						var_a10a3208 = 1;
						self AllowJump(1);
						self AllowStand(1);
						wait(0.05);
					}
					self bot::revive_player(player);
					if(isdefined(player.reviveTrigger) && isdefined(player.reviveTrigger.beingRevived) && player.reviveTrigger.beingRevived == 1)
					{
						wait(1.4);
						player zm_laststand::auto_revive(self);
						player needsRevive(0);
					}
					wait(0.05);
				}
				if(isdefined(self.reviveTrigger))
				{
					wait(5);
					self zm_laststand::auto_revive(player);
					self needsRevive(0);
				}
			}
		}
		wait(0.2);
	}
}

/*
	Name: function_9e9943eb
	Namespace: namespace_afd88775
	Checksum: 0xEFC25790
	Offset: 0x6040
	Size: 0x330
	Parameters: 0
	Flags: None
	Line Number: 2468
*/
function function_9e9943eb()
{
	var_b4f2b884 = GetEntArray("zombie_vending", "targetname");
	var_d4fd6050 = Array();
	if(var_b4f2b884.size > 1)
	{
		foreach(perk in var_b4f2b884)
		{
			if(isdefined(perk.script_noteworthy))
			{
				var_7e28bc78 = spawnstruct();
				var_7e28bc78.origin = perk.origin + VectorScale((0, 0, -1), 60);
				var_7e28bc78.angles = perk.machine.angles;
				if(!isdefined(var_d4fd6050))
				{
					var_d4fd6050 = [];
				}
				else if(!IsArray(var_d4fd6050))
				{
					var_d4fd6050 = Array(var_d4fd6050);
				}
				var_d4fd6050[var_d4fd6050.size] = var_7e28bc78;
				wait(0.25);
			}
		}
		foreach(perk in var_b4f2b884)
		{
			if(isdefined(perk.script_noteworthy))
			{
				var_7e28bc78 = Array::random(var_d4fd6050);
				while(perk.origin == var_7e28bc78.origin + VectorScale((0, 0, 1), 60) && var_d4fd6050.size > 1)
				{
					var_7e28bc78 = Array::random(var_d4fd6050);
					wait(0.1);
				}
				if(isdefined(var_7e28bc78))
				{
					perk function_9ceba8f4(var_7e28bc78);
					if(IsInArray(var_d4fd6050, var_7e28bc78))
					{
						ArrayRemoveValue(var_d4fd6050, var_7e28bc78);
					}
					wait(0.25);
					var_7e28bc78 struct::delete();
				}
			}
		}
	}
}

/*
	Name: function_9ceba8f4
	Namespace: namespace_afd88775
	Checksum: 0xB3BC5F18
	Offset: 0x6378
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 2528
*/
function function_9ceba8f4(var_7e28bc78)
{
	wait(0.05);
	self.origin = var_7e28bc78.origin + VectorScale((0, 0, 1), 60);
	self.angles = var_7e28bc78.angles;
	if(isdefined(self.machine))
	{
		self.machine.origin = var_7e28bc78.origin;
		self.machine.angles = var_7e28bc78.angles;
	}
	if(isdefined(self.clip))
	{
		self.clip.origin = var_7e28bc78.origin;
		self.clip.angles = var_7e28bc78.angles;
	}
	if(isdefined(self.bump))
	{
		self.bump.origin = var_7e28bc78.origin;
		self.bump.angles = var_7e28bc78.angles;
	}
}

