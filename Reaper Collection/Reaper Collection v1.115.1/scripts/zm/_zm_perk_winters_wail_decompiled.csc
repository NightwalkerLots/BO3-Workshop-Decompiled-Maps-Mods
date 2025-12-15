#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_reap_common;

#namespace namespace_64fcaf97;

/*
	Name: __init__sytem__
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x308
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("winters_wail", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x348
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_winterwail", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_winterwail", "revive_light");
	zm_perks::register_perk_init_thread("specialty_winterwail", &function_d820cf1a);
	if(!isdefined(level.var_58278879))
	{
		level.var_58278879 = [];
	}
	level.var_58278879["winters_wail_zombie"] = &function_b617d754;
	level.var_58278879["winters_wail_player"] = &function_ae0a600d;
	return;
}

/*
	Name: function_d820cf1a
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x430
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["cz_zombie_vending_winterswail"] = "specialty_winterwail";
			level.var_9438a32d["cz_zombie_vending_winterswail_off"] = "specialty_winterwail";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_winterwail"]))
			{
				level._effect["vulture_waypoint_" + "specialty_winterwail"] = "vulture_fx/vulture_waypoint_" + "specialty_winterwail";
			}
		}
		level._effect["winters_wail_zombie"] = "reaps_cz_winters_wail/winters_wail_zombie";
		level._effect["winters_wail_blast"] = "reaps_cz_winters_wail/winters_wail_blast";
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x528
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 88
*/
function function_124e3889()
{
	clientfield::register("clientuimodel", "winters_wail_blast", 1, 1, "int", &function_d122c04, 0, 1);
}

/*
	Name: function_b617d754
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x580
	Size: 0x1D8
	Parameters: 3
	Flags: None
	Line Number: 103
*/
function function_b617d754(localClientNum, var_959544c9, arg3)
{
	var_d6298665 = StrTok(var_959544c9, "*");
	orig = (0 + Int(var_d6298665[0]), 0 + Int(var_d6298665[1]), 0 + Int(var_d6298665[2]));
	zombie = undefined;
	dist = 100000;
	for(i = 0; i < level.var_ba91a71d.size; i++)
	{
		if(isdefined(level.var_ba91a71d[i].origin) && Distance(level.var_ba91a71d[i].origin, orig) < dist)
		{
			zombie = level.var_ba91a71d[i];
			dist = Distance(level.var_ba91a71d[i].origin, orig);
		}
	}
	if(isdefined(zombie))
	{
		zombie thread attach_model(localClientNum, 0, Int(arg3));
	}
}

/*
	Name: function_ae0a600d
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x760
	Size: 0x50
	Parameters: 3
	Flags: None
	Line Number: 133
*/
function function_ae0a600d(localClientNum, arg2, arg3)
{
	thread function_d122c04(localClientNum, 0, Int(arg2));
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x7B8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 148
*/
function function_75dd2cd4()
{
}

/*
	Name: attach_model
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x7C8
	Size: 0x70
	Parameters: 7
	Flags: None
	Line Number: 162
*/
function attach_model(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(newVal)
	{
		self thread function_ec46f689(localClientNum);
	}
	else
	{
		self notify("hash_4c358ffa");
	}
}

/*
	Name: function_ec46f689
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x840
	Size: 0x1A8
	Parameters: 1
	Flags: None
	Line Number: 184
*/
function function_ec46f689(localClientNum)
{
	self endon("hash_4c358ffa");
	self endon("death");
	self endon("entityshutdown");
	tagArray = [];
	tagArray[0] = "j_elbow_le";
	tagArray[1] = "j_elbow_ri";
	tagArray[2] = "j_knee_ri";
	tagArray[3] = "j_knee_le";
	var_712a8f74[0] = "j_wrist_ri";
	var_712a8f74[1] = "j_wrist_le";
	while(1)
	{
		tagArray = Array::randomize(tagArray);
		var_712a8f74 = Array::randomize(var_712a8f74);
		if(isdefined(self GetTagOrigin(tagArray[0])))
		{
			PlayFXOnTag(localClientNum, level._effect["winters_wail_zombie"], self, tagArray[0]);
		}
		if(isdefined(self GetTagOrigin(var_712a8f74[0])))
		{
			PlayFXOnTag(localClientNum, level._effect["winters_wail_zombie"], self, var_712a8f74[0]);
		}
		wait(0.5);
	}
}

/*
	Name: function_d122c04
	Namespace: namespace_64fcaf97
	Checksum: 0x424F4353
	Offset: 0x9F0
	Size: 0x14A
	Parameters: 7
	Flags: None
	Line Number: 222
*/
function function_d122c04(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	player = GetLocalPlayer(localClientNum);
	if(isdefined(player.var_d122c04))
	{
		stopfx(localClientNum, player.var_d122c04);
		player.var_d122c04 = undefined;
	}
	if(newVal)
	{
		if(!isdefined(player.var_d122c04))
		{
			player.var_d122c04 = PlayFXOnTag(localClientNum, level._effect["winters_wail_blast"], player, "j_spinelower");
		}
	}
	else if(isdefined(player.var_d122c04))
	{
		stopfx(localClientNum, player.var_d122c04);
		player.var_d122c04 = undefined;
	}
}

