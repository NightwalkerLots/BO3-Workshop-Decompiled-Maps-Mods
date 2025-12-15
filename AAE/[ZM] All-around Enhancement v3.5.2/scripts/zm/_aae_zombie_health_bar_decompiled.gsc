#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;

#namespace namespace_ee79c167;

/*
	Name: function_f181aed2
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x1D0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 16
*/
function function_f181aed2()
{
	zm::register_zombie_damage_override_callback(&function_ed51ec90);
	zm::register_vehicle_damage_callback(&function_57963182);
	thread function_81411c1b();
}

/*
	Name: function_81411c1b
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x230
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function function_81411c1b()
{
	level endon("end_game");
	while(1)
	{
		waittillframeend;
		level waittill("hash_6e8f61a0", zombie, damage_func, entityNumber, boneIndex, headshot);
		if(isdefined(zombie) && isdefined(damage_func) && isdefined(entityNumber) && isdefined(boneIndex))
		{
			var_89a825f0 = zombie [[damage_func]](boneIndex);
			if(var_89a825f0)
			{
				LUINotifyEvent(&"aae_zombie_health", 3, var_89a825f0, entityNumber, headshot);
			}
		}
		else if(isdefined(headshot) && isdefined(entityNumber) && headshot == 1)
		{
			LUINotifyEvent(&"aae_zombie_health", 2, entityNumber, headshot);
		}
	}
}

/*
	Name: mechz_health
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x360
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 65
*/
function mechz_health(boneIndex)
{
	return Int(self.health / level.mechz_health * 100);
}

/*
	Name: function_b99f9697
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x3A0
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 80
*/
function function_b99f9697(boneIndex)
{
	partName = GetPartName(self.model, boneIndex);
	modelHit = self margwaHeadHit(self, partName);
	if(isdefined(modelHit))
	{
		headInfo = self.head[modelHit];
		if(headInfo margwaCanDamageHead())
		{
			return Int(self function_3d317a6e() / self function_9b774b0() * 100);
		}
	}
	return 0;
}

/*
	Name: zombie_health
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x488
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 105
*/
function zombie_health(boneIndex)
{
	return Int(self.health / self.maxhealth * 100);
}

/*
	Name: function_ed51ec90
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x4C8
	Size: 0x230
	Parameters: 13
	Flags: None
	Line Number: 120
*/
function function_ed51ec90(death, inflictor, player, damage, flags, mod, weapon, vPoint, vDir, HIT_LOCATION, psOffsetTime, boneIndex, surfaceType)
{
	if(damage)
	{
		if(isdefined(death) && death)
		{
			if(HIT_LOCATION == "helmet" || HIT_LOCATION == "head")
			{
				level notify("hash_6e8f61a0", undefined, undefined, self GetEntityNumber(), undefined, 1);
			}
		}
		else
		{
			headshot = 0;
			if(HIT_LOCATION == "helmet" || HIT_LOCATION == "head")
			{
				headshot = 1;
			}
			if(isdefined(self.archetype))
			{
				if(self.archetype == "mechz")
				{
					if(isdefined(level.mechz_health))
					{
						level notify("hash_6e8f61a0", self, &mechz_health, self GetEntityNumber(), boneIndex, headshot);
					}
				}
				else if(self.archetype == "margwa")
				{
					level notify("hash_6e8f61a0", self, &function_b99f9697, self GetEntityNumber(), boneIndex, headshot);
				}
				else if(!isdefined(self.maxhealth) || !self.maxhealth)
				{
					self.maxhealth = self.health;
				}
				level notify("hash_6e8f61a0", self, &zombie_health, self GetEntityNumber(), boneIndex, headshot);
				return;
			}
		}
	}
}

