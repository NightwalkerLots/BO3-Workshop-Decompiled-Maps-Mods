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
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_e8b460a;

/*
	Name: __init__sytem__
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x650
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("BULL_ICE", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x690
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function __init__()
{
	function_1a92256e();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1a92256e
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x6B0
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_bull_ice", "customperk", 4500, &"ZM_REAP_MOD_PERK_BULL_ICE", GetWeapon("zombie_perk_bottle_BULL_ICE"));
	zm_perks::register_perk_precache_func("specialty_bull_ice", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_bull_ice", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_bull_ice", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_bull_ice", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_bull_ice", "Bull Ice Blast", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_bull_ice", &"ZM_REAP_MOD_PERK_BULL_ICE_DB", 2000, "Bull Ice Blast", "bull_ice_blast");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_bull_ice"] = 1;
	level.var_7953cdfc = 300;
	level.var_7d05fd0a = 20;
	zm_perks::register_perk_damage_override_func(&function_75400bae);
	return;
	ERROR: Bad function call
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x888
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 108
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_bull_ice"] = spawnstruct();
	level.machine_assets["specialty_bull_ice"].weapon = GetWeapon("zombie_perk_bottle_BULL_ICE");
	level.machine_assets["specialty_bull_ice"].off_model = "vending_bull_ice_blast";
	level.machine_assets["specialty_bull_ice"].on_model = "vending_bull_ice_blast_on";
}

/*
	Name: function_19157aff
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x930
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 126
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x940
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 140
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_bull_ice", "bull_ice_blast", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x988
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 155
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_bull_ice_blast_jingle";
	use_trigger.script_string = "specialty_bull_ice";
	use_trigger.script_label = "mus_perks_bull_ice_blast_sting";
	use_trigger.target = "Bull Ice Blast";
	perk_machine.script_string = "specialty_bull_ice";
	perk_machine.targetname = "Bull Ice Blast";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_bull_ice";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0xA50
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 179
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_bull_ice"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_bull_ice"] = 1;
	self thread function_c890c1e3();
}

/*
	Name: function_b4722825
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0xAE8
	Size: 0x70
	Parameters: 3
	Flags: None
	Line Number: 208
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_bull_ice"] = 0;
	self.var_b5c2c258["specialty_bull_ice"] = undefined;
	self.var_d6aef449["specialty_bull_ice"] = undefined;
	self thread function_d9f6349c();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c890c1e3
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0xB60
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 228
*/
function function_c890c1e3()
{
	self.var_8d60e13f = 0;
	self.var_ec9b0fb8 = 25;
	self thread namespace_4b6e359c::function_75aa16e4("specialty_bull_ice", "bull_ice_blast", "Meter", Int(100));
	self thread function_7ce5f558();
	self thread function_4408acc6();
	self thread function_e2da29d0();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4408acc6
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0xC10
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 250
*/
function function_4408acc6()
{
	self endon("disconnect");
	self notify("hash_4408acc6");
	self endon("hash_4408acc6");
	while(1)
	{
		while(self IsOnGround())
		{
			wait(0.05);
		}
		self notify("hash_cd8ae4a0");
		while(!self IsOnGround())
		{
			wait(0.05);
		}
		self notify("jump_end");
		wait(0.05);
	}
}

/*
	Name: function_d9f6349c
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0xCB8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 281
*/
function function_d9f6349c()
{
	self notify("hash_4b450298");
}

/*
	Name: function_7ce5f558
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0xCD8
	Size: 0x470
	Parameters: 0
	Flags: None
	Line Number: 296
*/
function function_7ce5f558()
{
	self endon("hash_4b450298");
	self notify("hash_7ce5f558");
	self endon("hash_7ce5f558");
	self thread function_d837664d();
	self.var_8d60e13f = 0;
	while(1)
	{
		self waittill("hash_cd8ae4a0");
		while(!self IsOnGround())
		{
			if(self.jumpTime >= 0.35 && !self IsOnGround() && self StanceButtonPressed() && self.var_8d60e13f == 1 && self.var_ec9b0fb8 > 0)
			{
				vel = self getvelocity();
				self SetVelocity(vel - VectorScale((0, 0, 1), 500));
				self.var_ec9b0fb8 = self.var_ec9b0fb8 - 1;
				if(self.var_ec9b0fb8 > 0)
				{
					self thread namespace_4b6e359c::function_75aa16e4("specialty_bull_ice", "bull_ice_blast", "Meter", Int(self.var_ec9b0fb8 / 25 * 100));
				}
				else
				{
					self thread namespace_4b6e359c::function_75aa16e4("specialty_bull_ice", "bull_ice_blast", "Meter", Int(1));
				}
				self waittill("jump_end");
				Earthquake(0.25, 3, self.origin, 50);
				zombies = util::get_array_of_closest(self.origin, GetAISpeciesArray("axis", "all"), undefined, undefined, level.var_7953cdfc);
				if(self namespace_851dc78f::function_b690a849("specialty_bull_ice"))
				{
					zombies = util::get_array_of_closest(self.origin, GetAISpeciesArray("axis", "all"), undefined, undefined, level.var_7953cdfc * 1.5);
				}
				foreach(zombie in zombies)
				{
					if(!zombie.var_11dbc194 && zombie.archetype === "zombie")
					{
						zombie.var_497a702b = 1;
						zombie thread function_6854314e();
						zombie thread function_2f7defdc();
						zombie thread function_528d0b96();
					}
				}
				rand = randomIntRange(0, 3);
				playsoundatposition("slam_ice_impact_0" + rand, self.origin);
				wait(0.05);
				self SetStance("stand");
			}
			wait(0.05);
		}
		wait(0.05);
	}
}

/*
	Name: function_d837664d
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x1150
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 359
*/
function function_d837664d()
{
	self endon("hash_4b450298");
	while(1)
	{
		level waittill("between_round_over");
		self thread namespace_4b6e359c::function_75aa16e4("specialty_bull_ice", "bull_ice_blast", "Meter", Int(100));
		self.var_ec9b0fb8 = 25;
	}
	return;
	continue;
}

/*
	Name: function_6854314e
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x11D0
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 382
*/
function function_6854314e()
{
	self endon("death");
	self.var_11dbc194 = 1;
	rand = randomIntRange(0, 3);
	playsoundatposition("slam_ice_freeze_0" + rand, self.origin);
	FX = spawn("script_model", self.origin + VectorScale((0, 0, 1), 35));
	FX SetModel("cp_final_snow_chunk_03");
	self namespace_851dc78f::function_4621bbdd("actor", "frozen_zombie_test", 1);
	FX thread function_92d25cb9(self);
	FX LinkTo(self);
	self.slam_fx = FX;
	while(self.var_497a702b)
	{
		self.var_988ea0d8 = 1;
		self ASMSetAnimationRate(0.1);
		self setMoveSpeedScale(0);
		wait(0.05);
	}
	self namespace_851dc78f::function_4621bbdd("actor", "frozen_zombie_test", 0);
	self ASMSetAnimationRate(1);
	self setMoveSpeedScale(1);
	self.var_11dbc194 = 0;
}

/*
	Name: function_92d25cb9
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x13B8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 417
*/
function function_92d25cb9(zomb)
{
	zomb waittill("death");
	self delete();
}

/*
	Name: function_2f7defdc
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x13F0
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 433
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
	rand = randomIntRange(0, 3);
	playsoundatposition("slam_ice_shatter_0" + rand, self.origin);
	if(isdefined(self.var_599e2fb8))
	{
		self.var_599e2fb8 delete();
	}
}

/*
	Name: function_229dc750
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x14E8
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 461
*/
function function_229dc750()
{
	var_fdeab6bc = "" + self.origin[0];
	var_fdeab6bc = var_fdeab6bc + "*" + self.origin[1];
	var_fdeab6bc = var_fdeab6bc + "*" + self.origin[2];
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] util::setClientSysState("setPerkOverlayStyle", "slam_ice_impact|" + var_fdeab6bc, players[i]);
	}
	block = spawn("script_model", self.origin + VectorScale((0, 0, 1), 35));
	block SetModel("mg_p_zombie_ice_chunk_01");
	block LinkTo(self);
	self.var_599e2fb8 = block;
}

