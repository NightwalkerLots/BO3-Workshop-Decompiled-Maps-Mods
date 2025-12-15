#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
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
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\_zm_weapons;

#namespace namespace_2bf6085c;

/*
	Name: __init__sytem__
	Namespace: namespace_2bf6085c
	Checksum: 0xE8352398
	Offset: 0x6A8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 39
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_bull_ice_blast", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_2bf6085c
	Checksum: 0x67886260
	Offset: 0x6E8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_ec3e5889();
	}
}

/*
	Name: function_ec3e5889
	Namespace: namespace_2bf6085c
	Checksum: 0x11279ECE
	Offset: 0x720
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_ec3e5889()
{
	zm_perks::register_perk_basic_info("specialty_proximityprotection", "bull_ice_blast", 2000, "Hold ^3[{+activate}]^7 for Bull Ice Blast [Cost: &&1]", GetWeapon("zombie_perk_bottle_bull_ice_blast"));
	zm_perks::register_perk_precache_func("specialty_proximityprotection", &function_dd963d47);
	zm_perks::register_perk_clientfields("specialty_proximityprotection", &function_fcd97685, &function_85d08192);
	zm_perks::register_perk_machine("specialty_proximityprotection", &function_72ec9884);
	zm_perks::register_perk_threads("specialty_proximityprotection", &function_8466b8a6, &function_eadcfc94);
	zm_perks::register_perk_host_migration_params("specialty_proximityprotection", "vending_bull_ice_blast", "specialty_proximityprotection");
	level.var_7953cdfc = 300;
	level.var_7d05fd0a = 20;
	level._effect["slam_ice_break"] = "custom/jerri/slam_ice_perk/ice_break_fx";
	level._effect["slam_ice_idle"] = "custom/jerri/slam_ice_perk/ice_idle_fx";
	level._effect["slam_ice_impact"] = "custom/jerri/slam_ice_perk/ice_impact_fx";
	zm_perks::register_perk_damage_override_func(&function_75400bae);
}

/*
	Name: function_dd963d47
	Namespace: namespace_2bf6085c
	Checksum: 0x77A61B8
	Offset: 0x8E0
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 98
*/
function function_dd963d47()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_proximityprotection"] = "zombie/fx_perk_quick_revive_zmb";
		continue;
	}
	level._effect["specialty_proximityprotection"] = "zombie/fx_perk_quick_revive_factory_zmb";
	level.machine_assets["specialty_proximityprotection"] = spawnstruct();
	level.machine_assets["specialty_proximityprotection"].weapon = GetWeapon("zombie_perk_bottle_bull_ice_blast");
	level.machine_assets["specialty_proximityprotection"].off_model = "vending_bull_ice_blast";
	level.machine_assets["specialty_proximityprotection"].on_model = "vending_bull_ice_blast_on";
}

/*
	Name: function_fcd97685
	Namespace: namespace_2bf6085c
	Checksum: 0x9ACF73B8
	Offset: 0xA20
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 123
*/
function function_fcd97685()
{
}

/*
	Name: function_85d08192
	Namespace: namespace_2bf6085c
	Checksum: 0xC0355A36
	Offset: 0xA30
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 137
*/
function function_85d08192(state)
{
}

/*
	Name: function_72ec9884
	Namespace: namespace_2bf6085c
	Checksum: 0x7A90792D
	Offset: 0xA48
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 151
*/
function function_72ec9884(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_bull_ice_blast_jingle";
	use_trigger.script_string = "bull_ice_blast_perk";
	use_trigger.script_label = "mus_perks_bull_ice_blast_sting";
	use_trigger.target = "vending_bull_ice_blast";
	perk_machine.script_string = "bull_ice_blast_perk";
	perk_machine.targetname = "vending_bull_ice_blast";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "bull_ice_blast_perk";
	}
}

/*
	Name: function_8466b8a6
	Namespace: namespace_2bf6085c
	Checksum: 0xCFD58061
	Offset: 0xB10
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 175
*/
function function_8466b8a6(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_proximityprotection", "madgaz_bull_ice_blast");
	self notify("specialty_proximityprotection" + "_start");
	self thread function_c890c1e3();
}

/*
	Name: function_eadcfc94
	Namespace: namespace_2bf6085c
	Checksum: 0x97032D63
	Offset: 0xB90
	Size: 0x80
	Parameters: 3
	Flags: None
	Line Number: 192
*/
function function_eadcfc94(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_proximityprotection");
	self notify("specialty_proximityprotection" + "_stop");
	self notify("perk_lost", str_perk);
	self thread function_d9f6349c();
	return;
}

