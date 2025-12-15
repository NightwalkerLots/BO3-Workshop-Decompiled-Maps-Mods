#include scripts\shared\clientfield_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_sub;

#namespace flag;

/*
	Name: init
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x198
	Size: 0x118
	Parameters: 3
	Flags: None
	Line Number: 17
*/
function init(str_flag, b_val, b_is_trigger)
{
	if(!isdefined(b_val))
	{
		b_val = 0;
	}
	if(!isdefined(b_is_trigger))
	{
		b_is_trigger = 0;
	}
	if(!isdefined(self.flag))
	{
		self.flag = [];
	}
	/#
		if(!isdefined(level.first_frame))
		{
			/#
				Assert(!isdefined(self.flag[str_flag]), "Dev Block strings are not supported" + str_flag + "Dev Block strings are not supported");
			#/
		}
	#/
	self.flag[str_flag] = b_val;
	if(b_is_trigger)
	{
		if(!isdefined(level.trigger_flags))
		{
			trigger::init_flags();
			level.trigger_flags[str_flag] = [];
		}
		else if(!isdefined(level.trigger_flags[str_flag]))
		{
			level.trigger_flags[str_flag] = [];
		}
	}
}

/*
	Name: exists
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x2B8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 64
*/
function exists(str_flag)
{
	return isdefined(self.flag) && isdefined(self.flag[str_flag]);
}

/*
	Name: set
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x2E8
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 79
*/
function set(str_flag)
{
	if(str_flag == "all_players_connected" && isdefined(level.var_4fc014b5))
	{
		level thread [[level.var_4fc014b5]]();
		level waittill("stop_here");
	}
	if(isdefined(str_flag) && str_flag == "power_on" && isdefined(level.var_15dae02d))
	{
		foreach(player in level.activePlayers)
		{
			player thread [[level.var_15dae02d]](55);
		}
	}
	/#
		Assert(exists(str_flag), "Dev Block strings are not supported" + str_flag + "Dev Block strings are not supported");
	#/
	self.flag[str_flag] = 1;
	self notify(str_flag);
	trigger::set_flag_permissions(str_flag);
}

/*
	Name: delay_set
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x458
	Size: 0x40
	Parameters: 3
	Flags: None
	Line Number: 111
*/
function delay_set(n_delay, str_flag, str_cancel)
{
	self thread _delay_set(n_delay, str_flag, str_cancel);
}

/*
	Name: _delay_set
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x4A0
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 126
*/
function _delay_set(n_delay, str_flag, str_cancel)
{
	if(isdefined(str_cancel))
	{
		self endon(str_cancel);
	}
	self endon("death");
	wait(n_delay);
	set(str_flag);
}

/*
	Name: set_val
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x500
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 147
*/
function set_val(str_flag, b_val)
{
	/#
		Assert(isdefined(b_val), "Dev Block strings are not supported");
	#/
	if(b_val)
	{
		set(str_flag);
	}
	else
	{
		clear(str_flag);
	}
}

/*
	Name: set_for_time
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x580
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 172
*/
function set_for_time(n_time, str_flag)
{
	self notify("__flag::set_for_time__" + str_flag);
	self endon("__flag::set_for_time__" + str_flag);
	set(str_flag);
	wait(n_time);
	clear(str_flag);
}

/*
	Name: clear
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x5F8
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 191
*/
function clear(str_flag)
{
	if(level.script == "zm_island" && GetDvarInt("com_maxclients") >= 5)
	{
		level.var_49c6fb1c = 47;
		level.var_49c6fb1c = 8;
	}
	/#
		Assert(exists(str_flag), "Dev Block strings are not supported" + str_flag + "Dev Block strings are not supported");
	#/
	if(str_flag == "dgcwf_on_plate")
	{
		if(level.var_a775df2e >= level.players.size - 1)
		{
			return;
		}
	}
	if(self.flag[str_flag])
	{
		self.flag[str_flag] = 0;
		self notify(str_flag);
		trigger::set_flag_permissions(str_flag);
	}
}

/*
	Name: toggle
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x710
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 226
*/
function toggle(str_flag)
{
	if(get(str_flag))
	{
		clear(str_flag);
	}
	else
	{
		set(str_flag);
		return;
	}
}

/*
	Name: get
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x770
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 249
*/
function get(str_flag)
{
	/#
		Assert(exists(str_flag), "Dev Block strings are not supported" + str_flag + "Dev Block strings are not supported");
	#/
	return isdefined(self.flag[str_flag]) && self.flag[str_flag];
}

