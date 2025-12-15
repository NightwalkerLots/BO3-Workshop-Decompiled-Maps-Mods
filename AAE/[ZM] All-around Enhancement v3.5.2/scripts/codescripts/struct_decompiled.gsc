#include scripts\shared\scene_shared;

#namespace struct;

/*
	Name: __init__
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x1E0
	Size: 0x28
	Parameters: 0
	Flags: AutoExec
	Line Number: 14
*/
function autoexec __init__()
{
	if(!isdefined(level.struct))
	{
		init_structs();
	}
}

/*
	Name: init_structs
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x210
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function init_structs()
{
	level.struct = [];
	level.scriptbundles = [];
	level.var_570603 = [];
	level.struct_class_names = [];
	level.struct_class_names["target"] = [];
	level.struct_class_names["targetname"] = [];
	level.struct_class_names["script_noteworthy"] = [];
	level.struct_class_names["script_linkname"] = [];
	level.struct_class_names["script_label"] = [];
	level.struct_class_names["classname"] = [];
	level.struct_class_names["script_unitrigger_type"] = [];
	level.struct_class_names["scriptbundlename"] = [];
	level.struct_class_names["prefabname"] = [];
}

/*
	Name: function_aa4875d1
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x308
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 59
*/
function function_aa4875d1(struct)
{
	struct.var_5aabff8a = undefined;
	struct.var_eb4e79c2 = undefined;
	/#
		var_d9d1ca59 = struct.var_d9d1ca59;
	#/
	struct.var_d9d1ca59 = undefined;
	/#
		struct.var_d9d1ca59 = var_d9d1ca59;
	#/
}

/*
	Name: CreateStruct
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x378
	Size: 0x200
	Parameters: 3
	Flags: None
	Line Number: 82
*/
function CreateStruct(struct, type, name)
{
	if(!isdefined(level.struct))
	{
		init_structs();
	}
	if(isdefined(type))
	{
		var_d64c42bd = GetDvarString("mapname") == "core_frontend";
		if(!isdefined(level.scriptbundles[type]))
		{
			level.scriptbundles[type] = [];
		}
		if(isdefined(level.scriptbundles[type][name]))
		{
			return level.scriptbundles[type][name];
		}
		if(type == "scene")
		{
			level.scriptbundles[type][name] = scene::remove_invalid_scene_objects(struct);
		}
		else if(!(SessionModeIsMultiplayerGame() || var_d64c42bd) && type == "mpdialog_player")
		{
		}
		else if(!(SessionModeIsMultiplayerGame() || var_d64c42bd) && type == "gibcharacterdef" && IsSubStr(name, "c_t7_mp_"))
		{
		}
		else if(!(SessionModeIsCampaignGame() || var_d64c42bd) && type == "collectibles")
		{
		}
		else
		{
			level.scriptbundles[type][name] = struct;
		}
		function_aa4875d1(struct);
	}
	else
	{
		struct init();
		return;
	}
	~level.scriptbundles[type][name];
}

/*
	Name: function_f3b581d0
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x580
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 136
*/
function function_f3b581d0(items, var_1578b6b3, name)
{
	if(!isdefined(level.struct))
	{
		init_structs();
	}
	level.var_570603[var_1578b6b3][name] = items;
}

