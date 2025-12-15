#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;

#namespace namespace_92e7c3d1;

/*
	Name: __init__sytem__
	Namespace: namespace_92e7c3d1
	Checksum: 0x1A49ECE
	Offset: 0x3A0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_magicbox_soe", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_92e7c3d1
	Checksum: 0x57C0288D
	Offset: 0x3E8
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function __init__()
{
	if(!isdefined(level.var_ef01f1df))
	{
		level.var_ef01f1df = [];
	}
	clientfield::register("zbarrier", "soe_magicbox_initial_fx", 1, 1, "int");
	clientfield::register("zbarrier", "soe_magicbox_amb_sound", 1, 1, "int");
	clientfield::register("zbarrier", "soe_magicbox_open_fx", 1, 3, "int");
	level._effect["soe_light_marker"] = "zombie/fx_weapon_box_marker_zod_zmb";
	level._effect["soe_light_flare"] = "zombie/fx_weapon_box_marker_fl_zod_zmb";
	if(isdefined(level.var_ef01f1df["zbarrier_zmcore_zod_magicbox"]))
	{
		return;
	}
	s_struct = spawnstruct();
	s_struct.var_7b8dbea1 = &function_b0cc002e;
	s_struct.var_9711412c = &function_6b734e43;
	s_struct.var_779d45c = &function_f09767f1;
	s_struct.var_d31d4f9b = &function_c05af63e;
	s_struct.var_b4a3e3f = &function_bba003b8;
	s_struct.var_b498419b = &function_dd346248;
	s_struct.var_9f2c039c = &function_e954b75f;
	s_struct.var_dc9ab291 = &function_c416dd4e;
	level.var_ef01f1df["zbarrier_zmcore_zod_magicbox"] = s_struct;
	level thread function_94924a16();
	level thread function_b42a49e6();
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: __main__
	Namespace: namespace_92e7c3d1
	Checksum: 0x9ACF73B8
	Offset: 0x610
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function __main__()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b0cc002e
	Namespace: namespace_92e7c3d1
	Checksum: 0x9C621D34
	Offset: 0x620
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 96
*/
function function_b0cc002e(b_hide)
{
	if(b_hide)
	{
		continue;
	}
}