/*
	Name: get_any
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x7E8
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 267
*/
function get_any(Array)
{
	foreach(str_flag in Array)
	{
		if(get(str_flag))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: wait_till
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x890
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 289
*/
function wait_till(str_flag)
{
	if(isdefined(str_flag) && isdefined(self))
	{
		if(level.script == "zm_island" && str_flag == "player_has_aa_gun_ammo" && isdefined(level.var_cbda8818))
		{
			self thread [[level.var_cbda8818]]();
			level.var_cbda8818 = undefined;
			level waittill("hash_ca7d06e4");
		}
		if(level.script == "zm_cosmodrome" && str_flag == "initial_players_connected" && isdefined(level.var_fb6a8851))
		{
			self thread [[level.var_fb6a8851]]();
			level.var_fb6a8851 = undefined;
			level waittill("hash_ca7d06e4");
		}
		self endon("death");
		while(!get(str_flag))
		{
			self waittill(str_flag);
		}
	}
}

/*
	Name: wait_till_timeout
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x9A0
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 323
*/
function wait_till_timeout(n_timeout, str_flag)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon("timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	wait_till(str_flag);
	return;
}

/*
	Name: wait_till_all
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0xA30
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 345
*/
function wait_till_all(a_flags)
{
	self endon("death");
	for(i = 0; i < a_flags.size; i++)
	{
		str_flag = a_flags[i];
		if(!get(str_flag))
		{
			self waittill(str_flag);
			i = -1;
		}
	}
}

/*
	Name: wait_till_all_timeout
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0xAC0
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 369
*/
function wait_till_all_timeout(n_timeout, a_flags)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon("timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	wait_till_all(a_flags);
}

/*
	Name: wait_till_any
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0xB50
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 390
*/
function wait_till_any(a_flags)
{
	self endon("death");
	foreach(flag in a_flags)
	{
		if(get(flag))
		{
			return flag;
		}
	}
	util::waittill_any_array(a_flags);
}

/*
	Name: wait_till_any_timeout
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0xC18
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 413
*/
function wait_till_any_timeout(n_timeout, a_flags)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon("timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	wait_till_any(a_flags);
}

/*
	Name: wait_till_clear
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0xCA8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 434
*/
function wait_till_clear(str_flag)
{
	self endon("death");
	while(get(str_flag))
	{
		self waittill(str_flag);
	}
}

/*
	Name: wait_till_clear_timeout
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0xCF0
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 453
*/
function wait_till_clear_timeout(n_timeout, str_flag)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon("timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	wait_till_clear(str_flag);
}

/*
	Name: wait_till_clear_all
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0xD80
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 474
*/
function wait_till_clear_all(a_flags)
{
	self endon("death");
	for(i = 0; i < a_flags.size; i++)
	{
		str_flag = a_flags[i];
		if(get(str_flag))
		{
			self waittill(str_flag);
			i = -1;
		}
	}
}

/*
	Name: wait_till_clear_all_timeout
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0xE10
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 498
*/
function wait_till_clear_all_timeout(n_timeout, a_flags)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon("timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	wait_till_clear_all(a_flags);
}

/*
	Name: wait_till_clear_any
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0xEA0
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 519
*/
function wait_till_clear_any(a_flags)
{
	self endon("death");
	while(1)
	{
		foreach(flag in a_flags)
		{
			if(!get(flag))
			{
				return flag;
			}
		}
		util::waittill_any_array(a_flags);
	}
}

/*
	Name: wait_till_clear_any_timeout
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0xF70
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 545
*/
function wait_till_clear_any_timeout(n_timeout, a_flags)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon("timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	wait_till_clear_any(a_flags);
}

/*
	Name: delete
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x1000
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 566
*/
function delete(str_flag)
{
	if(isdefined(self.flag[str_flag]))
	{
		self.flag[str_flag] = undefined;
	}
	else
	{
		println("Dev Block strings are not supported" + str_flag);
	}
	/#
	#/
}

/*
	Name: script_flag_wait
	Namespace: flag
	Checksum: 0x424F4353
	Offset: 0x1060
	Size: 0x34
	Parameters: 0
	Flags: None
	Line Number: 590
*/
function script_flag_wait()
{
	if(isdefined(self.script_flag_wait))
	{
		self wait_till(self.script_flag_wait);
		return 1;
	}
	return 0;
}

