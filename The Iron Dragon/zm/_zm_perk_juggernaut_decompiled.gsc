#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace zm_perk_juggernaut;

/*
	Name: __init__sytem__
	Namespace: zm_perk_juggernaut
	Checksum: 0x983B2E6C
	Offset: 0x2C8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_juggernaut", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_juggernaut
	Checksum: 0xF07660DF
	Offset: 0x310
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_juggernaut_perk_for_level();
	}
}

/*
	Name: __main__
	Namespace: zm_perk_juggernaut
	Checksum: 0xEC77C9F8
	Offset: 0x348
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_a1f13bb3();
	}
}

/*
	Name: enable_juggernaut_perk_for_level
	Namespace: zm_perk_juggernaut
	Checksum: 0x3712D9D7
	Offset: 0x380
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 70
*/
function enable_juggernaut_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_armorvest", "juggernog", 2500, &"ZOMBIE_PERK_JUGGERNAUT", GetWeapon("zombie_perk_bottle_jugg"));
	zm_perks::register_perk_precache_func("specialty_armorvest", &juggernaut_precache);
	zm_perks::register_perk_clientfields("specialty_armorvest", &juggernaut_register_clientfield, &juggernaut_set_clientfield);
	zm_perks::register_perk_machine("specialty_armorvest", &juggernaut_perk_machine_setup);
	zm_perks::register_perk_threads("specialty_armorvest", &function_1f2a5666, &function_83c12f54);
	zm_perks::register_perk_host_migration_params("specialty_armorvest", "vending_jugg", "specialty_armorvest");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: juggernaut_precache
	Namespace: zm_perk_juggernaut
	Checksum: 0x7FF1B073
	Offset: 0x4B8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 92
*/
function juggernaut_precache()
{
	level._effect["specialty_armorvest"] = "harry/zm_perks/fx_perk_juggernaut";
	level.machine_assets["specialty_armorvest"] = spawnstruct();
	level.machine_assets["specialty_armorvest"].weapon = GetWeapon("zombie_perk_bottle_jugg");
	level.machine_assets["specialty_armorvest"].off_model = "p7_zm_vending_jugg";
	level.machine_assets["specialty_armorvest"].on_model = "p7_zm_vending_jugg";
}

/*
	Name: juggernaut_register_clientfield
	Namespace: zm_perk_juggernaut
	Checksum: 0xB10DE089
	Offset: 0x580
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 111
*/
function juggernaut_register_clientfield()
{
	clientfield::register("clientuimodel", "hudItems.perks.juggernaut", 1, 2, "int");
}

/*
	Name: juggernaut_set_clientfield
	Namespace: zm_perk_juggernaut
	Checksum: 0x4DE913DF
	Offset: 0x5C0
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 126
*/
function juggernaut_set_clientfield(n_state)
{
	if(n_state != 0 && (level namespace_b8afaefc::function_9f353429("specialty_armorvest") || self namespace_b8afaefc::function_9f353429("specialty_armorvest")))
	{
		n_state = 2;
	}
	self clientfield::set_player_uimodel("hudItems.perks.juggernaut", n_state);
}

/*
	Name: juggernaut_perk_machine_setup
	Namespace: zm_perk_juggernaut
	Checksum: 0xE090E65C
	Offset: 0x650
	Size: 0x100
	Parameters: 4
	Flags: None
	Line Number: 145
*/
function juggernaut_perk_machine_setup(var_39cc5a0b, var_8bcf7b93, var_3189c3fc, e_collision)
{
	var_39cc5a0b.script_sound = "mus_perks_jugganog_jingle";
	var_39cc5a0b.script_string = "jugg_perk";
	var_39cc5a0b.script_label = "mus_perks_jugganog_sting";
	var_39cc5a0b.target = "vending_jugg";
	var_8bcf7b93.script_string = "jugg_perk";
	var_8bcf7b93.targetname = "vending_jugg";
	if(isdefined(var_3189c3fc))
	{
		var_3189c3fc.script_string = "jugg_perk";
	}
	var_8bcf7b93 thread namespace_b8afaefc::function_2a628bd("specialty_armorvest", "i_fxt_zmb_jugg", (0.949019, 0.121268, 0));
}

/*
	Name: function_1f2a5666
	Namespace: zm_perk_juggernaut
	Checksum: 0x7B0DC050
	Offset: 0x758
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 170
*/
function function_1f2a5666()
{
	namespace_b8afaefc::function_ffb18d9f("specialty_armorvest", "3.0.4");
	if(level namespace_b8afaefc::function_9f353429("specialty_armorvest"))
	{
		self namespace_b8afaefc::function_7932e598("specialty_armorvest");
	}
	if(self namespace_b8afaefc::function_9f353429("specialty_armorvest"))
	{
		return;
	}
	self function_d61b1b9f(1);
}

/*
	Name: function_83c12f54
	Namespace: zm_perk_juggernaut
	Checksum: 0x1C5A313A
	Offset: 0x808
	Size: 0x38
	Parameters: 3
	Flags: None
	Line Number: 194
*/
function function_83c12f54(b_pause, str_perk, str_result)
{
	self function_d61b1b9f(0);
	return;
	ERROR: Bad function call
}

/*
	Name: function_a1f13bb3
	Namespace: zm_perk_juggernaut
	Checksum: 0xAF3C2CEF
	Offset: 0x848
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 211
*/
function function_a1f13bb3()
{
	zombie_utility::set_zombie_var("zombie_perk_juggernaut_health", 100);
	zombie_utility::set_zombie_var("zombie_perk_juggernaut_health_upgrade", 150);
	if(isdefined(1) && 1)
	{
		zm_perks::register_perk_damage_override_func(&juggernaut_damage_override);
	}
	if(isdefined(1) && 1)
	{
		namespace_b8afaefc::function_38f810ea("specialty_armorvest");
		return;
	}
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_d61b1b9f
	Namespace: zm_perk_juggernaut
	Checksum: 0xF904BA7E
	Offset: 0x8F0
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 238
*/
function function_d61b1b9f(var_ad2f0e3f)
{
	if(isdefined(var_ad2f0e3f) && var_ad2f0e3f)
	{
		self zm_perks::perk_set_max_health_if_jugg("specialty_armorvest", 1, 0);
		continue;
	}
	self zm_perks::perk_set_max_health_if_jugg("health_reboot", 1, 0);
	return;
}

/*
	Name: juggernaut_damage_override
	Namespace: zm_perk_juggernaut
	Checksum: 0xE67ED473
	Offset: 0x968
	Size: 0xB0
	Parameters: 10
	Flags: None
	Line Number: 259
*/
function juggernaut_damage_override(e_inflictor, e_attacker, n_damage, var_df862ae6, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_ed5eb273)
{
	if(!self hasPerk("specialty_armorvest"))
	{
		return undefined;
	}
	switch(str_means_of_death)
	{
		case "MOD_BURNED":
		case "MOD_ELECTOCUTED":
		{
			return 0;
			break;
		}
		default
		{
		}
	}
	return undefined;
}

