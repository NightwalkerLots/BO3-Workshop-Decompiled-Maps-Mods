#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm_bgb;

#namespace bgb_machine;

/*
	Name: __init__sytem__
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0xC60
	Size: 0x100
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	if(bgb::function_9ae7fa6d())
	{
		system::register("bgb_machine", &__init__, undefined, undefined);
	}
	else
	{
		var_2eb2aee2 = struct::get_array("bgb_machine_use", "targetname");
		foreach(bgb in var_2eb2aee2)
		{
			bgb delete();
		}
	}
}

/*
	Name: __init__
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0xD68
	Size: 0x5F0
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	clientfield::register("zbarrier", "zm_bgb_machine", 1, 1, "int", &function_62051f89, 0, 0);
	clientfield::register("zbarrier", "zm_bgb_machine_selection", 1, 8, "int", &function_3bb1978f, 1, 0);
	clientfield::register("zbarrier", "zm_bgb_machine_fx_state", 1, 3, "int", &function_f312291b, 0, 0);
	clientfield::register("zbarrier", "zm_bgb_machine_ghost_ball", 1, 1, "int", undefined, 0, 0);
	clientfield::register("toplayer", "zm_bgb_machine_round_buys", 10000, 3, "int", &function_27a93844, 0, 0);
	level.var_962d1590 = 0.016;
	level._effect["zm_bgb_machine_eye_away"] = "zombie/fx_bgb_machine_eye_away_zmb";
	level._effect["zm_bgb_machine_eye_activated"] = "zombie/fx_bgb_machine_eye_activated_zmb";
	level._effect["zm_bgb_machine_eye_event"] = "zombie/fx_bgb_machine_eye_event_zmb";
	level._effect["zm_bgb_machine_eye_rounds"] = "zombie/fx_bgb_machine_eye_rounds_zmb";
	level._effect["zm_bgb_machine_eye_time"] = "zombie/fx_bgb_machine_eye_time_zmb";
	level._effect["zm_bgb_machine_bulb_spark"] = "zombie/fx_bgb_machine_bulb_spark_zmb";
	level._effect["zm_bgb_machine_flying_elec"] = "zombie/fx_bgb_machine_flying_elec_zmb";
	level._effect["zm_bgb_machine_flying_embers_down"] = "zombie/fx_bgb_machine_flying_embers_down_zmb";
	level._effect["zm_bgb_machine_flying_embers_up"] = "zombie/fx_bgb_machine_flying_embers_up_zmb";
	level._effect["zm_bgb_machine_smoke"] = "zombie/fx_bgb_machine_smoke_zmb";
	level._effect["zm_bgb_machine_gumball_halo"] = "zombie/fx_bgb_machine_gumball_halo_zmb";
	level._effect["zm_bgb_machine_gumball_ghost"] = "zombie/fx_bgb_gumball_ghost_zmb";
	if(GetDvarString("mapname") == "zm_factory")
	{
		level._effect["zm_bgb_machine_available"] = "zombie/fx_bgb_machine_available_factory_zmb";
		level._effect["zm_bgb_machine_bulb_away"] = "zombie/fx_bgb_machine_bulb_away_factory_zmb";
		level._effect["zm_bgb_machine_bulb_available"] = "zombie/fx_bgb_machine_bulb_available_factory_zmb";
		level._effect["zm_bgb_machine_bulb_activated"] = "zombie/fx_bgb_machine_bulb_activated_factory_zmb";
		level._effect["zm_bgb_machine_bulb_event"] = "zombie/fx_bgb_machine_bulb_event_factory_zmb";
		level._effect["zm_bgb_machine_bulb_rounds"] = "zombie/fx_bgb_machine_bulb_rounds_factory_zmb";
		level._effect["zm_bgb_machine_bulb_time"] = "zombie/fx_bgb_machine_bulb_time_factory_zmb";
		level._effect["zm_bgb_machine_light_interior"] = "zombie/fx_bgb_machine_light_interior_zmb";
		level._effect["zm_bgb_machine_light_interior_away"] = "zombie/fx_bgb_machine_light_interior_away_zmb";
		level._effect["zm_bgb_machine_light_interior"] = "zombie/fx_bgb_machine_light_interior_factory_zmb";
		level._effect["zm_bgb_machine_light_interior_away"] = "zombie/fx_bgb_machine_light_interior_away_factory_zmb";
	}
	else
	{
		level._effect["zm_bgb_machine_available"] = "zombie/fx_bgb_machine_available_zmb";
		level._effect["zm_bgb_machine_bulb_away"] = "zombie/fx_bgb_machine_bulb_away_zmb";
		level._effect["zm_bgb_machine_bulb_available"] = "zombie/fx_bgb_machine_bulb_available_zmb";
		level._effect["zm_bgb_machine_bulb_activated"] = "zombie/fx_bgb_machine_bulb_activated_zmb";
		level._effect["zm_bgb_machine_bulb_event"] = "zombie/fx_bgb_machine_bulb_event_zmb";
		level._effect["zm_bgb_machine_bulb_rounds"] = "zombie/fx_bgb_machine_bulb_rounds_zmb";
		level._effect["zm_bgb_machine_bulb_time"] = "zombie/fx_bgb_machine_bulb_time_zmb";
		level._effect["zm_bgb_machine_light_interior"] = "zombie/fx_bgb_machine_light_interior_zmb";
		level._effect["zm_bgb_machine_light_interior_away"] = "zombie/fx_bgb_machine_light_interior_away_zmb";
	}
	function_b90b22b6();
	var_2eb2aee2 = struct::get_array("bgb_machine_use", "targetname");
	foreach(bgb in var_2eb2aee2)
	{
		bgb delete();
	}
}

/*
	Name: function_62051f89
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1360
	Size: 0x3D0
	Parameters: 7
	Flags: Private
	Line Number: 116
*/
function private function_62051f89(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(isdefined(self.var_16139ac9))
	{
		return;
	}
	if(!isdefined(level.bgb_machines))
	{
		level.bgb_machines = [];
	}
	Array::add(level.bgb_machines, self);
	var_962d1590 = level.var_962d1590;
	level.var_962d1590 = level.var_962d1590 + 0.016;
	WaitRealTime(var_962d1590);
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(level.var_10a6bc02))
	{
		pieceCount = self getnumzbarrierpieces();
		for(i = 0; i < pieceCount; i++)
		{
			piece = self ZBarrierGetPiece(i);
			ForceStreamXModel(piece.model);
		}
		level.var_10a6bc02 = 1;
	}
	self.var_16139ac9 = [];
	self.var_16139ac9["tag_origin"] = [];
	self.var_16139ac9["tag_fx_light_lion_lft_eye_jnt"] = [];
	self.var_16139ac9["tag_fx_light_lion_rt_eye_jnt"] = [];
	self.var_16139ac9["tag_fx_light_top_jnt"] = [];
	self.var_16139ac9["tag_fx_light_side_lft_top_jnt"] = [];
	self.var_16139ac9["tag_fx_light_side_lft_mid_jnt"] = [];
	self.var_16139ac9["tag_fx_light_side_lft_btm_jnt"] = [];
	self.var_16139ac9["tag_fx_light_side_rt_top_jnt"] = [];
	self.var_16139ac9["tag_fx_light_side_rt_mid_jnt"] = [];
	self.var_16139ac9["tag_fx_light_side_rt_btm_jnt"] = [];
	self.var_16139ac9["tag_fx_glass_cntr_jnt"] = [];
	self.var_16139ac9["tag_gumball_ghost"] = [];
	self.var_6860c69f = [];
	self.var_6860c69f[self.var_6860c69f.size] = "tag_fx_light_top_jnt";
	self.var_6860c69f[self.var_6860c69f.size] = "tag_fx_light_side_lft_top_jnt";
	self.var_6860c69f[self.var_6860c69f.size] = "tag_fx_light_side_lft_mid_jnt";
	self.var_6860c69f[self.var_6860c69f.size] = "tag_fx_light_side_lft_btm_jnt";
	self.var_6860c69f[self.var_6860c69f.size] = "tag_fx_light_side_rt_top_jnt";
	self.var_6860c69f[self.var_6860c69f.size] = "tag_fx_light_side_rt_mid_jnt";
	self.var_6860c69f[self.var_6860c69f.size] = "tag_fx_light_side_rt_btm_jnt";
	self thread function_7cf480af(localClientNum, "closing", level._effect["zm_bgb_machine_flying_embers_down"]);
	self thread function_7cf480af(localClientNum, "opening", level._effect["zm_bgb_machine_flying_embers_up"]);
	self thread function_25c29799(localClientNum);
	self thread function_f27e16f6(localClientNum);
	self thread function_3939ad2f(localClientNum);
}

