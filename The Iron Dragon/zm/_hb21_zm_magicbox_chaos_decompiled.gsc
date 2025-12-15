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

#namespace namespace_97859df6;

/*
	Name: __init__sytem__
	Namespace: namespace_97859df6
	Checksum: 0x19760509
	Offset: 0x388
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_magicbox_chaos", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_97859df6
	Checksum: 0x6B3CC01F
	Offset: 0x3D0
	Size: 0x2C8
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
	clientfield::register("zbarrier", "chaos_magicbox_amb_fx", 1, 2, "int");
	clientfield::register("zbarrier", "chaos_magicbox_debris_amb_fx", 1, 1, "int");
	clientfield::register("zbarrier", "chaos_magicbox_skull_fx", 1, 1, "int");
	clientfield::register("zbarrier", "chaos_magicbox_arrive_fx", 1, 1, "int");
	clientfield::register("zbarrier", "chaos_magicbox_leave_fx", 1, 1, "int");
	clientfield::register("zbarrier", "chaos_magicbox_closed_fx", 1, 1, "int");
	clientfield::register("zbarrier", "chaos_magicbox_open_fx", 1, 1, "int");
	level._effect["chaos_light_marker"] = "harry/chaos_box/fx_chaos_box_marker";
	if(isdefined(level.var_ef01f1df["zbarrier_zmcore_magicbox_chaos"]))
	{
		return;
	}
	s_struct = spawnstruct();
	s_struct.var_7b8dbea1 = &function_aa635e93;
	s_struct.var_9711412c = &function_1ab3e964;
	s_struct.var_779d45c = &function_705f0c66;
	s_struct.var_d31d4f9b = &function_383bffd;
	s_struct.var_b4a3e3f = &function_123a2b5;
	s_struct.var_b498419b = &function_ecbc2a0f;
	s_struct.var_9f2c039c = &function_cae66b56;
	s_struct.var_dc9ab291 = &function_90bd5447;
	level.var_ef01f1df["zbarrier_zmcore_magicbox_chaos"] = s_struct;
	level thread function_64a59e1b();
	level thread function_626f0d6f();
}

/*
	Name: __main__
	Namespace: namespace_97859df6
	Checksum: 0x9ACF73B8
	Offset: 0x6A0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function __main__()
{
}

/*
	Name: function_aa635e93
	Namespace: namespace_97859df6
	Checksum: 0x6ED82221
	Offset: 0x6B0
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 94
*/
function function_aa635e93(b_hide)
{
	if(b_hide)
	{
		continue;
	}
}

/*
	Name: function_1ab3e964
	Namespace: namespace_97859df6
	Checksum: 0x400E4DE2
	Offset: 0x6D0
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 112
*/
function function_1ab3e964(var_f37a1d3e)
{
	v_float = anglesToUp(var_f37a1d3e.angles) * level.custom_magicbox_float_height;
	self endon("kill_weapon_movement");
	var_700562a5 = 12;
	self moveto(self.origin - v_float * 0.85, var_700562a5, var_700562a5 * 0.5);
	wait(var_700562a5);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_705f0c66
	Namespace: namespace_97859df6
	Checksum: 0x9174BC77
	Offset: 0x798
	Size: 0x20
	Parameters: 3
	Flags: None
	Line Number: 135
*/
function function_705f0c66(var_b1a4293e, var_491f1716, a_pieces)
{
}

/*
	Name: function_383bffd
	Namespace: namespace_97859df6
	Checksum: 0x151779C0
	Offset: 0x7C0
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 149
*/
function function_383bffd()
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
		PlayFXOnTag(level._effect["chaos_light_marker"], self.pandora_light, "tag_origin");
	}
}

/*
	Name: function_123a2b5
	Namespace: namespace_97859df6
	Checksum: 0xADFB7007
	Offset: 0x8E8
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 177
*/
function function_123a2b5()
{
	Array::thread_all(level.players, &function_69ae584a);
	self.weapon_model delete();
	self ShowZBarrierPiece(3);
	self clientfield::set("chaos_magicbox_skull_fx", 1);
	self SetZBarrierPieceState(3, "closing");
	wait(0.05);
	level notify("weapon_fly_away_start");
	while(self GetZBarrierPieceState(3) != "closed")
	{
		wait(0.5);
	}
	self clientfield::set("chaos_magicbox_skull_fx", 0);
	self hidezbarrierpiece(3);
	self notify("box_moving");
	level notify("weapon_fly_away_end");
	return;
	ERROR: Bad function call
}

