#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace namespace_1fbb8958;

/*
	Name: __init__sytem__
	Namespace: namespace_1fbb8958
	Checksum: 0x99D08A2B
	Offset: 0x170
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("postfx_raindrops", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_1fbb8958
	Checksum: 0x8E80CBE3
	Offset: 0x1B0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	level.var_decf8f97 = GetEntArray("trig_rain_indoor", "targetname");
	clientfield::register("toplayer", "toggle_rain_sprite", 1, 1, "int");
	Array::thread_all(level.var_decf8f97, &function_616514e5);
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: function_616514e5
	Namespace: namespace_1fbb8958
	Checksum: 0x76B42561
	Offset: 0x260
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function function_616514e5()
{
	self endon("death");
	for(;;)
	{
		self waittill("trigger", e_who);
		if(isPlayer(e_who) && (isdefined(e_who.var_6edc2e23) && e_who.var_6edc2e23))
		{
			e_who thread function_44591ed9(self);
		}
	}
}

/*
	Name: function_44591ed9
	Namespace: namespace_1fbb8958
	Checksum: 0x68FB2899
	Offset: 0x2E8
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 74
*/
function function_44591ed9(e_trigger)
{
	self endon("disconnect");
	e_trigger endon("death");
	self.var_6edc2e23 = 0;
	self clientfield::set_to_player("toggle_rain_sprite", 0);
	util::wait_till_not_touching(e_trigger, self);
	self.var_6edc2e23 = 1;
	self clientfield::set_to_player("toggle_rain_sprite", 1);
	return;
	ERROR: Bad function call
}

/*
	Name: on_player_spawned
	Namespace: namespace_1fbb8958
	Checksum: 0x7BA5F21
	Offset: 0x388
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function on_player_spawned()
{
	if(isdefined(level.inPrematchPeriod) && level.inPrematchPeriod)
	{
		level waittill("prematch_over");
	}
	self clientfield::set_to_player("toggle_rain_sprite", 1);
	self.var_6edc2e23 = 1;
}

