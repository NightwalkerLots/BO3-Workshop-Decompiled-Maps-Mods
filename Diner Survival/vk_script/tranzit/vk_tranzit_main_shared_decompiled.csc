#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\sphynx\craftables\_zm_craft_zombie_shield;
#include scripts\zm\_load;
#include scripts\zm\_zm_pack_a_punch;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perk_deadshot;
#include scripts\zm\_zm_perk_doubletap2;
#include scripts\zm\_zm_perk_electric_cherry;
#include scripts\zm\_zm_perk_juggernaut;
#include scripts\zm\_zm_perk_quick_revive;
#include scripts\zm\_zm_perk_sleight_of_hand;
#include scripts\zm\_zm_perk_staminup;
#include scripts\zm\_zm_perk_widows_wine;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerup_double_points;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_powerup_free_perk;
#include scripts\zm\_zm_powerup_full_ammo;
#include scripts\zm\_zm_powerup_insta_kill;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_weapons;
#include scripts\zm\aats\_zm_aat_aethercollapse;
#include scripts\zm\zm_usermap;

#namespace namespace_b5b7402d;

/*
	Name: __init__
	Namespace: namespace_b5b7402d
	Checksum: 0x7BFB39D
	Offset: 0x9C8
	Size: 0x2D8
	Parameters: 0
	Flags: AutoExec
	Line Number: 42
*/
function autoexec __init__()
{
	level._effect["_vk_fx_zm_tra_mysterybox_aqua_active"] = "vk_fx/mysterybox/aqua/active";
	level._effect["_vk_fx_zm_tra_mysterybox_aqua_beam"] = "vk_fx/mysterybox/aqua/beam";
	level._effect["_vk_fx_zm_tra_mysterybox_blue_active"] = "vk_fx/mysterybox/blue/active";
	level._effect["_vk_fx_zm_tra_mysterybox_blue_beam"] = "vk_fx/mysterybox/blue/beam";
	level._effect["_vk_fx_zm_tra_mysterybox_brown_active"] = "vk_fx/mysterybox/brown/active";
	level._effect["_vk_fx_zm_tra_mysterybox_brown_beam"] = "vk_fx/mysterybox/brown/beam";
	level._effect["_vk_fx_zm_tra_mysterybox_green_active"] = "vk_fx/mysterybox/green/active";
	level._effect["_vk_fx_zm_tra_mysterybox_green_beam"] = "vk_fx/mysterybox/green/beam";
	level._effect["_vk_fx_zm_tra_mysterybox_purple_active"] = "vk_fx/mysterybox/purple/active";
	level._effect["_vk_fx_zm_tra_mysterybox_purple_beam"] = "vk_fx/mysterybox/purple/beam";
	level._effect["_vk_fx_zm_tra_mysterybox_red_active"] = "vk_fx/mysterybox/red/active";
	level._effect["_vk_fx_zm_tra_mysterybox_red_beam"] = "vk_fx/mysterybox/red/beam";
	level._effect["_vk_fx_zm_tra_mysterybox_white_active"] = "vk_fx/mysterybox/white/active";
	level._effect["_vk_fx_zm_tra_mysterybox_white_beam"] = "vk_fx/mysterybox/white/beam";
	level._effect["_vk_fx_zm_tra_mysterybox_yellow_active"] = "vk_fx/mysterybox/yellow/active";
	level._effect["_vk_fx_zm_tra_mysterybox_yellow_beam"] = "vk_fx/mysterybox/yellow/beam";
	clientfield::register("scriptmover", "_cfx_vk_tra_mysterybox_handling_static", 1, 4, "int", &function_a21bc91e, 0, 0);
	clientfield::register("scriptmover", "_cfx_vk_tra_mysterybox_handling_active", 1, 4, "int", &function_61228882, 0, 0);
	clientfield::register("toplayer", "set_world_fog", 1, 4, "int", &function_3e4d643b, 0, 0);
	callback::on_finalize_initialization(&on_finalize_initialization);
	callback::on_localclient_connect(&on_player_connect);
	return;
}