/*
	Name: init
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x5E0
	Size: 0x940
	Parameters: 0
	Flags: None
	Line Number: 155
*/
function init()
{
	if(!isdefined(level.struct))
	{
		level.struct = [];
	}
	else if(!IsArray(level.struct))
	{
		level.struct = Array(level.struct);
	}
	level.struct[level.struct.size] = self;
	if(!isdefined(self.angles))
	{
		self.angles = (0, 0, 0);
	}
	if(isdefined(self.targetname))
	{
		if(!isdefined(level.struct_class_names["targetname"][self.targetname]))
		{
			level.struct_class_names["targetname"][self.targetname] = [];
		}
		else if(!IsArray(level.struct_class_names["targetname"][self.targetname]))
		{
			level.struct_class_names["targetname"][self.targetname] = Array(level.struct_class_names["targetname"][self.targetname]);
		}
		level.struct_class_names["targetname"][self.targetname][level.struct_class_names["targetname"][self.targetname].size] = self;
	}
	if(isdefined(self.target))
	{
		if(!isdefined(level.struct_class_names["target"][self.target]))
		{
			level.struct_class_names["target"][self.target] = [];
		}
		else if(!IsArray(level.struct_class_names["target"][self.target]))
		{
			level.struct_class_names["target"][self.target] = Array(level.struct_class_names["target"][self.target]);
		}
		level.struct_class_names["target"][self.target][level.struct_class_names["target"][self.target].size] = self;
	}
	if(isdefined(self.script_noteworthy))
	{
		if(!isdefined(level.struct_class_names["script_noteworthy"][self.script_noteworthy]))
		{
			level.struct_class_names["script_noteworthy"][self.script_noteworthy] = [];
		}
		else if(!IsArray(level.struct_class_names["script_noteworthy"][self.script_noteworthy]))
		{
			level.struct_class_names["script_noteworthy"][self.script_noteworthy] = Array(level.struct_class_names["script_noteworthy"][self.script_noteworthy]);
		}
		level.struct_class_names["script_noteworthy"][self.script_noteworthy][level.struct_class_names["script_noteworthy"][self.script_noteworthy].size] = self;
	}
	if(isdefined(self.script_linkname))
	{
		/#
			Assert(!isdefined(level.struct_class_names["Dev Block strings are not supported"][self.script_linkname]), "Dev Block strings are not supported");
		#/
		level.struct_class_names["script_linkname"][self.script_linkname][0] = self;
	}
	if(isdefined(self.script_label))
	{
		if(!isdefined(level.struct_class_names["script_label"][self.script_label]))
		{
			level.struct_class_names["script_label"][self.script_label] = [];
		}
		else if(!IsArray(level.struct_class_names["script_label"][self.script_label]))
		{
			level.struct_class_names["script_label"][self.script_label] = Array(level.struct_class_names["script_label"][self.script_label]);
		}
		level.struct_class_names["script_label"][self.script_label][level.struct_class_names["script_label"][self.script_label].size] = self;
	}
	if(isdefined(self.classname))
	{
		if(!isdefined(level.struct_class_names["classname"][self.classname]))
		{
			level.struct_class_names["classname"][self.classname] = [];
		}
		else if(!IsArray(level.struct_class_names["classname"][self.classname]))
		{
			level.struct_class_names["classname"][self.classname] = Array(level.struct_class_names["classname"][self.classname]);
		}
		level.struct_class_names["classname"][self.classname][level.struct_class_names["classname"][self.classname].size] = self;
	}
	if(isdefined(self.script_unitrigger_type))
	{
		if(!isdefined(level.struct_class_names["script_unitrigger_type"][self.script_unitrigger_type]))
		{
			level.struct_class_names["script_unitrigger_type"][self.script_unitrigger_type] = [];
		}
		else if(!IsArray(level.struct_class_names["script_unitrigger_type"][self.script_unitrigger_type]))
		{
			level.struct_class_names["script_unitrigger_type"][self.script_unitrigger_type] = Array(level.struct_class_names["script_unitrigger_type"][self.script_unitrigger_type]);
		}
		level.struct_class_names["script_unitrigger_type"][self.script_unitrigger_type][level.struct_class_names["script_unitrigger_type"][self.script_unitrigger_type].size] = self;
	}
	if(isdefined(self.scriptbundlename))
	{
		if(!isdefined(level.struct_class_names["scriptbundlename"][self.scriptbundlename]))
		{
			level.struct_class_names["scriptbundlename"][self.scriptbundlename] = [];
		}
		else if(!IsArray(level.struct_class_names["scriptbundlename"][self.scriptbundlename]))
		{
			level.struct_class_names["scriptbundlename"][self.scriptbundlename] = Array(level.struct_class_names["scriptbundlename"][self.scriptbundlename]);
		}
		level.struct_class_names["scriptbundlename"][self.scriptbundlename][level.struct_class_names["scriptbundlename"][self.scriptbundlename].size] = self;
	}
	if(isdefined(self.var_47c44e16))
	{
		if(!isdefined(level.struct_class_names["prefabname"][self.var_47c44e16]))
		{
			level.struct_class_names["prefabname"][self.var_47c44e16] = [];
		}
		else if(!IsArray(level.struct_class_names["prefabname"][self.var_47c44e16]))
		{
			level.struct_class_names["prefabname"][self.var_47c44e16] = Array(level.struct_class_names["prefabname"][self.var_47c44e16]);
		}
		level.struct_class_names["prefabname"][self.var_47c44e16][level.struct_class_names["prefabname"][self.var_47c44e16].size] = self;
		return;
	}
}

