#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace namespace_605a4f26;

/*
	Name: __init__sytem__
	Namespace: namespace_605a4f26
	Checksum: 0xBF853414
	Offset: 0x698
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_fix", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_605a4f26
	Checksum: 0xA195BDCF
	Offset: 0x6D8
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	clientfield::register("zbarrier", "bgb_machine", 1, 1, "int", &function_a88aab09, 0, 0);
	clientfield::register("zbarrier", "bgb_set_state", 1, 4, "int", &function_1568f439, 0, 0);
	clientfield::register("zbarrier", "bgb_set_limit_type", 1, 4, "int", &function_f2fe2ee8, 0, 0);
	clientfield::register("zbarrier", "bgb_set_rarity", 1, 4, "int", &function_7996f1d3, 0, 0);
	clientfield::register("toplayer", "bgb_machine_buys", 1, 3, "int", &function_8f7352c2, 0, 0);
	callback::on_localplayer_spawned(&on_player_spawned);
	if(!isdefined(level.var_32948a58))
	{
		level.var_32948a58 = [];
	}
	if(!isdefined(level.var_12113d21))
	{
		level.var_12113d21 = [];
	}
	if(!isdefined(level.var_6f4e5ea7))
	{
		level.var_6f4e5ea7 = [];
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_605a4f26
	Checksum: 0xECC853D5
	Offset: 0x8B8
	Size: 0xE8
	Parameters: 1
	Flags: Private
	Line Number: 66
*/
function private on_player_spawned(localClientNum)
{
	if(!isdefined(level.var_32948a58[localClientNum]))
	{
		level.var_32948a58[localClientNum] = 0;
	}
	if(!isdefined(level.var_12113d21[localClientNum]))
	{
		level.var_12113d21[localClientNum] = 1;
	}
	if(!isdefined(level.var_6f4e5ea7[localClientNum]))
	{
		level.var_6f4e5ea7[localClientNum] = 0;
	}
	function_607d2b62(localClientNum, level.var_12113d21[localClientNum], level.var_32948a58[localClientNum], level.var_6f4e5ea7[localClientNum]);
	self thread function_564521c8(localClientNum);
	self thread function_8398acfa(localClientNum);
}

/*
	Name: function_a88aab09
	Namespace: namespace_605a4f26
	Checksum: 0x46314462
	Offset: 0x9A8
	Size: 0x118
	Parameters: 7
	Flags: Private
	Line Number: 95
*/
function private function_a88aab09(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.initialized))
	{
		return;
	}
	self.initialized = 1;
	if(!isdefined(self.fx_array))
	{
		self.fx_array = [];
	}
	if(!isdefined(level.var_aea19814))
	{
		var_183f4dbd = self getnumzbarrierpieces();
		for(i = 0; i < var_183f4dbd; i++)
		{
			piece = self ZBarrierGetPiece(i);
			ForceStreamXModel(piece.model);
		}
		level.var_aea19814 = 1;
	}
}

/*
	Name: function_1568f439
	Namespace: namespace_605a4f26
	Checksum: 0x340ED563
	Offset: 0xAC8
	Size: 0x148
	Parameters: 7
	Flags: Private
	Line Number: 128
*/
function private function_1568f439(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self.state = newVal;
	switch(self.state)
	{
		case 1:
		{
			self function_fd92b287(localClientNum);
			break;
		}
		case 2:
		{
			self function_cd0e3c3e(localClientNum);
			break;
		}
		case 3:
		{
			self function_5b75a3b9(localClientNum);
			break;
		}
		case 4:
		{
			self function_c3056e53(localClientNum);
			break;
		}
		case 5:
		{
			self function_bd7bc6a3(localClientNum);
			break;
		}
		case 6:
		{
			self function_c3056e53(localClientNum);
			break;
		}
	}
}