/*
	Name: function_528d0b96
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x1650
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 487
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
	self ASMSetAnimationRate(1);
	self setMoveSpeedScale(1);
	rand = randomIntRange(0, 3);
	playsoundatposition("slam_ice_shatter_0" + rand, self.origin);
	self StartRagdoll();
	self namespace_851dc78f::function_4621bbdd("actor", "frozen_zombie_test", 0);
}

/*
	Name: function_e2da29d0
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x1770
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 514
*/
function function_e2da29d0()
{
	self endon("hash_4b450298");
	self endon("disconnect");
	self.jumpTime = 0;
	while(1)
	{
		self waittill("hash_cd8ae4a0");
		while(self JumpButtonPressed())
		{
			wait(0.05);
			self.jumpTime = self.jumpTime + 0.05;
		}
		while(!self IsOnGround())
		{
			self.jumpTime = self.jumpTime + 0.05;
			wait(0.05);
			if(self JumpButtonPressed() && !self IsOnGround() && !self.var_8d60e13f && self.jumpTime >= 0.35)
			{
				self.var_8d60e13f = 1;
				Earthquake(0.4, 0.5, self.origin, 100);
				vel = self getvelocity();
				self playsound("jetpack_boost");
				self SetVelocity(vel + VectorScale((0, 0, 1), 300));
				self waittill("jump_end");
				self.var_8d60e13f = 0;
				self.jumpTime = 0;
			}
		}
		self.jumpTime = 0;
	}
}

/*
	Name: function_75400bae
	Namespace: namespace_e8b460a
	Checksum: 0x424F4353
	Offset: 0x1958
	Size: 0xA4
	Parameters: 10
	Flags: None
	Line Number: 557
*/
function function_75400bae(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!(isdefined(self.var_8d60e13f) && self.var_8d60e13f))
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

