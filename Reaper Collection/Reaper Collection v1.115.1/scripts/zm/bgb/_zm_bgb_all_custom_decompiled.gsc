#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerup_bonfire_sale;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\aats\_zm_aat_turned;

#namespace namespace_ca0ebbdc;

/*
	Name: __init__sytem__
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0xDF8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 39
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_all_custom", &__init__, undefined, "bgb");
	return;
}

/*
	Name: __init__
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0xE38
	Size: 0xBD8
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	if(!isdefined(level.perk_damage_override))
	{
		level.perk_damage_override = [];
	}
	bgb::register("zm_bgb_arbitrary_armament", "rounds", 0, &enable, &disable, undefined, undefined);
	level thread function_2b9a66a7();
	bgb::register("zm_bgb_armoured_up", "event", &function_fc8bb214, undefined, undefined, undefined);
	Array::add(level.perk_damage_override, &function_1db204d5, 0);
	bgb::register("zm_bgb_bearly_alive", "rounds", 4, &enable, &disable, undefined, undefined);
	zm_spawner::register_zombie_death_event_callback(&function_8f2627fa);
	bgb::register("zm_bgb_bottomless_bullets", "activated", 2, &enable, &function_696ef1dc, &function_2dd70cc7, &function_cab1ae3c);
	bgb::register("zm_bgb_bullet_bucks", "activated", 1, &enable, &disable, &function_6260548, &function_b59cb7c1);
	bgb::register("zm_bgb_chilling_conclusion", "activated", 2, &function_b7927cdf, &function_1ad47dea, &function_bb4c135, &function_b8936f0a);
	bgb::register("zm_bgb_conflagration_liquidation", "activated", 1, &enable, &disable, undefined, &function_dd641fdf);
	bgb::register("zm_bgb_ctrl_z", "activated", 4, &function_c2a7e6e1, &function_5eb240f8, &function_83732e7d, &function_a49d8ec);
	bgb::register("zm_bgb_disorientated_distance", "event", &function_3478535c, undefined, undefined, undefined);
	Array::add(level.perk_damage_override, &function_9060cdcd, 0);
	bgb::register("zm_bgb_exceptionally_equipped", "event", &function_fa155cfc, undefined, undefined, undefined);
	bgb::register("zm_bgb_expenditure_exemption", "time", 300, &enable, &disable, undefined, undefined);
	zm_score::function_b14604c0(&function_3bed0ada);
	zm_score::function_b534cc03(&function_2c729b5b);
	bgb::register("zm_bgb_firearm_formulation", "activated", 2, &enable, &disable, &function_bab02ce4, &function_289f1ecd);
	bgb::register("zm_bgb_flatulence_fulmination", "event", &function_78d0e629, undefined, undefined, undefined);
	zm_spawner::register_zombie_death_event_callback(&function_17b08535);
	bgb::register("zm_bgb_here_they_rise", "activated", 2, &enable, &disable, &function_d9d850bc, &function_3d087e05);
	bgb::register("zm_bgb_join_the_party", "activated", 2, undefined, undefined, &function_21488856, &function_537451f);
	bgb::register("zm_bgb_malevolent_presence", "time", 180, &enable, &disable, undefined, undefined);
	level thread function_7014f9df();
	clientfield::register("actor", "bgb_malevolent_presence", 21000, 1, "int");
	bgb::register("zm_bgb_mighty_midas", "rounds", 1, &function_cb9e4120, &function_80779ad6, undefined, undefined);
	level thread function_d3eecb2b();
	bgb::register("zm_bgb_miraculous_box", "event", &function_85f3d869, undefined, undefined, undefined);
	level thread function_b41b5791();
	function_68b7934d(&function_49d80685);
	bgb::register("zm_bgb_next_rounds_on_me", "event", &function_2784378f, undefined, undefined, undefined);
	callback::on_spawned(&function_88bbdc97);
	zm_utility::function_41a08da2(&function_940c7219);
	bgb::register("zm_bgb_nowhere_but_there", "activated", 3, &enable, &disable, &function_26924076, &function_3edf5b0f);
	bgb::register("zm_bgb_on_a_whim", "event", &function_8f9520e0, undefined, undefined, undefined);
	level.var_65368e92 = "";
	bgb::register("zm_bgb_play_it_again_sam", "activated", 5, &enable, &disable, &function_5123dfa0, &function_d3efa019);
	level thread function_d5cd4827();
	bgb::register("zm_bgb_point_drops", "activated", 5, &enable, &disable, &function_75f89a6, &function_e82614df);
	bgb::register("zm_bgb_power_keg", "activated", 2, &enable, &disable, &function_ea29a1da, &function_103af0b3);
	bgb::register("zm_bgb_power_to_the_people", "event", &function_96de4544, undefined, undefined, undefined);
	function_dc569223();
	bgb::register("zm_bgb_quacknarok", "time", 300, &enable, &disable, undefined, undefined);
	zm_spawner::add_custom_zombie_spawn_logic(&function_46383f8a);
	level thread function_eaf4c9a2();
	level thread function_3f5675b2();
	bgb::register("zm_bgb_shields_up", "activated", 2, &enable, &disable, &function_6b1f59d, &function_d31a072);
	bgb::register("zm_bgb_sucker_points", "time", 180, &enable, &disable, undefined, undefined);
	Array::add(level.perk_damage_override, &function_8e84f003, 0);
	bgb::register("zm_bgb_prismatic_touch", "activated", 20, &enable, &disable, &function_a3942d9, &function_fc4def8e);
	bgb::register("zm_bgb_grim_fate", "activated", 1, &enable, &disable, &function_942ffd13, &function_23441668);
}

/*
	Name: enable
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x1A18
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 128
*/
function enable()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: disable
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x1A28
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 144
*/
function disable()
{
	return;
}

/*
	Name: function_2b9a66a7
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x1A38
	Size: 0x2D0
	Parameters: 0
	Flags: None
	Line Number: 159
*/
function function_2b9a66a7()
{
	while(1)
	{
		level waittill("weapon_bought", player, weapon);
		wait(0.05);
		if(player hasweapon(weapon) && player bgb::is_enabled("zm_bgb_arbitrary_armament"))
		{
			player TakeWeapon(weapon);
			keys = Array::randomize(getArrayKeys(level.zombie_weapons));
			for(i = 0; i < keys.size; i++)
			{
				if(isdefined(keys[i].isgrenadeweapon) && keys[i].isgrenadeweapon)
				{
					continue;
				}
				if(isdefined(keys[i].isMeleeWeapon) && keys[i].isMeleeWeapon)
				{
					continue;
				}
				if(player zm_weapons::has_weapon_or_upgrade(keys[i]))
				{
					continue;
				}
				if(zm_weapons::get_is_in_box(keys[i]))
				{
					guns[guns.size] = keys[i];
				}
			}
			guns = Array::randomize(guns);
			gun = guns[0];
			weapon_limit = zm_utility::get_player_weapon_limit(player);
			Primaries = player getweaponslistprimaries();
			if(isdefined(Primaries) && Primaries.size >= weapon_limit)
			{
				gun = player zm_weapons::weapon_give(gun);
			}
			else
			{
				gun = player zm_weapons::give_build_kit_weapon(gun);
				player GiveStartAmmo(gun);
			}
			player SwitchToWeapon(gun);
			player bgb::do_one_shot_use();
		}
	}
}

/*
	Name: function_fc8bb214
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x1D10
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 217
*/
function function_fc8bb214()
{
	self endon("disconnect");
	self.var_54097639 = 20;
	self bgb::set_timer(self.var_54097639, 20);
	while(self bgb::is_enabled("zm_bgb_armoured_up") && self.var_54097639 > 0)
	{
		wait(0.1);
	}
	return;
}

/*
	Name: function_3dab839a
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x1D98
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 239
*/
function function_3dab839a()
{
	if(!self bgb::is_enabled("zm_bgb_armoured_up") || !isdefined(self.var_54097639))
	{
		if(!self bgb::is_enabled("zm_bgb_armoured_up") && isdefined(self.var_54097639))
		{
			self.var_54097639 = undefined;
			return;
		}
	}
	self.var_54097639--;
	self bgb::set_timer(self.var_54097639, 20);
	self bgb::do_one_shot_use();
}

