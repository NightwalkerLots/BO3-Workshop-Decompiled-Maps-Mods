#include scripts\shared\callbacks_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_sub;
#include scripts\zm\_zm_weapons;

#namespace namespace_7003346;

/*
	Name: init
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0x470
	Size: 0x60
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec init()
{
	if(GetDvarString("mapname") == "zm_genesis")
	{
		thread function_c54b98dc();
	}
	callback::on_spawned(&function_eb16aee8);
}

/*
	Name: function_eb16aee8
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0x4D8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function function_eb16aee8()
{
	self notify("hash_eb16aee8");
	self endon("hash_eb16aee8");
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	self thread function_5d83b982();
	for(;;)
	{
		self waittill("hash_bfa27140", stage, zombie, mod, weapon, var_3fc7f0d8, isalive);
		self function_a2ac5053(stage, zombie, mod, weapon, var_3fc7f0d8, isalive);
	}
}

/*
	Name: function_5d83b982
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0x5B8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 64
*/
function function_5d83b982()
{
	self notify("hash_5d83b982");
	self endon("hash_5d83b982");
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	for(;;)
	{
		self waittill("margwa_headshot", margwa);
		self function_a2ac5053(2, margwa, undefined, undefined, &function_14debd07);
	}
}

/*
	Name: function_276ec0cf
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0x650
	Size: 0x110
	Parameters: 3
	Flags: None
	Line Number: 88
*/
function function_276ec0cf(stage, mod, weapon)
{
	if(isdefined(mod))
	{
		if(mod == "MOD_PROJECTILE_SPLASH" || mod == "MOD_GRENADE_SPLASH" || mod == "MOD_GAS" || mod == "MOD_HIT_BY_OBJECT" || mod == "MOD_FALLING" || mod == "MOD_CRUSH" || mod == "MOD_SUICIDE" || mod == "MOD_DROWN")
		{
			return 3;
		}
	}
	if(weapon.name == "hero_gravityspikes_melee" || weapon.name == "octobomb_upgraded" || weapon.name == "octobomb")
	{
		return 3;
	}
	return stage;
}

