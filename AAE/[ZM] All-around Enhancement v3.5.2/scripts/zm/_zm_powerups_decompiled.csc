#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\util_shared;

#namespace zm_powerups;

/*
	Name: function_f49995fe
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x400
	Size: 0x18
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec function_f49995fe()
{
	thread function_5dbd09bd();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5dbd09bd
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x420
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function function_5dbd09bd()
{
	level flagsys::wait_till("load_main_complete");
	level._effect["jugger_light"] = "zombie/fx_perk_juggernaut_zmb";
	level._effect["revive_light"] = "zombie/fx_perk_quick_revive_zmb";
	level._effect["sleight_light"] = "zombie/fx_perk_sleight_of_hand_zmb";
	level._effect["doubletap2_light"] = "zombie/fx_perk_doubletap2_zmb";
	level._effect["deadshot_light"] = "_t6/misc/fx_zombie_cola_dtap_on";
	level._effect["marathon_light"] = "zombie/fx_perk_stamin_up_zmb";
	level._effect["additionalprimaryweapon_light"] = "zombie/fx_perk_mule_kick_zmb";
	level._effect["widow_light"] = "zombie/fx_perk_widows_wine_zmb";
}

/*
	Name: init
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x530
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 57
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
	level._effect["powerup_intro"] = "custom/powerups/fx_powerup_intro_green_zmb";
	clientfield::register("scriptmover", "powerup_fx", 1, GetMinBitCountForNum(5), "int", &powerup_fx_callback, 0, 0);
}

/*
	Name: add_zombie_powerup
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x678
	Size: 0x108
	Parameters: 3
	Flags: None
	Line Number: 82
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
	Checksum: 0x424F4353
	Offset: 0x788
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 116
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
	Checksum: 0x424F4353
	Offset: 0x848
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 141
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
	Checksum: 0x424F4353
	Offset: 0x888
	Size: 0x58
	Parameters: 7
	Flags: None
	Line Number: 160
*/
function powerup_state_callback(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self notify("powerup", fieldName, newVal);
}

/*
	Name: powerup_fx_callback
	Namespace: zm_powerups
	Checksum: 0x424F4353
	Offset: 0x8E8
	Size: 0x234
	Parameters: 7
	Flags: None
	Line Number: 175
*/
function powerup_fx_callback(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	FX = undefined;
	var_2f506abd = undefined;
	switch(newVal)
	{
		case 1:
		{
			FX = level._effect["powerup_on"];
			if(isdefined(level.var_9df739a8))
			{
				var_2f506abd = level._effect["vulture_perk_powerup_drop"];
				break;
			}
		}
		case 2:
		{
			FX = level._effect["powerup_on_solo"];
			if(isdefined(level.var_9df739a8))
			{
				var_2f506abd = level._effect["vulture_perk_powerup_drop_solo"];
				break;
			}
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
		}
		case 5:
		{
			FX = level._effect["powerup_intro"];
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
	if(localClientNum == 0 && isdefined(var_2f506abd) && isdefined(level.var_9df739a8))
	{
		self thread [[level.var_9df739a8]](var_2f506abd);
	}
}

