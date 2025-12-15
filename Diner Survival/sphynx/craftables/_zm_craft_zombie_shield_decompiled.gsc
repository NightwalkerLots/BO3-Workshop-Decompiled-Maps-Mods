#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\vk_script\_zm_vk_general;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_beb7b12;

/*
	Name: __init__sytem__
	Namespace: namespace_beb7b12
	Checksum: 0x9C714465
	Offset: 0x630
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 32
*/
function autoexec __init__sytem__()
{
	system::register("zm_craft_zombie_shield", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_beb7b12
	Checksum: 0x23912306
	Offset: 0x678
	Size: 0x3D0
	Parameters: 0
	Flags: None
	Line Number: 47
*/
function __init__()
{
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	level.var_ca72b110 = GetWeapon("spx_zombie_shield");
	zm_equipment::register("spx_zombie_shield", &"CRAFTABLES_ZOMBIE_SHIELD_HINT", &"CRAFTABLES_ZOMBIE_SHIELD_HOWTO", undefined, "riotshield");
	level.var_660b8ef8 = GetWeapon("spx_zombie_shield_upgraded");
	zm_equipment::register("spx_zombie_shield_upgraded", &"CRAFTABLES_ZOMBIE_SHIELD_HINT", &"CRAFTABLES_ZOMBIE_SHIELD_HOWTO", undefined, "riotshield");
	var_e8a995af = zm_craftables::generate_zombie_craftable_piece("craft_zombie_shield_zm", "part_0", 32, 64, 0, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "t6_wpn_zmb_shield_dolly", 1, "build_zs");
	var_c2a71b46 = zm_craftables::generate_zombie_craftable_piece("craft_zombie_shield_zm", "part_1", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "t6_wpn_zmb_shield_door", 1, "build_zs");
	RegisterClientField("world", "t6_wpn_zmb_shield_dolly", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "t6_wpn_zmb_shield_door", 1, 1, "int", undefined, 0);
	clientfield::register("clientuimodel", "zmInventory.widget_power_parts", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.player_crafted_power", 1, 1, "int");
	var_84603809 = spawnstruct();
	var_84603809.name = "craft_zombie_shield_zm";
	var_84603809.weaponName = "spx_zombie_shield";
	var_84603809 zm_craftables::add_craftable_piece(var_e8a995af);
	var_84603809 zm_craftables::add_craftable_piece(var_c2a71b46);
	var_84603809.onBuyWeapon = &function_86796dad;
	var_84603809.triggerThink = &function_e0e64e26;
	zm_craftables::include_zombie_craftable(var_84603809);
	zm_craftables::add_zombie_craftable("craft_zombie_shield_zm", "Hold ^3&&1^7 to craft the Zombie Shield", "ERROR", "Taken Zombie Shield!", &on_fully_crafted, 1);
	zm_craftables::add_zombie_craftable_vox_category("craft_zombie_shield_zm", "build_zs");
	thread function_a0a2753c();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: on_player_connect
	Namespace: namespace_beb7b12
	Checksum: 0x6D179BAD
	Offset: 0xA50
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 86
*/
function on_player_connect()
{
	self thread function_8c12d292();
}

/*
	Name: function_8c12d292
	Namespace: namespace_beb7b12
	Checksum: 0xF65A93D3
	Offset: 0xA78
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 101
*/
function function_8c12d292()
{
	self endon("disconnect");
	while(isdefined(self))
	{
		self waittill("weapon_change", newWeapon);
		if(newWeapon == GetWeapon("spx_zombie_shield") || newWeapon == GetWeapon("spx_zombie_shield_upgraded"))
		{
			break;
		}
	}
	zm_equipment::show_hint_text(&"CRAFTABLES_ZOMBIE_SHIELD_HINT", 5);
}

/*
	Name: on_player_spawned
	Namespace: namespace_beb7b12
	Checksum: 0xC447F682
	Offset: 0xB18
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 125
*/
function on_player_spawned()
{
	self thread function_86ea997();
}

/*
	Name: __main__
	Namespace: namespace_beb7b12
	Checksum: 0x8A2496CF
	Offset: 0xB40
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 140
*/
function __main__()
{
	zm_equipment::register_for_level("spx_zombie_shield");
	zm_equipment::Include("spx_zombie_shield");
	zm_equipment::register_for_level("spx_zombie_shield_upgraded");
	zm_equipment::Include("spx_zombie_shield_upgraded");
	zombie_utility::set_zombie_var("riotshield_fling_damage_shield", 100);
	zombie_utility::set_zombie_var("riotshield_knockdown_damage_shield", 15);
	zombie_utility::set_zombie_var("riotshield_juke_damage_shield", 0);
	zombie_utility::set_zombie_var("riotshield_fling_force_juke", 175);
	zombie_utility::set_zombie_var("riotshield_fling_range", 120);
	zombie_utility::set_zombie_var("riotshield_gib_range", 120);
	zombie_utility::set_zombie_var("riotshield_knockdown_range", 120);
	return;
}

/*
	Name: function_e0e64e26
	Namespace: namespace_beb7b12
	Checksum: 0xED408632
	Offset: 0xC88
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 166
*/
function function_e0e64e26()
{
	zm_craftables::craftable_trigger_think("craft_zombie_shield_zm" + "_craftable_trigger", "craft_zombie_shield_zm", "spx_zombie_shield", "Hold ^3&&1^7 to take the Zombie Shield", 1, 1);
}

/*
	Name: on_pickup_common
	Namespace: namespace_beb7b12
	Checksum: 0xF1CFC794
	Offset: 0xCE0
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 181
*/
function on_pickup_common(player)
{
	player playsound("zmb_craftable_pickup");
	self pickup_from_mover();
	self.piece_owner = player;
}

/*
	Name: on_drop_common
	Namespace: namespace_beb7b12
	Checksum: 0xBFDC2459
	Offset: 0xD38
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 198
*/
function on_drop_common(player)
{
	self drop_on_mover(player);
	self.piece_owner = undefined;
}

/*
	Name: pickup_from_mover
	Namespace: namespace_beb7b12
	Checksum: 0x9ACF73B8
	Offset: 0xD70
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 214
*/
function pickup_from_mover()
{
}

/*
	Name: on_fully_crafted
	Namespace: namespace_beb7b12
	Checksum: 0xEF96150B
	Offset: 0xD80
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 228
*/
function on_fully_crafted()
{
	players = level.players;
	level notify("hash_e10018bd");
	foreach(e_player in players)
	{
	}
	return 1;
}

/*
	Name: function_a0a2753c
	Namespace: namespace_beb7b12
	Checksum: 0x7D54558D
	Offset: 0xE38
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 248
*/
function function_a0a2753c()
{
	level waittill("hash_e10018bd");
	namespace_f56b53f0::function_dbe7e78b("Zombie Shield Crafted");
	loc = struct::get("shield_struct_cuntcuntcunt", "script_noteworthy");
	mdl = util::spawn_model("t6_wpn_zmb_shield_world", loc.origin, loc.angles);
	if(!isdefined(loc))
	{
		namespace_f56b53f0::function_dbe7e78b("^1Struct Undefined");
	}
	if(!isdefined(mdl))
	{
		namespace_f56b53f0::function_dbe7e78b("^1Model Undefined");
	}
}

/*
	Name: drop_on_mover
	Namespace: namespace_beb7b12
	Checksum: 0xC22FCCD4
	Offset: 0xF20
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 274
*/
function drop_on_mover(player)
{
	if(isdefined(level.var_fff0714e))
	{
		[[level.var_fff0714e]]();
	}
}

/*
	Name: function_86796dad
	Namespace: namespace_beb7b12
	Checksum: 0x1E83247A
	Offset: 0xF50
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 292
*/
function function_86796dad(player)
{
	player playsoundtoplayer("zmb_craftable_buy_shield", player);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_86ea997
	Namespace: namespace_beb7b12
	Checksum: 0x953FCF3
	Offset: 0xF88
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 309
*/
function function_86ea997()
{
	str_wpn_name = level.var_ca72b110.name;
	str_notify = str_wpn_name + "_pickup_from_table";
	for(;;)
	{
		self waittill(str_notify);
		if(isdefined(self.var_1fb415a2) && self.var_1fb415a2)
		{
			self zm_equipment::buy("spx_zombie_shield_upgraded");
		}
	}
}