/*
	Name: function_3bb1978f
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1738
	Size: 0x48
	Parameters: 7
	Flags: Private
	Line Number: 182
*/
function private function_3bb1978f(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(!newVal)
	{
		return;
	}
}

/*
	Name: function_8711c7b2
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1788
	Size: 0x100
	Parameters: 3
	Flags: Private
	Line Number: 200
*/
function private function_8711c7b2(localClientNum, FX, piece)
{
	piece endon("opened");
	piece endon("closed");
	self.var_6860c69f = Array::randomize(self.var_6860c69f);
	for(i = 0; i < self.var_6860c69f.size; i++)
	{
		if(randomIntRange(0, 4))
		{
			PlayFXOnTag(localClientNum, FX, piece, self.var_6860c69f[i]);
		}
		wait_time = RandomFloatRange(0, 0.2);
		if(wait_time)
		{
			WaitRealTime(wait_time);
		}
	}
}

/*
	Name: function_7cf480af
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1890
	Size: 0x170
	Parameters: 3
	Flags: Private
	Line Number: 229
*/
function private function_7cf480af(localClientNum, notifyname, FX)
{
	var_3af6034f = self ZBarrierGetPiece(3);
	fx_piece = self ZBarrierGetPiece(5);
	for(;;)
	{
		var_3af6034f waittill(notifyname);
		tag_angles = fx_piece GetTagAngles("tag_fx_glass_cntr_jnt");
		playFX(localClientNum, FX, fx_piece GetTagOrigin("tag_fx_glass_cntr_jnt"), AnglesToForward(tag_angles), anglesToUp(tag_angles));
		playFX(localClientNum, level._effect["zm_bgb_machine_smoke"], self.origin);
		self thread function_8711c7b2(localClientNum, level._effect["zm_bgb_machine_bulb_spark"], fx_piece);
		WaitRealTime(0.01);
	}
}

