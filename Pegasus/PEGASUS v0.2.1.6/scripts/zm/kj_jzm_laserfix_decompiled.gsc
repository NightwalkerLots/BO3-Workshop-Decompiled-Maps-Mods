#include scripts\codescripts\struct;
#include scripts\shared\_burnplayer;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
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
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_42c9cc4b;

/*
	Name: function_451c103c
	Namespace: namespace_42c9cc4b
	Checksum: 0x436638FE
	Offset: 0x4F8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function function_451c103c()
{
	if(self.var_1c43abc3 >= 100 || self.var_9d6730be >= 10)
	{
		self.var_397ff547 = 1;
		self clientfield::set_to_player("red_laser_fx_view", 1);
		self clientfield::set("red_laser_fx_world", 1);
		wait(0.25);
		self thread function_7348b0dc();
		wait(0.05);
		self thread function_5ec36147();
		wait(0.05);
		self thread function_2da0093d();
	}
}

/*
	Name: function_7348b0dc
	Namespace: namespace_42c9cc4b
	Checksum: 0x57261A85
	Offset: 0x5D8
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 74
*/
function function_7348b0dc()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("grenade_fire", grenade, weapon);
		if(isdefined(self.var_397ff547) && self.var_397ff547)
		{
			self clientfield::set_to_player("red_laser_fx_view", 0);
			self clientfield::set("red_laser_fx_world", 0);
			self waittill("weapon_change_complete");
			self clientfield::set("red_laser_fx_world", 1);
			self clientfield::set_to_player("red_laser_fx_view", 1);
		}
	}
}

/*
	Name: function_5ec36147
	Namespace: namespace_42c9cc4b
	Checksum: 0xC9886B02
	Offset: 0x6C8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 102
*/
function function_5ec36147()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("perk_purchased", str_perk);
		if(isdefined(self.var_397ff547) && self.var_397ff547)
		{
			self clientfield::set_to_player("red_laser_fx_view", 0);
			self clientfield::set("red_laser_fx_world", 0);
			self waittill("weapon_change_complete");
			self clientfield::set("red_laser_fx_world", 1);
			self clientfield::set_to_player("red_laser_fx_view", 1);
		}
	}
}

/*
	Name: function_2da0093d
	Namespace: namespace_42c9cc4b
	Checksum: 0xEA5C88B2
	Offset: 0x7B0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 130
*/
function function_2da0093d()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("weapon_change", weapon);
		if(weapon.name == "zombie_bgb_grab" || weapon.name == "zombie_bgb_use")
		{
			if(isdefined(self.var_397ff547) && self.var_397ff547)
			{
				self function_d4bcd695();
			}
			self function_e13bdb26();
		}
		else if(isdefined(level.weaponReviveTool) && weapon == level.weaponReviveTool)
		{
			if(isdefined(self.var_397ff547) && self.var_397ff547)
			{
				self function_d4bcd695();
			}
		}
	}
}

/*
	Name: function_d4bcd695
	Namespace: namespace_42c9cc4b
	Checksum: 0x90F562A3
	Offset: 0x8B0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 165
*/
function function_d4bcd695()
{
	self clientfield::set_to_player("red_laser_fx_view", 0);
	self clientfield::set("red_laser_fx_world", 0);
	self waittill("weapon_change_complete");
	self clientfield::set("red_laser_fx_world", 1);
	self clientfield::set_to_player("red_laser_fx_view", 1);
	return;
}

/*
	Name: function_e13bdb26
	Namespace: namespace_42c9cc4b
	Checksum: 0xC71DE28A
	Offset: 0x950
	Size: 0xA2
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function function_e13bdb26()
{
	if(!isdefined(self.var_4eb23f86))
	{
		self LUINotifyEvent(&"score_event", 2, &"Purchase", 125);
	}
	if(isdefined(self.var_b93089b6) && isdefined(self.var_fdb8642e))
	{
		self.var_b93089b6 = self.var_b93089b6 + 125;
		self.var_fdb8642e = self.var_fdb8642e + 125;
	}
	self notify("hash_d21c96ae");
	wait(0.75);
	self notify("hash_214f0d50");
}

