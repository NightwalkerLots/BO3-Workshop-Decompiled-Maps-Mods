#include scripts\shared\aat_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_sub;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_543ce08f;

/*
	Name: __init__sytem__
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x798
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 29
*/
function autoexec __init__sytem__()
{
	system::register("zm_zcmachine", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x7D8
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	zm_powerups::register_powerup("buy_me_a_drink", &function_dd526958);
	zm_powerups::add_zombie_powerup("buy_me_a_drink", "zombie_pickup_perk_bottle", &"ZOMBIE_POWERUP_MAX_AMMO", &zm_powerups::func_should_never_drop, 1, 0, 0);
	level.zombie_powerups["buy_me_a_drink"].can_pick_up_in_last_stand = 0;
	if(level.script != "zm_sumpf")
	{
		thread function_341fcc60();
	}
	if(GetDvarString("aaeoption_zcperk") != "1")
	{
		function_895b40d();
	}
}

/*
	Name: function_895b40d
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x8D0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function function_895b40d()
{
	function_8ec865b4();
	function_afe2b793();
	function_d931cc31();
	function_c1157f62();
	if(level.script == "zm_prototype")
	{
		function_188cd40a();
	}
	if(level.script == "zm_tomb")
	{
		level thread function_96f00e61();
	}
	function_92e02725();
}

/*
	Name: function_96f00e61
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x980
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 96
*/
function function_96f00e61()
{
	level flag::wait_till("capture_zones_init_done");
	register_perk_machine_for_zone("generator_church", "deadshot", "specialty_deadshot");
	register_perk_machine_for_zone("generator_tank_trench", "widows_wine", "specialty_widowswine");
	register_perk_machine_for_zone("generator_mid_trench", "doubletap", "specialty_doubletap2");
}

/*
	Name: register_perk_machine_for_zone
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0xA28
	Size: 0x120
	Parameters: 4
	Flags: None
	Line Number: 114
*/
function register_perk_machine_for_zone(str_zone_name, str_perk_name, str_machine_targetname, func_perk_fx_think)
{
	if(!isdefined(level.zone_capture.zones[str_zone_name].perk_machines))
	{
		level.zone_capture.zones[str_zone_name].perk_machines = [];
	}
	if(!isdefined(level.zone_capture.zones[str_zone_name].perk_machines[str_perk_name]))
	{
		e_perk_machine_trigger = get_perk_machine_trigger_from_vending_entity(str_machine_targetname);
		e_perk_machine_trigger.str_zone_name = str_zone_name;
		level.zone_capture.zones[str_zone_name].perk_machines[str_perk_name] = e_perk_machine_trigger;
	}
	level.zone_capture.zones[str_zone_name].perk_fx_func = func_perk_fx_think;
}

/*
	Name: get_perk_machine_trigger_from_vending_entity
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0xB50
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 139
*/
function get_perk_machine_trigger_from_vending_entity(str_vending_machine_targetname)
{
	e_trigger = GetEnt(str_vending_machine_targetname, "script_noteworthy");
	e_trigger setHintString(&"ZM_TOMB_ZC");
	return e_trigger;
}

/*
	Name: function_92e02725
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0xBB0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 156
*/
function function_92e02725()
{
	if(level.script == "zm_prototype")
	{
		level thread function_1dffd5fa((-173.187, 536.073, 189), VectorScale((0, 1, 0), 270));
	}
	else if(level.script == "zm_asylum")
	{
		level thread function_1dffd5fa((-974.254, 232.587, 275.803), VectorScale((0, 1, 0), 270));
	}
	else if(level.script == "zm_sumpf")
	{
		level thread function_1dffd5fa((11416.9, 3540.72, -608.421), VectorScale((0, 1, 0), 270));
	}
	else if(level.script == "zm_farm_hd")
	{
		level thread function_1dffd5fa((-1229.33, -775.628, 380), VectorScale((0, 1, 0), 270));
	}
}

/*
	Name: function_8ec865b4
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0xD00
	Size: 0x300
	Parameters: 0
	Flags: None
	Line Number: 186
*/
function function_8ec865b4()
{
	switch(level.script)
	{
		case "zm_asylum":
		{
			function_8fd06793((1152, -53, 64), VectorScale((0, 1, 0), 270), "specialty_deadshot", "vending_deadshot");
			break;
		}
		case "zm_theater":
		{
			function_8fd06793((-1159.14, 1047.64, 168.128), VectorScale((0, 1, 0), 180), "specialty_deadshot", "vending_deadshot");
			break;
		}
		case "zm_cosmodrome":
		{
			function_8fd06793((304.649, -1326.17, -69), (0, 0, 0), "specialty_deadshot", "vending_deadshot");
			break;
		}
		case "zm_tomb":
		{
			function_8fd06793((1353.86, -3941.19, 310.342), VectorScale((0, 1, 0), 212.036), "specialty_deadshot", "vending_deadshot");
			break;
		}
		case "zm_castle":
		{
			function_8fd06793((612.352, 3256.92, 672.125), VectorScale((0, 1, 0), 180), "specialty_deadshot", "vending_deadshot");
			break;
		}
		case "zm_island":
		{
			function_8fd06793((-1184.73, 2693.81, -347.581), VectorScale((0, 1, 0), 105), "specialty_deadshot", "vending_deadshot");
			break;
		}
		case "zm_stalingrad":
		{
			function_8fd06793((584.641, 3151.36, 170.028), VectorScale((0, 1, 0), 90), "specialty_deadshot", "vending_deadshot");
			break;
		}
		case "zm_genesis":
		{
			function_8fd06793((-2588.26, -6527.34, -1667.21), VectorScale((0, 1, 0), 74.1852), "specialty_deadshot", "vending_deadshot");
			break;
		}
		case "zm_prototype":
		{
			function_c0772486((-120, -330, 60), (90, 180, 0), "specialty_deadshot", "vending_deadshot");
			break;
		}
	}
	return;
}

/*
	Name: function_afe2b793
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x1008
	Size: 0x210
	Parameters: 0
	Flags: None
	Line Number: 249
*/
function function_afe2b793()
{
	switch(level.script)
	{
		case "zm_castle":
		{
			function_8fd06793((4582.47, -3022.01, -2291.88), VectorScale((0, 1, 0), 154.7809), "specialty_widowswine", "vending_widowswine");
			break;
		}
		case "zm_stalingrad":
		{
			function_8fd06793((1721, 3395, -117), (0, 0, 0), "specialty_widowswine", "vending_widowswine");
			break;
		}
		case "zm_asylum":
		{
			function_8fd06793((845.945, 398.821, 224.457), VectorScale((0, -1, 0), 90), "specialty_widowswine", "vending_widowswine");
			break;
		}
		case "zm_theater":
		{
			function_8fd06793((168.359, -410.739, 320.125), VectorScale((0, -1, 0), 90), "specialty_widowswine", "vending_widowswine");
			break;
		}
		case "zm_tomb":
		{
			function_8fd06793((-568.359, 3722.25, -295.875), VectorScale((0, 1, 0), 40), "specialty_widowswine", "vending_widowswine");
			break;
		}
		case "zm_island":
		{
			function_8fd06793((-4853.55, 1800.35, -354.265), VectorScale((0, 1, 0), 200.325), "specialty_widowswine", "vending_widowswine");
			break;
		}
	}
}

/*
	Name: function_d931cc31
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x1220
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 296
*/
function function_d931cc31()
{
	if(level.script == "zm_asylum")
	{
		function_8fd06793((-134, -392, 226), VectorScale((0, 1, 0), 180), "specialty_staminup", "vending_marathon");
	}
	else if(level.script == "zm_theater")
	{
		function_8fd06793((114.474, 1884.36, -15.875), (0, 0, 0), "specialty_staminup", "vending_marathon");
	}
}

/*
	Name: function_c1157f62
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x12D8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 318
*/
function function_c1157f62()
{
	switch(level.script)
	{
		case "zm_tomb":
		{
			function_8fd06793((865.288, 2209.88, -126.721), VectorScale((0, 1, 0), 180), "specialty_doubletap2", "vending_doubletap");
			break;
		}
		case "zm_cosmodrome":
		{
			function_8fd06793((375.551, -1323.58, -66.7021), (0, 0, 0), "specialty_doubletap2", "vending_doubletap");
			break;
		}
	}
}

/*
	Name: function_188cd40a
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x13A0
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 345
*/
function function_188cd40a()
{
	function_8fd06793((966.525, 627.164, 149.498), VectorScale((0, 1, 0), 180), "specialty_widowswine", "vending_widowswine");
	function_8fd06793((166.497, 594.359, 145.125), (0, 0, 0), "specialty_armorvest", "vending_jugg");
	function_8fd06793((1022.86, 962.186, 1.125), VectorScale((0, -1, 0), 90), "specialty_doubletap2", "vending_doubletap");
	function_8fd06793((-91.8799, 1008.76, 1.125), (0, 0, 0), "specialty_fastreload", "vending_sleight");
	function_8fd06793((-150.813, 562.359, 1.125), (0, 0, 0), "specialty_quickrevive", "vending_revive");
	function_8fd06793((135.141, 1075.6, 144.125), VectorScale((0, 1, 0), 90), "specialty_staminup", "vending_marathon");
	return;
	ERROR: Bad function call
}

/*
	Name: function_bfadcf8a
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x1548
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 367
*/
function function_bfadcf8a()
{
	self endon("death");
	level endon("end_game");
	while(1)
	{
		self.targeted = 1;
		self.realorigin = VectorScale((0, 0, -1), 10000);
		wait(0.05);
	}
}

/*
	Name: function_8fd06793
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x15A0
	Size: 0x330
	Parameters: 4
	Flags: None
	Line Number: 389
*/
function function_8fd06793(origin, angles, perk, radiant_machine_name)
{
	t_use = spawn("trigger_radius_use", origin + VectorScale((0, 0, 1), 60), 0, 40, 80);
	t_use.targetname = "zombie_vending";
	t_use.target = radiant_machine_name;
	t_use.script_noteworthy = perk;
	if(level.script == "zm_tomb")
	{
		t_use.is_locked = 1;
		t_use setHintString(&"ZM_TOMB_ZC");
	}
	if(level.script == "zm_genesis")
	{
		t_use.script_int = 3;
	}
	if(level.script == "zm_cosmoddrome")
	{
		t_use thread function_bfadcf8a();
	}
	t_use TriggerIgnoreTeam();
	perk_machine = spawn("script_model", origin);
	perk_machine.targetname = radiant_machine_name;
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	perk_machine.angles = angles;
	bump_trigger = spawn("trigger_radius", origin + VectorScale((0, 0, 1), 20), 0, 40, 80);
	bump_trigger.script_activated = 1;
	bump_trigger.script_sound = "zmb_perks_bump_bottle";
	bump_trigger.targetname = "audio_bump_trigger";
	collision = spawn("script_model", origin, 1);
	collision.angles = angles;
	collision SetModel("zm_collision_perks1");
	collision.script_noteworthy = "clip";
	collision disconnectpaths();
	t_use.clip = collision;
	t_use.machine = perk_machine;
	t_use.bump = bump_trigger;
	[[level._custom_perks[perk].perk_machine_set_kvps]](t_use, perk_machine, bump_trigger, collision);
}

/*
	Name: function_c0772486
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x18D8
	Size: 0x2C0
	Parameters: 4
	Flags: None
	Line Number: 441
*/
function function_c0772486(origin, angles, perk, radiant_machine_name)
{
	t_use = spawn("trigger_radius_use", (-151.763, -297.359, 12.3917) + VectorScale((0, 0, 1), 60), 0, 40, 80);
	t_use.targetname = "zombie_vending";
	t_use.target = radiant_machine_name;
	t_use.script_noteworthy = perk;
	t_use TriggerIgnoreTeam();
	perk_machine = spawn("script_model", origin);
	perk_machine.targetname = radiant_machine_name;
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	perk_machine.angles = angles;
	bump_trigger = spawn("trigger_radius", (-151.763, -297.359, 12.3917) + VectorScale((0, 0, 1), 20), 0, 40, 80);
	bump_trigger.script_activated = 1;
	bump_trigger.script_sound = "zmb_perks_bump_bottle";
	bump_trigger.targetname = "audio_bump_trigger";
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	bump_trigger.angles = angles;
	collision = spawn("script_model", origin, 1);
	collision.angles = angles;
	collision.script_noteworthy = "clip";
	collision disconnectpaths();
	t_use.clip = collision;
	t_use.machine = perk_machine;
	t_use.bump = bump_trigger;
	[[level._custom_perks[perk].perk_machine_set_kvps]](t_use, perk_machine, bump_trigger, collision);
}

/*
	Name: function_341fcc60
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x1BA0
	Size: 0x460
	Parameters: 0
	Flags: None
	Line Number: 484
*/
function function_341fcc60()
{
	level flag::wait_till("start_zombie_round_logic");
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(isdefined(vending_triggers[i].script_noteworthy))
		{
			if(isdefined(vending_triggers[i].machine.model) && vending_triggers[i].script_noteworthy == "specialty_deadshot")
			{
				if(vending_triggers[i].machine.model == "p7_zm_vending_ads")
				{
					level.machine_assets["specialty_deadshot"].off_model = "p7_zm_vending_deadshot";
					level.machine_assets["specialty_deadshot"].on_model = level.machine_assets["specialty_deadshot"].off_model;
					vending_triggers[i].machine SetModel(level.machine_assets["specialty_deadshot"].off_model);
				}
			}
			if(isdefined(level.var_508fe397) && level.script != "zm_prototype")
			{
				vending_triggers[i] thread zm_audio::function_83cf340e();
			}
			else if(vending_triggers[i].script_noteworthy == "specialty_additionalprimaryweapon")
			{
				level.machine_assets["specialty_additionalprimaryweapon"].off_model = "p7_zm_vending_three_gun";
				level.machine_assets["specialty_additionalprimaryweapon"].on_model = level.machine_assets["specialty_additionalprimaryweapon"].off_model;
				vending_triggers[i].machine SetModel(level.machine_assets["specialty_additionalprimaryweapon"].off_model);
			}
		}
		if(isdefined(vending_triggers[i].bump))
		{
			vending_triggers[i] thread function_60d67731(vending_triggers[i].bump);
			vending_triggers[i] thread function_26dac2c3(vending_triggers[i].bump);
			vending_triggers[i] thread function_3ed2f66e(vending_triggers[i].bump);
		}
	}
	if(level.script == "zm_prototype" || level.script == "zm_theater" || level.script == "zm_asylum" || level.script == "zm_cosmodrome" || level.script == "zm_sumpf")
	{
		level._random_perk_machine_perk_list = [];
		a_keys = getArrayKeys(level._custom_perks);
		for(i = 0; i < a_keys.size; i++)
		{
			if(a_keys[i] != "specialty_flakjacket")
			{
				level._random_perk_machine_perk_list[level._random_perk_machine_perk_list.size] = a_keys[i];
			}
		}
	}
	else if(level.script == "zm_prototype")
	{
		level thread zm_audio::function_bdac178a();
	}
}

