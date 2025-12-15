#include scripts\codescripts\struct;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_weapons;

#namespace zm_utility;

/*
	Name: ignore_triggers
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x120
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 17
*/
function ignore_triggers(timer)
{
	self endon("death");
	self.ignoreTriggers = 1;
	if(isdefined(timer))
	{
		wait(timer);
	}
	else
	{
		wait(0.5);
	}
	self.ignoreTriggers = 0;
}

/*
	Name: is_encounter
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x178
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function is_encounter()
{
	return 0;
}

/*
	Name: round_up_to_ten
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x188
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 57
*/
function round_up_to_ten(score)
{
	new_score = score - score % 10;
	if(new_score < score)
	{
		new_score = new_score + 10;
	}
	return new_score;
}

/*
	Name: round_up_score
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x1E0
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 77
*/
function round_up_score(score, value)
{
	score = Int(score);
	new_score = score - score % value;
	if(new_score < score)
	{
		new_score = new_score + value;
	}
	return new_score;
}

/*
	Name: halve_score
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x258
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 98
*/
function halve_score(n_score)
{
	n_score = n_score / 2;
	n_score = round_up_score(n_score, 10);
	return n_score;
}

/*
	Name: spawn_weapon_model
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x2A0
	Size: 0xF0
	Parameters: 6
	Flags: None
	Line Number: 115
*/
function spawn_weapon_model(localClientNum, weapon, model, origin, angles, options)
{
	if(!isdefined(model))
	{
		model = weapon.worldmodel;
	}
	weapon_model = spawn(localClientNum, origin, "script_model");
	if(isdefined(angles))
	{
		weapon_model.angles = angles;
	}
	if(isdefined(options))
	{
		weapon_model UseWeaponModel(weapon, model, options);
	}
	else
	{
		weapon_model UseWeaponModel(weapon, model);
	}
	return weapon_model;
}

/*
	Name: spawn_buildkit_weapon_model
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x398
	Size: 0xB0
	Parameters: 5
	Flags: None
	Line Number: 147
*/
function spawn_buildkit_weapon_model(localClientNum, weapon, camo, origin, angles)
{
	weapon_model = spawn(localClientNum, origin, "script_model");
	if(isdefined(angles))
	{
		weapon_model.angles = angles;
	}
	weapon_model UseBuildKitWeaponModel(localClientNum, weapon, camo, zm_weapons::is_weapon_upgraded(weapon));
	return weapon_model;
}

/*
	Name: is_Classic
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x450
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 168
*/
function is_Classic()
{
	return 1;
}

/*
	Name: is_gametype_active
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x460
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 183
*/
function is_gametype_active(a_gametypes)
{
	b_is_gametype_active = 0;
	if(!IsArray(a_gametypes))
	{
		a_gametypes = Array(a_gametypes);
	}
	for(i = 0; i < a_gametypes.size; i++)
	{
		if(GetDvarString("g_gametype") == a_gametypes[i])
		{
			b_is_gametype_active = 1;
		}
	}
	return b_is_gametype_active;
	ERROR: Bad function call
}

/*
	Name: setInventoryUIModels
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x520
	Size: 0xA8
	Parameters: 7
	Flags: None
	Line Number: 211
*/
function setInventoryUIModels(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(IsSpectating(localClientNum))
	{
		return;
	}
	SetUIModelValue(CreateUIModel(GetUIModelForController(localClientNum), "zmInventory." + fieldName), newVal);
}

/*
	Name: setSharedInventoryUIModels
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x5D0
	Size: 0x88
	Parameters: 7
	Flags: None
	Line Number: 230
*/
function setSharedInventoryUIModels(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	SetUIModelValue(CreateUIModel(GetUIModelForController(localClientNum), "zmInventory." + fieldName), newVal);
}

/*
	Name: zm_ui_infotext
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x660
	Size: 0xE0
	Parameters: 7
	Flags: None
	Line Number: 245
*/
function zm_ui_infotext(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		SetUIModelValue(CreateUIModel(GetUIModelForController(localClientNum), "zmInventory.infoText"), fieldName);
	}
	else
	{
		SetUIModelValue(CreateUIModel(GetUIModelForController(localClientNum), "zmInventory.infoText"), "");
	}
}

/*
	Name: umbra_fix_logic
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x748
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 267
*/
function umbra_fix_logic(localClientNum)
{
	self endon("disconnect");
	self endon("entityshutdown");
	umbra_settometrigger(localClientNum, "");
	while(1)
	{
		in_fix_area = 0;
		if(isdefined(level.custom_umbra_hotfix))
		{
			in_fix_area = self thread [[level.custom_umbra_hotfix]](localClientNum);
		}
		if(in_fix_area == 0)
		{
			umbra_settometrigger(localClientNum, "");
		}
		wait(0.05);
	}
}

/*
	Name: umbra_fix_trigger
	Namespace: zm_utility
	Checksum: 0x424F4353
	Offset: 0x800
	Size: 0xDC
	Parameters: 5
	Flags: None
	Line Number: 297
*/
function umbra_fix_trigger(localClientNum, pos, height, radius, umbra_name)
{
	bottomY = pos[2];
	topY = pos[2] + height;
	if(self.origin[2] > bottomY && self.origin[2] < topY)
	{
		if(Distance2DSquared(self.origin, pos) < radius * radius)
		{
			umbra_settometrigger(localClientNum, umbra_name);
			return 1;
		}
	}
	return 0;
}