/*
	Name: function_25c29799
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1A08
	Size: 0x3A0
	Parameters: 1
	Flags: Private
	Line Number: 254
*/
function private function_25c29799(localClientNum)
{
	var_f3eb485b = self ZBarrierGetPiece(4);
	fx_piece = self ZBarrierGetPiece(5);
	for(;;)
	{
		function_5885778a(var_f3eb485b);
		if(!isdefined(self))
		{
			return;
		}
		if(!isdefined(var_f3eb485b))
		{
			var_f3eb485b = self ZBarrierGetPiece(4);
			fx_piece = self ZBarrierGetPiece(5);
		}
		var_286fd1ed = self clientfield::get("zm_bgb_machine_selection");
		bgb = level.var_318929eb[var_286fd1ed];
		if(!isdefined(bgb))
		{
		}
		else
		{
			self thread function_5f830538(localClientNum);
			PlayFXOnTag(localClientNum, level._effect["zm_bgb_machine_flying_elec"], fx_piece, "tag_fx_glass_cntr_jnt");
			var_f3eb485b HidePart(localClientNum, "tag_gumballs", "", 1);
			var_98ba48a2 = [];
			for(i = 0; i < level.var_98ba48a2[localClientNum].size; i++)
			{
				if(bgb == level.var_98ba48a2[localClientNum][i])
				{
					continue;
				}
				var_98ba48a2[var_98ba48a2.size] = level.var_98ba48a2[localClientNum][i];
			}
			for(i = 0; i < level.var_98ba48a2[localClientNum].size; i++)
			{
				var_98ba48a2[var_98ba48a2.size] = level.var_98ba48a2[localClientNum][i];
			}
			if(GetDvarInt("tfoption_bgb_loadout") == 1)
			{
				var_98ba48a2 = [];
				var_98ba48a2[var_98ba48a2.size] = "zm_bgb_shopping_free";
				var_98ba48a2[var_98ba48a2.size] = "zm_bgb_perkaholic";
				var_98ba48a2[var_98ba48a2.size] = "zm_bgb_near_death_experience";
				var_98ba48a2[var_98ba48a2.size] = "zm_bgb_reign_drops";
				var_98ba48a2[var_98ba48a2.size] = "zm_bgb_newtonian_negation";
			}
			var_98ba48a2 = Array::randomize(var_98ba48a2);
			Array::push_front(var_98ba48a2, bgb);
			for(i = 0; i < 10; i++)
			{
				var_f3eb485b ShowPart(localClientNum, level.bgb[var_98ba48a2[i]].var_d3c80142 + "_" + i);
			}
			WaitRealTime(0.01);
		}
	}
}

