#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;

#namespace namespace_7c0862bf;

/*
	Name: __init__sytem__
	Namespace: namespace_7c0862bf
	Checksum: 0xCB4D5FB1
	Offset: 0x340
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_magicbox_botd", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_7c0862bf
	Checksum: 0xECB03F5B
	Offset: 0x388
	Size: 0x1F0
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
	clientfield::register("zbarrier", "motd_magicbox_open_fx", 1, 1, "int");
	clientfield::register("zbarrier", "motd_magicbox_amb_fx", 1, 2, "int");
	level._effect["motd_light_marker"] = "harry/motd_mysterybox/fx_motd_marker";
	level._effect["motd_light_marker_flare"] = "harry/motd_mysterybox/fx_motd_marker_fl";
	if(isdefined(level.var_ef01f1df["zbarrier_zmcore_magicbox_botd"]))
	{
		return;
	}
	s_struct = spawnstruct();
	s_struct.var_7b8dbea1 = &function_ad4fb99a;
	s_struct.var_9711412c = &function_b1b377f;
	s_struct.var_779d45c = &function_f8175345;
	s_struct.var_d31d4f9b = &function_a9bed7fa;
	s_struct.var_b4a3e3f = &function_a866648c;
	s_struct.var_b498419b = &function_75047e94;
	s_struct.var_9f2c039c = &function_92686ddb;
	s_struct.var_dc9ab291 = &function_6da931c2;
	level.var_ef01f1df["zbarrier_zmcore_magicbox_botd"] = s_struct;
	level thread function_daaf398a();
	level thread function_11a59da2();
}

/*
	Name: __main__
	Namespace: namespace_7c0862bf
	Checksum: 0x9ACF73B8
	Offset: 0x580
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function __main__()
{
	return;
}

/*
	Name: function_ad4fb99a
	Namespace: namespace_7c0862bf
	Checksum: 0x97AD55C4
	Offset: 0x590
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 90
*/
function function_ad4fb99a(b_hide)
{
	if(b_hide)
	{
		continue;
	}
}

/*
	Name: function_b1b377f
	Namespace: namespace_7c0862bf
	Checksum: 0xE3E367C0
	Offset: 0x5B0
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 108
*/
function function_b1b377f(var_f37a1d3e)
{
	v_float = anglesToUp(var_f37a1d3e.angles) * level.custom_magicbox_float_height;
	self endon("kill_weapon_movement");
	var_700562a5 = 12;
	self moveto(self.origin - v_float * 0.85, var_700562a5, var_700562a5 * 0.5);
	wait(var_700562a5);
	if(isdefined(self))
	{
		self delete();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f8175345
	Namespace: namespace_7c0862bf
	Checksum: 0x437792A7
	Offset: 0x678
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 133
*/
function function_f8175345(var_b1a4293e, var_491f1716, a_pieces)
{
	if(!isdefined(self.pandora_light))
	{
		self thread function_a9bed7fa();
	}
	playFX(level._effect["motd_light_marker_flare"], self.pandora_light.origin);
}

/*
	Name: function_a9bed7fa
	Namespace: namespace_7c0862bf
	Checksum: 0xB1A76C99
	Offset: 0x6F8
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 152
*/
function function_a9bed7fa()
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
		PlayFXOnTag(level._effect["motd_light_marker"], self.pandora_light, "tag_origin");
	}
}