/*
	Name: function_a21bc91e
	Namespace: namespace_b5b7402d
	Checksum: 0x7DE5EE25
	Offset: 0xCA8
	Size: 0x230
	Parameters: 7
	Flags: None
	Line Number: 78
*/
function function_a21bc91e(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		deletefx(localClientNum, self.var_172fc4e, 1);
	}
	if(newVal == 2)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_aqua_beam"]);
	}
	if(newVal == 3)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_blue_beam"]);
	}
	if(newVal == 4)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_brown_beam"]);
	}
	if(newVal == 5)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_green_beam"]);
	}
	if(newVal == 6)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_purple_beam"]);
	}
	if(newVal == 7)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_red_beam"]);
	}
	if(newVal == 8)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_white_beam"]);
	}
	if(newVal == 9)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_yellow_beam"]);
	}
}

/*
	Name: function_61228882
	Namespace: namespace_b5b7402d
	Checksum: 0x98FE7B94
	Offset: 0xEE0
	Size: 0x230
	Parameters: 7
	Flags: None
	Line Number: 128
*/
function function_61228882(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		deletefx(localClientNum, self.var_172fc4e, 1);
	}
	if(newVal == 2)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_aqua_active"]);
	}
	if(newVal == 3)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_blue_active"]);
	}
	if(newVal == 4)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_brown_active"]);
	}
	if(newVal == 5)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_green_active"]);
	}
	if(newVal == 6)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_purple_active"]);
	}
	if(newVal == 7)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_red_active"]);
	}
	if(newVal == 8)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_white_active"]);
	}
	if(newVal == 9)
	{
		self thread function_695a904e(localClientNum, level._effect["_vk_fx_zm_tra_mysterybox_yellow_active"]);
	}
}

/*
	Name: function_695a904e
	Namespace: namespace_b5b7402d
	Checksum: 0x4B5DA52B
	Offset: 0x1118
	Size: 0xE8
	Parameters: 2
	Flags: None
	Line Number: 178
*/
function function_695a904e(localClientNum, FX)
{
	if(isdefined(self.var_172fc4e))
	{
		deletefx(localClientNum, self.var_172fc4e, 1);
	}
	self.var_172fc4e = PlayFXOnTag(localClientNum, FX, self, "tag_origin");
	attempts = 0;
	while(!isdefined(self.var_172fc4e) && attempts < 8)
	{
		attempts++;
		self.var_172fc4e = PlayFXOnTag(localClientNum, FX, self, "tag_origin");
		wait(0.05);
	}
	return self.var_172fc4e;
}

/*
	Name: on_player_connect
	Namespace: namespace_b5b7402d
	Checksum: 0x926532CD
	Offset: 0x1208
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 205
*/
function on_player_connect(localClientNum)
{
	var_494154d0 = GetEnt(localClientNum, "csc_xtra_cam_01", "targetname");
	var_494154d0 SetExtraCam(0, 256, 256);
}

/*
	Name: on_finalize_initialization
	Namespace: namespace_b5b7402d
	Checksum: 0x5009842
	Offset: 0x1278
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 221
*/
function on_finalize_initialization()
{
	wait(0.1);
	keys = getArrayKeys(level.AAT);
	foreach(AAT in keys)
	{
		msg = "Client: " + AAT + " index is " + level.AAT[AAT].n_index;
		/#
			println(msg);
		#/
	}
	level.AAT["zm_aat_blast_furnace"].n_index = 1;
	level.AAT["zm_aat_dead_wire"].n_index = 2;
	level.AAT["zm_aat_fire_works"].n_index = 3;
	level.AAT["zm_aat_aethercollapse"].n_index = 4;
	level.AAT["zm_aat_thunder_wall"].n_index = 5;
	level.AAT["zm_aat_turned"].n_index = 6;
}

/*
	Name: function_3e4d643b
	Namespace: namespace_b5b7402d
	Checksum: 0x98A9ECAB
	Offset: 0x1438
	Size: 0x90
	Parameters: 7
	Flags: None
	Line Number: 250
*/
function function_3e4d643b(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	SetWorldFogActiveBank(localClientNum, newVal);
	SetLitFogBank(localClientNum, -1, bitmask(newVal, 1), 4);
}

/*
	Name: bitmask
	Namespace: namespace_b5b7402d
	Checksum: 0x78F83A7
	Offset: 0x14D0
	Size: 0xBE
	Parameters: 2
	Flags: None
	Line Number: 266
*/
function bitmask(value, invert)
{
	if(!isdefined(value))
	{
		value = 0;
	}
	if(!isdefined(invert))
	{
		invert = 0;
	}
	if(!invert)
	{
		var_23992339 = ceil(2 ^ value);
		return var_23992339;
		continue;
	}
	var_23992339 = ceil(Log(value) / Log(2));
	return var_23992339;
}

