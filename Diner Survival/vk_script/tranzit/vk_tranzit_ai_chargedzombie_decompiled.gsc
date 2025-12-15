#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\sound_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\vk_script\_zm_vk_general;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_d50cfad9;

/*
	Name: init
	Namespace: namespace_d50cfad9
	Checksum: 0x711F160B
	Offset: 0x5A0
	Size: 0x70
	Parameters: 0
	Flags: AutoExec
	Line Number: 37
*/
function autoexec init()
{
	level waittill("all_players_connected");
	level.var_95529adf = 0;
	level thread function_c635ca();
	wait(30);
	if(!isdefined(level.var_eec7c5cf))
	{
		level.var_eec7c5cf = "normal";
	}
	level thread function_ed74e76c();
}

/*
	Name: function_ed74e76c
	Namespace: namespace_d50cfad9
	Checksum: 0x8A71331B
	Offset: 0x618
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function function_ed74e76c()
{
	level waittill("start_of_round");
	if(level.var_eec7c5cf == "easy")
	{
		while(level.round_number < 12)
		{
			wait(5);
		}
		level.var_2109b000 = 3;
		level thread function_9b97f3d9();
	}
	if(level.var_eec7c5cf == "normal")
	{
		while(level.round_number < 6)
		{
			wait(5);
		}
		level.var_2109b000 = 6;
		level thread function_9b97f3d9();
	}
	if(level.var_eec7c5cf == "hard")
	{
		while(level.round_number < 3)
		{
			wait(5);
		}
		level.var_2109b000 = 18;
		level thread function_9b97f3d9();
	}
	if(level.var_eec7c5cf == undefined)
	{
		thread namespace_f56b53f0::function_dbe7e78b("^5(Charged Zombie) ^3Error: No Difficulty Set");
	}
}

/*
	Name: function_9b97f3d9
	Namespace: namespace_d50cfad9
	Checksum: 0xBD08E287
	Offset: 0x750
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_9b97f3d9()
{
	thread namespace_f56b53f0::function_dbe7e78b("^5(Charged Zombie) ^2Handler ^7Difficulty: ^3" + level.var_eec7c5cf);
	while(1)
	{
		wait(0.05);
		enemies = GetAISpeciesArray("axis", "all");
		foreach(enemy in enemies)
		{
			chance = randomIntRange(1, 100);
			if(chance <= level.var_2109b000 && (!(isdefined(enemy.var_6bac1892) && enemy.var_6bac1892)))
			{
				enemy thread function_ec0a8c73();
			}
		}
		if(isdefined(level.var_d6afeb59) && level.var_d6afeb59)
		{
			wait(4);
			continue;
		}
		VAL = randomIntRange(48, 96);
		timer = 0;
		while(timer < VAL)
		{
			timer = timer + 0.1;
			wait(0.1);
			if(isdefined(level.var_d6afeb59) && level.var_d6afeb59)
			{
				break;
			}
		}
	}
}

/*
	Name: function_ec0a8c73
	Namespace: namespace_d50cfad9
	Checksum: 0x4B0C8DE
	Offset: 0x948
	Size: 0x290
	Parameters: 0
	Flags: None
	Line Number: 150
*/
function function_ec0a8c73()
{
	thread namespace_f56b53f0::function_dbe7e78b("^5(Charged Zombie) ^2Zombie Charged");
	self.var_6bac1892 = 1;
	self.var_18ba7cb4 = "Charged Zombie";
	self ASMSetAnimationRate(1.1);
	self setMoveSpeedScale(1.1);
	self.health = self.health * 1.6;
	Earthquake(0.2, 0.25, self.origin, 500);
	var_882cf05c = self GetTagOrigin("tag_eye");
	playFX("vk_fx/zm/_vk_zm_chargedzombie_spawn", var_882cf05c);
	var_cc182f50 = PlayFXOnTag("vk_fx/zm/_vk_zm_eyes_charged_zombie", self, "tag_eye");
	var_9fa8c7a2 = PlayFXOnTag("vk_fx/zm/_vk_zm_chargedzombie_trail", self, "j_spineupper");
	if(level.var_eec7c5cf == "easy" || level.var_eec7c5cf == "normal")
	{
		while(self.health > 0)
		{
			wait(0.1);
			Grave = self.origin;
			var_e72d2576 = self GetTagOrigin("j_spineupper");
		}
		self waittill("death");
		thread namespace_f56b53f0::function_dbe7e78b("^5(Charged Zombie) ^2Killed");
		var_cc182f50 delete();
		self thread function_7daa1ff7(Grave);
		playFX("vk_fx/zm/_vk_zm_chargedzombie_death", var_e72d2576);
		level.var_95529adf++;
		thread namespace_f56b53f0::function_dbe7e78b("^7Total Charged Zombies Killed: ^3" + level.var_95529adf);
	}
}

