#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\util_shared;

#namespace zm_powerups;

/*
	Name: init
	Namespace: zm_powerups
	Checksum: 0x1A5D8242
	Offset: 0x1E0
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 16
*/
function init()
{
	add_zombie_powerup("insta_kill_ug", "powerup_instant_kill_ug", 1);
	level thread set_clientfield_code_callbacks();
	level._effect["powerup_on"] = "zombie/fx_powerup_on_green_zmb";
	if(isdefined(level.using_zombie_powerups) && level.using_zombie_powerups)
	{
		level._effect["powerup_on_red"] = "zombie/fx_powerup_on_red_zmb";
	}
	level._effect["powerup_on_solo"] = "zombie/fx_powerup_on_solo_zmb";
	level._effect["powerup_on_caution"] = "zombie/fx_powerup_on_caution_zmb";
	clientfield::register("scriptmover", "powerup_fx", 1, 3, "int", &powerup_fx_callback, 0, 0);
}

/*
	Name: add_zombie_powerup
	Namespace: zm_powerups
	Checksum: 0x63E40B47
	Offset: 0x2F8
	Size: 0x108
	Parameters: 3
	Flags: None
	Line Number: 40
*/
function add_zombie_powerup(powerup_name, client_field_name, clientfield_version)
{
	if(!isdefined(clientfield_version))
	{
		clientfield_version = 1;
	}
	if(isdefined(level.zombie_include_powerups) && !isdefined(level.zombie_include_powerups[powerup_name]))
	{
		return;
	}
	struct = spawnstruct();
	if(!isdefined(level.zombie_powerups))
	{
		level.zombie_powerups = [];
	}
	struct.powerup_name = powerup_name;
	level.zombie_powerups[powerup_name] = struct;
	if(isdefined(client_field_name))
	{
		clientfield::register("toplayer", client_field_name, clientfield_version, 2, "int", &powerup_state_callback, 0, 1);
		struct.client_field_name = client_field_name;
	}
}

/*
	Name: set_clientfield_code_callbacks
	Namespace: zm_powerups
	Checksum: 0xAB103611
	Offset: 0x408
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 74
*/
function set_clientfield_code_callbacks()
{
	wait(0.1);
	powerup_keys = getArrayKeys(level.zombie_powerups);
	powerup_clientfield_name = undefined;
	for(powerup_key_index = 0; powerup_key_index < powerup_keys.size; powerup_key_index++)
	{
		powerup_clientfield_name = level.zombie_powerups[powerup_keys[powerup_key_index]].client_field_name;
		if(isdefined(powerup_clientfield_name))
		{
			SetupClientFieldCodeCallbacks("toplayer", 1, powerup_clientfield_name);
		}
	}
}

/*
	Name: include_zombie_powerup
	Namespace: zm_powerups
	Checksum: 0x82D27478
	Offset: 0x4C8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 99
*/
function include_zombie_powerup(powerup_name)
{
	if(!isdefined(level.zombie_include_powerups))
	{
		level.zombie_include_powerups = [];
	}
	level.zombie_include_powerups[powerup_name] = 1;
}

/*
	Name: powerup_state_callback
	Namespace: zm_powerups
	Checksum: 0xC6B873F7
	Offset: 0x508
	Size: 0x58
	Parameters: 7
	Flags: None
	Line Number: 118
*/
function powerup_state_callback(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self notify("powerup", fieldName, newVal);
}

/*
	Name: powerup_fx_callback
	Namespace: zm_powerups
	Checksum: 0x94B07DC7
	Offset: 0x568
	Size: 0x17C
	Parameters: 7
	Flags: None
	Line Number: 133
*/
function powerup_fx_callback(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	switch(newVal)
	{
		case 1:
		{
			FX = level._effect["powerup_on"];
			break;
		}
		case 2:
		{
			FX = level._effect["powerup_on_solo"];
			break;
		}
		case 3:
		{
			FX = level._effect["powerup_on_red"];
			break;
		}
		case 4:
		{
			FX = level._effect["powerup_on_caution"];
			break;
			return;
		}
		default
		{
		}
	}
	if(!isdefined(FX))
	{
		return;
	}
	self util::waittill_dobj(localClientNum);
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.FX))
	{
		stopfx(localClientNum, self.FX);
	}
	self.FX = PlayFXOnTag(localClientNum, FX, self, "tag_origin");
}