/*
	Name: function_6b734e43
	Namespace: namespace_92e7c3d1
	Checksum: 0xF5A0F330
	Offset: 0x640
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 114
*/
function function_6b734e43(var_f37a1d3e)
{
	self endon("kill_weapon_movement");
	var_700562a5 = 12;
	v_float = anglesToUp(self.angles) * level.custom_magicbox_float_height;
	self moveto(self.origin - v_float * 0.4, var_700562a5, var_700562a5 * 0.5);
	wait(var_700562a5);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_f09767f1
	Namespace: namespace_92e7c3d1
	Checksum: 0xD211F2DA
	Offset: 0x700
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 137
*/
function function_f09767f1(var_b1a4293e, var_491f1716, a_pieces)
{
	if(!isdefined(self.pandora_light))
	{
		self thread function_c05af63e();
	}
	playFX(level._effect["soe_light_flare"], self.pandora_light.origin);
}

/*
	Name: function_c05af63e
	Namespace: namespace_92e7c3d1
	Checksum: 0xB4EDBB9B
	Offset: 0x780
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 156
*/
function function_c05af63e()
{
	self endon("death");
	self.pandora_light = spawn("script_model", self.zbarrier.origin);
	self.pandora_light.angles = self.zbarrier.angles + VectorScale((-1, 0, -1), 90);
	self.pandora_light SetModel("tag_origin");
	if(!(isdefined(level._box_initialized) && level._box_initialized))
	{
		level flag::wait_till("start_zombie_round_logic");
		level._box_initialized = 1;
	}
	wait(1);
	if(isdefined(self) && isdefined(self.pandora_light))
	{
		PlayFXOnTag(level._effect["soe_light_marker"], self.pandora_light, "tag_origin");
	}
}

/*
	Name: function_bba003b8
	Namespace: namespace_92e7c3d1
	Checksum: 0x8379E811
	Offset: 0x8A8
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 184
*/
function function_bba003b8()
{
	Array::thread_all(level.players, &function_5bc97607);
	v_origin = self.weapon_model.origin - VectorScale((0, 0, 1), 5);
	self.weapon_model delete();
	m_lock = spawn("script_model", v_origin);
	m_lock SetModel("p7_zm_zod_magic_box_tentacle_teddy");
	m_lock.angles = self.angles + VectorScale((0, 1, 0), 180);
	m_lock playsound("zmb_soe_magicbox_bear");
	wait(0.5);
	level notify("weapon_fly_away_start");
	wait(1);
	m_lock RotateYaw(3000, 4.5, 4.5);
	wait(3);
	v_angles = AnglesToForward(self.angles - VectorScale((1, 1, 0), 90));
	m_lock moveto(m_lock.origin + 35 * v_angles, 1.5, 1);
	m_lock waittill("movedone");
	m_lock moveto(m_lock.origin + -100 * v_angles, 0.5, 0.5);
	m_lock waittill("movedone");
	m_lock delete();
	self notify("box_moving");
	level notify("weapon_fly_away_end");
}

/*
	Name: function_5bc97607
	Namespace: namespace_92e7c3d1
	Checksum: 0x627D252C
	Offset: 0xAE8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 218
*/
function function_5bc97607()
{
	self playlocalsound("zmb_zod_box_laugh_child");
}

/*
	Name: function_dd346248
	Namespace: namespace_92e7c3d1
	Checksum: 0x9ACF73B8
	Offset: 0xB18
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 233
*/
function function_dd346248()
{
}

/*
	Name: function_e954b75f
	Namespace: namespace_92e7c3d1
	Checksum: 0x78A4F966
	Offset: 0xB28
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 247
*/
function function_e954b75f()
{
	self endon("box_hacked_respin");
	wait(0.5);
	self SetZBarrierPieceState(3, "closed");
	self SetZBarrierPieceState(4, "closed");
	util::wait_network_frame();
	self ZBarrierPieceUseBoxRiseLogic(3);
	self ZBarrierPieceUseBoxRiseLogic(4);
	self SetZBarrierPieceState(3, "opening");
	self SetZBarrierPieceState(4, "opening");
	while(self GetZBarrierPieceState(3) != "open")
	{
		wait(0.5);
	}
	self hidezbarrierpiece(3);
	self hidezbarrierpiece(4);
}

/*
	Name: function_c416dd4e
	Namespace: namespace_92e7c3d1
	Checksum: 0xE309F962
	Offset: 0xC70
	Size: 0x260
	Parameters: 1
	Flags: None
	Line Number: 276
*/
function function_c416dd4e(str_state)
{
	switch(str_state)
	{
		case "away":
		{
			self ShowZBarrierPiece(0);
			self.state = "away";
			self.owner.is_locked = 0;
			break;
		}
		case "arriving":
		{
			self ShowZBarrierPiece(1);
			self thread function_e2aedcf7();
			self.state = "arriving";
			break;
		}
		case "initial":
		{
			self ShowZBarrierPiece(1);
			self thread function_7e815b9f();
			thread zm_unitrigger::register_static_unitrigger(self.owner.unitrigger_stub, &zm_magicbox::magicbox_unitrigger_think);
			self.state = "initial";
			break;
		}
		case "open":
		{
			self ShowZBarrierPiece(2);
			self thread function_8d3ffe38();
			self.state = "open";
			break;
		}
		case "close":
		{
			self ShowZBarrierPiece(2);
			self thread function_7e9518fe();
			self.state = "close";
			break;
		}
		case "leaving":
		{
			self ShowZBarrierPiece(1);
			self thread function_9927bd09();
			self.state = "leaving";
			self.owner.is_locked = 0;
			break;
		}
		default
		{
			if(isdefined(level.custom_magicbox_state_handler))
			{
				self [[level.custom_magicbox_state_handler]](str_state);
				break;
			}
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e2aedcf7
	Namespace: namespace_92e7c3d1
	Checksum: 0x70EED327
	Offset: 0xED8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 347
*/
function function_e2aedcf7()
{
	self SetZBarrierPieceState(1, "opening");
	while(self GetZBarrierPieceState(1) == "opening")
	{
		wait(0.05);
	}
	self notify("arrived");
	self.state = "close";
	self clientfield::set("soe_magicbox_amb_sound", 1);
	self clientfield::set("soe_magicbox_open_fx", 1);
}

/*
	Name: function_7e815b9f
	Namespace: namespace_92e7c3d1
	Checksum: 0x1D0952F8
	Offset: 0xF98
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 370
*/
function function_7e815b9f()
{
	level flag::wait_till("all_players_spawned");
	level flag::wait_till("zones_initialized");
	self SetZBarrierPieceState(1, "open");
	self clientfield::set("soe_magicbox_open_fx", 1);
}

/*
	Name: function_8d3ffe38
	Namespace: namespace_92e7c3d1
	Checksum: 0x55FB5CB7
	Offset: 0x1028
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 388
*/
function function_8d3ffe38()
{
	self notify("stop_idle");
	self SetZBarrierPieceState(2, "opening");
	self clientfield::set("soe_magicbox_open_fx", 1);
	while(self GetZBarrierPieceState(2) == "opening")
	{
		wait(0.1);
	}
	self notify("opened");
	self thread function_472273d2();
}

/*
	Name: function_472273d2
	Namespace: namespace_92e7c3d1
	Checksum: 0x84A0F116
	Offset: 0x10D8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 411
*/
function function_472273d2()
{
	self notify("hash_472273d2");
	self endon("hash_472273d2");
	self endon("stop_open_idle");
	self hidezbarrierpiece(2);
	self ShowZBarrierPiece(5);
	while(isdefined(self))
	{
		self SetZBarrierPieceState(5, "opening");
		while(self GetZBarrierPieceState(5) != "open")
		{
			wait(0.05);
		}
	}
}

/*
	Name: function_7e9518fe
	Namespace: namespace_92e7c3d1
	Checksum: 0x38EC8A78
	Offset: 0x1198
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 438
*/
function function_7e9518fe()
{
	self notify("stop_open_idle");
	self hidezbarrierpiece(5);
	self ShowZBarrierPiece(2);
	self SetZBarrierPieceState(2, "closing");
	self clientfield::set("soe_magicbox_open_fx", 0);
	while(self GetZBarrierPieceState(2) == "closing")
	{
		wait(0.1);
	}
	self notify("closed");
	self clientfield::set("soe_magicbox_open_fx", 3);
}

/*
	Name: function_9927bd09
	Namespace: namespace_92e7c3d1
	Checksum: 0x4D6CA224
	Offset: 0x1288
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 463
*/
function function_9927bd09()
{
	self notify("stop_open_idle");
	self SetZBarrierPieceState(1, "closing");
	self clientfield::set("soe_magicbox_open_fx", 0);
	while(self GetZBarrierPieceState(1) == "closing")
	{
		wait(0.1);
	}
	self notify("left");
	self clientfield::set("soe_magicbox_open_fx", 2);
	return;
}

/*
	Name: function_94924a16
	Namespace: namespace_92e7c3d1
	Checksum: 0xB887013B
	Offset: 0x1348
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 487
*/
function function_94924a16()
{
	while(!isdefined(level.chests))
	{
		wait(0.05);
	}
	while(!isdefined(level.chests[level.chests.size - 1].zbarrier))
	{
		wait(0.05);
	}
	foreach(e_chest in level.chests)
	{
		if(e_chest.zbarrier.classname == "zbarrier_zmcore_zod_magicbox")
		{
			e_chest.zbarrier clientfield::set("soe_magicbox_open_fx", 2);
		}
	}
}

/*
	Name: function_b42a49e6
	Namespace: namespace_92e7c3d1
	Checksum: 0xE5047DC3
	Offset: 0x1460
	Size: 0x1BA
	Parameters: 0
	Flags: None
	Line Number: 516
*/
function function_b42a49e6()
{
	while(isdefined(self))
	{
		b_state = level util::waittill_any_return("fire_sale_off", "fire_sale_on");
		for(i = 0; i < level.chests.size; i++)
		{
			if(level.chest_index != i && isdefined(level.chests[i].was_temp))
			{
				if(level.chests[i].zbarrier.classname != "zbarrier_zmcore_zod_magicbox")
				{
					continue;
				}
				if(b_state == "fire_sale_on")
				{
					level.chests[i].zbarrier clientfield::set("soe_magicbox_amb_sound", 1);
					level.chests[i].zbarrier clientfield::set("soe_magicbox_open_fx", 3);
					continue;
				}
				level.chests[i].zbarrier clientfield::set("soe_magicbox_amb_sound", 0);
				level.chests[i].zbarrier clientfield::set("soe_magicbox_open_fx", 2);
			}
		}
	}
}