/*
	Name: function_7daa1ff7
	Namespace: namespace_d50cfad9
	Checksum: 0x807E1097
	Offset: 0xBE0
	Size: 0x298
	Parameters: 1
	Flags: None
	Line Number: 191
*/
function function_7daa1ff7(location)
{
	if(level.var_eec7c5cf == "easy")
	{
		var_a7a3aed0[0] = "free_perk";
		var_a7a3aed0[1] = "double_points";
		var_a7a3aed0[2] = "insta_kill";
		var_a7a3aed0[3] = "full_ammo";
		var_a7a3aed0[4] = "nuke";
		var_a7a3aed0[5] = "minigun";
		var_a7a3aed0[6] = "carpenter";
		var_a7a3aed0[7] = "bonus_points_player";
		var_a7a3aed0[8] = "bonus_points_player";
		var_a7a3aed0[9] = "bonus_points_player";
		var_a7a3aed0[10] = "fire_sale";
		continue;
	}
	var_a7a3aed0[0] = "double_points";
	var_a7a3aed0[1] = "insta_kill";
	var_a7a3aed0[2] = "full_ammo";
	var_a7a3aed0[3] = "nuke";
	var_a7a3aed0[4] = "minigun";
	var_a7a3aed0[5] = "carpenter";
	var_a7a3aed0[6] = "carpenter";
	var_a7a3aed0[7] = "bonus_points_player";
	var_a7a3aed0[8] = "bonus_points_player";
	var_a7a3aed0[9] = "bonus_points_player";
	var_a7a3aed0[10] = "bonus_points_player";
	var_6449d119 = Array::randomize(var_a7a3aed0);
	powerup = var_6449d119[0];
	powerup_team = undefined;
	powerup_location = undefined;
	pickup_delay = undefined;
	powerup_player = undefined;
	b_stay_forever = 0;
	zm_powerups::specific_powerup_drop(powerup, location, powerup_team, powerup_location, pickup_delay, powerup_player, b_stay_forever);
}

/*
	Name: function_c635ca
	Namespace: namespace_d50cfad9
	Checksum: 0xBFE729ED
	Offset: 0xE80
	Size: 0x1C4
	Parameters: 0
	Flags: None
	Line Number: 239
*/
function function_c635ca()
{
	level.var_d6afeb59 = 0;
	modvar("vk_charged_zombie_debug", "0");
	SetDvar("vk_charged_zombie_debug", 0);
	oldVal = 6;
	while(1)
	{
		if(GetDvarInt("vk_charged_zombie_debug") >= 1)
		{
			if(isdefined(level.var_d4d38dac) && level.var_d4d38dac)
			{
				level.var_d6afeb59 = 1;
				IPrintLnBold("Charged Zombie Debugging Enabled");
				SetDvar("vk_charged_zombie_debug", 1);
				oldVal = level.var_2109b000;
				level.var_2109b000 = 25;
			}
			while(GetDvarInt("vk_charged_zombie_debug") >= 1)
			{
				wait(0.1);
			}
		}
		else if(isdefined(level.var_d4d38dac) && level.var_d4d38dac)
		{
			level.var_d6afeb59 = 0;
			IPrintLnBold("Charged Zombie Debugging Disabled");
			SetDvar("vk_charged_zombie_debug", 0);
			level.var_2109b000 = oldVal;
		}
		while(GetDvarInt("vk_charged_zombie_debug") == 0)
		{
			wait(0.1);
		}
		wait(0.1);
	}
}

