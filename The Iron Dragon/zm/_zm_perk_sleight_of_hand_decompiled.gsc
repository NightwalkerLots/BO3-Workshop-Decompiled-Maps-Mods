#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace zm_perk_sleight_of_hand;

/*
	Name: __init__sytem__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x1D61311E
	Offset: 0x340
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_sleight_of_hand", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xCF20B70
	Offset: 0x388
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_sleight_of_hand_perk_for_level();
	}
}

/*
	Name: __main__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xCECDEF00
	Offset: 0x3C0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_652c5c8b();
	}
}

/*
	Name: enable_sleight_of_hand_perk_for_level
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x53042C29
	Offset: 0x3F8
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function enable_sleight_of_hand_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_fastreload", "sleight", 3000, &"ZOMBIE_PERK_FASTRELOAD", GetWeapon("zombie_perk_bottle_sleight"));
	zm_perks::register_perk_precache_func("specialty_fastreload", &sleight_of_hand_precache);
	zm_perks::register_perk_clientfields("specialty_fastreload", &sleight_of_hand_register_clientfield, &sleight_of_hand_set_clientfield);
	zm_perks::register_perk_machine("specialty_fastreload", &sleight_of_hand_perk_machine_setup);
	zm_perks::register_perk_threads("specialty_fastreload", &function_463dec8e, &function_11474d3c);
	zm_perks::register_perk_host_migration_params("specialty_fastreload", "vending_sleight", "specialty_fastreload");
}

/*
	Name: sleight_of_hand_precache
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x2941A31A
	Offset: 0x530
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function sleight_of_hand_precache()
{
	level._effect["specialty_fastreload"] = "harry/zm_perks/fx_perk_sleight_of_hand_light";
	level.machine_assets["specialty_fastreload"] = spawnstruct();
	level.machine_assets["specialty_fastreload"].weapon = GetWeapon("zombie_perk_bottle_sleight");
	level.machine_assets["specialty_fastreload"].off_model = "p7_zm_vending_sleight";
	level.machine_assets["specialty_fastreload"].on_model = "p7_zm_vending_sleight";
}

/*
	Name: sleight_of_hand_register_clientfield
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x3A5938DA
	Offset: 0x5F8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 111
*/
function sleight_of_hand_register_clientfield()
{
	clientfield::register("clientuimodel", "hudItems.perks.sleight_of_hand", 1, 2, "int");
}

/*
	Name: sleight_of_hand_set_clientfield
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x7972ED2F
	Offset: 0x638
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 126
*/
function sleight_of_hand_set_clientfield(n_state)
{
	if(n_state != 0 && (level namespace_b8afaefc::function_9f353429("specialty_fastreload") || self namespace_b8afaefc::function_9f353429("specialty_fastreload")))
	{
		n_state = 2;
	}
	self clientfield::set_player_uimodel("hudItems.perks.sleight_of_hand", n_state);
}

/*
	Name: sleight_of_hand_perk_machine_setup
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x854FF6FF
	Offset: 0x6C8
	Size: 0x100
	Parameters: 4
	Flags: None
	Line Number: 145
*/
function sleight_of_hand_perk_machine_setup(var_39cc5a0b, var_8bcf7b93, var_3189c3fc, e_collision)
{
	var_39cc5a0b.script_sound = "mus_perks_speed_jingle";
	var_39cc5a0b.script_string = "speedcola_perk";
	var_39cc5a0b.script_label = "mus_perks_speed_sting";
	var_39cc5a0b.target = "vending_sleight";
	var_8bcf7b93.script_string = "speedcola_perk";
	var_8bcf7b93.targetname = "vending_sleight";
	if(isdefined(var_3189c3fc))
	{
		var_3189c3fc.script_string = "speedcola_perk";
	}
	var_8bcf7b93 thread namespace_b8afaefc::function_2a628bd("specialty_fastreload", "i_fxt_zmb_speed", (0.141176, 0.70196, 0.239215));
}

/*
	Name: function_463dec8e
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x6A456E7D
	Offset: 0x7D0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 170
*/
function function_463dec8e()
{
	namespace_b8afaefc::function_ffb18d9f("specialty_fastreload", "3.0.4");
	if(level namespace_b8afaefc::function_9f353429("specialty_fastreload"))
	{
		self namespace_b8afaefc::function_7932e598("specialty_fastreload");
	}
	if(self namespace_b8afaefc::function_9f353429("specialty_fastreload"))
	{
		return;
	}
	self function_de1e0097(1);
}

/*
	Name: function_11474d3c
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xDABA2E7E
	Offset: 0x880
	Size: 0x38
	Parameters: 3
	Flags: None
	Line Number: 194
*/
function function_11474d3c(b_pause, str_perk, str_result)
{
	self function_de1e0097(0);
}

/*
	Name: function_652c5c8b
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xE4E88B8F
	Offset: 0x8C0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 209
*/
function function_652c5c8b()
{
	if(isdefined(1) && 1)
	{
		namespace_b8afaefc::function_38f810ea("specialty_fastreload");
	}
}

/*
	Name: function_de1e0097
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x3CEBBFFD
	Offset: 0x8F8
	Size: 0x1C6
	Parameters: 1
	Flags: None
	Line Number: 227
*/
function function_de1e0097(b_enabled)
{
	if(isdefined(b_enabled) && b_enabled)
	{
		if(isdefined(1) && 1)
		{
			for(i = 0; i < Array("specialty_fastweaponswitch", "specialty_fastequipmentuse", "specialty_fastmeleerecovery", "specialty_fasttoss").size; i++)
			{
				self setPerk(Array("specialty_fastweaponswitch", "specialty_fastequipmentuse", "specialty_fastmeleerecovery", "specialty_fasttoss")[i]);
			}
			self thread namespace_b8afaefc::function_f4c6e254(Array("specialty_fastweaponswitch", "specialty_fastequipmentuse", "specialty_fastmeleerecovery", "specialty_fasttoss"), "specialty_fastreload", "zm_bgb_armamental_accomplishment");
		}
	}
	else if(isdefined(1) && 1)
	{
		for(i = 0; i < Array("specialty_fastweaponswitch", "specialty_fastequipmentuse", "specialty_fastmeleerecovery", "specialty_fasttoss").size; i++)
		{
			self unsetPerk(Array("specialty_fastweaponswitch", "specialty_fastequipmentuse", "specialty_fastmeleerecovery", "specialty_fasttoss")[i]);
		}
	}
}

