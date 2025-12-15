#include scripts\shared\animation_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\zm\weaponsmoketrails;

#namespace namespace_3d0867a6;

/*
	Name: main
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x310
	Size: 0x80
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec main()
{
	if(!GetDvarInt("DontLoadDlls"))
	{
		util::REGISTER_SYSTEM("left_ges_event", &function_ef9fd31c);
		function_71cb201c();
		if(!IsSplitscreen())
		{
			level thread function_652d9fa9();
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4913c287
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x398
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function function_4913c287()
{
	while(1)
	{
		wait(0.001);
		if(GetDvarString("ges") != "")
		{
			GetLocalPlayer(0) thread function_ef9fd31c(0, GetDvarString("ges") + ",c_zom_zod_magician_mpc_fb,0");
			SetDvar("ges", "");
		}
	}
}

/*
	Name: function_ef9fd31c
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x448
	Size: 0x2A8
	Parameters: 2
	Flags: None
	Line Number: 65
*/
function function_ef9fd31c(localClientNum, event)
{
	if(event == "" || GetDvarInt("DontLoadDlls") != 0 || GetDvarInt("aaeoption_ges") != 0)
	{
		return;
	}
	if(IsSubStr(event, "tag"))
	{
		return;
	}
	player = GetLocalPlayer(localClientNum);
	if(player IsPlayerSprinting() || player isplayerwallrunning())
	{
		if(IsSubStr(event, "perk,") || IsSubStr(event, "revive"))
		{
			return;
		}
		else
		{
		}
	}
	if(event == "0")
	{
		level notify("left_hand_ges" + player GetEntityNumber());
		if(isdefined(level.var_ea266897))
		{
			level.var_ea266897 delete();
		}
		level.var_60e2e18d = 0;
		namespace_57a45b87::function_882a0a3c("j_shoulder_le", localClientNum);
		namespace_57a45b87::function_882a0a3c("tag_weapon_left", localClientNum);
		return;
	}
	event = StrTok(event, ",");
	if(event.size == 3)
	{
		player thread function_faae7792(localClientNum, function_df2199e1(event[0]), event[1], event[2]);
	}
	else if(event.size == 4)
	{
		player thread function_faae7792(localClientNum, function_df2199e1(event[0]), event[1], event[2], event[3]);
	}
}

/*
	Name: function_df2199e1
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x6F8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 119
*/
function function_df2199e1(event)
{
	if(isdefined(level.var_1d9b3b46[event]))
	{
		return level.var_1d9b3b46[event];
	}
	else
	{
		return level.var_1d9b3b46["pickup"];
	}
}

