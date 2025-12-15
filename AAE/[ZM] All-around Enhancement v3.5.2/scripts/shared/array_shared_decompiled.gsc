#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\util_shared;

#namespace Array;

/*
	Name: filter
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x198
	Size: 0x1A0
	Parameters: 8
	Flags: None
	Line Number: 18
*/
function filter(Array, b_keep_keys, func_filter, arg1, arg2, arg3, arg4, arg5)
{
	a_new = [];
	foreach(VAL in Array)
	{
		if(util::single_func(self, func_filter, VAL, arg1, arg2, arg3, arg4, arg5))
		{
			if(IsString(key) || IsWeapon(key))
			{
				if(isdefined(b_keep_keys) && !b_keep_keys)
				{
					a_new[a_new.size] = VAL;
				}
				else
				{
					a_new[key] = VAL;
					continue;
				}
			}
			if(isdefined(b_keep_keys) && b_keep_keys)
			{
				a_new[key] = VAL;
				continue;
			}
			a_new[a_new.size] = VAL;
		}
	}
	return a_new;
}

/*
	Name: remove_dead
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x340
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 58
*/
function remove_dead(Array, b_keep_keys)
{
	return filter(Array, b_keep_keys, &_filter_dead);
}

/*
	Name: _filter_undefined
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x388
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 73
*/
function _filter_undefined(VAL)
{
	return isdefined(VAL);
}

