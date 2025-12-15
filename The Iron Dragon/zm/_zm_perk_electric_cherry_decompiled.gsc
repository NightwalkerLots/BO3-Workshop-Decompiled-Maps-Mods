#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_score;

#namespace zm_perk_electric_cherry;

/*
	Name: __init__sytem__
	Namespace: zm_perk_electric_cherry
	Checksum: 0xB8ECAEEF
	Offset: 0x510
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_electric_cherry", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_electric_cherry
	Checksum: 0x62D87EFA
	Offset: 0x558
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function __init__()
{
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_factory" || script == "zm_zod" || script == "zm_prototype" || script == "zm_asylum" || script == "zm_sumpf" || script == "zm_theater" || script == "zm_cosmodrome" || script == "zm_temple" || script == "zm_moon")
	{
		return;
	}
	if(isdefined(1) && 1)
	{
		enable_electric_cherry_perk_for_level();
	}
}

/*
	Name: __main__
	Namespace: zm_perk_electric_cherry
	Checksum: 0xBAD6BDD0
	Offset: 0x650
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function __main__()
{
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_factory" || script == "zm_zod" || script == "zm_prototype" || script == "zm_asylum" || script == "zm_sumpf" || script == "zm_theater" || script == "zm_cosmodrome" || script == "zm_temple" || script == "zm_moon")
	{
		return;
	}
	if(isdefined(1) && 1)
	{
		function_feaaa4ac();
	}
}

/*
	Name: enable_electric_cherry_perk_for_level
	Namespace: zm_perk_electric_cherry
	Checksum: 0xBBE675B4
	Offset: 0x748
	Size: 0x400
	Parameters: 0
	Flags: None
	Line Number: 84
*/
function enable_electric_cherry_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_electriccherry", "electric_cherry", 2000, &"HB21_ZM_PERKS_ELECTRIC_CHERRY", GetWeapon("zombie_perk_bottle_cherry"));
	zm_perks::register_perk_precache_func("specialty_electriccherry", &electric_cherry_precache);
	zm_perks::register_perk_clientfields("specialty_electriccherry", &electric_cherry_register_clientfield, &electric_cherry_set_clientfield);
	zm_perks::register_perk_machine("specialty_electriccherry", &electric_cherry_perk_machine_setup);
	zm_perks::register_perk_host_migration_params("specialty_electriccherry", "vending_electriccherry", "specialty_electriccherry");
	zm_perks::register_perk_threads("specialty_electriccherry", &function_a255575f, &function_d092f435);
	if(namespace_b8afaefc::function_fc92a42d() && (level.script == "zm_zod" || level.script == "zm_genesis" || level.script == "zm_tomb"))
	{
		zm_perks::register_perk_machine_power_override("specialty_electriccherry", &function_d69d1ef5);
	}
	if(level.script == "zm_zod")
	{
		namespace_b8afaefc::function_8fd06793((1992, -3417, -400), VectorScale((0, 1, 0), 270), "specialty_electriccherry", "p6_zm_vending_electric_cherry");
	}
	else if(level.script == "zm_factory")
	{
		namespace_b8afaefc::function_8fd06793((63, -1464, 191), VectorScale((0, 1, 0), 180), "specialty_electriccherry", "p6_zm_vending_electric_cherry");
	}
	else if(level.script == "zm_castle")
	{
		namespace_b8afaefc::function_8fd06793((1502, 3094, 408), VectorScale((0, -1, 0), 73), "specialty_electriccherry", "p6_zm_vending_electric_cherry");
	}
	else if(level.script == "zm_island")
	{
		namespace_b8afaefc::function_8fd06793((1684, 908, -4399), VectorScale((0, 1, 0), 180), "specialty_electriccherry", "p6_zm_vending_electric_cherry");
	}
	else if(level.script == "zm_stalingrad")
	{
		namespace_b8afaefc::function_8fd06793((-905, 3335, 160), (0, 0, 0), "specialty_electriccherry", "p6_zm_vending_electric_cherry");
	}
	else if(level.script == "zm_genesis")
	{
		namespace_b8afaefc::function_8fd06793((-82, -411, -3381), VectorScale((0, 1, 0), 90), "specialty_electriccherry", "p6_zm_vending_electric_cherry");
	}
	else if(level.script == "zm_tomb")
	{
		namespace_b8afaefc::function_8fd06793((1542, -2222, -42), VectorScale((0, 1, 0), 270), "specialty_electriccherry", "p6_zm_vending_electric_cherry");
	}
}

