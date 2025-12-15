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
#include scripts\zm\_zm_powerup_utility;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_552d9932;

/*
	Name: __init__sytem__
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0x548
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 46
*/
function autoexec __init__sytem__()
{
	system::register("NUKA_COLA", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0x588
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function __init__()
{
	function_1a92256e();
	return;
}

/*
	Name: function_1a92256e
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0x5A8
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 79
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_nukacola", "customperk", 2000, &"ZM_REAP_MOD_PERK_NUKA_COLA", GetWeapon("zombie_perk_bottle_nukacola"));
	zm_perks::register_perk_precache_func("specialty_nukacola", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_nukacola", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_nukacola", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_nukacola", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_nukacola", "Nuka Cola", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_nukacola", &"ZM_REAP_MOD_PERK_NUKA_COLA_DB", 2000, "Nuka Cola", "nukacola");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_nukacola"] = 1;
	namespace_3b75c34a::function_4e972a8e(&function_a8b76767);
	callback::on_spawned(&on_player_connect);
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0x788
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 107
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_nukacola"] = spawnstruct();
	level.machine_assets["specialty_nukacola"].weapon = GetWeapon("zombie_perk_bottle_nukacola");
	level.machine_assets["specialty_nukacola"].off_model = "cz_zombie_vending_nuka_cola_off";
	level.machine_assets["specialty_nukacola"].on_model = "cz_zombie_vending_nuka_cola";
}

/*
	Name: function_19157aff
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0x830
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 125
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
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0x840
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 145
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_nukacola", "nukacola", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0x888
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 160
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_nukacola";
	use_trigger.script_label = "";
	use_trigger.target = "Nuka Cola";
	perk_machine.script_string = "specialty_nukacola";
	perk_machine.targetname = "Nuka Cola";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_nukacola";
		return;
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0x950
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_nukacola"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_nukacola"] = 1;
}

/*
	Name: function_b4722825
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0x9D8
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 213
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_nukacola"] = 0;
	self.var_b5c2c258["specialty_nukacola"] = undefined;
	self.var_d6aef449["specialty_nukacola"] = undefined;
}

/*
	Name: function_a8b76767
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0xA38
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 230
*/
function function_a8b76767()
{
	powerup = self.powerup_name;
	self waittill("powerup_grabbed");
	if(isdefined(self.power_up_grab_player) && self.power_up_grab_player namespace_851dc78f::function_b690a849("specialty_nukacola"))
	{
		if(powerup == "nuke")
		{
			level thread zm_powerups::special_powerup_drop(self.power_up_grab_player.origin);
		}
		else if(RandomInt(100) < 20)
		{
			level thread zm_powerups::special_powerup_drop(self.power_up_grab_player.origin);
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: on_player_connect
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0xB18
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 259
*/
function on_player_connect()
{
	self thread function_4b7a4171();
	return;
	ERROR: Bad function call
}

/*
	Name: function_4b7a4171
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0xB40
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 276
*/
function function_4b7a4171()
{
	self endon("disconnect");
	self notify("hash_d846e4cc");
	self endon("hash_d846e4cc");
	self thread function_59baf02f();
	while(1)
	{
		if(self namespace_851dc78f::function_5f9a13b3("specialty_nukacola"))
		{
			self.var_f8c345ca = 1;
		}
		else if(!self laststand::player_is_in_laststand())
		{
			self.var_f8c345ca = undefined;
		}
		wait(1);
	}
}

/*
	Name: function_59baf02f
	Namespace: namespace_552d9932
	Checksum: 0x424F4353
	Offset: 0xBE8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 306
*/
function function_59baf02f()
{
	self endon("disconnect");
	self notify("hash_59baf02f");
	self endon("hash_59baf02f");
	while(1)
	{
		self waittill("player_downed");
		if(isdefined(self.var_f8c345ca))
		{
			self thread zm_powerup_nuke::grab_nuke(self);
		}
	}
}

