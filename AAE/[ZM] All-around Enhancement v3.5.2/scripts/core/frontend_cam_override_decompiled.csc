#include scripts\codescripts\struct;
#include scripts\shared\_character_customization;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;

#namespace namespace_17578f14;

/*
	Name: function_1a350cd6
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x528
	Size: 0x40
	Parameters: 7
	Flags: None
	Line Number: 22
*/
function function_1a350cd6(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
}

/*
	Name: function_3dcac2e2
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x570
	Size: 0x40
	Parameters: 7
	Flags: None
	Line Number: 36
*/
function function_3dcac2e2(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
}

/*
	Name: function_d1af713
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x5B8
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 50
*/
function function_d1af713(hint, data_struct)
{
	if(isdefined(hint))
	{
		function_7162fc11(0, hint);
	}
	else
	{
		function_19546a18(0);
	}
	level notify("hash_d1af713", data_struct);
}

/*
	Name: function_19f2b8a3
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x620
	Size: 0x128
	Parameters: 3
	Flags: None
	Line Number: 73
*/
function function_19f2b8a3(localClientNum, data_struct, changed)
{
	fields = GetCharacterFields(data_struct.characterindex, 1);
	if(isdefined(fields) && isdefined(fields.var_d0ff12a0) && isdefined(fields.var_4998666a))
	{
		if(isdefined(fields.var_92636759))
		{
			function_d1af713(fields.var_92636759, data_struct);
		}
		position = struct::get(fields.var_d0ff12a0);
		PlayMainCamXCam(localClientNum, fields.var_4998666a, 0, "", "", position.origin, position.angles);
	}
}

