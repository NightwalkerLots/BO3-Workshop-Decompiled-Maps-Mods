#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_2a78f3c;

/*
	Name: __init__sytem__
	Namespace: namespace_2a78f3c
	Checksum: 0x853ACC6D
	Offset: 0xC60
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 33
*/
function autoexec __init__sytem__()
{
	system::register("zm_castle_weap_quest", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_2a78f3c
	Checksum: 0xBD594EFD
	Offset: 0xCA8
	Size: 0x3D8
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function __init__()
{
	/#
		level flag::init("Dev Block strings are not supported");
	#/
	flag::init("soul_catchers_charged");
	level.soul_catchers = [];
	level.soul_catchers_vol = [];
	level.var_824fb3b4 = &function_ae6fbbca;
	level thread create_anim_references_on_server();
	clientfield::register("actor", "make_client_clone", 5000, 4, "int");
	clientfield::register("toplayer", "bow_pickup_fx", 5000, 1, "int");
	clientfield::register("toplayer", "bow_pickup_fx_storm", 5000, 1, "int");
	clientfield::register("toplayer", "bow_pickup_fx_wolf_howl", 5000, 1, "int");
	clientfield::register("toplayer", "bow_pickup_fx_demongate", 5000, 1, "int");
	clientfield::register("toplayer", "bow_pickup_fx_rune_prison", 5000, 1, "int");
	clientfield::register("scriptmover", "fx_bowglow", 1, 1, "int");
	level.var_3b135a99 = struct::get_array("dragon_position", "targetname");
	for(i = 0; i < level.var_3b135a99.size; i++)
	{
		clientfield::register("world", level.var_3b135a99[i].script_parameters, 5000, 3, "int");
		level.soul_catchers[i] = level.var_3b135a99[i];
		level.soul_catchers_vol[i] = GetEnt(level.var_3b135a99[i].target, "targetname");
	}
	for(i = 0; i < level.soul_catchers.size; i++)
	{
		level.soul_catchers[i].var_dc72b72b = 0;
		level.soul_catchers[i].is_eating = 0;
		level.soul_catchers[i] thread soul_catcher_check();
		level.soul_catchers[i] thread soul_catcher_state_manager();
		level.soul_catchers[i] thread function_f394c912("bow_door_sign_" + i + 1);
		level.soul_catchers_vol[i] = GetEnt(level.soul_catchers[i].target, "targetname");
	}
	level.var_423db59a = 0;
}

/*
	Name: __main__
	Namespace: namespace_2a78f3c
	Checksum: 0xB18B872E
	Offset: 0x1088
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function __main__()
{
	Array::thread_all(level.zombie_spawners, &spawner::add_spawn_function, &zombie_spawn_func);
}

/*
	Name: create_anim_references_on_server
	Namespace: namespace_2a78f3c
	Checksum: 0x76276C28
	Offset: 0x10D0
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 109
*/
function create_anim_references_on_server()
{
	root = "root";
	var_5fdb7ddc = "o_zm_dlc1_dragonhead_intro";
	var_1c893eb8 = "o_zm_dlc1_dragonhead_outtro";
	var_a769589d = "o_zm_dlc1_dragonhead_static";
	var_3520f2c7 = "o_zm_dlc1_dragonhead_consume_pre_eat_l_2_r";
	var_f562754b = "o_zm_dlc1_dragonhead_consume_pre_eat_r_2_l";
	var_cd62eb0e = [];
	var_cd62eb0e[0] = "o_zm_dlc1_dragonhead_idle";
	var_2b27c866 = [];
	var_2b27c866[0] = "o_zm_dlc1_dragonhead_idle_twitch_roar";
	var_8ef04c84 = "ai_zm_dlc1_dragonhead_zombie_impact";
	var_9409203f = "ai_zm_dlc1_dragonhead_zombie_rise";
	var_19086cf8 = [];
	var_19086cf8["right"] = "o_zm_dlc1_dragonhead_consume_pre_eat_r";
	var_19086cf8["left"] = "o_zm_dlc1_dragonhead_consume_pre_eat_l";
	var_19086cf8["front"] = "o_zm_dlc1_dragonhead_consume_pre_eat_f";
	var_3574b4dd["right"] = "o_zm_dlc1_dragonhead_consume_align_r";
	var_3574b4dd["left"] = "o_zm_dlc1_dragonhead_consume_align_l";
	var_3574b4dd["front"] = "o_zm_dlc1_dragonhead_consume_align_f";
	var_2914ff53["right"] = "rtrg_ai_zm_dlc1_dragonhead_consume_zombie_align_r";
	var_2914ff53["left"] = "rtrg_ai_zm_dlc1_dragonhead_consume_zombie_align_l";
	var_2914ff53["front"] = "rtrg_ai_zm_dlc1_dragonhead_consume_zombie_align_f";
}

/*
	Name: soul_catcher_state_manager
	Namespace: namespace_2a78f3c
	Checksum: 0x700CE0E1
	Offset: 0x12B8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 145
*/
function soul_catcher_state_manager()
{
	wait(1);
	level clientfield::set(self.script_parameters, 7);
	self waittill("first_zombie_killed_in_zone", e_player);
	level clientfield::set(self.script_parameters, 1);
	anim_length = getanimlength("o_zm_dlc1_dragonhead_intro");
	wait(anim_length);
	while(!self.is_charged)
	{
		level clientfield::set(self.script_parameters, 2);
		self util::waittill_either("fully_charged", "finished_eating");
	}
	level clientfield::set(self.script_parameters, 6);
}

/*
	Name: zombie_spawn_func
	Namespace: namespace_2a78f3c
	Checksum: 0xDFEEC18A
	Offset: 0x13D0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 171
*/
function zombie_spawn_func()
{
	self.actor_killed_override = &zombie_killed_override;
}

/*
	Name: zombie_killed_override
	Namespace: namespace_2a78f3c
	Checksum: 0xC34AC4DD
	Offset: 0x13F8
	Size: 0x110
	Parameters: 8
	Flags: None
	Line Number: 186
*/
function zombie_killed_override(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime)
{
	if(self.archetype != "zombie")
	{
		return;
	}
	if(isPlayer(attacker))
	{
		for(i = 0; i < level.soul_catchers.size; i++)
		{
			if(self istouching(level.soul_catchers_vol[i]))
			{
				if(!level.soul_catchers[i].is_charged)
				{
					self.var_a3f931ae = level.soul_catchers[i];
					self.deathFunction = &zombie_soul_catcher_death;
				}
			}
		}
	}
}

/*
	Name: function_ae6fbbca
	Namespace: namespace_2a78f3c
	Checksum: 0x976BEA10
	Offset: 0x1510
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 218
*/
function function_ae6fbbca()
{
	if(self.archetype != "zombie")
	{
		return 0;
	}
	for(i = 0; i < level.soul_catchers.size; i++)
	{
		if(self istouching(level.soul_catchers_vol[i]))
		{
			if(!level.soul_catchers[i].is_charged && !level.soul_catchers[i].is_eating)
			{
				return 1;
			}
		}
	}
	return 0;
	ERROR: Bad function call
}

/*
	Name: zombie_soul_catcher_death
	Namespace: namespace_2a78f3c
	Checksum: 0xCEE08790
	Offset: 0x15C8
	Size: 0x3B8
	Parameters: 8
	Flags: None
	Line Number: 248
*/
function zombie_soul_catcher_death(eInflictor, attacker, iDamage, sMeansOfDeath, weapon, vDir, sHitLoc, psOffsetTime)
{
	var_a3f931ae = self.var_a3f931ae;
	level zm_spawner::zombie_death_points(self.origin, self.damageMod, self.damagelocation, self.attacker, self);
	level.var_432ce604 = self.attacker;
	if(var_a3f931ae.is_eating)
	{
		return 0;
	}
	if(var_a3f931ae.var_dc72b72b >= 8)
	{
		return 0;
	}
	if(var_a3f931ae.var_dc72b72b == 0)
	{
		var_a3f931ae.var_dc72b72b = var_a3f931ae.var_dc72b72b + 1;
		var_a3f931ae notify("first_zombie_killed_in_zone", self.attacker);
		var_a3f931ae.is_eating = 1;
		var_a3f931ae thread function_90c9c3e7();
		return 0;
	}
	self thread zm_spawner::zombie_death_animscript();
	var_a3f931ae.is_eating = 1;
	n_eating_anim = self which_eating_anim();
	client_notify_value = 1;
	self clientfield::set("make_client_clone", client_notify_value);
	self ghost();
	if(var_a3f931ae.var_dc72b72b >= 7)
	{
		level clientfield::set(var_a3f931ae.script_parameters, 0);
	}
	var_39f6d07 = "ai_zm_dlc1_dragonhead_zombie_impact";
	n_anim_time = getanimlength(var_39f6d07) + 0.2;
	wait(n_anim_time);
	level clientfield::set(var_a3f931ae.script_parameters, n_eating_anim);
	if(n_eating_anim == 3)
	{
		var_f766f484 = getanimlength("o_zm_dlc1_dragonhead_consume_pre_eat_f") + getanimlength("ai_zm_dlc1_dragonhead_consume_zombie_align_f");
	}
	else if(n_eating_anim == 4)
	{
		var_f766f484 = getanimlength("o_zm_dlc1_dragonhead_consume_pre_eat_r") + getanimlength("ai_zm_dlc1_dragonhead_consume_zombie_align_r");
		continue;
	}
	var_f766f484 = getanimlength("o_zm_dlc1_dragonhead_consume_pre_eat_l") + getanimlength("ai_zm_dlc1_dragonhead_consume_zombie_align_l");
	wait(var_f766f484 - 0.5);
	var_a3f931ae.var_dc72b72b++;
	wait(0.5);
	var_a3f931ae notify("finished_eating");
	var_a3f931ae.is_eating = 0;
	if(isdefined(self))
	{
		self delete();
	}
	return 1;
}

/*
	Name: get_correct_model_array
	Namespace: namespace_2a78f3c
	Checksum: 0x55030666
	Offset: 0x1988
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 315
*/
function get_correct_model_array()
{
	mod = 0;
	if(self.model == "c_zom_guard_body" && isdefined(self.hatModel) && self.hatModel == "c_zom_der_zombie_helmet1")
	{
		mod = 4;
	}
	if(self.head == "c_zom_zombie_barbwire_head")
	{
		return 1 + mod;
	}
	if(self.head == "c_zom_zombie_hellcatraz_head")
	{
		return 2 + mod;
	}
	if(self.head == "c_zom_zombie_mask_head")
	{
		return 3 + mod;
	}
	if(self.head == "c_zom_zombie_slackjaw_head")
	{
		return 4 + mod;
	}
	return 5;
}

/*
	Name: function_90c9c3e7
	Namespace: namespace_2a78f3c
	Checksum: 0xCEC7D96D
	Offset: 0x1A68
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 351
*/
function function_90c9c3e7()
{
	anim_length = getanimlength("o_zm_dlc1_dragonhead_intro");
	wait(anim_length);
	self notify("hash_685477eb");
	self.is_eating = 0;
}

/*
	Name: which_eating_anim
	Namespace: namespace_2a78f3c
	Checksum: 0x7889EC6F
	Offset: 0x1AB8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 369
*/
function which_eating_anim()
{
	soul_catcher = self.var_a3f931ae;
	forward_dot = VectorDot(AnglesToForward(soul_catcher.angles), VectorNormalize(self.origin - soul_catcher.origin));
	if(forward_dot > 0.7)
	{
		return 3;
	}
	right_dot = VectorDot(AnglesToRight(soul_catcher.angles), self.origin - soul_catcher.origin);
	if(right_dot > 0)
	{
		return 4;
	}
	return 5;
}

/*
	Name: soul_catcher_check
	Namespace: namespace_2a78f3c
	Checksum: 0xD9DE3863
	Offset: 0x1BC0
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 395
*/
function soul_catcher_check()
{
	self.is_charged = 0;
	while(1)
	{
		if(self.var_dc72b72b >= 8)
		{
			level.var_423db59a++;
			self.is_charged = 1;
			self notify("fully_charged");
			break;
		}
		wait(0.05);
	}
	if(level.var_423db59a == 1)
	{
		self thread function_eb283eb();
	}
	else if(level.var_423db59a >= level.soul_catchers.size)
	{
		level flag::set("soul_catchers_charged");
		self thread function_971cbec2();
		level thread function_e79b1af8();
		level notify("hash_af77a804");
	}
}

/*
	Name: function_f394c912
	Namespace: namespace_2a78f3c
	Checksum: 0x5CB4C0E2
	Offset: 0x1CC8
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 432
*/
function function_f394c912(var_e6a1c3c)
{
	self waittill("fully_charged");
	if(self.script_label == "dragonhead_1")
	{
		m_collision = GetEnt("uc_dragoncollision", "targetname");
		m_collision delete();
	}
	else if(self.script_label == "dragonhead_2")
	{
		m_collision = GetEnt("lc_dragoncollision", "targetname");
		m_collision delete();
	}
}

/*
	Name: function_cdad3c4c
	Namespace: namespace_2a78f3c
	Checksum: 0x9ACF73B8
	Offset: 0x1D90
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 457
*/
function function_cdad3c4c()
{
}

/*
	Name: function_eb283eb
	Namespace: namespace_2a78f3c
	Checksum: 0x9ACF73B8
	Offset: 0x1DA0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 471
*/
function function_eb283eb()
{
}

/*
	Name: function_971cbec2
	Namespace: namespace_2a78f3c
	Checksum: 0x9ACF73B8
	Offset: 0x1DB0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 485
*/
function function_971cbec2()
{
}

/*
	Name: function_e79b1af8
	Namespace: namespace_2a78f3c
	Checksum: 0xEA02C4EE
	Offset: 0x1DC0
	Size: 0x360
	Parameters: 0
	Flags: None
	Line Number: 499
*/
function function_e79b1af8()
{
	/#
		if(level flag::get("Dev Block strings are not supported"))
		{
			return;
		}
		level flag::set("Dev Block strings are not supported");
	#/
	var_a8802a38 = struct::get("base_bow_pickup_struct", "targetname");
	model = spawn("script_model", var_a8802a38.origin);
	model SetModel("wpn_t7_zmb_bow_base_world");
	FX = spawn("script_model", (530.5, -361.5, 62));
	FX SetModel("tag_origin");
	FX clientfield::set("fx_bowglow", 1);
	level thread scene::Play("p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
	wait(0.25);
	level.var_55bd5b9a = GetEnt("base_bow_pickup", "targetname");
	var_a8802a38 function_948153b();
	Array::thread_all(level.players, &function_653b1303);
	callback::on_connect(&function_8d11928d);
	var_18790ed3 = Array("rune_prison_spawned", "demon_gate_spawned", "elemental_storm_spawned", "wolf_howl_spawned", "ee_start_done");
	flag::wait_till_all(var_18790ed3);
	level notify("hash_fac2d8a9");
	foreach(e_player in level.players)
	{
		e_player clientfield::set_to_player("bow_pickup_fx", 0);
	}
	level scene::stop("p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
	callback::remove_on_connect(&function_8d11928d);
	zm_unitrigger::unregister_unitrigger(var_a8802a38.var_4393aaa2);
	wait(5);
	level thread struct::delete_script_bundle("scene", "p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
}

/*
	Name: function_653b1303
	Namespace: namespace_2a78f3c
	Checksum: 0xC1883A6B
	Offset: 0x2128
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 544
*/
function function_653b1303()
{
	self endon("death");
	level endon("hash_fac2d8a9");
	self clientfield::set_to_player("bow_pickup_fx", 1);
	var_a8802a38 = struct::get("base_bow_pickup_struct", "targetname");
	while(1)
	{
		self util::waittill_either("weapon_change", "show_base_bow");
		if(!self function_827e13c3())
		{
			if(isdefined(level.var_55bd5b9a))
			{
				level.var_55bd5b9a setvisibletoplayer(self);
			}
			self clientfield::set_to_player("bow_pickup_fx", 1);
		}
		else if(isdefined(level.var_55bd5b9a))
		{
			level.var_55bd5b9a setinvisibletoplayer(self);
		}
		self clientfield::set_to_player("bow_pickup_fx", 0);
		var_a8802a38.var_4393aaa2 thread zm_unitrigger::run_visibility_function_for_all_triggers();
	}
}

/*
	Name: function_827e13c3
	Namespace: namespace_2a78f3c
	Checksum: 0x70A50BED
	Offset: 0x2290
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 580
*/
function function_827e13c3()
{
	if(self hasweapon(GetWeapon("elemental_bow")) || self hasweapon(GetWeapon("elemental_bow_wolf_howl")) || self hasweapon(GetWeapon("elemental_bow_storm")) || self hasweapon(GetWeapon("elemental_bow_rune_prison")) || self hasweapon(GetWeapon("elemental_bow_demongate")))
	{
		return 0;
	}
	return 0;
}

/*
	Name: function_8355cde8
	Namespace: namespace_2a78f3c
	Checksum: 0x738260E1
	Offset: 0x2390
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 599
*/
function function_8355cde8()
{
	self notify("hash_d374b60d");
	self endon("death");
	self endon("hash_d374b60d");
	level endon("hash_fac2d8a9");
	var_4d182dc7 = GetWeapon("elemental_bow");
	while(1)
	{
		self util::waittill_either("projectile_impact", "zmb_max_ammo");
		if(self hasweapon(var_4d182dc7))
		{
			self.var_475a977 = self GetWeaponAmmoStock(var_4d182dc7);
			self.var_970b3d70 = self GetWeaponAmmoClip(var_4d182dc7);
		}
	}
}

/*
	Name: function_88f484b6
	Namespace: namespace_2a78f3c
	Checksum: 0x9BA34305
	Offset: 0x2478
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 627
*/
function function_88f484b6()
{
	self notify("hash_9691e7f8");
	self endon("death");
	self endon("hash_9691e7f8");
	level endon("hash_fac2d8a9");
	var_4d182dc7 = GetWeapon("elemental_bow");
	var_2ee9db9a = -1;
	while(var_2ee9db9a != self.characterindex)
	{
		level waittill("bleed_out", var_2ee9db9a);
	}
	self.var_475a977 = var_4d182dc7.maxAmmo;
	self.var_970b3d70 = var_4d182dc7.clipSize;
}

/*
	Name: function_8d11928d
	Namespace: namespace_2a78f3c
	Checksum: 0x3B6F5200
	Offset: 0x2540
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 653
*/
function function_8d11928d()
{
	self thread function_653b1303();
}

/*
	Name: function_948153b
	Namespace: namespace_2a78f3c
	Checksum: 0xB0D0C3D1
	Offset: 0x2568
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 668
*/
function function_948153b()
{
	s_unitrigger = spawnstruct();
	s_unitrigger.origin = self.origin;
	s_unitrigger.angles = self.angles;
	s_unitrigger.script_unitrigger_type = "unitrigger_radius_use";
	s_unitrigger.radius = 100;
	s_unitrigger.cursor_hint = "HINT_NOICON";
	s_unitrigger.hint_string = "Press and hold ^3&&1^7 to take Wrath of the Ancients";
	s_unitrigger.require_look_at = 1;
	zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
	s_unitrigger.prompt_and_visibility_func = &function_2043f090;
	self.var_4393aaa2 = s_unitrigger;
	zm_unitrigger::register_static_unitrigger(s_unitrigger, &function_e32a9630);
}

/*
	Name: function_2043f090
	Namespace: namespace_2a78f3c
	Checksum: 0xA4BFE19F
	Offset: 0x2680
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 694
*/
function function_2043f090(e_player)
{
	if(e_player function_827e13c3() || e_player function_8030b51b())
	{
		self setHintString(&"Press and hold ^3&&1^7 to take Wrath of the Ancients");
		return 0;
	}
	self setHintString(&"Press and hold ^3&&1^7 to take Wrath of the Ancients");
	return 1;
}

/*
	Name: function_e32a9630
	Namespace: namespace_2a78f3c
	Checksum: 0xA79417E2
	Offset: 0x2708
	Size: 0x2A0
	Parameters: 0
	Flags: None
	Line Number: 715
*/
function function_e32a9630()
{
	self endon("kill_trigger");
	level endon("hash_fac2d8a9");
	self.stub thread zm_unitrigger::run_visibility_function_for_all_triggers();
	while(1)
	{
		self waittill("trigger", e_who);
		if(e_who function_827e13c3() || e_who function_8030b51b())
		{
			continue;
		}
		var_5b973c4a = zm_utility::get_player_weapon_limit(e_who);
		var_22b0ca63 = e_who getweaponslistprimaries();
		if(var_22b0ca63.size > var_5b973c4a)
		{
			w_current = e_who GetCurrentWeapon();
			e_who zm_weapons::weapon_take(w_current);
		}
		var_c67f6fed = GetWeapon("elemental_bow");
		e_who zm_weapons::weapon_give(var_c67f6fed, 0, 0, 1);
		if(isdefined(e_who.var_475a977))
		{
			e_who SetWeaponAmmoStock(var_c67f6fed, e_who.var_475a977);
		}
		if(isdefined(e_who.var_970b3d70))
		{
			e_who SetWeaponAmmoClip(var_c67f6fed, e_who.var_970b3d70);
			continue;
		}
		e_who SetWeaponAmmoClip(var_c67f6fed, var_c67f6fed.clipSize);
		e_who SwitchToWeapon(var_c67f6fed);
		e_who thread function_8355cde8();
		e_who thread function_88f484b6();
		level.var_55bd5b9a setinvisibletoplayer(e_who);
		e_who clientfield::set_to_player("bow_pickup_fx", 0);
		self.stub thread zm_unitrigger::run_visibility_function_for_all_triggers();
	}
}

/*
	Name: function_8030b51b
	Namespace: namespace_2a78f3c
	Checksum: 0xC64DDE8B
	Offset: 0x29B0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 765
*/
function function_8030b51b()
{
	if(!self function_d7cc60fb() || !self function_17893c41())
	{
		return 1;
	}
	w_current = self GetCurrentWeapon();
	if(zm_utility::is_placeable_mine(w_current) || zm_equipment::is_equipment_that_blocks_purchase(w_current) || self hasweapon(GetWeapon("minigun")))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_f4b84c12
	Namespace: namespace_2a78f3c
	Checksum: 0xEACEF9AC
	Offset: 0x2A80
	Size: 0x280
	Parameters: 0
	Flags: None
	Line Number: 789
*/
function function_f4b84c12()
{
	/#
		if(level flag::get("Dev Block strings are not supported"))
		{
			return;
		}
		level flag::set("Dev Block strings are not supported");
	#/
	var_9af4f052 = struct::get("base_bow_pickup_struct_storm", "targetname");
	model = spawn("script_model", var_9af4f052.origin);
	model.angles = VectorScale((0, 1, 0), 180);
	model SetModel("wpn_t7_zmb_bow_storm_world");
	level thread scene::Play("p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
	wait(0.25);
	level.var_dc5d12ec = GetEnt("base_bow_pickup_storm", "targetname");
	var_9af4f052 function_ff645211();
	Array::thread_all(level.players, &function_dbb3d589);
	callback::on_connect(&function_f3c35b8b);
	foreach(e_player in level.players)
	{
		e_player clientfield::set_to_player("bow_pickup_fx_storm", 0);
	}
	level scene::stop("p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
	callback::remove_on_connect(&function_f3c35b8b);
	wait(5);
	level thread struct::delete_script_bundle("scene", "p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
	return;
}

/*
	Name: function_dbb3d589
	Namespace: namespace_2a78f3c
	Checksum: 0xC114B6B7
	Offset: 0x2D08
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 829
*/
function function_dbb3d589()
{
	self endon("death");
	self clientfield::set_to_player("bow_pickup_fx_storm", 1);
	var_9af4f052 = struct::get("base_bow_pickup_struct_storm", "targetname");
	while(1)
	{
		self util::waittill_either("weapon_change", "show_base_bow");
		if(!self function_e9268449())
		{
			if(isdefined(level.var_dc5d12ec))
			{
				level.var_dc5d12ec setvisibletoplayer(self);
			}
			self clientfield::set_to_player("bow_pickup_fx_storm", 1);
		}
		else if(isdefined(level.var_dc5d12ec))
		{
			level.var_dc5d12ec setinvisibletoplayer(self);
		}
		self clientfield::set_to_player("bow_pickup_fx_storm", 0);
		var_9af4f052.var_47937684 thread zm_unitrigger::run_visibility_function_for_all_triggers();
	}
}

/*
	Name: function_e9268449
	Namespace: namespace_2a78f3c
	Checksum: 0xC7F5D7
	Offset: 0x2E60
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 864
*/
function function_e9268449()
{
	if(self hasweapon(GetWeapon("elemental_bow")) || self hasweapon(GetWeapon("elemental_bow_wolf_howl")) || self hasweapon(GetWeapon("elemental_bow_storm")) || self hasweapon(GetWeapon("elemental_bow_rune_prison")) || self hasweapon(GetWeapon("elemental_bow_demongate")))
	{
		return 0;
	}
	return 0;
}

/*
	Name: function_e2bc7482
	Namespace: namespace_2a78f3c
	Checksum: 0x3CBE2EE0
	Offset: 0x2F60
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 883
*/
function function_e2bc7482()
{
	self endon("death");
	var_fec7c2d = GetWeapon("elemental_bow_storm");
	while(1)
	{
		self util::waittill_either("projectile_impact", "zmb_max_ammo");
		if(self hasweapon(var_fec7c2d))
		{
			self.var_c07d875d = self GetWeaponAmmoStock(var_fec7c2d);
			self.var_674b8a3a = self GetWeaponAmmoClip(var_fec7c2d);
		}
	}
}

/*
	Name: function_d34b2118
	Namespace: namespace_2a78f3c
	Checksum: 0x1C4A7906
	Offset: 0x3020
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 908
*/
function function_d34b2118()
{
	self endon("death");
	var_fec7c2d = GetWeapon("elemental_bow_storm");
	var_882592ec = -1;
	while(var_882592ec != self.characterindex)
	{
		level waittill("bleed_out", var_882592ec);
	}
	self.var_c07d875d = var_fec7c2d.maxAmmo;
	self.var_674b8a3a = var_fec7c2d.clipSize;
}

/*
	Name: function_f3c35b8b
	Namespace: namespace_2a78f3c
	Checksum: 0xA53DFC05
	Offset: 0x30C0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 931
*/
function function_f3c35b8b()
{
	self thread function_dbb3d589();
}

/*
	Name: function_ff645211
	Namespace: namespace_2a78f3c
	Checksum: 0x873BF47B
	Offset: 0x30E8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 946
*/
function function_ff645211()
{
	s_unitrigger = spawnstruct();
	s_unitrigger.origin = self.origin;
	s_unitrigger.angles = self.angles;
	s_unitrigger.script_unitrigger_type = "unitrigger_radius_use";
	s_unitrigger.radius = 100;
	s_unitrigger.cursor_hint = "HINT_NOICON";
	s_unitrigger.hint_string = "Press and hold ^3&&1^7 to swap for Kreemaâahm la Ahmahm";
	s_unitrigger.require_look_at = 1;
	zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
	s_unitrigger.prompt_and_visibility_func = &function_e028129a;
	self.var_47937684 = s_unitrigger;
	zm_unitrigger::register_static_unitrigger(s_unitrigger, &function_783bd3fa);
}

/*
	Name: function_e028129a
	Namespace: namespace_2a78f3c
	Checksum: 0x4402F97F
	Offset: 0x3200
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 972
*/
function function_e028129a(e_player)
{
	if(e_player function_e9268449() || e_player function_4a1fe8b1())
	{
		self setHintString(&"Press and hold ^3&&1^7 to swap for Kreemaâahm la Ahmahm");
		return 0;
	}
	self setHintString(&"Press and hold ^3&&1^7 to swap for Kreemaâahm la Ahmahm");
	return 1;
}

/*
	Name: function_783bd3fa
	Namespace: namespace_2a78f3c
	Checksum: 0x612459E5
	Offset: 0x3288
	Size: 0x290
	Parameters: 0
	Flags: None
	Line Number: 993
*/
function function_783bd3fa()
{
	self endon("kill_trigger");
	self.stub thread zm_unitrigger::run_visibility_function_for_all_triggers();
	while(1)
	{
		self waittill("trigger", e_who);
		if(e_who function_e9268449() || e_who function_4a1fe8b1())
		{
			continue;
		}
		var_471deddc = zm_utility::get_player_weapon_limit(e_who);
		var_9c74e829 = e_who getweaponslistprimaries();
		if(var_9c74e829.size > var_471deddc)
		{
			w_current = e_who GetCurrentWeapon();
			e_who zm_weapons::weapon_take(w_current);
		}
		var_d882b22b = GetWeapon("elemental_bow_storm");
		e_who zm_weapons::weapon_give(var_d882b22b, 0, 0, 1);
		if(isdefined(e_who.var_c07d875d))
		{
			e_who SetWeaponAmmoStock(var_d882b22b, e_who.var_c07d875d);
		}
		if(isdefined(e_who.var_674b8a3a))
		{
			e_who SetWeaponAmmoClip(var_d882b22b, e_who.var_674b8a3a);
			continue;
		}
		e_who SetWeaponAmmoClip(var_d882b22b, var_d882b22b.clipSize);
		e_who SwitchToWeapon(var_d882b22b);
		e_who thread function_e2bc7482();
		e_who thread function_d34b2118();
		level.var_dc5d12ec setinvisibletoplayer(e_who);
		e_who clientfield::set_to_player("bow_pickup_fx_storm", 0);
		self.stub thread zm_unitrigger::run_visibility_function_for_all_triggers();
	}
}

/*
	Name: function_4a1fe8b1
	Namespace: namespace_2a78f3c
	Checksum: 0x762BA8E1
	Offset: 0x3520
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 1042
*/
function function_4a1fe8b1()
{
	if(!self function_d7cc60fb() || !self function_17893c41())
	{
		return 1;
	}
	w_current = self GetCurrentWeapon();
	if(zm_utility::is_placeable_mine(w_current) || zm_equipment::is_equipment_that_blocks_purchase(w_current) || self hasweapon(GetWeapon("minigun")))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_7ead0560
	Namespace: namespace_2a78f3c
	Checksum: 0x62C7B6C3
	Offset: 0x35F0
	Size: 0x280
	Parameters: 0
	Flags: None
	Line Number: 1066
*/
function function_7ead0560()
{
	/#
		if(level flag::get("Dev Block strings are not supported"))
		{
			return;
		}
		level flag::set("Dev Block strings are not supported");
	#/
	var_de6171a0 = struct::get("base_bow_pickup_struct_wolf_howl", "targetname");
	model = spawn("script_model", var_de6171a0.origin);
	model.angles = VectorScale((0, 1, 0), 135.398);
	model SetModel("wpn_t7_zmb_bow_wolf_world");
	level thread scene::Play("p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
	wait(0.25);
	level.var_4de6b326 = GetEnt("base_bow_pickup_wolf_howl", "targetname");
	var_de6171a0 function_fdb7193b();
	Array::thread_all(level.players, &function_c31eb2b3);
	callback::on_connect(&function_9c2362f1);
	foreach(e_player in level.players)
	{
		e_player clientfield::set_to_player("bow_pickup_fx_wolf_howl", 0);
	}
	level scene::stop("p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
	callback::remove_on_connect(&function_9c2362f1);
	wait(5);
	level thread struct::delete_script_bundle("scene", "p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
}

/*
	Name: function_c31eb2b3
	Namespace: namespace_2a78f3c
	Checksum: 0x614578EA
	Offset: 0x3878
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 1105
*/
function function_c31eb2b3()
{
	self endon("death");
	self clientfield::set_to_player("bow_pickup_fx_wolf_howl", 1);
	var_de6171a0 = struct::get("base_bow_pickup_struct_wolf_howl", "targetname");
	while(1)
	{
		self util::waittill_either("weapon_change", "show_base_bow");
		if(!self function_55f01e73())
		{
			if(isdefined(level.var_4de6b326))
			{
				level.var_4de6b326 setvisibletoplayer(self);
			}
			self clientfield::set_to_player("bow_pickup_fx_wolf_howl", 1);
		}
		else if(isdefined(level.var_4de6b326))
		{
			level.var_4de6b326 setinvisibletoplayer(self);
		}
		self clientfield::set_to_player("bow_pickup_fx_wolf_howl", 0);
		var_de6171a0.var_d53341de thread zm_unitrigger::run_visibility_function_for_all_triggers();
	}
}

/*
	Name: function_55f01e73
	Namespace: namespace_2a78f3c
	Checksum: 0x480201E2
	Offset: 0x39D0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 1140
*/
function function_55f01e73()
{
	if(self hasweapon(GetWeapon("elemental_bow")) || self hasweapon(GetWeapon("elemental_bow_wolf_howl")) || self hasweapon(GetWeapon("elemental_bow_storm")) || self hasweapon(GetWeapon("elemental_bow_rune_prison")) || self hasweapon(GetWeapon("elemental_bow_demongate")))
	{
		return 0;
	}
	return 0;
}

/*
	Name: function_5d38a3d0
	Namespace: namespace_2a78f3c
	Checksum: 0x8507F724
	Offset: 0x3AD0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 1159
*/
function function_5d38a3d0()
{
	self endon("death");
	var_fb38ab6f = GetWeapon("elemental_bow_wolf_howl");
	while(1)
	{
		self util::waittill_either("projectile_impact", "zmb_max_ammo");
		if(self hasweapon(var_fb38ab6f))
		{
			self.var_790289f = self GetWeaponAmmoStock(var_fb38ab6f);
			self.var_553c95e8 = self GetWeaponAmmoClip(var_fb38ab6f);
		}
	}
}

/*
	Name: function_cd3c019a
	Namespace: namespace_2a78f3c
	Checksum: 0xAB8BEEDC
	Offset: 0x3B90
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1184
*/
function function_cd3c019a()
{
	self endon("death");
	var_fb38ab6f = GetWeapon("elemental_bow_wolf_howl");
	var_db73326 = -1;
	while(var_db73326 != self.characterindex)
	{
		level waittill("bleed_out", var_db73326);
	}
	self.var_790289f = var_fb38ab6f.maxAmmo;
	self.var_553c95e8 = var_fb38ab6f.clipSize;
}

/*
	Name: function_9c2362f1
	Namespace: namespace_2a78f3c
	Checksum: 0x80E0B187
	Offset: 0x3C30
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1207
*/
function function_9c2362f1()
{
	self thread function_c31eb2b3();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fdb7193b
	Namespace: namespace_2a78f3c
	Checksum: 0xFE2E4838
	Offset: 0x3C58
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 1224
*/
function function_fdb7193b()
{
	s_unitrigger = spawnstruct();
	s_unitrigger.origin = self.origin;
	s_unitrigger.angles = self.angles;
	s_unitrigger.script_unitrigger_type = "unitrigger_radius_use";
	s_unitrigger.radius = 100;
	s_unitrigger.cursor_hint = "HINT_NOICON";
	s_unitrigger.hint_string = "Press and hold ^3&&1^7 to swap for Kreeholo lu Kreemasaleet";
	s_unitrigger.require_look_at = 1;
	zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
	s_unitrigger.prompt_and_visibility_func = &function_38f17d08;
	self.var_d53341de = s_unitrigger;
	zm_unitrigger::register_static_unitrigger(s_unitrigger, &function_b82909a8);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_38f17d08
	Namespace: namespace_2a78f3c
	Checksum: 0x401C8090
	Offset: 0x3D70
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1252
*/
function function_38f17d08(e_player)
{
	if(e_player function_55f01e73() || e_player function_aae1b69b())
	{
		self setHintString(&"Press and hold ^3&&1^7 to swap for Kreeholo lu Kreemasaleet");
		return 0;
	}
	self setHintString(&"Press and hold ^3&&1^7 to swap for Kreeholo lu Kreemasaleet");
	return 1;
}

/*
	Name: function_b82909a8
	Namespace: namespace_2a78f3c
	Checksum: 0x66CAF675
	Offset: 0x3DF8
	Size: 0x290
	Parameters: 0
	Flags: None
	Line Number: 1273
*/
function function_b82909a8()
{
	self endon("kill_trigger");
	self.stub thread zm_unitrigger::run_visibility_function_for_all_triggers();
	while(1)
	{
		self waittill("trigger", e_who);
		if(e_who function_55f01e73() || e_who function_aae1b69b())
		{
			continue;
		}
		var_d19c9c16 = zm_utility::get_player_weapon_limit(e_who);
		var_a3ba5013 = e_who getweaponslistprimaries();
		if(var_a3ba5013.size > var_d19c9c16)
		{
			w_current = e_who GetCurrentWeapon();
			e_who zm_weapons::weapon_take(w_current);
		}
		var_5caa1e51 = GetWeapon("elemental_bow_wolf_howl");
		e_who zm_weapons::weapon_give(var_5caa1e51, 0, 0, 1);
		if(isdefined(e_who.var_790289f))
		{
			e_who SetWeaponAmmoStock(var_5caa1e51, e_who.var_790289f);
		}
		if(isdefined(e_who.var_553c95e8))
		{
			e_who SetWeaponAmmoClip(var_5caa1e51, e_who.var_553c95e8);
			continue;
		}
		e_who SetWeaponAmmoClip(var_5caa1e51, var_5caa1e51.clipSize);
		e_who SwitchToWeapon(var_5caa1e51);
		e_who thread function_5d38a3d0();
		e_who thread function_cd3c019a();
		level.var_4de6b326 setinvisibletoplayer(e_who);
		e_who clientfield::set_to_player("bow_pickup_fx_wolf_howl", 0);
		self.stub thread zm_unitrigger::run_visibility_function_for_all_triggers();
	}
}

/*
	Name: function_aae1b69b
	Namespace: namespace_2a78f3c
	Checksum: 0xC87FB0F1
	Offset: 0x4090
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 1322
*/
function function_aae1b69b()
{
	if(!self function_d7cc60fb() || !self function_17893c41())
	{
		return 1;
	}
	w_current = self GetCurrentWeapon();
	if(zm_utility::is_placeable_mine(w_current) || zm_equipment::is_equipment_that_blocks_purchase(w_current) || self hasweapon(GetWeapon("minigun")))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_3abe66fd
	Namespace: namespace_2a78f3c
	Checksum: 0x7CE01E38
	Offset: 0x4160
	Size: 0x280
	Parameters: 0
	Flags: None
	Line Number: 1346
*/
function function_3abe66fd()
{
	/#
		if(level flag::get("Dev Block strings are not supported"))
		{
			return;
		}
		level flag::set("Dev Block strings are not supported");
	#/
	var_f3e8cf3d = struct::get("base_bow_pickup_struct_demongate", "targetname");
	model = spawn("script_model", var_f3e8cf3d.origin);
	model.angles = VectorScale((0, 1, 0), 225);
	model SetModel("wpn_t7_zmb_bow_demon_world");
	level thread scene::Play("p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
	wait(0.25);
	level.var_562c7607 = GetEnt("base_bow_pickup_demongate", "targetname");
	var_f3e8cf3d function_e75d3d92();
	Array::thread_all(level.players, &function_db64815a);
	callback::on_connect(&function_aea6f134);
	foreach(e_player in level.players)
	{
		e_player clientfield::set_to_player("bow_pickup_fx_demongate", 0);
	}
	level scene::stop("p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
	callback::remove_on_connect(&function_aea6f134);
	wait(5);
	level thread struct::delete_script_bundle("scene", "p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
}

/*
	Name: function_db64815a
	Namespace: namespace_2a78f3c
	Checksum: 0x5D41B8
	Offset: 0x43E8
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 1385
*/
function function_db64815a()
{
	self endon("death");
	self clientfield::set_to_player("bow_pickup_fx_demongate", 1);
	var_f3e8cf3d = struct::get("base_bow_pickup_struct_demongate", "targetname");
	while(1)
	{
		self util::waittill_either("weapon_change", "show_base_bow");
		if(!self function_13295c1a())
		{
			if(isdefined(level.var_562c7607))
			{
				level.var_562c7607 setvisibletoplayer(self);
			}
			self clientfield::set_to_player("bow_pickup_fx_demongate", 1);
		}
		else if(isdefined(level.var_562c7607))
		{
			level.var_562c7607 setinvisibletoplayer(self);
		}
		self clientfield::set_to_player("bow_pickup_fx_demongate", 0);
		var_f3e8cf3d.var_7e2ee64f thread zm_unitrigger::run_visibility_function_for_all_triggers();
	}
}

/*
	Name: function_13295c1a
	Namespace: namespace_2a78f3c
	Checksum: 0xD5D69553
	Offset: 0x4540
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 1420
*/
function function_13295c1a()
{
	if(self hasweapon(GetWeapon("elemental_bow")) || self hasweapon(GetWeapon("elemental_bow_demongate")) || self hasweapon(GetWeapon("elemental_bow_storm")) || self hasweapon(GetWeapon("elemental_bow_rune_prison")) || self hasweapon(GetWeapon("elemental_bow_demongate")))
	{
		return 0;
	}
	return 0;
}

/*
	Name: function_2572f9ed
	Namespace: namespace_2a78f3c
	Checksum: 0xB67F6A6B
	Offset: 0x4640
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 1439
*/
function function_2572f9ed()
{
	self endon("death");
	var_9ff0be76 = GetWeapon("elemental_bow_demongate");
	while(1)
	{
		self util::waittill_either("projectile_impact", "zmb_max_ammo");
		if(self hasweapon(var_9ff0be76))
		{
			self.var_69920c66 = self GetWeaponAmmoStock(var_9ff0be76);
			self.var_eef4d4d5 = self GetWeaponAmmoClip(var_9ff0be76);
		}
	}
}

/*
	Name: function_67fe477b
	Namespace: namespace_2a78f3c
	Checksum: 0x52C04850
	Offset: 0x4700
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1464
*/
function function_67fe477b()
{
	self endon("death");
	var_9ff0be76 = GetWeapon("elemental_bow_demongate");
	var_15fcf607 = -1;
	while(var_15fcf607 != self.characterindex)
	{
		level waittill("bleed_out", var_15fcf607);
	}
	self.var_69920c66 = var_9ff0be76.maxAmmo;
	self.var_eef4d4d5 = var_9ff0be76.clipSize;
}

/*
	Name: function_aea6f134
	Namespace: namespace_2a78f3c
	Checksum: 0xC4CBDC37
	Offset: 0x47A0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1487
*/
function function_aea6f134()
{
	self thread function_db64815a();
	return;
	ERROR: Bad function call
}

/*
	Name: function_e75d3d92
	Namespace: namespace_2a78f3c
	Checksum: 0xBA491E44
	Offset: 0x47C8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 1504
*/
function function_e75d3d92()
{
	s_unitrigger = spawnstruct();
	s_unitrigger.origin = self.origin;
	s_unitrigger.angles = self.angles;
	s_unitrigger.script_unitrigger_type = "unitrigger_radius_use";
	s_unitrigger.radius = 100;
	s_unitrigger.cursor_hint = "HINT_NOICON";
	s_unitrigger.hint_string = "Press and hold ^3&&1^7 to swap for Kreegakaleet lu Gosata'ahm";
	s_unitrigger.require_look_at = 1;
	zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
	s_unitrigger.prompt_and_visibility_func = &function_51ad9035;
	self.var_7e2ee64f = s_unitrigger;
	zm_unitrigger::register_static_unitrigger(s_unitrigger, &function_3eeeec95);
	return;
}

/*
	Name: function_51ad9035
	Namespace: namespace_2a78f3c
	Checksum: 0x489772BF
	Offset: 0x48E0
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1531
*/
function function_51ad9035(e_player)
{
	if(e_player function_13295c1a() || e_player function_3088b932())
	{
		self setHintString(&"Press and hold ^3&&1^7 to swap for Kreegakaleet lu Gosata'ahm");
		return 0;
	}
	self setHintString(&"Press and hold ^3&&1^7 to swap for Kreegakaleet lu Gosata'ahm");
	return 1;
}

/*
	Name: function_3eeeec95
	Namespace: namespace_2a78f3c
	Checksum: 0x7B161EDF
	Offset: 0x4968
	Size: 0x290
	Parameters: 0
	Flags: None
	Line Number: 1552
*/
function function_3eeeec95()
{
	self endon("kill_trigger");
	self.stub thread zm_unitrigger::run_visibility_function_for_all_triggers();
	while(1)
	{
		self waittill("trigger", e_who);
		if(e_who function_13295c1a() || e_who function_3088b932())
		{
			continue;
		}
		var_c83af37 = zm_utility::get_player_weapon_limit(e_who);
		var_73c81afa = e_who getweaponslistprimaries();
		if(var_73c81afa.size > var_c83af37)
		{
			w_current = e_who GetCurrentWeapon();
			e_who zm_weapons::weapon_take(w_current);
		}
		var_2a67dbd4 = GetWeapon("elemental_bow_demongate");
		e_who zm_weapons::weapon_give(var_2a67dbd4, 0, 0, 1);
		if(isdefined(e_who.var_69920c66))
		{
			e_who SetWeaponAmmoStock(var_2a67dbd4, e_who.var_69920c66);
		}
		if(isdefined(e_who.var_eef4d4d5))
		{
			e_who SetWeaponAmmoClip(var_2a67dbd4, e_who.var_eef4d4d5);
			continue;
		}
		e_who SetWeaponAmmoClip(var_2a67dbd4, var_2a67dbd4.clipSize);
		e_who SwitchToWeapon(var_2a67dbd4);
		e_who thread function_2572f9ed();
		e_who thread function_67fe477b();
		level.var_562c7607 setinvisibletoplayer(e_who);
		e_who clientfield::set_to_player("bow_pickup_fx_demongate", 0);
		self.stub thread zm_unitrigger::run_visibility_function_for_all_triggers();
	}
}

/*
	Name: function_3088b932
	Namespace: namespace_2a78f3c
	Checksum: 0x4F910327
	Offset: 0x4C00
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 1601
*/
function function_3088b932()
{
	if(!self function_d7cc60fb() || !self function_17893c41())
	{
		return 1;
	}
	w_current = self GetCurrentWeapon();
	if(zm_utility::is_placeable_mine(w_current) || zm_equipment::is_equipment_that_blocks_purchase(w_current) || self hasweapon(GetWeapon("minigun")))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_41b003c3
	Namespace: namespace_2a78f3c
	Checksum: 0xDD80B8CD
	Offset: 0x4CD0
	Size: 0x280
	Parameters: 0
	Flags: None
	Line Number: 1625
*/
function function_41b003c3()
{
	/#
		if(level flag::get("Dev Block strings are not supported"))
		{
			return;
		}
		level flag::set("Dev Block strings are not supported");
	#/
	var_3f5f0a03 = struct::get("base_bow_pickup_struct_rune_prison", "targetname");
	model = spawn("script_model", var_3f5f0a03.origin);
	model.angles = VectorScale((0, 1, 0), 180);
	model SetModel("wpn_t7_zmb_bow_rune_world");
	level thread scene::Play("p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
	wait(0.25);
	level.var_3d7eee85 = GetEnt("base_bow_pickup_rune_prison", "targetname");
	var_3f5f0a03 function_3e9dfb00();
	Array::thread_all(level.players, &function_e8b218a8);
	callback::on_connect(&function_e16be55a);
	foreach(e_player in level.players)
	{
		e_player clientfield::set_to_player("bow_pickup_fx_rune_prison", 0);
	}
	level scene::stop("p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
	callback::remove_on_connect(&function_e16be55a);
	wait(5);
	level thread struct::delete_script_bundle("scene", "p7_fxanim_zm_castle_quest_base_bow_idle_bundle");
}

/*
	Name: function_e8b218a8
	Namespace: namespace_2a78f3c
	Checksum: 0x74FD1E72
	Offset: 0x4F58
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 1664
*/
function function_e8b218a8()
{
	self endon("death");
	self clientfield::set_to_player("bow_pickup_fx_rune_prison", 1);
	var_3f5f0a03 = struct::get("base_bow_pickup_struct_rune_prison", "targetname");
	while(1)
	{
		self util::waittill_either("weapon_change", "show_base_bow");
		if(!self function_7c84c968())
		{
			if(isdefined(level.var_3d7eee85))
			{
				level.var_3d7eee85 setvisibletoplayer(self);
			}
			self clientfield::set_to_player("bow_pickup_fx_rune_prison", 1);
		}
		else if(isdefined(level.var_3d7eee85))
		{
			level.var_3d7eee85 setinvisibletoplayer(self);
		}
		self clientfield::set_to_player("bow_pickup_fx_rune_prison", 0);
		var_3f5f0a03.var_5943b22d thread zm_unitrigger::run_visibility_function_for_all_triggers();
	}
}

/*
	Name: function_7c84c968
	Namespace: namespace_2a78f3c
	Checksum: 0x5C1399DE
	Offset: 0x50B0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 1699
*/
function function_7c84c968()
{
	if(self hasweapon(GetWeapon("elemental_bow")) || self hasweapon(GetWeapon("elemental_bow_rune_prison")) || self hasweapon(GetWeapon("elemental_bow_storm")) || self hasweapon(GetWeapon("elemental_bow_rune_prison")) || self hasweapon(GetWeapon("elemental_bow_rune_prison")))
	{
		return 0;
	}
	return 0;
}

/*
	Name: function_c866f153
	Namespace: namespace_2a78f3c
	Checksum: 0x2EE52C7E
	Offset: 0x51B0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 1718
*/
function function_c866f153()
{
	self endon("death");
	var_2f4ef0d4 = GetWeapon("elemental_bow_rune_prison");
	while(1)
	{
		self util::waittill_either("projectile_impact", "zmb_max_ammo");
		if(self hasweapon(var_2f4ef0d4))
		{
			self.var_31f104a4 = self GetWeaponAmmoStock(var_2f4ef0d4);
			self.var_939c55bb = self GetWeaponAmmoClip(var_2f4ef0d4);
		}
	}
}

/*
	Name: function_6425f129
	Namespace: namespace_2a78f3c
	Checksum: 0xD7EA8ED3
	Offset: 0x5270
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1743
*/
function function_6425f129()
{
	self endon("death");
	var_2f4ef0d4 = GetWeapon("elemental_bow_rune_prison");
	var_47036e85 = -1;
	while(var_47036e85 != self.characterindex)
	{
		level waittill("bleed_out", var_47036e85);
	}
	self.var_31f104a4 = var_2f4ef0d4.maxAmmo;
	self.var_939c55bb = var_2f4ef0d4.clipSize;
}

/*
	Name: function_e16be55a
	Namespace: namespace_2a78f3c
	Checksum: 0x8CA78D19
	Offset: 0x5310
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1766
*/
function function_e16be55a()
{
	self thread function_e8b218a8();
}

/*
	Name: function_3e9dfb00
	Namespace: namespace_2a78f3c
	Checksum: 0xF96BEBBD
	Offset: 0x5338
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 1781
*/
function function_3e9dfb00()
{
	s_unitrigger = spawnstruct();
	s_unitrigger.origin = self.origin;
	s_unitrigger.angles = self.angles;
	s_unitrigger.script_unitrigger_type = "unitrigger_radius_use";
	s_unitrigger.radius = 100;
	s_unitrigger.cursor_hint = "HINT_NOICON";
	s_unitrigger.hint_string = "Press and hold ^3&&1^7 to swap for Kreeaho'ahm nal Ahmhogaroc";
	s_unitrigger.require_look_at = 1;
	zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
	s_unitrigger.prompt_and_visibility_func = &function_af6d62db;
	self.var_5943b22d = s_unitrigger;
	zm_unitrigger::register_static_unitrigger(s_unitrigger, &function_f7d1a87b);
}

/*
	Name: function_af6d62db
	Namespace: namespace_2a78f3c
	Checksum: 0xB84A11C0
	Offset: 0x5450
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1807
*/
function function_af6d62db(e_player)
{
	if(e_player function_7c84c968() || e_player function_917b7d60())
	{
		self setHintString(&"Press and hold ^3&&1^7 to swap for Kreeaho'ahm nal Ahmhogaroc");
		return 0;
	}
	self setHintString(&"Press and hold ^3&&1^7 to swap for Kreeaho'ahm nal Ahmhogaroc");
	return 1;
}

/*
	Name: function_f7d1a87b
	Namespace: namespace_2a78f3c
	Checksum: 0x4881A402
	Offset: 0x54D8
	Size: 0x290
	Parameters: 0
	Flags: None
	Line Number: 1828
*/
function function_f7d1a87b()
{
	self endon("kill_trigger");
	self.stub thread zm_unitrigger::run_visibility_function_for_all_triggers();
	while(1)
	{
		self waittill("trigger", e_who);
		if(e_who function_7c84c968() || e_who function_917b7d60())
		{
			continue;
		}
		var_229ebe15 = zm_utility::get_player_weapon_limit(e_who);
		var_ed897888 = e_who getweaponslistprimaries();
		if(var_ed897888.size > var_229ebe15)
		{
			w_current = e_who GetCurrentWeapon();
			e_who zm_weapons::weapon_take(w_current);
		}
		var_7dd30aba = GetWeapon("elemental_bow_rune_prison");
		e_who zm_weapons::weapon_give(var_7dd30aba, 0, 0, 1);
		if(isdefined(e_who.var_31f104a4))
		{
			e_who SetWeaponAmmoStock(var_7dd30aba, e_who.var_31f104a4);
		}
		if(isdefined(e_who.var_939c55bb))
		{
			e_who SetWeaponAmmoClip(var_7dd30aba, e_who.var_939c55bb);
			continue;
		}
		e_who SetWeaponAmmoClip(var_7dd30aba, var_7dd30aba.clipSize);
		e_who SwitchToWeapon(var_7dd30aba);
		e_who thread function_c866f153();
		e_who thread function_6425f129();
		level.var_3d7eee85 setinvisibletoplayer(e_who);
		e_who clientfield::set_to_player("bow_pickup_fx_rune_prison", 0);
		self.stub thread zm_unitrigger::run_visibility_function_for_all_triggers();
	}
}

/*
	Name: function_917b7d60
	Namespace: namespace_2a78f3c
	Checksum: 0x4BD287AA
	Offset: 0x5770
	Size: 0xC6
	Parameters: 0
	Flags: None
	Line Number: 1877
*/
function function_917b7d60()
{
	if(!self function_d7cc60fb() || !self function_17893c41())
	{
		return 1;
	}
	w_current = self GetCurrentWeapon();
	if(zm_utility::is_placeable_mine(w_current) || zm_equipment::is_equipment_that_blocks_purchase(w_current) || self hasweapon(GetWeapon("minigun")))
	{
		return 1;
	}
	return 0;
}

