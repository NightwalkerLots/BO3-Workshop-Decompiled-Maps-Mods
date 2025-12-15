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

#namespace namespace_2e8f8ef1;

/*
	Name: __init__sytem__
	Namespace: namespace_2e8f8ef1
	Checksum: 0xBE0E89EA
	Offset: 0x5C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 39
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_madgaz_moonshine", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_2e8f8ef1
	Checksum: 0x504AE779
	Offset: 0x608
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_427eeace();
	}
}

/*
	Name: function_427eeace
	Namespace: namespace_2e8f8ef1
	Checksum: 0xB4969284
	Offset: 0x640
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_427eeace()
{
	zm_perks::register_perk_basic_info("specialty_flakjacket", "madgaz_moonshine", 2000, "Hold ^3[{+activate}]^7 for Madgaz Moonshine [Cost: &&1]", GetWeapon("zombie_perk_bottle_madgaz_moonshine"));
	zm_perks::register_perk_precache_func("specialty_flakjacket", &function_dfd28b6c);
	zm_perks::register_perk_clientfields("specialty_flakjacket", &function_17d8d336, &function_7b733347);
	zm_perks::register_perk_machine("specialty_flakjacket", &function_c7d6ce87);
	zm_perks::register_perk_threads("specialty_flakjacket", &function_a4b7097b, &function_a34ebd79);
	zm_perks::register_perk_host_migration_params("specialty_flakjacket", "vending_madgaz_moonshine", "specialty_flakjacket");
}

/*
	Name: function_dfd28b6c
	Namespace: namespace_2e8f8ef1
	Checksum: 0x578FCAA9
	Offset: 0x778
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function function_dfd28b6c()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_flakjacket"] = "zombie/fx_perk_doubletap2_zmb";
		continue;
	}
	level._effect["specialty_flakjacket"] = "zombie/fx_perk_doubletap2_factory_zmb";
	level.machine_assets["specialty_flakjacket"] = spawnstruct();
	level.machine_assets["specialty_flakjacket"].weapon = GetWeapon("zombie_perk_bottle_madgaz_moonshine");
	level.machine_assets["specialty_flakjacket"].off_model = "vending_madgaz_moonshine";
	level.machine_assets["specialty_flakjacket"].on_model = "vending_madgaz_moonshine_on";
}

/*
	Name: function_17d8d336
	Namespace: namespace_2e8f8ef1
	Checksum: 0x9ACF73B8
	Offset: 0x8B8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 117
*/
function function_17d8d336()
{
}

/*
	Name: function_7b733347
	Namespace: namespace_2e8f8ef1
	Checksum: 0xF5E346A2
	Offset: 0x8C8
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 131
*/
function function_7b733347(state)
{
}

/*
	Name: function_c7d6ce87
	Namespace: namespace_2e8f8ef1
	Checksum: 0xFC1F4638
	Offset: 0x8E0
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 145
*/
function function_c7d6ce87(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_madgaz_moonshine_jingle";
	use_trigger.script_string = "madgaz_moonshine_perk";
	use_trigger.script_label = "mus_perks_madgaz_moonshine_sting";
	use_trigger.target = "vending_madgaz_moonshine";
	perk_machine.script_string = "madgaz_moonshine_perk";
	perk_machine.targetname = "vending_madgaz_moonshine";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "madgaz_moonshine_perk";
	}
}

/*
	Name: function_a4b7097b
	Namespace: namespace_2e8f8ef1
	Checksum: 0x6570E62F
	Offset: 0x9A8
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 169
*/
function function_a4b7097b(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_flakjacket", "madgaz_moonshine");
	self notify("specialty_flakjacket" + "_start");
	self thread function_d0d77982();
	return;
}

/*
	Name: function_a34ebd79
	Namespace: namespace_2e8f8ef1
	Checksum: 0x7930A262
	Offset: 0xA28
	Size: 0x68
	Parameters: 3
	Flags: None
	Line Number: 187
*/
function function_a34ebd79(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_flakjacket");
	self notify("specialty_flakjacket" + "_stop");
	self notify("perk_lost", str_perk);
	return;
}

/*
	Name: function_27f1c361
	Namespace: namespace_2e8f8ef1
	Checksum: 0x5EC98C63
	Offset: 0xA98
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 205
*/
function function_27f1c361()
{
	// Could not fully decompile function; skipped
}