/*
	Name: function_fb006449
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x750
	Size: 0xA18
	Parameters: 1
	Flags: None
	Line Number: 97
*/
function function_fb006449(localClientNum)
{
	level endon("hash_22b30258");
	while(1)
	{
		var_ab91e00d = GetDvarString("ui_mapname");
		if(util::is_safehouse(var_ab91e00d))
		{
			var_74cfff2 = var_ab91e00d;
		}
		else
		{
			var_74cfff2 = util::get_next_safehouse(var_ab91e00d);
		}
		var_74cfff2 = GetSubStr(var_74cfff2, "cp_sh_".size);
		level.var_8ab87915 = [];
		if(!isdefined(level.var_8ab87915))
		{
			level.var_8ab87915 = [];
		}
		else if(!IsArray(level.var_8ab87915))
		{
			level.var_8ab87915 = Array(level.var_8ab87915);
		}
		level.var_8ab87915[level.var_8ab87915.size] = "cp_cac_cp_lobby_idle_" + var_74cfff2;
		if(!isdefined(level.var_8ab87915))
		{
			level.var_8ab87915 = [];
		}
		else if(!IsArray(level.var_8ab87915))
		{
			level.var_8ab87915 = Array(level.var_8ab87915);
		}
		level.var_8ab87915[level.var_8ab87915.size] = "cin_fe_cp_bunk_vign_smoke_read_" + var_74cfff2;
		if(!isdefined(level.var_8ab87915))
		{
			level.var_8ab87915 = [];
		}
		else if(!IsArray(level.var_8ab87915))
		{
			level.var_8ab87915 = Array(level.var_8ab87915);
		}
		level.var_8ab87915[level.var_8ab87915.size] = "cin_fe_cp_desk_vign_work_" + var_74cfff2;
		if(!isdefined(level.var_8ab87915))
		{
			level.var_8ab87915 = [];
		}
		else if(!IsArray(level.var_8ab87915))
		{
			level.var_8ab87915 = Array(level.var_8ab87915);
		}
		level.var_8ab87915[level.var_8ab87915.size] = "cin_fe_cp_desk_vign_type_" + var_74cfff2;
		if(isdefined(level.var_67da5b39))
		{
			for(i = 0; i < level.var_67da5b39.size; i++)
			{
				KillRadiantExploder(0, level.var_67da5b39[i]);
			}
		}
		level.var_67da5b39 = [];
		if(!isdefined(level.var_67da5b39))
		{
			level.var_67da5b39 = [];
		}
		else if(!IsArray(level.var_67da5b39))
		{
			level.var_67da5b39 = Array(level.var_67da5b39);
		}
		level.var_67da5b39[level.var_67da5b39.size] = "cp_frontend_idle";
		if(!isdefined(level.var_67da5b39))
		{
			level.var_67da5b39 = [];
		}
		else if(!IsArray(level.var_67da5b39))
		{
			level.var_67da5b39 = Array(level.var_67da5b39);
		}
		level.var_67da5b39[level.var_67da5b39.size] = "cp_frontend_read";
		if(!isdefined(level.var_67da5b39))
		{
			level.var_67da5b39 = [];
		}
		else if(!IsArray(level.var_67da5b39))
		{
			level.var_67da5b39 = Array(level.var_67da5b39);
		}
		level.var_67da5b39[level.var_67da5b39.size] = "cp_frontend_work";
		if(!isdefined(level.var_67da5b39))
		{
			level.var_67da5b39 = [];
		}
		else if(!IsArray(level.var_67da5b39))
		{
			level.var_67da5b39 = Array(level.var_67da5b39);
		}
		level.var_67da5b39[level.var_67da5b39.size] = "cp_frontend_type";
		level.var_3bb399f9 = [];
		if(!isdefined(level.var_3bb399f9))
		{
			level.var_3bb399f9 = [];
		}
		else if(!IsArray(level.var_3bb399f9))
		{
			level.var_3bb399f9 = Array(level.var_3bb399f9);
		}
		level.var_3bb399f9[level.var_3bb399f9.size] = "cp_frontend_idle";
		if(!isdefined(level.var_3bb399f9))
		{
			level.var_3bb399f9 = [];
		}
		else if(!IsArray(level.var_3bb399f9))
		{
			level.var_3bb399f9 = Array(level.var_3bb399f9);
		}
		level.var_3bb399f9[level.var_3bb399f9.size] = "cp_frontend_read";
		if(!isdefined(level.var_3bb399f9))
		{
			level.var_3bb399f9 = [];
		}
		else if(!IsArray(level.var_3bb399f9))
		{
			level.var_3bb399f9 = Array(level.var_3bb399f9);
		}
		level.var_3bb399f9[level.var_3bb399f9.size] = "cp_frontend_work";
		if(!isdefined(level.var_3bb399f9))
		{
			level.var_3bb399f9 = [];
		}
		else if(!IsArray(level.var_3bb399f9))
		{
			level.var_3bb399f9 = Array(level.var_3bb399f9);
		}
		level.var_3bb399f9[level.var_3bb399f9.size] = "cp_frontend_type";
		if(!isdefined(level.var_f31ebae4))
		{
			if(level clientfield::get("first_time_flow"))
			{
				level.var_f31ebae4 = 0;
			}
			else if(level clientfield::get("cp_bunk_anim_type") == 0)
			{
				level.var_f31ebae4 = randomIntRange(0, 2);
			}
			else if(level clientfield::get("cp_bunk_anim_type") == 1)
			{
				level.var_f31ebae4 = randomIntRange(2, 4);
			}
		}
		s_scene = struct::get_script_bundle("scene", level.var_8ab87915[level.var_f31ebae4]);
		str_gender = GetHeroGender(GetEquippedHeroIndex(localClientNum, 2), "cp");
		if(str_gender === "female" && isdefined(s_scene.FemaleBundle))
		{
			s_scene = struct::get_script_bundle("scene", s_scene.FemaleBundle);
		}
		s_align = struct::get(s_scene.aligntarget, "targetname");
		PlayMainCamXCam(localClientNum, s_scene.cameraswitcher, 0, "", "", s_align.origin, s_align.angles);
		for(i = 0; i < level.var_8ab87915.size; i++)
		{
			if(i == level.var_f31ebae4)
			{
				PlayRadiantExploder(0, level.var_67da5b39[i]);
				continue;
			}
			KillRadiantExploder(0, level.var_67da5b39[i]);
		}
		var_d4457625 = spawnstruct();
		var_d4457625.scene = s_scene.name;
		var_d4457625.sessionMode = 2;
		character_customization::loadEquippedCharacterOnModel(localClientNum, level.var_74625f60, undefined, var_d4457625);
		function_d1af713(level.var_3bb399f9[level.var_f31ebae4], level.var_74625f60);
		function_4c5bfec4(localClientNum, 1);
		do
		{
			wait(0.016);
			var_9cd812ba = GetDvarString("ui_mapname");
		}
		while(!var_9cd812ba == var_ab91e00d);
	}
}

