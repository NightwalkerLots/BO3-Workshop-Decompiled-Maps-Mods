#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\sound_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\vk_script\_zm_vk_general;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_ffc7e75;

/*
	Name: init
	Namespace: namespace_ffc7e75
	Checksum: 0x9D1E8648
	Offset: 0x4B8
	Size: 0x98
	Parameters: 0
	Flags: AutoExec
	Line Number: 37
*/
function autoexec init()
{
	clientfield::register("toplayer", "flashlight_fx_view", 1, 4, "int");
	clientfield::register("allplayers", "flashlight_fx_world", 1, 4, "int");
	callback::on_connect(&on_player_connect);
	thread function_ef0ec4a7();
}

/*
	Name: on_player_connect
	Namespace: namespace_ffc7e75
	Checksum: 0x63E7837A
	Offset: 0x558
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function on_player_connect()
{
	self thread function_b148a468();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b148a468
	Namespace: namespace_ffc7e75
	Checksum: 0x255F3FE2
	Offset: 0x580
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function function_b148a468()
{
	self.var_7d0a69b8 = 0;
	level.var_15a04fcb = 1;
	self thread function_2d2035cf();
	self thread function_df0886e5();
}

/*
	Name: function_df0886e5
	Namespace: namespace_ffc7e75
	Checksum: 0xF5D91B60
	Offset: 0x5D8
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function function_df0886e5()
{
	while(1)
	{
		if(self.var_7d0a69b8 && level.var_15a04fcb)
		{
			if(!self.flashlight_enabled)
			{
				self thread function_c681d6b5("ON");
			}
			if(self IsSwitchingWeapons() || self IsThrowingGrenade())
			{
				self thread function_c681d6b5("OFF");
				while(1)
				{
					if(self IsSwitchingWeapons() || self IsThrowingGrenade())
					{
						wait(0.1);
						continue;
						break;
					}
				}
				continue;
			}
		}
		self thread function_c681d6b5("OFF");
		wait(0.1);
	}
}

/*
	Name: function_2d2035cf
	Namespace: namespace_ffc7e75
	Checksum: 0x850E142F
	Offset: 0x6F8
	Size: 0x300
	Parameters: 0
	Flags: None
	Line Number: 130
*/
function function_2d2035cf()
{
	level waittill("hash_f938585a");
	var_90d5bab6 = GetEntArray("darkzone", "targetname");
	foreach(var_dae8496f in var_90d5bab6)
	{
		var_dae8496f setHintString("");
		var_dae8496f setcursorhint("HINT_NOICON");
	}
	while(1)
	{
		foreach(var_dae8496f in var_90d5bab6)
		{
			if(self istouching(var_dae8496f))
			{
				if(var_dae8496f.script_string == "power")
				{
					if(!level.var_87833bef)
					{
						self.var_2a9e5bc0 = var_dae8496f.var_ce5009e;
						self.var_7d0a69b8 = 1;
						function_62ecb19e("^3Touching Power DarkZone ^7ON");
						while(self istouching(var_dae8496f) && !level.var_87833bef)
						{
							wait(0.05);
						}
						continue;
					}
					self.var_7d0a69b8 = 0;
					function_62ecb19e("^3Touching Power DarkZone ^7OFF");
					continue;
				}
				self.var_2a9e5bc0 = var_dae8496f.var_ce5009e;
				self.var_7d0a69b8 = 1;
				function_62ecb19e("^1Touching DarkZone");
				while(self istouching(var_dae8496f))
				{
					wait(0.05);
				}
				continue;
			}
			self.var_7d0a69b8 = 0;
			function_62ecb19e("^2Not Touching DarkZone");
			wait(0.05);
		}
		delay = randomIntRange(2, 15) / 10;
		wait(delay);
	}
}

/*
	Name: function_c681d6b5
	Namespace: namespace_ffc7e75
	Checksum: 0x992CFE18
	Offset: 0xA00
	Size: 0x218
	Parameters: 1
	Flags: None
	Line Number: 190
*/
function function_c681d6b5(state)
{
	if(!isdefined(state))
	{
	}
	else if(state == "ON")
	{
		if(self.var_2a9e5bc0 == "low")
		{
			function_62ecb19e("^5Flashlight ^4On ^7(Low)", 0);
			self clientfield::set_to_player("flashlight_fx_view", 3);
			self clientfield::set("flashlight_fx_world", 3);
		}
		else if(self.var_2a9e5bc0 == "medium")
		{
			function_62ecb19e("^5Flashlight ^4On ^7(Medium)", 0);
			self clientfield::set_to_player("flashlight_fx_view", 2);
			self clientfield::set("flashlight_fx_world", 2);
		}
		else if(self.var_2a9e5bc0 == "high" || !isdefined(self.var_2a9e5bc0))
		{
			function_62ecb19e("^5Flashlight ^4On ^7(High)", 0);
			self clientfield::set_to_player("flashlight_fx_view", 1);
			self clientfield::set("flashlight_fx_world", 1);
		}
		self.flashlight_enabled = 1;
	}
	else if(state == "OFF")
	{
		function_62ecb19e("^5Flashlight ^3Off", 0);
		self clientfield::set_to_player("flashlight_fx_view", 0);
		self clientfield::set("flashlight_fx_world", 0);
		self.flashlight_enabled = 0;
		continue;
	}
}

/*
	Name: function_ef0ec4a7
	Namespace: namespace_ffc7e75
	Checksum: 0xF5AA8ABF
	Offset: 0xC20
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 237
*/
function function_ef0ec4a7()
{
	level waittill("hash_f938585a");
	modvar("vk_devprint_flashlight", "0");
	SetDvar("vk_devprint_flashlight", 0);
}

/*
	Name: function_62ecb19e
	Namespace: namespace_ffc7e75
	Checksum: 0x19A1ED1B
	Offset: 0xC78
	Size: 0x84
	Parameters: 2
	Flags: None
	Line Number: 254
*/
function function_62ecb19e(print, center)
{
	if(!isdefined(center))
	{
		center = 1;
	}
	if(GetDvarInt("vk_devprint_flashlight") != 0)
	{
		if(center)
		{
			IPrintLnBold(print);
			continue;
		}
		iprintln(print);
	}
}

