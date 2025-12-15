#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;

#namespace zm_trap_electric;

/*
	Name: __init__sytem__
	Namespace: zm_trap_electric
	Checksum: 0x35157610
	Offset: 0x190
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_trap_electric", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_trap_electric
	Checksum: 0xA9BB8C7D
	Offset: 0x1D0
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	level._effect["zapper"] = "dlc0/factory/fx_elec_trap_factory";
	visionset_mgr::register_overlay_info_style_electrified("zm_trap_electric", 1, 15, 1.25);
	a_traps = struct::get_array("trap_electric", "targetname");
	foreach(trap in a_traps)
	{
		clientfield::register("world", trap.script_noteworthy, 1, 1, "int", &trap_fx_monitor, 0, 0);
	}
}

/*
	Name: trap_fx_monitor
	Namespace: zm_trap_electric
	Checksum: 0xC8D5A104
	Offset: 0x300
	Size: 0x178
	Parameters: 7
	Flags: None
	Line Number: 54
*/
function trap_fx_monitor(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	exploder_name = "trap_electric_" + fieldName;
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
				point thread electric_trap_fx();
				continue;
			}
			point thread stop_trap_fx();
		}
	}
}

/*
	Name: electric_trap_fx
	Namespace: zm_trap_electric
	Checksum: 0x47A1084
	Offset: 0x480
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 88
*/
function electric_trap_fx()
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
		self.loopFX[i] = playFX(i, level._effect["zapper"], self.origin, FORWARD, up, 0);
	}
}

/*
	Name: stop_trap_fx
	Namespace: zm_trap_electric
	Checksum: 0x98A39ABF
	Offset: 0x5B8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 118
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