/*
	Name: function_6ae4bf62
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2008
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 547
*/
function function_6ae4bf62(player)
{
	var_a54e6c45 = 90;
	var_609f16ad = 1;
	if(Distance(player.origin, self.origin) > var_a54e6c45)
	{
		var_609f16ad = 0;
	}
	return var_609f16ad;
}

/*
	Name: function_8459d2ec
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2078
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 568
*/
function function_8459d2ec(player)
{
}

/*
	Name: function_bb3889fe
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2090
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 582
*/
function function_bb3889fe()
{
	vending = [];
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(!vending_triggers[i].machine ishidden())
		{
			vending[vending.size] = vending_triggers[i];
		}
	}
	return vending;
}

/*
	Name: function_26dac2c3
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2148
	Size: 0x198
	Parameters: 2
	Flags: None
	Line Number: 606
*/
function function_26dac2c3(bump, machine)
{
	level endon("game_end");
	self notify("hash_26dac2c3");
	self endon("hash_26dac2c3");
	while(1)
	{
		bump waittill("trigger", player);
		if(player ActionSlotThreeButtonPressed())
		{
			var_aa026ea6 = function_bb3889fe();
			var_e939db87 = ArrayGetClosest(player.origin, var_aa026ea6);
			if(GetPlayers().size != 1 && isdefined(var_e939db87.power_on) && var_e939db87.power_on)
			{
				var_e939db87 function_489a8259(player, var_e939db87.machine);
			}
			else
			{
				player playlocalsound("zmb_no_cha_ching");
			}
			while(player ActionSlotThreeButtonPressed())
			{
				wait(0.05);
			}
			if(isdefined(var_e939db87))
			{
				var_e939db87 = undefined;
			}
		}
	}
}

