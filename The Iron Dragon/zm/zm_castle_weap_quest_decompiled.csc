#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_filter;

#namespace namespace_2a78f3c;

/*
	Name: __init__sytem__
	Namespace: namespace_2a78f3c
	Checksum: 0x7B367582
	Offset: 0x9A0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("zm_castle_weap_quest", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_2a78f3c
	Checksum: 0x9C291CB7
	Offset: 0x9E0
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	level.var_3b135a99 = struct::get_array("dragon_position", "targetname");
	clientfield::register("actor", "make_client_clone", 5000, 4, "int", &function_d3589484, 0, 0);
	for(i = 0; i < level.var_3b135a99.size; i++)
	{
		clientfield::register("world", level.var_3b135a99[i].script_parameters, 5000, 3, "int", &function_9827b5e4, 0, 0);
	}
	clientfield::register("toplayer", "bow_pickup_fx", 5000, 1, "int", &function_64fe1dc, 0, 0);
	clientfield::register("toplayer", "bow_pickup_fx_storm", 5000, 1, "int", &function_bf1e32b6, 0, 0);
	clientfield::register("toplayer", "bow_pickup_fx_wolf_howl", 5000, 1, "int", &function_c2d53b4c, 0, 0);
	clientfield::register("toplayer", "bow_pickup_fx_demongate", 5000, 1, "int", &function_bf8665c9, 0, 0);
	clientfield::register("toplayer", "bow_pickup_fx_rune_prison", 5000, 1, "int", &function_de7c720f, 0, 0);
}

/*
	Name: main
	Namespace: namespace_2a78f3c
	Checksum: 0x43FB6B7A
	Offset: 0xC48
	Size: 0x6D8
	Parameters: 0
	Flags: None
	Line Number: 64
*/
function main()
{
	level._effect["bow_spawn_fx"] = "dlc1/castle/fx_plinth_pick_up_base_bow";
	level._effect["mini_dragon_fire"] = "dlc1/castle/fx_dragon_head_mouth_fire_sm";
	level._effect["mini_dragon_eye"] = "dlc1/castle/fx_dragon_head_eye_glow_sm";
	level.var_a769589d = "cin_t7_ai_zm_dlc1_dragonhead_static";
	level.var_5fdb7ddc = "cin_t7_ai_zm_dlc1_dragonhead_intro";
	level.var_1c893eb8 = "cin_t7_zm_dlc1_dragonhead_depart";
	level.var_91fb6838 = [];
	level.var_91fb6838["dragonhead_1"] = "p7_fxanim_zm_castle_dragon_crumble_undercroft_bundle";
	level.var_91fb6838["dragonhead_2"] = "p7_fxanim_zm_castle_dragon_crumble_courtyard_bundle";
	level.var_91fb6838["dragonhead_3"] = "p7_fxanim_zm_castle_dragon_crumble_greathall_bundle";
	level.var_19086cf8 = [];
	level.var_19086cf8["right"] = "cin_t7_ai_zm_dlc1_dragonhead_pre_eat_r";
	level.var_19086cf8["left"] = "cin_t7_ai_zm_dlc1_dragonhead_pre_eat_l";
	level.var_19086cf8["front"] = "cin_t7_ai_zm_dlc1_dragonhead_pre_eat_f";
	level.var_19086cf8["left_2_right"] = "cin_t7_ai_zm_dlc1_dragonhead_pre_eat_l_2_r";
	level.var_19086cf8["right_2_left"] = "cin_t7_ai_zm_dlc1_dragonhead_pre_eat_r_2_l";
	level.var_3574b4dd = [];
	level.var_3574b4dd["right"] = "cin_t7_ai_zm_dlc1_dragonhead_consume_r";
	level.var_3574b4dd["left"] = "cin_t7_ai_zm_dlc1_dragonhead_consume_l";
	level.var_3574b4dd["front"] = "cin_t7_ai_zm_dlc1_dragonhead_consume_f";
	level.var_2914ff53 = [];
	level.var_2914ff53["right"] = "rtrg_ai_zm_dlc1_dragonhead_consume_zombie_align_r";
	level.var_2914ff53["left"] = "rtrg_ai_zm_dlc1_dragonhead_consume_zombie_align_l";
	level.var_2914ff53["front"] = "rtrg_ai_zm_dlc1_dragonhead_consume_zombie_align_f";
	level.var_73bfb0d5 = [];
	level.var_73bfb0d5[0] = "cin_t7_ai_zm_dlc1_dragonhead_idle";
	level.var_73bfb0d5[1] = "cin_t7_ai_zm_dlc1_dragonhead_idle_b";
	level.var_2b27c866 = [];
	level.var_2b27c866[0] = "cin_t7_ai_zm_dlc1_dragonhead_idle_twitch_roar";
	scene::add_scene_func(level.var_73bfb0d5[0], &function_9b30666a);
	scene::add_scene_func(level.var_73bfb0d5[1], &function_9b30666a);
	scene::add_scene_func(level.var_2b27c866[0], &function_d3d4e7b5);
	level.var_39f6d07 = "ai_zm_dlc1_dragonhead_zombie_impact";
	function_1ea46f53();
	util::waitforallclients();
	wait(1);
	level.var_1584478b = [];
	level.var_3920af6a = [];
	level.var_abaa37ce = [];
	players = GetLocalPlayers();
	for(j = 0; j < players.size; j++)
	{
		level.var_1584478b[j] = [];
		level.var_3920af6a[j] = [];
		level.var_abaa37ce[j] = [];
		for(i = 0; i < level.var_3b135a99.size; i++)
		{
			level.var_1584478b[j][level.var_3b135a99[i].script_parameters] = GetEnt(j, level.var_3b135a99[i].script_label, "targetname");
			level.var_1584478b[j][level.var_3b135a99[i].script_parameters] useanimtree(-1);
			level.var_1584478b[j][level.var_3b135a99[i].script_parameters] flag::init("dragon_far_right");
			level.var_1584478b[j][level.var_3b135a99[i].script_parameters] flag::init("dragon_far_left");
			level.var_1584478b[j][level.var_3b135a99[i].script_parameters].var_60ea59d4 = 1;
			level.var_3920af6a[j][level.var_3b135a99[i].script_parameters] = GetEnt(j, level.var_3b135a99[i].script_friendname, "targetname");
			level.var_3920af6a[j][level.var_3b135a99[i].script_parameters] Hide();
			level.var_3920af6a[j][level.var_3b135a99[i].script_parameters] useanimtree(-1);
			level.var_abaa37ce[j][level.var_3b135a99[i].script_parameters] = GetEnt(j, level.var_3b135a99[i].script_label + "_mini", "targetname");
		}
		Array::run_all(level.var_abaa37ce[j], &function_ac83c3dd, j);
	}
	level.var_66f3d34 = 1;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_9827b5e4
	Namespace: namespace_2a78f3c
	Checksum: 0xFA7D9C2A
	Offset: 0x1328
	Size: 0x5E8
	Parameters: 7
	Flags: None
	Line Number: 140
*/
function function_9827b5e4(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	while(!isdefined(level.var_66f3d34))
	{
		wait(0.05);
	}
	if(newVal == 7)
	{
		if(isdefined(level.var_1584478b[localClientNum][fieldName]))
		{
			level.var_1584478b[localClientNum][fieldName] thread function_5ffbbe99(localClientNum);
		}
	}
	else if(newVal == 1)
	{
		level.var_3920af6a[localClientNum][fieldName] Hide();
		if(isdefined(level.var_1584478b[localClientNum][fieldName]))
		{
			level.var_1584478b[localClientNum][fieldName] show();
			level.var_1584478b[localClientNum][fieldName] thread function_865954e7(localClientNum);
			level.var_1584478b[localClientNum][fieldName] scene::Play(level.var_5fdb7ddc, level.var_1584478b[localClientNum][fieldName]);
		}
	}
	else if(newVal == 2)
	{
		level.var_3920af6a[localClientNum][fieldName] Hide();
		if(isdefined(level.var_3920af6a[localClientNum][fieldName].head))
		{
			if(isdefined(level.var_3920af6a[localClientNum][fieldName].head.hat))
			{
				level.var_3920af6a[localClientNum][fieldName].head.hat Hide();
			}
			level.var_3920af6a[localClientNum][fieldName].head Hide();
		}
		if(isdefined(level.var_1584478b[localClientNum][fieldName]))
		{
			level.var_1584478b[localClientNum][fieldName] show();
			level.var_1584478b[localClientNum][fieldName] thread function_4e838726(localClientNum);
		}
	}
	else if(newVal == 3 || newVal == 5 || newVal == 4)
	{
		if(isdefined(level.var_1584478b[localClientNum][fieldName]))
		{
			level.var_1584478b[localClientNum][fieldName] show();
			if(newVal == 3)
			{
				level.var_1584478b[localClientNum][fieldName] thread function_b3f95ed9(level.var_3920af6a[localClientNum][fieldName], localClientNum, "front");
			}
			else if(newVal == 4)
			{
				level.var_1584478b[localClientNum][fieldName] thread function_b3f95ed9(level.var_3920af6a[localClientNum][fieldName], localClientNum, "right");
				continue;
			}
			level.var_1584478b[localClientNum][fieldName] thread function_b3f95ed9(level.var_3920af6a[localClientNum][fieldName], localClientNum, "left");
		}
	}
	else if(newVal == 6)
	{
		level.var_3920af6a[localClientNum][fieldName] Hide();
		if(isdefined(level.var_3920af6a[localClientNum][fieldName].head))
		{
			if(isdefined(level.var_3920af6a[localClientNum][fieldName].head.hat))
			{
				level.var_3920af6a[localClientNum][fieldName].head.hat Hide();
			}
			level.var_3920af6a[localClientNum][fieldName].head Hide();
		}
		if(isdefined(level.var_1584478b[localClientNum][fieldName]))
		{
			level.var_1584478b[localClientNum][fieldName] show();
			level.var_1584478b[localClientNum][fieldName] thread function_9a098479(localClientNum, level.var_3920af6a[localClientNum][fieldName], level.var_abaa37ce[localClientNum][fieldName]);
		}
	}
	else if(newVal == 0)
	{
		level.var_1584478b[localClientNum][fieldName] thread function_ac36f4b3();
	}
}

/*
	Name: function_865954e7
	Namespace: namespace_2a78f3c
	Checksum: 0x9E3A315A
	Offset: 0x1918
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 230
*/
function function_865954e7(localClientNum)
{
	ForceStreamXModel("c_zom_dragonhead_e");
	self function_c49281f(localClientNum);
	self SetModel("c_zom_dragonhead_e");
	StopForceStreamingXModel("c_zom_dragonhead_e");
	self thread function_dc0c3125(localClientNum);
}

/*
	Name: function_c49281f
	Namespace: namespace_2a78f3c
	Checksum: 0x7601B76C
	Offset: 0x19B0
	Size: 0x1C0
	Parameters: 1
	Flags: None
	Line Number: 249
*/
function function_c49281f(localClientNum)
{
	n_start_time = GetTime();
	n_end_time = n_start_time + 3600;
	var_e56d149e = n_start_time + 500;
	b_is_updating = 1;
	while(b_is_updating)
	{
		n_time = GetTime();
		if(n_time >= n_end_time)
		{
			n_shader_value = mapfloat(n_start_time, n_end_time, 1, 0, n_end_time);
			b_is_updating = 0;
			continue;
		}
		n_shader_value = mapfloat(n_start_time, n_end_time, 1, 0, n_time);
		if(n_time >= var_e56d149e)
		{
			var_ccc59743 = mapfloat(n_start_time, var_e56d149e, 0, 3, var_e56d149e);
			continue;
		}
		var_ccc59743 = mapfloat(n_start_time, var_e56d149e, 0, 3, n_time);
		self MapShaderConstant(localClientNum, 0, "scriptVector2", 0, var_ccc59743, 0);
		self MapShaderConstant(localClientNum, 0, "scriptVector0", n_shader_value, 0, 0);
		wait(0.01);
	}
}

/*
	Name: function_9b8dd0c1
	Namespace: namespace_2a78f3c
	Checksum: 0xD113C379
	Offset: 0x1B78
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 287
*/
function function_9b8dd0c1(localClientNum)
{
	n_start_time = GetTime();
	n_end_time = n_start_time + 7000;
	b_is_updating = 1;
	while(b_is_updating && isdefined(self))
	{
		n_time = GetTime();
		if(n_time >= n_end_time)
		{
			n_shader_value = mapfloat(n_start_time, n_end_time, 0, 1, n_end_time);
			b_is_updating = 0;
			continue;
		}
		n_shader_value = mapfloat(n_start_time, n_end_time, 0, 1, n_time);
		self MapShaderConstant(localClientNum, 0, "scriptVector0", n_shader_value, 0, 0);
		self MapShaderConstant(localClientNum, 0, "scriptVector2", 0, 0, 0);
		wait(0.01);
	}
}

/*
	Name: function_dc0c3125
	Namespace: namespace_2a78f3c
	Checksum: 0x6D356E9A
	Offset: 0x1CC0
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 318
*/
function function_dc0c3125(localClientNum)
{
	n_start_time = GetTime();
	n_end_time = n_start_time + 5000;
	b_is_updating = 1;
	while(b_is_updating)
	{
		n_time = GetTime();
		if(n_time >= n_end_time)
		{
			n_shader_value = mapfloat(n_start_time, n_end_time, 0, 2, n_end_time);
			b_is_updating = 0;
			continue;
		}
		n_shader_value = mapfloat(n_start_time, n_end_time, 0, 2, n_time);
		self MapShaderConstant(localClientNum, 0, "scriptVector2", 0, n_shader_value, 0);
		wait(0.01);
	}
}

/*
	Name: function_5ffbbe99
	Namespace: namespace_2a78f3c
	Checksum: 0x1051B7CE
	Offset: 0x1DD8
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 348
*/
function function_5ffbbe99(localClientNum)
{
	self MapShaderConstant(localClientNum, 0, "scriptVector0", 1, 0, 0);
	self thread scene::Play(level.var_a769589d, self);
}

/*
	Name: function_4e838726
	Namespace: namespace_2a78f3c
	Checksum: 0xDD70E880
	Offset: 0x1E38
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 364
*/
function function_4e838726(localClientNum)
{
	self endon("hash_7891e14b");
	self endon("hash_ed5c07ea");
	self notify("hash_9f7623b6");
	if(isdefined(self.var_52a84f88) && self.var_52a84f88)
	{
		return;
	}
	self.var_52a84f88 = 1;
	while(1)
	{
		var_25370edb = Array::random(level.var_73bfb0d5);
		self scene::Play(var_25370edb, self);
		var_264cae9e = Array::random(level.var_2b27c866);
		self scene::Play(var_264cae9e, self);
	}
}

/*
	Name: function_d3589484
	Namespace: namespace_2a78f3c
	Checksum: 0x4DD163A8
	Offset: 0x1F20
	Size: 0x278
	Parameters: 7
	Flags: None
	Line Number: 393
*/
function function_d3589484(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self endon("entityshutdown");
	if(!self hasdobj(localClientNum))
	{
		self util::waittill_dobj(localClientNum);
		wait(0.016);
	}
	while(!isdefined(level.var_66f3d34))
	{
		wait(0.05);
	}
	if(!isdefined(self))
	{
		return;
	}
	s_closest = Array::get_all_closest(self.origin, level.var_3b135a99);
	fieldName = s_closest[0].script_parameters;
	m_body = level.var_3920af6a[localClientNum][fieldName];
	if(isdefined(m_body))
	{
		m_body delete();
		m_body = GibClientUtils::CreateScriptModelOfEntity(localClientNum, self);
		if(IsSubStr(m_body.model, "skeleton"))
		{
			m_body HidePart(localClientNum, "tag_weapon_left");
			m_body HidePart(localClientNum, "tag_weapon_right");
		}
		m_body GibClientUtils::HandleGibNotetracks(localClientNum);
		level.var_3920af6a[localClientNum][fieldName] = m_body;
	}
	m_body useanimtree(-1);
	m_body.origin = self.origin;
	m_body show();
	m_body SetAnimRestart(level.var_39f6d07, 1, 0.2, 1);
	n_anim_time = getanimlength(level.var_39f6d07) / 1;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3eb5ed9c
	Namespace: namespace_2a78f3c
	Checksum: 0xE643BF2A
	Offset: 0x21A0
	Size: 0x1C0
	Parameters: 4
	Flags: None
	Line Number: 443
*/
function function_3eb5ed9c(m_body, var_ccf94f2d, localClientNum, direction)
{
	/#
		IPrintLnBold("Dev Block strings are not supported" + direction);
	#/
	var_83376af5 = level.var_19086cf8[direction];
	if(var_ccf94f2d flag::get("dragon_far_left") && direction == "right")
	{
		var_83376af5 = level.var_19086cf8["left_2_right"];
	}
	else if(var_ccf94f2d flag::get("dragon_far_right") && direction == "left")
	{
		var_83376af5 = level.var_19086cf8["right_2_left"];
	}
	s_scenedef = struct::get_script_bundle("scene", var_83376af5);
	var_741bc875 = s_scenedef.objects[0].mainanim;
	m_body Unlink();
	m_body show();
	m_body thread function_11035cf1(var_ccf94f2d, localClientNum, direction, var_741bc875);
	var_ccf94f2d scene::Play(var_83376af5, var_ccf94f2d);
}

/*
	Name: function_9b30666a
	Namespace: namespace_2a78f3c
	Checksum: 0x6000BA80
	Offset: 0x2368
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 475
*/
function function_9b30666a(a_ents)
{
	self notify("hash_8e80587");
	self endon("hash_8e80587");
	self endon("hash_7891e14b");
	self endon("hash_ed5c07ea");
	while(1)
	{
		self waittillmatch("_anim_notify_");
		self flag::set("dragon_far_right");
		self waittillmatch("_anim_notify_");
		self flag::clear("dragon_far_right");
		self waittillmatch("_anim_notify_");
		self flag::set("dragon_far_left");
		self waittillmatch("_anim_notify_");
		self flag::clear("dragon_far_left");
	}
}

/*
	Name: function_d3d4e7b5
	Namespace: namespace_2a78f3c
	Checksum: 0x247F0EF1
	Offset: 0x2460
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 504
*/
function function_d3d4e7b5(a_ents)
{
	self notify("hash_8e80587");
	self endon("hash_8e80587");
	self endon("hash_7891e14b");
	self endon("hash_ed5c07ea");
	while(1)
	{
		self waittillmatch("_anim_notify_");
		self flag::set("dragon_far_left");
		self waittillmatch("_anim_notify_");
		self flag::clear("dragon_far_left");
		self waittillmatch("_anim_notify_");
		self flag::set("dragon_far_right");
		self waittillmatch("_anim_notify_");
		self flag::clear("dragon_far_right");
	}
}

/*
	Name: function_11035cf1
	Namespace: namespace_2a78f3c
	Checksum: 0x692F7290
	Offset: 0x2558
	Size: 0x360
	Parameters: 4
	Flags: None
	Line Number: 533
*/
function function_11035cf1(var_ccf94f2d, localClientNum, direction, var_741bc875)
{
	if(!isdefined(self.var_eb8e6106))
	{
		self.var_eb8e6106 = spawn(localClientNum, self GetTagOrigin("J_SpineLower"), "script_model");
		self.var_eb8e6106 SetModel("tag_origin");
	}
	self SetAnimRestart("ai_zm_dlc1_dragonhead_zombie_rise");
	var_8b5fc28c = var_ccf94f2d.origin - self.origin;
	var_48845fc2 = VectorScale(var_8b5fc28c, 0.2);
	self.var_eb8e6106.angles = VectorToAngles(var_8b5fc28c);
	self.var_eb8e6106 LinkTo(self);
	wait(0.3);
	if(!isdefined(self))
	{
		return;
	}
	animlength = getanimlength(var_741bc875);
	animlength = animlength - animlength * var_ccf94f2d GetAnimTime(var_741bc875);
	animlength = max(animlength, 0.05);
	self moveto(self.origin + var_48845fc2, animlength * 0.75, animlength * 0.75, 0);
	var_5d5aa1dc = var_ccf94f2d GetTagAngles("tag_attach");
	self RotateTo(var_5d5aa1dc, animlength * 0.75);
	self waittill("movedone");
	animlength = getanimlength(var_741bc875);
	animlength = animlength - animlength * var_ccf94f2d GetAnimTime(var_741bc875);
	animlength = max(animlength, 0.05);
	var_bac3e66f = var_ccf94f2d GetTagOrigin("tag_attach");
	self moveto(var_bac3e66f, animlength, animlength, 0);
	self waittill("movedone");
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.var_eb8e6106))
	{
		self.var_eb8e6106 Unlink();
		self.var_eb8e6106 delete();
		self.var_eb8e6106 = undefined;
	}
}