/*
	Name: function_e5f8ef8c
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x1170
	Size: 0xBA8
	Parameters: 1
	Flags: None
	Line Number: 287
*/
function function_e5f8ef8c(localClientNum)
{
	var_74cfff2 = level.var_f22d5918;
	level.var_8ab87915 = [];
	level.var_784ba6c9 = "zm_cp_" + var_74cfff2 + "_lobby_idle";
	if(!isdefined(level.var_8ab87915))
	{
		level.var_8ab87915 = [];
	}
	else if(!IsArray(level.var_8ab87915))
	{
		level.var_8ab87915 = Array(level.var_8ab87915);
	}
	level.var_8ab87915[level.var_8ab87915.size] = level.var_784ba6c9;
	if(isdefined(level.var_67da5b39))
	{
		for(i = 0; i < level.var_67da5b39.size; i++)
		{
			KillRadiantExploder(0, level.var_67da5b39[i]);
		}
	}
	level.var_67da5b39 = [];
	if(var_74cfff2 == "cairo")
	{
		if(!isdefined(level.var_67da5b39))
		{
			level.var_67da5b39 = [];
		}
		else if(!IsArray(level.var_67da5b39))
		{
			level.var_67da5b39 = Array(level.var_67da5b39);
		}
		level.var_67da5b39[level.var_67da5b39.size] = "fx_frontend_zombie_fog_cairo";
		if(!isdefined(level.var_67da5b39))
		{
			level.var_67da5b39 = [];
		}
		else if(!IsArray(level.var_67da5b39))
		{
			level.var_67da5b39 = Array(level.var_67da5b39);
		}
		level.var_67da5b39[level.var_67da5b39.size] = "fx_frontend_zombie_fog_cairo";
		if(!isdefined(level.var_67da5b39))
		{
			level.var_67da5b39 = [];
		}
		else if(!IsArray(level.var_67da5b39))
		{
			level.var_67da5b39 = Array(level.var_67da5b39);
		}
		level.var_67da5b39[level.var_67da5b39.size] = "fx_frontend_zombie_fog_cairo";
		if(!isdefined(level.var_67da5b39))
		{
			level.var_67da5b39 = [];
		}
		else if(!IsArray(level.var_67da5b39))
		{
			level.var_67da5b39 = Array(level.var_67da5b39);
		}
		level.var_67da5b39[level.var_67da5b39.size] = "fx_frontend_zombie_fog_cairo";
	}
	else if(var_74cfff2 == "mobile")
	{
		if(!isdefined(level.var_67da5b39))
		{
			level.var_67da5b39 = [];
		}
		else if(!IsArray(level.var_67da5b39))
		{
			level.var_67da5b39 = Array(level.var_67da5b39);
		}
		level.var_67da5b39[level.var_67da5b39.size] = "fx_frontend_zombie_fog_mobile";
		if(!isdefined(level.var_67da5b39))
		{
			level.var_67da5b39 = [];
		}
		else if(!IsArray(level.var_67da5b39))
		{
			level.var_67da5b39 = Array(level.var_67da5b39);
		}
		level.var_67da5b39[level.var_67da5b39.size] = "fx_frontend_zombie_fog_mobile";
		if(!isdefined(level.var_67da5b39))
		{
			level.var_67da5b39 = [];
		}
		else if(!IsArray(level.var_67da5b39))
		{
			level.var_67da5b39 = Array(level.var_67da5b39);
		}
		level.var_67da5b39[level.var_67da5b39.size] = "fx_frontend_zombie_fog_mobile";
		if(!isdefined(level.var_67da5b39))
		{
			level.var_67da5b39 = [];
		}
		else if(!IsArray(level.var_67da5b39))
		{
			level.var_67da5b39 = Array(level.var_67da5b39);
		}
		level.var_67da5b39[level.var_67da5b39.size] = "fx_frontend_zombie_fog_mobile";
	}
	else if(!isdefined(level.var_67da5b39))
	{
		level.var_67da5b39 = [];
	}
	else if(!IsArray(level.var_67da5b39))
	{
		level.var_67da5b39 = Array(level.var_67da5b39);
	}
	level.var_67da5b39[level.var_67da5b39.size] = "fx_frontend_zombie_fog_singapore";
	if(!isdefined(level.var_67da5b39))
	{
		level.var_67da5b39 = [];
	}
	else if(!IsArray(level.var_67da5b39))
	{
		level.var_67da5b39 = Array(level.var_67da5b39);
	}
	level.var_67da5b39[level.var_67da5b39.size] = "fx_frontend_zombie_fog_singapore";
	if(!isdefined(level.var_67da5b39))
	{
		level.var_67da5b39 = [];
	}
	else if(!IsArray(level.var_67da5b39))
	{
		level.var_67da5b39 = Array(level.var_67da5b39);
	}
	level.var_67da5b39[level.var_67da5b39.size] = "fx_frontend_zombie_fog_singapore";
	if(!isdefined(level.var_67da5b39))
	{
		level.var_67da5b39 = [];
	}
	else if(!IsArray(level.var_67da5b39))
	{
		level.var_67da5b39 = Array(level.var_67da5b39);
	}
	level.var_67da5b39[level.var_67da5b39.size] = "fx_frontend_zombie_fog_singapore";
	level.var_3bb399f9 = [];
	if(!isdefined(level.var_3bb399f9))
	{
		level.var_3bb399f9 = [];
	}
	else if(!IsArray(level.var_3bb399f9))
	{
		level.var_3bb399f9 = Array(level.var_3bb399f9);
	}
	level.var_3bb399f9[level.var_3bb399f9.size] = "cpzm_frontend";
	if(!isdefined(level.var_3bb399f9))
	{
		level.var_3bb399f9 = [];
	}
	else if(!IsArray(level.var_3bb399f9))
	{
		level.var_3bb399f9 = Array(level.var_3bb399f9);
	}
	level.var_3bb399f9[level.var_3bb399f9.size] = "cpzm_frontend";
	if(!isdefined(level.var_3bb399f9))
	{
		level.var_3bb399f9 = [];
	}
	else if(!IsArray(level.var_3bb399f9))
	{
		level.var_3bb399f9 = Array(level.var_3bb399f9);
	}
	level.var_3bb399f9[level.var_3bb399f9.size] = "cpzm_frontend";
	if(!isdefined(level.var_3bb399f9))
	{
		level.var_3bb399f9 = [];
	}
	else if(!IsArray(level.var_3bb399f9))
	{
		level.var_3bb399f9 = Array(level.var_3bb399f9);
	}
	level.var_3bb399f9[level.var_3bb399f9.size] = "cpzm_frontend";
	level.var_f31ebae4 = 0;
	function_4c5bfec4(localClientNum, 2);
	s_scene = struct::get_script_bundle("scene", level.var_8ab87915[level.var_f31ebae4]);
	str_gender = GetHeroGender(GetEquippedHeroIndex(localClientNum, 2), "cp");
	if(str_gender === "female" && isdefined(s_scene.FemaleBundle))
	{
		s_scene = struct::get_script_bundle("scene", s_scene.FemaleBundle);
	}
	s_align = struct::get(s_scene.aligntarget, "targetname");
	PlayMainCamXCam(localClientNum, s_scene.cameraswitcher, 0, "", "", s_align.origin, s_align.angles);
	for(i = 0; i < level.var_8ab87915.size; i++)
	{
		if(i == level.var_f31ebae4)
		{
			if(GetDvarInt("tu6_ffotd_zombieSpecialDayEffectsClient"))
			{
				switch(level.var_67da5b39[i])
				{
					case "fx_frontend_zombie_fog_mobile":
					case "zm_bonus_idle":
					{
						position = (-1269, 1178, 562);
						break;
					}
					case "fx_frontend_zombie_fog_singapore":
					{
						position = (-1273, 1180, 320);
						break;
					}
					case "fx_frontend_zombie_fog_cairo":
					{
						position = (-1256, 1235, 61);
						break;
					}
				}
				level.var_b413970c = playFX(localClientNum, level._effect["frontend_special_day"], position);
			}
			PlayRadiantExploder(0, level.var_67da5b39[i]);
			continue;
		}
		KillRadiantExploder(0, level.var_67da5b39[i]);
	}
	var_d4457625 = spawnstruct();
	var_d4457625.scene = s_scene.name;
	var_d4457625.sessionMode = 0;
	function_ab8d2faa(localClientNum, s_scene);
	function_d1af713(level.var_3bb399f9[level.var_f31ebae4], level.var_74625f60);
}

