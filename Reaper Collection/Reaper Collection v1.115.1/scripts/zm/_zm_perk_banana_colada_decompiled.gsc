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

#namespace namespace_45211112;

/*
	Name: __init__sytem__
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0x718
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("BANANA", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0x758
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function __init__()
{
	function_1a92256e();
	return;
	~;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1a92256e
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0x778
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_banana", "customperk", 3000, &"ZM_REAP_MOD_PERK_BANANA", GetWeapon("zombie_perk_bottle_BANANA"));
	zm_perks::register_perk_precache_func("specialty_banana", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_banana", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_banana", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_banana", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_banana", "Banana Colada", "doubletap2_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_banana", &"ZM_REAP_MOD_PERK_BANANA_DB", 1000, "Banana Colada", "banana_colada");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_banana"] = 1;
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0x918
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_banana"] = spawnstruct();
	level.machine_assets["specialty_banana"].weapon = GetWeapon("zombie_perk_bottle_BANANA");
	level.machine_assets["specialty_banana"].off_model = "vending_banana_colada";
	level.machine_assets["specialty_banana"].on_model = "vending_banana_colada_on";
}

/*
	Name: function_19157aff
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0x9C0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 122
*/
function function_19157aff()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_99c1452c
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0x9D0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 138
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_banana", "banana_colada", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0xA18
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 153
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_banana_colada_jingle";
	use_trigger.script_string = "specialty_banana";
	use_trigger.script_label = "mus_perks_banana_colada_sting";
	use_trigger.target = "Banana Colada";
	perk_machine.script_string = "specialty_banana";
	perk_machine.targetname = "Banana Colada";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_banana";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0xAE0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 177
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_banana"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_banana"] = 1;
	self thread function_5c1e2e29();
}

/*
	Name: function_b4722825
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0xB78
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 206
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_banana"] = 0;
	self.var_b5c2c258["specialty_banana"] = undefined;
	self.var_d6aef449["specialty_banana"] = undefined;
}

/*
	Name: function_5c1e2e29
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0xBD8
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 223
*/
function function_5c1e2e29()
{
	self endon("hash_a1c25eea");
	while(self namespace_851dc78f::function_5f9a13b3("specialty_banana"))
	{
		if(self function_679da569())
		{
			if(!isdefined(self.var_2092cddf))
			{
				self playlocalsound("bc_slide_squish");
				self SetVelocity(self getvelocity() * 1.5);
				self thread function_2092cddf();
			}
			self thread namespace_851dc78f::function_4621bbdd("allplayers", "madgaz/banana_colada/banana_spill", 1);
			wait(0.05);
			self thread namespace_851dc78f::function_4621bbdd("allplayers", "madgaz/banana_colada/banana_spill", 0);
			wait(0.05);
			track = self.origin;
			level thread function_4978fe24(track, self);
		}
		else
		{
			wait(0.05);
		}
	}
}

/*
	Name: function_2092cddf
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0xD40
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 260
*/
function function_2092cddf()
{
	self.var_2092cddf = 1;
	while(self function_679da569())
	{
		wait(0.05);
	}
	self.var_2092cddf = undefined;
}

/*
	Name: function_f3ada661
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0xD88
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 280
*/
function function_f3ada661()
{
	angles = self getPlayerAngles();
	angles_forward = AnglesToForward(angles);
	push = VectorScale(angles_forward, 400);
	while(self function_679da569())
	{
		self SetVelocity(push);
		wait(0.05);
	}
}