/*
	Name: function_faae7792
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x748
	Size: 0x578
	Parameters: 5
	Flags: None
	Line Number: 141
*/
function function_faae7792(localClientNum, event, body_model, var_8ac61c04, var_7f8b39c7)
{
	if(!isdefined(var_8ac61c04))
	{
		var_8ac61c04 = 0;
	}
	var_ceb67a88 = GetViewModel(body_model);
	if(var_ceb67a88 == "")
	{
		return;
	}
	if(isdefined(level.var_ea266897) && !var_8ac61c04)
	{
		return;
	}
	if(!isdefined(event))
	{
		return;
	}
	ent_num = self GetEntityNumber();
	level notify("left_hand_ges" + ent_num);
	level notify("new_left_hand_ges" + ent_num);
	level endon("left_hand_ges" + ent_num);
	if(isdefined(level.var_ea266897))
	{
		level.var_ea266897 delete();
	}
	namespace_57a45b87::function_c4a79bb7("j_shoulder_le", localClientNum);
	namespace_57a45b87::function_c4a79bb7("tag_weapon_left", localClientNum);
	level.var_60e2e18d = 1;
	level.var_ea266897 = spawn(localClientNum, GetCamPosByLocalClientNum(localClientNum), "script_model");
	level.var_ea266897.angles = GetCamAnglesByLocalClientNum(localClientNum);
	level.var_ea266897 SetModel(var_ceb67a88);
	level.var_ea266897 HidePart(localClientNum, "j_shoulder_ri", var_ceb67a88, 1);
	level.var_ea266897 thread function_dbebcdff(self, localClientNum, event.animation_time);
	if(isdefined(event.model) && event.model != "")
	{
		level.var_ea266897 Attach(event.model, event.var_7613a92c);
	}
	if(isdefined(var_7f8b39c7))
	{
		level.var_ea266897 Attach(var_7f8b39c7, "tag_weapon_right");
	}
	level.var_ea266897 useanimtree(-1);
	if(event.eventName == "perk" && self hasPerk(localClientNum, "specialty_fastequipmentuse"))
	{
		level.var_ea266897 SetAnimRestart(event.animation, 1, 0, 2);
	}
	else
	{
		level.var_ea266897 SetAnimRestart(event.animation, 1, 0, 1);
	}
	while(isdefined(level.var_ea266897) && isdefined(self))
	{
		level.var_ea266897.angles = GetCamAnglesByLocalClientNum(localClientNum);
		var_51b463b9 = level.var_5c2bb1a / 1000;
		eye = GetLocalClientEyePos(localClientNum);
		origin = eye + VectorScale((0, 0, 1), 0) + VectorScale(AnglesToForward(level.var_ea266897.angles), 0) + VectorScale(self getvelocity(), var_51b463b9);
		if(level.var_5c2bb1a > 40)
		{
			level.var_ea266897 moveto(origin, var_51b463b9);
		}
		else
		{
			level.var_ea266897.origin = origin;
		}
		if(IsThirdPerson(localClientNum))
		{
			level.var_ea266897 Hide();
		}
		else
		{
			level.var_ea266897 show();
		}
		wait(0.0001);
	}
	if(isdefined(level.var_ea266897))
	{
		level.var_ea266897 delete();
	}
	level.var_60e2e18d = 0;
	namespace_57a45b87::function_882a0a3c("j_shoulder_le", localClientNum);
	namespace_57a45b87::function_882a0a3c("tag_weapon_left", localClientNum);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dbebcdff
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0xCC8
	Size: 0x118
	Parameters: 3
	Flags: None
	Line Number: 238
*/
function function_dbebcdff(player, localClientNum, time)
{
	player endon("death");
	player endon("disconnect");
	player endon("entityshutdown");
	level endon("new_left_hand_ges" + player GetEntityNumber());
	endTime = GetTime() + time * 1000;
	while(endTime >= GetTime())
	{
		wait(0.001);
	}
	level.var_60e2e18d = 0;
	level endon("left_hand_ges" + player GetEntityNumber());
	namespace_57a45b87::function_882a0a3c("j_shoulder_le", localClientNum);
	namespace_57a45b87::function_882a0a3c("tag_weapon_left", localClientNum);
	self delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ecf844c
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0xDE8
	Size: 0xE8
	Parameters: 2
	Flags: None
	Line Number: 268
*/
function function_ecf844c(localClientNum, event)
{
	level notify("hash_ecf844c");
	level endon("hash_ecf844c");
	level.var_ea266897.Lerping = undefined;
	if(event.eventName == "perk" && self hasPerk(localClientNum, "specialty_fastequipmentuse"))
	{
		level.var_ea266897 SetAnimRestart(event.animation, 1, 0, 2);
	}
	else
	{
		level.var_ea266897 SetAnimRestart(event.animation, 1, 0, 1);
	}
}

/*
	Name: GetViewModel
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0xED8
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 293
*/
function GetViewModel(model)
{
	var_e6c1c40d = tableLookup("gamedata/tables/common/box_chance.csv", 35, model, 36);
	if(isdefined(var_e6c1c40d) && var_e6c1c40d != "")
	{
		return var_e6c1c40d;
	}
	return "c_zom_der_dempsey_viewhands";
}

/*
	Name: function_71cb201c
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0xF50
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 313
*/
function function_71cb201c()
{
	function_31878e5c("pickup", "vm_aae_left_pickup", 0.56);
	function_31878e5c("poweron", "vm_aae_poweron", 0.77);
	function_31878e5c("open_door", "vm_left_opendoor", 0.66);
	function_31878e5c("revive", "vm_left_revive", 3);
	function_31878e5c("revive_quick", "vm_left_revive_quick", 1.5);
	function_31878e5c("point_out", "vm_left_pointout", 0.86);
	function_31878e5c("perk", "vm_left_t8_perk_drink", 2.14);
	function_31878e5c("print", "vm_left_print", 0.76, "vm_printer", "tag_weapon_left");
}

/*
	Name: function_31878e5c
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x10B0
	Size: 0x108
	Parameters: 5
	Flags: None
	Line Number: 335
*/
function function_31878e5c(event, animation, animation_time, model, var_7613a92c)
{
	if(!isdefined(model))
	{
		model = "";
	}
	if(!isdefined(var_7613a92c))
	{
		var_7613a92c = "tag_weapon_right";
	}
	if(!isdefined(level.var_1d9b3b46))
	{
		level.var_1d9b3b46 = [];
	}
	struct = spawnstruct();
	struct.eventName = event;
	struct.animation = animation;
	struct.animation_time = animation_time;
	struct.model = model;
	struct.var_7613a92c = var_7613a92c;
	level.var_1d9b3b46[event] = struct;
	return;
}

/*
	Name: function_cd45cbb1
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x11C0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 369
*/
function function_cd45cbb1()
{
	return (GetDvarFloat("cg_gun_x"), GetDvarFloat("cg_gun_y"), GetDvarFloat("cg_gun_z"));
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_652d9fa9
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x1218
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 386
*/
function function_652d9fa9()
{
	for(;;)
	{
		wait(0.001);
		var_6d82b6ed = function_a330f1f();
		var_e91eb319 = function_cd45cbb1();
		if(var_e91eb319 == var_6d82b6ed && var_e91eb319 == (0, 0, 0))
		{
			while(var_6d82b6ed == (0, 0, 0))
			{
				var_6d82b6ed = function_a330f1f();
				wait(0.001);
			}
		}
		else if(!isdefined(level.var_f133a5f6))
		{
			level.var_f133a5f6 = 1;
			level thread function_f133a5f6(var_e91eb319, var_6d82b6ed, 150);
		}
	}
}

/*
	Name: function_a330f1f
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x12F8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 419
*/
function function_a330f1f()
{
	if(isdefined(level.var_60e2e18d) && level.var_60e2e18d && !IsADS(0))
	{
		return (-1.5, -2, -2.5);
	}
	return (0, 0, 0);
}

/*
	Name: function_f133a5f6
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x1350
	Size: 0x1E8
	Parameters: 3
	Flags: None
	Line Number: 438
*/
function function_f133a5f6(old_angles, var_6d82b6ed, time)
{
	level notify("hash_f133a5f6");
	level endon("hash_f133a5f6");
	var_78bc2c60 = GetTime();
	var_afc5c189 = var_78bc2c60 + time;
	start = var_78bc2c60;
	currentTime = var_78bc2c60;
	while(currentTime < var_afc5c189)
	{
		currentTime = GetTime();
		var_ba1acb30 = LerpVector(old_angles, var_6d82b6ed, currentTime - start / var_afc5c189 - start);
		if(isdefined(var_ba1acb30))
		{
			var_ba1acb30 = (Int(var_ba1acb30[0] * 1000) / 1000, Int(var_ba1acb30[1] * 1000) / 1000, Int(var_ba1acb30[2] * 1000) / 1000);
			SetDvar("cg_gun_x", var_ba1acb30[0]);
			SetDvar("cg_gun_y", var_ba1acb30[1]);
			SetDvar("cg_gun_z", var_ba1acb30[2]);
			wait(0.001);
			level.var_f133a5f6 = undefined;
		}
		else
		{
			wait(0.001);
		}
	}
}