/*
	Name: function_ab8d2faa
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x1D20
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 519
*/
function function_ab8d2faa(localClientNum, s_scene)
{
	var_d4457625 = spawnstruct();
	var_d4457625.scene = s_scene.name;
	var_d4457625.sessionMode = 0;
	function_d8c96cea(localClientNum, level.var_74625f60, function_305f50e8(), var_d4457625);
}

/*
	Name: function_aa8ceee2
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x1DB8
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 537
*/
function function_aa8ceee2(localClientNum, cigar)
{
	if(self != cigar)
	{
		return;
	}
	cigar.var_5294c549 = PlayFXOnTag(localClientNum, level._effect["doa_frontend_cigar_lit"], self, "tag_fx_smoke");
}

/*
	Name: function_72dc7256
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x1E20
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 556
*/
function function_72dc7256(localClientNum, cigar)
{
	if(self != cigar)
	{
		return;
	}
	cigar.var_5a27d7b4 = PlayFXOnTag(localClientNum, level._effect["doa_frontend_cigar_puff"], self, "tag_fx_smoke");
}

/*
	Name: function_e770c390
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x1E88
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 575
*/
function function_e770c390(localClientNum, cigar)
{
	if(self != cigar)
	{
		return;
	}
	cigar.var_3873103e = PlayFXOnTag(localClientNum, level._effect["doa_frontend_cigar_ash"], self, "tag_fx_smoke");
}

