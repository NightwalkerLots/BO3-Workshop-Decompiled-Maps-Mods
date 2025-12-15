#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_perk_random;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\gametypes\_globallogic_score;

#namespace zm_perk_phdflopper;

/*
	Name: __init__sytem__
	Namespace: zm_perk_phdflopper
	Checksum: 0x90D1E9AC
	Offset: 0x540
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 31
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_phdflopper", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: __init__
	Namespace: zm_perk_phdflopper
	Checksum: 0x14DC3327
	Offset: 0x580
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function __init__()
{
	function_555fd93f();
	callback::on_spawned(&function_dc544792);
}

/*
	Name: function_555fd93f
	Namespace: zm_perk_phdflopper
	Checksum: 0xCE30E3D4
	Offset: 0x5C0
	Size: 0x140
	Parameters: 0
	Flags: Private
	Line Number: 65
*/
function private function_555fd93f()
{
	zm_perks::register_perk_basic_info("specialty_phdflopper", "phd", 2000, "Hold ^3[{+activate}]^7 for PHD Flopper [Cost: &&1]^5 \n Immunity from fall damage & explosion damage \n Jumping off tall heights causes a blast when landing \n Explosions deal greatly increased damage", GetWeapon("zombie_perk_bottle_phd"));
	zm_perks::register_perk_precache_func("specialty_phdflopper", &function_f7f52842);
	zm_perks::register_perk_clientfields("specialty_phdflopper", &function_8818abe0, &function_d1668e59);
	zm_perks::register_perk_machine("specialty_phdflopper", &function_e9598115);
	zm_perks::register_perk_host_migration_params("specialty_phdflopper", "vending_phd", "vending_phd_light");
	zm_perks::register_perk_threads("specialty_phdflopper", &function_67e89377, &function_94a6ffae);
	function_476330a8();
}

/*
	Name: function_f7f52842
	Namespace: zm_perk_phdflopper
	Checksum: 0xC60BDA55
	Offset: 0x708
	Size: 0xE0
	Parameters: 0
	Flags: Private
	Line Number: 86
*/
function private function_f7f52842()
{
	if(isdefined(level.var_fb2fb2b6))
	{
		[[level.var_fb2fb2b6]]();
		return;
	}
	level._effect["vending_phd_light"] = "_mikeyray/perks/phd/fx_perk_phd";
	level.machine_assets["specialty_phdflopper"] = spawnstruct();
	level.machine_assets["specialty_phdflopper"].weapon = GetWeapon("zombie_perk_bottle_phd");
	level.machine_assets["specialty_phdflopper"].off_model = "p7_zm_vending_phd";
	level.machine_assets["specialty_phdflopper"].on_model = "p7_zm_vending_phd_active";
}

/*
	Name: function_8818abe0
	Namespace: zm_perk_phdflopper
	Checksum: 0x3650C066
	Offset: 0x7F0
	Size: 0x38
	Parameters: 0
	Flags: Private
	Line Number: 110
*/
function private function_8818abe0()
{
	clientfield::register("clientuimodel", "hudItems.perks.phdflopper", 1, 2, "int");
}

/*
	Name: function_d1668e59
	Namespace: zm_perk_phdflopper
	Checksum: 0x5F1F0379
	Offset: 0x830
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 125
*/
function private function_d1668e59(state)
{
	self clientfield::set_player_uimodel("hudItems.perks.phdflopper", state);
}

