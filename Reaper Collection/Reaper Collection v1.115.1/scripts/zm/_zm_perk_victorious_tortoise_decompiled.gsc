#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_961a2806;

/*
	Name: __init__sytem__
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x638
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("victorious_tortoise", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x678
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function __init__()
{
	function_1a92256e();
	return;
	++;
}

/*
	Name: function_1a92256e
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x698
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_victorious", "customperk", 2500, &"ZM_REAP_MOD_PERK_VICTORIOUS_TORTOISE", GetWeapon("zombie_perk_bottle_victorious_tortoise"));
	zm_perks::register_perk_precache_func("specialty_victorious", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_victorious", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_victorious", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_victorious", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_victorious", "Victorious Tortoise", "sleight_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_victorious", &"ZM_REAP_MOD_PERK_VICTORIOUS_TORTOISE_DB", 2000, "Victorious Tortoise", "victorious");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_victorious"] = 1;
	level.var_4ffc490d = &function_3a97aaaa;
	level.should_shield_absorb_damage = &should_shield_absorb_damage;
	level.riotshield_damage_callback = &player_damage_shield;
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x8A0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_victorious"] = spawnstruct();
	level.machine_assets["specialty_victorious"].weapon = GetWeapon("zombie_perk_bottle_victorious_tortoise");
	level.machine_assets["specialty_victorious"].off_model = "cz_vending_victorious_off";
	level.machine_assets["specialty_victorious"].on_model = "cz_vending_victorious";
}

/*
	Name: function_19157aff
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x948
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 125
*/
function function_19157aff()
{
}

/*
	Name: function_99c1452c
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x958
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 139
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_victorious", "victorious", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x9A0
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 154
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_victorious";
	use_trigger.script_label = "";
	use_trigger.target = "Victorious Tortoise";
	perk_machine.script_string = "specialty_victorious";
	perk_machine.targetname = "Victorious Tortoise";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_victorious";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0xA68
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 178
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_victorious"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_victorious"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0xAF0
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 206
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_victorious"] = 0;
	self.var_b5c2c258["specialty_victorious"] = undefined;
	self.var_d6aef449["specialty_victorious"] = undefined;
}

/*
	Name: on_player_spawned
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0xB50
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 223
*/
function on_player_spawned()
{
	self thread function_16ab572d();
}

/*
	Name: function_16ab572d
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0xB78
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 238
*/
function function_16ab572d()
{
	self endon("disconnect");
	self notify("hash_1e2b1228");
	self endon("hash_1e2b1228");
	while(1)
	{
		self waittill("destroy_riotshield");
		if(self namespace_851dc78f::function_5f9a13b3("specialty_victorious"))
		{
			if(self namespace_851dc78f::function_5f9a13b3("specialty_victorious") && isdefined(level.var_4ffc490d))
			{
				self thread [[level.var_4ffc490d]]();
			}
		}
	}
}