/*
	Name: function_9278b992
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x1EF0
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 594
*/
function function_9278b992(localClientNum, APE)
{
	if(self != APE)
	{
		return;
	}
	PlayFXOnTag(localClientNum, level._effect["doa_frontend_cigar_exhale"], self, "tag_inhand");
}

/*
	Name: function_2c99c36f
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x1F50
	Size: 0x1C8
	Parameters: 2
	Flags: None
	Line Number: 613
*/
function function_2c99c36f(a_ents, localClientNum)
{
	level._animnotetrackhandlers["inhale"] = undefined;
	level._animnotetrackhandlers["puff"] = undefined;
	level._animnotetrackhandlers["flick"] = undefined;
	level._animnotetrackhandlers["exhale"] = undefined;
	cigar = a_ents["cigar"];
	if(isdefined(cigar.var_7ccd283a))
	{
		stopfx(localClientNum, cigar.var_7ccd283a);
	}
	cigar.var_7ccd283a = PlayFXOnTag(localClientNum, level._effect["doa_frontend_cigar_ambient"], cigar, "tag_fx_smoke");
	animation::add_global_notetrack_handler("inhale", &function_aa8ceee2, localClientNum, cigar);
	animation::add_global_notetrack_handler("puff", &function_72dc7256, localClientNum, cigar);
	animation::add_global_notetrack_handler("flick", &function_e770c390, localClientNum, cigar);
	APE = a_ents["zombie"];
	animation::add_global_notetrack_handler("exhale", &function_9278b992, localClientNum, APE);
}

