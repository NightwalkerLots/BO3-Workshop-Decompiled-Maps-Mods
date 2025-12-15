#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace zm_perk_staminup;

/*
	Name: __init__sytem__
	Namespace: zm_perk_staminup
	Checksum: 0xDE718F0A
	Offset: 0x358
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_staminup", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_staminup
	Checksum: 0x9D6FE795
	Offset: 0x3A0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_staminup_perk_for_level();
	}
}

/*
	Name: __main__
	Namespace: zm_perk_staminup
	Checksum: 0x57FFED3
	Offset: 0x3D8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_6c3e53e0();
	}
}

/*
	Name: enable_staminup_perk_for_level
	Namespace: zm_perk_staminup
	Checksum: 0xDA20C58D
	Offset: 0x410
	Size: 0x290
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function enable_staminup_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_staminup", "marathon", 2000, &"ZOMBIE_PERK_MARATHON", GetWeapon("zombie_perk_bottle_marathon"));
	zm_perks::register_perk_precache_func("specialty_staminup", &staminup_precache);
	zm_perks::register_perk_clientfields("specialty_staminup", &staminup_register_clientfield, &staminup_set_clientfield);
	zm_perks::register_perk_machine("specialty_staminup", &staminup_perk_machine_setup);
	zm_perks::register_perk_threads("specialty_staminup", &function_852448f3, &function_a4c9b351);
	zm_perks::register_perk_host_migration_params("specialty_staminup", "vending_marathon", "specialty_staminup");
	if(namespace_b8afaefc::function_fc92a42d() && (level.script == "zm_zod" || level.script == "zm_genesis"))
	{
		zm_perks::register_perk_machine_power_override("specialty_staminup", &function_72cf2b1);
	}
	if(level.script == "zm_asylum")
	{
		namespace_b8afaefc::function_8fd06793((-134, -392, 226), VectorScale((0, 1, 0), 180), "specialty_staminup", "p7_zm_vending_marathon");
	}
	else if(level.script == "zm_sumpf")
	{
		namespace_b8afaefc::function_8fd06793((11017, 3412, -661), VectorScale((0, 1, 0), 220), "specialty_staminup", "p7_zm_vending_marathon");
	}
	else if(level.script == "zm_theater")
	{
		namespace_b8afaefc::function_8fd06793((-1, 908, -87), (0, 0, 0), "specialty_staminup", "p7_zm_vending_marathon");
		return;
	}
}

/*
	Name: staminup_precache
	Namespace: zm_perk_staminup
	Checksum: 0x2960C35F
	Offset: 0x6A8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function staminup_precache()
{
	level._effect["specialty_staminup"] = "harry/zm_perks/fx_perk_stamin_up";
	level.machine_assets["specialty_staminup"] = spawnstruct();
	level.machine_assets["specialty_staminup"].weapon = GetWeapon("zombie_perk_bottle_marathon");
	level.machine_assets["specialty_staminup"].off_model = "p7_zm_vending_marathon";
	level.machine_assets["specialty_staminup"].on_model = "p7_zm_vending_marathon";
}

/*
	Name: staminup_register_clientfield
	Namespace: zm_perk_staminup
	Checksum: 0xF5905278
	Offset: 0x770
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 125
*/
function staminup_register_clientfield()
{
	clientfield::register("clientuimodel", "hudItems.perks.marathon", 1, 2, "int");
}

/*
	Name: staminup_set_clientfield
	Namespace: zm_perk_staminup
	Checksum: 0x8C5B99CE
	Offset: 0x7B0
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 140
*/
function staminup_set_clientfield(n_state)
{
	if(n_state != 0 && (level namespace_b8afaefc::function_9f353429("specialty_staminup") || self namespace_b8afaefc::function_9f353429("specialty_staminup")))
	{
		n_state = 2;
	}
	self clientfield::set_player_uimodel("hudItems.perks.marathon", n_state);
	return;
}

