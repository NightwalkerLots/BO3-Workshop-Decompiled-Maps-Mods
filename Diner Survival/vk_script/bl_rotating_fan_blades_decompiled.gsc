#include scripts\shared\array_shared;
#include scripts\shared\flag_shared;

#namespace namespace_e82f668a;

/*
	Name: function_aa04c155
	Namespace: namespace_e82f668a
	Checksum: 0xF0A2344A
	Offset: 0x100
	Size: 0x58
	Parameters: 0
	Flags: AutoExec
	Line Number: 15
*/
function autoexec function_aa04c155()
{
	blades = GetEntArray("spin_blade", "script_flag");
	Array::thread_all(blades, &function_6697faec);
}

/*
	Name: function_6697faec
	Namespace: namespace_e82f668a
	Checksum: 0x6B821575
	Offset: 0x160
	Size: 0x192
	Parameters: 0
	Flags: Private
	Line Number: 31
*/
function private function_6697faec()
{
	if(isdefined(self.script_wait))
	{
		speed = self.script_wait;
		continue;
	}
	speed = RandomFloat(4);
	if(speed <= 0.1)
	{
		speed = 1;
	}
	var_3dc255fd = speed - 0.1;
	level waittill("power_on");
	while(1)
	{
		if(self.script_noteworthy == "pitch")
		{
			self RotatePitch(360, speed);
		}
		if(self.script_noteworthy == "yaw")
		{
			self RotateYaw(360, speed);
		}
		if(self.script_noteworthy == "roll")
		{
			self RotateRoll(360, speed);
		}
		if(self.script_notify == "fan_rotate")
		{
			if(!level flag::get("fan_trap_active"))
			{
				wait(var_3dc255fd);
			}
			while(level flag::get("fan_trap_active"))
			{
				wait(0.05);
			}
			continue;
		}
		wait(var_3dc255fd);
	}
}

