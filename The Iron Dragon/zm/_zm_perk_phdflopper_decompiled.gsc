#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_utility;
#include scripts\zm\gametypes\_globallogic_score;

#namespace zm_perk_phdflopper;

/*
	Name: __init__sytem__
	Namespace: zm_perk_phdflopper
	Checksum: 0xEDB4E55C
	Offset: 0x528
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 25
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_phdflopper", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_phdflopper
	Checksum: 0x32C3DDA9
	Offset: 0x570
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_phdflopper_perk_for_level();
		return;
	}
}

/*
	Name: __main__
	Namespace: zm_perk_phdflopper
	Checksum: 0x55214E1A
	Offset: 0x5A8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 59
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_bd3a729b();
		return;
	}
}

/*
	Name: enable_phdflopper_perk_for_level
	Namespace: zm_perk_phdflopper
	Checksum: 0xD348988B
	Offset: 0x5E0
	Size: 0x5F0
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function enable_phdflopper_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_phdflopper", "phdflopper", 2000, &"HB21_ZM_PERKS_PHDFLOPPER", GetWeapon("zombie_perk_bottle_nuke"));
	zm_perks::register_perk_precache_func("specialty_phdflopper", &phdflopper_precache);
	zm_perks::register_perk_clientfields("specialty_phdflopper", &phdflopper_register_clientfield, &phdflopper_set_clientfield);
	zm_perks::register_perk_machine("specialty_phdflopper", &phdflopper_perk_machine_setup);
	zm_perks::register_perk_host_migration_params("specialty_phdflopper", "vending_phdflopper", "specialty_phdflopper");
	zm_perks::register_perk_threads("specialty_phdflopper", &function_2be6073e, &function_afaadeac);
	if(namespace_b8afaefc::function_fc92a42d() && (level.script == "zm_zod" || level.script == "zm_genesis" || level.script == "zm_tomb"))
	{
		zm_perks::register_perk_machine_power_override("specialty_phdflopper", &function_939a951a);
	}
	if(level.script == "zm_zod")
	{
		namespace_b8afaefc::function_8fd06793((3059, -5478, 128), VectorScale((0, 1, 0), 90), "specialty_phdflopper", "p9_sur_machine_phd_slider_off");
	}
	else if(level.script == "zm_factory")
	{
		namespace_b8afaefc::function_8fd06793((-732, -40, 70), (0, 0, 0), "specialty_phdflopper", "p9_sur_machine_phd_slider_off");
	}
	else if(level.script == "zm_castle")
	{
		namespace_b8afaefc::function_8fd06793((-1284, 2843, 824), VectorScale((0, -1, 0), 25), "specialty_phdflopper", "p9_sur_machine_phd_slider_off");
	}
	else if(level.script == "zm_island")
	{
		namespace_b8afaefc::function_8fd06793((-2005, -1205, -303), VectorScale((0, 1, 0), 23), "specialty_phdflopper", "p9_sur_machine_phd_slider_off");
	}
	else if(level.script == "zm_stalingrad")
	{
		namespace_b8afaefc::function_8fd06793((-1050, 2972, 160), VectorScale((0, 1, 0), 180), "specialty_phdflopper", "p9_sur_machine_phd_slider_off");
	}
	else if(level.script == "zm_genesis")
	{
		namespace_b8afaefc::function_8fd06793((675, 4541, 1226), VectorScale((0, -1, 0), 10), "specialty_phdflopper", "p9_sur_machine_phd_slider_off");
	}
	else if(level.script == "zm_asylum")
	{
		namespace_b8afaefc::function_8fd06793((704, -161, 226), (0, 0, 0), "specialty_phdflopper", "p9_sur_machine_phd_slider_off");
	}
	else if(level.script == "zm_sumpf")
	{
		namespace_b8afaefc::function_8fd06793((10422, 1385, -660), (0, 0, 0), "specialty_phdflopper", "p9_sur_machine_phd_slider_off");
	}
	else if(level.script == "zm_theater")
	{
		namespace_b8afaefc::function_8fd06793((-1328, -489, 79), VectorScale((0, 1, 0), 90), "specialty_phdflopper", "p9_sur_machine_phd_slider_off");
	}
	else if(level.script == "zm_cosmodrome")
	{
		namespace_b8afaefc::function_8fd06793((-955, 1311, -140), VectorScale((0, 1, 0), 180), "specialty_phdflopper", "p9_sur_machine_phd_slider_off");
	}
	else if(level.script == "zm_temple")
	{
		namespace_b8afaefc::function_8fd06793((1338, -1020, 17), VectorScale((0, 1, 0), 180), "specialty_phdflopper", "p9_sur_machine_phd_slider_off");
	}
	else if(level.script == "zm_moon")
	{
		namespace_b8afaefc::function_8fd06793((6158, 650, -205), (0, 0, 0), "specialty_phdflopper", "p9_sur_machine_phd_slider_off");
	}
	else if(level.script == "zm_tomb")
	{
		namespace_b8afaefc::function_8fd06793((3040, 942, -209), (0, 0, 0), "specialty_phdflopper", "p9_sur_machine_phd_slider_off");
	}
}

/*
	Name: phdflopper_precache
	Namespace: zm_perk_phdflopper
	Checksum: 0x86C0D750
	Offset: 0xBD8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 154
*/
function phdflopper_precache()
{
	level._effect["specialty_phdflopper"] = "harry/zm_perks/fx_perk_phdflopper_light";
	level.machine_assets["specialty_phdflopper"] = spawnstruct();
	level.machine_assets["specialty_phdflopper"].weapon = GetWeapon("zombie_perk_bottle_nuke");
	level.machine_assets["specialty_phdflopper"].off_model = "p9_sur_machine_phd_slider_off";
	level.machine_assets["specialty_phdflopper"].on_model = "p9_sur_machine_phd_slider";
}

