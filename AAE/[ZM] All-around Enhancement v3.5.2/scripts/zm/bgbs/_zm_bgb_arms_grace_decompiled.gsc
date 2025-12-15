#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;

#namespace namespace_fec23565;

/*
	Name: __init__sytem__
	Namespace: namespace_fec23565
	Checksum: 0x424F4353
	Offset: 0x1C0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_arms_grace", &__init__, undefined, "bgb");
}

/*
	Name: __init__
	Namespace: namespace_fec23565
	Checksum: 0x424F4353
	Offset: 0x200
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	bgb::register("zm_bgb_arms_grace", "rounds", 5, &enable, undefined, undefined);
	return;
}

/*
	Name: enable
	Namespace: namespace_fec23565
	Checksum: 0x424F4353
	Offset: 0x260
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function enable()
{
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	self endon("hash_994d5e9e");
	self thread function_1260a020();
	if(bgb::function_f345a8ce("zm_bgb_arms_grace"))
	{
		return;
	}
	zombies = GetEntArray("zombie", "targetname");
	foreach(zombie in zombies)
	{
		if(zombie function_9035b2bc())
		{
			zombie.no_gib = 1;
			zombie DetachAll();
			zombie SetModel("c_zom_dlc_richtofen_cin_fb");
		}
	}
	spawner::add_global_spawn_function("axis", &function_7c335d0e);
}

/*
	Name: function_1260a020
	Namespace: namespace_fec23565
	Checksum: 0x424F4353
	Offset: 0x3F0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 86
*/
function function_1260a020()
{
	self util::waittill_any("disconnect", "bled_out", "bgb_update");
	if(bgb::function_72936116("zm_bgb_arms_grace"))
	{
		return;
	}
	spawner::remove_global_spawn_function("axis", &function_7c335d0e);
}

/*
	Name: function_7c335d0e
	Namespace: namespace_fec23565
	Checksum: 0x424F4353
	Offset: 0x478
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_7c335d0e()
{
	if(self function_9035b2bc())
	{
		wait(0.1);
		self.no_gib = 1;
		self DetachAll();
		self SetModel("c_zom_dlc_richtofen_cin_fb");
	}
}

/*
	Name: function_9035b2bc
	Namespace: namespace_fec23565
	Checksum: 0x424F4353
	Offset: 0x4F0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 127
*/
function function_9035b2bc()
{
	if(isdefined(self.animName) && (self.animName == "sonic_zombie" || self.animName == "napalm_zombie"))
	{
		return 1;
	}
	if(isdefined(self.archetype))
	{
		switch(self.archetype)
		{
			case "zombie":
			{
				return 1;
				break;
			}
			case "zombie_napalm":
			{
				return 1;
				break;
			}
			case "zombie_sonic":
			{
				return 1;
				break;
			}
			case "zombie_quad":
			{
				return 1;
				break;
			}
			case "apothicon_fury":
			{
				return 1;
				break;
			}
			case "keeper":
			{
				return 1;
				break;
			}
			case "astronaut":
			{
				return 1;
				break;
			}
		}
	}
	return 0;
}

