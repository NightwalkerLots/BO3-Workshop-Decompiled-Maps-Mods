#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;

#namespace namespace_5a18af94;

/*
	Name: __init__sytem__
	Namespace: namespace_5a18af94
	Checksum: 0x8D26D60B
	Offset: 0x360
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_magicbox_tomb", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_5a18af94
	Checksum: 0x7419C1CE
	Offset: 0x3A8
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	if(!isdefined(level.var_ef01f1df))
	{
		level.var_ef01f1df = [];
	}
	clientfield::register("zbarrier", "tomb_magicbox_initial_fx", 1, 1, "int");
	clientfield::register("zbarrier", "tomb_magicbox_amb_fx", 1, 2, "int");
	clientfield::register("zbarrier", "tomb_magicbox_open_fx", 1, 1, "int");
	clientfield::register("zbarrier", "tomb_magicbox_leaving_fx", 1, 1, "int");
	level._effect["tomb_light_marker"] = "dlc5/tomb/fx_tomb_marker";
	level._effect["tomb_light_marker_flare"] = "dlc5/tomb/fx_tomb_marker_fl";
	if(isdefined(level.var_ef01f1df["zbarrier_zmcore_magicbox_t7_origins"]))
	{
		return;
	}
	s_struct = spawnstruct();
	s_struct.var_7b8dbea1 = &function_be553717;
	s_struct.var_9711412c = &function_555c158;
	s_struct.var_779d45c = &function_61c11c22;
	s_struct.var_d31d4f9b = &function_8cc92191;
	s_struct.var_b4a3e3f = &function_ca8ba801;
	s_struct.var_b498419b = &function_daa8a033;
	s_struct.var_9f2c039c = &function_496f7ba;
	s_struct.var_dc9ab291 = &function_41c1fc63;
	level.var_ef01f1df["zbarrier_zmcore_magicbox_t7_origins"] = s_struct;
	level thread function_36773d07();
	level thread function_54ecf343();
	return;
	ERROR: Bad function call
}

/*
	Name: __main__
	Namespace: namespace_5a18af94
	Checksum: 0x9ACF73B8
	Offset: 0x600
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 79
*/
function __main__()
{
}

/*
	Name: function_be553717
	Namespace: namespace_5a18af94
	Checksum: 0x7F42B251
	Offset: 0x610
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 93
*/
function function_be553717(b_hide)
{
	if(b_hide)
	{
		continue;
	}
}

/*
	Name: function_555c158
	Namespace: namespace_5a18af94
	Checksum: 0x8FB44982
	Offset: 0x630
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 111
*/
function function_555c158(var_f37a1d3e)
{
	self endon("kill_weapon_movement");
	self.origin = var_f37a1d3e.origin + anglesToUp(var_f37a1d3e.angles) * 50;
	var_700562a5 = 12;
	v_float = AnglesToForward(var_f37a1d3e.angles - VectorScale((0, 1, 0), 90)) * 40;
	self moveto(self.origin - v_float * 0.25, var_700562a5, var_700562a5 * 0.5);
	wait(var_700562a5);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_61c11c22
	Namespace: namespace_5a18af94
	Checksum: 0x79EE496F
	Offset: 0x740
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 135
*/
function function_61c11c22(var_b1a4293e, var_491f1716, a_pieces)
{
	if(!isdefined(self.pandora_light))
	{
		self thread function_8cc92191();
	}
	playFX(level._effect["tomb_light_marker_flare"], self.pandora_light.origin);
}

/*
	Name: function_8cc92191
	Namespace: namespace_5a18af94
	Checksum: 0xBD6498D3
	Offset: 0x7C0
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 154
*/
function function_8cc92191()
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
		PlayFXOnTag(level._effect["tomb_light_marker"], self.pandora_light, "tag_origin");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ca8ba801
	Namespace: namespace_5a18af94
	Checksum: 0x6A80AF61
	Offset: 0x8E8
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 184
*/
function function_ca8ba801()
{
	self.weapon_model.origin = self.origin + anglesToUp(self.angles) * 50;
	v_origin = self.weapon_model.origin - VectorScale((0, 0, 1), 5);
	self.weapon_model delete();
	m_lock = util::spawn_model(level.chest_joker_model, v_origin, self.angles);
	m_lock playsound("zmb_hellbox_bear");
	wait(0.5);
	level notify("weapon_fly_away_start");
	wait(1);
	m_lock RotateYaw(3000, 4, 4);
	wait(3);
	v_angles = AnglesToForward(self.angles - VectorScale((0, 1, 0), 90));
	m_lock moveto(m_lock.origin + 20 * v_angles, 0.5, 0.5);
	m_lock waittill("movedone");
	m_lock moveto(m_lock.origin + -100 * v_angles, 0.5, 0.5);
	m_lock waittill("movedone");
	m_lock delete();
	self notify("box_moving");
	level notify("weapon_fly_away_end");
}

/*
	Name: function_daa8a033
	Namespace: namespace_5a18af94
	Checksum: 0x9ACF73B8
	Offset: 0xAF8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 216
*/
function function_daa8a033()
{
}

/*
	Name: function_496f7ba
	Namespace: namespace_5a18af94
	Checksum: 0x259A6FE8
	Offset: 0xB08
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 230
*/
function function_496f7ba()
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
	Name: function_41c1fc63
	Namespace: namespace_5a18af94
	Checksum: 0x9D131444
	Offset: 0xC50
	Size: 0x260
	Parameters: 1
	Flags: None
	Line Number: 259
*/
function function_41c1fc63(str_state)
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
			self thread function_4b14ca98();
			self.state = "arriving";
			break;
		}
		case "initial":
		{
			self ShowZBarrierPiece(1);
			self thread function_b7e3efa8();
			thread zm_unitrigger::register_static_unitrigger(self.owner.unitrigger_stub, &zm_magicbox::magicbox_unitrigger_think);
			self.state = "initial";
			break;
		}
		case "open":
		{
			self ShowZBarrierPiece(2);
			self thread function_f9ebf39f();
			self.state = "open";
			break;
		}
		case "close":
		{
			self ShowZBarrierPiece(2);
			self thread function_77386ed3();
			self.state = "close";
			break;
		}
		case "leaving":
		{
			self ShowZBarrierPiece(1);
			self thread function_afc3dda8();
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
}