/*
	Name: function_1db204d5
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x1E58
	Size: 0x270
	Parameters: 10
	Flags: None
	Line Number: 264
*/
function function_1db204d5(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(self namespace_851dc78f::function_5f9a13b3("specialty_slider") || self namespace_851dc78f::function_5f9a13b3("specialty_da_phd_slider") || self bgb::is_enabled("zm_bgb_danger_closest"))
	{
		if(sMeansOfDeath == "MOD_ELECTOCUTED" || sMeansOfDeath == "MOD_EXPLOSIVE" || sMeansOfDeath == "MOD_EXPLOSIVE_SPLASH" || sMeansOfDeath == "MOD_FALLING" || sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_PROJECTILE" || sMeansOfDeath == "MOD_PROJECTILE_SPLASH" || sMeansOfDeath == "MOD_GRENADE_SPLASH" || sMeansOfDeath == "MOD_SUICIDE" || sMeansOfDeath == "MOD_IMPACT")
		{
			return undefined;
		}
	}
	if(sMeansOfDeath == "MOD_PROJECTILE" || sMeansOfDeath == "MOD_PROJECTILE_SPLASH" || sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_GRENADE_SPLASH" || sMeansOfDeath == "MOD_EXPLOSIVE")
	{
		if(isdefined(weapon.name) && (weapon.name == "ray_gun" || weapon.name == "ray_gun_upgraded"))
		{
			if(self.health > 25 && iDamage > 25)
			{
				return undefined;
			}
		}
		else if(self.health > 75 && iDamage > 75)
		{
			return undefined;
		}
	}
	if(isdefined(self.var_54097639))
	{
		self thread function_3dab839a();
		return 0;
	}
	return undefined;
}

/*
	Name: function_8f2627fa
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x20D0
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 305
*/
function function_8f2627fa(attacker)
{
	if(isdefined(self.attacker) && isPlayer(self.attacker) && self.attacker bgb::is_enabled("zm_bgb_bearly_alive") && isdefined(self.damagelocation))
	{
		if(isdefined(self.damageMod) && isdefined(self.damageWeapon) && (self.damageMod == "MOD_RIFLE_BULLET" || self.damageMod == "MOD_PISTOL_BULLET") && zm_utility::is_headshot(self.damageWeapon, self.damagelocation, self.damageMod))
		{
			self thread function_2a17787e(self.attacker);
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_2a17787e
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x21C8
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 329
*/
function function_2a17787e(player)
{
	player bgb::do_one_shot_use();
	for(i = 0; i < 4; i++)
	{
		level thread function_1861d05d(self GetTagOrigin("J_Head"));
	}
}

/*
	Name: function_1861d05d
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2250
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 348
*/
function function_1861d05d(orig)
{
	model = level.chest_joker_model;
	if(!IsSubStr(model, "teddy") && !IsSubStr(model, "bear"))
	{
		model = "p7_zm_teddybear";
	}
	bear = spawn("script_model", orig);
	bear SetModel(model);
	bear.angles = (RandomInt(360), RandomInt(360), RandomInt(360));
	bear physicslaunch(bear.origin, (randomIntRange(-10, 10), randomIntRange(-10, 10), 20));
	wait(15);
	bear delete();
}

/*
	Name: function_696ef1dc
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x23E0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 373
*/
function function_696ef1dc()
{
	level thread function_13a4feba(0);
	level.var_fd549426 = undefined;
	return;
}

/*
	Name: function_2dd70cc7
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2410
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 390
*/
function function_2dd70cc7()
{
	if(isdefined(level.var_fd549426))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_cab1ae3c
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2430
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 409
*/
function function_cab1ae3c()
{
	self endon("disconnect");
	level.var_fd549426 = 1;
	level thread function_13a4feba(1);
	time = 30;
	self thread bgb::run_timer(time);
	while(time > 0 && self bgb::is_enabled("zm_bgb_bottomless_bullets"))
	{
		wait(0.1);
		time = time - 0.1;
	}
	level thread function_13a4feba(0);
	wait(0.5);
	level.var_fd549426 = undefined;
	return;
}

/*
	Name: function_13a4feba
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2508
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 437
*/
function function_13a4feba(num)
{
	SetDvar("player_sustainAmmo", num);
}

/*
	Name: function_6260548
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2540
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 452
*/
function function_6260548()
{
	if(self zm_utility::has_powerup_weapon())
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_b59cb7c1
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2570
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 471
*/
function function_b59cb7c1()
{
	self endon("disconnect");
	self waittill("weapon_change_complete");
	weapon = self GetCurrentWeapon();
	weapon = zm_weapons::get_nonalternate_weapon(weapon);
	if(isdefined(weapon))
	{
		stock = self GetWeaponAmmoStock(weapon);
		if(isdefined(level.var_c510219a))
		{
			stock = [[level.var_c510219a]](weapon);
		}
		clip = self GetWeaponAmmoClip(weapon);
		Total = stock + clip;
		if(Total > 0)
		{
			self SetWeaponAmmoStock(weapon, 0);
			self SetWeaponAmmoClip(weapon, 0);
			self zm_score::add_to_player_score(Int(Total * 30 * level.zombie_vars[self.team]["zombie_point_scalar"]));
		}
	}
}

/*
	Name: function_b7927cdf
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x26E8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 505
*/
function function_b7927cdf()
{
	if(isdefined(self.var_e857cec4))
	{
		self.var_e857cec4 thread function_4216f1b5();
		self.var_e857cec4 = undefined;
	}
	self bgb::set_timer(2, 2);
	self waittill("hash_c1680790");
	while(isdefined(self.var_e857cec4))
	{
		wait(0.05);
	}
	return;
}

/*
	Name: function_1ad47dea
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2770
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 531
*/
function function_1ad47dea()
{
	if(isdefined(self.var_e857cec4))
	{
		self.var_e857cec4 thread function_4216f1b5();
	}
}

/*
	Name: function_bb4c135
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x27A8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 549
*/
function function_bb4c135()
{
	if(isdefined(self.var_e857cec4))
	{
		return 1;
	}
	else
	{
		return isdefined(function_f3002da0());
	}
}

/*
	Name: function_b8936f0a
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x27E0
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 571
*/
function function_b8936f0a()
{
	if(isdefined(self.var_e857cec4))
	{
		self.var_e857cec4 thread function_4216f1b5(self);
		self.var_e857cec4 = undefined;
	}
	else
	{
		self.var_e857cec4 = function_f3002da0();
		if(isdefined(self.var_e857cec4))
		{
			self bgb::do_one_shot_use();
			self bgb::set_timer(1, 2);
			self notify("hash_c1680790");
			self.var_e857cec4 thread function_a282984a(self);
			return;
		}
	}
}

/*
	Name: function_f3002da0
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x28A8
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 602
*/
function function_f3002da0()
{
	var_8a184cf4 = undefined;
	a_ai = GetAIArray();
	var_aca0d7c7 = ArraySortClosest(a_ai, self.origin, a_ai.size, 0, 300);
	foreach(ai in var_aca0d7c7)
	{
		if(IsActor(ai) && !isdefined(var_8a184cf4))
		{
			if(ai.archetype === "zombie" && !self IsPaused())
			{
				var_8a184cf4 = ai;
			}
		}
	}
	return var_8a184cf4;
}

/*
	Name: function_a282984a
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x29F0
	Size: 0x1D0
	Parameters: 1
	Flags: None
	Line Number: 630
*/
function function_a282984a(player)
{
	player endon("disconnect");
	self endon("hash_5b62c15a");
	self endon("death");
	self thread function_21dce833(player);
	self thread function_cb03b20d(player);
	self SetEntityPaused(1);
	while(isdefined(isalive(self)))
	{
		if(isdefined(self) && !self IsPaused())
		{
			self SetEntityPaused(1);
		}
		self.spawn_time = GetTime();
		self.b_ignore_cleanup = 1;
		self.traversal = 1;
		self.b_teleporting = 1;
		self.completed_emerging_into_playable_area = 0;
		self.script_string = "clilled";
		wait(0.05);
	}
	self SetEntityPaused(0);
	player.var_e857cec4 = undefined;
	if(isdefined(player))
	{
		player bgb::do_one_shot_use();
		player bgb::set_timer(0, 2);
		player.var_e857cec4 = undefined;
		if(player bgb::is_enabled("zm_bgb_chilling_conclusion"))
		{
			player bgb::take();
		}
	}
}

/*
	Name: function_4216f1b5
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2BC8
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 676
*/
function function_4216f1b5(player)
{
	self SetEntityPaused(0);
	self DoDamage(self.health + 666, self.origin, self);
	if(isdefined(player))
	{
		player bgb::do_one_shot_use();
		player bgb::set_timer(0, 2);
		player.var_e857cec4 = undefined;
		wait(1);
		if(player bgb::is_enabled("zm_bgb_chilling_conclusion"))
		{
			player thread bgb::take();
		}
	}
}

/*
	Name: function_21dce833
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2CA8
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 703
*/
function function_21dce833()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: function_cb03b20d
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2D60
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 723
*/
function function_cb03b20d(player)
{
	self endon("death");
	self endon("hash_5b62c15a");
	player endon("hash_5b62c15a");
	player waittill("disconnect");
	self function_4216f1b5(player);
}

/*
	Name: function_dd641fdf
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2DC0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 742
*/
function function_dd641fdf()
{
	self endon("disconnect");
	v_origin = self.origin + VectorScale(AnglesToForward((0, self getPlayerAngles()[1], 0)), 60) + VectorScale((0, 0, 1), 5);
	powerup = zm_powerups::specific_powerup_drop("bonfire_sale", v_origin);
}

/*
	Name: function_c2a7e6e1
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2E58
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 759
*/
function function_c2a7e6e1()
{
	self.var_32a32c49 = 4;
	self bgb::set_timer(self.var_32a32c49, 4);
}

/*
	Name: function_5eb240f8
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2E98
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 775
*/
function function_5eb240f8()
{
	self.var_32a32c49 = undefined;
}

/*
	Name: function_83732e7d
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2EB0
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 790
*/
function function_83732e7d()
{
	a_ai = GetAIArray();
	var_aca0d7c7 = ArraySortClosest(a_ai, self.origin, a_ai.size, 0, 300);
	foreach(ai in var_aca0d7c7)
	{
		if(IsActor(ai))
		{
			if(ai.archetype === "zombie")
			{
				return 1;
			}
		}
	}
	return 0;
}

/*
	Name: function_a49d8ec
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x2FB8
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 817
*/
function function_a49d8ec()
{
	var_c5d53830 = 3;
	a_ai = GetAIArray();
	var_aca0d7c7 = ArraySortClosest(a_ai, self.origin, a_ai.size, 0, 300);
	foreach(ai in var_aca0d7c7)
	{
		if(IsActor(ai) && var_c5d53830 > 0)
		{
			if(ai.archetype === "zombie")
			{
				ai thread function_a4d05ddf(self);
				var_c5d53830--;
			}
		}
	}
	if(var_c5d53830 < 3)
	{
		self.var_32a32c49 = self.var_32a32c49 - 1;
		self bgb::do_one_shot_use();
		self bgb::set_timer(self.var_32a32c49, 4);
	}
}

/*
	Name: function_a4d05ddf
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x3158
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 851
*/
function function_a4d05ddf(attacker)
{
	self thread clientfield::set("zm_aat_turned", 1);
	self thread zm_aat_turned::zombie_death_time_limit(attacker);
	self.team = "allies";
	self.aat_turned = 1;
	self.n_aat_turned_zombie_kills = 0;
	self.allowdeath = 0;
	self.allowPain = 0;
	self.no_gib = 1;
	self zombie_utility::set_zombie_run_cycle("sprint");
	if(math::cointoss())
	{
		if(self.zombie_arms_position == "up")
		{
			self.variant_type = 6;
		}
		else
		{
			self.variant_type = 7;
		}
	}
	else if(self.zombie_arms_position == "up")
	{
		self.variant_type = 7;
	}
	else
	{
		self.variant_type = 8;
	}
	self thread zm_aat_turned::zombie_kill_tracker(attacker);
	return;
	waittillframeend;
}

/*
	Name: function_3478535c
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x32A0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 896
*/
function function_3478535c()
{
	self endon("disconnect");
	self.var_ae5de961 = 4;
	self thread bgb::set_timer(self.var_ae5de961, 4);
	while(self bgb::is_enabled("zm_bgb_disorientated_distance") && self.var_ae5de961 > 0)
	{
		wait(0.1);
	}
	return;
}

/*
	Name: function_9060cdcd
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x3328
	Size: 0x298
	Parameters: 10
	Flags: None
	Line Number: 918
*/
function function_9060cdcd(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!self bgb::is_enabled("zm_bgb_disorientated_distance"))
	{
		return undefined;
	}
	if(self namespace_851dc78f::function_5f9a13b3("specialty_slider") || self namespace_851dc78f::function_5f9a13b3("specialty_da_phd_slider") || self bgb::is_enabled("zm_bgb_danger_closest"))
	{
		if(sMeansOfDeath == "MOD_ELECTOCUTED" || sMeansOfDeath == "MOD_EXPLOSIVE" || sMeansOfDeath == "MOD_EXPLOSIVE_SPLASH" || sMeansOfDeath == "MOD_FALLING" || sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_PROJECTILE" || sMeansOfDeath == "MOD_PROJECTILE_SPLASH" || sMeansOfDeath == "MOD_GRENADE_SPLASH" || sMeansOfDeath == "MOD_SUICIDE" || sMeansOfDeath == "MOD_IMPACT")
		{
			return undefined;
		}
	}
	if(sMeansOfDeath == "MOD_PROJECTILE" || sMeansOfDeath == "MOD_PROJECTILE_SPLASH" || sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_GRENADE_SPLASH" || sMeansOfDeath == "MOD_EXPLOSIVE")
	{
		if(isdefined(weapon.name) && (weapon.name == "ray_gun" || weapon.name == "ray_gun_upgraded"))
		{
			if(self.health > 25 && iDamage > 25)
			{
				return undefined;
			}
		}
		else if(self.health > 75 && iDamage > 75)
		{
			return undefined;
		}
	}
	if(self.health - iDamage < 10)
	{
		self thread function_14772562();
		return 0;
	}
	return undefined;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_14772562
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x35C8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 964
*/
function function_14772562()
{
	self.var_ae5de961 = self.var_ae5de961 - 1;
	self thread bgb::set_timer(self.var_ae5de961, 4);
	self bgb::do_one_shot_use();
	self [[level.bgb["zm_bgb_anywhere_but_here"].var_6fa3d682]]();
}

/*
	Name: function_fa155cfc
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x3648
	Size: 0x408
	Parameters: 0
	Flags: None
	Line Number: 982
*/
function function_fa155cfc()
{
	self endon("disconnect");
	self util::waittill_any_timeout(1, "weapon_change_complete");
	if(self zm_utility::get_player_hero_weapon() == level.weaponNone)
	{
		if(isdefined(level._hero_weapons) && level._hero_weapons.size > 0)
		{
			keys = getArrayKeys(level._hero_weapons);
			for(i = 0; i < keys.size; i++)
			{
				if(keys[i].name == "dragon_gauntlet")
				{
					continue;
				}
				if(keys[i].name == "dragon_gauntlet_flamethrower")
				{
					self.var_fd007e55 = 1;
				}
				if(keys[i].name == "skull_gun_1")
				{
					continue;
				}
				if(IsSubStr(keys[i].name, "glaive_keeper"))
				{
					continue;
				}
				if(IsSubStr(keys[i].name, "glaive_apothicon"))
				{
					num = zm_utility::get_player_index(self);
					if(keys[i].name != "glaive_apothicon_" + num)
					{
						continue;
					}
				}
				self.hero_power = 100;
				self GadgetPowerSet(0, 100);
				self SetWeaponAmmoClip(keys[i], keys[i].clipSize);
				if(keys[i].name == "skull_gun")
				{
					self SetWeaponAmmoClip(keys[i], 100);
					if(self flag::exists("has_skull"))
					{
						self flag::set("has_skull");
					}
				}
				self zm_weapons::weapon_give(keys[i]);
				self clientfield::set_player_uimodel("zmhud.swordEnergy", self.hero_power / 100);
				break;
			}
		}
	}
	self bgb::do_one_shot_use();
	self bgb::set_timer(0, 1);
	wait(0.5);
	hero_weapon = self zm_utility::get_player_hero_weapon();
	if(hero_weapon != level.weaponNone)
	{
		self.hero_power = 100;
		self [[level._hero_weapons[hero_weapon].power_full_fn]](hero_weapon);
		self GadgetPowerSet(0, self.hero_power);
		self clientfield::set_player_uimodel("zmhud.swordEnergy", self.hero_power / 100);
		self SetWeaponAmmoClip(hero_weapon, hero_weapon.clipSize);
		return;
	}
}

/*
	Name: function_3bed0ada
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x3A58
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 1059
*/
function function_3bed0ada(points)
{
	if(self bgb::is_enabled("zm_bgb_expenditure_exemption"))
	{
		points = Int(points / 2);
	}
	return points;
}

/*
	Name: function_2c729b5b
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x3AB8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 1078
*/
function function_2c729b5b(cost)
{
	if(self bgb::is_enabled("zm_bgb_expenditure_exemption"))
	{
		if(self.score >= Int(cost / 2))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_bab02ce4
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x3B20
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 1100
*/
function function_bab02ce4()
{
	return 1;
}

/*
	Name: function_289f1ecd
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x3B30
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1115
*/
function function_289f1ecd()
{
	level thread function_1b2d5e50(self);
}

/*
	Name: function_1b2d5e50
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x3B58
	Size: 0x248
	Parameters: 1
	Flags: None
	Line Number: 1130
*/
function function_1b2d5e50(player)
{
	v_origin = player.origin + VectorScale(AnglesToForward((0, player getPlayerAngles()[1], 0)), 70) + VectorScale((0, 0, 1), 5);
	v_origin = v_origin + VectorScale((0, 0, 1), 40);
	keys = Array::randomize(getArrayKeys(level.zombie_weapons));
	gun = keys[0];
	for(i = 0; i < keys.size; i++)
	{
		if(zm_weapons::get_is_in_box(keys[i]))
		{
			if(!player zm_weapons::has_weapon_or_upgrade(keys[i]))
			{
				gun = keys[i];
				continue;
			}
		}
	}
	model = function_1c8adcb0(gun);
	fxOrg = spawn("script_model", v_origin);
	fxOrg SetModel(model);
	fxOrg.gun = gun;
	FX = PlayFXOnTag("zombie/fx_powerup_on_solo_zmb", fxOrg, "tag_origin");
	fxOrg thread function_e62d50c8();
	fxOrg thread powerup_timeout();
	fxOrg thread powerup_grab();
	return;
}

/*
	Name: function_e62d50c8
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x3DA8
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 1168
*/
function function_e62d50c8()
{
	self endon("powerup_timedout");
	self endon("death");
	while(isdefined(self))
	{
		waittime = RandomFloatRange(2.5, 5);
		yaw = RandomInt(360);
		if(yaw > 300)
		{
			yaw = 300;
		}
		else if(yaw < 60)
		{
			yaw = 60;
		}
		yaw = self.angles[1] + yaw;
		new_angles = (-60 + RandomInt(120), yaw, -45 + RandomInt(90));
		self RotateTo(new_angles, waittime, waittime * 0.5, waittime * 0.5);
		wait(RandomFloat(waittime - 0.1));
	}
}

/*
	Name: powerup_timeout
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x3F08
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 1201
*/
function powerup_timeout()
{
	self endon("powerup_grabbed");
	self endon("death");
	self endon("powerup_reset");
	wait_time = 15;
	if(bgb::is_team_enabled("zm_bgb_temporal_gift"))
	{
		wait_time = wait_time + 30;
	}
	wait(wait_time);
	for(i = 0; i < 40; i++)
	{
		if(i % 2)
		{
			self zm_powerups::powerup_show(0);
		}
		else
		{
			self zm_powerups::powerup_show(1);
		}
		if(i < 15)
		{
			wait(0.5);
			continue;
		}
		if(i < 25)
		{
			wait(0.25);
			continue;
		}
		wait(0.1);
	}
	self notify("powerup_timedout");
	self delete();
}

/*
	Name: powerup_grab
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4048
	Size: 0x330
	Parameters: 1
	Flags: None
	Line Number: 1248
*/
function powerup_grab(powerup_team)
{
	self endon("powerup_timedout");
	self endon("powerup_grabbed");
	range_squared = 4096;
	while(isdefined(self))
	{
		if(isdefined(self.powerup_player))
		{
			grabbers = [];
			grabbers[0] = self.powerup_player;
		}
		else if(isdefined(level.powerup_grab_get_players_override))
		{
			grabbers = [[level.powerup_grab_get_players_override]]();
		}
		else
		{
			grabbers = GetPlayers();
		}
		for(i = 0; i < grabbers.size; i++)
		{
			grabber = grabbers[i];
			if(isalive(grabber.owner) && isPlayer(grabber.owner))
			{
				player = grabber.owner;
			}
			else if(isPlayer(grabber))
			{
				player = grabber;
			}
			if(!isdefined(player))
			{
				continue;
			}
			if(isdefined(player.IS_DRINKING) && player.IS_DRINKING > 0)
			{
				continue;
			}
			if(!isPlayer(grabber) || player laststand::player_is_in_laststand() || (player useButtonPressed() && player zm_utility::in_revive_trigger()) || player bgb::is_enabled("zm_bgb_disorderly_combat"))
			{
				continue;
			}
			if(DistanceSquared(grabber.origin, self.origin) < range_squared)
			{
				player thread zm_weapons::weapon_give(self.gun);
				playFX(level._effect["powerup_grabbed_solo"], self.origin);
				wait(0.1);
				playsoundatposition("zmb_powerup_grabbed", self.origin);
				self StopLoopSound();
				self Hide();
				self notify("powerup_grabbed");
				self delete();
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_78d0e629
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4380
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1317
*/
function function_78d0e629()
{
	self endon("disconnect");
	self.var_92cbfd59 = 30;
	self bgb::set_timer(self.var_92cbfd59, 30);
	while(self bgb::is_enabled("zm_bgb_flatulence_fulmination") && self.var_92cbfd59 > 0)
	{
		wait(0.1);
	}
	return;
	return;
}

/*
	Name: function_17b08535
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4408
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1340
*/
function function_17b08535(attacker)
{
	if(isdefined(self.attacker) && isPlayer(self.attacker) && self.attacker bgb::is_enabled("zm_bgb_flatulence_fulmination"))
	{
		self thread function_afa3f3d9(self.attacker);
	}
}

/*
	Name: function_afa3f3d9
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4488
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 1358
*/
function function_afa3f3d9(player)
{
	player.var_92cbfd59--;
	player bgb::set_timer(player.var_92cbfd59, 30);
	player bgb::do_one_shot_use();
	self zombie_utility::zombie_eye_glow_stop();
	PlayFXOnTag("custom_bgb/flatulence_fulmination_launch", self, "J_SpineLower");
	sound = "custom_bgb_flatulence_" + RandomInt(10);
	playsoundatposition(sound, self.origin);
	self StartRagdoll();
	self LaunchRagdoll(105 * VectorNormalize(self.origin - self.origin + VectorScale((0, 0, 1), 200)));
}

/*
	Name: function_d9d850bc
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x45D0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 1381
*/
function function_d9d850bc()
{
	a_ai = GetAIArray();
	if(a_ai.size == 0)
	{
		return 0;
	}
	return 1;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3d087e05
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4610
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1402
*/
function function_3d087e05()
{
	level.zombie_total = level.zombie_total + level.zombie_ai_limit;
	return;
}

/*
	Name: function_21488856
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4638
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1418
*/
function function_21488856()
{
	if(!isdefined(level.zombie_vars["spectators_respawn"]) || !level.zombie_vars["spectators_respawn"])
	{
		return 0;
	}
	players = GetPlayers();
	foreach(player in players)
	{
		if(player.sessionstate == "spectator" && isdefined(player.spectator_respawn))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_537451f
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4740
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1445
*/
function function_537451f()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		e_player = players[i];
		e_player zm::spectator_respawn_player();
	}
	return;
}

/*
	Name: function_7014f9df
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x47C0
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 1466
*/
function function_7014f9df()
{
	while(1)
	{
		a_ai = GetAIArray();
		for(i = 0; i < a_ai.size; i++)
		{
			if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie" && !isdefined(a_ai[i].var_6b8e85d5))
			{
				a_ai[i].var_6b8e85d5 = 1;
				a_ai[i] thread function_6b8e85d5();
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_6b8e85d5
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x48D0
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 1493
*/
function function_6b8e85d5()
{
	self endon("death");
	while(1)
	{
		wait(0.1);
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(DistanceSquared(self.origin, players[i].origin) < 90000 && players[i].bgb == "zm_bgb_malevolent_presence" && !isdefined(self.var_93591730))
			{
				self clientfield::set("bgb_malevolent_presence", 1);
				self DoDamage(Int(self.maxhealth / 5), players[i].origin, players[i], players[i], "none");
				self thread function_e40a09b0();
			}
		}
	}
}

/*
	Name: function_e40a09b0
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4A48
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1522
*/
function function_e40a09b0()
{
	self.var_93591730 = 1;
	wait(1);
	if(isdefined(self))
	{
		self clientfield::set("bgb_malevolent_presence", 0);
		self.var_93591730 = undefined;
	}
}

/*
	Name: function_85f3d869
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4A98
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1543
*/
function function_85f3d869()
{
	self endon("disconnect");
	Array::thread_all(level.chests, &function_2b06df50);
	self bgb::set_timer(1, 1);
	self waittill("hash_23e98521");
	return;
}

/*
	Name: function_b41b5791
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4B08
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 1562
*/
function function_b41b5791()
{
	var_e517b46b = undefined;
	while(1)
	{
		if(isdefined(level.CustomRandomWeaponWeights) && level.CustomRandomWeaponWeights != &function_6687a139)
		{
			function_68b7934d(level.CustomRandomWeaponWeights);
			if(isdefined(var_e517b46b) && var_e517b46b != &function_6687a139)
			{
				function_f3e3a3fa(var_e517b46b);
			}
			var_e517b46b = level.CustomRandomWeaponWeights;
			level.CustomRandomWeaponWeights = &function_6687a139;
		}
		else if(!isdefined(level.CustomRandomWeaponWeights))
		{
			if(var_e517b46b != undefined)
			{
				function_f3e3a3fa(var_e517b46b);
			}
			level.CustomRandomWeaponWeights = &function_6687a139;
		}
		wait(1);
	}
	return;
	.var_0 = undefined;
}

/*
	Name: function_6687a139
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4C18
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 1601
*/
function function_6687a139(keys)
{
	if(!isdefined(level.var_cf90eb70))
	{
		return keys;
	}
	var_488eabb3 = keys;
	for(i = 0; i < level.var_cf90eb70.size; i++)
	{
		keys = self [[level.var_cf90eb70[i]]](keys);
	}
	if(keys.size == 0)
	{
		return var_488eabb3;
	}
	return keys;
}

/*
	Name: function_68b7934d
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4CB8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1629
*/
function function_68b7934d(func)
{
	if(!isdefined(level.var_cf90eb70))
	{
		level.var_cf90eb70 = [];
	}
	level.var_cf90eb70[level.var_cf90eb70.size] = func;
	return;
	ERROR: Bad function call
}

/*
	Name: function_f3e3a3fa
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4D00
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 1650
*/
function function_f3e3a3fa(func)
{
	if(!isdefined(level.var_cf90eb70))
	{
		level.var_cf90eb70 = [];
	}
	ArrayRemoveValue(level.var_cf90eb70, func);
}

/*
	Name: function_49d80685
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4D50
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 1669
*/
function function_49d80685(keys)
{
	self.var_a74fae0a = undefined;
	if(self bgb::is_enabled("zm_bgb_miraculous_box"))
	{
		var_6560cd4e = [];
		for(i = 0; i < keys.size; i++)
		{
			weapon = zm_weapons::get_nonalternate_weapon(keys[i]);
			rootweapon = weapon.rootweapon;
			if(!self zm_weapons::has_weapon_or_upgrade(rootweapon))
			{
				if(zm_weapons::is_wonder_weapon(rootweapon) && zm_weapons::get_is_in_box(keys[i]))
				{
					var_6560cd4e[var_6560cd4e.size] = keys[i];
				}
				if(keys[i].name == "cymbal_monkey" || keys[i].name == "octobomb" || keys[i].name == "quantum_bomb" || keys[i].name == "black_hole_bomb" || keys[i].name == "nesting_dolls")
				{
					var_6560cd4e[var_6560cd4e.size] = keys[i];
				}
			}
		}
		if(var_6560cd4e.size > 0)
		{
			self.var_a74fae0a = 1;
			return var_6560cd4e;
		}
	}
	return keys;
}

/*
	Name: function_2b06df50
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x4F58
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 1710
*/
function function_2b06df50()
{
	self notify("hash_1e959073");
	self endon("hash_1e959073");
	while(1)
	{
		self waittill("trigger", User);
		if(User == level)
		{
			continue;
		}
		if(User bgb::is_enabled("zm_bgb_miraculous_box"))
		{
			self.zbarrier waittill("randomization_done");
			if(!(isdefined(self.chest_moving) && self.chest_moving) && isdefined(User.var_a74fae0a))
			{
				User bgb::set_timer(0, 1);
				User bgb::do_one_shot_use();
				User notify("hash_23e98521");
			}
		}
	}
}

/*
	Name: function_2784378f
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5058
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1744
*/
function function_2784378f()
{
	self endon("disconnect");
	self.var_3443182 = 4;
	self bgb::set_timer(self.var_3443182, 4);
	while(self bgb::is_enabled("zm_bgb_next_rounds_on_me") && self.var_3443182 > 0)
	{
		wait(0.1);
	}
	return;
}

/*
	Name: function_88bbdc97
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x50E0
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 1766
*/
function function_88bbdc97()
{
	self endon("disconnect");
	self notify("hash_88bbdc97");
	self endon("hash_88bbdc97");
	while(1)
	{
		self waittill("perk_bought", perk);
		if(self bgb::is_enabled("zm_bgb_next_rounds_on_me"))
		{
			players = GetPlayers();
			for(i = 0; i < players.size; i++)
			{
				if(players[i] != self && !players[i] namespace_851dc78f::has_perk(perk))
				{
					players[i] thread zm_perks::give_perk(perk);
					self thread function_ba0a9b8b();
				}
			}
			if(self.num_perks > self zm_utility::get_player_perk_purchase_limit())
			{
				self thread function_ba0a9b8b();
			}
		}
	}
}

/*
	Name: function_ba0a9b8b
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5248
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1803
*/
function function_ba0a9b8b()
{
	self endon("disconnect");
	if(isdefined(self.var_ba0a9b8b))
	{
		return;
	}
	self.var_ba0a9b8b = 1;
	self.var_3443182--;
	self bgb::set_timer(self.var_3443182, 4);
	self bgb::do_one_shot_use();
	wait(0.05);
	self.var_ba0a9b8b = undefined;
}

/*
	Name: function_940c7219
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x52D0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 1828
*/
function function_940c7219()
{
	if(self bgb::is_enabled("zm_bgb_next_rounds_on_me"))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_26924076
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5308
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 1847
*/
function function_26924076()
{
	if(!self function_2c6265b2())
	{
		return 0;
	}
	if(isdefined(self.var_c505386b))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_3edf5b0f
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5348
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 1870
*/
function function_3edf5b0f()
{
	self endon("disconnect");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] != self && !players[i].is_zombie && (!(isdefined(players[i].altbody) && players[i].altbody)) && players[i] laststand::player_is_in_laststand())
		{
			var_5aa1a093 = players[i] function_33be816a();
			if(var_5aa1a093 != players[i].origin)
			{
				playsoundatposition("zmb_bgb_abh_teleport_out", self.origin);
				self.var_c505386b = 1;
				self SetOrigin(var_5aa1a093);
				wait(0.1);
				playFX(level._effect["teleport_splash"], self.origin);
				playFX(level._effect["teleport_aoe"], self.origin);
				self playsound("zmb_bgb_abh_teleport_in");
				wait(1);
				self.var_c505386b = undefined;
			}
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2c6265b2
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5550
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 1907
*/
function function_2c6265b2()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] != self && !players[i].is_zombie && (!(isdefined(players[i].altbody) && players[i].altbody)) && players[i] laststand::player_is_in_laststand())
		{
			var_5aa1a093 = players[i] function_33be816a();
			if(var_5aa1a093 != players[i].origin)
			{
				return 1;
			}
		}
	}
	return 0;
}

/*
	Name: function_33be816a
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5670
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 1934
*/
function function_33be816a()
{
	v_orig = self.origin;
	n_angles = self.angles;
	var_d4ed8e69 = self.origin;
	n_z_correct = 0;
	queryResult = PositionQuery_Source_Navigation(self.origin, 100, 300, 100, 2, 20);
	if(queryResult.data.size)
	{
		foreach(point in queryResult.data)
		{
			if(BulletTracePassed(point.origin + VectorScale((0, 0, 1), 20), v_orig + VectorScale((0, 0, 1), 20), 0, self, undefined, 0, 0))
			{
				if(self.origin[2] > queryResult.origin[2])
				{
					n_z_correct = self.origin[2] - queryResult.origin[2];
				}
				var_d4ed8e69 = point.origin + (0, 0, n_z_correct);
				break;
			}
		}
	}
	return var_d4ed8e69;
}

/*
	Name: function_8f9520e0
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5860
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1969
*/
function function_8f9520e0()
{
	self endon("death");
	self endon("disconnect");
	var_76019f97 = function_76c81687();
	var_3fa305c = function_76c81687(var_76019f97.name);
	self thread function_ca075fc2(var_76019f97, var_3fa305c);
}

/*
	Name: function_76c81687
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x58E8
	Size: 0x1D8
	Parameters: 1
	Flags: None
	Line Number: 1988
*/
function function_76c81687(exception)
{
	var_a95e1085 = [];
	index = 1;
	for(row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index); isdefined(row); row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index))
	{
		if(checkStringValid(row[2]) == "bubblegum")
		{
			if(!isdefined(exception) || (isdefined(exception) && exception != checkStringValid(row[4])))
			{
				if(checkStringValid(row[16]) == "4" && checkStringValid(row[4]) != "zm_bgb_on_a_whim")
				{
					var_a95e1085[var_a95e1085.size] = checkStringValid(row[4]);
				}
			}
		}
		index++;
		if(checkStringValid(row[0]) == "a0")
		{
			index++;
		}
	}
	var_7a727536 = var_a95e1085[RandomInt(var_a95e1085.size)];
	return function_b4705b81(var_7a727536);
}

/*
	Name: checkStringValid
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5AC8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 2024
*/
function checkStringValid(STR)
{
	if(STR != "")
	{
		return STR;
	}
	return undefined;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b4705b81
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5AF8
	Size: 0x210
	Parameters: 1
	Flags: None
	Line Number: 2044
*/
function function_b4705b81(var_33636f4a)
{
	index = 1;
	for(row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index); isdefined(row); row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index))
	{
		var_a0ec4ef3 = checkStringValid(row[4]);
		if(var_a0ec4ef3 == var_33636f4a)
		{
			break;
		}
		index++;
		if(checkStringValid(row[0]) == "a0")
		{
			index++;
		}
	}
	struct = spawnstruct();
	struct.name = var_a0ec4ef3;
	struct.UI = checkStringValid(row[3]);
	struct.camoIndex = Int(row[5]);
	struct.hud = checkStringValid(row[6]);
	struct.description = checkStringValid(row[7]);
	struct.var_d277f374 = Int(row[16]);
	struct.activation = checkStringValid(row[20]);
	return struct;
	ERROR: Bad function call
}

/*
	Name: function_ca075fc2
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5D10
	Size: 0xE0
	Parameters: 2
	Flags: None
	Line Number: 2082
*/
function function_ca075fc2(var_76019f97, var_3fa305c)
{
	self endon("death");
	self endon("disconnect");
	wait(3);
	self bgb::give(var_76019f97.name);
	while(isdefined(self.bgb) && self.bgb == var_76019f97.name)
	{
		wait(0.1);
	}
	wait(3);
	if(!isdefined(self.bgb) || (isdefined(self.bgb) && self.bgb == "none"))
	{
		self bgb::give(var_3fa305c.name);
	}
}

/*
	Name: function_5123dfa0
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5DF8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 2109
*/
function function_5123dfa0()
{
	if(!function_64c5f4de())
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_d3efa019
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5E20
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 2128
*/
function function_d3efa019()
{
	level thread function_dc8b39b1();
}

/*
	Name: function_dc8b39b1
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5E48
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 2143
*/
function function_dc8b39b1()
{
	level notify("hash_62b4beec");
	level endon("hash_62b4beec");
	level.var_b892c756 = 1;
	song = function_dc0d8421();
	zm_audio::sndmusicsystem_stopandflush();
	level.var_65368e92 = song;
	wait(1);
	level thread zm_audio::sndmusicsystem_playstate(song);
	wait(2);
	level.var_b892c756 = undefined;
	while(level.musicsystem.currentstate == song)
	{
		wait(0.1);
	}
	zm_audio::sndmusicsystem_stopandflush();
	level.var_65368e92 = "";
}

/*
	Name: function_64c5f4de
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5F30
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 2173
*/
function function_64c5f4de()
{
	if(isdefined(level.var_b892c756) && level.var_b892c756)
	{
		return 0;
	}
	if(!function_155404ac())
	{
		return 0;
	}
	if(function_dc0d8421() == level.var_65368e92)
	{
		return 0;
	}
	if(isdefined(level.musicsystem.currentstate) && function_dc0d8421() == level.musicsystem.currentstate)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_d5cd4827
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x5FD8
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 2204
*/
function function_d5cd4827()
{
	level.var_62b4beec = [];
	level.var_62b4beec["zm_zod"] = &function_84cbd296;
	level.var_62b4beec["zm_factory"] = "musicEasterEgg";
	level.var_62b4beec["zm_castle"] = &function_ea0ac21d;
	level.var_62b4beec["zm_island"] = "dead_flowers";
	level.var_62b4beec["zm_stalingrad"] = &function_b045037c;
	level.var_62b4beec["zm_genesis"] = "the_gift";
	level.var_62b4beec["zm_tomb"] = &function_2368f198;
	level.var_62b4beec["zm_sumpf"] = "the_one";
	level.var_62b4beec["zm_theater"] = "115";
	level.var_62b4beec["zm_cosmodrome"] = &function_adfd7e2f;
	level.var_62b4beec["zm_temple"] = "pareidolia";
	level.var_62b4beec["zm_moon"] = &function_38e288bc;
	level.var_62b4beec["zm_asylum"] = "lullaby_for_a_dead_man";
	level.var_62b4beec["zm_prototype"] = "undone";
}

/*
	Name: function_155404ac
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x61A0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 2233
*/
function function_155404ac()
{
	if(!isdefined(level.var_62b4beec) || (isdefined(level.var_62b4beec) && !isdefined(level.var_62b4beec[level.script])))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_84cbd296
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x61E8
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 2252
*/
function function_84cbd296()
{
	var_6f3d3f67 = [];
	var_6f3d3f67[var_6f3d3f67.size] = "coldhardcash";
	var_6f3d3f67[var_6f3d3f67.size] = "snakeskinboots";
	var_6f3d3f67[var_6f3d3f67.size] = "snakeskinboots_instr";
	var_bb997bc5 = [];
	for(i = 0; i < var_6f3d3f67.size; i++)
	{
		if(var_6f3d3f67[i] != level.var_65368e92 && (!isdefined(level.musicsystem.currentstate) || (isdefined(level.musicsystem.currentstate) && var_6f3d3f67[i] != level.musicsystem.currentstate)))
		{
			var_bb997bc5[var_bb997bc5.size] = var_6f3d3f67[i];
		}
	}
	song = var_bb997bc5[RandomInt(var_bb997bc5.size)];
	return song;
}

/*
	Name: function_2368f198
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x6328
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 2280
*/
function function_2368f198()
{
	var_6f3d3f67 = [];
	var_6f3d3f67[var_6f3d3f67.size] = "shepherd_of_fire";
	var_6f3d3f67[var_6f3d3f67.size] = "archangel";
	var_6f3d3f67[var_6f3d3f67.size] = "aether";
	var_bb997bc5 = [];
	for(i = 0; i < var_6f3d3f67.size; i++)
	{
		if(var_6f3d3f67[i] != level.var_65368e92 && (!isdefined(level.musicsystem.currentstate) || (isdefined(level.musicsystem.currentstate) && var_6f3d3f67[i] != level.musicsystem.currentstate)))
		{
			var_bb997bc5[var_bb997bc5.size] = var_6f3d3f67[i];
		}
	}
	song = var_bb997bc5[RandomInt(var_bb997bc5.size)];
	return song;
}

/*
	Name: function_b045037c
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x6468
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 2308
*/
function function_b045037c()
{
	var_6f3d3f67 = [];
	var_6f3d3f67[var_6f3d3f67.size] = "dead_ended";
	var_6f3d3f67[var_6f3d3f67.size] = "ace_of_spades";
	var_bb997bc5 = [];
	for(i = 0; i < var_6f3d3f67.size; i++)
	{
		if(var_6f3d3f67[i] != level.var_65368e92 && (!isdefined(level.musicsystem.currentstate) || (isdefined(level.musicsystem.currentstate) && var_6f3d3f67[i] != level.musicsystem.currentstate)))
		{
			var_bb997bc5[var_bb997bc5.size] = var_6f3d3f67[i];
		}
	}
	song = var_bb997bc5[RandomInt(var_bb997bc5.size)];
	return song;
}

/*
	Name: function_38e288bc
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x6598
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 2335
*/
function function_38e288bc()
{
	var_6f3d3f67 = [];
	var_6f3d3f67[var_6f3d3f67.size] = "cominghome";
	var_6f3d3f67[var_6f3d3f67.size] = "nightmare";
	var_bb997bc5 = [];
	for(i = 0; i < var_6f3d3f67.size; i++)
	{
		if(var_6f3d3f67[i] != level.var_65368e92 && (!isdefined(level.musicsystem.currentstate) || (isdefined(level.musicsystem.currentstate) && var_6f3d3f67[i] != level.musicsystem.currentstate)))
		{
			var_bb997bc5[var_bb997bc5.size] = var_6f3d3f67[i];
		}
	}
	song = var_bb997bc5[RandomInt(var_bb997bc5.size)];
	return song;
}

/*
	Name: function_adfd7e2f
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x66C8
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 2362
*/
function function_adfd7e2f()
{
	var_6f3d3f67 = [];
	var_6f3d3f67[var_6f3d3f67.size] = "abracadavre";
	var_6f3d3f67[var_6f3d3f67.size] = "not_ready_to_die";
	var_bb997bc5 = [];
	for(i = 0; i < var_6f3d3f67.size; i++)
	{
		if(var_6f3d3f67[i] != level.var_65368e92 && (!isdefined(level.musicsystem.currentstate) || (isdefined(level.musicsystem.currentstate) && var_6f3d3f67[i] != level.musicsystem.currentstate)))
		{
			var_bb997bc5[var_bb997bc5.size] = var_6f3d3f67[i];
		}
	}
	song = var_bb997bc5[RandomInt(var_bb997bc5.size)];
	return song;
}

/*
	Name: function_ea0ac21d
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x67F8
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 2389
*/
function function_ea0ac21d()
{
	var_6f3d3f67 = [];
	var_6f3d3f67[var_6f3d3f67.size] = "requiem";
	var_6f3d3f67[var_6f3d3f67.size] = "dead_again";
	var_bb997bc5 = [];
	for(i = 0; i < var_6f3d3f67.size; i++)
	{
		if(var_6f3d3f67[i] != level.var_65368e92 && (!isdefined(level.musicsystem.currentstate) || (isdefined(level.musicsystem.currentstate) && var_6f3d3f67[i] != level.musicsystem.currentstate)))
		{
			var_bb997bc5[var_bb997bc5.size] = var_6f3d3f67[i];
		}
	}
	song = var_bb997bc5[RandomInt(var_bb997bc5.size)];
	return song;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dc0d8421
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x6928
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 2417
*/
function function_dc0d8421()
{
	song = "";
	if(IsFunctionPtr(level.var_62b4beec[level.script]))
	{
		song = [[level.var_62b4beec[level.script]]]();
	}
	else
	{
		song = level.var_62b4beec[level.script];
	}
	return song;
}

/*
	Name: function_75f89a6
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x69B0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 2441
*/
function function_75f89a6()
{
	if(self.score < 500)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_e82614df
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x69D8
	Size: 0x3D8
	Parameters: 0
	Flags: None
	Line Number: 2460
*/
function function_e82614df()
{
	self endon("disconnect");
	if(!isdefined(self.var_5d71e84e))
	{
		self.var_5d71e84e = 5;
	}
	self.var_5d71e84e--;
	dropped = 0;
	var_5e1f0530 = GetEntArray("money_drops", "targetname");
	if(isdefined(var_5e1f0530) && var_5e1f0530.size > 0)
	{
		var_5e1f0530 = util::get_array_of_closest(self.origin, var_5e1f0530, undefined, undefined, 128);
		if(isdefined(var_5e1f0530[0]))
		{
			playFX("zombie/fx_powerup_grab_solo_zmb", var_5e1f0530[0].origin);
			var_5e1f0530[0].points = var_5e1f0530[0].points + 500;
			self zm_score::minus_to_player_score(500);
			var_5e1f0530[0] notify("powerup_reset");
			var_5e1f0530[0] thread powerup_timeout();
			dropped = 1;
		}
	}
	if(!dropped)
	{
		angles = self getPlayerAngles();
		pos = self.origin;
		forward_view_angles = AnglesToForward(angles);
		end_pos = pos + function_f9cb4212(forward_view_angles, 70);
		end_pos = (end_pos[0], end_pos[1], self.origin[2]);
		ent = spawn("script_model", end_pos + VectorScale((0, 0, 1), 40));
		ent SetModel("zombie_z_money_icon");
		ent.points = 500;
		ent.targetname = "money_drops";
		ent.owner = self;
		playsoundatposition("zmb_spawn_powerup", ent.origin);
		ent PlayLoopSound("zmb_spawn_powerup_loop");
		PlayFXOnTag("zombie/fx_powerup_on_solo_zmb", ent, "tag_origin");
		ent thread function_ff213503();
		ent thread function_e62d50c8();
		ent thread powerup_timeout();
		self zm_score::minus_to_player_score(500);
	}
	self waittill("weapon_change_complete");
	if(self.bgb == "zm_bgb_point_drops" && self.var_5d71e84e < 2)
	{
		self.var_5d71e84e = 5;
		self bgb::give("zm_bgb_point_drops");
	}
}

/*
	Name: function_f9cb4212
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x6DB8
	Size: 0x28
	Parameters: 2
	Flags: None
	Line Number: 2521
*/
function function_f9cb4212(V, scale)
{
	V = V * scale;
	return V;
}

/*
	Name: powerup_show
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x6DE8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 2537
*/
function powerup_show(visible)
{
	if(!visible)
	{
		self ghost();
	}
	else
	{
		self show();
	}
}

/*
	Name: function_ff213503
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x6E38
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 2559
*/
function function_ff213503()
{
	self endon("death");
	taken = 0;
	while(isdefined(self))
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(DistanceSquared(self.origin, players[i].origin) < 4096 && !taken)
			{
				players[i] zm_score::add_to_player_score(self.points);
				taken = 1;
				self StopLoopSound();
				playsoundatposition("zmb_powerup_grabbed", self.origin);
				self delete();
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_ea29a1da
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x6F80
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 2591
*/
function function_ea29a1da()
{
	if(self zm_utility::get_player_hero_weapon() == level.weaponNone)
	{
		return 0;
	}
	if(!isdefined(self.hero_power))
	{
		self.hero_power = 0;
	}
	if(self.hero_power >= 100)
	{
		return 0;
	}
	if(self GadgetPowerGet(0) == 100)
	{
		return 0;
	}
	if(isdefined(self.disable_hero_power_charging) && self.disable_hero_power_charging)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_103af0b3
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x7020
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 2626
*/
function function_103af0b3()
{
	hero_weapon = self zm_utility::get_player_hero_weapon();
	if(hero_weapon != level.weaponNone)
	{
		self.hero_power = 100;
		self [[level._hero_weapons[hero_weapon].power_full_fn]](hero_weapon);
		self GadgetPowerSet(0, self.hero_power);
		self clientfield::set_player_uimodel("zmhud.swordEnergy", self.hero_power / 100);
		self SetWeaponAmmoClip(hero_weapon, hero_weapon.clipSize);
	}
}

/*
	Name: function_96de4544
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x7100
	Size: 0x2C0
	Parameters: 0
	Flags: None
	Line Number: 2649
*/
function function_96de4544()
{
	self endon("disconnect");
	trigs = GetEntArray("use_elec_switch", "targetname");
	for(i = 0; i < trigs.size; i++)
	{
		trigs[i] notify("trigger", self);
		wait(0.1);
	}
	trigs = GetEntArray("use_power_switch", "targetname");
	for(i = 0; i < trigs.size; i++)
	{
		trigs[i] notify("trigger", self);
		wait(0.1);
	}
	trigs = GetEntArray("use_master_switch", "targetname");
	for(i = 0; i < trigs.size; i++)
	{
		trigs[i] notify("trigger", self);
		wait(0.1);
	}
	trigs = GetEntArray("power_trigger_left", "targetname");
	for(i = 0; i < trigs.size; i++)
	{
		trigs[i] notify("trigger", self);
		wait(0.1);
	}
	trigs = GetEntArray("power_trigger_right", "targetname");
	for(i = 0; i < trigs.size; i++)
	{
		trigs[i] notify("trigger", self);
		wait(0.1);
	}
	trigs = GetEntArray("use_elec_switch_deferred", "targetname");
	for(i = 0; i < trigs.size; i++)
	{
		trigs[i] notify("trigger", self);
		wait(0.1);
	}
	if(level.script == "zm_castle")
	{
		zm_zonemgr::enable_zone("zone_armory");
		return;
	}
	.var_0 = undefined;
}

/*
	Name: function_dc569223
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x73C8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 2706
*/
function function_dc569223()
{
	if(level.script == "zm_castle")
	{
		zm_zonemgr::add_adjacent_zone("zone_armory", "zone_armory_back", "power_on");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3f5675b2
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x7418
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 2726
*/
function function_3f5675b2()
{
	while(1)
	{
		a_ai = GetAIArray();
		for(i = 0; i < a_ai.size; i++)
		{
			if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie" && !isdefined(a_ai[i].var_3f5675b2))
			{
				a_ai[i] thread function_46383f8a();
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_46383f8a
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x7508
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 2752
*/
function function_46383f8a()
{
	if(isdefined(self.var_3f5675b2))
	{
		return;
	}
	self.var_3f5675b2 = 1;
	var_7ba04a94 = 0;
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i].bgb == "zm_bgb_quacknarok")
		{
			var_7ba04a94 = 1;
		}
	}
	if(var_7ba04a94)
	{
		self thread function_8dcce6a3();
	}
}

/*
	Name: function_8dcce6a3
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x75D8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2784
*/
function function_8dcce6a3()
{
	wait(0.1);
	while(isdefined(self.in_the_ground) && self.in_the_ground)
	{
		wait(0.1);
	}
	wait(0.1);
	if(!isdefined(self))
	{
		return;
	}
	self Attach("p7_zm_bgb_plash_floatie_duck", "J_SpineLower", 1);
	self waittill("death");
	sound = "custom_bgb_quack_" + RandomInt(10);
	playsoundatposition(sound, self.origin);
}

/*
	Name: function_eaf4c9a2
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x76A0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 2812
*/
function function_eaf4c9a2()
{
	wait(1);
	level flag::wait_till("initial_blackscreen_passed");
	for(i = 0; i < 5; i++)
	{
		var_8eef4ec1 = GetEnt("giant_robot_" + i, "targetname");
		if(isdefined(var_8eef4ec1))
		{
			var_8eef4ec1 thread function_d458260e();
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d458260e
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x7750
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 2838
*/
function function_d458260e()
{
	var_44865b03 = spawn("script_model", self GetTagOrigin("j_spinelower"));
	var_44865b03 SetModel("p7_zm_bgb_plash_floatie_duck_chonker");
	var_44865b03.angles = self GetTagAngles("j_spinelower");
	var_44865b03 LinkTo(self, "j_spinelower", (0, 0, 0), (0, 0, 0));
	var_44865b03 thread function_4853750b();
}

/*
	Name: function_4853750b
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x7830
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 2857
*/
function function_4853750b()
{
	while(1)
	{
		var_7ba04a94 = 0;
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i].bgb == "zm_bgb_quacknarok")
			{
				var_7ba04a94 = 1;
			}
		}
		if(isdefined(level.var_eec7e3db))
		{
			var_7ba04a94 = 1;
		}
		if(var_7ba04a94)
		{
			self show();
		}
		else
		{
			self Hide();
		}
		wait(1);
	}
}

/*
	Name: function_6b1f59d
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x7918
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 2896
*/
function function_6b1f59d()
{
	if(!isdefined(level.craftable_shield_weapon))
	{
		return 0;
	}
	if(isdefined(level.craftable_shield_weapon) && self zm_weapons::has_weapon_or_upgrade(GetWeapon(level.craftable_shield_weapon)))
	{
		return 0;
	}
	return 1;
	.var_0 = undefined;
}

/*
	Name: function_d31a072
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x7978
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 2920
*/
function function_d31a072()
{
	w_give = self zm_weapons::weapon_give(GetWeapon(level.craftable_shield_weapon), 0, 1);
}

/*
	Name: function_8e84f003
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x79C0
	Size: 0xF8
	Parameters: 10
	Flags: None
	Line Number: 2935
*/
function function_8e84f003(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!self bgb::is_enabled("zm_bgb_sucker_points"))
	{
		return undefined;
	}
	self bgb::do_one_shot_use();
	zm_utility::play_sound_at_pos("purchase", self.origin);
	self zm_score::add_to_player_score(Int(100 * level.zombie_vars[self.team]["zombie_point_scalar"]));
	return undefined;
}

/*
	Name: function_cb9e4120
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x7AC0
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 2957
*/
function function_cb9e4120()
{
	self endon("hash_80779ad6");
	self thread function_4697b2a1();
	while(1)
	{
		self util::waittill_any_timeout(5, "weapon_change_complete");
		current_weapon = self GetCurrentWeapon();
		current_weapon = zm_weapons::get_nonalternate_weapon(current_weapon);
		if(self zm_weapons::can_upgrade_weapon(current_weapon) && self namespace_851dc78f::function_1275e2ff())
		{
			current_weapon = self zm_weapons::switch_from_alt_weapon(current_weapon);
			self thread function_8d654c9c();
		}
	}
}

/*
	Name: function_d3eecb2b
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x7BB8
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 2984
*/
function function_d3eecb2b()
{
	while(1)
	{
		level waittill("weapon_bought", player, weapon);
		if(player bgb::is_enabled("zm_bgb_mighty_midas") && player zm_weapons::can_upgrade_weapon(weapon))
		{
			player TakeWeapon(weapon);
			b_weapon_supports_aat = zm_weapons::weapon_supports_aat(weapon);
			upgrade_weapon = zm_weapons::get_upgrade_weapon(weapon, b_weapon_supports_aat);
			upgrade_weapon = player getbuildkitweapon(upgrade_weapon, 1);
			pap_camo_to_use = zm_weapons::get_pack_a_punch_camo_index();
			upgrade_weapon_options = player getbuildkitweaponoptions(upgrade_weapon, pap_camo_to_use);
			upgrade_weapon_acvi = player GetBuildKitAttachmentCosmeticVariantIndexes(upgrade_weapon, 1);
			upgrade_weapon = player zm_weapons::give_build_kit_weapon(upgrade_weapon);
			player SwitchToWeapon(upgrade_weapon);
		}
	}
}

/*
	Name: function_4697b2a1
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x7D68
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 3014
*/
function function_4697b2a1()
{
	self endon("hash_80779ad6");
	while(1)
	{
		self waittill("weapon_give", weapon);
		if(self zm_weapons::can_upgrade_weapon(weapon))
		{
			self TakeWeapon(weapon);
			b_weapon_supports_aat = zm_weapons::weapon_supports_aat(weapon);
			upgrade_weapon = zm_weapons::get_upgrade_weapon(weapon, b_weapon_supports_aat);
			upgrade_weapon = self getbuildkitweapon(upgrade_weapon, 1);
			pap_camo_to_use = zm_weapons::get_pack_a_punch_camo_index();
			upgrade_weapon_options = self getbuildkitweaponoptions(upgrade_weapon, pap_camo_to_use);
			upgrade_weapon_acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(upgrade_weapon, 1);
			upgrade_weapon = self zm_weapons::give_build_kit_weapon(upgrade_weapon);
			self SwitchToWeapon(upgrade_weapon);
		}
	}
}

/*
	Name: function_8d654c9c
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x7EF0
	Size: 0x388
	Parameters: 0
	Flags: None
	Line Number: 3045
*/
function function_8d654c9c()
{
	self endon("disconnect");
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	self.var_97c73248 = 1;
	current_weapon = self GetCurrentWeapon();
	current_weapon = self zm_weapons::switch_from_alt_weapon(current_weapon);
	if(self zm_weapons::can_upgrade_weapon(current_weapon))
	{
		b_weapon_supports_aat = zm_weapons::weapon_supports_aat(current_weapon);
		upgrade_weapon = zm_weapons::get_upgrade_weapon(current_weapon, b_weapon_supports_aat);
		upgrade_weapon = self getbuildkitweapon(upgrade_weapon, 1);
		current_weapon_options = self getbuildkitweaponoptions(current_weapon);
		current_weapon_acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(current_weapon, 0);
		pap_camo_to_use = zm_weapons::get_pack_a_punch_camo_index();
		upgrade_weapon_options = self getbuildkitweaponoptions(upgrade_weapon, pap_camo_to_use);
		upgrade_weapon_acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(upgrade_weapon, 1);
		weapon_limit = zm_utility::get_player_weapon_limit(self);
		Primaries = self getweaponslistprimaries();
		if(isdefined(Primaries) && Primaries.size >= weapon_limit)
		{
			upgrade_weapon = self zm_weapons::weapon_give(upgrade_weapon);
		}
		else
		{
			self TakeWeapon(current_weapon);
			upgrade_weapon = self zm_weapons::give_build_kit_weapon(upgrade_weapon);
			self GiveStartAmmo(upgrade_weapon);
		}
		self notify("weapon_give", upgrade_weapon);
		aatID = -1;
		if(isdefined(b_weapon_supports_aat) && b_weapon_supports_aat)
		{
			self thread AAT::acquire(upgrade_weapon);
			aatObj = self AAT::getAATOnWeapon(upgrade_weapon);
			if(isdefined(aatObj))
			{
				aatID = aatObj.hash_id;
			}
		}
		else
		{
			self thread AAT::remove(upgrade_weapon);
		}
		self SwitchToWeapon(upgrade_weapon);
		self zm_weapons::play_weapon_vo(upgrade_weapon);
		wait(0.1);
		self.var_97c73248 = undefined;
	}
}

/*
	Name: function_80779ad6
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x8280
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 3109
*/
function function_80779ad6()
{
	self notify("hash_80779ad6");
	return;
	ERROR: Bad function call
}

/*
	Name: function_a3942d9
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x82A0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 3126
*/
function function_a3942d9()
{
	if(self GetCurrentWeapon().isAltMode)
	{
		return 0;
	}
	if(self namespace_851dc78f::function_1275e2ff())
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fc4def8e
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x82F0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 3150
*/
function function_fc4def8e()
{
	self endon("disconnect");
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	self.var_97c73248 = 1;
	camo = randomIntRange(1, 126);
	current_weapon = zm_weapons::get_nonalternate_weapon(self GetCurrentWeapon());
	self function_c8540b60(current_weapon, self CalcWeaponOptions(camo, 0, 0));
	wait(0.1);
	self.var_97c73248 = undefined;
}

/*
	Name: function_1c80616
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x83D8
	Size: 0x230
	Parameters: 2
	Flags: None
	Line Number: 3175
*/
function function_1c80616(weapon, camo)
{
	upgraded = 0;
	base_weapon = weapon;
	if(zm_weapons::is_weapon_upgraded(weapon))
	{
		upgraded = 1;
		base_weapon = zm_weapons::get_base_weapon(weapon);
	}
	if(zm_weapons::is_weapon_included(base_weapon))
	{
		force_attachments = zm_weapons::get_force_attachments(base_weapon.rootweapon);
	}
	if(isdefined(force_attachments) && force_attachments.size)
	{
		if(upgraded)
		{
			packed_attachments = [];
			packed_attachments[packed_attachments.size] = "extclip";
			packed_attachments[packed_attachments.size] = "fmj";
			force_attachments = ArrayCombine(force_attachments, packed_attachments, 0, 0);
		}
		weapon = GetWeapon(weapon.rootweapon.name, force_attachments);
		if(!isdefined(camo))
		{
			camo = 0;
		}
		weapon_options = self CalcWeaponOptions(camo, 0, 0);
		acvi = 0;
	}
	else
	{
		weapon = self getbuildkitweapon(weapon, upgraded);
		weapon_options = self getbuildkitweaponoptions(weapon, camo);
		acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(weapon, upgraded);
	}
	self GiveWeapon(weapon, weapon_options, acvi);
	return weapon;
}

/*
	Name: function_942ffd13
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x8610
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 3225
*/
function function_942ffd13()
{
	return 1;
}

/*
	Name: function_23441668
	Namespace: namespace_ca0ebbdc
	Checksum: 0x424F4353
	Offset: 0x8620
	Size: 0x54
	Parameters: 0
	Flags: None
	Line Number: 3240
*/
function function_23441668()
{
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	self DoDamage(self.health + 666, self.origin);
}

