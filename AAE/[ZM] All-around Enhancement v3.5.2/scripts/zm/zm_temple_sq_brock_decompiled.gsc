#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\zm_temple_sq;

#namespace namespace_abd6a8a5;

/*
	Name: init
	Namespace: namespace_abd6a8a5
	Checksum: 0x424F4353
	Offset: 0x228
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 21
*/
function init()
{
	level flag::init("radio_4_played");
	level._brock_naglines = [];
	level._brock_corpse_locations = [];
	level._radio_structs = struct::get_array("sq_radios", "targetname");
}

/*
	Name: delete_radio_internal
	Namespace: namespace_abd6a8a5
	Checksum: 0x424F4353
	Offset: 0x298
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function delete_radio_internal()
{
	if(isdefined(level._active_sq_radio))
	{
		level._active_sq_radio.trigger delete();
		level._active_sq_radio stopsounds();
		util::wait_network_frame();
		level._active_sq_radio delete();
		level._active_sq_radio = undefined;
	}
}

/*
	Name: delete_radio
	Namespace: namespace_abd6a8a5
	Checksum: 0x424F4353
	Offset: 0x320
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function delete_radio()
{
	level thread delete_radio_internal();
}

/*
	Name: trig_thread
	Namespace: namespace_abd6a8a5
	Checksum: 0x424F4353
	Offset: 0x348
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function trig_thread()
{
	self endon("death");
	while(1)
	{
		self waittill("trigger");
		self.owner_ent notify("triggered");
	}
	return;
}

/*
	Name: radio_debug
	Namespace: namespace_abd6a8a5
	Checksum: 0x424F4353
	Offset: 0x390
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function radio_debug()
{
	self endon("death");
	level endon("radio_7_played");
	/#
		while(!(isdefined(level.disable_print3d_ent) && level.disable_print3d_ent))
		{
			print3d(self.origin, "Dev Block strings are not supported", (0, 255, 255), 1);
			wait(1);
		}
		return;
	#/
	ERROR: Exception occured: Stack empty.
}

/*
	Name: radio9_override
	Namespace: namespace_abd6a8a5
	Checksum: 0x424F4353
	Offset: 0x408
	Size: 0x348
	Parameters: 1
	Flags: None
	Line Number: 122
*/
function radio9_override(struct)
{
	self notify("overridden");
	self endon("death");
	self.trigger delete();
	self ghost();
	sidequest = level._zombie_sidequests["sq"];
	if(sidequest.num_reps >= 3)
	{
		return;
	}
	level waittill("picked_up");
	level waittill("flush_done");
	self show();
	for(target = struct.target; isdefined(target); target = struct.target)
	{
		struct = struct::get(target, "targetname");
		time = struct.script_float;
		if(!isdefined(time))
		{
			time = 1;
		}
		self moveto(struct.origin, time, time / 10);
		self waittill("movedone");
	}
	self.trigger = spawn("trigger_radius_use", self.origin + VectorScale((0, 0, 1), 12), 0, 64, 72);
	self.trigger TriggerIgnoreTeam();
	self.trigger.radius = 64;
	self.trigger.height = 72;
	self.trigger setcursorhint("HINT_NOICON");
	self.trigger.owner_ent = self;
	self.trigger thread trig_thread();
	self waittill("triggered");
	snd = "vox_radio_egg_" + self.script_int - 1;
	var_53a95046 = soundgetplaybacktime(snd);
	thread namespace_cc012897::Send(snd, "all", var_53a95046);
	self playsound(snd);
	self PlayLoopSound("vox_radio_egg_snapshot", 1);
	wait(self.manual_wait);
	self StopLoopSound(1);
	level flag::set("radio_9_played");
}

/*
	Name: radio7_override
	Namespace: namespace_abd6a8a5
	Checksum: 0x424F4353
	Offset: 0x758
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 175
*/
function radio7_override(struct)
{
	self endon("death");
	self waittill("triggered");
	level flag::set("radio_7_played");
}

/*
	Name: radio4_override
	Namespace: namespace_abd6a8a5
	Checksum: 0x424F4353
	Offset: 0x7A8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 192
*/
function radio4_override(struct)
{
	self endon("death");
	self waittill("triggered");
	level flag::set("radio_4_played");
}

