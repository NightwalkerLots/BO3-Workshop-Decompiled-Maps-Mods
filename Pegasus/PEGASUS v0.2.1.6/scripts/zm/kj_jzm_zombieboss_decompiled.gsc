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
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zmsavedata;

#namespace namespace_ec725530;

/*
	Name: function_ca7860d8
	Namespace: namespace_ec725530
	Checksum: 0xB4A10C9E
	Offset: 0x950
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 51
*/
function function_ca7860d8(players)
{
	var_68f752e8 = self namespace_11e193f1::function_69424d4c(42);
	if(var_68f752e8 == 0)
	{
		return;
	}
	self function_b36b2aca(players);
	self function_44c642b0();
	foreach(player in players)
	{
		player thread function_c2ba8da();
	}
	level thread function_eed7158e(players, 3, 1);
	wait(0.1);
	return;
	~var_68f752e8;
}

/*
	Name: function_b36b2aca
	Namespace: namespace_ec725530
	Checksum: 0x933F6A51
	Offset: 0xA78
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 80
*/
function function_b36b2aca(players)
{
	function_c812a54a(players);
}

/*
	Name: function_44c642b0
	Namespace: namespace_ec725530
	Checksum: 0xAC35C558
	Offset: 0xAA8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 95
*/
function function_44c642b0()
{
	var_9c518e3b = self namespace_11e193f1::function_69424d4c(43);
	if(var_9c518e3b == 0)
	{
		return;
	}
	level.var_fea680d5 = var_9c518e3b;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c812a54a
	Namespace: namespace_ec725530
	Checksum: 0x72218C60
	Offset: 0xAF8
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 117
*/
function function_c812a54a(players)
{
	foreach(player in players)
	{
		if(!isdefined(player.hud_damagefeedback))
		{
			player.hud_damagefeedback = newdamageindicatorhudelem(player);
			player.hud_damagefeedback.horzAlign = "center";
			player.hud_damagefeedback.vertAlign = "middle";
			player.hud_damagefeedback.x = -11;
			player.hud_damagefeedback.y = -11;
			player.hud_damagefeedback.alpha = 0;
			player.hud_damagefeedback.archived = 1;
			player.hud_damagefeedback SetShader("damage_feedback_armor", 24, 48);
		}
	}
}

/*
	Name: function_eed7158e
	Namespace: namespace_ec725530
	Checksum: 0xC0B6316D
	Offset: 0xC88
	Size: 0x290
	Parameters: 3
	Flags: None
	Line Number: 145
*/
function function_eed7158e(players, var_195d0846, var_367723a6)
{
	level endon("game_ended");
	if(isdefined(level._effect) && isdefined(level._effect["dog_trail_fire"]))
	{
		var_57f7f726 = Array("armored", "electric", "flamer", "mystery", "kamikaze", "teddy", "nova6");
	}
	else
	{
		var_57f7f726 = Array("armored", "electric", "mystery", "teddy", "nova6");
	}
	wait(0.05);
	while(var_195d0846 != level.round_number)
	{
		level waittill("start_of_round");
		wait(5);
	}
	while(level flag::get("dog_round"))
	{
		level waittill("start_of_round");
		continue;
		boss = Array::random(var_57f7f726);
		wait(5);
		function_62aa834d(boss);
		if(level.round_number > 5)
		{
			wait(randomIntRange(6, 15));
			function_62aa834d(boss);
		}
		if(level.round_number > 10)
		{
			wait(randomIntRange(15, 30));
			function_62aa834d(boss);
		}
		if(level.round_number > 15)
		{
			wait(randomIntRange(10, 20));
			function_62aa834d(boss);
		}
		if(level.round_number > 20)
		{
			wait(randomIntRange(15, 30));
			function_62aa834d(boss);
		}
		level waittill("start_of_round");
	}
}

/*
	Name: function_c72d0e17
	Namespace: namespace_ec725530
	Checksum: 0x8FB5BE0F
	Offset: 0xF20
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 203
*/
function function_c72d0e17()
{
	if(!isdefined(level.n_player_spawn_selection_index))
	{
		level.n_player_spawn_selection_index = 0;
	}
	if(!isdefined(level.var_85861acf))
	{
		foreach(player in GetPlayers())
		{
			if(player IsHost())
			{
				level.var_85861acf = player;
			}
		}
	}
	var_4eec5ce1 = ArraySortClosest(level.var_ce7bc7a1, level.var_85861acf.origin, 10);
	s_spot = Array::random(var_4eec5ce1);
	return s_spot;
}

/*
	Name: function_62aa834d
	Namespace: namespace_ec725530
	Checksum: 0x77D8CBCA
	Offset: 0x1050
	Size: 0x270
	Parameters: 1
	Flags: None
	Line Number: 234
*/
function function_62aa834d(boss)
{
	var_843c87ad = zombie_utility::spawn_zombie(level.zombie_spawners[0], "boss_zombie");
	if(isdefined(var_843c87ad))
	{
		var_843c87ad util::magic_bullet_shield();
		var_843c87ad function_7c582601();
		if(boss == "armored")
		{
			IPrintLnBold("^9Armored Boss");
			var_843c87ad function_e84aaaf1();
		}
		else if(boss == "flamer")
		{
			IPrintLnBold("^9Flame Boss");
			var_843c87ad function_d71ace44();
		}
		else if(boss == "electric")
		{
			IPrintLnBold("^9Electric Boss");
			var_843c87ad function_8c88aa18();
		}
		else if(boss == "mystery")
		{
			IPrintLnBold("^9Mystery Boss");
			var_843c87ad function_c9d0f478();
		}
		else if(boss == "teddy")
		{
			IPrintLnBold("^9Teddy Boss");
			var_843c87ad function_9d8fe091();
		}
		else if(boss == "kamikaze")
		{
			IPrintLnBold("^9Kamikaze Boss");
			var_843c87ad function_10186c48();
		}
		else if(boss == "nova6")
		{
			IPrintLnBold("^9Phaser Boss");
			var_843c87ad function_12445acf();
		}
		else
		{
		}
	}
}

/*
	Name: function_12445acf
	Namespace: namespace_ec725530
	Checksum: 0x6B401A65
	Offset: 0x12C8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 292
*/
function function_12445acf()
{
	self.var_15fcbd2f = "Zombie Phaser";
	self function_bc224c4d();
	self function_5eab01a5();
	self util::stop_magic_bullet_shield();
}

/*
	Name: function_5eab01a5
	Namespace: namespace_ec725530
	Checksum: 0x36761373
	Offset: 0x1330
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 310
*/
function function_5eab01a5()
{
	self thread function_aabb8ee2();
	if(!isdefined(self.completed_emerging_into_playable_area))
	{
		self waittill("completed_emerging_into_playable_area");
	}
	wait(0.2);
	self.var_295dba1e = spawn("script_model", self.origin + VectorScale((0, 0, 1), 40));
	self.var_295dba1e SetModel("tag_origin");
	self.var_295dba1e LinkTo(self);
	wait(0.25);
	self.var_295dba1e zm_powerups::powerup_wobble_fx();
	self thread function_4b091210();
	self zombie_utility::set_zombie_run_cycle("sprint");
	return;
}

/*
	Name: function_aabb8ee2
	Namespace: namespace_ec725530
	Checksum: 0xA94DB44E
	Offset: 0x1440
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 338
*/
function function_aabb8ee2()
{
	self waittill("death", attacker);
	if(isdefined(self.var_295dba1e))
	{
		self.var_295dba1e delete();
	}
	if(isdefined(attacker) && isPlayer(attacker))
	{
		attacker zm_score::add_to_player_score(125);
		thread zm_powerups::specific_powerup_drop(Array::random(level.zombie_powerup_array), self.origin);
	}
}

/*
	Name: function_4b091210
	Namespace: namespace_ec725530
	Checksum: 0xB0A0F8BF
	Offset: 0x1500
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 362
*/
function function_4b091210()
{
	level endon("game_ended");
	self endon("death");
	for(;;)
	{
		wait(randomIntRange(1, 6));
		var_3146048e = RandomInt(7);
		self function_fb35cff3(var_3146048e);
	}
}

/*
	Name: function_fb35cff3
	Namespace: namespace_ec725530
	Checksum: 0x42B9E89
	Offset: 0x1580
	Size: 0x158
	Parameters: 1
	Flags: None
	Line Number: 384
*/
function function_fb35cff3(var_3146048e)
{
	level endon("game_ended");
	self endon("death");
	phases = 0;
	while(phases < var_3146048e)
	{
		phases++;
		wait(0.65);
		var_a638c0c2 = GetClosestPointOnNavMesh(self.origin + (75, 75, 10), 50, 15);
		if(isdefined(var_a638c0c2))
		{
			self ForceTeleport(var_a638c0c2);
			playsoundatposition("zmb_powerup_grabbed", self.origin);
		}
		wait(0.65);
		var_a638c0c2 = GetClosestPointOnNavMesh(self.origin + (-75, -75, 10), 50, 15);
		if(isdefined(var_a638c0c2))
		{
			self ForceTeleport(var_a638c0c2);
			playsoundatposition("zmb_powerup_grabbed", self.origin);
		}
	}
}

/*
	Name: function_10186c48
	Namespace: namespace_ec725530
	Checksum: 0x911F8509
	Offset: 0x16E0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 419
*/
function function_10186c48()
{
	self.var_15fcbd2f = "Kamikaze Zombie";
	self function_bc224c4d();
	self zombie_utility::zombie_eye_glow_stop();
	self function_97c275c0();
	self util::stop_magic_bullet_shield();
}

/*
	Name: function_97c275c0
	Namespace: namespace_ec725530
	Checksum: 0x6FA455CA
	Offset: 0x1760
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 438
*/
function function_97c275c0()
{
	self thread function_c1cd4b93();
	self zombie_utility::set_zombie_run_cycle("sprint");
}

/*
	Name: function_c1cd4b93
	Namespace: namespace_ec725530
	Checksum: 0x7B4389B0
	Offset: 0x17A8
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 454
*/
function function_c1cd4b93()
{
	level endon("game_ended");
	if(!isdefined(self.completed_emerging_into_playable_area))
	{
		self waittill("completed_emerging_into_playable_area");
	}
	players = GetPlayers();
	self thread function_ed8c4e85(players);
	while(isdefined(self))
	{
		foreach(player in players)
		{
			if(Distance(self.origin, player.origin) < 150)
			{
				self AnimScripted("jzmb_kamikaze_taunt", self.origin, self.angles, "ai_zombie_base_taunts_v9");
				self playsound("zmb_vocals_zombie_death_fire");
				wait(1.65);
				self DoDamage(self.health + 666, self.origin);
				break;
			}
		}
		wait(0.65);
	}
}

/*
	Name: function_ed8c4e85
	Namespace: namespace_ec725530
	Checksum: 0xDACC1557
	Offset: 0x1958
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 490
*/
function function_ed8c4e85(players)
{
	level endon("game_ended");
	self waittill("death", attacker);
	if(isdefined(attacker) && isPlayer(attacker))
	{
		attacker zm_score::add_to_player_score(125);
		thread zm_powerups::specific_powerup_drop(Array::random(level.zombie_powerup_array), self.origin);
	}
	else if(isdefined(level._effect) && isdefined(level._effect["dog_gib"]))
	{
		PlayFXOnTag(level._effect["dog_gib"], self, "tag_origin");
		self thread function_85517f4(players);
		wait(0.15);
		self Hide();
	}
}

/*
	Name: function_85517f4
	Namespace: namespace_ec725530
	Checksum: 0x5940A569
	Offset: 0x1A90
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 518
*/
function function_85517f4(players)
{
	foreach(player in players)
	{
		if(Distance(self.origin, player.origin) < 275)
		{
			player DoDamage(10, player.origin);
			wait(0.1);
			player shellshock("flashbang", 0.6);
		}
	}
	return;
}

/*
	Name: function_9d8fe091
	Namespace: namespace_ec725530
	Checksum: 0x8ADA71E
	Offset: 0x1BA0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 542
*/
function function_9d8fe091()
{
	self.var_15fcbd2f = "Teddy Bear";
	self function_bc224c4d();
	self zombie_utility::zombie_eye_glow_stop();
	self thread function_c3143943();
	self util::stop_magic_bullet_shield();
}

/*
	Name: function_c3143943
	Namespace: namespace_ec725530
	Checksum: 0x32267D84
	Offset: 0x1C20
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 561
*/
function function_c3143943()
{
	level endon("game_ended");
	self endon("death");
	self.var_1852a547 = 1;
	self DetachAll();
	self SetModel("p7_zm_teddybear");
	self thread function_29b867aa();
	while(isdefined(self))
	{
		Earthquake(0.5, 0.65, self.origin, 300);
		wait(0.75);
	}
}

/*
	Name: function_29b867aa
	Namespace: namespace_ec725530
	Checksum: 0xF5AD802E
	Offset: 0x1CE0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 586
*/
function function_29b867aa()
{
	self waittill("death", attacker);
	if(isdefined(attacker) && isPlayer(attacker))
	{
		level thread zm_audio::sndAnnouncerPlayVox("boxmove");
		self thread function_df87fb96();
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_df87fb96
	Namespace: namespace_ec725530
	Checksum: 0x58793984
	Offset: 0x1D60
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 608
*/
function function_df87fb96()
{
	if(isdefined(self) && isdefined(self.completed_emerging_into_playable_area))
	{
		var_c7a8f7c6 = spawn("script_model", self.origin + VectorScale((0, 0, 1), 40));
		var_c7a8f7c6 SetModel("tag_origin");
		var_c7a8f7c6 SetScale(0.3);
		var_c7a8f7c6.any_team = 1;
		playsoundatposition("zmb_spawn_powerup", self.origin);
		wait(0.1);
		if(isdefined(var_c7a8f7c6))
		{
			var_c7a8f7c6 PlayLoopSound("zmb_spawn_powerup_loop");
			wait(0.1);
			thread function_67bb238a(var_c7a8f7c6);
			var_c7a8f7c6 thread zm_powerups::powerup_wobble();
			var_c7a8f7c6 thread zm_powerups::powerup_timeout();
		}
	}
}

/*
	Name: function_67bb238a
	Namespace: namespace_ec725530
	Checksum: 0xC8FE591F
	Offset: 0x1EB8
	Size: 0x198
	Parameters: 1
	Flags: None
	Line Number: 639
*/
function function_67bb238a(var_c7a8f7c6)
{
	level endon("game_ended");
	var_c7a8f7c6 endon("powerup_timedout");
	wait(1.5);
	var_c7a8f7c6 SetModel("p7_zm_teddybear");
	players = GetPlayers();
	while(isdefined(var_c7a8f7c6))
	{
		foreach(player in players)
		{
			if(Distance(player.origin, var_c7a8f7c6.origin) < 50)
			{
				playsoundatposition("zmb_powerup_grabbed", player.origin);
				var_c7a8f7c6 notify("powerup_grabbed");
				wait(0.05);
				var_c7a8f7c6 delete();
				thread function_f69a7230(player);
				break;
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_f69a7230
	Namespace: namespace_ec725530
	Checksum: 0x38062073
	Offset: 0x2058
	Size: 0x228
	Parameters: 1
	Flags: None
	Line Number: 674
*/
function function_f69a7230(player)
{
	var_5ad7f1eb = randomIntRange(0, 5);
	playsoundatposition("teddy_bear_grabbed", player.origin);
	switch(var_5ad7f1eb)
	{
		case 0:
		{
			player zm_score::add_to_player_score(500);
			player IPrintLnBold("^2Teddybear Reward: $500");
			break;
		}
		case 1:
		{
			player zm_perks::give_random_perk();
			player IPrintLnBold("^2Teddybear Reward: Random Perk");
			break;
		}
		case 2:
		{
			player zm_score::add_to_player_score(3500);
			player IPrintLnBold("^2Teddybear Reward: Jackpot $3500");
			break;
		}
		case 3:
		{
			currentWeapon = player GetCurrentWeapon();
			player TakeWeapon(currentWeapon);
			player IPrintLnBold("^1Teddybear Reward: Lost Weapon");
			break;
		}
		case 4:
		{
			player thread function_a2e6e744();
			player IPrintLnBold("^1Teddybear Reward: Freeze Controller");
			break;
		}
		default
		{
			player zm_score::add_to_player_score(500);
			player IPrintLnBold("^2Teddybear Reward: $500");
			break;
		}
	}
	return;
}

/*
	Name: function_a2e6e744
	Namespace: namespace_ec725530
	Checksum: 0x386F2FC6
	Offset: 0x2288
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 731
*/
function function_a2e6e744()
{
	randy = randomIntRange(1, 4);
	self FreezeControls(1);
	wait(randy);
	self FreezeControls(0);
}

/*
	Name: function_c9d0f478
	Namespace: namespace_ec725530
	Checksum: 0x97B65840
	Offset: 0x22F8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 749
*/
function function_c9d0f478()
{
	self.var_15fcbd2f = "Mystery Zombie";
	self function_bc224c4d();
	self zombie_utility::zombie_eye_glow_stop();
	self function_67d45510();
	self util::stop_magic_bullet_shield();
}

/*
	Name: function_67d45510
	Namespace: namespace_ec725530
	Checksum: 0x170A755E
	Offset: 0x2378
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 768
*/
function function_67d45510()
{
	self.var_4872e5 = 1;
	self DetachAll();
	self SetModel("boss_mysterybox");
	self thread function_fd7acea1();
}

/*
	Name: function_fd7acea1
	Namespace: namespace_ec725530
	Checksum: 0xB3F2B5A3
	Offset: 0x23E0
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 786
*/
function function_fd7acea1()
{
	self waittill("death", attacker);
	if(isdefined(attacker) && !isPlayer(attacker))
	{
		return;
	}
	if(isdefined(self) && isdefined(self.completed_emerging_into_playable_area))
	{
		var_672aab60 = spawn("script_model", self.origin + VectorScale((0, 0, 1), 40));
		var_672aab60 SetModel("tag_origin");
		var_672aab60.var_4cd06ff7 = 1;
		var_672aab60.any_team = 1;
		playsoundatposition("zmb_spawn_powerup", self.origin);
		wait(0.1);
		if(isdefined(var_672aab60))
		{
			var_672aab60 PlayLoopSound("zmb_spawn_powerup_loop");
			wait(0.1);
			thread function_def61428(var_672aab60);
			var_672aab60 thread zm_powerups::powerup_wobble();
			var_672aab60 thread zm_powerups::powerup_timeout();
			return;
		}
	}
}

/*
	Name: function_def61428
	Namespace: namespace_ec725530
	Checksum: 0xF9CE2E9E
	Offset: 0x2568
	Size: 0x230
	Parameters: 1
	Flags: None
	Line Number: 823
*/
function function_def61428(var_672aab60)
{
	level endon("game_ended");
	wait(1.5);
	function_dda6fbd1(var_672aab60);
	if(isdefined(var_672aab60.var_b15a8b45))
	{
		var_8f466ccc = function_1c8adcb0(GetWeapon(var_672aab60.var_b15a8b45));
		var_672aab60 SetModel(var_8f466ccc);
	}
	wait(0.25);
	trig = spawn("trigger_radius_use", var_672aab60.origin + VectorScale((0, 0, 1), 32), 0, 32, 32);
	trig setcursorhint("HINT_NOICON");
	trig setHintString("Hold ^3[{+activate}] ^5To Take Weapon");
	trig SetTeamForTrigger("allies");
	thread function_c24961f5(var_672aab60, trig);
	trig waittill("trigger", player);
	trig delete();
	playsoundatposition("zmb_powerup_grabbed", player.origin);
	var_672aab60 notify("powerup_grabbed");
	wait(0.05);
	var_672aab60 delete();
	player zm_weapons::weapon_give(GetWeapon(var_672aab60.var_b15a8b45), undefined, undefined, 1);
}

/*
	Name: function_c24961f5
	Namespace: namespace_ec725530
	Checksum: 0xCEA4120C
	Offset: 0x27A0
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 858
*/
function function_c24961f5(var_672aab60, trig)
{
	var_672aab60 endon("powerup_grabbed");
	var_672aab60 waittill("powerup_timedout");
	var_672aab60 delete();
	trig delete();
}

/*
	Name: function_dda6fbd1
	Namespace: namespace_ec725530
	Checksum: 0x7159E80A
	Offset: 0x2808
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 876
*/
function function_dda6fbd1(var_672aab60)
{
	var_a0419833 = randomIntRange(1, 8);
	switch(var_a0419833)
	{
		case 1:
		{
			var_672aab60.var_b15a8b45 = "smg_standard";
			break;
		}
		case 2:
		{
			var_672aab60.var_b15a8b45 = "smg_burst";
			break;
		}
		case 3:
		{
			var_672aab60.var_b15a8b45 = "smg_capacity";
			break;
		}
		case 4:
		{
			var_672aab60.var_b15a8b45 = "ar_standard";
			break;
		}
		case 5:
		{
			var_672aab60.var_b15a8b45 = "bowie_knife";
			break;
		}
		case 6:
		{
			var_672aab60.var_b15a8b45 = "ray_gun";
			break;
		}
		case 7:
		{
			var_672aab60.var_b15a8b45 = "pistol_standard";
			break;
		}
		default
		{
			var_672aab60.var_b15a8b45 = "pistol_standard";
			break;
		}
	}
}

/*
	Name: function_8c88aa18
	Namespace: namespace_ec725530
	Checksum: 0x72F9B28F
	Offset: 0x2958
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 934
*/
function function_8c88aa18()
{
	self.var_15fcbd2f = "Electric Zombie";
	self function_52d8d300();
	self util::stop_magic_bullet_shield();
	return;
	ERROR: Bad function call
}

/*
	Name: function_52d8d300
	Namespace: namespace_ec725530
	Checksum: 0xA9016840
	Offset: 0x29A8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 953
*/
function function_52d8d300()
{
	self.var_552b62a6 = 1;
	wait(1.7);
	self clientfield::set("lc_fx", 2);
	self thread function_cf9f14d7();
}

/*
	Name: function_cf9f14d7
	Namespace: namespace_ec725530
	Checksum: 0xEAD22158
	Offset: 0x2A08
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 971
*/
function function_cf9f14d7()
{
	self waittill("death", attacker);
	self playsound("zmb_vocals_zombie_electrocute");
	if(isdefined(attacker))
	{
		attacker zm_score::add_to_player_score(125);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d71ace44
	Namespace: namespace_ec725530
	Checksum: 0xF510951C
	Offset: 0x2A78
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 993
*/
function function_d71ace44()
{
	self.var_15fcbd2f = "Fire Zombie";
	self function_a29b6c34();
	self util::stop_magic_bullet_shield();
}

/*
	Name: function_a29b6c34
	Namespace: namespace_ec725530
	Checksum: 0x49924176
	Offset: 0x2AC8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1010
*/
function function_a29b6c34()
{
	self.var_a6eab02e = 1;
	wait(1.7);
	if(isdefined(level._effect) && isdefined(level._effect["dog_trail_fire"]))
	{
		PlayFXOnTag(level._effect["dog_trail_fire"], self, "J_SpineLower");
	}
	self thread function_b91c23e6();
}

/*
	Name: function_b91c23e6
	Namespace: namespace_ec725530
	Checksum: 0x28698A8
	Offset: 0x2B50
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 1031
*/
function function_b91c23e6()
{
	self waittill("death", attacker);
	if(isdefined(level._effect) && isdefined(level._effect["dog_gib"]))
	{
		PlayFXOnTag(level._effect["dog_gib"], self, "tag_origin");
		if(isdefined(attacker))
		{
			attacker zm_score::add_to_player_score(125);
			if(Distance(attacker.origin, self.origin) < 150)
			{
				attacker DoDamage(5, attacker.origin);
				wait(0.1);
				attacker shellshock("concussion_grenade_mp", 0.6);
			}
		}
		wait(0.05);
		self Hide();
		return;
	}
	waittillframeend;
}

/*
	Name: function_e84aaaf1
	Namespace: namespace_ec725530
	Checksum: 0x5483BCBD
	Offset: 0x2C98
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1064
*/
function function_e84aaaf1()
{
	self.var_15fcbd2f = "Armored Zombie";
	self function_87682d33();
	self util::stop_magic_bullet_shield();
}

/*
	Name: function_87682d33
	Namespace: namespace_ec725530
	Checksum: 0xB1885992
	Offset: 0x2CE8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1081
*/
function function_87682d33()
{
	self.var_d9acbbf0 = 1;
	shield = "wpn_t7_shield_riot_world";
	self Attach(shield, "tag_stowed_back");
	self thread function_bc0e6e8b();
	self thread function_b7d5e468(shield);
	return;
}

/*
	Name: function_b7d5e468
	Namespace: namespace_ec725530
	Checksum: 0x8722BDCC
	Offset: 0x2D68
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 1101
*/
function function_b7d5e468(shield)
{
	self waittill("death", attacker);
	self Detach(shield, "tag_stowed_back");
	if(isdefined(attacker))
	{
		attacker zm_score::add_to_player_score(125);
	}
}

/*
	Name: function_bc0e6e8b
	Namespace: namespace_ec725530
	Checksum: 0x83EC1CC4
	Offset: 0x2DE0
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 1121
*/
function function_bc0e6e8b()
{
	self endon("death");
	for(;;)
	{
		self waittill("damage", amount, attacker, direction_vec, point, type, tagName, modelName, partName, weapon, dFlags, inflictor, chargeLevel);
		attacker playlocalsound("boss_armor_damage");
		attacker.hud_damagefeedback SetShader("damage_feedback_armor", 24, 48);
		attacker.hud_damagefeedback.color = (1, 0, 0);
		attacker.hud_damagefeedback.alpha = 1;
		attacker.hud_damagefeedback fadeOverTime(1);
		attacker.hud_damagefeedback.alpha = 0;
		attacker.hud_damagefeedback.color = (1, 1, 1);
	}
}

/*
	Name: function_7c582601
	Namespace: namespace_ec725530
	Checksum: 0x67BACCDB
	Offset: 0x2F78
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 1147
*/
function function_7c582601()
{
	self.var_d88111ce = 1;
	self.var_5c67e6ed = 1;
	self set_health();
	self thread zm_spawner::zombie_think();
	self.ignore_round_robbin_death = 1;
	self.var_a780c014 = 1;
	self.allowPain = 0;
	self.ignore_all_poi = 1;
	self.canBeTargetedByTurnedZombies = 0;
	self.no_damage_points = 0;
	self.no_powerups = 1;
	self.no_widows_wine = 1;
	self.var_78e43256 = 1;
	self.b_octobomb_infected = 0;
	self.b_ignore_cleanup = 1;
	self.ignore_nuke = 0;
	self.var_547e2c82 = 1;
	self.var_db3ea914 = 1;
	self.var_f8035a0d = 1;
	self.lightning_chain_immune = 1;
	self.instakill_func = &function_33193cbd;
	self.tesla_damage_func = &function_9ab387c7;
	self.zombie_arms_position = "up";
	if(level flag::get("dog_round"))
	{
		self.ignore_enemy_count = 1;
	}
	else
	{
		self.ignore_enemy_count = 0;
	}
}

/*
	Name: set_health
	Namespace: namespace_ec725530
	Checksum: 0x655DB107
	Offset: 0x3110
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 1192
*/
function set_health()
{
	self waittill("zombie_init_done");
	if(isdefined(self))
	{
		if(isdefined(self.health))
		{
			if(isdefined(level.var_fea680d5))
			{
				health = level.round_number * 50 + level.var_fea680d5;
				self.health = health;
				self.maxhealth = health;
			}
			else
			{
				random = level.round_number * 50 + RandomInt(1000);
				self.health = random;
				self.maxhealth = random;
			}
		}
		else if(isdefined(level.var_fea680d5))
		{
			health = level.round_number * 50 + level.var_fea680d5;
			self.health = health;
			self.maxhealth = health;
		}
		else
		{
			random = level.round_number * 50 + RandomInt(1000);
			self.health = random;
			self.maxhealth = random;
		}
	}
}

/*
	Name: function_33193cbd
	Namespace: namespace_ec725530
	Checksum: 0x15E8B4A3
	Offset: 0x3260
	Size: 0x20
	Parameters: 3
	Flags: None
	Line Number: 1237
*/
function function_33193cbd(player, mod, HIT_LOCATION)
{
	return 1;
}

/*
	Name: function_9ab387c7
	Namespace: namespace_ec725530
	Checksum: 0x4EAA3E23
	Offset: 0x3288
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 1252
*/
function function_9ab387c7(v_origin, e_player)
{
	return 1;
}

/*
	Name: function_f8efa4ff
	Namespace: namespace_ec725530
	Checksum: 0x2BD37AF1
	Offset: 0x32A8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1267
*/
function function_f8efa4ff()
{
	a_spots = level.zm_loc_types["zombie_location"];
	if(!isdefined(level.n_player_spawn_selection_index))
	{
		level.n_player_spawn_selection_index = 0;
	}
	var_4eec5ce1 = ArraySortClosest(a_spots, self.origin, 10);
	s_spot = Array::random(var_4eec5ce1);
	return s_spot;
}

/*
	Name: function_bc224c4d
	Namespace: namespace_ec725530
	Checksum: 0x78F4DE11
	Offset: 0x3340
	Size: 0x228
	Parameters: 0
	Flags: None
	Line Number: 1289
*/
function function_bc224c4d()
{
	self.gibbed = 1;
	self.noCrawler = 1;
	self.head_gibbed = 1;
	self.disable_head_gib = 1;
	self.torsodmg1 = undefined;
	self.torsodmg2 = undefined;
	self.torsodmg3 = undefined;
	self.torsodmg4 = undefined;
	self.torsodmg5 = undefined;
	self.legdmg1 = undefined;
	self.legdmg2 = undefined;
	self.legdmg3 = undefined;
	self.legdmg4 = undefined;
	self.gibSpawn1 = undefined;
	self.gibSpawnTag1 = "J_Elbow_RI";
	self.gibSpawn2 = undefined;
	self.gibSpawnTag2 = "J_Elbow_LE";
	self.gibSpawn3 = undefined;
	self.gibSpawnTag3 = "J_Knee_RI";
	self.gibSpawn4 = undefined;
	self.gibSpawnTag4 = "J_Knee_LE";
	self.gib_data.head = self.head;
	self.gib_data.legdmg1 = self.legdmg1;
	self.gib_data.legdmg2 = self.legdmg2;
	self.gib_data.legdmg3 = self.legdmg3;
	self.gib_data.legdmg4 = self.legdmg4;
	self.gib_data.hatModel = self.hatModel;
	self.gib_data.Headmodel = self.Headmodel;
	self.gib_data.gearModel = self.gearModel;
	self.gib_data.torsodmg1 = self.torsodmg1;
	self.gib_data.torsodmg2 = self.torsodmg2;
	self.gib_data.torsodmg3 = self.torsodmg3;
	self.gib_data.torsodmg4 = self.torsodmg4;
	self.gib_data.torsodmg5 = self.torsodmg5;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c2ba8da
	Namespace: namespace_ec725530
	Checksum: 0xC5AD9A23
	Offset: 0x3570
	Size: 0x246
	Parameters: 0
	Flags: None
	Line Number: 1339
*/
function function_c2ba8da()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("damage", damage, attacker, direction, point, type, tagName, modelName, partName, weapon, iDFlags);
		if(isdefined(attacker))
		{
			if(isdefined(attacker.var_d9acbbf0))
			{
				self DoDamage(12, self.origin);
				self playlocalsound("boss_armor_damage");
			}
			else if(isdefined(attacker.var_a6eab02e))
			{
				if(!isdefined(self.var_d43adbdf))
				{
					self burnplayer::SetPlayerBurning(1.5, 0, 0, undefined, undefined);
				}
			}
			else if(isdefined(attacker.var_552b62a6))
			{
				self SetElectrified(1.7);
				self playlocalsound("zmb_electrocute_zombie");
			}
			else if(isdefined(attacker.var_4872e5))
			{
				weapon_to_take = self GetCurrentWeapon();
				if(isdefined(weapon_to_take))
				{
					self TakeWeapon(weapon_to_take);
				}
			}
			else if(isdefined(attacker.var_1852a547))
			{
				wait(0.1);
				self shellshock("dog_bite", 1);
			}
		}
		wait(1);
	}
}