/*
	Name: function_4978fe24
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0xE28
	Size: 0x118
	Parameters: 2
	Flags: None
	Line Number: 302
*/
function function_4978fe24(track, player)
{
	var_95f4a321 = GetTime() + 5000;
	while(GetTime() < var_95f4a321)
	{
		var_2d8f0b24 = GetAISpeciesArray("axis");
		for(i = 0; i < var_2d8f0b24.size; i++)
		{
			if(DistanceSquared(var_2d8f0b24[i].origin, track) < 1000 && (!(isdefined(var_2d8f0b24[i].sliding_on_goo) && var_2d8f0b24[i].sliding_on_goo)))
			{
				var_2d8f0b24[i] thread function_c4b58e65(player);
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_c5a1c808
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0xF48
	Size: 0x1A0
	Parameters: 2
	Flags: None
	Line Number: 329
*/
function function_c5a1c808(anim_to_play, player)
{
	time = getanimlength(anim_to_play);
	var_47a0dd6 = getnotetracktimes(anim_to_play, "fly_zmb_goo_fall");
	if(isdefined(var_47a0dd6[0]))
	{
		delay = var_47a0dd6[0] * time;
	}
	else
	{
		delay = time / 2;
	}
	wait(delay);
	dam = 500;
	if(self namespace_851dc78f::function_b690a849("specialty_banana"))
	{
		dam = dam + Int(dam * 0.05);
	}
	if(self.health <= 500)
	{
		self StartRagdoll();
		wait(0.1);
		self DoDamage(dam, self.origin, player, player, "none");
	}
	else
	{
		self DoDamage(dam, self.origin, player, player, "none");
	}
}

/*
	Name: function_c4b58e65
	Namespace: namespace_45211112
	Checksum: 0x424F4353
	Offset: 0x10F0
	Size: 0x326
	Parameters: 1
	Flags: None
	Line Number: 369
*/
function function_c4b58e65(player)
{
	self endon("hash_810f0438");
	if(isdefined(self.sliding_on_goo) && self.sliding_on_goo)
	{
		return;
	}
	if(isdefined(self.isdog) && self.isdog)
	{
		return;
	}
	self.sliding_on_goo = 1;
	if(isdefined(self.missingLegs) && self.missingLegs)
	{
		Int = RandomInt(2);
		if(Int)
		{
			anim_to_play = "mg_ai_zombie_crawl_slipslide_recover";
		}
		else
		{
			anim_to_play = "mg_ai_zombie_crawl_slipslide_slow";
			if(self.zombie_move_speed == "sprint" || self.zombie_move_speed == "run")
			{
				anim_to_play = "mg_ai_zombie_crawl_slipslide_fast";
			}
		}
	}
	else
	{
		Int = RandomInt(2);
		if(Int)
		{
			anim_to_play = "mg_ai_zombie_stand_slipslide_recover";
		}
		else
		{
			Int = RandomInt(2);
			if(Int)
			{
				anim_to_play = "mg_ai_zombie_slipslide_collapse";
			}
			else
			{
				Int = RandomInt(2);
				if(self.zombie_move_speed == "sprint")
				{
					if(Int)
					{
						anim_to_play = "mg_ai_zombie_sprint_slipslide_a";
					}
					else
					{
						anim_to_play = "mg_ai_zombie_sprint_slipslide";
					}
				}
				else if(self.zombie_move_speed == "run")
				{
					if(Int)
					{
						anim_to_play = "mg_ai_zombie_run_slipslide_a";
					}
					else
					{
						anim_to_play = "mg_ai_zombie_run_slipslide";
					}
				}
				else if(Int)
				{
					anim_to_play = "mg_ai_zombie_walk_slipslide_a";
				}
				else
				{
					anim_to_play = "mg_ai_zombie_walk_slipslide";
				}
			}
			end_pos = zombie_utility::getAnimEndPos(anim_to_play);
			trace_pos = playerphysicstrace(self.origin, end_pos);
			Int = RandomInt(100);
			if(Int < 25 || self.health < 500 || end_pos != trace_pos)
			{
				anim_to_play = "mg_ai_zombie_slipslide_collapse";
			}
		}
	}
	self thread function_c5a1c808(anim_to_play, player);
	self thread scene::Play(anim_to_play, self);
	wait(getanimlength(anim_to_play));
	self thread scene::stop(anim_to_play, self);
	self.sliding_on_goo = undefined;
	self.is_on_goo = undefined;
}