/*
	Name: radio2_override
	Namespace: namespace_abd6a8a5
	Checksum: 0x424F4353
	Offset: 0x7F8
	Size: 0x1D0
	Parameters: 1
	Flags: None
	Line Number: 209
*/
function radio2_override(struct)
{
	self endon("death");
	self notify("overridden");
	self waittill("triggered");
	var_8e0fe378 = level._player_who_pressed_the_switch.characterindex;
	if(!isdefined(var_8e0fe378))
	{
		var_8e0fe378 = 0;
	}
	var_bc7547cb = "a";
	switch(var_8e0fe378)
	{
		case 0:
		{
			var_bc7547cb = "a";
			break;
		}
		case 1:
		{
			var_bc7547cb = "b";
			break;
		}
		case 2:
		{
			var_bc7547cb = "d";
			break;
		}
		case 3:
		{
			var_bc7547cb = "c";
			break;
		}
	}
	snd = "vox_radio_egg_" + self.script_int - 1 + "" + var_bc7547cb;
	var_53a95046 = soundgetplaybacktime(snd);
	thread namespace_cc012897::Send(snd, "all", var_53a95046);
	self playsoundwithnotify(snd, "radiodone");
	self PlayLoopSound("vox_radio_egg_snapshot", 1);
	self waittill("radiodone");
	self StopLoopSound(1);
}

/*
	Name: radio_thread
	Namespace: namespace_abd6a8a5
	Checksum: 0x424F4353
	Offset: 0x9D0
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 262
*/
function radio_thread()
{
	self endon("death");
	self endon("overridden");
	self thread radio_debug();
	self waittill("triggered");
	snd = "vox_radio_egg_" + self.script_int - 1;
	var_53a95046 = soundgetplaybacktime(snd);
	thread namespace_cc012897::Send(snd, "all", var_53a95046);
	self playsound(snd);
	self PlayLoopSound("vox_radio_egg_snapshot", 1);
	wait(self.manual_wait);
	self StopLoopSound(1);
}

/*
	Name: create_radio
	Namespace: namespace_abd6a8a5
	Checksum: 0x424F4353
	Offset: 0xAD8
	Size: 0x2C8
	Parameters: 2
	Flags: None
	Line Number: 287
*/
function create_radio(radio_num, thread_func)
{
	delete_radio();
	radio_struct = undefined;
	for(i = 0; i < level._radio_structs.size; i++)
	{
		if(level._radio_structs[i].script_int == radio_num)
		{
			radio_struct = level._radio_structs[i];
			break;
		}
	}
	if(!isdefined(radio_struct))
	{
		/#
			println("Dev Block strings are not supported" + radio_num);
			return;
		#/
	}
	radio = spawn("script_model", radio_struct.origin);
	radio.angles = radio_struct.angles;
	radio SetModel("p7_zm_sha_recorder_digital");
	radio.script_int = radio_struct.script_int;
	radio.script_noteworthy = radio_struct.script_noteworthy;
	radio set_manual_wait_time(radio_num);
	radio.trigger = spawn("trigger_radius_use", radio.origin + VectorScale((0, 0, 1), 12), 0, 64, 72);
	radio.trigger TriggerIgnoreTeam();
	radio.trigger.radius = 64;
	radio.trigger.height = 72;
	radio.trigger setcursorhint("HINT_NOICON");
	radio.trigger.owner_ent = radio;
	radio.trigger thread trig_thread();
	radio thread radio_thread();
	if(isdefined(thread_func))
	{
		radio thread [[thread_func]](radio_struct);
	}
	level._active_sq_radio = radio;
}

/*
	Name: set_manual_wait_time
	Namespace: namespace_abd6a8a5
	Checksum: 0x424F4353
	Offset: 0xDA8
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 337
*/
function set_manual_wait_time(num)
{
	if(!isdefined(num))
	{
		num = 1;
	}
	waittime = 45;
	switch(num)
	{
		case 1:
		{
			waittime = 113;
			break;
		}
		case 2:
		{
			waittime = 95;
			break;
		}
		case 3:
		{
			waittime = 20;
			break;
		}
		case 4:
		{
			waittime = 58;
			break;
		}
		case 5:
		{
			waittime = 74;
			break;
		}
		case 6:
		{
			waittime = 35;
			break;
		}
		case 7:
		{
			waittime = 40;
			break;
		}
		case 8:
		{
			waittime = 39;
			break;
		}
		case 9:
		{
			waittime = 76;
			break;
		}
	}
	self.manual_wait = waittime;
}