/*
	Name: electric_cherry_precache
	Namespace: zm_perk_electric_cherry
	Checksum: 0xFB3E39CC
	Offset: 0xB50
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 136
*/
function electric_cherry_precache()
{
	level._effect["specialty_electriccherry"] = "harry/zm_perks/fx_perk_electric_cherry_light";
	level.machine_assets["specialty_electriccherry"] = spawnstruct();
	level.machine_assets["specialty_electriccherry"].weapon = GetWeapon("zombie_perk_bottle_cherry");
	level.machine_assets["specialty_electriccherry"].off_model = "p6_zm_vending_electric_cherry";
	level.machine_assets["specialty_electriccherry"].on_model = "p6_zm_vending_electric_cherry";
}

/*
	Name: electric_cherry_register_clientfield
	Namespace: zm_perk_electric_cherry
	Checksum: 0x83B976F6
	Offset: 0xC18
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 155
*/
function electric_cherry_register_clientfield()
{
	clientfield::register("clientuimodel", "hudItems.perks.electric_cherry", 1, 2, "int");
}

/*
	Name: electric_cherry_set_clientfield
	Namespace: zm_perk_electric_cherry
	Checksum: 0x70DB2535
	Offset: 0xC58
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 170
*/
function electric_cherry_set_clientfield(n_state)
{
	if(n_state != 0 && (level namespace_b8afaefc::function_9f353429("specialty_electriccherry") || self namespace_b8afaefc::function_9f353429("specialty_electriccherry")))
	{
		n_state = 2;
	}
	self clientfield::set_player_uimodel("hudItems.perks.electric_cherry", n_state);
}

/*
	Name: electric_cherry_perk_machine_setup
	Namespace: zm_perk_electric_cherry
	Checksum: 0xD57B5C93
	Offset: 0xCE8
	Size: 0x100
	Parameters: 4
	Flags: None
	Line Number: 189
*/
function electric_cherry_perk_machine_setup(var_39cc5a0b, var_8bcf7b93, var_3189c3fc, e_collision)
{
	var_39cc5a0b.script_sound = "mus_perks_cherry_jingle";
	var_39cc5a0b.script_string = "electriccherry_perk";
	var_39cc5a0b.script_label = "mus_perks_cherry_sting";
	var_39cc5a0b.target = "vending_electriccherry";
	var_8bcf7b93.script_string = "electriccherry_perk";
	var_8bcf7b93.targetname = "vending_electriccherry";
	if(isdefined(var_3189c3fc))
	{
		var_3189c3fc.script_string = "electriccherry_perk";
	}
	var_8bcf7b93 thread namespace_b8afaefc::function_2a628bd("specialty_electriccherry", "i_fxt_zmb_perk_cherry", (0.082352, 1, 1));
}

/*
	Name: function_a255575f
	Namespace: zm_perk_electric_cherry
	Checksum: 0x6198CC52
	Offset: 0xDF0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 214
*/
function function_a255575f()
{
	namespace_b8afaefc::function_ffb18d9f("specialty_electriccherry", "3.0.4");
	if(level namespace_b8afaefc::function_9f353429("specialty_electriccherry"))
	{
		self namespace_b8afaefc::function_7932e598("specialty_electriccherry");
	}
	if(self namespace_b8afaefc::function_9f353429("specialty_electriccherry"))
	{
		return;
	}
	self function_e598c15e(1);
}

/*
	Name: function_d092f435
	Namespace: zm_perk_electric_cherry
	Checksum: 0x5D28B527
	Offset: 0xEA0
	Size: 0x38
	Parameters: 3
	Flags: None
	Line Number: 238
*/
function function_d092f435(b_pause, str_perk, str_result)
{
	self function_e598c15e(0);
}