/*
	Name: margwaCanDamageHead
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x700
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 172
*/
function margwaCanDamageHead()
{
	if(isdefined(self) && self.health > 0 && (isdefined(self.canDamage) && self.canDamage))
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: margwaHeadHit
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x748
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 192
*/
function margwaHeadHit(entity, partName)
{
	switch(partName)
	{
		case "j_chunk_head_bone_le":
		case "j_jaw_lower_1_le":
		{
			return self.head_left_model;
		}
		case "j_chunk_head_bone":
		case "j_jaw_lower_1":
		{
			return self.head_mid_model;
		}
		case "j_chunk_head_bone_ri":
		case "j_jaw_lower_1_ri":
		{
			return self.head_right_model;
		}
	}
	return undefined;
}

/*
	Name: function_57963182
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x7C0
	Size: 0x208
	Parameters: 15
	Flags: None
	Line Number: 225
*/
function function_57963182(eInflictor, player, damage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, modelIndex, partName, vSurfaceNormal)
{
	if(damage)
	{
		death = self.health - damage <= 0;
		if(isdefined(death) && death)
		{
			if(sHitLoc == "helmet" || sHitLoc == "head")
			{
				level notify("hash_6e8f61a0", undefined, undefined, self GetEntityNumber(), undefined, 1);
			}
		}
		else
		{
			headshot = 0;
			if(sHitLoc == "helmet" || sHitLoc == "head")
			{
				headshot = 1;
			}
			if(IsSubStr(self.vehicleType, "nikolai") && self.team == "axis" && isdefined(self.healthdefault))
			{
				level notify("hash_6e8f61a0", self, &function_273ae7a6, self GetEntityNumber(), modelIndex, headshot);
			}
			else
			{
				level notify("hash_6e8f61a0", self, &function_7aa3c84, self GetEntityNumber(), modelIndex, headshot);
			}
		}
	}
	return damage;
}

/*
	Name: function_273ae7a6
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0x9D0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 267
*/
function function_273ae7a6(boneIndex)
{
	return Int(self.health / self.healthdefault * 100);
}

/*
	Name: function_7aa3c84
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0xA10
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 282
*/
function function_7aa3c84(boneIndex)
{
	return Int(self.health / self.maxhealth * 100);
}

/*
	Name: function_9b774b0
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0xA50
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 297
*/
function function_9b774b0()
{
	if(isdefined(self.headHealthMax) && isdefined(self.head))
	{
		var_b99f9697 = 0;
		foreach(head in self.head)
		{
			var_b99f9697 = var_b99f9697 + self.headHealthMax;
		}
		return var_b99f9697;
	}
	return 0;
}

/*
	Name: function_3d317a6e
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0xB10
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 321
*/
function function_3d317a6e()
{
	if(isdefined(self.headHealthMax) && isdefined(self.head))
	{
		var_b99f9697 = 0;
		foreach(head in self.head)
		{
			var_b99f9697 = var_b99f9697 + head.health;
		}
		return var_b99f9697;
	}
	return 0;
}

/*
	Name: function_23e4b9fe
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0xBD8
	Size: 0x238
	Parameters: 15
	Flags: None
	Line Number: 345
*/
function function_23e4b9fe(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, modelIndex, partName, vSurfaceNormal)
{
	if(!isPlayer(eAttacker))
	{
		return 0;
	}
	if(level flag::get("world_is_paused"))
	{
		return 0;
	}
	if(sMeansOfDeath === "MOD_MELEE")
	{
		return 0;
	}
	var_7e43f478 = StrTok(partName, "_");
	if(var_7e43f478[1] == "heat" && var_7e43f478[2] == "vent")
	{
		n_index = Int(var_7e43f478[3]);
		if(self.var_65850094[n_index] <= 0)
		{
			return 0;
		}
	}
	else
	{
		return 0;
	}
	str_partname = partName;
	switch(n_index)
	{
		case 1:
		{
			str_partname = "tag_heat_vent_01_d0";
			break;
		}
		case 2:
		{
			str_partname = "tag_heat_vent_02_d0";
			break;
			break;
		}
		case 4:
		{
			break;
		}
		case 3:
		{
		}
		case 5:
		{
			str_partname = "tag_heat_vent_05_d1";
			break;
		}
		default
		{
			return 0;
		}
	}
	if(n_index == 5 && function_86cc3c11() < 4)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_86cc3c11
	Namespace: namespace_ee79c167
	Checksum: 0x424F4353
	Offset: 0xE18
	Size: 0x5C
	Parameters: 0
	Flags: None
	Line Number: 420
*/
function function_86cc3c11()
{
	count = 0;
	for(i = 1; i < 5; i++)
	{
		if(self.var_65850094[i] <= 0)
		{
			count++;
		}
	}
	return count;
}

