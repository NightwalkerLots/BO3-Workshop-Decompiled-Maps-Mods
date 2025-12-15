#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\wardog\perk\_wardog_perk_phd;
#include scripts\wardog\wardog_addon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_utility;

#namespace namespace_51d1a641;

/*
	Name: main
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0x500
	Size: 0x1D8
	Parameters: 0
	Flags: AutoExec
	Line Number: 26
*/
function autoexec main()
{
	namespace_226da3ce::function_a60be471("WardogAddonPerkPHDFlopper");
	namespace_226da3ce::function_20c1126d("WardogAddonPerkPHDFlopper", "post_init", &function_1fe2745f);
	namespace_226da3ce::function_20c1126d("WardogAddonPerkPHDFlopper", "player_init", &function_57edbfea);
	zm_perks::register_perk_basic_info("specialty_phdflopper", "divetonuke", 2000, &"ZOMBIE_PERK_DIVETONUKE", GetWeapon("wardog_t7_perk_bottle_phd"));
	zm_perks::register_perk_precache_func("specialty_phdflopper", &function_5d629ba5);
	zm_perks::register_perk_clientfields("specialty_phdflopper", &function_c3d71ca7, &function_77d3c394);
	zm_perks::register_perk_machine("specialty_phdflopper", &function_16238812, &function_b56c5e70);
	zm_perks::register_perk_threads("specialty_phdflopper", &function_2f704e36, &function_c98834b4);
	zm_perks::register_perk_host_migration_params("specialty_phdflopper", "vending_phd", "phd_light");
	zm_perks::register_perk_damage_override_func(&function_27c4433d);
}

/*
	Name: function_1fe2745f
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0x6E0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function function_1fe2745f()
{
	var_32d5b4c9 = "hud|";
	var_32d5b4c9 = var_32d5b4c9 + "specialty_phdflopper" + "|";
	var_32d5b4c9 = var_32d5b4c9 + "shader|";
	var_32d5b4c9 = var_32d5b4c9 + "wardog_t7_hud_perk_phd";
	namespace_226da3ce::function_49714168("WardogAddonPerkPHDFlopper", "WardogAddonPerkHUD", var_32d5b4c9);
	return;
}

/*
	Name: function_b56c5e70
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0x768
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function function_b56c5e70()
{
	level.zombiemode_divetonuke_perk_func = &divetonuke_explode;
}

/*
	Name: function_5d629ba5
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0x790
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 85
*/
function function_5d629ba5()
{
	level._effect["divetonuke_groundhit"] = "explosions/fx_exp_grenade_default";
	level._effect["phd_light"] = "zombie/fx_perk_juggernaut_zmb";
	level.machine_assets["specialty_phdflopper"] = spawnstruct();
	level.machine_assets["specialty_phdflopper"].weapon = GetWeapon("wardog_t7_perk_bottle_phd");
	level.machine_assets["specialty_phdflopper"].off_model = "wardog_t7_perk_machine_phd";
	level.machine_assets["specialty_phdflopper"].on_model = "wardog_t7_perk_machine_phd_on";
}

/*
	Name: function_c3d71ca7
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0x870
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function function_c3d71ca7()
{
	clientfield::register("clientuimodel", "hudItems.perks.phdflopper", 1, 2, "int");
	clientfield::register("toplayer", "vulture_waypoint_phd", 1, 2, "int");
}

/*
	Name: function_77d3c394
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0x8E0
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 121
*/
function function_77d3c394(state)
{
	if(!namespace_226da3ce::function_3cae8fec("WardogAddonPerkHUD"))
	{
		self clientfield::set_player_uimodel("hudItems.perks.phdflopper", state);
	}
	self clientfield::set_to_player("vulture_waypoint_phd", state);
}

