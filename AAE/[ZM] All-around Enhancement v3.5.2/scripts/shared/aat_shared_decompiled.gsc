#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\damagefeedback_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_weapons;

#namespace AAT;

/*
	Name: __init__sytem__
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x200
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("aat", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x248
	Size: 0x1A8
	Parameters: 0
	Flags: Private
	Line Number: 37
*/
function private __init__()
{
	if(!(isdefined(level.aat_in_use) && level.aat_in_use))
	{
		return;
	}
	level.aat_initializing = 1;
	level.AAT = [];
	level.AAT["none"] = spawnstruct();
	level.AAT["none"].name = "none";
	level.aat_reroll = [];
	callback::on_connect(&on_player_connect);
	spawners = GetSpawnerArray();
	foreach(spawner in spawners)
	{
		spawner spawner::add_spawn_function(&aat_cooldown_init);
	}
	level.aat_exemptions = [];
	zm::register_vehicle_damage_callback(&aat_vehicle_damage_monitor);
	callback::on_finalize_initialization(&finalize_clientfields);
}

/*
	Name: __main__
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x3F8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function __main__()
{
	if(!(isdefined(level.aat_in_use) && level.aat_in_use))
	{
		return;
	}
	zm::register_zombie_damage_override_callback(&aat_response);
}

/*
	Name: on_player_connect
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x440
	Size: 0xD8
	Parameters: 0
	Flags: Private
	Line Number: 88
*/
function private on_player_connect()
{
	self.AAT = [];
	self.aat_cooldown_start = [];
	keys = getArrayKeys(level.AAT);
	foreach(key in keys)
	{
		self.aat_cooldown_start[key] = 0;
	}
	self thread watch_weapon_changes();
}

/*
	Name: aat_cooldown_init
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x520
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 110
*/
function aat_cooldown_init()
{
	self.aat_cooldown_start = [];
	keys = getArrayKeys(level.AAT);
	foreach(key in keys)
	{
		self.aat_cooldown_start[key] = 0;
	}
}

/*
	Name: aat_vehicle_damage_monitor
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x5E0
	Size: 0x100
	Parameters: 15
	Flags: Private
	Line Number: 130
*/
function private aat_vehicle_damage_monitor(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, modelIndex, partName, vSurfaceNormal)
{
	willBeKilled = self.health - iDamage <= 0;
	if(isdefined(level.aat_in_use) && level.aat_in_use)
	{
		self thread aat_response(willBeKilled, eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, damageFromUnderneath, vSurfaceNormal);
	}
	return iDamage;
}

/*
	Name: get_nonalternate_weapon
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x6E8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 150
*/
function get_nonalternate_weapon(weapon)
{
	if(isdefined(weapon))
	{
		if(weapon.isAltMode)
		{
			return weapon.altweapon;
		}
		if(weapon.inventoryType == "dwlefthand")
		{
			return weapon.dualWieldWeapon;
		}
	}
	return weapon;
}

/*
	Name: aat_response
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x758
	Size: 0x5D8
	Parameters: 13
	Flags: None
	Line Number: 176
*/
function aat_response(death, inflictor, attacker, damage, flags, mod, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(!isPlayer(attacker))
	{
		return;
	}
	weapon = get_nonalternate_weapon(weapon);
	name = attacker.AAT[weapon];
	if(!isdefined(name))
	{
		return;
	}
	if(death && !level.AAT[name].occurs_on_death)
	{
		return;
	}
	if(!isdefined(self.archetype))
	{
		return;
	}
	if(isdefined(level.AAT[name].immune_trigger[self.archetype]) && level.AAT[name].immune_trigger[self.archetype])
	{
		return;
	}
	now = GetTime() / 1000;
	if(now <= self.aat_cooldown_start[name] + level.AAT[name].cooldown_time_entity)
	{
		return;
	}
	if(now <= attacker.aat_cooldown_start[name] + level.AAT[name].cooldown_time_attacker)
	{
		return;
	}
	if(now <= level.AAT[name].cooldown_time_global_start + level.AAT[name].cooldown_time_global)
	{
		return;
	}
	if(isdefined(level.AAT[name].validation_func))
	{
		if(!self [[level.AAT[name].validation_func]]())
		{
			return;
		}
	}
	success = 0;
	reroll_icon = undefined;
	percentage = level.AAT[name].percentage;
	chance = RandomFloat(1);
	if(percentage >= chance)
	{
		success = 1;
	}
	if(!success)
	{
		keys = getArrayKeys(level.aat_reroll);
		keys = Array::randomize(keys);
		foreach(key in keys)
		{
			if(attacker [[level.aat_reroll[key].active_func]]())
			{
				for(i = 0; i < level.aat_reroll[key].count; i++)
				{
					if(percentage >= RandomFloat(1))
					{
						success = 1;
						reroll_icon = level.aat_reroll[key].damage_feedback_icon;
						break;
					}
				}
			}
			else if(success)
			{
				break;
			}
		}
	}
	else if(!success)
	{
		attacker notify("hash_8fe44a2e", name, 0, Int(percentage / chance * 100));
		return;
	}
	level.AAT[name].cooldown_time_global_start = now;
	attacker.aat_cooldown_start[name] = now;
	self thread [[level.AAT[name].result_func]](death, attacker, mod, weapon);
	foreach(guy in level.activePlayers)
	{
		guy notify("hash_8fe44a2e", name, 1);
	}
	attacker thread damagefeedback::update_override(level.AAT[name].damage_feedback_icon, level.AAT[name].damage_feedback_sound, reroll_icon);
	if(isdefined(level.var_15dae02d))
	{
		attacker thread [[level.var_15dae02d]](54);
	}
}

