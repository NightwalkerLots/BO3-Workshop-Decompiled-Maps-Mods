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
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_c1c38b58;

/*
	Name: function_9d7231f9
	Namespace: namespace_c1c38b58
	Checksum: 0xCCA5351C
	Offset: 0x448
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function function_9d7231f9()
{
	if(isdefined(self.var_f642e0ea))
	{
		return;
	}
	var_f336d256 = self.maxhealth;
	self thread function_6eb7e3e5();
	var_9f99fa07 = 0;
	self thread function_cf0c47ba(var_f336d256, var_9f99fa07);
}

/*
	Name: function_cf0c47ba
	Namespace: namespace_c1c38b58
	Checksum: 0xFA87818B
	Offset: 0x4C0
	Size: 0x290
	Parameters: 2
	Flags: None
	Line Number: 64
*/
function function_cf0c47ba(var_f336d256, var_9f99fa07)
{
	self endon("disconnect");
	level endon("game_ended");
	for(;;)
	{
		wait(0.05);
		if(self.health == self.maxhealth)
		{
			var_f336d256 = self.maxhealth;
			if(isdefined(self.var_a73bce6b))
			{
				self.var_a73bce6b setValue(self.health);
			}
			var_9f99fa07 = 0;
			self SetControllerUIModelValue("pegasus_player_progress", "JZMHealth1");
			self waittill("damage");
		}
		var_ccefe119 = self.health / self.maxhealth;
		if(isdefined(var_ccefe119))
		{
			if(var_f336d256 != self.health)
			{
				var_f336d256 = self.health;
				if(isdefined(self.var_a73bce6b))
				{
					self.var_a73bce6b setValue(self.health);
				}
				if(var_ccefe119 < 0.2)
				{
					var_9f99fa07 = 0;
					self SetControllerUIModelValue("pegasus_player_progress", "JZMHealth0.15");
				}
				else if(var_ccefe119 >= 0.2 && var_ccefe119 <= 0.4 && isdefined(var_9f99fa07) && !var_9f99fa07)
				{
					var_9f99fa07 = 1;
					self SetControllerUIModelValue("pegasus_player_progress", "JZMHealth0.3");
				}
				else if(var_ccefe119 >= 0.4 && var_ccefe119 <= 0.7 && isdefined(var_9f99fa07) && !var_9f99fa07)
				{
					var_9f99fa07 = 1;
					self SetControllerUIModelValue("pegasus_player_progress", "JZMHealth0.55");
				}
				else if(var_ccefe119 > 0.7)
				{
					var_9f99fa07 = 0;
					self SetControllerUIModelValue("pegasus_player_progress", "JZMHealth0.7");
					wait(0.15);
				}
			}
		}
	}
}

/*
	Name: function_6eb7e3e5
	Namespace: namespace_c1c38b58
	Checksum: 0x2C0E55B2
	Offset: 0x758
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 128
*/
function function_6eb7e3e5()
{
	self endon("disconnect");
	level endon("game_ended");
	for(;;)
	{
		self waittill("perk_purchased", str_perk);
		wait(0.1);
		if(str_perk == "specialty_armorvest")
		{
			wait(5);
			if(isdefined(self.var_a73bce6b))
			{
				self.var_a73bce6b setValue(self.health);
			}
		}
	}
}