/*
	Name: function_d69d1ef5
	Namespace: zm_perk_electric_cherry
	Checksum: 0xB6516061
	Offset: 0xEE0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 253
*/
function function_d69d1ef5()
{
	namespace_b8afaefc::function_cfe6acb0("specialty_electriccherry");
}

/*
	Name: function_feaaa4ac
	Namespace: zm_perk_electric_cherry
	Checksum: 0x92E39B79
	Offset: 0xF08
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 268
*/
function function_feaaa4ac()
{
	clientfield::register("allplayers", "electric_cherry_reload_fx", 1, 1, "int");
	clientfield::register("actor", "tesla_death_fx", 1, 1, "int");
	clientfield::register("vehicle", "tesla_death_fx_veh", 10000, 1, "int");
	clientfield::register("actor", "tesla_shock_eyes_fx", 1, 1, "int");
	clientfield::register("vehicle", "tesla_shock_eyes_fx_veh", 10000, 1, "int");
	level._effect["electric_cherry_explode"] = "dlc1/castle/fx_castle_electric_cherry_down";
	callback::on_laststand(&electric_cherry_laststand);
	zombie_utility::set_zombie_var("tesla_head_gib_chance", 50);
	if(isdefined(1) && 1)
	{
		namespace_b8afaefc::function_38f810ea("specialty_electriccherry");
		return;
	}
}

/*
	Name: function_e598c15e
	Namespace: zm_perk_electric_cherry
	Checksum: 0xE428DBA2
	Offset: 0x1088
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 295
*/
function function_e598c15e(b_enabled)
{
	if(isdefined(b_enabled) && b_enabled)
	{
		self thread function_99423256();
		continue;
	}
	self notify("hash_aa1c359c");
}

/*
	Name: electric_cherry_laststand
	Namespace: zm_perk_electric_cherry
	Checksum: 0x3B2AB9D6
	Offset: 0x10D8
	Size: 0x2F8
	Parameters: 0
	Flags: None
	Line Number: 315
*/
function electric_cherry_laststand()
{
	if(!self hasPerk("specialty_electriccherry"))
	{
		return;
	}
	if(isdefined(self))
	{
		playFX(level._effect["electric_cherry_explode"], self.origin);
		self playsound("zmb_cherry_explode");
		wait(0.05);
		a_zombies = zombie_utility::get_round_enemy_array();
		a_zombies = util::get_array_of_closest(self.origin, a_zombies, undefined, undefined, 500);
		for(i = 0; i < a_zombies.size; i++)
		{
			if(isalive(self) && isalive(a_zombies[i]))
			{
				if(isdefined(a_zombies[i].var_75cb59a3) && a_zombies[i].var_75cb59a3)
				{
					continue;
				}
				if(isdefined(a_zombies[i].var_7cc79023))
				{
					a_zombies[i] [[a_zombies[i].var_7cc79023]](self);
					continue;
				}
				if(a_zombies[i].health <= 1000)
				{
					if(!(isdefined(a_zombies[i].var_7b671d44) && a_zombies[i].var_7b671d44))
					{
						a_zombies[i] thread electric_cherry_death_fx();
					}
					self zm_score::add_to_player_score(40);
				}
				else if(!(isdefined(a_zombies[i].var_26a62392) && a_zombies[i].var_26a62392))
				{
					a_zombies[i] thread electric_cherry_stun();
				}
				if(!(isdefined(a_zombies[i].var_7b671d44) && a_zombies[i].var_7b671d44))
				{
					a_zombies[i] thread electric_cherry_shock_fx();
				}
				wait(0.05);
				a_zombies[i] DoDamage(1000, self.origin, self, self, "none");
			}
		}
		return;
	}
	~a_zombies;
}

