#include scripts\codescripts\struct;
#include scripts\shared\flag_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_utility;

#namespace namespace_ef480314;

/*
	Name: __init__sytem__
	Namespace: namespace_ef480314
	Checksum: 0x424F4353
	Offset: 0x1B0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_firing_on_all_cylinders", &__init__, undefined, "bgb");
}

/*
	Name: __init__
	Namespace: namespace_ef480314
	Checksum: 0x424F4353
	Offset: 0x1F0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	bgb::register("zm_bgb_firing_on_all_cylinders", "activated", 1, undefined, undefined, undefined, &activation);
	zm::register_player_damage_callback(&function_87b6f6c3);
}

/*
	Name: activation
	Namespace: namespace_ef480314
	Checksum: 0x424F4353
	Offset: 0x270
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function activation()
{
	self endon("disconnect");
	self endon("death");
	self bgb::run_timer(120);
}

/*
	Name: function_87b6f6c3
	Namespace: namespace_ef480314
	Checksum: 0x424F4353
	Offset: 0x2B0
	Size: 0x110
	Parameters: 11
	Flags: None
	Line Number: 74
*/
function function_87b6f6c3(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex)
{
	if(bgb::is_active("zm_bgb_firing_on_all_cylinders"))
	{
		if(iDamage > 0)
		{
			if(self.score == 0)
			{
				self bgb::take();
				return iDamage;
			}
			else
			{
				cost = function_ddec495f(iDamage);
				self zm_score::minus_to_player_score(cost);
				self bgb::do_one_shot_use(1);
				return 0;
			}
		}
	}
	return -1;
}

/*
	Name: function_ddec495f
	Namespace: namespace_ef480314
	Checksum: 0x424F4353
	Offset: 0x3C8
	Size: 0x32
	Parameters: 1
	Flags: None
	Line Number: 107
*/
function function_ddec495f(iDamage)
{
	if(math::cointoss())
	{
		return 10;
	}
	else
	{
		return 50;
	}
	return iDamage;
}

