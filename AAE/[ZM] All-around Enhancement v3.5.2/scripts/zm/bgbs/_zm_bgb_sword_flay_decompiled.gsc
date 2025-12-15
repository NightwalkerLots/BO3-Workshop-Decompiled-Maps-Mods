#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_utility;

#namespace namespace_6caa802f;

/*
	Name: __init__sytem__
	Namespace: namespace_6caa802f
	Checksum: 0x424F4353
	Offset: 0x1B8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_sword_flay", &__init__, undefined, "bgb");
}

/*
	Name: __init__
	Namespace: namespace_6caa802f
	Checksum: 0x424F4353
	Offset: 0x1F8
	Size: 0xB0
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
	bgb::register("zm_bgb_sword_flay", "time", 150, &enable, &disable, undefined);
	bgb::function_3422638b("zm_bgb_sword_flay", &actor_damage_override);
	bgb::function_e22c6124("zm_bgb_sword_flay", &vehicle_damage_override);
}

/*
	Name: enable
	Namespace: namespace_6caa802f
	Checksum: 0x424F4353
	Offset: 0x2B0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function enable()
{
	self thread function_f86e4c3d("weapon_melee");
	self thread function_f86e4c3d("weapon_melee_charge");
}

/*
	Name: disable
	Namespace: namespace_6caa802f
	Checksum: 0x424F4353
	Offset: 0x300
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function disable()
{
	self notify("hash_52ce70c");
}

/*
	Name: function_f86e4c3d
	Namespace: namespace_6caa802f
	Checksum: 0x424F4353
	Offset: 0x320
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 84
*/
function function_f86e4c3d(var_cac16625)
{
	self endon("disconnect");
	self endon("bled_out");
	self endon("hash_52ce70c");
	while(1)
	{
		self waittill(var_cac16625, var_8f5a8751);
		if(function_866130c7(var_8f5a8751))
		{
			if(var_cac16625 === "weapon_melee_charge")
			{
				self function_1f7c6bb9(var_8f5a8751, 20, 40, 1);
			}
			else
			{
				self function_1f7c6bb9(var_8f5a8751, 50, 10);
			}
		}
	}
}

/*
	Name: function_48d44a46
	Namespace: namespace_6caa802f
	Checksum: 0x424F4353
	Offset: 0x3F0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 116
*/
function function_48d44a46()
{
	if(isdefined(self.archetype))
	{
		if(self.archetype == "zombie" || self.archetype == "zombie_dog" || self.archetype == "zombie_quad" || self.archetype == "apothicon_fury" || self.archetype == "keeper" || self.archetype == "spider" || self.archetype == "parasite")
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_1f7c6bb9
	Namespace: namespace_6caa802f
	Checksum: 0x424F4353
	Offset: 0x4A0
	Size: 0x3B8
	Parameters: 4
	Flags: None
	Line Number: 138
*/
function function_1f7c6bb9(var_8f5a8751, var_2b9d3880, var_48e9b3cc, var_cc3ddfd9)
{
	if(!isdefined(var_cc3ddfd9))
	{
		var_cc3ddfd9 = 0;
	}
	self endon("disconnect");
	self endon("bled_out");
	self endon("hash_52ce70c");
	var_2ed6f142 = self GetPlayerCameraPos();
	v_angles = self getPlayerAngles();
	var_7397b986 = VectorNormalize(AnglesToForward(v_angles));
	a_e_targets = GetAISpeciesArray(level.zombie_team, "all");
	a_e_targets = ArraySortClosest(a_e_targets, self.origin);
	var_5f96a3db = 0;
	if(var_cc3ddfd9)
	{
	}
	else
	{
	}
	var_9c0b2bd5 = 3;
	foreach(e_target in a_e_targets)
	{
		if(e_target function_48d44a46())
		{
			if(!isalive(e_target))
			{
				continue;
			}
			if(isdefined(e_target.ignore_nuke) && e_target.ignore_nuke)
			{
				continue;
			}
			if(isdefined(e_target.marked_for_death) && e_target.marked_for_death)
			{
				continue;
			}
			if(zm_utility::is_magic_bullet_shield_enabled(e_target))
			{
				continue;
			}
			test_origin = e_target GetCentroid();
			n_dist_sq = DistanceSquared(var_2ed6f142, test_origin);
			if(n_dist_sq > 10000 && !var_cc3ddfd9)
			{
				continue;
			}
			var_c04cadc7 = e_target SightConeTrace(var_2ed6f142, self, var_7397b986, var_2b9d3880);
			if(!var_c04cadc7)
			{
				continue;
			}
			util::wait_network_frame(1);
			e_target playsound("fly_melee_lungealt_knife");
			self playlocalsound("fly_melee_lungealt_victim_knife");
			e_target DoDamage(500, e_target.origin, self, undefined, undefined, "MOD_MELEE", 0, var_8f5a8751);
			var_5f96a3db++;
		}
		if(var_5f96a3db >= var_9c0b2bd5)
		{
			return;
		}
	}
}

/*
	Name: function_866130c7
	Namespace: namespace_6caa802f
	Checksum: 0x424F4353
	Offset: 0x860
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 214
*/
function function_866130c7(var_8f5a8751)
{
	if(IsSubStr(var_8f5a8751.name, "knife"))
	{
		return 1;
	}
	return 0;
}

/*
	Name: actor_damage_override
	Namespace: namespace_6caa802f
	Checksum: 0x424F4353
	Offset: 0x8A8
	Size: 0x118
	Parameters: 12
	Flags: None
	Line Number: 233
*/
function actor_damage_override(inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(!isalive(self))
	{
		return damage;
	}
	if(isdefined(self.ignore_nuke) && self.ignore_nuke)
	{
		return damage;
	}
	if(isdefined(self.marked_for_death) && self.marked_for_death)
	{
		return damage;
	}
	if(zm_utility::is_magic_bullet_shield_enabled(self))
	{
		return damage;
	}
	if(self function_48d44a46())
	{
		if(meansOfDeath === "MOD_MELEE")
		{
			damage = self.health;
		}
	}
	return damage;
}

/*
	Name: vehicle_damage_override
	Namespace: namespace_6caa802f
	Checksum: 0x424F4353
	Offset: 0x9C8
	Size: 0x130
	Parameters: 15
	Flags: None
	Line Number: 271
*/
function vehicle_damage_override(inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, modelIndex, partName, vSurfaceNormal)
{
	if(!isalive(self))
	{
		return damage;
	}
	if(isdefined(self.ignore_nuke) && self.ignore_nuke)
	{
		return damage;
	}
	if(isdefined(self.marked_for_death) && self.marked_for_death)
	{
		return damage;
	}
	if(zm_utility::is_magic_bullet_shield_enabled(self))
	{
		return damage;
	}
	if(self function_48d44a46())
	{
		if(meansOfDeath === "MOD_MELEE")
		{
			damage = self.health;
		}
	}
	return damage;
}