/*
	Name: function_16238812
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0x950
	Size: 0xD0
	Parameters: 4
	Flags: None
	Line Number: 140
*/
function function_16238812(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_phd_jingle";
	use_trigger.script_string = "phd_perk";
	use_trigger.script_label = "mus_perks_phd_sting";
	use_trigger.longJingleWait = 1;
	use_trigger.target = "vending_phd";
	perk_machine.script_string = "phd_perk";
	perk_machine.targetname = "vending_phd";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "phd_perk";
	}
}

/*
	Name: function_2f704e36
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0xA28
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 165
*/
function function_2f704e36()
{
	if(namespace_226da3ce::function_3cae8fec("WardogAddonPerkHUD"))
	{
		var_32d5b4c9 = "hud|";
		var_32d5b4c9 = var_32d5b4c9 + "specialty_phdflopper" + "|";
		var_32d5b4c9 = var_32d5b4c9 + "give";
		namespace_226da3ce::function_49714168("WardogAddonPerkPHDFlopper", "WardogAddonPerkHUD", var_32d5b4c9, self);
	}
	self thread function_f3cb2d65();
}

/*
	Name: function_f3cb2d65
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0xAD8
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 187
*/
function function_f3cb2d65()
{
	self notify("hash_f3cb2d65");
	self endon("hash_f3cb2d65");
	while(1)
	{
		self waittill("grenade_fire", grenade, weapon);
		if(!self hasPerk("specialty_phdflopper"))
		{
			continue;
		}
		if(!isdefined(grenade))
		{
			continue;
		}
		if(isdefined(grenade.additional) && grenade.additional)
		{
			continue;
		}
		var_2d1c309 = self zm_utility::get_player_lethal_grenade();
		if(weapon != var_2d1c309)
		{
			continue;
		}
		PlayFXOnTag("fxweaponfx_trail_grenade.efx", grenade, "tag_origin");
		grenade.additional = 1;
		self thread function_9ebde1a6(grenade, weapon);
	}
}

/*
	Name: function_9ebde1a6
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0xC10
	Size: 0x268
	Parameters: 2
	Flags: None
	Line Number: 227
*/
function function_9ebde1a6(grenade, weapon)
{
	if(!isdefined(grenade))
	{
		return;
	}
	if(!isdefined(weapon))
	{
		return;
	}
	grenade util::waittill_any_timeout(1.5, "stationary", "grenade_bounce");
	if(!isdefined(grenade))
	{
		return;
	}
	if(!isdefined(weapon))
	{
		return;
	}
	if(isdefined(grenade.threwBack) && grenade.threwBack)
	{
		return;
	}
	var_3ccf1245 = self MagicGrenadeType(weapon, grenade.origin, (0, 75, 300), 3);
	PlayFXOnTag("fxweaponfx_trail_grenade.efx", var_3ccf1245, "tag_origin");
	var_3ccf1245.additional = 1;
	var_3ccf1245 = self MagicGrenadeType(weapon, grenade.origin, (0, -75, 300), 3);
	PlayFXOnTag("fxweaponfx_trail_grenade.efx", var_3ccf1245, "tag_origin");
	var_3ccf1245.additional = 1;
	var_3ccf1245 = self MagicGrenadeType(weapon, grenade.origin, (75, 0, 300), 3);
	PlayFXOnTag("fxweaponfx_trail_grenade.efx", var_3ccf1245, "tag_origin");
	var_3ccf1245.additional = 1;
	var_3ccf1245 = self MagicGrenadeType(weapon, grenade.origin, (-75, 0, 300), 3);
	PlayFXOnTag("fxweaponfx_trail_grenade.efx", var_3ccf1245, "tag_origin");
	var_3ccf1245.additional = 1;
}

/*
	Name: function_c98834b4
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0xE80
	Size: 0xB8
	Parameters: 3
	Flags: None
	Line Number: 274
*/
function function_c98834b4(b_pause, str_perk, str_result)
{
	if(namespace_226da3ce::function_3cae8fec("WardogAddonPerkHUD"))
	{
		var_32d5b4c9 = "hud|";
		var_32d5b4c9 = var_32d5b4c9 + "specialty_phdflopper" + "|";
		var_32d5b4c9 = var_32d5b4c9 + "take";
		namespace_226da3ce::function_49714168("WardogAddonPerkPHDFlopper", "WardogAddonPerkHUD", var_32d5b4c9, self);
	}
	self notify("hash_f3cb2d65");
}