/*
	Name: function_f2fe2ee8
	Namespace: namespace_605a4f26
	Checksum: 0x50A6CA7D
	Offset: 0xC18
	Size: 0x140
	Parameters: 7
	Flags: Private
	Line Number: 176
*/
function private function_f2fe2ee8(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	switch(newVal)
	{
		case 1:
		{
			self.var_c9e64d65 = "activated";
			self.var_297c9990 = "zombie/fx_bgb_machine_bulb_activated_zmb";
			self.var_709e1095 = "zombie/fx_bgb_machine_eye_activated_zmb";
			break;
		}
		case 2:
		{
			self.var_c9e64d65 = "event";
			self.var_297c9990 = "zombie/fx_bgb_machine_bulb_event_zmb";
			self.var_709e1095 = "zombie/fx_bgb_machine_eye_event_zmb";
			break;
		}
		case 3:
		{
			self.var_c9e64d65 = "rounds";
			self.var_297c9990 = "zombie/fx_bgb_machine_bulb_rounds_zmb";
			self.var_709e1095 = "zombie/fx_bgb_machine_eye_rounds_zmb";
			break;
		}
		case 4:
		{
			self.var_c9e64d65 = "time";
			self.var_297c9990 = "zombie/fx_bgb_machine_bulb_time_zmb";
			self.var_709e1095 = "zombie/fx_bgb_machine_eye_time_zmb";
			break;
		}
	}
	return;
}

/*
	Name: function_7996f1d3
	Namespace: namespace_605a4f26
	Checksum: 0x9C73656A
	Offset: 0xD60
	Size: 0xE0
	Parameters: 7
	Flags: Private
	Line Number: 222
*/
function private function_7996f1d3(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	switch(newVal)
	{
		case 1:
		{
			self.var_d277f374 = "base";
			break;
		}
		case 2:
		{
			self.var_d277f374 = "speckled";
			break;
		}
		case 3:
		{
			self.var_d277f374 = "shiny";
			break;
		}
		case 4:
		{
			self.var_d277f374 = "swirl";
			break;
		}
		case 5:
		{
			self.var_d277f374 = "pinwheel";
			break;
		}
	}
}

/*
	Name: function_8f7352c2
	Namespace: namespace_605a4f26
	Checksum: 0xC52B1188
	Offset: 0xE48
	Size: 0x90
	Parameters: 7
	Flags: Private
	Line Number: 264
*/
function private function_8f7352c2(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	level.var_32948a58[localClientNum] = newVal;
	function_607d2b62(localClientNum, level.var_12113d21[localClientNum], level.var_32948a58[localClientNum], level.var_6f4e5ea7[localClientNum]);
}

/*
	Name: function_564521c8
	Namespace: namespace_605a4f26
	Checksum: 0x647F7C13
	Offset: 0xEE0
	Size: 0xC8
	Parameters: 1
	Flags: Private
	Line Number: 280
*/
function private function_564521c8(localClientNum)
{
	self notify("hash_96c0f922");
	self endon("hash_96c0f922");
	self endon("entityshutdown");
	for(;;)
	{
		rounds = getRoundsPlayed(localClientNum);
		if(rounds != level.var_12113d21[localClientNum])
		{
			level.var_12113d21[localClientNum] = rounds;
			function_607d2b62(localClientNum, level.var_12113d21[localClientNum], level.var_32948a58[localClientNum], level.var_6f4e5ea7[localClientNum]);
		}
		wait(1);
	}
}

/*
	Name: function_8398acfa
	Namespace: namespace_605a4f26
	Checksum: 0x9F27BCAB
	Offset: 0xFB0
	Size: 0xE8
	Parameters: 1
	Flags: Private
	Line Number: 307
*/
function private function_8398acfa(localClientNum)
{
	self notify("hash_d8a61e4c");
	self endon("hash_d8a61e4c");
	self endon("entityshutdown");
	for(;;)
	{
		self waittill("powerup", powerup, state);
		if(powerup == "powerup_fire_sale")
		{
			if(state > 0)
			{
				state = 1;
			}
			if(state != level.var_6f4e5ea7[localClientNum])
			{
				level.var_6f4e5ea7[localClientNum] = state;
				function_607d2b62(localClientNum, level.var_12113d21[localClientNum], level.var_32948a58[localClientNum], level.var_6f4e5ea7[localClientNum]);
			}
		}
	}
}

/*
	Name: function_607d2b62
	Namespace: namespace_605a4f26
	Checksum: 0x4B70F8A0
	Offset: 0x10A0
	Size: 0x70
	Parameters: 4
	Flags: Private
	Line Number: 340
*/
function private function_607d2b62(localClientNum, rounds, buys, firesale)
{
	cost = function_501b186d(localClientNum, rounds, buys, firesale);
	function_1bfbfeb3(localClientNum, cost);
}