/*
	Name: phdflopper_register_clientfield
	Namespace: zm_perk_phdflopper
	Checksum: 0x8DAB5B0D
	Offset: 0xCA0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 173
*/
function phdflopper_register_clientfield()
{
	clientfield::register("clientuimodel", "hudItems.perks.phdflopper", 1, 2, "int");
}

/*
	Name: phdflopper_set_clientfield
	Namespace: zm_perk_phdflopper
	Checksum: 0xC1CDB0FA
	Offset: 0xCE0
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 188
*/
function phdflopper_set_clientfield(n_state)
{
	if(n_state != 0 && (level namespace_b8afaefc::function_9f353429("specialty_phdflopper") || self namespace_b8afaefc::function_9f353429("specialty_phdflopper")))
	{
		n_state = 2;
	}
	self clientfield::set_player_uimodel("hudItems.perks.phdflopper", n_state);
	return;
	n_state++;
}

/*
	Name: phdflopper_perk_machine_setup
	Namespace: zm_perk_phdflopper
	Checksum: 0x1BFDA725
	Offset: 0xD70
	Size: 0x100
	Parameters: 4
	Flags: None
	Line Number: 209
*/
function phdflopper_perk_machine_setup(var_39cc5a0b, var_8bcf7b93, var_3189c3fc, e_collision)
{
	var_39cc5a0b.script_sound = "mus_perks_phdflopper_jingle";
	var_39cc5a0b.script_string = "phdflopper_perk";
	var_39cc5a0b.script_label = "mus_perks_phdflopper_sting";
	var_39cc5a0b.target = "vending_phdflopper";
	var_8bcf7b93.script_string = "phdflopper_perk";
	var_8bcf7b93.targetname = "vending_phdflopper";
	if(isdefined(var_3189c3fc))
	{
		var_3189c3fc.script_string = "phdflopper_perk";
	}
	var_8bcf7b93 thread namespace_b8afaefc::function_2a628bd("specialty_phdflopper", "i_fxt_zmb_perk_flopper", (0.462745, 0, 0.50196));
}

/*
	Name: function_2be6073e
	Namespace: zm_perk_phdflopper
	Checksum: 0x325AE0FC
	Offset: 0xE78
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 234
*/
function function_2be6073e()
{
	namespace_b8afaefc::function_ffb18d9f("specialty_phdflopper", "3.0.4");
	if(level namespace_b8afaefc::function_9f353429("specialty_phdflopper"))
	{
		self namespace_b8afaefc::function_7932e598("specialty_phdflopper");
	}
	if(self namespace_b8afaefc::function_9f353429("specialty_phdflopper"))
	{
		return;
	}
	self function_d2121907(1);
}

/*
	Name: function_afaadeac
	Namespace: zm_perk_phdflopper
	Checksum: 0xE89D941C
	Offset: 0xF28
	Size: 0x38
	Parameters: 3
	Flags: None
	Line Number: 258
*/
function function_afaadeac(b_pause, str_perk, str_result)
{
	self function_d2121907(0);
}

/*
	Name: function_939a951a
	Namespace: zm_perk_phdflopper
	Checksum: 0xF89A9908
	Offset: 0xF68
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 273
*/
function function_939a951a()
{
	namespace_b8afaefc::function_cfe6acb0("specialty_phdflopper");
}

