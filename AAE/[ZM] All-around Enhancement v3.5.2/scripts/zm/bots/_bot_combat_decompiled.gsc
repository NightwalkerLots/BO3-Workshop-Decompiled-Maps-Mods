#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\bots\_bot;
#include scripts\shared\bots\_bot_combat;
#include scripts\shared\bots\bot_traversals;
#include scripts\shared\gameobjects_shared;
#include scripts\shared\killstreaks_shared;
#include scripts\shared\math_shared;
#include scripts\shared\util_shared;
#include scripts\shared\weapons\_weapon_utils;
#include scripts\shared\weapons\_weapons;
#include scripts\shared\weapons_shared;
#include scripts\zm\_zm_utility;
#include scripts\zm\bots\_bot;

#namespace bot_combat;

/*
	Name: bot_ignore_threat
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x2D8
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 27
*/
function bot_ignore_threat(entity)
{
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c8ba221b
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x2F0
	Size: 0x470
	Parameters: 1
	Flags: None
	Line Number: 43
*/
function function_c8ba221b(maxDistance)
{
	if(!isdefined(maxDistance))
	{
		maxDistance = 0;
	}
	zombies = GetAITeamArray(level.zombie_team);
	var_2b7f6f04 = [];
	foreach(player in GetPlayers())
	{
		if(player.team != self.team)
		{
			var_2b7f6f04[var_2b7f6f04.size] = player;
		}
	}
	if(var_2b7f6f04.size)
	{
		return var_2b7f6f04;
	}
	var_255b3a4e = self bot::function_1e74c65d(0);
	if(var_255b3a4e != self)
	{
		for(i = 0; i < zombies.size; i++)
		{
			if(isdefined(zombies[i]) && isalive(zombies[i]))
			{
				if(isdefined(zombies[i].anchor))
				{
					continue;
				}
				if(isdefined(zombies[i].marked_for_death) && zombies[i].marked_for_death)
				{
					continue;
				}
				if(!(isdefined(zombies[i].allowdeath) && zombies[i].allowdeath))
				{
					continue;
				}
				if(!self BotSightTrace(zombies[i]))
				{
					continue;
				}
				if(zombie_utility::get_current_zombie_count() + level.zombie_total < 3)
				{
					if(isdefined(zombies[i].ignore_enemy_count) && zombies[i].ignore_enemy_count)
					{
						var_2b7f6f04[var_2b7f6f04.size] = zombies[i];
						continue;
					}
				}
				if(isdefined(zombies[i].archetype) && zombies[i].archetype == "zombie_george")
				{
					continue;
				}
				var_2b7f6f04[var_2b7f6f04.size] = zombies[i];
			}
		}
	}
	else
	{
		for(i = 0; i < zombies.size; i++)
		{
			if(isdefined(zombies[i]) && isalive(zombies[i]))
			{
				if(!(isdefined(zombies[i].allowdeath) && zombies[i].allowdeath))
				{
					continue;
				}
				if(!self BotSightTrace(zombies[i]))
				{
					continue;
				}
				var_2b7f6f04[var_2b7f6f04.size] = zombies[i];
			}
		}
	}
	if(isdefined(self.bot.var_beeeee21))
	{
		zombie = ArrayGetClosest(self GetEye(), var_2b7f6f04, 150);
	}
	else
	{
		zombie = ArrayGetClosest(self GetEye(), var_2b7f6f04);
	}
	if(isdefined(zombie))
	{
		return Array(zombie);
		return;
	}
}

/*
	Name: function_ddfaef90
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x768
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 144
*/
function function_ddfaef90()
{
	if(zombie_utility::get_current_zombie_count() + level.zombie_total > 2 && self bot::function_1e74c65d(0) != self)
	{
		self set_threat(self.bot.threat.entity);
		self function_84be2b9b();
		self fire_weapon();
	}
	else if(isdefined(self.bot.damage.entity))
	{
		if(isdefined(self.bot.damage.entity.ignore_enemy_count) && self.bot.damage.entity.ignore_enemy_count)
		{
			self set_threat(self.bot.threat.entity);
			self function_84be2b9b();
			self fire_weapon();
		}
	}
}

/*
	Name: function_6e8d827b
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x8D0
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 173
*/
function function_6e8d827b()
{
	self endon("death");
	self endon("bled_out");
	level endon("game_ended");
	while(1)
	{
		self waittill("damage", damage, attacker, direction, point, mod, unused1, unused2, unused3, weapon, flags, inflictor);
		self tap_jump_button();
		if(isdefined(attacker))
		{
			self.bot.damage.entity = attacker;
			self.bot.damage.amount = damage;
			self.bot.damage.attackDir = VectorNormalize(attacker.origin - self.origin);
			self.bot.damage.weapon = weapon;
			self.bot.damage.mod = mod;
			self.bot.damage.time = GetTime();
			self thread [[level.onBotDamage]]();
		}
	}
}

/*
	Name: mp_pre_combat
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0xAA0
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 205
*/
function mp_pre_combat()
{
	self bot_pre_combat();
	if(self IsReloading() || self IsSwitchingWeapons() || self IsThrowingGrenade() || self IsMeleeing() || self IsRemoteControlling() || self IsInVehicle() || self IsWeaponViewOnlyLinked())
	{
		return;
	}
	if(self has_threat())
	{
		self threat_switch_weapon();
		return;
	}
	if(self reload_weapon())
	{
		return;
	}
}

/*
	Name: mp_post_combat
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0xBB8
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 233
*/
function mp_post_combat()
{
	if(!level.enable_magic)
	{
		return;
	}
	if(!self has_threat() && !self BotGoalSet())
	{
		tag = self get_closest_tag();
		if(isdefined(tag))
		{
			trace = beamtrace(tag.origin + VectorScale((0, 0, 1), 40), tag.origin - VectorScale((0, 0, 1), 200), 0, tag, 1);
			self BotSetGoal(trace["position"]);
		}
	}
}

/*
	Name: function_2bb31584
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0xCB0
	Size: 0x268
	Parameters: 0
	Flags: None
	Line Number: 260
*/
function function_2bb31584()
{
	if(self has_threat())
	{
		if(self threat_is_alive())
		{
			if(zombie_utility::get_current_zombie_count() + level.zombie_total < 3 && self bot::function_1e74c65d(0) != self)
			{
				if(isdefined(self.bot.threat.entity.ignore_enemy_count) && self.bot.threat.entity.ignore_enemy_count)
				{
				}
				else
				{
					self clear_threat();
					self get_new_threat();
				}
			}
			self function_5a16e24d();
		}
		else
		{
			self thread [[level.botThreatDead]]();
		}
	}
	if(!self has_threat() && !self get_new_threat())
	{
		return;
	}
	if(self has_threat())
	{
		if(!self threat_visible() || self.bot.threat.lastDistanceSq > level.botSettings.threatRadiusMaxSq)
		{
			self get_new_threat(level.botSettings.threatRadiusMin);
		}
	}
	if(self threat_visible())
	{
		if(Distance(self.bot.threat.entity.origin, self.origin) < 150)
		{
			self thread [[level.botUpdateThreatGoal]]();
		}
		else
		{
			self bot::function_da7cb4d();
		}
		self thread [[level.botThreatEngage]]();
	}
}

/*
	Name: get_closest_tag
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0xF20
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 319
*/
function get_closest_tag()
{
	powerup = ArrayGetClosest(self.origin, level.active_powerups, 500);
	if(self.only_affects_grabber)
	{
		return;
	}
	else if(self.any_team)
	{
		return;
	}
	else if(self.zombie_grabbable)
	{
		return;
	}
	else if(powerup.powerup_name != "nuke")
	{
		return powerup;
		return;
	}
}

/*
	Name: function_fd6b48fb
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0xFB8
	Size: 0x4A8
	Parameters: 0
	Flags: None
	Line Number: 351
*/
function function_fd6b48fb()
{
	if(!self.bot.threat.wasVisible && self.bot.threat.visible && !self IsThrowingGrenade() && !self fragButtonPressed() && !self SecondaryOffhandButtonPressed() && !self IsSwitchingWeapons())
	{
		visibleRoll = RandomInt(100);
		if(isdefined(level.botSettings.lethalWeight))
		{
		}
		else
		{
		}
		rollWeight = 0;
		if(visibleRoll < rollWeight && self.bot.threat.lastDistanceSq >= level.botSettings.lethalDistanceMinSq && self.bot.threat.lastDistanceSq <= level.botSettings.lethalDistanceMaxSq && self GetWeaponAmmoStock(self.current_lethal_grenade))
		{
			self clear_threat_aim();
			self function_676c7ae4(self.current_lethal_grenade, self.bot.threat.lastPosition);
			return;
		}
		visibleRoll = visibleRoll - rollWeight;
		if(isdefined(level.botSettings.tacticalWeight))
		{
		}
		else
		{
		}
		rollWeight = 0;
		if(visibleRoll >= 0 && visibleRoll < rollWeight && self.bot.threat.lastDistanceSq >= level.botSettings.tacticalDistanceMinSq && self.bot.threat.lastDistanceSq <= level.botSettings.tacticalDistanceMaxSq && self GetWeaponAmmoStock(self.current_tactical_grenade))
		{
			self clear_threat_aim();
			self function_676c7ae4(self.current_tactical_grenade, self.bot.threat.lastPosition);
			return;
		}
		self.bot.threat.aimOffset = self get_aim_offset(self.bot.threat.entity);
	}
	if(self fragButtonPressed())
	{
		self function_676c7ae4(self.current_lethal_grenade, self.bot.threat.lastPosition);
		return;
	}
	if(self SecondaryOffhandButtonPressed())
	{
		self function_676c7ae4(self.current_tactical_grenade, self.bot.threat.lastPosition);
		return;
	}
	self function_84be2b9b();
	if(self IsReloading() || self IsSwitchingWeapons() || self IsThrowingGrenade() || self fragButtonPressed() || self SecondaryOffhandButtonPressed() || self IsMeleeing())
	{
		return;
	}
	self function_2ec2f396();
	self fire_weapon();
}

/*
	Name: function_2ec2f396
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1468
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 414
*/
function function_2ec2f396()
{
	weapon = self GetCurrentWeapon();
	if(weapon == level.weaponNone || weapon.isDualWield || weapon.weapClass == "melee" || self GetWeaponAmmoClip(weapon) <= 0)
	{
		return;
	}
	if(self.bot.threat.dot < weapon_ads_dot(weapon))
	{
		return;
	}
	self notify("hash_e37255e7");
}

/*
	Name: fire_weapon
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1538
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 438
*/
function fire_weapon()
{
	weapon = self GetCurrentWeapon();
	if(weapon == level.weaponNone || !self GetWeaponAmmoClip(weapon) || self.bot.threat.dot < weapon_fire_dot(weapon))
	{
		return;
	}
	if(weapon.isDualWield && weapon.dualWieldWeapon.fireType == "Full Auto")
	{
		self press_throw_button();
	}
	if(weapon.fireType == "Full Auto")
	{
		self thread function_672ff636();
		return;
	}
	self notify("hash_d83e7f0f");
}

/*
	Name: function_672ff636
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1658
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 467
*/
function function_672ff636()
{
	self notify("hash_672ff636");
	self endon("hash_672ff636");
	self endon("disconnect");
	self endon("death");
	self endon("hash_d83e7f0f");
	self press_attack_button();
	wait(2);
	self release_attack_button();
}

/*
	Name: function_5bfe8cc9
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x16D0
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 489
*/
function function_5bfe8cc9()
{
	if(self BotUnderManualControl())
	{
		return;
	}
	if(self BotGoalSet() && (self.bot.threat.wasVisible || !self.bot.threat.visible))
	{
		return;
	}
	radius = get_threat_goal_radius();
	radiusSq = radius * radius;
	threatDistSq = Distance2DSquared(self.origin, self.bot.threat.lastPosition);
	if(threatDistSq < radiusSq)
	{
		self bot::function_e7cfbfc5();
	}
}

/*
	Name: get_aim_offset
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x17E8
	Size: 0x418
	Parameters: 1
	Flags: None
	Line Number: 518
*/
function get_aim_offset(entity)
{
	weapon = self GetCurrentWeapon();
	var_4a85456 = weapon_range(weapon) / 2;
	switch(entity.animName)
	{
		case "quad_zombie":
		{
			return entity GetTagOrigin("tag_origin") + VectorScale(anglesToUp(entity GetTagAngles("tag_origin")), 12) - entity.origin;
		}
		case "monkey_zombie":
		{
			return entity GetCentroid() - entity.origin;
		}
	}
	switch(entity.targetname)
	{
		case "zombie":
		{
			if(Distance(self.origin, entity.origin) <= var_4a85456 && weapon.isBulletWeapon)
			{
				return entity GetTagOrigin("J_Head") - entity.origin;
			}
			return entity GetTagOrigin("J_SpineUpper") - entity.origin;
		}
		case "margwa":
		{
			if(isdefined(entity.head))
			{
				foreach(head in entity.head)
				{
					if(head.health > 0 && head.canDamage)
					{
						return entity GetTagOrigin(head.tag) - entity.origin;
					}
				}
			}
			return entity GetEye() - entity.origin;
		}
		case "zombie_dog":
		{
			return entity GetCentroid() + VectorScale(anglesToUp(entity GetAngles()), -12) - entity.origin;
		}
		case "zombie_wasp":
		{
			return entity GetEye() + VectorScale(anglesToUp(entity GetAngles()), -6) - entity.origin;
		}
	}
	if(IsSentient(entity) && Distance(self.origin, entity.origin) <= var_4a85456 && weapon.isBulletWeapon)
	{
		return entity GetEye() - entity.origin;
	}
	return entity GetCentroid() - entity.origin;
}

/*
	Name: tap_attack_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1C08
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 583
*/
function tap_attack_button()
{
	self BotTapButton(0);
}

/*
	Name: press_attack_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1C30
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 598
*/
function press_attack_button()
{
	self BotPressButton(0);
}

/*
	Name: release_attack_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1C58
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 613
*/
function release_attack_button()
{
	self BotReleaseButton(0);
}

/*
	Name: function_40119012
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1C80
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 628
*/
function function_40119012()
{
	self BotPressButton(2);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: tap_melee_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1CA8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 645
*/
function tap_melee_button()
{
	self BotTapButton(2);
}

/*
	Name: tap_reload_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1CD0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 660
*/
function tap_reload_button()
{
	self BotTapButton(4);
	return;
}

/*
	Name: tap_use_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1CF8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 676
*/
function tap_use_button()
{
	self BotTapButton(3);
}

/*
	Name: press_crouch_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1D20
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 691
*/
function press_crouch_button()
{
	self BotPressButton(9);
}

/*
	Name: press_use_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1D48
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 706
*/
function press_use_button()
{
	self BotPressButton(3);
}

/*
	Name: release_use_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1D70
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 721
*/
function release_use_button()
{
	self BotReleaseButton(3);
}

/*
	Name: press_sprint_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1D98
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 736
*/
function press_sprint_button()
{
	self BotPressButton(1);
	return;
	~;
}

/*
	Name: release_sprint_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1DC0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 753
*/
function release_sprint_button()
{
	self BotReleaseButton(1);
}

/*
	Name: press_frag_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1DE8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 768
*/
function press_frag_button()
{
	self BotPressButton(14);
}

/*
	Name: release_frag_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1E10
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 783
*/
function release_frag_button()
{
	self BotReleaseButton(14);
	return;
}

/*
	Name: tap_frag_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1E38
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 799
*/
function tap_frag_button()
{
	self BotTapButton(14);
}

/*
	Name: press_offhand_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1E60
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 814
*/
function press_offhand_button()
{
	self BotPressButton(15);
}

/*
	Name: release_offhand_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1E88
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 829
*/
function release_offhand_button()
{
	self BotReleaseButton(15);
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: tap_offhand_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1EB0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 847
*/
function tap_offhand_button()
{
	self BotTapButton(15);
}

/*
	Name: press_throw_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1ED8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 862
*/
function press_throw_button()
{
	self BotPressButton(24);
}

/*
	Name: release_throw_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1F00
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 877
*/
function release_throw_button()
{
	self BotReleaseButton(24);
}

/*
	Name: tap_jump_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1F28
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 892
*/
function tap_jump_button()
{
	self BotTapButton(10);
}

/*
	Name: press_jump_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1F50
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 907
*/
function press_jump_button()
{
	self BotPressButton(10);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: release_jump_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1F78
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 924
*/
function release_jump_button()
{
	self BotReleaseButton(10);
}

/*
	Name: tap_ads_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1FA0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 939
*/
function tap_ads_button()
{
	self BotTapButton(11);
}

/*
	Name: press_ads_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1FC8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 954
*/
function press_ads_button()
{
	self BotPressButton(11);
}

/*
	Name: release_ads_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x1FF0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 969
*/
function release_ads_button()
{
	self BotReleaseButton(11);
	return;
	ERROR: Bad function call
}

/*
	Name: tap_doublejump_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x2018
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 986
*/
function tap_doublejump_button()
{
	self BotTapButton(65);
}

/*
	Name: press_doublejump_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x2040
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1001
*/
function press_doublejump_button()
{
	self BotPressButton(65);
	return;
	ERROR: Bad function call
}

/*
	Name: release_doublejump_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x2068
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1018
*/
function release_doublejump_button()
{
	self BotReleaseButton(65);
}

/*
	Name: tap_offhand_special_button
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x2090
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1033
*/
function tap_offhand_special_button()
{
	self BotTapButton(70);
	return;
	waittillframeend;
}

/*
	Name: function_4093aa94
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x20B8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1050
*/
function function_4093aa94(weapon)
{
	if(weapon == self.grenadeTypePrimary)
	{
		self BotTapButton(14);
	}
	else if(weapon == self.grenadeTypeSecondary)
	{
		self BotTapButton(15);
	}
}

/*
	Name: function_676c7ae4
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x2128
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 1072
*/
function function_676c7ae4(weapon, target)
{
	if(self will_hit_target(weapon, target))
	{
		return;
	}
	aimPeak = target + VectorScale((0, 0, 1), 100);
	self BotSetLookAnglesFromPoint(aimPeak);
	self function_4093aa94(weapon);
}

/*
	Name: function_84be2b9b
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x21B8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1093
*/
function function_84be2b9b()
{
	head_origin = function_e0667db2(self.bot.threat.entity);
	if(isdefined(head_origin))
	{
		self BotLookAtPoint(head_origin);
		return;
	}
	if(isdefined(self.bot.threat.aimPoint))
	{
		self BotLookAtPoint(self.bot.threat.aimPoint);
	}
}

/*
	Name: function_5a16e24d
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x2270
	Size: 0x378
	Parameters: 1
	Flags: None
	Line Number: 1117
*/
function function_5a16e24d(newThreat)
{
	if(isdefined(newThreat) && newThreat)
	{
		self.bot.threat.wasVisible = 0;
		self clear_threat_aim();
	}
	else
	{
		self.bot.threat.wasVisible = self.bot.threat.visible;
	}
	velocity = self.bot.threat.entity getvelocity();
	distanceSq = DistanceSquared(self GetEye(), self.bot.threat.entity.origin);
	predictedPosition = self.bot.threat.entity.origin;
	aimPoint = predictedPosition + self.bot.threat.aimOffset;
	dot = self bot::fwd_dot(aimPoint);
	if(isdefined(newThreat) && newThreat)
	{
		self.bot.threat.visible = 1;
	}
	else if(!self BotSightTrace(self.bot.threat.entity))
	{
		self.bot.threat.visible = 0;
		return;
	}
	self.bot.threat.visible = 1;
	self.bot.threat.lastVisibleTime = GetTime();
	self.bot.threat.lastDistanceSq = distanceSq;
	self.bot.threat.lastVelocity = velocity;
	self.bot.threat.lastPosition = predictedPosition;
	self.bot.threat.aimPoint = aimPoint;
	self.bot.threat.dot = dot;
	weapon = self GetCurrentWeapon();
	weaponRange = weapon_range(weapon);
	self.bot.threat.inRange = distanceSq < weaponRange * weaponRange;
	weaponRangeClose = weapon_range_close(weapon);
	self.bot.threat.inCloseRange = distanceSq < weaponRangeClose * weaponRangeClose;
}

/*
	Name: function_e0667db2
	Namespace: bot_combat
	Checksum: 0x424F4353
	Offset: 0x25F0
	Size: 0x30A
	Parameters: 1
	Flags: None
	Line Number: 1166
*/
function function_e0667db2(entity)
{
	if(!isdefined(entity))
	{
		return;
	}
	weapon = self GetCurrentWeapon();
	var_4a85456 = weapon_range(weapon) / 2;
	switch(entity.animName)
	{
		case "quad_zombie":
		{
			return entity GetEye();
		}
		case "monkey_zombie":
		{
			return entity GetEye();
		}
	}
	switch(entity.targetname)
	{
		case "zombie":
		{
			if(Distance(self.origin, entity.origin) <= var_4a85456 && weapon.isBulletWeapon)
			{
				return entity GetEye();
			}
			return entity GetCentroid();
		}
		case "margwa":
		{
			if(isdefined(entity.head))
			{
				foreach(head in entity.head)
				{
					if(head.health > 0 && head.canDamage)
					{
						return entity GetTagOrigin(head.tag);
					}
				}
			}
			return entity GetEye();
		}
		case "zombie_dog":
		{
			return entity GetEye();
		}
		case "zombie_wasp":
		{
			return entity GetCentroid();
		}
	}
	if(IsSentient(entity) && Distance(self.origin, entity.origin) <= var_4a85456 && weapon.isBulletWeapon)
	{
		return entity GetEye();
	}
	return entity GetCentroid();
}