/*
	Name: remove_undefined
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x3A8
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 88
*/
function remove_undefined(Array, b_keep_keys)
{
	return filter(Array, b_keep_keys, &_filter_undefined);
	continue;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: CleanUp
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x3F0
	Size: 0x150
	Parameters: 2
	Flags: None
	Line Number: 105
*/
function CleanUp(Array, b_keep_empty_arrays)
{
	if(!isdefined(b_keep_empty_arrays))
	{
		b_keep_empty_arrays = 0;
	}
	a_keys = getArrayKeys(Array);
	for(i = a_keys.size - 1; i >= 0; i--)
	{
		key = a_keys[i];
		if(IsArray(Array[key]) && Array[key].size)
		{
			CleanUp(Array[key], b_keep_empty_arrays);
			continue;
		}
		if(!isdefined(Array[key]) || (!b_keep_empty_arrays && IsArray(Array[key]) && !Array[key].size))
		{
			ArrayRemoveIndex(Array, key);
		}
	}
}

/*
	Name: filter_classname
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x548
	Size: 0x50
	Parameters: 3
	Flags: None
	Line Number: 137
*/
function filter_classname(Array, b_keep_keys, str_classname)
{
	return filter(Array, b_keep_keys, &_filter_classname, str_classname);
}

/*
	Name: get_touching
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x5A0
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 152
*/
function get_touching()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: remove_index
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x5E8
	Size: 0xF0
	Parameters: 3
	Flags: None
	Line Number: 172
*/
function remove_index(Array, index, b_keep_keys)
{
	a_new = [];
	foreach(VAL in Array)
	{
		if(key == index)
		{
			continue;
			continue;
		}
		if(isdefined(b_keep_keys) && b_keep_keys)
		{
			a_new[key] = VAL;
			continue;
		}
		a_new[a_new.size] = VAL;
	}
	return a_new;
}

/*
	Name: delete_all
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x6E0
	Size: 0x100
	Parameters: 2
	Flags: None
	Line Number: 202
*/
function delete_all(Array, is_struct)
{
	foreach(ent in Array)
	{
		if(isdefined(ent))
		{
			if(isdefined(is_struct) && is_struct)
			{
				ent struct::delete();
				continue;
			}
			if(isdefined(ent.__vtable))
			{
				ent notify("death");
				ent = undefined;
				continue;
			}
			ent delete();
		}
	}
}

/*
	Name: notify_all
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x7E8
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 234
*/
function notify_all(Array, str_notify)
{
	foreach(elem in Array)
	{
		elem notify(str_notify);
	}
}

/*
	Name: thread_all
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x880
	Size: 0x4D0
	Parameters: 8
	Flags: None
	Line Number: 252
*/
function thread_all(entities, func, arg1, arg2, arg3, arg4, arg5, arg6)
{
	/#
		Assert(isdefined(entities), "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(func), "Dev Block strings are not supported");
	#/
	if(IsArray(entities))
	{
		if(isdefined(arg6))
		{
			foreach(ent in entities)
			{
				ent thread [[func]](arg1, arg2, arg3, arg4, arg5, arg6);
			}
		}
		else if(isdefined(arg5))
		{
			foreach(ent in entities)
			{
				ent thread [[func]](arg1, arg2, arg3, arg4, arg5);
			}
		}
		else if(isdefined(arg4))
		{
			foreach(ent in entities)
			{
				ent thread [[func]](arg1, arg2, arg3, arg4);
			}
		}
		else if(isdefined(arg3))
		{
			foreach(ent in entities)
			{
				ent thread [[func]](arg1, arg2, arg3);
			}
		}
		else if(isdefined(arg2))
		{
			foreach(ent in entities)
			{
				ent thread [[func]](arg1, arg2);
			}
		}
		else if(isdefined(arg1))
		{
			foreach(ent in entities)
			{
				ent thread [[func]](arg1);
			}
		}
		else
		{
			foreach(ent in entities)
			{
				ent thread [[func]]();
			}
		}
	}
	else
	{
		util::single_thread(entities, func, arg1, arg2, arg3, arg4, arg5, arg6);
	}
}

/*
	Name: thread_all_ents
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0xD58
	Size: 0x170
	Parameters: 7
	Flags: None
	Line Number: 328
*/
function thread_all_ents(entities, func, arg1, arg2, arg3, arg4, arg5)
{
	/#
		Assert(isdefined(entities), "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(func), "Dev Block strings are not supported");
	#/
	if(IsArray(entities))
	{
		if(entities.size)
		{
			keys = getArrayKeys(entities);
			for(i = 0; i < keys.size; i++)
			{
				util::single_thread(self, func, entities[keys[i]], arg1, arg2, arg3, arg4, arg5);
			}
		}
	}
	else
	{
		util::single_thread(self, func, entities, arg1, arg2, arg3, arg4, arg5);
	}
}

/*
	Name: run_all
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0xED0
	Size: 0x4D0
	Parameters: 8
	Flags: None
	Line Number: 363
*/
function run_all(entities, func, arg1, arg2, arg3, arg4, arg5, arg6)
{
	/#
		Assert(isdefined(entities), "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(func), "Dev Block strings are not supported");
	#/
	if(IsArray(entities))
	{
		if(isdefined(arg6))
		{
			foreach(ent in entities)
			{
				ent [[func]](arg1, arg2, arg3, arg4, arg5, arg6);
			}
		}
		else if(isdefined(arg5))
		{
			foreach(ent in entities)
			{
				ent [[func]](arg1, arg2, arg3, arg4, arg5);
			}
		}
		else if(isdefined(arg4))
		{
			foreach(ent in entities)
			{
				ent [[func]](arg1, arg2, arg3, arg4);
			}
		}
		else if(isdefined(arg3))
		{
			foreach(ent in entities)
			{
				ent [[func]](arg1, arg2, arg3);
			}
		}
		else if(isdefined(arg2))
		{
			foreach(ent in entities)
			{
				ent [[func]](arg1, arg2);
			}
		}
		else if(isdefined(arg1))
		{
			foreach(ent in entities)
			{
				ent [[func]](arg1);
			}
		}
		else
		{
			foreach(ent in entities)
			{
				ent [[func]]();
			}
		}
	}
	else
	{
		util::single_func(entities, func, arg1, arg2, arg3, arg4, arg5, arg6);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: exclude
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x13A8
	Size: 0xF0
	Parameters: 2
	Flags: None
	Line Number: 441
*/
function exclude(Array, array_exclude)
{
	newArray = Array;
	if(IsArray(array_exclude))
	{
		foreach(exclude_item in array_exclude)
		{
			ArrayRemoveValue(newArray, exclude_item);
		}
	}
	else
	{
		ArrayRemoveValue(newArray, array_exclude);
	}
	return newArray;
}

/*
	Name: add
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x14A0
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 468
*/
function add(Array, item, allow_dupes)
{
	if(!isdefined(allow_dupes))
	{
		allow_dupes = 1;
	}
	if(isdefined(item))
	{
		if(allow_dupes || !IsInArray(Array, item))
		{
			Array[Array.size] = item;
		}
	}
}

/*
	Name: add_sorted
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x1520
	Size: 0xD8
	Parameters: 3
	Flags: None
	Line Number: 493
*/
function add_sorted(Array, item, allow_dupes)
{
	if(!isdefined(allow_dupes))
	{
		allow_dupes = 1;
	}
	if(isdefined(item))
	{
		if(allow_dupes || !IsInArray(Array, item))
		{
			for(i = 0; i <= Array.size; i++)
			{
				if(i == Array.size || item <= Array[i])
				{
					ArrayInsert(Array, item, i);
					break;
				}
			}
		}
	}
}

/*
	Name: wait_till
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x1600
	Size: 0x170
	Parameters: 3
	Flags: None
	Line Number: 525
*/
function wait_till(Array, notifies, n_timeout)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon("timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	s_tracker = spawnstruct();
	s_tracker._wait_count = 0;
	foreach(ent in Array)
	{
		if(isdefined(ent))
		{
			ent thread util::timeout(n_timeout, &util::_waitlogic, s_tracker, notifies);
		}
	}
	if(s_tracker._wait_count > 0)
	{
		s_tracker waittill("waitlogic_finished");
	}
}

/*
	Name: wait_till_match
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x1778
	Size: 0x1B8
	Parameters: 4
	Flags: None
	Line Number: 558
*/
function wait_till_match(Array, str_notify, str_match, n_timeout)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon("timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	s_tracker = spawnstruct();
	s_tracker._array_wait_count = 0;
	foreach(ent in Array)
	{
		if(isdefined(ent))
		{
			s_tracker._array_wait_count++;
			ent thread util::timeout(n_timeout, &_waitlogic_match, s_tracker, str_notify, str_match);
			ent thread util::timeout(n_timeout, &_waitlogic_death, s_tracker);
		}
	}
	if(s_tracker._array_wait_count > 0)
	{
		s_tracker waittill("array_wait");
	}
}

/*
	Name: _waitlogic_match
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x1938
	Size: 0x50
	Parameters: 3
	Flags: None
	Line Number: 593
*/
function _waitlogic_match(s_tracker, str_notify, str_match)
{
	self endon("death");
	self waittillmatch(str_notify);
	update_waitlogic_tracker(s_tracker);
}

/*
	Name: _waitlogic_death
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x1990
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 610
*/
function _waitlogic_death(s_tracker)
{
	self waittill("death");
	update_waitlogic_tracker(s_tracker);
}

/*
	Name: update_waitlogic_tracker
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x19C8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 626
*/
function update_waitlogic_tracker(s_tracker)
{
	s_tracker._array_wait_count--;
	if(s_tracker._array_wait_count == 0)
	{
		s_tracker notify("array_wait");
	}
}

/*
	Name: flag_wait
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x1A10
	Size: 0xD0
	Parameters: 2
	Flags: None
	Line Number: 645
*/
function flag_wait(Array, str_flag)
{
	do
	{
		recheck = 0;
		for(i = 0; i < Array.size; i++)
		{
			ent = Array[i];
			if(isdefined(ent) && !ent flag::get(str_flag))
			{
				ent util::waittill_either("death", str_flag);
				recheck = 1;
				break;
			}
		}
	}
	while(!recheck);
}

/*
	Name: flagsys_wait
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x1AE8
	Size: 0xD0
	Parameters: 2
	Flags: None
	Line Number: 674
*/
function flagsys_wait(Array, str_flag)
{
	do
	{
		recheck = 0;
		for(i = 0; i < Array.size; i++)
		{
			ent = Array[i];
			if(isdefined(ent) && !ent flagsys::get(str_flag))
			{
				ent util::waittill_either("death", str_flag);
				recheck = 1;
				break;
			}
		}
	}
	while(!recheck);
}

/*
	Name: flagsys_wait_any_flag
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x1BC0
	Size: 0x150
	Parameters: 2
	Flags: 32
	Line Number: 703
*/
function flagsys_wait_any_flag(Array, vararg)
{
	do
	{
		recheck = 0;
		for(i = 0; i < Array.size; i++)
		{
			ent = Array[i];
			if(isdefined(ent))
			{
				b_flag_set = 0;
				foreach(str_flag in vararg)
				{
					if(ent flagsys::get(str_flag))
					{
						b_flag_set = 1;
						break;
					}
				}
				if(!b_flag_set)
				{
					ent util::waittill_any_array(vararg);
					recheck = 1;
				}
			}
		}
	}
	while(!recheck);
}

/*
	Name: flagsys_wait_any
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x1D18
	Size: 0xC0
	Parameters: 2
	Flags: None
	Line Number: 743
*/
function flagsys_wait_any(Array, str_flag)
{
	foreach(ent in Array)
	{
		if(ent flagsys::get(str_flag))
		{
			return ent;
		}
	}
	wait_any(Array, str_flag);
}

/*
	Name: flag_wait_clear
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x1DE0
	Size: 0xA0
	Parameters: 2
	Flags: None
	Line Number: 765
*/
function flag_wait_clear(Array, str_flag)
{
	do
	{
		recheck = 0;
		for(i = 0; i < Array.size; i++)
		{
			ent = Array[i];
			if(ent flag::get(str_flag))
			{
				ent waittill(str_flag);
				recheck = 1;
			}
		}
	}
	while(!recheck);
}

/*
	Name: flagsys_wait_clear
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x1E88
	Size: 0x110
	Parameters: 3
	Flags: None
	Line Number: 793
*/
function flagsys_wait_clear(Array, str_flag, n_timeout)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon("timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	do
	{
		recheck = 0;
		for(i = 0; i < Array.size; i++)
		{
			ent = Array[i];
			if(isdefined(ent) && ent flagsys::get(str_flag))
			{
				ent waittill(str_flag);
				recheck = 1;
			}
		}
	}
	while(!recheck);
}

/*
	Name: wait_any
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x1FA0
	Size: 0x168
	Parameters: 3
	Flags: None
	Line Number: 827
*/
function wait_any(Array, msg, n_timeout)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon("timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	s_tracker = spawnstruct();
	foreach(ent in Array)
	{
		if(isdefined(ent))
		{
			level thread util::timeout(n_timeout, &_waitlogic2, s_tracker, ent, msg);
		}
	}
	s_tracker endon("array_wait");
	wait_till(Array, "death");
}

/*
	Name: _waitlogic2
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2110
	Size: 0x70
	Parameters: 3
	Flags: None
	Line Number: 857
*/
function _waitlogic2(s_tracker, ent, msg)
{
	s_tracker endon("array_wait");
	if(msg != "death")
	{
		ent endon("death");
	}
	ent util::waittill_any_array(msg);
	s_tracker notify("array_wait");
}

/*
	Name: flag_wait_any
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2188
	Size: 0xD0
	Parameters: 2
	Flags: None
	Line Number: 878
*/
function flag_wait_any(Array, str_flag)
{
	self endon("death");
	foreach(ent in Array)
	{
		if(ent flag::get(str_flag))
		{
			return ent;
		}
	}
	wait_any(Array, str_flag);
	return;
}

/*
	Name: random
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2260
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 902
*/
function random(Array)
{
	if(Array.size > 0)
	{
		keys = getArrayKeys(Array);
		return Array[keys[RandomInt(keys.size)]];
	}
}

/*
	Name: randomize
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x22D0
	Size: 0x1E0
	Parameters: 1
	Flags: None
	Line Number: 921
*/
function randomize(Array)
{
	if(level.script == "zm_stalingrad" && Array.size == 6 && Array[0] == "armory" && Array[1] == "barracks" && Array[2] == "command" && Array[3] == "store" && Array[4] == "supply" && Array[5] == "tank")
	{
		for(i = 0; i < Array.size; i++)
		{
			j = RandomInt(Array.size);
			temp = Array[i];
			Array[i] = Array[j];
			Array[j] = temp;
		}
		thread function_a2831b40(Array);
		return Array;
	}
	else
	{
		for(i = 0; i < Array.size; i++)
		{
			j = RandomInt(Array.size);
			temp = Array[i];
			Array[i] = Array[j];
			Array[j] = temp;
		}
		return Array;
	}
}

/*
	Name: function_a2831b40
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x24B8
	Size: 0x308
	Parameters: 1
	Flags: None
	Line Number: 958
*/
function function_a2831b40(Array)
{
	var_cce5fe57 = [];
	var_cce5fe57["tank"] = (-2298.02, 2393.32, 565.44);
	var_cce5fe57["supply"] = (2395.94, 1992.94, -86.9631);
	var_cce5fe57["store"] = (-463.685, 1686.97, 86.6849);
	var_cce5fe57["command"] = (-551.929, 5277.22, 379.653);
	var_cce5fe57["barracks"] = (-555.07, 2970.95, 119.279);
	var_cce5fe57["armory"] = (1102.12, 3221.17, -88.4385);
	if(isdefined(level.var_462567fe))
	{
		foreach(hud in level.var_462567fe)
		{
			hud destroy();
		}
		level.var_462567fe = undefined;
	}
	level.var_462567fe = [];
	for(i = 0; i < Array.size; i++)
	{
		level.var_462567fe[i] = NewHudElem();
		level.var_462567fe[i].alpha = 1;
		level.var_462567fe[i].x = var_cce5fe57[Array[i]][0];
		level.var_462567fe[i].y = var_cce5fe57[Array[i]][1];
		level.var_462567fe[i].z = var_cce5fe57[Array[i]][2];
		level.var_462567fe[i] setWaypoint(0, "uie_t7_zm_hud_rnd_nmbr" + i + 1 + "_act", 1);
	}
	thread function_aa977b77();
}

/*
	Name: function_aa977b77
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x27C8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 998
*/
function function_aa977b77()
{
	level notify("hash_19ac98c8");
	level endon("hash_19ac98c8");
	level util::waittill_any_return("ee_timed_complete", "ee_timed_failed");
	foreach(hud in level.var_462567fe)
	{
		hud destroy();
	}
	level.var_462567fe = undefined;
}

/*
	Name: clamp_size
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x28A8
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 1020
*/
function clamp_size(Array, n_size)
{
	a_ret = [];
	for(i = 0; i < n_size; i++)
	{
		a_ret[i] = Array[i];
	}
	return a_ret;
}

/*
	Name: reverse
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2918
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1040
*/
function reverse(Array)
{
	a_array2 = [];
	for(i = Array.size - 1; i >= 0; i--)
	{
		a_array2[a_array2.size] = Array[i];
	}
	return a_array2;
}

/*
	Name: remove_keys
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2988
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 1060
*/
function remove_keys(Array)
{
	a_new = [];
	foreach(VAL in Array)
	{
		if(isdefined(VAL))
		{
			a_new[a_new.size] = VAL;
		}
	}
	return a_new;
}

/*
	Name: swap
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2A40
	Size: 0x60
	Parameters: 3
	Flags: None
	Line Number: 1083
*/
function swap(Array, index1, index2)
{
	temp = Array[index1];
	Array[index1] = Array[index2];
	Array[index2] = temp;
}

/*
	Name: pop
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2AA8
	Size: 0xC8
	Parameters: 3
	Flags: None
	Line Number: 1100
*/
function pop(Array, index, b_keep_keys)
{
	if(!isdefined(b_keep_keys))
	{
		b_keep_keys = 1;
	}
	if(Array.size > 0)
	{
		if(!isdefined(index))
		{
			keys = getArrayKeys(Array);
			index = keys[0];
		}
		if(isdefined(Array[index]))
		{
			ret = Array[index];
			ArrayRemoveIndex(Array, index, b_keep_keys);
			return ret;
			return;
		}
	}
	waittillframeend;
}

/*
	Name: pop_front
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2B78
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 1134
*/
function pop_front(Array, b_keep_keys)
{
	if(!isdefined(b_keep_keys))
	{
		b_keep_keys = 1;
	}
	keys = getArrayKeys(Array);
	index = keys[keys.size - 1];
	return pop(Array, index, b_keep_keys);
}

/*
	Name: push
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2C08
	Size: 0x108
	Parameters: 3
	Flags: None
	Line Number: 1155
*/
function push(Array, VAL, index)
{
	if(!isdefined(index))
	{
		index = 0;
		foreach(key in getArrayKeys(Array))
		{
			if(IsInt(key) && key >= index)
			{
				index = key + 1;
			}
		}
	}
	ArrayInsert(Array, VAL, index);
}

/*
	Name: push_front
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2D18
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 1181
*/
function push_front(Array, VAL)
{
	push(Array, VAL, 0);
}

/*
	Name: get_closest
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2D58
	Size: 0x40
	Parameters: 3
	Flags: None
	Line Number: 1196
*/
function get_closest(org, Array, dist)
{
	/#
		Assert(0, "Dev Block strings are not supported");
	#/
}

/*
	Name: get_farthest
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2DA0
	Size: 0x50
	Parameters: 3
	Flags: None
	Line Number: 1213
*/
function get_farthest(org, Array, dist)
{
	if(!isdefined(dist))
	{
		dist = undefined;
	}
	/#
		Assert(0, "Dev Block strings are not supported");
	#/
}

/*
	Name: closerFunc
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2DF8
	Size: 0x20
	Parameters: 2
	Flags: None
	Line Number: 1234
*/
function closerFunc(dist1, dist2)
{
	return dist1 >= dist2;
}

/*
	Name: fartherFunc
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2E20
	Size: 0x20
	Parameters: 2
	Flags: None
	Line Number: 1249
*/
function fartherFunc(dist1, dist2)
{
	return dist1 <= dist2;
}

/*
	Name: get_all_farthest
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2E48
	Size: 0xC8
	Parameters: 5
	Flags: None
	Line Number: 1264
*/
function get_all_farthest(org, Array, a_exclude, n_max, n_maxdist)
{
	if(!isdefined(n_max))
	{
		n_max = Array.size;
	}
	a_ret = exclude(Array, a_exclude);
	if(isdefined(n_maxdist))
	{
		a_ret = ArraySort(a_ret, org, 0, n_max, n_maxdist);
	}
	else
	{
		a_ret = ArraySort(a_ret, org, 0, n_max);
	}
	return a_ret;
}

/*
	Name: get_all_closest
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2F18
	Size: 0xD0
	Parameters: 5
	Flags: None
	Line Number: 1292
*/
function get_all_closest(org, Array, a_exclude, n_max, n_maxdist)
{
	if(!isdefined(n_max))
	{
		n_max = Array.size;
	}
	a_ret = exclude(Array, a_exclude);
	if(isdefined(n_maxdist))
	{
		a_ret = ArraySort(a_ret, org, 1, n_max, n_maxdist);
	}
	else
	{
		a_ret = ArraySort(a_ret, org, 1, n_max);
	}
	return a_ret;
}

/*
	Name: alphabetize
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x2FF0
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 1320
*/
function alphabetize(Array)
{
	return sort_by_value(Array, 1);
	ERROR: Exception occured: Stack empty.
}

/*
	Name: sort_by_value
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x3020
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 1336
*/
function sort_by_value(Array, b_lowest_first)
{
	if(!isdefined(b_lowest_first))
	{
		b_lowest_first = 0;
	}
	return merge_sort(Array, &_sort_by_value_compare_func, b_lowest_first);
}

/*
	Name: _sort_by_value_compare_func
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x3078
	Size: 0x40
	Parameters: 3
	Flags: None
	Line Number: 1355
*/
function _sort_by_value_compare_func(val1, val2, b_lowest_first)
{
	if(b_lowest_first)
	{
		return val1 < val2;
	}
	else
	{
		return val1 > val2;
	}
}

/*
	Name: sort_by_script_int
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x30C0
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 1377
*/
function sort_by_script_int(a_ents, b_lowest_first)
{
	if(!isdefined(b_lowest_first))
	{
		b_lowest_first = 0;
	}
	return merge_sort(a_ents, &_sort_by_script_int_compare_func, b_lowest_first);
}

/*
	Name: _sort_by_script_int_compare_func
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x3118
	Size: 0x68
	Parameters: 3
	Flags: None
	Line Number: 1396
*/
function _sort_by_script_int_compare_func(e1, e2, b_lowest_first)
{
	if(b_lowest_first)
	{
		return e1.script_int < e2.script_int;
	}
	else
	{
		return e1.script_int > e2.script_int;
	}
}

/*
	Name: merge_sort
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x3188
	Size: 0x1E8
	Parameters: 3
	Flags: None
	Line Number: 1418
*/
function merge_sort(current_list, func_sort, Param)
{
	if(current_list.size <= 1)
	{
		return current_list;
	}
	left = [];
	right = [];
	middle = current_list.size / 2;
	for(x = 0; x < middle; x++)
	{
		if(!isdefined(left))
		{
			left = [];
		}
		else if(!IsArray(left))
		{
			left = Array(left);
		}
		left[left.size] = current_list[x];
	}
	while(x < current_list.size)
	{
		if(!isdefined(right))
		{
			right = [];
		}
		else if(!IsArray(right))
		{
			right = Array(right);
		}
		right[right.size] = current_list[x];
		x++;
	}
	left = merge_sort(left, func_sort, Param);
	right = merge_sort(right, func_sort, Param);
	result = merge(left, right, func_sort, Param);
	return result;
}

/*
	Name: merge
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x3378
	Size: 0x198
	Parameters: 4
	Flags: None
	Line Number: 1468
*/
function merge(left, right, func_sort, Param)
{
	result = [];
	li = 0;
	ri = 0;
	while(li < left.size && ri < right.size)
	{
		b_result = undefined;
		if(isdefined(Param))
		{
			b_result = [[func_sort]](left[li], right[ri], Param);
		}
		else
		{
			b_result = [[func_sort]](left[li], right[ri]);
		}
		if(b_result)
		{
			result[result.size] = left[li];
			li++;
		}
		else
		{
			result[result.size] = right[ri];
			ri++;
		}
	}
	while(li < left.size)
	{
		result[result.size] = left[li];
		li++;
	}
	while(ri < right.size)
	{
		result[result.size] = right[ri];
		ri++;
	}
	return result;
}

/*
	Name: insertion_sort
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x3518
	Size: 0xC0
	Parameters: 3
	Flags: None
	Line Number: 1518
*/
function insertion_sort(a, compareFunc, VAL)
{
	if(!isdefined(a))
	{
		a = [];
		a[0] = VAL;
		return;
	}
	for(i = 0; i < a.size; i++)
	{
		if([[compareFunc]](a[i], VAL) <= 0)
		{
			ArrayInsert(a, VAL, i);
			return;
		}
	}
	a[a.size] = VAL;
}

/*
	Name: spread_all
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x35E0
	Size: 0x1C0
	Parameters: 7
	Flags: None
	Line Number: 1547
*/
function spread_all(entities, func, arg1, arg2, arg3, arg4, arg5)
{
	/#
		Assert(isdefined(entities), "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(func), "Dev Block strings are not supported");
	#/
	if(IsArray(entities))
	{
		foreach(ent in entities)
		{
			if(isdefined(ent))
			{
				util::single_thread(ent, func, arg1, arg2, arg3, arg4, arg5);
			}
			wait(RandomFloatRange(0.06666666, 0.1333333));
		}
	}
	else
	{
		util::single_thread(entities, func, arg1, arg2, arg3, arg4, arg5);
		wait(RandomFloatRange(0.06666666, 0.1333333));
	}
}

/*
	Name: wait_till_touching
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x37A8
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 1583
*/
function wait_till_touching(a_ents, e_volume)
{
	while(!is_touching(a_ents, e_volume))
	{
		wait(0.05);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: is_touching
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x37F0
	Size: 0xA8
	Parameters: 2
	Flags: None
	Line Number: 1603
*/
function is_touching(a_ents, e_volume)
{
	foreach(e_ent in a_ents)
	{
		if(!e_ent istouching(e_volume))
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: contains
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x38A0
	Size: 0xC0
	Parameters: 2
	Flags: None
	Line Number: 1625
*/
function contains(var_8aeaac2c, value)
{
	if(IsArray(var_8aeaac2c))
	{
		foreach(element in var_8aeaac2c)
		{
			if(element === value)
			{
				return 1;
			}
		}
		return 0;
	}
	return var_8aeaac2c === value;
}

/*
	Name: _filter_dead
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x3968
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 1651
*/
function _filter_dead(VAL)
{
	return isalive(VAL);
}

/*
	Name: _filter_classname
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x3998
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 1666
*/
function _filter_classname(VAL, arg)
{
	return IsSubStr(VAL.classname, arg);
}

/*
	Name: function_1e686f36
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x39D8
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 1681
*/
function function_1e686f36(Array, compare_func)
{
	return function_8c158a48(Array, 0, Array.size - 1, compare_func);
}

/*
	Name: function_8c158a48
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x3A20
	Size: 0x1E0
	Parameters: 4
	Flags: None
	Line Number: 1696
*/
function function_8c158a48(Array, start, end, compare_func)
{
	i = start;
	K = end;
	if(!isdefined(compare_func))
	{
		compare_func = &function_1cde8a52;
	}
	if(end - start >= 1)
	{
		pivot = Array[start];
		while(K > i)
		{
			while([[compare_func]](Array[i], pivot) && i <= end && K > i)
			{
				i++;
			}
			while(![[compare_func]](Array[K], pivot) && K >= start && K >= i)
			{
				K--;
			}
			if(K > i)
			{
				swap(Array, i, K);
			}
		}
		swap(Array, start, K);
		Array = function_8c158a48(Array, start, K - 1, compare_func);
		Array = function_8c158a48(Array, K + 1, end, compare_func);
	}
	else
	{
		return Array;
	}
	return Array;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1cde8a52
	Namespace: Array
	Checksum: 0x424F4353
	Offset: 0x3C08
	Size: 0x1E
	Parameters: 2
	Flags: None
	Line Number: 1744
*/
function function_1cde8a52(left, right)
{
	return left <= right;
}