/*
	Name: function_5885778a
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1DB0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 323
*/
function function_5885778a(piece)
{
	level endon("demo_jump");
	piece util::waittill_any("opening", "closing");
}

/*
	Name: function_f27e16f6
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1DF8
	Size: 0x180
	Parameters: 1
	Flags: Private
	Line Number: 339
*/
function private function_f27e16f6(localClientNum)
{
	piece = self ZBarrierGetPiece(2);
	while(isdefined(self))
	{
		function_36a807de(piece);
		if(!isdefined(self))
		{
			return;
		}
		if(!isdefined(piece))
		{
			piece = self ZBarrierGetPiece(2);
		}
		var_286fd1ed = self clientfield::get("zm_bgb_machine_selection");
		bgb = level.var_318929eb[var_286fd1ed];
		if(!isdefined(bgb))
		{
			continue;
		}
		piece HidePart(localClientNum, "tag_gumballs", "", 1);
		if(self clientfield::get("zm_bgb_machine_ghost_ball"))
		{
			piece ShowPart(localClientNum, "tag_gumball_ghost");
		}
		else
		{
			piece ShowPart(localClientNum, level.bgb[bgb].var_ece14434);
		}
		WaitRealTime(0.01);
	}
}

/*
	Name: function_36a807de
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1F80
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 382
*/
function function_36a807de(piece)
{
	level endon("demo_jump");
	piece waittill("opening");
}

/*
	Name: function_3939ad2f
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x1FB0
	Size: 0x78
	Parameters: 1
	Flags: Private
	Line Number: 398
*/
function private function_3939ad2f(localClientNum)
{
	piece = self ZBarrierGetPiece(1);
	for(;;)
	{
		piece waittill("opening");
		function_42630d5e(localClientNum, piece, "tag_fx_glass_cntr_jnt", level._effect["zm_bgb_machine_light_interior"]);
		WaitRealTime(0.01);
	}
}