/*
	Name: function_c3c57a58
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x2120
	Size: 0x6D0
	Parameters: 1
	Flags: None
	Line Number: 642
*/
function function_c3c57a58(localClientNum)
{
	var_74cfff2 = "mobile";
	level.var_8ab87915 = [];
	level.var_784ba6c9 = "cp_cac_cp_lobby_idle_" + var_74cfff2;
	if(!isdefined(level.var_8ab87915))
	{
		level.var_8ab87915 = [];
	}
	else if(!IsArray(level.var_8ab87915))
	{
		level.var_8ab87915 = Array(level.var_8ab87915);
	}
	level.var_8ab87915[level.var_8ab87915.size] = level.var_784ba6c9;
	if(isdefined(level.var_67da5b39))
	{
		for(i = 0; i < level.var_67da5b39.size; i++)
		{
			KillRadiantExploder(0, level.var_67da5b39[i]);
		}
	}
	level.var_67da5b39 = [];
	if(!isdefined(level.var_67da5b39))
	{
		level.var_67da5b39 = [];
	}
	else if(!IsArray(level.var_67da5b39))
	{
		level.var_67da5b39 = Array(level.var_67da5b39);
	}
	level.var_67da5b39[level.var_67da5b39.size] = "zm_bonus_idle";
	level.var_3bb399f9 = [];
	if(!isdefined(level.var_3bb399f9))
	{
		level.var_3bb399f9 = [];
	}
	else if(!IsArray(level.var_3bb399f9))
	{
		level.var_3bb399f9 = Array(level.var_3bb399f9);
	}
	level.var_3bb399f9[level.var_3bb399f9.size] = "cpzm_frontend";
	if(!isdefined(level.var_3bb399f9))
	{
		level.var_3bb399f9 = [];
	}
	else if(!IsArray(level.var_3bb399f9))
	{
		level.var_3bb399f9 = Array(level.var_3bb399f9);
	}
	level.var_3bb399f9[level.var_3bb399f9.size] = "cpzm_frontend";
	if(!isdefined(level.var_3bb399f9))
	{
		level.var_3bb399f9 = [];
	}
	else if(!IsArray(level.var_3bb399f9))
	{
		level.var_3bb399f9 = Array(level.var_3bb399f9);
	}
	level.var_3bb399f9[level.var_3bb399f9.size] = "cpzm_frontend";
	if(!isdefined(level.var_3bb399f9))
	{
		level.var_3bb399f9 = [];
	}
	else if(!IsArray(level.var_3bb399f9))
	{
		level.var_3bb399f9 = Array(level.var_3bb399f9);
	}
	level.var_3bb399f9[level.var_3bb399f9.size] = "cpzm_frontend";
	level.var_f31ebae4 = 0;
	function_4c5bfec4(localClientNum, 2);
	s_scene = struct::get_script_bundle("scene", level.var_8ab87915[level.var_f31ebae4]);
	str_gender = GetHeroGender(GetEquippedHeroIndex(localClientNum, 2), "cp");
	if(str_gender === "female" && isdefined(s_scene.FemaleBundle))
	{
		s_scene = struct::get_script_bundle("scene", s_scene.FemaleBundle);
	}
	s_align = struct::get(s_scene.aligntarget, "targetname");
	PlayMainCamXCam(localClientNum, s_scene.cameraswitcher, 0, "", "", s_align.origin, s_align.angles);
	for(i = 0; i < level.var_8ab87915.size; i++)
	{
		if(i == level.var_f31ebae4)
		{
			if(GetDvarInt("tu6_ffotd_zombieSpecialDayEffectsClient"))
			{
				switch(level.var_67da5b39[i])
				{
					case "fx_frontend_zombie_fog_mobile":
					case "zm_bonus_idle":
					{
						position = (-1269, 1178, 562);
						break;
					}
					case "fx_frontend_zombie_fog_singapore":
					{
						position = (-1273, 1180, 320);
						break;
					}
					case "fx_frontend_zombie_fog_cairo":
					{
						position = (-1256, 1235, 61);
						break;
					}
				}
				level.var_b413970c = playFX(localClientNum, level._effect["frontend_special_day"], position);
			}
			PlayRadiantExploder(0, level.var_67da5b39[i]);
			continue;
		}
		KillRadiantExploder(0, level.var_67da5b39[i]);
	}
	scene::add_scene_func(s_scene.name, &function_2c99c36f, "play", localClientNum);
	var_d4457625 = spawnstruct();
	var_d4457625.scene = s_scene.name;
	var_d4457625.sessionMode = 0;
	function_ab8d2faa(localClientNum, s_scene);
	function_d1af713(level.var_3bb399f9[level.var_f31ebae4], level.var_74625f60);
}

