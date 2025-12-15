#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_powerups;

#namespace namespace_3b75c34a;

/*
	Name: __init__sytem__
	Namespace: namespace_3b75c34a
	Checksum: 0x424F4353
	Offset: 0x278
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec __init__sytem__()
{
	system::register("zm_powerup_utility", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_3b75c34a
	Checksum: 0x424F4353
	Offset: 0x2B8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	level.var_a89cb7ba = [];
	level thread function_841e6ea8();
	function_4e972a8e(&function_b54be97f);
	return;
	ERROR: Bad function call
}

/*
	Name: function_841e6ea8
	Namespace: namespace_3b75c34a
	Checksum: 0x424F4353
	Offset: 0x308
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function function_841e6ea8()
{
	wait(0.1);
	while(1)
	{
		for(i = 0; i < level.zombie_powerup_array.size; i++)
		{
			powerup = level.zombie_powerup_array[i];
			if(!isdefined(level._custom_powerups))
			{
				level._custom_powerups = [];
			}
			if(powerup == "ww_grenade" || powerup == "zombie_full_ammo" || powerup == "lose_points_team_powerup" || powerup == "lose_perk_team_powerup" || powerup == "anti_carpentr")
			{
				continue;
			}
			if(isdefined(level._custom_powerups[powerup]) && (!isdefined(level._custom_powerups[powerup].setup_powerup) || (isdefined(level._custom_powerups[powerup].setup_powerup) && level._custom_powerups[powerup].setup_powerup != &function_9485444a)))
			{
				if(isdefined(level._custom_powerups[powerup].setup_powerup))
				{
					level._custom_powerups[powerup].var_81e20439 = level._custom_powerups[powerup].setup_powerup;
				}
				level._custom_powerups[powerup].setup_powerup = &function_9485444a;
			}
		}
		wait(1);
	}
}

/*
	Name: function_4e972a8e
	Namespace: namespace_3b75c34a
	Checksum: 0x424F4353
	Offset: 0x4D0
	Size: 0xA0
	Parameters: 2
	Flags: None
	Line Number: 93
*/
function function_4e972a8e(func, var_d2401b81)
{
	if(!isdefined(level.var_5cd0e116))
	{
		level.var_5cd0e116 = [];
	}
	level.var_5cd0e116[level.var_5cd0e116.size] = func;
	if(isdefined(var_d2401b81) && var_d2401b81 == 1)
	{
		for(i = 0; i < level.var_a89cb7ba.size; i++)
		{
			level.var_a89cb7ba[i] thread [[func]]();
		}
	}
}

/*
	Name: function_20b8a0e9
	Namespace: namespace_3b75c34a
	Checksum: 0x424F4353
	Offset: 0x578
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 119
*/
function function_20b8a0e9(func)
{
	if(!isdefined(level.var_5cd0e116))
	{
		level.var_5cd0e116 = [];
	}
	ArrayRemoveValue(level.var_5cd0e116, func);
}

/*
	Name: function_9485444a
	Namespace: namespace_3b75c34a
	Checksum: 0x424F4353
	Offset: 0x5C8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 138
*/
function function_9485444a()
{
	if(!isdefined(self))
	{
		return;
	}
	self thread function_ee6b2234();
	self thread function_b3627dc9();
}

/*
	Name: function_b3627dc9
	Namespace: namespace_3b75c34a
	Checksum: 0x424F4353
	Offset: 0x610
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 158
*/
function function_b3627dc9()
{
	wait(0.7);
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(level.var_5cd0e116))
	{
		for(i = 0; i < level.var_5cd0e116.size; i++)
		{
			self thread [[level.var_5cd0e116[i]]]();
		}
	}
	self thread function_ee6b2234();
}

/*
	Name: function_ee6b2234
	Namespace: namespace_3b75c34a
	Checksum: 0x424F4353
	Offset: 0x698
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function function_ee6b2234()
{
	if(!isdefined(self))
	{
		return;
	}
	while(!isdefined(self.powerup_name))
	{
		wait(0.1);
	}
	if(isdefined(level._custom_powerups) && isdefined(level._custom_powerups[self.powerup_name].var_81e20439))
	{
		self [[level._custom_powerups[self.powerup_name].var_81e20439]]();
	}
	if(self.powerup_name != "random_weapon")
	{
		struct = level.zombie_powerups[self.powerup_name];
		self SetModel(struct.model_name);
	}
	if(isdefined(self))
	{
		if(self.powerup_name === "castle_tram_token")
		{
			fx2 = PlayFXOnTag("dlc1/castle/fx_glow_115_fuse_pickup_castle", self, "tag_origin");
		}
		else if(IsSubStr(self.powerup_name, "demonic_rune"))
		{
			fx2 = PlayFXOnTag("dlc1/castle/fx_demon_gate_rune_glow", self, "tag_origin");
		}
	}
	var_b9e1529d = self.powerup_name;
	while(isdefined(self) && var_b9e1529d != "random_weapon")
	{
		if(var_b9e1529d != self.powerup_name)
		{
			struct = level.zombie_powerups[self.powerup_name];
			self SetModel(struct.model_name);
			var_b9e1529d = self.powerup_name;
		}
		wait(0.5);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b54be97f
	Namespace: namespace_3b75c34a
	Checksum: 0x424F4353
	Offset: 0x890
	Size: 0x5C
	Parameters: 0
	Flags: None
	Line Number: 240
*/
function function_b54be97f()
{
	level.var_a89cb7ba[level.var_a89cb7ba.size] = self;
	self util::waittill_any("powerup_timedout", "powerup_grabbed", "hacked");
	ArrayRemoveValue(level.var_a89cb7ba, self);
}