/*
	Name: function_de3e1a1e
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0xD38
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 281
*/
function function_de3e1a1e(name)
{
	now = GetTime() / 1000;
	if(now <= self.aat_cooldown_start[name] + level.AAT[name].cooldown_time_attacker)
	{
		return Int(self.aat_cooldown_start[name] + level.AAT[name].cooldown_time_attacker - now * 100);
	}
	if(now <= level.AAT[name].cooldown_time_global_start + level.AAT[name].cooldown_time_global)
	{
		return Int(level.AAT[name].cooldown_time_global_start + level.AAT[name].cooldown_time_global - now * 100);
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: register
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0xE60
	Size: 0x5E8
	Parameters: 10
	Flags: None
	Line Number: 306
*/
function register(name, percentage, cooldown_time_entity, cooldown_time_attacker, cooldown_time_global, occurs_on_death, result_func, damage_feedback_icon, damage_feedback_sound, validation_func)
{
	/#
		Assert(isdefined(level.aat_initializing) && level.aat_initializing, "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(name), "Dev Block strings are not supported");
	#/
	/#
		Assert("Dev Block strings are not supported" != name, "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported");
	#/
	/#
		Assert(!isdefined(level.AAT[name]), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(percentage), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(0 <= percentage && 1 > percentage, "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(cooldown_time_entity), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(0 <= cooldown_time_entity, "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(cooldown_time_entity), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(0 <= cooldown_time_entity, "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(cooldown_time_global), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(0 <= cooldown_time_global, "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(occurs_on_death), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(result_func), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(damage_feedback_icon), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(IsString(damage_feedback_icon), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(damage_feedback_sound), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(IsString(damage_feedback_sound), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	level.AAT[name] = spawnstruct();
	level.AAT[name].name = name;
	level.AAT[name].hash_id = HashString(name);
	level.AAT[name].percentage = percentage;
	level.AAT[name].cooldown_time_entity = cooldown_time_entity;
	level.AAT[name].cooldown_time_attacker = cooldown_time_attacker;
	level.AAT[name].cooldown_time_global = cooldown_time_global;
	level.AAT[name].cooldown_time_global_start = 0;
	level.AAT[name].occurs_on_death = occurs_on_death;
	level.AAT[name].result_func = result_func;
	level.AAT[name].damage_feedback_icon = damage_feedback_icon;
	level.AAT[name].damage_feedback_sound = damage_feedback_sound;
	level.AAT[name].validation_func = validation_func;
	level.AAT[name].immune_trigger = [];
	level.AAT[name].immune_result_direct = [];
	level.AAT[name].immune_result_indirect = [];
}

/*
	Name: register_immunity
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x1450
	Size: 0x220
	Parameters: 5
	Flags: None
	Line Number: 390
*/
function register_immunity(name, archetype, immune_trigger, immune_result_direct, immune_result_indirect)
{
	while(level.aat_initializing !== 0)
	{
		wait(0.05);
	}
	/#
		Assert(isdefined(name), "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(archetype), "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(immune_trigger), "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(immune_result_direct), "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(immune_result_indirect), "Dev Block strings are not supported");
	#/
	if(!isdefined(level.AAT[name].immune_trigger))
	{
		level.AAT[name].immune_trigger = [];
	}
	if(!isdefined(level.AAT[name].immune_result_direct))
	{
		level.AAT[name].immune_result_direct = [];
	}
	if(!isdefined(level.AAT[name].immune_result_indirect))
	{
		level.AAT[name].immune_result_indirect = [];
	}
	level.AAT[name].immune_trigger[archetype] = immune_trigger;
	level.AAT[name].immune_result_direct[archetype] = immune_result_direct;
	level.AAT[name].immune_result_indirect[archetype] = immune_result_indirect;
}

/*
	Name: finalize_clientfields
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x1678
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 438
*/
function finalize_clientfields()
{
	/#
		println("Dev Block strings are not supported");
	#/
	if(level.AAT.size > 1)
	{
		Array::alphabetize(level.AAT);
		i = 0;
		foreach(AAT in level.AAT)
		{
			AAT.var_4851adad = i;
			i++;
			/#
				println("Dev Block strings are not supported" + AAT.name);
			#/
		}
		n_bits = GetMinBitCountForNum(level.AAT.size - 1);
		clientfield::register("toplayer", "aat_current", 1, n_bits, "int");
	}
	level.aat_initializing = 0;
}

/*
	Name: register_aat_exemption
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x1800
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 471
*/
function register_aat_exemption(weapon)
{
	weapon = get_nonalternate_weapon(weapon);
	level.aat_exemptions[weapon] = 1;
}

/*
	Name: is_exempt_weapon
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x1848
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 487
*/
function is_exempt_weapon(weapon)
{
	weapon = get_nonalternate_weapon(weapon);
	return isdefined(level.aat_exemptions[weapon]);
	ERROR: Exception occured: Stack empty.
}

/*
	Name: register_reroll
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x1888
	Size: 0x268
	Parameters: 4
	Flags: None
	Line Number: 504
*/
function register_reroll(name, count, active_func, damage_feedback_icon)
{
	/#
		Assert(isdefined(name), "Dev Block strings are not supported");
	#/
	/#
		Assert("Dev Block strings are not supported" != name, "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported");
	#/
	/#
		Assert(!isdefined(level.AAT[name]), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(count), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(0 < count, "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(active_func), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(isdefined(damage_feedback_icon), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	/#
		Assert(IsString(damage_feedback_icon), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
	#/
	level.aat_reroll[name] = spawnstruct();
	level.aat_reroll[name].name = name;
	level.aat_reroll[name].count = count;
	level.aat_reroll[name].active_func = active_func;
	level.aat_reroll[name].damage_feedback_icon = damage_feedback_icon;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: getAATOnWeapon
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x1AF8
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 549
*/
function getAATOnWeapon(weapon)
{
	weapon = get_nonalternate_weapon(weapon);
	if(weapon == level.weaponNone || (!(isdefined(level.aat_in_use) && level.aat_in_use)) || (!isdefined(self.AAT) || !isdefined(self.AAT[weapon])) || !isdefined(level.AAT[self.AAT[weapon]]))
	{
		return undefined;
	}
	return level.AAT[self.AAT[weapon]];
}

/*
	Name: acquire
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x1BA8
	Size: 0x288
	Parameters: 2
	Flags: None
	Line Number: 569
*/
function acquire(weapon, name)
{
	if(GetDvarString("aaeoption_aat") == "1")
	{
		return;
	}
	if(!(isdefined(level.aat_in_use) && level.aat_in_use))
	{
		return;
	}
	/#
		Assert(isdefined(weapon), "Dev Block strings are not supported");
	#/
	/#
		Assert(weapon != level.weaponNone, "Dev Block strings are not supported");
	#/
	weapon = get_nonalternate_weapon(weapon);
	if(is_exempt_weapon(weapon))
	{
		return;
	}
	if(isdefined(name))
	{
		/#
			Assert("Dev Block strings are not supported" != name, "Dev Block strings are not supported" + "Dev Block strings are not supported" + "Dev Block strings are not supported");
		#/
		/#
			Assert(isdefined(level.AAT[name]), "Dev Block strings are not supported" + name + "Dev Block strings are not supported");
		#/
		self.AAT[weapon] = name;
	}
	else
	{
		keys = getArrayKeys(level.AAT);
		ArrayRemoveValue(keys, "none");
		if(isdefined(self.AAT[weapon]))
		{
			ArrayRemoveValue(keys, self.AAT[weapon]);
		}
		rand = RandomInt(keys.size);
		self.AAT[weapon] = keys[rand];
	}
	if(weapon == self GetCurrentWeapon())
	{
		self clientfield::set_to_player("aat_current", level.AAT[self.AAT[weapon]].var_4851adad);
	}
}

/*
	Name: remove
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x1E38
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 627
*/
function remove(weapon)
{
	if(!(isdefined(level.aat_in_use) && level.aat_in_use))
	{
		return;
	}
	/#
		Assert(isdefined(weapon), "Dev Block strings are not supported");
	#/
	/#
		Assert(weapon != level.weaponNone, "Dev Block strings are not supported");
	#/
	weapon = get_nonalternate_weapon(weapon);
	self.AAT[weapon] = undefined;
}

/*
	Name: watch_weapon_changes
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x1EE8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 653
*/
function watch_weapon_changes()
{
	self endon("disconnect");
	self endon("death");
	self endon("entityshutdown");
	self thread function_2ee9f705();
	while(isdefined(self))
	{
		self waittill("weapon_change", weapon);
		weapon = get_nonalternate_weapon(weapon);
		name = "none";
		if(isdefined(self.AAT[weapon]))
		{
			name = self.AAT[weapon];
		}
		self notify("hash_8fe44a2e", name, 1);
		self clientfield::set_to_player("aat_current", level.AAT[name].var_4851adad);
	}
}

/*
	Name: function_2ee9f705
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x1FF0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 683
*/
function function_2ee9f705()
{
	self endon("disconnect");
	self endon("death");
	self endon("entityshutdown");
	for(;;)
	{
		self waittill("hash_8fe44a2e", name, Cooldown, chance);
		self function_9e2f4e39(name, Cooldown, chance);
	}
}

/*
	Name: function_9e2f4e39
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x2078
	Size: 0x1B0
	Parameters: 3
	Flags: None
	Line Number: 705
*/
function function_9e2f4e39(name, Cooldown, chance)
{
	if(isdefined(name) && isdefined(Cooldown))
	{
		self notify("hash_53424d8b");
		if(Cooldown)
		{
			weapon = self GetCurrentWeapon();
			var_96934ac3 = self getAATOnWeapon(weapon).name;
			if(isdefined(var_96934ac3) && name == var_96934ac3)
			{
				self thread function_53424d8b(name);
			}
			else
			{
				util::setClientSysState("deadshot_keyline", "at," + Cooldown + "," + 0, self);
			}
		}
		else if(isdefined(chance))
		{
			time = self function_de3e1a1e(name);
			if(!time)
			{
				util::setClientSysState("deadshot_keyline", "at," + Cooldown + "," + chance, self);
			}
			else
			{
				util::setClientSysState("deadshot_keyline", "at," + 1 + "," + time, self);
			}
		}
	}
}

/*
	Name: function_53424d8b
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x2230
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 748
*/
function function_53424d8b(name)
{
	self endon("hash_53424d8b");
	self endon("disconnect");
	self endon("death");
	self endon("entityshutdown");
	wait(0.0001);
	time = self function_de3e1a1e(name);
	util::setClientSysState("deadshot_keyline", "at,1," + time, self);
}

/*
	Name: function_b35d6696
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x22C8
	Size: 0x2E8
	Parameters: 1
	Flags: None
	Line Number: 769
*/
function function_b35d6696(weapon)
{
	a_weapons = [];
	if(weapon == level.weaponNone || weapon == level.weaponZMFists || weapon == GetWeapon("zombie_fists_bowie"))
	{
		return a_weapons;
	}
	if(isdefined(level.retrievable_knife_init_names) && weapon.isBallisticKnife)
	{
		for(i = 0; i < level.retrievable_knife_init_names.size; i++)
		{
			ballistic_weapon = GetWeapon(level.retrievable_knife_init_names[i]);
			if(isdefined(ballistic_weapon) && ballistic_weapon != level.weaponNone && !is_exempt_weapon(ballistic_weapon))
			{
				if(!isdefined(a_weapons))
				{
					a_weapons = [];
				}
				else if(!IsArray(a_weapons))
				{
					a_weapons = Array(a_weapons);
				}
				a_weapons[a_weapons.size] = ballistic_weapon;
			}
		}
	}
	else
	{
		base_weapon = zm_weapons::get_base_weapon(weapon);
		if(isdefined(base_weapon) && base_weapon != level.weaponNone && !is_exempt_weapon(base_weapon))
		{
			if(!isdefined(a_weapons))
			{
				a_weapons = [];
			}
			else if(!IsArray(a_weapons))
			{
				a_weapons = Array(a_weapons);
			}
		}
		a_weapons[a_weapons.size] = base_weapon;
		var_12030910 = zm_weapons::get_upgrade_weapon(weapon);
		if(isdefined(var_12030910) && var_12030910 != level.weaponNone && !is_exempt_weapon(var_12030910))
		{
			if(!isdefined(a_weapons))
			{
				a_weapons = [];
			}
			else if(!IsArray(a_weapons))
			{
				a_weapons = Array(a_weapons);
			}
		}
		a_weapons[a_weapons.size] = var_12030910;
	}
	return a_weapons;
}

/*
	Name: function_1fe15144
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x25B8
	Size: 0xB8
	Parameters: 2
	Flags: Private
	Line Number: 837
*/
function private function_1fe15144(weapon, var_ad818af9)
{
	a_weapons = self function_b35d6696(weapon);
	foreach(weap in a_weapons)
	{
		self.AAT[weap] = var_ad818af9;
	}
}

/*
	Name: function_a5cfe270
	Namespace: AAT
	Checksum: 0x424F4353
	Offset: 0x2678
	Size: 0xAA
	Parameters: 1
	Flags: Private
	Line Number: 856
*/
function private function_a5cfe270(weapon)
{
	a_weapons = self function_b35d6696(weapon);
	foreach(weap in a_weapons)
	{
		self.AAT[weap] = undefined;
	}
}

