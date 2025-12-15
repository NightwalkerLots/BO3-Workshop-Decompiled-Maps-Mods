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
#include scripts\zm\_zm_weapons;

#namespace namespace_163c39a8;

/*
	Name: __init__sytem__
	Namespace: namespace_163c39a8
	Checksum: 0xE27BA50F
	Offset: 0x6A0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 38
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_banana_colada", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_163c39a8
	Checksum: 0xB35500B9
	Offset: 0x6E0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_74ae19cb();
	}
}

/*
	Name: function_74ae19cb
	Namespace: namespace_163c39a8
	Checksum: 0x7C87A646
	Offset: 0x718
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function function_74ae19cb()
{
	zm_perks::register_perk_basic_info("specialty_immunecounteruav", "banana_colada", 3000, "Hold ^3[{+activate}]^7 for Banana Colada [Cost: &&1]", GetWeapon("zombie_perk_bottle_banana_colada"));
	zm_perks::register_perk_precache_func("specialty_immunecounteruav", &function_853460f9);
	zm_perks::register_perk_clientfields("specialty_immunecounteruav", &function_48f3b953, &function_ffc64b08);
	zm_perks::register_perk_machine("specialty_immunecounteruav", &function_5d6b9bde);
	zm_perks::register_perk_threads("specialty_immunecounteruav", &function_cf7cbd64, &function_467b751e);
	zm_perks::register_perk_host_migration_params("specialty_immunecounteruav", "vending_banana_colada", "specialty_immunecounteruav");
	return;
}

/*
	Name: function_853460f9
	Namespace: namespace_163c39a8
	Checksum: 0x2EB10F9E
	Offset: 0x850
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function function_853460f9()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_immunecounteruav"] = "zombie/fx_perk_doubletap2_zmb";
		continue;
	}
	level._effect["specialty_immunecounteruav"] = "zombie/fx_perk_doubletap2_factory_zmb";
	level.machine_assets["specialty_immunecounteruav"] = spawnstruct();
	level.machine_assets["specialty_immunecounteruav"].weapon = GetWeapon("zombie_perk_bottle_banana_colada");
	level.machine_assets["specialty_immunecounteruav"].off_model = "vending_banana_colada";
	level.machine_assets["specialty_immunecounteruav"].on_model = "vending_banana_colada_on";
}

/*
	Name: function_48f3b953
	Namespace: namespace_163c39a8
	Checksum: 0x9ACF73B8
	Offset: 0x990
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 117
*/
function function_48f3b953()
{
}

/*
	Name: function_ffc64b08
	Namespace: namespace_163c39a8
	Checksum: 0x48CCC8ED
	Offset: 0x9A0
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 131
*/
function function_ffc64b08(state)
{
}

/*
	Name: function_5d6b9bde
	Namespace: namespace_163c39a8
	Checksum: 0x825F3506
	Offset: 0x9B8
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 145
*/
function function_5d6b9bde(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_banana_colada_jingle";
	use_trigger.script_string = "banana_colada_perk";
	use_trigger.script_label = "mus_perks_banana_colada_sting";
	use_trigger.target = "vending_banana_colada";
	perk_machine.script_string = "banana_colada_perk";
	perk_machine.targetname = "vending_banana_colada";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "banana_colada_perk";
	}
}

/*
	Name: function_cf7cbd64
	Namespace: namespace_163c39a8
	Checksum: 0xBA834901
	Offset: 0xA80
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 169
*/
function function_cf7cbd64(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_immunecounteruav", "madgaz_banana_colada");
	self notify("specialty_immunecounteruav" + "_start");
	self thread function_5c1e2e29();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_467b751e
	Namespace: namespace_163c39a8
	Checksum: 0x83A53900
	Offset: 0xB00
	Size: 0x80
	Parameters: 3
	Flags: None
	Line Number: 188
*/
function function_467b751e(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_immunecounteruav");
	self notify("specialty_immunecounteruav" + "_stop");
	self notify("perk_lost", str_perk);
	self notify("specialty_immunecounteruav" + "_stop");
}

/*
	Name: function_8c0fe686
	Namespace: namespace_163c39a8
	Checksum: 0xF096A84B
	Offset: 0xB88
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 206
*/
function function_8c0fe686()
{
	var_afd27e17 = GetEntArray("vending_banana_colada", "targetname");
	foreach(perk_machine in var_afd27e17)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "vending_banana_colada_on")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("banana_colada");
		}
	}
}

