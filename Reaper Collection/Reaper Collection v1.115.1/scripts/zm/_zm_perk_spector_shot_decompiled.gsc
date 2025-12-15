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

#namespace namespace_2248ddce;

/*
	Name: __init__sytem__
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x610
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 45
*/
function autoexec __init__sytem__()
{
	system::register("SPECTOR_SHOT", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x650
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function __init__()
{
	function_1a92256e();
	return;
}

/*
	Name: function_1a92256e
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x670
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_spectorshot", "customperk", 3000, &"ZM_REAP_MOD_PERK_SPECTOR_SHOT", GetWeapon("zombie_perk_bottle_spector_shot"));
	zm_perks::register_perk_precache_func("specialty_spectorshot", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_spectorshot", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_spectorshot", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_spectorshot", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_spectorshot", "Spectre Shot", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_spectorshot", &"ZM_REAP_MOD_PERK_SPECTOR_SHOT_DB", 2000, "Spectre Shot", "spectorshot");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_spectorshot"] = 1;
	zm_spawner::register_zombie_damage_callback(&function_5986e506);
	zm_spawner::register_zombie_death_event_callback(&function_1c4e025e);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x850
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_spectorshot"] = spawnstruct();
	level.machine_assets["specialty_spectorshot"].weapon = GetWeapon("zombie_perk_bottle_spector_shot");
	level.machine_assets["specialty_spectorshot"].off_model = "cz_vending_spectorshot";
	level.machine_assets["specialty_spectorshot"].on_model = "cz_vending_spectorshot_on";
}

/*
	Name: function_19157aff
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x8F8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 124
*/
function function_19157aff()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: function_99c1452c
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x908
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 144
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_spectorshot", "spectorshot", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x950
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 159
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_spectorshot_jingle";
	use_trigger.script_string = "specialty_spectorshot";
	use_trigger.script_label = "mus_perks_spectorshot_sting";
	use_trigger.target = "Spectre Shot";
	perk_machine.script_string = "specialty_spectorshot";
	perk_machine.targetname = "Spectre Shot";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_spectorshot";
		return;
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0xA18
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 184
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_spectorshot"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_spectorshot"] = 1;
	self thread function_2248ddce();
}

/*
	Name: function_b4722825
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0xAB0
	Size: 0x68
	Parameters: 3
	Flags: None
	Line Number: 213
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_spectorshot"] = 0;
	self.var_b5c2c258["specialty_spectorshot"] = undefined;
	self.var_d6aef449["specialty_spectorshot"] = undefined;
	self notify("hash_a024193f");
}

/*
	Name: function_2248ddce
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0xB20
	Size: 0x3C0
	Parameters: 0
	Flags: None
	Line Number: 231
*/
function function_2248ddce()
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_spectorshot", "spectorshot", "Meter", Int(100));
	charge = 24;
	self thread function_1c47180b();
	while(self namespace_851dc78f::function_5f9a13b3("specialty_spectorshot"))
	{
		primaryWeapons = self getweaponslistprimaries();
		self.var_d47ef593 = undefined;
		if(function_68132e8f(self))
		{
			current = self GetCurrentWeapon();
		}
		if(!isdefined(current))
		{
			wait(0.2);
		}
		else
		{
			self waittill("weapon_change");
		}
		if(self namespace_851dc78f::function_5f9a13b3("specialty_spectorshot"))
		{
			isNew = 1;
			for(i = 0; i < primaryWeapons.size; i++)
			{
				if(primaryWeapons[i] == self GetCurrentWeapon())
				{
					isNew = 0;
				}
			}
			if(!isNew && isdefined(current) && function_68132e8f(self))
			{
				zombies = util::get_array_of_closest(self.origin, GetAISpeciesArray("axis", "all"), undefined, undefined, 400);
				if(zombies.size >= 10)
				{
					self thread function_b8e4a375(current);
					self.var_d47ef593 = 1;
					upgraded = self namespace_851dc78f::function_b690a849("specialty_spectorshot");
					for(i = 0; i < charge; i++)
					{
						self thread namespace_4b6e359c::function_75aa16e4("specialty_spectorshot", "spectorshot", "Meter", Int(charge - i / charge * 100));
						if(upgraded)
						{
							wait(0.05);
						}
						wait(0.25);
					}
					self notify("hash_ef675dbd");
					recharge = 45;
					for(i = 1; i < recharge; i++)
					{
						self thread namespace_4b6e359c::function_75aa16e4("specialty_spectorshot", "spectorshot", "Meter", Int(i / 45 * 100));
						if(!upgraded)
						{
							wait(0.15);
						}
						wait(0.85);
					}
				}
			}
			else
			{
				wait(1);
			}
		}
	}
	return;
}