/*
	Name: staminup_perk_machine_setup
	Namespace: zm_perk_staminup
	Checksum: 0xBD75B4C9
	Offset: 0x840
	Size: 0x100
	Parameters: 4
	Flags: None
	Line Number: 160
*/
function staminup_perk_machine_setup(var_39cc5a0b, var_8bcf7b93, var_3189c3fc, e_collision)
{
	var_39cc5a0b.script_sound = "mus_perks_stamin_jingle";
	var_39cc5a0b.script_string = "marathon_perk";
	var_39cc5a0b.script_label = "mus_perks_stamin_sting";
	var_39cc5a0b.target = "vending_marathon";
	var_8bcf7b93.script_string = "marathon_perk";
	var_8bcf7b93.targetname = "vending_marathon";
	if(isdefined(var_3189c3fc))
	{
		var_3189c3fc.script_string = "marathon_perk";
	}
	var_8bcf7b93 thread namespace_b8afaefc::function_2a628bd("specialty_staminup", "i_fxt_zmb_perk_stamin", (1, 0.980392, 0.098039));
}

/*
	Name: function_852448f3
	Namespace: zm_perk_staminup
	Checksum: 0xC6D1AB57
	Offset: 0x948
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function function_852448f3()
{
	namespace_b8afaefc::function_ffb18d9f("specialty_staminup", "3.0.4");
	if(level namespace_b8afaefc::function_9f353429("specialty_staminup"))
	{
		self namespace_b8afaefc::function_7932e598("specialty_staminup");
	}
	if(self namespace_b8afaefc::function_9f353429("specialty_staminup"))
	{
		return;
	}
	self function_f7647662(1);
}

/*
	Name: function_a4c9b351
	Namespace: zm_perk_staminup
	Checksum: 0x7B7040F6
	Offset: 0x9F8
	Size: 0x38
	Parameters: 3
	Flags: None
	Line Number: 209
*/
function function_a4c9b351(b_pause, str_perk, str_result)
{
	self function_f7647662(0);
}

/*
	Name: function_72cf2b1
	Namespace: zm_perk_staminup
	Checksum: 0xBFC18994
	Offset: 0xA38
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 224
*/
function function_72cf2b1()
{
	namespace_b8afaefc::function_cfe6acb0("specialty_staminup");
}

/*
	Name: function_6c3e53e0
	Namespace: zm_perk_staminup
	Checksum: 0xF9602A73
	Offset: 0xA60
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 239
*/
function function_6c3e53e0()
{
	if(isdefined(1) && 1)
	{
		namespace_b8afaefc::function_38f810ea("specialty_staminup");
	}
}

/*
	Name: function_f7647662
	Namespace: zm_perk_staminup
	Checksum: 0xE7AF0E0
	Offset: 0xA98
	Size: 0x266
	Parameters: 1
	Flags: None
	Line Number: 257
*/
function function_f7647662(b_enabled)
{
	if(isdefined(b_enabled) && b_enabled)
	{
		if(isdefined(1) && 1)
		{
			for(i = 0; i < Array("specialty_movefaster", "specialty_fastmantle", "specialty_sprintrecovery", "specialty_sprintfirerecovery", "specialty_sprintfire", "specialty_sprintgrenadelethal", "specialty_sprintgrenadetactical", "specialty_sprintequipment").size; i++)
			{
				self setPerk(Array("specialty_movefaster", "specialty_fastmantle", "specialty_sprintrecovery", "specialty_sprintfirerecovery", "specialty_sprintfire", "specialty_sprintgrenadelethal", "specialty_sprintgrenadetactical", "specialty_sprintequipment")[i]);
			}
			self thread namespace_b8afaefc::function_f4c6e254(Array("specialty_movefaster", "specialty_fastmantle", "specialty_sprintrecovery", "specialty_sprintfirerecovery", "specialty_sprintfire", "specialty_sprintgrenadelethal", "specialty_sprintgrenadetactical", "specialty_sprintequipment"), "specialty_staminup", "zm_bgb_firing_on_all_cylinders");
		}
	}
	else if(isdefined(1) && 1)
	{
		for(i = 0; i < Array("specialty_movefaster", "specialty_fastmantle", "specialty_sprintrecovery", "specialty_sprintfirerecovery", "specialty_sprintfire", "specialty_sprintgrenadelethal", "specialty_sprintgrenadetactical", "specialty_sprintequipment").size; i++)
		{
			self unsetPerk(Array("specialty_movefaster", "specialty_fastmantle", "specialty_sprintrecovery", "specialty_sprintfirerecovery", "specialty_sprintfire", "specialty_sprintgrenadelethal", "specialty_sprintgrenadetactical", "specialty_sprintequipment")[i]);
		}
	}
}