/*
	Name: divetonuke_explode
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0xF40
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 296
*/
function divetonuke_explode(attacker, origin)
{
	if(!attacker hasPerk("specialty_phdflopper"))
	{
		return;
	}
	if(isdefined(0) && 0)
	{
		attacker thread divetonuke_explode_network_optimized(origin);
	}
	else
	{
		SetPlayerIgnoreRadiusDamage(1);
		radiusdamage(origin, 300, 5000, 1000, attacker, "MOD_GRENADE_SPLASH");
		SetPlayerIgnoreRadiusDamage(0);
	}
	playFX(level._effect["divetonuke_groundhit"], origin);
	attacker playsound("wpn_grenade_explode");
	return;
}

/*
	Name: divetonuke_explode_network_optimized
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0x1058
	Size: 0x1C8
	Parameters: 1
	Flags: Private
	Line Number: 327
*/
function private divetonuke_explode_network_optimized(origin)
{
	self endon("disconnect");
	self endon("death");
	zombies = util::get_array_of_closest(origin, zombie_utility::get_round_enemy_array(), undefined, undefined, 300);
	count = 0;
	foreach(zombie in zombies)
	{
		if(!isdefined(zombie) || !isalive(zombie))
		{
			continue;
		}
		damage = 1000 + 4000 * 1 - Distance(zombie.origin, origin) / 300;
		zombie DoDamage(damage, zombie.origin, self, self, 0, "MOD_GRENADE_SPLASH");
		count--;
		if(count <= 0)
		{
			util::wait_network_frame();
			count = randomIntRange(1, 3);
		}
	}
}

/*
	Name: function_27c4433d
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0x1228
	Size: 0xF8
	Parameters: 10
	Flags: None
	Line Number: 360
*/
function function_27c4433d(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!self hasPerk("specialty_phdflopper"))
	{
		return undefined;
	}
	switch(sMeansOfDeath)
	{
		case "MOD_BURNED":
		case "MOD_ELECTOCUTED":
		case "MOD_EXPLOSIVE":
		case "MOD_EXPLOSIVE_SPLASH":
		case "MOD_FALLING":
		case "MOD_GRENADE":
		case "MOD_GRENADE_SPLASH":
		case "MOD_IMPACT":
		case "MOD_PROJECTILE":
		case "MOD_PROJECTILE_SPLASH":
		{
			iDamage = 0;
			return 0;
			break;
		}
		default
		{
		}
	}
	return undefined;
}

/*
	Name: function_57edbfea
	Namespace: namespace_51d1a641
	Checksum: 0x424F4353
	Offset: 0x1328
	Size: 0x172
	Parameters: 0
	Flags: Private
	Line Number: 400
*/
function private function_57edbfea()
{
	self endon("disconnect");
	self endon("death");
	self notify("hash_b34df8d4");
	self endon("hash_b34df8d4");
	for(;;)
	{
		wait(0.05);
		if(self IsOnGround())
		{
		}
		else
		{
			velocity = self getvelocity();
			while(!self IsOnGround())
			{
				velocity = self getvelocity();
				wait(0.05);
			}
			wait(0.05);
			if(!self IsSliding())
			{
			}
			else if(velocity[2] > -300)
			{
			}
			else
			{
				self notify("hash_70118743");
				wait(0.05);
				waittillframeend;
				if(self hasPerk("specialty_phdflopper"))
				{
					self notify("Divetonuke");
					if(isdefined(level.zombiemode_divetonuke_perk_func))
					{
						thread [[level.zombiemode_divetonuke_perk_func]](self, self.origin);
					}
				}
				wait(0.05);
				waittillframeend;
				self notify("hash_814288b0");
			}
		}
	}
}