/*
	Name: function_5c1e2e29
	Namespace: namespace_163c39a8
	Checksum: 0x8797C0BE
	Offset: 0xCA0
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 229
*/
function function_5c1e2e29()
{
	self endon("hash_a1c25eea");
	while(self hasPerk("specialty_immunecounteruav"))
	{
		if(self function_679da569())
		{
			if(!isdefined(self.var_2092cddf))
			{
				self playlocalsound("bc_slide_squish");
				self thread function_f3ada661();
				self thread function_2092cddf();
			}
			playFX("_NSZ/banan_spill", self.origin + (0, 0, 1));
			track = self.origin;
			level thread function_4978fe24(track, self);
		}
		wait(0.05);
	}
}

/*
	Name: function_2092cddf
	Namespace: namespace_163c39a8
	Checksum: 0xD3C57FE6
	Offset: 0xDB0
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
	Namespace: namespace_163c39a8
	Checksum: 0xC479DE6E
	Offset: 0xDF8
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
	Namespace: namespace_163c39a8
	Checksum: 0xC17F5FFE
	Offset: 0xE98
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
	Namespace: namespace_163c39a8
	Checksum: 0xB940EDED
	Offset: 0xFB8
	Size: 0x140
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
		continue;
	}
	delay = time / 2;
	wait(delay);
	if(self.health <= 500)
	{
		self StartRagdoll();
		wait(0.1);
		self DoDamage(500, self.origin, player, player, "none");
		continue;
	}
	self DoDamage(500, self.origin, player, player, "none");
	return;
}

/*
	Name: function_c4b58e65
	Namespace: namespace_163c39a8
	Checksum: 0xDFBF53C5
	Offset: 0x1100
	Size: 0x326
	Parameters: 1
	Flags: None
	Line Number: 361
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
			anim_to_play = "ai_zombie_crawl_slipslide_recover";
			continue;
		}
		anim_to_play = "ai_zombie_crawl_slipslide_slow";
		if(self.zombie_move_speed == "sprint" || self.zombie_move_speed == "run")
		{
			anim_to_play = "ai_zombie_crawl_slipslide_fast";
			continue;
		}
	}
	Int = RandomInt(2);
	if(Int)
	{
		anim_to_play = "ai_zombie_stand_slipslide_recover";
		continue;
	}
	Int = RandomInt(2);
	if(Int)
	{
		anim_to_play = "ai_zombie_slipslide_collapse";
		continue;
	}
	Int = RandomInt(2);
	if(self.zombie_move_speed == "sprint")
	{
		if(Int)
		{
			anim_to_play = "ai_zombie_sprint_slipslide_a";
			continue;
		}
		anim_to_play = "ai_zombie_sprint_slipslide";
	}
	else if(self.zombie_move_speed == "run")
	{
		if(Int)
		{
			anim_to_play = "ai_zombie_run_slipslide_a";
			continue;
		}
		anim_to_play = "ai_zombie_run_slipslide";
	}
	else if(Int)
	{
		anim_to_play = "ai_zombie_walk_slipslide_a";
		continue;
	}
	anim_to_play = "ai_zombie_walk_slipslide";
	end_pos = zombie_utility::getAnimEndPos(anim_to_play);
	trace_pos = playerphysicstrace(self.origin, end_pos);
	Int = RandomInt(100);
	if(Int < 25 || self.health < 500 || end_pos != trace_pos)
	{
		anim_to_play = "ai_zombie_slipslide_collapse";
	}
	self thread function_c5a1c808(anim_to_play, player);
	self thread scene::Play(anim_to_play, self);
	wait(getanimlength(anim_to_play));
	self thread scene::stop(anim_to_play, self);
	self.sliding_on_goo = undefined;
	self.is_on_goo = undefined;
}