/*
	Name: function_501b186d
	Namespace: namespace_605a4f26
	Checksum: 0x7500D613
	Offset: 0x1118
	Size: 0x188
	Parameters: 4
	Flags: None
	Line Number: 356
*/
function function_501b186d(localClientNum, rounds, buys, firesale)
{
	var_f38dab22 = Int(floor(rounds / 10));
	var_f38dab22 = min(var_f38dab22, 10);
	if(firesale)
	{
		base_cost = 10;
		continue;
	}
	base_cost = 500;
	switch(buys)
	{
		case 0:
		{
			cost = base_cost;
			break;
		}
		case 1:
		{
			cost = Int(base_cost + 1000 * pow(2, var_f38dab22));
			break;
		}
		case 2:
		{
			cost = Int(500 + base_cost + 1000 * pow(2, var_f38dab22 + 1));
			break;
		}
		default
		{
			cost = 0;
			break;
		}
	}
	return cost;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_73486abc
	Namespace: namespace_605a4f26
	Checksum: 0x85DBF820
	Offset: 0x12A8
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 403
*/
function function_73486abc(localClientNum)
{
	var_1188f413 = self ZBarrierGetPiece(2);
	var_ecb5ee29 = self ZBarrierGetPiece(4);
	var_7a8e5bff = "tag_gumball_" + self.var_c9e64d65 + "_" + self.var_d277f374;
	var_1188f413 HidePart(localClientNum, "tag_gumballs", "p7_zm_zod_bubblegum_machine_lion_head_gumball", 1);
	var_1188f413 ShowPart(localClientNum, var_7a8e5bff, "p7_zm_zod_bubblegum_machine_lion_head_gumball", 1);
	var_79d407bf = Array("activated", "event", "rounds", "time");
	var_ecb5ee29 HidePart(localClientNum, "tag_gumballs", "p7_zm_zod_bubblegum_machine_gumballs_flying", 1);
	for(i = 0; i < 10; i++)
	{
		if(i == 0)
		{
			var_2e77599f = self.var_c9e64d65;
			continue;
		}
		var_2e77599f = Array::random(var_79d407bf);
		var_7a8e5bff = "tag_gumball_" + var_2e77599f + "_" + i;
		var_ecb5ee29 ShowPart(localClientNum, var_7a8e5bff, "p7_zm_zod_bubblegum_machine_gumballs_flying", 1);
	}
}

/*
	Name: function_1827796c
	Namespace: namespace_605a4f26
	Checksum: 0x5C692739
	Offset: 0x14A8
	Size: 0x170
	Parameters: 3
	Flags: None
	Line Number: 435
*/
function function_1827796c(localClientNum, var_c2e62333, fx_name)
{
	if(isdefined(self.fx_array[var_c2e62333]))
	{
		deletefx(localClientNum, self.fx_array[var_c2e62333]);
		self.fx_array[var_c2e62333] = undefined;
	}
	if(IsString(fx_name))
	{
		if(self.state == 5 || self.state == 6 || self.state == 4)
		{
			var_e001a740 = self ZBarrierGetPiece(1);
			continue;
		}
		switch(var_c2e62333)
		{
			case "tag_fx_light_lion_lft_eye_jnt":
			case "tag_fx_light_lion_rt_eye_jnt":
			{
				var_e001a740 = self ZBarrierGetPiece(2);
				break;
			}
			default
			{
				var_e001a740 = self ZBarrierGetPiece(5);
				break;
			}
		}
		self.fx_array[var_c2e62333] = PlayFXOnTag(localClientNum, fx_name, var_e001a740, var_c2e62333);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_479c7bd0
	Namespace: namespace_605a4f26
	Checksum: 0x7F9DFFC
	Offset: 0x1620
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 479
*/
function function_479c7bd0(localClientNum)
{
	foreach(FX in self.fx_array)
	{
		deletefx(localClientNum, FX);
	}
	self.fx_array = [];
}

/*
	Name: function_fd92b287
	Namespace: namespace_605a4f26
	Checksum: 0x389C7DAF
	Offset: 0x16D0
	Size: 0x920
	Parameters: 1
	Flags: None
	Line Number: 498
*/
function function_fd92b287(localClientNum)
{
	self notify("hash_2e43df5f");
	self endon("hash_2e43df5f");
	self function_479c7bd0(localClientNum);
	if(!isdefined(self.var_d4e76802))
	{
		var_e001a740 = self ZBarrierGetPiece(5);
		self.var_d4e76802 = PlayFXOnTag(localClientNum, "zombie/fx_bgb_machine_light_interior_zmb", var_e001a740, "tag_fx_glass_cntr_jnt");
	}
	while(1)
	{
		playsound(localClientNum, "zmb_bgb_machine_light_click", self.origin);
		self function_1827796c(localClientNum, "tag_fx_light_top_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_top_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_top_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		wait(0.75);
		self function_1827796c(localClientNum, "tag_fx_light_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", 0);
		wait(0.75);
		playsound(localClientNum, "zmb_bgb_machine_light_click", self.origin);
		self function_1827796c(localClientNum, "tag_fx_light_top_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_top_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_top_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		wait(0.75);
		self function_1827796c(localClientNum, "tag_fx_light_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", 0);
		wait(0.75);
		playsound(localClientNum, "zmb_bgb_machine_light_click", self.origin);
		self function_1827796c(localClientNum, "tag_fx_light_top_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		wait(0.5);
		playsound(localClientNum, "zmb_bgb_machine_light_click", self.origin);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		wait(0.5);
		playsound(localClientNum, "zmb_bgb_machine_light_click", self.origin);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_top_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_top_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		wait(0.5);
		playsound(localClientNum, "zmb_bgb_machine_light_click", self.origin);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		wait(0.5);
		playsound(localClientNum, "zmb_bgb_machine_light_click", self.origin);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		wait(0.5);
		self function_1827796c(localClientNum, "tag_fx_light_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", 0);
		wait(0.75);
	}
}

/*
	Name: function_cd0e3c3e
	Namespace: namespace_605a4f26
	Checksum: 0x1213A2FF
	Offset: 0x1FF8
	Size: 0x2B8
	Parameters: 1
	Flags: None
	Line Number: 590
*/
function function_cd0e3c3e(localClientNum)
{
	self notify("hash_2e43df5f");
	self endon("hash_2e43df5f");
	self function_479c7bd0(localClientNum);
	self function_73486abc(localClientNum);
	self function_1827796c(localClientNum, "tag_fx_glass_cntr_jnt", "zombie/fx_bgb_machine_flying_elec_zmb");
	while(1)
	{
		playsound(localClientNum, "zmb_bgb_machine_light_click", self.origin);
		self function_1827796c(localClientNum, "tag_fx_light_top_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_top_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_top_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", "zombie/fx_bgb_machine_bulb_available_zmb");
		wait(0.25);
		self function_1827796c(localClientNum, "tag_fx_light_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", 0);
		wait(0.25);
	}
}

/*
	Name: function_5b75a3b9
	Namespace: namespace_605a4f26
	Checksum: 0x73522854
	Offset: 0x22B8
	Size: 0x2C8
	Parameters: 1
	Flags: None
	Line Number: 629
*/
function function_5b75a3b9(localClientNum)
{
	self notify("hash_2e43df5f");
	self endon("hash_2e43df5f");
	self function_479c7bd0(localClientNum);
	self function_1827796c(localClientNum, "tag_fx_light_lion_lft_eye_jnt", self.var_709e1095);
	self function_1827796c(localClientNum, "tag_fx_light_lion_rt_eye_jnt", self.var_709e1095);
	while(1)
	{
		playsound(localClientNum, "zmb_bgb_machine_light_ready", self.origin);
		self function_1827796c(localClientNum, "tag_fx_light_top_jnt", self.var_297c9990);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_top_jnt", self.var_297c9990);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_top_jnt", self.var_297c9990);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", self.var_297c9990);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", self.var_297c9990);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", self.var_297c9990);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", self.var_297c9990);
		wait(0.5);
		self function_1827796c(localClientNum, "tag_fx_light_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", 0);
		wait(0.5);
	}
}

/*
	Name: function_bd7bc6a3
	Namespace: namespace_605a4f26
	Checksum: 0x58A9739E
	Offset: 0x2588
	Size: 0x1C0
	Parameters: 1
	Flags: None
	Line Number: 668
*/
function function_bd7bc6a3(localClientNum)
{
	self notify("hash_2e43df5f");
	self endon("hash_2e43df5f");
	self function_479c7bd0(localClientNum);
	if(!isdefined(self.var_20e9333f))
	{
		var_e001a740 = self ZBarrierGetPiece(1);
		self.var_20e9333f = PlayFXOnTag(localClientNum, "zombie/fx_bgb_machine_light_interior_away_zmb", var_e001a740, "tag_fx_glass_cntr_jnt");
	}
	self function_1827796c(localClientNum, "tag_fx_light_top_jnt", "zombie/fx_bgb_machine_bulb_away_zmb");
	self function_1827796c(localClientNum, "tag_fx_light_side_lft_top_jnt", "zombie/fx_bgb_machine_bulb_away_zmb");
	self function_1827796c(localClientNum, "tag_fx_light_side_rt_top_jnt", "zombie/fx_bgb_machine_bulb_away_zmb");
	self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", "zombie/fx_bgb_machine_bulb_away_zmb");
	self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", "zombie/fx_bgb_machine_bulb_away_zmb");
	self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", "zombie/fx_bgb_machine_bulb_away_zmb");
	self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", "zombie/fx_bgb_machine_bulb_away_zmb");
}

/*
	Name: function_c3056e53
	Namespace: namespace_605a4f26
	Checksum: 0x72697677
	Offset: 0x2750
	Size: 0x2E0
	Parameters: 1
	Flags: None
	Line Number: 697
*/
function function_c3056e53(localClientNum)
{
	self notify("hash_2e43df5f");
	self endon("hash_2e43df5f");
	self function_479c7bd0(localClientNum);
	self thread function_cb96bc29(localClientNum);
	self function_1827796c(localClientNum, "tag_fx_light_lion_lft_eye_jnt", "zombie/fx_bgb_machine_eye_away_zmb");
	self function_1827796c(localClientNum, "tag_fx_light_lion_rt_eye_jnt", "zombie/fx_bgb_machine_eye_away_zmb");
	while(1)
	{
		playsound(localClientNum, "zmb_bgb_machine_light_leaving", self.origin);
		self function_1827796c(localClientNum, "tag_fx_light_top_jnt", "zombie/fx_bgb_machine_bulb_away_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_top_jnt", "zombie/fx_bgb_machine_bulb_away_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_top_jnt", "zombie/fx_bgb_machine_bulb_away_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", "zombie/fx_bgb_machine_bulb_away_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", "zombie/fx_bgb_machine_bulb_away_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", "zombie/fx_bgb_machine_bulb_away_zmb");
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", "zombie/fx_bgb_machine_bulb_away_zmb");
		wait(0.5);
		self function_1827796c(localClientNum, "tag_fx_light_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_top_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_mid_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_mid_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_lft_btm_jnt", 0);
		self function_1827796c(localClientNum, "tag_fx_light_side_rt_btm_jnt", 0);
		wait(0.5);
	}
}

/*
	Name: function_cb96bc29
	Namespace: namespace_605a4f26
	Checksum: 0x2C1F9A3D
	Offset: 0x2A38
	Size: 0x144
	Parameters: 1
	Flags: None
	Line Number: 737
*/
function function_cb96bc29(localClientNum)
{
	wait(2.5);
	var_e001a740 = self ZBarrierGetPiece(1);
	self.fx_array["smoke"] = playFX(localClientNum, "zombie/fx_bgb_machine_smoke_zmb", self.origin, anglesToUp(self.angles), AnglesToRight(self.angles));
	self.fx_array["spark"] = PlayFXOnTag(localClientNum, "zombie/fx_bgb_machine_bulb_spark_zmb", var_e001a740, "tag_fx_light_side_lft_mid_jnt");
	if(self.state == 4)
	{
		self function_1827796c(localClientNum, "tag_fx_glass_cntr_jnt", "zombie/fx_bgb_machine_flying_embers_down_zmb");
		continue;
	}
	self function_1827796c(localClientNum, "tag_fx_glass_cntr_jnt", "zombie/fx_bgb_machine_flying_embers_up_zmb");
}

