#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_51a9689e;

/*
	Name: function_bc98876b
	Namespace: namespace_51a9689e
	Checksum: 0xD6C2C429
	Offset: 0x328
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function function_bc98876b()
{
	self endon("hash_a9a05988");
	self endon("death");
	self endon("fake_death");
	self endon("player_downed");
	while(1)
	{
		if(!isdefined(self.ignoreme) || !self.ignoreme)
		{
			self.ignoreme = 1;
		}
		wait(0.05);
	}
}

/*
	Name: function_d8d0215f
	Namespace: namespace_51a9689e
	Checksum: 0xF5F0440A
	Offset: 0x3A0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function function_d8d0215f()
{
	if(isdefined(self.zombie_blood) && self.zombie_blood)
	{
		return;
	}
	if(isdefined(self.var_1f9ae3bf) && self.var_1f9ae3bf > 0)
	{
		return;
	}
	hud = undefined;
	if(isdefined(self.perk_hud) && self.perk_hud.size > 0)
	{
		for(i = 0; i < self.perk_hud.size; i++)
		{
			if(self.perk_hud[i].perk == "specialty_vultureaid")
			{
				hud = self.perk_hud[i];
				break;
			}
		}
	}
	else if(isdefined(hud) && isdefined(hud.var_9fb7b404) && isdefined(hud.var_8e808124))
	{
		hud.var_9fb7b404.alpha = 0;
		hud.var_8e808124.alpha = 0;
	}
	self.ignoreme = 0;
	self notify("hash_a9a05988");
}

/*
	Name: function_f629dc06
	Namespace: namespace_51a9689e
	Checksum: 0xB716AF6E
	Offset: 0x4F0
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 99
*/
function function_f629dc06(string, something)
{
	if(!isdefined(level.var_ebb593e0) || level.var_ebb593e0.size < 1)
	{
		level.var_ebb593e0 = [];
	}
	if(isdefined(level.var_ebb593e0[string]))
	{
		return;
	}
	level.var_ebb593e0[string] = something;
	return;
}

/*
	Name: function_e62b7c45
	Namespace: namespace_51a9689e
	Checksum: 0xE5342A20
	Offset: 0x560
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 123
*/
function function_e62b7c45(message, return_value)
{
	if(isdefined(return_value))
	{
		return return_value;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4bf0947b
	Namespace: namespace_51a9689e
	Checksum: 0xA7D1FE5E
	Offset: 0x590
	Size: 0x1F0
	Parameters: 5
	Flags: None
	Line Number: 143
*/
function function_4bf0947b(origin, angles, spawn_flag, radius, height)
{
	if(!isdefined(origin))
	{
		origin = function_e62b7c45("WE WOULD PASS OUR ERROR MESSAGE HERE", (0, 0, 0));
	}
	if(!isdefined(angles))
	{
		angles = function_e62b7c45("WE WOULD PASS OUR ERROR MESSAGE HERE", (0, 0, 0));
	}
	if(!isdefined(spawn_flag))
	{
		spawn_flag = function_e62b7c45("WE WOULD PASS OUR ERROR MESSAGE HERE", 1);
	}
	if(!isdefined(radius))
	{
		radius = function_e62b7c45("WE WOULD PASS OUR ERROR MESSAGE HERE", 256);
	}
	if(!isdefined(height))
	{
		height = function_e62b7c45("WE WOULD PASS OUR ERROR MESSAGE HERE", 128);
	}
	trigger = spawn("trigger_radius_use", origin, spawn_flag, radius, height);
	trigger.angles = angles;
	trigger TriggerIgnoreTeam();
	trigger setvisibletoall();
	trigger SetTeamForTrigger("none");
	trigger UseTriggerRequireLookAt();
	trigger setcursorhint("HINT_NOICON");
	trigger setHintString("");
	return trigger;
}

/*
	Name: function_c8325844
	Namespace: namespace_51a9689e
	Checksum: 0x1A9D7CEE
	Offset: 0x788
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 186
*/
function function_c8325844(origin, angles)
{
	if(!isdefined(origin))
	{
		origin = function_e62b7c45("WE WOULD PASS OUR ERROR MESSAGE HERE", (0, 0, 0));
	}
	if(!isdefined(angles))
	{
		angles = function_e62b7c45("WE WOULD PASS OUR ERROR MESSAGE HERE", (0, 0, 0));
	}
	fx_ent = spawn("script_model", origin);
	fx_ent.angles = angles;
	fx_ent SetModel("tag_origin");
	return fx_ent;
}