/*
	Name: function_9b51ab0
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2030
	Size: 0xE8
	Parameters: 0
	Flags: Private
	Line Number: 419
*/
function private function_9b51ab0()
{
	var_286fd1ed = self clientfield::get("zm_bgb_machine_selection");
	bgb = level.var_318929eb[var_286fd1ed];
	switch(level.bgb[bgb].var_c9e64d65)
	{
		case "activated":
		{
			return level._effect["zm_bgb_machine_eye_activated"];
		}
		case "event":
		{
			return level._effect["zm_bgb_machine_eye_event"];
		}
		case "rounds":
		{
			return level._effect["zm_bgb_machine_eye_rounds"];
		}
		case "time":
		{
			return level._effect["zm_bgb_machine_eye_time"];
		}
	}
	return undefined;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_43d950d2
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2120
	Size: 0xE8
	Parameters: 0
	Flags: Private
	Line Number: 456
*/
function private function_43d950d2()
{
	var_286fd1ed = self clientfield::get("zm_bgb_machine_selection");
	bgb = level.var_318929eb[var_286fd1ed];
	switch(level.bgb[bgb].var_c9e64d65)
	{
		case "activated":
		{
			return level._effect["zm_bgb_machine_bulb_activated"];
		}
		case "event":
		{
			return level._effect["zm_bgb_machine_bulb_event"];
		}
		case "rounds":
		{
			return level._effect["zm_bgb_machine_bulb_rounds"];
		}
		case "time":
		{
			return level._effect["zm_bgb_machine_bulb_time"];
		}
	}
	return undefined;
}

/*
	Name: function_42630d5e
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2210
	Size: 0xD8
	Parameters: 5
	Flags: Private
	Line Number: 492
*/
function private function_42630d5e(localClientNum, piece, tag, FX, deleteImmediate)
{
	if(!isdefined(deleteImmediate))
	{
		deleteImmediate = 1;
	}
	if(isdefined(self.var_16139ac9[tag][localClientNum]))
	{
		deletefx(localClientNum, self.var_16139ac9[tag][localClientNum], deleteImmediate);
		self.var_16139ac9[tag][localClientNum] = undefined;
	}
	if(isdefined(FX))
	{
		self.var_16139ac9[tag][localClientNum] = PlayFXOnTag(localClientNum, FX, piece, tag);
	}
}

/*
	Name: function_e5bc89d2
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x22F0
	Size: 0x48
	Parameters: 3
	Flags: Private
	Line Number: 519
*/
function private function_e5bc89d2(localClientNum, piece, FX)
{
	function_42630d5e(localClientNum, piece, "tag_fx_light_top_jnt", FX);
}

/*
	Name: function_cb90ea4e
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2340
	Size: 0x70
	Parameters: 3
	Flags: Private
	Line Number: 534
*/
function private function_cb90ea4e(localClientNum, piece, FX)
{
	function_42630d5e(localClientNum, piece, "tag_fx_light_side_lft_top_jnt", FX);
	function_42630d5e(localClientNum, piece, "tag_fx_light_side_rt_top_jnt", FX);
}

/*
	Name: function_47c2c4a1
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x23B8
	Size: 0x70
	Parameters: 3
	Flags: Private
	Line Number: 550
*/
function private function_47c2c4a1(localClientNum, piece, FX)
{
	function_42630d5e(localClientNum, piece, "tag_fx_light_side_lft_mid_jnt", FX);
	function_42630d5e(localClientNum, piece, "tag_fx_light_side_rt_mid_jnt", FX);
}

/*
	Name: function_3c131c80
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2430
	Size: 0x70
	Parameters: 3
	Flags: Private
	Line Number: 566
*/
function private function_3c131c80(localClientNum, piece, FX)
{
	function_42630d5e(localClientNum, piece, "tag_fx_light_side_lft_btm_jnt", FX);
	function_42630d5e(localClientNum, piece, "tag_fx_light_side_rt_btm_jnt", FX);
}

/*
	Name: function_38aeb872
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x24A8
	Size: 0xA0
	Parameters: 3
	Flags: Private
	Line Number: 582
*/
function private function_38aeb872(localClientNum, piece, FX)
{
	function_e5bc89d2(localClientNum, piece, FX);
	function_cb90ea4e(localClientNum, piece, FX);
	function_47c2c4a1(localClientNum, piece, FX);
	function_3c131c80(localClientNum, piece, FX);
	return;
}

/*
	Name: function_8bca2811
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2550
	Size: 0x68
	Parameters: 3
	Flags: Private
	Line Number: 601
*/
function private function_8bca2811(localClientNum, entity, alias)
{
	origin = entity GetTagOrigin("tag_fx_light_top_jnt");
	playsound(localClientNum, alias, origin);
}

/*
	Name: function_d5f882d0
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x25C0
	Size: 0x48
	Parameters: 1
	Flags: Private
	Line Number: 617
*/
function private function_d5f882d0(localClientNum)
{
	self function_42630d5e(localClientNum, self ZBarrierGetPiece(5), "tag_origin", undefined);
	return;
}

/*
	Name: function_eb5b80c5
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2610
	Size: 0xA8
	Parameters: 1
	Flags: Private
	Line Number: 633
*/
function private function_eb5b80c5(localClientNum)
{
	self notify("hash_fff2ccd6");
	self endon("hash_fff2ccd6");
	self function_38aeb872(localClientNum, self ZBarrierGetPiece(5), undefined);
	self function_42630d5e(localClientNum, self ZBarrierGetPiece(5), "tag_origin", level._effect["zm_bgb_machine_available"]);
	return;
}

/*
	Name: function_63a14f25
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x26C0
	Size: 0xD0
	Parameters: 5
	Flags: Private
	Line Number: 652
*/
function private function_63a14f25(localClientNum, piece, FX, flash_time, alias)
{
	self notify("hash_fff2ccd6");
	self endon("hash_fff2ccd6");
	function_d5f882d0(localClientNum);
	for(;;)
	{
		function_38aeb872(localClientNum, piece, FX);
		if(isdefined(alias))
		{
			function_8bca2811(localClientNum, piece, alias);
		}
		WaitRealTime(flash_time);
		function_38aeb872(localClientNum, piece, undefined);
		WaitRealTime(flash_time);
	}
}

/*
	Name: function_d0281a17
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2798
	Size: 0x68
	Parameters: 1
	Flags: Private
	Line Number: 680
*/
function private function_d0281a17(localClientNum)
{
	self thread function_63a14f25(localClientNum, self ZBarrierGetPiece(5), self function_43d950d2(), 0.4, "zmb_bgb_machine_light_ready");
}

/*
	Name: function_5f830538
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2808
	Size: 0x68
	Parameters: 1
	Flags: Private
	Line Number: 695
*/
function private function_5f830538(localClientNum)
{
	self thread function_63a14f25(localClientNum, self ZBarrierGetPiece(5), level._effect["zm_bgb_machine_bulb_available"], 0.2, "zmb_bgb_machine_light_click");
}

/*
	Name: function_9e064c6
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2878
	Size: 0x68
	Parameters: 1
	Flags: Private
	Line Number: 710
*/
function private function_9e064c6(localClientNum)
{
	self thread function_63a14f25(localClientNum, self ZBarrierGetPiece(1), level._effect["zm_bgb_machine_bulb_away"], 0.4, "zmb_bgb_machine_light_leaving");
}

/*
	Name: function_dec3df0b
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x28E8
	Size: 0x78
	Parameters: 1
	Flags: Private
	Line Number: 725
*/
function private function_dec3df0b(localClientNum)
{
	self notify("hash_fff2ccd6");
	function_d5f882d0(localClientNum);
	function_38aeb872(localClientNum, self ZBarrierGetPiece(5), level._effect["zm_bgb_machine_bulb_away"]);
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_f312291b
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2968
	Size: 0x390
	Parameters: 7
	Flags: Private
	Line Number: 745
*/
function private function_f312291b(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	function_62051f89(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump);
	if(!isdefined(self))
	{
		return;
	}
	var_d6b4bc51 = undefined;
	var_56e169c3 = undefined;
	switch(newVal)
	{
		case 1:
		{
			function_42630d5e(localClientNum, self ZBarrierGetPiece(5), "tag_fx_glass_cntr_jnt", level._effect["zm_bgb_machine_light_interior_away"]);
			self thread function_dec3df0b(localClientNum);
			break;
		}
		case 2:
		{
			var_d6b4bc51 = level._effect["zm_bgb_machine_eye_away"];
			var_5324e4f7 = self ZBarrierGetPiece(1);
			self thread function_9e064c6(localClientNum);
			break;
		}
		case 3:
		{
			var_56e169c3 = level._effect["zm_bgb_machine_light_interior"];
			var_5c057e0d = self ZBarrierGetPiece(5);
			var_d6b4bc51 = function_9b51ab0();
			var_5324e4f7 = self ZBarrierGetPiece(2);
			self thread function_d0281a17(localClientNum);
			if(self clientfield::get("zm_bgb_machine_ghost_ball"))
			{
				function_42630d5e(localClientNum, var_5324e4f7, "tag_gumball_ghost", level._effect["zm_bgb_machine_gumball_ghost"]);
			}
			else
			{
				function_42630d5e(localClientNum, var_5324e4f7, "tag_gumball_ghost", level._effect["zm_bgb_machine_gumball_halo"]);
				break;
			}
		}
		case 4:
		{
			function_42630d5e(localClientNum, self ZBarrierGetPiece(5), "tag_fx_glass_cntr_jnt", level._effect["zm_bgb_machine_light_interior"]);
			self thread function_eb5b80c5(localClientNum);
			var_58d675a8 = self ZBarrierGetPiece(2);
			function_42630d5e(localClientNum, var_58d675a8, "tag_gumball_ghost", undefined, 0);
			break;
		}
	}
	function_42630d5e(localClientNum, var_5324e4f7, "tag_fx_light_lion_lft_eye_jnt", var_d6b4bc51);
	function_42630d5e(localClientNum, var_5324e4f7, "tag_fx_light_lion_rt_eye_jnt", var_d6b4bc51);
}

/*
	Name: function_b90b22b6
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2D00
	Size: 0x2A8
	Parameters: 0
	Flags: None
	Line Number: 809
*/
function function_b90b22b6()
{
	if(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver") && GetDvarString("tfoption_bgb_use") != "" && GetDvarString("tfoption_bgb_use") != "0")
	{
		switch(GetDvarInt("tfoption_bgb_use"))
		{
			case 1:
			{
				level.var_6cb6a683 = 5;
				break;
			}
			case 2:
			{
				level.var_6cb6a683 = 10;
				break;
			}
			case 3:
			{
				level.var_6cb6a683 = 1000;
				break;
			}
			default
			{
				if(!isdefined(level.var_6cb6a683))
				{
					level.var_6cb6a683 = 3;
					break;
				}
			}
		}
	}
	else if(!isdefined(level.var_6cb6a683))
	{
		level.var_6cb6a683 = 3;
	}
	if(!isdefined(level.var_f02c5598))
	{
		level.var_f02c5598 = 1000;
	}
	if(!isdefined(level.var_e1dee7ba))
	{
		level.var_e1dee7ba = 10;
	}
	if(!isdefined(level.var_a3e3127d))
	{
		level.var_a3e3127d = 2;
	}
	if(!isdefined(level.var_8ef45dc2))
	{
		level.var_8ef45dc2 = 10;
	}
	if(!isdefined(level.var_1485dcdc))
	{
		level.var_1485dcdc = 2;
	}
	if(!isdefined(level.var_bb2b3f61))
	{
		level.var_bb2b3f61 = [];
	}
	if(!isdefined(level.var_32948a58))
	{
		level.var_32948a58 = [];
	}
	if(!isdefined(level.var_f26edb66))
	{
		level.var_f26edb66 = [];
	}
	if(GetDvarInt("tfoption_pregum"))
	{
		level.var_6cb6a683 = 1;
		level.var_d776839c = 3;
		level.var_d453a2ed = 0;
	}
	if(!isdefined(level.var_6c7a96b4))
	{
		level.var_6c7a96b4 = &function_6c7a96b4;
	}
	callback::on_localplayer_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x2FB0
	Size: 0x100
	Parameters: 1
	Flags: Private
	Line Number: 899
*/
function private on_player_spawned(localClientNum)
{
	if(!isdefined(level.var_bb2b3f61[localClientNum]))
	{
		level.var_bb2b3f61[localClientNum] = 0;
	}
	if(!isdefined(level.var_32948a58[localClientNum]))
	{
		level.var_32948a58[localClientNum] = 0;
	}
	if(!isdefined(level.var_f26edb66[localClientNum]))
	{
		level.var_f26edb66[localClientNum] = 0;
	}
	function_725214c(localClientNum, level.var_bb2b3f61[localClientNum], level.var_32948a58[localClientNum], level.var_f26edb66[localClientNum]);
	self thread function_763ef0fd(localClientNum);
	self thread function_5d9d13da(localClientNum);
	self thread function_fda54943(localClientNum);
}

/*
	Name: function_763ef0fd
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x30B8
	Size: 0xD0
	Parameters: 1
	Flags: Private
	Line Number: 929
*/
function private function_763ef0fd(localClientNum)
{
	self notify("hash_763ef0fd");
	self endon("hash_763ef0fd");
	self endon("entityshutdown");
	while(1)
	{
		rounds = getRoundsPlayed(localClientNum);
		if(rounds != level.var_bb2b3f61[localClientNum])
		{
			level.var_bb2b3f61[localClientNum] = rounds;
			function_725214c(localClientNum, level.var_bb2b3f61[localClientNum], level.var_32948a58[localClientNum], level.var_f26edb66[localClientNum]);
		}
		WaitRealTime(1);
	}
}

/*
	Name: function_5d9d13da
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x3190
	Size: 0xC0
	Parameters: 1
	Flags: Private
	Line Number: 956
*/
function private function_5d9d13da(localClientNum)
{
	self notify("hash_5d9d13da");
	self endon("hash_5d9d13da");
	self endon("entityshutdown");
	while(1)
	{
		self waittill("powerup", powerup, state);
		if(powerup == "powerup_fire_sale")
		{
			level.var_f26edb66[localClientNum] = state;
			function_725214c(localClientNum, level.var_bb2b3f61[localClientNum], level.var_32948a58[localClientNum], level.var_f26edb66[localClientNum]);
		}
	}
}

/*
	Name: function_fda54943
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x3258
	Size: 0x170
	Parameters: 1
	Flags: Private
	Line Number: 982
*/
function private function_fda54943(localClientNum)
{
	self endon("entityshutdown");
	var_89caac36 = 160000;
	while(1)
	{
		if(isdefined(level.bgb_machines))
		{
			foreach(machine in level.bgb_machines)
			{
				if(DistanceSquared(self.origin, machine.origin) <= var_89caac36 && 96 > Abs(self.origin[2] - machine.origin[2]))
				{
					WaitRealTime(randomIntRange(1, 4));
					machine playsound(localClientNum, "zmb_bgb_lionhead_roar");
					WaitRealTime(130);
					break;
				}
			}
		}
		WaitRealTime(1);
	}
}

/*
	Name: function_27a93844
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x33D0
	Size: 0x90
	Parameters: 7
	Flags: Private
	Line Number: 1015
*/
function private function_27a93844(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	level.var_32948a58[localClientNum] = newVal;
	function_725214c(localClientNum, level.var_bb2b3f61[localClientNum], level.var_32948a58[localClientNum], level.var_f26edb66[localClientNum]);
}

/*
	Name: function_725214c
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x3468
	Size: 0x90
	Parameters: 4
	Flags: Private
	Line Number: 1031
*/
function private function_725214c(localClientNum, rounds, buys, firesale)
{
	base_cost = 500;
	if(firesale)
	{
		base_cost = 10;
	}
	cost = [[level.var_6c7a96b4]](self, base_cost, buys, rounds, firesale);
	function_1bfbfeb3(localClientNum, cost);
}

/*
	Name: function_6c7a96b4
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x3500
	Size: 0x3D0
	Parameters: 5
	Flags: None
	Line Number: 1052
*/
function function_6c7a96b4(player, base_cost, buys, rounds, firesale)
{
	if(GetDvarInt("tfoption_pregum"))
	{
		return function_d3ca0a2f();
	}
	if(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver"))
	{
		if(GetDvarInt("tfoption_fixed_cost"))
		{
			if(GetDvarInt("scr_firstgumfree") == 1 && !GetDvarInt("tfoption_bgb_cost"))
			{
				return 0;
			}
			else
			{
				return function_d3ca0a2f();
			}
		}
		else if(buys < 1)
		{
			if(GetDvarInt("scr_firstgumfree") == 1 && !GetDvarInt("tfoption_bgb_cost"))
			{
				return 0;
			}
			else
			{
				return function_d3ca0a2f();
			}
		}
	}
	else if(buys < 1 && GetDvarInt("scr_firstGumFree") === 1)
	{
		return 0;
	}
	if(GetDvarInt("tfoption_bgb_cost") == 2 || GetDvarInt("tfoption_bgb_cost") == 3 || GetDvarInt("tfoption_bgb_cost") == 4)
	{
		base_cost = function_d3ca0a2f();
	}
	if(!isdefined(level.var_f02c5598))
	{
		level.var_f02c5598 = 1000;
	}
	if(!isdefined(level.var_e1dee7ba))
	{
		level.var_e1dee7ba = 10;
	}
	if(!isdefined(level.var_1485dcdc))
	{
		level.var_1485dcdc = 2;
	}
	cost = function_d3ca0a2f();
	if(buys >= 1)
	{
		var_33ea806b = floor(rounds / level.var_e1dee7ba);
		var_33ea806b = math::clamp(var_33ea806b, 0, level.var_8ef45dc2);
		var_39a90c5a = pow(level.var_a3e3127d, var_33ea806b);
		cost = cost + level.var_f02c5598 * var_39a90c5a;
	}
	if(buys >= 2)
	{
		cost = cost * level.var_1485dcdc;
	}
	cost = Int(cost);
	if(function_d3ca0a2f() != base_cost)
	{
		cost = cost - function_d3ca0a2f() - base_cost;
	}
	return cost;
}

/*
	Name: function_d3ca0a2f
	Namespace: bgb_machine
	Checksum: 0x424F4353
	Offset: 0x38D8
	Size: 0x18A
	Parameters: 0
	Flags: None
	Line Number: 1133
*/
function function_d3ca0a2f()
{
	cost = 500;
	if(GetDvarString("tfoption_master_ver") != "" && GetDvarInt("tfoption_tf_enabled") == GetDvarInt("tfoption_master_ver") && GetDvarString("tfoption_bgb_cost") != "0")
	{
		switch(GetDvarInt("tfoption_bgb_cost"))
		{
			case 0:
			{
				cost = 500;
				break;
			}
			case 1:
			{
				cost = 500;
				break;
			}
			case 2:
			{
				cost = 1000;
				break;
			}
			case 3:
			{
				cost = 1500;
				break;
			}
			case 4:
			{
				cost = 2000;
				break;
			}
			case 5:
			{
				if(GetDvarInt("tfoption_pregum"))
				{
					cost = 0;
				}
				else
				{
					cost = 500;
					break;
				}
			}
			default
			{
				cost = 500;
				break;
			}
		}
	}
	return cost;
}