/*
	Name: function_d0d77982
	Namespace: namespace_2e8f8ef1
	Checksum: 0x3264DA3C
	Offset: 0xBB0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 220
*/
function function_d0d77982()
{
	self endon("hash_d972bd0b");
	self thread function_cad7a454();
	if(!isdefined(level.var_a9742d28))
	{
		thread function_89e7bf0d();
	}
	while(self hasPerk("specialty_flakjacket"))
	{
		while(self function_679da569())
		{
			wait(0.05);
			if(!self function_679da569())
			{
				self function_a2feb947();
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_a2feb947
	Namespace: namespace_2e8f8ef1
	Checksum: 0x87AFAB7D
	Offset: 0xC80
	Size: 0x230
	Parameters: 0
	Flags: None
	Line Number: 252
*/
function function_a2feb947()
{
	self.var_a440ec--;
	if(self.var_a440ec > 0)
	{
		self playsound("moonshine_explode");
		playFX("_NSZ/moonshine/moonshine_explode", self.origin);
		var_2d8f0b24 = GetAISpeciesArray("axis");
		var_2d8f0b24 = Array::get_all_closest(self.origin, var_2d8f0b24, undefined, undefined, 100);
		foreach(var_458203d5 in var_2d8f0b24)
		{
			if(isdefined(var_458203d5.var_2dce8d67) && var_458203d5.var_2dce8d67)
			{
				continue;
			}
			PlayFXOnTag("fire/fx_fire_barrel_30x30", var_458203d5, "j_spineupper");
			angles = var_458203d5.angles;
			angles_forward = AnglesToForward(angles);
			velocity = VectorScale(angles_forward * -1, 100);
			var_458203d5 DoDamage(var_458203d5.health + 666, self.origin, self);
			var_458203d5 StartRagdoll();
			var_458203d5 LaunchRagdoll(velocity + VectorScale((0, 0, 1), 40));
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_89e7bf0d
	Namespace: namespace_2e8f8ef1
	Checksum: 0xE5A19F51
	Offset: 0xEB8
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 290
*/
function function_89e7bf0d()
{
	level.var_a9742d28 = 1;
	while(function_468d4dee())
	{
		var_2d8f0b24 = GetAISpeciesArray("axis");
		foreach(var_458203d5 in var_2d8f0b24)
		{
			if(isdefined(var_458203d5.var_2dce8d67) && var_458203d5.var_2dce8d67)
			{
				continue;
			}
			if(!isdefined(var_458203d5.var_64b97637))
			{
				var_458203d5 thread function_e654524f();
			}
		}
		wait(5);
	}
	level.var_a9742d28 = undefined;
}

/*
	Name: function_468d4dee
	Namespace: namespace_2e8f8ef1
	Checksum: 0x8FFAF13
	Offset: 0xFE0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 322
*/
function function_468d4dee()
{
	players = GetPlayers();
	foreach(player in players)
	{
		if(player hasPerk("specialty_flakjacket"))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_e654524f
	Namespace: namespace_2e8f8ef1
	Checksum: 0x9CCD25D6
	Offset: 0x10A0
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 345
*/
function function_e654524f()
{
	self endon("death");
	self.var_64b97637 = 1;
	while(1)
	{
		self waittill("damage", damage, attacker);
		if(attacker hasPerk("specialty_flakjacket"))
		{
			chance = randomIntRange(0, 9);
			if(chance == 4 && !isdefined(self.var_383acc7a))
			{
				self thread Burn(30, attacker);
				wait(0.05);
			}
		}
	}
}

/*
	Name: Burn
	Namespace: namespace_2e8f8ef1
	Checksum: 0xA85B4AC
	Offset: 0x1178
	Size: 0x1F8
	Parameters: 2
	Flags: None
	Line Number: 374
*/
function Burn(time, attacker)
{
	self.var_383acc7a = 1;
	var_19a88814 = spawn("script_model", self GetTagOrigin("j_spineupper"));
	var_19a88814 SetModel("tag_origin");
	var_19a88814 EnableLinkTo();
	var_19a88814 LinkTo(self);
	var_19a88814 PlayLoopSound("moonshine_burning");
	PlayFXOnTag("fire/fx_fire_barrel_30x30", var_19a88814, "tag_origin");
	end_time = GetTime() + time * 1000;
	self thread damage_over_time(time, attacker);
	while(GetTime() < end_time)
	{
		if(self.health < 10)
		{
			var_19a88814 StopLoopSound(1);
			wait(0.05);
			var_19a88814 delete();
			break;
		}
		wait(0.05);
	}
	self notify("hash_b90e804");
	var_19a88814 StopLoopSound(1);
	wait(4);
	if(isdefined(var_19a88814))
	{
		var_19a88814 delete();
	}
	if(isdefined(self))
	{
		self.is_burning = undefined;
	}
}

/*
	Name: damage_over_time
	Namespace: namespace_2e8f8ef1
	Checksum: 0x82651217
	Offset: 0x1378
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 419
*/
function damage_over_time(time, attacker)
{
	self endon("hash_b90e804");
	for(i = 0; i < time; i++)
	{
		self DoDamage(25, self.origin, attacker);
		wait(1);
	}
}

/*
	Name: function_cad7a454
	Namespace: namespace_2e8f8ef1
	Checksum: 0xAE9BB496
	Offset: 0x13F8
	Size: 0x4C
	Parameters: 0
	Flags: None
	Line Number: 439
*/
function function_cad7a454()
{
	self.var_a440ec = 20;
	while(self hasPerk("specialty_flakjacket"))
	{
		level waittill("between_round_over");
		self.var_a440ec = 20;
	}
}

