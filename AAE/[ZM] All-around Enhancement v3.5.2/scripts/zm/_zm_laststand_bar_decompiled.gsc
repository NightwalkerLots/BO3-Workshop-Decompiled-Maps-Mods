#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;

#namespace namespace_dbf10a20;

/*
	Name: init
	Namespace: namespace_dbf10a20
	Checksum: 0x424F4353
	Offset: 0x1B0
	Size: 0xE8
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec init()
{
	var_8c310847 = GetDvarInt("com_maxclients");
	for(i = 0; i < var_8c310847; i++)
	{
		clientfield::register("world", "bleedout_bar" + i, 1, GetMinBitCountForNum(45), "int");
	}
	callback::on_laststand(&function_47867d47);
	if(var_8c310847 > 4)
	{
		callback::on_laststand(&function_e66e19c5);
	}
}

/*
	Name: function_e66e19c5
	Namespace: namespace_dbf10a20
	Checksum: 0x424F4353
	Offset: 0x2A0
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 43
*/
function function_e66e19c5()
{
	self notify("hash_e66e19c5");
	self endon("hash_e66e19c5");
	self endon("disconnect");
	self endon("death");
	self endon("player_revived");
	self endon("player_suicide");
	self endon("zombified");
	self endon("bled_out");
	while(self meleeButtonPressed())
	{
		player = self function_de148f21();
		if(isdefined(player))
		{
			SetDvar("tp", "" + self.entity_num + 1 + " " + player.entity_num + 1);
		}
		while(self meleeButtonPressed())
		{
			wait(0.05);
		}
		wait(0.5);
		wait(0.05);
	}
}

/*
	Name: function_47867d47
	Namespace: namespace_dbf10a20
	Checksum: 0x424F4353
	Offset: 0x3E0
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 79
*/
function function_47867d47()
{
	self notify("hash_47867d47");
	self endon("hash_47867d47");
	self endon("disconnect");
	self endon("death");
	self endon("player_revived");
	self endon("player_suicide");
	self endon("zombified");
	self endon("bled_out");
	if(self bgb::is_enabled("zm_bgb_phoenix_up"))
	{
		self thread zm_equipment::show_hint_text("^3[{+activate}]^7 " + MakeLocalizedString("MENU_USE_GOBBLEGUM"), 3);
	}
	self playsoundtoallbutplayer("player_down", self);
	player_num = self GetEntityNumber();
	while(!isdefined(self.bleedout_time))
	{
		wait(0.048);
	}
	while(1)
	{
		level clientfield::set("bleedout_bar" + player_num, function_4e918521(self.bleedout_time));
		oldVal = self.bleedout_time;
		while(self.bleedout_time == oldVal || self.bleedout_time > 45)
		{
			wait(0.048);
		}
		wait(0.048);
	}
}

/*
	Name: function_de148f21
	Namespace: namespace_dbf10a20
	Checksum: 0x424F4353
	Offset: 0x590
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 121
*/
function function_de148f21()
{
	if(isdefined(level.activePlayers))
	{
		eyePos = self GetEye();
		player_angles = self getPlayerAngles();
		var_27239834 = [];
		foreach(player in level.activePlayers)
		{
			if(player != self && Distance(player.origin, eyePos) > 300)
			{
				var_3f4b6f03 = util::within_fov(eyePos, player_angles, player GetTagOrigin("j_spinelower"), cos(5));
				if(var_3f4b6f03)
				{
					var_27239834[var_27239834.size] = player;
				}
			}
		}
		return ArrayGetClosest(eyePos, var_27239834);
		return;
	}
}

/*
	Name: function_4e918521
	Namespace: namespace_dbf10a20
	Checksum: 0x424F4353
	Offset: 0x730
	Size: 0x3C
	Parameters: 1
	Flags: None
	Line Number: 154
*/
function function_4e918521(timer)
{
	if(timer > 45)
	{
		return 45;
	}
	else
	{
		return Int(timer);
	}
}