/*
	Name: function_a2ac5053
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0x768
	Size: 0x320
	Parameters: 6
	Flags: None
	Line Number: 114
*/
function function_a2ac5053(stage, zombie, mod, weapon, var_3fc7f0d8, isalive)
{
	if(!isdefined(mod))
	{
		mod = "MOD_PISTOL_BULLET";
	}
	if(!isdefined(weapon))
	{
		weapon = level.weaponNone;
	}
	if(!isdefined(isalive))
	{
		isalive = 0;
	}
	is_sniper = self function_d441def1();
	if(!isalive)
	{
		if(stage == 2)
		{
			if(isdefined(zombie))
			{
				if(isdefined(var_3fc7f0d8) && IsFunctionPtr(var_3fc7f0d8))
				{
					if(!zombie [[var_3fc7f0d8]]())
					{
						if(mod == "MOD_PISTOL_BULLET" || mod == "MOD_RIFLE_BULLET" || mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH")
						{
							if(is_sniper)
							{
								stage = 5;
							}
						}
						else
						{
							stage = 1;
						}
						self PlayHitMarker("", self function_276ec0cf(stage, mod, weapon), "", 1);
						return;
					}
				}
				else if(!isalive(zombie))
				{
					if(mod == "MOD_PISTOL_BULLET" || mod == "MOD_RIFLE_BULLET" || mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH")
					{
						if(is_sniper)
						{
							stage = 5;
						}
					}
					else
					{
						stage = 1;
					}
					self PlayHitMarker("", self function_276ec0cf(stage, mod, weapon), "", 1);
					return;
				}
			}
		}
		if(stage == 1)
		{
			if(isdefined(zombie))
			{
				if(!isalive(zombie))
				{
					self PlayHitMarker("", self function_276ec0cf(stage, mod, weapon), "", 1);
					return;
				}
			}
		}
	}
	self PlayHitMarker("", self function_276ec0cf(stage, mod, weapon), "", isalive);
}

/*
	Name: function_8c3adde9
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0xA90
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 197
*/
function function_8c3adde9()
{
	zm::register_zombie_damage_override_callback(&function_1114d19b);
	zm::register_vehicle_damage_callback(&function_814d4487);
}

/*
	Name: function_1114d19b
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0xAE0
	Size: 0x1C0
	Parameters: 13
	Flags: None
	Line Number: 213
*/
function function_1114d19b(death, inflictor, player, damage, flags, mod, weapon, vPoint, vDir, HIT_LOCATION, psOffsetTime, boneIndex, surfaceType)
{
	if(!isdefined(player.gamevars["hardcore"]) && !isdefined(level.gamevars["hardcore"]))
	{
		if(self getteam() == "axis")
		{
			death = !isalive(self);
			if(isdefined(death) && death || (isdefined(self.archetype) && self.archetype == "zombie" && player zm_powerups::is_insta_kill_active()))
			{
				self thread function_72302285(death, inflictor, player, damage, flags, mod, weapon, vPoint, vDir, HIT_LOCATION, psOffsetTime, boneIndex, surfaceType);
			}
			else
			{
				self thread function_6450c49c(death, inflictor, player, damage, flags, mod, weapon, vPoint, vDir, HIT_LOCATION, psOffsetTime, boneIndex, surfaceType);
			}
		}
	}
}

/*
	Name: function_814d4487
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0xCA8
	Size: 0x190
	Parameters: 15
	Flags: None
	Line Number: 242
*/
function function_814d4487(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, modelIndex, partName, vSurfaceNormal)
{
	willBeKilled = !isalive(self);
	if(self getteam() == "axis")
	{
		if(self.vehicleType == "spawner_enemy_boss_vehicle_siegebot_nikolai_dragon" || self.vehicleType == "spawner_enemy_boss_vehicle_siegebot_nikolai")
		{
			return iDamage;
		}
		if(isdefined(willBeKilled) && willBeKilled)
		{
			self thread function_72302285(willBeKilled, eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, undefined, undefined);
		}
		else
		{
			self thread function_6450c49c(willBeKilled, eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, undefined, undefined);
		}
	}
	return iDamage;
}

/*
	Name: margwaCanDamageHead
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0xE40
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 273
*/
function margwaCanDamageHead()
{
	if(isdefined(self) && self.health > 0 && (isdefined(self.canDamage) && self.canDamage))
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: margwaHeadHit
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0xE88
	Size: 0x70
	Parameters: 2
	Flags: Private
	Line Number: 294
*/
function private margwaHeadHit(entity, partName)
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
	Name: function_6450c49c
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0xF00
	Size: 0x210
	Parameters: 13
	Flags: None
	Line Number: 327
*/
function function_6450c49c(death, inflictor, player, damage, flags, mod, weapon, vPoint, vDir, HIT_LOCATION, psOffsetTime, boneIndex, surfaceType)
{
	if(!isPlayer(player))
	{
		return;
	}
	var_dbcbfb53 = GetDvarInt("tfoption_hitmarkers_sound");
	if(isdefined(self.archetype) && self.archetype == "margwa")
	{
		if(isDirectHitWeapon(weapon))
		{
			partName = GetPartName(self.model, boneIndex);
			modelHit = self margwaHeadHit(self, partName);
			if(isdefined(modelHit))
			{
				headInfo = self.head[modelHit];
				if(headInfo margwaCanDamageHead())
				{
					player notify("hash_bfa27140", 2, self, undefined, weapon, &function_14debd07);
					return;
				}
			}
		}
	}
	player.var_8b7daf8e = 0;
	if(HIT_LOCATION == "helmet" || HIT_LOCATION == "head")
	{
		player notify("hash_bfa27140", 2, self, mod, weapon);
	}
	else
	{
		player notify("hash_bfa27140", 1, self, mod, weapon);
	}
}

/*
	Name: function_ed5ac736
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0x1118
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 372
*/
function function_ed5ac736(player)
{
	level notify("hash_ed5ac736");
	level endon("hash_ed5ac736");
	wait(0.1);
	if(function_92dc25bf().size == 0 && level.zombie_total == 0 && isdefined(player.name) && player.name != "" && isdefined(self.archetype) && self.archetype == "zombie")
	{
		thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, player.name, "â¦SUBEVENT_LASTZMâ¦â¦SUBEVENT_DOTâ¦");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_92dc25bf
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0x11F8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 395
*/
function function_92dc25bf()
{
	return GetAISpeciesArray("axis", "all");
}

/*
	Name: function_72302285
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0x1228
	Size: 0x2E0
	Parameters: 13
	Flags: None
	Line Number: 410
*/
function function_72302285(death, inflictor, player, damage, flags, mod, weapon, vPoint, vDir, HIT_LOCATION, psOffsetTime, boneIndex, surfaceType)
{
	if(!isPlayer(player))
	{
		return;
	}
	var_dbcbfb53 = GetDvarInt("tfoption_hitmarkers_sound");
	if(isdefined(self.archetype) && self.archetype == "margwa")
	{
		if(isDirectHitWeapon(weapon))
		{
			partName = GetPartName(self.model, boneIndex);
			modelHit = self margwaHeadHit(self, partName);
			if(isdefined(modelHit))
			{
				headInfo = self.head[modelHit];
				if(headInfo margwaCanDamageHead())
				{
					player notify("hash_bfa27140", 2, self, weapon, undefined, &function_14debd07);
					return;
				}
			}
		}
	}
	if(!isdefined(self.var_de9e7ac7) && self.team != "allies")
	{
		self.var_de9e7ac7 = 0;
		self thread function_ed5ac736(player);
		if(mod == "MOD_MELEE" || mod == "MOD_BURNED")
		{
			player notify("hash_bfa27140", 1, self, mod, weapon, undefined, 1);
		}
		else if("head" == HIT_LOCATION || "helmet" == HIT_LOCATION)
		{
			if(player function_d441def1())
			{
				player notify("hash_bfa27140", 5, self, mod, weapon, undefined, 1);
			}
			else
			{
				player notify("hash_bfa27140", 2, self, mod, weapon, undefined, 1);
			}
		}
		else
		{
			player notify("hash_bfa27140", 1, self, mod, weapon, undefined, 1);
		}
	}
}

/*
	Name: is_sniper_weapon
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0x1510
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 470
*/
function is_sniper_weapon(w_to_check)
{
	w_base = zm_weapons::get_base_weapon(w_to_check);
	if(isdefined(level.zombie_weapons[w_base]) && level.zombie_weapons[w_base].weaponVO === "sniper")
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_d441def1
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0x1588
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 490
*/
function function_d441def1()
{
	weapon = self GetCurrentWeapon();
	if(isdefined(weapon.isSniperWeapon) && weapon.isSniperWeapon)
	{
		return 1;
	}
	if(is_sniper_weapon(weapon))
	{
		return 1;
	}
	snipers = Array("sniper", "barrett", "m82a1", "m40a3", "mosin", "dragnuov", "svd", "svu", "mors", "20mm", "lynx", "l118", "l115", "usr", "vks", "ebr", "intervention", "kbs", "dmr", "widowmaker", "proteus", "wa2000", "rsass", "msr", "as50", "m21", "25s", "m40a3", "98k", "type38", "lisle", "ptrs", "springfield", "karabin", "lever", "mas36", "wz35", "sdk9");
	foreach(sniper in snipers)
	{
		if(IsSubStr(weapon.name, sniper))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_c54b98dc
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0x17F0
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 522
*/
function function_c54b98dc()
{
	level waittill("hash_fa713eaf");
	while(!isdefined(level.var_5b08e991))
	{
		wait(0.048);
	}
	level.var_5b08e991 endon("death");
	while(isdefined(level.var_5b08e991))
	{
		level.var_5b08e991 waittill("damage", amount, attacker, direction_vec, point, type, tagName, modelName, partName, weapon);
		if(!level flag::get("final_boss_vulnerable") || !isdefined(level.var_5b08e991))
		{
		}
		else if(isPlayer(attacker))
		{
			attacker notify("hash_bfa27140", 1);
		}
	}
}

/*
	Name: function_14debd07
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0x1920
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 553
*/
function function_14debd07()
{
	if(isdefined(self) && isdefined(self.headAttached) && self.headAttached > 0)
	{
		return 1;
	}
	return 0;
}

/*
	Name: isDirectHitWeapon
	Namespace: namespace_7003346
	Checksum: 0x424F4353
	Offset: 0x1958
	Size: 0xEE
	Parameters: 1
	Flags: Private
	Line Number: 572
*/
function private isDirectHitWeapon(weapon)
{
	foreach(dhWeapon in level.dhWeapons)
	{
		if(weapon.name == dhWeapon)
		{
			return 1;
		}
		if(isdefined(weapon.rootweapon) && isdefined(weapon.rootweapon.name) && weapon.rootweapon.name == dhWeapon)
		{
			return 1;
		}
	}
	return 0;
}