/*
	Name: function_b3f95ed9
	Namespace: namespace_2a78f3c
	Checksum: 0x9980EA02
	Offset: 0x28C0
	Size: 0x228
	Parameters: 3
	Flags: None
	Line Number: 585
*/
function function_b3f95ed9(body, localClientNum, direction)
{
	self endon("hash_9f7623b6");
	self endon("hash_ed5c07ea");
	self notify("hash_7891e14b");
	self.var_52a84f88 = 0;
	s_closest = Array::get_all_closest(self.origin, level.var_3b135a99);
	fieldName = s_closest[0].script_parameters;
	m_body = level.var_3920af6a[localClientNum][fieldName];
	var_ccf94f2d = level.var_1584478b[localClientNum][fieldName];
	level function_3eb5ed9c(m_body, var_ccf94f2d, localClientNum, direction);
	if(!isdefined(var_ccf94f2d) || !isdefined(m_body))
	{
		return;
	}
	m_body.animName = "zombie";
	var_ccf94f2d.animName = "dragon";
	self thread function_d25764(localClientNum);
	self scene::Play(level.var_3574b4dd[direction], Array(m_body, var_ccf94f2d));
	if(!isdefined(var_ccf94f2d) || !isdefined(m_body))
	{
		return;
	}
	m_body.animName = "";
	var_ccf94f2d.animName = "";
	playsound(0, "zmb_weap_wall", var_ccf94f2d.origin);
	var_ccf94f2d thread function_4e838726(localClientNum);
}

