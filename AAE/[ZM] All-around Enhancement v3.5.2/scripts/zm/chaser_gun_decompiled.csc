#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\filter_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace namespace_b4c89eda;

/*
	Name: __init__sytem__
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x1D8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("chaser_gun", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x218
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	callback::on_localplayer_spawned(&watch_lockon);
	duplicate_render::set_dr_filter_offscreen("replay", 75, "replay_locked", undefined, 2, "mc/hud_outline_model_red", 0);
}

/*
	Name: watch_lockon
	Namespace: namespace_b4c89eda
	Checksum: 0x424F4353
	Offset: 0x278
	Size: 0x1C6
	Parameters: 1
	Flags: None
	Line Number: 53
*/
function watch_lockon(localClientNum)
{
	if(self != GetLocalPlayer(localClientNum))
	{
		return;
	}
	self notify("hash_8bbf4a7e");
	self endon("hash_8bbf4a7e");
	self endon("entityshutdown");
	self endon("disconnect");
	while(1)
	{
		self waittill("lockon_changed", state, target);
		if(isdefined(self.replay_lock) && (!isdefined(target) || self.replay_lock != target))
		{
			self.replay_lock duplicate_render::change_dr_flags(localClientNum, undefined, "replay_locked");
			self.replay_lock = undefined;
		}
		if(isdefined(target) && (target isPlayer() || target isai()) && isalive(target))
		{
			switch(state)
			{
				case 0:
				case 1:
				case 3:
				{
					target duplicate_render::change_dr_flags(localClientNum, undefined, "replay_locked");
					break;
				}
				case 2:
				case 4:
				{
					target duplicate_render::change_dr_flags(localClientNum, "replay_locked", undefined);
					self.replay_lock = target;
					break;
				}
			}
		}
	}
}