/*
	Name: function_e9598115
	Namespace: zm_perk_phdflopper
	Checksum: 0x54B55F10
	Offset: 0x868
	Size: 0xC0
	Parameters: 4
	Flags: Private
	Line Number: 140
*/
function private function_e9598115(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_phdflopper_jingle";
	use_trigger.script_string = "phdflopper_perk";
	use_trigger.script_label = "mus_perks_phdflopper_sting";
	use_trigger.target = "vending_phd";
	perk_machine.script_string = "phdflopper_perk";
	perk_machine.targetname = "vending_phd";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "phdflopper_perk";
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_476330a8
	Namespace: zm_perk_phdflopper
	Checksum: 0x7866240
	Offset: 0x930
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 166
*/
function function_476330a8()
{
	level._effect["phdflopper_explode"] = "explosions/fx_exp_grenade_default";
	if(isdefined(1) && 1)
	{
		zm::register_player_damage_callback(&function_d2f3568f);
	}
	if(isdefined(1) && 1)
	{
		zm::register_actor_damage_callback(&function_463b4d36);
		zm::register_vehicle_damage_callback(&function_ad0ee016);
	}
	wait(0.05);
	zm_perk_random::include_perk_in_random_rotation("specialty_phdflopper");
}

/*
	Name: function_d2f3568f
	Namespace: zm_perk_phdflopper
	Checksum: 0x38349532
	Offset: 0xA00
	Size: 0xD0
	Parameters: 12
	Flags: Private
	Line Number: 192
*/
function private function_d2f3568f(inflictor, attacker, damage, flags, mod, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(isPlayer(self) && self hasPerk("specialty_phdflopper") && (zm_utility::is_explosive_damage(mod) || mod == "MOD_FALLING"))
	{
		return 0;
	}
	return -1;
}

/*
	Name: function_463b4d36
	Namespace: zm_perk_phdflopper
	Checksum: 0x9F4FED0A
	Offset: 0xAD8
	Size: 0xD0
	Parameters: 12
	Flags: Private
	Line Number: 211
*/
function private function_463b4d36(inflictor, attacker, damage, flags, mod, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(isPlayer(attacker) && attacker hasPerk("specialty_phdflopper") && zm_utility::is_explosive_damage(mod))
	{
		return damage * 2.5;
	}
	return -1;
}

/*
	Name: function_ad0ee016
	Namespace: zm_perk_phdflopper
	Checksum: 0x4218D319
	Offset: 0xBB0
	Size: 0xE0
	Parameters: 15
	Flags: Private
	Line Number: 230
*/
function private function_ad0ee016(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, vDamageOrigin, psOffsetTime, damageFromUnderneath, modelIndex, partName, vSurfaceNormal)
{
	if(isPlayer(eAttacker) && eAttacker hasPerk("specialty_phdflopper") && zm_utility::is_explosive_damage(sMeansOfDeath))
	{
		return iDamage * 2.5;
	}
	return 0;
}

/*
	Name: function_67e89377
	Namespace: zm_perk_phdflopper
	Checksum: 0x4F549D27
	Offset: 0xC98
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 249
*/
function function_67e89377()
{
	self endon("death");
	self endon("disconnect");
	self endon("specialty_phdflopper" + "_stop");
	if(isdefined(1) && 1)
	{
		self thread function_f13cc37();
	}
	if(isdefined(0) && 0)
	{
		self thread function_4975e9d5();
		return;
	}
	waittillframeend;
}

/*
	Name: function_f13cc37
	Namespace: zm_perk_phdflopper
	Checksum: 0xDF6728F2
	Offset: 0xD18
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 276
*/
function function_f13cc37()
{
	self endon("death");
	self endon("disconnect");
	self endon("specialty_phdflopper" + "_stop");
	for(;;)
	{
		self util::waittill_any_return("jump_begin", "slide_begin");
		startpos = self.origin[2];
		while(self IsSliding())
		{
			wait(0.1);
		}
		while(!self IsOnGround())
		{
			wait(0.1);
		}
		endPos = self.origin[2];
		heightDiff = startpos - endPos;
		if(heightDiff > 48)
		{
			self function_140dadc4();
			wait(3);
		}
	}
}

/*
	Name: function_4975e9d5
	Namespace: zm_perk_phdflopper
	Checksum: 0x95CD9682
	Offset: 0xE40
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 313
*/
function function_4975e9d5()
{
	self endon("death");
	self endon("disconnect");
	self endon("specialty_phdflopper" + "_stop");
	while(self IsSliding())
	{
		self thread function_140dadc4();
		self.var_7607af34 = 1;
		wait(0.2);
		continue;
		if(isdefined(self.var_7607af34) && self.var_7607af34)
		{
			wait(5);
			self.var_7607af34 = 0;
		}
		wait(0.05);
	}
}

/*
	Name: function_140dadc4
	Namespace: zm_perk_phdflopper
	Checksum: 0xF519AE79
	Offset: 0xEF0
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 343
*/
function function_140dadc4()
{
	fxModel = util::spawn_model("tag_origin", self.origin);
	FX = PlayFXOnTag(level._effect["phdflopper_explode"], fxModel, "tag_origin");
	fxModel playsound("wpn_grenade_explode");
	if(isdefined(1) && 1)
	{
		Earthquake(0.42, 1, self.origin, 900);
	}
	radiusdamage(self.origin, 900, 5000, 1000, self, "MOD_EXPLOSIVE");
	wait(2);
	fxModel delete();
	if(isdefined(FX))
	{
		FX delete();
		return;
	}
}

/*
	Name: function_94a6ffae
	Namespace: zm_perk_phdflopper
	Checksum: 0x4E28BD15
	Offset: 0x1030
	Size: 0x38
	Parameters: 3
	Flags: None
	Line Number: 372
*/
function function_94a6ffae(b_pause, str_perk, str_result)
{
	self notify("specialty_phdflopper" + "_stop");
}

/*
	Name: function_dc544792
	Namespace: zm_perk_phdflopper
	Checksum: 0xC86B3201
	Offset: 0x1070
	Size: 0x2C
	Parameters: 0
	Flags: None
	Line Number: 387
*/
function function_dc544792()
{
	self globallogic_score::initPersStat("specialty_phdflopper" + "_drank", 0);
}