/*
	Name: function_305f50e8
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x27F8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 770
*/
function function_305f50e8()
{
	switch(RandomInt(8))
	{
		case 0:
		{
			return 0;
			break;
		}
		case 1:
		{
			return 1;
			break;
		}
		case 2:
		{
			return 2;
			break;
		}
		case 3:
		{
			return 3;
			break;
		}
		case 4:
		{
			return 5;
			break;
		}
		case 5:
		{
			return 6;
			break;
		}
		case 6:
		{
			return 7;
			break;
		}
		case 7:
		{
			return 8;
			break;
		}
	}
}

/*
	Name: function_d8c96cea
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x28B8
	Size: 0x1F0
	Parameters: 4
	Flags: None
	Line Number: 827
*/
function function_d8c96cea(localClientNum, data_struct, characterindex, params)
{
	defaultIndex = undefined;
	if(isdefined(params.isDefaultHero) && params.isDefaultHero)
	{
		defaultIndex = 0;
	}
	character_customization::set_character(data_struct, characterindex);
	characterMode = params.sessionMode;
	character_customization::set_character_mode(data_struct, characterMode);
	body = 0;
	bodyColors = character_customization::get_character_body_colors(localClientNum, characterMode, characterindex, body, params.extracam_data);
	character_customization::set_body(data_struct, characterMode, characterindex, body, bodyColors);
	head = 0;
	character_customization::set_head(data_struct, characterMode, head);
	helmet = 0;
	helmetColors = character_customization::get_character_helmet_colors(localClientNum, characterMode, data_struct.characterindex, helmet, params.extracam_data);
	character_customization::set_helmet(data_struct, characterMode, characterindex, helmet, helmetColors);
	return character_customization::update(localClientNum, data_struct, params);
}

/*
	Name: function_8c70104b
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x2AB0
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 858
*/
function function_8c70104b(localClientNum)
{
	s_scene = struct::get_script_bundle("scene", "cin_fe_zm_forest_vign_sitting");
	var_d4457625 = spawnstruct();
	var_d4457625.scene = s_scene.name;
	var_d4457625.sessionMode = 0;
	changed = character_customization::loadEquippedCharacterOnModel(localClientNum, level.var_647ea5fa, level.var_e50218e7, var_d4457625);
	function_19f2b8a3(localClientNum, level.var_647ea5fa, changed);
}

/*
	Name: function_1ca6d8df
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x2B98
	Size: 0x4C8
	Parameters: 2
	Flags: None
	Line Number: 878
*/
function function_1ca6d8df(localClientNum, state)
{
	character_index = function_305f50e8();
	fields = GetCharacterFields(character_index, 1);
	params = spawnstruct();
	if(!isdefined(fields))
	{
		fields = spawnstruct();
	}
	if(isdefined(fields.var_d0ff12a0))
	{
		params.align_struct = struct::get(fields.var_d0ff12a0);
	}
	params.weapon_left = fields.var_5309507b;
	params.weapon_right = fields.var_69b4cf02;
	var_1500d96e = 1 == function_f60897f2(localClientNum, character_index);
	if(var_1500d96e)
	{
		params.anim_intro_name = fields.var_54945d04;
		params.anim_name = fields.var_37917886;
		params.weapon_left_anim_intro = fields.var_3ec4722b;
		params.weapon_left_anim = fields.var_beddabc7;
		params.weapon_right_anim_intro = fields.var_d1a6c0ee;
		params.weapon_right_anim = fields.var_a2b0a508;
		if(isdefined(fields.var_f986b726) && fields.var_f986b726)
		{
			params.weapon = function_b8c4abd(character_index, 1);
		}
	}
	else
	{
		params.anim_intro_name = fields.var_1f879308;
		params.anim_name = fields.var_d11b865a;
		params.weapon_left_anim_intro = fields.var_8ce91957;
		params.weapon_left_anim = fields.var_623e2733;
		params.weapon_right_anim_intro = fields.var_1ac723ea;
		params.weapon_right_anim = fields.var_9ebfda14;
		params.weapon = function_b8c4abd(character_index, 1);
	}
	params.sessionMode = 0;
	changed = character_customization::loadEquippedCharacterOnModel(localClientNum, level.var_647ea5fa, character_index, params);
	if(isdefined(level.var_647ea5fa.characterModel))
	{
		level.var_647ea5fa.characterModel SetHighDetail(1, 1);
		if(isdefined(params.weapon))
		{
			level.var_647ea5fa.characterModel UseWeaponHideTags(params.weapon);
		}
		else
		{
			wait(0.016);
			level.var_647ea5fa.characterModel showallparts(localClientNum);
		}
		if(isdefined(level.var_647ea5fa.var_48576bc9))
		{
			stopsound(level.var_647ea5fa.var_48576bc9);
			level.var_647ea5fa.var_48576bc9 = undefined;
		}
		if(isdefined(level.var_647ea5fa.playsound))
		{
			level.var_647ea5fa.var_48576bc9 = level.var_647ea5fa.characterModel playsound(undefined, level.var_647ea5fa.playsound);
			level.var_647ea5fa.playsound = undefined;
		}
	}
	function_19f2b8a3(localClientNum, level.var_647ea5fa, changed);
}