/*
	Name: function_68132e8f
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0xEE8
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 311
*/
function function_68132e8f(player)
{
	if(player laststand::player_is_in_laststand() || (isdefined(player.intermission) && player.intermission))
	{
		return 0;
	}
	if(player zm_utility::in_revive_trigger())
	{
		return 0;
	}
	if(!player zm_magicbox::can_buy_weapon())
	{
		return 0;
	}
	if(player IsThrowingGrenade())
	{
		return 0;
	}
	if(player.IS_DRINKING > 0)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_1c47180b
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0xFB8
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 346
*/
function function_1c47180b()
{
	self endon("hash_a024193f");
	wait(0.1);
	var_37542692 = 0;
	while(self namespace_851dc78f::function_5f9a13b3("specialty_spectorshot"))
	{
		var_a14a019f = 0;
		if(!isdefined(self.var_d47ef593))
		{
			zombies = util::get_array_of_closest(self.origin, GetAISpeciesArray("axis", "all"), undefined, undefined, 300);
			if(zombies.size >= 10)
			{
				var_a14a019f = 1;
			}
		}
		if(var_a14a019f != var_37542692)
		{
			self thread namespace_4b6e359c::function_75aa16e4("specialty_spectorshot", "spectorshot", "overlayStyleGreen", var_a14a019f);
			var_37542692 = var_a14a019f;
		}
		wait(0.5);
	}
	return;
}

/*
	Name: function_b8e4a375
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x10E8
	Size: 0x348
	Parameters: 1
	Flags: None
	Line Number: 382
*/
function function_b8e4a375(w_summoned_weapon)
{
	w_summoned_weapon = w_summoned_weapon.rootweapon;
	v_target_zombie_origin = self.origin;
	upgraded = self namespace_851dc78f::function_b690a849("specialty_spectorshot");
	v_firing_pos = v_target_zombie_origin + VectorScale((0, 0, 1), 64);
	v_start_yaw = VectorToAngles(v_firing_pos - v_target_zombie_origin);
	v_start_yaw = (0, v_start_yaw[1], 0);
	mdl_weapon = zm_utility::spawn_weapon_model(w_summoned_weapon, undefined, v_firing_pos, v_start_yaw);
	mdl_weapon.owner = self;
	mdl_weapon.var_fb7f32c7 = 1;
	mdl_weapon.weapon = w_summoned_weapon;
	mdl_weapon.allow_zombie_to_target_ai = 1;
	mdl_weapon thread function_1b3a7cc0(self);
	mdl_weapon namespace_851dc78f::function_4621bbdd("scriptmover", "spectorshot_render", 1);
	playFX(level._effect["teleport_aoe"], mdl_weapon.origin);
	while(isdefined(mdl_weapon))
	{
		zombie = mdl_weapon function_1d220b86();
		if(isdefined(zombie))
		{
			if(upgraded)
			{
				if(isdefined(zombie GetTagOrigin("j_head")))
				{
					v_target_pos = zombie GetTagOrigin("j_head");
				}
				else
				{
					v_target_pos = zombie GetCentroid();
				}
			}
			else
			{
				v_target_pos = zombie GetCentroid();
			}
			mdl_weapon.angles = VectorToAngles(v_target_pos - mdl_weapon.origin);
			v_flash_pos = mdl_weapon GetTagOrigin("tag_flash");
			if(!isdefined(v_flash_pos))
			{
				v_flash_pos = mdl_weapon GetTagOrigin("tag_origin");
			}
			if(!isdefined(v_flash_pos))
			{
				v_flash_pos = mdl_weapon.origin;
			}
			mdl_weapon DontInterpolate();
			MagicBullet(w_summoned_weapon, v_flash_pos, v_target_pos, mdl_weapon);
		}
		wait(0.1);
	}
}

/*
	Name: function_1d220b86
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x1438
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 445
*/
function function_1d220b86()
{
	a_ai_zombies = Array::randomize(GetAITeamArray("axis"));
	los_checks = 0;
	for(i = 0; i < a_ai_zombies.size; i++)
	{
		zombie = a_ai_zombies[i];
		test_origin = zombie GetCentroid();
		if(DistanceSquared(self.origin, test_origin) > 250000)
		{
			continue;
		}
		if(los_checks < 3 && !zombie damageConeTrace(self.origin))
		{
			los_checks++;
			continue;
		}
		return zombie;
	}
	return undefined;
}

/*
	Name: function_1b3a7cc0
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x1558
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 477
*/
function function_1b3a7cc0(player)
{
	player waittill("hash_ef675dbd");
	self namespace_851dc78f::function_4621bbdd("scriptmover", "spectorshot_render", 0);
	playFX(level._effect["teleport_aoe"], self.origin);
	self delete();
}

/*
	Name: function_5986e506
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x15F0
	Size: 0x260
	Parameters: 13
	Flags: None
	Line Number: 495
*/
function function_5986e506(str_mod, str_hit_location, v_hit_origin, e_attacker, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(isdefined(e_attacker.var_fb7f32c7) && e_attacker.var_fb7f32c7)
	{
		if(self.health <= n_amount && e_attacker.owner hasweapon(e_attacker.weapon) && e_attacker.owner function_5682d28e(e_attacker.weapon))
		{
			e_attacker.owner thread function_32d5986f(e_attacker.weapon);
		}
		self thread function_af439050(e_attacker.owner, 0.4);
		self DoDamage(Int(n_amount), e_attacker.owner.origin, e_attacker.owner, e_attacker.owner, 0, str_mod, 0, w_weapon);
		if(e_attacker.owner namespace_851dc78f::function_b690a849("specialty_spectorshot") && self.archetype === "zombie")
		{
			self DoDamage(Int(n_amount) * 2, e_attacker.owner.origin, e_attacker.owner, e_attacker.owner, 0, str_mod, 0, w_weapon);
		}
	}
	return 0;
}

/*
	Name: function_5682d28e
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x1858
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 523
*/
function function_5682d28e(gun)
{
	if(zm_weapons::is_wonder_weapon(gun))
	{
		if(gun == GetWeapon("ray_gun"))
		{
			return 1;
		}
		return 0;
	}
	can_use = 0;
	primaryWeapons = self getweaponslistprimaries();
	for(i = 0; i < primaryWeapons.size; i++)
	{
		if(primaryWeapons[i] == gun)
		{
			can_use = 1;
		}
	}
	if(!can_use)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_32d5986f
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x1938
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 559
*/
function function_32d5986f(weapon)
{
	var_ed934c5b = 1;
	if(weapon.clipSize > 0)
	{
		var_ed934c5b = Int(weapon.clipSize / 5);
	}
	if(var_ed934c5b < 1)
	{
		var_ed934c5b = 1;
	}
	if(isdefined(level.var_daebd49c))
	{
		self [[level.var_daebd49c]](weapon, var_ed934c5b);
	}
	else
	{
		self SetWeaponAmmoStock(weapon, self GetWeaponAmmoStock(weapon) + var_ed934c5b);
		return;
	}
}

/*
	Name: function_1c4e025e
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x1A18
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 591
*/
function function_1c4e025e(attacker)
{
	if(isdefined(attacker))
	{
		if(isdefined(attacker.var_fb7f32c7) && attacker.var_fb7f32c7)
		{
			if(isdefined(attacker.owner))
			{
				attacker.owner thread function_32d5986f(attacker.weapon);
				e_attacking_player = attacker.owner;
			}
		}
	}
}

/*
	Name: function_af439050
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x1AB0
	Size: 0x1F0
	Parameters: 2
	Flags: None
	Line Number: 616
*/
function function_af439050(attacker, rate)
{
	self endon("death");
	self endon("widows_wine_cocoon");
	self notify("hash_af439050");
	self endon("hash_af439050");
	self thread function_ae8d23ff();
	self namespace_851dc78f::function_4621bbdd("actor", "frozen_zombie_test", 1);
	self playsound("winters_wail_freeze");
	if(!isdefined(self.var_d7ae97e8))
	{
		self.var_d7ae97e8 = 1;
	}
	if(self.var_d7ae97e8 - rate < 0)
	{
		self.var_d7ae97e8 = 0;
	}
	else if(self.var_d7ae97e8 > 0)
	{
		self.var_d7ae97e8 = self.var_d7ae97e8 - rate;
	}
	for(time = 15 * rate; time > 0; time = 15 * rate)
	{
		self ASMSetAnimationRate(self.var_d7ae97e8);
		wait(0.2);
	}
	self namespace_851dc78f::function_4621bbdd("actor", "frozen_zombie_test", 0);
	while(self.var_d7ae97e8 < 1)
	{
		wait(0.2);
		self.var_d7ae97e8 = self.var_d7ae97e8 + 0.2;
		if(self.var_d7ae97e8 > 1)
		{
			self.var_d7ae97e8 = 1;
		}
		self ASMSetAnimationRate(self.var_d7ae97e8);
	}
}

/*
	Name: function_ae8d23ff
	Namespace: namespace_2248ddce
	Checksum: 0x424F4353
	Offset: 0x1CA8
	Size: 0x34
	Parameters: 0
	Flags: None
	Line Number: 665
*/
function function_ae8d23ff()
{
	self endon("hash_af439050");
	self waittill("death");
	self ASMSetAnimationRate(1);
}

