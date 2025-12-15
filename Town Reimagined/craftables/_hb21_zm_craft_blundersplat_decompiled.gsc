#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_a272a90;

/*
	Name: __init__sytem__
	Namespace: namespace_a272a90
	Checksum: 0x88617C19
	Offset: 0x608
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 32
*/
function autoexec __init__sytem__()
{
	system::register("zm_craft_blundersplat", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_a272a90
	Checksum: 0xE9E18E37
	Offset: 0x650
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
	Namespace: namespace_a272a90
	Checksum: 0x1A84A744
	Offset: 0x670
	Size: 0x388
	Parameters: 0
	Flags: None
	Line Number: 62
*/
function init()
{
	var_e8a995af = zm_craftables::generate_zombie_craftable_piece("craft_blundersplat_zm", "part_0", 32, 64, 0, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "p6_zm_al_packasplat_engine", 1, "build_zs");
	var_c2a71b46 = zm_craftables::generate_zombie_craftable_piece("craft_blundersplat_zm", "part_1", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "p6_zm_al_packasplat_iv", 1, "build_zs");
	var_9ca4a0dd = zm_craftables::generate_zombie_craftable_piece("craft_blundersplat_zm", "part_2", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "p6_zm_al_packasplat_suitcase", 1, "build_zs");
	RegisterClientField("world", "p6_zm_al_packasplat_engine", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "p6_zm_al_packasplat_iv", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "p6_zm_al_packasplat_suitcase", 1, 1, "int", undefined, 0);
	var_aa06f40d = spawnstruct();
	var_aa06f40d.name = "craft_blundersplat_zm";
	var_aa06f40d.weaponName = "dragon_shield";
	var_aa06f40d.equipname = "dragon_shield";
	var_aa06f40d zm_craftables::add_craftable_piece(var_e8a995af);
	var_aa06f40d zm_craftables::add_craftable_piece(var_c2a71b46);
	var_aa06f40d zm_craftables::add_craftable_piece(var_9ca4a0dd);
	var_aa06f40d.onBuyWeapon = &function_17d4c21;
	var_aa06f40d.triggerThink = &function_6d5e2950;
	zm_craftables::include_zombie_craftable(var_aa06f40d);
	zm_craftables::add_zombie_craftable("craft_blundersplat_zm", "Hold ^3&&1^7 to craft Blundergat Upgrade", "ERROR", "Took NAME!!!!!!!!!!!!!!!!!!!!!!!", &on_fully_crafted, 1);
	zm_craftables::add_zombie_craftable_vox_category("craft_blundersplat_zm", "build_zs");
	zm_craftables::make_zombie_craftable_open("craft_blundersplat_zm", "p6_anim_zm_al_packasplat", VectorScale((0, -1, 0), 90), VectorScale((0, 0, -1), 3));
}

/*
	Name: __main__
	Namespace: namespace_a272a90
	Checksum: 0x9ACF73B8
	Offset: 0xA00
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 95
*/
function __main__()
{
}

/*
	Name: function_6d5e2950
	Namespace: namespace_a272a90
	Checksum: 0x87A208A1
	Offset: 0xA10
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 109
*/
function function_6d5e2950()
{
	zm_craftables::craftable_trigger_think("craft_blundersplat_zm" + "_craftable_trigger", "craft_blundersplat_zm", "dragon_shield", "Hold ^3&&1^7 to take NAME", 1, 0);
}

/*
	Name: on_pickup_common
	Namespace: namespace_a272a90
	Checksum: 0x89377412
	Offset: 0xA60
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 124
*/
function on_pickup_common(player)
{
	player playsound("zmb_craftable_pickup");
	self pickup_from_mover();
	self.piece_owner = player;
}

/*
	Name: on_drop_common
	Namespace: namespace_a272a90
	Checksum: 0x654370BA
	Offset: 0xAB8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 141
*/
function on_drop_common(player)
{
	self drop_on_mover(player);
	self.piece_owner = undefined;
	return;
	ERROR: Bad function call
}

/*
	Name: pickup_from_mover
	Namespace: namespace_a272a90
	Checksum: 0xEF871142
	Offset: 0xAF0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 159
*/
function pickup_from_mover()
{
	if(isdefined(level.var_4846098e))
	{
		[[level.var_4846098e]]();
	}
}

/*
	Name: on_fully_crafted
	Namespace: namespace_a272a90
	Checksum: 0x449843FD
	Offset: 0xB18
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 177
*/
function on_fully_crafted()
{
	var_7f35ffb5 = GetEnt(self.target, "targetname");
	level thread function_d3d57115(self, self.model);
	return 1;
}

/*
	Name: function_d3d57115
	Namespace: namespace_a272a90
	Checksum: 0x1D65F4
	Offset: 0xB70
	Size: 0x6F8
	Parameters: 2
	Flags: None
	Line Number: 194
*/
function function_d3d57115(var_d6d22dae, var_7f35ffb5)
{
	trigger = spawn("trigger_radius_use", var_d6d22dae.origin, 0, 40, 80);
	trigger.script_noteworthy = "harrybo21_acid_upgrade";
	trigger TriggerIgnoreTeam();
	trigger setvisibletoall();
	trigger SetTeamForTrigger("none");
	trigger UseTriggerRequireLookAt();
	trigger setcursorhint("HINT_NOICON");
	trigger.linked_model = var_7f35ffb5;
	trigger.linked_model useanimtree(-1);
	trigger.linked_model.animName = "blundersplat";
	trigger.linked_model show();
	FORWARD = AnglesToForward(trigger.linked_model.angles) * 3;
	right = AnglesToRight(trigger.linked_model.angles) * 22;
	up = anglesToUp(trigger.linked_model.angles) * 3;
	while(1)
	{
		trigger setHintString("Hold ^3&&1^7 to convert Blundergat into Acidgat");
		trigger waittill("trigger", player);
		weapon = player GetCurrentWeapon();
		if(player laststand::player_is_in_laststand() || (isdefined(player.intermission) && player.intermission))
		{
			continue;
		}
		if(weapon.name != "t6_shotgun_blundergat" && weapon.name != "t6_shotgun_blundergat_upgraded")
		{
			continue;
		}
		owner = player;
		player zm_weapons::weapon_take(weapon);
		upgrade = GetWeapon("t6_shotgun_acidgat");
		if(weapon.name == "t6_shotgun_blundergat_upgraded")
		{
			upgrade = GetWeapon("t6_shotgun_acidgat_upgraded");
		}
		model = zm_utility::spawn_weapon_model(weapon, undefined, trigger.linked_model.origin + FORWARD + right + up, trigger.linked_model.angles + (0, 90, -90), undefined);
		model UseWeaponHideTags(weapon);
		wait(0.5);
		trigger setHintString("");
		trigger.linked_model playsound("evt_blundersplat_upgrade");
		trigger.linked_model AnimScripted("fxanim_zom_al_packasplat_start_anim", trigger.linked_model.origin, trigger.linked_model.angles, "fxanim_zom_al_packasplat_start_anim");
		wait(getanimlength("fxanim_zom_al_packasplat_start_anim"));
		model delete();
		model = zm_utility::spawn_weapon_model(upgrade, undefined, trigger.linked_model.origin + FORWARD + right + up, trigger.linked_model.angles + (0, 90, -90), undefined);
		model UseWeaponHideTags(upgrade);
		trigger.linked_model AnimScripted("fxanim_zom_al_packasplat_idle_anim", trigger.linked_model.origin, trigger.linked_model.angles, "fxanim_zom_al_packasplat_idle_anim");
		wait(3.2);
		trigger.linked_model AnimScripted("fxanim_zom_al_packasplat_end_anim", trigger.linked_model.origin, trigger.linked_model.angles, "fxanim_zom_al_packasplat_end_anim");
		wait(getanimlength("fxanim_zom_al_packasplat_end_anim"));
		trigger setHintString("Hold ^3&&1^7 to take your converted weapon");
		while(1)
		{
			trigger waittill("trigger", player);
			if(player laststand::player_is_in_laststand() || (isdefined(player.intermission) && player.intermission) || player != owner)
			{
				continue;
			}
			model delete();
			player zm_weapons::weapon_give(upgrade, 0, 0, 1, 1);
			break;
		}
	}
}

/*
	Name: drop_on_mover
	Namespace: namespace_a272a90
	Checksum: 0xBE58057A
	Offset: 0x1270
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 269
*/
function drop_on_mover(player)
{
	if(isdefined(level.var_7429ce77))
	{
		[[level.var_7429ce77]]();
	}
}

/*
	Name: function_17d4c21
	Namespace: namespace_a272a90
	Checksum: 0xA7603481
	Offset: 0x12A0
	Size: 0x2C
	Parameters: 1
	Flags: None
	Line Number: 287
*/
function function_17d4c21(player)
{
	player playsound("zmb_craftable_buy_shield");
}