/*
	Name: function_a866648c
	Namespace: namespace_7c0862bf
	Checksum: 0xAB70C97A
	Offset: 0x820
	Size: 0x210
	Parameters: 0
	Flags: None
	Line Number: 180
*/
function function_a866648c()
{
	v_origin = self.weapon_model.origin - VectorScale((0, 0, 1), 5);
	self.weapon_model delete();
	m_lock = spawn("script_model", v_origin);
	m_lock SetModel("p8_anim_zm_al_magic_box_lock_red");
	m_lock.angles = self.angles + VectorScale((0, 1, 0), 180);
	m_lock playsound("zmb_motd_magicbox_bear");
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
	Name: function_75047e94
	Namespace: namespace_7c0862bf
	Checksum: 0x9ACF73B8
	Offset: 0xA38
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 213
*/
function function_75047e94()
{
}

/*
	Name: function_92686ddb
	Namespace: namespace_7c0862bf
	Checksum: 0x46EE57BB
	Offset: 0xA48
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 227
*/
function function_92686ddb()
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
	Name: function_6da931c2
	Namespace: namespace_7c0862bf
	Checksum: 0xA7F21D59
	Offset: 0xB90
	Size: 0x260
	Parameters: 1
	Flags: None
	Line Number: 256
*/
function function_6da931c2(str_state)
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
			self thread function_8ee94e03();
			self.state = "arriving";
			break;
		}
		case "initial":
		{
			self ShowZBarrierPiece(1);
			self thread function_df6cf373();
			thread zm_unitrigger::register_static_unitrigger(self.owner.unitrigger_stub, &zm_magicbox::magicbox_unitrigger_think);
			self.state = "initial";
			break;
		}
		case "open":
		{
			self ShowZBarrierPiece(2);
			self thread function_910d72cc();
			self.state = "open";
			break;
		}
		case "close":
		{
			self ShowZBarrierPiece(2);
			self thread function_ff35bfca();
			self.state = "close";
			break;
		}
		case "leaving":
		{
			self ShowZBarrierPiece(1);
			self thread function_3376304d();
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
	Name: function_8ee94e03
	Namespace: namespace_7c0862bf
	Checksum: 0x72FAB6E5
	Offset: 0xDF8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 325
*/
function function_8ee94e03()
{
	self SetZBarrierPieceState(1, "opening");
	while(self GetZBarrierPieceState(1) == "opening")
	{
		wait(0.05);
	}
	self notify("arrived");
	self.state = "close";
	self clientfield::set("motd_magicbox_amb_fx", 2);
	return;
	self.state++;
}

/*
	Name: function_df6cf373
	Namespace: namespace_7c0862bf
	Checksum: 0x6216F73D
	Offset: 0xE98
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 349
*/
function function_df6cf373()
{
	level flag::wait_till("all_players_spawned");
	level flag::wait_till("zones_initialized");
	self SetZBarrierPieceState(1, "open");
	self clientfield::set("motd_magicbox_amb_fx", 1);
}

/*
	Name: function_910d72cc
	Namespace: namespace_7c0862bf
	Checksum: 0x78DC7B43
	Offset: 0xF28
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 367
*/
function function_910d72cc()
{
	self notify("stop_idle");
	self SetZBarrierPieceState(2, "opening");
	self clientfield::set("motd_magicbox_open_fx", 1);
	while(self GetZBarrierPieceState(2) == "opening")
	{
		wait(0.1);
	}
	self notify("opened");
}

/*
	Name: function_ff35bfca
	Namespace: namespace_7c0862bf
	Checksum: 0x31DF47AB
	Offset: 0xFC8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 389
*/
function function_ff35bfca()
{
	self notify("stop_open_idle");
	self SetZBarrierPieceState(2, "closing");
	self clientfield::set("motd_magicbox_open_fx", 0);
	while(self GetZBarrierPieceState(2) == "closing")
	{
		wait(0.1);
	}
	self notify("closed");
}

/*
	Name: function_3376304d
	Namespace: namespace_7c0862bf
	Checksum: 0xAEF53CF6
	Offset: 0x1068
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 411
*/
function function_3376304d()
{
	self notify("stop_open_idle");
	self SetZBarrierPieceState(1, "closing");
	self clientfield::set("motd_magicbox_open_fx", 0);
	while(self GetZBarrierPieceState(1) == "closing")
	{
		wait(0.1);
	}
	self notify("left");
	self clientfield::set("motd_magicbox_amb_fx", 1);
}

/*
	Name: function_daaf398a
	Namespace: namespace_7c0862bf
	Checksum: 0x62EAA926
	Offset: 0x1128
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 434
*/
function function_daaf398a()
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
		if(e_chest.zbarrier.classname == "zbarrier_zmcore_magicbox_botd")
		{
			e_chest.zbarrier clientfield::set("motd_magicbox_amb_fx", 1);
		}
	}
}

/*
	Name: function_11a59da2
	Namespace: namespace_7c0862bf
	Checksum: 0x3E7AD4BD
	Offset: 0x1240
	Size: 0xDE
	Parameters: 0
	Flags: None
	Line Number: 463
*/
function function_11a59da2()
{
	while(isdefined(self))
	{
		level waittill("fire_sale_off");
		for(i = 0; i < level.chests.size; i++)
		{
			if(level.chest_index != i && isdefined(level.chests[i].was_temp))
			{
				if(level.chests[i].zbarrier.classname != "zbarrier_zmcore_magicbox_botd")
				{
					continue;
				}
				level.chests[i].zbarrier clientfield::set("motd_magicbox_amb_fx", 1);
				continue;
			}
		}
	}
}

