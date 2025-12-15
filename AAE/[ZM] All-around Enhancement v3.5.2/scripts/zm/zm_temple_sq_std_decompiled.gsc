#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\zm_temple_sq;
#include scripts\zm\zm_temple_sq_brock;
#include scripts\zm\zm_temple_sq_skits;

#namespace namespace_7ea42b03;

/*
	Name: init
	Namespace: namespace_7ea42b03
	Checksum: 0x424F4353
	Offset: 0x318
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 22
*/
function init()
{
	zm_sidequests::declare_sidequest_stage("sq", "StD", &init_stage, &stage_logic, &exit_stage);
	zm_sidequests::set_stage_time_limit("sq", "StD", 300);
	zm_sidequests::declare_stage_asset_from_struct("sq", "StD", "sq_sad_trig", &function_3ea85f63);
	level flag::init("std_target_1");
	level flag::init("std_target_2");
	level flag::init("std_target_3");
	level flag::init("std_target_4");
	level flag::init("std_plot_vo_done");
	return;
}

/*
	Name: init_stage
	Namespace: namespace_7ea42b03
	Checksum: 0x424F4353
	Offset: 0x478
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function init_stage()
{
	util::clientNotify("SR");
	level flag::clear("std_target_1");
	level flag::clear("std_target_2");
	level flag::clear("std_target_3");
	level flag::clear("std_target_4");
	level flag::clear("std_plot_vo_done");
	level thread delayed_start_skit();
	level thread function_610191ea();
	namespace_abd6a8a5::delete_radio();
	return;
	ERROR: Bad function call
}

/*
	Name: delayed_start_skit
	Namespace: namespace_7ea42b03
	Checksum: 0x424F4353
	Offset: 0x580
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function delayed_start_skit()
{
	wait(0.5);
	level thread namespace_435c2400::start_skit("tt5");
}

/*
	Name: function_610191ea
	Namespace: namespace_7ea42b03
	Checksum: 0x424F4353
	Offset: 0x5B8
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 86
*/
function function_610191ea()
{
	level endon("hash_c511c0c0");
	struct = struct::get("sq_location_std", "targetname");
	if(!isdefined(struct))
	{
		return;
	}
	level.var_fc91036b = spawn("script_origin", struct.origin);
	level.var_fc91036b PlayLoopSound("evt_sq_std_waterthrash_loop", 2);
	level waittill("hash_77126d3d");
	level.var_fc91036b StopLoopSound(5);
	wait(5);
	level.var_fc91036b delete();
	level.var_fc91036b = undefined;
}

/*
	Name: function_63d30912
	Namespace: namespace_7ea42b03
	Checksum: 0x424F4353
	Offset: 0x6B0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 113
*/
function function_63d30912()
{
	/#
		self endon("death");
		self endon("hash_5d50fcb7");
		while(!(isdefined(level.disable_print3d_ent) && level.disable_print3d_ent))
		{
			print3d(self.origin, "Dev Block strings are not supported", VectorScale((0, 1, 0), 255), 1);
			wait(0.1);
		}
	#/
}

/*
	Name: function_3ea85f63
	Namespace: namespace_7ea42b03
	Checksum: 0x424F4353
	Offset: 0x728
	Size: 0x320
	Parameters: 0
	Flags: None
	Line Number: 136
*/
function function_3ea85f63()
{
	if(!isdefined(level.var_b19e3661))
	{
		level.var_b19e3661 = 0;
	}
	level.var_68e59898 = 1;
	self thread function_63d30912();
	self thread function_19fed3e();
	self thread function_c62997df();
	self thread function_1d8712b1();
	self playsound("evt_sq_std_spray_start");
	self PlayLoopSound("evt_sq_std_spray_loop", 1);
	trigger = spawn("trigger_damage", self.origin, 0, 32, 32);
	trigger.angles = self.angles + (0, 90, 90);
	var_a4ff74b9 = GetWeapon("bouncingbetty");
	attacker = undefined;
	while(1)
	{
		trigger waittill("damage", amount, attacker, dir, point, mod, tagName, modelName, partName, weaponName, dFlags, inflictor, chargeLevel);
		if(weaponName == var_a4ff74b9 && !level.var_b19e3661)
		{
			level.var_b19e3661 = 1;
			break;
		}
	}
	if(!isdefined(attacker))
	{
		attacker = GetPlayers()[0];
	}
	self notify("hash_5d50fcb7", attacker);
	self StopLoopSound(1);
	self playsound("evt_sq_std_spray_stop");
	level flag::set("std_target_" + self.script_int);
	util::clientNotify("S" + self.script_int);
	util::delay(0.1, undefined, &function_4fdfc508);
	trigger delete();
}

