#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;

#namespace zm_trap_fire;

/*
	Name: __init__sytem__
	Namespace: zm_trap_fire
	Checksum: 0xEB99FE4C
	Offset: 0x188
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_trap_fire", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_trap_fire
	Checksum: 0xACC3A2F0
	Offset: 0x1C8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	// Could not fully decompile function; skipped
}

/*
	Name: trap_fx_monitor
	Namespace: zm_trap_fire
	Checksum: 0x1E7CF13
	Offset: 0x2D0
	Size: 0x178
	Parameters: 7
	Flags: None
	Line Number: 48
*/
function trap_fx_monitor(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	exploder_name = "trap_fire_" + fieldName;
	if(newVal)
	{
		exploder::exploder(exploder_name);
		continue;
	}
	exploder::stop_exploder(exploder_name);
	fire_points = struct::get_array(fieldName, "targetname");
	foreach(point in fire_points)
	{
		if(!isdefined(point.script_noteworthy))
		{
			if(newVal)
			{
				point thread fire_trap_fx();
				continue;
			}
			point thread stop_trap_fx();
		}
	}
}

/*
	Name: fire_trap_fx
	Namespace: zm_trap_fire
	Checksum: 0x80FF539C
	Offset: 0x450
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 82
*/
function fire_trap_fx()
{
	ang = self.angles;
	FORWARD = AnglesToForward(ang);
	up = anglesToUp(ang);
	if(isdefined(self.loopFX) && self.loopFX.size)
	{
		stop_trap_fx();
	}
	if(!isdefined(self.loopFX))
	{
		self.loopFX = [];
	}
	players = GetLocalPlayers();
	for(i = 0; i < players.size; i++)
	{
		self.loopFX[i] = playFX(i, level._effect["fire_trap"], self.origin, FORWARD, up, 0);
	}
}

/*
	Name: stop_trap_fx
	Namespace: zm_trap_fire
	Checksum: 0xD90D4899
	Offset: 0x588
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 112
*/
function stop_trap_fx()
{
	players = GetLocalPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(self.loopFX[i]))
		{
			stopfx(i, self.loopFX[i]);
		}
	}
	self.loopFX = [];
}