/*
	Name: function_e61f2bcd
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x3068
	Size: 0x470
	Parameters: 3
	Flags: None
	Line Number: 955
*/
function function_e61f2bcd(localClientNum, menu_name, state)
{
	level notify("hash_22b30258");
	level endon("hash_22b30258");
	if(isdefined(state) && !StrStartsWith(state, "cpzm") && !StrStartsWith(state, "doa"))
	{
		if(isdefined(level.var_b413970c))
		{
			KillFX(localClientNum, level.var_b413970c);
		}
	}
	if(GetDvarInt("playing_videos"))
	{
		WaitRealTime(2);
		if(GetDvarInt("playing_videos"))
		{
			return;
		}
	}
	if(!isdefined(state) || state == "room1")
	{
		function_d1af713();
		camera_ent = struct::get("mainmenu_frontend_camera");
		if(isdefined(camera_ent))
		{
			PlayMainCamXCam(localClientNum, "startmenu_camera_01", 0, "cam1", "", camera_ent.origin, camera_ent.angles);
		}
	}
	else if(state == "room2")
	{
		function_e5f8ef8c(localClientNum);
	}
	else if(state == "mp_theater")
	{
		function_d1af713("frontend_theater");
		camera_ent = struct::get("frontend_theater");
		if(isdefined(camera_ent))
		{
			PlayMainCamXCam(localClientNum, "ui_cam_frontend_theater", 0, "cam1", "", camera_ent.origin, camera_ent.angles);
		}
	}
	else if(state == "mp_freerun")
	{
		function_d1af713("frontend_freerun");
		camera_ent = struct::get("frontend_freerun");
		if(isdefined(camera_ent))
		{
			PlayMainCamXCam(localClientNum, "ui_cam_frontend_freerun", 0, "cam1", "", camera_ent.origin, camera_ent.angles);
		}
	}
	else if(StrStartsWith(state, "doa"))
	{
		function_c3c57a58(localClientNum);
	}
	else if(StrStartsWith(state, "cpzm"))
	{
		function_e5f8ef8c(localClientNum);
	}
	else if(StrStartsWith(state, "cp"))
	{
		function_fb006449(localClientNum);
	}
	else if(StrStartsWith(state, "mp"))
	{
		function_1ca6d8df(localClientNum, state);
	}
	else if(StrStartsWith(state, "zm"))
	{
		function_c3c57a58(localClientNum);
	}
	else
	{
		function_d1af713();
	}
	if(!isdefined(state) || state != "room1")
	{
		function_482f1c5();
		level notify("hash_2e903055");
	}
}

/*
	Name: function_842df2f7
	Namespace: namespace_17578f14
	Checksum: 0x424F4353
	Offset: 0x34E0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 1046
*/
function function_842df2f7()
{
	level endon("hash_2e903055");
	var_d7736cac = -0.01;
	t = 1;
	while(1)
	{
		function_482f1c5((1 * t, 0.2 * t, 0));
		t = t + var_d7736cac;
		if(t < 0.2 || t > 0.99)
		{
			var_d7736cac = var_d7736cac * -1;
		}
		wait(0.016);
	}
}