/*
	Name: function_4fdfc508
	Namespace: namespace_7ea42b03
	Checksum: 0x424F4353
	Offset: 0xA50
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function function_4fdfc508()
{
	level.var_b19e3661 = 0;
}

/*
	Name: function_1d8712b1
	Namespace: namespace_7ea42b03
	Checksum: 0x424F4353
	Offset: 0xA68
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 200
*/
function function_1d8712b1()
{
	self endon("death");
	level endon("hash_21d222c8");
	self waittill("hash_5d50fcb7", who);
	who thread zm_audio::create_and_play_dialog("eggs", "quest5", 1);
	level notify("hash_21d222c8");
}

/*
	Name: function_c62997df
	Namespace: namespace_7ea42b03
	Checksum: 0x424F4353
	Offset: 0xAE0
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 219
*/
function function_c62997df()
{
	self endon("death");
	level endon("hash_44d6d8df");
	level waittill("hash_99d9566e");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(self.origin) && DistanceSquared(self.origin, players[i].origin) <= 10000)
			{
				players[i] thread zm_audio::create_and_play_dialog("eggs", "quest5", 0);
				level notify("hash_44d6d8df");
				return;
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_19fed3e
	Namespace: namespace_7ea42b03
	Checksum: 0x424F4353
	Offset: 0xBF8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 250
*/
function function_19fed3e()
{
	self endon("death");
	level endon("hash_77126d3d");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(DistanceSquared(self.origin, players[i].origin) <= 10000)
			{
				level thread function_fd63e028(players[i]);
				level notify("hash_77126d3d");
				return;
			}
		}
		wait(0.1);
	}
}

/*
	Name: stage_logic
	Namespace: namespace_7ea42b03
	Checksum: 0x424F4353
	Offset: 0xCE0
	Size: 0x240
	Parameters: 0
	Flags: None
	Line Number: 280
*/
function stage_logic()
{
	level flag::wait_till("std_target_1");
	level flag::wait_till("std_target_2");
	level flag::wait_till("std_target_3");
	level flag::wait_till("std_target_4");
	players = GetPlayers();
	players[randomIntRange(0, players.size)] thread zm_audio::create_and_play_dialog("eggs", "quest5", 2);
	level waittill("waterfall");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i].var_b4fc5f8d) && players[i].var_b4fc5f8d == 1)
		{
			players[i] thread zm_audio::create_and_play_dialog("eggs", "quest5", 3);
		}
	}
	level notify("suspend_timer");
	level notify("raise_crystal_1");
	level notify("raise_crystal_2");
	level notify("raise_crystal_3");
	level notify("raise_crystal_4");
	level notify("raise_crystal_5", 1);
	level waittill("hash_ccdffdea");
	level flag::wait_till("std_plot_vo_done");
	wait(5);
	zm_sidequests::stage_completed("sq", "StD");
	return;
}

/*
	Name: exit_stage
	Namespace: namespace_7ea42b03
	Checksum: 0x424F4353
	Offset: 0xF28
	Size: 0x198
	Parameters: 1
	Flags: None
	Line Number: 320
*/
function exit_stage(success)
{
	targs = GetEntArray("sq_sad", "targetname");
	util::clientNotify("ksd");
	level flag::clear("std_target_1");
	level flag::clear("std_target_2");
	level flag::clear("std_target_3");
	level flag::clear("std_target_4");
	if(success)
	{
		namespace_abd6a8a5::create_radio(6);
		namespace_1e4bbaa5::spawn_skel();
	}
	else
	{
		namespace_abd6a8a5::create_radio(5);
		level thread namespace_435c2400::fail_skit();
	}
	if(isdefined(level.var_e650672d))
	{
		level.var_e650672d delete();
		level.var_e650672d = undefined;
	}
	if(isdefined(level.var_fc91036b))
	{
		level.var_fc91036b delete();
		level.var_fc91036b = undefined;
	}
}

/*
	Name: function_fd63e028
	Namespace: namespace_7ea42b03
	Checksum: 0x424F4353
	Offset: 0x10C8
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 360
*/
function function_fd63e028()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: function_2a0eb416
	Namespace: namespace_7ea42b03
	Checksum: 0x424F4353
	Offset: 0x1270
	Size: 0x1CE
	Parameters: 0
	Flags: None
	Line Number: 380
*/
function function_2a0eb416()
{
	level endon("hash_c511c0c0");
	count = 0;
	while(1)
	{
		level waittill("waterfall");
		if(!level flag::get("std_target_1") || !level flag::get("std_target_2") || !level flag::get("std_target_3") || !level flag::get("std_target_4"))
		{
			if(count < 1)
			{
				thread namespace_cc012897::Send("vox_egg_story_4_2", "all");
				level.var_e650672d playsoundwithnotify("vox_egg_story_4_2", "sounddone");
				level.var_e650672d waittill("sounddone");
				count++;
			}
		}
		else
		{
			thread namespace_cc012897::Send("vox_egg_story_4_3", "all");
			level.var_e650672d playsoundwithnotify("vox_egg_story_4_3", "sounddone");
			level.var_e650672d waittill("sounddone");
			break;
		}
	}
	level flag::set("std_plot_vo_done");
	level.var_e650672d delete();
	level.var_e650672d = undefined;
}

