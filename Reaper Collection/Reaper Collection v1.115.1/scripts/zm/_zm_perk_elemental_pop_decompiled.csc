#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_599fec44;

/*
	Name: __init__sytem__
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x250
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("ELEMENTAL_POP", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x290
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_elementalpop", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_elementalpop", "zombie/fx_perk_quick_revive_zmb");
	zm_perks::register_perk_init_thread("specialty_elementalpop", &function_d820cf1a);
	if(!isdefined(level.var_67450254))
	{
		level.var_67450254 = [];
	}
	level.var_67450254["elemental_pop_firework"] = &function_3ad4e448;
}

/*
	Name: function_d820cf1a
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x358
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["cz_zombie_vending_elemental_pop"] = "specialty_elementalpop";
			level.var_9438a32d["cz_zombie_vending_elemental_pop_off"] = "specialty_elementalpop";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_elementalpop"]))
			{
				level._effect["vulture_waypoint_" + "specialty_elementalpop"] = "vulture_fx/vulture_waypoint_" + "specialty_elementalpop";
			}
		}
		level._effect["elemental_pop_player"] = "reaps_cz_elemental_pop/elemental_pop_player_activate";
		level._effect["elemental_pop_machine_on"] = "zombie/fx_perk_quick_revive_zmb";
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x450
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 82
*/
function function_124e3889()
{
	clientfield::register("toplayer", "player_elemental_pop", 1, 1, "int", &function_e320e3ac, 0, 1);
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x4A8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function function_75dd2cd4()
{
}

/*
	Name: function_e320e3ac
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x4B8
	Size: 0x170
	Parameters: 7
	Flags: None
	Line Number: 111
*/
function function_e320e3ac(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(!self isLocalPlayer() || IsSpectating(localClientNum, 0) || (isdefined(level.localPlayers[localClientNum]) && self GetEntityNumber() != level.localPlayers[localClientNum] GetEntityNumber()))
	{
		return;
	}
	if(isdefined(self.var_704c0df9))
	{
		stopfx(localClientNum, self.var_704c0df9);
	}
	if(newVal == 1)
	{
		self.var_704c0df9 = PlayFXOnTag(localClientNum, level._effect["elemental_pop_player"], self, "j_neck");
	}
	else if(isdefined(self.var_704c0df9))
	{
		stopfx(localClientNum, self.var_704c0df9);
	}
	self.var_704c0df9 = undefined;
}

/*
	Name: function_3ad4e448
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x630
	Size: 0x7E
	Parameters: 7
	Flags: None
	Line Number: 142
*/
function function_3ad4e448(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
	}
	else if(isdefined(self.var_3ad4e448))
	{
		stopfx(localClientNum, self.var_3ad4e448);
		self.var_3ad4e448 = undefined;
	}
}

