#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace vulture;

/*
	Name: __init__sytem__
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x620
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec __init__sytem__()
{
	system::register("VULTURE", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x660
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	if(!isdefined(level.var_9438a32d))
	{
		level.var_9438a32d = [];
	}
	level.var_5a09b9cd = 1;
	zm_perks::register_perk_clientfields("specialty_vulture", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_vulture", "zombie/fx_perk_quick_revive_zmb");
	zm_perks::register_perk_init_thread("specialty_vulture", &function_d820cf1a);
	if(!(isdefined(level.var_f55ff70b) && level.var_f55ff70b))
	{
		level.zombie_eyes_clientfield_cb_additional = &function_76e07a0f;
	}
	if(!isdefined(level.var_67450254))
	{
		level.var_67450254 = [];
	}
	level.var_67450254["vulture_powerup_on"] = &function_97a4da37;
	if(!isdefined(level.var_45b93609))
	{
		level.var_45b93609 = [];
	}
	level.var_45b93609["p6_zm_perk_vulture_ammo"] = &function_515d4c9;
	level.var_45b93609["p6_zm_perk_vulture_points"] = &function_515d4c9;
	level.var_9438a32d["p6_zm_vending_vultureaid_on"] = "specialty_vulture";
	level.var_9438a32d["p6_zm_vending_vultureaid"] = "specialty_vulture";
	return;
}

/*
	Name: function_d820cf1a
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x810
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		level._effect["vulture_waypoint_perk"] = "vulture_fx/vulture_waypoint_perk";
		level._effect["vulture_waypoint_wallgun"] = "vulture_fx/vulture_waypoint_wallgun";
		level._effect["vulture_zombie_stink_dropped"] = "vulture_fx/vulture_zombie_stink_dropped";
		level._effect["vulture_waypoint_pap"] = "vulture_fx/vulture_waypoint_pap";
		level._effect["vulture_waypoint_box"] = "vulture_fx/vulture_waypoint_box";
		level._effect["vulture_powerup_on"] = "vulture_fx/vulture_powerup_on";
		level._effect["vulture_eye_blue"] = "vulture_fx/vulture_eye_blue";
		level._effect["vulture_eye_orange"] = "vulture_fx/vulture_eye_orange";
		level._effect["vulture_eye_red"] = "vulture_fx/vulture_eye_red";
		level._effect["vulture_waypoint_specialty_directionalfire"] = "vulture_fx/vulture_waypoint_perk";
		level._effect["vulture_waypoint_specialty_ffyl"] = "vulture_fx/vulture_waypoint_perk";
		level._effect["vulture_waypoint_specialty_icu"] = "vulture_fx/vulture_waypoint_perk";
		level._effect["vulture_waypoint_specialty_tactiquilla"] = "vulture_fx/vulture_waypoint_perk";
		level._effect["vulture_waypoint_specialty_milk"] = "vulture_fx/vulture_waypoint_perk";
		level._effect["vulture_waypoint_specialty_banana"] = "vulture_fx/vulture_waypoint_perk";
		level._effect["vulture_waypoint_specialty_bull_ice"] = "vulture_fx/vulture_waypoint_perk";
		level._effect["vulture_waypoint_specialty_crusade"] = "vulture_fx/vulture_waypoint_perk";
		level._effect["vulture_waypoint_specialty_moonshine"] = "vulture_fx/vulture_waypoint_perk";
	}
}

/*
	Name: function_124e3889
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xA30
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 110
*/
function function_124e3889()
{
	clientfield::register("zbarrier", "vulture_aid_magicbox", 1, 1, "int", &function_6dbb1bb2, 0, 0);
	clientfield::register("zbarrier", "vulture_aid_pap", 1, 1, "int", &function_ff45621d, 0, 0);
	clientfield::register("clientuimodel", "vulture_aid_vision", 1, 1, "int", &function_90be98a7, 0, 1);
	clientfield::register("actor", "vulture_perk_stink", 1, 1, "int", &function_d3e8729e, 0, 0);
	clientfield::register("world", "vulture_reset", 1, 1, "int", &function_4f78b238, 0, 1);
}

/*
	Name: function_75dd2cd4
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xBA8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 129
*/
function function_75dd2cd4()
{
}

/*
	Name: function_4f78b238
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xBB8
	Size: 0x50
	Parameters: 7
	Flags: None
	Line Number: 143
*/
function function_4f78b238(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	level notify("hash_4f78b238");
}

/*
	Name: function_b03d6c2f
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xC10
	Size: 0xB0
	Parameters: 7
	Flags: None
	Line Number: 158
*/
function function_b03d6c2f(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self.var_b03d6c2f = PlayFXOnTag(localClientNum, "vulture_fx/vulture_powerup_on_small", self, "tag_origin");
	}
	else if(isdefined(self.var_b03d6c2f))
	{
		stopfx(localClientNum, self.var_b03d6c2f);
		self.var_b03d6c2f = undefined;
		return;
	}
}

