#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\damagefeedback_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_spawner;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_599fec44;

/*
	Name: __init__sytem__
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x3C8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("ELEMENTAL_POP", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x408
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function __init__()
{
	function_1a92256e();
}

/*
	Name: function_1a92256e
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x428
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_elementalpop", "customperk", 3000, &"ZM_REAP_MOD_PERK_ELEMENTAL_POP", GetWeapon("zombie_perk_bottle_elemental_pop"));
	zm_perks::register_perk_precache_func("specialty_elementalpop", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_elementalpop", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_elementalpop", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_elementalpop", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_elementalpop", "Elemental Pop", "elemental_pop_machine_on");
	level thread namespace_851dc78f::function_c3c32972("specialty_elementalpop", &"ZM_REAP_MOD_PERK_ELEMENTAL_POP_DB", 2000, "Elemental Pop", "elementalpop");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_elementalpop"] = 1;
	callback::on_spawned(&on_player_spawned);
	zm_spawner::register_zombie_damage_callback(&function_79c59701);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x608
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 83
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_elementalpop"] = spawnstruct();
	level.machine_assets["specialty_elementalpop"].weapon = GetWeapon("zombie_perk_bottle_elemental_pop");
	level.machine_assets["specialty_elementalpop"].off_model = "cz_zombie_vending_elemental_pop_off";
	level.machine_assets["specialty_elementalpop"].on_model = "cz_zombie_vending_elemental_pop";
}

/*
	Name: function_19157aff
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x6B0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 101
*/
function function_19157aff()
{
	clientfield::register("toplayer", "player_elemental_pop", 1, 1, "int");
}

/*
	Name: function_99c1452c
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x6F0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 116
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_elementalpop", "elementalpop", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x738
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 131
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_elemental_pop_jingle";
	use_trigger.script_string = "specialty_elementalpop";
	use_trigger.script_label = "mus_perks_elemental_pop_sting";
	use_trigger.target = "Elemental Pop";
	perk_machine.script_string = "specialty_elementalpop";
	perk_machine.targetname = "Elemental Pop";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_elementalpop";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x800
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 155
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_elementalpop"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_elementalpop"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x888
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 183
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_elementalpop"] = 0;
	self.var_b5c2c258["specialty_elementalpop"] = undefined;
	self.var_d6aef449["specialty_elementalpop"] = undefined;
}

/*
	Name: on_player_spawned
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x8E8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 200
*/
function on_player_spawned()
{
	self thread function_c1a41461();
}

/*
	Name: function_c1a41461
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x910
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 215
*/
function function_c1a41461()
{
	self endon("disconnect");
	self notify("hash_c5d22591");
	self endon("hash_c5d22591");
	while(1)
	{
		self waittill("perk_purchased", perk);
		if(perk == "specialty_elementalpop")
		{
			machine = GetEntArray("Elemental Pop", "targetname");
			for(i = 0; i < machine.size; i++)
			{
				machine[i] thread function_e3913032();
			}
		}
	}
}

/*
	Name: function_e3913032
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0x9F0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 244
*/
function function_e3913032()
{
	var_8be4db6f = spawn("script_model", self.origin);
	var_8be4db6f SetModel("tag_origin");
	var_8be4db6f.angles = self.angles;
	var_8be4db6f namespace_851dc78f::function_4621bbdd("scriptmover", "elemental_pop_firework", 1);
	var_8be4db6f playsound("elemental_pop_firework_oneshot");
	wait(5);
	var_8be4db6f namespace_851dc78f::function_4621bbdd("scriptmover", "elemental_pop_firework", 0);
	var_8be4db6f delete();
	return;
}

/*
	Name: function_c5171246
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0xAF0
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 267
*/
function function_c5171246(e_player)
{
	if(!isdefined(e_player) || (isdefined(e_player) && !isPlayer(e_player)))
	{
		return 0;
	}
	if(!e_player namespace_851dc78f::function_5f9a13b3("specialty_elementalpop") || isdefined(e_player.var_ba87e90c) || isdefined(self.var_143df51))
	{
		return 0;
	}
	else if(RandomInt(100) < 50)
	{
		return 1;
	}
	if(RandomInt(100) < 50 && e_player namespace_851dc78f::function_b690a849("specialty_elementalpop"))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_79c59701
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0xBF8
	Size: 0x130
	Parameters: 13
	Flags: None
	Line Number: 298
*/
function function_79c59701(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(isdefined(str_mod) && (str_mod == "MOD_RIFLE_BULLET" || str_mod == "MOD_PISTOL_BULLET") && isdefined(e_player) && isPlayer(e_player) && !isdefined(e_player.var_ba87e90c) && !isdefined(self.var_143df51) && !isdefined(self.var_4fc097c9))
	{
		if(self function_c5171246(e_player))
		{
			self thread function_eb348024(e_player, w_weapon, str_mod);
		}
	}
	return 0;
}

/*
	Name: function_eb348024
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0xD30
	Size: 0x288
	Parameters: 3
	Flags: None
	Line Number: 320
*/
function function_eb348024(e_player, w_weapon, str_mod)
{
	e_player endon("disconnect");
	e_player.var_4fc097c9 = 1;
	self.var_143df51 = 1;
	keys = getArrayKeys(level.AAT);
	AATs = [];
	for(i = 0; i < keys.size; i++)
	{
		if(keys[i] != "none")
		{
			AATs[AATs.size] = keys[i];
		}
	}
	if(AATs.size > 0)
	{
		name = AATs[RandomInt(AATs.size)];
		if(isdefined(level.AAT[name].validation_func))
		{
			if(self [[level.AAT[name].validation_func]]())
			{
				self thread [[level.AAT[name].result_func]](0, e_player, str_mod, w_weapon);
				e_player thread damagefeedback::update_override(level.AAT[name].damage_feedback_icon, level.AAT[name].damage_feedback_sound);
				e_player thread function_ba87e90c();
			}
		}
		else
		{
			self thread [[level.AAT[name].result_func]](0, e_player, str_mod, w_weapon);
			e_player thread damagefeedback::update_override(level.AAT[name].damage_feedback_icon, level.AAT[name].damage_feedback_sound);
			e_player thread function_ba87e90c();
		}
	}
	e_player.var_4fc097c9 = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ba87e90c
	Namespace: namespace_599fec44
	Checksum: 0x424F4353
	Offset: 0xFC0
	Size: 0x2A
	Parameters: 0
	Flags: None
	Line Number: 368
*/
function function_ba87e90c()
{
	self endon("disconnect");
	self.var_ba87e90c = 1;
	wait(30);
	self.var_ba87e90c = undefined;
}