/*
	Name: function_4b14ca98
	Namespace: namespace_5a18af94
	Checksum: 0x72AA34A7
	Offset: 0xEB8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 328
*/
function function_4b14ca98()
{
	self clientfield::set("tomb_magicbox_leaving_fx", 0);
	self SetZBarrierPieceState(1, "opening");
	while(self GetZBarrierPieceState(1) == "opening")
	{
		wait(0.05);
	}
	self notify("arrived");
	self.state = "close";
	self clientfield::set("tomb_magicbox_amb_fx", 2);
}

/*
	Name: function_b7e3efa8
	Namespace: namespace_5a18af94
	Checksum: 0x942913E1
	Offset: 0xF78
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 351
*/
function function_b7e3efa8()
{
	level flag::wait_till("all_players_spawned");
	level flag::wait_till("zones_initialized");
	self SetZBarrierPieceState(1, "open");
	self clientfield::set("tomb_magicbox_amb_fx", 2);
}

/*
	Name: function_f9ebf39f
	Namespace: namespace_5a18af94
	Checksum: 0x9471D847
	Offset: 0x1008
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 369
*/
function function_f9ebf39f()
{
	self notify("stop_idle");
	self SetZBarrierPieceState(2, "opening");
	self clientfield::set("tomb_magicbox_open_fx", 1);
	self playsound("zmb_hellbox_open");
	while(self GetZBarrierPieceState(2) == "opening")
	{
		wait(0.1);
	}
	self notify("opened");
	self thread function_fbee3565();
}

/*
	Name: function_fbee3565
	Namespace: namespace_5a18af94
	Checksum: 0x47B6F898
	Offset: 0x10D8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 393
*/
function function_fbee3565()
{
	self notify("hash_fbee3565");
	self endon("hash_fbee3565");
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
	Name: function_77386ed3
	Namespace: namespace_5a18af94
	Checksum: 0x551CE761
	Offset: 0x1198
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 420
*/
function function_77386ed3()
{
	self notify("stop_open_idle");
	self hidezbarrierpiece(5);
	self ShowZBarrierPiece(2);
	self SetZBarrierPieceState(2, "closing");
	self clientfield::set("tomb_magicbox_open_fx", 0);
	self playsound("zmb_hellbox_close");
	while(self GetZBarrierPieceState(2) == "closing")
	{
		wait(0.1);
	}
	self notify("closed");
}

/*
	Name: function_afc3dda8
	Namespace: namespace_5a18af94
	Checksum: 0xFA7A24F0
	Offset: 0x1288
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 445
*/
function function_afc3dda8()
{
	self notify("stop_open_idle");
	self SetZBarrierPieceState(1, "closing");
	self clientfield::set("tomb_magicbox_leaving_fx", 1);
	self clientfield::set("tomb_magicbox_open_fx", 0);
	while(self GetZBarrierPieceState(1) == "closing")
	{
		wait(0.1);
	}
	self notify("left");
	self clientfield::set("tomb_magicbox_amb_fx", 3);
}

/*
	Name: function_36773d07
	Namespace: namespace_5a18af94
	Checksum: 0xFDC40B56
	Offset: 0x1368
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 469
*/
function function_36773d07()
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
		if(e_chest.zbarrier.classname == "zbarrier_zmcore_magicbox_t7_origins")
		{
			e_chest.zbarrier clientfield::set("tomb_magicbox_initial_fx", 1);
			e_chest.zbarrier clientfield::set("tomb_magicbox_amb_fx", 3);
		}
	}
}

/*
	Name: function_54ecf343
	Namespace: namespace_5a18af94
	Checksum: 0xAD713006
	Offset: 0x14A8
	Size: 0xDE
	Parameters: 0
	Flags: None
	Line Number: 499
*/
function function_54ecf343()
{
	while(isdefined(self))
	{
		level waittill("fire_sale_off");
		for(i = 0; i < level.chests.size; i++)
		{
			if(level.chest_index != i && isdefined(level.chests[i].was_temp))
			{
				if(level.chests[i].zbarrier.classname != "zbarrier_zmcore_magicbox_t7_origins")
				{
					continue;
				}
				level.chests[i].zbarrier clientfield::set("tomb_magicbox_amb_fx", 3);
				continue;
			}
		}
	}
}

