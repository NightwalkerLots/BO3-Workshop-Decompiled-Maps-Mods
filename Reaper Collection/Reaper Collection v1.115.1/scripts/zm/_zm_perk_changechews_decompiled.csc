#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_2127f613;

/*
	Name: __init__sytem__
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x368
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("CHANGECHEWS", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x3A8
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_changechews", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_changechews", "revive_light");
	zm_perks::register_perk_init_thread("specialty_changechews", &function_d820cf1a);
	if(!isdefined(level.var_58278879))
	{
		level.var_58278879 = [];
	}
	level.var_58278879["changechews_fire"] = &function_3fd6689a;
	level.var_58278879["changechews_electric"] = &function_a194418f;
	level.var_58278879["changechews_ice"] = &function_a41d0b53;
	level.var_58278879["changechews_explode"] = &function_9679993d;
	level.var_58278879["changechews_ice_zomb"] = &function_3ebd27a2;
	level.var_58278879["changechews_ice_zomb_break"] = &function_267f6c1a;
}

/*
	Name: function_d820cf1a
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x510
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["cz_zombie_vending_changechews_on"] = "specialty_changechews";
			level.var_9438a32d["cz_zombie_vending_changechews"] = "specialty_changechews";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_changechews"]))
			{
				level._effect["vulture_waypoint_" + "specialty_changechews"] = "vulture_fx/vulture_waypoint_" + "specialty_changechews";
			}
		}
		level._effect["changechews_fire"] = "reaps_cz_changechews/changechews_fire";
		level._effect["changechews_electric"] = "reaps_cz_changechews/changechews_electric";
		level._effect["changechews_explode"] = "reaps_cz_changechews/changechews_explode";
		level._effect["changechews_ice"] = "reaps_cz_changechews/changechews_ice";
		level._effect["changechews_ice_zomb"] = "reaps_cz_changechews/changechews_ice_zomb";
		level._effect["changechews_ice_zomb_break"] = "reaps_cz_changechews/changechews_ice_zomb_break";
		return;
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x678
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function function_124e3889()
{
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x688
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 108
*/
function function_75dd2cd4()
{
}

/*
	Name: function_3fd6689a
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x698
	Size: 0x50
	Parameters: 3
	Flags: None
	Line Number: 122
*/
function function_3fd6689a(localClientNum, var_959544c9, arg3)
{
	thread function_a8f832d3(localClientNum, var_959544c9, level._effect["changechews_fire"]);
}

/*
	Name: function_a194418f
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x6F0
	Size: 0x50
	Parameters: 3
	Flags: None
	Line Number: 137
*/
function function_a194418f(localClientNum, var_959544c9, arg3)
{
	thread function_a8f832d3(localClientNum, var_959544c9, level._effect["changechews_electric"]);
}

/*
	Name: function_a41d0b53
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x748
	Size: 0x50
	Parameters: 3
	Flags: None
	Line Number: 152
*/
function function_a41d0b53(localClientNum, var_959544c9, arg3)
{
	thread function_a8f832d3(localClientNum, var_959544c9, level._effect["changechews_ice"]);
}

/*
	Name: function_9679993d
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x7A0
	Size: 0x50
	Parameters: 3
	Flags: None
	Line Number: 167
*/
function function_9679993d(localClientNum, var_959544c9, arg3)
{
	thread function_a8f832d3(localClientNum, var_959544c9, level._effect["changechews_explode"]);
}

/*
	Name: function_a8f832d3
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x7F8
	Size: 0x178
	Parameters: 3
	Flags: None
	Line Number: 182
*/
function function_a8f832d3(localClientNum, var_959544c9, FX)
{
	var_d6298665 = StrTok(var_959544c9, "*");
	orig = (0 + Int(var_d6298665[0]), 0 + Int(var_d6298665[1]), 0 + Int(var_d6298665[2]));
	fxObj = spawn(localClientNum, orig, "script_model");
	fxObj SetModel("tag_origin");
	var_b500d81 = PlayFXOnTag(localClientNum, FX, fxObj, "tag_origin");
	wait(5);
	stopfx(localClientNum, var_b500d81);
	wait(1);
	fxObj delete();
}

/*
	Name: function_3ebd27a2
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0x978
	Size: 0x2A0
	Parameters: 3
	Flags: None
	Line Number: 205
*/
function function_3ebd27a2(localClientNum, var_959544c9, arg3)
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
		if(Int(arg3))
		{
			zombie.var_d0ea30fb = spawn(localClientNum, orig, "script_model");
			zombie.var_d0ea30fb SetModel("tag_origin");
			zombie.var_3ebd27a2 = PlayFXOnTag(localClientNum, level._effect["changechews_ice_zomb"], zombie.var_d0ea30fb, "tag_origin");
		}
		else
		{
			stopfx(localClientNum, zombie.var_3ebd27a2);
			zombie.var_d0ea30fb delete();
		}
	}
}

/*
	Name: function_267f6c1a
	Namespace: namespace_2127f613
	Checksum: 0x424F4353
	Offset: 0xC20
	Size: 0x184
	Parameters: 3
	Flags: None
	Line Number: 245
*/
function function_267f6c1a(localClientNum, var_959544c9, FX)
{
	var_d6298665 = StrTok(var_959544c9, "*");
	orig = (0 + Int(var_d6298665[0]), 0 + Int(var_d6298665[1]), 0 + Int(var_d6298665[2]));
	fxObj = spawn(localClientNum, orig, "script_model");
	fxObj SetModel("tag_origin");
	var_b500d81 = PlayFXOnTag(localClientNum, level._effect["changechews_ice_zomb"], fxObj, "tag_origin");
	wait(3);
	stopfx(localClientNum, var_b500d81);
	wait(0.1);
	fxObj delete();
}