/*
	Name: function_d25764
	Namespace: namespace_2a78f3c
	Checksum: 0x2FB91EBD
	Offset: 0x2AF0
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 624
*/
function function_d25764(localClientNum)
{
	while(1)
	{
		self waittill("bite", note);
		if(note == "blood")
		{
			continue;
		}
	}
}

/*
	Name: function_9a098479
	Namespace: namespace_2a78f3c
	Checksum: 0x7376B37A
	Offset: 0x2B40
	Size: 0x190
	Parameters: 3
	Flags: None
	Line Number: 646
*/
function function_9a098479(localClientNum, body, mini)
{
	if(isdefined(self.var_60ea59d4) && self.var_60ea59d4)
	{
		self notify("hash_ed5c07ea");
		self.var_60ea59d4 = undefined;
		var_495d3b8b = level.var_91fb6838[self.targetname];
		self.var_52a84f88 = 0;
		function_71c4474e(level.var_91fb6838[self.targetname]);
		self SetModel("c_zom_dragonhead");
		self thread function_9b8dd0c1(localClientNum);
		self scene::Play(level.var_1c893eb8, self);
		mini thread function_69432c30(localClientNum);
		self thread scene::Play(var_495d3b8b);
		if(isdefined(self))
		{
			self Hide();
		}
		StopForceStreamingXModel("p7_fxanim_zm_castle_dragon_chunks_mod");
		StopForceStreamingXModel("c_zom_dragonhead");
	}
	else if(isdefined(self))
	{
		self Hide();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ac83c3dd
	Namespace: namespace_2a78f3c
	Checksum: 0xBA20F59C
	Offset: 0x2CD8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 685
*/
function function_ac83c3dd(localClientNum)
{
	self MapShaderConstant(localClientNum, 0, "scriptVector0", 1, 0, 0);
}

/*
	Name: function_69432c30
	Namespace: namespace_2a78f3c
	Checksum: 0x47C845B7
	Offset: 0x2D18
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 700
*/
function function_69432c30(localClientNum)
{
	ForceStreamXModel("c_zom_dragonhead_small_e");
	self function_c49281f(localClientNum);
	self SetModel("c_zom_dragonhead_small_e");
	StopForceStreamingXModel("c_zom_dragonhead_small_e");
	self function_dc0c3125(localClientNum);
	PlayFXOnTag(localClientNum, level._effect["mini_dragon_eye"], self, "tag_eye_left_fx");
	while(1)
	{
		wait(randomIntRange(20, 40));
		PlayFXOnTag(localClientNum, level._effect["mini_dragon_fire"], self, "tag_throat_fx");
		wait(randomIntRange(3, 5));
	}
}

/*
	Name: function_1ea46f53
	Namespace: namespace_2a78f3c
	Checksum: 0x77053F5F
	Offset: 0x2E48
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 726
*/
function function_1ea46f53()
{
	level.var_5d9ce53a[1] = "c_zom_der_zombie_head1";
	level.var_5d9ce53a[2] = "c_zom_der_zombie_head1";
	level.var_5d9ce53a[3] = "c_zom_der_zombie_head1";
	level.var_5d9ce53a[4] = "c_zom_der_zombie_head1";
	return;
}

/*
	Name: function_ac36f4b3
	Namespace: namespace_2a78f3c
	Checksum: 0xD208B31C
	Offset: 0x2EB8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 745
*/
function function_ac36f4b3()
{
	ForceStreamXModel("p7_fxanim_zm_castle_dragon_chunks_mod");
	ForceStreamXModel("c_zom_dragonhead");
}

/*
	Name: function_64fe1dc
	Namespace: namespace_2a78f3c
	Checksum: 0xE78EE610
	Offset: 0x2EF8
	Size: 0xF0
	Parameters: 7
	Flags: None
	Line Number: 761
*/
function function_64fe1dc(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		exploder::exploder("lgt_bow_family");
		continue;
	}
	exploder::stop_exploder("lgt_bow_family");
	var_a8802a38 = struct::get("base_bow_pickup_struct", "targetname");
	if(isdefined(var_a8802a38))
	{
		playFX(localClientNum, level._effect["bow_spawn_fx"], var_a8802a38.origin);
	}
}

/*
	Name: function_bf1e32b6
	Namespace: namespace_2a78f3c
	Checksum: 0x34764A16
	Offset: 0x2FF0
	Size: 0xF0
	Parameters: 7
	Flags: None
	Line Number: 786
*/
function function_bf1e32b6(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		exploder::exploder("lgt_bow_family_storm");
		continue;
	}
	exploder::stop_exploder("lgt_bow_family_storm");
	var_9af4f052 = struct::get("base_bow_pickup_struct_storm", "targetname");
	if(isdefined(var_9af4f052))
	{
		playFX(localClientNum, level._effect["bow_spawn_fx"], var_9af4f052.origin);
		return;
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c2d53b4c
	Namespace: namespace_2a78f3c
	Checksum: 0xF59846CA
	Offset: 0x30E8
	Size: 0xF0
	Parameters: 7
	Flags: None
	Line Number: 814
*/
function function_c2d53b4c(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		exploder::exploder("lgt_bow_family_wolf_howl");
		continue;
	}
	exploder::stop_exploder("lgt_bow_family_wolf_howl");
	var_de6171a0 = struct::get("base_bow_pickup_struct_wolf_howl", "targetname");
	if(isdefined(var_de6171a0))
	{
		playFX(localClientNum, level._effect["bow_spawn_fx"], var_de6171a0.origin);
	}
}

/*
	Name: function_bf8665c9
	Namespace: namespace_2a78f3c
	Checksum: 0x642A8883
	Offset: 0x31E0
	Size: 0xF0
	Parameters: 7
	Flags: None
	Line Number: 839
*/
function function_bf8665c9(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		exploder::exploder("lgt_bow_family_demongate");
		continue;
	}
	exploder::stop_exploder("lgt_bow_family_demongate");
	var_f3e8cf3d = struct::get("base_bow_pickup_struct_demongate", "targetname");
	if(isdefined(var_f3e8cf3d))
	{
		playFX(localClientNum, level._effect["bow_spawn_fx"], var_f3e8cf3d.origin);
	}
}

/*
	Name: function_de7c720f
	Namespace: namespace_2a78f3c
	Checksum: 0x1407A3BA
	Offset: 0x32D8
	Size: 0xEC
	Parameters: 7
	Flags: None
	Line Number: 864
*/
function function_de7c720f(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		exploder::exploder("lgt_bow_family_rune_prison");
		continue;
	}
	exploder::stop_exploder("lgt_bow_family_rune_prison");
	var_3f5f0a03 = struct::get("base_bow_pickup_struct_rune_prison", "targetname");
	if(isdefined(var_3f5f0a03))
	{
		playFX(localClientNum, level._effect["bow_spawn_fx"], var_3f5f0a03.origin);
	}
}