/*
	Name: electric_cherry_death_fx
	Namespace: zm_perk_electric_cherry
	Checksum: 0x278F9EA3
	Offset: 0x13D8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 376
*/
function electric_cherry_death_fx()
{
	self endon("death");
	self playsound("zmb_elec_jib_zombie");
	if(!(isdefined(self.head_gibbed) && self.head_gibbed))
	{
		if(isVehicle(self))
		{
			self clientfield::set("tesla_shock_eyes_fx_veh", 1);
			continue;
		}
		self clientfield::set("tesla_shock_eyes_fx", 1);
	}
	else if(isVehicle(self))
	{
		self clientfield::set("tesla_death_fx_veh", 1);
		continue;
	}
	self clientfield::set("tesla_death_fx", 1);
}

/*
	Name: electric_cherry_shock_fx
	Namespace: zm_perk_electric_cherry
	Checksum: 0xD99990B0
	Offset: 0x14E0
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 407
*/
function electric_cherry_shock_fx()
{
	self endon("death");
	if(isVehicle(self))
	{
		self clientfield::set("tesla_shock_eyes_fx_veh", 1);
		continue;
	}
	self clientfield::set("tesla_shock_eyes_fx", 1);
	self playsound("zmb_elec_jib_zombie");
	self waittill("stun_fx_end");
	if(isVehicle(self))
	{
		self clientfield::set("tesla_shock_eyes_fx_veh", 0);
		continue;
	}
	self clientfield::set("tesla_shock_eyes_fx", 0);
}

/*
	Name: electric_cherry_stun
	Namespace: zm_perk_electric_cherry
	Checksum: 0x73D6E467
	Offset: 0x15D8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 436
*/
function electric_cherry_stun()
{
	self endon("death");
	self notify("stun_zombie");
	self endon("stun_zombie");
	if(self.health <= 0)
	{
		return;
	}
	if(self.ai_state !== "zombie_think")
	{
		return;
	}
	self.zombie_tesla_hit = 1;
	self namespace_b8afaefc::function_8d8398be();
	wait(4);
	if(isdefined(self))
	{
		self.zombie_tesla_hit = 0;
		self namespace_b8afaefc::function_c73660a6();
		self notify("stun_fx_end");
	}
}

/*
	Name: function_99423256
	Namespace: zm_perk_electric_cherry
	Checksum: 0x3FFF1BF6
	Offset: 0x1698
	Size: 0x4F0
	Parameters: 0
	Flags: None
	Line Number: 470
*/
function function_99423256()
{
	self endon("death");
	self endon("disconnect");
	self endon("hash_aa1c359c");
	self.var_3ef1e906 = [];
	self.var_94f190aa = 0;
	while(1)
	{
		self waittill("reload_start");
		var_1bcd223d = self GetCurrentWeapon();
		if(IsInArray(self.var_3ef1e906, var_1bcd223d))
		{
			continue;
		}
		self.var_3ef1e906[self.var_3ef1e906.size] = var_1bcd223d;
		self.var_94f190aa++;
		n_clip_current = self GetWeaponAmmoClip(var_1bcd223d);
		n_clip_max = var_1bcd223d.clipSize;
		var_e6027b22 = n_clip_current / n_clip_max;
		var_8dfb5a99 = math::linear_map(var_e6027b22, 1, 0, 32, 128);
		var_f7d18f35 = math::linear_map(var_e6027b22, 1, 0, 1, 1045);
		self thread function_d7cfc803(var_1bcd223d);
		if(isdefined(self))
		{
			switch(self.var_94f190aa)
			{
				case 0:
				case 1:
				{
					n_zombie_limit = undefined;
					break;
				}
				case 2:
				{
					n_zombie_limit = 8;
					break;
				}
				case 3:
				{
					n_zombie_limit = 4;
					break;
				}
				case 4:
				{
					n_zombie_limit = 2;
					break;
				}
				default
				{
					n_zombie_limit = 0;
				}
			}
			self thread electric_cherry_cooldown_timer(var_1bcd223d);
			if(isdefined(n_zombie_limit) && n_zombie_limit == 0)
			{
				continue;
			}
			self thread electric_cherry_reload_fx();
			self playsound("zmb_cherry_explode");
			a_zombies = zombie_utility::get_round_enemy_array();
			a_zombies = util::get_array_of_closest(self.origin, a_zombies, undefined, undefined, var_8dfb5a99);
			n_zombies_hit = 0;
			for(i = 0; i < a_zombies.size; i++)
			{
				if(isalive(self) && isalive(a_zombies[i]))
				{
					if(isdefined(n_zombie_limit))
					{
						if(n_zombies_hit < n_zombie_limit)
						{
							n_zombies_hit++;
							continue;
							break;
						}
					}
					if(a_zombies[i].health <= var_f7d18f35)
					{
						if(!(isdefined(a_zombies[i].var_7b671d44) && a_zombies[i].var_7b671d44))
						{
							a_zombies[i] thread electric_cherry_death_fx();
						}
						self zm_score::add_to_player_score(40);
					}
					else if(!(isdefined(a_zombies[i].var_26a62392) && a_zombies[i].var_26a62392))
					{
						a_zombies[i] thread electric_cherry_stun();
					}
					if(!(isdefined(a_zombies[i].var_7b671d44) && a_zombies[i].var_7b671d44))
					{
						a_zombies[i] thread electric_cherry_shock_fx();
					}
					wait(0.05);
					if(isdefined(a_zombies[i]) && isalive(a_zombies[i]))
					{
						a_zombies[i] DoDamage(var_f7d18f35, self.origin, self, self, "none");
					}
				}
			}
		}
	}
}