/*
	Name: function_69ae584a
	Namespace: namespace_97859df6
	Checksum: 0xB5C9CE19
	Offset: 0xA28
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 208
*/
function function_69ae584a()
{
	self playlocalsound("zmb_chaos_magicbox_bear");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ecbc2a0f
	Namespace: namespace_97859df6
	Checksum: 0x9ACF73B8
	Offset: 0xA58
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function function_ecbc2a0f()
{
}

/*
	Name: function_cae66b56
	Namespace: namespace_97859df6
	Checksum: 0xCB9EEEB9
	Offset: 0xA68
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 239
*/
function function_cae66b56()
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
	Name: function_90bd5447
	Namespace: namespace_97859df6
	Checksum: 0x9DC0418E
	Offset: 0xBB0
	Size: 0x288
	Parameters: 1
	Flags: None
	Line Number: 268
*/
function function_90bd5447(str_state)
{
	switch(str_state)
	{
		case "away":
		{
			self ShowZBarrierPiece(0);
			self thread function_c6f65c74();
			self.state = "away";
			break;
		}
		case "arriving":
		{
			self ShowZBarrierPiece(1);
			self thread function_b0921684();
			self.state = "arriving";
			break;
		}
		case "initial":
		{
			self ShowZBarrierPiece(5);
			self thread function_cbecbb5c();
			thread zm_unitrigger::register_static_unitrigger(self.owner.unitrigger_stub, &zm_magicbox::magicbox_unitrigger_think);
			self.state = "initial";
			break;
		}
		case "open":
		{
			self ShowZBarrierPiece(2);
			self hidezbarrierpiece(5);
			self thread function_b3e1cb53();
			self.state = "open";
			break;
		}
		case "close":
		{
			self ShowZBarrierPiece(2);
			self thread function_6dc7578f();
			self.state = "close";
			break;
		}
		case "leaving":
		{
			self ShowZBarrierPiece(1);
			self hidezbarrierpiece(5);
			self thread function_e84ff18c();
			self.state = "leaving";
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
	Name: function_c6f65c74
	Namespace: namespace_97859df6
	Checksum: 0x3766C25B
	Offset: 0xE40
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 338
*/
function function_c6f65c74()
{
	self endon("zbarrier_state_change");
	while(1)
	{
		self SetZBarrierPieceState(0, "opening");
		while(self GetZBarrierPieceState(0) == "opening")
		{
			wait(0.05);
		}
		self SetZBarrierPieceState(0, "closing");
		while(self GetZBarrierPieceState(0) == "closing")
		{
			wait(0.05);
		}
	}
}

/*
	Name: function_b0921684
	Namespace: namespace_97859df6
	Checksum: 0xF59695
	Offset: 0xF00
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 366
*/
function function_b0921684()
{
	self SetZBarrierPieceState(1, "opening");
	self clientfield::set("chaos_magicbox_arrive_fx", 1);
	while(self GetZBarrierPieceState(1) == "opening")
	{
		wait(0.05);
	}
	self notify("arrived");
	self clientfield::set("chaos_magicbox_amb_fx", 1);
	self clientfield::set("chaos_magicbox_arrive_fx", 0);
	self clientfield::set("chaos_magicbox_closed_fx", 1);
	self thread function_654ecfd6();
}

/*
	Name: function_cbecbb5c
	Namespace: namespace_97859df6
	Checksum: 0x9B512957
	Offset: 0x1008
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 391
*/
function function_cbecbb5c()
{
	level flag::wait_till("all_players_spawned");
	level flag::wait_till("zones_initialized");
	self SetZBarrierPieceState(1, "open");
	self clientfield::set("chaos_magicbox_amb_fx", 1);
	self clientfield::set("chaos_magicbox_closed_fx", 1);
	self thread function_654ecfd6();
}

/*
	Name: function_b3e1cb53
	Namespace: namespace_97859df6
	Checksum: 0xED18258
	Offset: 0x10D0
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 411
*/
function function_b3e1cb53()
{
	self notify("stop_idle");
	self SetZBarrierPieceState(2, "opening");
	self clientfield::set("chaos_magicbox_closed_fx", 0);
	self clientfield::set("chaos_magicbox_open_fx", 1);
	self clientfield::set("chaos_magicbox_amb_fx", 2);
	while(self GetZBarrierPieceState(2) == "opening")
	{
		wait(0.1);
	}
	self notify("opened");
	self thread function_64647c99();
}

/*
	Name: function_64647c99
	Namespace: namespace_97859df6
	Checksum: 0x36DD47B7
	Offset: 0x11C0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 436
*/
function function_64647c99()
{
	self notify("hash_64647c99");
	self endon("hash_64647c99");
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
	Name: function_654ecfd6
	Namespace: namespace_97859df6
	Checksum: 0x7E514707
	Offset: 0x1280
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 463
*/
function function_654ecfd6()
{
	self notify("hash_654ecfd6");
	self endon("hash_654ecfd6");
	self endon("stop_idle");
	self hidezbarrierpiece(1);
	self ShowZBarrierPiece(5);
	while(isdefined(self))
	{
		self SetZBarrierPieceState(5, "closing");
		while(self GetZBarrierPieceState(5) != "closed")
		{
			wait(0.05);
		}
	}
}

/*
	Name: function_6dc7578f
	Namespace: namespace_97859df6
	Checksum: 0x45B75826
	Offset: 0x1340
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 490
*/
function function_6dc7578f()
{
	self notify("stop_open_idle");
	self SetZBarrierPieceState(2, "closing");
	self clientfield::set("chaos_magicbox_open_fx", 0);
	while(self GetZBarrierPieceState(2) == "closing")
	{
		wait(0.1);
	}
	self clientfield::set("chaos_magicbox_closed_fx", 1);
	self clientfield::set("chaos_magicbox_amb_fx", 1);
	self hidezbarrierpiece(2);
	self notify("closed");
	self thread function_654ecfd6();
}

/*
	Name: function_e84ff18c
	Namespace: namespace_97859df6
	Checksum: 0xBDFF24F6
	Offset: 0x1448
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 516
*/
function function_e84ff18c()
{
	self notify("stop_open_idle");
	self SetZBarrierPieceState(1, "closing");
	self clientfield::set("chaos_magicbox_amb_fx", 0);
	self clientfield::set("chaos_magicbox_open_fx", 0);
	self clientfield::set("chaos_magicbox_leave_fx", 1);
	self clientfield::set("chaos_magicbox_closed_fx", 0);
	while(self GetZBarrierPieceState(1) == "closing")
	{
		wait(0.1);
	}
	self notify("left");
	self clientfield::set("chaos_magicbox_leave_fx", 0);
}

/*
	Name: function_64a59e1b
	Namespace: namespace_97859df6
	Checksum: 0xC36DF4F7
	Offset: 0x1568
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 542
*/
function function_64a59e1b()
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
		if(e_chest.zbarrier.classname == "zbarrier_zmcore_magicbox_chaos")
		{
			e_chest.zbarrier clientfield::set("chaos_magicbox_debris_amb_fx", 1);
		}
	}
	return;
}

/*
	Name: function_626f0d6f
	Namespace: namespace_97859df6
	Checksum: 0xBDD07AA3
	Offset: 0x1680
	Size: 0xDE
	Parameters: 0
	Flags: None
	Line Number: 572
*/
function function_626f0d6f()
{
	while(isdefined(self))
	{
		level waittill("fire_sale_off");
		for(i = 0; i < level.chests.size; i++)
		{
			if(level.chest_index != i && isdefined(level.chests[i].was_temp))
			{
				if(level.chests[i].zbarrier.classname != "zbarrier_zmcore_magicbox_chaos")
				{
					continue;
				}
				level.chests[i].zbarrier clientfield::set("chaos_magicbox_debris_amb_fx", 1);
				continue;
			}
		}
	}
}