/*
	Name: get
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0xF28
	Size: 0x100
	Parameters: 2
	Flags: None
	Line Number: 286
*/
function get(kvp_value, kvp_key)
{
	if(!isdefined(kvp_key))
	{
		kvp_key = "targetname";
	}
	if(isdefined(level.struct_class_names[kvp_key]) && isdefined(level.struct_class_names[kvp_key][kvp_value]))
	{
		/#
			if(level.struct_class_names[kvp_key][kvp_value].size > 1)
			{
				/#
					ASSERTMSG("Dev Block strings are not supported" + kvp_key + "Dev Block strings are not supported" + kvp_value + "Dev Block strings are not supported");
				#/
				return undefined;
			}
		#/
		if(level.script == "zm_castle")
		{
			thread function_b209aa9a(kvp_value, kvp_key);
		}
		return level.struct_class_names[kvp_key][kvp_value][0];
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b209aa9a
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x1030
	Size: 0x250
	Parameters: 2
	Flags: None
	Line Number: 323
*/
function function_b209aa9a(kvp_value, kvp_key)
{
	if(!isdefined(kvp_key))
	{
		kvp_key = "targetname";
	}
	if(IsSubStr(kvp_value, "cs_keeper_pos_"))
	{
		wait(2);
		keeper = GetEnt("keeper_archon_ai", "targetname");
		playsoundatposition("zmb_bgb_abh_teleport_out", keeper.origin);
		playFX(level._effect["teleport_splash"], keeper.origin);
		playFX(level._effect["teleport_aoe"], keeper.origin);
		keeper ForceTeleport(level.struct_class_names[kvp_key][kvp_value][0].origin);
	}
	if(kvp_value == "keeper_end_loc")
	{
		if(isdefined(level.var_2323d857))
		{
			wait(2);
			keeper = GetEnt("keeper_archon_ai", "targetname");
			playsoundatposition("zmb_bgb_abh_teleport_out", keeper.origin);
			playFX(level._effect["teleport_splash"], keeper.origin);
			playFX(level._effect["teleport_aoe"], keeper.origin);
			keeper ForceTeleport(level.struct_class_names[kvp_key][kvp_value][0].origin);
		}
		else
		{
			level.var_2323d857 = 1;
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: spawn
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x1288
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 368
*/
function spawn(v_origin, v_angles)
{
	if(!isdefined(v_origin))
	{
		v_origin = (0, 0, 0);
	}
	if(!isdefined(v_angles))
	{
		v_angles = (0, 0, 0);
	}
	s = spawnstruct();
	s.origin = v_origin;
	s.angles = v_angles;
	return s;
}

/*
	Name: get_array
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x1318
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 394
*/
function get_array(kvp_value, kvp_key)
{
	if(!isdefined(kvp_key))
	{
		kvp_key = "targetname";
	}
	if(isdefined(level.struct_class_names[kvp_key][kvp_value]))
	{
		return ArrayCopy(level.struct_class_names[kvp_key][kvp_value]);
	}
	return [];
}

/*
	Name: delete
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x1390
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 417
*/
function delete()
{
	if(isdefined(self.target))
	{
		ArrayRemoveValue(level.struct_class_names["target"][self.target], self);
	}
	if(isdefined(self.targetname))
	{
		ArrayRemoveValue(level.struct_class_names["targetname"][self.targetname], self);
	}
	if(isdefined(self.script_noteworthy))
	{
		ArrayRemoveValue(level.struct_class_names["script_noteworthy"][self.script_noteworthy], self);
	}
	if(isdefined(self.script_linkname))
	{
		ArrayRemoveValue(level.struct_class_names["script_linkname"][self.script_linkname], self);
	}
	if(isdefined(self.script_label))
	{
		ArrayRemoveValue(level.struct_class_names["script_label"][self.script_label], self);
	}
	if(isdefined(self.classname))
	{
		ArrayRemoveValue(level.struct_class_names["classname"][self.classname], self);
	}
	if(isdefined(self.script_unitrigger_type))
	{
		ArrayRemoveValue(level.struct_class_names["script_unitrigger_type"][self.script_unitrigger_type], self);
	}
	if(isdefined(self.scriptbundlename))
	{
		ArrayRemoveValue(level.struct_class_names["scriptbundlename"][self.scriptbundlename], self);
	}
	if(isdefined(self.var_47c44e16))
	{
		ArrayRemoveValue(level.struct_class_names["prefabname"][self.var_47c44e16], self);
		return;
	}
}

/*
	Name: get_script_bundle
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x1598
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 468
*/
function get_script_bundle(str_type, str_name)
{
	if(isdefined(level.scriptbundles[str_type]) && isdefined(level.scriptbundles[str_type][str_name]))
	{
		return level.scriptbundles[str_type][str_name];
		return;
	}
}

/*
	Name: delete_script_bundle
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x15F8
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 487
*/
function delete_script_bundle(str_type, str_name)
{
	if(isdefined(level.scriptbundles[str_type]) && isdefined(level.scriptbundles[str_type][str_name]))
	{
		level.scriptbundles[str_type][str_name] = undefined;
		return;
	}
	ERROR: Bad function call
}

/*
	Name: get_script_bundles
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x1658
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 507
*/
function get_script_bundles(str_type)
{
	if(isdefined(level.scriptbundles) && isdefined(level.scriptbundles[str_type]))
	{
		return level.scriptbundles[str_type];
	}
	return [];
}

/*
	Name: get_script_bundle_list
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x16A0
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 526
*/
function get_script_bundle_list(str_type, str_name)
{
	if(isdefined(level.var_570603[str_type]) && isdefined(level.var_570603[str_type][str_name]))
	{
		return level.var_570603[str_type][str_name];
	}
}

/*
	Name: get_script_bundle_instances
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x1700
	Size: 0x118
	Parameters: 2
	Flags: None
	Line Number: 544
*/
function get_script_bundle_instances(str_type, str_name)
{
	if(!isdefined(str_name))
	{
		str_name = "";
	}
	a_instances = get_array("scriptbundle_" + str_type, "classname");
	if(str_name != "")
	{
		foreach(s_instance in a_instances)
		{
			if(s_instance.name != str_name)
			{
				ArrayRemoveIndex(a_instances, i, 1);
			}
		}
	}
	return a_instances;
}

/*
	Name: FindStruct
	Namespace: struct
	Checksum: 0x424F4353
	Offset: 0x1820
	Size: 0x314
	Parameters: 3
	Flags: None
	Line Number: 574
*/
function FindStruct(param1, name, index)
{
	if(IsVec(param1))
	{
		position = param1;
		foreach(_ in level.struct_class_names)
		{
			foreach(s_array in level.struct_class_names[key])
			{
				foreach(struct in s_array)
				{
					if(DistanceSquared(struct.origin, position) < 1)
					{
						return struct;
					}
				}
			}
		}
		if(isdefined(level.struct))
		{
			foreach(struct in level.struct)
			{
				if(DistanceSquared(struct.origin, position) < 1)
				{
					return struct;
				}
			}
		}
	}
	else
	{
		s = get(param1);
		if(isdefined(s))
		{
			return s;
		}
		s = get_script_bundle(param1, name);
		if(isdefined(s))
		{
			if(index < 0)
			{
				return s;
			}
			else if(isdefined(s.objects))
			{
				return s.objects[index];
			}
		}
	}
	return undefined;
}