/*
	Name: function_884d0dc0
	Namespace: namespace_2bf6085c
	Checksum: 0x5724D364
	Offset: 0xC18
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 211
*/
function function_884d0dc0()
{
	var_b2c9df1d = GetEntArray("vending_bull_ice_blast", "targetname");
	foreach(perk_machine in var_b2c9df1d)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "vending_bull_ice_blast_on")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("bull_ice_blast");
		}
	}
}

/*
	Name: function_c890c1e3
	Namespace: namespace_2bf6085c
	Checksum: 0x969DCD97
	Offset: 0xD30
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 234
*/
function function_c890c1e3()
{
	self.var_ec9b0fb8 = 25;
	self thread function_7ce5f558();
	self thread function_c0ce1f84();
}

/*
	Name: function_d9f6349c
	Namespace: namespace_2bf6085c
	Checksum: 0xE6AB8F06
	Offset: 0xD78
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 251
*/
function function_d9f6349c()
{
	self notify("hash_4b450298");
}

/*
	Name: function_7ce5f558
	Namespace: namespace_2bf6085c
	Checksum: 0x3CF77C3E
	Offset: 0xD98
	Size: 0x368
	Parameters: 0
	Flags: None
	Line Number: 266
*/
function function_7ce5f558()
{
	self endon("hash_4b450298");
	self thread function_d837664d();
	self.jetpack = 0;
	self.var_8d60e13f = 0;
	while(1)
	{
		if(self.jumpTime >= 0.35 && !self IsOnGround() && self StanceButtonPressed() && self.var_8d60e13f == 1 && self.var_ec9b0fb8 > 0)
		{
			vel = self getvelocity();
			self SetVelocity(vel - VectorScale((0, 0, 1), 500));
			self.var_ec9b0fb8 = self.var_ec9b0fb8 - 1;
			while(!self IsOnGround())
			{
				wait(0.05);
			}
			Earthquake(0.25, 3, self.origin, 50);
			zombies = util::get_array_of_closest(self.origin, GetAISpeciesArray("axis", "all"), undefined, undefined, level.var_7953cdfc);
			foreach(zombie in zombies)
			{
				if(zombie.targetname == "zombie_ochilon_boss")
				{
					continue;
				}
				if(!zombie.var_11dbc194)
				{
					zombie.var_497a702b = 1;
					zombie thread function_6854314e();
					zombie thread function_2f7defdc();
					zombie thread function_229dc750();
					zombie thread function_528d0b96();
				}
			}
			playFX(level._effect["slam_ice_impact"], self.origin);
			rand = randomIntRange(0, 3);
			playsoundatposition("slam_ice_impact_0" + rand, self.origin);
			wait(0.05);
			self SetStance("stand");
		}
		wait(0.05);
	}
}

/*
	Name: function_d837664d
	Namespace: namespace_2bf6085c
	Checksum: 0xE366DC7
	Offset: 0x1108
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 320
*/
function function_d837664d()
{
	self endon("hash_4b450298");
	while(1)
	{
		level waittill("between_round_over");
		self.var_ec9b0fb8 = 25;
	}
}

/*
	Name: function_6854314e
	Namespace: namespace_2bf6085c
	Checksum: 0x966B120A
	Offset: 0x1148
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 340
*/
function function_6854314e()
{
	self endon("death");
	self.var_11dbc194 = 1;
	rand = randomIntRange(0, 3);
	playsoundatposition("slam_ice_freeze_0" + rand, self.origin);
	FX = spawn("script_model", self.origin + VectorScale((0, 0, 1), 35));
	FX SetModel("tag_origin");
	PlayFXOnTag(level._effect["slam_ice_idle"], FX, "tag_origin");
	FX LinkTo(self);
	self.slam_fx = FX;
	while(self.var_497a702b)
	{
		self.var_988ea0d8 = 1;
		self ASMSetAnimationRate(0.1);
		self setMoveSpeedScale(0);
		wait(0.05);
	}
	self ASMSetAnimationRate(1);
	self setMoveSpeedScale(1);
	self.var_11dbc194 = 0;
}

