#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\damagefeedback_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;

#namespace drown;

/*
	Name: __init__sytem__
	Namespace: drown
	Checksum: 0x6032C4A6
	Offset: 0x1E0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec __init__sytem__()
{
	system::register("drown", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: drown
	Checksum: 0x12B4E1C3
	Offset: 0x220
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	callback::on_spawned(&on_player_spawned);
	level.DROWN_DAMAGE = GetDvarFloat("player_swimDamage");
	level.drown_damage_interval = GetDvarFloat("player_swimDamagerInterval") * 1000;
	level.drown_damage_after_time = GetDvarFloat("player_swimTime") * 1000;
	level.drown_pre_damage_stage_time = 2000;
	if(!isdefined(level.vsmgr_prio_overlay_drown_blur))
	{
		level.vsmgr_prio_overlay_drown_blur = 10;
	}
	visionset_mgr::register_info("overlay", "drown_blur", 1, level.vsmgr_prio_overlay_drown_blur, 1, 1, &visionset_mgr::ramp_in_out_thread_per_player, 1);
	clientfield::register("toplayer", "drown_stage", 1, 3, "int");
}

/*
	Name: activate_player_health_visionset
	Namespace: drown
	Checksum: 0x66E872A2
	Offset: 0x358
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function activate_player_health_visionset()
{
	self deactivate_player_health_visionset();
	if(!self.drown_vision_set)
	{
		visionset_mgr::activate("overlay", "drown_blur", self, 0.1, 0.25, 0.1);
		self.drown_vision_set = 1;
	}
}

/*
	Name: deactivate_player_health_visionset
	Namespace: drown
	Checksum: 0xD163290A
	Offset: 0x3C8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function deactivate_player_health_visionset()
{
	if(!isdefined(self.drown_vision_set) || self.drown_vision_set)
	{
		visionset_mgr::deactivate("overlay", "drown_blur", self);
		self.drown_vision_set = 0;
	}
}

/*
	Name: on_player_spawned
	Namespace: drown
	Checksum: 0xE4BF64B9
	Offset: 0x420
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 99
*/
function on_player_spawned()
{
	if(isdefined(self.var_31fb8f37) && self.var_31fb8f37)
	{
		return;
	}
	self thread watch_player_drowning();
	self thread watch_player_drown_death();
	self thread watch_game_ended();
	self deactivate_player_health_visionset();
}

/*
	Name: watch_player_drowning
	Namespace: drown
	Checksum: 0x2B1041B3
	Offset: 0x4A8
	Size: 0x268
	Parameters: 0
	Flags: None
	Line Number: 121
*/
function watch_player_drowning()
{
	self endon("hash_31fb8f37");
	self endon("disconnect");
	self endon("death");
	level endon("game_ended");
	self.lastWaterDamageTime = self getlastoutwatertime();
	self.drownStage = 0;
	self clientfield::set_to_player("drown_stage", 0);
	if(!isdefined(self.drown_damage_after_time))
	{
		self.drown_damage_after_time = level.drown_damage_after_time;
	}
	while(1)
	{
		if(self IsPlayerUnderwater() && self IsPlayerSwimming())
		{
			if(GetTime() - self.lastWaterDamageTime > self.drown_damage_after_time - level.drown_pre_damage_stage_time && self.drownStage == 0)
			{
				self.drownStage++;
				self clientfield::set_to_player("drown_stage", self.drownStage);
			}
			if(GetTime() - self.lastWaterDamageTime > self.drown_damage_after_time)
			{
				self.lastWaterDamageTime = self.lastWaterDamageTime + level.drown_damage_interval;
				drownFlags = 6;
				self DoDamage(level.DROWN_DAMAGE, self.origin, undefined, undefined, undefined, "MOD_DROWN", drownFlags);
				self activate_player_health_visionset();
				if(self.drownStage < 4)
				{
					self.drownStage++;
					self clientfield::set_to_player("drown_stage", self.drownStage);
				}
			}
		}
		else
		{
			self.drownStage = 0;
			self clientfield::set_to_player("drown_stage", 0);
			self.lastWaterDamageTime = self getlastoutwatertime();
			self deactivate_player_health_visionset();
		}
		wait(0.05);
	}
}

/*
	Name: watch_player_drown_death
	Namespace: drown
	Checksum: 0xC07922E8
	Offset: 0x718
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 177
*/
function watch_player_drown_death()
{
	self endon("hash_31fb8f37");
	self endon("disconnect");
	self endon("game_ended");
	self waittill("death");
	self.drownStage = 0;
	self clientfield::set_to_player("drown_stage", 0);
	self deactivate_player_health_visionset();
}

/*
	Name: watch_game_ended
	Namespace: drown
	Checksum: 0xA48E1D20
	Offset: 0x798
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 198
*/
function watch_game_ended()
{
	self endon("hash_31fb8f37");
	self endon("disconnect");
	self endon("death");
	level waittill("game_ended");
	self.drownStage = 0;
	self clientfield::set_to_player("drown_stage", 0);
	self deactivate_player_health_visionset();
}

/*
	Name: is_player_drowning
	Namespace: drown
	Checksum: 0xAFF8D121
	Offset: 0x818
	Size: 0x5A
	Parameters: 0
	Flags: None
	Line Number: 219
*/
function is_player_drowning()
{
	if(isdefined(self.var_31fb8f37) && self.var_31fb8f37)
	{
		return 0;
	}
	drowning = 1;
	if(!isdefined(self.drownStage) || self.drownStage == 0)
	{
		drowning = 0;
	}
	return drowning;
}