/*
	Name: function_489a8259
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x22E8
	Size: 0x230
	Parameters: 2
	Flags: None
	Line Number: 648
*/
function function_489a8259(player, machine)
{
	player notify("hash_489a8259");
	wait(0.05);
	player notify("hash_489a8259");
	player endon("hash_489a8259");
	if(player.score >= self.cost || player bgb::is_enabled("zm_bgb_shopping_free"))
	{
		if(isdefined(machine.origin) && isdefined(machine.angles))
		{
			origin = machine.origin + AnglesToRight(machine.angles) * 100;
			origin = (origin[0], origin[1], player.origin[2]);
		}
		if(isdefined(origin))
		{
			level.zombie_powerups["buy_me_a_drink"].model_name = level._custom_perks[self.script_noteworthy].perk_bottle_weapon.worldmodel;
			powerup = level zm_powerups::specific_powerup_drop("buy_me_a_drink", origin, undefined, undefined, 0.1, undefined, 1);
			powerup.perk = self.script_noteworthy;
			player zm_score::minus_to_player_score(self.cost);
			if(player bgb::is_enabled("zm_bgb_shopping_free"))
			{
				powerup.free = 1;
				return;
			}
		}
	}
	player playlocalsound("zmb_no_cha_ching");
	return;
	powerup.var_0 = undefined;
}