/*
	Name: function_2f7defdc
	Namespace: namespace_2bf6085c
	Checksum: 0x935FD61B
	Offset: 0x1300
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 373
*/
function function_2f7defdc()
{
	self endon("death");
	old_health = self.health;
	self.health = 1;
	wait(level.var_7d05fd0a);
	self.var_497a702b = 0;
	self.health = old_health;
	self notify("hash_ae5a739f");
	self.slam_fx delete();
	playFX(level._effect["slam_ice_break"], self.origin + VectorScale((0, 0, 1), 35));
	rand = randomIntRange(0, 3);
	playsoundatposition("slam_ice_shatter_0" + rand, self.origin);
	if(isdefined(self.var_599e2fb8))
	{
		self.var_599e2fb8 delete();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_229dc750
	Namespace: namespace_2bf6085c
	Checksum: 0x4D4ADF08
	Offset: 0x1438
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 404
*/
function function_229dc750()
{
	block = spawn("script_model", self.origin + VectorScale((0, 0, 1), 35));
	block SetModel("p_zombie_ice_chunk_01");
	block LinkTo(self);
	self.var_599e2fb8 = block;
}

/*
	Name: function_528d0b96
	Namespace: namespace_2bf6085c
	Checksum: 0x8EC3F760
	Offset: 0x14C0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 422
*/
function function_528d0b96()
{
	self endon("hash_ae5a739f");
	self waittill("death");
	if(isdefined(self.var_599e2fb8))
	{
		self.var_599e2fb8 delete();
	}
	self.var_11dbc194 = 0;
	self.slam_fx delete();
	self ASMSetAnimationRate(1);
	self setMoveSpeedScale(1);
	rand = randomIntRange(0, 3);
	playsoundatposition("slam_ice_shatter_0" + rand, self.origin);
	playFX(level._effect["slam_ice_break"], self.origin + VectorScale((0, 0, 1), 35));
	self StartRagdoll();
}

/*
	Name: function_c051492e
	Namespace: namespace_2bf6085c
	Checksum: 0xF8EE8313
	Offset: 0x1610
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 450
*/
function function_c051492e()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i].jetpack = 0;
		players[i].var_8d60e13f = 0;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b5969a40
	Namespace: namespace_2bf6085c
	Checksum: 0x79CA98F
	Offset: 0x1698
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 472
*/
function function_b5969a40()
{
	self.jetpack = 0;
	self.var_8d60e13f = 0;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c0ce1f84
	Namespace: namespace_2bf6085c
	Checksum: 0x5922CCBA
	Offset: 0x16C0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 490
*/
function function_c0ce1f84()
{
	self.jetpack = 1;
	self.jumpTime = 0;
	self thread function_e2da29d0();
	self thread function_45e2e633();
}

/*
	Name: function_45e2e633
	Namespace: namespace_2bf6085c
	Checksum: 0xCFA92D1F
	Offset: 0x1718
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 508
*/
function function_45e2e633()
{
	self waittill("death");
	self.jetpack = 0;
	self.jumpTime = 0;
	self.var_8d60e13f = 0;
	return;
}

/*
	Name: function_e2da29d0
	Namespace: namespace_2bf6085c
	Checksum: 0xB81E406B
	Offset: 0x1758
	Size: 0x230
	Parameters: 0
	Flags: None
	Line Number: 527
*/
function function_e2da29d0()
{
	self endon("hash_4b450298");
	self endon("disconnect");
	self.jumpTime = 0;
	while(1)
	{
		if(!self IsOnGround())
		{
			self.jumpTime = self.jumpTime + 0.05;
			if(self JumpButtonPressed() && !self IsOnGround() && self.jetpack == 1 && !self.var_8d60e13f && self.jumpTime >= 0.35)
			{
				self.var_8d60e13f = 1;
				Earthquake(0.4, 0.5, self.origin, 100);
				vel = self getvelocity();
				self playsound("jetpack_boost");
				if(self hasPerk("specialty_staminup"))
				{
					self SetVelocity(vel + VectorScale((0, 0, 1), 275));
					continue;
				}
				self SetVelocity(vel + VectorScale((0, 0, 1), 350));
				wait(0.05);
				while(!self IsOnGround())
				{
					wait(0.05);
				}
				self.var_8d60e13f = 0;
				self.jumpTime = 0;
			}
		}
		else if(self IsOnGround())
		{
			self.jumpTime = 0;
		}
		wait(0.05);
	}
}

/*
	Name: function_75400bae
	Namespace: namespace_2bf6085c
	Checksum: 0xB96A0F1D
	Offset: 0x1990
	Size: 0xA4
	Parameters: 10
	Flags: None
	Line Number: 576
*/
function function_75400bae(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!(isdefined(self.jetpack) && self.jetpack))
	{
		return undefined;
	}
	switch(sMeansOfDeath)
	{
		case "MOD_FALLING":
		{
			iDamage = 0;
			return 0;
			break;
		}
		default
		{
		}
	}
	return undefined;
}

