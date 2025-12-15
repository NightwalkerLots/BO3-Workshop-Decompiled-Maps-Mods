#include scripts\codescripts\struct;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\flagsys_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_728c33db;

/*
	Name: __init__sytem__
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x330
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("DA_DEATH_PERCEPTION", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x370
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	level.var_1904c521 = [];
	zm_perks::register_perk_clientfields("specialty_da_death_perception", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_da_death_perception", "reaps_cz_da_machine_on_death_perception");
	zm_perks::register_perk_init_thread("specialty_da_death_perception", &function_d820cf1a);
	duplicate_render::set_dr_filter_offscreen("death_perception_zombie_dupe", 10, "death_perception_zombie_dupe", undefined, 2, "mc/mtl_c_zom_death_perception_render", 1);
	level.var_8c993a5a = 0;
	ai::add_ai_spawn_function(&function_f05b703e);
	callback::on_localplayer_spawned(&function_3e648c58);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x498
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["cz_zombie_vending_da_death_perception"] = "specialty_da_death_perception";
			level.var_9438a32d["cz_zombie_vending_da_death_perception_off"] = "specialty_da_death_perception";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_da_death_perception"]))
			{
				level._effect["vulture_waypoint_" + "specialty_da_death_perception"] = "vulture_fx/vulture_waypoint_" + "specialty_da_death_perception";
			}
		}
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x558
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function function_124e3889()
{
	clientfield::register("clientuimodel", "death_perception", 1, 2, "int", &function_a326b541, 0, 1);
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x5B0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function function_75dd2cd4()
{
}

/*
	Name: function_a326b541
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x5C0
	Size: 0x48
	Parameters: 7
	Flags: None
	Line Number: 116
*/
function function_a326b541(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	level.var_8c993a5a = newVal;
}

/*
	Name: function_3e648c58
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x610
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 131
*/
function function_3e648c58(localClientNum)
{
	self thread function_16edca10(localClientNum);
}

/*
	Name: function_16edca10
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x640
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 146
*/
function function_16edca10(localClientNum)
{
	self notify("hash_16edca10");
	self endon("hash_16edca10");
	self endon("entityshutdown");
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	self thread sensorGrenadeThink(localClientNum);
	while(isdefined(self) && isalive(self))
	{
		self oed_sitrepscan_enable(3);
		self oed_sitrepscan_setoutline(1);
		self oed_sitrepscan_setsolid(0);
		self oed_sitrepscan_setlinewidth(1.5);
		self oed_sitrepscan_setradius(1000);
		self oed_sitrepscan_setfalloff(1);
		self oed_sitrepscan_setdesat(0);
		WaitRealTime(5);
	}
	return;
}

/*
	Name: function_f05b703e
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x790
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 179
*/
function function_f05b703e(localClientNum)
{
	if(self.team != "axis")
	{
		return;
	}
	level.var_1904c521[level.var_1904c521.size] = self;
}

/*
	Name: sensorGrenadeThink
	Namespace: namespace_728c33db
	Checksum: 0x424F4353
	Offset: 0x7D0
	Size: 0x284
	Parameters: 1
	Flags: None
	Line Number: 198
*/
function sensorGrenadeThink(localClientNum)
{
	self endon("entityshutdown");
	self endon("hash_326b2104");
	self endon("death");
	self notify("sensorGrenadeThink");
	self endon("sensorGrenadeThink");
	while(1)
	{
		if(isdefined(GetLocalPlayer(localClientNum)))
		{
			playerOrigin = GetLocalPlayer(localClientNum).origin;
			level.var_1904c521 = Array::remove_undefined(level.var_1904c521);
			for(i = 0; i < level.var_1904c521.size; i++)
			{
				zomb = level.var_1904c521[i];
				if(isdefined(zomb) && isalive(zomb))
				{
					var_43424213 = zomb.origin;
					if(!isdefined(zomb.var_e997e56d))
					{
						zomb.var_e997e56d = 0;
					}
					enabled = level.var_8c993a5a == 2 && DistanceSquared(var_43424213, playerOrigin) < 1440000 || (level.var_8c993a5a == 1 && DistanceSquared(var_43424213, playerOrigin) < 640000);
					if(zomb.var_e997e56d != enabled)
					{
						zomb.var_e997e56d = enabled;
						zomb duplicate_render::update_dr_flag(localClientNum, "death_perception_zombie_dupe", enabled);
					}
				}
				if(isdefined(zomb) && !isalive(zomb))
				{
					zomb duplicate_render::update_dr_flag(localClientNum, "death_perception_zombie_dupe", 0);
				}
				WaitRealTime(0.05);
			}
		}
		WaitRealTime(0.05);
	}
}