/*
	Name: function_3a97aaaa
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0xC20
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 266
*/
function function_3a97aaaa()
{
	a_zombies = zombie_utility::get_round_enemy_array();
	a_zombies = util::get_array_of_closest(self.origin, a_zombies, undefined, undefined, 250);
	for(i = 0; i < a_zombies.size; i++)
	{
		if(isalive(self) && isalive(a_zombies[i]))
		{
			wait(0.01);
			if(isdefined(a_zombies[i]) && isalive(a_zombies[i]))
			{
				a_zombies[i] zombie_utility::gib_random_parts();
				GibServerUtils::Annihilate(a_zombies[i]);
				a_zombies[i] zm_spawner::zombie_explodes_intopieces(0);
				a_zombies[i] DoDamage(a_zombies[i].health + 666, self.origin, self, self, "MOD_EXPLOSIVE_SPLASH");
			}
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: should_shield_absorb_damage
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0xDB0
	Size: 0x1C8
	Parameters: 10
	Flags: None
	Line Number: 298
*/
function should_shield_absorb_damage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(isdefined(self.hasRiotShield) && self.hasRiotShield && isdefined(vDir))
	{
		if(isdefined(eAttacker) && (isdefined(eAttacker.is_zombie) && eAttacker.is_zombie || isPlayer(eAttacker)))
		{
			if(self namespace_851dc78f::function_5f9a13b3("specialty_victorious") && (isdefined(self.hasRiotShieldEquipped) && self.hasRiotShieldEquipped))
			{
				return 1;
			}
			else if(isdefined(self.hasRiotShieldEquipped) && self.hasRiotShieldEquipped)
			{
				if(self player_shield_facing_attacker(vDir, 0.2))
				{
					return 1;
				}
			}
			else if(!isdefined(self.riotshieldEntity))
			{
				if(!self player_shield_facing_attacker(vDir, -0.2))
				{
					return level.zombie_vars["riotshield_stowed_block_fraction"];
				}
			}
			else
			{
				fallback_initiated::Assert(!isdefined(self.riotshieldEntity), "Dev Block strings are not supported");
			}
			/#
			#/
		}
	}
	return 0;
}

/*
	Name: player_shield_facing_attacker
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0xF80
	Size: 0x138
	Parameters: 2
	Flags: None
	Line Number: 343
*/
function player_shield_facing_attacker(vDir, limit)
{
	orientation = self getPlayerAngles();
	forwardVec = AnglesToForward(orientation);
	forwardVec2D = (forwardVec[0], forwardVec[1], 0);
	unitForwardVec2D = VectorNormalize(forwardVec2D);
	toFaceeVec = vDir * -1;
	toFaceeVec2D = (toFaceeVec[0], toFaceeVec[1], 0);
	unitToFaceeVec2D = VectorNormalize(toFaceeVec2D);
	dotProduct = VectorDot(unitForwardVec2D, unitToFaceeVec2D);
	return dotProduct > limit;
}

/*
	Name: player_damage_shield
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x10C0
	Size: 0x268
	Parameters: 4
	Flags: None
	Line Number: 366
*/
function player_damage_shield(iDamage, bHeld, fromCode, smod)
{
	if(!isdefined(fromCode))
	{
		fromCode = 0;
	}
	if(!isdefined(smod))
	{
		smod = "MOD_UNKNOWN";
	}
	damageMax = level.weaponRiotshield.weaponstarthitpoints;
	if(isdefined(self.weaponRiotshield))
	{
		damageMax = self.weaponRiotshield.weaponstarthitpoints;
	}
	shieldHealth = damageMax;
	shieldDamage = iDamage;
	if(self namespace_851dc78f::function_b690a849("specialty_victorious"))
	{
		shieldDamage = Int(shieldDamage * 0.5);
	}
	rumbled = 0;
	if(fromCode)
	{
		shieldDamage = 0;
	}
	shieldHealth = self DamageRiotShield(shieldDamage);
	if(shieldHealth <= 0)
	{
		if(!rumbled)
		{
			self PlayRumbleOnEntity("damage_heavy");
			Earthquake(1, 0.75, self.origin, 100);
		}
		self thread player_take_riotshield();
	}
	else if(!rumbled)
	{
		self PlayRumbleOnEntity("damage_light");
		Earthquake(0.5, 0.5, self.origin, 100);
	}
	self playsound("fly_riotshield_zm_impact_zombies");
	self UpdateRiotShieldModel();
	self clientfield::set_player_uimodel("zmInventory.shield_health", shieldHealth / damageMax);
}

/*
	Name: player_take_riotshield
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x1330
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 422
*/
function player_take_riotshield()
{
	self notify("destroy_riotshield");
	current = self GetCurrentWeapon();
	if(current.isRiotShield)
	{
		if(!self laststand::player_is_in_laststand())
		{
			new_primary = level.weaponNone;
			primaryWeapons = self getweaponslistprimaries();
			for(i = 0; i < primaryWeapons.size; i++)
			{
				if(!primaryWeapons[i].isRiotShield)
				{
					new_primary = primaryWeapons[i];
					break;
				}
			}
			if(new_primary == level.weaponNone)
			{
				self zm_weapons::give_fallback_weapon();
				self SwitchToWeaponImmediate();
				self playsound("wpn_riotshield_zm_destroy");
			}
			else
			{
				self SwitchToWeaponImmediate();
				self playsound("wpn_riotshield_zm_destroy");
				self waittill("weapon_change");
			}
		}
	}
	self playsound("zmb_rocketshield_break");
	if(isdefined(self.weaponRiotshield))
	{
		self zm_equipment::take(self.weaponRiotshield);
	}
	else
	{
		self zm_equipment::take(level.weaponRiotshield);
	}
	self.hasRiotShield = 0;
	self.hasRiotShieldEquipped = 0;
}

/*
	Name: UpdateRiotShieldModel
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x1540
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 477
*/
function UpdateRiotShieldModel()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: function_5f9a13b3
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x1720
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 497
*/
function function_5f9a13b3(perk)
{
	return namespace_851dc78f::function_5f9a13b3(perk);
	ERROR: Bad function call
}

/*
	Name: function_b690a849
	Namespace: namespace_961a2806
	Checksum: 0x424F4353
	Offset: 0x1750
	Size: 0x22
	Parameters: 1
	Flags: None
	Line Number: 513
*/
function function_b690a849(perk)
{
	return namespace_851dc78f::function_b690a849(perk);
}

