#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_hb21_zm_weap_staff_utility;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_powerup_shield_charge;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_11be1214;

/*
	Name: __init__sytem__
	Namespace: namespace_11be1214
	Checksum: 0xEE39BB9B
	Offset: 0x9F8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 33
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_craft_staff", &__init__, &__main__, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_11be1214
	Checksum: 0xB41A4DAE
	Offset: 0xA40
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function __init__()
{
	init();
}

/*
	Name: init
	Namespace: namespace_11be1214
	Checksum: 0x255701FB
	Offset: 0xA60
	Size: 0x12E8
	Parameters: 0
	Flags: None
	Line Number: 65
*/
function init()
{
	var_12ddd3e1 = zm_craftables::generate_zombie_craftable_piece("craft_staff_fire", "crystal", 32, 64, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_crystal_fire_world", 1, "build_zs");
	var_3faac018 = zm_craftables::generate_zombie_craftable_piece("craft_staff_fire", "tip", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_tip_fire_world", 1, "build_zs");
	var_bbe7ebf2 = zm_craftables::generate_zombie_craftable_piece("craft_staff_fire", "stem", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_fire_parts_stem", 1, "build_zs");
	var_d470ddd2 = zm_craftables::generate_zombie_craftable_piece("craft_staff_fire", "revive", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_fire_parts_revive", 1, "build_zs");
	if(isdefined(0) && 0)
	{
		var_12ddd3e1.special_spawn_func = &function_1868ee79;
	}
	if(isdefined(0) && 0)
	{
		var_3faac018.special_spawn_func = &function_9f2edb18;
	}
	if(isdefined(0) && 0)
	{
		var_bbe7ebf2.special_spawn_func = &function_7ce6a45a;
	}
	if(isdefined(0) && 0)
	{
		var_d470ddd2.special_spawn_func = &function_f98c2e7a;
	}
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_crystal_fire_world", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_tip_fire_world", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_fire_parts_stem", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_fire_parts_revive", 1, 1, "int", undefined, 0);
	var_68ccc5ce = spawnstruct();
	var_68ccc5ce.name = "craft_staff_fire";
	var_68ccc5ce.weaponName = "t7_staff_fire";
	var_68ccc5ce zm_craftables::add_craftable_piece(var_12ddd3e1);
	var_68ccc5ce zm_craftables::add_craftable_piece(var_3faac018);
	var_68ccc5ce zm_craftables::add_craftable_piece(var_bbe7ebf2);
	var_68ccc5ce zm_craftables::add_craftable_piece(var_d470ddd2);
	var_68ccc5ce.onBuyWeapon = &function_7a24efaf;
	var_68ccc5ce.triggerThink = &function_a96b7515;
	zm_craftables::include_zombie_craftable(var_68ccc5ce);
	zm_craftables::add_zombie_craftable("craft_staff_fire", "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_fire").displayName, "ERROR", &"ZOMBIE_BOUGHT_RIOT", &function_25c46639, 1);
	zm_craftables::add_zombie_craftable_vox_category("craft_staff_fire", "build_zs");
	var_899b10f6 = zm_craftables::generate_zombie_craftable_piece("craft_staff_water", "crystal", 32, 64, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_crystal_water_world", 1, "build_zs");
	var_99848c47 = zm_craftables::generate_zombie_craftable_piece("craft_staff_water", "tip", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_tip_water_world", 1, "build_zs");
	var_58797a53 = zm_craftables::generate_zombie_craftable_piece("craft_staff_water", "stem", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_water_parts_stem", 1, "build_zs");
	var_6d119413 = zm_craftables::generate_zombie_craftable_piece("craft_staff_water", "revive", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_water_parts_revive", 1, "build_zs");
	if(isdefined(0) && 0)
	{
		var_899b10f6.special_spawn_func = &function_fc030416;
	}
	if(isdefined(0) && 0)
	{
		var_99848c47.special_spawn_func = &function_b67ff5bf;
	}
	if(isdefined(0) && 0)
	{
		var_58797a53.special_spawn_func = &function_8f15793;
	}
	if(isdefined(0) && 0)
	{
		var_6d119413.special_spawn_func = &function_29950c53;
	}
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_crystal_water_world", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_tip_water_world", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_water_parts_stem", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_water_parts_revive", 1, 1, "int", undefined, 0);
	var_a87e5bbd = spawnstruct();
	var_a87e5bbd.name = "craft_staff_water";
	var_a87e5bbd.weaponName = "t7_staff_water";
	var_a87e5bbd zm_craftables::add_craftable_piece(var_899b10f6);
	var_a87e5bbd zm_craftables::add_craftable_piece(var_99848c47);
	var_a87e5bbd zm_craftables::add_craftable_piece(var_58797a53);
	var_a87e5bbd zm_craftables::add_craftable_piece(var_6d119413);
	var_a87e5bbd.onBuyWeapon = &function_7a24efaf;
	var_a87e5bbd.triggerThink = &function_124d65d2;
	zm_craftables::include_zombie_craftable(var_a87e5bbd);
	zm_craftables::add_zombie_craftable("craft_staff_water", "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_water").displayName, "ERROR", &"ZOMBIE_BOUGHT_RIOT", &function_59bd1dbe, 1);
	zm_craftables::add_zombie_craftable_vox_category("craft_staff_water", "build_zs");
	var_93df9d9b = zm_craftables::generate_zombie_craftable_piece("craft_staff_air", "crystal", 32, 64, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_crystal_air_world", 1, "build_zs");
	var_55799b6e = zm_craftables::generate_zombie_craftable_piece("craft_staff_air", "tip", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_tip_air_world", 1, "build_zs");
	var_ac57d158 = zm_craftables::generate_zombie_craftable_piece("craft_staff_air", "stem", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_air_parts_stem", 1, "build_zs");
	var_ba0dfd40 = zm_craftables::generate_zombie_craftable_piece("craft_staff_air", "revive", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_air_revive_view", 1, "build_zs");
	if(isdefined(0) && 0)
	{
		var_93df9d9b.special_spawn_func = &function_2b602e9b;
	}
	if(isdefined(0) && 0)
	{
		var_55799b6e.special_spawn_func = &function_4414c2e;
	}
	if(isdefined(0) && 0)
	{
		var_ac57d158.special_spawn_func = &function_b957ab58;
	}
	if(isdefined(0) && 0)
	{
		var_ba0dfd40.special_spawn_func = &function_1ece78c0;
	}
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_crystal_air_world", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_tip_air_world", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_air_parts_stem", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_air_revive_view", 1, 1, "int", undefined, 0);
	var_6732fe58 = spawnstruct();
	var_6732fe58.name = "craft_staff_air";
	var_6732fe58.weaponName = "t7_staff_air";
	var_6732fe58 zm_craftables::add_craftable_piece(var_93df9d9b);
	var_6732fe58 zm_craftables::add_craftable_piece(var_55799b6e);
	var_6732fe58 zm_craftables::add_craftable_piece(var_ac57d158);
	var_6732fe58 zm_craftables::add_craftable_piece(var_ba0dfd40);
	var_6732fe58.onBuyWeapon = &function_7a24efaf;
	var_6732fe58.triggerThink = &function_e938a83;
	zm_craftables::include_zombie_craftable(var_6732fe58);
	zm_craftables::add_zombie_craftable("craft_staff_air", "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_air").displayName, "ERROR", &"ZOMBIE_BOUGHT_RIOT", &function_931ff0bf, 1);
	zm_craftables::add_zombie_craftable_vox_category("craft_staff_air", "build_zs");
	var_4b85455c = zm_craftables::generate_zombie_craftable_piece("craft_staff_bolt", "crystal", 32, 64, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_crystal_lightning_world", 1, "build_zs");
	var_c6c57c31 = zm_craftables::generate_zombie_craftable_piece("craft_staff_bolt", "tip", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_tip_lightning_world", 1, "build_zs");
	var_17259a3d = zm_craftables::generate_zombie_craftable_piece("craft_staff_bolt", "stem", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_lightning_parts_stem", 1, "build_zs");
	var_6375bd25 = zm_craftables::generate_zombie_craftable_piece("craft_staff_bolt", "revive", 48, 15, 25, undefined, &on_pickup_common, &on_drop_common, undefined, undefined, undefined, undefined, "wpn_t7_zmb_hd_staff_lightning_parts_revive", 1, "build_zs");
	if(isdefined(0) && 0)
	{
		var_4b85455c.special_spawn_func = &function_7aa94644;
	}
	if(isdefined(0) && 0)
	{
		var_c6c57c31.special_spawn_func = &function_769c6349;
	}
	if(isdefined(0) && 0)
	{
		var_17259a3d.special_spawn_func = &function_d4ac416d;
	}
	if(isdefined(0) && 0)
	{
		var_6375bd25.special_spawn_func = &function_5dd81a75;
	}
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_crystal_lightning_world", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_tip_lightning_world", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_lightning_parts_stem", 1, 1, "int", undefined, 0);
	RegisterClientField("world", "wpn_t7_zmb_hd_staff_lightning_parts_revive", 1, 1, "int", undefined, 0);
	var_dd4ebdb3 = spawnstruct();
	var_dd4ebdb3.name = "craft_staff_bolt";
	var_dd4ebdb3.weaponName = "t7_staff_bolt";
	var_dd4ebdb3 zm_craftables::add_craftable_piece(var_4b85455c);
	var_dd4ebdb3 zm_craftables::add_craftable_piece(var_c6c57c31);
	var_dd4ebdb3 zm_craftables::add_craftable_piece(var_17259a3d);
	var_dd4ebdb3 zm_craftables::add_craftable_piece(var_6375bd25);
	var_dd4ebdb3.onBuyWeapon = &function_7a24efaf;
	var_dd4ebdb3.triggerThink = &function_8c7c42e4;
	zm_craftables::include_zombie_craftable(var_dd4ebdb3);
	zm_craftables::add_zombie_craftable("craft_staff_bolt", "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_bolt").displayName, "ERROR", &"ZOMBIE_BOUGHT_RIOT", &function_92930ce2, 1);
	zm_craftables::add_zombie_craftable_vox_category("craft_staff_bolt", "build_zs");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __main__
	Namespace: namespace_11be1214
	Checksum: 0x9ACF73B8
	Offset: 0x1D50
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function __main__()
{
}

/*
	Name: show_infotext_for_duration
	Namespace: namespace_11be1214
	Checksum: 0xA6830A54
	Offset: 0x1D60
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 239
*/
function show_infotext_for_duration(str_infotext, n_duration)
{
}

/*
	Name: on_pickup_common
	Namespace: namespace_11be1214
	Checksum: 0xE53F9AB4
	Offset: 0x1D80
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 253
*/
function on_pickup_common(player)
{
	player playsound("zmb_craftable_pickup");
	if(isdefined(level.craft_shield_piece_pickup_vo_override))
	{
		player thread [[level.craft_shield_piece_pickup_vo_override]]();
	}
	self pickup_from_mover();
	self.piece_owner = player;
}

/*
	Name: on_drop_common
	Namespace: namespace_11be1214
	Checksum: 0x723A50C7
	Offset: 0x1DF8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 274
*/
function on_drop_common(player)
{
	self drop_on_mover(player);
	self.piece_owner = undefined;
}

/*
	Name: pickup_from_mover
	Namespace: namespace_11be1214
	Checksum: 0x2958068D
	Offset: 0x1E30
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 290
*/
function pickup_from_mover()
{
	if(isdefined(level.craft_shield_pickup_override))
	{
		[[level.craft_shield_pickup_override]]();
	}
}

/*
	Name: drop_on_mover
	Namespace: namespace_11be1214
	Checksum: 0x7092E182
	Offset: 0x1E58
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 308
*/
function drop_on_mover(player)
{
	if(isdefined(level.craft_shield_drop_override))
	{
		[[level.craft_shield_drop_override]]();
	}
}

/*
	Name: function_7a24efaf
	Namespace: namespace_11be1214
	Checksum: 0x4782E792
	Offset: 0x1E88
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 326
*/
function function_7a24efaf(player)
{
}

/*
	Name: function_f862b7df
	Namespace: namespace_11be1214
	Checksum: 0xEAD0D77D
	Offset: 0x1EA0
	Size: 0x128
	Parameters: 3
	Flags: None
	Line Number: 340
*/
function function_f862b7df(pieceStub, notify_string, FX)
{
	level waittill(notify_string, origin);
	self zm_craftables::piece_spawn_in(pieceStub);
	IPrintLnBold("^2SPAWN A STAFF PART + " + notify_string);
	self.model.origin = origin;
	PlayFXOnTag(FX, self.model, "tag_origin");
	self.model moveto(self.model.origin + VectorScale((0, 0, 1), 40), 1);
	wait(1);
	self.unitrigger.origin = self.model.origin;
	self.model thread function_a171af4b();
}

/*
	Name: function_a171af4b
	Namespace: namespace_11be1214
	Checksum: 0x7DFEF392
	Offset: 0x1FD0
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 363
*/
function function_a171af4b()
{
	self endon("hash_4f74e5f5");
	self endon("hash_b7b9d99d");
	self endon("delete");
	while(isdefined(self))
	{
		wait_time = RandomFloatRange(2.5, 5);
		yaw = RandomInt(360);
		if(yaw > 300)
		{
			yaw = 300;
		}
		else if(yaw < 60)
		{
			yaw = 60;
		}
		yaw = self.angles[1] + yaw;
		new_angles = (-60 + RandomInt(120), yaw, -45 + RandomInt(90));
		self RotateTo(new_angles, wait_time, wait_time * 0.5, wait_time * 0.5);
		wait(RandomFloat(wait_time - 0.1));
	}
}

/*
	Name: function_a96b7515
	Namespace: namespace_11be1214
	Checksum: 0x7EE0B034
	Offset: 0x2140
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 397
*/
function function_a96b7515()
{
	zm_craftables::craftable_trigger_think("craft_staff_fire_craftable_trigger", "craft_staff_fire", "t7_staff_fire", "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_fire").displayName, 1, 0);
}

/*
	Name: function_25c46639
	Namespace: namespace_11be1214
	Checksum: 0x7D64B02F
	Offset: 0x21A8
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 412
*/
function function_25c46639()
{
	var_d6d22dae = GetEnt("craft_staff_fire_craftable_trigger", "targetname");
	var_7f35ffb5 = GetEnt(var_d6d22dae.target, "targetname");
	level thread namespace_951345fe::function_acc69ce9("t7_staff_fire", "t7_staff_fire_upgraded", "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_fire").displayName, "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_fire_upgraded").displayName, var_d6d22dae, var_7f35ffb5, "fire");
	return 1;
}

/*
	Name: function_9f2edb18
	Namespace: namespace_11be1214
	Checksum: 0xE89E6EE3
	Offset: 0x2298
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 430
*/
function function_9f2edb18(pieceStub)
{
	self thread function_f862b7df(pieceStub, "box_destroyed_staff_fire_tip", "harry/staff/fire/fx_staff_fire_piece_glow");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7ce6a45a
	Namespace: namespace_11be1214
	Checksum: 0x4108BB1B
	Offset: 0x22D8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 447
*/
function function_7ce6a45a(pieceStub)
{
	self thread function_f862b7df(pieceStub, "boss_zombie_died_fire", "harry/staff/fire/fx_staff_fire_piece_glow");
}

/*
	Name: function_f98c2e7a
	Namespace: namespace_11be1214
	Checksum: 0xD2233902
	Offset: 0x2318
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 462
*/
function function_f98c2e7a(pieceStub)
{
	self thread function_f862b7df(pieceStub, "soul_chest_complete_fire", "harry/staff/fire/fx_staff_fire_piece_glow");
}

/*
	Name: function_1868ee79
	Namespace: namespace_11be1214
	Checksum: 0x9858E417
	Offset: 0x2358
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 477
*/
function function_1868ee79(pieceStub)
{
	self thread function_f862b7df(pieceStub, "dug_staff_from_spot_fire", "harry/staff/fire/fx_staff_fire_piece_glow");
}

/*
	Name: function_124d65d2
	Namespace: namespace_11be1214
	Checksum: 0xE2666978
	Offset: 0x2398
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 492
*/
function function_124d65d2()
{
	zm_craftables::craftable_trigger_think("craft_staff_water_craftable_trigger", "craft_staff_water", "t7_staff_water", "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_water").displayName, 1, 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_59bd1dbe
	Namespace: namespace_11be1214
	Checksum: 0xC9279EA9
	Offset: 0x2400
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 509
*/
function function_59bd1dbe()
{
	var_d6d22dae = GetEnt("craft_staff_water_craftable_trigger", "targetname");
	var_7f35ffb5 = GetEnt(var_d6d22dae.target, "targetname");
	level thread namespace_951345fe::function_acc69ce9("t7_staff_water", "t7_staff_water_upgraded", "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_water").displayName, "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_water_upgraded").displayName, var_d6d22dae, var_7f35ffb5, "ice");
	return 1;
}

/*
	Name: function_b67ff5bf
	Namespace: namespace_11be1214
	Checksum: 0x613B7EAC
	Offset: 0x24F0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 527
*/
function function_b67ff5bf(pieceStub)
{
	self thread function_f862b7df(pieceStub, "box_destroyed_staff_water_tip", "harry/staff/water/fx_staff_water_piece_glow");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8f15793
	Namespace: namespace_11be1214
	Checksum: 0xD71B370D
	Offset: 0x2530
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 544
*/
function function_8f15793(pieceStub)
{
	self thread function_f862b7df(pieceStub, "boss_zombie_died_water", "harry/staff/water/fx_staff_water_piece_glow");
}

/*
	Name: function_29950c53
	Namespace: namespace_11be1214
	Checksum: 0x63B81FDC
	Offset: 0x2570
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 559
*/
function function_29950c53(pieceStub)
{
	self thread function_f862b7df(pieceStub, "soul_chest_complete_water", "harry/staff/water/fx_staff_water_piece_glow");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fc030416
	Namespace: namespace_11be1214
	Checksum: 0xE8EA4791
	Offset: 0x25B0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 576
*/
function function_fc030416(pieceStub)
{
	self thread function_f862b7df(pieceStub, "dug_staff_from_spot_water", "harry/staff/water/fx_staff_water_piece_glow");
}

/*
	Name: function_e938a83
	Namespace: namespace_11be1214
	Checksum: 0x694166E3
	Offset: 0x25F0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 591
*/
function function_e938a83()
{
	zm_craftables::craftable_trigger_think("craft_staff_air_craftable_trigger", "craft_staff_air", "t7_staff_air", "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_air").displayName, 1, 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_931ff0bf
	Namespace: namespace_11be1214
	Checksum: 0xBBEFC15B
	Offset: 0x2658
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 608
*/
function function_931ff0bf()
{
	var_d6d22dae = GetEnt("craft_staff_air_craftable_trigger", "targetname");
	var_7f35ffb5 = GetEnt(var_d6d22dae.target, "targetname");
	level thread namespace_951345fe::function_acc69ce9("t7_staff_air", "t7_staff_air_upgraded", "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_air").displayName, "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_air_upgraded").displayName, var_d6d22dae, var_7f35ffb5, "wind");
	return 1;
}

/*
	Name: function_4414c2e
	Namespace: namespace_11be1214
	Checksum: 0xF3EF2899
	Offset: 0x2748
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 626
*/
function function_4414c2e(pieceStub)
{
	self thread function_f862b7df(pieceStub, "box_destroyed_staff_air_tip", "harry/staff/air/fx_staff_wind_piece_glow");
}

/*
	Name: function_b957ab58
	Namespace: namespace_11be1214
	Checksum: 0x21BE34D2
	Offset: 0x2788
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 641
*/
function function_b957ab58(pieceStub)
{
	self thread function_f862b7df(pieceStub, "boss_zombie_died_wind", "harry/staff/air/fx_staff_wind_piece_glow");
}

/*
	Name: function_1ece78c0
	Namespace: namespace_11be1214
	Checksum: 0x3AF9687D
	Offset: 0x27C8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 656
*/
function function_1ece78c0(pieceStub)
{
	self thread function_f862b7df(pieceStub, "soul_chest_complete_wind", "harry/staff/air/fx_staff_wind_piece_glow");
}

/*
	Name: function_2b602e9b
	Namespace: namespace_11be1214
	Checksum: 0x495D422F
	Offset: 0x2808
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 671
*/
function function_2b602e9b(pieceStub)
{
	self thread function_f862b7df(pieceStub, "dug_staff_from_spot_wind", "harry/staff/air/fx_staff_wind_piece_glow");
}

/*
	Name: function_8c7c42e4
	Namespace: namespace_11be1214
	Checksum: 0x3F6C1077
	Offset: 0x2848
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 686
*/
function function_8c7c42e4()
{
	zm_craftables::craftable_trigger_think("craft_staff_bolt_craftable_trigger", "craft_staff_bolt", "t7_staff_bolt", "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_bolt").displayName, 1, 0);
}

/*
	Name: function_92930ce2
	Namespace: namespace_11be1214
	Checksum: 0xB80EF5D1
	Offset: 0x28B0
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 701
*/
function function_92930ce2()
{
	var_d6d22dae = GetEnt("craft_staff_bolt_craftable_trigger", "targetname");
	var_7f35ffb5 = GetEnt(var_d6d22dae.target, "targetname");
	level thread namespace_951345fe::function_acc69ce9("t7_staff_bolt", "t7_staff_bolt_upgraded", "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_bolt").displayName, "Hold ^3&&1^7 to craft " + GetWeapon("t7_staff_bolt_upgraded").displayName, var_d6d22dae, var_7f35ffb5, "lightning");
	return 1;
}

/*
	Name: function_769c6349
	Namespace: namespace_11be1214
	Checksum: 0xB40D7786
	Offset: 0x29A0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 719
*/
function function_769c6349(pieceStub)
{
	self thread function_f862b7df(pieceStub, "box_destroyed_staff_bolt_tip", "harry/staff/bolt/fx_staff_bolt_piece_glow");
}

/*
	Name: function_d4ac416d
	Namespace: namespace_11be1214
	Checksum: 0x67113176
	Offset: 0x29E0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 734
*/
function function_d4ac416d(pieceStub)
{
	self thread function_f862b7df(pieceStub, "boss_zombie_died_bolt", "harry/staff/bolt/fx_staff_bolt_piece_glow");
}

/*
	Name: function_5dd81a75
	Namespace: namespace_11be1214
	Checksum: 0xEA80FD9D
	Offset: 0x2A20
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 749
*/
function function_5dd81a75(pieceStub)
{
	self thread function_f862b7df(pieceStub, "soul_chest_complete_bolt", "harry/staff/bolt/fx_staff_bolt_piece_glow");
}

/*
	Name: function_7aa94644
	Namespace: namespace_11be1214
	Checksum: 0xAC7BAEA7
	Offset: 0x2A60
	Size: 0x34
	Parameters: 1
	Flags: None
	Line Number: 764
*/
function function_7aa94644(pieceStub)
{
	self thread function_f862b7df(pieceStub, "dug_staff_from_spot_bolt", "harry/staff/bolt/fx_staff_bolt_piece_glow");
}

