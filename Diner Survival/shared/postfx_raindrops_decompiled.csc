#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\filter_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;

#namespace namespace_1fbb8958;

/*
	Name: __init__sytem__
	Namespace: namespace_1fbb8958
	Checksum: 0x9BB1FAA
	Offset: 0x1C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("postfx_raindrops", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_1fbb8958
	Checksum: 0x7503E586
	Offset: 0x208
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function __init__()
{
	clientfield::register("toplayer", "toggle_rain_sprite", 1, 1, "int", &function_14dd7d5f, 0, 0);
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: namespace_1fbb8958
	Checksum: 0x46849E66
	Offset: 0x280
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 54
*/
function on_player_spawned(localClientNum)
{
	filter::init_filter_raindrops(self);
}

/*
	Name: function_14dd7d5f
	Namespace: namespace_1fbb8958
	Checksum: 0x5B1AB049
	Offset: 0x2B0
	Size: 0x88
	Parameters: 7
	Flags: None
	Line Number: 69
*/
function function_14dd7d5f(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		self thread function_99b9be7f(localClientNum);
		continue;
	}
	self thread function_32c14d5(localClientNum);
}

/*
	Name: function_32c14d5
	Namespace: namespace_1fbb8958
	Checksum: 0xD900EA09
	Offset: 0x340
	Size: 0x150
	Parameters: 1
	Flags: None
	Line Number: 89
*/
function function_32c14d5(localClientNum)
{
	self notify("hash_fb377a7e");
	self endon("entityshutdown");
	self endon("death");
	self endon("raining");
	self endon("hash_fb377a7e");
	function_ced36df6(localClientNum);
	if(isdefined(self.rainOpacity) && function_79ffe8d4(localClientNum) == level.vsmgr_default_info_name)
	{
		while(self.rainOpacity > 0 && function_79ffe8d4(localClientNum) == level.vsmgr_default_info_name)
		{
			self.rainOpacity = self.rainOpacity - 0.01;
			filter::set_filter_sprite_rain_opacity(self, 0, self.rainOpacity);
			filter::set_filter_sprite_rain_elapsed(self, 0, self getClientTime());
			wait(0.016);
		}
	}
	self.rainOpacity = 0;
	filter::disable_filter_sprite_rain(self, 0);
}

/*
	Name: function_99b9be7f
	Namespace: namespace_1fbb8958
	Checksum: 0x6D904D00
	Offset: 0x498
	Size: 0x180
	Parameters: 1
	Flags: None
	Line Number: 121
*/
function function_99b9be7f(localClientNum)
{
	self notify("raining");
	self endon("entityshutdown");
	self endon("death");
	self endon("raining");
	self endon("hash_fb377a7e");
	function_ced36df6(localClientNum);
	filter::init_filter_sgen_sprite_rain(self);
	if(!isdefined(self.rainOpacity))
	{
		self.rainOpacity = 0.2;
	}
	if(self.rainOpacity == 0)
	{
		filter::set_filter_sprite_rain_seed_offset(self, 0, 0.2);
	}
	filter::enable_filter_sgen_sprite_rain(self, 0);
	for(;;)
	{
		self.rainOpacity = self.rainOpacity + 0.001;
		if(self.rainOpacity > 1)
		{
			self.rainOpacity = 0.5;
		}
		function_ced36df6(localClientNum);
		filter::set_filter_sprite_rain_opacity(self, 0, self.rainOpacity);
		filter::set_filter_sprite_rain_elapsed(self, 0, self getClientTime());
		wait(0.016);
	}
}

/*
	Name: function_ced36df6
	Namespace: namespace_1fbb8958
	Checksum: 0x6F89667C
	Offset: 0x620
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 163
*/
function function_ced36df6(localClientNum)
{
	self endon("entityshutdown");
	self endon("death");
	self endon("raining");
	self endon("hash_fb377a7e");
	if(function_79ffe8d4(localClientNum) != level.vsmgr_default_info_name)
	{
		if(self.rainOpacity > 0)
		{
			self.rainOpacity = 0;
			filter::set_filter_sprite_rain_opacity(self, 0, self.rainOpacity);
		}
		while(function_79ffe8d4(localClientNum) != level.vsmgr_default_info_name)
		{
			wait(0.1);
		}
		wait(1);
	}
}

/*
	Name: function_79ffe8d4
	Namespace: namespace_1fbb8958
	Checksum: 0x6E927FF2
	Offset: 0x6F8
	Size: 0x76
	Parameters: 1
	Flags: Private
	Line Number: 194
*/
function private function_79ffe8d4(localClientNum)
{
	state = visionset_mgr::get_state(localClientNum, "overlay");
	curr_info = visionset_mgr::get_info("overlay", state.curr_slot);
	return curr_info.name;
}

