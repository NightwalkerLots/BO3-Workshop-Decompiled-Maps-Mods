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
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_gravityspikes;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_ccb89763;

/*
	Name: __init__sytem__
	Namespace: namespace_ccb89763
	Checksum: 0x5C191531
	Offset: 0x5B0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 32
*/
function autoexec __init__sytem__()
{
	system::register("zm_craft_gravityspikes", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_ccb89763
	Checksum: 0x2213AFD0
	Offset: 0x5F8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 47
*/
function __init__()
{
	init();
}

/*
	Name: init
	Namespace: namespace_ccb89763
	Checksum: 0x5A5E98A7
	Offset: 0x618
	Size: 0x450
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function init()
{
	var_2f18d6d0 = zm_craftables::generate_zombie_craftable_piece("craft_gravityspikes_zm", "body", 32, 64, 0, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "gravityspike_part_body", 1, "build_zs");
	var_3b105a = zm_craftables::generate_zombie_craftable_piece("craft_gravityspikes_zm", "guards", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "gravityspike_part_guards", 1, "build_zs");
	var_2e6bf9ce = zm_craftables::generate_zombie_craftable_piece("craft_gravityspikes_zm", "handle", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "gravityspike_part_handle", 1, "build_zs");
	RegisterClientField("world", "gravityspike_part_body", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "gravityspike_part_guards", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "gravityspike_part_handle", 1, 1, "int", undefined, 0);
	var_ac285e90 = spawnstruct();
	var_ac285e90.name = "craft_gravityspikes_zm";
	var_ac285e90.weaponName = "hero_gravityspikes_melee";
	var_ac285e90 zm_craftables::add_craftable_piece(var_2f18d6d0);
	var_ac285e90 zm_craftables::add_craftable_piece(var_3b105a);
	var_ac285e90 zm_craftables::add_craftable_piece(var_2e6bf9ce);
	var_ac285e90.triggerThink = &function_8404119b;
	zm_craftables::include_zombie_craftable(var_ac285e90);
	zm_craftables::add_zombie_craftable("craft_gravityspikes_zm", "Hold ^3&&1^7 to craft the Ragnarok DG-4", "ERROR", "You already have Ragnarok DG-4", &on_fully_crafted, 1);
	zm_craftables::add_zombie_craftable_vox_category("craft_gravityspikes_zm", "build_zs");
	zm_craftables::make_zombie_craftable_open("craft_gravityspikes_zm", "spx_gravityspikes_world_model", VectorScale((0, 1, 0), 90), VectorScale((0, 0, 1), 18));
	clientfield::register("clientuimodel", "zmInventory.widget_gravityspike_parts", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.player_crafted_gravityspikes", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.gravityspike_part_body", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.gravityspike_part_guards", 1, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.gravityspike_part_handle", 1, 1, "int");
}

/*
	Name: __main__
	Namespace: namespace_ccb89763
	Checksum: 0x9ACF73B8
	Offset: 0xA70
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 98
*/
function __main__()
{
}

/*
	Name: function_8404119b
	Namespace: namespace_ccb89763
	Checksum: 0xB5199DFC
	Offset: 0xA80
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 112
*/
function function_8404119b()
{
	craftable_wait_your_turn();
	zm_craftables::craftable_trigger_think("craft_gravityspikes_zm" + "_craftable_trigger", "craft_gravityspikes_zm", "hero_gravityspikes_melee", "Hold ^3&&1^7 to take the Ragnarok DG-4", 1, 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: show_infotext_for_duration
	Namespace: namespace_ccb89763
	Checksum: 0x6D646DE3
	Offset: 0xAE0
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 130
*/
function show_infotext_for_duration(str_infotext, n_duration)
{
	self clientfield::set_to_player(str_infotext, 1);
	wait(n_duration);
	self clientfield::set_to_player(str_infotext, 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: on_pickup_common
	Namespace: namespace_ccb89763
	Checksum: 0x18786C0
	Offset: 0xB40
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 149
*/
function on_pickup_common(player)
{
	player playsound("zmb_craftable_pickup");
	if(isdefined(level.craft_shield_piece_pickup_vo_override))
	{
		player thread [[level.craft_shield_piece_pickup_vo_override]]();
	}
	foreach(e_player in level.players)
	{
		e_player thread zm_craftables::player_show_craftable_parts_ui("zmInventory.player_crafted_gravityspikes", "zmInventory.widget_gravityspike_parts", 0);
	}
	self pickup_from_mover();
	self.piece_owner = player;
}

/*
	Name: on_drop_common
	Namespace: namespace_ccb89763
	Checksum: 0xB2FC3B8F
	Offset: 0xC48
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 174
*/
function on_drop_common(player)
{
	self drop_on_mover(player);
	self.piece_owner = undefined;
}

/*
	Name: pickup_from_mover
	Namespace: namespace_ccb89763
	Checksum: 0x9ACF73B8
	Offset: 0xC80
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 190
*/
function pickup_from_mover()
{
}

/*
	Name: on_fully_crafted
	Namespace: namespace_ccb89763
	Checksum: 0x7BBE37A1
	Offset: 0xC90
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 204
*/
function on_fully_crafted()
{
	players = level.players;
	foreach(e_player in players)
	{
		if(zm_utility::is_player_valid(e_player))
		{
			e_player thread zm_craftables::player_show_craftable_parts_ui("zmInventory.player_crafted_gravityspikes", "zmInventory.widget_gravityspike_parts", 1);
		}
	}
	self function_7c88ce29(self.origin, self.angles);
	return 1;
}

/*
	Name: drop_on_mover
	Namespace: namespace_ccb89763
	Checksum: 0x84A0635C
	Offset: 0xD80
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 228
*/
function drop_on_mover(player)
{
	if(isdefined(level.var_6f091154))
	{
		[[level.var_6f091154]]();
	}
}

/*
	Name: function_7c88ce29
	Namespace: namespace_ccb89763
	Checksum: 0x13DF362C
	Offset: 0xDB0
	Size: 0x1D8
	Parameters: 2
	Flags: None
	Line Number: 246
*/
function function_7c88ce29(v_origin, v_angles)
{
	width = 128;
	height = 128;
	length = 128;
	unitrigger_stub = spawnstruct();
	unitrigger_stub.origin = v_origin;
	unitrigger_stub.angles = v_angles;
	unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	unitrigger_stub.cursor_hint = "HINT_NOICON";
	unitrigger_stub.script_width = width;
	unitrigger_stub.script_height = height;
	unitrigger_stub.script_length = length;
	unitrigger_stub.require_look_at = 1;
	s_align = struct::get(self.target, "targetname");
	unitrigger_stub.var_20a59b6 = util::spawn_model("spx_gravityspikes_world_model", s_align.origin + VectorScale((0, 0, 1), 18), s_align.angles + VectorScale((0, 1, 0), 90));
	unitrigger_stub.prompt_and_visibility_func = &prompt_and_visibility_func;
	zm_unitrigger::register_static_unitrigger(unitrigger_stub, &function_543cab10);
}

/*
	Name: prompt_and_visibility_func
	Namespace: namespace_ccb89763
	Checksum: 0xEA496232
	Offset: 0xF90
	Size: 0x90
	Parameters: 1
	Flags: Private
	Line Number: 276
*/
function private prompt_and_visibility_func(player)
{
	wpn_gravityspikes = GetWeapon("hero_gravityspikes_melee");
	if(player.gravityspikes_state == 0)
	{
		self setHintString("Hold ^3&&1^7 to take the Ragnarok DG-4");
		return 1;
		continue;
	}
	self setHintString("You already have the Ragnarok DG-4");
	return 0;
}

/*
	Name: function_543cab10
	Namespace: namespace_ccb89763
	Checksum: 0x2DBB5076
	Offset: 0x1028
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 299
*/
function function_543cab10()
{
	while(1)
	{
		self waittill("trigger", player);
		if(player zm_utility::in_revive_trigger())
		{
			continue;
		}
		if(player.IS_DRINKING > 0)
		{
			continue;
		}
		if(!zm_utility::is_player_valid(player))
		{
			continue;
		}
		level thread function_d596778c(self.stub, player);
		break;
	}
}

/*
	Name: function_d596778c
	Namespace: namespace_ccb89763
	Checksum: 0x3A33BD7A
	Offset: 0x10D8
	Size: 0x158
	Parameters: 2
	Flags: None
	Line Number: 331
*/
function function_d596778c(trig_stub, player)
{
	initial_current_weapon = player GetCurrentWeapon();
	current_weapon = zm_weapons::get_nonalternate_weapon(initial_current_weapon);
	if(!current_weapon.isHeroWeapon || !current_weapon.isgadget)
	{
		wpn_gravityspikes = GetWeapon("hero_gravityspikes_melee");
		player zm_weapons::weapon_give(wpn_gravityspikes, 0, 1);
		player thread zm_equipment::show_hint_text(&"ZM_CASTLE_GRAVITYSPIKE_USE_HINT", 3);
		player GadgetPowerSet(player GadgetGetSlot(wpn_gravityspikes), 100);
		player zm_weap_gravityspikes::update_gravityspikes_state(2);
		player playsoundtoplayer("zmb_craftable_buy_shield", player);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: init_craftable_choke
	Namespace: namespace_ccb89763
	Checksum: 0x196B23C4
	Offset: 0x1238
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 358
*/
function init_craftable_choke()
{
	level.craftables_spawned_this_frame = 0;
	while(1)
	{
		util::wait_network_frame();
		level.craftables_spawned_this_frame = 0;
	}
}

/*
	Name: craftable_wait_your_turn
	Namespace: namespace_ccb89763
	Checksum: 0x58AF941A
	Offset: 0x1280
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 378
*/
function craftable_wait_your_turn()
{
	if(!isdefined(level.craftables_spawned_this_frame))
	{
		level thread init_craftable_choke();
	}
	while(level.craftables_spawned_this_frame >= 2)
	{
		util::wait_network_frame();
	}
	level.craftables_spawned_this_frame++;
}