/*
	Name: function_515d4c9
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xCC8
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 182
*/
function function_515d4c9()
{
	players = GetLocalPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(function_8a7e2e9e(i) && !isdefined(self.var_b03d6c2f))
		{
			self.var_b03d6c2f = PlayFXOnTag(i, "vulture_fx/vulture_powerup_on_small", self, "tag_origin");
			continue;
		}
		if(!function_8a7e2e9e(i) && isdefined(self.var_b03d6c2f))
		{
			stopfx(i, self.var_b03d6c2f);
			self.var_b03d6c2f = undefined;
		}
	}
}

/*
	Name: function_97a4da37
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xDC0
	Size: 0xB0
	Parameters: 7
	Flags: None
	Line Number: 210
*/
function function_97a4da37(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self.var_97a4da37 = PlayFXOnTag(localClientNum, "vulture_fx/vulture_powerup_on", self, "tag_origin");
	}
	else if(isdefined(self.var_97a4da37))
	{
		stopfx(localClientNum, self.var_97a4da37);
		self.var_97a4da37 = undefined;
	}
}

/*
	Name: function_d3e8729e
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0xE78
	Size: 0x190
	Parameters: 7
	Flags: None
	Line Number: 233
*/
function function_d3e8729e(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(newVal)
	{
		self endon("death");
		self endon("hash_f50d0a1d");
		self endon("entityshutdown");
		while(isdefined(self))
		{
			if(function_8a7e2e9e(localClientNum) && !isdefined(self.var_d3e8729e))
			{
				self.var_d3e8729e = PlayFXOnTag(localClientNum, level._effect["vulture_zombie_stink_dropped"], self, "tag_origin");
			}
			else if(!function_8a7e2e9e(localClientNum) && isdefined(self.var_d3e8729e))
			{
				stopfx(localClientNum, self.var_d3e8729e);
				self.var_d3e8729e = undefined;
			}
			WaitRealTime(1.5);
		}
	}
	else
	{
		self notify("hash_f50d0a1d");
		if(isdefined(self.var_d3e8729e))
		{
			deletefx(localClientNum, self.var_d3e8729e, 1);
		}
		level thread function_bec78d3c(localClientNum, self.origin);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_bec78d3c
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1010
	Size: 0xE0
	Parameters: 2
	Flags: None
	Line Number: 277
*/
function function_bec78d3c(localClientNum, orig)
{
	fxObj = spawn(localClientNum, orig, "script_model");
	fxObj SetModel("tag_origin");
	var_d3e8729e = PlayFXOnTag(localClientNum, level._effect["vulture_zombie_stink_dropped"], fxObj, "tag_origin");
	WaitRealTime(12);
	stopfx(localClientNum, var_d3e8729e);
	fxObj delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_76e07a0f
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x10F8
	Size: 0x90
	Parameters: 7
	Flags: None
	Line Number: 299
*/
function function_76e07a0f(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(newVal)
	{
		self thread function_71ccb387(localClientNum);
	}
	else if(isdefined(self.var_b25382b3))
	{
		deletefx(localClientNum, self.var_b25382b3, 1);
	}
}

/*
	Name: function_71ccb387
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1190
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 321
*/
function function_71ccb387(localClientNum)
{
	self endon("death");
	self endon("entityshutdown");
	if(!isalive(self))
	{
		return;
	}
	FX = "vulture_fx/vulture_eye_orange";
	var_2cb077a8 = level._effect["eye_glow"];
	if(isdefined(level._override_eye_fx))
	{
		var_2cb077a8 = level._override_eye_fx;
	}
	if(IsSubStr(var_2cb077a8, "red"))
	{
		FX = "vulture_fx/vulture_eye_red";
	}
	if(IsSubStr(var_2cb077a8, "blue") || (isdefined(self.special_eyes) && self.special_eyes))
	{
		FX = "vulture_fx/vulture_eye_blue";
	}
	if(function_8a7e2e9e(localClientNum))
	{
		self.var_b25382b3 = PlayFXOnTag(localClientNum, FX, self, "J_Eyeball_LE");
	}
	else
	{
		level waittill("hash_d1dc42a1");
		self.var_b25382b3 = PlayFXOnTag(localClientNum, FX, self, "J_Eyeball_LE");
		return;
	}
}

/*
	Name: function_8a7e2e9e
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1320
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 365
*/
function function_8a7e2e9e(localClientNum)
{
	return isdefined(level.var_8ccd1a36);
}

/*
	Name: function_90be98a7
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1340
	Size: 0x208
	Parameters: 7
	Flags: None
	Line Number: 380
*/
function function_90be98a7(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		level.var_8ccd1a36 = 1;
		if(!isdefined(level.var_9d1499e6))
		{
			level.var_9d1499e6 = 1;
			foreach(var_6e4b2835 in struct::get_array("weapon_upgrade", "targetname"))
			{
				var_6e4b2835 thread function_c06747d3(localClientNum, level._effect["vulture_waypoint_wallgun"]);
			}
			all = GetEntArray(localClientNum);
			foreach(ent in all)
			{
				if(isdefined(ent.model))
				{
					ent function_99ae532a(localClientNum);
				}
			}
		}
		level notify("hash_d1dc42a1");
	}
	else
	{
		level.var_8ccd1a36 = undefined;
		level notify("hash_bf0d7aaf");
	}
}

/*
	Name: function_99ae532a
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1550
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 420
*/
function function_99ae532a(localClientNum)
{
	a_keys = getArrayKeys(level.var_9438a32d);
	for(i = 0; i < a_keys.size; i++)
	{
		perk = level.var_9438a32d[a_keys[i]];
		machine = a_keys[i];
		if(IsSubStr(self.model, machine))
		{
			self thread function_a64d2cab(localClientNum);
			if(isdefined(self GetTagOrigin("tag_origin")))
			{
				self thread function_95f218d8(localClientNum, level._effect["vulture_waypoint_" + perk]);
				continue;
			}
			self thread function_c06747d3(localClientNum, level._effect["vulture_waypoint_" + perk]);
		}
	}
}

/*
	Name: function_a64d2cab
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x16A0
	Size: 0x150
	Parameters: 1
	Flags: None
	Line Number: 450
*/
function function_a64d2cab(localClientNum)
{
	self endon("entityshutdown");
	a_keys = getArrayKeys(level.var_9438a32d);
	while(1)
	{
		for(i = 0; i < a_keys.size; i++)
		{
			perk = level.var_9438a32d[a_keys[i]];
			machine = a_keys[i];
			if(IsSubStr(self.model, machine))
			{
				if(isdefined(self GetTagOrigin("tag_origin")))
				{
					self thread function_95f218d8(localClientNum, level._effect["vulture_waypoint_" + perk]);
					continue;
				}
				self thread function_c06747d3(localClientNum, level._effect["vulture_waypoint_" + perk]);
			}
		}
		level waittill("hash_4f78b238");
	}
}

/*
	Name: function_6dbb1bb2
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x17F8
	Size: 0xA0
	Parameters: 7
	Flags: None
	Line Number: 484
*/
function function_6dbb1bb2(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(newVal)
	{
		self thread function_95f218d8(localClientNum, level._effect["vulture_waypoint_box"]);
	}
	else if(isdefined(self.var_5d351a81))
	{
		deletefx(localClientNum, self.var_5d351a81, 1);
	}
}

/*
	Name: function_ff45621d
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x18A0
	Size: 0xA0
	Parameters: 7
	Flags: None
	Line Number: 506
*/
function function_ff45621d(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(newVal)
	{
		self thread function_95f218d8(localClientNum, level._effect["vulture_waypoint_pap"]);
	}
	else if(isdefined(self.var_5d351a81))
	{
		deletefx(localClientNum, self.var_5d351a81, 1);
	}
}

/*
	Name: function_95f218d8
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1948
	Size: 0x170
	Parameters: 2
	Flags: None
	Line Number: 528
*/
function function_95f218d8(localClientNum, var_59e1f30f)
{
	self notify("hash_95f218d8");
	self endon("hash_95f218d8");
	if(isdefined(self.var_5d351a81))
	{
		deletefx(localClientNum, self.var_5d351a81, 1);
		self.var_5d351a81 = undefined;
	}
	while(isdefined(self))
	{
		if(!isdefined(self) || !isdefined(self.origin))
		{
			return;
		}
		if(function_8a7e2e9e(localClientNum) && !isdefined(self.var_5d351a81) && isdefined(var_59e1f30f))
		{
			self.var_5d351a81 = PlayFXOnTag(localClientNum, var_59e1f30f, self, "tag_origin");
			level waittill("hash_bf0d7aaf");
			deletefx(localClientNum, self.var_5d351a81, 1);
			self.var_5d351a81 = undefined;
		}
		else if(isdefined(self.var_5d351a81))
		{
			deletefx(localClientNum, self.var_5d351a81, 1);
			self.var_5d351a81 = undefined;
		}
		level waittill("hash_d1dc42a1");
	}
}

/*
	Name: function_c06747d3
	Namespace: vulture
	Checksum: 0x424F4353
	Offset: 0x1AC0
	Size: 0x178
	Parameters: 2
	Flags: None
	Line Number: 569
*/
function function_c06747d3(localClientNum, var_59e1f30f)
{
	self notify("hash_95f218d8");
	self endon("hash_95f218d8");
	if(!isdefined(self) || !isdefined(self.origin))
	{
		return;
	}
	if(!isdefined(level.var_1436715a))
	{
		level.var_1436715a = 0;
	}
	var_36652fc4 = level.var_1436715a;
	level.var_1436715a++;
	while(isdefined(self))
	{
		if(isdefined(self.var_5d351a81))
		{
			deletefx(localClientNum, self.var_5d351a81, 1);
			self.var_5d351a81 = undefined;
		}
		if(function_8a7e2e9e(localClientNum) && !isdefined(self.var_5d351a81) && isdefined(var_59e1f30f))
		{
			self.var_5d351a81 = playFX(localClientNum, var_59e1f30f, self.origin);
		}
		else if(!function_8a7e2e9e(localClientNum) && isdefined(self.var_5d351a81))
		{
			deletefx(localClientNum, self.var_5d351a81, 1);
			self.var_5d351a81 = undefined;
		}
		WaitRealTime(1);
	}
}