/*
	Name: function_bd3a729b
	Namespace: zm_perk_phdflopper
	Checksum: 0x24C0C2AB
	Offset: 0xF90
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 288
*/
function function_bd3a729b()
{
	visionset_mgr::register_info("visionset", "zm_perk_divetonuke", 1, 31, 400, 1, &visionset_mgr::ramp_in_out_thread_per_player, 1);
	clientfield::register("missile", "phdflopper_multigrenade_trail_fx", 1, 1, "int");
	clientfield::register("allplayers", "phdflopper_slide_explode_fx", 1, 1, "int");
	callback::on_connect(&function_8f49fe6c);
	Array::push(level.perk_damage_override, &function_52500da2, 0);
	if(isdefined(0) && 0)
	{
		namespace_b8afaefc::function_38f810ea("specialty_phdflopper");
		return;
	}
}

/*
	Name: function_8f49fe6c
	Namespace: zm_perk_phdflopper
	Checksum: 0xB284721C
	Offset: 0x10B8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 312
*/
function function_8f49fe6c()
{
	globallogic_score::initPersStat("specialty_phdflopper" + "_drank", 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d2121907
	Namespace: zm_perk_phdflopper
	Checksum: 0x59D533CF
	Offset: 0x10F0
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 329
*/
function function_d2121907(b_enabled)
{
	if(isdefined(b_enabled) && b_enabled)
	{
		self thread function_f3cb2d65();
		self thread function_651864bd();
		continue;
	}
	self notify("hash_f3cb2d65");
	self notify("hash_651864bd");
}

/*
	Name: function_95e42033
	Namespace: zm_perk_phdflopper
	Checksum: 0x37ACCF1
	Offset: 0x1168
	Size: 0x458
	Parameters: 0
	Flags: None
	Line Number: 351
*/
function function_95e42033()
{
	self endon("disconnect");
	if(isdefined(self clientfield::get("phdflopper_slide_explode_fx")) && self clientfield::get("phdflopper_slide_explode_fx"))
	{
		self clientfield::set("phdflopper_slide_explode_fx", 0);
		wait(0.05);
	}
	v_origin = self.origin;
	v_angles = self.angles;
	visionset_mgr::activate("visionset", "zm_perk_divetonuke", self, 0.1, 0.1, 0.1);
	Earthquake(1, 1, v_origin, 300);
	playsoundatposition("zmb_phdflop_explo", v_origin);
	function_5fb9f971(v_origin);
	self clientfield::set("phdflopper_slide_explode_fx", 1);
	a_zombies = util::get_array_of_closest(v_origin, zombie_utility::get_round_enemy_array(), undefined, undefined, 300);
	var_2b22458 = 0;
	if(isdefined(a_zombies) && IsArray(a_zombies) && a_zombies.size > 0)
	{
		for(i = 0; i < a_zombies.size; i++)
		{
			if(!isalive(a_zombies[i]))
			{
				continue;
			}
			if(isdefined(a_zombies[i].var_e8420ae0) && a_zombies[i].var_e8420ae0)
			{
				continue;
			}
			str_tag = "j_spineupper";
			if(isdefined(a_zombies[i].isdog) && a_zombies[i].isdog)
			{
				str_tag = "j_spine1";
			}
			if(!SightTracePassed(self GetEye(), a_zombies[i] GetTagOrigin(str_tag), 0, undefined))
			{
				continue;
			}
			n_dist = Distance(a_zombies[i].origin, v_origin);
			n_damage = 5000 - n_dist / 300;
			if(isdefined(a_zombies[i].var_d98eabc8))
			{
				a_zombies[i] [[a_zombies[i].var_d98eabc8]](self);
				continue;
			}
			a_zombies[i] DoDamage(n_damage, a_zombies[i].origin, self, self, 0, "MOD_GRENADE_SPLASH");
			if(a_zombies[i].health <= 0)
			{
				a_zombies[i] namespace_b8afaefc::function_11acd189(v_origin, 125, 150, 75, 150);
			}
			var_2b22458--;
			if(var_2b22458 <= 0)
			{
				util::wait_network_frame();
				var_2b22458 = randomIntRange(1, 3);
			}
		}
	}
}

/*
	Name: function_651864bd
	Namespace: zm_perk_phdflopper
	Checksum: 0x9F15CC13
	Offset: 0x15C8
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 421
*/
function function_651864bd()
{
	self notify("hash_651864bd");
	self endon("hash_651864bd");
	if(!(isdefined(1) && 1))
	{
		return;
	}
	while(1)
	{
		var_511580f8 = 0;
		while(!self zm_utility::is_jumping())
		{
			wait(0.05);
		}
		var_b4498c9f = self.origin[2];
		while(self zm_utility::is_jumping())
		{
			wait(0.05);
		}
		util::wait_network_frame();
		if(!self IsSliding())
		{
			continue;
		}
		if(isdefined(var_b4498c9f) && isdefined(self.origin[0]) && isdefined(self.origin[2]))
		{
			var_511580f8 = var_b4498c9f - self.origin[2];
		}
		if(var_511580f8 > 50)
		{
			self thread function_95e42033();
		}
	}
}

/*
	Name: function_52500da2
	Namespace: zm_perk_phdflopper
	Checksum: 0xF75E7AA
	Offset: 0x1718
	Size: 0xE0
	Parameters: 10
	Flags: None
	Line Number: 467
*/
function function_52500da2(e_inflictor, e_attacker, n_damage, var_df862ae6, str_means_of_death, w_weapon, v_point, v_dir, str_hit_loc, var_ed5eb273)
{
	if(!self hasPerk("specialty_phdflopper"))
	{
		return n_damage;
	}
	switch(str_means_of_death)
	{
		case "MOD_EXPLOSIVE":
		case "MOD_EXPLOSIVE_SPLASH":
		case "MOD_FALLING":
		case "MOD_GRENADE":
		case "MOD_GRENADE_SPLASH":
		case "MOD_PROJECTILE":
		case "MOD_PROJECTILE_SPLASH":
		{
			return 0;
			break;
		}
		default
		{
		}
	}
	return n_damage;
}

/*
	Name: function_f3cb2d65
	Namespace: zm_perk_phdflopper
	Checksum: 0xBC38DDAE
	Offset: 0x1800
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 503
*/
function function_f3cb2d65()
{
	self notify("hash_f3cb2d65");
	self endon("hash_f3cb2d65");
	if(!(isdefined(1) && 1))
	{
		return;
	}
	while(1)
	{
		self waittill("grenade_pullback");
		n_start_time = GetTime();
		self waittill("grenade_fire", e_grenade, w_weapon, var_b28ba731);
		if(!self hasPerk("specialty_phdflopper"))
		{
			continue;
		}
		if(function_fe092e32(w_weapon.name))
		{
			continue;
		}
		if(!isdefined(e_grenade))
		{
			continue;
		}
		if(isdefined(e_grenade.var_bd92ed4c) && e_grenade.var_bd92ed4c)
		{
			continue;
		}
		var_8742636f = self zm_utility::get_player_lethal_grenade();
		if(w_weapon != var_8742636f)
		{
			continue;
		}
		e_grenade clientfield::set("phdflopper_multigrenade_trail_fx", 1);
		e_grenade.var_bd92ed4c = 1;
		self thread function_9ebde1a6(e_grenade, w_weapon, var_b28ba731, n_start_time);
	}
}

/*
	Name: function_9ebde1a6
	Namespace: zm_perk_phdflopper
	Checksum: 0x5139D9A9
	Offset: 0x19A0
	Size: 0x330
	Parameters: 4
	Flags: None
	Line Number: 553
*/
function function_9ebde1a6(e_grenade, w_weapon, var_b28ba731, n_start_time)
{
	if(!isdefined(n_start_time))
	{
		n_start_time = GetTime();
	}
	self endon("disconnect");
	e_grenade endon("grenade_dud");
	if(!isdefined(e_grenade))
	{
		return;
	}
	if(!isdefined(w_weapon))
	{
		return;
	}
	e_grenade thread function_46c7d66a();
	e_grenade waittill("hash_2f1d8d91", v_origin);
	if(!isdefined(v_origin))
	{
		return;
	}
	if(isdefined(e_grenade.threwBack) && e_grenade.threwBack)
	{
		return;
	}
	if(!isdefined(e_grenade) || !isdefined(var_b28ba731))
	{
		var_e09459ee = 3;
		continue;
	}
	n_time_between = GetTime() - n_start_time;
	var_e09459ee = var_b28ba731 - n_time_between / 1000;
	if(!isdefined(var_e09459ee) || var_e09459ee < 0)
	{
		var_e09459ee = 3;
	}
	playsoundatposition("zmb_perks_phdflopper_grenade", v_origin);
	var_67655464 = randomIntRange(4, 8);
	var_b4eb069f = 360 / var_67655464;
	var_f568bc65 = RandomFloat(var_b4eb069f);
	for(i = 0; i < var_67655464; i++)
	{
		var_e4c69cc2 = var_f568bc65 + var_b4eb069f * i;
		var_e292ec24 = randomIntRange(100, 200);
		var_909c4271 = randomIntRange(300, 400);
		var_a1f9566b = (cos(var_e4c69cc2) * var_e292ec24, sin(var_e4c69cc2) * var_e292ec24, var_909c4271);
		var_69f3b052 = self MagicGrenadeType(w_weapon, v_origin + VectorScale((0, 0, 1), 25), var_a1f9566b, var_e09459ee);
		var_69f3b052 clientfield::set("phdflopper_multigrenade_trail_fx", 1);
		var_69f3b052.var_bd92ed4c = 1;
		wait(0.05);
		wait(0.05);
		wait(0.05);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_46c7d66a
	Namespace: zm_perk_phdflopper
	Checksum: 0xE52BD1C2
	Offset: 0x1CD8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 621
*/
function function_46c7d66a()
{
	self thread function_7ce5ec35();
	self thread function_822cf79b();
	self thread function_bc72c10a();
	self thread function_ea3f315b();
	self thread function_f51fdb4f();
}

/*
	Name: function_7ce5ec35
	Namespace: zm_perk_phdflopper
	Checksum: 0x5168CC5F
	Offset: 0x1D60
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 640
*/
function function_7ce5ec35()
{
	self endon("grenade_dud");
	self endon("hash_2f1d8d91");
	self waittill("detonate", v_origin);
	self notify("hash_2f1d8d91", v_origin);
}

/*
	Name: function_822cf79b
	Namespace: zm_perk_phdflopper
	Checksum: 0x655ACB07
	Offset: 0x1DB0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 658
*/
function function_822cf79b()
{
	self endon("grenade_dud");
	self endon("hash_2f1d8d91");
	self waittill("grenade_bounce", v_origin);
	self notify("hash_2f1d8d91", v_origin);
}

/*
	Name: function_ea3f315b
	Namespace: zm_perk_phdflopper
	Checksum: 0xD11692A2
	Offset: 0x1E00
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 676
*/
function function_ea3f315b()
{
	self endon("grenade_dud");
	self endon("hash_2f1d8d91");
	self waittill("grenade_stuck", v_origin);
	self notify("hash_2f1d8d91", v_origin);
}

/*
	Name: function_f51fdb4f
	Namespace: zm_perk_phdflopper
	Checksum: 0x38C305D6
	Offset: 0x1E50
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 694
*/
function function_f51fdb4f()
{
	self endon("grenade_dud");
	self endon("hash_2f1d8d91");
	self waittill("stationary", v_origin);
	self notify("hash_2f1d8d91", v_origin);
}

/*
	Name: function_bc72c10a
	Namespace: zm_perk_phdflopper
	Checksum: 0x9C72E394
	Offset: 0x1EA0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 712
*/
function function_bc72c10a()
{
	self endon("grenade_dud");
	self endon("hash_2f1d8d91");
	self waittill("explode", v_origin);
	self notify("hash_2f1d8d91", v_origin);
	return;
}

/*
	Name: function_6c2c7f07
	Namespace: zm_perk_phdflopper
	Checksum: 0x7C294821
	Offset: 0x1EF0
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 731
*/
function function_6c2c7f07(str_weapon_name)
{
	if(!isdefined(level.var_747d06c3))
	{
		level.var_747d06c3 = [];
	}
	if(!IsInArray(level.var_747d06c3, str_weapon_name))
	{
		if(!isdefined(level.var_747d06c3))
		{
			level.var_747d06c3 = [];
		}
		else if(!IsArray(level.var_747d06c3))
		{
			level.var_747d06c3 = Array(level.var_747d06c3);
		}
	}
	level.var_747d06c3[level.var_747d06c3.size] = str_weapon_name;
}

/*
	Name: function_fe092e32
	Namespace: zm_perk_phdflopper
	Checksum: 0x6D7B4B4C
	Offset: 0x1FB0
	Size: 0x76
	Parameters: 1
	Flags: None
	Line Number: 761
*/
function function_fe092e32(str_weapon_name)
{
	if(!isdefined(level.var_747d06c3) || !IsArray(level.var_747d06c3) || level.var_747d06c3.size < 1)
	{
		return 0;
	}
	if(IsInArray(level.var_747d06c3, str_weapon_name))
	{
		return 1;
	}
	return 0;
}