/*
	Name: check_player_has_perk
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2520
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 689
*/
function check_player_has_perk(perk)
{
	if(isdefined(self.perks_active))
	{
		foreach(var_a145bb69 in self.perks_active)
		{
			if(var_a145bb69 == perk)
			{
				return 1;
			}
		}
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dd526958
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x25C8
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 715
*/
function function_dd526958(player)
{
	if(isdefined(self.perk))
	{
		if(player check_player_has_perk(self.perk))
		{
			if(isdefined(self.free) && self.free)
			{
				player zm_score::add_to_player_score(10);
			}
			else
			{
				cost = level.zombie_vars["zombie_perk_cost"];
				if(isdefined(level._custom_perks[self.perk]) && isdefined(level._custom_perks[self.perk].cost))
				{
					if(IsInt(level._custom_perks[self.perk].cost))
					{
						cost = level._custom_perks[self.perk].cost;
					}
					else
					{
						cost = [[level._custom_perks[self.perk].cost]]();
					}
				}
				player zm_score::add_to_player_score(cost);
			}
		}
		else
		{
			player zm_perks::give_perk(self.perk, 1);
		}
	}
}

/*
	Name: function_60d67731
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2758
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 759
*/
function function_60d67731(bump)
{
	level endon("game_end");
	self notify("hash_bb0f854b");
	self endon("hash_bb0f854b");
	while(1)
	{
		bump waittill("trigger", player);
		if(player IsMeleeing() && player useButtonPressed() && !self.machine ishidden())
		{
			if(perk_hack_qualifier(player))
			{
				self thread function_357b5bf5(player);
			}
		}
		while(player IsMeleeing())
		{
			wait(0.05);
		}
	}
}

/*
	Name: function_3ed2f66e
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2858
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 791
*/
function function_3ed2f66e(bump)
{
	level endon("game_end");
	self notify("hash_ae3d0d7f");
	self endon("hash_ae3d0d7f");
	while(1)
	{
		bump waittill("trigger", player);
		if(player istouching(bump) && player hasPerk(self.script_noteworthy) && !isdefined(player.var_6dd52088))
		{
			player thread function_1da0f311();
			player.var_6dd52088 = 1;
		}
		wait(0.05);
	}
}

/*
	Name: function_1da0f311
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2940
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 818
*/
function function_1da0f311()
{
	self thread zm_equipment::show_hint_text(&"ELMG_REMOVEPERK_HINT", 8);
	if(GetPlayers().size != 1)
	{
		wait(3.2);
		self thread zm_equipment::show_hint_text(&"AAEP_BUY_DRINK", 8);
	}
}

/*
	Name: perk_hack_qualifier
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x29B8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 838
*/
function perk_hack_qualifier(player)
{
	if(self.power_on == 0)
	{
		return 0;
	}
	if(isdefined(self.script_noteworthy) && self.power_on == 1)
	{
		if(player hasPerk(self.script_noteworthy))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_357b5bf5
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2A28
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 864
*/
function function_357b5bf5(player)
{
	if(level flag::get("solo_game") && self.script_noteworthy == "specialty_quickrevive")
	{
		player.lives--;
	}
	player notify(self.script_noteworthy + "_stop");
	if(!player bgb::is_enabled("zm_bgb_shopping_free"))
	{
		player zm_score::add_to_player_score(100);
	}
	zm_utility::play_sound_at_pos("purchase", player.origin);
	return;
}

/*
	Name: function_e960da28
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2B08
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 889
*/
function function_e960da28()
{
	level endon("game_end");
	while(1)
	{
		foreach(player in GetPlayers())
		{
			if(isdefined(self.var_a7565b64) && self.var_a7565b64 == 1)
			{
				self function_cb2c15eb(player, &"AAE_PAP_BUSY");
				continue;
			}
			weapon = player GetCurrentWeapon();
			if(player zm_weapons::can_upgrade_weapon(weapon))
			{
				self function_cb2c15eb(player, &"ZOMBIE_PERK_PACKAPUNCH", 5000);
				continue;
			}
			if(zm_weapons::is_weapon_upgraded(weapon))
			{
				self function_cb2c15eb(player, &"ZOMBIE_PERK_PACKAPUNCH_AAT", 2500);
				continue;
			}
			self function_cb2c15eb(player, "");
		}
		wait(0.05);
	}
}

/*
	Name: function_ed2a9481
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2CC0
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 928
*/
function function_ed2a9481()
{
	level endon("game_end");
	while(isdefined(self))
	{
		waittime = RandomFloatRange(2.5, 5);
		yaw = RandomInt(360);
		if(yaw > 300)
		{
			yaw = 300;
		}
		else if(yaw < 60)
		{
			yaw = 60;
		}
		yaw = self.angles[1] + yaw;
		new_angles = (-60 + RandomInt(120), yaw, -45 + RandomInt(90));
		self RotateTo(new_angles, waittime, waittime * 0.5, waittime * 0.5);
		wait(RandomFloat(waittime - 0.1));
	}
}

/*
	Name: function_b2fe474a
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2E18
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 960
*/
function function_b2fe474a(origin)
{
	model = spawn("script_model", origin);
	if(GetDvarString("aae_lite") == "")
	{
		model SetModel("free_packapunch");
	}
	else
	{
		model SetModel("tag_origin");
	}
	model clientfield::set("bank_keyline", 1);
	model thread function_ed2a9481();
	return model;
}

/*
	Name: function_ff620ca6
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2EF8
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 986
*/
function function_ff620ca6(player)
{
	if(player hasweapon(GetWeapon("cymbal_monkey")))
	{
		if(player bgb::is_enabled("zm_bgb_shopping_free") || player.score >= 5000)
		{
			return player istouching(self);
		}
	}
	return 0;
}

/*
	Name: function_a2439815
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2F88
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1008
*/
function function_a2439815()
{
	self.bump_trigger = spawn("trigger_radius", self.origin, 0, 40, 75);
	self.bump_trigger thread function_863854f9();
	return;
}

/*
	Name: function_88c8c2bb
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x2FE0
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 1025
*/
function function_88c8c2bb(player)
{
	self notify("hash_bc7220d7");
	self endon("hash_bc7220d7");
	player endon("disconnect");
	level endon("end_game");
	while(self function_ff620ca6(player))
	{
		wait(0.05);
	}
	player IPrintLnBold("Pack-a-Punck not accepting ", &"ZOMBIE_CYMBAL_MONKEY", " now");
	player.var_7011e588 = undefined;
}

/*
	Name: function_863854f9
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x3090
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1049
*/
function function_863854f9()
{
	level endon("game_end");
	self notify("hash_863854f9");
	self endon("hash_863854f9");
	while(1)
	{
		self waittill("trigger", player);
		if(player IsMeleeing() && self function_ff620ca6(player))
		{
			player.var_7011e588 = 1;
			if(isdefined(level.var_87e1799c))
			{
				level.var_87e1799c notify("trigger", player);
				wait(0.05);
			}
			player.var_7011e588 = undefined;
			while(player IsMeleeing() && isdefined(player))
			{
				wait(0.05);
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_1dffd5fa
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x3198
	Size: 0xAB0
	Parameters: 2
	Flags: None
	Line Number: 1085
*/
function function_1dffd5fa(origin, angles)
{
	level flag::wait_till("initial_blackscreen_passed");
	trigger = spawn("trigger_radius_use", origin, 0, 20, 20);
	trigger UseTriggerRequireLookAt();
	trigger.targetname = "elmg_ug";
	trigger TriggerIgnoreTeam();
	trigger.model = function_b2fe474a(origin);
	trigger setcursorhint("HINT_NOICON");
	trigger setHintString(&"ZOMBIE_PERK_PACKAPUNCH", 5000);
	trigger thread function_a2439815();
	trigger thread function_e960da28();
	level.var_87e1799c = trigger;
	while(1)
	{
		trigger waittill("trigger", User);
		weapon = User GetCurrentWeapon();
		if(!User laststand::player_is_in_laststand() || !isdefined(User.reviveTrigger) || User.laststand != 1 && User istouching(trigger) && zm_utility::is_player_valid(User) && !User.IS_DRINKING > 0 && !zm_utility::is_placeable_mine(weapon) && !zm_equipment::is_equipment(weapon) && (!User zm_utility::is_player_revive_tool(weapon) || weapon.name != "syrette_quick") && !weapon.isHeroWeapon && !weapon.isgadget)
		{
			if(User function_ec31f87e("monkey", GetWeapon("cymbal_monkey")) && isdefined(User.var_7011e588) && trigger.bump_trigger function_ff620ca6(User))
			{
				trigger.var_a7565b64 = 1;
				User thread zm_score::minus_to_player_score(5000);
				User zm_utility::increment_is_drinking();
				User zm_utility::disable_player_move_states(1);
				User GiveWeapon(GetWeapon("zombie_builder"));
				User SwitchToWeapon(GetWeapon("zombie_builder"));
				User util::waittill_any("fake_death", "death", "player_downed", "weapon_change_complete");
				User notify("pap_taken");
				User zm_utility::enable_player_move_states();
				User zm_utility::decrement_is_drinking();
				User TakeWeapon(GetWeapon("zombie_builder"));
				var_4b94f3c1 = zm_weapons::get_upgrade_weapon(GetWeapon("cymbal_monkey"));
				var_220646a4 = User zm_weapons::weapon_give(var_4b94f3c1, undefined, undefined, 1, undefined);
				baseWeapon = zm_weapons::get_base_weapon(var_220646a4);
				if(isdefined(var_220646a4.displayName))
				{
					var_de745693 = MakeLocalizedString(var_220646a4.displayName);
				}
				else
				{
					var_de745693 = var_220646a4.name;
				}
				if(isdefined(baseWeapon.displayName))
				{
					var_e2dc2ac5 = MakeLocalizedString(baseWeapon.displayName);
				}
				else
				{
					var_e2dc2ac5 = baseWeapon.name;
				}
				trigger.var_a7565b64 = 0;
			}
			else if(User function_ec31f87e("pap", weapon))
			{
				trigger.var_a7565b64 = 1;
				User thread zm_score::minus_to_player_score(5000);
				User zm_utility::increment_is_drinking();
				User zm_utility::disable_player_move_states(1);
				User GiveWeapon(GetWeapon("zombie_builder"));
				User SwitchToWeapon(GetWeapon("zombie_builder"));
				User util::waittill_any("fake_death", "death", "player_downed", "weapon_change_complete");
				User notify("pap_taken");
				User zm_utility::enable_player_move_states();
				User zm_utility::decrement_is_drinking();
				User TakeWeapon(weapon);
				User TakeWeapon(GetWeapon("zombie_builder"));
				var_4b94f3c1 = zm_weapons::get_upgrade_weapon(weapon);
				var_220646a4 = User zm_weapons::give_build_kit_weapon(var_4b94f3c1);
				User setSpawnWeapon(var_220646a4);
				baseWeapon = zm_weapons::get_base_weapon(var_220646a4);
				if(isdefined(var_220646a4.displayName))
				{
					var_de745693 = MakeLocalizedString(var_220646a4.displayName);
				}
				else
				{
					var_de745693 = var_220646a4.name;
				}
				if(isdefined(baseWeapon.displayName))
				{
					var_e2dc2ac5 = MakeLocalizedString(baseWeapon.displayName);
				}
				else
				{
					var_e2dc2ac5 = baseWeapon.name;
				}
				trigger.var_a7565b64 = 0;
			}
			else if(User function_ec31f87e("aat", weapon))
			{
				trigger.var_a7565b64 = 1;
				User thread zm_score::minus_to_player_score(2500);
				User zm_utility::increment_is_drinking();
				User zm_utility::disable_player_move_states(1);
				User GiveWeapon(GetWeapon("zombie_builder"));
				User SwitchToWeapon(GetWeapon("zombie_builder"));
				User util::waittill_any("fake_death", "death", "player_downed", "weapon_change_complete");
				User notify("pap_taken");
				User zm_utility::enable_player_move_states();
				User zm_utility::decrement_is_drinking();
				User TakeWeapon(GetWeapon("zombie_builder"));
				User AAT::acquire(weapon);
				User setSpawnWeapon(weapon);
				baseWeapon = zm_weapons::get_base_weapon(weapon);
				if(isdefined(weapon.displayName))
				{
					var_de745693 = weapon.displayName;
				}
				else
				{
					var_de745693 = weapon.name;
				}
				if(isdefined(baseWeapon.displayName))
				{
					var_e2dc2ac5 = baseWeapon.displayName;
				}
				else
				{
					var_e2dc2ac5 = baseWeapon.name;
				}
				trigger.var_a7565b64 = 0;
			}
		}
	}
}

/*
	Name: function_97da320a
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x3C50
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 1222
*/
function function_97da320a(weapon)
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ec31f87e
	Namespace: namespace_543ce08f
	Checksum: 0x424F4353
	Offset: 0x3C68
	Size: 0x16A
	Parameters: 2
	Flags: None
	Line Number: 1238
*/
function function_ec31f87e(event, weapon)
{
	result = 0;
	switch(event)
	{
		case "monkey":
		{
			if(self.score >= 5000 || self bgb::is_enabled("zm_bgb_shopping_free"))
			{
				if(self zm_weapons::can_upgrade_weapon(weapon))
				{
					result = 1;
				}
			}
			return result;
			break;
		}
		case "pap":
		{
			if(self.score >= 5000 || self bgb::is_enabled("zm_bgb_shopping_free"))
			{
				if(self zm_weapons::can_upgrade_weapon(weapon))
				{
					result = 1;
				}
			}
			return result;
			break;
		}
		case "aat":
		{
			if(self.score >= 2500 || self bgb::is_enabled("zm_bgb_shopping_free"))
			{
				if(self zm_weapons::is_weapon_upgraded(weapon))
				{
					result = 1;
				}
			}
			return result;
			break;
		}
	}
}