/*
	Name: electric_cherry_cooldown_timer
	Namespace: zm_perk_electric_cherry
	Checksum: 0xA42D9766
	Offset: 0x1B90
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 583
*/
function electric_cherry_cooldown_timer(var_1bcd223d)
{
	self notify("electric_cherry_cooldown_started");
	self endon("electric_cherry_cooldown_started");
	self endon("death");
	self endon("disconnect");
	var_5c406c41 = var_1bcd223d.reloadTime;
	if(self hasPerk("specialty_fastreload"))
	{
		var_5c406c41 = var_5c406c41 * 0.5;
	}
	var_895ac375 = var_5c406c41 + 3;
	wait(var_895ac375);
	self.var_94f190aa = 0;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d7cfc803
	Namespace: zm_perk_electric_cherry
	Checksum: 0xC69FED7D
	Offset: 0x1C50
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 611
*/
function function_d7cfc803(w_weapon)
{
	self endon("death");
	self endon("disconnect");
	self endon("player_lost_weapon_" + w_weapon.name);
	self thread function_1432efd5(w_weapon);
	while(1)
	{
		self waittill("reload");
		var_1bcd223d = self GetCurrentWeapon();
		if(var_1bcd223d == w_weapon)
		{
			ArrayRemoveValue(self.var_3ef1e906, w_weapon);
			self notify("weapon_reload_complete_" + w_weapon.name);
			break;
		}
	}
}

/*
	Name: function_1432efd5
	Namespace: zm_perk_electric_cherry
	Checksum: 0xFA419A71
	Offset: 0x1D30
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 640
*/
function function_1432efd5(w_weapon)
{
	self endon("death");
	self endon("disconnect");
	self endon("weapon_reload_complete_" + w_weapon.name);
	while(1)
	{
		self waittill("weapon_change");
		var_6c6831af = self getweaponslistprimaries();
		if(!IsInArray(var_6c6831af, w_weapon))
		{
			self notify("player_lost_weapon_" + w_weapon.name);
			ArrayRemoveValue(self.var_3ef1e906, w_weapon);
			break;
		}
	}
	return;
}

/*
	Name: electric_cherry_reload_fx
	Namespace: zm_perk_electric_cherry
	Checksum: 0x7B341DC0
	Offset: 0x1E08
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 669
*/
function electric_cherry_reload_fx()
{
	self clientfield::set("electric_cherry_reload_fx", 1);
	wait(1);
	self clientfield::set("electric_cherry_reload_fx", 0);
}

/*
	Name: electric_cherry_perk_lost
	Namespace: zm_perk_electric_cherry
	Checksum: 0x44ADF503
	Offset: 0x1E60
	Size: 0x3C
	Parameters: 3
	Flags: None
	Line Number: 686
*/
function electric_cherry_perk_lost(b_pause, str_perk, str_result)
{
	self function_d092f435(b_pause, str_perk, str_result);
}

