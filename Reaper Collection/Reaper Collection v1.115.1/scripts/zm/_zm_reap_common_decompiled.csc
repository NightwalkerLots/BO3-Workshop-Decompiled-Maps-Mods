#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_851dc78f;

/*
	Name: __init__sytem__
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x3A0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 25
*/
function autoexec __init__sytem__()
{
	system::register("zm_reap_common", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x3E8
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function __init__()
{
	if(!isdefined(level.var_5abfe317))
	{
		level.var_5abfe317 = [];
	}
	level.var_b79feee1 = "";
	level.var_adb259d = "";
	clientfield::register("actor", "reap_clientfield_actor", 21000, 1, "int", &function_135109d1, 0, 0);
	if(!isdefined(level.var_67450254))
	{
		level.var_67450254 = [];
	}
	level.var_b47a0bee = "";
	level.var_9327f3b8 = "";
	clientfield::register("scriptmover", "reap_clientfield_scriptmover", 21000, 1, "int", &function_54c6b832, 0, 0);
	if(!isdefined(level.var_e1ca33e9))
	{
		level.var_e1ca33e9 = [];
	}
	level.var_94c1ab53 = "";
	level.var_bca09bbb = "";
	clientfield::register("allplayers", "reap_clientfield_allplayers", 21000, 1, "int", &function_3f5f33d7, 0, 0);
	duplicate_render::set_dr_filter_framebuffer_duplicate("staff_water_freeze", 10, "staff_water_freeze_on", undefined, 1, "mc/mtl_freezeover", 1);
}

/*
	Name: __main__
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x5B0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function __main__()
{
	util::REGISTER_SYSTEM("clientfield_bypass_sys", &function_4621bbdd);
	level.var_5abfe317["frozen_zombie_test"] = &function_208fe11f;
	level thread function_5a4dc5ed();
	level.var_bb7977f0[level.var_bb7977f0.size] = &function_515d4c9;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5a4dc5ed
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x640
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 96
*/
function function_5a4dc5ed()
{
	if(!isdefined(level.var_bb7977f0))
	{
		level.var_bb7977f0 = [];
	}
	while(1)
	{
		if(level.var_bb7977f0.size > 0)
		{
			allEnts = GetEntArray(0);
			for(i = 0; i < level.var_bb7977f0.size; i++)
			{
				[[level.var_bb7977f0[i]]](allEnts);
			}
		}
		WaitRealTime(0.2);
	}
}

/*
	Name: function_515d4c9
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x6F0
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 126
*/
function function_515d4c9(all)
{
	if(isdefined(level.var_45b93609) && level.var_45b93609.size > 0)
	{
		foreach(ent in all)
		{
			if(isdefined(ent) && isdefined(ent.model) && isdefined(level.var_45b93609[ent.model]))
			{
				ent [[level.var_45b93609[ent.model]]]();
			}
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4621bbdd
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x7F0
	Size: 0x1D0
	Parameters: 3
	Flags: None
	Line Number: 152
*/
function function_4621bbdd(localClientNum, newState, oldState)
{
	if(!isdefined(newState))
	{
		return;
	}
	var_21aa4d87 = StrTok(newState, "|");
	if(var_21aa4d87[0] == "actor")
	{
		if(isdefined(level.var_5abfe317[var_21aa4d87[1]]))
		{
			level.var_adb259d = level.var_b79feee1;
			level.var_b79feee1 = var_21aa4d87[1];
		}
		else
		{
			IPrintLnBold(var_21aa4d87[1] + " actor doesnt exist!");
		}
	}
	if(var_21aa4d87[0] == "scriptmover")
	{
		if(isdefined(level.var_67450254[var_21aa4d87[1]]))
		{
			level.var_9327f3b8 = level.var_b47a0bee;
			level.var_b47a0bee = var_21aa4d87[1];
		}
		else
		{
			IPrintLnBold(var_21aa4d87[1] + " scriptmover doesnt exist!");
		}
	}
	if(var_21aa4d87[0] == "allplayers")
	{
		if(isdefined(level.var_e1ca33e9[var_21aa4d87[1]]))
		{
			level.var_bca09bbb = level.var_94c1ab53;
			level.var_94c1ab53 = var_21aa4d87[1];
		}
		else
		{
			IPrintLnBold(var_21aa4d87[1] + " allplayers doesnt exist!");
			return;
		}
	}
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_135109d1
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x9C8
	Size: 0x90
	Parameters: 7
	Flags: None
	Line Number: 210
*/
function function_135109d1(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(isdefined(level.var_5abfe317[level.var_b79feee1]))
	{
		self thread [[level.var_5abfe317[level.var_b79feee1]]](localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump);
	}
}

/*
	Name: function_54c6b832
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xA60
	Size: 0x90
	Parameters: 7
	Flags: None
	Line Number: 228
*/
function function_54c6b832(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(isdefined(level.var_67450254[level.var_b47a0bee]))
	{
		self thread [[level.var_67450254[level.var_b47a0bee]]](localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3f5f33d7
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xAF8
	Size: 0x90
	Parameters: 7
	Flags: None
	Line Number: 248
*/
function function_3f5f33d7(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(isdefined(level.var_e1ca33e9[level.var_94c1ab53]))
	{
		self thread [[level.var_e1ca33e9[level.var_94c1ab53]]](localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump);
	}
}

/*
	Name: function_208fe11f
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xB90
	Size: 0xA8
	Parameters: 7
	Flags: None
	Line Number: 266
*/
function function_208fe11f(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(newVal)
	{
		self thread function_ec46f689(localClientNum);
	}
	else
	{
		self notify("hash_4c358ffa");
		self duplicate_render::set_dr_flag("staff_water_freeze_on", 0);
		self duplicate_render::update_dr_filters(localClientNum);
	}
}

/*
	Name: function_ec46f689
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xC40
	Size: 0x258
	Parameters: 1
	Flags: None
	Line Number: 290
*/
function function_ec46f689(localClientNum)
{
	self endon("hash_4c358ffa");
	self endon("death");
	self endon("entityshutdown");
	self duplicate_render::set_dr_flag("staff_water_freeze_on", 1);
	self duplicate_render::update_dr_filters(localClientNum);
	self MapShaderConstant(localClientNum, 0, "scriptVector0", 1, 1, 1, 1);
	self MapShaderConstant(localClientNum, 8, "scriptVector2", 1, 1, 0, 0);
	self thread function_a603ec70(localClientNum);
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
		WaitRealTime(0.5);
	}
}

/*
	Name: function_a603ec70
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xEA0
	Size: 0xA4
	Parameters: 1
	Flags: None
	Line Number: 333
*/
function function_a603ec70(localClientNum)
{
	self waittill("death");
	self duplicate_render::set_dr_flag("staff_water_freeze_on", 0);
	self duplicate_render::update_dr_filters(localClientNum);
	self MapShaderConstant(localClientNum, 0, "scriptVector0", 0, 1, 0, 0);
	self MapShaderConstant(localClientNum, 8, "scriptVector2", 0, 1, 0, 0);
}

