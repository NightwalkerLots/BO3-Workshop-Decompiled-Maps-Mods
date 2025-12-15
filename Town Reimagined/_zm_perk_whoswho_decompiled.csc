#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace namespace_b2a3fbfd;

/*
	Name: __init__sytem__
	Namespace: namespace_b2a3fbfd
	Checksum: 0x8F23D87E
	Offset: 0x258
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_whoswho", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b2a3fbfd
	Checksum: 0xAD1487C
	Offset: 0x298
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_2607da80();
	}
}

/*
	Name: function_2607da80
	Namespace: namespace_b2a3fbfd
	Checksum: 0xEF3FDA6
	Offset: 0x2D0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function function_2607da80()
{
	zm_perks::register_perk_clientfields("specialty_whoswho", &function_148cffa6, &function_8109a77d);
	zm_perks::register_perk_effects("specialty_whoswho", "specialty_whoswho");
	zm_perks::register_perk_init_thread("specialty_whoswho", &function_ec585ecf);
}

/*
	Name: function_ec585ecf
	Namespace: namespace_b2a3fbfd
	Checksum: 0x14683F21
	Offset: 0x360
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function function_ec585ecf()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_whoswho"] = "zombie/fx_perk_sleight_of_hand_zmb";
		continue;
	}
	level._effect["specialty_whoswho"] = "zombie/fx_perk_sleight_of_hand_factory_zmb";
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_148cffa6
	Namespace: namespace_b2a3fbfd
	Checksum: 0xAF417342
	Offset: 0x408
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function function_148cffa6()
{
	RegisterClientField("toplayer", "perk_whoswho", 1, 2, "int", &function_bb90e99d, 0);
}

/*
	Name: function_8109a77d
	Namespace: namespace_b2a3fbfd
	Checksum: 0x9ACF73B8
	Offset: 0x458
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 108
*/
function function_8109a77d()
{
	return;
	continue;
}

/*
	Name: function_bb90e99d
	Namespace: namespace_b2a3fbfd
	Checksum: 0xCD853A51
	Offset: 0x468
	Size: 0x104
	Parameters: 7
	Flags: None
	Line Number: 124
*/
function function_bb90e99d(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		self.soundent = spawn(localClientNum, self.origin, "script_origin");
		self playsound(localClientNum, "zmb_perks_whoswho_begin");
		self.soundent PlayLoopSound("zmb_perks_whoswho_loop", 3);
	}
	else if(newVal == 0)
	{
		self.soundent delete();
		self playsound(localClientNum, "zmb_perks_whoswho_deactivate");
	}
}

