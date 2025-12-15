#include scripts\shared\system_shared;
#include scripts\zm\_zm_powerups;

#namespace namespace_97e0d569;

/*
	Name: __init__sytem__
	Namespace: namespace_97e0d569
	Checksum: 0x424F4353
	Offset: 0x100
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 15
*/
function autoexec __init__sytem__()
{
	system::register("share_point_powerup", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_97e0d569
	Checksum: 0x424F4353
	Offset: 0x140
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 30
*/
function __init__()
{
	zm_powerups::register_powerup("share_point_powerup", &function_47068a3a);
	if(ToLower(GetDvarString("g_gametype")) != "zcleansed")
	{
		zm_powerups::add_zombie_powerup("share_point_powerup", "zombie_z_money_icon", "", &function_95de5c30, 1, 0, 0);
	}
	modvar("zm_share", 1000);
}

/*
	Name: function_95de5c30
	Namespace: namespace_97e0d569
	Checksum: 0x424F4353
	Offset: 0x210
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function function_95de5c30()
{
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_595421f0
	Namespace: namespace_97e0d569
	Checksum: 0x424F4353
	Offset: 0x220
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 66
*/
function function_595421f0(points)
{
	self.score = self.score + points;
}

/*
	Name: function_47f70c4d
	Namespace: namespace_97e0d569
	Checksum: 0x424F4353
	Offset: 0x248
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 81
*/
function function_47f70c4d(points)
{
	self.score = self.score - points;
}

/*
	Name: function_47068a3a
	Namespace: namespace_97e0d569
	Checksum: 0x424F4353
	Offset: 0x270
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 96
*/
function function_47068a3a(player)
{
	player thread function_226bab7(GetDvarInt("zm_share"), GetDvarInt("zm_tex"));
}

/*
	Name: function_226bab7
	Namespace: namespace_97e0d569
	Checksum: 0x424F4353
	Offset: 0x2C8
	Size: 0x74
	Parameters: 2
	Flags: None
	Line Number: 111
*/
function function_226bab7(share, tex)
{
	if(!isdefined(share))
	{
		share = 1000;
	}
	if(!isdefined(tex))
	{
		tex = 10;
	}
	self function_595421f0(share);
	wait(0.01);
	self function_47f70c4d(tex);
}

